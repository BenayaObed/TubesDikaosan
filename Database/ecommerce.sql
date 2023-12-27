-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 27 Des 2023 pada 14.20
-- Versi server: 10.4.28-MariaDB
-- Versi PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecommerce`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(100) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `visible` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `categories`
--

INSERT INTO `categories` (`category_id`, `category_name`, `created_at`, `updated_at`, `visible`) VALUES
(3, 'Celana', '2023-12-26 22:24:12.000000', '2023-12-27 08:59:19.000000', 1),
(6, 'Kemeja', '2023-12-27 08:47:10.000000', '2023-12-27 08:47:10.000000', 1),
(7, 'Kaos', '2023-12-27 08:47:22.000000', '2023-12-27 08:47:22.000000', 1),
(8, 'Baju', '2023-12-27 08:47:30.000000', '2023-12-27 08:47:30.000000', 1),
(9, 'Jaket', '2023-12-27 08:47:36.000000', '2023-12-27 08:47:36.000000', 1),
(10, 'Rok', '2023-12-27 19:17:58.000000', '2023-12-27 19:17:58.000000', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `chats`
--

CREATE TABLE `chats` (
  `chat_id` int(11) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `user_sender_id` varchar(255) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `customer_address`
--

CREATE TABLE `customer_address` (
  `id` int(11) NOT NULL,
  `address` text DEFAULT NULL,
  `city` varchar(64) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `phone_number` varchar(16) DEFAULT NULL,
  `postal_code` varchar(5) DEFAULT NULL,
  `province` varchar(32) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `id_customer` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `customer_address`
--

INSERT INTO `customer_address` (`id`, `address`, `city`, `created_at`, `phone_number`, `postal_code`, `province`, `updated_at`, `id_customer`) VALUES
(1, '', '', '2023-12-26 11:08:39.000000', '', '', '', '2023-12-26 11:08:39.000000', 'dc9c13e9-f294-48c9-9e0a-69c78d31d99a'),
(2, '', '', '2023-12-26 11:15:07.000000', '', '', '', '2023-12-26 11:15:07.000000', 'dc9c13e9-f294-48c9-9e0a-69c78d31d99a'),
(3, 'a', 'a', '2023-12-26 11:16:10.000000', '2', '1', 'a', '2023-12-26 11:16:10.000000', 'dc9c13e9-f294-48c9-9e0a-69c78d31d99a'),
(4, 's', 's', '2023-12-26 11:21:22.000000', '1', '1', 's', '2023-12-26 11:21:22.000000', 'dc9c13e9-f294-48c9-9e0a-69c78d31d99a'),
(5, 'Ciganitri', 'Bandung', '2023-12-26 16:33:55.000000', '081360255137', '5623', 'Jawa Barat', '2023-12-26 16:33:55.000000', '0aac3b19-1d7f-4b7f-8198-853cffdf62e5'),
(6, '', '', '2023-12-26 16:43:02.000000', '', '', '', '2023-12-26 16:43:02.000000', '0aac3b19-1d7f-4b7f-8198-853cffdf62e5'),
(7, '', '', '2023-12-26 18:31:19.000000', '', '', '', '2023-12-26 18:31:19.000000', 'dc9c13e9-f294-48c9-9e0a-69c78d31d99a'),
(8, 'Ciganitri', 'Bandung', '2023-12-27 09:01:31.000000', '082746252344', '5623', 'Jawa Barat', '2023-12-27 09:01:31.000000', 'dc9c13e9-f294-48c9-9e0a-69c78d31d99a'),
(9, 'Ciganitri', 'Bandung', '2023-12-27 09:03:04.000000', '082746252344', '5623', 'Jawa Barat', '2023-12-27 09:03:04.000000', '0aac3b19-1d7f-4b7f-8198-853cffdf62e5'),
(10, 'Ciganitri', 'Bandung', '2023-12-27 09:04:23.000000', '082746252344', '5623', 'Jawa Barat', '2023-12-27 09:04:23.000000', '0aac3b19-1d7f-4b7f-8198-853cffdf62e5');

-- --------------------------------------------------------

--
-- Struktur dari tabel `images`
--

CREATE TABLE `images` (
  `image_id` int(11) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `images`
--

INSERT INTO `images` (`image_id`, `created_at`, `image`, `updated_at`, `product_id`) VALUES
(8, '2023-12-27 19:12:30.000000', '1703679150424ffea06b71de8abf70785413aa257ae34.jpg', '2023-12-27 19:12:30.000000', 6),
(9, '2023-12-27 19:16:17.000000', '1703679377516bd8dacdecdf8286ca47a54b8620e58f7.jpg', '2023-12-27 19:16:17.000000', 7),
(10, '2023-12-27 19:20:23.000000', '17036796234935312052a2c358900bfc4172719a16575.jpg', '2023-12-27 19:20:23.000000', 8),
(11, '2023-12-27 19:22:39.000000', '1703679759309166f4fb0c4317311bca36f3c0e9fbe08.jpg', '2023-12-27 19:22:39.000000', 9),
(12, '2023-12-27 20:08:29.000000', '1703682509677001de8f943bd925ede4f9c0d60d0ab7b.jpg', '2023-12-27 20:08:29.000000', 10);

-- --------------------------------------------------------

--
-- Struktur dari tabel `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `notes` varchar(128) DEFAULT NULL,
  `status` varchar(16) DEFAULT 'draft',
  `updated_at` datetime(6) DEFAULT NULL,
  `address_id` int(11) DEFAULT NULL,
  `payment_id` int(11) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `orders`
--

INSERT INTO `orders` (`order_id`, `created_at`, `notes`, `status`, `updated_at`, `address_id`, `payment_id`, `user_id`) VALUES
(12, '2023-12-27 19:13:37.000000', NULL, 'draft', '2023-12-27 19:13:37.000000', NULL, NULL, 'dc9c13e9-f294-48c9-9e0a-69c78d31d99a');

-- --------------------------------------------------------

--
-- Struktur dari tabel `orders_item`
--

CREATE TABLE `orders_item` (
  `order_item_id` int(11) NOT NULL,
  `color` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `size` varchar(255) DEFAULT NULL,
  `total_price` int(11) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `orders_item`
--

INSERT INTO `orders_item` (`order_item_id`, `color`, `created_at`, `quantity`, `size`, `total_price`, `updated_at`, `order_id`, `product_id`) VALUES
(19, 'Putih', '2023-12-27 19:13:37.000000', 1, 'XL', 199999, '2023-12-27 19:13:37.000000', 12, 6);

-- --------------------------------------------------------

--
-- Struktur dari tabel `payments`
--

CREATE TABLE `payments` (
  `payment_id` int(11) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `payment_status` varchar(255) DEFAULT NULL,
  `payment_total` float DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `payment_method_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `payments`
--

INSERT INTO `payments` (`payment_id`, `created_at`, `payment_status`, `payment_total`, `updated_at`, `payment_method_id`) VALUES
(1, '2023-12-26 16:34:18.000000', 'PAID', 70000, '2023-12-26 16:34:18.000000', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `payment_method`
--

CREATE TABLE `payment_method` (
  `id` int(11) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `is_active` int(11) DEFAULT NULL,
  `norek` varchar(255) DEFAULT NULL,
  `payment_method_name` varchar(255) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `payment_method`
--

INSERT INTO `payment_method` (`id`, `created_at`, `is_active`, `norek`, `payment_method_name`, `updated_at`) VALUES
(1, '2023-12-26 11:00:49.000000', 1, '8633943259', 'Bank Central Asia', '2023-12-26 11:00:49.000000'),
(2, '2023-12-26 11:00:49.000000', 1, '0176313455', 'Bank Negara Indonesia', '2023-12-26 11:00:49.000000'),
(3, '2023-12-26 11:00:49.000000', 1, '231878968646217', 'Bank Rakyat Indonesia', '2023-12-26 11:00:49.000000'),
(4, '2023-12-26 11:00:49.000000', 1, '5859319568728', 'Bank MANDIRI', '2023-12-26 11:00:49.000000');

-- --------------------------------------------------------

--
-- Struktur dari tabel `product`
--

CREATE TABLE `product` (
  `product_id` int(11) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `name_product` varchar(100) DEFAULT NULL,
  `price` int(11) NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `visible` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `product`
--

INSERT INTO `product` (`product_id`, `created_at`, `description`, `name_product`, `price`, `updated_at`, `visible`, `category_id`) VALUES
(6, '2023-12-27 19:12:30.000000', 'Hadirkan sentuhan gaya kasual yang nyaman dengan Kaos Katun Wanita kami. Dirancang khusus untuk memberikan kenyamanan sepanjang hari, kaos ini terbuat dari katun berkualitas tinggi yang lembut di kulit dan memberikan pernapasan alami.', 'Kaos Katun Wanita ', 199999, '2023-12-27 19:13:37.000000', 1, 7),
(7, '2023-12-27 19:16:17.000000', 'Bergaya dengan penuh kepercayaan dengan Jaket Kasual Wanita kami yang menawarkan kombinasi sempurna antara kehangatan dan keanggunan kasual. Dirancang untuk menonjolkan keindahan dan kepraktisan, jaket ini menjadi pilihan ideal untuk penampilan kasual yang tetap trendy.', 'Woman Casual Jacket ', 599999, '2023-12-27 19:16:17.000000', 1, 9),
(8, '2023-12-27 19:20:23.000000', 'Berikan sentuhan kesegaran pada gaya Anda dengan Rok Pendek Wanita kami, sebuah pilihan yang menggabungkan kenyamanan dan kecantikan. Dirancang untuk merayakan kefemininan Anda, rok pendek ini cocok untuk berbagai kesempatan dan memberikan kebebasan gerak untuk gaya hidup aktif Anda.', 'Rok Pendek Wanita', 399999, '2023-12-27 19:20:23.000000', 1, 10),
(9, '2023-12-27 19:22:39.000000', 'Tampilkan kehangatan dan gaya dengan koleksi Sweater Pria kami, busana yang tidak hanya memberikan kenyamanan luar biasa tetapi juga menambahkan sentuhan modis pada setiap penampilan Anda. Terbuat dari bahan berkualitas tinggi, sweater ini menjadi pilihan yang sempurna untuk menemani kegiatan sehari-hari Anda.', 'Sweater Pria', 249999, '2023-12-27 19:22:39.000000', 1, 9),
(10, '2023-12-27 20:08:29.000000', 'Hadapi cuaca hangat dengan gaya yang tetap trendi menggunakan Celana Pendek Pria kami. Dirancang untuk kenyamanan sepanjang hari dan penampilan yang tak terbantahkan, celana pendek ini menjadi pilihan ideal untuk kegiatan santai hingga petualangan luar ruangan.', 'Celana Pendek Pria', 149999, '2023-12-27 20:08:29.000000', 1, 3);

-- --------------------------------------------------------

--
-- Struktur dari tabel `reviews`
--

CREATE TABLE `reviews` (
  `review_id` int(11) NOT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `rate` float DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `roles`
--

CREATE TABLE `roles` (
  `role_id` int(11) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `role_name` varchar(100) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `roles`
--

INSERT INTO `roles` (`role_id`, `created_at`, `role_name`, `updated_at`) VALUES
(1, '2023-12-26 11:00:48.000000', 'CUSTOMER', '2023-12-26 11:00:48.000000'),
(2, '2023-12-26 11:00:48.000000', 'ADMIN', '2023-12-26 11:00:48.000000');

-- --------------------------------------------------------

--
-- Struktur dari tabel `roles_seq`
--

CREATE TABLE `roles_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `roles_seq`
--

INSERT INTO `roles_seq` (`next_val`) VALUES
(101);

-- --------------------------------------------------------

--
-- Struktur dari tabel `stock`
--

CREATE TABLE `stock` (
  `stock_id` int(11) NOT NULL,
  `color` varchar(20) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `size` varchar(3) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `stock`
--

INSERT INTO `stock` (`stock_id`, `color`, `created_at`, `quantity`, `size`, `updated_at`, `product_id`) VALUES
(57, 'Putih', '2023-12-27 19:12:30.000000', 10, 'S', '2023-12-27 19:12:30.000000', 6),
(58, 'Putih', '2023-12-27 19:12:30.000000', 10, 'M', '2023-12-27 19:12:30.000000', 6),
(59, 'Putih', '2023-12-27 19:12:30.000000', 8, 'L', '2023-12-27 19:12:30.000000', 6),
(60, 'Putih', '2023-12-27 19:12:30.000000', 10, 'XL', '2023-12-27 19:12:30.000000', 6),
(61, 'Pink', '2023-12-27 19:12:30.000000', 15, 'S', '2023-12-27 19:12:30.000000', 6),
(62, 'Pink', '2023-12-27 19:12:30.000000', 10, 'M', '2023-12-27 19:12:30.000000', 6),
(63, 'Pink', '2023-12-27 19:12:30.000000', 7, 'L', '2023-12-27 19:12:30.000000', 6),
(64, 'Pink', '2023-12-27 19:12:30.000000', 11, 'XL', '2023-12-27 19:12:30.000000', 6),
(65, 'Ungu', '2023-12-27 19:12:30.000000', 12, 'S', '2023-12-27 19:12:30.000000', 6),
(66, 'Ungu', '2023-12-27 19:12:30.000000', 15, 'M', '2023-12-27 19:12:30.000000', 6),
(67, 'Ungu', '2023-12-27 19:12:30.000000', 9, 'L', '2023-12-27 19:12:30.000000', 6),
(68, 'Ungu', '2023-12-27 19:12:30.000000', 7, 'XL', '2023-12-27 19:12:30.000000', 6),
(69, 'Ungu', '2023-12-27 19:16:17.000000', 10, 'S', '2023-12-27 19:16:17.000000', 7),
(70, 'Ungu', '2023-12-27 19:16:17.000000', 20, 'M', '2023-12-27 19:16:17.000000', 7),
(71, 'Ungu', '2023-12-27 19:16:17.000000', 19, 'L', '2023-12-27 19:16:17.000000', 7),
(72, 'Ungu', '2023-12-27 19:16:17.000000', 5, 'XL', '2023-12-27 19:16:17.000000', 7),
(73, 'Abu', '2023-12-27 19:20:23.000000', 4, 'S', '2023-12-27 19:20:23.000000', 8),
(74, 'Abu', '2023-12-27 19:20:23.000000', 2, 'M', '2023-12-27 19:20:23.000000', 8),
(75, 'Abu', '2023-12-27 19:20:23.000000', 4, 'L', '2023-12-27 19:20:23.000000', 8),
(76, 'Abu', '2023-12-27 19:20:23.000000', 10, 'XL', '2023-12-27 19:20:23.000000', 8),
(77, 'Cream', '2023-12-27 19:20:23.000000', 10, 'S', '2023-12-27 19:20:23.000000', 8),
(78, 'Cream', '2023-12-27 19:20:23.000000', 20, 'M', '2023-12-27 19:20:23.000000', 8),
(79, 'Cream', '2023-12-27 19:20:23.000000', 10, 'L', '2023-12-27 19:20:23.000000', 8),
(80, 'Cream', '2023-12-27 19:20:23.000000', 5, 'XL', '2023-12-27 19:20:23.000000', 8),
(81, 'Hitam', '2023-12-27 19:20:23.000000', 10, 'S', '2023-12-27 19:20:23.000000', 8),
(82, 'Hitam', '2023-12-27 19:20:23.000000', 10, 'L', '2023-12-27 19:20:23.000000', 8),
(83, 'Hitam', '2023-12-27 19:20:23.000000', 3, 'XL', '2023-12-27 19:20:23.000000', 8),
(84, 'Hijau', '2023-12-27 19:20:23.000000', 3, 'M', '2023-12-27 19:20:23.000000', 8),
(85, 'Hijau', '2023-12-27 19:20:23.000000', 4, 'L', '2023-12-27 19:20:23.000000', 8),
(86, 'Hijau', '2023-12-27 19:20:23.000000', 5, 'XL', '2023-12-27 19:20:23.000000', 8),
(87, 'Coklat', '2023-12-27 19:22:39.000000', 20, 'S', '2023-12-27 19:22:39.000000', 9),
(88, 'Coklat', '2023-12-27 19:22:39.000000', 5, 'M', '2023-12-27 19:22:39.000000', 9),
(89, 'Coklat', '2023-12-27 19:22:39.000000', 3, 'L', '2023-12-27 19:22:39.000000', 9),
(90, 'Coklat', '2023-12-27 19:22:39.000000', 5, 'XL', '2023-12-27 19:22:39.000000', 9),
(91, 'Hijau', '2023-12-27 20:08:29.000000', 4, 'S', '2023-12-27 20:08:29.000000', 10),
(92, 'Hijau', '2023-12-27 20:08:29.000000', 20, 'M', '2023-12-27 20:08:29.000000', 10),
(93, 'Hijau', '2023-12-27 20:08:29.000000', 19, 'L', '2023-12-27 20:08:29.000000', 10),
(94, 'Hijau', '2023-12-27 20:08:29.000000', 5, 'XL', '2023-12-27 20:08:29.000000', 10);

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `user_id` varchar(255) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `first_name` varchar(32) DEFAULT NULL,
  `last_name` varchar(32) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`user_id`, `created_at`, `email`, `first_name`, `last_name`, `password`, `updated_at`, `role_id`) VALUES
('0aac3b19-1d7f-4b7f-8198-853cffdf62e5', '2023-12-26 15:37:52.000000', 'velmanh24@gmail.com', 'Velman', 'Harefa', 'velman', '2023-12-26 15:37:52.000000', 1),
('dc9c13e9-f294-48c9-9e0a-69c78d31d99a', '2023-12-26 11:00:49.000000', 'test@admin.com', 'DiKaosan', 'Admin', 'admin', '2023-12-26 11:00:49.000000', 2);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indeks untuk tabel `chats`
--
ALTER TABLE `chats`
  ADD PRIMARY KEY (`chat_id`),
  ADD KEY `FKmolqi1xj49bg3jjr33674limy` (`user_id`);

--
-- Indeks untuk tabel `customer_address`
--
ALTER TABLE `customer_address`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK3i3dt6e049sf0cijsd9blab3o` (`id_customer`);

--
-- Indeks untuk tabel `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`image_id`),
  ADD KEY `FK8sfun6tj1hqb85ed52o8mkqyh` (`product_id`);

--
-- Indeks untuk tabel `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD UNIQUE KEY `UK_hlnl243wmdrj3u8nrxw1qs9yt` (`address_id`),
  ADD KEY `FK8aol9f99s97mtyhij0tvfj41f` (`payment_id`),
  ADD KEY `FK32ql8ubntj5uh44ph9659tiih` (`user_id`);

--
-- Indeks untuk tabel `orders_item`
--
ALTER TABLE `orders_item`
  ADD PRIMARY KEY (`order_item_id`),
  ADD KEY `FKqa7i0ev3xqm2d6t93n9blxef1` (`order_id`),
  ADD KEY `FKlrqyo8q92lfie02g03gp8l89x` (`product_id`);

--
-- Indeks untuk tabel `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `FKqmdvjl2q0brr0ppuwthp1f70g` (`payment_method_id`);

--
-- Indeks untuk tabel `payment_method`
--
ALTER TABLE `payment_method`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `FKowomku74u72o6h8q0khj7id8q` (`category_id`);

--
-- Indeks untuk tabel `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`review_id`),
  ADD KEY `FK9yqmlf28ges8c30nj4v4hva7t` (`product_id`),
  ADD KEY `FKcgy7qjc1r99dp117y9en6lxye` (`user_id`);

--
-- Indeks untuk tabel `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`role_id`);

--
-- Indeks untuk tabel `stock`
--
ALTER TABLE `stock`
  ADD PRIMARY KEY (`stock_id`),
  ADD KEY `FKjghkvw2snnsr5gpct0of7xfcf` (`product_id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `FKp56c1712k691lhsyewcssf40f` (`role_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `chats`
--
ALTER TABLE `chats`
  MODIFY `chat_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `customer_address`
--
ALTER TABLE `customer_address`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `images`
--
ALTER TABLE `images`
  MODIFY `image_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `orders_item`
--
ALTER TABLE `orders_item`
  MODIFY `order_item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT untuk tabel `payments`
--
ALTER TABLE `payments`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `payment_method`
--
ALTER TABLE `payment_method`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `reviews`
--
ALTER TABLE `reviews`
  MODIFY `review_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `stock`
--
ALTER TABLE `stock`
  MODIFY `stock_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=95;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `chats`
--
ALTER TABLE `chats`
  ADD CONSTRAINT `FKmolqi1xj49bg3jjr33674limy` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Ketidakleluasaan untuk tabel `customer_address`
--
ALTER TABLE `customer_address`
  ADD CONSTRAINT `FK3i3dt6e049sf0cijsd9blab3o` FOREIGN KEY (`id_customer`) REFERENCES `users` (`user_id`);

--
-- Ketidakleluasaan untuk tabel `images`
--
ALTER TABLE `images`
  ADD CONSTRAINT `FK8sfun6tj1hqb85ed52o8mkqyh` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`);

--
-- Ketidakleluasaan untuk tabel `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `FK32ql8ubntj5uh44ph9659tiih` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `FK8aol9f99s97mtyhij0tvfj41f` FOREIGN KEY (`payment_id`) REFERENCES `payments` (`payment_id`),
  ADD CONSTRAINT `FKl7txgw9i6pspy4pyyaxtr77s6` FOREIGN KEY (`address_id`) REFERENCES `customer_address` (`id`);

--
-- Ketidakleluasaan untuk tabel `orders_item`
--
ALTER TABLE `orders_item`
  ADD CONSTRAINT `FKlrqyo8q92lfie02g03gp8l89x` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`),
  ADD CONSTRAINT `FKqa7i0ev3xqm2d6t93n9blxef1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`);

--
-- Ketidakleluasaan untuk tabel `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `FKqmdvjl2q0brr0ppuwthp1f70g` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_method` (`id`);

--
-- Ketidakleluasaan untuk tabel `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `FKowomku74u72o6h8q0khj7id8q` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`);

--
-- Ketidakleluasaan untuk tabel `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `FK9yqmlf28ges8c30nj4v4hva7t` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`),
  ADD CONSTRAINT `FKcgy7qjc1r99dp117y9en6lxye` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Ketidakleluasaan untuk tabel `stock`
--
ALTER TABLE `stock`
  ADD CONSTRAINT `FKjghkvw2snnsr5gpct0of7xfcf` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`);

--
-- Ketidakleluasaan untuk tabel `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `FKp56c1712k691lhsyewcssf40f` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
