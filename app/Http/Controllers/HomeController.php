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

    public function rincian(){
        return view('guest.anggaran');
    }
}
