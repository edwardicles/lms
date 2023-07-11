-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 11, 2023 at 10:51 AM
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
-- Database: `lms_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `client_list`
--

CREATE TABLE `client_list` (
  `id` int(30) NOT NULL,
  `lead_id` int(30) NOT NULL,
  `firstname` text NOT NULL,
  `middlename` text NOT NULL,
  `lastname` text NOT NULL,
  `gender` varchar(100) NOT NULL,
  `dob` date NOT NULL,
  `contact` text NOT NULL,
  `email` text NOT NULL,
  `address` text NOT NULL,
  `other_info` text DEFAULT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `client_list`
--

INSERT INTO `client_list` (`id`, `lead_id`, `firstname`, `middlename`, `lastname`, `gender`, `dob`, `contact`, `email`, `address`, `other_info`, `date_created`, `date_updated`) VALUES
(2, 4, 'Mike', '', 'Williams', 'Male', '1997-10-14', '09789546123', 'mwilliams@xyzcompany.com', 'Sample Address', '', '2022-02-04 11:40:44', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `lead_list`
--

CREATE TABLE `lead_list` (
  `id` int(30) NOT NULL,
  `code` varchar(100) NOT NULL,
  `source_id` int(30) NOT NULL,
  `interested_in` text NOT NULL,
  `remarks` text NOT NULL,
  `assigned_to` int(30) DEFAULT NULL,
  `user_id` int(30) DEFAULT NULL,
  `status` tinyint(2) NOT NULL DEFAULT 0 COMMENT '0 = New/Prospect,\r\n1 = Open,\r\n2 = Working,\r\n3 = Not a Target,\r\n4 = Disqualified,\r\n5 = Nurture,\r\n6 = Opportunity Created,\r\n7 = Opportunity Lost,\r\n8 = Inactive',
  `in_opportunity` tinyint(1) NOT NULL DEFAULT 0,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `lead_list`
--

INSERT INTO `lead_list` (`id`, `code`, `source_id`, `interested_in`, `remarks`, `assigned_to`, `user_id`, `status`, `in_opportunity`, `delete_flag`, `date_created`, `date_updated`) VALUES
(4, '202202-00002', 4, 'Something', 'Sample Only', 8, 1, 1, 0, 0, '2022-02-04 11:40:43', '2022-02-04 14:21:59');

-- --------------------------------------------------------

--
-- Table structure for table `log_list`
--

CREATE TABLE `log_list` (
  `id` int(30) NOT NULL,
  `lead_id` int(30) NOT NULL,
  `log_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1 = Outbound, 2= Inbound',
  `remarks` text NOT NULL,
  `user_id` int(30) DEFAULT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `note_list`
--

CREATE TABLE `note_list` (
  `id` int(30) NOT NULL,
  `lead_id` int(30) NOT NULL,
  `note` text NOT NULL,
  `user_id` int(30) DEFAULT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `source_list`
--

CREATE TABLE `source_list` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `source_list`
--

INSERT INTO `source_list` (`id`, `name`, `description`, `status`, `delete_flag`, `date_created`, `date_updated`) VALUES
(1, 'Facebook Ad', 'Leads from the Facebook Advertisments.', 1, 1, '2022-02-04 09:26:11', '2023-07-11 15:34:04'),
(2, 'Company Website', 'Leads from company website', 1, 1, '2022-02-04 09:27:47', '2023-07-11 15:34:00'),
(3, 'Referral', 'Leads from referrals', 1, 1, '2022-02-04 09:28:23', '2023-07-11 15:34:14'),
(4, 'Google Ads', 'Leads form Google Ads', 1, 1, '2022-02-04 09:28:54', '2023-07-11 15:34:07'),
(5, 'Other Sources', 'Leads that are from unlisted sources.', 1, 1, '2022-02-04 09:29:31', '2023-07-11 15:34:10'),
(6, 'Sample Source 123', 'Sample Source', 0, 1, '2022-02-04 09:29:42', '2022-02-04 09:29:58');

-- --------------------------------------------------------

--
-- Table structure for table `system_info`
--

CREATE TABLE `system_info` (
  `id` int(30) NOT NULL,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `system_info`
--

INSERT INTO `system_info` (`id`, `meta_field`, `meta_value`) VALUES
(1, 'name', 'Leads Management System'),
(6, 'short_name', 'LMS - PHP'),
(11, 'logo', 'uploads/logo-1643937839.png'),
(13, 'user_avatar', 'uploads/user_avatar.jpg'),
(14, 'cover', 'uploads/cover-1643937839.png');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(50) NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `middlename` text DEFAULT NULL,
  `lastname` varchar(250) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 0,
  `status` int(1) NOT NULL DEFAULT 1 COMMENT '0=not verified, 1 = verified',
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `middlename`, `lastname`, `username`, `password`, `avatar`, `last_login`, `type`, `status`, `date_added`, `date_updated`) VALUES
(1, 'Adminstrator', NULL, 'Admin', 'admin', '0192023a7bbd73250516f069df18b500', 'uploads/avatar-1.png?v=1643959844', NULL, 1, 1, '2021-01-20 14:02:37', '2022-02-04 15:30:44'),
(8, 'Edward ', NULL, 'Ballacillo', 'ed', '202cb962ac59075b964b07152d234b70', 'uploads/avatar-8.png?v=1643872307', NULL, 2, 1, '2022-02-03 15:11:47', '2023-07-11 15:43:27'),
(9, 'Ogie', NULL, 'Alcasid', 'ogiegie', '202cb962ac59075b964b07152d234b70', NULL, NULL, 2, 1, '2022-02-04 14:55:58', '2023-07-11 13:52:49');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `client_list`
--
ALTER TABLE `client_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lead_id` (`lead_id`);

--
-- Indexes for table `lead_list`
--
ALTER TABLE `lead_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `source_id` (`source_id`),
  ADD KEY `assigned_to` (`assigned_to`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `log_list`
--
ALTER TABLE `log_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lead_id` (`lead_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `note_list`
--
ALTER TABLE `note_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lead_id` (`lead_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `source_list`
--
ALTER TABLE `source_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_info`
--
ALTER TABLE `system_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `client_list`
--
ALTER TABLE `client_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `lead_list`
--
ALTER TABLE `lead_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `log_list`
--
ALTER TABLE `log_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `note_list`
--
ALTER TABLE `note_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `source_list`
--
ALTER TABLE `source_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `system_info`
--
ALTER TABLE `system_info`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `client_list`
--
ALTER TABLE `client_list`
  ADD CONSTRAINT `client_list_ibfk_1` FOREIGN KEY (`lead_id`) REFERENCES `lead_list` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `lead_list`
--
ALTER TABLE `lead_list`
  ADD CONSTRAINT `lead_list_ibfk_1` FOREIGN KEY (`source_id`) REFERENCES `source_list` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `lead_list_ibfk_2` FOREIGN KEY (`assigned_to`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `lead_list_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `log_list`
--
ALTER TABLE `log_list`
  ADD CONSTRAINT `log_list_ibfk_1` FOREIGN KEY (`lead_id`) REFERENCES `lead_list` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `log_list_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `note_list`
--
ALTER TABLE `note_list`
  ADD CONSTRAINT `note_list_ibfk_1` FOREIGN KEY (`lead_id`) REFERENCES `lead_list` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
