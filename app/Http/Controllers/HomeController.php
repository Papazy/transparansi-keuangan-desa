<?php

namespace App\Http\Controllers;

use App\Http\Middleware\ShareDesa;
use App\Models\Desa;
use App\Models\PenganggaranBelanja;
use App\Models\PenganggaranPembiayaanBelanja;
use App\Models\PenganggaranPembiayaanPendapatan;
use App\Models\PenganggaranPendapatan;
use App\Models\PenganggaranTahun;
use App\Models\RekeningObjek;
use App\Services\PenganggaranBelanjaServices;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Date;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\View;
// use View;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    protected $desa;
    public function __construct()
    {
        $this->desa = session('desa', null);
        // memakai middleware untuk share data ke semua view

        $this->middleware(ShareDesa::class);

        View::share('desa', $this->desa);
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index(Request $request)
    {
        $user = auth()->user();
        $desa = null;
        $daerah = null;
        
        if ($request->desa) {
            $desa = Desa::where('id', $request->desa)->first();
            
            // Query untuk data daerah
            $daerah = DB::table('desa')
                ->leftJoin('kecamatan', 'desa.id_kecamatan', '=', 'kecamatan.id')
                ->leftJoin('kabupaten', 'kecamatan.id_kabupaten', '=', 'kabupaten.id')
                ->leftJoin('provinsi', 'kabupaten.id_provinsi', '=', 'provinsi.id')
                ->where('desa.id', $request->desa)
                ->select(
                    'desa.*',
                    'kecamatan.nama as kecamatan_nama',
                    'kabupaten.nama as kabupaten_nama',
                    'provinsi.nama as provinsi_nama'
                )
                ->first();
    
            session(['desa' => $desa->id]);
        }
    
        // Inisialisasi variabel data
        $data = (object)[
            "totalPaguAnggaran" => 0,
            "totalRealisasi" => 0,
            "persentaseRealisasi" => 0,
            "pendapatanDesa" => [],
            "totalAnggaranRealiasiPerTahun" => []
        ];
    
        if ($desa) {
            // 1. Data Pendapatan Desa
            $pendapatanDesa = DB::table('penganggaran_pendapatan')
                ->join('sumber_dana', 'penganggaran_pendapatan.id_sumber_dana', '=', 'sumber_dana.id')
                ->join('penganggaran_tahun', 'penganggaran_pendapatan.id_penganggaran_tahun', '=', 'penganggaran_tahun.id')
                ->where('penganggaran_tahun.id_desa', $desa->id)
                ->select(
                    'sumber_dana.nama as sumber_pendapatan',
                    DB::raw('SUM(penganggaran_pendapatan.volume * penganggaran_pendapatan.harga_satuan) as anggaran'),
                    DB::raw('0 as realisasi') // Ganti dengan query realisasi jika ada data
                )
                ->groupBy('sumber_dana.nama')
                ->get();
    
            // 2. Total Pagu Anggaran dan Realisasi
            $totalPaguAnggaran = $pendapatanDesa->sum('anggaran');
            $totalRealisasi = $pendapatanDesa->sum('realisasi');
            $persentaseRealisasi = $totalPaguAnggaran > 0 ? ($totalRealisasi / $totalPaguAnggaran) * 100 : 0;
    
            // 3. Data Tahun ke Tahun
            $tahunList = DB::table('penganggaran_tahun')
                ->where('id_desa', $desa->id)
                ->pluck('tahun');
    
            $totalAnggaranRealiasiPerTahun = collect();
            foreach ($tahunList as $tahun) {
                $anggaran = DB::table('penganggaran_pendapatan')
                    ->join('penganggaran_tahun', 'penganggaran_pendapatan.id_penganggaran_tahun', '=', 'penganggaran_tahun.id')
                    ->where('penganggaran_tahun.tahun', $tahun)
                    ->where('penganggaran_tahun.id_desa', $desa->id)
                    ->sum(DB::raw('volume * harga_satuan'));
    
                $totalAnggaranRealiasiPerTahun->push((object)[
                    "tahun" => $tahun,
                    "total_anggaran" => $anggaran,
                    "total_realisasi" => 0 // Ganti dengan query realisasi jika ada data
                ]);
            }
    
            $data = (object)[
                "totalPaguAnggaran" => $totalPaguAnggaran,
                "totalRealisasi" => $totalRealisasi,
                "persentaseRealisasi" => $persentaseRealisasi,
                "pendapatanDesa" => $pendapatanDesa,
                "totalAnggaranRealiasiPerTahun" => $totalAnggaranRealiasiPerTahun
            ];
        }
    
        $listDesa = Desa::all();

        $totalUangPerTahun = DB::table('penganggaran_tahun as pt')
        ->join('penganggaran_bidang as pb', 'pt.id', '=', 'pb.id_penganggaran_tahun')
        ->join('penganggaran_sub_bidang as psb', 'pb.id', '=', 'psb.id_penganggaran_bidang')
        ->join('penganggaran_kegiatan as pgk', 'psb.id', '=', 'pgk.id_penganggaran_sub_bidang')
        ->join('penganggaran_paket_kegiatan as pk', 'pgk.id', '=', 'pk.id_penganggaran_kegiatan')
        ->select(
            'pt.tahun',
            DB::raw('SUM(pgk.pagu) as total_uang')
        )
        ->where('pt.id_desa', $request->desa)
        ->groupBy('pt.tahun')
        ->orderBy('pt.tahun')
        ->get();

        $totalUang = 0;
        foreach ($totalUangPerTahun as $item) {
            $totalUang += $item->total_uang;
        }
        // dd($totalUangPerTahun);

        
        
        if ($user) {
            return view('dashboard', compact('data', 'desa', 'daerah'));
        }

        $tahunAll = PenganggaranTahun::where('id_desa',$request->desa)->pluck('tahun')->sortDesc();
        $tahunCount = $tahunAll->count();

        $dataKegiatanAll = DB::table('penganggaran_bidang as pb')
        ->join('penganggaran_sub_bidang as psb', 'pb.id', '=', 'psb.id_penganggaran_bidang')
        ->join('penganggaran_kegiatan as pgk', 'psb.id', '=', 'pgk.id_penganggaran_sub_bidang')
        ->join('penganggaran_paket_kegiatan as pk', 'pgk.id', '=', 'pk.id_penganggaran_kegiatan')
        ->join('bidang as b', 'pb.id_bidang', '=', 'b.id')
        ->join('sub_bidang as sb', 'psb.id_sub_bidang', '=', 'sb.id')
        ->join('kegiatan as k', 'pgk.id_kegiatan', '=', 'k.id')
        ->join('penganggaran_tahun as pt', 'pb.id_penganggaran_tahun', '=', 'pt.id')
        ->select(
            'b.kode as kode_bidang',
            'b.nama as nama_bidang',
            'sb.kode as kode_sub_bidang',
            'sb.nama as nama_sub_bidang',
            'k.kode as kode_kegiatan',
            'k.nama as nama_kegiatan',
            'pk.id as kode_paket',
            'pk.nama_paket as nama_paket',
            'pgk.pagu as jumlah_uang'
        )
        ->where('pt.id_desa', $request->desa)
        ->orderBy('b.kode')
        ->orderBy('sb.kode')
        ->orderBy('k.kode')
        ->orderBy('pk.id')
        ->get();

        $kegiatanCount = $dataKegiatanAll->count();

        // dd($kegiatan);
    
        return view('home', compact('data', 'desa', 'listDesa', 'daerah', 'tahunAll', 'tahunCount', 'kegiatanCount', 'totalUang'));
    }

    public function pilihDesa(Request $request)
    {
        $desa = Desa::find($request->desa);
        return redirect()->route('home', ['desa' => $desa->id]);
    }

    public function anggaranPendapatan(Request $request)
    {
        $tahunSelected = Date('Y');

        if ($request->tahun) {
            $tahunSelected = request()->tahun;
        }
        // dd($this->desa);
        $tahunAnggaran = PenganggaranTahun::where('tahun', $tahunSelected)->where('id_desa', $request->desa)->first();
        $data = PenganggaranPendapatan::selectRaw('id_rekening_objek, SUM(harga_satuan * volume) AS harga_satuan')->where(['id_penganggaran_tahun' => $tahunAnggaran->id])->groupBy('id_rekening_objek')->with(['rekening_objek'])->get();


        $tahunAll = PenganggaranTahun::where('id_desa',$request->desa)->pluck('tahun')->sortDesc();

        return view('guest.anggaran.pendapatan', [
            'data' => $data,
            'tahunAll' => $tahunAll,
            'tahunSelected' => $tahunSelected,
        ]);
    }

    public function detailAnggaranPendapatan($tahun, $rekeningObjek)
    {
        $tahunAnggaran = PenganggaranTahun::where('tahun', $tahun)->first();
        $rekeningObjek = RekeningObjek::find($rekeningObjek);
        $dataDetail = PenganggaranPendapatan::selectRaw('id_rekening_objek, SUM(harga_satuan * volume) AS total')->where(['id_penganggaran_tahun' => $tahunAnggaran->id, 'id_rekening_objek' => $rekeningObjek->id])->groupBy('id_rekening_objek')->with(['rekening_objek'])->get();

        $formattedDataDetail = [];

        foreach ($dataDetail as $detail) {
            $formattedDataDetail[] = [
                'kode_rekening' => $detail->rekening_objek->full_code,
                'uraian' => $detail->rekening_objek->nama,
                'jumlah' => (int) str_replace(',', '', $detail->total),
                'tipe' => 'sub',
                'keterangan' => 'Detail Anggaran',
            ];
        }

        return view('guest.anggaran.detailPendapatan', [
            'tahunAnggaran' => $tahunAnggaran,
            'rekeningObjek' => $rekeningObjek,
            'dataDetail' => $formattedDataDetail,
        ]);
    }

    public function anggaranBelanja(Request $request)
    {
        $tahunSelected = Date('Y');

        if ($request->tahun) {
            $tahunSelected = request()->tahun;
        }
        $tahunAnggaran = PenganggaranTahun::where('tahun', $tahunSelected)->where('id_desa', $request->desa)->first();
        $data = PenganggaranBelanja::selectRaw('id_rekening_objek, SUM(harga_satuan * volume) AS harga_satuan')->where(['id_penganggaran_tahun' => $tahunAnggaran->id])->groupBy('id_rekening_objek')->with(['rekening_objek'])->get();


        $tahunAll = PenganggaranTahun::where('id_desa',$request->desa)->pluck('tahun')->sortDesc();

        return view('guest.anggaran.belanja', [
            'data' => $data,
            'tahunAll' => $tahunAll,
            'tahunSelected' => $tahunSelected,
        ]);
    }

    public function detailanggaranBelanja($tahun, $rekeningObjek)
    {
        $tahunAnggaran = PenganggaranTahun::where('tahun', $tahun)->first();
        $rekeningObjek = RekeningObjek::find($rekeningObjek);
        $dataDetail = PenganggaranBelanja::selectRaw('id_rekening_objek, SUM(harga_satuan * volume) AS total')->where(['id_penganggaran_tahun' => $tahunAnggaran->id, 'id_rekening_objek' => $rekeningObjek->id])->groupBy('id_rekening_objek')->with(['rekening_objek'])->get();

        $formattedDataDetail = [];

        foreach ($dataDetail as $detail) {
            $formattedDataDetail[] = [
                'kode_rekening' => $detail->rekening_objek->full_code,
                'uraian' => $detail->rekening_objek->nama,
                'jumlah' => (int) str_replace(',', '', $detail->total),
                'tipe' => 'sub',
                'keterangan' => 'Detail Anggaran',
            ];
        }

        return view('guest.anggaran.detail', [
            'tahunAnggaran' => $tahunAnggaran,
            'rekeningObjek' => $rekeningObjek,
            'dataDetail' => $formattedDataDetail,
        ]);
    }

    public function pembiayaanPendapatan(Request $request)
    {

        $tahunSelected = Date('Y');

        if ($request->tahun) {
            $tahunSelected = request()->tahun;
        }
        $tahunAnggaran = PenganggaranTahun::where('tahun', $tahunSelected)->where('id_desa', $request->desa)->first();
        $data = PenganggaranPembiayaanPendapatan::selectRaw('id_rekening_objek, SUM(harga_satuan * volume) AS harga_satuan')->where(['id_penganggaran_tahun' => $tahunAnggaran->id])->groupBy('id_rekening_objek')->with(['rekening_objek'])->get();


        $tahunAll = PenganggaranTahun::where('id_desa',$request->desa)->pluck('tahun')->sortDesc();

        return view('guest.pembiayaan.pendapatan', [
            'data' => $data,
            'tahunAll' => $tahunAll,
            'tahunSelected' => $tahunSelected,
        ]);
    }

    public function detailPembiayaanPendapatan($tahun, $rekeningObjek)
    {
        $tahunAnggaran = PenganggaranTahun::where('tahun', $tahun)->first();
        $rekeningObjek = RekeningObjek::find($rekeningObjek);
        $dataDetail = PenganggaranPembiayaanPendapatan::selectRaw('id_rekening_objek, SUM(harga_satuan * volume) AS total')->where(['id_penganggaran_tahun' => $tahunAnggaran->id, 'id_rekening_objek' => $rekeningObjek->id])->groupBy('id_rekening_objek')->with(['rekening_objek'])->get();

        $formattedDataDetail = [];

        foreach ($dataDetail as $detail) {
            $formattedDataDetail[] = [
                'kode_rekening' => $detail->rekening_objek->full_code,
                'uraian' => $detail->rekening_objek->nama,
                'jumlah' => (int) str_replace(',', '', $detail->total),
                'tipe' => 'sub',
                'keterangan' => 'Detail Anggaran',
            ];
        }

        return view('guest.pembiayaan.detailPendapatan', [
            'tahunAnggaran' => $tahunAnggaran,
            'rekeningObjek' => $rekeningObjek,
            'dataDetail' => $formattedDataDetail,
        ]);
    }

    public function pembiayaanBelanja(Request $request)
    {


        $tahunSelected = Date('Y');

        if ($request->tahun) {
            $tahunSelected = request()->tahun;
        }
        $tahunAnggaran = PenganggaranTahun::where('tahun', $tahunSelected)->where('id_desa', $request->desa)->first();
        $data = PenganggaranPembiayaanBelanja::selectRaw('id_rekening_objek, SUM(harga_satuan * volume) AS harga_satuan')->where(['id_penganggaran_tahun' => $tahunAnggaran->id])->groupBy('id_rekening_objek')->with(['rekening_objek'])->get();


        $tahunAll = PenganggaranTahun::where('id_desa',$request->desa)->pluck('tahun')->sortDesc();

        return view('guest.pembiayaan.belanja', [
            'data' => $data,
            'tahunAll' => $tahunAll,
            'tahunSelected' => $tahunSelected,
        ]);
    }

    public function detailPembiayaanBelanja($tahun, $rekeningObjek)
    {
        $tahunAnggaran = PenganggaranTahun::where('tahun', $tahun)->first();
        $rekeningObjek = RekeningObjek::find($rekeningObjek);
        $dataDetail = PenganggaranPembiayaanBelanja::selectRaw('id_rekening_objek, SUM(harga_satuan * volume) AS total')->where(['id_penganggaran_tahun' => $tahunAnggaran->id, 'id_rekening_objek' => $rekeningObjek->id])->groupBy('id_rekening_objek')->with(['rekening_objek'])->get();

        $formattedDataDetail = [];

        foreach ($dataDetail as $detail) {
            $formattedDataDetail[] = [
                'kode_rekening' => $detail->rekening_objek->full_code,
                'uraian' => $detail->rekening_objek->nama,
                'jumlah' => (int) str_replace(',', '', $detail->total),
                'tipe' => 'sub',
                'keterangan' => 'Detail Anggaran',
            ];
        }

        return view('guest.pembiayaan.detail', [
            'tahunAnggaran' => $tahunAnggaran,
            'rekeningObjek' => $rekeningObjek,
            'dataDetail' => $formattedDataDetail,
        ]);
    }

    public function anggaranKegiatan(Request $request)
    {
        $tahunSelected = Date('Y');
        $tahun = Date('Y');

        if ($request->tahun) {
            $tahunSelected = request()->tahun;
            $tahun = request()->tahun;
        }
        $data = DB::table('penganggaran_bidang as pb')
            ->join('penganggaran_sub_bidang as psb', 'pb.id', '=', 'psb.id_penganggaran_bidang')
            ->join('penganggaran_kegiatan as pgk', 'psb.id', '=', 'pgk.id_penganggaran_sub_bidang')
            ->join('penganggaran_paket_kegiatan as pk', 'pgk.id', '=', 'pk.id_penganggaran_kegiatan')
            ->join('bidang as b', 'pb.id_bidang', '=', 'b.id')
            ->join('sub_bidang as sb', 'psb.id_sub_bidang', '=', 'sb.id')
            ->join('kegiatan as k', 'pgk.id_kegiatan', '=', 'k.id')
            ->join('penganggaran_tahun as pt', 'pb.id_penganggaran_tahun', '=', 'pt.id')
            ->select(
                'b.kode as kode_bidang',
                'b.nama as nama_bidang',
                'sb.kode as kode_sub_bidang',
                'sb.nama as nama_sub_bidang',
                'k.kode as kode_kegiatan',
                'k.nama as nama_kegiatan',
                'pk.id as kode_paket',
                'pk.nama_paket as nama_paket',
                'pgk.pagu as jumlah_uang'
            )
            ->where('pt.id_desa', $request->desa)
            ->orderBy('b.kode')
            ->orderBy('sb.kode')
            ->orderBy('k.kode')
            ->orderBy('pk.id')
            ->get();

        $groupedData = [];
        foreach ($data as $item) {
            $bidangKey = $item->kode_bidang . ' - ' . $item->nama_bidang;
            $subBidangKey = $item->kode_sub_bidang . ' - ' . $item->nama_sub_bidang;
            $kegiatanKey = $item->kode_kegiatan . ' - ' . $item->nama_kegiatan;

            if (!isset($groupedData[$bidangKey])) {
                $groupedData[$bidangKey] = [
                    'nama' => $item->nama_bidang,
                    'kode' => $item->kode_bidang,
                    'sub_bidang' => [],
                    'total' => 0
                ];
            }

            if (!isset($groupedData[$bidangKey]['sub_bidang'][$subBidangKey])) {
                $groupedData[$bidangKey]['sub_bidang'][$subBidangKey] = [
                    'nama' => $item->nama_sub_bidang,
                    'kode' => $item->kode_sub_bidang,
                    'kegiatan' => [],
                    'total' => 0
                ];
            }

            if (!isset($groupedData[$bidangKey]['sub_bidang'][$subBidangKey]['kegiatan'][$kegiatanKey])) {
                $groupedData[$bidangKey]['sub_bidang'][$subBidangKey]['kegiatan'][$kegiatanKey] = [
                    'nama' => $item->nama_kegiatan,
                    'kode' => $item->kode_kegiatan,
                    'paket' => [],
                    'total' => 0
                ];
            }

            $groupedData[$bidangKey]['sub_bidang'][$subBidangKey]['kegiatan'][$kegiatanKey]['paket'][] = [
                'nama_paket' => $item->nama_paket,
                'jumlah_uang' => $item->jumlah_uang
            ];

            $groupedData[$bidangKey]['sub_bidang'][$subBidangKey]['kegiatan'][$kegiatanKey]['total'] += $item->jumlah_uang;
            $groupedData[$bidangKey]['sub_bidang'][$subBidangKey]['total'] += $item->jumlah_uang;
            $groupedData[$bidangKey]['total'] += $item->jumlah_uang;
        }

        $totalKeseluruhan = 0;
        foreach ($groupedData as $bidang) {
            $totalKeseluruhan += $bidang['total'];
        }

        $grafikData = [
            'bidang' => [],
            'sub_bidang' => [],
            'kegiatan' => [],
            'paket' => []
        ];

        foreach ($groupedData as $bidang) {
            $grafikData['bidang'][] = [
                'label' => $bidang['nama'],
                'total' => $bidang['total']
            ];

            foreach ($bidang['sub_bidang'] as $subBidang) {
                $grafikData['sub_bidang'][] = [
                    'label' => $subBidang['nama'],
                    'total' => $subBidang['total']
                ];

                foreach ($subBidang['kegiatan'] as $kegiatan) {
                    $grafikData['kegiatan'][] = [
                        'label' => $kegiatan['nama'],
                        'total' => $kegiatan['total']
                    ];

                    foreach ($kegiatan['paket'] as $paket) {
                        $grafikData['paket'][] = [
                            'label' => $paket['nama_paket'],
                            'total' => $paket['jumlah_uang']
                        ];
                    }
                }
            }
        }

        $tahunAll = PenganggaranTahun::where('id_desa',$request->desa)->pluck('tahun')->sortDesc();

        return view('guest.kegiatan', compact('groupedData', 'totalKeseluruhan', 'grafikData', 'tahun', 'tahunAll', 'tahunSelected'));
    }

    public function about(Request $request)
    {
        $daerah = DB::table('desa')
                ->leftJoin('kecamatan', 'desa.id_kecamatan', '=', 'kecamatan.id')
                ->leftJoin('kabupaten', 'kecamatan.id_kabupaten', '=', 'kabupaten.id')
                ->leftJoin('provinsi', 'kabupaten.id_provinsi', '=', 'provinsi.id')
                ->where('desa.id', $request->desa)
                ->select(
                    'desa.*',
                    'kecamatan.nama as kecamatan_nama',
                    'kabupaten.nama as kabupaten_nama',
                    'provinsi.nama as provinsi_nama'
                )
                ->first();
        
                $data = DB::table('desa')
                ->leftJoin('kepala_desa', function ($join) {
                    $join->on('desa.id', '=', 'kepala_desa.id_desa')
                         ->where('kepala_desa.aktif', 'Ya');
                })
                ->leftJoin('sekretaris_desa', function ($join) {
                    $join->on('desa.id', '=', 'sekretaris_desa.id_desa')
                         ->where('sekretaris_desa.aktif', 'Ya');
                })
                ->leftJoin('kaur_keuangan', function ($join) {
                    $join->on('desa.id', '=', 'kaur_keuangan.id_desa')
                         ->where('kaur_keuangan.aktif', 'Ya');
                })
                ->leftJoin('pelaksana_kegiatan', function ($join) {
                    $join->on('desa.id', '=', 'pelaksana_kegiatan.id_desa')
                         ->where('pelaksana_kegiatan.aktif', 'Ya');
                })
                ->leftJoin('perencanaan_visi', 'desa.id', '=', 'perencanaan_visi.id_desa')
                ->leftJoin('perencanaan_misi', 'perencanaan_visi.id', '=', 'perencanaan_misi.id_visi')
                ->leftJoin('perencanaan_tujuan', 'perencanaan_misi.id', '=', 'perencanaan_tujuan.id_misi')
                ->leftJoin('perencanaan_sasaran', 'perencanaan_tujuan.id', '=', 'perencanaan_sasaran.id_tujuan')
                ->select(
                    'desa.*',
                    'kepala_desa.nama as kepala_desa_nama',
                    'kepala_desa.jabatan as kepala_desa_jabatan',
                    'sekretaris_desa.nama as sekretaris_desa_nama',
                    'sekretaris_desa.jabatan as sekretaris_desa_jabatan',
                    'kaur_keuangan.nama as kaur_keuangan_nama',
                    'kaur_keuangan.jabatan as kaur_keuangan_jabatan',
                    'pelaksana_kegiatan.nama as pelaksana_kegiatan_nama',
                    'pelaksana_kegiatan.jabatan as pelaksana_kegiatan_jabatan',
                    'perencanaan_visi.uraian as visi_uraian',
                    'perencanaan_misi.uraian as misi_uraian',
                    'perencanaan_tujuan.uraian as tujuan_uraian',
                    'perencanaan_sasaran.uraian as sasaran_uraian'
                )
                ->where('desa.id', $request->desa)
                ->get();
        
            if ($data->isEmpty()) {
                return response()->json(['message' => 'Desa tidak ditemukan'], 404);
            }
        
            // Format data
            $formattedData = [
                'desa' => [
                    'id' => $data[0]->id,
                    'nama' => $data[0]->nama,
                    'kode' => $data[0]->kode,
                    'created_at' => $data[0]->created_at,
                    'updated_at' => $data[0]->updated_at,
                ],
                'kepala_desa' => [
                    'nama' => $data[0]->kepala_desa_nama,
                    'jabatan' => $data[0]->kepala_desa_jabatan,
                ],
                'sekretaris_desa' => [
                    'nama' => $data[0]->sekretaris_desa_nama,
                    'jabatan' => $data[0]->sekretaris_desa_jabatan,
                ],
                'kaur_keuangan' => [
                    'nama' => $data[0]->kaur_keuangan_nama,
                    'jabatan' => $data[0]->kaur_keuangan_jabatan,
                ],
                'pelaksana_kegiatan' => $data->pluck('pelaksana_kegiatan_nama', 'pelaksana_kegiatan_jabatan')->unique(),
                'visi' => $data[0]->visi_uraian,
                'misi' => $data->pluck('misi_uraian')->unique()->values(),
                'tujuan' => $data->pluck('tujuan_uraian')->unique()->values(),
                'sasaran' => $data->pluck('sasaran_uraian')->unique()->values(),
            ];

            $data = $formattedData;
            // dd($data['visi']);
                // dd($data);
        return view('guest.about', compact('daerah', 'data'));
    }
}
