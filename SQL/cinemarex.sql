-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 10, 2020 at 03:37 PM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cinemarex`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '/img/avatar.png',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `password`, `image`, `remember_token`, `created_at`, `updated_at`) VALUES
('d67c9750-0f82-11ea-ad98-9101ed6d78df', 'admin Name', 'vijendra3582@gmail.com', '$2y$10$fIkLfeIiqp6mWU4qkjGLbufG21yABFUBVxuAyg8satgtpuv7/jtIS', '/img/avatar.png', 'nFBhwZewUxiQyccQRDUtpAX86OvbmtfPRGRdfXtaYtsKqyVWMF9tLxdegztu', '2019-11-25 07:25:20', '2019-11-26 00:24:38'),
('d69c74c0-0f82-11ea-b7fc-a3ec8e9a572b', 'Manager Name', 'manager@example.com', '$2y$10$u03dydbRdFdW9VytJCSbj.kUIsIvtqJ0.SQ5kfAZxglh3q.gdlxV2', '/img/avatar.png', NULL, '2019-11-25 07:25:20', '2019-11-25 07:25:20');

-- --------------------------------------------------------

--
-- Table structure for table `admin_role`
--

CREATE TABLE `admin_role` (
  `id` int(10) UNSIGNED NOT NULL,
  `role_id` int(11) NOT NULL,
  `admin_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_role`
--

INSERT INTO `admin_role` (`id`, `role_id`, `admin_id`, `created_at`, `updated_at`) VALUES
(1, 1, 'd67c9750-0f82-11ea-ad98-9101ed6d78df', '2019-11-25 07:25:20', '2019-11-25 07:25:20'),
(2, 2, 'd69c74c0-0f82-11ea-b7fc-a3ec8e9a572b', '2019-11-25 07:25:20', '2019-11-25 07:25:20');

-- --------------------------------------------------------

--
-- Table structure for table `backups`
--

CREATE TABLE `backups` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `braintrees`
--

CREATE TABLE `braintrees` (
  `id` int(10) UNSIGNED NOT NULL,
  `plan_id` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `plan_name` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `plan_amount` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `plan_interval` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `plan_currency` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `plan_trial` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `braintrees`
--

INSERT INTO `braintrees` (`id`, `plan_id`, `plan_name`, `plan_amount`, `plan_interval`, `plan_currency`, `plan_trial`, `created_at`, `updated_at`) VALUES
(1, '5x7w', 'Entrepreneurs', '500.00', NULL, 'USD', NULL, '2020-02-14 04:13:19', '2020-02-14 04:13:19'),
(2, '8wtg', 'Kids Learning', '190.00', NULL, 'USD', NULL, '2020-02-14 04:13:21', '2020-02-14 04:13:21'),
(3, 'pv6r', 'School Education', '290.00', NULL, 'USD', NULL, '2020-02-14 04:13:22', '2020-02-14 04:13:22');

-- --------------------------------------------------------

--
-- Table structure for table `casts`
--

CREATE TABLE `casts` (
  `c_id` int(10) UNSIGNED NOT NULL,
  `credit_id` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `c_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `c_image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `c_cloud` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `casts`
--

INSERT INTO `casts` (`c_id`, `credit_id`, `c_name`, `c_image`, `c_cloud`, `created_at`, `updated_at`) VALUES
(7, 'MUK8k7d2Wp0k6kbGnzXX', 'Anushka Sharma', '/storage/casts/MLxU3ArRoYrtUZHhl5LB.jpg', 'local', '2019-11-26 04:07:30', '2019-11-26 04:07:30'),
(8, '82HKKeD9vIAma21s2NFW', 'Rajkumar Rao', '/storage/casts/t6fsmKCWrGF4sakh24ip.jpg', 'local', '2019-11-26 04:07:44', '2019-11-26 04:07:44'),
(9, 'kEraS7k2Ms7kbo7SYDzx', 'Aditya Roy Kapoor', '/storage/casts/P89L4mAFIPH9jfyn4N3x.jpg', 'local', '2019-11-26 04:07:56', '2019-11-26 04:07:56'),
(10, 'gbjCxlZzyfsMZmfnfeXe', 'Akshay Kumar', '/storage/casts/KtKHCgV2sNXIqwEK66gF.jpg', 'local', '2019-11-26 04:08:05', '2019-11-26 04:08:05'),
(11, 'vcf7SHPPoy0YObu3Es4M', 'Hritik Roshan', '/storage/casts/F5pB5iLYM1uZ6V9DG1zt.jpg', 'local', '2019-11-26 04:08:18', '2019-11-26 04:08:18'),
(12, 'XrQq9QbzBq0KTxrGXq5S', 'Ayushmann khurrana', '/storage/casts/ZoIT9mI6LBLFLrN2C2xO.jpg', 'local', '2019-11-26 04:08:40', '2019-11-26 04:08:40'),
(13, '1qeYB6E7xVmA9oACL869', 'Kriti Kharbanda', '/storage/casts/fzyzieGl6PQmcBjBRLac.jpg', 'local', '2019-11-26 04:08:52', '2019-11-26 04:08:52'),
(14, 'dYBozB0FVKGeWW6N88Tx', 'Kriti Kharbanda', '/storage/casts/yONgH4bfbSn4NtEafwQg.jpg', 'local', '2019-11-26 04:09:00', '2019-11-26 04:09:00'),
(15, 'gNweOdMIt6CYm8dlopEy', 'Tom Cruise', '/storage/casts/gpEDJ03A1jtLLTlhaxUy.jpg', 'local', '2019-11-26 04:09:10', '2019-11-26 04:09:10'),
(16, 'hQdsftIS7PUBFDsdRagh', 'Nana Patekar', '/storage/casts/6HBpwmxG3TOFpJHZEY1S.jpg', 'local', '2019-11-26 04:17:16', '2019-11-26 04:17:16'),
(17, 'C2BkTPbsBORVQ1vni8tf', 'Anil Kapoor', '/storage/casts/ihZLhuka1k552VzMZf5H.jpg', 'local', '2019-11-26 04:17:38', '2019-11-26 04:17:38'),
(18, 'V9UpupaCBO4qKO2x5qQF', 'Amir Khan', '/storage/casts/91L5zGlFTTcgFG5OtluQ.jpg', 'local', '2019-11-26 04:17:50', '2019-11-26 04:17:50'),
(19, '7tjhVu8yOqiCOJTMfW7t', 'Abhishek Bachchan', '/storage/casts/XsN1RbKz87O4TJwtyxg4.jpg', 'local', '2019-11-26 04:18:04', '2019-11-26 04:18:04'),
(20, 'WjS9iZp8y8ZAAReS5HLQ', 'Salman Khan', '/storage/casts/prZa9hblVmAGEmbVBlvj.jpg', 'local', '2019-11-26 04:18:21', '2019-11-26 04:18:21'),
(21, 'N7nlTG89ZlmgBZs9OCQJ', 'Sanjay Dutt', '/storage/casts/wxs2hcKf8nqmauBaLDEQ.jpg', 'local', '2019-11-26 04:18:32', '2019-11-26 04:18:32'),
(22, 'avX8iadmvmOAmyroviQs', 'Riteish Deshmukh', '/storage/casts/0K6oTzqqz97OOIfImAH2.jpg', 'local', '2019-11-26 04:19:02', '2019-11-26 04:19:02'),
(23, 'fHOPzyFU8GxgFaDcuqBv', 'Amitabh Bachchan', '/storage/casts/bZBaEGxBJRfRuhSu3XxR.jpg', 'local', '2019-11-26 04:19:13', '2019-11-26 04:19:13'),
(24, 'M5NE7omUdfBaO3E8RNvG', 'Govinda', '/storage/casts/3MUlg5c1uCyFO1HcPTgz.jpg', 'local', '2019-11-26 04:19:20', '2019-11-26 04:19:20'),
(25, '1xw0OPATWhiO179eE5Z3', 'Ranbir Kapoor', '/storage/casts/0qaczJw3AilU9KUtml3k.jpg', 'local', '2019-11-26 04:19:35', '2019-11-26 04:19:35'),
(26, '0669nYr68F9QZbvDq16R', 'Shahid Kapoor', '/storage/casts/3XqCpPYYl3L48AeqINiV.jpg', 'local', '2019-11-26 04:19:43', '2019-11-26 04:19:43'),
(27, 'DBGBcs6wKPk0yY03Nsp4', 'Shahrukh Khan', '/storage/casts/vPH5uXEKEJoEb8OCYW61.jpg', 'local', '2019-11-26 04:19:56', '2019-11-26 04:19:56'),
(28, 'eJKq5TJeVFM0lq0JX76O', 'Ranveer Singh', '/storage/casts/QEbOeMDPk6mdKF2H5Fwp.jpg', 'local', '2019-11-26 04:20:05', '2019-11-26 04:20:05'),
(29, 'W6eonuXlWj9FxfLFYLbk', 'Vijendra', '/storage/casts/VtwlEmqk3fpyJIQzu63a.jpg', 'local', '2019-11-28 05:34:07', '2019-11-28 05:34:07'),
(30, 'ooR3VexgiEzIkpKxzrQ5', 'Aftab Raja', '/storage/casts/EOMtxtEjh8Pp4c5qNdP3.jpg', 'local', '2019-11-28 05:34:07', '2019-11-28 05:34:07'),
(31, 'pSdwIxEqTTNiKOWkXAgE', 'Neeraj Pandey', '/storage/casts/XCMogYfC0Z9210B0txuu.jpg', 'local', '2019-11-28 05:34:07', '2019-11-28 05:34:07'),
(32, '21D5KSRisrbBeEZfXqxb', 'Anil Tomar', '/storage/casts/GgzQQ7MUoVhqxrmJFDF4.jpg', 'local', '2019-11-28 05:34:07', '2019-11-28 05:34:07');

-- --------------------------------------------------------

--
-- Table structure for table `casts_rules`
--

CREATE TABLE `casts_rules` (
  `id` int(10) UNSIGNED NOT NULL,
  `casts_id` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `casts_movies` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `casts_series` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `casts_rules`
--

INSERT INTO `casts_rules` (`id`, `casts_id`, `casts_movies`, `casts_series`, `created_at`, `updated_at`) VALUES
(13, 'ooR3VexgiEzIkpKxzrQ5', 'cbc11fc0-11ce-11ea-941a-438f301cf6ef', NULL, '2019-11-28 06:01:31', '2019-11-28 06:01:31'),
(14, '21D5KSRisrbBeEZfXqxb', 'cbc11fc0-11ce-11ea-941a-438f301cf6ef', NULL, '2019-11-28 06:01:31', '2019-11-28 06:01:31'),
(15, 'pSdwIxEqTTNiKOWkXAgE', 'cbc11fc0-11ce-11ea-941a-438f301cf6ef', NULL, '2019-11-28 06:01:31', '2019-11-28 06:01:31'),
(16, 'W6eonuXlWj9FxfLFYLbk', 'cbc11fc0-11ce-11ea-941a-438f301cf6ef', NULL, '2019-11-28 06:01:31', '2019-11-28 06:01:31');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(70) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kind` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `kind`, `image`, `active`, `created_at`, `updated_at`) VALUES
(2, 'Information Technology', 'course', '/storage/categories/Jyn0TVHkkaFpIAh3oxFc.jpg', 1, '2019-11-26 05:11:00', '2019-11-27 00:48:55'),
(3, 'Language', 'course', '/storage/categories/euFVPnIi0rksTJaRGc42.jpg', 1, '2019-11-26 05:11:28', '2019-11-27 00:48:57'),
(4, 'Science', 'course', '/storage/categories/MczsFIxuJg07q55asDKM.jpg', 1, '2019-11-26 05:11:53', '2019-11-27 00:48:58'),
(5, 'Health', 'course', '/storage/categories/YzPdFTmOHKKjs9qeI7c1.jpg', 1, '2019-11-26 05:12:07', '2019-11-27 00:48:58'),
(6, 'Humanities', 'course', '/storage/categories/gZds5047J3tYZKIYetwt.jpg', 1, '2019-11-26 05:12:27', '2019-11-27 00:49:00'),
(7, 'Software Development', 'course', '/storage/categories/FRqieGSspFVrvL4ZEuIn.jpg', 1, '2019-11-26 05:12:45', '2019-11-27 00:49:01'),
(8, 'Marketing', 'course', '/storage/categories/yMpDxKGEdIFbN9wEfD8A.jpg', 1, '2019-11-26 05:13:07', '2019-11-27 00:49:01'),
(9, 'Business', 'course', '/storage/categories/dr12YF0F4Ix7lsfhwGV4.jpg', 1, '2019-11-26 05:13:21', '2019-11-27 00:49:02'),
(10, 'Math', 'course', '/storage/categories/pPZabshqFYkntgqWFPZV.jpg', 1, '2019-11-26 05:13:33', '2019-11-27 00:49:02'),
(11, 'Operations', 'course', '/storage/categories/RyZG3TL6aQ5ccszG86nr.jpg', 1, '2019-11-26 05:13:55', '2019-11-27 00:49:04'),
(12, 'Life Science', 'course', '/storage/categories/ehqRvH8Cgq2VvIzdG475.jpg', 1, '2019-11-26 05:14:09', '2019-11-27 00:49:04'),
(13, 'Health Care', 'course', '/storage/categories/u9srcbMy7zomviyx281X.jpg', 1, '2019-11-26 05:14:23', '2019-11-27 00:49:05'),
(14, 'Software Engineering', 'course', '/storage/categories/Oqi37oUBRTY3Qezh6LkR.jpg', 1, '2019-11-26 05:14:44', '2019-11-27 00:49:05'),
(15, 'Lifestyle', 'course', '/storage/categories/2iFAUwk1WyBqeYXBwHKD.jpg', 1, '2019-11-26 05:15:04', '2019-11-27 00:49:07'),
(16, 'Skilled Trades', 'course', '/storage/categories/MB6TUFXCGpLHj3uFTAZH.jpg', 1, '2019-11-26 05:15:26', '2019-11-27 00:49:22'),
(17, 'Finance', 'course', '/storage/categories/qZUBFWLrC8PYncR7RygP.jpg', 1, '2019-11-26 05:15:42', '2019-11-27 00:49:23');

-- --------------------------------------------------------

--
-- Table structure for table `collections`
--

CREATE TABLE `collections` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `collection_lists`
--

CREATE TABLE `collection_lists` (
  `id` int(10) UNSIGNED NOT NULL,
  `movie_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `series_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `collection_id` int(10) UNSIGNED NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `episodes`
--

CREATE TABLE `episodes` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `series_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `episode_number` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `overview` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `backdrop` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `season_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `show` tinyint(1) NOT NULL DEFAULT 0,
  `cloud` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `genres`
--

CREATE TABLE `genres` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `genres`
--

INSERT INTO `genres` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Action', '2019-11-27 05:33:43', '2019-11-27 05:33:43'),
(2, 'Adventure', '2019-11-27 05:33:43', '2019-11-27 05:33:43'),
(3, 'Animation', '2019-11-27 05:36:37', '2019-11-27 05:36:37'),
(4, 'Biography', '2019-11-27 05:36:38', '2019-11-27 05:36:38'),
(5, 'Comedy', '2019-11-27 05:36:38', '2019-11-27 05:36:38'),
(6, 'Crime', '2019-11-27 05:36:38', '2019-11-27 05:36:38'),
(7, 'Documentary', '2019-11-27 05:36:38', '2019-11-27 05:36:38'),
(8, 'Drama', '2019-11-27 05:36:38', '2019-11-27 05:36:38'),
(9, 'Family', '2019-11-27 05:36:38', '2019-11-27 05:36:38'),
(10, 'Fantasy', '2019-11-27 05:36:38', '2019-11-27 05:36:38'),
(11, 'Film Noir', '2019-11-27 05:36:38', '2019-11-27 05:36:38'),
(12, 'History', '2019-11-27 05:36:38', '2019-11-27 05:36:38'),
(13, 'Horror', '2019-11-27 05:36:38', '2019-11-27 05:36:38'),
(14, 'Music', '2019-11-27 05:36:38', '2019-11-27 05:36:38'),
(15, 'Musical', '2019-11-27 05:37:43', '2019-11-27 05:37:43'),
(16, 'Mystery', '2019-11-27 05:37:43', '2019-11-27 05:37:43'),
(17, 'Romance', '2019-11-27 05:37:43', '2019-11-27 05:37:43'),
(18, 'Sci-Fi', '2019-11-27 05:37:43', '2019-11-27 05:37:43'),
(19, 'Short', '2019-11-27 05:37:43', '2019-11-27 05:37:43'),
(20, 'Sport', '2019-11-27 05:37:43', '2019-11-27 05:37:43'),
(21, 'Superhero', '2019-11-27 05:37:43', '2019-11-27 05:37:43'),
(22, 'Thriller', '2019-11-27 05:37:43', '2019-11-27 05:37:43'),
(23, 'War', '2019-11-27 05:37:43', '2019-11-27 05:37:43'),
(24, 'Western', '2019-11-27 05:37:43', '2019-11-27 05:37:43');

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

CREATE TABLE `likes` (
  `id` int(10) UNSIGNED NOT NULL,
  `movie_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `series_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `location_logs`
--

CREATE TABLE `location_logs` (
  `id` int(10) UNSIGNED NOT NULL,
  `status` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_code` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zip_code` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `isp` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_agent` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `confirm_hash` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `location_logs`
--

INSERT INTO `location_logs` (`id`, `status`, `country_code`, `country`, `city`, `ip`, `zip_code`, `isp`, `user_agent`, `confirm_hash`, `uid`, `created_at`, `updated_at`) VALUES
(1, 'on', 'IN', 'India', 'Gurgaon', '103.46.236.210', '122003', 'World Star Communica', NULL, NULL, '1', '2020-02-14 04:46:41', '2020-02-17 01:09:52');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(10) UNSIGNED NOT NULL,
  `message_type` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message_title` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message_info` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message_image` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(4, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(5, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(6, '2016_06_01_000004_create_oauth_clients_table', 1),
(7, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(8, '2017_08_08_071505_create_movies_table', 1),
(9, '2017_08_08_071518_create_series_table', 1),
(10, '2017_08_08_071535_create_episodes_table', 1),
(11, '2017_08_08_071606_create_messages_table', 1),
(12, '2017_08_08_071623_create_reports_table', 1),
(13, '2017_08_08_071633_create_tops_table', 1),
(14, '2017_08_08_072816_create_collections_table', 1),
(15, '2017_08_08_073428_create_collection_lists_table', 1),
(16, '2017_08_08_081525_create_casts_table', 1),
(17, '2017_08_08_081907_create_casts_rules_table', 1),
(18, '2017_08_29_111910_create_likes_table', 1),
(19, '2017_09_03_101540_create_subtitles_table', 1),
(20, '2017_09_15_125358_create_admins_table', 1),
(21, '2017_09_23_095647_create_roles_table', 1),
(22, '2017_09_23_095819_create_admin_role_table', 1),
(23, '2017_09_25_140048_create_videos_table', 1),
(24, '2017_10_19_152803_create-backups-table', 1),
(25, '2017_10_23_105047_create_subscriptions_table', 1),
(26, '2017_11_09_162219_create_recenlty_watcheds_table', 1),
(27, '2017_11_18_130344_create_tvs_table', 1),
(28, '2017_11_30_181331_create_plugins_table', 1),
(29, '2018_01_15_184527_create_siteinfos_table', 1),
(30, '2018_01_31_144058_create_tmdbs_table', 1),
(31, '2018_02_02_111302_create_transcoders_table', 1),
(32, '2018_02_12_123619_create_braintrees_table', 1),
(33, '2018_04_09_172854_create_supports_table', 1),
(34, '2018_04_09_173816_create_support_responses_table', 1),
(35, '2018_07_13_172459_create_location_logs_table', 1),
(36, '2018_10_25_165021_create_categories_table', 1),
(37, '2019_02_14_005451_alter_table_oauth_access_tokens', 1);

-- --------------------------------------------------------

--
-- Table structure for table `movies`
--

CREATE TABLE `movies` (
  `m_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `m_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `m_desc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `m_genre` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `m_year` int(11) NOT NULL,
  `m_age` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `m_rate` double(8,2) NOT NULL,
  `m_runtime` double(8,2) NOT NULL DEFAULT 0.00,
  `m_youtube` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `m_cloud` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `m_poster` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `m_backdrop` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `m_category` int(11) NOT NULL,
  `show` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `movies`
--

INSERT INTO `movies` (`m_id`, `m_name`, `m_desc`, `m_genre`, `m_year`, `m_age`, `m_rate`, `m_runtime`, `m_youtube`, `m_cloud`, `m_poster`, `m_backdrop`, `m_category`, `show`, `created_at`, `updated_at`) VALUES
('cbc11fc0-11ce-11ea-941a-438f301cf6ef', 'Web Development Using Angular', 'MEAN is a free and open-source JavaScript software stack for building dynamic web sites and web applications. The MEAN stack is MongoDB, Express.js, AngularJS, and Node.js.', 'Action,Adventure,Animation,Biography', 2020, 'PG', 5.00, 5.00, 'https://www.youtube.com/watch?v=AJtDXIazrMo', 'local', 'Ci5VqOE3UO4IrrtgDSIc.jpg', 'o7U2MjyY05ZhcZ3Bz7p8.jpg', 2, 0, '2019-11-28 05:34:06', '2019-11-28 06:01:31');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  `user_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`, `user_id`) VALUES
('1becb52e8216322d8aeba0f8e51f5dc902783a642911a67b0f0c3428155ed7193a155ef9f196279e', 4, NULL, '[]', 0, '2020-02-17 00:56:01', '2020-02-17 00:56:01', '2020-05-17 06:26:01', 'a2c76db0-4f11-11ea-8924-9f8301f58e6c'),
('38fad19f85c1ef35cbe51ba112520093a4a4d54857532edfc9a7f0b16a430966de85ebd01d3f8007', 4, NULL, '[]', 0, '2020-02-17 01:09:42', '2020-02-17 01:09:42', '2020-05-17 06:39:42', 'a2c76db0-4f11-11ea-8924-9f8301f58e6c'),
('4ac73fda655a5820e3690b8b331e2c57cdb3199c80e6e5436a6bf03e7da9edef2c02baf275a33c42', 4, NULL, '[]', 0, '2020-02-17 01:02:55', '2020-02-17 01:02:55', '2020-05-17 06:32:55', 'a2c76db0-4f11-11ea-8924-9f8301f58e6c'),
('52808096b51977dd72334ce236faadfe91efd062abed45b3011c76819b73b29ef319139c474f2574', 4, NULL, '[]', 0, '2020-02-17 00:56:39', '2020-02-17 00:56:39', '2020-05-17 06:26:39', 'a2c76db0-4f11-11ea-8924-9f8301f58e6c'),
('5a207722d4eddce3b61eb1e6d0b7d6c2a543a4847a32ab6fef7cbea0900c60a0801bca76fa336a7a', 4, NULL, '[]', 0, '2020-02-17 01:02:32', '2020-02-17 01:02:32', '2020-05-17 06:32:32', 'a2c76db0-4f11-11ea-8924-9f8301f58e6c'),
('5b1638a5ab9d901cb41298db40bf37d08618d017d277acccbdd7f1d1930fb863f14eb1c569958e8e', 4, NULL, '[]', 0, '2020-02-17 01:12:13', '2020-02-17 01:12:13', '2020-05-17 06:42:13', 'a2c76db0-4f11-11ea-8924-9f8301f58e6c'),
('6a9f00710c4076264c1e24794f83ed5edf92bb9111f2e44eb3516db8ec12f9599c96c1873362ef69', 4, NULL, '[]', 0, '2020-02-17 01:00:45', '2020-02-17 01:00:45', '2020-05-17 06:30:45', 'a2c76db0-4f11-11ea-8924-9f8301f58e6c'),
('6afad97ca4ec173f54dff56c3f6b04e2eb9978a558074a87d797da8ed0170a729a207c2311af31c0', 4, NULL, '[]', 0, '2020-02-17 00:57:54', '2020-02-17 00:57:54', '2020-05-17 06:27:54', 'a2c76db0-4f11-11ea-8924-9f8301f58e6c'),
('6ecc3e2c145238f38828e05fc1b86768ee9dcf69f5eda93cf2176af20c7221ece4c728c08d9d0c31', 4, NULL, '[]', 0, '2020-02-17 01:17:47', '2020-02-17 01:17:47', '2020-05-17 06:47:47', '1'),
('a27dc8ff8965be7f2bead9e296a0e72763a9585b551aab216fa79a83b125fd1aa655b2aacc34fee5', 4, NULL, '[]', 0, '2020-02-17 01:03:39', '2020-02-17 01:03:39', '2020-05-17 06:33:39', 'a2c76db0-4f11-11ea-8924-9f8301f58e6c'),
('ab2292bd8a21176b050208ce34368a4b53537fcb2976c49889e7f77955c79f389de19dea30f9a716', 4, NULL, '[]', 0, '2020-02-17 00:56:17', '2020-02-17 00:56:17', '2020-05-17 06:26:17', 'a2c76db0-4f11-11ea-8924-9f8301f58e6c'),
('c78983ff0a6f4c5a7975d08d5c729b10a5096d329454b0199a3db464042bce29bc28b3d4c7d8ce29', 4, NULL, '[]', 0, '2020-02-17 01:10:08', '2020-02-17 01:10:08', '2020-05-17 06:40:08', 'a2c76db0-4f11-11ea-8924-9f8301f58e6c'),
('d7db937200d2c0a98cd548bb5c1fb2d7a46e8cbd5afc661e4f48bf0b611d116468407cf3196e9c12', 4, NULL, '[]', 0, '2020-02-17 00:57:15', '2020-02-17 00:57:15', '2020-05-17 06:27:15', 'a2c76db0-4f11-11ea-8924-9f8301f58e6c'),
('fe34de7cab83c8db8707994b2231695e815ecf2da3466d0fc96f0496ae3f575022d71fbc6d6d6796', 4, NULL, '[]', 0, '2020-02-17 01:03:59', '2020-02-17 01:03:59', '2020-05-17 06:33:59', 'a2c76db0-4f11-11ea-8924-9f8301f58e6c');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Vijendra', 'rF62LKhCNUxD2ROBWtiDx7rn4fYhDtGCrzqoBov1', 'http://localhost', 1, 0, 0, '2020-02-14 04:18:03', '2020-02-14 04:18:03'),
(2, NULL, 'Education Streaming Personal Access Client', 'hXScH2rDjOuy4bPyZADF5qU3SlSmnPGrNFj2GXqo', 'http://localhost', 1, 0, 0, '2020-02-14 04:31:14', '2020-02-14 04:31:14'),
(3, NULL, 'Education Streaming Password Grant Client', 'CjvMvtBVjVk88CiYcfXEE6jrpyDoqMoEgTv4ujrz', 'http://localhost', 0, 1, 0, '2020-02-14 04:31:14', '2020-02-14 04:31:14'),
(4, NULL, 'user', 'aRNyPUTZpg4vAT4PNCBV3o8KPYsJnDrKMEyudA2m', 'http://localhost', 0, 1, 0, '2020-02-14 04:32:08', '2020-02-14 04:32:08');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2020-02-14 04:18:03', '2020-02-14 04:18:03'),
(2, 2, '2020-02-14 04:31:14', '2020-02-14 04:31:14');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_refresh_tokens`
--

INSERT INTO `oauth_refresh_tokens` (`id`, `access_token_id`, `revoked`, `expires_at`) VALUES
('096a77c50044d23cff18cba4dd6a6c136c28cfbd48664a2fee525f60ab25e611797f89535772b49d', '6ecc3e2c145238f38828e05fc1b86768ee9dcf69f5eda93cf2176af20c7221ece4c728c08d9d0c31', 0, '2021-02-17 06:47:47'),
('152b6c90d77a9822911f520096753a1958387b72589085c9c498c30b30f36736fe0ea3cd37720c75', 'a27dc8ff8965be7f2bead9e296a0e72763a9585b551aab216fa79a83b125fd1aa655b2aacc34fee5', 0, '2021-02-17 06:33:40'),
('300221806c508079f246c9aed5784f186b750a9c2ae9bf1768c8f660741816400c18ec6d2e272c67', 'c78983ff0a6f4c5a7975d08d5c729b10a5096d329454b0199a3db464042bce29bc28b3d4c7d8ce29', 0, '2021-02-17 06:40:08'),
('679d6d656065ab5ecea645dd401bc8806822c77c5237ef664db495ce2ec259a932f2d1db39200f7f', '52808096b51977dd72334ce236faadfe91efd062abed45b3011c76819b73b29ef319139c474f2574', 0, '2021-02-17 06:26:39'),
('7f24ed5aaefcd03f3a6ce56eaef864c364c298d87cb3fd2fd4bda6cb5ca731a5cea3046eb0b7c0f5', '4ac73fda655a5820e3690b8b331e2c57cdb3199c80e6e5436a6bf03e7da9edef2c02baf275a33c42', 0, '2021-02-17 06:32:55'),
('83836394cf2e5e34f0c7876b8eea85408eea4935a92826d711857f59af34a2bca1cd50cd90d696e0', '6afad97ca4ec173f54dff56c3f6b04e2eb9978a558074a87d797da8ed0170a729a207c2311af31c0', 0, '2021-02-17 06:27:55'),
('983dafb69d86f9fdcfd40cfc3cfb1bfcb7e4db61e9deeb7b37320243424dc9d6112b88a16cf69147', 'ab2292bd8a21176b050208ce34368a4b53537fcb2976c49889e7f77955c79f389de19dea30f9a716', 0, '2021-02-17 06:26:17'),
('9ef7858b93435ad32c494b7e87d12dcb8a1cabdebb851606c15d1cc98e5d809575ece2e029674741', '6a9f00710c4076264c1e24794f83ed5edf92bb9111f2e44eb3516db8ec12f9599c96c1873362ef69', 0, '2021-02-17 06:30:45'),
('a338595bd5db333f95a96c619cd83a4e3b29863d70b559f13a7697b6079e3a9e85e4dd7ef26c06a5', '38fad19f85c1ef35cbe51ba112520093a4a4d54857532edfc9a7f0b16a430966de85ebd01d3f8007', 0, '2021-02-17 06:39:42'),
('aa0da99318dcf112de2e7c095650d10a5a6bb5e7b5b1ffb2a67d23a8c5c33ae9a74fd44881dfff2c', '1becb52e8216322d8aeba0f8e51f5dc902783a642911a67b0f0c3428155ed7193a155ef9f196279e', 0, '2021-02-17 06:26:01'),
('b39801efe3ab163986c52d999c24d5ea600a683ec90195a381f048cd056481d33dc750a8872f6af3', '5a207722d4eddce3b61eb1e6d0b7d6c2a543a4847a32ab6fef7cbea0900c60a0801bca76fa336a7a', 0, '2021-02-17 06:32:32'),
('bc4f2454992e88bac15ceaace3aa98422dd94051bb57389a3dbfa6786c5ba25011347d6cc96c39c6', '93e194cdcf64fb852622766a814bf3bf753dc7abb6311963f70ee9b0ad1a0b67c578ac7e9fc6f485', 0, '2021-02-14 10:06:18'),
('d06245139e6515df978ea93205ebc307f912d51bde5412c8716313816baf66d3cdf23441d2370925', 'd7db937200d2c0a98cd548bb5c1fb2d7a46e8cbd5afc661e4f48bf0b611d116468407cf3196e9c12', 0, '2021-02-17 06:27:15'),
('dc750bb6a77c8890dbcf7a3cd604590be43debffb3ede0484291a61b0a4aea437497b7297bb8db6f', 'fe34de7cab83c8db8707994b2231695e815ecf2da3466d0fc96f0496ae3f575022d71fbc6d6d6796', 0, '2021-02-17 06:33:59'),
('e424b2b012492112c42146ed56aaa1158a60e72ec8a08e5265ad6e8e1ae14b6757da9477ba0f9d3d', '5b1638a5ab9d901cb41298db40bf37d08618d017d277acccbdd7f1d1930fb863f14eb1c569958e8e', 0, '2021-02-17 06:42:13');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `plugins`
--

CREATE TABLE `plugins` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `thumbnail` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'thumbnail.png',
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `type` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `plugins`
--

INSERT INTO `plugins` (`id`, `name`, `thumbnail`, `status`, `type`, `created_at`, `updated_at`) VALUES
(1, 'default', '/themes/default/thumbnail.png', 0, 'theme', '2019-11-25 07:25:20', '2019-11-25 07:25:20');

-- --------------------------------------------------------

--
-- Table structure for table `rating_systems`
--

CREATE TABLE `rating_systems` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `rating_systems`
--

INSERT INTO `rating_systems` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'G', '2019-11-27 06:25:11', '2019-11-27 06:25:11'),
(2, 'PG', '2019-11-27 06:25:11', '2019-11-27 06:25:11'),
(3, 'PG-13', '2019-11-27 06:25:30', '2019-11-27 06:25:30'),
(4, 'R', '2019-11-27 06:25:30', '2019-11-27 06:27:56'),
(5, 'X', '2019-11-27 06:27:51', '2019-11-27 06:28:00');

-- --------------------------------------------------------

--
-- Table structure for table `recently_watcheds`
--

CREATE TABLE `recently_watcheds` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `episode_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `series_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `movie_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_time` int(11) NOT NULL,
  `duration_time` int(11) NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

CREATE TABLE `reports` (
  `id` int(10) UNSIGNED NOT NULL,
  `report_details` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `report_userid` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `report_movie` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `report_episode` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `report_series` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `report_from` smallint(6) DEFAULT NULL,
  `report_readit` smallint(6) NOT NULL DEFAULT 0,
  `report_type` smallint(6) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'A Admin', '2019-11-25 07:25:20', '2019-11-25 07:25:20'),
(2, 'manager', 'A User', '2019-11-25 07:25:20', '2019-11-25 07:25:20'),
(3, 'blocked', 'A blocked User', '2019-11-25 07:25:20', '2019-11-25 07:25:20');

-- --------------------------------------------------------

--
-- Table structure for table `series`
--

CREATE TABLE `series` (
  `t_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `t_moviedbid` int(11) NOT NULL,
  `t_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `t_desc` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `t_genre` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `t_year` int(11) NOT NULL,
  `t_age` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `t_rate` double(8,2) NOT NULL,
  `t_cloud` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `t_poster` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `t_category` int(11) NOT NULL,
  `t_backdrop` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `siteinfos`
--

CREATE TABLE `siteinfos` (
  `id` int(10) UNSIGNED NOT NULL,
  `social_facebook` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `social_twitter` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `social_instagram` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `privacy` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `terms` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `about` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `siteinfos`
--

INSERT INTO `siteinfos` (`id`, `social_facebook`, `social_twitter`, `social_instagram`, `privacy`, `terms`, `about`, `payment_status`, `created_at`, `updated_at`) VALUES
(1, 'https://facaebook.com', 'https://twitter.com', 'https://instagram.com', 'Here is privacy', 'Here is terms', 'Here is about', 0, '2019-11-25 07:25:21', '2020-02-14 03:56:20');

-- --------------------------------------------------------

--
-- Table structure for table `subscriptions`
--

CREATE TABLE `subscriptions` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `braintree_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `braintree_plan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL,
  `trial_ends_at` timestamp NULL DEFAULT NULL,
  `ends_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subscriptions`
--

INSERT INTO `subscriptions` (`id`, `user_id`, `name`, `braintree_id`, `braintree_plan`, `quantity`, `trial_ends_at`, `ends_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'main', '72wxtg', '8wtg', 1, NULL, NULL, '2020-02-14 04:56:33', '2020-02-14 05:00:49');

-- --------------------------------------------------------

--
-- Table structure for table `subtitles`
--

CREATE TABLE `subtitles` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `language` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `movie_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `episode_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `supports`
--

CREATE TABLE `supports` (
  `id` int(10) UNSIGNED NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `details` varchar(2000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `request_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `support_responses`
--

CREATE TABLE `support_responses` (
  `id` int(10) UNSIGNED NOT NULL,
  `request_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `from` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reply` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `readit` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tmdbs`
--

CREATE TABLE `tmdbs` (
  `id` int(10) UNSIGNED NOT NULL,
  `api` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `language` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tmdbs`
--

INSERT INTO `tmdbs` (`id`, `api`, `language`, `created_at`, `updated_at`) VALUES
(1, 'xxxxxxxxxxxxxxxxxxxxxxxxx', 'xxxxxxxxxx', '2019-11-25 07:25:21', '2019-11-25 07:25:21');

-- --------------------------------------------------------

--
-- Table structure for table `tops`
--

CREATE TABLE `tops` (
  `id` int(10) UNSIGNED NOT NULL,
  `movie_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `series_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tops`
--

INSERT INTO `tops` (`id`, `movie_id`, `series_id`, `created_at`, `updated_at`) VALUES
(467, 'cbc11fc0-11ce-11ea-941a-438f301cf6ef', NULL, '2019-11-28 05:34:36', '2019-11-28 05:34:36');

-- --------------------------------------------------------

--
-- Table structure for table `transcoders`
--

CREATE TABLE `transcoders` (
  `id` int(10) UNSIGNED NOT NULL,
  `segment_duration` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `watermark_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `watermark_position` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transcoders`
--

INSERT INTO `transcoders` (`id`, `segment_duration`, `watermark_url`, `watermark_position`, `created_at`, `updated_at`) VALUES
(1, '10', 'r1ao02iIaZjpNmtiI0aI.png', 'BottomLeft', '2019-11-25 07:25:21', '2020-02-14 03:48:19');

-- --------------------------------------------------------

--
-- Table structure for table `tvs`
--

CREATE TABLE `tvs` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `genre` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `streaming_status` tinyint(1) NOT NULL DEFAULT 0,
  `streaming_pid` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `streaming_name` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `streaming_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `streaming_resolutions` varchar(7) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `streaming_type` varchar(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  `streaming_transcoding` tinyint(1) NOT NULL DEFAULT 0,
  `category` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `confirmed` tinyint(1) NOT NULL DEFAULT 0,
  `confirmation_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `forget_code` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_block` tinyint(1) NOT NULL DEFAULT 0,
  `braintree_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paypal_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_brand` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_last_four` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trial_ends_at` timestamp NULL DEFAULT NULL,
  `period_end` date DEFAULT NULL,
  `language` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `theme` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default',
  `location` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `caption` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `confirmed`, `confirmation_code`, `forget_code`, `is_block`, `braintree_id`, `paypal_email`, `card_brand`, `card_last_four`, `trial_ends_at`, `period_end`, `language`, `theme`, `location`, `caption`, `remember_token`, `created_at`, `updated_at`) VALUES
('1', 'Vijendra', 'vijendra3582@gmail.com', '$2y$10$E.3XFSUQkoIRJTe9NhKZSOMZBfam.AmJ6rCsT.IvB8F28qkdVNWqq', 1, NULL, NULL, 0, '162539959', NULL, 'Visa', '4242', NULL, '2020-03-13', 'en', 'default', 'null', '{\"font-size\":\"30px\",\"background-color\":\"rgba(10,187,99,1)\",\"font-weight\":800,\"color\":\"#C3E2D3\"}', NULL, '2020-02-14 04:36:15', '2020-02-17 00:53:57');

-- --------------------------------------------------------

--
-- Table structure for table `videos`
--

CREATE TABLE `videos` (
  `v_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `movie_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `episode_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `resolution` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `duration` varchar(35) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `video_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `video_cloud` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'local',
  `video_format` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'hls',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `videos`
--

INSERT INTO `videos` (`v_id`, `movie_id`, `episode_id`, `resolution`, `duration`, `video_url`, `video_cloud`, `video_format`, `created_at`, `updated_at`) VALUES
('cc7b8540-11ce-11ea-949b-137c5507192c', 'cbc11fc0-11ce-11ea-941a-438f301cf6ef', NULL, '320', NULL, 'https://www.youtube.com/watch?v=AJtDXIazrMo', 'link', 'link', '2019-11-28 05:34:07', '2019-11-28 05:34:07'),
('cc818a60-11ce-11ea-9e54-fbe1220bffb2', 'cbc11fc0-11ce-11ea-941a-438f301cf6ef', NULL, '480', NULL, 'https://www.youtube.com/watch?v=AJtDXIazrMo', 'link', 'link', '2019-11-28 05:34:08', '2019-11-28 05:34:08'),
('cc841370-11ce-11ea-912e-8b0a5432f7fb', 'cbc11fc0-11ce-11ea-941a-438f301cf6ef', NULL, '720', NULL, 'https://www.youtube.com/watch?v=AJtDXIazrMo', 'link', 'link', '2019-11-28 05:34:08', '2019-11-28 05:34:08'),
('cc86a000-11ce-11ea-8781-9922f7ca0a3e', 'cbc11fc0-11ce-11ea-941a-438f301cf6ef', NULL, '1080', NULL, 'https://www.youtube.com/watch?v=AJtDXIazrMo', 'link', 'link', '2019-11-28 05:34:08', '2019-11-28 05:34:08'),
('cc892a80-11ce-11ea-aaae-d979127b83a4', 'cbc11fc0-11ce-11ea-941a-438f301cf6ef', NULL, '4K', NULL, 'https://www.youtube.com/watch?v=AJtDXIazrMo', 'link', 'link', '2019-11-28 05:34:08', '2019-11-28 05:34:08');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indexes for table `admin_role`
--
ALTER TABLE `admin_role`
  ADD PRIMARY KEY (`id`),
  ADD KEY `admin_role_admin_id_foreign` (`admin_id`);

--
-- Indexes for table `backups`
--
ALTER TABLE `backups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `braintrees`
--
ALTER TABLE `braintrees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `casts`
--
ALTER TABLE `casts`
  ADD PRIMARY KEY (`c_id`);

--
-- Indexes for table `casts_rules`
--
ALTER TABLE `casts_rules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `collections`
--
ALTER TABLE `collections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `collection_lists`
--
ALTER TABLE `collection_lists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `collection_lists_movie_id_foreign` (`movie_id`),
  ADD KEY `collection_lists_series_id_foreign` (`series_id`),
  ADD KEY `collection_lists_collection_id_foreign` (`collection_id`);

--
-- Indexes for table `episodes`
--
ALTER TABLE `episodes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `episodes_series_id_foreign` (`series_id`);

--
-- Indexes for table `genres`
--
ALTER TABLE `genres`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `likes_movie_id_foreign` (`movie_id`),
  ADD KEY `likes_series_id_foreign` (`series_id`),
  ADD KEY `likes_uid_foreign` (`uid`);

--
-- Indexes for table `location_logs`
--
ALTER TABLE `location_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `location_logs_uid_foreign` (`uid`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`m_id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_personal_access_clients_client_id_index` (`client_id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `plugins`
--
ALTER TABLE `plugins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rating_systems`
--
ALTER TABLE `rating_systems`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `recently_watcheds`
--
ALTER TABLE `recently_watcheds`
  ADD PRIMARY KEY (`id`),
  ADD KEY `recently_watcheds_movie_id_foreign` (`movie_id`),
  ADD KEY `recently_watcheds_episode_id_foreign` (`episode_id`),
  ADD KEY `recently_watcheds_uid_foreign` (`uid`);

--
-- Indexes for table `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reports_report_userid_foreign` (`report_userid`),
  ADD KEY `reports_report_movie_foreign` (`report_movie`),
  ADD KEY `reports_report_episode_foreign` (`report_episode`),
  ADD KEY `reports_report_series_foreign` (`report_series`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `series`
--
ALTER TABLE `series`
  ADD PRIMARY KEY (`t_id`);

--
-- Indexes for table `siteinfos`
--
ALTER TABLE `siteinfos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subtitles`
--
ALTER TABLE `subtitles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subtitles_movie_id_foreign` (`movie_id`),
  ADD KEY `subtitles_episode_id_foreign` (`episode_id`);

--
-- Indexes for table `supports`
--
ALTER TABLE `supports`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `supports_request_id_unique` (`request_id`),
  ADD KEY `supports_uid_foreign` (`uid`);

--
-- Indexes for table `support_responses`
--
ALTER TABLE `support_responses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `support_responses_request_id_foreign` (`request_id`);

--
-- Indexes for table `tmdbs`
--
ALTER TABLE `tmdbs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tops`
--
ALTER TABLE `tops`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tops_movie_id_foreign` (`movie_id`),
  ADD KEY `tops_series_id_foreign` (`series_id`);

--
-- Indexes for table `transcoders`
--
ALTER TABLE `transcoders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tvs`
--
ALTER TABLE `tvs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `videos`
--
ALTER TABLE `videos`
  ADD PRIMARY KEY (`v_id`),
  ADD KEY `videos_movie_id_foreign` (`movie_id`),
  ADD KEY `videos_episode_id_foreign` (`episode_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_role`
--
ALTER TABLE `admin_role`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `backups`
--
ALTER TABLE `backups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `braintrees`
--
ALTER TABLE `braintrees`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `casts`
--
ALTER TABLE `casts`
  MODIFY `c_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `casts_rules`
--
ALTER TABLE `casts_rules`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `collections`
--
ALTER TABLE `collections`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `collection_lists`
--
ALTER TABLE `collection_lists`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `genres`
--
ALTER TABLE `genres`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `likes`
--
ALTER TABLE `likes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `location_logs`
--
ALTER TABLE `location_logs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `plugins`
--
ALTER TABLE `plugins`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `rating_systems`
--
ALTER TABLE `rating_systems`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `reports`
--
ALTER TABLE `reports`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `siteinfos`
--
ALTER TABLE `siteinfos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `subscriptions`
--
ALTER TABLE `subscriptions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `supports`
--
ALTER TABLE `supports`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `support_responses`
--
ALTER TABLE `support_responses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tmdbs`
--
ALTER TABLE `tmdbs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tops`
--
ALTER TABLE `tops`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=468;

--
-- AUTO_INCREMENT for table `transcoders`
--
ALTER TABLE `transcoders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin_role`
--
ALTER TABLE `admin_role`
  ADD CONSTRAINT `admin_role_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `collection_lists`
--
ALTER TABLE `collection_lists`
  ADD CONSTRAINT `collection_lists_collection_id_foreign` FOREIGN KEY (`collection_id`) REFERENCES `collections` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `collection_lists_movie_id_foreign` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`m_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `collection_lists_series_id_foreign` FOREIGN KEY (`series_id`) REFERENCES `series` (`t_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `episodes`
--
ALTER TABLE `episodes`
  ADD CONSTRAINT `episodes_series_id_foreign` FOREIGN KEY (`series_id`) REFERENCES `series` (`t_id`) ON DELETE CASCADE;

--
-- Constraints for table `likes`
--
ALTER TABLE `likes`
  ADD CONSTRAINT `likes_movie_id_foreign` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`m_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `likes_series_id_foreign` FOREIGN KEY (`series_id`) REFERENCES `series` (`t_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `likes_uid_foreign` FOREIGN KEY (`uid`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `location_logs`
--
ALTER TABLE `location_logs`
  ADD CONSTRAINT `location_logs_uid_foreign` FOREIGN KEY (`uid`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `recently_watcheds`
--
ALTER TABLE `recently_watcheds`
  ADD CONSTRAINT `recently_watcheds_episode_id_foreign` FOREIGN KEY (`episode_id`) REFERENCES `episodes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `recently_watcheds_movie_id_foreign` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`m_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `recently_watcheds_uid_foreign` FOREIGN KEY (`uid`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `reports`
--
ALTER TABLE `reports`
  ADD CONSTRAINT `reports_report_episode_foreign` FOREIGN KEY (`report_episode`) REFERENCES `episodes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reports_report_movie_foreign` FOREIGN KEY (`report_movie`) REFERENCES `movies` (`m_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reports_report_series_foreign` FOREIGN KEY (`report_series`) REFERENCES `series` (`t_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reports_report_userid_foreign` FOREIGN KEY (`report_userid`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `subtitles`
--
ALTER TABLE `subtitles`
  ADD CONSTRAINT `subtitles_episode_id_foreign` FOREIGN KEY (`episode_id`) REFERENCES `episodes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `subtitles_movie_id_foreign` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`m_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `supports`
--
ALTER TABLE `supports`
  ADD CONSTRAINT `supports_uid_foreign` FOREIGN KEY (`uid`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `support_responses`
--
ALTER TABLE `support_responses`
  ADD CONSTRAINT `support_responses_request_id_foreign` FOREIGN KEY (`request_id`) REFERENCES `supports` (`request_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tops`
--
ALTER TABLE `tops`
  ADD CONSTRAINT `tops_movie_id_foreign` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`m_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tops_series_id_foreign` FOREIGN KEY (`series_id`) REFERENCES `series` (`t_id`) ON DELETE CASCADE;

--
-- Constraints for table `videos`
--
ALTER TABLE `videos`
  ADD CONSTRAINT `videos_episode_id_foreign` FOREIGN KEY (`episode_id`) REFERENCES `episodes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `videos_movie_id_foreign` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`m_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
