@extends('layouts.guest')

@section('content')
<div class="container mt-5">
    <!-- Header Halaman Detail -->
    <div class="text-center mb-5">
        <h1 class="font-weight-bold">Detail Anggaran Pembiayaan Pendapatan Desa</h1>
        <p class="text-muted">
            Menyajikan informasi detail anggaran untuk Rekening Objek: 
            <strong>{{ $rekeningObjek->nama }}</strong> ({{ $rekeningObjek->full_code }}), 
            Tahun Anggaran: <strong>{{ $tahunAnggaran->tahun }}</strong>
        </p>
        <a href="{{ route('anggaran.pendapatan', ['tahun' => $tahunAnggaran->tahun]) }}" class="btn btn-primary">
            Kembali ke Halaman Utama
        </a>
    </div>

    <!-- Tabel Detail Anggaran -->
    <div class="card-body">
        <table class="table table-hover table-bordered">
            <thead class="thead-dark">
                <tr>
                    <th class="text-center">No</th>
                    <th class="text-center">Kode Rekening</th>
                    <th>Uraian Kegiatan dan Pendapatan</th>
                    <th class="text-right">Jumlah (Rp)</th>
                    <th class="text-center">Keterangan</th>
                    <th class="text-right">Persentase (%)</th>
                </tr>
            </thead>
            <tbody>
                @php
                    $total = 0;
                    // Hitung total anggaran
                    foreach ($dataDetail as $item) {
                        $total += $item['jumlah'];
                    }
                @endphp
                @foreach($dataDetail as $index => $item)
                    <tr>
                        <td class="text-center">{{ $index + 1 }}</td>
                        <td class="text-center">{{ $item['kode_rekening'] }}</td>
                        <td>{{ $item['uraian'] }}</td>
                        <td class="text-right">{{ number_format($item['jumlah'], 0, ',', '.') }}</td>
                        <td class="text-center">{{ $item['keterangan'] }}</td>
                        <td class="text-right">
                            @if($total > 0)
                                {{ number_format(($item['jumlah'] / $total) * 100, 2, ',', '.') }}%
                            @else
                                0%
                            @endif
                        </td>
                    </tr>
                @endforeach
            </tbody>
            <tfoot>
                <tr class="table-secondary font-weight-bold">
                    <td colspan="3" class="text-center">Total</td>
                    <td class="text-right">{{ number_format($total, 0, ',', '.') }}</td>
                    <td></td>
                    <td class="text-right">100%</td>
                </tr>
            </tfoot>
        </table>
    </div>

    <!-- Grafik Distribusi Anggaran -->
    <div class="mt-5">
        <h4 class="text-center">Distribusi Anggaran Pendapatan Desa</h4>
        <div class="d-flex justify-content-center align-items-center mt-5">
            <div style="width: 400px; margin-right: 20px;">
                <canvas id="chartPie"></canvas>
            </div>
            <div style="width: 600px; margin-left: 20px;">
                <canvas id="chartBar"></canvas>
            </div>
        </div>
    </div>
</div>

<!-- Chart.js Script -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
    // Data untuk grafik
    const dataDetail = @json($dataDetail);
    const labels = dataDetail.map(item => item.uraian);
    const amounts = dataDetail.map(item => item.jumlah);
    const backgroundColors = [
        '#FF6384', '#36A2EB', '#FFCE56', '#4BC0C0', '#9966FF', '#FF9F40',
        '#FF8A80', '#7E57C2', '#26A69A', '#D4E157', '#FF7043', '#8D6E63'
    ];

    // Grafik Pie
    const ctxPie = document.getElementById('chartPie').getContext('2d');
    new Chart(ctxPie, {
        type: 'pie',
        data: {
            labels: labels,
            datasets: [{
                data: amounts,
                backgroundColor: backgroundColors,
            }]
        },
        options: {
            responsive: true,
            plugins: {
                legend: {
                    position: 'bottom',
                },
                tooltip: {
                    callbacks: {
                        label: function(context) {
                            let label = context.label || '';
                            let value = context.raw || 0;
                            let total = context.dataset.data.reduce((a, b) => a + b, 0);
                            let percentage = ((value / total) * 100).toFixed(2);
                            return `${label}: Rp ${value.toLocaleString()} (${percentage}%)`;
                        }
                    }
                }
            }
        }
    });

    // Grafik Bar
    const ctxBar = document.getElementById('chartBar').getContext('2d');
    new Chart(ctxBar, {
        type: 'bar',
        data: {
            labels: labels,
            datasets: [{
                label: 'Jumlah Anggaran (Rp)',
                data: amounts,
                backgroundColor: backgroundColors,
            }]
        },
        options: {
            responsive: true,
            plugins: {
                legend: {
                    position: 'bottom',
                },
                tooltip: {
                    callbacks: {
                        label: function(context) {
                            let label = context.label || '';
                            let value = context.raw || 0;
                            return `${label}: Rp ${value.toLocaleString()}`;
                        }
                    }
                }
            },
            scales: {
                y: {
                    beginAtZero: true,
                    ticks: {
                        callback: function(value) {
                            return `Rp ${value.toLocaleString()}`;
                        }
                    }
                }
            }
        }
    });
</script>
@endsection