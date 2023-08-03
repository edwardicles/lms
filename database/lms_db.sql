-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 03, 2023 at 02:25 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 7.4.23

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `client_list`
--

INSERT INTO `client_list` (`id`, `lead_id`, `firstname`, `middlename`, `lastname`, `gender`, `dob`, `contact`, `email`, `address`, `enrolled`, `other_info`, `date_created`, `date_updated`) VALUES
(24, 26, 'zzzz', 'zzxcxzc', 'asdasdasd', 'Male', '2023-07-20', '231243141234', 'hykeem.symere@gmail.com', 'zxc', 'Yes', 'zxc', '2023-07-20 17:01:04', NULL),
(25, 27, 'qqq', 'qqq', 'qqq', 'Male', '2023-07-21', '231243141234', 'hykeem.symere@gmail.com', 'sada', 'Yes', 'asdas', '2023-07-21 11:07:23', NULL),
(26, 28, 'sadasd', 'sadas', 'sadasd', 'Male', '2023-07-26', 'asdas', 'sadas@gmaiscsaldjsaldkjs.com', 'asdasd', 'Yes', 'sadasd', '2023-07-21 12:55:01', NULL),
(27, 29, 'John', 'Red', 'Blue', 'Male', '2023-07-25', '0943543543543', 'syrisoky@lyft.live', '51 jupiter st.', 'Yes', 'opopopoppo', '2023-07-25 11:58:54', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `course_list`
--

CREATE TABLE `course_list` (
  `id` int(30) NOT NULL,
  `course` text CHARACTER SET utf8mb4 NOT NULL,
  `description` text CHARACTER SET utf8mb4 NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  `status_id` int(30) NOT NULL,
  `updated_id` int(30) NOT NULL,
  `interested_in` text NOT NULL,
  `remarks` text NOT NULL,
  `assigned_to` int(30) DEFAULT NULL,
  `user_id` int(30) DEFAULT NULL,
  `status` tinyint(2) NOT NULL DEFAULT 0 COMMENT '0 = Open,\r\n1 = New Prospect,\r\n2 = Qualified,\r\n3 = Interviewed,\r\n4 = Target,\r\n5 = Follow Up\r\n',
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `in_opportunity` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `lead_list`
--

INSERT INTO `lead_list` (`id`, `code`, `source_id`, `program_id`, `course_id`, `status_id`, `updated_id`, `interested_in`, `remarks`, `assigned_to`, `user_id`, `status`, `delete_flag`, `date_created`, `date_updated`, `in_opportunity`) VALUES
(26, '202307-00005', 10, 1, 1, 0, 0, '', 'zxcz', 11, 1, 2, 0, '2023-07-20 17:01:04', '2023-07-24 14:27:27', 0),
(27, '202307-00006', 10, 1, 1, 0, 0, '', 'asdasd', 9, 1, 0, 0, '2023-07-21 11:07:23', NULL, 0),
(28, '202307-00001', 10, 2, 1, 0, 0, '', 'asdasd', 9, 1, 1, 0, '2023-07-21 12:55:01', '2023-07-24 12:28:13', 0),
(29, '202307-00002', 10, 1, 1, 0, 0, '', 'lklkklklkl', 9, 1, 0, 0, '2023-07-25 11:58:54', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `lead_list_ver`
--

CREATE TABLE `lead_list_ver` (
  `id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT 0 COMMENT '0 = Open,\r\n1 = New Prospect,\r\n2 = Qualified,\r\n3 = Interviewed,\r\n4 = Target,\r\n5 = Follow Up\r\n',
  `date_updated` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lead_list_ver`
--

INSERT INTO `lead_list_ver` (`id`, `userid`, `status`, `date_updated`) VALUES
(24, 26, 3, '2023-07-21 09:16:54'),
(25, 28, 1, '2023-07-24 04:28:13'),
(26, 26, 1, '2023-07-24 06:26:03'),
(27, 26, 4, '2023-07-24 06:27:21'),
(28, 26, 2, '2023-07-24 06:27:27');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `members`
--

CREATE TABLE `members` (
  `id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `status` enum('Active','Inactive') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `members`
--

INSERT INTO `members` (`id`, `name`, `email`, `phone`, `created`, `modified`, `status`) VALUES
(1, '2', '001-002', 'name 2', '2023-08-03 20:11:59', '2023-08-03 20:11:59', ''),
(2, '3', '001-003', 'name 3', '2023-08-03 20:11:59', '2023-08-03 20:11:59', ''),
(3, '4', '001-004', 'name 4', '2023-08-03 20:11:59', '2023-08-03 20:11:59', ''),
(4, '5', '001-005', 'name 5', '2023-08-03 20:11:59', '2023-08-03 20:11:59', ''),
(5, '6', '001-006', 'name 6', '2023-08-03 20:11:59', '2023-08-03 20:11:59', ''),
(6, '7', '001-007', 'name 7', '2023-08-03 20:11:59', '2023-08-03 20:11:59', ''),
(7, '8', '001-008', 'name 8', '2023-08-03 20:11:59', '2023-08-03 20:11:59', ''),
(8, '9', '001-009', 'name 9', '2023-08-03 20:11:59', '2023-08-03 20:11:59', ''),
(9, '10', '001-010', 'name 10', '2023-08-03 20:11:59', '2023-08-03 20:11:59', '');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `program_list`
--

CREATE TABLE `program_list` (
  `id` int(30) NOT NULL,
  `program` text CHARACTER SET utf8mb4 NOT NULL,
  `description` text CHARACTER SET utf8mb4 NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
  ADD KEY `status_id` (`status_id`),
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
-- Indexes for table `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`id`);

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
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `course_list`
--
ALTER TABLE `course_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `lead_list`
--
ALTER TABLE `lead_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `lead_list_ver`
--
ALTER TABLE `lead_list_ver`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `log_list`
--
ALTER TABLE `log_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `members`
--
ALTER TABLE `members`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

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
