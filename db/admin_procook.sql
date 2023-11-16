-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 16, 2023 at 08:55 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `admin_procook`
--

-- --------------------------------------------------------

--
-- Table structure for table `sma_addresses`
--

CREATE TABLE `sma_addresses` (
  `id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `line1` varchar(50) NOT NULL,
  `line2` varchar(50) DEFAULT NULL,
  `city` varchar(25) NOT NULL,
  `postal_code` varchar(20) DEFAULT NULL,
  `state` varchar(25) NOT NULL,
  `country` varchar(50) NOT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `sma_addresses`
--

INSERT INTO `sma_addresses` (`id`, `company_id`, `line1`, `line2`, `city`, `postal_code`, `state`, `country`, `phone`, `updated_at`) VALUES
(1, 4, 'Bowood Road', 'Mount Pleasant', 'Harare', '00263', 'Harare', 'Zimbabwe', '304613', '2018-08-08 11:29:31');

-- --------------------------------------------------------

--
-- Table structure for table `sma_adjustments`
--

CREATE TABLE `sma_adjustments` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `reference_no` varchar(55) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `note` text DEFAULT NULL,
  `attachment` varchar(55) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `count_id` int(11) DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sma_adjustment_items`
--

CREATE TABLE `sma_adjustment_items` (
  `id` int(11) NOT NULL,
  `adjustment_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `option_id` int(11) DEFAULT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `serial_no` varchar(255) DEFAULT NULL,
  `type` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `sma_adjustment_items`
--

INSERT INTO `sma_adjustment_items` (`id`, `adjustment_id`, `product_id`, `option_id`, `quantity`, `warehouse_id`, `serial_no`, `type`) VALUES
(5, 2, 277, NULL, '1.0000', 1, '', 'addition'),
(6, 3, 277, NULL, '1.0000', 1, '', 'addition'),
(13, 8, 277, NULL, '6.0000', 1, '', 'addition'),
(14, 9, 280, NULL, '1.0000', 1, '', 'addition'),
(16, 11, 425, NULL, '1.0000', 1, '', 'addition'),
(17, 12, 428, NULL, '1.0000', 1, '', 'addition'),
(20, 14, 533, NULL, '0.0000', 1, '', 'subtraction'),
(21, 14, 281, NULL, '0.0000', 1, '', 'subtraction'),
(22, 15, 539, NULL, '0.0000', 1, '', 'subtraction'),
(23, 16, 539, NULL, '0.0000', 1, '', 'subtraction');

-- --------------------------------------------------------

--
-- Table structure for table `sma_api_keys`
--

CREATE TABLE `sma_api_keys` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `reference` varchar(40) NOT NULL,
  `key` varchar(40) NOT NULL,
  `level` int(2) NOT NULL,
  `ignore_limits` tinyint(1) NOT NULL DEFAULT 0,
  `is_private_key` tinyint(1) NOT NULL DEFAULT 0,
  `ip_addresses` text DEFAULT NULL,
  `date_created` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sma_api_limits`
--

CREATE TABLE `sma_api_limits` (
  `id` int(11) NOT NULL,
  `uri` varchar(255) NOT NULL,
  `count` int(10) NOT NULL,
  `hour_started` int(11) NOT NULL,
  `api_key` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sma_api_logs`
--

CREATE TABLE `sma_api_logs` (
  `id` int(11) NOT NULL,
  `uri` varchar(255) NOT NULL,
  `method` varchar(6) NOT NULL,
  `params` text DEFAULT NULL,
  `api_key` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `time` int(11) NOT NULL,
  `rtime` float DEFAULT NULL,
  `authorized` varchar(1) NOT NULL,
  `response_code` smallint(3) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `sma_api_logs`
--

INSERT INTO `sma_api_logs` (`id`, `uri`, `method`, `params`, `api_key`, `ip_address`, `time`, `rtime`, `authorized`, `response_code`) VALUES
(1, 'api/v1/products', 'get', 'a:10:{s:4:\"Host\";s:23:\"procook.adroitlight.com\";s:15:\"X-Forwarded-For\";s:12:\"39.63.17.161\";s:10:\"Connection\";s:5:\"close\";s:10:\"User-Agent\";s:78:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:73.0) Gecko/20100101 Firefox/73.0\";s:6:\"Accept\";s:74:\"text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8\";s:15:\"Accept-Language\";s:14:\"en-US,en;q=0.5\";s:15:\"Accept-Encoding\";s:13:\"gzip, deflate\";s:3:\"DNT\";s:1:\"1\";s:6:\"Cookie\";s:67:\"G_ENABLED_IDPS=google; sma_cart_id=e00b8178cb11a8137a90fef01568ac56\";s:25:\"Upgrade-Insecure-Requests\";s:1:\"1\";}', '', '39.63.17.161', 1584356416, NULL, '0', 403),
(2, 'api/v1/products', 'get', 'a:10:{s:4:\"Host\";s:23:\"procook.adroitlight.com\";s:15:\"X-Forwarded-For\";s:12:\"39.63.17.161\";s:10:\"Connection\";s:5:\"close\";s:10:\"User-Agent\";s:78:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:73.0) Gecko/20100101 Firefox/73.0\";s:6:\"Accept\";s:74:\"text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8\";s:15:\"Accept-Language\";s:14:\"en-US,en;q=0.5\";s:15:\"Accept-Encoding\";s:13:\"gzip, deflate\";s:3:\"DNT\";s:1:\"1\";s:6:\"Cookie\";s:67:\"G_ENABLED_IDPS=google; sma_cart_id=e00b8178cb11a8137a90fef01568ac56\";s:25:\"Upgrade-Insecure-Requests\";s:1:\"1\";}', '', '39.63.17.161', 1584356416, 0.109983, '1', 0),
(3, 'api/v1/products', 'get', 'a:10:{s:4:\"Host\";s:23:\"procook.adroitlight.com\";s:15:\"X-Forwarded-For\";s:12:\"39.63.17.161\";s:10:\"Connection\";s:5:\"close\";s:10:\"User-Agent\";s:78:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:73.0) Gecko/20100101 Firefox/73.0\";s:6:\"Accept\";s:74:\"text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8\";s:15:\"Accept-Language\";s:14:\"en-US,en;q=0.5\";s:15:\"Accept-Encoding\";s:13:\"gzip, deflate\";s:3:\"DNT\";s:1:\"1\";s:6:\"Cookie\";s:157:\"G_ENABLED_IDPS=google; sma_cart_id=e00b8178cb11a8137a90fef01568ac56; sma_token_cookie=2b8c3281d07b879d98ee57ee9a29cc92; sess=cdjprghp276ed7tu3m4moi0dip3423jc\";s:25:\"Upgrade-Insecure-Requests\";s:1:\"1\";}', '', '39.63.17.161', 1584356425, NULL, '0', 403),
(4, 'api/v1/products', 'get', 'a:10:{s:4:\"Host\";s:23:\"procook.adroitlight.com\";s:15:\"X-Forwarded-For\";s:12:\"39.63.17.161\";s:10:\"Connection\";s:5:\"close\";s:10:\"User-Agent\";s:78:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:73.0) Gecko/20100101 Firefox/73.0\";s:6:\"Accept\";s:74:\"text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8\";s:15:\"Accept-Language\";s:14:\"en-US,en;q=0.5\";s:15:\"Accept-Encoding\";s:13:\"gzip, deflate\";s:3:\"DNT\";s:1:\"1\";s:6:\"Cookie\";s:157:\"G_ENABLED_IDPS=google; sma_cart_id=e00b8178cb11a8137a90fef01568ac56; sma_token_cookie=2b8c3281d07b879d98ee57ee9a29cc92; sess=cdjprghp276ed7tu3m4moi0dip3423jc\";s:25:\"Upgrade-Insecure-Requests\";s:1:\"1\";}', '', '39.63.17.161', 1584356425, 0.018084, '1', 0),
(5, 'api/v1/products', 'get', 'a:11:{s:4:\"code\";s:8:\"00264714\";s:4:\"Host\";s:23:\"procook.adroitlight.com\";s:15:\"X-Forwarded-For\";s:12:\"39.63.17.161\";s:10:\"Connection\";s:5:\"close\";s:10:\"User-Agent\";s:78:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:73.0) Gecko/20100101 Firefox/73.0\";s:6:\"Accept\";s:74:\"text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8\";s:15:\"Accept-Language\";s:14:\"en-US,en;q=0.5\";s:15:\"Accept-Encoding\";s:13:\"gzip, deflate\";s:3:\"DNT\";s:1:\"1\";s:6:\"Cookie\";s:157:\"G_ENABLED_IDPS=google; sma_cart_id=e00b8178cb11a8137a90fef01568ac56; sma_token_cookie=2b8c3281d07b879d98ee57ee9a29cc92; sess=pujeupr3h06tb9hgetoeac26642qtdo8\";s:25:\"Upgrade-Insecure-Requests\";s:1:\"1\";}', '', '39.63.17.161', 1584357690, NULL, '0', 403),
(6, 'api/v1/products', 'get', 'a:11:{s:4:\"code\";s:8:\"00264714\";s:4:\"Host\";s:23:\"procook.adroitlight.com\";s:15:\"X-Forwarded-For\";s:12:\"39.63.17.161\";s:10:\"Connection\";s:5:\"close\";s:10:\"User-Agent\";s:78:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:73.0) Gecko/20100101 Firefox/73.0\";s:6:\"Accept\";s:74:\"text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8\";s:15:\"Accept-Language\";s:14:\"en-US,en;q=0.5\";s:15:\"Accept-Encoding\";s:13:\"gzip, deflate\";s:3:\"DNT\";s:1:\"1\";s:6:\"Cookie\";s:157:\"G_ENABLED_IDPS=google; sma_cart_id=e00b8178cb11a8137a90fef01568ac56; sma_token_cookie=2b8c3281d07b879d98ee57ee9a29cc92; sess=pujeupr3h06tb9hgetoeac26642qtdo8\";s:25:\"Upgrade-Insecure-Requests\";s:1:\"1\";}', '', '39.63.17.161', 1584357690, 0.262175, '1', 0);

-- --------------------------------------------------------

--
-- Table structure for table `sma_branches`
--

CREATE TABLE `sma_branches` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `address` varchar(255) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sma_branches`
--

INSERT INTO `sma_branches` (`id`, `name`, `city`, `state`, `phone`, `mobile`, `address`, `active`) VALUES
(4, 'Kings Cafe', 'Gujranwala', 'Punjab', '0554290903', '03304646090', 'THIS BRANCH IS LOCATED AT MAIN GT ROAD NEAR KINGS CAFE', 1),
(5, 'King Pizza WT', 'GUJRANWALA', 'PUNJAB', '0554281771', '03004646090', 'THIS BRANCH IS LOCATED IN MAIN MARKET PHASE 2 CITI HOUSING', 1),
(6, 'King Pizza Citi', 'Gujranwala', 'Punjab', '03004590903', '78978789798', 'King Pizza Wapda town ', 1),
(8, 'KIngs pIzza Model Town', 'Gujranwala', 'Pujab', '890890890', '890809890', 'this branch is on the right side of main market modal town round about', 1);

-- --------------------------------------------------------

--
-- Table structure for table `sma_brands`
--

CREATE TABLE `sma_brands` (
  `id` int(11) NOT NULL,
  `code` varchar(20) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `image` varchar(50) DEFAULT NULL,
  `slug` varchar(55) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `sma_brands`
--

INSERT INTO `sma_brands` (`id`, `code`, `name`, `image`, `slug`, `description`) VALUES
(7, 'AHS', 'Ahsan wanda house', NULL, 'ahsan-wanda-house', 'kljlk'),
(8, 'MUG', 'Mughal wanda House', NULL, 'mughal-wanda-house', 'jl'),
(9, 'ST', 'Star wanda house', NULL, 'star-wanda-house', 'jkljkl'),
(10, 'bkwh', 'Bilal Khal Wanda House', NULL, 'bilal-khal-wanda-house', 'jlk');

-- --------------------------------------------------------

--
-- Table structure for table `sma_calendar`
--

CREATE TABLE `sma_calendar` (
  `id` int(11) NOT NULL,
  `title` varchar(55) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `start` datetime NOT NULL,
  `end` datetime DEFAULT NULL,
  `color` varchar(7) NOT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sma_captcha`
--

CREATE TABLE `sma_captcha` (
  `captcha_id` bigint(13) UNSIGNED NOT NULL,
  `captcha_time` int(10) UNSIGNED NOT NULL,
  `ip_address` varchar(16) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '0',
  `word` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sma_cart`
--

CREATE TABLE `sma_cart` (
  `id` varchar(40) NOT NULL,
  `time` varchar(30) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `data` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sma_cash_categories`
--

CREATE TABLE `sma_cash_categories` (
  `id` int(11) NOT NULL,
  `code` varchar(55) NOT NULL,
  `name` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sma_cash_head`
--

CREATE TABLE `sma_cash_head` (
  `id` int(11) NOT NULL,
  `cash_inhand` int(255) DEFAULT NULL,
  `total_cash` int(11) DEFAULT NULL,
  `total_cash_in` int(11) DEFAULT NULL,
  `total_cash_out` int(11) DEFAULT NULL,
  `opening_date` date DEFAULT NULL,
  `start_bit` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sma_cash_head`
--

INSERT INTO `sma_cash_head` (`id`, `cash_inhand`, `total_cash`, `total_cash_in`, `total_cash_out`, `opening_date`, `start_bit`) VALUES
(1, 585200, NULL, 300000, -285200, '2022-12-28', 1);

-- --------------------------------------------------------

--
-- Table structure for table `sma_cash_management`
--

CREATE TABLE `sma_cash_management` (
  `id` int(11) NOT NULL,
  `sale_id` int(11) DEFAULT NULL,
  `purchase_id` int(11) DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `reference` varchar(50) NOT NULL,
  `amount` decimal(25,4) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `type` varchar(111) NOT NULL,
  `created_by` varchar(55) NOT NULL,
  `attachment` varchar(55) DEFAULT NULL,
  `category_id` varchar(111) DEFAULT NULL,
  `warehouse_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `sma_cash_management`
--

INSERT INTO `sma_cash_management` (`id`, `sale_id`, `purchase_id`, `date`, `reference`, `amount`, `note`, `type`, `created_by`, `attachment`, `category_id`, `warehouse_id`) VALUES
(7, NULL, NULL, '2023-11-16 06:58:00', 'POP2023/11/0015', '300000.0000', '', 'cashout', '5', NULL, 'cash (Purchase)', NULL),
(8, NULL, NULL, '2023-11-16 06:58:00', 'POP2023/11/0016', '13800.0000', '', 'cashout', '5', NULL, 'cash (Purchase)', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_categories`
--

CREATE TABLE `sma_categories` (
  `id` int(11) NOT NULL,
  `code` varchar(55) NOT NULL,
  `name` varchar(55) NOT NULL,
  `image` varchar(55) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `slug` varchar(55) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `sma_categories`
--

INSERT INTO `sma_categories` (`id`, `code`, `name`, `image`, `parent_id`, `slug`, `description`) VALUES
(53, 'rm', 'Raw Material', NULL, 0, 'raw-material', 'hjk'),
(54, 'FP', 'Factory Product', NULL, 0, 'factory-product', 'jkljkl');

-- --------------------------------------------------------

--
-- Table structure for table `sma_cheques_payments`
--

CREATE TABLE `sma_cheques_payments` (
  `id` int(11) NOT NULL,
  `date` timestamp NULL DEFAULT current_timestamp(),
  `sale_id` int(11) DEFAULT NULL,
  `return_id` int(11) DEFAULT NULL,
  `purchase_id` int(11) DEFAULT NULL,
  `reference_no` varchar(50) NOT NULL,
  `transaction_id` varchar(50) DEFAULT NULL,
  `paid_by` varchar(20) NOT NULL,
  `cheque_no` varchar(20) DEFAULT NULL,
  `cc_no` varchar(20) DEFAULT NULL,
  `cc_holder` varchar(25) DEFAULT NULL,
  `cc_month` varchar(2) DEFAULT NULL,
  `cc_year` varchar(4) DEFAULT NULL,
  `cc_type` varchar(20) DEFAULT NULL,
  `amount` decimal(25,4) NOT NULL,
  `currency` varchar(3) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `attachment` varchar(55) DEFAULT NULL,
  `type` varchar(20) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `pos_paid` decimal(25,4) DEFAULT 0.0000,
  `pos_balance` decimal(25,4) DEFAULT 0.0000,
  `approval_code` varchar(50) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sma_combo_items`
--

CREATE TABLE `sma_combo_items` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `item_code` varchar(20) NOT NULL,
  `quantity` decimal(12,4) NOT NULL,
  `unit_price` decimal(25,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `sma_combo_items`
--

INSERT INTO `sma_combo_items` (`id`, `product_id`, `item_code`, `quantity`, `unit_price`) VALUES
(8915, 598, '83705705', '20.0000', '150.0000');

-- --------------------------------------------------------

--
-- Table structure for table `sma_companies`
--

CREATE TABLE `sma_companies` (
  `id` int(11) NOT NULL,
  `group_id` int(10) UNSIGNED DEFAULT NULL,
  `group_name` varchar(20) NOT NULL,
  `customer_group_id` int(11) DEFAULT NULL,
  `customer_group_name` varchar(100) DEFAULT NULL,
  `name` varchar(55) NOT NULL,
  `company` varchar(255) NOT NULL,
  `vat_no` varchar(100) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(55) DEFAULT NULL,
  `state` varchar(55) DEFAULT NULL,
  `postal_code` varchar(8) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `cf1` varchar(100) DEFAULT NULL,
  `cf2` varchar(100) DEFAULT NULL,
  `cf3` varchar(100) DEFAULT NULL,
  `cf4` varchar(100) DEFAULT NULL,
  `cf5` varchar(100) DEFAULT NULL,
  `cf6` varchar(100) DEFAULT NULL,
  `invoice_footer` text DEFAULT NULL,
  `payment_term` int(11) DEFAULT 0,
  `logo` varchar(255) DEFAULT 'logo.png',
  `award_points` int(11) DEFAULT 0,
  `deposit_amount` decimal(25,4) DEFAULT NULL,
  `price_group_id` int(11) DEFAULT NULL,
  `price_group_name` varchar(50) DEFAULT NULL,
  `gst_no` varchar(100) DEFAULT NULL,
  `opening_balance` double NOT NULL DEFAULT 0,
  `type` enum('payable','receiveable') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `sma_companies`
--

INSERT INTO `sma_companies` (`id`, `group_id`, `group_name`, `customer_group_id`, `customer_group_name`, `name`, `company`, `vat_no`, `address`, `city`, `state`, `postal_code`, `country`, `phone`, `email`, `cf1`, `cf2`, `cf3`, `cf4`, `cf5`, `cf6`, `invoice_footer`, `payment_term`, `logo`, `award_points`, `deposit_amount`, `price_group_id`, `price_group_name`, `gst_no`, `opening_balance`, `type`) VALUES
(3, NULL, 'biller', NULL, NULL, 'Test Biller', 'Test Biller', '5555', 'Biller adddress', 'City', '', '', 'Country', '0092', 'test@adroitlight.com', '', '', '', '', '', '', ' Thank you for shopping with us. Please come again', 0, 'Website-Logo.png', 0, NULL, NULL, NULL, '', 0, NULL),
(5, NULL, 'biller', NULL, NULL, 'Khan', 'APM Biller', '', 'DC Colony', 'Grw', '', '2233', 'Pakistan', '009255', 'user@adroitLight.com', '', '', '', '', '', '', 'ALS Designs', 0, 'Website-Logo.png', 0, NULL, NULL, NULL, '', 0, NULL),
(6, NULL, 'biller', NULL, NULL, 'Raza', 'ALS Biller', '12345678', 'DC Road', 'Grw', '', '', 'Pakistan', '00923066634430', 'info@adroitLight.com', '', '', '', '', '', '', 'www.adroitLight.com', 0, 'LD-Logo.png', 0, NULL, NULL, NULL, '', 0, NULL),
(13, 4, 'supplier', NULL, NULL, 'Tayeb sab', 'Jumbo Packages', '', 'near sadique sadiq hospital', 'Gujranwala', 'Gujranwala', '52200', 'Pakistan', '03217404008', 'jumbopackages@gmail.com', '', '', '', '', '', '', NULL, 0, 'logo.png', 0, NULL, NULL, NULL, '', 0, NULL),
(43, NULL, 'biller', NULL, NULL, 'ABDUL REHMAN', 'PRO COOK', '', 'wazirabad', 'wazirabad', 'gujranwala', '52200', 'pakistan', '03007496659', 'cookwzd@gmail.com', '', '', '', '', '', '', '', 0, 'Website-Logo3.png', 0, NULL, NULL, NULL, '', 0, NULL),
(53, 3, 'customer', 2, 'Product Purchaser', 'nafees ahmed', 'walk-in Customer', '', 'house 2 street 2 w-block peoples colony gujranwala', 'gujranwala', 'punjab', '52250', 'Pakistan', '+923056184125', 'nafees1431@gmail.com', '', '', '', '', '', '', NULL, 0, 'logo.png', 0, NULL, 1, 'Default', '', 0, NULL),
(54, 3, 'customer', 2, 'Product Purchaser', 'Salman Ahmed', 'Misc', '', 'w block', 'gujranwala', 'Abia', '52250', 'Pakistan', '0563478543', 'salman@gmail.com', '', '', '', '', '', '', NULL, 0, 'logo.png', 0, NULL, 1, 'Default', '', 0, NULL),
(55, 3, 'customer', 2, 'Product Purchaser', 'Salman AHmed', 'ALSdhsajk', '789', 'misc', 'misc', 'punjab', '52250', 'Pakistan', '890', 'salman123@gmail.com', '', '', '', '', '', '', NULL, 0, 'logo.png', 0, NULL, 1, 'Default', '789', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_costing`
--

CREATE TABLE `sma_costing` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `sale_item_id` int(11) NOT NULL,
  `sale_id` int(11) DEFAULT NULL,
  `purchase_item_id` int(11) DEFAULT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `purchase_net_unit_cost` decimal(25,4) DEFAULT NULL,
  `purchase_unit_cost` decimal(25,4) DEFAULT NULL,
  `sale_net_unit_price` decimal(25,4) NOT NULL,
  `sale_unit_price` decimal(25,4) NOT NULL,
  `quantity_balance` decimal(15,4) DEFAULT NULL,
  `inventory` tinyint(1) DEFAULT 0,
  `overselling` tinyint(1) DEFAULT 0,
  `option_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `sma_costing`
--

INSERT INTO `sma_costing` (`id`, `date`, `product_id`, `sale_item_id`, `sale_id`, `purchase_item_id`, `quantity`, `purchase_net_unit_cost`, `purchase_unit_cost`, `sale_net_unit_price`, `sale_unit_price`, `quantity_balance`, `inventory`, `overselling`, `option_id`) VALUES
(12, '2018-09-06', 3, 13, 11, 4, '1.0000', '90.0000', '103.5000', '120.0000', '138.0000', '8.0000', 1, 0, NULL),
(13, '2018-09-06', 1, 14, 11, 1, '1.0000', '405.2174', '466.0000', '652.1739', '750.0000', '5.0000', 1, 0, NULL),
(28, '2018-09-27', 47, 30, 19, 23, '1.0000', '39.1304', '45.0000', '43.4783', '50.0000', '96.0000', 1, 0, NULL),
(29, '2018-09-27', 47, 31, 19, 23, '2.0000', '39.1304', '45.0000', '43.4783', '50.0000', '95.0000', 1, 0, NULL),
(30, '2018-09-27', 45, 32, 20, 21, '1.0000', '95.0000', '95.0000', '100.0000', '100.0000', '999.0000', 1, 0, NULL),
(31, '2018-09-27', 45, 33, 20, 21, '2.0000', '95.0000', '95.0000', '100.0000', '100.0000', '998.0000', 1, 0, NULL),
(32, '2018-09-27', 45, 34, 21, 21, '1.0000', '95.0000', '95.0000', '100.0000', '100.0000', '996.0000', 1, 0, NULL),
(33, '2018-09-27', 45, 35, 21, 21, '2.0000', '95.0000', '95.0000', '100.0000', '100.0000', '995.0000', 1, 0, NULL),
(34, '2018-09-27', 47, 36, 22, 23, '1.0000', '39.1304', '45.0000', '43.4783', '50.0000', '93.0000', 1, 0, NULL),
(35, '2018-09-27', 47, 37, 22, 23, '2.0000', '39.1304', '45.0000', '43.4783', '50.0000', '92.0000', 1, 0, NULL),
(36, '2018-09-27', 45, 38, 23, 21, '1.0000', '95.0000', '95.0000', '100.0000', '100.0000', '993.0000', 1, 0, NULL),
(37, '2018-09-27', 45, 39, 23, 21, '2.0000', '95.0000', '95.0000', '100.0000', '100.0000', '992.0000', 1, 0, NULL),
(38, '2018-09-27', 47, 40, 24, 23, '1.0000', '39.1304', '45.0000', '43.4783', '50.0000', '90.0000', 1, 0, NULL),
(39, '2018-09-27', 47, 41, 24, 23, '2.0000', '39.1304', '45.0000', '43.4783', '50.0000', '89.0000', 1, 0, NULL),
(40, '2018-09-29', 47, 42, 25, 23, '1.0000', '39.1304', '45.0000', '86.9565', '100.0000', '87.0000', 1, 0, NULL),
(41, '2018-09-30', 5, 43, 26, 7, '5.0000', '4.3478', '5.0000', '15.6522', '18.0000', '0.0000', 1, 0, NULL),
(42, '2018-10-01', 47, 44, 27, 23, '1.0000', '39.1304', '45.0000', '43.4783', '50.0000', '87.0000', 1, 0, NULL),
(43, '2018-10-02', 47, 45, 28, 23, '1.0000', '39.1304', '45.0000', '43.4783', '50.0000', '86.0000', 1, 0, NULL),
(44, '2018-10-02', 47, 46, 28, 23, '5.0000', '39.1304', '45.0000', '43.4783', '50.0000', '82.0000', 1, 0, NULL),
(45, '2018-10-02', 47, 47, 29, 23, '2.0000', '39.1304', '45.0000', '43.4783', '50.0000', '79.0000', 1, 0, NULL),
(46, '2018-10-02', 47, 48, 29, 23, '1.0000', '39.1304', '45.0000', '43.4783', '50.0000', '80.0000', 1, 0, NULL),
(47, '2018-10-03', 47, 49, 30, 23, '3.0000', '39.1304', '45.0000', '43.4783', '50.0000', '75.0000', 1, 0, NULL),
(48, '2023-11-15', 597, 12, 1, 538, '1.0000', '100.0000', '100.0000', '202.5000', '202.5000', '99.0000', 1, 0, NULL),
(49, '2023-11-15', 598, 13, 1, 540, '1.0000', '1500.0000', '1500.0000', '6750.0000', '6750.0000', '99.0000', 1, 0, NULL),
(50, '2023-11-15', 598, 14, 2, 540, '80.0000', '1500.0000', '1500.0000', '6750.0000', '6750.0000', '19.0000', 1, 0, NULL),
(51, '2023-11-15', 597, 15, 2, 538, '80.0000', '100.0000', '100.0000', '202.5000', '202.5000', '19.0000', 1, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_currencies`
--

CREATE TABLE `sma_currencies` (
  `id` int(11) NOT NULL,
  `code` varchar(5) NOT NULL,
  `name` varchar(55) NOT NULL,
  `rate` decimal(12,4) NOT NULL,
  `auto_update` tinyint(1) NOT NULL DEFAULT 0,
  `symbol` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `sma_currencies`
--

INSERT INTO `sma_currencies` (`id`, `code`, `name`, `rate`, `auto_update`, `symbol`) VALUES
(3, 'Rs', 'Rupee', '1.0000', 0, 'Rs');

-- --------------------------------------------------------

--
-- Table structure for table `sma_customer_groups`
--

CREATE TABLE `sma_customer_groups` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `percent` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `sma_customer_groups`
--

INSERT INTO `sma_customer_groups` (`id`, `name`, `percent`) VALUES
(1, 'Raw Purchaser', 10),
(2, 'Product Purchaser', 35);

-- --------------------------------------------------------

--
-- Table structure for table `sma_date_format`
--

CREATE TABLE `sma_date_format` (
  `id` int(11) NOT NULL,
  `js` varchar(20) NOT NULL,
  `php` varchar(20) NOT NULL,
  `sql` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `sma_date_format`
--

INSERT INTO `sma_date_format` (`id`, `js`, `php`, `sql`) VALUES
(1, 'mm-dd-yyyy', 'm-d-Y', '%m-%d-%Y'),
(2, 'mm/dd/yyyy', 'm/d/Y', '%m/%d/%Y'),
(3, 'mm.dd.yyyy', 'm.d.Y', '%m.%d.%Y'),
(4, 'dd-mm-yyyy', 'd-m-Y', '%d-%m-%Y'),
(5, 'dd/mm/yyyy', 'd/m/Y', '%d/%m/%Y'),
(6, 'dd.mm.yyyy', 'd.m.Y', '%d.%m.%Y');

-- --------------------------------------------------------

--
-- Table structure for table `sma_deliveries`
--

CREATE TABLE `sma_deliveries` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `sale_id` int(11) NOT NULL,
  `do_reference_no` varchar(50) NOT NULL,
  `sale_reference_no` varchar(50) NOT NULL,
  `customer` varchar(55) NOT NULL,
  `address` varchar(1000) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `status` varchar(15) DEFAULT NULL,
  `attachment` varchar(50) DEFAULT NULL,
  `delivered_by` varchar(50) DEFAULT NULL,
  `received_by` varchar(50) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sma_deposits`
--

CREATE TABLE `sma_deposits` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `company_id` int(11) NOT NULL,
  `amount` decimal(25,4) NOT NULL,
  `paid_by` varchar(50) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `sma_deposits`
--

INSERT INTO `sma_deposits` (`id`, `date`, `company_id`, `amount`, `paid_by`, `note`, `created_by`, `updated_by`, `updated_at`) VALUES
(1, '2018-08-08 23:44:00', 1, '500.0000', 'EcoCash', '<p>Deposit paid in my customer</p>', 2, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_expenses`
--

CREATE TABLE `sma_expenses` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `reference` varchar(50) NOT NULL,
  `amount` decimal(25,4) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `created_by` varchar(55) NOT NULL,
  `attachment` varchar(55) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `warehouse_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `sma_expenses`
--

INSERT INTO `sma_expenses` (`id`, `date`, `reference`, `amount`, `note`, `created_by`, `attachment`, `category_id`, `warehouse_id`) VALUES
(1, '2023-11-14 10:27:00', 'fdsf', '432.0000', '', '5', NULL, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `sma_expense_categories`
--

CREATE TABLE `sma_expense_categories` (
  `id` int(11) NOT NULL,
  `code` varchar(55) NOT NULL,
  `name` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `sma_expense_categories`
--

INSERT INTO `sma_expense_categories` (`id`, `code`, `name`) VALUES
(1, '15814580', 'In Direct Expence'),
(2, '15814580', 'labour');

-- --------------------------------------------------------

--
-- Table structure for table `sma_gift_cards`
--

CREATE TABLE `sma_gift_cards` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `card_no` varchar(20) NOT NULL,
  `value` decimal(25,4) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `customer` varchar(255) DEFAULT NULL,
  `balance` decimal(25,4) NOT NULL,
  `expiry` date DEFAULT NULL,
  `created_by` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `sma_gift_cards`
--

INSERT INTO `sma_gift_cards` (`id`, `date`, `card_no`, `value`, `customer_id`, `customer`, `balance`, `expiry`, `created_by`) VALUES
(1, '2018-09-06 20:43:10', '100', '100.0000', 4, 'Bowood Lodge', '100.0000', '2020-09-07', '5');

-- --------------------------------------------------------

--
-- Table structure for table `sma_gift_card_topups`
--

CREATE TABLE `sma_gift_card_topups` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `card_id` int(11) NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `created_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sma_groups`
--

CREATE TABLE `sma_groups` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `sma_groups`
--

INSERT INTO `sma_groups` (`id`, `name`, `description`) VALUES
(1, 'owner', 'Owner'),
(2, 'admin', 'Administrator'),
(3, 'customer', 'Customer'),
(4, 'supplier', 'Supplier'),
(5, 'sales', 'Sales Staff'),
(6, 'sub-admin', 'dsjakl');

-- --------------------------------------------------------

--
-- Table structure for table `sma_login_attempts`
--

CREATE TABLE `sma_login_attempts` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `ip_address` varbinary(16) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sma_migrations`
--

CREATE TABLE `sma_migrations` (
  `version` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `sma_migrations`
--

INSERT INTO `sma_migrations` (`version`) VALUES
(315);

-- --------------------------------------------------------

--
-- Table structure for table `sma_notifications`
--

CREATE TABLE `sma_notifications` (
  `id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `from_date` datetime DEFAULT NULL,
  `till_date` datetime DEFAULT NULL,
  `scope` tinyint(1) NOT NULL DEFAULT 3
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sma_order_ref`
--

CREATE TABLE `sma_order_ref` (
  `ref_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `so` int(11) NOT NULL DEFAULT 1,
  `qu` int(11) NOT NULL DEFAULT 1,
  `po` int(11) NOT NULL DEFAULT 1,
  `to` int(11) NOT NULL DEFAULT 1,
  `pos` int(11) NOT NULL DEFAULT 1,
  `do` int(11) NOT NULL DEFAULT 1,
  `pay` int(11) NOT NULL DEFAULT 1,
  `re` int(11) NOT NULL DEFAULT 1,
  `rep` int(11) NOT NULL DEFAULT 1,
  `ex` int(11) NOT NULL DEFAULT 1,
  `ppay` int(11) NOT NULL DEFAULT 1,
  `qa` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `sma_order_ref`
--

INSERT INTO `sma_order_ref` (`ref_id`, `date`, `so`, `qu`, `po`, `to`, `pos`, `do`, `pay`, `re`, `rep`, `ex`, `ppay`, `qa`) VALUES
(1, '2020-03-01', 1, 1, 34, 1, 17, 1, 7, 1, 1, 3, 17, 6);

-- --------------------------------------------------------

--
-- Table structure for table `sma_pages`
--

CREATE TABLE `sma_pages` (
  `id` int(11) NOT NULL,
  `name` varchar(15) NOT NULL,
  `title` varchar(60) NOT NULL,
  `description` varchar(180) NOT NULL,
  `slug` varchar(55) DEFAULT NULL,
  `body` text NOT NULL,
  `active` tinyint(1) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `order_no` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sma_payments`
--

CREATE TABLE `sma_payments` (
  `id` int(11) NOT NULL,
  `date` timestamp NULL DEFAULT current_timestamp(),
  `sale_id` int(11) DEFAULT NULL,
  `return_id` int(11) DEFAULT NULL,
  `purchase_id` int(11) DEFAULT NULL,
  `reference_no` varchar(50) NOT NULL,
  `transaction_id` varchar(50) DEFAULT NULL,
  `paid_by` varchar(20) NOT NULL,
  `cheque_no` varchar(20) DEFAULT NULL,
  `cc_no` varchar(20) DEFAULT NULL,
  `cc_holder` varchar(25) DEFAULT NULL,
  `cc_month` varchar(2) DEFAULT NULL,
  `cc_year` varchar(4) DEFAULT NULL,
  `cc_type` varchar(20) DEFAULT NULL,
  `amount` decimal(25,4) NOT NULL,
  `currency` varchar(3) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `attachment` varchar(55) DEFAULT NULL,
  `type` varchar(20) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `pos_paid` decimal(25,4) DEFAULT 0.0000,
  `pos_balance` decimal(25,4) DEFAULT 0.0000,
  `approval_code` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `sma_payments`
--

INSERT INTO `sma_payments` (`id`, `date`, `sale_id`, `return_id`, `purchase_id`, `reference_no`, `transaction_id`, `paid_by`, `cheque_no`, `cc_no`, `cc_holder`, `cc_month`, `cc_year`, `cc_type`, `amount`, `currency`, `created_by`, `attachment`, `type`, `note`, `pos_paid`, `pos_balance`, `approval_code`) VALUES
(14, '2018-09-06 17:24:29', 11, NULL, NULL, 'IPAY2018/09/0007', NULL, 'cash', '', '', '', '', '', '', '888.0000', NULL, 5, NULL, 'received', '', '888.0000', '0.0000', NULL),
(22, '2018-09-27 08:24:50', 19, NULL, NULL, 'IPAY2018/09/0013', NULL, 'cash', '', '', '', '', '', '', '150.0000', NULL, 5, NULL, 'received', '', '150.0000', '0.0000', NULL),
(23, '2018-09-27 08:29:51', 20, NULL, NULL, 'IPAY2018/09/0014', NULL, 'cash', '', '', '', '', '', '', '300.0000', NULL, 5, NULL, 'received', '', '300.0000', '0.0000', NULL),
(24, '2018-09-27 08:38:11', 21, NULL, NULL, 'IPAY2018/09/0015', NULL, 'cash', '', '', '', '', '', '', '345.0000', NULL, 5, NULL, 'received', '', '345.0000', '0.0000', NULL),
(25, '2018-09-27 08:40:21', 22, NULL, NULL, 'IPAY2018/09/0016', NULL, 'cash', '', '', '', '', '', '', '172.5000', NULL, 5, NULL, 'received', '', '172.5000', '0.0000', NULL),
(26, '2018-09-27 08:48:17', 23, NULL, NULL, 'IPAY2018/09/0017', NULL, 'cash', '', '', '', '', '', '', '345.0000', NULL, 5, NULL, 'received', '', '345.0000', '0.0000', NULL),
(27, '2018-09-27 10:31:40', 24, NULL, NULL, 'IPAY2018/09/0018', NULL, 'cash', '', '', '', '', '', '', '150.0000', NULL, 5, NULL, 'received', '', '150.0000', '0.0000', NULL),
(28, '2018-09-30 12:15:16', 26, NULL, NULL, 'IPAY2018/09/0019', NULL, 'cash', '', '', '', '', '', '', '103.5000', NULL, 5, NULL, 'received', '', '103.5000', '0.0000', NULL),
(29, '2018-10-01 12:35:51', 27, NULL, NULL, 'IPAY2018/10/0020', NULL, 'cash', '', '', '', '', '', '', '50.0000', NULL, 5, NULL, 'received', '', '50.0000', '0.0000', NULL),
(30, '2018-10-02 05:14:40', 28, NULL, NULL, 'IPAY2018/10/0021', NULL, 'cash', '', '', '', '', '', '', '300.0000', NULL, 5, NULL, 'received', '', '300.0000', '0.0000', NULL),
(31, '2018-10-03 06:19:20', 30, NULL, NULL, 'IPAY2018/10/0022', NULL, 'cash', '', '', '', '', '', '', '150.0000', NULL, 5, NULL, 'received', '', '150.0000', '0.0000', NULL),
(40, '2023-11-15 11:30:19', 1, NULL, NULL, 'IPAY2023/11/0005', NULL, 'cash', '', '', '', '', '', '', '6952.5000', NULL, 5, NULL, 'received', '', '6953.0000', '0.5000', NULL),
(41, '2023-11-15 11:35:29', 2, NULL, NULL, 'IPAY2023/11/0006', NULL, 'cash', '', '', '', '', '', '', '556200.0000', NULL, 5, NULL, 'received', '', '556200.0000', '0.0000', NULL),
(42, '2023-11-16 06:58:00', NULL, NULL, 29, 'POP2023/11/0015', NULL, 'cash', '', '', '', '', '', 'Visa', '300000.0000', NULL, 5, NULL, 'sent', '', '0.0000', '0.0000', NULL),
(43, '2023-11-16 06:58:00', NULL, NULL, 28, 'POP2023/11/0016', NULL, 'cash', '', '', '', '', '', 'Visa', '13800.0000', NULL, 5, NULL, 'sent', '', '0.0000', '0.0000', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_paypal`
--

CREATE TABLE `sma_paypal` (
  `id` int(11) NOT NULL,
  `active` tinyint(4) NOT NULL,
  `account_email` varchar(255) NOT NULL,
  `paypal_currency` varchar(3) NOT NULL DEFAULT 'USD',
  `fixed_charges` decimal(25,4) NOT NULL DEFAULT 2.0000,
  `extra_charges_my` decimal(25,4) NOT NULL DEFAULT 3.9000,
  `extra_charges_other` decimal(25,4) NOT NULL DEFAULT 4.4000
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `sma_paypal`
--

INSERT INTO `sma_paypal` (`id`, `active`, `account_email`, `paypal_currency`, `fixed_charges`, `extra_charges_my`, `extra_charges_other`) VALUES
(1, 1, 'mypaypal@paypal.com', 'USD', '0.0000', '0.0000', '0.0000');

-- --------------------------------------------------------

--
-- Table structure for table `sma_permissions`
--

CREATE TABLE `sma_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `products-index` tinyint(1) DEFAULT 0,
  `products-add` tinyint(1) DEFAULT 0,
  `products-edit` tinyint(1) DEFAULT 0,
  `products-delete` tinyint(1) DEFAULT 0,
  `products-cost` tinyint(1) DEFAULT 0,
  `products-price` tinyint(1) DEFAULT 0,
  `quotes-index` tinyint(1) DEFAULT 0,
  `quotes-add` tinyint(1) DEFAULT 0,
  `quotes-edit` tinyint(1) DEFAULT 0,
  `quotes-pdf` tinyint(1) DEFAULT 0,
  `quotes-email` tinyint(1) DEFAULT 0,
  `quotes-delete` tinyint(1) DEFAULT 0,
  `sales-index` tinyint(1) DEFAULT 0,
  `sales-add` tinyint(1) DEFAULT 0,
  `sales-edit` tinyint(1) DEFAULT 0,
  `sales-pdf` tinyint(1) DEFAULT 0,
  `sales-email` tinyint(1) DEFAULT 0,
  `sales-delete` tinyint(1) DEFAULT 0,
  `purchases-index` tinyint(1) DEFAULT 0,
  `purchases-add` tinyint(1) DEFAULT 0,
  `purchases-edit` tinyint(1) DEFAULT 0,
  `purchases-pdf` tinyint(1) DEFAULT 0,
  `purchases-email` tinyint(1) DEFAULT 0,
  `purchases-delete` tinyint(1) DEFAULT 0,
  `transfers-index` tinyint(1) DEFAULT 0,
  `transfers-add` tinyint(1) DEFAULT 0,
  `transfers-edit` tinyint(1) DEFAULT 0,
  `transfers-pdf` tinyint(1) DEFAULT 0,
  `transfers-email` tinyint(1) DEFAULT 0,
  `transfers-delete` tinyint(1) DEFAULT 0,
  `customers-index` tinyint(1) DEFAULT 0,
  `customers-add` tinyint(1) DEFAULT 0,
  `customers-edit` tinyint(1) DEFAULT 0,
  `customers-delete` tinyint(1) DEFAULT 0,
  `suppliers-index` tinyint(1) DEFAULT 0,
  `suppliers-add` tinyint(1) DEFAULT 0,
  `suppliers-edit` tinyint(1) DEFAULT 0,
  `suppliers-delete` tinyint(1) DEFAULT 0,
  `sales-deliveries` tinyint(1) DEFAULT 0,
  `sales-add_delivery` tinyint(1) DEFAULT 0,
  `sales-edit_delivery` tinyint(1) DEFAULT 0,
  `sales-delete_delivery` tinyint(1) DEFAULT 0,
  `sales-email_delivery` tinyint(1) DEFAULT 0,
  `sales-pdf_delivery` tinyint(1) DEFAULT 0,
  `sales-gift_cards` tinyint(1) DEFAULT 0,
  `sales-add_gift_card` tinyint(1) DEFAULT 0,
  `sales-edit_gift_card` tinyint(1) DEFAULT 0,
  `sales-delete_gift_card` tinyint(1) DEFAULT 0,
  `pos-index` tinyint(1) DEFAULT 0,
  `sales-return_sales` tinyint(1) DEFAULT 0,
  `reports-index` tinyint(1) DEFAULT 0,
  `reports-warehouse_stock` tinyint(1) DEFAULT 0,
  `reports-quantity_alerts` tinyint(1) DEFAULT 0,
  `reports-expiry_alerts` tinyint(1) DEFAULT 0,
  `reports-products` tinyint(1) DEFAULT 0,
  `reports-daily_sales` tinyint(1) DEFAULT 0,
  `reports-monthly_sales` tinyint(1) DEFAULT 0,
  `reports-sales` tinyint(1) DEFAULT 0,
  `reports-payments` tinyint(1) DEFAULT 0,
  `reports-purchases` tinyint(1) DEFAULT 0,
  `reports-profit_loss` tinyint(1) DEFAULT 0,
  `reports-customers` tinyint(1) DEFAULT 0,
  `reports-suppliers` tinyint(1) DEFAULT 0,
  `reports-staff` tinyint(1) DEFAULT 0,
  `reports-register` tinyint(1) DEFAULT 0,
  `sales-payments` tinyint(1) DEFAULT 0,
  `purchases-payments` tinyint(1) DEFAULT 0,
  `purchases-expenses` tinyint(1) DEFAULT 0,
  `products-adjustments` tinyint(1) NOT NULL DEFAULT 0,
  `bulk_actions` tinyint(1) NOT NULL DEFAULT 0,
  `customers-deposits` tinyint(1) NOT NULL DEFAULT 0,
  `customers-delete_deposit` tinyint(1) NOT NULL DEFAULT 0,
  `products-barcode` tinyint(1) NOT NULL DEFAULT 0,
  `purchases-return_purchases` tinyint(1) NOT NULL DEFAULT 0,
  `reports-expenses` tinyint(1) NOT NULL DEFAULT 0,
  `reports-daily_purchases` tinyint(1) DEFAULT 0,
  `reports-monthly_purchases` tinyint(1) DEFAULT 0,
  `products-stock_count` tinyint(1) DEFAULT 0,
  `edit_price` tinyint(1) DEFAULT 0,
  `returns-index` tinyint(1) DEFAULT 0,
  `returns-add` tinyint(1) DEFAULT 0,
  `returns-edit` tinyint(1) DEFAULT 0,
  `returns-delete` tinyint(1) DEFAULT 0,
  `returns-email` tinyint(1) DEFAULT 0,
  `returns-pdf` tinyint(1) DEFAULT 0,
  `reports-tax` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `sma_permissions`
--

INSERT INTO `sma_permissions` (`id`, `group_id`, `products-index`, `products-add`, `products-edit`, `products-delete`, `products-cost`, `products-price`, `quotes-index`, `quotes-add`, `quotes-edit`, `quotes-pdf`, `quotes-email`, `quotes-delete`, `sales-index`, `sales-add`, `sales-edit`, `sales-pdf`, `sales-email`, `sales-delete`, `purchases-index`, `purchases-add`, `purchases-edit`, `purchases-pdf`, `purchases-email`, `purchases-delete`, `transfers-index`, `transfers-add`, `transfers-edit`, `transfers-pdf`, `transfers-email`, `transfers-delete`, `customers-index`, `customers-add`, `customers-edit`, `customers-delete`, `suppliers-index`, `suppliers-add`, `suppliers-edit`, `suppliers-delete`, `sales-deliveries`, `sales-add_delivery`, `sales-edit_delivery`, `sales-delete_delivery`, `sales-email_delivery`, `sales-pdf_delivery`, `sales-gift_cards`, `sales-add_gift_card`, `sales-edit_gift_card`, `sales-delete_gift_card`, `pos-index`, `sales-return_sales`, `reports-index`, `reports-warehouse_stock`, `reports-quantity_alerts`, `reports-expiry_alerts`, `reports-products`, `reports-daily_sales`, `reports-monthly_sales`, `reports-sales`, `reports-payments`, `reports-purchases`, `reports-profit_loss`, `reports-customers`, `reports-suppliers`, `reports-staff`, `reports-register`, `sales-payments`, `purchases-payments`, `purchases-expenses`, `products-adjustments`, `bulk_actions`, `customers-deposits`, `customers-delete_deposit`, `products-barcode`, `purchases-return_purchases`, `reports-expenses`, `reports-daily_purchases`, `reports-monthly_purchases`, `products-stock_count`, `edit_price`, `returns-index`, `returns-add`, `returns-edit`, `returns-delete`, `returns-email`, `returns-pdf`, `reports-tax`) VALUES
(1, 5, 1, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(2, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `sma_pos_register`
--

CREATE TABLE `sma_pos_register` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `user_id` int(11) NOT NULL,
  `cash_in_hand` decimal(25,4) NOT NULL,
  `status` varchar(10) NOT NULL,
  `total_cash` decimal(25,4) DEFAULT NULL,
  `total_cheques` int(11) DEFAULT NULL,
  `total_cc_slips` int(11) DEFAULT NULL,
  `total_cash_submitted` decimal(25,4) DEFAULT NULL,
  `total_cheques_submitted` int(11) DEFAULT NULL,
  `total_cc_slips_submitted` int(11) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `closed_at` timestamp NULL DEFAULT NULL,
  `transfer_opened_bills` varchar(50) DEFAULT NULL,
  `closed_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `sma_pos_register`
--

INSERT INTO `sma_pos_register` (`id`, `date`, `user_id`, `cash_in_hand`, `status`, `total_cash`, `total_cheques`, `total_cc_slips`, `total_cash_submitted`, `total_cheques_submitted`, `total_cc_slips_submitted`, `note`, `closed_at`, `transfer_opened_bills`, `closed_by`) VALUES
(1, '2018-08-08 12:45:05', 2, '0.0000', 'close', '0.0000', 0, 0, '0.0000', 0, 0, '', '2019-10-16 11:01:32', NULL, 5),
(2, '2018-08-09 17:34:31', 4, '0.0000', 'close', '0.0000', 0, 0, '0.0000', 0, 0, '', '2019-10-16 11:01:21', NULL, 5),
(3, '2018-08-20 23:15:44', 5, '0.0000', 'close', '3761.0000', 0, 0, '3761.0000', 0, 0, '', '2019-10-16 11:01:09', NULL, 5),
(4, '2019-10-26 10:20:05', 5, '10000.0000', 'close', '10000.0000', 0, 0, '10000.0000', 0, 0, '', '2019-10-26 10:27:29', NULL, 5),
(5, '2020-06-05 16:13:50', 5, '50000.0000', 'close', '0.0000', 0, 0, '0.0000', 0, 0, '', '2022-09-06 12:55:17', NULL, 5),
(6, '2022-09-06 12:59:23', 5, '100000.0000', 'close', '100000.0000', 0, 0, '100000.0000', 0, 0, '', '2022-09-06 13:05:20', NULL, 5),
(7, '2022-10-24 05:39:05', 5, '1.0000', 'close', '562720.5000', 0, 0, '562720.5000', 0, 0, '', '2023-11-16 06:54:12', NULL, 5),
(8, '2023-11-07 07:29:10', 6, '1000.0000', 'close', '0.0000', 0, 0, '0.0000', 0, 0, '', '2023-11-16 06:54:22', NULL, 5),
(9, '2023-11-16 06:59:57', 5, '10000.0000', 'open', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_pos_settings`
--

CREATE TABLE `sma_pos_settings` (
  `pos_id` int(1) NOT NULL,
  `cat_limit` int(11) NOT NULL,
  `pro_limit` int(11) NOT NULL,
  `default_category` int(11) NOT NULL,
  `default_customer` int(11) NOT NULL,
  `default_biller` int(11) NOT NULL,
  `display_time` varchar(3) NOT NULL DEFAULT 'yes',
  `cf_title1` varchar(255) DEFAULT NULL,
  `cf_title2` varchar(255) DEFAULT NULL,
  `cf_value1` varchar(255) DEFAULT NULL,
  `cf_value2` varchar(255) DEFAULT NULL,
  `receipt_printer` varchar(55) DEFAULT NULL,
  `cash_drawer_codes` varchar(55) DEFAULT NULL,
  `focus_add_item` varchar(55) DEFAULT NULL,
  `add_manual_product` varchar(55) DEFAULT NULL,
  `customer_selection` varchar(55) DEFAULT NULL,
  `add_customer` varchar(55) DEFAULT NULL,
  `toggle_category_slider` varchar(55) DEFAULT NULL,
  `toggle_subcategory_slider` varchar(55) DEFAULT NULL,
  `cancel_sale` varchar(55) DEFAULT NULL,
  `suspend_sale` varchar(55) DEFAULT NULL,
  `print_items_list` varchar(55) DEFAULT NULL,
  `finalize_sale` varchar(55) DEFAULT NULL,
  `today_sale` varchar(55) DEFAULT NULL,
  `open_hold_bills` varchar(55) DEFAULT NULL,
  `close_register` varchar(55) DEFAULT NULL,
  `keyboard` tinyint(1) NOT NULL,
  `pos_printers` varchar(255) DEFAULT NULL,
  `java_applet` tinyint(1) NOT NULL,
  `product_button_color` varchar(20) NOT NULL DEFAULT 'default',
  `tooltips` tinyint(1) DEFAULT 1,
  `paypal_pro` tinyint(1) DEFAULT 0,
  `stripe` tinyint(1) DEFAULT 0,
  `rounding` tinyint(1) DEFAULT 0,
  `char_per_line` tinyint(4) DEFAULT 42,
  `pin_code` varchar(20) DEFAULT NULL,
  `purchase_code` varchar(100) DEFAULT 'purchase_code',
  `envato_username` varchar(50) DEFAULT 'envato_username',
  `version` varchar(10) DEFAULT '3.4.6',
  `after_sale_page` tinyint(1) DEFAULT 0,
  `item_order` tinyint(1) DEFAULT 0,
  `authorize` tinyint(1) DEFAULT 0,
  `toggle_brands_slider` varchar(55) DEFAULT NULL,
  `remote_printing` tinyint(1) DEFAULT 1,
  `printer` int(11) DEFAULT NULL,
  `order_printers` varchar(55) DEFAULT NULL,
  `auto_print` tinyint(1) DEFAULT 0,
  `customer_details` tinyint(1) DEFAULT NULL,
  `local_printers` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `sma_pos_settings`
--

INSERT INTO `sma_pos_settings` (`pos_id`, `cat_limit`, `pro_limit`, `default_category`, `default_customer`, `default_biller`, `display_time`, `cf_title1`, `cf_title2`, `cf_value1`, `cf_value2`, `receipt_printer`, `cash_drawer_codes`, `focus_add_item`, `add_manual_product`, `customer_selection`, `add_customer`, `toggle_category_slider`, `toggle_subcategory_slider`, `cancel_sale`, `suspend_sale`, `print_items_list`, `finalize_sale`, `today_sale`, `open_hold_bills`, `close_register`, `keyboard`, `pos_printers`, `java_applet`, `product_button_color`, `tooltips`, `paypal_pro`, `stripe`, `rounding`, `char_per_line`, `pin_code`, `purchase_code`, `envato_username`, `version`, `after_sale_page`, `item_order`, `authorize`, `toggle_brands_slider`, `remote_printing`, `printer`, `order_printers`, `auto_print`, `customer_details`, `local_printers`) VALUES
(1, 22, 50, 32, 1, 43, '1', 'VAT Reg', '', '123456789', '', NULL, 'x1C', 'Ctrl+F3', 'Ctrl+Shift+M', 'Ctrl+Shift+C', 'Ctrl+Shift+A', 'Ctrl+F11', 'Ctrl+F12', 'F4', 'F7', 'F9', 'F8', 'Ctrl+F1', 'Ctrl+F2', 'Ctrl+F10', 1, NULL, 0, 'default', 1, 0, 1, 0, 42, NULL, 'purchase_code', 'envato_username', '3.4.6', 0, 0, 0, '', 1, NULL, 'null', 0, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sma_price_groups`
--

CREATE TABLE `sma_price_groups` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `sma_price_groups`
--

INSERT INTO `sma_price_groups` (`id`, `name`) VALUES
(1, 'Default'),
(2, 'MID'),
(3, 'Premium');

-- --------------------------------------------------------

--
-- Table structure for table `sma_printers`
--

CREATE TABLE `sma_printers` (
  `id` int(11) NOT NULL,
  `title` varchar(55) NOT NULL,
  `type` varchar(25) NOT NULL,
  `profile` varchar(25) NOT NULL,
  `char_per_line` tinyint(3) UNSIGNED DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `ip_address` varbinary(45) DEFAULT NULL,
  `port` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sma_products`
--

CREATE TABLE `sma_products` (
  `id` int(11) NOT NULL,
  `code` varchar(50) NOT NULL,
  `name` varchar(255) NOT NULL,
  `unit` int(11) DEFAULT NULL,
  `cost` decimal(25,4) DEFAULT NULL,
  `price` decimal(25,4) NOT NULL,
  `alert_quantity` decimal(15,4) DEFAULT 20.0000,
  `image` varchar(255) DEFAULT 'no_image.png',
  `category_id` int(11) NOT NULL,
  `subcategory_id` int(11) DEFAULT NULL,
  `cf1` varchar(255) DEFAULT NULL,
  `cf2` varchar(255) DEFAULT NULL,
  `cf3` varchar(255) DEFAULT NULL,
  `cf4` varchar(255) DEFAULT NULL,
  `cf5` varchar(255) DEFAULT NULL,
  `cf6` varchar(255) DEFAULT NULL,
  `quantity` decimal(15,4) DEFAULT 0.0000,
  `tax_rate` int(11) DEFAULT NULL,
  `track_quantity` tinyint(1) DEFAULT 1,
  `details` varchar(1000) DEFAULT NULL,
  `warehouse` int(11) DEFAULT NULL,
  `barcode_symbology` varchar(55) NOT NULL DEFAULT 'code128',
  `file` varchar(100) DEFAULT NULL,
  `product_details` text DEFAULT NULL,
  `tax_method` tinyint(1) DEFAULT 0,
  `type` varchar(55) NOT NULL DEFAULT 'standard',
  `supplier1` int(11) DEFAULT NULL,
  `supplier1price` decimal(25,4) DEFAULT NULL,
  `supplier2` int(11) DEFAULT NULL,
  `supplier2price` decimal(25,4) DEFAULT NULL,
  `supplier3` int(11) DEFAULT NULL,
  `supplier3price` decimal(25,4) DEFAULT NULL,
  `supplier4` int(11) DEFAULT NULL,
  `supplier4price` decimal(25,4) DEFAULT NULL,
  `supplier5` int(11) DEFAULT NULL,
  `supplier5price` decimal(25,4) DEFAULT NULL,
  `promotion` tinyint(1) DEFAULT 0,
  `promo_price` decimal(25,4) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `supplier1_part_no` varchar(50) DEFAULT NULL,
  `supplier2_part_no` varchar(50) DEFAULT NULL,
  `supplier3_part_no` varchar(50) DEFAULT NULL,
  `supplier4_part_no` varchar(50) DEFAULT NULL,
  `supplier5_part_no` varchar(50) DEFAULT NULL,
  `sale_unit` int(11) DEFAULT NULL,
  `purchase_unit` int(11) DEFAULT NULL,
  `brand` int(11) DEFAULT NULL,
  `slug` varchar(55) DEFAULT NULL,
  `featured` tinyint(1) DEFAULT NULL,
  `weight` decimal(10,4) DEFAULT NULL,
  `hsn_code` int(11) DEFAULT NULL,
  `views` int(11) NOT NULL DEFAULT 0,
  `hide` tinyint(1) NOT NULL DEFAULT 0,
  `second_name` varchar(255) DEFAULT NULL,
  `product_type` enum('default','opening_balance') NOT NULL DEFAULT 'default'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `sma_products`
--

INSERT INTO `sma_products` (`id`, `code`, `name`, `unit`, `cost`, `price`, `alert_quantity`, `image`, `category_id`, `subcategory_id`, `cf1`, `cf2`, `cf3`, `cf4`, `cf5`, `cf6`, `quantity`, `tax_rate`, `track_quantity`, `details`, `warehouse`, `barcode_symbology`, `file`, `product_details`, `tax_method`, `type`, `supplier1`, `supplier1price`, `supplier2`, `supplier2price`, `supplier3`, `supplier3price`, `supplier4`, `supplier4price`, `supplier5`, `supplier5price`, `promotion`, `promo_price`, `start_date`, `end_date`, `supplier1_part_no`, `supplier2_part_no`, `supplier3_part_no`, `supplier4_part_no`, `supplier5_part_no`, `sale_unit`, `purchase_unit`, `brand`, `slug`, `featured`, `weight`, `hsn_code`, `views`, `hide`, `second_name`, `product_type`) VALUES
(597, '83705705', 'Toori', 5, '100.0000', '150.0000', '50.0000', 'no_image.png', 53, NULL, '', '', '', '', '', '', '119.0000', 1, 1, '', NULL, 'code128', '', '', 1, 'standard', 13, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', NULL, NULL, NULL, 5, 5, 9, 'toori', NULL, '1.0000', NULL, 0, 1, '', 'default'),
(598, '18283824', 'Khal Wanda', 5, '3000.0000', '5000.0000', '50.0000', 'no_image.png', 54, NULL, '', '', '', '', '', '', '119.0000', 1, 1, '', NULL, 'code128', '', '', 1, 'production', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 5, 5, 10, 'khal-wanda', NULL, '10.0000', NULL, 0, 0, 'kw', 'default');

-- --------------------------------------------------------

--
-- Table structure for table `sma_product_photos`
--

CREATE TABLE `sma_product_photos` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `photo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sma_product_prices`
--

CREATE TABLE `sma_product_prices` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `price_group_id` int(11) NOT NULL,
  `price` decimal(25,4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sma_product_variants`
--

CREATE TABLE `sma_product_variants` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `name` varchar(55) NOT NULL,
  `cost` decimal(25,4) DEFAULT NULL,
  `price` decimal(25,4) DEFAULT NULL,
  `quantity` decimal(15,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sma_purchases`
--

CREATE TABLE `sma_purchases` (
  `id` int(11) NOT NULL,
  `reference_no` varchar(55) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `supplier_id` int(11) NOT NULL,
  `supplier` varchar(55) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `note` varchar(1000) NOT NULL,
  `total` decimal(25,4) DEFAULT NULL,
  `product_discount` decimal(25,4) DEFAULT NULL,
  `order_discount_id` varchar(20) DEFAULT NULL,
  `order_discount` decimal(25,4) DEFAULT NULL,
  `total_discount` decimal(25,4) DEFAULT NULL,
  `product_tax` decimal(25,4) DEFAULT NULL,
  `order_tax_id` int(11) DEFAULT NULL,
  `order_tax` decimal(25,4) DEFAULT NULL,
  `total_tax` decimal(25,4) DEFAULT 0.0000,
  `shipping` decimal(25,4) DEFAULT 0.0000,
  `grand_total` decimal(25,4) NOT NULL,
  `paid` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `status` varchar(55) DEFAULT '',
  `payment_status` varchar(20) DEFAULT 'pending',
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `attachment` varchar(55) DEFAULT NULL,
  `payment_term` tinyint(4) DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `return_id` int(11) DEFAULT NULL,
  `surcharge` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `return_purchase_ref` varchar(55) DEFAULT NULL,
  `purchase_id` int(11) DEFAULT NULL,
  `return_purchase_total` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL,
  `type` enum('default','opening_balance') NOT NULL DEFAULT 'default',
  `opening_balance_type` enum('payable','receiveable') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `sma_purchases`
--

INSERT INTO `sma_purchases` (`id`, `reference_no`, `date`, `supplier_id`, `supplier`, `warehouse_id`, `note`, `total`, `product_discount`, `order_discount_id`, `order_discount`, `total_discount`, `product_tax`, `order_tax_id`, `order_tax`, `total_tax`, `shipping`, `grand_total`, `paid`, `status`, `payment_status`, `created_by`, `updated_by`, `updated_at`, `attachment`, `payment_term`, `due_date`, `return_id`, `surcharge`, `return_purchase_ref`, `purchase_id`, `return_purchase_total`, `cgst`, `sgst`, `igst`, `type`, `opening_balance_type`) VALUES
(28, 'PO2023/11/0032', '2023-11-14 10:25:00', 13, 'Jumbo Packages', 2, '&lt;p&gt;this is note to check&lt;&sol;p&gt;', '13800.0000', '0.0000', '', '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '13800.0000', '13800.0000', 'received', 'paid', 5, NULL, NULL, NULL, 0, NULL, NULL, '0.0000', NULL, NULL, '0.0000', NULL, NULL, NULL, 'default', NULL),
(29, 'PO2023/11/0033', '2023-11-16 06:57:00', 13, 'Jumbo Packages', 4, '&lt;p&gt;this is incoming&lt;&sol;p&gt;', '300000.0000', '0.0000', '', '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '300000.0000', '300000.0000', 'received', 'paid', 5, NULL, NULL, NULL, 0, NULL, NULL, '0.0000', NULL, NULL, '0.0000', NULL, NULL, NULL, 'default', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_purchase_items`
--

CREATE TABLE `sma_purchase_items` (
  `id` int(11) NOT NULL,
  `purchase_id` int(11) DEFAULT NULL,
  `transfer_id` int(11) DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  `product_code` varchar(50) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `option_id` int(11) DEFAULT NULL,
  `net_unit_cost` decimal(25,4) NOT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `tax_rate_id` int(11) DEFAULT NULL,
  `tax` varchar(20) DEFAULT NULL,
  `discount` varchar(20) DEFAULT NULL,
  `item_discount` decimal(25,4) DEFAULT NULL,
  `expiry` date DEFAULT NULL,
  `subtotal` decimal(25,4) NOT NULL,
  `quantity_balance` decimal(15,4) DEFAULT 0.0000,
  `date` date NOT NULL,
  `status` varchar(50) NOT NULL,
  `unit_cost` decimal(25,4) DEFAULT NULL,
  `real_unit_cost` decimal(25,4) DEFAULT NULL,
  `quantity_received` decimal(15,4) DEFAULT NULL,
  `supplier_part_no` varchar(50) DEFAULT NULL,
  `purchase_item_id` int(11) DEFAULT NULL,
  `product_unit_id` int(11) DEFAULT NULL,
  `product_unit_code` varchar(10) DEFAULT NULL,
  `unit_quantity` decimal(15,4) NOT NULL,
  `gst` varchar(20) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `sma_purchase_items`
--

INSERT INTO `sma_purchase_items` (`id`, `purchase_id`, `transfer_id`, `product_id`, `product_code`, `product_name`, `option_id`, `net_unit_cost`, `quantity`, `warehouse_id`, `item_tax`, `tax_rate_id`, `tax`, `discount`, `item_discount`, `expiry`, `subtotal`, `quantity_balance`, `date`, `status`, `unit_cost`, `real_unit_cost`, `quantity_received`, `supplier_part_no`, `purchase_item_id`, `product_unit_id`, `product_unit_code`, `unit_quantity`, `gst`, `cgst`, `sgst`, `igst`) VALUES
(20, NULL, NULL, 279, '58343328', 'New Test Production Item', NULL, '80.0000', '2.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '160.0000', '0.0000', '2019-02-27', 'received', '80.0000', '80.0000', '2.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(21, NULL, NULL, 34, '80018566', 'Bacolite Handle DF (Sham)', NULL, '5.0000', '5.0000', 1, '0.0000', 1, '0', NULL, NULL, NULL, '25.0000', '0.0000', '2019-02-27', 'received', '5.0000', '5.0000', '5.0000', NULL, NULL, 1, 'Unit', '5.0000', NULL, NULL, NULL, NULL),
(22, NULL, NULL, 1, '60892346', 'Aluminium Fry Pan 16cm', NULL, '5.0000', '5.0000', 1, '0.0000', 1, '0', NULL, NULL, NULL, '25.0000', '101.0000', '2019-02-27', 'received', '5.0000', '5.0000', '5.0000', NULL, NULL, 1, 'Unit', '5.0000', NULL, NULL, NULL, NULL),
(32, NULL, NULL, 277, '15814580', 'Ns Tawa 30cm', NULL, '365.4000', '1.0000', 1, '0.0000', 1, '0', NULL, NULL, NULL, '365.4000', '3.0000', '2019-03-03', 'received', '365.4000', '365.4000', '1.0000', NULL, NULL, 1, 'Unit', '1.0000', NULL, NULL, NULL, NULL),
(33, NULL, NULL, 280, '15366273', 'Tawa ps 30cm', NULL, '373.4000', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '1.0000', '2019-03-03', 'received', '373.4000', '373.4000', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(34, NULL, NULL, 281, '68112135', 'Tawa R 30cm', NULL, '373.4000', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2019-03-03', 'received', '373.4000', '373.4000', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(45, NULL, NULL, 282, '2641678', 'Az', NULL, '5.0000', '-1.0000', 1, '0.0000', 1, '0', NULL, NULL, NULL, '-5.0000', '-1.0000', '2019-03-11', 'received', '5.0000', '5.0000', '-1.0000', NULL, NULL, 1, 'Unit', '-1.0000', NULL, NULL, NULL, NULL),
(46, NULL, NULL, 283, '8016472', 'WOD HANDLE (TAWA)', NULL, '42.0000', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2019-03-12', 'received', '42.0000', '42.0000', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(56, NULL, NULL, 284, '77228734', 'P Tawa 33cm', NULL, '408.9400', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2019-03-13', 'received', '408.9400', '408.9400', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(57, NULL, NULL, 285, '17841168', 'P Tawa 36cm', NULL, '441.9400', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2019-03-13', 'received', '441.9400', '441.9400', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(58, NULL, NULL, 286, '05756370', 'Sticker Pro (tawa 33cm)', NULL, '1.5000', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2019-03-13', 'received', '1.5000', '1.5000', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(59, NULL, NULL, 288, '99102015', 'C Tawa 33cm', NULL, '408.9400', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2019-03-13', 'received', '408.9400', '408.9400', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(60, NULL, NULL, 289, '48097113', 'C Tawa 36cm', NULL, '441.9400', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2019-03-13', 'received', '441.9400', '441.9400', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(61, NULL, NULL, 290, '74597733', 'C PIZZA PLATE 30cm', NULL, '378.9400', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2019-03-13', 'received', '378.9400', '378.9400', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(62, NULL, NULL, 291, '96406072', 'C PIZZA PLATE 36cm', NULL, '390.9400', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2019-03-13', 'received', '390.9400', '390.9400', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(63, NULL, NULL, 292, '13140339', 'C FRY PAN 16CM', NULL, '218.4400', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2019-03-13', 'received', '218.4400', '218.4400', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(64, NULL, NULL, 293, '78778671', 'C FRY PAN 18CM', NULL, '242.4400', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2019-03-13', 'received', '242.4400', '242.4400', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(65, NULL, NULL, 294, '14305010', 'C FRY PAN 20CM', NULL, '257.4400', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2019-03-13', 'received', '257.4400', '257.4400', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(66, NULL, NULL, 295, '93278426', 'C FRY PAN 22CM', NULL, '268.4400', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2019-03-13', 'received', '268.4400', '268.4400', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(67, NULL, NULL, 296, '16391704', 'C FRY PAN 24CM', NULL, '279.4400', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2019-03-13', 'received', '279.4400', '279.4400', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(68, NULL, NULL, 297, '64397194', 'C FRY PAN 26CM', NULL, '318.4400', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2019-03-13', 'received', '318.4400', '318.4400', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(69, NULL, NULL, 298, '66650946', 'C FRY PAN 28CM', NULL, '328.4400', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2019-03-17', 'received', '328.4400', '328.4400', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(70, NULL, NULL, 299, '30430768', 'C FRY PAN 30CM', NULL, '371.4400', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2019-03-17', 'received', '371.4400', '371.4400', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(71, NULL, NULL, 300, '29087445', 'C DEEP  FRY PAN 24CM', NULL, '339.6600', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2019-03-17', 'received', '339.6600', '339.6600', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(72, NULL, NULL, 301, '93700557', 'C DEEP  FRY PAN 26CM', NULL, '362.6600', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2019-03-17', 'received', '362.6600', '362.6600', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(73, NULL, NULL, 302, '19695926', 'C DEEP  FRY PAN 28CM', NULL, '397.6600', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2019-03-17', 'received', '397.6600', '397.6600', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(74, NULL, NULL, 303, '05017832', 'C DEEP  FRY PAN 30CM', NULL, '447.6600', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2019-03-17', 'received', '447.6600', '447.6600', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(75, NULL, NULL, 304, '71582819', 'C SAUCE PAN 16CM', NULL, '253.4400', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2019-03-17', 'received', '253.4400', '253.4400', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(76, NULL, NULL, 305, '22728983', 'C SAUCE PAN 18CM', NULL, '374.3800', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2019-03-19', 'received', '374.3800', '374.3800', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(77, NULL, NULL, 306, '66806754', 'C SAUCE PAN 16CM', NULL, '350.3800', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2019-03-19', 'received', '350.3800', '350.3800', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(78, NULL, NULL, 307, '05939092', 'C SAUCE PAN 20CM', NULL, '456.3800', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2019-03-19', 'received', '456.3800', '456.3800', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(79, NULL, NULL, 308, '14693108', 'Sticker Pro (sauce pan 16cm)', NULL, '1.5000', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2019-03-19', 'received', '1.5000', '1.5000', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(80, NULL, NULL, 309, '89370999', 'Sticker Pro (sauce pan 18cm)', NULL, '1.5000', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2019-03-19', 'received', '1.5000', '1.5000', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(81, NULL, NULL, 310, '37965250', 'Sticker Pro (sauce pan 20cm)', NULL, '1.5000', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2019-03-19', 'received', '1.5000', '1.5000', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(82, NULL, NULL, 311, '31042095', 'C KARAHI 26CM', NULL, '585.3200', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2019-03-19', 'received', '585.3200', '585.3200', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(83, NULL, NULL, 312, '76727555', 'C KARAHI 24CM', NULL, '558.3200', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2019-03-19', 'received', '558.3200', '558.3200', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(84, NULL, NULL, 313, '01611178', 'Print Pro (Karahi 28cm)', NULL, '65.0000', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2019-03-19', 'received', '65.0000', '65.0000', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(85, NULL, NULL, 314, '93627585', 'C KARAHI 28CM', NULL, '853.3200', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2019-03-19', 'received', '853.3200', '853.3200', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(86, NULL, NULL, 315, '19474586', 'C KARAHI 30CM', NULL, '674.3200', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2019-03-19', 'received', '674.3200', '674.3200', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(87, NULL, NULL, 316, '93265496', 'C KARAHI 32CM', NULL, '746.3200', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2019-03-21', 'received', '746.3200', '746.3200', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(88, NULL, NULL, 317, '73974759', 'C KARAHI 34CM', NULL, '830.3200', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2019-03-21', 'received', '830.3200', '830.3200', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(89, NULL, NULL, 318, '02624355', 'C KARAHI 36CM', NULL, '909.3200', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2019-03-21', 'received', '909.3200', '909.3200', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(90, NULL, NULL, 319, '98295433', 'C DECENT SET 15PCS', NULL, '696.3200', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2019-03-21', 'received', '696.3200', '696.3200', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(91, NULL, NULL, 320, '75386693', 'C ECONOMY SET 15PCS', NULL, '2927.1400', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2019-03-21', 'received', '2927.1400', '2927.1400', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(92, NULL, NULL, 321, '77755693', 'C CRYSTAL SET 15PCS', NULL, '3342.1400', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2019-03-21', 'received', '3342.1400', '3342.1400', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(93, NULL, NULL, 322, '61269848', 'C CRESCENT SET 15PCS', NULL, '3518.1400', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2019-03-21', 'received', '3518.1400', '3518.1400', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(94, NULL, NULL, 323, '51426632', 'C PORTA SET 15PCS', NULL, '4558.1400', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2019-03-21', 'received', '4558.1400', '4558.1400', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(95, NULL, NULL, 324, '27749799', 'C CASSEROLE  SET(24,30)', NULL, '2588.1600', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2019-03-21', 'received', '2588.1600', '2588.1600', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(96, NULL, NULL, 325, '38938574', 'C CASSEROLE  SET(30,36)', NULL, '3799.1600', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2019-03-21', 'received', '3799.1600', '3799.1600', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(97, NULL, NULL, 326, '66384711', 'C CRESCENT  SET', NULL, '3518.1400', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2019-03-23', 'received', '3518.1400', '3518.1400', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(98, NULL, NULL, 327, '63941239', 'C CASSEROLE  SET(24,30) GRAY', NULL, '2558.1600', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2019-03-23', 'received', '2558.1600', '2558.1600', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(99, NULL, NULL, 328, '71819601', 'C CASSEROLE  SET(30,36) GRAY', NULL, '3879.1600', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2019-03-23', 'received', '3879.1600', '3879.1600', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(100, NULL, NULL, 329, '17447034', 'C CRESCENT  SET 15PCS GRAY', NULL, '3518.1400', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2019-03-23', 'received', '3518.1400', '3518.1400', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(101, NULL, NULL, 330, '50390437', 'C CRESCENT SET 15PCS K 30CM GRAY', NULL, '3579.1400', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2019-03-23', 'received', '3579.1400', '3579.1400', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(102, NULL, NULL, 331, '76294538', 'C CRYSTAL SET 15PCS GRAY', NULL, '3342.1400', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2019-03-23', 'received', '3342.1400', '3342.1400', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(103, NULL, NULL, 332, '52597636', 'C DECENT SET 15PCS GRAY', NULL, '2973.1400', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2019-03-23', 'received', '2973.1400', '2973.1400', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(104, NULL, NULL, 333, '16922847', 'C DEEP  FRY PAN 24CM GRAY', NULL, '339.6600', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2019-03-23', 'received', '339.6600', '339.6600', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(105, NULL, NULL, 334, '25638224', 'C DEEP  FRY PAN 26CM GRAY', NULL, '362.6600', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2019-03-23', 'received', '362.6600', '362.6600', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(106, NULL, NULL, 335, '30646601', 'C DEEP  FRY PAN 28CM GRAY', NULL, '397.6600', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2019-03-23', 'received', '397.6600', '397.6600', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(107, NULL, NULL, 336, '21540393', 'C DEEP  FRY PAN 30CM GRAY', NULL, '447.6600', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2019-03-23', 'received', '447.6600', '447.6600', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(108, NULL, NULL, 337, '50903000', 'C FRY PAN 16CM GRAY', NULL, '218.6600', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2019-03-23', 'received', '218.6600', '218.6600', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(109, NULL, NULL, 338, '42217561', 'C FRY PAN 18CM GRAY', NULL, '242.6600', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2019-03-23', 'received', '242.6600', '242.6600', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(110, NULL, NULL, 339, '57029780', 'C FRY PAN 20CM GRAY', NULL, '257.6600', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2019-03-23', 'received', '257.6600', '257.6600', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(111, NULL, NULL, 340, '08157857', 'C FRY PAN 22CM GRAY', NULL, '268.6600', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2019-03-23', 'received', '268.6600', '268.6600', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(112, NULL, NULL, 341, '61291323', 'C FRY PAN 24CM GRAY', NULL, '279.6600', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2019-03-23', 'received', '279.6600', '279.6600', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(113, NULL, NULL, 342, '52537567', 'C FRY PAN 26CM GRAY', NULL, '318.6600', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2019-03-23', 'received', '318.6600', '318.6600', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(114, NULL, NULL, 343, '61646560', 'C FRY PAN 28CM GRAY', NULL, '328.6600', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2019-03-23', 'received', '328.6600', '328.6600', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(115, NULL, NULL, 344, '35574215', 'C FRY PAN 30CM GRAY', NULL, '371.6600', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2019-03-23', 'received', '371.6600', '371.6600', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(116, NULL, NULL, 345, '36630636', 'C KARAHI 24CM GRAY', NULL, '562.3200', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2019-03-23', 'received', '562.3200', '562.3200', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(117, NULL, NULL, 346, '90995277', 'C KARAHI 36CM GRAY', NULL, '909.3200', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2019-03-23', 'received', '909.3200', '909.3200', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(118, NULL, NULL, 347, '36783567', 'C KARAHI 26CM GRAY', NULL, '589.3200', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2019-03-23', 'received', '589.3200', '589.3200', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(119, NULL, NULL, 348, '90176479', 'C KARAHI 28CM GRAY', NULL, '623.3200', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2019-03-23', 'received', '623.3200', '623.3200', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(120, NULL, NULL, 349, '22495433', 'C KARAHI 30CM GRAY', NULL, '704.3200', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2019-03-23', 'received', '704.3200', '704.3200', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(121, NULL, NULL, 350, '69904722', 'C KARAHI 32CM GRAY', NULL, '746.3200', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2019-03-23', 'received', '746.3200', '746.3200', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(122, NULL, NULL, 351, '39964228', 'C KARAHI 34CM GRAY', NULL, '830.3200', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2019-03-23', 'received', '830.3200', '830.3200', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(123, NULL, NULL, 352, '26300549', 'C PIZZA PLATE 30cm GRAY', NULL, '390.9400', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2019-03-23', 'received', '390.9400', '390.9400', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(124, NULL, NULL, 353, '73837373', 'C PIZZA PLATE 36cm GRAY', NULL, '390.9400', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2019-03-23', 'received', '390.9400', '390.9400', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(125, NULL, NULL, 354, '59107965', 'C PORTA SET 18PCS GRAY', NULL, '4609.1400', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2019-03-23', 'received', '4609.1400', '4609.1400', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(126, NULL, NULL, 355, '05155200', 'C ECONOMY SET 15PCS GRAY', NULL, '3147.1400', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2019-03-23', 'received', '3147.1400', '3147.1400', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(127, NULL, NULL, 356, '59548913', 'C SAUCE PAN 16CM GRAY', NULL, '402.8800', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2019-03-23', 'received', '402.8800', '402.8800', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(128, NULL, NULL, 357, '63083762', 'C SAUCE PAN 18CM GRAY', NULL, '417.0400', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2019-03-23', 'received', '417.0400', '417.0400', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(129, NULL, NULL, 358, '29931441', 'C SAUCE PAN 20CM GRAY', NULL, '461.8800', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2019-03-23', 'received', '461.8800', '461.8800', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(130, NULL, NULL, 359, '30432301', 'C CASSEROLE  SET(24,30) MEHRON', NULL, '2558.1600', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2019-03-23', 'received', '2558.1600', '2558.1600', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(131, NULL, NULL, 360, '53732130', 'C CASSEROLE  SET(30,36) MEHRON', NULL, '3879.1600', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2019-03-23', 'received', '3879.1600', '3879.1600', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(132, NULL, NULL, 361, '06454210', 'C CRESCENT  SET 15PCS MEHRON', NULL, '3530.1400', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2019-03-23', 'received', '3530.1400', '3530.1400', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(133, NULL, NULL, 362, '88000110', 'C CRESCENT SET 15PCS K 30CM MEHRON', NULL, '3579.1400', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2019-03-23', 'received', '3579.1400', '3579.1400', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(134, NULL, NULL, 363, '22175753', 'C CRYSTAL SET 15PCS MEHRON', NULL, '3342.1400', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2019-03-23', 'received', '3342.1400', '3342.1400', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(135, NULL, NULL, 364, '05562696', 'C CASSEROLE  SET(24,30) BLUE', NULL, '2560.1600', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2019-03-25', 'received', '2560.1600', '2560.1600', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(136, NULL, NULL, 365, '62137649', 'C CASSEROLE  SET(30,36) BLUE', NULL, '3879.1600', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2019-03-25', 'received', '3879.1600', '3879.1600', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(137, NULL, NULL, 366, '11821485', 'C CRESCENT  SET 15PCS BLUE', NULL, '3518.1400', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2019-03-25', 'received', '3518.1400', '3518.1400', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(138, NULL, NULL, 367, '14572418', 'C CRESCENT SET 15PCS K 30CM BLUE', NULL, '3579.1400', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2019-03-25', 'received', '3579.1400', '3579.1400', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(139, NULL, NULL, 368, '81601583', 'C CRYSTAL SET 15PCS BLUE', NULL, '3342.1400', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2019-03-25', 'received', '3342.1400', '3342.1400', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(140, NULL, NULL, 369, '40131396', 'C DECENT SET 15PCS MEHRON', NULL, '2973.1400', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2019-03-25', 'received', '2973.1400', '2973.1400', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(141, NULL, NULL, 370, '55722235', 'C DECENT SET 15PCS BLUE', NULL, '2973.1400', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2019-03-25', 'received', '2973.1400', '2973.1400', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(142, NULL, NULL, 371, '08323683', 'C ECONOMY SET 15PCS BLUE', NULL, '3147.1400', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2019-03-26', 'received', '3147.1400', '3147.1400', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(143, NULL, NULL, 372, '00842273', 'C ECONOMY SET 15PCS MEHRON', NULL, '3147.1400', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2019-03-26', 'received', '3147.1400', '3147.1400', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(144, NULL, NULL, 373, '99423532', 'P CASSEROLE  SET(24,30) BLACK', NULL, '2560.1600', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2019-03-26', 'received', '2560.1600', '2560.1600', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(145, NULL, NULL, 374, '53638402', 'P CASSEROLE  SET(24,30) BLUE', NULL, '2560.1600', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2019-03-26', 'received', '2560.1600', '2560.1600', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(146, NULL, NULL, 375, '98728706', 'P CASSEROLE  SET(24,30) GRAY', NULL, '2560.1600', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2019-03-26', 'received', '2560.1600', '2560.1600', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(147, NULL, NULL, 376, '96706261', 'P CASSEROLE  SET(24,30) MEHRON', NULL, '2560.1600', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2019-03-26', 'received', '2560.1600', '2560.1600', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(148, NULL, NULL, 377, '65680125', 'P CASSEROLE  SET(30,36) BLACK', NULL, '3879.1600', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2019-03-26', 'received', '3879.1600', '3879.1600', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(149, NULL, NULL, 378, '58696807', 'P CASSEROLE  SET(30,36) BLUE', NULL, '3879.1600', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2019-03-26', 'received', '3879.1600', '3879.1600', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(150, NULL, NULL, 379, '91654774', 'P CASSEROLE  SET(30,36) GRAY', NULL, '3879.1600', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2019-03-26', 'received', '3879.1600', '3879.1600', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(151, NULL, NULL, 380, '93186032', 'P CASSEROLE  SET(30,36) MEHRON', NULL, '3879.1600', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2019-03-26', 'received', '3879.1600', '3879.1600', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(152, NULL, NULL, 381, '50088465', 'P CRESCENT  SET 15PCS BLACK', NULL, '3518.1400', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2019-03-26', 'received', '3518.1400', '3518.1400', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(153, NULL, NULL, 382, '89079599', 'P CRESCENT  SET 15PCS BLUE', NULL, '3518.1400', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2019-03-26', 'received', '3518.1400', '3518.1400', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(154, NULL, NULL, 383, '29470747', 'P CRESCENT  SET 15PCS GRAY', NULL, '3518.1400', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2019-03-26', 'received', '3518.1400', '3518.1400', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(155, NULL, NULL, 384, '19920856', 'P CRESCENT  SET 15PCS MEHRON', NULL, '3518.1400', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2019-03-26', 'received', '3518.1400', '3518.1400', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(156, NULL, NULL, 385, '31191505', 'P CRYSTAL SET 15PCS BLACK', NULL, '3342.1400', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2019-03-26', 'received', '3342.1400', '3342.1400', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(157, NULL, NULL, 386, '43609821', 'P CRYSTAL SET 15PCS BLUE', NULL, '3342.1400', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2019-03-26', 'received', '3342.1400', '3342.1400', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(158, NULL, NULL, 387, '87094380', 'P CRYSTAL SET 15PCS GRAY', NULL, '3342.1400', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2019-03-26', 'received', '3342.1400', '3342.1400', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(159, NULL, NULL, 388, '25366669', 'P CRYSTAL SET 15PCS MEHRON', NULL, '3342.1400', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2019-03-26', 'received', '3342.1400', '3342.1400', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(160, NULL, NULL, 389, '90927365', 'P DECENT SET 15PCS BLACK', NULL, '2973.1400', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2019-03-26', 'received', '2973.1400', '2973.1400', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(161, NULL, NULL, 390, '54047970', 'P DECENT SET 15PCS BLUE', NULL, '2973.1400', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2019-03-26', 'received', '2973.1400', '2973.1400', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(162, NULL, NULL, 391, '93461987', 'P DECENT SET 15PCS GRAY', NULL, '2973.1400', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2019-03-26', 'received', '2973.1400', '2973.1400', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(163, NULL, NULL, 392, '12399457', 'P DECENT SET 15PCS MEHRON', NULL, '2973.1400', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2019-03-26', 'received', '2973.1400', '2973.1400', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(164, NULL, NULL, 393, '65017293', 'P DEEP  FRY PAN 24CM BLACK', NULL, '339.6600', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2019-03-28', 'received', '339.6600', '339.6600', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(165, NULL, NULL, 394, '62690892', 'P DEEP  FRY PAN 24CM GRAY', NULL, '339.6600', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2019-03-28', 'received', '339.6600', '339.6600', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(166, NULL, NULL, 395, '09777141', 'P DEEP  FRY PAN 26CM BLACK', NULL, '362.6600', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2019-03-28', 'received', '362.6600', '362.6600', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(167, NULL, NULL, 396, '48835798', 'P DEEP  FRY PAN 26CM GRAY', NULL, '362.6600', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2019-03-28', 'received', '362.6600', '362.6600', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(168, NULL, NULL, 397, '74593209', 'P DEEP  FRY PAN 28CM BLACK', NULL, '397.6600', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2019-03-28', 'received', '397.6600', '397.6600', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(169, NULL, NULL, 398, '15843040', 'P DEEP  FRY PAN 28CM GRAY', NULL, '397.6600', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2019-03-28', 'received', '397.6600', '397.6600', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(170, NULL, NULL, 399, '82001848', 'P DEEP  FRY PAN 30CM BLACK', NULL, '447.6600', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2019-03-28', 'received', '447.6600', '447.6600', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(171, NULL, NULL, 400, '55736758', 'P DEEP  FRY PAN 30CM GRAY', NULL, '447.6600', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2019-03-28', 'received', '447.6600', '447.6600', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(172, NULL, NULL, 401, '19909614', 'Sticker prestige', NULL, '1.1000', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2019-03-28', 'received', '1.1000', '1.1000', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(173, NULL, NULL, 402, '05482318', 'Sticker prestige 18cm', NULL, '1.1000', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2019-03-28', 'received', '1.1000', '1.1000', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(174, NULL, NULL, 403, '70848557', 'Sticker prestige 20cm', NULL, '1.1000', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2019-03-28', 'received', '1.1000', '1.1000', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(175, NULL, NULL, 404, '25500128', 'Sticker prestige fry pan 22cm', NULL, '1.1000', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2019-03-28', 'received', '1.1000', '1.1000', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(176, NULL, NULL, 405, '35608312', 'Sticker prestige fry pan 24cm', NULL, '1.1000', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2019-03-28', 'received', '1.1000', '1.1000', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(177, NULL, NULL, 406, '46353205', 'Sticker prestige fry pan 26cm', NULL, '3.0000', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2019-03-28', 'received', '3.0000', '3.0000', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(178, NULL, NULL, 407, '68320929', 'Sticker prestige fry pan 28cm', NULL, '3.0000', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2019-03-28', 'received', '3.0000', '3.0000', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(179, NULL, NULL, 408, '81630297', 'Sticker prestige fry pan 30cm', NULL, '3.0000', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2019-03-28', 'received', '3.0000', '3.0000', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(180, NULL, NULL, 409, '41728481', 'Sticker prestige 16 pcs', NULL, '3.0000', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2019-03-28', 'received', '3.0000', '3.0000', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(181, NULL, NULL, 410, '22530875', 'Sticker prestige tawa 30cm', NULL, '3.0000', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2019-03-28', 'received', '3.0000', '3.0000', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(182, NULL, NULL, 411, '08227977', 'Sticker prestige tawa 33cm', NULL, '10.0000', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2019-03-28', 'received', '10.0000', '10.0000', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(183, NULL, NULL, 412, '01401189', 'Sticker prestige tawa 35cm', NULL, '10.0000', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2019-03-28', 'received', '10.0000', '10.0000', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(184, NULL, NULL, 413, '56550047', 'Sticker prestige pizza plate 30cm', NULL, '10.0000', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2019-03-28', 'received', '10.0000', '10.0000', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(185, NULL, NULL, 414, '08604537', 'Sticker prestige pizza plate 35cm', NULL, '10.0000', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2019-03-28', 'received', '10.0000', '10.0000', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(188, NULL, NULL, 415, '52960879', 'Aluminium Fry Pan 16cm', NULL, '115.0000', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2019-09-17', 'received', '115.0000', '115.0000', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(189, NULL, NULL, 416, '26947175', 'Aluminium Fry Pan 14cm', NULL, '110.0000', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2019-09-17', 'received', '110.0000', '110.0000', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(190, NULL, NULL, 417, '48353179', 'Aluminium Tawa 30cm (7g)', NULL, '260.0000', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2019-09-17', 'received', '260.0000', '260.0000', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(194, NULL, NULL, 418, '54778728', 'Aluminium Handi 20cm ', NULL, '150.0000', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2019-09-18', 'received', '150.0000', '150.0000', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(196, NULL, NULL, 2, '43780468', 'Aluminium Fry Pan 18cm', NULL, '116.0000', '-10.0000', 1, '0.0000', 1, '0', NULL, NULL, NULL, '-1160.0000', '0.0000', '2019-09-22', 'received', '116.0000', '116.0000', '-10.0000', NULL, NULL, 1, 'Unit', '-10.0000', NULL, NULL, NULL, NULL),
(207, NULL, NULL, 25, '52742871', 'Aluminium Tawa 36cm', NULL, '323.0000', '1.0000', 1, '0.0000', 1, '0', NULL, NULL, NULL, '323.0000', '0.0000', '2019-10-16', 'received', '323.0000', '323.0000', '1.0000', NULL, NULL, 1, 'Unit', '1.0000', NULL, NULL, NULL, NULL),
(214, NULL, NULL, 421, '81813340', 'NS PAINT(BASE CODE)', NULL, '25.0000', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2019-12-23', 'received', '25.0000', '25.0000', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(215, NULL, NULL, 422, '15298737', 'NS PAINT(TOP CODE)', NULL, '25.0000', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2019-12-23', 'received', '25.0000', '25.0000', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(216, NULL, NULL, 424, '01801562', 'Aluminium Fry Pan 22cm (16g)', NULL, '205.0000', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2020-02-20', 'received', '205.0000', '205.0000', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(217, NULL, NULL, 426, '22037468', 'C TAWA 30CM W', NULL, '392.0000', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2020-02-20', 'received', '392.0000', '392.0000', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(218, NULL, NULL, 428, '62220650', 'C TAWA 33CM', NULL, '456.5000', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '1.0000', '2020-03-03', 'received', '456.5000', '456.5000', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(219, NULL, NULL, 429, '020585190', 'Aluminium Pizza Plate 33cm', NULL, '260.0000', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2022-08-29', 'received', '260.0000', '260.0000', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(244, NULL, NULL, 425, '12447802', 'C TAWA 30CM', NULL, '418.5000', '1.0000', 1, '0.0000', 1, '0', NULL, NULL, NULL, '418.5000', '1.0000', '2022-09-06', 'received', '418.5000', '418.5000', '1.0000', NULL, NULL, 1, 'Unit', '1.0000', NULL, NULL, NULL, NULL),
(305, NULL, NULL, 430, '81813341', 'NS PAINT(BASE CODE)1', NULL, '25.0000', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2022-10-26', 'received', '25.0000', '25.0000', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(306, NULL, NULL, 430, '47305166', 'WIGHT DOT PAINT', NULL, '6.0000', '1.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '6.0000', '1.0000', '2022-10-27', 'received', '6.0000', '6.0000', '1.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(324, NULL, NULL, 431, '00865265', 'Bacolite Handle (Sham) smal', NULL, '43.0000', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2022-10-29', 'received', '43.0000', '43.0000', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(330, NULL, NULL, 432, '05636041', 'Bacolite Handle Tawa mold', NULL, '45.0000', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2022-10-29', 'received', '45.0000', '45.0000', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(331, NULL, NULL, 433, '66504381', 'Bacolite Handle Tawa ptri', NULL, '50.0000', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2022-10-29', 'received', '50.0000', '50.0000', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(337, NULL, NULL, 434, '03423613', 'STICKER PRESTIGE', NULL, '3.0000', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2022-10-29', 'received', '3.0000', '3.0000', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(338, NULL, NULL, 435, '48275821', 'Fitting (Handi Wok) S.P', NULL, '7.0000', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2022-10-29', 'received', '7.0000', '7.0000', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(342, NULL, NULL, 437, '75224323', 'CUT PIECE', NULL, '2.0000', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2022-10-31', 'received', '2.0000', '2.0000', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(343, NULL, NULL, 438, '22777622', 'Master Packing Box TAWA 30CM', NULL, '11.5000', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2022-10-31', 'received', '11.5000', '11.5000', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(344, NULL, NULL, 439, '16005744', 'Master Packing Box PIZZA 30CM', NULL, '13.7000', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2022-10-31', 'received', '13.7000', '13.7000', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(345, NULL, NULL, 440, '91905728', 'Master Packing Box PIZZA 33CM', NULL, '17.0000', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2022-10-31', 'received', '17.0000', '17.0000', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(346, NULL, NULL, 441, '89686105', 'Master Packing Box PIZZA 36CM', NULL, '17.0000', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2022-10-31', 'received', '17.0000', '17.0000', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(347, NULL, NULL, 442, '97393021', 'JACKET Pro (PIZZA 30cm)', NULL, '12.2000', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2022-10-31', 'received', '12.2000', '12.2000', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(348, NULL, NULL, 443, '65409957', 'JACKET Pro (PIZZA 33cm)', NULL, '12.2000', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2022-10-31', 'received', '12.2000', '12.2000', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(349, NULL, NULL, 444, '49280632', 'JACKET Pro (PIZZA 36cm)', NULL, '12.2000', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2022-10-31', 'received', '12.2000', '12.2000', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(350, NULL, NULL, 445, '86393311', 'JACKET ANY (PIZZA 30cm)', NULL, '12.2000', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2022-10-31', 'received', '12.2000', '12.2000', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(351, NULL, NULL, 446, '54434666', 'JACKET ANY (PIZZA 33cm)', NULL, '12.2000', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2022-10-31', 'received', '12.2000', '12.2000', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(352, NULL, NULL, 447, '43084663', 'JACKET ANY (PIZZA 36cm)', NULL, '12.2000', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2022-10-31', 'received', '12.2000', '12.2000', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(353, NULL, NULL, 448, '96291163', 'JACKET ANY (tawa 30cm)', NULL, '12.2000', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2022-10-31', 'received', '12.2000', '12.2000', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(354, NULL, NULL, 449, '32796720', 'JACKET ANY (tawa 33cm)', NULL, '12.2000', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2022-10-31', 'received', '12.2000', '12.2000', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(355, NULL, NULL, 450, '26189369', 'JACKET ANY (tawa 35cm)', NULL, '12.2000', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2022-10-31', 'received', '12.2000', '12.2000', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(356, NULL, NULL, 451, '57061381', 'JACKET ANY (PIZZA 30cm) MARBIL', NULL, '12.2000', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2022-10-31', 'received', '12.2000', '12.2000', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(357, NULL, NULL, 452, '59301655', 'JACKET ANY (PIZZA 33cm) MARBIL', NULL, '12.2000', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2022-10-31', 'received', '12.2000', '12.2000', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(358, NULL, NULL, 453, '45834456', 'JACKET ANY (PIZZA 36cm) MARBIL', NULL, '12.2000', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2022-10-31', 'received', '12.2000', '12.2000', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(359, NULL, NULL, 454, '71792218', 'JACKET ANY (tawa 30cm) MARBIL', NULL, '12.2000', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2022-10-31', 'received', '12.2000', '12.2000', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(360, NULL, NULL, 455, '07361580', 'JACKET ANY (tawa 35cm) MARBIL', NULL, '12.2000', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2022-10-31', 'received', '12.2000', '12.2000', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(361, NULL, NULL, 456, '34408825', 'JACKET ANY (tawa 33cm) MARBIL', NULL, '12.2000', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2022-10-31', 'received', '12.2000', '12.2000', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(362, NULL, NULL, 457, '88596429', 'Jacket ANY 16cm', NULL, '8.7000', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2022-10-31', 'received', '8.7000', '8.7000', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(363, NULL, NULL, 458, '64510395', 'Jacket ANY 14cm', NULL, '8.7000', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2022-10-31', 'received', '8.7000', '8.7000', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(364, NULL, NULL, 459, '75329860', 'Jacket ANY 12cm', NULL, '8.7000', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2022-10-31', 'received', '8.7000', '8.7000', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(365, NULL, NULL, 460, '87191037', 'STICKER ANY ', NULL, '3.4500', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2022-10-31', 'received', '3.4500', '3.4500', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(366, NULL, NULL, 461, '92930835', 'Jacket ANY 12cm MARBIL', NULL, '8.7000', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2022-10-31', 'received', '8.7000', '8.7000', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(367, NULL, NULL, 462, '57208982', 'Jacket ANY 14cm MARBIL', NULL, '8.7000', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2022-10-31', 'received', '8.7000', '8.7000', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL);
INSERT INTO `sma_purchase_items` (`id`, `purchase_id`, `transfer_id`, `product_id`, `product_code`, `product_name`, `option_id`, `net_unit_cost`, `quantity`, `warehouse_id`, `item_tax`, `tax_rate_id`, `tax`, `discount`, `item_discount`, `expiry`, `subtotal`, `quantity_balance`, `date`, `status`, `unit_cost`, `real_unit_cost`, `quantity_received`, `supplier_part_no`, `purchase_item_id`, `product_unit_id`, `product_unit_code`, `unit_quantity`, `gst`, `cgst`, `sgst`, `igst`) VALUES
(368, NULL, NULL, 463, '59654932', 'Jacket ANY 16cm MARBIL', NULL, '8.7000', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2022-10-31', 'received', '8.7000', '8.7000', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(369, NULL, NULL, 464, '44650408', 'Jacket ANY 18cm MARBIL', NULL, '8.7000', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2022-10-31', 'received', '8.7000', '8.7000', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(370, NULL, NULL, 465, '04174806', 'Jacket ANY 22cm MARBIL', NULL, '8.7000', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2022-10-31', 'received', '8.7000', '8.7000', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(371, NULL, NULL, 466, '02068709', 'Jacket ANY 20cm MARBIL', NULL, '8.7000', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2022-10-31', 'received', '8.7000', '8.7000', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(372, NULL, NULL, 467, '34637426', 'Jacket ANY 24cm MARBIL', NULL, '8.7000', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2022-10-31', 'received', '8.7000', '8.7000', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(373, NULL, NULL, 468, '82227935', 'Jacket ANY 26cm MARBIL', NULL, '8.7000', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2022-10-31', 'received', '8.7000', '8.7000', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(374, NULL, NULL, 469, '28176910', 'Jacket ANY 28cm MARBIL', NULL, '8.7000', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2022-10-31', 'received', '8.7000', '8.7000', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(375, NULL, NULL, 470, '34071358', 'Jacket ANY 30cm MARBIL', NULL, '8.7000', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2022-10-31', 'received', '8.7000', '8.7000', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(376, NULL, NULL, 471, '41639144', 'Jacket ANY 26cm ', NULL, '8.7000', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2022-10-31', 'received', '8.7000', '8.7000', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(377, NULL, NULL, 472, '29496275', 'Jacket ANY 28cm ', NULL, '8.7000', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2022-10-31', 'received', '8.7000', '8.7000', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(378, NULL, NULL, 473, '13740794', 'Jacket ANY 30cm ', NULL, '8.7000', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2022-10-31', 'received', '8.7000', '8.7000', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(379, NULL, NULL, 474, '44796357', 'Jacket ANY 12cm FORGING', NULL, '8.7000', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2022-10-31', 'received', '8.7000', '8.7000', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(380, NULL, NULL, 475, '11142039', 'Jacket ANY 14cm FORGING', NULL, '8.7000', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2022-10-31', 'received', '8.7000', '8.7000', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(381, NULL, NULL, 476, '09640558', 'Jacket ANY 16cm FORGING', NULL, '8.7000', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2022-10-31', 'received', '8.7000', '8.7000', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(382, NULL, NULL, 477, '55098889', 'Jacket ANY 18cm FORGING', NULL, '8.7000', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2022-10-31', 'received', '8.7000', '8.7000', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(383, NULL, NULL, 478, '79412747', 'Jacket ANY 20cm FORGING', NULL, '8.7000', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2022-10-31', 'received', '8.7000', '8.7000', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(384, NULL, NULL, 479, '30479362', 'Jacket ANY 22cm FORGING', NULL, '8.7000', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2022-10-31', 'received', '8.7000', '8.7000', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(385, NULL, NULL, 480, '45207689', 'Jacket ANY 24cm FORGING', NULL, '8.7000', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2022-10-31', 'received', '8.7000', '8.7000', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(386, NULL, NULL, 481, '96831253', 'Jacket ANY 26cm FORGING', NULL, '8.7000', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2022-10-31', 'received', '8.7000', '8.7000', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(387, NULL, NULL, 482, '92494805', 'Jacket ANY 28cm FORGING', NULL, '8.7000', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2022-10-31', 'received', '8.7000', '8.7000', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(388, NULL, NULL, 483, '33329860', 'Jacket ANY 30cm FORGING', NULL, '8.7000', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2022-10-31', 'received', '8.7000', '8.7000', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(389, NULL, NULL, 484, '15787029', 'JACKET Pro (PIZZA 30cm) MARBIL', NULL, '12.2000', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2022-10-31', 'received', '12.2000', '12.2000', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(390, NULL, NULL, 485, '62689598', 'JACKET Pro (PIZZA 33cm) MARBIL', NULL, '12.2000', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2022-10-31', 'received', '12.2000', '12.2000', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(391, NULL, NULL, 486, '96126374', 'JACKET Pro (PIZZA 36cm) MARBIL', NULL, '12.2000', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2022-10-31', 'received', '12.2000', '12.2000', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(392, NULL, NULL, 487, '40520517', 'JACKET Pro (tawa 30cm) MARBIL', NULL, '12.2000', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2022-10-31', 'received', '12.2000', '12.2000', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(393, NULL, NULL, 488, '17336011', 'JACKET Pro (tawa 33cm) MARBIL', NULL, '12.2000', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2022-10-31', 'received', '12.2000', '12.2000', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(394, NULL, NULL, 489, '60480157', 'JACKET Pro (tawa 35cm) MARBIL', NULL, '12.2000', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2022-10-31', 'received', '12.2000', '12.2000', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(395, NULL, NULL, 490, '86354932', 'Master Packing Box FRY PAN 30CM', NULL, '13.7000', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2022-10-31', 'received', '13.7000', '13.7000', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(396, NULL, NULL, 491, '43893307', 'Master Packing Box FRY PAN 28CM', NULL, '98.0000', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2022-10-31', 'received', '98.0000', '98.0000', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(397, NULL, NULL, 492, '07394503', 'Master Packing Box FRY PAN 26CM', NULL, '94.0000', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2022-10-31', 'received', '94.0000', '94.0000', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(398, NULL, NULL, 493, '73844710', 'Master Packing Box FRY PAN 24CM', NULL, '80.0000', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2022-10-31', 'received', '80.0000', '80.0000', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(399, NULL, NULL, 494, '60764701', 'Master Packing Box FRY PAN 22CM', NULL, '77.0000', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2022-10-31', 'received', '77.0000', '77.0000', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(400, NULL, NULL, 495, '79369605', 'Master Packing Box FRY PAN 20CM', NULL, '73.0000', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2022-10-31', 'received', '73.0000', '73.0000', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(401, NULL, NULL, 496, '49914643', 'Master Packing Box FRY PAN 18CM', NULL, '69.0000', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2022-10-31', 'received', '69.0000', '69.0000', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(402, NULL, NULL, 497, '88536676', 'Master Packing Box FRY PAN 16CM', NULL, '65.0000', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2022-10-31', 'received', '65.0000', '65.0000', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(403, NULL, NULL, 498, '65061502', 'Master Packing Box FRY PAN 14CM', NULL, '61.0000', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2022-10-31', 'received', '61.0000', '61.0000', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(404, NULL, NULL, 499, '72503467', 'Master Packing Box FRY PAN 12CM', NULL, '57.0000', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2022-10-31', 'received', '57.0000', '57.0000', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(405, NULL, NULL, 501, '01055978', 'Aluminium Pizza Plate 33cm 10G', NULL, '528.0000', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2022-11-16', 'received', '528.0000', '528.0000', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(406, NULL, NULL, 502, '56026461', 'Aluminium Pizza Plate 36cm 10G', NULL, '643.0000', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2022-11-16', 'received', '643.0000', '643.0000', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(407, NULL, NULL, 503, '42741252', 'Aluminium Tawa 37cm', NULL, '660.0000', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2022-11-16', 'received', '660.0000', '660.0000', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(408, NULL, NULL, 504, '92785499', 'Bacolite Handle Tawa mold IMTIAZ', NULL, '45.0000', '83.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '3735.0000', '83.0000', '2022-11-16', 'received', '45.0000', '45.0000', '83.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(409, NULL, NULL, 507, '37432426', 'N TAWA 33CM ELEGENT', NULL, '721.7000', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2022-11-16', 'received', '721.7000', '721.7000', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(410, NULL, NULL, 508, '46699632', 'N PIZZA PLATE 30CM ELEGENT', NULL, '667.1000', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2022-11-16', 'received', '667.1000', '667.1000', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(411, NULL, NULL, 509, '12908610', 'Bacolite Handle PIZZA  mold', NULL, '60.0000', '83.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '4980.0000', '83.0000', '2022-11-16', 'received', '60.0000', '60.0000', '83.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(412, NULL, NULL, 510, '94870819', 'Bacolite Handle PIZZA ptri', NULL, '35.0000', '83.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '2905.0000', '83.0000', '2022-11-16', 'received', '35.0000', '35.0000', '83.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(413, NULL, NULL, 511, '48189000', 'N PIZZA OLATE 30CM ELEGENT', NULL, '664.9000', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2022-11-16', 'received', '664.9000', '664.9000', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(414, NULL, NULL, 512, '40696809', 'N PIZZA PLATE 33CM ELEGENT', NULL, '722.4000', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2022-11-16', 'received', '722.4000', '722.4000', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(415, NULL, NULL, 513, '65134908', 'STICKER  PRO', NULL, '3.5000', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2022-11-17', 'received', '3.5000', '3.5000', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(416, NULL, NULL, 514, '74513950', 'STIKR Pro (tawa 30cm)', NULL, '3.5000', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2022-11-17', 'received', '3.5000', '3.5000', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(417, NULL, NULL, 515, '76737347', 'STIKR Pro (tawa 33cm)', NULL, '3.5000', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2022-11-17', 'received', '3.5000', '3.5000', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(418, NULL, NULL, 516, '13653507', 'STIKR Pro (tawa 35cm)', NULL, '3.5000', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2022-11-17', 'received', '3.5000', '3.5000', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(419, NULL, NULL, 517, '81454911', 'STIKR Pro (tawa 37cm)', NULL, '3.5000', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2022-11-17', 'received', '3.5000', '3.5000', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(420, NULL, NULL, 518, '60842081', 'STIKR Pro (PIZZA 30cm)', NULL, '3.5000', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2022-11-17', 'received', '3.5000', '3.5000', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(421, NULL, NULL, 519, '89245857', 'STIKR Pro (PIZZA 33cm)', NULL, '3.5000', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2022-11-17', 'received', '3.5000', '3.5000', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(422, NULL, NULL, 520, '16867589', 'STIKR Pro (PIZZA 36cm)', NULL, '3.5000', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2022-11-17', 'received', '3.5000', '3.5000', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(423, NULL, NULL, 521, '14255208', 'N TAWA 30CM PRO', NULL, '643.4000', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2022-11-17', 'received', '643.4000', '643.4000', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(424, NULL, NULL, 522, '19283005', 'N TAWA 33CM PRO', NULL, '725.2000', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2022-11-17', 'received', '725.2000', '725.2000', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(425, NULL, NULL, 523, '28556192', 'N TAWA 33CM PRO', NULL, '725.2000', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2022-11-17', 'received', '725.2000', '725.2000', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(426, NULL, NULL, 524, '43785335', 'N TAWA 35CM PRO', NULL, '786.9000', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2022-11-17', 'received', '786.9000', '786.9000', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(427, NULL, NULL, 525, '10096254', 'N PIZZA PLATE 30CM PRO', NULL, '667.1000', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2022-11-17', 'received', '667.1000', '667.1000', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(428, NULL, NULL, 526, '03976837', 'N PIZZA PLATE 33CM PRO', NULL, '629.9000', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2022-11-17', 'received', '629.9000', '629.9000', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(429, NULL, NULL, 527, '65730040', 'N PIZZA PLATE 30CM PRO', NULL, '629.9000', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2022-11-17', 'received', '629.9000', '629.9000', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(430, NULL, NULL, 528, '34688327', 'N PIZZA PLATE 36CM PRO', NULL, '661.9000', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2022-11-17', 'received', '661.9000', '661.9000', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(431, NULL, NULL, 529, '20372462', 'N TAWA 30CM PRESTIGE', NULL, '652.1000', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2022-11-17', 'received', '652.1000', '652.1000', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(432, NULL, NULL, 530, '40111037', 'N TAWA 33CM PRESTIGE', NULL, '733.9000', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2022-11-17', 'received', '733.9000', '733.9000', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(433, NULL, NULL, 531, '34996531', 'N TAWA 35CM PRESTIGE', NULL, '795.6000', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2022-11-17', 'received', '795.6000', '795.6000', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(434, NULL, NULL, 532, '30665774', 'N PIZZA PLATE 30CM PRO', NULL, '655.1000', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2022-11-17', 'received', '655.1000', '655.1000', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(435, NULL, NULL, 534, '23372541', 'Ribit (Tawa)', NULL, '0.6200', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2022-11-17', 'received', '0.6200', '0.6200', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(436, NULL, NULL, 535, '37406408', 'N CRESCENT SET', NULL, '6120.8800', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2022-11-17', 'received', '6120.8800', '6120.8800', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(437, NULL, NULL, 536, '50720599', 'N PORTA SET', NULL, '7662.8800', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2022-11-17', 'received', '7662.8800', '7662.8800', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(438, NULL, NULL, 537, '41463124', 'PRINT PORTA SET', NULL, '450.0000', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2022-11-17', 'received', '450.0000', '450.0000', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(439, NULL, NULL, 538, '66088931', 'N PORTA SET', NULL, '7247.8800', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2022-11-17', 'received', '7247.8800', '7247.8800', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(440, NULL, NULL, 539, '41281013', 'N FRY PAN 14CM PRO', NULL, '296.3000', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2022-11-17', 'received', '296.3000', '296.3000', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(441, NULL, NULL, 540, '49345281', 'N FRY PAN 16CM PRO', NULL, '322.2200', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2022-11-19', 'received', '322.2200', '322.2200', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(442, NULL, NULL, 541, '73387527', 'N FRY PAN 18CM PRO', NULL, '364.7200', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2022-11-19', 'received', '364.7200', '364.7200', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(443, NULL, NULL, 542, '79088670', 'N FRY PAN 20CM PRO', NULL, '390.0200', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2022-11-19', 'received', '390.0200', '390.0200', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(444, NULL, NULL, 543, '93881120', 'N FRY PAN 22CM PRO', NULL, '432.4200', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2022-11-19', 'received', '432.4200', '432.4200', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(445, NULL, NULL, 544, '51701192', 'N FRY PAN 24CM PRO', NULL, '470.7200', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2022-11-19', 'received', '470.7200', '470.7200', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(446, NULL, NULL, 545, '61028584', 'N FRY PAN 26CM PRO', NULL, '520.1200', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2022-11-19', 'received', '520.1200', '520.1200', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(447, NULL, NULL, 546, '72358214', 'N FRY PAN 28CM PRO', NULL, '555.5200', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2022-11-19', 'received', '555.5200', '555.5200', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(448, NULL, NULL, 547, '27457004', 'N FRY PAN 30CM PRO', NULL, '508.7200', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2022-11-19', 'received', '508.7200', '508.7200', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(449, NULL, NULL, 548, '40341141', 'N DECENT SET', NULL, '5383.6400', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2022-11-19', 'received', '5383.6400', '5383.6400', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(450, NULL, NULL, 549, '55455179', 'PRINT PRO (HANDI SET 24-30)', NULL, '200.0000', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2022-11-19', 'received', '200.0000', '200.0000', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(451, NULL, NULL, 550, '42009528', 'N CSSEROLE SET 24-30CM', NULL, '4631.9200', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2022-11-19', 'received', '4631.9200', '4631.9200', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(452, NULL, NULL, 551, '05553492', 'KHAKI DBA PRO 30-34', NULL, '200.0000', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2022-11-19', 'received', '200.0000', '200.0000', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(453, NULL, NULL, 552, '83521638', 'KHAKI DBA PRO 32-36', NULL, '200.0000', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2022-11-19', 'received', '200.0000', '200.0000', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(454, NULL, NULL, 553, '24935817', 'N CSSEROLE SET 30-36CM', NULL, '7375.9200', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2022-11-19', 'received', '7375.9200', '7375.9200', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(455, NULL, NULL, 554, '85112053', 'N CSSEROLE SET 32-36CM', NULL, '3865.9200', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2022-11-19', 'received', '3865.9200', '3865.9200', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(456, NULL, NULL, 555, '77636585', 'N CSSEROLE SET 30-34CM', NULL, '3094.9600', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2022-11-19', 'received', '3094.9600', '3094.9600', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(457, NULL, NULL, 556, '25727786', 'Master Packing Box SAUCE PAN 16CM', NULL, '9.0000', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2022-11-19', 'received', '9.0000', '9.0000', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(458, NULL, NULL, 557, '11232879', 'N SAUCE PAN 16CM PRO', NULL, '495.5200', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2022-11-19', 'received', '495.5200', '495.5200', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(459, NULL, NULL, 558, '67275474', 'Master Packing Box DEEP FRY PAN 24CM', NULL, '10.0000', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2022-11-19', 'received', '10.0000', '10.0000', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(460, NULL, NULL, 559, '04308082', 'N DEEP FRY PAN 24CM PRO', NULL, '583.2200', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2022-11-19', 'received', '583.2200', '583.2200', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(461, NULL, NULL, 560, '64157834', 'Master Packing Box DEEP FRY PAN 26CM', NULL, '12.0000', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2022-11-19', 'received', '12.0000', '12.0000', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(462, NULL, NULL, 561, '81141715', 'Master Packing Box DEEP FRY PAN 28CM', NULL, '15.0000', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2022-11-19', 'received', '15.0000', '15.0000', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(463, NULL, NULL, 562, '99665393', 'Master Packing Box DEEP FRY PAN 30CM', NULL, '18.0000', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2022-11-19', 'received', '18.0000', '18.0000', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(464, NULL, NULL, 563, '67513831', 'N DEEP FRY PAN 26CM PRO', NULL, '641.7200', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2022-11-19', 'received', '641.7200', '641.7200', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(465, NULL, NULL, 564, '57914784', 'Master Packing Box SAUCE PAN 18CM', NULL, '12.0000', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2022-11-21', 'received', '12.0000', '12.0000', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(466, NULL, NULL, 565, '89639214', 'Master Packing Box SAUCE PAN 20CM', NULL, '15.0000', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2022-11-21', 'received', '15.0000', '15.0000', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(467, NULL, NULL, 566, '31360848', 'N SAUCE PAN 18CM PRO', NULL, '672.0200', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2022-11-21', 'received', '672.0200', '672.0200', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(468, NULL, NULL, 567, '44102946', 'N SAUCE PAN 20CM PRO', NULL, '746.0200', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2022-11-21', 'received', '746.0200', '746.0200', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(469, NULL, NULL, 568, '15473943', 'N DEEP FRY PAN 28CM PRO', NULL, '756.7200', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2022-11-21', 'received', '756.7200', '756.7200', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(470, NULL, NULL, 569, '94694322', 'N DEEP FRY PAN 30CM PRO', NULL, '813.7200', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2022-11-21', 'received', '813.7200', '813.7200', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(471, NULL, NULL, 570, '22618518', 'Master Packing Box WOK 24CM', NULL, '22.0000', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2022-11-21', 'received', '22.0000', '22.0000', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(472, NULL, NULL, 571, '31119520', 'N SAUCE PAN 24CM PRO', NULL, '1173.7600', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2022-11-21', 'received', '1173.7600', '1173.7600', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(473, NULL, NULL, 572, '83767332', 'Master Packing Box WOK 26CM', NULL, '28.0000', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2022-11-21', 'received', '28.0000', '28.0000', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(474, NULL, NULL, 573, '73131008', 'Master Packing Box WOK 28CM', NULL, '32.0000', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2022-11-21', 'received', '32.0000', '32.0000', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(475, NULL, NULL, 574, '10226269', 'Master Packing Box WOK 30CM', NULL, '37.0000', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2022-11-21', 'received', '37.0000', '37.0000', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(476, NULL, NULL, 575, '45792077', 'Master Packing Box WOK 32CM', NULL, '39.0000', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2022-11-21', 'received', '39.0000', '39.0000', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(477, NULL, NULL, 576, '61462839', 'Master Packing Box WOK 34CM', NULL, '40.0000', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2022-11-21', 'received', '40.0000', '40.0000', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(478, NULL, NULL, 577, '88347739', 'Master Packing Box WOK 36CM', NULL, '41.0000', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2022-11-21', 'received', '41.0000', '41.0000', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(479, NULL, NULL, 578, '30123824', 'N KARAHI 26CM PRO', NULL, '960.7600', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2022-11-21', 'received', '960.7600', '960.7600', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(480, NULL, NULL, 579, '38112971', 'N KARAHI 28CM PRO', NULL, '1135.7600', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2022-11-26', 'received', '1135.7600', '1135.7600', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(481, NULL, NULL, 580, '23228304', 'N KARAHI 30CM PRO', NULL, '1126.7600', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2022-11-26', 'received', '1126.7600', '1126.7600', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(482, NULL, NULL, 581, '50347419', 'N KARAHI 32CM PRO', NULL, '1253.7600', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2022-11-26', 'received', '1253.7600', '1253.7600', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(483, NULL, NULL, 582, '71809869', 'N KARAHI 34CM PRO', NULL, '1294.7600', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2022-11-26', 'received', '1294.7600', '1294.7600', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(484, NULL, NULL, 583, '26407518', 'N KARAHI 36CM PRO', NULL, '1360.7600', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2022-11-26', 'received', '1360.7600', '1360.7600', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(495, NULL, NULL, 588, '68354702', 'CHAQUE ON PURCHASED', NULL, '1.0000', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2022-12-18', 'received', '1.0000', '1.0000', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(496, NULL, NULL, 589, '83279584', 'CHAQUE ON PURCHASED', NULL, '1.0000', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2022-12-18', 'received', '1.0000', '1.0000', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(515, NULL, NULL, 594, '50559037', 'BACOLITE HANDLE FRY PAN(shakeel)BE BI', NULL, '46.0000', '0.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2022-12-20', 'received', '46.0000', '46.0000', '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(532, NULL, NULL, 41, '81473203', 'Fitting (Fry Pan)', NULL, '8.5000', '0.0000', 1, '0.0000', 1, '0', NULL, NULL, NULL, '0.0000', '0.0000', '2023-10-19', 'received', '8.5000', '8.5000', '0.0000', NULL, NULL, 1, 'Unit', '0.0000', NULL, NULL, NULL, NULL),
(533, NULL, NULL, 533, '9543360522', 'N CRYSTAL SET', NULL, '5706.6400', '0.0000', 1, '0.0000', 1, '0', NULL, NULL, NULL, '0.0000', '0.0000', '2023-10-20', 'received', '5706.6400', '5706.6400', '0.0000', NULL, NULL, 1, 'Unit', '0.0000', NULL, NULL, NULL, NULL),
(534, NULL, NULL, 595, '123', 'Test', NULL, '100.0000', '10.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '1000.0000', '10.0000', '2023-11-07', 'received', '100.0000', '100.0000', '10.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(535, NULL, NULL, 596, '42022923', 'Test 2', NULL, '1500.0000', '50.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '75000.0000', '50.0000', '2023-11-14', 'received', '1500.0000', '1500.0000', '50.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(536, 28, NULL, 596, '42022923', 'Test 2', NULL, '1500.0000', '9.0000', 2, '0.0000', 1, '0', '0', '0.0000', NULL, '13500.0000', '9.0000', '2023-11-14', 'received', '1500.0000', '1500.0000', '9.0000', NULL, NULL, 2, 'KILOGRAME', '9.0000', NULL, NULL, NULL, NULL),
(537, 28, NULL, 595, '123', 'Test', NULL, '100.0000', '3.0000', 2, '0.0000', 1, '0', '0', '0.0000', NULL, '300.0000', '3.0000', '2023-11-14', 'received', '100.0000', '100.0000', '3.0000', NULL, NULL, 2, 'KILOGRAME', '3.0000', NULL, NULL, NULL, NULL),
(538, NULL, NULL, 597, '83705705', 'Toori', NULL, '100.0000', '100.0000', 4, '0.0000', 1, '0.0000', NULL, NULL, NULL, '10000.0000', '19.0000', '2023-11-15', 'received', '100.0000', '100.0000', '100.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(539, NULL, NULL, 597, '83705705', 'Toori', NULL, '100.0000', '100.0000', 5, '0.0000', 1, '0.0000', NULL, NULL, NULL, '10000.0000', '100.0000', '2023-11-15', 'received', '100.0000', '100.0000', '100.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(540, NULL, NULL, 598, '18283824', 'Khal Wanda', NULL, '1500.0000', '100.0000', 4, '0.0000', 1, '0.0000', NULL, NULL, NULL, '150000.0000', '19.0000', '2023-11-15', 'received', '1500.0000', '1500.0000', '100.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(541, 29, NULL, 598, '18283824', 'Khal Wanda', NULL, '3000.0000', '100.0000', 4, '0.0000', 1, '0', '0', '0.0000', NULL, '300000.0000', '100.0000', '2023-11-16', 'received', '3000.0000', '3000.0000', '100.0000', NULL, NULL, 5, 'kg-1', '100.0000', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_quotes`
--

CREATE TABLE `sma_quotes` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `reference_no` varchar(55) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `customer` varchar(55) NOT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `biller_id` int(11) NOT NULL,
  `biller` varchar(55) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `internal_note` varchar(1000) DEFAULT NULL,
  `total` decimal(25,4) NOT NULL,
  `product_discount` decimal(25,4) DEFAULT 0.0000,
  `order_discount` decimal(25,4) DEFAULT NULL,
  `order_discount_id` varchar(20) DEFAULT NULL,
  `total_discount` decimal(25,4) DEFAULT 0.0000,
  `product_tax` decimal(25,4) DEFAULT 0.0000,
  `order_tax_id` int(11) DEFAULT NULL,
  `order_tax` decimal(25,4) DEFAULT NULL,
  `total_tax` decimal(25,4) DEFAULT NULL,
  `shipping` decimal(25,4) DEFAULT 0.0000,
  `grand_total` decimal(25,4) NOT NULL,
  `status` varchar(20) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `attachment` varchar(55) DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `supplier` varchar(55) DEFAULT NULL,
  `hash` varchar(255) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sma_quote_items`
--

CREATE TABLE `sma_quote_items` (
  `id` int(11) NOT NULL,
  `quote_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_code` varchar(55) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_type` varchar(20) DEFAULT NULL,
  `option_id` int(11) DEFAULT NULL,
  `net_unit_price` decimal(25,4) NOT NULL,
  `unit_price` decimal(25,4) DEFAULT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `tax_rate_id` int(11) DEFAULT NULL,
  `tax` varchar(55) DEFAULT NULL,
  `discount` varchar(55) DEFAULT NULL,
  `item_discount` decimal(25,4) DEFAULT NULL,
  `subtotal` decimal(25,4) NOT NULL,
  `serial_no` varchar(255) DEFAULT NULL,
  `real_unit_price` decimal(25,4) DEFAULT NULL,
  `product_unit_id` int(11) DEFAULT NULL,
  `product_unit_code` varchar(10) DEFAULT NULL,
  `unit_quantity` decimal(15,4) NOT NULL,
  `gst` varchar(20) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sma_returns`
--

CREATE TABLE `sma_returns` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `reference_no` varchar(55) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `customer` varchar(55) NOT NULL,
  `biller_id` int(11) NOT NULL,
  `biller` varchar(55) NOT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `staff_note` varchar(1000) DEFAULT NULL,
  `total` decimal(25,4) NOT NULL,
  `product_discount` decimal(25,4) DEFAULT 0.0000,
  `order_discount_id` varchar(20) DEFAULT NULL,
  `total_discount` decimal(25,4) DEFAULT 0.0000,
  `order_discount` decimal(25,4) DEFAULT 0.0000,
  `product_tax` decimal(25,4) DEFAULT 0.0000,
  `order_tax_id` int(11) DEFAULT NULL,
  `order_tax` decimal(25,4) DEFAULT 0.0000,
  `total_tax` decimal(25,4) DEFAULT 0.0000,
  `grand_total` decimal(25,4) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `total_items` smallint(6) DEFAULT NULL,
  `paid` decimal(25,4) DEFAULT 0.0000,
  `surcharge` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `attachment` varchar(55) DEFAULT NULL,
  `hash` varchar(255) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sma_return_items`
--

CREATE TABLE `sma_return_items` (
  `id` int(11) NOT NULL,
  `return_id` int(11) UNSIGNED NOT NULL,
  `product_id` int(11) UNSIGNED NOT NULL,
  `product_code` varchar(55) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_type` varchar(20) DEFAULT NULL,
  `option_id` int(11) DEFAULT NULL,
  `net_unit_price` decimal(25,4) NOT NULL,
  `unit_price` decimal(25,4) DEFAULT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `tax_rate_id` int(11) DEFAULT NULL,
  `tax` varchar(55) DEFAULT NULL,
  `discount` varchar(55) DEFAULT NULL,
  `item_discount` decimal(25,4) DEFAULT NULL,
  `subtotal` decimal(25,4) NOT NULL,
  `serial_no` varchar(255) DEFAULT NULL,
  `real_unit_price` decimal(25,4) DEFAULT NULL,
  `product_unit_id` int(11) DEFAULT NULL,
  `product_unit_code` varchar(10) DEFAULT NULL,
  `unit_quantity` decimal(15,4) NOT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `gst` varchar(20) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sma_sales`
--

CREATE TABLE `sma_sales` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `reference_no` varchar(55) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `customer` varchar(55) NOT NULL,
  `biller_id` int(11) NOT NULL,
  `biller` varchar(55) NOT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `staff_note` varchar(1000) DEFAULT NULL,
  `total` decimal(25,4) NOT NULL,
  `product_discount` decimal(25,4) DEFAULT 0.0000,
  `order_discount_id` varchar(20) DEFAULT NULL,
  `total_discount` decimal(25,4) DEFAULT 0.0000,
  `order_discount` decimal(25,4) DEFAULT 0.0000,
  `order_discount_type` int(1) NOT NULL DEFAULT 0,
  `product_tax` decimal(25,4) DEFAULT 0.0000,
  `order_tax_id` int(11) DEFAULT NULL,
  `order_tax` decimal(25,4) DEFAULT 0.0000,
  `total_tax` decimal(25,4) DEFAULT 0.0000,
  `shipping` decimal(25,4) DEFAULT 0.0000,
  `grand_total` decimal(25,4) NOT NULL,
  `sale_status` varchar(20) DEFAULT NULL,
  `payment_status` varchar(20) DEFAULT NULL,
  `payment_term` tinyint(4) DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `total_items` smallint(6) DEFAULT NULL,
  `pos` tinyint(1) NOT NULL DEFAULT 0,
  `paid` decimal(25,4) DEFAULT 0.0000,
  `return_id` int(11) DEFAULT NULL,
  `surcharge` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `attachment` varchar(55) DEFAULT NULL,
  `return_sale_ref` varchar(55) DEFAULT NULL,
  `sale_id` int(11) DEFAULT NULL,
  `return_sale_total` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `rounding` decimal(10,4) DEFAULT NULL,
  `suspend_note` varchar(255) DEFAULT NULL,
  `api` tinyint(1) DEFAULT 0,
  `shop` tinyint(1) DEFAULT 0,
  `address_id` int(11) DEFAULT NULL,
  `reserve_id` int(11) DEFAULT NULL,
  `hash` varchar(255) DEFAULT NULL,
  `manual_payment` varchar(55) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL,
  `payment_method` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `sma_sales`
--

INSERT INTO `sma_sales` (`id`, `date`, `reference_no`, `customer_id`, `customer`, `biller_id`, `biller`, `warehouse_id`, `note`, `staff_note`, `total`, `product_discount`, `order_discount_id`, `total_discount`, `order_discount`, `order_discount_type`, `product_tax`, `order_tax_id`, `order_tax`, `total_tax`, `shipping`, `grand_total`, `sale_status`, `payment_status`, `payment_term`, `due_date`, `created_by`, `updated_by`, `updated_at`, `total_items`, `pos`, `paid`, `return_id`, `surcharge`, `attachment`, `return_sale_ref`, `sale_id`, `return_sale_total`, `rounding`, `suspend_note`, `api`, `shop`, `address_id`, `reserve_id`, `hash`, `manual_payment`, `cgst`, `sgst`, `igst`, `payment_method`) VALUES
(1, '2023-11-15 11:30:19', 'SALE/POS2023/11/0015', 53, 'walk-in Customer', 43, 'PRO COOK', 4, '', '', '6952.5000', '0.0000', '', '0.0000', '0.0000', 0, '0.0000', 1, '0.0000', '0.0000', '0.0000', '6952.5000', 'completed', 'paid', 0, NULL, 5, NULL, NULL, 2, 1, '6952.5000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', NULL, 0, 0, NULL, NULL, '13264d41dd9f77b5983868ad459ce37110ba808a1b72b0a80b8346b50208faf8', NULL, NULL, NULL, NULL, NULL),
(2, '2023-11-15 11:35:29', 'SALE/POS2023/11/0016', 54, 'Misc', 43, 'PRO COOK', 4, '', '', '556200.0000', '0.0000', '', '0.0000', '0.0000', 0, '0.0000', 1, '0.0000', '0.0000', '0.0000', '556200.0000', 'completed', 'paid', 0, NULL, 5, NULL, NULL, 160, 1, '556200.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', NULL, 0, 0, NULL, NULL, 'b8cf085a1b3be5cc237417b4dec78456e5fee5716c6ad0733c1dc53ccf22cc45', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_sale_items`
--

CREATE TABLE `sma_sale_items` (
  `id` int(11) NOT NULL,
  `sale_id` int(11) UNSIGNED NOT NULL,
  `product_id` int(11) UNSIGNED NOT NULL,
  `product_code` varchar(55) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_type` varchar(20) DEFAULT NULL,
  `option_id` int(11) DEFAULT NULL,
  `net_unit_price` decimal(25,4) NOT NULL,
  `unit_price` decimal(25,4) DEFAULT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `tax_rate_id` int(11) DEFAULT NULL,
  `tax` varchar(55) DEFAULT NULL,
  `discount` varchar(55) DEFAULT NULL,
  `item_discount` decimal(25,4) DEFAULT NULL,
  `subtotal` decimal(25,4) NOT NULL,
  `serial_no` varchar(255) DEFAULT NULL,
  `real_unit_price` decimal(25,4) DEFAULT NULL,
  `sale_item_id` int(11) DEFAULT NULL,
  `product_unit_id` int(11) DEFAULT NULL,
  `product_unit_code` varchar(10) DEFAULT NULL,
  `unit_quantity` decimal(15,4) NOT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `gst` varchar(20) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `sma_sale_items`
--

INSERT INTO `sma_sale_items` (`id`, `sale_id`, `product_id`, `product_code`, `product_name`, `product_type`, `option_id`, `net_unit_price`, `unit_price`, `quantity`, `warehouse_id`, `item_tax`, `tax_rate_id`, `tax`, `discount`, `item_discount`, `subtotal`, `serial_no`, `real_unit_price`, `sale_item_id`, `product_unit_id`, `product_unit_code`, `unit_quantity`, `comment`, `gst`, `cgst`, `sgst`, `igst`) VALUES
(12, 1, 597, '83705705', 'Toori', 'standard', NULL, '202.5000', '202.5000', '1.0000', 4, '0.0000', 1, '0', '0', '0.0000', '202.5000', '', '202.5000', NULL, 5, 'kg-1', '1.0000', '', NULL, NULL, NULL, NULL),
(13, 1, 598, '18283824', 'Khal Wanda', 'production', NULL, '6750.0000', '6750.0000', '1.0000', 4, '0.0000', 1, '0', '0', '0.0000', '6750.0000', '', '6750.0000', NULL, 5, 'kg-1', '1.0000', '', NULL, NULL, NULL, NULL),
(14, 2, 598, '18283824', 'Khal Wanda', 'production', NULL, '6750.0000', '6750.0000', '80.0000', 4, '0.0000', 1, '0', '0', '0.0000', '540000.0000', '', '6750.0000', NULL, 5, 'kg-1', '80.0000', '', NULL, NULL, NULL, NULL),
(15, 2, 597, '83705705', 'Toori', 'standard', NULL, '202.5000', '202.5000', '80.0000', 4, '0.0000', 1, '0', '0', '0.0000', '16200.0000', '', '202.5000', NULL, 5, 'kg-1', '80.0000', '', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_sessions`
--

CREATE TABLE `sma_sessions` (
  `id` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `data` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `sma_sessions`
--

INSERT INTO `sma_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('28jtnlt2grbn2lv3kumi6cv9toflvmea', '::1', 1699955843, 0x5f5f63695f6c6173745f726567656e65726174657c693a313639393935353834333b6964656e746974797c733a32303a2274657374406164726f69744c696768742e636f6d223b757365726e616d657c733a363a226e6166656573223b656d61696c7c733a32303a2274657374406164726f69744c696768742e636f6d223b757365725f69647c733a313a2235223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363939393533353333223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6272616e636865737c613a323a7b693a303b733a313a2236223b693a313b733a313a2238223b7d),
('3jk7ng7h57e69b34umardfqtbsu6qq0i', '::1', 1700117350, 0x5f5f63695f6c6173745f726567656e65726174657c693a313730303131373335303b6964656e746974797c733a32303a2274657374406164726f69744c696768742e636f6d223b757365726e616d657c733a363a226e6166656573223b656d61696c7c733a32303a2274657374406164726f69744c696768742e636f6d223b757365725f69647c733a313a2235223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373030313136373138223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6272616e636865737c613a323a7b693a303b733a313a2236223b693a313b733a313a2238223b7d5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226f6c64223b7d6572726f727c733a3131353a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e687474703a2f2f6c6f63616c686f73742f6277682f6173736574732f696d616765732f2e706e67223b),
('4k8aank18matqgeu954pkmhmnhnt3gsd', '::1', 1700115703, 0x5f5f63695f6c6173745f726567656e65726174657c693a313730303131353730333b),
('4ot3biuelcdpf4trr7nq862oqeqt8bai', '::1', 1700118172, 0x5f5f63695f6c6173745f726567656e65726174657c693a313730303131383137323b6964656e746974797c733a32303a2274657374406164726f69744c696768742e636f6d223b757365726e616d657c733a363a226e6166656573223b656d61696c7c733a32303a2274657374406164726f69744c696768742e636f6d223b757365725f69647c733a313a2235223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373030313137303039223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6272616e636865737c613a323a7b693a303b733a313a2236223b693a313b733a313a2238223b7d6c6173745f61637469766974797c693a313730303131383133343b757365725f637372667c733a32303a22734e72786d4f30525861347132765a49384d574b223b72656769737465725f69647c733a313a2239223b636173685f696e5f68616e647c733a31303a2231303030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032332d31312d31362031313a35393a3537223b),
('7oaoep2q0297fm66mllv41pro07feckq', '::1', 1699957866, 0x5f5f63695f6c6173745f726567656e65726174657c693a313639393935373836363b6964656e746974797c733a32303a2274657374406164726f69744c696768742e636f6d223b757365726e616d657c733a363a226e6166656573223b656d61696c7c733a32303a2274657374406164726f69744c696768742e636f6d223b757365725f69647c733a313a2235223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363939393533353333223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6272616e636865737c613a323a7b693a303b733a313a2236223b693a313b733a313a2238223b7d757365725f637372667c733a32303a2231494c3052457a686c4779596f41757733424351223b),
('9uo11u4kfdjrdev8s3kfrmr1jcj9qvfi', '::1', 1700117027, 0x5f5f63695f6c6173745f726567656e65726174657c693a313730303131373032373b6964656e746974797c733a32303a2274657374406164726f69744c696768742e636f6d223b757365726e616d657c733a363a226e6166656573223b656d61696c7c733a32303a2274657374406164726f69744c696768742e636f6d223b757365725f69647c733a313a2235223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373030313136373138223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6272616e636865737c613a323a7b693a303b733a313a2236223b693a313b733a313a2238223b7d),
('djfk6937furha5h0k3ab3l8b3djhr8do', '::1', 1700116548, 0x5f5f63695f6c6173745f726567656e65726174657c693a313730303131363534383b6964656e746974797c733a32303a2274657374406164726f69744c696768742e636f6d223b757365726e616d657c733a363a226e6166656573223b656d61696c7c733a32303a2274657374406164726f69744c696768742e636f6d223b757365725f69647c733a313a2235223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373030303432363331223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6272616e636865737c613a323a7b693a303b733a313a2236223b693a313b733a313a2238223b7d),
('fn54hs8b5gn54bpch2t89qsanc6joepu', '::1', 1699958253, 0x5f5f63695f6c6173745f726567656e65726174657c693a313639393935383235333b6964656e746974797c733a32303a2274657374406164726f69744c696768742e636f6d223b757365726e616d657c733a363a226e6166656573223b656d61696c7c733a32303a2274657374406164726f69744c696768742e636f6d223b757365725f69647c733a313a2235223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363939393533353333223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6272616e636865737c613a323a7b693a303b733a313a2236223b693a313b733a313a2238223b7d757365725f637372667c733a32303a2231494c3052457a686c4779596f41757733424351223b),
('fv2pie8mvkco81thasbn7vn95td5vcu5', '::1', 1700043695, 0x5f5f63695f6c6173745f726567656e65726174657c693a313730303034333639353b6964656e746974797c733a32303a2274657374406164726f69744c696768742e636f6d223b757365726e616d657c733a363a226e6166656573223b656d61696c7c733a32303a2274657374406164726f69744c696768742e636f6d223b757365725f69647c733a313a2235223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363939393533393631223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6272616e636865737c613a323a7b693a303b733a313a2236223b693a313b733a313a2238223b7d),
('g8mo0t0mqe83gm7860dv4fjh10hhjovu', '::1', 1700042930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313730303034323933303b6964656e746974797c733a32303a2274657374406164726f69744c696768742e636f6d223b757365726e616d657c733a363a226e6166656573223b656d61696c7c733a32303a2274657374406164726f69744c696768742e636f6d223b757365725f69647c733a313a2235223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363939393533393631223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6272616e636865737c613a323a7b693a303b733a313a2236223b693a313b733a313a2238223b7d),
('h6f1ic8u6pk9nqsnvunmqcpf86a8ohrv', '::1', 1699960201, 0x5f5f63695f6c6173745f726567656e65726174657c693a313639393936303035343b6964656e746974797c733a32303a2274657374406164726f69744c696768742e636f6d223b757365726e616d657c733a363a226e6166656573223b656d61696c7c733a32303a2274657374406164726f69744c696768742e636f6d223b757365725f69647c733a313a2235223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363939393533353333223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6272616e636865737c613a323a7b693a303b733a313a2236223b693a313b733a313a2238223b7d757365725f637372667c733a32303a2231494c3052457a686c4779596f41757733424351223b),
('ilgm6r9a2buqknld5kebud3s1hfb20pj', '::1', 1700048004, 0x5f5f63695f6c6173745f726567656e65726174657c693a313730303034383030343b6964656e746974797c733a32303a2274657374406164726f69744c696768742e636f6d223b757365726e616d657c733a363a226e6166656573223b656d61696c7c733a32303a2274657374406164726f69744c696768742e636f6d223b757365725f69647c733a313a2235223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363939393533393631223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6272616e636865737c613a323a7b693a303b733a313a2236223b693a313b733a313a2238223b7d6c6173745f61637469766974797c693a313730303034373935323b72656769737465725f69647c733a313a2237223b636173685f696e5f68616e647c733a363a22312e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032322d31302d32342031303a33393a3035223b),
('ina9do8put1aqic6ce3c34cde9usathp', '::1', 1699951784, 0x5f5f63695f6c6173745f726567656e65726174657c693a313639393935313738343b6964656e746974797c733a32303a2274657374406164726f69744c696768742e636f6d223b757365726e616d657c733a363a226e6166656573223b656d61696c7c733a32303a2274657374406164726f69744c696768742e636f6d223b757365725f69647c733a313a2235223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363939393439343336223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('iv7dv7kufogrdcg5vldtcml6o9aud9u0', '::1', 1699953433, 0x5f5f63695f6c6173745f726567656e65726174657c693a313639393935333433333b),
('jq14p8kavpi3aao1ipta81un5tscuncd', '::1', 1699959173, 0x5f5f63695f6c6173745f726567656e65726174657c693a313639393935393137333b6964656e746974797c733a32303a2274657374406164726f69744c696768742e636f6d223b757365726e616d657c733a363a226e6166656573223b656d61696c7c733a32303a2274657374406164726f69744c696768742e636f6d223b757365725f69647c733a313a2235223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363939393533353333223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6272616e636865737c613a323a7b693a303b733a313a2236223b693a313b733a313a2238223b7d757365725f637372667c733a32303a2231494c3052457a686c4779596f41757733424351223b),
('jrbvqfontinlrrlbj6j801chp5qcuiar', '::1', 1699956174, 0x5f5f63695f6c6173745f726567656e65726174657c693a313639393935363137343b6964656e746974797c733a32303a2274657374406164726f69744c696768742e636f6d223b757365726e616d657c733a363a226e6166656573223b656d61696c7c733a32303a2274657374406164726f69744c696768742e636f6d223b757365725f69647c733a313a2235223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363939393533353333223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6272616e636865737c613a323a7b693a303b733a313a2236223b693a313b733a313a2238223b7d),
('kib853f0sncjhqr7sq8h015d93vjp3st', '::1', 1699951460, 0x5f5f63695f6c6173745f726567656e65726174657c693a313639393935313436303b6964656e746974797c733a32303a2274657374406164726f69744c696768742e636f6d223b757365726e616d657c733a363a226e6166656573223b656d61696c7c733a32303a2274657374406164726f69744c696768742e636f6d223b757365725f69647c733a313a2235223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363939393339323535223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6572726f727c4e3b),
('kli91i5b3sb5fg13lb7a78ika35hjq1e', '::1', 1700048159, 0x5f5f63695f6c6173745f726567656e65726174657c693a313730303034383135343b7265717565737465645f706167657c733a393a2261646d696e2f706f73223b),
('kmgn97d1ijnp42mi8kncrt8bs4u9m4cq', '::1', 1700043304, 0x5f5f63695f6c6173745f726567656e65726174657c693a313730303034333330343b6964656e746974797c733a32303a2274657374406164726f69744c696768742e636f6d223b757365726e616d657c733a363a226e6166656573223b656d61696c7c733a32303a2274657374406164726f69744c696768742e636f6d223b757365725f69647c733a313a2235223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363939393533393631223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6272616e636865737c613a323a7b693a303b733a313a2236223b693a313b733a313a2238223b7d),
('l5t2q1beg4fjpij3g4b4ivmo6qu933pq', '::1', 1700118491, 0x5f5f63695f6c6173745f726567656e65726174657c693a313730303131383439313b6964656e746974797c733a32303a2274657374406164726f69744c696768742e636f6d223b757365726e616d657c733a363a226e6166656573223b656d61696c7c733a32303a2274657374406164726f69744c696768742e636f6d223b757365725f69647c733a313a2235223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373030313137303039223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6272616e636865737c613a323a7b693a303b733a313a2236223b693a313b733a313a2238223b7d6c6173745f61637469766974797c693a313730303131383231333b757365725f637372667c733a32303a22734e72786d4f30525861347132765a49384d574b223b72656769737465725f69647c733a313a2239223b636173685f696e5f68616e647c733a31303a2231303030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032332d31312d31362031313a35393a3537223b),
('movvht5p69tlpkeqa2u91lt4c314s5s0', '::1', 1700120919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313730303132303838373b6964656e746974797c733a32303a2274657374406164726f69744c696768742e636f6d223b757365726e616d657c733a363a226e6166656573223b656d61696c7c733a32303a2274657374406164726f69744c696768742e636f6d223b757365725f69647c733a313a2235223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373030313137303039223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6272616e636865737c613a323a7b693a303b733a313a2236223b693a313b733a313a2238223b7d6c6173745f61637469766974797c693a313730303131393036313b757365725f637372667c733a32303a22734e72786d4f30525861347132765a49384d574b223b72656769737465725f69647c733a313a2239223b636173685f696e5f68616e647c733a31303a2231303030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032332d31312d31362031313a35393a3537223b),
('n0kpp8hgve3ea9t42hcvercdsd0kcfnp', '::1', 1699960054, 0x5f5f63695f6c6173745f726567656e65726174657c693a313639393936303035343b6964656e746974797c733a32303a2274657374406164726f69744c696768742e636f6d223b757365726e616d657c733a363a226e6166656573223b656d61696c7c733a32303a2274657374406164726f69744c696768742e636f6d223b757365725f69647c733a313a2235223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363939393533353333223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6272616e636865737c613a323a7b693a303b733a313a2236223b693a313b733a313a2238223b7d757365725f637372667c733a32303a2231494c3052457a686c4779596f41757733424351223b),
('o0tnj7df0hvvh1l6vbh7ajsfv143r7ht', '::1', 1699952963, 0x5f5f63695f6c6173745f726567656e65726174657c693a313639393935323936333b),
('ouhi7b0bo6ntmt89j2mn0ruvca1dm51h', '::1', 1700046185, 0x5f5f63695f6c6173745f726567656e65726174657c693a313730303034363138353b6964656e746974797c733a32303a2274657374406164726f69744c696768742e636f6d223b757365726e616d657c733a363a226e6166656573223b656d61696c7c733a32303a2274657374406164726f69744c696768742e636f6d223b757365725f69647c733a313a2235223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363939393533393631223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6272616e636865737c613a323a7b693a303b733a313a2236223b693a313b733a313a2238223b7d),
('p0du8o8vg5q38kspdmg9lmi21ou4idd4', '::1', 1700047350, 0x5f5f63695f6c6173745f726567656e65726174657c693a313730303034373335303b6964656e746974797c733a32303a2274657374406164726f69744c696768742e636f6d223b757365726e616d657c733a363a226e6166656573223b656d61696c7c733a32303a2274657374406164726f69744c696768742e636f6d223b757365725f69647c733a313a2235223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363939393533393631223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6272616e636865737c613a323a7b693a303b733a313a2236223b693a313b733a313a2238223b7d),
('rmqer8c9tpoprfc0ti1d8uesnhclu4u1', '::1', 1700117857, 0x5f5f63695f6c6173745f726567656e65726174657c693a313730303131373835373b6964656e746974797c733a32303a2274657374406164726f69744c696768742e636f6d223b757365726e616d657c733a363a226e6166656573223b656d61696c7c733a32303a2274657374406164726f69744c696768742e636f6d223b757365725f69647c733a313a2235223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373030313137303039223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6272616e636865737c613a323a7b693a303b733a313a2236223b693a313b733a313a2238223b7d6c6173745f61637469766974797c693a313730303131373639333b),
('ssgi3aefc1ocja766iitms595atp54bv', '::1', 1700120887, 0x5f5f63695f6c6173745f726567656e65726174657c693a313730303132303838373b6964656e746974797c733a32303a2274657374406164726f69744c696768742e636f6d223b757365726e616d657c733a363a226e6166656573223b656d61696c7c733a32303a2274657374406164726f69744c696768742e636f6d223b757365725f69647c733a313a2235223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373030313137303039223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6272616e636865737c613a323a7b693a303b733a313a2236223b693a313b733a313a2238223b7d6c6173745f61637469766974797c693a313730303131393036313b757365725f637372667c733a32303a22734e72786d4f30525861347132765a49384d574b223b72656769737465725f69647c733a313a2239223b636173685f696e5f68616e647c733a31303a2231303030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032332d31312d31362031313a35393a3537223b),
('tibobm1qhhauphs8uaa5cvqnj7ca3ftj', '::1', 1699953765, 0x5f5f63695f6c6173745f726567656e65726174657c693a313639393935333736353b6964656e746974797c733a32303a2274657374406164726f69744c696768742e636f6d223b757365726e616d657c733a363a226e6166656573223b656d61696c7c733a32303a2274657374406164726f69744c696768742e636f6d223b757365725f69647c733a313a2235223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363939393532303236223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('tn3n4hrf43ff09rdk0d1c6hdvijnske5', '::1', 1700118888, 0x5f5f63695f6c6173745f726567656e65726174657c693a313730303131383838383b6964656e746974797c733a32303a2274657374406164726f69744c696768742e636f6d223b757365726e616d657c733a363a226e6166656573223b656d61696c7c733a32303a2274657374406164726f69744c696768742e636f6d223b757365725f69647c733a313a2235223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373030313137303039223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6272616e636865737c613a323a7b693a303b733a313a2236223b693a313b733a313a2238223b7d6c6173745f61637469766974797c693a313730303131383439313b757365725f637372667c733a32303a22734e72786d4f30525861347132765a49384d574b223b72656769737465725f69647c733a313a2239223b636173685f696e5f68616e647c733a31303a2231303030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032332d31312d31362031313a35393a3537223b),
('tp9i555gup6658jrqa8bhht0s1olvaq2', '::1', 1699952622, 0x5f5f63695f6c6173745f726567656e65726174657c693a313639393935323632323b),
('uumuvbueb4po73uu9imqcj9c1n686s3m', '::1', 1700116124, 0x5f5f63695f6c6173745f726567656e65726174657c693a313730303131363132343b),
('vb7to9h86323v9q2corsnfqevvk5vv11', '::1', 1699957543, 0x5f5f63695f6c6173745f726567656e65726174657c693a313639393935373534333b6964656e746974797c733a32303a2274657374406164726f69744c696768742e636f6d223b757365726e616d657c733a363a226e6166656573223b656d61696c7c733a32303a2274657374406164726f69744c696768742e636f6d223b757365725f69647c733a313a2235223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363939393533353333223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6272616e636865737c613a323a7b693a303b733a313a2236223b693a313b733a313a2238223b7d757365725f637372667c733a32303a22465573775269633243677578344f494438414761223b),
('vd3un6714t5vc4itpklnq4kvddi7pfha', '::1', 1700047663, 0x5f5f63695f6c6173745f726567656e65726174657c693a313730303034373636333b6964656e746974797c733a32303a2274657374406164726f69744c696768742e636f6d223b757365726e616d657c733a363a226e6166656573223b656d61696c7c733a32303a2274657374406164726f69744c696768742e636f6d223b757365725f69647c733a313a2235223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363939393533393631223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6272616e636865737c613a323a7b693a303b733a313a2236223b693a313b733a313a2238223b7d6c6173745f61637469766974797c693a313730303034373632383b72656769737465725f69647c733a313a2237223b636173685f696e5f68616e647c733a363a22312e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032322d31302d32342031303a33393a3035223b);

-- --------------------------------------------------------

--
-- Table structure for table `sma_settings`
--

CREATE TABLE `sma_settings` (
  `setting_id` int(1) NOT NULL,
  `logo` varchar(255) NOT NULL,
  `logo2` varchar(255) NOT NULL,
  `site_name` varchar(55) NOT NULL,
  `language` varchar(20) NOT NULL,
  `default_warehouse` int(2) NOT NULL,
  `accounting_method` tinyint(4) NOT NULL DEFAULT 0,
  `default_currency` varchar(3) NOT NULL,
  `default_currency_id` int(1) NOT NULL,
  `default_tax_rate` int(2) NOT NULL,
  `rows_per_page` int(2) NOT NULL,
  `version` varchar(10) NOT NULL DEFAULT '1.0',
  `default_tax_rate2` int(11) NOT NULL DEFAULT 0,
  `dateformat` int(11) NOT NULL,
  `sales_prefix` varchar(20) DEFAULT NULL,
  `quote_prefix` varchar(20) DEFAULT NULL,
  `purchase_prefix` varchar(20) DEFAULT NULL,
  `transfer_prefix` varchar(20) DEFAULT NULL,
  `delivery_prefix` varchar(20) DEFAULT NULL,
  `payment_prefix` varchar(20) DEFAULT NULL,
  `return_prefix` varchar(20) DEFAULT NULL,
  `returnp_prefix` varchar(20) DEFAULT NULL,
  `expense_prefix` varchar(20) DEFAULT NULL,
  `item_addition` tinyint(1) NOT NULL DEFAULT 0,
  `theme` varchar(20) NOT NULL,
  `product_serial` tinyint(4) NOT NULL,
  `default_discount` int(11) NOT NULL,
  `product_discount` tinyint(1) NOT NULL DEFAULT 0,
  `discount_method` tinyint(4) NOT NULL,
  `tax1` tinyint(4) NOT NULL,
  `tax2` tinyint(4) NOT NULL,
  `overselling` tinyint(1) NOT NULL DEFAULT 0,
  `restrict_user` tinyint(4) NOT NULL DEFAULT 0,
  `restrict_calendar` tinyint(4) NOT NULL DEFAULT 0,
  `timezone` varchar(100) DEFAULT NULL,
  `iwidth` int(11) NOT NULL DEFAULT 0,
  `iheight` int(11) NOT NULL,
  `twidth` int(11) NOT NULL,
  `theight` int(11) NOT NULL,
  `watermark` tinyint(1) DEFAULT NULL,
  `reg_ver` tinyint(1) DEFAULT NULL,
  `allow_reg` tinyint(1) DEFAULT NULL,
  `reg_notification` tinyint(1) DEFAULT NULL,
  `auto_reg` tinyint(1) DEFAULT NULL,
  `protocol` varchar(20) NOT NULL DEFAULT 'mail',
  `mailpath` varchar(55) DEFAULT '/usr/sbin/sendmail',
  `smtp_host` varchar(100) DEFAULT NULL,
  `smtp_user` varchar(100) DEFAULT NULL,
  `smtp_pass` varchar(255) DEFAULT NULL,
  `smtp_port` varchar(10) DEFAULT '25',
  `smtp_crypto` varchar(10) DEFAULT NULL,
  `corn` datetime DEFAULT NULL,
  `customer_group` int(11) NOT NULL,
  `default_email` varchar(100) NOT NULL,
  `mmode` tinyint(1) NOT NULL,
  `bc_fix` tinyint(4) NOT NULL DEFAULT 0,
  `auto_detect_barcode` tinyint(1) NOT NULL DEFAULT 0,
  `captcha` tinyint(1) NOT NULL DEFAULT 1,
  `reference_format` tinyint(1) NOT NULL DEFAULT 1,
  `racks` tinyint(1) DEFAULT 0,
  `attributes` tinyint(1) NOT NULL DEFAULT 0,
  `product_expiry` tinyint(1) NOT NULL DEFAULT 0,
  `decimals` tinyint(2) NOT NULL DEFAULT 2,
  `qty_decimals` tinyint(2) NOT NULL DEFAULT 2,
  `decimals_sep` varchar(2) NOT NULL DEFAULT '.',
  `thousands_sep` varchar(2) NOT NULL DEFAULT ',',
  `invoice_view` tinyint(1) DEFAULT 0,
  `default_biller` int(11) DEFAULT NULL,
  `envato_username` varchar(50) DEFAULT NULL,
  `purchase_code` varchar(100) DEFAULT NULL,
  `rtl` tinyint(1) DEFAULT 0,
  `each_spent` decimal(15,4) DEFAULT NULL,
  `ca_point` tinyint(4) DEFAULT NULL,
  `each_sale` decimal(15,4) DEFAULT NULL,
  `sa_point` tinyint(4) DEFAULT NULL,
  `update` tinyint(1) DEFAULT 0,
  `sac` tinyint(1) DEFAULT 0,
  `display_all_products` tinyint(1) DEFAULT 0,
  `display_symbol` tinyint(1) DEFAULT NULL,
  `symbol` varchar(50) DEFAULT NULL,
  `remove_expired` tinyint(1) DEFAULT 0,
  `barcode_separator` varchar(2) NOT NULL DEFAULT '-',
  `set_focus` tinyint(1) NOT NULL DEFAULT 0,
  `price_group` int(11) DEFAULT NULL,
  `barcode_img` tinyint(1) NOT NULL DEFAULT 1,
  `ppayment_prefix` varchar(20) DEFAULT 'POP',
  `disable_editing` smallint(6) DEFAULT 90,
  `qa_prefix` varchar(55) DEFAULT NULL,
  `update_cost` tinyint(1) DEFAULT NULL,
  `apis` tinyint(1) NOT NULL DEFAULT 0,
  `state` varchar(100) DEFAULT NULL,
  `pdf_lib` varchar(20) DEFAULT 'dompdf'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `sma_settings`
--

INSERT INTO `sma_settings` (`setting_id`, `logo`, `logo2`, `site_name`, `language`, `default_warehouse`, `accounting_method`, `default_currency`, `default_currency_id`, `default_tax_rate`, `rows_per_page`, `version`, `default_tax_rate2`, `dateformat`, `sales_prefix`, `quote_prefix`, `purchase_prefix`, `transfer_prefix`, `delivery_prefix`, `payment_prefix`, `return_prefix`, `returnp_prefix`, `expense_prefix`, `item_addition`, `theme`, `product_serial`, `default_discount`, `product_discount`, `discount_method`, `tax1`, `tax2`, `overselling`, `restrict_user`, `restrict_calendar`, `timezone`, `iwidth`, `iheight`, `twidth`, `theight`, `watermark`, `reg_ver`, `allow_reg`, `reg_notification`, `auto_reg`, `protocol`, `mailpath`, `smtp_host`, `smtp_user`, `smtp_pass`, `smtp_port`, `smtp_crypto`, `corn`, `customer_group`, `default_email`, `mmode`, `bc_fix`, `auto_detect_barcode`, `captcha`, `reference_format`, `racks`, `attributes`, `product_expiry`, `decimals`, `qty_decimals`, `decimals_sep`, `thousands_sep`, `invoice_view`, `default_biller`, `envato_username`, `purchase_code`, `rtl`, `each_spent`, `ca_point`, `each_sale`, `sa_point`, `update`, `sac`, `display_all_products`, `display_symbol`, `symbol`, `remove_expired`, `barcode_separator`, `set_focus`, `price_group`, `barcode_img`, `ppayment_prefix`, `disable_editing`, `qa_prefix`, `update_cost`, `apis`, `state`, `pdf_lib`) VALUES
(1, 'Website-Logo.png', 'Website-Logo1.png', 'BKWH', 'english', 3, 0, 'Rs', 1, 1, 25, '3.4.6', 1, 5, 'SALE', 'QUOTE', 'PO', 'TR', 'DO', 'IPAY', 'SR', 'PR', '', 0, 'default', 1, 1, 1, 1, 1, 1, 0, 1, 0, 'Asia/Karachi', 1080, 1220, 150, 150, 0, 0, 0, 0, NULL, 'mail', '/usr/sbin/sendmail', 'pop.gmail.com', 'contact@sma.tecdiary.org', 'Hain1234', '25', NULL, NULL, 2, 'admin@adroit.light.com', 0, 50, 1, 0, 2, 0, 1, 0, 1, 2, '.', ',', 0, 43, 'Lanceoscott', 'fa491eed-229f-4d8d-9524-f7b9f35da0c4', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 'Rs', 1, '-', 0, 1, 1, 'POP', 90, '', 1, 0, 'AN', 'mpdf');

-- --------------------------------------------------------

--
-- Table structure for table `sma_shop_settings`
--

CREATE TABLE `sma_shop_settings` (
  `shop_id` int(11) NOT NULL,
  `shop_name` varchar(55) NOT NULL,
  `description` varchar(160) NOT NULL,
  `warehouse` int(11) NOT NULL,
  `biller` int(11) NOT NULL,
  `about_link` varchar(55) NOT NULL,
  `terms_link` varchar(55) NOT NULL,
  `privacy_link` varchar(55) NOT NULL,
  `contact_link` varchar(55) NOT NULL,
  `payment_text` varchar(100) NOT NULL,
  `follow_text` varchar(100) NOT NULL,
  `facebook` varchar(55) NOT NULL,
  `twitter` varchar(55) DEFAULT NULL,
  `google_plus` varchar(55) DEFAULT NULL,
  `instagram` varchar(55) DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `email` varchar(55) DEFAULT NULL,
  `cookie_message` varchar(180) DEFAULT NULL,
  `cookie_link` varchar(55) DEFAULT NULL,
  `slider` text DEFAULT NULL,
  `shipping` int(11) DEFAULT NULL,
  `purchase_code` varchar(100) DEFAULT 'purchase_code',
  `envato_username` varchar(50) DEFAULT 'envato_username',
  `version` varchar(10) DEFAULT '3.4.6',
  `logo` varchar(55) DEFAULT NULL,
  `bank_details` varchar(255) DEFAULT NULL,
  `products_page` tinyint(1) DEFAULT NULL,
  `hide0` tinyint(1) DEFAULT 0,
  `products_description` varchar(255) DEFAULT NULL,
  `private` tinyint(1) DEFAULT 0,
  `hide_price` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `sma_shop_settings`
--

INSERT INTO `sma_shop_settings` (`shop_id`, `shop_name`, `description`, `warehouse`, `biller`, `about_link`, `terms_link`, `privacy_link`, `contact_link`, `payment_text`, `follow_text`, `facebook`, `twitter`, `google_plus`, `instagram`, `phone`, `email`, `cookie_message`, `cookie_link`, `slider`, `shipping`, `purchase_code`, `envato_username`, `version`, `logo`, `bank_details`, `products_page`, `hide0`, `products_description`, `private`, `hide_price`) VALUES
(1, 'ALS ACC', 'ALS ACC Shop', 1, 3, '', '', '', '', 'We accept PayPal or you can pay with your credit/debit cards.', 'Please click the link below to follow us on social media.', 'http://facebook.com/adroitlightsolotions', '', '', '', '00923066634430', 'info@adroitLight.com', 'We use cookies to improve your experience on our website. By browsing this website, you agree to our use of cookies.', '', '[{\"image\":\"e63ba2b9b73451cf6c68d28296850b4f.jpg\",\"link\":\"\",\"caption\":\"\"},{\"link\":\"\",\"caption\":\"\"},{\"link\":\"\",\"caption\":\"\"},{\"link\":\"\",\"caption\":\"\"},{\"link\":\"\",\"caption\":\"\"}]', 0, '7b8973ee-a8ca-4f7c-9bf6-92ef22c876d6', 'Lanceoscott', '3.4.6', 'Website-Logo3.png', '', 0, 0, 'ALS ACC Shop', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `sma_skrill`
--

CREATE TABLE `sma_skrill` (
  `id` int(11) NOT NULL,
  `active` tinyint(4) NOT NULL,
  `account_email` varchar(255) NOT NULL DEFAULT 'testaccount2@moneybookers.com',
  `secret_word` varchar(20) NOT NULL DEFAULT 'mbtest',
  `skrill_currency` varchar(3) NOT NULL DEFAULT 'USD',
  `fixed_charges` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `extra_charges_my` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `extra_charges_other` decimal(25,4) NOT NULL DEFAULT 0.0000
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `sma_skrill`
--

INSERT INTO `sma_skrill` (`id`, `active`, `account_email`, `secret_word`, `skrill_currency`, `fixed_charges`, `extra_charges_my`, `extra_charges_other`) VALUES
(1, 1, 'testaccount2@moneybookers.com', 'mbtest', 'USD', '0.0000', '0.0000', '0.0000');

-- --------------------------------------------------------

--
-- Table structure for table `sma_sms_settings`
--

CREATE TABLE `sma_sms_settings` (
  `id` int(11) NOT NULL,
  `auto_send` tinyint(1) DEFAULT NULL,
  `config` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `sma_sms_settings`
--

INSERT INTO `sma_sms_settings` (`id`, `auto_send`, `config`) VALUES
(1, NULL, '{\"gateway\":\"Log\",\"Log\":{}');

-- --------------------------------------------------------

--
-- Table structure for table `sma_stock_counts`
--

CREATE TABLE `sma_stock_counts` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `reference_no` varchar(55) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `type` varchar(10) NOT NULL,
  `initial_file` varchar(50) NOT NULL,
  `final_file` varchar(50) DEFAULT NULL,
  `brands` varchar(50) DEFAULT NULL,
  `brand_names` varchar(100) DEFAULT NULL,
  `categories` varchar(50) DEFAULT NULL,
  `category_names` varchar(100) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `products` int(11) DEFAULT NULL,
  `rows` int(11) DEFAULT NULL,
  `differences` int(11) DEFAULT NULL,
  `matches` int(11) DEFAULT NULL,
  `missing` int(11) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `finalized` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `sma_stock_counts`
--

INSERT INTO `sma_stock_counts` (`id`, `date`, `reference_no`, `warehouse_id`, `type`, `initial_file`, `final_file`, `brands`, `brand_names`, `categories`, `category_names`, `note`, `products`, `rows`, `differences`, `matches`, `missing`, `created_by`, `updated_by`, `updated_at`, `finalized`) VALUES
(1, '2019-02-27 11:43:00', '', 1, 'full', '3fc48b14105a3942beb3b1537ef78966.csv', NULL, '', '', '', '', NULL, 16, 16, NULL, NULL, NULL, 5, NULL, NULL, NULL),
(2, '2019-02-27 11:48:00', '', 1, 'full', 'adcd922d31d4146962e1693a21a8fdda.csv', NULL, '', '', '', '', NULL, 17, 17, NULL, NULL, NULL, 5, NULL, NULL, NULL),
(3, '2019-02-27 11:51:00', '', 1, 'full', '2e165fa0664e9fc146534bb0fab7a92c.csv', NULL, '', '', '', '', NULL, 17, 17, NULL, NULL, NULL, 5, NULL, NULL, NULL),
(4, '2023-11-14 10:37:00', '', 1, 'full', 'd403baeb08962a42e1d14a897e254aff.csv', NULL, '', '', '', '', NULL, 2, 2, NULL, NULL, NULL, 5, NULL, NULL, NULL),
(5, '2023-11-14 10:38:00', '', 2, 'full', 'e89a201e7ddd0400ec010bed14104840.csv', NULL, '', '', '', '', NULL, 2, 2, NULL, NULL, NULL, 5, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_stock_count_items`
--

CREATE TABLE `sma_stock_count_items` (
  `id` int(11) NOT NULL,
  `stock_count_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_code` varchar(50) DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `product_variant` varchar(55) DEFAULT NULL,
  `product_variant_id` int(11) DEFAULT NULL,
  `expected` decimal(15,4) NOT NULL,
  `counted` decimal(15,4) NOT NULL,
  `cost` decimal(25,4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sma_supplier`
--

CREATE TABLE `sma_supplier` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sma_supplier`
--

INSERT INTO `sma_supplier` (`id`, `name`, `phone`, `address`, `description`) VALUES
(1, 'Khan', '57438563478', 'dsahdjkhsajk', NULL),
(2, 'Salman', '0403213728', 'glasgow, uk', 'dsadsa'),
(3, 'Nafees', '03056184125', 'house 2 street 2', 'hdfsajkfldhsfjkdshfjksladhkcnvcxm,z.'),
(4, 'Ahmed', '5473854378', 'fhsdlfhsjk', 'm,nmnmnmnmnmnm');

-- --------------------------------------------------------

--
-- Table structure for table `sma_suspended_bills`
--

CREATE TABLE `sma_suspended_bills` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `customer_id` int(11) NOT NULL,
  `customer` varchar(55) DEFAULT NULL,
  `count` int(11) NOT NULL,
  `order_discount_id` varchar(20) DEFAULT NULL,
  `order_tax_id` int(11) DEFAULT NULL,
  `total` decimal(25,4) NOT NULL,
  `biller_id` int(11) DEFAULT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `suspend_note` varchar(255) DEFAULT NULL,
  `shipping` decimal(15,4) DEFAULT 0.0000,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sma_suspended_items`
--

CREATE TABLE `sma_suspended_items` (
  `id` int(11) NOT NULL,
  `suspend_id` int(11) UNSIGNED NOT NULL,
  `product_id` int(11) UNSIGNED NOT NULL,
  `product_code` varchar(55) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `net_unit_price` decimal(25,4) NOT NULL,
  `unit_price` decimal(25,4) NOT NULL,
  `quantity` decimal(15,4) DEFAULT 0.0000,
  `warehouse_id` int(11) DEFAULT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `tax_rate_id` int(11) DEFAULT NULL,
  `tax` varchar(55) DEFAULT NULL,
  `discount` varchar(55) DEFAULT NULL,
  `item_discount` decimal(25,4) DEFAULT NULL,
  `subtotal` decimal(25,4) NOT NULL,
  `serial_no` varchar(255) DEFAULT NULL,
  `option_id` int(11) DEFAULT NULL,
  `product_type` varchar(20) DEFAULT NULL,
  `real_unit_price` decimal(25,4) DEFAULT NULL,
  `product_unit_id` int(11) DEFAULT NULL,
  `product_unit_code` varchar(10) DEFAULT NULL,
  `unit_quantity` decimal(15,4) NOT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `gst` varchar(20) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sma_tax_rates`
--

CREATE TABLE `sma_tax_rates` (
  `id` int(11) NOT NULL,
  `name` varchar(55) NOT NULL,
  `code` varchar(10) DEFAULT NULL,
  `rate` decimal(12,4) NOT NULL,
  `type` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `sma_tax_rates`
--

INSERT INTO `sma_tax_rates` (`id`, `name`, `code`, `rate`, `type`) VALUES
(1, 'No Tax', 'NT', '0.0000', '2'),
(4, 'VAT @15%', 'VAT15%', '15.0000', '1');

-- --------------------------------------------------------

--
-- Table structure for table `sma_transfers`
--

CREATE TABLE `sma_transfers` (
  `id` int(11) NOT NULL,
  `transfer_no` varchar(55) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `from_warehouse_id` int(11) NOT NULL,
  `from_warehouse_code` varchar(55) NOT NULL,
  `from_warehouse_name` varchar(55) NOT NULL,
  `to_warehouse_id` int(11) NOT NULL,
  `to_warehouse_code` varchar(55) NOT NULL,
  `to_warehouse_name` varchar(55) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `total` decimal(25,4) DEFAULT NULL,
  `total_tax` decimal(25,4) DEFAULT NULL,
  `grand_total` decimal(25,4) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `status` varchar(55) NOT NULL DEFAULT 'pending',
  `shipping` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `attachment` varchar(55) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sma_transfer_items`
--

CREATE TABLE `sma_transfer_items` (
  `id` int(11) NOT NULL,
  `transfer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_code` varchar(55) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `option_id` int(11) DEFAULT NULL,
  `expiry` date DEFAULT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `tax_rate_id` int(11) DEFAULT NULL,
  `tax` varchar(55) DEFAULT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `net_unit_cost` decimal(25,4) DEFAULT NULL,
  `subtotal` decimal(25,4) DEFAULT NULL,
  `quantity_balance` decimal(15,4) NOT NULL,
  `unit_cost` decimal(25,4) DEFAULT NULL,
  `real_unit_cost` decimal(25,4) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `product_unit_id` int(11) DEFAULT NULL,
  `product_unit_code` varchar(10) DEFAULT NULL,
  `unit_quantity` decimal(15,4) NOT NULL,
  `gst` varchar(20) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sma_units`
--

CREATE TABLE `sma_units` (
  `id` int(11) NOT NULL,
  `code` varchar(10) NOT NULL,
  `name` varchar(55) NOT NULL,
  `symbol` varchar(100) NOT NULL,
  `base_unit` int(11) DEFAULT NULL,
  `operator` varchar(1) DEFAULT NULL,
  `unit_value` varchar(55) DEFAULT NULL,
  `operation_value` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `sma_units`
--

INSERT INTO `sma_units` (`id`, `code`, `name`, `symbol`, `base_unit`, `operator`, `unit_value`, `operation_value`) VALUES
(3, 'g', 'Gram', '', NULL, NULL, NULL, NULL),
(4, 'kg', 'Kilo Gram', '', 3, '*', NULL, '1000'),
(5, 'kg-1', 'Kilo gram', '', NULL, NULL, NULL, NULL),
(6, 'ton', 'Ton', '', 5, '*', NULL, '1000'),
(7, 'mound', 'Mound', '', 5, '*', NULL, '40');

-- --------------------------------------------------------

--
-- Table structure for table `sma_users`
--

CREATE TABLE `sma_users` (
  `id` int(11) UNSIGNED NOT NULL,
  `last_ip_address` varbinary(45) DEFAULT NULL,
  `ip_address` varbinary(45) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(40) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `activation_code` varchar(40) DEFAULT NULL,
  `forgotten_password_code` varchar(40) DEFAULT NULL,
  `forgotten_password_time` int(11) UNSIGNED DEFAULT NULL,
  `remember_code` varchar(40) DEFAULT NULL,
  `created_on` int(11) UNSIGNED NOT NULL,
  `last_login` int(11) UNSIGNED DEFAULT NULL,
  `active` tinyint(1) UNSIGNED DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `avatar` varchar(55) DEFAULT NULL,
  `gender` varchar(20) DEFAULT NULL,
  `group_id` int(10) UNSIGNED NOT NULL,
  `warehouse_id` int(10) UNSIGNED DEFAULT NULL,
  `biller_id` int(10) UNSIGNED DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `show_cost` tinyint(1) DEFAULT 0,
  `show_price` tinyint(1) DEFAULT 0,
  `award_points` int(11) DEFAULT 0,
  `view_right` tinyint(1) NOT NULL DEFAULT 0,
  `edit_right` tinyint(1) NOT NULL DEFAULT 0,
  `allow_discount` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `sma_users`
--

INSERT INTO `sma_users` (`id`, `last_ip_address`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `company`, `phone`, `avatar`, `gender`, `group_id`, `warehouse_id`, `biller_id`, `company_id`, `show_cost`, `show_price`, `award_points`, `view_right`, `edit_right`, `allow_discount`) VALUES
(2, 0x3131302e33392e392e313336, 0x34312e36302e39332e313233, 'als', '048c5ba91ed5326ba25dd2a3b54cd44981511395', NULL, 'attaurrehmaanbhatti687@gmail.com', NULL, '2cf94c9f8645ad5bf64e1d75b6e34d0f61fd29de', 1584356611, '380dd894182fda5a48c54889de207d4fea79bab6', 1533720330, 1699096732, 1, 'Umer', 'Farooq', 'ALS', '0092', NULL, 'male', 1, NULL, NULL, NULL, 0, 0, 0, 1, 0, 0),
(4, 0x3a3a31, 0x34312e36302e39332e313233, 'shary', '048c5ba91ed5326ba25dd2a3b54cd44981511395', NULL, 'shary@adroitLight.com', NULL, NULL, NULL, '9131eb7774fca9025aeadd7f774a848a50c2e3f8', 1533799295, 1539676621, 1, 'Shary', 'Tariq', 'ALS', '0092', NULL, 'male', 1, NULL, NULL, NULL, 0, 0, 0, 1, 0, 0),
(5, 0x3a3a31, 0x34312e36302e3131352e313431, 'nafees', '048c5ba91ed5326ba25dd2a3b54cd44981511395', NULL, 'test@adroitLight.com', NULL, NULL, NULL, '1634752cc2e3e730528104ce47d8d44a63f38a41', 1534798528, 1700117555, 1, 'Nafees', 'ahmed', 'BitGen.pvt.inc', '0403213728', NULL, 'male', 1, NULL, NULL, NULL, 0, 0, 0, 1, 0, 0),
(10, 0x3a3a31, 0x3a3a31, 'hamzee', 'fde6c1b47f0fceac43a4b9d6562d3aae19bc71ca', NULL, 'namzanaeem@gmail.com', NULL, NULL, NULL, NULL, 1700117521, 1700117538, 1, 'Hamza', 'Naeem', 'ALS', '789789789', NULL, 'male', 2, 0, 0, NULL, 0, 0, 0, 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `sma_user_branch`
--

CREATE TABLE `sma_user_branch` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `transfered_by` int(11) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sma_user_branch`
--

INSERT INTO `sma_user_branch` (`id`, `user_id`, `branch_id`, `transfered_by`, `active`, `created_at`, `updated_at`) VALUES
(25, 2, 4, 5, 1, '2023-11-14 13:42:42', '2023-11-14 13:42:42'),
(26, 4, 5, 5, 1, '2023-11-14 13:42:46', '2023-11-14 13:42:46'),
(27, 5, 6, 5, 1, '2023-11-14 13:42:50', '2023-11-14 13:42:50'),
(28, 5, 8, 5, 1, '2023-11-14 13:42:50', '2023-11-14 13:42:50');

-- --------------------------------------------------------

--
-- Table structure for table `sma_user_logins`
--

CREATE TABLE `sma_user_logins` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `ip_address` varbinary(16) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `sma_user_logins`
--

INSERT INTO `sma_user_logins` (`id`, `user_id`, `company_id`, `ip_address`, `login`, `time`) VALUES
(267, 5, NULL, 0x3131312e3131392e3138372e3536, 'testing', '2020-02-18 05:08:12'),
(268, 5, NULL, 0x3130332e3235352e352e3933, 'testing', '2020-02-18 11:55:39'),
(269, 5, NULL, 0x3130332e3235352e342e3335, 'testing', '2020-02-20 07:18:14'),
(270, 5, NULL, 0x3130332e3235352e342e3335, 'testing', '2020-02-20 10:12:52'),
(271, 5, NULL, 0x3130332e3235352e352e3530, 'testing', '2020-02-24 04:08:08'),
(272, 5, NULL, 0x3131312e3131392e3138372e3238, 'testing', '2020-02-26 05:15:26'),
(273, 5, NULL, 0x3131312e3131392e3138372e3238, 'testing', '2020-02-26 05:17:30'),
(274, 5, NULL, 0x3130332e3235352e352e3233, 'testing', '2020-02-27 07:40:17'),
(275, 5, NULL, 0x3130332e3235352e342e3830, 'testing', '2020-02-29 12:17:24'),
(276, 5, NULL, 0x3131312e3131392e3138372e3538, 'testing', '2020-03-03 09:15:27'),
(277, 5, NULL, 0x33392e36332e31372e313631, 'testing', '2020-03-16 11:12:48'),
(278, 5, NULL, 0x33392e36332e31372e313631, 'testing', '2020-03-16 11:20:53'),
(279, 5, NULL, 0x33392e33372e3139382e313731, 'testing', '2020-03-17 12:46:31'),
(280, 5, NULL, 0x33392e33372e3230382e313239, 'testing', '2020-03-17 16:14:36'),
(281, 5, NULL, 0x33392e33372e3230382e313239, 'testing', '2020-03-17 16:20:20'),
(282, 5, NULL, 0x33392e33372e3230382e313239, 'testing', '2020-03-18 07:07:36'),
(283, 5, NULL, 0x33392e33372e3232332e313333, 'testing', '2020-03-18 16:30:23'),
(284, 5, NULL, 0x3138322e3138362e3234362e313136, 'testing', '2020-05-18 06:13:39'),
(285, 5, NULL, 0x3138322e3138362e3234362e313136, 'testing', '2020-05-18 06:14:35'),
(286, 5, NULL, 0x3138322e3138362e3233322e3438, 'testing', '2020-05-31 06:14:03'),
(287, 5, NULL, 0x33392e36332e32352e3836, 'testing', '2020-06-05 15:29:40'),
(288, 5, NULL, 0x3131312e3131392e3138372e3239, 'testing', '2020-07-13 05:44:49'),
(289, 5, NULL, 0x3131312e3131392e3138372e3239, 'testing', '2020-07-13 05:48:14'),
(290, 5, NULL, 0x33392e33372e3139352e313431, 'testing', '2020-07-14 03:34:37'),
(291, 5, NULL, 0x3130332e3235352e342e3830, 'testing', '2020-07-19 10:15:35'),
(292, 5, NULL, 0x3130332e3235352e352e3630, 'testing', '2020-08-23 05:49:03'),
(293, 5, NULL, 0x3130332e3235352e352e3535, 'testing', '2020-08-29 05:55:00'),
(294, 5, NULL, 0x3131312e3131392e3138372e3532, 'testing', '2021-01-22 07:34:16'),
(295, 5, NULL, 0x3138322e3138362e3139362e313735, 'testing', '2021-01-23 15:43:20'),
(296, 5, NULL, 0x33392e33352e3234332e3534, 'testing', '2021-01-24 18:14:07'),
(297, 5, NULL, 0x3131312e3131392e3138372e3530, 'testing', '2021-01-25 04:47:26'),
(298, 5, NULL, 0x3131312e3131392e3138372e3233, 'testing', '2021-01-29 13:29:21'),
(299, 5, NULL, 0x3131312e3131392e3138372e3435, 'testing', '2021-02-02 11:43:18'),
(300, 5, NULL, 0x3131312e3131392e3138372e3435, 'testing', '2021-02-02 16:55:17'),
(301, 5, NULL, 0x3131312e3131392e3138372e3431, 'testing', '2021-02-03 14:47:40'),
(302, 5, NULL, 0x3131312e3131392e3138372e3431, 'testing', '2021-02-03 14:58:56'),
(303, 5, NULL, 0x3138322e3138362e3234362e313538, 'testing', '2021-02-05 14:01:57'),
(304, 5, NULL, 0x3131312e3131392e3138372e3434, 'testing', '2021-02-06 07:20:18'),
(305, 5, NULL, 0x3131312e3131392e3138372e3334, 'testing', '2021-02-12 05:22:18'),
(306, 5, NULL, 0x3131312e3131392e3138372e3330, 'testing', '2021-02-14 04:54:25'),
(307, 5, NULL, 0x3131312e3131392e3138372e3532, 'testing', '2021-02-15 04:51:35'),
(308, 5, NULL, 0x3131312e3131392e3138372e32, 'testing', '2021-02-15 10:32:06'),
(309, 5, NULL, 0x3131312e3131392e3138372e32, 'testing', '2021-02-15 15:08:27'),
(310, 5, NULL, 0x3131312e3131392e3138372e3436, 'testing', '2021-02-16 05:59:26'),
(311, 5, NULL, 0x3131312e3131392e3138372e3138, 'testing', '2021-02-19 16:12:08'),
(312, 5, NULL, 0x3131312e3131392e3138372e3430, 'testing', '2021-02-21 06:01:02'),
(313, 5, NULL, 0x3131312e3131392e3138372e3430, 'testing', '2021-02-21 10:07:23'),
(314, 5, NULL, 0x3131312e3131392e3138372e3437, 'testing', '2021-02-28 13:04:34'),
(315, 5, NULL, 0x3131312e3131392e3138372e3632, 'testing', '2021-03-07 06:17:48'),
(316, 5, NULL, 0x33392e33372e3230352e3433, 'testing', '2021-03-21 01:29:46'),
(317, 5, NULL, 0x3138322e3138362e3137302e32, 'testing', '2021-03-27 16:23:30'),
(318, 5, NULL, 0x3138322e3138362e3230302e313435, 'testing', '2021-05-30 05:25:44'),
(319, 5, NULL, 0x3134312e302e31312e3131, 'testing', '2021-06-15 11:58:10'),
(320, 5, NULL, 0x33392e36332e32342e3730, 'testing', '2021-06-25 23:56:54'),
(321, 5, NULL, 0x3131312e3131392e3138372e3538, 'testing', '2021-06-26 10:38:27'),
(322, 5, NULL, 0x3131312e3131392e3138372e3336, 'testing', '2021-06-27 08:13:43'),
(323, 5, NULL, 0x3131312e3131392e3138372e3336, 'testing', '2021-06-27 11:56:58'),
(324, 5, NULL, 0x3138322e3138362e3139362e323337, 'testing', '2021-06-27 15:55:04'),
(325, 5, NULL, 0x3131312e3131392e3138372e3137, 'testing', '2021-06-28 04:13:20'),
(326, 5, NULL, 0x3131312e3131392e3138372e3438, 'testing', '2021-06-28 12:11:29'),
(327, 5, NULL, 0x3138322e3138362e3137322e3734, 'testing', '2021-06-29 13:22:51'),
(328, 5, NULL, 0x3138322e3138362e3137342e313438, 'testing', '2021-07-05 18:40:53'),
(329, 5, NULL, 0x33392e35322e3233342e323131, 'testing', '2021-07-07 08:51:04'),
(330, 5, NULL, 0x3138322e3138362e3138372e313839, 'testing', '2021-07-17 00:08:13'),
(331, 5, NULL, 0x3138322e3138312e39302e323534, 'testing', '2021-07-26 13:32:48'),
(332, 5, NULL, 0x33392e35322e3230302e313030, 'testing', '2021-07-29 13:03:25'),
(333, 5, NULL, 0x3131312e3131392e3138372e33, 'testing', '2021-08-17 23:03:57'),
(334, 5, NULL, 0x3131312e3131392e3138372e3430, 'testing', '2021-08-27 08:11:47'),
(335, 5, NULL, 0x33392e36332e32362e313637, 'testing', '2021-09-02 19:05:28'),
(336, 5, NULL, 0x3138322e3138362e3231352e313030, 'testing', '2021-09-07 02:01:18'),
(337, 5, NULL, 0x3138322e3138362e3135382e313635, 'testing', '2021-09-17 13:38:28'),
(338, 5, NULL, 0x3138322e3138362e3135382e313635, 'testing', '2021-09-17 16:20:08'),
(339, 5, NULL, 0x3138322e3138362e3135382e313635, 'testing', '2021-09-17 16:29:17'),
(340, 5, NULL, 0x33392e36332e32372e313033, 'testing', '2021-09-20 04:29:43'),
(341, 5, NULL, 0x3130332e32362e38302e313739, 'testing', '2022-04-14 11:50:20'),
(342, 5, NULL, 0x3130332e3235352e342e3231, 'testing', '2022-04-14 13:10:44'),
(343, 5, NULL, 0x3131392e33302e38352e313933, 'testing', '2022-04-15 11:25:30'),
(344, 5, NULL, 0x3131392e33302e38352e313933, 'testing', '2022-04-16 00:25:25'),
(345, 5, NULL, 0x3130332e3235352e342e3634, 'testing', '2022-04-16 11:42:47'),
(346, 5, NULL, 0x3131312e3131392e3138372e3439, 'testing ', '2022-04-23 11:16:20'),
(347, 5, NULL, 0x3131392e33302e38352e313933, 'testing', '2022-05-02 11:30:18'),
(348, 5, NULL, 0x3130332e3235352e352e313133, 'testing', '2022-05-09 13:43:40'),
(349, 5, NULL, 0x3130332e3232312e3234362e3335, 'testing', '2022-05-09 13:46:53'),
(350, 5, NULL, 0x3130332e3232312e3234362e3335, 'testing', '2022-06-21 09:21:26'),
(351, 5, NULL, 0x3130332e3232312e3234362e323436, 'testing', '2022-07-26 18:14:44'),
(352, 5, NULL, 0x3130332e3232312e3234362e323436, 'testing', '2022-07-28 00:16:12'),
(353, 5, NULL, 0x3130332e3232312e3234362e323436, 'testing', '2022-08-25 01:14:09'),
(354, 5, NULL, 0x3130332e3232312e3234362e323436, 'testing', '2022-08-27 12:09:18'),
(355, 5, NULL, 0x3131312e3131392e3138372e3331, 'testing', '2022-08-29 06:54:49'),
(356, 5, NULL, 0x3130332e32362e38302e313739, 'testing', '2022-08-29 07:10:19'),
(357, 5, NULL, 0x3131312e3131392e3138372e3331, 'testing', '2022-08-29 09:22:27'),
(358, 5, NULL, 0x3131312e3131392e3138372e3331, 'testing', '2022-08-29 10:09:02'),
(359, 5, NULL, 0x3131312e3131392e3138372e3331, 'testing', '2022-08-29 10:39:03'),
(360, 5, NULL, 0x3131312e3131392e3138372e3331, 'testing', '2022-08-29 10:40:53'),
(361, 5, NULL, 0x3131312e3131392e3138372e3331, 'testing', '2022-08-29 10:43:00'),
(362, 5, NULL, 0x3131312e3131392e3138372e3331, 'testing', '2022-08-29 10:54:32'),
(363, 5, NULL, 0x3131312e3131392e3138372e3230, 'testing', '2022-09-03 06:23:47'),
(364, 5, NULL, 0x3131312e3131392e3138372e3230, 'testing', '2022-09-03 09:49:13'),
(365, 5, NULL, 0x3131312e3131392e3138372e3436, 'testing', '2022-09-03 10:51:16'),
(366, 5, NULL, 0x3131312e3131392e3138372e3438, 'testing', '2022-09-05 07:59:03'),
(367, 5, NULL, 0x3131312e3131392e3138372e3434, 'testing', '2022-09-05 10:05:23'),
(368, 5, NULL, 0x3131312e3131392e3138372e3434, 'testing', '2022-09-05 10:09:44'),
(369, 5, NULL, 0x3131312e3131392e3138372e3434, 'testing', '2022-09-05 10:31:13'),
(370, 5, NULL, 0x3131312e3131392e3138372e3438, 'testing', '2022-09-05 11:20:13'),
(371, 5, NULL, 0x3131312e3131392e3138372e3235, 'testing', '2022-09-06 06:29:11'),
(372, 5, NULL, 0x3131312e3131392e3138372e3235, 'testing ', '2022-09-06 06:36:01'),
(373, 5, NULL, 0x3131312e3131392e3138372e3233, 'testing', '2022-09-06 07:53:21'),
(374, 5, NULL, 0x3130332e32362e38302e313739, 'testing', '2022-09-06 11:23:10'),
(375, 5, NULL, 0x3131312e3131392e3138372e3233, 'testing ', '2022-09-06 12:23:48'),
(376, 5, NULL, 0x3131312e3131392e3138372e3334, 'testing', '2022-09-06 12:42:55'),
(377, 5, NULL, 0x3131312e3131392e3138372e3239, 'testing', '2022-09-08 09:43:31'),
(378, 5, NULL, 0x3131312e3131392e3138372e36, 'testing', '2022-09-15 07:55:59'),
(379, 5, NULL, 0x3131312e3131392e3138372e36, 'testing ', '2022-09-15 09:21:03'),
(380, 5, NULL, 0x3131312e3131392e3138372e3632, 'testing ', '2022-09-17 05:35:38'),
(381, 5, NULL, 0x3130332e3139312e3131392e38, 'testing ', '2022-10-19 17:50:25'),
(382, 5, NULL, 0x3130332e3139312e3131392e38, 'testing', '2022-10-19 18:31:03'),
(383, 5, NULL, 0x3130332e3235352e342e3738, 'testing', '2022-10-20 10:44:00'),
(384, 5, NULL, 0x3130332e3235352e342e323435, 'testing', '2022-10-22 10:00:08'),
(385, 5, NULL, 0x3130332e3235352e342e3537, 'testing', '2022-10-24 04:49:28'),
(386, 5, NULL, 0x3130332e3139312e3131392e38, 'testing', '2022-10-24 08:46:34'),
(387, 5, NULL, 0x3130332e3235352e342e3537, 'testing', '2022-10-24 09:55:51'),
(388, 5, NULL, 0x3130332e3235352e342e3537, 'testing ', '2022-10-24 11:24:45'),
(389, 5, NULL, 0x3130332e32362e38302e313739, 'testing', '2022-10-24 13:04:58'),
(390, 5, NULL, 0x3130332e3139312e3131392e38, 'testing', '2022-10-24 13:12:29'),
(391, 5, NULL, 0x3131312e3131392e3138372e34, 'testing ', '2022-10-24 14:56:42'),
(392, 5, NULL, 0x3130332e3139312e3131392e38, 'testing', '2022-10-24 16:54:57'),
(393, 5, NULL, 0x3130332e3139312e3131392e38, 'testing', '2022-10-25 17:35:35'),
(394, 5, NULL, 0x3131312e3131392e3138372e3630, 'testing', '2022-10-26 07:55:26'),
(395, 5, NULL, 0x3131312e3131392e3138372e3630, 'testing ', '2022-10-26 08:09:29'),
(396, 5, NULL, 0x3131312e3131392e3138372e3630, 'testing', '2022-10-26 09:00:17'),
(397, 5, NULL, 0x3131312e3131392e3138372e3138, 'testing', '2022-10-27 05:38:53'),
(398, 5, NULL, 0x3131312e3131392e3138372e3138, 'testing', '2022-10-27 06:42:40'),
(399, 5, NULL, 0x3131312e3131392e3138372e3138, 'testing', '2022-10-27 09:23:13'),
(400, 5, NULL, 0x3131312e3131392e3138372e31, 'testing ', '2022-10-28 16:59:25'),
(401, 5, NULL, 0x3131312e3131392e3138372e3333, 'testing', '2022-10-29 06:14:22'),
(402, 5, NULL, 0x3131312e3131392e3138372e3333, 'testing', '2022-10-29 09:27:50'),
(403, 5, NULL, 0x3131312e3131392e3138372e3138, 'testing', '2022-10-29 11:56:43'),
(404, 5, NULL, 0x3130332e3139312e3131392e38, 'testing', '2022-10-29 13:03:34'),
(405, 5, NULL, 0x3130332e32362e38302e313739, 'testing', '2022-10-29 13:17:03'),
(406, 5, NULL, 0x3130332e3139312e3131392e38, 'testing', '2022-10-29 22:37:40'),
(407, 5, NULL, 0x3130332e3139312e3131392e38, 'testing', '2022-10-30 00:58:00'),
(408, 5, NULL, 0x3131312e3131392e3138372e3630, 'testing', '2022-10-30 04:14:41'),
(409, 5, NULL, 0x3131312e3131392e3138372e3630, 'testing', '2022-10-30 07:51:17'),
(410, 5, NULL, 0x3131312e3131392e3138372e3539, 'testing', '2022-10-30 10:02:52'),
(411, 5, NULL, 0x3130332e3139312e3131392e38, 'testing', '2022-10-30 16:44:56'),
(412, 5, NULL, 0x3131312e3131392e3138372e3630, 'testing', '2022-10-31 04:00:06'),
(413, 5, NULL, 0x3131312e3131392e3138372e3630, 'testing', '2022-10-31 09:55:47'),
(414, 5, NULL, 0x3131312e3131392e3138372e3630, 'testing', '2022-10-31 11:27:45'),
(415, 5, NULL, 0x3130332e3139312e3131392e38, 'testing', '2022-10-31 18:39:32'),
(416, 5, NULL, 0x3131312e3131392e3138372e3336, 'testing', '2022-11-01 04:00:46'),
(417, 5, NULL, 0x3131312e3131392e3138372e3437, 'testing ', '2022-11-03 15:56:34'),
(418, 5, NULL, 0x3131312e3131392e3138372e32, 'testing ', '2022-11-06 06:35:48'),
(419, 5, NULL, 0x3131312e3131392e3138372e32, 'testing', '2022-11-06 06:42:04'),
(420, 5, NULL, 0x3131312e3131392e3138372e32, 'testing', '2022-11-06 07:32:07'),
(421, 5, NULL, 0x3131312e3131392e3138372e32, 'testing', '2022-11-06 10:38:29'),
(422, 5, NULL, 0x3131312e3131392e3138352e35, 'testing', '2022-11-14 10:18:07'),
(423, 5, NULL, 0x3131312e3131392e3138372e3431, 'testing', '2022-11-16 06:38:26'),
(424, 5, NULL, 0x3131312e3131392e3138372e3431, 'testing', '2022-11-16 07:43:37'),
(425, 5, NULL, 0x3131312e3131392e3138372e3231, 'testing', '2022-11-16 10:23:58'),
(426, 5, NULL, 0x3131312e3131392e3138372e3134, 'testing', '2022-11-16 12:36:29'),
(427, 5, NULL, 0x3131312e3131392e3138372e3436, 'testing', '2022-11-17 05:25:53'),
(428, 5, NULL, 0x3131312e3131392e3138372e3436, 'testing', '2022-11-17 10:18:53'),
(429, 5, NULL, 0x3131312e3131392e3138372e3535, 'testing', '2022-11-17 11:15:26'),
(430, 5, NULL, 0x3131312e3131392e3138372e3535, 'testing', '2022-11-17 11:48:13'),
(431, 5, NULL, 0x3131312e3131392e3138372e3535, 'testing', '2022-11-17 12:47:33'),
(432, 5, NULL, 0x3131312e3131392e3138372e3137, 'testing', '2022-11-19 06:14:18'),
(433, 5, NULL, 0x3131312e3131392e3138372e3137, 'testing', '2022-11-19 07:05:27'),
(434, 5, NULL, 0x34352e3131362e3233332e323331, 'testing', '2022-11-19 09:51:58'),
(435, 5, NULL, 0x34352e3131362e3233332e323331, 'testing', '2022-11-19 11:09:59'),
(436, 5, NULL, 0x3131312e3131392e3138372e3337, 'testing', '2022-11-21 04:45:01'),
(437, 5, NULL, 0x3131312e3131392e3138372e3337, 'testing', '2022-11-21 06:29:36'),
(438, 5, NULL, 0x3131312e3131392e3138372e3337, 'testing', '2022-11-21 09:52:26'),
(439, 5, NULL, 0x3131312e3131392e3138372e3337, 'testing', '2022-11-21 11:16:25'),
(440, 5, NULL, 0x3130332e32362e38302e313739, 'testing', '2022-11-24 09:24:45'),
(441, 5, NULL, 0x3130332e32362e38302e313739, 'testing', '2022-11-24 10:02:04'),
(442, 5, NULL, 0x3130332e32362e38302e313739, 'testing', '2022-11-25 09:24:23'),
(443, 5, NULL, 0x3130332e32362e38302e313739, 'testing', '2022-11-25 09:27:40'),
(444, 5, NULL, 0x3230332e3138392e3232392e323032, 'testing', '2022-11-26 08:01:35'),
(445, 5, NULL, 0x3230332e3138392e3232392e323032, 'testing', '2022-11-26 10:04:07'),
(446, 5, NULL, 0x3131312e3131392e3138372e3332, 'testing', '2022-11-29 07:16:56'),
(447, 5, NULL, 0x3130332e32362e38302e313739, 'testing', '2022-11-29 10:41:48'),
(448, 5, NULL, 0x3131312e3131392e3138372e3332, 'testing', '2022-11-29 11:11:28'),
(449, 5, NULL, 0x3131312e3131392e3138372e3332, 'testing', '2022-11-29 12:30:51'),
(450, 5, NULL, 0x3130332e32362e38302e313739, 'testing', '2022-11-30 07:32:28'),
(451, 5, NULL, 0x3131312e3131392e3138372e3532, 'testing', '2022-11-30 07:40:06'),
(452, 5, NULL, 0x3131312e3131392e3138372e3134, 'testing', '2022-12-03 10:15:24'),
(453, 5, NULL, 0x3132312e39312e34332e313238, 'testing', '2022-12-04 07:03:17'),
(454, 5, NULL, 0x3131312e3131392e3138372e3438, 'testing ', '2022-12-06 11:08:30'),
(455, 5, NULL, 0x3130332e32362e38302e313739, 'testing', '2022-12-06 11:20:15'),
(456, 5, NULL, 0x3131312e3131392e3138372e3533, 'testing', '2022-12-14 09:28:09'),
(457, 5, NULL, 0x3131312e3131392e3138372e34, 'testing', '2022-12-17 06:14:20'),
(458, 5, NULL, 0x3131312e3131392e3138372e3538, 'testing', '2022-12-18 05:10:41'),
(459, 5, NULL, 0x3230332e3138392e3232392e3537, 'testing', '2022-12-19 07:18:50'),
(460, 5, NULL, 0x3131312e3131392e3138372e3331, 'testing', '2022-12-19 11:19:09'),
(461, 5, NULL, 0x3131312e3131392e3138372e38, 'testing', '2022-12-20 05:30:18'),
(462, 5, NULL, 0x3131312e3131392e3138372e3430, 'testing', '2022-12-20 07:06:47'),
(463, 5, NULL, 0x3131312e3131392e3138372e3430, 'testing', '2022-12-20 09:51:23'),
(464, 5, NULL, 0x3131312e3131392e3138372e3430, 'testing', '2022-12-20 11:44:22'),
(465, 5, NULL, 0x3131312e3131392e3138372e34, 'testing', '2022-12-21 05:33:24'),
(466, 5, NULL, 0x3130332e32362e38302e313739, 'testing', '2022-12-21 12:54:34'),
(467, 5, NULL, 0x3131312e3131392e3138372e3233, 'testing', '2022-12-24 05:51:44'),
(468, 5, NULL, 0x3130332e3139312e3131382e3239, 'testing', '2022-12-26 13:11:29'),
(469, 5, NULL, 0x3130332e32362e38302e313739, 'testing', '2022-12-26 15:30:39'),
(470, 5, NULL, 0x3130332e3139312e3131382e3239, 'testing', '2022-12-27 19:00:15'),
(471, 5, NULL, 0x3131312e3131392e3138372e3633, 'testing', '2022-12-28 09:54:46'),
(472, 5, NULL, 0x3131312e3131392e3138372e3633, 'testing', '2022-12-28 11:13:22'),
(473, 5, NULL, 0x3131312e3131392e3138372e3633, 'testing', '2022-12-28 11:28:11'),
(474, 5, NULL, 0x3130332e32362e38302e313739, 'testing', '2022-12-28 13:29:09'),
(475, 5, NULL, 0x3130332e32362e38302e313739, 'testing', '2022-12-30 14:44:20'),
(476, 5, NULL, 0x3130332e3139312e3131382e3239, 'testing', '2022-12-31 02:29:29'),
(477, 5, NULL, 0x3131312e3131392e3138372e3439, 'testing', '2022-12-31 06:15:00'),
(478, 5, NULL, 0x3130332e3139312e3131382e3239, 'testing ', '2022-12-31 16:50:08'),
(479, 5, NULL, 0x3130332e3139312e3131382e3239, 'TESTING', '2023-01-15 02:11:09'),
(480, 5, NULL, 0x3130332e3235352e342e3135, 'testing', '2023-01-15 11:34:51'),
(481, 5, NULL, 0x3130332e3235352e352e3834, 'testing', '2023-01-17 11:47:39'),
(482, 5, NULL, 0x3131312e3131392e3138372e3631, 'testing', '2023-02-13 12:19:23'),
(483, 5, NULL, 0x3131312e3131392e3138372e32, 'testing', '2023-03-15 10:38:06'),
(484, 5, NULL, 0x3130332e3139312e3131382e3236, 'testing', '2023-03-31 13:06:40'),
(485, 5, NULL, 0x3232332e3132332e342e313839, 'testing', '2023-04-01 07:26:55'),
(486, 5, NULL, 0x3232332e3132332e33392e3233, 'testing', '2023-05-01 12:36:07'),
(487, 5, NULL, 0x3232332e3132332e31322e3834, 'testing', '2023-06-12 12:43:05'),
(488, 5, NULL, 0x35392e3130332e3139312e323233, 'testing', '2023-09-29 02:04:08'),
(489, 5, NULL, 0x37322e3235352e34322e313533, 'testing', '2023-10-05 08:17:59'),
(490, 2, NULL, 0x37322e3235352e34322e313533, 'als', '2023-10-11 12:59:33'),
(491, 2, NULL, 0x3131302e33392e31332e3734, 'als', '2023-10-11 13:41:36'),
(492, 2, NULL, 0x37322e3235352e34322e313533, 'als', '2023-10-12 05:26:14'),
(493, 2, NULL, 0x37322e3235352e34322e313533, 'als', '2023-10-18 07:43:02'),
(494, 2, NULL, 0x3131302e33392e31332e3734, 'als', '2023-10-18 13:34:01'),
(495, 5, NULL, 0x3232332e3132332e38362e323039, 'testing', '2023-10-18 13:34:21'),
(496, 5, NULL, 0x3130332e34372e3138302e313933, 'testing', '2023-10-19 09:47:45'),
(497, 2, NULL, 0x37322e3235352e34322e313533, 'als', '2023-10-19 12:29:32'),
(498, 5, NULL, 0x3130332e3132322e3232332e3737, 'testing', '2023-10-20 04:32:43'),
(499, 2, NULL, 0x37322e3235352e34322e313533, 'als', '2023-10-20 05:38:18'),
(500, 2, NULL, 0x3131302e33392e31332e3734, 'als', '2023-10-20 18:06:43'),
(501, 2, NULL, 0x3131302e33392e31332e3734, 'als', '2023-10-21 06:09:17'),
(502, 5, NULL, 0x37322e3235352e34322e313533, 'testing', '2023-10-21 10:05:19'),
(503, 2, NULL, 0x3131302e33392e31332e3734, 'als', '2023-10-21 15:15:35'),
(504, 2, NULL, 0x3131302e33392e31332e3734, 'als', '2023-10-26 04:15:12'),
(505, 2, NULL, 0x3131302e33392e31332e3734, 'als', '2023-10-26 09:16:20'),
(506, 2, NULL, 0x37322e3235352e34322e313533, 'als', '2023-11-03 05:53:20'),
(507, 2, NULL, 0x37322e3235352e34322e313533, 'als', '2023-11-03 05:55:58'),
(508, 2, NULL, 0x37322e3235352e34322e313533, 'als', '2023-11-03 06:54:08'),
(509, 5, NULL, 0x3130332e34372e3138302e313932, 'testing', '2023-11-03 07:36:54'),
(510, 2, NULL, 0x37322e3235352e34322e313533, 'als', '2023-11-03 13:10:10'),
(511, 2, NULL, 0x3131302e33392e392e313336, 'als', '2023-11-03 16:17:34'),
(512, 2, NULL, 0x3131302e33392e392e313336, 'Als', '2023-11-03 17:22:52'),
(513, 2, NULL, 0x3131302e33392e392e313336, 'als', '2023-11-04 06:47:23'),
(514, 2, NULL, 0x3131302e33392e392e313336, 'als', '2023-11-04 11:18:52'),
(515, 6, NULL, 0x3a3a31, 'nafees1431@gmail.com', '2023-11-07 07:26:24'),
(516, 6, NULL, 0x3a3a31, 'nafees1431@gmail.com', '2023-11-08 05:28:25'),
(517, 6, NULL, 0x3a3a31, 'nafees1431@gmail.com', '2023-11-08 09:53:00'),
(518, 6, NULL, 0x3a3a31, 'nafees1431@gmail.com', '2023-11-09 06:38:42'),
(519, 6, NULL, 0x3a3a31, 'nafees1431@gmail.com', '2023-11-09 11:04:39'),
(520, 6, NULL, 0x3a3a31, 'nafees1431@gmail.com', '2023-11-09 11:30:35'),
(521, 5, NULL, 0x3a3a31, 'test@adroitLight.com', '2023-11-10 06:14:45'),
(522, 5, NULL, 0x3a3a31, 'test@adroitLight.com', '2023-11-10 07:13:42'),
(523, 9, NULL, 0x3a3a31, 'nafees1431@gmail.com', '2023-11-10 07:43:00'),
(524, 5, NULL, 0x3a3a31, 'test@adroitLight.com', '2023-11-10 07:43:17'),
(525, 5, NULL, 0x3a3a31, 'test@adroitLight.com', '2023-11-10 09:22:57'),
(526, 5, NULL, 0x3a3a31, 'test@adroitLight.com', '2023-11-13 05:10:40'),
(527, 5, NULL, 0x3a3a31, 'test@adroitLight.com', '2023-11-13 10:32:11'),
(528, 5, NULL, 0x3a3a31, 'test@adroitLight.com', '2023-11-14 05:20:55'),
(529, 5, NULL, 0x3a3a31, 'test@adroitLight.com', '2023-11-14 08:10:36'),
(530, 5, NULL, 0x3a3a31, 'test@adroitLight.com', '2023-11-14 08:48:15'),
(531, 5, NULL, 0x3a3a31, 'test@adroitLight.com', '2023-11-14 08:53:46'),
(532, 5, NULL, 0x3a3a31, 'test@adroitLight.com', '2023-11-14 09:18:53'),
(533, 5, NULL, 0x3a3a31, 'test@adroitLight.com', '2023-11-14 09:26:01'),
(534, 5, NULL, 0x3a3a31, 'test@adroitLight.com', '2023-11-15 10:03:51'),
(535, 5, NULL, 0x3a3a31, 'test@adroitLight.com', '2023-11-16 06:32:18'),
(536, 5, NULL, 0x3a3a31, 'test@adroitLight.com', '2023-11-16 06:38:38'),
(537, 5, NULL, 0x3a3a31, 'test@adroitLight.com', '2023-11-16 06:43:29'),
(538, 10, NULL, 0x3a3a31, 'hamzee', '2023-11-16 06:52:18'),
(539, 5, NULL, 0x3a3a31, 'test@adroitLight.com', '2023-11-16 06:52:35');

-- --------------------------------------------------------

--
-- Table structure for table `sma_variants`
--

CREATE TABLE `sma_variants` (
  `id` int(11) NOT NULL,
  `name` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `sma_variants`
--

INSERT INTO `sma_variants` (`id`, `name`) VALUES
(16, 'Basic'),
(17, 'Mid'),
(18, 'Premium');

-- --------------------------------------------------------

--
-- Table structure for table `sma_warehouses`
--

CREATE TABLE `sma_warehouses` (
  `id` int(11) NOT NULL,
  `code` varchar(50) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `map` varchar(255) DEFAULT NULL,
  `phone` varchar(55) DEFAULT NULL,
  `email` varchar(55) DEFAULT NULL,
  `price_group_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `sma_warehouses`
--

INSERT INTO `sma_warehouses` (`id`, `code`, `name`, `address`, `map`, `phone`, `email`, `price_group_id`) VALUES
(3, 'lhr', 'Lahore', '<p>jkl</p>', NULL, '62378', 'lahore@gmail.com', 1),
(4, 'grw', 'Gujranwala', '<p>7897698</p>', NULL, '809890', 'guj@gmail.com', 1),
(5, 'isl', 'Islamabad', '<p>dsdadsadsa</p>', NULL, '90890', 'isl@gmail.com', 1);

-- --------------------------------------------------------

--
-- Table structure for table `sma_warehouses_products`
--

CREATE TABLE `sma_warehouses_products` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `rack` varchar(55) DEFAULT NULL,
  `avg_cost` decimal(25,4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `sma_warehouses_products`
--

INSERT INTO `sma_warehouses_products` (`id`, `product_id`, `warehouse_id`, `quantity`, `rack`, `avg_cost`) VALUES
(527, 597, 4, '19.0000', NULL, '100.0000'),
(528, 597, 5, '100.0000', NULL, '100.0000'),
(529, 597, 3, '0.0000', NULL, '100.0000'),
(530, 598, 4, '119.0000', NULL, '2760.5042'),
(531, 598, 3, '0.0000', NULL, '1500.0000'),
(532, 598, 5, '0.0000', NULL, '1500.0000');

-- --------------------------------------------------------

--
-- Table structure for table `sma_warehouses_products_variants`
--

CREATE TABLE `sma_warehouses_products_variants` (
  `id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `rack` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sma_wishlist`
--

CREATE TABLE `sma_wishlist` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `sma_addresses`
--
ALTER TABLE `sma_addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_id` (`company_id`);

--
-- Indexes for table `sma_adjustments`
--
ALTER TABLE `sma_adjustments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `warehouse_id` (`warehouse_id`);

--
-- Indexes for table `sma_adjustment_items`
--
ALTER TABLE `sma_adjustment_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `adjustment_id` (`adjustment_id`);

--
-- Indexes for table `sma_api_keys`
--
ALTER TABLE `sma_api_keys`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_api_limits`
--
ALTER TABLE `sma_api_limits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_api_logs`
--
ALTER TABLE `sma_api_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_branches`
--
ALTER TABLE `sma_branches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_brands`
--
ALTER TABLE `sma_brands`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `sma_calendar`
--
ALTER TABLE `sma_calendar`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_captcha`
--
ALTER TABLE `sma_captcha`
  ADD PRIMARY KEY (`captcha_id`),
  ADD KEY `word` (`word`);

--
-- Indexes for table `sma_cart`
--
ALTER TABLE `sma_cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_cash_categories`
--
ALTER TABLE `sma_cash_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `sma_cash_head`
--
ALTER TABLE `sma_cash_head`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_cash_management`
--
ALTER TABLE `sma_cash_management`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_categories`
--
ALTER TABLE `sma_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `sma_cheques_payments`
--
ALTER TABLE `sma_cheques_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_combo_items`
--
ALTER TABLE `sma_combo_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_companies`
--
ALTER TABLE `sma_companies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `group_id` (`group_id`),
  ADD KEY `group_id_2` (`group_id`);

--
-- Indexes for table `sma_costing`
--
ALTER TABLE `sma_costing`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_currencies`
--
ALTER TABLE `sma_currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_customer_groups`
--
ALTER TABLE `sma_customer_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_date_format`
--
ALTER TABLE `sma_date_format`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_deliveries`
--
ALTER TABLE `sma_deliveries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_deposits`
--
ALTER TABLE `sma_deposits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_expenses`
--
ALTER TABLE `sma_expenses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_expense_categories`
--
ALTER TABLE `sma_expense_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `sma_gift_cards`
--
ALTER TABLE `sma_gift_cards`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `card_no` (`card_no`);

--
-- Indexes for table `sma_gift_card_topups`
--
ALTER TABLE `sma_gift_card_topups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `card_id` (`card_id`);

--
-- Indexes for table `sma_groups`
--
ALTER TABLE `sma_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_login_attempts`
--
ALTER TABLE `sma_login_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_notifications`
--
ALTER TABLE `sma_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_order_ref`
--
ALTER TABLE `sma_order_ref`
  ADD PRIMARY KEY (`ref_id`);

--
-- Indexes for table `sma_pages`
--
ALTER TABLE `sma_pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_payments`
--
ALTER TABLE `sma_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_paypal`
--
ALTER TABLE `sma_paypal`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_permissions`
--
ALTER TABLE `sma_permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_pos_register`
--
ALTER TABLE `sma_pos_register`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_pos_settings`
--
ALTER TABLE `sma_pos_settings`
  ADD PRIMARY KEY (`pos_id`);

--
-- Indexes for table `sma_price_groups`
--
ALTER TABLE `sma_price_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `sma_printers`
--
ALTER TABLE `sma_printers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_products`
--
ALTER TABLE `sma_products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `id` (`id`),
  ADD KEY `id_2` (`id`),
  ADD KEY `category_id_2` (`category_id`),
  ADD KEY `unit` (`unit`),
  ADD KEY `brand` (`brand`);

--
-- Indexes for table `sma_product_photos`
--
ALTER TABLE `sma_product_photos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_product_prices`
--
ALTER TABLE `sma_product_prices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `price_group_id` (`price_group_id`);

--
-- Indexes for table `sma_product_variants`
--
ALTER TABLE `sma_product_variants`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_purchases`
--
ALTER TABLE `sma_purchases`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `sma_purchase_items`
--
ALTER TABLE `sma_purchase_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchase_id` (`purchase_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `sma_quotes`
--
ALTER TABLE `sma_quotes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `sma_quote_items`
--
ALTER TABLE `sma_quote_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quote_id` (`quote_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `sma_returns`
--
ALTER TABLE `sma_returns`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `sma_return_items`
--
ALTER TABLE `sma_return_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `return_id` (`return_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `product_id_2` (`product_id`,`return_id`),
  ADD KEY `return_id_2` (`return_id`,`product_id`);

--
-- Indexes for table `sma_sales`
--
ALTER TABLE `sma_sales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `sma_sale_items`
--
ALTER TABLE `sma_sale_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sale_id` (`sale_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `product_id_2` (`product_id`,`sale_id`),
  ADD KEY `sale_id_2` (`sale_id`,`product_id`);

--
-- Indexes for table `sma_sessions`
--
ALTER TABLE `sma_sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ci_sessions_timestamp` (`timestamp`);

--
-- Indexes for table `sma_settings`
--
ALTER TABLE `sma_settings`
  ADD PRIMARY KEY (`setting_id`);

--
-- Indexes for table `sma_shop_settings`
--
ALTER TABLE `sma_shop_settings`
  ADD PRIMARY KEY (`shop_id`);

--
-- Indexes for table `sma_skrill`
--
ALTER TABLE `sma_skrill`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_sms_settings`
--
ALTER TABLE `sma_sms_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_stock_counts`
--
ALTER TABLE `sma_stock_counts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `warehouse_id` (`warehouse_id`);

--
-- Indexes for table `sma_stock_count_items`
--
ALTER TABLE `sma_stock_count_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stock_count_id` (`stock_count_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `sma_supplier`
--
ALTER TABLE `sma_supplier`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_suspended_bills`
--
ALTER TABLE `sma_suspended_bills`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_suspended_items`
--
ALTER TABLE `sma_suspended_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_tax_rates`
--
ALTER TABLE `sma_tax_rates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_transfers`
--
ALTER TABLE `sma_transfers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `sma_transfer_items`
--
ALTER TABLE `sma_transfer_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transfer_id` (`transfer_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `sma_units`
--
ALTER TABLE `sma_units`
  ADD PRIMARY KEY (`id`),
  ADD KEY `base_unit` (`base_unit`);

--
-- Indexes for table `sma_users`
--
ALTER TABLE `sma_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `group_id` (`group_id`,`warehouse_id`,`biller_id`),
  ADD KEY `group_id_2` (`group_id`,`company_id`);

--
-- Indexes for table `sma_user_branch`
--
ALTER TABLE `sma_user_branch`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_user_logins`
--
ALTER TABLE `sma_user_logins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_variants`
--
ALTER TABLE `sma_variants`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_warehouses`
--
ALTER TABLE `sma_warehouses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `sma_warehouses_products`
--
ALTER TABLE `sma_warehouses_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `warehouse_id` (`warehouse_id`);

--
-- Indexes for table `sma_warehouses_products_variants`
--
ALTER TABLE `sma_warehouses_products_variants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `option_id` (`option_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `warehouse_id` (`warehouse_id`);

--
-- Indexes for table `sma_wishlist`
--
ALTER TABLE `sma_wishlist`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `sma_addresses`
--
ALTER TABLE `sma_addresses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sma_adjustments`
--
ALTER TABLE `sma_adjustments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `sma_adjustment_items`
--
ALTER TABLE `sma_adjustment_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `sma_api_keys`
--
ALTER TABLE `sma_api_keys`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_api_limits`
--
ALTER TABLE `sma_api_limits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_api_logs`
--
ALTER TABLE `sma_api_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `sma_branches`
--
ALTER TABLE `sma_branches`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `sma_brands`
--
ALTER TABLE `sma_brands`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `sma_calendar`
--
ALTER TABLE `sma_calendar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sma_captcha`
--
ALTER TABLE `sma_captcha`
  MODIFY `captcha_id` bigint(13) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_cash_categories`
--
ALTER TABLE `sma_cash_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sma_cash_head`
--
ALTER TABLE `sma_cash_head`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sma_cash_management`
--
ALTER TABLE `sma_cash_management`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `sma_categories`
--
ALTER TABLE `sma_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `sma_cheques_payments`
--
ALTER TABLE `sma_cheques_payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=96;

--
-- AUTO_INCREMENT for table `sma_combo_items`
--
ALTER TABLE `sma_combo_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8916;

--
-- AUTO_INCREMENT for table `sma_companies`
--
ALTER TABLE `sma_companies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `sma_costing`
--
ALTER TABLE `sma_costing`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `sma_currencies`
--
ALTER TABLE `sma_currencies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sma_customer_groups`
--
ALTER TABLE `sma_customer_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sma_date_format`
--
ALTER TABLE `sma_date_format`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `sma_deliveries`
--
ALTER TABLE `sma_deliveries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_deposits`
--
ALTER TABLE `sma_deposits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sma_expenses`
--
ALTER TABLE `sma_expenses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sma_expense_categories`
--
ALTER TABLE `sma_expense_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sma_gift_cards`
--
ALTER TABLE `sma_gift_cards`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sma_gift_card_topups`
--
ALTER TABLE `sma_gift_card_topups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_groups`
--
ALTER TABLE `sma_groups`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `sma_login_attempts`
--
ALTER TABLE `sma_login_attempts`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `sma_notifications`
--
ALTER TABLE `sma_notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_order_ref`
--
ALTER TABLE `sma_order_ref`
  MODIFY `ref_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sma_pages`
--
ALTER TABLE `sma_pages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_payments`
--
ALTER TABLE `sma_payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `sma_permissions`
--
ALTER TABLE `sma_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sma_pos_register`
--
ALTER TABLE `sma_pos_register`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `sma_price_groups`
--
ALTER TABLE `sma_price_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sma_printers`
--
ALTER TABLE `sma_printers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_products`
--
ALTER TABLE `sma_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=599;

--
-- AUTO_INCREMENT for table `sma_product_photos`
--
ALTER TABLE `sma_product_photos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_product_prices`
--
ALTER TABLE `sma_product_prices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_product_variants`
--
ALTER TABLE `sma_product_variants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_purchases`
--
ALTER TABLE `sma_purchases`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `sma_purchase_items`
--
ALTER TABLE `sma_purchase_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=542;

--
-- AUTO_INCREMENT for table `sma_quotes`
--
ALTER TABLE `sma_quotes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_quote_items`
--
ALTER TABLE `sma_quote_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_returns`
--
ALTER TABLE `sma_returns`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_return_items`
--
ALTER TABLE `sma_return_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_sales`
--
ALTER TABLE `sma_sales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sma_sale_items`
--
ALTER TABLE `sma_sale_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `sma_sms_settings`
--
ALTER TABLE `sma_sms_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sma_stock_counts`
--
ALTER TABLE `sma_stock_counts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `sma_stock_count_items`
--
ALTER TABLE `sma_stock_count_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_supplier`
--
ALTER TABLE `sma_supplier`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sma_suspended_bills`
--
ALTER TABLE `sma_suspended_bills`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_suspended_items`
--
ALTER TABLE `sma_suspended_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_tax_rates`
--
ALTER TABLE `sma_tax_rates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sma_transfers`
--
ALTER TABLE `sma_transfers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_transfer_items`
--
ALTER TABLE `sma_transfer_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_units`
--
ALTER TABLE `sma_units`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `sma_users`
--
ALTER TABLE `sma_users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `sma_user_branch`
--
ALTER TABLE `sma_user_branch`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `sma_user_logins`
--
ALTER TABLE `sma_user_logins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=540;

--
-- AUTO_INCREMENT for table `sma_variants`
--
ALTER TABLE `sma_variants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `sma_warehouses`
--
ALTER TABLE `sma_warehouses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `sma_warehouses_products`
--
ALTER TABLE `sma_warehouses_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=533;

--
-- AUTO_INCREMENT for table `sma_warehouses_products_variants`
--
ALTER TABLE `sma_warehouses_products_variants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_wishlist`
--
ALTER TABLE `sma_wishlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
