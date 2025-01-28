<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {

    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        $user = auth()->user();

        

        $pendapatanDesa = [
            (object)[
                "sumber_pendapatan" => "PAD",
                "anggaran" => 100000000,
                "realisasi" => 90000000
            ],
            (object)[
                "sumber_pendapatan" => "Alokasi Dana Desa (ADD)",
                "anggaran" => 200000000,
                "realisasi" => 80000000
            ],
            (object)[
                "sumber_pendapatan" => "Dana Desa",
                "anggaran" => 500000000,
                "realisasi" => 410000000
            ],
            (object)[
                "sumber_pendapatan" => "Bantuan Provinsi",
                "anggaran" => 200000000,
                "realisasi" => 150000000
            ]
        ];


        $totalPaguAnggaran = 0;
        $totalRealisasi = 0;
        foreach($pendapatanDesa as $pendapatan){
            $totalPaguAnggaran += $pendapatan->anggaran;
            $totalRealisasi += $pendapatan->realisasi;
        }

        $persentaseRealisasi = ($totalRealisasi / $totalPaguAnggaran) * 100;


        $data = (object)[
            "totalPaguAnggaran" => $totalPaguAnggaran,
            "totalRealisasi" => $totalRealisasi,
            "persentaseRealisasi" => $persentaseRealisasi,
            "pendapatanDesa" => $pendapatanDesa
        ];
        if($user){
            return view('dashboard');
        }
        return view('home', compact('data'));
    }

    public function rincian()
{
    $data = [
        [
            'kode_rekening' => '2.1',
            'uraian' => 'Penyelenggaraan Pemerintah Gampong',
            'jumlah' => 58702120,
            'keterangan' => 'DDS/ADD',
            'tipe' => 'header'
        ],
        [
            'kode_rekening' => '2.1.1',
            'uraian' => 'Insentif Keuchik',
            'jumlah' => 9600000,
            'keterangan' => 'DDS',
            'tipe' => 'sub'
        ],
        [
            'kode_rekening' => '2.1.2',
            'uraian' => 'Insentif Perangkat Desa',
            'jumlah' => 18588120,
            'keterangan' => 'ADD',
            'tipe' => 'sub'
        ],
        [
            'kode_rekening' => '2.1.3',
            'uraian' => 'Makan Minum Kantor Dan Servis Kendaraan',
            'jumlah' => 8000000,
            'keterangan' => 'DDS',
            'tipe' => 'sub'
        ],
        [
            'kode_rekening' => '2.1.4',
            'uraian' => 'Insentif Tuha Peut',
            'jumlah' => 8000000,
            'keterangan' => 'DDS',
            'tipe' => 'sub'
        ],
        [
            'kode_rekening' => '2.1.5',
            'uraian' => 'Insentif Imam, Khadam Dan Ketua Pemuda',
            'jumlah' => 7000000,
            'keterangan' => 'DDS',
            'tipe' => 'sub'
        ],
        [
            'kode_rekening' => '2.1.6',
            'uraian' => 'Penyusunan RKPG Dan RPJMG',
            'jumlah' => 7000000,
            'keterangan' => 'DDS',
            'tipe' => 'sub'
        ],
        [
            'kode_rekening' => '2.1.7',
            'uraian' => 'Insentif Op',
            'jumlah' => 4500000,
            'keterangan' => 'DDS',
            'tipe' => 'sub'
        ],
        [
            'kode_rekening' => '2.1.8',
            'uraian' => 'Penginputan IDM',
            'jumlah' => 4500000,
            'keterangan' => 'DDS',
            'tipe' => 'sub'
        ],
        [
            'kode_rekening' => '2.2',
            'uraian' => 'Pembinaan Kemasyarakatan',
            'jumlah' => 18750000,
            'keterangan' => 'DDS',
            'tipe' => 'header'
        ],
        [
            'kode_rekening' => '2.2.1',
            'uraian' => 'Insentif PKK Dan Pokja',
            'jumlah' => 3750000,
            'keterangan' => 'DDS',
            'tipe' => 'sub'
        ],
        [
            'kode_rekening' => '2.2.2',
            'uraian' => 'Amplif Dan Sistem',
            'jumlah' => 15000000,
            'keterangan' => 'DDS',
            'tipe' => 'sub'
        ],
        [
            'kode_rekening' => '2.3',
            'uraian' => 'Pelaksanaan Pembangunan Gampong',
            'jumlah' => 44984778,
            'keterangan' => 'DDS & ADD',
            'tipe' => 'header'
        ],
        [
            'kode_rekening' => '2.3.1',
            'uraian' => 'Insentif Guru Majlis Taklim, TPA Dan Makan Minum',
            'jumlah' => 8250000,
            'keterangan' => 'DDS',
            'tipe' => 'sub'
        ],
        [
            'kode_rekening' => '2.3.2',
            'uraian' => 'Tagihan PJU Dan Pemeliharaan Lampu Jalan',
            'jumlah' => 17144778,
            'keterangan' => 'ADD',
            'tipe' => 'sub'
        ],
        [
            'kode_rekening' => '2.3.3',
            'uraian' => 'Mesin Air Desa',
            'jumlah' => 5000000,
            'keterangan' => 'DDS',
            'tipe' => 'sub'
        ],
        [
            'kode_rekening' => '2.3.4',
            'uraian' => 'Baju Seragam Posyandu Dan PKK',
            'jumlah' => 6000000,
            'keterangan' => 'DDS',
            'tipe' => 'sub'
        ],
        [
            'kode_rekening' => '2.3.5',
            'uraian' => 'Insentif Kader KPM',
            'jumlah' => 6000000,
            'keterangan' => 'DDS',
            'tipe' => 'sub'
        ],
        [
            'kode_rekening' => '2.3.6',
            'uraian' => 'PMT Lansia, Balita, Ibu Hamil Dan Honorium',
            'jumlah' => 12000000,
            'keterangan' => 'DDS',
            'tipe' => 'sub'
        ],
        [
            'kode_rekening' => '2.4',
            'uraian' => 'Pemberdayaan Masyarakat',
            'jumlah' => 18000000,
            'keterangan' => 'DDS',
            'tipe' => 'header'
        ],
        [
            'kode_rekening' => '2.4.1',
            'uraian' => 'Pakaian Seragam Aparatur Desa',
            'jumlah' => 18000000,
            'keterangan' => 'DDS',
            'tipe' => 'sub'
        ],
        [
            'kode_rekening' => '2.5',
            'uraian' => 'Pelaksanaan Penanggulangan Bencana',
            'jumlah' => 18900000,
            'keterangan' => 'DDS',
            'tipe' => 'sub'
        ],
        [
            'kode_rekening' => '2.5.1',
            'uraian' => 'BLT Periode April S/D Juni',
            'jumlah' => 18900000,
            'keterangan' => 'DDS',
            'tipe' => 'sub'
        ],
    ];

    return view('guest.anggaran', ['data' => $data]);
}

}
