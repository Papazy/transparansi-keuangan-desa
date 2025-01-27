@extends('layouts.zircos')

@section('content')
<div class="container">
    <div class="row">
        <div class="col-xs-12">
            <div class="page-title-box">
                <h4 class="page-title">{{ __('Paket Kegiatan') }} - {{ Auth::user()->desa->nama }}</h4>
                <ol class="breadcrumb p-0 m-0">
                    <li>
                        <a href="/">{{ __('Beranda') }}</a>
                    </li>
                    <li>
                        <a href="/">{{ __('Paket Kegiatan') }} </a>
                    </li>
                    <li class="active">
                        {{ __('Paket Kegiatan') }}
                    </li>
                </ol>
                <div class="clearfix"></div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-sm-12">
            <div class="card-box">
                <h4 class="m-t-0 header-title"><b>{{ __('Tambah Data') }}</b></h4>
                <p class="text-muted m-b-30 font-13">
                    {{ __('Tambah Data Paket') }}
                </p>

                <div class="row">
                    <div class="col-md-12">
                        {!! Form::open(['route' => ['penganggaran.paket.kegiatan.store', 'kegiatan' => $kegiatan->id], 'autocomplete' => 'off', 'enctype' => 'multipart/form-data']) !!}
                        @include('penganggaran_paket_kegiatan.form')
                        <button class="btn btn-primary" type="submit"><i class="mdi mdi-content-save"></i> {{ __('Simpan') }}</button>
                        <a href="{{ route('penganggaran.paket.kegiatan.index', ['kegiatan' => $kegiatan->id]) }}" class="btn-danger btn">{{ __('Kembali') }}</a>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- end row -->

</div> <!-- container -->
@endsection

@section('styles')
@stop

@section('javascript')
@stop