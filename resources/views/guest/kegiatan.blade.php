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
    <h1 class="text-center mb-5">Rincian Anggaran Kegiatan</h1>
    <p class="text-muted text-center">
        {{-- deskripsi --}}
      Menampilkan rincian anggaran kegiatan yang ada di desa.
    </p>
    <select class="form-select" id="tahun" onchange="window.location.href = '/anggaran/' + this.value + '/kegiatan?desa=' + '{{ request('desa') }}'">
      @foreach($tahunAll as $tahun)
          <option value="{{ $tahun }}" {{ $tahun == $tahunSelected ? 'selected' : '' }}>{{ $tahun }}</option>
      @endforeach
  </select>
    <!-- Tabel -->
    <table class="table table-bordered">
      <thead>
          <tr>
              <th>Bidang</th>
              <th>Sub Bidang</th>
              <th>Kegiatan</th>
              <th>Paket</th>
              <th>Jumlah Uang</th>
          </tr>
      </thead>
      <tbody>
          @foreach($groupedData as $bidang)
              <tr class="table-primary">
                  <td colspan="4"><strong>{{ $bidang['kode'] }} - {{ $bidang['nama'] }}</strong></td>
                  <td><strong>{{ number_format($bidang['total'], 0, ',', '.') }}</strong></td>
              </tr>
              @foreach($bidang['sub_bidang'] as $subBidang)
                  <tr class="table-secondary">
                      <td></td>
                      <td colspan="3"><strong>{{ $subBidang['kode'] }} - {{ $subBidang['nama'] }}</strong></td>
                      <td><strong>{{ number_format($subBidang['total'], 0, ',', '.') }}</strong></td>
                  </tr>
                  @foreach($subBidang['kegiatan'] as $kegiatan)
                      <tr class="table-info">
                          <td></td>
                          <td></td>
                          <td colspan="2"><strong>{{ $kegiatan['kode'] }} - {{ $kegiatan['nama'] }}</strong></td>
                          <td><strong>{{ number_format($kegiatan['total'], 0, ',', '.') }}</strong></td>
                      </tr>
                      @foreach($kegiatan['paket'] as $paket)
                          <tr>
                              <td></td>
                              <td></td>
                              <td></td>
                              <td>{{ $paket['nama_paket'] }}</td>
                              <td>{{ number_format($paket['jumlah_uang'], 0, ',', '.') }}</td>
                          </tr>
                      @endforeach
                  @endforeach
              @endforeach
          @endforeach
      </tbody>
      <tfoot>
        <tr class="table-success">
            <td colspan="4" class="text-right"><strong>Total Keseluruhan Anggaran</strong></td>
            <td><strong>{{ number_format($totalKeseluruhan, 0, ',', '.') }}</strong></td>
        </tr>
    </tfoot>
  </table>

    <!-- Grafik -->
    <div class="row mt-5">
        <div class="col-md-6">
            <h4 class="text-center">Distribusi Anggaran per Bidang</h4>
            <canvas id="chartBidang"></canvas>
        </div>
        <div class="col-md-6">
            <h4 class="text-center">Distribusi Anggaran per Sub Bidang</h4>
            <canvas id="chartSubBidang"></canvas>
        </div>
    </div>
    <div class="row mt-5">
        <div class="col-md-6">
            <h4 class="text-center">Distribusi Anggaran per Kegiatan</h4>
            <canvas id="chartKegiatan"></canvas>
        </div>
        <div class="col-md-6">
            <h4 class="text-center">Distribusi Anggaran per Paket</h4>
            <canvas id="chartPaket"></canvas>
        </div>
    </div>
</div>

<<!-- Script untuk Chart.js -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
    // Data untuk grafik
    const grafikData = @json($grafikData);

    // Warna untuk grafik
    const backgroundColors = [
        '#FF6384', '#36A2EB', '#FFCE56', '#4BC0C0', '#9966FF', '#FF9F40',
        '#FF8A80', '#7E57C2', '#26A69A', '#D4E157', '#FF7043', '#8D6E63'
    ];

    // Grafik Bidang
    new Chart(document.getElementById('chartBidang'), {
        type: 'pie',
        data: {
            labels: grafikData.bidang.map(item => item.label),
            datasets: [{
                data: grafikData.bidang.map(item => item.total),
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

    // Grafik Sub Bidang
    new Chart(document.getElementById('chartSubBidang'), {
        type: 'pie',
        data: {
            labels: grafikData.sub_bidang.map(item => item.label),
            datasets: [{
                data: grafikData.sub_bidang.map(item => item.total),
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

    // Grafik Kegiatan
    new Chart(document.getElementById('chartKegiatan'), {
        type: 'pie',
        data: {
            labels: grafikData.kegiatan.map(item => item.label),
            datasets: [{
                data: grafikData.kegiatan.map(item => item.total),
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

    // Grafik Paket
    new Chart(document.getElementById('chartPaket'), {
        type: 'bar',
        data: {
            labels: grafikData.paket.map(item => item.label),
            datasets: [{
                label: 'Jumlah Uang (Rp)',
                data: grafikData.paket.map(item => item.total),
                backgroundColor: backgroundColors,
            }]
        },
        options: {
            responsive: true,
            plugins: {
                legend: {
                    position: 'bottom'
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


