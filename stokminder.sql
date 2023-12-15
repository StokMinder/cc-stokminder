-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 15 Des 2023 pada 12.57
-- Versi server: 10.4.22-MariaDB
-- Versi PHP: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `stokminder`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `outputrekomendasi`
--

CREATE TABLE `outputrekomendasi` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `output_date` date NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `products`
--

INSERT INTO `products` (`id`, `name`, `category`) VALUES
(1, 'Es Batu', 'drink'),
(2, 'Nasi Bandeng', 'food'),
(3, 'Jeruk', 'drink'),
(4, 'Sate Kikil', 'food');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sales`
--

CREATE TABLE `sales` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `sales_date` date NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `sales`
--

INSERT INTO `sales` (`id`, `user_id`, `product_id`, `quantity`, `sales_date`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 15, '2023-01-01', '2023-12-15 09:39:53', '2023-12-15 09:56:10'),
(2, 1, 2, 9, '2023-01-01', '2023-12-15 09:39:53', '2023-12-15 09:56:10'),
(3, 1, 3, 10, '2023-01-01', '2023-12-15 09:39:53', '2023-12-15 09:56:10'),
(4, 1, 4, 3, '2023-01-01', '2023-12-15 09:39:53', '2023-12-15 09:56:10'),
(7, 1, 1, 15, '2023-01-02', '2023-12-15 09:58:49', '2023-12-15 10:00:24'),
(8, 1, 2, 10, '2023-01-02', '2023-12-15 09:59:47', '2023-12-15 10:00:24'),
(9, 1, 3, 10, '2023-01-02', '2023-12-15 09:59:47', '2023-12-15 10:00:24'),
(10, 1, 4, 3, '2023-01-02', '2023-12-15 09:59:47', '2023-12-15 10:00:24'),
(11, 2, 1, 15, '2023-01-02', '2023-12-15 10:00:42', '2023-12-15 10:00:42'),
(12, 2, 2, 10, '2023-01-02', '2023-12-15 10:00:42', '2023-12-15 10:00:42'),
(13, 2, 3, 10, '2023-01-02', '2023-12-15 10:00:42', '2023-12-15 10:00:42'),
(14, 2, 4, 3, '2023-01-02', '2023-12-15 10:00:42', '2023-12-15 10:00:42'),
(15, 1, 1, 15, '2023-12-15', '2023-12-15 10:20:11', '2023-12-15 10:20:11'),
(16, 1, 2, 5, '2023-12-15', '2023-12-15 10:20:11', '2023-12-15 10:20:11'),
(17, 1, 3, 10, '2023-12-15', '2023-12-15 10:20:11', '2023-12-15 10:20:11'),
(18, 1, 4, 3, '2023-12-15', '2023-12-15 10:20:11', '2023-12-15 10:20:11'),
(19, 1, 1, 15, '2023-12-14', '2023-12-15 10:20:28', '2023-12-15 10:20:28'),
(20, 1, 2, 5, '2023-12-14', '2023-12-15 10:20:28', '2023-12-15 10:20:28'),
(21, 1, 3, 10, '2023-12-14', '2023-12-15 10:20:28', '2023-12-15 10:20:28'),
(22, 1, 4, 3, '2023-12-14', '2023-12-15 10:20:28', '2023-12-15 10:20:28'),
(23, 1, 1, 15, '2023-12-13', '2023-12-15 10:20:32', '2023-12-15 10:20:32'),
(24, 1, 2, 5, '2023-12-13', '2023-12-15 10:20:32', '2023-12-15 10:20:32'),
(25, 1, 3, 10, '2023-12-13', '2023-12-15 10:20:32', '2023-12-15 10:20:32'),
(26, 1, 4, 3, '2023-12-13', '2023-12-15 10:20:32', '2023-12-15 10:20:32'),
(27, 1, 1, 15, '2023-12-12', '2023-12-15 10:20:36', '2023-12-15 10:20:36'),
(28, 1, 2, 5, '2023-12-12', '2023-12-15 10:20:36', '2023-12-15 10:20:36'),
(29, 1, 3, 10, '2023-12-12', '2023-12-15 10:20:36', '2023-12-15 10:20:36'),
(30, 1, 4, 3, '2023-12-12', '2023-12-15 10:20:36', '2023-12-15 10:20:36'),
(31, 1, 1, 15, '2023-12-11', '2023-12-15 10:20:39', '2023-12-15 10:20:39'),
(32, 1, 2, 5, '2023-12-11', '2023-12-15 10:20:39', '2023-12-15 10:20:39'),
(33, 1, 3, 10, '2023-12-11', '2023-12-15 10:20:39', '2023-12-15 10:20:39'),
(34, 1, 4, 3, '2023-12-11', '2023-12-15 10:20:39', '2023-12-15 10:20:39'),
(35, 1, 1, 15, '2023-12-10', '2023-12-15 10:20:43', '2023-12-15 10:20:43'),
(36, 1, 2, 5, '2023-12-10', '2023-12-15 10:20:43', '2023-12-15 10:20:43'),
(37, 1, 3, 10, '2023-12-10', '2023-12-15 10:20:43', '2023-12-15 10:20:43'),
(38, 1, 4, 3, '2023-12-10', '2023-12-15 10:20:43', '2023-12-15 10:20:43'),
(39, 1, 1, 15, '2023-12-09', '2023-12-15 10:20:56', '2023-12-15 10:20:56'),
(40, 1, 2, 5, '2023-12-09', '2023-12-15 10:20:56', '2023-12-15 10:20:56'),
(41, 1, 3, 10, '2023-12-09', '2023-12-15 10:20:56', '2023-12-15 10:20:56'),
(42, 1, 4, 3, '2023-12-09', '2023-12-15 10:20:56', '2023-12-15 10:20:56'),
(43, 1, 1, 15, '2023-12-08', '2023-12-15 10:27:47', '2023-12-15 10:27:47'),
(44, 1, 2, 5, '2023-12-08', '2023-12-15 10:27:47', '2023-12-15 10:27:47'),
(45, 1, 3, 10, '2023-12-08', '2023-12-15 10:27:47', '2023-12-15 10:27:47'),
(46, 1, 4, 3, '2023-12-08', '2023-12-15 10:27:47', '2023-12-15 10:27:47'),
(47, 1, 1, 15, '2023-12-07', '2023-12-15 10:27:52', '2023-12-15 10:27:52'),
(48, 1, 2, 5, '2023-12-07', '2023-12-15 10:27:52', '2023-12-15 10:27:52'),
(49, 1, 3, 10, '2023-12-07', '2023-12-15 10:27:52', '2023-12-15 10:27:52'),
(50, 1, 4, 3, '2023-12-07', '2023-12-15 10:27:52', '2023-12-15 10:27:52'),
(51, 1, 1, 15, '2023-12-06', '2023-12-15 10:27:56', '2023-12-15 10:27:56'),
(52, 1, 2, 5, '2023-12-06', '2023-12-15 10:27:56', '2023-12-15 10:27:56'),
(53, 1, 3, 10, '2023-12-06', '2023-12-15 10:27:56', '2023-12-15 10:27:56'),
(54, 1, 4, 3, '2023-12-06', '2023-12-15 10:27:56', '2023-12-15 10:27:56');

-- --------------------------------------------------------

--
-- Struktur dari tabel `stock`
--

CREATE TABLE `stock` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `stock_date` date NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `stock`
--

INSERT INTO `stock` (`id`, `user_id`, `product_id`, `quantity`, `stock_date`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 110, '2023-12-14', '2023-12-15 10:05:50', '2023-12-15 10:06:51'),
(2, 1, 2, 15, '2023-12-14', '2023-12-15 10:05:50', '2023-12-15 10:06:51'),
(3, 1, 3, 18, '2023-12-14', '2023-12-15 10:05:50', '2023-12-15 10:06:51'),
(4, 1, 4, 3, '2023-12-14', '2023-12-15 10:05:50', '2023-12-15 10:05:50'),
(5, 2, 1, 110, '2023-12-14', '2023-12-15 10:06:00', '2023-12-15 10:06:33'),
(6, 2, 2, 15, '2023-12-14', '2023-12-15 10:06:00', '2023-12-15 10:06:33'),
(7, 2, 3, 18, '2023-12-14', '2023-12-15 10:06:00', '2023-12-15 10:06:33'),
(8, 2, 4, 3, '2023-12-14', '2023-12-15 10:06:00', '2023-12-15 10:06:33');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `stock`
--
ALTER TABLE `stock`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `sales`
--
ALTER TABLE `sales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT untuk tabel `stock`
--
ALTER TABLE `stock`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
