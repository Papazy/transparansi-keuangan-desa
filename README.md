# Sikeudes - Sistem Keuangan Desa

[![Laravel Version](https://img.shields.io/badge/Laravel-8.x-red.svg)](https://laravel.com)
[![PHP Version](https://img.shields.io/badge/PHP-7.4-blue.svg)](https://php.net/)
[![MySQL Version](https://img.shields.io/badge/MySQL-5.7%2B-blue.svg)](https://www.mysql.com/)

Sistem pengelolaan keuangan desa berbasis web untuk meningkatkan transparansi dan akuntabilitas pengelolaan keuangan desa.

![Screenshot Aplikasi](screenshot.png)

## 🚀 Fitur Utama
- 🔹 **Manajemen Anggaran**: Pencatatan dan pelaporan anggaran desa.
- 🔹 **Transparansi Keuangan**: Menampilkan laporan keuangan desa yang dapat diakses publik.
- 🔹 **Pengelolaan Pendapatan & Pengeluaran**: Mencatat setiap transaksi keuangan desa.
- 🔹 **Manajemen Pengguna**: Hak akses berdasarkan peran pengguna (admin, keuangan, masyarakat).
- 🔹 **Laporan & Grafik**: Menyajikan data dalam bentuk laporan dan grafik interaktif.

## 🛠️ Teknologi yang Digunakan
- **Framework**: Laravel 8
- **Bahasa Pemrograman**: PHP 7.4
- **Database**: MySQL
- **Frontend**: Blade Template + Bootstrap

## Instalasi

1. Clone repositori:
```bash
git clone https://github.com/Papazy/transparansi-keuangan-desa.git
cd transparansi-keuangan-desa
```
2. Instalasi Depedensi
```bash
composer install
```
3. Konfigurasi .env
Salin `.env.example` dan ubah namanya menjadi `.env`
```bash
cp .env.example .env
```
lalu edit `.env`
```bash
DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=sikeudes
DB_USERNAME=root
DB_PASSWORD=
```
4. Generate Key
```bash
php artisan key:generate
```
5. Upload Database
database dapat ditemukan di `database/sikeudes.sql` gunakan phpmyadmin atau lainnya untuk mengupload dengan nama database `sikeudes`

6. Jalankan Server
```bash
php artisan serve
```

# 🔑 Akun Default

| Peran     | Email               | Password  |
|-----------|---------------------|-----------|
| **Admin** | [admin@gmail.com](mailto:admin@desa.com) | password |


