-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 21, 2020 at 05:38 PM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cryptedge`
--

-- --------------------------------------------------------

--
-- Table structure for table `bankdeposits`
--

CREATE TABLE `bankdeposits` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `user_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `amount` decimal(65,0) DEFAULT 0,
  `image` text DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `deletedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bankdeposits`
--

INSERT INTO `bankdeposits` (`id`, `user_id`, `amount`, `image`, `status`, `createdAt`, `updatedAt`, `deletedAt`) VALUES
('8db006c0-30a6-11eb-bd74-23691d3208d3', '39b582b0-2e45-11eb-92b8-416d7bfabe24', '1234', 'image-1606477746464.png', 1, '2020-11-27 11:49:06', '2020-11-27 15:19:32', NULL),
('96b16f80-30a5-11eb-b3d8-e5703759a203', '39b582b0-2e45-11eb-92b8-416d7bfabe24', '123456', 'image-1606477332073.png', 1, '2020-11-27 11:42:12', '2020-11-27 15:19:35', NULL),
('af5f12c0-30a6-11eb-bd74-23691d3208d3', '39b582b0-2e45-11eb-92b8-416d7bfabe24', '1000', 'image-1606477802961.png', 0, '2020-11-27 11:50:02', '2020-11-27 15:58:50', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `chats`
--

CREATE TABLE `chats` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `sender_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `receiver_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `message` text DEFAULT NULL,
  `read_status` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `deletedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `chats`
--

INSERT INTO `chats` (`id`, `sender_id`, `receiver_id`, `message`, `read_status`, `createdAt`, `updatedAt`, `deletedAt`) VALUES
('017f0ef0-42b5-11eb-b228-d54bf46ec71c', '39b582b0-2e45-11eb-92b8-416d7bfabe24', '12ee0f50-2e43-11eb-9654-93bef81ecaad', 'is that so', 1, '2020-12-20 11:17:54', '2020-12-20 11:50:30', NULL),
('026ffb50-30b1-11eb-8b13-f18cf283fcb8', '12ee0f50-2e43-11eb-9654-93bef81ecaad', '33d87cc0-2ff9-11eb-a050-8fb53ab043b6', 'fkfkgkkgkg', 0, '2020-11-27 13:03:57', '2020-11-27 13:03:57', NULL),
('05ee01d0-42b5-11eb-b228-d54bf46ec71c', '39b582b0-2e45-11eb-92b8-416d7bfabe24', '12ee0f50-2e43-11eb-9654-93bef81ecaad', 'yes', 1, '2020-12-20 11:18:02', '2020-12-20 11:50:30', NULL),
('096ca140-42b5-11eb-b228-d54bf46ec71c', '12ee0f50-2e43-11eb-9654-93bef81ecaad', '39b582b0-2e45-11eb-92b8-416d7bfabe24', 'no p na', 1, '2020-12-20 11:18:07', '2020-12-20 11:50:45', NULL),
('0e9483e0-42b5-11eb-b228-d54bf46ec71c', '39b582b0-2e45-11eb-92b8-416d7bfabe24', '12ee0f50-2e43-11eb-9654-93bef81ecaad', 'i\'ll check it out', 1, '2020-12-20 11:18:16', '2020-12-20 11:50:30', NULL),
('122d6210-42b5-11eb-b228-d54bf46ec71c', '12ee0f50-2e43-11eb-9654-93bef81ecaad', '39b582b0-2e45-11eb-92b8-416d7bfabe24', 'i just did', 1, '2020-12-20 11:18:22', '2020-12-20 11:50:45', NULL),
('17146df0-33c9-11eb-81dc-3d71f4636e69', '39b582b0-2e45-11eb-92b8-416d7bfabe24', '12ee0f50-2e43-11eb-9654-93bef81ecaad', 'faith', 1, '2020-12-01 11:33:53', '2020-12-20 11:50:30', NULL),
('18a45990-33c5-11eb-98db-b767815bcc64', '12ee0f50-2e43-11eb-9654-93bef81ecaad', '33d87cc0-2ff9-11eb-a050-8fb53ab043b6', 'God bless Jemifor Godspower', 0, '2020-12-01 11:05:17', '2020-12-01 11:05:17', NULL),
('19f2a420-33c8-11eb-ab10-aff21958f6cf', '12ee0f50-2e43-11eb-9654-93bef81ecaad', '39b582b0-2e45-11eb-92b8-416d7bfabe24', 'Hello', 1, '2020-12-01 11:26:48', '2020-12-20 11:50:45', NULL),
('1f05a3a0-30b1-11eb-8b13-f18cf283fcb8', '12ee0f50-2e43-11eb-9654-93bef81ecaad', '33d87cc0-2ff9-11eb-a050-8fb53ab043b6', 'fllfllgg', 0, '2020-11-27 13:04:45', '2020-11-27 13:04:45', NULL),
('202f5690-30b1-11eb-8b13-f18cf283fcb8', '12ee0f50-2e43-11eb-9654-93bef81ecaad', '33d87cc0-2ff9-11eb-a050-8fb53ab043b6', 'gkkkgkg', 0, '2020-11-27 13:04:47', '2020-11-27 13:04:47', NULL),
('20a46270-33c5-11eb-98db-b767815bcc64', '12ee0f50-2e43-11eb-9654-93bef81ecaad', '39b582b0-2e45-11eb-92b8-416d7bfabe24', 'Sup', 1, '2020-12-01 11:05:31', '2020-12-20 11:50:45', NULL),
('21333200-30b1-11eb-8b13-f18cf283fcb8', '12ee0f50-2e43-11eb-9654-93bef81ecaad', '33d87cc0-2ff9-11eb-a050-8fb53ab043b6', 'gkgkk', 0, '2020-11-27 13:04:48', '2020-11-27 13:04:48', NULL),
('240bf480-30b1-11eb-8b13-f18cf283fcb8', '12ee0f50-2e43-11eb-9654-93bef81ecaad', '33d87cc0-2ff9-11eb-a050-8fb53ab043b6', 'gg', 0, '2020-11-27 13:04:53', '2020-11-27 13:04:53', NULL),
('24737320-3968-11eb-9db9-fbaa493ca3d8', 'da0a9ba0-394f-11eb-8af4-3558abd710d1', '12ee0f50-2e43-11eb-9654-93bef81ecaad', 'Admin', 1, '2020-12-08 15:15:01', '2020-12-15 16:03:33', NULL),
('29d7e570-33c9-11eb-81dc-3d71f4636e69', '12ee0f50-2e43-11eb-9654-93bef81ecaad', '39b582b0-2e45-11eb-92b8-416d7bfabe24', 'hi', 1, '2020-12-01 11:34:24', '2020-12-20 11:50:45', NULL),
('2b923c70-33c5-11eb-98db-b767815bcc64', '12ee0f50-2e43-11eb-9654-93bef81ecaad', '33d87cc0-2ff9-11eb-a050-8fb53ab043b6', 'Thank you bro', 0, '2020-12-01 11:05:49', '2020-12-01 11:05:49', NULL),
('2d95fee0-33c9-11eb-81dc-3d71f4636e69', '39b582b0-2e45-11eb-92b8-416d7bfabe24', '12ee0f50-2e43-11eb-9654-93bef81ecaad', 'gogogg', 1, '2020-12-01 11:34:31', '2020-12-20 11:50:30', NULL),
('2ffd7ed0-42b8-11eb-b2a9-3dc2f0c17cec', '12ee0f50-2e43-11eb-9654-93bef81ecaad', '39b582b0-2e45-11eb-92b8-416d7bfabe24', 'oojojk[', 1, '2020-12-20 11:40:41', '2020-12-20 11:50:45', NULL),
('326b2da0-33c9-11eb-81dc-3d71f4636e69', '12ee0f50-2e43-11eb-9654-93bef81ecaad', '39b582b0-2e45-11eb-92b8-416d7bfabe24', 'hhih', 1, '2020-12-01 11:34:39', '2020-12-20 11:50:45', NULL),
('3b44ea80-42b8-11eb-b2a9-3dc2f0c17cec', '39b582b0-2e45-11eb-92b8-416d7bfabe24', '12ee0f50-2e43-11eb-9654-93bef81ecaad', 'ijij', 1, '2020-12-20 11:41:00', '2020-12-20 11:50:30', NULL),
('3e7e6aa0-42b8-11eb-b2a9-3dc2f0c17cec', '39b582b0-2e45-11eb-92b8-416d7bfabe24', '12ee0f50-2e43-11eb-9654-93bef81ecaad', 'lllllll', 1, '2020-12-20 11:41:05', '2020-12-20 11:50:30', NULL),
('3fa6da20-33c7-11eb-ab10-aff21958f6cf', '39b582b0-2e45-11eb-92b8-416d7bfabe24', '12ee0f50-2e43-11eb-9654-93bef81ecaad', 'Good for you', 1, '2020-12-01 11:20:42', '2020-12-20 11:50:30', NULL),
('441fbf70-33c4-11eb-a4cb-c1bc70883512', '12ee0f50-2e43-11eb-9654-93bef81ecaad', '33d87cc0-2ff9-11eb-a050-8fb53ab043b6', 'goof', 0, '2020-12-01 10:59:21', '2020-12-01 10:59:21', NULL),
('45ca1410-33c4-11eb-a4cb-c1bc70883512', '12ee0f50-2e43-11eb-9654-93bef81ecaad', '33d87cc0-2ff9-11eb-a050-8fb53ab043b6', 'gkhkhkh', 0, '2020-12-01 10:59:24', '2020-12-01 10:59:24', NULL),
('46de4330-33c4-11eb-a4cb-c1bc70883512', '12ee0f50-2e43-11eb-9654-93bef81ecaad', '33d87cc0-2ff9-11eb-a050-8fb53ab043b6', 'khhkkhkhh', 0, '2020-12-01 10:59:26', '2020-12-01 10:59:26', NULL),
('5072c760-33c7-11eb-ab10-aff21958f6cf', '12ee0f50-2e43-11eb-9654-93bef81ecaad', '39b582b0-2e45-11eb-92b8-416d7bfabe24', 'so', 1, '2020-12-01 11:21:10', '2020-12-20 11:50:45', NULL),
('5c8b4670-42b4-11eb-80d9-2ba169d82b89', '39b582b0-2e45-11eb-92b8-416d7bfabe24', '12ee0f50-2e43-11eb-9654-93bef81ecaad', 'The lord is good', 1, '2020-12-20 11:13:17', '2020-12-20 11:50:30', NULL),
('5fbce510-42b9-11eb-bc4f-0d81231a55c5', '12ee0f50-2e43-11eb-9654-93bef81ecaad', '39b582b0-2e45-11eb-92b8-416d7bfabe24', 'hhhh', 1, '2020-12-20 11:49:10', '2020-12-20 11:50:45', NULL),
('73f95a40-42b4-11eb-80d9-2ba169d82b89', '12ee0f50-2e43-11eb-9654-93bef81ecaad', '39b582b0-2e45-11eb-92b8-416d7bfabe24', 'sup', 1, '2020-12-20 11:13:57', '2020-12-20 11:50:45', NULL),
('786bf920-3eef-11eb-985a-318952efe498', '39b582b0-2e45-11eb-92b8-416d7bfabe24', '12ee0f50-2e43-11eb-9654-93bef81ecaad', 'ogogoro sweet o', 1, '2020-12-15 16:06:20', '2020-12-20 11:50:30', NULL),
('7ca4c8e0-42b5-11eb-9616-bb75aa1509e4', '12ee0f50-2e43-11eb-9654-93bef81ecaad', '39b582b0-2e45-11eb-92b8-416d7bfabe24', 'You think so', 1, '2020-12-20 11:21:21', '2020-12-20 11:50:45', NULL),
('7dbe03e0-33c9-11eb-8576-e526c5cb30c5', '12ee0f50-2e43-11eb-9654-93bef81ecaad', '39b582b0-2e45-11eb-92b8-416d7bfabe24', 'dllflf', 1, '2020-12-01 11:36:45', '2020-12-20 11:50:45', NULL),
('7e38af50-42b5-11eb-9616-bb75aa1509e4', '12ee0f50-2e43-11eb-9654-93bef81ecaad', '39b582b0-2e45-11eb-92b8-416d7bfabe24', 'Yes ', 1, '2020-12-20 11:21:23', '2020-12-20 11:50:45', NULL),
('7f0e4440-42b4-11eb-80d9-2ba169d82b89', '12ee0f50-2e43-11eb-9654-93bef81ecaad', '39b582b0-2e45-11eb-92b8-416d7bfabe24', 'your papa', 1, '2020-12-20 11:14:15', '2020-12-20 11:50:45', NULL),
('7f70b260-33c8-11eb-919b-0516fd059473', '12ee0f50-2e43-11eb-9654-93bef81ecaad', '39b582b0-2e45-11eb-92b8-416d7bfabe24', 'life', 1, '2020-12-01 11:29:38', '2020-12-20 11:50:45', NULL),
('877f8850-33c8-11eb-919b-0516fd059473', '39b582b0-2e45-11eb-92b8-416d7bfabe24', '12ee0f50-2e43-11eb-9654-93bef81ecaad', 'goof', 1, '2020-12-01 11:29:52', '2020-12-20 11:50:30', NULL),
('8b10cd20-42b5-11eb-9616-bb75aa1509e4', '12ee0f50-2e43-11eb-9654-93bef81ecaad', '39b582b0-2e45-11eb-92b8-416d7bfabe24', 'just now just now', 1, '2020-12-20 11:21:45', '2020-12-20 11:50:45', NULL),
('9137a930-42b5-11eb-9616-bb75aa1509e4', '39b582b0-2e45-11eb-92b8-416d7bfabe24', '12ee0f50-2e43-11eb-9654-93bef81ecaad', 'sure', 1, '2020-12-20 11:21:55', '2020-12-20 11:50:30', NULL),
('936442a0-42b4-11eb-80d9-2ba169d82b89', '39b582b0-2e45-11eb-92b8-416d7bfabe24', '12ee0f50-2e43-11eb-9654-93bef81ecaad', 'You no dey try o', 1, '2020-12-20 11:14:49', '2020-12-20 11:50:30', NULL),
('9371e4f0-42b9-11eb-a1cf-4b8f3347b9e4', '12ee0f50-2e43-11eb-9654-93bef81ecaad', '39b582b0-2e45-11eb-92b8-416d7bfabe24', 'hhhhh', 1, '2020-12-20 11:50:37', '2020-12-20 11:50:45', NULL),
('95d8fa30-3ee5-11eb-b16b-9f09f4fce292', '4a008f60-3936-11eb-bec5-5771a4ea791b', '12ee0f50-2e43-11eb-9654-93bef81ecaad', 'Hello', 1, '2020-12-15 14:55:34', '2020-12-15 14:59:32', NULL),
('96dd9570-42b5-11eb-9616-bb75aa1509e4', '12ee0f50-2e43-11eb-9654-93bef81ecaad', '39b582b0-2e45-11eb-92b8-416d7bfabe24', 'okay', 1, '2020-12-20 11:22:05', '2020-12-20 11:50:45', NULL),
('99c747e0-42b5-11eb-9616-bb75aa1509e4', '12ee0f50-2e43-11eb-9654-93bef81ecaad', '39b582b0-2e45-11eb-92b8-416d7bfabe24', 'Maybe shall', 1, '2020-12-20 11:22:10', '2020-12-20 11:50:45', NULL),
('9a0530b0-42b4-11eb-80d9-2ba169d82b89', '12ee0f50-2e43-11eb-9654-93bef81ecaad', '39b582b0-2e45-11eb-92b8-416d7bfabe24', 'you think so', 1, '2020-12-20 11:15:01', '2020-12-20 11:50:45', NULL),
('9c331af0-42b9-11eb-a1cf-4b8f3347b9e4', '39b582b0-2e45-11eb-92b8-416d7bfabe24', '12ee0f50-2e43-11eb-9654-93bef81ecaad', 'kkkk', 0, '2020-12-20 11:50:52', '2020-12-20 11:50:52', NULL),
('9e6f4f50-42b9-11eb-a1cf-4b8f3347b9e4', '39b582b0-2e45-11eb-92b8-416d7bfabe24', '12ee0f50-2e43-11eb-9654-93bef81ecaad', 'kkkk', 0, '2020-12-20 11:50:55', '2020-12-20 11:50:55', NULL),
('9e7498c0-42b4-11eb-80d9-2ba169d82b89', '39b582b0-2e45-11eb-92b8-416d7bfabe24', '12ee0f50-2e43-11eb-9654-93bef81ecaad', 'yes', 1, '2020-12-20 11:15:08', '2020-12-20 11:50:30', NULL),
('9ebc5ab0-42b5-11eb-9616-bb75aa1509e4', '39b582b0-2e45-11eb-92b8-416d7bfabe24', '12ee0f50-2e43-11eb-9654-93bef81ecaad', 'i\'ll check it out', 1, '2020-12-20 11:22:18', '2020-12-20 11:50:30', NULL),
('9ec616a0-3eef-11eb-985a-318952efe498', '12ee0f50-2e43-11eb-9654-93bef81ecaad', '39b582b0-2e45-11eb-92b8-416d7bfabe24', 'okayu', 1, '2020-12-15 16:07:24', '2020-12-20 11:50:45', NULL),
('a00ece80-42b9-11eb-a1cf-4b8f3347b9e4', '39b582b0-2e45-11eb-92b8-416d7bfabe24', '12ee0f50-2e43-11eb-9654-93bef81ecaad', 'kkk', 0, '2020-12-20 11:50:58', '2020-12-20 11:50:58', NULL),
('a42cdf10-42b5-11eb-9616-bb75aa1509e4', '12ee0f50-2e43-11eb-9654-93bef81ecaad', '39b582b0-2e45-11eb-92b8-416d7bfabe24', 'nothing to worry about', 1, '2020-12-20 11:22:27', '2020-12-20 11:50:45', NULL),
('a45be180-42b9-11eb-a1cf-4b8f3347b9e4', '12ee0f50-2e43-11eb-9654-93bef81ecaad', '39b582b0-2e45-11eb-92b8-416d7bfabe24', 'injjj', 0, '2020-12-20 11:51:05', '2020-12-20 11:51:05', NULL),
('a987b890-42b5-11eb-9616-bb75aa1509e4', '39b582b0-2e45-11eb-92b8-416d7bfabe24', '12ee0f50-2e43-11eb-9654-93bef81ecaad', 'normal level shall', 1, '2020-12-20 11:22:36', '2020-12-20 11:50:30', NULL),
('af399640-42b6-11eb-998d-2733d47c2500', '12ee0f50-2e43-11eb-9654-93bef81ecaad', '39b582b0-2e45-11eb-92b8-416d7bfabe24', 'jjjjj', 1, '2020-12-20 11:29:55', '2020-12-20 11:50:45', NULL),
('b3158d60-42b5-11eb-9616-bb75aa1509e4', '39b582b0-2e45-11eb-92b8-416d7bfabe24', '12ee0f50-2e43-11eb-9654-93bef81ecaad', 'maybe na your fault', 1, '2020-12-20 11:22:52', '2020-12-20 11:50:30', NULL),
('b3318460-42b6-11eb-998d-2733d47c2500', '39b582b0-2e45-11eb-92b8-416d7bfabe24', '12ee0f50-2e43-11eb-9654-93bef81ecaad', 'jjnnjnjjj', 1, '2020-12-20 11:30:02', '2020-12-20 11:50:30', NULL),
('b46c7830-33ca-11eb-be52-ff6487cd0a14', '12ee0f50-2e43-11eb-9654-93bef81ecaad', '39b582b0-2e45-11eb-92b8-416d7bfabe24', 'you dey mad', 1, '2020-12-01 11:45:26', '2020-12-20 11:50:45', NULL),
('b67564c0-42b6-11eb-998d-2733d47c2500', '12ee0f50-2e43-11eb-9654-93bef81ecaad', '39b582b0-2e45-11eb-92b8-416d7bfabe24', 'jjojjj', 1, '2020-12-20 11:30:07', '2020-12-20 11:50:45', NULL),
('b910c860-33c9-11eb-bf2a-ab34088b531e', '39b582b0-2e45-11eb-92b8-416d7bfabe24', '12ee0f50-2e43-11eb-9654-93bef81ecaad', 'Hello Admin', 1, '2020-12-01 11:38:25', '2020-12-20 11:50:30', NULL),
('ba3db760-42b6-11eb-998d-2733d47c2500', '39b582b0-2e45-11eb-92b8-416d7bfabe24', '12ee0f50-2e43-11eb-9654-93bef81ecaad', 'jjijoj]', 1, '2020-12-20 11:30:14', '2020-12-20 11:50:30', NULL),
('bd247910-42b5-11eb-9616-bb75aa1509e4', '12ee0f50-2e43-11eb-9654-93bef81ecaad', '39b582b0-2e45-11eb-92b8-416d7bfabe24', 'am not sure its my fault', 1, '2020-12-20 11:23:09', '2020-12-20 11:50:45', NULL),
('c0fa8bd0-3eda-11eb-b16b-9f09f4fce292', 'da0a9ba0-394f-11eb-8af4-3558abd710d1', '12ee0f50-2e43-11eb-9654-93bef81ecaad', 'Issues with my dasboard', 1, '2020-12-15 13:38:02', '2020-12-15 16:03:33', NULL),
('c5413480-33c9-11eb-bf2a-ab34088b531e', '12ee0f50-2e43-11eb-9654-93bef81ecaad', '39b582b0-2e45-11eb-92b8-416d7bfabe24', 'whATS UP', 1, '2020-12-01 11:38:45', '2020-12-20 11:50:45', NULL),
('c6af8ec0-42b5-11eb-9616-bb75aa1509e4', '12ee0f50-2e43-11eb-9654-93bef81ecaad', '39b582b0-2e45-11eb-92b8-416d7bfabe24', 'i am sure bro, its your fault', 1, '2020-12-20 11:23:25', '2020-12-20 11:50:45', NULL),
('cab78540-33c9-11eb-bf2a-ab34088b531e', '39b582b0-2e45-11eb-92b8-416d7bfabe24', '12ee0f50-2e43-11eb-9654-93bef81ecaad', 'iM GOOD', 1, '2020-12-01 11:38:54', '2020-12-20 11:50:30', NULL),
('cd915930-33c9-11eb-bf2a-ab34088b531e', '12ee0f50-2e43-11eb-9654-93bef81ecaad', '39b582b0-2e45-11eb-92b8-416d7bfabe24', 'TOY', 1, '2020-12-01 11:38:59', '2020-12-20 11:50:45', NULL),
('d54787d0-33c9-11eb-bf2a-ab34088b531e', '39b582b0-2e45-11eb-92b8-416d7bfabe24', '12ee0f50-2e43-11eb-9654-93bef81ecaad', 'YOUR FARTHERP', 1, '2020-12-01 11:39:12', '2020-12-20 11:50:30', NULL),
('dedacd80-42b4-11eb-b228-d54bf46ec71c', '12ee0f50-2e43-11eb-9654-93bef81ecaad', '39b582b0-2e45-11eb-92b8-416d7bfabe24', 'Lets start', 1, '2020-12-20 11:16:56', '2020-12-20 11:50:45', NULL),
('e5215770-33ca-11eb-be52-ff6487cd0a14', '39b582b0-2e45-11eb-92b8-416d7bfabe24', '12ee0f50-2e43-11eb-9654-93bef81ecaad', 'sup', 1, '2020-12-01 11:46:48', '2020-12-20 11:50:30', NULL),
('e5a75f70-42b4-11eb-b228-d54bf46ec71c', '39b582b0-2e45-11eb-92b8-416d7bfabe24', '12ee0f50-2e43-11eb-9654-93bef81ecaad', 'from', 1, '2020-12-20 11:17:07', '2020-12-20 11:50:30', NULL),
('ea466300-42b4-11eb-b228-d54bf46ec71c', '12ee0f50-2e43-11eb-9654-93bef81ecaad', '39b582b0-2e45-11eb-92b8-416d7bfabe24', 'where', 1, '2020-12-20 11:17:15', '2020-12-20 11:50:45', NULL),
('efbf63c0-33ca-11eb-be52-ff6487cd0a14', '39b582b0-2e45-11eb-92b8-416d7bfabe24', '12ee0f50-2e43-11eb-9654-93bef81ecaad', 'I thought as much', 1, '2020-12-01 11:47:06', '2020-12-20 11:50:30', NULL),
('f0c1a0a0-42b4-11eb-b228-d54bf46ec71c', '39b582b0-2e45-11eb-92b8-416d7bfabe24', '12ee0f50-2e43-11eb-9654-93bef81ecaad', 'the new place of course', 1, '2020-12-20 11:17:26', '2020-12-20 11:50:30', NULL),
('f37c2cc0-42b4-11eb-b228-d54bf46ec71c', '12ee0f50-2e43-11eb-9654-93bef81ecaad', '39b582b0-2e45-11eb-92b8-416d7bfabe24', 'okay', 1, '2020-12-20 11:17:31', '2020-12-20 11:50:45', NULL),
('f737d1e0-30b0-11eb-8b13-f18cf283fcb8', '12ee0f50-2e43-11eb-9654-93bef81ecaad', '33d87cc0-2ff9-11eb-a050-8fb53ab043b6', 'hello', 0, '2020-11-27 13:03:38', '2020-11-27 13:03:38', NULL),
('f83ebde0-42b4-11eb-b228-d54bf46ec71c', '39b582b0-2e45-11eb-92b8-416d7bfabe24', '12ee0f50-2e43-11eb-9654-93bef81ecaad', 'sure, i like the idea', 1, '2020-12-20 11:17:39', '2020-12-20 11:50:30', NULL),
('fa1e9e20-30b0-11eb-8b13-f18cf283fcb8', '12ee0f50-2e43-11eb-9654-93bef81ecaad', '33d87cc0-2ff9-11eb-a050-8fb53ab043b6', 'how are you', 0, '2020-11-27 13:03:43', '2020-11-27 13:03:43', NULL),
('fd4ea860-30b0-11eb-8b13-f18cf283fcb8', '12ee0f50-2e43-11eb-9654-93bef81ecaad', '33d87cc0-2ff9-11eb-a050-8fb53ab043b6', ' am good and you', 0, '2020-11-27 13:03:48', '2020-11-27 13:03:48', NULL),
('fde100a0-42b4-11eb-b228-d54bf46ec71c', '12ee0f50-2e43-11eb-9654-93bef81ecaad', '39b582b0-2e45-11eb-92b8-416d7bfabe24', 'not so bad after all', 1, '2020-12-20 11:17:48', '2020-12-20 11:50:45', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cryptbanks`
--

CREATE TABLE `cryptbanks` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `bank_name` varchar(255) DEFAULT NULL,
  `acc_name` varchar(255) DEFAULT '0',
  `acc_number` varchar(255) DEFAULT '0',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `deletedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cryptbanks`
--

INSERT INTO `cryptbanks` (`id`, `bank_name`, `acc_name`, `acc_number`, `createdAt`, `updatedAt`, `deletedAt`) VALUES
('5bb582b0-2e45-11eb-92b8-416d7bfabe24', 'Fidelity Bank Plc', 'Cryptedge Blockchain Solutions LTD', '4210003539', '0000-00-00 00:00:00', '2020-12-18 19:47:47', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cyptopayments`
--

CREATE TABLE `cyptopayments` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `user_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `amount` decimal(65,0) DEFAULT 0,
  `customerId` varchar(255) DEFAULT NULL,
  `checkoutId` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `deletedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cyptopayments`
--

INSERT INTO `cyptopayments` (`id`, `user_id`, `amount`, `customerId`, `checkoutId`, `status`, `url`, `createdAt`, `updatedAt`, `deletedAt`) VALUES
('170774d0-2f17-11eb-bbd2-3589d0a940e0', '39b582b0-2e45-11eb-92b8-416d7bfabe24', '1234', '0df041a430e5', '0a20e79fa461', 'NEW', 'https://www.coinqvest.com/en/checkout/0a20e79fa461', '2020-11-25 12:09:38', '2020-11-25 12:09:38', NULL),
('2c474180-2f18-11eb-84da-a1e3d3745d28', '39b582b0-2e45-11eb-92b8-416d7bfabe24', '123456', '0df041a430e5', '53330b6e744d', 'NEW', 'https://www.coinqvest.com/en/checkout/53330b6e744d', '2020-11-25 12:17:23', '2020-11-25 12:17:23', NULL),
('34179260-2f19-11eb-a854-d5b39aafd31f', '39b582b0-2e45-11eb-92b8-416d7bfabe24', '123456', '0df041a430e5', 'dc90a0c24f7a', 'NEW', 'https://www.coinqvest.com/en/checkout/dc90a0c24f7a', '2020-11-25 12:24:45', '2020-11-25 12:24:45', NULL),
('3831e780-2f17-11eb-a30d-554b80081f7f', '39b582b0-2e45-11eb-92b8-416d7bfabe24', '1234', '0df041a430e5', '674f2551aec3', 'NEW', 'https://www.coinqvest.com/en/checkout/674f2551aec3', '2020-11-25 12:10:33', '2020-11-25 12:10:33', NULL),
('40f99810-2f15-11eb-884f-c141d63a9b95', '39b582b0-2e45-11eb-92b8-416d7bfabe24', '1234', '0df041a430e5', 'f89d42962e61', 'NEW', 'https://www.coinqvest.com/en/checkout/f89d42962e61', '2020-11-25 11:56:29', '2020-11-25 11:56:29', NULL),
('47a2bc20-2f18-11eb-8651-077168ef6dcf', '39b582b0-2e45-11eb-92b8-416d7bfabe24', '1234', '0df041a430e5', 'f16f636e7ecc', 'NEW', 'https://www.coinqvest.com/en/checkout/f16f636e7ecc', '2020-11-25 12:18:09', '2020-11-25 12:18:09', NULL),
('48ee9d10-2f18-11eb-8651-077168ef6dcf', '39b582b0-2e45-11eb-92b8-416d7bfabe24', '1234', '0df041a430e5', 'bdb8035c2b56', 'NEW', 'https://www.coinqvest.com/en/checkout/bdb8035c2b56', '2020-11-25 12:18:11', '2020-11-25 12:18:11', NULL),
('5c25b360-2f17-11eb-a845-ab01a47413db', '39b582b0-2e45-11eb-92b8-416d7bfabe24', '1234', '0df041a430e5', '7dc39a83f092', 'NEW', 'https://www.coinqvest.com/en/checkout/7dc39a83f092', '2020-11-25 12:11:34', '2020-11-25 12:11:34', NULL),
('751e9070-2f18-11eb-a516-a717f880a30b', '39b582b0-2e45-11eb-92b8-416d7bfabe24', '123456', '0df041a430e5', 'aab79e73b141', 'NEW', 'https://www.coinqvest.com/en/checkout/aab79e73b141', '2020-11-25 12:19:25', '2020-11-25 12:19:25', NULL),
('83616930-2f15-11eb-b67e-93bfd6798a8c', '39b582b0-2e45-11eb-92b8-416d7bfabe24', '1234', '0df041a430e5', '676b4b980264', 'NEW', 'https://www.coinqvest.com/en/checkout/676b4b980264', '2020-11-25 11:58:20', '2020-11-25 11:58:20', NULL),
('a1dcc4a0-2f19-11eb-b795-b59bbc4c6727', '39b582b0-2e45-11eb-92b8-416d7bfabe24', '123456', '0df041a430e5', '75a236e3a886', 'NEW', 'https://www.coinqvest.com/en/checkout/75a236e3a886', '2020-11-25 12:27:50', '2020-11-25 12:27:50', NULL),
('c112e8c0-2f16-11eb-99a1-03ca69202804', '39b582b0-2e45-11eb-92b8-416d7bfabe24', '1234', '0df041a430e5', 'ffe7eb1b7c3c', 'NEW', 'https://www.coinqvest.com/en/checkout/ffe7eb1b7c3c', '2020-11-25 12:07:14', '2020-11-25 12:07:14', NULL),
('cf00aa60-2f18-11eb-a589-eb1d7d987dad', '39b582b0-2e45-11eb-92b8-416d7bfabe24', '1234', '0df041a430e5', '451aef86665a', 'NEW', 'https://www.coinqvest.com/en/checkout/451aef86665a', '2020-11-25 12:21:56', '2020-11-25 12:21:56', NULL),
('df184320-2f15-11eb-b33f-4b6164b47ca8', '39b582b0-2e45-11eb-92b8-416d7bfabe24', '1234', '0df041a430e5', 'cd644bffa808', 'NEW', 'https://www.coinqvest.com/en/checkout/cd644bffa808', '2020-11-25 12:00:54', '2020-11-25 12:00:54', NULL),
('df948290-2f16-11eb-83bc-4503451fd5da', '39b582b0-2e45-11eb-92b8-416d7bfabe24', '123456', '0df041a430e5', '6b2cdf4dbf36', 'NEW', 'https://www.coinqvest.com/en/checkout/6b2cdf4dbf36', '2020-11-25 12:08:05', '2020-11-25 12:08:05', NULL),
('f7db9bd0-2f17-11eb-bc68-17ec435ab989', '39b582b0-2e45-11eb-92b8-416d7bfabe24', '1234', '0df041a430e5', 'edeead243853', 'NEW', 'https://www.coinqvest.com/en/checkout/edeead243853', '2020-11-25 12:15:55', '2020-11-25 12:15:55', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `deposits`
--

CREATE TABLE `deposits` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `user_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `amount` decimal(65,0) DEFAULT 0,
  `reference` varchar(255) DEFAULT NULL,
  `channel` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `deletedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `deposits`
--

INSERT INTO `deposits` (`id`, `user_id`, `amount`, `reference`, `channel`, `createdAt`, `updatedAt`, `deletedAt`) VALUES
('075560f0-3968-11eb-9db9-fbaa493ca3d8', 'da0a9ba0-394f-11eb-8af4-3558abd710d1', '1000', '836475004', 'PAYSTACK', '2020-12-08 15:14:12', '2020-12-08 15:14:12', NULL),
('081f18a0-363e-11eb-a633-c3e7b1831bd0', '39b582b0-2e45-11eb-92b8-416d7bfabe24', '780', '699175469', 'PAYSTACK', '2020-12-04 14:36:01', '2020-12-04 14:36:01', NULL),
('1f78d6d0-30bc-11eb-86a1-85a2eac9dcc9', '12ee0f50-2e43-11eb-9654-93bef81ecaad', '1000', NULL, 'BANK DEPOSIT', '2020-11-27 14:23:30', '2020-11-27 14:23:30', NULL),
('2ed8cd70-30bb-11eb-8b0e-0799ae2fc802', '12ee0f50-2e43-11eb-9654-93bef81ecaad', '1234', NULL, 'BANK DEPOSIT', '2020-11-27 14:16:46', '2020-11-27 14:16:46', NULL),
('42179a00-30bc-11eb-8b0d-3ffc0c5d8254', '12ee0f50-2e43-11eb-9654-93bef81ecaad', '1000', NULL, 'BANK DEPOSIT', '2020-11-27 14:24:28', '2020-11-27 14:24:28', NULL),
('4545cf80-30bc-11eb-8b0d-3ffc0c5d8254', '12ee0f50-2e43-11eb-9654-93bef81ecaad', '1234', NULL, 'BANK DEPOSIT', '2020-11-27 14:24:33', '2020-11-27 14:24:33', NULL),
('46b6c4a0-30bc-11eb-8b0d-3ffc0c5d8254', '12ee0f50-2e43-11eb-9654-93bef81ecaad', '123456', NULL, 'BANK DEPOSIT', '2020-11-27 14:24:36', '2020-11-27 14:24:36', NULL),
('4f4f8080-30bb-11eb-8b0e-0799ae2fc802', '12ee0f50-2e43-11eb-9654-93bef81ecaad', '123456', NULL, 'BANK DEPOSIT', '2020-11-27 14:17:41', '2020-11-27 14:17:41', NULL),
('69e76790-30bc-11eb-8b0d-3ffc0c5d8254', '12ee0f50-2e43-11eb-9654-93bef81ecaad', '1000', NULL, 'BANK DEPOSIT', '2020-11-27 14:25:35', '2020-11-27 14:25:35', NULL),
('711344a0-30c9-11eb-b92e-036db6714407', '12ee0f50-2e43-11eb-9654-93bef81ecaad', '1000', NULL, 'BANK DEPOSIT', '2020-11-27 15:58:50', '2020-11-27 15:58:50', NULL),
('813b8790-30b8-11eb-b5c2-7be970ece27d', '12ee0f50-2e43-11eb-9654-93bef81ecaad', '1000', NULL, 'BANK DEPOSIT', '2020-11-27 13:57:36', '2020-11-27 13:57:36', NULL),
('f3774cd0-30c3-11eb-a6b3-69a7bb11a1b1', '39b582b0-2e45-11eb-92b8-416d7bfabe24', '1234', NULL, 'BANK DEPOSIT', '2020-11-27 15:19:32', '2020-11-27 15:19:32', NULL),
('f4fe3af0-30c3-11eb-a6b3-69a7bb11a1b1', '39b582b0-2e45-11eb-92b8-416d7bfabe24', '123456', NULL, 'BANK DEPOSIT', '2020-11-27 15:19:35', '2020-11-27 15:19:35', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `investments`
--

CREATE TABLE `investments` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `user_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `package_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `amount` decimal(65,0) DEFAULT 0,
  `interest` decimal(65,0) DEFAULT 1,
  `expiredAt` datetime NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `deletedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `investments`
--

INSERT INTO `investments` (`id`, `user_id`, `package_id`, `amount`, `interest`, `expiredAt`, `createdAt`, `updatedAt`, `deletedAt`) VALUES
('7466e350-40aa-11eb-b565-83250db86f89', '39b582b0-2e45-11eb-92b8-416d7bfabe24', 'a9b420f0-2a65-11eb-b9cc-9392a637f4d8', '5000', '100', '2021-01-16 20:57:20', '2020-12-17 20:57:20', '2020-12-17 20:57:20', NULL),
('d19b0110-3e7e-11eb-851d-39c908bc3532', '39b582b0-2e45-11eb-92b8-416d7bfabe24', '28e66c00-2a72-11eb-a3e1-c10ae54dadc1', '1000', '400', '2020-12-14 02:39:56', '2020-12-15 02:39:56', '2020-12-15 02:39:56', '2020-12-18 02:23:20'),
('ddb88170-3e7e-11eb-851d-39c908bc3532', '39b582b0-2e45-11eb-92b8-416d7bfabe24', '28e66c00-2a72-11eb-a3e1-c10ae54dadc1', '1000', '1', '2020-12-30 02:40:17', '2020-12-15 02:40:17', '2020-12-15 02:40:17', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `kycs`
--

CREATE TABLE `kycs` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `user_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `type` varchar(255) DEFAULT '0',
  `image` text DEFAULT NULL,
  `status` int(11) DEFAULT 0,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `deletedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kycs`
--

INSERT INTO `kycs` (`id`, `user_id`, `type`, `image`, `status`, `createdAt`, `updatedAt`, `deletedAt`) VALUES
('78f63160-3ee7-11eb-a405-f35533740f5c', '4a008f60-3936-11eb-bec5-5771a4ea791b', 'International Passport', 'image-1608044945235.png', 1, '2020-12-15 15:09:05', '2020-12-17 16:15:29', NULL),
('84293fd0-3a07-11eb-b436-d793b10fc2c4', '39b582b0-2e45-11eb-92b8-416d7bfabe24', 'Identity Card', 'image-1608223401538.png', 1, '2020-12-09 10:15:52', '2020-12-17 17:29:43', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `packages`
--

CREATE TABLE `packages` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `min_investment` decimal(65,0) DEFAULT 0,
  `max_investment` decimal(65,0) DEFAULT 0,
  `interest` decimal(65,0) DEFAULT 0,
  `duration` int(11) DEFAULT 0,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `deletedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `packages`
--

INSERT INTO `packages` (`id`, `name`, `description`, `min_investment`, `max_investment`, `interest`, `duration`, `createdAt`, `updatedAt`, `deletedAt`) VALUES
('28e66c00-2a72-11eb-a3e1-c10ae54dadc1', 'Basic', 'ffgkggkgk', '1000', '100000', '100', 15, '2020-11-19 14:18:56', '2020-11-19 14:49:14', NULL),
('30198620-40a6-11eb-b293-8df554c7f485', 'index.phpjjjj', 'Jogappsllllll', '100', '10000', '100', 45, '2020-12-17 20:26:48', '2020-12-17 20:30:08', NULL),
('a9b420f0-2a65-11eb-b9cc-9392a637f4d8', 'Gold', 'gooddooosos', '5000', '100000', '100', 30, '2020-11-19 12:49:29', '2020-11-19 12:49:29', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `referralamounts`
--

CREATE TABLE `referralamounts` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `user_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `package_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `amount` decimal(65,0) DEFAULT 0,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `deletedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `referrals`
--

INSERT INTO `referrals` (`id`, `referral_id`, `user_id`, `createdAt`, `updatedAt`, `deletedAt`) VALUES
('10a8f680-38a5-11eb-a29a-df875cfc447c', '12ee0f50-2e43-11eb-9654-93bef81ecaad', '109e9640-38a5-11eb-a29a-df875cfc447c', '2020-12-07 15:58:36', '2020-12-07 15:58:36', NULL),
('33e7bf00-2ff9-11eb-a050-8fb53ab043b6', '12ee0f50-2e43-11eb-9654-93bef81ecaad', '33d87cc0-2ff9-11eb-a050-8fb53ab043b6', '2020-11-26 15:08:12', '2020-11-26 15:08:12', NULL),
('38fd17d0-33da-11eb-8cf8-897f82e7975a', '39b582b0-2e45-11eb-92b8-416d7bfabe24', '38ec9d10-33da-11eb-8cf8-897f82e7975a', '2020-12-01 13:36:31', '2020-12-01 13:36:31', NULL),
('5b1333c0-38a0-11eb-a1bd-9dd7f95e1716', '12ee0f50-2e43-11eb-9654-93bef81ecaad', '5aedaa60-38a0-11eb-a1bd-9dd7f95e1716', '2020-12-07 15:24:53', '2020-12-07 15:24:53', NULL),
('66a1da40-38a3-11eb-a5ee-3f7fda92e730', '12ee0f50-2e43-11eb-9654-93bef81ecaad', '668d19c0-38a3-11eb-a5ee-3f7fda92e730', '2020-12-07 15:46:41', '2020-12-07 15:46:41', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `resetpasswords`
--

CREATE TABLE `resetpasswords` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `user_email` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `token` varchar(255) DEFAULT '0',
  `status` int(11) DEFAULT 0,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `deletedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `resetpasswords`
--

INSERT INTO `resetpasswords` (`id`, `user_email`, `token`, `status`, `createdAt`, `updatedAt`, `deletedAt`) VALUES
('ac8c5770-3a2d-11eb-bc54-b1e44c2414a8', 'godspowerj7@gmail.com', 'e90c4a5abeb333530e134ad5feddfe13', 0, '2020-12-09 14:49:00', '2020-12-09 14:49:00', NULL),
('fd147340-3a2c-11eb-b465-a1a7e57bf0d3', 'godspowerjemifor@yahoo.com', 'cd70503cc08ecc9057ac881e3451add3', 0, '2020-12-09 14:44:06', '2020-12-09 14:50:30', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sequelizemeta`
--

CREATE TABLE `sequelizemeta` (
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sequelizemeta`
--

INSERT INTO `sequelizemeta` (`name`) VALUES
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
('20201218162037-create-crypt-bank.js');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `user_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `amount` decimal(65,0) DEFAULT 0,
  `type` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `deletedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `user_id`, `amount`, `type`, `createdAt`, `updatedAt`, `deletedAt`) VALUES
('073e7d90-3968-11eb-9db9-fbaa493ca3d8', 'da0a9ba0-394f-11eb-8af4-3558abd710d1', '1000', 'DEPOSIT', '2020-12-08 15:14:12', '2020-12-08 15:14:12', NULL),
('07e59210-363e-11eb-a633-c3e7b1831bd0', '39b582b0-2e45-11eb-92b8-416d7bfabe24', '780', 'DEPOSIT', '2020-12-04 14:36:01', '2020-12-04 14:36:01', NULL),
('41892140-2fee-11eb-84ba-81cb606a0762', '39b582b0-2e45-11eb-92b8-416d7bfabe24', '50', 'DEPOSIT', '2020-11-26 13:49:51', '2020-11-26 13:49:51', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `role` int(11) NOT NULL DEFAULT 3,
  `wallet` decimal(65,0) NOT NULL DEFAULT 0,
  `referral_count` int(11) DEFAULT 0,
  `referral_amount` decimal(65,0) DEFAULT 0,
  `password` varchar(255) DEFAULT NULL,
  `reference` varchar(255) DEFAULT NULL,
  `referral_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `oauth_id` varchar(255) DEFAULT NULL,
  `oauth_token` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `deletedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `phone`, `role`, `wallet`, `referral_count`, `referral_amount`, `password`, `reference`, `referral_id`, `oauth_id`, `oauth_token`, `createdAt`, `updatedAt`, `deletedAt`) VALUES
('12ee0f50-2e43-11eb-9654-93bef81ecaad', 'ADMIN', '1@2.com', '+2348102362015', 1, '30', 0, '0', '$2b$10$up9YKTTgcULWuH30MNljbuz4dT2NUXFTJKq9Mv4S5U/V2QsQn4jF.', '6439ea9f', NULL, NULL, NULL, '2020-11-24 10:51:58', '2020-12-15 02:39:56', NULL),
('1889f570-4147-11eb-90f1-25840e6317b4', 'Jemifor Godspower oRODE', 'gods@hmm.com', '+2348102362015', 3, '0', 0, '0', '$2b$10$ntiZrdlCGk58f4zWlC49Ce6HHWiyuZBQvtT611sHNEhyjc4rsvwSW', '4nrjyvuw', NULL, NULL, NULL, '2020-12-18 15:38:37', '2020-12-18 15:38:37', NULL),
('2f2ddfe0-394e-11eb-bccc-8f90a6434ffc', 'jogapps dev', 'jogappsdeveloper@gmail.com', NULL, 3, '0', 0, '0', NULL, '8b006cau', NULL, '106512346963649739465', NULL, '2020-12-08 12:09:12', '2020-12-08 12:09:12', NULL),
('38ec9d10-33da-11eb-8cf8-897f82e7975a', 'Jemifor Godspower', '2@202.com', '+2348102362015', 3, '0', 0, '0', '$2b$10$mQOCvMJk72pta.hv2Cng8uHj3EmoiDaktZiV/tQd8WO4rnRDnLhj2', 'e83ea270', '39b582b0-2e45-11eb-92b8-416d7bfabe24', NULL, NULL, '2020-12-01 13:36:31', '2020-12-01 13:36:31', NULL),
('39b582b0-2e45-11eb-92b8-416d7bfabe24', 'Jemifor Godspower', '2@2.com', '+2348102362067', 3, '8588', 0, '0', '$2b$10$WPn4NMpOYCWzHshGf4zKue6pxBbtAc6V8sxXy/nAyTsDrYF8uwgGy', 'e5e78716', '12ee0f50-2e43-11eb-9654-93bef81ecaad', NULL, NULL, '2020-11-24 11:07:22', '2020-12-18 04:08:54', NULL),
('4a008f60-3936-11eb-bec5-5771a4ea791b', 'Jemifor Godspower', 'godspowerjemifor@yahoo.com', '08102362015', 3, '1000', 0, '0', '$2b$10$GdbN9s/XDfaVJaLxEJPGNu6UUaNAIFU5FyFhEhQwEStuxImg/wLlW', '0308d170', NULL, '3712198132206593', NULL, '2020-12-08 09:18:09', '2020-12-15 15:53:33', NULL),
('566bf970-2e45-11eb-92b8-416d7bfabe24', 'Jemifor Godspower', 'admin@gmail.com', '+2348102362015', 3, '0', 0, '0', '$2b$10$P.RZR04afCpI7ESWkX9pI.veVfv9.DE1YjWdSXlFHtmlZK2PYO8Ca', '26cc8042', NULL, NULL, NULL, '2020-11-24 11:08:10', '2020-11-24 11:08:10', NULL),
('5de93910-394e-11eb-bccc-8f90a6434ffc', 'godspower jemifor', 'godspowerj4@gmail.com', NULL, 3, '0', 0, '0', NULL, 'de402017', NULL, '106129460232495676116', NULL, '2020-12-08 12:10:31', '2020-12-08 12:10:31', NULL),
('93a8cf80-3fb0-11eb-9632-9752b0487c5c', 'godspower jemifor', 'godspowerj7@gmail.com', NULL, 3, '0', 0, '0', NULL, '39siezz1', NULL, '104313123343318161253', NULL, '2020-12-16 15:08:38', '2020-12-16 15:08:38', NULL),
('b6dce960-3ef6-11eb-8cf2-296470ecc9b6', 'Jemifor Godspower oRODE', '1@50.com', '08102362015', 3, '0', 0, '0', '$2b$10$7VK9RMJmoHmf5zGo83T17OxKZn9rEuA/nLnS5oTkncvTgyajmO5XK', 'iqcynj39', NULL, NULL, NULL, '2020-12-15 16:58:11', '2020-12-15 16:58:11', NULL),
('da0a9ba0-394f-11eb-8af4-3558abd710d1', 'godspower jemifor', 'godspowerj7@gmail.com', NULL, 3, '1000', 0, '0', NULL, '32b18d46', NULL, '104313123343318161253', NULL, '2020-12-08 12:21:08', '2020-12-08 15:14:11', '2020-12-15 14:59:25'),
('f3daa1e0-3fbe-11eb-bbd3-1fffadd3cdcc', 'Jemifor Godspower', 'jogappsdeveloper@gmail.comm', '+2348102362015', 3, '0', 0, '0', '$2b$10$Px/.4vktrViuAuP8AnfoaO65sLJkRO9.mcfqinrWoxuqPoZJUtVR.', 'q4zc82i0', NULL, NULL, NULL, '2020-12-16 16:51:33', '2020-12-16 16:51:33', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `verifications`
--

CREATE TABLE `verifications` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `user_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `email_status` int(11) DEFAULT 0,
  `twofa_status` int(11) DEFAULT 0,
  `twofa_image` text DEFAULT NULL,
  `email_code` text DEFAULT NULL,
  `twofa_code` text DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `deletedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `verifications`
--

INSERT INTO `verifications` (`id`, `user_id`, `email_status`, `twofa_status`, `twofa_image`, `email_code`, `twofa_code`, `createdAt`, `updatedAt`, `deletedAt`) VALUES
('1020a280-3e1d-11eb-b2f4-f53c5036b2de', '4a008f60-3936-11eb-bec5-5771a4ea791b', 0, 0, 'data:image/png;base64,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', 'G4aaF', 'LVUFI4J6MI7HWVCYENYEK3SANZXSK7JIFFAUQR3UJFCGC4TFLU4A', '2020-12-14 15:00:11', '2020-12-15 15:11:28', NULL),
('6a1854c0-3e74-11eb-8891-6360e483a28c', '39b582b0-2e45-11eb-92b8-416d7bfabe24', 0, 0, 'data:image/png;base64,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', 'XH3qA', 'H5DWSLSRHIUEUSD2PFXV4U2MOFJVIN2FKJPFUNLVIR5HQPB3PBFQ', '2020-12-15 01:25:28', '2020-12-16 08:41:50', NULL),
('c78a26b0-3ed8-11eb-b16b-9f09f4fce292', 'da0a9ba0-394f-11eb-8af4-3558abd710d1', 1, 0, 'data:image/png;base64,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', 'sPTn0', 'FZQTMV2MMQ4V4SSKHIXDQOBFKJWDENCUGAZH2SDDGVCUUYSJKQWA', '2020-12-15 13:23:54', '2020-12-15 13:25:28', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `withdrawals`
--

CREATE TABLE `withdrawals` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `user_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `amount` decimal(65,0) DEFAULT 0,
  `bank` text DEFAULT NULL,
  `bank_code` text DEFAULT NULL,
  `recipient_id` text DEFAULT NULL,
  `acc_name` text DEFAULT NULL,
  `acc_number` text DEFAULT NULL,
  `status` int(11) DEFAULT 0,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `deletedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `withdrawals`
--

INSERT INTO `withdrawals` (`id`, `user_id`, `amount`, `bank`, `bank_code`, `recipient_id`, `acc_name`, `acc_number`, `status`, `createdAt`, `updatedAt`, `deletedAt`) VALUES
('878295c0-4022-11eb-b80b-dd4e87782e74', '39b582b0-2e45-11eb-92b8-416d7bfabe24', '100', 'Access Bank (Diamond)', '063', 'RCP_vezpzyr7h7486lp', NULL, NULL, 0, '2020-12-17 04:44:21', '2020-12-17 04:44:21', NULL),
('8fe73760-4023-11eb-8ab3-637c48ba124a', '39b582b0-2e45-11eb-92b8-416d7bfabe24', '100', 'Access Bank (Diamond)', '063', 'RCP_tls4fqwt1n1jxp2', 'GODSPOWER ORODE JEMIFOR', '0100681814', 0, '2020-12-17 04:51:44', '2020-12-17 04:51:44', NULL),
('906ce220-4023-11eb-8ab3-637c48ba124a', '39b582b0-2e45-11eb-92b8-416d7bfabe24', '100', 'Access Bank (Diamond)', '063', 'RCP_tls4fqwt1n1jxp2', 'GODSPOWER ORODE JEMIFOR', '0100681814', 0, '2020-12-17 04:51:45', '2020-12-17 04:51:45', NULL),
('cd95d0c0-4024-11eb-864e-d5a3a536a005', '39b582b0-2e45-11eb-92b8-416d7bfabe24', '12', 'Access Bank (Diamond)', '063', 'RCP_tls4fqwt1n1jxp2', 'GODSPOWER ORODE JEMIFOR', '0100681814', 1, '2020-12-17 05:00:37', '2020-12-20 11:10:22', NULL),
('e6863440-4023-11eb-82df-85d098286704', '39b582b0-2e45-11eb-92b8-416d7bfabe24', '100', 'Access Bank (Diamond)', '063', 'RCP_tls4fqwt1n1jxp2', 'GODSPOWER ORODE JEMIFOR', '0100681814', 0, '2020-12-17 04:54:10', '2020-12-17 04:54:10', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bankdeposits`
--
ALTER TABLE `bankdeposits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chats`
--
ALTER TABLE `chats`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cryptbanks`
--
ALTER TABLE `cryptbanks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cyptopayments`
--
ALTER TABLE `cyptopayments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deposits`
--
ALTER TABLE `deposits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `investments`
--
ALTER TABLE `investments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kycs`
--
ALTER TABLE `kycs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `packages`
--
ALTER TABLE `packages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `referralamounts`
--
ALTER TABLE `referralamounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `referrals`
--
ALTER TABLE `referrals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `resetpasswords`
--
ALTER TABLE `resetpasswords`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sequelizemeta`
--
ALTER TABLE `sequelizemeta`
  ADD PRIMARY KEY (`name`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `verifications`
--
ALTER TABLE `verifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `withdrawals`
--
ALTER TABLE `withdrawals`
  ADD PRIMARY KEY (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
