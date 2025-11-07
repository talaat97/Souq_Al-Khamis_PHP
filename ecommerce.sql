-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 06, 2025 at 02:03 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

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
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `address_id` int(11) NOT NULL,
  `address_userid` int(11) NOT NULL,
  `address_name` varchar(255) NOT NULL,
  `address_city` varchar(255) NOT NULL,
  `address_street` varchar(255) NOT NULL,
  `address_lat` double NOT NULL,
  `address_lang` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`address_id`, `address_userid`, `address_name`, `address_city`, `address_street`, `address_lat`, `address_lang`) VALUES
(24, 47, 'my home ', 'el skarkia', '12 share el to5eh', 37.399402832479495, -122.08373799920082);

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `admn_username` varchar(255) NOT NULL,
  `admin_email` varchar(255) NOT NULL,
  `admin_password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `admn_username`, `admin_email`, `admin_password`) VALUES
(1, 'talaat', 'talaat@gmail.com', '0efcc5eb05eb685b30e5aef804c00744be9e3bc8');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `cart_id` int(11) NOT NULL,
  `cart_userid` int(11) NOT NULL,
  `cart_itemsid` int(11) NOT NULL,
  `cart_orders` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`cart_id`, `cart_userid`, `cart_itemsid`, `cart_orders`) VALUES
(161, 47, 2, 7),
(164, 47, 3, 8),
(165, 47, 5, 10),
(166, 47, 2, 11),
(169, 47, 2, 12),
(170, 47, 1, 13),
(171, 47, 11, 14),
(172, 47, 11, 15),
(173, 47, 1, 15),
(174, 47, 5, 16),
(175, 47, 5, 16),
(176, 47, 4, 16),
(177, 47, 1, 17),
(178, 47, 1, 17),
(179, 47, 1, 17),
(181, 47, 4, 18),
(182, 47, 7, 18),
(183, 47, 4, 20),
(184, 47, 5, 20),
(185, 47, 4, 21),
(186, 47, 7, 21),
(189, 47, 1, 22),
(190, 47, 1, 22),
(191, 47, 3, 23),
(192, 47, 3, 23),
(195, 47, 3, 24),
(196, 47, 3, 24),
(197, 47, 4, 25),
(198, 47, 4, 25),
(199, 47, 1, 26),
(200, 47, 1, 26),
(201, 47, 10, 40),
(204, 47, 1, 0),
(205, 47, 4, 0),
(206, 47, 5, 0),
(207, 47, 10, 0),
(208, 47, 2, 0),
(209, 47, 3, 0),
(210, 47, 11, 0);

-- --------------------------------------------------------

--
-- Stand-in structure for view `cartview`
-- (See below for the actual view)
--
CREATE TABLE `cartview` (
`iteamsPrice` double
,`countItems` bigint(21)
,`cart_id` int(11)
,`cart_userid` int(11)
,`cart_itemsid` int(11)
,`cart_orders` int(11)
,`iteams_id` int(11)
,`iteams_name` varchar(255)
,`iteams_name_ar` varchar(255)
,`iteams_dec` varchar(255)
,`iteams_dec_ar` varchar(255)
,`iteams_image` varchar(255)
,`iteams_count` int(11)
,`iteams_active` tinyint(1)
,`iteams_price` float
,`iteams_discount` smallint(6)
,`iteams_date` timestamp
,`iteams_cat` int(11)
);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `categories_id` int(11) NOT NULL,
  `categories_name` varchar(100) NOT NULL,
  `categories_name_ar` varchar(100) NOT NULL,
  `categories_image` varchar(255) NOT NULL,
  `categories_datetime` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`categories_id`, `categories_name`, `categories_name_ar`, `categories_image`, `categories_datetime`) VALUES
(1, 'laptop', 'لابتوب', 'laptop.svg', '2024-09-30 18:12:38'),
(2, 'mobile', 'هاتف', 'mobile.svg', '2024-09-30 17:56:42'),
(3, 'dress', 'فستان', 'dress.svg', '2024-09-30 17:57:31'),
(4, 'cameras', 'الكاميرات', 'cameras.svg', '2024-09-30 18:05:56'),
(5, 'shoes', 'أحذية', 'shoes.svg', '2024-09-30 18:05:56'),
(21, 'ring', 'خاتم', '5131ring.svg', '2025-06-23 14:54:48');

-- --------------------------------------------------------

--
-- Table structure for table `coupon`
--

CREATE TABLE `coupon` (
  `coupon_id` int(11) NOT NULL,
  `coupon_name` varchar(255) NOT NULL,
  `coupon_discount` double NOT NULL,
  `coupon_count` int(11) NOT NULL,
  `coupon_expiredate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `coupon`
--

INSERT INTO `coupon` (`coupon_id`, `coupon_name`, `coupon_discount`, `coupon_count`, `coupon_expiredate`) VALUES
(5, 'talaat', 10, 8, '2024-12-31');

-- --------------------------------------------------------

--
-- Table structure for table `customerorders`
--

CREATE TABLE `customerorders` (
  `order_id` int(11) NOT NULL,
  `order_user_devicetoken` varchar(255) NOT NULL,
  `order_userid` int(11) NOT NULL,
  `order_coupon` int(11) NOT NULL,
  `order_address` int(11) NOT NULL,
  `order_type` tinyint(4) NOT NULL COMMENT '0=>"Delivery" ,1=>"Rechive"',
  `order_price_delivery` float NOT NULL,
  `order_datetime` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `order_price` double NOT NULL,
  `order_total_price` double NOT NULL,
  `order_payment_method` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0=>"Cash",1=>"Payment card"',
  `order_status` tinyint(4) NOT NULL DEFAULT 1,
  `order_delivery` int(11) NOT NULL DEFAULT 0,
  `order_rating` tinyint(4) NOT NULL DEFAULT 0,
  `order_rating_comment` varchar(255) NOT NULL DEFAULT 'none'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `customerorders`
--

INSERT INTO `customerorders` (`order_id`, `order_user_devicetoken`, `order_userid`, `order_coupon`, `order_address`, `order_type`, `order_price_delivery`, `order_datetime`, `order_price`, `order_total_price`, `order_payment_method`, `order_status`, `order_delivery`, `order_rating`, `order_rating_comment`) VALUES
(41, 'dT9Ra39STrCEe-ytyun6dl:APA91bEwXvl01xBRaHjBXVr90Gi4SSne8YzibbHjNf5nRTPhFDF3_-XMUZs_bO_GIpMenRo8QCXNu3lntJ31G6t7WBRSEACSqeKG2KZkSES6VblHrfEgNVc', 47, 0, 24, 0, 0, '2025-06-18 13:21:55', 200, 200, 0, 3, 1, 0, 'none'),
(42, 'dT9Ra39STrCEe-ytyun6dl:APA91bEwXvl01xBRaHjBXVr90Gi4SSne8YzibbHjNf5nRTPhFDF3_-XMUZs_bO_GIpMenRo8QCXNu3lntJ31G6t7WBRSEACSqeKG2KZkSES6VblHrfEgNVc', 47, 0, 0, 0, 0, '2025-02-16 21:35:27', 300, 300, 0, 2, 1, 0, 'none'),
(43, 'dT9Ra39STrCEe-ytyun6dl:APA91bEwXvl01xBRaHjBXVr90Gi4SSne8YzibbHjNf5nRTPhFDF3_-XMUZs_bO_GIpMenRo8QCXNu3lntJ31G6t7WBRSEACSqeKG2KZkSES6VblHrfEgNVc', 47, 0, 24, 0, 0, '2025-02-16 21:58:48', 200, 200, 0, 4, 1, 0, 'none'),
(44, 'djm8VQupQkai4f41Zao6gj:APA91bEv1OrG_Od-DGThrQ3FSK1AgcoKQdZBMxZ88YHgpI3dEtMaEYx3tO7ZkvGq2SW1pmL0Cu2dHcguCa1wl8nKjaYySo9rH2gCvkOoFpPn9D7Iez1pPYY', 47, 0, 0, 0, 0, '2025-02-16 21:37:58', 300, 300, 0, 4, 1, 0, 'none');

-- --------------------------------------------------------

--
-- Table structure for table `delivery`
--

CREATE TABLE `delivery` (
  `delivery_id` int(11) NOT NULL,
  `delivery_name` varchar(255) NOT NULL,
  `delivery_email` varchar(255) NOT NULL,
  `delivery_password` varchar(255) NOT NULL,
  `delivery_phone` int(11) NOT NULL,
  `delivery_approve` tinyint(4) NOT NULL DEFAULT 0,
  `delivery_create` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `delivery`
--

INSERT INTO `delivery` (`delivery_id`, `delivery_name`, `delivery_email`, `delivery_password`, `delivery_phone`, `delivery_approve`, `delivery_create`) VALUES
(1, 'demo', 'demo@gmail.com', '7997f12c3820726b29acaad633838035f867d9a2', 1113809492, 1, '2025-02-02 00:33:28');

-- --------------------------------------------------------

--
-- Table structure for table `favorite`
--

CREATE TABLE `favorite` (
  `favorite_id` int(11) NOT NULL,
  `favorite_userid` int(11) NOT NULL,
  `favorite_iteamsid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `favorite`
--

INSERT INTO `favorite` (`favorite_id`, `favorite_userid`, `favorite_iteamsid`) VALUES
(27, 40, 11),
(29, 46, 1),
(30, 46, 11),
(33, 47, 5);

-- --------------------------------------------------------

--
-- Table structure for table `iteams`
--

CREATE TABLE `iteams` (
  `iteams_id` int(11) NOT NULL,
  `iteams_name` varchar(255) NOT NULL,
  `iteams_name_ar` varchar(255) NOT NULL,
  `iteams_dec` varchar(255) NOT NULL,
  `iteams_dec_ar` varchar(255) NOT NULL,
  `iteams_image` varchar(255) NOT NULL,
  `iteams_count` int(11) NOT NULL,
  `iteams_active` tinyint(1) NOT NULL DEFAULT 1,
  `iteams_price` float NOT NULL,
  `iteams_discount` smallint(6) NOT NULL,
  `iteams_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `iteams_cat` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `iteams`
--

INSERT INTO `iteams` (`iteams_id`, `iteams_name`, `iteams_name_ar`, `iteams_dec`, `iteams_dec_ar`, `iteams_image`, `iteams_count`, `iteams_active`, `iteams_price`, `iteams_discount`, `iteams_date`, `iteams_cat`) VALUES
(1, 'laptop', 'لابتوب ', 'the best laptop for 2022', 'افضل لابتوب لعامنا ', 'laptop_test.png', 5, 1, 250, 20, '2024-10-01 15:39:03', 1),
(2, 'nokia', 'نوكيا', 'nokia dec', 'نوكيا وصف', 'samsung.png', 5, 1, 250, 0, '2024-12-02 12:18:46', 2),
(3, 'canon', 'كانون', 'Impressively small despite having a large full-frame sensor, the Canon EOS RP offers flexible imaging capabilities along with a portable form factor', 'تتيح مجموعة كاميرات Canon للجميع طريقًا للإبداع، بدايةً من كاميرات التصوير الفوري الأنيقة سهلة الحمل والكاميرات صغيرة', 'camera.png', 7, 1, 300, 0, '2024-10-01 15:41:45', 4),
(4, 'H&M dress', 'فستان اتش اند ام', 'the pest sealer in shop', 'افضل مبيعا حاليا', 'dress1.png', 2, 1, 350, 10, '2024-10-07 20:44:15', 3),
(5, 'H&M dress', 'فستان اتش اند ام', 'the pest sealer in shop', 'افضل مبيعا حاليا', 'dress2.png', 2, 1, 350, 10, '2024-10-07 20:48:33', 3),
(6, 'zara dress', 'فستان زارا', 'the pest sealer in shop for zara dress', 'افضل مبيعا حاليا في زارا', 'dress3.png', 2, 1, 350, 10, '2024-10-07 20:48:37', 3),
(7, 'zara dress', 'فستان زارا', 'the pest sealer in shop for zara dress', 'افضل مبيعا حاليا في زارا', 'dress4.png', 2, 1, 350, 10, '2024-10-07 20:48:37', 3),
(8, 'zara dress', 'فستان زارا', 'the pest sealer in shop for zara dress', 'افضل مبيعا حاليا في زارا', 'dress5.png', 2, 1, 350, 10, '2024-10-07 20:48:37', 3),
(9, 'zara dress', 'فستان زارا', 'the pest sealer in shop for zara dress', 'افضل مبيعا حاليا في زارا', 'dress6.png', 2, 1, 350, 10, '2024-10-07 20:48:37', 3),
(10, 'zara dress', 'فستان زارا', 'the pest sealer in shop for zara dress', 'افضل مبيعا حاليا في زارا', 'dress7.png', 2, 1, 350, 10, '2024-10-07 20:48:37', 3),
(11, 'mbook', 'ماك بوك', 'the best laptop for 2024', 'افضل لابتوب لعامنا ', 'mbook.png', 3, 1, 250, 0, '2024-11-28 10:11:15', 1);

-- --------------------------------------------------------

--
-- Stand-in structure for view `iteams1view`
-- (See below for the actual view)
--
CREATE TABLE `iteams1view` (
`iteams_id` int(11)
,`iteams_name` varchar(255)
,`iteams_name_ar` varchar(255)
,`iteams_dec` varchar(255)
,`iteams_dec_ar` varchar(255)
,`iteams_image` varchar(255)
,`iteams_count` int(11)
,`iteams_active` tinyint(1)
,`iteams_price` float
,`iteams_discount` smallint(6)
,`iteams_date` timestamp
,`iteams_cat` int(11)
,`categories_id` int(11)
,`categories_name` varchar(100)
,`categories_name_ar` varchar(100)
,`categories_image` varchar(255)
,`categories_datetime` timestamp
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `itemsview_withrating`
-- (See below for the actual view)
--
CREATE TABLE `itemsview_withrating` (
`iteams_id` int(11)
,`iteams_name` varchar(255)
,`iteams_name_ar` varchar(255)
,`iteams_dec` varchar(255)
,`iteams_dec_ar` varchar(255)
,`iteams_image` varchar(255)
,`iteams_count` int(11)
,`iteams_active` tinyint(1)
,`iteams_price` float
,`iteams_discount` smallint(6)
,`iteams_date` timestamp
,`iteams_cat` int(11)
,`categories_id` int(11)
,`categories_name` varchar(100)
,`categories_name_ar` varchar(100)
,`categories_image` varchar(255)
,`categories_datetime` timestamp
,`rating_id` int(11)
,`rating_iiteamid` int(11)
,`rating_userid` int(11)
,`rating_rateiteam` tinyint(4)
,`rating_noterateing` varchar(255)
,`ratingAvr` decimal(7,4)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `myfavorite`
-- (See below for the actual view)
--
CREATE TABLE `myfavorite` (
`favorite_id` int(11)
,`favorite_userid` int(11)
,`favorite_iteamsid` int(11)
,`iteams_id` int(11)
,`iteams_name` varchar(255)
,`iteams_name_ar` varchar(255)
,`iteams_dec` varchar(255)
,`iteams_dec_ar` varchar(255)
,`iteams_image` varchar(255)
,`iteams_count` int(11)
,`iteams_active` tinyint(1)
,`iteams_price` float
,`iteams_discount` smallint(6)
,`iteams_date` timestamp
,`iteams_cat` int(11)
,`user_id` int(11)
);

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE `notification` (
  `notification_id` int(11) NOT NULL,
  `notification_title` varchar(255) NOT NULL,
  `notification_body` varchar(255) NOT NULL,
  `notification_userid` int(11) NOT NULL,
  `notification_orderId` int(11) NOT NULL,
  `notification_dateTime` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `notification`
--

INSERT INTO `notification` (`notification_id`, `notification_title`, `notification_body`, `notification_userid`, `notification_orderId`, `notification_dateTime`) VALUES
(14, 'order approve', 'your order has been approve under shipping now', 47, 19, '2025-01-01 20:41:13'),
(15, 'order approve', 'your order has been approve under shipping now', 47, 19, '2025-01-01 20:41:47'),
(16, 'order approve', 'your order has been approve under shipping now', 47, 19, '2025-01-01 20:45:14'),
(17, 'order approve', 'your order has been approve under shipping now', 47, 38, '2025-01-22 16:49:16'),
(18, 'order approve', 'your order has been approve under shipping now', 47, 39, '2025-01-29 15:30:26'),
(19, 'order approve', 'your order has been approve under shipping now', 47, 40, '2025-01-29 15:31:00'),
(20, 'order on way', 'your order his preparing and on way to shipping now', 0, 42, '2025-02-12 15:08:14'),
(21, 'order on way', 'your order his preparing and on way to shipping now', 0, 42, '2025-02-12 15:10:08'),
(22, 'order on way', 'your order his preparing and on way to shipping now', 0, 42, '2025-02-12 15:11:59'),
(23, 'order on way', 'your order his preparing and on way to shipping now', 0, 42, '2025-02-12 15:22:22'),
(24, 'order on way', 'your order his preparing and on way to shipping now', 0, 42, '2025-02-12 15:34:47'),
(25, 'order on way', 'your order his preparing and on way to shipping now', 47, 42, '2025-02-12 15:35:52'),
(26, 'order on way', 'your order his preparing and on way to shipping now', 47, 42, '2025-02-12 15:42:10'),
(27, 'order on way', 'your order has been prepared and on way to shipping now', 47, 42, '2025-02-12 20:56:38'),
(28, 'order on way', 'your order has been prepared and on way to shipping now', 47, 42, '2025-02-12 21:04:56'),
(29, 'order on way', 'your order has been prepared and on way to shipping now', 47, 42, '2025-02-14 15:00:55'),
(30, 'order on way', 'your order has been prepared and on way to shipping now', 47, 42, '2025-02-14 15:02:36'),
(31, 'order on way', 'your order has been prepared and on way to shipping now', 47, 42, '2025-02-14 15:04:34'),
(32, 'order on way', 'your order has been prepared and on way to shipping now', 47, 42, '2025-02-16 15:15:23'),
(33, 'order on way', 'your order has been prepared and on way to shipping now', 47, 42, '2025-02-16 15:15:53'),
(34, 'order on way', 'your order has been prepared and on way to shipping now', 47, 42, '2025-02-16 16:00:03'),
(35, 'order on way', 'your order has been prepared and on way to shipping now', 47, 42, '2025-02-16 16:52:22'),
(36, 'order on way', 'your order has been prepared and on way to shipping now', 47, 42, '2025-02-16 17:39:21'),
(37, 'order on way', 'your order has been prepared and on way to shipping now', 47, 41, '2025-02-16 17:40:10'),
(38, 'order on way', 'your order has been prepared and on way to shipping now', 47, 41, '2025-02-16 17:40:56'),
(39, 'order on way', 'your order has been prepared and on way to shipping now', 47, 42, '2025-02-16 17:41:11'),
(40, 'order on way', 'your order has been prepared and on way to shipping now', 47, 41, '2025-02-16 18:04:54'),
(41, 'order on way', 'your order has been prepared and on way to shipping now', 47, 42, '2025-02-16 18:21:35'),
(42, 'order on way', 'your order has been prepared and on way to shipping now', 47, 41, '2025-02-16 18:44:34'),
(43, 'order on way', 'your order has been prepared and on way to shipping now', 47, 42, '2025-02-16 19:45:17'),
(44, 'Thanks to user or servise', ' your order hass ben delivery successfuly , order 41 by 1', 47, 41, '2025-02-16 19:51:55'),
(45, 'Thanks to user or servise', ' your order hass ben delivery successfuly , order 41 by 1', 47, 41, '2025-02-16 19:52:35'),
(46, 'Thanks to user or servise', ' your order hass ben delivery successfuly , order 41 by 1', 47, 41, '2025-02-16 19:55:02'),
(47, 'Thanks to user or servise', ' your order hass ben delivery successfuly , order 41 by 1', 47, 41, '2025-02-16 19:58:47'),
(48, 'order on way', 'your order has been prepared and on way to shipping now', 47, 43, '2025-02-16 20:11:37'),
(49, 'Thanks to user or servise', ' your order hass ben delivery successfuly , order 42 by 1', 47, 42, '2025-02-16 20:28:10'),
(50, 'order on way', 'your order has been prepared and on way to shipping now', 47, 41, '2025-02-16 20:35:03'),
(51, 'Thanks to user or servise', ' your order hass ben delivery successfuly , order 41 by 1', 47, 41, '2025-02-16 20:57:35'),
(52, 'order on way', 'your order has been prepared and on way to shipping now', 47, 42, '2025-02-16 20:58:30'),
(53, 'Thanks to user or servise', ' your order hass ben delivery successfuly , order 43 by 1', 47, 43, '2025-02-16 21:20:19'),
(54, 'order on way', 'your order has been prepared and on way to shipping now', 47, 42, '2025-02-16 21:26:32'),
(55, 'order on way', 'your order has been prepared and on way to shipping now', 47, 44, '2025-02-16 21:27:17'),
(56, 'order on way', 'your order has been prepared and on way to shipping now', 47, 42, '2025-02-16 21:27:32'),
(57, 'order on way', 'your order has been prepared and on way to shipping now', 47, 43, '2025-02-16 21:28:06'),
(58, 'Thanks to user or servise', ' your order hass ben delivery successfuly , order 43 by 1', 47, 43, '2025-02-16 21:34:14'),
(59, 'order on way', 'your order has been prepared and on way to shipping now', 47, 41, '2025-02-16 21:34:19'),
(60, 'Thanks to user or servise', ' your order hass ben delivery successfuly , order 41 by 1', 47, 41, '2025-02-16 21:34:30'),
(61, 'Thanks to user or servise', ' your order hass ben delivery successfuly , order 44 by 1', 47, 44, '2025-02-16 21:34:34'),
(62, 'Thanks to user or servise', ' your order hass ben delivery successfuly , order 42 by 1', 47, 42, '2025-02-16 21:34:48'),
(63, 'Thanks to user or servise', ' your order hass ben delivery successfuly , order 43 by 1', 47, 43, '2025-02-16 21:38:40'),
(64, 'Thanks to user or servise', ' your order hass ben delivery successfuly , order 43 by 1', 47, 43, '2025-02-16 21:58:14'),
(65, 'Thanks to user or servise', ' your order hass ben delivery successfuly , order 43 by 1', 47, 43, '2025-02-16 21:58:48'),
(66, 'order on way', 'your order has been prepared and on way to shipping now', 47, 41, '2025-06-18 13:21:56');

-- --------------------------------------------------------

--
-- Stand-in structure for view `orderdetailsview`
-- (See below for the actual view)
--
CREATE TABLE `orderdetailsview` (
`countItems` bigint(21)
,`order_id` int(11)
,`order_userid` int(11)
,`order_coupon` int(11)
,`order_address` int(11)
,`order_type` tinyint(4)
,`order_price_delivery` float
,`order_datetime` timestamp
,`order_price` double
,`order_total_price` double
,`order_payment_method` tinyint(4)
,`order_status` tinyint(4)
,`address_id` int(11)
,`address_userid` int(11)
,`address_name` varchar(255)
,`address_city` varchar(255)
,`address_street` varchar(255)
,`address_lat` double
,`address_lang` double
,`iteams_id` int(11)
,`iteams_name` varchar(255)
,`iteams_name_ar` varchar(255)
,`iteams_dec` varchar(255)
,`iteams_dec_ar` varchar(255)
,`iteams_image` varchar(255)
,`iteams_count` int(11)
,`iteams_active` tinyint(1)
,`iteams_price` float
,`iteams_discount` smallint(6)
,`iteams_date` timestamp
,`iteams_cat` int(11)
,`cart_id` int(11)
,`cart_userid` int(11)
,`cart_itemsid` int(11)
,`cart_orders` int(11)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `ordersview`
-- (See below for the actual view)
--
CREATE TABLE `ordersview` (
`order_id` int(11)
,`order_user_devicetoken` varchar(255)
,`order_userid` int(11)
,`order_coupon` int(11)
,`order_address` int(11)
,`order_type` tinyint(4)
,`order_price_delivery` float
,`order_datetime` timestamp
,`order_price` double
,`order_total_price` double
,`order_payment_method` tinyint(4)
,`order_status` tinyint(4)
,`order_delivery` int(11)
,`order_rating` tinyint(4)
,`order_rating_comment` varchar(255)
,`address_id` int(11)
,`address_userid` int(11)
,`address_name` varchar(255)
,`address_city` varchar(255)
,`address_street` varchar(255)
,`address_lat` double
,`address_lang` double
);

-- --------------------------------------------------------

--
-- Table structure for table `rating`
--

CREATE TABLE `rating` (
  `rating_id` int(11) NOT NULL,
  `rating_iiteamid` int(11) NOT NULL,
  `rating_userid` int(11) NOT NULL,
  `rating_rateiteam` tinyint(4) NOT NULL,
  `rating_noterateing` varchar(255) NOT NULL DEFAULT 'none'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `rating`
--

INSERT INTO `rating` (`rating_id`, `rating_iiteamid`, `rating_userid`, `rating_rateiteam`, `rating_noterateing`) VALUES
(1, 1, 47, 4, 'this item is so good'),
(2, 1, 48, 1, 'not good '),
(3, 2, 47, 3, 'none'),
(4, 1, 47, 3, 'none'),
(5, 1, 48, 5, 'none'),
(6, 2, 47, 5, 'none');

-- --------------------------------------------------------

--
-- Stand-in structure for view `topsailerview`
-- (See below for the actual view)
--
CREATE TABLE `topsailerview` (
`iteams_id` int(11)
,`iteams_name` varchar(255)
,`iteams_name_ar` varchar(255)
,`iteams_dec` varchar(255)
,`iteams_dec_ar` varchar(255)
,`iteams_image` varchar(255)
,`iteams_count` int(11)
,`iteams_active` tinyint(1)
,`iteams_price` float
,`iteams_discount` smallint(6)
,`iteams_date` timestamp
,`iteams_cat` int(11)
,`categories_id` int(11)
,`categories_name` varchar(100)
,`categories_name_ar` varchar(100)
,`categories_image` varchar(255)
,`categories_datetime` timestamp
,`TopSailer` bigint(21)
,`iteamPriceDescount` double
);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(100) NOT NULL,
  `user_email` varchar(100) NOT NULL,
  `user_password` varchar(100) NOT NULL,
  `user_phone` varchar(100) NOT NULL,
  `user_verfiycode` int(100) NOT NULL,
  `users_approve` tinyint(4) NOT NULL DEFAULT 0,
  `user_create` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `user_name`, `user_email`, `user_password`, `user_phone`, `user_verfiycode`, `users_approve`, `user_create`) VALUES
(35, 'talaat1', 'talaat1@gmail.com', 'newtalaat1', '01113909491', 83445, 1, '2024-09-30 07:06:21'),
(36, 'talaat2', 'talaat2@gmail.com', 'talaat2', '01113809492', 20574, 1, '2024-09-30 07:26:34'),
(38, 'talaat3', 'talaat3@gmail.com', '32585176512ec6819843b149e5c6f4de2f4fb7cd', '01113809433', 25274, 1, '2024-09-30 10:18:11'),
(40, 'nour', 'nour@gmail.com', 'cc7c6e736f0253ec82f8a83e11354c53e42a001e', '01127991470', 40694, 1, '2024-10-01 23:17:05'),
(41, 'talaat7', 'talaat7@gmail.com', '6310092fb4757653599430972bfceceac6359931', '01113809497', 98000, 0, '2024-10-17 19:45:21'),
(44, 'talaat4', 'talaat4@gmail.com', 'afad01adec1513d74a146a7448cb956ee4181df4', '01113809494', 67190, 1, '2024-10-21 21:29:57'),
(45, 'talaat5', 'talaat5@gmail.com', 'e59384ff3fa5222e696158822a224e9df5737f3e', '01113809495', 82088, 1, '2024-10-21 21:31:26'),
(46, 'amrabaza', 'amrabazaa@gmail.com', '1af3c8ccb0f855cf31f06c13248d4b7811c9854a', '01116051665', 74260, 1, '2024-10-31 15:42:39'),
(47, 'ahmed', 'ahmed@gmail.com', '9cdcf4961c73be2e970fa024d0900af6a5029556', '01113809499', 39131, 1, '2024-12-09 12:19:03');

-- --------------------------------------------------------

--
-- Structure for view `cartview`
--
DROP TABLE IF EXISTS `cartview`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `cartview`  AS SELECT sum(`iteams`.`iteams_price` - `iteams`.`iteams_price` * `iteams`.`iteams_discount` / 100) AS `iteamsPrice`, count(`cart`.`cart_userid`) AS `countItems`, `cart`.`cart_id` AS `cart_id`, `cart`.`cart_userid` AS `cart_userid`, `cart`.`cart_itemsid` AS `cart_itemsid`, `cart`.`cart_orders` AS `cart_orders`, `iteams`.`iteams_id` AS `iteams_id`, `iteams`.`iteams_name` AS `iteams_name`, `iteams`.`iteams_name_ar` AS `iteams_name_ar`, `iteams`.`iteams_dec` AS `iteams_dec`, `iteams`.`iteams_dec_ar` AS `iteams_dec_ar`, `iteams`.`iteams_image` AS `iteams_image`, `iteams`.`iteams_count` AS `iteams_count`, `iteams`.`iteams_active` AS `iteams_active`, `iteams`.`iteams_price` AS `iteams_price`, `iteams`.`iteams_discount` AS `iteams_discount`, `iteams`.`iteams_date` AS `iteams_date`, `iteams`.`iteams_cat` AS `iteams_cat` FROM (`cart` join `iteams` on(`iteams`.`iteams_id` = `cart`.`cart_itemsid`)) WHERE `cart`.`cart_orders` = 0 GROUP BY `cart`.`cart_itemsid`, `cart`.`cart_userid` ;

-- --------------------------------------------------------

--
-- Structure for view `iteams1view`
--
DROP TABLE IF EXISTS `iteams1view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `iteams1view`  AS SELECT `iteams`.`iteams_id` AS `iteams_id`, `iteams`.`iteams_name` AS `iteams_name`, `iteams`.`iteams_name_ar` AS `iteams_name_ar`, `iteams`.`iteams_dec` AS `iteams_dec`, `iteams`.`iteams_dec_ar` AS `iteams_dec_ar`, `iteams`.`iteams_image` AS `iteams_image`, `iteams`.`iteams_count` AS `iteams_count`, `iteams`.`iteams_active` AS `iteams_active`, `iteams`.`iteams_price` AS `iteams_price`, `iteams`.`iteams_discount` AS `iteams_discount`, `iteams`.`iteams_date` AS `iteams_date`, `iteams`.`iteams_cat` AS `iteams_cat`, `categories`.`categories_id` AS `categories_id`, `categories`.`categories_name` AS `categories_name`, `categories`.`categories_name_ar` AS `categories_name_ar`, `categories`.`categories_image` AS `categories_image`, `categories`.`categories_datetime` AS `categories_datetime` FROM (`iteams` join `categories` on(`categories`.`categories_id` = `iteams`.`iteams_cat`)) ;

-- --------------------------------------------------------

--
-- Structure for view `itemsview_withrating`
--
DROP TABLE IF EXISTS `itemsview_withrating`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `itemsview_withrating`  AS SELECT `iteams1view`.`iteams_id` AS `iteams_id`, `iteams1view`.`iteams_name` AS `iteams_name`, `iteams1view`.`iteams_name_ar` AS `iteams_name_ar`, `iteams1view`.`iteams_dec` AS `iteams_dec`, `iteams1view`.`iteams_dec_ar` AS `iteams_dec_ar`, `iteams1view`.`iteams_image` AS `iteams_image`, `iteams1view`.`iteams_count` AS `iteams_count`, `iteams1view`.`iteams_active` AS `iteams_active`, `iteams1view`.`iteams_price` AS `iteams_price`, `iteams1view`.`iteams_discount` AS `iteams_discount`, `iteams1view`.`iteams_date` AS `iteams_date`, `iteams1view`.`iteams_cat` AS `iteams_cat`, `iteams1view`.`categories_id` AS `categories_id`, `iteams1view`.`categories_name` AS `categories_name`, `iteams1view`.`categories_name_ar` AS `categories_name_ar`, `iteams1view`.`categories_image` AS `categories_image`, `iteams1view`.`categories_datetime` AS `categories_datetime`, `rating`.`rating_id` AS `rating_id`, `rating`.`rating_iiteamid` AS `rating_iiteamid`, `rating`.`rating_userid` AS `rating_userid`, `rating`.`rating_rateiteam` AS `rating_rateiteam`, `rating`.`rating_noterateing` AS `rating_noterateing`, avg(`rating`.`rating_rateiteam`) AS `ratingAvr` FROM (`iteams1view` left join `rating` on(`iteams1view`.`iteams_id` = `rating`.`rating_iiteamid`)) GROUP BY `iteams1view`.`iteams_id` ;

-- --------------------------------------------------------

--
-- Structure for view `myfavorite`
--
DROP TABLE IF EXISTS `myfavorite`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `myfavorite`  AS SELECT `favorite`.`favorite_id` AS `favorite_id`, `favorite`.`favorite_userid` AS `favorite_userid`, `favorite`.`favorite_iteamsid` AS `favorite_iteamsid`, `iteams`.`iteams_id` AS `iteams_id`, `iteams`.`iteams_name` AS `iteams_name`, `iteams`.`iteams_name_ar` AS `iteams_name_ar`, `iteams`.`iteams_dec` AS `iteams_dec`, `iteams`.`iteams_dec_ar` AS `iteams_dec_ar`, `iteams`.`iteams_image` AS `iteams_image`, `iteams`.`iteams_count` AS `iteams_count`, `iteams`.`iteams_active` AS `iteams_active`, `iteams`.`iteams_price` AS `iteams_price`, `iteams`.`iteams_discount` AS `iteams_discount`, `iteams`.`iteams_date` AS `iteams_date`, `iteams`.`iteams_cat` AS `iteams_cat`, `users`.`user_id` AS `user_id` FROM ((`favorite` join `users` on(`users`.`user_id` = `favorite`.`favorite_userid`)) join `iteams` on(`iteams`.`iteams_id` = `favorite`.`favorite_iteamsid`)) ;

-- --------------------------------------------------------

--
-- Structure for view `orderdetailsview`
--
DROP TABLE IF EXISTS `orderdetailsview`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `orderdetailsview`  AS SELECT count(`cart`.`cart_itemsid`) AS `countItems`, `ordersview`.`order_id` AS `order_id`, `ordersview`.`order_userid` AS `order_userid`, `ordersview`.`order_coupon` AS `order_coupon`, `ordersview`.`order_address` AS `order_address`, `ordersview`.`order_type` AS `order_type`, `ordersview`.`order_price_delivery` AS `order_price_delivery`, `ordersview`.`order_datetime` AS `order_datetime`, `ordersview`.`order_price` AS `order_price`, `ordersview`.`order_total_price` AS `order_total_price`, `ordersview`.`order_payment_method` AS `order_payment_method`, `ordersview`.`order_status` AS `order_status`, `ordersview`.`address_id` AS `address_id`, `ordersview`.`address_userid` AS `address_userid`, `ordersview`.`address_name` AS `address_name`, `ordersview`.`address_city` AS `address_city`, `ordersview`.`address_street` AS `address_street`, `ordersview`.`address_lat` AS `address_lat`, `ordersview`.`address_lang` AS `address_lang`, `iteams`.`iteams_id` AS `iteams_id`, `iteams`.`iteams_name` AS `iteams_name`, `iteams`.`iteams_name_ar` AS `iteams_name_ar`, `iteams`.`iteams_dec` AS `iteams_dec`, `iteams`.`iteams_dec_ar` AS `iteams_dec_ar`, `iteams`.`iteams_image` AS `iteams_image`, `iteams`.`iteams_count` AS `iteams_count`, `iteams`.`iteams_active` AS `iteams_active`, `iteams`.`iteams_price` AS `iteams_price`, `iteams`.`iteams_discount` AS `iteams_discount`, `iteams`.`iteams_date` AS `iteams_date`, `iteams`.`iteams_cat` AS `iteams_cat`, `cart`.`cart_id` AS `cart_id`, `cart`.`cart_userid` AS `cart_userid`, `cart`.`cart_itemsid` AS `cart_itemsid`, `cart`.`cart_orders` AS `cart_orders` FROM ((`cart` join `iteams` on(`cart`.`cart_itemsid` = `iteams`.`iteams_id`)) join `ordersview` on(`ordersview`.`order_id` = `cart`.`cart_orders`)) WHERE `cart`.`cart_orders` <> 0 GROUP BY `cart`.`cart_itemsid`, `cart`.`cart_userid`, `cart`.`cart_orders` ;

-- --------------------------------------------------------

--
-- Structure for view `ordersview`
--
DROP TABLE IF EXISTS `ordersview`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ordersview`  AS SELECT `customerorders`.`order_id` AS `order_id`, `customerorders`.`order_user_devicetoken` AS `order_user_devicetoken`, `customerorders`.`order_userid` AS `order_userid`, `customerorders`.`order_coupon` AS `order_coupon`, `customerorders`.`order_address` AS `order_address`, `customerorders`.`order_type` AS `order_type`, `customerorders`.`order_price_delivery` AS `order_price_delivery`, `customerorders`.`order_datetime` AS `order_datetime`, `customerorders`.`order_price` AS `order_price`, `customerorders`.`order_total_price` AS `order_total_price`, `customerorders`.`order_payment_method` AS `order_payment_method`, `customerorders`.`order_status` AS `order_status`, `customerorders`.`order_delivery` AS `order_delivery`, `customerorders`.`order_rating` AS `order_rating`, `customerorders`.`order_rating_comment` AS `order_rating_comment`, `address`.`address_id` AS `address_id`, `address`.`address_userid` AS `address_userid`, `address`.`address_name` AS `address_name`, `address`.`address_city` AS `address_city`, `address`.`address_street` AS `address_street`, `address`.`address_lat` AS `address_lat`, `address`.`address_lang` AS `address_lang` FROM (`customerorders` left join `address` on(`address`.`address_id` = `customerorders`.`order_address`)) ;

-- --------------------------------------------------------

--
-- Structure for view `topsailerview`
--
DROP TABLE IF EXISTS `topsailerview`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `topsailerview`  AS SELECT `iteams1view`.`iteams_id` AS `iteams_id`, `iteams1view`.`iteams_name` AS `iteams_name`, `iteams1view`.`iteams_name_ar` AS `iteams_name_ar`, `iteams1view`.`iteams_dec` AS `iteams_dec`, `iteams1view`.`iteams_dec_ar` AS `iteams_dec_ar`, `iteams1view`.`iteams_image` AS `iteams_image`, `iteams1view`.`iteams_count` AS `iteams_count`, `iteams1view`.`iteams_active` AS `iteams_active`, `iteams1view`.`iteams_price` AS `iteams_price`, `iteams1view`.`iteams_discount` AS `iteams_discount`, `iteams1view`.`iteams_date` AS `iteams_date`, `iteams1view`.`iteams_cat` AS `iteams_cat`, `iteams1view`.`categories_id` AS `categories_id`, `iteams1view`.`categories_name` AS `categories_name`, `iteams1view`.`categories_name_ar` AS `categories_name_ar`, `iteams1view`.`categories_image` AS `categories_image`, `iteams1view`.`categories_datetime` AS `categories_datetime`, count(`cart`.`cart_itemsid`) AS `TopSailer`, `iteams1view`.`iteams_price`- `iteams1view`.`iteams_price` * `iteams1view`.`iteams_discount` / 100 AS `iteamPriceDescount` FROM (`cart` left join `iteams1view` on(`cart`.`cart_itemsid` = `iteams1view`.`iteams_id`)) GROUP BY `cart`.`cart_itemsid` ORDER BY count(`cart`.`cart_itemsid`) DESC LIMIT 0, 10 ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`address_id`),
  ADD KEY `address_userid` (`address_userid`);

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `cart_itemsid` (`cart_itemsid`),
  ADD KEY `cart_userid` (`cart_userid`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`categories_id`);

--
-- Indexes for table `coupon`
--
ALTER TABLE `coupon`
  ADD PRIMARY KEY (`coupon_id`);

--
-- Indexes for table `customerorders`
--
ALTER TABLE `customerorders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `delivery`
--
ALTER TABLE `delivery`
  ADD PRIMARY KEY (`delivery_id`);

--
-- Indexes for table `favorite`
--
ALTER TABLE `favorite`
  ADD PRIMARY KEY (`favorite_id`),
  ADD KEY `favorite_iteamsid` (`favorite_iteamsid`),
  ADD KEY `favorite_userid` (`favorite_userid`);

--
-- Indexes for table `iteams`
--
ALTER TABLE `iteams`
  ADD PRIMARY KEY (`iteams_id`),
  ADD KEY `iteams_cat` (`iteams_cat`);

--
-- Indexes for table `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`notification_id`);

--
-- Indexes for table `rating`
--
ALTER TABLE `rating`
  ADD PRIMARY KEY (`rating_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `user_email` (`user_email`),
  ADD UNIQUE KEY `user_phone` (`user_phone`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `address`
--
ALTER TABLE `address`
  MODIFY `address_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=211;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `categories_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `coupon`
--
ALTER TABLE `coupon`
  MODIFY `coupon_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `customerorders`
--
ALTER TABLE `customerorders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `delivery`
--
ALTER TABLE `delivery`
  MODIFY `delivery_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `favorite`
--
ALTER TABLE `favorite`
  MODIFY `favorite_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `iteams`
--
ALTER TABLE `iteams`
  MODIFY `iteams_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `notification`
--
ALTER TABLE `notification`
  MODIFY `notification_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT for table `rating`
--
ALTER TABLE `rating`
  MODIFY `rating_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `address_ibfk_1` FOREIGN KEY (`address_userid`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`cart_itemsid`) REFERENCES `iteams` (`iteams_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`cart_userid`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `favorite`
--
ALTER TABLE `favorite`
  ADD CONSTRAINT `favorite_ibfk_1` FOREIGN KEY (`favorite_iteamsid`) REFERENCES `iteams` (`iteams_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `favorite_ibfk_2` FOREIGN KEY (`favorite_userid`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `iteams`
--
ALTER TABLE `iteams`
  ADD CONSTRAINT `iteams_ibfk_1` FOREIGN KEY (`iteams_cat`) REFERENCES `categories` (`categories_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
