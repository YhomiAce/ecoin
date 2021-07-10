-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 10, 2021 at 11:41 AM
-- Server version: 8.0.25-0ubuntu0.20.04.1
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecoin_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `adminmessages`
--

CREATE TABLE `adminmessages` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `message` text COLLATE utf8mb4_general_ci,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `deletedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `BankDeposits`
--

CREATE TABLE `BankDeposits` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `user_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `amount` decimal(65,0) DEFAULT '0',
  `image` text COLLATE utf8mb4_general_ci,
  `status` int DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `deletedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Chats`
--

CREATE TABLE `Chats` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `sender_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `receiver_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `message` text COLLATE utf8mb4_general_ci,
  `read_status` int DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `deletedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `CryptBanks`
--

CREATE TABLE `CryptBanks` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `bank_name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `acc_name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT '0',
  `acc_number` varchar(255) COLLATE utf8mb4_general_ci DEFAULT '0',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `deletedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `CyptoPayments`
--

CREATE TABLE `CyptoPayments` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `user_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `amount` decimal(65,0) DEFAULT '0',
  `customerId` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `checkoutId` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `deletedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Deposits`
--

CREATE TABLE `Deposits` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `user_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `amount` decimal(65,0) DEFAULT '0',
  `reference` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `channel` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `deletedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `DollarValues`
--

CREATE TABLE `DollarValues` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT 'dollar',
  `amount` decimal(65,0) DEFAULT '0',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `deletedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Investments`
--

CREATE TABLE `Investments` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `user_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `package_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `status` int DEFAULT NULL,
  `amount` decimal(65,0) DEFAULT '0',
  `interest` decimal(65,0) DEFAULT '0',
  `expiredAt` datetime NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `deletedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Kycs`
--

CREATE TABLE `Kycs` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `user_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_general_ci DEFAULT '0',
  `image` text COLLATE utf8mb4_general_ci,
  `status` int DEFAULT '0',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `deletedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Packages`
--

CREATE TABLE `Packages` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_general_ci,
  `dailyEarning` decimal(65,0) DEFAULT NULL,
  `price` decimal(65,0) DEFAULT NULL,
  `harsh_power` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `interest` decimal(65,0) DEFAULT '0',
  `duration` int DEFAULT '0',
  `withdrawal` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `deletedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ReferralAmounts`
--

CREATE TABLE `ReferralAmounts` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `user_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `package_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `amount` decimal(65,0) DEFAULT '0',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `deletedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `referrals`
--

CREATE TABLE `referrals` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `referral_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `user_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `deletedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ResetPasswords`
--

CREATE TABLE `ResetPasswords` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `user_email` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `token` varchar(255) COLLATE utf8mb4_general_ci DEFAULT '0',
  `status` int DEFAULT '0',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `deletedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `SequelizeMeta`
--

CREATE TABLE `SequelizeMeta` (
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `SequelizeMeta`
--

INSERT INTO `SequelizeMeta` (`name`) VALUES
('20201118095908-create-user.js'),
('20201119114047-create-package.js'),
('20201120144847-create-chat.js'),
('20201124151538-create-deposit.js'),
('20201124152056-create-transaction.js'),
('20201125104027-create-cypto-payment.js'),
('20201125141624-create-investment.js'),
('20201126143653-create-referral.js'),
('20201127101322-create-bank-deposit.js'),
('20201127154631-create-withdrawal.js'),
('20201209092949-create-kyc.js'),
('20201209142512-create-reset-password.js'),
('20201211154508-create-verification.js'),
('20201215015852-create-referral-amount.js'),
('20201218162037-create-crypt-bank.js'),
('20201222164511-create-dollar-value.js'),
('20210710091343-adminmessages.js');

-- --------------------------------------------------------

--
-- Table structure for table `Transactions`
--

CREATE TABLE `Transactions` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `user_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `amount` decimal(65,0) DEFAULT '0',
  `type` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `deletedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `activated` tinyint DEFAULT '0',
  `email_token` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `wallet` decimal(65,0) DEFAULT '0',
  `revenue` decimal(10,0) DEFAULT NULL,
  `ledger` decimal(65,0) DEFAULT NULL,
  `mining` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `walletAddress` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `referral_count` int DEFAULT '0',
  `referral_amount` decimal(65,0) DEFAULT '0',
  `password` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `reference` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `referral_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `oauth_id` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `oauth_token` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `deletedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `phone`, `activated`, `email_token`, `wallet`, `revenue`, `ledger`, `mining`, `walletAddress`, `referral_count`, `referral_amount`, `password`, `reference`, `referral_id`, `oauth_id`, `oauth_token`, `createdAt`, `updatedAt`, `deletedAt`) VALUES
('0a5573b0-e0ef-11eb-9f3e-01dbb2fe74ad', 'Samantha Smith', 'yhomiace18@gmail.com', '08137205684', 1, 'f893f106460cd38a2019fe4bc25178a7', '0', NULL, NULL, NULL, NULL, 0, '0', '$2a$10$CTbUtuyuTS1yJQjoG/uXheLfj4S9lzA0k6rL54HXG0rGfYRHJHKZm', '4496wu2j', NULL, NULL, NULL, '2021-07-09 19:51:24', '2021-07-09 20:22:32', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `Verifications`
--

CREATE TABLE `Verifications` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `user_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `email_status` int DEFAULT '0',
  `twofa_status` int DEFAULT '0',
  `twofa_image` text COLLATE utf8mb4_general_ci,
  `email_code` text COLLATE utf8mb4_general_ci,
  `twofa_code` text COLLATE utf8mb4_general_ci,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `deletedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Withdrawals`
--

CREATE TABLE `Withdrawals` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `user_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `amount` decimal(65,0) DEFAULT '0',
  `bank` text COLLATE utf8mb4_general_ci,
  `bank_code` text COLLATE utf8mb4_general_ci,
  `recipient_id` text COLLATE utf8mb4_general_ci,
  `acc_name` text COLLATE utf8mb4_general_ci,
  `acc_number` text COLLATE utf8mb4_general_ci,
  `status` int DEFAULT '0',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `deletedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `adminmessages`
--
ALTER TABLE `adminmessages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `BankDeposits`
--
ALTER TABLE `BankDeposits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Chats`
--
ALTER TABLE `Chats`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `CryptBanks`
--
ALTER TABLE `CryptBanks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `CyptoPayments`
--
ALTER TABLE `CyptoPayments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Deposits`
--
ALTER TABLE `Deposits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `DollarValues`
--
ALTER TABLE `DollarValues`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Investments`
--
ALTER TABLE `Investments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Kycs`
--
ALTER TABLE `Kycs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Packages`
--
ALTER TABLE `Packages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ReferralAmounts`
--
ALTER TABLE `ReferralAmounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `referrals`
--
ALTER TABLE `referrals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ResetPasswords`
--
ALTER TABLE `ResetPasswords`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `SequelizeMeta`
--
ALTER TABLE `SequelizeMeta`
  ADD PRIMARY KEY (`name`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `Transactions`
--
ALTER TABLE `Transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Verifications`
--
ALTER TABLE `Verifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Withdrawals`
--
ALTER TABLE `Withdrawals`
  ADD PRIMARY KEY (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
