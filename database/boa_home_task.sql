-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 18, 2024 at 07:46 PM
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
-- Database: `boa_home_task`
--
CREATE DATABASE IF NOT EXISTS `boa_home_task` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `boa_home_task`;

-- --------------------------------------------------------

--
-- Table structure for table `savedcart`
--

CREATE TABLE `savedcart` (
  `id` int(11) NOT NULL,
  `checkoutToken` varchar(191) NOT NULL,
  `productIds` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`productIds`)),
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `session`
--

CREATE TABLE `session` (
  `id` varchar(191) NOT NULL,
  `shop` varchar(191) NOT NULL,
  `state` varchar(191) NOT NULL,
  `isOnline` tinyint(1) NOT NULL DEFAULT 0,
  `scope` varchar(191) DEFAULT NULL,
  `expires` datetime(3) DEFAULT NULL,
  `accessToken` varchar(191) NOT NULL,
  `userId` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `session`
--

INSERT INTO `session` (`id`, `shop`, `state`, `isOnline`, `scope`, `expires`, `accessToken`, `userId`) VALUES
('offline_home-assignment-27.myshopify.com', 'home-assignment-27.myshopify.com', '589900537110740', 0, 'read_customers', NULL, 'shpua_06f1e09cf2514c1be6f3bb5823063559', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `_prisma_migrations`
--

CREATE TABLE `_prisma_migrations` (
  `id` varchar(36) NOT NULL,
  `checksum` varchar(64) NOT NULL,
  `finished_at` datetime(3) DEFAULT NULL,
  `migration_name` varchar(255) NOT NULL,
  `logs` text DEFAULT NULL,
  `rolled_back_at` datetime(3) DEFAULT NULL,
  `started_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `applied_steps_count` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `_prisma_migrations`
--

INSERT INTO `_prisma_migrations` (`id`, `checksum`, `finished_at`, `migration_name`, `logs`, `rolled_back_at`, `started_at`, `applied_steps_count`) VALUES
('0b2c159d-450f-4331-b0b2-237d2e9f9b14', 'caa54643107a6498054023453530026391642a6a35f2a26b390fdbd88da13b0f', '2024-01-17 09:34:51.024', '20240117093450_saved_products', NULL, NULL, '2024-01-17 09:34:50.958', 1),
('1487557f-691d-4537-862b-8b84c9bb7f41', '523844fe571ecc9908950445098509f2926e7862c1424c45e7539117a22a94cb', '2024-01-17 09:33:27.500', '20240116190407_db_migration', NULL, NULL, '2024-01-17 09:33:27.457', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `savedcart`
--
ALTER TABLE `savedcart`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `SavedCart_checkoutToken_key` (`checkoutToken`);

--
-- Indexes for table `session`
--
ALTER TABLE `session`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `_prisma_migrations`
--
ALTER TABLE `_prisma_migrations`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `savedcart`
--
ALTER TABLE `savedcart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
