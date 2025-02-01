<?php

namespace App\Http\Controllers;

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

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct() {}

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
{
    $user = auth()->user();

    // Ambil tahun sekarang jika tidak ada filter tahun
    $tahun = request('tahun', date('Y'));

    // Ambil data pendapatan desa dari tabel penganggaran_pendapatan
    $pendapatanDesa = PenganggaranPendapatan::whereHas('penganggaranTahun', function ($query) use ($tahun) {
        $query->where('tahun', $tahun);
    })->get();

    dd($pendapatanDesa);

    // Ambil data realisasi anggaran dari tabel penganggaran_belanja
    $realisasiAnggaran = PenganggaranBelanja::whereHas('penganggaranTahun', function ($query) use ($tahun) {
        $query->where('tahun', $tahun);
    })->get();

    // Hitung total anggaran dan realisasi
    $totalPaguAnggaran = $pendapatanDesa->sum('harga_satuan');
    $totalRealisasi = $realisasiAnggaran->sum('harga_satuan');

    // Hitung persentase realisasi
    $persentaseRealisasi = ($totalPaguAnggaran > 0) ? ($totalRealisasi / $totalPaguAnggaran) * 100 : 0;

    // Ambil data total anggaran dan realisasi per tahun dari tabel penganggaran_tahun
    $totalAnggaranRealiasiPerTahun = PenganggaranTahun::with(['pendapatan', 'belanja'])
        ->get()
        ->map(function ($tahun) {
            return (object)[
                'tahun' => $tahun->tahun,
                'total_anggaran' => $tahun->pendapatan->sum('harga_satuan'),
                'total_realisasi' => $tahun->belanja->sum('harga_satuan')
            ];
        });

        // dd($pendapatanDesa);

    // Format data untuk dikirim ke view
    $data = (object)[
        "totalPaguAnggaran" => $totalPaguAnggaran,
        "totalRealisasi" => $totalRealisasi,
        "persentaseRealisasi" => $persentaseRealisasi,
        "pendapatanDesa" => $pendapatanDesa,
        "totalAnggaranRealiasiPerTahun" => $totalAnggaranRealiasiPerTahun
    ];

    // Redirect ke dashboard jika user sudah login
    if ($user) {
        return view('dashboard');
    }

    // Tampilkan data ke view home
    return view('home', compact('data', 'tahun'));
}

    public function anggaranPendapatan(Request $request)
    {
        $tahunSelected = Date('Y');

        if ($request->tahun) {
            $tahunSelected = request()->tahun;
        }
        //  data all
        $tahunAnggaran = PenganggaranTahun::where('tahun', $tahunSelected)->first();
        $data = PenganggaranPendapatan::selectRaw('id_rekening_objek, SUM(harga_satuan * volume) AS harga_satuan')->where(['id_penganggaran_tahun' => $tahunAnggaran->id])->groupBy('id_rekening_objek')->with(['rekening_objek'])->get();

        // dd($data[0]->rekening_objek->nama);
        // data detail

        $tahunAll = PenganggaranTahun::pluck('tahun')->sortDesc();
        // dd($tahunAll);

        return view('guest.anggaran.pendapatan', [
            'data' => $data,
            'tahunAll' => $tahunAll,
            'tahunSelected' => $tahunSelected,
        ]);
    }

    public function detailAnggaranPendapatan($tahun, $rekeningObjek)
    {
        // Ambil data detail dari services
        $tahunAnggaran = PenganggaranTahun::where('tahun', $tahun)->first();
        $rekeningObjek = RekeningObjek::find($rekeningObjek);
        $dataDetail = PenganggaranPendapatan::selectRaw('id_rekening_objek, SUM(harga_satuan * volume) AS total')->where(['id_penganggaran_tahun' => $tahunAnggaran->id, 'id_rekening_objek' => $rekeningObjek->id])->groupBy('id_rekening_objek')->with(['rekening_objek'])->get();

        $formattedDataDetail = [];
        // Format data detail
        // 'kode_rekening' => $item['rekening_objek']['full_code'],
        //         'uraian' => $item['rekening_objek']['nama'],
        //         'jumlah' => (int) str_replace(',', '', $item['total']),
        //         'tipe' => 'sub',
        //         'keterangan' => 'Detail Anggaran',

        foreach ($dataDetail as $detail) {
            $formattedDataDetail[] = [
                'kode_rekening' => $detail->rekening_objek->full_code,
                'uraian' => $detail->rekening_objek->nama,
                'jumlah' => (int) str_replace(',', '', $detail->total),
                'tipe' => 'sub',
                'keterangan' => 'Detail Anggaran',
            ];
        }

        // dd($formattedDataDetail);
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
        //  data all
        $tahunAnggaran = PenganggaranTahun::where('tahun', $tahunSelected)->first();
        $data = PenganggaranBelanja::selectRaw('id_rekening_objek, SUM(harga_satuan * volume) AS harga_satuan')->where(['id_penganggaran_tahun' => $tahunAnggaran->id])->groupBy('id_rekening_objek')->with(['rekening_objek'])->get();

        // dd($data[0]->rekening_objek->nama);
        // data detail

        $tahunAll = PenganggaranTahun::pluck('tahun')->sortDesc();
        // dd($tahunAll);

        return view('guest.anggaran.belanja', [
            'data' => $data,
            'tahunAll' => $tahunAll,
            'tahunSelected' => $tahunSelected,
        ]);
    }

    public function detailanggaranBelanja($tahun, $rekeningObjek)
    {
        // Ambil data detail dari services
        $tahunAnggaran = PenganggaranTahun::where('tahun', $tahun)->first();
        $rekeningObjek = RekeningObjek::find($rekeningObjek);
        $dataDetail = PenganggaranBelanja::selectRaw('id_rekening_objek, SUM(harga_satuan * volume) AS total')->where(['id_penganggaran_tahun' => $tahunAnggaran->id, 'id_rekening_objek' => $rekeningObjek->id])->groupBy('id_rekening_objek')->with(['rekening_objek'])->get();

        $formattedDataDetail = [];
        // Format data detail
        // 'kode_rekening' => $item['rekening_objek']['full_code'],
        //         'uraian' => $item['rekening_objek']['nama'],
        //         'jumlah' => (int) str_replace(',', '', $item['total']),
        //         'tipe' => 'sub',
        //         'keterangan' => 'Detail Anggaran',

        foreach ($dataDetail as $detail) {
            $formattedDataDetail[] = [
                'kode_rekening' => $detail->rekening_objek->full_code,
                'uraian' => $detail->rekening_objek->nama,
                'jumlah' => (int) str_replace(',', '', $detail->total),
                'tipe' => 'sub',
                'keterangan' => 'Detail Anggaran',
            ];
        }

        // dd($formattedDataDetail);
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
        //  data all
        $tahunAnggaran = PenganggaranTahun::where('tahun', $tahunSelected)->first();
        $data = PenganggaranPembiayaanPendapatan::selectRaw('id_rekening_objek, SUM(harga_satuan * volume) AS harga_satuan')->where(['id_penganggaran_tahun' => $tahunAnggaran->id])->groupBy('id_rekening_objek')->with(['rekening_objek'])->get();

        // dd($data[0]->rekening_objek->nama);
        // data detail

        $tahunAll = PenganggaranTahun::pluck('tahun')->sortDesc();
        // sort tahun mulai dari terbesar ke terkecil
        // dd($tahunAll);

        return view('guest.pembiayaan.pendapatan', [
            'data' => $data,
            'tahunAll' => $tahunAll,
            'tahunSelected' => $tahunSelected,
        ]);
    }

    public function detailPembiayaanPendapatan($tahun, $rekeningObjek)
    {
        // Ambil data detail dari services
        $tahunAnggaran = PenganggaranTahun::where('tahun', $tahun)->first();
        $rekeningObjek = RekeningObjek::find($rekeningObjek);
        $dataDetail = PenganggaranPembiayaanPendapatan::selectRaw('id_rekening_objek, SUM(harga_satuan * volume) AS total')->where(['id_penganggaran_tahun' => $tahunAnggaran->id, 'id_rekening_objek' => $rekeningObjek->id])->groupBy('id_rekening_objek')->with(['rekening_objek'])->get();

        $formattedDataDetail = [];
        // Format data detail
        // 'kode_rekening' => $item['rekening_objek']['full_code'],
        //         'uraian' => $item['rekening_objek']['nama'],
        //         'jumlah' => (int) str_replace(',', '', $item['total']),
        //         'tipe' => 'sub',
        //         'keterangan' => 'Detail Anggaran',

        foreach ($dataDetail as $detail) {
            $formattedDataDetail[] = [
                'kode_rekening' => $detail->rekening_objek->full_code,
                'uraian' => $detail->rekening_objek->nama,
                'jumlah' => (int) str_replace(',', '', $detail->total),
                'tipe' => 'sub',
                'keterangan' => 'Detail Anggaran',
            ];
        }

        // dd($formattedDataDetail);
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
        //  data all
        $tahunAnggaran = PenganggaranTahun::where('tahun', $tahunSelected)->first();
        $data = PenganggaranPembiayaanBelanja::selectRaw('id_rekening_objek, SUM(harga_satuan * volume) AS harga_satuan')->where(['id_penganggaran_tahun' => $tahunAnggaran->id])->groupBy('id_rekening_objek')->with(['rekening_objek'])->get();

        // dd($data[0]->rekening_objek->nama);
        // data detail

        $tahunAll = PenganggaranTahun::pluck('tahun')->sortDesc();
        // sort tahun mulai dari terbesar ke terkecil
        // dd($tahunAll);

        return view('guest.pembiayaan.belanja', [
            'data' => $data,
            'tahunAll' => $tahunAll,
            'tahunSelected' => $tahunSelected,
        ]);
    }

    public function detailPembiayaanBelanja($tahun, $rekeningObjek)
    {
        // Ambil data detail dari services
        $tahunAnggaran = PenganggaranTahun::where('tahun', $tahun)->first();
        $rekeningObjek = RekeningObjek::find($rekeningObjek);
        $dataDetail = PenganggaranPembiayaanBelanja::selectRaw('id_rekening_objek, SUM(harga_satuan * volume) AS total')->where(['id_penganggaran_tahun' => $tahunAnggaran->id, 'id_rekening_objek' => $rekeningObjek->id])->groupBy('id_rekening_objek')->with(['rekening_objek'])->get();

        $formattedDataDetail = [];
        // Format data detail
        // 'kode_rekening' => $item['rekening_objek']['full_code'],
        //         'uraian' => $item['rekening_objek']['nama'],
        //         'jumlah' => (int) str_replace(',', '', $item['total']),
        //         'tipe' => 'sub',
        //         'keterangan' => 'Detail Anggaran',

        foreach ($dataDetail as $detail) {
            $formattedDataDetail[] = [
                'kode_rekening' => $detail->rekening_objek->full_code,
                'uraian' => $detail->rekening_objek->nama,
                'jumlah' => (int) str_replace(',', '', $detail->total),
                'tipe' => 'sub',
                'keterangan' => 'Detail Anggaran',
            ];
        }

        // dd($formattedDataDetail);
        return view('guest.pembiayaan.detail', [
            'tahunAnggaran' => $tahunAnggaran,
            'rekeningObjek' => $rekeningObjek,
            'dataDetail' => $formattedDataDetail,
        ]);
    }

    public function anggaranKegiatan(Request $request)
{
    // Ambil tahun dari request atau gunakan tahun sekarang
    $tahunSelected = Date('Y');
    $tahun = Date('Y');

        if ($request->tahun) {
            $tahunSelected = request()->tahun;
            $tahun = request()->tahun;
        }
    // Query untuk mengambil data kegiatan yang dikelompokkan berdasarkan tahun
    $data = DB::table('penganggaran_bidang as pb')
        ->join('penganggaran_sub_bidang as psb', 'pb.id', '=', 'psb.id_penganggaran_bidang')
        ->join('penganggaran_kegiatan as pgk', 'psb.id', '=', 'pgk.id_penganggaran_sub_bidang')
        ->join('penganggaran_paket_kegiatan as pk', 'pgk.id', '=', 'pk.id_penganggaran_kegiatan')
        ->join('bidang as b', 'pb.id_bidang', '=', 'b.id')
        ->join('sub_bidang as sb', 'psb.id_sub_bidang', '=', 'sb.id')
        ->join('kegiatan as k', 'pgk.id_kegiatan', '=', 'k.id')
        ->join('penganggaran_tahun as pt', 'pb.id_penganggaran_tahun', '=', 'pt.id')
        ->where('pt.tahun', $tahun) // Filter berdasarkan tahun
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
        ->orderBy('b.kode')
        ->orderBy('sb.kode')
        ->orderBy('k.kode')
        ->orderBy('pk.id')
        ->get();

    // Kelompokkan data berdasarkan bidang, sub-bidang, dan kegiatan
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

        // Tambahkan jumlah uang ke total kegiatan, sub-bidang, dan bidang
        $groupedData[$bidangKey]['sub_bidang'][$subBidangKey]['kegiatan'][$kegiatanKey]['total'] += $item->jumlah_uang;
        $groupedData[$bidangKey]['sub_bidang'][$subBidangKey]['total'] += $item->jumlah_uang;
        $groupedData[$bidangKey]['total'] += $item->jumlah_uang;
    }

    // Hitung total keseluruhan anggaran
    $totalKeseluruhan = 0;
    foreach ($groupedData as $bidang) {
        $totalKeseluruhan += $bidang['total'];
    }

    // Format data untuk grafik
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

    $tahunAll = PenganggaranTahun::pluck('tahun')->sortDesc();

    // Kirim data ke view
    return view('guest.kegiatan', compact('groupedData', 'totalKeseluruhan', 'grafikData', 'tahun','tahunAll', 'tahunSelected'));
}

    public function about()
    {
        return view('guest.about');
    }
}

        // public function rincianPendapatan()
        // {
        //     $data = [
        //         [
        //             'kode_rekening' => '1',
        //             'uraian' => 'Pendapatan Asli Desa',
        //             'jumlah' => 100000000,
        //             'keterangan' => 'PAD',
        //             'tipe' => 'header'
        //         ],
        //         [
        //             'kode_rekening' => '1.1',
        //             'uraian' => 'Pendapatan Pajak',
        //             'jumlah' => 10000000,
        //             'keterangan' => 'PAD',
        //             'tipe' => 'sub'
        //         ],
        //         [
        //             'kode_rekening' => '1.2',
        //             'uraian' => 'Pendapatan Retribusi',
        //             'jumlah' => 20000000,
        //             'keterangan' => 'PAD',
        //             'tipe' => 'sub'
        //         ],
        //         [
        //             'kode_rekening' => '1.3',
        //             'uraian' => 'Pendapatan Hasil Usaha',
        //             'jumlah' => 30000000,
        //             'keterangan' => 'PAD',
        //             'tipe' => 'sub'
        //         ],
        //         [
        //             'kode_rekening' => '1.4',
        //             'uraian' => 'Pendapatan Lain-lain',
        //             'jumlah' => 40000000,
        //             'keterangan' => 'PAD',
        //             'tipe' => 'sub'
        //         ],
        //         [
        //             'kode_rekening' => '2',
        //             'uraian' => 'Pendapatan Dana Desa',
        //             'jumlah' => 200000000,
        //             'keterangan' => 'ADD',
        //             'tipe' => 'header'
        //         ],
        //         [
        //             'kode_rekening' => '2.1',
        //             'uraian' => 'Pendapatan ADD I',
        //             'jumlah' => 100000000,
        //             'keterangan' => 'ADD',
        //             'tipe' => 'sub'
        //         ],
        //         [
        //             'kode_rekening' => '2.2',
        //             'uraian' => 'Pendapatan ADD II',
        //             'jumlah' => 100000000,
        //             'keterangan' => 'ADD',
        //             'tipe' => 'sub'
        //         ],
        //         [
        //             'kode_rekening' => '3',
        //             'uraian' => 'Pendapatan Bantuan Provinsi',
        //             'jumlah' => 150000000,
        //             'keterangan' => 'Bantuan Provinsi',
        //             'tipe' => 'header'
        //         ],
        //         [
        //             'kode_rekening' => '3.1',
        //             'uraian' => 'Pendapatan Bantuan Provinsi I',
        //             'jumlah' => 75000000,
        //             'keterangan' => 'Bantuan Provinsi',
        //             'tipe' => 'sub'
        //         ],
        //         [
        //             'kode_rekening' => '3.2',
        //             'uraian' => 'Pendapatan Bantuan Provinsi II',
        //             'jumlah' => 75000000,
        //             'keterangan' => 'Bantuan Provinsi',
        //             'tipe' => 'sub'
        //         ],
        //     ];
        
        //     $tahunAll = [
        //         '2018',
        //         '2019',
        //         '2020',
        //         '2021',
        //         '2022',
        //         '2023',
        //         '2024',
        //         '2025',
        //     ];
        //     $tahunSelected = Date('Y');
        
        //     if(request()->tahun){
        //         $tahunSelected = request()->tahun;
        //     }
        
        //     return view('guest.anggaran.belanja.belanja', ['data' => $data, 'tahunAll' => $tahunAll, 'tahunSelected' => $tahunSelected]);
        
        // }