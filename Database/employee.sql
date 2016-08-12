-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Aug 12, 2016 at 06:31 PM
-- Server version: 10.1.8-MariaDB
-- PHP Version: 5.6.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `advanced_yii2`
--

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `emp_num` int(11) NOT NULL,
  `First_Name` varchar(45) NOT NULL,
  `Last_Name` varchar(45) NOT NULL,
  `Address` varchar(45) NOT NULL,
  `Email` varchar(45) NOT NULL,
  `salary` int(11) NOT NULL,
  `Job_Title` varchar(45) NOT NULL,
  `dep_id` int(11) NOT NULL,
  `leave_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`emp_num`, `First_Name`, `Last_Name`, `Address`, `Email`, `salary`, `Job_Title`, `dep_id`, `leave_id`) VALUES
(2, 'Sephyy', 'HAHA', 'some address', 'justineeee.siccion@yahoo.com', 2000, 'Fireman', 124, 123),
(5, 'felix', 'hahaha', 'ahhahaha', 'justinneeee.siccion@yahoo.com', 23123, 'asdasd', 4, 5),
(6, 'ajkndwjkd', 'kqwjdnqwjk', 'kjwdnkqwjn', 'justinnneeee.siccion@yahoo.com', 343532, 'qhdjhd', 5, 6),
(8, 'qwdjnqwjkd', 'kjqnwkjdn', 'kwjdnkqjdn', 'justiineeee.siccion@yahoo.com', 123123, 'ifjniwenfiewun', 7, 8),
(222424, 'Justine ', 'Siccion', 'B11 sunflower st.', 'justineee.siccion@yahoo.com', 200000, 'IT HEAD', 123, 122);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`emp_num`),
  ADD KEY `dep_id` (`dep_id`),
  ADD KEY `leave_id` (`leave_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_3` FOREIGN KEY (`dep_id`) REFERENCES `department` (`Dep_id`) ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
