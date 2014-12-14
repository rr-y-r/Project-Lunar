-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Dec 14, 2014 at 06:35 PM
-- Server version: 5.6.16
-- PHP Version: 5.5.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `patarana`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(31) NOT NULL,
  `note` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ci_sessions`
--

CREATE TABLE IF NOT EXISTS `ci_sessions` (
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `user_agent` varchar(120) NOT NULL,
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `user_data` text NOT NULL,
  PRIMARY KEY (`session_id`),
  KEY `last_activity_idx` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ci_sessions`
--

INSERT INTO `ci_sessions` (`session_id`, `ip_address`, `user_agent`, `last_activity`, `user_data`) VALUES
('12e58c312b1fd3f726288063938babba', '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.122 Safari/537.36', 1418578482, ''),
('170c495c1c9224f828e98f1fad220f3e', '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.122 Safari/537.36', 1418578482, ''),
('350ab80ccb2bba1f0ee92a599c0a73b1', '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.122 Safari/537.36', 1418481390, 'a:3:{s:9:"user_data";s:0:"";s:8:"username";s:4:"awaw";s:8:"password";s:4:"awaw";}'),
('5500468c3eb64ad44a26f5dad64716a1', '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.122 Safari/537.36', 1418578482, '');

-- --------------------------------------------------------

--
-- Table structure for table `files`
--

CREATE TABLE IF NOT EXISTS `files` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text,
  `product_id` int(13) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=22 ;

--
-- Dumping data for table `files`
--

INSERT INTO `files` (`id`, `name`, `size`, `type`, `url`, `title`, `description`, `product_id`) VALUES
(1, '10003314_802522933111020_1811900277_n (2).jpg', 8997, 'image/jpeg', NULL, NULL, NULL, 0),
(2, '10003314_802522933111020_1811900277_n (3).jpg', 8997, 'image/jpeg', NULL, NULL, NULL, 0),
(3, '10003978_833202466694050_1154961188_n.jpg', 18114, 'image/jpeg', NULL, NULL, NULL, 0),
(4, '7_deadly_sins_by_omerbd-d1s6uzz (1).jpg', 85018, 'image/jpeg', NULL, NULL, NULL, 0),
(5, '7 Deadly Sins.jpg', 130455, 'image/jpeg', NULL, NULL, NULL, 0),
(6, 'add.jpg', 89143, 'image/jpeg', NULL, NULL, NULL, 0),
(7, 'a3d1VKr_460s.jpg', 42872, 'image/jpeg', NULL, NULL, NULL, 0),
(8, 'fdd (1).jpg', 64247, 'image/jpeg', NULL, NULL, NULL, 0),
(9, 'fdd (2).jpg', 64247, 'image/jpeg', NULL, NULL, NULL, 0),
(10, 'add (1).jpg', 89143, 'image/jpeg', NULL, NULL, NULL, 0),
(11, 'fdd (3).jpg', 64247, 'image/jpeg', NULL, NULL, NULL, 0),
(12, 'aNoeBj3_700b.jpg', 56179, 'image/jpeg', NULL, NULL, NULL, 0),
(13, 'fdd (4).jpg', 64247, 'image/jpeg', NULL, NULL, NULL, 0),
(14, '10565024_790601137638884_5911140338864525647_n (1).jpg', 7060, 'image/jpeg', NULL, NULL, NULL, 0),
(15, '10524352_4383530123923_5890987073734475644_n.jpg', 65911, 'image/jpeg', NULL, NULL, NULL, 0),
(16, 'add.jpg', 89143, 'image/jpeg', NULL, NULL, NULL, 0),
(17, 'fdd.jpg', 64247, 'image/jpeg', NULL, NULL, NULL, 0),
(18, '10478687_10204170682657343_2480811055040251161_n.jpg', 10074, 'image/jpeg', NULL, NULL, NULL, 0),
(19, '10360701_715137735217956_956664270154248596_n.jpg', 14174, 'image/jpeg', NULL, NULL, NULL, 0),
(20, '10422964_10202521965186002_4437293230341859065_n.jpg', 11992, 'image/jpeg', NULL, NULL, NULL, 0),
(21, 'fdd (1).jpg', 64247, 'image/jpeg', NULL, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `img`
--

CREATE TABLE IF NOT EXISTS `img` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `filename` varchar(255) NOT NULL,
  `title` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE IF NOT EXISTS `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quantity` varchar(45) DEFAULT NULL,
  `note` varchar(45) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `admin_id` int(11) NOT NULL,
  `file` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `name` varchar(31) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`admin_id`,`file`,`category_id`),
  KEY `fk_item_admin1_idx` (`admin_id`),
  KEY `fk_item_file1_idx` (`file`),
  KEY `fk_item_category1_idx` (`category_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `quantity`, `note`, `price`, `status`, `admin_id`, `file`, `category_id`, `name`, `store_id`) VALUES
(1, '123', '123', 123, '123', 0, 0, 123, '123', 0),
(2, '123', '123', 123, '123', 0, 0, 123, '123', 0),
(3, '123131', '12321', 123213, '321313', 0, 0, 123232, '1231232', 0),
(4, '1313', '1313', 1313, '1313', 0, 0, 1313, 'a2a2', 0),
(6, '02', '02', 2, '02', 0, 0, 2, 'zza', 0),
(7, '1121', '1121', 1121, '1121', 0, 0, 1121, 'zzazaz', 0),
(9, '123', '123', 123, '123', 50, 0, 123, 'asooo', 15),
(12, 'zz', 'zz', 0, 'zz', 49, 0, 0, 'zz', 14),
(13, '23', 'zz', 4444444, 'zz', 49, 0, 11, 'zz', 14);

-- --------------------------------------------------------

--
-- Table structure for table `store`
--

CREATE TABLE IF NOT EXISTS `store` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `name` varchar(16) NOT NULL,
  `address` varchar(51) NOT NULL,
  `phone` int(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `store`
--

INSERT INTO `store` (`id`, `name`, `address`, `phone`) VALUES
(5, 'tes', '', 0),
(15, 'asooo', '', 0),
(16, 'ryan', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `storeid` int(11) DEFAULT NULL,
  `level` varchar(45) DEFAULT NULL,
  `isactive` int(11) DEFAULT NULL,
  PRIMARY KEY (`userid`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=52 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`userid`, `username`, `password`, `name`, `storeid`, `level`, `isactive`) VALUES
(1, 'ex username', 'ex password', 'ex name', 1, 'admin', 1),
(21, 'admin', 'admin', 'admin', 1, 'admin', 1),
(22, 'tess', '123', 'tes', NULL, NULL, 0),
(23, 'user', 'user', 'user', NULL, NULL, 1),
(24, 'asdasd', 'asdasd', 'asdasd', NULL, NULL, 1),
(26, 'movelikejagger', 'movelikejagger', 'movelikejagger', NULL, NULL, 1),
(29, 'movelikejaggera', 'movelikejagger', 'movelikejagger', NULL, NULL, NULL),
(32, '123asd', '123asd', '123asd', NULL, NULL, NULL),
(34, '1345647', '1345647', '1345647', NULL, NULL, 1),
(36, 'zz', 'zz', 'zz', NULL, NULL, NULL),
(38, 'asdas', 'asdas', 'asdas', NULL, NULL, NULL),
(40, '1a1awwweee', '1a1awwweee', '1a1awwweee', NULL, NULL, NULL),
(42, '12012', '12012', '12012', NULL, NULL, NULL),
(44, 'tesst', 'tesst', 'tesst', NULL, NULL, NULL),
(46, 'zaza', 'zaza', 'zaza', NULL, NULL, NULL),
(48, 'thiswork', 'thiswork', 'thiswork', NULL, NULL, NULL),
(49, 'awaw', 'awaw', 'awaw', 14, NULL, 1),
(50, 'asooo', 'asooo', 'asooo', 15, NULL, 1),
(51, 'ryan', 'ryan', 'ryan', 16, NULL, 1);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
