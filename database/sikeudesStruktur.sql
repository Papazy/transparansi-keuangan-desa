-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 01, 2025 at 12:34 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sikeudes`
--

-- --------------------------------------------------------

--
-- Table structure for table `bidang`
--

CREATE TABLE `bidang` (
  `id` char(36) NOT NULL,
  `kode` varchar(2) DEFAULT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `desa`
--

CREATE TABLE `desa` (
  `id` char(36) NOT NULL,
  `id_kecamatan` char(36) DEFAULT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `kode` varchar(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kabupaten`
--

CREATE TABLE `kabupaten` (
  `id` char(36) NOT NULL,
  `id_provinsi` char(36) DEFAULT NULL,
  `kode` varchar(2) DEFAULT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kaur_keuangan`
--

CREATE TABLE `kaur_keuangan` (
  `id` char(36) NOT NULL,
  `id_desa` char(36) DEFAULT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `jabatan` varchar(100) DEFAULT NULL,
  `aktif` enum('Ya','Tidak') NOT NULL DEFAULT 'Tidak',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kecamatan`
--

CREATE TABLE `kecamatan` (
  `id` char(36) NOT NULL,
  `id_kabupaten` char(36) DEFAULT NULL,
  `kode` varchar(2) DEFAULT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kegiatan`
--

CREATE TABLE `kegiatan` (
  `id` char(36) NOT NULL,
  `id_sub_bidang` char(36) DEFAULT NULL,
  `kode` varchar(2) DEFAULT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kepala_desa`
--

CREATE TABLE `kepala_desa` (
  `id` char(36) NOT NULL,
  `id_desa` char(36) DEFAULT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `jabatan` varchar(100) DEFAULT NULL,
  `tanggal_mulai_jabatan` date DEFAULT NULL,
  `tanggal_akhir_jabatan` date DEFAULT NULL,
  `aktif` enum('Ya','Tidak') NOT NULL DEFAULT 'Tidak',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pelaksana_kegiatan`
--

CREATE TABLE `pelaksana_kegiatan` (
  `id` char(36) NOT NULL,
  `id_desa` char(36) DEFAULT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `jabatan` varchar(100) DEFAULT NULL,
  `aktif` enum('Ya','Tidak') NOT NULL DEFAULT 'Tidak',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `penganggaran_belanja`
--

CREATE TABLE `penganggaran_belanja` (
  `id` char(36) NOT NULL,
  `id_penganggaran_tahun` char(36) DEFAULT NULL,
  `id_penganggaran_kegiatan` char(36) DEFAULT NULL,
  `id_rekening_objek` char(36) DEFAULT NULL,
  `id_sumber_dana` char(36) DEFAULT NULL,
  `uraian` varchar(50) DEFAULT NULL,
  `volume` int(10) UNSIGNED DEFAULT 0,
  `satuan` varchar(255) DEFAULT NULL,
  `harga_satuan` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `penganggaran_bidang`
--

CREATE TABLE `penganggaran_bidang` (
  `id` char(36) NOT NULL,
  `id_desa` char(36) DEFAULT NULL,
  `id_bidang` char(36) DEFAULT NULL,
  `id_penganggaran_tahun` char(36) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `penganggaran_kegiatan`
--

CREATE TABLE `penganggaran_kegiatan` (
  `id` char(36) NOT NULL,
  `id_penganggaran_sub_bidang` char(36) DEFAULT NULL,
  `id_kegiatan` char(36) DEFAULT NULL,
  `id_pelaksana` char(36) DEFAULT NULL,
  `lokasi` varchar(100) DEFAULT NULL,
  `waktu_pelaksanaan` varchar(100) DEFAULT NULL,
  `pagu` bigint(20) DEFAULT 0,
  `keluaran` varchar(255) DEFAULT NULL,
  `volume` int(10) UNSIGNED DEFAULT NULL,
  `satuan` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `penganggaran_paket_kegiatan`
--

CREATE TABLE `penganggaran_paket_kegiatan` (
  `id` char(36) NOT NULL,
  `id_penganggaran_kegiatan` char(36) DEFAULT NULL,
  `id_sumber_dana` char(36) DEFAULT NULL,
  `nama_paket` varchar(100) DEFAULT NULL,
  `nilai_paket` bigint(20) DEFAULT 0,
  `pola` enum('Swakelola','Kerjasama','Pihak Ketiga') DEFAULT NULL,
  `sifat_paket` varchar(255) DEFAULT NULL,
  `volume_paket` int(10) UNSIGNED DEFAULT 0,
  `lokasi_paket` varchar(255) DEFAULT NULL,
  `satuan` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `penganggaran_pembiayaan_belanja`
--

CREATE TABLE `penganggaran_pembiayaan_belanja` (
  `id` char(36) NOT NULL,
  `id_penganggaran_tahun` char(36) DEFAULT NULL,
  `id_rekening_objek` char(36) DEFAULT NULL,
  `id_sumber_dana` char(36) DEFAULT NULL,
  `uraian` varchar(50) DEFAULT NULL,
  `volume` int(10) UNSIGNED DEFAULT 0,
  `satuan` varchar(255) DEFAULT NULL,
  `harga_satuan` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `penganggaran_pembiayaan_pendapatan`
--

CREATE TABLE `penganggaran_pembiayaan_pendapatan` (
  `id` char(36) NOT NULL,
  `id_penganggaran_tahun` char(36) DEFAULT NULL,
  `id_rekening_objek` char(36) DEFAULT NULL,
  `id_sumber_dana` char(36) DEFAULT NULL,
  `uraian` varchar(50) DEFAULT NULL,
  `volume` int(10) UNSIGNED DEFAULT 0,
  `satuan` varchar(255) DEFAULT NULL,
  `harga_satuan` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `penganggaran_pendapatan`
--

CREATE TABLE `penganggaran_pendapatan` (
  `id` char(36) NOT NULL,
  `id_penganggaran_tahun` char(36) DEFAULT NULL,
  `id_rekening_objek` char(36) DEFAULT NULL,
  `id_sumber_dana` char(36) DEFAULT NULL,
  `uraian` varchar(50) DEFAULT NULL,
  `volume` int(10) UNSIGNED DEFAULT 0,
  `satuan` varchar(255) DEFAULT NULL,
  `harga_satuan` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `penganggaran_sub_bidang`
--

CREATE TABLE `penganggaran_sub_bidang` (
  `id` char(36) NOT NULL,
  `id_penganggaran_bidang` char(36) DEFAULT NULL,
  `id_sub_bidang` char(36) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `penganggaran_tahun`
--

CREATE TABLE `penganggaran_tahun` (
  `id` char(36) NOT NULL,
  `id_desa` char(36) DEFAULT NULL,
  `tahun` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `perencanaan_misi`
--

CREATE TABLE `perencanaan_misi` (
  `id` char(36) NOT NULL,
  `id_visi` char(36) DEFAULT NULL,
  `kode` varchar(2) DEFAULT NULL,
  `uraian` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `perencanaan_sasaran`
--

CREATE TABLE `perencanaan_sasaran` (
  `id` char(36) NOT NULL,
  `id_tujuan` char(36) DEFAULT NULL,
  `kode` varchar(2) DEFAULT NULL,
  `uraian` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `perencanaan_tujuan`
--

CREATE TABLE `perencanaan_tujuan` (
  `id` char(36) NOT NULL,
  `id_misi` char(36) DEFAULT NULL,
  `kode` varchar(2) DEFAULT NULL,
  `uraian` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `perencanaan_visi`
--

CREATE TABLE `perencanaan_visi` (
  `id` char(36) NOT NULL,
  `id_desa` char(36) DEFAULT NULL,
  `kode` varchar(2) DEFAULT NULL,
  `uraian` text DEFAULT NULL,
  `tahun_awal` int(10) UNSIGNED DEFAULT NULL,
  `tahun_akhir` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `tempat` varchar(30) DEFAULT NULL,
  `tanggal_penetapan` date DEFAULT NULL,
  `id_kepala_desa` char(36) DEFAULT NULL,
  `id_sekretaris_desa` char(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `provinsi`
--

CREATE TABLE `provinsi` (
  `id` char(36) NOT NULL,
  `kode` varchar(255) DEFAULT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rekening_akun`
--

CREATE TABLE `rekening_akun` (
  `id` char(36) NOT NULL,
  `kode` varchar(2) DEFAULT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rekening_jenis`
--

CREATE TABLE `rekening_jenis` (
  `id` char(36) NOT NULL,
  `id_kelompok` char(36) DEFAULT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `kode` varchar(2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rekening_kelompok`
--

CREATE TABLE `rekening_kelompok` (
  `id` char(36) NOT NULL,
  `id_akun` char(36) DEFAULT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `kode` varchar(2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rekening_objek`
--

CREATE TABLE `rekening_objek` (
  `id` char(36) NOT NULL,
  `id_jenis` char(36) DEFAULT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `kode` varchar(2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rpjmd_bidang`
--

CREATE TABLE `rpjmd_bidang` (
  `id` char(36) NOT NULL,
  `id_desa` char(36) DEFAULT NULL,
  `id_bidang` char(36) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `id_visi` char(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rpjmd_dana_indikatif`
--

CREATE TABLE `rpjmd_dana_indikatif` (
  `id` char(36) NOT NULL,
  `id_rpjmd_tahun_kegiatan` char(36) DEFAULT NULL,
  `id_pelaksana_kegiatan` char(36) DEFAULT NULL,
  `id_sumber_dana` char(36) DEFAULT NULL,
  `lokasi` varchar(100) DEFAULT NULL,
  `volume` int(10) UNSIGNED DEFAULT NULL,
  `satuan` varchar(32) DEFAULT NULL,
  `waktu` varchar(32) DEFAULT NULL,
  `biaya` bigint(20) UNSIGNED DEFAULT NULL,
  `pola` enum('Swakelola','Kerjasama','Pihak Ketiga') DEFAULT NULL,
  `mulai` date DEFAULT NULL,
  `selesai` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rpjmd_kegiatan`
--

CREATE TABLE `rpjmd_kegiatan` (
  `id` char(36) NOT NULL,
  `id_rpjmd_sub_bidang` char(36) DEFAULT NULL,
  `id_kegiatan` char(36) DEFAULT NULL,
  `id_sasaran` char(36) DEFAULT NULL,
  `lokasi` varchar(100) DEFAULT NULL,
  `keluaran` varchar(100) DEFAULT NULL,
  `sasaran_manfaat` varchar(100) DEFAULT NULL,
  `pola` enum('Swakelola','Kerjasama','Pihak Ketiga') DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rpjmd_subbidang`
--

CREATE TABLE `rpjmd_subbidang` (
  `id` char(36) NOT NULL,
  `id_rpjmd_bidang` char(36) DEFAULT NULL,
  `id_sub_bidang` char(36) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rpjmd_tahun_kegiatan`
--

CREATE TABLE `rpjmd_tahun_kegiatan` (
  `id` char(36) NOT NULL,
  `id_rpjmd_kegiatan` char(36) DEFAULT NULL,
  `tahun_ke` int(10) UNSIGNED DEFAULT NULL,
  `tahun` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sekretaris_desa`
--

CREATE TABLE `sekretaris_desa` (
  `id` char(36) NOT NULL,
  `id_desa` char(36) DEFAULT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `jabatan` varchar(100) DEFAULT NULL,
  `aktif` enum('Ya','Tidak') NOT NULL DEFAULT 'Tidak',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sub_bidang`
--

CREATE TABLE `sub_bidang` (
  `id` char(36) NOT NULL,
  `id_bidang` char(36) DEFAULT NULL,
  `kode` varchar(2) DEFAULT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sumber_dana`
--

CREATE TABLE `sumber_dana` (
  `id` char(36) NOT NULL,
  `kode` varchar(3) DEFAULT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` char(36) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `id_desa` char(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `id_desa`) VALUES
('1', 'labil', 'muzammilkw07@gmail.com', '2025-01-18 12:27:58', '$2y$10$z0bsw.idFG4USRGJpT8HQ.X41pKakutYc3oVRfYEWxFHbCq4Grpia', NULL, NULL, NULL, 'e956bd73-b5ec-491c-ab8f-7ec2b3e50404'),
('b098b0a9-512d-4ab9-9abf-343d1d50bda2', 'kesya', 'kesya@gmail.com', NULL, '$2y$10$HuPz5I0br99tQWaC1deYweAaOGMFWbYAB6Ts697Z/gP9IsRdfC35K', NULL, '2025-01-18 05:47:52', '2025-01-18 05:47:52', 'e956bd73-b5ec-491c-ab8f-7ec2b3e50404'),
('e796408e-5296-4f89-a514-fac48972bd65', 'Fajry', 'fajryjobs@gmail.com', NULL, '$2y$10$d1rphFXmBZxRZVeeQ6/FxOlzcFW9iPsYWnhCxCQjtMNTlmmPiAX6S', NULL, '2025-01-23 06:27:55', '2025-01-23 06:27:55', 'e956bd73-b5ec-491c-ab8f-7ec2b3e50404');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bidang`
--
ALTER TABLE `bidang`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `desa`
--
ALTER TABLE `desa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `desa_id_kecamatan_foreign` (`id_kecamatan`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `kabupaten`
--
ALTER TABLE `kabupaten`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kabupaten_id_provinsi_foreign` (`id_provinsi`);

--
-- Indexes for table `kaur_keuangan`
--
ALTER TABLE `kaur_keuangan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kaur_keuangan_id_desa_foreign` (`id_desa`);

--
-- Indexes for table `kecamatan`
--
ALTER TABLE `kecamatan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kecamatan_id_kabupaten_foreign` (`id_kabupaten`);

--
-- Indexes for table `kegiatan`
--
ALTER TABLE `kegiatan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kegiatan_id_sub_bidang_foreign` (`id_sub_bidang`);

--
-- Indexes for table `kepala_desa`
--
ALTER TABLE `kepala_desa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kepala_desa_id_desa_foreign` (`id_desa`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `pelaksana_kegiatan`
--
ALTER TABLE `pelaksana_kegiatan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pelaksana_kegiatan_id_desa_foreign` (`id_desa`);

--
-- Indexes for table `penganggaran_belanja`
--
ALTER TABLE `penganggaran_belanja`
  ADD PRIMARY KEY (`id`),
  ADD KEY `penganggaran_belanja_id_rekening_objek_foreign` (`id_rekening_objek`),
  ADD KEY `penganggaran_belanja_id_penganggaran_tahun_foreign` (`id_penganggaran_tahun`),
  ADD KEY `penganggaran_belanja_id_penganggaran_kegiatan_foreign` (`id_penganggaran_kegiatan`),
  ADD KEY `penganggaran_belanja_id_sumber_dana_foreign` (`id_sumber_dana`);

--
-- Indexes for table `penganggaran_bidang`
--
ALTER TABLE `penganggaran_bidang`
  ADD PRIMARY KEY (`id`),
  ADD KEY `penganggaran_bidang_id_desa_foreign` (`id_desa`),
  ADD KEY `penganggaran_bidang_id_bidang_foreign` (`id_bidang`),
  ADD KEY `penganggaran_bidang_id_penganggaran_tahun_foreign` (`id_penganggaran_tahun`);

--
-- Indexes for table `penganggaran_kegiatan`
--
ALTER TABLE `penganggaran_kegiatan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `penganggaran_kegiatan_id_penganggaran_sub_bidang_foreign` (`id_penganggaran_sub_bidang`),
  ADD KEY `penganggaran_kegiatan_id_kegiatan_foreign` (`id_kegiatan`),
  ADD KEY `penganggaran_kegiatan_id_pelaksana_foreign` (`id_pelaksana`);

--
-- Indexes for table `penganggaran_paket_kegiatan`
--
ALTER TABLE `penganggaran_paket_kegiatan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `penganggaran_paket_kegiatan_id_penganggaran_kegiatan_foreign` (`id_penganggaran_kegiatan`),
  ADD KEY `penganggaran_paket_kegiatan_id_sumber_dana_foreign` (`id_sumber_dana`);

--
-- Indexes for table `penganggaran_pembiayaan_belanja`
--
ALTER TABLE `penganggaran_pembiayaan_belanja`
  ADD PRIMARY KEY (`id`),
  ADD KEY `penganggaran_pembiayaan_belanja_id_penganggaran_tahun_foreign` (`id_penganggaran_tahun`),
  ADD KEY `penganggaran_pembiayaan_belanja_id_rekening_objek_foreign` (`id_rekening_objek`),
  ADD KEY `penganggaran_pembiayaan_belanja_id_sumber_dana_foreign` (`id_sumber_dana`);

--
-- Indexes for table `penganggaran_pembiayaan_pendapatan`
--
ALTER TABLE `penganggaran_pembiayaan_pendapatan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `penganggaran_pembiayaan_pendapatan_id_penganggaran_tahun_foreign` (`id_penganggaran_tahun`),
  ADD KEY `penganggaran_pembiayaan_pendapatan_id_rekening_objek_foreign` (`id_rekening_objek`),
  ADD KEY `penganggaran_pembiayaan_pendapatan_id_sumber_dana_foreign` (`id_sumber_dana`);

--
-- Indexes for table `penganggaran_pendapatan`
--
ALTER TABLE `penganggaran_pendapatan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `penganggaran_pendapatan_id_penganggaran_tahun_foreign` (`id_penganggaran_tahun`),
  ADD KEY `penganggaran_pendapatan_id_rekening_objek_foreign` (`id_rekening_objek`),
  ADD KEY `penganggaran_pendapatan_id_sumber_dana_foreign` (`id_sumber_dana`);

--
-- Indexes for table `penganggaran_sub_bidang`
--
ALTER TABLE `penganggaran_sub_bidang`
  ADD PRIMARY KEY (`id`),
  ADD KEY `penganggaran_sub_bidang_id_penganggaran_bidang_foreign` (`id_penganggaran_bidang`),
  ADD KEY `penganggaran_sub_bidang_id_sub_bidang_foreign` (`id_sub_bidang`);

--
-- Indexes for table `penganggaran_tahun`
--
ALTER TABLE `penganggaran_tahun`
  ADD PRIMARY KEY (`id`),
  ADD KEY `penganggaran_tahun_id_desa_foreign` (`id_desa`);

--
-- Indexes for table `perencanaan_misi`
--
ALTER TABLE `perencanaan_misi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `perencanaan_misi_id_visi_foreign` (`id_visi`);

--
-- Indexes for table `perencanaan_sasaran`
--
ALTER TABLE `perencanaan_sasaran`
  ADD PRIMARY KEY (`id`),
  ADD KEY `perencanaan_sasaran_id_tujuan_foreign` (`id_tujuan`);

--
-- Indexes for table `perencanaan_tujuan`
--
ALTER TABLE `perencanaan_tujuan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `perencanaan_tujuan_id_misi_foreign` (`id_misi`);

--
-- Indexes for table `perencanaan_visi`
--
ALTER TABLE `perencanaan_visi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `perencanaan_visi_id_desa_foreign` (`id_desa`),
  ADD KEY `perencanaan_visi_id_kepala_desa_foreign` (`id_kepala_desa`),
  ADD KEY `perencanaan_visi_id_sekretaris_desa_foreign` (`id_sekretaris_desa`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `provinsi`
--
ALTER TABLE `provinsi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rekening_akun`
--
ALTER TABLE `rekening_akun`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rekening_jenis`
--
ALTER TABLE `rekening_jenis`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rekening_jenis_id_kelompok_foreign` (`id_kelompok`);

--
-- Indexes for table `rekening_kelompok`
--
ALTER TABLE `rekening_kelompok`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rekening_kelompok_id_akun_foreign` (`id_akun`);

--
-- Indexes for table `rekening_objek`
--
ALTER TABLE `rekening_objek`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rekening_objek_id_jenis_foreign` (`id_jenis`);

--
-- Indexes for table `rpjmd_bidang`
--
ALTER TABLE `rpjmd_bidang`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rpjmd_bidang_id_desa_foreign` (`id_desa`),
  ADD KEY `rpjmd_bidang_id_bidang_foreign` (`id_bidang`),
  ADD KEY `rpjmd_bidang_id_visi_foreign` (`id_visi`);

--
-- Indexes for table `rpjmd_dana_indikatif`
--
ALTER TABLE `rpjmd_dana_indikatif`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rpjmd_dana_indikatif_id_rpjmd_tahun_kegiatan_foreign` (`id_rpjmd_tahun_kegiatan`),
  ADD KEY `rpjmd_dana_indikatif_id_pelaksana_kegiatan_foreign` (`id_pelaksana_kegiatan`),
  ADD KEY `rpjmd_dana_indikatif_id_sumber_dana_foreign` (`id_sumber_dana`);

--
-- Indexes for table `rpjmd_kegiatan`
--
ALTER TABLE `rpjmd_kegiatan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rpjmd_kegiatan_id_rpjmd_sub_bidang_foreign` (`id_rpjmd_sub_bidang`),
  ADD KEY `rpjmd_kegiatan_id_kegiatan_foreign` (`id_kegiatan`),
  ADD KEY `rpjmd_kegiatan_id_sasaran_foreign` (`id_sasaran`);

--
-- Indexes for table `rpjmd_subbidang`
--
ALTER TABLE `rpjmd_subbidang`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rpjmd_subbidang_id_rpjmd_bidang_foreign` (`id_rpjmd_bidang`),
  ADD KEY `rpjmd_subbidang_id_sub_bidang_foreign` (`id_sub_bidang`);

--
-- Indexes for table `rpjmd_tahun_kegiatan`
--
ALTER TABLE `rpjmd_tahun_kegiatan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rpjmd_tahun_kegiatan_id_rpjmd_kegiatan_foreign` (`id_rpjmd_kegiatan`);

--
-- Indexes for table `sekretaris_desa`
--
ALTER TABLE `sekretaris_desa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sekretaris_desa_id_desa_foreign` (`id_desa`);

--
-- Indexes for table `sub_bidang`
--
ALTER TABLE `sub_bidang`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sub_bidang_id_bidang_foreign` (`id_bidang`);

--
-- Indexes for table `sumber_dana`
--
ALTER TABLE `sumber_dana`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_id_desa_foreign` (`id_desa`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `desa`
--
ALTER TABLE `desa`
  ADD CONSTRAINT `desa_id_kecamatan_foreign` FOREIGN KEY (`id_kecamatan`) REFERENCES `kecamatan` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `kabupaten`
--
ALTER TABLE `kabupaten`
  ADD CONSTRAINT `kabupaten_id_provinsi_foreign` FOREIGN KEY (`id_provinsi`) REFERENCES `provinsi` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `kaur_keuangan`
--
ALTER TABLE `kaur_keuangan`
  ADD CONSTRAINT `kaur_keuangan_id_desa_foreign` FOREIGN KEY (`id_desa`) REFERENCES `desa` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `kecamatan`
--
ALTER TABLE `kecamatan`
  ADD CONSTRAINT `kecamatan_id_kabupaten_foreign` FOREIGN KEY (`id_kabupaten`) REFERENCES `kabupaten` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `kegiatan`
--
ALTER TABLE `kegiatan`
  ADD CONSTRAINT `kegiatan_id_sub_bidang_foreign` FOREIGN KEY (`id_sub_bidang`) REFERENCES `sub_bidang` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `kepala_desa`
--
ALTER TABLE `kepala_desa`
  ADD CONSTRAINT `kepala_desa_id_desa_foreign` FOREIGN KEY (`id_desa`) REFERENCES `desa` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `pelaksana_kegiatan`
--
ALTER TABLE `pelaksana_kegiatan`
  ADD CONSTRAINT `pelaksana_kegiatan_id_desa_foreign` FOREIGN KEY (`id_desa`) REFERENCES `desa` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `penganggaran_belanja`
--
ALTER TABLE `penganggaran_belanja`
  ADD CONSTRAINT `penganggaran_belanja_id_penganggaran_kegiatan_foreign` FOREIGN KEY (`id_penganggaran_kegiatan`) REFERENCES `penganggaran_kegiatan` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `penganggaran_belanja_id_penganggaran_tahun_foreign` FOREIGN KEY (`id_penganggaran_tahun`) REFERENCES `penganggaran_tahun` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `penganggaran_belanja_id_rekening_objek_foreign` FOREIGN KEY (`id_rekening_objek`) REFERENCES `rekening_objek` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `penganggaran_belanja_id_sumber_dana_foreign` FOREIGN KEY (`id_sumber_dana`) REFERENCES `sumber_dana` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `penganggaran_bidang`
--
ALTER TABLE `penganggaran_bidang`
  ADD CONSTRAINT `penganggaran_bidang_id_bidang_foreign` FOREIGN KEY (`id_bidang`) REFERENCES `bidang` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `penganggaran_bidang_id_desa_foreign` FOREIGN KEY (`id_desa`) REFERENCES `desa` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `penganggaran_bidang_id_penganggaran_tahun_foreign` FOREIGN KEY (`id_penganggaran_tahun`) REFERENCES `penganggaran_tahun` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `penganggaran_kegiatan`
--
ALTER TABLE `penganggaran_kegiatan`
  ADD CONSTRAINT `penganggaran_kegiatan_id_kegiatan_foreign` FOREIGN KEY (`id_kegiatan`) REFERENCES `kegiatan` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `penganggaran_kegiatan_id_pelaksana_foreign` FOREIGN KEY (`id_pelaksana`) REFERENCES `pelaksana_kegiatan` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `penganggaran_kegiatan_id_penganggaran_sub_bidang_foreign` FOREIGN KEY (`id_penganggaran_sub_bidang`) REFERENCES `penganggaran_sub_bidang` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `penganggaran_paket_kegiatan`
--
ALTER TABLE `penganggaran_paket_kegiatan`
  ADD CONSTRAINT `penganggaran_paket_kegiatan_id_penganggaran_kegiatan_foreign` FOREIGN KEY (`id_penganggaran_kegiatan`) REFERENCES `penganggaran_kegiatan` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `penganggaran_paket_kegiatan_id_sumber_dana_foreign` FOREIGN KEY (`id_sumber_dana`) REFERENCES `sumber_dana` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `penganggaran_pembiayaan_belanja`
--
ALTER TABLE `penganggaran_pembiayaan_belanja`
  ADD CONSTRAINT `penganggaran_pembiayaan_belanja_id_penganggaran_tahun_foreign` FOREIGN KEY (`id_penganggaran_tahun`) REFERENCES `penganggaran_tahun` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `penganggaran_pembiayaan_belanja_id_rekening_objek_foreign` FOREIGN KEY (`id_rekening_objek`) REFERENCES `rekening_objek` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `penganggaran_pembiayaan_belanja_id_sumber_dana_foreign` FOREIGN KEY (`id_sumber_dana`) REFERENCES `sumber_dana` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `penganggaran_pembiayaan_pendapatan`
--
ALTER TABLE `penganggaran_pembiayaan_pendapatan`
  ADD CONSTRAINT `penganggaran_pembiayaan_pendapatan_id_penganggaran_tahun_foreign` FOREIGN KEY (`id_penganggaran_tahun`) REFERENCES `penganggaran_tahun` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `penganggaran_pembiayaan_pendapatan_id_rekening_objek_foreign` FOREIGN KEY (`id_rekening_objek`) REFERENCES `rekening_objek` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `penganggaran_pembiayaan_pendapatan_id_sumber_dana_foreign` FOREIGN KEY (`id_sumber_dana`) REFERENCES `sumber_dana` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `penganggaran_pendapatan`
--
ALTER TABLE `penganggaran_pendapatan`
  ADD CONSTRAINT `penganggaran_pendapatan_id_penganggaran_tahun_foreign` FOREIGN KEY (`id_penganggaran_tahun`) REFERENCES `penganggaran_tahun` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `penganggaran_pendapatan_id_rekening_objek_foreign` FOREIGN KEY (`id_rekening_objek`) REFERENCES `rekening_objek` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `penganggaran_pendapatan_id_sumber_dana_foreign` FOREIGN KEY (`id_sumber_dana`) REFERENCES `sumber_dana` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `penganggaran_sub_bidang`
--
ALTER TABLE `penganggaran_sub_bidang`
  ADD CONSTRAINT `penganggaran_sub_bidang_id_penganggaran_bidang_foreign` FOREIGN KEY (`id_penganggaran_bidang`) REFERENCES `penganggaran_bidang` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `penganggaran_sub_bidang_id_sub_bidang_foreign` FOREIGN KEY (`id_sub_bidang`) REFERENCES `sub_bidang` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `penganggaran_tahun`
--
ALTER TABLE `penganggaran_tahun`
  ADD CONSTRAINT `penganggaran_tahun_id_desa_foreign` FOREIGN KEY (`id_desa`) REFERENCES `desa` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `perencanaan_misi`
--
ALTER TABLE `perencanaan_misi`
  ADD CONSTRAINT `perencanaan_misi_id_visi_foreign` FOREIGN KEY (`id_visi`) REFERENCES `perencanaan_visi` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `perencanaan_sasaran`
--
ALTER TABLE `perencanaan_sasaran`
  ADD CONSTRAINT `perencanaan_sasaran_id_tujuan_foreign` FOREIGN KEY (`id_tujuan`) REFERENCES `perencanaan_tujuan` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `perencanaan_tujuan`
--
ALTER TABLE `perencanaan_tujuan`
  ADD CONSTRAINT `perencanaan_tujuan_id_misi_foreign` FOREIGN KEY (`id_misi`) REFERENCES `perencanaan_misi` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `perencanaan_visi`
--
ALTER TABLE `perencanaan_visi`
  ADD CONSTRAINT `perencanaan_visi_id_desa_foreign` FOREIGN KEY (`id_desa`) REFERENCES `desa` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `perencanaan_visi_id_kepala_desa_foreign` FOREIGN KEY (`id_kepala_desa`) REFERENCES `kepala_desa` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `perencanaan_visi_id_sekretaris_desa_foreign` FOREIGN KEY (`id_sekretaris_desa`) REFERENCES `sekretaris_desa` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `rekening_jenis`
--
ALTER TABLE `rekening_jenis`
  ADD CONSTRAINT `rekening_jenis_id_kelompok_foreign` FOREIGN KEY (`id_kelompok`) REFERENCES `rekening_kelompok` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `rekening_kelompok`
--
ALTER TABLE `rekening_kelompok`
  ADD CONSTRAINT `rekening_kelompok_id_akun_foreign` FOREIGN KEY (`id_akun`) REFERENCES `rekening_akun` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `rekening_objek`
--
ALTER TABLE `rekening_objek`
  ADD CONSTRAINT `rekening_objek_id_jenis_foreign` FOREIGN KEY (`id_jenis`) REFERENCES `rekening_jenis` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `rpjmd_bidang`
--
ALTER TABLE `rpjmd_bidang`
  ADD CONSTRAINT `rpjmd_bidang_id_bidang_foreign` FOREIGN KEY (`id_bidang`) REFERENCES `bidang` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `rpjmd_bidang_id_desa_foreign` FOREIGN KEY (`id_desa`) REFERENCES `desa` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `rpjmd_bidang_id_visi_foreign` FOREIGN KEY (`id_visi`) REFERENCES `perencanaan_visi` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `rpjmd_dana_indikatif`
--
ALTER TABLE `rpjmd_dana_indikatif`
  ADD CONSTRAINT `rpjmd_dana_indikatif_id_pelaksana_kegiatan_foreign` FOREIGN KEY (`id_pelaksana_kegiatan`) REFERENCES `pelaksana_kegiatan` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `rpjmd_dana_indikatif_id_rpjmd_tahun_kegiatan_foreign` FOREIGN KEY (`id_rpjmd_tahun_kegiatan`) REFERENCES `rpjmd_tahun_kegiatan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `rpjmd_dana_indikatif_id_sumber_dana_foreign` FOREIGN KEY (`id_sumber_dana`) REFERENCES `sumber_dana` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `rpjmd_kegiatan`
--
ALTER TABLE `rpjmd_kegiatan`
  ADD CONSTRAINT `rpjmd_kegiatan_id_kegiatan_foreign` FOREIGN KEY (`id_kegiatan`) REFERENCES `kegiatan` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `rpjmd_kegiatan_id_rpjmd_sub_bidang_foreign` FOREIGN KEY (`id_rpjmd_sub_bidang`) REFERENCES `rpjmd_subbidang` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `rpjmd_kegiatan_id_sasaran_foreign` FOREIGN KEY (`id_sasaran`) REFERENCES `perencanaan_sasaran` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `rpjmd_subbidang`
--
ALTER TABLE `rpjmd_subbidang`
  ADD CONSTRAINT `rpjmd_subbidang_id_rpjmd_bidang_foreign` FOREIGN KEY (`id_rpjmd_bidang`) REFERENCES `rpjmd_bidang` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `rpjmd_subbidang_id_sub_bidang_foreign` FOREIGN KEY (`id_sub_bidang`) REFERENCES `sub_bidang` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `rpjmd_tahun_kegiatan`
--
ALTER TABLE `rpjmd_tahun_kegiatan`
  ADD CONSTRAINT `rpjmd_tahun_kegiatan_id_rpjmd_kegiatan_foreign` FOREIGN KEY (`id_rpjmd_kegiatan`) REFERENCES `rpjmd_kegiatan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sekretaris_desa`
--
ALTER TABLE `sekretaris_desa`
  ADD CONSTRAINT `sekretaris_desa_id_desa_foreign` FOREIGN KEY (`id_desa`) REFERENCES `desa` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `sub_bidang`
--
ALTER TABLE `sub_bidang`
  ADD CONSTRAINT `sub_bidang_id_bidang_foreign` FOREIGN KEY (`id_bidang`) REFERENCES `bidang` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_id_desa_foreign` FOREIGN KEY (`id_desa`) REFERENCES `desa` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
