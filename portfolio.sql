-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 16, 2021 at 10:00 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.2.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `portfolio`
--

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `sNo` int(11) NOT NULL,
  `Name` text NOT NULL,
  `email_id` varchar(50) NOT NULL,
  `phone_no` bigint(15) NOT NULL,
  `Date` datetime NOT NULL DEFAULT current_timestamp(),
  `message` varchar(2000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`sNo`, `Name`, `email_id`, `phone_no`, `Date`, `message`) VALUES
(1, 'Arpit', 'dadhicharpit954@gmail.com', 749484080, '2021-03-14 21:31:03', 'Nothing'),
(2, 'Arpit Dadhich', 'dadhicharpit954@gmail.com', 917494840809, '0000-00-00 00:00:00', 'sdasdas'),
(3, 'Arpit Dadhich', 'adadhich2604@gmail.com', 917494840809, '2021-03-14 22:14:31', 'sdf'),
(4, 'Arpit Dadhich', 'anmolkoul19dashing@gmail.com', 917494840809, '2021-03-15 11:38:10', 'asdascds');

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `sNo` int(100) NOT NULL,
  `project_name` varchar(100) NOT NULL,
  `slug` varchar(20) NOT NULL,
  `tagline` varchar(1000) NOT NULL,
  `description` varchar(2000) NOT NULL,
  `link` varchar(100) NOT NULL,
  `img_name` varchar(100) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`sNo`, `project_name`, `slug`, `tagline`, `description`, `link`, `img_name`, `date`) VALUES
(1, 'Abc', 'first', 'First Project', 'This is the description about first project', 'jkl', 'signin_bg.jpg', '2021-03-15 15:19:38'),
(2, 'Def', 'second', 'Second Project', 'This is the description of the second post', 'www.google.com', 'post-sample-image.jpg', '2021-03-15 12:33:01'),
(3, 'Ghij', 'Ghij', 'Third Project', 'This is the description of the third project', 'GHIJ', 'signin_bg.jpg', '2021-03-15 15:18:56'),
(4, 'Jkl', 'Jkl', 'Fourth Project', 'This is the description of the fourth project', 'JKL', 'signin_bg.jpg', '2021-03-15 15:18:56'),
(5, 'Mno', 'Mno', 'Fifth Project', 'This is the description of the fifth project', 'MNO', 'signin_bg.jpg', '2021-03-15 15:19:38'),
(6, 'Pqr', 'Pqr', 'Sixth Project', 'This is the description of the sixth project', 'PQR', 'sigin_bg.jpg', '2021-03-15 15:20:14'),
(7, 'stu', 'stu', 'Seventh Project', 'This is the description of the seventh project', 'STU', 'sigin_bg.jpg', '2021-03-15 15:20:14'),
(8, 'Vwx', 'Vwx', 'Eight Project', 'This is the description of the eigth project', 'VWX', 'sigin_bg.jpg', '2021-03-15 15:30:20');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`sNo`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`sNo`) USING BTREE,
  ADD UNIQUE KEY `slug` (`slug`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `sNo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `sNo` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
