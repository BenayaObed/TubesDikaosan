-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 30 Des 2023 pada 08.37
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
(8, 'Baju', '2023-12-27 08:47:30.000000', '2023-12-28 12:41:47.000000', 0),
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
(10, 'Ciganitri', 'Bandung', '2023-12-27 09:04:23.000000', '082746252344', '5623', 'Jawa Barat', '2023-12-27 09:04:23.000000', '0aac3b19-1d7f-4b7f-8198-853cffdf62e5'),
(11, 'Ciganitri', 'Bandung', '2023-12-27 20:27:17.000000', '082746252344', '5623', 'Jawa Barat', '2023-12-27 20:27:17.000000', 'dc9c13e9-f294-48c9-9e0a-69c78d31d99a'),
(12, 'Ciganitri', 'Bandung', '2023-12-27 20:44:40.000000', '082746252344', '5623', 'Jawa Barat', '2023-12-27 20:44:40.000000', '0aac3b19-1d7f-4b7f-8198-853cffdf62e5'),
(13, 'Ciganitri', 'Bandung', '2023-12-27 21:42:48.000000', '082746252344', '5623', 'Jawa Barat', '2023-12-27 21:42:48.000000', 'cc094403-599b-4348-9203-e8c3bdc13317'),
(14, 'Ciganitri', 'Bandung', '2023-12-28 00:44:14.000000', '082746252344', '5623', 'Jawa Barat', '2023-12-28 00:44:14.000000', '0aac3b19-1d7f-4b7f-8198-853cffdf62e5'),
(15, 'Ciganitri', 'Bandung', '2023-12-28 01:03:15.000000', '082746252344', '5623', 'Jawa Barat', '2023-12-28 01:03:15.000000', '0aac3b19-1d7f-4b7f-8198-853cffdf62e5'),
(16, 'Dipatiukur', 'Bandung', '2023-12-28 10:47:38.000000', '081278635432', '5623', 'Jawa Barat', '2023-12-28 10:47:38.000000', '3597663b-a776-4564-9c0b-3e8debd856e8'),
(17, 'Dipatiukur', 'Bandung', '2023-12-28 10:52:34.000000', '081278635432', '5623', 'Jawa Barat', '2023-12-28 10:52:34.000000', '3597663b-a776-4564-9c0b-3e8debd856e8'),
(18, 'Ciganitri', 'Bandung', '2023-12-28 14:24:39.000000', '082746252344', '5623', 'Jawa Barat', '2023-12-28 14:24:39.000000', '36773b82-6baf-4b41-9bfe-e7654150d2d2');

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
(12, '2023-12-27 20:08:29.000000', '1703682509677001de8f943bd925ede4f9c0d60d0ab7b.jpg', '2023-12-27 20:08:29.000000', 10),
(13, '2023-12-27 20:26:31.000000', '1703683591871f67d1247d5450be640565f54c3438eb7.jpg', '2023-12-27 20:26:31.000000', 11),
(15, '2023-12-28 12:33:42.000000', '1703741622093a38e2513ae27e4f3aa1f99707fda4887.jpg', '2023-12-28 12:33:42.000000', 13),
(16, '2023-12-28 12:37:24.000000', '170374184477500fb16d03bccba6dbb46002954c1ae3c.jpg', '2023-12-28 12:37:24.000000', 14),
(18, '2023-12-28 12:41:17.000000', '1703742077083C1.jpg', '2023-12-28 12:41:17.000000', 16),
(19, '2023-12-28 12:47:45.000000', '170374246517191dfb5d0f1ad42544a024b83bb54502d.jpg', '2023-12-28 12:47:45.000000', 17);

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
(13, '2023-12-27 20:44:20.000000', 'Segera ya min', 'delivered', '2023-12-27 21:49:44.000000', 12, 3, '0aac3b19-1d7f-4b7f-8198-853cffdf62e5'),
(14, '2023-12-27 21:10:07.000000', 'Segera di kirim ya min!', 'delivered', '2023-12-28 11:02:50.000000', 15, 5, '0aac3b19-1d7f-4b7f-8198-853cffdf62e5'),
(15, '2023-12-27 21:41:28.000000', 'Segera di kirim ya min!', 'delivered', '2023-12-28 11:03:07.000000', 13, 4, 'cc094403-599b-4348-9203-e8c3bdc13317'),
(17, '2023-12-28 10:46:42.000000', 'Segera di kirim ya min!', 'delivered', '2023-12-28 10:48:27.000000', 16, 6, '3597663b-a776-4564-9c0b-3e8debd856e8'),
(18, '2023-12-28 10:51:44.000000', 'Segera di kirim ya min!', 'delivered', '2023-12-28 11:03:12.000000', 17, 7, '3597663b-a776-4564-9c0b-3e8debd856e8'),
(19, '2023-12-28 11:33:18.000000', NULL, 'draft', '2023-12-28 11:33:18.000000', NULL, NULL, '0aac3b19-1d7f-4b7f-8198-853cffdf62e5'),
(20, '2023-12-28 14:23:25.000000', 'Segera di kirim ya min!', 'delivered', '2023-12-28 14:27:49.000000', 18, 8, '36773b82-6baf-4b41-9bfe-e7654150d2d2');

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
(21, 'Abu', '2023-12-27 20:44:20.000000', 1, 'S', 399999, '2023-12-27 20:44:20.000000', 13, 8),
(24, 'Abu', '2023-12-27 21:42:07.000000', 1, 'S', 399999, '2023-12-27 21:42:07.000000', 15, 8),
(27, 'Putih', '2023-12-28 01:03:00.000000', 1, 'S', 199999, '2023-12-28 01:03:00.000000', 14, 6),
(31, 'Cream', '2023-12-28 10:46:50.000000', 1, 'XL', 399999, '2023-12-28 10:46:50.000000', 17, 8),
(32, 'Putih', '2023-12-28 10:51:44.000000', 1, 'XL', 399999, '2023-12-28 10:51:44.000000', 18, 11),
(37, 'Putih', '2023-12-28 14:10:16.000000', 1, 'S', 199999, '2023-12-28 14:10:16.000000', 19, 6),
(38, 'Coklat', '2023-12-28 14:23:25.000000', 1, 'S', 159999, '2023-12-28 14:23:25.000000', 20, 17);

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
(1, '2023-12-26 16:34:18.000000', 'PAID', 70000, '2023-12-26 16:34:18.000000', 1),
(2, '2023-12-27 20:27:32.000000', 'PAID', 399999, '2023-12-27 20:27:32.000000', 1),
(3, '2023-12-27 20:45:21.000000', 'PAID', 399999, '2023-12-27 20:45:21.000000', 2),
(4, '2023-12-27 21:43:42.000000', 'PAID', 399999, '2023-12-27 21:43:42.000000', 2),
(5, '2023-12-28 01:06:44.000000', 'PAID', 199999, '2023-12-28 01:06:44.000000', 2),
(6, '2023-12-28 10:47:47.000000', 'PAID', 399999, '2023-12-28 10:47:47.000000', NULL),
(7, '2023-12-28 10:52:42.000000', 'PAID', 399999, '2023-12-28 10:52:42.000000', 2),
(8, '2023-12-28 14:25:20.000000', 'PAID', 159999, '2023-12-28 14:25:20.000000', 2);

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
(6, '2023-12-27 19:12:30.000000', 'Hadirkan sentuhan gaya kasual yang nyaman dengan Kaos Katun Wanita kami. Dirancang khusus untuk memberikan kenyamanan sepanjang hari, kaos ini terbuat dari katun berkualitas tinggi yang lembut di kulit dan memberikan pernapasan alami.', 'Kaos Katun Wanita ', 199999, '2023-12-28 14:10:16.000000', 1, 7),
(7, '2023-12-27 19:16:17.000000', 'Bergaya dengan penuh kepercayaan dengan Jaket Kasual Wanita kami yang menawarkan kombinasi sempurna antara kehangatan dan keanggunan kasual. Dirancang untuk menonjolkan keindahan dan kepraktisan, jaket ini menjadi pilihan ideal untuk penampilan kasual yang tetap trendy.', 'Woman Casual Jacket ', 599999, '2023-12-28 14:24:14.000000', 1, 9),
(8, '2023-12-27 19:20:23.000000', 'Berikan sentuhan kesegaran pada gaya Anda dengan Rok Pendek Wanita kami, sebuah pilihan yang menggabungkan kenyamanan dan kecantikan. Dirancang untuk merayakan kefemininan Anda, rok pendek ini cocok untuk berbagai kesempatan dan memberikan kebebasan gerak untuk gaya hidup aktif Anda.', 'Rok Pendek Wanita', 399999, '2023-12-28 10:50:55.000000', 1, 10),
(9, '2023-12-27 19:22:39.000000', 'Tampilkan kehangatan dan gaya dengan koleksi Sweater Pria kami, busana yang tidak hanya memberikan kenyamanan luar biasa tetapi juga menambahkan sentuhan modis pada setiap penampilan Anda. Terbuat dari bahan berkualitas tinggi, sweater ini menjadi pilihan yang sempurna untuk menemani kegiatan sehari-hari Anda.', 'Sweater Pria', 249999, '2023-12-27 19:22:39.000000', 1, 9),
(10, '2023-12-27 20:08:29.000000', 'Hadapi cuaca hangat dengan gaya yang tetap trendi menggunakan Celana Pendek Pria kami. Dirancang untuk kenyamanan sepanjang hari dan penampilan yang tak terbantahkan, celana pendek ini menjadi pilihan ideal untuk kegiatan santai hingga petualangan luar ruangan.', 'Celana Pendek Pria', 149999, '2023-12-28 14:12:23.000000', 1, 10),
(11, '2023-12-27 20:26:31.000000', 'Tingkatkan gaya kasual Anda dengan Hoodie Pria kami yang tidak hanya menawarkan tampilan trendi, tetapi juga memberikan kenyamanan luar biasa. Dirancang untuk menjaga Anda tetap hangat dan modis, hoodie ini adalah pilihan ideal untuk menambah keberagaman koleksi pakaian kasual Anda.', 'Hoodie ', 399999, '2023-12-28 10:52:42.000000', 1, 9),
(12, '2023-12-28 12:26:16.000000', 'Tampilkan gaya dan kenyamanan sejati dengan Celana Panjang Wanita \"Elegance Chic\" kami. Didesain untuk memenuhi kebutuhan fashion sehari-hari, celana ini memberikan kombinasi sempurna antara gaya yang modis dan kenyamanan yang tak terkalahkan.', 'Woman Long Pants', 299999, '2023-12-28 12:40:23.000000', 0, 10),
(13, '2023-12-28 12:33:42.000000', 'Tingkatkan gaya santai Anda dengan Kaos Katun Pria \"Casual Comfort\" kami. Dirancang untuk memberikan kenyamanan luar biasa dan tampilan yang tetap modis, kaos ini menjadi pilihan sempurna untuk gaya kasual sehari-hari.', 'Kaos Katun Pria', 179999, '2023-12-28 12:33:42.000000', 1, 7),
(14, '2023-12-28 12:37:24.000000', 'Hadirkan sentuhan feminin dan gaya yang anggun dengan Rok Span Wanita \"Elegance Bliss\" kami. Rok ini menggabungkan desain modern dengan kenyamanan yang luar biasa, menjadikannya pilihan ideal untuk berbagai kesempatan, dari acara formal hingga santai.', 'Rok Span Wanita', 399999, '2023-12-28 12:37:24.000000', 1, 10),
(15, '2023-12-28 12:39:43.000000', 'Hadirkan sentuhan klasik dan keanggunan dengan Kemeja Pria Lengan Panjang \"Timeless White\" kami. Kemeja putih yang tak pernah ketinggalan zaman ini menjadi pilihan sempurna untuk melengkapi gaya kasual maupun semi-formal Anda.', 'Kemeja Putih Pria', 299999, '2023-12-28 12:40:26.000000', 0, 10),
(16, '2023-12-28 12:41:17.000000', 'Hadirkan sentuhan klasik dan keanggunan dengan Kemeja Wanita Lengan Panjang \"Timeless White\" kami. Kemeja putih yang tak pernah ketinggalan zaman ini menjadi pilihan sempurna untuk melengkapi gaya kasual maupun semi-formal Anda.', 'Kemeja Putih Wanita', 399999, '2023-12-28 12:42:49.000000', 1, 6),
(17, '2023-12-28 12:47:45.000000', 'Nikmati kehangatan musim panas dengan gaya yang chic dan nyaman menggunakan Celana Pendek Wanita \"Summer Breeze\" kami. Dirancang untuk memberikan kesejukan dan kebebasan gerak, celana pendek ini akan menjadi pilihan favorit Anda untuk menjalani aktivitas sehari-hari dengan gaya.', 'Celana Pendek Wanita', 159999, '2023-12-28 14:28:33.000000', 1, 3);

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

--
-- Dumping data untuk tabel `reviews`
--

INSERT INTO `reviews` (`review_id`, `comment`, `rate`, `product_id`, `user_id`) VALUES
(1, 'Barang sangat nyaman digunakan!', 5, 8, '0aac3b19-1d7f-4b7f-8198-853cffdf62e5'),
(2, 'Barang lama dikirim', 3, 8, '3597663b-a776-4564-9c0b-3e8debd856e8'),
(3, 'Nyaman untuk digunakan!', 4.5, 6, '0aac3b19-1d7f-4b7f-8198-853cffdf62e5'),
(4, 'Celananya nyaman', 4, 17, '36773b82-6baf-4b41-9bfe-e7654150d2d2');

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
(57, 'Putih', '2023-12-27 19:12:30.000000', 9, 'S', '2023-12-28 01:06:44.000000', 6),
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
(73, 'Abu', '2023-12-27 19:20:23.000000', 2, 'S', '2023-12-27 21:43:42.000000', 8),
(74, 'Abu', '2023-12-27 19:20:23.000000', 2, 'M', '2023-12-27 19:20:23.000000', 8),
(75, 'Abu', '2023-12-27 19:20:23.000000', 4, 'L', '2023-12-27 19:20:23.000000', 8),
(76, 'Abu', '2023-12-27 19:20:23.000000', 10, 'XL', '2023-12-27 19:20:23.000000', 8),
(77, 'Cream', '2023-12-27 19:20:23.000000', 10, 'S', '2023-12-27 19:20:23.000000', 8),
(78, 'Cream', '2023-12-27 19:20:23.000000', 20, 'M', '2023-12-27 19:20:23.000000', 8),
(79, 'Cream', '2023-12-27 19:20:23.000000', 10, 'L', '2023-12-27 19:20:23.000000', 8),
(80, 'Cream', '2023-12-27 19:20:23.000000', 4, 'XL', '2023-12-28 10:47:47.000000', 8),
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
(93, 'Hijau', '2023-12-27 20:08:29.000000', 5, 'L', '2023-12-27 21:51:18.000000', 10),
(94, 'Hijau', '2023-12-27 20:08:29.000000', 5, 'XL', '2023-12-27 20:08:29.000000', 10),
(95, 'Putih', '2023-12-27 20:26:31.000000', 3, 'S', '2023-12-27 20:27:32.000000', 11),
(96, 'Putih', '2023-12-27 20:26:31.000000', 20, 'M', '2023-12-27 20:26:31.000000', 11),
(97, 'Putih', '2023-12-27 20:26:31.000000', 10, 'L', '2023-12-27 20:26:31.000000', 11),
(98, 'Putih', '2023-12-27 20:26:31.000000', 9, 'XL', '2023-12-28 10:52:42.000000', 11),
(99, 'Cream', '2023-12-28 12:26:16.000000', 4, 'S', '2023-12-28 12:26:16.000000', 12),
(100, 'Cream', '2023-12-28 12:26:16.000000', 3, 'M', '2023-12-28 12:26:16.000000', 12),
(101, 'Cream', '2023-12-28 12:26:16.000000', 10, 'L', '2023-12-28 12:26:16.000000', 12),
(102, 'Cream', '2023-12-28 12:26:16.000000', 10, 'XL', '2023-12-28 12:26:16.000000', 12),
(103, 'Putih', '2023-12-28 12:33:42.000000', 4, 'S', '2023-12-28 12:33:42.000000', 13),
(104, 'Putih', '2023-12-28 12:33:42.000000', 20, 'M', '2023-12-28 12:33:42.000000', 13),
(105, 'Putih', '2023-12-28 12:33:42.000000', 19, 'L', '2023-12-28 12:33:42.000000', 13),
(106, 'Putih', '2023-12-28 12:33:42.000000', 10, 'XL', '2023-12-28 12:33:42.000000', 13),
(107, 'Hitam', '2023-12-28 12:33:42.000000', 15, 'S', '2023-12-28 12:33:42.000000', 13),
(108, 'Hitam', '2023-12-28 12:33:42.000000', 3, 'M', '2023-12-28 12:33:42.000000', 13),
(109, 'Hitam', '2023-12-28 12:33:42.000000', 4, 'L', '2023-12-28 12:33:42.000000', 13),
(110, 'Hitam', '2023-12-28 12:33:42.000000', 3, 'XL', '2023-12-28 12:33:42.000000', 13),
(111, 'Biru', '2023-12-28 12:37:24.000000', 10, 'S', '2023-12-28 12:37:24.000000', 14),
(112, 'Biru', '2023-12-28 12:37:24.000000', 20, 'M', '2023-12-28 12:37:24.000000', 14),
(113, 'Biru', '2023-12-28 12:37:24.000000', 10, 'L', '2023-12-28 12:37:24.000000', 14),
(114, 'Biru', '2023-12-28 12:37:24.000000', 10, 'XL', '2023-12-28 12:37:24.000000', 14),
(115, 'Hitam', '2023-12-28 12:37:24.000000', 10, 'S', '2023-12-28 12:37:24.000000', 14),
(116, 'Hitam', '2023-12-28 12:37:24.000000', 3, 'M', '2023-12-28 12:37:24.000000', 14),
(117, 'Hitam', '2023-12-28 12:37:24.000000', 10, 'L', '2023-12-28 12:37:24.000000', 14),
(118, 'Hitam', '2023-12-28 12:37:24.000000', 10, 'XL', '2023-12-28 12:37:24.000000', 14),
(119, 'Putih', '2023-12-28 12:37:24.000000', 15, 'S', '2023-12-28 12:37:24.000000', 14),
(120, 'Putih', '2023-12-28 12:37:24.000000', 20, 'M', '2023-12-28 12:37:24.000000', 14),
(121, 'Putih', '2023-12-28 12:37:24.000000', 10, 'L', '2023-12-28 12:37:24.000000', 14),
(122, 'Putih', '2023-12-28 12:37:24.000000', 10, 'XL', '2023-12-28 12:37:24.000000', 14),
(123, 'Putih', '2023-12-28 12:39:43.000000', 8, 'S', '2023-12-28 12:39:43.000000', 15),
(124, 'Putih', '2023-12-28 12:39:43.000000', 15, 'M', '2023-12-28 12:39:43.000000', 15),
(125, 'Putih', '2023-12-28 12:39:43.000000', 20, 'L', '2023-12-28 12:40:06.000000', 15),
(126, 'Putih', '2023-12-28 12:39:43.000000', 20, 'XL', '2023-12-28 12:39:43.000000', 15),
(127, 'Putih', '2023-12-28 12:41:17.000000', 10, 'S', '2023-12-28 12:41:17.000000', 16),
(128, 'Putih', '2023-12-28 12:41:17.000000', 9, 'M', '2023-12-28 12:41:17.000000', 16),
(129, 'Putih', '2023-12-28 12:41:17.000000', 10, 'L', '2023-12-28 12:41:17.000000', 16),
(130, 'Putih', '2023-12-28 12:41:17.000000', 10, 'XL', '2023-12-28 12:41:17.000000', 16),
(131, 'Cream', '2023-12-28 12:47:45.000000', 10, 'S', '2023-12-28 12:47:45.000000', 17),
(132, 'Cream', '2023-12-28 12:47:45.000000', 20, 'M', '2023-12-28 12:47:45.000000', 17),
(133, 'Cream', '2023-12-28 12:47:45.000000', 10, 'L', '2023-12-28 12:47:45.000000', 17),
(134, 'Cream', '2023-12-28 12:47:45.000000', 10, 'XL', '2023-12-28 12:47:45.000000', 17),
(135, 'Hitam', '2023-12-28 12:47:45.000000', 15, 'S', '2023-12-28 12:47:45.000000', 17),
(136, 'Hitam', '2023-12-28 12:47:45.000000', 5, 'M', '2023-12-28 12:47:45.000000', 17),
(137, 'Hitam', '2023-12-28 12:47:45.000000', 19, 'L', '2023-12-28 12:47:45.000000', 17),
(138, 'Hitam', '2023-12-28 12:47:45.000000', 10, 'XL', '2023-12-28 12:47:45.000000', 17),
(139, 'Coklat', '2023-12-28 12:47:45.000000', 14, 'S', '2023-12-28 14:25:20.000000', 17),
(140, 'Coklat', '2023-12-28 12:47:45.000000', 20, 'M', '2023-12-28 12:47:45.000000', 17),
(141, 'Coklat', '2023-12-28 12:47:45.000000', 19, 'L', '2023-12-28 12:47:45.000000', 17),
(142, 'Coklat', '2023-12-28 12:47:45.000000', 10, 'XL', '2023-12-28 12:47:45.000000', 17);

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
('0aac3b19-1d7f-4b7f-8198-853cffdf62e5', '2023-12-26 15:37:52.000000', 'velmanh24@gmail.com', 'Velman', 'Harefa', 'velmann', '2023-12-28 14:06:41.000000', 1),
('3597663b-a776-4564-9c0b-3e8debd856e8', '2023-12-28 10:46:19.000000', 'alexwumbo@gmail.com', 'Alex', 'Wumbo', 'alexwumbo', '2023-12-28 10:46:19.000000', 1),
('36773b82-6baf-4b41-9bfe-e7654150d2d2', '2023-12-28 14:21:58.000000', 'velman@gmail.com', 'Velman', 'Harefa', 'velman', '2023-12-28 14:21:58.000000', 1),
('cc094403-599b-4348-9203-e8c3bdc13317', '2023-12-27 21:39:56.000000', 'velmanharefatest@gmail.com', 'Velman', 'Harefa', 'velman', '2023-12-27 21:39:56.000000', 1),
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT untuk tabel `images`
--
ALTER TABLE `images`
  MODIFY `image_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT untuk tabel `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT untuk tabel `orders_item`
--
ALTER TABLE `orders_item`
  MODIFY `order_item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT untuk tabel `payments`
--
ALTER TABLE `payments`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `payment_method`
--
ALTER TABLE `payment_method`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT untuk tabel `reviews`
--
ALTER TABLE `reviews`
  MODIFY `review_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `stock`
--
ALTER TABLE `stock`
  MODIFY `stock_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=143;

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
