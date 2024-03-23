-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 23, 2024 at 04:10 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rpms1`
--

-- --------------------------------------------------------

--
-- Table structure for table `collaborators`
--

CREATE TABLE `collaborators` (
  `collaboratorId` int(10) NOT NULL,
  `fName` varchar(50) NOT NULL,
  `lName` varchar(50) NOT NULL,
  `project` varchar(50) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `collaborators`
--

INSERT INTO `collaborators` (`collaboratorId`, `fName`, `lName`, `project`, `project_id`) VALUES
(400, 'samuel ', 'kariuki', 'soil acidity', 100),
(401, 'mburu', 'karanja', 'soil profile', 101);

-- --------------------------------------------------------

--
-- Table structure for table `funders`
--

CREATE TABLE `funders` (
  `funderId` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `country` varchar(50) NOT NULL,
  `totalFunds` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `funders`
--

INSERT INTO `funders` (`funderId`, `name`, `status`, `country`, `totalFunds`) VALUES
(200, 'KASNEB', 'Active', 'Kenya', 2000000),
(201, 'USAID', 'Active', 'USA', 15000000);

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `name` varchar(50) NOT NULL,
  `amount_funded` int(11) DEFAULT 0,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `field` varchar(50) NOT NULL,
  `project_id` int(11) NOT NULL,
  `funderId` int(11) DEFAULT NULL,
  `researcherId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`name`, `amount_funded`, `start_date`, `end_date`, `field`, `project_id`, `funderId`, `researcherId`) VALUES
('soil acidity', 2000000, '2024-01-09', '2024-05-22', 'Agriculture', 100, 200, 300),
('soil profile', 15000000, '2024-03-07', '2024-06-20', 'Agriculture', 101, 201, 301);

-- --------------------------------------------------------

--
-- Table structure for table `researchers`
--

CREATE TABLE `researchers` (
  `researcherId` int(10) NOT NULL,
  `fName` varchar(50) NOT NULL,
  `lName` varchar(50) NOT NULL,
  `project` varchar(50) DEFAULT NULL,
  `department` varchar(50) NOT NULL,
  `faculty` varchar(50) NOT NULL,
  `password` longtext DEFAULT NULL,
  `collaboratorId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `researchers`
--

INSERT INTO `researchers` (`researcherId`, `fName`, `lName`, `project`, `department`, `faculty`, `password`, `collaboratorId`) VALUES
(300, 'israel', 'mbonyi', 'soil acidity', 'agriculture', 'FOS', 'invicto', 400),
(301, 'frester', 'Hitler', 'soil profile', 'agriculture', 'FOA', NULL, 401),
(302, 'Gregory', 'Sambe', NULL, 'Computer science', 'FOS', 'invicto', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `collaborators`
--
ALTER TABLE `collaborators`
  ADD PRIMARY KEY (`collaboratorId`),
  ADD KEY `collaborators_ibfk_1` (`project_id`);

--
-- Indexes for table `funders`
--
ALTER TABLE `funders`
  ADD PRIMARY KEY (`funderId`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`project_id`),
  ADD KEY `researcherId` (`researcherId`),
  ADD KEY `funderId` (`funderId`);

--
-- Indexes for table `researchers`
--
ALTER TABLE `researchers`
  ADD PRIMARY KEY (`researcherId`),
  ADD KEY `collaboratorId` (`collaboratorId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `collaborators`
--
ALTER TABLE `collaborators`
  MODIFY `collaboratorId` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=402;

--
-- AUTO_INCREMENT for table `funders`
--
ALTER TABLE `funders`
  MODIFY `funderId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=204;

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `project_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT for table `researchers`
--
ALTER TABLE `researchers`
  MODIFY `researcherId` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23424;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `projects`
--
ALTER TABLE `projects`
  ADD CONSTRAINT `funderId` FOREIGN KEY (`funderId`) REFERENCES `funders` (`funderId`),
  ADD CONSTRAINT `researcherId` FOREIGN KEY (`researcherId`) REFERENCES `researchers` (`researcherId`);

--
-- Constraints for table `researchers`
--
ALTER TABLE `researchers`
  ADD CONSTRAINT `collaboratorId` FOREIGN KEY (`collaboratorId`) REFERENCES `collaborators` (`collaboratorId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
