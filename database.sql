-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: sql308.infinityfree.com
-- Generation Time: Jul 15, 2023 at 01:57 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 7.2.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `epiz_33908874_revisioncards`
--

-- --------------------------------------------------------

--
-- Table structure for table `Questions`
--

CREATE TABLE `Questions` (
  `QuestionID` int(11) NOT NULL,
  `SetID` int(11) NOT NULL,
  `Question` varchar(512) COLLATE utf32_bin NOT NULL DEFAULT 'No Question Defined!',
  `Answer` varchar(512) COLLATE utf32_bin NOT NULL DEFAULT 'No Answer Defined!'
) ENGINE=MyISAM DEFAULT CHARSET=utf32 COLLATE=utf32_bin;

--
-- Dumping data for table `Questions`
--

-- --------------------------------------------------------
--
-- Table structure for table `Sets`
--

CREATE TABLE `Sets` (
  `SetID` int(11) NOT NULL,
  `SetName` varchar(255) COLLATE utf32_bin NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf32 COLLATE=utf32_bin;

--
-- Dumping data for table `Sets`
--

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Questions`
--
ALTER TABLE `Questions`
  ADD PRIMARY KEY (`QuestionID`);

--
-- Indexes for table `Sets`
--
ALTER TABLE `Sets`
  ADD PRIMARY KEY (`SetID`),
  ADD UNIQUE KEY `SetName` (`SetName`) USING HASH;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Questions`
--
ALTER TABLE `Questions`
  MODIFY `QuestionID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT for table `Sets`
--
ALTER TABLE `Sets`
  MODIFY `SetID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
