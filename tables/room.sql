-- phpMyAdmin SQL Dump
-- version 4.8.0-dev
-- https://www.phpmyadmin.net/
--
-- Host: 192.168.30.23
-- Generation Time: Mar 03, 2017 at 08:45 AM
-- Server version: 5.5.52-0+deb8u1
-- PHP Version: 7.0.16-3+0~20170222101552.24+jessie~1.gbpb3eec3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `DBHW`
--

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

CREATE TABLE `room` (
  `id` int(11) NOT NULL,
  `room_type` varchar(72) NOT NULL,
  `max_occupancy` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `room`
--

INSERT INTO `room` (`id`, `room_type`, `max_occupancy`) VALUES
(101, 'single', 1),
(102, 'double', 2),
(103, 'double', 2),
(104, 'double', 2),
(105, 'family', 3),
(106, 'double', 2),
(107, 'double', 2),
(108, 'double', 2),
(109, 'double', 2),
(110, 'double', 2),
(201, 'single', 1),
(202, 'double', 2),
(203, 'double', 2),
(204, 'double', 2),
(205, 'family', 3),
(206, 'double', 2),
(207, 'double', 2),
(208, 'double', 2),
(209, 'double', 2),
(210, 'double', 2),
(301, 'single', 1),
(302, 'double', 2),
(303, 'double', 2),
(304, 'double', 2),
(305, 'family', 3),
(306, 'double', 2),
(307, 'double', 2),
(308, 'double', 2),
(309, 'double', 2),
(310, 'double', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `room`
--
ALTER TABLE `room`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=311;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
