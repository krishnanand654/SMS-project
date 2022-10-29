-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 29, 2022 at 05:59 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `install_sql`
--

-- --------------------------------------------------------

--
-- Table structure for table `admit_program`
--

CREATE TABLE `admit_program` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `program_id` int(11) NOT NULL,
  `batch_id` int(11) NOT NULL,
  `admit_date` datetime NOT NULL,
  `admit_by` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admit_program`
--

INSERT INTO `admit_program` (`id`, `student_id`, `program_id`, `batch_id`, `admit_date`, `admit_by`) VALUES
(1, 10002, 5, 1, '2022-10-08 20:54:34', 1),
(2, 10003, 6, 1, '2022-10-10 21:53:19', 1),
(4, 10004, 6, 1, '2022-10-11 01:06:13', 1);

-- --------------------------------------------------------

--
-- Table structure for table `batch`
--

CREATE TABLE `batch` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `start` text DEFAULT NULL,
  `end` text NOT NULL,
  `day` text DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `batch`
--

INSERT INTO `batch` (`id`, `name`, `start`, `end`, `day`) VALUES
(1, 'fr', '12', '3', '3,4,5');

-- --------------------------------------------------------

--
-- Table structure for table `chat`
--

CREATE TABLE `chat` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `date` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `class`
--

CREATE TABLE `class` (
  `classid` int(11) NOT NULL,
  `classname` text NOT NULL,
  `subject_code` text DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `exam`
--

CREATE TABLE `exam` (
  `id` int(11) NOT NULL,
  `program_id` int(11) NOT NULL,
  `sub_id` int(11) NOT NULL,
  `exam_name` text NOT NULL,
  `total` int(11) DEFAULT NULL,
  `mcq` int(11) DEFAULT NULL,
  `written` int(11) DEFAULT NULL,
  `exam_date` date NOT NULL,
  `date` timestamp NULL DEFAULT NULL,
  `add_by` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `exam`
--

INSERT INTO `exam` (`id`, `program_id`, `sub_id`, `exam_name`, `total`, `mcq`, `written`, `exam_date`, `date`, `add_by`) VALUES
(12, 5, 2, 'test3', 200, 100, 100, '2022-10-26', '2022-10-14 17:26:10', 1),
(10, 6, 1, 'test1', 125, 102, 23, '2022-10-20', '2022-10-08 20:58:12', 1),
(11, 6, 2, 'test2', 125, 102, 23, '2022-10-20', '2022-10-09 19:17:17', 1);

-- --------------------------------------------------------

--
-- Table structure for table `exam_category`
--

CREATE TABLE `exam_category` (
  `id` int(11) NOT NULL,
  `category_name` text NOT NULL,
  `program_id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `add_by` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `exam_list`
--

CREATE TABLE `exam_list` (
  `id` int(11) NOT NULL,
  `exam_name` text NOT NULL,
  `category_id` int(11) NOT NULL,
  `subject_name` int(11) NOT NULL,
  `exam_date` datetime NOT NULL,
  `date` datetime NOT NULL,
  `add_by` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `exam_mark`
--

CREATE TABLE `exam_mark` (
  `id` int(11) NOT NULL,
  `exam_id` int(11) NOT NULL,
  `mark_category_id` int(11) NOT NULL,
  `total_mark` int(11) NOT NULL DEFAULT 0,
  `date` datetime NOT NULL,
  `add_by` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `exam_mark`
--

INSERT INTO `exam_mark` (`id`, `exam_id`, `mark_category_id`, `total_mark`, `date`, `add_by`) VALUES
(1, 1, 1, 100, '2022-10-08 18:33:02', 1);

-- --------------------------------------------------------

--
-- Table structure for table `exam_test`
--

CREATE TABLE `exam_test` (
  `id` int(10) UNSIGNED NOT NULL,
  `student_id` int(255) NOT NULL,
  `exam_name` varchar(255) NOT NULL,
  `mcq` int(255) NOT NULL,
  `written` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `exam_test`
--

INSERT INTO `exam_test` (`id`, `student_id`, `exam_name`, `mcq`, `written`) VALUES
(20, 10003, 'test1', 1, 1),
(22, 10004, 'test1', 12, 12);

-- --------------------------------------------------------

--
-- Table structure for table `expence`
--

CREATE TABLE `expence` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `amount` int(11) NOT NULL,
  `notes` text DEFAULT NULL,
  `add_by` int(11) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `expence_category`
--

CREATE TABLE `expence_category` (
  `id` int(11) NOT NULL,
  `category_name` text NOT NULL,
  `add_by` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `income`
--

CREATE TABLE `income` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `amount` int(11) NOT NULL,
  `notes` text DEFAULT NULL,
  `add_by` int(11) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mark_category`
--

CREATE TABLE `mark_category` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `add_by` int(11) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `notice`
--

CREATE TABLE `notice` (
  `id` int(11) NOT NULL,
  `title` text NOT NULL,
  `description` text NOT NULL,
  `date` datetime NOT NULL,
  `add_by` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `notice`
--

INSERT INTO `notice` (`id`, `title`, `description`, `date`, `add_by`) VALUES
(1, 're', '{{student_name}}{{student_pass}}{{nick_name}}', '2022-10-09 11:52:29', 1);

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `paid` double NOT NULL,
  `next_date` date DEFAULT NULL,
  `date` datetime NOT NULL,
  `add_by` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pending_sms`
--

CREATE TABLE `pending_sms` (
  `id` int(11) NOT NULL,
  `number_list` text NOT NULL,
  `message` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `program`
--

CREATE TABLE `program` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `start` date DEFAULT NULL,
  `end` date DEFAULT NULL,
  `subject` text DEFAULT NULL,
  `batch` text DEFAULT NULL,
  `fee` double DEFAULT NULL,
  `type` int(11) NOT NULL DEFAULT 1,
  `monthly_fee` int(11) NOT NULL DEFAULT 0,
  `add_by` int(11) DEFAULT NULL,
  `date` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `program`
--

INSERT INTO `program` (`id`, `name`, `start`, `end`, `subject`, `batch`, `fee`, `type`, `monthly_fee`, `add_by`, `date`) VALUES
(6, 'b', '2022-10-10', '2022-10-11', '1', '1', 221, 1, 0, 1, '2022-10-10 00:25:12'),
(5, 'a', '2022-10-05', '2022-10-10', '2,1', '1', 22, 1, 0, 1, '2022-10-10 00:24:43');

-- --------------------------------------------------------

--
-- Table structure for table `receive_payment`
--

CREATE TABLE `receive_payment` (
  `id` int(11) NOT NULL,
  `payment_id` int(11) NOT NULL,
  `pay` int(11) NOT NULL,
  `sms` int(11) NOT NULL DEFAULT 0,
  `date` datetime NOT NULL,
  `add_by` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `result`
--

CREATE TABLE `result` (
  `id` int(11) NOT NULL,
  `exam_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `mcq` double DEFAULT NULL,
  `written` double DEFAULT NULL,
  `total` double NOT NULL,
  `date` datetime NOT NULL,
  `add_by` int(11) NOT NULL,
  `sms` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `setting`
--

CREATE TABLE `setting` (
  `id` int(11) NOT NULL,
  `option_name` text DEFAULT NULL,
  `option_value` text DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `setting`
--

INSERT INTO `setting` (`id`, `option_name`, `option_value`) VALUES
(1, 'site_name', 'Open Source Student Management System'),
(2, 'sort_name', 'EMS'),
(3, 'address', 'Dhaka, Bangladesh'),
(4, 'main_logo', 'techserm_full_logo.jpg'),
(5, 'logo', 'techserm_small_logo.png'),
(6, 'phone', '-'),
(7, 'email', 'sk.amirhamza@gmail.com'),
(8, 'msg', 'EMS');

-- --------------------------------------------------------

--
-- Table structure for table `set_payment`
--

CREATE TABLE `set_payment` (
  `id` int(11) NOT NULL,
  `program_id` int(11) NOT NULL,
  `year` int(11) NOT NULL,
  `month` int(11) NOT NULL,
  `fee` int(11) NOT NULL,
  `add_by` int(11) NOT NULL,
  `last_update` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `site_activity`
--

CREATE TABLE `site_activity` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `table_name` text NOT NULL,
  `action_type` text NOT NULL,
  `table_id` text NOT NULL,
  `ip` text DEFAULT NULL,
  `browser` text DEFAULT NULL,
  `previous_data` text DEFAULT NULL,
  `present_data` text DEFAULT NULL,
  `login` int(11) DEFAULT 0,
  `date` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `site_activity`
--

INSERT INTO `site_activity` (`id`, `user_id`, `table_name`, `action_type`, `table_id`, `ip`, `browser`, `previous_data`, `present_data`, `login`, `date`) VALUES
(1, 1, 'login', 'insert', '1', '::1', 'Google Chrome', '', '', 1, '2022-10-08 19:42:08'),
(2, 1, 'login', 'insert', '1', '::1', 'Google Chrome', '', '', 1, '2022-10-08 20:32:58'),
(3, 1, 'program', 'insert', '1', '::1', 'Google Chrome', '', '{\"id\":\"1\",\"name\":\"MCA\",\"start\":\"2022-10-07\",\"end\":\"2022-10-08\",\"subject\":\"\",\"batch\":\"\",\"fee\":\"22222\",\"type\":\"1\",\"monthly_fee\":\"0\",\"add_by\":\"1\",\"date\":\"2022-10-08 20:51:07\"}', 0, '2022-10-08 20:51:07'),
(4, 1, 'batch', 'insert', '1', '::1', 'Google Chrome', '', '{\"id\":\"1\",\"name\":\"fr\",\"start\":\"12\",\"end\":\"3\",\"day\":\"3,4,5\"}', 0, '2022-10-08 20:51:36'),
(5, 1, 'program', 'insert', '2', '::1', 'Google Chrome', '', '{\"id\":\"2\",\"name\":\"cs\",\"start\":\"2022-10-07\",\"end\":\"2022-10-08\",\"subject\":\"\",\"batch\":\"1\",\"fee\":\"231\",\"type\":\"1\",\"monthly_fee\":\"0\",\"add_by\":\"1\",\"date\":\"2022-10-08 20:51:56\"}', 0, '2022-10-08 20:51:56'),
(6, 1, 'program', 'delete', '2', '::1', 'Google Chrome', '{\"id\":\"2\",\"name\":\"cs\",\"start\":\"2022-10-07\",\"end\":\"2022-10-08\",\"subject\":\"\",\"batch\":\"1\",\"fee\":\"231\",\"type\":\"1\",\"monthly_fee\":\"0\",\"add_by\":\"1\",\"date\":\"2022-10-08 20:51:56\"}', '', 0, '2022-10-08 20:52:02'),
(7, 1, 'student', 'insert', '10001', '::1', 'Google Chrome', '', '{\"id\":\"10001\",\"name\":\"Krishnanand A\",\"father_name\":\"\",\"mother_name\":\"\",\"email\":\"krishnanand654@gmail.com\",\"photo\":\"avatar.png\",\"personal_mobile\":\"09495434706\",\"father_mobile\":\"\",\"mother_mobile\":\"\",\"nick\":\"Krishnanand\",\"address\":\"Sreethrayam, Vazhappally West P.O, Changanacherry\",\"birth_day\":\"0000-00-00\",\"gender\":\"Male\",\"religion\":\"Muslim\",\"school\":\"\",\"ssc_rool\":\"0\",\"ssc_reg\":\"0\",\"ssc_board\":\"\",\"ssc_result\":\"0\",\"date\":\"2022-10-08 20:52:45\"}', 0, '2022-10-08 20:52:45'),
(8, 1, 'program', 'update', '1', '::1', 'Google Chrome', '{\"id\":\"1\",\"name\":\"MCA\",\"start\":\"2022-10-07\",\"end\":\"2022-10-08\",\"subject\":\"\",\"batch\":\"\",\"fee\":\"22222\",\"type\":\"1\",\"monthly_fee\":\"0\",\"add_by\":\"1\",\"date\":\"2022-10-08 20:51:07\"}', '{\"id\":\"1\",\"name\":\"MCA\",\"start\":\"2022-10-07\",\"end\":\"2022-10-08\",\"subject\":\"\",\"batch\":\"1\",\"fee\":\"22222\",\"type\":\"1\",\"monthly_fee\":\"0\",\"add_by\":\"1\",\"date\":\"2022-10-08 20:51:07\"}', 0, '2022-10-08 20:53:29'),
(9, 1, 'subject', 'insert', '1', '::1', 'Google Chrome', '', '{\"id\":\"1\",\"sub_name\":\"ds\",\"sub_code\":\"sd\"}', 0, '2022-10-08 20:53:46'),
(10, 1, 'student', 'insert', '10002', '::1', 'Google Chrome', '', '{\"id\":\"10002\",\"name\":\"Krishnanand A\",\"father_name\":\"\",\"mother_name\":\"\",\"email\":\"krishnanand654@gmail.com\",\"photo\":\"avatar.png\",\"personal_mobile\":\"09495434706\",\"father_mobile\":\"\",\"mother_mobile\":\"\",\"nick\":\"Krishnanand\",\"address\":\"Sreethrayam, Vazhappally West P.O, Changanacherry\",\"birth_day\":\"0000-00-00\",\"gender\":\"Male\",\"religion\":\"Muslim\",\"school\":\"\",\"ssc_rool\":\"0\",\"ssc_reg\":\"0\",\"ssc_board\":\"\",\"ssc_result\":\"0\",\"date\":\"2022-10-08 20:54:24\"}', 0, '2022-10-08 20:54:24'),
(11, 1, 'admit_program', 'insert', '1', '::1', 'Google Chrome', '', '{\"id\":\"1\",\"student_id\":\"10002\",\"program_id\":\"1\",\"batch_id\":\"1\",\"admit_date\":\"2022-10-08 20:54:34\",\"admit_by\":\"1\"}', 0, '2022-10-08 20:54:34'),
(12, 1, 'program', 'update', '1', '::1', 'Google Chrome', '{\"id\":\"1\",\"name\":\"MCA\",\"start\":\"2022-10-07\",\"end\":\"2022-10-08\",\"subject\":\"\",\"batch\":\"1\",\"fee\":\"22222\",\"type\":\"1\",\"monthly_fee\":\"0\",\"add_by\":\"1\",\"date\":\"2022-10-08 20:51:07\"}', '{\"id\":\"1\",\"name\":\"MCA\",\"start\":\"2022-10-07\",\"end\":\"2022-10-08\",\"subject\":\"1\",\"batch\":\"1\",\"fee\":\"22222\",\"type\":\"1\",\"monthly_fee\":\"0\",\"add_by\":\"1\",\"date\":\"2022-10-08 20:51:07\"}', 0, '2022-10-08 20:55:19'),
(13, 1, 'exam', 'insert', '2', '::1', 'Google Chrome', '', '{\"id\":\"2\",\"program_id\":\"1\",\"sub_id\":\"1\",\"exam_name\":\"er\",\"total\":\"4\",\"mcq\":\"2\",\"written\":\"2\",\"exam_date\":\"2022-10-26\",\"date\":\"2022-10-08 21:35:25\",\"add_by\":\"1\"}', 0, '2022-10-08 21:35:25'),
(14, 1, 'exam', 'insert', '3', '::1', 'Google Chrome', '', '{\"id\":\"3\",\"program_id\":\"1\",\"sub_id\":\"1\",\"exam_name\":\"asd\",\"total\":\"2\",\"mcq\":\"1\",\"written\":\"1\",\"exam_date\":\"2022-10-14\",\"date\":\"2022-10-08 21:39:10\",\"add_by\":\"1\"}', 0, '2022-10-08 21:39:10'),
(15, 1, 'exam', 'delete', '27', '::1', 'Google Chrome', '', '', 0, '2022-10-08 21:51:50'),
(16, 1, 'exam', 'delete', '27', '::1', 'Google Chrome', '', '', 0, '2022-10-08 21:51:57'),
(17, 1, 'exam', 'delete', '27', '::1', 'Google Chrome', '', '', 0, '2022-10-08 21:52:02'),
(18, 1, 'exam', 'delete', '1', '::1', 'Google Chrome', '{\"id\":\"1\",\"program_id\":\"1\",\"sub_id\":\"1\",\"exam_name\":\"asd\",\"total\":\"1\",\"mcq\":\"2\",\"written\":\"3\",\"exam_date\":\"2022-10-12\",\"date\":\"2021-11-18 20:50:53\",\"add_by\":\"12\"}', '', 0, '2022-10-08 21:57:12'),
(19, 1, 'exam', 'delete', '1', '::1', 'Google Chrome', '', '', 0, '2022-10-08 21:59:22'),
(20, 1, 'exam', 'delete', '1', '::1', 'Google Chrome', '', '', 0, '2022-10-08 21:59:28'),
(21, 1, 'exam', 'insert', '4', '::1', 'Google Chrome', '', '{\"id\":\"4\",\"program_id\":\"1\",\"sub_id\":\"1\",\"exam_name\":\"we\",\"total\":\"2\",\"mcq\":\"1\",\"written\":\"1\",\"exam_date\":\"2022-10-07\",\"date\":\"2022-10-08 22:00:31\",\"add_by\":\"1\"}', 0, '2022-10-08 22:00:31'),
(22, 1, 'exam', 'insert', '5', '::1', 'Google Chrome', '', '{\"id\":\"5\",\"program_id\":\"1\",\"sub_id\":\"1\",\"exam_name\":\"wesds\",\"total\":\"2\",\"mcq\":\"1\",\"written\":\"1\",\"exam_date\":\"2022-10-21\",\"date\":\"2022-10-08 22:00:51\",\"add_by\":\"1\"}', 0, '2022-10-08 22:00:51'),
(23, 1, 'exam', 'delete', '1', '::1', 'Google Chrome', '', '', 0, '2022-10-08 22:00:57'),
(24, 1, 'exam', 'delete', '1', '::1', 'Google Chrome', '', '', 0, '2022-10-08 22:01:02'),
(25, 1, 'login', 'insert', '1', '::1', 'Google Chrome', '', '', 1, '2022-10-08 22:05:50'),
(26, 1, 'exam', 'delete', '1', '::1', 'Google Chrome', '{\"id\":\"1\",\"program_id\":\"1\",\"sub_id\":\"1\",\"exam_name\":\"ewq\",\"total\":\"1\",\"mcq\":\"1\",\"written\":\"1\",\"exam_date\":\"2022-10-06\",\"date\":\"2022-10-08 21:40:59\",\"add_by\":\"1\"}', '', 0, '2022-10-08 22:47:50'),
(27, 1, 'exam', 'delete', '2', '::1', 'Google Chrome', '', '', 0, '2022-10-08 22:51:05'),
(28, 1, 'exam', 'insert', '7', '::1', 'Google Chrome', '', '{\"id\":\"7\",\"program_id\":\"1\",\"sub_id\":\"1\",\"exam_name\":\"gfdgd\",\"total\":\"2\",\"mcq\":\"1\",\"written\":\"1\",\"exam_date\":\"2022-10-21\",\"date\":\"2022-10-08 22:51:55\",\"add_by\":\"1\"}', 0, '2022-10-08 22:51:55'),
(29, 1, 'exam', 'delete', '2', '::1', 'Google Chrome', '', '', 0, '2022-10-08 22:53:17'),
(30, 1, 'exam', 'delete', '2', '::1', 'Google Chrome', '', '', 0, '2022-10-08 22:53:31'),
(31, 1, 'login', 'insert', '1', '::1', 'Google Chrome', '', '', 1, '2022-10-09 02:00:35'),
(32, 1, 'exam', 'delete', '27', '::1', 'Google Chrome', '', '', 0, '2022-10-09 02:00:50'),
(33, 1, 'exam', 'insert', '8', '::1', 'Google Chrome', '', '{\"id\":\"8\",\"program_id\":\"1\",\"sub_id\":\"1\",\"exam_name\":\"test1\",\"total\":\"24\",\"mcq\":\"12\",\"written\":\"12\",\"exam_date\":\"2022-10-10\",\"date\":\"2022-10-09 02:08:20\",\"add_by\":\"1\"}', 0, '2022-10-09 02:08:20'),
(34, 1, 'exam', 'delete', '8', '::1', 'Google Chrome', '{\"id\":\"8\",\"program_id\":\"1\",\"sub_id\":\"1\",\"exam_name\":\"test1\",\"total\":\"24\",\"mcq\":\"12\",\"written\":\"12\",\"exam_date\":\"2022-10-10\",\"date\":\"2022-10-09 02:08:20\",\"add_by\":\"1\"}', '', 0, '2022-10-09 02:20:41'),
(35, 1, 'exam', 'insert', '9', '::1', 'Google Chrome', '', '{\"id\":\"9\",\"program_id\":\"1\",\"sub_id\":\"1\",\"exam_name\":\"121\",\"total\":\"145\",\"mcq\":\"122\",\"written\":\"23\",\"exam_date\":\"2022-10-14\",\"date\":\"2022-10-09 02:20:59\",\"add_by\":\"1\"}', 0, '2022-10-09 02:20:59'),
(36, 1, 'exam', 'update', '9', '::1', 'Google Chrome', '{\"id\":\"9\",\"program_id\":\"1\",\"sub_id\":\"1\",\"exam_name\":\"121\",\"total\":\"145\",\"mcq\":\"122\",\"written\":\"23\",\"exam_date\":\"2022-10-14\",\"date\":\"2022-10-09 02:20:59\",\"add_by\":\"1\"}', '{\"id\":\"9\",\"program_id\":\"1\",\"sub_id\":\"1\",\"exam_name\":\"121\",\"total\":\"146\",\"mcq\":\"122\",\"written\":\"24\",\"exam_date\":\"2022-10-14\",\"date\":\"2022-10-09 02:20:59\",\"add_by\":\"1\"}', 0, '2022-10-09 02:27:49'),
(37, 1, 'exam', 'insert', '10', '::1', 'Google Chrome', '', '{\"id\":\"10\",\"program_id\":\"1\",\"sub_id\":\"1\",\"exam_name\":\"ewrw\",\"total\":\"46\",\"mcq\":\"23\",\"written\":\"23\",\"exam_date\":\"2022-10-20\",\"date\":\"2022-10-09 02:28:12\",\"add_by\":\"1\"}', 0, '2022-10-09 02:28:12'),
(38, 1, 'exam', 'update', '10', '::1', 'Google Chrome', '{\"id\":\"10\",\"program_id\":\"1\",\"sub_id\":\"1\",\"exam_name\":\"ewrw\",\"total\":\"46\",\"mcq\":\"23\",\"written\":\"23\",\"exam_date\":\"2022-10-20\",\"date\":\"2022-10-09 02:28:12\",\"add_by\":\"1\"}', '{\"id\":\"10\",\"program_id\":\"1\",\"sub_id\":\"1\",\"exam_name\":\"ewrw\",\"total\":\"123\",\"mcq\":\"100\",\"written\":\"23\",\"exam_date\":\"2022-10-20\",\"date\":\"2022-10-09 02:28:12\",\"add_by\":\"1\"}', 0, '2022-10-09 02:28:23'),
(39, 1, 'exam', 'update', '9', '::1', 'Google Chrome', '{\"id\":\"9\",\"program_id\":\"1\",\"sub_id\":\"1\",\"exam_name\":\"121\",\"total\":\"146\",\"mcq\":\"122\",\"written\":\"24\",\"exam_date\":\"2022-10-14\",\"date\":\"2022-10-09 02:20:59\",\"add_by\":\"1\"}', '{\"id\":\"9\",\"program_id\":\"1\",\"sub_id\":\"1\",\"exam_name\":\"test2\",\"total\":\"123\",\"mcq\":\"100\",\"written\":\"23\",\"exam_date\":\"2022-10-20\",\"date\":\"2022-10-09 02:20:59\",\"add_by\":\"1\"}', 0, '2022-10-09 02:34:16'),
(40, 1, 'exam', 'update', '10', '::1', 'Google Chrome', '{\"id\":\"10\",\"program_id\":\"1\",\"sub_id\":\"1\",\"exam_name\":\"ewrw\",\"total\":\"123\",\"mcq\":\"100\",\"written\":\"23\",\"exam_date\":\"2022-10-20\",\"date\":\"2022-10-09 02:28:12\",\"add_by\":\"1\"}', '{\"id\":\"10\",\"program_id\":\"1\",\"sub_id\":\"1\",\"exam_name\":\"test1\",\"total\":\"123\",\"mcq\":\"100\",\"written\":\"23\",\"exam_date\":\"2022-10-20\",\"date\":\"2022-10-09 02:28:12\",\"add_by\":\"1\"}', 0, '2022-10-09 02:34:30'),
(41, 1, 'exam', 'update', '10', '::1', 'Google Chrome', '{\"id\":\"10\",\"program_id\":\"1\",\"sub_id\":\"1\",\"exam_name\":\"test1\",\"total\":\"123\",\"mcq\":\"100\",\"written\":\"23\",\"exam_date\":\"2022-10-20\",\"date\":\"2022-10-09 02:28:12\",\"add_by\":\"1\"}', '{\"id\":\"10\",\"program_id\":\"1\",\"sub_id\":\"1\",\"exam_name\":\"test1\",\"total\":\"125\",\"mcq\":\"102\",\"written\":\"23\",\"exam_date\":\"2022-10-20\",\"date\":\"2022-10-09 02:28:12\",\"add_by\":\"1\"}', 0, '2022-10-09 02:34:42'),
(42, 1, 'exam', 'delete', '9', '::1', 'Google Chrome', '{\"id\":\"9\",\"program_id\":\"1\",\"sub_id\":\"1\",\"exam_name\":\"test2\",\"total\":\"123\",\"mcq\":\"100\",\"written\":\"23\",\"exam_date\":\"2022-10-20\",\"date\":\"2022-10-09 02:20:59\",\"add_by\":\"1\"}', '', 0, '2022-10-09 02:34:54'),
(43, 1, 'program', 'update', '1', '::1', 'Google Chrome', '{\"id\":\"1\",\"name\":\"MCA\",\"start\":\"2022-10-07\",\"end\":\"2022-10-08\",\"subject\":\"1\",\"batch\":\"1\",\"fee\":\"22222\",\"type\":\"1\",\"monthly_fee\":\"0\",\"add_by\":\"1\",\"date\":\"2022-10-08 20:51:07\"}', '{\"id\":\"1\",\"name\":\"MCA\",\"start\":\"2022-10-07\",\"end\":\"2022-10-08\",\"subject\":\"2,1\",\"batch\":\"1\",\"fee\":\"22222\",\"type\":\"1\",\"monthly_fee\":\"0\",\"add_by\":\"1\",\"date\":\"2022-10-08 20:51:07\"}', 0, '2022-10-09 03:06:33'),
(44, 1, 'exam', 'update', '10', '::1', 'Google Chrome', '{\"id\":\"10\",\"program_id\":\"1\",\"sub_id\":\"1\",\"exam_name\":\"test1\",\"total\":\"125\",\"mcq\":\"102\",\"written\":\"23\",\"exam_date\":\"2022-10-20\",\"date\":\"2022-10-09 02:28:12\",\"add_by\":\"1\"}', '{\"id\":\"10\",\"program_id\":\"1\",\"sub_id\":\"2\",\"exam_name\":\"test1\",\"total\":\"125\",\"mcq\":\"102\",\"written\":\"23\",\"exam_date\":\"2022-10-20\",\"date\":\"2022-10-09 02:28:12\",\"add_by\":\"1\"}', 0, '2022-10-09 03:07:00'),
(45, 1, 'login', 'insert', '1', '::1', 'Google Chrome', '', '', 1, '2022-10-09 11:51:51'),
(46, 1, 'notice', 'insert', '1', '::1', 'Google Chrome', '', '{\"id\":\"1\",\"title\":\"re\",\"description\":\"{{student_name}}{{student_pass}}{{nick_name}}\",\"date\":\"2022-10-09 11:52:29\",\"add_by\":\"1\"}', 0, '2022-10-09 11:52:29'),
(47, 1, 'user', 'update', '1', '::1', 'Google Chrome', '{\"id\":\"1\",\"uname\":\"admin\",\"fname\":\"Admin\",\"photo\":\"avatar.png\",\"gender\":\"Male\",\"email\":\"admin@gmail.com\",\"phone\":\"2147483647\",\"address\":\"Bangladesh\",\"pass\":\"8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918\",\"permit\":\"1\",\"status\":\"1\",\"theme\":\"1\"}', '{\"id\":\"1\",\"uname\":\"admin\",\"fname\":\"Admin\",\"photo\":\"user_1.jpg\",\"gender\":\"Male\",\"email\":\"admin@gmail.com\",\"phone\":\"2147483647\",\"address\":\"Bangladesh\",\"pass\":\"8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918\",\"permit\":\"1\",\"status\":\"1\",\"theme\":\"1\"}', 0, '2022-10-09 12:20:09'),
(48, 1, 'user', 'update', '1', '::1', 'Google Chrome', '{\"id\":\"1\",\"uname\":\"admin\",\"fname\":\"Admin\",\"photo\":\"user_1.jpg\",\"gender\":\"Male\",\"email\":\"admin@gmail.com\",\"phone\":\"2147483647\",\"address\":\"Bangladesh\",\"pass\":\"8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918\",\"permit\":\"1\",\"status\":\"1\",\"theme\":\"1\"}', '{\"id\":\"1\",\"uname\":\"admin\",\"fname\":\"Admin\",\"photo\":\"user_1.png\",\"gender\":\"Male\",\"email\":\"admin@gmail.com\",\"phone\":\"2147483647\",\"address\":\"Bangladesh\",\"pass\":\"8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918\",\"permit\":\"1\",\"status\":\"1\",\"theme\":\"1\"}', 0, '2022-10-09 12:21:07'),
(49, 1, 'login', 'insert', '1', '::1', 'Google Chrome', '', '', 1, '2022-10-09 21:55:09'),
(50, 1, 'program', 'insert', '5', '::1', 'Google Chrome', '', '{\"id\":\"5\",\"name\":\"a\",\"start\":\"2022-10-05\",\"end\":\"2022-10-10\",\"subject\":\"2,1\",\"batch\":\"1\",\"fee\":\"22\",\"type\":\"1\",\"monthly_fee\":\"0\",\"add_by\":\"1\",\"date\":\"2022-10-10 00:24:43\"}', 0, '2022-10-10 00:24:43'),
(51, 1, 'program', 'insert', '6', '::1', 'Google Chrome', '', '{\"id\":\"6\",\"name\":\"b\",\"start\":\"2022-10-10\",\"end\":\"2022-10-11\",\"subject\":\"1\",\"batch\":\"1\",\"fee\":\"221\",\"type\":\"1\",\"monthly_fee\":\"0\",\"add_by\":\"1\",\"date\":\"2022-10-10 00:25:12\"}', 0, '2022-10-10 00:25:12'),
(52, 1, 'exam', 'insert', '11', '::1', 'Google Chrome', '', '{\"id\":\"11\",\"program_id\":\"5\",\"sub_id\":\"2\",\"exam_name\":\"test2\",\"total\":\"2433\",\"mcq\":\"1212\",\"written\":\"1221\",\"exam_date\":\"2022-10-19\",\"date\":\"2022-10-10 00:47:17\",\"add_by\":\"1\"}', 0, '2022-10-10 00:47:17'),
(53, 1, 'login', 'insert', '1', '::1', 'Google Chrome', '', '', 1, '2022-10-10 21:40:48'),
(54, 1, 'student', 'insert', '10003', '::1', 'Google Chrome', '', '{\"id\":\"10003\",\"name\":\"Krishnanand A\",\"father_name\":\"\",\"mother_name\":\"\",\"email\":\"krishnanand654@gmail.com\",\"photo\":\"avatar.png\",\"personal_mobile\":\"09495434706\",\"father_mobile\":\"\",\"mother_mobile\":\"\",\"nick\":\"Krishnanand\",\"address\":\"Sreethrayam, Vazhappally West P.O, Changanacherry\",\"birth_day\":\"0000-00-00\",\"gender\":\"Male\",\"religion\":\"Muslim\",\"school\":\"\",\"ssc_rool\":\"0\",\"ssc_reg\":\"0\",\"ssc_board\":\"\",\"ssc_result\":\"0\",\"date\":\"2022-10-10 21:53:02\"}', 0, '2022-10-10 21:53:02'),
(55, 1, 'admit_program', 'insert', '2', '::1', 'Google Chrome', '', '{\"id\":\"2\",\"student_id\":\"10003\",\"program_id\":\"6\",\"batch_id\":\"1\",\"admit_date\":\"2022-10-10 21:53:19\",\"admit_by\":\"1\"}', 0, '2022-10-10 21:53:19'),
(56, 1, 'user', 'update', '1', '::1', 'Google Chrome', '{\"id\":\"1\",\"uname\":\"admin\",\"fname\":\"Admin\",\"photo\":\"user_1.png\",\"gender\":\"Male\",\"email\":\"admin@gmail.com\",\"phone\":\"2147483647\",\"address\":\"Bangladesh\",\"pass\":\"8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918\",\"permit\":\"1\",\"status\":\"1\",\"theme\":\"1\"}', '{\"id\":\"1\",\"uname\":\"admin\",\"fname\":\"Admin\",\"photo\":\"user_1.png\",\"gender\":\"Male\",\"email\":\"admin@gmail.com\",\"phone\":\"2147483647\",\"address\":\"Bangladesh\",\"pass\":\"8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918\",\"permit\":\"1\",\"status\":\"1\",\"theme\":\"6\"}', 0, '2022-10-11 01:03:58'),
(57, 1, 'user', 'update', '1', '::1', 'Google Chrome', '{\"id\":\"1\",\"uname\":\"admin\",\"fname\":\"Admin\",\"photo\":\"user_1.png\",\"gender\":\"Male\",\"email\":\"admin@gmail.com\",\"phone\":\"2147483647\",\"address\":\"Bangladesh\",\"pass\":\"8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918\",\"permit\":\"1\",\"status\":\"1\",\"theme\":\"6\"}', '{\"id\":\"1\",\"uname\":\"admin\",\"fname\":\"Admin\",\"photo\":\"user_1.png\",\"gender\":\"Male\",\"email\":\"admin@gmail.com\",\"phone\":\"2147483647\",\"address\":\"Bangladesh\",\"pass\":\"8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918\",\"permit\":\"1\",\"status\":\"1\",\"theme\":\"19\"}', 0, '2022-10-11 01:04:05'),
(58, 1, 'user', 'update', '1', '::1', 'Google Chrome', '{\"id\":\"1\",\"uname\":\"admin\",\"fname\":\"Admin\",\"photo\":\"user_1.png\",\"gender\":\"Male\",\"email\":\"admin@gmail.com\",\"phone\":\"2147483647\",\"address\":\"Bangladesh\",\"pass\":\"8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918\",\"permit\":\"1\",\"status\":\"1\",\"theme\":\"19\"}', '{\"id\":\"1\",\"uname\":\"admin\",\"fname\":\"Admin\",\"photo\":\"user_1.png\",\"gender\":\"Male\",\"email\":\"admin@gmail.com\",\"phone\":\"2147483647\",\"address\":\"Bangladesh\",\"pass\":\"8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918\",\"permit\":\"1\",\"status\":\"1\",\"theme\":\"20\"}', 0, '2022-10-11 01:04:14'),
(59, 1, 'user', 'update', '1', '::1', 'Google Chrome', '{\"id\":\"1\",\"uname\":\"admin\",\"fname\":\"Admin\",\"photo\":\"user_1.png\",\"gender\":\"Male\",\"email\":\"admin@gmail.com\",\"phone\":\"2147483647\",\"address\":\"Bangladesh\",\"pass\":\"8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918\",\"permit\":\"1\",\"status\":\"1\",\"theme\":\"20\"}', '{\"id\":\"1\",\"uname\":\"admin\",\"fname\":\"Admin\",\"photo\":\"user_1.png\",\"gender\":\"Male\",\"email\":\"admin@gmail.com\",\"phone\":\"2147483647\",\"address\":\"Bangladesh\",\"pass\":\"8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918\",\"permit\":\"1\",\"status\":\"1\",\"theme\":\"22\"}', 0, '2022-10-11 01:04:17'),
(60, 1, 'user', 'update', '1', '::1', 'Google Chrome', '{\"id\":\"1\",\"uname\":\"admin\",\"fname\":\"Admin\",\"photo\":\"user_1.png\",\"gender\":\"Male\",\"email\":\"admin@gmail.com\",\"phone\":\"2147483647\",\"address\":\"Bangladesh\",\"pass\":\"8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918\",\"permit\":\"1\",\"status\":\"1\",\"theme\":\"22\"}', '{\"id\":\"1\",\"uname\":\"admin\",\"fname\":\"Admin\",\"photo\":\"user_1.png\",\"gender\":\"Male\",\"email\":\"admin@gmail.com\",\"phone\":\"2147483647\",\"address\":\"Bangladesh\",\"pass\":\"8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918\",\"permit\":\"1\",\"status\":\"1\",\"theme\":\"15\"}', 0, '2022-10-11 01:04:20'),
(61, 1, 'user', 'update', '1', '::1', 'Google Chrome', '{\"id\":\"1\",\"uname\":\"admin\",\"fname\":\"Admin\",\"photo\":\"user_1.png\",\"gender\":\"Male\",\"email\":\"admin@gmail.com\",\"phone\":\"2147483647\",\"address\":\"Bangladesh\",\"pass\":\"8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918\",\"permit\":\"1\",\"status\":\"1\",\"theme\":\"15\"}', '{\"id\":\"1\",\"uname\":\"admin\",\"fname\":\"Admin\",\"photo\":\"user_1.png\",\"gender\":\"Male\",\"email\":\"admin@gmail.com\",\"phone\":\"2147483647\",\"address\":\"Bangladesh\",\"pass\":\"8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918\",\"permit\":\"1\",\"status\":\"1\",\"theme\":\"26\"}', 0, '2022-10-11 01:04:24'),
(62, 1, 'user', 'update', '1', '::1', 'Google Chrome', '{\"id\":\"1\",\"uname\":\"admin\",\"fname\":\"Admin\",\"photo\":\"user_1.png\",\"gender\":\"Male\",\"email\":\"admin@gmail.com\",\"phone\":\"2147483647\",\"address\":\"Bangladesh\",\"pass\":\"8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918\",\"permit\":\"1\",\"status\":\"1\",\"theme\":\"26\"}', '{\"id\":\"1\",\"uname\":\"admin\",\"fname\":\"Admin\",\"photo\":\"user_1.png\",\"gender\":\"Male\",\"email\":\"admin@gmail.com\",\"phone\":\"2147483647\",\"address\":\"Bangladesh\",\"pass\":\"8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918\",\"permit\":\"1\",\"status\":\"1\",\"theme\":\"19\"}', 0, '2022-10-11 01:04:33'),
(63, 1, 'user', 'update', '1', '::1', 'Google Chrome', '{\"id\":\"1\",\"uname\":\"admin\",\"fname\":\"Admin\",\"photo\":\"user_1.png\",\"gender\":\"Male\",\"email\":\"admin@gmail.com\",\"phone\":\"2147483647\",\"address\":\"Bangladesh\",\"pass\":\"8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918\",\"permit\":\"1\",\"status\":\"1\",\"theme\":\"19\"}', '{\"id\":\"1\",\"uname\":\"admin\",\"fname\":\"Admin\",\"photo\":\"user_1.png\",\"gender\":\"Male\",\"email\":\"admin@gmail.com\",\"phone\":\"2147483647\",\"address\":\"Bangladesh\",\"pass\":\"8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918\",\"permit\":\"1\",\"status\":\"1\",\"theme\":\"10\"}', 0, '2022-10-11 01:04:41'),
(64, 1, 'student', 'insert', '10004', '::1', 'Google Chrome', '', '{\"id\":\"10004\",\"name\":\"Krishnanand A\",\"father_name\":\"\",\"mother_name\":\"\",\"email\":\"krishnanand654@gmail.com\",\"photo\":\"avatar.png\",\"personal_mobile\":\"09495434706\",\"father_mobile\":\"\",\"mother_mobile\":\"\",\"nick\":\"Krishnanand\",\"address\":\"Sreethrayam, Vazhappally West P.O, Changanacherry\",\"birth_day\":\"0000-00-00\",\"gender\":\"Male\",\"religion\":\"Muslim\",\"school\":\"\",\"ssc_rool\":\"0\",\"ssc_reg\":\"0\",\"ssc_board\":\"\",\"ssc_result\":\"0\",\"date\":\"2022-10-11 01:05:19\"}', 0, '2022-10-11 01:05:19'),
(65, 1, 'admit_program', 'insert', '3', '::1', 'Google Chrome', '', '{\"id\":\"3\",\"student_id\":\"10004\",\"program_id\":\"5\",\"batch_id\":\"1\",\"admit_date\":\"2022-10-11 01:05:32\",\"admit_by\":\"1\"}', 0, '2022-10-11 01:05:32'),
(66, 1, 'admit_program', 'update', '3', '::1', 'Google Chrome', '{\"id\":\"3\",\"student_id\":\"10004\",\"program_id\":\"5\",\"batch_id\":\"1\",\"admit_date\":\"2022-10-11 01:05:32\",\"admit_by\":\"1\"}', '{\"id\":\"3\",\"student_id\":\"10004\",\"program_id\":\"5\",\"batch_id\":\"1\",\"admit_date\":\"2022-10-11 01:05:32\",\"admit_by\":\"1\"}', 0, '2022-10-11 01:05:53'),
(67, 1, 'admit_program', 'delete', '3', '::1', 'Google Chrome', '{\"id\":\"3\",\"student_id\":\"10004\",\"program_id\":\"5\",\"batch_id\":\"1\",\"admit_date\":\"2022-10-11 01:05:32\",\"admit_by\":\"1\"}', '', 0, '2022-10-11 01:06:05'),
(68, 1, 'admit_program', 'insert', '4', '::1', 'Google Chrome', '', '{\"id\":\"4\",\"student_id\":\"10004\",\"program_id\":\"6\",\"batch_id\":\"1\",\"admit_date\":\"2022-10-11 01:06:13\",\"admit_by\":\"1\"}', 0, '2022-10-11 01:06:13'),
(69, 1, 'login', 'insert', '1', '::1', 'Google Chrome', '', '', 1, '2022-10-14 00:59:11'),
(70, 1, 'exam', 'update', '10', '::1', 'Google Chrome', '{\"id\":\"10\",\"program_id\":\"6\",\"sub_id\":\"2\",\"exam_name\":\"test1\",\"total\":\"125\",\"mcq\":\"102\",\"written\":\"23\",\"exam_date\":\"2022-10-20\",\"date\":\"2022-10-09 02:28:12\",\"add_by\":\"1\"}', '{\"id\":\"10\",\"program_id\":\"5\",\"sub_id\":\"2\",\"exam_name\":\"test1\",\"total\":\"125\",\"mcq\":\"102\",\"written\":\"23\",\"exam_date\":\"2022-10-20\",\"date\":\"2022-10-09 02:28:12\",\"add_by\":\"1\"}', 0, '2022-10-14 00:59:36'),
(71, 1, 'exam', 'update', '10', '::1', 'Google Chrome', '{\"id\":\"10\",\"program_id\":\"5\",\"sub_id\":\"2\",\"exam_name\":\"test1\",\"total\":\"125\",\"mcq\":\"102\",\"written\":\"23\",\"exam_date\":\"2022-10-20\",\"date\":\"2022-10-09 02:28:12\",\"add_by\":\"1\"}', '{\"id\":\"10\",\"program_id\":\"6\",\"sub_id\":\"1\",\"exam_name\":\"test1\",\"total\":\"125\",\"mcq\":\"102\",\"written\":\"23\",\"exam_date\":\"2022-10-20\",\"date\":\"2022-10-09 02:28:12\",\"add_by\":\"1\"}', 0, '2022-10-14 01:00:06'),
(72, 1, 'exam', 'update', '11', '::1', 'Google Chrome', '{\"id\":\"11\",\"program_id\":\"5\",\"sub_id\":\"2\",\"exam_name\":\"test2\",\"total\":\"2433\",\"mcq\":\"1212\",\"written\":\"1221\",\"exam_date\":\"2022-10-19\",\"date\":\"2022-10-10 00:47:17\",\"add_by\":\"1\"}', '{\"id\":\"11\",\"program_id\":\"6\",\"sub_id\":\"2\",\"exam_name\":\"test1\",\"total\":\"125\",\"mcq\":\"102\",\"written\":\"23\",\"exam_date\":\"2022-10-20\",\"date\":\"2022-10-10 00:47:17\",\"add_by\":\"1\"}', 0, '2022-10-14 01:00:12'),
(73, 1, 'login', 'insert', '1', '::1', 'Google Chrome', '', '', 1, '2022-10-14 21:10:58'),
(74, 1, 'exam', 'insert', '12', '::1', 'Google Chrome', '', '{\"id\":\"12\",\"program_id\":\"5\",\"sub_id\":\"2\",\"exam_name\":\"test3\",\"total\":\"200\",\"mcq\":\"100\",\"written\":\"100\",\"exam_date\":\"2022-10-26\",\"date\":\"2022-10-14 22:56:10\",\"add_by\":\"1\"}', 0, '2022-10-14 22:56:10'),
(75, 1, 'login', 'insert', '1', '::1', 'Google Chrome', '', '', 1, '2022-10-15 11:04:04'),
(76, 1, 'login', 'insert', '1', '::1', 'Google Chrome', '', '', 1, '2022-10-21 21:00:27'),
(77, 1, 'user', 'update', '1', '::1', 'Google Chrome', '{\"id\":\"1\",\"uname\":\"admin\",\"fname\":\"Admin\",\"photo\":\"user_1.png\",\"gender\":\"Male\",\"email\":\"admin@gmail.com\",\"phone\":\"2147483647\",\"address\":\"Bangladesh\",\"pass\":\"8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918\",\"permit\":\"1\",\"status\":\"1\",\"theme\":\"10\"}', '{\"id\":\"1\",\"uname\":\"admin\",\"fname\":\"Admin\",\"photo\":\"user_1.png\",\"gender\":\"Male\",\"email\":\"admin@gmail.com\",\"phone\":\"2147483647\",\"address\":\"Bangladesh\",\"pass\":\"8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918\",\"permit\":\"1\",\"status\":\"1\",\"theme\":\"9\"}', 0, '2022-10-22 17:53:07'),
(78, 1, 'user', 'update', '1', '::1', 'Google Chrome', '{\"id\":\"1\",\"uname\":\"admin\",\"fname\":\"Admin\",\"photo\":\"user_1.png\",\"gender\":\"Male\",\"email\":\"admin@gmail.com\",\"phone\":\"2147483647\",\"address\":\"Bangladesh\",\"pass\":\"8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918\",\"permit\":\"1\",\"status\":\"1\",\"theme\":\"9\"}', '{\"id\":\"1\",\"uname\":\"admin\",\"fname\":\"Admin\",\"photo\":\"user_1.png\",\"gender\":\"Male\",\"email\":\"admin@gmail.com\",\"phone\":\"2147483647\",\"address\":\"Bangladesh\",\"pass\":\"8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918\",\"permit\":\"1\",\"status\":\"1\",\"theme\":\"6\"}', 0, '2022-10-22 17:53:13'),
(79, 1, 'user', 'update', '1', '::1', 'Google Chrome', '{\"id\":\"1\",\"uname\":\"admin\",\"fname\":\"Admin\",\"photo\":\"user_1.png\",\"gender\":\"Male\",\"email\":\"admin@gmail.com\",\"phone\":\"2147483647\",\"address\":\"Bangladesh\",\"pass\":\"8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918\",\"permit\":\"1\",\"status\":\"1\",\"theme\":\"6\"}', '{\"id\":\"1\",\"uname\":\"admin\",\"fname\":\"Admin\",\"photo\":\"user_1.png\",\"gender\":\"Male\",\"email\":\"admin@gmail.com\",\"phone\":\"2147483647\",\"address\":\"Bangladesh\",\"pass\":\"8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918\",\"permit\":\"1\",\"status\":\"1\",\"theme\":\"21\"}', 0, '2022-10-22 17:53:20'),
(80, 1, 'user', 'update', '1', '::1', 'Google Chrome', '{\"id\":\"1\",\"uname\":\"admin\",\"fname\":\"Admin\",\"photo\":\"user_1.png\",\"gender\":\"Male\",\"email\":\"admin@gmail.com\",\"phone\":\"2147483647\",\"address\":\"Bangladesh\",\"pass\":\"8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918\",\"permit\":\"1\",\"status\":\"1\",\"theme\":\"21\"}', '{\"id\":\"1\",\"uname\":\"admin\",\"fname\":\"Admin\",\"photo\":\"user_1.png\",\"gender\":\"Male\",\"email\":\"admin@gmail.com\",\"phone\":\"2147483647\",\"address\":\"Bangladesh\",\"pass\":\"8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918\",\"permit\":\"1\",\"status\":\"1\",\"theme\":\"26\"}', 0, '2022-10-22 17:53:31'),
(81, 1, 'user', 'update', '1', '::1', 'Google Chrome', '{\"id\":\"1\",\"uname\":\"admin\",\"fname\":\"Admin\",\"photo\":\"user_1.png\",\"gender\":\"Male\",\"email\":\"admin@gmail.com\",\"phone\":\"2147483647\",\"address\":\"Bangladesh\",\"pass\":\"8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918\",\"permit\":\"1\",\"status\":\"1\",\"theme\":\"26\"}', '{\"id\":\"1\",\"uname\":\"admin\",\"fname\":\"Admin\",\"photo\":\"user_1.png\",\"gender\":\"Male\",\"email\":\"admin@gmail.com\",\"phone\":\"2147483647\",\"address\":\"Bangladesh\",\"pass\":\"8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918\",\"permit\":\"1\",\"status\":\"1\",\"theme\":\"25\"}', 0, '2022-10-22 17:53:40'),
(82, 1, 'user', 'update', '1', '::1', 'Google Chrome', '{\"id\":\"1\",\"uname\":\"admin\",\"fname\":\"Admin\",\"photo\":\"user_1.png\",\"gender\":\"Male\",\"email\":\"admin@gmail.com\",\"phone\":\"2147483647\",\"address\":\"Bangladesh\",\"pass\":\"8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918\",\"permit\":\"1\",\"status\":\"1\",\"theme\":\"25\"}', '{\"id\":\"1\",\"uname\":\"admin\",\"fname\":\"Admin\",\"photo\":\"user_1.png\",\"gender\":\"Male\",\"email\":\"admin@gmail.com\",\"phone\":\"2147483647\",\"address\":\"Bangladesh\",\"pass\":\"8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918\",\"permit\":\"1\",\"status\":\"1\",\"theme\":\"27\"}', 0, '2022-10-22 17:53:51'),
(83, 1, 'user', 'update', '1', '::1', 'Google Chrome', '{\"id\":\"1\",\"uname\":\"admin\",\"fname\":\"Admin\",\"photo\":\"user_1.png\",\"gender\":\"Male\",\"email\":\"admin@gmail.com\",\"phone\":\"2147483647\",\"address\":\"Bangladesh\",\"pass\":\"8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918\",\"permit\":\"1\",\"status\":\"1\",\"theme\":\"27\"}', '{\"id\":\"1\",\"uname\":\"admin\",\"fname\":\"Admin\",\"photo\":\"user_1.png\",\"gender\":\"Male\",\"email\":\"admin@gmail.com\",\"phone\":\"2147483647\",\"address\":\"Bangladesh\",\"pass\":\"8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918\",\"permit\":\"1\",\"status\":\"1\",\"theme\":\"26\"}', 0, '2022-10-22 17:54:00'),
(84, 1, 'student', 'insert', '10005', '::1', 'Google Chrome', '', '{\"id\":\"10005\",\"name\":\"asw\",\"father_name\":\"as\",\"mother_name\":\"as\",\"email\":\"sasda@gmail.com\",\"photo\":\"10005.jpg\",\"personal_mobile\":\"1212\",\"father_mobile\":\"1212\",\"mother_mobile\":\"1212\",\"nick\":\"as\",\"address\":\"dsad\",\"birth_day\":\"2022-10-26\",\"gender\":\"Male\",\"religion\":\"Hindu\",\"school\":\"\",\"ssc_rool\":\"0\",\"ssc_reg\":\"0\",\"ssc_board\":\"\",\"ssc_result\":\"0\",\"date\":\"2022-10-22 17:57:37\"}', 0, '2022-10-22 17:57:37'),
(85, 1, 'student', 'update', '10005', '::1', 'Google Chrome', '{\"id\":\"10005\",\"name\":\"asw\",\"father_name\":\"as\",\"mother_name\":\"as\",\"email\":\"sasda@gmail.com\",\"photo\":\"10005.jpg\",\"personal_mobile\":\"1212\",\"father_mobile\":\"1212\",\"mother_mobile\":\"1212\",\"nick\":\"as\",\"address\":\"dsad\",\"birth_day\":\"2022-10-26\",\"gender\":\"Male\",\"religion\":\"Hindu\",\"school\":\"\",\"ssc_rool\":\"0\",\"ssc_reg\":\"0\",\"ssc_board\":\"\",\"ssc_result\":\"0\",\"date\":\"2022-10-22 17:57:37\"}', '{\"id\":\"10005\",\"name\":\"asw\",\"father_name\":\"as\",\"mother_name\":\"as\",\"email\":\"sasda@gmail.com\",\"photo\":\"10005.jpg\",\"personal_mobile\":\"0\",\"father_mobile\":\"0\",\"mother_mobile\":\"0\",\"nick\":\"as\",\"address\":\"dsad\",\"birth_day\":\"2022-10-26\",\"gender\":\"Female\",\"religion\":\"Hindu\",\"school\":\"\",\"ssc_rool\":\"0\",\"ssc_reg\":\"0\",\"ssc_board\":\"\",\"ssc_result\":\"0\",\"date\":\"2022-10-22 17:57:37\"}', 0, '2022-10-22 17:59:05'),
(86, 1, 'login', 'insert', '1', '::1', 'Google Chrome', '', '', 1, '2022-10-22 18:36:35'),
(87, 1, 'login', 'insert', '1', '::1', 'Google Chrome', '', '', 1, '2022-10-22 18:46:52');

-- --------------------------------------------------------

--
-- Table structure for table `sms_add`
--

CREATE TABLE `sms_add` (
  `id` int(11) NOT NULL,
  `total_sms` int(11) NOT NULL,
  `pay` int(11) NOT NULL,
  `total_send` int(11) NOT NULL DEFAULT 0,
  `start` date NOT NULL,
  `end` date NOT NULL,
  `date` datetime NOT NULL,
  `add_by` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sms_list`
--

CREATE TABLE `sms_list` (
  `id` int(11) NOT NULL,
  `number` text NOT NULL,
  `message` text NOT NULL,
  `len` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `gateway` text NOT NULL,
  `token` text NOT NULL,
  `sender` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sms_setting`
--

CREATE TABLE `sms_setting` (
  `id` int(11) NOT NULL,
  `gateway` text NOT NULL,
  `token` text NOT NULL,
  `date` datetime NOT NULL,
  `add_by` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `father_name` text NOT NULL,
  `mother_name` text NOT NULL,
  `email` text DEFAULT NULL,
  `photo` text NOT NULL,
  `personal_mobile` text DEFAULT NULL,
  `father_mobile` text DEFAULT NULL,
  `mother_mobile` text DEFAULT NULL,
  `nick` text NOT NULL,
  `address` text DEFAULT NULL,
  `birth_day` date DEFAULT NULL,
  `gender` text DEFAULT NULL,
  `religion` text DEFAULT NULL,
  `school` text DEFAULT NULL,
  `ssc_rool` int(11) DEFAULT NULL,
  `ssc_reg` int(11) DEFAULT NULL,
  `ssc_board` text DEFAULT NULL,
  `ssc_result` double DEFAULT NULL,
  `date` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`id`, `name`, `father_name`, `mother_name`, `email`, `photo`, `personal_mobile`, `father_mobile`, `mother_mobile`, `nick`, `address`, `birth_day`, `gender`, `religion`, `school`, `ssc_rool`, `ssc_reg`, `ssc_board`, `ssc_result`, `date`) VALUES
(10001, 'Krishnanand A', '', '', 'krishnanand654@gmail.com', 'avatar.png', '09495434706', '', '', 'Krishnanand', 'Sreethrayam, Vazhappally West P.O, Changanacherry', '0000-00-00', 'Male', 'Muslim', '', 0, 0, '', 0, '2022-10-08 20:52:45'),
(10004, 'karthi', '', '', 'krishnanand654@gmail.com', 'avatar.png', '09495434706', '', '', 'Krishnanand', 'Sreethrayam, Vazhappally West P.O, Changanacherry', '0000-00-00', 'Male', 'Muslim', '', 0, 0, '', 0, '2022-10-11 01:05:19'),
(10005, 'asw', 'as', 'as', 'sasda@gmail.com', '10005.jpg', '0', '0', '0', 'as', 'dsad', '2022-10-26', 'Female', 'Hindu', '', 0, 0, '', 0, '2022-10-22 17:57:37');

-- --------------------------------------------------------

--
-- Table structure for table `student_attendence`
--

CREATE TABLE `student_attendence` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `program_id` int(11) NOT NULL,
  `batch_id` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `date` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student_attendence`
--

INSERT INTO `student_attendence` (`id`, `student_id`, `program_id`, `batch_id`, `status`, `date`) VALUES
(1, 10002, 1, 1, 0, '2022-10-08'),
(2, 10002, 5, 1, 1, '2022-10-15');

-- --------------------------------------------------------

--
-- Table structure for table `student_id`
--

CREATE TABLE `student_id` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `student_payment`
--

CREATE TABLE `student_payment` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `program_id` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `year` int(11) DEFAULT NULL,
  `month` int(11) DEFAULT NULL,
  `total_fee` int(11) NOT NULL,
  `note` text DEFAULT NULL,
  `date` datetime NOT NULL,
  `add_by` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `subject`
--

CREATE TABLE `subject` (
  `id` int(11) NOT NULL,
  `sub_name` text NOT NULL,
  `sub_code` text DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subject`
--

INSERT INTO `subject` (`id`, `sub_name`, `sub_code`) VALUES
(1, 'ds', 'sd'),
(2, 're', 'er');

-- --------------------------------------------------------

--
-- Table structure for table `theme`
--

CREATE TABLE `theme` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `bg_color` text NOT NULL,
  `sidebar_hover` text NOT NULL,
  `sidebar_list` text NOT NULL,
  `sidebar_list_hover` text NOT NULL,
  `font_color` text NOT NULL,
  `date` date NOT NULL,
  `added_by` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `theme`
--

INSERT INTO `theme` (`id`, `name`, `bg_color`, `sidebar_hover`, `sidebar_list`, `sidebar_list_hover`, `font_color`, `date`, `added_by`) VALUES
(1, 'Default', '#2E363F', '#2A2D35', '#394152', '#313847', '#ffffff', '2018-06-13', 1),
(2, 'Red', '#CF0A2F', '#93021E', '#B54B5F', '#E33A5A', '#ffffff', '2018-06-13', 3),
(3, 'Blue', '#AB2567', '#AB2567', '#AB2567', '#AB2567', '#ffffff', '2018-06-13', 3),
(4, 'Green', '#088730', '#088730', '#4CAB41', '#1BAB2F', '#FFFFFF', '2018-06-13', 3),
(5, 'Yello', '#AB9803', '#AB9803', '#A3AB2E', '#AB9C37', '#000000', '2018-06-13', 3),
(6, 'Black', '#0F0000', '#1C0611', '#260817', '#2B091A', '#FFFFFF', '2018-06-13', 3),
(7, 'Orange', '#E74C3C', '#C0392B', '#E67E22', '#D35400', '#FFFFFF', '2018-06-13', 3),
(9, 'Pink', '#ED5FE9', '#ED3BA1', '#ED98D4', '#ED72CD', '#FFFFFF', '2018-06-13', 3),
(10, 'Blue1', '#564C9E', '#724EED', '#907EED', '#5867ED', '#FFFFFF', '2018-06-14', 3),
(23, 'CYAN', '#005154', '#EDE6EC', '#EDE6EC', '#EDE6EC', '#FFFFFF', '2019-01-16', 3),
(22, 'Web Dark', '#235A6B', '#EDE6EC', '#EDE6EC', '#EDE6EC', '#FFFFFF', '2019-01-16', 3),
(21, 'Web', '#378BA6', '#EDE6EC', '#EDE6EC', '#EDE6EC', '#FFFFFF', '2019-01-16', 3),
(14, 'Deep Rose', '#C44569', '#EDE6EC', '#EDE6EC', '#EDE6EC', '#FFFFFF', '2018-06-21', 3),
(15, 'Purple Corallite', '#574B90', '#EDE6EC', '#EDE6EC', '#EDE6EC', '#FFFFFF', '2018-06-21', 3),
(17, 'Red Color', '#A32929', '#6DEDC2', '#EDE6EC', '#EDE6EC', '#EDE6EC', '2018-10-08', 3),
(19, 'Google color', '#673AB7', '#EDC5D2', '#EDEDED', '#EDE6EC', '#FFFFFF', '2018-11-21', 3),
(20, 'Google Red', '#DB4437', '#EDE6EC', '#EDE6EC', '#EDE6EC', '#FFFFFF', '2018-11-21', 3),
(24, 'new theme', '#331F77', '#EDE6EC', '#EDE6EC', '#EDE6EC', '#FFFFFF', '2019-01-21', 3),
(25, 'apply', '#ED3B19', '#EDE6EC', '#EDE6EC', '#EDE6EC', '#FFFFFF', '2019-02-01', 3),
(26, 'dark blue', '#001E4C', '#EDE6EC', '#EDE6EC', '#EDE6EC', '#FFFFFF', '2019-02-08', 3),
(27, 'Copy Theme 1', '#2C293E', '#EDE6EC', '#EDE6EC', '#EDE6EC', '#EDEDED', '2019-04-28', 3);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `uname` text NOT NULL,
  `fname` text DEFAULT NULL,
  `photo` text NOT NULL,
  `gender` text NOT NULL,
  `email` text DEFAULT NULL,
  `phone` int(11) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `pass` varchar(100) NOT NULL,
  `permit` int(11) NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL DEFAULT 1,
  `theme` int(11) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `uname`, `fname`, `photo`, `gender`, `email`, `phone`, `address`, `pass`, `permit`, `status`, `theme`) VALUES
(1, 'admin', 'Admin', 'user_1.png', 'Male', 'admin@gmail.com', 2147483647, 'Bangladesh', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 1, 1, 26);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admit_program`
--
ALTER TABLE `admit_program`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `batch`
--
ALTER TABLE `batch`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chat`
--
ALTER TABLE `chat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `class`
--
ALTER TABLE `class`
  ADD PRIMARY KEY (`classid`);

--
-- Indexes for table `exam`
--
ALTER TABLE `exam`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exam_category`
--
ALTER TABLE `exam_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exam_list`
--
ALTER TABLE `exam_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exam_mark`
--
ALTER TABLE `exam_mark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exam_test`
--
ALTER TABLE `exam_test`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expence`
--
ALTER TABLE `expence`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expence_category`
--
ALTER TABLE `expence_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `income`
--
ALTER TABLE `income`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mark_category`
--
ALTER TABLE `mark_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notice`
--
ALTER TABLE `notice`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pending_sms`
--
ALTER TABLE `pending_sms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `program`
--
ALTER TABLE `program`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `receive_payment`
--
ALTER TABLE `receive_payment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `result`
--
ALTER TABLE `result`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `setting`
--
ALTER TABLE `setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `set_payment`
--
ALTER TABLE `set_payment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `site_activity`
--
ALTER TABLE `site_activity`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sms_add`
--
ALTER TABLE `sms_add`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sms_list`
--
ALTER TABLE `sms_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sms_setting`
--
ALTER TABLE `sms_setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student_attendence`
--
ALTER TABLE `student_attendence`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student_id`
--
ALTER TABLE `student_id`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student_payment`
--
ALTER TABLE `student_payment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subject`
--
ALTER TABLE `subject`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `theme`
--
ALTER TABLE `theme`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admit_program`
--
ALTER TABLE `admit_program`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `batch`
--
ALTER TABLE `batch`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `chat`
--
ALTER TABLE `chat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `class`
--
ALTER TABLE `class`
  MODIFY `classid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exam`
--
ALTER TABLE `exam`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `exam_category`
--
ALTER TABLE `exam_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exam_list`
--
ALTER TABLE `exam_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exam_mark`
--
ALTER TABLE `exam_mark`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `exam_test`
--
ALTER TABLE `exam_test`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `expence`
--
ALTER TABLE `expence`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `expence_category`
--
ALTER TABLE `expence_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `income`
--
ALTER TABLE `income`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mark_category`
--
ALTER TABLE `mark_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notice`
--
ALTER TABLE `notice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pending_sms`
--
ALTER TABLE `pending_sms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `program`
--
ALTER TABLE `program`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `receive_payment`
--
ALTER TABLE `receive_payment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `result`
--
ALTER TABLE `result`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `setting`
--
ALTER TABLE `setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `set_payment`
--
ALTER TABLE `set_payment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `site_activity`
--
ALTER TABLE `site_activity`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT for table `sms_add`
--
ALTER TABLE `sms_add`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sms_list`
--
ALTER TABLE `sms_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sms_setting`
--
ALTER TABLE `sms_setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10006;

--
-- AUTO_INCREMENT for table `student_attendence`
--
ALTER TABLE `student_attendence`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `student_id`
--
ALTER TABLE `student_id`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `student_payment`
--
ALTER TABLE `student_payment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subject`
--
ALTER TABLE `subject`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `theme`
--
ALTER TABLE `theme`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
