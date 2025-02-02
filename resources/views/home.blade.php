@extends('layouts.guest')

@section('content')
@push('styles')
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/odometer.js/0.4.7/themes/odometer-theme-default.css" integrity="sha512-kMPqFnKueEwgQFzXLEEl671aHhQqrZLS5IP3HzqdfozaST/EgU+/wkM07JCmXFAt9GO810I//8DBonsJUzGQsQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />

<style>
  .headerContainer {
    background: rgb(13, 6, 129);
    background: linear-gradient(180deg, rgba(13, 6, 129, 1) 0%, rgba(62, 62, 177, 1) 57%, rgba(0, 122, 172, 1) 100%);
    width: 100%;
  }

  .main-card {
    color: white;
    border-radius: 0.5rem;
    padding: 1.5rem;
  }

  .info-card {
    background: #fff;
    border-radius: 15px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    padding: 20px 30px;
    width: 400px;
    /* smooth */
    transition: all 0.3s ease;
  }

  .info-card:hover {
    box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
    transform: scale(1.02)
  }

  .info-card p {
    margin: 0;
    color: #7a7a7a;
    font-size: 14px;
  }

  .info-card h1 {
    margin: 10px 0;
    font-size: 24px;
    font-weight: 600;
    color: #70A6E8;
  }

  .progress-container {
    display: flex;
    align-items: center;
    margin-top: 20px;
    transition: all 0.3s ease;
  }

  .progress {
    flex: 1;
    height: 8px;
    background: #f0f0f0;
    border-radius: 10px;
    margin: 0 10px;
    overflow: hidden;
  }

  .progress-container:hover {
    /* box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1); */
    transform: scale(1.02)
  }

  .progress-bar {
    background-color: #70A6E8;
  }

  .icon {
    display: flex;
    align-items: center;
    justify-content: center;
    width: 30px;
    height: 30px;
    background: #eaf2ff;
    border-radius: 50%;
    font-size: 14px;
    font-weight: bold;
    color: #7a7a7a;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
  }

  .note {
    font-size: 12px;
    color: #7a7a7a;
    margin-top: 10px;
  }

  .subtitle {
    font-size: 18px;
    font-weight: 600;
    color: #70A6E8;
  }

  .transitionIn {
    opacity: 0;
    transform: translateY(20px);
    animation: scroll-in 3s forwards;
  }


  @keyframes scroll-in {
    0% {
      opacity: 0;
      transform: translateY(20px);
    }

    100% {
      opacity: 1;
      transform: translateY(0);
    }
  }



</style>
@endpush

{{-- content --}}
{{-- jika desa == null maka tampilkan modal untuuk pilih desa, jika tidak maka tampilkan yang dibawah --}}
@if($desa == null)
  <div class="" style="height: 100vh; display: flex; justify-content: center; align-items: center">
    <div class="text-center">
      <h1>Anda belum memilih desa</h1>
      <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modalPilihDesa">Pilih Desa</button>
    </div>

  </div>
<div class="modal fade" id="modalPilihDesa" tabindex="-1" aria-labelledby="modalPilihDesaLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <form action="{{ route('pilihDesa')}}" method="POST">
        @csrf
        <div class="modal-header">
          <h5 class="modal-title" id="modalPilihDesaLabel">Pilih Desa</h5>
        </div>
        <div class="modal-body">
          <div class="mb-3">
            <label for="desa" class="form-label">Desa</label>
            <select class="selectpicker form-control" name="desa" id="desa" required>
              <option value="">Pilih Desa</option>
              @foreach($listDesa as $item)
              <option value="{{ $item->id }}">{{ $item->nama }}</option>
              @endforeach
            </select>
          </div>
        </div>
        <div class="modal-footer">
          <button type="submit" class="btn btn-primary">Pilih</button>
        </div>
      </form>

    </div>
  </div>
</div>

<script>
  document.addEventListener('DOMContentLoaded', function() {
    const modalPilihDesa = new bootstrap.Modal(document.getElementById('modalPilihDesa'), {
      keyboard: false
    });

    modalPilihDesa.show();
  })
</script>
@else
<main class="headerContainer pb-5">
  <div class="container">
    <!-- Header -->
    <div class="main-card text-center">
      <h4>Selamat Datang Di</h4>
      <div class="justify-content-center align-items-center">
        <h1 style="font-weight: 600">Sistem Keuangan Desa</h1>
        <h4>{{ $daerah->nama }}, {{ $daerah->kabupaten_nama }}, Provinsi {{ $daerah->provinsi_nama }}</h4>
      </div>
    </div>

    <!-- Highlight Info Box -->
    <div class="row mt-4">
      <div class="col-md-4 mb-3">
        <div class="info-box transitionIn bg-primary text-white text-center p-3 rounded">
          <h5>Total Seluruh Anggaran</h5>
          <p class="h2">Rp  {{ number_format($totalUang, 0,'.',',') }}</p>
        </div>
      </div>
      <div class="col-md-4 mb-3">
        <div class="info-box transitionIn bg-success text-white text-center p-3 rounded">
          <h5>Total Seluruh Kegiatan</h5>
          <p class="h2">{{ $kegiatanCount }}</p>
        </div>
      </div>
      <div class="col-md-4 mb-3">
        <div class="info-box transitionIn bg-warning text-white text-center p-3 rounded">
          <h5>Laporan Keuangan</h5>
          <p class="h2">{{ $tahunCount }} Tahun</p>
        </div>
      </div>
    </div>

    <!-- Informasi Anggaran & Pencairan -->
    <div class="row mt-2 pb-5">
      <div class="col-md-6 mb-3">
        <div class="text-center text-white transitionIn">
          <h5>Total Pagu Anggaran {{ now()->year }}</h5>
          <div class="d-flex align-items-center justify-content-center">
            <p class="h1">Rp</p>
            <div class="pagu-odometer h1 ml-2">0</div>
          </div>
        </div>
      </div>
      <div class="col-md-6 mb-3 transitionIn" style="border-left:white 1px solid">
        <div class="text-center text-white">
          <h5>Total Capaian Pencairan {{ now()->year }}</h5>
          <div class="d-flex align-items-center justify-content-center">
            <p class="h1">Rp</p>
            <div class="capaian-odometer h1 ml-2">0</div>
          </div>
        </div>
      </div>
    </div>
  </div>
</main>

<!-- Progres Capain Pencairan -->
<div class="info-card mx-auto transitionIn" style="margin-top: -4rem; width:70%; border:rgba(0,122,172,0.7) 3px solid">
  <p>Capain Pencairan {{ now()->year }}</p>
  <div class="progress-container">
    <div class="icon">%</div>
    <div class="progress" style="height: 20px;">
      <div class="progress-bar" role="progressbar" style="width: 0%" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
    </div>
    <div class="d-flex align-items-center justify-content-center">
      <p class="h2 persentase-odometer" style="font-size:18px">0</p>
      <div style="color: rgba(0, 172, 89, 0.7); font-size:12px; margin-left:2px">%</div>
    </div>
  </div>
</div>

<!-- Pendapatan Desa -->
<div class="bagian-pendapatan container mt-5 watch">
  <h1>Pendapatan Desa</h1>
  <table class="table table-bordered mt-4">
    <thead class="" style="background: #70A6E8; color:white">
      <tr>
        <th>No</th>
        <th>Sumber Pendapatan</th>
        <th>Anggaran (Rp)</th>
        <th>Total Realisasi (Rp)</th>
        <th>Persentase (%)</th>
      </tr>
    </thead>
    <tbody>
      @php
      $totalAnggaran = 0;
      $totalRealisasi = 0;
      @endphp
      @foreach($data->pendapatanDesa as $pendapatan)
      @php
      $totalAnggaran += $pendapatan->anggaran;
      $totalRealisasi += $pendapatan->realisasi;
      @endphp
      <tr>
        <td>{{ $loop->iteration }}</td>
        <td>{{ $pendapatan->sumber_pendapatan }}</td>
        <td>{{ number_format($pendapatan->anggaran, 0, ',', '.') }}</td>
        <td>{{ number_format($pendapatan->realisasi, 0, ',', '.') }}</td>
        <td>{{ $pendapatan->realisasi / $pendapatan->anggaran * 100 }}%</td>
      </tr>
      @endforeach
    </tbody>
    <tfoot>
      <tr class="table-secondary">
        <td colspan="2" class="text-center font-weight-bold">Total</td>
        <td>{{ number_format($totalAnggaran, 0, ',', '.') }}</td>
        <td>{{ number_format($totalRealisasi, 0, ',', '.') }}</td>
        <td>{{ $totalRealisasi / $totalAnggaran * 100 }}%</td>
      </tr>
    </tfoot>
  </table>

  <div class="">
    <a href="{{ route('anggaran.pendapatan', ['tahun' => now()->year, 'desa' => request('desa')]) }}" class="button button-info">> Lihat Penganggaran Sumber Dana</a>
  </div>

  <!-- Chart -->
  <div style="width: 100%; margin: auto" class="watch">
    <h1 class="text-center subtitle my-5">Grafik Sumber Dana Desa</h1>
    <div class="d-flex">
      <div style="width: 600px;">
        <canvas id="chart-anggaran-desa"></canvas>
      </div>
      <div style="margin: 0 30px; border-left:rgba(0,122,172,0.7) 1px solid"></div>
      <div style="width: 600px;">
        <canvas id="chart-realisasi-desa"></canvas>
      </div>
    </div>
    <div class="note">
      * Persentase adalah hasil bagi dari dana setiap sumber dibagi total keseluruhan
    </div>
  </div>
</div>  

{{-- Menampilkan list total anggaran dan realisasi pertahun --}}
<div class="container mt-5">
  <h1 class="text-center">Total Anggaran dan Realisasi Setiap Tahun</h1>
  <table class="table table-bordered mt-4">
    <thead class="" style="background: #70A6E8; color:white">
      <tr>
        <th>Tahun</th>
        <th>Total Pagu Anggaran (Rp)</th>
        <th>Total Realisasi (Rp)</th>
        <th>Persentase (%)</th>
      </tr>
    </thead>
    <tbody>
      @foreach($data->totalAnggaranRealiasiPerTahun as $item)
      <tr>
        <td>{{ $item->tahun }}</td>
        <td>{{ number_format($item->total_anggaran, 0, ',', '.') }}</td>
        <td>{{ number_format($item->total_realisasi, 0, ',', '.') }}</td>
        <td>
          {{ $item->total_anggaran != 0 ? number_format(($item->total_realisasi / $item->total_anggaran) * 100, 1, '.', '') : 0 }}%
        </td>
      </tr>
      @endforeach
    </tbody>
  </table>
</div>

{{-- bar chart  --}}

<div class="container mt-5">
  <h1 class="text-center subtitle my-5">Grafik Sumber Dana Desa Setiap Tahun</h1>
  <div class="d-flex justify-content-center align-items-center mt-5">
    <div class="" style="width:800px; margin-right: 20px">
      <canvas id="chart-anggaran-desa-per-tahun"></canvas>
    </div>
    <div class="" style="width:800px; margin-left: 20px">
      <canvas id="chart-realisasi-desa-per-tahun"></canvas>
    </div>
  </div>
</div>





{{-- end content --}}

{{-- Script --}}


<script src="https://cdnjs.cloudflare.com/ajax/libs/odometer.js/0.4.7/odometer.min.js" integrity="sha512-v3fZyWIk7kh9yGNQZf1SnSjIxjAKsYbg6UQ+B+QxAZqJQLrN3jMjrdNwcxV6tis6S0s1xyVDZrDz9UoRLfRpWw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>


<script>
  // animate odometer
  const paguValue = {{ $data->totalPaguAnggaran }}
  const capaianValue = {{ $data->totalRealisasi }}
  const persentase = Math.round((capaianValue / paguValue) * 100)
  const createOdometer = (el, val) => {
    const odometer = new Odometer({
      el: el,
      val: 0,
    })

    odometer.update(val);
  }
  const paguOdometer = document.querySelector('.pagu-odometer')
  createOdometer(paguOdometer, paguValue)

  const capaianOdometer = document.querySelector(".capaian-odometer")
  createOdometer(capaianOdometer, capaianValue)

  const persentaseOdometer = document.querySelector(".persentase-odometer")
  createOdometer(persentaseOdometer, persentase)



  // animate progress bar
  const progress = document.querySelector('.progress-bar')

  var width = 1;
  var intervalBar = setInterval(updateBar, 10);

  function updateBar() {
    if (width >= persentase) {
      clearInterval(intervalBar);
    } else {
      width += 1;
      progress.style.width = width + '%';
      progress.setAttribute('aria-valuenow', Math.round(width));
    }

  }
</script>


@push('scripts')
<script>
  // chart
  document.addEventListener('DOMContentLoaded', function() {
  var data = @json($data->pendapatanDesa);
  var labels = data.map(item => item.sumber_pendapatan);
  var anggaran = data.map(item => item.anggaran);
  const realisasi = data.map(item => item.realisasi);

  const totalAnggaran = {{ $totalAnggaran }};  // Pastikan nilai totalAnggaran tersedia
  const totalRealisasi = {{ $totalRealisasi }};  // Pastikan nilai totalRealisasi tersedia

  var ctx = document.getElementById('chart-anggaran-desa').getContext("2d");
  const myChart = new Chart(ctx, {
    type: 'bar',
    data: {
      labels: labels,
      datasets: [{
        label: 'Anggaran',
        data: anggaran,
        backgroundColor: 'rgba(255, 99, 132, 0.2)',
        borderColor: 'rgba(255, 99, 132, 1)',
        borderWidth: 1,
      }],
    },
    options: {
      scales: {
        y: {
          beginAtZero: true,
        },
      },
      plugins: {
        tooltip: {
          enabled: false,  // Menonaktifkan tooltip agar tidak mengganggu
        }
      },
      animation: {
        duration: 1,
        onComplete: function () {
          const ctx = this.ctx;
          ctx.font = Chart.helpers.fontString(Chart.defaults.font.size, Chart.defaults.font.style, Chart.defaults.font.family);
          ctx.textAlign = 'center';
          ctx.textBaseline = 'bottom';

          // Menambahkan persentase di atas bar
          this.data.datasets.forEach((dataset, i) => {
            if (this.isDatasetVisible(i)) {
              const meta = this.getDatasetMeta(i);
              meta.data.forEach((bar, index) => {
                let dataValue = dataset.data[index];
                let percentage = 0;

                if (dataset.label === 'Anggaran') {
                  percentage = (dataValue / totalAnggaran) * 100;
                } else if (dataset.label === 'Realisasi') {
                  percentage = (dataValue / totalRealisasi) * 100;
                }

                // Menampilkan persentase di atas bar
                ctx.fillText(percentage.toFixed(2) + '%', bar.x, bar.y - 5);  // Membulatkan 2 angka desimal
              });
            }
          });
        }
      }
    }
  });

  var ctx = document.getElementById('chart-realisasi-desa').getContext("2d");
  const myChart2 = new Chart(ctx, {
    type: 'bar',
    data: {
      labels: labels,
      datasets: [{
        label: 'Realisasi',
        data: realisasi,
        backgroundColor: 'rgba(54, 162, 235, 0.2)',
        borderColor: 'rgba(54, 162, 235, 1)',
        borderWidth: 1,
      }],
    },
    options: {
      scales: {
        y: {
          beginAtZero: true,
        },
      },
      plugins: {
        tooltip: {
          enabled: false,  // Menonaktifkan tooltip agar tidak mengganggu
        }
      },
      animation: {
        duration: 1,
        onComplete: function () {
          const ctx = this.ctx;
          ctx.font = Chart.helpers.fontString(Chart.defaults.font.size, Chart.defaults.font.style, Chart.defaults.font.family);
          ctx.textAlign = 'center';
          ctx.textBaseline = 'bottom';

          // Menambahkan persentase di atas bar
          this.data.datasets.forEach((dataset, i) => {
            if (this.isDatasetVisible(i)) {
              const meta = this.getDatasetMeta(i);
              meta.data.forEach((bar, index) => {
                let dataValue = dataset.data[index];
                let percentage = 0;

                if (dataset.label === 'Anggaran') {
                  percentage = (dataValue / totalAnggaran) * 100;
                } else if (dataset.label === 'Realisasi') {
                  percentage = (dataValue / totalRealisasi) * 100;
                }

                // Menampilkan persentase di atas bar
                ctx.fillText(percentage.toFixed(2) + '%', bar.x, bar.y - 5);  // Membulatkan 2 angka desimal
              });
            }
          });
        }
      }
    }
  });

  // barchart
  var ctx = document.getElementById('chart-anggaran-desa-per-tahun').getContext('2d');
  data = @json($data->totalAnggaranRealiasiPerTahun);
  labels = data.map(item => item.tahun);
  values = data.map(item => item.total_anggaran);
  const backgroundColors = [
    '#FF6384', '#36A2EB', '#FFCE56', '#4BC0C0', '#9966FF', '#FF9F40'
  ];

  new Chart(ctx, {
    type: 'bar',
    data: {
      labels: labels,
      datasets: [{
        label: 'Total Anggaran',
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

  values = data.map(item => item.total_realisasi);
  var ctx = document.getElementById('chart-realisasi-desa-per-tahun').getContext('2d');
  new Chart(ctx, {
    type: 'bar',
    data: {
      labels: labels,
      datasets: [{
        label: 'Total Realisasi',
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



});
</script>

<script>
  // animate scroll
  const watchs = document.querySelectorAll('.watch');
  
  function obCallback(entries, observer){
    entries.filter((e) => e.isIntersecting).forEach((entry) => {
      entry.target.classList.add('transitionIn');
      observer.unobserve(entry.target);
    })
  }


  let ob = new IntersectionObserver(obCallback);
  watchs.forEach(watch => {
    ob.observe(watch);
  })


</script>
@endpush
@endif
@endsection   