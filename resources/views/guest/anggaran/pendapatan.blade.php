@extends('layouts.guest')
<style>
    .form-select {
    width: 100%;
    max-width: 100px;
    padding: 8px 12px;
    font-size: 16px;
    color: #333;
    background-color: #fff;
    border: 2px solid #007bff;
    border-radius: 8px;
    outline: none;
    transition: all 0.3s ease-in-out;
    cursor: pointer;
}

.form-select:hover {
    border-color: #0056b3;
}

.form-select:focus {
    border-color: #0056b3;
    box-shadow: 0 0 8px rgba(0, 91, 187, 0.5);
}

.form-select option {
    padding: 10px;
    background: #fff;
    color: #333;
}

.form-select option:checked {
    background-color: #007bff;
    color: white;
    font-weight: bold;
}

    table {
        width: 100%;
        border-collapse: collapse;
        margin-bottom: 1rem;
    }

    th, td {
        padding: 12px;
        text-align: left;
    }

    .table-hover tbody tr:hover {
        background-color: #f5f5f5;
    }

    .thead-dark th {
        background-color: #343a40;
        color: white;
    }

    .btn-info {
        background-color: #17a2b8;
        border-color: #17a2b8;
        color: white;
        padding: 5px 10px;
        font-size: 14px;
    }

    .btn-info:hover {
        background-color: #138496;
        border-color: #117a8b;
    }

    .align-middle {
        vertical-align: middle !important;
    }

    tfoot td {
        font-weight: bold;
        background-color: #e9ecef;
    }
</style>

@section('content')
<div class="container mt-5">
    <!-- Header Transparansi -->
    <div class="text-center mb-5">
        <h1 class="font-weight-bold">Rincian Anggaran Pendapatan Desa</h1>
        <p class="text-muted">Menyajikan informasi anggaran secara transparan untuk Desa Matang, Kota Bireun, Tahun Anggaran :</p>
        {{-- Filter dropdown tahun --}}
        <select class="form-select" id="tahun" onchange="window.location.href = '/anggaran/' + this.value + '/pendapatan'">
            @foreach($tahunAll as $tahun)
                <option value="{{ $tahun }}" {{ $tahun == $tahunSelected ? 'selected' : '' }}>{{ $tahun }}</option>
            @endforeach
        </select>
    </div>

    <!-- Tabel Anggaran -->
    <div class="card-body">
        <table class="table table-hover table-bordered">
            <thead class="thead-dark">
                <tr>
                    <th class="text-center" style="width: 5%;">No</th>
                    <th class="text-center" style="width: 10%;">Kode Rekening</th>
                    <th style="width: 30%;">Uraian Kegiatan dan Pendapatan</th>
                    <th class="text-right" style="width: 15%;">Jumlah (Rp)</th>
                    <th class="text-right" style="width: 10%;">Persentase (%)</th>
                    <th class="text-center" style="width: 10%;">Aksi</th>
                </tr>
            </thead>
            <tbody>
                @php
                    // Hitung total anggaran
                    $total = $data->sum('harga_satuan');
                @endphp
                @foreach($data as $index => $item)
                    <tr>
                        <td class="text-center align-middle">{{ $index + 1 }}</td>
                        <td class="text-center align-middle">{{ $item->rekening_objek->full_code }}</td>
                        <td class="align-middle">{{ $item->rekening_objek->nama }}</td>
                        <td class="text-right align-middle">{{ number_format($item->harga_satuan, 0, ',', '.') }}</td>
                        <td class="text-right align-middle">
                            {{ number_format(($item->harga_satuan / $total) * 100, 2, ',', '.') }}%
                        </td>
                        <td class="text-center align-middle">
                            <a href="{{ route('anggaran.pendapatan.detail', ['tahun' => $tahunSelected, 'rekeningObjek' => $item->rekening_objek->id]) }}" 
                               class="btn btn-sm btn-info">
                                <i class="fas fa-eye"></i> Detail
                            </a>
                        </td>
                    </tr>
                @endforeach
            </tbody>
            <tfoot>
                <tr class="table-secondary font-weight-bold">
                    <td colspan="3" class="text-center">Total</td>
                    <td class="text-right">{{ number_format($total, 0, ',', '.') }}</td>
                    <td class="text-right">100%</td>
                    <td></td>
                </tr>
            </tfoot>
        </table>
    </div>

    <!-- Grafik Distribusi Anggaran -->
    <div class="mt-5">
        <h4 class="text-center">Distribusi Anggaran Desa</h4>
        <div class="d-flex justify-content-center align-items-center mt-5">
            <div style="width:400px; margin-right: 20px">
                <canvas id="chart-anggaran"></canvas>
            </div>
            <div style="width:800px; margin-left: 20px">
                <canvas id="chart-anggaran-2"></canvas>
            </div>
        </div>
    </div>
</div>

<!-- Chart.js Script -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
    var ctx = document.getElementById('chart-anggaran').getContext('2d');
    const data = @json($data);
    const labels = data.map(item => item.rekening_objek.nama);
    const values = data.map(item => item.harga_satuan);
    const backgroundColors = [
        '#FF6384', '#36A2EB', '#FFCE56', '#4BC0C0', '#9966FF', '#FF9F40'
    ];

    new Chart(ctx, {
        type: 'pie',
        data: {
            labels: labels,
            datasets: [{
                data: values,
                backgroundColor: backgroundColors,
            }]
        },
        options: {
            responsive: true,
            plugins: {
                legend: {
                    position: 'bottom'
                }
            }
        }
    });

    var ctx2 = document.getElementById('chart-anggaran-2').getContext('2d');
    new Chart(ctx2, {
        type: 'bar',
        data: {
            labels: labels,
            datasets: [{
                label: 'Distribusi Anggaran',
                data: values,
                backgroundColor: backgroundColors,
            }]
        },
        options: {
            responsive: true,
            plugins: {
                legend: {
                    position: 'bottom'
                }
            }
        }
    });
</script>
@endsection