-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 22, 2016 at 02:46 AM
-- Server version: 10.1.8-MariaDB
-- PHP Version: 5.6.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tododb`
--

-- --------------------------------------------------------

--
-- Table structure for table `subtasks`
--

CREATE TABLE `subtasks` (
  `SubTaskId` int(11) NOT NULL,
  `SubTaskName` text NOT NULL,
  `TodoId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `todocategorys`
--

CREATE TABLE `todocategorys` (
  `CategoryId` int(11) NOT NULL,
  `CategoryName` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `todocategorys`
--

INSERT INTO `todocategorys` (`CategoryId`, `CategoryName`) VALUES
(1, 'List'),
(2, 'Tasks'),
(3, 'Home to do'),
(4, 'New category'),
(5, 'OneMore');

-- --------------------------------------------------------

--
-- Table structure for table `todolist`
--

CREATE TABLE `todolist` (
  `TodoId` int(11) NOT NULL,
  `TodoText` text NOT NULL,
  `TodoNote` text,
  `Priority` enum('0','1') NOT NULL DEFAULT '0',
  `Status` enum('0','1') NOT NULL DEFAULT '0',
  `TodoDate` datetime DEFAULT '2010-01-01 01:10:10',
  `CategoryId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `todolist`
--

INSERT INTO `todolist` (`TodoId`, `TodoText`, `TodoNote`, `Priority`, `Status`, `TodoDate`, `CategoryId`) VALUES
(1, 'First task', 'No note for ths task', '0', '0', '2010-01-01 01:10:10', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `subtasks`
--
ALTER TABLE `subtasks`
  ADD PRIMARY KEY (`SubTaskId`);

--
-- Indexes for table `todocategorys`
--
ALTER TABLE `todocategorys`
  ADD PRIMARY KEY (`CategoryId`);

--
-- Indexes for table `todolist`
--
ALTER TABLE `todolist`
  ADD PRIMARY KEY (`TodoId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `subtasks`
--
ALTER TABLE `subtasks`
  MODIFY `SubTaskId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `todocategorys`
--
ALTER TABLE `todocategorys`
  MODIFY `CategoryId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `todolist`
--
ALTER TABLE `todolist`
  MODIFY `TodoId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
