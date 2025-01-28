@extends('layouts.guest')

@section('content')
<div class="container mt-5">
    <!-- Header Transparansi -->
    <div class="text-center mb-5">
        <h1 class="font-weight-bold">Rincian Anggaran Desa</h1>
        <p class="text-muted">Menyajikan informasi anggaran secara transparan untuk Desa Matang, Kota Bireun, Tahun Anggaran 2025</p>
    </div>

    <!-- Tabel Anggaran -->
    
        <div class="card-body">
            <table class="table table-hover table-bordered">
                <thead class="thead-dark">
                    <tr>
                        <th class="text-center">No</th>
                        <th class="text-center">Kode Rekening</th>
                        <th>Uraian Kegiatan dan Belanja</th>
                        <th class="text-right">Jumlah (Rp)</th>
                        <th class="text-center">Keterangan</th>
                        <th class="text-right">Persentase (%)</th>
                    </tr>
                </thead>
                <tbody>
                    @php
                    // total of all data with tipe header
                        
                        $total = array_sum(array_map(function($item){
                            return $item['tipe'] == 'header' ? $item['jumlah'] : 0;
                        }, $data));
                    @endphp
                    @foreach($data as $index => $item)
                    @if($item['tipe'] == 'header')
                    <tr class="table-primary font-weight-bold">
                    @else
                    <tr>
                    @endif
                        <td class="text-center">{{ $index + 1 }}</td>
                        <td class="text-center">{{ $item['kode_rekening'] }}</td>
                        <td>{{ $item['uraian'] }}</td>
                        <td class="text-right">{{ number_format($item['jumlah'], 0, ',', '.') }}</td>
                        <td class="text-center">{{ $item['keterangan'] }}</td>
                        <td class="text-right">
                            {{ number_format(($item['jumlah'] / $total) * 100, 2, ',', '.') }}%
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
        <h4 class="text-center">Distribusi Anggaran Desa</h4>
        <div class="d-flex justify-content-center align-items-center mt-5">
        <div class="" style="width:400px; margin-right: 20px">
            <canvas id="chart-anggaran" ></canvas>
        </div>
        <div class="" style="width:800px; margin-left: 20px">
            <canvas id="chart-anggaran-2" ></canvas>
        </div>
        </div>
    </div>
</div>

<!-- Chart.js Script -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
    var ctx = document.getElementById('chart-anggaran').getContext('2d');
    const data = @json($data);
    const filteredData = data.filter((item) => item.tipe === 'sub')
    const labels = filteredData.map(item => item.uraian);
    const values = filteredData.map(item => item.jumlah);
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

    var ctx = document.getElementById('chart-anggaran-2').getContext('2d');
    new Chart(ctx, {
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
