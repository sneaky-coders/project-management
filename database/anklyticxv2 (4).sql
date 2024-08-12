-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jul 12, 2024 at 07:07 PM
-- Server version: 8.2.0
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `anklyticxv2`
--

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
CREATE TABLE IF NOT EXISTS `client` (
  `client_id` int NOT NULL AUTO_INCREMENT,
  `companyname` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phonenumber` bigint NOT NULL,
  `logo` varchar(50) NOT NULL,
  `manager_id` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_deleted` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`client_id`),
  KEY `manager_id` (`manager_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `client`
--

INSERT INTO `client` (`client_id`, `companyname`, `email`, `phonenumber`, `logo`, `manager_id`, `created_at`, `updated_at`, `is_deleted`) VALUES
(1, 'Anklyticx', 'anky123@gmail.com', 9482543801, '', 1, '2024-06-03 10:47:20', '2024-06-03 10:47:20', 0),
(2, 'Kapslock.in', 'info@kapslock.in', 8767564565, '', 1, '2024-06-25 14:24:18', '2024-06-25 14:24:18', 0);

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
CREATE TABLE IF NOT EXISTS `departments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
(10, 'Chat GPT', 'chat gpt', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
CREATE TABLE IF NOT EXISTS `employee` (
  `id` int NOT NULL AUTO_INCREMENT,
  `emp_id` varchar(100) NOT NULL,
  `user_id` int DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `gender` varchar(20) NOT NULL,
  `designation` varchar(100) NOT NULL,
  `allowed_leaves` int NOT NULL,
  `basic_and_da` int NOT NULL,
  `hra` int NOT NULL,
  `overtime` int NOT NULL,
  `contribution_to_pf` int NOT NULL,
  `esic` int NOT NULL,
  `lwf` int NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` bigint NOT NULL,
  `address` varchar(100) NOT NULL,
  `birth_date` date NOT NULL,
  `hire_dated` date NOT NULL,
  `department_id` int NOT NULL,
  `aadhar` int NOT NULL,
  `pan` varchar(20) NOT NULL,
  `salary_advance` int NOT NULL,
  `authorised_signatory` varchar(50) NOT NULL,
  `pf_applicable` tinyint DEFAULT '0',
  `medical_bill_submited` tinyint DEFAULT '0',
  `account_no` varchar(100) NOT NULL,
  `is_deleted` tinyint NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`id`, `emp_id`, `user_id`, `name`, `gender`, `designation`, `allowed_leaves`, `basic_and_da`, `hra`, `overtime`, `contribution_to_pf`, `esic`, `lwf`, `email`, `phone`, `address`, `birth_date`, `hire_dated`, `department_id`, `aadhar`, `pan`, `salary_advance`, `authorised_signatory`, `pf_applicable`, `medical_bill_submited`, `account_no`, `is_deleted`, `created_at`, `updated_at`) VALUES
(1, 'EMP9007', 2, 'Rutika Patil', 'Female', 'Full Stack Developer', 30, 30000, 5000, 500, 1000, 100, 1000, 'rutikapatil270@gmail.com', 9606687176, 'H.No 2053 Vishnu Vatsala Niwas 3rd Cross Bauxite Road Basav Colony Belgaum', '2001-07-05', '2024-07-05', 7, 2147483647, 'BUJPN1359Q', 0, 'Test', 1, 1, '123456789123456', 0, '2024-06-24 01:49:08', '2024-06-23 20:19:08'),
(2, 'EMP2759', 5, 'Afra Pathan', 'Female', 'Firewall Designer', 30, 50000, 12000, 517, 1000, 100, 1000, 'afra123@gmail.com', 9482543801, 'belgaum', '2001-06-25', '2024-09-26', 3, 2147483647, 'BUJPN1359Q', 0, 'Test', 1, 1, '123456789123456', 0, '2024-06-24 02:16:24', '2024-06-23 20:46:24'),
(3, 'EMP7618', NULL, 'Richa jituri', 'Female', 'Web Developer', 30, 20000, 1000, 175, 1000, 100, 240, 'richa123@gmail.com', 9606687176, 'H.No 2053 Vishnu Vatsala Niwas 3rd Cross Bauxite Road Basav Colony Belgaum', '2001-07-05', '2024-08-05', 4, 2147483647, 'BUJPN1359Q', 0, 'Test', 1, 0, '123456789123456', 0, '2024-06-24 11:01:30', '2024-06-24 05:31:30');

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
CREATE TABLE IF NOT EXISTS `employees` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `hire_date` date NOT NULL,
  `department_id` int DEFAULT NULL,
  `salary` decimal(10,2) DEFAULT NULL,
  `aadhar` varchar(20) NOT NULL,
  `pan` varchar(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `uniqueid` varchar(255) DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `department_id` (`department_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

DROP TABLE IF EXISTS `invoice`;
CREATE TABLE IF NOT EXISTS `invoice` (
  `invoice_id` int NOT NULL AUTO_INCREMENT,
  `invoice_number` varchar(20) NOT NULL,
  `invoice_date` date NOT NULL,
  `gst` double DEFAULT NULL,
  `discount` double DEFAULT NULL,
  `content` text,
  `invoice_option` text,
  `additional_fields` text,
  `payment_status` tinyint DEFAULT '0',
  `currency` varchar(20) DEFAULT NULL,
  `total` double DEFAULT NULL,
  `client_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`invoice_id`),
  KEY `fk_0001` (`client_id`),
  KEY `fk_sda` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `invoice`
--

INSERT INTO `invoice` (`invoice_id`, `invoice_number`, `invoice_date`, `gst`, `discount`, `content`, `invoice_option`, `additional_fields`, `payment_status`, `currency`, `total`, `client_id`, `user_id`, `created_at`, `updated_at`) VALUES
(2, 'Anky/01', '2024-05-18', 18, 9, '[[\"gkgiyf\",\"\",\"80\",\"1\"]]', '[]', '[]', 1, 'INR', 85.9, 6, 1, '2024-05-31 01:27:41', '2024-05-30 19:57:41'),
(3, 'Anky/02', '2024-04-16', 18, 8, '[[\"yrieu\",\"\",\"1234\",\"4\"]]', '[]', '[]', 0, 'INR', 5358.52, 5, 1, '2024-05-31 01:28:30', '2024-05-30 19:58:30'),
(4, 'Anky/03', '2024-05-12', 18, 2, '[[\"erp\",\"\",\"1000\",\"2\"]]', '[]', '[]', 0, 'US Dollar', 2312.8, 3, 1, '2024-05-31 10:26:00', '2024-05-31 04:56:00'),
(5, 'INTL/JUN24/5', '2024-06-26', 0, 0, '[[\"Domain\",\"\",\"1500\",\"1\"],[\"SSL Certificate\",\"\",\"4500\",\"1\"],[\"Server\",\"\",\"4000\",\"1\"],[\"Server Maintainance\",\"\",\"5000\",\"1\"],[\"Website Maintainance\",\"\",\"5000\",\"1\"],[\"Website Redesigning\",\"\",\"20000\",\"1\"]]', '[]', '[]', 1, 'INR', 40000, 2, 2, '2024-06-26 01:26:21', '2024-06-25 19:56:21');

-- --------------------------------------------------------

--
-- Table structure for table `leave_requests`
--

DROP TABLE IF EXISTS `leave_requests`;
CREATE TABLE IF NOT EXISTS `leave_requests` (
  `id` int NOT NULL AUTO_INCREMENT,
  `employee_id` int DEFAULT NULL,
  `leave_type_id` int DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `status` enum('pending','approved','rejected') DEFAULT 'pending',
  `reason` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `leave_type_id` (`leave_type_id`),
  KEY `employee_id` (`employee_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `leave_requests`
--

INSERT INTO `leave_requests` (`id`, `employee_id`, `leave_type_id`, `start_date`, `end_date`, `status`, `reason`, `created_at`, `updated_at`) VALUES
(1, 1, 2, '2024-06-27', '2024-06-28', 'pending', 'Test', '2024-06-23 20:38:06', '2024-06-23 20:38:06'),
(7, 2, 5, '2024-07-05', '2024-08-06', 'pending', 'work off', '2024-06-24 05:34:04', '2024-06-24 05:34:04'),
(8, 1, 2, '2024-06-26', '2024-06-27', 'pending', '', '2024-06-24 19:13:31', '2024-06-25 21:25:05');

-- --------------------------------------------------------

--
-- Table structure for table `leave_types`
--

DROP TABLE IF EXISTS `leave_types`;
CREATE TABLE IF NOT EXISTS `leave_types` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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

DROP TABLE IF EXISTS `login_log`;
CREATE TABLE IF NOT EXISTS `login_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `login_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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

DROP TABLE IF EXISTS `manager`;
CREATE TABLE IF NOT EXISTS `manager` (
  `manager_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `phonenumber` bigint NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `is_deleted` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`manager_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `manager`
--

INSERT INTO `manager` (`manager_id`, `name`, `email`, `address`, `phonenumber`, `created_at`, `updated_at`, `is_deleted`) VALUES
(1, 'Smita Patil', 'smita123@gmail.com', 'Pune', 6360899620, '2024-06-03 10:46:41', '2024-06-03 10:46:41', 0);

-- --------------------------------------------------------

--
-- Table structure for table `purchase`
--

DROP TABLE IF EXISTS `purchase`;
CREATE TABLE IF NOT EXISTS `purchase` (
  `purchase_id` int NOT NULL AUTO_INCREMENT,
  `vendor_id` int NOT NULL,
  `item` varchar(100) NOT NULL,
  `hsn` varchar(20) NOT NULL,
  `paymentstatus` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `amount` double NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `is_deleted` int DEFAULT '0',
  PRIMARY KEY (`purchase_id`),
  KEY `vendor_id` (`vendor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `purchase`
--

INSERT INTO `purchase` (`purchase_id`, `vendor_id`, `item`, `hsn`, `paymentstatus`, `amount`, `created_at`, `updated_at`, `is_deleted`) VALUES
(1, 1, 'shoes', 'cueuf8', 'Paid', 2000, '2024-05-04 19:25:51', NULL, 0),
(2, 1, 'baraf', 'abcd', 'not paid', 2000, '2024-05-05 11:34:40', NULL, 0),
(3, 1, 'AC', 'abcd', 'Paid', 2000, '2024-05-23 12:42:08', NULL, 0),
(4, 2, 'Tables and chairs', 'cueuf8', 'Pending', 2000, '2024-05-29 11:40:57', NULL, 0),
(5, 2, 'baraf', '', 'Paid', 2000, '2024-05-30 19:48:00', NULL, 0),
(6, 1, 'AC', '', 'Pending', 2000, '2024-05-31 04:58:41', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `reset_password`
--

DROP TABLE IF EXISTS `reset_password`;
CREATE TABLE IF NOT EXISTS `reset_password` (
  `reset_password_id` int NOT NULL AUTO_INCREMENT,
  `reset_hash` text NOT NULL,
  `email` varchar(100) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`reset_password_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `salary`
--

DROP TABLE IF EXISTS `salary`;
CREATE TABLE IF NOT EXISTS `salary` (
  `id` int NOT NULL AUTO_INCREMENT,
  `employee_id` int NOT NULL,
  `date` date NOT NULL,
  `basic_and_da` int NOT NULL,
  `hra` int NOT NULL,
  `overtime` int NOT NULL,
  `overtime_done` int DEFAULT '0',
  `contribution_to_pf` int NOT NULL,
  `esic` int NOT NULL,
  `lwf` int NOT NULL,
  `salary_advance` int DEFAULT '0',
  `salary_advance_deducted` int DEFAULT '0',
  `remaining_leaves` int DEFAULT NULL,
  `leaves_taken` int NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `employee_id` (`employee_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `salary`
--

INSERT INTO `salary` (`id`, `employee_id`, `date`, `basic_and_da`, `hra`, `overtime`, `overtime_done`, `contribution_to_pf`, `esic`, `lwf`, `salary_advance`, `salary_advance_deducted`, `remaining_leaves`, `leaves_taken`, `created_at`, `updated_at`) VALUES
(1, 1, '2024-06-23', 30000, 5000, 500, 2, 1000, 100, 1000, 0, 500, NULL, 10, '2024-06-24 01:50:11', '2024-06-23 20:20:11'),
(2, 3, '2024-06-24', 20000, 1000, 175, NULL, 1000, 100, 240, 0, 0, NULL, 0, '2024-06-24 11:01:59', '2024-06-24 05:31:59');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `fullname` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `image` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `level` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `is_deleted` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`),
  KEY `username` (`username`),
  KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `fullname`, `password`, `image`, `email`, `level`, `created_at`, `updated_at`, `is_deleted`) VALUES
(1, 'Saibha', 'Saibha Shaikhali', '$2y$13$9XXy2lDPz1U5yV7UupoPpegejG6CiSlEObJddrekPzG8HsVKEVmUu', 'E-TRP1cEeYx69wZb8r_U.jpg', 'saibha@gmail.com', 1, '2024-05-01 16:52:41', '2024-05-30 20:03:57', 0),
(2, 'Rutika', 'Rutika Patil', '$2y$13$K0LVI.ULiUwq/Kt0aC0sV.tSsjPF9ury7f/6pNpA1xXHfqBAdNbKG', '1716135346.jpg', 'rutikapatil270@gmail.com', 1, '2024-05-01 16:57:50', '2024-06-26 09:28:37', 0),
(4, 'Snehal', 'Snehal Patil', '$2y$13$khVR7hAcIwD1/pJ9e8qi3.iN4RjF5GOY.aIYRDHKCun8uCsFOz/ea', '1716135346.jpg', 'snehal123@gmail.com', 2, '2024-05-19 16:15:46', '2024-05-20 18:59:44', 0),
(5, 'Afra', 'Afra Pathan', '$2y$13$CcqeuriKeXZT/Yn2lK7VK.xvo8jytfZi.HiwHRUaGx57uG55JtJCy', '', '2gi22mc011@students.git.edu', 3, '2024-06-20 17:14:43', '2024-06-20 17:15:07', 0),
(6, 'Dakshata', 'Dakshata Patil', '$2y$13$rUKvx/yNemgNd2U/mtVzduHErOzdaVQPOIi84gxw2XqhOsm85gSum', '', 'dakshatapatil4289@gmail.com', 3, '2024-06-21 20:26:48', '0000-00-00 00:00:00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `vendor`
--

DROP TABLE IF EXISTS `vendor`;
CREATE TABLE IF NOT EXISTS `vendor` (
  `vendor_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(50) NOT NULL,
  `contact` bigint NOT NULL,
  `pan` varchar(20) NOT NULL,
  `gstin` varchar(30) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `is_deleted` int DEFAULT '0',
  PRIMARY KEY (`vendor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `vendor`
--

INSERT INTO `vendor` (`vendor_id`, `name`, `email`, `contact`, `pan`, `gstin`, `created_at`, `updated_at`, `is_deleted`) VALUES
(1, 'Rutika Patil', 'rutikapatil270@gmail.com', 7975656561, 'BYKPU7656Q', 'GSTIN-294532BGM', NULL, NULL, NULL);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `client`
--
ALTER TABLE `client`
  ADD CONSTRAINT `client_ibfk_1` FOREIGN KEY (`manager_id`) REFERENCES `manager` (`manager_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `employees`
--
ALTER TABLE `employees`
  ADD CONSTRAINT `employees_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `employees_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `invoice`
--
ALTER TABLE `invoice`
  ADD CONSTRAINT `fk_0001` FOREIGN KEY (`client_id`) REFERENCES `client` (`client_id`),
  ADD CONSTRAINT `fk_sda` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `leave_requests`
--
ALTER TABLE `leave_requests`
  ADD CONSTRAINT `leave_requests_ibfk_2` FOREIGN KEY (`leave_type_id`) REFERENCES `leave_types` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `leave_requests_ibfk_3` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `login_log`
--
ALTER TABLE `login_log`
  ADD CONSTRAINT `login_log_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `purchase`
--
ALTER TABLE `purchase`
  ADD CONSTRAINT `purchase_ibfk_1` FOREIGN KEY (`vendor_id`) REFERENCES `vendor` (`vendor_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `salary`
--
ALTER TABLE `salary`
  ADD CONSTRAINT `salary_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
