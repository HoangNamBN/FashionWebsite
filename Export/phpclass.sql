-- --------------------------------------------------------
-- Host:                         localhost
-- Server version:               5.7.24 - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for table phpclass.categories
CREATE TABLE IF NOT EXISTS `categories` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL,
  `is_home` smallint(1) NOT NULL DEFAULT '0',
  `image` varchar(255) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `slug` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_categories_users` (`user_id`),
  CONSTRAINT `fk_categories_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- Dumping data for table phpclass.categories: ~6 rows (approximately)
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` (`id`, `name`, `description`, `user_id`, `is_home`, `image`, `created_at`, `updated_at`, `slug`) VALUES
	(1, 'Váy Nữ', 'Đẹp Tự Nhiên', 5, 1, 'cover-1.jpg', '2021-04-12 00:08:01', '2021-04-12 00:08:01', 'Chất Lượng'),
	(2, 'Áo Công Sở', 'Áo Công Sở', 5, 1, 'cover-3.jpg', '2021-03-22 22:18:34', '2021-03-22 22:18:34', 'Áo-công-sở'),
	(4, 'Đồ Ngủ', 'Đồ Ngủ', 6, 0, 'cover-3.jpg', '2021-03-22 17:14:19', '2021-03-22 17:14:19', 'Do-Ngu'),
	(5, 'Nữ', 'Nữ', 5, 1, '00-story.jpg', '2021-05-05 22:52:23', '2021-05-05 22:52:23', 'Nu'),
	(11, 'Áo Phông', 'áo phong', 5, 0, '0', '2021-04-02 16:31:07', '2021-04-02 16:31:07', 'ao-phong'),
	(12, 'Áo Gió ', 'Áo mát mẻ', 6, 0, 'top4small.jpg', '2021-04-12 15:09:20', '2021-04-12 15:09:20', 'Ao-Gio');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;

-- Dumping structure for table phpclass.customers
CREATE TABLE IF NOT EXISTS `customers` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL DEFAULT '',
  `password` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Dumping data for table phpclass.customers: ~2 rows (approximately)
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` (`id`, `name`, `email`, `password`, `address`, `created_at`, `updated_at`) VALUES
	(1, 'Huy', 'Huynguyen1812@gmail.com', '25d55ad283aa400af464c76d713c07ad', 'Hà nội', '2021-05-24 16:04:05', '2021-05-24 16:04:05'),
	(2, 'Nguyễn Trọng Huy', 'HuyNguyen@gmail.com', '25d55ad283aa400af464c76d713c07ad', 'Hà Tây', '2021-05-24 01:39:18', '2021-05-24 01:39:18');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;

-- Dumping structure for table phpclass.orders
CREATE TABLE IF NOT EXISTS `orders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `customer_name` varchar(100) DEFAULT NULL,
  `customer_email` varchar(100) DEFAULT NULL,
  `customer_phone` varchar(100) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Dumping data for table phpclass.orders: ~1 rows (approximately)
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` (`id`, `code`, `created_at`, `customer_name`, `customer_email`, `customer_phone`, `updated_at`) VALUES
	(1, '62366443707', '2021-04-11 22:27:26', 'Nguyễn Trọng Huy', 'Huynguyen@gmail.com', '0359746581', '2021-04-11 22:27:24'),
	(2, '22151924365', '2021-04-18 00:48:11', 'Nguyễn Trọng Huy 2', 'TrongHuy1812@gmail.com', '0359746581', '2021-04-18 00:48:09'),
	(3, '27158741906', '2021-05-08 22:16:02', 'Nguyễn Văn Nam', 'Nam@gamil.com', '0359746727', '2021-05-08 22:16:02'),
	(4, '414993675', '2021-05-24 17:23:11', 'Nguyễn Văn Nam 32', 'Nam@gamil.com', '0359746727', '2021-05-24 17:23:11');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;

-- Dumping structure for table phpclass.order_details
CREATE TABLE IF NOT EXISTS `order_details` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) NOT NULL,
  `product_id` int(10) NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `product_price` double NOT NULL,
  `product_qty` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- Dumping data for table phpclass.order_details: ~5 rows (approximately)
/*!40000 ALTER TABLE `order_details` DISABLE KEYS */;
INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `product_name`, `product_price`, `product_qty`) VALUES
	(1, 1, 5, 'Đồ Ngủ Mềm', 50000, 1),
	(2, 1, 2, 'Áo Công Sở', 560000, 2),
	(3, 1, 6, 'Áo Thun Ba Lỗ Thể Thao Nam ', 70000, 1),
	(4, 2, 8, 'Váy đầm len ', 129000, 3),
	(5, 3, 8, 'Váy đầm len ', 129000, 1),
	(6, 3, 9, 'Váy Ngắn 1', 100000, 1),
	(7, 4, 9, 'Váy Ngắn 1', 100000, 1);
/*!40000 ALTER TABLE `order_details` ENABLE KEYS */;

-- Dumping structure for table phpclass.products
CREATE TABLE IF NOT EXISTS `products` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `price` mediumint(9) DEFAULT NULL,
  `sku` varchar(32) DEFAULT NULL,
  `price_sale` mediumint(9) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL,
  `category_id` bigint(20) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_products_users` (`user_id`),
  KEY `fk_products_categories` (`category_id`),
  CONSTRAINT `fk_products_categories` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  CONSTRAINT `fk_products_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- Dumping data for table phpclass.products: ~8 rows (approximately)
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` (`id`, `name`, `price`, `sku`, `price_sale`, `description`, `user_id`, `category_id`, `image`, `created_at`, `updated_at`) VALUES
	(1, 'Váy Xahara', 2000000, '01', 3000000, 'Xinh Xắn', 6, 1, 'cover-1.jpg', '2021-04-18 22:51:19', '2021-04-18 22:51:19'),
	(2, 'Áo Công Sở', 560000, 'P02', 600000, 'Màu Xanh', 5, 2, 'cover-1.jpg', '2021-04-07 16:52:24', '2021-04-07 16:52:24'),
	(5, 'Đồ Ngủ Mềm', 50000, 'P00', 60000, 'Xanh Vàng', 5, 4, 'cover-1.jpg', '2021-04-07 16:52:37', '2021-04-07 16:52:37'),
	(6, 'Áo Thun Ba Lỗ Thể Thao Nam ', 70000, 'FASHIONGREEN44', 0, 'Cực Mát', 5, 4, 'ba_lo.jpeg', '2021-04-06 22:37:27', '2021-04-06 22:37:27'),
	(7, 'ba lỗ 2', 100000, 'FASHIONGREEN45', NULL, 'mát cực mát', 5, 4, 'ba_lo1.jpeg', '2021-04-07 00:46:05', '2021-04-07 00:46:05'),
	(8, 'Váy đầm len ', 129000, 'L027', 29000, 'Mẫu váy đầm body dài tay lệch vai dây rút tôn dáng cực xinh', 5, 1, 'vayden4.jpeg', '2021-04-12 00:11:16', '2021-04-12 00:11:16'),
	(9, 'Váy Ngắn 1', 100000, 'FASHIONGREEN45', 29000, 'Mát trẻ', 6, 1, 'cover-1.jpg', '2021-04-12 23:49:25', '2021-04-12 23:49:25');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;

-- Dumping structure for table phpclass.product_images
CREATE TABLE IF NOT EXISTS `product_images` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- Dumping data for table phpclass.product_images: ~9 rows (approximately)
/*!40000 ALTER TABLE `product_images` DISABLE KEYS */;
INSERT INTO `product_images` (`id`, `name`, `product_id`, `created_at`, `updated_at`) VALUES
	(8, 'cover-2.jpg', 1, '2021-04-10 22:08:37', '2021-04-10 22:08:37'),
	(9, 'vayden5.jpeg', 8, '2021-04-12 00:11:25', '2021-04-12 00:11:25'),
	(10, 'vaynuden1.jpeg', 8, '2021-04-12 00:11:35', '2021-04-12 00:11:35'),
	(11, 'vaynuden2.jpeg', 8, '2021-04-12 00:11:45', '2021-04-12 00:11:45'),
	(12, 'vaynuden3.jpeg', 8, '2021-04-12 00:11:50', '2021-04-12 00:11:50'),
	(13, 'vayden4.jpeg', 8, '2021-04-12 00:12:29', '2021-04-12 00:12:29'),
	(19, 'cover-2.jpg', 9, '2021-04-14 08:39:20', '2021-04-14 08:39:20'),
	(20, 'cover-3.jpg', 9, '2021-04-14 08:39:25', '2021-04-14 08:39:25'),
	(22, 'kieu-vay-dam-xoe-cong-chua.jpg', 9, '2021-04-14 08:39:36', '2021-04-14 08:39:36'),
	(23, 'product-6.jpg', 9, '2021-04-14 08:39:45', '2021-04-14 08:39:45');
/*!40000 ALTER TABLE `product_images` ENABLE KEYS */;

-- Dumping structure for table phpclass.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `fullname` varchar(255) DEFAULT NULL,
  `email` varchar(100) NOT NULL DEFAULT '',
  `password` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `age` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `gender` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- Dumping data for table phpclass.users: ~3 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `name`, `fullname`, `email`, `password`, `phone`, `age`, `address`, `gender`, `created_at`, `updated_at`) VALUES
	(5, 'admin', 'Huyadmin', 'admin@gmail.com', '25d55ad283aa400af464c76d713c07ad', '0989898123', '19', 'Hà Nội', 1, '2021-04-25 01:15:33', '2021-04-25 01:15:33'),
	(6, 'admin2', 'TrongHuy', 'HuyNguyen@gmail.com', 'd41d8cd98f00b204e9800998ecf8427e', '0980806756', '23', 'Hà Nội', 1, '2021-04-25 01:15:14', '2021-04-25 01:15:14');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
