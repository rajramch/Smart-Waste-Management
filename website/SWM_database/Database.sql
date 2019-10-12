-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 24, 2018 at 07:36 AM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `swm`
--

-- --------------------------------------------------------

--
-- Table structure for table `area`
--

CREATE TABLE `area` (
  `a_id` int(10) NOT NULL,
  `a_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `area`
--

INSERT INTO `area` (`a_id`, `a_name`) VALUES
(1, 'kurla'),
(2, 'chembur'),
(3, 'ulhasnagar');

-- --------------------------------------------------------

--
-- Table structure for table `assistant`
--

CREATE TABLE `assistant` (
  `asid` int(10) NOT NULL,
  `aname` varchar(30) NOT NULL,
  `apassword` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `assistant`
--

INSERT INTO `assistant` (`asid`, `aname`, `apassword`) VALUES
(1, 'raj', '7410');

-- --------------------------------------------------------

--
-- Table structure for table `bins`
--

CREATE TABLE `bins` (
  `bins_id` int(11) NOT NULL,
  `bins_cap_fill` int(11) NOT NULL,
  `bins_add` varchar(100) NOT NULL,
  `lat` float DEFAULT NULL,
  `lng` float DEFAULT NULL,
  `t_id` int(11) NOT NULL,
  `a_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bins`
--

INSERT INTO `bins` (`bins_id`, `bins_cap_fill`, `bins_add`, `lat`, `lng`, `t_id`, `a_id`) VALUES
(1, 85, 'nehru nagar', 19.0629, 72.879, 1, 1),
(2, 95, 'asianpower overseas', 19.0563, 72.8832, 2, 2),
(25, 95, 'hira book dept', 19.224, 73.1617, 3, 3),
(32, 85, 'sapna', 19.2261, 73.1657, 3, 3),
(46, 82, 'link road', 19.232, 73.1629, 3, 3),
(101, 0, 'laxmi colony', 19.0426, 72.8937, 1, 1),
(102, 0, 'barc', 19.0501, 72.8945, 1, 1),
(121, 81, 'maa hospital', 19.0626, 72.8958, 1, 1),
(123, 0, 'rel office', 19.059, 72.8994, 2, 2),
(221, 90, 'rane hospital', 19.0695, 72.9038, 1, 1),
(226, 96, 'axis bank', 19.0553, 72.8876, 1, 1),
(1010, 22, 'vesit', 19.047, 72.8881, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `bins_analysis`
--

CREATE TABLE `bins_analysis` (
  `bins_id` int(10) NOT NULL,
  `bin_add` varchar(30) NOT NULL,
  `last_collected` varchar(30) NOT NULL,
  `times` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bins_analysis`
--

INSERT INTO `bins_analysis` (`bins_id`, `bin_add`, `last_collected`, `times`) VALUES
(1, 'nehru nagar', '6 hr ago', 2),
(201, 'vesit', '2 hr ago', 1),
(25, 'hira book depot', '5 hr ago', 1),
(32, 'sapna garden', '1 min ago', 2);

-- --------------------------------------------------------

--
-- Table structure for table `trucks`
--

CREATE TABLE `trucks` (
  `t_id` int(10) NOT NULL,
  `t_add` varchar(100) NOT NULL,
  `lat` float NOT NULL,
  `lng` float NOT NULL,
  `t_cap` int(10) NOT NULL,
  `a_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `trucks`
--

INSERT INTO `trucks` (`t_id`, `t_add`, `lat`, `lng`, `t_cap`, `a_id`) VALUES
(1, 'kurla', 19.063, 72.8484, 200, 1),
(2, 'nagarplaika', 19.0563, 72.8525, 200, 2),
(3, 'ulhas', 19.2309, 73.1606, 500, 3);

-- --------------------------------------------------------

--
-- Table structure for table `truck_analysis`
--

CREATE TABLE `truck_analysis` (
  `t_id` int(10) NOT NULL,
  `t_add` varchar(30) NOT NULL,
  `last_trip` varchar(30) NOT NULL,
  `trips` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `truck_analysis`
--

INSERT INTO `truck_analysis` (`t_id`, `t_add`, `last_trip`, `trips`) VALUES
(1, 'kurla', '50 mins ago', 2),
(2, 'chembur', '2 hr ago', 1),
(3, 'ulhasnagar', '5 mins ago', 3);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `uid` int(11) NOT NULL,
  `uname` varchar(100) NOT NULL,
  `upassword` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`uid`, `uname`, `upassword`) VALUES
(1, 'sumeet', '1234');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `area`
--
ALTER TABLE `area`
  ADD PRIMARY KEY (`a_id`);

--
-- Indexes for table `bins`
--
ALTER TABLE `bins`
  ADD PRIMARY KEY (`bins_id`),
  ADD KEY `t_id` (`t_id`),
  ADD KEY `a_id` (`a_id`);

--
-- Indexes for table `trucks`
--
ALTER TABLE `trucks`
  ADD PRIMARY KEY (`t_id`),
  ADD KEY `a_id` (`a_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`uid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `area`
--
ALTER TABLE `area`
  MODIFY `a_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `bins`
--
ALTER TABLE `bins`
  ADD CONSTRAINT `bins_ibfk_1` FOREIGN KEY (`t_id`) REFERENCES `trucks` (`t_id`),
  ADD CONSTRAINT `bins_ibfk_2` FOREIGN KEY (`a_id`) REFERENCES `area` (`a_id`);

--
-- Constraints for table `trucks`
--
ALTER TABLE `trucks`
  ADD CONSTRAINT `trucks_ibfk_1` FOREIGN KEY (`a_id`) REFERENCES `area` (`a_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
