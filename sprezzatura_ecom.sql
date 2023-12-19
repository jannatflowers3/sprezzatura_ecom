-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 19, 2023 at 01:36 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sprezzatura_ecom`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `account_type` varchar(191) DEFAULT NULL,
  `account_details` text DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `is_default` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `activations`
--

CREATE TABLE `activations` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(191) NOT NULL,
  `completed` tinyint(1) NOT NULL DEFAULT 0,
  `completed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `activations`
--

INSERT INTO `activations` (`id`, `user_id`, `code`, `completed`, `completed_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'jtrgT5HKaZhXox6VmOIpHnZrCqBHp2QH', 1, '2022-04-06 00:07:38', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(2, 2, 'b8lmkVx7aiJquAXqcfghMtHSJC3j6XJ0', 1, '2022-04-24 14:10:00', '2022-04-24 14:10:00', '2022-04-24 14:10:00'),
(16, 16, 'ReSWtCHAlWau049L5sFZJ2JUNS1F9WQO', 1, '2023-12-12 07:15:51', '2023-12-12 07:15:51', '2023-12-12 07:15:51');

-- --------------------------------------------------------

--
-- Table structure for table `addons`
--

CREATE TABLE `addons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `addon_identifier` varchar(191) NOT NULL,
  `purchase_code` varchar(191) DEFAULT NULL,
  `version` varchar(191) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `image` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `addons`
--

INSERT INTO `addons` (`id`, `name`, `addon_identifier`, `purchase_code`, `version`, `status`, `image`, `created_at`, `updated_at`) VALUES
(1, 'Chat System', 'chat_system', '2e1c205f-b293-46cb-991c-9673627e1b79', '100', 1, 'images/addons/chat_system.png', '2023-09-15 01:05:24', '2023-09-15 01:05:24');

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE `addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `phone_no` varchar(191) DEFAULT NULL,
  `address` text NOT NULL,
  `address_ids` varchar(191) DEFAULT NULL,
  `country` varchar(191) DEFAULT NULL,
  `state` varchar(191) DEFAULT NULL,
  `city` varchar(191) DEFAULT NULL,
  `latitude` decimal(10,8) DEFAULT NULL,
  `longitude` decimal(11,8) DEFAULT NULL,
  `postal_code` varchar(191) DEFAULT NULL,
  `default_shipping` tinyint(4) NOT NULL DEFAULT 0 COMMENT '1 = default',
  `default_billing` tinyint(4) NOT NULL DEFAULT 0 COMMENT '1 = default',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `addresses`
--

INSERT INTO `addresses` (`id`, `user_id`, `name`, `email`, `phone_no`, `address`, `address_ids`, `country`, `state`, `city`, `latitude`, `longitude`, `postal_code`, `default_shipping`, `default_billing`, `created_at`, `updated_at`) VALUES
(1, 1, 'Jannatul Ferdaush', 'jannatflowersweb@gmail.com', '+8801300869499', 'Muradnagor', '{\"country_id\":\"232\",\"state_id\":\"13\",\"city_id\":\"5\"}', 'United Kingdom', 'Massachusetts', 'Cambridge', NULL, NULL, '3500', 1, 1, '2023-12-11 08:50:30', '2023-12-19 12:12:51');

-- --------------------------------------------------------

--
-- Table structure for table `affiliates`
--

CREATE TABLE `affiliates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `affiliate_options`
--

CREATE TABLE `affiliate_options` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(191) DEFAULT NULL,
  `status` varchar(191) NOT NULL,
  `details` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `affiliate_states`
--

CREATE TABLE `affiliate_states` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `affiliate_user_id` int(11) NOT NULL,
  `no_of_click` int(11) NOT NULL,
  `no_of_order_item` int(11) NOT NULL,
  `no_of_delivered` int(11) NOT NULL,
  `no_of_cancel` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `api_keys`
--

CREATE TABLE `api_keys` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(191) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `api_key_languages`
--

CREATE TABLE `api_key_languages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `api_key_id` bigint(20) UNSIGNED NOT NULL,
  `lang` varchar(191) NOT NULL DEFAULT 'en',
  `title` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `app_intros`
--

CREATE TABLE `app_intros` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `image_id` bigint(20) UNSIGNED DEFAULT NULL,
  `image` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `app_intro_languages`
--

CREATE TABLE `app_intro_languages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `order` varchar(191) NOT NULL,
  `lang` varchar(10) NOT NULL DEFAULT 'en' COMMENT 'our default locale for system en',
  `app_intro_id` bigint(20) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attributes`
--

CREATE TABLE `attributes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attributes`
--

INSERT INTO `attributes` (`id`, `created_at`, `updated_at`) VALUES
(1, '2023-11-16 09:16:01', '2023-11-16 09:16:01'),
(5, '2023-11-27 08:47:35', '2023-11-27 08:47:35');

-- --------------------------------------------------------

--
-- Table structure for table `attribute_category`
--

CREATE TABLE `attribute_category` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `attribute_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attribute_category`
--

INSERT INTO `attribute_category` (`id`, `category_id`, `attribute_id`, `created_at`, `updated_at`) VALUES
(1, 2, 1, '2023-11-16 09:16:01', '2023-11-16 09:16:01'),
(2, 1, 1, '2023-11-16 09:16:45', '2023-11-16 09:16:45'),
(3, 9, 1, '2023-11-16 09:16:45', '2023-11-16 09:16:45'),
(4, 10, 1, '2023-11-16 09:16:45', '2023-11-16 09:16:45'),
(5, 11, 1, '2023-11-16 09:16:45', '2023-11-16 09:16:45'),
(6, 1, 2, '2023-11-16 09:17:12', '2023-11-16 09:17:12'),
(7, 2, 2, '2023-11-16 09:17:12', '2023-11-16 09:17:12'),
(8, 9, 2, '2023-11-16 09:17:12', '2023-11-16 09:17:12'),
(9, 10, 2, '2023-11-16 09:17:12', '2023-11-16 09:17:12'),
(10, 11, 2, '2023-11-16 09:17:12', '2023-11-16 09:17:12'),
(11, 13, 7, '2023-11-27 09:48:13', '2023-11-27 09:48:13'),
(12, 13, 8, '2023-11-27 09:58:57', '2023-11-27 09:58:57'),
(13, 13, 9, '2023-11-27 09:59:46', '2023-11-27 09:59:46'),
(14, 13, 10, '2023-11-27 10:43:45', '2023-11-27 10:43:45');

-- --------------------------------------------------------

--
-- Table structure for table `attribute_languages`
--

CREATE TABLE `attribute_languages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `attribute_id` bigint(20) UNSIGNED NOT NULL,
  `lang` varchar(10) NOT NULL DEFAULT 'en',
  `title` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attribute_languages`
--

INSERT INTO `attribute_languages` (`id`, `attribute_id`, `lang`, `title`, `created_at`, `updated_at`) VALUES
(1, 1, 'en', 'Size', '2023-11-16 09:16:01', '2023-11-16 09:16:01'),
(2, 2, 'en', 'Color', '2023-11-16 09:16:15', '2023-11-16 09:16:15'),
(3, 3, 'en', 'LRF-0703MNBSP', '2023-11-27 06:00:41', '2023-11-27 06:00:41'),
(4, 4, 'en', 'XXXL', '2023-11-27 06:02:45', '2023-11-27 06:02:45'),
(5, 5, 'en', 'Men\'s LS Shirt', '2023-11-27 08:47:35', '2023-11-27 08:47:35'),
(6, 6, 'en', 'L.RF-0703TSP', '2023-11-27 09:17:30', '2023-11-27 09:17:30'),
(7, 7, 'en', 'LCF-0705MARSP', '2023-11-27 09:48:13', '2023-11-27 09:48:13'),
(8, 8, 'en', 'L.CF-0710SP', '2023-11-27 09:58:57', '2023-11-27 09:58:57'),
(9, 9, 'en', 'XXXL', '2023-11-27 09:59:46', '2023-11-27 09:59:46'),
(10, 10, 'en', 'L.CF-0710SP', '2023-11-27 10:43:45', '2023-11-27 10:43:45'),
(11, 11, 'en', 'L.CF-0703NBSP', '2023-11-27 11:08:14', '2023-11-27 11:08:14'),
(12, 12, 'en', 'L.RF-0714SP', '2023-11-27 11:18:41', '2023-11-27 11:18:41');

-- --------------------------------------------------------

--
-- Table structure for table `attribute_values`
--

CREATE TABLE `attribute_values` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `attribute_id` bigint(20) UNSIGNED NOT NULL,
  `value` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attribute_values`
--

INSERT INTO `attribute_values` (`id`, `attribute_id`, `value`, `created_at`, `updated_at`) VALUES
(1, 1, 'XXL', '2023-11-16 09:17:30', '2023-11-16 09:17:30'),
(2, 1, 'XL', '2023-11-16 09:17:37', '2023-11-16 09:17:37'),
(3, 1, 'L', '2023-11-16 09:17:50', '2023-11-16 09:17:50'),
(4, 1, 'M', '2023-11-16 09:18:00', '2023-11-16 09:18:00'),
(5, 1, 'S', '2023-11-16 09:18:08', '2023-11-16 09:18:08'),
(6, 3, 'XXL', '2023-11-27 06:01:30', '2023-11-27 06:01:30'),
(7, 3, 'XL', '2023-11-27 06:01:37', '2023-11-27 06:01:37'),
(8, 3, 'L', '2023-11-27 06:01:43', '2023-11-27 06:01:43'),
(9, 3, 'S', '2023-11-27 06:01:47', '2023-11-27 06:01:47'),
(10, 3, 'M', '2023-11-27 06:01:51', '2023-11-27 06:01:51'),
(11, 1, 'XXXL', '2023-11-27 06:04:02', '2023-11-27 06:04:02'),
(12, 5, 'M', '2023-11-27 08:47:56', '2023-11-27 08:47:56'),
(13, 5, 'XL', '2023-11-27 08:53:51', '2023-11-27 08:53:51'),
(14, 6, 'S', '2023-11-27 09:17:54', '2023-11-27 09:17:54'),
(18, 6, 'XXL', '2023-11-27 09:33:21', '2023-11-27 09:33:21'),
(19, 6, 'L', '2023-11-27 09:42:15', '2023-11-27 09:42:15'),
(20, 6, 'XL', '2023-11-27 09:42:21', '2023-11-27 09:42:21'),
(21, 7, 'XL', '2023-11-27 09:49:20', '2023-11-27 09:49:20'),
(22, 7, 'XXL', '2023-11-27 09:49:27', '2023-11-27 09:49:27'),
(23, 7, 'L', '2023-11-27 09:49:33', '2023-11-27 09:49:33'),
(24, 7, 'M', '2023-11-27 09:49:46', '2023-11-27 09:49:46'),
(25, 8, 'S', '2023-11-27 09:59:24', '2023-11-27 09:59:24'),
(26, 1, 'XXXL', '2023-11-27 10:00:48', '2023-11-27 10:00:48'),
(27, 8, 'XXXL', '2023-11-27 10:01:36', '2023-11-27 10:01:36'),
(28, 8, 'S', '2023-11-27 10:44:02', '2023-11-27 10:44:02'),
(29, 11, 'XXXL', '2023-11-27 11:08:51', '2023-11-27 11:08:51'),
(30, 11, 'S', '2023-11-27 11:08:56', '2023-11-27 11:08:56'),
(31, 12, 'XXXL', '2023-11-27 11:45:37', '2023-11-27 11:45:37'),
(32, 12, 'S', '2023-11-27 11:45:45', '2023-11-27 11:45:45');

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  `link` varchar(191) NOT NULL DEFAULT '/',
  `status` varchar(191) NOT NULL DEFAULT '1',
  `image_id` bigint(20) UNSIGNED DEFAULT NULL,
  `image` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `banners`
--

INSERT INTO `banners` (`id`, `order`, `link`, `status`, `image_id`, `image`, `created_at`, `updated_at`) VALUES
(1, 1, '/', '1', NULL, '[]', '2022-06-22 13:55:37', '2022-06-22 13:55:37'),
(2, 2, '/', '1', NULL, '[]', '2022-06-22 13:55:46', '2022-06-22 13:55:46'),
(3, 3, '/', '1', NULL, '[]', '2022-06-22 13:55:54', '2022-06-22 13:55:54'),
(4, 4, '/', '1', NULL, '[]', '2022-06-22 13:56:04', '2022-06-22 13:56:04');

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `image_id` bigint(20) UNSIGNED DEFAULT NULL,
  `image` text DEFAULT NULL,
  `banner_id` bigint(20) UNSIGNED DEFAULT NULL,
  `banner` text DEFAULT NULL,
  `status` varchar(191) NOT NULL DEFAULT 'published',
  `slug` varchar(100) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blog_categories`
--

CREATE TABLE `blog_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(100) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blog_category_languages`
--

CREATE TABLE `blog_category_languages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `blog_category_id` bigint(20) UNSIGNED NOT NULL,
  `lang` varchar(10) NOT NULL DEFAULT 'en' COMMENT 'our default locale for system en',
  `title` varchar(191) DEFAULT NULL,
  `meta_title` varchar(191) DEFAULT NULL,
  `meta_description` text DEFAULT NULL COMMENT 'meta description for seo',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blog_comments`
--

CREATE TABLE `blog_comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL COMMENT 'used like when user is logged in',
  `blog_id` bigint(20) UNSIGNED NOT NULL,
  `comment` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blog_comment_likes`
--

CREATE TABLE `blog_comment_likes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `commentable_type` varchar(191) NOT NULL,
  `commentable_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blog_comment_replies`
--

CREATE TABLE `blog_comment_replies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL COMMENT 'used like when user is logged in',
  `blog_comment_id` bigint(20) UNSIGNED NOT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `level` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blog_languages`
--

CREATE TABLE `blog_languages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `blog_id` bigint(20) UNSIGNED NOT NULL,
  `lang` varchar(10) NOT NULL DEFAULT 'en' COMMENT 'our default locale for system en',
  `title` varchar(191) NOT NULL,
  `short_description` text DEFAULT NULL,
  `long_description` longtext DEFAULT NULL,
  `tags` text DEFAULT NULL,
  `meta_title` varchar(250) DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `meta_keyword` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blog_views`
--

CREATE TABLE `blog_views` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `blog_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(100) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `logo_id` bigint(20) UNSIGNED DEFAULT NULL,
  `logo` text DEFAULT NULL,
  `banner_id` bigint(20) UNSIGNED DEFAULT NULL,
  `banner` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `brand_languages`
--

CREATE TABLE `brand_languages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `brand_id` bigint(20) NOT NULL,
  `lang` varchar(10) NOT NULL COMMENT 'our default locale for system en',
  `title` varchar(191) DEFAULT NULL,
  `meta_title` varchar(191) DEFAULT NULL,
  `meta_description` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `campaigns`
--

CREATE TABLE `campaigns` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(191) NOT NULL,
  `background_color` varchar(50) DEFAULT NULL,
  `text_color` varchar(50) DEFAULT NULL,
  `banner_id` bigint(20) UNSIGNED DEFAULT NULL,
  `banner` text DEFAULT NULL,
  `thumbnail` text DEFAULT NULL,
  `thumbnail_id` bigint(20) UNSIGNED DEFAULT NULL,
  `start_date` timestamp NULL DEFAULT NULL,
  `end_date` timestamp NULL DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `featured` tinyint(4) NOT NULL DEFAULT 0,
  `flash_sale` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `campaigns`
--

INSERT INTO `campaigns` (`id`, `slug`, `background_color`, `text_color`, `banner_id`, `banner`, `thumbnail`, `thumbnail_id`, `start_date`, `end_date`, `status`, `featured`, `flash_sale`, `created_at`, `updated_at`) VALUES
(1, 'new-year-sale', '#18058a', '#ef8107', 31, '{\"storage\":\"local\",\"original_image\":\"images\\/20231130112427_original__media_131.jpg\",\"image_40x40\":\"images\\/20231130112427image_40x40_media_193.jpg\",\"image_72x72\":\"images\\/20231130112427image_72x72_media_113.jpg\",\"image_190x230\":\"images\\/20231130112427image_190x230_media_84.jpg\",\"image_1920x412\":\"images\\/20231130113226image_1920x412-89.png\"}', '{\"storage\":\"local\",\"original_image\":\"images\\/20231130112337_original__media_3.jpg\",\"image_40x40\":\"images\\/20231130112337image_40x40_media_429.jpg\",\"image_72x72\":\"images\\/20231130112337image_72x72_media_322.jpg\",\"image_190x230\":\"images\\/20231130112337image_190x230_media_194.jpg\",\"image_374x374\":\"images\\/20231130113226image_374x374-113.png\"}', 30, '2024-01-01 05:01:00', '2024-02-29 17:02:00', 1, 0, 1, '2023-11-30 05:26:14', '2023-11-30 05:34:22');

-- --------------------------------------------------------

--
-- Table structure for table `campaign_languages`
--

CREATE TABLE `campaign_languages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `campaign_id` bigint(20) UNSIGNED NOT NULL,
  `lang` varchar(10) NOT NULL,
  `title` varchar(191) NOT NULL,
  `description` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `campaign_languages`
--

INSERT INTO `campaign_languages` (`id`, `campaign_id`, `lang`, `title`, `description`, `created_at`, `updated_at`) VALUES
(1, 1, 'en', 'The Best New Year Sales of 2024', 'The Best New Year Sales of 2024 That You Can Shop Right Now', '2023-11-30 05:26:14', '2023-11-30 05:26:14');

-- --------------------------------------------------------

--
-- Table structure for table `campaign_products`
--

CREATE TABLE `campaign_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `campaign_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `status` varchar(191) NOT NULL DEFAULT 'pending',
  `discount` double DEFAULT NULL,
  `discount_type` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `campaign_products`
--

INSERT INTO `campaign_products` (`id`, `user_id`, `campaign_id`, `product_id`, `status`, `discount`, `discount_type`, `created_at`, `updated_at`) VALUES
(4, 1, 1, 3, 'accepted', 4.5454545454545, 'flat', '2023-11-30 05:32:29', '2023-11-30 05:32:29'),
(5, 1, 1, 17, 'accepted', 4.5454545454545, 'flat', '2023-11-30 05:32:29', '2023-11-30 05:32:29'),
(6, 1, 1, 14, 'accepted', 4.5454545454545, 'flat', '2023-11-30 05:32:29', '2023-11-30 05:32:29'),
(7, 1, 1, 12, 'accepted', 4.5454545454545, 'flat', '2023-11-30 05:32:29', '2023-11-30 05:32:29');

-- --------------------------------------------------------

--
-- Table structure for table `campaign_requests`
--

CREATE TABLE `campaign_requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `campaign_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `discount` double(10,3) NOT NULL DEFAULT 0.000,
  `discount_type` varchar(191) DEFAULT NULL,
  `status` varchar(191) NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `seller_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `guest_id` varchar(30) DEFAULT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `variant` varchar(191) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `discount` double DEFAULT NULL,
  `tax` double DEFAULT NULL,
  `shipping_cost` double DEFAULT NULL,
  `shipping_type` varchar(190) DEFAULT NULL,
  `coupon_applied` tinyint(1) DEFAULT 0,
  `coupon_discount` double DEFAULT NULL,
  `trx_id` varchar(191) DEFAULT NULL,
  `product_referral_code` varchar(191) DEFAULT NULL,
  `is_buy_now` bigint(20) UNSIGNED DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `seller_id`, `user_id`, `guest_id`, `product_id`, `variant`, `quantity`, `price`, `discount`, `tax`, `shipping_cost`, `shipping_type`, `coupon_applied`, `coupon_discount`, `trx_id`, `product_referral_code`, `is_buy_now`, `created_at`, `updated_at`) VALUES
(11, 1, 1, NULL, 9, 'Blue LT-XXL', 1, 50, 0, 0, 0, 'flat_rate', 0, NULL, 'hqF9BFdtU1FRa1F7S8Bqe', NULL, 0, '2023-12-18 14:41:59', '2023-12-18 14:41:59');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `ordering` int(11) NOT NULL DEFAULT 0,
  `slug` varchar(100) NOT NULL,
  `commission` double(10,3) DEFAULT 0.000,
  `is_featured` tinyint(4) NOT NULL DEFAULT 0,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `icon` text DEFAULT NULL,
  `logo_id` bigint(20) UNSIGNED DEFAULT NULL,
  `logo` text DEFAULT NULL,
  `banner_id` bigint(20) UNSIGNED DEFAULT NULL,
  `banner` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `position`, `ordering`, `slug`, `commission`, `is_featured`, `status`, `icon`, `logo_id`, `logo`, `banner_id`, `banner`, `created_at`, `updated_at`) VALUES
(1, 11, 1, 0, 'casual--shirt', 0.000, 0, 1, '', 26, '{\"storage\":\"local\",\"original_image\":\"images\\/20231129163900_original__media_20.jpg\",\"image_40x40\":\"images\\/20231129163900image_40x40_media_263.jpg\",\"image_72x72\":\"images\\/20231129163900image_72x72_media_59.jpg\",\"image_190x230\":\"images\\/20231129163900image_190x230_media_120.jpg\",\"image_140x190\":\"images\\/20231212140017image_140x190-491.png\",\"image_130x95\":\"images\\/20231212140018image_130x95-322.png\",\"image_80x60\":\"images\\/20231212140018image_80x60-214.png\"}', 1, '{\"storage\":\"local\",\"original_image\":\"images\\/20231115214544_original__media_35.jpg\",\"image_40x40\":\"images\\/20231115214544image_40x40_media_157.jpg\",\"image_72x72\":\"images\\/20231115214544image_72x72_media_428.jpg\",\"image_190x230\":\"images\\/20231115214544image_190x230_media_471.jpg\",\"image_970x400\":\"images\\/20231115214553image_970x400-374.png\",\"image_940x110\":\"images\\/20231120191339image_940x110-214.png\",\"image_320x852\":\"images\\/20231120191339image_320x852-358.png\",\"image_320x520\":\"images\\/20231120191340image_320x520-142.png\",\"image_835x200\":\"images\\/20231212140019image_835x200-476.png\",\"image_405x745\":\"images\\/20231212120206image_405x745-117.png\"}', '2022-01-31 21:15:12', '2023-12-12 08:00:19'),
(9, NULL, NULL, 0, 'trousers', 0.000, 0, 1, '', 6, '{\"storage\":\"local\",\"original_image\":\"images\\/20231116161134_original__media_302.jpeg\",\"image_40x40\":\"images\\/20231116161134image_40x40_media_360.jpeg\",\"image_72x72\":\"images\\/20231116161134image_72x72_media_435.jpeg\",\"image_190x230\":\"images\\/20231116161134image_190x230_media_429.jpeg\",\"image_835x200\":\"images\\/20231118144735image_835x200-208.png\",\"image_140x190\":\"images\\/20231129164031image_140x190-4.png\",\"image_130x95\":\"images\\/20231129164031image_130x95-468.png\",\"image_80x60\":\"images\\/20231129164031image_80x60-441.png\"}', 6, '{\"storage\":\"local\",\"original_image\":\"images\\/20231116161134_original__media_302.jpeg\",\"image_40x40\":\"images\\/20231116161134image_40x40_media_360.jpeg\",\"image_72x72\":\"images\\/20231116161134image_72x72_media_435.jpeg\",\"image_190x230\":\"images\\/20231116161134image_190x230_media_429.jpeg\",\"image_835x200\":\"images\\/20231129164031image_835x200-17.png\",\"image_140x190\":\"images\\/20231129164031image_140x190-4.png\",\"image_130x95\":\"images\\/20231129164031image_130x95-468.png\",\"image_80x60\":\"images\\/20231129164031image_80x60-441.png\"}', '2022-01-31 21:15:13', '2023-11-29 10:40:31'),
(10, NULL, NULL, 0, 'panjabi', 0.000, 0, 1, '', 10, '{\"storage\":\"local\",\"original_image\":\"images\\/20231118140337_original__media_426.webp\",\"image_40x40\":\"images\\/20231118140337image_40x40_media_329.webp\",\"image_72x72\":\"images\\/20231118140337image_72x72_media_468.webp\",\"image_190x230\":\"images\\/20231118140337image_190x230_media_259.webp\",\"image_140x190\":\"images\\/20231129164205image_140x190-122.png\",\"image_130x95\":\"images\\/20231129164205image_130x95-299.png\",\"image_80x60\":\"images\\/20231129164205image_80x60-142.png\",\"image_835x200\":\"images\\/20231118140618image_835x200-185.png\"}', 10, '{\"storage\":\"local\",\"original_image\":\"images\\/20231118140337_original__media_426.webp\",\"image_40x40\":\"images\\/20231118140337image_40x40_media_329.webp\",\"image_72x72\":\"images\\/20231118140337image_72x72_media_468.webp\",\"image_190x230\":\"images\\/20231118140337image_190x230_media_259.webp\",\"image_140x190\":\"images\\/20231129164205image_140x190-122.png\",\"image_130x95\":\"images\\/20231129164205image_130x95-299.png\",\"image_80x60\":\"images\\/20231129164205image_80x60-142.png\",\"image_835x200\":\"images\\/20231129164205image_835x200-393.png\"}', '2022-01-31 21:15:13', '2023-11-29 10:42:05'),
(11, NULL, NULL, 0, 'shirt', 0.000, 0, 1, '', 12, '{\"storage\":\"local\",\"original_image\":\"images\\/20231118144010_original__media_183.jpeg\",\"image_40x40\":\"images\\/20231118144010image_40x40_media_238.jpeg\",\"image_72x72\":\"images\\/20231118144010image_72x72_media_209.jpeg\",\"image_190x230\":\"images\\/20231118144010image_190x230_media_286.jpeg\",\"image_140x190\":\"images\\/20231129164222image_140x190-496.png\",\"image_130x95\":\"images\\/20231129164223image_130x95-385.png\",\"image_80x60\":\"images\\/20231129164223image_80x60-61.png\"}', 2, '{\"storage\":\"local\",\"original_image\":\"images\\/20231116123823_original__media_193.jpg\",\"image_40x40\":\"images\\/20231116123823image_40x40_media_414.jpg\",\"image_72x72\":\"images\\/20231116123823image_72x72_media_423.jpg\",\"image_190x230\":\"images\\/20231116123823image_190x230_media_31.jpg\",\"image_1260x452\":\"images\\/20231129163623image_1260x452-55.png\",\"image_620x320\":\"images\\/20231129163623image_620x320-358.png\",\"image_400x235\":\"images\\/20231129163623image_400x235-465.png\",\"image_300x170\":\"images\\/20231129163623image_300x170-436.png\",\"image_835x200\":\"images\\/20231129164223image_835x200-442.png\"}', '2022-03-25 22:58:27', '2023-11-29 10:42:23'),
(12, 11, 1, 0, 'dress-shirt', 0.000, 0, 1, 'mdi mdi-account-box-multiple-outline', 11, '{\"storage\":\"local\",\"original_image\":\"images\\/20231118143203_original__media_384.webp\",\"image_40x40\":\"images\\/20231118143203image_40x40_media_335.webp\",\"image_72x72\":\"images\\/20231118143203image_72x72_media_40.webp\",\"image_190x230\":\"images\\/20231118143203image_190x230_media_216.webp\",\"image_140x190\":\"images\\/20231212140032image_140x190-213.png\",\"image_130x95\":\"images\\/20231212140032image_130x95-496.png\",\"image_80x60\":\"images\\/20231212140032image_80x60-353.png\"}', NULL, '[]', '2023-11-18 08:32:40', '2023-12-12 08:00:32'),
(13, NULL, NULL, 0, 'men\'s-ls-shirt', 0.000, 0, 1, '', 24, '{\"storage\":\"local\",\"original_image\":\"images\\/20231129155216_original__media_128.jpg\",\"image_40x40\":\"images\\/20231129155216image_40x40_media_38.jpg\",\"image_72x72\":\"images\\/20231129155216image_72x72_media_340.jpg\",\"image_190x230\":\"images\\/20231129155443image_190x230-388.png\",\"image_1200x630\":\"images\\/20231129155444image_1200x630-283.png\",\"image_140x190\":\"images\\/20231129164116image_140x190-260.png\",\"image_130x95\":\"images\\/20231129164116image_130x95-490.png\",\"image_80x60\":\"images\\/20231129164116image_80x60-394.png\"}', 1, '{\"storage\":\"local\",\"original_image\":\"images\\/20231115214544_original__media_35.jpg\",\"image_40x40\":\"images\\/20231115214544image_40x40_media_157.jpg\",\"image_72x72\":\"images\\/20231115214544image_72x72_media_428.jpg\",\"image_190x230\":\"images\\/20231115214544image_190x230_media_471.jpg\",\"image_970x400\":\"images\\/20231115214553image_970x400-374.png\",\"image_940x110\":\"images\\/20231120191339image_940x110-214.png\",\"image_320x852\":\"images\\/20231120191339image_320x852-358.png\",\"image_320x520\":\"images\\/20231120191340image_320x520-142.png\",\"image_835x200\":\"images\\/20231129164116image_835x200-244.png\"}', '2023-11-27 06:19:36', '2023-11-29 10:41:17'),
(14, NULL, NULL, 0, 'mens-ls-shirt-fex8c', 0.000, 0, 1, '', 20, '{\"storage\":\"local\",\"original_image\":\"images\\/20231129142715_original__media_336.jpeg\",\"image_40x40\":\"images\\/20231129142715image_40x40_media_214.jpeg\",\"image_72x72\":\"images\\/20231129142715image_72x72_media_179.jpeg\",\"image_190x230\":\"images\\/20231129142715image_190x230_media_458.jpeg\",\"image_140x190\":\"images\\/20231129142751image_140x190-296.png\",\"image_130x95\":\"images\\/20231129142752image_130x95-304.png\",\"image_80x60\":\"images\\/20231129142752image_80x60-52.png\"}', NULL, '[]', '2023-11-29 08:27:53', '2023-11-29 08:27:53'),
(15, 11, 1, 0, 'polo-shirt-k6iep', 0.000, 0, 1, '', 15, '{\"storage\":\"local\",\"original_image\":\"images\\/20231127153039_original__media_416.jpeg\",\"image_40x40\":\"images\\/20231127153039image_40x40_media_80.jpeg\",\"image_72x72\":\"images\\/20231127153039image_72x72_media_489.jpeg\",\"image_190x230\":\"images\\/20231127154953image_190x230-441.png\",\"image_1200x630\":\"images\\/20231127154954image_1200x630-402.png\",\"image_140x190\":\"images\\/20231212140138image_140x190-475.png\",\"image_130x95\":\"images\\/20231212140138image_130x95-180.png\",\"image_80x60\":\"images\\/20231212140138image_80x60-260.png\"}', NULL, '[]', '2023-12-12 08:01:39', '2023-12-12 08:01:39'),
(16, 10, 1, 0, 'printed-panjabi', 0.000, 0, 1, '', NULL, '[]', NULL, '[]', '2023-12-18 09:48:22', '2023-12-18 09:48:22'),
(17, 10, 1, 0, 'cotton-panjabi-ue4di', 0.000, 0, 1, '', NULL, '[]', NULL, '[]', '2023-12-18 10:20:56', '2023-12-18 10:20:56'),
(18, 10, 1, 0, 'silk-panjabi-qb5go', 0.000, 0, 1, '', NULL, '[]', NULL, '[]', '2023-12-18 10:22:50', '2023-12-18 10:22:50');

-- --------------------------------------------------------

--
-- Table structure for table `category_languages`
--

CREATE TABLE `category_languages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) NOT NULL,
  `lang` varchar(10) NOT NULL DEFAULT 'en' COMMENT 'our default locale for system en',
  `title` varchar(191) DEFAULT NULL,
  `meta_title` varchar(191) DEFAULT NULL,
  `meta_description` text DEFAULT NULL COMMENT 'meta description for seo',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category_languages`
--

INSERT INTO `category_languages` (`id`, `category_id`, `lang`, `title`, `meta_title`, `meta_description`, `created_at`, `updated_at`) VALUES
(1, 1, 'en', 'Casual Shirt', '', '', '2022-03-25 22:38:59', '2023-11-18 08:25:35'),
(9, 9, 'en', 'Trousers', '', '', '2022-03-25 22:38:59', '2023-11-16 10:12:02'),
(10, 10, 'en', 'Panjabi', 'Panjabi', '', '2022-03-25 22:38:59', '2023-11-29 10:42:05'),
(11, 11, 'en', 'Shirt', 'Shirt', 'For gentlemen who love the word ‘elegant’, a dress shirt is a must. It never fails to impress anyone—be it your boss or a date.', '2022-03-25 22:58:27', '2023-11-29 10:42:23'),
(12, 12, 'en', 'Dress shirt', 'Dress shirt', 'These are button-up shirts, typically worn under suits and jackets to formal and semi-formal occasions – a wardrobe staple of almost all fashion conscious men.', '2023-11-18 08:32:40', '2023-11-18 08:32:40'),
(13, 13, 'en', 'Men’s Formal Shirts', '', '', '2023-11-27 06:19:36', '2023-11-27 06:19:36'),
(14, 14, 'en', 'Men\'s LS Shirt', '', '', '2023-11-29 08:27:53', '2023-11-29 08:27:53'),
(15, 15, 'en', 'Polo Shirt', '', '', '2023-12-12 08:01:39', '2023-12-12 08:01:39'),
(16, 16, 'en', 'Printed Panjabi', '', '', '2023-12-18 09:48:22', '2023-12-18 09:48:22'),
(17, 17, 'en', 'Cotton Panjabi', '', '', '2023-12-18 10:20:56', '2023-12-18 10:20:56'),
(18, 18, 'en', 'Silk Panjabi', '', '', '2023-12-18 10:22:50', '2023-12-18 10:22:50');

-- --------------------------------------------------------

--
-- Table structure for table `checkouts`
--

CREATE TABLE `checkouts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `seller_id` bigint(20) UNSIGNED NOT NULL,
  `coupon_id` bigint(20) UNSIGNED DEFAULT NULL,
  `trx_id` varchar(191) DEFAULT NULL,
  `coupon_discount` double DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `state_id` bigint(20) UNSIGNED NOT NULL,
  `country_id` bigint(20) UNSIGNED NOT NULL,
  `cost` double DEFAULT 0,
  `latitude` decimal(10,8) DEFAULT NULL,
  `longitude` decimal(11,8) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `name`, `state_id`, `country_id`, `cost`, `latitude`, `longitude`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Dhaka', 7, 19, 0.45454545454545, NULL, NULL, 1, '2023-12-11 08:27:48', '2023-12-11 08:44:59'),
(2, 'Dhaka', 10, 19, 0.45454545454545, NULL, NULL, 1, '2023-12-11 08:44:51', '2023-12-11 08:44:51'),
(3, 'Cumilla', 11, 19, 0.90909090909091, NULL, NULL, 1, '2023-12-11 08:48:16', '2023-12-11 08:48:16'),
(4, 'Baltimore', 12, 233, 45.454545454545, NULL, NULL, 1, '2023-12-18 14:47:11', '2023-12-18 14:47:11'),
(5, 'Cambridge', 13, 232, 36.363636363636, NULL, NULL, 1, '2023-12-19 12:12:29', '2023-12-19 12:12:29');

-- --------------------------------------------------------

--
-- Table structure for table `colors`
--

CREATE TABLE `colors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(50) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `colors`
--

INSERT INTO `colors` (`id`, `code`, `created_at`, `updated_at`) VALUES
(1, '#000000', '2023-11-16 09:23:44', '2023-11-16 09:23:44'),
(2, '#ffff00', '2023-11-16 09:23:51', '2023-11-16 09:23:51'),
(3, '#ffa500', '2023-11-16 09:24:01', '2023-11-16 09:24:01'),
(4, '#0000ff', '2023-11-16 09:24:10', '2023-11-16 09:24:10'),
(5, '#008000', '2023-11-16 09:24:21', '2023-11-16 09:24:21'),
(6, '#ff0000', '2023-11-16 09:24:31', '2023-11-16 09:24:31'),
(7, '#ffffff', '2023-11-16 09:24:42', '2023-11-16 09:24:42'),
(9, '#0000ff', '2023-11-27 06:06:10', '2023-11-27 06:06:10'),
(10, '#b2beb5', '2023-11-27 08:44:23', '2023-11-27 08:44:23'),
(11, '#30d5c8', '2023-11-27 09:27:46', '2023-11-27 09:27:46'),
(12, '#800000', '2023-11-27 09:48:44', '2023-11-27 09:48:44'),
(13, '#800080', '2023-11-27 10:49:57', '2023-11-27 10:49:57'),
(14, '#7393b3', '2023-11-27 11:01:13', '2023-11-27 11:01:13'),
(15, '#ffd700', '2023-11-27 11:45:09', '2023-11-27 11:45:09'),
(16, '#add8e6', '2023-11-29 08:25:03', '2023-11-29 08:25:03'),
(17, '#c0ccd8', '2023-11-29 08:34:56', '2023-11-29 08:34:56'),
(18, '#808080', '2023-11-29 08:46:05', '2023-11-29 08:46:05');

-- --------------------------------------------------------

--
-- Table structure for table `color_languages`
--

CREATE TABLE `color_languages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `color_id` bigint(20) UNSIGNED NOT NULL,
  `lang` varchar(10) NOT NULL DEFAULT 'en',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `color_languages`
--

INSERT INTO `color_languages` (`id`, `name`, `color_id`, `lang`, `created_at`, `updated_at`) VALUES
(1, 'Black', 1, 'en', '2023-11-16 09:23:44', '2023-11-16 09:23:44'),
(2, 'Yellow', 2, 'en', '2023-11-16 09:23:51', '2023-11-16 09:23:51'),
(3, 'Orange', 3, 'en', '2023-11-16 09:24:01', '2023-11-16 09:24:01'),
(4, 'Blue', 4, 'en', '2023-11-16 09:24:10', '2023-11-16 09:24:10'),
(5, 'Green', 5, 'en', '2023-11-16 09:24:21', '2023-11-16 09:24:21'),
(6, 'Red', 6, 'en', '2023-11-16 09:24:31', '2023-11-16 09:24:31'),
(7, 'White', 7, 'en', '2023-11-16 09:24:42', '2023-11-16 09:24:42'),
(8, 'Blue MNB', 8, 'en', '2023-11-27 05:59:50', '2023-11-27 05:59:50'),
(9, 'Blue MNB', 9, 'en', '2023-11-27 06:06:10', '2023-11-27 06:06:10'),
(10, 'Grey Ash', 10, 'en', '2023-11-27 08:44:23', '2023-11-27 08:44:23'),
(11, 'Blue Turquoise', 11, 'en', '2023-11-27 09:27:46', '2023-11-27 09:27:46'),
(12, 'Maroon', 12, 'en', '2023-11-27 09:48:44', '2023-11-27 09:48:44'),
(13, 'Purple', 13, 'en', '2023-11-27 10:49:57', '2023-11-27 10:49:57'),
(14, 'Blue MNB', 14, 'en', '2023-11-27 11:01:13', '2023-11-27 11:01:13'),
(15, 'Golden', 15, 'en', '2023-11-27 11:45:09', '2023-11-27 11:45:09'),
(16, 'Blue LT', 16, 'en', '2023-11-29 08:25:03', '2023-11-29 08:25:03'),
(17, 'Grey (Denim)', 17, 'en', '2023-11-29 08:34:56', '2023-11-29 08:34:56'),
(18, 'Grey', 18, 'en', '2023-11-29 08:46:05', '2023-11-29 08:46:05');

-- --------------------------------------------------------

--
-- Table structure for table `commission_histories`
--

CREATE TABLE `commission_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `order_detail_id` bigint(20) UNSIGNED DEFAULT NULL,
  `seller_id` bigint(20) UNSIGNED DEFAULT NULL,
  `admin_commission` double(10,3) DEFAULT 0.000,
  `seller_earning` double(20,3) DEFAULT 0.000,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `compare_products`
--

CREATE TABLE `compare_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `compare_products`
--

INSERT INTO `compare_products` (`id`, `user_id`, `product_id`, `created_at`, `updated_at`) VALUES
(4, 1, 14, '2023-11-30 05:34:48', '2023-11-30 05:34:48'),
(5, 1, 3, '2023-11-30 06:09:30', '2023-11-30 06:09:30');

-- --------------------------------------------------------

--
-- Table structure for table `contact_us`
--

CREATE TABLE `contact_us` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `seller_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `subject` varchar(191) NOT NULL,
  `message` varchar(191) NOT NULL,
  `reply` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contact_us`
--

INSERT INTO `contact_us` (`id`, `seller_id`, `name`, `email`, `subject`, `message`, `reply`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Jannatul Ferdaush', 'jannatflowersweb@gmail.com', 'web test', 'webs test', NULL, '2023-12-02 06:56:25', '2023-12-02 06:56:25');

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `iso3` char(3) DEFAULT NULL,
  `iso2` char(2) DEFAULT NULL,
  `phonecode` varchar(191) DEFAULT NULL,
  `currency` varchar(191) DEFAULT NULL,
  `currency_symbol` varchar(191) DEFAULT NULL,
  `latitude` decimal(10,8) DEFAULT NULL,
  `longitude` decimal(11,8) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `name`, `iso3`, `iso2`, `phonecode`, `currency`, `currency_symbol`, `latitude`, `longitude`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Afghanistan', 'AFG', 'AF', '93', 'AFN', '؋', 33.00000000, 65.00000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(2, 'Aland Islands', 'ALA', 'AX', '+358-18', 'EUR', '€', 60.11666700, 19.90000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(3, 'Albania', 'ALB', 'AL', '355', 'ALL', 'Lek', 41.00000000, 20.00000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(4, 'Algeria', 'DZA', 'DZ', '213', 'DZD', 'دج', 28.00000000, 3.00000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(5, 'American Samoa', 'ASM', 'AS', '+1-684', 'USD', '$', -14.33333333, -170.00000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(6, 'Andorra', 'AND', 'AD', '376', 'EUR', '€', 42.50000000, 1.50000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(7, 'Angola', 'AGO', 'AO', '244', 'AOA', 'Kz', -12.50000000, 18.50000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(8, 'Anguilla', 'AIA', 'AI', '+1-264', 'XCD', '$', 18.25000000, -63.16666666, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(9, 'Antarctica', 'ATA', 'AQ', '672', 'AAD', '$', -74.65000000, 4.48000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(10, 'Antigua And Barbuda', 'ATG', 'AG', '+1-268', 'XCD', '$', 17.05000000, -61.80000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(11, 'Argentina', 'ARG', 'AR', '54', 'ARS', '$', -34.00000000, -64.00000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(12, 'Armenia', 'ARM', 'AM', '374', 'AMD', '֏', 40.00000000, 45.00000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(13, 'Aruba', 'ABW', 'AW', '297', 'AWG', 'ƒ', 12.50000000, -69.96666666, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(14, 'Australia', 'AUS', 'AU', '61', 'AUD', '$', -27.00000000, 133.00000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(15, 'Austria', 'AUT', 'AT', '43', 'EUR', '€', 47.33333333, 13.33333333, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(16, 'Azerbaijan', 'AZE', 'AZ', '994', 'AZN', 'm', 40.50000000, 47.50000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(17, 'Bahamas The', 'BHS', 'BS', '+1-242', 'BSD', 'B$', 24.25000000, -76.00000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(18, 'Bahrain', 'BHR', 'BH', '973', 'BHD', '.د.ب', 26.00000000, 50.55000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(19, 'Bangladesh', 'BGD', 'BD', '880', 'BDT', '৳', 24.00000000, 90.00000000, 1, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(20, 'Barbados', 'BRB', 'BB', '+1-246', 'BBD', 'Bds$', 13.16666666, -59.53333333, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(21, 'Belarus', 'BLR', 'BY', '375', 'BYN', 'Br', 53.00000000, 28.00000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(22, 'Belgium', 'BEL', 'BE', '32', 'EUR', '€', 50.83333333, 4.00000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(23, 'Belize', 'BLZ', 'BZ', '501', 'BZD', '$', 17.25000000, -88.75000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(24, 'Benin', 'BEN', 'BJ', '229', 'XOF', 'CFA', 9.50000000, 2.25000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(25, 'Bermuda', 'BMU', 'BM', '+1-441', 'BMD', '$', 32.33333333, -64.75000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(26, 'Bhutan', 'BTN', 'BT', '975', 'BTN', 'Nu.', 27.50000000, 90.50000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(27, 'Bolivia', 'BOL', 'BO', '591', 'BOB', 'Bs.', -17.00000000, -65.00000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(28, 'Bosnia and Herzegovina', 'BIH', 'BA', '387', 'BAM', 'KM', 44.00000000, 18.00000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(29, 'Botswana', 'BWA', 'BW', '267', 'BWP', 'P', -22.00000000, 24.00000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(30, 'Bouvet Island', 'BVT', 'BV', '0055', 'NOK', 'kr', -54.43333333, 3.40000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(31, 'Brazil', 'BRA', 'BR', '55', 'BRL', 'R$', -10.00000000, -55.00000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(32, 'British Indian Ocean Territory', 'IOT', 'IO', '246', 'USD', '$', -6.00000000, 71.50000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(33, 'Brunei', 'BRN', 'BN', '673', 'BND', 'B$', 4.50000000, 114.66666666, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(34, 'Bulgaria', 'BGR', 'BG', '359', 'BGN', 'Лв.', 43.00000000, 25.00000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(35, 'Burkina Faso', 'BFA', 'BF', '226', 'XOF', 'CFA', 13.00000000, -2.00000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(36, 'Burundi', 'BDI', 'BI', '257', 'BIF', 'FBu', -3.50000000, 30.00000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(37, 'Cambodia', 'KHM', 'KH', '855', 'KHR', 'KHR', 13.00000000, 105.00000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(38, 'Cameroon', 'CMR', 'CM', '237', 'XAF', 'FCFA', 6.00000000, 12.00000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(39, 'Canada', 'CAN', 'CA', '1', 'CAD', '$', 60.00000000, -95.00000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(40, 'Cape Verde', 'CPV', 'CV', '238', 'CVE', '$', 16.00000000, -24.00000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(41, 'Cayman Islands', 'CYM', 'KY', '+1-345', 'KYD', '$', 19.50000000, -80.50000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(42, 'Central African Republic', 'CAF', 'CF', '236', 'XAF', 'FCFA', 7.00000000, 21.00000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(43, 'Chad', 'TCD', 'TD', '235', 'XAF', 'FCFA', 15.00000000, 19.00000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(44, 'Chile', 'CHL', 'CL', '56', 'CLP', '$', -30.00000000, -71.00000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(45, 'China', 'CHN', 'CN', '86', 'CNY', '¥', 35.00000000, 105.00000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(46, 'Christmas Island', 'CXR', 'CX', '61', 'AUD', '$', -10.50000000, 105.66666666, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(47, 'Cocos (Keeling) Islands', 'CCK', 'CC', '61', 'AUD', '$', -12.50000000, 96.83333333, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(48, 'Colombia', 'COL', 'CO', '57', 'COP', '$', 4.00000000, -72.00000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(49, 'Comoros', 'COM', 'KM', '269', 'KMF', 'CF', -12.16666666, 44.25000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(50, 'Congo', 'COG', 'CG', '242', 'XAF', 'FC', -1.00000000, 15.00000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(51, 'Democratic Republic of the Congo', 'COD', 'CD', '243', 'CDF', 'FC', 0.00000000, 25.00000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(52, 'Cook Islands', 'COK', 'CK', '682', 'NZD', '$', -21.23333333, -159.76666666, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(53, 'Costa Rica', 'CRI', 'CR', '506', 'CRC', '₡', 10.00000000, -84.00000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(54, 'Cote D\'Ivoire (Ivory Coast)', 'CIV', 'CI', '225', 'XOF', 'CFA', 8.00000000, -5.00000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(55, 'Croatia', 'HRV', 'HR', '385', 'HRK', 'kn', 45.16666666, 15.50000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(56, 'Cuba', 'CUB', 'CU', '53', 'CUP', '$', 21.50000000, -80.00000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(57, 'Cyprus', 'CYP', 'CY', '357', 'EUR', '€', 35.00000000, 33.00000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(58, 'Czech Republic', 'CZE', 'CZ', '420', 'CZK', 'Kč', 49.75000000, 15.50000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(59, 'Denmark', 'DNK', 'DK', '45', 'DKK', 'Kr.', 56.00000000, 10.00000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(60, 'Djibouti', 'DJI', 'DJ', '253', 'DJF', 'Fdj', 11.50000000, 43.00000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(61, 'Dominica', 'DMA', 'DM', '+1-767', 'XCD', '$', 15.41666666, -61.33333333, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(62, 'Dominican Republic', 'DOM', 'DO', '+1-809 and 1-829', 'DOP', '$', 19.00000000, -70.66666666, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(63, 'East Timor', 'TLS', 'TL', '670', 'USD', '$', -8.83333333, 125.91666666, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(64, 'Ecuador', 'ECU', 'EC', '593', 'USD', '$', -2.00000000, -77.50000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(65, 'Egypt', 'EGY', 'EG', '20', 'EGP', 'ج.م', 27.00000000, 30.00000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(66, 'El Salvador', 'SLV', 'SV', '503', 'USD', '$', 13.83333333, -88.91666666, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(67, 'Equatorial Guinea', 'GNQ', 'GQ', '240', 'XAF', 'FCFA', 2.00000000, 10.00000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(68, 'Eritrea', 'ERI', 'ER', '291', 'ERN', 'Nfk', 15.00000000, 39.00000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(69, 'Estonia', 'EST', 'EE', '372', 'EUR', '€', 59.00000000, 26.00000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(70, 'Ethiopia', 'ETH', 'ET', '251', 'ETB', 'Nkf', 8.00000000, 38.00000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(71, 'Falkland Islands', 'FLK', 'FK', '500', 'FKP', '£', -51.75000000, -59.00000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(72, 'Faroe Islands', 'FRO', 'FO', '298', 'DKK', 'Kr.', 62.00000000, -7.00000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(73, 'Fiji Islands', 'FJI', 'FJ', '679', 'FJD', 'FJ$', -18.00000000, 175.00000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(74, 'Finland', 'FIN', 'FI', '358', 'EUR', '€', 64.00000000, 26.00000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(75, 'France', 'FRA', 'FR', '33', 'EUR', '€', 46.00000000, 2.00000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(76, 'French Guiana', 'GUF', 'GF', '594', 'EUR', '€', 4.00000000, -53.00000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(77, 'French Polynesia', 'PYF', 'PF', '689', 'XPF', '₣', -15.00000000, -140.00000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(78, 'French Southern Territories', 'ATF', 'TF', '262', 'EUR', '€', -49.25000000, 69.16700000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(79, 'Gabon', 'GAB', 'GA', '241', 'XAF', 'FCFA', -1.00000000, 11.75000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(80, 'Gambia The', 'GMB', 'GM', '220', 'GMD', 'D', 13.46666666, -16.56666666, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(81, 'Georgia', 'GEO', 'GE', '995', 'GEL', 'ლ', 42.00000000, 43.50000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(82, 'Germany', 'DEU', 'DE', '49', 'EUR', '€', 51.00000000, 9.00000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(83, 'Ghana', 'GHA', 'GH', '233', 'GHS', 'GH₵', 8.00000000, -2.00000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(84, 'Gibraltar', 'GIB', 'GI', '350', 'GIP', '£', 36.13333333, -5.35000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(85, 'Greece', 'GRC', 'GR', '30', 'EUR', '€', 39.00000000, 22.00000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(86, 'Greenland', 'GRL', 'GL', '299', 'DKK', 'Kr.', 72.00000000, -40.00000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(87, 'Grenada', 'GRD', 'GD', '+1-473', 'XCD', '$', 12.11666666, -61.66666666, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(88, 'Guadeloupe', 'GLP', 'GP', '590', 'EUR', '€', 16.25000000, -61.58333300, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(89, 'Guam', 'GUM', 'GU', '+1-671', 'USD', '$', 13.46666666, 144.78333333, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(90, 'Guatemala', 'GTM', 'GT', '502', 'GTQ', 'Q', 15.50000000, -90.25000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(91, 'Guernsey and Alderney', 'GGY', 'GG', '+44-1481', 'GBP', '£', 49.46666666, -2.58333333, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(92, 'Guinea', 'GIN', 'GN', '224', 'GNF', 'FG', 11.00000000, -10.00000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(93, 'Guinea-Bissau', 'GNB', 'GW', '245', 'XOF', 'CFA', 12.00000000, -15.00000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(94, 'Guyana', 'GUY', 'GY', '592', 'GYD', '$', 5.00000000, -59.00000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(95, 'Haiti', 'HTI', 'HT', '509', 'HTG', 'G', 19.00000000, -72.41666666, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(96, 'Heard Island and McDonald Islands', 'HMD', 'HM', '672', 'AUD', '$', -53.10000000, 72.51666666, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(97, 'Honduras', 'HND', 'HN', '504', 'HNL', 'L', 15.00000000, -86.50000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(98, 'Hong Kong S.A.R.', 'HKG', 'HK', '852', 'HKD', '$', 22.25000000, 114.16666666, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(99, 'Hungary', 'HUN', 'HU', '36', 'HUF', 'Ft', 47.00000000, 20.00000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(100, 'Iceland', 'ISL', 'IS', '354', 'ISK', 'kr', 65.00000000, -18.00000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(101, 'India', 'IND', 'IN', '91', 'INR', '₹', 20.00000000, 77.00000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(102, 'Indonesia', 'IDN', 'ID', '62', 'IDR', 'Rp', -5.00000000, 120.00000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(103, 'Iran', 'IRN', 'IR', '98', 'IRR', '﷼', 32.00000000, 53.00000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(104, 'Iraq', 'IRQ', 'IQ', '964', 'IQD', 'د.ع', 33.00000000, 44.00000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(105, 'Ireland', 'IRL', 'IE', '353', 'EUR', '€', 53.00000000, -8.00000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(106, 'Israel', 'ISR', 'IL', '972', 'ILS', '₪', 31.50000000, 34.75000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(107, 'Italy', 'ITA', 'IT', '39', 'EUR', '€', 42.83333333, 12.83333333, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(108, 'Jamaica', 'JAM', 'JM', '+1-876', 'JMD', 'J$', 18.25000000, -77.50000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(109, 'Japan', 'JPN', 'JP', '81', 'JPY', '¥', 36.00000000, 138.00000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(110, 'Jersey', 'JEY', 'JE', '+44-1534', 'GBP', '£', 49.25000000, -2.16666666, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(111, 'Jordan', 'JOR', 'JO', '962', 'JOD', 'ا.د', 31.00000000, 36.00000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(112, 'Kazakhstan', 'KAZ', 'KZ', '7', 'KZT', 'лв', 48.00000000, 68.00000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(113, 'Kenya', 'KEN', 'KE', '254', 'KES', 'KSh', 1.00000000, 38.00000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(114, 'Kiribati', 'KIR', 'KI', '686', 'AUD', '$', 1.41666666, 173.00000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(115, 'North Korea', 'PRK', 'KP', '850', 'KPW', '₩', 40.00000000, 127.00000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(116, 'South Korea', 'KOR', 'KR', '82', 'KRW', '₩', 37.00000000, 127.50000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(117, 'Kuwait', 'KWT', 'KW', '965', 'KWD', 'ك.د', 29.50000000, 45.75000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(118, 'Kyrgyzstan', 'KGZ', 'KG', '996', 'KGS', 'лв', 41.00000000, 75.00000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(119, 'Laos', 'LAO', 'LA', '856', 'LAK', '₭', 18.00000000, 105.00000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(120, 'Latvia', 'LVA', 'LV', '371', 'EUR', '€', 57.00000000, 25.00000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(121, 'Lebanon', 'LBN', 'LB', '961', 'LBP', '£', 33.83333333, 35.83333333, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(122, 'Lesotho', 'LSO', 'LS', '266', 'LSL', 'L', -29.50000000, 28.50000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(123, 'Liberia', 'LBR', 'LR', '231', 'LRD', '$', 6.50000000, -9.50000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(124, 'Libya', 'LBY', 'LY', '218', 'LYD', 'د.ل', 25.00000000, 17.00000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(125, 'Liechtenstein', 'LIE', 'LI', '423', 'CHF', 'CHf', 47.26666666, 9.53333333, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(126, 'Lithuania', 'LTU', 'LT', '370', 'EUR', '€', 56.00000000, 24.00000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(127, 'Luxembourg', 'LUX', 'LU', '352', 'EUR', '€', 49.75000000, 6.16666666, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(128, 'Macau S.A.R.', 'MAC', 'MO', '853', 'MOP', '$', 22.16666666, 113.55000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(129, 'Macedonia', 'MKD', 'MK', '389', 'MKD', 'ден', 41.83333333, 22.00000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(130, 'Madagascar', 'MDG', 'MG', '261', 'MGA', 'Ar', -20.00000000, 47.00000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(131, 'Malawi', 'MWI', 'MW', '265', 'MWK', 'MK', -13.50000000, 34.00000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(132, 'Malaysia', 'MYS', 'MY', '60', 'MYR', 'RM', 2.50000000, 112.50000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(133, 'Maldives', 'MDV', 'MV', '960', 'MVR', 'Rf', 3.25000000, 73.00000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(134, 'Mali', 'MLI', 'ML', '223', 'XOF', 'CFA', 17.00000000, -4.00000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(135, 'Malta', 'MLT', 'MT', '356', 'EUR', '€', 35.83333333, 14.58333333, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(136, 'Man (Isle of)', 'IMN', 'IM', '+44-1624', 'GBP', '£', 54.25000000, -4.50000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(137, 'Marshall Islands', 'MHL', 'MH', '692', 'USD', '$', 9.00000000, 168.00000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(138, 'Martinique', 'MTQ', 'MQ', '596', 'EUR', '€', 14.66666700, -61.00000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(139, 'Mauritania', 'MRT', 'MR', '222', 'MRO', 'MRU', 20.00000000, -12.00000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(140, 'Mauritius', 'MUS', 'MU', '230', 'MUR', '₨', -20.28333333, 57.55000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(141, 'Mayotte', 'MYT', 'YT', '262', 'EUR', '€', -12.83333333, 45.16666666, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(142, 'Mexico', 'MEX', 'MX', '52', 'MXN', '$', 23.00000000, -102.00000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(143, 'Micronesia', 'FSM', 'FM', '691', 'USD', '$', 6.91666666, 158.25000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(144, 'Moldova', 'MDA', 'MD', '373', 'MDL', 'L', 47.00000000, 29.00000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(145, 'Monaco', 'MCO', 'MC', '377', 'EUR', '€', 43.73333333, 7.40000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(146, 'Mongolia', 'MNG', 'MN', '976', 'MNT', '₮', 46.00000000, 105.00000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(147, 'Montenegro', 'MNE', 'ME', '382', 'EUR', '€', 42.50000000, 19.30000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(148, 'Montserrat', 'MSR', 'MS', '+1-664', 'XCD', '$', 16.75000000, -62.20000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(149, 'Morocco', 'MAR', 'MA', '212', 'MAD', 'DH', 32.00000000, -5.00000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(150, 'Mozambique', 'MOZ', 'MZ', '258', 'MZN', 'MT', -18.25000000, 35.00000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(151, 'Myanmar', 'MMR', 'MM', '95', 'MMK', 'K', 22.00000000, 98.00000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(152, 'Namibia', 'NAM', 'NA', '264', 'NAD', '$', -22.00000000, 17.00000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(153, 'Nauru', 'NRU', 'NR', '674', 'AUD', '$', -0.53333333, 166.91666666, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(154, 'Nepal', 'NPL', 'NP', '977', 'NPR', '₨', 28.00000000, 84.00000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(155, 'Bonaire, Sint Eustatius and Saba', 'BES', 'BQ', '599', 'USD', '$', 12.15000000, -68.26666700, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(156, 'Netherlands', 'NLD', 'NL', '31', 'EUR', '€', 52.50000000, 5.75000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(157, 'New Caledonia', 'NCL', 'NC', '687', 'XPF', '₣', -21.50000000, 165.50000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(158, 'New Zealand', 'NZL', 'NZ', '64', 'NZD', '$', -41.00000000, 174.00000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(159, 'Nicaragua', 'NIC', 'NI', '505', 'NIO', 'C$', 13.00000000, -85.00000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(160, 'Niger', 'NER', 'NE', '227', 'XOF', 'CFA', 16.00000000, 8.00000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(161, 'Nigeria', 'NGA', 'NG', '234', 'NGN', '₦', 10.00000000, 8.00000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(162, 'Niue', 'NIU', 'NU', '683', 'NZD', '$', -19.03333333, -169.86666666, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(163, 'Norfolk Island', 'NFK', 'NF', '672', 'AUD', '$', -29.03333333, 167.95000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(164, 'Northern Mariana Islands', 'MNP', 'MP', '+1-670', 'USD', '$', 15.20000000, 145.75000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(165, 'Norway', 'NOR', 'NO', '47', 'NOK', 'kr', 62.00000000, 10.00000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(166, 'Oman', 'OMN', 'OM', '968', 'OMR', '.ع.ر', 21.00000000, 57.00000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(167, 'Pakistan', 'PAK', 'PK', '92', 'PKR', '₨', 30.00000000, 70.00000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(168, 'Palau', 'PLW', 'PW', '680', 'USD', '$', 7.50000000, 134.50000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(169, 'Palestinian Territory Occupied', 'PSE', 'PS', '970', 'ILS', '₪', 31.90000000, 35.20000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(170, 'Panama', 'PAN', 'PA', '507', 'PAB', 'B/.', 9.00000000, -80.00000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(171, 'Papua new Guinea', 'PNG', 'PG', '675', 'PGK', 'K', -6.00000000, 147.00000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(172, 'Paraguay', 'PRY', 'PY', '595', 'PYG', '₲', -23.00000000, -58.00000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(173, 'Peru', 'PER', 'PE', '51', 'PEN', 'S/.', -10.00000000, -76.00000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(174, 'Philippines', 'PHL', 'PH', '63', 'PHP', '₱', 13.00000000, 122.00000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(175, 'Pitcairn Island', 'PCN', 'PN', '870', 'NZD', '$', -25.06666666, -130.10000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(176, 'Poland', 'POL', 'PL', '48', 'PLN', 'zł', 52.00000000, 20.00000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(177, 'Portugal', 'PRT', 'PT', '351', 'EUR', '€', 39.50000000, -8.00000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(178, 'Puerto Rico', 'PRI', 'PR', '+1-787 and 1-939', 'USD', '$', 18.25000000, -66.50000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(179, 'Qatar', 'QAT', 'QA', '974', 'QAR', 'ق.ر', 25.50000000, 51.25000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(180, 'Reunion', 'REU', 'RE', '262', 'EUR', '€', -21.15000000, 55.50000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(181, 'Romania', 'ROU', 'RO', '40', 'RON', 'lei', 46.00000000, 25.00000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(182, 'Russia', 'RUS', 'RU', '7', 'RUB', '₽', 60.00000000, 100.00000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(183, 'Rwanda', 'RWA', 'RW', '250', 'RWF', 'FRw', -2.00000000, 30.00000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(184, 'Saint Helena', 'SHN', 'SH', '290', 'SHP', '£', -15.95000000, -5.70000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(185, 'Saint Kitts And Nevis', 'KNA', 'KN', '+1-869', 'XCD', '$', 17.33333333, -62.75000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(186, 'Saint Lucia', 'LCA', 'LC', '+1-758', 'XCD', '$', 13.88333333, -60.96666666, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(187, 'Saint Pierre and Miquelon', 'SPM', 'PM', '508', 'EUR', '€', 46.83333333, -56.33333333, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(188, 'Saint Vincent And The Grenadines', 'VCT', 'VC', '+1-784', 'XCD', '$', 13.25000000, -61.20000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(189, 'Saint-Barthelemy', 'BLM', 'BL', '590', 'EUR', '€', 18.50000000, -63.41666666, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(190, 'Saint-Martin (French part)', 'MAF', 'MF', '590', 'EUR', '€', 18.08333333, -63.95000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(191, 'Samoa', 'WSM', 'WS', '685', 'WST', 'SAT', -13.58333333, -172.33333333, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(192, 'San Marino', 'SMR', 'SM', '378', 'EUR', '€', 43.76666666, 12.41666666, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(193, 'Sao Tome and Principe', 'STP', 'ST', '239', 'STD', 'Db', 1.00000000, 7.00000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(194, 'Saudi Arabia', 'SAU', 'SA', '966', 'SAR', '﷼', 25.00000000, 45.00000000, 0, '2018-07-20 08:11:03', '2021-09-26 01:09:09'),
(195, 'Senegal', 'SEN', 'SN', '221', 'XOF', 'CFA', 14.00000000, -14.00000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(196, 'Serbia', 'SRB', 'RS', '381', 'RSD', 'din', 44.00000000, 21.00000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(197, 'Seychelles', 'SYC', 'SC', '248', 'SCR', 'SRe', -4.58333333, 55.66666666, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(198, 'Sierra Leone', 'SLE', 'SL', '232', 'SLL', 'Le', 8.50000000, -11.50000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(199, 'Singapore', 'SGP', 'SG', '65', 'SGD', '$', 1.36666666, 103.80000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(200, 'Slovakia', 'SVK', 'SK', '421', 'EUR', '€', 48.66666666, 19.50000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(201, 'Slovenia', 'SVN', 'SI', '386', 'EUR', '€', 46.11666666, 14.81666666, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(202, 'Solomon Islands', 'SLB', 'SB', '677', 'SBD', 'Si$', -8.00000000, 159.00000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(203, 'Somalia', 'SOM', 'SO', '252', 'SOS', 'Sh.so.', 10.00000000, 49.00000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(204, 'South Africa', 'ZAF', 'ZA', '27', 'ZAR', 'R', -29.00000000, 24.00000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(205, 'South Georgia', 'SGS', 'GS', '500', 'GBP', '£', -54.50000000, -37.00000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(206, 'South Sudan', 'SSD', 'SS', '211', 'SSP', '£', 7.00000000, 30.00000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(207, 'Spain', 'ESP', 'ES', '34', 'EUR', '€', 40.00000000, -4.00000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(208, 'Sri Lanka', 'LKA', 'LK', '94', 'LKR', 'Rs', 7.00000000, 81.00000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(209, 'Sudan', 'SDN', 'SD', '249', 'SDG', '.س.ج', 15.00000000, 30.00000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(210, 'Suriname', 'SUR', 'SR', '597', 'SRD', '$', 4.00000000, -56.00000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(211, 'Svalbard And Jan Mayen Islands', 'SJM', 'SJ', '47', 'NOK', 'kr', 78.00000000, 20.00000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(212, 'Swaziland', 'SWZ', 'SZ', '268', 'SZL', 'E', -26.50000000, 31.50000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(213, 'Sweden', 'SWE', 'SE', '46', 'SEK', 'kr', 62.00000000, 15.00000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(214, 'Switzerland', 'CHE', 'CH', '41', 'CHF', 'CHf', 47.00000000, 8.00000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(215, 'Syria', 'SYR', 'SY', '963', 'SYP', 'LS', 35.00000000, 38.00000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(216, 'Taiwan', 'TWN', 'TW', '886', 'TWD', '$', 23.50000000, 121.00000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(217, 'Tajikistan', 'TJK', 'TJ', '992', 'TJS', 'SM', 39.00000000, 71.00000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(218, 'Tanzania', 'TZA', 'TZ', '255', 'TZS', 'TSh', -6.00000000, 35.00000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(219, 'Thailand', 'THA', 'TH', '66', 'THB', '฿', 15.00000000, 100.00000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(220, 'Togo', 'TGO', 'TG', '228', 'XOF', 'CFA', 8.00000000, 1.16666666, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(221, 'Tokelau', 'TKL', 'TK', '690', 'NZD', '$', -9.00000000, -172.00000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(222, 'Tonga', 'TON', 'TO', '676', 'TOP', '$', -20.00000000, -175.00000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(223, 'Trinidad And Tobago', 'TTO', 'TT', '+1-868', 'TTD', '$', 11.00000000, -61.00000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(224, 'Tunisia', 'TUN', 'TN', '216', 'TND', 'ت.د', 34.00000000, 9.00000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(225, 'Turkey', 'TUR', 'TR', '90', 'TRY', '₺', 39.00000000, 35.00000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(226, 'Turkmenistan', 'TKM', 'TM', '993', 'TMT', 'T', 40.00000000, 60.00000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(227, 'Turks And Caicos Islands', 'TCA', 'TC', '+1-649', 'USD', '$', 21.75000000, -71.58333333, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(228, 'Tuvalu', 'TUV', 'TV', '688', 'AUD', '$', -8.00000000, 178.00000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(229, 'Uganda', 'UGA', 'UG', '256', 'UGX', 'USh', 1.00000000, 32.00000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(230, 'Ukraine', 'UKR', 'UA', '380', 'UAH', '₴', 49.00000000, 32.00000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(231, 'United Arab Emirates', 'ARE', 'AE', '971', 'AED', 'إ.د', 24.00000000, 54.00000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(232, 'United Kingdom', 'GBR', 'GB', '44', 'GBP', '£', 54.00000000, -2.00000000, 1, '2018-07-20 08:11:03', '2023-12-11 07:43:42'),
(233, 'United States', 'USA', 'US', '1', 'USD', '$', 38.00000000, -97.00000000, 1, '2018-07-20 08:11:03', '2023-12-11 07:43:43'),
(234, 'United States Minor Outlying Islands', 'UMI', 'UM', '1', 'USD', '$', 0.00000000, 0.00000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(235, 'Uruguay', 'URY', 'UY', '598', 'UYU', '$', -33.00000000, -56.00000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(236, 'Uzbekistan', 'UZB', 'UZ', '998', 'UZS', 'лв', 41.00000000, 64.00000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(237, 'Vanuatu', 'VUT', 'VU', '678', 'VUV', 'VT', -16.00000000, 167.00000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(238, 'Vatican City State (Holy See)', 'VAT', 'VA', '379', 'EUR', '€', 41.90000000, 12.45000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(239, 'Venezuela', 'VEN', 'VE', '58', 'VEF', 'Bs', 8.00000000, -66.00000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(240, 'Vietnam', 'VNM', 'VN', '84', 'VND', '₫', 16.16666666, 107.83333333, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(241, 'Virgin Islands (British)', 'VGB', 'VG', '+1-284', 'USD', '$', 18.43138300, -64.62305000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(242, 'Virgin Islands (US)', 'VIR', 'VI', '+1-340', 'USD', '$', 18.34000000, -64.93000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(243, 'Wallis And Futuna Islands', 'WLF', 'WF', '681', 'XPF', '₣', -13.30000000, -176.20000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(244, 'Western Sahara', 'ESH', 'EH', '212', 'MAD', 'MAD', 24.50000000, -13.00000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(245, 'Yemen', 'YEM', 'YE', '967', 'YER', '﷼', 15.00000000, 48.00000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(246, 'Zambia', 'ZMB', 'ZM', '260', 'ZMW', 'ZK', -15.00000000, 30.00000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(247, 'Zimbabwe', 'ZWE', 'ZW', '263', 'ZWL', '$', -20.00000000, 30.00000000, 0, '2018-07-20 08:11:03', '2021-08-01 02:37:27'),
(248, 'Kosovo', 'XKX', 'XK', '383', 'EUR', '€', 42.56129090, 20.34030350, 0, '2020-08-15 03:33:50', '2021-08-01 02:37:57'),
(249, 'Curaçao', 'CUW', 'CW', '599', 'ANG', 'ƒ', 12.11666700, -68.93333300, 0, '2020-10-25 02:54:20', '2021-08-01 02:37:27'),
(250, 'Sint Maarten (Dutch part)', 'SXM', 'SX', '1721', 'ANG', 'ƒ', 18.03333300, -63.05000000, 0, '2020-12-05 01:03:39', '2021-08-01 02:37:27');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL COMMENT 'if none or 1 then own else sellers',
  `type` varchar(191) NOT NULL,
  `code` varchar(191) NOT NULL,
  `banner_id` bigint(20) UNSIGNED DEFAULT NULL,
  `banner` text DEFAULT NULL,
  `minimum_shopping` double DEFAULT NULL,
  `maximum_discount` double DEFAULT NULL,
  `product_id` text DEFAULT NULL,
  `discount_type` varchar(191) DEFAULT NULL,
  `discount` double DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `start_date` timestamp NULL DEFAULT NULL,
  `end_date` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `user_id`, `type`, `code`, `banner_id`, `banner`, `minimum_shopping`, `maximum_discount`, `product_id`, `discount_type`, `discount`, `status`, `start_date`, `end_date`, `created_at`, `updated_at`) VALUES
(1, 1, 'product_base', '12345', 31, '{\"storage\":\"local\",\"original_image\":\"images\\/20231130112427_original__media_131.jpg\",\"image_40x40\":\"images\\/20231130112427image_40x40_media_193.jpg\",\"image_72x72\":\"images\\/20231130112427image_72x72_media_113.jpg\",\"image_190x230\":\"images\\/20231130112427image_190x230_media_84.jpg\",\"image_1920x412\":\"images\\/20231130113226image_1920x412-89.png\",\"image_145x110\":\"images\\/20231219171409image_145x110-28.png\"}', 0, NULL, '[\"16\",\"15\",\"13\"]', 'flat', 0.90909090909091, 1, '2023-12-19 11:12:00', '2024-01-31 17:59:00', '2023-12-19 11:14:11', '2023-12-19 11:14:11');

-- --------------------------------------------------------

--
-- Table structure for table `coupon_languages`
--

CREATE TABLE `coupon_languages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `coupon_id` bigint(20) UNSIGNED NOT NULL,
  `lang` varchar(10) NOT NULL DEFAULT 'en',
  `title` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coupon_languages`
--

INSERT INTO `coupon_languages` (`id`, `coupon_id`, `lang`, `title`, `created_at`, `updated_at`) VALUES
(1, 1, 'en', 'New Year Sale', '2023-12-19 11:14:11', '2023-12-19 11:14:11');

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `symbol` varchar(191) NOT NULL,
  `code` varchar(191) NOT NULL,
  `exchange_rate` double DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `name`, `symbol`, `code`, `exchange_rate`, `status`, `created_at`, `updated_at`) VALUES
(1, 'US Dollar', '$', 'USD', 1, 1, '2022-04-06 00:07:39', '2023-11-16 06:16:32'),
(2, 'Taka', '৳', 'BDT', 110, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `delivery_heroes`
--

CREATE TABLE `delivery_heroes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `pickup_hub_id` bigint(20) UNSIGNED DEFAULT NULL,
  `driving_licence` varchar(191) DEFAULT NULL,
  `driving_licence_image` text DEFAULT NULL,
  `salary` double DEFAULT NULL,
  `commission` double DEFAULT NULL,
  `total_commission` double DEFAULT NULL,
  `total_collection` double DEFAULT NULL,
  `total_paid` double DEFAULT NULL,
  `country_id` bigint(20) DEFAULT NULL,
  `state_id` bigint(20) DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `delivery_hero_accounts`
--

CREATE TABLE `delivery_hero_accounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL COMMENT 'processed by user',
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `delivery_hero_id` bigint(20) UNSIGNED DEFAULT NULL,
  `source` varchar(191) NOT NULL,
  `type` varchar(191) NOT NULL COMMENT 'income means in, expense means out',
  `amount` double DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `delivery_histories`
--

CREATE TABLE `delivery_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `delivery_hero_id` bigint(20) UNSIGNED DEFAULT NULL,
  `event` varchar(191) NOT NULL,
  `remarks` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `delivery_histories`
--

INSERT INTO `delivery_histories` (`id`, `order_id`, `user_id`, `delivery_hero_id`, `event`, `remarks`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, 'order_create_event', '', '2023-12-11 08:51:19', '2023-12-11 08:51:19'),
(3, 3, 2, NULL, 'order_create_event', '', '2023-12-18 09:19:13', '2023-12-18 09:19:13'),
(4, 3, 1, NULL, 'order_on_the_way_event', '', '2023-12-18 09:23:31', '2023-12-18 09:23:31'),
(5, 4, 2, NULL, 'order_create_event', '', '2023-12-18 14:28:39', '2023-12-18 14:28:39');

-- --------------------------------------------------------

--
-- Table structure for table `flag_icons`
--

CREATE TABLE `flag_icons` (
  `id` int(10) UNSIGNED NOT NULL,
  `image` varchar(50) NOT NULL,
  `title` varchar(10) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `flag_icons`
--

INSERT INTO `flag_icons` (`id`, `image`, `title`, `created_at`, `updated_at`) VALUES
(1, 'images/flags/ad.png', 'AD', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(2, 'images/flags/ae.png', 'AE', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(3, 'images/flags/af.png', 'AF', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(4, 'images/flags/ag.png', 'AG', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(5, 'images/flags/ai.png', 'AI', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(6, 'images/flags/al.png', 'AL', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(7, 'images/flags/am.png', 'AM', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(8, 'images/flags/ao.png', 'AO', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(9, 'images/flags/ar.png', 'AR', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(10, 'images/flags/as.png', 'AS', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(11, 'images/flags/at.png', 'AT', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(12, 'images/flags/au.png', 'AU', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(13, 'images/flags/aw.png', 'AW', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(14, 'images/flags/ax.png', 'AX', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(15, 'images/flags/az.png', 'AZ', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(16, 'images/flags/ba.png', 'BA', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(17, 'images/flags/bb.png', 'BB', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(18, 'images/flags/bd.png', 'BD', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(19, 'images/flags/be.png', 'BE', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(20, 'images/flags/bf.png', 'BF', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(21, 'images/flags/bg.png', 'BG', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(22, 'images/flags/bh.png', 'BH', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(23, 'images/flags/bi.png', 'BI', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(24, 'images/flags/bj.png', 'BJ', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(25, 'images/flags/bm.png', 'BM', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(26, 'images/flags/bn.png', 'BN', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(27, 'images/flags/bo.png', 'BO', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(28, 'images/flags/br.png', 'BR', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(29, 'images/flags/bs.png', 'BS', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(30, 'images/flags/bt.png', 'BT', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(31, 'images/flags/bv.png', 'BV', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(32, 'images/flags/bw.png', 'BW', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(33, 'images/flags/by.png', 'BY', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(34, 'images/flags/bz.png', 'BZ', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(35, 'images/flags/ca.png', 'CA', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(36, 'images/flags/cc.png', 'CC', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(37, 'images/flags/cd.png', 'CD', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(38, 'images/flags/cf.png', 'CF', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(39, 'images/flags/cg.png', 'CG', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(40, 'images/flags/ch.png', 'CH', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(41, 'images/flags/ci.png', 'CI', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(42, 'images/flags/ck.png', 'CK', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(43, 'images/flags/cl.png', 'CL', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(44, 'images/flags/cm.png', 'CM', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(45, 'images/flags/cn.png', 'CN', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(46, 'images/flags/co.png', 'CO', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(47, 'images/flags/cr.png', 'CR', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(48, 'images/flags/cu.png', 'CU', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(49, 'images/flags/cv.png', 'CV', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(50, 'images/flags/cx.png', 'CX', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(51, 'images/flags/cy.png', 'CY', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(52, 'images/flags/cz.png', 'CZ', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(53, 'images/flags/de.png', 'DE', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(54, 'images/flags/dj.png', 'DJ', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(55, 'images/flags/dk.png', 'DK', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(56, 'images/flags/dm.png', 'DM', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(57, 'images/flags/do.png', 'DO', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(58, 'images/flags/dz.png', 'DZ', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(59, 'images/flags/ec.png', 'EC', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(60, 'images/flags/ee.png', 'EE', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(61, 'images/flags/eg.png', 'EG', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(62, 'images/flags/eh.png', 'EH', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(63, 'images/flags/er.png', 'ER', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(64, 'images/flags/es.png', 'ES', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(65, 'images/flags/et.png', 'ET', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(66, 'images/flags/fi.png', 'FI', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(67, 'images/flags/fj.png', 'FJ', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(68, 'images/flags/fk.png', 'FK', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(69, 'images/flags/fm.png', 'FM', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(70, 'images/flags/fo.png', 'FO', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(71, 'images/flags/fr.png', 'FR', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(72, 'images/flags/ga.png', 'GA', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(73, 'images/flags/gb.png', 'GB', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(74, 'images/flags/gd.png', 'GD', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(75, 'images/flags/ge.png', 'GE', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(76, 'images/flags/gf.png', 'GF', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(77, 'images/flags/gh.png', 'GH', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(78, 'images/flags/gi.png', 'GI', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(79, 'images/flags/gl.png', 'GL', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(80, 'images/flags/gm.png', 'GM', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(81, 'images/flags/gn.png', 'GN', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(82, 'images/flags/gp.png', 'GP', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(83, 'images/flags/gq.png', 'GQ', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(84, 'images/flags/gr.png', 'GR', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(85, 'images/flags/gs.png', 'GS', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(86, 'images/flags/gt.png', 'GT', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(87, 'images/flags/gu.png', 'GU', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(88, 'images/flags/gw.png', 'GW', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(89, 'images/flags/gy.png', 'GY', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(90, 'images/flags/hk.png', 'HK', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(91, 'images/flags/hm.png', 'HM', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(92, 'images/flags/hn.png', 'HN', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(93, 'images/flags/hr.png', 'HR', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(94, 'images/flags/ht.png', 'HT', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(95, 'images/flags/hu.png', 'HU', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(96, 'images/flags/id.png', 'ID', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(97, 'images/flags/ie.png', 'IE', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(98, 'images/flags/il.png', 'IL', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(99, 'images/flags/in.png', 'IN', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(100, 'images/flags/io.png', 'IO', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(101, 'images/flags/iq.png', 'IQ', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(102, 'images/flags/ir.png', 'IR', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(103, 'images/flags/is.png', 'IS', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(104, 'images/flags/it.png', 'IT', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(105, 'images/flags/jm.png', 'JM', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(106, 'images/flags/jo.png', 'JO', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(107, 'images/flags/jp.png', 'JP', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(108, 'images/flags/ke.png', 'KE', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(109, 'images/flags/kg.png', 'KG', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(110, 'images/flags/kh.png', 'KH', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(111, 'images/flags/ki.png', 'KI', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(112, 'images/flags/km.png', 'KM', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(113, 'images/flags/kn.png', 'KN', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(114, 'images/flags/kp.png', 'KP', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(115, 'images/flags/kr.png', 'KR', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(116, 'images/flags/kw.png', 'KW', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(117, 'images/flags/ky.png', 'KY', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(118, 'images/flags/kz.png', 'KZ', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(119, 'images/flags/la.png', 'LA', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(120, 'images/flags/lb.png', 'LB', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(121, 'images/flags/lc.png', 'LC', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(122, 'images/flags/li.png', 'LI', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(123, 'images/flags/lk.png', 'LK', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(124, 'images/flags/lr.png', 'LR', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(125, 'images/flags/ls.png', 'LS', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(126, 'images/flags/lt.png', 'LT', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(127, 'images/flags/lu.png', 'LU', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(128, 'images/flags/lv.png', 'LV', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(129, 'images/flags/ly.png', 'LY', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(130, 'images/flags/ma.png', 'MA', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(131, 'images/flags/mc.png', 'MC', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(132, 'images/flags/md.png', 'MD', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(133, 'images/flags/me.png', 'ME', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(134, 'images/flags/mg.png', 'MG', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(135, 'images/flags/mh.png', 'MH', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(136, 'images/flags/mk.png', 'MK', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(137, 'images/flags/ml.png', 'ML', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(138, 'images/flags/mm.png', 'MM', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(139, 'images/flags/mn.png', 'MN', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(140, 'images/flags/mo.png', 'MO', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(141, 'images/flags/mp.png', 'MP', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(142, 'images/flags/mq.png', 'MQ', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(143, 'images/flags/mr.png', 'MR', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(144, 'images/flags/ms.png', 'MS', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(145, 'images/flags/mt.png', 'MT', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(146, 'images/flags/mu.png', 'MU', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(147, 'images/flags/mv.png', 'MV', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(148, 'images/flags/mw.png', 'MW', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(149, 'images/flags/mx.png', 'MX', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(150, 'images/flags/my.png', 'MY', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(151, 'images/flags/mz.png', 'MZ', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(152, 'images/flags/na.png', 'NA', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(153, 'images/flags/nc.png', 'NC', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(154, 'images/flags/ne.png', 'NE', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(155, 'images/flags/nf.png', 'NF', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(156, 'images/flags/ng.png', 'NG', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(157, 'images/flags/ni.png', 'NI', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(158, 'images/flags/nl.png', 'NL', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(159, 'images/flags/no.png', 'NO', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(160, 'images/flags/np.png', 'NP', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(161, 'images/flags/nr.png', 'NR', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(162, 'images/flags/nu.png', 'NU', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(163, 'images/flags/nz.png', 'NZ', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(164, 'images/flags/om.png', 'OM', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(165, 'images/flags/pa.png', 'PA', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(166, 'images/flags/pe.png', 'PE', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(167, 'images/flags/pf.png', 'PF', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(168, 'images/flags/pg.png', 'PG', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(169, 'images/flags/ph.png', 'PH', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(170, 'images/flags/pk.png', 'PK', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(171, 'images/flags/pl.png', 'PL', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(172, 'images/flags/pm.png', 'PM', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(173, 'images/flags/pn.png', 'PN', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(174, 'images/flags/pr.png', 'PR', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(175, 'images/flags/ps.png', 'PS', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(176, 'images/flags/pt.png', 'PT', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(177, 'images/flags/pw.png', 'PW', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(178, 'images/flags/py.png', 'PY', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(179, 'images/flags/qa.png', 'QA', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(180, 'images/flags/re.png', 'RE', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(181, 'images/flags/ro.png', 'RO', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(182, 'images/flags/rs.png', 'RS', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(183, 'images/flags/ru.png', 'RU', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(184, 'images/flags/rw.png', 'RW', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(185, 'images/flags/sa.png', 'SA', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(186, 'images/flags/sb.png', 'SB', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(187, 'images/flags/sc.png', 'SC', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(188, 'images/flags/sd.png', 'SD', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(189, 'images/flags/se.png', 'SE', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(190, 'images/flags/sg.png', 'SG', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(191, 'images/flags/sh.png', 'SH', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(192, 'images/flags/si.png', 'SI', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(193, 'images/flags/sj.png', 'SJ', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(194, 'images/flags/sk.png', 'SK', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(195, 'images/flags/sl.png', 'SL', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(196, 'images/flags/sm.png', 'SM', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(197, 'images/flags/sn.png', 'SN', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(198, 'images/flags/so.png', 'SO', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(199, 'images/flags/sr.png', 'SR', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(200, 'images/flags/st.png', 'ST', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(201, 'images/flags/sv.png', 'SV', '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(202, 'images/flags/sy.png', 'SY', '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(203, 'images/flags/sz.png', 'SZ', '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(204, 'images/flags/tc.png', 'TC', '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(205, 'images/flags/td.png', 'TD', '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(206, 'images/flags/tf.png', 'TF', '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(207, 'images/flags/tg.png', 'TG', '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(208, 'images/flags/th.png', 'TH', '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(209, 'images/flags/tj.png', 'TJ', '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(210, 'images/flags/tk.png', 'TK', '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(211, 'images/flags/tl.png', 'TL', '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(212, 'images/flags/tm.png', 'TM', '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(213, 'images/flags/tn.png', 'TN', '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(214, 'images/flags/to.png', 'TO', '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(215, 'images/flags/tr.png', 'TR', '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(216, 'images/flags/tt.png', 'TT', '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(217, 'images/flags/tv.png', 'TV', '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(218, 'images/flags/tw.png', 'TW', '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(219, 'images/flags/tz.png', 'TZ', '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(220, 'images/flags/ua.png', 'UA', '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(221, 'images/flags/us.png', 'US', '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(222, 'images/flags/ug.png', 'UG', '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(223, 'images/flags/um.png', 'UM', '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(224, 'images/flags/uy.png', 'UY', '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(225, 'images/flags/uz.png', 'UZ', '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(226, 'images/flags/va.png', 'VA', '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(227, 'images/flags/vc.png', 'VC', '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(228, 'images/flags/ve.png', 'VE', '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(229, 'images/flags/vg.png', 'VG', '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(230, 'images/flags/vi.png', 'VI', '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(231, 'images/flags/vn.png', 'VN', '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(232, 'images/flags/vu.png', 'VU', '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(233, 'images/flags/wf.png', 'WF', '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(234, 'images/flags/ws.png', 'WS', '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(235, 'images/flags/ye.png', 'YE', '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(236, 'images/flags/yt.png', 'YT', '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(237, 'images/flags/za.png', 'ZA', '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(238, 'images/flags/zm.png', 'ZM', '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(239, 'images/flags/zw.png', 'ZW', '2022-04-06 00:07:39', '2022-04-06 00:07:39');

-- --------------------------------------------------------

--
-- Table structure for table `fonts`
--

CREATE TABLE `fonts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `regular` varchar(255) NOT NULL,
  `medium` varchar(255) NOT NULL,
  `bold` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `local` varchar(255) NOT NULL DEFAULT 'en',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `locale` varchar(30) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `flag` varchar(50) DEFAULT NULL,
  `text_direction` varchar(30) DEFAULT 'ltr',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `name`, `locale`, `status`, `flag`, `text_direction`, `created_at`, `updated_at`) VALUES
(1, 'English', 'en', 1, 'images/flags/us.png', 'ltr', '2022-04-06 00:07:38', '2022-04-06 00:07:38');

-- --------------------------------------------------------

--
-- Table structure for table `language_configs`
--

CREATE TABLE `language_configs` (
  `id` int(10) UNSIGNED NOT NULL,
  `language_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `script` varchar(30) DEFAULT NULL,
  `native` varchar(30) DEFAULT NULL,
  `regional` varchar(30) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `language_configs`
--

INSERT INTO `language_configs` (`id`, `language_id`, `name`, `script`, `native`, `regional`, `created_at`, `updated_at`) VALUES
(1, 1, 'English', 'Latn', 'English', 'en_GB', '2022-04-06 00:07:38', '2022-04-06 00:07:38');

-- --------------------------------------------------------

--
-- Table structure for table `log_activities`
--

CREATE TABLE `log_activities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `url` varchar(191) NOT NULL,
  `method` varchar(50) NOT NULL,
  `ip` varchar(30) NOT NULL,
  `browser` varchar(191) DEFAULT NULL,
  `platform` varchar(191) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `log_activities`
--

INSERT INTO `log_activities` (`id`, `url`, `method`, `ip`, `browser`, `platform`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'http://localhost/yoori_release_150/login', 'POST', '::1', 'Google Chrome', 'windows', 1, '2022-09-06 10:09:38', '2022-09-06 10:09:38'),
(2, 'http://localhost/yoori_release_151/login', 'POST', '::1', 'Google Chrome', 'windows', 1, '2022-09-10 09:36:18', '2022-09-10 09:36:18'),
(3, 'http://localhost/yoori_release_154/login', 'POST', '::1', 'Google Chrome', 'windows', 1, '2022-11-15 08:34:55', '2022-11-15 08:34:55'),
(4, 'http://localhost/yoori_release_154/login', 'POST', '::1', 'Google Chrome', 'windows', 1, '2022-11-15 08:55:28', '2022-11-15 08:55:28'),
(5, 'http://localhost/yoori/login-admin-seller', 'POST', '::1', 'Google Chrome', 'windows', 1, '2023-09-14 03:27:59', '2023-09-14 03:27:59'),
(6, 'http://localhost/yoori_installer_165/login', 'POST', '::1', 'Google Chrome', 'windows', 1, '2023-09-14 19:03:35', '2023-09-14 19:03:35'),
(7, 'http://localhost/sprezzatura_ecom/login-admin-seller', 'POST', '::1', 'Google Chrome', 'windows', 1, '2023-11-15 15:37:22', '2023-11-15 15:37:22'),
(8, 'http://localhost/sprezzatura_ecom/login-admin-seller', 'POST', '::1', 'Google Chrome', 'windows', 1, '2023-11-15 15:40:16', '2023-11-15 15:40:16'),
(9, 'http://localhost/sprezzatura_ecom/login-admin-seller', 'POST', '::1', 'Google Chrome', 'windows', 1, '2023-11-16 06:08:20', '2023-11-16 06:08:20'),
(10, 'http://localhost/sprezzatura_ecom/login-admin-seller', 'POST', '::1', 'Google Chrome', 'windows', 1, '2023-11-17 16:50:39', '2023-11-17 16:50:39'),
(11, 'http://localhost/sprezzatura_ecom/login-admin-seller', 'POST', '::1', 'Google Chrome', 'windows', 1, '2023-11-18 06:55:16', '2023-11-18 06:55:16'),
(12, 'http://localhost/sprezzatura_ecom/login-admin-seller', 'POST', '::1', 'Google Chrome', 'windows', 1, '2023-11-19 06:10:33', '2023-11-19 06:10:33'),
(13, 'http://localhost/sprezzatura_ecom/login', 'POST', '::1', 'Google Chrome', 'windows', 1, '2023-11-19 08:31:36', '2023-11-19 08:31:36'),
(14, 'http://localhost/sprezzatura_ecom/login', 'POST', '::1', 'Google Chrome', 'windows', 1, '2023-11-20 13:12:17', '2023-11-20 13:12:17'),
(15, 'http://localhost/sprezzatura_ecom/login', 'POST', '::1', 'Google Chrome', 'windows', 1, '2023-11-21 12:38:50', '2023-11-21 12:38:50'),
(16, 'http://localhost/sprezzatura_ecom/login', 'POST', '::1', 'Google Chrome', 'windows', 1, '2023-11-22 05:19:18', '2023-11-22 05:19:18'),
(17, 'http://localhost/sprezzatura_ecom/login', 'POST', '::1', 'Google Chrome', 'windows', 1, '2023-11-22 09:34:26', '2023-11-22 09:34:26'),
(18, 'http://localhost/sprezzatura_ecom/login', 'POST', '::1', 'Google Chrome', 'windows', 1, '2023-11-22 09:36:48', '2023-11-22 09:36:48'),
(19, 'http://localhost/sprezzatura_ecom/login', 'POST', '::1', 'Google Chrome', 'windows', 1, '2023-11-22 10:15:20', '2023-11-22 10:15:20'),
(20, 'http://localhost/sprezzatura_ecom/login', 'POST', '::1', 'Google Chrome', 'windows', 1, '2023-11-22 10:48:48', '2023-11-22 10:48:48'),
(21, 'http://localhost/sprezzatura_ecom/login-admin-seller', 'POST', '::1', 'Google Chrome', 'windows', 1, '2023-11-25 09:06:02', '2023-11-25 09:06:02'),
(22, 'http://localhost/sprezzatura_ecom/login-admin-seller', 'POST', '::1', 'Google Chrome', 'windows', 1, '2023-11-27 05:57:16', '2023-11-27 05:57:16'),
(23, 'http://localhost/sprezzatura_ecom/login-admin-seller', 'POST', '::1', 'Google Chrome', 'windows', 1, '2023-11-28 05:32:38', '2023-11-28 05:32:38'),
(24, 'http://localhost/sprezzatura_ecom/login-admin-seller', 'POST', '::1', 'Google Chrome', 'windows', 1, '2023-11-29 05:57:52', '2023-11-29 05:57:52'),
(25, 'http://localhost/sprezzatura_ecom/login-admin-seller', 'POST', '::1', 'Google Chrome', 'windows', 1, '2023-11-30 04:08:45', '2023-11-30 04:08:45'),
(26, 'http://localhost/sprezzatura_ecom/login-admin-seller', 'POST', '::1', 'Google Chrome', 'windows', 1, '2023-12-02 05:51:37', '2023-12-02 05:51:37'),
(27, 'http://localhost/sprezzatura_ecom/login-admin-seller', 'POST', '::1', 'Google Chrome', 'windows', 1, '2023-12-11 07:39:53', '2023-12-11 07:39:53'),
(28, 'http://localhost/sprezzatura_ecom/login', 'POST', '::1', 'Google Chrome', 'windows', 1, '2023-12-12 05:58:58', '2023-12-12 05:58:58'),
(29, 'http://localhost/sprezzatura_ecom/login-admin-seller', 'POST', '::1', 'Google Chrome', 'windows', 1, '2023-12-12 06:18:00', '2023-12-12 06:18:00'),
(30, 'http://localhost/sprezzatura_ecom/login', 'POST', '::1', 'Google Chrome', 'windows', 16, '2023-12-12 07:16:10', '2023-12-12 07:16:10'),
(31, 'http://localhost/sprezzatura_ecom/login-admin-seller', 'POST', '::1', 'Google Chrome', 'windows', 1, '2023-12-13 10:23:51', '2023-12-13 10:23:51'),
(32, 'http://localhost/sprezzatura_ecom/login-admin-seller', 'POST', '::1', 'Google Chrome', 'windows', 1, '2023-12-18 08:39:31', '2023-12-18 08:39:31'),
(33, 'http://localhost/sprezzatura_ecom/login', 'POST', '::1', 'Google Chrome', 'windows', 16, '2023-12-18 09:26:18', '2023-12-18 09:26:18'),
(34, 'http://localhost/sprezzatura_ecom/login', 'POST', '::1', 'Google Chrome', 'windows', 1, '2023-12-18 14:30:20', '2023-12-18 14:30:20'),
(35, 'http://localhost/sprezzatura_ecom/login-admin-seller', 'POST', '::1', 'Google Chrome', 'windows', 1, '2023-12-19 09:32:57', '2023-12-19 09:32:57');

-- --------------------------------------------------------

--
-- Table structure for table `ltm_translations`
--

CREATE TABLE `ltm_translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `locale` varchar(191) NOT NULL,
  `group` varchar(191) NOT NULL,
  `key` text NOT NULL,
  `value` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(250) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `storage` varchar(30) NOT NULL DEFAULT 'local',
  `type` varchar(30) DEFAULT NULL,
  `extension` varchar(10) DEFAULT NULL,
  `size` bigint(20) DEFAULT NULL,
  `original_file` varchar(255) DEFAULT NULL,
  `image_variants` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `media`
--

INSERT INTO `media` (`id`, `name`, `user_id`, `storage`, `type`, `extension`, `size`, `original_file`, `image_variants`, `created_at`, `updated_at`) VALUES
(1, 'Home-page-banner-image', 1, 'local', 'image', 'jpg', 251124, 'images/20231115214544_original__media_35.jpg', '{\"storage\":\"local\",\"original_image\":\"images\\/20231115214544_original__media_35.jpg\",\"image_40x40\":\"images\\/20231115214544image_40x40_media_157.jpg\",\"image_72x72\":\"images\\/20231115214544image_72x72_media_428.jpg\",\"image_190x230\":\"images\\/20231115214544image_190x230_media_471.jpg\",\"image_970x400\":\"images\\/20231115214553image_970x400-374.png\",\"image_940x110\":\"images\\/20231120191339image_940x110-214.png\",\"image_320x852\":\"images\\/20231120191339image_320x852-358.png\",\"image_320x520\":\"images\\/20231120191340image_320x520-142.png\",\"image_835x200\":\"images\\/20231212140019image_835x200-476.png\",\"image_405x745\":\"images\\/20231212120206image_405x745-117.png\"}', '2023-11-15 15:45:45', '2023-12-12 08:00:19'),
(2, 'baner1', 1, 'local', 'image', 'jpg', 49742, 'images/20231116123823_original__media_193.jpg', '{\"storage\":\"local\",\"original_image\":\"images\\/20231116123823_original__media_193.jpg\",\"image_40x40\":\"images\\/20231116123823image_40x40_media_414.jpg\",\"image_72x72\":\"images\\/20231116123823image_72x72_media_423.jpg\",\"image_190x230\":\"images\\/20231116123823image_190x230_media_31.jpg\",\"image_1260x452\":\"images\\/20231212120154image_1260x452-401.png\",\"image_620x320\":\"images\\/20231212120156image_620x320-8.png\",\"image_400x235\":\"images\\/20231212120156image_400x235-310.png\",\"image_300x170\":\"images\\/20231212120156image_300x170-198.png\",\"image_835x200\":\"images\\/20231129164223image_835x200-442.png\",\"image_405x745\":\"images\\/20231129171224image_405x745-72.png\"}', '2023-11-16 06:38:23', '2023-12-12 06:01:57'),
(3, 'banner4', 1, 'local', 'image', 'jpg', 516459, 'images/20231116123838_original__media_493.jpg', '{\"storage\":\"local\",\"original_image\":\"images\\/20231116123838_original__media_493.jpg\",\"image_40x40\":\"images\\/20231116123838image_40x40_media_71.jpg\",\"image_72x72\":\"images\\/20231116123838image_72x72_media_122.jpg\",\"image_190x230\":\"images\\/20231116123838image_190x230_media_312.jpg\",\"image_1260x452\":\"images\\/20231212120157image_1260x452-431.png\",\"image_620x320\":\"images\\/20231212120158image_620x320-157.png\",\"image_400x235\":\"images\\/20231212120158image_400x235-181.png\",\"image_300x170\":\"images\\/20231212120159image_300x170-304.png\"}', '2023-11-16 06:38:38', '2023-12-12 06:02:00'),
(4, '23', 1, 'local', 'image', 'jpeg', 144392, 'images/20231116153947_original__media_388.jpeg', '{\"storage\":\"local\",\"original_image\":\"images\\/20231116153947_original__media_388.jpeg\",\"image_40x40\":\"images\\/20231116153947image_40x40_media_452.jpeg\",\"image_72x72\":\"images\\/20231116153947image_72x72_media_114.jpeg\",\"image_190x230\":\"images\\/20231118125833image_190x230-428.png\"}', '2023-11-16 09:39:48', '2023-11-18 06:58:35'),
(5, '51', 1, 'local', 'image', 'jpeg', 35167, 'images/20231116154338_original__media_114.jpeg', '{\"storage\":\"local\",\"original_image\":\"images\\/20231116154338_original__media_114.jpeg\",\"image_40x40\":\"images\\/20231116154338image_40x40_media_477.jpeg\",\"image_72x72\":\"images\\/20231116154338image_72x72_media_499.jpeg\",\"image_190x230\":\"images\\/20231116154338image_190x230_media_477.jpeg\"}', '2023-11-16 09:43:39', '2023-11-16 09:43:39'),
(6, '44', 1, 'local', 'image', 'jpeg', 26925, 'images/20231116161134_original__media_302.jpeg', '{\"storage\":\"local\",\"original_image\":\"images\\/20231116161134_original__media_302.jpeg\",\"image_40x40\":\"images\\/20231116161134image_40x40_media_360.jpeg\",\"image_72x72\":\"images\\/20231116161134image_72x72_media_435.jpeg\",\"image_190x230\":\"images\\/20231116161134image_190x230_media_429.jpeg\",\"image_835x200\":\"images\\/20231129164031image_835x200-17.png\",\"image_140x190\":\"images\\/20231129164031image_140x190-4.png\",\"image_130x95\":\"images\\/20231129164031image_130x95-468.png\",\"image_80x60\":\"images\\/20231129164031image_80x60-441.png\"}', '2023-11-16 10:11:34', '2023-11-29 10:40:31'),
(7, 'banner4', 1, 'local', 'image', 'jpg', 516459, 'images/20231118125936_original__media_208.jpg', '{\"storage\":\"local\",\"original_image\":\"images\\/20231118125936_original__media_208.jpg\",\"image_40x40\":\"images\\/20231118125936image_40x40_media_44.jpg\",\"image_72x72\":\"images\\/20231118125936image_72x72_media_238.jpg\",\"image_190x230\":\"images\\/20231118125936image_190x230_media_95.jpg\",\"image_1260x452\":\"images\\/20231118135429image_1260x452-395.png\",\"image_620x320\":\"images\\/20231118135429image_620x320-137.png\",\"image_400x235\":\"images\\/20231118135430image_400x235-153.png\",\"image_300x170\":\"images\\/20231118135430image_300x170-9.png\",\"image_405x745\":\"images\\/20231129170701image_405x745-275.png\"}', '2023-11-18 06:59:37', '2023-11-29 11:07:01'),
(8, 'banner5', 1, 'local', 'image', 'jpg', 809824, 'images/20231118130006_original__media_62.jpg', '{\"storage\":\"local\",\"original_image\":\"images\\/20231118130006_original__media_62.jpg\",\"image_40x40\":\"images\\/20231118130006image_40x40_media_350.jpg\",\"image_72x72\":\"images\\/20231118130006image_72x72_media_125.jpg\",\"image_190x230\":\"images\\/20231118130006image_190x230_media_118.jpg\",\"image_1260x452\":\"images\\/20231212120200image_1260x452-71.png\",\"image_620x320\":\"images\\/20231212120201image_620x320-266.png\",\"image_400x235\":\"images\\/20231212120202image_400x235-356.png\",\"image_300x170\":\"images\\/20231212120204image_300x170-388.png\"}', '2023-11-18 07:00:07', '2023-12-12 06:02:04'),
(9, 'banner3', 1, 'local', 'image', 'jpg', 23722, 'images/20231118135553_original__media_61.jpg', '{\"storage\":\"local\",\"original_image\":\"images\\/20231118135553_original__media_61.jpg\",\"image_40x40\":\"images\\/20231118135553image_40x40_media_255.jpg\",\"image_72x72\":\"images\\/20231118135553image_72x72_media_464.jpg\",\"image_190x230\":\"images\\/20231118135553image_190x230_media_341.jpg\",\"image_1260x452\":\"images\\/20231212120204image_1260x452-346.png\",\"image_620x320\":\"images\\/20231212120205image_620x320-423.png\",\"image_400x235\":\"images\\/20231212120205image_400x235-412.png\",\"image_300x170\":\"images\\/20231212120206image_300x170-3.png\"}', '2023-11-18 07:55:53', '2023-12-12 06:02:06'),
(10, 'panjabi1', 1, 'local', 'image', 'webp', 6420, 'images/20231118140337_original__media_426.webp', '{\"storage\":\"local\",\"original_image\":\"images\\/20231118140337_original__media_426.webp\",\"image_40x40\":\"images\\/20231118140337image_40x40_media_329.webp\",\"image_72x72\":\"images\\/20231118140337image_72x72_media_468.webp\",\"image_190x230\":\"images\\/20231118140337image_190x230_media_259.webp\",\"image_140x190\":\"images\\/20231129164205image_140x190-122.png\",\"image_130x95\":\"images\\/20231129164205image_130x95-299.png\",\"image_80x60\":\"images\\/20231129164205image_80x60-142.png\",\"image_835x200\":\"images\\/20231129164205image_835x200-393.png\"}', '2023-11-18 08:03:37', '2023-11-29 10:42:05'),
(11, 'dress_shirt', 1, 'local', 'image', 'webp', 13338, 'images/20231118143203_original__media_384.webp', '{\"storage\":\"local\",\"original_image\":\"images\\/20231118143203_original__media_384.webp\",\"image_40x40\":\"images\\/20231118143203image_40x40_media_335.webp\",\"image_72x72\":\"images\\/20231118143203image_72x72_media_40.webp\",\"image_190x230\":\"images\\/20231118143203image_190x230_media_216.webp\",\"image_140x190\":\"images\\/20231212140032image_140x190-213.png\",\"image_130x95\":\"images\\/20231212140032image_130x95-496.png\",\"image_80x60\":\"images\\/20231212140032image_80x60-353.png\"}', '2023-11-18 08:32:04', '2023-12-12 08:00:32'),
(12, '14', 1, 'local', 'image', 'jpeg', 65086, 'images/20231118144010_original__media_183.jpeg', '{\"storage\":\"local\",\"original_image\":\"images\\/20231118144010_original__media_183.jpeg\",\"image_40x40\":\"images\\/20231118144010image_40x40_media_238.jpeg\",\"image_72x72\":\"images\\/20231118144010image_72x72_media_209.jpeg\",\"image_190x230\":\"images\\/20231118144010image_190x230_media_286.jpeg\",\"image_140x190\":\"images\\/20231129164222image_140x190-496.png\",\"image_130x95\":\"images\\/20231129164223image_130x95-385.png\",\"image_80x60\":\"images\\/20231129164223image_80x60-61.png\"}', '2023-11-18 08:40:11', '2023-11-29 10:42:23'),
(13, 'Magnetic Male', 1, 'local', 'image', 'jpeg', 127253, 'images/20231127122437_original__media_205.jpeg', '{\"storage\":\"local\",\"original_image\":\"images\\/20231127122437_original__media_205.jpeg\",\"image_40x40\":\"images\\/20231127122437image_40x40_media_312.jpeg\",\"image_72x72\":\"images\\/20231127122437image_72x72_media_434.jpeg\",\"image_190x230\":\"images\\/20231127151332image_190x230-137.png\",\"image_1200x630\":\"images\\/20231127151332image_1200x630-332.png\"}', '2023-11-27 06:24:37', '2023-11-27 09:13:32'),
(14, 'development shirt', 1, 'local', 'image', 'jpeg', 713825, 'images/20231127144155_original__media_58.jpeg', '{\"storage\":\"local\",\"original_image\":\"images\\/20231127144155_original__media_58.jpeg\",\"image_40x40\":\"images\\/20231127144155image_40x40_media_76.jpeg\",\"image_72x72\":\"images\\/20231127144155image_72x72_media_443.jpeg\",\"image_190x230\":\"images\\/20231127144554image_190x230-106.png\"}', '2023-11-27 08:41:56', '2023-11-27 08:45:55'),
(15, 'Magnetic Male2', 1, 'local', 'image', 'jpeg', 157985, 'images/20231127153039_original__media_416.jpeg', '{\"storage\":\"local\",\"original_image\":\"images\\/20231127153039_original__media_416.jpeg\",\"image_40x40\":\"images\\/20231127153039image_40x40_media_80.jpeg\",\"image_72x72\":\"images\\/20231127153039image_72x72_media_489.jpeg\",\"image_190x230\":\"images\\/20231127154953image_190x230-441.png\",\"image_1200x630\":\"images\\/20231127154954image_1200x630-402.png\",\"image_140x190\":\"images\\/20231212140138image_140x190-475.png\",\"image_130x95\":\"images\\/20231212140138image_130x95-180.png\",\"image_80x60\":\"images\\/20231212140138image_80x60-260.png\"}', '2023-11-27 09:30:39', '2023-12-12 08:01:39'),
(16, 'Magnetic Male3', 1, 'local', 'image', 'jpeg', 408252, 'images/20231127155346_original__media_348.jpeg', '{\"storage\":\"local\",\"original_image\":\"images\\/20231127155346_original__media_348.jpeg\",\"image_40x40\":\"images\\/20231127155346image_40x40_media_457.jpeg\",\"image_72x72\":\"images\\/20231127155346image_72x72_media_408.jpeg\",\"image_190x230\":\"images\\/20231127164013image_190x230-135.png\",\"image_1200x630\":\"images\\/20231127164013image_1200x630-436.png\"}', '2023-11-27 09:53:47', '2023-11-27 10:40:14'),
(17, 'Magnetic Male Purple', 1, 'local', 'image', 'jpeg', 309568, 'images/20231127165229_original__media_61.jpeg', '{\"storage\":\"local\",\"original_image\":\"images\\/20231127165229_original__media_61.jpeg\",\"image_40x40\":\"images\\/20231127165229image_40x40_media_274.jpeg\",\"image_72x72\":\"images\\/20231127165229image_72x72_media_83.jpeg\",\"image_190x230\":\"images\\/20231127165648image_190x230-420.png\"}', '2023-11-27 10:52:29', '2023-11-27 10:56:48'),
(18, 'Magnetic Male Blue NB', 1, 'local', 'image', 'jpeg', 247511, 'images/20231127170420_original__media_236.jpeg', '{\"storage\":\"local\",\"original_image\":\"images\\/20231127170420_original__media_236.jpeg\",\"image_40x40\":\"images\\/20231127170420image_40x40_media_291.jpeg\",\"image_72x72\":\"images\\/20231127170420image_72x72_media_169.jpeg\",\"image_190x230\":\"images\\/20231127170938image_190x230-69.png\",\"image_1200x630\":\"images\\/20231127170938image_1200x630-451.png\"}', '2023-11-27 11:04:20', '2023-11-27 11:09:39'),
(19, 'Magnetic Male Golden', 1, 'local', 'image', 'jpeg', 273530, 'images/20231127174708_original__media_212.jpeg', '{\"storage\":\"local\",\"original_image\":\"images\\/20231127174708_original__media_212.jpeg\",\"image_40x40\":\"images\\/20231127174708image_40x40_media_75.jpeg\",\"image_72x72\":\"images\\/20231127174708image_72x72_media_194.jpeg\",\"image_190x230\":\"images\\/20231127175136image_190x230-246.png\",\"image_1200x630\":\"images\\/20231127175136image_1200x630-459.png\"}', '2023-11-27 11:47:08', '2023-11-27 11:51:36'),
(20, 'Blue Martini Blue', 1, 'local', 'image', 'jpeg', 593248, 'images/20231129142715_original__media_336.jpeg', '{\"storage\":\"local\",\"original_image\":\"images\\/20231129142715_original__media_336.jpeg\",\"image_40x40\":\"images\\/20231129142715image_40x40_media_214.jpeg\",\"image_72x72\":\"images\\/20231129142715image_72x72_media_179.jpeg\",\"image_190x230\":\"images\\/20231129143146image_190x230-133.png\",\"image_140x190\":\"images\\/20231129142751image_140x190-296.png\",\"image_130x95\":\"images\\/20231129142752image_130x95-304.png\",\"image_80x60\":\"images\\/20231129142752image_80x60-52.png\"}', '2023-11-29 08:27:17', '2023-11-29 08:31:46'),
(21, 'GentlemansClub gray', 1, 'local', 'image', 'jpg', 401765, 'images/20231129143712_original__media_1.jpg', '{\"storage\":\"local\",\"original_image\":\"images\\/20231129143712_original__media_1.jpg\",\"image_40x40\":\"images\\/20231129143712image_40x40_media_87.jpg\",\"image_72x72\":\"images\\/20231129143712image_72x72_media_345.jpg\",\"image_190x230\":\"images\\/20231129144357image_190x230-324.png\"}', '2023-11-29 08:37:13', '2023-11-29 08:43:57'),
(22, 'megnificint male gray', 1, 'local', 'image', 'jpg', 480498, 'images/20231129152335_original__media_18.jpg', '{\"storage\":\"local\",\"original_image\":\"images\\/20231129152335_original__media_18.jpg\",\"image_40x40\":\"images\\/20231129152335image_40x40_media_484.jpg\",\"image_72x72\":\"images\\/20231129152335image_72x72_media_5.jpg\",\"image_190x230\":\"images\\/20231129152939image_190x230-461.png\",\"image_1200x630\":\"images\\/20231129152939image_1200x630-248.png\"}', '2023-11-29 09:23:36', '2023-11-29 09:29:40'),
(23, 'Blue Martini Blue LT', 1, 'local', 'image', 'jpeg', 480857, 'images/20231129153628_original__media_227.jpeg', '{\"storage\":\"local\",\"original_image\":\"images\\/20231129153628_original__media_227.jpeg\",\"image_40x40\":\"images\\/20231129153628image_40x40_media_477.jpeg\",\"image_72x72\":\"images\\/20231129153628image_72x72_media_248.jpeg\",\"image_190x230\":\"images\\/20231129153859image_190x230-408.png\",\"image_1200x630\":\"images\\/20231129153900image_1200x630-469.png\"}', '2023-11-29 09:36:29', '2023-11-29 09:39:00'),
(24, 'megnificint male Sky Blue ', 1, 'local', 'image', 'jpg', 330768, 'images/20231129155216_original__media_128.jpg', '{\"storage\":\"local\",\"original_image\":\"images\\/20231129155216_original__media_128.jpg\",\"image_40x40\":\"images\\/20231129155216image_40x40_media_38.jpg\",\"image_72x72\":\"images\\/20231129155216image_72x72_media_340.jpg\",\"image_190x230\":\"images\\/20231129155443image_190x230-388.png\",\"image_1200x630\":\"images\\/20231129155444image_1200x630-283.png\",\"image_140x190\":\"images\\/20231129164116image_140x190-260.png\",\"image_130x95\":\"images\\/20231129164116image_130x95-490.png\",\"image_80x60\":\"images\\/20231129164116image_80x60-394.png\"}', '2023-11-29 09:52:16', '2023-11-29 10:41:16'),
(25, 'GentlemansClub Navy w Sky Blue', 1, 'local', 'image', 'jpg', 400288, 'images/20231129160711_original__media_380.jpg', '{\"storage\":\"local\",\"original_image\":\"images\\/20231129160711_original__media_380.jpg\",\"image_40x40\":\"images\\/20231129160711image_40x40_media_253.jpg\",\"image_72x72\":\"images\\/20231129160711image_72x72_media_158.jpg\",\"image_190x230\":\"images\\/20231129161040image_190x230-318.png\",\"image_1200x630\":\"images\\/20231129161040image_1200x630-110.png\"}', '2023-11-29 10:07:12', '2023-11-29 10:10:41'),
(26, 'GentlemansClub11', 1, 'local', 'image', 'jpg', 665760, 'images/20231129163900_original__media_20.jpg', '{\"storage\":\"local\",\"original_image\":\"images\\/20231129163900_original__media_20.jpg\",\"image_40x40\":\"images\\/20231129163900image_40x40_media_263.jpg\",\"image_72x72\":\"images\\/20231129163900image_72x72_media_59.jpg\",\"image_190x230\":\"images\\/20231129163900image_190x230_media_120.jpg\",\"image_140x190\":\"images\\/20231212140017image_140x190-491.png\",\"image_130x95\":\"images\\/20231212140018image_130x95-322.png\",\"image_80x60\":\"images\\/20231212140018image_80x60-214.png\"}', '2023-11-29 10:39:01', '2023-12-12 08:00:19'),
(27, 'Grey HB', 1, 'local', 'image', 'jpeg', 456469, 'images/20231129164450_original__media_177.jpeg', '{\"storage\":\"local\",\"original_image\":\"images\\/20231129164450_original__media_177.jpeg\",\"image_40x40\":\"images\\/20231129164450image_40x40_media_112.jpeg\",\"image_72x72\":\"images\\/20231129164450image_72x72_media_322.jpeg\",\"image_190x230\":\"images\\/20231129164758image_190x230-309.png\",\"image_1200x630\":\"images\\/20231129164758image_1200x630-91.png\"}', '2023-11-29 10:44:51', '2023-11-29 10:47:59'),
(28, 'gry', 1, 'local', 'image', 'jpeg', 714698, 'images/20231129170021_original__media_436.jpeg', '{\"storage\":\"local\",\"original_image\":\"images\\/20231129170021_original__media_436.jpeg\",\"image_40x40\":\"images\\/20231129170021image_40x40_media_482.jpeg\",\"image_72x72\":\"images\\/20231129170021image_72x72_media_429.jpeg\",\"image_190x230\":\"images\\/20231129170607image_190x230-84.png\",\"image_1200x630\":\"images\\/20231129170608image_1200x630-203.png\"}', '2023-11-29 11:00:22', '2023-11-29 11:06:08'),
(29, 'Blue Martini Blue2', 1, 'local', 'image', 'jpeg', 427518, 'images/20231129171536_original__media_351.jpeg', '{\"storage\":\"local\",\"original_image\":\"images\\/20231129171536_original__media_351.jpeg\",\"image_40x40\":\"images\\/20231129171536image_40x40_media_479.jpeg\",\"image_72x72\":\"images\\/20231129171536image_72x72_media_354.jpeg\",\"image_190x230\":\"images\\/20231202120600image_190x230-430.png\",\"image_1200x630\":\"images\\/20231202120602image_1200x630-62.png\"}', '2023-11-29 11:15:36', '2023-12-02 06:06:03'),
(30, 'Newyear sale', 1, 'local', 'image', 'jpg', 184920, 'images/20231130112337_original__media_3.jpg', '{\"storage\":\"local\",\"original_image\":\"images\\/20231130112337_original__media_3.jpg\",\"image_40x40\":\"images\\/20231130112337image_40x40_media_429.jpg\",\"image_72x72\":\"images\\/20231130112337image_72x72_media_322.jpg\",\"image_190x230\":\"images\\/20231130112337image_190x230_media_194.jpg\",\"image_374x374\":\"images\\/20231130113226image_374x374-113.png\"}', '2023-11-30 05:23:38', '2023-11-30 05:32:26'),
(31, 'NEWYEARSLAE', 1, 'local', 'image', 'jpg', 2555524, 'images/20231130112427_original__media_131.jpg', '{\"storage\":\"local\",\"original_image\":\"images\\/20231130112427_original__media_131.jpg\",\"image_40x40\":\"images\\/20231130112427image_40x40_media_193.jpg\",\"image_72x72\":\"images\\/20231130112427image_72x72_media_113.jpg\",\"image_190x230\":\"images\\/20231130112427image_190x230_media_84.jpg\",\"image_1920x412\":\"images\\/20231130113226image_1920x412-89.png\",\"image_145x110\":\"images\\/20231219171409image_145x110-28.png\"}', '2023-11-30 05:24:31', '2023-12-19 11:14:11');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_03_18_124140_create_media_table', 1),
(2, '2014_04_02_193005_create_translations_table', 1),
(3, '2014_07_02_230147_migration_cartalyst_sentinel', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2021_09_08_034040_create_permissions_table', 1),
(6, '2021_09_12_044610_create_log_activities_table', 1),
(7, '2021_09_14_061644_create_languages_table', 1),
(8, '2021_09_14_061730_create_language_configs_table', 1),
(9, '2021_09_14_061736_create_flag_icons_table', 1),
(10, '2021_09_19_112851_create_settings_table', 1),
(11, '2021_10_18_110255_create_colors_table', 1),
(12, '2021_10_18_110619_create_brands_table', 1),
(13, '2021_10_18_121015_create_brand_languages_table', 1),
(14, '2021_10_20_105637_create_attributes_table', 1),
(15, '2021_10_20_170540_create_attribute_values_table', 1),
(16, '2021_10_21_171300_create_categories_table', 1),
(17, '2021_10_21_180000_create_category_languages_table', 1),
(18, '2021_10_21_180424_create_timezones_table', 1),
(19, '2021_10_25_105129_create_attribute_languages_table', 1),
(20, '2021_10_26_161907_create_color_languages_table', 1),
(21, '2021_10_30_103858_create_currencies_table', 1),
(22, '2021_10_30_114151_create_vat_taxes_table', 1),
(23, '2021_11_02_111015_create_seller_payouts_table', 1),
(24, '2021_11_02_151147_create_addresses_table', 1),
(25, '2021_11_04_111442_create_blog_categories_table', 1),
(26, '2021_11_04_111545_create_blogs_table', 1),
(27, '2021_11_04_111640_create_blog_languages_table', 1),
(28, '2021_11_04_111948_create_blog_category_languages_table', 1),
(29, '2021_11_04_152039_create_theme_options_table', 1),
(30, '2021_11_07_143523_create_sms_templates_table', 1),
(31, '2021_11_11_111455_create_sellers_table', 1),
(32, '2021_11_11_164432_create_products_table', 1),
(33, '2021_11_13_095212_create_product_languages_table', 1),
(34, '2021_11_13_095445_create_subscribers_table', 1),
(35, '2021_11_13_104618_create_product_stocks_table', 1),
(36, '2021_11_13_105547_create_coupons_table', 1),
(37, '2021_11_13_105550_create_coupon_languages_table', 1),
(38, '2021_11_13_115042_create_campaigns_table', 1),
(39, '2021_11_13_140800_create_campaign_languages_table', 1),
(40, '2021_11_14_152101_create_countries_table', 1),
(41, '2021_11_14_153250_create_cities_table', 1),
(42, '2021_11_14_154057_create_states_table', 1),
(43, '2021_11_14_154422_create_campaign_products_table', 1),
(44, '2021_11_16_145454_create_supports_table', 1),
(45, '2021_11_17_150959_create_support_departments_table', 1),
(46, '2021_11_17_154846_create_support_department_languages_table', 1),
(47, '2021_11_17_175113_create_product_vat_taxes_table', 1),
(48, '2021_11_20_121639_create_ticket_replays_table', 1),
(49, '2021_11_22_105028_create_campaign_requests_table', 1),
(50, '2021_11_22_164016_create_orders_table', 1),
(51, '2021_11_22_164053_create_order_details_table', 1),
(52, '2021_11_22_172210_create_pickup_hubs_table', 1),
(53, '2021_11_23_102936_create_pickup_hub_languages_table', 1),
(54, '2021_12_04_171817_create_commission_histories_table', 1),
(55, '2021_12_05_143946_create_wallets_table', 1),
(56, '2021_12_05_144327_create_wishlists_table', 1),
(57, '2021_12_05_152850_create_searches_table', 1),
(58, '2021_12_05_153311_create_app_intros_table', 1),
(59, '2021_12_05_153705_create_app_intro_languages_table', 1),
(60, '2021_12_08_124902_create_addons_table', 1),
(61, '2021_12_09_115403_create_rewards_table', 1),
(62, '2021_12_09_162836_create_wholesale_prices_table', 1),
(63, '2021_12_11_151457_create_reward_details_table', 1),
(64, '2021_12_12_142536_create_delivery_heroes_table', 1),
(65, '2021_12_12_150510_create_refunds_table', 1),
(66, '2021_12_14_113757_create_delivery_histories_table', 1),
(67, '2021_12_21_123917_create_carts_table', 1),
(68, '2021_12_26_154846_create_pages_table', 1),
(69, '2021_12_26_155025_create_page_languages_table', 1),
(70, '2022_01_01_160619_create_accounts_table', 1),
(71, '2022_01_03_110926_create_sliders_table', 1),
(72, '2022_01_03_113525_create_slider_languages_table', 1),
(73, '2022_01_04_113343_create_services_table', 1),
(74, '2022_01_04_113557_create_service_languages_table', 1),
(75, '2022_01_05_164528_create_product_views_table', 1),
(76, '2022_01_06_164906_create_reviews_table', 1),
(77, '2022_01_06_164949_create_review_likes_table', 1),
(78, '2022_01_06_165257_create_review_replies_table', 1),
(79, '2022_01_08_142918_create_blog_views_table', 1),
(80, '2022_01_08_144449_create_blog_comments_table', 1),
(81, '2022_01_08_151908_create_blog_comment_replies_table', 1),
(82, '2022_01_08_165746_create_blog_comment_likes_table', 1),
(83, '2022_01_11_111726_create_contact_us_table', 1),
(84, '2022_01_13_092927_create_user_socials_table', 1),
(85, '2022_01_15_151601_create_offline_methods_table', 1),
(86, '2022_01_15_151739_create_offline_method_languages_table', 1),
(87, '2022_02_05_094646_create_compare_products_table', 1),
(88, '2022_02_12_152514_create_checkouts_table', 1),
(89, '2022_02_19_170831_create_delivery_hero_accounts_table', 1),
(90, '2022_03_14_162023_create_notifications_table', 1),
(91, '2022_03_16_092829_create_seller_users_table', 1),
(92, '2022_03_17_111811_create_payment_histories_table', 1),
(93, '2022_03_18_173640_create_registration_requests_table', 1),
(94, '2022_04_10_110937_add_index_keys_to_tables', 1),
(95, '2022_04_10_150617_add_for_mobile_column_to_sliders', 1),
(96, '2022_04_12_110752_add_column_to_sellers_table', 1),
(97, '2022_04_18_130405_add_created_by_to_orders', 2),
(98, '2022_04_18_130405_add_created_by_to_new', 3),
(99, '2022_05_12_175148_add_update_112', 4),
(100, '2022_06_01_164230_add_updates_123', 5),
(101, '2022_06_06_125104_add_updates_130', 6),
(102, '2022_05_26_105454_video_shoppings', 7),
(103, '2022_06_06_125104_add_updates_131', 7),
(104, '2022_06_06_125104_add_updates_132', 8),
(105, '2022_07_21_164119_add_update_133', 8),
(106, '2022_07_21_164119_add_update_141', 9),
(107, '2022_08_20_111417_create_password_requests_table', 10),
(108, '2022_08_27_125533_add_update_to_150_table', 10),
(109, '2022_09_10_125533_add_update_to_151_table', 11),
(110, '2022_09_10_125533_add_update_to_152_table', 12),
(111, '2022_10_17_125533_add_update_to_153_table', 13),
(112, '2022_10_17_125533_add_update_to_154_table', 14),
(113, '2022_10_17_125533_add_update_to_155_table', 14),
(114, '2022_10_31_111525_create_fonts_table', 14),
(115, '2020_05_15_222804_create_visitors_table', 15),
(116, '2020_05_17_175544_create_visitor_requests_table', 15),
(117, '2022_10_17_125533_add_update_to_160_table', 15),
(118, '2023_01_12_125533_add_update_to_161_table', 15),
(119, '2023_01_26_150145_add_update_to_162', 16),
(120, '2022_09_11_112744_create_seller_subscriptions_table', 17),
(121, '2022_09_11_115639_create_seller_packages_table', 17),
(122, '2022_09_11_125004_create_seller_package_languages_table', 17),
(123, '2022_12_14_084124_create_affiliates_table', 17),
(124, '2022_12_24_154613_create_chat_rooms_table', 17),
(125, '2022_12_24_154806_create_messages_table', 17),
(126, '2022_12_28_071518_create_affiliate_states_table', 17),
(127, '2022_12_29_085619_create_affiliate_options_table', 17),
(128, '2023_02_07_100616_add_ai_review_columns_to_sellers', 17),
(129, '2023_03_06_145704_create_topups_table', 17),
(130, '2023_03_08_213703_create_plugins_table', 17),
(131, '2023_03_15_101852_create_reload_options_table', 17);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `title` varchar(191) NOT NULL,
  `details` varchar(191) DEFAULT NULL,
  `url` varchar(191) DEFAULT NULL,
  `status` varchar(191) NOT NULL DEFAULT 'unseen' COMMENT 'seen/unseen',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `user_id`, `title`, `details`, `url`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'New order is created.', 'See it in Details', 'orders/view/1', 'unseen', '2023-12-11 08:51:19', '2023-12-11 08:51:19'),
(3, 1, 'New order is created.', 'See it in Details', 'orders/view/3', 'unseen', '2023-12-18 09:19:13', '2023-12-18 09:19:13'),
(4, 2, 'Your order (YR-2751175967) status is updated', 'Your order (YR-2751175967) status is updated is on_the_way now.', 'get-invoice/YR-2751175967', 'unseen', '2023-12-18 09:23:31', '2023-12-18 09:23:31'),
(5, 1, 'New order is created.', 'See it in Details', 'orders/view/4', 'unseen', '2023-12-18 14:28:39', '2023-12-18 14:28:39');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `seller_id` bigint(20) UNSIGNED DEFAULT NULL COMMENT 'seller user id',
  `user_id` bigint(20) UNSIGNED DEFAULT NULL COMMENT 'customer',
  `delivery_hero_id` bigint(20) UNSIGNED DEFAULT NULL COMMENT 'from delivery hero table',
  `billing_address` longtext DEFAULT NULL,
  `shipping_address` longtext DEFAULT NULL,
  `delivery_status` varchar(191) NOT NULL DEFAULT 'pending',
  `payment_type` varchar(191) DEFAULT NULL,
  `payment_status` varchar(191) NOT NULL DEFAULT 'unpaid',
  `payment_details` longtext DEFAULT NULL,
  `sub_total` double DEFAULT NULL,
  `discount` double DEFAULT NULL,
  `coupon_discount` double DEFAULT NULL,
  `total_tax` double DEFAULT NULL,
  `total_amount` double DEFAULT NULL,
  `shipping_cost` double DEFAULT NULL,
  `total_payable` double DEFAULT NULL,
  `code` varchar(191) DEFAULT NULL,
  `date` timestamp NULL DEFAULT NULL,
  `viewed` tinyint(4) NOT NULL DEFAULT 0,
  `delivery_viewed` tinyint(4) NOT NULL DEFAULT 0,
  `payment_status_viewed` tinyint(4) NOT NULL DEFAULT 0,
  `commission_calculated` tinyint(4) NOT NULL DEFAULT 0,
  `is_cancelled` varchar(191) DEFAULT '0',
  `is_deleted` varchar(191) DEFAULT '0',
  `trx_id` varchar(191) NOT NULL,
  `is_mailed` tinyint(1) NOT NULL DEFAULT 0,
  `offline_method_id` varchar(191) DEFAULT NULL,
  `offline_method_file` varchar(191) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `pickup_hub_id` bigint(20) UNSIGNED DEFAULT NULL,
  `cancel_request` tinyint(4) NOT NULL DEFAULT 0,
  `cancel_request_at` timestamp NULL DEFAULT NULL,
  `delivery_hero_assign_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `is_draft` tinyint(1) NOT NULL DEFAULT 0,
  `shipping_method` varchar(191) DEFAULT NULL,
  `is_coupon_system_active` tinyint(1) DEFAULT NULL,
  `tax_method` varchar(191) NOT NULL DEFAULT '{"vat_tax_type" : "","tax_type" : "" }',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `variation` varchar(191) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `tax` double DEFAULT NULL,
  `discount` double DEFAULT NULL,
  `coupon_discount` varchar(191) DEFAULT NULL COMMENT 'will be json data {"coupon_code" : "BLACK5", "discount" : 5}',
  `shipping_cost` varchar(191) DEFAULT NULL COMMENT 'will be json data {"type" : "flat","depend_on_quantity" : true, "per_cost" : 10}',
  `quantity` int(11) NOT NULL DEFAULT 1,
  `pickup_hub_id` bigint(20) DEFAULT NULL,
  `product_referral_code` varchar(191) DEFAULT NULL,
  `is_refundable` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1 => can be refunded',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `variation`, `price`, `tax`, `discount`, `coupon_discount`, `shipping_cost`, `quantity`, `pickup_hub_id`, `product_referral_code`, `is_refundable`, `created_at`, `updated_at`) VALUES
(1, 1, 17, 'Blue-M', 45.454545454545, 0, 0, '{\"code\":\"\",\"discount\":0}', '{\"type\":\"\",\"depend_on_quantity\":0,\"per_cost\":0,\"total_cost\":0}', 1, NULL, NULL, 0, '2023-12-11 08:51:08', '2023-12-11 08:51:08'),
(3, 3, 14, '', 45.454545454545, 0, 0, '{\"code\":\"\",\"discount\":0}', '{\"type\":\"\",\"depend_on_quantity\":0,\"per_cost\":0,\"total_cost\":0}', 1, NULL, NULL, 0, '2023-12-18 09:19:07', '2023-12-18 09:19:07'),
(4, 4, 10, 'Grey (Denim)-XL', 50, 0, 0, '{\"code\":\"\",\"discount\":0}', '{\"type\":\"\",\"depend_on_quantity\":0,\"per_cost\":0,\"total_cost\":0}', 1, NULL, NULL, 0, '2023-12-18 14:27:09', '2023-12-18 14:27:09');

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(191) NOT NULL,
  `link` text DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `content` longtext DEFAULT NULL,
  `email` varchar(191) DEFAULT NULL,
  `optional_email` varchar(191) DEFAULT NULL,
  `phone` varchar(191) DEFAULT NULL,
  `optional_phone` varchar(191) DEFAULT NULL,
  `meta_image` text DEFAULT NULL,
  `meta_image_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `type`, `link`, `status`, `content`, `email`, `optional_email`, `phone`, `optional_phone`, `meta_image`, `meta_image_id`, `created_at`, `updated_at`) VALUES
(1, 'seller_policy_pages', 'seller-policy', 1, NULL, NULL, NULL, NULL, NULL, '[]', NULL, '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(2, 'refund_policy_page', 'refund-policy', 1, NULL, NULL, NULL, NULL, NULL, '[]', NULL, '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(3, 'support_policy_page', 'support-policy', 1, NULL, NULL, NULL, NULL, NULL, '[]', NULL, '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(4, 'term_conditions_page', 'terms-conditions', 1, NULL, NULL, NULL, NULL, NULL, '[]', NULL, '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(5, 'privacy_policy_page', 'privacy-policy', 1, NULL, NULL, NULL, NULL, NULL, '[]', NULL, '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(6, 'about_us_page', 'about', 1, NULL, NULL, NULL, NULL, NULL, '[]', NULL, '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(7, 'contact_us_page', 'contact', 1, NULL, NULL, NULL, NULL, NULL, '[]', NULL, '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(9, 'custom_page', 'showroom', 1, NULL, NULL, NULL, NULL, NULL, '[]', NULL, '2023-11-19 07:08:17', '2023-11-19 07:08:17'),
(10, 'custom_page', 'bespoke', 1, NULL, NULL, NULL, NULL, NULL, '[]', NULL, '2023-11-19 07:38:38', '2023-11-19 07:38:38');

-- --------------------------------------------------------

--
-- Table structure for table `page_languages`
--

CREATE TABLE `page_languages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `page_id` bigint(20) UNSIGNED NOT NULL,
  `lang` varchar(10) NOT NULL DEFAULT 'en' COMMENT 'our default locale for system en',
  `title` varchar(191) DEFAULT NULL,
  `address` varchar(191) DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `meta_title` varchar(191) DEFAULT NULL,
  `meta_description` mediumtext DEFAULT NULL,
  `keywords` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `page_languages`
--

INSERT INTO `page_languages` (`id`, `page_id`, `lang`, `title`, `address`, `content`, `meta_title`, `meta_description`, `keywords`, `created_at`, `updated_at`) VALUES
(1, 1, 'en', 'Seller Policy', NULL, NULL, NULL, NULL, NULL, '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(2, 2, 'en', 'Refund Policy', NULL, NULL, NULL, NULL, NULL, '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(3, 3, 'en', 'Support Policy', NULL, NULL, NULL, NULL, NULL, '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(4, 4, 'en', 'Term and Conditions', NULL, NULL, NULL, NULL, NULL, '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(5, 5, 'en', 'Privacy Policy', NULL, NULL, NULL, NULL, NULL, '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(6, 6, 'en', 'About Us', NULL, NULL, NULL, NULL, NULL, '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(7, 7, 'en', 'Contact Us', NULL, NULL, NULL, NULL, NULL, '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(9, 9, 'en', 'Showroom', NULL, '', '', '', '', '2023-11-19 07:08:17', '2023-11-19 07:08:17'),
(10, 10, 'en', 'Bespoke Shirt', NULL, '', '', '', '', '2023-11-19 07:38:38', '2023-11-19 07:38:38');

-- --------------------------------------------------------

--
-- Table structure for table `password_requests`
--

CREATE TABLE `password_requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `otp` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_histories`
--

CREATE TABLE `payment_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `event` varchar(191) NOT NULL,
  `remarks` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_histories`
--

INSERT INTO `payment_histories` (`id`, `order_id`, `user_id`, `event`, `remarks`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'order_payment_unpaid_event', 'With_cash_on_delivery', '2023-12-11 08:51:19', '2023-12-11 08:51:19'),
(2, 3, 2, 'order_payment_unpaid_event', 'With_cash_on_delivery', '2023-12-18 09:19:13', '2023-12-18 09:19:13'),
(3, 3, 1, 'order_payment_paid_event', 'With cash', '2023-12-18 09:23:22', '2023-12-18 09:23:22'),
(4, 4, 2, 'order_payment_unpaid_event', 'With_cash_on_delivery', '2023-12-18 14:28:39', '2023-12-18 14:28:39'),
(5, 4, 1, 'order_payment_paid_event', 'With cash', '2023-12-19 09:36:06', '2023-12-19 09:36:06');

-- --------------------------------------------------------

--
-- Table structure for table `payment_method`
--

CREATE TABLE `payment_method` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `trx_id` varchar(191) NOT NULL,
  `code` varchar(191) DEFAULT NULL,
  `api_token` text DEFAULT NULL,
  `is_guest` tinyint(4) NOT NULL DEFAULT 0,
  `amount` double NOT NULL DEFAULT 0,
  `type` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `attribute` varchar(191) NOT NULL,
  `keywords` mediumtext NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `attribute`, `keywords`, `created_at`, `updated_at`) VALUES
(1, 'order', '{\"read\":\"order_read\",\"create\":\"order_create\",\"update\":\"order_update\",\"view\":\"order_view\",\"invoice\":\"order_invoice\",\"approve_offline_payment\":\"order_approve_offline_payment\"}', '2022-04-08 08:05:01', '2022-04-08 08:05:01'),
(2, 'pickup_hub', '{\"read\":\"pickup_hub_read\",\"create\":\"pickup_hub_create\",\"update\":\"pickup_hub_update\",\"delete\":\"pickup_hub_delete\"}', '2022-04-08 08:05:01', '2022-04-08 08:05:01'),
(3, 'product', '{\"read\":\"product_read\",\"create\":\"product_create\",\"update\":\"product_update\",\"delete\":\"product_delete\",\"restore\":\"product_restore\",\"clone\":\"product_clone\"}', '2022-04-08 08:05:01', '2022-04-08 08:05:01'),
(4, 'color', '{\"read\":\"color_read\",\"create\":\"color_create\",\"update\":\"color_update\",\"delete\":\"color_delete\"}', '2022-04-08 08:05:01', '2022-04-08 08:05:01'),
(5, 'attribute_set', '{\"read\":\"attribute_set_read\",\"create\":\"attribute_set_create\",\"update\":\"attribute_set_update\",\"delete\":\"attribute_set_delete\"}', '2022-04-08 08:05:01', '2022-04-08 08:05:01'),
(6, 'attribute_value', '{\"read\":\"attribute_value_read\",\"create\":\"attribute_value_create\",\"update\":\"attribute_value_update\",\"delete\":\"attribute_value_delete\"}', '2022-04-08 08:05:01', '2022-04-08 08:05:01'),
(7, 'brand', '{\"read\":\"brand_read\",\"create\":\"brand_create\",\"update\":\"brand_update\",\"delete\":\"brand_delete\"}', '2022-04-08 08:05:01', '2022-04-08 08:05:01'),
(8, 'category', '{\"read\":\"category_read\",\"create\":\"category_create\",\"update\":\"category_update\",\"delete\":\"category_delete\"}', '2022-04-08 08:05:01', '2022-04-08 08:05:01'),
(9, 'wholesale_product', '{\"read\":\"wholesale_product_read\",\"create\":\"wholesale_product_create\",\"update\":\"wholesale_product_update\",\"delete\":\"wholesale_product_delete\",\"clone\":\"wholesale_product_clone\",\"restore\":\"wholesale_product_restore\",\"setting\":\"wholesale_product_setting\"}', '2022-04-08 08:05:01', '2022-04-08 08:05:01'),
(10, 'customer', '{\"read\":\"customer_read\",\"create\":\"customer_create\",\"update\":\"customer_update\",\"ban\":\"customer_ban\",\"user_reward_read\":\"user_reward_read\",\"user_reward_update\":\"user_reward_update\"}', '2022-04-08 08:05:01', '2022-04-08 08:05:01'),
(11, 'seller', '{\"read\":\"seller_read\",\"create\":\"seller_create\",\"update\":\"seller_update\",\"verify\":\"seller_verify\",\"ban\":\"seller_ban\",\"seller_commission_read\":\"seller_commission_read\",\"seller_commission_update\":\"seller_commission_update\",\"seller_payout_read\":\"seller_payout_read\",\"seller_payout_reject\":\"seller_payout_reject\",\"seller_payout_accept\":\"seller_payout_accept\",\"login\":\"seller_as_login\"}', '2022-04-08 08:05:01', '2022-12-21 05:37:18'),
(12, 'delivery_hero', '{\"read\":\"delivery_hero_read\",\"create\":\"delivery_hero_create\",\"update\":\"delivery_hero_update\",\"Ban Delivery Hero\":\"delivery_hero_ban\",\"Account Deposit\":\"Delivery_hero_account_deposit\",\"Email Activation\":\"delivery_hero_email_activation\",\"Commission History\":\"delivery_hero_commission_history\",\"Deposit History\":\"delivery_hero_deposit_history\",\"Collection History\":\"delivery_hero_collection_history\",\"Cancel Request\":\"delivery_hero_cancel_request\",\"Configuration Read\":\"delivery_hero_configuration_read\",\"Configuration Update\":\"delivery_hero_configuration_update\"}', '2022-04-08 08:05:01', '2022-04-08 08:05:01'),
(13, 'media', '{\"read\":\"media_read\",\"create\":\"media_create\",\"update\":\"media_update\",\"delete\":\"media_delete\"}', '2022-04-08 08:05:01', '2022-04-08 08:05:01'),
(14, 'report', '{\"admin_product_sale\":\"admin_product_sale_read\",\"seller_product_sale\":\"seller_product_sale_read\",\"product_stock\":\"product_stock_read\",\"product_wishlist\":\"product_wishlist_read\",\"user_searches\":\"user_searches_read\",\"commission_history\":\"commission_history_read\",\"wallet_recharge_history\":\"wallet_recharge_history_read\"}', '2022-04-08 08:05:01', '2022-04-08 08:05:01'),
(15, 'refund', '{\"read\":\"refund_read\",\"approve\":\"refund_approve\",\"process\":\"refund_process\",\"reject\":\"refund_reject\",\"refund_setting_read\":\"refund_setting_read\",\"refund_setting_update\":\"refund_setting_update\"}', '2022-04-08 08:05:01', '2022-04-08 08:05:01'),
(16, 'bulk_sms', '{\"read\":\"bulk_sms_read\",\"send_sms\":\"send_bulk_sms\",\"otp_setting_read\":\"otp_setting_read\",\"otp_setting_update\":\"otp_setting_update\",\"sms_template_read\":\"sms_template_read\",\"sms_template_update\":\"sms_template_update\"}', '2022-04-08 08:05:01', '2022-04-08 08:05:01'),
(17, 'campaign', '{\"read\":\"campaign_read\",\"create\":\"campaign_create\",\"update\":\"campaign_update\",\"delete\":\"campaign_delete\",\"campaign_request_read\":\"campaign_request_read\",\"campaign_request_approved\":\"campaign_request_approved\"}', '2022-04-08 08:05:01', '2022-04-08 08:05:01'),
(18, 'campaign_product', '{\"read\":\"campaign_product_read\",\"create\":\"campaign_product_create\",\"update\":\"campaign_product_update\",\"delete\":\"campaign_product_delete\"}', '2022-04-08 08:05:01', '2022-04-08 08:05:01'),
(19, 'subscriber', '{\"read\":\"subscriber_read\",\"delete\":\"subscriber_delete\"}', '2022-04-08 08:05:01', '2022-04-08 08:05:01'),
(20, 'coupon', '{\"read\":\"coupon_read\",\"create\":\"coupon_create\",\"update\":\"coupon_update\",\"delete\":\"coupon_delete\"}', '2022-04-08 08:05:01', '2022-04-08 08:05:01'),
(21, 'blog', '{\"read\":\"blog_read\",\"create\":\"blog_create\",\"update\":\"blog_update\",\"delete\":\"blog_delete\",\"restore\":\"blog_restore\"}', '2022-04-08 08:05:01', '2022-04-08 08:05:01'),
(22, 'blog_category', '{\"read\":\"blog_category_read\",\"create\":\"blog_category_create\",\"update\":\"blog_category_update\",\"delete\":\"blog_category_delete\"}', '2022-04-08 08:05:01', '2022-04-08 08:05:01'),
(23, 'support', '{\"read\":\"support_read\",\"create\":\"support_create\",\"update\":\"support_update\",\"delete\":\"support_delete\"}', '2022-04-08 08:05:01', '2022-04-08 08:05:01'),
(24, 'support_department', '{\"read\":\"support_department_read\",\"create\":\"support_department_create\",\"update\":\"support_department_update\",\"delete\":\"support_department_delete\"}', '2022-04-08 08:05:01', '2022-04-08 08:05:01'),
(25, 'offline_payment', '{\"read\":\"offline_payment_read\",\"create\":\"offline_payment_create\",\"update\":\"offline_payment_update\",\"delete\":\"offline_payment_delete\",\"wallet_recharge_read\":\"wallet_recharge_read\",\"wallet_recharge_update\":\"wallet_recharge_update\"}', '2022-04-08 08:05:01', '2022-04-08 08:05:01'),
(26, 'reward_configuration', '{\"read\":\"reward_configuration_read\",\"update\":\"reward_configuration_update\",\"reward_setting_read\":\"reward_setting_read\",\"reward_setting_create\":\"reward_setting_create\",\"reward_setting_update\":\"reward_setting_update\"}', '2022-04-08 08:05:01', '2022-04-08 08:05:01'),
(27, 'payment_gateway', '{\"read\":\"payment_gateway_read\",\"update\":\"payment_gateway_update\"}', '2022-04-08 08:05:01', '2022-04-08 08:05:01'),
(28, 'shipping_configuration', '{\"read\":\"shipping_configuration_read\",\"update\":\"shipping_configuration_update\"}', '2022-04-08 08:05:01', '2022-04-08 08:05:01'),
(29, 'shipping_country', '{\"read\":\"country_read\",\"update\":\"country_update\"}', '2022-04-08 08:05:01', '2022-04-08 08:05:01'),
(30, 'shipping_state', '{\"read\":\"state_read\",\"create\":\"state_create\",\"update\":\"state_update\",\"delete\":\"state_delete\"}', '2022-04-08 08:05:01', '2022-04-08 08:05:01'),
(31, 'shipping_city', '{\"read\":\"city_read\",\"create\":\"city_create\",\"update\":\"city_update\",\"delete\":\"city_delete\"}', '2022-04-08 08:05:01', '2022-04-08 08:05:01'),
(32, 'store_front', '{\"theme_option\":\"theme_option_update\",\"header_content\":\"header_content_update\",\"footer_content\":\"footer_content_update\",\"home_page\":\"home_page_update\",\"website_seo\":\"website_seo_update\",\"website_popup\":\"website_popup_update\",\"custom_css\":\"custom_css_update\",\"custom_js\":\"custom_js_update\",\"gdpr\":\"gdpr_update\",\"all_page_read\":\"page_read\",\"all_page_create\":\"page_create\",\"all_page_update\":\"page_update\",\"all_page_delete\":\"page_delete\"}', '2022-04-08 08:05:01', '2022-04-08 08:05:01'),
(33, 'service', '{\"read\":\"service_read\",\"create\":\"service_create\",\"update\":\"service_update\",\"delete\":\"service_delete\"}', '2022-04-08 08:05:01', '2022-04-08 08:05:01'),
(34, 'slider', '{\"read\":\"slider_read\",\"create\":\"slider_create\",\"update\":\"slider_update\",\"delete\":\"slider_delete\"}', '2022-04-08 08:05:01', '2022-04-08 08:05:01'),
(35, 'wallet', '{\"Read\":\"recharge_request_read\",\"Status Update\":\"recharge_request_status_update\"}', '2022-04-08 08:05:01', '2022-04-08 08:05:01'),
(36, 'setting', '{\"general_setting\":\"general_setting_update\",\"preference\":\"preference_setting_update\",\"Social Login\":\"social_login_setting_update\",\"email_setting\":\"email_setting_update\",\"currency\":\"currency_setting_update\",\"vat_tax\":\"vat_tax_setting_update\",\"storage\":\"storage_setting_update\",\"cache\":\"cache_update\",\"miscellaneous\":\"miscellaneous_setting_update\",\"Admin Panel Setting Update\":\"admin_panel_setting_update\",\"Facebook Service\":\"facebook_service_update\",\"Google Service\":\"google_service_update\",\"Pusher Notification\":\"pusher_notification_update\"}', '2022-04-08 08:05:01', '2022-04-08 08:05:01'),
(37, 'chat_messenger', '{\"read\":\"chat_messenger_read\",\"update\":\"chat_messenger_update\"}', '2022-04-08 08:05:01', '2022-04-08 08:05:01'),
(38, 'language', '{\"read\":\"language_read\",\"create\":\"language_create\",\"update\":\"language_update\",\"delete\":\"language_delete\"}', '2022-04-08 08:05:01', '2022-04-08 08:05:01'),
(39, 'staff', '{\"read\":\"staff_read\",\"create\":\"staff_create\",\"update\":\"staff_update\",\"ban\":\"staff_ban\"}', '2022-04-08 08:05:01', '2022-04-08 08:05:01'),
(40, 'role', '{\"read\":\"role_read\",\"create\":\"role_create\",\"update\":\"role_update\",\"delete\":\"role_delete\"}', '2022-04-08 08:05:01', '2022-04-08 08:05:01'),
(41, 'mobile_apps', '{\"setting_update\":\"api_setting_update\",\"android_setting\":\"android_setting_update\",\"ios_setting\":\"ios_setting_update\",\"app_config\":\"app_config_update\",\"ads_config\":\"ads_config_update\",\"download_link\":\"download_link_update\"}', '2022-04-08 08:05:01', '2022-04-08 08:05:01'),
(42, 'mobile_app_intro', '{\"read\":\"mobile_app_intro_read\",\"create\":\"mobile_app_intro_create\",\"update\":\"mobile_app_intro_update\",\"delete\":\"mobile_app_intro_delete\"}', '2022-04-08 08:05:01', '2022-04-08 08:05:01'),
(43, 'pos_system', '{\"read\":\"pos_order\",\"update\":\"pos_config_update\"}', '2022-07-21 11:21:27', '2022-07-21 11:21:27'),
(44, 'api_key', '{\"create\":\"api_key_create\",\"read\":\"api_key_read\",\"update\":\"api_key_update\",\"delete\":\"api_key_delete\",\"read_all\":\"api_key_read_all\"}', '2022-07-21 11:21:27', '2022-07-21 11:21:27'),
(45, 'state_import', '{\"create\":\"state_import_create\"}', '2022-08-08 11:13:07', '2022-08-08 11:13:07'),
(46, 'city_import', '{\"create\":\"city_import_create\"}', '2022-08-08 11:13:07', '2022-08-08 11:13:07'),
(47, 'firebase', '{\"read\":\"firebase_read\"}', '2022-09-06 10:09:22', '2022-09-06 10:09:22'),
(48, 'firebase', '{\"update\":\"firebase_update\"}', '2022-09-06 10:09:22', '2022-09-06 10:09:22'),
(49, 'addon', '{\"read\":\"addon_read\",\"update\":\"addon_update\"}', '2022-10-11 09:08:35', '2022-10-11 09:08:35'),
(50, 'font', '{\"update\":\"font_update\"}', '2022-12-21 05:37:18', '2022-12-21 05:37:18'),
(51, 'package', '{\"read\":\"package_read\",\"create\":\"package_create\",\"update\":\"package_update\",\"destroy\":\"package_destroy\",\"status\":\"package_status_change\",\"settings\":\"subscription_setting_read\",\"online_payment\":\"online_payment_read\",\"offline_payment\":\"offline_payment_read\"}', '2023-01-29 09:38:22', '2023-01-29 09:38:22');

-- --------------------------------------------------------

--
-- Table structure for table `persistences`
--

CREATE TABLE `persistences` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `persistences`
--

INSERT INTO `persistences` (`id`, `user_id`, `code`, `created_at`, `updated_at`) VALUES
(1, 1, 'XcOAPV7MZHgWoaz3UsLUfiEAYYRCUKbz', '2022-04-21 13:01:43', '2022-04-21 13:01:43'),
(2, 1, '9OORWEt1f0aaHVfCSXIdmLqGKp4noHbS', '2022-05-23 12:24:38', '2022-05-23 12:24:38'),
(3, 1, 'bf9tjRp4K87ejsjcv857yx9wLCl2Q99A', '2022-05-26 11:54:02', '2022-05-26 11:54:02'),
(4, 1, 'X7kR3pSds8FIfnctoNm4WJ88rv3LPTL8', '2022-06-02 09:02:43', '2022-06-02 09:02:43'),
(5, 1, 'X5sk2lIfUwUA6z2BydgT37UJYUNdE7M2', '2022-06-22 13:54:53', '2022-06-22 13:54:53'),
(6, 1, 'F6V6FrEDkvcnfE2nV8UeH6SrXRSLsu1g', '2022-09-06 10:09:38', '2022-09-06 10:09:38'),
(8, 1, 'Si7Wv9gy0JxJWlLAfNHIrOh5iax29Q1u', '2022-11-15 08:34:55', '2022-11-15 08:34:55'),
(9, 1, '360IypIqX9G8rk2WPhITLKwmk899B5Tw', '2022-11-15 08:55:28', '2022-11-15 08:55:28'),
(10, 1, 'cgbqCTEyVMUd5cty2F8xUopSG7RmGnFb', '2023-09-14 03:27:59', '2023-09-14 03:27:59'),
(11, 1, 'lQwBi8O2RFvRmZQyYGO1BCHIx7IAIEJB', '2023-09-14 19:03:35', '2023-09-14 19:03:35'),
(12, 1, '8LT3sOCdJsR0YwuEyCcNNuYV3qgevKLC', '2023-11-15 15:37:22', '2023-11-15 15:37:22'),
(13, 1, '68v3MPTOYfjrxj1oCv2wtnt7bOAgUJH6', '2023-11-15 15:40:16', '2023-11-15 15:40:16'),
(14, 1, 'qKJVZMLVSHQTBEWiTL7uQuLI87fwat77', '2023-11-16 06:08:20', '2023-11-16 06:08:20'),
(15, 1, 'N8dnIfBhKJOFcc3PEJuM6rO3rsMjG5H3', '2023-11-17 16:50:39', '2023-11-17 16:50:39'),
(16, 1, '0JcrHFkiavVTDarFR4sfPWcfPSNTazG9', '2023-11-18 06:55:16', '2023-11-18 06:55:16'),
(18, 1, 'qI4X0JZl4gYOhCMI7n85f2s2afNYmWcT', '2023-11-19 08:31:36', '2023-11-19 08:31:36'),
(19, 1, 'ywnDTHvyhfVBNgupNgBpOfLw2scNuHn2', '2023-11-20 13:12:17', '2023-11-20 13:12:17'),
(20, 1, 'oZAdkT3XxJNuyZbbYG3mjqEEMf3cZuyq', '2023-11-21 12:38:50', '2023-11-21 12:38:50'),
(24, 1, 'Yj0VpWDxfGd7gqQQ2Z3QfKaWFeie03Kn', '2023-11-22 10:15:20', '2023-11-22 10:15:20'),
(25, 1, 'CS8ZdRFG7CjkXuOrwkFB5RZqQgo0cKq1', '2023-11-22 10:48:48', '2023-11-22 10:48:48'),
(26, 1, 'ry03gu1NgpGonntXv1Hhy5UFn4ES7sEo', '2023-11-25 09:06:02', '2023-11-25 09:06:02'),
(27, 1, 'Ji31UksStu2HsisZgh7G1nT91y042YG2', '2023-11-27 05:57:16', '2023-11-27 05:57:16'),
(28, 1, 'ykdJo2VsfN6rAsEfuxtwQg6rPr4RAw6E', '2023-11-28 05:32:38', '2023-11-28 05:32:38'),
(29, 1, 'z2MQZ8HIasv0tdCNtxg3bpRFY94c65CB', '2023-11-29 05:57:52', '2023-11-29 05:57:52'),
(30, 1, 'Jh1GuLG0PfG9PAGkpIYIVKwH7F2tULyw', '2023-11-30 04:08:45', '2023-11-30 04:08:45'),
(31, 1, 'GnyT7fT17YarZhsayJbvclwXgdx0z7wv', '2023-12-02 05:51:37', '2023-12-02 05:51:37'),
(32, 1, 'IxGahXFHccOlV1jEqa1TojAyeDCgfWp8', '2023-12-11 07:39:53', '2023-12-11 07:39:53'),
(35, 16, 'T3Sq7ho3HYv8s9Bf1tQSOW8N6kwNr9rd', '2023-12-12 07:16:10', '2023-12-12 07:16:10'),
(36, 1, '4QbIsQGlOuOml7HzE4PJke0A4eN4eBoK', '2023-12-13 10:23:51', '2023-12-13 10:23:51'),
(37, 1, '2zuJM8ahDunOCT1lKheceOKbOmbU4wGj', '2023-12-18 08:39:31', '2023-12-18 08:39:31'),
(41, 1, 'PyIdJouP82rj4f2ZBZAPaOaIAhdTvr5l', '2023-12-18 14:30:20', '2023-12-18 14:30:20'),
(42, 1, 'EcBtu09mtchz1u23e3o7qbetBUmTjqrH', '2023-12-19 09:32:57', '2023-12-19 09:32:57');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pickup_hubs`
--

CREATE TABLE `pickup_hubs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `phone` varchar(191) DEFAULT NULL,
  `pick_up_status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pickup_hub_languages`
--

CREATE TABLE `pickup_hub_languages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `pickup_hub_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `address` text NOT NULL,
  `lang` varchar(10) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `plugins`
--

CREATE TABLE `plugins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `domain` varchar(191) DEFAULT NULL,
  `author` varchar(191) DEFAULT NULL,
  `author_url` varchar(191) DEFAULT NULL,
  `image` text DEFAULT NULL,
  `description` varchar(191) DEFAULT NULL,
  `tags` varchar(191) DEFAULT NULL,
  `plugin_identifier` varchar(191) NOT NULL,
  `directory` varchar(191) NOT NULL,
  `purchase_code` varchar(191) DEFAULT NULL,
  `version` varchar(191) NOT NULL,
  `required_cms_version` varchar(191) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `license` varchar(191) DEFAULT NULL,
  `license_url` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `brand_id` bigint(20) UNSIGNED DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL COMMENT 'if none or 1 then own else sellers',
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(191) NOT NULL,
  `price` double DEFAULT NULL,
  `special_discount` double DEFAULT NULL,
  `special_discount_type` varchar(191) DEFAULT NULL,
  `special_discount_start` datetime DEFAULT NULL,
  `special_discount_end` datetime DEFAULT NULL,
  `purchase_cost` double DEFAULT NULL,
  `barcode` varchar(191) DEFAULT NULL,
  `video_provider` varchar(191) DEFAULT NULL,
  `video_url` varchar(191) DEFAULT NULL,
  `colors` varchar(191) DEFAULT NULL,
  `attribute_sets` varchar(191) DEFAULT NULL,
  `vat_taxes` varchar(191) DEFAULT NULL,
  `has_variant` tinyint(4) NOT NULL DEFAULT 0,
  `selected_variants` mediumtext DEFAULT NULL,
  `selected_variants_ids` mediumtext DEFAULT NULL,
  `thumbnail` text DEFAULT NULL,
  `images` text DEFAULT NULL,
  `description_images` longtext DEFAULT NULL,
  `thumbnail_id` varchar(191) DEFAULT NULL,
  `image_ids` varchar(191) DEFAULT NULL,
  `current_stock` int(11) NOT NULL,
  `minimum_order_quantity` int(11) NOT NULL DEFAULT 1,
  `stock_notification` tinyint(4) NOT NULL DEFAULT 0,
  `low_stock_to_notify` int(11) DEFAULT NULL,
  `stock_visibility` enum('hide_stock','visible_with_quantity','visible_with_text') NOT NULL DEFAULT 'hide_stock',
  `total_sale` bigint(20) NOT NULL DEFAULT 0,
  `status` enum('unpublished','published','trash') NOT NULL DEFAULT 'unpublished',
  `is_approved` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'use for seller product approval purpose',
  `is_catalog` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'if 1 can''t added to cart only view',
  `external_link` varchar(191) DEFAULT NULL,
  `is_featured` tinyint(4) NOT NULL DEFAULT 0,
  `is_classified` tinyint(4) NOT NULL DEFAULT 0,
  `is_wholesale` tinyint(4) NOT NULL DEFAULT 0,
  `contact_info` text DEFAULT NULL,
  `is_digital` tinyint(4) NOT NULL DEFAULT 0,
  `is_refundable` tinyint(4) NOT NULL DEFAULT 0,
  `todays_deal` tinyint(4) NOT NULL DEFAULT 0,
  `rating` double DEFAULT 0,
  `viewed` bigint(20) NOT NULL DEFAULT 0 COMMENT 'total views of the product',
  `shipping_type` varchar(191) DEFAULT NULL,
  `shipping_fee` double DEFAULT NULL,
  `shipping_fee_depend_on_quantity` tinyint(4) NOT NULL DEFAULT 0,
  `estimated_shipping_days` text DEFAULT NULL COMMENT 'estimated time of delivering the product',
  `cash_on_delivery` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0 not available, 1 available',
  `meta_image` text DEFAULT NULL,
  `product_file` text DEFAULT NULL,
  `product_file_id` bigint(20) UNSIGNED DEFAULT NULL,
  `meta_image_id` varchar(191) DEFAULT NULL,
  `reward` double DEFAULT NULL,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `brand_id`, `category_id`, `user_id`, `created_by`, `slug`, `price`, `special_discount`, `special_discount_type`, `special_discount_start`, `special_discount_end`, `purchase_cost`, `barcode`, `video_provider`, `video_url`, `colors`, `attribute_sets`, `vat_taxes`, `has_variant`, `selected_variants`, `selected_variants_ids`, `thumbnail`, `images`, `description_images`, `thumbnail_id`, `image_ids`, `current_stock`, `minimum_order_quantity`, `stock_notification`, `low_stock_to_notify`, `stock_visibility`, `total_sale`, `status`, `is_approved`, `is_catalog`, `external_link`, `is_featured`, `is_classified`, `is_wholesale`, `contact_info`, `is_digital`, `is_refundable`, `todays_deal`, `rating`, `viewed`, `shipping_type`, `shipping_fee`, `shipping_fee_depend_on_quantity`, `estimated_shipping_days`, `cash_on_delivery`, `meta_image`, `product_file`, `product_file_id`, `meta_image_id`, `reward`, `is_deleted`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, NULL, 11, 1, 1, 'shirts', 0, 0, 'flat', '2022-04-06 00:00:00', '2024-12-31 23:59:00', 0, '8Y6M2FWIBSDXEDPL', '', '', '[\"1\"]', '[\"1\"]', '', 1, '{\"1\":[\"2\"]}', '[\"2\"]', '{\"storage\":\"local\",\"original_image\":\"images\\/20231116153947_original__media_388.jpeg\",\"image_40x40\":\"images\\/20231116153947image_40x40_media_452.jpeg\",\"image_72x72\":\"images\\/20231116153947image_72x72_media_114.jpeg\",\"image_190x230\":\"images\\/20231118125833image_190x230-428.png\"}', '[]', '[{\"image\":\"images\\/description_images\\/951af39b-8f82-4754-900f-27528931160b.jpg\",\"storage\":\"local\"},{\"image\":\"images\\/description_images\\/42ec6842-eae0-40d3-b956-1c28bf357f10.png\",\"storage\":\"local\"},{\"image\":\"images\\/description_images\\/03a5460e-417c-4227-b1a7-ddc3db1cb255.jpg\",\"storage\":\"local\"},{\"image\":\"images\\/description_images\\/86f0ef3a-0619-45a0-9581-203ed4bb064b.jpg\",\"storage\":\"local\"},{\"image\":\"images\\/description_images\\/9477a35f-4ca1-4edf-84d4-386443cdb5e8.jpg\",\"storage\":\"local\"},{\"image\":\"images\\/description_images\\/0444dce1-d9c6-4127-9892-9e26ab2e248f.png\",\"storage\":\"local\"}]', '4', NULL, 5, 1, 1, 10, 'visible_with_quantity', 0, 'published', 1, 0, NULL, 0, 0, 0, '[]', 0, 0, 0, 0, 0, 'flat_rate', 10, 1, '0', 1, '{\"storage\":\"local\",\"original_image\":\"images\\/20231116153947_original__media_388.jpeg\",\"image_40x40\":\"images\\/20231116153947image_40x40_media_452.jpeg\",\"image_72x72\":\"images\\/20231116153947image_72x72_media_114.jpeg\",\"image_190x230\":\"images\\/20231118125833image_190x230-428.png\"}', NULL, NULL, '4', 0, 0, NULL, '2022-04-06 02:44:09', '2023-11-29 10:11:05'),
(2, NULL, 13, 1, 1, 'magnetic-male', 59.090909090909, 0, NULL, NULL, NULL, NULL, '0012281641', '', '', '[\"9\"]', '[\"3\"]', '', 1, '{\"3\":[\"6\",\"7\",\"8\",\"9\",\"10\"]}', '[\"6\",\"7\",\"8\",\"9\",\"10\"]', '{\"storage\":\"local\",\"original_image\":\"images\\/20231127122437_original__media_205.jpeg\",\"image_40x40\":\"images\\/20231127122437image_40x40_media_312.jpeg\",\"image_72x72\":\"images\\/20231127122437image_72x72_media_434.jpeg\",\"image_190x230\":\"images\\/20231127151332image_190x230-137.png\",\"image_1200x630\":\"images\\/20231127125155image_1200x630-279.png\"}', '[{\"storage\":\"local\",\"original_image\":\"images\\/20231127122437_original__media_205.jpeg\",\"image_40x40\":\"images\\/20231127122437image_40x40_media_312.jpeg\",\"image_72x72\":\"images\\/20231127122437image_72x72_media_434.jpeg\",\"image_190x230\":\"images\\/20231127151332image_190x230-137.png\",\"image_1200x630\":\"images\\/20231127125155image_1200x630-279.png\"}]', '[]', '13', '13', 25, 1, 1, 2, 'hide_stock', 0, 'published', 1, 0, NULL, 1, 0, 0, '[]', 0, 0, 0, 0, 0, 'free_shipping', 0, 0, '1', 1, '{\"storage\":\"local\",\"original_image\":\"images\\/20231127122437_original__media_205.jpeg\",\"image_40x40\":\"images\\/20231127122437image_40x40_media_312.jpeg\",\"image_72x72\":\"images\\/20231127122437image_72x72_media_434.jpeg\",\"image_190x230\":\"images\\/20231127151332image_190x230-137.png\",\"image_1200x630\":\"images\\/20231127151332image_1200x630-332.png\"}', NULL, NULL, '13', NULL, 0, NULL, '2023-11-27 06:44:35', '2023-11-27 09:13:32'),
(3, NULL, 13, 1, 1, 'ash', 20, 4.5454545454545, 'flat', '2024-01-01 11:01:00', '2024-02-29 23:02:00', NULL, '0134516153', NULL, NULL, '[]', '[]', NULL, 0, '[]', '[]', '{\"storage\":\"local\",\"original_image\":\"images\\/20231127144155_original__media_58.jpeg\",\"image_40x40\":\"images\\/20231127144155image_40x40_media_76.jpeg\",\"image_72x72\":\"images\\/20231127144155image_72x72_media_443.jpeg\",\"image_190x230\":\"images\\/20231127144554image_190x230-106.png\"}', '[{\"storage\":\"local\",\"original_image\":\"images\\/20231127144155_original__media_58.jpeg\",\"image_40x40\":\"images\\/20231127144155image_40x40_media_76.jpeg\",\"image_72x72\":\"images\\/20231127144155image_72x72_media_443.jpeg\",\"image_190x230\":\"images\\/20231127144554image_190x230-106.png\"}]', '[]', '14', '14', 50, 1, 1, 2, 'hide_stock', 0, 'published', 1, 0, NULL, 1, 0, 0, '[]', 0, 0, 0, 0, 0, 'free_shipping', 0, 0, '1', 1, '{\"storage\":\"local\",\"original_image\":\"images\\/20231127144155_original__media_58.jpeg\",\"image_40x40\":\"images\\/20231127144155image_40x40_media_76.jpeg\",\"image_72x72\":\"images\\/20231127144155image_72x72_media_443.jpeg\",\"image_190x230\":\"images\\/20231127144554image_190x230-106.png\"}', NULL, NULL, '14', NULL, 0, NULL, '2023-11-27 08:45:55', '2023-11-30 05:32:29'),
(4, NULL, 13, 1, 1, 'magnetic-male-l2nps', 59.090909090909, 0, NULL, NULL, NULL, NULL, '0013291650', '', '', '[\"11\"]', '[\"6\"]', '', 1, '{\"6\":[\"14\",\"18\"]}', '[\"14\",\"18\"]', '{\"storage\":\"local\",\"original_image\":\"images\\/20231127153039_original__media_416.jpeg\",\"image_40x40\":\"images\\/20231127153039image_40x40_media_80.jpeg\",\"image_72x72\":\"images\\/20231127153039image_72x72_media_489.jpeg\",\"image_190x230\":\"images\\/20231127154953image_190x230-441.png\",\"image_1200x630\":\"images\\/20231127154023image_1200x630-18.png\"}', '[{\"storage\":\"local\",\"original_image\":\"images\\/20231127153039_original__media_416.jpeg\",\"image_40x40\":\"images\\/20231127153039image_40x40_media_80.jpeg\",\"image_72x72\":\"images\\/20231127153039image_72x72_media_489.jpeg\",\"image_190x230\":\"images\\/20231127154953image_190x230-441.png\",\"image_1200x630\":\"images\\/20231127154023image_1200x630-18.png\"}]', '[]', '15', '15', 10, 1, 1, 2, 'hide_stock', 0, 'published', 1, 0, NULL, 1, 0, 0, '[]', 0, 0, 0, 0, 0, 'free_shipping', 0, 0, '0', 1, '{\"storage\":\"local\",\"original_image\":\"images\\/20231127153039_original__media_416.jpeg\",\"image_40x40\":\"images\\/20231127153039image_40x40_media_80.jpeg\",\"image_72x72\":\"images\\/20231127153039image_72x72_media_489.jpeg\",\"image_190x230\":\"images\\/20231127154953image_190x230-441.png\",\"image_1200x630\":\"images\\/20231127154954image_1200x630-402.png\"}', NULL, NULL, '15', NULL, 0, NULL, '2023-11-27 09:39:25', '2023-11-27 09:49:54'),
(5, NULL, 13, 1, 1, 'men\'s-ls-shirt', 59.090909090909, 0, NULL, NULL, NULL, NULL, '0013301656', '', '', '[\"12\"]', '[\"7\"]', '', 1, '{\"7\":[\"21\",\"22\"]}', '[\"21\",\"22\"]', '{\"storage\":\"local\",\"original_image\":\"images\\/20231127155346_original__media_348.jpeg\",\"image_40x40\":\"images\\/20231127155346image_40x40_media_457.jpeg\",\"image_72x72\":\"images\\/20231127155346image_72x72_media_408.jpeg\",\"image_190x230\":\"images\\/20231127164013image_190x230-135.png\"}', '[{\"storage\":\"local\",\"original_image\":\"images\\/20231127155346_original__media_348.jpeg\",\"image_40x40\":\"images\\/20231127155346image_40x40_media_457.jpeg\",\"image_72x72\":\"images\\/20231127155346image_72x72_media_408.jpeg\",\"image_190x230\":\"images\\/20231127164013image_190x230-135.png\"}]', '[]', '16', '16', 10, 1, 1, 2, 'hide_stock', 0, 'published', 1, 0, NULL, 1, 0, 0, '[]', 0, 0, 0, 0, 0, 'free_shipping', 0, 0, '1', 1, '{\"storage\":\"local\",\"original_image\":\"images\\/20231127155346_original__media_348.jpeg\",\"image_40x40\":\"images\\/20231127155346image_40x40_media_457.jpeg\",\"image_72x72\":\"images\\/20231127155346image_72x72_media_408.jpeg\",\"image_190x230\":\"images\\/20231127164013image_190x230-135.png\",\"image_1200x630\":\"images\\/20231127164013image_1200x630-436.png\"}', NULL, NULL, '16', NULL, 0, NULL, '2023-11-27 09:57:13', '2023-11-27 10:40:14'),
(6, NULL, 13, 1, 1, 'magnetic-male-purple-tgdm7', 59.090909090909, NULL, NULL, NULL, NULL, NULL, '0017311666', NULL, NULL, '[\"13\"]', '[\"8\"]', NULL, 1, '{\"8\":[\"27\",\"28\"]}', '[\"27\",\"28\"]', '{\"storage\":\"local\",\"original_image\":\"images\\/20231127165229_original__media_61.jpeg\",\"image_40x40\":\"images\\/20231127165229image_40x40_media_274.jpeg\",\"image_72x72\":\"images\\/20231127165229image_72x72_media_83.jpeg\",\"image_190x230\":\"images\\/20231127165648image_190x230-420.png\"}', '[{\"storage\":\"local\",\"original_image\":\"images\\/20231127165229_original__media_61.jpeg\",\"image_40x40\":\"images\\/20231127165229image_40x40_media_274.jpeg\",\"image_72x72\":\"images\\/20231127165229image_72x72_media_83.jpeg\",\"image_190x230\":\"images\\/20231127165648image_190x230-420.png\"}]', '[]', '17', '17', 10, 1, 1, 2, 'hide_stock', 0, 'published', 1, 0, NULL, 1, 0, 0, '[]', 0, 0, 0, 0, 0, 'free_shipping', 0, 0, '1', 1, '{\"storage\":\"local\",\"original_image\":\"images\\/20231127165229_original__media_61.jpeg\",\"image_40x40\":\"images\\/20231127165229image_40x40_media_274.jpeg\",\"image_72x72\":\"images\\/20231127165229image_72x72_media_83.jpeg\",\"image_190x230\":\"images\\/20231127165648image_190x230-420.png\"}', NULL, NULL, '17', NULL, 0, NULL, '2023-11-27 10:56:48', '2023-11-27 10:56:48'),
(7, NULL, 13, 1, 1, 'magnetic-male-blue-nb-ajbmd', 59.090909090909, 0, NULL, NULL, NULL, NULL, '0012321667', '', '', '[\"14\"]', '[\"11\"]', '', 1, '{\"11\":[\"29\",\"30\"]}', '[\"29\",\"30\"]', '{\"storage\":\"local\",\"original_image\":\"images\\/20231127170420_original__media_236.jpeg\",\"image_40x40\":\"images\\/20231127170420image_40x40_media_291.jpeg\",\"image_72x72\":\"images\\/20231127170420image_72x72_media_169.jpeg\",\"image_190x230\":\"images\\/20231127170938image_190x230-69.png\"}', '[{\"storage\":\"local\",\"original_image\":\"images\\/20231127170420_original__media_236.jpeg\",\"image_40x40\":\"images\\/20231127170420image_40x40_media_291.jpeg\",\"image_72x72\":\"images\\/20231127170420image_72x72_media_169.jpeg\",\"image_190x230\":\"images\\/20231127170938image_190x230-69.png\"}]', '[]', '18', '18', 10, 1, 1, 2, 'hide_stock', 0, 'published', 1, 0, NULL, 1, 0, 0, '[]', 0, 0, 0, 0, 0, 'free_shipping', 0, 0, '1', 1, '{\"storage\":\"local\",\"original_image\":\"images\\/20231127170420_original__media_236.jpeg\",\"image_40x40\":\"images\\/20231127170420image_40x40_media_291.jpeg\",\"image_72x72\":\"images\\/20231127170420image_72x72_media_169.jpeg\",\"image_190x230\":\"images\\/20231127170938image_190x230-69.png\",\"image_1200x630\":\"images\\/20231127170938image_1200x630-451.png\"}', NULL, NULL, '18', NULL, 0, NULL, '2023-11-27 11:08:26', '2023-11-27 11:09:39'),
(8, NULL, 13, 1, 1, 'magnificentmen', 59.090909090909, 0, NULL, NULL, NULL, NULL, '0012331673', '', '', '[\"15\"]', '[\"12\"]', '', 1, '{\"12\":[\"31\",\"32\"]}', '[\"31\",\"32\"]', '{\"storage\":\"local\",\"original_image\":\"images\\/20231127174708_original__media_212.jpeg\",\"image_40x40\":\"images\\/20231127174708image_40x40_media_75.jpeg\",\"image_72x72\":\"images\\/20231127174708image_72x72_media_194.jpeg\",\"image_190x230\":\"images\\/20231127175136image_190x230-246.png\"}', '[{\"storage\":\"local\",\"original_image\":\"images\\/20231127174708_original__media_212.jpeg\",\"image_40x40\":\"images\\/20231127174708image_40x40_media_75.jpeg\",\"image_72x72\":\"images\\/20231127174708image_72x72_media_194.jpeg\",\"image_190x230\":\"images\\/20231127175136image_190x230-246.png\"}]', '[]', '19', '19', 10, 1, 1, 2, 'hide_stock', 0, 'published', 1, 0, NULL, 1, 0, 0, '[]', 0, 0, 0, 0, 0, 'free_shipping', 0, 0, '1', 1, '{\"storage\":\"local\",\"original_image\":\"images\\/20231127174708_original__media_212.jpeg\",\"image_40x40\":\"images\\/20231127174708image_40x40_media_75.jpeg\",\"image_72x72\":\"images\\/20231127174708image_72x72_media_194.jpeg\",\"image_190x230\":\"images\\/20231127175136image_190x230-246.png\",\"image_1200x630\":\"images\\/20231127175136image_1200x630-459.png\"}', NULL, NULL, '19', NULL, 0, NULL, '2023-11-27 11:49:31', '2023-11-27 11:51:36'),
(9, NULL, 14, 1, 1, 'blue-martini--blue-lt-mvn1c', 45.454545454545, NULL, NULL, NULL, NULL, NULL, '0012351685', NULL, NULL, '[\"16\"]', '[\"1\"]', '', 1, '{\"1\":[\"1\",\"5\"]}', '[\"1\",\"5\"]', '{\"storage\":\"local\",\"original_image\":\"images\\/20231129142715_original__media_336.jpeg\",\"image_40x40\":\"images\\/20231129142715image_40x40_media_214.jpeg\",\"image_72x72\":\"images\\/20231129142715image_72x72_media_179.jpeg\",\"image_190x230\":\"images\\/20231129143146image_190x230-133.png\",\"image_140x190\":\"images\\/20231129142751image_140x190-296.png\",\"image_130x95\":\"images\\/20231129142752image_130x95-304.png\",\"image_80x60\":\"images\\/20231129142752image_80x60-52.png\"}', '[]', '[]', '20', NULL, 10, 1, 1, 2, 'hide_stock', 0, 'published', 1, 0, NULL, 0, 0, 0, '[]', 0, 0, 1, 0, 0, 'free_shipping', 0, 0, '1', 1, '{\"storage\":\"local\",\"original_image\":\"images\\/20231129142715_original__media_336.jpeg\",\"image_40x40\":\"images\\/20231129142715image_40x40_media_214.jpeg\",\"image_72x72\":\"images\\/20231129142715image_72x72_media_179.jpeg\",\"image_190x230\":\"images\\/20231129143146image_190x230-133.png\",\"image_140x190\":\"images\\/20231129142751image_140x190-296.png\",\"image_130x95\":\"images\\/20231129142752image_130x95-304.png\",\"image_80x60\":\"images\\/20231129142752image_80x60-52.png\"}', NULL, NULL, '20', NULL, 0, NULL, '2023-11-29 08:31:46', '2023-11-29 08:31:46'),
(10, NULL, 13, 1, 1, 'gentlemans-club-grey-denim-upn63', 45.454545454545, 0, NULL, NULL, NULL, NULL, '0012371697', NULL, NULL, '[\"17\"]', '[\"5\"]', '', 1, '{\"5\":[\"13\"]}', '[\"13\"]', '{\"storage\":\"local\",\"original_image\":\"images\\/20231129143712_original__media_1.jpg\",\"image_40x40\":\"images\\/20231129143712image_40x40_media_87.jpg\",\"image_72x72\":\"images\\/20231129143712image_72x72_media_345.jpg\",\"image_190x230\":\"images\\/20231129144357image_190x230-324.png\"}', '[]', '[]', '21', NULL, 4, 1, 1, 2, 'hide_stock', 0, 'published', 1, 0, NULL, 0, 0, 0, '[]', 0, 0, 1, 0, 0, 'free_shipping', 0, 0, '1', 1, '{\"storage\":\"local\",\"original_image\":\"images\\/20231129143712_original__media_1.jpg\",\"image_40x40\":\"images\\/20231129143712image_40x40_media_87.jpg\",\"image_72x72\":\"images\\/20231129143712image_72x72_media_345.jpg\",\"image_190x230\":\"images\\/20231129144357image_190x230-324.png\"}', NULL, NULL, '21', NULL, 0, NULL, '2023-11-29 08:43:57', '2023-12-18 14:28:39'),
(11, NULL, 14, 1, 1, 'magnificent-men', 45.454545454545, NULL, NULL, NULL, NULL, NULL, '0122516103', NULL, NULL, '[]', '[]', '', 0, '[]', '[]', '{\"storage\":\"local\",\"original_image\":\"images\\/20231129152335_original__media_18.jpg\",\"image_40x40\":\"images\\/20231129152335image_40x40_media_484.jpg\",\"image_72x72\":\"images\\/20231129152335image_72x72_media_5.jpg\",\"image_190x230\":\"images\\/20231129152939image_190x230-461.png\"}', '[]', '[]', '22', NULL, 50, 1, 1, 2, 'hide_stock', 0, 'published', 1, 0, NULL, 0, 0, 0, '[]', 0, 0, 1, 0, 0, 'free_shipping', 0, 0, '1', 1, '{\"storage\":\"local\",\"original_image\":\"images\\/20231129152335_original__media_18.jpg\",\"image_40x40\":\"images\\/20231129152335image_40x40_media_484.jpg\",\"image_72x72\":\"images\\/20231129152335image_72x72_media_5.jpg\",\"image_190x230\":\"images\\/20231129152939image_190x230-461.png\",\"image_1200x630\":\"images\\/20231129152939image_1200x630-248.png\"}', NULL, NULL, '22', NULL, 0, NULL, '2023-11-29 09:29:40', '2023-11-29 09:29:40'),
(12, NULL, 14, 1, 1, 'men\'s-shirt', 45.454545454545, 4.5454545454545, 'flat', '2024-01-01 11:01:00', '2024-02-29 23:02:00', NULL, '0123816110', NULL, NULL, '[]', '[]', '', 0, '[]', '[]', '{\"storage\":\"local\",\"original_image\":\"images\\/20231129153628_original__media_227.jpeg\",\"image_40x40\":\"images\\/20231129153628image_40x40_media_477.jpeg\",\"image_72x72\":\"images\\/20231129153628image_72x72_media_248.jpeg\",\"image_190x230\":\"images\\/20231129153859image_190x230-408.png\"}', '[]', '[]', '23', NULL, 50, 1, 1, 2, 'hide_stock', 0, 'published', 1, 0, NULL, 0, 0, 0, '[]', 0, 0, 1, 0, 0, 'free_shipping', 0, 0, '1', 1, '{\"storage\":\"local\",\"original_image\":\"images\\/20231129153628_original__media_227.jpeg\",\"image_40x40\":\"images\\/20231129153628image_40x40_media_477.jpeg\",\"image_72x72\":\"images\\/20231129153628image_72x72_media_248.jpeg\",\"image_190x230\":\"images\\/20231129153859image_190x230-408.png\",\"image_1200x630\":\"images\\/20231129153900image_1200x630-469.png\"}', NULL, NULL, '23', NULL, 0, NULL, '2023-11-29 09:39:00', '2023-11-30 05:32:29'),
(13, NULL, 13, 1, 1, 'magnificent-men-print-sky-blue-1ngxx', 45.454545454545, 0, NULL, NULL, NULL, NULL, '0123916116', '', '', '[]', '[]', '', 0, '[]', '[]', '{\"storage\":\"local\",\"original_image\":\"images\\/20231129155216_original__media_128.jpg\",\"image_40x40\":\"images\\/20231129155216image_40x40_media_38.jpg\",\"image_72x72\":\"images\\/20231129155216image_72x72_media_340.jpg\",\"image_190x230\":\"images\\/20231129155443image_190x230-388.png\"}', '[]', '[]', '24', NULL, 50, 1, 1, 2, 'hide_stock', 0, 'published', 1, 0, NULL, 0, 0, 0, '[]', 0, 0, 1, 0, 0, 'free_shipping', 0, 0, '1', 1, '{\"storage\":\"local\",\"original_image\":\"images\\/20231129155216_original__media_128.jpg\",\"image_40x40\":\"images\\/20231129155216image_40x40_media_38.jpg\",\"image_72x72\":\"images\\/20231129155216image_72x72_media_340.jpg\",\"image_190x230\":\"images\\/20231129155443image_190x230-388.png\",\"image_1200x630\":\"images\\/20231129155444image_1200x630-283.png\"}', NULL, NULL, '24', NULL, 0, NULL, '2023-11-29 09:54:16', '2023-11-29 09:54:44'),
(14, NULL, 13, 1, 1, 'navy-w-sky-blue-gentlemans-club-1gnzk', 45.454545454545, 4.5454545454545, 'flat', '2024-01-01 11:01:00', '2024-02-29 23:02:00', NULL, '0124016122', '', '', '[]', '[]', '', 0, '[]', '[]', '{\"storage\":\"local\",\"original_image\":\"images\\/20231129160711_original__media_380.jpg\",\"image_40x40\":\"images\\/20231129160711image_40x40_media_253.jpg\",\"image_72x72\":\"images\\/20231129160711image_72x72_media_158.jpg\",\"image_190x230\":\"images\\/20231129161040image_190x230-318.png\",\"image_1200x630\":\"images\\/20231129160956image_1200x630-338.png\"}', '[]', '[]', '25', NULL, 49, 1, 1, 2, 'hide_stock', 0, 'published', 1, 0, NULL, 0, 0, 0, '[]', 0, 0, 1, 0, 0, 'free_shipping', 0, 0, '1', 1, '{\"storage\":\"local\",\"original_image\":\"images\\/20231129160711_original__media_380.jpg\",\"image_40x40\":\"images\\/20231129160711image_40x40_media_253.jpg\",\"image_72x72\":\"images\\/20231129160711image_72x72_media_158.jpg\",\"image_190x230\":\"images\\/20231129161040image_190x230-318.png\",\"image_1200x630\":\"images\\/20231129161040image_1200x630-110.png\"}', NULL, NULL, '25', NULL, 0, NULL, '2023-11-29 10:09:56', '2023-12-18 09:19:13'),
(15, NULL, 13, 1, 1, 'grey-magnificent', 50, 0, NULL, NULL, NULL, NULL, '0124216134', NULL, NULL, '[\"18\"]', '[\"1\"]', '', 1, '[]', '[]', '{\"storage\":\"local\",\"original_image\":\"images\\/20231129164450_original__media_177.jpeg\",\"image_40x40\":\"images\\/20231129164450image_40x40_media_112.jpeg\",\"image_72x72\":\"images\\/20231129164450image_72x72_media_322.jpeg\",\"image_190x230\":\"images\\/20231129164758image_190x230-309.png\"}', '[]', '[]', '27', NULL, 5, 1, 1, 2, 'hide_stock', 0, 'published', 1, 0, NULL, 0, 0, 0, '[]', 0, 0, 0, 0, 0, 'free_shipping', 0, 0, '1', 1, '{\"storage\":\"local\",\"original_image\":\"images\\/20231129164450_original__media_177.jpeg\",\"image_40x40\":\"images\\/20231129164450image_40x40_media_112.jpeg\",\"image_72x72\":\"images\\/20231129164450image_72x72_media_322.jpeg\",\"image_190x230\":\"images\\/20231129164758image_190x230-309.png\",\"image_1200x630\":\"images\\/20231129164758image_1200x630-91.png\"}', NULL, NULL, '27', NULL, 0, NULL, '2023-11-29 10:47:59', '2023-11-30 05:32:29'),
(16, NULL, 14, 1, 1, 'grey-gentlemans-club-vaeui', 50, 0, NULL, NULL, NULL, NULL, '0134316141', NULL, NULL, '[\"18\"]', '[\"5\"]', '', 1, '{\"5\":[\"12\",\"13\"]}', '[\"12\",\"13\"]', '{\"storage\":\"local\",\"original_image\":\"images\\/20231129170021_original__media_436.jpeg\",\"image_40x40\":\"images\\/20231129170021image_40x40_media_482.jpeg\",\"image_72x72\":\"images\\/20231129170021image_72x72_media_429.jpeg\",\"image_190x230\":\"images\\/20231129170607image_190x230-84.png\"}', '[]', '[]', '28', NULL, 10, 1, 1, 2, 'hide_stock', 0, 'published', 1, 0, NULL, 0, 0, 0, '[]', 0, 0, 0, 0, 0, 'free_shipping', 0, 0, '1', 1, '{\"storage\":\"local\",\"original_image\":\"images\\/20231129170021_original__media_436.jpeg\",\"image_40x40\":\"images\\/20231129170021image_40x40_media_482.jpeg\",\"image_72x72\":\"images\\/20231129170021image_72x72_media_429.jpeg\",\"image_190x230\":\"images\\/20231129170607image_190x230-84.png\",\"image_1200x630\":\"images\\/20231129170608image_1200x630-203.png\"}', NULL, NULL, '28', NULL, 0, NULL, '2023-11-29 11:06:08', '2023-11-30 05:32:29'),
(17, NULL, 14, 1, 1, 'blue-blue-martini-27u4f', 45.454545454545, 4.5454545454545, 'flat', '2024-01-01 11:01:00', '2024-02-29 23:02:00', NULL, '0124416146', '', '', '[\"4\"]', '[\"5\"]', '', 1, '{\"5\":[\"12\",\"13\"]}', '[\"12\",\"13\"]', '{\"storage\":\"local\",\"original_image\":\"images\\/20231129171536_original__media_351.jpeg\",\"image_40x40\":\"images\\/20231129171536image_40x40_media_479.jpeg\",\"image_72x72\":\"images\\/20231129171536image_72x72_media_354.jpeg\",\"image_190x230\":\"images\\/20231202120600image_190x230-430.png\",\"image_1200x630\":\"images\\/20231129171928image_1200x630-325.png\"}', '[]', '[]', '29', NULL, 9, 1, 1, 2, 'hide_stock', 0, 'published', 1, 0, NULL, 0, 0, 0, '[]', 0, 0, 0, 0, 0, 'free_shipping', 0, 0, '1', 1, '{\"storage\":\"local\",\"original_image\":\"images\\/20231129171536_original__media_351.jpeg\",\"image_40x40\":\"images\\/20231129171536image_40x40_media_479.jpeg\",\"image_72x72\":\"images\\/20231129171536image_72x72_media_354.jpeg\",\"image_190x230\":\"images\\/20231202120600image_190x230-430.png\",\"image_1200x630\":\"images\\/20231202120602image_1200x630-62.png\"}', NULL, NULL, '29', NULL, 0, NULL, '2023-11-29 11:19:29', '2023-12-11 08:51:19');

-- --------------------------------------------------------

--
-- Table structure for table `product_languages`
--

CREATE TABLE `product_languages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `lang` varchar(10) NOT NULL DEFAULT 'en',
  `name` varchar(191) NOT NULL,
  `short_description` text DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `pdf_specification_id` bigint(20) UNSIGNED DEFAULT NULL,
  `pdf_specification` mediumtext DEFAULT NULL,
  `tags` varchar(191) DEFAULT NULL,
  `unit` varchar(191) DEFAULT NULL,
  `meta_title` varchar(191) DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `meta_keywords` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_languages`
--

INSERT INTO `product_languages` (`id`, `product_id`, `lang`, `name`, `short_description`, `description`, `pdf_specification_id`, `pdf_specification`, `tags`, `unit`, `meta_title`, `meta_description`, `meta_keywords`, `created_at`, `updated_at`) VALUES
(1, 1, 'en', 'Shirts', 'Casual evening splendor Shirt', '<div class=\"xdj266r x11i5rnm xat24cr x1mh8g0r x1vvkbs x126k92a\" style=\"white-space-collapse: preserve; margin: 0px; overflow-wrap: break-word; font-family: &quot;Segoe UI Historic&quot;, &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif; color: rgb(5, 5, 5); font-size: 15px;\"><div dir=\"auto\" style=\"font-family: inherit;\">Casual evening splendor</div></div><div class=\"x11i5rnm xat24cr x1mh8g0r x1vvkbs xtlvy1s x126k92a\" style=\"white-space-collapse: preserve; margin: 0.5em 0px 0px; overflow-wrap: break-word; font-family: &quot;Segoe UI Historic&quot;, &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif; color: rgb(5, 5, 5); font-size: 15px;\"><div dir=\"auto\" style=\"font-family: inherit;\">blended fabric</div><div dir=\"auto\" style=\"font-family: inherit;\"> - 18 stitches per inch</div><div dir=\"auto\" style=\"font-family: inherit;\"> - 1/32 of an inch top stitching</div><div dir=\"auto\" style=\"font-family: inherit;\"> - 7 <span style=\"font-family: inherit;\"><a tabindex=\"-1\" style=\"color: rgb(56, 88, 152); cursor: pointer; font-family: inherit;\"></a></span>mm seam allowance</div><div dir=\"auto\" style=\"font-family: inherit;\"> - all over taping</div><div dir=\"auto\" style=\"font-family: inherit;\"> - straight bottom with side slits</div><div dir=\"auto\" style=\"font-family: inherit;\"> - thin buttons</div><div dir=\"auto\" style=\"font-family: inherit;\"> - notch cuff</div><div dir=\"auto\" style=\"font-family: inherit;\"> - spread collar with removable bones</div></div><div class=\"x11i5rnm xat24cr x1mh8g0r x1vvkbs xtlvy1s x126k92a\" style=\"white-space-collapse: preserve; margin: 0.5em 0px 0px; overflow-wrap: break-word; font-family: &quot;Segoe UI Historic&quot;, &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif; color: rgb(5, 5, 5); font-size: 15px;\"><div dir=\"auto\" style=\"font-family: inherit;\"><span style=\"font-family: inherit;\"><a class=\"x1i10hfl xjbqb8w x6umtig x1b1mbwd xaqea5y xav7gou x9f619 x1ypdohk xt0psk2 xe8uvvx xdj266r x11i5rnm xat24cr x1mh8g0r xexx8yu x4uap5 x18d9i69 xkhd6sd x16tdsg8 x1hl2dhg xggy1nq x1a2a7pz xt0b8zv x1qq9wsj xo1l8bm\" href=\"https://www.facebook.com/hashtag/magneticmale?__eep__=6&amp;__cft__[0]=AZV88ibT9n6I63Liutge468Cb1lBmTl7Et3YIVt-RXHlsSj6kXhvmBHSNqt-T8-iDW8n6xnemtuF9MgUlqUVmm-uQfy6h8sa5-ZOCi02TYrGZOxipbpYwPw4Uj8TZ3NQWFA3umzyKtN9KcYDnuNFUz5lF-VV4C-M2s6wrZEgfUJ2SFWORkHduKpBZmEKn2x6kT0&amp;__tn__=*NK-R\" role=\"link\" tabindex=\"0\" style=\"color: var(--accent); cursor: pointer; outline: none; list-style: none; margin: 0px; text-align: inherit; padding: 0px; border-width: 0px; border-style: initial; border-color: initial; -webkit-tap-highlight-color: transparent; touch-action: manipulation; display: inline; font-family: inherit;\">#MagneticMale</a></span> <span style=\"font-family: inherit;\"><a class=\"x1i10hfl xjbqb8w x6umtig x1b1mbwd xaqea5y xav7gou x9f619 x1ypdohk xt0psk2 xe8uvvx xdj266r x11i5rnm xat24cr x1mh8g0r xexx8yu x4uap5 x18d9i69 xkhd6sd x16tdsg8 x1hl2dhg xggy1nq x1a2a7pz xt0b8zv x1qq9wsj xo1l8bm\" href=\"https://www.facebook.com/hashtag/sprezzatura?__eep__=6&amp;__cft__[0]=AZV88ibT9n6I63Liutge468Cb1lBmTl7Et3YIVt-RXHlsSj6kXhvmBHSNqt-T8-iDW8n6xnemtuF9MgUlqUVmm-uQfy6h8sa5-ZOCi02TYrGZOxipbpYwPw4Uj8TZ3NQWFA3umzyKtN9KcYDnuNFUz5lF-VV4C-M2s6wrZEgfUJ2SFWORkHduKpBZmEKn2x6kT0&amp;__tn__=*NK-R\" role=\"link\" tabindex=\"0\" style=\"color: var(--accent); cursor: pointer; outline: none; list-style: none; margin: 0px; text-align: inherit; padding: 0px; border-width: 0px; border-style: initial; border-color: initial; -webkit-tap-highlight-color: transparent; touch-action: manipulation; display: inline; font-family: inherit;\">#Sprezzatura</a></span></div></div>', NULL, '[]', 'demo,demo teg', 'PCS', '', '', '', '2022-04-06 02:44:09', '2023-11-18 06:58:35'),
(2, 2, 'en', 'Magnetic Male', 'Category: Men’s Formal Shirts\r\n\r\nSize: S\r\n\r\nColor: Blue MNB\r\n\r\nStyle: Men\'s LS Shirt\r\n\r\nModel: LRF-0703MNBSP', '<h4 style=\"font-weight: 500; font-family: &quot;Source Sans Pro&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; color: rgb(89, 157, 224);\">Product Description :</h4><p style=\"color: rgb(89, 157, 224); font-family: &quot;Source Sans Pro&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 16px;\"></p><table border=\"1\" cellpadding=\"2\" cellspacing=\"0\" class=\"Table\" style=\"color: rgb(89, 157, 224); font-family: &quot;Source Sans Pro&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 16px; border: 1pt solid windowtext; width: 152.75pt;\"><tbody><tr><td style=\"width: 26pt;\"><p style=\"margin-right: 0in; margin-left: 0in; text-align: center;\"><span style=\"color: rgb(44, 62, 80);\"><span style=\"font-size: 10px;\">1</span></span></p></td><td style=\"width: 58pt;\"><p style=\"margin-right: 0in; margin-left: 0in; text-align: center;\"><span style=\"color: rgb(44, 62, 80);\"><span style=\"font-size: 10px;\"><span style=\"font-weight: bolder;\">Color</span></span></span></p></td><td style=\"width: 66.75pt;\"><p style=\"margin-right: 0in; margin-left: 0in; text-align: center;\"><span style=\"color: rgb(44, 62, 80);\"><span style=\"font-size: 10px;\">Mid Night Blue</span></span></p></td></tr><tr><td style=\"width: 26pt;\"><p style=\"margin-right: 0in; margin-left: 0in; text-align: center;\"><span style=\"color: rgb(44, 62, 80);\"><span style=\"font-size: 10px;\">2</span></span></p></td><td style=\"width: 58pt;\"><p style=\"margin-right: 0in; margin-left: 0in; text-align: center;\"><span style=\"color: rgb(44, 62, 80);\"><span style=\"font-size: 10px;\"><span style=\"font-weight: bolder;\">Fit</span></span></span></p></td><td style=\"width: 66.75pt;\"><p style=\"margin-right: 0in; margin-left: 0in; text-align: center;\"><span style=\"color: rgb(44, 62, 80);\"><span style=\"font-size: 10px;\">R</span></span></p></td></tr><tr><td style=\"width: 26pt;\"><p style=\"margin-right: 0in; margin-left: 0in; text-align: center;\"><span style=\"color: rgb(44, 62, 80);\"><span style=\"font-size: 10px;\">3</span></span></p></td><td style=\"width: 58pt;\"><p style=\"margin-right: 0in; margin-left: 0in; text-align: center;\"><span style=\"color: rgb(44, 62, 80);\"><span style=\"font-size: 10px;\"><span style=\"font-weight: bolder;\">Collar</span></span></span></p></td><td style=\"width: 66.75pt;\"><p style=\"margin-right: 0in; margin-left: 0in; text-align: center;\"><span style=\"color: rgb(44, 62, 80);\"><span style=\"font-size: 10px;\">Spread</span></span></p></td></tr><tr><td style=\"width: 26pt;\"><p style=\"margin-right: 0in; margin-left: 0in; text-align: center;\"><span style=\"color: rgb(44, 62, 80);\"><span style=\"font-size: 10px;\">4</span></span></p></td><td style=\"width: 58pt;\"><p style=\"margin-right: 0in; margin-left: 0in; text-align: center;\"><span style=\"color: rgb(44, 62, 80);\"><span style=\"font-size: 10px;\"><span style=\"font-weight: bolder;\">Band Type</span></span></span></p></td><td style=\"width: 66.75pt;\"><p style=\"margin-right: 0in; margin-left: 0in; text-align: center;\"><span style=\"color: rgb(44, 62, 80);\"><span style=\"font-size: 10px;\">Round</span></span></p></td></tr><tr><td style=\"width: 26pt;\"><p style=\"margin-right: 0in; margin-left: 0in; text-align: center;\"><span style=\"color: rgb(44, 62, 80);\"><span style=\"font-size: 10px;\">5</span></span></p></td><td style=\"width: 58pt;\"><p style=\"margin-right: 0in; margin-left: 0in; text-align: center;\"><span style=\"color: rgb(44, 62, 80);\"><span style=\"font-size: 10px;\"><span style=\"font-weight: bolder;\">Placket</span></span></span></p></td><td style=\"width: 66.75pt;\"><p style=\"margin-right: 0in; margin-left: 0in; text-align: center;\"><span style=\"color: rgb(44, 62, 80);\"><span style=\"font-size: 10px;\">Box</span></span></p></td></tr><tr><td style=\"width: 26pt;\"><p style=\"margin-right: 0in; margin-left: 0in; text-align: center;\"><span style=\"color: rgb(44, 62, 80);\"><span style=\"font-size: 10px;\">6</span></span></p></td><td style=\"width: 58pt;\"><p style=\"margin-right: 0in; margin-left: 0in; text-align: center;\"><span style=\"color: rgb(44, 62, 80);\"><span style=\"font-size: 10px;\"><span style=\"font-weight: bolder;\">Button</span></span></span></p></td><td style=\"width: 66.75pt;\"><p style=\"margin-right: 0in; margin-left: 0in; text-align: center;\"><span style=\"color: rgb(44, 62, 80);\"><span style=\"font-size: 10px;\">32</span></span></p></td></tr><tr><td style=\"width: 26pt;\"><p style=\"margin-right: 0in; margin-left: 0in; text-align: center;\"><span style=\"color: rgb(44, 62, 80);\"><span style=\"font-size: 10px;\">7</span></span></p></td><td style=\"width: 58pt;\"><p style=\"margin-right: 0in; margin-left: 0in; text-align: center;\"><span style=\"color: rgb(44, 62, 80);\"><span style=\"font-size: 10px;\"><span style=\"font-weight: bolder;\">Cuff</span></span></span></p></td><td style=\"width: 66.75pt;\"><p style=\"margin-right: 0in; margin-left: 0in; text-align: center;\"><span style=\"color: rgb(44, 62, 80);\"><span style=\"font-size: 10px;\">Notch</span></span></p></td></tr><tr><td style=\"width: 26pt;\"><p style=\"margin-right: 0in; margin-left: 0in; text-align: center;\"><span style=\"color: rgb(44, 62, 80);\"><span style=\"font-size: 10px;\">8</span></span></p></td><td style=\"width: 58pt;\"><p style=\"margin-right: 0in; margin-left: 0in; text-align: center;\"><span style=\"color: rgb(44, 62, 80);\"><span style=\"font-size: 10px;\"><span style=\"font-weight: bolder;\">Bottom</span></span></span></p></td><td style=\"width: 66.75pt;\"><p style=\"margin-right: 0in; margin-left: 0in; text-align: center;\"><span style=\"color: rgb(44, 62, 80);\"><span style=\"font-size: 10px;\">Stragiht</span></span></p></td></tr><tr><td style=\"width: 26pt;\"><p style=\"margin-right: 0in; margin-left: 0in; text-align: center;\"><span style=\"color: rgb(44, 62, 80);\"><span style=\"font-size: 10px;\">9</span></span></p></td><td style=\"width: 58pt;\"><p style=\"margin-right: 0in; margin-left: 0in; text-align: center;\"><span style=\"color: rgb(44, 62, 80);\"><span style=\"font-size: 10px;\"><span style=\"font-weight: bolder;\">Fabric Type</span></span></span></p></td><td style=\"width: 66.75pt;\"><p style=\"margin-right: 0in; margin-left: 0in; text-align: center;\"><span style=\"color: rgb(44, 62, 80);\"><span style=\"font-size: 10px;\">Blended</span></span></p></td></tr><tr><td style=\"width: 26pt;\"><p style=\"margin-right: 0in; margin-left: 0in; text-align: center;\"><span style=\"color: rgb(44, 62, 80);\"><span style=\"font-size: 10px;\">10</span></span></p></td><td style=\"width: 58pt;\"><p style=\"margin-right: 0in; margin-left: 0in; text-align: center;\"><span style=\"color: rgb(44, 62, 80);\"><span style=\"font-size: 10px;\"><span style=\"font-weight: bolder;\">Pocket</span></span></span></p></td><td style=\"width: 66.75pt;\"><p style=\"margin-right: 0in; margin-left: 0in; text-align: center;\"><span style=\"color: rgb(44, 62, 80);\"><span style=\"font-size: 10px;\">Nil</span></span></p></td></tr></tbody></table>', NULL, '[]', '', 'PCS', 'Men\'s LS Shirt', '', 'Men\'s LS Shirt', '2023-11-27 06:44:35', '2023-11-27 06:51:55'),
(3, 3, 'en', 'Development Production', 'Category: Men’s Formal Shirts\r\n\r\nSize: M\r\n\r\nColor: Grey Ash\r\n\r\nStyle: Men\'s LS Shirt\r\n\r\nModel: ASH', '<h4 style=\"font-family: &quot;Source Sans Pro&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-weight: 500; color: rgb(33, 37, 41);\">Detail</h4><p style=\"color: rgb(33, 37, 41); font-family: &quot;Source Sans Pro&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 16px;\"></p><p style=\"color: rgb(33, 37, 41); font-family: &quot;Source Sans Pro&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 16px;\"># Color: Ash with white # Fit- S # Collar- Spread # Band Type- Notch # Placket - Box # Button - 33 # Cuff- Notch # Bottom- Tail # Fabric Type - 100% cotton</p>', NULL, '[]', '', 'PCS', '', '', '', '2023-11-27 08:45:55', '2023-11-27 08:45:55'),
(4, 4, 'en', 'Magnetic Male', 'Category: Men’s Formal Shirts\r\n\r\nSize: M\r\n\r\nColor: Blue Turquoise\r\n\r\nStyle: Men\'s LS Shirt\r\n\r\nModel: LRF-0703TSP\r\n\r\nShelf: 5/P1', '<h4 style=\"font-family: &quot;Source Sans Pro&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-weight: 500; color: rgb(33, 37, 41);\">Detail</h4><p style=\"color: rgb(33, 37, 41); font-family: &quot;Source Sans Pro&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 16px;\"></p><p style=\"color: rgb(33, 37, 41); font-family: &quot;Source Sans Pro&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 16px;\"># Color- Turquoise # Fit- R # Collar- Spread # Band Type- Round # Placket - Box # Button - 34 # Cuff- Notch # Bottom- Straight # Fabric Type - Blanded</p>', NULL, '[]', 'Men\'s LS Shirt', 'PCS', '', '', '', '2023-11-27 09:39:25', '2023-11-27 09:39:25'),
(5, 5, 'en', 'Magnetic Male Maroon', 'Category: Men’s Formal Shirts\r\n\r\nSize: M\r\n\r\nColor: Maroon\r\n\r\nStyle: Men\'s LS Shirt\r\n\r\nModel: LCF-0705MARSP\r\n\r\nShelf: 5/P1', '<h4 style=\"font-family: &quot;Source Sans Pro&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-weight: 500; color: rgb(33, 37, 41);\">Detail</h4><p style=\"color: rgb(33, 37, 41); font-family: &quot;Source Sans Pro&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 16px;\"></p><p style=\"color: rgb(33, 37, 41); font-family: &quot;Source Sans Pro&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 16px;\"># Color- Maroon # Fit- C # Collar- Spread # Band Type- Round # Placket - Box # Button - 34 # Cuff- Notch # Bottom- Straight # Fabric Type - Blanded</p><p style=\"color: rgb(33, 37, 41); font-family: &quot;Source Sans Pro&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 16px;\"><span style=\"font-weight: bolder;\">LEFT SHELF 1ST ROW</span></p>', NULL, '[]', '', 'PCS', '', '', '', '2023-11-27 09:57:13', '2023-11-27 09:57:13'),
(6, 6, 'en', 'Magnetic Male Purple', 'Category: Men’s Formal Shirts\r\n\r\nSize: XXXL\r\n\r\nColor: Purple\r\n\r\nStyle: Men\'s LS Shirt\r\n\r\nModel: L.CF-0710SP\r\n\r\nShelf: 5/P1', '<h4 style=\"font-family: &quot;Source Sans Pro&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; color: rgb(33, 37, 41);\">Product Details:</h4><p style=\"color: rgb(33, 37, 41); font-family: &quot;Source Sans Pro&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 16px;\"></p><p style=\"color: rgb(33, 37, 41); font-family: &quot;Source Sans Pro&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 16px;\"># Color- Purple/Violet # Fit- C # Collar- Spread # Band Type- Round # Placket - Box # Button - 33 # Cuff- Notch # Bottom- Straight # Fabric Type - Blanded</p><p style=\"color: rgb(33, 37, 41); font-family: &quot;Source Sans Pro&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 16px;\"><br></p><p style=\"color: rgb(33, 37, 41); font-family: &quot;Source Sans Pro&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 16px;\"><span style=\"font-weight: bolder;\">Category:</span>&nbsp;Men’s Formal Shirts</p><p style=\"color: rgb(33, 37, 41); font-family: &quot;Source Sans Pro&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 16px;\"><span style=\"font-weight: bolder;\">Size:</span>&nbsp;XXXL</p><p style=\"color: rgb(33, 37, 41); font-family: &quot;Source Sans Pro&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 16px;\"><span style=\"font-weight: bolder;\">Color:</span>&nbsp;Purple</p><p style=\"color: rgb(33, 37, 41); font-family: &quot;Source Sans Pro&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 16px;\"><span style=\"font-weight: bolder;\">Style:</span>&nbsp;Men\'s LS Shirt</p><p style=\"color: rgb(33, 37, 41); font-family: &quot;Source Sans Pro&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 16px;\"><span style=\"font-weight: bolder;\">Model:</span>&nbsp;L.CF-0710SP</p><p style=\"color: rgb(33, 37, 41); font-family: &quot;Source Sans Pro&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 16px;\"><span style=\"font-weight: bolder;\">Shelf:</span>&nbsp;5/P1</p>', NULL, '[]', '', 'PCS', '', '', '', '2023-11-27 10:56:48', '2023-11-27 10:56:48'),
(7, 7, 'en', 'Magnetic Male Blue NB', 'Category: Men’s Formal Shirts\r\n\r\nSize: S\r\n\r\nColor: Blue NB\r\n\r\nStyle: Men\'s LS Shirt\r\n\r\nModel: L.CF-0703NBSP\r\n\r\nShelf: 5/P1', '<h4 style=\"font-family: &quot;Source Sans Pro&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-weight: 500; color: rgb(33, 37, 41);\">Detail</h4><p style=\"color: rgb(33, 37, 41); font-family: &quot;Source Sans Pro&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 16px;\"></p><p style=\"color: rgb(33, 37, 41); font-family: &quot;Source Sans Pro&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 16px;\"># Color- Navy with Turquoise Dot # Fit- C # Collar- Spread # Band Type- Round # Placket - Box # Button - 34 # Cuff- Notch # Bottom- Straight # Fabric Type - Blended.</p><p style=\"color: rgb(33, 37, 41); font-family: &quot;Source Sans Pro&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 16px;\"><span style=\"font-weight: bolder;\">Category:</span>&nbsp;Men’s Formal Shirts</p><p style=\"color: rgb(33, 37, 41); font-family: &quot;Source Sans Pro&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 16px;\"><span style=\"font-weight: bolder;\">Size:</span>&nbsp;S</p><p style=\"color: rgb(33, 37, 41); font-family: &quot;Source Sans Pro&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 16px;\"><span style=\"font-weight: bolder;\">Color:</span>&nbsp;Blue NB</p><p style=\"color: rgb(33, 37, 41); font-family: &quot;Source Sans Pro&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 16px;\"><span style=\"font-weight: bolder;\">Style:</span>&nbsp;Men\'s LS Shirt</p><p style=\"color: rgb(33, 37, 41); font-family: &quot;Source Sans Pro&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 16px;\"><span style=\"font-weight: bolder;\">Model:</span>&nbsp;L.CF-0703NBSP</p><p style=\"color: rgb(33, 37, 41); font-family: &quot;Source Sans Pro&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 16px;\"><span style=\"font-weight: bolder;\">Shelf:</span>&nbsp;5/P1</p>', NULL, '[]', '', 'PCS', '', '', '', '2023-11-27 11:08:26', '2023-11-27 11:08:26'),
(8, 8, 'en', 'Magnetic Male Golden', 'Category: Men’s Formal Shirts\r\n\r\nSize: S\r\n\r\nColor: Golden\r\n\r\nStyle: Men\'s LS Shirt\r\n\r\nModel: L.RF-0714SP\r\n\r\nShelf: 5/P1', '<h4 style=\"font-family: &quot;Source Sans Pro&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-weight: 500; color: rgb(33, 37, 41);\">Detail</h4><p style=\"color: rgb(33, 37, 41); font-family: &quot;Source Sans Pro&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 16px;\"></p><p style=\"color: rgb(33, 37, 41); font-family: &quot;Source Sans Pro&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 16px;\"># Color- Golden # Fit- R # Collar- Spread # Band Type- Round # Placket - Box # Button - 21 # Cuff- Notch # Bottom- Straight # Fabric Type - Blended.</p><p style=\"color: rgb(33, 37, 41); font-family: &quot;Source Sans Pro&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 16px;\"><span style=\"font-weight: bolder;\">Category:</span>&nbsp;Men’s Formal Shirts</p><p style=\"color: rgb(33, 37, 41); font-family: &quot;Source Sans Pro&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 16px;\"><span style=\"font-weight: bolder;\">Size:</span>&nbsp;S</p><p style=\"color: rgb(33, 37, 41); font-family: &quot;Source Sans Pro&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 16px;\"><span style=\"font-weight: bolder;\">Color:</span>&nbsp;Golden</p><p style=\"color: rgb(33, 37, 41); font-family: &quot;Source Sans Pro&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 16px;\"><span style=\"font-weight: bolder;\">Style:</span>&nbsp;Men\'s LS Shirt</p><p style=\"color: rgb(33, 37, 41); font-family: &quot;Source Sans Pro&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 16px;\"><span style=\"font-weight: bolder;\">Model:</span>&nbsp;L.RF-0714SP</p><p style=\"color: rgb(33, 37, 41); font-family: &quot;Source Sans Pro&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 16px;\"><span style=\"font-weight: bolder;\">Shelf:</span>&nbsp;5/P1</p>', NULL, '[]', 'Shirt,Mens Shirt', 'PCS', '', '', '', '2023-11-27 11:49:31', '2023-11-27 11:49:31'),
(9, 9, 'en', 'Blue Martini  Blue LT', 'Category: Men’s Formal Shirts\r\n\r\nSize: S\r\n\r\nColor: Blue LT\r\n\r\nStyle: Men\'s LS Shirt\r\n\r\nModel: LSF-0103LTPC\r\n\r\nShelf: 4/P1', '<p><br></p><h4 style=\"font-family: &quot;Source Sans Pro&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-weight: 500; color: rgb(33, 37, 41);\"><span style=\"background-color: rgb(231, 148, 57);\">Details:</span></h4><p style=\"color: rgb(33, 37, 41); font-family: &quot;Source Sans Pro&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 16px;\"></p><p style=\"color: rgb(33, 37, 41); font-family: &quot;Source Sans Pro&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 16px;\"># Color- Blue LT&nbsp;# Fit- S&nbsp;# Collar- Pointed Collar # Band Type- Round # Placket - Box # Button - 27 # Cuff- Notch # Bottom- Straight # Fabric Type - Blended</p><p style=\"color: rgb(33, 37, 41); font-family: &quot;Source Sans Pro&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 16px;\"><span style=\"font-weight: bolder;\">Category:</span>&nbsp;Men’s Formal Shirts</p><p style=\"color: rgb(33, 37, 41); font-family: &quot;Source Sans Pro&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 16px;\"><span style=\"font-weight: bolder;\">Size:</span>&nbsp;S</p><p style=\"color: rgb(33, 37, 41); font-family: &quot;Source Sans Pro&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 16px;\"><span style=\"font-weight: bolder;\">Color:</span>&nbsp;Blue LT</p><p style=\"color: rgb(33, 37, 41); font-family: &quot;Source Sans Pro&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 16px;\"><span style=\"font-weight: bolder;\">Style:</span>&nbsp;Men\'s LS Shirt</p><p style=\"color: rgb(33, 37, 41); font-family: &quot;Source Sans Pro&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 16px;\"><span style=\"font-weight: bolder;\">Model:</span>&nbsp;LSF-0103LTPC</p><p style=\"color: rgb(33, 37, 41); font-family: &quot;Source Sans Pro&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 16px;\"><span style=\"font-weight: bolder;\">Shelf:</span>&nbsp;4/P1</p>', NULL, '[]', 'Blue Martini,Blue Shirt,Shirt', 'PCS', '', '', '', '2023-11-29 08:31:46', '2023-11-29 08:31:46'),
(10, 10, 'en', 'Gentleman\'s Club Grey (Denim)', 'Size: S/L/XL/XXL/XXXL\r\n\r\nColor: Grey (Denim)\r\n\r\nStyle: Men\'s LS Shirt\r\n\r\nModel: L.SF-0606PC\r\n\r\nShelf: 5/P1', '<h4 style=\"\"><span style=\"color: rgb(231, 148, 57);\">Product Details:</span></h4><p style=\"color: rgb(33, 37, 41); font-family: &quot;Source Sans Pro&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 16px;\"></p><p style=\"color: rgb(33, 37, 41); font-family: &quot;Source Sans Pro&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 16px;\"># Color- Grey (Denim) # Fit- S # Collar- Pointed # Band Type- Round # Placket - French # Button - 34 # Cuff- Notch # Bottom- Tail # Fabric Type - Cotton</p><p style=\"color: rgb(33, 37, 41); font-family: &quot;Source Sans Pro&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 16px;\"><span style=\"font-weight: bolder;\">Category:</span>&nbsp;Men’s Formal Shirts</p><p style=\"color: rgb(33, 37, 41); font-family: &quot;Source Sans Pro&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 16px;\"><span style=\"font-weight: bolder;\">Size:</span>&nbsp;S/L/XL/XXL/XXXL</p><p style=\"color: rgb(33, 37, 41); font-family: &quot;Source Sans Pro&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 16px;\"><span style=\"font-weight: bolder;\">Color:</span>&nbsp;Grey (Denim)</p><p style=\"color: rgb(33, 37, 41); font-family: &quot;Source Sans Pro&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 16px;\"><span style=\"font-weight: bolder;\">Style:</span>&nbsp;Men\'s LS Shirt</p><p style=\"color: rgb(33, 37, 41); font-family: &quot;Source Sans Pro&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 16px;\"><span style=\"font-weight: bolder;\">Model:</span>&nbsp;L.SF-0606PC</p><p style=\"color: rgb(33, 37, 41); font-family: &quot;Source Sans Pro&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 16px;\"><span style=\"font-weight: bolder;\">Shelf:</span>&nbsp;5/P1</p>', NULL, '[]', 'SHIRT,Men\'s Shirt', 'PCS', '', '', '', '2023-11-29 08:43:57', '2023-11-29 08:43:57'),
(11, 11, 'en', 'Magnificent Men Grey', 'Category: Men’s Formal Shirts\r\n\r\nSize: S/M/L/XL/XXL/XXXL\r\n\r\nColor: Grey P\r\n\r\nStyle: Men\'s LS Shirt\r\n\r\nModel: LSF-0606PC\r\n\r\nShelf: 5/P1', '<h4 style=\"font-family: &quot;Source Sans Pro&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-weight: 500; color: rgb(33, 37, 41);\">Product Details :</h4><p style=\"color: rgb(33, 37, 41); font-family: &quot;Source Sans Pro&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 16px;\"></p><p style=\"color: rgb(33, 37, 41); font-family: &quot;Source Sans Pro&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 16px;\"># Color- Grey # Fit- S # Collar- Pointed # Band Type- Round # Placket - Box # Button - 27 # Cuff- Notch # Bottom- Tail # Fabric Type - Cotton</p><p style=\"color: rgb(33, 37, 41); font-family: &quot;Source Sans Pro&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 16px;\"><span style=\"font-weight: bolder;\">Category:</span>&nbsp;Men’s Formal Shirts</p><p style=\"color: rgb(33, 37, 41); font-family: &quot;Source Sans Pro&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 16px;\"><span style=\"font-weight: bolder;\">Size:</span>&nbsp;S/M/L/XL/XXL/XXXL</p><p style=\"color: rgb(33, 37, 41); font-family: &quot;Source Sans Pro&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 16px;\"><span style=\"font-weight: bolder;\">Color:</span>&nbsp;Grey P</p><p style=\"color: rgb(33, 37, 41); font-family: &quot;Source Sans Pro&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 16px;\"><span style=\"font-weight: bolder;\">Style:</span>&nbsp;Men\'s LS Shirt</p><p style=\"color: rgb(33, 37, 41); font-family: &quot;Source Sans Pro&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 16px;\"><span style=\"font-weight: bolder;\">Model:</span>&nbsp;LSF-0606PC</p><p style=\"color: rgb(33, 37, 41); font-family: &quot;Source Sans Pro&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 16px;\"><span style=\"font-weight: bolder;\">Shelf:</span>&nbsp;5/P1</p>', NULL, '[]', 'Magnificent Men,Men\'s Shirt', 'PCS', 'Magnificent Men', '', 'Magnificent-Men', '2023-11-29 09:29:40', '2023-11-29 09:29:40'),
(12, 12, 'en', 'Blue Martini  Blue LT', 'Category: Men’s Formal Shirts\r\n\r\nSize: S/M/L/XL/XXL/XXXL\r\n\r\nColor: Blue LT\r\n\r\nStyle: Men\'s LS Shirt\r\n\r\nModel: L.RF-0703LTCA\r\n\r\nShelf: 4/P1', '<h4 style=\"font-family: &quot;Source Sans Pro&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-weight: 500; color: rgb(33, 37, 41);\"><span style=\"background-color: rgb(247, 173, 107);\">Product Details:</span></h4><p style=\"color: rgb(33, 37, 41); font-family: &quot;Source Sans Pro&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 16px;\"></p><p style=\"color: rgb(33, 37, 41); font-family: &quot;Source Sans Pro&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 16px;\"># Color- Blue LT&nbsp;# Fit- R # Collar- Cut Away # Band Type- Round # Placket - Box # Button - 27 # Cuff- Notch # Bottom- Tail # Fabric Type - 100% Cotton</p><p style=\"color: rgb(33, 37, 41); font-family: &quot;Source Sans Pro&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 16px;\"><br></p><p style=\"color: rgb(33, 37, 41); font-family: &quot;Source Sans Pro&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 16px;\"><span style=\"font-weight: bolder;\">Category:</span>&nbsp;Men’s Formal Shirts</p><p style=\"color: rgb(33, 37, 41); font-family: &quot;Source Sans Pro&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 16px;\"><span style=\"font-weight: bolder;\">Size:</span>&nbsp;S/M/L/XL/XXL/XXXL</p><p style=\"color: rgb(33, 37, 41); font-family: &quot;Source Sans Pro&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 16px;\"><span style=\"font-weight: bolder;\">Color:</span>&nbsp;Blue LT</p><p style=\"color: rgb(33, 37, 41); font-family: &quot;Source Sans Pro&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 16px;\"><span style=\"font-weight: bolder;\">Style:</span>&nbsp;Men\'s LS Shirt</p><p style=\"color: rgb(33, 37, 41); font-family: &quot;Source Sans Pro&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 16px;\"><span style=\"font-weight: bolder;\">Model:</span>&nbsp;L.RF-0703LTCA</p><p style=\"color: rgb(33, 37, 41); font-family: &quot;Source Sans Pro&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 16px;\"><span style=\"font-weight: bolder;\">Shelf:</span>&nbsp;4/P1</p>', NULL, '[]', '', 'PCS', 'Blue Martini', '', 'Blue-Martini', '2023-11-29 09:39:00', '2023-11-29 09:39:00'),
(13, 13, 'en', 'Magnificent Men Print Sky Blue', 'Category: Men’s Formal Shirts\r\n\r\nSize: S/M/L/XL/XXL/XXXL\r\n\r\nColor: Blue LT\r\n\r\nStyle: Men\'s LS Shirt\r\n\r\nModel: L.RF-0603LTCA\r\n\r\nShelf: 3/P1', '<h4 style=\"font-family: &quot;Source Sans Pro&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-weight: 500; color: rgb(33, 37, 41);\"><span style=\"background-color: rgb(231, 148, 57);\">Product Details :</span></h4><p style=\"color: rgb(33, 37, 41); font-family: &quot;Source Sans Pro&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 16px;\"></p><p style=\"color: rgb(33, 37, 41); font-family: &quot;Source Sans Pro&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 16px;\"># Color- Sky Blue (Print) # Fit- R # Collar- Cut Away # Band Type- Round # Placket - Box # Button - 27 # Cuff- Notch # Bottom- Tail # Fabric Type - 100% Cotton.</p><p style=\"color: rgb(33, 37, 41); font-family: &quot;Source Sans Pro&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 16px;\"><br></p><p style=\"color: rgb(33, 37, 41); font-family: &quot;Source Sans Pro&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 16px;\"><span style=\"font-weight: bolder;\">Category:</span>&nbsp;Men’s Formal Shirts</p><p style=\"color: rgb(33, 37, 41); font-family: &quot;Source Sans Pro&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 16px;\"><span style=\"font-weight: bolder;\">Size:</span>&nbsp;S/M/L/XL/XXL/XXXL</p><p style=\"color: rgb(33, 37, 41); font-family: &quot;Source Sans Pro&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 16px;\"><span style=\"font-weight: bolder;\">Color:</span>&nbsp;Blue LT</p><p style=\"color: rgb(33, 37, 41); font-family: &quot;Source Sans Pro&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 16px;\"><span style=\"font-weight: bolder;\">Style:</span>&nbsp;Men\'s LS Shirt</p><p style=\"color: rgb(33, 37, 41); font-family: &quot;Source Sans Pro&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 16px;\"><span style=\"font-weight: bolder;\">Model:</span>&nbsp;L.RF-0603LTCA</p><p style=\"color: rgb(33, 37, 41); font-family: &quot;Source Sans Pro&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 16px;\"><span style=\"font-weight: bolder;\">Shelf:</span>&nbsp;3/P1</p>', NULL, '[]', 'Magnificent Men ,Shirt,Mens\'s Shirt,T-shirt,Sky-blue', 'PCS', 'Men\'s LS Shirt', '', '', '2023-11-29 09:54:16', '2023-11-29 09:54:44'),
(14, 14, 'en', 'Navy w Sky Blue Gentleman\'s Club', 'Category: Men’s Formal Shirts\r\n\r\nSize: S/M/L/XL/XXL/XXXL\r\n\r\nColor: Navy w Sky Blue w White\r\n\r\nStyle: Men\'s LS Shirt\r\n\r\nModel: L.RF-0523SP\r\n\r\nShelf: 3/P1', '<h4 style=\"font-family: &quot;Source Sans Pro&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-weight: 500;\"><span style=\"color: rgb(231, 148, 57);\">Product Details :</span></h4><p style=\"color: rgb(33, 37, 41); font-family: &quot;Source Sans Pro&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 16px;\"></p><p style=\"color: rgb(33, 37, 41); font-family: &quot;Source Sans Pro&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 16px;\"># Color- blue /lt/blue on white Strip # Fit- R # Colla r- Spread # Band Type- Round # Placket - Box # Button - 27 # Cuff- Notch # Bottom- Tail # Fabric Type - Blended.</p><p style=\"color: rgb(33, 37, 41); font-family: &quot;Source Sans Pro&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 16px;\"><br></p><p style=\"color: rgb(33, 37, 41); font-family: &quot;Source Sans Pro&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 16px;\"><span style=\"font-weight: bolder;\">Category:</span>&nbsp;Men’s Formal Shirts</p><p style=\"color: rgb(33, 37, 41); font-family: &quot;Source Sans Pro&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 16px;\"><span style=\"font-weight: bolder;\">Size:</span>&nbsp;S/M/L/XL/XXL/XXXL</p><p style=\"color: rgb(33, 37, 41); font-family: &quot;Source Sans Pro&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 16px;\"><span style=\"font-weight: bolder;\">Color:</span>&nbsp;Navy w Sky Blue w White</p><p style=\"color: rgb(33, 37, 41); font-family: &quot;Source Sans Pro&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 16px;\"><span style=\"font-weight: bolder;\">Style:</span>&nbsp;Men\'s LS Shirt</p><p style=\"color: rgb(33, 37, 41); font-family: &quot;Source Sans Pro&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 16px;\"><span style=\"font-weight: bolder;\">Model:</span>&nbsp;L.RF-0523SP</p><p style=\"color: rgb(33, 37, 41); font-family: &quot;Source Sans Pro&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 16px;\"><span style=\"font-weight: bolder;\">Shelf:</span>&nbsp;3/P1</p>', NULL, '[]', 'Tshirt,Shirt,Mens\' Shirt', 'PCS', 'Sky Blue Gentleman\'s Club', 'Navy w Sky Blue Gentleman\'s Club', '', '2023-11-29 10:09:56', '2023-11-29 10:09:56');
INSERT INTO `product_languages` (`id`, `product_id`, `lang`, `name`, `short_description`, `description`, `pdf_specification_id`, `pdf_specification`, `tags`, `unit`, `meta_title`, `meta_description`, `meta_keywords`, `created_at`, `updated_at`) VALUES
(15, 15, 'en', 'Grey Magnificent Men', 'Category: Men’s Formal Shirts\r\n\r\nSize: S/M/L/XL/XXL/XXXL\r\n\r\nColor: Grey HB\r\n\r\nStyle: Men\'s LS Shirt\r\n\r\nModel: LSF-0606DGYPC\r\n\r\nShelf: 2/P1', '<h4 style=\"font-family: &quot;Source Sans Pro&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-weight: 500; color: rgb(33, 37, 41);\"><span style=\"background-color: rgb(231, 148, 57);\">Product Details :</span></h4><p style=\"color: rgb(33, 37, 41); font-family: &quot;Source Sans Pro&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 16px;\"></p><p style=\"color: rgb(33, 37, 41); font-family: &quot;Source Sans Pro&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 16px;\"># Color: Grey with Herringbone # Fit- S # Collar- Pointed # Band Type- Notch # Placket - Box # Button - 33 # Cuff- Notch # Bottom- Tail # Fabric Type - Blended.</p><p style=\"color: rgb(33, 37, 41); font-family: &quot;Source Sans Pro&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 16px;\"><span style=\"font-weight: bolder;\">Category:</span>&nbsp;Men’s Formal Shirts</p><p style=\"color: rgb(33, 37, 41); font-family: &quot;Source Sans Pro&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 16px;\"><span style=\"font-weight: bolder;\">Size:</span>&nbsp;S/M/L/XL/XXL/XXXL</p><p style=\"color: rgb(33, 37, 41); font-family: &quot;Source Sans Pro&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 16px;\"><span style=\"font-weight: bolder;\">Color:</span>&nbsp;Grey HB</p><p style=\"color: rgb(33, 37, 41); font-family: &quot;Source Sans Pro&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 16px;\"><span style=\"font-weight: bolder;\">Style:</span>&nbsp;Men\'s LS Shirt</p><p style=\"color: rgb(33, 37, 41); font-family: &quot;Source Sans Pro&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 16px;\"><span style=\"font-weight: bolder;\">Model:</span>&nbsp;LSF-0606DGYPC</p><p style=\"color: rgb(33, 37, 41); font-family: &quot;Source Sans Pro&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 16px;\"><span style=\"font-weight: bolder;\">Shelf:</span>&nbsp;2/P1</p>', NULL, '[]', '', 'PCS', 'Grey Magnificent Men', '', 'Grey Magnificent Men', '2023-11-29 10:47:59', '2023-11-29 10:47:59'),
(16, 16, 'en', 'Grey Gentleman\'s Club', 'Category: Men’s Formal Shirts\r\n\r\nSize: M/L/XL/XXL\r\n\r\nColor: Grey\r\n\r\nStyle: Men\'s LS Shirt\r\n\r\nModel: LSF-0106SP', '<h4 style=\"font-family: &quot;Source Sans Pro&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-weight: 500; color: rgb(33, 37, 41);\">Detail</h4><p style=\"color: rgb(33, 37, 41); font-family: &quot;Source Sans Pro&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 16px;\"></p><p style=\"color: rgb(33, 37, 41); font-family: &quot;Source Sans Pro&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 16px;\"># Color: Grey oxford # Fit- S # Collar- Spread # Band Type- Notch # Placket - Box # Button - 34 # Cuff- Notch # Bottom- Tail # Fabric Type - 100% cotton</p><p style=\"color: rgb(33, 37, 41); font-family: &quot;Source Sans Pro&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 16px;\"><span style=\"font-weight: bolder;\">Category:</span>&nbsp;Men’s Formal Shirts</p><p style=\"color: rgb(33, 37, 41); font-family: &quot;Source Sans Pro&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 16px;\"><span style=\"font-weight: bolder;\">Size:</span>&nbsp;M/L/XL/XXL</p><p style=\"color: rgb(33, 37, 41); font-family: &quot;Source Sans Pro&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 16px;\"><span style=\"font-weight: bolder;\">Color:</span>&nbsp;Grey</p><p style=\"color: rgb(33, 37, 41); font-family: &quot;Source Sans Pro&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 16px;\"><span style=\"font-weight: bolder;\">Style:</span>&nbsp;Men\'s LS Shirt</p><p style=\"color: rgb(33, 37, 41); font-family: &quot;Source Sans Pro&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 16px;\"><span style=\"font-weight: bolder;\">Model:</span>&nbsp;LSF-0106SP</p><p style=\"color: rgb(33, 37, 41); font-family: &quot;Source Sans Pro&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 16px;\"><span style=\"font-weight: bolder;\">Shelf:</span>&nbsp;2/P1</p>', NULL, '[]', 'Tshirt, Men\'s Shirt', 'PCS', 'Grey Gentleman\'s Club', '', 'Gentleman\'s-Club', '2023-11-29 11:06:08', '2023-11-29 11:06:08'),
(17, 17, 'en', 'Blue Blue Martini', 'Category: Men’s Formal Shirts\r\n\r\nSize: S/M/L/XL/XXL\r\n\r\nColor: Blue\r\n\r\nStyle: Men\'s LS Shirt\r\n\r\nModel: LCF-0103CA\r\n\r\nShelf: 2/P1', '<h4 style=\"font-family: &quot;Source Sans Pro&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-weight: 500; color: rgb(33, 37, 41);\"><span style=\"background-color: rgb(247, 173, 107);\">Product Details:</span></h4><p style=\"color: rgb(33, 37, 41); font-family: &quot;Source Sans Pro&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 16px;\"></p><p style=\"color: rgb(33, 37, 41); font-family: &quot;Source Sans Pro&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 16px;\"># Color: Blue oxford # Fit- C&nbsp;# Collar- Cut away # Band Type- Notch # Placket - Box # Button - 27 # Cuff- Notch # Bottom- Tail # Fabric Type - Blended.</p><p style=\"color: rgb(33, 37, 41); font-family: &quot;Source Sans Pro&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 16px;\"><span style=\"font-weight: bolder;\">Category:</span>&nbsp;Men’s Formal Shirts</p><p style=\"color: rgb(33, 37, 41); font-family: &quot;Source Sans Pro&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 16px;\"><span style=\"font-weight: bolder;\">Size:</span>&nbsp;S/M/L/XL/XXL</p><p style=\"color: rgb(33, 37, 41); font-family: &quot;Source Sans Pro&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 16px;\"><span style=\"font-weight: bolder;\">Color:</span>&nbsp;Blue</p><p style=\"color: rgb(33, 37, 41); font-family: &quot;Source Sans Pro&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 16px;\"><span style=\"font-weight: bolder;\">Style:</span>&nbsp;Men\'s LS Shirt</p><p style=\"color: rgb(33, 37, 41); font-family: &quot;Source Sans Pro&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 16px;\"><span style=\"font-weight: bolder;\">Model:</span>&nbsp;LCF-0103CA</p><p style=\"color: rgb(33, 37, 41); font-family: &quot;Source Sans Pro&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 16px;\"><span style=\"font-weight: bolder;\">Shelf:</span>&nbsp;2/P1</p>', NULL, '[]', '', 'PCS', 'Blue Martini', '', '', '2023-11-29 11:19:29', '2023-11-29 11:19:29');

-- --------------------------------------------------------

--
-- Table structure for table `product_stocks`
--

CREATE TABLE `product_stocks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `variant_ids` varchar(191) DEFAULT NULL COMMENT 'first one is color,rest is attribute values',
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) DEFAULT NULL COMMENT 'auto generated by attributes and colors',
  `sku` varchar(191) DEFAULT NULL,
  `current_stock` int(11) NOT NULL DEFAULT 0,
  `price` double DEFAULT NULL,
  `image` mediumtext DEFAULT NULL,
  `image_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_stocks`
--

INSERT INTO `product_stocks` (`id`, `variant_ids`, `product_id`, `name`, `sku`, `current_stock`, `price`, `image`, `image_id`, `created_at`, `updated_at`) VALUES
(2, '1-2', 1, 'Black-XL', 'Black-XL-2', 5, 0, '{\"storage\":\"local\",\"original_image\":\"images\\/20231116153947_original__media_388.jpeg\",\"image_40x40\":\"images\\/20231116153947image_40x40_media_452.jpeg\",\"image_72x72\":\"images\\/20231116153947image_72x72_media_114.jpeg\",\"image_190x230\":\"images\\/20231118125833image_190x230-428.png\"}', 4, '2023-11-18 06:58:35', '2023-11-18 06:58:35'),
(5, NULL, 3, '', 'ASH', 50, 20, '[]', NULL, '2023-11-27 08:45:55', '2023-11-27 08:45:55'),
(6, '9-6', 2, 'Blue MNB-XXL', 'Blue MNB-XXL-4', 5, 61.818181818182, '{\"storage\":\"local\",\"original_image\":\"images\\/20231127122437_original__media_205.jpeg\",\"image_40x40\":\"images\\/20231127122437image_40x40_media_312.jpeg\",\"image_72x72\":\"images\\/20231127122437image_72x72_media_434.jpeg\",\"image_190x230\":\"images\\/20231127151332image_190x230-137.png\",\"image_1200x630\":\"images\\/20231127151332image_1200x630-332.png\"}', 13, '2023-11-27 09:13:32', '2023-11-27 09:13:32'),
(7, '9-7', 2, 'Blue MNB-XL', 'Blue MNB-XL-4', 5, 60.909090909091, '{\"storage\":\"local\",\"original_image\":\"images\\/20231127122437_original__media_205.jpeg\",\"image_40x40\":\"images\\/20231127122437image_40x40_media_312.jpeg\",\"image_72x72\":\"images\\/20231127122437image_72x72_media_434.jpeg\",\"image_190x230\":\"images\\/20231127151332image_190x230-137.png\",\"image_1200x630\":\"images\\/20231127151332image_1200x630-332.png\"}', 13, '2023-11-27 09:13:32', '2023-11-27 09:13:32'),
(8, '9-8', 2, 'Blue MNB-L', 'Blue MNB-L-4', 5, 60, '{\"storage\":\"local\",\"original_image\":\"images\\/20231127122437_original__media_205.jpeg\",\"image_40x40\":\"images\\/20231127122437image_40x40_media_312.jpeg\",\"image_72x72\":\"images\\/20231127122437image_72x72_media_434.jpeg\",\"image_190x230\":\"images\\/20231127151332image_190x230-137.png\",\"image_1200x630\":\"images\\/20231127151332image_1200x630-332.png\"}', 13, '2023-11-27 09:13:32', '2023-11-27 09:13:32'),
(9, '9-9', 2, 'Blue MNB-S', 'Blue MNB-S-4', 5, 59.090909090909, '{\"storage\":\"local\",\"original_image\":\"images\\/20231127122437_original__media_205.jpeg\",\"image_40x40\":\"images\\/20231127122437image_40x40_media_312.jpeg\",\"image_72x72\":\"images\\/20231127122437image_72x72_media_434.jpeg\",\"image_190x230\":\"images\\/20231127151332image_190x230-137.png\",\"image_1200x630\":\"images\\/20231127151332image_1200x630-332.png\"}', 13, '2023-11-27 09:13:32', '2023-11-27 09:13:32'),
(10, '9-10', 2, 'Blue MNB-M', 'Blue MNB-M-4', 5, 59.090909090909, '{\"storage\":\"local\",\"original_image\":\"images\\/20231127122437_original__media_205.jpeg\",\"image_40x40\":\"images\\/20231127122437image_40x40_media_312.jpeg\",\"image_72x72\":\"images\\/20231127122437image_72x72_media_434.jpeg\",\"image_190x230\":\"images\\/20231127151332image_190x230-137.png\",\"image_1200x630\":\"images\\/20231127151332image_1200x630-332.png\"}', 13, '2023-11-27 09:13:32', '2023-11-27 09:13:32'),
(14, '11-14', 4, 'Blue Turquoise-S', 'Blue Turquoise-S-5', 5, 59.090909090909, '[]', NULL, '2023-11-27 09:49:54', '2023-11-27 09:49:54'),
(15, '11-18', 4, 'Blue Turquoise-XXL', 'Blue Turquoise-XXL-5', 5, 61.818181818182, '[]', NULL, '2023-11-27 09:49:54', '2023-11-27 09:49:54'),
(18, '12-21', 5, 'Maroon-XL', 'Maroon-XL-5', 5, 61.818181818182, '{\"storage\":\"local\",\"original_image\":\"images\\/20231127155346_original__media_348.jpeg\",\"image_40x40\":\"images\\/20231127155346image_40x40_media_457.jpeg\",\"image_72x72\":\"images\\/20231127155346image_72x72_media_408.jpeg\",\"image_190x230\":\"images\\/20231127164013image_190x230-135.png\",\"image_1200x630\":\"images\\/20231127164013image_1200x630-436.png\"}', 16, '2023-11-27 10:40:14', '2023-11-27 10:40:14'),
(19, '12-22', 5, 'Maroon-XXL', 'Maroon-XXL-5', 5, 60, '[]', NULL, '2023-11-27 10:40:14', '2023-11-27 10:40:14'),
(20, '13-27', 6, 'Purple-XXXL', 'Purple-XXXL-6', 5, 61.818181818182, '{\"storage\":\"local\",\"original_image\":\"images\\/20231127165229_original__media_61.jpeg\",\"image_40x40\":\"images\\/20231127165229image_40x40_media_274.jpeg\",\"image_72x72\":\"images\\/20231127165229image_72x72_media_83.jpeg\",\"image_190x230\":\"images\\/20231127165648image_190x230-420.png\"}', 17, '2023-11-27 10:56:48', '2023-11-27 10:56:48'),
(21, '13-28', 6, 'Purple-S', 'Purple-S-6', 5, 59.090909090909, '[]', NULL, '2023-11-27 10:56:48', '2023-11-27 10:56:48'),
(23, '14-29', 7, 'Blue MNB-XXXL', 'Blue MNB-XXXL-8', 5, 61.818181818182, '{\"storage\":\"local\",\"original_image\":\"images\\/20231127170420_original__media_236.jpeg\",\"image_40x40\":\"images\\/20231127170420image_40x40_media_291.jpeg\",\"image_72x72\":\"images\\/20231127170420image_72x72_media_169.jpeg\",\"image_190x230\":\"images\\/20231127170938image_190x230-69.png\",\"image_1200x630\":\"images\\/20231127170938image_1200x630-451.png\"}', 18, '2023-11-27 11:09:39', '2023-11-27 11:09:39'),
(24, '14-30', 7, 'Blue MNB-S', 'Blue MNB-S-8', 5, 59.090909090909, '[]', NULL, '2023-11-27 11:09:39', '2023-11-27 11:09:39'),
(26, '15-31', 8, 'Golden-XXXL', 'Golden-XXXL-9', 5, 61.818181818182, '{\"storage\":\"local\",\"original_image\":\"images\\/20231127174708_original__media_212.jpeg\",\"image_40x40\":\"images\\/20231127174708image_40x40_media_75.jpeg\",\"image_72x72\":\"images\\/20231127174708image_72x72_media_194.jpeg\",\"image_190x230\":\"images\\/20231127175136image_190x230-246.png\",\"image_1200x630\":\"images\\/20231127175136image_1200x630-459.png\"}', 19, '2023-11-27 11:51:36', '2023-11-27 11:51:36'),
(27, '15-32', 8, 'Golden-S', 'Golden-S-9', 5, 59.090909090909, '[]', NULL, '2023-11-27 11:51:36', '2023-11-27 11:51:36'),
(28, '16-1', 9, 'Blue LT-XXL', 'Blue LT-XXL-9', 5, 50, '{\"storage\":\"local\",\"original_image\":\"images\\/20231129142715_original__media_336.jpeg\",\"image_40x40\":\"images\\/20231129142715image_40x40_media_214.jpeg\",\"image_72x72\":\"images\\/20231129142715image_72x72_media_179.jpeg\",\"image_190x230\":\"images\\/20231129143146image_190x230-133.png\",\"image_140x190\":\"images\\/20231129142751image_140x190-296.png\",\"image_130x95\":\"images\\/20231129142752image_130x95-304.png\",\"image_80x60\":\"images\\/20231129142752image_80x60-52.png\"}', 20, '2023-11-29 08:31:46', '2023-11-29 08:31:46'),
(29, '16-5', 9, 'Blue LT-S', 'Blue LT-S-9', 5, 45.454545454545, '[]', NULL, '2023-11-29 08:31:46', '2023-11-29 08:31:46'),
(30, '17-13', 10, 'Grey (Denim)-XL', 'Grey (Denim)-XL-10', 4, 50, '{\"storage\":\"local\",\"original_image\":\"images\\/20231129143712_original__media_1.jpg\",\"image_40x40\":\"images\\/20231129143712image_40x40_media_87.jpg\",\"image_72x72\":\"images\\/20231129143712image_72x72_media_345.jpg\",\"image_190x230\":\"images\\/20231129144357image_190x230-324.png\"}', 21, '2023-11-29 08:43:57', '2023-12-18 14:28:39'),
(31, NULL, 11, '', 'Men\'s LS Shirt', 50, 45.454545454545, '[]', NULL, '2023-11-29 09:29:40', '2023-11-29 09:29:40'),
(32, NULL, 12, '', 'Men\'s-shirt', 50, 45.454545454545, '[]', NULL, '2023-11-29 09:39:00', '2023-11-29 09:39:00'),
(33, NULL, 13, '', 'L.RF-0603LTCA', 50, 45.454545454545, '[]', NULL, '2023-11-29 09:54:44', '2023-11-29 09:54:44'),
(34, NULL, 14, '', 'L.RF-0523SP', 49, 45.454545454545, '[]', NULL, '2023-11-29 10:10:41', '2023-12-18 09:19:13'),
(35, '18', 15, 'Grey', 'Grey-15', 5, 45.454545454545, '{\"storage\":\"local\",\"original_image\":\"images\\/20231129164450_original__media_177.jpeg\",\"image_40x40\":\"images\\/20231129164450image_40x40_media_112.jpeg\",\"image_72x72\":\"images\\/20231129164450image_72x72_media_322.jpeg\",\"image_190x230\":\"images\\/20231129164758image_190x230-309.png\",\"image_1200x630\":\"images\\/20231129164758image_1200x630-91.png\"}', 27, '2023-11-29 10:47:59', '2023-11-29 10:47:59'),
(36, '18-12', 16, 'Grey-M', 'Grey-M-16', 5, 45.454545454545, '{\"storage\":\"local\",\"original_image\":\"images\\/20231129170021_original__media_436.jpeg\",\"image_40x40\":\"images\\/20231129170021image_40x40_media_482.jpeg\",\"image_72x72\":\"images\\/20231129170021image_72x72_media_429.jpeg\",\"image_190x230\":\"images\\/20231129170607image_190x230-84.png\",\"image_1200x630\":\"images\\/20231129170608image_1200x630-203.png\"}', 28, '2023-11-29 11:06:08', '2023-11-29 11:06:08'),
(37, '18-13', 16, 'Grey-XL', 'Grey-XL-16', 5, 50, '[]', NULL, '2023-11-29 11:06:08', '2023-11-29 11:06:08'),
(40, '4-12', 17, 'Blue-M', 'Blue-M-17', 4, 45.454545454545, '[]', NULL, '2023-12-02 06:06:03', '2023-12-11 08:51:19'),
(41, '4-13', 17, 'Blue-XL', 'Blue-XL-17', 5, 50, '{\"storage\":\"local\",\"original_image\":\"images\\/20231129171536_original__media_351.jpeg\",\"image_40x40\":\"images\\/20231129171536image_40x40_media_479.jpeg\",\"image_72x72\":\"images\\/20231129171536image_72x72_media_354.jpeg\",\"image_190x230\":\"images\\/20231202120600image_190x230-430.png\",\"image_1200x630\":\"images\\/20231202120602image_1200x630-62.png\"}', 29, '2023-12-02 06:06:03', '2023-12-02 06:06:03');

-- --------------------------------------------------------

--
-- Table structure for table `product_vat_taxes`
--

CREATE TABLE `product_vat_taxes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `vat_tax_id` bigint(20) UNSIGNED NOT NULL,
  `amount` double DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_views`
--

CREATE TABLE `product_views` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_views`
--

INSERT INTO `product_views` (`id`, `user_id`, `product_id`, `created_at`, `updated_at`) VALUES
(7, 1, 1, '2023-11-27 06:46:54', '2023-11-27 06:46:54'),
(10, 1, 3, '2023-11-27 09:13:42', '2023-11-27 09:13:42'),
(12, 1, 2, '2023-11-27 09:14:43', '2023-11-27 09:14:43'),
(18, 1, 9, '2023-12-18 14:41:30', '2023-12-18 14:41:30');

-- --------------------------------------------------------

--
-- Table structure for table `refunds`
--

CREATE TABLE `refunds` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `order_detail_id` bigint(20) UNSIGNED DEFAULT NULL,
  `seller_id` bigint(20) UNSIGNED DEFAULT NULL,
  `processed_by` bigint(20) UNSIGNED DEFAULT NULL,
  `total_amount` double DEFAULT NULL,
  `shipping_cost` double DEFAULT NULL,
  `refund_amount` double DEFAULT NULL,
  `payment_type` varchar(191) DEFAULT NULL,
  `payment_details` text DEFAULT NULL,
  `exchange_rate` double DEFAULT 1,
  `seller_approval` varchar(191) NOT NULL DEFAULT 'pending',
  `admin_approval` varchar(191) NOT NULL DEFAULT 'pending',
  `status` varchar(191) NOT NULL DEFAULT 'pending',
  `reject_reason` text DEFAULT NULL,
  `remark` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `registration_requests`
--

CREATE TABLE `registration_requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(191) DEFAULT NULL,
  `last_name` varchar(191) DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `otp` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reload_options`
--

CREATE TABLE `reload_options` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `option_id` int(11) NOT NULL,
  `telecom` varchar(191) NOT NULL,
  `facevalue` varchar(191) NOT NULL,
  `value` varchar(191) NOT NULL,
  `description` varchar(191) NOT NULL,
  `type` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reminders`
--

CREATE TABLE `reminders` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(191) NOT NULL,
  `completed` tinyint(1) NOT NULL DEFAULT 0,
  `completed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `title` varchar(191) DEFAULT NULL,
  `rating` double(6,3) NOT NULL DEFAULT 0.000,
  `comment` text DEFAULT NULL,
  `images` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `review_likes`
--

CREATE TABLE `review_likes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `reviewable_type` varchar(191) NOT NULL,
  `reviewable_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `review_replies`
--

CREATE TABLE `review_replies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `review_id` bigint(20) UNSIGNED NOT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `reply` text DEFAULT NULL,
  `images` varchar(191) DEFAULT NULL,
  `level` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rewards`
--

CREATE TABLE `rewards` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `rewards` double(10,3) NOT NULL DEFAULT 0.000,
  `last_converted` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reward_details`
--

CREATE TABLE `reward_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `reward_id` bigint(20) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `product_qty` bigint(20) NOT NULL,
  `reward` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `slug` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `permissions` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `slug`, `name`, `permissions`, `created_at`, `updated_at`) VALUES
(1, 'superadmin', 'Superadmin', '[\"customer_create\",\"customer_read\",\"customer_update\",\"customer_delete\",\"staff_create\",\"staff_read\",\"staff_update\",\"staff_delete\",\"staff_ban\",\"role_create\",\"role_read\",\"role_update\",\"role_delete\",\"seller_create\",\"seller_read\",\"seller_update\",\"seller_delete\",\"seller_verify\",\"language_create\",\"language_read\",\"language_update\",\"language_delete\",\"translation_message_update\",\"media_create\",\"media_read\",\"media_update\",\"media_delete\",\"media_download\",\"brand_create\",\"brand_read\",\"brand_update\",\"brand_delete\",\"color_create\",\"color_read\",\"color_update\",\"color_delete\",\"attribute_set_create\",\"attribute_set_read\",\"attribute_set_update\",\"attribute_set_delete\",\"attribute_value_create\",\"attribute_value_read\",\"attribute_value_update\",\"attribute_value_delete\",\"category_create\",\"category_read\",\"category_update\",\"category_delete\",\"product_create\",\"product_read\",\"product_update\",\"product_delete\",\"product_restore\",\"product_clone\",\"blog_create\",\"blog_read\",\"blog_update\",\"blog_delete\",\"blog_restore\",\"blog_category_create\",\"blog_category_read\",\"blog_category_update\",\"blog_category_delete\",\"support_create\",\"support_read\",\"support_update\",\"support_delete\",\"support_department_create\",\"support_department_read\",\"support_department_update\",\"support_department_delete\",\"seller_payout_read\",\"seller_payout_accept\",\"seller_payout_reject\",\"seller_commission_read\",\"seller_commission_update\",\"order_create\",\"order_read\",\"order_update\",\"order_view\",\"order_delete\",\"order_invoice\",\"pickup_hub_create\",\"pickup_hub_read\",\"pickup_hub_update\",\"pickup_hub_delete\",\"recharge_request_read\",\"recharge_request_status_update\",\"general_setting_update\",\"preference_setting_update\",\"email_setting_update\",\"currency_setting_update\",\"vat_tax_setting_update\",\"storage_setting_update\",\"cache_update\",\"miscellaneous_setting_update\",\"admin_panel_setting_update\",\"facebook_service_update\",\"google_service_update\",\"pusher_notification_update\",\"otp_setting_read\",\"otp_setting_update\",\"sms_template_read\",\"sms_template_update\",\"payment_gateway_read\",\"payment_gateway_update\",\"theme_option_update\",\"header_content_update\",\"footer_content_update\",\"home_page_update\",\"website_seo_update\",\"website_popup_update\",\"custom_css_update\",\"custom_js_update\",\"gdpr_update\",\"page_read\",\"page_create\",\"page_update\",\"page_delete\",\"campaign_create\",\"campaign_read\",\"campaign_update\",\"campaign_delete\",\"campaign_request_read\",\"campaign_request_approved\",\"campaign_product_create\",\"campaign_product_read\",\"campaign_product_update\",\"campaign_product_delete\",\"bulk_sms_read\",\"send_bulk_sms\",\"subscriber_read\",\"subscriber_delete\",\"coupon_read\",\"coupon_create\",\"coupon_update\",\"coupon_delete\",\"shipping_configuration_read\",\"shipping_configuration_update\",\"country_read\",\"country_update\",\"state_read\",\"state_create\",\"state_update\",\"state_delete\",\"city_read\",\"city_create\",\"city_update\",\"city_delete\",\"admin_product_sale_read\",\"seller_product_sale_read\",\"product_stock_read\",\"product_wishlist_read\",\"user_searches_read\",\"commission_history_read\",\"wallet_recharge_history_read\",\"api_setting_update\",\"android_setting_update\",\"ios_setting_update\",\"app_config_update\",\"ads_config_update\",\"download_link_update\",\"mobile_app_intro_read\",\"mobile_app_intro_create\",\"mobile_app_intro_update\",\"mobile_app_intro_delete\",\"delivery_hero_read\",\"delivery_hero_create\",\"delivery_hero_update\",\"delivery_hero_delete\",\"delivery_hero_ban\",\"Delivery_hero_account_deposit\",\"delivery_hero_email_activation\",\"delivery_hero_commission_history\",\"delivery_hero_deposit_history\",\"delivery_hero_collection_history\",\"delivery_hero_cancel_request\",\"delivery_hero_configuration_read\",\"delivery_hero_configuration_update\",\"wholesale_product_read\",\"wholesale_product_create\",\"wholesale_product_update\",\"wholesale_product_delete\",\"wholesale_product_clone\",\"wholesale_product_restore\",\"wholesale_product_setting\",\"refund_read\",\"refund_approve\",\"refund_process\",\"refund_reject\",\"refund_setting_read\",\"refund_setting_update\",\"reward_configuration_read\",\"reward_configuration_update\",\"reward_setting_read\",\"reward_setting_create\",\"reward_setting_update\",\"user_reward_read\",\"user_reward_update\",\"offline_payment_read\",\"offline_payment_create\",\"offline_payment_update\",\"offline_payment_delete\",\"service_read\",\"service_create\",\"service_update\",\"service_delete\",\"slider_read\",\"slider_create\",\"slider_update\",\"slider_delete\",\"wallet_recharge_read\",\"wallet_recharge_update\",\"login_singup_read\",\"login_singup_update\"]', '2022-04-06 00:07:38', '2022-04-06 00:07:38'),
(2, 'staff', 'Staff', '[\"customer_create\",\"customer_read\",\"customer_update\",\"customer_delete\",\"customer_ban\",\"staff_create\",\"staff_read\",\"staff_update\",\"staff_delete\",\"role_create\",\"role_read\",\"role_update\",\"role_delete\",\"seller_create\",\"seller_read\",\"seller_update\",\"seller_delete\",\"seller_ban\",\"language_create\",\"language_read\",\"language_update\",\"language_delete\",\"translation_message_update\",\"media_create\",\"media_read\",\"media_update\",\"media_delete\",\"media_download\",\"brand_create\",\"brand_read\",\"brand_update\",\"brand_delete\",\"color_create\",\"color_read\",\"color_update\",\"color_delete\"]', '2022-04-06 00:07:38', '2022-04-06 00:07:38');

-- --------------------------------------------------------

--
-- Table structure for table `role_users`
--

CREATE TABLE `role_users` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_users`
--

INSERT INTO `role_users` (`user_id`, `role_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2022-04-06 00:07:38', '2022-04-06 00:07:38');

-- --------------------------------------------------------

--
-- Table structure for table `searches`
--

CREATE TABLE `searches` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `query` varchar(191) NOT NULL,
  `total_search` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sellers`
--

CREATE TABLE `sellers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `shop_name` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `verified_at` datetime DEFAULT NULL,
  `license_no` varchar(191) DEFAULT NULL,
  `tax_paper` text DEFAULT NULL,
  `logo` text DEFAULT NULL,
  `banner` text DEFAULT NULL,
  `shop_page_contents` text DEFAULT NULL,
  `mobile_shop_page_contents` text DEFAULT NULL,
  `shop_banner_id` bigint(20) UNSIGNED DEFAULT NULL,
  `shop_banner` text DEFAULT NULL,
  `shop_tagline` text DEFAULT NULL,
  `seller_country_id` bigint(20) UNSIGNED DEFAULT 19,
  `phone_no` varchar(191) DEFAULT NULL,
  `address` varchar(191) DEFAULT NULL,
  `rating_count` double DEFAULT 0,
  `reviews_count` bigint(20) DEFAULT 0,
  `facebook` text DEFAULT NULL,
  `google` text DEFAULT NULL,
  `twitter` text DEFAULT NULL,
  `youtube` text DEFAULT NULL,
  `meta_title` varchar(191) DEFAULT NULL,
  `meta_description` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sellers`
--

INSERT INTO `sellers` (`id`, `user_id`, `shop_name`, `slug`, `verified_at`, `license_no`, `tax_paper`, `logo`, `banner`, `shop_page_contents`, `mobile_shop_page_contents`, `shop_banner_id`, `shop_banner`, `shop_tagline`, `seller_country_id`, `phone_no`, `address`, `rating_count`, `reviews_count`, `facebook`, `google`, `twitter`, `youtube`, `meta_title`, `meta_description`, `created_at`, `updated_at`) VALUES
(1, 15, 'Nazib Shop', 'nazib-shop-ds8rt', NULL, NULL, '[]', '[]', '[]', '[{\"new_arrival\":\"1\"},{\"best_selling_products\":\"3\"},{\"best_rated_products\":\"2\"}]', '[]', 0, '[]', NULL, 19, '', '', 0, 0, NULL, NULL, NULL, NULL, '', '', '2023-12-12 07:11:00', '2023-12-12 07:11:00');

-- --------------------------------------------------------

--
-- Table structure for table `seller_payouts`
--

CREATE TABLE `seller_payouts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `amount` double DEFAULT NULL,
  `message` longtext DEFAULT NULL,
  `payment_to` mediumtext DEFAULT NULL,
  `payment_by` varchar(191) DEFAULT NULL,
  `payment_from` varchar(191) DEFAULT NULL,
  `status` enum('pending','accepted','rejected','canceled','processed') NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `seller_profile_user`
--

CREATE TABLE `seller_profile_user` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `seller_profile_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `position` int(11) NOT NULL DEFAULT 1,
  `image` text DEFAULT NULL,
  `image_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `position`, `image`, `image_id`, `created_at`, `updated_at`) VALUES
(1, 1, '{\"images\":{\"storage\":\"local\",\"original_image\":\"images\\/20231129131747-service_image118.png\",\"image_100x38\":\"\",\"image_89x33\":\"\",\"image_118x45\":\"\",\"image_138x52\":\"\",\"image_48x25\":\"\",\"image_40x40\":\"\",\"image_197x152\":\"\",\"image_120x80\":\"\",\"image_82x82\":\"\",\"image_617x145\":\"\",\"image_297x203\":\"\",\"image_72x72\":\"images\\/20231129131747image_small_two_service_image142.png\",\"image_270x260\":\"\",\"image_320x320\":\"\"},\"id\":null}', NULL, '2023-11-19 08:04:44', '2023-11-29 07:17:47'),
(2, 2, '{\"images\":{\"storage\":\"local\",\"original_image\":\"images\\/20231129131736-service_image279.png\",\"image_100x38\":\"\",\"image_89x33\":\"\",\"image_118x45\":\"\",\"image_138x52\":\"\",\"image_48x25\":\"\",\"image_40x40\":\"\",\"image_197x152\":\"\",\"image_120x80\":\"\",\"image_82x82\":\"\",\"image_617x145\":\"\",\"image_297x203\":\"\",\"image_72x72\":\"images\\/20231129131736image_small_two_service_image355.png\",\"image_270x260\":\"\",\"image_320x320\":\"\"},\"id\":null}', NULL, '2023-11-29 07:12:33', '2023-11-29 07:17:36'),
(3, 3, '{\"images\":{\"storage\":\"local\",\"original_image\":\"images\\/20231129131717-service_image234.png\",\"image_100x38\":\"\",\"image_89x33\":\"\",\"image_118x45\":\"\",\"image_138x52\":\"\",\"image_48x25\":\"\",\"image_40x40\":\"\",\"image_197x152\":\"\",\"image_120x80\":\"\",\"image_82x82\":\"\",\"image_617x145\":\"\",\"image_297x203\":\"\",\"image_72x72\":\"images\\/20231129131717image_small_two_service_image293.png\",\"image_270x260\":\"\",\"image_320x320\":\"\"},\"id\":null}', NULL, '2023-11-29 07:13:10', '2023-11-29 07:17:17'),
(4, 4, '{\"images\":{\"storage\":\"local\",\"original_image\":\"images\\/20231129131704-service_image8.png\",\"image_100x38\":\"\",\"image_89x33\":\"\",\"image_118x45\":\"\",\"image_138x52\":\"\",\"image_48x25\":\"\",\"image_40x40\":\"\",\"image_197x152\":\"\",\"image_120x80\":\"\",\"image_82x82\":\"\",\"image_617x145\":\"\",\"image_297x203\":\"\",\"image_72x72\":\"images\\/20231129131704image_small_two_service_image105.png\",\"image_270x260\":\"\",\"image_320x320\":\"\"},\"id\":null}', NULL, '2023-11-29 07:13:33', '2023-11-29 07:17:04');

-- --------------------------------------------------------

--
-- Table structure for table `service_languages`
--

CREATE TABLE `service_languages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `service_id` bigint(20) UNSIGNED NOT NULL,
  `lang` varchar(10) NOT NULL,
  `title` varchar(191) NOT NULL,
  `sub_title` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `service_languages`
--

INSERT INTO `service_languages` (`id`, `service_id`, `lang`, `title`, `sub_title`, `created_at`, `updated_at`) VALUES
(1, 1, 'en', 'free delilvery', 'delilvery', '2023-11-19 08:04:44', '2023-11-19 08:04:44'),
(2, 2, 'en', 'Customer Support', 'Call or Email us 24X7', '2023-11-29 07:12:33', '2023-11-29 08:17:59'),
(3, 3, 'en', 'We ensure secure payment', 'Secure Payment we ensure', '2023-11-29 07:13:10', '2023-11-29 08:18:14'),
(4, 4, 'en', 'Customize Design', 'Manufactured by Trained Craftsman', '2023-11-29 07:13:33', '2023-11-29 08:23:55');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `lang` varchar(10) DEFAULT 'en',
  `title` varchar(100) DEFAULT NULL,
  `value` mediumtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `lang`, `title`, `value`, `created_at`, `updated_at`) VALUES
(1, 'en', 'current_version', '165', '2022-04-06 00:07:39', '2023-01-16 10:57:13'),
(2, 'en', 'default_language', 'en', '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(3, 'en', 'system_name', 'Sprezzatura Ecommerce', '2022-04-06 00:07:39', '2023-11-15 15:40:00'),
(4, 'en', 'default_time_zone', 'Asia/Dhaka', '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(5, 'en', 'default_currency', '2', '2022-04-06 00:07:39', '2023-11-16 06:15:18'),
(6, 'en', 'favicon', 'a:29:{s:17:\"originalImage_url\";s:25:\"images/ico/favicon229.png\";s:15:\"image_16x16_url\";s:28:\"images/ico/favicon-16x16.png\";s:15:\"image_32x32_url\";s:28:\"images/ico/favicon-32x32.png\";s:15:\"image_57x57_url\";s:28:\"images/ico/favicon-57x57.png\";s:15:\"image_60x60_url\";s:28:\"images/ico/favicon-60x60.png\";s:15:\"image_72x72_url\";s:28:\"images/ico/favicon-72x72.png\";s:15:\"image_76x76_url\";s:28:\"images/ico/favicon-76x76.png\";s:15:\"image_96x96_url\";s:28:\"images/ico/favicon-96x96.png\";s:17:\"image_114x114_url\";s:30:\"images/ico/favicon-114x114.png\";s:17:\"image_120x120_url\";s:30:\"images/ico/favicon-120x120.png\";s:17:\"image_144x144_url\";s:30:\"images/ico/favicon-144x144.png\";s:17:\"image_152x152_url\";s:30:\"images/ico/favicon-152x152.png\";s:17:\"image_180x180_url\";s:30:\"images/ico/favicon-180x180.png\";s:17:\"image_192x192_url\";s:30:\"images/ico/favicon-192x192.png\";s:17:\"image_384x384_url\";s:30:\"images/ico/favicon-384x384.png\";s:17:\"image_512x512_url\";s:30:\"images/ico/favicon-512x512.png\";s:17:\"image_128x128_url\";s:30:\"images/ico/favicon-128x128.png\";s:15:\"image_36x36_url\";s:28:\"images/ico/favicon-36x36.png\";s:15:\"image_48x48_url\";s:28:\"images/ico/favicon-48x48.png\";s:19:\"splash_640x1136_url\";s:30:\"images/ico/splash-640x1136.png\";s:19:\"splash_750x1334_url\";s:30:\"images/ico/splash-750x1334.png\";s:20:\"splash_1242x2208_url\";s:31:\"images/ico/splash-1242x2208.png\";s:20:\"splash_1125x2436_url\";s:31:\"images/ico/splash-1125x2436.png\";s:19:\"splash_828x1792_url\";s:30:\"images/ico/splash-828x1792.png\";s:20:\"splash_1242x2688_url\";s:31:\"images/ico/splash-1242x2688.png\";s:20:\"splash_1536x2048_url\";s:31:\"images/ico/splash-1536x2048.png\";s:20:\"splash_1668x2224_url\";s:31:\"images/ico/splash-1668x2224.png\";s:20:\"splash_1668x2388_url\";s:31:\"images/ico/splash-1668x2388.png\";s:20:\"splash_2048x2732_url\";s:31:\"images/ico/splash-2048x2732.png\";}', '2022-04-06 00:07:39', '2023-12-18 10:58:47'),
(7, 'en', 'https', '0', '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(8, 'en', 'maintenance_mode', '0', '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(9, 'en', 'seller_system', '1', '2022-04-06 00:07:39', '2023-12-18 11:11:07'),
(10, 'en', 'classified_product', '1', '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(11, 'en', 'seller_product_auto_approve', '1', '2022-04-06 00:07:39', '2023-12-18 11:11:19'),
(12, 'en', 'wallet_system', '1', '2022-04-06 00:07:39', '2022-04-17 13:17:36'),
(13, 'en', 'coupon_system', '1', '2022-04-06 00:07:39', '2022-04-17 13:17:36'),
(14, 'en', 'pickup_point', '1', '2022-04-06 00:07:39', '2022-04-17 13:17:35'),
(15, 'en', 'conversation', '1', '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(16, 'en', 'color', '1', '2022-04-06 00:07:39', '2022-04-06 01:53:45'),
(17, 'en', 'mail_driver', 'smtp', '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(18, 'en', 'smtp_mail_host', 'smtp.gmail.com', '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(19, 'en', 'smtp_mail_port', '587', '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(20, 'en', 'smtp_mail_address', NULL, '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(21, 'en', 'smtp_name', 'YOORI', '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(22, 'en', 'smtp_mail_username', NULL, '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(23, 'en', 'smtp_mail_password', NULL, '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(24, 'en', 'smtp_mail_encryption_type', 'tls', '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(25, 'en', 'sendgrid_mail_host', 'smtp.sendgrid.net', '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(26, 'en', 'sendgrid_mail_port', '587', '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(27, 'en', 'sendgrid_mail_address', NULL, '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(28, 'en', 'sendgrid_name', 'yoori', '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(29, 'en', 'sendgrid_mail_username', 'apikey', '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(30, 'en', 'sendgrid_mail_password', NULL, '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(31, 'en', 'sendgrid_mail_encryption_type', 'tls', '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(32, 'en', 'sendmail_path', NULL, '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(33, 'en', 'mailgun_mail_host', 'smtp.mailgun.org', '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(34, 'en', 'mailgun_mail_port', '587', '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(35, 'en', 'mailgun_mail_address', NULL, '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(36, 'en', 'mailgun_name', 'yoori', '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(37, 'en', 'mailgun_mail_username', NULL, '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(38, 'en', 'mailgun_mail_password', NULL, '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(39, 'en', 'mailgun_mail_encryption_type', 'tls', '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(40, 'en', 'mailgun_domain', NULL, '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(41, 'en', 'mailgun_secret', NULL, '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(42, 'en', 'mail_signature', NULL, '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(43, 'en', 'currency_symbol_format', 'symbol_amount', '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(44, 'en', 'decimal_separator', '.', '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(45, 'en', 'no_of_decimals', '2', '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(46, 'en', 'default_storage', 'local', '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(47, 'en', 'aws_access_key_id', NULL, '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(48, 'en', 'aws_secret_access_key', NULL, '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(49, 'en', 'aws_default_region', NULL, '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(50, 'en', 'aws_bucket', NULL, '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(51, 'en', 'image_optimization', '1', '2022-04-06 00:07:39', '2022-04-06 00:12:27'),
(52, 'en', 'image_optimization_percentage', '80', '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(53, 'en', 'is_cache_enabled', 'disable', '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(54, 'en', 'default_cache', 'file', '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(55, 'en', 'redis_host', NULL, '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(56, 'en', 'redis_password', NULL, '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(57, 'en', 'redis_port', NULL, '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(58, 'en', 'memcached_host', NULL, '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(59, 'en', 'memcached_password', NULL, '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(60, 'en', 'memcached_port', NULL, '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(61, 'en', 'pagination', '15', '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(62, 'en', 'api_paginate', '20', '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(63, 'en', 'index_form_paginate', '10', '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(64, 'en', 'media_paginate', '32', '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(65, 'en', 'order_prefix', 'YR', '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(66, 'en', 'primary_color', '#df770c', '2022-04-06 00:07:39', '2023-11-27 06:53:10'),
(67, 'en', 'secondary_color', '#333333', '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(68, 'en', 'full_width_menu_background', '1', '2022-04-06 00:07:39', '2022-04-06 00:21:14'),
(69, 'en', 'menu_background_color', '#0c1863', '2022-04-06 00:07:39', '2023-11-16 06:35:56'),
(70, 'en', 'menu_text_color', '#ffffff', '2022-04-06 00:07:39', '2023-11-16 06:35:56'),
(71, 'en', 'menu_border_bottom_color', '#EEEEEE', '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(72, 'en', 'fonts', 'Poppins', '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(73, 'en', 'meta_title', NULL, '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(74, 'en', 'meta_description', NULL, '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(75, 'en', 'keyword', NULL, '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(76, 'en', 'article', NULL, '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(77, 'en', 'og_image', NULL, '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(78, 'en', 'popup_title', NULL, '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(79, 'en', 'popup_description', NULL, '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(80, 'en', 'popup_show_in', 'home_page', '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(81, 'en', 'popup_image', NULL, '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(82, 'en', 'site_popup_status', '0', '2022-04-06 00:07:39', '2022-04-06 06:07:46'),
(83, 'en', 'custom_css', 'LnNnLXRvcGJhciB7CiAgICBiYWNrZ3JvdW5kLWNvbG9yOnJnYigyNDIgMTMyIDE4KTsKICAgIGJvcmRlci1ib3R0b206cmdiKDI0MiAxMzIgMTgpOwp9Ci5oZWFkZXItbWlkZGxlIC5ib3RvbS1jb250ZW50IC51c2VyLW9wdGlvbiB1bCBsaS51c2VyLWxvZy1pbmZvIGE6Zmlyc3QtY2hpbGQgewogICAgY29sb3I6ICNmZmY7Cn0KLmhlYWRlci1taWRkbGUgLmJvdG9tLWNvbnRlbnQgLnVzZXItb3B0aW9uIHVsIGxpLnVzZXItbG9nLWluZm8gYSB7CiAgICBjb2xvcjogI2ZmZjsKfQouc2ctdG9wYmFyIC5kcm9wZG93biBidXR0b257CmNvbG9yOiNmZmY7Cn0KLnNnLXRvcGJhciAuZHJvcGRvd24tbWVudSBsaSBhIHsKICAgIGNvbG9yOiAjMDAwOwp9Ci5zZy1sb2dvIGltZyB7CiAgICB3aWR0aDogMjA1cHg7Cn0KLmhlYWRlci1taWRkbGUgewpiYWNrZ3JvdW5kLWNvbG9yOiAjMDgwZjMzOwp9Ci5oZWFkZXItbWVudSxkaXYjbmF2IHsKICAgIGJhY2tncm91bmQtY29sb3I6IzA4MGYzMzsKICAgIGJvcmRlci10b3A6MXB4IHNvbGlkICNmZmZmOwp9Ci5oZWFkZXItbWVudS5oZWFkZXJfdGhlbWUxIC5jb250YWluZXJ7CiBiYWNrZ3JvdW5kLWNvbG9yOiMwODBmMzM7Cn0Kc3Bhbi5kYWlseS0taWNvbiB7CiAgICBkaXNwbGF5OiBub25lO30KLm1lc3NhZ2UtYm94LmNoYXRib3gtd2lkdGggewogICAgZGlzcGxheTogbm9uZTsKfQouYWRkcmVzcyBoNCB7CiAgICBjb2xvcjogI2ZmZjsKfQouc2ctdG9wYmFyIHVsIGxpIGE6aG92ZXJ7CmNvbG9yOiAjMDgwZjMzOwp9Ci5zZy10b3BiYXIgdWwgbGkgYSB7CiAgICBjb2xvcjogI2ZmZjsKfQouc2ctbWVudSAubmF2YmFyIGxpIGE6aG92ZXJ7CmNvbG9yOiAjZjI4NDEyOwp9CmJ1dHRvbi5idG4uYnRuLXByaW1hcnkgewogICAgYmFja2dyb3VuZDogIzA4MGYzMzsKfQpidXR0b24uYnRuLmJ0bi1wcmltYXJ5OmhvdmVyIHsKICAgIGJhY2tncm91bmQtY29sb3I6ICNmMjg0MTI7CmJvcmRlcjoxcHggc29saWQgI2JhY2tncm91bmQ6ICNmMjg0MTI7CmNvbG9yOiMzMzM7Cn0KLmJ0bi5idG4tcHJpbWFyeTpob3ZlcnsKYmFja2dyb3VuZDogI2YyODQxMjsKfQouc3Vic2NyaWJlLXNlY3Rpb24gewogICAgYmFja2dyb3VuZC1jb2xvcjogI2YyODQxMjsKfQouZm9vdGVyLWJvdHRvbS1jb250ZW50ewogICAgYm9yZGVyLXRvcDogMXB4IHNvbGlkICNmZmZmZmY7Cn0KLmZvb3Rlci13aWRnZXQgdWwgbGkgYTpob3ZlciB7CiAgICBjb2xvcjogI2YyODQxMjsKfQouZm9vdGVyLWxvZ28gaW1nIHsKICAgIHdpZHRoOiAxMzVweDsKfQouZm9vdGVyLXNlY3Rpb24gewogICAgYmFja2dyb3VuZC1jb2xvcjogIzA4MGYzMzsKfQouZm9vdGVyLXdpZGdldCBzcGFuewpjb2xvcjojZmZmZjsKfQouY29weXJpZ2h0IHAgewogICAgY29sb3I6ICNGZmY7Cn0KLmZvb3Rlci13aWRnZXQgYiB7CiAgICBjb2xvcjogI2ZmZjsKfQouZm9vdGVyLWxvZ28gaW1nIHsKICAgIHdpZHRoOiAyNDFweDsKCn0KCi5mb290ZXItdG9wIC5zb2NpYWwgdWwgbGkgYTpob3ZlcnsKIGJhY2tncm91bmQtY29sb3I6IzBjMTg2Mzt9', '2022-04-06 00:07:39', '2023-12-19 11:03:49'),
(84, 'en', 'custom_header_script', NULL, '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(85, 'en', 'custom_footer_script', NULL, '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(86, 'en', 'cookies_agreement', '<p><b>Notice: </b>Yoori uses cookies to provide necessary website functionality, improve your experience and analyze our traffic. By using our website, you agree to our Privacy Policy and our Cookies Policy.<br></p>', '2022-04-06 00:07:39', '2022-04-06 03:40:30'),
(87, 'en', 'cookies_status', '0', '2022-04-06 00:07:39', '2022-04-06 03:43:39'),
(88, 'en', 'header_theme', 'header_theme1', '2022-04-06 00:07:39', '2022-04-06 05:42:36'),
(91, 'en', 'header_contact_number', '1', '2022-04-06 00:07:39', '2022-04-06 05:53:20'),
(92, 'en', 'header_contact_phone', '01558259678', '2022-04-06 00:07:39', '2023-11-25 10:48:57'),
(93, 'en', 'header_contact_email', 'support@website.com', '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(94, 'en', 'language_switcher', '1', '2022-04-06 00:07:39', '2022-04-06 05:35:25'),
(95, 'en', 'currency_switcher', '1', '2022-04-06 00:07:39', '2022-04-06 05:34:32'),
(96, 'en', 'topbar_play_store_link', '0', '2022-04-06 00:07:39', '2022-04-21 13:01:59'),
(97, 'en', 'topbar_app_store_link', '0', '2022-04-06 00:07:39', '2022-04-21 13:02:01'),
(98, 'en', 'banner_link', NULL, '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(99, 'en', 'banner_image', '[]', '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(100, 'en', 'header_menu', 'a:7:{i:0;a:2:{s:5:\"label\";s:4:\"Home\";s:3:\"url\";s:1:\"/\";}i:1;a:2:{s:5:\"label\";s:8:\"About Us\";s:3:\"url\";s:11:\"/page/about\";}i:2;a:4:{s:5:\"label\";s:8:\"Products\";s:3:\"url\";s:18:\"javascript:void(0)\";i:0;a:2:{s:5:\"label\";s:7:\"Panjabi\";s:3:\"url\";s:17:\"/category/panjabi\";}i:1;a:2:{s:5:\"label\";s:6:\"tshirt\";s:3:\"url\";s:15:\"/category/shirt\";}}i:3;a:2:{s:5:\"label\";s:7:\"Bespoke\";s:3:\"url\";s:8:\"/bespoke\";}i:4;a:2:{s:5:\"label\";s:10:\"Size Guide\";s:3:\"url\";s:11:\"/size-guide\";}i:5;a:2:{s:5:\"label\";s:8:\"Showroom\";s:3:\"url\";s:9:\"/showroom\";}i:6;a:2:{s:5:\"label\";s:10:\"Contact Us\";s:3:\"url\";s:8:\"/contact\";}}', '2022-04-06 00:07:39', '2023-12-18 10:33:31'),
(101, 'en', 'footer_theme', 'footer_theme1', '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(102, 'en', 'about_description', '<p><font color=\"#767676\" face=\"Poppins, Helvetica, sans-serif\"><b>Redefine Experience by Meticulous Craftsmanship to Create the Style of Individuality.</b></font><br></p>', '2022-04-06 00:07:39', '2023-11-16 08:36:59'),
(106, 'en', 'show_social_links', '1', '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(107, 'en', 'footer_contact_phone', '01234567890', '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(108, 'en', 'footer_contact_email', 'test@spagreen.net', '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(109, 'en', 'footer_contact_address', NULL, '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(110, 'en', 'copyright', 'Copyright © 2023 Sprezzatura | Powered By  A & A Consulting Limited.', '2022-04-06 00:07:39', '2023-11-16 08:38:06'),
(111, 'en', 'footer_menu', 'a:6:{i:0;a:2:{s:5:\"label\";s:0:\"\";s:3:\"url\";s:1:\"/\";}i:1;a:2:{s:5:\"label\";s:0:\"\";s:3:\"url\";s:11:\"/categories\";}i:2;a:2:{s:5:\"label\";s:0:\"\";s:3:\"url\";s:7:\"/brands\";}i:3;a:2:{s:5:\"label\";s:0:\"\";s:3:\"url\";s:9:\"/products\";}i:4;a:2:{s:5:\"label\";s:0:\"\";s:3:\"url\";s:6:\"/blogs\";}i:5;a:2:{s:5:\"label\";s:0:\"\";s:3:\"url\";s:10:\"/campaigns\";}}', '2022-04-06 00:07:39', '2023-11-16 08:37:51'),
(112, 'en', 'useful_links', 'a:7:{i:0;a:2:{s:5:\"label\";s:0:\"\";s:3:\"url\";s:6:\"/blogs\";}i:1;a:2:{s:5:\"label\";s:12:\"All Products\";s:3:\"url\";s:9:\"/products\";}i:2;a:2:{s:5:\"label\";s:19:\"Browse All Category\";s:3:\"url\";s:11:\"/categories\";}i:3;a:2:{s:5:\"label\";s:0:\"\";s:3:\"url\";s:7:\"/brands\";}i:4;a:2:{s:5:\"label\";s:18:\"Terms & Conditions\";s:3:\"url\";s:22:\"/page/terms-conditions\";}i:5;a:2:{s:5:\"label\";s:14:\"Privacy Policy\";s:3:\"url\";s:20:\"/page/privacy-policy\";}i:6;a:2:{s:5:\"label\";s:0:\"\";s:3:\"url\";s:19:\"/page/refund-policy\";}}', '2022-04-06 00:07:39', '2023-11-16 08:39:58'),
(113, 'en', 'facebook_link', 'https://www.facebook.com/houseofsprezzaturabd', '2022-04-06 00:07:39', '2023-11-16 08:39:16'),
(114, 'en', 'twitter_link', '', '2022-04-06 00:07:39', '2023-11-16 08:39:16'),
(115, 'en', 'instagram_link', 'https://www.instagram.com/houseofsprezzaturabd/', '2022-04-06 00:07:39', '2023-11-16 08:39:16'),
(116, 'en', 'youtube_link', 'https://www.youtube.com/@houseofsprezzatura', '2022-04-06 00:07:39', '2023-11-16 08:39:16'),
(117, 'en', 'linkedin_link', 'https://bd.linkedin.com/company/sprezzaturabd', '2022-04-06 00:07:39', '2023-11-16 08:39:16'),
(118, 'en', 'social_link_status', '1', '2022-04-06 00:07:39', '2023-11-16 08:39:18'),
(119, 'en', 'payment_method_banner', '', '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(120, 'en', 'active_sms_provider', NULL, '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(121, 'en', 'sms_method', NULL, '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(122, 'en', 'twilio_sms_sid', NULL, '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(123, 'en', 'twilio_sms_auth_token', NULL, '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(124, 'en', 'valid_twilio_sms_number', NULL, '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(125, 'en', 'is_twilio_sms_activated', '0', '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(126, 'en', 'fast_2_auth_key', NULL, '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(127, 'en', 'fast_2_entity_id', NULL, '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(128, 'en', 'fast_2_route', NULL, '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(129, 'en', 'fast_2_language', NULL, '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(130, 'en', 'fast_2_sender_id', NULL, '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(131, 'en', 'is_fast_2_activated', '0', '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(132, 'en', 'spagreen_url', NULL, '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(133, 'en', 'spagreen_sms_api_key', NULL, '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(134, 'en', 'spagreen_secret_key', NULL, '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(135, 'en', 'is_spagreen_sms_activated', '0', '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(136, 'en', 'mimo_username', NULL, '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(137, 'en', 'mimo_sms_password', NULL, '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(138, 'en', 'mimo_sms_sender_id', NULL, '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(139, 'en', 'is_mimo_sms_activated', '0', '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(140, 'en', 'nexmo_sms_key', NULL, '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(141, 'en', 'nexmo_sms_secret_key', NULL, '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(142, 'en', 'type', NULL, '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(143, 'en', 'is_nexmo_sms_activated', '0', '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(144, 'en', 'ssl_sms_api_token', NULL, '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(145, 'en', 'ssl_sms_sid', NULL, '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(146, 'en', 'ssm_sms_url', NULL, '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(147, 'en', 'is_ssl_wireless_sms_activated', '0', '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(148, 'en', 'payment_method', NULL, '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(149, 'en', 'paypal_client_id', NULL, '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(150, 'en', 'paypal_client_secret', NULL, '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(151, 'en', 'is_paypal_activated', '0', '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(152, 'en', 'is_paypal_sandbox_mode_activated', '0', '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(153, 'en', 'stripe_key', NULL, '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(154, 'en', 'stripe_secret', NULL, '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(155, 'en', 'is_stripe_activated', '0', '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(156, 'en', 'is_stripe_sandbox_mode_activated', '0', '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(157, 'en', 'sslcommerz_id', NULL, '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(158, 'en', 'sslcommerz_password', NULL, '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(159, 'en', 'is_sslcommerz_activated', '0', '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(160, 'en', 'is_sslcommerz_sandbox_mode_activated', '0', '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(161, 'en', 'merchant_id', NULL, '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(162, 'en', 'merchant_key', NULL, '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(163, 'en', 'merchant_website', NULL, '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(164, 'en', 'channel', NULL, '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(165, 'en', 'industry_type', NULL, '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(166, 'en', 'is_paytm_activated', '0', '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(167, 'en', 'is_paytm_sandbox_mode_activated', '0', '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(168, 'en', 'jazz_cash_merchant_id', NULL, '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(169, 'en', 'jazz_cash_password', NULL, '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(170, 'en', 'jazz_cash_integrity_salt', NULL, '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(171, 'en', 'is_jazz_cash_activated', '0', '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(172, 'en', 'razorpay_key', NULL, '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(173, 'en', 'razorpay_secret', NULL, '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(174, 'en', 'is_razorpay_activated', '0', '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(175, 'en', 'api_server_url', NULL, '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(176, 'en', 'api_key_app', NULL, '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(177, 'en', 'latest_apk_version', NULL, '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(178, 'en', 'latest_apk_code', NULL, '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(179, 'en', 'apk_file_url', NULL, '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(180, 'en', 'whats_new_latest_apk', NULL, '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(181, 'en', 'android_skippable', '0', '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(182, 'en', 'latest_ipa_version', NULL, '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(183, 'en', 'latest_ipa_code', NULL, '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(184, 'en', 'ipa_file_url', NULL, '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(185, 'en', 'whats_new_latest_ipa', NULL, '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(186, 'en', 'ios_skippable', NULL, '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(187, 'en', 'privacy_policy_url', NULL, '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(188, 'en', 'terms_condition_url', NULL, '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(189, 'en', 'support_url', NULL, '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(190, 'en', 'intro_skippable', '0', '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(191, 'en', 'mandatory_login', '0', '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(192, 'en', 'admob_app_id', NULL, '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(193, 'en', 'admob_banner_ads_id', NULL, '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(194, 'en', 'admob_interstitial_ads_id', NULL, '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(195, 'en', 'admob_native_ads_id', NULL, '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(196, 'en', 'ads_enable', '0', '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(197, 'en', 'seller_commission', NULL, '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(198, 'en', 'seller_commission_status', '1', '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(199, 'en', 'delivery_hero_payment_type', 'delivery_hero_salary', '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(200, 'en', 'delivery_hero_send_mail', '0', '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(201, 'en', 'delivery_hero_OTP', '0', '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(202, 'en', 'refund_request_time', '10', '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(203, 'en', 'refund_sticker', NULL, '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(204, 'en', 'reward_convert_rate', '10', '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(205, 'en', 'shipping_fee_type', 'area_base', '2022-04-06 00:07:39', '2023-12-19 11:09:46'),
(206, 'en', 'shipping_fee_flat_rate', '0.90909090909091', '2022-04-06 00:07:39', '2023-12-11 07:41:52'),
(207, 'en', 'shipping_fee_admin_product', NULL, '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(208, 'en', 'home_page_contents', 'a:7:{i:0;a:1:{s:6:\"banner\";a:2:{s:9:\"thumbnail\";a:4:{i:0;s:1:\"2\";i:1;s:1:\"3\";i:2;s:1:\"8\";i:3;s:1:\"9\";}s:3:\"url\";a:4:{i:0;s:1:\"/\";i:1;s:1:\"/\";i:2;s:1:\"/\";i:3;s:1:\"/\";}}}i:1;a:1:{s:16:\"popular_category\";a:6:{i:0;s:1:\"1\";i:1;s:1:\"9\";i:2;s:2:\"10\";i:3;s:2:\"11\";i:4;s:2:\"13\";i:5;s:2:\"14\";}}i:2;a:1:{s:21:\"best_selling_products\";a:1:{i:0;s:1:\"3\";}}i:3;a:1:{s:17:\"offer_ending_soon\";a:2:{s:6:\"banner\";s:1:\"1\";s:10:\"banner_url\";s:1:\"/\";}}i:4;a:1:{s:15:\"custom_products\";a:6:{i:0;s:2:\"10\";i:1;s:2:\"11\";i:2;s:2:\"12\";i:3;s:2:\"14\";i:4;s:2:\"15\";i:5;s:2:\"16\";}}i:5;a:1:{s:10:\"flash_deal\";s:1:\"6\";}i:6;a:1:{s:14:\"latest_product\";s:1:\"7\";}}', '2022-04-06 00:07:39', '2023-12-12 06:02:06'),
(209, 'en', 'show_service_info_section', '1', '2022-04-06 00:07:39', '2023-11-29 07:18:30'),
(210, 'en', 'show_subscription_section', '1', '2022-04-06 00:07:39', '2023-12-12 06:02:06'),
(211, 'en', 'is_facebook_login_activated', '0', '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(212, 'en', 'facebook_client_id', NULL, '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(213, 'en', 'facebook_client_secret', NULL, '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(214, 'en', 'is_google_login_activated', '0', '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(215, 'en', 'google_client_id', NULL, '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(216, 'en', 'google_client_secret', NULL, '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(217, 'en', 'is_twitter_login_activated', '0', '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(218, 'en', 'twitter_client_id', NULL, '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(219, 'en', 'twitter_client_secret', NULL, '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(220, 'en', 'is_pusher_notification_active', '0', '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(221, 'en', 'pusher_app_id', NULL, '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(222, 'en', 'pusher_app_key', NULL, '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(223, 'en', 'pusher_app_secret', NULL, '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(224, 'en', 'pusher_app_cluster', NULL, '2022-04-06 00:07:39', '2022-04-06 00:07:39'),
(225, 'en', 'id', '', '2022-04-06 00:20:25', '2023-11-16 06:35:56'),
(226, 'en', 'home_page_article', '', '2022-04-06 01:45:10', '2022-04-06 01:45:10'),
(227, 'en', 'show_blog_section', '0', '2022-04-06 01:45:10', '2022-04-06 01:45:10'),
(228, 'en', 'show_recent_viewed_products', '0', '2022-04-06 01:45:10', '2023-12-12 06:02:06'),
(229, 'en', 'show_categories_section', '0', '2022-04-06 01:45:10', '2022-04-06 01:45:10'),
(230, 'en', 'seller_agreement', '', '2022-04-06 03:39:56', '2022-04-06 03:39:56'),
(231, 'en', 'customer_agreement', '', '2022-04-06 03:39:56', '2022-04-06 03:39:56'),
(232, 'en', 'privacy_agreement', '', '2022-04-06 03:39:56', '2022-04-06 03:39:56'),
(233, 'en', 'admin_panel_copyright_text', 'Copyright © 2023 Sprezzatura | Powered By  A & A Consulting Limited.', NULL, '2023-11-16 06:18:02'),
(234, 'en', 'admin_panel_title', 'Sprezzatura Ecommerce', '2022-04-17 09:52:21', '2023-11-16 06:18:02'),
(235, 'en', 'system_short_name', 'Sprezzatura', '2022-04-17 09:55:01', '2023-11-16 06:18:02'),
(239, 'en', 'pay_later_system', '1', '2022-04-17 13:17:35', '2022-04-17 13:17:35'),
(240, 'en', 'invoice_based_shipping_fee', 'a:1:{i:0;a:3:{s:10:\"min_amount\";d:0;s:10:\"max_amount\";d:0;s:3:\"fee\";d:0;}}', '2022-05-23 12:25:03', '2023-12-11 07:41:52'),
(241, 'en', 'shipping_fee_default_rate', '0', '2022-05-23 12:25:03', '2023-12-11 07:41:52'),
(242, 'en', 'default_country', '19', NULL, NULL),
(243, 'en', 'refund_protection_title', 'Yoori eCommerce Refund Protection', NULL, NULL),
(244, 'en', 'refund_protection_sub_title', '30 Days cash back Guarantee', NULL, NULL),
(245, 'en', 'refund_policy_agreement', 'refund-policy', NULL, NULL),
(246, 'en', 'purchase_code', 'e014b60c-1405-4d61-9e7a-960b0410f62f', '2022-07-21 17:21:27', '2023-11-14 14:15:24'),
(247, 'en', 'mobile_home_page_contents', 'a:8:{i:0;a:1:{s:14:\"latest_product\";s:2:\"10\";}i:1;a:1:{s:12:\"top_category\";a:4:{i:0;s:1:\"1\";i:1;s:1:\"2\";i:2;s:1:\"3\";i:3;s:1:\"4\";}}i:2;a:1:{s:21:\"best_selling_products\";a:1:{i:0;s:1:\"2\";}}i:3;a:1:{s:11:\"latest_news\";a:1:{i:0;s:1:\"4\";}}i:4;a:1:{s:11:\"top_sellers\";a:1:{i:0;s:1:\"5\";}}i:5;a:1:{s:12:\"best_sellers\";a:1:{i:0;s:1:\"6\";}}i:6;a:1:{s:10:\"flash_deal\";s:1:\"7\";}i:7;a:1:{s:11:\"todays_deal\";s:1:\"8\";}}', '2022-07-26 13:45:27', '2022-07-26 13:45:27'),
(248, 'en', 'version_code', '1.6.5', '2022-08-08 11:13:06', '2023-01-16 10:57:13'),
(249, 'en', 'menu_active_color', '#f28412', '2022-09-06 10:09:22', '2023-11-16 06:35:56'),
(250, 'en', 'button_background_color', '#0c1863', '2022-09-06 10:09:22', '2023-11-27 06:46:45'),
(251, 'en', 'button_text_color', '#ffffff', '2022-09-06 10:09:22', '2022-09-06 10:09:22'),
(252, 'en', 'button_text_color', '#ea2424', '2022-09-06 10:09:22', '2022-09-06 10:09:22'),
(253, 'en', 'button_border_color', '#0c1863', '2022-09-10 09:35:34', '2023-11-27 06:46:45'),
(254, 'en', 'contact_email', 'info@sprezzaturabd.com', '2023-11-15 15:38:01', '2023-11-15 15:38:01'),
(255, 'en', 'contact_phone', '01558-259678', '2023-11-15 15:38:01', '2023-11-15 15:38:01'),
(256, 'en', 'lang', 'en', '2023-11-15 15:42:04', '2023-11-15 15:42:04'),
(257, 'en', 'light_logo', 'a:16:{s:7:\"storage\";s:5:\"local\";s:14:\"original_image\";s:39:\"images/20231115214625-light_logo166.png\";s:12:\"image_100x38\";s:0:\"\";s:11:\"image_89x33\";s:0:\"\";s:12:\"image_118x45\";s:0:\"\";s:12:\"image_138x52\";s:46:\"images/20231115214625-light_logo-138x52365.png\";s:11:\"image_48x25\";s:0:\"\";s:11:\"image_40x40\";s:0:\"\";s:13:\"image_197x152\";s:0:\"\";s:12:\"image_120x80\";s:0:\"\";s:11:\"image_82x82\";s:0:\"\";s:13:\"image_617x145\";s:0:\"\";s:13:\"image_297x203\";s:0:\"\";s:11:\"image_72x72\";s:54:\"images/20231115214625image_small_two_light_logo154.png\";s:13:\"image_270x260\";s:0:\"\";s:13:\"image_320x320\";s:0:\"\";}', '2023-11-15 15:46:25', '2023-11-15 15:46:25'),
(258, 'en', 'dark_logo', 'a:16:{s:7:\"storage\";s:5:\"local\";s:14:\"original_image\";s:38:\"images/20231115214625-dark_logo298.png\";s:12:\"image_100x38\";s:0:\"\";s:11:\"image_89x33\";s:0:\"\";s:12:\"image_118x45\";s:0:\"\";s:12:\"image_138x52\";s:45:\"images/20231115214625-dark_logo-138x52391.png\";s:11:\"image_48x25\";s:0:\"\";s:11:\"image_40x40\";s:0:\"\";s:13:\"image_197x152\";s:0:\"\";s:12:\"image_120x80\";s:0:\"\";s:11:\"image_82x82\";s:0:\"\";s:13:\"image_617x145\";s:0:\"\";s:13:\"image_297x203\";s:0:\"\";s:11:\"image_72x72\";s:52:\"images/20231115214625image_small_two_dark_logo18.png\";s:13:\"image_270x260\";s:0:\"\";s:13:\"image_320x320\";s:0:\"\";}', '2023-11-15 15:46:26', '2023-11-15 15:46:26'),
(259, 'en', 'admin_light_logo', 'a:16:{s:7:\"storage\";s:5:\"local\";s:14:\"original_image\";s:45:\"images/20231128114935-admin_light_logo317.png\";s:12:\"image_100x38\";s:52:\"images/20231128114935-admin_light_logo-100x38139.jpg\";s:11:\"image_89x33\";s:0:\"\";s:12:\"image_118x45\";s:0:\"\";s:12:\"image_138x52\";s:0:\"\";s:11:\"image_48x25\";s:0:\"\";s:11:\"image_40x40\";s:0:\"\";s:13:\"image_197x152\";s:0:\"\";s:12:\"image_120x80\";s:0:\"\";s:11:\"image_82x82\";s:0:\"\";s:13:\"image_617x145\";s:0:\"\";s:13:\"image_297x203\";s:0:\"\";s:11:\"image_72x72\";s:60:\"images/20231128114935image_small_two_admin_light_logo191.png\";s:13:\"image_270x260\";s:0:\"\";s:13:\"image_320x320\";s:0:\"\";}', '2023-11-16 06:18:03', '2023-11-28 05:49:36'),
(260, 'en', 'admin_dark_logo', 'a:16:{s:7:\"storage\";s:5:\"local\";s:14:\"original_image\";s:44:\"images/20231116121803-admin_dark_logo257.png\";s:12:\"image_100x38\";s:51:\"images/20231116121803-admin_dark_logo-100x38221.jpg\";s:11:\"image_89x33\";s:0:\"\";s:12:\"image_118x45\";s:0:\"\";s:12:\"image_138x52\";s:0:\"\";s:11:\"image_48x25\";s:0:\"\";s:11:\"image_40x40\";s:0:\"\";s:13:\"image_197x152\";s:0:\"\";s:12:\"image_120x80\";s:0:\"\";s:11:\"image_82x82\";s:0:\"\";s:13:\"image_617x145\";s:0:\"\";s:13:\"image_297x203\";s:0:\"\";s:11:\"image_72x72\";s:59:\"images/20231116121803image_small_two_admin_dark_logo420.png\";s:13:\"image_270x260\";s:0:\"\";s:13:\"image_320x320\";s:0:\"\";}', '2023-11-16 06:18:04', '2023-11-16 06:18:04'),
(261, 'en', 'invoice_logo', 'a:16:{s:7:\"storage\";s:5:\"local\";s:14:\"original_image\";s:41:\"images/20231116121804-invoice_logo115.png\";s:12:\"image_100x38\";s:0:\"\";s:11:\"image_89x33\";s:0:\"\";s:12:\"image_118x45\";s:48:\"images/20231116121804-invoice_logo-118x45165.png\";s:12:\"image_138x52\";s:0:\"\";s:11:\"image_48x25\";s:0:\"\";s:11:\"image_40x40\";s:0:\"\";s:13:\"image_197x152\";s:0:\"\";s:12:\"image_120x80\";s:0:\"\";s:11:\"image_82x82\";s:0:\"\";s:13:\"image_617x145\";s:0:\"\";s:13:\"image_297x203\";s:0:\"\";s:11:\"image_72x72\";s:56:\"images/20231116121804image_small_two_invoice_logo434.png\";s:13:\"image_270x260\";s:0:\"\";s:13:\"image_320x320\";s:0:\"\";}', '2023-11-16 06:18:04', '2023-11-16 06:18:04'),
(262, 'en', 'user_dashboard_banner', 'a:2:{s:2:\"id\";s:1:\"1\";s:6:\"images\";a:7:{s:7:\"storage\";s:5:\"local\";s:14:\"original_image\";s:44:\"images/20231115214544_original__media_35.jpg\";s:11:\"image_40x40\";s:46:\"images/20231115214544image_40x40_media_157.jpg\";s:11:\"image_72x72\";s:46:\"images/20231115214544image_72x72_media_428.jpg\";s:13:\"image_190x230\";s:48:\"images/20231115214544image_190x230_media_471.jpg\";s:13:\"image_970x400\";s:42:\"images/20231115214553image_970x400-374.png\";s:13:\"image_940x110\";s:42:\"images/20231120191339image_940x110-214.png\";}}', '2023-11-16 06:37:27', '2023-11-20 13:13:40'),
(263, 'en', 'login_banner', 'a:2:{s:2:\"id\";s:1:\"1\";s:6:\"images\";a:9:{s:7:\"storage\";s:5:\"local\";s:14:\"original_image\";s:44:\"images/20231115214544_original__media_35.jpg\";s:11:\"image_40x40\";s:46:\"images/20231115214544image_40x40_media_157.jpg\";s:11:\"image_72x72\";s:46:\"images/20231115214544image_72x72_media_428.jpg\";s:13:\"image_190x230\";s:48:\"images/20231115214544image_190x230_media_471.jpg\";s:13:\"image_970x400\";s:42:\"images/20231115214553image_970x400-374.png\";s:13:\"image_940x110\";s:42:\"images/20231120191339image_940x110-214.png\";s:13:\"image_320x852\";s:42:\"images/20231120191339image_320x852-358.png\";s:13:\"image_320x520\";s:42:\"images/20231120191340image_320x520-280.png\";}}', '2023-11-16 06:37:27', '2023-11-20 13:13:40'),
(264, 'en', 'sing_up_banner', 'a:2:{s:2:\"id\";s:1:\"1\";s:6:\"images\";a:9:{s:7:\"storage\";s:5:\"local\";s:14:\"original_image\";s:44:\"images/20231115214544_original__media_35.jpg\";s:11:\"image_40x40\";s:46:\"images/20231115214544image_40x40_media_157.jpg\";s:11:\"image_72x72\";s:46:\"images/20231115214544image_72x72_media_428.jpg\";s:13:\"image_190x230\";s:48:\"images/20231115214544image_190x230_media_471.jpg\";s:13:\"image_970x400\";s:42:\"images/20231115214553image_970x400-374.png\";s:13:\"image_940x110\";s:42:\"images/20231120191339image_940x110-214.png\";s:13:\"image_320x852\";s:42:\"images/20231120191339image_320x852-358.png\";s:13:\"image_320x520\";s:42:\"images/20231120191340image_320x520-142.png\";}}', '2023-11-16 06:37:27', '2023-11-20 13:13:40'),
(265, 'en', 'forgot_password_banner', 'a:2:{s:2:\"id\";s:0:\"\";s:6:\"images\";a:0:{}}', '2023-11-16 06:37:27', '2023-11-16 06:37:27'),
(266, 'en', 'footer_logo', 'a:16:{s:7:\"storage\";s:5:\"local\";s:14:\"original_image\";s:40:\"images/20231116143700-footer_logo198.png\";s:12:\"image_100x38\";s:0:\"\";s:11:\"image_89x33\";s:46:\"images/20231116143659-footer_logo-89x33282.png\";s:12:\"image_118x45\";s:0:\"\";s:12:\"image_138x52\";s:0:\"\";s:11:\"image_48x25\";s:0:\"\";s:11:\"image_40x40\";s:0:\"\";s:13:\"image_197x152\";s:0:\"\";s:12:\"image_120x80\";s:0:\"\";s:11:\"image_82x82\";s:0:\"\";s:13:\"image_617x145\";s:0:\"\";s:13:\"image_297x203\";s:0:\"\";s:11:\"image_72x72\";s:55:\"images/20231116143700image_small_two_footer_logo477.png\";s:13:\"image_270x260\";s:0:\"\";s:13:\"image_320x320\";s:0:\"\";}', '2023-11-16 08:37:00', '2023-11-16 08:37:00'),
(267, 'en', 'seller_sing_up_banner', 'a:2:{s:2:\"id\";s:1:\"1\";s:6:\"images\";a:8:{s:7:\"storage\";s:5:\"local\";s:14:\"original_image\";s:44:\"images/20231115214544_original__media_35.jpg\";s:11:\"image_40x40\";s:46:\"images/20231115214544image_40x40_media_157.jpg\";s:11:\"image_72x72\";s:46:\"images/20231115214544image_72x72_media_428.jpg\";s:13:\"image_190x230\";s:48:\"images/20231115214544image_190x230_media_471.jpg\";s:13:\"image_970x400\";s:42:\"images/20231115214553image_970x400-374.png\";s:13:\"image_940x110\";s:42:\"images/20231120191339image_940x110-214.png\";s:13:\"image_320x852\";s:42:\"images/20231120191339image_320x852-358.png\";}}', '2023-11-20 13:13:40', '2023-11-20 13:13:40'),
(268, 'en', 'vat_and_tax_type', 'product_base', '2023-11-27 09:56:57', '2023-11-27 09:56:57'),
(269, 'en', 'order_wise_tax_percentage', '', '2023-11-27 09:56:57', '2023-11-27 09:56:57'),
(270, 'en', 'vat_type', 'before_tax', '2023-11-27 09:56:57', '2023-11-27 09:56:57'),
(271, 'en', 'disable_guest_checkout', '0', '2023-12-12 06:02:58', '2023-12-18 08:40:43');

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `for_mobile` tinyint(1) NOT NULL DEFAULT 0,
  `action_type` varchar(191) NOT NULL,
  `link` varchar(191) NOT NULL DEFAULT '/',
  `bg_image` text DEFAULT NULL,
  `bg_image_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`id`, `order`, `status`, `for_mobile`, `action_type`, `link`, `bg_image`, `bg_image_id`, `created_at`, `updated_at`) VALUES
(2, 1, 1, 0, '', '/', '{\"storage\":\"local\",\"original_image\":\"images\\/20231115214544_original__media_35.jpg\",\"image_40x40\":\"images\\/20231115214544image_40x40_media_157.jpg\",\"image_72x72\":\"images\\/20231115214544image_72x72_media_428.jpg\",\"image_190x230\":\"images\\/20231115214544image_190x230_media_471.jpg\",\"image_970x400\":\"images\\/20231115214553image_970x400-374.png\"}', 1, '2022-06-22 13:55:21', '2023-11-15 15:45:53');

-- --------------------------------------------------------

--
-- Table structure for table `states`
--

CREATE TABLE `states` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `country_id` bigint(20) UNSIGNED NOT NULL,
  `latitude` decimal(10,8) DEFAULT NULL,
  `longitude` decimal(11,8) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `states`
--

INSERT INTO `states` (`id`, `name`, `country_id`, `latitude`, `longitude`, `status`, `created_at`, `updated_at`) VALUES
(3, 'Rajshahi', 19, NULL, NULL, 1, '2023-12-11 07:44:33', '2023-12-11 07:44:33'),
(4, 'Banani', 19, NULL, NULL, 1, '2023-12-11 08:26:41', '2023-12-11 08:26:41'),
(5, 'Uttara', 19, NULL, NULL, 1, '2023-12-11 08:26:49', '2023-12-11 08:26:49'),
(6, 'Mirpur', 19, NULL, NULL, 1, '2023-12-11 08:26:56', '2023-12-11 08:26:56'),
(7, 'Bashundhara Residential Area', 19, NULL, NULL, 1, '2023-12-11 08:27:06', '2023-12-11 08:27:06'),
(8, 'Tejgaon', 19, NULL, NULL, 1, '2023-12-11 08:27:18', '2023-12-11 08:27:18'),
(9, 'Gulshan', 19, NULL, NULL, 1, '2023-12-11 08:42:38', '2023-12-11 08:42:38'),
(10, 'Dhanmondi', 19, NULL, NULL, 1, '2023-12-11 08:42:47', '2023-12-11 08:42:47'),
(11, 'Cumilla', 19, NULL, NULL, 1, '2023-12-11 08:47:55', '2023-12-11 08:47:55'),
(12, 'Maryland', 233, NULL, NULL, 1, '2023-12-18 14:46:16', '2023-12-18 14:46:16'),
(13, 'Massachusetts', 232, NULL, NULL, 1, '2023-12-19 12:11:44', '2023-12-19 12:11:44');

-- --------------------------------------------------------

--
-- Table structure for table `subscribers`
--

CREATE TABLE `subscribers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(50) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subscribers`
--

INSERT INTO `subscribers` (`id`, `email`, `created_at`, `updated_at`) VALUES
(1, 'jannatflowersweb@gmail.com', '2023-12-19 12:28:32', '2023-12-19 12:28:32');

-- --------------------------------------------------------

--
-- Table structure for table `supports`
--

CREATE TABLE `supports` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `subject` varchar(191) NOT NULL,
  `support_department_id` varchar(191) NOT NULL,
  `priority` varchar(191) NOT NULL,
  `status` varchar(191) NOT NULL,
  `user_id` tinyint(4) NOT NULL,
  `ticket_id` longtext NOT NULL,
  `viewed` tinyint(4) NOT NULL DEFAULT 0,
  `client_viewed` tinyint(4) NOT NULL DEFAULT 0,
  `file` text DEFAULT NULL,
  `ticket_body` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `support_departments`
--

CREATE TABLE `support_departments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(191) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `support_department_languages`
--

CREATE TABLE `support_department_languages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `support_department_id` varchar(191) NOT NULL,
  `lang` varchar(10) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `theme_options`
--

CREATE TABLE `theme_options` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `options` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `theme_options`
--

INSERT INTO `theme_options` (`id`, `name`, `options`, `created_at`, `updated_at`) VALUES
(1, 'theme_one', '{\"header_style\":\"header_style1\",\"footer_style\":\"footer_style1\",\"primary_color\":\"#000000\",\"fonts\":\"roboto\"}', '2022-04-06 00:07:39', '2022-04-06 00:07:39');

-- --------------------------------------------------------

--
-- Table structure for table `throttle`
--

CREATE TABLE `throttle` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `type` varchar(191) NOT NULL,
  `ip` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ticket_replays`
--

CREATE TABLE `ticket_replays` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ticket_id` longtext NOT NULL,
  `support_id` varchar(191) DEFAULT NULL,
  `file` text DEFAULT NULL,
  `file_id` varchar(191) DEFAULT NULL,
  `replay` longtext DEFAULT NULL,
  `type` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `timezones`
--

CREATE TABLE `timezones` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `country_code` varchar(5) NOT NULL,
  `timezone` varchar(191) NOT NULL,
  `gmt_offset` varchar(8) NOT NULL,
  `dst_offset` varchar(8) NOT NULL,
  `raw_offset` varchar(8) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `timezones`
--

INSERT INTO `timezones` (`id`, `country_code`, `timezone`, `gmt_offset`, `dst_offset`, `raw_offset`, `created_at`, `updated_at`) VALUES
(1, 'AD', 'Europe/Andorra', '1.00', '2.00', '1.00', NULL, NULL),
(2, 'AE', 'Asia/Dubai', '4.00', '4.00', '4.00', NULL, NULL),
(3, 'AF', 'Asia/Kabul', '4.50', '4.50', '4.50', NULL, NULL),
(4, 'AG', 'America/Antigua', '-4.00', '-4.00', '-4.00', NULL, NULL),
(5, 'AI', 'America/Anguilla', '-4.00', '-4.00', '-4.00', NULL, NULL),
(6, 'AL', 'Europe/Tirane', '1.00', '2.00', '1.00', NULL, NULL),
(7, 'AM', 'Asia/Yerevan', '4.00', '4.00', '4.00', NULL, NULL),
(8, 'AO', 'Africa/Luanda', '1.00', '1.00', '1.00', NULL, NULL),
(9, 'AQ', 'Antarctica/Casey', '8.00', '8.00', '8.00', NULL, NULL),
(10, 'AQ', 'Antarctica/Davis', '7.00', '7.00', '7.00', NULL, NULL),
(11, 'AQ', 'Antarctica/DumontDUrville', '10.00', '10.00', '10.00', NULL, NULL),
(12, 'AQ', 'Antarctica/Mawson', '5.00', '5.00', '5.00', NULL, NULL),
(13, 'AQ', 'Antarctica/McMurdo', '13.00', '12.00', '12.00', NULL, NULL),
(14, 'AQ', 'Antarctica/Palmer', '-3.00', '-4.00', '-4.00', NULL, NULL),
(15, 'AQ', 'Antarctica/Rothera', '-3.00', '-3.00', '-3.00', NULL, NULL),
(16, 'AQ', 'Antarctica/South_Pole', '13.00', '12.00', '12.00', NULL, NULL),
(17, 'AQ', 'Antarctica/Syowa', '3.00', '3.00', '3.00', NULL, NULL),
(18, 'AQ', 'Antarctica/Vostok', '6.00', '6.00', '6.00', NULL, NULL),
(19, 'AR', 'America/Argentina/Buenos_Aires', '-3.00', '-3.00', '-3.00', NULL, NULL),
(20, 'AR', 'America/Argentina/Catamarca', '-3.00', '-3.00', '-3.00', NULL, NULL),
(21, 'AR', 'America/Argentina/Cordoba', '-3.00', '-3.00', '-3.00', NULL, NULL),
(22, 'AR', 'America/Argentina/Jujuy', '-3.00', '-3.00', '-3.00', NULL, NULL),
(23, 'AR', 'America/Argentina/La_Rioja', '-3.00', '-3.00', '-3.00', NULL, NULL),
(24, 'AR', 'America/Argentina/Mendoza', '-3.00', '-3.00', '-3.00', NULL, NULL),
(25, 'AR', 'America/Argentina/Rio_Gallegos', '-3.00', '-3.00', '-3.00', NULL, NULL),
(26, 'AR', 'America/Argentina/Salta', '-3.00', '-3.00', '-3.00', NULL, NULL),
(27, 'AR', 'America/Argentina/San_Juan', '-3.00', '-3.00', '-3.00', NULL, NULL),
(28, 'AR', 'America/Argentina/San_Luis', '-3.00', '-3.00', '-3.00', NULL, NULL),
(29, 'AR', 'America/Argentina/Tucuman', '-3.00', '-3.00', '-3.00', NULL, NULL),
(30, 'AR', 'America/Argentina/Ushuaia', '-3.00', '-3.00', '-3.00', NULL, NULL),
(31, 'AS', 'Pacific/Pago_Pago', '-11.00', '-11.00', '-11.00', NULL, NULL),
(32, 'AT', 'Europe/Vienna', '1.00', '2.00', '1.00', NULL, NULL),
(33, 'AU', 'Antarctica/Macquarie', '11.00', '11.00', '11.00', NULL, NULL),
(34, 'AU', 'Australia/Adelaide', '10.50', '9.50', '9.50', NULL, NULL),
(35, 'AU', 'Australia/Brisbane', '10.00', '10.00', '10.00', NULL, NULL),
(36, 'AU', 'Australia/Broken_Hill', '10.50', '9.50', '9.50', NULL, NULL),
(37, 'AU', 'Australia/Currie', '11.00', '10.00', '10.00', NULL, NULL),
(38, 'AU', 'Australia/Darwin', '9.50', '9.50', '9.50', NULL, NULL),
(39, 'AU', 'Australia/Eucla', '8.75', '8.75', '8.75', NULL, NULL),
(40, 'AU', 'Australia/Hobart', '11.00', '10.00', '10.00', NULL, NULL),
(41, 'AU', 'Australia/Lindeman', '10.00', '10.00', '10.00', NULL, NULL),
(42, 'AU', 'Australia/Lord_Howe', '11.00', '10.50', '10.50', NULL, NULL),
(43, 'AU', 'Australia/Melbourne', '11.00', '10.00', '10.00', NULL, NULL),
(44, 'AU', 'Australia/Perth', '8.00', '8.00', '8.00', NULL, NULL),
(45, 'AU', 'Australia/Sydney', '11.00', '10.00', '10.00', NULL, NULL),
(46, 'AW', 'America/Aruba', '-4.00', '-4.00', '-4.00', NULL, NULL),
(47, 'AX', 'Europe/Mariehamn', '2.00', '3.00', '2.00', NULL, NULL),
(48, 'AZ', 'Asia/Baku', '4.00', '5.00', '4.00', NULL, NULL),
(49, 'BA', 'Europe/Sarajevo', '1.00', '2.00', '1.00', NULL, NULL),
(50, 'BB', 'America/Barbados', '-4.00', '-4.00', '-4.00', NULL, NULL),
(51, 'BD', 'Asia/Dhaka', '6.00', '6.00', '6.00', NULL, NULL),
(52, 'BE', 'Europe/Brussels', '1.00', '2.00', '1.00', NULL, NULL),
(53, 'BF', 'Africa/Ouagadougou', '0.00', '0.00', '0.00', NULL, NULL),
(54, 'BG', 'Europe/Sofia', '2.00', '3.00', '2.00', NULL, NULL),
(55, 'BH', 'Asia/Bahrain', '3.00', '3.00', '3.00', NULL, NULL),
(56, 'BI', 'Africa/Bujumbura', '2.00', '2.00', '2.00', NULL, NULL),
(57, 'BJ', 'Africa/Porto-Novo', '1.00', '1.00', '1.00', NULL, NULL),
(58, 'BL', 'America/St_Barthelemy', '-4.00', '-4.00', '-4.00', NULL, NULL),
(59, 'BM', 'Atlantic/Bermuda', '-4.00', '-3.00', '-4.00', NULL, NULL),
(60, 'BN', 'Asia/Brunei', '8.00', '8.00', '8.00', NULL, NULL),
(61, 'BO', 'America/La_Paz', '-4.00', '-4.00', '-4.00', NULL, NULL),
(62, 'BQ', 'America/Kralendijk', '-4.00', '-4.00', '-4.00', NULL, NULL),
(63, 'BR', 'America/Araguaina', '-3.00', '-3.00', '-3.00', NULL, NULL),
(64, 'BR', 'America/Bahia', '-3.00', '-3.00', '-3.00', NULL, NULL),
(65, 'BR', 'America/Belem', '-3.00', '-3.00', '-3.00', NULL, NULL),
(66, 'BR', 'America/Boa_Vista', '-4.00', '-4.00', '-4.00', NULL, NULL),
(67, 'BR', 'America/Campo_Grande', '-3.00', '-4.00', '-4.00', NULL, NULL),
(68, 'BR', 'America/Cuiaba', '-3.00', '-4.00', '-4.00', NULL, NULL),
(69, 'BR', 'America/Eirunepe', '-5.00', '-5.00', '-5.00', NULL, NULL),
(70, 'BR', 'America/Fortaleza', '-3.00', '-3.00', '-3.00', NULL, NULL),
(71, 'BR', 'America/Maceio', '-3.00', '-3.00', '-3.00', NULL, NULL),
(72, 'BR', 'America/Manaus', '-4.00', '-4.00', '-4.00', NULL, NULL),
(73, 'BR', 'America/Noronha', '-2.00', '-2.00', '-2.00', NULL, NULL),
(74, 'BR', 'America/Porto_Velho', '-4.00', '-4.00', '-4.00', NULL, NULL),
(75, 'BR', 'America/Recife', '-3.00', '-3.00', '-3.00', NULL, NULL),
(76, 'BR', 'America/Rio_Branco', '-5.00', '-5.00', '-5.00', NULL, NULL),
(77, 'BR', 'America/Santarem', '-3.00', '-3.00', '-3.00', NULL, NULL),
(78, 'BR', 'America/Sao_Paulo', '-2.00', '-3.00', '-3.00', NULL, NULL),
(79, 'BS', 'America/Nassau', '-5.00', '-4.00', '-5.00', NULL, NULL),
(80, 'BT', 'Asia/Thimphu', '6.00', '6.00', '6.00', NULL, NULL),
(81, 'BW', 'Africa/Gaborone', '2.00', '2.00', '2.00', NULL, NULL),
(82, 'BY', 'Europe/Minsk', '3.00', '3.00', '3.00', NULL, NULL),
(83, 'BZ', 'America/Belize', '-6.00', '-6.00', '-6.00', NULL, NULL),
(84, 'CA', 'America/Atikokan', '-5.00', '-5.00', '-5.00', NULL, NULL),
(85, 'CA', 'America/Blanc-Sablon', '-4.00', '-4.00', '-4.00', NULL, NULL),
(86, 'CA', 'America/Cambridge_Bay', '-7.00', '-6.00', '-7.00', NULL, NULL),
(87, 'CA', 'America/Creston', '-7.00', '-7.00', '-7.00', NULL, NULL),
(88, 'CA', 'America/Dawson', '-8.00', '-7.00', '-8.00', NULL, NULL),
(89, 'CA', 'America/Dawson_Creek', '-7.00', '-7.00', '-7.00', NULL, NULL),
(90, 'CA', 'America/Edmonton', '-7.00', '-6.00', '-7.00', NULL, NULL),
(91, 'CA', 'America/Glace_Bay', '-4.00', '-3.00', '-4.00', NULL, NULL),
(92, 'CA', 'America/Goose_Bay', '-4.00', '-3.00', '-4.00', NULL, NULL),
(93, 'CA', 'America/Halifax', '-4.00', '-3.00', '-4.00', NULL, NULL),
(94, 'CA', 'America/Inuvik', '-7.00', '-6.00', '-7.00', NULL, NULL),
(95, 'CA', 'America/Iqaluit', '-5.00', '-4.00', '-5.00', NULL, NULL),
(96, 'CA', 'America/Moncton', '-4.00', '-3.00', '-4.00', NULL, NULL),
(97, 'CA', 'America/Montreal', '-5.00', '-4.00', '-5.00', NULL, NULL),
(98, 'CA', 'America/Nipigon', '-5.00', '-4.00', '-5.00', NULL, NULL),
(99, 'CA', 'America/Pangnirtung', '-5.00', '-4.00', '-5.00', NULL, NULL),
(100, 'CA', 'America/Rainy_River', '-6.00', '-5.00', '-6.00', NULL, NULL),
(101, 'CA', 'America/Rankin_Inlet', '-6.00', '-5.00', '-6.00', NULL, NULL),
(102, 'CA', 'America/Regina', '-6.00', '-6.00', '-6.00', NULL, NULL),
(103, 'CA', 'America/Resolute', '-6.00', '-5.00', '-6.00', NULL, NULL),
(104, 'CA', 'America/St_Johns', '-3.50', '-2.50', '-3.50', NULL, NULL),
(105, 'CA', 'America/Swift_Current', '-6.00', '-6.00', '-6.00', NULL, NULL),
(106, 'CA', 'America/Thunder_Bay', '-5.00', '-4.00', '-5.00', NULL, NULL),
(107, 'CA', 'America/Toronto', '-5.00', '-4.00', '-5.00', NULL, NULL),
(108, 'CA', 'America/Vancouver', '-8.00', '-7.00', '-8.00', NULL, NULL),
(109, 'CA', 'America/Whitehorse', '-8.00', '-7.00', '-8.00', NULL, NULL),
(110, 'CA', 'America/Winnipeg', '-6.00', '-5.00', '-6.00', NULL, NULL),
(111, 'CA', 'America/Yellowknife', '-7.00', '-6.00', '-7.00', NULL, NULL),
(112, 'CC', 'Indian/Cocos', '6.50', '6.50', '6.50', NULL, NULL),
(113, 'CD', 'Africa/Kinshasa', '1.00', '1.00', '1.00', NULL, NULL),
(114, 'CD', 'Africa/Lubumbashi', '2.00', '2.00', '2.00', NULL, NULL),
(115, 'CF', 'Africa/Bangui', '1.00', '1.00', '1.00', NULL, NULL),
(116, 'CG', 'Africa/Brazzaville', '1.00', '1.00', '1.00', NULL, NULL),
(117, 'CH', 'Europe/Zurich', '1.00', '2.00', '1.00', NULL, NULL),
(118, 'CI', 'Africa/Abidjan', '0.00', '0.00', '0.00', NULL, NULL),
(119, 'CK', 'Pacific/Rarotonga', '-10.00', '-10.00', '-10.00', NULL, NULL),
(120, 'CL', 'America/Santiago', '-3.00', '-4.00', '-4.00', NULL, NULL),
(121, 'CL', 'Pacific/Easter', '-5.00', '-6.00', '-6.00', NULL, NULL),
(122, 'CM', 'Africa/Douala', '1.00', '1.00', '1.00', NULL, NULL),
(123, 'CN', 'Asia/Chongqing', '8.00', '8.00', '8.00', NULL, NULL),
(124, 'CN', 'Asia/Harbin', '8.00', '8.00', '8.00', NULL, NULL),
(125, 'CN', 'Asia/Kashgar', '8.00', '8.00', '8.00', NULL, NULL),
(126, 'CN', 'Asia/Shanghai', '8.00', '8.00', '8.00', NULL, NULL),
(127, 'CN', 'Asia/Urumqi', '8.00', '8.00', '8.00', NULL, NULL),
(128, 'CO', 'America/Bogota', '-5.00', '-5.00', '-5.00', NULL, NULL),
(129, 'CR', 'America/Costa_Rica', '-6.00', '-6.00', '-6.00', NULL, NULL),
(130, 'CU', 'America/Havana', '-5.00', '-4.00', '-5.00', NULL, NULL),
(131, 'CV', 'Atlantic/Cape_Verde', '-1.00', '-1.00', '-1.00', NULL, NULL),
(132, 'CW', 'America/Curacao', '-4.00', '-4.00', '-4.00', NULL, NULL),
(133, 'CX', 'Indian/Christmas', '7.00', '7.00', '7.00', NULL, NULL),
(134, 'CY', 'Asia/Nicosia', '2.00', '3.00', '2.00', NULL, NULL),
(135, 'CZ', 'Europe/Prague', '1.00', '2.00', '1.00', NULL, NULL),
(136, 'DE', 'Europe/Berlin', '1.00', '2.00', '1.00', NULL, NULL),
(137, 'DE', 'Europe/Busingen', '1.00', '2.00', '1.00', NULL, NULL),
(138, 'DJ', 'Africa/Djibouti', '3.00', '3.00', '3.00', NULL, NULL),
(139, 'DK', 'Europe/Copenhagen', '1.00', '2.00', '1.00', NULL, NULL),
(140, 'DM', 'America/Dominica', '-4.00', '-4.00', '-4.00', NULL, NULL),
(141, 'DO', 'America/Santo_Domingo', '-4.00', '-4.00', '-4.00', NULL, NULL),
(142, 'DZ', 'Africa/Algiers', '1.00', '1.00', '1.00', NULL, NULL),
(143, 'EC', 'America/Guayaquil', '-5.00', '-5.00', '-5.00', NULL, NULL),
(144, 'EC', 'Pacific/Galapagos', '-6.00', '-6.00', '-6.00', NULL, NULL),
(145, 'EE', 'Europe/Tallinn', '2.00', '3.00', '2.00', NULL, NULL),
(146, 'EG', 'Africa/Cairo', '2.00', '2.00', '2.00', NULL, NULL),
(147, 'EH', 'Africa/El_Aaiun', '0.00', '0.00', '0.00', NULL, NULL),
(148, 'ER', 'Africa/Asmara', '3.00', '3.00', '3.00', NULL, NULL),
(149, 'ES', 'Africa/Ceuta', '1.00', '2.00', '1.00', NULL, NULL),
(150, 'ES', 'Atlantic/Canary', '0.00', '1.00', '0.00', NULL, NULL),
(151, 'ES', 'Europe/Madrid', '1.00', '2.00', '1.00', NULL, NULL),
(152, 'ET', 'Africa/Addis_Ababa', '3.00', '3.00', '3.00', NULL, NULL),
(153, 'FI', 'Europe/Helsinki', '2.00', '3.00', '2.00', NULL, NULL),
(154, 'FJ', 'Pacific/Fiji', '13.00', '12.00', '12.00', NULL, NULL),
(155, 'FK', 'Atlantic/Stanley', '-3.00', '-3.00', '-3.00', NULL, NULL),
(156, 'FM', 'Pacific/Chuuk', '10.00', '10.00', '10.00', NULL, NULL),
(157, 'FM', 'Pacific/Kosrae', '11.00', '11.00', '11.00', NULL, NULL),
(158, 'FM', 'Pacific/Pohnpei', '11.00', '11.00', '11.00', NULL, NULL),
(159, 'FO', 'Atlantic/Faroe', '0.00', '1.00', '0.00', NULL, NULL),
(160, 'FR', 'Europe/Paris', '1.00', '2.00', '1.00', NULL, NULL),
(161, 'GA', 'Africa/Libreville', '1.00', '1.00', '1.00', NULL, NULL),
(162, 'GB', 'Europe/London', '0.00', '1.00', '0.00', NULL, NULL),
(163, 'GD', 'America/Grenada', '-4.00', '-4.00', '-4.00', NULL, NULL),
(164, 'GE', 'Asia/Tbilisi', '4.00', '4.00', '4.00', NULL, NULL),
(165, 'GF', 'America/Cayenne', '-3.00', '-3.00', '-3.00', NULL, NULL),
(166, 'GG', 'Europe/Guernsey', '0.00', '1.00', '0.00', NULL, NULL),
(167, 'GH', 'Africa/Accra', '0.00', '0.00', '0.00', NULL, NULL),
(168, 'GI', 'Europe/Gibraltar', '1.00', '2.00', '1.00', NULL, NULL),
(169, 'GL', 'America/Danmarkshavn', '0.00', '0.00', '0.00', NULL, NULL),
(170, 'GL', 'America/Godthab', '-3.00', '-2.00', '-3.00', NULL, NULL),
(171, 'GL', 'America/Scoresbysund', '-1.00', '0.00', '-1.00', NULL, NULL),
(172, 'GL', 'America/Thule', '-4.00', '-3.00', '-4.00', NULL, NULL),
(173, 'GM', 'Africa/Banjul', '0.00', '0.00', '0.00', NULL, NULL),
(174, 'GN', 'Africa/Conakry', '0.00', '0.00', '0.00', NULL, NULL),
(175, 'GP', 'America/Guadeloupe', '-4.00', '-4.00', '-4.00', NULL, NULL),
(176, 'GQ', 'Africa/Malabo', '1.00', '1.00', '1.00', NULL, NULL),
(177, 'GR', 'Europe/Athens', '2.00', '3.00', '2.00', NULL, NULL),
(178, 'GS', 'Atlantic/South_Georgia', '-2.00', '-2.00', '-2.00', NULL, NULL),
(179, 'GT', 'America/Guatemala', '-6.00', '-6.00', '-6.00', NULL, NULL),
(180, 'GU', 'Pacific/Guam', '10.00', '10.00', '10.00', NULL, NULL),
(181, 'GW', 'Africa/Bissau', '0.00', '0.00', '0.00', NULL, NULL),
(182, 'GY', 'America/Guyana', '-4.00', '-4.00', '-4.00', NULL, NULL),
(183, 'HK', 'Asia/Hong_Kong', '8.00', '8.00', '8.00', NULL, NULL),
(184, 'HN', 'America/Tegucigalpa', '-6.00', '-6.00', '-6.00', NULL, NULL),
(185, 'HR', 'Europe/Zagreb', '1.00', '2.00', '1.00', NULL, NULL),
(186, 'HT', 'America/Port-au-Prince', '-5.00', '-4.00', '-5.00', NULL, NULL),
(187, 'HU', 'Europe/Budapest', '1.00', '2.00', '1.00', NULL, NULL),
(188, 'ID', 'Asia/Jakarta', '7.00', '7.00', '7.00', NULL, NULL),
(189, 'ID', 'Asia/Jayapura', '9.00', '9.00', '9.00', NULL, NULL),
(190, 'ID', 'Asia/Makassar', '8.00', '8.00', '8.00', NULL, NULL),
(191, 'ID', 'Asia/Pontianak', '7.00', '7.00', '7.00', NULL, NULL),
(192, 'IE', 'Europe/Dublin', '0.00', '1.00', '0.00', NULL, NULL),
(193, 'IL', 'Asia/Jerusalem', '2.00', '3.00', '2.00', NULL, NULL),
(194, 'IM', 'Europe/Isle_of_Man', '0.00', '1.00', '0.00', NULL, NULL),
(195, 'IN', 'Asia/Kolkata', '5.50', '5.50', '5.50', NULL, NULL),
(196, 'IO', 'Indian/Chagos', '6.00', '6.00', '6.00', NULL, NULL),
(197, 'IQ', 'Asia/Baghdad', '3.00', '3.00', '3.00', NULL, NULL),
(198, 'IR', 'Asia/Tehran', '3.50', '4.50', '3.50', NULL, NULL),
(199, 'IS', 'Atlantic/Reykjavik', '0.00', '0.00', '0.00', NULL, NULL),
(200, 'IT', 'Europe/Rome', '1.00', '2.00', '1.00', NULL, NULL),
(201, 'JE', 'Europe/Jersey', '0.00', '1.00', '0.00', NULL, NULL),
(202, 'JM', 'America/Jamaica', '-5.00', '-5.00', '-5.00', NULL, NULL),
(203, 'JO', 'Asia/Amman', '2.00', '3.00', '2.00', NULL, NULL),
(204, 'JP', 'Asia/Tokyo', '9.00', '9.00', '9.00', NULL, NULL),
(205, 'KE', 'Africa/Nairobi', '3.00', '3.00', '3.00', NULL, NULL),
(206, 'KG', 'Asia/Bishkek', '6.00', '6.00', '6.00', NULL, NULL),
(207, 'KH', 'Asia/Phnom_Penh', '7.00', '7.00', '7.00', NULL, NULL),
(208, 'KI', 'Pacific/Enderbury', '13.00', '13.00', '13.00', NULL, NULL),
(209, 'KI', 'Pacific/Kiritimati', '14.00', '14.00', '14.00', NULL, NULL),
(210, 'KI', 'Pacific/Tarawa', '12.00', '12.00', '12.00', NULL, NULL),
(211, 'KM', 'Indian/Comoro', '3.00', '3.00', '3.00', NULL, NULL),
(212, 'KN', 'America/St_Kitts', '-4.00', '-4.00', '-4.00', NULL, NULL),
(213, 'KP', 'Asia/Pyongyang', '9.00', '9.00', '9.00', NULL, NULL),
(214, 'KR', 'Asia/Seoul', '9.00', '9.00', '9.00', NULL, NULL),
(215, 'KW', 'Asia/Kuwait', '3.00', '3.00', '3.00', NULL, NULL),
(216, 'KY', 'America/Cayman', '-5.00', '-5.00', '-5.00', NULL, NULL),
(217, 'KZ', 'Asia/Almaty', '6.00', '6.00', '6.00', NULL, NULL),
(218, 'KZ', 'Asia/Aqtau', '5.00', '5.00', '5.00', NULL, NULL),
(219, 'KZ', 'Asia/Aqtobe', '5.00', '5.00', '5.00', NULL, NULL),
(220, 'KZ', 'Asia/Oral', '5.00', '5.00', '5.00', NULL, NULL),
(221, 'KZ', 'Asia/Qyzylorda', '6.00', '6.00', '6.00', NULL, NULL),
(222, 'LA', 'Asia/Vientiane', '7.00', '7.00', '7.00', NULL, NULL),
(223, 'LB', 'Asia/Beirut', '2.00', '3.00', '2.00', NULL, NULL),
(224, 'LC', 'America/St_Lucia', '-4.00', '-4.00', '-4.00', NULL, NULL),
(225, 'LI', 'Europe/Vaduz', '1.00', '2.00', '1.00', NULL, NULL),
(226, 'LK', 'Asia/Colombo', '5.50', '5.50', '5.50', NULL, NULL),
(227, 'LR', 'Africa/Monrovia', '0.00', '0.00', '0.00', NULL, NULL),
(228, 'LS', 'Africa/Maseru', '2.00', '2.00', '2.00', NULL, NULL),
(229, 'LT', 'Europe/Vilnius', '2.00', '3.00', '2.00', NULL, NULL),
(230, 'LU', 'Europe/Luxembourg', '1.00', '2.00', '1.00', NULL, NULL),
(231, 'LV', 'Europe/Riga', '2.00', '3.00', '2.00', NULL, NULL),
(232, 'LY', 'Africa/Tripoli', '2.00', '2.00', '2.00', NULL, NULL),
(233, 'MA', 'Africa/Casablanca', '0.00', '0.00', '0.00', NULL, NULL),
(234, 'MC', 'Europe/Monaco', '1.00', '2.00', '1.00', NULL, NULL),
(235, 'MD', 'Europe/Chisinau', '2.00', '3.00', '2.00', NULL, NULL),
(236, 'ME', 'Europe/Podgorica', '1.00', '2.00', '1.00', NULL, NULL),
(237, 'MF', 'America/Marigot', '-4.00', '-4.00', '-4.00', NULL, NULL),
(238, 'MG', 'Indian/Antananarivo', '3.00', '3.00', '3.00', NULL, NULL),
(239, 'MH', 'Pacific/Kwajalein', '12.00', '12.00', '12.00', NULL, NULL),
(240, 'MH', 'Pacific/Majuro', '12.00', '12.00', '12.00', NULL, NULL),
(241, 'MK', 'Europe/Skopje', '1.00', '2.00', '1.00', NULL, NULL),
(242, 'ML', 'Africa/Bamako', '0.00', '0.00', '0.00', NULL, NULL),
(243, 'MM', 'Asia/Rangoon', '6.50', '6.50', '6.50', NULL, NULL),
(244, 'MN', 'Asia/Choibalsan', '8.00', '8.00', '8.00', NULL, NULL),
(245, 'MN', 'Asia/Hovd', '7.00', '7.00', '7.00', NULL, NULL),
(246, 'MN', 'Asia/Ulaanbaatar', '8.00', '8.00', '8.00', NULL, NULL),
(247, 'MO', 'Asia/Macau', '8.00', '8.00', '8.00', NULL, NULL),
(248, 'MP', 'Pacific/Saipan', '10.00', '10.00', '10.00', NULL, NULL),
(249, 'MQ', 'America/Martinique', '-4.00', '-4.00', '-4.00', NULL, NULL),
(250, 'MR', 'Africa/Nouakchott', '0.00', '0.00', '0.00', NULL, NULL),
(251, 'MS', 'America/Montserrat', '-4.00', '-4.00', '-4.00', NULL, NULL),
(252, 'MT', 'Europe/Malta', '1.00', '2.00', '1.00', NULL, NULL),
(253, 'MU', 'Indian/Mauritius', '4.00', '4.00', '4.00', NULL, NULL),
(254, 'MV', 'Indian/Maldives', '5.00', '5.00', '5.00', NULL, NULL),
(255, 'MW', 'Africa/Blantyre', '2.00', '2.00', '2.00', NULL, NULL),
(256, 'MX', 'America/Bahia_Banderas', '-6.00', '-5.00', '-6.00', NULL, NULL),
(257, 'MX', 'America/Cancun', '-6.00', '-5.00', '-6.00', NULL, NULL),
(258, 'MX', 'America/Chihuahua', '-7.00', '-6.00', '-7.00', NULL, NULL),
(259, 'MX', 'America/Hermosillo', '-7.00', '-7.00', '-7.00', NULL, NULL),
(260, 'MX', 'America/Matamoros', '-6.00', '-5.00', '-6.00', NULL, NULL),
(261, 'MX', 'America/Mazatlan', '-7.00', '-6.00', '-7.00', NULL, NULL),
(262, 'MX', 'America/Merida', '-6.00', '-5.00', '-6.00', NULL, NULL),
(263, 'MX', 'America/Mexico_City', '-6.00', '-5.00', '-6.00', NULL, NULL),
(264, 'MX', 'America/Monterrey', '-6.00', '-5.00', '-6.00', NULL, NULL),
(265, 'MX', 'America/Ojinaga', '-7.00', '-6.00', '-7.00', NULL, NULL),
(266, 'MX', 'America/Santa_Isabel', '-8.00', '-7.00', '-8.00', NULL, NULL),
(267, 'MX', 'America/Tijuana', '-8.00', '-7.00', '-8.00', NULL, NULL),
(268, 'MY', 'Asia/Kuala_Lumpur', '8.00', '8.00', '8.00', NULL, NULL),
(269, 'MY', 'Asia/Kuching', '8.00', '8.00', '8.00', NULL, NULL),
(270, 'MZ', 'Africa/Maputo', '2.00', '2.00', '2.00', NULL, NULL),
(271, 'NA', 'Africa/Windhoek', '2.00', '1.00', '1.00', NULL, NULL),
(272, 'NC', 'Pacific/Noumea', '11.00', '11.00', '11.00', NULL, NULL),
(273, 'NE', 'Africa/Niamey', '1.00', '1.00', '1.00', NULL, NULL),
(274, 'NF', 'Pacific/Norfolk', '11.50', '11.50', '11.50', NULL, NULL),
(275, 'NG', 'Africa/Lagos', '1.00', '1.00', '1.00', NULL, NULL),
(276, 'NI', 'America/Managua', '-6.00', '-6.00', '-6.00', NULL, NULL),
(277, 'NL', 'Europe/Amsterdam', '1.00', '2.00', '1.00', NULL, NULL),
(278, 'NO', 'Europe/Oslo', '1.00', '2.00', '1.00', NULL, NULL),
(279, 'NP', 'Asia/Kathmandu', '5.75', '5.75', '5.75', NULL, NULL),
(280, 'NR', 'Pacific/Nauru', '12.00', '12.00', '12.00', NULL, NULL),
(281, 'NU', 'Pacific/Niue', '-11.00', '-11.00', '-11.00', NULL, NULL),
(282, 'NZ', 'Pacific/Auckland', '13.00', '12.00', '12.00', NULL, NULL),
(283, 'NZ', 'Pacific/Chatham', '13.75', '12.75', '12.75', NULL, NULL),
(284, 'OM', 'Asia/Muscat', '4.00', '4.00', '4.00', NULL, NULL),
(285, 'PA', 'America/Panama', '-5.00', '-5.00', '-5.00', NULL, NULL),
(286, 'PE', 'America/Lima', '-5.00', '-5.00', '-5.00', NULL, NULL),
(287, 'PF', 'Pacific/Gambier', '-9.00', '-9.00', '-9.00', NULL, NULL),
(288, 'PF', 'Pacific/Marquesas', '-9.50', '-9.50', '-9.50', NULL, NULL),
(289, 'PF', 'Pacific/Tahiti', '-10.00', '-10.00', '-10.00', NULL, NULL),
(290, 'PG', 'Pacific/Port_Moresby', '10.00', '10.00', '10.00', NULL, NULL),
(291, 'PH', 'Asia/Manila', '8.00', '8.00', '8.00', NULL, NULL),
(292, 'PK', 'Asia/Karachi', '5.00', '5.00', '5.00', NULL, NULL),
(293, 'PL', 'Europe/Warsaw', '1.00', '2.00', '1.00', NULL, NULL),
(294, 'PM', 'America/Miquelon', '-3.00', '-2.00', '-3.00', NULL, NULL),
(295, 'PN', 'Pacific/Pitcairn', '-8.00', '-8.00', '-8.00', NULL, NULL),
(296, 'PR', 'America/Puerto_Rico', '-4.00', '-4.00', '-4.00', NULL, NULL),
(297, 'PS', 'Asia/Gaza', '2.00', '3.00', '2.00', NULL, NULL),
(298, 'PS', 'Asia/Hebron', '2.00', '3.00', '2.00', NULL, NULL),
(299, 'PT', 'Atlantic/Azores', '-1.00', '0.00', '-1.00', NULL, NULL),
(300, 'PT', 'Atlantic/Madeira', '0.00', '1.00', '0.00', NULL, NULL),
(301, 'PT', 'Europe/Lisbon', '0.00', '1.00', '0.00', NULL, NULL),
(302, 'PW', 'Pacific/Palau', '9.00', '9.00', '9.00', NULL, NULL),
(303, 'PY', 'America/Asuncion', '-3.00', '-4.00', '-4.00', NULL, NULL),
(304, 'QA', 'Asia/Qatar', '3.00', '3.00', '3.00', NULL, NULL),
(305, 'RE', 'Indian/Reunion', '4.00', '4.00', '4.00', NULL, NULL),
(306, 'RO', 'Europe/Bucharest', '2.00', '3.00', '2.00', NULL, NULL),
(307, 'RS', 'Europe/Belgrade', '1.00', '2.00', '1.00', NULL, NULL),
(308, 'RU', 'Asia/Anadyr', '12.00', '12.00', '12.00', NULL, NULL),
(309, 'RU', 'Asia/Irkutsk', '9.00', '9.00', '9.00', NULL, NULL),
(310, 'RU', 'Asia/Kamchatka', '12.00', '12.00', '12.00', NULL, NULL),
(311, 'RU', 'Asia/Khandyga', '10.00', '10.00', '10.00', NULL, NULL),
(312, 'RU', 'Asia/Krasnoyarsk', '8.00', '8.00', '8.00', NULL, NULL),
(313, 'RU', 'Asia/Magadan', '12.00', '12.00', '12.00', NULL, NULL),
(314, 'RU', 'Asia/Novokuznetsk', '7.00', '7.00', '7.00', NULL, NULL),
(315, 'RU', 'Asia/Novosibirsk', '7.00', '7.00', '7.00', NULL, NULL),
(316, 'RU', 'Asia/Omsk', '7.00', '7.00', '7.00', NULL, NULL),
(317, 'RU', 'Asia/Sakhalin', '11.00', '11.00', '11.00', NULL, NULL),
(318, 'RU', 'Asia/Ust-Nera', '11.00', '11.00', '11.00', NULL, NULL),
(319, 'RU', 'Asia/Vladivostok', '11.00', '11.00', '11.00', NULL, NULL),
(320, 'RU', 'Asia/Yakutsk', '10.00', '10.00', '10.00', NULL, NULL),
(321, 'RU', 'Asia/Yekaterinburg', '6.00', '6.00', '6.00', NULL, NULL),
(322, 'RU', 'Europe/Kaliningrad', '3.00', '3.00', '3.00', NULL, NULL),
(323, 'RU', 'Europe/Moscow', '4.00', '4.00', '4.00', NULL, NULL),
(324, 'RU', 'Europe/Samara', '4.00', '4.00', '4.00', NULL, NULL),
(325, 'RU', 'Europe/Volgograd', '4.00', '4.00', '4.00', NULL, NULL),
(326, 'RW', 'Africa/Kigali', '2.00', '2.00', '2.00', NULL, NULL),
(327, 'SA', 'Asia/Riyadh', '3.00', '3.00', '3.00', NULL, NULL),
(328, 'SB', 'Pacific/Guadalcanal', '11.00', '11.00', '11.00', NULL, NULL),
(329, 'SC', 'Indian/Mahe', '4.00', '4.00', '4.00', NULL, NULL),
(330, 'SD', 'Africa/Khartoum', '3.00', '3.00', '3.00', NULL, NULL),
(331, 'SE', 'Europe/Stockholm', '1.00', '2.00', '1.00', NULL, NULL),
(332, 'SG', 'Asia/Singapore', '8.00', '8.00', '8.00', NULL, NULL),
(333, 'SH', 'Atlantic/St_Helena', '0.00', '0.00', '0.00', NULL, NULL),
(334, 'SI', 'Europe/Ljubljana', '1.00', '2.00', '1.00', NULL, NULL),
(335, 'SJ', 'Arctic/Longyearbyen', '1.00', '2.00', '1.00', NULL, NULL),
(336, 'SK', 'Europe/Bratislava', '1.00', '2.00', '1.00', NULL, NULL),
(337, 'SL', 'Africa/Freetown', '0.00', '0.00', '0.00', NULL, NULL),
(338, 'SM', 'Europe/San_Marino', '1.00', '2.00', '1.00', NULL, NULL),
(339, 'SN', 'Africa/Dakar', '0.00', '0.00', '0.00', NULL, NULL),
(340, 'SO', 'Africa/Mogadishu', '3.00', '3.00', '3.00', NULL, NULL),
(341, 'SR', 'America/Paramaribo', '-3.00', '-3.00', '-3.00', NULL, NULL),
(342, 'SS', 'Africa/Juba', '3.00', '3.00', '3.00', NULL, NULL),
(343, 'ST', 'Africa/Sao_Tome', '0.00', '0.00', '0.00', NULL, NULL),
(344, 'SV', 'America/El_Salvador', '-6.00', '-6.00', '-6.00', NULL, NULL),
(345, 'SX', 'America/Lower_Princes', '-4.00', '-4.00', '-4.00', NULL, NULL),
(346, 'SY', 'Asia/Damascus', '2.00', '3.00', '2.00', NULL, NULL),
(347, 'SZ', 'Africa/Mbabane', '2.00', '2.00', '2.00', NULL, NULL),
(348, 'TC', 'America/Grand_Turk', '-5.00', '-4.00', '-5.00', NULL, NULL),
(349, 'TD', 'Africa/Ndjamena', '1.00', '1.00', '1.00', NULL, NULL),
(350, 'TF', 'Indian/Kerguelen', '5.00', '5.00', '5.00', NULL, NULL),
(351, 'TG', 'Africa/Lome', '0.00', '0.00', '0.00', NULL, NULL),
(352, 'TH', 'Asia/Bangkok', '7.00', '7.00', '7.00', NULL, NULL),
(353, 'TJ', 'Asia/Dushanbe', '5.00', '5.00', '5.00', NULL, NULL),
(354, 'TK', 'Pacific/Fakaofo', '13.00', '13.00', '13.00', NULL, NULL),
(355, 'TL', 'Asia/Dili', '9.00', '9.00', '9.00', NULL, NULL),
(356, 'TM', 'Asia/Ashgabat', '5.00', '5.00', '5.00', NULL, NULL),
(357, 'TN', 'Africa/Tunis', '1.00', '1.00', '1.00', NULL, NULL),
(358, 'TO', 'Pacific/Tongatapu', '13.00', '13.00', '13.00', NULL, NULL),
(359, 'TR', 'Europe/Istanbul', '2.00', '3.00', '2.00', NULL, NULL),
(360, 'TT', 'America/Port_of_Spain', '-4.00', '-4.00', '-4.00', NULL, NULL),
(361, 'TV', 'Pacific/Funafuti', '12.00', '12.00', '12.00', NULL, NULL),
(362, 'TW', 'Asia/Taipei', '8.00', '8.00', '8.00', NULL, NULL),
(363, 'TZ', 'Africa/Dar_es_Salaam', '3.00', '3.00', '3.00', NULL, NULL),
(364, 'UA', 'Europe/Kiev', '2.00', '3.00', '2.00', NULL, NULL),
(365, 'UA', 'Europe/Simferopol', '2.00', '4.00', '4.00', NULL, NULL),
(366, 'UA', 'Europe/Uzhgorod', '2.00', '3.00', '2.00', NULL, NULL),
(367, 'UA', 'Europe/Zaporozhye', '2.00', '3.00', '2.00', NULL, NULL),
(368, 'UG', 'Africa/Kampala', '3.00', '3.00', '3.00', NULL, NULL),
(369, 'UM', 'Pacific/Johnston', '-10.00', '-10.00', '-10.00', NULL, NULL),
(370, 'UM', 'Pacific/Midway', '-11.00', '-11.00', '-11.00', NULL, NULL),
(371, 'UM', 'Pacific/Wake', '12.00', '12.00', '12.00', NULL, NULL),
(372, 'US', 'America/Adak', '-10.00', '-9.00', '-10.00', NULL, NULL),
(373, 'US', 'America/Anchorage', '-9.00', '-8.00', '-9.00', NULL, NULL),
(374, 'US', 'America/Boise', '-7.00', '-6.00', '-7.00', NULL, NULL),
(375, 'US', 'America/Chicago', '-6.00', '-5.00', '-6.00', NULL, NULL),
(376, 'US', 'America/Denver', '-7.00', '-6.00', '-7.00', NULL, NULL),
(377, 'US', 'America/Detroit', '-5.00', '-4.00', '-5.00', NULL, NULL),
(378, 'US', 'America/Indiana/Indianapolis', '-5.00', '-4.00', '-5.00', NULL, NULL),
(379, 'US', 'America/Indiana/Knox', '-6.00', '-5.00', '-6.00', NULL, NULL),
(380, 'US', 'America/Indiana/Marengo', '-5.00', '-4.00', '-5.00', NULL, NULL),
(381, 'US', 'America/Indiana/Petersburg', '-5.00', '-4.00', '-5.00', NULL, NULL),
(382, 'US', 'America/Indiana/Tell_City', '-6.00', '-5.00', '-6.00', NULL, NULL),
(383, 'US', 'America/Indiana/Vevay', '-5.00', '-4.00', '-5.00', NULL, NULL),
(384, 'US', 'America/Indiana/Vincennes', '-5.00', '-4.00', '-5.00', NULL, NULL),
(385, 'US', 'America/Indiana/Winamac', '-5.00', '-4.00', '-5.00', NULL, NULL),
(386, 'US', 'America/Juneau', '-9.00', '-8.00', '-9.00', NULL, NULL),
(387, 'US', 'America/Kentucky/Louisville', '-5.00', '-4.00', '-5.00', NULL, NULL),
(388, 'US', 'America/Kentucky/Monticello', '-5.00', '-4.00', '-5.00', NULL, NULL),
(389, 'US', 'America/Los_Angeles', '-8.00', '-7.00', '-8.00', NULL, NULL),
(390, 'US', 'America/Menominee', '-6.00', '-5.00', '-6.00', NULL, NULL),
(391, 'US', 'America/Metlakatla', '-8.00', '-8.00', '-8.00', NULL, NULL),
(392, 'US', 'America/New_York', '-5.00', '-4.00', '-5.00', NULL, NULL),
(393, 'US', 'America/Nome', '-9.00', '-8.00', '-9.00', NULL, NULL),
(394, 'US', 'America/North_Dakota/Beulah', '-6.00', '-5.00', '-6.00', NULL, NULL),
(395, 'US', 'America/North_Dakota/Center', '-6.00', '-5.00', '-6.00', NULL, NULL),
(396, 'US', 'America/North_Dakota/New_Salem', '-6.00', '-5.00', '-6.00', NULL, NULL),
(397, 'US', 'America/Phoenix', '-7.00', '-7.00', '-7.00', NULL, NULL),
(398, 'US', 'America/Shiprock', '-7.00', '-6.00', '-7.00', NULL, NULL),
(399, 'US', 'America/Sitka', '-9.00', '-8.00', '-9.00', NULL, NULL),
(400, 'US', 'America/Yakutat', '-9.00', '-8.00', '-9.00', NULL, NULL),
(401, 'US', 'Pacific/Honolulu', '-10.00', '-10.00', '-10.00', NULL, NULL),
(402, 'UY', 'America/Montevideo', '-2.00', '-3.00', '-3.00', NULL, NULL),
(403, 'UZ', 'Asia/Samarkand', '5.00', '5.00', '5.00', NULL, NULL),
(404, 'UZ', 'Asia/Tashkent', '5.00', '5.00', '5.00', NULL, NULL),
(405, 'VA', 'Europe/Vatican', '1.00', '2.00', '1.00', NULL, NULL),
(406, 'VC', 'America/St_Vincent', '-4.00', '-4.00', '-4.00', NULL, NULL),
(407, 'VE', 'America/Caracas', '-4.50', '-4.50', '-4.50', NULL, NULL),
(408, 'VG', 'America/Tortola', '-4.00', '-4.00', '-4.00', NULL, NULL),
(409, 'VI', 'America/St_Thomas', '-4.00', '-4.00', '-4.00', NULL, NULL),
(410, 'VN', 'Asia/Ho_Chi_Minh', '7.00', '7.00', '7.00', NULL, NULL),
(411, 'VU', 'Pacific/Efate', '11.00', '11.00', '11.00', NULL, NULL),
(412, 'WF', 'Pacific/Wallis', '12.00', '12.00', '12.00', NULL, NULL),
(413, 'WS', 'Pacific/Apia', '14.00', '13.00', '13.00', NULL, NULL),
(414, 'YE', 'Asia/Aden', '3.00', '3.00', '3.00', NULL, NULL),
(415, 'YT', 'Indian/Mayotte', '3.00', '3.00', '3.00', NULL, NULL),
(416, 'ZA', 'Africa/Johannesburg', '2.00', '2.00', '2.00', NULL, NULL),
(417, 'ZM', 'Africa/Lusaka', '2.00', '2.00', '2.00', NULL, NULL),
(418, 'ZW', 'Africa/Harare', '2.00', '2.00', '2.00', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `topups`
--

CREATE TABLE `topups` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `telecom` varchar(191) DEFAULT NULL,
  `user_id` varchar(191) NOT NULL,
  `uid` varchar(191) NOT NULL,
  `telephone` varchar(191) NOT NULL,
  `value` varchar(191) NOT NULL,
  `currency` varchar(191) NOT NULL,
  `payment_status` tinyint(4) NOT NULL,
  `status` varchar(191) DEFAULT NULL,
  `reason` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(191) DEFAULT NULL,
  `country_id` bigint(20) UNSIGNED DEFAULT 19,
  `phone` varchar(20) DEFAULT NULL,
  `password` varchar(191) DEFAULT NULL,
  `permissions` text DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `user_type` enum('admin','staff','seller','customer','delivery_hero','walk_in') DEFAULT 'customer',
  `gender` varchar(191) DEFAULT 'male',
  `date_of_birth` date DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0 inactive, 1 active',
  `is_user_banned` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0 unban, 1 ban',
  `ai_review_option` tinyint(1) NOT NULL DEFAULT 0,
  `newsletter_enable` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0 unable, 1 enable',
  `otp` int(11) DEFAULT NULL COMMENT 'used for reset password',
  `firebase_auth_id` varchar(100) DEFAULT NULL COMMENT 'this is for mobile app.',
  `currency_code` varchar(255) DEFAULT 'USD',
  `lang_code` varchar(191) DEFAULT 'en',
  `is_password_set` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0 for social login',
  `images` text DEFAULT NULL,
  `socials` longtext DEFAULT NULL COMMENT 'it will be array data',
  `last_login` timestamp NULL DEFAULT NULL,
  `last_ip` varchar(30) DEFAULT NULL,
  `last_password_change` timestamp NULL DEFAULT NULL,
  `image_id` bigint(20) UNSIGNED DEFAULT NULL,
  `role_id` int(10) UNSIGNED DEFAULT NULL,
  `pickup_hub_id` bigint(20) UNSIGNED DEFAULT NULL,
  `balance` double DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `country_id`, `phone`, `password`, `permissions`, `first_name`, `last_name`, `user_type`, `gender`, `date_of_birth`, `status`, `is_user_banned`, `ai_review_option`, `newsletter_enable`, `otp`, `firebase_auth_id`, `currency_code`, `lang_code`, `is_password_set`, `images`, `socials`, `last_login`, `last_ip`, `last_password_change`, `image_id`, `role_id`, `pickup_hub_id`, `balance`, `is_deleted`, `created_at`, `updated_at`) VALUES
(1, 'admin@gmail.com', 19, NULL, '$2y$10$ZJXPsY.89hvVUvkAreIdaeLlMqEzm64Not4lFgEFIsLNnaK8frtZu', '[\"customer_create\",\"customer_read\",\"customer_update\",\"customer_delete\",\"customer_ban\",\"staff_create\",\"staff_read\",\"staff_update\",\"staff_delete\",\"staff_ban\",\"role_create\",\"role_read\",\"role_update\",\"role_delete\",\"seller_create\",\"seller_read\",\"seller_update\",\"seller_delete\",\"seller_verify\",\"seller_ban\",\"seller_payout_read\",\"seller_payout_accept\",\"seller_payout_reject\",\"seller_commission_read\",\"seller_commission_update\",\"language_create\",\"language_read\",\"language_update\",\"language_delete\",\"translation_message_update\",\"media_create\",\"media_read\",\"media_update\",\"media_delete\",\"media_download\",\"brand_create\",\"brand_read\",\"brand_update\",\"brand_delete\",\"color_create\",\"color_read\",\"color_update\",\"color_delete\",\"attribute_set_create\",\"attribute_set_read\",\"attribute_set_update\",\"attribute_set_delete\",\"attribute_value_create\",\"attribute_value_read\",\"attribute_value_update\",\"attribute_value_delete\",\"category_create\",\"category_read\",\"category_update\",\"category_delete\",\"product_create\",\"product_read\",\"product_update\",\"product_delete\",\"product_restore\",\"product_clone\",\"blog_create\",\"blog_read\",\"blog_update\",\"blog_delete\",\"blog_restore\",\"blog_category_create\",\"blog_category_read\",\"blog_category_update\",\"blog_category_delete\",\"support_create\",\"support_read\",\"support_update\",\"support_delete\",\"support_department_create\",\"support_department_read\",\"support_department_update\",\"support_department_delete\",\"order_create\",\"order_read\",\"order_update\",\"order_view\",\"order_delete\",\"order_invoice\",\"order_approve_offline_payment\",\"pickup_hub_create\",\"pickup_hub_read\",\"pickup_hub_update\",\"pickup_hub_delete\",\"recharge_request_read\",\"recharge_request_status_update\",\"general_setting_update\",\"preference_setting_update\",\"email_setting_update\",\"currency_setting_update\",\"vat_tax_setting_update\",\"storage_setting_update\",\"cache_update\",\"miscellaneous_setting_update\",\"admin_panel_setting_update\",\"facebook_service_update\",\"google_service_update\",\"pusher_notification_update\",\"otp_setting_read\",\"otp_setting_update\",\"sms_template_read\",\"sms_template_update\",\"payment_gateway_read\",\"payment_gateway_update\",\"theme_option_update\",\"header_content_update\",\"footer_content_update\",\"home_page_update\",\"website_seo_update\",\"website_popup_update\",\"custom_css_update\",\"custom_js_update\",\"gdpr_update\",\"page_read\",\"page_create\",\"page_update\",\"page_delete\",\"campaign_create\",\"campaign_read\",\"campaign_update\",\"campaign_delete\",\"campaign_request_read\",\"campaign_request_approved\",\"bulk_sms_read\",\"send_bulk_sms\",\"subscriber_read\",\"subscriber_delete\",\"campaign_product_create\",\"campaign_product_read\",\"campaign_product_update\",\"campaign_product_delete\",\"coupon_read\",\"coupon_create\",\"coupon_update\",\"coupon_delete\",\"shipping_configuration_read\",\"shipping_configuration_update\",\"country_read\",\"country_update\",\"state_read\",\"state_create\",\"state_update\",\"state_delete\",\"city_read\",\"city_create\",\"city_update\",\"city_delete\",\"admin_product_sale_read\",\"seller_product_sale_read\",\"product_stock_read\",\"product_wishlist_read\",\"user_searches_read\",\"commission_history_read\",\"wallet_recharge_history_read\",\"api_setting_update\",\"android_setting_update\",\"ios_setting_update\",\"app_config_update\",\"ads_config_update\",\"download_link_update\",\"mobile_app_intro_read\",\"mobile_app_intro_create\",\"mobile_app_intro_update\",\"mobile_app_intro_delete\",\"delivery_hero_read\",\"delivery_hero_create\",\"delivery_hero_update\",\"delivery_hero_delete\",\"delivery_hero_ban\",\"Delivery_hero_account_deposit\",\"delivery_hero_email_activation\",\"delivery_hero_commission_history\",\"delivery_hero_deposit_history\",\"delivery_hero_collection_history\",\"delivery_hero_cancel_request\",\"delivery_hero_configuration_read\",\"delivery_hero_configuration_update\",\"wholesale_product_read\",\"wholesale_product_create\",\"wholesale_product_update\",\"wholesale_product_delete\",\"wholesale_product_clone\",\"wholesale_product_restore\",\"wholesale_product_setting\",\"refund_read\",\"refund_approve\",\"refund_process\",\"refund_reject\",\"refund_setting_read\",\"refund_setting_update\",\"reward_configuration_read\",\"reward_configuration_update\",\"reward_setting_read\",\"reward_setting_create\",\"reward_setting_update\",\"user_reward_read\",\"user_reward_update\",\"offline_payment_read\",\"offline_payment_create\",\"offline_payment_update\",\"offline_payment_delete\",\"service_read\",\"service_create\",\"service_update\",\"service_delete\",\"slider_read\",\"slider_create\",\"slider_update\",\"slider_delete\",\"wallet_recharge_read\",\"wallet_recharge_update\",\"login_singup_read\",\"login_singup_update\",\"chat_messenger_read\",\"chat_messenger_update\",\"social_login_setting_update\",\"video_shopping_read\",\"video_shopping_create\",\"video_shopping_update\",\"video_shopping_delete\",\"pos_config_update\",\"pos_order\",\"api_key_create\",\"api_key_update\",\"api_key_delete\",\"api_key_read\",\"api_key_read_all\",\"state_import_create\",\"city_import_create\",\"firebase_read\",\"firebase_update\",\"addon_read\",\"addon_update\",\"font_update\",\"seller_as_login\",\"package_read\",\"package_create\",\"package_update\",\"package_destroy\",\"package_status_change\",\"subscription_setting_read\",\"online_payment_read\",\"offline_payment_read\"]', 'Jannatul', 'Ferdaush', 'admin', 'male', NULL, 1, 0, 0, 0, NULL, NULL, NULL, 'en', 1, '[]', '[]', '2023-12-19 09:32:57', NULL, NULL, NULL, NULL, NULL, 97.272727272727, 0, '2022-04-06 00:07:38', '2023-12-19 09:36:06'),
(2, NULL, 19, NULL, '$2y$10$4G7oN2kI8zJAx3WBlaDUoujmIahD8LisITdXchaOd2C4MbYzOAjqS', '[]', 'Walk-In', 'Customer', 'walk_in', 'male', NULL, 1, 0, 0, 0, NULL, NULL, 'USD', 'en', 1, '[]', '[]', '2023-12-18 14:28:39', NULL, NULL, NULL, NULL, NULL, 0, 0, '2022-04-24 14:10:00', '2023-12-18 14:28:39'),
(14, 'nazib@gmail.com', 19, '01300869499', '$2y$10$dEXMNJ.uJRXtmpy8A808PuTAozpLWYrVTAdMl.pZeKHq6ILXxWS8G', '[]', 'Nazibul', 'Islam', 'customer', NULL, NULL, 1, 0, 0, 0, NULL, NULL, 'USD', 'en', 1, '[]', '[]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2023-12-12 07:07:58', '2023-12-12 07:07:58'),
(15, 'nazibul@gmail.com', 19, '135454565', '$2y$10$lLTzRKp8jzN9FfK0McNc2Ozkj8hM11BXai8nPMVe/BfSaGPS1YsMu', '[]', 'Nazibul', 'Islam', 'seller', 'male', NULL, 1, 0, 0, 0, NULL, NULL, NULL, 'en', 1, '[]', '[]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2023-12-12 07:11:00', '2023-12-12 07:11:00'),
(16, 'jannatflowersweb@gmail.com', 19, '01300869676', '$2y$10$neMctcbetNyizLeR3GG.tuDsbGHnI1c2oZZkJICuPK7qPxQVIBqTG', '[\"order_read\",\"order_create\",\"order_update\",\"order_view\",\"order_invoice\",\"order_approve_offline_payment\",\"pickup_hub_read\",\"pickup_hub_create\",\"pickup_hub_update\",\"product_read\",\"product_create\",\"product_update\",\"product_restore\",\"delivery_hero_read\",\"delivery_hero_create\",\"delivery_hero_update\",\"admin_product_sale_read\",\"seller_product_sale_read\",\"product_stock_read\",\"product_wishlist_read\",\"user_searches_read\",\"commission_history_read\",\"wallet_recharge_history_read\",\"campaign_read\",\"campaign_create\",\"country_read\",\"country_update\",\"state_read\",\"state_create\",\"state_update\",\"city_read\",\"city_create\",\"city_update\"]', 'Jannatul', 'Ferdaush', 'staff', 'male', NULL, 1, 0, 0, 0, NULL, NULL, NULL, 'en', 1, '[]', '[]', '2023-12-18 09:26:18', NULL, NULL, NULL, NULL, 0, NULL, 0, '2023-12-12 07:15:51', '2023-12-18 09:27:39');

-- --------------------------------------------------------

--
-- Table structure for table `user_socials`
--

CREATE TABLE `user_socials` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `icon` varchar(191) NOT NULL,
  `link` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vat_taxes`
--

CREATE TABLE `vat_taxes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `vat_tax` varchar(191) NOT NULL,
  `percentage` double(7,3) NOT NULL,
  `status` varchar(191) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `video_shoppings`
--

CREATE TABLE `video_shoppings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(100) NOT NULL,
  `user_id` bigint(20) NOT NULL DEFAULT 1,
  `thumbnail_id` bigint(20) DEFAULT NULL,
  `thumbnail` text DEFAULT NULL,
  `style` varchar(100) NOT NULL DEFAULT 'style_1',
  `video_type` varchar(100) DEFAULT NULL,
  `video_url` text DEFAULT NULL,
  `is_live` tinyint(4) NOT NULL DEFAULT 0,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `enable_related_product` tinyint(4) NOT NULL DEFAULT 1,
  `product_ids` varchar(191) DEFAULT NULL,
  `total_viewed` bigint(20) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `video_shopping_languages`
--

CREATE TABLE `video_shopping_languages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `video_shopping_id` bigint(20) NOT NULL,
  `lang` varchar(10) NOT NULL COMMENT 'our default locale for system en',
  `title` varchar(191) DEFAULT NULL,
  `meta_title` varchar(191) DEFAULT NULL,
  `meta_description` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `visitors`
--

CREATE TABLE `visitors` (
  `id` int(10) UNSIGNED NOT NULL,
  `unique_id` varchar(191) NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `ip` varchar(40) NOT NULL,
  `user_agent` varchar(191) DEFAULT NULL,
  `is_desktop` tinyint(1) NOT NULL DEFAULT 0,
  `is_mobile` tinyint(1) NOT NULL DEFAULT 0,
  `is_bot` tinyint(1) NOT NULL DEFAULT 0,
  `bot` varchar(191) DEFAULT NULL,
  `os` varchar(191) NOT NULL DEFAULT '',
  `browser_version` varchar(191) NOT NULL DEFAULT '',
  `browser` varchar(191) NOT NULL DEFAULT '',
  `country` varchar(191) NOT NULL DEFAULT '',
  `country_code` varchar(191) NOT NULL DEFAULT '',
  `city` varchar(191) NOT NULL DEFAULT '',
  `lat` double DEFAULT NULL,
  `long` double DEFAULT NULL,
  `browser_language_family` varchar(4) NOT NULL DEFAULT '',
  `browser_language` varchar(7) NOT NULL DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `visitor_requests`
--

CREATE TABLE `visitor_requests` (
  `id` int(10) UNSIGNED NOT NULL,
  `visitor_id` int(10) UNSIGNED NOT NULL,
  `domain` varchar(191) DEFAULT NULL,
  `method` varchar(191) DEFAULT NULL,
  `path` varchar(191) DEFAULT NULL,
  `route` varchar(191) DEFAULT NULL,
  `referer` varchar(191) DEFAULT NULL,
  `is_secure` tinyint(1) NOT NULL DEFAULT 0,
  `is_ajax` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wallets`
--

CREATE TABLE `wallets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `source` varchar(191) DEFAULT NULL COMMENT 'opening_balance, wallet_recharge,refunded_to_wallet',
  `type` varchar(191) DEFAULT NULL,
  `payment_method` varchar(191) DEFAULT NULL,
  `payment_details` text DEFAULT NULL,
  `status` varchar(191) NOT NULL DEFAULT 'pending' COMMENT 'pending, approved, rejected',
  `transaction_id` varchar(191) DEFAULT NULL,
  `image` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wallets`
--

INSERT INTO `wallets` (`id`, `user_id`, `order_id`, `amount`, `source`, `type`, `payment_method`, `payment_details`, `status`, `transaction_id`, `image`, `created_at`, `updated_at`) VALUES
(1, 1, 3, 45.454545454545, 'order_total_amount', 'income', '', '[]', 'approved', '', '[]', '2023-12-18 09:23:22', '2023-12-18 09:23:22'),
(2, 1, 3, 0.90909090909091, 'order_shipping_cost', 'income', '', '[]', 'approved', '', '[]', '2023-12-18 09:23:22', '2023-12-18 09:23:22'),
(3, 1, 4, 50, 'order_total_amount', 'income', '', '[]', 'approved', '', '[]', '2023-12-19 09:36:06', '2023-12-19 09:36:06'),
(4, 1, 4, 0.90909090909091, 'order_shipping_cost', 'income', '', '[]', 'approved', '', '[]', '2023-12-19 09:36:06', '2023-12-19 09:36:06');

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

CREATE TABLE `wishlists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wishlists`
--

INSERT INTO `wishlists` (`id`, `user_id`, `product_id`, `created_at`, `updated_at`) VALUES
(3, 1, 13, '2023-11-30 04:23:54', '2023-11-30 04:23:54'),
(4, 1, 14, '2023-11-30 05:34:42', '2023-11-30 05:34:42');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `activations`
--
ALTER TABLE `activations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `addons`
--
ALTER TABLE `addons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `affiliates`
--
ALTER TABLE `affiliates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `affiliate_options`
--
ALTER TABLE `affiliate_options`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `affiliate_states`
--
ALTER TABLE `affiliate_states`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `api_keys`
--
ALTER TABLE `api_keys`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `api_key_languages`
--
ALTER TABLE `api_key_languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `app_intros`
--
ALTER TABLE `app_intros`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `app_intro_languages`
--
ALTER TABLE `app_intro_languages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `app_intro_languages_lang_index` (`lang`);

--
-- Indexes for table `attributes`
--
ALTER TABLE `attributes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attribute_category`
--
ALTER TABLE `attribute_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attribute_languages`
--
ALTER TABLE `attribute_languages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attribute_languages_attribute_id_lang_index` (`attribute_id`,`lang`);

--
-- Indexes for table `attribute_values`
--
ALTER TABLE `attribute_values`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `blogs_user_id_status_index` (`user_id`,`status`);

--
-- Indexes for table `blog_categories`
--
ALTER TABLE `blog_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `blog_categories_slug_status_index` (`slug`,`status`);

--
-- Indexes for table `blog_category_languages`
--
ALTER TABLE `blog_category_languages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `blog_category_languages_blog_category_id_lang_index` (`blog_category_id`,`lang`);

--
-- Indexes for table `blog_comments`
--
ALTER TABLE `blog_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `blog_comments_user_id_foreign` (`user_id`),
  ADD KEY `blog_comments_blog_id_foreign` (`blog_id`);

--
-- Indexes for table `blog_comment_likes`
--
ALTER TABLE `blog_comment_likes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `blog_comment_likes_commentable_type_commentable_id_index` (`commentable_type`,`commentable_id`);

--
-- Indexes for table `blog_comment_replies`
--
ALTER TABLE `blog_comment_replies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `blog_comment_replies_user_id_foreign` (`user_id`),
  ADD KEY `blog_comment_replies_blog_comment_id_foreign` (`blog_comment_id`),
  ADD KEY `blog_comment_replies_parent_id_foreign` (`parent_id`);

--
-- Indexes for table `blog_languages`
--
ALTER TABLE `blog_languages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `blog_languages_blog_id_lang_index` (`blog_id`,`lang`);

--
-- Indexes for table `blog_views`
--
ALTER TABLE `blog_views`
  ADD PRIMARY KEY (`id`),
  ADD KEY `blog_views_user_id_foreign` (`user_id`),
  ADD KEY `blog_views_blog_id_foreign` (`blog_id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`),
  ADD KEY `brands_slug_status_index` (`slug`,`status`);

--
-- Indexes for table `brand_languages`
--
ALTER TABLE `brand_languages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `brand_languages_lang_index` (`lang`),
  ADD KEY `brand_languages_brand_id_lang_title_index` (`brand_id`,`lang`,`title`);

--
-- Indexes for table `campaigns`
--
ALTER TABLE `campaigns`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `campaigns_slug_unique` (`slug`),
  ADD KEY `campaigns_slug_start_date_end_date_status_index` (`slug`,`start_date`,`end_date`,`status`);

--
-- Indexes for table `campaign_languages`
--
ALTER TABLE `campaign_languages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `campaign_languages_campaign_id_lang_title_index` (`campaign_id`,`lang`,`title`);

--
-- Indexes for table `campaign_products`
--
ALTER TABLE `campaign_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `campaign_requests`
--
ALTER TABLE `campaign_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories_parent_id_slug_status_index` (`parent_id`,`slug`,`status`),
  ADD KEY `categories_is_featured_index` (`is_featured`),
  ADD KEY `categories_ordering_index` (`ordering`);

--
-- Indexes for table `category_languages`
--
ALTER TABLE `category_languages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_languages_category_id_lang_title_index` (`category_id`,`lang`,`title`);

--
-- Indexes for table `checkouts`
--
ALTER TABLE `checkouts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `colors`
--
ALTER TABLE `colors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `color_languages`
--
ALTER TABLE `color_languages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `color_languages_color_id_name_lang_index` (`color_id`,`name`,`lang`);

--
-- Indexes for table `commission_histories`
--
ALTER TABLE `commission_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `compare_products`
--
ALTER TABLE `compare_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact_us`
--
ALTER TABLE `contact_us`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupon_languages`
--
ALTER TABLE `coupon_languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_heroes`
--
ALTER TABLE `delivery_heroes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_hero_accounts`
--
ALTER TABLE `delivery_hero_accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_histories`
--
ALTER TABLE `delivery_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `flag_icons`
--
ALTER TABLE `flag_icons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fonts`
--
ALTER TABLE `fonts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `languages_locale_unique` (`locale`),
  ADD KEY `languages_name_index` (`name`);

--
-- Indexes for table `language_configs`
--
ALTER TABLE `language_configs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `log_activities`
--
ALTER TABLE `log_activities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ltm_translations`
--
ALTER TABLE `ltm_translations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_user_id_index` (`user_id`),
  ADD KEY `notifications_title_index` (`title`),
  ADD KEY `notifications_url_index` (`url`),
  ADD KEY `notifications_status_index` (`status`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pages_status_index` (`status`);

--
-- Indexes for table `page_languages`
--
ALTER TABLE `page_languages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `page_languages_page_id_lang_title_index` (`page_id`,`lang`,`title`);

--
-- Indexes for table `password_requests`
--
ALTER TABLE `password_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_histories`
--
ALTER TABLE `payment_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_method`
--
ALTER TABLE `payment_method`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `persistences`
--
ALTER TABLE `persistences`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `persistences_code_unique` (`code`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `pickup_hubs`
--
ALTER TABLE `pickup_hubs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pickup_hub_languages`
--
ALTER TABLE `pickup_hub_languages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pickup_hub_languages_pickup_hub_id_index` (`pickup_hub_id`),
  ADD KEY `pickup_hub_languages_lang_index` (`lang`);

--
-- Indexes for table `plugins`
--
ALTER TABLE `plugins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_category_id_user_id_slug_index` (`category_id`,`user_id`,`slug`),
  ADD KEY `products_price_special_discount_special_discount_type_index` (`price`,`special_discount`,`special_discount_type`),
  ADD KEY `products_special_discount_start_special_discount_end_index` (`special_discount_start`,`special_discount_end`),
  ADD KEY `products_current_stock_minimum_order_quantity_status_index` (`current_stock`,`minimum_order_quantity`,`status`),
  ADD KEY `products_is_approved_index` (`is_approved`);

--
-- Indexes for table `product_languages`
--
ALTER TABLE `product_languages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_languages_product_id_index` (`product_id`),
  ADD KEY `product_languages_lang_index` (`lang`);

--
-- Indexes for table `product_stocks`
--
ALTER TABLE `product_stocks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_vat_taxes`
--
ALTER TABLE `product_vat_taxes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_views`
--
ALTER TABLE `product_views`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_views_user_id_foreign` (`user_id`),
  ADD KEY `product_views_product_id_foreign` (`product_id`);

--
-- Indexes for table `refunds`
--
ALTER TABLE `refunds`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `registration_requests`
--
ALTER TABLE `registration_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reload_options`
--
ALTER TABLE `reload_options`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reminders`
--
ALTER TABLE `reminders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reviews_user_id_foreign` (`user_id`),
  ADD KEY `reviews_product_id_foreign` (`product_id`),
  ADD KEY `reviews_status_index` (`status`);

--
-- Indexes for table `review_likes`
--
ALTER TABLE `review_likes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `review_likes_user_id_foreign` (`user_id`),
  ADD KEY `review_likes_reviewable_type_reviewable_id_index` (`reviewable_type`,`reviewable_id`);

--
-- Indexes for table `review_replies`
--
ALTER TABLE `review_replies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `review_replies_user_id_foreign` (`user_id`),
  ADD KEY `review_replies_review_id_foreign` (`review_id`),
  ADD KEY `review_replies_parent_id_foreign` (`parent_id`);

--
-- Indexes for table `rewards`
--
ALTER TABLE `rewards`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reward_details`
--
ALTER TABLE `reward_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_slug_unique` (`slug`);

--
-- Indexes for table `role_users`
--
ALTER TABLE `role_users`
  ADD PRIMARY KEY (`user_id`,`role_id`);

--
-- Indexes for table `searches`
--
ALTER TABLE `searches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sellers`
--
ALTER TABLE `sellers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sellers_user_id_index` (`user_id`),
  ADD KEY `sellers_shop_name_index` (`shop_name`),
  ADD KEY `sellers_slug_index` (`slug`);

--
-- Indexes for table `seller_payouts`
--
ALTER TABLE `seller_payouts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `seller_profile_user`
--
ALTER TABLE `seller_profile_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `services_position_index` (`position`);

--
-- Indexes for table `service_languages`
--
ALTER TABLE `service_languages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `service_languages_service_id_lang_title_index` (`service_id`,`lang`,`title`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `settings_lang_index` (`lang`),
  ADD KEY `settings_title_index` (`title`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sliders_order_btn_link_status_index` (`order`,`status`),
  ADD KEY `sliders_action_type_index` (`action_type`);

--
-- Indexes for table `states`
--
ALTER TABLE `states`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscribers`
--
ALTER TABLE `subscribers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subscribers_email_index` (`email`);

--
-- Indexes for table `supports`
--
ALTER TABLE `supports`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support_departments`
--
ALTER TABLE `support_departments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support_department_languages`
--
ALTER TABLE `support_department_languages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `support_department_languages_lang_index` (`lang`);

--
-- Indexes for table `theme_options`
--
ALTER TABLE `theme_options`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `throttle`
--
ALTER TABLE `throttle`
  ADD PRIMARY KEY (`id`),
  ADD KEY `throttle_user_id_index` (`user_id`);

--
-- Indexes for table `ticket_replays`
--
ALTER TABLE `ticket_replays`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `timezones`
--
ALTER TABLE `timezones`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `topups`
--
ALTER TABLE `topups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `users_email_phone_index` (`email`,`phone`);

--
-- Indexes for table `user_socials`
--
ALTER TABLE `user_socials`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_socials_user_id_foreign` (`user_id`);

--
-- Indexes for table `vat_taxes`
--
ALTER TABLE `vat_taxes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `video_shoppings`
--
ALTER TABLE `video_shoppings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `video_shoppings_slug_index` (`slug`);

--
-- Indexes for table `video_shopping_languages`
--
ALTER TABLE `video_shopping_languages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `video_shopping_languages_video_shopping_id_index` (`video_shopping_id`),
  ADD KEY `video_shopping_languages_lang_index` (`lang`);

--
-- Indexes for table `visitors`
--
ALTER TABLE `visitors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `visitor_requests`
--
ALTER TABLE `visitor_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `visitor_requests_visitor_id_foreign` (`visitor_id`);

--
-- Indexes for table `wallets`
--
ALTER TABLE `wallets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `activations`
--
ALTER TABLE `activations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `addons`
--
ALTER TABLE `addons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `addresses`
--
ALTER TABLE `addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `affiliates`
--
ALTER TABLE `affiliates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `affiliate_options`
--
ALTER TABLE `affiliate_options`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `affiliate_states`
--
ALTER TABLE `affiliate_states`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `api_keys`
--
ALTER TABLE `api_keys`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `api_key_languages`
--
ALTER TABLE `api_key_languages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `app_intros`
--
ALTER TABLE `app_intros`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `app_intro_languages`
--
ALTER TABLE `app_intro_languages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `attributes`
--
ALTER TABLE `attributes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `attribute_category`
--
ALTER TABLE `attribute_category`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `attribute_languages`
--
ALTER TABLE `attribute_languages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `attribute_values`
--
ALTER TABLE `attribute_values`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blog_categories`
--
ALTER TABLE `blog_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blog_category_languages`
--
ALTER TABLE `blog_category_languages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blog_comments`
--
ALTER TABLE `blog_comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blog_comment_likes`
--
ALTER TABLE `blog_comment_likes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blog_comment_replies`
--
ALTER TABLE `blog_comment_replies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blog_languages`
--
ALTER TABLE `blog_languages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blog_views`
--
ALTER TABLE `blog_views`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `brand_languages`
--
ALTER TABLE `brand_languages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `campaigns`
--
ALTER TABLE `campaigns`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `campaign_languages`
--
ALTER TABLE `campaign_languages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `campaign_products`
--
ALTER TABLE `campaign_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `campaign_requests`
--
ALTER TABLE `campaign_requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `category_languages`
--
ALTER TABLE `category_languages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `checkouts`
--
ALTER TABLE `checkouts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `colors`
--
ALTER TABLE `colors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `color_languages`
--
ALTER TABLE `color_languages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `commission_histories`
--
ALTER TABLE `commission_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `compare_products`
--
ALTER TABLE `compare_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `contact_us`
--
ALTER TABLE `contact_us`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=251;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `coupon_languages`
--
ALTER TABLE `coupon_languages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `delivery_heroes`
--
ALTER TABLE `delivery_heroes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `delivery_hero_accounts`
--
ALTER TABLE `delivery_hero_accounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `delivery_histories`
--
ALTER TABLE `delivery_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `flag_icons`
--
ALTER TABLE `flag_icons`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=240;

--
-- AUTO_INCREMENT for table `fonts`
--
ALTER TABLE `fonts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `language_configs`
--
ALTER TABLE `language_configs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `log_activities`
--
ALTER TABLE `log_activities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `ltm_translations`
--
ALTER TABLE `ltm_translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=132;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `page_languages`
--
ALTER TABLE `page_languages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `password_requests`
--
ALTER TABLE `password_requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_histories`
--
ALTER TABLE `payment_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `payment_method`
--
ALTER TABLE `payment_method`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `persistences`
--
ALTER TABLE `persistences`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pickup_hubs`
--
ALTER TABLE `pickup_hubs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pickup_hub_languages`
--
ALTER TABLE `pickup_hub_languages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `plugins`
--
ALTER TABLE `plugins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `product_languages`
--
ALTER TABLE `product_languages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `product_stocks`
--
ALTER TABLE `product_stocks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `product_vat_taxes`
--
ALTER TABLE `product_vat_taxes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_views`
--
ALTER TABLE `product_views`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `refunds`
--
ALTER TABLE `refunds`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `registration_requests`
--
ALTER TABLE `registration_requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reload_options`
--
ALTER TABLE `reload_options`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reminders`
--
ALTER TABLE `reminders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `review_likes`
--
ALTER TABLE `review_likes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `review_replies`
--
ALTER TABLE `review_replies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rewards`
--
ALTER TABLE `rewards`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reward_details`
--
ALTER TABLE `reward_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `searches`
--
ALTER TABLE `searches`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sellers`
--
ALTER TABLE `sellers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `seller_payouts`
--
ALTER TABLE `seller_payouts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `seller_profile_user`
--
ALTER TABLE `seller_profile_user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `service_languages`
--
ALTER TABLE `service_languages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=272;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `states`
--
ALTER TABLE `states`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `subscribers`
--
ALTER TABLE `subscribers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `supports`
--
ALTER TABLE `supports`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `support_departments`
--
ALTER TABLE `support_departments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `support_department_languages`
--
ALTER TABLE `support_department_languages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `theme_options`
--
ALTER TABLE `theme_options`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `throttle`
--
ALTER TABLE `throttle`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ticket_replays`
--
ALTER TABLE `ticket_replays`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `timezones`
--
ALTER TABLE `timezones`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=419;

--
-- AUTO_INCREMENT for table `topups`
--
ALTER TABLE `topups`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `user_socials`
--
ALTER TABLE `user_socials`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vat_taxes`
--
ALTER TABLE `vat_taxes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `video_shoppings`
--
ALTER TABLE `video_shoppings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `video_shopping_languages`
--
ALTER TABLE `video_shopping_languages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `visitors`
--
ALTER TABLE `visitors`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `visitor_requests`
--
ALTER TABLE `visitor_requests`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wallets`
--
ALTER TABLE `wallets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `blog_comments`
--
ALTER TABLE `blog_comments`
  ADD CONSTRAINT `blog_comments_blog_id_foreign` FOREIGN KEY (`blog_id`) REFERENCES `blogs` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `blog_comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `blog_comment_replies`
--
ALTER TABLE `blog_comment_replies`
  ADD CONSTRAINT `blog_comment_replies_blog_comment_id_foreign` FOREIGN KEY (`blog_comment_id`) REFERENCES `blog_comments` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `blog_comment_replies_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `blog_comment_replies` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `blog_comment_replies_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `blog_views`
--
ALTER TABLE `blog_views`
  ADD CONSTRAINT `blog_views_blog_id_foreign` FOREIGN KEY (`blog_id`) REFERENCES `blogs` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `blog_views_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `product_views`
--
ALTER TABLE `product_views`
  ADD CONSTRAINT `product_views_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_views_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `review_likes`
--
ALTER TABLE `review_likes`
  ADD CONSTRAINT `review_likes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `review_replies`
--
ALTER TABLE `review_replies`
  ADD CONSTRAINT `review_replies_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `review_replies` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `review_replies_review_id_foreign` FOREIGN KEY (`review_id`) REFERENCES `reviews` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `review_replies_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `service_languages`
--
ALTER TABLE `service_languages`
  ADD CONSTRAINT `service_languages_service_id_foreign` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_socials`
--
ALTER TABLE `user_socials`
  ADD CONSTRAINT `user_socials_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `visitor_requests`
--
ALTER TABLE `visitor_requests`
  ADD CONSTRAINT `visitor_requests_visitor_id_foreign` FOREIGN KEY (`visitor_id`) REFERENCES `visitors` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
