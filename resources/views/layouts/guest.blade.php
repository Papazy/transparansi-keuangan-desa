<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <!-- CSRF Token -->
  <meta name="csrf-token" content="{{ csrf_token() }}">

  <title>{{ config('app.name', 'Laravel') }}</title>

  <!-- Scripts -->
  <script src="{{ asset('js/app.js') }}" defer></script>

  <!-- Fonts -->
  <link rel="dns-prefetch" href="//fonts.gstatic.com">
  <link href="https://fonts.googleapis.com/css?family=Nunito:400,600,700" rel="stylesheet">

  @stack('styles')
  <!-- Styles -->
  <link href="{{ asset('css/app.css') }}" rel="stylesheet">
  <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.2/css/bootstrap.css" rel="stylesheet">

  <link href="https://cdn.datatables.net/2.2.1/css/dataTables.bootstrap4.css" rel="stylesheet">


  <style>
    .navbar {
      background: rgb(13, 6, 129);
      color: white;
    }

    .login {
      border: 1px solid white;
      border-radius: 20px;
      padding: 2px 15px;
    }

    .nav-item:hover {
      background-color: rgb(9, 5, 88);
      color: black;
      border-radius: 20px
    }
    .nav-item {
  position: relative;
}

.nav-link {
  text-decoration: none;
  padding: 10px 15px;
  color: #007bff;
  display: inline-block;
}

.submenu {
  display: none;
  position: absolute;
  top: 100%;
  left: 0;
  background-color: #ffffff;
  padding: 15px;
  border-radius: 8px;
  box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);
  z-index: 1000;
  display: flex;
  gap: 20px; /* Jarak antar kategori */
}

.nav-item:hover .submenu {
  display: flex;
}

.submenu-category {
  list-style: none;
  width: 150px;
}

.category-title {
  font-weight: bold;
  color: #007bff;
  margin-bottom: 8px;
  display: block;
}

.submenu-category ul {
  padding: 0;
  margin: 0;
  list-style: none;
}

.submenu-category ul li {
  margin-bottom: 5px;
}

.submenu-category ul li a {
  color: ##007bff;
  text-decoration: none;
}

.submenu-category ul li a:hover {
  color: #007bff;
}

  </style>
</head>
<body>
  <div id="">

    {{-- Navbar --}}
    <nav class="navbar navbar-expand-md align-items-center" style="color: white;">
      <div class="container">
        <a class="navbar-brand font-weight-bold" href="{{ url('/') }}" style="color: white">
          SIKEUDES
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="{{ __('Toggle navigation') }}">
          <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <!-- Left Side Of Navbar -->
          <ul class="navbar-nav mr-auto">

          </ul>

          <!-- Right Side Of Navbar -->
          <ul class="navbar-nav ml-auto d-flex align-items-center" style="color: white;">
            <li class="nav-item mr-4">
              <a class="nav-link" href="{{ route('login') }}" style="color: white;">Beranda</a>
            </li>
            <li class="nav-item mr-4">
              <div class="nav-link"  style="color: white; ">Anggaran</div>
              <ul class="submenu" style="display: none;">
                <li class="submenu-category">
                  <span class="category-title">Rincian Anggaran</span>
                  <ul>
                    <li><a href="#">Belanja</a></li>
                    <li><a href="#">Bidang</a></li>
                    <li><a href="#">Kegiatan</a></li>
                  </ul>
                </li>
                <li class="submenu-category">
                  <span class="category-title">Realisasi Anggaran</span>
                  <ul>
                    <li><a href="#">Belanja</a></li>
                    <li><a href="#">Bidang</a></li>
                    <li><a href="#">Kegiatan</a></li>
                  </ul>
                </li>
               
              </ul>
            </li>
            <li class="nav-item mr-4  ">
              <a class="nav-link" href="{{ route('login') }}" style="color: white;">Menu 1</a>
              {{-- create submenu --}}
              <ul class="submenu" style="display: none;">
                <li><a href="#">Submenu 1</a></li>
                <li><a href="#">Submenu 2</a></li>
                <li><a href="#">Submenu 3</a></li>
              </ul>
            </li>
            <li class="nav-item login" style="border: 1px solid white; border-radius: 20px; padding: 2px 15px;">
              <a class="nav-link" href="{{ route('login') }}" style="color: white;">{{ __('auth.login') }}</a>
            </li>
          </ul>
        </div>
      </div>
    </nav>

    <main class="">
      @yield('content')
    </main>



    {{-- footer --}}

  </div>
  <!-- Remove the container if you want to extend the Footer to full width. -->
  <div class="">
    <!-- Footer -->
    <footer class="text-center text-white" style="background-color: #3f51b5">
      <!-- Grid container -->
      <div class="container">
        <!-- Section: Links -->
        <section class="mt-5">
          <!-- Grid row-->
          <div class="row text-center d-flex justify-content-center pt-5">
            <!-- Grid column -->
            <div class="col-md-2">
              <h6 class="text-uppercase font-weight-bold">
                <a href="#!" class="text-white">About us</a>
              </h6>
            </div>
            <!-- Grid column -->

            <!-- Grid column -->
            <div class="col-md-2">
              <h6 class="text-uppercase font-weight-bold">
                <a href="#!" class="text-white">Products</a>
              </h6>
            </div>
            <!-- Grid column -->

            <!-- Grid column -->
            <div class="col-md-2">
              <h6 class="text-uppercase font-weight-bold">
                <a href="#!" class="text-white">Awards</a>
              </h6>
            </div>
            <!-- Grid column -->

            <!-- Grid column -->
            <div class="col-md-2">
              <h6 class="text-uppercase font-weight-bold">
                <a href="#!" class="text-white">Help</a>
              </h6>
            </div>
            <!-- Grid column -->

            <!-- Grid column -->
            <div class="col-md-2">
              <h6 class="text-uppercase font-weight-bold">
                <a href="#!" class="text-white">Contact</a>
              </h6>
            </div>
            <!-- Grid column -->
          </div>
          <!-- Grid row-->
        </section>
        <!-- Section: Links -->

        <hr class="my-5" />

        <!-- Section: Text -->
        <section class="mb-5">
          <div class="row d-flex justify-content-center">
            <div class="col-lg-8">
              <p>
                SIKEDEUS adalah sebuah aplikasi yang dibuat untuk memudahkan pengelolaan administrasi desa secara digital, sehingga dapat meningkatkan efisiensi dan transparansi dalam pelayanan kepada masyarakat.
              </p>
            </div>
          </div>
        </section>
        <!-- Section: Text -->

        <!-- Section: Social -->
        <section class="text-center mb-5">
          <a href="" class="text-white me-4">
            <i class="fab fa-facebook-f"></i>
          </a>
          <a href="" class="text-white me-4">
            <i class="fab fa-twitter"></i>
          </a>
          <a href="" class="text-white me-4">
            <i class="fab fa-google"></i>
          </a>
          <a href="" class="text-white me-4">
            <i class="fab fa-instagram"></i>
          </a>
          <a href="" class="text-white me-4">
            <i class="fab fa-linkedin"></i>
          </a>
          <a href="" class="text-white me-4">
            <i class="fab fa-github"></i>
          </a>
        </section>
        <!-- Section: Social -->
      </div>
      <!-- Grid container -->

      <!-- Copyright -->
      <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.2)">
        © 2025 SIKEUDES by
        <a class="text-white" href="https://instagram.com/">KesyaAlia</a>

      </div>
      <!-- Copyright -->
    </footer>
    <!-- Footer -->
  </div>
  <!-- End of .container -->
</body>


<script src="https://cdn.jsdelivr.net/npm/chart.js@4.0.1/dist/chart.umd.js"></script>

<script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels@2.1.0/dist/chartjs-plugin-datalabels.min.js"></script>

<script src="https://code.jquery.com/jquery-3.7.1.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.2/js/bootstrap.min.js"></script>

<script src="https://cdn.datatables.net/2.2.1/js/dataTables.js"></script>

<script src="https://cdn.datatables.net/2.2.1/js/dataTables.bootstrap4.js"></script>

@stack('scripts')

<script>

  $(document).ready(function() {


    $('.nav-item').hover(function() {
      $(this).find('.submenu').first().stop(true, true).slideDown(300);
    }, function() {
      $(this).find('.submenu').first().stop(true, true).slideUp(300);
    });

  });

</script>



</html>
