-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Aug 26, 2017 at 04:26 PM
-- Server version: 10.1.19-MariaDB
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
(1, '2017-2018', 13, '2017-08-09', 5, 0),
(2, '2018-2019', 13, '2017-08-11', 5, 0),
(3, '203', 13, '2017-08-11', 5, 1),
(4, 'sd', 13, '2017-08-11', 5, 1),
(5, '2016-2017', 11, '2017-08-12', 8, 0),
(6, '2017-2018', 11, '2017-08-12', 8, 0),
(8, '2017-2018', 15, '2017-08-14', 11, 0),
(9, '2017-2018', 16, '2017-08-21', 15, 0);

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

CREATE TABLE `appointments` (
  `appointment_id` int(11) NOT NULL,
  `student_id` int(11) DEFAULT NULL,
  `university_id` int(11) DEFAULT NULL,
  `appointment_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `appointments`
--

INSERT INTO `appointments` (`appointment_id`, `student_id`, `university_id`, `appointment_date`) VALUES
(1, 5, 13, '2017-08-16');

-- --------------------------------------------------------

--
-- Table structure for table `assigned_units`
--

CREATE TABLE `assigned_units` (
  `assigned_units_id` int(11) NOT NULL,
  `academic_academic_year_id` int(11) DEFAULT NULL,
  `semester_semester_id` int(11) DEFAULT NULL,
  `course_course_id` int(11) DEFAULT NULL,
  `course_unit_unit_id` int(11) DEFAULT NULL,
  `who_added` int(11) DEFAULT NULL,
  `when_added` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `assigned_units`
--

INSERT INTO `assigned_units` (`assigned_units_id`, `academic_academic_year_id`, `semester_semester_id`, `course_course_id`, `course_unit_unit_id`, `who_added`, `when_added`) VALUES
(1, 2, 1, 2, 9, NULL, NULL),
(2, 2, 1, 2, 8, NULL, NULL),
(3, 2, 1, 2, 7, NULL, NULL),
(4, 2, 1, 2, 5, NULL, NULL),
(5, 2, 1, 2, 3, NULL, NULL),
(7, 2, 2, 2, 1, NULL, NULL),
(8, 6, 1, 12, 20, NULL, NULL),
(9, 6, 1, 12, 18, NULL, NULL),
(10, 6, 1, 12, 17, NULL, NULL),
(11, 6, 1, 12, 16, NULL, NULL),
(12, 6, 1, 12, 15, NULL, NULL),
(13, 6, 1, 12, 13, NULL, NULL),
(23, 9, 1, 20, 33, NULL, NULL),
(25, 9, 1, 20, 32, NULL, NULL),
(26, 6, 1, 12, 15, NULL, NULL),
(27, 6, 1, 12, 13, NULL, NULL),
(28, 9, 1, 20, 33, NULL, NULL),
(29, 9, 1, 20, 32, NULL, NULL),
(30, 9, 2, 20, 35, NULL, NULL),
(31, 9, 2, 20, 36, NULL, NULL),
(32, 9, 2, 20, 37, NULL, NULL);

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

--
-- Dumping data for table `campus_calendar`
--

INSERT INTO `campus_calendar` (`id`, `title`, `date`, `created`, `modified`, `status`) VALUES
(1, 'Internet of Things World Forum', '2016-05-12', '2016-05-09 06:15:17', '2016-05-09 06:15:17', 1),
(2, 'The Future of Money and Technology Summit', '2016-05-26', '2016-05-09 06:15:17', '2016-05-09 06:15:17', 1),
(3, 'Chrome Dev Summit', '2016-05-26', '2016-05-09 06:15:17', '2016-05-09 06:15:17', 1),
(4, 'The Lean Startup Conference', '2016-05-17', '2016-05-09 06:15:17', '2016-05-09 06:15:17', 1),
(5, 'Web Submit for Developers', '2016-05-17', '2016-05-09 06:15:17', '2016-05-09 06:15:17', 1);

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

--
-- Dumping data for table `campus_events`
--

INSERT INTO `campus_events` (`event_id`, `title`, `event_detail`, `time_stamp`, `_when_added`, `_who_added`, `university_university_id`) VALUES
(2, 'Welcoming freshers into the University', '<p>This is a test event for the university</p>\r\n', '2017 August 11', '2017-08-14', 5, 13),
(4, 'Opening  Of the campus New semester ', '<p>On the registered land the farmer adds the garden, this is per season.</p>\r\n\r\n<p>On the Garden the system captures the name, size, soil analysis, crop grown , season period, crop planted quantity, planting date and the GPS location of the Garden</p>\r\n', '2017 August 22', '2017-08-14', 5, 13),
(5, 'Computer programmers hackthon', '<p>Please everyone get really to come to the event of all programmers in the country which will take place at serena hotel on 29/09/2017</p>\r\n', '2017-09-29', '2017-08-14', 10, 12),
(6, 'Freshers Orientation Week', '<p>zdzdsdqsdqddwdqwdqwdqwdqwdqwdf</p>\r\n', '2017-08-16', '2017-08-14', 5, 13),
(7, 'Beginning Of the End of semester Exams ', '<p>swdswdwdqdqewdqewdw</p>\r\n', '2017-August-16', '2017-08-14', 5, 13),
(8, 'Sports Gala', '<p>Sports gala is an anual event organised by MMU to engage all the university stake holders.</p>\r\n\r\n<p>The event requires that univversity students at diffrent levels of the instution organise them selves in teams according to faculty of study. those that emerge as winners are awarded with a torphy and money of about 1,000,0000 ug shs.</p>\r\n', '2017-August-15', '2017-08-14', 11, 15);

-- --------------------------------------------------------

--
-- Table structure for table `chatgroups`
--

CREATE TABLE `chatgroups` (
  `group_id` int(11) NOT NULL,
  `group_name` varchar(200) DEFAULT NULL,
  `university_id` int(11) NOT NULL,
  `_when_added` date DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `chatgroups`
--

INSERT INTO `chatgroups` (`group_id`, `group_name`, `university_id`, `_when_added`, `status`) VALUES
(1, 'Android developers of Uganda', 16, '2017-06-15', 0),
(2, 'The lions club', 0, '2017-06-23', 0),
(13, 'The Logic', 0, '2017-06-23', 0),
(14, 'riders', 0, '2017-06-23', 0),
(15, 'codders', 0, '2017-06-23', 0),
(16, '8tech', 0, '2017-06-23', 0),
(18, '2017 August Class', 16, NULL, 0),
(19, 'Last Coders ', 16, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `complaints`
--

CREATE TABLE `complaints` (
  `complaint_id` int(11) NOT NULL,
  `complaint` varchar(30000) DEFAULT NULL,
  `attachment` varchar(300) DEFAULT NULL,
  `student_student_id` int(11) NOT NULL,
  `type_id` int(11) DEFAULT NULL,
  `_when_added` date NOT NULL,
  `_status` int(11) DEFAULT '0',
  `cleared_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `year` varchar(50) NOT NULL,
  `semester` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `complaints`
--

INSERT INTO `complaints` (`complaint_id`, `complaint`, `attachment`, `student_student_id`, `type_id`, `_when_added`, `_status`, `cleared_date`, `year`, `semester`) VALUES
(1, ' This act is rather done by the women who come to church in mini attires. Years ago while in church, if a lady wears indecent of provocative closer to church she would be sent home to change unfortunately today, churches have failed to uphold righteousness, instead pastors fear to lose members of the church so they ignore the fact that the women are dressing indecently.\r\nTo the artistic view, as an artistic still respect church so its really indecent when I produce an attire that is indecent fro church for example in Uganda two girls were thrown out of church over indecent dressing. The embarrassed girls stood outside the church complaining that the pastor was a villager and old fashioned, “we put on similar attire and attend prayers in bigger churches around Kampala, but no pastor has ever embarrassed us like this one has done” \r\n', 'gloria.docx', 6, 1, '0000-00-00', 1, '2017-08-14 10:11:35', '', ''),
(4, 'sxdhsdhshdshdhsdhshdshdhsdhdsh', NULL, 17, 1, '2017-08-09', 0, '2017-08-22 09:56:02', '', ''),
(5, 'ggg', NULL, 17, 6, '2017-08-22', 0, '2017-08-22 12:06:55', 'One', 'One'),
(6, 'ggg', NULL, 17, 6, '2017-08-22', 0, '2017-08-22 12:07:36', 'One', 'One'),
(7, 'ggvmv', NULL, 17, 6, '2017-08-22', 0, '2017-08-22 12:08:21', 'One', 'One');

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

--
-- Dumping data for table `complaint_reply`
--

INSERT INTO `complaint_reply` (`complaint_reply_id`, `complaint_reply`, `complaints_complaint_id`, `_who_added`, `_when_added`) VALUES
(1, 'we are still working on the problem but it will not take long', 1, 5, '2017-08-14');

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
(1, 'Missing Exams', 13, '2017-08-09', 5),
(2, 'Test Marks Missing', 12, '2017-08-14', 10),
(3, 'Final Marks Missing', 12, '2017-08-14', 10),
(5, 'Discipline', 15, '2017-08-14', 11),
(6, 'Missing Exams', 16, '2017-08-22', 15);

-- --------------------------------------------------------

--
-- Table structure for table `counselling_reply`
--

CREATE TABLE `counselling_reply` (
  `reply_id` int(11) NOT NULL,
  `reply` varchar(700) DEFAULT NULL,
  `chat_room_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
(1, 9, 13),
(2, 5, 13),
(3, 15, 16);

-- --------------------------------------------------------

--
-- Table structure for table `counsellor_chat`
--

CREATE TABLE `counsellor_chat` (
  `chat_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  `status` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`course_id`, `course_code`, `course`, `universities_university_id`, `_when_added`, `_who_added`, `status`) VALUES
(2, 'BIT', 'Bachelor of Information Technology', 13, '2017-08-09', 5, 0),
(3, 'BCS', 'Bachelor of Computer Science', 13, '2017-08-09', 5, 0),
(4, 'BIS', 'Bachelor of Information Security', 13, '2017-08-09', 5, 0),
(5, 'BSE', 'Bachelor of Data Communcation and software Engineering', 13, '2017-08-09', 5, 0),
(6, 'BCFS', 'Bachelor of Computer Foresic Science ', 13, '2017-08-09', 5, 1),
(7, 'yy', 'yyyyyyyyyy', 9, '2017-08-15', 4, 0),
(8, 'BCFS', 'Bachelor of Computer Foresic Science ', 13, '2017-08-09', 5, 0),
(9, 'BIT', 'Bachelor of Information Technology', 11, '2017-08-12', 8, 0),
(10, 'BCS', 'Bachelor of Computer Science', 11, '2017-08-12', 8, 0),
(11, 'BIS', 'Bachelor of Information Security', 11, '2017-08-12', 8, 0),
(12, 'BSE', 'Bachelor of Data Communcation and software Engineering', 11, '2017-08-12', 8, 0),
(13, 'BCFS', 'Bachelor of Computer Foresic Science ', 11, '2017-08-12', 8, 0),
(14, 'BIT', 'Bachelor of science in Information Technology', 15, '2017-08-14', 11, 0),
(15, 'BCS', 'Bachelor of science in Computer Science', 15, '2017-08-14', 11, 0),
(16, 'BSSE', 'Bachelor of science in software engineering ', 15, '2017-08-14', 11, 0),
(17, 'BTE', 'Bachelor of science in telecom engineering', 15, '2017-08-14', 11, 0),
(18, 'BIS', 'Bachelor of science in information systems', 15, '2017-08-14', 11, 0),
(19, 'edu', 'bachelor of sience in education ', 15, '2017-08-14', 11, 0),
(20, 'BIT', 'Bachelor of Information Technology', 16, '2017-08-21', 15, 0);

-- --------------------------------------------------------

--
-- Table structure for table `course_units`
--

CREATE TABLE `course_units` (
  `course_unit_id` int(11) NOT NULL,
  `course_unit_code` varchar(50) DEFAULT NULL,
  `course_unit` varchar(100) DEFAULT NULL,
  `cu` int(11) NOT NULL,
  `courses_course_id` int(11) DEFAULT NULL,
  `_who_added` int(11) NOT NULL,
  `_when_added` date NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `course_units`
--

INSERT INTO `course_units` (`course_unit_id`, `course_unit_code`, `course_unit`, `cu`, `courses_course_id`, `_who_added`, `_when_added`, `status`) VALUES
(1, 'BIT 121', 'Entrepreneurship and IT', 5, 2, 5, '2017-08-09', 0),
(2, 'BIT 122', 'Information Systems and management', 4, 2, 5, '2017-08-09', 0),
(3, 'BIT 123', 'System Administration ', 3, 2, 5, '2017-08-09', 0),
(4, 'BIT 124', 'Computer Networks and Data Communication', 3, 2, 5, '2017-08-09', 0),
(5, 'BIT 125', 'Computer programming', 5, 2, 5, '2017-08-09', 0),
(6, 'BIT 211', 'System Integration and Architecture', 4, 2, 5, '2017-08-09', 0),
(7, 'BIT 212', 'Electronic Commerce', 4, 2, 5, '2017-08-09', 0),
(8, 'BIT 213', 'Scripting languages', 5, 2, 5, '2017-08-09', 0),
(9, 'BIT 214', 'Event Driven Programming', 4, 2, 5, '2017-08-09', 0),
(10, 'BIT 215f', 'Website Development', 5, 2, 5, '2017-08-09', 1),
(11, 'qq22', 'qqqqqqqqqq', 0, 7, 1, '2017-08-09', 0),
(12, 'BIT 121', 'Entrepreneurship and IT', 5, 12, 8, '2017-08-12', 0),
(13, 'BIT 122', 'Information Systems and management', 4, 12, 8, '2017-08-12', 0),
(14, 'BIT 123', 'System Administration ', 3, 12, 8, '2017-08-12', 0),
(15, 'BIT 124', 'Computer Networks and Data Communication', 3, 12, 8, '2017-08-12', 0),
(16, 'BIT 125', 'Computer programming', 5, 12, 8, '2017-08-12', 0),
(17, 'BIT 211', 'System Integration and Architecture', 4, 12, 8, '2017-08-12', 0),
(18, 'BIT 212', 'Electronic Commerce', 4, 12, 8, '2017-08-12', 0),
(19, 'BIT 213', 'Scripting languages', 5, 12, 8, '2017-08-12', 0),
(20, 'BIT 214', 'Event Driven Programming', 4, 12, 8, '2017-08-12', 0),
(21, 'BIT 215', 'Website Development', 5, 12, 8, '2017-08-12', 0),
(22, 'BIT 121', 'Entrepreneurship and IT', 5, 16, 11, '2017-08-14', 0),
(23, 'BIT 122', 'Information Systems and management', 4, 16, 11, '2017-08-14', 0),
(24, 'BIT 123', 'System Administration ', 3, 16, 11, '2017-08-14', 0),
(25, 'BIT 124', 'Computer Networks and Data Communication', 3, 16, 11, '2017-08-14', 0),
(26, 'BIT 125', 'Computer programming', 5, 16, 11, '2017-08-14', 0),
(27, 'BIT 211', 'System Integration and Architecture', 4, 16, 11, '2017-08-14', 0),
(28, 'BIT 212', 'Electronic Commerce', 4, 16, 11, '2017-08-14', 0),
(29, 'BIT 213', 'Scripting languages', 5, 16, 11, '2017-08-14', 0),
(30, 'BIT 214', 'Event Driven Programming', 4, 16, 11, '2017-08-14', 0),
(31, 'BIT 215', 'Website Development', 5, 16, 11, '2017-08-14', 0),
(32, 'BIT555', 'COMPUTER ASSEMBLY', 4, 20, 15, '2017-08-21', 0),
(33, 'BIT 934', 'COMPUTER PROGRAMMING', 4, 20, 15, '2017-08-21', 0),
(34, 'BIT 167', 'SCRIPTING LANGUAGES', 3, 20, 15, '2017-08-21', 0),
(35, 'BIT994', 'OBJECT ORIENTED PROGRAMMING', 4, 20, 15, '2017-08-22', 0),
(36, 'BIT334', 'DATABASE MANAGEMENT', 4, 20, 15, '2017-08-22', 0),
(37, 'BIT124', 'GRAPHICS DESIGN', 3, 20, 15, '2017-08-22', 0);

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
  `progress` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `grading`
--

INSERT INTO `grading` (`grading_id`, `grade`, `value_frm`, `value_to`, `grade_value`, `university_id`, `progress`) VALUES
(1, 'A', 80, 100, 5, 13, 0),
(2, 'B', 75, 79, 4.5, 13, 0),
(3, 'C+', 70, 74, 4, 13, 0),
(4, 'c-', 65, 69, 3.5, 13, 0),
(5, 'D', 60, 64, 3, 13, 0),
(6, 'F', 55, 59, 2.5, 13, 0),
(8, 'E', 50, 54, 2, 13, 0),
(9, 'O', 0, 49, 1, 13, 1),
(11, 'A', 80, 100, 5, 11, 0),
(12, 'B', 75, 80, 4.5, 11, 0),
(13, 'O', 0, 74, 1, 11, 1),
(14, 'A+', 90, 100, 5, 15, 0),
(15, 'A', 80, 89, 5, 15, 0),
(16, 'B+', 75, 79, 4.5, 15, 0),
(17, 'B', 70, 74, 4, 15, 0),
(18, 'C+', 65, 69, 3.5, 15, 0),
(19, 'C', 60, 64, 3, 15, 0),
(20, 'D+', 55, 59, 2.5, 15, 0),
(21, 'D', 50, 54, 2, 15, 0),
(22, 'E', 45, 49, 1.5, 15, 1),
(24, 'F', 0, 44, 0, 15, 1),
(25, 'A', 80, 100, 5, 16, 0),
(26, 'B', 75, 79, 4.5, 16, 0),
(27, 'C+', 70, 74, 4, 16, 0),
(28, 'C-', 65, 69, 3.5, 16, 0),
(29, 'D', 60, 64, 3, 16, 0),
(30, 'E', 55, 59, 2.5, 16, 0),
(31, 'F', 50, 54, 2, 16, 0),
(32, 'O', 0, 49, 1, 16, 1);

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
  `status` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `group_members`
--

INSERT INTO `group_members` (`member_id`, `role`, `student_student_id`, `group_group_id`, `_when_added`, `status`) VALUES
(1, 'user', 1, 1, '0000-00-00 00:00:00', 0),
(2, 'admin', 1, 13, '2017-06-22 21:00:00', 0),
(3, 'admin', 1, 14, '2017-06-22 21:00:00', 0),
(4, 'admin', 1, 15, '2017-06-22 21:00:00', 0),
(5, 'user', 49, 13, '2017-05-31 21:00:00', 0),
(8, 'user', 51, 13, '0000-00-00 00:00:00', 0),
(10, 'user', 49, 15, '0000-00-00 00:00:00', 0),
(11, 'user', 51, 15, '2017-06-20 21:00:00', 0),
(12, 'admin', 51, 16, '2017-06-22 21:00:00', 0),
(13, 'user', 1, 16, '0000-00-00 00:00:00', 0),
(14, 'user', 55, 2, '0000-00-00 00:00:00', 0),
(15, 'user', 51, 2, '0000-00-00 00:00:00', 0),
(24, 'user', 17, 18, '2017-08-20 21:00:00', 0),
(25, 'user', 18, 18, '2017-08-20 21:00:00', 0),
(26, 'user', 19, 18, '2017-08-20 21:00:00', 0),
(27, 'user', 20, 18, '2017-08-20 21:00:00', 1),
(28, 'user', 21, 18, '2017-08-20 21:00:00', 1),
(29, 'user', 22, 18, '2017-08-20 21:00:00', 1),
(30, 'user', 23, 18, '2017-08-20 21:00:00', 1),
(31, 'user', 24, 18, '2017-08-20 21:00:00', 1),
(32, 'user', 25, 18, '2017-08-20 21:00:00', 1),
(33, 'user', 26, 18, '2017-08-20 21:00:00', 1),
(34, 'user', 27, 18, '2017-08-20 21:00:00', 1),
(35, 'user', 28, 18, '2017-08-20 21:00:00', 1),
(36, 'user', 29, 18, '2017-08-20 21:00:00', 1),
(37, 'user', 30, 18, '2017-08-20 21:00:00', 0),
(38, 'user', 17, 19, '2017-08-21 20:06:14', 0);

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
(1, 'hello how are pro', 1, 1, '2017-06-12'),
(2, 'am ok,ed u', 49, 1, '2017-06-21'),
(3, 'abert test message', 1, 13, '2017-06-12'),
(4, 'hahaha u are really funny', 49, 13, '2017-06-23'),
(5, 'Hello', 1, 1, '2017-06-23'),
(6, 'test messages', 1, 1, '2017-06-23'),
(7, 'the go', 1, 13, '2017-06-23'),
(8, 'test', 1, 1, '2017-06-23'),
(9, 'send', 1, 1, '2017-06-23'),
(10, 'ok', 51, 1, '2017-06-23'),
(11, 'tes', 1, 1, '2017-06-23'),
(12, 'errr', 1, 1, '2017-06-23'),
(13, 'fhggg', 1, 1, '2017-06-23'),
(14, 'gggg', 1, 1, '2017-06-23'),
(15, 'Please', 1, 1, '2017-06-23'),
(16, 'ok', 1, 1, '2017-06-23'),
(17, 'pa', 1, 1, '2017-06-23'),
(18, 'jjj', 1, 1, '2017-06-23'),
(19, 'fggg', 1, 1, '2017-06-23'),
(20, 'rtg', 1, 1, '2017-06-23'),
(21, 'fgg', 1, 1, '2017-06-23'),
(22, 'dgg', 1, 1, '2017-06-23'),
(23, 'ggg', 1, 1, '2017-06-23'),
(24, 'fjfgjh', 1, 1, '2017-06-23'),
(25, 'jkj', 1, 1, '2017-06-23'),
(26, 'wwwwww', 51, 1, '2017-06-23'),
(27, 'dggfggg', 1, 1, '2017-06-23'),
(28, 'ryy', 1, 1, '2017-06-23'),
(29, 'gu', 1, 1, '2017-06-23'),
(30, 'rf', 1, 1, '2017-06-23'),
(31, 'ddd', 51, 1, '2017-06-23'),
(32, 'jjj', 51, 1, '2017-06-23'),
(33, 'jj', 51, 1, '2017-06-23'),
(34, 'fnvv', 1, 1, '2017-06-23'),
(35, 'dsdsdsdsd', 51, 1, '2017-06-23'),
(36, 'shg', 1, 1, '2017-06-23'),
(37, 'ggjvg', 1, 1, '2017-06-23'),
(38, 'dh', 1, 1, '2017-06-23'),
(39, 'sjf', 1, 1, '2017-06-23'),
(40, 'bosss', 1, 1, '2017-06-23'),
(41, 'sdsd', 51, 1, '2017-06-23'),
(42, 'hello', 1, 1, '2017-06-23'),
(43, 'heloo', 51, 13, '2017-06-23'),
(44, 'yes murungi', 1, 13, '2017-06-23'),
(45, 'Good afternoon', 1, 13, '2017-06-23'),
(46, 'good evening group', 51, 16, '2017-06-23'),
(47, 'fyn ed u', 1, 16, '2017-06-23'),
(48, 'ok', 51, 16, '2017-06-23'),
(49, 'fyn', 1, 16, '2017-06-23'),
(50, 'haha u guys are eating money now days alone', 1, 16, '2017-06-23'),
(51, 'waaa which money are u talking about', 51, 16, '2017-06-23'),
(52, 'good mrng', 51, 13, '2017-06-27'),
(53, 'hi everyone', 51, 13, '2017-06-27'),
(54, 'watsup', 51, 13, '2017-06-27'),
(55, 'tst', 51, 13, '2017-06-27'),
(56, 'checking out notifcations', 51, 13, '2017-06-27'),
(57, 'hh', 51, 13, '2017-06-27'),
(58, 'gg', 51, 13, '2017-06-27'),
(59, 'hghfh', 51, 13, '2017-06-27'),
(60, 'testing', 1, 13, '2017-06-27'),
(61, 'fg', 1, 13, '2017-06-27'),
(62, 'rhg', 1, 13, '2017-06-27'),
(63, 'djdg', 1, 13, '2017-06-27'),
(64, 'Hello', 1, 13, '2017-06-30'),
(65, 'Good morning', 1, 13, '2017-06-30'),
(66, 'hi', 55, 2, '2017-07-07'),
(67, 'hello', 51, 2, '2017-07-07'),
(68, 'gg', 55, 2, '2017-07-07'),
(69, 'whats wrong', 55, 2, '2017-07-07'),
(70, 'yyyy', 51, 2, '2017-07-07'),
(71, 'hii', 17, 18, '2017-08-21'),
(72, 'hello james', 17, 18, '2017-08-21'),
(73, 'hii peter', 17, 18, '2017-08-21');

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
(1, 'Aug 2017', '2017-08-11', 5, 0, 13),
(2, 'sdsdsdsd', '2017-08-11', 5, 1, 13),
(3, 'Feb 2016', '2017-08-12', 8, 0, 11),
(4, 'Aug 2016', '2017-08-12', 8, 0, 11),
(5, 'Feb 2017', '2017-08-12', 8, 0, 11),
(6, 'Aug 2017', '2017-08-12', 8, 0, 11),
(7, '2017 intake', '2017-08-14', 11, 0, 15),
(8, '2017 August', '2017-08-21', 15, 0, 16);

-- --------------------------------------------------------

--
-- Table structure for table `marks`
--

CREATE TABLE `marks` (
  `marks_id` int(11) NOT NULL,
  `reg_number` varchar(100) DEFAULT NULL,
  `mark` int(45) DEFAULT NULL,
  `course_unit` varchar(100) NOT NULL,
  `course_course_id` int(11) DEFAULT NULL,
  `semesters_semester_id` int(11) NOT NULL,
  `academic_years_year_id` int(11) NOT NULL,
  `university_university_id` int(11) DEFAULT NULL,
  `_when_added` date NOT NULL,
  `_who_added` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `marks`
--

INSERT INTO `marks` (`marks_id`, `reg_number`, `mark`, `course_unit`, `course_course_id`, `semesters_semester_id`, `academic_years_year_id`, `university_university_id`, `_when_added`, `_who_added`) VALUES
(1, '13/A/BCS/0887/F', 56, 'BCS123', 3, 1, 1, 13, '2017-08-14', 5),
(2, '13/A/BCS/0887/F', 64, 'BCS132', 3, 1, 1, 13, '2017-08-14', 5),
(3, '13/A/BCS/0887/F', 69, 'BSC156', 3, 1, 1, 13, '2017-08-14', 5),
(4, '13/A/BCS/0887/F', 77, 'BCS176', 3, 1, 1, 13, '2017-08-14', 5),
(5, '13/A/BCS/0887/F', 67, 'BIT000', 3, 1, 1, 13, '2017-08-14', 5),
(6, '13/A/BCS/0887/F', 67, 'BIT344', 3, 1, 1, 13, '2017-08-14', 5),
(7, '13/A/BCS/0887/F', 67, 'BIT456', 3, 1, 1, 13, '2017-08-14', 5),
(8, '13/A/BCS/0887/F', 67, 'BIT412', 3, 1, 1, 13, '2017-08-14', 5),
(9, '13/A/BCS/0887/F', 67, 'BIT562', 3, 1, 1, 13, '2017-08-14', 5),
(10, '13/A/BCS/0887/F', 67, 'BIT461', 3, 1, 1, 13, '2017-08-14', 5),
(11, '13/A/BCS/0887/F', 34, 'BIT956', 3, 1, 1, 13, '2017-08-14', 5),
(12, '13/A/BCS/677/F', 78, 'BCS123', 3, 1, 1, 13, '2017-08-14', 5),
(13, '13/A/BCS/677/F', 90, 'BCS132', 3, 1, 1, 13, '2017-08-14', 5),
(14, '13/A/BCS/677/F', 65, 'BSC156', 3, 1, 1, 13, '2017-08-14', 5),
(15, '13/A/BCS/677/F', 47, 'BCS176', 3, 1, 1, 13, '2017-08-14', 5),
(16, '13/A/BCS/677/F', 23, 'BIT000', 3, 1, 1, 13, '2017-08-14', 5),
(17, '13/A/BCS/677/F', 23, 'BIT344', 3, 1, 1, 13, '2017-08-14', 5),
(18, '13/A/BCS/677/F', 66, 'BIT456', 3, 1, 1, 13, '2017-08-14', 5),
(19, '13/A/BCS/677/F', 44, 'BIT412', 3, 1, 1, 13, '2017-08-14', 5),
(20, '13/A/BCS/677/F', 67, 'BIT562', 3, 1, 1, 13, '2017-08-14', 5),
(21, '13/A/BCS/677/F', 56, 'BIT461', 3, 1, 1, 13, '2017-08-14', 5),
(22, '13/A/BCS/677/F', 54, 'BIT956', 3, 1, 1, 13, '2017-08-14', 5),
(23, '13/A/BCS/566/F', 62, 'BCS123', 3, 1, 1, 13, '2017-08-14', 5),
(24, '13/A/BCS/566/F', 55, 'BCS132', 3, 1, 1, 13, '2017-08-14', 5),
(25, '13/A/BCS/566/F', 65, 'BSC156', 3, 1, 1, 13, '2017-08-14', 5),
(26, '13/A/BCS/566/F', 90, 'BCS176', 3, 1, 1, 13, '2017-08-14', 5),
(27, '13/A/BCS/566/F', 54, 'BIT000', 3, 1, 1, 13, '2017-08-14', 5),
(28, '13/A/BCS/566/F', 54, 'BIT344', 3, 1, 1, 13, '2017-08-14', 5),
(29, '13/A/BCS/566/F', 90, 'BIT456', 3, 1, 1, 13, '2017-08-14', 5),
(30, '13/A/BCS/566/F', 76, 'BIT412', 3, 1, 1, 13, '2017-08-14', 5),
(31, '13/A/BCS/566/F', 71, 'BIT562', 3, 1, 1, 13, '2017-08-14', 5),
(32, '13/A/BCS/566/F', 89, 'BIT461', 3, 1, 1, 13, '2017-08-14', 5),
(33, '13/A/BCS/566/F', 69, 'BIT956', 3, 1, 1, 13, '2017-08-14', 5),
(34, '13/A/BCS/4552/F', 89, 'BCS123', 3, 1, 1, 13, '2017-08-14', 5),
(35, '13/A/BCS/4552/F', 78, 'BCS132', 3, 1, 1, 13, '2017-08-14', 5),
(36, '13/A/BCS/4552/F', 67, 'BSC156', 3, 1, 1, 13, '2017-08-14', 5),
(37, '13/A/BCS/4552/F', 56, 'BCS176', 3, 1, 1, 13, '2017-08-14', 5),
(38, '13/A/BCS/4552/F', 78, 'BIT000', 3, 1, 1, 13, '2017-08-14', 5),
(39, '13/A/BCS/4552/F', 78, 'BIT344', 3, 1, 1, 13, '2017-08-14', 5),
(40, '13/A/BCS/4552/F', 78, 'BIT456', 3, 1, 1, 13, '2017-08-14', 5),
(41, '13/A/BCS/4552/F', 78, 'BIT412', 3, 1, 1, 13, '2017-08-14', 5),
(42, '13/A/BCS/4552/F', 78, 'BIT562', 3, 1, 1, 13, '2017-08-14', 5),
(43, '13/A/BCS/4552/F', 66, 'BIT461', 3, 1, 1, 13, '2017-08-14', 5),
(44, '13/A/BCS/4552/F', 59, 'BIT956', 3, 1, 1, 13, '2017-08-14', 5),
(45, '13/A/BCS/0887/F', 56, 'BCS123', 4, 1, 2, 13, '2017-08-14', 5),
(46, '13/A/BCS/0887/F', 64, 'BCS132', 4, 1, 2, 13, '2017-08-14', 5),
(47, '13/A/BCS/0887/F', 69, 'BSC156', 4, 1, 2, 13, '2017-08-14', 5),
(48, '13/A/BCS/0887/F', 77, 'BCS176', 4, 1, 2, 13, '2017-08-14', 5),
(49, '13/A/BCS/0887/F', 67, 'BIT000', 4, 1, 2, 13, '2017-08-14', 5),
(50, '13/A/BCS/0887/F', 67, 'BIT344', 4, 1, 2, 13, '2017-08-14', 5),
(51, '13/A/BCS/0887/F', 67, 'BIT456', 4, 1, 2, 13, '2017-08-14', 5),
(52, '13/A/BCS/0887/F', 67, 'BIT412', 4, 1, 2, 13, '2017-08-14', 5),
(53, '13/A/BCS/0887/F', 67, 'BIT562', 4, 1, 2, 13, '2017-08-14', 5),
(54, '13/A/BCS/0887/F', 67, 'BIT461', 4, 1, 2, 13, '2017-08-14', 5),
(55, '13/A/BCS/0887/F', 34, 'BIT956', 4, 1, 2, 13, '2017-08-14', 5),
(56, '13/A/BCS/677/F', 78, 'BCS123', 4, 1, 2, 13, '2017-08-14', 5),
(57, '13/A/BCS/677/F', 90, 'BCS132', 4, 1, 2, 13, '2017-08-14', 5),
(58, '13/A/BCS/677/F', 65, 'BSC156', 4, 1, 2, 13, '2017-08-14', 5),
(59, '13/A/BCS/677/F', 47, 'BCS176', 4, 1, 2, 13, '2017-08-14', 5),
(60, '13/A/BCS/677/F', 23, 'BIT000', 4, 1, 2, 13, '2017-08-14', 5),
(61, '13/A/BCS/677/F', 23, 'BIT344', 4, 1, 2, 13, '2017-08-14', 5),
(62, '13/A/BCS/677/F', 66, 'BIT456', 4, 1, 2, 13, '2017-08-14', 5),
(63, '13/A/BCS/677/F', 44, 'BIT412', 4, 1, 2, 13, '2017-08-14', 5),
(64, '13/A/BCS/677/F', 67, 'BIT562', 4, 1, 2, 13, '2017-08-14', 5),
(65, '13/A/BCS/677/F', 56, 'BIT461', 4, 1, 2, 13, '2017-08-14', 5),
(66, '13/A/BCS/677/F', 54, 'BIT956', 4, 1, 2, 13, '2017-08-14', 5),
(67, '13/A/BCS/566/F', 62, 'BCS123', 4, 1, 2, 13, '2017-08-14', 5),
(68, '13/A/BCS/566/F', 55, 'BCS132', 4, 1, 2, 13, '2017-08-14', 5),
(69, '13/A/BCS/566/F', 65, 'BSC156', 4, 1, 2, 13, '2017-08-14', 5),
(70, '13/A/BCS/566/F', 90, 'BCS176', 4, 1, 2, 13, '2017-08-14', 5),
(71, '13/A/BCS/566/F', 54, 'BIT000', 4, 1, 2, 13, '2017-08-14', 5),
(72, '13/A/BCS/566/F', 54, 'BIT344', 4, 1, 2, 13, '2017-08-14', 5),
(73, '13/A/BCS/566/F', 90, 'BIT456', 4, 1, 2, 13, '2017-08-14', 5),
(74, '13/A/BCS/566/F', 76, 'BIT412', 4, 1, 2, 13, '2017-08-14', 5),
(75, '13/A/BCS/566/F', 71, 'BIT562', 4, 1, 2, 13, '2017-08-14', 5),
(76, '13/A/BCS/566/F', 89, 'BIT461', 4, 1, 2, 13, '2017-08-14', 5),
(77, '13/A/BCS/566/F', 69, 'BIT956', 4, 1, 2, 13, '2017-08-14', 5),
(78, '13/A/BCS/4552/F', 89, 'BCS123', 4, 1, 2, 13, '2017-08-14', 5),
(79, '13/A/BCS/4552/F', 78, 'BCS132', 4, 1, 2, 13, '2017-08-14', 5),
(80, '13/A/BCS/4552/F', 67, 'BSC156', 4, 1, 2, 13, '2017-08-14', 5),
(81, '13/A/BCS/4552/F', 56, 'BCS176', 4, 1, 2, 13, '2017-08-14', 5),
(82, '13/A/BCS/4552/F', 78, 'BIT000', 4, 1, 2, 13, '2017-08-14', 5),
(83, '13/A/BCS/4552/F', 78, 'BIT344', 4, 1, 2, 13, '2017-08-14', 5),
(84, '13/A/BCS/4552/F', 78, 'BIT456', 4, 1, 2, 13, '2017-08-14', 5),
(85, '13/A/BCS/4552/F', 78, 'BIT412', 4, 1, 2, 13, '2017-08-14', 5),
(86, '13/A/BCS/4552/F', 78, 'BIT562', 4, 1, 2, 13, '2017-08-14', 5),
(87, '13/A/BCS/4552/F', 66, 'BIT461', 4, 1, 2, 13, '2017-08-14', 5),
(88, '13/A/BCS/4552/F', 59, 'BIT956', 4, 1, 2, 13, '2017-08-14', 5),
(89, '13/A/BCS/0887/F', 56, 'BCS123', 16, 1, 8, 15, '2017-08-14', 11),
(90, '13/A/BCS/0887/F', 64, 'BCS132', 16, 1, 8, 15, '2017-08-14', 11),
(91, '13/A/BCS/0887/F', 69, 'BSC156', 16, 1, 8, 15, '2017-08-14', 11),
(92, '13/A/BCS/0887/F', 77, 'BCS176', 16, 1, 8, 15, '2017-08-14', 11),
(93, '13/A/BCS/0887/F', 67, 'BIT000', 16, 1, 8, 15, '2017-08-14', 11),
(94, '13/A/BCS/0887/F', 67, 'BIT344', 16, 1, 8, 15, '2017-08-14', 11),
(95, '13/A/BCS/0887/F', 67, 'BIT456', 16, 1, 8, 15, '2017-08-14', 11),
(96, '13/A/BCS/0887/F', 67, 'BIT412', 16, 1, 8, 15, '2017-08-14', 11),
(97, '13/A/BCS/0887/F', 67, 'BIT562', 16, 1, 8, 15, '2017-08-14', 11),
(98, '13/A/BCS/0887/F', 67, 'BIT461', 16, 1, 8, 15, '2017-08-14', 11),
(99, '13/A/BCS/0887/F', 34, 'BIT956', 16, 1, 8, 15, '2017-08-14', 11),
(100, '13/A/BCS/677/F', 78, 'BCS123', 16, 1, 8, 15, '2017-08-14', 11),
(101, '13/A/BCS/677/F', 90, 'BCS132', 16, 1, 8, 15, '2017-08-14', 11),
(102, '13/A/BCS/677/F', 65, 'BSC156', 16, 1, 8, 15, '2017-08-14', 11),
(103, '13/A/BCS/677/F', 47, 'BCS176', 16, 1, 8, 15, '2017-08-14', 11),
(104, '13/A/BCS/677/F', 23, 'BIT000', 16, 1, 8, 15, '2017-08-14', 11),
(105, '13/A/BCS/677/F', 23, 'BIT344', 16, 1, 8, 15, '2017-08-14', 11),
(106, '13/A/BCS/677/F', 66, 'BIT456', 16, 1, 8, 15, '2017-08-14', 11),
(107, '13/A/BCS/677/F', 44, 'BIT412', 16, 1, 8, 15, '2017-08-14', 11),
(108, '13/A/BCS/677/F', 67, 'BIT562', 16, 1, 8, 15, '2017-08-14', 11),
(109, '13/A/BCS/677/F', 56, 'BIT461', 16, 1, 8, 15, '2017-08-14', 11),
(110, '13/A/BCS/677/F', 54, 'BIT956', 16, 1, 8, 15, '2017-08-14', 11),
(111, '13/A/BCS/566/F', 62, 'BCS123', 16, 1, 8, 15, '2017-08-14', 11),
(112, '13/A/BCS/566/F', 55, 'BCS132', 16, 1, 8, 15, '2017-08-14', 11),
(113, '13/A/BCS/566/F', 65, 'BSC156', 16, 1, 8, 15, '2017-08-14', 11),
(114, '13/A/BCS/566/F', 90, 'BCS176', 16, 1, 8, 15, '2017-08-14', 11),
(115, '13/A/BCS/566/F', 54, 'BIT000', 16, 1, 8, 15, '2017-08-14', 11),
(116, '13/A/BCS/566/F', 54, 'BIT344', 16, 1, 8, 15, '2017-08-14', 11),
(117, '13/A/BCS/566/F', 90, 'BIT456', 16, 1, 8, 15, '2017-08-14', 11),
(118, '13/A/BCS/566/F', 76, 'BIT412', 16, 1, 8, 15, '2017-08-14', 11),
(119, '13/A/BCS/566/F', 71, 'BIT562', 16, 1, 8, 15, '2017-08-14', 11),
(120, '13/A/BCS/566/F', 89, 'BIT461', 16, 1, 8, 15, '2017-08-14', 11),
(121, '13/A/BCS/566/F', 69, 'BIT956', 16, 1, 8, 15, '2017-08-14', 11),
(122, '13/A/BCS/4552/F', 89, 'BCS123', 16, 1, 8, 15, '2017-08-14', 11),
(123, '13/A/BCS/4552/F', 78, 'BCS132', 16, 1, 8, 15, '2017-08-14', 11),
(124, '13/A/BCS/4552/F', 67, 'BSC156', 16, 1, 8, 15, '2017-08-14', 11),
(125, '13/A/BCS/4552/F', 56, 'BCS176', 16, 1, 8, 15, '2017-08-14', 11),
(126, '13/A/BCS/4552/F', 78, 'BIT000', 16, 1, 8, 15, '2017-08-14', 11),
(127, '13/A/BCS/4552/F', 78, 'BIT344', 16, 1, 8, 15, '2017-08-14', 11),
(128, '13/A/BCS/4552/F', 78, 'BIT456', 16, 1, 8, 15, '2017-08-14', 11),
(129, '13/A/BCS/4552/F', 78, 'BIT412', 16, 1, 8, 15, '2017-08-14', 11),
(130, '13/A/BCS/4552/F', 78, 'BIT562', 16, 1, 8, 15, '2017-08-14', 11),
(131, '13/A/BCS/4552/F', 66, 'BIT461', 16, 1, 8, 15, '2017-08-14', 11),
(132, '13/A/BCS/4552/F', 59, 'BIT956', 16, 1, 8, 15, '2017-08-14', 11),
(133, '13/a/bit/0882/w', 56, 'BCS123', 2, 1, 1, 13, '2017-08-20', 5),
(134, '13/a/bit/0882/w', 64, 'BCS132', 2, 1, 1, 13, '2017-08-20', 5),
(135, '13/a/bit/0882/w', 69, 'BSC156', 2, 1, 1, 13, '2017-08-20', 5),
(136, '13/a/bit/0882/w', 77, 'BCS176', 2, 1, 1, 13, '2017-08-20', 5),
(137, '13/a/bit/0882/w', 67, 'BIT000', 2, 1, 1, 13, '2017-08-20', 5),
(138, '13/a/bit/0882/w', 67, 'BIT344', 2, 1, 1, 13, '2017-08-20', 5),
(139, '13/a/bit/0882/w', 67, 'BIT456', 2, 1, 1, 13, '2017-08-20', 5),
(140, '13/a/bit/0882/w', 67, 'BIT412', 2, 1, 1, 13, '2017-08-20', 5),
(141, '13/a/bit/0882/w', 67, 'BIT562', 2, 1, 1, 13, '2017-08-20', 5),
(142, '13/a/bit/0882/w', 67, 'BIT461', 2, 1, 1, 13, '2017-08-20', 5),
(143, '13/a/bit/0882/w', 34, 'BIT956', 2, 1, 1, 13, '2017-08-20', 5),
(144, '17/A/BIT/1111/F', 89, 'BIT 167', 20, 1, 9, 16, '2017-08-21', 15),
(145, '17/A/BIT/1111/F', 47, 'BIT 934', 20, 1, 9, 16, '2017-08-21', 15),
(146, '17/A/BIT/1111/F', 63, 'BIT555', 20, 1, 9, 16, '2017-08-21', 15),
(147, '17/A/BIT/1111/F', 89, 'BIT 167', 20, 1, 9, 16, '2017-08-21', 15),
(148, '17/A/BIT/1111/F', 47, 'BIT 934', 20, 1, 9, 16, '2017-08-21', 15),
(149, '17/A/BIT/1111/F', 63, 'BIT555', 20, 1, 9, 16, '2017-08-21', 15),
(150, '17/A/BIT/1111/F', 89, 'BIT 167', 20, 1, 9, 16, '2017-08-21', 15),
(151, '17/A/BIT/1111/F', 47, 'BIT 934', 20, 1, 9, 16, '2017-08-21', 15),
(152, '17/A/BIT/1111/F', 63, 'BIT555', 20, 1, 9, 16, '2017-08-21', 15);

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `menu_id` int(11) NOT NULL,
  `menu_name` varchar(50) DEFAULT NULL,
  `menu_class` varchar(50) NOT NULL,
  `menu_link` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`menu_id`, `menu_name`, `menu_class`, `menu_link`) VALUES
(1, 'User Management', 'users_controller', '#'),
(3, 'Academic Years', 'yearcontroller', '#'),
(4, 'Students', 'students_controller', '#'),
(5, 'Marks', 'marks_controller', '#'),
(6, 'Complaints', 'complaint_controller', '#'),
(8, 'Campus News', 'news_controller', '#'),
(9, 'Campus Events', 'events_controller', '#'),
(10, 'Student Registration', 'registrationcontroller', '#'),
(11, 'Courses', 'course_controller', '#'),
(12, 'Course Units', 'units_controller', '#'),
(13, 'Menu Management', 'developer', '#'),
(14, 'Universities', 'dashboard', '#'),
(15, 'System Menu', 'menu_controller', '#'),
(17, 'Suggestion Box', 'suggestion_controller', '#'),
(18, 'Counselling', 'counsel_controller', '#'),
(19, 'Grading', 'grading_controller', '#'),
(20, 'Mini statements', '', '#'),
(21, 'Social Network', 'chat_controller', '#');

-- --------------------------------------------------------

--
-- Table structure for table `menu_assignments`
--

CREATE TABLE `menu_assignments` (
  `assignmet_id` int(11) NOT NULL,
  `menu_id` int(11) DEFAULT NULL,
  `user_group_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `menu_assignments`
--

INSERT INTO `menu_assignments` (`assignmet_id`, `menu_id`, `user_group_id`) VALUES
(56, 13, 4),
(57, 14, 4),
(59, 3, 8),
(60, 15, 8),
(61, 1, 8),
(62, 4, 8),
(63, 3, 9),
(64, 5, 8),
(65, 6, 8),
(66, 8, 8),
(67, 9, 8),
(68, 10, 8),
(69, 11, 8),
(70, 12, 8),
(71, 1, 10),
(73, 15, 10),
(74, 3, 10),
(75, 4, 10),
(76, 5, 10),
(77, 6, 10),
(78, 8, 10),
(79, 9, 10),
(80, 10, 10),
(81, 11, 10),
(82, 12, 10),
(83, 17, 8),
(84, 18, 8),
(85, 19, 8),
(86, 17, 10),
(87, 18, 10),
(88, 19, 10),
(89, 15, 11),
(90, 1, 11),
(91, 3, 11),
(92, 4, 11),
(93, 5, 11),
(94, 6, 11),
(95, 8, 11),
(96, 9, 11),
(97, 10, 11),
(98, 11, 11),
(99, 12, 11),
(100, 17, 11),
(101, 18, 11),
(102, 19, 11),
(103, 15, 12),
(104, 1, 12),
(105, 3, 12),
(106, 4, 12),
(107, 5, 12),
(108, 6, 12),
(109, 8, 12),
(110, 9, 12),
(111, 10, 12),
(112, 11, 12),
(113, 12, 12),
(114, 17, 12),
(115, 18, 12),
(116, 19, 12),
(117, 20, 8),
(118, 20, 12),
(119, 15, 16),
(120, 1, 16),
(121, 3, 16),
(122, 4, 16),
(123, 5, 16),
(124, 6, 16),
(125, 8, 16),
(126, 9, 16),
(127, 10, 16),
(128, 11, 16),
(129, 12, 16),
(130, 17, 16),
(131, 18, 16),
(132, 19, 16),
(133, 20, 16),
(134, 21, 16);

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

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`message_id`, `message`, `student_student_id`, `_when_added`) VALUES
(30, 'Man where are I have been lookin for u the whole day', 1, '2017-06-22 14:01:22'),
(31, 'Am at home trying to do my course work', 51, '2017-06-22 14:02:59'),
(32, 'ok that''s fyn', 1, '2017-06-22 14:03:27'),
(33, 'sawa', 51, '2017-06-22 14:03:44'),
(34, 'where should we meet from this evening', 1, '2017-06-22 14:04:31'),
(35, 'Kasaburaka', 51, '2017-06-22 14:04:46'),
(36, 'haha', 1, '2017-06-22 14:04:58'),
(37, 'sawa', 1, '2017-06-22 19:11:29'),
(38, 'But what are u guy coming because for us we are already in place', 51, '2017-06-22 19:18:06'),
(39, 'am not sure yet', 1, '2017-06-22 19:18:28'),
(40, 'sawa man', 51, '2017-06-22 19:18:51'),
(41, 'See u tommorrow', 51, '2017-06-22 19:19:08'),
(42, 'kale', 51, '2017-06-22 19:19:45'),
(43, 'ok', 51, '2017-06-22 19:26:30'),
(44, 'o', 1, '2017-06-22 19:32:02'),
(45, 'haha', 1, '2017-06-22 19:32:22'),
(46, 'ok bro', 1, '2017-06-22 19:33:17'),
(47, 'ok boss we meet next Monday of this month', 1, '2017-06-22 19:52:27'),
(48, 'sawa', 51, '2017-06-22 19:52:51'),
(49, 'ok', 1, '2017-06-22 19:53:01'),
(50, 'Good morning everyone', 1, '2017-06-23 04:52:42'),
(51, 'no messages yet', 1, '2017-06-23 05:37:50');

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
  `views_count` int(50) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`news_id`, `title`, `news_detail`, `image`, `_when_added`, `_who_added`, `university_university_id`, `views_count`) VALUES
(1, 'HARVARD: STUDENTS WANT HELP FIND NEW PRESIDENT', ' For the purposes of what you are trying to do, get_result() is unnecessary. You don''t need to create a new variable to contain the bind_result() .', 'facebook.jpg', '2017-08-11', 5, 13, 2),
(2, 'Hello world', '<p>Hello world is the first program normally written by programmers that are new to a paticular programming language.&nbsp;</p>\r\n', NULL, '2017-08-14', 11, 15, 0),
(3, 'Hello world', '<p>Hello world is the first program normally written by programmers that are new to a paticular programming language.&nbsp;</p>\r\n', NULL, '2017-08-14', 11, 15, 0),
(4, 'HARVARD: STUDENTS WANT HELP FIND NEW PRESIDENT', ' For the purposes of what you are trying to do, get_result() is unnecessary. You don''t need to create a new variable to contain the bind_result() .', 'skysports-james-haskell-lions-rugby-union_3981819.jpg', '2017-08-11', 5, 13, 2),
(5, 'HARVARD: STUDENTS WANT HELP FIND NEW PRESIDENT', ' For the purposes of what you are trying to do, get_result() is unnecessary. You don''t need to create a new variable to contain the bind_result() .', 'facebook.jpg', '2017-08-11', 5, 13, 1);

-- --------------------------------------------------------

--
-- Table structure for table `registered_academic_years`
--

CREATE TABLE `registered_academic_years` (
  `registered_academic_years_id` int(11) NOT NULL,
  `academic_years_years_id` int(11) DEFAULT NULL,
  `student_student_id` int(11) DEFAULT NULL,
  `semester_semester_id` int(11) DEFAULT NULL,
  `_when_added` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `registered_academic_years`
--

INSERT INTO `registered_academic_years` (`registered_academic_years_id`, `academic_years_years_id`, `student_student_id`, `semester_semester_id`, `_when_added`) VALUES
(1, 1, 2, 1, '2017-08-16'),
(2, 1, 3, 1, '2017-08-25'),
(3, 1, 4, 1, '2017-08-30'),
(4, 1, 7, 1, '2017-08-13'),
(5, 1, 10, 1, '2017-08-14'),
(6, 2, 2, 2, '2017-08-17'),
(7, 8, 15, 1, '2017-08-17'),
(8, 8, 16, 1, '2017-08-17'),
(9, 8, 14, 1, '2017-08-17'),
(10, 8, 13, 1, '2017-08-17'),
(11, 8, 12, 1, '2017-08-17'),
(12, 2, 2, 1, '2017-08-17'),
(13, 1, 2, 2, '2017-08-17'),
(14, 9, 17, 1, '2017-08-21'),
(15, 9, 17, 2, '2017-08-22');

-- --------------------------------------------------------

--
-- Table structure for table `registered_course_units`
--

CREATE TABLE `registered_course_units` (
  `reg_course_units_id` int(11) NOT NULL,
  `course_units_units_id` int(11) DEFAULT NULL,
  `student_student_id` int(11) NOT NULL,
  `registered_academic_years_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `registered_course_units`
--

INSERT INTO `registered_course_units` (`reg_course_units_id`, `course_units_units_id`, `student_student_id`, `registered_academic_years_id`) VALUES
(1, 1, 1, 1),
(2, 2, 1, 1),
(3, 3, 1, 1),
(4, 11, 1, 1),
(7, 8, 1, 2),
(8, 11, 1, 2),
(9, 6, 1, 2),
(10, 3, 1, 2),
(11, 5, 1, 1),
(12, 17, 51, 5),
(13, 15, 51, 5),
(14, 14, 51, 5),
(15, 16, 51, 5),
(16, 13, 51, 5),
(17, 12, 51, 5),
(18, 36, 55, 7),
(19, 31, 55, 7),
(20, 29, 55, 7),
(21, 28, 55, 7),
(22, 27, 55, 7),
(23, 26, 55, 7),
(24, 30, 55, 7),
(25, 26, 1, 8),
(26, 28, 1, 8),
(27, 29, 1, 8),
(28, 3, 2, 12),
(29, 9, 2, 12),
(30, 5, 2, 12),
(31, 1, 2, 6),
(32, 33, 17, 14),
(33, 32, 17, 14),
(34, 36, 17, 15),
(35, 35, 17, 15);

-- --------------------------------------------------------

--
-- Table structure for table `retakes`
--

CREATE TABLE `retakes` (
  `retake_id` int(11) NOT NULL,
  `marks_marks_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `student_id` int(11) NOT NULL,
  `registration_number` varchar(100) DEFAULT NULL,
  `firstName` varchar(100) DEFAULT NULL,
  `lastName` varchar(100) DEFAULT NULL,
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
  `status` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`student_id`, `registration_number`, `firstName`, `lastName`, `gender`, `contact`, `email`, `photo`, `password`, `universities_university_id`, `courses_course_id`, `_when_added`, `_who_added`, `intake_intake_id`, `status`) VALUES
(2, '13/a/bit/0882/w', 'Tugume ', 'patrick', 'Male', '756667676', 'patrick@gmail.com', NULL, '123456', 13, 2, '2017-08-10', 5, 1, 0),
(3, '13/a/bit/0883/w', 'Musimeta', 'Sam', 'Male', '785754672', 'sam@yahoo.com', NULL, '123456', 13, 2, '2017-08-10', 5, 1, 0),
(4, '13/a/bit/0884/w', 'Huza', 'Jennifer', 'Female', '775665541', 'huza@hotmail.com', NULL, '123456', 13, 2, '2017-08-10', 5, 1, 0),
(5, '13/a/bit/0885/w', 'Igabire ', 'Bridget', 'Female', '715665443', 'bridget@gmail.com', NULL, '123456', 13, 2, '2017-08-10', 5, 1, 0),
(6, '13/a/bit/0886/w', 'Igoma', 'Julius', 'Male', '787665642', 'julius@gmail.com', NULL, '123456', 13, 2, '2017-08-10', 5, 1, 0),
(7, '13/a/bit/0887/w', 'Asiimwe', 'Job', 'Male', '754436287', 'jobassimwe@hotmail', NULL, '123456', 13, 2, '2017-08-10', 5, 1, 0),
(8, '13/A/BCS/677/F', 'Kasalure', 'Jane', 'Female', '756667676', 'jane@gmail.com', NULL, '123456', 13, 3, '2017-08-14', 5, 1, 0),
(9, '13/A/BCS/566/F', 'Mugisha', 'Oliva', 'Female', '785754672', 'oliva@hotmail.com', NULL, '123456', 13, 3, '2017-08-14', 5, 1, 0),
(10, '13/A/BCS/4552/F', 'Musiime', 'joash', 'Male', '775665541', 'joash@yahoo.com', NULL, '123456', 13, 3, '2017-08-14', 5, 1, 0),
(11, '13/A/BCS/677/F', 'Kasalure', 'Jane', 'Female', '756667676', 'jane@gmail.com', NULL, '123456', 13, 5, '2017-08-14', 5, 1, 0),
(12, '13/A/BCS/566/F', 'Mugisha', 'Oliva', 'Female', '785754672', 'oliva@hotmail.com', NULL, '123456', 13, 5, '2017-08-14', 5, 1, 0),
(13, '13/A/BCS/4552/F', 'Musiime', 'joash', 'Male', '775665541', 'joash@yahoo.com', NULL, '123456', 13, 5, '2017-08-14', 5, 1, 0),
(14, '13/A/BCS/677/F', 'Kasalure', 'Jane', 'Female', '756667676', 'jane@gmail.com', NULL, '123456', 15, 16, '2017-08-14', 11, 7, 0),
(15, '13/A/BCS/566/F', 'Mugisha', 'Oliva', 'Female', '785754672', 'oliva@hotmail.com', NULL, '123456', 15, 16, '2017-08-14', 11, 7, 0),
(16, '13/A/BCS/4552/F', 'Musiime', 'joash', 'Male', '775665541', 'joash@yahoo.com', NULL, '123456', 15, 16, '2017-08-14', 11, 7, 0),
(17, '17/A/BIT/1111/F', 'Ingabire', 'Bridget', 'Female', '77866565', 'bridget@gmail.com', NULL, '123456', 16, 20, '2017-08-21', 15, 8, 0),
(18, '17/a/bit/728/w', 'Solomon', 'Abeho', 'Male', '6756655', 'solomon@gmail.com', NULL, '123456', 16, 20, '2017-08-21', 15, 8, 0),
(19, '17/a/bit/567/w', 'Atuhire', 'Joan', 'Femal', '7876658', 'joan@gmail.com', NULL, '123456', 16, 20, '2017-08-21', 15, 8, 0),
(20, '17/a/bit/537/f', 'Mugashu', 'Peter', 'Male', '70876654', 'peter@gmail.com', NULL, '123456', 16, 20, '2017-08-21', 15, 8, 0),
(21, '17/a/bit/257/w', 'Mose', 'Musooke', 'Male', '678776', 'musooke@yahoo.com', NULL, '123456', 16, 20, '2017-08-21', 15, 8, 0),
(22, '17/a/bit/6675/f', 'Atuhaire', 'Sofia', 'Female', '8776656', 'sofia@gamil.com', NULL, '123456', 16, 20, '2017-08-21', 15, 8, 0),
(23, '17/a/bit/8957/w', 'Anita', 'Kemigisha', 'Female', '6877665', 'kem@gmail.com', NULL, '123456', 16, 20, '2017-08-21', 15, 8, 0),
(24, '17/a/bit/227/w', 'Fatima', 'Komugisha', 'Male', '78665549', 'fat@gmail.com', NULL, '123456', 16, 20, '2017-08-21', 15, 8, 0),
(25, '17/a/bit/663/w', 'Faith', 'Namuga', 'Female', '7866567', 'faith@yahoo.com', NULL, '123456', 16, 20, '2017-08-21', 15, 8, 0),
(26, '17/a/bit/6364/w', 'Kato', 'Lugwama', 'Male', '7788766', 'kato@yaoo.com', NULL, '123456', 16, 20, '2017-08-21', 15, 8, 0),
(27, '17/a/bit/634/f', 'James', 'Omala', 'Male', '716643434', 'james@yahoo.com', NULL, '123456', 16, 20, '2017-08-21', 15, 8, 0),
(28, '17/a/bit/3441/w', 'Bob', 'Muragira', 'Male', '7754348', 'bob@gmail.com', NULL, '123456', 16, 20, '2017-08-21', 15, 8, 0),
(29, '17/a/bit/6534/w', 'Robert', 'Tumusime', 'Male', '7565544', 'robert@gmail.com', NULL, '123456', 16, 20, '2017-08-21', 15, 8, 0),
(30, '13/a/bit/4561/f', 'Isigoma', 'patrick', 'Male', '5665434367', 'ispatrick@gmail.com', NULL, '123456', 16, 20, '2017-08-21', 15, 8, 0);

-- --------------------------------------------------------

--
-- Table structure for table `sub_menu`
--

CREATE TABLE `sub_menu` (
  `	sub_menu_id` int(11) NOT NULL,
  `sub_menu_name` varchar(50) DEFAULT NULL,
  `sub_menu_link` varchar(100) DEFAULT NULL,
  `menu_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sub_menu`
--

INSERT INTO `sub_menu` (`	sub_menu_id`, `sub_menu_name`, `sub_menu_link`, `menu_id`) VALUES
(4, 'Academic Years', 'years/yearcontroller/academicYears', 3),
(5, 'Courses', 'courses/course_controller/courses', 11),
(6, 'Students', 'students/students_controller/view_students', 4),
(7, 'View Marks', 'marks/marks_controller/view_marks', 5),
(8, 'Categories', 'complaints/complaint_controller/categories', 6),
(11, 'News', 'news/news_controller', 8),
(12, 'Events', 'news/events_controller', 9),
(13, 'Registered Students', 'registration/registrationcontroller', 10),
(14, 'Intakes', 'years/yearcontroller/intakes', 3),
(15, 'Upload Courses', 'courses/course_controller/add_course', 11),
(16, 'upload Course Units', 'course_units/units_controller/add_courseUnits', 12),
(17, 'View Course Units', 'course_units/units_controller/view_units', 12),
(18, 'Upload Marks', 'marks/marks_controller/upload_marks', 5),
(19, 'Upload Students', 'students/students_controller/add_students', 4),
(20, 'Assigned', 'course_units/units_controller/assigned_units', 12),
(21, 'Assign', 'course_units/units_controller/assign_Units', 12),
(22, 'Add menu', 'developer/developer', 13),
(23, 'Assign User Menu', 'auth/assign_menus', 13),
(24, 'Universities', 'admin/dashboard/universities', 14),
(25, 'Assign User Menu', 'menu/menu_controller/assign_menus', 15),
(26, 'User Groups', 'usermgt/users_controller/user_groups', 1),
(27, 'Users', 'usermgt/users_controller/users', 1),
(28, 'Pending', 'complaints/complaint_controller/pending_complaints', 6),
(29, 'Replied', 'complaints/complaint_controller/cleared', 6),
(30, 'Unread Suggestions', 'suggestions/suggestion_controller', 17),
(31, 'read Suggestions', 'suggestions/suggestion_controller/read_suggestions', 17),
(33, 'Add Grading', 'grading/grading_controller/upload_grading', 19),
(34, 'View Grading', 'grading/grading_controller/view_grading', 19),
(35, 'Generate statements', 'marks/marks_controller/fetch_statement', 20),
(36, 'Counselors', 'counsel/counsel_controller/counsellors', 18),
(37, 'Chat Groups', 'chat/chat_controller/show_groups', 21);

-- --------------------------------------------------------

--
-- Table structure for table `suggestion_box`
--

CREATE TABLE `suggestion_box` (
  `suggestion_box_id` int(11) NOT NULL,
  `suggestion` longtext,
  `student_student_id` int(11) NOT NULL,
  `university_university_id` int(11) DEFAULT NULL,
  `sent_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `_status` int(11) NOT NULL DEFAULT '0' COMMENT 'determines read suggesstions'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `suggestion_box`
--

INSERT INTO `suggestion_box` (`suggestion_box_id`, `suggestion`, `student_student_id`, `university_university_id`, `sent_time`, `_status`) VALUES
(1, 'as suggested by another for someone asking the same question, though this method leaves me with "Array" inside of the column instead of any numbers no matter what is selected.\r\n\r\nI tried to post some pictures to better explain, but it will not allow me. I''m no SQL or PHP professional, just trying to learn as much as I need to get this database going fairly quickly. If there is a solution to this issue, please enlighten me.\r\n\r\nHere is the code I am using for the action script on submit:\r\nAs suggested by another for someone asking the same question, though this method leaves me with "Array" inside of the column instead of any numbers no matter what is selected. I tried to post some pictures to better explain, but it will not allow me. I''m no SQL or PHP professional, just trying to learn as much as I need to get this database going fairly quickly. If there is a solution to this issue, please enlighten me. Here is the code I am using for the action script on submit:\r\nAs suggested by another for someone asking the same question, though this method leaves me with "Array" inside of the column instead of any numbers no matter what is selected. I tried to post some pictures to better explain, but it will not allow me. I''m no SQL or PHP professional, just trying to learn as much as I need to get this database going fairly quickly. If there is a solution to this issue, please enlighten me. Here is the code I am using for the action script on submit:\r\nAs suggested by another for someone asking the same question, though this method leaves me with "Array" inside of the column instead of any numbers no matter what is selected. I tried to post some pictures to better explain, but it will not allow me. I''m no SQL or PHP professional, just trying to learn as much as I need to get this database going fairly quickly. If there is a solution to this issue, please enlighten me. Here is the code I am using for the action script on submit:\r\nAs suggested by another for someone asking the same question, though this method leaves me with "Array" inside of the column instead of any numbers no matter what is selected. I tried to post some pictures to better explain, but it will not allow me. I''m no SQL or PHP professional, just trying to learn as much as I need to get this database going fairly quickly. If there is a solution to this issue, please enlighten me. Here is the code I am using for the action script on submit:', 4, 13, '2017-08-22 21:00:00', 1),
(2, 'jadscfjdsjfjdsfjdsjf', 7, 13, '2017-08-15 02:10:09', 1),
(3, 'posting a suggestion to my inbox', 2, 13, NULL, 0),
(4, 'posting a suggestion to my inbox', 2, 13, NULL, 0),
(5, 'posting a suggestion to my inbox', 2, 13, NULL, 0),
(6, 'cgvvbbbbb', 2, 13, '2017-08-18 11:33:08', 0),
(7, 'posting suggestion', 2, 13, '2017-08-18 11:37:58', 0),
(8, 'fgvvvvvv', 2, 13, '2017-08-18 11:40:17', 0);

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
(1, 'sdsdsd', 1, 4, '2017-08-13 06:36:28'),
(2, 'testing the reply', 1, 5, '2017-08-13 06:43:43'),
(3, 'sdsdsd', 1, 5, '2017-08-13 06:47:22'),
(4, 'sdsdsd', 1, 5, '2017-08-13 06:47:29'),
(5, 'hhhhhhhhhhhhhhhhhhhhhhhhhhh', 2, 5, '2017-08-13 07:05:48');

-- --------------------------------------------------------

--
-- Table structure for table `tokens`
--

CREATE TABLE `tokens` (
  `token_id` int(11) NOT NULL,
  `token` varchar(200) DEFAULT NULL,
  `student_student_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tokens`
--

INSERT INTO `tokens` (`token_id`, `token`, `student_student_id`) VALUES
(7, 'duyOUPMR2Ws:APA91bGSADc-WftgV0pEodrOVWtG03sHNmVSJ_TrBXslLweA89-I6oPbszka3D1Dh9Bl6PIWDXgPZOKDUgAZHGiUCkBEjXR2aV_eteqdeoBa0aH6XpYw2pWSc1p7nFdmdrC1Y5Fxtkho', 51),
(8, 'edEsILiywv4:APA91bEg6ulXOQtijTObrDrPFgQksIehlyKdUxsXqu9EPiMKA6wkVStb5ZRE_fou8bI4c_OI7B9kPXdLyh3uboVMDVlUx-9-i9cJ-DZbfEVD0cOs4n5-kGKk_2UofHAeTMiBcONr5Z7y', 1);

-- --------------------------------------------------------

--
-- Table structure for table `universities`
--

CREATE TABLE `universities` (
  `university_id` int(11) NOT NULL,
  `university` varchar(100) DEFAULT NULL,
  `short_name` varchar(100) NOT NULL,
  `when_added` datetime NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `universities`
--

INSERT INTO `universities` (`university_id`, `university`, `short_name`, `when_added`, `status`) VALUES
(1, 'Makerere University', 'MUK', '2017-05-10 03:13:10', 0),
(2, 'Uganda Christian University', 'UCU', '2017-05-18 11:19:19', 0),
(3, 'Kabale University', 'KAB', '0000-00-00 00:00:00', 0),
(4, 'Uganda Technology and Management University', 'UTAMU', '0000-00-00 00:00:00', 0),
(5, 'Nkumba University', 'NUB', '0000-00-00 00:00:00', 0),
(8, 'kyambogo University', 'KYU', '0000-00-00 00:00:00', 0),
(9, 'Ndeeje University', 'NU', '0000-00-00 00:00:00', 1),
(10, 'Busitema University', 'BU', '0000-00-00 00:00:00', 0),
(11, 'Kabale University', 'KAB', '0000-00-00 00:00:00', 0),
(12, 'Gulu University', 'GU', '0000-00-00 00:00:00', 0),
(13, 'Mbarara University Of Science and Technology', 'MUST', '0000-00-00 00:00:00', 0),
(14, 'jjj', 'hh', '0000-00-00 00:00:00', 1),
(15, 'Mbale Management University', 'MMU', '0000-00-00 00:00:00', 0),
(16, 'Mountains of The Moon University', 'MOU', '0000-00-00 00:00:00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `firstName` varchar(100) DEFAULT NULL,
  `lastName` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `contact` varchar(50) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `last_login` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `firstName`, `lastName`, `email`, `contact`, `group_id`, `password`, `status`, `last_login`) VALUES
(4, 'Igeti ', 'Debrah', 'igeti@gmail.com', '078773434', 4, '123456', 0, '2017-08-21 11:51:13'),
(5, 'Igoma', 'Julius', 'julius@gmail.com', '0705545746', 8, '123456', 0, '2017-08-20 17:47:26'),
(6, 'Kemirebe', 'Joshua', 'joshua@gmail.com', '075765544', 9, '123456', 0, '2017-08-18 11:51:18'),
(7, 'Tugume', 'Patrick', 'patrick@yahoo.com', '0756555337', 8, '123456', 1, '2017-08-18 11:51:18'),
(8, 'Namanya', 'Abert', 'abertnamanya@gmail.com', '0754938667', 10, '123456', 0, '2017-08-18 11:51:18'),
(9, 'Mugisha', 'james', 'james@hotmail.com', '07666669', 8, '123456', 0, '2017-08-18 11:51:18'),
(10, 'Byarugaba', 'steven', 'steven@gmail.com', '0785554444', 11, '123456', 0, '2017-08-18 11:51:18'),
(11, 'Byarugaba', 'Stephen', 'byarus45@gmail.com', '07056554434', 12, '123456', 0, '2017-08-18 11:51:18'),
(13, 'Sekitoleko', 'William', 'wiliam@gmail.com', '07043442244', 15, '123456', 0, '2017-08-18 11:51:18'),
(14, 'Martin', 'moses', 'moses@gmail.com', '07095999394', 13, '123456', 0, '2017-08-18 11:51:18'),
(15, 'Mugisha', 'john', 'john@gmail.com', '07056755567', 16, '123456', 0, '2017-08-23 14:00:11');

-- --------------------------------------------------------

--
-- Table structure for table `user_groups`
--

CREATE TABLE `user_groups` (
  `group_id` int(11) NOT NULL,
  `group_name` varchar(100) DEFAULT NULL,
  `university_id` int(11) DEFAULT NULL,
  `system_controller` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_groups`
--

INSERT INTO `user_groups` (`group_id`, `group_name`, `university_id`, `system_controller`) VALUES
(4, 'Super User', NULL, 1),
(8, 'MUST Administrator', 13, 1),
(9, ' Registrar', 13, 0),
(10, 'KAB System Administrator', 11, 1),
(11, 'GU System Controller', 12, 1),
(12, 'MMU System administrator', 15, 1),
(13, ' Results manager', 15, 0),
(14, ' admision executives', 15, 0),
(15, ' Events ', 15, 0),
(16, 'MOU System Assitant', 16, 1);

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
-- Indexes for table `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`appointment_id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `university_id` (`university_id`);

--
-- Indexes for table `assigned_units`
--
ALTER TABLE `assigned_units`
  ADD PRIMARY KEY (`assigned_units_id`),
  ADD KEY `academic_academic_year_id` (`academic_academic_year_id`),
  ADD KEY `semester_semester_id` (`semester_semester_id`),
  ADD KEY `course_course_id` (`course_course_id`),
  ADD KEY `course_unit_unit_id` (`course_unit_unit_id`);

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
-- Indexes for table `complaints`
--
ALTER TABLE `complaints`
  ADD PRIMARY KEY (`complaint_id`),
  ADD KEY `fk_complaints_student1_idx` (`student_student_id`),
  ADD KEY `complaint_types_complaint_types_id` (`type_id`);

--
-- Indexes for table `complaint_reply`
--
ALTER TABLE `complaint_reply`
  ADD PRIMARY KEY (`complaint_reply_id`),
  ADD KEY `fk_complaints_replies_complaints1_idx` (`complaints_complaint_id`);

--
-- Indexes for table `complaint_types`
--
ALTER TABLE `complaint_types`
  ADD PRIMARY KEY (`complaint_types_id`),
  ADD KEY `university_university_id` (`university_university_id`);

--
-- Indexes for table `counselling_reply`
--
ALTER TABLE `counselling_reply`
  ADD PRIMARY KEY (`reply_id`),
  ADD KEY `chat_room_id` (`chat_room_id`);

--
-- Indexes for table `counsellors`
--
ALTER TABLE `counsellors`
  ADD PRIMARY KEY (`counsellor_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `university_id` (`university_id`);

--
-- Indexes for table `counsellor_chat`
--
ALTER TABLE `counsellor_chat`
  ADD PRIMARY KEY (`chat_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `student_id` (`student_id`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`course_id`),
  ADD KEY `universities_university_id` (`universities_university_id`),
  ADD KEY `courses_ibfk_2` (`_who_added`);

--
-- Indexes for table `course_units`
--
ALTER TABLE `course_units`
  ADD PRIMARY KEY (`course_unit_id`),
  ADD KEY `courses_course_id` (`courses_course_id`);

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
-- Indexes for table `group_messages`
--
ALTER TABLE `group_messages`
  ADD PRIMARY KEY (`group_message_id`),
  ADD KEY `group_group_id` (`group_group_id`),
  ADD KEY `student_student_id` (`student_student_id`);

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
  ADD KEY `university_university_id` (`university_university_id`);

--
-- Indexes for table `registered_academic_years`
--
ALTER TABLE `registered_academic_years`
  ADD PRIMARY KEY (`registered_academic_years_id`),
  ADD KEY `academic_years_years_id` (`academic_years_years_id`),
  ADD KEY `student_student_id` (`student_student_id`),
  ADD KEY `semester_semester_id` (`semester_semester_id`);

--
-- Indexes for table `registered_course_units`
--
ALTER TABLE `registered_course_units`
  ADD PRIMARY KEY (`reg_course_units_id`),
  ADD KEY `fk_registered_course_units_student_registration1_idx` (`student_student_id`),
  ADD KEY `course_units_units_id` (`course_units_units_id`),
  ADD KEY `registered_course_units_ibfk_3` (`registered_academic_years_id`);

--
-- Indexes for table `retakes`
--
ALTER TABLE `retakes`
  ADD PRIMARY KEY (`retake_id`),
  ADD KEY `fk_retakes_marks1_idx` (`marks_marks_id`);

--
-- Indexes for table `semesters`
--
ALTER TABLE `semesters`
  ADD PRIMARY KEY (`semester_id`);

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
-- Indexes for table `sub_menu`
--
ALTER TABLE `sub_menu`
  ADD PRIMARY KEY (`	sub_menu_id`),
  ADD KEY `menu_id` (`menu_id`);

--
-- Indexes for table `suggestion_box`
--
ALTER TABLE `suggestion_box`
  ADD PRIMARY KEY (`suggestion_box_id`),
  ADD KEY `fk_suggestion_box_student1_idx` (`student_student_id`),
  ADD KEY `university_university_id` (`university_university_id`);

--
-- Indexes for table `suggestion_replies`
--
ALTER TABLE `suggestion_replies`
  ADD PRIMARY KEY (`suggestion_reply_id`),
  ADD KEY `fk_suggestion_replies_suggestion_box1_idx` (`suggestion_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `tokens`
--
ALTER TABLE `tokens`
  ADD PRIMARY KEY (`token_id`),
  ADD KEY `student_student_id` (`student_student_id`);

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
  ADD KEY `group_id` (`group_id`);

--
-- Indexes for table `user_groups`
--
ALTER TABLE `user_groups`
  ADD PRIMARY KEY (`group_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `academic_years`
--
ALTER TABLE `academic_years`
  MODIFY `academic_year_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `appointments`
--
ALTER TABLE `appointments`
  MODIFY `appointment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `assigned_units`
--
ALTER TABLE `assigned_units`
  MODIFY `assigned_units_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
--
-- AUTO_INCREMENT for table `campus_calendar`
--
ALTER TABLE `campus_calendar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `campus_events`
--
ALTER TABLE `campus_events`
  MODIFY `event_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `chatgroups`
--
ALTER TABLE `chatgroups`
  MODIFY `group_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `complaints`
--
ALTER TABLE `complaints`
  MODIFY `complaint_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `complaint_reply`
--
ALTER TABLE `complaint_reply`
  MODIFY `complaint_reply_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `complaint_types`
--
ALTER TABLE `complaint_types`
  MODIFY `complaint_types_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `counselling_reply`
--
ALTER TABLE `counselling_reply`
  MODIFY `reply_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `counsellors`
--
ALTER TABLE `counsellors`
  MODIFY `counsellor_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `counsellor_chat`
--
ALTER TABLE `counsellor_chat`
  MODIFY `chat_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `course_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `course_units`
--
ALTER TABLE `course_units`
  MODIFY `course_unit_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;
--
-- AUTO_INCREMENT for table `grading`
--
ALTER TABLE `grading`
  MODIFY `grading_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
--
-- AUTO_INCREMENT for table `group_members`
--
ALTER TABLE `group_members`
  MODIFY `member_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;
--
-- AUTO_INCREMENT for table `group_messages`
--
ALTER TABLE `group_messages`
  MODIFY `group_message_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;
--
-- AUTO_INCREMENT for table `intakes`
--
ALTER TABLE `intakes`
  MODIFY `intake_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `marks`
--
ALTER TABLE `marks`
  MODIFY `marks_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=153;
--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `menu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `menu_assignments`
--
ALTER TABLE `menu_assignments`
  MODIFY `assignmet_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=135;
--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `message_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;
--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `news_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `registered_academic_years`
--
ALTER TABLE `registered_academic_years`
  MODIFY `registered_academic_years_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `registered_course_units`
--
ALTER TABLE `registered_course_units`
  MODIFY `reg_course_units_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;
--
-- AUTO_INCREMENT for table `retakes`
--
ALTER TABLE `retakes`
  MODIFY `retake_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `semesters`
--
ALTER TABLE `semesters`
  MODIFY `semester_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `student_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT for table `sub_menu`
--
ALTER TABLE `sub_menu`
  MODIFY `	sub_menu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;
--
-- AUTO_INCREMENT for table `suggestion_box`
--
ALTER TABLE `suggestion_box`
  MODIFY `suggestion_box_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `suggestion_replies`
--
ALTER TABLE `suggestion_replies`
  MODIFY `suggestion_reply_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `tokens`
--
ALTER TABLE `tokens`
  MODIFY `token_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `universities`
--
ALTER TABLE `universities`
  MODIFY `university_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `user_groups`
--
ALTER TABLE `user_groups`
  MODIFY `group_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
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
-- Constraints for table `appointments`
--
ALTER TABLE `appointments`
  ADD CONSTRAINT `appointments_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`),
  ADD CONSTRAINT `appointments_ibfk_2` FOREIGN KEY (`university_id`) REFERENCES `universities` (`university_id`);

--
-- Constraints for table `assigned_units`
--
ALTER TABLE `assigned_units`
  ADD CONSTRAINT `assigned_units_ibfk_1` FOREIGN KEY (`academic_academic_year_id`) REFERENCES `academic_years` (`academic_year_id`),
  ADD CONSTRAINT `assigned_units_ibfk_2` FOREIGN KEY (`semester_semester_id`) REFERENCES `semesters` (`semester_id`),
  ADD CONSTRAINT `assigned_units_ibfk_3` FOREIGN KEY (`course_course_id`) REFERENCES `courses` (`course_id`),
  ADD CONSTRAINT `assigned_units_ibfk_4` FOREIGN KEY (`course_unit_unit_id`) REFERENCES `course_units` (`course_unit_id`);

--
-- Constraints for table `campus_events`
--
ALTER TABLE `campus_events`
  ADD CONSTRAINT `campus_events_ibfk_1` FOREIGN KEY (`university_university_id`) REFERENCES `universities` (`university_id`);

--
-- Constraints for table `complaints`
--
ALTER TABLE `complaints`
  ADD CONSTRAINT `complaints_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `complaint_types` (`complaint_types_id`),
  ADD CONSTRAINT `fk_complaints_student1` FOREIGN KEY (`student_student_id`) REFERENCES `student` (`student_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `complaint_reply`
--
ALTER TABLE `complaint_reply`
  ADD CONSTRAINT `fk_complaints_replies_complaints1` FOREIGN KEY (`complaints_complaint_id`) REFERENCES `complaints` (`complaint_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `complaint_types`
--
ALTER TABLE `complaint_types`
  ADD CONSTRAINT `complaint_types_ibfk_1` FOREIGN KEY (`university_university_id`) REFERENCES `universities` (`university_id`);

--
-- Constraints for table `counselling_reply`
--
ALTER TABLE `counselling_reply`
  ADD CONSTRAINT `counselling_reply_ibfk_1` FOREIGN KEY (`chat_room_id`) REFERENCES `counsellor_chat` (`chat_id`);

--
-- Constraints for table `counsellors`
--
ALTER TABLE `counsellors`
  ADD CONSTRAINT `counsellors_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `counsellors_ibfk_2` FOREIGN KEY (`university_id`) REFERENCES `universities` (`university_id`);

--
-- Constraints for table `counsellor_chat`
--
ALTER TABLE `counsellor_chat`
  ADD CONSTRAINT `counsellor_chat_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `counsellor_chat_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`);

--
-- Constraints for table `courses`
--
ALTER TABLE `courses`
  ADD CONSTRAINT `courses_ibfk_1` FOREIGN KEY (`universities_university_id`) REFERENCES `universities` (`university_id`),
  ADD CONSTRAINT `courses_ibfk_2` FOREIGN KEY (`_who_added`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `course_units`
--
ALTER TABLE `course_units`
  ADD CONSTRAINT `course_units_ibfk_1` FOREIGN KEY (`courses_course_id`) REFERENCES `courses` (`course_id`);

--
-- Constraints for table `grading`
--
ALTER TABLE `grading`
  ADD CONSTRAINT `grading_ibfk_1` FOREIGN KEY (`university_id`) REFERENCES `universities` (`university_id`);

--
-- Constraints for table `group_members`
--
ALTER TABLE `group_members`
  ADD CONSTRAINT `group_members_ibfk_1` FOREIGN KEY (`group_group_id`) REFERENCES `chatgroups` (`group_id`),
  ADD CONSTRAINT `group_members_ibfk_2` FOREIGN KEY (`student_student_id`) REFERENCES `student` (`student_id`);

--
-- Constraints for table `group_messages`
--
ALTER TABLE `group_messages`
  ADD CONSTRAINT `group_messages_ibfk_1` FOREIGN KEY (`group_group_id`) REFERENCES `chatgroups` (`group_id`),
  ADD CONSTRAINT `group_messages_ibfk_2` FOREIGN KEY (`student_student_id`) REFERENCES `student` (`student_id`);

--
-- Constraints for table `intakes`
--
ALTER TABLE `intakes`
  ADD CONSTRAINT `intakes_ibfk_1` FOREIGN KEY (`university_university_id`) REFERENCES `universities` (`university_id`),
  ADD CONSTRAINT `intakes_ibfk_2` FOREIGN KEY (`_who_added`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `marks`
--
ALTER TABLE `marks`
  ADD CONSTRAINT `fk_marks_academic_years1` FOREIGN KEY (`academic_years_year_id`) REFERENCES `academic_years` (`academic_year_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_marks_semesters1` FOREIGN KEY (`semesters_semester_id`) REFERENCES `semesters` (`semester_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `marks_ibfk_1` FOREIGN KEY (`university_university_id`) REFERENCES `universities` (`university_id`),
  ADD CONSTRAINT `marks_ibfk_2` FOREIGN KEY (`course_course_id`) REFERENCES `courses` (`course_id`),
  ADD CONSTRAINT `marks_ibfk_3` FOREIGN KEY (`_who_added`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `menu_assignments`
--
ALTER TABLE `menu_assignments`
  ADD CONSTRAINT `menu_assignments_ibfk_1` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`menu_id`),
  ADD CONSTRAINT `menu_assignments_ibfk_2` FOREIGN KEY (`user_group_id`) REFERENCES `user_groups` (`group_id`);

--
-- Constraints for table `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`student_student_id`) REFERENCES `student` (`student_id`);

--
-- Constraints for table `news`
--
ALTER TABLE `news`
  ADD CONSTRAINT `news_ibfk_2` FOREIGN KEY (`university_university_id`) REFERENCES `universities` (`university_id`);

--
-- Constraints for table `registered_academic_years`
--
ALTER TABLE `registered_academic_years`
  ADD CONSTRAINT `registered_academic_years_ibfk_1` FOREIGN KEY (`academic_years_years_id`) REFERENCES `academic_years` (`academic_year_id`),
  ADD CONSTRAINT `registered_academic_years_ibfk_2` FOREIGN KEY (`student_student_id`) REFERENCES `student` (`student_id`),
  ADD CONSTRAINT `registered_academic_years_ibfk_3` FOREIGN KEY (`semester_semester_id`) REFERENCES `semesters` (`semester_id`);

--
-- Constraints for table `registered_course_units`
--
ALTER TABLE `registered_course_units`
  ADD CONSTRAINT `registered_course_units_ibfk_1` FOREIGN KEY (`course_units_units_id`) REFERENCES `course_units` (`course_unit_id`),
  ADD CONSTRAINT `registered_course_units_ibfk_2` FOREIGN KEY (`student_student_id`) REFERENCES `student` (`student_id`),
  ADD CONSTRAINT `registered_course_units_ibfk_3` FOREIGN KEY (`registered_academic_years_id`) REFERENCES `registered_academic_years` (`registered_academic_years_id`);

--
-- Constraints for table `retakes`
--
ALTER TABLE `retakes`
  ADD CONSTRAINT `fk_retakes_marks1` FOREIGN KEY (`marks_marks_id`) REFERENCES `marks` (`marks_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `fk_student_universities1` FOREIGN KEY (`universities_university_id`) REFERENCES `universities` (`university_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `student_ibfk_1` FOREIGN KEY (`courses_course_id`) REFERENCES `courses` (`course_id`),
  ADD CONSTRAINT `student_ibfk_2` FOREIGN KEY (`_who_added`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `student_ibfk_3` FOREIGN KEY (`intake_intake_id`) REFERENCES `intakes` (`intake_id`);

--
-- Constraints for table `sub_menu`
--
ALTER TABLE `sub_menu`
  ADD CONSTRAINT `sub_menu_ibfk_1` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`menu_id`);

--
-- Constraints for table `suggestion_box`
--
ALTER TABLE `suggestion_box`
  ADD CONSTRAINT `fk_suggestion_box_student1` FOREIGN KEY (`student_student_id`) REFERENCES `student` (`student_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `suggestion_box_ibfk_1` FOREIGN KEY (`university_university_id`) REFERENCES `universities` (`university_id`);

--
-- Constraints for table `suggestion_replies`
--
ALTER TABLE `suggestion_replies`
  ADD CONSTRAINT `fk_suggestion_replies_suggestion_box1` FOREIGN KEY (`suggestion_id`) REFERENCES `suggestion_box` (`suggestion_box_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `suggestion_replies_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `tokens`
--
ALTER TABLE `tokens`
  ADD CONSTRAINT `tokens_ibfk_1` FOREIGN KEY (`student_student_id`) REFERENCES `student` (`student_id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `user_groups` (`group_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
