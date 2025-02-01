@extends('layouts.guest')

<style>

.transitionIn {
  animation: transitionIn 1s ease-in-out;
  opacity: 1;
  transform: translateY(0px);
}

@keyframes transitionIn {
  from  {
    opacity: 0;
    transform: translateY(20px);
  }
  to {
    opacity: 1;
    transform: translateY(0px);
  }
}

</style>

@section('content')
<div class="container mt-5">
    <div class="text-center mb-5">
        <h1 class="font-weight-bold text-primary">Tentang Desa</h1>
        <p class="text-muted">Profil lengkap tentang Gampong Mulieng, Kabupaten Meureudu</p>
    </div>
    <div class="d-flex">

        <div class="card shadow-sm mb-4 border-0 transitionInOnScroll">
            <div class="card-body">
                <h3 class="card-title text-secondary">Profil Desa</h3>
                <p>Gampong Mulieng merupakan salah satu Gampong yang terletak di Kabupaten Meureudu, Aceh. Gampong ini memiliki populasi sekitar 2.500 jiwa dengan mayoritas penduduk berprofesi sebagai petani, nelayan, dan pedagang.</p>
            </div>
        </div>
        {{-- gambar --}}
        <div class="card shadow-sm mb-4 border-0 transitionInOnScroll ml-5 " style="width: 1000px;  height: 200px;">
            <img src="https://pidiejayakab.go.id/media/2024.09/kantor_bupati_21.png" class="card-img-top" style="height:200px; object-fit:cover;" alt="Gampong Mulieng">
        </div>
    </div>

    <div class="card shadow-sm mb-4 border-0 transitionInOnScroll">
        <div class="card-body">
            <h3 class="card-title text-secondary">Visi dan Misi</h3>
            <h5 class="text-primary">Visi:</h5>
            <p class="fst-italic">"Menjadikan Gampong Mulieng sebagai Gampong yang mandiri, sejahtera, dan berdaya saing berbasis pertanian dan ekonomi kreatif."</p>
            <h5 class="text-primary">Misi:</h5>
            <ul class="list-group list-group-flush">
                <li class="list-group-item">Meningkatkan kualitas pendidikan dan kesehatan masyarakat.</li>
                <li class="list-group-item">Mengembangkan sektor pertanian berbasis teknologi.</li>
                <li class="list-group-item">Mendorong UMKM dan industri kreatif lokal.</li>
                <li class="list-group-item">Meningkatkan infrastruktur dan akses transportasi.</li>
            </ul>
        </div>
    </div>

    <div class="card shadow-sm mb-4 border-0 transitionInOnScroll">
        <div class="card-body">
            <h3 class="card-title text-secondary">Struktur Pemerintahan Gampong</h3>
            <table class="table table-bordered">
                <thead class="bg-primary text-white">
                    <tr>
                        <th>Jabatan</th>
                        <th>Nama</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Keuchik</td>
                        <td>Muhammad Ridwan</td>
                    </tr>
                    <tr>
                        <td>Sekretaris Gampong</td>
                        <td>Ahmad Fauzi</td>
                    </tr>
                    <tr>
                        <td>Kaur Keuangan</td>
                        <td>Siti Aisyah</td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
    <div class="d-flex">

        <div class="card shadow-sm mb-4 border-0 transitionInOnScroll mr-5">
            <div class="card-body">
                <h3 class="card-title text-secondary text-center">Kontak</h3>
                <div class="table-responsive">
                    <table class="table table-bordered align-middle">
                        <tbody>
                            <tr>
                                <td class="fw-bold text-secondary"><i class="fas fa-map-marker-alt"></i> Alamat</td>
                                <td>Gampong Mulieng, Kecamatan Peusangan, Kabupaten Meureudu, Aceh</td>
                            </tr>
                            <tr>
                                <td class="fw-bold text-secondary"><i class="fas fa-envelope"></i> Email</td>
                                <td><a href="mailto:Gampong.Mulieng@example.com" class="text-decoration-none">Gampong.Mulieng@example.com</a></td>
                            </tr>
                            <tr>
                                <td class="fw-bold text-secondary"><i class="fas fa-phone"></i> Telepon</td>
                                <td><a href="tel:+6281312345678" class="text-decoration-none">+62 813 1234 5678</a></td>
                            </tr>
                        </tbody>
                    </table>
                    {{-- button to kunjungi maps --}}
                    <div class="text-center">
                        <a href="https://maps.app.goo.gl/Cj45mbeUUjci3gPp7" class="btn btn-primary mt-3" target="_blank">Kunjungi Maps</a>
                    </div>
                </div>
            </div>
            
        </div>
        <div class="card shadow-sm mb-4 border-0 transitionInOnScroll">
            <div class="card-body text-center">
                <h3 class="card-title text-secondary text-center">Maps</h3>
                <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d7946.555117510357!2d96.21327313920358!3d5.219020163432318!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3040ba9504c252a1%3A0x3f6607a5706461c!2sMns%20Mulieng%2C%20Kec.%20Meureudu%2C%20Kabupaten%20Pidie%20Jaya%2C%20Aceh!5e0!3m2!1sid!2sid!4v1738336050457!5m2!1sid!2sid" width="450" height="300" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
        </div>
        </div>
    </div>
    </div>
@endsection

<script>
    document.addEventListener('DOMContentLoaded', function() {

      const observerCallback = (entries, observer) =>{
        entries.forEach(entry => {
          if (entry.isIntersecting) {
            entry.target.classList.add('transitionIn');
            observer.unobserve(entry.target);
          }
        })
      }

      const watchElements = document.querySelectorAll('.transitionInOnScroll');
      const observer = new IntersectionObserver(observerCallback);
      
      watchElements.forEach(element => {
        observer.observe(element);
      });


    });
</script>