-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 11 Jul 2024 pada 08.09
-- Versi server: 10.4.25-MariaDB
-- Versi PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_penjualan`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang`
--

CREATE TABLE `barang` (
  `id` int(8) NOT NULL,
  `barcode` int(20) DEFAULT NULL,
  `name` char(100) DEFAULT NULL,
  `harga_jual` bigint(20) DEFAULT NULL,
  `harga_beli` bigint(20) DEFAULT NULL,
  `stok` int(10) DEFAULT NULL,
  `kategori_id` int(8) NOT NULL,
  `satuan_id` int(8) NOT NULL,
  `user_id` int(8) NOT NULL,
  `suplier_id` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `barang`
--

INSERT INTO `barang` (`id`, `barcode`, `name`, `harga_jual`, `harga_beli`, `stok`, `kategori_id`, `satuan_id`, `user_id`, `suplier_id`) VALUES
(1, 202023322, 'beras', 55000, 50000, 100, 2, 6, 1, 5),
(2, 202026313, 'gula', 20000, 15000, 250, 1, 6, 3, 1),
(3, 202023103, 'minyak goreng', 30000, 25000, 190, 4, 5, 5, 2),
(4, 202043233, 'tepung terigu', 10000, 7500, 200, 5, 8, 1, 4),
(5, 202095795, 'telur ayam', 25000, 20000, 600, 4, 4, 2, 3);

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_beli`
--

CREATE TABLE `detail_beli` (
  `id` int(8) NOT NULL,
  `harga` int(11) DEFAULT NULL,
  `qty` int(10) DEFAULT NULL,
  `subtotal` bigint(20) DEFAULT NULL,
  `pembelian_id` int(8) NOT NULL,
  `barang_id` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `detail_beli`
--

INSERT INTO `detail_beli` (`id`, `harga`, `qty`, `subtotal`, `pembelian_id`, `barang_id`) VALUES
(1, 20000, 15, 300000, 1, 1),
(2, 15000, 50, 750000, 2, 2),
(3, 20000, 20, 400000, 3, 3),
(4, 10000, 80, 800000, 4, 4),
(5, 20000, 30, 600000, 5, 5);

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_jual`
--

CREATE TABLE `detail_jual` (
  `id` int(8) NOT NULL,
  `harga` int(11) DEFAULT NULL,
  `qty` int(10) DEFAULT NULL,
  `subtotal` bigint(20) DEFAULT NULL,
  `penjualan_id` int(8) NOT NULL,
  `barang_id` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `detail_jual`
--

INSERT INTO `detail_jual` (`id`, `harga`, `qty`, `subtotal`, `penjualan_id`, `barang_id`) VALUES
(1, 4000, 3, 12000, 1, 1),
(2, 21000, 4, 84000, 2, 2),
(3, 22000, 2, 44000, 3, 3),
(4, 8000, 4, 32000, 4, 4),
(5, 20000, 2, 40000, 5, 5);

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori`
--

CREATE TABLE `kategori` (
  `id` int(8) NOT NULL,
  `name` char(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `kategori`
--

INSERT INTO `kategori` (`id`, `name`) VALUES
(1, 'pangan'),
(2, 'bumbu dapur'),
(3, 'minyak dan lemak'),
(4, 'tepung dan biji-bijian'),
(5, 'produk hewani'),
(8, 'rania');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kustomer`
--

CREATE TABLE `kustomer` (
  `id` int(8) NOT NULL,
  `nik` int(16) DEFAULT NULL,
  `name` char(100) DEFAULT NULL,
  `telp` char(20) DEFAULT NULL,
  `email` char(100) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `kustomer`
--

INSERT INTO `kustomer` (`id`, `nik`, `name`, `telp`, `email`, `alamat`) VALUES
(1, 2023823813, 'bima', '81263748483', 'bims@gmail.com', 'bumi mas raya no 34'),
(2, 2031232032, 'arya', '81264738838', 'arry4@gmail.com', 'binjai no 44'),
(3, 2147483647, 'riska', '81278903845', 'risk4@gmail.com', 'adhyaksa 2'),
(4, 2147483647, 'dewi', '81294463930', 'dedewi@gmail.com', 'bukit raya no 23'),
(5, 2147483647, 'amelia', '81293621387', 'memels4@gmail.com', 'kejaksaan no 12'),
(6, 2147483647, 'lutfi', '81283243243', 'lutfay@gmail.com', 'kayu tangi 2');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembelian`
--

CREATE TABLE `pembelian` (
  `id` int(8) NOT NULL,
  `invoice` int(20) DEFAULT NULL,
  `total` bigint(20) DEFAULT NULL,
  `bayar` bigint(11) DEFAULT NULL,
  `diskripsi` varchar(255) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `suplier_id` int(8) NOT NULL,
  `user_id` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `pembelian`
--

INSERT INTO `pembelian` (`id`, `invoice`, `total`, `bayar`, `diskripsi`, `tanggal`, `suplier_id`, `user_id`) VALUES
(1, 2147483647, 5000000, 5000000, 'beras 50 kg', '2024-02-13', 5, 1),
(2, 2147483647, 250000, 250000, 'gula 5kg', '2023-04-25', 3, 4),
(3, 2147483647, 300000, 300000, 'minyak goreng 20 liter', '2023-04-16', 2, 5),
(4, 2147483647, 400000, 400000, 'tepung terigu 100 pcs', '2023-04-22', 4, 3),
(5, 2147483647, 450000, 450000, 'telur ayam 20 box', '2023-04-20', 3, 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `penjualan`
--

CREATE TABLE `penjualan` (
  `id` int(8) NOT NULL,
  `invoice` int(20) DEFAULT NULL,
  `total` bigint(200) DEFAULT NULL,
  `bayar` bigint(11) DEFAULT NULL,
  `kembali` int(11) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `kustomer_id` int(8) DEFAULT NULL,
  `user_id` int(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `penjualan`
--

INSERT INTO `penjualan` (`id`, `invoice`, `total`, `bayar`, `kembali`, `tanggal`, `kustomer_id`, `user_id`) VALUES
(1, 1801986133, 6000, 10000, 1000, '2024-04-23', 1, 1),
(2, 180198613, 25000, 30000, 5000, '2024-04-03', 2, 2),
(3, 1801986131, 26000, 50000, 24000, '2024-04-04', 3, 4),
(4, 1801986135, 15000, 20000, 5000, '2024-04-18', 4, 5),
(5, 1801986130, 30000, 50000, 20000, '2024-04-11', 5, 3),
(6, 1801986131, 40000, 50000, 10000, '2024-04-05', 6, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `satuan`
--

CREATE TABLE `satuan` (
  `id` int(8) NOT NULL,
  `name` char(100) DEFAULT NULL,
  `diskripsi` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `satuan`
--

INSERT INTO `satuan` (`id`, `name`, `diskripsi`) VALUES
(1, 'kg', 'kilogram'),
(2, 'ltr', 'liter'),
(3, 'pcs', ''),
(4, 'mtr', 'meter'),
(5, 'box', 'kotak'),
(9, 'das', NULL),
(12, '', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `suplier`
--

CREATE TABLE `suplier` (
  `id` int(8) NOT NULL,
  `nik` int(16) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `telp` char(20) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `perusahaan` varchar(150) DEFAULT NULL,
  `nama_bank` varchar(150) DEFAULT NULL,
  `nama_akun_bank` varchar(150) DEFAULT NULL,
  `no_akun_bank` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `suplier`
--

INSERT INTO `suplier` (`id`, `nik`, `name`, `telp`, `email`, `alamat`, `perusahaan`, `nama_bank`, `nama_akun_bank`, `no_akun_bank`) VALUES
(1, 221448594, 'timothy', '8129384993', 'timo32@gmail.com', 'komplek persada mas no 22', 'pt pangan sejahtera', 'timothy ronald', 'bca', '60023120004'),
(2, 221023486, 'hotman', '8123980322', 'hotman911@gmail.com', 'ahmad yani no 12', 'cv bumbu makmur', 'hotman hutapea', 'bca', '60020483747'),
(3, 221948473, 'endi', '8129930484', 'end1@gmail.com', 'jl bangau no 34', 'pt minyak kita  ', 'endi simanjuntak', 'mandiri', '42220094844'),
(4, 221084322, 'edgar', '8129736484', 'edgar19@gmail.com', 'komplek green yakin no 63', 'sumber tepung jaya', 'edgar putra', 'bri', '22111000332'),
(5, 221004532, 'melvin', '8129363468', 'melv1n@gmail.com', 'jl kenanga no 11', 'sumber tepung jaya', 'melvin tenggara', 'bni', '22111554783');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id` int(8) NOT NULL,
  `nik` int(16) DEFAULT NULL,
  `username` char(100) DEFAULT NULL,
  `full_name` varchar(150) DEFAULT NULL,
  `pasword` varchar(255) DEFAULT NULL,
  `tipe` char(20) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `telp` char(20) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `is_active` char(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id`, `nik`, `username`, `full_name`, `pasword`, `tipe`, `email`, `telp`, `alamat`, `is_active`) VALUES
(1, 221232334, 'ali', 'ali sitorus', 'alisad22', 'owner', 'all1strs@gmail.com', '81249997473', 'batuulin 3 no 10', 'active'),
(2, 221234265, 'budi', 'budiono', 'bubudew', 'admin', 'diono46@gmail.com', '81294763837', 'mahligai no 22', 'active'),
(3, 221267454, 'anang', 'anang edi', 'anangdut', 'kasir', 'nangdut4@gmail.com', '81294738474', 'citraland no12', 'active'),
(4, 221044340, 'mutia', 'mutia sandra', 'mutndra21', 'kasir', 'tiasandra21@gmail.com', '81294366282', 'antasan kecil timur rt 11', 'active'),
(5, 221657436, 'sisla', 'siska putri', 'sskaptr1', 'kasir', 'siskaputri11@gmail.com', '81255421899', 'komplek bunyamin no 45', 'active');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `suplier_id` (`suplier_id`),
  ADD KEY `satuan_id` (`satuan_id`),
  ADD KEY `kategori_id` (`kategori_id`);

--
-- Indeks untuk tabel `detail_beli`
--
ALTER TABLE `detail_beli`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pembelian_id` (`pembelian_id`),
  ADD KEY `barang_id` (`barang_id`);

--
-- Indeks untuk tabel `detail_jual`
--
ALTER TABLE `detail_jual`
  ADD PRIMARY KEY (`id`),
  ADD KEY `penjualan_id` (`penjualan_id`),
  ADD KEY `barang_id` (`barang_id`);

--
-- Indeks untuk tabel `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `kustomer`
--
ALTER TABLE `kustomer`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pembelian`
--
ALTER TABLE `pembelian`
  ADD PRIMARY KEY (`id`),
  ADD KEY `suplier_id` (`suplier_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indeks untuk tabel `penjualan`
--
ALTER TABLE `penjualan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pk` (`id`),
  ADD KEY `kustomer_id` (`kustomer_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indeks untuk tabel `satuan`
--
ALTER TABLE `satuan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `suplier`
--
ALTER TABLE `suplier`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `barang`
--
ALTER TABLE `barang`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT untuk tabel `detail_beli`
--
ALTER TABLE `detail_beli`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `detail_jual`
--
ALTER TABLE `detail_jual`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `kustomer`
--
ALTER TABLE `kustomer`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `pembelian`
--
ALTER TABLE `pembelian`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `penjualan`
--
ALTER TABLE `penjualan`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `satuan`
--
ALTER TABLE `satuan`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT untuk tabel `suplier`
--
ALTER TABLE `suplier`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `detail_beli`
--
ALTER TABLE `detail_beli`
  ADD CONSTRAINT `detail_beli_ibfk_1` FOREIGN KEY (`pembelian_id`) REFERENCES `pembelian` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detail_beli_ibfk_2` FOREIGN KEY (`barang_id`) REFERENCES `barang` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `detail_jual`
--
ALTER TABLE `detail_jual`
  ADD CONSTRAINT `detail_jual_ibfk_1` FOREIGN KEY (`penjualan_id`) REFERENCES `penjualan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detail_jual_ibfk_2` FOREIGN KEY (`barang_id`) REFERENCES `barang` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `pembelian`
--
ALTER TABLE `pembelian`
  ADD CONSTRAINT `pembelian_ibfk_1` FOREIGN KEY (`suplier_id`) REFERENCES `suplier` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pembelian_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
