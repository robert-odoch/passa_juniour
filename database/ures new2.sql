-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jan 10, 2018 at 06:20 AM
-- Server version: 10.1.24-MariaDB
-- PHP Version: 5.6.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ures`
--

-- --------------------------------------------------------

--
-- Table structure for table `academic_years`
--

CREATE TABLE `academic_years` (
  `academic_year_id` int(11) NOT NULL,
  `academic_year` varchar(100) DEFAULT NULL,
  `university_university_id` int(11) DEFAULT NULL,
  `_when_added` date NOT NULL,
  `_who_added` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `academic_years`
--

INSERT INTO `academic_years` (`academic_year_id`, `academic_year`, `university_university_id`, `_when_added`, `_who_added`, `status`) VALUES
(1, '2013', 2, '2017-09-25', 10, 0),
(2, '2014', 2, '2017-09-25', 10, 0),
(3, '2015', 2, '2017-09-25', 10, 0),
(4, '2016', 2, '2017-09-25', 10, 0),
(5, '2017', 2, '2017-09-25', 10, 0);

-- --------------------------------------------------------

--
-- Table structure for table `active_students`
--

CREATE TABLE `active_students` (
  `active_id` int(11) NOT NULL,
  `student_id` int(11) DEFAULT NULL,
  `university_id` int(11) DEFAULT NULL,
  `time_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `assigned_units`
--

CREATE TABLE `assigned_units` (
  `id` int(11) NOT NULL,
  `year_study` int(11) DEFAULT NULL,
  `semeter` int(11) DEFAULT NULL,
  `course` int(11) DEFAULT NULL,
  `course_unit` int(11) DEFAULT NULL,
  `_who_added` int(11) DEFAULT NULL,
  `t_created_on` date DEFAULT NULL,
  `t_updated_on` date DEFAULT NULL,
  `_status` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `assigned_units`
--

INSERT INTO `assigned_units` (`id`, `year_study`, `semeter`, `course`, `course_unit`, `_who_added`, `t_created_on`, `t_updated_on`, `_status`) VALUES
(1, 1, 1, 1, 2, 20, NULL, NULL, 1),
(2, 1, 1, 1, 3, 20, NULL, NULL, 0),
(3, 1, 1, 1, 4, 20, NULL, NULL, 0),
(4, 1, 1, 1, 5, 20, NULL, NULL, 0),
(5, 1, 1, 1, 6, 20, NULL, NULL, 0),
(6, 2, 2, 8, 11, 20, NULL, NULL, 0),
(7, 2, 2, 8, 13, 20, NULL, NULL, 0),
(8, 2, 2, 8, 19, 20, NULL, NULL, 0),
(9, 2, 2, 8, 24, 20, NULL, NULL, 0),
(10, 2, 2, 8, 30, 20, NULL, NULL, 0),
(11, 2, 1, 1, 1225, 10, NULL, NULL, 0),
(12, 2, 1, 1, 1229, 10, NULL, NULL, 0),
(13, 2, 1, 1, 1234, 10, NULL, NULL, 0),
(14, 2, 1, 1, 1239, 10, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `balances_temp`
--

CREATE TABLE `balances_temp` (
  `id` int(11) NOT NULL,
  `amount` double DEFAULT NULL,
  `student` int(11) DEFAULT NULL,
  `_when_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `balances_temp`
--

INSERT INTO `balances_temp` (`id`, `amount`, `student`, `_when_added`) VALUES
(3, 184000, 1960, '2018-01-04 05:29:26');

-- --------------------------------------------------------

--
-- Table structure for table `campus_calendar`
--

CREATE TABLE `campus_calendar` (
  `id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=Active, 0=Block'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `campus_events`
--

CREATE TABLE `campus_events` (
  `event_id` int(11) NOT NULL,
  `title` varchar(1000) DEFAULT NULL,
  `event_detail` varchar(1000) DEFAULT NULL,
  `time_stamp` varchar(100) DEFAULT NULL,
  `_when_added` date DEFAULT NULL,
  `_who_added` int(11) DEFAULT NULL,
  `university_university_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `chatgroups`
--

CREATE TABLE `chatgroups` (
  `group_id` int(11) NOT NULL,
  `group_name` varchar(200) DEFAULT NULL,
  `university_id` int(11) NOT NULL,
  `_when_added` date DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `open` int(11) NOT NULL DEFAULT '0' COMMENT '1 public,0 private group',
  `_who_added` int(11) DEFAULT NULL,
  `t_created_on` date DEFAULT NULL,
  `t_updated_on` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `chatgroups`
--

INSERT INTO `chatgroups` (`group_id`, `group_name`, `university_id`, `_when_added`, `status`, `open`, `_who_added`, `t_created_on`, `t_updated_on`) VALUES
(1, 'MAY 2013 BCS', 2, '2017-09-23', 0, 0, NULL, NULL, NULL),
(2, 'SEPTEMBER 2013 BCS', 2, '2017-09-23', 0, 0, NULL, NULL, NULL),
(3, 'MAY 2014 BCS', 2, '2017-09-23', 0, 0, NULL, NULL, NULL),
(4, 'SEPTEMBER 2014 BCS', 2, '2017-09-23', 0, 0, NULL, NULL, NULL),
(5, 'JANUARY 2015 BCS', 2, '2017-09-23', 0, 0, NULL, NULL, NULL),
(6, 'MAY 2015 BCS', 2, '2017-09-23', 0, 0, NULL, NULL, NULL),
(7, 'SEPTEMBER 2015  BCS', 2, '2017-09-23', 0, 0, NULL, NULL, NULL),
(8, 'JANUARY 2016  BCS', 2, '2017-09-23', 0, 0, NULL, NULL, NULL),
(9, 'MAY 2016 BCS', 2, '2017-09-23', 0, 0, NULL, NULL, NULL),
(10, 'SEPTEMBER 2016 BCS', 2, '2017-09-23', 0, 0, NULL, NULL, NULL),
(11, 'MAY 2017 BCS', 2, '2017-09-23', 0, 0, NULL, NULL, NULL),
(12, 'SEPTEMBER 2017 BCS', 2, '2017-09-23', 0, 0, NULL, NULL, NULL),
(13, 'MAY 2013 BIST', 2, '2017-09-23', 0, 0, NULL, NULL, NULL),
(14, 'SEPTEMBER 2013 BIST', 2, '2017-09-23', 0, 0, NULL, NULL, NULL),
(15, 'JANUARY 2014 BIST', 2, '2017-09-23', 0, 0, NULL, NULL, NULL),
(16, 'MAY 2014 BIST', 2, '2017-09-23', 0, 0, NULL, NULL, NULL),
(17, 'SEPTEMBER 2014 BIST', 2, '2017-09-23', 0, 0, NULL, NULL, NULL),
(18, 'JANUARY 2015 BIST', 2, '2017-09-23', 0, 0, NULL, NULL, NULL),
(19, 'MAY 2015 BIST', 2, '2017-09-23', 0, 0, NULL, NULL, NULL),
(20, 'SEPTEMBER 2015  BIST', 2, '2017-09-23', 0, 0, NULL, NULL, NULL),
(21, 'JANUARY 2016  BIST', 2, '2017-09-23', 0, 0, NULL, NULL, NULL),
(22, 'MAY 2016 BIST', 2, '2017-09-23', 0, 0, NULL, NULL, NULL),
(23, 'SEPTEMBER 2016 BIST', 2, '2017-09-23', 0, 0, NULL, NULL, NULL),
(24, 'JANUARY 2017 BIST', 2, '2017-09-23', 0, 0, NULL, NULL, NULL),
(25, 'MAY 2017 BIST', 2, '2017-09-23', 0, 0, NULL, NULL, NULL),
(26, 'SEPTEMBER 2017 BIST', 2, '2017-09-23', 0, 0, NULL, NULL, NULL),
(27, 'JANUARY 2018 BIST', 2, '2017-09-23', 0, 0, NULL, NULL, NULL),
(29, 'JANUARY 2014 BMCC', 2, '2017-09-23', 0, 0, NULL, NULL, NULL),
(30, 'SEPTEMBER 2014 BMCC', 2, '2017-09-23', 0, 0, NULL, NULL, NULL),
(31, 'JANUARY 2015 BMCC', 2, '2017-09-23', 0, 0, NULL, NULL, NULL),
(32, 'SEPTEMBER 2015  BMCC', 2, '2017-09-23', 0, 0, NULL, NULL, NULL),
(33, 'JANUARY 2015 BCSF', 2, '2017-09-23', 0, 0, NULL, NULL, NULL),
(34, 'SEPTEMBER 2015  BCSF', 2, '2017-09-23', 0, 0, NULL, NULL, NULL),
(35, 'JANUARY 2016  BCSF', 2, '2017-09-23', 0, 0, NULL, NULL, NULL),
(36, 'SEPTEMBER 2016 BCSF', 2, '2017-09-23', 0, 0, NULL, NULL, NULL),
(37, 'JANUARY 2017 BCSF', 2, '2017-09-23', 0, 0, NULL, NULL, NULL),
(38, 'MAY 2017 BCSF', 2, '2017-09-23', 0, 0, NULL, NULL, NULL),
(39, 'SEPTEMBER 2017 BCSF', 2, '2017-09-23', 0, 0, NULL, NULL, NULL),
(40, 'SEPTEMBER 2014 BCE', 2, '2017-09-23', 0, 0, NULL, NULL, NULL),
(41, 'MAY 2015 BCE', 2, '2017-09-23', 0, 0, NULL, NULL, NULL),
(42, 'SEPTEMBER 2015  BCE', 2, '2017-09-23', 0, 0, NULL, NULL, NULL),
(43, 'JANUARY 2016  BCE', 2, '2017-09-23', 0, 0, NULL, NULL, NULL),
(44, 'SEPTEMBER 2016 BCE', 2, '2017-09-23', 0, 0, NULL, NULL, NULL),
(45, 'JANUARY 2017 BCE', 2, '2017-09-23', 0, 0, NULL, NULL, NULL),
(46, 'SEPTEMBER 2017 BCE', 2, '2017-09-23', 0, 0, NULL, NULL, NULL),
(47, 'SEPTEMBER 2014 BSE', 2, '2017-09-23', 0, 0, NULL, NULL, NULL),
(48, 'MAY 2015 BSE', 2, '2017-09-23', 0, 0, NULL, NULL, NULL),
(49, 'SEPTEMBER 2015  BSE', 2, '2017-09-23', 0, 0, NULL, NULL, NULL),
(50, 'JANUARY 2016  BSE', 2, '2017-09-23', 0, 0, NULL, NULL, NULL),
(51, 'MAY 2016 BSE', 2, '2017-09-23', 0, 0, NULL, NULL, NULL),
(52, 'SEPTEMBER 2016 BSE', 2, '2017-09-23', 0, 0, NULL, NULL, NULL),
(53, 'MAY 2017 BSE', 2, '2017-09-23', 0, 0, NULL, NULL, NULL),
(54, 'SEPTEMBER 2017 BSE', 2, '2017-09-23', 0, 0, NULL, NULL, NULL),
(55, 'SEPTEMBER 2014 BIS', 2, '2017-09-23', 0, 0, NULL, NULL, NULL),
(56, 'MAY 2013 BA.ECON', 2, '2017-09-23', 0, 0, NULL, NULL, NULL),
(57, 'SEPTEMBER 2013 BA.ECON', 2, '2017-09-23', 0, 0, NULL, NULL, NULL),
(58, 'JANUARY 2014 BA.ECON', 2, '2017-09-23', 0, 0, NULL, NULL, NULL),
(59, 'MAY 2014 BA.ECON', 2, '2017-09-23', 0, 0, NULL, NULL, NULL),
(60, 'SEPTEMBER 2014 BA.ECON', 2, '2017-09-23', 0, 0, NULL, NULL, NULL),
(61, 'SEPTEMBER 2017 BA.ECON', 2, '2017-09-23', 0, 0, NULL, NULL, NULL),
(62, 'MAY 2013 BBA', 2, '2017-09-23', 0, 0, NULL, NULL, NULL),
(63, 'SEPTEMBER 2013 BBA', 2, '2017-09-23', 0, 0, NULL, NULL, NULL),
(64, 'JANUARY 2014 BBA', 2, '2017-09-23', 0, 0, NULL, NULL, NULL),
(65, 'MAY 2014 BBA', 2, '2017-09-23', 0, 0, NULL, NULL, NULL),
(66, 'SEPTEMBER 2014 BBA', 2, '2017-09-23', 0, 0, NULL, NULL, NULL),
(67, 'JANUARY 2015 BBA', 2, '2017-09-23', 0, 0, NULL, NULL, NULL),
(68, 'MAY 2015 BBA', 2, '2017-09-23', 0, 0, NULL, NULL, NULL),
(69, 'SEPTEMBER 2015  BBA', 2, '2017-09-23', 0, 0, NULL, NULL, NULL),
(70, 'JANUARY 2016  BBA', 2, '2017-09-23', 0, 0, NULL, NULL, NULL),
(71, 'MAY 2016 BBA', 2, '2017-09-23', 0, 0, NULL, NULL, NULL),
(72, 'SEPTEMBER 2016 BBA', 2, '2017-09-23', 0, 0, NULL, NULL, NULL),
(73, 'JANUARY 2017 BBA', 2, '2017-09-23', 0, 0, NULL, NULL, NULL),
(74, 'MAY 2017 BBA', 2, '2017-09-23', 0, 0, NULL, NULL, NULL),
(75, 'SEPTEMBER 2017 BBA', 2, '2017-09-23', 0, 0, NULL, NULL, NULL),
(76, 'JANUARY 2014 BPSCM', 2, '2017-09-23', 0, 0, NULL, NULL, NULL),
(77, 'SEPTEMBER 2014 BPSCM', 2, '2017-09-23', 0, 0, NULL, NULL, NULL),
(78, 'MAY 2015 BPSCM', 2, '2017-09-23', 0, 0, NULL, NULL, NULL),
(79, 'SEPTEMBER 2015  BPSCM', 2, '2017-09-23', 0, 0, NULL, NULL, NULL),
(80, 'JANUARY 2016  BPSCM', 2, '2017-09-23', 0, 0, NULL, NULL, NULL),
(81, 'MAY 2016 BPSCM', 2, '2017-09-23', 0, 0, NULL, NULL, NULL),
(82, 'SEPTEMBER 2016 BPSCM', 2, '2017-09-23', 0, 0, NULL, NULL, NULL),
(83, 'JANUARY 2017 BPSCM', 2, '2017-09-23', 0, 0, NULL, NULL, NULL),
(84, 'MAY 2017 BPSCM', 2, '2017-09-23', 0, 0, NULL, NULL, NULL),
(85, 'SEPTEMBER 2017 BPSCM', 2, '2017-09-23', 0, 0, NULL, NULL, NULL),
(86, 'JANUARY 2014 BPAM', 2, '2017-09-23', 0, 0, NULL, NULL, NULL),
(87, 'JANUARY 2015 BPAM', 2, '2017-09-24', 0, 0, NULL, NULL, NULL),
(88, 'SEPTEMBER 2015  BPAM', 2, '2017-09-24', 0, 0, NULL, NULL, NULL),
(89, 'JANUARY 2016  BPAM', 2, '2017-09-24', 0, 0, NULL, NULL, NULL),
(90, 'MAY 2016 BPAM', 2, '2017-09-24', 0, 0, NULL, NULL, NULL),
(91, 'SEPTEMBER 2017 BPAM', 2, '2017-09-24', 0, 0, NULL, NULL, NULL),
(92, 'MAY 2014 BHRM', 2, '2017-09-24', 0, 0, NULL, NULL, NULL),
(93, 'MAY 2015 BHRM', 2, '2017-09-24', 0, 0, NULL, NULL, NULL),
(94, 'SEPTEMBER 2015  BHRM', 2, '2017-09-24', 0, 0, NULL, NULL, NULL),
(95, 'SEPTEMBER 2017 BHRM', 2, '2017-09-24', 0, 0, NULL, NULL, NULL),
(96, 'SEPTEMBER 2014 BOGM', 2, '2017-09-24', 0, 0, NULL, NULL, NULL),
(97, 'JANUARY 2015 BOGM', 2, '2017-09-24', 0, 0, NULL, NULL, NULL),
(98, 'MAY 2015 BOGM', 2, '2017-09-24', 0, 0, NULL, NULL, NULL),
(99, 'SEPTEMBER 2015  BOGM', 2, '2017-09-24', 0, 0, NULL, NULL, NULL),
(100, 'JANUARY 2016  BOGM', 2, '2017-09-24', 0, 0, NULL, NULL, NULL),
(101, 'SEPTEMBER 2016 BOGM', 2, '2017-09-24', 0, 0, NULL, NULL, NULL),
(102, 'JANUARY 2017 BOGM', 2, '2017-09-24', 0, 0, NULL, NULL, NULL),
(103, 'MAY 2017 BOGM', 2, '2017-09-24', 0, 0, NULL, NULL, NULL),
(104, 'SEPTEMBER 2017 BOGM', 2, '2017-09-24', 0, 0, NULL, NULL, NULL),
(105, 'SEPTEMBER 2014 BMCJ', 2, '2017-09-24', 0, 0, NULL, NULL, NULL),
(106, 'SEPTEMBER 2015  BMCJ', 2, '2017-09-24', 0, 0, NULL, NULL, NULL),
(107, 'SEPTEMBER 2016 BMCJ', 2, '2017-09-24', 0, 0, NULL, NULL, NULL),
(108, 'JANUARY 2017 BMCJ', 2, '2017-09-24', 0, 0, NULL, NULL, NULL),
(109, 'MAY 2017 BMCJ', 2, '2017-09-24', 0, 0, NULL, NULL, NULL),
(110, 'SEPTEMBER 2017 BMCJ', 2, '2017-09-24', 0, 0, NULL, NULL, NULL),
(111, 'SEPTEMBER 2014 BAF', 2, '2017-09-24', 0, 0, NULL, NULL, NULL),
(112, 'SEPTEMBER 2015  BAF', 2, '2017-09-24', 0, 0, NULL, NULL, NULL),
(113, 'JANUARY 2016  BAF', 2, '2017-09-24', 0, 0, NULL, NULL, NULL),
(114, 'MAY 2016 BAF', 2, '2017-09-24', 0, 0, NULL, NULL, NULL),
(115, 'SEPTEMBER 2016 BAF', 2, '2017-09-24', 0, 0, NULL, NULL, NULL),
(116, 'JANUARY 2017 BAF', 2, '2017-09-24', 0, 0, NULL, NULL, NULL),
(117, 'MAY 2017 BAF', 2, '2017-09-24', 0, 0, NULL, NULL, NULL),
(118, 'SEPTEMBER 2017 BAF', 2, '2017-09-24', 0, 0, NULL, NULL, NULL),
(119, 'SEPTEMBER 2014 BQE', 2, '2017-09-24', 0, 0, NULL, NULL, NULL),
(120, 'SEPTEMBER 2017 BQE', 2, '2017-09-24', 0, 0, NULL, NULL, NULL),
(121, 'SEPTEMBER 2014 BPPM', 2, '2017-09-24', 0, 0, NULL, NULL, NULL),
(122, 'JANUARY 2015 BPPM', 2, '2017-09-24', 0, 0, NULL, NULL, NULL),
(123, 'SEPTEMBER 2015  BPPM', 2, '2017-09-24', 0, 0, NULL, NULL, NULL),
(124, 'JANUARY 2016  BPPM', 2, '2017-09-24', 0, 0, NULL, NULL, NULL),
(125, 'MAY 2016 BPPM', 2, '2017-09-24', 0, 0, NULL, NULL, NULL),
(126, 'SEPTEMBER 2016 BPPM', 2, '2017-09-24', 0, 0, NULL, NULL, NULL),
(127, 'SEPTEMBER 2017 BPPM', 2, '2017-09-24', 0, 0, NULL, NULL, NULL),
(128, 'MAY 2015 BSTAT', 2, '2017-09-24', 0, 0, NULL, NULL, NULL),
(129, 'SEPTEMBER 2017 BSTAT', 2, '2017-09-24', 0, 0, NULL, NULL, NULL),
(130, 'SEPTEMBER 2014 DC', 2, '2017-09-24', 0, 0, NULL, NULL, NULL),
(131, 'JANUARY 2014 DC', 2, '2017-09-24', 0, 0, NULL, NULL, NULL),
(132, 'JANUARY 2015 DC', 2, '2017-09-24', 0, 0, NULL, NULL, NULL),
(133, 'MAY 2015 DC', 2, '2017-09-24', 0, 0, NULL, NULL, NULL),
(134, 'SEPTEMBER 2015  DC', 2, '2017-09-24', 0, 0, NULL, NULL, NULL),
(135, 'MAY 2016 DC', 2, '2017-09-24', 0, 0, NULL, NULL, NULL),
(136, 'SEPTEMBER 2016 DC', 2, '2017-09-24', 0, 0, NULL, NULL, NULL),
(137, 'JANUARY 2017 DC', 2, '2017-09-24', 0, 0, NULL, NULL, NULL),
(138, 'MAY 2017 DC', 2, '2017-09-24', 0, 0, NULL, NULL, NULL),
(139, 'SEPTEMBER 2017 DC', 2, '2017-09-24', 0, 0, NULL, NULL, NULL),
(140, 'JANUARY 2017 PGD ME', 2, '2017-09-26', 0, 0, NULL, NULL, NULL),
(141, 'MAY 2017 PGD IT', 2, '2017-09-26', 0, 0, NULL, NULL, NULL),
(142, 'MAY 2017 PGD ME', 2, '2017-09-26', 0, 0, NULL, NULL, NULL),
(143, 'MAY 2017 PGD PA', 2, '2017-09-26', 0, 0, NULL, NULL, NULL),
(144, 'MAY 2017 DPPM', 2, '2017-09-26', 0, 0, NULL, NULL, NULL),
(145, 'JANUARY 2017 PGD.PP', 2, '2017-09-26', 0, 0, NULL, NULL, NULL),
(146, 'JANUARY 2017 PGD IS', 2, '2017-09-26', 0, 0, NULL, NULL, NULL),
(147, 'JANUARY 2017 PGD PPM', 2, '2017-09-26', 0, 0, NULL, NULL, NULL),
(148, 'JANUARY 2017 PGD.HRMD', 2, '2017-09-26', 0, 0, NULL, NULL, NULL),
(149, 'SEPTEMBER 2017 PGD C', 2, '2017-09-26', 0, 0, NULL, NULL, NULL),
(150, 'MAY 2017 PGD PPM', 2, '2017-09-26', 0, 0, NULL, NULL, NULL),
(151, 'SEPTEMBER 2017 PGD.HRMD', 2, '2017-09-26', 0, 0, NULL, NULL, NULL),
(152, 'JANUARY 2017 PGD IT', 2, '2017-09-26', 0, 0, NULL, NULL, NULL),
(153, 'SEPTEMBER 2017 PGD IS', 2, '2017-09-26', 0, 0, NULL, NULL, NULL),
(154, 'SEPTEMBER 2017 PGD IT', 2, '2017-09-26', 0, 0, NULL, NULL, NULL),
(155, 'MAY 2017 PGD IS', 2, '2017-09-26', 0, 0, NULL, NULL, NULL),
(156, 'SEPTEMBER 2017 PGD ME', 2, '2017-09-26', 0, 0, NULL, NULL, NULL),
(157, 'SEPTEMBER 2017 PGD PA', 2, '2017-09-26', 0, 0, NULL, NULL, NULL),
(158, 'JANUARY 2017 PGD PA', 2, '2017-09-26', 0, 0, NULL, NULL, NULL),
(159, 'SEPTEMBER 2017 PGD PPM', 2, '2017-09-26', 0, 0, NULL, NULL, NULL),
(160, 'JANUARY 2017 PGD.OGM', 2, '2017-09-26', 0, 0, NULL, NULL, NULL),
(161, 'SEPTEMBER 2017 PGD.OGM', 2, '2017-09-26', 0, 0, NULL, NULL, NULL),
(162, 'MAY 2017 MPAM', 2, '2017-09-26', 0, 0, NULL, NULL, NULL),
(163, 'MAY 2017 MBA', 2, '2017-09-26', 0, 0, NULL, NULL, NULL),
(164, 'MAY 2017 EMBA', 2, '2017-09-26', 0, 0, NULL, NULL, NULL),
(165, 'MAY 2017 MME', 2, '2017-09-26', 0, 0, NULL, NULL, NULL),
(166, 'MAY 2017 MIT', 2, '2017-09-26', 0, 0, NULL, NULL, NULL),
(167, 'JANUARY 2017 EMBA', 2, '2017-09-26', 0, 0, NULL, NULL, NULL),
(168, 'MAY 2017 MIS', 2, '2017-09-26', 0, 0, NULL, NULL, NULL),
(169, 'JANUARY 2017 MIS', 2, '2017-09-26', 0, 0, NULL, NULL, NULL),
(170, 'JANUARY 2017 MIT', 2, '2017-09-26', 0, 0, NULL, NULL, NULL),
(171, 'JANUARY 2017 MME', 2, '2017-09-26', 0, 0, NULL, NULL, NULL),
(172, 'MAY 2017 MSC', 2, '2017-09-26', 0, 0, NULL, NULL, NULL),
(173, 'JANUARY 2017 MPAM', 2, '2017-09-26', 0, 0, NULL, NULL, NULL),
(174, 'JANUARY 2017 MSC', 2, '2017-09-26', 0, 0, NULL, NULL, NULL),
(175, 'MAY 2015 EMBA', 2, '2017-09-26', 0, 0, NULL, NULL, NULL),
(176, 'SEPTEMBER 2015  MBA', 2, '2017-09-26', 0, 0, NULL, NULL, NULL),
(177, 'MAY 2015 MPAM', 2, '2017-09-26', 0, 0, NULL, NULL, NULL),
(178, 'MAY 2015 MME', 2, '2017-09-26', 0, 0, NULL, NULL, NULL),
(179, 'MAY 2015 MSC', 2, '2017-09-26', 0, 0, NULL, NULL, NULL),
(180, 'SEPTEMBER 2015  MME', 2, '2017-09-26', 0, 0, NULL, NULL, NULL),
(181, 'SEPTEMBER 2015  EMBA', 2, '2017-09-26', 0, 0, NULL, NULL, NULL),
(182, 'SEPTEMBER 2015  MPAM', 2, '2017-09-26', 0, 0, NULL, NULL, NULL),
(183, 'JANUARY 2015 PGD ME', 2, '2017-09-26', 0, 0, NULL, NULL, NULL),
(184, 'JANUARY 2015 PGD.PP', 2, '2017-09-26', 0, 0, NULL, NULL, NULL),
(185, 'JANUARY 2015 PGD.HRMD', 2, '2017-09-26', 0, 0, NULL, NULL, NULL),
(186, 'JANUARY 2015 PGD PPM', 2, '2017-09-26', 0, 0, NULL, NULL, NULL),
(187, 'JANUARY 2015 PGD.OGM', 2, '2017-09-26', 0, 0, NULL, NULL, NULL),
(188, 'SEPTEMBER 2015  MIS', 2, '2017-09-26', 0, 0, NULL, NULL, NULL),
(189, 'JANUARY 2015 MIS', 2, '2017-09-26', 0, 0, NULL, NULL, NULL),
(190, 'SEPTEMBER 2015  MIT', 2, '2017-09-26', 0, 0, NULL, NULL, NULL),
(191, 'SEPTEMBER 2015  PGD.OGM', 2, '2017-09-26', 0, 0, NULL, NULL, NULL),
(192, 'SEPTEMBER 2015  PGD ME', 2, '2017-09-26', 0, 0, NULL, NULL, NULL),
(193, 'SEPTEMBER 2015  PGD PPM', 2, '2017-09-26', 0, 0, NULL, NULL, NULL),
(194, 'SEPTEMBER 2015  PGD C', 2, '2017-09-26', 0, 0, NULL, NULL, NULL),
(195, 'SEPTEMBER 2015  PGD.PP', 2, '2017-09-26', 0, 0, NULL, NULL, NULL),
(196, 'SEPTEMBER 2015  PGD.HRMD', 2, '2017-09-26', 0, 0, NULL, NULL, NULL),
(197, 'SEPTEMBER 2015  PGD PA', 2, '2017-09-26', 0, 0, NULL, NULL, NULL),
(198, 'SEPTEMBER 2015  PGD IS', 2, '2017-09-26', 0, 0, NULL, NULL, NULL),
(199, 'MAY 2015 PGD.OGM', 2, '2017-09-26', 0, 0, NULL, NULL, NULL),
(200, 'MAY 2015 PGD ME', 2, '2017-09-26', 0, 0, NULL, NULL, NULL),
(201, 'MAY 2015 PGD PPM', 2, '2017-09-26', 0, 0, NULL, NULL, NULL),
(202, 'MAY 2015 PGD C', 2, '2017-09-26', 0, 0, NULL, NULL, NULL),
(203, 'MAY 2015 PGD.PP', 2, '2017-09-26', 0, 0, NULL, NULL, NULL),
(204, 'MAY 2015 PGD PA', 2, '2017-09-26', 0, 0, NULL, NULL, NULL),
(205, 'SEPTEMBER 2016 MIS', 2, '2017-10-21', 0, 0, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `chatroom`
--

CREATE TABLE `chatroom` (
  `room_id` int(11) NOT NULL,
  `_when_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `chatroom`
--

INSERT INTO `chatroom` (`room_id`, `_when_created`) VALUES
(1, '2017-10-06 16:06:55'),
(2, '2017-10-06 17:03:34'),
(3, '2017-10-06 17:46:07'),
(4, '2017-10-06 17:49:32'),
(5, '2017-10-06 19:26:24'),
(6, '2017-10-06 20:38:07');

-- --------------------------------------------------------

--
-- Table structure for table `chat_memebers`
--

CREATE TABLE `chat_memebers` (
  `id` int(11) NOT NULL,
  `member_id` int(11) DEFAULT NULL,
  `chatroom_id` int(11) DEFAULT NULL,
  `_when_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `chat_memebers`
--

INSERT INTO `chat_memebers` (`id`, `member_id`, `chatroom_id`, `_when_added`) VALUES
(1, 1, 1, '2017-10-06 16:06:55'),
(2, 2, 1, '2017-10-06 16:06:55'),
(3, 1, 2, '2017-10-06 17:03:34'),
(4, 3, 2, '2017-10-06 17:03:34'),
(5, 4, 3, '2017-10-06 17:46:07'),
(6, 2, 3, '2017-10-06 17:46:07'),
(7, 5, 4, '2017-10-06 17:49:32'),
(8, 2, 4, '2017-10-06 17:49:32'),
(9, 6, 5, '2017-10-06 19:26:24'),
(10, 2, 5, '2017-10-06 19:26:24'),
(11, 7, 6, '2017-10-06 20:38:07'),
(12, 8, 6, '2017-10-06 20:38:07');

-- --------------------------------------------------------

--
-- Table structure for table `chat_mgs`
--

CREATE TABLE `chat_mgs` (
  `message_id` int(11) NOT NULL,
  `message` text,
  `users_id` int(11) DEFAULT NULL,
  `room_id` int(11) DEFAULT NULL,
  `_when_sent` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `chat_mgs`
--

INSERT INTO `chat_mgs` (`message_id`, `message`, `users_id`, `room_id`, `_when_sent`) VALUES
(5, 'hello sir', 1, 1, '2017-10-06 16:07:04'),
(6, 'how is the day going', 1, 1, '2017-10-06 16:07:47'),
(7, 'Am ok how can I help', 2, 1, '2017-10-06 16:08:29'),
(8, 'l need some help l have family problem', 1, 1, '2017-10-06 16:09:04'),
(9, 'Ok what is the issue', 2, 1, '2017-10-06 16:12:23'),
(10, 'daddy not paying fees', 1, 1, '2017-10-06 16:13:55'),
(11, 'yet he has money', 1, 1, '2017-10-06 16:14:25'),
(12, 'hello', 1, 2, '2017-10-06 17:03:42'),
(13, 'how are u madam', 1, 2, '2017-10-06 17:03:58'),
(14, 'am not madam....call me Ronah', 3, 2, '2017-10-06 17:04:43'),
(15, 'ok. got it', 1, 2, '2017-10-06 17:05:16'),
(16, 'thanks', 1, 2, '2017-10-06 17:05:54'),
(17, 'Hello Sir', 4, 3, '2017-10-06 17:46:30'),
(18, 'Hello what up', 2, 3, '2017-10-06 17:46:53'),
(19, 'we are having really slow internet', 4, 3, '2017-10-06 17:47:27'),
(20, 'Ok that will sorted out', 2, 3, '2017-10-06 17:48:17'),
(21, 'thank you sir', 4, 3, '2017-10-06 17:48:49'),
(22, 'hello Proff.Jude', 5, 4, '2017-10-06 17:49:45'),
(23, 'Hello what is cooking', 2, 4, '2017-10-06 17:50:12'),
(24, 'are you at canpus', 2, 4, '2017-10-06 17:50:45'),
(25, 'Am at campus', 5, 4, '2017-10-06 17:51:11'),
(26, 'ðŸ‘€', 6, 5, '2017-10-06 19:26:49'),
(27, 'hello Mr Mersian', 7, 6, '2017-10-06 20:38:21'),
(28, 'hello Emmanuel?', 8, 6, '2017-10-07 03:44:49'),
(29, 'hello good morning', 1, 1, '2017-10-10 07:40:46'),
(30, 'am ok how are u', 2, 1, '2017-10-10 07:41:18'),
(31, 'what can i help u', 2, 1, '2017-10-10 07:41:47'),
(68, 'worked', 2, 1, '2017-10-16 16:56:41'),
(69, 'you', 2, 1, '2017-10-16 16:57:05'),
(70, 'way', 1, 1, '2017-10-16 16:57:39');

-- --------------------------------------------------------

--
-- Table structure for table `chat_users`
--

CREATE TABLE `chat_users` (
  `chat_user_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `user_type` enum('staff','student') DEFAULT NULL,
  `full_name` varchar(300) DEFAULT NULL,
  `token` varchar(300) DEFAULT NULL,
  `photo` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `chat_users`
--

INSERT INTO `chat_users` (`chat_user_id`, `user_id`, `user_type`, `full_name`, `token`, `photo`) VALUES
(1, 1960, 'student', 'JUDE  LUBEGA', 'dbpKfRGbkg4:APA91bH1fHU07VTEvvH2BEEuPuqRCTCY1lNTlvhswU-M1cqSfLBS3HxSOV7ZnzXASsp8mR7p3_f3arrJWfW7OdjM-IR-8wQRXa8p7BrbleEGBXjJmJr6A6Pg3SHwe_zs3vo_YvZvNEee', '1508330968195.jpg'),
(2, 14, 'staff', 'Jude Lubega', '', '1508255989863.jpg'),
(3, 16, 'staff', 'Ronah  Arinanye Tugume', 'cWSEetFYB-U:APA91bGQ5pLCNy5Lxl12zpQvYiyZNDTgNSGZZJ9a1auMobvJo6zBAUzQo8zZTYYKXmUODtwppX8nSEX6Id5S5kp3AkRUOHqwy2BRq8ly-VYjTUw43DYsSmjm7ToOHo5y5Ft2xmhOmLGZ', NULL),
(4, 412, 'student', 'KWESIGA Blair ', 'e1vELyAUwow:APA91bE5dMQ00jWYXJXQzQ-zl3vd6Y9UgbDshgfFsPmKbz5epZKHEda51-XDSVLqe3qsqkQIwpFl69QYcQymQxRC7c_LzdKDeo7uALeCDSrh-TSd2K97SzeclYffsJCpbhoJ8n_L-Y6L', NULL),
(5, 1174, 'student', 'OMONDI Ricky ', 'csZcZ9oR6MI:APA91bHJYC8v3X_aWPMY0d7nmG4RPgkWyGUQwKbHEMNzfVbGanJI0LRcqbZSNt9JAsa7qaGFVKvbIS0Wgj24eyZjuouc6fiW5ZBkfm316iwcndl6RC3v09R8y4CmTjI10Gv5fBTw-oGx', NULL),
(6, 1182, 'student', 'LUKWAGO Joseph ', 'c3Yb0y57f-8:APA91bG_7ugX_V2ESQre8UntDc2XUfK1_JC3Pm-Lu9ltnvKXG9kTY6KGKMXvH395CZqi4Z72F5sVkz0K0FDXjntZhlEKYJAyPYzH5VL7uEgYwzDS86bpiI6awjtmaMhtfpv69XxPtzGv', NULL),
(7, 626, 'student', 'KATABAAZI Emmanuel ', 'f_ScJEdnx0c:APA91bH5jKFnF-6bHcClB8Bq2OdKME7tAFq33SIWFopUb8xxlwkq60IjHhE-LRY4VFJ-9W9ocSmVws8jN6yXL3IMOBdRLfkUcW3S_opHHtI7JxUmh-3h8EybZIhHaVV29u7XHkCPwd4V', NULL),
(8, 19, 'staff', 'Mersian  Tulyahebwa', 'ek_tii16yyQ:APA91bHsa0l1f6fOYbYS_UxVOs-9QSBiaqL5DmXot8SlynfaEw0KkjJt66e63617MRLQoo0jzN9fUyGcInDNqs-GmqzONxMTR55ikRMtQHLa_hFTiXkuhokBrazMaHHnshvMe60Nhskq', '');

-- --------------------------------------------------------

--
-- Table structure for table `complaints_details`
--

CREATE TABLE `complaints_details` (
  `id` int(11) NOT NULL,
  `complaint_id` int(11) DEFAULT NULL,
  `year_id` int(50) NOT NULL,
  `semester_id` int(50) NOT NULL,
  `lecture` varchar(100) DEFAULT NULL,
  `course_unit_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `complaints_details`
--

INSERT INTO `complaints_details` (`id`, `complaint_id`, `year_id`, `semester_id`, `lecture`, `course_unit_id`) VALUES
(1, 14, 2, 1, 'sekito moses', 1229),
(2, 14, 2, 1, 'sekito moses', 1229),
(3, 15, 2, 1, 'sekito moses', 1229),
(4, 16, 1, 1, '', 6);

-- --------------------------------------------------------

--
-- Table structure for table `complaint_receiver`
--

CREATE TABLE `complaint_receiver` (
  `id` int(11) NOT NULL,
  `complaint` int(11) DEFAULT NULL,
  `target` int(100) DEFAULT NULL,
  `message_type` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `complaint_receiver`
--

INSERT INTO `complaint_receiver` (`id`, `complaint`, `target`, `message_type`) VALUES
(5, 16, 1, 'forward');

-- --------------------------------------------------------

--
-- Table structure for table `complaint_reply`
--

CREATE TABLE `complaint_reply` (
  `complaint_reply_id` int(11) NOT NULL,
  `complaint_reply` longtext,
  `complaints_complaint_id` int(11) NOT NULL,
  `_who_added` int(11) NOT NULL,
  `_when_added` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `complaint_response`
--

CREATE TABLE `complaint_response` (
  `id` int(11) NOT NULL,
  `complaint` int(11) DEFAULT NULL,
  `message` text,
  `action` varchar(100) DEFAULT NULL,
  `forwarded_to` int(11) DEFAULT NULL,
  `file` varchar(100) DEFAULT NULL,
  `_who_added` int(11) DEFAULT NULL,
  `_when_added` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `complaint_response`
--

INSERT INTO `complaint_response` (`id`, `complaint`, `message`, `action`, `forwarded_to`, `file`, `_who_added`, `_when_added`) VALUES
(14, 16, 'Your Complaint has been handled amicably.', 'reply', NULL, NULL, 20, '2018-01-09 12:11:44');

-- --------------------------------------------------------

--
-- Table structure for table `complaint_types`
--

CREATE TABLE `complaint_types` (
  `complaint_types_id` int(11) NOT NULL,
  `type` varchar(45) DEFAULT NULL,
  `university_university_id` int(11) DEFAULT NULL,
  `_when_added` date NOT NULL,
  `_who_added` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `complaint_types`
--

INSERT INTO `complaint_types` (`complaint_types_id`, `type`, `university_university_id`, `_when_added`, `_who_added`) VALUES
(1, 'Missing Course Work', 2, '2017-09-23', 10),
(2, 'Missing Exam', 2, '2017-09-23', 10),
(3, 'Missing All', 2, '2017-09-23', 10),
(4, 'Remarking', 2, '2017-09-23', 10),
(5, 'Others(Specify)', 2, '2017-09-23', 10);

-- --------------------------------------------------------

--
-- Table structure for table `counsellors`
--

CREATE TABLE `counsellors` (
  `counsellor_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `university_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `counsellors`
--

INSERT INTO `counsellors` (`counsellor_id`, `user_id`, `university_id`) VALUES
(1, 14, 2),
(2, 15, 2),
(3, 16, 2),
(4, 17, 2),
(5, 18, 2),
(6, 19, 2);

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `course_id` int(11) NOT NULL,
  `course_code` varchar(50) NOT NULL,
  `course` varchar(100) DEFAULT NULL,
  `universities_university_id` int(11) DEFAULT NULL,
  `_when_added` date DEFAULT NULL,
  `_who_added` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `level` int(11) DEFAULT '0',
  `dept_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`course_id`, `course_code`, `course`, `universities_university_id`, `_when_added`, `_who_added`, `status`, `level`, `dept_id`) VALUES
(1, 'BCS', 'Bachelor of Computer Science', 2, '2017-09-22', 10, 0, 0, 1),
(2, 'BSE', 'Bachelor of Software Engineering', 2, '2017-09-22', 10, 0, 0, 1),
(3, 'BCE', 'Bachelor of Computer Engineering', 2, '2017-09-22', 10, 0, 0, 1),
(4, 'BCSF', 'Bachelor of Computer Security and Forensics', 2, '2017-09-22', 10, 0, 0, 1),
(5, 'BMCC', 'Bachelor of Mobile Computing-and Communications', 2, '2017-09-22', 10, 0, 0, 1),
(8, 'DC', 'Diploma in Computing', 2, '2017-09-22', 10, 0, 0, 7),
(9, 'BIS', 'Bachelor of Information Science', 2, '2017-09-22', 10, 0, 0, 2),
(10, 'BIST', 'Bachelor of Information Systems and Technology', 2, '2017-09-22', 10, 0, 0, 2),
(11, 'BBC', 'Bachelor of Business Computing', 2, '2017-09-22', 10, 0, 0, 2),
(12, 'BA.ECON', 'Bachelor of Arts in Economics', 2, '2017-09-23', 10, 0, 0, 3),
(13, 'BSTAT', 'Bachelor of Science in statistics', 2, '2017-09-23', 10, 0, 0, 3),
(14, '', 'Bachelor of Science in Development Economics', 2, '2017-09-23', 10, 0, 0, 3),
(15, 'BQE', 'Bachelors in Quantitative Economics', 2, '2017-09-23', 10, 0, 0, 3),
(16, 'BBA', 'Bachelor of Business Administration', 2, '2017-09-23', 10, 0, 0, 4),
(17, 'BPSCM', 'Bachelor of Procurement and Supply chain Management', 2, '2017-09-23', 10, 0, 0, 4),
(18, 'BAF', 'Bachelor of Finance and Accounting', 2, '2017-09-23', 10, 0, 0, 4),
(20, 'BPAM', 'Bachelor of Public Administration and Management', 2, '2017-09-23', 10, 0, 0, 5),
(21, 'BMCJ', 'Bachelor of Mass Communication and Journalism', 2, '2017-09-23', 10, 0, 0, 5),
(22, 'BOGM', 'Bachelors in Oil and Gas Management', 2, '2017-09-23', 10, 0, 0, 5),
(23, 'BHRM', 'Bachelor of Human Resource Management', 2, '2017-09-23', 10, 0, 0, 5),
(24, 'BPPM', 'Bachelors in Project Planning and Management', 2, '2017-09-23', 10, 0, 0, 6),
(28, 'PGD C', 'Postgraduate Diploma in Computing', 2, '2017-09-26', 10, 0, 1, 1),
(29, 'PGD IS', 'Postgraduate Diploma in Information Systems', 2, '2017-09-26', 10, 0, 1, 2),
(30, 'PGD IT', 'Postgraduate Diploma in Information Technology ', 2, '2017-09-26', 10, 0, 1, 2),
(31, 'MSC', 'Master of Science in Computing ', 2, '2017-09-26', 10, 0, 1, 2),
(32, 'MCCS', 'MSc. Computing (Computer Security) ', 2, '2017-09-26', 10, 0, 1, 2),
(33, 'MCCN', 'MSc. Computing (Computer Networks) ', 2, '2017-09-26', 10, 0, 1, 2),
(34, 'MCMC', 'MSc. Computing (Mobile Computing) ', 2, '2017-09-26', 10, 0, 1, 2),
(36, 'MIT', 'Master of Information Technology', 2, '2017-09-26', 10, 0, 1, 1),
(37, 'MIS', 'Master of Information Systems', 2, '2017-09-26', 10, 0, 1, 1),
(39, 'MCIT', 'MSc. Computing (Information Technology) ', 2, '2017-09-26', 10, 0, 1, 1),
(43, 'PGD ME', 'Postgraduate Diploma in Monitoring and Evaluation', 2, '2017-09-26', 10, 0, 1, 6),
(55, 'MME', 'Master of Project Monitoring and Evaluation ', 2, '2017-09-26', 10, 0, 1, 4),
(56, 'EMBA', 'The Executive Master of Business Administration', 2, '2017-09-26', 10, 0, 1, 4),
(58, 'MBA', 'Master of Business Administration ', 2, '2017-09-26', 10, 0, 1, 4),
(59, 'MPAM', 'Master of Public Administration and Management', 2, '2017-09-26', 10, 0, 1, 4),
(75, 'PGD PA', 'Postgraduate Diploma in Public Administration', 2, '2017-09-26', 10, 0, 0, 7),
(76, 'PGD PPM', 'Post Graduate Diploma in Project Planning and Management', 2, '2017-09-26', 10, 0, 0, 7),
(77, 'PGD.HRMD', 'Postgraduate Diploma in Human Resource Management & Development', 2, '2017-09-26', 10, 0, 0, 7),
(80, 'DBA', 'Diploma in Business Administration', 2, '2017-09-26', 10, 0, 0, 7),
(81, 'DPPM', 'Diploma in Project Planning and Management', 2, '2017-09-26', 10, 0, 0, 7),
(82, 'DPSCM', 'Diploma in Procurement and Supply Chain Management', 2, '2017-09-26', 10, 0, 0, 7),
(83, 'PGD.PP', 'Post Graduate Diploma in Public Procurement', 2, '2017-09-26', 10, 0, 1, 4),
(84, 'PGD.OGM', 'Post Graduate Diploma in Oil Governance and Management', 2, '2017-09-26', 10, 0, 1, 4),
(85, 'MCIS', 'MSc. Computing (Information Systems)', 2, '2017-10-05', 10, 0, 1, 2),
(86, 'BSWASWA', 'Social work and admin', 2, NULL, 10, 0, 0, 3),
(87, 'Try', 'Tru', 2, NULL, NULL, 1, 0, 4);

-- --------------------------------------------------------

--
-- Table structure for table `course_units`
--

CREATE TABLE `course_units` (
  `id` int(11) NOT NULL,
  `code` varchar(50) NOT NULL,
  `course_unit` varchar(100) DEFAULT NULL,
  `cu` int(11) NOT NULL,
  `university_id` int(11) DEFAULT NULL,
  `_who_added` int(11) NOT NULL,
  `_status` int(11) NOT NULL DEFAULT '0',
  `t_created_on` date NOT NULL,
  `t_updated_on` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `course_units`
--

INSERT INTO `course_units` (`id`, `code`, `course_unit`, `cu`, `university_id`, `_who_added`, `_status`, `t_created_on`, `t_updated_on`) VALUES
(2, 'CS 100', 'Structured Programming', 4, 2, 20, 0, '0000-00-00', NULL),
(3, 'CS 101', 'Computer Applications & Systems', 3, 2, 20, 0, '0000-00-00', NULL),
(4, 'BA 100', 'Organisational Theory & Management', 3, 2, 20, 0, '0000-00-00', NULL),
(5, 'BA 104', 'Business Communication', 3, 2, 20, 0, '0000-00-00', NULL),
(6, 'MT 100', 'Computational Mathematics', 3, 2, 20, 0, '0000-00-00', NULL),
(8, 'IS 201', 'Management Information Systems', 3, 2, 20, 0, '0000-00-00', NULL),
(9, 'BA 107', 'Principles of Marketing', 3, 2, 20, 0, '0000-00-00', NULL),
(10, 'CS 200', 'Object Oriented programming', 4, 2, 20, 0, '0000-00-00', NULL),
(11, 'MT 105', 'Probability & Statistics', 4, 2, 20, 0, '0000-00-00', NULL),
(12, 'TM 100', 'Community Engagement I', 5, 2, 20, 0, '0000-00-00', NULL),
(13, 'IT 202', 'Legal & Ethical Issues in Computing', 3, 2, 20, 0, '0000-00-00', NULL),
(17, 'CS 201', 'Operating Systems', 4, 2, 20, 0, '0000-00-00', NULL),
(18, 'IS 202', 'Systems Analysis & Design', 3, 2, 20, 0, '0000-00-00', NULL),
(19, 'IS 301', 'Data Warehousing', 3, 2, 20, 0, '0000-00-00', NULL),
(20, 'IS 302', 'Business Process Modeling', 4, 2, 20, 0, '0000-00-00', NULL),
(21, 'TM 201', 'Research Methods', 3, 2, 20, 0, '0000-00-00', NULL),
(22, 'IT 200', 'Information Security', 3, 2, 20, 0, '0000-00-00', NULL),
(23, 'IS 303', 'Enterprise Architecture', 4, 2, 20, 0, '0000-00-00', NULL),
(24, 'TM 200', 'Community Engagement II', 3, 2, 20, 0, '0000-00-00', NULL),
(25, 'IS 203', 'Risk Management and Control', 3, 2, 20, 0, '0000-00-00', NULL),
(26, 'IS 304', 'Emerging Trends in Information Systems', 4, 2, 20, 0, '0000-00-00', NULL),
(27, 'IS 305', 'Modeling & Simulation', 3, 2, 20, 0, '0000-00-00', NULL),
(28, 'IS 200', 'Systems Administration', 4, 2, 20, 0, '0000-00-00', NULL),
(29, 'IT 203', 'Human Computer Interaction', 5, 2, 20, 0, '0000-00-00', NULL),
(30, 'NW 201', 'Mobile Applications Programming', 3, 2, 20, 0, '0000-00-00', NULL),
(31, 'CS 301', 'Games Development', 3, 2, 20, 0, '0000-00-00', NULL),
(32, 'IT 300', 'Emerging Trends in Information Technology', 4, 2, 20, 0, '0000-00-00', NULL),
(33, 'BA 200', 'Project Planning and Management', 4, 2, 20, 0, '0000-00-00', NULL),
(34, 'IS 306', 'Data Mining & Business Intelligence', 3, 2, 20, 0, '0000-00-00', NULL),
(35, 'TM 301', 'Project', 3, 2, 20, 0, '0000-00-00', NULL),
(36, 'CS 305', 'Image Processing', 4, 2, 20, 0, '0000-00-00', NULL),
(37, 'CS 306', 'Data Forensics', 3, 2, 20, 0, '0000-00-00', NULL),
(38, 'NW 301', 'Network Security', 4, 2, 20, 0, '0000-00-00', NULL),
(93, 'IT 100', 'Internet Technology & Web site Design', 4, 2, 20, 0, '0000-00-00', NULL),
(96, 'MT 101', 'Discrete Mathematics', 3, 2, 20, 0, '0000-00-00', NULL),
(97, 'CS 102', 'Computer Architecture', 3, 2, 20, 0, '0000-00-00', NULL),
(99, 'IS 100', 'ICT in Organizations', 3, 2, 20, 0, '0000-00-00', NULL),
(101, 'MT 104', 'Linear Programming', 4, 2, 20, 0, '0000-00-00', NULL),
(104, 'CS 202', 'Data Structures & Algorithms', 3, 2, 20, 0, '0000-00-00', NULL),
(105, 'CS 203', 'Arti?cial Intelligence', 3, 2, 20, 0, '0000-00-00', NULL),
(106, 'BA 108', 'Entrepreneurship Theory & Principles', 3, 2, 20, 0, '0000-00-00', NULL),
(107, 'NW 200', 'Computer Networks & Data Communications', 4, 2, 20, 0, '0000-00-00', NULL),
(108, 'IS 300', 'Database Management Systems', 4, 2, 20, 0, '0000-00-00', NULL),
(109, 'CS 204', 'Systems Programming', 4, 2, 20, 0, '0000-00-00', NULL),
(1138, 'HR 600', 'Human Resource Management & Development', 3, 2, 20, 0, '0000-00-00', NULL),
(1139, 'BA 615', 'Strategic Planning & Management', 3, 2, 20, 0, '0000-00-00', NULL),
(1140, 'BA 617', 'Decentralization & Local Governance', 3, 2, 20, 0, '0000-00-00', NULL),
(1141, 'M 100', 'Foundations of Project Planning & Management', 4, 2, 20, 0, '0000-00-00', NULL),
(1142, 'PM 101', 'Project Planning, Programming and IT Systems', 3, 2, 20, 0, '0000-00-00', NULL),
(1144, 'PM 103', 'Government and Politics in Africa', 3, 2, 20, 0, '0000-00-00', NULL),
(1145, 'PM 104', 'Project Budgeting & Financial Management', 3, 2, 20, 0, '0000-00-00', NULL),
(1146, 'PM 105', 'Public infrastructure Planning and Management', 3, 2, 20, 0, '0000-00-00', NULL),
(1147, 'PM 120', 'Project Implementation Analysis & Management', 3, 2, 20, 0, '0000-00-00', NULL),
(1148, 'PM 121', 'Project Procurement Management', 3, 2, 20, 0, '0000-00-00', NULL),
(1149, 'PM 122', 'Project Human Resource Management', 3, 2, 20, 0, '0000-00-00', NULL),
(1150, 'PM 123', 'Risk Management in Projects and Programmes', 3, 2, 20, 0, '0000-00-00', NULL),
(1151, 'PM 124', 'Project Monitoring and Evaluation', 3, 2, 20, 0, '0000-00-00', NULL),
(1152, 'PM 125', 'Research Methods for Project Management', 3, 2, 20, 0, '0000-00-00', NULL),
(1153, 'HR 100', 'Foundations of Human Resource Management & Dvt', 4, 2, 20, 0, '0000-00-00', NULL),
(1154, 'BA 604', 'Organizational Change and Development', 3, 2, 20, 0, '0000-00-00', NULL),
(1155, 'HR 102', 'Government and Politics in Africa', 3, 2, 20, 0, '0000-00-00', NULL),
(1156, 'HR103', 'Organization Theory and Management', 3, 2, 20, 0, '0000-00-00', NULL),
(1157, 'HR 104', 'Human Resource Planning and Development', 3, 2, 20, 0, '0000-00-00', NULL),
(1158, 'HR 105', 'Communication Skills for HR professional', 3, 2, 20, 0, '0000-00-00', NULL),
(1159, 'HR 120', 'Training of Trainers', 3, 2, 20, 0, '0000-00-00', NULL),
(1160, 'HR 121', 'Employee Law and Relations', 3, 2, 20, 0, '0000-00-00', NULL),
(1161, 'HR 122', 'Compensation and Benefits Administration', 3, 2, 20, 0, '0000-00-00', NULL),
(1162, 'HR 123', 'Accounting and Finance for Managers', 3, 2, 20, 0, '0000-00-00', NULL),
(1163, 'HR 124', 'Human Resource Information systems', 3, 2, 20, 0, '0000-00-00', NULL),
(1164, 'HR 125', 'Research Methods and Decision Making', 3, 2, 20, 0, '0000-00-00', NULL),
(1168, 'BA 207', 'Introduction to Business Law', 3, 2, 20, 0, '0000-00-00', NULL),
(1173, 'BA 110', 'Principles of Project Management', 3, 2, 20, 0, '0000-00-00', NULL),
(1175, 'EC 104', 'Quantitative Methods', 4, 2, 20, 0, '0000-00-00', NULL),
(1177, 'BA 202', 'Intermediate Business Accounting', 3, 2, 20, 0, '0000-00-00', NULL),
(1178, 'BA 204', 'Business Financial Management', 3, 2, 20, 0, '0000-00-00', NULL),
(1179, 'BA 205', 'Business Statistics', 4, 2, 20, 0, '0000-00-00', NULL),
(1182, 'BA 221', 'Entrepreneurship Development', 4, 2, 20, 0, '0000-00-00', NULL),
(1183, 'BA 222', 'Principles of Insurance', 4, 2, 20, 0, '0000-00-00', NULL),
(1184, 'BA 223', 'Rural and Development Management', 4, 2, 20, 0, '0000-00-00', NULL),
(1185, 'BA 224', 'Introduction to Management Accounting', 4, 2, 20, 0, '0000-00-00', NULL),
(1186, 'TM 202', 'Diploma Project', 4, 2, 20, 0, '0000-00-00', NULL),
(1189, 'PM 106', 'Introduction to Procurement & Business Law', 3, 2, 20, 0, '0000-00-00', NULL),
(1190, 'EC 100', 'Introduction to Micro Economics', 3, 2, 20, 0, '0000-00-00', NULL),
(1194, 'EC 102', 'Introduction to Macro Economics', 3, 2, 20, 0, '0000-00-00', NULL),
(1197, 'PM 200', 'Risk Management in Supply Chains', 4, 2, 20, 0, '0000-00-00', NULL),
(1198, 'BA 115', 'Principles of Resource Mobilisation', 3, 2, 20, 0, '0000-00-00', NULL),
(1200, 'PM 201', 'International Procurement Management', 3, 2, 20, 0, '0000-00-00', NULL),
(1201, 'PM 202', 'Logistics Management', 3, 2, 20, 0, '0000-00-00', NULL),
(1205, 'BA 220', 'Entrepreneurship Development', 4, 2, 20, 0, '0000-00-00', NULL),
(1206, 'PM 203', 'E-Procurement Applications', 4, 2, 20, 0, '0000-00-00', NULL),
(1207, 'PM 204', 'Procurement Audits and Investigations', 4, 2, 20, 0, '0000-00-00', NULL),
(1208, 'PM 205', 'Managing supply chain Relationships', 4, 2, 20, 0, '0000-00-00', NULL),
(1210, 'PP 100', 'Principles of Public Procurement', 4, 2, 20, 0, '0000-00-00', NULL),
(1211, 'PP 101', 'Foundations of Public Administration', 3, 2, 20, 0, '0000-00-00', NULL),
(1212, 'PP 102', 'Public Procurement and Development', 3, 2, 20, 0, '0000-00-00', NULL),
(1213, 'PP 103', 'Public Financial Management', 3, 2, 20, 0, '0000-00-00', NULL),
(1214, 'PP 104', 'Government and Politics in Africa', 3, 2, 20, 0, '0000-00-00', NULL),
(1215, 'PP 105', 'Ethics and Public Procurement Law', 3, 2, 20, 0, '0000-00-00', NULL),
(1216, 'PP 120', 'Comparative Public Procurement systems', 3, 2, 20, 0, '0000-00-00', NULL),
(1217, 'PP 121', 'Government contracting Management', 3, 2, 20, 0, '0000-00-00', NULL),
(1218, 'PP 122', 'Public Procurement Information systems', 3, 2, 20, 0, '0000-00-00', NULL),
(1219, 'PP 123', 'Public Procurement stakeholder Governance', 3, 2, 20, 0, '0000-00-00', NULL),
(1220, 'PP 124', 'Project Planning and Management', 3, 2, 20, 0, '0000-00-00', NULL),
(1221, 'PP 125', 'Research Methods', 3, 2, 20, 0, '0000-00-00', NULL),
(1222, 'OG 100', 'Foundations ofOil and Gas Industry', 4, 2, 20, 0, '0000-00-00', NULL),
(1223, 'OG 101', 'Oil and Gas Governance Frameworks', 4, 2, 20, 0, '0000-00-00', NULL),
(1224, 'OG 102', 'Oil and Gas Supply Chain Management', 4, 2, 20, 0, '0000-00-00', NULL),
(1225, 'OG 103', 'Society, Government and Politics in Africa', 3, 2, 20, 0, '0000-00-00', NULL),
(1226, 'OG 104', 'Infrastructure Planning and Management', 3, 2, 20, 0, '0000-00-00', NULL),
(1227, 'OG 105', 'Comparative management of oil & gas', 4, 2, 20, 0, '0000-00-00', NULL),
(1228, 'OG 120', 'Corporate Governance and Decision Making', 4, 2, 20, 0, '0000-00-00', NULL),
(1229, 'OG 121', 'Public Financial Management', 3, 2, 20, 0, '0000-00-00', NULL),
(1230, 'OG 122', 'Human Resource Management', 3, 2, 20, 0, '0000-00-00', NULL),
(1231, 'OG 123', 'Public Policy and Management', 3, 2, 20, 0, '0000-00-00', NULL),
(1232, 'OG 124', 'ICT Application in Oil & Gas Management', 4, 2, 20, 0, '0000-00-00', NULL),
(1233, 'OG 125', 'Research Methods for Decision Making', 3, 2, 20, 0, '0000-00-00', NULL),
(1234, 'PA 502', 'Public Financial Management', 3, 2, 20, 0, '0000-00-00', NULL),
(1235, 'PA 504', 'Public Administration Theory & Practice', 3, 2, 20, 0, '0000-00-00', NULL),
(1236, 'ME 500', 'Monitoring & Evaluation: Paradigms, Principles & Concepts', 3, 2, 20, 0, '0000-00-00', NULL),
(1237, 'LW 500', 'Administrative Law ', 3, 2, 20, 0, '0000-00-00', NULL),
(1238, 'HR 501', 'Human Resource Planning & Development', 3, 2, 20, 0, '0000-00-00', NULL),
(1239, 'TM 500', 'Research Methods', 3, 2, 20, 0, '0000-00-00', NULL),
(1240, 'PA 501', 'Public Policy Design & Management', 3, 2, 20, 0, '0000-00-00', NULL),
(1241, 'PA 503', 'Corporate Governance & Decision Making', 3, 2, 20, 0, '0000-00-00', NULL),
(1242, 'PA 506', 'Comparative Public Administration', 3, 2, 20, 0, '0000-00-00', NULL),
(1243, 'PA 507', 'Decentralization & Local Governance', 3, 2, 20, 0, '0000-00-00', NULL),
(1244, 'PP 501', 'Public Procurement Management & Administration', 3, 2, 20, 0, '0000-00-00', NULL),
(1245, 'PA 505', 'Public Service Management', 3, 2, 20, 0, '0000-00-00', NULL),
(1246, 'TM 602', 'Legal & Ethical Issues', 3, 2, 20, 0, '0000-00-00', NULL),
(1247, 'BA 600', 'Entrepreneurship Development', 3, 2, 20, 0, '0000-00-00', NULL),
(1248, 'TM 600', 'Research Methodology Seminars', 3, 2, 20, 0, '0000-00-00', NULL),
(1249, 'TM 601', 'Dissertation', 5, 2, 20, 0, '0000-00-00', NULL),
(1250, 'ME 505', 'Consultancy Skills Development', 3, 2, 20, 0, '0000-00-00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `depts`
--

CREATE TABLE `depts` (
  `dept_id` int(11) NOT NULL,
  `dept` varchar(100) DEFAULT NULL,
  `university_id` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT '0',
  `school_id` int(11) DEFAULT NULL,
  `_who_added` int(11) NOT NULL,
  `_when_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `depts`
--

INSERT INTO `depts` (`dept_id`, `dept`, `university_id`, `status`, `school_id`, `_who_added`, `_when_added`) VALUES
(1, 'Computer Science and Engineering', 2, 0, 2, 10, '2017-09-29 11:24:08'),
(2, 'Information Systems andTechnology', 2, 0, 2, 10, '2017-09-29 11:24:39'),
(3, 'Economics and Statistics', 2, 0, 1, 10, '2017-09-29 11:21:25'),
(4, 'Business Administration', 2, 0, 1, 10, '2017-09-29 11:22:23'),
(5, 'Political Science and Public Administration', 2, 0, 1, 10, '2017-09-29 11:22:50'),
(6, 'Project Management and evaluation', 2, 0, 1, 10, '2017-09-29 11:23:15'),
(7, 'vocational Education', 2, 0, 3, 10, '2017-09-29 11:26:25'),
(9, 'Networks Department', 2, 0, 2, 0, '2017-12-19 13:19:06'),
(11, 'Educ', 2, 0, 1, 0, '2017-12-19 14:00:50'),
(12, 'Physics', 2, 0, 1, 0, '2017-12-19 14:03:32'),
(13, 'Math', 2, 0, 1, 0, '2017-12-19 14:03:52');

-- --------------------------------------------------------

--
-- Table structure for table `dept_courses`
--

CREATE TABLE `dept_courses` (
  `dept_course_id` int(11) NOT NULL,
  `dept_id` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `_when_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `_who_added` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dept_members`
--

CREATE TABLE `dept_members` (
  `member_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL COMMENT 'member id',
  `school_id` int(11) DEFAULT NULL,
  `_when_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `_who_added` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dept_members`
--

INSERT INTO `dept_members` (`member_id`, `user_id`, `school_id`, `_when_added`, `_who_added`) VALUES
(1, 11, 1, '2017-10-06 05:01:07', 10),
(2, 12, 3, '2017-10-06 05:04:00', 10),
(4, 15, 3, '2017-12-19 14:25:43', 10);

-- --------------------------------------------------------

--
-- Table structure for table `fees_categories`
--

CREATE TABLE `fees_categories` (
  `cat_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `paid_times` enum('Per Semester','Per Year') DEFAULT NULL,
  `_who_added` int(11) DEFAULT NULL,
  `university_id` int(11) DEFAULT NULL,
  `_when_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fees_categories`
--

INSERT INTO `fees_categories` (`cat_id`, `name`, `paid_times`, `_who_added`, `university_id`, `_when_added`, `status`) VALUES
(1, 'Tuition Fees', 'Per Semester', 10, 2, '2017-12-18 08:56:45', 0),
(2, 'Guild Fees', 'Per Year', 10, 2, '2017-12-18 08:56:57', 0),
(3, 'Functional Fees', 'Per Year', 10, 2, '2017-12-18 08:57:06', 0),
(4, 'NCHE', 'Per Year', 10, 2, '2017-12-18 08:57:11', 0),
(5, 'Free Larcing', 'Per Year', 10, 2, '2017-12-17 21:00:00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `fees_structure`
--

CREATE TABLE `fees_structure` (
  `fees_id` int(11) NOT NULL,
  `fees_category` int(11) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `_who_added` int(11) DEFAULT NULL,
  `_when_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fees_structure`
--

INSERT INTO `fees_structure` (`fees_id`, `fees_category`, `amount`, `course_id`, `_who_added`, `_when_added`, `status`) VALUES
(1, 1, 800000, 1, 10, '2017-10-15 21:00:00', 0),
(2, 2, 200000, 1, 10, '2017-10-15 21:00:00', 0),
(3, 3, 300000, 1, 10, '2017-10-15 21:00:00', 0),
(4, 4, 24000, 1, 10, '2017-10-15 21:00:00', 0),
(5, 1, 1300000, 2, 20, '2017-12-20 21:00:00', 0),
(6, 2, 200000, 2, 20, '2017-12-20 21:00:00', 0),
(7, 4, 25000, 2, 20, '2017-12-20 21:00:00', 0),
(8, 5, 10000, 2, 20, '2017-12-20 21:00:00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `general_complaints`
--

CREATE TABLE `general_complaints` (
  `id` int(11) NOT NULL,
  `message` text,
  `attachment` varchar(300) DEFAULT NULL,
  `_who_added` int(11) DEFAULT NULL,
  `_when_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `_status` int(11) DEFAULT NULL COMMENT '0- fees 1 -marks compliant',
  `university_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `general_complaints`
--

INSERT INTO `general_complaints` (`id`, `message`, `attachment`, `_who_added`, `_when_added`, `_status`, `university_id`) VALUES
(16, 'Hello There', '', 1960, '2018-01-09 10:58:35', 0, 2);

-- --------------------------------------------------------

--
-- Table structure for table `grading`
--

CREATE TABLE `grading` (
  `grading_id` int(11) NOT NULL,
  `grade` varchar(50) DEFAULT NULL,
  `value_frm` int(11) DEFAULT NULL,
  `value_to` int(11) DEFAULT NULL,
  `grade_value` float DEFAULT NULL,
  `university_id` int(11) DEFAULT NULL,
  `progress` int(11) NOT NULL DEFAULT '0',
  `level` int(11) DEFAULT '0' COMMENT '0 under graduate,1 post graduate'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `grading`
--

INSERT INTO `grading` (`grading_id`, `grade`, `value_frm`, `value_to`, `grade_value`, `university_id`, `progress`, `level`) VALUES
(1, 'A+', 90, 100, 5, 2, 0, 1),
(2, 'A', 80, 89, 5, 2, 0, 1),
(3, 'B+', 75, 79, 4.5, 2, 0, 1),
(4, 'B', 70, 74, 4, 2, 0, 1),
(5, 'C+', 65, 69, 3.5, 2, 0, 1),
(6, 'C', 60, 64, 3, 2, 0, 1),
(7, 'D+', 55, 59, 2.5, 2, 1, 1),
(8, 'D', 50, 54, 2, 2, 1, 1),
(9, 'E', 45, 49, 1.5, 2, 1, 1),
(10, 'E-', 40, 44, 1, 2, 1, 1),
(11, 'F', 0, 39, 0, 2, 1, 1),
(12, 'A+', 90, 100, 5, 2, 0, 0),
(13, 'A', 80, 89, 5, 2, 0, 0),
(14, 'B+', 75, 79, 4.5, 2, 0, 0),
(15, 'B', 70, 74, 4, 2, 0, 0),
(16, 'C+', 65, 69, 3.5, 2, 0, 0),
(17, 'C', 60, 64, 3, 2, 0, 0),
(18, 'D+', 55, 59, 2.5, 2, 0, 0),
(19, 'D', 50, 54, 2, 2, 0, 0),
(20, 'E', 45, 49, 1.5, 2, 1, 0),
(21, 'E-', 40, 44, 1, 2, 1, 0),
(22, 'F', 0, 39, 0, 2, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `group_members`
--

CREATE TABLE `group_members` (
  `member_id` int(11) NOT NULL,
  `role` varchar(100) DEFAULT 'user',
  `student_student_id` int(11) DEFAULT NULL,
  `group_group_id` int(11) DEFAULT NULL,
  `_when_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int(11) NOT NULL DEFAULT '0',
  `t_created_on` date DEFAULT NULL,
  `t_updated_on` date DEFAULT NULL,
  `_who_added` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `group_members`
--

INSERT INTO `group_members` (`member_id`, `role`, `student_student_id`, `group_group_id`, `_when_added`, `status`, `t_created_on`, `t_updated_on`, `_who_added`) VALUES
(1, 'user', 1, 1, '2017-09-23 19:38:41', 0, NULL, NULL, NULL),
(2, 'user', 2, 1, '2017-09-23 19:38:41', 0, NULL, NULL, NULL),
(3, 'user', 3, 1, '2017-09-23 19:38:41', 0, NULL, NULL, NULL),
(4, 'user', 4, 1, '2017-09-23 19:38:41', 0, NULL, NULL, NULL),
(5, 'user', 5, 1, '2017-09-23 19:38:41', 0, NULL, NULL, NULL),
(6, 'user', 6, 1, '2017-09-23 19:38:41', 0, NULL, NULL, NULL),
(8, 'user', 7, 2, '2017-09-23 19:40:50', 0, NULL, NULL, NULL),
(9, 'user', 8, 2, '2017-09-23 19:40:50', 0, NULL, NULL, NULL),
(10, 'user', 9, 2, '2017-09-23 19:40:50', 0, NULL, NULL, NULL),
(11, 'user', 10, 2, '2017-09-23 19:40:50', 0, NULL, NULL, NULL),
(12, 'user', 11, 2, '2017-09-23 19:40:50', 0, NULL, NULL, NULL),
(13, 'user', 12, 2, '2017-09-23 19:40:50', 0, NULL, NULL, NULL),
(14, 'user', 13, 2, '2017-09-23 19:40:50', 0, NULL, NULL, NULL),
(15, 'user', 14, 2, '2017-09-23 19:40:50', 0, NULL, NULL, NULL),
(16, 'user', 15, 2, '2017-09-23 19:40:50', 0, NULL, NULL, NULL),
(17, 'user', 16, 2, '2017-09-23 19:40:50', 0, NULL, NULL, NULL),
(18, 'user', 17, 2, '2017-09-23 19:40:50', 0, NULL, NULL, NULL),
(19, 'user', 18, 2, '2017-09-23 19:40:50', 0, NULL, NULL, NULL),
(20, 'user', 19, 2, '2017-09-23 19:40:50', 0, NULL, NULL, NULL),
(21, 'user', 20, 2, '2017-09-23 19:40:50', 0, NULL, NULL, NULL),
(22, 'user', 21, 2, '2017-09-23 19:40:50', 0, NULL, NULL, NULL),
(23, 'user', 22, 2, '2017-09-23 19:40:50', 0, NULL, NULL, NULL),
(24, 'user', 23, 2, '2017-09-23 19:40:50', 0, NULL, NULL, NULL),
(25, 'user', 24, 2, '2017-09-23 19:40:50', 0, NULL, NULL, NULL),
(26, 'user', 25, 2, '2017-09-23 19:40:50', 0, NULL, NULL, NULL),
(27, 'user', 26, 2, '2017-09-23 19:40:50', 0, NULL, NULL, NULL),
(28, 'user', 27, 2, '2017-09-23 19:40:50', 0, NULL, NULL, NULL),
(29, 'user', 28, 2, '2017-09-23 19:40:50', 0, NULL, NULL, NULL),
(30, 'user', 29, 2, '2017-09-23 19:40:50', 0, NULL, NULL, NULL),
(31, 'user', 30, 2, '2017-09-23 19:40:50', 0, NULL, NULL, NULL),
(32, 'user', 31, 2, '2017-09-23 19:40:50', 0, NULL, NULL, NULL),
(33, 'user', 32, 2, '2017-09-23 19:40:50', 0, NULL, NULL, NULL),
(34, 'user', 33, 2, '2017-09-23 19:40:50', 0, NULL, NULL, NULL),
(35, 'user', 34, 2, '2017-09-23 19:40:50', 0, NULL, NULL, NULL),
(36, 'user', 35, 2, '2017-09-23 19:40:50', 0, NULL, NULL, NULL),
(37, 'user', 36, 2, '2017-09-23 19:40:50', 0, NULL, NULL, NULL),
(38, 'user', 37, 2, '2017-09-23 19:40:50', 0, NULL, NULL, NULL),
(39, 'user', 38, 2, '2017-09-23 19:40:50', 0, NULL, NULL, NULL),
(40, 'user', 39, 2, '2017-09-23 19:40:50', 0, NULL, NULL, NULL),
(41, 'user', 40, 2, '2017-09-23 19:40:50', 0, NULL, NULL, NULL),
(42, 'user', 41, 2, '2017-09-23 19:40:50', 0, NULL, NULL, NULL),
(43, 'user', 42, 2, '2017-09-23 19:40:50', 0, NULL, NULL, NULL),
(44, 'user', 43, 2, '2017-09-23 19:40:50', 0, NULL, NULL, NULL),
(46, 'user', 44, 3, '2017-09-23 19:43:06', 0, NULL, NULL, NULL),
(47, 'user', 45, 3, '2017-09-23 19:43:06', 0, NULL, NULL, NULL),
(48, 'user', 46, 3, '2017-09-23 19:43:06', 0, NULL, NULL, NULL),
(49, 'user', 47, 3, '2017-09-23 19:43:06', 0, NULL, NULL, NULL),
(50, 'user', 48, 3, '2017-09-23 19:43:06', 0, NULL, NULL, NULL),
(52, 'user', 49, 4, '2017-09-23 19:44:13', 0, NULL, NULL, NULL),
(53, 'user', 50, 4, '2017-09-23 19:44:13', 0, NULL, NULL, NULL),
(54, 'user', 51, 4, '2017-09-23 19:44:13', 0, NULL, NULL, NULL),
(55, 'user', 52, 4, '2017-09-23 19:44:13', 0, NULL, NULL, NULL),
(56, 'user', 53, 4, '2017-09-23 19:44:13', 0, NULL, NULL, NULL),
(57, 'user', 54, 4, '2017-09-23 19:44:13', 0, NULL, NULL, NULL),
(58, 'user', 55, 4, '2017-09-23 19:44:13', 0, NULL, NULL, NULL),
(59, 'user', 56, 4, '2017-09-23 19:44:13', 0, NULL, NULL, NULL),
(60, 'user', 57, 4, '2017-09-23 19:44:13', 0, NULL, NULL, NULL),
(61, 'user', 58, 4, '2017-09-23 19:44:13', 0, NULL, NULL, NULL),
(62, 'user', 59, 4, '2017-09-23 19:44:13', 0, NULL, NULL, NULL),
(63, 'user', 60, 4, '2017-09-23 19:44:13', 0, NULL, NULL, NULL),
(64, 'user', 61, 4, '2017-09-23 19:44:13', 0, NULL, NULL, NULL),
(65, 'user', 62, 4, '2017-09-23 19:44:13', 0, NULL, NULL, NULL),
(66, 'user', 63, 4, '2017-09-23 19:44:13', 0, NULL, NULL, NULL),
(67, 'user', 64, 4, '2017-09-23 19:44:13', 0, NULL, NULL, NULL),
(68, 'user', 65, 4, '2017-09-23 19:44:13', 0, NULL, NULL, NULL),
(70, 'user', 66, 5, '2017-09-23 19:45:25', 0, NULL, NULL, NULL),
(72, 'user', 67, 6, '2017-09-23 19:46:03', 0, NULL, NULL, NULL),
(73, 'user', 68, 6, '2017-09-23 19:46:03', 0, NULL, NULL, NULL),
(74, 'user', 69, 6, '2017-09-23 19:46:03', 0, NULL, NULL, NULL),
(75, 'user', 70, 6, '2017-09-23 19:46:03', 0, NULL, NULL, NULL),
(76, 'user', 71, 6, '2017-09-23 19:46:03', 0, NULL, NULL, NULL),
(77, 'user', 72, 6, '2017-09-23 19:46:03', 0, NULL, NULL, NULL),
(78, 'user', 73, 6, '2017-09-23 19:46:03', 0, NULL, NULL, NULL),
(79, 'user', 74, 6, '2017-09-23 19:46:03', 0, NULL, NULL, NULL),
(80, 'user', 75, 6, '2017-09-23 19:46:03', 0, NULL, NULL, NULL),
(81, 'user', 76, 6, '2017-09-23 19:46:03', 0, NULL, NULL, NULL),
(82, 'user', 77, 6, '2017-09-23 19:46:03', 0, NULL, NULL, NULL),
(84, 'user', 78, 7, '2017-09-23 19:46:35', 0, NULL, NULL, NULL),
(85, 'user', 79, 7, '2017-09-23 19:46:35', 0, NULL, NULL, NULL),
(86, 'user', 80, 7, '2017-09-23 19:46:35', 0, NULL, NULL, NULL),
(87, 'user', 81, 7, '2017-09-23 19:46:35', 0, NULL, NULL, NULL),
(88, 'user', 82, 7, '2017-09-23 19:46:35', 0, NULL, NULL, NULL),
(89, 'user', 83, 7, '2017-09-23 19:46:35', 0, NULL, NULL, NULL),
(90, 'user', 84, 7, '2017-09-23 19:46:35', 0, NULL, NULL, NULL),
(91, 'user', 85, 7, '2017-09-23 19:46:35', 0, NULL, NULL, NULL),
(92, 'user', 86, 7, '2017-09-23 19:46:35', 0, NULL, NULL, NULL),
(93, 'user', 87, 7, '2017-09-23 19:46:35', 0, NULL, NULL, NULL),
(94, 'user', 88, 7, '2017-09-23 19:46:35', 0, NULL, NULL, NULL),
(95, 'user', 89, 7, '2017-09-23 19:46:35', 0, NULL, NULL, NULL),
(96, 'user', 90, 7, '2017-09-23 19:46:35', 0, NULL, NULL, NULL),
(97, 'user', 91, 7, '2017-09-23 19:46:35', 0, NULL, NULL, NULL),
(98, 'user', 92, 7, '2017-09-23 19:46:35', 0, NULL, NULL, NULL),
(99, 'user', 93, 7, '2017-09-23 19:46:35', 0, NULL, NULL, NULL),
(100, 'user', 94, 7, '2017-09-23 19:46:35', 0, NULL, NULL, NULL),
(101, 'user', 95, 7, '2017-09-23 19:46:35', 0, NULL, NULL, NULL),
(102, 'user', 96, 7, '2017-09-23 19:46:35', 0, NULL, NULL, NULL),
(104, 'user', 97, 8, '2017-09-23 19:47:12', 0, NULL, NULL, NULL),
(105, 'user', 98, 8, '2017-09-23 19:47:12', 0, NULL, NULL, NULL),
(106, 'user', 99, 8, '2017-09-23 19:47:12', 0, NULL, NULL, NULL),
(107, 'user', 100, 8, '2017-09-23 19:47:12', 0, NULL, NULL, NULL),
(109, 'user', 101, 9, '2017-09-23 19:48:03', 0, NULL, NULL, NULL),
(110, 'user', 102, 9, '2017-09-23 19:48:03', 0, NULL, NULL, NULL),
(112, 'user', 103, 10, '2017-09-23 19:48:37', 0, NULL, NULL, NULL),
(113, 'user', 104, 10, '2017-09-23 19:48:37', 0, NULL, NULL, NULL),
(114, 'user', 105, 10, '2017-09-23 19:48:37', 0, NULL, NULL, NULL),
(115, 'user', 106, 10, '2017-09-23 19:48:37', 0, NULL, NULL, NULL),
(116, 'user', 107, 10, '2017-09-23 19:48:37', 0, NULL, NULL, NULL),
(117, 'user', 108, 10, '2017-09-23 19:48:37', 0, NULL, NULL, NULL),
(118, 'user', 109, 10, '2017-09-23 19:48:37', 0, NULL, NULL, NULL),
(119, 'user', 110, 10, '2017-09-23 19:48:37', 0, NULL, NULL, NULL),
(120, 'user', 111, 10, '2017-09-23 19:48:37', 0, NULL, NULL, NULL),
(121, 'user', 112, 10, '2017-09-23 19:48:37', 0, NULL, NULL, NULL),
(122, 'user', 113, 10, '2017-09-23 19:48:37', 0, NULL, NULL, NULL),
(123, 'user', 114, 10, '2017-09-23 19:48:37', 0, NULL, NULL, NULL),
(125, 'user', 115, 11, '2017-09-23 19:49:13', 0, NULL, NULL, NULL),
(126, 'user', 116, 11, '2017-09-23 19:49:13', 0, NULL, NULL, NULL),
(127, 'user', 117, 11, '2017-09-23 19:49:13', 0, NULL, NULL, NULL),
(129, 'user', 118, 12, '2017-09-23 19:49:45', 0, NULL, NULL, NULL),
(130, 'user', 119, 12, '2017-09-23 19:49:45', 0, NULL, NULL, NULL),
(131, 'user', 120, 12, '2017-09-23 19:49:45', 0, NULL, NULL, NULL),
(132, 'user', 121, 12, '2017-09-23 19:49:45', 0, NULL, NULL, NULL),
(133, 'user', 122, 12, '2017-09-23 19:49:45', 0, NULL, NULL, NULL),
(134, 'user', 123, 12, '2017-09-23 19:49:45', 0, NULL, NULL, NULL),
(135, 'user', 124, 12, '2017-09-23 19:49:45', 0, NULL, NULL, NULL),
(136, 'user', 125, 12, '2017-09-23 19:49:45', 0, NULL, NULL, NULL),
(137, 'user', 126, 12, '2017-09-23 19:49:45', 0, NULL, NULL, NULL),
(138, 'user', 127, 12, '2017-09-23 19:49:45', 0, NULL, NULL, NULL),
(139, 'user', 128, 12, '2017-09-23 19:49:45', 0, NULL, NULL, NULL),
(140, 'user', 129, 12, '2017-09-23 19:49:45', 0, NULL, NULL, NULL),
(141, 'user', 130, 12, '2017-09-23 19:49:45', 0, NULL, NULL, NULL),
(142, 'user', 131, 12, '2017-09-23 19:49:45', 0, NULL, NULL, NULL),
(143, 'user', 132, 12, '2017-09-23 19:49:45', 0, NULL, NULL, NULL),
(144, 'user', 133, 12, '2017-09-23 19:49:45', 0, NULL, NULL, NULL),
(145, 'user', 134, 12, '2017-09-23 19:49:45', 0, NULL, NULL, NULL),
(147, 'user', 135, 13, '2017-09-23 19:57:35', 0, NULL, NULL, NULL),
(148, 'user', 136, 13, '2017-09-23 19:57:35', 0, NULL, NULL, NULL),
(149, 'user', 137, 13, '2017-09-23 19:57:35', 0, NULL, NULL, NULL),
(150, 'user', 138, 13, '2017-09-23 19:57:35', 0, NULL, NULL, NULL),
(151, 'user', 139, 13, '2017-09-23 19:57:35', 0, NULL, NULL, NULL),
(152, 'user', 140, 13, '2017-09-23 19:57:35', 0, NULL, NULL, NULL),
(153, 'user', 141, 13, '2017-09-23 19:57:35', 0, NULL, NULL, NULL),
(154, 'user', 142, 13, '2017-09-23 19:57:35', 0, NULL, NULL, NULL),
(155, 'user', 143, 13, '2017-09-23 19:57:35', 0, NULL, NULL, NULL),
(156, 'user', 144, 13, '2017-09-23 19:57:35', 0, NULL, NULL, NULL),
(157, 'user', 145, 13, '2017-09-23 19:57:35', 0, NULL, NULL, NULL),
(158, 'user', 146, 13, '2017-09-23 19:57:35', 0, NULL, NULL, NULL),
(159, 'user', 147, 13, '2017-09-23 19:57:35', 0, NULL, NULL, NULL),
(160, 'user', 148, 13, '2017-09-23 19:57:35', 0, NULL, NULL, NULL),
(161, 'user', 149, 13, '2017-09-23 19:57:35', 0, NULL, NULL, NULL),
(162, 'user', 150, 13, '2017-09-23 19:57:35', 0, NULL, NULL, NULL),
(163, 'user', 151, 13, '2017-09-23 19:57:35', 0, NULL, NULL, NULL),
(165, 'user', 152, 14, '2017-09-23 19:58:43', 0, NULL, NULL, NULL),
(166, 'user', 153, 14, '2017-09-23 19:58:43', 0, NULL, NULL, NULL),
(167, 'user', 154, 14, '2017-09-23 19:58:43', 0, NULL, NULL, NULL),
(168, 'user', 155, 14, '2017-09-23 19:58:43', 0, NULL, NULL, NULL),
(169, 'user', 156, 14, '2017-09-23 19:58:43', 0, NULL, NULL, NULL),
(170, 'user', 157, 14, '2017-09-23 19:58:43', 0, NULL, NULL, NULL),
(171, 'user', 158, 14, '2017-09-23 19:58:43', 0, NULL, NULL, NULL),
(172, 'user', 159, 14, '2017-09-23 19:58:43', 0, NULL, NULL, NULL),
(173, 'user', 160, 14, '2017-09-23 19:58:43', 0, NULL, NULL, NULL),
(174, 'user', 161, 14, '2017-09-23 19:58:43', 0, NULL, NULL, NULL),
(175, 'user', 162, 14, '2017-09-23 19:58:43', 0, NULL, NULL, NULL),
(176, 'user', 163, 14, '2017-09-23 19:58:43', 0, NULL, NULL, NULL),
(177, 'user', 164, 14, '2017-09-23 19:58:43', 0, NULL, NULL, NULL),
(178, 'user', 165, 14, '2017-09-23 19:58:43', 0, NULL, NULL, NULL),
(179, 'user', 166, 14, '2017-09-23 19:58:43', 0, NULL, NULL, NULL),
(180, 'user', 167, 14, '2017-09-23 19:58:43', 0, NULL, NULL, NULL),
(181, 'user', 168, 14, '2017-09-23 19:58:43', 0, NULL, NULL, NULL),
(182, 'user', 169, 14, '2017-09-23 19:58:43', 0, NULL, NULL, NULL),
(183, 'user', 170, 14, '2017-09-23 19:58:43', 0, NULL, NULL, NULL),
(184, 'user', 171, 14, '2017-09-23 19:58:43', 0, NULL, NULL, NULL),
(185, 'user', 172, 14, '2017-09-23 19:58:43', 0, NULL, NULL, NULL),
(186, 'user', 173, 14, '2017-09-23 19:58:43', 0, NULL, NULL, NULL),
(187, 'user', 174, 14, '2017-09-23 19:58:43', 0, NULL, NULL, NULL),
(188, 'user', 175, 14, '2017-09-23 19:58:43', 0, NULL, NULL, NULL),
(189, 'user', 176, 14, '2017-09-23 19:58:43', 0, NULL, NULL, NULL),
(190, 'user', 177, 14, '2017-09-23 19:58:43', 0, NULL, NULL, NULL),
(191, 'user', 178, 14, '2017-09-23 19:58:43', 0, NULL, NULL, NULL),
(192, 'user', 179, 14, '2017-09-23 19:58:43', 0, NULL, NULL, NULL),
(193, 'user', 180, 14, '2017-09-23 19:58:43', 0, NULL, NULL, NULL),
(194, 'user', 181, 14, '2017-09-23 19:58:43', 0, NULL, NULL, NULL),
(195, 'user', 182, 14, '2017-09-23 19:58:43', 0, NULL, NULL, NULL),
(196, 'user', 183, 14, '2017-09-23 19:58:43', 0, NULL, NULL, NULL),
(197, 'user', 184, 14, '2017-09-23 19:58:43', 0, NULL, NULL, NULL),
(198, 'user', 185, 14, '2017-09-23 19:58:43', 0, NULL, NULL, NULL),
(199, 'user', 186, 14, '2017-09-23 19:58:43', 0, NULL, NULL, NULL),
(200, 'user', 187, 14, '2017-09-23 19:58:43', 0, NULL, NULL, NULL),
(201, 'user', 188, 14, '2017-09-23 19:58:43', 0, NULL, NULL, NULL),
(202, 'user', 189, 14, '2017-09-23 19:58:43', 0, NULL, NULL, NULL),
(203, 'user', 190, 14, '2017-09-23 19:58:43', 0, NULL, NULL, NULL),
(204, 'user', 191, 14, '2017-09-23 19:58:43', 0, NULL, NULL, NULL),
(205, 'user', 192, 14, '2017-09-23 19:58:43', 0, NULL, NULL, NULL),
(206, 'user', 193, 14, '2017-09-23 19:58:43', 0, NULL, NULL, NULL),
(207, 'user', 194, 14, '2017-09-23 19:58:43', 0, NULL, NULL, NULL),
(208, 'user', 195, 14, '2017-09-23 19:58:43', 0, NULL, NULL, NULL),
(209, 'user', 196, 14, '2017-09-23 19:58:43', 0, NULL, NULL, NULL),
(210, 'user', 197, 14, '2017-09-23 19:58:43', 0, NULL, NULL, NULL),
(211, 'user', 198, 14, '2017-09-23 19:58:43', 0, NULL, NULL, NULL),
(212, 'user', 199, 14, '2017-09-23 19:58:43', 0, NULL, NULL, NULL),
(213, 'user', 200, 14, '2017-09-23 19:58:43', 0, NULL, NULL, NULL),
(214, 'user', 201, 14, '2017-09-23 19:58:43', 0, NULL, NULL, NULL),
(215, 'user', 202, 14, '2017-09-23 19:58:43', 0, NULL, NULL, NULL),
(216, 'user', 203, 14, '2017-09-23 19:58:43', 0, NULL, NULL, NULL),
(217, 'user', 204, 14, '2017-09-23 19:58:43', 0, NULL, NULL, NULL),
(218, 'user', 205, 14, '2017-09-23 19:58:43', 0, NULL, NULL, NULL),
(219, 'user', 206, 14, '2017-09-23 19:58:43', 0, NULL, NULL, NULL),
(220, 'user', 207, 14, '2017-09-23 19:58:43', 0, NULL, NULL, NULL),
(221, 'user', 208, 14, '2017-09-23 19:58:43', 0, NULL, NULL, NULL),
(222, 'user', 209, 14, '2017-09-23 19:58:43', 0, NULL, NULL, NULL),
(223, 'user', 210, 14, '2017-09-23 19:58:43', 0, NULL, NULL, NULL),
(224, 'user', 211, 14, '2017-09-23 19:58:43', 0, NULL, NULL, NULL),
(225, 'user', 212, 14, '2017-09-23 19:58:43', 0, NULL, NULL, NULL),
(226, 'user', 213, 14, '2017-09-23 19:58:43', 0, NULL, NULL, NULL),
(227, 'user', 214, 14, '2017-09-23 19:58:43', 0, NULL, NULL, NULL),
(228, 'user', 215, 14, '2017-09-23 19:58:43', 0, NULL, NULL, NULL),
(229, 'user', 216, 14, '2017-09-23 19:58:43', 0, NULL, NULL, NULL),
(230, 'user', 217, 14, '2017-09-23 19:58:43', 0, NULL, NULL, NULL),
(231, 'user', 218, 14, '2017-09-23 19:58:43', 0, NULL, NULL, NULL),
(232, 'user', 219, 14, '2017-09-23 19:58:43', 0, NULL, NULL, NULL),
(233, 'user', 220, 14, '2017-09-23 19:58:43', 0, NULL, NULL, NULL),
(234, 'user', 221, 14, '2017-09-23 19:58:43', 0, NULL, NULL, NULL),
(235, 'user', 222, 14, '2017-09-23 19:58:43', 0, NULL, NULL, NULL),
(236, 'user', 223, 14, '2017-09-23 19:58:43', 0, NULL, NULL, NULL),
(237, 'user', 224, 14, '2017-09-23 19:58:43', 0, NULL, NULL, NULL),
(238, 'user', 225, 14, '2017-09-23 19:58:43', 0, NULL, NULL, NULL),
(239, 'user', 226, 14, '2017-09-23 19:58:43', 0, NULL, NULL, NULL),
(240, 'user', 227, 14, '2017-09-23 19:58:43', 0, NULL, NULL, NULL),
(241, 'user', 228, 14, '2017-09-23 19:58:43', 0, NULL, NULL, NULL),
(242, 'user', 229, 14, '2017-09-23 19:58:43', 0, NULL, NULL, NULL),
(243, 'user', 230, 14, '2017-09-23 19:58:43', 0, NULL, NULL, NULL),
(244, 'user', 231, 14, '2017-09-23 19:58:43', 0, NULL, NULL, NULL),
(245, 'user', 232, 14, '2017-09-23 19:58:43', 0, NULL, NULL, NULL),
(246, 'user', 233, 14, '2017-09-23 19:58:43', 0, NULL, NULL, NULL),
(247, 'user', 234, 14, '2017-09-23 19:58:43', 0, NULL, NULL, NULL),
(248, 'user', 235, 14, '2017-09-23 19:58:43', 0, NULL, NULL, NULL),
(249, 'user', 236, 14, '2017-09-23 19:58:43', 0, NULL, NULL, NULL),
(251, 'user', 237, 15, '2017-09-23 19:59:36', 0, NULL, NULL, NULL),
(252, 'user', 238, 15, '2017-09-23 19:59:36', 0, NULL, NULL, NULL),
(253, 'user', 239, 15, '2017-09-23 19:59:36', 0, NULL, NULL, NULL),
(254, 'user', 240, 15, '2017-09-23 19:59:36', 0, NULL, NULL, NULL),
(255, 'user', 241, 15, '2017-09-23 19:59:36', 0, NULL, NULL, NULL),
(256, 'user', 242, 15, '2017-09-23 19:59:36', 0, NULL, NULL, NULL),
(257, 'user', 243, 15, '2017-09-23 19:59:36', 0, NULL, NULL, NULL),
(258, 'user', 244, 15, '2017-09-23 19:59:36', 0, NULL, NULL, NULL),
(259, 'user', 245, 15, '2017-09-23 19:59:36', 0, NULL, NULL, NULL),
(260, 'user', 246, 15, '2017-09-23 19:59:36', 0, NULL, NULL, NULL),
(261, 'user', 247, 15, '2017-09-23 19:59:36', 0, NULL, NULL, NULL),
(262, 'user', 248, 15, '2017-09-23 19:59:36', 0, NULL, NULL, NULL),
(263, 'user', 249, 15, '2017-09-23 19:59:36', 0, NULL, NULL, NULL),
(264, 'user', 250, 15, '2017-09-23 19:59:36', 0, NULL, NULL, NULL),
(265, 'user', 251, 15, '2017-09-23 19:59:36', 0, NULL, NULL, NULL),
(266, 'user', 252, 15, '2017-09-23 19:59:36', 0, NULL, NULL, NULL),
(267, 'user', 253, 15, '2017-09-23 19:59:36', 0, NULL, NULL, NULL),
(268, 'user', 254, 15, '2017-09-23 19:59:36', 0, NULL, NULL, NULL),
(269, 'user', 255, 15, '2017-09-23 19:59:36', 0, NULL, NULL, NULL),
(270, 'user', 256, 15, '2017-09-23 19:59:36', 0, NULL, NULL, NULL),
(271, 'user', 257, 15, '2017-09-23 19:59:36', 0, NULL, NULL, NULL),
(272, 'user', 258, 15, '2017-09-23 19:59:36', 0, NULL, NULL, NULL),
(273, 'user', 259, 15, '2017-09-23 19:59:36', 0, NULL, NULL, NULL),
(274, 'user', 260, 15, '2017-09-23 19:59:36', 0, NULL, NULL, NULL),
(276, 'user', 261, 16, '2017-09-23 20:00:13', 0, NULL, NULL, NULL),
(277, 'user', 262, 16, '2017-09-23 20:00:13', 0, NULL, NULL, NULL),
(278, 'user', 263, 16, '2017-09-23 20:00:13', 0, NULL, NULL, NULL),
(279, 'user', 264, 16, '2017-09-23 20:00:13', 0, NULL, NULL, NULL),
(280, 'user', 265, 16, '2017-09-23 20:00:13', 0, NULL, NULL, NULL),
(281, 'user', 266, 16, '2017-09-23 20:00:13', 0, NULL, NULL, NULL),
(282, 'user', 267, 16, '2017-09-23 20:00:13', 0, NULL, NULL, NULL),
(283, 'user', 268, 16, '2017-09-23 20:00:13', 0, NULL, NULL, NULL),
(285, 'user', 269, 17, '2017-09-23 20:00:50', 0, NULL, NULL, NULL),
(286, 'user', 270, 17, '2017-09-23 20:00:50', 0, NULL, NULL, NULL),
(287, 'user', 271, 17, '2017-09-23 20:00:50', 0, NULL, NULL, NULL),
(288, 'user', 272, 17, '2017-09-23 20:00:50', 0, NULL, NULL, NULL),
(289, 'user', 273, 17, '2017-09-23 20:00:50', 0, NULL, NULL, NULL),
(290, 'user', 274, 17, '2017-09-23 20:00:50', 0, NULL, NULL, NULL),
(291, 'user', 275, 17, '2017-09-23 20:00:50', 0, NULL, NULL, NULL),
(292, 'user', 276, 17, '2017-09-23 20:00:50', 0, NULL, NULL, NULL),
(293, 'user', 277, 17, '2017-09-23 20:00:50', 0, NULL, NULL, NULL),
(294, 'user', 278, 17, '2017-09-23 20:00:50', 0, NULL, NULL, NULL),
(295, 'user', 279, 17, '2017-09-23 20:00:50', 0, NULL, NULL, NULL),
(296, 'user', 280, 17, '2017-09-23 20:00:50', 0, NULL, NULL, NULL),
(297, 'user', 281, 17, '2017-09-23 20:00:50', 0, NULL, NULL, NULL),
(298, 'user', 282, 17, '2017-09-23 20:00:50', 0, NULL, NULL, NULL),
(299, 'user', 283, 17, '2017-09-23 20:00:50', 0, NULL, NULL, NULL),
(300, 'user', 284, 17, '2017-09-23 20:00:50', 0, NULL, NULL, NULL),
(301, 'user', 285, 17, '2017-09-23 20:00:50', 0, NULL, NULL, NULL),
(302, 'user', 286, 17, '2017-09-23 20:00:50', 0, NULL, NULL, NULL),
(303, 'user', 287, 17, '2017-09-23 20:00:50', 0, NULL, NULL, NULL),
(304, 'user', 288, 17, '2017-09-23 20:00:50', 0, NULL, NULL, NULL),
(305, 'user', 289, 17, '2017-09-23 20:00:50', 0, NULL, NULL, NULL),
(306, 'user', 290, 17, '2017-09-23 20:00:50', 0, NULL, NULL, NULL),
(307, 'user', 291, 17, '2017-09-23 20:00:50', 0, NULL, NULL, NULL),
(308, 'user', 292, 17, '2017-09-23 20:00:50', 0, NULL, NULL, NULL),
(309, 'user', 293, 17, '2017-09-23 20:00:50', 0, NULL, NULL, NULL),
(310, 'user', 294, 17, '2017-09-23 20:00:50', 0, NULL, NULL, NULL),
(311, 'user', 295, 17, '2017-09-23 20:00:50', 0, NULL, NULL, NULL),
(312, 'user', 296, 17, '2017-09-23 20:00:50', 0, NULL, NULL, NULL),
(313, 'user', 297, 17, '2017-09-23 20:00:50', 0, NULL, NULL, NULL),
(314, 'user', 298, 17, '2017-09-23 20:00:50', 0, NULL, NULL, NULL),
(315, 'user', 299, 17, '2017-09-23 20:00:50', 0, NULL, NULL, NULL),
(316, 'user', 300, 17, '2017-09-23 20:00:50', 0, NULL, NULL, NULL),
(317, 'user', 301, 17, '2017-09-23 20:00:50', 0, NULL, NULL, NULL),
(318, 'user', 302, 17, '2017-09-23 20:00:50', 0, NULL, NULL, NULL),
(319, 'user', 303, 17, '2017-09-23 20:00:50', 0, NULL, NULL, NULL),
(320, 'user', 304, 17, '2017-09-23 20:00:50', 0, NULL, NULL, NULL),
(321, 'user', 305, 17, '2017-09-23 20:00:50', 0, NULL, NULL, NULL),
(322, 'user', 306, 17, '2017-09-23 20:00:50', 0, NULL, NULL, NULL),
(323, 'user', 307, 17, '2017-09-23 20:00:50', 0, NULL, NULL, NULL),
(324, 'user', 308, 17, '2017-09-23 20:00:50', 0, NULL, NULL, NULL),
(325, 'user', 309, 17, '2017-09-23 20:00:50', 0, NULL, NULL, NULL),
(326, 'user', 310, 17, '2017-09-23 20:00:50', 0, NULL, NULL, NULL),
(327, 'user', 311, 17, '2017-09-23 20:00:50', 0, NULL, NULL, NULL),
(328, 'user', 312, 17, '2017-09-23 20:00:50', 0, NULL, NULL, NULL),
(329, 'user', 313, 17, '2017-09-23 20:00:50', 0, NULL, NULL, NULL),
(330, 'user', 314, 17, '2017-09-23 20:00:50', 0, NULL, NULL, NULL),
(331, 'user', 315, 17, '2017-09-23 20:00:50', 0, NULL, NULL, NULL),
(333, 'user', 316, 18, '2017-09-23 20:01:50', 0, NULL, NULL, NULL),
(334, 'user', 317, 18, '2017-09-23 20:01:50', 0, NULL, NULL, NULL),
(335, 'user', 318, 18, '2017-09-23 20:01:50', 0, NULL, NULL, NULL),
(336, 'user', 319, 18, '2017-09-23 20:01:50', 0, NULL, NULL, NULL),
(337, 'user', 320, 18, '2017-09-23 20:01:50', 0, NULL, NULL, NULL),
(338, 'user', 321, 18, '2017-09-23 20:01:50', 0, NULL, NULL, NULL),
(339, 'user', 322, 18, '2017-09-23 20:01:50', 0, NULL, NULL, NULL),
(340, 'user', 323, 18, '2017-09-23 20:01:50', 0, NULL, NULL, NULL),
(341, 'user', 324, 18, '2017-09-23 20:01:50', 0, NULL, NULL, NULL),
(342, 'user', 325, 18, '2017-09-23 20:01:50', 0, NULL, NULL, NULL),
(343, 'user', 326, 18, '2017-09-23 20:01:50', 0, NULL, NULL, NULL),
(344, 'user', 327, 18, '2017-09-23 20:01:50', 0, NULL, NULL, NULL),
(345, 'user', 328, 18, '2017-09-23 20:01:50', 0, NULL, NULL, NULL),
(346, 'user', 329, 18, '2017-09-23 20:01:50', 0, NULL, NULL, NULL),
(347, 'user', 330, 18, '2017-09-23 20:01:50', 0, NULL, NULL, NULL),
(348, 'user', 331, 18, '2017-09-23 20:01:50', 0, NULL, NULL, NULL),
(349, 'user', 332, 18, '2017-09-23 20:01:50', 0, NULL, NULL, NULL),
(350, 'user', 333, 18, '2017-09-23 20:01:50', 0, NULL, NULL, NULL),
(351, 'user', 334, 18, '2017-09-23 20:01:50', 0, NULL, NULL, NULL),
(353, 'user', 335, 19, '2017-09-23 20:02:35', 0, NULL, NULL, NULL),
(354, 'user', 336, 19, '2017-09-23 20:02:35', 0, NULL, NULL, NULL),
(355, 'user', 337, 19, '2017-09-23 20:02:35', 0, NULL, NULL, NULL),
(356, 'user', 338, 19, '2017-09-23 20:02:35', 0, NULL, NULL, NULL),
(357, 'user', 339, 19, '2017-09-23 20:02:35', 0, NULL, NULL, NULL),
(358, 'user', 340, 19, '2017-09-23 20:02:35', 0, NULL, NULL, NULL),
(359, 'user', 341, 19, '2017-09-23 20:02:35', 0, NULL, NULL, NULL),
(360, 'user', 342, 19, '2017-09-23 20:02:35', 0, NULL, NULL, NULL),
(361, 'user', 343, 19, '2017-09-23 20:02:35', 0, NULL, NULL, NULL),
(362, 'user', 344, 19, '2017-09-23 20:02:35', 0, NULL, NULL, NULL),
(363, 'user', 345, 19, '2017-09-23 20:02:35', 0, NULL, NULL, NULL),
(364, 'user', 346, 19, '2017-09-23 20:02:35', 0, NULL, NULL, NULL),
(365, 'user', 347, 19, '2017-09-23 20:02:35', 0, NULL, NULL, NULL),
(366, 'user', 348, 19, '2017-09-23 20:02:35', 0, NULL, NULL, NULL),
(368, 'user', 349, 20, '2017-09-23 20:03:14', 0, NULL, NULL, NULL),
(369, 'user', 350, 20, '2017-09-23 20:03:14', 0, NULL, NULL, NULL),
(370, 'user', 351, 20, '2017-09-23 20:03:14', 0, NULL, NULL, NULL),
(371, 'user', 352, 20, '2017-09-23 20:03:14', 0, NULL, NULL, NULL),
(372, 'user', 353, 20, '2017-09-23 20:03:14', 0, NULL, NULL, NULL),
(373, 'user', 354, 20, '2017-09-23 20:03:14', 0, NULL, NULL, NULL),
(374, 'user', 355, 20, '2017-09-23 20:03:14', 0, NULL, NULL, NULL),
(375, 'user', 356, 20, '2017-09-23 20:03:14', 0, NULL, NULL, NULL),
(376, 'user', 357, 20, '2017-09-23 20:03:14', 0, NULL, NULL, NULL),
(377, 'user', 358, 20, '2017-09-23 20:03:14', 0, NULL, NULL, NULL),
(378, 'user', 359, 20, '2017-09-23 20:03:14', 0, NULL, NULL, NULL),
(379, 'user', 360, 20, '2017-09-23 20:03:14', 0, NULL, NULL, NULL),
(380, 'user', 361, 20, '2017-09-23 20:03:14', 0, NULL, NULL, NULL),
(381, 'user', 362, 20, '2017-09-23 20:03:14', 0, NULL, NULL, NULL),
(382, 'user', 363, 20, '2017-09-23 20:03:14', 0, NULL, NULL, NULL),
(383, 'user', 364, 20, '2017-09-23 20:03:14', 0, NULL, NULL, NULL),
(384, 'user', 365, 20, '2017-09-23 20:03:14', 0, NULL, NULL, NULL),
(385, 'user', 366, 20, '2017-09-23 20:03:14', 0, NULL, NULL, NULL),
(386, 'user', 367, 20, '2017-09-23 20:03:14', 0, NULL, NULL, NULL),
(387, 'user', 368, 20, '2017-09-23 20:03:14', 0, NULL, NULL, NULL),
(388, 'user', 369, 20, '2017-09-23 20:03:14', 0, NULL, NULL, NULL),
(389, 'user', 370, 20, '2017-09-23 20:03:14', 0, NULL, NULL, NULL),
(390, 'user', 371, 20, '2017-09-23 20:03:14', 0, NULL, NULL, NULL),
(391, 'user', 372, 20, '2017-09-23 20:03:14', 0, NULL, NULL, NULL),
(392, 'user', 373, 20, '2017-09-23 20:03:14', 0, NULL, NULL, NULL),
(393, 'user', 374, 20, '2017-09-23 20:03:14', 0, NULL, NULL, NULL),
(394, 'user', 375, 20, '2017-09-23 20:03:14', 0, NULL, NULL, NULL),
(395, 'user', 376, 20, '2017-09-23 20:03:14', 0, NULL, NULL, NULL),
(396, 'user', 377, 20, '2017-09-23 20:03:14', 0, NULL, NULL, NULL),
(397, 'user', 378, 20, '2017-09-23 20:03:14', 0, NULL, NULL, NULL),
(398, 'user', 379, 20, '2017-09-23 20:03:14', 0, NULL, NULL, NULL),
(399, 'user', 380, 20, '2017-09-23 20:03:14', 0, NULL, NULL, NULL),
(400, 'user', 381, 20, '2017-09-23 20:03:14', 0, NULL, NULL, NULL),
(401, 'user', 382, 20, '2017-09-23 20:03:14', 0, NULL, NULL, NULL),
(402, 'user', 383, 20, '2017-09-23 20:03:14', 0, NULL, NULL, NULL),
(403, 'user', 384, 20, '2017-09-23 20:03:14', 0, NULL, NULL, NULL),
(404, 'user', 385, 20, '2017-09-23 20:03:14', 0, NULL, NULL, NULL),
(405, 'user', 386, 20, '2017-09-23 20:03:14', 0, NULL, NULL, NULL),
(406, 'user', 387, 20, '2017-09-23 20:03:14', 0, NULL, NULL, NULL),
(407, 'user', 388, 20, '2017-09-23 20:03:14', 0, NULL, NULL, NULL),
(408, 'user', 389, 20, '2017-09-23 20:03:14', 0, NULL, NULL, NULL),
(409, 'user', 390, 20, '2017-09-23 20:03:14', 0, NULL, NULL, NULL),
(410, 'user', 391, 20, '2017-09-23 20:03:14', 0, NULL, NULL, NULL),
(411, 'user', 392, 20, '2017-09-23 20:03:14', 0, NULL, NULL, NULL),
(412, 'user', 393, 20, '2017-09-23 20:03:14', 0, NULL, NULL, NULL),
(414, 'user', 394, 21, '2017-09-23 20:04:03', 0, NULL, NULL, NULL),
(415, 'user', 395, 21, '2017-09-23 20:04:03', 0, NULL, NULL, NULL),
(416, 'user', 396, 21, '2017-09-23 20:04:03', 0, NULL, NULL, NULL),
(417, 'user', 397, 21, '2017-09-23 20:04:03', 0, NULL, NULL, NULL),
(418, 'user', 398, 21, '2017-09-23 20:04:03', 0, NULL, NULL, NULL),
(419, 'user', 399, 21, '2017-09-23 20:04:03', 0, NULL, NULL, NULL),
(420, 'user', 400, 21, '2017-09-23 20:04:03', 0, NULL, NULL, NULL),
(421, 'user', 401, 21, '2017-09-23 20:04:03', 0, NULL, NULL, NULL),
(422, 'user', 402, 21, '2017-09-23 20:04:03', 0, NULL, NULL, NULL),
(423, 'user', 403, 21, '2017-09-23 20:04:03', 0, NULL, NULL, NULL),
(424, 'user', 404, 21, '2017-09-23 20:04:03', 0, NULL, NULL, NULL),
(425, 'user', 405, 21, '2017-09-23 20:04:03', 0, NULL, NULL, NULL),
(426, 'user', 406, 21, '2017-09-23 20:04:03', 0, NULL, NULL, NULL),
(428, 'user', 407, 22, '2017-09-23 20:04:54', 0, NULL, NULL, NULL),
(429, 'user', 408, 22, '2017-09-23 20:04:54', 0, NULL, NULL, NULL),
(430, 'user', 409, 22, '2017-09-23 20:04:54', 0, NULL, NULL, NULL),
(431, 'user', 410, 22, '2017-09-23 20:04:54', 0, NULL, NULL, NULL),
(432, 'user', 411, 22, '2017-09-23 20:04:54', 0, NULL, NULL, NULL),
(433, 'user', 412, 22, '2017-09-23 20:04:54', 0, NULL, NULL, NULL),
(434, 'user', 413, 22, '2017-09-23 20:04:54', 0, NULL, NULL, NULL),
(435, 'user', 414, 22, '2017-09-23 20:04:54', 0, NULL, NULL, NULL),
(436, 'user', 415, 22, '2017-09-23 20:04:54', 0, NULL, NULL, NULL),
(437, 'user', 416, 22, '2017-09-23 20:04:54', 0, NULL, NULL, NULL),
(438, 'user', 417, 22, '2017-09-23 20:04:54', 0, NULL, NULL, NULL),
(439, 'user', 418, 22, '2017-09-23 20:04:54', 0, NULL, NULL, NULL),
(440, 'user', 419, 22, '2017-09-23 20:04:54', 0, NULL, NULL, NULL),
(441, 'user', 420, 22, '2017-09-23 20:04:54', 0, NULL, NULL, NULL),
(442, 'user', 421, 22, '2017-09-23 20:04:54', 0, NULL, NULL, NULL),
(443, 'user', 422, 22, '2017-09-23 20:04:54', 0, NULL, NULL, NULL),
(444, 'user', 423, 22, '2017-09-23 20:04:54', 0, NULL, NULL, NULL),
(446, 'user', 424, 23, '2017-09-23 20:05:42', 0, NULL, NULL, NULL),
(447, 'user', 425, 23, '2017-09-23 20:05:42', 0, NULL, NULL, NULL),
(448, 'user', 426, 23, '2017-09-23 20:05:42', 0, NULL, NULL, NULL),
(449, 'user', 427, 23, '2017-09-23 20:05:42', 0, NULL, NULL, NULL),
(450, 'user', 428, 23, '2017-09-23 20:05:42', 0, NULL, NULL, NULL),
(451, 'user', 429, 23, '2017-09-23 20:05:42', 0, NULL, NULL, NULL),
(452, 'user', 430, 23, '2017-09-23 20:05:42', 0, NULL, NULL, NULL),
(453, 'user', 431, 23, '2017-09-23 20:05:42', 0, NULL, NULL, NULL),
(454, 'user', 432, 23, '2017-09-23 20:05:42', 0, NULL, NULL, NULL),
(455, 'user', 433, 23, '2017-09-23 20:05:42', 0, NULL, NULL, NULL),
(456, 'user', 434, 23, '2017-09-23 20:05:42', 0, NULL, NULL, NULL),
(457, 'user', 435, 23, '2017-09-23 20:05:42', 0, NULL, NULL, NULL),
(458, 'user', 436, 23, '2017-09-23 20:05:42', 0, NULL, NULL, NULL),
(459, 'user', 437, 23, '2017-09-23 20:05:42', 0, NULL, NULL, NULL),
(460, 'user', 438, 23, '2017-09-23 20:05:42', 0, NULL, NULL, NULL),
(461, 'user', 439, 23, '2017-09-23 20:05:42', 0, NULL, NULL, NULL),
(462, 'user', 440, 23, '2017-09-23 20:05:42', 0, NULL, NULL, NULL),
(463, 'user', 441, 23, '2017-09-23 20:05:42', 0, NULL, NULL, NULL),
(464, 'user', 442, 23, '2017-09-23 20:05:42', 0, NULL, NULL, NULL),
(465, 'user', 443, 23, '2017-09-23 20:05:42', 0, NULL, NULL, NULL),
(466, 'user', 444, 23, '2017-09-23 20:05:42', 0, NULL, NULL, NULL),
(467, 'user', 445, 23, '2017-09-23 20:05:42', 0, NULL, NULL, NULL),
(468, 'user', 446, 23, '2017-09-23 20:05:42', 0, NULL, NULL, NULL),
(469, 'user', 447, 23, '2017-09-23 20:05:42', 0, NULL, NULL, NULL),
(470, 'user', 448, 23, '2017-09-23 20:05:42', 0, NULL, NULL, NULL),
(471, 'user', 449, 23, '2017-09-23 20:05:42', 0, NULL, NULL, NULL),
(472, 'user', 450, 23, '2017-09-23 20:05:42', 0, NULL, NULL, NULL),
(473, 'user', 451, 23, '2017-09-23 20:05:42', 0, NULL, NULL, NULL),
(474, 'user', 452, 23, '2017-09-23 20:05:42', 0, NULL, NULL, NULL),
(475, 'user', 453, 23, '2017-09-23 20:05:42', 0, NULL, NULL, NULL),
(476, 'user', 454, 23, '2017-09-23 20:05:42', 0, NULL, NULL, NULL),
(477, 'user', 455, 23, '2017-09-23 20:05:42', 0, NULL, NULL, NULL),
(478, 'user', 456, 23, '2017-09-23 20:05:42', 0, NULL, NULL, NULL),
(479, 'user', 457, 23, '2017-09-23 20:05:42', 0, NULL, NULL, NULL),
(480, 'user', 458, 23, '2017-09-23 20:05:42', 0, NULL, NULL, NULL),
(481, 'user', 459, 23, '2017-09-23 20:05:42', 0, NULL, NULL, NULL),
(482, 'user', 460, 23, '2017-09-23 20:05:42', 0, NULL, NULL, NULL),
(483, 'user', 461, 23, '2017-09-23 20:05:42', 0, NULL, NULL, NULL),
(484, 'user', 462, 23, '2017-09-23 20:05:42', 0, NULL, NULL, NULL),
(485, 'user', 463, 23, '2017-09-23 20:05:42', 0, NULL, NULL, NULL),
(487, 'user', 464, 24, '2017-09-23 20:06:18', 0, NULL, NULL, NULL),
(488, 'user', 465, 24, '2017-09-23 20:06:18', 0, NULL, NULL, NULL),
(489, 'user', 466, 24, '2017-09-23 20:06:18', 0, NULL, NULL, NULL),
(490, 'user', 467, 24, '2017-09-23 20:06:18', 0, NULL, NULL, NULL),
(491, 'user', 468, 24, '2017-09-23 20:06:18', 0, NULL, NULL, NULL),
(492, 'user', 469, 24, '2017-09-23 20:06:18', 0, NULL, NULL, NULL),
(494, 'user', 470, 25, '2017-09-23 20:07:01', 0, NULL, NULL, NULL),
(495, 'user', 471, 25, '2017-09-23 20:07:01', 0, NULL, NULL, NULL),
(496, 'user', 472, 25, '2017-09-23 20:07:01', 0, NULL, NULL, NULL),
(497, 'user', 473, 25, '2017-09-23 20:07:02', 0, NULL, NULL, NULL),
(498, 'user', 474, 25, '2017-09-23 20:07:02', 0, NULL, NULL, NULL),
(499, 'user', 475, 25, '2017-09-23 20:07:02', 0, NULL, NULL, NULL),
(500, 'user', 476, 25, '2017-09-23 20:07:02', 0, NULL, NULL, NULL),
(501, 'user', 477, 25, '2017-09-23 20:07:02', 0, NULL, NULL, NULL),
(502, 'user', 478, 25, '2017-09-23 20:07:02', 0, NULL, NULL, NULL),
(503, 'user', 479, 25, '2017-09-23 20:07:02', 0, NULL, NULL, NULL),
(504, 'user', 480, 25, '2017-09-23 20:07:02', 0, NULL, NULL, NULL),
(505, 'user', 481, 25, '2017-09-23 20:07:02', 0, NULL, NULL, NULL),
(506, 'user', 482, 25, '2017-09-23 20:07:02', 0, NULL, NULL, NULL),
(507, 'user', 483, 25, '2017-09-23 20:07:02', 0, NULL, NULL, NULL),
(508, 'user', 484, 25, '2017-09-23 20:07:02', 0, NULL, NULL, NULL),
(510, 'user', 485, 26, '2017-09-23 20:07:37', 0, NULL, NULL, NULL),
(511, 'user', 486, 26, '2017-09-23 20:07:37', 0, NULL, NULL, NULL),
(512, 'user', 487, 26, '2017-09-23 20:07:37', 0, NULL, NULL, NULL),
(513, 'user', 488, 26, '2017-09-23 20:07:37', 0, NULL, NULL, NULL),
(514, 'user', 489, 26, '2017-09-23 20:07:37', 0, NULL, NULL, NULL),
(515, 'user', 490, 26, '2017-09-23 20:07:37', 0, NULL, NULL, NULL),
(516, 'user', 491, 26, '2017-09-23 20:07:37', 0, NULL, NULL, NULL),
(517, 'user', 492, 26, '2017-09-23 20:07:37', 0, NULL, NULL, NULL),
(518, 'user', 493, 26, '2017-09-23 20:07:37', 0, NULL, NULL, NULL),
(519, 'user', 494, 26, '2017-09-23 20:07:37', 0, NULL, NULL, NULL),
(520, 'user', 495, 26, '2017-09-23 20:07:37', 0, NULL, NULL, NULL),
(521, 'user', 496, 26, '2017-09-23 20:07:37', 0, NULL, NULL, NULL),
(522, 'user', 497, 26, '2017-09-23 20:07:37', 0, NULL, NULL, NULL),
(523, 'user', 498, 26, '2017-09-23 20:07:37', 0, NULL, NULL, NULL),
(524, 'user', 499, 26, '2017-09-23 20:07:37', 0, NULL, NULL, NULL),
(525, 'user', 500, 26, '2017-09-23 20:07:37', 0, NULL, NULL, NULL),
(526, 'user', 501, 26, '2017-09-23 20:07:37', 0, NULL, NULL, NULL),
(527, 'user', 502, 26, '2017-09-23 20:07:37', 0, NULL, NULL, NULL),
(528, 'user', 503, 26, '2017-09-23 20:07:37', 0, NULL, NULL, NULL),
(529, 'user', 504, 26, '2017-09-23 20:07:37', 0, NULL, NULL, NULL),
(530, 'user', 505, 26, '2017-09-23 20:07:37', 0, NULL, NULL, NULL),
(531, 'user', 506, 26, '2017-09-23 20:07:37', 0, NULL, NULL, NULL),
(532, 'user', 507, 26, '2017-09-23 20:07:37', 0, NULL, NULL, NULL),
(533, 'user', 508, 26, '2017-09-23 20:07:37', 0, NULL, NULL, NULL),
(534, 'user', 509, 26, '2017-09-23 20:07:37', 0, NULL, NULL, NULL),
(535, 'user', 510, 26, '2017-09-23 20:07:37', 0, NULL, NULL, NULL),
(536, 'user', 511, 26, '2017-09-23 20:07:37', 0, NULL, NULL, NULL),
(537, 'user', 512, 26, '2017-09-23 20:07:37', 0, NULL, NULL, NULL),
(538, 'user', 513, 26, '2017-09-23 20:07:37', 0, NULL, NULL, NULL),
(539, 'user', 514, 26, '2017-09-23 20:07:37', 0, NULL, NULL, NULL),
(540, 'user', 515, 26, '2017-09-23 20:07:37', 0, NULL, NULL, NULL),
(541, 'user', 516, 26, '2017-09-23 20:07:37', 0, NULL, NULL, NULL),
(542, 'user', 517, 26, '2017-09-23 20:07:37', 0, NULL, NULL, NULL),
(543, 'user', 518, 26, '2017-09-23 20:07:37', 0, NULL, NULL, NULL),
(544, 'user', 519, 26, '2017-09-23 20:07:37', 0, NULL, NULL, NULL),
(545, 'user', 520, 26, '2017-09-23 20:07:37', 0, NULL, NULL, NULL),
(546, 'user', 521, 26, '2017-09-23 20:07:37', 0, NULL, NULL, NULL),
(547, 'user', 522, 26, '2017-09-23 20:07:37', 0, NULL, NULL, NULL),
(549, 'user', 523, 27, '2017-09-23 20:08:31', 0, NULL, NULL, NULL),
(554, 'user', 525, 29, '2017-09-23 20:28:30', 0, NULL, NULL, NULL),
(555, 'user', 526, 29, '2017-09-23 20:28:30', 0, NULL, NULL, NULL),
(558, 'user', 527, 30, '2017-09-23 20:31:12', 0, NULL, NULL, NULL),
(559, 'user', 528, 30, '2017-09-23 20:31:12', 0, NULL, NULL, NULL),
(560, 'user', 529, 30, '2017-09-23 20:31:12', 0, NULL, NULL, NULL),
(562, 'user', 530, 31, '2017-09-23 20:32:51', 0, NULL, NULL, NULL),
(564, 'user', 531, 32, '2017-09-23 20:33:25', 0, NULL, NULL, NULL),
(565, 'user', 532, 32, '2017-09-23 20:33:25', 0, NULL, NULL, NULL),
(567, 'user', 533, 33, '2017-09-24 03:14:54', 0, NULL, NULL, NULL),
(569, 'user', 534, 34, '2017-09-24 03:15:33', 0, NULL, NULL, NULL),
(570, 'user', 535, 34, '2017-09-24 03:15:33', 0, NULL, NULL, NULL),
(571, 'user', 536, 34, '2017-09-24 03:15:33', 0, NULL, NULL, NULL),
(572, 'user', 537, 34, '2017-09-24 03:15:33', 0, NULL, NULL, NULL),
(574, 'user', 538, 35, '2017-09-24 03:16:08', 0, NULL, NULL, NULL),
(576, 'user', 539, 36, '2017-09-24 03:17:01', 0, NULL, NULL, NULL),
(577, 'user', 540, 36, '2017-09-24 03:17:01', 0, NULL, NULL, NULL),
(578, 'user', 541, 36, '2017-09-24 03:17:01', 0, NULL, NULL, NULL),
(579, 'user', 542, 36, '2017-09-24 03:17:01', 0, NULL, NULL, NULL),
(580, 'user', 543, 36, '2017-09-24 03:17:01', 0, NULL, NULL, NULL),
(581, 'user', 544, 36, '2017-09-24 03:17:01', 0, NULL, NULL, NULL),
(582, 'user', 545, 36, '2017-09-24 03:17:01', 0, NULL, NULL, NULL),
(583, 'user', 546, 36, '2017-09-24 03:17:01', 0, NULL, NULL, NULL),
(584, 'user', 547, 36, '2017-09-24 03:17:01', 0, NULL, NULL, NULL),
(585, 'user', 548, 36, '2017-09-24 03:17:01', 0, NULL, NULL, NULL),
(586, 'user', 549, 36, '2017-09-24 03:17:01', 0, NULL, NULL, NULL),
(587, 'user', 550, 36, '2017-09-24 03:17:01', 0, NULL, NULL, NULL),
(589, 'user', 551, 37, '2017-09-24 03:17:54', 0, NULL, NULL, NULL),
(591, 'user', 552, 38, '2017-09-24 03:18:36', 0, NULL, NULL, NULL),
(592, 'user', 553, 38, '2017-09-24 03:18:36', 0, NULL, NULL, NULL),
(594, 'user', 554, 39, '2017-09-24 03:19:17', 0, NULL, NULL, NULL),
(595, 'user', 555, 39, '2017-09-24 03:19:17', 0, NULL, NULL, NULL),
(596, 'user', 556, 39, '2017-09-24 03:19:17', 0, NULL, NULL, NULL),
(597, 'user', 557, 39, '2017-09-24 03:19:17', 0, NULL, NULL, NULL),
(598, 'user', 558, 39, '2017-09-24 03:19:17', 0, NULL, NULL, NULL),
(599, 'user', 559, 39, '2017-09-24 03:19:17', 0, NULL, NULL, NULL),
(600, 'user', 560, 39, '2017-09-24 03:19:17', 0, NULL, NULL, NULL),
(601, 'user', 561, 39, '2017-09-24 03:19:17', 0, NULL, NULL, NULL),
(602, 'user', 562, 39, '2017-09-24 03:19:17', 0, NULL, NULL, NULL),
(603, 'user', 563, 39, '2017-09-24 03:19:17', 0, NULL, NULL, NULL),
(604, 'user', 564, 39, '2017-09-24 03:19:17', 0, NULL, NULL, NULL),
(605, 'user', 565, 39, '2017-09-24 03:19:17', 0, NULL, NULL, NULL),
(606, 'user', 566, 39, '2017-09-24 03:19:17', 0, NULL, NULL, NULL),
(607, 'user', 567, 39, '2017-09-24 03:19:17', 0, NULL, NULL, NULL),
(608, 'user', 568, 39, '2017-09-24 03:19:17', 0, NULL, NULL, NULL),
(609, 'user', 569, 39, '2017-09-24 03:19:17', 0, NULL, NULL, NULL),
(610, 'user', 570, 39, '2017-09-24 03:19:17', 0, NULL, NULL, NULL),
(611, 'user', 571, 39, '2017-09-24 03:19:17', 0, NULL, NULL, NULL),
(612, 'user', 572, 39, '2017-09-24 03:19:17', 0, NULL, NULL, NULL),
(613, 'user', 573, 39, '2017-09-24 03:19:17', 0, NULL, NULL, NULL),
(614, 'user', 574, 39, '2017-09-24 03:19:17', 0, NULL, NULL, NULL),
(615, 'user', 575, 39, '2017-09-24 03:19:17', 0, NULL, NULL, NULL),
(617, 'user', 576, 40, '2017-09-24 03:22:27', 0, NULL, NULL, NULL),
(618, 'user', 577, 40, '2017-09-24 03:22:27', 0, NULL, NULL, NULL),
(619, 'user', 578, 40, '2017-09-24 03:22:27', 0, NULL, NULL, NULL),
(620, 'user', 579, 40, '2017-09-24 03:22:27', 0, NULL, NULL, NULL),
(621, 'user', 580, 40, '2017-09-24 03:22:27', 0, NULL, NULL, NULL),
(622, 'user', 581, 40, '2017-09-24 03:22:27', 0, NULL, NULL, NULL),
(623, 'user', 582, 40, '2017-09-24 03:22:27', 0, NULL, NULL, NULL),
(624, 'user', 583, 40, '2017-09-24 03:22:27', 0, NULL, NULL, NULL),
(625, 'user', 584, 40, '2017-09-24 03:22:27', 0, NULL, NULL, NULL),
(626, 'user', 585, 40, '2017-09-24 03:22:27', 0, NULL, NULL, NULL),
(628, 'user', 586, 41, '2017-09-24 03:23:21', 0, NULL, NULL, NULL),
(630, 'user', 587, 42, '2017-09-24 03:24:14', 0, NULL, NULL, NULL),
(631, 'user', 588, 42, '2017-09-24 03:24:14', 0, NULL, NULL, NULL),
(632, 'user', 589, 42, '2017-09-24 03:24:14', 0, NULL, NULL, NULL),
(634, 'user', 590, 43, '2017-09-24 03:25:05', 0, NULL, NULL, NULL),
(636, 'user', 591, 44, '2017-09-24 03:26:00', 0, NULL, NULL, NULL),
(638, 'user', 592, 45, '2017-09-24 03:27:02', 0, NULL, NULL, NULL),
(639, 'user', 593, 45, '2017-09-24 03:27:02', 0, NULL, NULL, NULL),
(641, 'user', 594, 46, '2017-09-24 03:28:01', 0, NULL, NULL, NULL),
(642, 'user', 595, 46, '2017-09-24 03:28:01', 0, NULL, NULL, NULL),
(643, 'user', 596, 46, '2017-09-24 03:28:01', 0, NULL, NULL, NULL),
(644, 'user', 597, 46, '2017-09-24 03:28:01', 0, NULL, NULL, NULL),
(645, 'user', 598, 46, '2017-09-24 03:28:01', 0, NULL, NULL, NULL),
(646, 'user', 599, 46, '2017-09-24 03:28:01', 0, NULL, NULL, NULL),
(647, 'user', 600, 46, '2017-09-24 03:28:01', 0, NULL, NULL, NULL),
(648, 'user', 601, 46, '2017-09-24 03:28:01', 0, NULL, NULL, NULL),
(650, 'user', 602, 47, '2017-09-24 03:29:59', 0, NULL, NULL, NULL),
(651, 'user', 603, 47, '2017-09-24 03:29:59', 0, NULL, NULL, NULL),
(652, 'user', 604, 47, '2017-09-24 03:29:59', 0, NULL, NULL, NULL),
(653, 'user', 605, 47, '2017-09-24 03:29:59', 0, NULL, NULL, NULL),
(654, 'user', 606, 47, '2017-09-24 03:29:59', 0, NULL, NULL, NULL),
(655, 'user', 607, 47, '2017-09-24 03:29:59', 0, NULL, NULL, NULL),
(656, 'user', 608, 47, '2017-09-24 03:29:59', 0, NULL, NULL, NULL),
(657, 'user', 609, 47, '2017-09-24 03:29:59', 0, NULL, NULL, NULL),
(658, 'user', 610, 47, '2017-09-24 03:29:59', 0, NULL, NULL, NULL),
(659, 'user', 611, 47, '2017-09-24 03:29:59', 0, NULL, NULL, NULL),
(661, 'user', 612, 48, '2017-09-24 03:30:39', 0, NULL, NULL, NULL),
(663, 'user', 613, 49, '2017-09-24 03:31:18', 0, NULL, NULL, NULL),
(664, 'user', 614, 49, '2017-09-24 03:31:18', 0, NULL, NULL, NULL),
(665, 'user', 615, 49, '2017-09-24 03:31:18', 0, NULL, NULL, NULL),
(666, 'user', 616, 49, '2017-09-24 03:31:18', 0, NULL, NULL, NULL),
(667, 'user', 617, 49, '2017-09-24 03:31:18', 0, NULL, NULL, NULL),
(668, 'user', 618, 49, '2017-09-24 03:31:18', 0, NULL, NULL, NULL),
(669, 'user', 619, 49, '2017-09-24 03:31:18', 0, NULL, NULL, NULL),
(670, 'user', 620, 49, '2017-09-24 03:31:18', 0, NULL, NULL, NULL),
(671, 'user', 621, 49, '2017-09-24 03:31:18', 0, NULL, NULL, NULL),
(672, 'user', 622, 49, '2017-09-24 03:31:18', 0, NULL, NULL, NULL),
(674, 'user', 623, 50, '2017-09-24 03:32:14', 0, NULL, NULL, NULL),
(675, 'user', 624, 50, '2017-09-24 03:32:14', 0, NULL, NULL, NULL),
(677, 'user', 625, 51, '2017-09-24 03:32:46', 0, NULL, NULL, NULL),
(678, 'user', 626, 51, '2017-09-24 03:32:46', 0, NULL, NULL, NULL),
(680, 'user', 627, 52, '2017-09-24 03:33:23', 0, NULL, NULL, NULL),
(681, 'user', 628, 52, '2017-09-24 03:33:23', 0, NULL, NULL, NULL),
(682, 'user', 629, 52, '2017-09-24 03:33:23', 0, NULL, NULL, NULL),
(684, 'user', 630, 53, '2017-09-24 03:34:07', 0, NULL, NULL, NULL),
(685, 'user', 631, 53, '2017-09-24 03:34:07', 0, NULL, NULL, NULL),
(686, 'user', 632, 53, '2017-09-24 03:34:07', 0, NULL, NULL, NULL),
(687, 'user', 633, 53, '2017-09-24 03:34:07', 0, NULL, NULL, NULL),
(688, 'user', 634, 53, '2017-09-24 03:34:07', 0, NULL, NULL, NULL),
(689, 'user', 635, 53, '2017-09-24 03:34:07', 0, NULL, NULL, NULL),
(691, 'user', 636, 54, '2017-09-24 03:34:42', 0, NULL, NULL, NULL),
(692, 'user', 637, 54, '2017-09-24 03:34:42', 0, NULL, NULL, NULL),
(693, 'user', 638, 54, '2017-09-24 03:34:42', 0, NULL, NULL, NULL),
(694, 'user', 639, 54, '2017-09-24 03:34:42', 0, NULL, NULL, NULL),
(695, 'user', 640, 54, '2017-09-24 03:34:42', 0, NULL, NULL, NULL),
(696, 'user', 641, 54, '2017-09-24 03:34:42', 0, NULL, NULL, NULL),
(697, 'user', 642, 54, '2017-09-24 03:34:42', 0, NULL, NULL, NULL),
(698, 'user', 643, 54, '2017-09-24 03:34:42', 0, NULL, NULL, NULL),
(699, 'user', 644, 54, '2017-09-24 03:34:42', 0, NULL, NULL, NULL),
(701, 'user', 699, 55, '2017-09-24 03:41:05', 0, NULL, NULL, NULL),
(702, 'user', 700, 56, '2017-09-24 04:09:41', 0, NULL, NULL, NULL),
(703, 'user', 701, 56, '2017-09-24 04:09:41', 0, NULL, NULL, NULL),
(704, 'user', 702, 56, '2017-09-24 04:09:41', 0, NULL, NULL, NULL),
(705, 'user', 703, 56, '2017-09-24 04:09:41', 0, NULL, NULL, NULL),
(706, 'user', 704, 57, '2017-09-24 04:11:26', 0, NULL, NULL, NULL),
(707, 'user', 705, 57, '2017-09-24 04:11:26', 0, NULL, NULL, NULL),
(708, 'user', 706, 57, '2017-09-24 04:11:26', 0, NULL, NULL, NULL),
(709, 'user', 707, 58, '2017-09-24 04:12:28', 0, NULL, NULL, NULL),
(710, 'user', 708, 59, '2017-09-24 04:13:28', 0, NULL, NULL, NULL),
(711, 'user', 709, 60, '2017-09-24 04:14:51', 0, NULL, NULL, NULL),
(712, 'user', 710, 60, '2017-09-24 04:14:51', 0, NULL, NULL, NULL),
(713, 'user', 711, 60, '2017-09-24 04:14:51', 0, NULL, NULL, NULL),
(714, 'user', 712, 60, '2017-09-24 04:14:51', 0, NULL, NULL, NULL),
(715, 'user', 713, 61, '2017-09-24 04:16:13', 0, NULL, NULL, NULL),
(716, 'user', 714, 61, '2017-09-24 04:16:13', 0, NULL, NULL, NULL),
(717, 'user', 715, 61, '2017-09-24 04:16:13', 0, NULL, NULL, NULL),
(718, 'user', 716, 61, '2017-09-24 04:16:13', 0, NULL, NULL, NULL),
(719, 'user', 717, 61, '2017-09-24 04:16:13', 0, NULL, NULL, NULL),
(720, 'user', 718, 61, '2017-09-24 04:16:13', 0, NULL, NULL, NULL),
(721, 'user', 719, 61, '2017-09-24 04:16:13', 0, NULL, NULL, NULL),
(722, 'user', 720, 61, '2017-09-24 04:16:13', 0, NULL, NULL, NULL),
(723, 'user', 721, 61, '2017-09-24 04:16:13', 0, NULL, NULL, NULL),
(724, 'user', 722, 62, '2017-09-24 04:24:09', 0, NULL, NULL, NULL),
(725, 'user', 723, 62, '2017-09-24 04:24:09', 0, NULL, NULL, NULL),
(726, 'user', 724, 62, '2017-09-24 04:24:09', 0, NULL, NULL, NULL),
(727, 'user', 725, 62, '2017-09-24 04:24:09', 0, NULL, NULL, NULL),
(728, 'user', 726, 62, '2017-09-24 04:24:09', 0, NULL, NULL, NULL),
(729, 'user', 727, 62, '2017-09-24 04:24:09', 0, NULL, NULL, NULL),
(730, 'user', 728, 62, '2017-09-24 04:24:09', 0, NULL, NULL, NULL),
(731, 'user', 729, 62, '2017-09-24 04:24:09', 0, NULL, NULL, NULL),
(732, 'user', 730, 62, '2017-09-24 04:24:09', 0, NULL, NULL, NULL),
(733, 'user', 731, 62, '2017-09-24 04:24:09', 0, NULL, NULL, NULL),
(734, 'user', 732, 63, '2017-09-24 04:25:29', 0, NULL, NULL, NULL),
(735, 'user', 733, 63, '2017-09-24 04:25:29', 0, NULL, NULL, NULL),
(736, 'user', 734, 63, '2017-09-24 04:25:29', 0, NULL, NULL, NULL),
(737, 'user', 735, 63, '2017-09-24 04:25:29', 0, NULL, NULL, NULL),
(738, 'user', 736, 63, '2017-09-24 04:25:29', 0, NULL, NULL, NULL),
(739, 'user', 737, 63, '2017-09-24 04:25:29', 0, NULL, NULL, NULL),
(740, 'user', 738, 63, '2017-09-24 04:25:29', 0, NULL, NULL, NULL),
(741, 'user', 739, 63, '2017-09-24 04:25:29', 0, NULL, NULL, NULL),
(742, 'user', 740, 63, '2017-09-24 04:25:29', 0, NULL, NULL, NULL),
(743, 'user', 741, 63, '2017-09-24 04:25:29', 0, NULL, NULL, NULL),
(744, 'user', 742, 63, '2017-09-24 04:25:29', 0, NULL, NULL, NULL),
(745, 'user', 743, 63, '2017-09-24 04:25:29', 0, NULL, NULL, NULL),
(746, 'user', 744, 63, '2017-09-24 04:25:29', 0, NULL, NULL, NULL),
(747, 'user', 745, 63, '2017-09-24 04:25:29', 0, NULL, NULL, NULL),
(748, 'user', 746, 63, '2017-09-24 04:25:29', 0, NULL, NULL, NULL),
(749, 'user', 747, 63, '2017-09-24 04:25:29', 0, NULL, NULL, NULL),
(750, 'user', 748, 63, '2017-09-24 04:25:29', 0, NULL, NULL, NULL),
(751, 'user', 749, 63, '2017-09-24 04:25:29', 0, NULL, NULL, NULL),
(752, 'user', 750, 63, '2017-09-24 04:25:29', 0, NULL, NULL, NULL),
(753, 'user', 751, 63, '2017-09-24 04:25:29', 0, NULL, NULL, NULL),
(754, 'user', 752, 63, '2017-09-24 04:25:29', 0, NULL, NULL, NULL),
(755, 'user', 753, 63, '2017-09-24 04:25:29', 0, NULL, NULL, NULL),
(756, 'user', 754, 63, '2017-09-24 04:25:29', 0, NULL, NULL, NULL),
(757, 'user', 755, 63, '2017-09-24 04:25:29', 0, NULL, NULL, NULL),
(758, 'user', 756, 63, '2017-09-24 04:25:29', 0, NULL, NULL, NULL),
(759, 'user', 757, 63, '2017-09-24 04:25:29', 0, NULL, NULL, NULL),
(760, 'user', 758, 63, '2017-09-24 04:25:29', 0, NULL, NULL, NULL),
(761, 'user', 759, 63, '2017-09-24 04:25:29', 0, NULL, NULL, NULL),
(762, 'user', 760, 63, '2017-09-24 04:25:29', 0, NULL, NULL, NULL),
(763, 'user', 761, 63, '2017-09-24 04:25:29', 0, NULL, NULL, NULL),
(764, 'user', 762, 64, '2017-09-24 04:27:10', 0, NULL, NULL, NULL),
(765, 'user', 763, 64, '2017-09-24 04:27:10', 0, NULL, NULL, NULL),
(766, 'user', 764, 64, '2017-09-24 04:27:10', 0, NULL, NULL, NULL),
(767, 'user', 765, 64, '2017-09-24 04:27:10', 0, NULL, NULL, NULL),
(768, 'user', 766, 64, '2017-09-24 04:27:10', 0, NULL, NULL, NULL),
(769, 'user', 767, 64, '2017-09-24 04:27:10', 0, NULL, NULL, NULL),
(770, 'user', 768, 65, '2017-09-24 04:28:04', 0, NULL, NULL, NULL),
(771, 'user', 769, 65, '2017-09-24 04:28:04', 0, NULL, NULL, NULL),
(772, 'user', 770, 65, '2017-09-24 04:28:04', 0, NULL, NULL, NULL),
(773, 'user', 771, 65, '2017-09-24 04:28:04', 0, NULL, NULL, NULL),
(774, 'user', 772, 66, '2017-09-24 04:29:14', 0, NULL, NULL, NULL),
(775, 'user', 773, 66, '2017-09-24 04:29:14', 0, NULL, NULL, NULL),
(776, 'user', 774, 66, '2017-09-24 04:29:14', 0, NULL, NULL, NULL),
(777, 'user', 775, 66, '2017-09-24 04:29:14', 0, NULL, NULL, NULL),
(778, 'user', 776, 66, '2017-09-24 04:29:14', 0, NULL, NULL, NULL),
(779, 'user', 777, 66, '2017-09-24 04:29:14', 0, NULL, NULL, NULL),
(780, 'user', 778, 66, '2017-09-24 04:29:14', 0, NULL, NULL, NULL),
(781, 'user', 779, 66, '2017-09-24 04:29:14', 0, NULL, NULL, NULL),
(782, 'user', 780, 66, '2017-09-24 04:29:14', 0, NULL, NULL, NULL),
(783, 'user', 781, 66, '2017-09-24 04:29:14', 0, NULL, NULL, NULL),
(784, 'user', 782, 66, '2017-09-24 04:29:14', 0, NULL, NULL, NULL),
(785, 'user', 783, 66, '2017-09-24 04:29:14', 0, NULL, NULL, NULL),
(786, 'user', 784, 66, '2017-09-24 04:29:14', 0, NULL, NULL, NULL),
(787, 'user', 785, 66, '2017-09-24 04:29:14', 0, NULL, NULL, NULL),
(788, 'user', 786, 66, '2017-09-24 04:29:14', 0, NULL, NULL, NULL),
(789, 'user', 787, 67, '2017-09-24 04:30:16', 0, NULL, NULL, NULL),
(790, 'user', 788, 67, '2017-09-24 04:30:16', 0, NULL, NULL, NULL),
(791, 'user', 789, 68, '2017-09-24 04:31:24', 0, NULL, NULL, NULL),
(792, 'user', 790, 68, '2017-09-24 04:31:24', 0, NULL, NULL, NULL),
(793, 'user', 791, 68, '2017-09-24 04:31:24', 0, NULL, NULL, NULL),
(794, 'user', 792, 68, '2017-09-24 04:31:24', 0, NULL, NULL, NULL),
(795, 'user', 793, 68, '2017-09-24 04:31:24', 0, NULL, NULL, NULL),
(796, 'user', 794, 68, '2017-09-24 04:31:24', 0, NULL, NULL, NULL),
(797, 'user', 795, 68, '2017-09-24 04:31:24', 0, NULL, NULL, NULL),
(798, 'user', 796, 68, '2017-09-24 04:31:24', 0, NULL, NULL, NULL),
(799, 'user', 797, 68, '2017-09-24 04:31:24', 0, NULL, NULL, NULL),
(800, 'user', 798, 69, '2017-09-24 04:32:32', 0, NULL, NULL, NULL),
(801, 'user', 799, 69, '2017-09-24 04:32:32', 0, NULL, NULL, NULL),
(802, 'user', 800, 69, '2017-09-24 04:32:32', 0, NULL, NULL, NULL),
(803, 'user', 801, 69, '2017-09-24 04:32:32', 0, NULL, NULL, NULL),
(804, 'user', 802, 69, '2017-09-24 04:32:32', 0, NULL, NULL, NULL),
(805, 'user', 803, 69, '2017-09-24 04:32:33', 0, NULL, NULL, NULL),
(806, 'user', 804, 69, '2017-09-24 04:32:33', 0, NULL, NULL, NULL),
(807, 'user', 805, 69, '2017-09-24 04:32:33', 0, NULL, NULL, NULL),
(808, 'user', 806, 69, '2017-09-24 04:32:33', 0, NULL, NULL, NULL),
(809, 'user', 807, 69, '2017-09-24 04:32:33', 0, NULL, NULL, NULL),
(810, 'user', 808, 69, '2017-09-24 04:32:33', 0, NULL, NULL, NULL),
(811, 'user', 809, 69, '2017-09-24 04:32:33', 0, NULL, NULL, NULL),
(812, 'user', 810, 69, '2017-09-24 04:32:33', 0, NULL, NULL, NULL),
(813, 'user', 811, 69, '2017-09-24 04:32:33', 0, NULL, NULL, NULL),
(814, 'user', 812, 69, '2017-09-24 04:32:33', 0, NULL, NULL, NULL),
(815, 'user', 813, 69, '2017-09-24 04:32:33', 0, NULL, NULL, NULL),
(816, 'user', 814, 69, '2017-09-24 04:32:33', 0, NULL, NULL, NULL);
INSERT INTO `group_members` (`member_id`, `role`, `student_student_id`, `group_group_id`, `_when_added`, `status`, `t_created_on`, `t_updated_on`, `_who_added`) VALUES
(817, 'user', 815, 69, '2017-09-24 04:32:33', 0, NULL, NULL, NULL),
(818, 'user', 816, 69, '2017-09-24 04:32:33', 0, NULL, NULL, NULL),
(819, 'user', 817, 70, '2017-09-24 04:33:42', 0, NULL, NULL, NULL),
(820, 'user', 818, 71, '2017-09-24 04:34:37', 0, NULL, NULL, NULL),
(821, 'user', 819, 71, '2017-09-24 04:34:37', 0, NULL, NULL, NULL),
(822, 'user', 820, 71, '2017-09-24 04:34:37', 0, NULL, NULL, NULL),
(823, 'user', 821, 71, '2017-09-24 04:34:37', 0, NULL, NULL, NULL),
(824, 'user', 822, 71, '2017-09-24 04:34:37', 0, NULL, NULL, NULL),
(825, 'user', 823, 71, '2017-09-24 04:34:37', 0, NULL, NULL, NULL),
(826, 'user', 824, 71, '2017-09-24 04:34:37', 0, NULL, NULL, NULL),
(827, 'user', 825, 72, '2017-09-24 04:35:22', 0, NULL, NULL, NULL),
(828, 'user', 826, 72, '2017-09-24 04:35:22', 0, NULL, NULL, NULL),
(829, 'user', 827, 72, '2017-09-24 04:35:22', 0, NULL, NULL, NULL),
(830, 'user', 828, 72, '2017-09-24 04:35:22', 0, NULL, NULL, NULL),
(831, 'user', 829, 72, '2017-09-24 04:35:22', 0, NULL, NULL, NULL),
(832, 'user', 830, 72, '2017-09-24 04:35:22', 0, NULL, NULL, NULL),
(833, 'user', 831, 72, '2017-09-24 04:35:22', 0, NULL, NULL, NULL),
(834, 'user', 832, 72, '2017-09-24 04:35:22', 0, NULL, NULL, NULL),
(835, 'user', 833, 72, '2017-09-24 04:35:22', 0, NULL, NULL, NULL),
(836, 'user', 834, 72, '2017-09-24 04:35:22', 0, NULL, NULL, NULL),
(837, 'user', 835, 72, '2017-09-24 04:35:22', 0, NULL, NULL, NULL),
(838, 'user', 836, 73, '2017-09-24 04:36:31', 0, NULL, NULL, NULL),
(839, 'user', 837, 73, '2017-09-24 04:36:31', 0, NULL, NULL, NULL),
(840, 'user', 838, 73, '2017-09-24 04:36:31', 0, NULL, NULL, NULL),
(841, 'user', 839, 73, '2017-09-24 04:36:31', 0, NULL, NULL, NULL),
(842, 'user', 840, 74, '2017-09-24 04:37:28', 0, NULL, NULL, NULL),
(843, 'user', 841, 74, '2017-09-24 04:37:28', 0, NULL, NULL, NULL),
(844, 'user', 842, 74, '2017-09-24 04:37:28', 0, NULL, NULL, NULL),
(845, 'user', 843, 74, '2017-09-24 04:37:28', 0, NULL, NULL, NULL),
(846, 'user', 844, 74, '2017-09-24 04:37:28', 0, NULL, NULL, NULL),
(847, 'user', 845, 74, '2017-09-24 04:37:28', 0, NULL, NULL, NULL),
(848, 'user', 846, 74, '2017-09-24 04:37:28', 0, NULL, NULL, NULL),
(849, 'user', 847, 74, '2017-09-24 04:37:28', 0, NULL, NULL, NULL),
(850, 'user', 848, 75, '2017-09-24 04:38:58', 0, NULL, NULL, NULL),
(851, 'user', 849, 75, '2017-09-24 04:38:58', 0, NULL, NULL, NULL),
(852, 'user', 850, 75, '2017-09-24 04:38:58', 0, NULL, NULL, NULL),
(853, 'user', 851, 75, '2017-09-24 04:38:58', 0, NULL, NULL, NULL),
(854, 'user', 852, 75, '2017-09-24 04:38:58', 0, NULL, NULL, NULL),
(855, 'user', 853, 75, '2017-09-24 04:38:58', 0, NULL, NULL, NULL),
(856, 'user', 854, 75, '2017-09-24 04:38:58', 0, NULL, NULL, NULL),
(857, 'user', 855, 75, '2017-09-24 04:38:58', 0, NULL, NULL, NULL),
(858, 'user', 856, 75, '2017-09-24 04:38:58', 0, NULL, NULL, NULL),
(859, 'user', 857, 75, '2017-09-24 04:38:58', 0, NULL, NULL, NULL),
(860, 'user', 858, 75, '2017-09-24 04:38:58', 0, NULL, NULL, NULL),
(861, 'user', 859, 75, '2017-09-24 04:38:58', 0, NULL, NULL, NULL),
(862, 'user', 860, 75, '2017-09-24 04:38:58', 0, NULL, NULL, NULL),
(863, 'user', 861, 75, '2017-09-24 04:38:58', 0, NULL, NULL, NULL),
(864, 'user', 862, 75, '2017-09-24 04:38:58', 0, NULL, NULL, NULL),
(865, 'user', 863, 75, '2017-09-24 04:38:58', 0, NULL, NULL, NULL),
(866, 'user', 864, 75, '2017-09-24 04:38:58', 0, NULL, NULL, NULL),
(867, 'user', 865, 75, '2017-09-24 04:38:58', 0, NULL, NULL, NULL),
(868, 'user', 866, 76, '2017-09-24 04:46:39', 0, NULL, NULL, NULL),
(869, 'user', 867, 77, '2017-09-24 04:47:21', 0, NULL, NULL, NULL),
(870, 'user', 868, 77, '2017-09-24 04:47:21', 0, NULL, NULL, NULL),
(871, 'user', 869, 77, '2017-09-24 04:47:21', 0, NULL, NULL, NULL),
(872, 'user', 870, 77, '2017-09-24 04:47:21', 0, NULL, NULL, NULL),
(873, 'user', 871, 77, '2017-09-24 04:47:21', 0, NULL, NULL, NULL),
(874, 'user', 872, 77, '2017-09-24 04:47:21', 0, NULL, NULL, NULL),
(875, 'user', 873, 77, '2017-09-24 04:47:21', 0, NULL, NULL, NULL),
(876, 'user', 874, 78, '2017-09-24 04:48:31', 0, NULL, NULL, NULL),
(877, 'user', 875, 78, '2017-09-24 04:48:31', 0, NULL, NULL, NULL),
(878, 'user', 876, 78, '2017-09-24 04:48:31', 0, NULL, NULL, NULL),
(879, 'user', 877, 78, '2017-09-24 04:48:31', 0, NULL, NULL, NULL),
(880, 'user', 878, 78, '2017-09-24 04:48:31', 0, NULL, NULL, NULL),
(881, 'user', 879, 78, '2017-09-24 04:48:31', 0, NULL, NULL, NULL),
(882, 'user', 880, 78, '2017-09-24 04:48:31', 0, NULL, NULL, NULL),
(883, 'user', 881, 79, '2017-09-24 04:50:13', 0, NULL, NULL, NULL),
(884, 'user', 882, 79, '2017-09-24 04:50:13', 0, NULL, NULL, NULL),
(885, 'user', 883, 79, '2017-09-24 04:50:13', 0, NULL, NULL, NULL),
(886, 'user', 884, 79, '2017-09-24 04:50:13', 0, NULL, NULL, NULL),
(887, 'user', 885, 79, '2017-09-24 04:50:13', 0, NULL, NULL, NULL),
(888, 'user', 886, 79, '2017-09-24 04:50:13', 0, NULL, NULL, NULL),
(889, 'user', 887, 79, '2017-09-24 04:50:13', 0, NULL, NULL, NULL),
(890, 'user', 888, 79, '2017-09-24 04:50:13', 0, NULL, NULL, NULL),
(891, 'user', 889, 79, '2017-09-24 04:50:13', 0, NULL, NULL, NULL),
(892, 'user', 890, 79, '2017-09-24 04:50:13', 0, NULL, NULL, NULL),
(893, 'user', 891, 80, '2017-09-24 04:51:19', 0, NULL, NULL, NULL),
(894, 'user', 892, 80, '2017-09-24 04:51:19', 0, NULL, NULL, NULL),
(895, 'user', 893, 80, '2017-09-24 04:51:19', 0, NULL, NULL, NULL),
(896, 'user', 894, 80, '2017-09-24 04:51:19', 0, NULL, NULL, NULL),
(897, 'user', 895, 80, '2017-09-24 04:51:19', 0, NULL, NULL, NULL),
(898, 'user', 896, 80, '2017-09-24 04:51:19', 0, NULL, NULL, NULL),
(899, 'user', 897, 81, '2017-09-24 04:51:57', 0, NULL, NULL, NULL),
(900, 'user', 898, 82, '2017-09-24 04:52:40', 0, NULL, NULL, NULL),
(901, 'user', 899, 82, '2017-09-24 04:52:40', 0, NULL, NULL, NULL),
(902, 'user', 900, 82, '2017-09-24 04:52:40', 0, NULL, NULL, NULL),
(903, 'user', 901, 83, '2017-09-24 04:53:34', 0, NULL, NULL, NULL),
(904, 'user', 902, 83, '2017-09-24 04:53:34', 0, NULL, NULL, NULL),
(905, 'user', 903, 84, '2017-09-24 04:54:25', 0, NULL, NULL, NULL),
(906, 'user', 904, 84, '2017-09-24 04:54:25', 0, NULL, NULL, NULL),
(907, 'user', 905, 84, '2017-09-24 04:54:25', 0, NULL, NULL, NULL),
(908, 'user', 906, 84, '2017-09-24 04:54:25', 0, NULL, NULL, NULL),
(909, 'user', 907, 84, '2017-09-24 04:54:25', 0, NULL, NULL, NULL),
(910, 'user', 908, 85, '2017-09-24 04:55:15', 0, NULL, NULL, NULL),
(911, 'user', 909, 85, '2017-09-24 04:55:15', 0, NULL, NULL, NULL),
(912, 'user', 910, 85, '2017-09-24 04:55:15', 0, NULL, NULL, NULL),
(913, 'user', 911, 85, '2017-09-24 04:55:15', 0, NULL, NULL, NULL),
(914, 'user', 912, 85, '2017-09-24 04:55:15', 0, NULL, NULL, NULL),
(915, 'user', 913, 85, '2017-09-24 04:55:15', 0, NULL, NULL, NULL),
(916, 'user', 914, 86, '2017-09-24 04:59:27', 0, NULL, NULL, NULL),
(917, 'user', 915, 86, '2017-09-24 04:59:27', 0, NULL, NULL, NULL),
(918, 'user', 916, 86, '2017-09-24 04:59:27', 0, NULL, NULL, NULL),
(919, 'user', 917, 87, '2017-09-24 05:00:14', 0, NULL, NULL, NULL),
(920, 'user', 918, 88, '2017-09-24 05:01:10', 0, NULL, NULL, NULL),
(921, 'user', 919, 88, '2017-09-24 05:01:10', 0, NULL, NULL, NULL),
(922, 'user', 920, 89, '2017-09-24 05:01:54', 0, NULL, NULL, NULL),
(923, 'user', 921, 90, '2017-09-24 05:05:54', 0, NULL, NULL, NULL),
(924, 'user', 922, 90, '2017-09-24 05:05:54', 0, NULL, NULL, NULL),
(925, 'user', 923, 90, '2017-09-24 05:05:54', 0, NULL, NULL, NULL),
(926, 'user', 924, 90, '2017-09-24 05:05:54', 0, NULL, NULL, NULL),
(927, 'user', 925, 90, '2017-09-24 05:05:54', 0, NULL, NULL, NULL),
(928, 'user', 926, 90, '2017-09-24 05:05:54', 0, NULL, NULL, NULL),
(929, 'user', 927, 90, '2017-09-24 05:05:54', 0, NULL, NULL, NULL),
(930, 'user', 928, 90, '2017-09-24 05:05:54', 0, NULL, NULL, NULL),
(931, 'user', 929, 90, '2017-09-24 05:05:54', 0, NULL, NULL, NULL),
(932, 'user', 930, 90, '2017-09-24 05:05:54', 0, NULL, NULL, NULL),
(933, 'user', 931, 90, '2017-09-24 05:05:54', 0, NULL, NULL, NULL),
(934, 'user', 932, 91, '2017-09-24 05:07:04', 0, NULL, NULL, NULL),
(935, 'user', 933, 91, '2017-09-24 05:07:04', 0, NULL, NULL, NULL),
(936, 'user', 934, 92, '2017-09-24 05:11:27', 0, NULL, NULL, NULL),
(937, 'user', 935, 93, '2017-09-24 05:12:21', 0, NULL, NULL, NULL),
(938, 'user', 936, 94, '2017-09-24 05:13:07', 0, NULL, NULL, NULL),
(939, 'user', 937, 94, '2017-09-24 05:13:07', 0, NULL, NULL, NULL),
(940, 'user', 938, 95, '2017-09-24 05:13:58', 0, NULL, NULL, NULL),
(941, 'user', 939, 95, '2017-09-24 05:13:58', 0, NULL, NULL, NULL),
(942, 'user', 940, 96, '2017-09-24 05:16:45', 0, NULL, NULL, NULL),
(943, 'user', 941, 96, '2017-09-24 05:16:45', 0, NULL, NULL, NULL),
(944, 'user', 942, 96, '2017-09-24 05:16:45', 0, NULL, NULL, NULL),
(945, 'user', 943, 96, '2017-09-24 05:16:45', 0, NULL, NULL, NULL),
(946, 'user', 944, 96, '2017-09-24 05:16:45', 0, NULL, NULL, NULL),
(947, 'user', 945, 96, '2017-09-24 05:16:45', 0, NULL, NULL, NULL),
(948, 'user', 946, 96, '2017-09-24 05:16:45', 0, NULL, NULL, NULL),
(949, 'user', 947, 96, '2017-09-24 05:16:45', 0, NULL, NULL, NULL),
(950, 'user', 948, 96, '2017-09-24 05:16:45', 0, NULL, NULL, NULL),
(951, 'user', 949, 96, '2017-09-24 05:18:33', 0, NULL, NULL, NULL),
(952, 'user', 950, 96, '2017-09-24 05:18:33', 0, NULL, NULL, NULL),
(953, 'user', 951, 96, '2017-09-24 05:18:33', 0, NULL, NULL, NULL),
(954, 'user', 952, 96, '2017-09-24 05:18:33', 0, NULL, NULL, NULL),
(955, 'user', 953, 96, '2017-09-24 05:18:33', 0, NULL, NULL, NULL),
(956, 'user', 954, 96, '2017-09-24 05:18:33', 0, NULL, NULL, NULL),
(957, 'user', 955, 96, '2017-09-24 05:18:33', 0, NULL, NULL, NULL),
(958, 'user', 956, 96, '2017-09-24 05:18:33', 0, NULL, NULL, NULL),
(959, 'user', 957, 96, '2017-09-24 05:18:33', 0, NULL, NULL, NULL),
(960, 'user', 958, 97, '2017-09-24 05:19:16', 0, NULL, NULL, NULL),
(961, 'user', 959, 97, '2017-09-24 05:19:16', 0, NULL, NULL, NULL),
(962, 'user', 960, 97, '2017-09-24 05:19:16', 0, NULL, NULL, NULL),
(963, 'user', 961, 97, '2017-09-24 05:19:16', 0, NULL, NULL, NULL),
(964, 'user', 962, 97, '2017-09-24 05:19:16', 0, NULL, NULL, NULL),
(965, 'user', 963, 97, '2017-09-24 05:19:16', 0, NULL, NULL, NULL),
(966, 'user', 964, 98, '2017-09-24 05:19:58', 0, NULL, NULL, NULL),
(967, 'user', 965, 99, '2017-09-24 05:20:51', 0, NULL, NULL, NULL),
(968, 'user', 966, 99, '2017-09-24 05:20:51', 0, NULL, NULL, NULL),
(969, 'user', 967, 99, '2017-09-24 05:20:51', 0, NULL, NULL, NULL),
(970, 'user', 968, 99, '2017-09-24 05:20:51', 0, NULL, NULL, NULL),
(971, 'user', 969, 99, '2017-09-24 05:20:51', 0, NULL, NULL, NULL),
(972, 'user', 970, 99, '2017-09-24 05:20:51', 0, NULL, NULL, NULL),
(973, 'user', 971, 99, '2017-09-24 05:20:51', 0, NULL, NULL, NULL),
(974, 'user', 972, 99, '2017-09-24 05:20:51', 0, NULL, NULL, NULL),
(975, 'user', 973, 99, '2017-09-24 05:20:51', 0, NULL, NULL, NULL),
(976, 'user', 974, 99, '2017-09-24 05:20:51', 0, NULL, NULL, NULL),
(977, 'user', 975, 99, '2017-09-24 05:20:51', 0, NULL, NULL, NULL),
(978, 'user', 976, 99, '2017-09-24 05:20:51', 0, NULL, NULL, NULL),
(979, 'user', 977, 99, '2017-09-24 05:20:51', 0, NULL, NULL, NULL),
(980, 'user', 978, 100, '2017-09-24 05:21:38', 0, NULL, NULL, NULL),
(981, 'user', 979, 100, '2017-09-24 05:21:38', 0, NULL, NULL, NULL),
(982, 'user', 980, 101, '2017-09-24 05:22:12', 0, NULL, NULL, NULL),
(983, 'user', 981, 101, '2017-09-24 05:22:12', 0, NULL, NULL, NULL),
(984, 'user', 982, 101, '2017-09-24 05:22:12', 0, NULL, NULL, NULL),
(985, 'user', 983, 102, '2017-09-24 05:22:47', 0, NULL, NULL, NULL),
(986, 'user', 984, 102, '2017-09-24 05:22:47', 0, NULL, NULL, NULL),
(987, 'user', 985, 102, '2017-09-24 05:22:47', 0, NULL, NULL, NULL),
(988, 'user', 986, 103, '2017-09-24 05:23:26', 0, NULL, NULL, NULL),
(989, 'user', 987, 103, '2017-09-24 05:23:26', 0, NULL, NULL, NULL),
(990, 'user', 988, 103, '2017-09-24 05:23:26', 0, NULL, NULL, NULL),
(991, 'user', 989, 103, '2017-09-24 05:23:26', 0, NULL, NULL, NULL),
(992, 'user', 990, 103, '2017-09-24 05:23:26', 0, NULL, NULL, NULL),
(993, 'user', 991, 103, '2017-09-24 05:23:26', 0, NULL, NULL, NULL),
(994, 'user', 992, 103, '2017-09-24 05:23:26', 0, NULL, NULL, NULL),
(995, 'user', 993, 103, '2017-09-24 05:23:26', 0, NULL, NULL, NULL),
(996, 'user', 994, 104, '2017-09-24 05:24:16', 0, NULL, NULL, NULL),
(997, 'user', 995, 104, '2017-09-24 05:24:16', 0, NULL, NULL, NULL),
(998, 'user', 996, 104, '2017-09-24 05:24:16', 0, NULL, NULL, NULL),
(999, 'user', 997, 104, '2017-09-24 05:24:16', 0, NULL, NULL, NULL),
(1000, 'user', 998, 104, '2017-09-24 05:24:16', 0, NULL, NULL, NULL),
(1001, 'user', 999, 104, '2017-09-24 05:24:16', 0, NULL, NULL, NULL),
(1002, 'user', 1000, 104, '2017-09-24 05:24:16', 0, NULL, NULL, NULL),
(1003, 'user', 1001, 104, '2017-09-24 05:24:16', 0, NULL, NULL, NULL),
(1004, 'user', 1002, 104, '2017-09-24 05:24:16', 0, NULL, NULL, NULL),
(1005, 'user', 1003, 104, '2017-09-24 05:24:16', 0, NULL, NULL, NULL),
(1006, 'user', 1004, 104, '2017-09-24 05:24:16', 0, NULL, NULL, NULL),
(1007, 'user', 1005, 104, '2017-09-24 05:24:16', 0, NULL, NULL, NULL),
(1008, 'user', 1006, 105, '2017-09-24 05:30:40', 0, NULL, NULL, NULL),
(1009, 'user', 1007, 105, '2017-09-24 05:30:40', 0, NULL, NULL, NULL),
(1010, 'user', 1008, 105, '2017-09-24 05:30:40', 0, NULL, NULL, NULL),
(1011, 'user', 1009, 105, '2017-09-24 05:30:40', 0, NULL, NULL, NULL),
(1012, 'user', 1010, 105, '2017-09-24 05:30:40', 0, NULL, NULL, NULL),
(1013, 'user', 1011, 105, '2017-09-24 05:30:40', 0, NULL, NULL, NULL),
(1014, 'user', 1012, 105, '2017-09-24 05:30:40', 0, NULL, NULL, NULL),
(1015, 'user', 1013, 106, '2017-09-24 05:31:29', 0, NULL, NULL, NULL),
(1016, 'user', 1014, 106, '2017-09-24 05:31:29', 0, NULL, NULL, NULL),
(1017, 'user', 1015, 106, '2017-09-24 05:31:29', 0, NULL, NULL, NULL),
(1018, 'user', 1016, 107, '2017-09-24 05:32:07', 0, NULL, NULL, NULL),
(1019, 'user', 1017, 107, '2017-09-24 05:32:07', 0, NULL, NULL, NULL),
(1020, 'user', 1018, 107, '2017-09-24 05:32:07', 0, NULL, NULL, NULL),
(1021, 'user', 1019, 107, '2017-09-24 05:32:07', 0, NULL, NULL, NULL),
(1022, 'user', 1020, 107, '2017-09-24 05:32:07', 0, NULL, NULL, NULL),
(1023, 'user', 1021, 107, '2017-09-24 05:32:07', 0, NULL, NULL, NULL),
(1024, 'user', 1022, 107, '2017-09-24 05:32:07', 0, NULL, NULL, NULL),
(1025, 'user', 1023, 107, '2017-09-24 05:32:07', 0, NULL, NULL, NULL),
(1026, 'user', 1024, 108, '2017-09-24 05:33:18', 0, NULL, NULL, NULL),
(1027, 'user', 1025, 109, '2017-09-24 05:34:14', 0, NULL, NULL, NULL),
(1028, 'user', 1026, 109, '2017-09-24 05:34:14', 0, NULL, NULL, NULL),
(1029, 'user', 1027, 109, '2017-09-24 05:34:14', 0, NULL, NULL, NULL),
(1030, 'user', 1028, 109, '2017-09-24 05:34:14', 0, NULL, NULL, NULL),
(1031, 'user', 1029, 109, '2017-09-24 05:34:14', 0, NULL, NULL, NULL),
(1032, 'user', 1030, 110, '2017-09-24 05:34:56', 0, NULL, NULL, NULL),
(1033, 'user', 1031, 110, '2017-09-24 05:34:56', 0, NULL, NULL, NULL),
(1034, 'user', 1032, 110, '2017-09-24 05:34:56', 0, NULL, NULL, NULL),
(1035, 'user', 1033, 110, '2017-09-24 05:34:56', 0, NULL, NULL, NULL),
(1036, 'user', 1034, 110, '2017-09-24 05:34:56', 0, NULL, NULL, NULL),
(1037, 'user', 1035, 110, '2017-09-24 05:34:56', 0, NULL, NULL, NULL),
(1038, 'user', 1036, 110, '2017-09-24 05:34:56', 0, NULL, NULL, NULL),
(1039, 'user', 1037, 110, '2017-09-24 05:34:56', 0, NULL, NULL, NULL),
(1040, 'user', 1038, 110, '2017-09-24 05:34:56', 0, NULL, NULL, NULL),
(1041, 'user', 1039, 111, '2017-09-24 05:37:18', 0, NULL, NULL, NULL),
(1042, 'user', 1040, 111, '2017-09-24 05:37:18', 0, NULL, NULL, NULL),
(1043, 'user', 1041, 111, '2017-09-24 05:37:18', 0, NULL, NULL, NULL),
(1044, 'user', 1042, 111, '2017-09-24 05:37:18', 0, NULL, NULL, NULL),
(1045, 'user', 1043, 111, '2017-09-24 05:37:18', 0, NULL, NULL, NULL),
(1046, 'user', 1044, 112, '2017-09-24 05:37:55', 0, NULL, NULL, NULL),
(1047, 'user', 1045, 112, '2017-09-24 05:37:55', 0, NULL, NULL, NULL),
(1048, 'user', 1046, 112, '2017-09-24 05:37:55', 0, NULL, NULL, NULL),
(1049, 'user', 1047, 112, '2017-09-24 05:37:55', 0, NULL, NULL, NULL),
(1050, 'user', 1048, 112, '2017-09-24 05:37:55', 0, NULL, NULL, NULL),
(1051, 'user', 1049, 112, '2017-09-24 05:37:55', 0, NULL, NULL, NULL),
(1052, 'user', 1050, 112, '2017-09-24 05:37:55', 0, NULL, NULL, NULL),
(1053, 'user', 1051, 112, '2017-09-24 05:37:55', 0, NULL, NULL, NULL),
(1054, 'user', 1052, 112, '2017-09-24 05:37:55', 0, NULL, NULL, NULL),
(1055, 'user', 1053, 112, '2017-09-24 05:37:55', 0, NULL, NULL, NULL),
(1056, 'user', 1054, 113, '2017-09-24 05:38:47', 0, NULL, NULL, NULL),
(1057, 'user', 1055, 114, '2017-09-24 05:39:27', 0, NULL, NULL, NULL),
(1058, 'user', 1056, 115, '2017-09-24 05:40:10', 0, NULL, NULL, NULL),
(1059, 'user', 1057, 115, '2017-09-24 05:40:10', 0, NULL, NULL, NULL),
(1060, 'user', 1058, 116, '2017-09-24 05:42:27', 0, NULL, NULL, NULL),
(1061, 'user', 1059, 116, '2017-09-24 05:42:27', 0, NULL, NULL, NULL),
(1062, 'user', 1060, 117, '2017-09-24 05:43:15', 0, NULL, NULL, NULL),
(1063, 'user', 1061, 117, '2017-09-24 05:43:15', 0, NULL, NULL, NULL),
(1064, 'user', 1062, 118, '2017-09-24 05:44:03', 0, NULL, NULL, NULL),
(1065, 'user', 1063, 118, '2017-09-24 05:44:03', 0, NULL, NULL, NULL),
(1066, 'user', 1064, 118, '2017-09-24 05:44:03', 0, NULL, NULL, NULL),
(1067, 'user', 1065, 118, '2017-09-24 05:44:03', 0, NULL, NULL, NULL),
(1068, 'user', 1066, 118, '2017-09-24 05:44:03', 0, NULL, NULL, NULL),
(1069, 'user', 1067, 118, '2017-09-24 05:44:03', 0, NULL, NULL, NULL),
(1070, 'user', 1068, 118, '2017-09-24 05:44:03', 0, NULL, NULL, NULL),
(1071, 'user', 1069, 118, '2017-09-24 05:44:03', 0, NULL, NULL, NULL),
(1072, 'user', 1070, 118, '2017-09-24 05:44:03', 0, NULL, NULL, NULL),
(1073, 'user', 1071, 118, '2017-09-24 05:44:03', 0, NULL, NULL, NULL),
(1074, 'user', 1072, 118, '2017-09-24 05:44:03', 0, NULL, NULL, NULL),
(1075, 'user', 1073, 118, '2017-09-24 05:44:03', 0, NULL, NULL, NULL),
(1076, 'user', 1074, 118, '2017-09-24 05:44:03', 0, NULL, NULL, NULL),
(1077, 'user', 1075, 118, '2017-09-24 05:44:03', 0, NULL, NULL, NULL),
(1078, 'user', 1076, 118, '2017-09-24 05:44:03', 0, NULL, NULL, NULL),
(1079, 'user', 1077, 118, '2017-09-24 05:44:03', 0, NULL, NULL, NULL),
(1080, 'user', 1078, 118, '2017-09-24 05:44:03', 0, NULL, NULL, NULL),
(1081, 'user', 1079, 118, '2017-09-24 05:44:03', 0, NULL, NULL, NULL),
(1082, 'user', 1080, 118, '2017-09-24 05:44:03', 0, NULL, NULL, NULL),
(1083, 'user', 1081, 118, '2017-09-24 05:44:03', 0, NULL, NULL, NULL),
(1084, 'user', 1082, 119, '2017-09-24 05:46:10', 0, NULL, NULL, NULL),
(1085, 'user', 1083, 119, '2017-09-24 05:46:10', 0, NULL, NULL, NULL),
(1086, 'user', 1084, 119, '2017-09-24 05:46:10', 0, NULL, NULL, NULL),
(1087, 'user', 1085, 119, '2017-09-24 05:46:10', 0, NULL, NULL, NULL),
(1088, 'user', 1086, 120, '2017-09-24 05:46:54', 0, NULL, NULL, NULL),
(1089, 'user', 1087, 120, '2017-09-24 05:46:54', 0, NULL, NULL, NULL),
(1090, 'user', 1088, 121, '2017-09-24 05:49:35', 0, NULL, NULL, NULL),
(1091, 'user', 1089, 121, '2017-09-24 05:49:35', 0, NULL, NULL, NULL),
(1092, 'user', 1090, 122, '2017-09-24 05:50:11', 0, NULL, NULL, NULL),
(1093, 'user', 1091, 123, '2017-09-24 05:51:00', 0, NULL, NULL, NULL),
(1094, 'user', 1092, 123, '2017-09-24 05:51:00', 0, NULL, NULL, NULL),
(1095, 'user', 1093, 123, '2017-09-24 05:51:00', 0, NULL, NULL, NULL),
(1096, 'user', 1094, 124, '2017-09-24 05:51:42', 0, NULL, NULL, NULL),
(1097, 'user', 1095, 125, '2017-09-24 05:52:22', 0, NULL, NULL, NULL),
(1098, 'user', 1096, 125, '2017-09-24 05:52:22', 0, NULL, NULL, NULL),
(1099, 'user', 1097, 126, '2017-09-24 05:53:19', 0, NULL, NULL, NULL),
(1100, 'user', 1098, 127, '2017-09-24 05:55:42', 0, NULL, NULL, NULL),
(1101, 'user', 1099, 127, '2017-09-24 05:55:42', 0, NULL, NULL, NULL),
(1102, 'user', 1100, 127, '2017-09-24 05:55:42', 0, NULL, NULL, NULL),
(1103, 'user', 1101, 127, '2017-09-24 05:55:42', 0, NULL, NULL, NULL),
(1104, 'user', 1102, 127, '2017-09-24 05:55:42', 0, NULL, NULL, NULL),
(1105, 'user', 1103, 127, '2017-09-24 05:55:42', 0, NULL, NULL, NULL),
(1106, 'user', 1104, 127, '2017-09-24 05:55:42', 0, NULL, NULL, NULL),
(1107, 'user', 1105, 127, '2017-09-24 05:55:42', 0, NULL, NULL, NULL),
(1108, 'user', 1106, 127, '2017-09-24 05:55:42', 0, NULL, NULL, NULL),
(1109, 'user', 1107, 127, '2017-09-24 05:55:42', 0, NULL, NULL, NULL),
(1110, 'user', 1108, 127, '2017-09-24 05:55:42', 0, NULL, NULL, NULL),
(1111, 'user', 1109, 127, '2017-09-24 05:55:42', 0, NULL, NULL, NULL),
(1112, 'user', 1110, 127, '2017-09-24 05:55:43', 0, NULL, NULL, NULL),
(1113, 'user', 1111, 127, '2017-09-24 05:55:43', 0, NULL, NULL, NULL),
(1114, 'user', 1112, 127, '2017-09-24 05:55:43', 0, NULL, NULL, NULL),
(1115, 'user', 1113, 127, '2017-09-24 05:55:43', 0, NULL, NULL, NULL),
(1116, 'user', 1114, 127, '2017-09-24 05:55:43', 0, NULL, NULL, NULL),
(1117, 'user', 1115, 127, '2017-09-24 05:55:43', 0, NULL, NULL, NULL),
(1118, 'user', 1116, 127, '2017-09-24 05:55:43', 0, NULL, NULL, NULL),
(1119, 'user', 1117, 127, '2017-09-24 05:55:43', 0, NULL, NULL, NULL),
(1120, 'user', 1118, 127, '2017-09-24 05:55:43', 0, NULL, NULL, NULL),
(1121, 'user', 1119, 127, '2017-09-24 05:55:43', 0, NULL, NULL, NULL),
(1122, 'user', 1120, 128, '2017-09-24 06:00:28', 0, NULL, NULL, NULL),
(1123, 'user', 1121, 129, '2017-09-24 06:01:11', 0, NULL, NULL, NULL),
(1124, 'user', 1122, 129, '2017-09-24 06:01:11', 0, NULL, NULL, NULL),
(1125, 'user', 1123, 129, '2017-09-24 06:01:11', 0, NULL, NULL, NULL),
(1126, 'user', 1124, 130, '2017-09-24 06:07:32', 0, NULL, NULL, NULL),
(1127, 'user', 1125, 130, '2017-09-24 06:07:32', 0, NULL, NULL, NULL),
(1128, 'user', 1126, 130, '2017-09-24 06:07:32', 0, NULL, NULL, NULL),
(1129, 'user', 1127, 130, '2017-09-24 06:07:32', 0, NULL, NULL, NULL),
(1130, 'user', 1128, 130, '2017-09-24 06:07:32', 0, NULL, NULL, NULL),
(1131, 'user', 1129, 130, '2017-09-24 06:07:32', 0, NULL, NULL, NULL),
(1132, 'user', 1130, 130, '2017-09-24 06:07:32', 0, NULL, NULL, NULL),
(1133, 'user', 1131, 130, '2017-09-24 06:07:32', 0, NULL, NULL, NULL),
(1134, 'user', 1132, 130, '2017-09-24 06:07:32', 0, NULL, NULL, NULL),
(1135, 'user', 1133, 130, '2017-09-24 06:07:32', 0, NULL, NULL, NULL),
(1136, 'user', 1134, 130, '2017-09-24 06:07:32', 0, NULL, NULL, NULL),
(1137, 'user', 1135, 131, '2017-09-24 06:09:13', 0, NULL, NULL, NULL),
(1138, 'user', 1136, 131, '2017-09-24 06:09:13', 0, NULL, NULL, NULL),
(1139, 'user', 1137, 131, '2017-09-24 06:09:13', 0, NULL, NULL, NULL),
(1140, 'user', 1138, 131, '2017-09-24 06:09:13', 0, NULL, NULL, NULL),
(1141, 'user', 1139, 131, '2017-09-24 06:09:13', 0, NULL, NULL, NULL),
(1142, 'user', 1140, 131, '2017-09-24 06:09:13', 0, NULL, NULL, NULL),
(1143, 'user', 1141, 131, '2017-09-24 06:09:13', 0, NULL, NULL, NULL),
(1144, 'user', 1142, 131, '2017-09-24 06:09:13', 0, NULL, NULL, NULL),
(1145, 'user', 1143, 132, '2017-09-24 06:11:06', 0, NULL, NULL, NULL),
(1146, 'user', 1144, 132, '2017-09-24 06:11:06', 0, NULL, NULL, NULL),
(1147, 'user', 1145, 132, '2017-09-24 06:11:06', 0, NULL, NULL, NULL),
(1148, 'user', 1146, 132, '2017-09-24 06:11:06', 0, NULL, NULL, NULL),
(1149, 'user', 1147, 132, '2017-09-24 06:11:06', 0, NULL, NULL, NULL),
(1150, 'user', 1148, 132, '2017-09-24 06:11:06', 0, NULL, NULL, NULL),
(1151, 'user', 1149, 132, '2017-09-24 06:11:06', 0, NULL, NULL, NULL),
(1152, 'user', 1150, 132, '2017-09-24 06:11:06', 0, NULL, NULL, NULL),
(1153, 'user', 1151, 133, '2017-09-24 06:11:46', 0, NULL, NULL, NULL),
(1154, 'user', 1152, 134, '2017-09-24 06:12:23', 0, NULL, NULL, NULL),
(1155, 'user', 1153, 134, '2017-09-24 06:12:23', 0, NULL, NULL, NULL),
(1156, 'user', 1154, 134, '2017-09-24 06:12:23', 0, NULL, NULL, NULL),
(1157, 'user', 1155, 134, '2017-09-24 06:12:23', 0, NULL, NULL, NULL),
(1158, 'user', 1156, 134, '2017-09-24 06:12:23', 0, NULL, NULL, NULL),
(1159, 'user', 1157, 134, '2017-09-24 06:12:23', 0, NULL, NULL, NULL),
(1160, 'user', 1158, 134, '2017-09-24 06:12:23', 0, NULL, NULL, NULL),
(1161, 'user', 1159, 134, '2017-09-24 06:12:23', 0, NULL, NULL, NULL),
(1162, 'user', 1160, 134, '2017-09-24 06:12:23', 0, NULL, NULL, NULL),
(1163, 'user', 1161, 134, '2017-09-24 06:12:23', 0, NULL, NULL, NULL),
(1164, 'user', 1162, 134, '2017-09-24 06:12:23', 0, NULL, NULL, NULL),
(1165, 'user', 1163, 134, '2017-09-24 06:12:23', 0, NULL, NULL, NULL),
(1166, 'user', 1164, 134, '2017-09-24 06:12:23', 0, NULL, NULL, NULL),
(1167, 'user', 1165, 134, '2017-09-24 06:12:23', 0, NULL, NULL, NULL),
(1168, 'user', 1166, 134, '2017-09-24 06:12:23', 0, NULL, NULL, NULL),
(1169, 'user', 1167, 135, '2017-09-24 06:12:59', 0, NULL, NULL, NULL),
(1170, 'user', 1168, 135, '2017-09-24 06:12:59', 0, NULL, NULL, NULL),
(1171, 'user', 1169, 135, '2017-09-24 06:12:59', 0, NULL, NULL, NULL),
(1172, 'user', 1170, 135, '2017-09-24 06:12:59', 0, NULL, NULL, NULL),
(1173, 'user', 1171, 135, '2017-09-24 06:12:59', 0, NULL, NULL, NULL),
(1174, 'user', 1172, 135, '2017-09-24 06:12:59', 0, NULL, NULL, NULL),
(1175, 'user', 1173, 136, '2017-09-24 06:13:46', 0, NULL, NULL, NULL),
(1176, 'user', 1174, 136, '2017-09-24 06:13:46', 0, NULL, NULL, NULL),
(1177, 'user', 1175, 136, '2017-09-24 06:13:46', 0, NULL, NULL, NULL),
(1178, 'user', 1176, 136, '2017-09-24 06:13:46', 0, NULL, NULL, NULL),
(1179, 'user', 1177, 136, '2017-09-24 06:13:46', 0, NULL, NULL, NULL),
(1180, 'user', 1178, 136, '2017-09-24 06:13:46', 0, NULL, NULL, NULL),
(1181, 'user', 1179, 136, '2017-09-24 06:13:46', 0, NULL, NULL, NULL),
(1182, 'user', 1180, 136, '2017-09-24 06:13:46', 0, NULL, NULL, NULL),
(1183, 'user', 1181, 136, '2017-09-24 06:13:46', 0, NULL, NULL, NULL),
(1184, 'user', 1182, 136, '2017-09-24 06:13:46', 0, NULL, NULL, NULL),
(1185, 'user', 1183, 137, '2017-09-24 06:14:32', 0, NULL, NULL, NULL),
(1186, 'user', 1184, 138, '2017-09-24 06:15:15', 0, NULL, NULL, NULL),
(1187, 'user', 1185, 138, '2017-09-24 06:15:15', 0, NULL, NULL, NULL),
(1188, 'user', 1186, 138, '2017-09-24 06:15:15', 0, NULL, NULL, NULL),
(1189, 'user', 1187, 139, '2017-09-24 06:15:57', 0, NULL, NULL, NULL),
(1190, 'user', 1188, 139, '2017-09-24 06:15:57', 0, NULL, NULL, NULL),
(1191, 'user', 1189, 139, '2017-09-24 06:15:57', 0, NULL, NULL, NULL),
(1192, 'user', 1190, 139, '2017-09-24 06:15:57', 0, NULL, NULL, NULL),
(1193, 'user', 1191, 139, '2017-09-24 06:15:57', 0, NULL, NULL, NULL),
(1194, 'user', 1192, 139, '2017-09-24 06:15:57', 0, NULL, NULL, NULL),
(1195, 'user', 1193, 139, '2017-09-24 06:15:57', 0, NULL, NULL, NULL),
(1196, 'user', 1194, 139, '2017-09-24 06:15:57', 0, NULL, NULL, NULL),
(1197, 'user', 1195, 139, '2017-09-24 06:15:57', 0, NULL, NULL, NULL),
(1198, 'user', 1196, 139, '2017-09-24 06:15:57', 0, NULL, NULL, NULL),
(1199, 'user', 1197, 139, '2017-09-24 06:15:58', 0, NULL, NULL, NULL),
(1200, 'user', 1198, 139, '2017-09-24 06:15:58', 0, NULL, NULL, NULL),
(1201, 'user', 1199, 140, '2017-09-26 19:14:23', 0, NULL, NULL, NULL),
(1202, 'user', 1200, 140, '2017-09-26 19:14:23', 0, NULL, NULL, NULL),
(1203, 'user', 1201, 140, '2017-09-26 19:14:24', 0, NULL, NULL, NULL),
(1204, 'user', 1202, 140, '2017-09-26 19:14:24', 0, NULL, NULL, NULL),
(1205, 'user', 1203, 140, '2017-09-26 19:14:24', 0, NULL, NULL, NULL),
(1206, 'user', 1204, 140, '2017-09-26 19:14:24', 0, NULL, NULL, NULL),
(1207, 'user', 1205, 140, '2017-09-26 19:14:24', 0, NULL, NULL, NULL),
(1208, 'user', 1206, 140, '2017-09-26 19:14:24', 0, NULL, NULL, NULL),
(1209, 'user', 1207, 140, '2017-09-26 19:14:24', 0, NULL, NULL, NULL),
(1210, 'user', 1208, 140, '2017-09-26 19:14:24', 0, NULL, NULL, NULL),
(1211, 'user', 1209, 140, '2017-09-26 19:14:24', 0, NULL, NULL, NULL),
(1212, 'user', 1210, 140, '2017-09-26 19:14:24', 0, NULL, NULL, NULL),
(1213, 'user', 1211, 140, '2017-09-26 19:14:24', 0, NULL, NULL, NULL),
(1214, 'user', 1212, 140, '2017-09-26 19:14:24', 0, NULL, NULL, NULL),
(1215, 'user', 1213, 140, '2017-09-26 19:14:24', 0, NULL, NULL, NULL),
(1216, 'user', 1214, 140, '2017-09-26 19:14:24', 0, NULL, NULL, NULL),
(1217, 'user', 1215, 140, '2017-09-26 19:14:24', 0, NULL, NULL, NULL),
(1218, 'user', 1216, 140, '2017-09-26 19:14:24', 0, NULL, NULL, NULL),
(1219, 'user', 1217, 140, '2017-09-26 19:14:24', 0, NULL, NULL, NULL),
(1220, 'user', 1218, 140, '2017-09-26 19:14:24', 0, NULL, NULL, NULL),
(1221, 'user', 1219, 140, '2017-09-26 19:14:24', 0, NULL, NULL, NULL),
(1222, 'user', 1220, 140, '2017-09-26 19:14:24', 0, NULL, NULL, NULL),
(1223, 'user', 1221, 140, '2017-09-26 19:14:24', 0, NULL, NULL, NULL),
(1224, 'user', 1222, 140, '2017-09-26 19:14:24', 0, NULL, NULL, NULL),
(1225, 'user', 1223, 140, '2017-09-26 19:14:24', 0, NULL, NULL, NULL),
(1226, 'user', 1224, 140, '2017-09-26 19:14:24', 0, NULL, NULL, NULL),
(1227, 'user', 1225, 140, '2017-09-26 19:14:24', 0, NULL, NULL, NULL),
(1228, 'user', 1226, 140, '2017-09-26 19:14:24', 0, NULL, NULL, NULL),
(1229, 'user', 1227, 140, '2017-09-26 19:14:24', 0, NULL, NULL, NULL),
(1230, 'user', 1228, 141, '2017-09-26 19:19:56', 0, NULL, NULL, NULL),
(1231, 'user', 1229, 141, '2017-09-26 19:19:56', 0, NULL, NULL, NULL),
(1232, 'user', 1230, 142, '2017-09-26 19:21:47', 0, NULL, NULL, NULL),
(1233, 'user', 1231, 142, '2017-09-26 19:21:47', 0, NULL, NULL, NULL),
(1234, 'user', 1232, 142, '2017-09-26 19:21:47', 0, NULL, NULL, NULL),
(1235, 'user', 1233, 142, '2017-09-26 19:21:47', 0, NULL, NULL, NULL),
(1236, 'user', 1234, 142, '2017-09-26 19:21:47', 0, NULL, NULL, NULL),
(1237, 'user', 1235, 142, '2017-09-26 19:21:47', 0, NULL, NULL, NULL),
(1238, 'user', 1236, 142, '2017-09-26 19:21:47', 0, NULL, NULL, NULL),
(1239, 'user', 1237, 142, '2017-09-26 19:21:47', 0, NULL, NULL, NULL),
(1240, 'user', 1238, 142, '2017-09-26 19:21:47', 0, NULL, NULL, NULL),
(1241, 'user', 1239, 142, '2017-09-26 19:21:47', 0, NULL, NULL, NULL),
(1242, 'user', 1240, 142, '2017-09-26 19:21:47', 0, NULL, NULL, NULL),
(1243, 'user', 1241, 142, '2017-09-26 19:21:47', 0, NULL, NULL, NULL),
(1244, 'user', 1242, 142, '2017-09-26 19:21:47', 0, NULL, NULL, NULL),
(1245, 'user', 1243, 142, '2017-09-26 19:21:47', 0, NULL, NULL, NULL),
(1246, 'user', 1244, 142, '2017-09-26 19:21:47', 0, NULL, NULL, NULL),
(1247, 'user', 1245, 142, '2017-09-26 19:21:47', 0, NULL, NULL, NULL),
(1248, 'user', 1246, 143, '2017-09-26 19:22:53', 0, NULL, NULL, NULL),
(1249, 'user', 1247, 143, '2017-09-26 19:22:53', 0, NULL, NULL, NULL),
(1250, 'user', 1248, 143, '2017-09-26 19:22:53', 0, NULL, NULL, NULL),
(1251, 'user', 1249, 143, '2017-09-26 19:22:53', 0, NULL, NULL, NULL),
(1252, 'user', 1250, 144, '2017-09-26 19:25:01', 0, NULL, NULL, NULL),
(1253, 'user', 1251, 144, '2017-09-26 19:25:01', 0, NULL, NULL, NULL),
(1254, 'user', 1252, 144, '2017-09-26 19:25:02', 0, NULL, NULL, NULL),
(1255, 'user', 1253, 144, '2017-09-26 19:25:02', 0, NULL, NULL, NULL),
(1256, 'user', 1254, 144, '2017-09-26 19:25:02', 0, NULL, NULL, NULL),
(1257, 'user', 1255, 145, '2017-09-26 19:27:48', 0, NULL, NULL, NULL),
(1258, 'user', 1256, 145, '2017-09-26 19:27:48', 0, NULL, NULL, NULL),
(1259, 'user', 1257, 145, '2017-09-26 19:27:48', 0, NULL, NULL, NULL),
(1260, 'user', 1258, 145, '2017-09-26 19:27:48', 0, NULL, NULL, NULL),
(1264, 'user', 1262, 146, '2017-09-26 19:49:26', 0, NULL, NULL, NULL),
(1265, 'user', 1263, 146, '2017-09-26 19:49:26', 0, NULL, NULL, NULL),
(1266, 'user', 1264, 146, '2017-09-26 19:49:27', 0, NULL, NULL, NULL),
(1267, 'user', 1265, 147, '2017-09-26 19:55:09', 0, NULL, NULL, NULL),
(1268, 'user', 1266, 147, '2017-09-26 19:55:09', 0, NULL, NULL, NULL),
(1269, 'user', 1267, 147, '2017-09-26 19:55:09', 0, NULL, NULL, NULL),
(1270, 'user', 1268, 147, '2017-09-26 19:55:09', 0, NULL, NULL, NULL),
(1271, 'user', 1269, 147, '2017-09-26 19:55:09', 0, NULL, NULL, NULL),
(1272, 'user', 1270, 147, '2017-09-26 19:55:09', 0, NULL, NULL, NULL),
(1273, 'user', 1271, 147, '2017-09-26 19:55:09', 0, NULL, NULL, NULL),
(1274, 'user', 1272, 147, '2017-09-26 19:55:09', 0, NULL, NULL, NULL),
(1275, 'user', 1273, 147, '2017-09-26 19:55:09', 0, NULL, NULL, NULL),
(1276, 'user', 1274, 147, '2017-09-26 19:55:09', 0, NULL, NULL, NULL),
(1277, 'user', 1275, 147, '2017-09-26 19:55:09', 0, NULL, NULL, NULL),
(1278, 'user', 1276, 147, '2017-09-26 19:55:09', 0, NULL, NULL, NULL),
(1279, 'user', 1277, 147, '2017-09-26 19:55:09', 0, NULL, NULL, NULL),
(1280, 'user', 1278, 147, '2017-09-26 19:55:09', 0, NULL, NULL, NULL),
(1281, 'user', 1279, 147, '2017-09-26 19:55:09', 0, NULL, NULL, NULL),
(1282, 'user', 1280, 148, '2017-09-26 20:02:02', 0, NULL, NULL, NULL),
(1283, 'user', 1281, 148, '2017-09-26 20:02:02', 0, NULL, NULL, NULL),
(1284, 'user', 1282, 148, '2017-09-26 20:02:02', 0, NULL, NULL, NULL),
(1285, 'user', 1283, 148, '2017-09-26 20:02:02', 0, NULL, NULL, NULL),
(1286, 'user', 1284, 142, '2017-09-26 20:04:55', 0, NULL, NULL, NULL),
(1287, 'user', 1285, 149, '2017-09-26 20:06:22', 0, NULL, NULL, NULL),
(1288, 'user', 1286, 150, '2017-09-26 20:06:51', 0, NULL, NULL, NULL),
(1289, 'user', 1287, 151, '2017-09-26 20:07:41', 0, NULL, NULL, NULL),
(1290, 'user', 1288, 151, '2017-09-26 20:07:41', 0, NULL, NULL, NULL),
(1291, 'user', 1289, 151, '2017-09-26 20:07:41', 0, NULL, NULL, NULL),
(1292, 'user', 1290, 151, '2017-09-26 20:07:41', 0, NULL, NULL, NULL),
(1293, 'user', 1291, 152, '2017-09-26 20:08:31', 0, NULL, NULL, NULL),
(1294, 'user', 1292, 153, '2017-09-26 20:08:39', 0, NULL, NULL, NULL),
(1295, 'user', 1293, 153, '2017-09-26 20:08:39', 0, NULL, NULL, NULL),
(1296, 'user', 1294, 153, '2017-09-26 20:08:39', 0, NULL, NULL, NULL),
(1297, 'user', 1295, 153, '2017-09-26 20:08:39', 0, NULL, NULL, NULL),
(1298, 'user', 1296, 154, '2017-09-26 20:09:18', 0, NULL, NULL, NULL),
(1299, 'user', 1297, 154, '2017-09-26 20:09:18', 0, NULL, NULL, NULL),
(1300, 'user', 1298, 154, '2017-09-26 20:09:18', 0, NULL, NULL, NULL),
(1301, 'user', 1299, 155, '2017-09-26 20:10:48', 0, NULL, NULL, NULL),
(1302, 'user', 1300, 156, '2017-09-26 20:10:53', 0, NULL, NULL, NULL),
(1303, 'user', 1301, 156, '2017-09-26 20:10:53', 0, NULL, NULL, NULL),
(1304, 'user', 1302, 156, '2017-09-26 20:10:53', 0, NULL, NULL, NULL),
(1305, 'user', 1303, 156, '2017-09-26 20:10:53', 0, NULL, NULL, NULL),
(1306, 'user', 1304, 156, '2017-09-26 20:10:53', 0, NULL, NULL, NULL),
(1307, 'user', 1305, 156, '2017-09-26 20:10:53', 0, NULL, NULL, NULL),
(1308, 'user', 1306, 156, '2017-09-26 20:10:53', 0, NULL, NULL, NULL),
(1309, 'user', 1307, 156, '2017-09-26 20:10:53', 0, NULL, NULL, NULL),
(1310, 'user', 1308, 156, '2017-09-26 20:10:53', 0, NULL, NULL, NULL),
(1311, 'user', 1309, 156, '2017-09-26 20:10:53', 0, NULL, NULL, NULL),
(1312, 'user', 1310, 156, '2017-09-26 20:10:53', 0, NULL, NULL, NULL),
(1313, 'user', 1311, 156, '2017-09-26 20:10:53', 0, NULL, NULL, NULL),
(1314, 'user', 1312, 157, '2017-09-26 20:37:54', 0, NULL, NULL, NULL),
(1315, 'user', 1313, 158, '2017-09-26 20:39:23', 0, NULL, NULL, NULL),
(1316, 'user', 1314, 158, '2017-09-26 20:39:23', 0, NULL, NULL, NULL),
(1317, 'user', 1315, 158, '2017-09-26 20:39:23', 0, NULL, NULL, NULL),
(1318, 'user', 1316, 159, '2017-09-26 20:39:45', 0, NULL, NULL, NULL),
(1319, 'user', 1317, 159, '2017-09-26 20:39:45', 0, NULL, NULL, NULL),
(1320, 'user', 1318, 159, '2017-09-26 20:39:45', 0, NULL, NULL, NULL),
(1321, 'user', 1319, 159, '2017-09-26 20:39:45', 0, NULL, NULL, NULL),
(1322, 'user', 1320, 159, '2017-09-26 20:39:45', 0, NULL, NULL, NULL),
(1323, 'user', 1321, 159, '2017-09-26 20:39:45', 0, NULL, NULL, NULL),
(1324, 'user', 1322, 159, '2017-09-26 20:39:45', 0, NULL, NULL, NULL),
(1325, 'user', 1323, 159, '2017-09-26 20:39:45', 0, NULL, NULL, NULL),
(1326, 'user', 1324, 159, '2017-09-26 20:39:45', 0, NULL, NULL, NULL),
(1327, 'user', 1325, 159, '2017-09-26 20:39:45', 0, NULL, NULL, NULL),
(1328, 'user', 1326, 159, '2017-09-26 20:39:45', 0, NULL, NULL, NULL),
(1329, 'user', 1327, 159, '2017-09-26 20:39:45', 0, NULL, NULL, NULL),
(1330, 'user', 1328, 159, '2017-09-26 20:39:45', 0, NULL, NULL, NULL),
(1331, 'user', 1329, 159, '2017-09-26 20:39:45', 0, NULL, NULL, NULL),
(1332, 'user', 1330, 160, '2017-09-26 20:44:32', 0, NULL, NULL, NULL),
(1333, 'user', 1331, 161, '2017-09-26 20:44:35', 0, NULL, NULL, NULL),
(1334, 'user', 1332, 161, '2017-09-26 20:44:35', 0, NULL, NULL, NULL),
(1335, 'user', 1333, 161, '2017-09-26 20:44:35', 0, NULL, NULL, NULL),
(1336, 'user', 1334, 162, '2017-09-26 20:54:48', 0, NULL, NULL, NULL),
(1337, 'user', 1335, 162, '2017-09-26 20:54:48', 0, NULL, NULL, NULL),
(1338, 'user', 1336, 162, '2017-09-26 20:54:49', 0, NULL, NULL, NULL),
(1339, 'user', 1337, 162, '2017-09-26 20:54:49', 0, NULL, NULL, NULL),
(1340, 'user', 1338, 162, '2017-09-26 20:54:49', 0, NULL, NULL, NULL),
(1341, 'user', 1339, 163, '2017-09-26 21:04:38', 0, NULL, NULL, NULL),
(1342, 'user', 1340, 163, '2017-09-26 21:04:38', 0, NULL, NULL, NULL),
(1343, 'user', 1341, 163, '2017-09-26 21:04:38', 0, NULL, NULL, NULL),
(1344, 'user', 1342, 163, '2017-09-26 21:04:38', 0, NULL, NULL, NULL),
(1345, 'user', 1343, 163, '2017-09-26 21:04:38', 0, NULL, NULL, NULL),
(1346, 'user', 1344, 163, '2017-09-26 21:04:38', 0, NULL, NULL, NULL),
(1347, 'user', 1345, 163, '2017-09-26 21:04:38', 0, NULL, NULL, NULL),
(1348, 'user', 1346, 163, '2017-09-26 21:04:38', 0, NULL, NULL, NULL),
(1349, 'user', 1347, 163, '2017-09-26 21:04:38', 0, NULL, NULL, NULL),
(1350, 'user', 1348, 163, '2017-09-26 21:04:38', 0, NULL, NULL, NULL),
(1351, 'user', 1349, 163, '2017-09-26 21:04:38', 0, NULL, NULL, NULL),
(1352, 'user', 1350, 163, '2017-09-26 21:04:38', 0, NULL, NULL, NULL),
(1353, 'user', 1351, 163, '2017-09-26 21:04:38', 0, NULL, NULL, NULL),
(1354, 'user', 1352, 164, '2017-09-26 21:12:16', 0, NULL, NULL, NULL),
(1355, 'user', 1353, 164, '2017-09-26 21:12:16', 0, NULL, NULL, NULL),
(1356, 'user', 1354, 164, '2017-09-26 21:12:16', 0, NULL, NULL, NULL),
(1357, 'user', 1355, 164, '2017-09-26 21:12:16', 0, NULL, NULL, NULL),
(1358, 'user', 1356, 164, '2017-09-26 21:12:16', 0, NULL, NULL, NULL),
(1359, 'user', 1357, 164, '2017-09-26 21:12:16', 0, NULL, NULL, NULL),
(1360, 'user', 1358, 164, '2017-09-26 21:12:16', 0, NULL, NULL, NULL),
(1361, 'user', 1359, 164, '2017-09-26 21:12:16', 0, NULL, NULL, NULL),
(1362, 'user', 1360, 164, '2017-09-26 21:12:16', 0, NULL, NULL, NULL),
(1363, 'user', 1361, 164, '2017-09-26 21:12:16', 0, NULL, NULL, NULL),
(1364, 'user', 1362, 164, '2017-09-26 21:12:16', 0, NULL, NULL, NULL),
(1365, 'user', 1363, 164, '2017-09-26 21:12:16', 0, NULL, NULL, NULL),
(1366, 'user', 1364, 164, '2017-09-26 21:12:16', 0, NULL, NULL, NULL),
(1367, 'user', 1365, 164, '2017-09-26 21:12:16', 0, NULL, NULL, NULL),
(1368, 'user', 1366, 164, '2017-09-26 21:12:16', 0, NULL, NULL, NULL),
(1369, 'user', 1367, 164, '2017-09-26 21:12:16', 0, NULL, NULL, NULL),
(1370, 'user', 1368, 164, '2017-09-26 21:12:16', 0, NULL, NULL, NULL),
(1371, 'user', 1369, 164, '2017-09-26 21:12:16', 0, NULL, NULL, NULL),
(1372, 'user', 1370, 164, '2017-09-26 21:12:16', 0, NULL, NULL, NULL),
(1373, 'user', 1371, 164, '2017-09-26 21:12:16', 0, NULL, NULL, NULL),
(1374, 'user', 1372, 164, '2017-09-26 21:12:16', 0, NULL, NULL, NULL),
(1375, 'user', 1373, 164, '2017-09-26 21:12:16', 0, NULL, NULL, NULL),
(1376, 'user', 1374, 164, '2017-09-26 21:12:16', 0, NULL, NULL, NULL),
(1377, 'user', 1375, 164, '2017-09-26 21:12:16', 0, NULL, NULL, NULL),
(1378, 'user', 1376, 164, '2017-09-26 21:12:16', 0, NULL, NULL, NULL),
(1379, 'user', 1377, 164, '2017-09-26 21:12:16', 0, NULL, NULL, NULL),
(1380, 'user', 1378, 164, '2017-09-26 21:12:16', 0, NULL, NULL, NULL),
(1381, 'user', 1379, 165, '2017-09-26 21:28:50', 0, NULL, NULL, NULL),
(1382, 'user', 1380, 165, '2017-09-26 21:28:50', 0, NULL, NULL, NULL),
(1383, 'user', 1381, 165, '2017-09-26 21:28:50', 0, NULL, NULL, NULL),
(1384, 'user', 1382, 165, '2017-09-26 21:28:50', 0, NULL, NULL, NULL),
(1385, 'user', 1383, 165, '2017-09-26 21:28:50', 0, NULL, NULL, NULL),
(1386, 'user', 1384, 165, '2017-09-26 21:28:50', 0, NULL, NULL, NULL),
(1387, 'user', 1385, 165, '2017-09-26 21:28:50', 0, NULL, NULL, NULL),
(1388, 'user', 1386, 165, '2017-09-26 21:28:50', 0, NULL, NULL, NULL),
(1389, 'user', 1387, 165, '2017-09-26 21:28:50', 0, NULL, NULL, NULL),
(1390, 'user', 1388, 165, '2017-09-26 21:28:50', 0, NULL, NULL, NULL),
(1391, 'user', 1389, 165, '2017-09-26 21:28:50', 0, NULL, NULL, NULL),
(1392, 'user', 1390, 165, '2017-09-26 21:28:50', 0, NULL, NULL, NULL),
(1393, 'user', 1391, 165, '2017-09-26 21:28:50', 0, NULL, NULL, NULL),
(1394, 'user', 1392, 165, '2017-09-26 21:28:50', 0, NULL, NULL, NULL),
(1395, 'user', 1393, 165, '2017-09-26 21:28:50', 0, NULL, NULL, NULL),
(1396, 'user', 1394, 165, '2017-09-26 21:28:50', 0, NULL, NULL, NULL),
(1397, 'user', 1395, 165, '2017-09-26 21:28:50', 0, NULL, NULL, NULL),
(1398, 'user', 1396, 165, '2017-09-26 21:28:50', 0, NULL, NULL, NULL),
(1399, 'user', 1397, 165, '2017-09-26 21:28:50', 0, NULL, NULL, NULL),
(1400, 'user', 1398, 165, '2017-09-26 21:28:50', 0, NULL, NULL, NULL),
(1401, 'user', 1399, 165, '2017-09-26 21:28:50', 0, NULL, NULL, NULL),
(1402, 'user', 1400, 165, '2017-09-26 21:28:50', 0, NULL, NULL, NULL),
(1403, 'user', 1401, 165, '2017-09-26 21:28:50', 0, NULL, NULL, NULL),
(1404, 'user', 1402, 165, '2017-09-26 21:28:50', 0, NULL, NULL, NULL),
(1405, 'user', 1403, 165, '2017-09-26 21:28:50', 0, NULL, NULL, NULL),
(1406, 'user', 1404, 165, '2017-09-26 21:28:50', 0, NULL, NULL, NULL),
(1407, 'user', 1405, 165, '2017-09-26 21:28:50', 0, NULL, NULL, NULL),
(1408, 'user', 1406, 165, '2017-09-26 21:28:50', 0, NULL, NULL, NULL),
(1409, 'user', 1407, 165, '2017-09-26 21:28:50', 0, NULL, NULL, NULL),
(1410, 'user', 1408, 166, '2017-09-26 21:47:35', 0, NULL, NULL, NULL),
(1411, 'user', 1409, 166, '2017-09-26 21:47:35', 0, NULL, NULL, NULL),
(1412, 'user', 1410, 166, '2017-09-26 21:47:35', 0, NULL, NULL, NULL),
(1413, 'user', 1411, 166, '2017-09-26 21:47:35', 0, NULL, NULL, NULL),
(1414, 'user', 1412, 166, '2017-09-26 21:47:35', 0, NULL, NULL, NULL),
(1415, 'user', 1413, 167, '2017-09-26 21:52:35', 0, NULL, NULL, NULL),
(1416, 'user', 1414, 167, '2017-09-26 21:52:35', 0, NULL, NULL, NULL),
(1417, 'user', 1415, 167, '2017-09-26 21:52:35', 0, NULL, NULL, NULL),
(1418, 'user', 1416, 167, '2017-09-26 21:52:35', 0, NULL, NULL, NULL),
(1419, 'user', 1417, 167, '2017-09-26 21:52:35', 0, NULL, NULL, NULL),
(1420, 'user', 1418, 167, '2017-09-26 21:52:35', 0, NULL, NULL, NULL),
(1421, 'user', 1419, 167, '2017-09-26 21:52:35', 0, NULL, NULL, NULL),
(1422, 'user', 1420, 167, '2017-09-26 21:52:35', 0, NULL, NULL, NULL),
(1423, 'user', 1421, 167, '2017-09-26 21:52:35', 0, NULL, NULL, NULL),
(1424, 'user', 1422, 167, '2017-09-26 21:52:35', 0, NULL, NULL, NULL),
(1425, 'user', 1423, 167, '2017-09-26 21:52:35', 0, NULL, NULL, NULL),
(1426, 'user', 1424, 167, '2017-09-26 21:52:35', 0, NULL, NULL, NULL),
(1427, 'user', 1425, 167, '2017-09-26 21:52:35', 0, NULL, NULL, NULL),
(1428, 'user', 1426, 167, '2017-09-26 21:52:35', 0, NULL, NULL, NULL),
(1429, 'user', 1427, 167, '2017-09-26 21:52:35', 0, NULL, NULL, NULL),
(1430, 'user', 1428, 167, '2017-09-26 21:52:35', 0, NULL, NULL, NULL),
(1431, 'user', 1429, 167, '2017-09-26 21:52:35', 0, NULL, NULL, NULL),
(1432, 'user', 1430, 167, '2017-09-26 21:52:35', 0, NULL, NULL, NULL),
(1433, 'user', 1431, 167, '2017-09-26 21:52:35', 0, NULL, NULL, NULL),
(1434, 'user', 1432, 167, '2017-09-26 21:52:35', 0, NULL, NULL, NULL),
(1435, 'user', 1433, 167, '2017-09-26 21:52:35', 0, NULL, NULL, NULL),
(1436, 'user', 1434, 167, '2017-09-26 21:52:35', 0, NULL, NULL, NULL),
(1437, 'user', 1435, 167, '2017-09-26 21:52:35', 0, NULL, NULL, NULL),
(1438, 'user', 1436, 164, '2017-09-26 21:53:12', 0, NULL, NULL, NULL),
(1439, 'user', 1437, 73, '2017-09-26 21:54:00', 0, NULL, NULL, NULL),
(1440, 'user', 1438, 73, '2017-09-26 21:54:01', 0, NULL, NULL, NULL),
(1441, 'user', 1439, 73, '2017-09-26 21:54:01', 0, NULL, NULL, NULL),
(1442, 'user', 1440, 73, '2017-09-26 21:54:01', 0, NULL, NULL, NULL),
(1443, 'user', 1441, 73, '2017-09-26 21:54:01', 0, NULL, NULL, NULL),
(1444, 'user', 1442, 73, '2017-09-26 21:54:01', 0, NULL, NULL, NULL),
(1445, 'user', 1443, 73, '2017-09-26 21:54:01', 0, NULL, NULL, NULL),
(1446, 'user', 1444, 73, '2017-09-26 21:54:01', 0, NULL, NULL, NULL),
(1447, 'user', 1445, 73, '2017-09-26 21:54:01', 0, NULL, NULL, NULL),
(1448, 'user', 1446, 73, '2017-09-26 21:54:01', 0, NULL, NULL, NULL),
(1449, 'user', 1447, 73, '2017-09-26 21:54:01', 0, NULL, NULL, NULL),
(1450, 'user', 1448, 73, '2017-09-26 21:54:01', 0, NULL, NULL, NULL),
(1451, 'user', 1449, 73, '2017-09-26 21:54:01', 0, NULL, NULL, NULL),
(1452, 'user', 1450, 73, '2017-09-26 21:54:01', 0, NULL, NULL, NULL),
(1453, 'user', 1451, 73, '2017-09-26 21:54:01', 0, NULL, NULL, NULL),
(1454, 'user', 1452, 73, '2017-09-26 21:54:01', 0, NULL, NULL, NULL),
(1455, 'user', 1453, 73, '2017-09-26 21:54:01', 0, NULL, NULL, NULL),
(1456, 'user', 1454, 73, '2017-09-26 21:54:01', 0, NULL, NULL, NULL),
(1457, 'user', 1455, 73, '2017-09-26 21:54:01', 0, NULL, NULL, NULL),
(1458, 'user', 1456, 74, '2017-09-26 21:56:14', 0, NULL, NULL, NULL),
(1459, 'user', 1457, 168, '2017-09-26 21:56:15', 0, NULL, NULL, NULL),
(1460, 'user', 1458, 168, '2017-09-26 21:56:15', 0, NULL, NULL, NULL),
(1461, 'user', 1459, 168, '2017-09-26 21:56:15', 0, NULL, NULL, NULL),
(1462, 'user', 1460, 169, '2017-09-26 21:57:10', 0, NULL, NULL, NULL),
(1463, 'user', 1461, 169, '2017-09-26 21:57:10', 0, NULL, NULL, NULL),
(1464, 'user', 1462, 169, '2017-09-26 21:57:10', 0, NULL, NULL, NULL),
(1465, 'user', 1463, 169, '2017-09-26 21:57:10', 0, NULL, NULL, NULL),
(1466, 'user', 1464, 169, '2017-09-26 21:57:10', 0, NULL, NULL, NULL),
(1467, 'user', 1465, 169, '2017-09-26 21:57:10', 0, NULL, NULL, NULL),
(1468, 'user', 1466, 169, '2017-09-26 21:57:10', 0, NULL, NULL, NULL),
(1469, 'user', 1467, 169, '2017-09-26 21:57:10', 0, NULL, NULL, NULL),
(1470, 'user', 1468, 169, '2017-09-26 21:57:10', 0, NULL, NULL, NULL),
(1471, 'user', 1469, 169, '2017-09-26 21:57:10', 0, NULL, NULL, NULL),
(1472, 'user', 1470, 170, '2017-09-26 21:57:54', 0, NULL, NULL, NULL),
(1473, 'user', 1471, 170, '2017-09-26 21:57:54', 0, NULL, NULL, NULL),
(1474, 'user', 1472, 170, '2017-09-26 21:57:54', 0, NULL, NULL, NULL),
(1475, 'user', 1473, 170, '2017-09-26 21:57:54', 0, NULL, NULL, NULL),
(1476, 'user', 1474, 171, '2017-09-26 21:59:46', 0, NULL, NULL, NULL),
(1477, 'user', 1475, 171, '2017-09-26 21:59:46', 0, NULL, NULL, NULL),
(1478, 'user', 1476, 171, '2017-09-26 21:59:46', 0, NULL, NULL, NULL),
(1479, 'user', 1477, 171, '2017-09-26 21:59:46', 0, NULL, NULL, NULL),
(1480, 'user', 1478, 171, '2017-09-26 21:59:46', 0, NULL, NULL, NULL),
(1481, 'user', 1479, 171, '2017-09-26 21:59:46', 0, NULL, NULL, NULL),
(1482, 'user', 1480, 171, '2017-09-26 21:59:46', 0, NULL, NULL, NULL),
(1483, 'user', 1481, 171, '2017-09-26 21:59:46', 0, NULL, NULL, NULL),
(1484, 'user', 1482, 171, '2017-09-26 21:59:46', 0, NULL, NULL, NULL),
(1485, 'user', 1483, 171, '2017-09-26 21:59:46', 0, NULL, NULL, NULL),
(1486, 'user', 1484, 171, '2017-09-26 21:59:46', 0, NULL, NULL, NULL),
(1487, 'user', 1485, 171, '2017-09-26 21:59:46', 0, NULL, NULL, NULL),
(1488, 'user', 1486, 171, '2017-09-26 21:59:46', 0, NULL, NULL, NULL),
(1489, 'user', 1487, 171, '2017-09-26 21:59:46', 0, NULL, NULL, NULL),
(1490, 'user', 1488, 171, '2017-09-26 21:59:46', 0, NULL, NULL, NULL),
(1491, 'user', 1489, 171, '2017-09-26 21:59:46', 0, NULL, NULL, NULL),
(1492, 'user', 1490, 171, '2017-09-26 21:59:46', 0, NULL, NULL, NULL),
(1493, 'user', 1491, 171, '2017-09-26 21:59:46', 0, NULL, NULL, NULL),
(1494, 'user', 1492, 171, '2017-09-26 21:59:46', 0, NULL, NULL, NULL),
(1495, 'user', 1493, 171, '2017-09-26 21:59:46', 0, NULL, NULL, NULL),
(1496, 'user', 1494, 171, '2017-09-26 21:59:46', 0, NULL, NULL, NULL),
(1497, 'user', 1495, 171, '2017-09-26 21:59:46', 0, NULL, NULL, NULL),
(1498, 'user', 1496, 171, '2017-09-26 21:59:46', 0, NULL, NULL, NULL),
(1499, 'user', 1497, 171, '2017-09-26 21:59:46', 0, NULL, NULL, NULL),
(1500, 'user', 1498, 171, '2017-09-26 21:59:46', 0, NULL, NULL, NULL),
(1501, 'user', 1499, 171, '2017-09-26 21:59:46', 0, NULL, NULL, NULL),
(1502, 'user', 1500, 171, '2017-09-26 21:59:46', 0, NULL, NULL, NULL),
(1503, 'user', 1501, 171, '2017-09-26 21:59:46', 0, NULL, NULL, NULL),
(1504, 'user', 1502, 171, '2017-09-26 21:59:46', 0, NULL, NULL, NULL),
(1505, 'user', 1503, 171, '2017-09-26 21:59:46', 0, NULL, NULL, NULL),
(1506, 'user', 1504, 171, '2017-09-26 21:59:46', 0, NULL, NULL, NULL),
(1507, 'user', 1505, 171, '2017-09-26 21:59:46', 0, NULL, NULL, NULL),
(1508, 'user', 1506, 171, '2017-09-26 21:59:46', 0, NULL, NULL, NULL),
(1509, 'user', 1507, 171, '2017-09-26 21:59:46', 0, NULL, NULL, NULL),
(1510, 'user', 1508, 171, '2017-09-26 21:59:46', 0, NULL, NULL, NULL),
(1511, 'user', 1509, 171, '2017-09-26 21:59:46', 0, NULL, NULL, NULL),
(1512, 'user', 1510, 171, '2017-09-26 21:59:46', 0, NULL, NULL, NULL),
(1513, 'user', 1511, 171, '2017-09-26 21:59:46', 0, NULL, NULL, NULL),
(1514, 'user', 1512, 172, '2017-09-26 22:00:13', 0, NULL, NULL, NULL),
(1515, 'user', 1513, 172, '2017-09-26 22:00:13', 0, NULL, NULL, NULL),
(1516, 'user', 1514, 172, '2017-09-26 22:00:13', 0, NULL, NULL, NULL),
(1517, 'user', 1515, 172, '2017-09-26 22:00:13', 0, NULL, NULL, NULL),
(1518, 'user', 1516, 172, '2017-09-26 22:00:13', 0, NULL, NULL, NULL),
(1519, 'user', 1517, 172, '2017-09-26 22:00:13', 0, NULL, NULL, NULL),
(1520, 'user', 1518, 172, '2017-09-26 22:00:14', 0, NULL, NULL, NULL),
(1521, 'user', 1519, 172, '2017-09-26 22:00:14', 0, NULL, NULL, NULL),
(1522, 'user', 1520, 172, '2017-09-26 22:00:14', 0, NULL, NULL, NULL),
(1523, 'user', 1521, 172, '2017-09-26 22:00:14', 0, NULL, NULL, NULL),
(1524, 'user', 1522, 172, '2017-09-26 22:00:14', 0, NULL, NULL, NULL),
(1525, 'user', 1523, 173, '2017-09-26 22:00:26', 0, NULL, NULL, NULL),
(1526, 'user', 1524, 173, '2017-09-26 22:00:26', 0, NULL, NULL, NULL),
(1527, 'user', 1525, 173, '2017-09-26 22:00:26', 0, NULL, NULL, NULL),
(1528, 'user', 1526, 173, '2017-09-26 22:00:26', 0, NULL, NULL, NULL),
(1529, 'user', 1527, 173, '2017-09-26 22:00:26', 0, NULL, NULL, NULL),
(1530, 'user', 1528, 173, '2017-09-26 22:00:26', 0, NULL, NULL, NULL),
(1531, 'user', 1529, 174, '2017-09-26 22:01:29', 0, NULL, NULL, NULL),
(1532, 'user', 1530, 174, '2017-09-26 22:01:29', 0, NULL, NULL, NULL),
(1533, 'user', 1531, 174, '2017-09-26 22:01:29', 0, NULL, NULL, NULL),
(1534, 'user', 1532, 174, '2017-09-26 22:01:29', 0, NULL, NULL, NULL),
(1535, 'user', 1533, 174, '2017-09-26 22:01:29', 0, NULL, NULL, NULL),
(1536, 'user', 1534, 174, '2017-09-26 22:01:29', 0, NULL, NULL, NULL),
(1537, 'user', 1535, 174, '2017-09-26 22:01:29', 0, NULL, NULL, NULL),
(1538, 'user', 1536, 174, '2017-09-26 22:01:29', 0, NULL, NULL, NULL),
(1539, 'user', 1537, 174, '2017-09-26 22:01:29', 0, NULL, NULL, NULL),
(1540, 'user', 1538, 174, '2017-09-26 22:01:29', 0, NULL, NULL, NULL),
(1541, 'user', 1539, 174, '2017-09-26 22:01:29', 0, NULL, NULL, NULL),
(1542, 'user', 1540, 174, '2017-09-26 22:01:29', 0, NULL, NULL, NULL),
(1543, 'user', 1541, 174, '2017-09-26 22:01:29', 0, NULL, NULL, NULL),
(1544, 'user', 1542, 175, '2017-09-26 23:17:12', 0, NULL, NULL, NULL),
(1545, 'user', 1543, 175, '2017-09-26 23:17:12', 0, NULL, NULL, NULL),
(1546, 'user', 1544, 175, '2017-09-26 23:17:12', 0, NULL, NULL, NULL),
(1547, 'user', 1545, 175, '2017-09-26 23:17:12', 0, NULL, NULL, NULL),
(1548, 'user', 1546, 175, '2017-09-26 23:17:12', 0, NULL, NULL, NULL),
(1549, 'user', 1547, 175, '2017-09-26 23:17:12', 0, NULL, NULL, NULL);
INSERT INTO `group_members` (`member_id`, `role`, `student_student_id`, `group_group_id`, `_when_added`, `status`, `t_created_on`, `t_updated_on`, `_who_added`) VALUES
(1550, 'user', 1548, 175, '2017-09-26 23:17:12', 0, NULL, NULL, NULL),
(1551, 'user', 1549, 175, '2017-09-26 23:17:12', 0, NULL, NULL, NULL),
(1552, 'user', 1550, 175, '2017-09-26 23:17:12', 0, NULL, NULL, NULL),
(1553, 'user', 1551, 175, '2017-09-26 23:17:12', 0, NULL, NULL, NULL),
(1554, 'user', 1552, 175, '2017-09-26 23:17:12', 0, NULL, NULL, NULL),
(1555, 'user', 1553, 175, '2017-09-26 23:17:12', 0, NULL, NULL, NULL),
(1556, 'user', 1554, 175, '2017-09-26 23:17:12', 0, NULL, NULL, NULL),
(1557, 'user', 1555, 175, '2017-09-26 23:17:12', 0, NULL, NULL, NULL),
(1558, 'user', 1556, 175, '2017-09-26 23:17:12', 0, NULL, NULL, NULL),
(1559, 'user', 1557, 175, '2017-09-26 23:17:12', 0, NULL, NULL, NULL),
(1560, 'user', 1558, 175, '2017-09-26 23:17:12', 0, NULL, NULL, NULL),
(1561, 'user', 1559, 175, '2017-09-26 23:17:12', 0, NULL, NULL, NULL),
(1562, 'user', 1560, 175, '2017-09-26 23:17:12', 0, NULL, NULL, NULL),
(1563, 'user', 1561, 175, '2017-09-26 23:17:12', 0, NULL, NULL, NULL),
(1564, 'user', 1562, 175, '2017-09-26 23:17:12', 0, NULL, NULL, NULL),
(1565, 'user', 1563, 175, '2017-09-26 23:17:12', 0, NULL, NULL, NULL),
(1566, 'user', 1564, 175, '2017-09-26 23:17:12', 0, NULL, NULL, NULL),
(1567, 'user', 1565, 175, '2017-09-26 23:17:12', 0, NULL, NULL, NULL),
(1568, 'user', 1566, 175, '2017-09-26 23:17:12', 0, NULL, NULL, NULL),
(1569, 'user', 1567, 175, '2017-09-26 23:17:12', 0, NULL, NULL, NULL),
(1570, 'user', 1568, 175, '2017-09-26 23:17:12', 0, NULL, NULL, NULL),
(1571, 'user', 1569, 175, '2017-09-26 23:17:12', 0, NULL, NULL, NULL),
(1572, 'user', 1570, 175, '2017-09-26 23:17:12', 0, NULL, NULL, NULL),
(1573, 'user', 1571, 175, '2017-09-26 23:17:12', 0, NULL, NULL, NULL),
(1574, 'user', 1572, 175, '2017-09-26 23:17:12', 0, NULL, NULL, NULL),
(1575, 'user', 1573, 175, '2017-09-26 23:17:12', 0, NULL, NULL, NULL),
(1576, 'user', 1574, 175, '2017-09-26 23:17:12', 0, NULL, NULL, NULL),
(1577, 'user', 1575, 175, '2017-09-26 23:17:12', 0, NULL, NULL, NULL),
(1578, 'user', 1576, 175, '2017-09-26 23:17:12', 0, NULL, NULL, NULL),
(1579, 'user', 1577, 175, '2017-09-26 23:17:12', 0, NULL, NULL, NULL),
(1580, 'user', 1578, 175, '2017-09-26 23:17:12', 0, NULL, NULL, NULL),
(1581, 'user', 1579, 175, '2017-09-26 23:17:12', 0, NULL, NULL, NULL),
(1582, 'user', 1580, 175, '2017-09-26 23:17:12', 0, NULL, NULL, NULL),
(1583, 'user', 1581, 175, '2017-09-26 23:17:12', 0, NULL, NULL, NULL),
(1584, 'user', 1582, 175, '2017-09-26 23:17:12', 0, NULL, NULL, NULL),
(1585, 'user', 1583, 175, '2017-09-26 23:17:13', 0, NULL, NULL, NULL),
(1586, 'user', 1584, 175, '2017-09-26 23:17:13', 0, NULL, NULL, NULL),
(1587, 'user', 1585, 175, '2017-09-26 23:17:13', 0, NULL, NULL, NULL),
(1588, 'user', 1586, 175, '2017-09-26 23:17:13', 0, NULL, NULL, NULL),
(1589, 'user', 1587, 175, '2017-09-26 23:17:13', 0, NULL, NULL, NULL),
(1590, 'user', 1588, 176, '2017-09-26 23:17:49', 0, NULL, NULL, NULL),
(1591, 'user', 1589, 176, '2017-09-26 23:17:49', 0, NULL, NULL, NULL),
(1592, 'user', 1590, 176, '2017-09-26 23:17:49', 0, NULL, NULL, NULL),
(1593, 'user', 1591, 177, '2017-09-26 23:19:15', 0, NULL, NULL, NULL),
(1594, 'user', 1592, 177, '2017-09-26 23:19:15', 0, NULL, NULL, NULL),
(1595, 'user', 1593, 177, '2017-09-26 23:19:15', 0, NULL, NULL, NULL),
(1596, 'user', 1594, 177, '2017-09-26 23:19:15', 0, NULL, NULL, NULL),
(1597, 'user', 1595, 177, '2017-09-26 23:19:16', 0, NULL, NULL, NULL),
(1598, 'user', 1596, 177, '2017-09-26 23:19:16', 0, NULL, NULL, NULL),
(1599, 'user', 1597, 177, '2017-09-26 23:19:16', 0, NULL, NULL, NULL),
(1600, 'user', 1598, 178, '2017-09-26 23:20:01', 0, NULL, NULL, NULL),
(1601, 'user', 1599, 178, '2017-09-26 23:20:01', 0, NULL, NULL, NULL),
(1602, 'user', 1600, 178, '2017-09-26 23:20:01', 0, NULL, NULL, NULL),
(1603, 'user', 1601, 178, '2017-09-26 23:20:01', 0, NULL, NULL, NULL),
(1604, 'user', 1602, 178, '2017-09-26 23:20:01', 0, NULL, NULL, NULL),
(1605, 'user', 1603, 178, '2017-09-26 23:20:01', 0, NULL, NULL, NULL),
(1606, 'user', 1604, 178, '2017-09-26 23:20:01', 0, NULL, NULL, NULL),
(1607, 'user', 1605, 178, '2017-09-26 23:20:01', 0, NULL, NULL, NULL),
(1608, 'user', 1606, 178, '2017-09-26 23:20:02', 0, NULL, NULL, NULL),
(1609, 'user', 1607, 178, '2017-09-26 23:20:02', 0, NULL, NULL, NULL),
(1610, 'user', 1608, 178, '2017-09-26 23:20:02', 0, NULL, NULL, NULL),
(1611, 'user', 1609, 178, '2017-09-26 23:20:02', 0, NULL, NULL, NULL),
(1612, 'user', 1610, 178, '2017-09-26 23:20:02', 0, NULL, NULL, NULL),
(1613, 'user', 1611, 178, '2017-09-26 23:20:02', 0, NULL, NULL, NULL),
(1614, 'user', 1612, 178, '2017-09-26 23:20:02', 0, NULL, NULL, NULL),
(1615, 'user', 1613, 178, '2017-09-26 23:20:02', 0, NULL, NULL, NULL),
(1616, 'user', 1614, 178, '2017-09-26 23:20:02', 0, NULL, NULL, NULL),
(1617, 'user', 1615, 178, '2017-09-26 23:20:02', 0, NULL, NULL, NULL),
(1618, 'user', 1616, 178, '2017-09-26 23:20:02', 0, NULL, NULL, NULL),
(1619, 'user', 1617, 178, '2017-09-26 23:20:02', 0, NULL, NULL, NULL),
(1620, 'user', 1618, 178, '2017-09-26 23:20:02', 0, NULL, NULL, NULL),
(1621, 'user', 1619, 178, '2017-09-26 23:20:02', 0, NULL, NULL, NULL),
(1622, 'user', 1620, 178, '2017-09-26 23:20:02', 0, NULL, NULL, NULL),
(1623, 'user', 1621, 178, '2017-09-26 23:20:02', 0, NULL, NULL, NULL),
(1624, 'user', 1622, 178, '2017-09-26 23:20:02', 0, NULL, NULL, NULL),
(1625, 'user', 1623, 178, '2017-09-26 23:20:02', 0, NULL, NULL, NULL),
(1626, 'user', 1624, 178, '2017-09-26 23:20:02', 0, NULL, NULL, NULL),
(1627, 'user', 1625, 178, '2017-09-26 23:20:02', 0, NULL, NULL, NULL),
(1628, 'user', 1626, 178, '2017-09-26 23:20:02', 0, NULL, NULL, NULL),
(1629, 'user', 1627, 178, '2017-09-26 23:20:02', 0, NULL, NULL, NULL),
(1630, 'user', 1628, 178, '2017-09-26 23:20:02', 0, NULL, NULL, NULL),
(1631, 'user', 1629, 178, '2017-09-26 23:20:02', 0, NULL, NULL, NULL),
(1632, 'user', 1630, 178, '2017-09-26 23:20:02', 0, NULL, NULL, NULL),
(1633, 'user', 1631, 178, '2017-09-26 23:20:02', 0, NULL, NULL, NULL),
(1634, 'user', 1632, 178, '2017-09-26 23:20:03', 0, NULL, NULL, NULL),
(1635, 'user', 1633, 178, '2017-09-26 23:20:03', 0, NULL, NULL, NULL),
(1636, 'user', 1634, 178, '2017-09-26 23:20:03', 0, NULL, NULL, NULL),
(1637, 'user', 1635, 178, '2017-09-26 23:20:03', 0, NULL, NULL, NULL),
(1638, 'user', 1636, 178, '2017-09-26 23:20:03', 0, NULL, NULL, NULL),
(1639, 'user', 1637, 178, '2017-09-26 23:20:03', 0, NULL, NULL, NULL),
(1640, 'user', 1638, 178, '2017-09-26 23:20:03', 0, NULL, NULL, NULL),
(1641, 'user', 1639, 178, '2017-09-26 23:20:03', 0, NULL, NULL, NULL),
(1642, 'user', 1640, 178, '2017-09-26 23:20:03', 0, NULL, NULL, NULL),
(1643, 'user', 1641, 178, '2017-09-26 23:20:03', 0, NULL, NULL, NULL),
(1644, 'user', 1642, 178, '2017-09-26 23:20:03', 0, NULL, NULL, NULL),
(1645, 'user', 1643, 178, '2017-09-26 23:20:03', 0, NULL, NULL, NULL),
(1646, 'user', 1644, 179, '2017-09-26 23:21:04', 0, NULL, NULL, NULL),
(1647, 'user', 1645, 179, '2017-09-26 23:21:04', 0, NULL, NULL, NULL),
(1648, 'user', 1646, 179, '2017-09-26 23:21:04', 0, NULL, NULL, NULL),
(1649, 'user', 1647, 179, '2017-09-26 23:21:04', 0, NULL, NULL, NULL),
(1650, 'user', 1648, 179, '2017-09-26 23:21:04', 0, NULL, NULL, NULL),
(1651, 'user', 1649, 179, '2017-09-26 23:21:04', 0, NULL, NULL, NULL),
(1652, 'user', 1650, 179, '2017-09-26 23:21:04', 0, NULL, NULL, NULL),
(1653, 'user', 1651, 179, '2017-09-26 23:21:04', 0, NULL, NULL, NULL),
(1654, 'user', 1652, 179, '2017-09-26 23:21:04', 0, NULL, NULL, NULL),
(1655, 'user', 1653, 179, '2017-09-26 23:21:04', 0, NULL, NULL, NULL),
(1656, 'user', 1654, 179, '2017-09-26 23:21:04', 0, NULL, NULL, NULL),
(1657, 'user', 1655, 179, '2017-09-26 23:21:04', 0, NULL, NULL, NULL),
(1658, 'user', 1656, 179, '2017-09-26 23:21:04', 0, NULL, NULL, NULL),
(1659, 'user', 1657, 179, '2017-09-26 23:21:04', 0, NULL, NULL, NULL),
(1660, 'user', 1658, 179, '2017-09-26 23:21:04', 0, NULL, NULL, NULL),
(1661, 'user', 1659, 179, '2017-09-26 23:21:04', 0, NULL, NULL, NULL),
(1662, 'user', 1660, 179, '2017-09-26 23:21:04', 0, NULL, NULL, NULL),
(1663, 'user', 1661, 179, '2017-09-26 23:21:04', 0, NULL, NULL, NULL),
(1664, 'user', 1662, 179, '2017-09-26 23:21:04', 0, NULL, NULL, NULL),
(1665, 'user', 1663, 179, '2017-09-26 23:21:04', 0, NULL, NULL, NULL),
(1666, 'user', 1664, 179, '2017-09-26 23:21:04', 0, NULL, NULL, NULL),
(1667, 'user', 1665, 179, '2017-09-26 23:21:04', 0, NULL, NULL, NULL),
(1668, 'user', 1666, 179, '2017-09-26 23:21:04', 0, NULL, NULL, NULL),
(1669, 'user', 1667, 179, '2017-09-26 23:21:04', 0, NULL, NULL, NULL),
(1670, 'user', 1668, 179, '2017-09-26 23:21:04', 0, NULL, NULL, NULL),
(1671, 'user', 1669, 180, '2017-09-26 23:22:22', 0, NULL, NULL, NULL),
(1672, 'user', 1670, 180, '2017-09-26 23:22:22', 0, NULL, NULL, NULL),
(1673, 'user', 1671, 180, '2017-09-26 23:22:22', 0, NULL, NULL, NULL),
(1674, 'user', 1672, 180, '2017-09-26 23:22:22', 0, NULL, NULL, NULL),
(1675, 'user', 1673, 180, '2017-09-26 23:22:22', 0, NULL, NULL, NULL),
(1676, 'user', 1674, 180, '2017-09-26 23:22:22', 0, NULL, NULL, NULL),
(1677, 'user', 1675, 180, '2017-09-26 23:22:22', 0, NULL, NULL, NULL),
(1678, 'user', 1676, 180, '2017-09-26 23:22:22', 0, NULL, NULL, NULL),
(1679, 'user', 1677, 180, '2017-09-26 23:22:22', 0, NULL, NULL, NULL),
(1680, 'user', 1678, 180, '2017-09-26 23:22:22', 0, NULL, NULL, NULL),
(1681, 'user', 1679, 180, '2017-09-26 23:22:22', 0, NULL, NULL, NULL),
(1682, 'user', 1680, 180, '2017-09-26 23:22:22', 0, NULL, NULL, NULL),
(1683, 'user', 1681, 180, '2017-09-26 23:22:22', 0, NULL, NULL, NULL),
(1684, 'user', 1682, 180, '2017-09-26 23:22:22', 0, NULL, NULL, NULL),
(1685, 'user', 1683, 180, '2017-09-26 23:22:22', 0, NULL, NULL, NULL),
(1686, 'user', 1684, 180, '2017-09-26 23:22:22', 0, NULL, NULL, NULL),
(1687, 'user', 1685, 180, '2017-09-26 23:22:22', 0, NULL, NULL, NULL),
(1688, 'user', 1686, 180, '2017-09-26 23:22:22', 0, NULL, NULL, NULL),
(1689, 'user', 1687, 180, '2017-09-26 23:22:22', 0, NULL, NULL, NULL),
(1690, 'user', 1688, 180, '2017-09-26 23:22:22', 0, NULL, NULL, NULL),
(1691, 'user', 1689, 180, '2017-09-26 23:22:22', 0, NULL, NULL, NULL),
(1692, 'user', 1690, 180, '2017-09-26 23:22:22', 0, NULL, NULL, NULL),
(1693, 'user', 1691, 180, '2017-09-26 23:22:22', 0, NULL, NULL, NULL),
(1694, 'user', 1692, 180, '2017-09-26 23:22:22', 0, NULL, NULL, NULL),
(1695, 'user', 1693, 180, '2017-09-26 23:22:22', 0, NULL, NULL, NULL),
(1696, 'user', 1694, 180, '2017-09-26 23:22:22', 0, NULL, NULL, NULL),
(1697, 'user', 1695, 180, '2017-09-26 23:22:22', 0, NULL, NULL, NULL),
(1698, 'user', 1696, 180, '2017-09-26 23:22:22', 0, NULL, NULL, NULL),
(1699, 'user', 1697, 180, '2017-09-26 23:22:22', 0, NULL, NULL, NULL),
(1700, 'user', 1698, 180, '2017-09-26 23:22:22', 0, NULL, NULL, NULL),
(1701, 'user', 1699, 180, '2017-09-26 23:22:22', 0, NULL, NULL, NULL),
(1702, 'user', 1700, 180, '2017-09-26 23:22:22', 0, NULL, NULL, NULL),
(1703, 'user', 1701, 180, '2017-09-26 23:22:22', 0, NULL, NULL, NULL),
(1704, 'user', 1702, 180, '2017-09-26 23:22:22', 0, NULL, NULL, NULL),
(1705, 'user', 1703, 180, '2017-09-26 23:22:22', 0, NULL, NULL, NULL),
(1706, 'user', 1704, 180, '2017-09-26 23:22:22', 0, NULL, NULL, NULL),
(1707, 'user', 1705, 180, '2017-09-26 23:22:22', 0, NULL, NULL, NULL),
(1708, 'user', 1706, 180, '2017-09-26 23:22:22', 0, NULL, NULL, NULL),
(1709, 'user', 1707, 180, '2017-09-26 23:22:22', 0, NULL, NULL, NULL),
(1710, 'user', 1708, 180, '2017-09-26 23:22:22', 0, NULL, NULL, NULL),
(1711, 'user', 1709, 180, '2017-09-26 23:22:22', 0, NULL, NULL, NULL),
(1712, 'user', 1710, 180, '2017-09-26 23:22:22', 0, NULL, NULL, NULL),
(1713, 'user', 1711, 180, '2017-09-26 23:22:22', 0, NULL, NULL, NULL),
(1714, 'user', 1712, 180, '2017-09-26 23:22:22', 0, NULL, NULL, NULL),
(1715, 'user', 1713, 180, '2017-09-26 23:22:22', 0, NULL, NULL, NULL),
(1716, 'user', 1714, 180, '2017-09-26 23:22:22', 0, NULL, NULL, NULL),
(1717, 'user', 1715, 180, '2017-09-26 23:22:22', 0, NULL, NULL, NULL),
(1718, 'user', 1716, 180, '2017-09-26 23:22:22', 0, NULL, NULL, NULL),
(1719, 'user', 1717, 180, '2017-09-26 23:22:22', 0, NULL, NULL, NULL),
(1720, 'user', 1718, 180, '2017-09-26 23:22:22', 0, NULL, NULL, NULL),
(1721, 'user', 1719, 180, '2017-09-26 23:22:22', 0, NULL, NULL, NULL),
(1722, 'user', 1720, 180, '2017-09-26 23:22:22', 0, NULL, NULL, NULL),
(1723, 'user', 1721, 180, '2017-09-26 23:22:22', 0, NULL, NULL, NULL),
(1724, 'user', 1722, 180, '2017-09-26 23:22:22', 0, NULL, NULL, NULL),
(1725, 'user', 1723, 180, '2017-09-26 23:22:22', 0, NULL, NULL, NULL),
(1726, 'user', 1724, 180, '2017-09-26 23:22:22', 0, NULL, NULL, NULL),
(1727, 'user', 1725, 180, '2017-09-26 23:22:22', 0, NULL, NULL, NULL),
(1728, 'user', 1726, 180, '2017-09-26 23:22:22', 0, NULL, NULL, NULL),
(1729, 'user', 1727, 180, '2017-09-26 23:22:22', 0, NULL, NULL, NULL),
(1730, 'user', 1728, 180, '2017-09-26 23:22:22', 0, NULL, NULL, NULL),
(1731, 'user', 1729, 180, '2017-09-26 23:22:22', 0, NULL, NULL, NULL),
(1732, 'user', 1730, 180, '2017-09-26 23:22:22', 0, NULL, NULL, NULL),
(1733, 'user', 1731, 180, '2017-09-26 23:22:22', 0, NULL, NULL, NULL),
(1734, 'user', 1732, 180, '2017-09-26 23:22:22', 0, NULL, NULL, NULL),
(1735, 'user', 1733, 180, '2017-09-26 23:22:22', 0, NULL, NULL, NULL),
(1736, 'user', 1734, 180, '2017-09-26 23:22:22', 0, NULL, NULL, NULL),
(1737, 'user', 1735, 180, '2017-09-26 23:22:22', 0, NULL, NULL, NULL),
(1738, 'user', 1736, 180, '2017-09-26 23:22:22', 0, NULL, NULL, NULL),
(1739, 'user', 1737, 180, '2017-09-26 23:22:22', 0, NULL, NULL, NULL),
(1740, 'user', 1738, 180, '2017-09-26 23:22:22', 0, NULL, NULL, NULL),
(1741, 'user', 1739, 180, '2017-09-26 23:22:22', 0, NULL, NULL, NULL),
(1742, 'user', 1740, 180, '2017-09-26 23:22:22', 0, NULL, NULL, NULL),
(1743, 'user', 1741, 180, '2017-09-26 23:22:22', 0, NULL, NULL, NULL),
(1744, 'user', 1742, 180, '2017-09-26 23:22:22', 0, NULL, NULL, NULL),
(1745, 'user', 1743, 180, '2017-09-26 23:22:22', 0, NULL, NULL, NULL),
(1746, 'user', 1744, 180, '2017-09-26 23:22:22', 0, NULL, NULL, NULL),
(1747, 'user', 1745, 180, '2017-09-26 23:22:22', 0, NULL, NULL, NULL),
(1748, 'user', 1746, 180, '2017-09-26 23:22:22', 0, NULL, NULL, NULL),
(1749, 'user', 1747, 180, '2017-09-26 23:22:22', 0, NULL, NULL, NULL),
(1750, 'user', 1748, 180, '2017-09-26 23:22:22', 0, NULL, NULL, NULL),
(1751, 'user', 1749, 180, '2017-09-26 23:22:22', 0, NULL, NULL, NULL),
(1752, 'user', 1750, 181, '2017-09-26 23:36:05', 0, NULL, NULL, NULL),
(1753, 'user', 1751, 181, '2017-09-26 23:36:05', 0, NULL, NULL, NULL),
(1754, 'user', 1752, 181, '2017-09-26 23:36:05', 0, NULL, NULL, NULL),
(1755, 'user', 1753, 181, '2017-09-26 23:36:05', 0, NULL, NULL, NULL),
(1756, 'user', 1754, 181, '2017-09-26 23:36:05', 0, NULL, NULL, NULL),
(1757, 'user', 1755, 181, '2017-09-26 23:36:05', 0, NULL, NULL, NULL),
(1758, 'user', 1756, 181, '2017-09-26 23:36:05', 0, NULL, NULL, NULL),
(1759, 'user', 1757, 181, '2017-09-26 23:36:05', 0, NULL, NULL, NULL),
(1760, 'user', 1758, 181, '2017-09-26 23:36:05', 0, NULL, NULL, NULL),
(1761, 'user', 1759, 181, '2017-09-26 23:36:05', 0, NULL, NULL, NULL),
(1762, 'user', 1760, 181, '2017-09-26 23:36:05', 0, NULL, NULL, NULL),
(1763, 'user', 1761, 181, '2017-09-26 23:36:05', 0, NULL, NULL, NULL),
(1764, 'user', 1762, 181, '2017-09-26 23:36:05', 0, NULL, NULL, NULL),
(1765, 'user', 1763, 181, '2017-09-26 23:36:05', 0, NULL, NULL, NULL),
(1766, 'user', 1764, 181, '2017-09-26 23:36:05', 0, NULL, NULL, NULL),
(1767, 'user', 1765, 181, '2017-09-26 23:36:05', 0, NULL, NULL, NULL),
(1768, 'user', 1766, 181, '2017-09-26 23:36:05', 0, NULL, NULL, NULL),
(1769, 'user', 1767, 181, '2017-09-26 23:36:05', 0, NULL, NULL, NULL),
(1770, 'user', 1768, 181, '2017-09-26 23:36:05', 0, NULL, NULL, NULL),
(1771, 'user', 1769, 181, '2017-09-26 23:36:05', 0, NULL, NULL, NULL),
(1772, 'user', 1770, 181, '2017-09-26 23:36:05', 0, NULL, NULL, NULL),
(1773, 'user', 1771, 181, '2017-09-26 23:36:05', 0, NULL, NULL, NULL),
(1774, 'user', 1772, 181, '2017-09-26 23:36:05', 0, NULL, NULL, NULL),
(1775, 'user', 1773, 181, '2017-09-26 23:36:05', 0, NULL, NULL, NULL),
(1776, 'user', 1774, 181, '2017-09-26 23:36:05', 0, NULL, NULL, NULL),
(1777, 'user', 1775, 181, '2017-09-26 23:36:05', 0, NULL, NULL, NULL),
(1778, 'user', 1776, 181, '2017-09-26 23:36:05', 0, NULL, NULL, NULL),
(1779, 'user', 1777, 181, '2017-09-26 23:36:05', 0, NULL, NULL, NULL),
(1780, 'user', 1778, 181, '2017-09-26 23:36:05', 0, NULL, NULL, NULL),
(1781, 'user', 1779, 181, '2017-09-26 23:36:05', 0, NULL, NULL, NULL),
(1782, 'user', 1780, 181, '2017-09-26 23:36:05', 0, NULL, NULL, NULL),
(1783, 'user', 1781, 181, '2017-09-26 23:36:05', 0, NULL, NULL, NULL),
(1784, 'user', 1782, 181, '2017-09-26 23:36:05', 0, NULL, NULL, NULL),
(1785, 'user', 1783, 181, '2017-09-26 23:36:05', 0, NULL, NULL, NULL),
(1786, 'user', 1784, 181, '2017-09-26 23:36:05', 0, NULL, NULL, NULL),
(1787, 'user', 1785, 181, '2017-09-26 23:36:05', 0, NULL, NULL, NULL),
(1788, 'user', 1786, 181, '2017-09-26 23:36:05', 0, NULL, NULL, NULL),
(1789, 'user', 1787, 181, '2017-09-26 23:36:05', 0, NULL, NULL, NULL),
(1790, 'user', 1788, 181, '2017-09-26 23:36:05', 0, NULL, NULL, NULL),
(1791, 'user', 1789, 181, '2017-09-26 23:36:05', 0, NULL, NULL, NULL),
(1792, 'user', 1790, 181, '2017-09-26 23:36:05', 0, NULL, NULL, NULL),
(1793, 'user', 1791, 181, '2017-09-26 23:36:05', 0, NULL, NULL, NULL),
(1794, 'user', 1792, 181, '2017-09-26 23:36:05', 0, NULL, NULL, NULL),
(1795, 'user', 1793, 181, '2017-09-26 23:36:05', 0, NULL, NULL, NULL),
(1796, 'user', 1794, 176, '2017-09-26 23:40:59', 0, NULL, NULL, NULL),
(1797, 'user', 1795, 176, '2017-09-26 23:40:59', 0, NULL, NULL, NULL),
(1798, 'user', 1796, 176, '2017-09-26 23:40:59', 0, NULL, NULL, NULL),
(1799, 'user', 1797, 176, '2017-09-26 23:40:59', 0, NULL, NULL, NULL),
(1800, 'user', 1798, 176, '2017-09-26 23:40:59', 0, NULL, NULL, NULL),
(1801, 'user', 1799, 176, '2017-09-26 23:40:59', 0, NULL, NULL, NULL),
(1802, 'user', 1800, 176, '2017-09-26 23:40:59', 0, NULL, NULL, NULL),
(1803, 'user', 1801, 176, '2017-09-26 23:40:59', 0, NULL, NULL, NULL),
(1804, 'user', 1802, 176, '2017-09-26 23:40:59', 0, NULL, NULL, NULL),
(1805, 'user', 1803, 176, '2017-09-26 23:40:59', 0, NULL, NULL, NULL),
(1806, 'user', 1804, 176, '2017-09-26 23:40:59', 0, NULL, NULL, NULL),
(1807, 'user', 1805, 176, '2017-09-26 23:40:59', 0, NULL, NULL, NULL),
(1808, 'user', 1806, 176, '2017-09-26 23:40:59', 0, NULL, NULL, NULL),
(1809, 'user', 1807, 176, '2017-09-26 23:40:59', 0, NULL, NULL, NULL),
(1810, 'user', 1808, 176, '2017-09-26 23:40:59', 0, NULL, NULL, NULL),
(1811, 'user', 1809, 176, '2017-09-26 23:40:59', 0, NULL, NULL, NULL),
(1812, 'user', 1810, 176, '2017-09-26 23:40:59', 0, NULL, NULL, NULL),
(1813, 'user', 1811, 176, '2017-09-26 23:40:59', 0, NULL, NULL, NULL),
(1814, 'user', 1812, 176, '2017-09-26 23:40:59', 0, NULL, NULL, NULL),
(1815, 'user', 1813, 176, '2017-09-26 23:40:59', 0, NULL, NULL, NULL),
(1816, 'user', 1814, 176, '2017-09-26 23:40:59', 0, NULL, NULL, NULL),
(1817, 'user', 1815, 176, '2017-09-26 23:40:59', 0, NULL, NULL, NULL),
(1818, 'user', 1816, 176, '2017-09-26 23:40:59', 0, NULL, NULL, NULL),
(1819, 'user', 1817, 176, '2017-09-26 23:40:59', 0, NULL, NULL, NULL),
(1820, 'user', 1818, 176, '2017-09-26 23:40:59', 0, NULL, NULL, NULL),
(1821, 'user', 1819, 176, '2017-09-26 23:40:59', 0, NULL, NULL, NULL),
(1822, 'user', 1820, 176, '2017-09-26 23:40:59', 0, NULL, NULL, NULL),
(1823, 'user', 1821, 176, '2017-09-26 23:40:59', 0, NULL, NULL, NULL),
(1824, 'user', 1822, 176, '2017-09-26 23:40:59', 0, NULL, NULL, NULL),
(1825, 'user', 1823, 182, '2017-09-26 23:43:54', 0, NULL, NULL, NULL),
(1826, 'user', 1824, 182, '2017-09-26 23:43:54', 0, NULL, NULL, NULL),
(1827, 'user', 1825, 182, '2017-09-26 23:43:54', 0, NULL, NULL, NULL),
(1828, 'user', 1826, 182, '2017-09-26 23:43:54', 0, NULL, NULL, NULL),
(1829, 'user', 1827, 182, '2017-09-26 23:43:54', 0, NULL, NULL, NULL),
(1830, 'user', 1828, 182, '2017-09-26 23:43:54', 0, NULL, NULL, NULL),
(1831, 'user', 1829, 182, '2017-09-26 23:43:54', 0, NULL, NULL, NULL),
(1832, 'user', 1830, 182, '2017-09-26 23:43:54', 0, NULL, NULL, NULL),
(1833, 'user', 1831, 183, '2017-09-26 23:44:28', 0, NULL, NULL, NULL),
(1834, 'user', 1832, 183, '2017-09-26 23:44:28', 0, NULL, NULL, NULL),
(1835, 'user', 1833, 183, '2017-09-26 23:44:28', 0, NULL, NULL, NULL),
(1836, 'user', 1834, 183, '2017-09-26 23:44:29', 0, NULL, NULL, NULL),
(1837, 'user', 1835, 183, '2017-09-26 23:44:29', 0, NULL, NULL, NULL),
(1838, 'user', 1836, 183, '2017-09-26 23:44:29', 0, NULL, NULL, NULL),
(1839, 'user', 1837, 183, '2017-09-26 23:44:29', 0, NULL, NULL, NULL),
(1840, 'user', 1838, 183, '2017-09-26 23:44:29', 0, NULL, NULL, NULL),
(1841, 'user', 1839, 183, '2017-09-26 23:44:29', 0, NULL, NULL, NULL),
(1842, 'user', 1840, 183, '2017-09-26 23:44:29', 0, NULL, NULL, NULL),
(1843, 'user', 1841, 183, '2017-09-26 23:44:29', 0, NULL, NULL, NULL),
(1844, 'user', 1842, 183, '2017-09-26 23:44:29', 0, NULL, NULL, NULL),
(1845, 'user', 1843, 183, '2017-09-26 23:44:29', 0, NULL, NULL, NULL),
(1846, 'user', 1844, 183, '2017-09-26 23:44:29', 0, NULL, NULL, NULL),
(1847, 'user', 1845, 184, '2017-09-26 23:45:47', 0, NULL, NULL, NULL),
(1848, 'user', 1846, 184, '2017-09-26 23:45:47', 0, NULL, NULL, NULL),
(1849, 'user', 1847, 184, '2017-09-26 23:45:47', 0, NULL, NULL, NULL),
(1850, 'user', 1848, 184, '2017-09-26 23:45:47', 0, NULL, NULL, NULL),
(1851, 'user', 1849, 185, '2017-09-26 23:46:21', 0, NULL, NULL, NULL),
(1852, 'user', 1850, 186, '2017-09-26 23:46:57', 0, NULL, NULL, NULL),
(1853, 'user', 1851, 186, '2017-09-26 23:46:57', 0, NULL, NULL, NULL),
(1854, 'user', 1852, 186, '2017-09-26 23:46:57', 0, NULL, NULL, NULL),
(1855, 'user', 1853, 186, '2017-09-26 23:46:57', 0, NULL, NULL, NULL),
(1856, 'user', 1854, 186, '2017-09-26 23:46:57', 0, NULL, NULL, NULL),
(1857, 'user', 1855, 186, '2017-09-26 23:46:57', 0, NULL, NULL, NULL),
(1858, 'user', 1856, 186, '2017-09-26 23:46:57', 0, NULL, NULL, NULL),
(1859, 'user', 1857, 187, '2017-09-26 23:47:44', 0, NULL, NULL, NULL),
(1860, 'user', 1858, 187, '2017-09-26 23:47:44', 0, NULL, NULL, NULL),
(1861, 'user', 1859, 187, '2017-09-26 23:47:44', 0, NULL, NULL, NULL),
(1862, 'user', 1860, 187, '2017-09-26 23:47:44', 0, NULL, NULL, NULL),
(1863, 'user', 1861, 187, '2017-09-26 23:47:44', 0, NULL, NULL, NULL),
(1864, 'user', 1862, 187, '2017-09-26 23:47:44', 0, NULL, NULL, NULL),
(1865, 'user', 1863, 187, '2017-09-26 23:47:44', 0, NULL, NULL, NULL),
(1866, 'user', 1864, 187, '2017-09-26 23:47:44', 0, NULL, NULL, NULL),
(1867, 'user', 1865, 187, '2017-09-26 23:47:44', 0, NULL, NULL, NULL),
(1868, 'user', 1866, 187, '2017-09-26 23:47:44', 0, NULL, NULL, NULL),
(1869, 'user', 1867, 187, '2017-09-26 23:47:44', 0, NULL, NULL, NULL),
(1870, 'user', 1868, 188, '2017-09-26 23:50:50', 0, NULL, NULL, NULL),
(1871, 'user', 1869, 188, '2017-09-26 23:50:50', 0, NULL, NULL, NULL),
(1872, 'user', 1870, 188, '2017-09-26 23:50:50', 0, NULL, NULL, NULL),
(1873, 'user', 1871, 188, '2017-09-26 23:50:50', 0, NULL, NULL, NULL),
(1874, 'user', 1872, 188, '2017-09-26 23:50:50', 0, NULL, NULL, NULL),
(1875, 'user', 1873, 188, '2017-09-26 23:50:50', 0, NULL, NULL, NULL),
(1876, 'user', 1874, 188, '2017-09-26 23:50:50', 0, NULL, NULL, NULL),
(1877, 'user', 1875, 188, '2017-09-26 23:50:50', 0, NULL, NULL, NULL),
(1878, 'user', 1876, 188, '2017-09-26 23:50:50', 0, NULL, NULL, NULL),
(1879, 'user', 1877, 189, '2017-09-26 23:53:43', 0, NULL, NULL, NULL),
(1880, 'user', 1878, 190, '2017-09-27 00:01:04', 0, NULL, NULL, NULL),
(1881, 'user', 1879, 191, '2017-09-27 00:06:13', 0, NULL, NULL, NULL),
(1882, 'user', 1880, 191, '2017-09-27 00:06:13', 0, NULL, NULL, NULL),
(1883, 'user', 1881, 192, '2017-09-27 00:09:04', 0, NULL, NULL, NULL),
(1884, 'user', 1882, 192, '2017-09-27 00:09:04', 0, NULL, NULL, NULL),
(1885, 'user', 1883, 192, '2017-09-27 00:09:04', 0, NULL, NULL, NULL),
(1886, 'user', 1884, 192, '2017-09-27 00:09:04', 0, NULL, NULL, NULL),
(1887, 'user', 1885, 192, '2017-09-27 00:09:04', 0, NULL, NULL, NULL),
(1888, 'user', 1886, 192, '2017-09-27 00:09:04', 0, NULL, NULL, NULL),
(1889, 'user', 1887, 192, '2017-09-27 00:09:04', 0, NULL, NULL, NULL),
(1890, 'user', 1888, 192, '2017-09-27 00:09:04', 0, NULL, NULL, NULL),
(1891, 'user', 1889, 192, '2017-09-27 00:09:04', 0, NULL, NULL, NULL),
(1892, 'user', 1890, 192, '2017-09-27 00:09:04', 0, NULL, NULL, NULL),
(1893, 'user', 1891, 192, '2017-09-27 00:09:04', 0, NULL, NULL, NULL),
(1894, 'user', 1892, 192, '2017-09-27 00:09:04', 0, NULL, NULL, NULL),
(1895, 'user', 1893, 192, '2017-09-27 00:09:04', 0, NULL, NULL, NULL),
(1896, 'user', 1894, 192, '2017-09-27 00:09:04', 0, NULL, NULL, NULL),
(1897, 'user', 1895, 192, '2017-09-27 00:09:04', 0, NULL, NULL, NULL),
(1898, 'user', 1896, 192, '2017-09-27 00:09:04', 0, NULL, NULL, NULL),
(1899, 'user', 1897, 193, '2017-09-27 00:11:04', 0, NULL, NULL, NULL),
(1900, 'user', 1898, 193, '2017-09-27 00:11:04', 0, NULL, NULL, NULL),
(1901, 'user', 1899, 193, '2017-09-27 00:11:04', 0, NULL, NULL, NULL),
(1902, 'user', 1900, 193, '2017-09-27 00:11:04', 0, NULL, NULL, NULL),
(1903, 'user', 1901, 193, '2017-09-27 00:11:04', 0, NULL, NULL, NULL),
(1904, 'user', 1902, 193, '2017-09-27 00:11:04', 0, NULL, NULL, NULL),
(1905, 'user', 1903, 193, '2017-09-27 00:11:04', 0, NULL, NULL, NULL),
(1906, 'user', 1904, 193, '2017-09-27 00:11:04', 0, NULL, NULL, NULL),
(1907, 'user', 1905, 194, '2017-09-27 00:17:16', 0, NULL, NULL, NULL),
(1908, 'user', 1906, 194, '2017-09-27 00:17:16', 0, NULL, NULL, NULL),
(1909, 'user', 1907, 194, '2017-09-27 00:17:16', 0, NULL, NULL, NULL),
(1910, 'user', 1908, 194, '2017-09-27 00:17:16', 0, NULL, NULL, NULL),
(1911, 'user', 1909, 195, '2017-09-27 00:18:53', 0, NULL, NULL, NULL),
(1912, 'user', 1910, 196, '2017-09-27 00:20:09', 0, NULL, NULL, NULL),
(1913, 'user', 1911, 196, '2017-09-27 00:20:09', 0, NULL, NULL, NULL),
(1914, 'user', 1912, 196, '2017-09-27 00:20:09', 0, NULL, NULL, NULL),
(1915, 'user', 1913, 196, '2017-09-27 00:20:09', 0, NULL, NULL, NULL),
(1916, 'user', 1914, 197, '2017-09-27 00:21:22', 0, NULL, NULL, NULL),
(1917, 'user', 1915, 197, '2017-09-27 00:21:22', 0, NULL, NULL, NULL),
(1918, 'user', 1916, 197, '2017-09-27 00:21:22', 0, NULL, NULL, NULL),
(1919, 'user', 1917, 197, '2017-09-27 00:21:22', 0, NULL, NULL, NULL),
(1920, 'user', 1918, 198, '2017-09-27 00:22:42', 0, NULL, NULL, NULL),
(1921, 'user', 1919, 198, '2017-09-27 00:22:42', 0, NULL, NULL, NULL),
(1922, 'user', 1920, 198, '2017-09-27 00:22:42', 0, NULL, NULL, NULL),
(1923, 'user', 1921, 199, '2017-09-27 00:25:36', 0, NULL, NULL, NULL),
(1924, 'user', 1922, 199, '2017-09-27 00:25:36', 0, NULL, NULL, NULL),
(1925, 'user', 1923, 199, '2017-09-27 00:25:36', 0, NULL, NULL, NULL),
(1926, 'user', 1924, 199, '2017-09-27 00:25:36', 0, NULL, NULL, NULL),
(1927, 'user', 1925, 200, '2017-09-27 00:28:44', 0, NULL, NULL, NULL),
(1928, 'user', 1926, 200, '2017-09-27 00:28:44', 0, NULL, NULL, NULL),
(1929, 'user', 1927, 200, '2017-09-27 00:28:44', 0, NULL, NULL, NULL),
(1930, 'user', 1928, 200, '2017-09-27 00:28:44', 0, NULL, NULL, NULL),
(1931, 'user', 1929, 200, '2017-09-27 00:28:45', 0, NULL, NULL, NULL),
(1932, 'user', 1930, 200, '2017-09-27 00:28:45', 0, NULL, NULL, NULL),
(1933, 'user', 1931, 200, '2017-09-27 00:28:45', 0, NULL, NULL, NULL),
(1934, 'user', 1932, 200, '2017-09-27 00:28:45', 0, NULL, NULL, NULL),
(1935, 'user', 1933, 200, '2017-09-27 00:28:45', 0, NULL, NULL, NULL),
(1936, 'user', 1934, 200, '2017-09-27 00:28:45', 0, NULL, NULL, NULL),
(1937, 'user', 1935, 200, '2017-09-27 00:28:45', 0, NULL, NULL, NULL),
(1938, 'user', 1936, 200, '2017-09-27 00:28:45', 0, NULL, NULL, NULL),
(1939, 'user', 1937, 200, '2017-09-27 00:28:45', 0, NULL, NULL, NULL),
(1940, 'user', 1938, 201, '2017-09-27 00:30:10', 0, NULL, NULL, NULL),
(1941, 'user', 1939, 201, '2017-09-27 00:30:10', 0, NULL, NULL, NULL),
(1942, 'user', 1940, 201, '2017-09-27 00:30:10', 0, NULL, NULL, NULL),
(1943, 'user', 1941, 201, '2017-09-27 00:30:10', 0, NULL, NULL, NULL),
(1944, 'user', 1942, 201, '2017-09-27 00:30:10', 0, NULL, NULL, NULL),
(1945, 'user', 1943, 201, '2017-09-27 00:30:10', 0, NULL, NULL, NULL),
(1946, 'user', 1944, 201, '2017-09-27 00:30:10', 0, NULL, NULL, NULL),
(1947, 'user', 1945, 201, '2017-09-27 00:30:10', 0, NULL, NULL, NULL),
(1948, 'user', 1946, 201, '2017-09-27 00:30:10', 0, NULL, NULL, NULL),
(1949, 'user', 1947, 201, '2017-09-27 00:30:10', 0, NULL, NULL, NULL),
(1950, 'user', 1948, 201, '2017-09-27 00:30:10', 0, NULL, NULL, NULL),
(1951, 'user', 1949, 201, '2017-09-27 00:30:10', 0, NULL, NULL, NULL),
(1952, 'user', 1950, 202, '2017-09-27 00:31:48', 0, NULL, NULL, NULL),
(1953, 'user', 1951, 202, '2017-09-27 00:31:48', 0, NULL, NULL, NULL),
(1954, 'user', 1952, 202, '2017-09-27 00:31:48', 0, NULL, NULL, NULL),
(1955, 'user', 1953, 203, '2017-09-27 00:33:16', 0, NULL, NULL, NULL),
(1956, 'user', 1954, 203, '2017-09-27 00:33:16', 0, NULL, NULL, NULL),
(1957, 'user', 1955, 203, '2017-09-27 00:33:16', 0, NULL, NULL, NULL),
(1958, 'user', 1956, 203, '2017-09-27 00:33:16', 0, NULL, NULL, NULL),
(1959, 'user', 1957, 196, '2017-09-27 00:34:48', 0, NULL, NULL, NULL),
(1960, 'user', 1958, 204, '2017-09-27 00:35:49', 0, NULL, NULL, NULL),
(1961, 'user', 1959, 198, '2017-09-27 00:37:01', 0, NULL, NULL, NULL),
(1962, 'user', 1960, 5, '2017-10-06 14:18:24', 0, NULL, NULL, NULL),
(1963, 'user', 1961, 205, '2017-10-21 13:58:41', 0, NULL, NULL, NULL),
(1964, 'user', 1962, 205, '2017-10-21 16:11:31', 0, NULL, NULL, NULL),
(1965, 'user', 1968, NULL, '2017-12-01 08:07:49', 0, NULL, NULL, NULL),
(1966, 'user', 1969, NULL, '2017-12-01 08:16:57', 0, NULL, NULL, NULL),
(1967, 'user', 1970, NULL, '2017-12-01 08:17:01', 0, NULL, NULL, NULL),
(1968, 'user', 1971, NULL, '2017-12-01 08:17:38', 0, NULL, NULL, 20),
(1969, 'user', 1972, NULL, '2017-12-01 08:28:44', 0, NULL, NULL, 20);

-- --------------------------------------------------------

--
-- Table structure for table `group_menu`
--

CREATE TABLE `group_menu` (
  `group_menu_id` int(11) NOT NULL,
  `sub_menu_id` int(11) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  `menu_assigned_id` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `group_menu`
--

INSERT INTO `group_menu` (`group_menu_id`, `sub_menu_id`, `group_id`, `menu_assigned_id`, `status`) VALUES
(3, 25, 32, 279, 0),
(4, 45, 32, 279, 0),
(5, 40, 32, 286, 0),
(6, 44, 32, 288, 0),
(7, 11, 32, 274, 0),
(8, 38, 32, 274, 0),
(9, 12, 32, 275, 0),
(10, 8, 32, 273, 0),
(11, 28, 32, 273, 0),
(12, 29, 32, 273, 0),
(13, 36, 32, 281, 0),
(14, 16, 32, 278, 0),
(15, 17, 32, 278, 0),
(16, 20, 32, 278, 0),
(17, 21, 32, 278, 0),
(18, 5, 32, 277, 0),
(19, 15, 32, 277, 0),
(20, 39, 32, 285, 0),
(21, 43, 32, 285, 0),
(22, 33, 32, 282, 0),
(24, 34, 32, 282, 0),
(25, 42, 32, 287, 0),
(26, 7, 32, 272, 0),
(27, 18, 32, 272, 0),
(28, 6, 32, 271, 0),
(29, 19, 32, 271, 0),
(30, 26, 32, 269, 0),
(31, 27, 32, 269, 0),
(32, 37, 32, 284, 0),
(33, 13, 32, 276, 0),
(34, 30, 32, 280, 0),
(35, 31, 32, 280, 0),
(36, 35, 32, 283, 0),
(38, 4, 32, 270, 0),
(39, 14, 32, 270, 0),
(40, 7, 37, 304, 0),
(41, 18, 37, 304, 0),
(42, 4, 37, 313, 0),
(43, 14, 37, 313, 0),
(44, 13, 37, 311, 0),
(45, 33, 37, 310, 0),
(46, 34, 37, 310, 0),
(47, 42, 37, 309, 0),
(48, 16, 37, 308, 0),
(49, 17, 37, 308, 0),
(50, 21, 37, 308, 0),
(51, 20, 37, 308, 0),
(52, 5, 37, 307, 0),
(53, 15, 37, 307, 0),
(55, 28, 37, 306, 0),
(56, 29, 37, 306, 0),
(57, 6, 37, 305, 0),
(58, 19, 37, 305, 0),
(59, 22, 4, 56, 0),
(60, 23, 4, 56, 0),
(61, 24, 4, 57, 0),
(62, 46, 32, 286, 0),
(63, 47, 32, 286, 0),
(64, 6, 36, 314, 0),
(65, 40, 36, 315, 0),
(66, 46, 36, 315, 0),
(67, 47, 36, 315, 0),
(68, 48, 32, 286, 0),
(69, 48, 36, 315, 0),
(70, 49, 36, 315, 0),
(71, 49, 32, 286, 0),
(72, 39, 37, 322, 0),
(73, 43, 37, 322, 0),
(74, 30, 37, 318, 0),
(75, 31, 37, 318, 0),
(76, 36, 37, 320, 0),
(77, 46, 37, 319, 0),
(78, 47, 37, 319, 0),
(79, 48, 37, 319, 0),
(80, 49, 37, 319, 0),
(81, 12, 37, 317, 0),
(82, 11, 37, 316, 0),
(83, 38, 37, 316, 0),
(84, 37, 37, 321, 0),
(85, 44, 37, 323, 0),
(86, 50, 32, 278, 0),
(87, 52, 32, 271, 0),
(88, 55, 32, 277, 0),
(89, 26, 37, 324, 0),
(90, 27, 37, 324, 0),
(91, 51, 37, 324, 0),
(92, 51, 32, 269, 0),
(93, 56, 32, 273, 0),
(94, 57, 37, 319, 0),
(95, 57, 32, 286, 0);

-- --------------------------------------------------------

--
-- Table structure for table `group_messages`
--

CREATE TABLE `group_messages` (
  `group_message_id` int(11) NOT NULL,
  `message` varchar(1000) DEFAULT NULL,
  `student_student_id` int(11) DEFAULT NULL,
  `group_group_id` int(11) DEFAULT NULL,
  `_when_added` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `group_messages`
--

INSERT INTO `group_messages` (`group_message_id`, `message`, `student_student_id`, `group_group_id`, `_when_added`) VALUES
(1, 'Hello colleagues any one who knows what lectures are running on Friday for our class', 1960, 5, '2017-10-06'),
(2, 'And hello People', 616, 49, '2017-10-06'),
(3, 'how are you there?', 616, 49, '2017-10-06'),
(4, 'Hello everybody ðŸ‘‹', 412, 22, '2017-10-06'),
(5, 'hey', 1962, 205, '2017-10-21');

-- --------------------------------------------------------

--
-- Table structure for table `group_users`
--

CREATE TABLE `group_users` (
  `id` int(11) NOT NULL,
  `group` int(11) DEFAULT NULL,
  `user` int(11) DEFAULT NULL,
  `_when_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `_who_added` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `group_users`
--

INSERT INTO `group_users` (`id`, `group`, `user`, `_when_added`, `_who_added`) VALUES
(2, 32, 20, '2017-12-18 13:09:52', 10),
(4, 32, 10, '2017-12-18 13:47:03', 10),
(5, 4, 4, '2017-12-18 19:25:33', NULL),
(6, 34, 19, '2017-12-21 09:03:19', 20);

-- --------------------------------------------------------

--
-- Table structure for table `intakes`
--

CREATE TABLE `intakes` (
  `intake_id` int(11) NOT NULL,
  `intake_name` varchar(100) DEFAULT NULL,
  `_when_added` date DEFAULT NULL,
  `_who_added` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT '0',
  `university_university_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `intakes`
--

INSERT INTO `intakes` (`intake_id`, `intake_name`, `_when_added`, `_who_added`, `status`, `university_university_id`) VALUES
(1, 'JANUARY 2015', '2017-09-23', 10, 0, 2),
(2, 'MAY 2015', '2017-09-22', 10, 0, 2),
(4, 'MAY 2016', '2017-09-22', 10, 0, 2),
(5, 'MAY 2017', '2017-09-22', 10, 0, 2),
(6, 'MAY 2013', '2017-09-23', 10, 0, 2),
(7, 'SEPTEMBER 2013', '2017-09-23', 10, 0, 2),
(8, 'MAY 2014', '2017-09-23', 10, 0, 2),
(9, 'SEPTEMBER 2014', '2017-09-23', 10, 0, 2),
(10, 'SEPTEMBER 2015 ', '2017-09-23', 10, 0, 2),
(11, 'JANUARY 2016 ', '2017-09-23', 10, 0, 2),
(12, 'SEPTEMBER 2016', '2017-09-23', 10, 0, 2),
(13, 'SEPTEMBER 2017', '2017-09-23', 10, 0, 2),
(14, 'JANUARY 2014', '2017-09-23', 10, 0, 2),
(15, 'JANUARY 2017', '2017-09-23', 10, 0, 2),
(16, 'JANUARY 2018', '2017-09-23', 10, 0, 2);

-- --------------------------------------------------------

--
-- Table structure for table `marks`
--

CREATE TABLE `marks` (
  `marks_id` int(11) NOT NULL,
  `reg_number` varchar(100) DEFAULT NULL,
  `CW` int(11) DEFAULT NULL,
  `EX` int(11) DEFAULT NULL,
  `FN` int(11) DEFAULT NULL,
  `mark` int(45) DEFAULT NULL,
  `course_unit` varchar(100) NOT NULL,
  `course_course_id` int(11) DEFAULT NULL,
  `semesters_semester_id` int(11) NOT NULL,
  `academic_years_year_id` int(11) NOT NULL,
  `university_university_id` int(11) DEFAULT NULL,
  `_when_added` date NOT NULL,
  `_who_added` int(11) NOT NULL,
  `_status` int(11) NOT NULL DEFAULT '0' COMMENT '1 retaken,0 normal progress'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `marks`
--

INSERT INTO `marks` (`marks_id`, `reg_number`, `CW`, `EX`, `FN`, `mark`, `course_unit`, `course_course_id`, `semesters_semester_id`, `academic_years_year_id`, `university_university_id`, `_when_added`, `_who_added`, `_status`) VALUES
(1, 'JAN15U01769', NULL, NULL, NULL, 87, 'CF 301', 10, 2, 3, 2, '2017-10-05', 10, 0),
(2, 'JAN15U01769', NULL, NULL, NULL, 76, 'CS 303', 10, 2, 3, 2, '2017-10-05', 10, 0),
(3, 'JAN15U01769', NULL, NULL, NULL, 80, 'IS 306', 10, 2, 3, 2, '2017-10-05', 10, 0),
(4, 'JAN15U01769', NULL, NULL, NULL, NULL, 'NW 301', 10, 2, 3, 2, '2017-10-05', 10, 0),
(5, 'JAN15U01769', NULL, NULL, NULL, 65, 'PP 305', 10, 2, 3, 2, '2017-10-05', 10, 0),
(6, 'JAN15U01769', NULL, NULL, NULL, NULL, 'TM 301', 10, 2, 3, 2, '2017-10-05', 10, 0),
(7, 'JAN15U01769', NULL, NULL, NULL, 81, 'TM 300', 10, 2, 3, 2, '2017-10-05', 10, 0),
(8, 'JAN15U01172', NULL, NULL, NULL, 81, 'CF 301', 10, 2, 3, 2, '2017-10-05', 10, 0),
(9, 'JAN15U01172', NULL, NULL, NULL, NULL, 'CS 303', 10, 2, 3, 2, '2017-10-05', 10, 0),
(10, 'JAN15U01172', NULL, NULL, NULL, 82, 'IS 306', 10, 2, 3, 2, '2017-10-05', 10, 0),
(11, 'JAN15U01172', NULL, NULL, NULL, 89, 'NW 301', 10, 2, 3, 2, '2017-10-05', 10, 0),
(12, 'JAN15U01172', NULL, NULL, NULL, 84, 'PP 305', 10, 2, 3, 2, '2017-10-05', 10, 0),
(13, 'JAN15U01172', NULL, NULL, NULL, NULL, 'TM 301', 10, 2, 3, 2, '2017-10-05', 10, 0),
(14, 'JAN15U01172', NULL, NULL, NULL, NULL, 'TM 300', 10, 2, 3, 2, '2017-10-05', 10, 0),
(15, 'JAN15U01063', NULL, NULL, NULL, 81, 'CF 301', 10, 2, 3, 2, '2017-10-05', 10, 0),
(16, 'JAN15U01063', NULL, NULL, NULL, 86, 'CS 303', 10, 2, 3, 2, '2017-10-05', 10, 0),
(17, 'JAN15U01063', NULL, NULL, NULL, 80, 'IS 306', 10, 2, 3, 2, '2017-10-05', 10, 0),
(18, 'JAN15U01063', NULL, NULL, NULL, NULL, 'NW 301', 10, 2, 3, 2, '2017-10-05', 10, 0),
(19, 'JAN15U01063', NULL, NULL, NULL, 67, 'PP 305', 10, 2, 3, 2, '2017-10-05', 10, 0),
(20, 'JAN15U01063', NULL, NULL, NULL, NULL, 'TM 301', 10, 2, 3, 2, '2017-10-05', 10, 0),
(21, 'JAN15U01063', NULL, NULL, NULL, NULL, 'TM 300', 10, 2, 3, 2, '2017-10-05', 10, 0),
(22, 'JAN15U02003', NULL, NULL, NULL, 77, 'CF 301', 10, 2, 3, 2, '2017-10-05', 10, 0),
(23, 'JAN15U02003', NULL, NULL, NULL, NULL, 'CS 303', 10, 2, 3, 2, '2017-10-05', 10, 0),
(24, 'JAN15U02003', NULL, NULL, NULL, 71, 'IS 306', 10, 2, 3, 2, '2017-10-05', 10, 0),
(25, 'JAN15U02003', NULL, NULL, NULL, 77, 'NW 301', 10, 2, 3, 2, '2017-10-05', 10, 0),
(26, 'JAN15U02003', NULL, NULL, NULL, 66, 'PP 305', 10, 2, 3, 2, '2017-10-05', 10, 0),
(27, 'JAN15U02003', NULL, NULL, NULL, NULL, 'TM 301', 10, 2, 3, 2, '2017-10-05', 10, 0),
(28, 'JAN15U02003', NULL, NULL, NULL, NULL, 'TM 300', 10, 2, 3, 2, '2017-10-05', 10, 0),
(29, 'JAN14U00197', NULL, NULL, NULL, 70, 'CF 301', 10, 2, 3, 2, '2017-10-05', 10, 0),
(30, 'JAN14U00197', NULL, NULL, NULL, 67, 'CS 303', 10, 2, 3, 2, '2017-10-05', 10, 0),
(31, 'JAN14U00197', NULL, NULL, NULL, 65, 'IS 306', 10, 2, 3, 2, '2017-10-05', 10, 0),
(32, 'JAN14U00197', NULL, NULL, NULL, NULL, 'NW 301', 10, 2, 3, 2, '2017-10-05', 10, 0),
(33, 'JAN14U00197', NULL, NULL, NULL, 65, 'PP 305', 10, 2, 3, 2, '2017-10-05', 10, 0),
(34, 'JAN14U00197', NULL, NULL, NULL, NULL, 'TM 301', 10, 2, 3, 2, '2017-10-05', 10, 0),
(35, 'JAN14U00197', NULL, NULL, NULL, NULL, 'TM 300', 10, 2, 3, 2, '2017-10-05', 10, 0),
(36, 'JAN15U02007', NULL, NULL, NULL, NULL, 'CF 301', 10, 2, 3, 2, '2017-10-05', 10, 0),
(37, 'JAN15U02007', NULL, NULL, NULL, 76, 'CS 303', 10, 2, 3, 2, '2017-10-05', 10, 0),
(38, 'JAN15U02007', NULL, NULL, NULL, 74, 'IS 306', 10, 2, 3, 2, '2017-10-05', 10, 0),
(39, 'JAN15U02007', NULL, NULL, NULL, 78, 'NW 301', 10, 2, 3, 2, '2017-10-05', 10, 0),
(40, 'JAN15U02007', NULL, NULL, NULL, 73, 'PP 305', 10, 2, 3, 2, '2017-10-05', 10, 0),
(41, 'JAN15U02007', NULL, NULL, NULL, NULL, 'TM 301', 10, 2, 3, 2, '2017-10-05', 10, 0),
(42, 'JAN15U02007', NULL, NULL, NULL, NULL, 'TM 300', 10, 2, 3, 2, '2017-10-05', 10, 0),
(43, 'JAN15U02120', NULL, NULL, NULL, 81, 'CF 301', 10, 2, 3, 2, '2017-10-05', 10, 0),
(44, 'JAN15U02120', NULL, NULL, NULL, NULL, 'CS 303', 10, 2, 3, 2, '2017-10-05', 10, 0),
(45, 'JAN15U02120', NULL, NULL, NULL, 64, 'IS 306', 10, 2, 3, 2, '2017-10-05', 10, 0),
(46, 'JAN15U02120', NULL, NULL, NULL, 79, 'NW 301', 10, 2, 3, 2, '2017-10-05', 10, 0),
(47, 'JAN15U02120', NULL, NULL, NULL, 79, 'PP 305', 10, 2, 3, 2, '2017-10-05', 10, 0),
(48, 'JAN15U02120', NULL, NULL, NULL, NULL, 'TM 301', 10, 2, 3, 2, '2017-10-05', 10, 0),
(49, 'JAN15U02120', NULL, NULL, NULL, NULL, 'TM 300', 10, 2, 3, 2, '2017-10-05', 10, 0),
(50, 'JAN15U01171', NULL, NULL, NULL, 75, 'CF 301', 10, 2, 3, 2, '2017-10-05', 10, 0),
(51, 'JAN15U01171', NULL, NULL, NULL, NULL, 'CS 303', 10, 2, 3, 2, '2017-10-05', 10, 0),
(52, 'JAN15U01171', NULL, NULL, NULL, 73, 'IS 306', 10, 2, 3, 2, '2017-10-05', 10, 0),
(53, 'JAN15U01171', NULL, NULL, NULL, 83, 'NW 301', 10, 2, 3, 2, '2017-10-05', 10, 0),
(54, 'JAN15U01171', NULL, NULL, NULL, 67, 'PP 305', 10, 2, 3, 2, '2017-10-05', 10, 0),
(55, 'JAN15U01171', NULL, NULL, NULL, NULL, 'TM 301', 10, 2, 3, 2, '2017-10-05', 10, 0),
(56, 'JAN15U01171', NULL, NULL, NULL, 65, 'TM 300', 10, 2, 3, 2, '2017-10-05', 10, 0),
(57, 'JAN15U02006', NULL, NULL, NULL, 74, 'CF 301', 10, 2, 3, 2, '2017-10-05', 10, 0),
(58, 'JAN15U02006', NULL, NULL, NULL, NULL, 'CS 303', 10, 2, 3, 2, '2017-10-05', 10, 0),
(59, 'JAN15U02006', NULL, NULL, NULL, 72, 'IS 306', 10, 2, 3, 2, '2017-10-05', 10, 0),
(60, 'JAN15U02006', NULL, NULL, NULL, 75, 'NW 301', 10, 2, 3, 2, '2017-10-05', 10, 0),
(61, 'JAN15U02006', NULL, NULL, NULL, 66, 'PP 305', 10, 2, 3, 2, '2017-10-05', 10, 0),
(62, 'JAN15U02006', NULL, NULL, NULL, NULL, 'TM 301', 10, 2, 3, 2, '2017-10-05', 10, 0),
(63, 'JAN15U02006', NULL, NULL, NULL, 84, 'TM 300', 10, 2, 3, 2, '2017-10-05', 10, 0),
(64, 'JAN15U00661', NULL, NULL, NULL, 73, 'CF 301', 10, 2, 3, 2, '2017-10-05', 10, 0),
(65, 'JAN15U00661', NULL, NULL, NULL, NULL, 'CS 303', 10, 2, 3, 2, '2017-10-05', 10, 0),
(66, 'JAN15U00661', NULL, NULL, NULL, NULL, 'IS 306', 10, 2, 3, 2, '2017-10-05', 10, 0),
(67, 'JAN15U00661', NULL, NULL, NULL, 74, 'NW 301', 10, 2, 3, 2, '2017-10-05', 10, 0),
(68, 'JAN15U00661', NULL, NULL, NULL, 76, 'PP 305', 10, 2, 3, 2, '2017-10-05', 10, 0),
(69, 'JAN15U00661', NULL, NULL, NULL, NULL, 'TM 301', 10, 2, 3, 2, '2017-10-05', 10, 0),
(70, 'JAN15U00661', NULL, NULL, NULL, NULL, 'TM 300', 10, 2, 3, 2, '2017-10-05', 10, 0),
(71, 'JAN15U02005', NULL, NULL, NULL, 75, 'CF 301', 10, 2, 3, 2, '2017-10-05', 10, 0),
(72, 'JAN15U02005', NULL, NULL, NULL, 71, 'CS 303', 10, 2, 3, 2, '2017-10-05', 10, 0),
(73, 'JAN15U02005', NULL, NULL, NULL, 60, 'IS 306', 10, 2, 3, 2, '2017-10-05', 10, 0),
(74, 'JAN15U02005', NULL, NULL, NULL, NULL, 'NW 301', 10, 2, 3, 2, '2017-10-05', 10, 0),
(75, 'JAN15U02005', NULL, NULL, NULL, 54, 'PP 305', 10, 2, 3, 2, '2017-10-05', 10, 0),
(76, 'JAN15U02005', NULL, NULL, NULL, NULL, 'TM 301', 10, 2, 3, 2, '2017-10-05', 10, 0),
(77, 'JAN15U02005', NULL, NULL, NULL, NULL, 'TM 300', 10, 2, 3, 2, '2017-10-05', 10, 0),
(78, 'JAN15U02001', NULL, NULL, NULL, 74, 'CF 301', 10, 2, 3, 2, '2017-10-05', 10, 0),
(79, 'JAN15U02001', NULL, NULL, NULL, NULL, 'CS 303', 10, 2, 3, 2, '2017-10-05', 10, 0),
(80, 'JAN15U02001', NULL, NULL, NULL, 73, 'IS 306', 10, 2, 3, 2, '2017-10-05', 10, 0),
(81, 'JAN15U02001', NULL, NULL, NULL, 59, 'NW 301', 10, 2, 3, 2, '2017-10-05', 10, 0),
(82, 'JAN15U02001', NULL, NULL, NULL, 58, 'PP 305', 10, 2, 3, 2, '2017-10-05', 10, 0),
(83, 'JAN15U02001', NULL, NULL, NULL, NULL, 'TM 301', 10, 2, 3, 2, '2017-10-05', 10, 0),
(84, 'JAN15U02001', NULL, NULL, NULL, NULL, 'TM 300', 10, 2, 3, 2, '2017-10-05', 10, 0),
(85, 'JAN14U00227', NULL, NULL, NULL, 78, 'CF 301', 10, 2, 3, 2, '2017-10-05', 10, 1),
(86, 'JAN14U00227', NULL, NULL, NULL, 68, 'IS 306', 10, 2, 3, 2, '2017-10-05', 10, 1),
(87, 'JAN14U00227', NULL, NULL, NULL, 69, 'NW 301', 10, 2, 3, 2, '2017-10-05', 10, 1),
(88, 'JAN14U00227', NULL, NULL, NULL, 67, 'PP 305', 10, 2, 3, 2, '2017-10-05', 10, 1),
(89, 'SEP13U00133', NULL, NULL, NULL, 76, 'CF 301', 10, 2, 3, 2, '2017-10-05', 10, 1),
(90, 'SEP13U00133', NULL, NULL, NULL, 65, 'CS 303', 10, 2, 3, 2, '2017-10-05', 10, 1),
(91, 'SEP13U00133', NULL, NULL, NULL, 65, 'IS 306', 10, 2, 3, 2, '2017-10-05', 10, 1),
(92, 'SEP13U00133', NULL, NULL, NULL, 81, 'PP 305', 10, 2, 3, 2, '2017-10-05', 10, 1),
(93, 'SEP13U00204', NULL, NULL, NULL, 62, 'PP 305', 10, 2, 3, 2, '2017-10-05', 10, 1),
(94, 'SEP14U00240', NULL, NULL, NULL, 24, 'PP 305', 10, 2, 3, 2, '2017-10-05', 10, 1),
(95, 'SEP13U00162', NULL, NULL, NULL, 52, 'NW 301', 10, 2, 3, 2, '2017-10-05', 10, 1),
(96, 'SEP14U01867', NULL, NULL, NULL, 74, 'CF 301', 10, 2, 3, 2, '2017-10-05', 10, 1),
(97, 'SEP14U01867', NULL, NULL, NULL, 41, 'NW 301', 10, 2, 3, 2, '2017-10-05', 10, 1),
(98, 'SEP14U01867', NULL, NULL, NULL, 41, 'PP 305', 10, 2, 3, 2, '2017-10-05', 10, 1),
(99, 'SEP13U00128', NULL, NULL, NULL, 56, 'IS 306', 10, 2, 3, 2, '2017-10-05', 10, 1),
(100, 'SEP15U02062', NULL, NULL, NULL, 75, 'CF 301', 10, 2, 3, 2, '2017-10-05', 10, 1),
(101, 'SEP15U02062', NULL, NULL, NULL, 80, 'CS 303', 10, 2, 3, 2, '2017-10-05', 10, 1),
(102, 'JAN16/U/129', NULL, NULL, NULL, 80, 'IS 200', 10, 2, 2, 2, '2017-10-05', 10, 0),
(103, 'JAN16/U/129', NULL, NULL, NULL, 71, 'IS 301', 10, 2, 2, 2, '2017-10-05', 10, 0),
(104, 'JAN16/U/129', NULL, NULL, NULL, 72, 'IS 302', 10, 2, 2, 2, '2017-10-05', 10, 0),
(105, 'JAN16/U/129', NULL, NULL, NULL, NULL, 'IS 303', 10, 2, 2, 2, '2017-10-05', 10, 0),
(106, 'JAN16/U/129', NULL, NULL, NULL, 79, 'IT 200', 10, 2, 2, 2, '2017-10-05', 10, 0),
(107, 'JAN16/U/129', NULL, NULL, NULL, 55, 'TM 201', 10, 2, 2, 2, '2017-10-05', 10, 0),
(108, 'JAN16/U/129', NULL, NULL, NULL, 76, 'TM 200', 10, 2, 2, 2, '2017-10-05', 10, 0),
(109, 'JAN16/U/136', NULL, NULL, NULL, 76, 'IS 200', 10, 2, 2, 2, '2017-10-05', 10, 0),
(110, 'JAN16/U/136', NULL, NULL, NULL, 81, 'IS 301', 10, 2, 2, 2, '2017-10-05', 10, 0),
(111, 'JAN16/U/136', NULL, NULL, NULL, 71, 'IS 302', 10, 2, 2, 2, '2017-10-05', 10, 0),
(112, 'JAN16/U/136', NULL, NULL, NULL, NULL, 'IS 303', 10, 2, 2, 2, '2017-10-05', 10, 0),
(113, 'JAN16/U/136', NULL, NULL, NULL, 91, 'IT 200', 10, 2, 2, 2, '2017-10-05', 10, 0),
(114, 'JAN16/U/136', NULL, NULL, NULL, 62, 'TM 201', 10, 2, 2, 2, '2017-10-05', 10, 0),
(115, 'JAN16/U/136', NULL, NULL, NULL, NULL, 'TM 200', 10, 2, 2, 2, '2017-10-05', 10, 0),
(116, 'JAN16/U/134', NULL, NULL, NULL, 50, 'IS 200', 10, 2, 2, 2, '2017-10-05', 10, 0),
(117, 'JAN16/U/134', NULL, NULL, NULL, 65, 'IS 301', 10, 2, 2, 2, '2017-10-05', 10, 0),
(118, 'JAN16/U/134', NULL, NULL, NULL, NULL, 'IS 302', 10, 2, 2, 2, '2017-10-05', 10, 0),
(119, 'JAN16/U/134', NULL, NULL, NULL, NULL, 'IS 303', 10, 2, 2, 2, '2017-10-05', 10, 0),
(120, 'JAN16/U/134', NULL, NULL, NULL, 51, 'IT 200', 10, 2, 2, 2, '2017-10-05', 10, 0),
(121, 'JAN16/U/134', NULL, NULL, NULL, NULL, 'TM 201', 10, 2, 2, 2, '2017-10-05', 10, 0),
(122, 'JAN16/U/134', NULL, NULL, NULL, 72, 'TM 200', 10, 2, 2, 2, '2017-10-05', 10, 0),
(123, 'JAN15U02005', NULL, NULL, NULL, 67, 'TM 201', 10, 2, 2, 2, '2017-10-05', 10, 1),
(124, 'JAN17/U/153', NULL, NULL, NULL, 75, 'IS 302', 10, 2, 2, 2, '2017-10-05', 10, 1),
(125, 'JAN17/U/153', NULL, NULL, NULL, 69, 'IT 200', 10, 2, 2, 2, '2017-10-05', 10, 1),
(126, 'JAN17/U/153', NULL, NULL, NULL, 70, 'TM 201', 10, 2, 2, 2, '2017-10-05', 10, 1),
(127, 'SEP15U02051', NULL, NULL, NULL, 66, 'IS 200', 10, 2, 2, 2, '2017-10-05', 10, 1),
(128, 'MAY16/U/007', NULL, NULL, NULL, 71, 'IS 200', 10, 2, 2, 2, '2017-10-05', 10, 1),
(129, 'MAY16/U/007', NULL, NULL, NULL, 70, 'IS 302', 10, 2, 2, 2, '2017-10-05', 10, 1),
(130, 'MAY16/U/007', NULL, NULL, NULL, 82, 'IT 200', 10, 2, 2, 2, '2017-10-05', 10, 1),
(131, 'SEP15U02018', NULL, NULL, NULL, 62, 'IS 200', 10, 2, 2, 2, '2017-10-05', 10, 1),
(132, 'SEP15U02018', NULL, NULL, NULL, 70, 'IS 302', 10, 2, 2, 2, '2017-10-05', 10, 1),
(133, 'SEP15U02018', NULL, NULL, NULL, 67, 'IT 200', 10, 2, 2, 2, '2017-10-05', 10, 1),
(134, 'SEP15U02018', NULL, NULL, NULL, 55, 'TM 201', 10, 2, 2, 2, '2017-10-05', 10, 1),
(135, 'JAN17/U/152', NULL, NULL, NULL, 69, 'IS 302', 10, 2, 2, 2, '2017-10-05', 10, 1),
(136, 'JAN17/U/152', NULL, NULL, NULL, 72, 'IT 200', 10, 2, 2, 2, '2017-10-05', 10, 1),
(137, 'SEP13U00128', NULL, NULL, NULL, 67, 'IS 200', 10, 2, 2, 2, '2017-10-05', 10, 1),
(138, 'JAN14U00212', NULL, NULL, NULL, 51, 'TM 201', 10, 2, 2, 2, '2017-10-05', 10, 1),
(139, 'SEP14U01987', NULL, NULL, NULL, 50, 'TM 201', 10, 2, 2, 2, '2017-10-05', 10, 1),
(140, 'SEP15U02059', NULL, NULL, NULL, 22, 'IT 200', 10, 2, 2, 2, '2017-10-05', 10, 1),
(141, 'JAN15U01371', NULL, NULL, NULL, 81, 'CF 300', 1, 1, 3, 2, '2017-10-05', 10, 0),
(142, 'JAN15U01371', NULL, NULL, NULL, 83, 'CS 300', 1, 1, 3, 2, '2017-10-05', 10, 0),
(143, 'JAN15U01371', NULL, NULL, NULL, 81, 'CS 301', 1, 1, 3, 2, '2017-10-05', 10, 0),
(144, 'JAN15U01371', NULL, NULL, NULL, NULL, 'IT 201', 1, 1, 3, 2, '2017-10-05', 10, 0),
(145, 'JAN15U01371', NULL, NULL, NULL, 87, 'IT 203', 1, 1, 3, 2, '2017-10-05', 10, 0),
(146, 'JAN15U01371', NULL, NULL, NULL, 70, 'NW 201', 1, 1, 3, 2, '2017-10-05', 10, 0),
(147, 'JAN15U01173', NULL, NULL, NULL, 83, 'CF 300', 1, 1, 3, 2, '2017-10-05', 10, 0),
(148, 'JAN15U01173', NULL, NULL, NULL, 81, 'CS 300', 1, 1, 3, 2, '2017-10-05', 10, 0),
(149, 'JAN15U01173', NULL, NULL, NULL, 85, 'CS 301', 1, 1, 3, 2, '2017-10-05', 10, 0),
(150, 'JAN15U01173', NULL, NULL, NULL, NULL, 'IT 201', 1, 1, 3, 2, '2017-10-05', 10, 0),
(151, 'JAN15U01173', NULL, NULL, NULL, 82, 'IT 203', 1, 1, 3, 2, '2017-10-05', 10, 0),
(152, 'JAN15U01173', NULL, NULL, NULL, 80, 'NW 201', 1, 1, 3, 2, '2017-10-05', 10, 0),
(153, 'MAY15U00068', NULL, NULL, NULL, 79, 'CF 300', 1, 1, 3, 2, '2017-10-05', 10, 0),
(154, 'MAY15U00068', NULL, NULL, NULL, 77, 'CS 300', 1, 1, 3, 2, '2017-10-05', 10, 0),
(155, 'MAY15U00068', NULL, NULL, NULL, 88, 'CS 301', 1, 1, 3, 2, '2017-10-05', 10, 0),
(156, 'MAY15U00068', NULL, NULL, NULL, NULL, 'IT 201', 1, 1, 3, 2, '2017-10-05', 10, 0),
(157, 'MAY15U00068', NULL, NULL, NULL, 85, 'IT 203', 1, 1, 3, 2, '2017-10-05', 10, 0),
(158, 'MAY15U00068', NULL, NULL, NULL, 61, 'NW 201', 1, 1, 3, 2, '2017-10-05', 10, 0),
(159, 'MAY15U00071', NULL, NULL, NULL, 79, 'CF 300', 1, 1, 3, 2, '2017-10-05', 10, 0),
(160, 'MAY15U00071', NULL, NULL, NULL, 70, 'CS 300', 1, 1, 3, 2, '2017-10-05', 10, 0),
(161, 'MAY15U00071', NULL, NULL, NULL, NULL, 'CS 301', 1, 1, 3, 2, '2017-10-05', 10, 0),
(162, 'MAY15U00071', NULL, NULL, NULL, 74, 'IT 201', 1, 1, 3, 2, '2017-10-05', 10, 0),
(163, 'MAY15U00071', NULL, NULL, NULL, 82, 'IT 203', 1, 1, 3, 2, '2017-10-05', 10, 0),
(164, 'MAY15U00071', NULL, NULL, NULL, 59, 'NW 201', 1, 1, 3, 2, '2017-10-05', 10, 0),
(165, 'MAY15U00066', NULL, NULL, NULL, 83, 'CF 300', 1, 1, 3, 2, '2017-10-05', 10, 0),
(166, 'MAY15U00066', NULL, NULL, NULL, 61, 'CS 300', 1, 1, 3, 2, '2017-10-05', 10, 0),
(167, 'MAY15U00066', NULL, NULL, NULL, 86, 'CS 301', 1, 1, 3, 2, '2017-10-05', 10, 0),
(168, 'MAY15U00066', NULL, NULL, NULL, NULL, 'IT 201', 1, 1, 3, 2, '2017-10-05', 10, 0),
(169, 'MAY15U00066', NULL, NULL, NULL, 76, 'IT 203', 1, 1, 3, 2, '2017-10-05', 10, 0),
(170, 'MAY15U00066', NULL, NULL, NULL, 60, 'NW 201', 1, 1, 3, 2, '2017-10-05', 10, 0),
(171, 'MAY15U00067', NULL, NULL, NULL, NULL, 'CF 300', 1, 1, 3, 2, '2017-10-05', 10, 0),
(172, 'MAY15U00067', NULL, NULL, NULL, 60, 'CS 300', 1, 1, 3, 2, '2017-10-05', 10, 0),
(173, 'MAY15U00067', NULL, NULL, NULL, 61, 'CS 301', 1, 1, 3, 2, '2017-10-05', 10, 0),
(174, 'MAY15U00067', NULL, NULL, NULL, NULL, 'IT 201', 1, 1, 3, 2, '2017-10-05', 10, 0),
(175, 'MAY15U00067', NULL, NULL, NULL, 77, 'IT 203', 1, 1, 3, 2, '2017-10-05', 10, 0),
(176, 'MAY15U00067', NULL, NULL, NULL, 35, 'NW 201', 1, 1, 3, 2, '2017-10-05', 10, 0),
(177, 'MAY15U01174', NULL, NULL, NULL, 72, 'CF 300', 1, 1, 3, 2, '2017-10-05', 10, 0),
(178, 'MAY15U01174', NULL, NULL, NULL, 65, 'CS 300', 1, 1, 3, 2, '2017-10-05', 10, 0),
(179, 'MAY15U01174', NULL, NULL, NULL, 72, 'CS 301', 1, 1, 3, 2, '2017-10-05', 10, 0),
(180, 'MAY15U01174', NULL, NULL, NULL, NULL, 'IT 201', 1, 1, 3, 2, '2017-10-05', 10, 0),
(181, 'MAY15U01174', NULL, NULL, NULL, 66, 'IT 203', 1, 1, 3, 2, '2017-10-05', 10, 0),
(182, 'MAY15U01174', NULL, NULL, NULL, 35, 'NW 201', 1, 1, 3, 2, '2017-10-05', 10, 0),
(183, 'SEP13U00009', NULL, NULL, NULL, 40, 'NW 201', 1, 1, 3, 2, '2017-10-05', 10, 1),
(184, 'JAN15U00065', NULL, NULL, NULL, 63, 'CS 300', 1, 1, 3, 2, '2017-10-05', 10, 1),
(185, 'JAN15U00065', NULL, NULL, NULL, 52, 'NW 201', 1, 1, 3, 2, '2017-10-05', 10, 1),
(186, 'SEP13U00019', NULL, NULL, NULL, 65, 'NW 201', 1, 1, 3, 2, '2017-10-05', 10, 1),
(187, 'SEP14U01368', NULL, NULL, NULL, 55, 'CS 300', 1, 1, 3, 2, '2017-10-05', 10, 1),
(188, 'SEP14U01368', NULL, NULL, NULL, 56, 'NW 201', 1, 1, 3, 2, '2017-10-05', 10, 1),
(189, 'MAY13U00007', NULL, NULL, NULL, 64, 'IT 201', 1, 1, 3, 2, '2017-10-05', 10, 1),
(190, 'MAY13U00007', NULL, NULL, NULL, 85, 'NW 201', 1, 1, 3, 2, '2017-10-05', 10, 1),
(191, 'SEP14U01061', NULL, NULL, NULL, 57, 'CS 300', 1, 1, 3, 2, '2017-10-05', 10, 1),
(192, 'SEP13U00022', NULL, NULL, NULL, 88, 'CS 300', 1, 1, 3, 2, '2017-10-05', 10, 1),
(193, 'SEP13U00022', NULL, NULL, NULL, 73, 'NW 201', 1, 1, 3, 2, '2017-10-05', 10, 1),
(194, 'JAN16/U/109', NULL, NULL, NULL, 76, 'CF 300', 1, 1, 3, 2, '2017-10-05', 10, 1),
(195, 'JAN16/U/109', NULL, NULL, NULL, 84, 'CS 300', 1, 1, 3, 2, '2017-10-05', 10, 1),
(196, 'JAN16/U/109', NULL, NULL, NULL, 82, 'CS 301', 1, 1, 3, 2, '2017-10-05', 10, 1),
(197, 'JAN16/U/109', NULL, NULL, NULL, 79, 'IT 203', 1, 1, 3, 2, '2017-10-05', 10, 1),
(198, 'JAN16/U/109', NULL, NULL, NULL, 81, 'NW 201', 1, 1, 3, 2, '2017-10-05', 10, 1),
(199, 'MAY15U02030', NULL, NULL, NULL, 78, 'BA 219', 10, 1, 3, 2, '2017-10-05', 10, 0),
(200, 'MAY15U02030', NULL, NULL, NULL, NULL, 'CS 301', 10, 1, 3, 2, '2017-10-05', 10, 0),
(201, 'MAY15U02030', NULL, NULL, NULL, 80, 'IS 202', 10, 1, 3, 2, '2017-10-05', 10, 0),
(202, 'MAY15U02030', NULL, NULL, NULL, 65, 'IS 304', 10, 1, 3, 2, '2017-10-05', 10, 0),
(203, 'MAY15U02030', NULL, NULL, NULL, 82, 'IS 305', 10, 1, 3, 2, '2017-10-05', 10, 0),
(204, 'MAY15U02030', NULL, NULL, NULL, 50, 'IT 203', 10, 1, 3, 2, '2017-10-05', 10, 0),
(205, 'MAY15U02030', NULL, NULL, NULL, NULL, 'IT 300', 10, 1, 3, 2, '2017-10-05', 10, 0),
(206, 'MAY15U02030', NULL, NULL, NULL, NULL, 'NW 201', 10, 1, 3, 2, '2017-10-05', 10, 0),
(207, 'MAY15U02023', NULL, NULL, NULL, NULL, 'BA 219', 10, 1, 3, 2, '2017-10-05', 10, 0),
(208, 'MAY15U02023', NULL, NULL, NULL, 77, 'CS 301', 10, 1, 3, 2, '2017-10-05', 10, 0),
(209, 'MAY15U02023', NULL, NULL, NULL, 70, 'IS 202', 10, 1, 3, 2, '2017-10-05', 10, 0),
(210, 'MAY15U02023', NULL, NULL, NULL, 63, 'IS 304', 10, 1, 3, 2, '2017-10-05', 10, 0),
(211, 'MAY15U02023', NULL, NULL, NULL, 88, 'IS 305', 10, 1, 3, 2, '2017-10-05', 10, 0),
(212, 'MAY15U02023', NULL, NULL, NULL, 72, 'IT 203', 10, 1, 3, 2, '2017-10-05', 10, 0),
(213, 'MAY15U02023', NULL, NULL, NULL, NULL, 'IT 300', 10, 1, 3, 2, '2017-10-05', 10, 0),
(214, 'MAY15U02023', NULL, NULL, NULL, NULL, 'NW 201', 10, 1, 3, 2, '2017-10-05', 10, 0),
(215, 'MAY15U02019', NULL, NULL, NULL, NULL, 'BA 219', 10, 1, 3, 2, '2017-10-05', 10, 0),
(216, 'MAY15U02019', NULL, NULL, NULL, 76, 'CS 301', 10, 1, 3, 2, '2017-10-05', 10, 0),
(217, 'MAY15U02019', NULL, NULL, NULL, 63, 'IS 202', 10, 1, 3, 2, '2017-10-05', 10, 0),
(218, 'MAY15U02019', NULL, NULL, NULL, NULL, 'IS 304', 10, 1, 3, 2, '2017-10-05', 10, 0),
(219, 'MAY15U02019', NULL, NULL, NULL, 60, 'IS 305', 10, 1, 3, 2, '2017-10-05', 10, 0),
(220, 'MAY15U02019', NULL, NULL, NULL, 81, 'IT 203', 10, 1, 3, 2, '2017-10-05', 10, 0),
(221, 'MAY15U02019', NULL, NULL, NULL, 60, 'IT 300', 10, 1, 3, 2, '2017-10-05', 10, 0),
(222, 'MAY15U02019', NULL, NULL, NULL, NULL, 'NW 201', 10, 1, 3, 2, '2017-10-05', 10, 0),
(223, 'MAY15U02025', NULL, NULL, NULL, 77, 'BA 219', 10, 1, 3, 2, '2017-10-05', 10, 0),
(224, 'MAY15U02025', NULL, NULL, NULL, NULL, 'CS 301', 10, 1, 3, 2, '2017-10-05', 10, 0),
(225, 'MAY15U02025', NULL, NULL, NULL, 71, 'IS 202', 10, 1, 3, 2, '2017-10-05', 10, 0),
(226, 'MAY15U02025', NULL, NULL, NULL, 74, 'IS 304', 10, 1, 3, 2, '2017-10-05', 10, 0),
(227, 'MAY15U02025', NULL, NULL, NULL, NULL, 'IS 305', 10, 1, 3, 2, '2017-10-05', 10, 0),
(228, 'MAY15U02025', NULL, NULL, NULL, 80, 'IT 203', 10, 1, 3, 2, '2017-10-05', 10, 0),
(229, 'MAY15U02025', NULL, NULL, NULL, NULL, 'IT 300', 10, 1, 3, 2, '2017-10-05', 10, 0),
(230, 'MAY15U02025', NULL, NULL, NULL, NULL, 'NW 201', 10, 1, 3, 2, '2017-10-05', 10, 0),
(231, 'JAN15U02005', NULL, NULL, NULL, 51, 'NW 201', 10, 1, 3, 2, '2017-10-05', 10, 1),
(232, 'SEP14U01980', NULL, NULL, NULL, 70, 'BA 219', 10, 1, 3, 2, '2017-10-05', 10, 1),
(233, 'SEP14U01980', NULL, NULL, NULL, 72, 'IT 203', 10, 1, 3, 2, '2017-10-05', 10, 1),
(234, 'SEP16/U/047', NULL, NULL, NULL, 72, 'BA 219', 10, 1, 3, 2, '2017-10-05', 10, 1),
(235, 'SEP16/U/047', NULL, NULL, NULL, 75, 'IS 304', 10, 1, 3, 2, '2017-10-05', 10, 1),
(236, 'SEP16/U/047', NULL, NULL, NULL, 72, 'IS 305', 10, 1, 3, 2, '2017-10-05', 10, 1),
(237, 'SEP16/U/047', NULL, NULL, NULL, 81, 'IT 203', 10, 1, 3, 2, '2017-10-05', 10, 1),
(238, 'SEP15U02064', NULL, NULL, NULL, 70, 'IS 305', 10, 1, 3, 2, '2017-10-05', 10, 1),
(239, 'SEP14U01968', NULL, NULL, NULL, 67, 'BA 219', 10, 1, 3, 2, '2017-10-05', 10, 1),
(240, 'SEP14U01968', NULL, NULL, NULL, 52, 'IS 305', 10, 1, 3, 2, '2017-10-05', 10, 1),
(241, 'SEP14U01968', NULL, NULL, NULL, 69, 'IT 203', 10, 1, 3, 2, '2017-10-05', 10, 1),
(242, 'SEP13U00204', NULL, NULL, NULL, 69, 'BA 219', 10, 1, 3, 2, '2017-10-05', 10, 1),
(243, 'SEP13U00204', NULL, NULL, NULL, 77, 'IT 300', 10, 1, 3, 2, '2017-10-05', 10, 1),
(244, 'SEP13U00174', NULL, NULL, NULL, 62, 'BA 219', 10, 1, 3, 2, '2017-10-05', 10, 1),
(245, 'SEP13U00174', NULL, NULL, NULL, 70, 'IS 304', 10, 1, 3, 2, '2017-10-05', 10, 1),
(246, 'SEP13U00174', NULL, NULL, NULL, 50, 'IS 305', 10, 1, 3, 2, '2017-10-05', 10, 1),
(247, 'SEP13U00174', NULL, NULL, NULL, 73, 'IT 203', 10, 1, 3, 2, '2017-10-05', 10, 1),
(248, 'SEP14U01981', NULL, NULL, NULL, 67, 'BA 219', 10, 1, 3, 2, '2017-10-05', 10, 1),
(249, 'MAY16/U/005', NULL, NULL, NULL, 73, 'CS 301', 10, 1, 3, 2, '2017-10-05', 10, 1),
(250, 'MAY16/U/005', NULL, NULL, NULL, 88, 'IS 304', 10, 1, 3, 2, '2017-10-05', 10, 1),
(251, 'MAY16/U/005', NULL, NULL, NULL, 58, 'IS 305', 10, 1, 3, 2, '2017-10-05', 10, 1),
(252, 'MAY16/U/005', NULL, NULL, NULL, 78, 'IT 203', 10, 1, 3, 2, '2017-10-05', 10, 1),
(253, 'MAY16/U/001', NULL, NULL, NULL, 71, 'BA 219', 10, 1, 3, 2, '2017-10-05', 10, 1),
(254, 'MAY16/U/001', NULL, NULL, NULL, 59, 'CS 301', 10, 1, 3, 2, '2017-10-05', 10, 1),
(255, 'MAY16/U/001', NULL, NULL, NULL, 83, 'IS 304', 10, 1, 3, 2, '2017-10-05', 10, 1),
(256, 'MAY16/U/001', NULL, NULL, NULL, 68, 'IS 305', 10, 1, 3, 2, '2017-10-05', 10, 1),
(257, 'SEP15U02062', NULL, NULL, NULL, 66, 'IS 305', 10, 1, 3, 2, '2017-10-05', 10, 1),
(258, 'MAY16/U/005', NULL, NULL, NULL, 80, 'BA 108', 10, 1, 2, 2, '2017-10-05', 10, 0),
(259, 'MAY16/U/005', NULL, NULL, NULL, 70, 'CS 201', 10, 1, 2, 2, '2017-10-05', 10, 0),
(260, 'MAY16/U/005', NULL, NULL, NULL, 76, 'IS 300', 10, 1, 2, 2, '2017-10-05', 10, 0),
(261, 'MAY16/U/005', NULL, NULL, NULL, 64, 'IT 202', 10, 1, 2, 2, '2017-10-05', 10, 0),
(262, 'MAY16/U/005', NULL, NULL, NULL, 80, 'NW 200', 10, 1, 2, 2, '2017-10-05', 10, 0),
(263, 'MAY16/X/004', NULL, NULL, NULL, NULL, 'BA 108', 10, 1, 2, 2, '2017-10-05', 10, 0),
(264, 'MAY16/X/004', NULL, NULL, NULL, 50, 'CS 201', 10, 1, 2, 2, '2017-10-05', 10, 0),
(265, 'MAY16/X/004', NULL, NULL, NULL, NULL, 'IS 300', 10, 1, 2, 2, '2017-10-05', 10, 0),
(266, 'MAY16/X/004', NULL, NULL, NULL, NULL, 'IT 202', 10, 1, 2, 2, '2017-10-05', 10, 0),
(267, 'MAY16/X/004', NULL, NULL, NULL, 50, 'NW 200', 10, 1, 2, 2, '2017-10-05', 10, 0),
(268, 'MAY16/U/015', NULL, NULL, NULL, 75, 'BA 108', 10, 1, 2, 2, '2017-10-05', 10, 0),
(269, 'MAY16/U/015', NULL, NULL, NULL, 51, 'CS 201', 10, 1, 2, 2, '2017-10-05', 10, 0),
(270, 'MAY16/U/015', NULL, NULL, NULL, 57, 'IS 300', 10, 1, 2, 2, '2017-10-05', 10, 0),
(271, 'MAY16/U/015', NULL, NULL, NULL, NULL, 'IT 202', 10, 1, 2, 2, '2017-10-05', 10, 0),
(272, 'MAY16/U/015', NULL, NULL, NULL, 67, 'NW 200', 10, 1, 2, 2, '2017-10-05', 10, 0),
(273, 'MAY16/U/010', NULL, NULL, NULL, 65, 'BA 108', 10, 1, 2, 2, '2017-10-05', 10, 0),
(274, 'MAY16/U/010', NULL, NULL, NULL, NULL, 'CS 201', 10, 1, 2, 2, '2017-10-05', 10, 0),
(275, 'MAY16/U/010', NULL, NULL, NULL, NULL, 'IS 300', 10, 1, 2, 2, '2017-10-05', 10, 0),
(276, 'MAY16/U/010', NULL, NULL, NULL, NULL, 'IT 202', 10, 1, 2, 2, '2017-10-05', 10, 0),
(277, 'MAY16/U/010', NULL, NULL, NULL, NULL, 'NW 200', 10, 1, 2, 2, '2017-10-05', 10, 0),
(278, 'MAY16/U/002', NULL, NULL, NULL, 50, 'BA 108', 10, 1, 2, 2, '2017-10-05', 10, 0),
(279, 'MAY16/U/002', NULL, NULL, NULL, NULL, 'CS 201', 10, 1, 2, 2, '2017-10-05', 10, 0),
(280, 'MAY16/U/002', NULL, NULL, NULL, 55, 'IS 300', 10, 1, 2, 2, '2017-10-05', 10, 0),
(281, 'MAY16/U/002', NULL, NULL, NULL, NULL, 'IT 202', 10, 1, 2, 2, '2017-10-05', 10, 0),
(282, 'MAY16/U/002', NULL, NULL, NULL, NULL, 'NW 200', 10, 1, 2, 2, '2017-10-05', 10, 0),
(283, 'MAY16/U/001', NULL, NULL, NULL, 60, 'BA 108', 10, 1, 2, 2, '2017-10-05', 10, 0),
(284, 'MAY16/U/001', NULL, NULL, NULL, 60, 'CS 201', 10, 1, 2, 2, '2017-10-05', 10, 0),
(285, 'MAY16/U/001', NULL, NULL, NULL, 63, 'IS 300', 10, 1, 2, 2, '2017-10-05', 10, 0),
(286, 'MAY16/U/001', NULL, NULL, NULL, 68, 'IT 202', 10, 1, 2, 2, '2017-10-05', 10, 0),
(287, 'MAY16/U/001', NULL, NULL, NULL, 75, 'NW 200', 10, 1, 2, 2, '2017-10-05', 10, 0),
(288, 'MAY16/U/006', NULL, NULL, NULL, 79, 'BA 108', 10, 1, 2, 2, '2017-10-05', 10, 0),
(289, 'MAY16/U/006', NULL, NULL, NULL, 39, 'CS 201', 10, 1, 2, 2, '2017-10-05', 10, 0),
(290, 'MAY16/U/006', NULL, NULL, NULL, 71, 'IS 300', 10, 1, 2, 2, '2017-10-05', 10, 0),
(291, 'MAY16/U/006', NULL, NULL, NULL, NULL, 'IT 202', 10, 1, 2, 2, '2017-10-05', 10, 0),
(292, 'MAY16/U/006', NULL, NULL, NULL, 71, 'NW 200', 10, 1, 2, 2, '2017-10-05', 10, 0),
(293, 'MAY16/U/012', NULL, NULL, NULL, 74, 'BA 108', 10, 1, 2, 2, '2017-10-05', 10, 0),
(294, 'MAY16/U/012', NULL, NULL, NULL, 50, 'CS 201', 10, 1, 2, 2, '2017-10-05', 10, 0),
(295, 'MAY16/U/012', NULL, NULL, NULL, 67, 'IS 300', 10, 1, 2, 2, '2017-10-05', 10, 0),
(296, 'MAY16/U/012', NULL, NULL, NULL, NULL, 'IT 202', 10, 1, 2, 2, '2017-10-05', 10, 0),
(297, 'MAY16/U/012', NULL, NULL, NULL, 72, 'NW 200', 10, 1, 2, 2, '2017-10-05', 10, 0),
(298, 'SEP14U01994', NULL, NULL, NULL, 54, 'CS 201', 10, 1, 2, 2, '2017-10-05', 10, 1),
(299, 'SEP14U01994', NULL, NULL, NULL, 74, 'IS 300', 10, 1, 2, 2, '2017-10-05', 10, 1),
(300, 'SEP14U01980', NULL, NULL, NULL, 50, 'CS 201', 10, 1, 2, 2, '2017-10-05', 10, 1),
(301, 'SEP15U02027', NULL, NULL, NULL, 57, 'NW 200', 10, 1, 2, 2, '2017-10-05', 10, 1),
(302, 'SEP15U02051', NULL, NULL, NULL, 51, 'CS 201', 10, 1, 2, 2, '2017-10-05', 10, 1),
(303, 'SEP15U02051', NULL, NULL, NULL, 58, 'IS 300', 10, 1, 2, 2, '2017-10-05', 10, 1),
(304, 'SEP14U00249', NULL, NULL, NULL, 61, 'IS 300', 10, 1, 2, 2, '2017-10-05', 10, 1),
(305, 'SEP14U01987', NULL, NULL, NULL, 65, 'IS 300', 10, 1, 2, 2, '2017-10-05', 10, 1),
(306, 'MAY17/U/121', NULL, NULL, NULL, 86, 'BA 100', 10, 1, 1, 2, '2017-10-05', 10, 0),
(307, 'MAY17/U/121', NULL, NULL, NULL, NULL, 'BA 104', 10, 1, 1, 2, '2017-10-05', 10, 0),
(308, 'MAY17/U/121', NULL, NULL, NULL, 84, 'CS 100', 10, 1, 1, 2, '2017-10-05', 10, 0),
(309, 'MAY17/U/121', NULL, NULL, NULL, 76, 'CS 101', 10, 1, 1, 2, '2017-10-05', 10, 0),
(310, 'MAY17/U/121', NULL, NULL, NULL, 83, 'IT 100', 10, 1, 1, 2, '2017-10-05', 10, 0),
(311, 'MAY17/U/121', NULL, NULL, NULL, 90, 'MT 100', 10, 1, 1, 2, '2017-10-05', 10, 0),
(312, 'JAN17/U/150', NULL, NULL, NULL, 81, 'BA 100', 10, 1, 1, 2, '2017-10-05', 10, 0),
(313, 'JAN17/U/150', NULL, NULL, NULL, NULL, 'BA 104', 10, 1, 1, 2, '2017-10-05', 10, 0),
(314, 'JAN17/U/150', NULL, NULL, NULL, NULL, 'CS 100', 10, 1, 1, 2, '2017-10-05', 10, 0),
(315, 'JAN17/U/150', NULL, NULL, NULL, 87, 'CS 101', 10, 1, 1, 2, '2017-10-05', 10, 0),
(316, 'JAN17/U/150', NULL, NULL, NULL, 65, 'IT 100', 10, 1, 1, 2, '2017-10-05', 10, 0),
(317, 'JAN17/U/150', NULL, NULL, NULL, 80, 'MT 100', 10, 1, 1, 2, '2017-10-05', 10, 0),
(318, 'MAY17/U/115', NULL, NULL, NULL, 65, 'BA 100', 10, 1, 1, 2, '2017-10-05', 10, 0),
(319, 'MAY17/U/115', NULL, NULL, NULL, 60, 'BA 104', 10, 1, 1, 2, '2017-10-05', 10, 0),
(320, 'MAY17/U/115', NULL, NULL, NULL, 65, 'CS 100', 10, 1, 1, 2, '2017-10-05', 10, 0),
(321, 'MAY17/U/115', NULL, NULL, NULL, 70, 'CS 101', 10, 1, 1, 2, '2017-10-05', 10, 0),
(322, 'MAY17/U/115', NULL, NULL, NULL, 80, 'IT 100', 10, 1, 1, 2, '2017-10-05', 10, 0),
(323, 'MAY17/U/115', NULL, NULL, NULL, 61, 'MT 100', 10, 1, 1, 2, '2017-10-05', 10, 0),
(324, 'MAY17/U/119', NULL, NULL, NULL, 65, 'BA 100', 10, 1, 1, 2, '2017-10-05', 10, 0),
(325, 'MAY17/U/119', NULL, NULL, NULL, NULL, 'BA 104', 10, 1, 1, 2, '2017-10-05', 10, 0),
(326, 'MAY17/U/119', NULL, NULL, NULL, 75, 'CS 100', 10, 1, 1, 2, '2017-10-05', 10, 0),
(327, 'MAY17/U/119', NULL, NULL, NULL, 75, 'CS 101', 10, 1, 1, 2, '2017-10-05', 10, 0),
(328, 'MAY17/U/119', NULL, NULL, NULL, 62, 'IT 100', 10, 1, 1, 2, '2017-10-05', 10, 0),
(329, 'MAY17/U/119', NULL, NULL, NULL, 56, 'MT 100', 10, 1, 1, 2, '2017-10-05', 10, 0),
(330, 'MAY17/X/118', NULL, NULL, NULL, 52, 'BA 100', 10, 1, 1, 2, '2017-10-05', 10, 0),
(331, 'MAY17/X/118', NULL, NULL, NULL, NULL, 'BA 104', 10, 1, 1, 2, '2017-10-05', 10, 0),
(332, 'MAY17/X/118', NULL, NULL, NULL, 18, 'CS 100', 10, 1, 1, 2, '2017-10-05', 10, 0),
(333, 'MAY17/X/118', NULL, NULL, NULL, 79, 'CS 101', 10, 1, 1, 2, '2017-10-05', 10, 0),
(334, 'MAY17/X/118', NULL, NULL, NULL, 71, 'IT 100', 10, 1, 1, 2, '2017-10-05', 10, 0),
(335, 'MAY17/X/118', NULL, NULL, NULL, 66, 'MT 100', 10, 1, 1, 2, '2017-10-05', 10, 0),
(336, 'MAY17/U/003', NULL, NULL, NULL, NULL, 'BA 100', 10, 1, 1, 2, '2017-10-05', 10, 0),
(337, 'MAY17/U/003', NULL, NULL, NULL, NULL, 'BA 104', 10, 1, 1, 2, '2017-10-05', 10, 0),
(338, 'MAY17/U/003', NULL, NULL, NULL, 52, 'CS 100', 10, 1, 1, 2, '2017-10-05', 10, 0),
(339, 'MAY17/U/003', NULL, NULL, NULL, 50, 'CS 101', 10, 1, 1, 2, '2017-10-05', 10, 0),
(340, 'MAY17/U/003', NULL, NULL, NULL, 67, 'IT 100', 10, 1, 1, 2, '2017-10-05', 10, 0),
(341, 'MAY17/U/003', NULL, NULL, NULL, 42, 'MT 100', 10, 1, 1, 2, '2017-10-05', 10, 0),
(342, 'MAY17/U/110', NULL, NULL, NULL, 15, 'BA 100', 10, 1, 1, 2, '2017-10-05', 10, 0),
(343, 'MAY17/U/110', NULL, NULL, NULL, NULL, 'BA 104', 10, 1, 1, 2, '2017-10-05', 10, 0),
(344, 'MAY17/U/110', NULL, NULL, NULL, 50, 'CS 100', 10, 1, 1, 2, '2017-10-05', 10, 0),
(345, 'MAY17/U/110', NULL, NULL, NULL, 54, 'CS 101', 10, 1, 1, 2, '2017-10-05', 10, 0),
(346, 'MAY17/U/110', NULL, NULL, NULL, 16, 'IT 100', 10, 1, 1, 2, '2017-10-05', 10, 0),
(347, 'MAY17/U/110', NULL, NULL, NULL, 27, 'MT 100', 10, 1, 1, 2, '2017-10-05', 10, 0),
(348, 'MAY17/U/113', NULL, NULL, NULL, NULL, 'BA 100', 10, 1, 1, 2, '2017-10-05', 10, 0),
(349, 'MAY17/U/113', NULL, NULL, NULL, NULL, 'BA 104', 10, 1, 1, 2, '2017-10-05', 10, 0),
(350, 'MAY17/U/113', NULL, NULL, NULL, 14, 'CS 100', 10, 1, 1, 2, '2017-10-05', 10, 0),
(351, 'MAY17/U/113', NULL, NULL, NULL, NULL, 'CS 101', 10, 1, 1, 2, '2017-10-05', 10, 0),
(352, 'MAY17/U/113', NULL, NULL, NULL, NULL, 'IT 100', 10, 1, 1, 2, '2017-10-05', 10, 0),
(353, 'MAY17/U/113', NULL, NULL, NULL, NULL, 'MT 100', 10, 1, 1, 2, '2017-10-05', 10, 0),
(354, 'MAY17/U/112', NULL, NULL, NULL, NULL, 'BA 100', 10, 1, 1, 2, '2017-10-05', 10, 0),
(355, 'MAY17/U/112', NULL, NULL, NULL, NULL, 'BA 104', 10, 1, 1, 2, '2017-10-05', 10, 0),
(356, 'MAY17/U/112', NULL, NULL, NULL, 0, 'CS 100', 10, 1, 1, 2, '2017-10-05', 10, 0),
(357, 'MAY17/U/112', NULL, NULL, NULL, NULL, 'CS 101', 10, 1, 1, 2, '2017-10-05', 10, 0),
(358, 'MAY17/U/112', NULL, NULL, NULL, NULL, 'IT 100', 10, 1, 1, 2, '2017-10-05', 10, 0),
(359, 'MAY17/U/112', NULL, NULL, NULL, NULL, 'MT 100', 10, 1, 1, 2, '2017-10-05', 10, 0),
(360, 'MAY17/U/111', NULL, NULL, NULL, NULL, 'BA 100', 10, 1, 1, 2, '2017-10-05', 10, 0),
(361, 'MAY17/U/111', NULL, NULL, NULL, NULL, 'BA 104', 10, 1, 1, 2, '2017-10-05', 10, 0),
(362, 'MAY17/U/111', NULL, NULL, NULL, 0, 'CS 100', 10, 1, 1, 2, '2017-10-05', 10, 0),
(363, 'MAY17/U/111', NULL, NULL, NULL, NULL, 'CS 101', 10, 1, 1, 2, '2017-10-05', 10, 0),
(364, 'MAY17/U/111', NULL, NULL, NULL, NULL, 'IT 100', 10, 1, 1, 2, '2017-10-05', 10, 0),
(365, 'MAY17/U/111', NULL, NULL, NULL, NULL, 'MT 100', 10, 1, 1, 2, '2017-10-05', 10, 0),
(366, 'MAY17/U/120', NULL, NULL, NULL, NULL, 'BA 100', 10, 1, 1, 2, '2017-10-05', 10, 0),
(367, 'MAY17/U/120', NULL, NULL, NULL, NULL, 'BA 104', 10, 1, 1, 2, '2017-10-05', 10, 0),
(368, 'MAY17/U/120', NULL, NULL, NULL, 21, 'CS 100', 10, 1, 1, 2, '2017-10-05', 10, 0),
(369, 'MAY17/U/120', NULL, NULL, NULL, NULL, 'CS 101', 10, 1, 1, 2, '2017-10-05', 10, 0),
(370, 'MAY17/U/120', NULL, NULL, NULL, NULL, 'IT 100', 10, 1, 1, 2, '2017-10-05', 10, 0),
(371, 'MAY17/U/120', NULL, NULL, NULL, NULL, 'MT 100', 10, 1, 1, 2, '2017-10-05', 10, 0),
(372, 'JAN17/U/153', NULL, NULL, NULL, 69, 'BA 100', 10, 1, 1, 2, '2017-10-05', 10, 1),
(373, 'SEP15U01572', NULL, NULL, NULL, 39, 'BA 100', 10, 1, 1, 2, '2017-10-05', 10, 1),
(374, 'SEP15U01572', NULL, NULL, NULL, 14, 'CS 100', 10, 1, 1, 2, '2017-10-05', 10, 1),
(375, 'SEP15U01572', NULL, NULL, NULL, 33, 'CS 101', 10, 1, 1, 2, '2017-10-05', 10, 1),
(376, 'SEP15U01572', NULL, NULL, NULL, 26, 'IT 100', 10, 1, 1, 2, '2017-10-05', 10, 1),
(377, 'SEP15U01572', NULL, NULL, NULL, 33, 'MT 100', 10, 1, 1, 2, '2017-10-05', 10, 1),
(378, 'SEP15U02064', NULL, NULL, NULL, 75, 'IT 100', 10, 1, 1, 2, '2017-10-05', 10, 1),
(379, 'SEP15U02027', NULL, NULL, NULL, 69, 'CS 100', 10, 1, 1, 2, '2017-10-05', 10, 1),
(380, 'SEP15U02027', NULL, NULL, NULL, 62, 'CS 101', 10, 1, 1, 2, '2017-10-05', 10, 1),
(381, 'SEP13U00135', NULL, NULL, NULL, 70, 'MT 100', 10, 1, 1, 2, '2017-10-05', 10, 1),
(382, 'JAN15U02007', NULL, NULL, NULL, 70, 'CS 100', 10, 1, 1, 2, '2017-10-05', 10, 1),
(383, 'JAN16/U/136', NULL, NULL, NULL, 58, 'BA 100', 10, 1, 1, 2, '2017-10-05', 10, 1),
(384, 'SEP13U00204', NULL, NULL, NULL, 74, 'CS 100', 10, 1, 1, 2, '2017-10-05', 10, 1),
(385, 'SEP13U00204', NULL, NULL, NULL, 60, 'MT 100', 10, 1, 1, 2, '2017-10-05', 10, 1),
(386, 'SEP14U00240', NULL, NULL, NULL, 59, 'CS 101', 10, 1, 1, 2, '2017-10-05', 10, 1),
(387, 'SEP14U00249', NULL, NULL, NULL, 56, 'CS 100', 10, 1, 1, 2, '2017-10-05', 10, 1),
(388, 'SEP14U00249', NULL, NULL, NULL, 51, 'MT 100', 10, 1, 1, 2, '2017-10-05', 10, 1),
(389, 'MAY16/U/001', NULL, NULL, NULL, 67, 'MT 100', 10, 1, 1, 2, '2017-10-05', 10, 1),
(390, 'JAN14U00212', NULL, NULL, NULL, 58, 'IT 100', 10, 1, 1, 2, '2017-10-05', 10, 1),
(391, 'SEP14U01987', NULL, NULL, NULL, 67, 'CS 100', 10, 1, 1, 2, '2017-10-05', 10, 1),
(392, 'SEP14U01987', NULL, NULL, NULL, 61, 'CS 101', 10, 1, 1, 2, '2017-10-05', 10, 1),
(393, 'JAN15U02006', NULL, NULL, NULL, 88, 'CS 101', 10, 1, 1, 2, '2017-10-05', 10, 1),
(394, 'JAN15U02006', NULL, NULL, NULL, 80, 'IT 100', 10, 1, 1, 2, '2017-10-05', 10, 1),
(395, 'MAY16/U/036', NULL, NULL, NULL, 62, 'CS 200', 8, 1, 2, 2, '2017-10-05', 10, 0),
(396, 'MAY16/U/036', NULL, NULL, NULL, 77, 'NW 102', 8, 1, 2, 2, '2017-10-05', 10, 0),
(397, 'MAY16/U/036', NULL, NULL, NULL, 73, 'SE 207', 8, 1, 2, 2, '2017-10-05', 10, 0),
(398, 'MAY16/U/036', NULL, NULL, NULL, 80, 'SE 208', 8, 1, 2, 2, '2017-10-05', 10, 0),
(399, 'MAY16/U/036', NULL, NULL, NULL, 59, 'TM 201', 8, 1, 2, 2, '2017-10-05', 10, 0),
(400, 'MAY16/U/033', NULL, NULL, NULL, 70, 'CS 200', 8, 1, 2, 2, '2017-10-05', 10, 0),
(401, 'MAY16/U/033', NULL, NULL, NULL, 68, 'NW 102', 8, 1, 2, 2, '2017-10-05', 10, 0),
(402, 'MAY16/U/033', NULL, NULL, NULL, 63, 'SE 207', 8, 1, 2, 2, '2017-10-05', 10, 0),
(403, 'MAY16/U/033', NULL, NULL, NULL, 72, 'SE 208', 8, 1, 2, 2, '2017-10-05', 10, 0),
(404, 'MAY16/U/033', NULL, NULL, NULL, 76, 'TM 201', 8, 1, 2, 2, '2017-10-05', 10, 0),
(405, 'SEP15U021', NULL, NULL, NULL, 81, 'CS 200', 8, 1, 2, 2, '2017-10-05', 10, 1),
(406, 'SEP15U020', NULL, NULL, NULL, 63, 'NW 102', 8, 1, 2, 2, '2017-10-05', 10, 1),
(407, 'SEP15U020', NULL, NULL, NULL, 59, 'SE 207', 8, 1, 2, 2, '2017-10-05', 10, 1),
(408, 'SEP15U020', NULL, NULL, NULL, 23, 'SE 208', 8, 1, 2, 2, '2017-10-05', 10, 1),
(409, 'SEP15U109', NULL, NULL, NULL, 72, 'CS 200', 8, 1, 2, 2, '2017-10-05', 10, 1),
(410, 'SEP15U101', NULL, NULL, NULL, 15, 'CS 200', 8, 1, 2, 2, '2017-10-05', 10, 1),
(411, 'SEP15U108', NULL, NULL, NULL, 51, 'SE 207', 8, 1, 2, 2, '2017-10-05', 10, 1),
(412, 'SEP15U108', NULL, NULL, NULL, 68, 'SE 208', 8, 1, 2, 2, '2017-10-05', 10, 1),
(413, 'SEP15U022', NULL, NULL, NULL, 44, 'CS 200', 8, 1, 2, 2, '2017-10-05', 10, 1),
(414, 'SEP15U103', NULL, NULL, NULL, 52, 'CS 200', 8, 1, 2, 2, '2017-10-05', 10, 1),
(420, 'MAY17/U/012', NULL, NULL, NULL, 44, 'BA 103', 80, 1, 1, 2, '2017-10-05', 10, 0),
(421, 'MAY17/U/012', NULL, NULL, NULL, 60, 'BA 107', 80, 1, 1, 2, '2017-10-05', 10, 0),
(422, 'MAY17/U/012', NULL, NULL, NULL, NULL, 'BA 109', 80, 1, 1, 2, '2017-10-05', 10, 0),
(423, 'MAY17/U/012', NULL, NULL, NULL, 58, 'CS 101', 80, 1, 1, 2, '2017-10-05', 10, 0),
(424, 'MAY17/U/012', NULL, NULL, NULL, 42, 'EC 101', 80, 1, 1, 2, '2017-10-05', 10, 0),
(425, 'MAY17/U/012', NULL, NULL, NULL, 14, 'LW 204', 80, 1, 1, 2, '2017-10-05', 10, 0),
(426, 'JAN15U02008', NULL, NULL, NULL, 65, 'BA 107', 80, 1, 1, 2, '2017-10-05', 10, 1),
(427, 'JAN15U02008', NULL, NULL, NULL, 53, 'BA 109', 80, 1, 1, 2, '2017-10-05', 10, 1),
(428, 'JAN15U02008', NULL, NULL, NULL, 51, 'CS 101', 80, 1, 1, 2, '2017-10-05', 10, 1),
(429, 'SEP15U084', NULL, NULL, NULL, 50, 'BA 107', 80, 1, 1, 2, '2017-10-05', 10, 1),
(430, 'SEP15U084', NULL, NULL, NULL, 61, 'CS 101', 80, 1, 1, 2, '2017-10-05', 10, 1),
(431, 'SEP15U081', NULL, NULL, NULL, 59, 'CS 101', 80, 1, 1, 2, '2017-10-05', 10, 1),
(432, 'MAY15U00520', NULL, NULL, NULL, 80, 'AF 303', 16, 1, 3, 2, '2017-10-05', 10, 0),
(433, 'MAY15U00520', NULL, NULL, NULL, 81, 'BA 212', 16, 1, 3, 2, '2017-10-05', 10, 0),
(434, 'MAY15U00520', NULL, NULL, NULL, 62, 'BA 303', 16, 1, 3, 2, '2017-10-05', 10, 0),
(435, 'MAY15U00520', NULL, NULL, NULL, 80, 'IS 201', 16, 1, 3, 2, '2017-10-05', 10, 0),
(436, 'MAY17/U/090', NULL, NULL, NULL, 69, 'BA 101', 16, 1, 1, 2, '2017-10-05', 10, 0),
(437, 'MAY17/U/090', NULL, NULL, NULL, 65, 'BA 102', 16, 1, 1, 2, '2017-10-05', 10, 0),
(438, 'MAY17/U/090', NULL, NULL, NULL, 71, 'BA 103', 16, 1, 1, 2, '2017-10-05', 10, 0),
(439, 'MAY17/U/090', NULL, NULL, NULL, NULL, 'BA 104', 16, 1, 1, 2, '2017-10-05', 10, 0),
(440, 'MAY17/U/090', NULL, NULL, NULL, 74, 'CS 101', 16, 1, 1, 2, '2017-10-05', 10, 0),
(441, 'MAY17/U/090', NULL, NULL, NULL, 84, 'EC 100', 16, 1, 1, 2, '2017-10-05', 10, 0),
(442, 'MAY17/U/091', NULL, NULL, NULL, 74, 'BA 101', 16, 1, 1, 2, '2017-10-05', 10, 0),
(443, 'MAY17/U/091', NULL, NULL, NULL, 77, 'BA 102', 16, 1, 1, 2, '2017-10-05', 10, 0),
(444, 'MAY17/U/091', NULL, NULL, NULL, 20, 'BA 103', 16, 1, 1, 2, '2017-10-05', 10, 0),
(445, 'MAY17/U/091', NULL, NULL, NULL, NULL, 'BA 104', 16, 1, 1, 2, '2017-10-05', 10, 0),
(446, 'MAY17/U/091', NULL, NULL, NULL, 71, 'CS 101', 16, 1, 1, 2, '2017-10-05', 10, 0),
(447, 'MAY17/U/091', NULL, NULL, NULL, 77, 'EC 100', 16, 1, 1, 2, '2017-10-05', 10, 0),
(448, 'MAY17/U/092', NULL, NULL, NULL, 87, 'BA 101', 16, 1, 1, 2, '2017-10-05', 10, 0),
(449, 'MAY17/U/092', NULL, NULL, NULL, 78, 'BA 102', 16, 1, 1, 2, '2017-10-05', 10, 0),
(450, 'MAY17/U/092', NULL, NULL, NULL, 65, 'BA 103', 16, 1, 1, 2, '2017-10-05', 10, 0),
(451, 'MAY17/U/092', NULL, NULL, NULL, NULL, 'BA 104', 16, 1, 1, 2, '2017-10-05', 10, 0),
(452, 'MAY17/U/092', NULL, NULL, NULL, 69, 'CS 101', 16, 1, 1, 2, '2017-10-05', 10, 0),
(453, 'MAY17/U/092', NULL, NULL, NULL, 92, 'EC 100', 16, 1, 1, 2, '2017-10-05', 10, 0),
(454, 'MAY17/U/088', NULL, NULL, NULL, 87, 'BA 101', 16, 1, 1, 2, '2017-10-05', 10, 0),
(455, 'MAY17/U/088', NULL, NULL, NULL, 70, 'BA 102', 16, 1, 1, 2, '2017-10-05', 10, 0),
(456, 'MAY17/U/088', NULL, NULL, NULL, 77, 'BA 103', 16, 1, 1, 2, '2017-10-05', 10, 0),
(457, 'MAY17/U/088', NULL, NULL, NULL, NULL, 'BA 104', 16, 1, 1, 2, '2017-10-05', 10, 0),
(458, 'MAY17/U/088', NULL, NULL, NULL, 59, 'CS 101', 16, 1, 1, 2, '2017-10-05', 10, 0),
(459, 'MAY17/U/088', NULL, NULL, NULL, 84, 'EC 100', 16, 1, 1, 2, '2017-10-05', 10, 0),
(460, 'JAN17/U/002', NULL, NULL, NULL, 55, 'BA 101', 16, 1, 1, 2, '2017-10-05', 10, 0),
(461, 'JAN17/U/002', NULL, NULL, NULL, 67, 'BA 102', 16, 1, 1, 2, '2017-10-05', 10, 0),
(462, 'JAN17/U/002', NULL, NULL, NULL, 67, 'BA 103', 16, 1, 1, 2, '2017-10-05', 10, 0),
(463, 'JAN17/U/002', NULL, NULL, NULL, NULL, 'BA 104', 16, 1, 1, 2, '2017-10-05', 10, 0),
(464, 'JAN17/U/002', NULL, NULL, NULL, NULL, 'CS 101', 16, 1, 1, 2, '2017-10-05', 10, 0),
(465, 'JAN17/U/002', NULL, NULL, NULL, 83, 'EC 100', 16, 1, 1, 2, '2017-10-05', 10, 0),
(466, 'MAY14U00809', NULL, NULL, NULL, 65, 'CS 101', 16, 1, 1, 2, '2017-10-05', 10, 1),
(467, 'JAN15U00660', NULL, NULL, NULL, 56, 'OG 300', 22, 1, 3, 2, '2017-10-05', 10, 0),
(468, 'JAN15U00660', NULL, NULL, NULL, 43, 'OG 301', 22, 1, 3, 2, '2017-10-05', 10, 0),
(469, 'JAN15U00660', NULL, NULL, NULL, 57, 'OG 302', 22, 1, 3, 2, '2017-10-05', 10, 0),
(470, 'JAN15U00660', NULL, NULL, NULL, 71, 'OG 303', 22, 1, 3, 2, '2017-10-05', 10, 0),
(471, 'JAN15U00660', NULL, NULL, NULL, 69, 'PM 306', 22, 1, 3, 2, '2017-10-05', 10, 0),
(472, 'JAN15U00660', NULL, NULL, NULL, 79, 'PP 305', 22, 1, 3, 2, '2017-10-05', 10, 0),
(473, 'SEP14U01465', NULL, NULL, NULL, 70, 'OG 301', 22, 1, 3, 2, '2017-10-05', 10, 1),
(474, 'MAY17/U/055', NULL, NULL, NULL, 69, 'BA 100', 22, 1, 1, 2, '2017-10-05', 10, 0),
(475, 'MAY17/U/055', NULL, NULL, NULL, NULL, 'LW 103', 22, 1, 1, 2, '2017-10-05', 10, 0),
(476, 'MAY17/U/055', NULL, NULL, NULL, 66, 'OG 100', 22, 1, 1, 2, '2017-10-05', 10, 0),
(477, 'MAY17/U/055', NULL, NULL, NULL, 61, 'OG 101', 22, 1, 1, 2, '2017-10-05', 10, 0),
(478, 'MAY17/U/055', NULL, NULL, NULL, 86, 'PA 100', 22, 1, 1, 2, '2017-10-05', 10, 0),
(479, 'MAY17/U/055', NULL, NULL, NULL, NULL, 'PA 101', 22, 1, 1, 2, '2017-10-05', 10, 0),
(480, 'MAY17/U/034', NULL, NULL, NULL, 57, 'BA 100', 22, 1, 1, 2, '2017-10-05', 10, 0),
(481, 'MAY17/U/034', NULL, NULL, NULL, NULL, 'LW 103', 22, 1, 1, 2, '2017-10-05', 10, 0),
(482, 'MAY17/U/034', NULL, NULL, NULL, 66, 'OG 100', 22, 1, 1, 2, '2017-10-05', 10, 0),
(483, 'MAY17/U/034', NULL, NULL, NULL, 50, 'OG 101', 22, 1, 1, 2, '2017-10-05', 10, 0),
(484, 'MAY17/U/034', NULL, NULL, NULL, 73, 'PA 100', 22, 1, 1, 2, '2017-10-05', 10, 0),
(485, 'MAY17/U/034', NULL, NULL, NULL, NULL, 'PA 101', 22, 1, 1, 2, '2017-10-05', 10, 0),
(486, 'MAY17/T/057', NULL, NULL, NULL, NULL, 'BA 100', 22, 1, 1, 2, '2017-10-05', 10, 0),
(487, 'MAY17/T/057', NULL, NULL, NULL, NULL, 'LW 103', 22, 1, 1, 2, '2017-10-05', 10, 0),
(488, 'MAY17/T/057', NULL, NULL, NULL, 67, 'OG 100', 22, 1, 1, 2, '2017-10-05', 10, 0),
(489, 'MAY17/T/057', NULL, NULL, NULL, 55, 'OG 101', 22, 1, 1, 2, '2017-10-05', 10, 0),
(490, 'MAY17/T/057', NULL, NULL, NULL, 71, 'PA 100', 22, 1, 1, 2, '2017-10-05', 10, 0),
(491, 'MAY17/T/057', NULL, NULL, NULL, NULL, 'PA 101', 22, 1, 1, 2, '2017-10-05', 10, 0),
(492, 'MAY17/U/060', NULL, NULL, NULL, 47, 'BA 100', 22, 1, 1, 2, '2017-10-05', 10, 0),
(493, 'MAY17/U/060', NULL, NULL, NULL, NULL, 'LW 103', 22, 1, 1, 2, '2017-10-05', 10, 0),
(494, 'MAY17/U/060', NULL, NULL, NULL, 60, 'OG 100', 22, 1, 1, 2, '2017-10-05', 10, 0),
(495, 'MAY17/U/060', NULL, NULL, NULL, 57, 'OG 101', 22, 1, 1, 2, '2017-10-05', 10, 0),
(496, 'MAY17/U/060', NULL, NULL, NULL, 81, 'PA 100', 22, 1, 1, 2, '2017-10-05', 10, 0),
(497, 'MAY17/U/060', NULL, NULL, NULL, NULL, 'PA 101', 22, 1, 1, 2, '2017-10-05', 10, 0),
(498, 'MAY17/U/056', NULL, NULL, NULL, 92, 'BA 100', 22, 1, 1, 2, '2017-10-05', 10, 0),
(499, 'MAY17/U/056', NULL, NULL, NULL, NULL, 'LW 103', 22, 1, 1, 2, '2017-10-05', 10, 0),
(500, 'MAY17/U/056', NULL, NULL, NULL, 78, 'OG 100', 22, 1, 1, 2, '2017-10-05', 10, 0),
(501, 'MAY17/U/056', NULL, NULL, NULL, 61, 'OG 101', 22, 1, 1, 2, '2017-10-05', 10, 0),
(502, 'MAY17/U/056', NULL, NULL, NULL, 89, 'PA 100', 22, 1, 1, 2, '2017-10-05', 10, 0),
(503, 'MAY17/U/056', NULL, NULL, NULL, NULL, 'PA 101', 22, 1, 1, 2, '2017-10-05', 10, 0),
(504, 'MAY17/U/058', NULL, NULL, NULL, 74, 'BA 100', 22, 1, 1, 2, '2017-10-05', 10, 0),
(505, 'MAY17/U/058', NULL, NULL, NULL, NULL, 'LW 103', 22, 1, 1, 2, '2017-10-05', 10, 0),
(506, 'MAY17/U/058', NULL, NULL, NULL, 76, 'OG 100', 22, 1, 1, 2, '2017-10-05', 10, 0),
(507, 'MAY17/U/058', NULL, NULL, NULL, NULL, 'OG 101', 22, 1, 1, 2, '2017-10-05', 10, 0),
(508, 'MAY17/U/058', NULL, NULL, NULL, 88, 'PA 100', 22, 1, 1, 2, '2017-10-05', 10, 0),
(509, 'MAY17/U/058', NULL, NULL, NULL, NULL, 'PA 101', 22, 1, 1, 2, '2017-10-05', 10, 0),
(510, 'MAY17/U/059', NULL, NULL, NULL, 57, 'BA 100', 22, 1, 1, 2, '2017-10-05', 10, 0),
(511, 'MAY17/U/059', NULL, NULL, NULL, NULL, 'LW 103', 22, 1, 1, 2, '2017-10-05', 10, 0),
(512, 'MAY17/U/059', NULL, NULL, NULL, 71, 'OG 100', 22, 1, 1, 2, '2017-10-05', 10, 0),
(513, 'MAY17/U/059', NULL, NULL, NULL, 48, 'OG 101', 22, 1, 1, 2, '2017-10-05', 10, 0),
(514, 'MAY17/U/059', NULL, NULL, NULL, 81, 'PA 100', 22, 1, 1, 2, '2017-10-05', 10, 0),
(515, 'MAY17/U/059', NULL, NULL, NULL, NULL, 'PA 101', 22, 1, 1, 2, '2017-10-05', 10, 0),
(559, 'JAN17/MIS/009U', NULL, NULL, NULL, 71, 'IS 501', 37, 2, 1, 2, '2017-10-05', 10, 0),
(560, 'JAN17/MIS/009U', NULL, NULL, NULL, 84, 'IS 502', 37, 2, 1, 2, '2017-10-05', 10, 0),
(561, 'JAN17/MIS/009U', NULL, NULL, NULL, 72, 'IS 507', 37, 2, 1, 2, '2017-10-05', 10, 0),
(562, 'JAN17/MIS/009U', NULL, NULL, NULL, 76, 'IS 509', 37, 2, 1, 2, '2017-10-05', 10, 0),
(563, 'JAN17/MIS/009U', NULL, NULL, NULL, 78, 'IT 501', 37, 2, 1, 2, '2017-10-05', 10, 0),
(564, 'JAN17/MIS/007U', NULL, NULL, NULL, 70, 'IS 501', 37, 2, 1, 2, '2017-10-05', 10, 0),
(565, 'JAN17/MIS/007U', NULL, NULL, NULL, 86, 'IS 502', 37, 2, 1, 2, '2017-10-05', 10, 0),
(566, 'JAN17/MIS/007U', NULL, NULL, NULL, 71, 'IS 507', 37, 2, 1, 2, '2017-10-05', 10, 0),
(567, 'JAN17/MIS/007U', NULL, NULL, NULL, 63, 'IS 509', 37, 2, 1, 2, '2017-10-05', 10, 0),
(568, 'JAN17/MIS/007U', NULL, NULL, NULL, 87, 'IT 501', 37, 2, 1, 2, '2017-10-05', 10, 0),
(569, 'JAN17/MIS/001U', NULL, NULL, NULL, 76, 'IS 501', 37, 2, 1, 2, '2017-10-05', 10, 0),
(570, 'JAN17/MIS/001U', NULL, NULL, NULL, 84, 'IS 502', 37, 2, 1, 2, '2017-10-05', 10, 0),
(571, 'JAN17/MIS/001U', NULL, NULL, NULL, NULL, 'IS 507', 37, 2, 1, 2, '2017-10-05', 10, 0),
(572, 'JAN17/MIS/001U', NULL, NULL, NULL, 73, 'IS 509', 37, 2, 1, 2, '2017-10-05', 10, 0),
(573, 'JAN17/MIS/001U', NULL, NULL, NULL, 55, 'IT 501', 37, 2, 1, 2, '2017-10-05', 10, 0),
(574, 'JAN17/MIS/003U', NULL, NULL, NULL, 60, 'IS 501', 37, 2, 1, 2, '2017-10-05', 10, 0),
(575, 'JAN17/MIS/003U', NULL, NULL, NULL, 78, 'IS 502', 37, 2, 1, 2, '2017-10-05', 10, 0),
(576, 'JAN17/MIS/003U', NULL, NULL, NULL, 62, 'IS 507', 37, 2, 1, 2, '2017-10-05', 10, 0),
(577, 'JAN17/MIS/003U', NULL, NULL, NULL, 60, 'IS 509', 37, 2, 1, 2, '2017-10-05', 10, 0),
(578, 'JAN17/MIS/003U', NULL, NULL, NULL, 65, 'IT 501', 37, 2, 1, 2, '2017-10-05', 10, 0),
(579, 'JAN17/MIS/004U', NULL, NULL, NULL, 70, 'IS 501', 37, 2, 1, 2, '2017-10-05', 10, 0),
(580, 'JAN17/MIS/004U', NULL, NULL, NULL, 63, 'IS 502', 37, 2, 1, 2, '2017-10-05', 10, 0),
(581, 'JAN17/MIS/004U', NULL, NULL, NULL, 67, 'IS 507', 37, 2, 1, 2, '2017-10-05', 10, 0),
(582, 'JAN17/MIS/004U', NULL, NULL, NULL, 61, 'IS 509', 37, 2, 1, 2, '2017-10-05', 10, 0),
(583, 'JAN17/MIS/004U', NULL, NULL, NULL, 74, 'IT 501', 37, 2, 1, 2, '2017-10-05', 10, 0),
(584, 'JAN17/MIS/008U', NULL, NULL, NULL, 61, 'IS 501', 37, 2, 1, 2, '2017-10-05', 10, 0),
(585, 'JAN17/MIS/008U', NULL, NULL, NULL, 78, 'IS 502', 37, 2, 1, 2, '2017-10-05', 10, 0),
(586, 'JAN17/MIS/008U', NULL, NULL, NULL, 74, 'IS 507', 37, 2, 1, 2, '2017-10-05', 10, 0),
(587, 'JAN17/MIS/008U', NULL, NULL, NULL, 48, 'IS 509', 37, 2, 1, 2, '2017-10-05', 10, 0),
(588, 'JAN17/MIS/008U', NULL, NULL, NULL, 74, 'IT 501', 37, 2, 1, 2, '2017-10-05', 10, 0),
(589, 'JAN17/MIS/005U', NULL, NULL, NULL, 51, 'IS 501', 37, 2, 1, 2, '2017-10-05', 10, 0),
(590, 'JAN17/MIS/005U', NULL, NULL, NULL, 65, 'IS 502', 37, 2, 1, 2, '2017-10-05', 10, 0),
(591, 'JAN17/MIS/005U', NULL, NULL, NULL, 60, 'IS 507', 37, 2, 1, 2, '2017-10-05', 10, 0),
(592, 'JAN17/MIS/005U', NULL, NULL, NULL, 62, 'IS 509', 37, 2, 1, 2, '2017-10-05', 10, 0),
(593, 'JAN17/MIS/005U', NULL, NULL, NULL, 50, 'IT 501', 37, 2, 1, 2, '2017-10-05', 10, 0),
(594, 'JAN17/MIS/010U', NULL, NULL, NULL, 55, 'IS 501', 37, 2, 1, 2, '2017-10-05', 10, 1),
(595, 'JAN17/MIS/010U', NULL, NULL, NULL, 70, 'IS 502', 37, 2, 1, 2, '2017-10-05', 10, 1),
(596, 'JAN17/MIS/010U', NULL, NULL, NULL, 86, 'IS 509', 37, 2, 1, 2, '2017-10-05', 10, 1),
(597, 'JAN17/MIS/010U', NULL, NULL, NULL, 64, 'IT 501', 37, 2, 1, 2, '2017-10-05', 10, 1),
(598, 'JAN17/MIS/010U', NULL, NULL, NULL, 69, 'IS 605', 37, 2, 2, 2, '2017-10-05', 10, 0),
(599, 'JAN17/MIS/010U', NULL, NULL, NULL, NULL, 'IT 604', 37, 2, 2, 2, '2017-10-05', 10, 0),
(600, 'JAN17/MIS/010U', NULL, NULL, NULL, 78, 'ME 505', 37, 2, 2, 2, '2017-10-05', 10, 0),
(601, 'JAN17/MIS/010U', NULL, NULL, NULL, NULL, 'TM 601', 37, 2, 2, 2, '2017-10-05', 10, 0),
(602, 'SEP16/MIS/008U', NULL, NULL, NULL, 73, 'IS 600', 37, 1, 2, 2, '2017-10-05', 10, 0),
(603, 'SEP16/MIS/008U', NULL, NULL, NULL, NULL, 'IT 601', 37, 1, 2, 2, '2017-10-05', 10, 0),
(604, 'SEP16/MIS/008U', NULL, NULL, NULL, 69, 'IT 605', 37, 1, 2, 2, '2017-10-05', 10, 0),
(605, 'SEP16/MIS/008U', NULL, NULL, NULL, NULL, 'TM 600', 37, 1, 2, 2, '2017-10-05', 10, 0),
(606, 'SEP16/MIS/008U', NULL, NULL, NULL, 73, 'TM 602', 37, 1, 2, 2, '2017-10-05', 10, 0),
(607, 'SEP16/MIS/010U', NULL, NULL, NULL, 55, 'IS 600', 37, 1, 2, 2, '2017-10-05', 10, 0),
(608, 'SEP16/MIS/010U', NULL, NULL, NULL, NULL, 'IT 601', 37, 1, 2, 2, '2017-10-05', 10, 0),
(609, 'SEP16/MIS/010U', NULL, NULL, NULL, 84, 'IT 605', 37, 1, 2, 2, '2017-10-05', 10, 0),
(610, 'SEP16/MIS/010U', NULL, NULL, NULL, NULL, 'TM 600', 37, 1, 2, 2, '2017-10-05', 10, 0),
(611, 'SEP16/MIS/010U', NULL, NULL, NULL, 76, 'TM 602', 37, 1, 2, 2, '2017-10-05', 10, 0),
(612, 'SEP16/MIS/009U', NULL, NULL, NULL, 63, 'IS 600', 37, 1, 2, 2, '2017-10-05', 10, 0),
(613, 'SEP16/MIS/009U', NULL, NULL, NULL, NULL, 'IT 601', 37, 1, 2, 2, '2017-10-05', 10, 0),
(614, 'SEP16/MIS/009U', NULL, NULL, NULL, 50, 'IT 605', 37, 1, 2, 2, '2017-10-05', 10, 0),
(615, 'SEP16/MIS/009U', NULL, NULL, NULL, NULL, 'TM 600', 37, 1, 2, 2, '2017-10-05', 10, 0),
(616, 'SEP16/MIS/009U', NULL, NULL, NULL, 74, 'TM 602', 37, 1, 2, 2, '2017-10-05', 10, 0),
(617, 'JAN17/MIT/001X', NULL, NULL, NULL, 60, 'IS 501', 36, 2, 1, 2, '2017-10-05', 10, 0),
(618, 'JAN17/MIT/001X', NULL, NULL, NULL, 71, 'IS 507', 36, 2, 1, 2, '2017-10-05', 10, 0),
(619, 'JAN17/MIT/001X', NULL, NULL, NULL, 55, 'IT 501', 36, 2, 1, 2, '2017-10-05', 10, 0),
(620, 'JAN17/MIT/001X', NULL, NULL, NULL, 52, 'IT 504', 36, 2, 1, 2, '2017-10-05', 10, 0),
(621, 'JAN17/MIT/001X', NULL, NULL, NULL, 60, 'IT 505', 36, 2, 1, 2, '2017-10-05', 10, 0),
(622, 'JAN17/MIT/004U', NULL, NULL, NULL, 60, 'IS 501', 36, 2, 1, 2, '2017-10-05', 10, 0),
(623, 'JAN17/MIT/004U', NULL, NULL, NULL, 61, 'IS 507', 36, 2, 1, 2, '2017-10-05', 10, 0);
INSERT INTO `marks` (`marks_id`, `reg_number`, `CW`, `EX`, `FN`, `mark`, `course_unit`, `course_course_id`, `semesters_semester_id`, `academic_years_year_id`, `university_university_id`, `_when_added`, `_who_added`, `_status`) VALUES
(624, 'JAN17/MIT/004U', NULL, NULL, NULL, NULL, 'IT 501', 36, 2, 1, 2, '2017-10-05', 10, 0),
(625, 'JAN17/MIT/004U', NULL, NULL, NULL, 63, 'IT 504', 36, 2, 1, 2, '2017-10-05', 10, 0),
(626, 'JAN17/MIT/004U', NULL, NULL, NULL, 72, 'IT 505', 36, 2, 1, 2, '2017-10-05', 10, 0),
(627, 'MAY17/MIT/006U', NULL, NULL, NULL, NULL, 'CS 511', 36, 1, 1, 2, '2017-10-05', 10, 0),
(628, 'MAY17/MIT/006U', NULL, NULL, NULL, NULL, 'IS 508', 36, 1, 1, 2, '2017-10-05', 10, 0),
(629, 'MAY17/MIT/006U', NULL, NULL, NULL, 0, 'IT 502', 36, 1, 1, 2, '2017-10-05', 10, 0),
(630, 'MAY17/MIT/006U', NULL, NULL, NULL, NULL, 'IT 503', 36, 1, 1, 2, '2017-10-05', 10, 0),
(631, 'MAY17/MIT/006U', NULL, NULL, NULL, 30, 'TM 500', 36, 1, 1, 2, '2017-10-05', 10, 0),
(632, 'MAY17/MIT/005U', NULL, NULL, NULL, 63, 'CS 511', 36, 1, 1, 2, '2017-10-05', 10, 0),
(633, 'MAY17/MIT/005U', NULL, NULL, NULL, 67, 'IS 508', 36, 1, 1, 2, '2017-10-05', 10, 0),
(634, 'MAY17/MIT/005U', NULL, NULL, NULL, 42, 'IT 502', 36, 1, 1, 2, '2017-10-05', 10, 0),
(635, 'MAY17/MIT/005U', NULL, NULL, NULL, 82, 'IT 503', 36, 1, 1, 2, '2017-10-05', 10, 0),
(636, 'MAY17/MIT/005U', NULL, NULL, NULL, 60, 'TM 500', 36, 1, 1, 2, '2017-10-05', 10, 0),
(637, 'MAY17/MIT/004U', NULL, NULL, NULL, 41, 'CS 511', 36, 1, 1, 2, '2017-10-05', 10, 0),
(638, 'MAY17/MIT/004U', NULL, NULL, NULL, 48, 'IS 508', 36, 1, 1, 2, '2017-10-05', 10, 0),
(639, 'MAY17/MIT/004U', NULL, NULL, NULL, 67, 'IT 502', 36, 1, 1, 2, '2017-10-05', 10, 0),
(640, 'MAY17/MIT/004U', NULL, NULL, NULL, 19, 'IT 503', 36, 1, 1, 2, '2017-10-05', 10, 0),
(641, 'MAY17/MIT/004U', NULL, NULL, NULL, 50, 'TM 500', 36, 1, 1, 2, '2017-10-05', 10, 0),
(642, 'MAY17/MIT/002U', NULL, NULL, NULL, 46, 'CS 511', 36, 1, 1, 2, '2017-10-05', 10, 0),
(643, 'MAY17/MIT/002U', NULL, NULL, NULL, 40, 'IS 508', 36, 1, 1, 2, '2017-10-05', 10, 0),
(644, 'MAY17/MIT/002U', NULL, NULL, NULL, 67, 'IT 502', 36, 1, 1, 2, '2017-10-05', 10, 0),
(645, 'MAY17/MIT/002U', NULL, NULL, NULL, 57, 'IT 503', 36, 1, 1, 2, '2017-10-05', 10, 0),
(646, 'MAY17/MIT/002U', NULL, NULL, NULL, 72, 'TM 500', 36, 1, 1, 2, '2017-10-05', 10, 0),
(647, 'JAN17/MIT/003U', NULL, NULL, NULL, 50, 'TM 500', 36, 1, 1, 2, '2017-10-05', 10, 1),
(648, 'SEP16/MIT/005U', NULL, NULL, NULL, 74, 'IS 600', 36, 1, 2, 2, '2017-10-05', 10, 0),
(649, 'SEP16/MIT/005U', NULL, NULL, NULL, 79, 'IT 601', 36, 1, 2, 2, '2017-10-05', 10, 0),
(650, 'SEP16/MIT/005U', NULL, NULL, NULL, NULL, 'IT 603', 36, 1, 2, 2, '2017-10-05', 10, 0),
(651, 'SEP16/MIT/005U', NULL, NULL, NULL, NULL, 'TM 600', 36, 1, 2, 2, '2017-10-05', 10, 0),
(652, 'SEP16/MIT/005U', NULL, NULL, NULL, 72, 'TM 602', 36, 1, 2, 2, '2017-10-05', 10, 0),
(653, 'SEP16/MIT/006U', NULL, NULL, NULL, 31, 'IS 600', 36, 1, 2, 2, '2017-10-05', 10, 0),
(654, 'SEP16/MIT/006U', NULL, NULL, NULL, NULL, 'IT 601', 36, 1, 2, 2, '2017-10-05', 10, 0),
(655, 'SEP16/MIT/006U', NULL, NULL, NULL, NULL, 'IT 603', 36, 1, 2, 2, '2017-10-05', 10, 0),
(656, 'SEP16/MIT/006U', NULL, NULL, NULL, NULL, 'TM 600', 36, 1, 2, 2, '2017-10-05', 10, 0),
(657, 'SEP16/MIT/006U', NULL, NULL, NULL, 26, 'TM 602', 36, 1, 2, 2, '2017-10-05', 10, 0),
(658, 'SEP16/MIT/011U', NULL, NULL, NULL, 56, 'IS 600', 36, 1, 2, 2, '2017-10-05', 10, 0),
(659, 'SEP16/MIT/011U', NULL, NULL, NULL, 80, 'IT 601', 36, 1, 2, 2, '2017-10-05', 10, 0),
(660, 'SEP16/MIT/011U', NULL, NULL, NULL, NULL, 'IT 603', 36, 1, 2, 2, '2017-10-05', 10, 0),
(661, 'SEP16/MIT/011U', NULL, NULL, NULL, NULL, 'TM 600', 36, 1, 2, 2, '2017-10-05', 10, 0),
(662, 'SEP16/MIT/011U', NULL, NULL, NULL, 73, 'TM 602', 36, 1, 2, 2, '2017-10-05', 10, 0),
(663, 'SEP16/MIT/001U', NULL, NULL, NULL, 77, 'IS 600', 36, 1, 2, 2, '2017-10-05', 10, 0),
(664, 'SEP16/MIT/001U', NULL, NULL, NULL, 82, 'IT 601', 36, 1, 2, 2, '2017-10-05', 10, 0),
(665, 'SEP16/MIT/001U', NULL, NULL, NULL, NULL, 'IT 603', 36, 1, 2, 2, '2017-10-05', 10, 0),
(666, 'SEP16/MIT/001U', NULL, NULL, NULL, NULL, 'TM 600', 36, 1, 2, 2, '2017-10-05', 10, 0),
(667, 'SEP16/MIT/001U', NULL, NULL, NULL, 63, 'TM 602', 36, 1, 2, 2, '2017-10-05', 10, 0),
(668, 'SEP16/MIT/009U', NULL, NULL, NULL, 33, 'IS 600', 36, 1, 2, 2, '2017-10-05', 10, 0),
(669, 'SEP16/MIT/009U', NULL, NULL, NULL, NULL, 'IT 601', 36, 1, 2, 2, '2017-10-05', 10, 0),
(670, 'SEP16/MIT/009U', NULL, NULL, NULL, NULL, 'IT 603', 36, 1, 2, 2, '2017-10-05', 10, 0),
(671, 'SEP16/MIT/009U', NULL, NULL, NULL, NULL, 'TM 600', 36, 1, 2, 2, '2017-10-05', 10, 0),
(672, 'SEP16/MIT/009U', NULL, NULL, NULL, NULL, 'TM 602', 36, 1, 2, 2, '2017-10-05', 10, 0),
(673, 'SEP16/MIT/010U', NULL, NULL, NULL, 77, 'IS 600', 36, 1, 2, 2, '2017-10-05', 10, 0),
(674, 'SEP16/MIT/010U', NULL, NULL, NULL, 81, 'IT 601', 36, 1, 2, 2, '2017-10-05', 10, 0),
(675, 'SEP16/MIT/010U', NULL, NULL, NULL, NULL, 'IT 603', 36, 1, 2, 2, '2017-10-05', 10, 0),
(676, 'SEP16/MIT/010U', NULL, NULL, NULL, NULL, 'TM 600', 36, 1, 2, 2, '2017-10-05', 10, 0),
(677, 'SEP16/MIT/010U', NULL, NULL, NULL, 66, 'TM 602', 36, 1, 2, 2, '2017-10-05', 10, 0),
(678, 'JAN17/PGDIS/001U', NULL, NULL, NULL, 65, 'IS 501', 29, 2, 1, 2, '2017-10-05', 10, 0),
(679, 'JAN17/PGDIS/001U', NULL, NULL, NULL, 71, 'IS 502', 29, 2, 1, 2, '2017-10-05', 10, 0),
(680, 'JAN17/PGDIS/001U', NULL, NULL, NULL, 68, 'IS 507', 29, 2, 1, 2, '2017-10-05', 10, 0),
(681, 'JAN17/PGDIS/001U', NULL, NULL, NULL, 68, 'IS 509', 29, 2, 1, 2, '2017-10-05', 10, 0),
(682, 'JAN17/PGDIS/001U', NULL, NULL, NULL, 69, 'IT 501', 29, 2, 1, 2, '2017-10-05', 10, 0),
(683, 'JAN17/PGDIT/001U', NULL, NULL, NULL, 60, 'IS 501', 30, 2, 1, 2, '2017-10-05', 10, 0),
(684, 'JAN17/PGDIT/001U', NULL, NULL, NULL, 67, 'IS 507', 30, 2, 1, 2, '2017-10-05', 10, 0),
(685, 'JAN17/PGDIT/001U', NULL, NULL, NULL, 57, 'IT 501', 30, 2, 1, 2, '2017-10-05', 10, 0),
(686, 'JAN17/PGDIT/001U', NULL, NULL, NULL, 71, 'IT 504', 30, 2, 1, 2, '2017-10-05', 10, 0),
(687, 'JAN17/PGDIT/001U', NULL, NULL, NULL, 72, 'IT 505', 30, 2, 1, 2, '2017-10-05', 10, 0),
(688, 'JAN17/COMP/007U', NULL, NULL, NULL, NULL, 'CS 508', 33, 2, 1, 2, '2017-10-05', 10, 0),
(689, 'JAN17/COMP/007U', NULL, NULL, NULL, NULL, 'CS 509', 33, 2, 1, 2, '2017-10-05', 10, 0),
(690, 'JAN17/COMP/007U', NULL, NULL, NULL, 75, 'CS 510', 33, 2, 1, 2, '2017-10-05', 10, 0),
(691, 'JAN17/COMP/007U', NULL, NULL, NULL, NULL, 'IS 503', 33, 2, 1, 2, '2017-10-05', 10, 0),
(692, 'JAN17/COMP/007U', NULL, NULL, NULL, 90, 'NW 502', 33, 2, 1, 2, '2017-10-05', 10, 0),
(693, 'JAN17/COMP/005U', NULL, NULL, NULL, NULL, 'CS 508', 32, 2, 1, 2, '2017-10-05', 10, 0),
(694, 'JAN17/COMP/005U', NULL, NULL, NULL, NULL, 'CS 509', 32, 2, 1, 2, '2017-10-05', 10, 0),
(695, 'JAN17/COMP/005U', NULL, NULL, NULL, 61, 'CS 510', 32, 2, 1, 2, '2017-10-05', 10, 0),
(696, 'JAN17/COMP/005U', NULL, NULL, NULL, NULL, 'IS 503', 32, 2, 1, 2, '2017-10-05', 10, 0),
(697, 'JAN17/COMP/005U', NULL, NULL, NULL, NULL, 'NW 502', 32, 2, 1, 2, '2017-10-05', 10, 0),
(698, 'JAN17/COMP/006U', NULL, NULL, NULL, NULL, 'CS 508', 32, 2, 1, 2, '2017-10-05', 10, 0),
(699, 'JAN17/COMP/006U', NULL, NULL, NULL, NULL, 'CS 509', 32, 2, 1, 2, '2017-10-05', 10, 0),
(700, 'JAN17/COMP/006U', NULL, NULL, NULL, 67, 'CS 510', 32, 2, 1, 2, '2017-10-05', 10, 0),
(701, 'JAN17/COMP/006U', NULL, NULL, NULL, NULL, 'IS 503', 32, 2, 1, 2, '2017-10-05', 10, 0),
(702, 'JAN17/COMP/006U', NULL, NULL, NULL, NULL, 'NW 502', 32, 2, 1, 2, '2017-10-05', 10, 0),
(703, 'JAN17/COMP/002U', NULL, NULL, NULL, NULL, 'CS 508', 32, 2, 1, 2, '2017-10-05', 10, 0),
(704, 'JAN17/COMP/002U', NULL, NULL, NULL, NULL, 'CS 509', 32, 2, 1, 2, '2017-10-05', 10, 0),
(705, 'JAN17/COMP/002U', NULL, NULL, NULL, 68, 'CS 510', 32, 2, 1, 2, '2017-10-05', 10, 0),
(706, 'JAN17/COMP/002U', NULL, NULL, NULL, NULL, 'IS 503', 32, 2, 1, 2, '2017-10-05', 10, 0),
(707, 'JAN17/COMP/002U', NULL, NULL, NULL, NULL, 'NW 502', 32, 2, 1, 2, '2017-10-05', 10, 0),
(708, 'JAN17/COMP/010U', NULL, NULL, NULL, NULL, 'CS 508', 32, 2, 1, 2, '2017-10-05', 10, 0),
(709, 'JAN17/COMP/010U', NULL, NULL, NULL, NULL, 'CS 509', 32, 2, 1, 2, '2017-10-05', 10, 0),
(710, 'JAN17/COMP/010U', NULL, NULL, NULL, 51, 'CS 510', 32, 2, 1, 2, '2017-10-05', 10, 0),
(711, 'JAN17/COMP/010U', NULL, NULL, NULL, NULL, 'IS 503', 32, 2, 1, 2, '2017-10-05', 10, 0),
(712, 'JAN17/COMP/010U', NULL, NULL, NULL, NULL, 'NW 502', 32, 2, 1, 2, '2017-10-05', 10, 0),
(713, 'JAN17/COMP/011X', NULL, NULL, NULL, NULL, 'CS 508', 32, 2, 1, 2, '2017-10-05', 10, 0),
(714, 'JAN17/COMP/011X', NULL, NULL, NULL, NULL, 'CS 509', 32, 2, 1, 2, '2017-10-05', 10, 0),
(715, 'JAN17/COMP/011X', NULL, NULL, NULL, 65, 'CS 510', 32, 2, 1, 2, '2017-10-05', 10, 0),
(716, 'JAN17/COMP/011X', NULL, NULL, NULL, NULL, 'IS 503', 32, 2, 1, 2, '2017-10-05', 10, 0),
(717, 'JAN17/COMP/011X', NULL, NULL, NULL, NULL, 'NW 502', 32, 2, 1, 2, '2017-10-05', 10, 0),
(718, 'SEP16/COMP/011U', NULL, NULL, NULL, 64, 'IS 503', 32, 2, 1, 2, '2017-10-05', 10, 1),
(719, 'JAN17/COMP/008U', NULL, NULL, NULL, NULL, 'CS 508', 34, 2, 1, 2, '2017-10-05', 10, 0),
(720, 'JAN17/COMP/008U', NULL, NULL, NULL, NULL, 'CS 509', 34, 2, 1, 2, '2017-10-05', 10, 0),
(721, 'JAN17/COMP/008U', NULL, NULL, NULL, NULL, 'CS 510', 34, 2, 1, 2, '2017-10-05', 10, 0),
(722, 'JAN17/COMP/008U', NULL, NULL, NULL, 31, 'IS 503', 34, 2, 1, 2, '2017-10-05', 10, 0),
(723, 'JAN17/COMP/008U', NULL, NULL, NULL, NULL, 'NW 502', 34, 2, 1, 2, '2017-10-05', 10, 0),
(724, 'JAN17/COMP/009U', NULL, NULL, NULL, NULL, 'CS 508', 34, 2, 1, 2, '2017-10-05', 10, 0),
(725, 'JAN17/COMP/009U', NULL, NULL, NULL, NULL, 'CS 509', 34, 2, 1, 2, '2017-10-05', 10, 0),
(726, 'JAN17/COMP/009U', NULL, NULL, NULL, 52, 'CS 510', 34, 2, 1, 2, '2017-10-05', 10, 0),
(727, 'JAN17/COMP/009U', NULL, NULL, NULL, NULL, 'IS 503', 34, 2, 1, 2, '2017-10-05', 10, 0),
(728, 'JAN17/COMP/009U', NULL, NULL, NULL, NULL, 'NW 502', 34, 2, 1, 2, '2017-10-05', 10, 0),
(729, 'SEP16/COMP/013U', NULL, NULL, NULL, 75, 'IS 503', 34, 2, 1, 2, '2017-10-05', 10, 1),
(745, 'MAY15/COMP/0579U', NULL, NULL, NULL, 23, 'IS 503', 85, 2, 1, 2, '2017-10-05', 10, 1),
(746, 'MAY16/COMP/028X', NULL, NULL, NULL, NULL, 'BA 509', 85, 2, 2, 2, '2017-10-05', 10, 0),
(747, 'MAY16/COMP/028X', NULL, NULL, NULL, 65, 'BA 522', 85, 2, 2, 2, '2017-10-05', 10, 0),
(748, 'MAY16/COMP/028X', NULL, NULL, NULL, NULL, 'TM 601', 85, 2, 2, 2, '2017-10-05', 10, 0),
(749, 'MAY16/COMP/020U', NULL, NULL, NULL, NULL, 'BA 509', 39, 2, 2, 2, '2017-10-05', 10, 0),
(750, 'MAY16/COMP/020U', NULL, NULL, NULL, 74, 'BA 522', 39, 2, 2, 2, '2017-10-05', 10, 0),
(751, 'MAY16/COMP/020U', NULL, NULL, NULL, NULL, 'TM 601', 39, 2, 2, 2, '2017-10-05', 10, 0),
(752, 'MAY17/COMP/004U', NULL, NULL, NULL, NULL, 'CS 505', 32, 1, 1, 2, '2017-10-05', 10, 0),
(753, 'MAY17/COMP/004U', NULL, NULL, NULL, 76, 'CS 506', 32, 1, 1, 2, '2017-10-05', 10, 0),
(754, 'MAY17/COMP/004U', NULL, NULL, NULL, NULL, 'CS 507', 32, 1, 1, 2, '2017-10-05', 10, 0),
(755, 'MAY17/COMP/004U', NULL, NULL, NULL, NULL, 'CS 511', 32, 1, 1, 2, '2017-10-05', 10, 0),
(756, 'MAY17/COMP/004U', NULL, NULL, NULL, NULL, 'IS 504', 32, 1, 1, 2, '2017-10-05', 10, 0),
(757, 'MAY17/COMP/004U', NULL, NULL, NULL, 67, 'SE 500', 32, 1, 1, 2, '2017-10-05', 10, 0),
(758, 'MAY17/COMP/004U', NULL, NULL, NULL, 72, 'TM 500', 32, 1, 1, 2, '2017-10-05', 10, 0),
(759, 'MAY17/COMP/003U', NULL, NULL, NULL, NULL, 'CS 505', 32, 1, 1, 2, '2017-10-05', 10, 0),
(760, 'MAY17/COMP/003U', NULL, NULL, NULL, 85, 'CS 506', 32, 1, 1, 2, '2017-10-05', 10, 0),
(761, 'MAY17/COMP/003U', NULL, NULL, NULL, NULL, 'CS 507', 32, 1, 1, 2, '2017-10-05', 10, 0),
(762, 'MAY17/COMP/003U', NULL, NULL, NULL, NULL, 'CS 511', 32, 1, 1, 2, '2017-10-05', 10, 0),
(763, 'MAY17/COMP/003U', NULL, NULL, NULL, NULL, 'IS 504', 32, 1, 1, 2, '2017-10-05', 10, 0),
(764, 'MAY17/COMP/003U', NULL, NULL, NULL, 81, 'SE 500', 32, 1, 1, 2, '2017-10-05', 10, 0),
(765, 'MAY17/COMP/003U', NULL, NULL, NULL, 66, 'TM 500', 32, 1, 1, 2, '2017-10-05', 10, 0),
(766, 'MAY17/COMP/006U', NULL, NULL, NULL, NULL, 'CS 505', 32, 1, 1, 2, '2017-10-05', 10, 0),
(767, 'MAY17/COMP/006U', NULL, NULL, NULL, 7, 'CS 506', 32, 1, 1, 2, '2017-10-05', 10, 0),
(768, 'MAY17/COMP/006U', NULL, NULL, NULL, NULL, 'CS 507', 32, 1, 1, 2, '2017-10-05', 10, 0),
(769, 'MAY17/COMP/006U', NULL, NULL, NULL, NULL, 'CS 511', 32, 1, 1, 2, '2017-10-05', 10, 0),
(770, 'MAY17/COMP/006U', NULL, NULL, NULL, NULL, 'IS 504', 32, 1, 1, 2, '2017-10-05', 10, 0),
(771, 'MAY17/COMP/006U', NULL, NULL, NULL, NULL, 'SE 500', 32, 1, 1, 2, '2017-10-05', 10, 0),
(772, 'MAY17/COMP/006U', NULL, NULL, NULL, 24, 'TM 500', 32, 1, 1, 2, '2017-10-05', 10, 0),
(773, 'JAN17/COMP/010U', NULL, NULL, NULL, 66, 'SE 500', 32, 1, 1, 2, '2017-10-05', 10, 1),
(774, 'MAY17/COMP/005U', NULL, NULL, NULL, NULL, 'CS 505', 34, 1, 1, 2, '2017-10-05', 10, 0),
(775, 'MAY17/COMP/005U', NULL, NULL, NULL, 72, 'CS 506', 34, 1, 1, 2, '2017-10-05', 10, 0),
(776, 'MAY17/COMP/005U', NULL, NULL, NULL, NULL, 'CS 507', 34, 1, 1, 2, '2017-10-05', 10, 0),
(777, 'MAY17/COMP/005U', NULL, NULL, NULL, NULL, 'CS 511', 34, 1, 1, 2, '2017-10-05', 10, 0),
(778, 'MAY17/COMP/005U', NULL, NULL, NULL, NULL, 'IS 504', 34, 1, 1, 2, '2017-10-05', 10, 0),
(779, 'MAY17/COMP/005U', NULL, NULL, NULL, NULL, 'SE 500', 34, 1, 1, 2, '2017-10-05', 10, 0),
(780, 'MAY17/COMP/005U', NULL, NULL, NULL, 34, 'TM 500', 34, 1, 1, 2, '2017-10-05', 10, 0),
(781, 'MAY17/COMP/009U', NULL, NULL, NULL, NULL, 'CS 505', 39, 1, 1, 2, '2017-10-05', 10, 0),
(782, 'MAY17/COMP/009U', NULL, NULL, NULL, 77, 'CS 506', 39, 1, 1, 2, '2017-10-05', 10, 0),
(783, 'MAY17/COMP/009U', NULL, NULL, NULL, NULL, 'CS 507', 39, 1, 1, 2, '2017-10-05', 10, 0),
(784, 'MAY17/COMP/009U', NULL, NULL, NULL, 66, 'CS 511', 39, 1, 1, 2, '2017-10-05', 10, 0),
(785, 'MAY17/COMP/009U', NULL, NULL, NULL, NULL, 'IS 504', 39, 1, 1, 2, '2017-10-05', 10, 0),
(786, 'MAY17/COMP/009U', NULL, NULL, NULL, NULL, 'SE 500', 39, 1, 1, 2, '2017-10-05', 10, 0),
(787, 'MAY17/COMP/009U', NULL, NULL, NULL, 30, 'TM 500', 39, 1, 1, 2, '2017-10-05', 10, 0),
(788, 'SEP16/COMP/013U', NULL, NULL, NULL, NULL, 'IS 603', 34, 1, 2, 2, '2017-10-05', 10, 0),
(789, 'SEP16/COMP/013U', NULL, NULL, NULL, 71, 'NW 600', 34, 1, 2, 2, '2017-10-05', 10, 0),
(790, 'SEP16/COMP/013U', NULL, NULL, NULL, NULL, 'NW 601', 34, 1, 2, 2, '2017-10-05', 10, 0),
(791, 'SEP16/COMP/013U', NULL, NULL, NULL, NULL, 'NW 602', 34, 1, 2, 2, '2017-10-05', 10, 0),
(792, 'SEP16/COMP/013U', NULL, NULL, NULL, 70, 'TM 602', 34, 1, 2, 2, '2017-10-05', 10, 0),
(793, 'SEP16/COMP/026U', NULL, NULL, NULL, NULL, 'IS 603', 34, 1, 2, 2, '2017-10-05', 10, 0),
(794, 'SEP16/COMP/026U', NULL, NULL, NULL, 73, 'NW 600', 34, 1, 2, 2, '2017-10-05', 10, 0),
(795, 'SEP16/COMP/026U', NULL, NULL, NULL, NULL, 'NW 601', 34, 1, 2, 2, '2017-10-05', 10, 0),
(796, 'SEP16/COMP/026U', NULL, NULL, NULL, NULL, 'NW 602', 34, 1, 2, 2, '2017-10-05', 10, 0),
(797, 'SEP16/COMP/026U', NULL, NULL, NULL, 70, 'TM 602', 34, 1, 2, 2, '2017-10-05', 10, 0),
(798, 'MAY16/COMP/019U', NULL, NULL, NULL, 71, 'NW 600', 85, 1, 2, 2, '2017-10-05', 10, 1),
(799, 'Septu0011', NULL, NULL, NULL, 69, 'BA 200', 1, 1, 2, 2, '2017-10-06', 10, 0),
(800, 'Septu0011', NULL, NULL, NULL, 42, 'IS 200', 1, 1, 2, 2, '2017-10-06', 10, 0),
(801, 'Septu0011', NULL, NULL, NULL, 66, 'CS 302', 1, 1, 2, 2, '2017-10-06', 10, 0),
(802, 'Septu0011', NULL, NULL, NULL, 61, 'NW 301', 1, 1, 2, 2, '2017-10-06', 10, 0),
(803, 'Septu0011', NULL, NULL, NULL, 86, 'CS 304', 1, 1, 2, 2, '2017-10-06', 10, 0),
(804, 'Septu0011', NULL, NULL, NULL, 50, 'TM 300', 1, 1, 2, 2, '2017-10-06', 10, 0),
(805, 'Septu0011', NULL, NULL, NULL, 78, 'CS 100', 1, 1, 1, 2, '2017-10-10', 10, 0),
(806, 'Septu0011', NULL, NULL, NULL, 56, 'CS 101', 1, 1, 1, 2, '2017-10-10', 10, 0),
(807, 'Septu0011', NULL, NULL, NULL, 89, 'IT 100', 1, 1, 1, 2, '2017-10-10', 10, 0),
(808, 'Septu0011', NULL, NULL, NULL, 55, 'BA 100', 1, 1, 1, 2, '2017-10-10', 10, 0),
(809, 'Septu0011', NULL, NULL, NULL, 79, 'BA 104', 1, 1, 1, 2, '2017-10-10', 10, 0),
(810, 'Septu0011', NULL, NULL, NULL, 67, 'MT 101', 1, 1, 1, 2, '2017-10-10', 10, 0),
(811, 'Septu0011', NULL, NULL, NULL, 63, 'IT 200', 1, 2, 2, 2, '2017-10-18', 10, 0),
(812, 'Septu0011', NULL, NULL, NULL, 66, 'NW 300', 1, 2, 2, 2, '2017-10-18', 10, 0),
(813, 'Septu0011', NULL, NULL, NULL, 71, 'CS 200', 1, 2, 2, 2, '2017-10-18', 10, 0),
(814, 'Septu0011', NULL, NULL, NULL, 69, 'IS 100', 1, 2, 2, 2, '2017-10-18', 10, 0),
(815, 'Septu0011', NULL, NULL, NULL, 63, 'BA 107', 1, 2, 2, 2, '2017-10-18', 10, 0),
(816, 'Septu0011', NULL, NULL, NULL, 74, 'MT 104', 1, 2, 2, 2, '2017-10-18', 10, 0),
(817, 'Septu0011', NULL, NULL, NULL, 59, 'CS 102', 1, 2, 1, 2, '2017-10-18', 10, 0),
(818, 'Septu0011', NULL, NULL, NULL, 79, 'CS 200', 1, 2, 1, 2, '2017-10-18', 10, 0),
(819, 'Septu0011', NULL, NULL, NULL, 66, 'IS 100', 1, 2, 1, 2, '2017-10-18', 10, 0),
(820, 'Septu0011', NULL, NULL, NULL, 54, 'BA 107', 1, 2, 1, 2, '2017-10-18', 10, 0),
(821, 'Septu0011', NULL, NULL, NULL, NULL, 'MT 104', 1, 2, 1, 2, '2017-10-18', 10, 0);

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `menu_id` int(11) NOT NULL,
  `menu_name` varchar(50) DEFAULT NULL,
  `menu_class` varchar(50) NOT NULL,
  `menu_link` varchar(100) DEFAULT NULL,
  `status` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`menu_id`, `menu_name`, `menu_class`, `menu_link`, `status`) VALUES
(1, 'User Management', 'users_controller', '#', 0),
(3, 'Intakes', 'yearcontroller', '#', 0),
(4, 'Students', 'students_controller', '#', 0),
(5, 'Results', 'marks_controller', '#', 0),
(6, 'Complaints', 'complaint_controller', '#', 0),
(8, 'Campus News', 'news_controller', '#', 0),
(9, 'Campus Events', 'events_controller', '#', 0),
(10, 'Student Registration', 'registrationcontroller', '#', 0),
(11, 'Courses', 'course_controller', '#', 0),
(12, 'Course Units', 'units_controller', '#', 0),
(13, 'Menu Management', 'developer', '#', 0),
(14, 'Universities', 'dashboard', '#', 0),
(15, 'System Menu', 'menu_controller', '#', 0),
(17, 'Suggestion Box', 'suggestion_controller', '#', 0),
(18, 'Counselling', 'counsel_controller', '#', 0),
(19, 'Grading', 'grading_controller', '#', 0),
(20, 'Mini statements', 'mini_statement', '#', 0),
(21, 'Social Network', 'chat_controller', '#', 0),
(22, 'Departments', 'dept_controller', '#', 1),
(23, 'Accounting', 'payments_controller', '#', 0),
(24, 'Time Table', 'time_table', '#', 0),
(25, 'Admin Dashboard', '', '#', 0),
(26, 'Schools', 'schools_controller', '#', 0);

-- --------------------------------------------------------

--
-- Table structure for table `menu_assignments`
--

CREATE TABLE `menu_assignments` (
  `assignmet_id` int(11) NOT NULL,
  `menu_id` int(11) DEFAULT NULL,
  `user_group_id` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `menu_assignments`
--

INSERT INTO `menu_assignments` (`assignmet_id`, `menu_id`, `user_group_id`, `status`) VALUES
(56, 13, 4, 0),
(57, 14, 4, 0),
(251, 1, 30, 0),
(252, 3, 30, 0),
(253, 4, 30, 0),
(254, 5, 30, 0),
(255, 6, 30, 0),
(256, 8, 30, 0),
(257, 9, 30, 0),
(258, 10, 30, 0),
(259, 11, 30, 0),
(260, 12, 30, 0),
(261, 15, 30, 0),
(262, 17, 30, 0),
(263, 18, 30, 0),
(264, 19, 30, 0),
(265, 20, 30, 0),
(266, 21, 30, 0),
(267, 22, 30, 0),
(268, 23, 30, 0),
(269, 1, 32, 0),
(270, 3, 32, 0),
(271, 4, 32, 0),
(272, 5, 32, 0),
(273, 6, 32, 0),
(274, 8, 32, 0),
(275, 9, 32, 0),
(276, 10, 32, 0),
(277, 11, 32, 0),
(278, 12, 32, 0),
(279, 15, 32, 0),
(280, 17, 32, 0),
(281, 18, 32, 0),
(282, 19, 32, 0),
(283, 20, 32, 1),
(284, 21, 32, 0),
(285, 22, 32, 0),
(286, 23, 32, 0),
(287, 24, 32, 0),
(288, 25, 32, 0),
(289, 4, 34, 0),
(290, 6, 34, 0),
(291, 5, 34, 0),
(292, 10, 34, 0),
(293, 11, 34, 0),
(294, 19, 34, 0),
(296, 4, 33, 0),
(297, 5, 33, 0),
(298, 10, 33, 0),
(299, 6, 33, 0),
(300, 11, 33, 0),
(301, 19, 33, 0),
(302, 12, 33, 0),
(303, 12, 34, 0),
(304, 5, 37, 0),
(305, 4, 37, 0),
(306, 6, 37, 0),
(307, 11, 37, 0),
(308, 12, 37, 0),
(309, 24, 37, 0),
(310, 19, 37, 0),
(311, 10, 37, 0),
(312, 3, 34, 0),
(313, 3, 37, 0),
(314, 4, 36, 0),
(315, 23, 36, 0),
(316, 8, 37, 0),
(317, 9, 37, 0),
(318, 17, 37, 0),
(319, 23, 37, 0),
(320, 18, 37, 0),
(321, 21, 37, 0),
(322, 22, 37, 0),
(323, 25, 37, 0),
(324, 1, 37, 0),
(325, 26, 37, 0),
(326, 26, 32, 0);

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `message_id` int(11) NOT NULL,
  `message` varchar(1000) DEFAULT NULL,
  `student_student_id` int(11) DEFAULT NULL,
  `_when_added` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `news_id` int(11) NOT NULL,
  `title` varchar(1000) DEFAULT NULL,
  `news_detail` varchar(2000) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `_when_added` date DEFAULT NULL,
  `_who_added` int(11) DEFAULT NULL,
  `university_university_id` int(11) DEFAULT NULL,
  `views_count` int(50) NOT NULL DEFAULT '0',
  `category_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`news_id`, `title`, `news_detail`, `image`, `_when_added`, `_who_added`, `university_university_id`, `views_count`, `category_id`) VALUES
(1, 'These are news', '<p>hey there just making sure this thing works perfectly 1</p>\r\n', NULL, '2017-12-21', 20, 2, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `news_categories`
--

CREATE TABLE `news_categories` (
  `category_id` int(11) NOT NULL,
  `category` varchar(100) DEFAULT NULL,
  `featured_image` varchar(100) DEFAULT NULL,
  `university_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `news_categories`
--

INSERT INTO `news_categories` (`category_id`, `category`, `featured_image`, `university_id`) VALUES
(1, 'Sports', '', 2),
(2, 'Academic', '', 2),
(3, 'Health', '', 2),
(4, 'Nature', '', 2);

-- --------------------------------------------------------

--
-- Table structure for table `parent`
--

CREATE TABLE `parent` (
  `parent_id` int(11) NOT NULL,
  `name` varchar(40) DEFAULT NULL,
  `user_name` varchar(40) DEFAULT NULL,
  `password` varchar(40) DEFAULT NULL,
  `_status` int(11) DEFAULT '0',
  `_when` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `parent`
--

INSERT INTO `parent` (`parent_id`, `name`, `user_name`, `password`, `_status`, `_when`) VALUES
(1, 'Kato Mike', 'example@gmail.com', '12345', 0, '2018-01-04 09:54:17');

-- --------------------------------------------------------

--
-- Table structure for table `parent_student`
--

CREATE TABLE `parent_student` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `parent_student`
--

INSERT INTO `parent_student` (`id`, `parent_id`, `student_id`) VALUES
(1, 1, 1960);

-- --------------------------------------------------------

--
-- Table structure for table `positions`
--

CREATE TABLE `positions` (
  `id` int(11) NOT NULL,
  `pos_name` varchar(100) DEFAULT NULL,
  `_who_added` int(11) DEFAULT NULL,
  `_when_added` timestamp NULL DEFAULT NULL,
  `_status` varchar(100) DEFAULT '0',
  `university_id` int(11) DEFAULT NULL,
  `allow_fees_complaints` enum('yes','no') DEFAULT 'no',
  `allow_exam_complaints` enum('yes','no') DEFAULT 'no'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `positions`
--

INSERT INTO `positions` (`id`, `pos_name`, `_who_added`, `_when_added`, `_status`, `university_id`, `allow_fees_complaints`, `allow_exam_complaints`) VALUES
(1, 'Senior Academic Registrar', 4, '2017-12-18 10:36:20', '0', 2, 'no', 'no'),
(2, 'Asst Academic Registrar', 4, '2017-12-27 10:37:26', '0', 2, 'yes', 'yes'),
(3, 'Senior Accountant', 15, '2017-12-28 10:51:14', '0', 2, 'yes', 'no'),
(4, 'counselor', 20, '2018-01-07 21:00:00', '0', 2, 'no', 'no');

-- --------------------------------------------------------

--
-- Table structure for table `registered_academic_years`
--

CREATE TABLE `registered_academic_years` (
  `registered_academic_years_id` int(11) NOT NULL,
  `student_student_id` int(11) DEFAULT NULL,
  `year_study` int(11) DEFAULT NULL,
  `semester_semester_id` int(11) DEFAULT NULL,
  `_when_added` date NOT NULL,
  `_who_added` int(11) NOT NULL,
  `_status` int(11) NOT NULL DEFAULT '0' COMMENT '1 student activated,0 inactive'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `registered_academic_years`
--

INSERT INTO `registered_academic_years` (`registered_academic_years_id`, `student_student_id`, `year_study`, `semester_semester_id`, `_when_added`, `_who_added`, `_status`) VALUES
(1, 1960, 1, 1, '2017-10-18', 0, 1),
(2, 1960, 1, 2, '2017-10-18', 0, 1),
(3, 1960, 2, 1, '2017-10-18', 0, 0),
(4, 1960, 2, 2, '2017-10-18', 0, 0),
(5, 630, 1, 2, '2017-10-27', 0, 0),
(6, 1960, 3, 1, '2017-11-01', 0, 0),
(7, 1421, 1, 1, '2017-11-02', 0, 0),
(8, 1468, 2, 1, '2017-11-05', 0, 0),
(9, 1468, 1, 1, '2017-11-05', 0, 0),
(10, 1960, 1, 1, '2017-11-28', 0, 0),
(11, 1960, 4, 1, '2017-11-28', 0, 0),
(33, 2, 1, 2, '2017-12-20', 20, 0),
(34, 1, 1, 1, '2017-12-20', 20, 0),
(35, 1, 1, 1, '2017-12-20', 20, 0),
(36, 3, 1, 1, '2017-12-20', 20, 0),
(37, 8, 1, 2, '2017-12-20', 20, 0),
(38, 2, 2, 2, '2017-12-20', 20, 0),
(39, 1960, 3, 2, '2018-01-04', 0, 0),
(40, 1, 1, 1, '2018-01-09', 20, 0),
(41, 9, 1, 1, '2018-01-09', 20, 0);

-- --------------------------------------------------------

--
-- Table structure for table `registered_course_units`
--

CREATE TABLE `registered_course_units` (
  `reg_course_units_id` int(11) NOT NULL,
  `course_units_units_id` int(11) DEFAULT NULL,
  `student_student_id` int(11) NOT NULL,
  `registered_academic_years_id` int(11) DEFAULT NULL,
  `_who_added` int(11) NOT NULL,
  `_status` int(11) NOT NULL DEFAULT '0' COMMENT '0 not retake,1 retake'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `registered_course_units`
--

INSERT INTO `registered_course_units` (`reg_course_units_id`, `course_units_units_id`, `student_student_id`, `registered_academic_years_id`, `_who_added`, `_status`) VALUES
(1, 121, 1960, 6, 0, 0),
(2, 123, 1960, 6, 0, 0),
(3, 119, 1960, 6, 0, 0),
(4, 118, 1960, 6, 0, 0),
(5, 28, 1960, 1, 0, 1),
(6, 122, 1960, 6, 0, 0),
(7, 120, 1960, 6, 0, 0),
(8, 99, 1960, 4, 0, 0),
(9, 100, 1960, 4, 0, 0),
(10, 101, 1960, 4, 0, 0),
(11, 97, 1960, 4, 0, 0),
(12, 98, 1960, 4, 0, 0),
(13, 115, 1960, 4, 0, 0),
(14, 114, 1960, 4, 0, 0),
(15, 113, 1960, 4, 0, 0),
(16, 112, 1960, 4, 0, 0),
(17, 111, 1960, 4, 0, 0),
(18, 110, 1960, 4, 0, 0),
(19, 109, 1960, 4, 0, 0),
(20, 3, 1, 33, 20, 0),
(21, 4, 1, 33, 20, 0),
(22, 5, 1, 33, 20, 0),
(23, 6, 1, 33, 20, 0),
(24, 1225, 1, 33, 20, 0),
(25, 1229, 1, 33, 20, 0),
(35, 2, 2, 38, 20, 0),
(36, 3, 2, 38, 20, 0),
(37, 4, 2, 38, 20, 0),
(38, 6, 2, 38, 20, 0),
(39, 2, 1, 40, 20, 0),
(40, 3, 1, 40, 20, 0),
(41, 6, 1, 40, 20, 0),
(42, 1225, 1, 40, 20, 0),
(43, 1229, 1, 40, 20, 0),
(44, 3, 9, 41, 20, 0),
(45, 4, 9, 41, 20, 0),
(46, 5, 9, 41, 20, 0),
(47, 6, 9, 41, 20, 0);

-- --------------------------------------------------------

--
-- Table structure for table `reply_complaint`
--

CREATE TABLE `reply_complaint` (
  `reply_id` int(11) NOT NULL,
  `reply` text,
  `_when_replied` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `complaint_id` int(11) DEFAULT NULL,
  `_who_replied` int(11) DEFAULT NULL,
  `user_group` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reply_complaint`
--

INSERT INTO `reply_complaint` (`reply_id`, `reply`, `_when_replied`, `complaint_id`, `_who_replied`, `user_group`) VALUES
(1, 'we are looking into it', '2017-11-30 21:00:00', 6, 20, 'staff');

-- --------------------------------------------------------

--
-- Table structure for table `schools`
--

CREATE TABLE `schools` (
  `school_id` int(11) NOT NULL,
  `school` varchar(100) DEFAULT NULL,
  `university_id` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT '0',
  `_when_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `schools`
--

INSERT INTO `schools` (`school_id`, `school`, `university_id`, `status`, `_when_added`) VALUES
(1, 'School of Business & Management', 2, 0, '2017-09-29 19:16:45'),
(2, 'School of Computing & Engineering', 2, 0, '2017-09-29 19:17:24'),
(3, 'School of Professional & Vocational Education', 2, 0, '2017-09-29 19:19:10');

-- --------------------------------------------------------

--
-- Table structure for table `semesters`
--

CREATE TABLE `semesters` (
  `semester_id` int(11) NOT NULL,
  `semester` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `semesters`
--

INSERT INTO `semesters` (`semester_id`, `semester`) VALUES
(1, 'one'),
(2, 'two');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` int(11) NOT NULL,
  `session_id` char(100) DEFAULT NULL,
  `token` char(200) DEFAULT NULL,
  `session_user` int(11) DEFAULT NULL,
  `last_session` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `session_id`, `token`, `session_user`, `last_session`) VALUES
(57, 'g4ml81u73f80u7jh3s13iepsgofle9pl', 'd7d1225f039abc89355836d9f0b789b45f1d73a2fd2278435230d74eac5ea9d9b2066346ce3b5400f478f9585ab5801266248ceaee392a1b6efc88dc70718f15', 13, '2017-10-21 11:24:47'),
(326, '1afe0f0d9cb2952ab19dae349a83d5026e1811f0', '2fd091109b394c1265f1bdf6d257bfaef237f8f04407b2f51e61e7498f18afb72213ccb9806f71aeb1b99e8d5e064b8ca337e85a8e25504d9e4d8c41084c3ce5', 11, '2017-11-28 17:34:37'),
(383, 'a6a62122e8295a5d803226cbc6fd680a936219c0', '270eb743cbcff5c0c1c14039725c7eb07077ccb36f3b14ea875b3d454c81f497e3c471a39f4c9487a813609101643a601ab070de4602311080e28b2540dd3620', 21, '2017-11-28 18:22:12'),
(646, '6f932a82fe16793aa6906e4495cfffbdb9f96b64', '1dd91dff792c2afbde94d82612bf7430edb886ece450cf80961c1124eb22290019fa7dc6c94fdbc94bc62b63d1e10cd79556b9e04ee3413aaa51eb08befdccf9', 12, '2017-11-28 23:06:00'),
(649, '779f10917673f1450cb217489cb80d4bc164d874', '0200d98adca4e193cdcbdb98d7917e16aa892a2a9ae9d3e9ea1d4248907b5f655c1b7da17485cda9a8a6808fe8a9610245385523ae74c7e7bc313adc67818290', 22, '2017-11-28 23:07:15'),
(2239, '2606d9gc6tk2o9n24onm94t2lk9ouaam', '3c97545d31efdf167384157a9e391a212113da0444df905aabb9557de22d1c5a5371ab7106d10d0ce9fcb5d94fc282923670936b8da1f5c11df844467895dd7d', 4, '2017-12-18 19:27:54'),
(3815, 'b7oe5ljl07nh9p8aeqsriok9qgg1e3om', 'bdc5709dc03b848520f746bc45052b5854498545b4cf2d95ff788ba9f8ca296f6f5e80a2063fc0b49e081e6a0edf7701126547db1eaad6b61c54187256f96e75', 10, '2018-01-03 13:04:40'),
(4387, 'miq9q24lqg5njvpdjt2gva3rvlqhmrbk', '4995cd1fb9bc3de2907ba7d1c29955b9f041d6a67af2956603d3318d36ceb600939bf968ce200f97959a82650931652c3198296dc97073ebdba77271530bf92e', 20, '2018-01-10 05:10:09');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `student_id` int(11) NOT NULL,
  `registration_number` varchar(100) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `gender` varchar(45) DEFAULT NULL,
  `contact` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `photo` varchar(200) DEFAULT NULL,
  `password` varchar(100) NOT NULL,
  `universities_university_id` int(11) NOT NULL,
  `courses_course_id` int(11) DEFAULT NULL,
  `_when_added` date DEFAULT NULL,
  `_who_added` int(11) DEFAULT NULL,
  `intake_intake_id` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `logged_in` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `t_created_on` date DEFAULT NULL,
  `t_updated_on` date DEFAULT NULL,
  `nationality` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`student_id`, `registration_number`, `name`, `gender`, `contact`, `email`, `photo`, `password`, `universities_university_id`, `courses_course_id`, `_when_added`, `_who_added`, `intake_intake_id`, `status`, `logged_in`, `t_created_on`, `t_updated_on`, `nationality`) VALUES
(1, 'MAY13U00001', 'AYEBARE Abraham', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 1, '2017-09-23', 10, 6, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(2, 'MAY13U00002', 'OPUWA  Shadrack', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 1, '2017-09-23', 10, 6, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(3, 'MAY13U00003', 'KIRUNGI Andrew', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 1, '2017-09-23', 10, 6, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(4, 'MAY13U00004', 'SSEKAJJA Mark Henry', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 1, '2017-09-23', 10, 6, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(5, 'MAY13U00005', 'KIREVU Samuel', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 1, '2017-09-23', 10, 6, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(6, 'MAY13U00007', 'NTENDE Patrick', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 1, '2017-09-23', 10, 6, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(7, 'SEP13U00006', 'BOGERE Bob Moses', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 1, '2017-09-23', 10, 7, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(8, 'SEP13U00008', 'TUMWESIGYE Rogers', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 1, '2017-09-23', 10, 7, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(9, 'SEP13U00009', 'TURYAKIRA Winnie', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 1, '2017-09-23', 10, 7, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(10, 'SEP13U00010', 'ATUKUNDA Gift', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 1, '2017-09-23', 10, 7, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(11, 'SEP13U00011', 'WADIKA Luke Wamboga', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 1, '2017-09-23', 10, 7, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(12, 'SEP13U00012', 'OCHOLA Franco', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 1, '2017-09-23', 10, 7, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(13, 'SEP13U00013', 'DHIKUSOOKA Brian', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 1, '2017-09-23', 10, 7, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(14, 'SEP13U00014', 'MUKWANA Leonard', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 1, '2017-09-23', 10, 7, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(15, 'SEP13U00015', 'WAMANI Brayan', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 1, '2017-09-23', 10, 7, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(16, 'SEP13U00016', 'WAMARA Burafiki', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 1, '2017-09-23', 10, 7, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(17, 'SEP13U00017', 'MOYO Martin', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 1, '2017-09-23', 10, 7, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(18, 'SEP13U00018', 'DUMBA Peter', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 1, '2017-09-23', 10, 7, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(19, 'SEP13U00019', 'OTIM Ivan Peter', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 1, '2017-09-23', 10, 7, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(20, 'SEP13U00020', 'MABONGA Nassur', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 1, '2017-09-23', 10, 7, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(21, 'SEP13U00021', 'NAMBWILA Stephen', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 1, '2017-09-23', 10, 7, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(22, 'SEP13U00022', 'MEEYA Isaac Joseph', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 1, '2017-09-23', 10, 7, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(23, 'SEP13U00023', 'ASIIMWE Joshua', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 1, '2017-09-23', 10, 7, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(24, 'SEP13U00024', 'NKOBA Sidney', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 1, '2017-09-23', 10, 7, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(25, 'SEP13U00025', 'RWASHEEMA Newton', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 1, '2017-09-23', 10, 7, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(26, 'SEP13U00026', 'TWESIGYE Keneth', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 1, '2017-09-23', 10, 7, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(27, 'SEP13U00027', 'KASAWULI John Baptist', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 1, '2017-09-23', 10, 7, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(28, 'SEP13U00028', 'AGABA Godwin Mubangizi ', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 1, '2017-09-23', 10, 7, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(29, 'SEP13U00029', 'NKURUNZIZA Frank', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 1, '2017-09-23', 10, 7, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(30, 'SEP13U00030', 'BEINGANA Tadeo Byarugaba', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 1, '2017-09-23', 10, 7, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(31, 'SEP13U00031', 'NAMIRENGO Norman Peter', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 1, '2017-09-23', 10, 7, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(32, 'SEP13U00032', 'JJUUKO Roland Peter', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 1, '2017-09-23', 10, 7, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(33, 'SEP13T00033', 'MTABAZI Simon', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 1, '2017-09-23', 10, 7, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(34, 'SEP13U00034', 'TUMURAMYE Vicent', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 1, '2017-09-23', 10, 7, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(35, 'SEP13U00035', 'KARUGABA Amos', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 1, '2017-09-23', 10, 7, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(36, 'SEP13U00036', 'KASULE Mark', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 1, '2017-09-23', 10, 7, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(37, 'SEP13U00037', 'WALUGEMBE Musa', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 1, '2017-09-23', 10, 7, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(38, 'SEP13U00038', 'DROMA Natal Odrua', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 1, '2017-09-23', 10, 7, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(39, 'SEP13U00039', 'SSEKYEWA Timothy', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 1, '2017-09-23', 10, 7, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(40, 'SEP13U00040', 'LUTAAKOME Hajarah', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 1, '2017-09-23', 10, 7, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(41, 'SEP13U00041', 'KAGGWA Godfrey', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 1, '2017-09-23', 10, 7, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(42, 'SEP13U00042', 'WACHA Benjamin', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 1, '2017-09-23', 10, 7, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(43, 'SEP13X00043', 'MAFENDE Tonny', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 1, '2017-09-23', 10, 7, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(44, 'MAY14U00044', 'KAGGWA Godfrey', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 1, '2017-09-23', 10, 8, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(45, 'MAY14U00045', 'KIHUMURO Musana Peter', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 1, '2017-09-23', 10, 8, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(46, 'MAY14U01058', 'LUBERENGA Hosea', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 1, '2017-09-23', 10, 8, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(47, 'MAY14U00046', 'NAFUYE Emmanuel Joseph', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 1, '2017-09-23', 10, 8, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(48, 'MAY14U00047', 'TUKASHABA Leonard', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 1, '2017-09-23', 10, 8, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(49, 'SEP14U00048', 'KASOZI Henry', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 1, '2017-09-23', 10, 9, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(50, 'SEP14U00050', 'ASIIMWE Roland', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 1, '2017-09-23', 10, 9, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(51, 'SEP14U00051', 'ANGU Paul', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 1, '2017-09-23', 10, 9, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(52, 'SEP14U00052', 'NAKASI Dorothy', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 1, '2017-09-23', 10, 9, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(53, 'SEP14U00054', 'KAMUTUHAIRE Priscah', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 1, '2017-09-23', 10, 9, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(54, 'SEP14U00056', 'NAMIRENGO Norman Peter', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 1, '2017-09-23', 10, 9, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(55, 'SEP14U00057', 'OKENA Ivan', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 1, '2017-09-23', 10, 9, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(56, 'SEP14U00058', 'SSENONO Simon', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 1, '2017-09-23', 10, 9, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(57, 'SEP14U00059', 'KIMBUGWE Anthony Mirembe', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 1, '2017-09-23', 10, 9, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(58, 'SEP14U01060', 'NYAMUNDU Stella Mary', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 1, '2017-09-23', 10, 9, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(59, 'SEP14U00060', 'NAMBWILA Stephen', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 1, '2017-09-23', 10, 9, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(60, 'SEP14U00061', 'BUSINGE Christian', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 1, '2017-09-23', 10, 9, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(61, 'SEP14U00062', 'TAREMWA Mason', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 1, '2017-09-23', 10, 9, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(62, 'SEP14U01368', 'OJAKU Emmanuel', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 1, '2017-09-23', 10, 9, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(63, 'SEP14U01061', 'MULYOWA Ronald', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 1, '2017-09-23', 10, 9, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(64, 'SEP14U00063', 'BYAMUGISHA E Isaac', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 1, '2017-09-23', 10, 9, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(65, 'SEP14K00064', 'MASITSAH James Livondo', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 1, '2017-09-23', 10, 9, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(66, 'JAN15U00065', 'TUHAIRWE Peter Dwayne', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 1, '2017-09-23', 10, 1, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(67, 'MAY15U00066', 'NSUBUGA Humphrey', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 1, '2017-09-23', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(68, 'MAY15U00067', 'NAKISEKA Velonica', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 1, '2017-09-23', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(69, 'MAY15U00068', 'MAZINGA Adam', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 1, '2017-09-23', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(70, 'MAY15U00069', 'MUGYISHA Hussein', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 1, '2017-09-23', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(71, 'JAN15U01371', 'TURINAWE Titus', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 1, '2017-09-23', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(72, 'MAY15U01174', 'KAMYA Joseph S', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 1, '2017-09-23', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(73, 'SEP14U00055', 'KISWIRIRI Hamam', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 1, '2017-09-23', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(74, 'JAN15U01064', 'MBWALI Ashah', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 1, '2017-09-23', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(75, 'JAN15U01173', 'SADAT Anuar Mustafa', 'M', NULL, NULL, '1509229523228.jpg', '123de87245b2af8d9ce5cd6926a9e45b967a9208', 2, 1, '2017-09-23', 10, 2, 0, '2017-10-28 22:25:27', NULL, NULL, NULL),
(76, 'MAY15U00070', 'AKENA Joshua', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 1, '2017-09-23', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(77, 'MAY15U00071', 'BONGOMIN Bezy Chris', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 1, '2017-09-23', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(78, 'SEP15U00073', 'ABITEKANIZA Collins', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 1, '2017-09-23', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(79, 'SEP15U00075', 'OGWAL Andrew Ogemo', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 1, '2017-09-23', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(80, 'SEP15U00076', 'AHIMBISIBWE James', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 1, '2017-09-23', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(81, 'SEP15U00077', 'ASIIMWE Joseph', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 1, '2017-09-23', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(82, 'SEP15U00078', 'SENTAMU Brain Joseph', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 1, '2017-09-23', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(83, 'SEP15U00561', 'MWESIGA Jordan Pearl', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 1, '2017-09-23', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(84, 'SEP15U00079', 'AINOMUGISHA Gerald', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 1, '2017-09-23', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(85, 'SEP15U00080', 'OTIM Aaron Thomas', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 1, '2017-09-23', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(86, 'SEP15U00081', 'BUSINGE Christian', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 1, '2017-09-23', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(87, 'SEP15U00082', 'JJUMBA Ian Ivan Kalibwani', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 1, '2017-09-23', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(88, 'SEP15U00083', 'BEROCAN Samuel', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 1, '2017-09-23', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(89, 'SEP15K00084', 'WANJIRU Frumence Kariuki', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 1, '2017-09-23', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(90, 'SEP15U00085', 'NAMIRENGO Norman Peter', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 1, '2017-09-23', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(91, 'SEP15U01066', 'KABUYE Ivan', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 1, '2017-09-23', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(92, 'SEP15U02034', 'KAVUMA Sulaiman', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 1, '2017-09-23', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(93, 'SEP15U00086', 'GUMA Peter Winstone', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 1, '2017-09-23', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(94, 'SEP15U01376', 'PANDE Alex', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 1, '2017-09-23', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(95, 'SEP15U00087', 'KYOKUMANYA Cynthia Martha', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 1, '2017-09-23', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(96, 'SEP15U00088', 'BIGIRWA Didas', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 1, '2017-09-23', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(97, 'JAN16/U/106', 'WABWIRE Allan', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 1, '2017-09-23', 10, 11, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(98, 'JAN16/U/107', 'AHABWE Brian', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 1, '2017-09-23', 10, 11, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(99, 'JAN16/U/108', 'KAKEMBO Hakim', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 1, '2017-09-23', 10, 11, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(100, 'JAN16/U/109', 'BUYE Alvin', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 1, '2017-09-23', 10, 11, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(101, 'MAY16/U/086', 'APIRE John Bosco', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 1, '2017-09-23', 10, 4, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(102, 'MAY16/U/088', 'MASABA Martin', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 1, '2017-09-23', 10, 4, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(103, 'SEP16/U/143', 'OBOMBA Ben', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 1, '2017-09-23', 10, 12, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(104, 'SEP16/U/144', 'MAGANDA Jerome Pius', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 1, '2017-09-23', 10, 12, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(105, 'SEP16/U/145', 'NKAHEBWA Norris', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 1, '2017-09-23', 10, 12, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(106, 'SEP16/U/146', 'KICONCO Morgan Lucky', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 1, '2017-09-23', 10, 12, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(107, 'SEP16/X/087', 'AFANI Martin', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 1, '2017-09-23', 10, 12, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(108, 'SEP16/U/147', 'ZAAKE Lukonge', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 1, '2017-09-23', 10, 12, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(109, 'SEP16/U/149', 'OKWONGA Emmanuel', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 1, '2017-09-23', 10, 12, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(110, 'SEP16/U/151', 'JOSHUA Mpaka', 'M ', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 1, '2017-09-23', 10, 12, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(111, 'SEP16/U/152', 'WACHA Benjamin', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 1, '2017-09-23', 10, 12, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(112, 'SEP16/U/153', 'MUGISHA Rwandanda Aggrey', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 1, '2017-09-23', 10, 12, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(113, 'SEP16/U/008', 'BAMUTA Yusuf', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 1, '2017-09-23', 10, 12, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(114, 'SEP16/U/154', 'KYANKYA Raymond', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 1, '2017-09-23', 10, 12, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(115, 'MAY17/U/150', 'OKIA Jeremiah Newman', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 1, '2017-09-23', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(116, 'MAY17/U/151', 'TUGUME Jimmy Fred', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 1, '2017-09-23', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(117, 'MAY17/U/152', 'ADOA Charles', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 1, '2017-09-23', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(118, 'SEP17/U/180', 'TURYATEMBA Esau Baron', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 1, '2017-09-23', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(119, 'SEP17/U/181', 'MEDEYI Jude Tadeo', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 1, '2017-09-23', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(120, 'SEP17/U/182', 'NTALE Marvine', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 1, '2017-09-23', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(121, 'SEP17/U/183', 'MUWONGE Lawrence', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 1, '2017-09-23', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(122, 'SEP17/U/185', 'DUKU Dickens Losio', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 1, '2017-09-23', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(123, 'SEP17/U/186', 'OKWALINGA Gerald', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 1, '2017-09-23', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(124, 'SEP17/U/187', 'OWANI Stephen', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 1, '2017-09-23', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(125, 'SEP17/U/188', 'KAKURU Elisa', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 1, '2017-09-23', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(126, 'SEP17/U/189', 'NANKWANGA Annet', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 1, '2017-09-23', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(127, 'SEP17/U/190', 'ALUONZI Joe Andruvule', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 1, '2017-09-23', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(128, 'SEP17/U/191', 'NAMUTEBI Mariam', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 1, '2017-09-23', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(129, 'SEP17/U/192', 'KULOBA Janan', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 1, '2017-09-23', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(130, 'SEP17/U/193', 'NATA Anthony', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 1, '2017-09-23', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(131, 'SEP17/U/194', 'CHEMUTAI Ronnie', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 1, '2017-09-23', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(132, 'SEP17/U/195', 'ETTEDU Gad Andrew', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 1, '2017-09-23', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(133, 'SEP17/U/196', 'KIGWANA Emma', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 1, '2017-09-23', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(134, 'SEP17/U/197', 'IMALINGAT Engirot Joram', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 1, '2017-09-23', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(135, 'MAY13U00101', 'KALULE Joel Paul', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 6, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(136, 'MAY13U00102', 'ASIIMWE Enock', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 6, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(137, 'MAY13U00103', 'KIMEZE Dickson', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 6, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(138, 'MAY13U00104', 'ADERO Everline', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 6, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(139, 'MAY13U00105', 'OGUTA Emmanuel', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 6, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(140, 'MAY13U00106', 'HAGUMAKUBAHO Damaseni', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 6, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(141, 'MAY13U00107', 'WAIGULO Mathias', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 6, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(142, 'MAY13U00108', 'TAREMWA Isaac', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 6, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(143, 'MAY13U00109', 'AMANYA Dickson', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 6, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(144, 'MAY13U00110', 'ARINAITWE Daniel', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 6, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(145, 'MAY13U00111', 'MULINDWA Isaac', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 6, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(146, 'MAY13U00112', 'BYARUHANGA Peter', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 6, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(147, 'MAY13U00113', 'KANGAVE Brendah', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 6, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(148, 'MAY13U00114', 'TURYAZOOKA Eliphaz', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 6, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(149, 'MAY13U00119', 'BUSINGYE Maurice Rodney', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 6, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(150, 'MAY13U00120', 'AKANKWASA Brian', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 6, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(151, 'MAY13U00122', 'WAMALA Daniel', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 6, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(152, 'SEP13U00115', 'AINEOMUGISHA Tryphine', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 7, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(153, 'SEP13U00116', 'ODONG Francis', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 7, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(154, 'SEP13U00117', 'OJOK Ali Akiim', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 7, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(155, 'SEP13U00118', 'NKUUSI Thomas', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 7, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(156, 'SEP13U00121', 'MUKURU Ruth Rabwoni', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 7, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(157, 'SEP13U00123', 'KYAMBADDE Jonathan Mark', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 7, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(158, 'SEP13U00124', 'NSIIME Paul', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 7, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(159, 'SEP13U00125', 'WAKABALA Kenneth', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 7, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(160, 'SEP13U00126', 'TUSIIME Innocent Boub', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 7, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(161, 'SEP13U00127', 'KARUHANGA Mark Oscar', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 7, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(162, 'SEP13U00128', 'KASINGYE Israel', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 7, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(163, 'SEP13U00129', 'AGAMILE Ronald', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 7, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(164, 'SEP13U00130', 'TWINAMASIKO Joshua G', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 7, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(165, 'SEP13U00131', 'MULINDWA Isaac', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 7, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(166, 'SEP13U00132', 'KIYEGA Denis', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 7, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(167, 'SEP13U00133', 'OKOINE Abraham', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 7, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(168, 'SEP13U00134', 'KAZIGAABA Jacob', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 7, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(169, 'SEP13U00135', 'NINSIIMA Gloria', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 7, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(170, 'SEP13U00136', 'KAMUGISHA Florence', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 7, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(171, 'SEP13U00137', 'NASSANGA Ritah', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 7, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(172, 'SEP13U00138', 'MUGASIRA Reagan', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 7, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(173, 'SEP13U00139', 'OUMO Adonai', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 7, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(174, 'SEP13U00140', 'MULLO Muhamadi', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 7, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(175, 'SEP13U00141', 'MULEMA Ronald', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 7, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(176, 'SEP13U00142', 'OMIO Eliphaz Abado', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 7, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(177, 'SEP13U00143', 'WABUNOHA Edwin', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 7, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(178, 'SEP13U00144', 'MUYIGE Marvine', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 7, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(179, 'SEP13U00145', 'OPOYA Peter', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 7, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(180, 'SEP13U00146', 'EMURWON Albert', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 7, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(181, 'SEP13U00147', 'BEROCAN Felix', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 7, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(182, 'SEP13U00148', 'NASSALI Justine', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 7, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(183, 'SEP13U00149', 'MULINDWA Michael', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 7, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(184, 'SEP13U00150', 'KIBUUKA Apollo Tonny', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 7, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(185, 'SEP13U00153', 'KAHONDAH Junetae', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 7, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(186, 'SEP13U00155', 'NSUBUGA Edrine', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 7, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(187, 'SEP13U00156', 'NAMUDDU Zainabu', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 7, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(188, 'SEP13U00157', 'NAKALYANGO Sandra', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 7, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(189, 'SEP13U00158', 'OWOR Yoas Onyango', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 7, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(190, 'SEP13U00159', 'KIWANUKA Stinta', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 7, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(191, 'SEP13U00160', 'BABIRYE Catherine', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 7, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(192, 'SEP13U00161', 'NAKATO Caroline', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 7, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(193, 'SEP13U00162', 'KOKUNDA Grace', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 7, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(194, 'SEP13U00163', 'CHAPA Rodgers', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 7, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(195, 'SEP13U00164', 'MUKISA Ronald', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 7, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(196, 'SEP13U00165', 'TUSABE Stephene', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 7, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(197, 'SEP13U00166', 'WAMALA Daniel', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 7, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(198, 'SEP13U00167', 'RUTAREMWA Ronald', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 7, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(199, 'SEP13U00168', 'KABANDA Frank', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 7, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(200, 'SEP13U00169', 'KIMBUGWE Nasser', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 7, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(201, 'SEP13U00170', 'BUKENYA Ronald', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 7, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(202, 'SEP13U00171', 'OKENYA Douglas', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 7, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(203, 'SEP13U00172', 'NABUKEERA Ritah', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 7, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(204, 'SEP13U00173', 'ALOWO Felistas', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 7, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(205, 'SEP13U00174', 'LUYIGA Sanyu Harriet', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 7, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(206, 'SEP13U00175', 'KISEMBO Lawrence', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 7, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(207, 'SEP13U00176', 'NANGENDO Noel Brendah', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 7, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(208, 'SEP13U00177', 'MUGARURA Martin', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 7, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(209, 'SEP13U00178', 'NASSAKA Proscovia', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 7, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(210, 'SEP13U00179', 'SSEGAWA Raymond', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 7, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(211, 'SEP13U00180', 'NSUBUGA Abbey', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 7, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(212, 'SEP13U00181', 'ETYANG Patrick', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 7, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(213, 'SEP13U00182', 'NAMIGADDE Tracy', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 7, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(214, 'SEP13U00183', 'AYEBARE Loyce', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 7, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(215, 'SEP13U00184', 'NKAYIVU Hannington', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 7, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(216, 'SEP13U00185', 'WAISWA Wilson', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 7, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(217, 'SEP13U00187', 'BIRAKWATE Peter', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 7, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(218, 'SEP13U00188', 'BWIRE James', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 7, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(219, 'SEP13U00189', 'SSAKA Phillip', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 7, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(220, 'SEP13U00190', 'WADDA Chester Yiga', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 7, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(221, 'SEP13U00191', 'KISUULE Allan', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 7, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(222, 'SEP13U00192', 'WAMANGA W Moses', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 7, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(223, 'SEP13U00193', 'NKURUNZIZA Richard', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 7, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(224, 'SEP13U00194', 'NUWALINDA Ronald Reagan', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 7, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(225, 'SEP13U00195', 'TURYATEMBA Isaac', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 7, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(226, 'SEP13U00198', 'MWEBESA Laban', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 7, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(227, 'SEP13U00199', 'MUTATIINA Robert Fischer', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 7, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(228, 'SEP13U00200', 'LAMUNU Emily Joan', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 7, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(229, 'SEP13U00201', 'ANGALA Timothy', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 7, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(230, 'SEP13U00203', 'OLUPOT Nathan-Ernest', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 7, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(231, 'SEP13U00204', 'LWEVUZE Joseph', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 7, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(232, 'SEP13U00205', 'ARINDA Joram K', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 7, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(233, 'SEP13U00477', 'ARIHO Isaac', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 7, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(234, 'SEP13U00486', 'MUNYAMBABAZI Nicholas', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 7, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(235, 'SEP13U00488', 'IDINYO Anna', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 7, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(236, 'SEP13X00152', 'KALEB Tibebe', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 7, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(237, 'JAN14U00196', 'BYARUHANGA Emmanuel', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 14, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(238, 'JAN14U00197', 'SSIMBWA Steven', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 14, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(239, 'JAN14U00202', 'IDINYO Anna', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 14, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(240, 'JAN14U00206', 'MUGARURA Enock', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 14, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(241, 'JAN14U00207', 'OLUPOT Nathan-Ernest', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 14, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(242, 'JAN14U00208', 'MUGABI Collins J', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 14, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(243, 'JAN14U00209', 'NASSANGA Ann Mary', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 14, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(244, 'JAN14U00210', 'KIRABO Ivan', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 14, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(245, 'JAN14U00212', 'ENABU Emmanuel', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 14, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(246, 'JAN14U00213', 'NAKANWAGI Rosemary', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 14, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(247, 'JAN14U00214', 'NAYEBARE Phillip', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 14, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(248, 'JAN14U00215', 'MUTATIINA Robert Fischer', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 14, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(249, 'JAN14U00216', 'KABARWANI Maureen', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 14, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(250, 'JAN14U00217', 'NYERO Moses', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 14, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(251, 'JAN14U00218', 'OPIO Christian Daniel', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 14, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(252, 'JAN14U00219', 'WAFULA Abuneery', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 14, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(253, 'JAN14U00220', 'RUKUNDO Wyclife', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 14, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(254, 'JAN14U00221', 'KAGIMU Vincent', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 14, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(255, 'JAN14U00222', 'MUHWEZI Robert', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 14, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(256, 'JAN14U00223', 'WAISWA Frank', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 14, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(257, 'JAN14U00225', 'BUTERA Stephen', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 14, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(258, 'JAN14U00226', 'TAYLOR Eric', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 14, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(259, 'JAN14U00228', 'AYEBARE Loyce', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 14, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(260, 'JAN14U00229', 'OKIROR Joseph', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 14, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(261, 'MAY14U00231', 'BAGUMA Alex', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 8, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(262, 'MAY14U00232', 'MADANDA Jordan', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 8, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(263, 'MAY14U00233', 'BWIRE Kenneth', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 8, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(264, 'MAY14U00234', 'LODIKO Emmanuel', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 8, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(265, 'MAY14U00236', 'MURUNGI Martin', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 8, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(266, 'MAY14U00237', 'SSEKITONDO Jonathan', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 8, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(267, 'MAY14U00238', 'MURUYE  Stephen', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 8, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(268, 'MAY14U00230', 'OMIO Eliphaz Abado', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 8, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(269, 'SEP14U00049', 'TWINOMUGISHA E L Jenkins', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 9, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(270, 'SEP14U00211', 'OWORA John Enock', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 9, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(271, 'SEP14U00235', 'ACIDRI Samuel Baker', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 9, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(272, 'SEP14U00239', 'LUBEGA Nicholas', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 9, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(273, 'SEP14U00240', 'LEMA Larsen Osoa', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 9, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(274, 'SEP14U00241', 'NYAKATO Justine', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 9, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(275, 'SEP14U00242', 'MWESIGWA Denis', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 9, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(276, 'SEP14U00243', 'ACAN Caroline', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 9, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(277, 'SEP14U00244', 'MUHUMUZA Michael', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 9, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(278, 'SEP14U00246', 'ASIIMWE Mujuni David', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 9, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(279, 'SEP14U00247', 'ASHABAAHEEBWA Doris', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 9, 0, '2017-10-10 11:51:32', NULL, NULL, NULL);
INSERT INTO `student` (`student_id`, `registration_number`, `name`, `gender`, `contact`, `email`, `photo`, `password`, `universities_university_id`, `courses_course_id`, `_when_added`, `_who_added`, `intake_intake_id`, `status`, `logged_in`, `t_created_on`, `t_updated_on`, `nationality`) VALUES
(280, 'SEP14U00248', 'EWIN Cavine', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 9, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(281, 'SEP14U00249', 'KISAKYE Allan', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 9, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(282, 'SEP14U00250', 'OMIO Eliphaz Abado', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 9, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(283, 'SEP14U01967', 'MUNGUACIEL Peter Angala', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 9, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(284, 'SEP14U01968', 'MURUNGI Martin', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 9, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(285, 'SEP14U01969', 'NIRINGIYE Aaron', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 9, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(286, 'SEP14U01970', 'ATUHEIRE Ronald', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 9, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(287, 'SEP14U01971', 'SSENOGA Paul', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 9, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(288, 'SEP14U01972', 'NOWAMANI Davis Donman', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 9, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(289, 'SEP14U01973', 'NYAKOOJO Trevor', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 9, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(290, 'SEP14U01974', 'NIWABINE Anita', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 9, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(291, 'SEP14U01975', 'ATIM Dorrish Harriet', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 9, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(292, 'SEP14U01976', 'NAMANYA Lyne', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 9, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(293, 'SEP14U01977', 'MUSOKE Juma', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 9, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(294, 'SEP14U01978', 'ASIIMWE Brian', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 9, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(295, 'SEP14U01979', 'BABIRYE Judith Naome', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 9, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(296, 'SEP14U01980', 'TUMWIINE James', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 9, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(297, 'SEP14U01981', 'LUBELLA Isaac', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 9, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(298, 'SEP14U01982', 'NUWALINDA Ronald Reagan', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 9, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(299, 'SEP14U01983', 'TAYLOR Eric', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 9, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(300, 'SEP14U01984', 'ABAHO Peace', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 9, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(301, 'SEP14U01985', 'OKELLO Benson', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 9, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(302, 'SEP14U01986', 'LUTWA Joseph', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 9, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(303, 'SEP14U01987', 'BUNOTI Edwin', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 9, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(304, 'SEP14U01988', 'NASASIRA Eliphaz', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 9, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(305, 'SEP14U01989', 'TUMUKUNDE Joseph', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 9, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(306, 'SEP14U01867', 'KATEREGGA Deo', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 9, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(307, 'SEP14U01866', 'ARIHO Bob', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 9, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(308, 'SEP14U01990', 'LODIKO Emmanuel', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 9, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(309, 'SEP14X01991', 'MONGOU Sallah Joseph', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 9, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(310, 'SEP14U01992', 'MURUNGI Phillip', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 9, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(311, 'SEP14U01993', 'AHMED Ibrahim', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 9, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(312, 'SEP14U01994', 'WANDERA Paul', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 9, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(313, 'SEP14U01995', 'MUSISI Salim', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 9, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(314, 'SEP14U01996', 'GUMA Tee Sergi', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 9, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(315, 'SEP14U01997', 'MUCUNGUZI Edmond Edward', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 9, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(316, 'JAN15U01998', 'TUGUME Ivan', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 1, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(317, 'JAN15U01999', 'AANYU Ruth Epetait', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 1, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(318, 'JAN15U02000', 'ETOU Patrick Lumumba', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 1, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(319, 'JAN15U02001', 'EKAJU Charles', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 1, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(320, 'JAN15X02002', 'NGABONZIZA Dominique', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 1, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(321, 'JAN15U02003', 'NAMBOGGA Irene Joy', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 1, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(322, 'JAN15U02004', 'BUGEMBE Robert', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 1, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(323, 'JAN15U00661  ', 'ATYANG Racheal', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 1, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(324, 'JAN15U01769', 'KAJJIMU Ivan', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 1, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(325, 'JAN15U01569', 'BINGI Steven', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 1, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(326, 'JAN15U01172', 'NAMUFUTA Hopeline', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 1, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(327, 'JAN15U01171', 'MUGISHA Brian', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 1, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(328, 'JAN15U02120', 'KATONGOLE Samuel', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 1, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(329, 'JAN15U01063', 'ATUHURIIRE Goodman M', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 1, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(330, 'JAN15U02005', 'WAISWA Philip', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 1, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(331, 'JAN15U01264', 'ECUM Jamil', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 1, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(332, 'JAN15U02006', 'APIO Mary Sarah Odongo', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 1, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(333, 'JAN15U02007', 'NAYEBARE Jovert', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 1, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(334, '**JAN15U02009', 'DHIOBUAZIE Nelsonnel', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 1, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(335, 'MAY15U02010', 'YOUNG Andrew', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(336, 'MAY15U02011', 'ATIDRI Leonard', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(337, 'MAY15U02012', 'MUHINDO Zamari', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(338, 'MAY15U02013', 'OLOYA John', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(339, 'MAY15U02015', 'SEBIRUMBI Emmanuel', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(340, 'MAY15U02016', 'ASIIMWE Arthur', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(341, 'MAY15U02017', 'TUMWESIGYE Julius', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(342, 'MAY15U02019', 'OKWI Julius', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(343, 'MAY15U02021', 'ORANIT Steven', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(344, 'MAY15U02022', 'NAKANYIGA Esther', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(345, 'MAY15U02023', 'TEBYASA Mike Perez', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(346, 'MAY15U02024', 'MUGABE Ahammed', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(347, 'MAY15U02025', 'TABAN Oscar Hatemere', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(348, 'MAY15U02030', 'GARINDWA Amos', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(349, 'SEP15U02014', 'TAMALE Cleophas', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(350, 'SEP15U02020', 'ISABIRYE Nathan', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(351, 'SEP15U02026', 'NAMANYA Elious', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(352, 'SEP15U02027', 'NNASSOZI Agnes', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(353, 'SEP15U02028', 'KATO Hussein', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(354, 'SEP15U02029', 'SSEBWATO Francis', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(355, 'SEP15U02031', 'ELEMAN Hillary Banabas', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(356, 'SEP15U02032', 'BWENGYE Caleb', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(357, 'SEP15U02033', 'TUMUSIIME Allan', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(358, 'SEP15U02035', 'ACHIRE John Paul', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(359, 'SEP15U02037', 'EDOKU Patrick', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(360, 'SEP15U02038', 'ABILI Michael Paul', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(361, 'SEP15U02040', 'OLUKA Bruno Sserunkuma', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(362, 'SEP15U02041', 'ASIIMWE  Brian', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(363, 'SEP15U02018', 'KIGANDA Henry', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(364, 'SEP15U02044', 'KABAGAMBE Hudson', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(365, 'SEP15U02045', 'KIBIKYO Lilian Kalinaki', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(366, 'SEP15U02046', 'NABAGGALA Dorothy Blessed', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(367, 'SEP15U02047', 'KIBERU James', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(368, 'SEP15U02048', 'NOWAMANI Emmanuel', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(369, 'SEP15U02049', 'TUHINDUKYE Johnathan', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(370, 'SEP15U02051', 'MASANJA Moses', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(371, 'SEP15U02052', 'BARUMU Edwin', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(372, 'SEP15U02053', 'SEKIKUBO Raymond', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(373, 'SEP15U02054', 'MUTESASIRA Hawah Bangi', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(374, 'SEP15U02055', 'WABWIRE Kelvin', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(375, 'SEP15U02056', 'HIGENYI Ronald', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(376, 'SEP15U02057', 'MULINDWA Isaac', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(377, 'SEP15U02058', 'MUNYELELE Gerald', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(378, 'SEP15U01572', 'OKECH Emmanuel Ojok', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(379, 'SEP15U02059', 'AKOCH Leonard', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(380, 'SEP15U02060', 'NAMARA Blessing', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(381, 'SEP15U02061', 'NALUNGA Cynthia', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(382, 'SEP15U00677', 'ATUKUNDA Onesmus', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(383, 'SEP15U02062', 'DHIOBUAZIE Nelsonnel', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(384, 'SEP15U02063', 'TUMUHEKI Dalton', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(385, 'SEP15U02064', 'NSHEMERIRWE Fiona', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(386, 'SEP15U02066', 'OBINA Godwin', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(387, 'SEP15U02067', 'ASIIMWE Joseph', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(388, 'SEP15U02068', 'MUBEEZI Lydia Kayima', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(389, 'SEP15U02069', 'PANDYA Yagnesha Vikaskumar', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(390, 'SEP15U00534', 'NABWETEME Annet', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(391, 'SEP15U02070', 'AMPAIRE Martha Sandra', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(392, 'SEP15X01067', 'ABUBAKAR Nura Mai-Shanu', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(393, 'SEP15U02071', 'MUKIIBI Moses', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(394, 'JAN16/U/126', 'SSEMWANGA Ssenkungu Marti', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 11, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(395, 'JAN16/U/127', 'JAGGWE Allan', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 11, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(396, 'JAN16/U/128', 'MURIISA David', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 11, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(397, 'JAN16/U/129', 'OWOR Godfrey', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 11, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(398, 'JAN16/U/130 ', 'MBIRA Arajab', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 11, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(399, 'JAN16/U/105', 'KAWEESA James', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 11, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(400, 'JAN16/U/131 ', 'KISITU Victor Miclovich', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 11, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(401, 'JAN16/U/132 ', 'OSUNA Amos Benny', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 11, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(402, 'JAN16/U/133 ', 'KATEREGGA Twaibu', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 11, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(403, 'JAN16/U/134', 'OKELLO Haggai', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 11, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(404, 'JAN16/U/135', 'KAYE Francis', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 11, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(405, 'JAN16/U/136', 'MUHUMUZA Brian', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 11, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(406, 'JAN16/U/137', 'NAMAKULA Mirriam', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 11, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(407, 'MAY16/U/042', 'OJOK Innocent', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 4, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(408, 'MAY16/U/001', 'KASHAKA Carolyne Daizy', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 4, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(409, 'MAY16/U/002', 'ETURU Donald', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 4, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(410, 'MAY16/U/003', 'ASHABA Grace', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 4, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(411, 'MAY16/X/004', 'ACHIRE Charles Lino Pio', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 4, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(412, 'MAY16/U/005', 'KWESIGA Blair', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 4, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(413, 'MAY16/U/006', 'MUHEREZA Gerald', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 4, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(414, 'MAY16/U/007', 'MABBERI Enock', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 4, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(415, 'MAY16/U/009', 'MUGISHA Rodney', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 4, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(416, 'MAY16/U/010', 'BWIRE Chris Buya', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 4, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(417, 'MAY16/U/011', 'EDAKASI Emmanuel', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 4, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(418, 'MAY16/U/109', 'TIMAT Ann Grace', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 4, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(419, 'MAY16/U/012', 'TALEMWA Solomon', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 4, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(420, 'MAY16/U/064', 'EDWARU Ephraim', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 4, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(421, 'MAY16/U/013', 'ANGUYO Johnson', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 4, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(422, 'MAY16/X/014', 'ADAM Muhammad Aminu', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 4, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(423, 'MAY16/U/015', 'ATUHAIRE Milly Basheka', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 4, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(424, 'SEP16/U/008', 'BAGUMA Dean', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 12, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(425, 'SEP16/U/031', 'WAGABANA Adrian', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 12, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(426, 'SEP16/U/032', 'KASIRYE Raymond', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 12, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(427, 'SEP16/U/033', 'BARIGYE Nicholas', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 12, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(428, 'SEP16/U/034', 'AKELLO Dinah Babrah', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 12, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(429, 'SEP16/U/035', 'WAMBOKA Nasser Subira', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 12, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(430, 'SEP16/U/036', 'MBONIMPA Timothy', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 12, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(431, 'SEP16/U/037', 'MUSAAZI Joshua', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 12, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(432, 'SEP16/U/038', 'MBAMBU Honaritah', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 12, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(433, 'SEP16/U/039', 'WASSWA Isaac Nyanzi', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 12, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(434, 'SEP16/U/040', 'SALIM Moses', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 12, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(435, 'SEP16/U/041', 'ADOC Winnie', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 12, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(436, 'SEP16/U/042', 'WAMANGA Peter Eric', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 12, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(437, 'SEP16/U/043', 'ANGOLERE Emmanuel', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 12, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(438, 'SEP16/U/044', 'MUNYAMBABAZI Nicholas', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 12, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(439, 'SEP16/U/045', 'KIRABO Joan', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 12, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(440, 'SEP16/X/046', 'UMAR Jubril Sambo', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 12, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(441, 'SEP16/U/047', 'RUGEYYI George Igga', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 12, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(442, 'SEP16/U/048', 'AMULE Dario', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 12, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(443, 'SEP16/U/049', 'OPUDA John Emmanuel', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 12, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(444, 'SEP16/U/050', 'AYEBALE Romeo', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 12, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(445, 'SEP16/U/051', 'AMPAIRE Kato Joseph', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 12, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(446, 'SEP16/U/052', 'MUTUHAIRE Anebo', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 12, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(447, 'SEP16/U/053', 'KIBENGO Godfrey', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 12, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(448, 'SEP16/U/054', 'AKEU Loyce', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 12, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(449, 'SEP16/U/055', 'NIRINGIYE Aaron', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 12, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(450, 'SEP16/U/056', 'KAMYA Simon Peter', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 12, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(451, 'SEP16/U/057', 'BWOGI Ivan', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 12, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(452, 'SEP16/U/058', 'ASIIMWE Allan', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 12, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(453, 'SEP16/U/059', 'MUWANGA Godfrey', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 12, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(454, 'SEP16/U/060', 'OWORI Innocent', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 12, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(455, 'SEP16/U/061', 'MUSINGUZI Ivan', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 12, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(456, 'SEP16/U/238', 'NABAKIIBI Patricia', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 12, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(457, 'SEP16/U/239', 'MUGUMYA Joash', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 12, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(458, 'SEP16/U/150', 'TINKA Godfrey', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 12, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(459, 'SEP16/U/240', 'KISUULE Muhammad', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 12, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(460, 'SEP16/U/241', 'WABUSIMBA Uthman', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 12, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(461, 'SEP16/U/242', 'SENGOOBA Hassan', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 12, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(462, 'SEP16/U/243', 'EYOBU Frank', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 12, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(463, 'SEP16/U/244', 'KIBUYE', NULL, NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 12, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(464, 'JAN17/U/148', 'MUGWERI Azimanvesi Ben', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(465, 'JAN17/U/149', 'WAKUMA Isaac', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(466, 'JAN17/U/150', 'MUSINGUZI Brian', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(467, 'JAN17/U/151', 'BWETTE Rashid', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(468, 'JAN17/U/152', 'KATUNGI Patrick Miramago', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(469, 'JAN17/U/153', 'ROY Oyukutu', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(470, 'MAY17/U/108', 'JERRY Abraham Wegober', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(471, 'MAY17/U/109', 'WASSWA John Lubega', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(472, 'MAY17/U/110', 'ADRIKO Tonny', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(473, 'MAY17/U/111', 'OKWII Timothy', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(474, 'MAY17/U/113', 'JOY Vivian Anyule', NULL, NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(475, 'MAY17/U/114', 'TABULA Jessy', NULL, NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(476, 'MAY17/U/115', 'NSUBUGA William Ronald', NULL, NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(477, 'MAY17/U/116', 'ONDOWA Nicholas', NULL, NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(478, 'MAY17/U/117', 'MWESIGWA Solomon', NULL, NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(479, 'MAY17/X/118', 'ACHIRE Charles Lino Pio ', NULL, NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(480, 'MAY17/U/003', 'KATEREGA Grace', NULL, NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(481, 'MAY17/U/119', 'AINOMUGISHA Dorothy', NULL, NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(482, 'MAY17/U/120', 'WAKUMA Isaac', NULL, NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(483, 'MAY17/U/121', 'DHIZAALA Joel Edrine', NULL, NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(484, 'MAY17/U/122', 'MUZAYA Peter', NULL, NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(485, 'SEP17/U/011', 'KHAUKHA Sumayiya', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(486, 'SEP17/U/438', 'SSEDDUGGE Muwanga Paul', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(487, 'SEP17/U/439', 'MANGENI Misaki Barasa', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(488, 'SEP17/U/440', 'EKIRAPA Isaac', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(489, 'SEP17/U/441', 'GIFT Osborn', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(490, 'SEP17/U/442', 'NOWANGYE Jacob Beingana', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(491, 'SEP17/U/443', 'AKORA Derrick', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(492, 'SEP17/U/444', 'BAIGA Vicent Musiiba', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(493, 'SEP17/U/445', 'EMYELU Gilbert', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(494, 'SEP17/U/446', 'SENABULYA Ukaasha', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(495, 'SEP17/U/447', 'MUHUYIDIN Lawalira', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(496, 'SEP17/U/448', 'LWEMBAWO Ronald Kyamagelo', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(497, 'SEP17/U/449', 'OJARA Benson', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(498, 'SEP17/U/450', 'ALIA Fredrick', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(499, 'SEP17/U/451', 'MUKASA Martin', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(500, 'SEP17/X/452', 'TUYAMBAZE Etienne', 'M- Rwandese', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(501, 'SEP17/U/453', 'KIMBOWA David', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(502, 'SEP17/U/454', 'OBONG Daniel Ogweng', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(503, 'SEP17/U/455', 'NDYOMUGYENYI Nobel', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(504, 'SEP17/U/456', 'OLOK Geoffrey Ouma', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(505, 'SEP17/U/457', 'NIMUNGU Erick', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(506, 'SEP17/U/458', 'JERRY Abraham Wegober', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(507, 'SEP17/U/459', 'OGWAL Tonny', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(508, 'SEP17/U/460', 'NAMATOVU Latifah', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(509, 'SEP17/U/461', 'MBUSA Peter', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(510, 'SEP17/U/462', 'COOTE Sandra', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(511, 'SEP17/U/463', 'LOFTUS Martin Owor', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(512, 'SEP17/U/464', 'MUYODI Ivan', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(513, 'SEP17/U/465', 'OWORA John Enock', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(514, 'SEP17/U/466', 'APIO Sheilla Clara', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(515, 'SEP17/U/467', 'OTIMGIU Colline', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(516, 'SEP17/U/468', 'NAMAGANYI Aminah', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(517, 'SEP17/U/469', 'SSALI Edward Benjamin', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(518, 'SEP17/U/184', 'SSEKAJJA Mark Henry', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(519, 'SEP17/U/470', 'OLINGA Simon Peter', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(520, 'SEP17/U/471', 'WAIBALE Gideon', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(521, 'SEP17/U/472', 'ATIDRI Leonard', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(522, 'SEP17/U/473', 'KIVUMBI William', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(523, 'JAN18/U/001', 'OKELLO Alex Koko', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 10, '2017-09-23', 10, 16, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(525, 'JAN14U00554', 'IMANI Daniel Irinda', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 5, '2017-09-23', 10, 14, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(526, 'JAN14U00555', 'ODONGO Daniel', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 5, '2017-09-23', 10, 14, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(527, 'SEP14U00556', 'OKELLO Robert', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 5, '2017-09-23', 10, 9, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(528, 'SEP14U00557', 'BUSULWA William', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 5, '2017-09-23', 10, 9, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(529, 'SEP14U00558', 'EGESA Ali', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 5, '2017-09-23', 10, 9, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(530, 'JAN15U00559', 'ASIKI Isaac', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 5, '2017-09-23', 10, 1, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(531, 'SEP15U00560', 'NKONOKA Simon Muyira', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 5, '2017-09-23', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(532, 'SEP15U00072', 'MUDOMA  Farooq', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 5, '2017-09-23', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(533, 'JAN15U01062', 'OKWIR Baker', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 4, '2017-09-23', 10, 1, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(534, 'SEP15U01065', 'NANYONJO Diana', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 4, '2017-09-23', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(535, 'SEP15U01059', 'JAMAL Rashid', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 4, '2017-09-23', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(536, 'SEP15U01374', 'NSIIMBE Sydney', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 4, '2017-09-23', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(537, 'SEP15U01068', 'KAKWEYEK Toskin Gregory', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 4, '2017-09-23', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(538, 'JAN16/U/157', 'BARUNGI Stephen', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 4, '2017-09-23', 10, 11, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(539, 'SEP16/U/001', 'ONEN Edward', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 4, '2017-09-23', 10, 12, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(540, 'SEP16/U/002', 'AHEREEZA Ronald', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 4, '2017-09-23', 10, 12, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(541, 'SEP16/U/003', 'KABUGO Bonkie', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 4, '2017-09-23', 10, 12, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(542, 'SEP16/U/004', 'KIVUNA Kenneth', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 4, '2017-09-23', 10, 12, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(543, 'SEP16/U/005', 'MUKASA Joseph', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 4, '2017-09-23', 10, 12, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(544, 'SEP16/U/006', 'MUNYANA Andrew', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 4, '2017-09-23', 10, 12, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(545, 'SEP16/U/007', 'KAKWEYEK Toskin Gregory', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 4, '2017-09-23', 10, 12, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(546, 'SEP16/U/009', 'KIGGUNDU Clark Inoccent', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 4, '2017-09-23', 10, 12, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(547, 'SEP16/U/086', 'KIYAGA Isaac Mubiru', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 4, '2017-09-23', 10, 12, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(548, 'SEP16/U/010', 'KIHEMBO Angella', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 4, '2017-09-23', 10, 12, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(549, 'SEP16/U/249', 'KALYANGO Maseke Dan', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 4, '2017-09-23', 10, 12, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(550, 'SEP16/U/250', 'OKAO Moses Mathew', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 4, '2017-09-23', 10, 12, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(551, 'JAN17/U/064', 'AYESIGA Christopher', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 4, '2017-09-23', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(552, 'MAY17/U/139', 'MUKASA Joseph', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 4, '2017-09-23', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(553, 'MAY17/U/141', 'KATUNGI Winyi Preston', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 4, '2017-09-23', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(554, 'SEP17/U/128', 'ERIA Mark', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 4, '2017-09-23', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(555, 'SEP17/U/129', 'LUBERENGA Hosea', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 4, '2017-09-23', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(556, 'SEP17/U/130', 'AINEMBABAZI Eunice', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 4, '2017-09-23', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(557, 'SEP17/U/131', 'MAMGBWI Sam Dralobu', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 4, '2017-09-23', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL);
INSERT INTO `student` (`student_id`, `registration_number`, `name`, `gender`, `contact`, `email`, `photo`, `password`, `universities_university_id`, `courses_course_id`, `_when_added`, `_who_added`, `intake_intake_id`, `status`, `logged_in`, `t_created_on`, `t_updated_on`, `nationality`) VALUES
(558, 'SEP17/U/132', 'WABUNOHA Edwin', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 4, '2017-09-23', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(559, 'SEP17/U/133', 'NAMANYA Ronald', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 4, '2017-09-23', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(560, 'SEP17/U/134', 'NSUBUGA Denise', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 4, '2017-09-23', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(561, 'SEP17/U/135', 'NDAULA Vian', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 4, '2017-09-23', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(562, 'SEP17/U/136', 'MUKASA Joseph', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 4, '2017-09-23', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(563, 'SEP17/U/137', 'KAMUSIIME Natamba', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 4, '2017-09-23', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(564, 'SEP17/U/138', 'OPOLOT Samson Dickens', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 4, '2017-09-23', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(565, 'SEP17/U/139', 'MUTEBI Godfrey', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 4, '2017-09-23', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(566, 'SEP17/U/077', 'MUKISA Gershom', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 4, '2017-09-23', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(567, 'SEP17/U/140', 'NAMUSIITWA Stella', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 4, '2017-09-23', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(568, 'SEP17/U/141', 'ACIBU Paul', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 4, '2017-09-23', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(569, 'SEP17/U/142', 'APIRE John Bosco', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 4, '2017-09-23', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(570, 'SEP17/U/143', 'KIGGUNDU Raymond Maurice', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 4, '2017-09-23', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(571, 'SEP17/U/144', 'AKANKUNDA Ainemukama', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 4, '2017-09-23', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(572, 'SEP17/U/145', 'ATURINDA Paula', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 4, '2017-09-23', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(573, 'SEP17/U/146', 'TUMUSIIME Auther Mutungi', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 4, '2017-09-23', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(574, 'SEP17/U/147', 'KAYANJA Aidan', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 4, '2017-09-23', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(575, 'SEP17/U/148', NULL, NULL, NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 4, '2017-09-23', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(576, 'SEP14U01361', 'KATUMBA Ivan Koreta', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 3, '2017-09-23', 10, 9, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(577, 'SEP14U01362', 'KAYE John Bosco', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 3, '2017-09-23', 10, 9, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(578, 'SEP14U01363', 'ARINAITWE Victor', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 3, '2017-09-23', 10, 9, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(579, 'SEP14U01364', 'OYURU Harry Denis', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 3, '2017-09-23', 10, 9, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(580, 'SEP14U01365', 'WALUGEMBE David', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 3, '2017-09-23', 10, 9, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(581, 'SEP14U01366', 'NUWAGABA Collins', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 3, '2017-09-23', 10, 9, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(582, 'SEP14U02219', 'ODIO Haggai Brian Enon', 'M', NULL, NULL, NULL, '01a703d16229fe66b848616861703721f98c2212', 2, 3, '2017-09-23', 10, 9, 0, '2017-11-29 10:53:50', NULL, NULL, NULL),
(583, 'SEP14U01369', 'NYAKUNI Brian', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 3, '2017-09-23', 10, 9, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(584, 'SEP14U01367', 'NAMWANJE Hasifah', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 3, '2017-09-23', 10, 9, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(585, 'SEP14U01370', 'JURUGO Felix', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 3, '2017-09-23', 10, 9, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(586, 'MAY15U01372', 'NAYEBARE Boneventure', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 3, '2017-09-23', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(587, 'SEP15U01373', 'SSUUNA Fredrick Yusufu', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 3, '2017-09-23', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(588, 'SEP15U01377', 'KWISHIMA Michael Nambaje', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 3, '2017-09-23', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(589, 'SEP15U01378 ', 'ABESIGA Simon', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 3, '2017-09-23', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(590, 'JAN16/U/221', 'OULEMA James', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 3, '2017-09-23', 10, 11, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(591, 'SEP16/X/206', 'RWANGEYO Kelvin', NULL, NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 3, '2017-09-23', 10, 12, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(592, 'JAN17/U/085', 'AKENA Innocent', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 3, '2017-09-23', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(593, 'JAN17/X/086', 'MUSA Mujahid Adam', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 3, '2017-09-23', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(594, 'SEP17/T/242', 'MARDERECK Fernandos Frael', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 3, '2017-09-23', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(595, 'SEP17/U/243', 'ONYAYO Bazil', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 3, '2017-09-23', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(596, 'SEP17/U/244', 'OLARA Jonathan', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 3, '2017-09-23', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(597, 'SEP17/U/245', 'RWOTHOMIO Emmanuel', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 3, '2017-09-23', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(598, 'SEP17/U/246', 'MULUMBA Mathius Muyingo', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 3, '2017-09-23', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(599, 'SEP17/U/247', 'KIYIMBA Edwin', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 3, '2017-09-23', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(600, 'SEP17/U/248', 'OKELLO Joseph', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 3, '2017-09-23', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(601, 'SEP17/U/249', 'KAPERE Boniface', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 3, '2017-09-23', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(602, 'SEP14U01159', 'IYAMULEMYE Bruno Alvin', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 2, '2017-09-23', 10, 9, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(603, 'SEP14U01160', 'MUHIMBISE Allelua', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 2, '2017-09-23', 10, 9, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(604, 'SEP14U01161', 'MAKISA Mary', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 2, '2017-09-23', 10, 9, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(605, 'SEP14U01162', 'AREMBESEREZA Wanda', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 2, '2017-09-23', 10, 9, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(606, 'SEP14U01163', 'ATUSIMIIRWE Arnold Ceaser', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 2, '2017-09-23', 10, 9, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(607, 'SEP14U01165', 'OKIROR Christopher Amodoi', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 2, '2017-09-23', 10, 9, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(608, 'SEP14U01166', 'TUHAIRWE Peter Dwayne', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 2, '2017-09-23', 10, 9, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(609, 'SEP14U01167', 'SELWANGA Muhamuddu', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 2, '2017-09-23', 10, 9, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(610, 'SEP14U01168', 'KAKOOZA Edward', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 2, '2017-09-23', 10, 9, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(611, 'SEP14U01170', 'BEMARA Barbra', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 2, '2017-09-23', 10, 9, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(612, 'MAY15U01169', 'BIHEMBE Benard', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 2, '2017-09-23', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(613, 'SEP15U01176', 'BWIRE Eriya', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 2, '2017-09-23', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(614, 'SEP15U01177', 'TUMUSIIME Mark', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 2, '2017-09-23', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(615, 'SEP15U01178', 'ZZIWA Benard', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 2, '2017-09-23', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(616, 'SEP15U01175', 'SSERUNKUMA Bruno Nicholas', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 2, '2017-09-23', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(617, 'SEP15U01179', 'MUHAIRWE Monday', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 2, '2017-09-23', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(618, 'SEP15U01180', 'TUMUSHABE Catherine', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 2, '2017-09-23', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(619, 'SEP15X01181', 'YAKUBU Rufa''i', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 2, '2017-09-23', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(620, 'SEP15U01375', 'AYIKORU Alima', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 2, '2017-09-23', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(621, 'SEP15U01182', 'TURYASINGURA Lodgers', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 2, '2017-09-23', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(622, 'SEP15X01183', 'UMAR Haruna Hussain', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 2, '2017-09-23', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(623, 'JAN16/U/021', 'ONZIMA Moses', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 2, '2017-09-23', 10, 11, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(624, 'JAN16/U/022', 'SEBULIME Peregrine', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 2, '2017-09-23', 10, 11, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(625, 'MAY16/U/065', 'OKIRING Tom Alvieri', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 2, '2017-09-23', 10, 4, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(626, 'MAY16/U/070', 'KATABAAZI Emmanuel', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 2, '2017-09-23', 10, 4, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(627, 'SEP16/U/084', 'JAGWARA Eric Ofuono', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 2, '2017-09-23', 10, 12, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(628, 'SEP16/U/085', 'NALWEGEYA Madrine Belinda', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 2, '2017-09-23', 10, 12, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(629, 'SEP16/U/088', 'MERUVA Jerry', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 2, '2017-09-23', 10, 12, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(630, 'MAY17/U/181', 'AGABA Deus', 'M', NULL, NULL, '1509094623015.jpg', '9644683576979921edbd2848fa34fd536c5cfa94', 2, 2, '2017-09-23', 10, 5, 0, '2017-11-14 05:30:35', NULL, NULL, NULL),
(631, 'MAY17/U/182', 'BARIGYE Peter Muhumuza', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 2, '2017-09-23', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(632, 'MAY17/U/184', 'RUBANGA Kene Ivan', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 2, '2017-09-23', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(633, 'MAY17/U/140', 'MUSOBYA Shaban', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 2, '2017-09-23', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(634, 'MAY17/U/076', 'AKENA Innocent', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 2, '2017-09-23', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(635, 'MAY17/X/185', 'ALE Alex', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 2, '2017-09-23', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(636, 'SEP17/U/054', 'TANDEKWIRE Joshua', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 2, '2017-09-23', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(637, 'SEP17/U/055', 'WEJULI Pius', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 2, '2017-09-23', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(638, 'SEP17/U/056', 'NTALE Shadik', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 2, '2017-09-23', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(639, 'SEP17/U/057', 'AMANYA Deogratias', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 2, '2017-09-23', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(640, 'SEP17/U/058', 'WAYINDA Blaise', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 2, '2017-09-23', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(641, 'SEP17/U/059', 'MAGEZI Allan', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 2, '2017-09-23', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(642, 'SEP17/U/060', 'AMUKWATSE Jean', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 2, '2017-09-23', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(643, 'SEP17/U/061', 'NSHIME Steven', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 2, '2017-09-23', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(644, 'SEP17/U/062', 'RUBABURA Memory Luke', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 2, '2017-09-23', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(699, 'SEP14U01868', 'KALULE Yusuf', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 9, '2017-09-23', 10, 9, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(700, 'MAY13U00251', 'OWEMBABAZI  Sarah', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 12, '2017-09-23', 10, 6, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(701, 'MAY13U00252', 'BWIINO Paul', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 12, '2017-09-23', 10, 6, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(702, 'MAY13U00253', 'SABITI Wilber B A', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 12, '2017-09-23', 10, 6, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(703, 'MAY13U00254', 'OBONG Daniel Ogweng', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 12, '2017-09-23', 10, 6, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(704, 'SEP13U00255', 'ANYAMA Richard', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 12, '2017-09-23', 10, 7, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(705, 'SEP13U00256', 'TURYASINGURA Oliver', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 12, '2017-09-23', 10, 7, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(706, 'SEP13U00257', 'KIRYEWALA Martha Stacey', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 12, '2017-09-23', 10, 7, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(707, 'JAN14U00258', 'OKELLO Francis', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 12, '2017-09-23', 10, 14, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(708, 'MAY14U00260', 'BAGONZA Allandas', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 12, '2017-09-23', 10, 8, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(709, 'SEP13U00354', 'ORIOKOT Daniel', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 12, '2017-09-23', 10, 9, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(710, 'SEP14U00261', 'KUSIIMA Vicent', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 12, '2017-09-23', 10, 9, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(711, 'SEP14U00262', 'ALIBA Ivan Lwechungula', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 12, '2017-09-23', 10, 9, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(712, 'SEP14U00263', 'TUHIRIRWE Liberio', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 12, '2017-09-23', 10, 9, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(713, 'SEP17/U/107', 'ARINAITWE Patrick', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 12, '2017-09-23', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(714, 'SEP17/U/108', NULL, NULL, NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 12, '2017-09-23', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(715, 'SEP17/U/109', NULL, NULL, NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 12, '2017-09-23', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(716, 'SEP17/U/111', NULL, NULL, NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 12, '2017-09-23', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(717, 'SEP17/U/112', NULL, NULL, NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 12, '2017-09-23', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(718, 'SEP17/U/113', NULL, NULL, NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 12, '2017-09-23', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(719, 'SEP17/U/114', NULL, NULL, NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 12, '2017-09-23', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(720, 'SEP17/U/115', NULL, NULL, NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 12, '2017-09-23', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(721, 'SEP17/U/116', NULL, NULL, NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 12, '2017-09-23', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(722, 'MAY13U00453', 'SSEMUGENYI Benjamin', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 16, '2017-09-23', 10, 6, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(723, 'MAY13U00454', 'TUMUSIIME Emmanuel', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 16, '2017-09-23', 10, 6, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(724, 'MAY13U00455', 'OYEE Paul', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 16, '2017-09-23', 10, 6, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(725, 'MAY13U00456', 'KYOMUHENDO Maureen', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 16, '2017-09-23', 10, 6, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(726, 'MAY13U00457', 'KOBUSINGYE Patricia', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 16, '2017-09-23', 10, 6, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(727, 'MAY13U00458', 'TABU Alfred Agama', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 16, '2017-09-23', 10, 6, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(728, 'MAY13U00459', 'OBAI Isaac', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 16, '2017-09-23', 10, 6, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(729, 'MAY13U00460', 'KYASIIMIRE Catherine', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 16, '2017-09-23', 10, 6, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(730, 'MAY13U00461', 'TUMWIZERE Alex', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 16, '2017-09-23', 10, 6, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(731, 'MAY13U00462', 'APIO Catherine', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 16, '2017-09-23', 10, 6, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(732, 'SEP13U00463', 'KALULE Adam', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 16, '2017-09-23', 10, 7, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(733, 'SEP13U00464', 'ASIIMWE Evelyne Rabwoni', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 16, '2017-09-23', 10, 7, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(734, 'SEP13U00465', 'AGABA Abraham', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 16, '2017-09-23', 10, 7, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(735, 'SEP13U00466', 'NUWAMANYA Rodney', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 16, '2017-09-23', 10, 7, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(736, 'SEP13U00467', 'MIRACLE Eron', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 16, '2017-09-23', 10, 7, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(737, 'SEP13U00468', 'MATOVU Isaac', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 16, '2017-09-23', 10, 7, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(738, 'SEP13U00469', 'SSEMUGENYI Benjamin', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 16, '2017-09-23', 10, 7, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(739, 'SEP13U00470', 'TWEBAZE Joy', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 16, '2017-09-23', 10, 7, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(740, 'SEP13U00471', 'KATONO Abdul Ayub', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 16, '2017-09-23', 10, 7, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(741, 'SEP13U00472', 'TURINAWE Aloysius', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 16, '2017-09-23', 10, 7, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(742, 'SEP13U00473', 'OYELLA Catherine', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 16, '2017-09-23', 10, 7, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(743, 'SEP13U00474', 'ALIGANYIRA MOURICE', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 16, '2017-09-23', 10, 7, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(744, 'SEP13U00475', 'ARIHO Simplisio', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 16, '2017-09-23', 10, 7, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(745, 'SEP13U00476', 'KAKANDE Sadat', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 16, '2017-09-23', 10, 7, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(746, 'SEP13U00478', 'NABAYINDA Faith', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 16, '2017-09-23', 10, 7, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(747, 'SEP13U00479', 'SEZOOBA Abdallah', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 16, '2017-09-23', 10, 7, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(748, 'SEP13U00480', 'OWEMBABAZI Sarah', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 16, '2017-09-23', 10, 7, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(749, 'SEP13U00481', 'KIBUUKA Annet', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 16, '2017-09-23', 10, 7, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(750, 'SEP13U00482', 'TENDO Linda', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 16, '2017-09-23', 10, 7, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(751, 'SEP13U00483', 'BANURA Joan', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 16, '2017-09-23', 10, 7, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(752, 'SEP13U00484', 'TUSHABE Shallon', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 16, '2017-09-23', 10, 7, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(753, 'SEP13U00485', 'NGONZI Aida', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 16, '2017-09-23', 10, 7, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(754, 'SEP13U00487', 'ATENGO Vivian', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 16, '2017-09-23', 10, 7, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(755, 'SEP13U00186', 'ONENCAN Ronald', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 16, '2017-09-23', 10, 7, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(756, 'SEP13U00489', 'BYAMUKAMA Dismas', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 16, '2017-09-23', 10, 7, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(757, 'SEP13U00490', 'ALITUHA Bagonza Owen', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 16, '2017-09-23', 10, 7, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(758, 'SEP13X00491', 'AYUME  Justin William', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 16, '2017-09-23', 10, 7, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(759, 'SEP13U00154', 'LUYOMBYA Joseph', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 16, '2017-09-23', 10, 7, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(760, 'SEP13U00151', 'NATUHWERA Benezeli', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 16, '2017-09-23', 10, 7, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(761, 'SEP13U00492', 'NTULUME David', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 16, '2017-09-23', 10, 7, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(762, 'JAN14U00655', 'NDAWULA Benon', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 16, '2017-09-23', 10, 14, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(763, 'JAN14U00493', 'SEWE Ivan', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 16, '2017-09-23', 10, 14, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(764, 'JAN14U00494', 'RUTATIESA David', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 16, '2017-09-23', 10, 14, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(765, 'JAN14X00495', 'LOKIDEN Moses James', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 16, '2017-09-23', 10, 14, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(766, 'JAN14U00259', 'AJELO Lindah', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 16, '2017-09-23', 10, 14, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(767, 'JAN14U00227', 'SAJJABI Paul', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 16, '2017-09-23', 10, 14, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(768, 'MAY14X00496', 'JURU Jackline', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 16, '2017-09-23', 10, 8, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(769, 'MAY14U00497', 'BWIRE Jonan', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 16, '2017-09-23', 10, 8, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(770, 'MAY14U00498', 'AJOK Alice Okidi', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 16, '2017-09-23', 10, 8, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(771, 'MAY14U00499', 'AGABA Armstrong', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 16, '2017-09-23', 10, 8, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(772, 'SEP14U00500', 'BINAISA Lukonggwa', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 16, '2017-09-23', 10, 9, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(773, 'SEP14U00501', 'ADENGERO Winnie', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 16, '2017-09-23', 10, 9, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(774, 'SEP14U00502', 'IRUMBA Julius', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 16, '2017-09-23', 10, 9, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(775, 'SEP14U00503', 'ABORE Esther', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 16, '2017-09-23', 10, 9, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(776, 'SEP14U00504', 'TASHOBYA Simon', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 16, '2017-09-23', 10, 9, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(777, 'SEP14U00505', 'ABIYA Sarah Sandra', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 16, '2017-09-23', 10, 9, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(778, 'SEP14U00506', 'TUHAISE Jane', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 16, '2017-09-23', 10, 9, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(779, 'SEP14U00507', 'TUMWEBAZE Alex', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 16, '2017-09-23', 10, 9, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(780, 'SEP14U02119', 'KANYIKE Ivan Emmanuel', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 16, '2017-09-23', 10, 9, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(781, 'SEP14U00508', 'WASAKE Richard', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 16, '2017-09-23', 10, 9, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(782, 'SEP14U00509', 'MUGIDDE Victor', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 16, '2017-09-23', 10, 9, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(783, 'SEP14U00510', 'TUSINGWIRE Pius', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 16, '2017-09-23', 10, 9, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(784, 'SEP14U00810', 'KYOMUGISHA Sandra', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 16, '2017-09-23', 10, 9, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(785, 'MAY14U00809', 'AJUNA Joan Christine', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 16, '2017-09-23', 10, 9, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(786, 'SEP14U00511', 'ATWINE Penlope', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 16, '2017-09-23', 10, 9, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(787, 'JAN15U00512', 'MUSUBO Godfrey', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 16, '2017-09-23', 10, 1, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(788, 'JAN15U00513', 'ODONGKARA Johnson', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 16, '2017-09-23', 10, 1, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(789, 'MAY15X00514', 'MUGAMBAGE Emmanuel', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 16, '2017-09-23', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(790, 'MAY15X00515', 'TARTISIO Paul', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 16, '2017-09-23', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(791, 'MAY15U00516', 'WAKALIMIRA Eric', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 16, '2017-09-23', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(792, 'MAY15X00517', 'MAKUKU D J Sam', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 16, '2017-09-23', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(793, 'MAY15U00518', 'BIMANYIRWOMWE Pius', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 16, '2017-09-23', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(794, 'MAY15U00519', 'KATUSHABE Regina', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 16, '2017-09-23', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(795, 'MAY15U00520', 'BASIIME Bridget', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 16, '2017-09-23', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(796, 'JAN15X01767', 'MAWA Tito Yakiji', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 16, '2017-09-23', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(797, '***MAY15U00521', 'TUMUSIIME Racheal', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 16, '2017-09-23', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(798, 'SEP15U00522', 'AKISA Maureen Maznic Utho', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 16, '2017-09-23', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(799, 'SEP15U00523', 'ASIIMIRE Sheila', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 16, '2017-09-23', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(800, 'SEP15U00524', 'SAANDO Gwendolyne', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 16, '2017-09-23', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(801, 'SEP15U00525', 'DRIJARU Hellen', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 16, '2017-09-23', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(802, 'SEP15U00526', 'KEMIREMBE Judith', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 16, '2017-09-23', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(803, 'SEP15U00527', 'ANENA Phiona', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 16, '2017-09-23', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(804, 'SEP15U00528', 'OPOLOT Ephram Okurut', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 16, '2017-09-23', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(805, 'SEP15U00529', 'KATO Stanlel', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 16, '2017-09-23', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(806, 'SEP15U00530', 'OBAI Isaac', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 16, '2017-09-23', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(807, 'SEP15U00531', 'NAKAJJA Doreen Racheal', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 16, '2017-09-23', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(808, 'SEP15U00813', 'KIDEN Licho Agnes Modi', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 16, '2017-09-23', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(809, 'SEP15U00533', 'NALUBANDI Jannet', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 16, '2017-09-23', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(810, 'SEP15U00535', 'NAIGAGA Florence', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 16, '2017-09-23', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(811, 'SEP15T01770', 'GLORY S Mushi', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 16, '2017-09-23', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(812, 'SEP15U00536', 'AHABWE Racheal Mubeezi', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 16, '2017-09-23', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(813, 'SEP15U00537', 'KABASIITA Maureen', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 16, '2017-09-23', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(814, 'SEP15U00538', 'BABIRYE Monic', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 16, '2017-09-23', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(815, 'SEP15U02320', 'AKUGIZIBWE Daniel', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 16, '2017-09-23', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(816, 'SEP15X00539 (NCHE)', 'AMINU Jamilu', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 16, '2017-09-23', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(817, 'JAN16/U/042', 'OJOK Innocent', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 16, '2017-09-23', 10, 11, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(818, 'MAY16/U/042', 'ASINGWIRE Adrin', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 16, '2017-09-23', 10, 4, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(819, 'MAY16/U/043', 'APIO Sylvia Grace', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 16, '2017-09-23', 10, 4, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(820, 'MAY16/U/054', 'EIMANI Prisca', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 16, '2017-09-23', 10, 4, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(821, 'MAY16/U/119', 'OPEJO Silas', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 16, '2017-09-23', 10, 4, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(822, 'MAY16/U/055', 'NAKYEGERA Norah Ruth', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 16, '2017-09-23', 10, 4, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(823, 'MAY16/U/044', 'AKAMPURIRA Abraham', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 16, '2017-09-23', 10, 4, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(824, 'MAY16/U/045', 'NAMWANJE Lydia', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 16, '2017-09-23', 10, 4, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(825, 'SEP16/U/164', 'NAMUDDU Racheal', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 16, '2017-09-23', 10, 12, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(826, 'SEP16/U/165', 'ODOKONYERO Godfrey', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 16, '2017-09-23', 10, 12, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(827, 'SEP16/U/166', 'LUKOWE Keludia', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 16, '2017-09-23', 10, 12, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(828, 'SEP16/U/167', 'ASIIMWE Imelda', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 16, '2017-09-23', 10, 12, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(829, 'SEP16/U/168', 'AKANKWASA Emmanuel', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 16, '2017-09-23', 10, 12, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(830, 'SEP16/U/169', 'LABEJA Nancy Angwech', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 16, '2017-09-23', 10, 12, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(831, 'SEP16/U/170', 'TURIYO Tito', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 16, '2017-09-23', 10, 12, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(832, 'SEP16/U/148', 'EGARU Thomas', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 16, '2017-09-23', 10, 12, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(833, 'SEP16/U/098', 'AGUT Charity', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 16, '2017-09-23', 10, 12, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(834, 'SEP16/U/171', 'SADDAM Shaban Yusuf', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 16, '2017-09-23', 10, 12, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(835, 'SEP16/U/172', 'MUTESASIRA Florence', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 16, '2017-09-23', 10, 12, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(836, 'JAN17/U/001', 'LOMOE Philliph', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 16, '2017-09-23', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(837, 'JAN17/U/002', 'SEGGAYI Enock', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 16, '2017-09-23', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(838, 'JAN17/U/003', 'NABAGGALA Yudayah', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 16, '2017-09-23', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(839, 'JAN17/U/004', 'NAMUGERWA Christine Mary', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 16, '2017-09-23', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(840, 'MAY17/U/087', 'KOZALA Saleh', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 16, '2017-09-23', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(841, 'MAY17/U/088', 'NAMUDDU Ruth Nabawanga', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 16, '2017-09-23', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(842, 'MAY17/U/089', 'BAKUBI Nakavubu Margaret', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 16, '2017-09-23', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(843, 'MAY17/U/090', 'KAKINDA Ian', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 16, '2017-09-23', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(844, 'MAY17/U/091', 'KAKUBA Trevor', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 16, '2017-09-23', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(845, 'MAY17/X/203', 'JERSA Kide Barsaba ', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 16, '2017-09-23', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(846, 'MAY17/U/092', 'MULERE Sam', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 16, '2017-09-23', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(847, 'MAY17/U/093', 'ELAU Andrew Moses', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 16, '2017-09-23', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(848, 'SEP17/X/149', 'OLOYA Louis Nelson', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 16, '2017-09-23', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(849, 'SEP17/U/150', 'ANEK Kevin', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 16, '2017-09-23', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(850, 'SEP17/U/151', 'ESAYETE Jackline', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 16, '2017-09-23', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(851, 'SEP17/U/152', 'NYOMBI Miriam', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 16, '2017-09-23', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(852, 'SEP17/U/153', 'KYASIIMIRE Pamella', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 16, '2017-09-23', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(853, 'SEP17/U/154', 'OKANGA Bonniface', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 16, '2017-09-23', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(854, 'SEP17/X/155', 'OYET Charles Lino', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 16, '2017-09-23', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(855, 'SEP17/U/157', 'CANDIRU Allen', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 16, '2017-09-23', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(856, 'SEP17/U/158', 'KIRUNGI Elizabeth', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 16, '2017-09-23', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(857, 'SEP17/U/159', 'DADA Ross Romano', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 16, '2017-09-23', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(858, 'SEP17/U/160', 'BIRUNGI Faith', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 16, '2017-09-23', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(859, 'SEP17/U/161', 'LOMOE Philliph', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 16, '2017-09-23', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(860, 'SEP17/U/162', 'TUMUSIIME Savero', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 16, '2017-09-23', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(861, 'SEP17/U/163', 'KHATOOKO Barbrah', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 16, '2017-09-23', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(862, 'SEP17/U/221', 'MULANGIRA Sharon', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 16, '2017-09-23', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(863, 'SEP17/U/164', 'AKANKUNDA Juliet', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 16, '2017-09-23', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(864, 'SEP17/U/030', 'SEBIDDE Abdallahakim', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 16, '2017-09-23', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(865, 'SEP17/U/165', 'ASIIMWE Laban', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 16, '2017-09-23', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(866, 'JAN14U00224', 'NAIGAGA Jackline', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 17, '2017-09-23', 10, 14, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(867, 'SEP14U00656', 'KYOMUGISHA Lilian', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 17, '2017-09-23', 10, 9, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(868, 'SEP14U00657', 'ALITUHA God', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 17, '2017-09-23', 10, 9, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(869, 'SEP14U053', 'ANGURA Fredrick', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 17, '2017-09-23', 10, 9, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(870, 'SEP14U02118', 'SESAKA Rogers', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 17, '2017-09-23', 10, 9, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(871, 'SEP14U01261', 'NYABURU Prossy', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 17, '2017-09-23', 10, 9, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(872, 'SEP14U00658', 'NAKATO Sharon', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 17, '2017-09-23', 10, 9, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(873, 'SEP14U00659', 'KATO Fahad', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 17, '2017-09-23', 10, 9, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(874, 'MAY15U00662  ', 'ONDURI Daniel', NULL, NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 17, '2017-09-23', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(875, 'MAY15U00663  ', 'MUGENYI Jimmy', NULL, NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 17, '2017-09-23', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(876, 'MAY15U00664 ', 'OKIROR Pius Patricious', NULL, NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 17, '2017-09-23', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(877, 'MAY15U00665 ', 'DRAMUSU Justine Vuni', NULL, NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 17, '2017-09-23', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(878, 'MAY15U00666 ', 'BOSSA Robert', NULL, NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 17, '2017-09-23', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(879, 'MAY15U00668 ', 'TUMWEBAZE Johnson', NULL, NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 17, '2017-09-23', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(880, 'MAY15U00670 ', 'OGWOK Emmanuel Newton', NULL, NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 17, '2017-09-23', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(881, 'SEP15U00667 ', 'WANGILA Benard', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 17, '2017-09-23', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(882, 'SEP15U00669 ', 'MBABAZI Collins Sankara', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 17, '2017-09-23', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(883, 'SEP15U00671 ', 'ETIA James', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 17, '2017-09-23', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(884, 'SEP15U00672 ', 'MWEZIRIKYE Ian', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 17, '2017-09-23', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(885, 'SEP15U00673 ', 'AMAJO Susan', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 17, '2017-09-23', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(886, 'SEP15U00674', 'KATABALWA Micheal', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 17, '2017-09-23', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(887, 'SEP15U00675', 'MUNYENA Catherine', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 17, '2017-09-23', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(888, 'SEP15U00676', 'OPANY Salome N', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 17, '2017-09-23', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(889, 'SEP15U00678', 'RUKUMBYA Jones A', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 17, '2017-09-23', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL);
INSERT INTO `student` (`student_id`, `registration_number`, `name`, `gender`, `contact`, `email`, `photo`, `password`, `universities_university_id`, `courses_course_id`, `_when_added`, `_who_added`, `intake_intake_id`, `status`, `logged_in`, `t_created_on`, `t_updated_on`, `nationality`) VALUES
(890, 'SEP15U00679', 'AMPAIRE EDINANCE', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 17, '2017-09-23', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(891, 'JAN16/U/001', 'NYAKETCHO Peace Tabisa', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 17, '2017-09-23', 10, 11, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(892, 'JAN16/U/002', 'TUSABE Allan', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 17, '2017-09-23', 10, 11, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(893, 'JAN16/X/003', 'BOJO Alex Evans', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 17, '2017-09-23', 10, 11, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(894, 'JAN16/U/004', 'BAGYENDA Mark', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 17, '2017-09-23', 10, 11, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(895, 'JAN16/U/005', 'TABU James Kaunda', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 17, '2017-09-23', 10, 11, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(896, 'JAN16/U/006', 'TUMWEBAZE Johnson', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 17, '2017-09-23', 10, 11, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(897, 'MAY16/U/141', 'KABAALE N Teddy', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 17, '2017-09-23', 10, 4, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(898, 'SEP16/U/011', 'KONYIO Patricia', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 17, '2017-09-23', 10, 12, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(899, 'SEP16/U/013', 'NAMUYIRA Veronica', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 17, '2017-09-23', 10, 12, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(900, 'SEP16/U/014', 'NYEKO Godfrey', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 17, '2017-09-23', 10, 12, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(901, 'JAN17/U/022', 'MUGENYI Jimmy', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 17, '2017-09-23', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(902, 'JAN17/U/023', 'VERONICA Chiwera', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 17, '2017-09-23', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(903, 'MAY17/U/021', 'TUMWEBAZE Johnson', NULL, NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 17, '2017-09-23', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(904, 'MAY17/U/022', 'MASIKA Anna', NULL, NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 17, '2017-09-23', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(905, 'MAY17/X/023', 'LEMI Agrey Oliver', NULL, NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 17, '2017-09-23', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(906, 'MAY17/U/024', 'NDIGANA Rose', NULL, NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 17, '2017-09-23', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(907, 'MAY17/U/025', 'FANANTYA Simon', NULL, NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 17, '2017-09-23', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(908, 'SEP17/U/284', 'ASIIMWE Elias', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 17, '2017-09-23', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(909, 'SEP17/U/285', 'KAWEESA Anthony', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 17, '2017-09-23', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(910, 'SEP17/U/286', 'MWEBE M K Kizito Mugabi', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 17, '2017-09-23', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(911, 'SEP17/U/287', 'MULYA Priscilla Eunice', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 17, '2017-09-23', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(912, 'SEP17/U/044', 'MUTEBI Robert', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 17, '2017-09-23', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(913, 'SEP17/U/288', 'NAKANWAGI Edrine', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 17, '2017-09-23', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(914, 'JAN14U00806', 'NAIKA Waiswa Richard Edward', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 20, '2017-09-23', 10, 14, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(915, 'JAN14U00807', 'LEKEA Stella', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 20, '2017-09-23', 10, 14, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(916, 'JAN14U00808', 'OCENG Peter', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 20, '2017-09-23', 10, 14, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(917, 'JAN15U00812', 'AKELLO Sarah Okello', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 20, '2017-09-24', 10, 1, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(918, 'SEP15U00814', 'ETUK Michael', NULL, NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 20, '2017-09-24', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(919, 'SEP15X00815', 'CHUOL Gony Gatluak', NULL, NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 20, '2017-09-24', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(920, 'JAN16/U/232', 'KANYESIGYE Joseph', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 20, '2017-09-24', 10, 11, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(921, 'MAY16/U/173', 'BALICWAMU John', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 20, '2017-09-24', 10, 4, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(922, 'MAY16/U/174', 'KALEB Alfred', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 20, '2017-09-24', 10, 4, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(923, 'MAY16/U/175', 'OGWANG Moses', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 20, '2017-09-24', 10, 4, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(924, 'MAY16/U/176', 'OTAI George', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 20, '2017-09-24', 10, 4, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(925, 'MAY16/U/177', 'ISABIRYE Mohammed', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 20, '2017-09-24', 10, 4, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(926, 'MAY16/U/178', 'ISABIRYE Yonna', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 20, '2017-09-24', 10, 4, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(927, 'MAY16/U/179', 'KABAMBWE Charles', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 20, '2017-09-24', 10, 4, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(928, 'MAY16/U/180', 'IGADUBE Ronald', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 20, '2017-09-24', 10, 4, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(929, 'MAY16/U/181', 'KATWESIGE Janet Wamara', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 20, '2017-09-24', 10, 4, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(930, 'MAY16/U/182', 'WAISWA Charles', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 20, '2017-09-24', 10, 4, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(931, 'MAY16/U/183', 'AHEBWA Apollo Alfred', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 20, '2017-09-24', 10, 4, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(932, 'SEP17/U/043', 'ASIIMWE Johnmary', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 20, '2017-09-24', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(933, 'SEP17/U/046', 'OOLA Patrick', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 20, '2017-09-24', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(934, 'MAY14U01260', 'ATUKWASE Gloria', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 23, '2017-09-24', 10, 8, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(935, 'MAY15U01265', 'KYANSHEMEZA Phionah', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 23, '2017-09-24', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(936, 'SEP15U01266', 'KIRABO Naome Dinnah', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 23, '2017-09-24', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(937, 'SEP15U01267', 'KAVUMA Shamim', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 23, '2017-09-24', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(938, 'SEP17/U/222', 'NAMPIJJA Ritah', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 23, '2017-09-24', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(939, 'SEP17/U/223', 'NAMURINDA Shivan', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 23, '2017-09-24', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(940, 'SEP14U01462', 'SSEMANYI Arnold', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 22, '2017-09-24', 10, 9, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(941, 'SEP14U01463', 'KAKA Ronald Roy', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 22, '2017-09-24', 10, 9, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(942, 'SEP14U01464', 'GONZA Dan Ronic', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 22, '2017-09-24', 10, 9, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(943, 'SEP14U01465', 'GULOBA Francis', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 22, '2017-09-24', 10, 9, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(944, 'SEP14U01466', 'NABIRYO Eva Alice Bazira', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 22, '2017-09-24', 10, 9, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(945, 'SEP14U01467', 'ODORIE Albert', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 22, '2017-09-24', 10, 9, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(946, 'SEP14U01468', 'OWOMUGISHA Arban', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 22, '2017-09-24', 10, 9, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(947, 'SEP14U01469', 'KANSIIME Rebecca', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 22, '2017-09-24', 10, 9, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(948, 'SEP14U01470', 'BABYESIZA Raymond', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 22, '2017-09-24', 10, 9, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(949, 'SEP14U01471', 'NAYEBARE Deborah', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 22, '2017-09-24', 10, 9, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(950, 'SEP14U01262', 'NYESIGA Joan Jakajex', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 22, '2017-09-24', 10, 9, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(951, 'SEP14U00811', 'NSISINKANO Martin Luther', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 22, '2017-09-24', 10, 9, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(952, 'SEP14U01472', 'TUSIIME Johnson R', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 22, '2017-09-24', 10, 9, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(953, 'SEP14U01473', 'AJALO Evaline', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 22, '2017-09-24', 10, 9, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(954, 'SEP14U01474', 'NAKULIMA Martha', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 22, '2017-09-24', 10, 9, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(955, 'SEP14U01475', 'NUWAMANYA Mark', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 22, '2017-09-24', 10, 9, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(956, 'SEP14U00053', 'GASAATURA Paul Tumukunde', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 22, '2017-09-24', 10, 9, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(957, 'SEP14X01476', 'JOU Isaac Thon', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 22, '2017-09-24', 10, 9, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(958, 'JAN15U00660', 'NUWANDINDA Comrade', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 22, '2017-09-24', 10, 1, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(959, 'JAN15U01477', 'ANYWAR Alfred', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 22, '2017-09-24', 10, 1, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(960, 'JAN15U01478', 'NABIRYO Eva Alice Bazira', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 22, '2017-09-24', 10, 1, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(961, 'JAN15U01263', 'OKOBOI Joseph Opolot', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 22, '2017-09-24', 10, 1, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(962, 'JAN15U01479', 'MPUUGA Joseph', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 22, '2017-09-24', 10, 1, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(963, 'JAN15U01480', 'KABUGO Hudson', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 22, '2017-09-24', 10, 1, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(964, 'MAY15U01481', 'NYAFWONO Florence', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 22, '2017-09-24', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(965, 'SEP15U01483', 'MUHINDO Wilfred', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 22, '2017-09-24', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(966, 'SEP15U01484', 'TUMWINE Naboth', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 22, '2017-09-24', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(967, 'SEP15U01486', 'MASEREKA Gosbert', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 22, '2017-09-24', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(968, 'SEP15U01487', 'MUBIRU Denis', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 22, '2017-09-24', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(969, 'SEP15U01482', 'BRIGHT Keneth', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 22, '2017-09-24', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(970, 'SEP15U01488', 'RUKUBITANA Elvis', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 22, '2017-09-24', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(971, 'SEP15U01489', 'TWESIIME Annah', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 22, '2017-09-24', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(972, 'SEP15U01490', 'WAKABALA Robert', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 22, '2017-09-24', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(973, 'SEP15U00074', 'ANTINOV Johnson', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 22, '2017-09-24', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(974, 'SEP15X01491', 'ABUBAKAR Aminu', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 22, '2017-09-24', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(975, 'SEP15T02036', 'VICENT J Mwacha', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 22, '2017-09-24', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(976, 'SEP15U01492', 'TINO Martha', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 22, '2017-09-24', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(977, 'SEP15U01493', 'MUGARURA Arthur Sam', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 22, '2017-09-24', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(978, 'JAN16/U/063', 'MUGISA David', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 22, '2017-09-24', 10, 11, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(979, 'JAN16/U/064', 'KOMUKAMA Dianah', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 22, '2017-09-24', 10, 11, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(980, 'SEP16/U/095', 'ATINE Dinnah', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 22, '2017-09-24', 10, 12, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(981, 'SEP16/U/096', 'BYAMUGISHA Mark Kaharuza', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 22, '2017-09-24', 10, 12, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(982, 'SEP16/U/097', 'TALEMWA Daniel Muwanguzi', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 22, '2017-09-24', 10, 12, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(983, 'JAN17/X/101', 'MUSA Umar Adam', NULL, NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 22, '2017-09-24', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(984, 'JAN17/T/102', 'EDGA A Naamani', NULL, NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 22, '2017-09-24', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(985, 'JAN17/U/103', 'WAKABALA Robert', NULL, NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 22, '2017-09-24', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(986, 'MAY17/U/054', 'ATINE Dinnah', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 22, '2017-09-24', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(987, 'MAY17/U/055', 'ATODU Daniel', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 22, '2017-09-24', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(988, 'MAY17/U/056', 'KARUNGI Marie Jeanne', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 22, '2017-09-24', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(989, 'MAY17/T/057', 'HAROUN O Yusuf', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 22, '2017-09-24', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(990, 'MAY17/U/058', 'TINO Martha', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 22, '2017-09-24', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(991, 'MAY17/U/059', 'WAKABALA Robert', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 22, '2017-09-24', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(992, 'MAY17/U/034', 'BASIGARA Chris', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 22, '2017-09-24', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(993, 'MAY17/U/060', 'KANYESIGYE Joseph', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 22, '2017-09-24', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(994, 'SEP17/U/001', 'KAWAGGA Jamilu', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 22, '2017-09-24', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(995, 'SEP17/U/002', 'KAAHWA Denis', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 22, '2017-09-24', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(996, 'SEP17/U/003', 'KAMUGISHA Polycarp', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 22, '2017-09-24', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(997, 'SEP17/U/267', 'SEBIDDE Jamiru', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 22, '2017-09-24', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(998, 'SEP17/U/004', 'WAISWA Wilson', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 22, '2017-09-24', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(999, 'SEP17/U/005', 'RUGUMYA Raymond Asiimwe', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 22, '2017-09-24', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1000, 'SEP17/U/045', 'KAMASAKA Jack', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 22, '2017-09-24', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1001, 'SEP17/U/006', 'OTURO Jesse Eridad', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 22, '2017-09-24', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1002, 'SEP17/U/007', 'NDYANABO Seth', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 22, '2017-09-24', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1003, 'SEP17/U/008', NULL, NULL, NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 22, '2017-09-24', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1004, 'SEP17/U/009', NULL, NULL, NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 22, '2017-09-24', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1005, 'SEP17/U/010', NULL, NULL, NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 22, '2017-09-24', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1006, 'SEP14U01563', 'MWESIGE Carol', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 21, '2017-09-24', 10, 9, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1007, 'SEP14U01564', 'AMONO Juliet', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 21, '2017-09-24', 10, 9, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1008, 'SEP14U01565', 'AIJUKA Andrew', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 21, '2017-09-24', 10, 9, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1009, 'SEP14U00245', 'SSEMAMBO Joseph', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 21, '2017-09-24', 10, 9, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1010, 'SEP14U01566', 'KULUMBA Steven', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 21, '2017-09-24', 10, 9, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1011, 'SEP14U01567', 'KATUSHABE Julia', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 21, '2017-09-24', 10, 9, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1012, 'SEP14U01568', 'OWAMANI Moses', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 21, '2017-09-24', 10, 9, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1013, 'SEP15U01570', 'AMUGE Catherine', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 21, '2017-09-24', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1014, 'SEP15U01571', 'ANENO Vivian Mercy', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 21, '2017-09-24', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1015, 'SEP15U01573', 'ALULE Robert Sanday', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 21, '2017-09-24', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1016, 'SEP16/U/073', 'ODOI Joseph', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 21, '2017-09-24', 10, 12, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1017, 'SEP16/U/074', 'AINOMUGISHA Racheal', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 21, '2017-09-24', 10, 12, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1018, 'SEP16/U/075', 'NAMBI Heron', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 21, '2017-09-24', 10, 12, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1019, 'SEP16/U/076', 'AGABA Anthony', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 21, '2017-09-24', 10, 12, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1020, 'SEP16/U/077', 'MUKIIBI Alex', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 21, '2017-09-24', 10, 12, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1021, 'SEP16/U/078', 'KYAZIKE Faith', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 21, '2017-09-24', 10, 12, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1022, 'SEP16/U/079', 'OTILE Fred', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 21, '2017-09-24', 10, 12, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1023, 'SEP16/U/080', 'GANDHI Doreen', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 21, '2017-09-24', 10, 12, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1024, 'JAN17/U/126', 'GANDHI Doreen', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 21, '2017-09-24', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1025, 'MAY17/U/065', 'RUTUNGU Roben', NULL, NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 21, '2017-09-24', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1026, 'MAY17/U/066', 'GANDHI Doreen', NULL, NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 21, '2017-09-24', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1027, 'MAY17/X/068', 'AL- HASSAN Abdul- Rashid G', NULL, NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 21, '2017-09-24', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1028, 'MAY17/X/069', 'ACHIRE Paul A.D.', NULL, NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 21, '2017-09-24', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1029, 'MAY17/U/070', 'NANYOMBI Sarah', NULL, NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 21, '2017-09-24', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1030, 'SEP17/U/366', 'NAMBALIRWA Mayi', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 21, '2017-09-24', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1031, 'SEP17/U/367', 'NAGGAYI Cynthia Ruth', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 21, '2017-09-24', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1032, 'SEP17/U/368', 'AKAO Patricia', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 21, '2017-09-24', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1033, 'SEP17/U/369', 'KIDEGA Lonely', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 21, '2017-09-24', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1034, 'SEP17/U/370', 'MULINDWA Henry', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 21, '2017-09-24', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1035, 'SEP17/U/371', 'AGWANG Naume Orone', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 21, '2017-09-24', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1036, 'SEP17/U/372', 'ALULE Robert Sanday', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 21, '2017-09-24', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1037, 'SEP17/U/373', 'ATIM Mercy', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 21, '2017-09-24', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1038, 'SEP17/U/374', 'GANDHI Doreen', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 21, '2017-09-24', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1039, 'SEP14U00957', 'SIMWERO Tonny', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 18, '2017-09-24', 10, 9, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1040, 'SEP14U00958', 'MATSIKO Esau', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 18, '2017-09-24', 10, 9, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1041, 'SEP14U00959', 'BIRUNGI B Thaddeus', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 18, '2017-09-24', 10, 9, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1042, 'SEP14U00960', 'NAMIREMBE Pouline', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 18, '2017-09-24', 10, 9, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1043, 'SEP14U00961', 'WALIGGO Denis', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 18, '2017-09-24', 10, 9, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1044, 'SEP15U00963', 'NANKABIRWA Diana', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 18, '2017-09-24', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1045, 'SEP15U00964', 'KOBUSINGE Harriet', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 18, '2017-09-24', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1046, 'SEP15U00965', 'AGABA J. Serugo', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 18, '2017-09-24', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1047, 'SEP15U00966', 'TUSIIME Patcy', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 18, '2017-09-24', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1048, 'SEP15U00962', 'KAGAJU Angela', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 18, '2017-09-24', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1049, 'SEP15U00264', 'KAKWEKWE Lillian', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 18, '2017-09-24', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1050, 'SEP15U00967', 'BIRUNGI B Thaddeus', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 18, '2017-09-24', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1051, 'SEP15U00968', 'MUTUSA Yonah', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 18, '2017-09-24', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1052, 'SEP15U02050', 'NIWEBYOONA Hillary', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 18, '2017-09-24', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1053, 'SEP15U00969', 'OPIO Emmanuel', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 18, '2017-09-24', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1054, 'JAN16/U/084', 'Arikiza Miracle Okonjo', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 18, '2017-09-24', 10, 11, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1055, 'MAY16/U/053', 'NSEREKO Ivan', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 18, '2017-09-24', 10, 4, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1056, 'SEP16/U/116', 'NUWENSHABA Sharon', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 18, '2017-09-24', 10, 12, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1057, 'SEP16/U/117', 'MWESIGYE Benon', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 18, '2017-09-24', 10, 12, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1058, 'JAN17/U/137', 'NYOMBI Miriam', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 18, '2017-09-24', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1059, 'JAN17/U/138', 'MUTAAYA Danny', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 18, '2017-09-24', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1060, 'MAY17/U/192', 'MUTYABA Martin', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 18, '2017-09-24', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1061, 'MAY17/U/193', 'AGABA Prossy', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 18, '2017-09-24', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1062, 'SEP17/U/022', 'DRICHI Felix', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 18, '2017-09-24', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1063, 'SEP17/U/023', 'BOGERE Christopher', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 18, '2017-09-24', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1064, 'SEP17/U/024', 'TUMWEBAZE O Raymond', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 18, '2017-09-24', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1065, 'SEP17/U/025', 'NABINJUNA Generous', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 18, '2017-09-24', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1066, 'SEP17/U/026', 'OUMA Richard Odhiambo', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 18, '2017-09-24', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1067, 'SEP17/U/027', 'TWAHIIRWA Jacenta', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 18, '2017-09-24', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1068, 'SEP17/U/028', 'TALEMWA Lameki', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 18, '2017-09-24', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1069, 'SEP17/U/029', 'ADEKE Zipporah Grace', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 18, '2017-09-24', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1070, 'SEP17/U/031', 'ALIGANYIRA Innocent', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 18, '2017-09-24', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1071, 'SEP17/U/032', 'ANDRUMA Saviour', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 18, '2017-09-24', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1072, 'SEP17/U/033', 'MUTYABA Martin', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 18, '2017-09-24', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1073, 'SEP17/U/034', 'KYANZI Fred', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 18, '2017-09-24', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1074, 'SEP17/U/035', 'RUREMA Coliab', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 18, '2017-09-24', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1075, 'SEP17/U/036', 'NAMUGULA Gloria', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 18, '2017-09-24', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1076, 'SEP17/U/037', 'MUSINGUZI Yakobo', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 18, '2017-09-24', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1077, 'SEP17/U/038', 'KANYESIGYE Tyson', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 18, '2017-09-24', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1078, 'SEP17/U/039', 'AGABA Prossy', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 18, '2017-09-24', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1079, 'SEP17/U/040', NULL, NULL, NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 18, '2017-09-24', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1080, 'SEP17/U/041', NULL, NULL, NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 18, '2017-09-24', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1081, 'SEP17/U/042', NULL, NULL, NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 18, '2017-09-24', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1082, 'SEP14U01164', 'VUYIRA Jurugo James', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 15, '2017-09-24', 10, 9, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1083, 'SEP14U01664', 'LEONIDAS Joseph', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 15, '2017-09-24', 10, 9, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1084, 'SEP14U01665', 'NAMUYIGA Swaburah', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 15, '2017-09-24', 10, 9, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1085, 'SEP14U01666', 'AKANKWASA Regan', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 15, '2017-09-24', 10, 9, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1086, 'SEP17/U/086', 'MUSASIZI Marvin Ezra', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 15, '2017-09-24', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1087, 'SEP17/U/087', 'BAKWANYA Chrispus Muhindo', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 15, '2017-09-24', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1088, 'SEP14U01765', 'MUHWEZI Ambrose', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 24, '2017-09-24', 10, 9, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1089, 'SEP14U01766', 'RUKUNDO Maureen', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 24, '2017-09-24', 10, 9, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1090, 'JAN15U01768', 'KABUUKA Robert', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 24, '2017-09-24', 10, 1, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1091, 'SEP15U01771', 'ATWINE Serugo Raizo', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 24, '2017-09-24', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1092, 'SEP15U01772', 'ACHOLA Sarah', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 24, '2017-09-24', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1093, 'SEP15U01773', 'TUHAISE Christine', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 24, '2017-09-24', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1094, 'JAN16/U/243', 'BYARUHANGA James Bisheko', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 24, '2017-09-24', 10, 11, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1095, 'MAY16/X/108', 'MAJJU Hillary Bruno', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 24, '2017-09-24', 10, 4, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1096, 'MAY16/X/110', 'SADDAM Shaban Yusuf', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 24, '2017-09-24', 10, 4, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1097, 'SEP16/U/062', 'TUMUSIIME Auther Mutungi', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 24, '2017-09-24', 10, 12, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1098, 'SEP17/U/263', 'GUMISIRIZA Paul', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 24, '2017-09-24', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1099, 'SEP17/U/264', 'AGANDRU Francis', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 24, '2017-09-24', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1100, 'SEP17/U/265', 'MUKOTI Uthman', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 24, '2017-09-24', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1101, 'SEP17/U/266', 'KERONGA Ranald', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 24, '2017-09-24', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1102, 'SEP17/U/268', 'TUSHABE Elizabeth', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 24, '2017-09-24', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1103, 'SEP17/U/269', 'REHEMA Yasin', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 24, '2017-09-24', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1104, 'SEP17/U/270', 'BEMBEREZA Eve', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 24, '2017-09-24', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1105, 'SEP17/U/156', 'ORUKA Ezekiel Elipu', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 24, '2017-09-24', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1106, 'SEP17/U/271', 'ANYAMA Richard Bob', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 24, '2017-09-24', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1107, 'SEP17/U/272', 'ARINDA Comfort Joyce', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 24, '2017-09-24', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1108, 'SEP17/U/273', 'ORISHABA Ritah', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 24, '2017-09-24', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1109, 'SEP17/U/274', 'AYEBAZIBWE Immaculate', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 24, '2017-09-24', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1110, 'SEP17/U/275', 'OWOMUGISHA Mercy', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 24, '2017-09-24', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1111, 'SEP17/U/276', 'LEKURU Annet', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 24, '2017-09-24', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1112, 'SEP17/U/277', 'NALUBOMBWE Hellen', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 24, '2017-09-24', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1113, 'SEP17/U/278', 'SSEKAJJA Jeff', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 24, '2017-09-24', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1114, 'SEP17/U/279', 'OGWANG Samson', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 24, '2017-09-24', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1115, 'SEP17/U/280', 'ANGOM Susan Sharon', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 24, '2017-09-24', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1116, 'SEP17/U/281', 'ATUHEIRE Opurah', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 24, '2017-09-24', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1117, 'SEP17/U/282', 'MASEMBE Ivan', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 24, '2017-09-24', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1118, 'SEP17/U/539', 'ENEKU John Paul', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 24, '2017-09-24', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1119, 'SEP17/U/283', 'BIRUNGI Priscilla', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 24, '2017-09-24', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1120, 'MAY15U02220', 'BITISIBWE Joseph', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 13, '2017-09-24', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1121, 'SEP17/U/075', 'OCHOLA Aaron', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 13, '2017-09-24', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1122, 'SEP17/U/076', 'ASIO Jacinta', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 13, '2017-09-24', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1123, 'SEP17/U/078', 'NABATEESA Diana', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 13, '2017-09-24', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1124, 'SEP14U001', 'CANDANO Kinyera Eric', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 8, '2017-09-24', 10, 9, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1125, 'SEP14U002', 'SSEMULUWA Steven', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 8, '2017-09-24', 10, 9, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1126, 'SEP14U003', 'BAHABWA Joshua', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 8, '2017-09-24', 10, 9, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1127, 'SEP14U004', 'KAMUNTU Perez', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 8, '2017-09-24', 10, 9, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1128, 'SEP14U005', 'NAHURIRA Babrah', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 8, '2017-09-24', 10, 9, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1129, 'SEP14U006', 'OMONY Suudi', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 8, '2017-09-24', 10, 9, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1130, 'SEP14U007', 'SENYIMBA Christopher', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 8, '2017-09-24', 10, 9, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1131, 'SEP14U008', 'OCAN Martin', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 8, '2017-09-24', 10, 9, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1132, 'SEP14U009', 'NABENDE Nicholas', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 8, '2017-09-24', 10, 9, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1133, 'SEP14U010', 'TINDIBAKIRA Thomas', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 8, '2017-09-24', 10, 9, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1134, 'SEP14U011', 'MURAMUZI Elly', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 8, '2017-09-24', 10, 9, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1143, 'JAN15U012', 'NAMBUYA Esther', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 8, '2017-09-24', 10, 1, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1144, 'JAN15U013', 'BABIRYE Joan', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 8, '2017-09-24', 10, 1, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1145, 'JAN15U079', 'TURYAGUMANAWE Godwin', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 8, '2017-09-24', 10, 1, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1146, 'JAN15U014', 'SERWANJA Musitafa', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 8, '2017-09-24', 10, 1, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1147, 'JAN15U015', 'MULODHI Hassan', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 8, '2017-09-24', 10, 1, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1148, 'JAN15U016', 'SSEKYANZI Micheal', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 8, '2017-09-24', 10, 1, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1149, 'JAN15U017', 'SSENDAGALA Abubaker', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 8, '2017-09-24', 10, 1, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1150, 'JAN15U018', 'MUTARUTWA Miki', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 8, '2017-09-24', 10, 1, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1151, 'MAY15U019', 'NASSOLO Dorothy', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 8, '2017-09-24', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1152, 'SEP15U020', 'NABUGEKE Josephine', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 8, '2017-09-24', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1153, 'SEP15U021', 'WOBUSOBOZI Nichodemus', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 8, '2017-09-24', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1154, 'SEP15U022', 'KAMUGISHA Jamie Donald', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 8, '2017-09-24', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1155, 'SEP15U023', 'MBABAZI Charles', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 8, '2017-09-24', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1156, 'SEP15U024', 'AGABA Victor', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 8, '2017-09-24', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1157, 'SEP15U025 ', 'OBOTE Denis', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 8, '2017-09-24', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1158, 'SEP15U101 ', 'MUKAMA Steven Katikuzi', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 8, '2017-09-24', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1159, 'SEP15U102 ', 'KIGENYI Ali', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 8, '2017-09-24', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1160, 'SEP15U103 ', 'AMANYABYONA Ronah', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 8, '2017-09-24', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1161, 'SEP15U032', 'SSENTONGO Godfrey', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 8, '2017-09-24', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1162, 'SEP15U105 ', 'ODONGO Dan', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 8, '2017-09-24', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1163, 'SEP15U106 ', 'AHIMBISIBWE Julius', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 8, '2017-09-24', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1164, 'SEP15U107 ', 'KOMAKECH Edward', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 8, '2017-09-24', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1165, 'SEP15U108 ', 'KAMWESIGYE Georgina', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 8, '2017-09-24', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1166, 'SEP15U109 ', 'NABIRYE Cynthia Ritah', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 8, '2017-09-24', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1167, 'MAY16/U/031', 'AGABA Christopher Joseph', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 8, '2017-09-24', 10, 4, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1168, 'MAY16/U/032', 'NAMUHENI Patricia', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 8, '2017-09-24', 10, 4, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1169, 'MAY16/U/033', 'MUKONGE Eric', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 8, '2017-09-24', 10, 4, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1170, 'MAY16/U/034', 'BIRUNGI Davis', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 8, '2017-09-24', 10, 4, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1171, 'MAY16/U/036', 'NAKALANZI Gloria', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 8, '2017-09-24', 10, 4, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1172, 'MAY16/U/037', 'OCHEN Thomas', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 8, '2017-09-24', 10, 4, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1173, 'SEP16/U/185', 'WALYAMBOKA Agaba', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 8, '2017-09-24', 10, 12, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1174, 'SEP16/U/186', 'OMONDI Ricky', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 8, '2017-09-24', 10, 12, 0, '2017-10-10 11:51:32', NULL, NULL, NULL);
INSERT INTO `student` (`student_id`, `registration_number`, `name`, `gender`, `contact`, `email`, `photo`, `password`, `universities_university_id`, `courses_course_id`, `_when_added`, `_who_added`, `intake_intake_id`, `status`, `logged_in`, `t_created_on`, `t_updated_on`, `nationality`) VALUES
(1175, 'SEP16/U/187', 'KITUGWANIDDE Elijah', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 8, '2017-09-24', 10, 12, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1176, 'SEP16/U/188', 'OKOT Emmanuel', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 8, '2017-09-24', 10, 12, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1177, 'SEP16/U/189', 'NDAWULA Alex', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 8, '2017-09-24', 10, 12, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1178, 'SEP16/U/190', 'ASIIMWE Richard', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 8, '2017-09-24', 10, 12, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1179, 'SEP16/U/191', 'MAGAMBO Joshua', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 8, '2017-09-24', 10, 12, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1180, 'SEP16/U/192', 'KASEKENDE Anold', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 8, '2017-09-24', 10, 12, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1181, 'SEP16/U/133', 'MUBANGIZI Osten', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 8, '2017-09-24', 10, 12, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1182, 'SEP16/U/193', 'LUKWAGO Joseph', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 8, '2017-09-24', 10, 12, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1183, 'JAN17/U/044', 'MUNYANEZA Ivan', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 8, '2017-09-24', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1184, 'MAY17/X/001', 'FRANCO Babariji Enock', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 8, '2017-09-24', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1185, 'MAY17/U/002', 'WANI William', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 8, '2017-09-24', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1186, 'MAY17/U/004', 'NALUJJUMWA Gloria Tracy', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 8, '2017-09-24', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1187, 'SEP17/U/325', 'BWAMBALE Phenehasi', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 8, '2017-09-24', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1188, 'SEP17/U/326', 'OKWII Michael Stephen', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 8, '2017-09-24', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1189, 'SEP17/U/327', 'TAAKA Sheilla Bridget', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 8, '2017-09-24', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1190, 'SEP17/U/328', 'AINEMBABAZI Faith', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 8, '2017-09-24', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1191, 'SEP17/U/329', 'SSEMATIMBA Ronald', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 8, '2017-09-24', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1192, 'SEP17/U/330', 'ANDINDA Anderson', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 8, '2017-09-24', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1193, 'SEP17/U/331', 'MUSIITWA Edmond', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 8, '2017-09-24', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1194, 'SEP17/U/332', 'NALUBEGA Daphine Lubega', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 8, '2017-09-24', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1195, 'SEP17/U/333', 'EWAI Ronald', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 8, '2017-09-24', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1196, 'SEP17/U/334', 'ATUZARIRWE  Ireen', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 8, '2017-09-24', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1197, 'SEP17/U/335', 'NYANGA Johnathan', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 8, '2017-09-24', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1198, 'SEP17/U/336', 'ZALWANGO Erina', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 8, '2017-09-24', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1199, 'JAN17/PGDME/001X', 'MPHUTHING Relebohile Dinah', 'F', NULL, 'relebohiled.mphuthing@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 43, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1200, 'JAN17/PGDME/002U', 'OKWII Michael Stephen', 'M', NULL, 'kwimichstep@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 43, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1201, 'JAN17/PGDME/003U', 'NINSIIMA Edwig', 'M', '0773279871/0703832463', 'ninsiimaedwiig@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 43, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1202, 'JAN17/PGDME/004U', 'ALUPO Elizabeth', 'F', '0777766018', 'betalupo@yahoo.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 43, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1203, 'JAN17/PGDME/005U', 'AINOMUGISHA Glorias', 'F', '0779804840/0703081612', 'gloriaainomugisha@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 43, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1204, 'JAN17/PGDME/006U', 'EKOTOI Nicholas Franco', 'M', '0773 286 672/ ''0750 496 147', 'nickshy2002@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 43, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1205, 'JAN17/PGDME/007U', 'NAKITYO Annet', 'F', '0773276389', 'nakiann17@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 43, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1206, 'JAN17/PGDME/008U', 'AHIMBISIBWE Joan Barungi', 'F', '0791835704', 'joannebarungi@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 43, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1207, 'JAN17/PGDME/009U', 'SSIMBWA Edward', 'M', '0785409892', 'ssimeddiee@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 43, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1208, 'JAN17/PGDME/010X', 'HATUNGIMANA Fornice', 'M', '+257 79498829/+257 79244808', 'hafornice@hotmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 43, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1209, 'JAN17/PGDME/011X', 'ANGULA Titus', 'M', '+264672232300', 'tituz87@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 43, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1210, 'JAN17/PGDME/012U', 'NANTEZA Brendah', 'F', '0704273450', 'nantezabrendah@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 43, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1211, 'JAN17/PGDME/013U', 'OSINDE Cyrus', 'M', '0701107755', 'osindecyrus@yahoo.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 43, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1212, 'JAN17/PGDME/014U', 'NYENDE Ramathan', 'M', '0752535342', 'ramanyende@gmail.com,ramanyend@yahoo.co.uk', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 43, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1213, 'JAN17/PGDME/015U', 'BAGUMA Stephen', 'M', '0772694835,0704260000', 'bagumastephen02@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 43, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1214, 'JAN17/PGDME/016U', 'FUAMBE Esther Preshiella', 'F', '0789019068', 'preshiella15@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 43, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1215, 'JAN17/PGDME/017U', 'NAKIMBUGWE Flavia', 'F', '0704066955, 0782407343', 'lutaflo@yahoo.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 43, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1216, 'JAN17/PGDME/018U', 'AHIMBISIBWE Julius', 'M', '0700843646', 'ahimbisibwe.julius@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 43, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1217, 'JAN17/PGDME/019U', 'BBAALE Joseph', 'M', '0782440790,0701332475', 'jbbaale2020@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 43, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1218, 'JAN17/PGDME/021X', 'LOGOYE Simon Lagu Luka', 'M', '+2119563866424, 0781134360', 'simonlagu@yahoo.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 43, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1219, 'JAN17/PGDME/022U', 'LADWONG Francine', 'F', '0758990190', 'ladwongfrancine@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 43, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1220, 'JAN17/PGDME/023U', 'ADONGOT Vicky', 'F', '0788514447', 'vickyadongot@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 43, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1221, 'JAN17/PGDME/024U', 'WANA Godwill', 'M', '0701121290', 'wanagd@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 43, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1222, 'JAN17/PGDME/025U', 'MUSIIME Doreen', 'F', '0702827040', 'doreenmusiime@yahoo.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 43, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1223, 'JAN17/PGDME/026U', 'ASIIMWE Doreen', 'F', '0700362434, 0782390919', 'doreenasiimwe@yahoo.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 43, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1224, 'JAN17/PGDME/027U', 'MURUNGI Daniel', 'M', '0782 136 346', 'dakielmurungi@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 43, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1225, 'JAN17/PGDME/028U', 'CHEROTIN Diana', 'F', '0784870775', 'dianacherotin@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 43, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1226, 'JAN17/PGDME/029U', 'ATUHAIRWE Brenda', 'F', '0752 486 166', 'batuhairwe@ppda.go.ug', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 43, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1227, 'JAN17/PGDME/030U', 'NAGUDI Lilian', 'F', '0706 515 417/0775 916 787', 'lilian1nagudi@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 43, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1228, 'MAY17/PGDIT/001U', 'ESIMU Felix Jude', 'M', '0704190275', 'jef.ac.ug@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 30, '2017-09-26', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1229, 'MAY17/PGDIT/002U', 'TURYATUNGA Ronald', 'M', '0701 726 405', 'blestturyaronijr@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 30, '2017-09-26', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1230, 'MAY17/PGDME/001U', 'NUWASASIRA Alex Biryahererahi', 'M', '0774230904/0704230904', 'nuwabalex@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 43, '2017-09-26', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1231, 'MAY17/PGDME/002U', 'ONGOM Leonard Jimmy', 'M', '0777 77 63 32', 'jongom@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 43, '2017-09-26', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1232, 'MAY17/PGDME/003U', 'KATUSIIME Kabazeyo Felece', 'F', '0772 838 371', 'kkfelece@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 43, '2017-09-26', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1233, 'MAY17/PGDME/004U', 'NYAMUNGU Proscovia Osoa', 'F', '0772 356 981/''0751 123 603', 'prossynyamungu333@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 43, '2017-09-26', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1234, 'MAY17/PGDME/005U', 'SSEMPANYI Dominic', 'M', '0774 310 934', 'ssempanyid@yahoo.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 43, '2017-09-26', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1235, 'MAY17/PGDME/006U', 'ODONGO Ronald', 'M', '0752 859 367', 'ronnie.od@hotmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 43, '2017-09-26', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1236, 'MAY17/PGDME/007U', 'OBURA Raphael', 'M', '0777 263 397', 'oburarapheal@gmail.com ', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 43, '2017-09-26', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1237, 'MAY17/PGDME/008U', 'NAIGAGA Junic', 'F', '0788 565 373/0702 268 920', 'naigajunic@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 43, '2017-09-26', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1238, 'MAY17/PGDME/009U', 'ONGOM Bonny Wuma', 'M', '0703 791 727/0782 263 274', 'bonnywuma@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 43, '2017-09-26', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1239, 'MAY17/PGDME/010U', 'CAROLINE Isuba', 'F', '0779802568', 'isubacarol@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 43, '2017-09-26', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1240, 'MAY17/PGDME/011U', 'NAKIMBUGWE Flavia', 'F', '0782 407 343/''0704 066 955', 'lutaflo@yahoo.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 43, '2017-09-26', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1241, 'MAY17/PGDME/012U', 'AGWANG Betty', 'F', '0782 282765', 'betagwang@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 43, '2017-09-26', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1242, 'MAY17/PGDME/013U', 'NDAWULA Harold Fredrick', 'M', '''0705 222 277/0312 307 000', 'hndawula@idi.co.ug', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 43, '2017-09-26', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1243, 'MAY17/PGDME/014U', 'MAWONYE Ray', 'M', '0779 912 652/''0704 589 094', 'raymawonye2006@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 43, '2017-09-26', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1244, 'MAY17/PGDME/015U', 'OCAN Deo', 'M', '0783545574/ 0704447030', 'gratiousd@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 43, '2017-09-26', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1245, 'MAY17/PGDME/016U', 'KULE Joseph', 'M', '0701 528 140/''0777 619 048', 'kulejoseph123@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 43, '2017-09-26', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1246, 'MAY17/PGDPA/001U', 'TURYATUNGA Patrick Boaz', 'M', '0772 834 865', 'turyatungapatrick@yahoo.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 75, '2017-09-26', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1247, 'MAY17/PGDPA/002U', 'NABWIRE Immaculate', 'F', '0784 712 584', 'nabsimma@yahoo.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 75, '2017-09-26', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1248, 'MAY17/PGDPA/003U', 'KEMIGISHA Jennifer', 'F', '0756 217 813/''0772 538 248', 'kemigisahajennife150@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 75, '2017-09-26', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1249, 'MAY17/PGDPA/004U', 'KIYEMBA Muzafaru', 'M', '0701 871 899', NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 75, '2017-09-26', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1250, 'MAY17/PGDPPM/001X', 'TUT Thomas Simon', 'M', '0775140046', 'thomastut79@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 81, '2017-09-26', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1251, 'MAY17/PGDPPM/002U', 'KANAKULYA Lawrence', 'M', '0705 407 416/ 0773 276 161', 'kanakulyalawrence@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 81, '2017-09-26', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1252, 'MAY17/PGDPPM/003U', 'JABWELI Jacob', 'M', '0782 658 436/0752658 436/0755057565', 'jabweli2015@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 81, '2017-09-26', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1253, 'MAY17/PGDPPM/004U', 'OKOTH Joseph Micheal', 'M', '0701 951 444/ 0779 679 949', 'okothjoseph47@yhaoo.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 81, '2017-09-26', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1254, 'MAY17/PGDPPM/005U', 'BBOSA Lutalo Dennis', 'M', '0752 499 751', 'diner10@yahoo.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 81, '2017-09-26', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1255, 'JAN17/PGDPP/001U', 'MASIKA Constance', 'F', '0703712088', 'masikaconsy@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 83, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1256, 'JAN17/PGDPP/002U', 'EJIUKU David Patrick', 'M', '0782981540', 'ejidpatrick@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 83, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1257, 'JAN17/PGDPP/003U', 'NAMAYANJA Rebecca', 'F', '0775447025', 'haileybecky@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 83, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1258, 'JAN17/PGDPP/004U', 'MASAGAZI Sophia Nassali', 'F', '0702129168', 'smasagazi@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 83, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1262, 'JAN17/PGDIS/001U', 'WEGULO Joel', 'M', '0782860224/0751766663', 'joewegulo@yahoo.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 29, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1263, 'JAN17/PGDIS/002U', 'MUWANGUZI Bernard Kizito Lutaaya', 'M', '0782262066', 'muwanguzibk@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 29, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1264, 'JAN17/PGDIS/003U', 'SEREMBA Daniel', 'M', '0775196491', 'serembadaniel@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 29, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1265, 'JAN17/PGDPPM/001U', 'SSUUNA Frank', 'M', '0701543786', 'francisssuuna@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 76, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1266, 'JAN17/PGDPPM/002U', 'KISAKYE Daniel Justus', 'M', '0780298595/0758335631', 'kisakyejd9@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 76, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1267, 'JAN17/PGDPPM/003X', 'MULEWA Olita', 'F', '+265991673173', 'omulewa@ymail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 76, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1268, 'JAN17/PGDPPM/004U', 'OKENG Isaac', 'M', '0752593513', 'izo2n@yahoo.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 76, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1269, 'JAN17/PGDPPM/005U', 'ADONG Jennifer Oryema', 'M', '0774756822', 'jnnfradong@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 76, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1270, 'JAN17/PGDPPM/006U', 'TUSIIME Javis Bosco', 'M', '0787226751', 'jarvsbosco@yahoo.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 76, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1271, 'JAN17/PGDPPM/007X', 'ROZA Ireneo Ufeu Fada', 'F', '0754910464', 'rahmafada@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 76, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1272, 'JAN17/PGDPPM/008U', 'PULE Jimmy', 'M', '0752440728', 'jimmpule@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 76, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1273, 'JAN17/PGDPPM/009U', 'OKELLO Simon', 'M', '0755461835, 0783569523', 's.okello@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 76, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1274, 'JAN17/PGDPPM/010X', 'MANAHIL Omer Ahmed Hassan', 'M', '0777443315', 'ahmedmanahil22@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 76, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1275, 'JAN17/PGDPPM/011U', 'MUGEIGA Richard Batecereza Kato', 'M', '0701822164, 0787109427', 'mugeigo.kato@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 76, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1276, 'JAN17/PGDPPM/012U', 'TENDO Ruth', 'F', '0781643976,0701652192', 'ruthtendo111@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 76, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1277, 'JAN17/PGDPPM/013U', 'TUKACUNGURWA Fabiano', 'M', '0774177226', 'f.tukacungurwa@yahoo.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 76, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1278, 'JAN17/PGDPPM/014U', 'SSEBANDEKE Robert', 'M', '0706 658 503', 'robert.ssebandeke@heifer.org', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 76, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1279, 'JAN17/PGDPPM/015X', 'BROU Hugues Koffi', 'M', '0757 001 627/0781 800 305', 'hugbrou@gmail.com /brouh@un.org', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 76, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1280, 'JAN17/PGDHRMD/001U', 'NAKIBIRIGE Nuru', 'F', '0774684124', 'nurunakibirige@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 77, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1281, 'JAN17/PGDHRMD/002U', 'ADONGO Alice', 'F', '0701304309', 'afjjho@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 77, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1282, 'JAN17/PGDHRMD/003U', 'NAYIGA Joan', 'F', '0774462991', 'nayiga.joan@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 77, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1283, 'JAN17/PGDHRMD/004U', 'AKELLO Victoria J.', 'F', '0752917092\n0703996897', 'victoriaviatyjune@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 77, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1284, 'MAY17/PGDME/001U', 'NUWASASIRA Alex Biryahererahi', 'M', '0774230904/0704230904', 'nuwabalex@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 43, '2017-09-26', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1285, 'SEP17/PGDCOMP/002T', 'ABED Rukiza', 'M', '+255784627700', 'abedrukiza29@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 28, '2017-09-26', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1286, 'MAY17/PGDPPM/001X', 'TUT Thomas Simon', 'M', '0775140046', 'thomastut79@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 76, '2017-09-26', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1287, 'SEP17/PGDHRMD/001U', 'KWIKIRIZA Richard', 'M', '0704 217 033', 'richard.kmrio@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 77, '2017-09-26', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1288, 'SEP17/PGDHRMD/002U', 'SAGABO Peter', 'M', '0776 724 226', 'psagaboa@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 77, '2017-09-26', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1289, 'SEP17/PGDHRMD/003U', 'KIRYA Henry', 'M', '0778 41 36 01/                               ', 'henrykirya8@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 77, '2017-09-26', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1290, 'SEP17/PGDHRMD/004X', 'YUSUF Nwanmaghyi Yawai', 'M', '+234 803 450 1914', 'yusufnyawai@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 77, '2017-09-26', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1291, 'JAN17/PGDIT/001U', 'MUBIRU Huzaifa', 'M', '703620269', 'huzaifamubiru@yahoo.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 30, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1292, 'SEP17/PGDIS/001U', 'MUSIMAMI Paul', '0772 961 022', 'musimami.paul@yahoo.com', NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 29, '2017-09-26', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1293, 'SEP17/PGDIS/002U', 'AMULE Julius', '0774 606 750/                  ''+211 915 33 7', 'ajkwajje1@gmail.com', NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 29, '2017-09-26', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1294, 'SEP17/PGDIS/003U', 'KIRABO Eva Irene', '0775 68 43 43', 'eveiryn@yahoo.com', NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 29, '2017-09-26', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1295, 'SEP17/PGDIS/004U', 'NANSIKOMBI Damalie', '0776 95 93 48/                  '' 0712 95 93 ', 'nansikombid@yahoo.com', NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 29, '2017-09-26', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1296, 'SEP17/PGDIT/001U', 'SEBBANJA Christopher', 'M', '0771989535', 'sebchris0@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 30, '2017-09-26', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1297, 'SEP17/PGDIT/002T', 'RUKIZA Abed ', 'M', '+255784627700', 'abedrukiza29@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 30, '2017-09-26', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1298, 'SEP17/PGDIT/003X', 'ALUE Peter John', 'M', '+256 733 786 701/                       ''+211', 'petoriawad@yahoo.com/petoriawad@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 30, '2017-09-26', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1299, 'MAY17/PGDIT/001U', 'ESIMU Felix Jude', 'M', '0704190275', 'jef.ac.ug@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 29, '2017-09-26', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1300, 'SEP17/PGDME/001U', 'NAMAZZI Betty', 'F', '0784 941 459', 'namazzibetty@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 43, '2017-09-26', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1301, 'SEP17/PGDME/002U', 'NASONGA Anita', 'F', '0783 85 82 67/     ''0704 89 40 98', 'nasongaanita@yahoo.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 43, '2017-09-26', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1302, 'SEP17/PGDME/003X', 'TUMUSHIME Michel', 'M', '0777 74 39 12', 'tumusiimemichel@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 43, '2017-09-26', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1303, 'SEP17/PGDME/004U', 'NDIMUKULAGA Patrick', 'M', '0783491036', 'kapojames@yahoo.co.uk', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 43, '2017-09-26', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1304, 'SEP17/PGDME/005U', 'NSUBUGA Deo', 'M', '+337 538 23 670', 'deo.nsubuga@eleve.ehesp.fr', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 43, '2017-09-26', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1305, 'SEP17/PGDME/006X', 'MUJAHID Aliyu Idris', 'M', '+234 816 668 8022', 'idrisaliuidris@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 43, '2017-09-26', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1306, 'SEP17/PGDME/007U', 'BITHUM Jasmine', 'F', '0782 40 55 27', 'bijasmine45@gmail.com/jasmine.bithum@centenar', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 43, '2017-09-26', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1307, 'SEP17/PGDME/008X', 'ABD Elrahman Hassan Tebin Saad Elnour', 'M', '+002 499 180 51 045/                         ', 'tibben3@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 43, '2017-09-26', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1308, 'SEP17/PGDME/010U', 'KAMYA Kisenyi Edmund', 'M', '0773208194', 'kkedmunds01@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 43, '2017-09-26', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1309, 'SEP17/PGDME/012U', 'MATOVU Husnah', 'F', '0712 57 97 33', 'husnah.matovu@yahoo.co.uk', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 43, '2017-09-26', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1310, 'SEP17/PGDME/013U', 'ODONGO Walter', 'M', '0772 184 448/               ''0752 18 44 48', 'odongowalter86@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 43, '2017-09-26', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1311, 'SEP17/PGDME/014U', 'AHUMURIZA Mariana', 'F', '0702 26 55 78', 'ainesasha4@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 43, '2017-09-26', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1312, 'SEP17/PGDPA/001U', 'ATIM Getrude', 'F', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 75, '2017-09-26', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1313, 'JAN17/PGDPA/001U', 'ATULINDE Alfred', 'M', '0782780977, 0704795947', 'alfredatulinde@outlook.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 75, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1314, 'JAN17/PGDPA/002U', 'OYIRWOTH Jerry', 'M', '0774937395', 'oyirwothj@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 75, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1315, 'JAN17/PGDPA/003U', 'NANSAMBU Sylvia', 'F', '0772637202', 'snansambu@hotmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 75, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1316, 'SEP17/PGDPPM/001U', 'WASSWA Frank', 'M', '0785 160 102/              ''0701 629 839', 'frank.wasswa.buwembo@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 76, '2017-09-26', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1317, 'SEP17/PGDPPM/002X', 'MAC Brian Jamu', 'M', NULL, 'macbrianjamu@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 76, '2017-09-26', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1318, 'SEP17/PGDPPM/003U', 'LULE Lamech Kitandwe', 'M', '0774 834 082/0755 871 124', 'lamechlule@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 76, '2017-09-26', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1319, 'SEP17/PGDPPM/004U', 'ZIRIMENYA Nicholas', 'M', '0702304723/0779567305', 'zirimenyanicholas@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 76, '2017-09-26', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1320, 'SEP17/PGDPPM/005U', 'ALELA Beatrice', 'F', '0773 39 45 41/       ''0758 39 45 41', 'alelabeatrice@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 76, '2017-09-26', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1321, 'SEP17/PGDPPM/006U', 'KASIBANTE Alex', 'M', '0701 108 714/               ''0773 129 272', 'kasibanta@yahoo.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 76, '2017-09-26', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1322, 'SEP17/PGDPPM/008U', 'MBASA Bryan Bashaija', 'M', '0772 121 015', 'bryan.mbasa@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 76, '2017-09-26', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1323, 'SEP17/PGDPPM/009U', 'ABIKO Noel', 'F', '0782 76 16 85', 'noel.abiko@centenarybank.co.ug', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 76, '2017-09-26', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1324, 'SEP17/PGDPPM/010U', 'LOMOYI David Charles', 'M', '0782 272 331/             ''0750 067 433', 'lomoyidavid@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 76, '2017-09-26', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1325, 'SEP17/PGDPPM/011U', 'AYEBARE Rahab', 'F', '0776 04 99 23/                  ''0704 29 55 5', 'yerahabt@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 76, '2017-09-26', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1326, 'SEP17/PGDPPM/012U', 'WATENTENA Amos', 'M', '0783 83 19 61', 'wateamos@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 76, '2017-09-26', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1327, 'SEP17/PGDPPM/013U', 'EBINU Ekadu Samuel', 'M', '0772 08 00 28', 'samebinu@gmail.com/sam.ebinu@centenarybank.co', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 76, '2017-09-26', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1328, 'SEP17/PGDPPM/014U', 'NTALE Patrick', 'M', '0785 17 32 07', 'didintale@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 76, '2017-09-26', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1329, 'SEP17/PGDPPM/015U', 'NAVVUGA Esther', 'F', '''0784 23 49 72/          ''0752 23 49 72', 'navvugaesther@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 76, '2017-09-26', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1330, 'JAN17/PGDOGM/001X', 'AGWER Angelo Chol Dongway ', 'Male', '+211912737826,+21154127045', 'acdongway@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 84, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1331, 'SEP17/PGDOGM/001X', 'ALISON James Bak Kazaran', 'M', NULL, 'alisonkazaran81@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 84, '2017-09-26', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1332, 'SEP17/PGDOGM/002U', 'KASAMBA Alex Ofoyuru', 'M', '0772886427', 'alexofoyuru@yahoo.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 84, '2017-09-26', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1333, 'SEP17/PGDOGM/003U', 'BAHINDI Asiimwe Charles', 'M', '0772 40 63 96/''070266 31 27', 'charlesasiimwe12@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 84, '2017-09-26', 10, 13, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1334, 'MAY17/MPAM/001U', 'KALUMBA Joyce', 'F', '0772 414 724/0776 221 405/0702 414 724', 'kalumbaj@yahoo.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 59, '2017-09-26', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1335, 'MAY17/MPAM/003X', 'AHMED Mohamed Abdi', 'M', '0792 008 756', 'karkaar123@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 59, '2017-09-26', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1336, 'MAY17/MPAM/005U', 'AINEMBABAZI Ronah', 'F', '0705 86 31 17/+256 392 566 353', 'rhoframbabazi@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 59, '2017-09-26', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1337, 'MAY17/MPAM/002U', 'TUKASHABA Safina Beine', 'F', '0772 632 267', 'safinabeine@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 59, '2017-09-26', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1338, 'MAY17/MPAM/004U', 'TAKALI Jane', 'F', '0782 552 695/ 0702 242 981', 'janetakali@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 59, '2017-09-26', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1339, 'MAY17/MBA/001U', 'ATWINE Jarvis', 'M', '0781 452 230', 'jarvismu@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 58, '2017-09-26', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1340, 'MAY17/MBA/002U', 'KIGOZI Joseph', 'F', '0773 003 231', 'joe.seggalye@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 58, '2017-09-26', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1341, 'MAY17/MBA/003U', 'SALWA Abdallah', 'F', '0772 400 081', 'salwa.abdallah@tullowoil.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 58, '2017-09-26', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1342, 'MAY17/MBA/004U', 'AKOMI Richard Adiradira', 'M', '0772 853 589/ ''0757 392 686', 'adiradira2adua@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 58, '2017-09-26', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1343, 'MAY17/MBA/005U', 'NABIYIKI Joan', 'F', '0757 593 949', 'joannkula@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 58, '2017-09-26', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1344, 'MAY17/MBA/006U', 'KISAKYE Allen', 'F', '0704 041 688', 'allenkisakye85@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 58, '2017-09-26', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1345, 'MAY17/MBA/007U', 'NKWITSANA Roland', 'M', '0777 912 184/  ''0704 006 412', 'rnkwitsana@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 58, '2017-09-26', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1346, 'MAY17/MBA/008U', 'OGULE Gerald', 'M', '0771 463 794/ ''0705 041 690', 'ogulegerald2017@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 58, '2017-09-26', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1347, 'MAY17/MBA/009U', 'LINDRIO Christine', 'F', '0782 481 833', 'clindri@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 58, '2017-09-26', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1348, 'MAY17/MBA/010U', 'UNZIMAI Norman Easter', 'M', '0782 647 311', 'unnorman372@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 58, '2017-09-26', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1349, 'MAY17/MBA/011U', 'MUTAASA Humphrey', 'M', '0772 321 736/  ''0704 778 646', 'md@agripoint.org', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 58, '2017-09-26', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1350, 'MAY17/MBA/012X', 'ABUBAKAR Nura Mai-Shanu', 'M', '0780 958 808/ ''0704 949 611', 'maishanu003@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 58, '2017-09-26', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1351, 'MAY17/MBA/013U', 'MUGULUSI Michael', 'M', '0772 686 908', 'mmugulusi@ura.go.ug', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 58, '2017-09-26', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1352, 'MAY17/EMBA/001U', 'FRIDAY Diana', 'M', '0782450661', 'fridaydiana@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 56, '2017-09-26', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1353, 'MAY17/EMBA/002X', 'WILSON Deng Kuoirot', 'M', '+211 955 420 908/ ''0775 374 240', 'dengkuoirot@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 56, '2017-09-26', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1354, 'MAY17/EMBA/003U', 'KATONO Susan', 'F', '0774 354 068', 'susankatono@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 56, '2017-09-26', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1355, 'MAY17/EMBA/004U', 'MULANGIRA Tabitha Olga', 'F', '0774 357 777', 'motabitha2@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 56, '2017-09-26', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1356, 'MAY17/EMBA/005U', 'KIRUNDA Solomon Wilson', 'M', '0702 020 220', 'solwill2000@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 56, '2017-09-26', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1357, 'MAY17/EMBA/007U', 'KABASIITA Everlyne', 'F', '0783 260 368', 'everlyn2010@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 56, '2017-09-26', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1358, 'MAY17/EMBA/008U', 'ANGURA James Peter', 'M', '0772 891 610', 'angurajames@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 56, '2017-09-26', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1359, 'MAY17/EMBA/009U', 'BEINE Robert', 'M', '0782 056 265', 'beinro@yahoo.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 56, '2017-09-26', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1360, 'MAY17/EMBA/010U', 'KATASI Alice', 'M', '0772 655 966/ ''0752 655 966', 'alikatasi@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 56, '2017-09-26', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1361, 'MAY17/EMBA/011U', 'NDAGIRE Irene Jemimah', 'F', '+90 312 437 0194/95', 'princessjiremima@hotmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 56, '2017-09-26', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1362, 'MAY17/EMBA/012U', 'TIMU Godfrey', 'M', ' 0779 616 817/        ''0702 660 914', 'timugodfrey@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 56, '2017-09-26', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1363, 'MAY17/EMBA/013U', 'KYOKUSHABA Harriet', 'F', '0703 601 701/  ''0782 350 597', 'Harriet.Kyokushaba@vsoint.org', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 56, '2017-09-26', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1364, 'MAY17/EMBA/014U', 'MUHUMUZA Esther', 'F', '0783 737578/ 0702 113719', 'muhumuzaesther@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 56, '2017-09-26', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1365, 'MAY17/EMBA/017U', 'MUHANGYI John', 'M', '0782 859 025/ ''0750 919 714', 'j.muhangyi@lgihe.org/                        ', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 56, '2017-09-26', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1366, 'MAY17/EMBA/019U', 'BAMWEYANA Ivan', 'M', '0782 180 350', 'ivanson5@gmail.com ', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 56, '2017-09-26', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1367, 'MAY17/EMBA/021U', 'KABASINDI Grace', 'F', '0772 43 47 59/  ''0784 17 77 38', 'kbarongo@ymail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 56, '2017-09-26', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1368, 'MAY17/EMBA/022U', 'NEIKIRIZA Ruth', 'F', '0701 430 678/         ''0772 409 479', 'neikruth@yahoo.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 56, '2017-09-26', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1369, 'MAY17/EMBA/023U', 'KAYANJA Ezekiel', 'M', '0759 990 746', 'kayanja.ezekiel@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 56, '2017-09-26', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1370, 'MAY17/EMBA/024U', 'WALUSAGA Daniel', 'M', '0772 431 045/ ''0752 431 045', 'danwalusaga@yahoo.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 56, '2017-09-26', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1371, 'MAY17/EMBA/026U', 'MUSOKE Robert', 'M', '0757 36 80 52', 'musookebob@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 56, '2017-09-26', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1372, 'MAY17/EMBA/028U', NULL, NULL, NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 56, '2017-09-26', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1373, 'MAY17/EMBA/015U', 'LUTARA Angella', 'F', '0782 182 815', 'angellaomalla@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 56, '2017-09-26', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1374, 'MAY17/EMBA/016U', 'ESTHER Favour Senfuma', 'F', '0776 507 780/  ''0705 107 780', 'favoursenfuma@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 56, '2017-09-26', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1375, 'MAY17/EMBA/018U', 'ODEKE Francis Paul', 'M', '0772 488 706', 'odekepaul@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 56, '2017-09-26', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1376, 'MAY17/EMBA/020U', 'OPIRA Cosma', 'M', '0773 199 614 ', 'jcosmio2004@yahoo.co.uk', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 56, '2017-09-26', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1377, 'MAY17/EMBA/025U', 'ATIM Julian Wagama', 'F', '0787 95 68 75/ ''0758 53 57 66', 'atimjulian1@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 56, '2017-09-26', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1378, 'MAY17/EMBA/027U', 'NASSALI Annet', 'F', '0752 503 939', 'sempangia@stanbic.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 56, '2017-09-26', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1379, 'MAY17/MME/001U', 'WASUKIRA Allan Gordon', 'M', '0703533674', 'wasukiraa@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1380, 'MAY17/MME/002U', 'KABOGOZA Ivan', 'M', '0775995989', 'kabogozaivan@yahoo.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1381, 'MAY17/MME/003X', 'ASARE Paul Kojo', 'M', '+233208763565', 'asarepaul@yahoo.com,paul.asare@fdaghana.gov.g', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1382, 'MAY17/MME/004U', 'MUHEREZA Timothy', 'M', '0702 939 370/  ''0776 939 370', 'timfaldo@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1383, 'MAY17/MME/006U', 'AMONGI Naomi', 'F', '0754 809 046/ 0785 738 089', 'naomi@yahoo.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1384, 'MAY17/MME/007U', 'AGUTI Winnie Stella', 'F', '0772 457 675', 'ituga.allets@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1385, 'MAY17/MME/008U', 'MUSERERO K.Joseph', 'M', '0776 523 246/''0752 523 246', 'mussyjoe@yahoo.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1386, 'MAY17/MME/010U', 'KAHAIKA Kaija Denis Elisha', 'M', '0782 390 152/  ''0706 390 152', 'kahaikae@yahoo.co.uk', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1387, 'MAY17/MME/011U', 'KAHIMA Edwin', 'M', '0775 822 361', 'edwin.kahima@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1388, 'MAY17/MME/012U', 'KANKIRIHO Denis', 'M', '0702 853 333/  ''0784 171 489', 'dkankiriho@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1389, 'MAY17/MME/013U', 'KITAMIRIKE Davis', 'M', '0700 610 826', 'daviskarter@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1390, 'MAY17/MME/014U', 'ANECHO Ezra', 'M', '0701 202 141', 'ezraanecho@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1391, 'MAY17/MME/015U', 'KULUBYA Ivan', 'M', '0700 166 944', 'iva256yt@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1392, 'MAY17/MME/016X', 'AUWAL Muhammad S.K', 'M', '0755 284 070', 'auwalskmuhammad@yahoo.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1393, 'MAY17/MME/017U', 'NAMARA Jimmy Namanya', 'M', '0753 717 114', 'namarajimmy2015@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1394, 'MAY17/MME/018U', 'KAMYA Charles', 'M', '0701 487 368/''0787 969 193', 'kamyacharles71@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1395, 'MAY17/MME/019U', 'MPALANYI Samuel', 'M', '0772 344 437', 'sammpalakat@yahoo.co.uk', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1396, 'MAY17/MME/020U', 'AMOIT Osikol Lydia', 'F', '0704 073 237', 'osikollyn@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1397, 'MAY17/MME/021U', 'TUMWINE John', 'M', '0752 493 002/''0780 454 635', 'jtn3002@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1398, 'MAY17/MME/022K', 'LUCY Akinyi Richard', 'F', '0786 287 583', 'richardlucie78@yahoo.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1399, 'MAY17/MME/023K', 'PHILIP Onyango Were', 'M', NULL, 'philipowere@gmail.com ', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1400, 'MAY17/MME/025U', 'BIRUNGI Charity', 'F', '0782 95 11 58/''0703 94 47 91', 'bcharity905@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1401, 'MAY17/MME/026T', 'RUHINDA H Costantine', 'M', '+255 787 698 244', 'ruhindacostantine@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1402, 'MAY17/MME/029U', NULL, NULL, NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1403, 'MAY17/MME/005U', 'KARAHUKAYO James', 'M', '0774 266 755', 'karahukayo@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1404, 'MAY17/MME/009K', 'WILBERFORCE Walubengo Wasike', 'M', NULL, 'wasikewwalubengo@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1405, 'MAY17/MME/024U', 'MWOLOBI Theodorah', 'F', '0779 217 644/''0700 685 745', 'mwolobidorah@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1406, 'MAY17/MME/027U', 'TUHIRWE Stephen', 'M', '0772 662 420/''0703 852 489', 'tuhirwes3@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL);
INSERT INTO `student` (`student_id`, `registration_number`, `name`, `gender`, `contact`, `email`, `photo`, `password`, `universities_university_id`, `courses_course_id`, `_when_added`, `_who_added`, `intake_intake_id`, `status`, `logged_in`, `t_created_on`, `t_updated_on`, `nationality`) VALUES
(1407, 'MAY17/MME/028U', 'ODONGO Isabel Nabaasa Amongi', 'F', '0793 69 41 81', 'isabelodongo1@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1408, 'MAY17/MIT/001U', 'KAMUKAMA Ronald', 'M', '0774 728 248', 'ronnkamu@yahoo.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 36, '2017-09-26', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1409, 'MAY17/MIT/002U', 'OWAMAZIMA Alode', 'M', '0783 390 746', 'aloderhys@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 36, '2017-09-26', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1410, 'MAY17/MIT/004U', 'MUHOZA B Gloria', 'F', '0782 228 701', 'muhozagb@yahoo.co.uk', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 36, '2017-09-26', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1411, 'MAY17/MIT/005U', 'MATSIKO Begirira Johnson', 'F', '0703 566 097/ ''0776 646 411', 'johnson.matsiko@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 36, '2017-09-26', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1412, 'MAY17/MIT/006U', 'LODU Muhamed', 'M', NULL, 'engloduse@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 36, '2017-09-26', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1413, 'JAN17/EMBA/002U', 'AKELLO Doris Grace', 'F', '0772602020/0704602020', 'dorothyotim@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 56, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1414, 'JAN17/EMBA/003U', 'LUBEGA Patrick', 'M', '0772798160/0788087276', 'patric2084@yahoo.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 56, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1415, 'JAN17/EMBA/004U', 'KABUKOLE Gregory', 'M', '0772307774/0704910000', 'kabukoleg@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 56, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1416, 'JAN17/EMBA/005U', 'KIKOOLA Alex', 'M', '0775962355', 'alexkikoola@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 56, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1417, 'JAN17/EMBA/006U', 'MUGARURA John', 'M', '0782931869', 'jmugarura@hotmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 56, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1418, 'JAN17/EMBA/008U', 'BIRUNGI Robert Doogie', 'M', '0774705890', 'r_birungi@yahoo.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 56, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1419, 'JAN17/EMBA/009U', 'SEBALU Alawi', 'M', '0700229933,0704440333', 'alawi.res@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 56, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1420, 'JAN17/EMBA/010U', 'BINYINA Katagyira Kiiza Venantius', 'M', '0775644562, 0712644562', 'kkatagira@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 56, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1421, 'JAN17/EMBA/011U', 'ASHABA Anita', 'F', '0785590997', 'ashaba@utamu.ac.ug, ashabaanita@gmail.com', NULL, '80e982991fd0ff844bd0a0506ad8f0cf8ecf349c', 2, 56, '2017-09-26', 10, 15, 0, '2017-11-02 14:52:02', NULL, NULL, NULL),
(1422, 'JAN17/EMBA/012U', 'WAKOOBA Christopher', 'M', '0702940643,0782587727', 'chrisacca@yahoo.co.uk', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 56, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1423, 'JAN17/EMBA/013U', 'WABWIRE Okumu Patrick', 'M', '0772 510 935', 'wabwirepo@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 56, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1424, 'JAN17/EMBA/015U', 'NDEMERA Philippa', 'M', '0706221174', 'ndepipa@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 56, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1425, 'JAN17/EMBA/016U', 'MUWAYA Amir Ali', 'M', '0702296662', 'amiralimuwaya@yahoo.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 56, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1426, 'JAN17/EMBA/017U', 'KOMUNTALE Betsy Chocolate', 'F', '0756868116', 'bchoco702@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 56, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1427, 'JAN17/EMBA/018U', 'AKITE Alice', 'F', NULL, 'alice.akite@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 56, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1428, 'JAN17/EMBA/019U', 'NAMANYA Hilary', 'M', '0782729370', 'namhils@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 56, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1429, 'JAN17/EMBA/020U', 'SENKUNGU Richard', 'M', '0754845870', 'rsenkungu@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 56, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1430, 'JAN17/EMBA/021U', 'APIO Josephine Brendah', 'F', '0788 900 106', 'nyakalek@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 56, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1431, 'JAN17/EMBA/022K', 'GIOVANNI Odukutu Pamba', 'M', '0774 852 605/''+254 722 499 902', 'giovanni.pamba@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 56, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1432, 'JAN17/EMBA/023U', 'OLWA David Sheldrick', 'M', '0772 459 933/''0756 023 325', 'odavids6919@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 56, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1433, 'JAN17/EMBA/007U', 'KAREKYEZI  Angelic Patrick', 'M', '0784488177/0751967414', 'kangelipatrick@yahoo.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 56, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1434, 'JAN17/EMBA/014U', 'SSENYONJO Abudallah', 'M', '0704645061', 'ssenyonjo.abudallah@yahoo.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 56, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1435, 'JAN17/EMBA/024U', 'BYENKYA Dan', 'M', '0782 408 127', 'byenkyadan@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 56, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1436, 'MAY17/EMBA/001U', 'FRIDAY Diana', 'M', '0782450661', 'fridaydiana@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 56, '2017-09-26', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1437, 'JAN17/MBA/001U', 'ATWINE Jarvis', 'M', '0781452230', 'jarvismu@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 16, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1438, 'JAN17/MBA/002U', 'ODUNY Festus', 'M', '0772 524 338', 'odunyfestus@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 16, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1439, 'JAN17/MBA/003U', 'ARINAITWE Desmond', 'M', '0782380362', 'destiger92@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 16, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1440, 'JAN17/MBA/004X', 'BAIME David Fugoyo Clement', 'F', '0773051097', 'fugoyopoint@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 16, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1441, 'JAN17/MBA/005U', 'SSEWAVA Robert', 'M', '0782980585', 'robert.ssewava@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 16, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1442, 'JAN17/MBA/006U', 'LUYIMA John', 'M', '0704008821', 'mikhasi@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 16, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1443, 'JAN17/MBA/007U', 'SANYA Gilbert', 'M', '+266 578 881 86', 'gilsanya363@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 16, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1444, 'JAN17/MBA/008U', 'EIRU Darlington', 'M', '0777321605', 'eirudarling@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 16, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1445, 'JAN17/MBA/009X', 'KIDEN Betty', 'M', '+211954822303', 'kidbetty3@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 16, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1446, 'JAN17/MBA/010U', 'NYESIGE Kenneth', 'M', '+211952000212, +256774011114', 'kensigeken@yahoo.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 16, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1447, 'JAN17/MBA/011U', 'MUTAKWANA John Hillary', 'M', '0706626445', 'mchills1@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 16, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1448, 'JAN17/MBA/012X', 'PASQUALE Ongwen Alexander Oyet', 'M', '+211912722638, +211955191181', 'ongwenoyet@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 16, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1449, 'JAN17/MBA/013U', 'MAGEZI David Mike', 'M', '0783247157', 'dma.magezi@npa.ug', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 16, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1450, 'JAN17/MBA/014U', 'ASABA Teopista', 'F', '0703527007', 'teopistateo69@gmail.com, tasaba@bou.or.ug', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 16, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1451, 'JAN17/MBA/015U', 'BANGI Diana Zerida', 'F', '0705825125,0773518720', 'bangidiana2016@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 16, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1452, 'JAN17/MBA/016X', 'AHMEDSADIK Yusuf Mohamed', 'M', '0791076902', 'saadaqcade@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 16, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1453, 'JAN17/MBA/017U', 'KAMPAIRE Evas', 'F', '0779416367/0702335307', 'ekyampaire@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 16, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1454, 'JAN17/MBA/018U', 'KIKOMEKO Daniel', 'M', '0752345482', 'mkikoks@yahoo.co.uk', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 16, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1455, 'JAN17/MBA/019U', 'SIMALI Fiona', 'F', '0752 447 146', 'simalifiona8@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 16, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1456, 'JAN17/MBA/015U', 'MBOIJANA Alex', 'M', '0772722137', 'almboijana@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 16, '2017-09-26', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1457, 'MAY17/MIS/001U', 'SUNDAY David', 'M', '0759 475 625/  ''0775 235 657', 'dsunday@care.org/david.Sunday@care.org', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 37, '2017-09-26', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1458, 'MAY17/MIS/002U', 'NAMUDDU Zainabu', 'F', '0704 540 569/ ''0773 578 415', 'zainabnamuddu1@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 37, '2017-09-26', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1459, 'MAY17/MIS/003U', 'SENGOBA Ayubu Nyanzi', 'M', '0772 090 550', 'asengoba@judicature.go.ug/asengoba@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 37, '2017-09-26', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1460, 'JAN17/MIS/001U', 'RUTWARA Geofrey Gastervas', 'M', '0702282864/''0778053476', 'gastervasrg@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 37, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1461, 'JAN17/MIS/002U', 'ASIIMWE Albert', 'M', '0778682433', 'aalbert.al@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 37, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1462, 'JAN17/MIS/003U', 'KALUNGI John', 'M', '0778692563', 'jbkalungi2012@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 37, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1463, 'JAN17/MIS/004U', 'KUTEESA Catherine', 'M', '0779343756', 'kuteesac@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 37, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1464, 'JAN17/MIS/005U', 'GOOBI Michael', 'M', '0777050395', 'michaelgoobi@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 37, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1465, 'JAN17/MIS/006U', 'TAREMWA Steven', 'M', '0704627127', 'stevtare@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 37, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1466, 'JAN17/MIS/007U', 'SEBABI Kizza Semion', 'M', '0751033980', 'skizza@pepsi-cola.co.ug', NULL, '0f3b938ad48c017929fd05059808d9173d576ad6', 2, 37, '2017-09-26', 10, 15, 0, '2017-11-08 09:42:32', NULL, NULL, NULL),
(1467, 'JAN17/MIS/008U', 'MBOIJANA Alan', 'M', '0752403348', 'mboijana@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 37, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1468, 'JAN17/MIS/009U', 'KANGAVE Brendah', 'F', '0758201532', 'brendah.kangave@utamu.ac.ug', NULL, 'f6aae384a37d62d3fc340a9601fc627ff27a1f12', 2, 37, '2017-09-26', 10, 15, 0, '2017-11-14 17:27:18', NULL, NULL, NULL),
(1469, 'JAN17/MIS/010U', 'NAKANJAKO Christine', 'F', '0779 129 206', 'chnakanjako@gmail.com ', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 37, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1470, 'JAN17/MIT/001X', 'IGE Abiodun Lawrence', 'M', '+2347032325795', 'abbey1on14u@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 36, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1471, 'JAN17/MIT/002U', 'KAYANGWE Arinaitwe Godwin', 'M', '0777912029', 'kayangwe.godwin@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 36, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1472, 'JAN17/MIT/003U', 'MUHOZA Beebwa Gloria', 'F', '0782228701', 'muhozagb@yahoo.co.uk', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 36, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1473, 'JAN17/MIT/004U', 'ODWORI Cosma', 'M', '0788240238', 'odworicosma@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 36, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1474, 'JAN17/MME/001U', 'TIRWOMWE Benjamin Besigye', 'M', '0703073131', 'benjamintirwomwe@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1475, 'JAN17/MME/002X', 'MUHAMMAD Bala Sunusi', 'M', '+2348032835132/2348064416706', 'muhdgbs@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1476, 'JAN17/MME/003U', 'TUHANAMAGYEZI Elly', 'M', '0775186314', 'tuhana2008@yahoo.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1477, 'JAN17/MME/004X', 'HAKIZIMANA Desire', 'M', '0705236956', 'desirehakizimana22@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1478, 'JAN17/MME/005X', 'HAKIZIMANA Etienne', 'M', '+250788305634', 'umushumba@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1479, 'JAN17/MME/006U', 'OMODING Robert', 'M', '0788181910', 'omrobe22@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1480, 'JAN17/MME/007X', 'ASARE Paul Kojo', 'M', '+233208763565', 'asarepaul@yahoo.com,paul.asare@fdaghana.gov.g', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1481, 'JAN17/MME/008X', 'BAARTJIES Precious Khosi', 'M', '+26876082014', 'kbmavimbela@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1482, 'JAN17/MME/009X', 'LUBANG Francis Oliver', 'M', '+211(0)955652829', 'francislubang@yahoo.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1483, 'JAN17/MME/010X', 'TOWONGO Godrey Joyce', 'M', '+211955297078', 'towongo.g@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1484, 'JAN17/MME/011X', 'ALONGE Olusola Akintayo', 'M', '+2348039153719', 'everlonge@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1485, 'JAN17/MME/012X', 'MARAVANYIKA Tamuka', 'M', NULL, 'tamumarava@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1486, 'JAN17/MME/013X', 'TAWANDA Dende', 'M', '+263773435218', 'dendetawa@yahoo.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1487, 'JAN17/MME/014U', 'NABUNWA Mwamin', 'F', '0771421432', 'nmwamin17@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1488, 'JAN17/MME/015U', 'ODWEE Ambrose', 'M', '0776405614,0754797472', 'ambroseodwee45@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1489, 'JAN17/MME/016X', 'MWAIJANDE Francis Aron', 'M', '+255752626252+255717763926', 'mwaijandef@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1490, 'JAN17/MME/017U', 'TWINOKUSHABE Caroline', 'F', '0705129402/0789577730', 'twinocaroline@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1491, 'JAN17/MME/018U', 'LUKYAMUZI Solomon', 'M', '0777414547, 0706434381', 'solomonlukyamuzi@yahoo.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1492, 'JAN17/MME/019U', 'DENGA Yosia', 'M', '0774176933, 0712862060', 'yosiadenga@yahoo.co.uk', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1493, 'JAN17/MME/020U', 'OLINGA Simon Peter', 'M', '0751590075', 'peter.olinga@ymail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1494, 'JAN17/MME/021U', 'ATEGYEKA Raymond', 'M', '0774616630,0704616630', 'almonds8383@gmail.com, ategyekaray@yahoo.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1495, 'JAN17/MME/022X', 'MAYAM Meyanga Hortense Mireille', 'F', '+00237678551624', 'mireille.atangana@giz.de, mireillemayam.atang', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1496, 'JAN17/MME/026U', 'OMWONY Emmanuel', 'M', '0784528526', 'eomwonyez@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1497, 'JAN17/MME/028U', 'WANYAMA Ronald', 'M', '0780326560', 'Ronaldwanyama@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1498, 'JAN17/MME/029X', 'JESSY Mbock Nghongho Eben', 'M', '+237 677 241 434', 'jessy_eus@yahoo.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1499, 'JAN17/MME/030U', 'NAMUKASA Noeline Kibira', 'F', '0773035831', 'kasanela@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1500, 'JAN17/MME/031U', 'MUGASIRA Reagan', 'M', '0779785783', 'reagan.mugasira@utamu.ac.ug', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1501, 'JAN17/MME/033U', 'DHEYONGERA Geoffrey', 'M', '772658354', 'geoffreydheyo@yahoo.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1502, 'JAN17/MME/034U', 'KAMANYIRE Moses', 'M', '0772877243/0701877243', 'moseskamanyire12@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1503, 'JAN17/MME/035U', 'AKIROR Jacqueline', 'F', '0772 578 986/''0717 500 649', 'jakiror@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1504, 'JAN17/MME/036U', 'MUTARA Daniel', 'M', '0755021072', 'dmutara@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1505, 'JAN17/MME/038U', 'ALIGANYIRA Mourice', 'M', '0785499614', 'maliganyira@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1506, 'JAN17/MME/039U', 'NAGUDI Lilian', 'F', '0706515417,07759', 'lilian1nagudi@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1507, 'JAN17/MME/040U', 'OGWAPIT Moses Patrick', 'M', '0771623992,0701614406', 'mozep725@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1508, 'JAN17/MME/041U', 'AMABE Benard', 'M', '0703 819 630', 'benamabe66@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1509, 'JAN17/MME/043X', 'SAKARIYE Harbi Ahmed', 'M', '0792 645 252', 'sakariyeharbi@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1510, 'JAN17/MME/044U', 'BUSINGYE Doreen', 'F', '0701716524,0752716524', 'dmuheru@yahoo.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1511, 'JAN17/MME/045U', 'ADONGOT Vicky', 'F', '0788 514 447', 'vickyadongot@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1512, 'MAY17/COMP/001U', 'NANYOMBI Aluphar', 'F', '0702 843 973', 'awalukagga@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 31, '2017-09-26', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1513, 'MAY17/COMP/002T', 'MWAPASHUA H. Fujo', 'M', '+255 654 017 515', 'fujoprof@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 31, '2017-09-26', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1514, 'MAY17/COMP/003U', 'TEBANDEKE Jerry', 'M', '0782 894 220', 'tbndkjerry@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 31, '2017-09-26', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1515, 'MAY17/COMP/004U', 'MWANJE  Derrick', 'M', '0706 390 379/ ''0771 631 088                  ', 'deroclasic@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 31, '2017-09-26', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1516, 'MAY17/COMP/005U', 'TUSIIME B. William', 'M', '0785 116 664', 'tubawillis@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 31, '2017-09-26', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1517, 'MAY17/COMP/006U', 'WANDERA Nehole Peter', 'M', '0702 224 491', 'wandpetson@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 31, '2017-09-26', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1518, 'MAY17/COMP/007U', 'MUHUMUZA Solomon', 'M', '0782 443 341', 'mhmzsolomon@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 31, '2017-09-26', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1519, 'MAY17/COMP/008U', 'NASSANGA Jalia', 'F', '0703908952', 'jaliamuhammad@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 31, '2017-09-26', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1520, 'MAY17/COMP/009U', 'EMURON Jerry Joseph', 'M', '0782 088 570', 'emuronj@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 31, '2017-09-26', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1521, 'MAY17/COMP/010X', 'ABDULLAHI Aminu Adamu', 'M', '+234 706 822 8602/ ''0758 419 339 ', 'maigemu64@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 31, '2017-09-26', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1522, 'MAY17/COMP/011X', 'MUHAMMAD Muhammad Suleiman', 'M', '+234 816 868 6024', 'muhddkd@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 31, '2017-09-26', 10, 5, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1523, 'JAN17/MPAM/001U', 'MILLA James Duku', 'M', '0712135415/+211955927362', 'jamesmilla1983@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 59, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1524, 'JAN17/MPAM/002X', 'HUSSEIN Suleiman Ali', 'M', '+002522-634007710', 'Husseinsuleimana@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 59, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1525, 'JAN17/MPAM/003X', 'ALTTAYEB Omer Ahmed Abd-Alla', 'M', NULL, 'attayeb.omer@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 59, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1526, 'JAN17/MPAM/004U', 'ALOBO Gloria', 'F', '0772822079', 'lamwakagloria@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 59, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1527, 'JAN17/MPAM/005U', 'AHMEDSADIK Yusuf Mohamed', 'M', '0791076902', 'saadaqcade@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 59, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1528, 'JAN17/MPAM/006X', 'ABDURRAHMAN Ali Mohamud', 'M', '0794 593 606', 'abdurrahmanafrah@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 59, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1529, 'JAN17/COMP/001U', 'BAMUTA Eseza', 'M', '0774463350, 0701704740', 'gastervasrg@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 31, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1530, 'JAN17/COMP/002U', 'TURYAMUSIIMA Dismas', 'M', '0771643270, 0705490068', 'tudismas@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 31, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1531, 'JAN17/COMP/003X', 'LUKMAN Abubakar', 'M', '+2348133336647', 'lka00719@yahoo.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 31, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1532, 'JAN17/COMP/004U', 'NANYOMBI Aluphar', 'F', '0702843973', 'awalukagga@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 31, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1533, 'JAN17/COMP/005U', 'ASIIMWE Joshua', 'M', '0752870616', 'jasiimwe160@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 31, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1534, 'JAN17/COMP/006U', 'TUMWESIGYE Davis', 'M', '0714340239', 'davis_tumwesigye@yahoo.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 31, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1535, 'JAN17/COMP/007U', 'ANDIMA Moses', 'M', '0772120213', 'mosesandima@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 31, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1536, 'JAN17/COMP/008U', 'KIREMERWA Racheal', 'F', '0782359676', 'joystream@hotmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 31, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1537, 'JAN17/COMP/009U', 'Mading Roben Maluk', 'M', '0778191668', 'madinglou12@gmail.com, madingloi12@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 31, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1538, 'JAN17/COMP/010U', 'TWINAMASIKO Edecias', 'M', '0774016656, 0703666112', 'tadecias@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 31, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1539, 'JAN17/COMP/011X', 'UMAR A. Jalo', 'M', '0759197998', 'umaraja1037@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 31, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1540, 'JAN17/COMP/012X', 'VALIDE Mughanda Hyacinthe', 'M', '0775830681', 'el.cintho@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 31, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1541, 'JAN17/COMP/013X', 'KADAR Mohamed Abdulle', 'M', '0791552626', 'engineerkadar@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 31, '2017-09-26', 10, 15, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1542, 'MAY15/EMBA/0477U', 'MUGALA Lillian', 'F', NULL, 'lorettahli@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 56, '2017-09-26', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1543, 'MAY15/EMBA/0507U', 'NAZZIMULI Christine', 'F', NULL, 'xstina19@yahoo.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 56, '2017-09-26', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1544, 'MAY15/EMBA/0508U', 'NTALE Timothy', 'M', NULL, 'tntale@ug.nationmedia.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 56, '2017-09-26', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1545, 'MAY15/EMBA/0489U', 'KASIGALA Hassan Juma', 'M', NULL, 'kasigala.hassan@yahoo.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 56, '2017-09-26', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1546, 'MAY15/EMBA/0519U', 'SENKUNGU Richard', 'M', NULL, 'rsenkungu@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 56, '2017-09-26', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1547, 'MAY15/EMBA/0524U', 'KIMAITE Noah', 'M', NULL, 'nkimaite@ug.kcbbankgroup.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 56, '2017-09-26', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1548, 'MAY15/EMBA/0529X', 'STANS Mabur Mathiang Malual', 'M', NULL, 'mabursons@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 56, '2017-09-26', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1549, 'JAN15/EMBA/0494U', 'MUSINGUZI Christopher', 'M', NULL, 'tata.chris@ymail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 56, '2017-09-26', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1550, 'MAY15/EMBA/0523U', 'AHUMUZA Prize', 'F', NULL, 'pahumuzo@yahoo.ca/pahumu20@yahoo.co', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 56, '2017-09-26', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1551, 'MAY15/EMBA/0506U', 'GINYI Emmanuel', 'M', NULL, 'emmanuel.ginyi@utamu.ac.ug', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 56, '2017-09-26', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1552, 'MAY15/EMBA/0547U', 'KUSASIRA Molline', 'F', NULL, 'mb.kusasira27@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 56, '2017-09-26', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1553, 'MAY15/EMBA/0516U', 'ALHAJI SALIHU ABDULRASHEED ', 'M', NULL, 'elrasheed192@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 56, '2017-09-26', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1554, 'MAY15/EMBA/0521U', 'KIWA Francis', 'M', NULL, 'arckiwa@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 56, '2017-09-26', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1555, 'MAY15/EMBA/0522U', 'MANGENI Hillary Wanyam', 'M', NULL, 'hmageni@dfcugroup.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 56, '2017-09-26', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1556, 'MAY15/EMBA/0526U', 'OJOK Julius', 'M', NULL, 'juliusojok@yahoo.co.uk', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 56, '2017-09-26', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1557, 'MAY15/EMBA/0531U', 'GULOBA Anthony', 'M', NULL, 'antonioguloba@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 56, '2017-09-26', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1558, 'MAY15/EMBA/0546U', 'MUSOKE Joseph Martin', 'M', NULL, 'joseph.musoke@koolcangaroo.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 56, '2017-09-26', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1559, 'MAY15/EMBA/0467U', 'HAFASHA Hadija', 'F', NULL, 'hafasha.hadija@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 56, '2017-09-26', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1560, 'MAY15/EMBA/0512U', 'KERWEGI Anthony', 'M', NULL, 'kerwegi53@yahoo.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 56, '2017-09-26', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1561, 'MAY15/EMBA/0505U', 'AKANKWASA Robert', 'M', NULL, 'rwaberto@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 56, '2017-09-26', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1562, 'MAY15/EMBA/0515U', 'SSEKITOOLEKO Muyingo Andrew', 'M', NULL, 'andrew.sekitoleko@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 56, '2017-09-26', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1563, 'MAY15/EMBA/0518U', 'AMULLA Anewa Osman', 'M', NULL, 'osman.amulla@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 56, '2017-09-26', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1564, 'MAY15/EMBA/0520U', 'OPUCH Chris', 'M', NULL, 'chrisopuch@yahoo.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 56, '2017-09-26', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1565, 'MAY15/EMBA/0525U', 'KIBWOTA Joseph', 'M', NULL, 'kibwotajoe@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 56, '2017-09-26', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1566, 'JAN15/EMBA/0504U', 'MUYAMBI Gilbert', 'M', NULL, 'muyambi@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 56, '2017-09-26', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1567, 'MAY15/EMBA/0535U', 'OPWONYA Sam Obwona', 'M', NULL, 'sam.opwonya@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 56, '2017-09-26', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1568, 'MAY15/EMBA/0536U', 'KOMUHENDO Kachope Sylvia', 'M', NULL, 'skomuhendo@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 56, '2017-09-26', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1569, 'MAY15/EMBA/0542X', 'YONIS Mahamud Esse', 'M', NULL, 'yoonis_o@hotmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 56, '2017-09-26', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1570, 'MAY15/EMBA/0545U', 'SSENDAGIRE Ivan', 'M', NULL, 'ssendagireivan@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 56, '2017-09-26', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1571, 'MAY15/EMBA/0510U', 'TUMUHIMBISE Jasper ', 'M', NULL, 'jaspertm@hotmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 56, '2017-09-26', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1572, 'MAY15/EMBA/0528U', 'PEKO Danstan Leslie', 'M', NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 56, '2017-09-26', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1573, 'MAY15/EMBA/0544U', 'WESONGA Pius', 'M', NULL, 'piuswesonga@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 56, '2017-09-26', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1574, 'MAY15/EMBA/0550U', 'NABIRYO Sophia', 'F', NULL, 'sophie_nabiryo@yahoo.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 56, '2017-09-26', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1575, 'MAY15/EMBA/0537U', 'AKUZE Richard', 'M', NULL, 'richard.akuze@unra.go.ug', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 56, '2017-09-26', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1576, 'MAY15/EMBA/0538U', ' TUMUTOIJERE Gabriel Edie', 'M', NULL, 'tumutoijere8@yahoo.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 56, '2017-09-26', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1577, 'MAY15/EMBA/0532U', 'NSHEMEREIRWE Patrick', 'M', NULL, 'patricknshemereirwe@yahoo.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 56, '2017-09-26', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1578, 'MAY15/EMBA/0530U', 'KATEREGGA Solomon', 'M', NULL, 'solkat@adrauganda.org', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 56, '2017-09-26', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1579, 'MAY15/EMBA/0509U', 'MUHUMUZA Peter Celestine', 'M', NULL, 'muhumuza2007@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 56, '2017-09-26', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1580, 'MAY15/EMBA/0527U', 'ARINANYE Ronah Tugume', 'M', NULL, 'ronatugume@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 56, '2017-09-26', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1581, 'MAY15/EMBA/0543U', 'NASOLO Jacob', 'M', NULL, 'jacobnasolo@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 56, '2017-09-26', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1582, 'MAY15/EMBA/0533U', 'OKIROR Pius Patricious', 'M', NULL, 'mmutalinga@yahoo.co.uk', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 56, '2017-09-26', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1583, 'MAY15/EMBA/0534U', 'MBUSA Mutalinga', 'M', NULL, 'pomcips@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 56, '2017-09-26', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1584, 'MAY15/EMBA/0540U', 'ODUBUKER Picho Epiphany', 'M', NULL, 'epipicho@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 56, '2017-09-26', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1585, 'MAY15/EMBA/0513U', 'OTEE Collin', 'M', NULL, 'otee@unhcr.org', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 56, '2017-09-26', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1586, 'MAY15/EMBA/0552U', 'NANYONJO Irene', 'F', NULL, 'nyonjoiryn@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 56, '2017-09-26', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1587, 'MAY15/EMBA/0483U', 'NYANZI Joseph Ssentamu', 'M', NULL, 'nyanjo89@gmail.com, ', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 56, '2017-09-26', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1588, 'MAY 15/MBA/0661U', 'BAMULEETE Patrick', 'M', NULL, 'patrickbamuleete@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 58, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1589, 'MAY 15/MBA/0662U', 'AKENA Okot Anthony', 'M', NULL, 'anthony.akena@housingfinance.co.ug', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 58, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1590, 'MAY 15/MBA/0663U', 'WANDERA Stephenie', 'F', NULL, 'stephenie.wandera@yahoo.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 58, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1591, 'MAY 15/MPAM/0761U', 'SENGENDO Hadijah Mukasa', 'F', NULL, 'hadijahmuk@yahoo.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 59, '2017-09-26', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1592, 'MAY 15/MPAM/0762U', 'ATUHUMUZA Gad', 'M', NULL, 'gatuhumuza85@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 59, '2017-09-26', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1593, 'MAY 15/MPAM/0763U', 'MUTZAKHI Christine Otim', 'F', NULL, 'karlamut@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 59, '2017-09-26', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1594, 'MAY 15/MPAM/0764U', 'NAKYEYUNE Maime Felicia', 'F', NULL, 'felly_gere@yahoo.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 59, '2017-09-26', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1595, 'MAY 15/MPAM/0765U', 'EMARU Julius', 'M', NULL, 'Jemaru72@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 59, '2017-09-26', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1596, 'MAY 15/MPAM/0766U', 'MUGOBYA Barbra Jovianne', 'F', NULL, 'joviannewakida@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 59, '2017-09-26', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1597, 'MAY 15/MPAM/0767U', 'FAUZAT MARRIAM WANGADYA', 'F', NULL, 'mwangadya@yahoo.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 59, '2017-09-26', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1598, 'MAY15/PM&E/0380U', 'OBINA Godfrey Peter Ariya', 'M', NULL, 'obinagod@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1599, 'MAY15/PM&E/0381U', 'TAMALE Bernadette', 'M', NULL, 'laila28ug@yahoo.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1600, 'MAY15/PM&E/0383U', 'BARUNGI Phiona', 'F', NULL, 'barungi@unhcr.org', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1601, 'MAY15/PM&E/0384U', 'BIRUNGI Julius', 'M', NULL, 'juliusbirungi@eachq.org', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1602, 'MAY15/PM&E/0385U', 'ARIYO Charles', 'M', NULL, 'cariyo@ucu.ac.ug', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1603, 'MAY15/PM&E/0387U', 'OLIMA George Vuzi.', 'M', NULL, 'olima2007@hotmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1604, 'MAY15/PM&E/0368U', 'WANYAMA Ronald', 'M', NULL, 'wanyamaronnie@yahoo.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1605, 'MAY15/PM&E/0388U', 'AHABWE Clare Mary', 'F', NULL, 'ahabwec@yahoo.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1606, 'MAY15/PM&E/0389U', 'KOBUSINGYE Stella', 'F', NULL, 'skobusingye@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1607, 'MAY15/PM&E/0390U', 'SSENDAGIRE Steven', 'M', NULL, 'stevenssendagire@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1608, 'MAY15/PM&E/0391U', 'MUDHUMBA Charles', 'M', NULL, 'cmudhumba@yahoo.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1609, 'MAY15/PM&E/0392U', 'EITU Isaiah', 'M', NULL, 'eitu2004@yahoo.co.uk', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1610, 'MAY15/PM&E/0395U', 'BAKAHIRWA Mwesigwa Philip', 'M', NULL, 'philip.bakahirwa@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1611, 'MAY15/PM&E/0396U', 'KASEDHA Hellen', 'F', NULL, 'hnalumenya@yahoo.co.uk', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1612, 'MAY15/PM&E/0397U', 'TUKAHEEBWA Grace', 'F', NULL, 'gukahebwa@yahoo.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1613, 'MAY15/PM&E/0399U', 'ALI Mohmedain Mohmed Ahmed', 'M', NULL, 'evaluationprocesses@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1614, 'MAY15/PM&E/0412U', 'MUHUMUZA Karugota Innocent', 'M', NULL, 'innocentmuhumuza@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1615, 'MAY15/PM&E/0413U', 'KASULE Abdul', 'M', NULL, 'abukasule@yahoo.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1616, 'MAY15/PM&E/0414U', 'KASULE Joseylee Surmey', 'M', NULL, 'joseylee2007@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1617, 'MAY15/PM&E/0410U', 'OGAL Ronald', 'M', NULL, 'ogalronald@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1618, 'MAY15/PM&E/0415U', 'CHEBET Andre Noah', 'M', NULL, 'cnoahhug@yahoo.co.uk', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1619, 'MAY15/PM&E/0419U', 'NKWASIBWE Deus', 'M', NULL, 'nkdeu@yahoo.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1620, 'MAY15/PM&E/0420U', 'SENGWISA Rogers', 'M', NULL, 'rkisa48@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1621, 'MAY15/PM&E/0422U', 'AUWALU Musa', 'M', NULL, 'auwalumu2@yahoo.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1622, 'MAY15/PM&E/0401U', 'GAMBA Perry', 'M', NULL, 'parmu02@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1623, 'MAY15/PM&E/0402U', 'ANDAMA Christine Peace', 'F', NULL, 'pkrina7812@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1624, 'MAY15/PM&E/0403U', 'NGAKA Willy', 'M', NULL, 'wngaka@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1625, 'MAY15/PM&E/0405U', 'TWEHEYO Asaph', 'M', NULL, 'arukundo@utamu.ac.ug', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1626, 'MAY15/PM&E/0407U', 'BWOGI Abby', 'M', NULL, 'bwogia@yahoo.co.uk', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1627, 'MAY15/PM&E/0408U', 'TUMUSIIME Lydia', 'F', NULL, 'tumusiimelee@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1628, 'MAY15/PM&E/0409U', 'NAMUSISI Mary Josephine', 'F', NULL, 'jnamusisi@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1629, 'MAY15/PM&E/0411U', 'RWAMWITANI Gilbert Sunday', 'M', NULL, 'gilbertsunday@yahoo.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1630, 'MAY15/PM&E/0398U', 'APAJO Josephine', 'F', NULL, 'apajojosephine@yahoo.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1631, 'MAY15/PM&E/0400U', 'WAMBELE Natala Richard', 'M', NULL, 'wambeler@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1632, 'MAY15/PM&E/0386U', 'KYOMUHENDO Jacqueline', 'F', NULL, 'jacque.kyomuhendo@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1633, 'MAY15/PM&E/0394U', 'MUKAMA Emmanuel', 'M', NULL, 'emukama@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1634, 'MAY15/PM&E/0416U', 'OJAN Egits Tommy', 'M', NULL, 'ojanegits@yahoo.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1635, 'MAY15/PM&E/0417U', 'MULINDWA Augustine', 'F', NULL, 'mulindwagstn30@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1636, 'MAY15/PM&E/0418U', 'TUMWEBAZE Florah', 'F', NULL, 'fptumwebaze@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1637, 'MAY15/PM&E/0421U', 'KIWUJJA Victor', 'M', NULL, 'victorkiwujja@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1638, 'MAY15/PM&E/0423U', 'BANYENZAKI Mayie', 'F', NULL, 'mayiebanyenzaki@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1639, 'MAY15/PM&E/0424U', 'ATUHAIRE Obed  Bwesigye', 'M', NULL, 'kagbed@yahoo.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL);
INSERT INTO `student` (`student_id`, `registration_number`, `name`, `gender`, `contact`, `email`, `photo`, `password`, `universities_university_id`, `courses_course_id`, `_when_added`, `_who_added`, `intake_intake_id`, `status`, `logged_in`, `t_created_on`, `t_updated_on`, `nationality`) VALUES
(1640, 'JAN15/PM&E/0374U', 'ASSIMWE Katesigwa Abias', 'M', NULL, 'abias.asiimwe@ugandaphs.org', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1641, 'JAN15/PM&E/0371U', 'ASIIMWE Jacob Kameraho', 'M', NULL, 'jkameraho@yahoo.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1642, 'MAY15/PM&E/0361U', 'EJIBUA Sam Anguzu', 'M', NULL, 'ejibua@yahoo.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1643, 'MAY15/PM&E/0425U', 'OKELLO John William', 'M', NULL, 'williamokello1986@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1644, 'MAY15/COMP/0561U', 'NAMUKASA Mariam', 'F', NULL, 'joa2222us@yahoo.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 31, '2017-09-26', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1645, 'MAY15/COMP/0574U', 'WATMON Benjamin', 'M', NULL, 'benji64n@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 31, '2017-09-26', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1646, 'MAY15/COMP/0582U', 'MWEBENBEZI Peterson', 'M', NULL, 'petersonjod@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 31, '2017-09-26', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1647, 'MAY15/COMP/0583U', 'BUKOLI Herbertson', 'M', NULL, 'bbherbertson@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 31, '2017-09-26', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1648, 'MAY15/COMP/0587U', 'BUSINGE Richard', 'M', NULL, 'businge2009@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 31, '2017-09-26', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1649, 'MAY15/COMP/0591U', 'ONZIMA Francis', 'M', NULL, 'onzifrank@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 31, '2017-09-26', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1650, 'MAY15/COMP/0593U', 'NIWAMANYA Julius', 'M', NULL, 'julniwamanya@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 31, '2017-09-26', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1651, 'MAY15/COMP/0594U', 'TWIKIRIZE Medard', 'M', NULL, 'medsnr@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 31, '2017-09-26', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1652, 'MAY15/COMP/0579U', 'MUHANGUZI Nimrod', 'M', NULL, 'nmuhanguzi@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 31, '2017-09-26', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1653, 'MAY15/COMP/0595U', 'BUGONZI Nasta', 'M', NULL, 'nasta_bugonzi@yahoo.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 31, '2017-09-26', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1654, 'MAY15/COMP/0600U', 'NALUKWAGO Fadhiila', 'F', NULL, 'mmm.fadh@yahoo.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 31, '2017-09-26', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1655, 'MAY15/COMP/0601X', 'MOHAMED Ahmed Ibraahim', 'M', NULL, 'xamaada_ahmed@hotmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 31, '2017-09-26', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1656, 'MAY15/COMP/0602U', 'OLEMA Vincent', 'M', NULL, 'vincent.olema.o@ieee.org', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 31, '2017-09-26', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1657, 'MAY15/COMP/0603U', 'KATO Charles', 'M', NULL, 'katocharles@yahoo.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 31, '2017-09-26', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1658, 'MAY15/COMP/0604U', 'BATARINGAYA Patience Mary', 'F', NULL, 'basil.bata@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 31, '2017-09-26', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1659, 'MAY15/COMP/0605U', 'MUJUNI Bareba Arnold', 'M', NULL, 'bareba2000@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 31, '2017-09-26', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1660, 'MAY15/COMP/0611U', 'ANKWASA Bernadine C', 'M', NULL, 'ankwaberna@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 31, '2017-09-26', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1661, 'MAY15/COMP/0608U', 'MATOVU Muhamad', 'M', NULL, 'mmatovu6@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 31, '2017-09-26', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1662, 'MAY15/COMP/0609U', 'SAMORA Michael', 'M', NULL, 'mutungi89@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 31, '2017-09-26', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1663, 'MAY15/COMP/0613U', 'BYARUHANGA Denis Bagubwa', 'M', NULL, 'byaruhangadb@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 31, '2017-09-26', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1664, 'MAY15/COMP/0614U', 'OLINGA Eric Rene', 'M', NULL, 'olinga.eric@utamu.ac.ug', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 31, '2017-09-26', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1665, 'MAY15/COMP/0615U', 'TUMWINE Aggrey', 'M', NULL, 'tumwineaggrey@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 31, '2017-09-26', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1666, 'MAY15/COMP/0616U', 'ERONGOT Gilbert', 'M', NULL, 'gerongot@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 31, '2017-09-26', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1667, 'MAY15/COMP/0619U', 'ODOCH Douglas Chrispus', 'M', NULL, 'douglasod87@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 31, '2017-09-26', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1668, 'MAY15/COMP/0617U', 'DAHIRU Tamimuddari', 'M', NULL, 'tdahiru06@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 31, '2017-09-26', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1669, 'SEP15/M&E/0393X', 'KENNETH Elisa Lumaya Baraba', NULL, NULL, 'elisalumaya@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1670, 'SEP15/M&E/0406X', 'IYAMUDUHAYE Alice', NULL, NULL, 'aliceiya77@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1671, 'SEP15/M&E/0404U', 'TAREMWA Johnson', NULL, NULL, 'tarejoh@yahoo.co.uk', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1672, 'SEP15/PM&E/0382U', 'LODUNGOKOL Simon Peter', NULL, NULL, 'lodungokols@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1673, 'SEP15/M&E/0385U', 'ARIYO Charles', NULL, NULL, 'cariyo@ucu.ac.ug', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1674, 'SEP15/M&E/0426U', 'BASAASIRA Angella', NULL, NULL, 'angellassali@hotmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1675, 'SEP15/M&E/0427U', 'KATONGOLE George William', NULL, NULL, 'katozgw@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1676, 'SEP15/M&E/0428U', 'ELUK Kevin Deans', NULL, NULL, 'kevindeans@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1677, 'SEP15/M&E/0429U', 'ARIKO Alfred', NULL, NULL, 'alfredricos@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1678, 'SEP15/M&E/0430U', 'GUMA Abrahums Masson', NULL, NULL, 'gumaabraham@yahoo.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1679, 'SEP15/M&E/0431X', 'CHIER Akueny Anyithier', NULL, NULL, 'chierakueny@yahoo.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1680, 'SEP15/M&E/0433U', 'KEMIGISHA Christine', NULL, NULL, 'Ckemigisha@dfcugroup.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1681, 'SEP15/M&E/0434U', 'ASEGA Pam Charles Aggrey', NULL, NULL, 'charlesaggrey@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1682, 'SEP15/MME/0435U', 'NAMULI Susan Lilian', NULL, NULL, 'susan_kayima@yahoo.co.uk', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1683, 'SEP15/MME/0436U', 'OBONYO Peter', NULL, NULL, 'obonypeter@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1684, 'SEP15/MME/0437U', 'AKITE Brenda', NULL, NULL, 'brendak.otiks@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1685, 'SEP15/MME/0438U', 'ASIIMWE Milton', NULL, NULL, 'asiimwemilton1965@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1686, 'SEP15/MME/0439U', 'EPEL Anthony Raymond', NULL, NULL, 'epelanthonyraymond@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1687, 'SEP15/MME/0440U', 'KABUYE James', NULL, NULL, 'kabuyeja@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1688, 'SEP15/MME/0441U', 'WAALABYEKI Saturo', NULL, NULL, 'saturowl@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1689, 'SEP15/MME/0442U', 'ODONG Denish', NULL, NULL, 'odongdenish@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1690, 'SEP15/MME/0443U', 'WANI Stephen', NULL, NULL, 'wanisteve@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1691, 'SEP15/MME/0444U', 'BBOSA Edwin Moses', NULL, NULL, 'ebbosa@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1692, 'SEP15/MME/0445U', 'SSENOGA James Alex', NULL, NULL, 'ssenogajames@yahoo.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1693, 'SEP15/MME/0446U', 'ALOWO Winfred', NULL, NULL, 'walowo@hotmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1694, 'SEP15/MME/0447U', 'NAMPIJJA Sylivia', NULL, NULL, 'kaksliv@yahoo.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1695, 'SEP15/MME/0448U', 'ATUKUNDA Diana', NULL, NULL, 'dianaAtukunda@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1696, 'SEP15/MME/0450U', 'OBOTH Ronald', NULL, NULL, 'objotham@yahoo.co.uk', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1697, 'SEP15/MME/0451U', 'MUGERWA Moses', NULL, NULL, 'mugerwamosesmaurice2@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1698, 'SEP15/MME/0452U', 'BALITTA Christopher', NULL, NULL, 'cristo.balitta@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1699, 'SEP15/MME/0453U', 'KIRACHO-Jawange Joseph Gilbert', NULL, NULL, 'jogikiracho@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1700, 'SEP15/MME/0415U', 'CHEBET Andrew Noah', NULL, NULL, 'cnoahug@yahoo.co.uk', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1701, 'SEP15/MME/0454U', 'ABONG Kataike Christine', NULL, NULL, 'christine.abong@lgte.go.ug', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1702, 'SEP15/MME/0455U', 'SSERUGGA Joseph Ntairo', NULL, NULL, 'jsserugga@yahoo.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1703, 'SEP15/MME/0456U', 'RWOTHOMIYO Edwin', NULL, NULL, 'rwothomiyoedwin@yahoo.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1704, 'SEP15/MME/1366U', 'KISAKA Enos John', NULL, NULL, 'jkisaka@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1705, 'SEP15/MME/1367U', 'SSENTONGO Simon', NULL, NULL, 'snatts08@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1706, 'SEP15/MME/1368U', 'NALUKOOLA Ndawula Christopher', NULL, NULL, 'chrisducs@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1707, 'SEP15/MME/1369U', 'EMEJEIT Andrew Nelly', NULL, NULL, 'andrewemejeit@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1708, 'SEP15/MME/1371U', 'NAMUTALE Nathan', NULL, NULL, 'Nathannamutale4@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1709, 'SEP15/MME/1372U', 'MBALAZI Samuel', NULL, NULL, 'samuel.mbalazi@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1710, 'SEP15/MME/1373U', 'AWILLI Fiona', NULL, NULL, 'awi4hiona@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1711, 'SEP15/MME/1376U', 'KYOME Benon', NULL, NULL, 'kyomebenon@yahoo.co.uk', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1712, 'SEP15/MME/1378U', 'OLAL Sandra Wendy', NULL, NULL, 'wendyfocussedgirl@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1713, 'SEP15/MME/1379U', 'AKOPE Richard', NULL, NULL, 'akoperichard@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1714, 'SEP15/MME/1380U', 'RWABUNOORI Betty', NULL, NULL, 'kirabotiti@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1715, 'SEP15/MME/1381X', 'ESEZOBOR Eidenehi Eddy', NULL, NULL, 'eddyesezobor@yahoo.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1716, 'SEP15/MME/1383U', 'MUGISA Eria Kumaraki', NULL, NULL, 'mugisakumaraki@yahoo.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1717, 'SEP15/MME/1386U', 'MUSIIMENTA Busirimo Boaz', NULL, NULL, 'musiboazi@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1718, 'SEP15/MME/1387U', 'AMUTOJO Juliet Lorna', NULL, NULL, 'lj.aalcca@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1719, 'SEP15/MME/1388U', 'ATWIJUKIRE Doris', NULL, NULL, 'doratwijukire@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1720, 'SEP15/MME/1390U', 'IGGA Charles', NULL, NULL, 'charlesigga@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1721, 'SEP15/MME/1391X', 'BUTERA Augustin', NULL, NULL, 'butegos@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1722, 'SEP15/MME/1393X', 'NSENGIYUMVA Celestin', NULL, NULL, 'celestin2257@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1723, 'SEP15/MME/1394U', 'EKWANG Allan Denis', NULL, NULL, 'aekwang20@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1724, 'SEP15/MME/1395U', 'OKAMA Gilbert', NULL, NULL, 'gilbertg712@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1725, 'SEP15/MME/1396U', 'MUWANIKA Abdul Mpolampola', NULL, NULL, 'abdulmuwanika@hotmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1726, 'SEP15/MME/1397U', 'NYASUNA Innocent', NULL, NULL, 'innoxah@yahoo.co.uk', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1727, 'SEP15/MME/1398U', 'MUGANDA Isaac', NULL, NULL, 'mugandaisaac@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1728, 'SEP15/MME/1401U', 'KALEMA Solomon Wasajja', NULL, NULL, 'skalema34@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1729, 'SEP15/MME/1402U', 'NALUBEGA Teddy', NULL, NULL, 'nalteddy@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1730, 'SEP15/MME/1403U', 'AKOL Naume', NULL, NULL, 'naumeakol@yahoo.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1731, 'SEP15/MME/1404X', 'ISAH Mohammed Isah', NULL, NULL, 'isahmisah093@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1732, 'SEP15/MME/1405U', 'WAMALWA Richard Martin', NULL, NULL, 'wamalwa2m@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1733, 'SEP15/MME/0432U', 'NASAMBU Juliet', NULL, NULL, 'jbiagami@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1734, 'SEP15/MME/0391U', 'MUDHUMBA Charles', NULL, NULL, 'cmudhumba@yahoo.com ', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1735, 'SEP15/MME/1374U', 'OLEJA Anthony Enyogu', NULL, NULL, 'oleja84@yahoo.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1736, 'SEP15/MME/1377U', 'ANYIDI Amuli Norbert', NULL, NULL, 'anyidi07@yahoo.co.uk', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1737, 'SEP15/MME/1382X', 'WASIKE Wilberforce Walubengo', NULL, NULL, 'cbsmkenya@yahoo.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1738, 'SEP15/MME/1389U', 'ONAMA Victor', NULL, NULL, 'onamvick@yahoo.co.uk', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1739, 'SEP15/MME/1406U', 'KAKINDA Emmanuel', NULL, NULL, 'exodusamjarm@yahoo.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1740, 'SEP15/MME/0449U', 'OGENRWOTH Alex', NULL, NULL, 'alexogenrwoth98@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1741, 'SEP15/MME/0412U', 'MUHUMUZA Karugota Innocent', NULL, NULL, 'innocentmuhumuza@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1742, 'SEP15/MME/0418U', 'TUMWEBAZE Florah', NULL, NULL, 'fptumwebaze@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1743, 'SEP15/MME/0457U', 'KAMULEGEYA Patrick', NULL, NULL, 'pkamulegeya@yahoo.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1744, 'SEP15/MME/1375U', 'BASAZA Margaret Mbona', NULL, NULL, 'mbonamargie@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1745, 'SEP15/MME/1385U', 'KEMBABAZI Sarah', NULL, NULL, 'kembabazisarah2012@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1746, 'SEP15/MME/1392U', 'TWESIGE Brian', NULL, NULL, 'twesigeb@yahoo.co.uk', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1747, 'SEP15/MME/1399U', 'MUKAMA Emmanuel', NULL, NULL, 'emukama@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1748, 'SEP15/MME/1400U', 'NAKAYIMA Loretta Tezie', NULL, NULL, 'loretta.tezie@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1749, 'SEP15/PM&E/0417U', 'MULINDWA Augustine', NULL, NULL, 'mulindwagstn30@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 55, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1750, 'SEP15/EMBA/0539U', 'ATUGONZA Proscovia', NULL, NULL, 'atuprossy@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 56, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1751, 'SEP15/EMBA/0541U', 'CHIWERA Grant', NULL, NULL, 'grantchiwera@yahoo.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 56, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1752, 'SEP15/EMBA/0551U', 'BYAMUGISHA Noah Mugisha', NULL, NULL, 'nbyamugisha@ura.go.ug', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 56, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1753, 'SEP15/EMBA/0458U', 'BYABASAIJA Abdallah', NULL, NULL, 'abbasaija@yahoo.co.uk', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 56, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1754, 'SEP15/EMBA/0511U', 'ARIYO Aventino', NULL, NULL, 'ariyoaventino@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 56, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1755, 'SEP15/EMBA/0503U', 'SSEGUJJA Betty', NULL, NULL, 'bseguja@yahoo.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 56, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1756, 'SEP15/EMBA/0478U', 'OKELLO Francis Kolo', NULL, NULL, 'francisokello6@yahoo.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 56, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1757, 'SEP15/EMBA/0550U', 'NABIRYO Sophia', NULL, NULL, 'sophie_nabiryo@yahoo.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 56, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1758, 'SEP15/EMBA/0553U', 'KYARIKUNDA Winnie', NULL, NULL, 'wkyarikunda@yahoo.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 56, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1759, 'SEP15/EMBA/0549U', 'OJOK Francis', NULL, NULL, 'ojokf75@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 56, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1760, 'SEP15/EMBA/0555U', 'NAKAZIBA Grace', NULL, NULL, 'gnakaziba@nssfug.org', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 56, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1761, 'SEP15/EMBA/0556U', 'AKELLO Susan Lorna', NULL, NULL, 'akalorna@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 56, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1762, 'SEP15/EMBA/0557U', 'MAGADA Joshua', NULL, NULL, 'magadajoshua@yahoo.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 56, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1763, 'SEP15/EMBA/1164U', 'WERE Emmanuel', NULL, NULL, 'blessemma_ug@yahoo.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 56, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1764, 'SEP15/EMBA/1165U', 'KABENGERA Sam', NULL, NULL, 'kabesam@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 56, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1765, 'SEP15/EMBA/1166X', 'KAMBUGA Hamza Rashid', NULL, NULL, 'hkambuga@yahoo.co.uk', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 56, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1766, 'SEP15/EMBA/1168U', 'NYANDERA Racheal Richent', NULL, NULL, 'rachealnya@yahoo.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 56, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1767, 'SEP15/EMBA/1169U', 'KANABAHITA Nicholas', NULL, NULL, 'kanabahita@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 56, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1768, 'SEP15/EMBA/1172U', 'LOKIRU Joseph Emmy', NULL, NULL, 'elokiru@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 56, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1769, 'SEP15/EMBA/1171U', 'AVAYO Godfrey', NULL, NULL, 'avayogodfrey@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 56, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1770, 'SEP15/EMBA/0529U', 'MABUYA Hussein Limlim', NULL, NULL, 'hussylimlim@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 56, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1771, 'SEP15/EMBA/1173U', 'MAZAPKWE Grace', NULL, NULL, 'gmazapkwe@kcca.go.ug', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 56, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1772, 'SEP15/EMBA/1174U', 'NATUJUNA Emmanuel Maani', NULL, NULL, 'enatujuna@kcca.go.ug', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 56, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1773, 'SEP15/EMBA/0521U', 'KIWA Francis', NULL, NULL, 'arckiwa@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 56, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1774, 'SEP15/EMBA/1178U', 'OUMA Ronald', NULL, NULL, 'ronald.ouma@utamu.ac.ug', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 56, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1775, 'SEP15/EMBA/1179U', 'ATUKUNDA Patience', NULL, NULL, 'p.atukunda@yahoo.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 56, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1776, 'SEP15/EMBA/1181U', 'MUGISHA Norman', NULL, NULL, 'mugishanorman7@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 56, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1777, 'SEP15/EMBA/1182U', 'NANYUNJA Lillian Muleke', NULL, NULL, 'nanyunjamuleke@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 56, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1778, 'SEP15/EMBA/1185U', 'ATWIINE Andrew Besigye', NULL, NULL, 'besigyeandrew12@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 56, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1779, 'SEP15/EMBA/1186U', 'BIRUNGI Hilda', NULL, NULL, 'hilda.birungi@yahoo.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 56, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1780, 'SEP15/EMBA/1187U', 'TWINOBUSINGYE Francis', NULL, NULL, 'fbusingye@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 56, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1781, 'SEP15/EMBA/0517U', 'AKETCH Lucy', NULL, NULL, 'akechlucy@yahoo.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 56, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1782, 'SEP15/EMBA/0548U', 'ODONGKARA Dickens', NULL, NULL, 'dickensodongkara@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 56, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1783, 'SEP15/EMBA/0558U', 'NIWAMANYA Justus', NULL, NULL, 'justus.niwamanya@yahoo.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 56, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1784, 'SEP15/EMBA/1167U', 'MUWONGE Alex Stephine', NULL, NULL, 'alexmuwonge@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 56, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1785, 'SEP15/EMBA/1170U', 'OCHOM Jonathan', NULL, NULL, 'jonathanochom@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 56, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1786, 'SEP15/EMBA/1175U', 'WANANGWE David', NULL, NULL, 'dwanangwe78@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 56, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1787, 'SEP15/EMBA/1176U', 'GGAYI Nicholas', NULL, NULL, 'ncarchxav@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 56, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1788, 'SEP15/EMBA/1177U', 'WINYI Festus', NULL, NULL, 'wfestus@yahoo.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 56, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1789, 'SEP15/EMBA/1180U', 'EIDU Denis', NULL, NULL, 'desnis.eidu@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 56, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1790, 'SEP15/EMBA/1183U', 'OLINGA John', NULL, NULL, 'johnolinga2@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 56, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1791, 'SEP15/EMBA/1184U', 'ODEKE Francis Paul', NULL, NULL, 'odekepaul@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 56, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1792, 'SEP15/EMBA/1188U', 'GAKWAYA Peace', NULL, NULL, 'gakwaya.peace@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 56, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1793, 'SEP15/EMBA/1189U', 'NYEKO Barbra', NULL, NULL, 'barbranyeko@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 56, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1794, 'SEP15/MBA/0660U', 'BAMULEETE Patrick', NULL, NULL, 'patrickbamuleete@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 58, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1795, 'SEP 15/MBA/0661U', 'AKENA Okot Anthony', NULL, NULL, 'anthony.akena@housingfinance.co.ug', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 58, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1796, 'SEP 15/MBA/0662U', 'WANDERA Stephenie', NULL, NULL, 'stephenie.wandera@yahoo.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 58, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1797, 'SEP15/MBA/0663U', 'TABALO Anthony', NULL, NULL, 'anthonytobalo@yahoo.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 58, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1798, 'SEP15/MBA/0665X', 'SABRI Suleiman Seif', NULL, NULL, 'ruksab@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 58, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1799, 'SEP15/MBA/0666X', 'AYIIK Deng Atem', NULL, NULL, 'ayiik.avram@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 58, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1800, 'SEP15/MBA/0667U', 'KOMAKECH James', NULL, NULL, 'jameskoma@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 58, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1801, 'SEP15/MBA/0668U', 'BONGOMIN Brian', NULL, NULL, 'belovedbrian@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 58, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1802, 'SEP15/MBA/0669U', 'AINOMUGISHA Evalyn', NULL, NULL, 'ainevalyn@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 58, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1803, 'SEP15/MBA/0670U', 'BYARUHANGA Robert', NULL, NULL, 'brobertwashington@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 58, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1804, 'SEP15/MBA/0671U', 'KALIBON Crispus', NULL, NULL, 'kaliboncrispus@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 58, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1805, 'SEP15/MBA/0672U', 'MASHEMERE Beatrice', NULL, NULL, 'mashemere.beatrice@student.utamu.ac.ug', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 58, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1806, 'SEP15/MBA/0673U', 'TURYAGUMA Edwin', NULL, NULL, 'edwin.turyaguma@yahoo.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 58, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1807, 'SEP15/MBA/0674U', 'ALUONZI Burani', NULL, NULL, 'aluonzi@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 58, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1808, 'SEP15/MBA/0675U', 'ETON Marus', NULL, NULL, 'eton.marus@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 58, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1809, 'SEP15/MBA/0676U', 'KASOZI Ibrahim', NULL, NULL, 'kasoziibra25@yahoo.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 58, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1810, 'SEP15/MBA/0677X', 'STANS Mabur Mathiang Malual', NULL, NULL, 'mabursons@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 58, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1811, 'SEP15/MBA/0679U', 'ALOKIT Ann Rachel', NULL, NULL, 'rachel.alokit@nwsc.co.ug', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 58, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1812, 'SEP15/MBA/0680U', 'KAAKYO Immaculate', NULL, NULL, 'ikaakyo@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 58, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1813, 'SEP15/MBA/0681X', 'UKWUEZE Henry Ebuka', NULL, NULL, 'henryebuka4ca@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 58, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1814, 'SEP15/MBA/0682U', 'KYOKUHAIRE Rukyalekere Thomas', NULL, NULL, 'tkyokuhaire@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 58, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1815, 'SEP15/MBA/0683U', 'BEYANGA Benjamin', NULL, NULL, 'bbeyanga@yahoo.co.uk', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 58, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1816, 'SEP15/MBA/0684U', 'MALINGA Charles', NULL, NULL, 'cmalinga1@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 58, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1817, 'SEP15/MBA/0685U', 'YASIR Abdallah Radwan', NULL, NULL, 'yasirr.radwan@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 58, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1818, 'SEP15/MBA/0686U', 'SONKO Benard', NULL, NULL, 'benardbaros@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 58, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1819, 'SEP15/MBA/0687U', 'KIZITO Nasiifu', NULL, NULL, 'nasiifukizito@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 58, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1820, 'SEP15/MBA/0688U', 'TWINOBUSINGYE Francis', NULL, NULL, 'fbusingye@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 58, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1821, 'SEP15/MBA/0678U', 'ARUHO Joab', NULL, NULL, 'joabaruho@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 58, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1822, 'SEP15/MBA/0664U', 'OCEN Simon Peter', NULL, NULL, 'spocen@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 58, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1823, 'SEP15/MPAM/0768U', 'LUTAKOME Ronald Isaac', NULL, NULL, 'ronaldlutakome@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 59, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1824, 'SEP15/MPAM/0769X', 'Simon K. Kuay', NULL, NULL, 'korkuek@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 59, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1825, 'SEP15/MPAM/0770X', 'Peter Yien Kuar', NULL, NULL, 'peteryien2014@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 59, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1826, 'SEP15/MPAM/0771X', 'ABDUL''AZIZ Hussaini', NULL, NULL, 'abdulhmaster@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 59, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1827, 'SEP15/MPAM/0772U', 'RUGOOGO RAWLINGS', NULL, NULL, 'Jkrawlings4@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 59, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1828, 'SEP15/MPAM/0773U', 'OYELA Pauline ', NULL, NULL, 'oyelapauline@yahoo.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 59, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1829, 'SEP15/MPAM/0774U', 'EMOJONG Amaitum Felix Grace', NULL, NULL, 'fexamai@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 59, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1830, 'SEP15/MPAM/0775U', 'ADIPO Florence', NULL, NULL, 'florence.adipo@uetcl.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 59, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1831, 'JAN2015/U/0236', 'ELUK Kevin Deans', 'M', NULL, 'kevindeans@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 43, '2017-09-26', 10, 1, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1832, 'JAN2015/U/0237', 'OGWOK Joshua', 'M', NULL, 'joshbge@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 43, '2017-09-26', 10, 1, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1833, 'JAN2015/U/0238', 'NDYAGUMA Nduhikire', 'M', NULL, 'nkndyaguma@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 43, '2017-09-26', 10, 1, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1834, 'JAN2015/U/0239', 'OUMA Ronald', 'M', NULL, 'oumastonny@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 43, '2017-09-26', 10, 1, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1835, 'JAN2015/U/0240', 'BASAZA Margaret Mbona ', 'F', NULL, 'mbonamargie@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 43, '2017-09-26', 10, 1, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1836, 'JAN2015/U/0242', 'OGENRWOTH Alex', 'M', NULL, 'alexogenrwoth98@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 43, '2017-09-26', 10, 1, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1837, 'JAN2015/U/0243', 'TABANI Gabriel', 'M', NULL, 'tabanigabriel@yahoo.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 43, '2017-09-26', 10, 1, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1838, 'JAN2015/U/0244', 'TWESIGE Brian', 'M', NULL, 'twesigeb@yahoo.co.uk', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 43, '2017-09-26', 10, 1, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1839, 'JAN2015/U/0245', 'MUHUMUZA Susan', 'M', NULL, 'muhumuzas@yahoo.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 43, '2017-09-26', 10, 1, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1840, 'JAN2015/U/0246', 'KYARIMPA Catherine', 'F', NULL, 'kchris2@yahoo.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 43, '2017-09-26', 10, 1, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1841, 'JAN2015/U/0248', 'NAMUKASA Lillian', 'F', NULL, 'namukasal@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 43, '2017-09-26', 10, 1, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1842, 'JAN2015/U/0249', 'KEMBABAZI Sarah', 'F', NULL, 'kembabazisarah2012@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 43, '2017-09-26', 10, 1, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1843, 'JAN2015/U/0250', 'OKWI Robert', 'M', NULL, 'robert.okwi@yahoo.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 43, '2017-09-26', 10, 1, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1844, 'JAN2015/U/0251', 'WASSWA Daniel', 'M', NULL, 'dnwasswa@yahoo.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 43, '2017-09-26', 10, 1, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1845, 'JAN2015/U/0162', 'AFOYOCHAN Esther', 'F', NULL, 'estherkr4@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 83, '2017-09-26', 10, 1, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1846, 'JAN2015/U/0163', 'OYELA Pauline', 'F', NULL, 'oyelapauline@yahoo.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 83, '2017-09-26', 10, 1, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1847, 'JAN2015/U/0164', 'NAMUSOKE Asia Sebidde', 'F', NULL, 'sebiddeasia@yahoo.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 83, '2017-09-26', 10, 1, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1848, 'JAN2015/U/0161', 'TAKALI JANE', 'M', NULL, 'janetakali@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 83, '2017-09-26', 10, 1, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1849, 'JAN2015/U/0306', 'ASABA Juliana', 'F', NULL, 'juliedard@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 77, '2017-09-26', 10, 1, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1850, 'JAN2015/U/0110', 'TUSHABE Bruce', 'M', NULL, 'brucetushabe@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 76, '2017-09-26', 10, 1, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1851, 'JAN2015/U/0111', 'NAKIRANDA L Shirley', 'F', NULL, 'kiyingishirley@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 76, '2017-09-26', 10, 1, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1852, 'JAN2015/U/0112', 'GGAYI Nicholas', 'M', NULL, 'ncarchxav@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 76, '2017-09-26', 10, 1, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1853, 'JAN2015/U/0113', 'OCHOM Jonathan', 'M', NULL, 'jonathanochom@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 76, '2017-09-26', 10, 1, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1854, 'JAN2015/U/0115', 'MUWONGE Alex Stephine', 'M', NULL, 'alexmuwonge@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 76, '2017-09-26', 10, 1, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1855, 'JAN2015/U/0117', 'KOMUKYEYA Vicky', 'F', NULL, 'komukyeyavique@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 76, '2017-09-26', 10, 1, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1856, 'JAN2015/U/0118', 'MUSINGUZI Micheal', 'M', NULL, 'amusinguzimicheal@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 76, '2017-09-26', 10, 1, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1857, 'JAN2015/U/0062', 'NAMUGENYI Glenda', 'F', NULL, 'mugabi.glenda@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 84, '2017-09-26', 10, 1, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1858, 'JAN2015/U/0063', 'KAREMIRE Robert', 'M', NULL, 'rob.karemire@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 84, '2017-09-26', 10, 1, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1859, 'JAN2015/U/0064', 'GAKWAYA Peace', 'F', NULL, 'gakwaya.peace@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 84, '2017-09-26', 10, 1, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1860, 'JAN2015/U/0065', 'KYAZZE John', 'M', NULL, 'john77kyazze@yahoo.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 84, '2017-09-26', 10, 1, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1861, 'JAN2015/U/0066', 'NYEKO Barbra', 'F', NULL, 'barbranyeko@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 84, '2017-09-26', 10, 1, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1862, 'JAN2015/U/0067', 'BUSINGE Julius', 'M', NULL, 'Jbselek@yahoo.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 84, '2017-09-26', 10, 1, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1863, 'JAN2015/U/0068', 'WAGABONO Steven', 'M', NULL, 'wagabono@yahoo.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 84, '2017-09-26', 10, 1, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1864, 'JAN2015/U/0070', 'NINSIIMA Kamara Fay', 'M', NULL, 'faykamara@yahoo.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 84, '2017-09-26', 10, 1, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1865, 'JAN2015/U/0071', 'WINYI Festus', 'M', NULL, 'wfestus@yahoo.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 84, '2017-09-26', 10, 1, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1866, 'JAN2015/U/0072', 'MUGURA Dan', 'M', NULL, 'dan.mugura@dansultlogistics.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 84, '2017-09-26', 10, 1, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1867, 'JAN2015/U/0073', 'BAGUMA Isaac', 'M', NULL, 'isaacbaguma@ymail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 84, '2017-09-26', 10, 1, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1868, 'SEP15/MIS/1265U', 'SENGOBA Ayubu Nyanzi', NULL, NULL, 'asengoba@judicature.go.ug', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 37, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1869, 'SEP15/MIS/1266U', 'NTEZA Deogratius', NULL, NULL, 'nteza.deogratius@utamu.ac.ug', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 37, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1870, 'SEP15/MIS/1267U', 'MPANGO Jonathan', NULL, NULL, 'jompango@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 37, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1871, 'SEP15/MIS/1268U', 'RUTWARA Geofrey Gastervas', NULL, NULL, 'gastervasrg@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 37, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1872, 'SEP15/MIS/1269U', 'MUTYABA Joseph', NULL, NULL, 'mutyabajoekk@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 37, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1873, 'SEP15/MIS/1270U', 'KAMURASI Christopher', NULL, NULL, 'kamurasic73@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 37, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1874, 'SEP15/MIS/1271U', 'MAHORO Sylivia  Jannet', NULL, NULL, 'msjte27@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 37, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1875, 'SEP15/MIS/1272U', 'ISABIRYE Ayub', NULL, NULL, 'ayubisabirye2012@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 37, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1876, 'SEP15/MIS/1273U', 'MUTEBI Paul', NULL, NULL, 'prince.paul.m@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 37, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1877, 'JAN16/EMBA/0554U', 'MILLA James Duku', NULL, NULL, 'jamesmilla1983@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 37, '2017-09-26', 10, 1, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1878, 'SEP15/MIT/1467U', 'YIKII Alfred', NULL, NULL, 'alyikii48@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 36, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1879, 'SEP2015/U/0077', 'ATUBAIT David', NULL, NULL, 'david.atubait@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 84, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1880, 'SEP2015/U/0078', 'ARUHO Joab', NULL, NULL, 'joabaruho@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 84, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL);
INSERT INTO `student` (`student_id`, `registration_number`, `name`, `gender`, `contact`, `email`, `photo`, `password`, `universities_university_id`, `courses_course_id`, `_when_added`, `_who_added`, `intake_intake_id`, `status`, `logged_in`, `t_created_on`, `t_updated_on`, `nationality`) VALUES
(1881, 'SEP2015/U/0247', 'KINUNDA Dismas Filbert', NULL, NULL, 'dismaskinunda@ymail.com,dismaskinunda@gmail.c', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 43, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1882, 'SEP2015/U/0250', 'OKWI Robert', NULL, NULL, 'robert.okwi@yahoo.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 43, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1883, 'SEP2015/U/0870', 'AYEBALE Dan', NULL, NULL, 'ayebale.dan@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 43, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1884, 'SEP2015/X/0864', 'NGUSHA Nelson Ayator', NULL, NULL, 'nnayator@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 43, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1885, 'SEP2015/U/0874', 'BALUKA Sheila', NULL, NULL, 'sheilabaluka@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 43, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1886, 'SEP2015/U/0875', 'SSERUNKUMA Edgar', NULL, NULL, 'serunks99@yahoo.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 43, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1887, 'SEP2015/U/0876', 'KIWANUKA Joseph Kakande', NULL, NULL, 'kiwakakande@yahoo.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 43, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1888, 'SEP2015/U/0877', 'MANAKE Constance Eunice', NULL, NULL, 'wandahc@gmail.com,wandahc@ymail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 43, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1889, 'SEP2015/U/0878', 'NABUKWASI Faith', NULL, NULL, 'kwasi.faith@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 43, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1890, 'SEP2015/U/0879', 'KABAHWEZA Hellen Mugarra', NULL, NULL, 'hellenmugarra@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 43, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1891, 'SEP2015/U/0880', 'OCAN J. Collbert', NULL, NULL, 'colbertocan@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 43, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1892, 'SEP2015/X/0864', 'NGUSHA Nelson Ayator', NULL, NULL, 'nnayator@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 43, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1893, 'SEP2015/U/0881', 'LUBWAMA Rita Nalugwa', NULL, NULL, 'ritalubwama@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 43, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1894, 'SEP2015/U/0882', 'DRAPARI Nelson', NULL, NULL, 'nkobeson@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 43, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1895, 'SEP2015/U/0883', 'KALEMA Solomon Wasajja', NULL, NULL, 'skalema34@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 43, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1896, 'SEP2015/U/0884', 'WAMON Joseph', NULL, NULL, 'wamonojoseph@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 43, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1897, 'SEP2015/U/0120', 'ELOLU Robert Mathias', NULL, NULL, 'rbtmathias@yahoo.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 76, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1898, 'SEP2015/U/0121', 'OLENG Morris', NULL, NULL, 'wotamuko@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 76, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1899, 'SEP2015/U/0129', 'MUGISA Julius', NULL, NULL, 'mugisajulius96@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 76, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1900, 'SEP2015/X/0130', 'GOIN Eniekedou Henry', NULL, NULL, 'chatwithhenry2003@yahoo.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 76, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1901, 'SEP2015/U/0118', 'NANTEZA Winnie', NULL, NULL, 'nantezaw24@yahoo.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 76, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1902, 'SEP2015/U/0131', 'OLAL Francis', NULL, NULL, 'afrankeu@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 76, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1903, 'SEP2015/U/0132', 'NAMAKULA Mariam', NULL, NULL, 'mmariam30@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 76, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1904, 'SEP2015/U/0133', 'KYOMUHENDO Belinda', NULL, NULL, 'kyomuhendobelinda@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 76, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1905, 'SEP2015/U/0005', 'MUSANA Henry', NULL, NULL, 'katebulehenry@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 28, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1906, 'SEP2015/U/0018', 'OKURUT Emmanuel', NULL, NULL, 'emmaokur@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 28, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1907, 'SEP2015/U/0019', 'OKWALINGA William', NULL, NULL, 'okwalingaw@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 28, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1908, 'SEP2015/U/0020', 'KWIRINGIRA Johnson', NULL, NULL, 'kwiringirajohnson@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 28, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1909, 'SEP2015/X/0169', 'ABDULSALAM Abdullahi Osman', NULL, NULL, 'salamsomi@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 83, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1910, 'SEP2015/U/0307', 'BIRUNGI Evelyne ', NULL, NULL, 'belyn5@yahoo.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 77, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1911, 'SEP2015/U/0308', 'NAMBASI Innocent Ronald', NULL, NULL, 'inambasi@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 77, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1912, 'SEP2015/X/0309', 'SHAFIE Abdirashid Ali', NULL, NULL, 'mshafici57@yahoo.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 77, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1913, 'SEP2015/U/0310', 'NAKIRUNDA Dorothy', NULL, NULL, 'lucdorothy@yahoo.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 77, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1914, 'SEP2015/U/0258', 'OBOTH Yonas', NULL, NULL, 'obothyonas@yahoo.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 75, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1915, 'SEP2015/U/0264', 'ATIM Getrude', NULL, NULL, 'atimgat@yahoo.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 75, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1916, 'SEP2015/U/0265', 'OKELLO John Bosco', NULL, NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 75, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1917, 'MAY2015/U/0266', 'KATUSABE Jalia', NULL, NULL, 'katujalia@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 75, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1918, 'SEP2015/U/0962', 'KASOZI Augustine', NULL, NULL, 'augustinekasozi@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 29, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1919, 'SEP2015/U/0963', 'KIIZA Joy', NULL, NULL, 'joymogan@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 29, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1920, 'SEP2015/U/0964', 'KYAKUWA Betty', NULL, NULL, 'bkyakuwa@yahoo.co.uk', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 29, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1921, 'MAY2015/U/0069', 'KAGUMIRE Katembeko Simon', NULL, NULL, 'kagumire2003@yahoo.om', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 84, '2017-09-26', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1922, 'MAY2015/U/0074', 'OKOT Jackline', NULL, NULL, 'djzarkie13@yahoo.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 84, '2017-09-26', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1923, 'MAY2015/U/0075', 'FRIDAY Alice', NULL, NULL, 'talyce01@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 84, '2017-09-26', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1924, 'MAY2015/U/0076', 'NASILA Victoria', NULL, NULL, 'victorianasila@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 84, '2017-09-26', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1925, 'MAY2015/U/0252', 'MUSINGUZI Micheal', NULL, NULL, 'amusinguzimicheal@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 43, '2017-09-26', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1926, 'MAY2015/U/0253', 'NAMUSANGA John', NULL, NULL, 'jnamusanga@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 43, '2017-09-26', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1927, 'MAY2015/U/0254', 'PUTAN Thomas', NULL, NULL, 'thomas.Putan@wfp.org', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 43, '2017-09-26', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1928, 'MAY2015/U/0861', 'KALULE Richard', NULL, NULL, 'rdkalule@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 43, '2017-09-26', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1929, 'MAY2015/U/0862', 'LUWAMBYA Asaad', NULL, NULL, 'luwambyaasaad221@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 43, '2017-09-26', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1930, 'MAY2015/U/0863', 'KITASALA Farida', NULL, NULL, 'kitasalafarida@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 43, '2017-09-26', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1931, 'MAY2015/X/0864', 'NGUSHA Nelson Ayator', NULL, NULL, 'nnayator@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 43, '2017-09-26', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1932, 'MAY2015/U/0865', 'NYAKAKE Catherine', NULL, NULL, NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 43, '2017-09-26', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1933, 'MAY2015/U/0868', 'KAHWA Joseph', NULL, NULL, 'joseph.kahwa@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 43, '2017-09-26', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1934, 'MAY2015/U/0869', 'WANYAMA David', NULL, NULL, 'davidwanyama062@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 43, '2017-09-26', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1935, 'MAY2015/U/0867', 'ALADO Lucy', NULL, NULL, 'aladolucy@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 43, '2017-09-26', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1936, 'MAY2015/U/0871', 'SONKO Benard', NULL, NULL, 'benardbaros@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 43, '2017-09-26', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1937, 'MAY2015/U/0872', 'NSAMBA David Wanjala', NULL, NULL, 'david.nsamba3@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 43, '2017-09-26', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1938, 'MAY2015/U/0116', 'ALIONI Gilbert', NULL, NULL, 'alleyrobinson@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 76, '2017-09-26', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1939, 'MAY2015/U/0114', 'TAKALI Sylivia', NULL, NULL, 'tsylivia2009@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 76, '2017-09-26', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1940, 'MAY2015/U/0106', 'TUKAHIIRWE Clare', NULL, NULL, 'clare.ila87@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 76, '2017-09-26', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1941, 'MAY2015/U/0118', 'NANTEZA Winnie', NULL, NULL, 'nantezaw24@yahoo.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 76, '2017-09-26', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1942, 'MAY2015/U/0119', 'OLUPOT Jethro', NULL, NULL, 'olupot.jethro@yahoo.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 76, '2017-09-26', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1943, 'MAY2015/U/0122', 'ISABIRYE Fredrick Daniel', NULL, NULL, 'isabiryefd@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 76, '2017-09-26', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1944, 'MAY2015/U/0123', 'TUGUMENAWE Emily', NULL, NULL, 'tugumeemily@yahoo.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 76, '2017-09-26', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1945, 'MAY2015/U/0124', 'EDEMA Gerald Edrima', NULL, NULL, 'edemagrld@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 76, '2017-09-26', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1946, 'MAY2015/U/0125', 'KAYOGO Patience', NULL, NULL, 'kayogo@yahoo.co.uk', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 76, '2017-09-26', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1947, 'MAY2015/U/0126', 'BATARINGAYA Robert', NULL, NULL, 'rkbats@yahoo.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 76, '2017-09-26', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1948, 'MAY2015/U/0127', 'BESIGYE Edmund Turinawe', NULL, NULL, 'e.besigye@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 76, '2017-09-26', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1949, 'MAY2015/U/0128', 'MUSINGUZI Micheal', NULL, NULL, 'amusinguzimicheal@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 76, '2017-09-26', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1950, 'MAY2015/U/0015', 'HWINDINGWI Stanley', NULL, NULL, 'stanleyhwindingwi@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 28, '2017-09-26', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1951, 'MAY2015/U/0016', 'AKURETE Clara', NULL, NULL, 'cajojo99@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 28, '2017-09-26', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1952, 'MAY2015/U/0017', 'NETEESE Dorothy', NULL, NULL, 'dneteese@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 28, '2017-09-26', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1953, 'MAY2015/U/0165', 'GUSINGA Victoria', NULL, NULL, 'vgusinga@yahoo.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 83, '2017-09-26', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1954, 'MAY2015/U/0166', 'ATIM Getrude', NULL, NULL, 'atimgat@yahoo.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 83, '2017-09-26', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1955, 'MAY2015/U/0167', 'KOMAKECH Robert Agwot', NULL, NULL, 'kagwot@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 83, '2017-09-26', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1956, 'MAY2015/U/0168', 'ESIAT Richard okurut', NULL, NULL, 'esiatrichard@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 83, '2017-09-26', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1957, 'MAY2015/U/0307', 'BIRUNGI Evelyne ', NULL, NULL, 'belyn5@yahoo.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 77, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1958, 'MAY2015/U/0258', 'OBOTH Yonas', NULL, NULL, 'obothyonas@yahoo.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 75, '2017-09-26', 10, 2, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1959, 'SEP2015/U/0962', 'KASOZI Augustine', NULL, NULL, 'augustinekasozi@gmail.com', NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 29, '2017-09-26', 10, 10, 0, '2017-10-10 11:51:32', NULL, NULL, NULL),
(1960, 'septu0011', 'JUDE ', 'm', NULL, 'judlub@gmail.com ', '1508330968195.jpg', '8cb2237d0679ca88db6464eac60da96345513964', 2, 1, '2017-10-06', 10, 1, 0, '2018-01-09 07:43:37', NULL, NULL, NULL),
(1961, 'sep16/mis/008u', 'Kyarisiima', 'F', NULL, NULL, NULL, 'dd5fef9c1c1da1394d6d34b248c51be2ad740840', 2, 37, '2017-10-21', 10, 12, 0, '2017-10-21 16:16:59', NULL, NULL, NULL),
(1962, 'sep16/mis/010u', 'Namataka', 'F', NULL, NULL, NULL, '52dcb2398855497161518c89d56620cf72a18b05', 2, 37, '2017-10-21', 10, 12, 0, '2017-10-21 17:41:05', NULL, NULL, NULL),
(1963, 'sep01/23/67', 'james Omala', NULL, '0712752737', 'james@yahoo.com', NULL, '', 0, 20, NULL, 20, 13, 0, '2017-12-01 07:13:34', NULL, NULL, NULL),
(1964, 'sep01/23/67', 'james Omala', NULL, '0712752737', 'james@yahoo.com', NULL, '', 0, 20, NULL, 20, 13, 0, '2017-12-01 07:14:01', NULL, NULL, NULL),
(1965, 'sep01/23/67', 'james Omala', NULL, '0712752737', 'james@yahoo.com', NULL, '', 0, 20, NULL, 20, 13, 0, '2017-12-01 08:05:01', NULL, NULL, NULL),
(1966, 'sep01/23/67', 'james Omala', NULL, '0712752737', 'james@yahoo.com', NULL, '', 0, 20, NULL, 20, 13, 0, '2017-12-01 08:05:29', NULL, NULL, NULL),
(1967, 'sep01/23/67', 'james Omala', NULL, '0712752737', 'james@yahoo.com', NULL, '', 0, 20, NULL, 20, 13, 0, '2017-12-01 08:06:07', NULL, NULL, NULL),
(1968, 'sep01/23/67', 'james Omala', NULL, '0712752737', 'james@yahoo.com', NULL, '', 0, 20, NULL, 20, 13, 0, '2017-12-01 08:07:49', NULL, NULL, NULL),
(1969, 'sep01/23/67', 'james Omala', NULL, '0712752737', 'james@yahoo.com', NULL, '', 0, 20, NULL, 20, 13, 0, '2017-12-01 08:16:57', NULL, NULL, NULL),
(1970, 'sep01/23/67', 'james Omala', NULL, '0712752737', 'james@yahoo.com', NULL, '', 0, 20, NULL, 20, 13, 0, '2017-12-01 08:17:00', NULL, NULL, NULL),
(1971, 'sep01/23/67', 'james Omala', NULL, '0712752737', 'james@yahoo.com', NULL, '', 0, 20, NULL, 20, 13, 0, '2017-12-01 08:17:38', NULL, NULL, NULL),
(1972, 'sep17/comp/035u', 'Namanya Abert', NULL, '0754938667', 'abertnamanyaaa@gmail.com', NULL, '', 0, 34, NULL, 20, 13, 0, '2017-12-01 08:28:44', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `student_payments`
--

CREATE TABLE `student_payments` (
  `payments_id` int(11) NOT NULL,
  `amount` double DEFAULT NULL,
  `recept_no` varchar(32) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  `study_year` int(11) DEFAULT NULL,
  `semester` int(11) DEFAULT NULL,
  `payment_date` date NOT NULL COMMENT 'payment date',
  `sent_date` timestamp NULL DEFAULT NULL COMMENT 'date of sending'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student_payments`
--

INSERT INTO `student_payments` (`payments_id`, `amount`, `recept_no`, `student_id`, `study_year`, `semester`, `payment_date`, `sent_date`) VALUES
(6, 450000, '#1307', 1960, 1, 1, '2017-09-19', '2017-12-18 12:24:08'),
(7, 300000, '#3864', 1960, 1, 1, '2017-09-19', '2017-12-18 12:27:54'),
(8, 300000, '#6586', 1960, 1, 2, '2017-09-19', '2017-12-18 12:29:26'),
(9, 1000000, '#2426', 1960, 1, 2, '2017-09-19', '2017-12-18 12:31:07'),
(10, 300000, '#2812', 1960, 2, 1, '2017-09-19', '2017-12-18 12:32:24'),
(11, 300000, '#1305', 1960, 2, 1, '2017-09-19', '2017-12-19 05:47:07'),
(12, 250000, '#3400', 1960, 1, 2, '2018-00-03', '2018-01-03 13:48:07'),
(18, 350000, '#4048', 1960, 2, 1, '2018-08-03', '2018-01-04 05:21:34'),
(19, 250000, '#678', 1960, 1, 1, '2018-00-03', '2018-01-04 05:29:26');

-- --------------------------------------------------------

--
-- Table structure for table `study_year`
--

CREATE TABLE `study_year` (
  `year_id` int(11) NOT NULL,
  `year` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `study_year`
--

INSERT INTO `study_year` (`year_id`, `year`) VALUES
(1, 'One'),
(2, 'Two'),
(3, 'three'),
(4, 'Four');

-- --------------------------------------------------------

--
-- Table structure for table `sub_menu`
--

CREATE TABLE `sub_menu` (
  `sub_menu_id` int(11) NOT NULL,
  `sub_menu_name` varchar(50) DEFAULT NULL,
  `sub_menu_link` varchar(100) DEFAULT NULL,
  `menu_id` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sub_menu`
--

INSERT INTO `sub_menu` (`sub_menu_id`, `sub_menu_name`, `sub_menu_link`, `menu_id`, `status`) VALUES
(4, 'Academic Years', 'years/yearcontroller/academicYears', 3, 1),
(5, 'Programs', 'courses/course_controller/courses', 11, 0),
(6, 'Students', 'students/students_controller/view_students', 4, 0),
(7, 'View Results', 'marks/marks_controller/view_marks', 5, 0),
(8, 'Categories', 'complaints/complaint_controller/categories', 6, 0),
(11, 'News', 'news/news_controller', 8, 0),
(12, 'Events', 'news/events_controller', 9, 0),
(13, 'Registered Students', 'registration/registrationcontroller', 10, 0),
(14, 'Intakes', 'years/yearcontroller/intakes', 3, 0),
(15, 'Upload Programs', 'courses/course_controller/add_course', 11, 0),
(16, 'upload Course Units', 'course_units/units_controller/add_courseUnits', 12, 1),
(17, 'View Course Units', 'course_units/units_controller/view_units', 12, 0),
(18, 'Upload Results', 'marks/marks_controller/upload_marks', 5, 0),
(19, 'Upload Students', 'students/students_controller/add_students', 4, 0),
(20, 'Assigned', 'course_units/units_controller/assigned_units', 12, 1),
(21, 'Assign', 'course_units/units_controller/assign_Units', 12, 0),
(22, 'Add menu', 'developer/developer', 13, 0),
(23, 'Developer Assign Menu', 'auth/assign_menus', 13, 0),
(24, 'Universities', 'admin/dashboard/universities', 14, 0),
(25, 'Assign menu', 'menu/menu_controller/assign_menus', 15, 0),
(26, 'User Groups', 'usermgt/users_controller/user_groups', 1, 0),
(27, 'Users', 'usermgt/users_controller/users', 1, 0),
(28, 'Inbox', 'complaints/complaint_controller/pending_complaints', 6, 0),
(29, 'Replied', 'complaints/complaint_controller/cleared', 6, 0),
(30, 'Unread Suggestions', 'suggestions/suggestion_controller', 17, 0),
(31, 'read Suggestions', 'suggestions/suggestion_controller/read_suggestions', 17, 0),
(33, 'Add Grading', 'grading/grading_controller/upload_grading', 19, 0),
(34, 'View Grading', 'grading/grading_controller/view_grading', 19, 0),
(35, 'Generate statements', 'marks/mini_statement/fetch_statement', 20, 0),
(36, 'Counselors', 'counsel/counsel_controller/counsellors', 18, 0),
(37, 'Chat Groups', 'chat/chat_controller/show_groups', 21, 0),
(38, 'News Categories', 'news/news_controller/categories', 8, 0),
(39, 'Departments', 'depts/dept_controller/depts', 22, 1),
(40, 'Activate students', 'payments/payments_controller/activated_students', 23, 1),
(42, 'Time Table', 'timetable/time_table', 24, 0),
(43, 'Schools', 'depts/dept_controller/schools', 22, 1),
(44, 'Admin Dashboard', 'admin/dashboard', 25, 0),
(45, 'Assign SubMenu', 'menu/menu_controller/assigned', 15, 0),
(46, 'Frees Structure', 'payments/payments_controller/tuition', 23, 0),
(47, 'Student payments', 'payments/payments_controller/student_paid', 23, 0),
(48, 'Complaints', 'payments/payments_controller/complaints', 23, 0),
(49, 'Fees Categories', 'payments/payments_controller/fees_categories', 23, 0),
(50, 'General Course Units', 'course_units/units_controller/course_units', 12, 0),
(51, 'Positions', 'usermgt/users_controller/positions', 1, 0),
(52, 'Add student', 'students/students_controller/addstudents', 4, 0),
(55, 'Add Program', 'courses/course_controller/singleCourse', 11, 0),
(56, 'Schools', 'schools/Schools_controller', 26, 0),
(57, 'Student Permits', 'payments/payments_controller/students_permits', 23, 0);

-- --------------------------------------------------------

--
-- Table structure for table `suggestion_box`
--

CREATE TABLE `suggestion_box` (
  `suggestion_box_id` int(11) NOT NULL,
  `suggestion` longtext,
  `student_student_id` int(11) DEFAULT NULL,
  `university_university_id` int(11) DEFAULT NULL,
  `sent_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `_status` int(11) NOT NULL DEFAULT '0' COMMENT 'determines read suggestions'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `suggestion_box`
--

INSERT INTO `suggestion_box` (`suggestion_box_id`, `suggestion`, `student_student_id`, `university_university_id`, `sent_time`, `_status`) VALUES
(3, 'What if we start holding competitions for innovations where the best team is awarded gifts. this would help in popularizing the university and also encouraging innovation in students. ', 1966, 2, '2017-12-21 11:03:58', 0),
(4, 'most of us have our own apps but they never get a chance of making it to the store, what if the university creates a program that will try to push good students products to the markets\r\n ', 1968, 2, '2017-12-21 11:03:58', 1),
(5, 'test suggestion', 1960, 2, '2018-01-03 11:32:05', 0);

-- --------------------------------------------------------

--
-- Table structure for table `suggestion_replies`
--

CREATE TABLE `suggestion_replies` (
  `suggestion_reply_id` int(11) NOT NULL,
  `suggestion_reply` longtext,
  `suggestion_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `_when_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `suggestion_replies`
--

INSERT INTO `suggestion_replies` (`suggestion_reply_id`, `suggestion_reply`, `suggestion_id`, `user_id`, `_when_added`) VALUES
(1, 'okay', 4, 20, '2017-12-21 11:15:37');

-- --------------------------------------------------------

--
-- Table structure for table `time_table`
--

CREATE TABLE `time_table` (
  `time_table_id` int(11) NOT NULL,
  `course_id` int(11) DEFAULT NULL,
  `study_year` int(11) DEFAULT NULL,
  `semester_id` int(11) DEFAULT NULL,
  `time_table` varchar(100) DEFAULT NULL,
  `university_id` int(11) DEFAULT NULL,
  `_when_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `time_table`
--

INSERT INTO `time_table` (`time_table_id`, `course_id`, `study_year`, `semester_id`, `time_table`, `university_id`, `_when_added`) VALUES
(1, 1, NULL, 2, 'intl_de_20170702_20171209.pdf', 2, '2017-10-10 09:33:48'),
(2, 77, 1, 1, 'intl_de_20170702_20171209.pdf', 2, '2017-10-08 12:41:15'),
(3, 1, 3, 1, 'UTAMU_Quality_Assurance.pdf', 2, '2017-10-10 09:33:53');

-- --------------------------------------------------------

--
-- Table structure for table `tokens`
--

CREATE TABLE `tokens` (
  `token_id` int(11) NOT NULL,
  `token` varchar(200) DEFAULT NULL,
  `student_student_id` int(11) DEFAULT NULL,
  `token_user` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tokens`
--

INSERT INTO `tokens` (`token_id`, `token`, `student_student_id`, `token_user`) VALUES
(1, 'dz_BJsCgL2o:APA91bGQebwaHvecIVCwj6xwPzTfWl2Qv05_1VnRi5MRqvupT_dkCUgaEKxyCfqydCc9vFo24LMaR4ATiBhpEV4PlmJYTPZUfvZrTHxnQw1edDfdZOc_oydebsLDtV02mhsNbUqSJ8ko', 1960, 0),
(2, '', 14, 0),
(3, 'dIPKLfg3nZc:APA91bH8aejRJ_3SbDvipS9MNga-AW1z4xwcGF1YPVHj_BVH8DPqHJTVv_90Q-N5tCj2o4H3GaQ0XVs3-nALYI4FC-jCEEKWIyeCqZ6HWOUIhdVMYxCk-X93xYe8kpr05waYKxnURHuV', 1961, 0),
(4, 'dIPKLfg3nZc:APA91bH8aejRJ_3SbDvipS9MNga-AW1z4xwcGF1YPVHj_BVH8DPqHJTVv_90Q-N5tCj2o4H3GaQ0XVs3-nALYI4FC-jCEEKWIyeCqZ6HWOUIhdVMYxCk-X93xYe8kpr05waYKxnURHuV', 1962, 0),
(5, 'dPM7kCdTkws:APA91bHK4aLr0G56UHW51GO_hjQHhs4bZrk5J-j_sm0a7NfkFZ_5b-vQ7zAhSNn_P4vpV0CgARPAMVUya1Mg8CPF_t2Xnx2PakA7cFVOlFHZn1HwDWGJjPtqtFSGSvExnmP7PWjOEYDd', 35, 0),
(6, 'f_ScJEdnx0c:APA91bH5jKFnF-6bHcClB8Bq2OdKME7tAFq33SIWFopUb8xxlwkq60IjHhE-LRY4VFJ-9W9ocSmVws8jN6yXL3IMOBdRLfkUcW3S_opHHtI7JxUmh-3h8EybZIhHaVV29u7XHkCPwd4V', 626, 0),
(7, 'eEuNCzTrQWM:APA91bFqLlqmVABtaJ--4H1MpiBvcuRZg76L71FzG_OV187HyjUCoeE2HpDfsx-oQ6GoYvZgmzzBkRtPJ1vYcsK5s6ClXhij54FOw7K7JC2iih1mEGGMXjeA-del-Gq4UXcm4WYpNFw6', 630, 0),
(8, 'c8eL-KJwK-0:APA91bFUv1ksM07orSye4wpj3DYi4p7rvrLd0TxVKr7BMaBsN7FekMGbM0R6cNimO75KfgWK0k2Zu8NPWmd-J2L0EpVs55CfVPvRpGA0RSXTo11C35KHfssJ0zbBjC9dsJHm-v0ZNub5', 75, 0),
(9, 'derh1e-ahOg:APA91bHj6qiN8yWBkVSXiDJbtnFOdkjCV4eshxsf0zQddwVKcuSY1LoJs-eOMeLs-XveVvQdmxezvVbiNRFWTInOgUXkG9XjzzF2N5eZRru_DFxtARf6qCSv_2E3EjE3xGM62utCUE0k', 1421, 0),
(10, 'cX3vNB5JfCM:APA91bFBtr6RL0oILNmZ5w0sQyqbEy8ZSDpEOLgDG4pJoI4RZuW0gqBxNBhbuIpriIdjAMfiChPrnpcm6uPi1_ozrBi2VMkz5Gxx-Le_mz7xa0lxDu-Db-fKvH_8p9hky8lZYm1qTGD1', 1468, 0),
(11, 'cRb2cJ1cXZc:APA91bFs4DiUrqBLuGZdeIL1sVtdfvic4vUeFhaimG-U0F3zjFHWCoKw_xXpbooLTNpDmmUX_hFa_jIx4gtsGh07q0ddUY6gnQe2h4fqe3aURhFb53RYQQp1KqxcEYrYOyu7qL9TwFL6', 1466, 0),
(12, 'cEct6Eo-rl4:APA91bH5LnTqLBltLlLH8MNrKZmJ-08Ua39IE9jmdDQErYJehy2WHnJl70uFsrTtpTYGloqdbupBtIZBzzpy6MA6QJKWMfpQXpCUR48IqrRPtQJ0drnolrFcR7lP2ueoNHyr6ZXmrvqM', 582, 0),
(13, '', 20, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tuition_complaints`
--

CREATE TABLE `tuition_complaints` (
  `complaint_id` int(11) NOT NULL,
  `complaint` text,
  `student_id` int(11) DEFAULT NULL,
  `year_id` int(11) DEFAULT NULL,
  `semester_id` int(11) DEFAULT NULL,
  `_when_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` int(11) DEFAULT '0',
  `university_id` int(11) DEFAULT NULL,
  `reply_status` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tuition_complaints`
--

INSERT INTO `tuition_complaints` (`complaint_id`, `complaint`, `student_id`, `year_id`, `semester_id`, `_when_added`, `status`, `university_id`, `reply_status`) VALUES
(6, 'Good morning sir,\nNow sir l have a problem with my school fees ', 1960, 1, 2, '2017-12-01 08:56:42', 1, 2, 0),
(7, 'testing 12', 1960, 1, 2, '2018-01-03 11:40:46', 0, 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `universities`
--

CREATE TABLE `universities` (
  `university_id` int(11) NOT NULL,
  `university` varchar(100) DEFAULT NULL,
  `short_name` varchar(100) NOT NULL,
  `banner` varchar(100) NOT NULL,
  `when_added` datetime NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `_status` int(11) NOT NULL DEFAULT '0' COMMENT '0 active,1 inactive',
  `_student_registration` int(11) NOT NULL DEFAULT '0' COMMENT '0 allow open registration,1 registration closed'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `universities`
--

INSERT INTO `universities` (`university_id`, `university`, `short_name`, `banner`, `when_added`, `status`, `_status`, `_student_registration`) VALUES
(2, 'Uganda Technology And Management University', 'UTAMU', 'utamulogo.png', '0000-00-00 00:00:00', 0, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `contact` varchar(50) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `_status` int(11) NOT NULL DEFAULT '0',
  `last_login` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `photo` varchar(300) DEFAULT NULL,
  `university_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `name`, `email`, `contact`, `password`, `_status`, `last_login`, `photo`, `university_id`) VALUES
(4, 'Tumusiime', 'bob@gmail.com', '078773434', '7c4a8d09ca3762af61e59520943dc26494f8941b', 0, '2018-01-09 07:29:19', NULL, 2),
(10, 'Mary', 'mnantumbwe@utamu.ac.ug', '0752660245', 'd033e22ae348aeb5660fc2140aec35850c4da997', 0, '2018-01-09 07:29:27', NULL, 2),
(11, 'Ruth ', 'rnandyose@utamu.ac.ug', '', '7c4a8d09ca3762af61e59520943dc26494f8941b', 0, '2018-01-09 07:29:32', NULL, 2),
(12, 'Linda', 'lalum@utamu.ac.ug', '', '7c4a8d09ca3762af61e59520943dc26494f8941b', 0, '2018-01-09 07:29:35', NULL, 2),
(13, 'Grace', 'gnukamunde@utamu.ac.ug', '', '7c4a8d09ca3762af61e59520943dc26494f8941b', 0, '2018-01-09 07:29:39', NULL, 2),
(14, 'Jude', 'judlub@gmail.com', '0774600884', '7c4a8d09ca3762af61e59520943dc26494f8941b', 0, '2018-01-09 07:29:43', '1508255989863.jpg', 2),
(15, 'Drake ', 'd.p.mirembe@gmail.com ', '0776844343', '7c4a8d09ca3762af61e59520943dc26494f8941b', 0, '2018-01-09 07:29:46', NULL, 2),
(16, 'Ronah ', 'ronatugume@gmail.com', '', '7c4a8d09ca3762af61e59520943dc26494f8941b', 0, '2018-01-09 07:29:51', NULL, 2),
(17, 'DORIS ', 'dorisquest.titans@gmail.com', '', '7c4a8d09ca3762af61e59520943dc26494f8941b', 0, '2018-01-09 07:29:54', NULL, 2),
(18, 'John ', 'jngubiri@gmail.com', '', '7c4a8d09ca3762af61e59520943dc26494f8941b', 0, '2018-01-09 07:29:57', NULL, 2),
(19, 'Mersian ', 'ngtulya@gmail.com', '', '7c4a8d09ca3762af61e59520943dc26494f8941b', 0, '2018-01-09 07:30:00', NULL, 2),
(20, 'Jude', 'jlubega@utamu.ac.ug', '', 'd033e22ae348aeb5660fc2140aec35850c4da997', 0, '2018-01-10 05:06:39', NULL, 2),
(21, 'Baker ', 'ssekittobaker@gmail.com', '', '7c4a8d09ca3762af61e59520943dc26494f8941b', 0, '2018-01-09 07:30:06', NULL, 2),
(22, 'Harriet', 'hrayebare@utamu.ac.ug', '', '7c4a8d09ca3762af61e59520943dc26494f8941b', 0, '2018-01-09 07:30:14', NULL, 2);

-- --------------------------------------------------------

--
-- Table structure for table `user_groups`
--

CREATE TABLE `user_groups` (
  `group_id` int(11) NOT NULL,
  `group_name` varchar(100) DEFAULT NULL,
  `university_id` int(11) DEFAULT NULL,
  `_status` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_groups`
--

INSERT INTO `user_groups` (`group_id`, `group_name`, `university_id`, `_status`) VALUES
(4, 'Super User', NULL, 0),
(32, 'UTAMU Admin', 2, 0),
(33, 'Departmental', 2, 0),
(34, 'Senior Registrar', 2, 0),
(35, 'Counselor', 2, 0),
(36, 'Accountant', 2, 0),
(37, 'Academic Registrar', 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `user_position`
--

CREATE TABLE `user_position` (
  `id` int(11) NOT NULL,
  `pos_name` int(11) DEFAULT NULL,
  `user` int(11) DEFAULT NULL,
  `_when_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `_who_added` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_position`
--

INSERT INTO `user_position` (`id`, `pos_name`, `user`, `_when_added`, `_who_added`) VALUES
(1, 2, 10, '2017-12-18 10:48:29', NULL),
(2, 1, 20, '2018-01-09 11:56:21', NULL),
(3, 1, 12, '2017-12-18 10:49:19', NULL),
(6, 3, 13, '2017-12-18 12:19:40', 10),
(20, 4, 17, '2018-01-08 11:37:39', NULL),
(21, 4, 18, '2018-01-08 11:38:10', NULL),
(22, 4, 19, '2018-01-08 11:38:35', NULL),
(23, 4, 20, '2018-01-08 11:38:57', NULL),
(24, 4, 21, '2018-01-08 11:56:04', 20),
(25, 4, 22, '2018-01-08 13:05:14', 20);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `academic_years`
--
ALTER TABLE `academic_years`
  ADD PRIMARY KEY (`academic_year_id`),
  ADD KEY `university_university_id` (`university_university_id`),
  ADD KEY `_who_added` (`_who_added`);

--
-- Indexes for table `active_students`
--
ALTER TABLE `active_students`
  ADD PRIMARY KEY (`active_id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `university_id` (`university_id`);

--
-- Indexes for table `assigned_units`
--
ALTER TABLE `assigned_units`
  ADD PRIMARY KEY (`id`),
  ADD KEY `semester_semester_id` (`semeter`),
  ADD KEY `course_course_id` (`course`),
  ADD KEY `course_unit_unit_id` (`course_unit`);

--
-- Indexes for table `balances_temp`
--
ALTER TABLE `balances_temp`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student` (`student`);

--
-- Indexes for table `campus_calendar`
--
ALTER TABLE `campus_calendar`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `campus_events`
--
ALTER TABLE `campus_events`
  ADD PRIMARY KEY (`event_id`),
  ADD KEY `university_university_id` (`university_university_id`);

--
-- Indexes for table `chatgroups`
--
ALTER TABLE `chatgroups`
  ADD PRIMARY KEY (`group_id`);

--
-- Indexes for table `chatroom`
--
ALTER TABLE `chatroom`
  ADD PRIMARY KEY (`room_id`);

--
-- Indexes for table `chat_memebers`
--
ALTER TABLE `chat_memebers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `member_id` (`member_id`),
  ADD KEY `chatroom_id` (`chatroom_id`);

--
-- Indexes for table `chat_mgs`
--
ALTER TABLE `chat_mgs`
  ADD PRIMARY KEY (`message_id`),
  ADD KEY `users_id` (`users_id`),
  ADD KEY `room_id` (`room_id`);

--
-- Indexes for table `chat_users`
--
ALTER TABLE `chat_users`
  ADD PRIMARY KEY (`chat_user_id`);

--
-- Indexes for table `complaints_details`
--
ALTER TABLE `complaints_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `year` (`year_id`),
  ADD KEY `semester` (`semester_id`),
  ADD KEY `course_unit_id` (`course_unit_id`),
  ADD KEY `complaint` (`complaint_id`);

--
-- Indexes for table `complaint_receiver`
--
ALTER TABLE `complaint_receiver`
  ADD PRIMARY KEY (`id`),
  ADD KEY `complaint` (`complaint`),
  ADD KEY `target` (`target`);

--
-- Indexes for table `complaint_reply`
--
ALTER TABLE `complaint_reply`
  ADD PRIMARY KEY (`complaint_reply_id`),
  ADD KEY `fk_complaints_replies_complaints1_idx` (`complaints_complaint_id`);

--
-- Indexes for table `complaint_response`
--
ALTER TABLE `complaint_response`
  ADD PRIMARY KEY (`id`),
  ADD KEY `complaint` (`complaint`),
  ADD KEY `_who_added` (`_who_added`);

--
-- Indexes for table `complaint_types`
--
ALTER TABLE `complaint_types`
  ADD PRIMARY KEY (`complaint_types_id`),
  ADD KEY `university_university_id` (`university_university_id`);

--
-- Indexes for table `counsellors`
--
ALTER TABLE `counsellors`
  ADD PRIMARY KEY (`counsellor_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `university_id` (`university_id`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`course_id`),
  ADD UNIQUE KEY `course_code` (`course_code`),
  ADD KEY `universities_university_id` (`universities_university_id`),
  ADD KEY `courses_ibfk_2` (`_who_added`),
  ADD KEY `dept_id` (`dept_id`);

--
-- Indexes for table `course_units`
--
ALTER TABLE `course_units`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`),
  ADD KEY `university_id` (`university_id`);

--
-- Indexes for table `depts`
--
ALTER TABLE `depts`
  ADD PRIMARY KEY (`dept_id`),
  ADD KEY `university_id` (`university_id`),
  ADD KEY `school_id` (`school_id`);

--
-- Indexes for table `dept_courses`
--
ALTER TABLE `dept_courses`
  ADD PRIMARY KEY (`dept_course_id`),
  ADD KEY `dept_id` (`dept_id`),
  ADD KEY `course_id` (`course_id`),
  ADD KEY `_who_added` (`_who_added`);

--
-- Indexes for table `dept_members`
--
ALTER TABLE `dept_members`
  ADD PRIMARY KEY (`member_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `_who_added` (`_who_added`),
  ADD KEY `school_id` (`school_id`);

--
-- Indexes for table `fees_categories`
--
ALTER TABLE `fees_categories`
  ADD PRIMARY KEY (`cat_id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `_who_added` (`_who_added`),
  ADD KEY `university_id` (`university_id`);

--
-- Indexes for table `fees_structure`
--
ALTER TABLE `fees_structure`
  ADD PRIMARY KEY (`fees_id`),
  ADD KEY `_who_added` (`_who_added`),
  ADD KEY `course_id` (`course_id`),
  ADD KEY `fees_category` (`fees_category`);

--
-- Indexes for table `general_complaints`
--
ALTER TABLE `general_complaints`
  ADD PRIMARY KEY (`id`),
  ADD KEY `_who_added` (`_who_added`),
  ADD KEY `unv` (`university_id`);

--
-- Indexes for table `grading`
--
ALTER TABLE `grading`
  ADD PRIMARY KEY (`grading_id`),
  ADD KEY `university_id` (`university_id`);

--
-- Indexes for table `group_members`
--
ALTER TABLE `group_members`
  ADD PRIMARY KEY (`member_id`),
  ADD KEY `group_group_id` (`group_group_id`),
  ADD KEY `student_student_id` (`student_student_id`);

--
-- Indexes for table `group_menu`
--
ALTER TABLE `group_menu`
  ADD PRIMARY KEY (`group_menu_id`),
  ADD KEY `sub_menu_id` (`sub_menu_id`),
  ADD KEY `group_id` (`group_id`),
  ADD KEY `assigned_id` (`menu_assigned_id`);

--
-- Indexes for table `group_messages`
--
ALTER TABLE `group_messages`
  ADD PRIMARY KEY (`group_message_id`),
  ADD KEY `group_group_id` (`group_group_id`),
  ADD KEY `student_student_id` (`student_student_id`);

--
-- Indexes for table `group_users`
--
ALTER TABLE `group_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `group` (`group`),
  ADD KEY `user` (`user`),
  ADD KEY `_who_added` (`_who_added`);

--
-- Indexes for table `intakes`
--
ALTER TABLE `intakes`
  ADD PRIMARY KEY (`intake_id`),
  ADD KEY `university_university_id` (`university_university_id`),
  ADD KEY `_who_added` (`_who_added`);

--
-- Indexes for table `marks`
--
ALTER TABLE `marks`
  ADD PRIMARY KEY (`marks_id`),
  ADD KEY `fk_marks_semesters1_idx` (`semesters_semester_id`),
  ADD KEY `fk_marks_academic_years1_idx` (`academic_years_year_id`),
  ADD KEY `university_university_id` (`university_university_id`),
  ADD KEY `course_course_id` (`course_course_id`),
  ADD KEY `marks_ibfk_3` (`_who_added`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`menu_id`);

--
-- Indexes for table `menu_assignments`
--
ALTER TABLE `menu_assignments`
  ADD PRIMARY KEY (`assignmet_id`),
  ADD KEY `	menu_id` (`menu_id`),
  ADD KEY `menu_assignments_ibfk_2` (`user_group_id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`message_id`),
  ADD KEY `student_student_id` (`student_student_id`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`news_id`),
  ADD KEY `university_university_id` (`university_university_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `news_categories`
--
ALTER TABLE `news_categories`
  ADD PRIMARY KEY (`category_id`),
  ADD KEY `university_id` (`university_id`);

--
-- Indexes for table `parent`
--
ALTER TABLE `parent`
  ADD PRIMARY KEY (`parent_id`);

--
-- Indexes for table `parent_student`
--
ALTER TABLE `parent_student`
  ADD PRIMARY KEY (`id`),
  ADD KEY `p_id` (`parent_id`),
  ADD KEY `s_id` (`student_id`);

--
-- Indexes for table `positions`
--
ALTER TABLE `positions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `who_added` (`_who_added`),
  ADD KEY `university_id` (`university_id`);

--
-- Indexes for table `registered_academic_years`
--
ALTER TABLE `registered_academic_years`
  ADD PRIMARY KEY (`registered_academic_years_id`),
  ADD KEY `student_student_id` (`student_student_id`),
  ADD KEY `semester_semester_id` (`semester_semester_id`),
  ADD KEY `year_study` (`year_study`);

--
-- Indexes for table `registered_course_units`
--
ALTER TABLE `registered_course_units`
  ADD PRIMARY KEY (`reg_course_units_id`),
  ADD KEY `fk_registered_course_units_student_registration1_idx` (`student_student_id`),
  ADD KEY `course_units_units_id` (`course_units_units_id`),
  ADD KEY `registered_course_units_ibfk_3` (`registered_academic_years_id`);

--
-- Indexes for table `reply_complaint`
--
ALTER TABLE `reply_complaint`
  ADD PRIMARY KEY (`reply_id`),
  ADD KEY `complaint_id` (`complaint_id`),
  ADD KEY `_who_replied` (`_who_replied`);

--
-- Indexes for table `schools`
--
ALTER TABLE `schools`
  ADD PRIMARY KEY (`school_id`),
  ADD KEY `university_id` (`university_id`);

--
-- Indexes for table `semesters`
--
ALTER TABLE `semesters`
  ADD PRIMARY KEY (`semester_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`student_id`),
  ADD KEY `fk_student_universities1_idx` (`universities_university_id`),
  ADD KEY `courses_course_id` (`courses_course_id`),
  ADD KEY `intake_intake_id` (`intake_intake_id`),
  ADD KEY `student_ibfk_2` (`_who_added`);

--
-- Indexes for table `student_payments`
--
ALTER TABLE `student_payments`
  ADD PRIMARY KEY (`payments_id`),
  ADD KEY `study_year` (`study_year`),
  ADD KEY `semester` (`semester`),
  ADD KEY `student_id` (`student_id`);

--
-- Indexes for table `study_year`
--
ALTER TABLE `study_year`
  ADD PRIMARY KEY (`year_id`);

--
-- Indexes for table `sub_menu`
--
ALTER TABLE `sub_menu`
  ADD PRIMARY KEY (`sub_menu_id`),
  ADD KEY `menu_id` (`menu_id`);

--
-- Indexes for table `suggestion_box`
--
ALTER TABLE `suggestion_box`
  ADD PRIMARY KEY (`suggestion_box_id`),
  ADD KEY `university_id` (`university_university_id`),
  ADD KEY `student_id` (`student_student_id`);

--
-- Indexes for table `suggestion_replies`
--
ALTER TABLE `suggestion_replies`
  ADD PRIMARY KEY (`suggestion_reply_id`),
  ADD KEY `fk_suggestion_replies_suggestion_box1_idx` (`suggestion_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `time_table`
--
ALTER TABLE `time_table`
  ADD PRIMARY KEY (`time_table_id`),
  ADD KEY `course_id` (`course_id`),
  ADD KEY `university_id` (`university_id`),
  ADD KEY `semester` (`semester_id`),
  ADD KEY `study_year` (`study_year`);

--
-- Indexes for table `tokens`
--
ALTER TABLE `tokens`
  ADD PRIMARY KEY (`token_id`),
  ADD KEY `student_student_id` (`student_student_id`);

--
-- Indexes for table `tuition_complaints`
--
ALTER TABLE `tuition_complaints`
  ADD PRIMARY KEY (`complaint_id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `year_id` (`year_id`),
  ADD KEY `semester_id` (`semester_id`),
  ADD KEY `university_id` (`university_id`);

--
-- Indexes for table `universities`
--
ALTER TABLE `universities`
  ADD PRIMARY KEY (`university_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `uni_id_fk` (`university_id`);

--
-- Indexes for table `user_groups`
--
ALTER TABLE `user_groups`
  ADD PRIMARY KEY (`group_id`);

--
-- Indexes for table `user_position`
--
ALTER TABLE `user_position`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pos_name` (`pos_name`),
  ADD KEY `user` (`user`),
  ADD KEY `user_position_ibfk_3` (`_who_added`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `academic_years`
--
ALTER TABLE `academic_years`
  MODIFY `academic_year_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `active_students`
--
ALTER TABLE `active_students`
  MODIFY `active_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `assigned_units`
--
ALTER TABLE `assigned_units`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `balances_temp`
--
ALTER TABLE `balances_temp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `campus_calendar`
--
ALTER TABLE `campus_calendar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `campus_events`
--
ALTER TABLE `campus_events`
  MODIFY `event_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `chatgroups`
--
ALTER TABLE `chatgroups`
  MODIFY `group_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=206;
--
-- AUTO_INCREMENT for table `chatroom`
--
ALTER TABLE `chatroom`
  MODIFY `room_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `chat_memebers`
--
ALTER TABLE `chat_memebers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `chat_mgs`
--
ALTER TABLE `chat_mgs`
  MODIFY `message_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;
--
-- AUTO_INCREMENT for table `chat_users`
--
ALTER TABLE `chat_users`
  MODIFY `chat_user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `complaints_details`
--
ALTER TABLE `complaints_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `complaint_receiver`
--
ALTER TABLE `complaint_receiver`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `complaint_reply`
--
ALTER TABLE `complaint_reply`
  MODIFY `complaint_reply_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `complaint_response`
--
ALTER TABLE `complaint_response`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `complaint_types`
--
ALTER TABLE `complaint_types`
  MODIFY `complaint_types_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `counsellors`
--
ALTER TABLE `counsellors`
  MODIFY `counsellor_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `course_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;
--
-- AUTO_INCREMENT for table `course_units`
--
ALTER TABLE `course_units`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1251;
--
-- AUTO_INCREMENT for table `depts`
--
ALTER TABLE `depts`
  MODIFY `dept_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `dept_courses`
--
ALTER TABLE `dept_courses`
  MODIFY `dept_course_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `dept_members`
--
ALTER TABLE `dept_members`
  MODIFY `member_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `fees_categories`
--
ALTER TABLE `fees_categories`
  MODIFY `cat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `fees_structure`
--
ALTER TABLE `fees_structure`
  MODIFY `fees_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `general_complaints`
--
ALTER TABLE `general_complaints`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `grading`
--
ALTER TABLE `grading`
  MODIFY `grading_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT for table `group_members`
--
ALTER TABLE `group_members`
  MODIFY `member_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1970;
--
-- AUTO_INCREMENT for table `group_menu`
--
ALTER TABLE `group_menu`
  MODIFY `group_menu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=96;
--
-- AUTO_INCREMENT for table `group_messages`
--
ALTER TABLE `group_messages`
  MODIFY `group_message_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `group_users`
--
ALTER TABLE `group_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `intakes`
--
ALTER TABLE `intakes`
  MODIFY `intake_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `marks`
--
ALTER TABLE `marks`
  MODIFY `marks_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=822;
--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `menu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT for table `menu_assignments`
--
ALTER TABLE `menu_assignments`
  MODIFY `assignmet_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=327;
--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `message_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `news_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `news_categories`
--
ALTER TABLE `news_categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `parent`
--
ALTER TABLE `parent`
  MODIFY `parent_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `parent_student`
--
ALTER TABLE `parent_student`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `positions`
--
ALTER TABLE `positions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `registered_academic_years`
--
ALTER TABLE `registered_academic_years`
  MODIFY `registered_academic_years_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;
--
-- AUTO_INCREMENT for table `registered_course_units`
--
ALTER TABLE `registered_course_units`
  MODIFY `reg_course_units_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;
--
-- AUTO_INCREMENT for table `reply_complaint`
--
ALTER TABLE `reply_complaint`
  MODIFY `reply_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `schools`
--
ALTER TABLE `schools`
  MODIFY `school_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `semesters`
--
ALTER TABLE `semesters`
  MODIFY `semester_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `sessions`
--
ALTER TABLE `sessions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4388;
--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `student_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1973;
--
-- AUTO_INCREMENT for table `student_payments`
--
ALTER TABLE `student_payments`
  MODIFY `payments_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `study_year`
--
ALTER TABLE `study_year`
  MODIFY `year_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `sub_menu`
--
ALTER TABLE `sub_menu`
  MODIFY `sub_menu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;
--
-- AUTO_INCREMENT for table `suggestion_box`
--
ALTER TABLE `suggestion_box`
  MODIFY `suggestion_box_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `suggestion_replies`
--
ALTER TABLE `suggestion_replies`
  MODIFY `suggestion_reply_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `time_table`
--
ALTER TABLE `time_table`
  MODIFY `time_table_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `tokens`
--
ALTER TABLE `tokens`
  MODIFY `token_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `tuition_complaints`
--
ALTER TABLE `tuition_complaints`
  MODIFY `complaint_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `universities`
--
ALTER TABLE `universities`
  MODIFY `university_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT for table `user_groups`
--
ALTER TABLE `user_groups`
  MODIFY `group_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;
--
-- AUTO_INCREMENT for table `user_position`
--
ALTER TABLE `user_position`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `academic_years`
--
ALTER TABLE `academic_years`
  ADD CONSTRAINT `academic_years_ibfk_1` FOREIGN KEY (`university_university_id`) REFERENCES `universities` (`university_id`),
  ADD CONSTRAINT `academic_years_ibfk_2` FOREIGN KEY (`_who_added`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `active_students`
--
ALTER TABLE `active_students`
  ADD CONSTRAINT `active_students_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`),
  ADD CONSTRAINT `active_students_ibfk_2` FOREIGN KEY (`university_id`) REFERENCES `universities` (`university_id`);

--
-- Constraints for table `assigned_units`
--
ALTER TABLE `assigned_units`
  ADD CONSTRAINT `assigned_units_ibfk_2` FOREIGN KEY (`semeter`) REFERENCES `semesters` (`semester_id`),
  ADD CONSTRAINT `assigned_units_ibfk_3` FOREIGN KEY (`course`) REFERENCES `courses` (`course_id`),
  ADD CONSTRAINT `assigned_units_ibfk_4` FOREIGN KEY (`course_unit`) REFERENCES `course_units` (`id`);

--
-- Constraints for table `balances_temp`
--
ALTER TABLE `balances_temp`
  ADD CONSTRAINT `balances_temp_ibfk_1` FOREIGN KEY (`student`) REFERENCES `student` (`student_id`);

--
-- Constraints for table `campus_events`
--
ALTER TABLE `campus_events`
  ADD CONSTRAINT `campus_events_ibfk_1` FOREIGN KEY (`university_university_id`) REFERENCES `universities` (`university_id`);

--
-- Constraints for table `chat_memebers`
--
ALTER TABLE `chat_memebers`
  ADD CONSTRAINT `chat_memebers_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `chat_users` (`chat_user_id`),
  ADD CONSTRAINT `chat_memebers_ibfk_2` FOREIGN KEY (`chatroom_id`) REFERENCES `chatroom` (`room_id`);

--
-- Constraints for table `chat_mgs`
--
ALTER TABLE `chat_mgs`
  ADD CONSTRAINT `chat_mgs_ibfk_1` FOREIGN KEY (`users_id`) REFERENCES `chat_users` (`chat_user_id`),
  ADD CONSTRAINT `chat_mgs_ibfk_2` FOREIGN KEY (`room_id`) REFERENCES `chatroom` (`room_id`);

--
-- Constraints for table `complaints_details`
--
ALTER TABLE `complaints_details`
  ADD CONSTRAINT `complaints_details_ibfk_3` FOREIGN KEY (`semester_id`) REFERENCES `semesters` (`semester_id`),
  ADD CONSTRAINT `complaints_details_ibfk_4` FOREIGN KEY (`course_unit_id`) REFERENCES `course_units` (`id`),
  ADD CONSTRAINT `complaints_details_ibfk_5` FOREIGN KEY (`complaint_id`) REFERENCES `general_complaints` (`id`);

--
-- Constraints for table `complaint_receiver`
--
ALTER TABLE `complaint_receiver`
  ADD CONSTRAINT `complaint_receiver_ibfk_1` FOREIGN KEY (`complaint`) REFERENCES `general_complaints` (`id`),
  ADD CONSTRAINT `complaint_receiver_ibfk_2` FOREIGN KEY (`target`) REFERENCES `positions` (`id`);

--
-- Constraints for table `complaint_reply`
--
ALTER TABLE `complaint_reply`
  ADD CONSTRAINT `fk_complaints_replies_complaints1` FOREIGN KEY (`complaints_complaint_id`) REFERENCES `complaints_details` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `complaint_response`
--
ALTER TABLE `complaint_response`
  ADD CONSTRAINT `complaint_response_ibfk_1` FOREIGN KEY (`complaint`) REFERENCES `general_complaints` (`id`),
  ADD CONSTRAINT `complaint_response_ibfk_2` FOREIGN KEY (`_who_added`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `complaint_types`
--
ALTER TABLE `complaint_types`
  ADD CONSTRAINT `complaint_types_ibfk_1` FOREIGN KEY (`university_university_id`) REFERENCES `universities` (`university_id`);

--
-- Constraints for table `counsellors`
--
ALTER TABLE `counsellors`
  ADD CONSTRAINT `counsellors_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `counsellors_ibfk_2` FOREIGN KEY (`university_id`) REFERENCES `universities` (`university_id`);

--
-- Constraints for table `courses`
--
ALTER TABLE `courses`
  ADD CONSTRAINT `courses_ibfk_1` FOREIGN KEY (`universities_university_id`) REFERENCES `universities` (`university_id`),
  ADD CONSTRAINT `courses_ibfk_2` FOREIGN KEY (`_who_added`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `courses_ibfk_3` FOREIGN KEY (`dept_id`) REFERENCES `depts` (`dept_id`);

--
-- Constraints for table `course_units`
--
ALTER TABLE `course_units`
  ADD CONSTRAINT `course_units_ibfk_1` FOREIGN KEY (`university_id`) REFERENCES `universities` (`university_id`);

--
-- Constraints for table `depts`
--
ALTER TABLE `depts`
  ADD CONSTRAINT `depts_ibfk_1` FOREIGN KEY (`university_id`) REFERENCES `universities` (`university_id`),
  ADD CONSTRAINT `depts_ibfk_2` FOREIGN KEY (`school_id`) REFERENCES `schools` (`school_id`);

--
-- Constraints for table `dept_courses`
--
ALTER TABLE `dept_courses`
  ADD CONSTRAINT `dept_courses_ibfk_1` FOREIGN KEY (`dept_id`) REFERENCES `depts` (`dept_id`),
  ADD CONSTRAINT `dept_courses_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`),
  ADD CONSTRAINT `dept_courses_ibfk_3` FOREIGN KEY (`_who_added`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `dept_members`
--
ALTER TABLE `dept_members`
  ADD CONSTRAINT `dept_members_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `dept_members_ibfk_3` FOREIGN KEY (`_who_added`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `dept_members_ibfk_4` FOREIGN KEY (`school_id`) REFERENCES `schools` (`school_id`);

--
-- Constraints for table `fees_categories`
--
ALTER TABLE `fees_categories`
  ADD CONSTRAINT `fees_categories_ibfk_1` FOREIGN KEY (`_who_added`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `fees_categories_ibfk_2` FOREIGN KEY (`university_id`) REFERENCES `universities` (`university_id`);

--
-- Constraints for table `fees_structure`
--
ALTER TABLE `fees_structure`
  ADD CONSTRAINT `fees_structure_ibfk_3` FOREIGN KEY (`_who_added`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `fees_structure_ibfk_4` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`),
  ADD CONSTRAINT `fees_structure_ibfk_5` FOREIGN KEY (`fees_category`) REFERENCES `fees_categories` (`cat_id`);

--
-- Constraints for table `general_complaints`
--
ALTER TABLE `general_complaints`
  ADD CONSTRAINT `general_complaints_ibfk_1` FOREIGN KEY (`_who_added`) REFERENCES `student` (`student_id`),
  ADD CONSTRAINT `unv` FOREIGN KEY (`university_id`) REFERENCES `universities` (`university_id`);

--
-- Constraints for table `grading`
--
ALTER TABLE `grading`
  ADD CONSTRAINT `grading_ibfk_1` FOREIGN KEY (`university_id`) REFERENCES `universities` (`university_id`);

--
-- Constraints for table `group_menu`
--
ALTER TABLE `group_menu`
  ADD CONSTRAINT `group_menu_ibfk_1` FOREIGN KEY (`sub_menu_id`) REFERENCES `sub_menu` (`sub_menu_id`),
  ADD CONSTRAINT `group_menu_ibfk_2` FOREIGN KEY (`group_id`) REFERENCES `user_groups` (`group_id`),
  ADD CONSTRAINT `group_menu_ibfk_3` FOREIGN KEY (`menu_assigned_id`) REFERENCES `menu_assignments` (`assignmet_id`);

--
-- Constraints for table `group_users`
--
ALTER TABLE `group_users`
  ADD CONSTRAINT `group_users_ibfk_1` FOREIGN KEY (`group`) REFERENCES `user_groups` (`group_id`),
  ADD CONSTRAINT `group_users_ibfk_2` FOREIGN KEY (`user`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `group_users_ibfk_3` FOREIGN KEY (`_who_added`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `news`
--
ALTER TABLE `news`
  ADD CONSTRAINT `news_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `news_categories` (`category_id`);

--
-- Constraints for table `news_categories`
--
ALTER TABLE `news_categories`
  ADD CONSTRAINT `news_categories_ibfk_1` FOREIGN KEY (`university_id`) REFERENCES `universities` (`university_id`);

--
-- Constraints for table `parent_student`
--
ALTER TABLE `parent_student`
  ADD CONSTRAINT `p_id` FOREIGN KEY (`parent_id`) REFERENCES `parent` (`parent_id`),
  ADD CONSTRAINT `s_id` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`);

--
-- Constraints for table `positions`
--
ALTER TABLE `positions`
  ADD CONSTRAINT `positions_ibfk_1` FOREIGN KEY (`_who_added`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `positions_ibfk_2` FOREIGN KEY (`university_id`) REFERENCES `universities` (`university_id`);

--
-- Constraints for table `registered_academic_years`
--
ALTER TABLE `registered_academic_years`
  ADD CONSTRAINT `registered_academic_years_ibfk_2` FOREIGN KEY (`year_study`) REFERENCES `study_year` (`year_id`);

--
-- Constraints for table `reply_complaint`
--
ALTER TABLE `reply_complaint`
  ADD CONSTRAINT `reply_complaint_ibfk_1` FOREIGN KEY (`complaint_id`) REFERENCES `tuition_complaints` (`complaint_id`),
  ADD CONSTRAINT `reply_complaint_ibfk_2` FOREIGN KEY (`_who_replied`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `schools`
--
ALTER TABLE `schools`
  ADD CONSTRAINT `schools_ibfk_1` FOREIGN KEY (`university_id`) REFERENCES `universities` (`university_id`);

--
-- Constraints for table `student_payments`
--
ALTER TABLE `student_payments`
  ADD CONSTRAINT `student_payments_ibfk_2` FOREIGN KEY (`study_year`) REFERENCES `study_year` (`year_id`),
  ADD CONSTRAINT `student_payments_ibfk_3` FOREIGN KEY (`semester`) REFERENCES `semesters` (`semester_id`),
  ADD CONSTRAINT `student_payments_ibfk_4` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`);

--
-- Constraints for table `sub_menu`
--
ALTER TABLE `sub_menu`
  ADD CONSTRAINT `sub_menu_ibfk_1` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`menu_id`);

--
-- Constraints for table `suggestion_box`
--
ALTER TABLE `suggestion_box`
  ADD CONSTRAINT `student_id` FOREIGN KEY (`student_student_id`) REFERENCES `student` (`student_id`),
  ADD CONSTRAINT `university_id` FOREIGN KEY (`university_university_id`) REFERENCES `universities` (`university_id`);

--
-- Constraints for table `time_table`
--
ALTER TABLE `time_table`
  ADD CONSTRAINT `time_table_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`),
  ADD CONSTRAINT `time_table_ibfk_2` FOREIGN KEY (`university_id`) REFERENCES `universities` (`university_id`),
  ADD CONSTRAINT `time_table_ibfk_4` FOREIGN KEY (`semester_id`) REFERENCES `semesters` (`semester_id`),
  ADD CONSTRAINT `time_table_ibfk_5` FOREIGN KEY (`study_year`) REFERENCES `study_year` (`year_id`);

--
-- Constraints for table `tuition_complaints`
--
ALTER TABLE `tuition_complaints`
  ADD CONSTRAINT `tuition_complaints_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`),
  ADD CONSTRAINT `tuition_complaints_ibfk_2` FOREIGN KEY (`year_id`) REFERENCES `study_year` (`year_id`),
  ADD CONSTRAINT `tuition_complaints_ibfk_3` FOREIGN KEY (`semester_id`) REFERENCES `semesters` (`semester_id`),
  ADD CONSTRAINT `tuition_complaints_ibfk_4` FOREIGN KEY (`university_id`) REFERENCES `universities` (`university_id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `uni_id_fk` FOREIGN KEY (`university_id`) REFERENCES `universities` (`university_id`);

--
-- Constraints for table `user_position`
--
ALTER TABLE `user_position`
  ADD CONSTRAINT `user_position_ibfk_1` FOREIGN KEY (`pos_name`) REFERENCES `positions` (`id`),
  ADD CONSTRAINT `user_position_ibfk_2` FOREIGN KEY (`user`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `user_position_ibfk_3` FOREIGN KEY (`_who_added`) REFERENCES `users` (`user_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
