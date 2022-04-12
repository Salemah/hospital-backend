-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 21, 2021 at 07:18 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `e_health_care_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `appoinments`
--

CREATE TABLE `appoinments` (
  `id` int(11) NOT NULL,
  `patient_name` varchar(50) NOT NULL,
  `token` varchar(10) NOT NULL,
  `date` varchar(40) NOT NULL,
  `disease` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `appoinments`
--

INSERT INTO `appoinments` (`id`, `patient_name`, `token`, `date`, `disease`) VALUES
(1, 'Mr. Ron', '01', 'panding', 'Fever'),
(2, 'Mr. Jhon', '02', 'panding', 'Fever'),
(3, 'Mr. Tom', '03', 'panding', 'Fever'),
(4, 'Mr. Luice', '04', 'panding', 'Fever'),
(5, 'Rakib Shahidullah', '022', 'panding', 'Fever'),
(6, 'Al Amin', '50', '2021-06-16', 'Fever'),
(7, 'Al Amin', '50', '2021-06-16', 'Fever'),
(8, 'Al Amin', '50', '2021-06-16', 'Fever'),
(9, 'Rakib', '50', '2021-06-17', 'Fever');

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

CREATE TABLE `appointment` (
  `patient_name` varchar(50) NOT NULL,
  `token` int(11) NOT NULL,
  `date` varchar(40) NOT NULL,
  `disease` varchar(20) NOT NULL,
  `ref` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `appointment`
--

INSERT INTO `appointment` (`patient_name`, `token`, `date`, `disease`, `ref`) VALUES
('che', 1, '12/6/2021', 'pain', 'dc1'),
('stark', 2, '19/7/2021', 'ulcer', 'ad1');

-- --------------------------------------------------------

--
-- Table structure for table `bill`
--

CREATE TABLE `bill` (
  `token` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `total_bill` varchar(100) NOT NULL,
  `paid_bill` varchar(100) NOT NULL,
  `due_bill` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bill`
--

INSERT INTO `bill` (`token`, `name`, `total_bill`, `paid_bill`, `due_bill`) VALUES
(12, 'jack', '500', '200', '300'),
(47503, 'ak', '2000', '1500', '500');

-- --------------------------------------------------------

--
-- Table structure for table `booking_table`
--

CREATE TABLE `booking_table` (
  `id` int(20) NOT NULL,
  `type` varchar(255) NOT NULL,
  `price` int(50) NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone` int(100) NOT NULL,
  `roomNo` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `booking_table`
--

INSERT INTO `booking_table` (`id`, `type`, `price`, `name`, `phone`, `roomNo`) VALUES
(1, 'single bed', 1200, 'anik', 187545466, 306),
(2, 'single bed', 1000, 'skw', 18754554, 201),
(3, 'single bed', 1200, 'karim', 1617455216, 306),
(4, 'double bed', 2200, 'karim', 1727422346, 202),
(5, 'single bed', 1200, 'karim', 1875306465, 304),
(7, 'single bed', 1000, 'anik', 1875306465, 201),
(14, 'double bed', 1200, 'fasdfsd', 94359345, 306),
(16, 'single bed', 1000, 'fasdfsd', 94359345, 201),
(17, 'double bed', 1200, 'fsdfsd', 94359345, 306),
(18, 'single bed', 1000, 'fasdfsd', 94359345, 201),
(19, 'double bed', 1200, 'fsafds', 94359345, 306),
(20, 'single bed', 1000, 'fasdfsd', 94359345, 201),
(21, 'single bed', 1000, 'fds', 94359345, 201),
(22, 'double bed', 1200, 'anik', 94359345, 306),
(23, 'double bed', 2200, 'fasdfsd', 94359345, 202),
(24, 'double bed', 2200, 'anik', 94359345, 202);

-- --------------------------------------------------------

--
-- Table structure for table `doctor_review`
--

CREATE TABLE `doctor_review` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `message` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `doctor_review`
--

INSERT INTO `doctor_review` (`id`, `name`, `message`) VALUES
(1, 'Adnan', 'he is a friendly and polite. he is a very good doctor'),
(2, 'Mainul Hafiz', 'this doctor behaviour is not good');

-- --------------------------------------------------------

--
-- Table structure for table `doctor_sche`
--

CREATE TABLE `doctor_sche` (
  `email` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `speciality` varchar(100) NOT NULL,
  `available` varchar(100) NOT NULL,
  `fee` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `doctor_sche`
--

INSERT INTO `doctor_sche` (`email`, `name`, `speciality`, `available`, `fee`) VALUES
('a@gmail.com', 'sakin', 'psychologist', 'friday', '500'),
('x@gmail.com', 'john', 'medicine', 'sunday', '1000');

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `contactno` varchar(255) NOT NULL,
  `password` varchar(120) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `name`, `username`, `contactno`, `password`) VALUES
(1, 'anik', 'anik', '0124585455', 'anik12'),
(5, 'anik', 'habibur', '344412', 'asdf');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `prescribes`
--

CREATE TABLE `prescribes` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `age` varchar(20) NOT NULL,
  `disease` varchar(20) NOT NULL,
  `bloodGroup` varchar(20) NOT NULL,
  `prescription` varchar(500) NOT NULL,
  `tesrs` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `prescribes`
--

INSERT INTO `prescribes` (`id`, `name`, `age`, `disease`, `bloodGroup`, `prescription`, `tesrs`) VALUES
(1, 'Rakib Shahidullah', '21', 'Fever', 'O+', 'null', 'null');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(100) NOT NULL,
  `name` varchar(255) NOT NULL,
  `quantity` int(10) NOT NULL,
  `price` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `quantity`, `price`) VALUES
(3, 'Apple', 10, 200),
(4, 'Orange', 12, 170);

-- --------------------------------------------------------

--
-- Table structure for table `report`
--

CREATE TABLE `report` (
  `id` int(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL,
  `message` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `report`
--

INSERT INTO `report` (`id`, `name`, `status`, `message`) VALUES
(1, 'Adnan', 'fixed', 'I face problem when i try to login'),
(2, 'anik', 'working', 'My account is deactive.Can you please activted it'),
(3, 'anik', 'working', 'login problem'),
(4, 'anik', 'fixed', 'login problem');

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

CREATE TABLE `room` (
  `id` int(11) NOT NULL,
  `roomType` varchar(50) NOT NULL,
  `price` int(10) NOT NULL,
  `status` varchar(20) NOT NULL,
  `roomNo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `room`
--

INSERT INTO `room` (`id`, `roomType`, `price`, `status`, `roomNo`) VALUES
(1, 'single bed', 1000, 'avaible', 201),
(2, 'double bed', 2200, 'booked', 202),
(3, 'single bed', 1200, 'avaible', 304),
(4, 'double bed', 1200, 'avaible', 306);

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `id` int(11) NOT NULL,
  `roonNo` varchar(10) NOT NULL,
  `patientName` varchar(30) NOT NULL,
  `roomType` varchar(50) NOT NULL,
  `price` int(10) NOT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`id`, `roonNo`, `patientName`, `roomType`, `price`, `status`) VALUES
(1, '101', 'Mr. A', 'ICU', 500, 'booked'),
(2, '102', 'Mr. B', 'ICU', 500, 'booked'),
(3, '103', 'Mr. C', 'ICU', 500, 'booked'),
(4, '104', 'Mr. D', 'Emargency', 500, 'booked'),
(5, '105', 'Mr. E', 'Emargency', 500, 'booked'),
(6, '106', '', 'Emargency', 500, 'available'),
(7, '107', '', 'ICU', 500, 'available'),
(8, '108', '', 'ICU', 500, 'available'),
(9, '109', '', 'ICU', 500, 'available'),
(10, '110', 'Mr. F', 'Emargency', 500, 'booked'),
(11, '111', '', 'Emargency', 500, 'available'),
(12, '112', 'Mr. G', 'ICU', 500, 'booked');

-- --------------------------------------------------------

--
-- Table structure for table `service`
--

CREATE TABLE `service` (
  `emergency` varchar(100) NOT NULL,
  `ambulance` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `service`
--

INSERT INTO `service` (`emergency`, `ambulance`) VALUES
('available', 0);

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE `transaction` (
  `id` int(11) NOT NULL,
  `bankname` varchar(20) NOT NULL,
  `amount` varchar(100) NOT NULL,
  `withdrawmethod` varchar(10) NOT NULL,
  `desctiption` varchar(20) NOT NULL,
  `date` varchar(100) NOT NULL,
  `customer_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transaction`
--

INSERT INTO `transaction` (`id`, `bankname`, `amount`, `withdrawmethod`, `desctiption`, `date`, `customer_name`) VALUES
(1, 'City Bank', '5000', 'withdraw', '', '12-10-2020', 'karim'),
(2, 'Dhaka Bank', '10000', 'withdraw', '', '22-5-2021', 'sk'),
(3, 'Dhaka Bank', '10000', 'withdraw', '', '10-05-2021', 'rahul');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  `username` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(30) NOT NULL,
  `type` varchar(20) NOT NULL,
  `bloodGroup` varchar(10) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `address` varchar(100) NOT NULL,
  `image` varchar(100) NOT NULL,
  `active` int(20) NOT NULL,
  `salary` varchar(100) NOT NULL,
  `workshift` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `email`, `password`, `type`, `bloodGroup`, `phone`, `address`, `image`, `active`, `salary`, `workshift`) VALUES
(103, 'Md.Habibur Rahman', 'habibur', 'habib@gmail.com', 'Habib$123', 'admin', '', '01837837363', 'Dhaka, Bangladesh', '1629265403.jpg', 1, '', ''),
(104, '', 'anik', 'anik26452@gmail.com', 'Anik&12', 'doctor', '', '01837837363', '', '', 1, '22000', 'day shift'),
(105, '', 'korim', 'korim@gmail.com', 'Korim$12', 'receptionist', '', '01837837363', '', '', 1, '17000', 'night shift'),
(112, '', 'Muhuid', 'muhid@yahoo.com', 'Muhid45@', 'patient', '', '01837837363', '', '', 1, '', ''),
(113, '', 'atef', 'atef26452@gmail.com', 'Atef$12', 'patient', '', '01837837363', '', '', 1, '', ''),
(114, '', 'muaztytyy', 'muaz@gmail.com', 'muaZ&12', 'doctor', '', '01837837363', '', '', 0, '', 'night shift');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `booking_table`
--
ALTER TABLE `booking_table`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `doctor_review`
--
ALTER TABLE `doctor_review`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `report`
--
ALTER TABLE `report`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transaction`
--
ALTER TABLE `transaction`
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
-- AUTO_INCREMENT for table `booking_table`
--
ALTER TABLE `booking_table`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `doctor_review`
--
ALTER TABLE `doctor_review`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `report`
--
ALTER TABLE `report`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `room`
--
ALTER TABLE `room`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `transaction`
--
ALTER TABLE `transaction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=138;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
