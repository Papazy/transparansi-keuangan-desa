-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 03, 2025 at 08:50 AM
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

--
-- Dumping data for table `bidang`
--

INSERT INTO `bidang` (`id`, `kode`, `nama`, `created_at`, `updated_at`) VALUES
('844d2535-41dd-4d25-a3b7-8512a4d24526', '65', 'Pembangunan Jalan', '2025-01-18 05:35:06', '2025-01-18 05:35:06'),
('88388349-cef9-4bd2-bb6d-78645c7bf62c', '66', 'Pembangunan Mesjid', '2025-01-23 06:46:13', '2025-01-23 06:46:13'),
('a1b2c3d4-e5f6-4a7b-8c9d-0e1f2a3b4c5d', '70', 'Pendidikan', '2025-01-31 12:31:45', '2025-01-31 12:31:45'),
('b2c3d4e5-f6a7-4b8c-9d0e-1f2a3b4c5d6e', '80', 'Kesehatan', '2025-01-31 12:31:45', '2025-01-31 12:31:45'),
('f1e2d3c4-b5a6-4c7d-8e9f-0a1b2c3d4e5f', '90', 'Pariwisata', '2025-01-31 13:12:19', '2025-01-31 13:12:19');

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

--
-- Dumping data for table `desa`
--

INSERT INTO `desa` (`id`, `id_kecamatan`, `nama`, `kode`, `created_at`, `updated_at`) VALUES
('e956bd73-b5ec-491c-ab8f-7ec2b3e50404', '83d279f8-fef4-4ad2-a33e-33f19f41b07f', 'MATANG', '6341', '2025-01-18 05:38:21', '2025-01-18 05:38:21');

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

--
-- Dumping data for table `kabupaten`
--

INSERT INTO `kabupaten` (`id`, `id_provinsi`, `kode`, `nama`, `created_at`, `updated_at`) VALUES
('776a0d83-12d6-4fd2-8534-6e7d121612f4', '476a1d1f-0596-4521-be0f-ec45968bf15c', '11', 'BIREUEN', '2025-01-18 05:31:33', '2025-01-18 05:37:50');

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

--
-- Dumping data for table `kaur_keuangan`
--

INSERT INTO `kaur_keuangan` (`id`, `id_desa`, `nama`, `jabatan`, `aktif`, `created_at`, `updated_at`) VALUES
('37fe83f9-5a95-4a4e-8258-0f34f079030f', 'e956bd73-b5ec-491c-ab8f-7ec2b3e50404', 'ALIA', 'KAUR KEUANGAN', 'Ya', '2025-01-18 05:41:05', '2025-01-18 05:41:05');

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

--
-- Dumping data for table `kecamatan`
--

INSERT INTO `kecamatan` (`id`, `id_kabupaten`, `kode`, `nama`, `created_at`, `updated_at`) VALUES
('83d279f8-fef4-4ad2-a33e-33f19f41b07f', '776a0d83-12d6-4fd2-8534-6e7d121612f4', '23', 'PEUSANGAN', '2025-01-18 05:31:57', '2025-01-18 05:38:01');

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

--
-- Dumping data for table `kegiatan`
--

INSERT INTO `kegiatan` (`id`, `id_sub_bidang`, `kode`, `nama`, `created_at`, `updated_at`) VALUES
('307f4d44-e3c5-4172-8ac1-198cfbce9bb5', 'a864910d-ea5f-4fa1-a6bf-b0db46fd4a48', '11', 'Pembangunan Mesjid Rawa Sakti', '2025-01-23 08:21:35', '2025-01-23 08:21:35'),
('3c33f195-0967-43d0-9db5-fa6d14faa7bc', 'c467e2f7-2eb0-4f85-af1c-c149ec3af874', '11', 'Pembangunan jalan madrasah', '2025-01-23 08:20:04', '2025-01-23 08:20:05'),
('e5f6a7b8-c9d0-4e1f-2a3b-4c5d6e7f8g9h', 'c3d4e5f6-a7b8-4c9d-0e1f-2a3b4c5d6e7f', '25', 'Pembangunan Ruang Kelas Baru', '2025-01-31 12:31:45', '2025-01-31 12:31:45'),
('f6a7b8c9-d0e1-4f2a-3b4c-5d6e7f8g9h0i', 'd4e5f6a7-b8c9-4d0e-1f2a-3b4c5d6e7f8g', '30', 'Pembangunan Ruang Rawat Inap', '2025-01-31 12:31:45', '2025-01-31 12:31:45'),
('h3i4j5k6-l7m8-4n9o-0p1q-2r3s4t5u6v7w', 'g2h3i4j5-k6l7-4m8n-9o0p-1q2r3s4t5u6v', '55', 'Pembangunan Jalan Menuju Objek Wisata', '2025-01-31 13:12:19', '2025-01-31 13:12:19'),
('i4j5k6l7-m8n9-4o0p-1q2r-3s4t5u6v7w8x', 'g2h3i4j5-k6l7-4m8n-9o0p-1q2r3s4t5u6v', '60', 'Pembangunan Gazebo Wisata', '2025-01-31 13:12:19', '2025-01-31 13:12:19'),
('x4y5z6a7-b8c9-4d0e-1f2g-3h4i5j6k7l8m', 'c3d4e5f6-a7b8-4c9d-0e1f-2a3b4c5d6e7f', '35', 'Pembangunan Perpustakaan Desa', '2025-01-31 13:04:51', '2025-01-31 13:04:51'),
('y5z6a7b8-c9d0-4e1f-2g3h-4i5j6k7l8m9n', 'd4e5f6a7-b8c9-4d0e-1f2a-3b4c5d6e7f8g', '40', 'Pembangunan Posyandu', '2025-01-31 13:04:51', '2025-01-31 13:04:51');

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

--
-- Dumping data for table `kepala_desa`
--

INSERT INTO `kepala_desa` (`id`, `id_desa`, `nama`, `jabatan`, `tanggal_mulai_jabatan`, `tanggal_akhir_jabatan`, `aktif`, `created_at`, `updated_at`) VALUES
('3d9d1fd5-8540-4da0-b77b-b4f7a76b6e59', 'e956bd73-b5ec-491c-ab8f-7ec2b3e50404', 'YUSUF S.KOM', 'KEPALA DESA', '2024-08-05', '2028-08-05', 'Ya', '2025-01-18 05:40:21', '2025-01-18 05:40:21');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2021_10_20_031237_create_provinsis_table', 1),
(6, '2021_10_20_042213_create_kabupatens_table', 1),
(7, '2021_10_20_063248_create_kecamatans_table', 1),
(8, '2021_10_20_095221_create_desas_table', 1),
(9, '2021_10_20_103832_create_bidangs_table', 1),
(10, '2021_10_20_103959_create_sub_bidangs_table', 1),
(11, '2021_10_20_104040_create_kegiatans_table', 1),
(12, '2021_10_20_155529_create_sumber_danas_table', 1),
(13, '2021_10_22_112915_create_rekening_akuns_table', 1),
(14, '2021_10_22_115908_create_rekening_kelompoks_table', 1),
(15, '2021_10_22_133022_create_rekening_jenis_table', 1),
(16, '2021_10_22_142559_create_rekening_objeks_table', 1),
(17, '2021_10_23_045852_add_desa_to_user', 1),
(18, '2021_10_23_112915_create_kepala_desas_table', 1),
(19, '2021_10_23_130054_create_sekretaris_desas_table', 1),
(20, '2021_10_23_142733_create_kaur_keuangans_table', 1),
(21, '2021_10_23_145832_create_pelaksana_kegiatans_table', 1),
(22, '2021_10_23_153400_create_perencanaan_visis_table', 1),
(23, '2021_10_24_012012_create_perencanaan_misis_table', 1),
(24, '2021_10_24_023137_create_perencanaan_tujuans_table', 1),
(25, '2021_10_24_044121_create_perencanaan_sasarans_table', 1),
(26, '2021_10_24_061632_add_footer_perencanaan_visi', 1),
(27, '2021_10_26_150231_create_r_p_j_m_d_bidangs_table', 1),
(28, '2021_10_26_160154_create_r_p_j_m_d_sub_bidangs_table', 1),
(29, '2021_10_26_171127_add_visi_to_rpjmd_bidang', 1),
(30, '2021_10_27_210631_create_r_p_j_m_d_kegiatans_table', 1),
(31, '2021_10_28_012336_create_rpjmd_tahun_kegiatans_table', 1),
(32, '2021_10_28_025305_create_r_p_j_m_d_dana_indikatifs_table', 1),
(33, '2021_10_31_150333_create_penganggaran_tahuns_table', 1),
(34, '2021_10_31_154851_create_penganggaran_bidangs_table', 1),
(35, '2021_11_07_132007_create_penganggaran_sub_bidangs_table', 1),
(36, '2021_11_07_140320_create_penganggaran_kegiatans_table', 1),
(37, '2021_11_07_154450_create_penganggaran_paket_kegiatans_table', 1),
(38, '2021_11_09_151932_create_penganggaran_pendapatans_table', 1),
(39, '2021_11_21_001412_create_penganggaran_belanjas_table', 1),
(40, '2021_11_21_054423_create_penganggaran_pembiayaan_pendapatans_table', 1),
(41, '2021_11_21_074807_create_penganggaran_pembiayaan_belanjas_table', 1);

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

--
-- Dumping data for table `pelaksana_kegiatan`
--

INSERT INTO `pelaksana_kegiatan` (`id`, `id_desa`, `nama`, `jabatan`, `aktif`, `created_at`, `updated_at`) VALUES
('fc66e46a-6360-4131-a94f-458f738c4508', 'e956bd73-b5ec-491c-ab8f-7ec2b3e50404', 'LABIL', 'PELAKSANA', 'Ya', '2025-01-18 05:41:19', '2025-01-18 05:41:19');

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

--
-- Dumping data for table `penganggaran_belanja`
--

INSERT INTO `penganggaran_belanja` (`id`, `id_penganggaran_tahun`, `id_penganggaran_kegiatan`, `id_rekening_objek`, `id_sumber_dana`, `uraian`, `volume`, `satuan`, `harga_satuan`, `created_at`, `updated_at`) VALUES
('4536be04-7c1d-441d-9b2f-3b2c0f5d22a9', 'dec75765-6512-4d18-a8ae-fd163fc41f51', 'cc17409d-f75d-4c4a-8a2b-9093d526079a', 'ee743a69-1213-43c4-a6bb-424b907cbf4e', '8d28b621-755d-4f5e-acf3-b12f31fa2f30', 'Dana Desa Tahap I Tahun 2025', 2, 'Paket', 200000000, '2025-01-30 13:23:25', '2025-01-30 13:23:25'),
('e921758a-92b4-47e5-a0bf-02053d31d915', 'q7r8s9t0-u1v2-4w3x-4y5z-6a7b8c9d0e1f', 't0u1v2w3-x4y5-4z6a-7b8c-9d0e1f2g3h4i', 'ee743a69-1213-43c4-a6bb-424b907cbf4e', '8d28b621-755d-4f5e-acf3-b12f31fa2f30', 'tes', 20, 'kelas', 5000000, '2025-01-31 12:21:58', '2025-01-31 12:21:58'),
('f2g3h4i5-j6k7-4l8m-9n0o-1p2q3r4s5t6u', 'q7r8s9t0-u1v2-4w3x-4y5z-6a7b8c9d0e1f', 'b8c9d0e1-f2g3-4h4i-5j6k-7l8m9n0o1p2q', 'a7b8c9d0-e1f2-4g3h-4i5j-6k7l8m9n0o1p', 'o5p6q7r8-s9t0-4u1v-2w3x-4y5z6a7b8c9d', 'Pembelian Buku dan Peralatan Perpustakaan', 50, 'unit', 500000, '2025-01-31 13:04:51', '2025-01-31 13:04:51'),
('g3h4i5j6-k7l8-4m9n-0o1p-2q3r4s5t6u7v', 'q7r8s9t0-u1v2-4w3x-4y5z-6a7b8c9d0e1f', 'c9d0e1f2-g3h4-4i5j-6k7l-8m9n0o1p2q3r', 'a7b8c9d0-e1f2-4g3h-4i5j-6k7l8m9n0o1p', 'o5p6q7r8-s9t0-4u1v-2w3x-4y5z6a7b8c9d', 'Pembelian Alat Kesehatan Posyandu', 20, 'unit', 1000000, '2025-01-31 13:04:51', '2025-01-31 13:04:51'),
('s4t5u6v7-w8x9-4y0z-1a2b-3c4d5e6f7g8h', 'q7r8s9t0-u1v2-4w3x-4y5z-6a7b8c9d0e1f', 'o0p1q2r3-s4t5-4u6v-7w8x-9y0z1a2b3c4d', 'm8n9o0p1-q2r3-4s4t-5u6v-7w8x9y0z1a2b', 'n9o0p1q2-r3s4-4t5u-6v7w-8x9y0z1a2b3c', 'Pembelian Material Jalan Wisata', 1000, 'm³', 75000, '2025-01-31 13:12:19', '2025-01-31 13:12:19'),
('t5u6v7w8-x9y0-4z1a-2b3c-4d5e6f7g8h9i', 'q7r8s9t0-u1v2-4w3x-4y5z-6a7b8c9d0e1f', 'p1q2r3s4-t5u6-4v7w-8x9y-0z1a2b3c4d5e', 'm8n9o0p1-q2r3-4s4t-5u6v-7w8x9y0z1a2b', 'n9o0p1q2-r3s4-4t5u-6v7w-8x9y0z1a2b3c', 'Pembelian Material Gazebo', 50, 'unit', 500000, '2025-01-31 13:12:19', '2025-01-31 13:12:19'),
('v2w3x4y5-z6a7-4b8c-9d0e-1f2g3h4i5j6k', 'q7r8s9t0-u1v2-4w3x-4y5z-6a7b8c9d0e1f', 't0u1v2w3-x4y5-4z6a-7b8c-9d0e1f2g3h4i', 'm3n4o5p6-q7r8-4s9t-0u1v-2w3x4y5z6a7b', 'o5p6q7r8-s9t0-4u1v-2w3x-4y5z6a7b8c9d', 'Pembelian Material Bangunan', 100, 'unit', 500000, '2025-01-31 12:31:46', '2025-01-31 12:31:46');

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

--
-- Dumping data for table `penganggaran_bidang`
--

INSERT INTO `penganggaran_bidang` (`id`, `id_desa`, `id_bidang`, `id_penganggaran_tahun`, `created_at`, `updated_at`) VALUES
('9fc5c9fe-7fbd-4118-bc8f-e496d2207b75', 'e956bd73-b5ec-491c-ab8f-7ec2b3e50404', '88388349-cef9-4bd2-bb6d-78645c7bf62c', 'dec75765-6512-4d18-a8ae-fd163fc41f51', '2025-01-30 12:56:25', '2025-01-30 12:56:25'),
('d315230c-4861-4f91-98c1-917b909a5b9e', 'e956bd73-b5ec-491c-ab8f-7ec2b3e50404', '844d2535-41dd-4d25-a3b7-8512a4d24526', 'dec75765-6512-4d18-a8ae-fd163fc41f51', '2025-01-23 06:45:02', '2025-01-23 06:45:02'),
('r8s9t0u1-v2w3-4x4y-5z6a-7b8c9d0e1f2g', 'e956bd73-b5ec-491c-ab8f-7ec2b3e50404', 'a1b2c3d4-e5f6-4a7b-8c9d-0e1f2a3b4c5d', 'q7r8s9t0-u1v2-4w3x-4y5z-6a7b8c9d0e1f', '2025-01-31 12:31:46', '2025-01-31 12:31:46');

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

--
-- Dumping data for table `penganggaran_kegiatan`
--

INSERT INTO `penganggaran_kegiatan` (`id`, `id_penganggaran_sub_bidang`, `id_kegiatan`, `id_pelaksana`, `lokasi`, `waktu_pelaksanaan`, `pagu`, `keluaran`, `volume`, `satuan`, `created_at`, `updated_at`) VALUES
('9ee5fa22-9910-4e5d-a895-c2db8e06fafb', 'c672458e-2dec-4e84-90e4-ab8ca913ef48', '307f4d44-e3c5-4172-8ac1-198cfbce9bb5', 'fc66e46a-6360-4131-a94f-458f738c4508', 'Rawa Sakti', '2 Maret 2024', 2000000, 'Mesjid', 20, 'meter', '2025-01-30 12:57:39', '2025-01-30 12:57:39'),
('b8c9d0e1-f2g3-4h4i-5j6k-7l8m9n0o1p2q', 's9t0u1v2-w3x4-4y5z-6a7b-8c9d0e1f2g3h', 'x4y5z6a7-b8c9-4d0e-1f2g-3h4i5j6k7l8m', 'fc66e46a-6360-4131-a94f-458f738c4508', 'Desa Matang', '2025-07-01', 30000000, 'Perpustakaan Desa', 1, 'unit', '2025-01-31 13:04:51', '2025-01-31 13:04:51'),
('c9d0e1f2-g3h4-4i5j-6k7l-8m9n0o1p2q3r', 's9t0u1v2-w3x4-4y5z-6a7b-8c9d0e1f2g3h', 'y5z6a7b8-c9d0-4e1f-2g3h-4i5j6k7l8m9n', 'fc66e46a-6360-4131-a94f-458f738c4508', 'Desa Matang', '2025-08-01', 20000000, 'Posyandu', 1, 'unit', '2025-01-31 13:04:51', '2025-01-31 13:04:51'),
('cc17409d-f75d-4c4a-8a2b-9093d526079a', '7940f810-7200-4369-ba97-83169b0200f0', '3c33f195-0967-43d0-9db5-fa6d14faa7bc', 'fc66e46a-6360-4131-a94f-458f738c4508', 'Rawa Sakti', '20-02-2023', 12000000, 'Jalan', 20, 'meter', '2025-01-23 08:25:04', '2025-01-23 08:25:04'),
('o0p1q2r3-s4t5-4u6v-7w8x-9y0z1a2b3c4d', 's9t0u1v2-w3x4-4y5z-6a7b-8c9d0e1f2g3h', 'h3i4j5k6-l7m8-4n9o-0p1q-2r3s4t5u6v7w', 'fc66e46a-6360-4131-a94f-458f738c4508', 'Desa Matang', '2025-09-01', 75000000, 'Jalan Wisata', 1, 'km', '2025-01-31 13:12:19', '2025-01-31 13:12:19'),
('p1q2r3s4-t5u6-4v7w-8x9y-0z1a2b3c4d5e', 's9t0u1v2-w3x4-4y5z-6a7b-8c9d0e1f2g3h', 'i4j5k6l7-m8n9-4o0p-1q2r-3s4t5u6v7w8x', 'fc66e46a-6360-4131-a94f-458f738c4508', 'Desa Matang', '2025-10-01', 25000000, 'Gazebo Wisata', 5, 'unit', '2025-01-31 13:12:19', '2025-01-31 13:12:19'),
('t0u1v2w3-x4y5-4z6a-7b8c-9d0e1f2g3h4i', 's9t0u1v2-w3x4-4y5z-6a7b-8c9d0e1f2g3h', 'e5f6a7b8-c9d0-4e1f-2a3b-4c5d6e7f8g9h', 'fc66e46a-6360-4131-a94f-458f738c4508', 'Desa Matang', '2025-06-01', 50000000, 'Ruang Kelas Baru', 1, 'unit', '2025-01-31 12:31:46', '2025-01-31 12:31:46');

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

--
-- Dumping data for table `penganggaran_paket_kegiatan`
--

INSERT INTO `penganggaran_paket_kegiatan` (`id`, `id_penganggaran_kegiatan`, `id_sumber_dana`, `nama_paket`, `nilai_paket`, `pola`, `sifat_paket`, `volume_paket`, `lokasi_paket`, `satuan`, `created_at`, `updated_at`) VALUES
('1439113e-582c-424e-a7f5-547759d57748', 'cc17409d-f75d-4c4a-8a2b-9093d526079a', '8d28b621-755d-4f5e-acf3-b12f31fa2f30', 'Tes', 20000, NULL, NULL, 20, 'Rawa Sakti', 'Meter', '2025-01-23 08:25:49', '2025-01-23 08:25:49'),
('32677fb2-1c3d-41ab-8376-31aa7e94cffe', '9ee5fa22-9910-4e5d-a895-c2db8e06fafb', '8d28b621-755d-4f5e-acf3-b12f31fa2f30', 'Pembangunan Pondasi', 200000, NULL, NULL, 20, 'Rawa Sakti', 'meter', '2025-01-30 12:59:11', '2025-01-30 13:01:05'),
('d0e1f2g3-h4i5-4j6k-7l8m-9n0o1p2q3r4s', 'b8c9d0e1-f2g3-4h4i-5j6k-7l8m9n0o1p2q', 'o5p6q7r8-s9t0-4u1v-2w3x-4y5z6a7b8c9d', 'Paket Pembangunan Perpustakaan', 30000000, 'Swakelola', 'Pembangunan Fisik', 1, 'Desa Matang', 'unit', '2025-01-31 13:04:51', '2025-01-31 13:04:51'),
('e1f2g3h4-i5j6-4k7l-8m9n-0o1p2q3r4s5t', 'c9d0e1f2-g3h4-4i5j-6k7l-8m9n0o1p2q3r', 'o5p6q7r8-s9t0-4u1v-2w3x-4y5z6a7b8c9d', 'Paket Pembangunan Posyandu', 20000000, 'Swakelola', 'Pembangunan Fisik', 1, 'Desa Matang', 'unit', '2025-01-31 13:04:51', '2025-01-31 13:04:51'),
('e2d0d9be-8244-46c1-90f7-7664bb6d1bb6', '9ee5fa22-9910-4e5d-a895-c2db8e06fafb', '8d28b621-755d-4f5e-acf3-b12f31fa2f30', 'Peningkatan Dinding', 100000, NULL, NULL, 10, 'Mesjid Rawa Sakti', 'm2', '2025-01-30 13:01:47', '2025-01-30 13:01:47'),
('q2r3s4t5-u6v7-4w8x-9y0z-1a2b3c4d5e6f', 'o0p1q2r3-s4t5-4u6v-7w8x-9y0z1a2b3c4d', 'n9o0p1q2-r3s4-4t5u-6v7w-8x9y0z1a2b3c', 'Paket Pembangunan Jalan Wisata', 75000000, 'Swakelola', 'Pembangunan Fisik', 1, 'Desa Matang', 'km', '2025-01-31 13:12:19', '2025-01-31 13:12:19'),
('r3s4t5u6-v7w8-4x9y-0z1a-2b3c4d5e6f7g', 'p1q2r3s4-t5u6-4v7w-8x9y-0z1a2b3c4d5e', 'n9o0p1q2-r3s4-4t5u-6v7w-8x9y0z1a2b3c', 'Paket Pembangunan Gazebo Wisata', 25000000, 'Swakelola', 'Pembangunan Fisik', 5, 'Desa Matang', 'unit', '2025-01-31 13:12:19', '2025-01-31 13:12:19'),
('u1v2w3x4-y5z6-4a7b-8c9d-0e1f2g3h4i5j', 't0u1v2w3-x4y5-4z6a-7b8c-9d0e1f2g3h4i', 'o5p6q7r8-s9t0-4u1v-2w3x-4y5z6a7b8c9d', 'Paket Pembangunan Ruang Kelas', 50000000, 'Swakelola', 'Pembangunan Fisik', 1, 'Desa Matang', 'unit', '2025-01-31 12:31:46', '2025-01-31 12:31:46');

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

--
-- Dumping data for table `penganggaran_pembiayaan_belanja`
--

INSERT INTO `penganggaran_pembiayaan_belanja` (`id`, `id_penganggaran_tahun`, `id_rekening_objek`, `id_sumber_dana`, `uraian`, `volume`, `satuan`, `harga_satuan`, `created_at`, `updated_at`) VALUES
('d5c19150-0bfe-4af2-ac55-efed12fa0990', 'dec75765-6512-4d18-a8ae-fd163fc41f51', '78fc7684-2726-44ec-9357-ba99cde6b38b', '8d28b621-755d-4f5e-acf3-b12f31fa2f30', 'Beli itu', 21, 'paket', 10000000, '2025-01-30 13:36:43', '2025-01-30 13:36:43'),
('k7l8m9n0-o1p2-4q3r-4s5t-6u7v8w9x0y1z', 'q7r8s9t0-u1v2-4w3x-4y5z-6a7b8c9d0e1f', 'a7b8c9d0-e1f2-4g3h-4i5j-6k7l8m9n0o1p', 'i5j6k7l8-m9n0-4o1p-2q3r-4s5t6u7v8w9x', 'Belanja CSR untuk Pendidikan', 1, 'tahun', 10000000, '2025-01-31 13:04:52', '2025-01-31 13:04:52'),
('w8x9y0z1-a2b3-4c4d-5e6f-7g8h9i0j1k2l', 'q7r8s9t0-u1v2-4w3x-4y5z-6a7b8c9d0e1f', 'm8n9o0p1-q2r3-4s4t-5u6v-7w8x9y0z1a2b', 'n9o0p1q2-r3s4-4t5u-6v7w-8x9y0z1a2b3c', 'Belanja CSR untuk Pariwisata', 1, 'tahun', 10000000, '2025-01-31 13:12:20', '2025-01-31 13:12:20');

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

--
-- Dumping data for table `penganggaran_pembiayaan_pendapatan`
--

INSERT INTO `penganggaran_pembiayaan_pendapatan` (`id`, `id_penganggaran_tahun`, `id_rekening_objek`, `id_sumber_dana`, `uraian`, `volume`, `satuan`, `harga_satuan`, `created_at`, `updated_at`) VALUES
('df8fc83d-a092-4e36-83bd-0ef6fb9180ab', 'dec75765-6512-4d18-a8ae-fd163fc41f51', '7b776b3f-657f-43ca-9d6d-d0c298559870', '8d28b621-755d-4f5e-acf3-b12f31fa2f30', 'tes', 1, 'Paket', 20000000, '2025-01-30 13:26:15', '2025-01-30 13:26:15'),
('j6k7l8m9-n0o1-4p2q-3r4s-5t6u7v8w9x0y', 'q7r8s9t0-u1v2-4w3x-4y5z-6a7b8c9d0e1f', 'z6a7b8c9-d0e1-4f2g-3h4i-5j6k7l8m9n0o', 'i5j6k7l8-m9n0-4o1p-2q3r-4s5t6u7v8w9x', 'Pendapatan CSR untuk Pendidikan', 1, 'tahun', 10000000, '2025-01-31 13:04:52', '2025-01-31 13:04:52'),
('v7w8x9y0-z1a2-4b3c-4d5e-6f7g8h9i0j1k', 'q7r8s9t0-u1v2-4w3x-4y5z-6a7b8c9d0e1f', 'm8n9o0p1-q2r3-4s4t-5u6v-7w8x9y0z1a2b', 'n9o0p1q2-r3s4-4t5u-6v7w-8x9y0z1a2b3c', 'Pendapatan CSR untuk Pariwisata', 1, 'tahun', 10000000, '2025-01-31 13:12:19', '2025-01-31 13:12:19');

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

--
-- Dumping data for table `penganggaran_pendapatan`
--

INSERT INTO `penganggaran_pendapatan` (`id`, `id_penganggaran_tahun`, `id_rekening_objek`, `id_sumber_dana`, `uraian`, `volume`, `satuan`, `harga_satuan`, `created_at`, `updated_at`) VALUES
('c0b47a49-ed4d-43bb-83f4-7006fa01d18e', 'dec75765-6512-4d18-a8ae-fd163fc41f51', 'cdabda82-90ef-4e39-a2ab-0119cb8aeb18', '8d28b621-755d-4f5e-acf3-b12f31fa2f30', 'Dana Desa Tahap I Tahun 2025', 1, 'Paket', 2000000, '2025-01-30 13:20:37', '2025-01-30 13:20:37'),
('h4i5j6k7-l8m9-4n0o-1p2q-3r4s5t6u7v8w', 'q7r8s9t0-u1v2-4w3x-4y5z-6a7b8c9d0e1f', 'z6a7b8c9-d0e1-4f2g-3h4i-5j6k7l8m9n0o', 'o5p6q7r8-s9t0-4u1v-2w3x-4y5z6a7b8c9d', 'Pendapatan Pajak Hiburan', 1, 'tahun', 5000000, '2025-01-31 13:04:51', '2025-01-31 13:04:51'),
('u6v7w8x9-y0z1-4a2b-3c4d-5e6f7g8h9i0j', 'q7r8s9t0-u1v2-4w3x-4y5z-6a7b8c9d0e1f', 'm8n9o0p1-q2r3-4s4t-5u6v-7w8x9y0z1a2b', 'n9o0p1q2-r3s4-4t5u-6v7w-8x9y0z1a2b3c', 'Pendapatan Tiket Masuk Wisata', 1, 'tahun', 5000000, '2025-01-31 13:12:19', '2025-01-31 13:12:19'),
('w3x4y5z6-a7b8-4c9d-0e1f-2g3h4i5j6k7l', 'q7r8s9t0-u1v2-4w3x-4y5z-6a7b8c9d0e1f', 'm3n4o5p6-q7r8-4s9t-0u1v-2w3x4y5z6a7b', 'o5p6q7r8-s9t0-4u1v-2w3x-4y5z6a7b8c9d', 'Pendapatan Pajak Bumi dan Bangunan', 1, 'tahun', 10000000, '2025-01-31 12:31:46', '2025-01-31 12:31:46');

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

--
-- Dumping data for table `penganggaran_sub_bidang`
--

INSERT INTO `penganggaran_sub_bidang` (`id`, `id_penganggaran_bidang`, `id_sub_bidang`, `created_at`, `updated_at`) VALUES
('7940f810-7200-4369-ba97-83169b0200f0', 'd315230c-4861-4f91-98c1-917b909a5b9e', 'c467e2f7-2eb0-4f85-af1c-c149ec3af874', '2025-01-23 06:45:24', '2025-01-23 06:45:24'),
('c672458e-2dec-4e84-90e4-ab8ca913ef48', '9fc5c9fe-7fbd-4118-bc8f-e496d2207b75', 'a864910d-ea5f-4fa1-a6bf-b0db46fd4a48', '2025-01-30 12:56:42', '2025-01-30 12:56:42'),
('s9t0u1v2-w3x4-4y5z-6a7b-8c9d0e1f2g3h', 'r8s9t0u1-v2w3-4x4y-5z6a-7b8c9d0e1f2g', 'c3d4e5f6-a7b8-4c9d-0e1f-2a3b4c5d6e7f', '2025-01-31 12:31:46', '2025-01-31 12:31:46');

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

--
-- Dumping data for table `penganggaran_tahun`
--

INSERT INTO `penganggaran_tahun` (`id`, `id_desa`, `tahun`, `created_at`, `updated_at`) VALUES
('d15140e9-0295-4420-8c90-803fd018eb50', 'e956bd73-b5ec-491c-ab8f-7ec2b3e50404', 2024, '2025-01-31 04:23:57', '2025-01-31 04:23:57'),
('dec75765-6512-4d18-a8ae-fd163fc41f51', 'e956bd73-b5ec-491c-ab8f-7ec2b3e50404', 2023, '2025-01-23 06:44:38', '2025-01-23 06:44:38'),
('q7r8s9t0-u1v2-4w3x-4y5z-6a7b8c9d0e1f', 'e956bd73-b5ec-491c-ab8f-7ec2b3e50404', 2025, '2025-01-31 12:31:45', '2025-01-31 12:31:45');

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

--
-- Dumping data for table `perencanaan_visi`
--

INSERT INTO `perencanaan_visi` (`id`, `id_desa`, `kode`, `uraian`, `tahun_awal`, `tahun_akhir`, `created_at`, `updated_at`, `tempat`, `tanggal_penetapan`, `id_kepala_desa`, `id_sekretaris_desa`) VALUES
('420adcea-f2c4-48d1-8c1b-f00703474275', 'e956bd73-b5ec-491c-ab8f-7ec2b3e50404', '1', 'Mewujudkan Desa Matang yang mandiri, maju, dan sejahtera berdasarkan potensi sumber daya lokal.', 2025, 2026, '2025-01-23 06:34:00', '2025-01-23 06:43:46', NULL, NULL, NULL, NULL),
('52391656-1be9-4aec-a76b-6b6e3f3c71f2', 'e956bd73-b5ec-491c-ab8f-7ec2b3e50404', '23', 'Menjadikan desa lebih baik', 2025, 2026, '2025-02-02 12:51:40', '2025-02-02 12:51:40', NULL, NULL, NULL, NULL);

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

--
-- Dumping data for table `provinsi`
--

INSERT INTO `provinsi` (`id`, `kode`, `nama`, `created_at`, `updated_at`) VALUES
('476a1d1f-0596-4521-be0f-ec45968bf15c', '01', 'ACEH', '2025-01-18 05:31:17', '2025-01-18 05:37:37');

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

--
-- Dumping data for table `rekening_akun`
--

INSERT INTO `rekening_akun` (`id`, `kode`, `nama`, `created_at`, `updated_at`) VALUES
('1dcceba5-f867-4a5d-b2f7-958fa73ef041', '6', 'Pembiayaan Belanja', '2025-01-30 13:27:16', '2025-01-30 13:27:16'),
('62a20df7-091c-4778-97a3-d8bae2ad9498', '6', 'Penggangaran Pndpatan A', '2025-01-30 13:24:53', '2025-01-30 13:24:53'),
('98740624-cb07-4490-90c6-59f046b15f01', '5', 'BELANJA', '2025-01-30 09:18:11', '2025-01-30 13:21:25'),
('b33ec97e-b151-49a9-9262-2e8e838faedc', '23', 'PENDAPATAN 2', '2025-01-31 04:27:42', '2025-01-31 04:27:42'),
('dfd8f541-4fc6-4d70-95c1-c27ac2a3b8fb', '24', 'PENDAPATAN', '2025-01-18 05:34:16', '2025-01-30 13:18:33'),
('g7h8i9j0-k1l2-4m3n-4o5p-6q7r8s9t0u1v', '50', 'Pendapatan Desa', '2025-01-31 12:31:45', '2025-01-31 12:31:45'),
('h8i9j0k1-l2m3-4n4o-5p6q-7r8s9t0u1v2w', '60', 'Belanja Desa', '2025-01-31 12:31:45', '2025-01-31 12:31:45'),
('j5k6l7m8-n9o0-4p1q-2r3s-4t5u6v7w8x9y', '70', 'Pendapatan Pariwisata', '2025-01-31 13:12:19', '2025-01-31 13:12:19');

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

--
-- Dumping data for table `rekening_jenis`
--

INSERT INTO `rekening_jenis` (`id`, `id_kelompok`, `nama`, `kode`, `created_at`, `updated_at`) VALUES
('007db7ba-0d9a-40be-baf7-26816b49002b', '4607d48f-da03-43f0-8570-14bce5282288', 'TES 2', '31', '2025-01-31 04:29:17', '2025-01-31 04:29:17'),
('877cce62-67aa-4720-b24b-a4dcfba51a7b', '5c26c5ff-67fc-443a-af59-575b18875061', 'Tes', '12', '2025-01-23 08:26:40', '2025-01-23 08:26:40'),
('92715431-01e9-4778-b661-1864d2e29bf9', '479c05f2-80ee-454e-8d78-98940b997457', 'Tes', '3', '2025-01-30 13:27:55', '2025-01-30 13:27:55'),
('a406f15b-783c-476b-b646-7f1d916bd81a', '4607d48f-da03-43f0-8570-14bce5282288', 'TES', '32', '2025-01-31 04:30:29', '2025-01-31 04:30:29'),
('a83ec353-5007-4a40-b913-e1cbb95f809b', '54b423f3-3965-4cb9-af2c-fc8dcead628d', 'Tes', '22', '2025-01-30 13:11:18', '2025-01-30 13:11:18'),
('bd1b5bec-9d36-4c06-bb90-655b875cbe51', '3628d27e-4126-4390-b3ed-b845f523a456', 'Tes', '2', '2025-01-30 13:25:32', '2025-01-30 13:25:32'),
('k1l2m3n4-o5p6-4q7r-8s9t-0u1v2w3x4y5z', 'i9j0k1l2-m3n4-4o5p-6q7r-8s9t0u1v2w3x', 'Pendapatan Pajak', '01', '2025-01-31 12:31:45', '2025-01-31 12:31:45'),
('l2m3n4o5-p6q7-4r8s-9t0u-1v2w3x4y5z6a', 'j0k1l2m3-n4o5-4p6q-7r8s-9t0u1v2w3x4y', 'Belanja Pegawai', '02', '2025-01-31 12:31:45', '2025-01-31 12:31:45'),
('l7m8n9o0-p1q2-4r3s-4t5u-6v7w8x9y0z1a', 'k6l7m8n9-o0p1-4q2r-3s4t-5u6v7w8x9y0z', 'Pendapatan Tiket Wisata', '04', '2025-01-31 13:12:19', '2025-01-31 13:12:19');

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

--
-- Dumping data for table `rekening_kelompok`
--

INSERT INTO `rekening_kelompok` (`id`, `id_akun`, `nama`, `kode`, `created_at`, `updated_at`) VALUES
('3628d27e-4126-4390-b3ed-b845f523a456', '62a20df7-091c-4778-97a3-d8bae2ad9498', 'Kelompok A', '1', '2025-01-30 13:25:16', '2025-01-30 13:25:16'),
('4607d48f-da03-43f0-8570-14bce5282288', 'b33ec97e-b151-49a9-9262-2e8e838faedc', 'Belanja', '12', '2025-01-31 04:28:59', '2025-01-31 04:28:59'),
('479c05f2-80ee-454e-8d78-98940b997457', '1dcceba5-f867-4a5d-b2f7-958fa73ef041', 'Kelompok B', '2', '2025-01-30 13:27:41', '2025-01-30 13:27:41'),
('54b423f3-3965-4cb9-af2c-fc8dcead628d', '98740624-cb07-4490-90c6-59f046b15f01', 'AJir', '11', '2025-01-30 13:11:03', '2025-01-30 13:11:03'),
('5c26c5ff-67fc-443a-af59-575b18875061', 'dfd8f541-4fc6-4d70-95c1-c27ac2a3b8fb', 'jann', '52', '2025-01-18 05:34:32', '2025-01-18 05:34:32'),
('afd907ff-a242-46d8-a86c-eed72ef649e0', 'b33ec97e-b151-49a9-9262-2e8e838faedc', 'TES Dapsa', '11', '2025-01-31 04:30:51', '2025-01-31 04:30:51'),
('i9j0k1l2-m3n4-4o5p-6q7r-8s9t0u1v2w3x', 'g7h8i9j0-k1l2-4m3n-4o5p-6q7r8s9t0u1v', 'Pendapatan Asli Desa', '10', '2025-01-31 12:31:45', '2025-01-31 12:31:45'),
('j0k1l2m3-n4o5-4p6q-7r8s-9t0u1v2w3x4y', 'h8i9j0k1-l2m3-4n4o-5p6q-7r8s9t0u1v2w', 'Belanja Langsung', '20', '2025-01-31 12:31:45', '2025-01-31 12:31:45'),
('k6l7m8n9-o0p1-4q2r-3s4t-5u6v7w8x9y0z', 'j5k6l7m8-n9o0-4p1q-2r3s-4t5u6v7w8x9y', 'Pendapatan Tiket Masuk', '30', '2025-01-31 13:12:19', '2025-01-31 13:12:19');

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

--
-- Dumping data for table `rekening_objek`
--

INSERT INTO `rekening_objek` (`id`, `id_jenis`, `nama`, `kode`, `created_at`, `updated_at`) VALUES
('629294d8-4052-4d28-9d6f-87fba8a11cb1', '007db7ba-0d9a-40be-baf7-26816b49002b', 'TES2', '12', '2025-01-31 04:29:36', '2025-01-31 04:29:36'),
('6fdbeed3-e52c-47c3-9fcf-961d80b557c7', '007db7ba-0d9a-40be-baf7-26816b49002b', 'TES 3', '32', '2025-01-31 04:30:01', '2025-01-31 04:30:01'),
('78fc7684-2726-44ec-9357-ba99cde6b38b', '92715431-01e9-4778-b661-1864d2e29bf9', 'tes', '11', '2025-01-30 13:28:06', '2025-01-30 13:28:06'),
('7b776b3f-657f-43ca-9d6d-d0c298559870', 'bd1b5bec-9d36-4c06-bb90-655b875cbe51', 'tes', '11', '2025-01-30 13:25:49', '2025-01-30 13:25:49'),
('a7b8c9d0-e1f2-4g3h-4i5j-6k7l8m9n0o1p', 'l2m3n4o5-p6q7-4r8s-9t0u-1v2w3x4y5z6a', 'Belanja Barang', '03', '2025-01-31 13:04:51', '2025-01-31 13:04:51'),
('cdabda82-90ef-4e39-a2ab-0119cb8aeb18', '877cce62-67aa-4720-b24b-a4dcfba51a7b', 'tes', '12', '2025-01-23 08:26:49', '2025-01-23 08:26:49'),
('ee743a69-1213-43c4-a6bb-424b907cbf4e', 'a83ec353-5007-4a40-b913-e1cbb95f809b', 'teslagi', '33', '2025-01-30 13:11:37', '2025-01-30 13:11:37'),
('m3n4o5p6-q7r8-4s9t-0u1v-2w3x4y5z6a7b', 'k1l2m3n4-o5p6-4q7r-8s9t-0u1v2w3x4y5z', 'Pajak Bumi dan Bangunan', '01', '2025-01-31 12:31:45', '2025-01-31 12:31:45'),
('m8n9o0p1-q2r3-4s4t-5u6v-7w8x9y0z1a2b', 'l7m8n9o0-p1q2-4r3s-4t5u-6v7w8x9y0z1a', 'Tiket Masuk Wisata Alam', '04', '2025-01-31 13:12:19', '2025-01-31 13:12:19'),
('n4o5p6q7-r8s9-4t0u-1v2w-3x4y5z6a7b8c', 'l2m3n4o5-p6q7-4r8s-9t0u-1v2w3x4y5z6a', 'Gaji Pegawai', '02', '2025-01-31 12:31:45', '2025-01-31 12:31:45'),
('z6a7b8c9-d0e1-4f2g-3h4i-5j6k7l8m9n0o', 'k1l2m3n4-o5p6-4q7r-8s9t-0u1v2w3x4y5z', 'Pajak Hiburan', '03', '2025-01-31 13:04:51', '2025-01-31 13:04:51');

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

--
-- Dumping data for table `rpjmd_bidang`
--

INSERT INTO `rpjmd_bidang` (`id`, `id_desa`, `id_bidang`, `created_at`, `updated_at`, `id_visi`) VALUES
('8046990b-4643-463b-9960-a9240f8362d4', 'e956bd73-b5ec-491c-ab8f-7ec2b3e50404', '844d2535-41dd-4d25-a3b7-8512a4d24526', '2025-01-23 06:44:24', '2025-01-23 06:44:24', '420adcea-f2c4-48d1-8c1b-f00703474275');

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

--
-- Dumping data for table `sekretaris_desa`
--

INSERT INTO `sekretaris_desa` (`id`, `id_desa`, `nama`, `jabatan`, `aktif`, `created_at`, `updated_at`) VALUES
('31ded2f3-85c9-4cc3-b60c-f8a8fb903796', 'e956bd73-b5ec-491c-ab8f-7ec2b3e50404', 'KESYA', 'SEKRETARIS DESA', 'Ya', '2025-01-18 05:40:47', '2025-01-18 05:40:47');

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

--
-- Dumping data for table `sub_bidang`
--

INSERT INTO `sub_bidang` (`id`, `id_bidang`, `kode`, `nama`, `created_at`, `updated_at`) VALUES
('a864910d-ea5f-4fa1-a6bf-b0db46fd4a48', '88388349-cef9-4bd2-bb6d-78645c7bf62c', '11', 'Pembangunan Mesjid Rawa', '2025-01-23 08:20:37', '2025-01-23 08:20:37'),
('c3d4e5f6-a7b8-4c9d-0e1f-2a3b4c5d6e7f', 'a1b2c3d4-e5f6-4a7b-8c9d-0e1f2a3b4c5d', '15', 'Pembangunan Sekolah', '2025-01-31 12:31:45', '2025-01-31 12:31:45'),
('c467e2f7-2eb0-4f85-af1c-c149ec3af874', '844d2535-41dd-4d25-a3b7-8512a4d24526', '24', 'Infrastruktur', '2025-01-18 05:35:32', '2025-01-18 05:35:32'),
('d4e5f6a7-b8c9-4d0e-1f2a-3b4c5d6e7f8g', 'b2c3d4e5-f6a7-4b8c-9d0e-1f2a3b4c5d6e', '20', 'Pembangunan Puskesmas', '2025-01-31 12:31:45', '2025-01-31 12:31:45'),
('g2h3i4j5-k6l7-4m8n-9o0p-1q2r3s4t5u6v', 'f1e2d3c4-b5a6-4c7d-8e9f-0a1b2c3d4e5f', '50', 'Pengembangan Wisata Alam', '2025-01-31 13:12:19', '2025-01-31 13:12:19');

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

--
-- Dumping data for table `sumber_dana`
--

INSERT INTO `sumber_dana` (`id`, `kode`, `nama`, `created_at`, `updated_at`) VALUES
('8d28b621-755d-4f5e-acf3-b12f31fa2f30', '234', 'APBD', '2025-01-18 05:33:57', '2025-01-18 05:33:57'),
('i5j6k7l8-m9n0-4o1p-2q3r-4s5t6u7v8w9x', '500', 'Bantuan CSR', '2025-01-31 13:04:51', '2025-01-31 13:04:51'),
('n9o0p1q2-r3s4-4t5u-6v7w-8x9y0z1a2b3c', '600', 'Dana Pariwisata', '2025-01-31 13:12:19', '2025-01-31 13:12:19'),
('o5p6q7r8-s9t0-4u1v-2w3x-4y5z6a7b8c9d', '300', 'Dana Desa', '2025-01-31 12:31:45', '2025-01-31 12:31:45'),
('p6q7r8s9-t0u1-4v2w-3x4y-5z6a7b8c9d0e', '400', 'APBN', '2025-01-31 12:31:45', '2025-01-31 12:31:45');

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

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
