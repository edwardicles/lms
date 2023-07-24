-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 24, 2023 at 11:15 AM
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
  `enrolled` varchar(100) NOT NULL,
  `other_info` text DEFAULT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `client_list`
--

INSERT INTO `client_list` (`id`, `lead_id`, `firstname`, `middlename`, `lastname`, `gender`, `dob`, `contact`, `email`, `address`, `enrolled`, `other_info`, `date_created`, `date_updated`) VALUES
(24, 26, 'zzzz', 'zzxcxzc', 'asdasdasd', 'Male', '2023-07-20', '231243141234', 'hykeem.symere@gmail.com', 'zxc', 'Yes', 'zxc', '2023-07-20 17:01:04', NULL),
(25, 27, 'qqq', 'qqq', 'qqq', 'Male', '2023-07-21', '231243141234', 'hykeem.symere@gmail.com', 'sada', 'Yes', 'asdas', '2023-07-21 11:07:23', NULL),
(26, 28, 'sadasd', 'sadas', 'sadasd', 'Male', '2023-07-26', 'asdas', 'sadas@gmaiscsaldjsaldkjs.com', 'asdasd', 'Yes', 'sadasd', '2023-07-21 12:55:01', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `course_list`
--

CREATE TABLE `course_list` (
  `id` int(30) NOT NULL,
  `course` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `course_list`
--

INSERT INTO `course_list` (`id`, `course`, `description`, `status`, `delete_flag`, `date_created`, `date_updated`) VALUES
(1, 'Accountancy, Business, and Management', 'ABM', 1, 1, '2023-07-12 15:28:12', '2023-07-14 11:47:02'),
(2, 'stem', 'asdas', 1, 1, '2023-07-14 11:51:00', '2023-07-14 11:51:41'),
(3, 'asdasdas', 'asdasdas', 1, 1, '2023-07-14 11:52:00', '2023-07-14 11:52:05'),
(5, 'ABM', 'STEM', 1, 0, '2023-07-14 16:07:27', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `lead_list`
--

CREATE TABLE `lead_list` (
  `id` int(30) NOT NULL,
  `code` varchar(100) NOT NULL,
  `source_id` int(30) NOT NULL,
  `program_id` int(30) NOT NULL,
  `course_id` int(30) NOT NULL,
  `updated_id` int(30) NOT NULL,
  `interested_in` text NOT NULL,
  `remarks` text NOT NULL,
  `assigned_to` int(30) DEFAULT NULL,
  `user_id` int(30) DEFAULT NULL,
  `status` tinyint(2) NOT NULL DEFAULT 0 COMMENT '0 = Open,\r\n1 = New Prospect,\r\n2 = Qualified,\r\n3 = Interviewed,\r\n4 = Target,\r\n5 = Follow Up,\r\n6 = Opportunity Created,\r\n7 = Opportunity Lost,\r\n8 = Inactive,\r\n9 = N/A\r\n',
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `in_opportunity` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `lead_list`
--

INSERT INTO `lead_list` (`id`, `code`, `source_id`, `program_id`, `course_id`, `updated_id`, `interested_in`, `remarks`, `assigned_to`, `user_id`, `status`, `delete_flag`, `date_created`, `date_updated`, `in_opportunity`) VALUES
(26, '202307-00005', 10, 1, 1, 0, '', 'zxcz', 11, 1, 3, 0, '2023-07-20 17:01:04', '2023-07-21 17:16:54', 0),
(27, '202307-00006', 10, 1, 1, 0, '', 'asdasd', 9, 1, 1, 0, '2023-07-21 11:07:23', '2023-07-24 15:37:01', 0),
(28, '202307-00001', 10, 2, 1, 0, '', 'asdasd', 9, 1, 2, 0, '2023-07-21 12:55:01', '2023-07-24 15:59:22', 0);

-- --------------------------------------------------------

--
-- Table structure for table `lead_list_ver`
--

CREATE TABLE `lead_list_ver` (
  `id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT 0 COMMENT '0 = Open,\r\n1 = New Prospect,\r\n2 = Qualified,\r\n3 = Interviewed,\r\n4 = Target,\r\n5 = Follow Up\r\n',
  `date_updated` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `lead_list_ver`
--

INSERT INTO `lead_list_ver` (`id`, `userid`, `status`, `date_updated`) VALUES
(24, 26, 3, '2023-07-21 09:16:54'),
(25, 28, 1, '2023-07-24 04:28:13'),
(26, 27, 1, '2023-07-24 07:37:01'),
(27, 28, 3, '2023-07-24 07:43:10'),
(28, 28, 0, '2023-07-24 07:46:10'),
(29, 28, 1, '2023-07-24 07:54:55'),
(30, 28, 2, '2023-07-24 07:59:22');

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
-- Table structure for table `program_list`
--

CREATE TABLE `program_list` (
  `id` int(30) NOT NULL,
  `program` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `program_list`
--

INSERT INTO `program_list` (`id`, `program`, `description`, `status`, `delete_flag`, `date_created`, `date_updated`) VALUES
(1, 'SHS', 'Senior High School', 1, 0, '2023-07-12 15:28:50', NULL),
(2, 'Science, Technology, Engineering and Math', 'STEM', 1, 0, '2023-07-12 18:07:34', NULL);

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
(7, 'Technological Institute of the Philippines (QC)', 'TIP QC', 1, 0, '2023-07-12 11:27:42', NULL),
(8, 'MFI JALA-JALA', '', 1, 0, '2023-07-12 11:28:00', NULL),
(10, 'MFI LAGUNA', 'MFI BRANCH', 1, 0, '2023-07-12 16:33:30', NULL),
(11, 'MFI ORTIGAS', 'Main', 1, 0, '2023-07-12 16:51:06', NULL);

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
  `last_login` datetime DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 0,
  `status` int(1) NOT NULL DEFAULT 1 COMMENT '0=not verified, 1 = verified',
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `middlename`, `lastname`, `username`, `password`, `last_login`, `type`, `status`, `date_added`, `date_updated`) VALUES
(1, 'Adminstrator', NULL, 'Admin', 'admin', '0192023a7bbd73250516f069df18b500', NULL, 1, 1, '2021-01-20 14:02:37', '2022-02-04 15:30:44'),
(9, 'Ogie', NULL, 'Alcasid', 'ogiegie', '202cb962ac59075b964b07152d234b70', NULL, 2, 1, '2022-02-04 14:55:58', '2023-07-11 13:52:49'),
(11, 'Edward James', NULL, 'Ballacillo', 'ejbb', '202cb962ac59075b964b07152d234b70', NULL, 2, 1, '2023-07-12 12:31:09', NULL),
(12, 'james', NULL, 'rides', 'jred', '202cb962ac59075b964b07152d234b70', NULL, 2, 1, '2023-07-19 10:46:02', NULL);

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
-- Indexes for table `course_list`
--
ALTER TABLE `course_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lead_list`
--
ALTER TABLE `lead_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `source_id` (`source_id`),
  ADD KEY `assigned_to` (`assigned_to`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `program_id` (`program_id`),
  ADD KEY `course_id` (`course_id`),
  ADD KEY `update_history` (`updated_id`),
  ADD KEY `updated_id` (`updated_id`);

--
-- Indexes for table `lead_list_ver`
--
ALTER TABLE `lead_list_ver`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userid` (`userid`);

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
-- Indexes for table `program_list`
--
ALTER TABLE `program_list`
  ADD PRIMARY KEY (`id`);

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
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `course_list`
--
ALTER TABLE `course_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `lead_list`
--
ALTER TABLE `lead_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `lead_list_ver`
--
ALTER TABLE `lead_list_ver`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

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
-- AUTO_INCREMENT for table `program_list`
--
ALTER TABLE `program_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `source_list`
--
ALTER TABLE `source_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `system_info`
--
ALTER TABLE `system_info`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

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
-- Constraints for table `lead_list_ver`
--
ALTER TABLE `lead_list_ver`
  ADD CONSTRAINT `lead_list_ver_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `lead_list` (`id`);

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
