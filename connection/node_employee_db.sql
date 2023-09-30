-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 30, 2023 at 02:50 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `node_employee_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `job_title` varchar(255) NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `name`, `job_title`, `phone_number`, `email`, `address`, `city`, `state`) VALUES
(2, 'Vaibhav', 'Web developer', '1234567890', 'vaibhav@gmail.com', 'Rajkot', 'RJ', 'GJ'),
(3, 'dca', 'Web', '1235678', 'vaibhav@gm.cm', 'jak', 'rajkot', 'GJ'),
(4, 'dca', 'Web', '1235678', 'vaibhav@gm.cm', 'jak', 'rajkot', 'GJ'),
(5, 'dca', 'Web', '1235678', 'vaibhav@gm.cm', 'jak', 'rajkot', 'GJ'),
(6, 'Vaibhav', 'Web', '1235678', 'vaibhav@gm.cm', 'jak', 'rajkot', 'GJ'),
(7, 'Vaibhav', 'Web', '1235678', 'vaibhav@gm.cm', 'jak', 'rajkot', 'GJ'),
(8, 'Vaibhav', 'Web', '1235678', 'vaibhav@gm.cm', 'jak', 'rajkot', 'GJ'),
(9, 'Vaibhav', 'Web', '1235678', 'vaibhav@gm.cm', 'jak', 'rajkot', 'GJ'),
(10, 'Vaibhav', 'Web', '1235678', 'vaibhav@gm.cm', 'jak', 'rajkot', 'GJ'),
(11, 'Vaibhav', 'Web', '1235678', 'vaibhav@gm.cm', 'jak', 'rajkot', 'GJ');

-- --------------------------------------------------------

--
-- Table structure for table `employee_emergency_contacts`
--

CREATE TABLE `employee_emergency_contacts` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `relationship` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employee_emergency_contacts`
--

INSERT INTO `employee_emergency_contacts` (`id`, `employee_id`, `name`, `phone_number`, `relationship`) VALUES
(5, 2, 'vaibhav', '1111111111', 'Friend'),
(6, 2, 'vasu', '123456789', 'bahdhhd'),
(7, 2, 'jay', '1234567890', 'vvv'),
(17, 10, 'Raju', '987667888', 'Brother'),
(18, 11, 'Raju', '987667888', 'Brother');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`) VALUES
(4, 'vaibhav', 'vaibhav@gmail.com', '$2a$12$VYW4HnB7XLoayfyOrsXzrOHYGtT.uEqxer1cg2rTWc1C7LWrk5VeC');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee_emergency_contacts`
--
ALTER TABLE `employee_emergency_contacts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_id` (`employee_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `employee_emergency_contacts`
--
ALTER TABLE `employee_emergency_contacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `employee_emergency_contacts`
--
ALTER TABLE `employee_emergency_contacts`
  ADD CONSTRAINT `employee_emergency_contacts_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
