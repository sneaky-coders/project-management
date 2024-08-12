-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 08, 2024 at 04:27 PM
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
-- Database: `erp`
--

-- --------------------------------------------------------

--
-- Table structure for table `chartofaccounts`
--

CREATE TABLE `chartofaccounts` (
  `account_id` int(11) NOT NULL,
  `account_code` varchar(20) NOT NULL,
  `account_name` varchar(100) NOT NULL,
  `account_type` enum('Asset','Liability','Equity','Revenue','Expense') NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `chartofaccounts`
--

INSERT INTO `chartofaccounts` (`account_id`, `account_code`, `account_name`, `account_type`, `parent_id`, `description`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'AnX00001', 'CashAccount', 'Asset', NULL, '', 1, '2024-08-07 10:11:53', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

CREATE TABLE `client` (
  `client_id` int(11) NOT NULL,
  `companyname` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phonenumber` bigint(20) NOT NULL,
  `logo` varchar(50) NOT NULL,
  `manager_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_deleted` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `client`
--

INSERT INTO `client` (`client_id`, `companyname`, `email`, `phonenumber`, `logo`, `manager_id`, `created_at`, `updated_at`, `is_deleted`) VALUES
(1, 'Kankonkar technologies pvt ltd', 'kank123@gmail.com', 9482543801, '', 1, '2024-07-08 20:32:46', '2024-07-08 20:32:46', 0),
(2, 'Infosys pvt ltd', 'info@123.com', 8767564565, '', 2, '2024-07-09 04:34:43', '2024-07-09 04:34:43', 0);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `contact` bigint(11) NOT NULL,
  `address` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Human Resources', 'Responsible for managing employee relations, recruitment, and training.', '2024-04-30 05:27:58', '2024-04-30 05:27:58'),
(2, 'Marketing', 'Responsible for promoting the company\'s products or services.', '2024-04-30 05:27:58', '2024-04-30 05:27:58'),
(3, 'Finance', 'Responsible for managing the company\'s financial resources and transactions.', '2024-04-30 05:27:58', '2024-04-30 05:27:58'),
(4, 'Full Stack Development', 'Handles both the front-end and back-end development of web applications.', '2024-04-30 05:27:58', '2024-04-30 05:27:58'),
(5, 'Backend Development', 'Focuses on server-side logic and database interaction of web applications.', '2024-04-30 05:27:58', '2024-04-30 05:27:58'),
(6, 'Frontend Development', 'Focuses on the user interface and user experience of web applications.', '2024-04-30 05:27:58', '2024-04-30 05:27:58'),
(7, 'Artificial Intelligence', 'Involves the development and implementation of AI algorithms and applications.', '2024-04-30 05:27:58', '2024-04-30 05:27:58'),
(8, 'Web Development', 'Involves the creation and maintenance of websites and web applications.', '2024-04-30 05:27:58', '2024-04-30 05:27:58'),
(10, 'Chat GPT', 'chat gpt', NULL, NULL),
(11, 'Ai', 'ai', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `id` int(11) NOT NULL,
  `emp_id` varchar(100) NOT NULL,
  `user_id` int(11) NOT NULL,
  `department_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `gender` varchar(20) NOT NULL,
  `phone` bigint(20) NOT NULL,
  `designation` varchar(100) NOT NULL,
  `aadhar` int(11) NOT NULL,
  `pan` varchar(50) NOT NULL,
  `birth_date` date NOT NULL,
  `hire_dated` date NOT NULL,
  `email` varchar(50) NOT NULL,
  `address` varchar(200) NOT NULL,
  `allowed_leaves` int(11) NOT NULL,
  `basic_and_da` int(11) NOT NULL,
  `hra` int(11) NOT NULL,
  `overtime` int(11) NOT NULL,
  `contribution_to_pf` int(11) NOT NULL,
  `esic` int(11) NOT NULL,
  `lwf` int(11) NOT NULL,
  `salary_advance` int(11) NOT NULL,
  `authorised_signatory` varchar(50) NOT NULL,
  `pf_applicable` tinyint(4) DEFAULT 0,
  `medical_bill_submited` tinyint(4) DEFAULT 0,
  `account_no` varchar(100) NOT NULL,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`id`, `emp_id`, `user_id`, `department_id`, `name`, `gender`, `phone`, `designation`, `aadhar`, `pan`, `birth_date`, `hire_dated`, `email`, `address`, `allowed_leaves`, `basic_and_da`, `hra`, `overtime`, `contribution_to_pf`, `esic`, `lwf`, `salary_advance`, `authorised_signatory`, `pf_applicable`, `medical_bill_submited`, `account_no`, `is_deleted`, `created_at`, `updated_at`) VALUES
(2, 'EMP2759', 5, 3, 'Afra Pathan', 'Female', 9482543801, 'Firewall Designer', 2147483647, 'BUJPN1359Q', '2001-06-25', '2024-09-26', 'afra123@gmail.com', 'belgaum', 30, 50000, 12000, 517, 1000, 100, 1000, 0, 'Test', 1, 1, '123456789123456', 0, '2024-06-24 02:16:24', '2024-06-23 20:46:24'),
(4, 'ANKY3012', 6, 2, 'Dakshata Patil', 'Female', 9482543801, 'Firewall Designer', 2147483647, 'BUJPN1359Q', '2001-07-05', '2024-07-08', 'daksh123@gmail.com', 'H.No 2053 Vishnu Vatsala Niwas 3rd Cross Bauxite Road Basav Colony Belgaum', 30, 50000, 1000, 417, 1000, 100, 100, 0, 'Ankur Kankonkar', 1, 1, '123456789123456', 0, '2024-07-08 20:12:25', '2024-07-08 20:12:25');

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `id` int(11) NOT NULL,
  `vendor_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 0,
  `cost_price` double NOT NULL,
  `selling_price` double NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`id`, `vendor_id`, `item_id`, `quantity`, `cost_price`, `selling_price`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 100, 100, 200, '2024-08-01 15:14:28', '0000-00-00 00:00:00'),
(2, 1, 2, 20, 400, 600, '2024-08-01 15:14:52', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE `invoice` (
  `invoice_id` int(11) NOT NULL,
  `invoice_number` varchar(20) NOT NULL,
  `account_id` int(11) NOT NULL,
  `invoice_date` date NOT NULL,
  `gst` double DEFAULT NULL,
  `discount` double DEFAULT NULL,
  `content` text DEFAULT NULL,
  `invoice_option` text DEFAULT NULL,
  `additional_fields` text DEFAULT NULL,
  `payment_status` tinyint(4) DEFAULT 0,
  `currency` varchar(20) DEFAULT NULL,
  `total` double DEFAULT NULL,
  `client_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `invoice`
--

INSERT INTO `invoice` (`invoice_id`, `invoice_number`, `account_id`, `invoice_date`, `gst`, `discount`, `content`, `invoice_option`, `additional_fields`, `payment_status`, `currency`, `total`, `client_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'SO/AUG24/1', 1, '2024-08-08', 0, 0, '[[\"Paint\",\"\",\"500\",\"50\"]]', '[]', '[]', 1, 'INR', 25000, 1, 1, '2024-08-08 17:59:03', '2024-08-08 12:29:18'),
(2, 'SO/AUG24/2', 1, '2024-08-10', 0, 0, '[[\"Paint\",\"\",\"2000\",\"15\"]]', '[]', '[]', 1, 'INR', 30000, 1, 1, '2024-08-08 18:08:40', '2024-08-08 12:38:48');

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `id` int(11) NOT NULL,
  `vendor_id` int(11) DEFAULT NULL,
  `item_name` varchar(100) NOT NULL,
  `sku` int(11) NOT NULL,
  `cost_price` double NOT NULL,
  `selling_price` double NOT NULL,
  `unit_id` int(11) NOT NULL,
  `upc` int(11) NOT NULL,
  `ean` int(11) NOT NULL,
  `isbn` int(11) NOT NULL,
  `reorder_level` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `vendor_id`, `item_name`, `sku`, `cost_price`, `selling_price`, `unit_id`, `upc`, `ean`, `isbn`, `reorder_level`, `created_at`, `updated_at`) VALUES
(1, 1, 'Paint', 74975, 100, 300, 1, 66837, 68908, 654898, 10, '2024-08-01 14:58:39', '0000-00-00 00:00:00'),
(2, 1, 'Bricks', 1, 300, 500, 1, 1, 1, 1, 10, '2024-08-01 14:59:03', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `item_vendor`
--

CREATE TABLE `item_vendor` (
  `id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `vendor_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `item_vendor`
--

INSERT INTO `item_vendor` (`id`, `item_id`, `vendor_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2024-07-19 12:03:20', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `leave_requests`
--

CREATE TABLE `leave_requests` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `leave_type_id` int(11) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `status` enum('pending','approved','rejected') DEFAULT 'pending',
  `reason` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `leave_types`
--

CREATE TABLE `leave_types` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `leave_types`
--

INSERT INTO `leave_types` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Vacation', 'Paid time off for relaxation and leisure.', '2024-04-30 05:23:15', '2024-04-30 05:23:15'),
(2, 'Sick Leave', 'Time off for illness or medical reasons.', '2024-04-30 05:23:15', '2024-04-30 05:23:15'),
(3, 'Maternity/Paternity Leave', 'Time off for new parents to care for a newborn or newly adopted child.', '2024-04-30 05:23:15', '2024-04-30 05:23:15'),
(4, 'Half Day', 'Partial day off typically used for short-term personal needs or appointments.', '2024-04-30 05:23:15', '2024-04-30 05:23:15'),
(5, 'Project Work Off Day', 'A day off granted specifically for project work or special assignments.', '2024-04-30 05:23:15', '2024-04-30 05:23:15'),
(6, 'Casual Leave', 'A type of leave that employees can take for unplanned or unforeseen events, typically for relaxation or personal reasons.', '2024-04-30 05:49:38', '2024-04-30 05:49:38');

-- --------------------------------------------------------

--
-- Table structure for table `login_log`
--

CREATE TABLE `login_log` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `login_time` timestamp NULL DEFAULT current_timestamp(),
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `login_log`
--

INSERT INTO `login_log` (`id`, `user_id`, `login_time`, `ip_address`, `user_agent`) VALUES
(1, 249, '2024-04-24 13:52:17', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36'),
(2, 249, '2024-04-24 14:03:10', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36'),
(3, 252, '2024-04-24 14:04:14', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36'),
(4, 249, '2024-04-25 00:22:10', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36'),
(5, 252, '2024-04-25 07:01:06', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36'),
(6, 252, '2024-04-25 09:47:21', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36'),
(7, 252, '2024-04-25 10:01:59', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36'),
(8, 249, '2024-04-29 14:18:33', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36'),
(9, 249, '2024-04-29 23:36:28', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36'),
(10, 249, '2024-04-30 01:00:32', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36'),
(11, 249, '2024-04-30 02:00:19', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36'),
(12, 249, '2024-04-30 05:17:49', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36'),
(13, 249, '2024-04-30 06:17:34', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36'),
(14, 249, '2024-04-30 13:51:51', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36'),
(15, 249, '2024-05-01 11:19:23', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36'),
(16, 249, '2024-05-01 11:20:15', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36'),
(17, 1, '2024-05-01 11:22:58', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36'),
(18, 2, '2024-05-01 11:28:43', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36'),
(19, 1, '2024-05-01 11:55:40', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36'),
(20, 2, '2024-05-01 11:56:19', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36'),
(21, 1, '2024-05-01 12:11:53', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36'),
(22, 1, '2024-05-01 23:00:11', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36'),
(23, 1, '2024-05-01 23:03:38', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36'),
(24, 1, '2024-05-01 23:48:17', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36'),
(25, 1, '2024-05-04 11:57:33', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36'),
(26, 1, '2024-05-05 05:39:07', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36'),
(27, 1, '2024-05-06 01:09:48', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36'),
(28, 1, '2024-05-06 01:38:19', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36'),
(29, 1, '2024-05-07 09:08:44', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36'),
(30, 1, '2024-05-18 09:45:09', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36'),
(31, 1, '2024-05-19 10:07:25', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36'),
(32, 4, '2024-05-20 12:56:15', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36'),
(33, 4, '2024-05-23 04:26:24', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36'),
(34, 4, '2024-05-23 04:33:56', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36'),
(35, 4, '2024-05-23 07:06:41', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36'),
(36, 1, '2024-05-23 07:21:24', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36'),
(37, 1, '2024-05-23 12:43:46', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36'),
(38, 1, '2024-05-26 05:26:39', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36'),
(39, 1, '2024-05-27 10:07:50', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36'),
(40, 1, '2024-05-27 11:07:12', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36');

-- --------------------------------------------------------

--
-- Table structure for table `manager`
--

CREATE TABLE `manager` (
  `manager_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `phonenumber` bigint(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `is_deleted` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `manager`
--

INSERT INTO `manager` (`manager_id`, `name`, `email`, `address`, `phonenumber`, `created_at`, `updated_at`, `is_deleted`) VALUES
(1, 'Smita Patil', 'smita123@gmail.com', 'Vaibhav nagar belgaum', 7338391605, '2024-07-08 20:31:51', '2024-07-08 20:31:51', 0),
(2, 'Raju Patil', 'rajupatil@gmail.com', 'H.No 2053 Vishnu Vatsala Niwas 3rd Cross Bauxite Road Basav Colony Belgaum', 9480127653, '2024-07-09 04:33:55', '2024-07-09 04:33:55', 0);

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `payment_id` int(11) NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `payment_date` date NOT NULL,
  `payment_method` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`payment_id`, `invoice_id`, `amount`, `payment_date`, `payment_method`, `description`, `created_at`, `updated_at`) VALUES
(1, 1, 25000.00, '2024-08-08', 'Credit Card', 'Padi', '2024-08-08 12:34:26', NULL),
(2, 2, 30000.00, '2024-08-08', 'Cash', 'Full paid in cash', '2024-08-08 13:44:18', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `purchase`
--

CREATE TABLE `purchase` (
  `purchase_id` int(11) NOT NULL,
  `vendor_id` int(11) NOT NULL,
  `item` varchar(100) NOT NULL,
  `hsn` varchar(20) NOT NULL,
  `paymentstatus` varchar(20) NOT NULL,
  `amount` double NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `is_deleted` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `purchase`
--

INSERT INTO `purchase` (`purchase_id`, `vendor_id`, `item`, `hsn`, `paymentstatus`, `amount`, `created_at`, `updated_at`, `is_deleted`) VALUES
(1, 1, 'AC', '', 'Paid', 2000, '2024-07-08 20:38:31', NULL, 0),
(2, 1, 'Utilities', '', 'Paid', 2000, '2024-07-09 04:12:11', NULL, 0),
(3, 1, 'cement', '', 'Paid', 6000, '2024-07-14 10:43:33', NULL, 0),
(4, 1, 'cement', '', 'Pending', 1500, '2024-07-15 10:49:32', NULL, 0),
(5, 1, 'cement', '', 'Pending', 1500, '2024-07-15 17:43:53', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `purchase_order`
--

CREATE TABLE `purchase_order` (
  `po_id` int(11) NOT NULL,
  `vendor_id` int(11) NOT NULL,
  `po_number` varchar(200) NOT NULL,
  `reference` varchar(200) NOT NULL,
  `po_date` date NOT NULL,
  `delivery_date` date NOT NULL,
  `payment_terms` varchar(200) NOT NULL,
  `item_id` text NOT NULL,
  `unit_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `purchase_order`
--

INSERT INTO `purchase_order` (`po_id`, `vendor_id`, `po_number`, `reference`, `po_date`, `delivery_date`, `payment_terms`, `item_id`, `unit_id`, `qty`, `created_at`, `updated_at`) VALUES
(2, 1, '648968', 'gti765', '2024-07-19', '2024-07-20', 'NET 60', '1', 1, 30, '2024-07-19 11:00:09', '0000-00-00 00:00:00'),
(3, 1, '648969', '1234', '2024-07-19', '2024-07-21', 'COD', '2', 1, 100, '2024-07-19 13:06:05', '0000-00-00 00:00:00'),
(4, 1, '884', '332', '2024-07-20', '2024-07-20', 'er', '9', 1, 20, '2024-07-20 12:11:32', '0000-00-00 00:00:00'),
(5, 1, '889', '990', '2024-07-20', '2024-07-20', 'er', '9', 1, 0, '2024-07-20 12:13:25', '0000-00-00 00:00:00'),
(6, 1, '890', '123', '2024-07-20', '2024-07-27', 'er', '[\"9\"]', 1, 0, '2024-07-20 12:22:07', '0000-00-00 00:00:00'),
(7, 1, '11', '11', '2024-07-20', '2024-07-27', 'Immediate', '[\"9\"]', 2, 100, '2024-07-20 13:07:29', '0000-00-00 00:00:00'),
(8, 1, '11', '11', '2024-07-20', '2024-07-27', 'Immediate', '[\"9\"]', 2, 100, '2024-07-20 13:07:59', '0000-00-00 00:00:00'),
(9, 1, '12', '12', '2024-07-20', '2024-07-27', 'Immediate', '[\"2\"]', 2, 100, '2024-07-20 13:11:01', '0000-00-00 00:00:00'),
(10, 1, '13', '13', '2024-07-20', '2024-07-27', 'Net 60', '[\"2\"]', 1, 50, '2024-07-20 13:19:41', '0000-00-00 00:00:00'),
(11, 1, '13', '13', '2024-07-20', '2024-07-27', 'Net 60', '[\"9\"]', 1, 50, '2024-07-20 13:24:53', '0000-00-00 00:00:00'),
(12, 1, '13', '13', '2024-07-20', '2024-07-27', 'Net 60', '[\"2\"]', 1, 50, '2024-07-20 13:26:36', '0000-00-00 00:00:00'),
(13, 1, '13', '13', '2024-07-20', '2024-07-27', 'Net 60', '[\"9\"]', 1, 50, '2024-07-20 13:28:00', '0000-00-00 00:00:00'),
(14, 1, '13', '13', '2024-07-20', '2024-07-27', 'Net 60', '[\"9\"]', 1, 50, '2024-07-20 13:30:49', '0000-00-00 00:00:00'),
(15, 1, '13', '13', '2024-07-20', '2024-07-27', 'Net 60', '[\"2\"]', 1, 50, '2024-07-20 13:31:25', '0000-00-00 00:00:00'),
(16, 1, '13', '13', '2024-07-20', '2024-07-27', 'Net 60', '[\"9\"]', 1, 50, '2024-07-20 13:31:57', '0000-00-00 00:00:00'),
(17, 1, '13', '13', '2024-07-20', '2024-07-27', 'Net 60', 'a:1:{i:0;s:1:\"9\";}', 1, 50, '2024-07-20 13:39:08', '0000-00-00 00:00:00'),
(18, 1, '15', '15', '2024-07-21', '2024-07-27', 'Net 30', 'a:1:{i:0;s:1:\"9\";}', 1, 30, '2024-07-20 13:40:56', '0000-00-00 00:00:00'),
(19, 1, '18', '18', '2024-07-20', '2024-07-27', 'Net 60', '9', 1, 10, '2024-07-20 13:52:04', '0000-00-00 00:00:00'),
(20, 1, '18', '18', '2024-07-20', '2024-07-27', 'Net 60', '9', 1, 10, '2024-07-20 14:12:21', '0000-00-00 00:00:00'),
(21, 1, '18', '18', '2024-07-20', '2024-07-27', 'Net 60', '9', 1, 10, '2024-07-20 14:12:30', '0000-00-00 00:00:00'),
(22, 1, '18', '18', '2024-07-20', '2024-07-27', 'Net 60', '[\"[\\\"1\\\"]\"]', 1, 10, '2024-07-20 14:13:58', '0000-00-00 00:00:00'),
(23, 1, '18', '18', '2024-07-20', '2024-07-27', 'Net 60', '[\"[\\\"2\\\"]\"]', 1, 10, '2024-07-20 14:15:08', '0000-00-00 00:00:00'),
(24, 1, '18', '18', '2024-07-20', '2024-07-27', 'Net 60', '[\"10\"]', 1, 10, '2024-07-20 14:34:35', '0000-00-00 00:00:00'),
(25, 1, '18', '18', '2024-07-20', '2024-07-27', 'Net 60', '[\"2\",\"9\"]', 1, 10, '2024-07-20 14:34:51', '0000-00-00 00:00:00'),
(26, 1, '18', '18', '2024-07-20', '2024-07-27', 'Net 60', '[\"9\"]', 1, 10, '2024-07-20 14:38:22', '0000-00-00 00:00:00'),
(27, 1, '888', '888', '2024-07-20', '2024-07-21', 'Net 30', '[\"2\",\"9\"]', 1, 100, '2024-07-20 14:42:40', '0000-00-00 00:00:00'),
(28, 1, 'PO/22', 'RO/22', '2024-07-20', '2024-07-27', 'Net 60', '[\"1\",\"2\"]', 1, 30, '2024-07-20 15:12:19', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `purchase_receiving`
--

CREATE TABLE `purchase_receiving` (
  `pr_id` int(11) NOT NULL,
  `purchase_id` int(11) NOT NULL,
  `received_qty` int(11) NOT NULL,
  `delivery_date` date NOT NULL,
  `status` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `quotation`
--

CREATE TABLE `quotation` (
  `quotation_id` int(11) NOT NULL,
  `quotation_number` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `quotation_date` date NOT NULL,
  `expiry_date` date DEFAULT NULL,
  `gst` double DEFAULT NULL,
  `discount` double DEFAULT NULL,
  `content` text CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `quotation_option` text CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `additional_fields` text CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `notes` text CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `client_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `currency` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `total` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `quotation`
--

INSERT INTO `quotation` (`quotation_id`, `quotation_number`, `quotation_date`, `expiry_date`, `gst`, `discount`, `content`, `quotation_option`, `additional_fields`, `notes`, `client_id`, `user_id`, `currency`, `total`) VALUES
(1, 'QUO/JUL24/1', '2024-07-18', NULL, NULL, NULL, '[]', '[]', '[]', NULL, 1, 1, 'INR', NULL),
(2, 'QUO/JUL24/2', '2024-07-18', NULL, 0, 0, '[]', '[]', '[]', NULL, 1, 1, 'INR', NULL),
(3, 'QUO/JUL24/3', '2024-07-18', NULL, 0, NULL, '[[\"Test\",\"\",\"100\",\"1\"]]', '[]', '[]', NULL, 1, 1, 'INR', NULL),
(4, 'QUO/JUL24/4', '2024-07-18', NULL, 0, 0, '[[\"Tet\",\"\",\"200\",\"1\"]]', '[]', '[]', NULL, 2, 1, 'INR', NULL),
(5, 'QUO/JUL24/5', '2024-07-18', NULL, 0, NULL, '[[\"Test\",\"\",\"200\",\"1\"]]', '[]', '[]', NULL, 2, 1, 'INR', NULL),
(6, 'QUO/200', '2024-07-18', '2024-07-19', 0, 0, '[]', '[]', '[]', NULL, 2, 1, 'INR', NULL),
(7, 'QUO/JUL24/7', '2024-07-18', '2024-07-31', 5, 5, '[[\"Tst\",\"hhhg\",\"200\",\"1\"]]', '[]', '[[\"1\",\"50% advance should be paid b4 start of project\"]]', '[[\"Tst\",\"hhhg\",\"200\",\"1\"]]', 1, 1, 'INR', NULL),
(8, 'QUO/JUL24/8', '2024-07-18', '2024-07-20', 1, 1, '[[\"enfj\",\"knjnk\",\"1\",\"200\"]]', '[]', '[[\"1\",\"50% advance should be paid b4 start of project\"],[\"\",\"\"]]', '[[\"enfj\",\"knjnk\",\"1\",\"200\"]]', 1, 1, 'INR', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `reset_password`
--

CREATE TABLE `reset_password` (
  `reset_password_id` int(11) NOT NULL,
  `reset_hash` text NOT NULL,
  `email` varchar(100) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `reset_password`
--

INSERT INTO `reset_password` (`reset_password_id`, `reset_hash`, `email`, `created_at`, `updated_at`) VALUES
(1, 'acPNk22IaAu0iY35cnFrF1i9wTF8zVfz', 'prutika58@gmail.com', '2024-07-08 20:50:43', '2024-07-08 20:50:43');

-- --------------------------------------------------------

--
-- Table structure for table `salary`
--

CREATE TABLE `salary` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `basic_and_da` int(11) NOT NULL,
  `hra` int(11) NOT NULL,
  `overtime` int(11) NOT NULL,
  `overtime_done` int(11) DEFAULT 0,
  `contribution_to_pf` int(11) NOT NULL,
  `esic` int(11) NOT NULL,
  `lwf` int(11) NOT NULL,
  `salary_advance` int(11) DEFAULT 0,
  `salary_advance_deducted` int(11) DEFAULT 0,
  `remaining_leaves` int(11) DEFAULT NULL,
  `leaves_taken` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `salary`
--

INSERT INTO `salary` (`id`, `employee_id`, `date`, `basic_and_da`, `hra`, `overtime`, `overtime_done`, `contribution_to_pf`, `esic`, `lwf`, `salary_advance`, `salary_advance_deducted`, `remaining_leaves`, `leaves_taken`, `created_at`, `updated_at`) VALUES
(1, 4, '2024-07-15', 50000, 1000, 417, NULL, 1000, 100, 100, 0, 0, NULL, 0, '2024-07-15 16:01:56', '2024-07-15 16:01:56');

-- --------------------------------------------------------

--
-- Table structure for table `stock`
--

CREATE TABLE `stock` (
  `id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `unit_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `stock`
--

INSERT INTO `stock` (`id`, `item_id`, `quantity`, `unit_id`, `created_at`, `updated_at`) VALUES
(3, 1, 250, 1, '2024-07-19 10:25:06', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

CREATE TABLE `units` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `units`
--

INSERT INTO `units` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Kg', '2024-07-19 10:19:59', '2024-07-19 10:19:59'),
(2, 'Gm', '2024-07-19 13:01:59', '2024-07-19 13:01:59');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `fullname` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `image` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `level` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `is_deleted` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `fullname`, `password`, `image`, `email`, `level`, `created_at`, `updated_at`, `is_deleted`) VALUES
(1, 'Admin', 'Mr Admin', '$2y$13$zzeoBzsOnIYBgv293YOeXOa6E3XBjywlnpg0IJmRNLC2EfYCcBnwi', 'E-TRP1cEeYx69wZb8r_U.jpg', 'prutika58@gmail.com', 1, '2024-05-01 16:52:41', '2024-07-08 20:46:42', 0),
(2, 'Rutika', 'Rutika Patil', '$2y$13$K0LVI.ULiUwq/Kt0aC0sV.tSsjPF9ury7f/6pNpA1xXHfqBAdNbKG', '1716135346.jpg', 'rutikapatil270@gmail.com', 1, '2024-05-01 16:57:50', '2024-06-26 09:28:37', 0),
(4, 'Snehal', 'Snehal Patil', '$2y$13$khVR7hAcIwD1/pJ9e8qi3.iN4RjF5GOY.aIYRDHKCun8uCsFOz/ea', '1716135346.jpg', 'snehal123@gmail.com', 2, '2024-05-19 16:15:46', '2024-05-20 18:59:44', 0),
(5, 'Afra', 'Afra Pathan', '$2y$13$CcqeuriKeXZT/Yn2lK7VK.xvo8jytfZi.HiwHRUaGx57uG55JtJCy', '', '2gi22mc011@students.git.edu', 3, '2024-06-20 17:14:43', '2024-06-20 17:15:07', 0),
(6, 'Dakshata', 'Dakshata Patil', '$2y$13$rUKvx/yNemgNd2U/mtVzduHErOzdaVQPOIi84gxw2XqhOsm85gSum', '', 'dakshatapatil4289@gmail.com', 3, '2024-06-21 20:26:48', '0000-00-00 00:00:00', 0),
(7, 'Saibha', 'Saibha Shaikhali', '$2y$13$EHoq5YG8Lmfftq439l9rS.Ig6nIz8lR793mjZmKoqdikqOisqUdRy', 'user_1721489934.png', 'saibhashaikhali53@gmail.com', 1, '2024-07-20 15:38:55', '2024-07-20 15:40:45', 0);

-- --------------------------------------------------------

--
-- Table structure for table `vendor`
--

CREATE TABLE `vendor` (
  `vendor_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(50) NOT NULL,
  `contact` bigint(20) NOT NULL,
  `pan` varchar(20) NOT NULL,
  `gstin` varchar(30) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `is_deleted` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vendor`
--

INSERT INTO `vendor` (`vendor_id`, `name`, `email`, `contact`, `pan`, `gstin`, `created_at`, `updated_at`, `is_deleted`) VALUES
(1, 'Kirti Patil', 'kirti123@gmail.com', 9606687176, 'BYKPU7656Q', 'GSTIN-294532BGM', NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `chartofaccounts`
--
ALTER TABLE `chartofaccounts`
  ADD PRIMARY KEY (`account_id`),
  ADD KEY `parent_id` (`parent_id`);

--
-- Indexes for table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`client_id`),
  ADD KEY `manager_id` (`manager_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vendor_id` (`vendor_id`),
  ADD KEY `item_id` (`item_id`);

--
-- Indexes for table `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`invoice_id`),
  ADD KEY `fk_0001` (`client_id`),
  ADD KEY `fk_sda` (`user_id`),
  ADD KEY `invoice_ibfk_2` (`account_id`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vendor_id` (`vendor_id`),
  ADD KEY `unit_id` (`unit_id`);

--
-- Indexes for table `item_vendor`
--
ALTER TABLE `item_vendor`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_id` (`item_id`),
  ADD KEY `vendor_id` (`vendor_id`);

--
-- Indexes for table `leave_requests`
--
ALTER TABLE `leave_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_id` (`employee_id`),
  ADD KEY `leave_type_id` (`leave_type_id`);

--
-- Indexes for table `leave_types`
--
ALTER TABLE `leave_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `login_log`
--
ALTER TABLE `login_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `manager`
--
ALTER TABLE `manager`
  ADD PRIMARY KEY (`manager_id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `invoice_id` (`invoice_id`);

--
-- Indexes for table `purchase`
--
ALTER TABLE `purchase`
  ADD PRIMARY KEY (`purchase_id`),
  ADD KEY `vendor_id` (`vendor_id`);

--
-- Indexes for table `purchase_order`
--
ALTER TABLE `purchase_order`
  ADD PRIMARY KEY (`po_id`),
  ADD KEY `vendor_id` (`vendor_id`),
  ADD KEY `unit_id` (`unit_id`);

--
-- Indexes for table `purchase_receiving`
--
ALTER TABLE `purchase_receiving`
  ADD PRIMARY KEY (`pr_id`);

--
-- Indexes for table `quotation`
--
ALTER TABLE `quotation`
  ADD PRIMARY KEY (`quotation_id`),
  ADD KEY `client_id` (`client_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `reset_password`
--
ALTER TABLE `reset_password`
  ADD PRIMARY KEY (`reset_password_id`);

--
-- Indexes for table `salary`
--
ALTER TABLE `salary`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_id` (`employee_id`);

--
-- Indexes for table `stock`
--
ALTER TABLE `stock`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_id` (`item_id`),
  ADD KEY `unit_id` (`unit_id`);

--
-- Indexes for table `units`
--
ALTER TABLE `units`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `username` (`username`),
  ADD KEY `email` (`email`);

--
-- Indexes for table `vendor`
--
ALTER TABLE `vendor`
  ADD PRIMARY KEY (`vendor_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `chartofaccounts`
--
ALTER TABLE `chartofaccounts`
  MODIFY `account_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `client`
--
ALTER TABLE `client`
  MODIFY `client_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `inventory`
--
ALTER TABLE `inventory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `invoice`
--
ALTER TABLE `invoice`
  MODIFY `invoice_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `item_vendor`
--
ALTER TABLE `item_vendor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `leave_requests`
--
ALTER TABLE `leave_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `leave_types`
--
ALTER TABLE `leave_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `login_log`
--
ALTER TABLE `login_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `manager`
--
ALTER TABLE `manager`
  MODIFY `manager_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `purchase`
--
ALTER TABLE `purchase`
  MODIFY `purchase_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `purchase_order`
--
ALTER TABLE `purchase_order`
  MODIFY `po_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `purchase_receiving`
--
ALTER TABLE `purchase_receiving`
  MODIFY `pr_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `quotation`
--
ALTER TABLE `quotation`
  MODIFY `quotation_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `reset_password`
--
ALTER TABLE `reset_password`
  MODIFY `reset_password_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `salary`
--
ALTER TABLE `salary`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `stock`
--
ALTER TABLE `stock`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `units`
--
ALTER TABLE `units`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `vendor`
--
ALTER TABLE `vendor`
  MODIFY `vendor_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `chartofaccounts`
--
ALTER TABLE `chartofaccounts`
  ADD CONSTRAINT `chartofaccounts_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `chartofaccounts` (`account_id`);

--
-- Constraints for table `client`
--
ALTER TABLE `client`
  ADD CONSTRAINT `client_ibfk_1` FOREIGN KEY (`manager_id`) REFERENCES `manager` (`manager_id`);

--
-- Constraints for table `inventory`
--
ALTER TABLE `inventory`
  ADD CONSTRAINT `inventory_ibfk_1` FOREIGN KEY (`vendor_id`) REFERENCES `vendor` (`vendor_id`),
  ADD CONSTRAINT `inventory_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`);

--
-- Constraints for table `invoice`
--
ALTER TABLE `invoice`
  ADD CONSTRAINT `invoice_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `client` (`client_id`),
  ADD CONSTRAINT `invoice_ibfk_2` FOREIGN KEY (`account_id`) REFERENCES `chartofaccounts` (`account_id`);

--
-- Constraints for table `items`
--
ALTER TABLE `items`
  ADD CONSTRAINT `items_ibfk_1` FOREIGN KEY (`vendor_id`) REFERENCES `vendor` (`vendor_id`),
  ADD CONSTRAINT `items_ibfk_2` FOREIGN KEY (`unit_id`) REFERENCES `units` (`id`);

--
-- Constraints for table `item_vendor`
--
ALTER TABLE `item_vendor`
  ADD CONSTRAINT `item_vendor_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`),
  ADD CONSTRAINT `item_vendor_ibfk_2` FOREIGN KEY (`vendor_id`) REFERENCES `vendor` (`vendor_id`);

--
-- Constraints for table `leave_requests`
--
ALTER TABLE `leave_requests`
  ADD CONSTRAINT `leave_requests_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`),
  ADD CONSTRAINT `leave_requests_ibfk_2` FOREIGN KEY (`leave_type_id`) REFERENCES `leave_types` (`id`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`invoice_id`) REFERENCES `invoice` (`invoice_id`) ON DELETE CASCADE;

--
-- Constraints for table `purchase_order`
--
ALTER TABLE `purchase_order`
  ADD CONSTRAINT `purchase_order_ibfk_1` FOREIGN KEY (`vendor_id`) REFERENCES `vendor` (`vendor_id`),
  ADD CONSTRAINT `purchase_order_ibfk_3` FOREIGN KEY (`unit_id`) REFERENCES `units` (`id`);

--
-- Constraints for table `stock`
--
ALTER TABLE `stock`
  ADD CONSTRAINT `stock_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`),
  ADD CONSTRAINT `stock_ibfk_2` FOREIGN KEY (`unit_id`) REFERENCES `units` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
