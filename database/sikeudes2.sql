-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 28 Jan 2025 pada 18.12
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 7.4.30

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
-- Struktur dari tabel `bidang`
--

CREATE TABLE `bidang` (
  `id` char(36) NOT NULL,
  `kode` varchar(2) DEFAULT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `bidang`
--

INSERT INTO `bidang` (`id`, `kode`, `nama`, `created_at`, `updated_at`) VALUES
('844d2535-41dd-4d25-a3b7-8512a4d24526', '65', 'Pembangunan Jalan', '2025-01-18 05:35:06', '2025-01-18 05:35:06'),
('88388349-cef9-4bd2-bb6d-78645c7bf62c', '66', 'Pembangunan Mesjid', '2025-01-23 06:46:13', '2025-01-23 06:46:13');

-- --------------------------------------------------------

--
-- Struktur dari tabel `desa`
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
-- Dumping data untuk tabel `desa`
--

INSERT INTO `desa` (`id`, `id_kecamatan`, `nama`, `kode`, `created_at`, `updated_at`) VALUES
('e956bd73-b5ec-491c-ab8f-7ec2b3e50404', '83d279f8-fef4-4ad2-a33e-33f19f41b07f', 'MATANG', '6341', '2025-01-18 05:38:21', '2025-01-18 05:38:21');

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_jobs`
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
-- Struktur dari tabel `kabupaten`
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
-- Dumping data untuk tabel `kabupaten`
--

INSERT INTO `kabupaten` (`id`, `id_provinsi`, `kode`, `nama`, `created_at`, `updated_at`) VALUES
('776a0d83-12d6-4fd2-8534-6e7d121612f4', '476a1d1f-0596-4521-be0f-ec45968bf15c', '11', 'BIREUEN', '2025-01-18 05:31:33', '2025-01-18 05:37:50');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kaur_keuangan`
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
-- Dumping data untuk tabel `kaur_keuangan`
--

INSERT INTO `kaur_keuangan` (`id`, `id_desa`, `nama`, `jabatan`, `aktif`, `created_at`, `updated_at`) VALUES
('37fe83f9-5a95-4a4e-8258-0f34f079030f', 'e956bd73-b5ec-491c-ab8f-7ec2b3e50404', 'ALIA', 'KAUR KEUANGAN', 'Ya', '2025-01-18 05:41:05', '2025-01-18 05:41:05');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kecamatan`
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
-- Dumping data untuk tabel `kecamatan`
--

INSERT INTO `kecamatan` (`id`, `id_kabupaten`, `kode`, `nama`, `created_at`, `updated_at`) VALUES
('83d279f8-fef4-4ad2-a33e-33f19f41b07f', '776a0d83-12d6-4fd2-8534-6e7d121612f4', '23', 'PEUSANGAN', '2025-01-18 05:31:57', '2025-01-18 05:38:01');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kegiatan`
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
-- Dumping data untuk tabel `kegiatan`
--

INSERT INTO `kegiatan` (`id`, `id_sub_bidang`, `kode`, `nama`, `created_at`, `updated_at`) VALUES
('307f4d44-e3c5-4172-8ac1-198cfbce9bb5', 'a864910d-ea5f-4fa1-a6bf-b0db46fd4a48', '11', 'Pembangunan Mesjid Rawa Sakti', '2025-01-23 08:21:35', '2025-01-23 08:21:35'),
('3c33f195-0967-43d0-9db5-fa6d14faa7bc', 'c467e2f7-2eb0-4f85-af1c-c149ec3af874', '11', 'Pembangunan jalan madrasah', '2025-01-23 08:20:04', '2025-01-23 08:20:05');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kepala_desa`
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
-- Dumping data untuk tabel `kepala_desa`
--

INSERT INTO `kepala_desa` (`id`, `id_desa`, `nama`, `jabatan`, `tanggal_mulai_jabatan`, `tanggal_akhir_jabatan`, `aktif`, `created_at`, `updated_at`) VALUES
('3d9d1fd5-8540-4da0-b77b-b4f7a76b6e59', 'e956bd73-b5ec-491c-ab8f-7ec2b3e50404', 'YUSUF S.KOM', 'KEPALA DESA', '2024-08-05', '2028-08-05', 'Ya', '2025-01-18 05:40:21', '2025-01-18 05:40:21');

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
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
-- Struktur dari tabel `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pelaksana_kegiatan`
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
-- Dumping data untuk tabel `pelaksana_kegiatan`
--

INSERT INTO `pelaksana_kegiatan` (`id`, `id_desa`, `nama`, `jabatan`, `aktif`, `created_at`, `updated_at`) VALUES
('fc66e46a-6360-4131-a94f-458f738c4508', 'e956bd73-b5ec-491c-ab8f-7ec2b3e50404', 'LABIL', 'PELAKSANA', 'Ya', '2025-01-18 05:41:19', '2025-01-18 05:41:19');

-- --------------------------------------------------------

--
-- Struktur dari tabel `penganggaran_belanja`
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
-- Struktur dari tabel `penganggaran_bidang`
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
-- Dumping data untuk tabel `penganggaran_bidang`
--

INSERT INTO `penganggaran_bidang` (`id`, `id_desa`, `id_bidang`, `id_penganggaran_tahun`, `created_at`, `updated_at`) VALUES
('d315230c-4861-4f91-98c1-917b909a5b9e', 'e956bd73-b5ec-491c-ab8f-7ec2b3e50404', '844d2535-41dd-4d25-a3b7-8512a4d24526', 'dec75765-6512-4d18-a8ae-fd163fc41f51', '2025-01-23 06:45:02', '2025-01-23 06:45:02');

-- --------------------------------------------------------

--
-- Struktur dari tabel `penganggaran_kegiatan`
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
-- Dumping data untuk tabel `penganggaran_kegiatan`
--

INSERT INTO `penganggaran_kegiatan` (`id`, `id_penganggaran_sub_bidang`, `id_kegiatan`, `id_pelaksana`, `lokasi`, `waktu_pelaksanaan`, `pagu`, `keluaran`, `volume`, `satuan`, `created_at`, `updated_at`) VALUES
('cc17409d-f75d-4c4a-8a2b-9093d526079a', '7940f810-7200-4369-ba97-83169b0200f0', '3c33f195-0967-43d0-9db5-fa6d14faa7bc', 'fc66e46a-6360-4131-a94f-458f738c4508', 'Rawa Sakti', '20-02-2023', 12000000, 'Jalan', 20, 'meter', '2025-01-23 08:25:04', '2025-01-23 08:25:04');

-- --------------------------------------------------------

--
-- Struktur dari tabel `penganggaran_paket_kegiatan`
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
-- Dumping data untuk tabel `penganggaran_paket_kegiatan`
--

INSERT INTO `penganggaran_paket_kegiatan` (`id`, `id_penganggaran_kegiatan`, `id_sumber_dana`, `nama_paket`, `nilai_paket`, `pola`, `sifat_paket`, `volume_paket`, `lokasi_paket`, `satuan`, `created_at`, `updated_at`) VALUES
('1439113e-582c-424e-a7f5-547759d57748', 'cc17409d-f75d-4c4a-8a2b-9093d526079a', '8d28b621-755d-4f5e-acf3-b12f31fa2f30', 'Tes', 20000, NULL, NULL, 20, 'Rawa Sakti', 'Meter', '2025-01-23 08:25:49', '2025-01-23 08:25:49');

-- --------------------------------------------------------

--
-- Struktur dari tabel `penganggaran_pembiayaan_belanja`
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
-- Struktur dari tabel `penganggaran_pembiayaan_pendapatan`
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
-- Struktur dari tabel `penganggaran_pendapatan`
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
-- Struktur dari tabel `penganggaran_sub_bidang`
--

CREATE TABLE `penganggaran_sub_bidang` (
  `id` char(36) NOT NULL,
  `id_penganggaran_bidang` char(36) DEFAULT NULL,
  `id_sub_bidang` char(36) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `penganggaran_sub_bidang`
--

INSERT INTO `penganggaran_sub_bidang` (`id`, `id_penganggaran_bidang`, `id_sub_bidang`, `created_at`, `updated_at`) VALUES
('7940f810-7200-4369-ba97-83169b0200f0', 'd315230c-4861-4f91-98c1-917b909a5b9e', 'c467e2f7-2eb0-4f85-af1c-c149ec3af874', '2025-01-23 06:45:24', '2025-01-23 06:45:24');

-- --------------------------------------------------------

--
-- Struktur dari tabel `penganggaran_tahun`
--

CREATE TABLE `penganggaran_tahun` (
  `id` char(36) NOT NULL,
  `id_desa` char(36) DEFAULT NULL,
  `tahun` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `penganggaran_tahun`
--

INSERT INTO `penganggaran_tahun` (`id`, `id_desa`, `tahun`, `created_at`, `updated_at`) VALUES
('dec75765-6512-4d18-a8ae-fd163fc41f51', 'e956bd73-b5ec-491c-ab8f-7ec2b3e50404', 2025, '2025-01-23 06:44:38', '2025-01-23 06:44:38');

-- --------------------------------------------------------

--
-- Struktur dari tabel `perencanaan_misi`
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
-- Struktur dari tabel `perencanaan_sasaran`
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
-- Struktur dari tabel `perencanaan_tujuan`
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
-- Struktur dari tabel `perencanaan_visi`
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
-- Dumping data untuk tabel `perencanaan_visi`
--

INSERT INTO `perencanaan_visi` (`id`, `id_desa`, `kode`, `uraian`, `tahun_awal`, `tahun_akhir`, `created_at`, `updated_at`, `tempat`, `tanggal_penetapan`, `id_kepala_desa`, `id_sekretaris_desa`) VALUES
('420adcea-f2c4-48d1-8c1b-f00703474275', 'e956bd73-b5ec-491c-ab8f-7ec2b3e50404', '1', '\"Mewujudkan Desa Matang yang mandiri, maju, dan sejahtera berdasarkan potensi sumber daya lokal.\"', 2025, 2026, '2025-01-23 06:34:00', '2025-01-23 06:43:46', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `personal_access_tokens`
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
-- Struktur dari tabel `provinsi`
--

CREATE TABLE `provinsi` (
  `id` char(36) NOT NULL,
  `kode` varchar(255) DEFAULT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `provinsi`
--

INSERT INTO `provinsi` (`id`, `kode`, `nama`, `created_at`, `updated_at`) VALUES
('476a1d1f-0596-4521-be0f-ec45968bf15c', '01', 'ACEH', '2025-01-18 05:31:17', '2025-01-18 05:37:37');

-- --------------------------------------------------------

--
-- Struktur dari tabel `rekening_akun`
--

CREATE TABLE `rekening_akun` (
  `id` char(36) NOT NULL,
  `kode` varchar(2) DEFAULT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `rekening_akun`
--

INSERT INTO `rekening_akun` (`id`, `kode`, `nama`, `created_at`, `updated_at`) VALUES
('dfd8f541-4fc6-4d70-95c1-c27ac2a3b8fb', '24', 'KESYA', '2025-01-18 05:34:16', '2025-01-18 05:34:16');

-- --------------------------------------------------------

--
-- Struktur dari tabel `rekening_jenis`
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
-- Dumping data untuk tabel `rekening_jenis`
--

INSERT INTO `rekening_jenis` (`id`, `id_kelompok`, `nama`, `kode`, `created_at`, `updated_at`) VALUES
('877cce62-67aa-4720-b24b-a4dcfba51a7b', '5c26c5ff-67fc-443a-af59-575b18875061', 'Tes', '12', '2025-01-23 08:26:40', '2025-01-23 08:26:40');

-- --------------------------------------------------------

--
-- Struktur dari tabel `rekening_kelompok`
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
-- Dumping data untuk tabel `rekening_kelompok`
--

INSERT INTO `rekening_kelompok` (`id`, `id_akun`, `nama`, `kode`, `created_at`, `updated_at`) VALUES
('5c26c5ff-67fc-443a-af59-575b18875061', 'dfd8f541-4fc6-4d70-95c1-c27ac2a3b8fb', 'jann', '52', '2025-01-18 05:34:32', '2025-01-18 05:34:32');

-- --------------------------------------------------------

--
-- Struktur dari tabel `rekening_objek`
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
-- Dumping data untuk tabel `rekening_objek`
--

INSERT INTO `rekening_objek` (`id`, `id_jenis`, `nama`, `kode`, `created_at`, `updated_at`) VALUES
('cdabda82-90ef-4e39-a2ab-0119cb8aeb18', '877cce62-67aa-4720-b24b-a4dcfba51a7b', 'tes', '12', '2025-01-23 08:26:49', '2025-01-23 08:26:49');

-- --------------------------------------------------------

--
-- Struktur dari tabel `rpjmd_bidang`
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
-- Dumping data untuk tabel `rpjmd_bidang`
--

INSERT INTO `rpjmd_bidang` (`id`, `id_desa`, `id_bidang`, `created_at`, `updated_at`, `id_visi`) VALUES
('8046990b-4643-463b-9960-a9240f8362d4', 'e956bd73-b5ec-491c-ab8f-7ec2b3e50404', '844d2535-41dd-4d25-a3b7-8512a4d24526', '2025-01-23 06:44:24', '2025-01-23 06:44:24', '420adcea-f2c4-48d1-8c1b-f00703474275');

-- --------------------------------------------------------

--
-- Struktur dari tabel `rpjmd_dana_indikatif`
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
-- Struktur dari tabel `rpjmd_kegiatan`
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
-- Struktur dari tabel `rpjmd_subbidang`
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
-- Struktur dari tabel `rpjmd_tahun_kegiatan`
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
-- Struktur dari tabel `sekretaris_desa`
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
-- Dumping data untuk tabel `sekretaris_desa`
--

INSERT INTO `sekretaris_desa` (`id`, `id_desa`, `nama`, `jabatan`, `aktif`, `created_at`, `updated_at`) VALUES
('31ded2f3-85c9-4cc3-b60c-f8a8fb903796', 'e956bd73-b5ec-491c-ab8f-7ec2b3e50404', 'KESYA', 'SEKRETARIS DESA', 'Ya', '2025-01-18 05:40:47', '2025-01-18 05:40:47');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sub_bidang`
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
-- Dumping data untuk tabel `sub_bidang`
--

INSERT INTO `sub_bidang` (`id`, `id_bidang`, `kode`, `nama`, `created_at`, `updated_at`) VALUES
('a864910d-ea5f-4fa1-a6bf-b0db46fd4a48', '88388349-cef9-4bd2-bb6d-78645c7bf62c', '11', 'Pembangunan Mesjid Rawa', '2025-01-23 08:20:37', '2025-01-23 08:20:37'),
('c467e2f7-2eb0-4f85-af1c-c149ec3af874', '844d2535-41dd-4d25-a3b7-8512a4d24526', '24', 'Infrastruktur', '2025-01-18 05:35:32', '2025-01-18 05:35:32');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sumber_dana`
--

CREATE TABLE `sumber_dana` (
  `id` char(36) NOT NULL,
  `kode` varchar(3) DEFAULT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `sumber_dana`
--

INSERT INTO `sumber_dana` (`id`, `kode`, `nama`, `created_at`, `updated_at`) VALUES
('8d28b621-755d-4f5e-acf3-b12f31fa2f30', '234', 'APBD', '2025-01-18 05:33:57', '2025-01-18 05:33:57');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
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
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `id_desa`) VALUES
('1', 'labil', 'muzammilkw07@gmail.com', '2025-01-18 12:27:58', '$2y$10$z0bsw.idFG4USRGJpT8HQ.X41pKakutYc3oVRfYEWxFHbCq4Grpia', NULL, NULL, NULL, 'e956bd73-b5ec-491c-ab8f-7ec2b3e50404'),
('b098b0a9-512d-4ab9-9abf-343d1d50bda2', 'kesya', 'kesya@gmail.com', NULL, '$2y$10$HuPz5I0br99tQWaC1deYweAaOGMFWbYAB6Ts697Z/gP9IsRdfC35K', NULL, '2025-01-18 05:47:52', '2025-01-18 05:47:52', 'e956bd73-b5ec-491c-ab8f-7ec2b3e50404'),
('e796408e-5296-4f89-a514-fac48972bd65', 'Fajry', 'fajryjobs@gmail.com', NULL, '$2y$10$d1rphFXmBZxRZVeeQ6/FxOlzcFW9iPsYWnhCxCQjtMNTlmmPiAX6S', NULL, '2025-01-23 06:27:55', '2025-01-23 06:27:55', 'e956bd73-b5ec-491c-ab8f-7ec2b3e50404');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `bidang`
--
ALTER TABLE `bidang`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `desa`
--
ALTER TABLE `desa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `desa_id_kecamatan_foreign` (`id_kecamatan`);

--
-- Indeks untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indeks untuk tabel `kabupaten`
--
ALTER TABLE `kabupaten`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kabupaten_id_provinsi_foreign` (`id_provinsi`);

--
-- Indeks untuk tabel `kaur_keuangan`
--
ALTER TABLE `kaur_keuangan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kaur_keuangan_id_desa_foreign` (`id_desa`);

--
-- Indeks untuk tabel `kecamatan`
--
ALTER TABLE `kecamatan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kecamatan_id_kabupaten_foreign` (`id_kabupaten`);

--
-- Indeks untuk tabel `kegiatan`
--
ALTER TABLE `kegiatan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kegiatan_id_sub_bidang_foreign` (`id_sub_bidang`);

--
-- Indeks untuk tabel `kepala_desa`
--
ALTER TABLE `kepala_desa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kepala_desa_id_desa_foreign` (`id_desa`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indeks untuk tabel `pelaksana_kegiatan`
--
ALTER TABLE `pelaksana_kegiatan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pelaksana_kegiatan_id_desa_foreign` (`id_desa`);

--
-- Indeks untuk tabel `penganggaran_belanja`
--
ALTER TABLE `penganggaran_belanja`
  ADD PRIMARY KEY (`id`),
  ADD KEY `penganggaran_belanja_id_rekening_objek_foreign` (`id_rekening_objek`),
  ADD KEY `penganggaran_belanja_id_penganggaran_tahun_foreign` (`id_penganggaran_tahun`),
  ADD KEY `penganggaran_belanja_id_penganggaran_kegiatan_foreign` (`id_penganggaran_kegiatan`),
  ADD KEY `penganggaran_belanja_id_sumber_dana_foreign` (`id_sumber_dana`);

--
-- Indeks untuk tabel `penganggaran_bidang`
--
ALTER TABLE `penganggaran_bidang`
  ADD PRIMARY KEY (`id`),
  ADD KEY `penganggaran_bidang_id_desa_foreign` (`id_desa`),
  ADD KEY `penganggaran_bidang_id_bidang_foreign` (`id_bidang`),
  ADD KEY `penganggaran_bidang_id_penganggaran_tahun_foreign` (`id_penganggaran_tahun`);

--
-- Indeks untuk tabel `penganggaran_kegiatan`
--
ALTER TABLE `penganggaran_kegiatan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `penganggaran_kegiatan_id_penganggaran_sub_bidang_foreign` (`id_penganggaran_sub_bidang`),
  ADD KEY `penganggaran_kegiatan_id_kegiatan_foreign` (`id_kegiatan`),
  ADD KEY `penganggaran_kegiatan_id_pelaksana_foreign` (`id_pelaksana`);

--
-- Indeks untuk tabel `penganggaran_paket_kegiatan`
--
ALTER TABLE `penganggaran_paket_kegiatan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `penganggaran_paket_kegiatan_id_penganggaran_kegiatan_foreign` (`id_penganggaran_kegiatan`),
  ADD KEY `penganggaran_paket_kegiatan_id_sumber_dana_foreign` (`id_sumber_dana`);

--
-- Indeks untuk tabel `penganggaran_pembiayaan_belanja`
--
ALTER TABLE `penganggaran_pembiayaan_belanja`
  ADD PRIMARY KEY (`id`),
  ADD KEY `penganggaran_pembiayaan_belanja_id_penganggaran_tahun_foreign` (`id_penganggaran_tahun`),
  ADD KEY `penganggaran_pembiayaan_belanja_id_rekening_objek_foreign` (`id_rekening_objek`),
  ADD KEY `penganggaran_pembiayaan_belanja_id_sumber_dana_foreign` (`id_sumber_dana`);

--
-- Indeks untuk tabel `penganggaran_pembiayaan_pendapatan`
--
ALTER TABLE `penganggaran_pembiayaan_pendapatan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `penganggaran_pembiayaan_pendapatan_id_penganggaran_tahun_foreign` (`id_penganggaran_tahun`),
  ADD KEY `penganggaran_pembiayaan_pendapatan_id_rekening_objek_foreign` (`id_rekening_objek`),
  ADD KEY `penganggaran_pembiayaan_pendapatan_id_sumber_dana_foreign` (`id_sumber_dana`);

--
-- Indeks untuk tabel `penganggaran_pendapatan`
--
ALTER TABLE `penganggaran_pendapatan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `penganggaran_pendapatan_id_penganggaran_tahun_foreign` (`id_penganggaran_tahun`),
  ADD KEY `penganggaran_pendapatan_id_rekening_objek_foreign` (`id_rekening_objek`),
  ADD KEY `penganggaran_pendapatan_id_sumber_dana_foreign` (`id_sumber_dana`);

--
-- Indeks untuk tabel `penganggaran_sub_bidang`
--
ALTER TABLE `penganggaran_sub_bidang`
  ADD PRIMARY KEY (`id`),
  ADD KEY `penganggaran_sub_bidang_id_penganggaran_bidang_foreign` (`id_penganggaran_bidang`),
  ADD KEY `penganggaran_sub_bidang_id_sub_bidang_foreign` (`id_sub_bidang`);

--
-- Indeks untuk tabel `penganggaran_tahun`
--
ALTER TABLE `penganggaran_tahun`
  ADD PRIMARY KEY (`id`),
  ADD KEY `penganggaran_tahun_id_desa_foreign` (`id_desa`);

--
-- Indeks untuk tabel `perencanaan_misi`
--
ALTER TABLE `perencanaan_misi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `perencanaan_misi_id_visi_foreign` (`id_visi`);

--
-- Indeks untuk tabel `perencanaan_sasaran`
--
ALTER TABLE `perencanaan_sasaran`
  ADD PRIMARY KEY (`id`),
  ADD KEY `perencanaan_sasaran_id_tujuan_foreign` (`id_tujuan`);

--
-- Indeks untuk tabel `perencanaan_tujuan`
--
ALTER TABLE `perencanaan_tujuan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `perencanaan_tujuan_id_misi_foreign` (`id_misi`);

--
-- Indeks untuk tabel `perencanaan_visi`
--
ALTER TABLE `perencanaan_visi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `perencanaan_visi_id_desa_foreign` (`id_desa`),
  ADD KEY `perencanaan_visi_id_kepala_desa_foreign` (`id_kepala_desa`),
  ADD KEY `perencanaan_visi_id_sekretaris_desa_foreign` (`id_sekretaris_desa`);

--
-- Indeks untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indeks untuk tabel `provinsi`
--
ALTER TABLE `provinsi`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `rekening_akun`
--
ALTER TABLE `rekening_akun`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `rekening_jenis`
--
ALTER TABLE `rekening_jenis`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rekening_jenis_id_kelompok_foreign` (`id_kelompok`);

--
-- Indeks untuk tabel `rekening_kelompok`
--
ALTER TABLE `rekening_kelompok`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rekening_kelompok_id_akun_foreign` (`id_akun`);

--
-- Indeks untuk tabel `rekening_objek`
--
ALTER TABLE `rekening_objek`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rekening_objek_id_jenis_foreign` (`id_jenis`);

--
-- Indeks untuk tabel `rpjmd_bidang`
--
ALTER TABLE `rpjmd_bidang`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rpjmd_bidang_id_desa_foreign` (`id_desa`),
  ADD KEY `rpjmd_bidang_id_bidang_foreign` (`id_bidang`),
  ADD KEY `rpjmd_bidang_id_visi_foreign` (`id_visi`);

--
-- Indeks untuk tabel `rpjmd_dana_indikatif`
--
ALTER TABLE `rpjmd_dana_indikatif`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rpjmd_dana_indikatif_id_rpjmd_tahun_kegiatan_foreign` (`id_rpjmd_tahun_kegiatan`),
  ADD KEY `rpjmd_dana_indikatif_id_pelaksana_kegiatan_foreign` (`id_pelaksana_kegiatan`),
  ADD KEY `rpjmd_dana_indikatif_id_sumber_dana_foreign` (`id_sumber_dana`);

--
-- Indeks untuk tabel `rpjmd_kegiatan`
--
ALTER TABLE `rpjmd_kegiatan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rpjmd_kegiatan_id_rpjmd_sub_bidang_foreign` (`id_rpjmd_sub_bidang`),
  ADD KEY `rpjmd_kegiatan_id_kegiatan_foreign` (`id_kegiatan`),
  ADD KEY `rpjmd_kegiatan_id_sasaran_foreign` (`id_sasaran`);

--
-- Indeks untuk tabel `rpjmd_subbidang`
--
ALTER TABLE `rpjmd_subbidang`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rpjmd_subbidang_id_rpjmd_bidang_foreign` (`id_rpjmd_bidang`),
  ADD KEY `rpjmd_subbidang_id_sub_bidang_foreign` (`id_sub_bidang`);

--
-- Indeks untuk tabel `rpjmd_tahun_kegiatan`
--
ALTER TABLE `rpjmd_tahun_kegiatan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rpjmd_tahun_kegiatan_id_rpjmd_kegiatan_foreign` (`id_rpjmd_kegiatan`);

--
-- Indeks untuk tabel `sekretaris_desa`
--
ALTER TABLE `sekretaris_desa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sekretaris_desa_id_desa_foreign` (`id_desa`);

--
-- Indeks untuk tabel `sub_bidang`
--
ALTER TABLE `sub_bidang`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sub_bidang_id_bidang_foreign` (`id_bidang`);

--
-- Indeks untuk tabel `sumber_dana`
--
ALTER TABLE `sumber_dana`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_id_desa_foreign` (`id_desa`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `desa`
--
ALTER TABLE `desa`
  ADD CONSTRAINT `desa_id_kecamatan_foreign` FOREIGN KEY (`id_kecamatan`) REFERENCES `kecamatan` (`id`) ON DELETE SET NULL;

--
-- Ketidakleluasaan untuk tabel `kabupaten`
--
ALTER TABLE `kabupaten`
  ADD CONSTRAINT `kabupaten_id_provinsi_foreign` FOREIGN KEY (`id_provinsi`) REFERENCES `provinsi` (`id`) ON DELETE SET NULL;

--
-- Ketidakleluasaan untuk tabel `kaur_keuangan`
--
ALTER TABLE `kaur_keuangan`
  ADD CONSTRAINT `kaur_keuangan_id_desa_foreign` FOREIGN KEY (`id_desa`) REFERENCES `desa` (`id`) ON DELETE SET NULL;

--
-- Ketidakleluasaan untuk tabel `kecamatan`
--
ALTER TABLE `kecamatan`
  ADD CONSTRAINT `kecamatan_id_kabupaten_foreign` FOREIGN KEY (`id_kabupaten`) REFERENCES `kabupaten` (`id`) ON DELETE SET NULL;

--
-- Ketidakleluasaan untuk tabel `kegiatan`
--
ALTER TABLE `kegiatan`
  ADD CONSTRAINT `kegiatan_id_sub_bidang_foreign` FOREIGN KEY (`id_sub_bidang`) REFERENCES `sub_bidang` (`id`) ON DELETE SET NULL;

--
-- Ketidakleluasaan untuk tabel `kepala_desa`
--
ALTER TABLE `kepala_desa`
  ADD CONSTRAINT `kepala_desa_id_desa_foreign` FOREIGN KEY (`id_desa`) REFERENCES `desa` (`id`) ON DELETE SET NULL;

--
-- Ketidakleluasaan untuk tabel `pelaksana_kegiatan`
--
ALTER TABLE `pelaksana_kegiatan`
  ADD CONSTRAINT `pelaksana_kegiatan_id_desa_foreign` FOREIGN KEY (`id_desa`) REFERENCES `desa` (`id`) ON DELETE SET NULL;

--
-- Ketidakleluasaan untuk tabel `penganggaran_belanja`
--
ALTER TABLE `penganggaran_belanja`
  ADD CONSTRAINT `penganggaran_belanja_id_penganggaran_kegiatan_foreign` FOREIGN KEY (`id_penganggaran_kegiatan`) REFERENCES `penganggaran_kegiatan` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `penganggaran_belanja_id_penganggaran_tahun_foreign` FOREIGN KEY (`id_penganggaran_tahun`) REFERENCES `penganggaran_tahun` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `penganggaran_belanja_id_rekening_objek_foreign` FOREIGN KEY (`id_rekening_objek`) REFERENCES `rekening_objek` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `penganggaran_belanja_id_sumber_dana_foreign` FOREIGN KEY (`id_sumber_dana`) REFERENCES `sumber_dana` (`id`) ON DELETE SET NULL;

--
-- Ketidakleluasaan untuk tabel `penganggaran_bidang`
--
ALTER TABLE `penganggaran_bidang`
  ADD CONSTRAINT `penganggaran_bidang_id_bidang_foreign` FOREIGN KEY (`id_bidang`) REFERENCES `bidang` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `penganggaran_bidang_id_desa_foreign` FOREIGN KEY (`id_desa`) REFERENCES `desa` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `penganggaran_bidang_id_penganggaran_tahun_foreign` FOREIGN KEY (`id_penganggaran_tahun`) REFERENCES `penganggaran_tahun` (`id`) ON DELETE SET NULL;

--
-- Ketidakleluasaan untuk tabel `penganggaran_kegiatan`
--
ALTER TABLE `penganggaran_kegiatan`
  ADD CONSTRAINT `penganggaran_kegiatan_id_kegiatan_foreign` FOREIGN KEY (`id_kegiatan`) REFERENCES `kegiatan` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `penganggaran_kegiatan_id_pelaksana_foreign` FOREIGN KEY (`id_pelaksana`) REFERENCES `pelaksana_kegiatan` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `penganggaran_kegiatan_id_penganggaran_sub_bidang_foreign` FOREIGN KEY (`id_penganggaran_sub_bidang`) REFERENCES `penganggaran_sub_bidang` (`id`) ON DELETE SET NULL;

--
-- Ketidakleluasaan untuk tabel `penganggaran_paket_kegiatan`
--
ALTER TABLE `penganggaran_paket_kegiatan`
  ADD CONSTRAINT `penganggaran_paket_kegiatan_id_penganggaran_kegiatan_foreign` FOREIGN KEY (`id_penganggaran_kegiatan`) REFERENCES `penganggaran_kegiatan` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `penganggaran_paket_kegiatan_id_sumber_dana_foreign` FOREIGN KEY (`id_sumber_dana`) REFERENCES `sumber_dana` (`id`) ON DELETE SET NULL;

--
-- Ketidakleluasaan untuk tabel `penganggaran_pembiayaan_belanja`
--
ALTER TABLE `penganggaran_pembiayaan_belanja`
  ADD CONSTRAINT `penganggaran_pembiayaan_belanja_id_penganggaran_tahun_foreign` FOREIGN KEY (`id_penganggaran_tahun`) REFERENCES `penganggaran_tahun` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `penganggaran_pembiayaan_belanja_id_rekening_objek_foreign` FOREIGN KEY (`id_rekening_objek`) REFERENCES `rekening_objek` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `penganggaran_pembiayaan_belanja_id_sumber_dana_foreign` FOREIGN KEY (`id_sumber_dana`) REFERENCES `sumber_dana` (`id`) ON DELETE SET NULL;

--
-- Ketidakleluasaan untuk tabel `penganggaran_pembiayaan_pendapatan`
--
ALTER TABLE `penganggaran_pembiayaan_pendapatan`
  ADD CONSTRAINT `penganggaran_pembiayaan_pendapatan_id_penganggaran_tahun_foreign` FOREIGN KEY (`id_penganggaran_tahun`) REFERENCES `penganggaran_tahun` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `penganggaran_pembiayaan_pendapatan_id_rekening_objek_foreign` FOREIGN KEY (`id_rekening_objek`) REFERENCES `rekening_objek` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `penganggaran_pembiayaan_pendapatan_id_sumber_dana_foreign` FOREIGN KEY (`id_sumber_dana`) REFERENCES `sumber_dana` (`id`) ON DELETE SET NULL;

--
-- Ketidakleluasaan untuk tabel `penganggaran_pendapatan`
--
ALTER TABLE `penganggaran_pendapatan`
  ADD CONSTRAINT `penganggaran_pendapatan_id_penganggaran_tahun_foreign` FOREIGN KEY (`id_penganggaran_tahun`) REFERENCES `penganggaran_tahun` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `penganggaran_pendapatan_id_rekening_objek_foreign` FOREIGN KEY (`id_rekening_objek`) REFERENCES `rekening_objek` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `penganggaran_pendapatan_id_sumber_dana_foreign` FOREIGN KEY (`id_sumber_dana`) REFERENCES `sumber_dana` (`id`) ON DELETE SET NULL;

--
-- Ketidakleluasaan untuk tabel `penganggaran_sub_bidang`
--
ALTER TABLE `penganggaran_sub_bidang`
  ADD CONSTRAINT `penganggaran_sub_bidang_id_penganggaran_bidang_foreign` FOREIGN KEY (`id_penganggaran_bidang`) REFERENCES `penganggaran_bidang` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `penganggaran_sub_bidang_id_sub_bidang_foreign` FOREIGN KEY (`id_sub_bidang`) REFERENCES `sub_bidang` (`id`) ON DELETE SET NULL;

--
-- Ketidakleluasaan untuk tabel `penganggaran_tahun`
--
ALTER TABLE `penganggaran_tahun`
  ADD CONSTRAINT `penganggaran_tahun_id_desa_foreign` FOREIGN KEY (`id_desa`) REFERENCES `desa` (`id`) ON DELETE SET NULL;

--
-- Ketidakleluasaan untuk tabel `perencanaan_misi`
--
ALTER TABLE `perencanaan_misi`
  ADD CONSTRAINT `perencanaan_misi_id_visi_foreign` FOREIGN KEY (`id_visi`) REFERENCES `perencanaan_visi` (`id`) ON DELETE SET NULL;

--
-- Ketidakleluasaan untuk tabel `perencanaan_sasaran`
--
ALTER TABLE `perencanaan_sasaran`
  ADD CONSTRAINT `perencanaan_sasaran_id_tujuan_foreign` FOREIGN KEY (`id_tujuan`) REFERENCES `perencanaan_tujuan` (`id`) ON DELETE SET NULL;

--
-- Ketidakleluasaan untuk tabel `perencanaan_tujuan`
--
ALTER TABLE `perencanaan_tujuan`
  ADD CONSTRAINT `perencanaan_tujuan_id_misi_foreign` FOREIGN KEY (`id_misi`) REFERENCES `perencanaan_misi` (`id`) ON DELETE SET NULL;

--
-- Ketidakleluasaan untuk tabel `perencanaan_visi`
--
ALTER TABLE `perencanaan_visi`
  ADD CONSTRAINT `perencanaan_visi_id_desa_foreign` FOREIGN KEY (`id_desa`) REFERENCES `desa` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `perencanaan_visi_id_kepala_desa_foreign` FOREIGN KEY (`id_kepala_desa`) REFERENCES `kepala_desa` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `perencanaan_visi_id_sekretaris_desa_foreign` FOREIGN KEY (`id_sekretaris_desa`) REFERENCES `sekretaris_desa` (`id`) ON DELETE SET NULL;

--
-- Ketidakleluasaan untuk tabel `rekening_jenis`
--
ALTER TABLE `rekening_jenis`
  ADD CONSTRAINT `rekening_jenis_id_kelompok_foreign` FOREIGN KEY (`id_kelompok`) REFERENCES `rekening_kelompok` (`id`) ON DELETE SET NULL;

--
-- Ketidakleluasaan untuk tabel `rekening_kelompok`
--
ALTER TABLE `rekening_kelompok`
  ADD CONSTRAINT `rekening_kelompok_id_akun_foreign` FOREIGN KEY (`id_akun`) REFERENCES `rekening_akun` (`id`) ON DELETE SET NULL;

--
-- Ketidakleluasaan untuk tabel `rekening_objek`
--
ALTER TABLE `rekening_objek`
  ADD CONSTRAINT `rekening_objek_id_jenis_foreign` FOREIGN KEY (`id_jenis`) REFERENCES `rekening_jenis` (`id`) ON DELETE SET NULL;

--
-- Ketidakleluasaan untuk tabel `rpjmd_bidang`
--
ALTER TABLE `rpjmd_bidang`
  ADD CONSTRAINT `rpjmd_bidang_id_bidang_foreign` FOREIGN KEY (`id_bidang`) REFERENCES `bidang` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `rpjmd_bidang_id_desa_foreign` FOREIGN KEY (`id_desa`) REFERENCES `desa` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `rpjmd_bidang_id_visi_foreign` FOREIGN KEY (`id_visi`) REFERENCES `perencanaan_visi` (`id`) ON DELETE SET NULL;

--
-- Ketidakleluasaan untuk tabel `rpjmd_dana_indikatif`
--
ALTER TABLE `rpjmd_dana_indikatif`
  ADD CONSTRAINT `rpjmd_dana_indikatif_id_pelaksana_kegiatan_foreign` FOREIGN KEY (`id_pelaksana_kegiatan`) REFERENCES `pelaksana_kegiatan` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `rpjmd_dana_indikatif_id_rpjmd_tahun_kegiatan_foreign` FOREIGN KEY (`id_rpjmd_tahun_kegiatan`) REFERENCES `rpjmd_tahun_kegiatan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `rpjmd_dana_indikatif_id_sumber_dana_foreign` FOREIGN KEY (`id_sumber_dana`) REFERENCES `sumber_dana` (`id`) ON DELETE SET NULL;

--
-- Ketidakleluasaan untuk tabel `rpjmd_kegiatan`
--
ALTER TABLE `rpjmd_kegiatan`
  ADD CONSTRAINT `rpjmd_kegiatan_id_kegiatan_foreign` FOREIGN KEY (`id_kegiatan`) REFERENCES `kegiatan` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `rpjmd_kegiatan_id_rpjmd_sub_bidang_foreign` FOREIGN KEY (`id_rpjmd_sub_bidang`) REFERENCES `rpjmd_subbidang` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `rpjmd_kegiatan_id_sasaran_foreign` FOREIGN KEY (`id_sasaran`) REFERENCES `perencanaan_sasaran` (`id`) ON DELETE SET NULL;

--
-- Ketidakleluasaan untuk tabel `rpjmd_subbidang`
--
ALTER TABLE `rpjmd_subbidang`
  ADD CONSTRAINT `rpjmd_subbidang_id_rpjmd_bidang_foreign` FOREIGN KEY (`id_rpjmd_bidang`) REFERENCES `rpjmd_bidang` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `rpjmd_subbidang_id_sub_bidang_foreign` FOREIGN KEY (`id_sub_bidang`) REFERENCES `sub_bidang` (`id`) ON DELETE SET NULL;

--
-- Ketidakleluasaan untuk tabel `rpjmd_tahun_kegiatan`
--
ALTER TABLE `rpjmd_tahun_kegiatan`
  ADD CONSTRAINT `rpjmd_tahun_kegiatan_id_rpjmd_kegiatan_foreign` FOREIGN KEY (`id_rpjmd_kegiatan`) REFERENCES `rpjmd_kegiatan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `sekretaris_desa`
--
ALTER TABLE `sekretaris_desa`
  ADD CONSTRAINT `sekretaris_desa_id_desa_foreign` FOREIGN KEY (`id_desa`) REFERENCES `desa` (`id`) ON DELETE SET NULL;

--
-- Ketidakleluasaan untuk tabel `sub_bidang`
--
ALTER TABLE `sub_bidang`
  ADD CONSTRAINT `sub_bidang_id_bidang_foreign` FOREIGN KEY (`id_bidang`) REFERENCES `bidang` (`id`) ON DELETE SET NULL;

--
-- Ketidakleluasaan untuk tabel `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_id_desa_foreign` FOREIGN KEY (`id_desa`) REFERENCES `desa` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
