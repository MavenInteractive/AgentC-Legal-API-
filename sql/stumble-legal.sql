-- phpMyAdmin SQL Dump
-- version 4.4.8
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 16, 2016 at 01:58 PM
-- Server version: 5.6.28-0ubuntu0.15.10.1
-- PHP Version: 5.6.11-1ubuntu3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `stumble-legal`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE IF NOT EXISTS `admins` (
  `id` bigint(11) unsigned NOT NULL,
  `username` char(50) NOT NULL DEFAULT '',
  `password` char(50) NOT NULL DEFAULT ''
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `username`, `password`) VALUES
(1, 'stumble', '2fbd4ee396cdac223059952a7fe01e54');

-- --------------------------------------------------------

--
-- Table structure for table `associates`
--

CREATE TABLE IF NOT EXISTS `associates` (
  `id` bigint(11) unsigned NOT NULL,
  `username` char(50) NOT NULL DEFAULT '',
  `password` char(50) NOT NULL DEFAULT '',
  `fullname` char(50) NOT NULL DEFAULT '',
  `email` char(50) NOT NULL DEFAULT '',
  `phone` char(50) NOT NULL DEFAULT '',
  `photo` char(255) DEFAULT '',
  `law_firm` char(255) NOT NULL DEFAULT '',
  `position` char(50) NOT NULL DEFAULT '',
  `city` char(50) NOT NULL DEFAULT '',
  `law_society_ref_number` char(50) NOT NULL DEFAULT '',
  `association_number` char(50) NOT NULL DEFAULT '',
  `is_private` tinyint(11) NOT NULL DEFAULT '0',
  `status` tinyint(11) NOT NULL DEFAULT '1',
  `alert_settings` int(11) NOT NULL DEFAULT '5',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `insert_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `associates`
--

INSERT INTO `associates` (`id`, `username`, `password`, `fullname`, `email`, `phone`, `photo`, `law_firm`, `position`, `city`, `law_society_ref_number`, `association_number`, `is_private`, `status`, `alert_settings`, `updated_at`, `insert_time`) VALUES
(1, 'adam', 'adam', 'Adam Warlock', 'adam@stumble.com', '1234567', 'adam', 'AW Associates', 'CEO', 'Sydney', '', '', 0, 1, 5, '2016-04-15 14:55:44', '2015-06-26 08:59:19'),
(2, 'bruce', 'bruce', 'Bruce Wayne', '', '2345678', 'bruce', 'Wayne Associates', 'CTO', 'New South Wales', '', '', 0, 1, 5, '2016-04-15 14:55:44', '2015-06-26 09:00:10'),
(3, 'clark', 'clark', 'Clark Kent', 'clark@stumble.com', '', 'http://stumble.loc/photo/file/phpZ83lkB_20150710003931.jpg', 'Kent Law Firm', 'COO', 'Adelaide', '', '', 0, 1, 5, '2016-04-15 14:55:44', '2015-06-26 09:00:32'),
(4, 'daenerys', 'daenerys', 'Daenerys Stormborn', 'daenerys@stumble.com', '4567890', 'daenerys', 'Targeryan Associates', 'CFO', 'Queensland', '', '', 0, 1, 5, '2016-04-15 14:55:44', '2015-06-26 09:01:18'),
(5, 'barry', 'barry', 'Barry Allen', 'barry@stumble.com', '', 'barry', 'Allen & West Associates', '', 'Melbourne', '', '', 0, 1, 5, '2016-04-15 14:55:44', '2015-06-29 12:34:47'),
(6, 'charles', 'charles', 'Charles Xavier', 'charles@stumble.com', '6789012', 'charles', 'Xavier Law Firm', 'LTO', 'Brisbane', '', '', 0, 1, 5, '2016-04-15 14:55:44', '2015-06-29 12:36:56'),
(8, 'tapai', 'tori', 'Philip Agbada', 'philip@realv360.com', '123-4567', 'http://stumble.fullonapps.com/photo/file/phpmziRTd_20150730165534.jpg', 'Agbada and Associates', 'Senior Associate', 'Melbourne', '', '', 0, 1, 5, '2016-04-15 14:55:44', '2015-07-08 11:32:54'),
(9, 'Chayana', 'bratfeatures', 'Chayana Miers', 'chayana@mierslegal.com.au', '0424296663', 'http://stumble.fullonapps.com/photo/device/device_name/file/phpK41cDN_20160120051014.jpg', 'Miers Legal', 'Principal', 'Sydney', '55583', '', 0, 1, 5, '2016-04-15 14:55:44', '2015-07-21 03:01:42'),
(10, 'Adam Watt', 'Toughguy', 'Adam Watt', 'awpapc@gmail.com', '0404274918', '', 'PAPC', 'My Baby', 'Sydney', 'None', '22323', 0, 1, 5, '2016-04-15 14:55:44', '2015-07-21 14:04:09'),
(11, 'Noren Woo', 'chinita', 'Noren Woo', 'admin@mierslegal.com.au', '0475888610', 'http://stumble.fullonapps.com/photo/file/phpKWACE1_20150722035640.jpg', 'Miers Legal', 'Office Manager', 'Sydney', '', '', 0, 1, 5, '2016-04-15 14:55:44', '2015-07-21 19:55:41'),
(12, 'chetorres', 'm1dn1ght', 'Che Torres', 'cheryl@realv360.com', '+639278534828', 'http://stumble.fullonapps.com/photo/file/php3wriPE_20150727204954.jpg', '', '', 'Gold Coast', '', '', 0, 1, 5, '2016-04-15 14:55:44', '2015-07-27 20:49:55'),
(13, 'Cheryl', 'cheryl', 'Cheryl torres', 'che21_796@yahoo.com', '639278534828', 'http://stumble.fullonapps.com/photo/file/phpMfV57m_20150804060403.jpg', '', '', 'Katherine', '', '', 0, 1, 5, '2016-04-15 14:55:44', '2015-08-04 06:04:04'),
(14, 'Benjoben', 'Chairs', 'Joven Quinones', 'joven@kryptonitedigital.com', '09063006668', '', 'QL Law Firm', 'Attorney at Large', 'Adelaide', '1276', '1234', 0, 1, 5, '2016-04-15 14:55:44', '2015-08-04 06:35:48'),
(15, 'PAPC', 'Papc123', 'Adam Watt', 'adamwatt@me.com', '0404274918', 'http://stumble.fullonapps.com/photo/file/phpcCPqmQ_20150810100300.jpg', 'PAPC', 'Principle', 'Mackay', '', '', 1, 1, 5, '2016-04-15 14:55:44', '2015-08-10 08:48:03'),
(16, 'Alex', '1234', 'Alex Bracewell', 'agb@fullinapps.com', '+639175277801', '', 'ABC LAW', 'CEO', 'Brisbane', '45678', '1234567', 0, 1, 5, '2016-04-15 14:55:44', '2015-08-13 06:27:03'),
(17, 'Kryptstella', 'mystuff1990', 'Estella Lantot', 'stellakryptonite@gmail.com', '09435578868', '', '', '', 'Geelong', '', '', 0, 1, 5, '2016-04-15 14:55:44', '2015-08-17 07:29:40'),
(18, 'Jaspier', 'asakapa123', 'Jaspier Asensio', 'asakapa_6969@yahoo.com', '', '', '', '', 'Select City', '', '', 0, 1, 5, '2016-04-15 14:55:44', '2015-08-27 01:17:51'),
(19, 'delmarz', 'asakapa123', 'Delmas', 'asakapa_6969@yahoo.com', '', '', '', '', 'Armidale', '', '', 0, 1, 5, '2016-04-15 14:55:44', '2015-08-27 01:21:32'),
(20, 'zramled', 'boangka', 'zramled', 'zramled@asd.com', '', '', '', '', 'Bendigo', '', '', 0, 1, 5, '2016-04-15 14:55:44', '2015-09-07 05:43:04'),
(21, 'Bratfeatures', 'smartypants', 'Chayana Miers', 'chayana@mierslegal.com.au', '93563272', '', 'Miers Legal', 'Principal', 'Sydney', '55583', '55583', 0, 1, 5, '2016-04-15 14:55:44', '2015-12-01 06:01:20'),
(22, 'delmarz90', 'delmarz', 'Delmarz stamped', 'zramled@zramled.com', '51553', '', '', '', 'Select City', '', '', 0, 1, 5, '2016-04-15 14:55:44', '2015-12-10 06:29:32'),
(23, 'cheryltorres', 'm1dn1ght', 'Cheryl Torres', 'cheryl@kryptonitedigital.com', '+639278534828', 'http://stumble.fullonapps.com/photo/device/device_name/file/phpKpdxPD_20160119074550.jpg', '', '', 'Brisbane', '', '', 0, 1, 5, '2016-04-15 14:55:44', '2016-01-19 07:45:52'),
(24, 'Alexa', 'cigar555', 'Alex Bracewell', 'agb@fullonapps.com', '', 'http://stumble.fullonapps.com/photo/device/device_name/file/phpjE6lSQ_20160120081326.jpg', 'ABC', 'Staff', 'Sydney', '87654', '123456', 0, 1, 5, '2016-04-15 14:55:44', '2016-01-20 08:13:28'),
(25, 'Mitchie', 'asdfqwerty', 'Michelle D', 'dayangcomichelle0503@gmail.com', '091743892314', '', '', '', 'Albany', '', '', 0, 1, 5, '2016-04-15 14:55:44', '2016-01-21 11:24:48'),
(26, 'Test', 'Epicentre123', 'Adam', 'adamwatt@me.com', '0404274918', '', 'PAPC', 'Principle', 'Sydney', '', '', 0, 1, 5, '2016-04-15 14:55:44', '2016-01-27 23:34:31'),
(35, 'tapai', 'tori', 'Philip Tori Test', 'philip@realv360.com', '09075713256', 'test.jpg', '2', 'judge', 'new york', '1', '1', 0, 1, 5, '2016-04-15 20:06:58', '2016-04-15 15:05:31');

-- --------------------------------------------------------

--
-- Table structure for table `associate_devices`
--

CREATE TABLE IF NOT EXISTS `associate_devices` (
  `id` bigint(11) unsigned NOT NULL,
  `associate_id` bigint(20) unsigned NOT NULL,
  `device` char(50) NOT NULL DEFAULT '',
  `type` char(20) NOT NULL DEFAULT 'ios',
  `token` char(255) NOT NULL DEFAULT '',
  `insert_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `associate_devices`
--

INSERT INTO `associate_devices` (`id`, `associate_id`, `device`, `type`, `token`, `insert_time`) VALUES
(1, 8, 'iPhone7,1', 'ios', '92763d37306018c25d0d7bf6f90f15bac88a61ed02c187c8604989562187865c', '2015-07-27 20:02:25'),
(2, 12, 'iPhone5,2', 'ios', 'c636f0f5da9a00d0bbf4cdf315c2a0e4fdd24e60e530f6cb25bf4f1deb93b48c', '2015-07-28 06:02:21'),
(3, 12, 'iPhone5,2', 'ios', '331f0a867749eae8e4d650b4225782277344a84ab4ce206cab70aeffc56ac2ff', '2015-07-28 08:34:58'),
(4, 8, 'iPhone7,1', 'ios', '5ecd8438bc2f459e98db01dfdd1c58387f4c196397ae146818bcb440ebb073e5', '2015-07-28 10:03:32'),
(5, 2, 'iPhone7,1', 'ios', '5ecd8438bc2f459e98db01dfdd1c58387f4c196397ae146818bcb440ebb073e5', '2015-07-30 17:21:42'),
(6, 2, 'iPhone5,2', 'ios', 'c636f0f5da9a00d0bbf4cdf315c2a0e4fdd24e60e530f6cb25bf4f1deb93b48c', '2015-08-03 03:56:30'),
(7, 1, 'iPhone5,2', 'ios', 'c636f0f5da9a00d0bbf4cdf315c2a0e4fdd24e60e530f6cb25bf4f1deb93b48c', '2015-08-03 03:58:33'),
(8, 3, 'iPhone7,1', 'ios', '92763d37306018c25d0d7bf6f90f15bac88a61ed02c187c8604989562187865c', '2015-08-04 06:19:53'),
(9, 9, 'iPhone7,2', 'ios', '1eb93487ab84f850fdba74f5dc8c5525e1e108d066a3ee2c55fa34fbfaab81a8', '2015-08-04 08:58:20'),
(10, 8, 'iPhone7,2', 'ios', '97fcdda9a6aac06ef23d05fc16743b1c688bd699c36cbd2396c353446d18d527', '2015-08-04 11:02:20'),
(11, 14, 'iPhone4,1', 'ios', 'c85dad23a2b3677e54e041c77996a4d02855e2c13a22f8c6ea171384e1fe22a2', '2015-08-10 05:24:27'),
(12, 15, 'iPhone7,2', 'ios', '5679ae80edaa5d00cd22370a158a3296f5a7559d3420a49e6adac6fe01b76005', '2015-08-10 10:01:46'),
(13, 16, 'iPhone7,1', 'ios', '7b27807d99c0fcaced2e86b6005c5d67c73cb3f229f59ec17af1390fe1d2e409', '2015-08-14 08:05:27'),
(14, 17, 'iPhone4,1', 'ios', 'aa3d6725f9bb03b5ddb24b5831c3f1b0190ae6705139e91d629bb85399242e68', '2015-08-17 09:30:10'),
(15, 13, 'iPhone5,2', 'ios', 'c636f0f5da9a00d0bbf4cdf315c2a0e4fdd24e60e530f6cb25bf4f1deb93b48c', '2015-08-19 03:08:47'),
(16, 19, 'iPhone4,1', 'ios', 'aa3d6725f9bb03b5ddb24b5831c3f1b0190ae6705139e91d629bb85399242e68', '2015-08-27 01:31:36'),
(17, 13, 'iPhone5,2', 'ios', '331f0a867749eae8e4d650b4225782277344a84ab4ce206cab70aeffc56ac2ff', '2015-10-06 06:24:10'),
(18, 8, 'iPhone7,1', 'ios', '51ce61147ce5d05be9364f8dd68a850f61b01b9e317eb3e681589feeadd3883c', '2015-12-01 07:18:25'),
(19, 21, 'iPhone7,2', 'ios', '1eb93487ab84f850fdba74f5dc8c5525e1e108d066a3ee2c55fa34fbfaab81a8', '2015-12-02 21:55:06'),
(20, 22, 'iPhone7,2', 'ios', 'b16b07811a3b0c9eb14e8fc4d15d503492321cf4710707f578c328c26e5e9a0e', '2015-12-10 07:10:09'),
(21, 8, 'iPhone7,1', 'ios', 'e60a14557fb31486554924d59cf582826086051cd6aed0c94ab8f2d9cb1f4c8f', '2016-01-15 11:21:06'),
(22, 8, 'iPhone7,1', 'ios', '5d480533c05c38f0032c8502a6c30befb26cab9ff9e699260229ef63dc713735', '2016-01-18 14:19:04'),
(23, 9, 'iPhone7,2', 'ios', '9aa40222a89853260281440be70939ba1ba1b17b8caec14f37c28a90ba5c0a71', '2016-01-19 08:01:41'),
(24, 23, 'iPhone8,1', 'ios', '0f57034d621b1d7b3de0dc90c2aedef0ad8421fa7d0ce03530eb7337648606c2', '2016-01-22 03:38:27'),
(25, 24, 'iPhone8,2', 'ios', '41ae9527c3093d359a44b4f61efa4ac3685f76c366e430105ec6c2a55c7cf08d', '2016-01-24 05:37:18'),
(26, 26, 'iPhone7,2', 'ios', '7727829febc15625301c3ce4997ac17b2168a1d74c0733a230f44fc56d3ace93', '2016-01-28 07:15:22');

-- --------------------------------------------------------

--
-- Table structure for table `associate_location`
--

CREATE TABLE IF NOT EXISTS `associate_location` (
  `id` bigint(11) unsigned NOT NULL,
  `associate_id` bigint(11) unsigned NOT NULL,
  `court_id` bigint(11) unsigned NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `distance` float NOT NULL DEFAULT '0',
  `insert_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `associate_location`
--

INSERT INTO `associate_location` (`id`, `associate_id`, `court_id`, `date_time`, `distance`, `insert_time`) VALUES
(1, 12, 174, '2015-08-18 04:37:04', 0.0255901, '2015-07-27 20:50:27'),
(3, 2, 174, '2015-08-03 20:34:47', 0.884516, '2015-08-03 03:57:03'),
(4, 1, 42, '2015-10-06 10:30:40', 0, '2015-08-03 03:59:05'),
(6, 3, 174, '2015-08-15 10:40:57', 0.012183, '2015-08-04 06:20:24'),
(8, 15, 42, '2015-08-10 10:04:18', 0.593858, '2015-08-10 08:48:36'),
(9, 16, 174, '2015-08-13 09:31:16', 0.579591, '2015-08-13 06:27:35'),
(27, 21, 156, '2015-12-23 07:06:15', 0.348755, '2015-12-01 07:46:45'),
(28, 21, 169, '2015-12-23 07:06:15', 0.348755, '2015-12-01 07:46:45'),
(29, 21, 42, '2015-12-23 07:06:15', 0.348755, '2015-12-01 07:46:45'),
(30, 21, 167, '2015-12-23 07:06:15', 0.348755, '2015-12-01 07:46:45'),
(31, 21, 172, '2015-12-23 07:06:15', 0.506194, '2015-12-01 07:46:45'),
(32, 21, 29, '2015-12-23 07:06:15', 0.507811, '2015-12-01 07:46:45'),
(33, 21, 170, '2015-12-23 07:06:15', 0.57545, '2015-12-01 07:46:45'),
(44, 13, 174, '2015-12-18 07:51:46', 0.020877, '2015-12-18 07:51:19'),
(45, 21, 158, '2015-12-23 07:06:15', 0.757878, '2015-12-23 07:05:20'),
(46, 9, 42, '2016-01-28 18:32:17', 0.363691, '2016-01-19 08:01:48'),
(47, 9, 167, '2016-01-28 18:32:17', 0.363691, '2016-01-19 08:01:48'),
(48, 9, 156, '2016-01-28 18:32:17', 0.363691, '2016-01-19 08:01:48'),
(49, 9, 169, '2016-01-28 18:32:17', 0.363691, '2016-01-19 08:01:48'),
(50, 9, 172, '2016-01-28 18:32:17', 0.517368, '2016-01-19 08:01:48'),
(63, 9, 29, '2016-01-28 18:32:17', 0.527128, '2016-01-28 18:31:52'),
(64, 9, 170, '2016-01-28 18:32:17', 0.596393, '2016-01-28 18:31:52'),
(65, 9, 158, '2016-01-28 18:32:17', 0.768076, '2016-01-28 18:31:52');

-- --------------------------------------------------------

--
-- Table structure for table `auth`
--

CREATE TABLE IF NOT EXISTS `auth` (
  `id` bigint(11) unsigned NOT NULL,
  `key` char(64) NOT NULL DEFAULT '',
  `secret` char(64) NOT NULL DEFAULT '',
  `type` char(10) NOT NULL DEFAULT '',
  `version` float unsigned NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth`
--

INSERT INTO `auth` (`id`, `key`, `secret`, `type`, `version`) VALUES
(1, '8EF86366AE6E69542FD587FD627F2', 'D2444A6FF899B9D42C88255442B6B', 'ios', 1),
(2, '2867a14229ab3af583e75511f99f9735', 'e84e30b9390cdb64db6db2c9ab87846d', 'android', 1);

-- --------------------------------------------------------

--
-- Table structure for table `courts`
--

CREATE TABLE IF NOT EXISTS `courts` (
  `id` bigint(11) unsigned NOT NULL,
  `name` char(50) NOT NULL DEFAULT '',
  `address` char(255) NOT NULL DEFAULT '',
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `insert_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=175 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `courts`
--

INSERT INTO `courts` (`id`, `name`, `address`, `latitude`, `longitude`, `insert_time`) VALUES
(1, 'Albion Park', '96 Tongarra Rd', -34.569774, 150.778951, '2015-06-22 15:39:02'),
(2, 'Albury', '515 Olive St', -36.080162048339844, 146.91787719726562, '2015-06-22 15:39:02'),
(3, 'Armidale', '5 Moore St', -30.512615203857422, 151.6656494140625, '2015-06-22 15:39:02'),
(4, 'Ballina', 'River St', -28.86896324157715, 153.5565948486328, '2015-06-22 15:39:02'),
(5, 'Balmain', '368 Darling St', -33.85661315917969, 151.1773223876953, '2015-06-22 15:39:02'),
(6, 'Balranald', 'Council Chambers 70 Market St', -34.64164352416992, 143.56539916992188, '2015-06-22 15:39:02'),
(7, 'Bankstown', 'Cnr Chapel Road & The Mall', -33.917232513427734, 151.03292846679688, '2015-06-22 15:39:02'),
(8, 'Batemans Bay', '24 Orient St', -35.70766067504883, 150.17745971679688, '2015-06-22 15:39:02'),
(9, 'Bathurst', 'Russell St', -33.419105529785156, 149.57997131347656, '2015-06-22 15:39:02'),
(10, 'Bega', 'Cnr Gipps & Carp St', -36.67427444458008, 149.84326171875, '2015-06-22 15:39:02'),
(11, 'Bellingen', '48 Hyde St', -30.452739715576172, 152.8975830078125, '2015-06-22 15:39:02'),
(12, 'Belmont', '530 Pacific Highway', -33.03477478027344, 151.66061401367188, '2015-06-22 15:39:02'),
(13, 'Bidura Children''s', '357 Glebe Point Rd?Glebe', -33.87611770629883, 151.18515014648438, '2015-06-22 15:39:02'),
(14, 'Blacktown', '1 Kildare Rd', -33.76885986328125, 150.9058837890625, '2015-06-22 15:39:02'),
(15, 'Blayney', 'Adelaide St', -33.532466888427734, 149.2552490234375, '2015-06-22 15:39:02'),
(16, 'Boggabilla', 'Merriwa St', -28.602680206298828, 150.3600311279297, '2015-06-22 15:39:02'),
(17, 'Bombala', 'High St', -36.90706253051758, 149.2379608154297, '2015-06-22 15:39:02'),
(18, 'Bourke', '55-57 Oxley St', -30.08967399597168, 145.93724060058594, '2015-06-22 15:39:02'),
(19, 'Braidwood', 'C/- Court house Queanbeyan', -35.35490036010742, 149.23121643066406, '2015-06-22 15:39:02'),
(20, 'Brewarrina', 'Bathurst St', -29.961416244506836, 146.8588104248047, '2015-06-22 15:39:02'),
(21, 'Broadmeadow Children''s', '19-23 Lambton Road?Broadmeadow', -32.92494583129883, 151.7349853515625, '2015-06-22 15:39:02'),
(22, 'Broken Hill', 'Argent St', -31.954984664916992, 141.4710235595703, '2015-06-22 15:39:02'),
(23, 'Burwood', '7-9 Belmore St', -33.87909698486328, 151.10476684570312, '2015-06-22 15:39:02'),
(24, 'Byron Bay', 'Middleton St', -28.645429611206055, 153.61460876464844, '2015-06-22 15:39:02'),
(25, 'Camden', 'John Street', -34.0535888671875, 150.69522094726562, '2015-06-22 15:39:02'),
(26, 'Campbelltown', 'Railway St', -34.06486129760742, 150.8150177001953, '2015-06-22 15:39:02'),
(27, 'Campbelltown Children''s', 'Queen St', -34.06456756591797, 150.816162109375, '2015-06-22 15:39:02'),
(28, 'Casino', 'Walker Street', -28.867895126342773, 153.0473175048828, '2015-06-22 15:39:02'),
(29, 'Central (criminal cases ONLY)', '98 Liverpool St?Sydney', -33.875972747802734, 151.20706176757812, '2015-06-22 15:39:02'),
(30, 'Cessnock', 'Maitland Rd', -32.8286247253418, 151.37872314453125, '2015-06-22 15:39:02'),
(31, 'Cobar', '31 Barton St', -31.498916625976562, 145.8362274169922, '2015-06-22 15:39:02'),
(32, 'Coffs Harbour', '20 Moonee St', -30.297203063964844, 153.11207580566406, '2015-06-22 15:39:02'),
(33, 'Condobolin', 'Bathurst St', -33.08777618408203, 147.14418029785156, '2015-06-22 15:39:02'),
(34, 'Cooma', 'Vale St', -36.23746871948242, 149.12620544433594, '2015-06-22 15:39:02'),
(35, 'Coonabarabran', 'Cnr John & Delgarno Sts', -31.27391242980957, 149.2774200439453, '2015-06-22 15:39:02'),
(36, 'Coonamble', '27 Aberford St', -30.95450782775879, 148.38995361328125, '2015-06-22 15:39:02'),
(37, 'Cootamundra', '298 Parker St', -34.63888168334961, 148.02383422851562, '2015-06-22 15:39:02'),
(38, 'Corowa', 'Cnr Church & Queen Sts', -35.99797821044922, 146.39002990722656, '2015-06-22 15:39:02'),
(39, 'Cowra', 'Cnr Kendal & Brisbane Sts', -33.83470916748047, 148.69122314453125, '2015-06-22 15:39:02'),
(40, 'Crookwell', 'Goulburn St', -34.47145462036133, 149.49032592773438, '2015-06-22 15:39:02'),
(41, 'Deniliquin', 'Cnr Poictier & Wellington Sts', -35.533538818359375, 144.96356201171875, '2015-06-22 15:39:02'),
(42, 'Downing Centre Level 5 (civil claims cases ONLY)', '143-147 Liverpool Street', -33.87710952758789, 151.20912170410156, '2015-06-22 15:39:02'),
(43, 'Drug Court', 'Parramatta Court House?12 George Street?Parramatta', -33.81300354003906, 151.00267028808594, '2015-06-22 15:39:02'),
(44, 'Dubbo', 'Brisbane St', -32.244659423828125, 148.60430908203125, '2015-06-22 15:39:02'),
(45, 'Dunedoo', '24 Dilgah St', -32.015968322753906, 149.3882598876953, '2015-06-22 15:39:02'),
(46, 'Dungog', 'Lord St', -32.405548095703125, 151.75430297851562, '2015-06-22 15:39:02'),
(47, 'East Maitland', 'John St', -32.7459716796875, 151.58963012695312, '2015-06-22 15:39:02'),
(48, 'Eden', 'Imlay St', -37.05332946777344, 149.90301513671875, '2015-06-22 15:39:02'),
(49, 'Fairfield', 'Cnr Spencer St & Court Rd', -33.870079040527344, 150.95773315429688, '2015-06-22 15:39:02'),
(50, 'Finley', 'Cnr Denison & Headford Sts', -35.64297866821289, 145.57521057128906, '2015-06-22 15:39:02'),
(51, 'Forbes', 'Victoria Lane', -33.3869514465332, 148.00894165039062, '2015-06-22 15:39:02'),
(52, 'Forster', 'Lake St', -32.18336486816406, 152.5210418701172, '2015-06-22 15:39:02'),
(53, 'Gilgandra', '10 Myrtle St', -31.71004867553711, 148.667236328125, '2015-06-22 15:39:02'),
(54, 'Glen Innes', 'Grey St', -29.738758087158203, 151.7355499267578, '2015-06-22 15:39:02'),
(55, 'Gloucester', 'Church St', -32.01432418823242, 151.95748901367188, '2015-06-22 15:39:02'),
(56, 'Gosford', 'Donnison St & Henry Parry Drive', -33.42728042602539, 151.34425354003906, '2015-06-22 15:39:02'),
(57, 'Goulburn', 'Montague St', -34.75341796875, 149.71629333496094, '2015-06-22 15:39:02'),
(58, 'Grafton', '47 Victoria St', -29.692684173583984, 152.93321228027344, '2015-06-22 15:39:02'),
(59, 'Grenfell', 'Camp St', -33.894737243652344, 148.1593780517578, '2015-06-22 15:39:02'),
(60, 'Griffith', 'Banna Avenue', -34.28864288330078, 146.05075073242188, '2015-06-22 15:39:02'),
(61, 'Gulgong', 'Herbert St', -32.362361907958984, 149.53359985351562, '2015-06-22 15:39:02'),
(62, 'Gundagai', '161-169 Sheridan St', -35.06448745727539, 148.10501098632812, '2015-06-22 15:39:02'),
(63, 'Gunnedah', 'Conadilly St', -30.974201202392578, 150.2457733154297, '2015-06-22 15:39:02'),
(64, 'Hay', 'Cnr Moppett & Pine Sts', -34.50845718383789, 144.8411102294922, '2015-06-22 15:39:02'),
(65, 'Hillston', 'Cnr Molesworth & McGee Streets', -33.486480712890625, 145.53224182128906, '2015-06-22 15:39:02'),
(66, 'Holbrook', 'Albury St', -35.72318649291992, 147.31431579589844, '2015-06-22 15:39:02'),
(67, 'Hornsby', '294 Pacific Highway', -33.70098114013672, 151.0973358154297, '2015-06-22 15:39:02'),
(68, 'Inverell', 'Otho Street', -29.776275634765625, 151.1134490966797, '2015-06-22 15:39:02'),
(69, 'Junee', 'Belmore Street', -34.87188720703125, 147.5870819091797, '2015-06-22 15:39:02'),
(70, 'Katoomba', '5-7 Civic Place', -33.710731506347656, 150.31387329101562, '2015-06-22 15:39:02'),
(71, 'Kempsey', '2 Sea Street West Kempsey', -31.078826904296875, 152.83151245117188, '2015-06-22 15:39:02'),
(72, 'Kiama', '34-36 Terralong Street', -34.66755294799805, 150.85012817382812, '2015-06-22 15:39:02'),
(73, 'Kogarah', '17 Montgomery Street', -33.96400833129883, 151.1338348388672, '2015-06-22 15:39:02'),
(74, 'Kurri Kurri', 'Cnr Victoria & Lang Streets', -32.818790435791016, 151.48060607910156, '2015-06-22 15:39:02'),
(75, 'Kyogle', 'Geneva Street', -28.620058059692383, 153.00511169433594, '2015-06-22 15:39:02'),
(76, 'Lake Cargelligo', '51 Canada Street', -33.29961395263672, 146.3745880126953, '2015-06-22 15:39:02'),
(77, 'Leeton', 'Church Street', -34.55445098876953, 146.40443420410156, '2015-06-22 15:39:02'),
(78, 'Lightning Ridge', 'Cnr Opal & Morilla Street', -29.42778968811035, 147.9789581298828, '2015-06-22 15:39:02'),
(79, 'Lismore', '9-11 Zadoc Street', -28.80539321899414, 153.27951049804688, '2015-06-22 15:39:02'),
(80, 'Lithgow', 'Cnr Bridge & Mort Streets', -33.48104476928711, 150.16136169433594, '2015-06-22 15:39:02'),
(81, 'Liverpool', '150 George St', -33.9205207824707, 150.92515563964844, '2015-06-22 15:39:02'),
(82, 'Lockhart', 'Cnr Mathews & Hebden Streets', -35.22229766845703, 146.71603393554688, '2015-06-22 15:39:02'),
(83, 'Macksville', 'River Street', -30.707340240478516, 152.9253387451172, '2015-06-22 15:39:02'),
(84, 'Maclean', 'Macnaughton Place', -29.45789337158203, 153.1963348388672, '2015-06-22 15:39:02'),
(85, 'Maitland', 'High Street', -32.73489761352539, 151.55873107910156, '2015-06-22 15:39:02'),
(86, 'Manilla', 'Cnr Court and Manilla Streets', -30.74968719482422, 150.72119140625, '2015-06-22 15:39:02'),
(87, 'Manly', '2 Belgrave Street', -33.79840850830078, 151.2847137451172, '2015-06-22 15:39:02'),
(88, 'Milton', 'Princes Highway', -35.317787170410156, 150.4402313232422, '2015-06-22 15:39:02'),
(89, 'Moama', 'Cnr Francis and Maiden Streets', -36.10997009277344, 144.75816345214844, '2015-06-22 15:39:02'),
(90, 'Moree', 'Frome Street', -29.480623245239258, 149.84483337402344, '2015-06-22 15:39:02'),
(91, 'Moruya', 'Vulcan Street', -35.90907287597656, 150.08106994628906, '2015-06-22 15:39:02'),
(92, 'Moss Vale', 'Argyle Street', -34.5405387878418, 150.38706970214844, '2015-06-22 15:39:02'),
(93, 'Moulamein', 'Tallow Street', -35.08881759643555, 144.03457641601562, '2015-06-22 15:39:02'),
(94, 'Mt Druitt', '59 North Parade', -33.7691535949707, 150.822509765625, '2015-06-22 15:39:02'),
(95, 'Mudgee', '96 Market Street', -32.58964157104492, 149.5823974609375, '2015-06-22 15:39:02'),
(96, 'Mullumbimby', 'Dalley Street', -28.55217742919922, 153.4998016357422, '2015-06-22 15:39:02'),
(97, 'Mungindi', '146 St George Street', -28.977420806884766, 148.9903106689453, '2015-06-22 15:39:02'),
(98, 'Murrurundi', 'Murulla Street', -31.763996124267578, 150.82980346679688, '2015-06-22 15:39:02'),
(99, 'Murwillumbah', '61 Main Street', -28.326396942138672, 153.39515686035156, '2015-06-22 15:39:02'),
(100, 'Muswellbrook', 'Bridge Street', -32.25985336303711, 150.8894805908203, '2015-06-22 15:39:02'),
(101, 'Narooma', 'Princess Highway', -36.21602249145508, 150.13018798828125, '2015-06-22 15:39:02'),
(102, 'Narrabri', '56 Maitland Street', -30.328819274902344, 149.7855682373047, '2015-06-22 15:39:02'),
(103, 'Narrandera', 'Cnr Cadell & Larmer Streets', -34.749107360839844, 146.55014038085938, '2015-06-22 15:39:02'),
(104, 'Narromine', '47 Merilba Street', -32.233070373535156, 148.24148559570312, '2015-06-22 15:39:02'),
(105, 'Newcastle', 'Cnr Church & Bolton Streets', -32.929927825927734, 151.78237915039062, '2015-06-22 15:39:02'),
(106, 'Newtown', '220 Australia Street', -33.89702224731445, 151.17855834960938, '2015-06-22 15:39:02'),
(107, 'North Sydney', '94 Pacific Highway', -33.8383674621582, 151.20632934570312, '2015-06-22 15:39:02'),
(108, 'Nowra', 'Plunkett Street', -34.87880325317383, 150.6018829345703, '2015-06-22 15:39:02'),
(109, 'Nyngan', '77 Cobar Street', -31.563438415527344, 147.1941375732422, '2015-06-22 15:39:02'),
(110, 'Oberon', 'Queen Street', -33.706451416015625, 149.86215209960938, '2015-06-22 15:39:02'),
(111, 'Orange', 'Cnr Lords Place & Byng Street', -33.28171157836914, 149.10133361816406, '2015-06-22 15:39:02'),
(112, 'Parkes', '37 Currajong Street', -33.1268424987793, 148.1746826171875, '2015-06-22 15:39:02'),
(113, 'Parramatta', '12 George Street', -33.81300354003906, 151.00267028808594, '2015-06-22 15:39:02'),
(114, 'Parramatta Children''s', '2 George Street', -33.8125, 151.00091552734375, '2015-06-22 15:39:02'),
(115, 'Peak Hill', 'Derribong Street', -32.72590637207031, 148.1898193359375, '2015-06-22 15:39:02'),
(116, 'Penrith', '62-74 Henry Street', -33.7533073425293, 150.70098876953125, '2015-06-22 15:39:02'),
(117, 'Picton', '88 Argyle Street', -34.168392181396484, 150.61248779296875, '2015-06-22 15:39:02'),
(118, 'Port Kembla', 'Darcy Road', -34.47950744628906, 150.90573120117188, '2015-06-22 15:39:02'),
(119, 'Port Macquarie', '22-26 Murray Street', -31.43011474609375, 152.9110107421875, '2015-06-22 15:39:02'),
(120, 'Queanbeyan', '2 Farrer Place', -35.35438537597656, 149.2313995361328, '2015-06-22 15:39:02'),
(121, 'Quirindi', 'George Street', -31.5092716217041, 150.67977905273438, '2015-06-22 15:39:02'),
(122, 'Raymond Terrace', 'William Street', -32.76286697387695, 151.7440948486328, '2015-06-22 15:39:02'),
(123, 'Richmond', '288 Windsor Street', -33.59694290161133, 150.7504425048828, '2015-06-22 15:39:02'),
(124, 'Ryde', '814 Victoria Road', -33.81548309326172, 151.0995635986328, '2015-06-22 15:39:02'),
(125, 'Rylstone', 'Louee Street', -32.79997253417969, 149.97064208984375, '2015-06-22 15:39:02'),
(126, 'Scone', 'Cnr Liverpool and Main Streets', -32.05089569091797, 150.86868286132812, '2015-06-22 15:39:02'),
(127, 'Singleton', 'Elizabeth Street', -32.56277847290039, 151.1728515625, '2015-06-22 15:39:02'),
(128, 'State Coroner''s', '44-46 Parramatta Road', -33.885154724121094, 151.1836700439453, '2015-06-22 15:39:02'),
(129, 'Sutherland', 'Cnr Flora & Belmont Streets', -34.03231430053711, 151.06143188476562, '2015-06-22 15:39:02'),
(130, 'Tamworth', 'Cnr Marius and Fitzroy Streets', -31.090110778808594, 150.93310546875, '2015-06-22 15:39:02'),
(131, 'Taree', '85 Albert Street', -31.91336441040039, 152.45689392089844, '2015-06-22 15:39:02'),
(132, 'Temora', '154 De Boos Street', -34.447731018066406, 147.53565979003906, '2015-06-22 15:39:02'),
(133, 'Tenterfield', '94 Molesworth Street', -29.05017852783203, 152.01803588867188, '2015-06-22 15:39:02'),
(134, 'Toronto', '140-142 Carey Street', -33.01251220703125, 151.5938720703125, '2015-06-22 15:39:02'),
(135, 'Tumbarumba', 'Bridge Street', -35.777462005615234, 148.01280212402344, '2015-06-22 15:39:02'),
(136, 'Tumut', 'Cnr Wynyard and Fitzroy Streets', -35.30062484741211, 148.22494506835938, '2015-06-22 15:39:02'),
(137, 'Tweed Heads', '50-52 Recreation Street', -28.179973602294922, 153.53909301757812, '2015-06-22 15:39:02'),
(138, 'Wagga Wagga', '49 Fitzmaurice Street', -35.10682678222656, 147.37025451660156, '2015-06-22 15:39:02'),
(139, 'Walcha', 'Apsley Street', -30.982831954956055, 151.5913848876953, '2015-06-22 15:39:02'),
(140, 'Walgett', 'Wee Waa Street', -30.022064208984375, 148.11744689941406, '2015-06-22 15:39:02'),
(141, 'Warialda', 'Stephen Street', -29.537668228149414, 150.57565307617188, '2015-06-22 15:39:02'),
(142, 'Warren', '174 Dubbo Street', -31.701805114746094, 147.8382568359375, '2015-06-22 15:39:02'),
(143, 'Wauchope', '41 Hastings Street', -31.45586585998535, 152.73202514648438, '2015-06-22 15:39:02'),
(144, 'Waverley', '151 Bronte Road', -33.897926330566406, 151.2520294189453, '2015-06-22 15:39:02'),
(145, 'Wee Waa', 'Cnr Rose and Nelson Streets', -30.223888397216797, 149.44651794433594, '2015-06-22 15:39:02'),
(146, 'Wellington', 'Cnr Maughan and Arthur Streets', -32.55607604980469, 148.94407653808594, '2015-06-22 15:39:02'),
(147, 'Wentworth', 'Darling Street', -34.101783752441406, 141.91783142089844, '2015-06-22 15:39:02'),
(148, 'West Wyalong', 'Court Street', -33.92478561401367, 147.20362854003906, '2015-06-22 15:39:02'),
(149, 'Wilcannia', 'Reid Street', -31.56083106994629, 143.37586975097656, '2015-06-22 15:39:02'),
(150, 'Windsor', 'Cnr North and Courts Streets', -33.60502624511719, 150.826171875, '2015-06-22 15:39:02'),
(151, 'Wollongong', 'Market and Church Streets', -34.423744201660156, 150.89581298828125, '2015-06-22 15:39:02'),
(152, 'Woy Woy', '78-80 Blackwall Road', -33.48744583129883, 151.32603454589844, '2015-06-22 15:39:02'),
(153, 'Wyong', 'Cnr Hely and Anzac Streets', -33.28168869018555, 151.42437744140625, '2015-06-22 15:39:02'),
(154, 'Yass', 'Cnr Rossi & Comur Streets', -34.84047317504883, 148.90919494628906, '2015-06-22 15:39:02'),
(155, 'Young', '68-70 Lynch Street', -34.31218338012695, 148.29815673828125, '2015-06-22 15:39:02'),
(156, 'Sydney District Court', '143-147 Liverpool Street', -33.87710952758789, 151.20912170410156, '2015-06-22 15:39:02'),
(157, 'Quenbeyan', '2 Farrer Place', -35.35438537597656, 149.2313995361328, '2015-06-22 15:39:02'),
(158, 'Supreme Court of NSW', 'Level 7-13 Law Courts Building 184 Phillip Street', -33.86903762817383, 151.21156311035156, '2015-06-22 15:39:02'),
(159, 'Children - Bidura', '357 Glebe Point Road', -33.8761100769043, 151.18515014648438, '2015-06-22 15:39:02'),
(160, 'Children - Broadmeadow', '19-23 Lambton Road', -32.92494583129883, 151.7349853515625, '2015-06-22 15:39:02'),
(161, 'Children  - Campbelltown', 'Queen Street', -34.06455993652344, 150.816162109375, '2015-06-22 15:39:02'),
(162, 'Children – Port Kembla', 'Darcy Road', -34.47949981689453, 150.90573120117188, '2015-06-22 15:39:02'),
(163, 'Children - Parramatta', '2 George Street', -33.8125, 151.00091552734375, '2015-06-22 15:39:02'),
(164, 'Children – Woy Woy', 'Blackwell Road', -33.49296188354492, 151.3275146484375, '2015-06-22 15:39:02'),
(165, 'Children - Wyong', 'corner Hely Street and Anzac Avenue', -33.281436920166016, 151.4226837158203, '2015-06-22 15:39:02'),
(166, 'Drug Court of NSW (Parramatta)', 'Parramatta Court House Ground Floor?12 George Street?Parramatta New South Wales 2150', -33.81300354003906, 151.00267028808594, '2015-06-22 15:39:02'),
(167, 'Drug Court of NSW (Sydney)', 'Downing Centre Court Complex?Lower Ground Floor?143 - 147 Liverpool Street?Sydney NSW 2000', -33.87710952758789, 151.20912170410156, '2015-06-22 15:39:02'),
(168, 'Drug Court of NSW (Hunter)', 'Toronto Court House?140 - 142 Carey Street?Toronto NSW 2283?', -33.01251220703125, 151.5938720703125, '2015-06-22 15:39:02'),
(169, 'Downing Centre Level 4 (criminal and general cases', 'Level 4 Downing Centre 143-147 Liverpool Street', -33.87710952758789, 151.20912170410156, '2015-06-22 15:39:02'),
(170, 'The Land and Environment Court of NSW', 'Level 4 225 Macquarie Street?Windeyer Chambers?Sydney NSW 2000', -33.87364959716797, 151.20689392089844, '2015-06-22 15:39:02'),
(171, 'Family Court of Australia - Parramatta', '1/3 George St Parramatta NSW 2150', -33.81315994262695, 151.0010986328125, '2015-06-22 15:39:02'),
(172, 'Family Court of Australia - Sydney', '97-99 Goulburn St Sydney', -33.87858200073242, 151.2082061767578, '2015-06-22 15:39:02'),
(173, 'Wooloongong', 'Market and Church Streets', -34.423744201660156, 150.89581298828125, '2015-06-22 15:39:02'),
(174, 'ZebuCourt', 'PH', 10.312408, 124.00615, '2015-06-22 15:39:02');

-- --------------------------------------------------------

--
-- Table structure for table `court_details`
--

CREATE TABLE IF NOT EXISTS `court_details` (
  `id` bigint(11) unsigned NOT NULL,
  `court_id` bigint(11) unsigned NOT NULL,
  `type` char(50) NOT NULL DEFAULT '',
  `level` char(50) NOT NULL DEFAULT '',
  `active` tinyint(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=400 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `court_details`
--

INSERT INTO `court_details` (`id`, `court_id`, `type`, `level`, `active`) VALUES
(1, 1, 'Civil', 'Local', 1),
(2, 2, 'Civil', 'Local', 1),
(3, 3, 'Civil', 'Local', 1),
(4, 4, 'Civil', 'Local', 1),
(5, 5, 'Civil', 'Local', 1),
(6, 6, 'Civil', 'Local', 1),
(7, 7, 'Civil', 'Local', 1),
(8, 8, 'Civil', 'Local', 1),
(9, 9, 'Civil', 'Local', 1),
(10, 10, 'Civil', 'Local', 1),
(11, 11, 'Civil', 'Local', 1),
(12, 12, 'Civil', 'Local', 1),
(13, 13, 'Civil', 'Local', 1),
(14, 14, 'Civil', 'Local', 1),
(15, 15, 'Civil', 'Local', 1),
(16, 16, 'Civil', 'Local', 1),
(17, 17, 'Civil', 'Local', 1),
(18, 18, 'Civil', 'Local', 1),
(19, 19, 'Civil', 'Local', 1),
(20, 20, 'Civil', 'Local', 1),
(21, 21, 'Civil', 'Local', 1),
(22, 22, 'Civil', 'Local', 1),
(23, 23, 'Civil', 'Local', 1),
(24, 24, 'Civil', 'Local', 1),
(25, 25, 'Civil', 'Local', 1),
(26, 26, 'Civil', 'Local', 1),
(27, 27, 'Civil', 'Local', 1),
(28, 28, 'Civil', 'Local', 1),
(29, 29, 'Civil', 'Local', 1),
(30, 30, 'Civil', 'Local', 1),
(31, 31, 'Civil', 'Local', 1),
(32, 32, 'Civil', 'Local', 1),
(33, 33, 'Civil', 'Local', 1),
(34, 34, 'Civil', 'Local', 1),
(35, 35, 'Civil', 'Local', 1),
(36, 36, 'Civil', 'Local', 1),
(37, 37, 'Civil', 'Local', 1),
(38, 38, 'Civil', 'Local', 1),
(39, 39, 'Civil', 'Local', 1),
(40, 40, 'Civil', 'Local', 1),
(41, 41, 'Civil', 'Local', 1),
(42, 42, 'Civil', 'Local', 1),
(43, 43, 'Civil', 'Local', 1),
(44, 44, 'Civil', 'Local', 1),
(45, 45, 'Civil', 'Local', 1),
(46, 46, 'Civil', 'Local', 1),
(47, 47, 'Civil', 'Local', 1),
(48, 48, 'Civil', 'Local', 1),
(49, 49, 'Civil', 'Local', 1),
(50, 50, 'Civil', 'Local', 1),
(51, 51, 'Civil', 'Local', 1),
(52, 52, 'Civil', 'Local', 1),
(53, 53, 'Civil', 'Local', 1),
(54, 54, 'Civil', 'Local', 1),
(55, 55, 'Civil', 'Local', 1),
(56, 56, 'Civil', 'Local', 1),
(57, 57, 'Civil', 'Local', 1),
(58, 58, 'Civil', 'Local', 1),
(59, 59, 'Civil', 'Local', 1),
(60, 60, 'Civil', 'Local', 1),
(61, 61, 'Civil', 'Local', 1),
(62, 62, 'Civil', 'Local', 1),
(63, 63, 'Civil', 'Local', 1),
(64, 64, 'Civil', 'Local', 1),
(65, 65, 'Civil', 'Local', 1),
(66, 66, 'Civil', 'Local', 1),
(67, 67, 'Civil', 'Local', 1),
(68, 68, 'Civil', 'Local', 1),
(69, 69, 'Civil', 'Local', 1),
(70, 70, 'Civil', 'Local', 1),
(71, 71, 'Civil', 'Local', 1),
(72, 72, 'Civil', 'Local', 1),
(73, 73, 'Civil', 'Local', 1),
(74, 74, 'Civil', 'Local', 1),
(75, 75, 'Civil', 'Local', 1),
(76, 76, 'Civil', 'Local', 1),
(77, 77, 'Civil', 'Local', 1),
(78, 78, 'Civil', 'Local', 1),
(79, 79, 'Civil', 'Local', 1),
(80, 80, 'Civil', 'Local', 1),
(81, 81, 'Civil', 'Local', 1),
(82, 82, 'Civil', 'Local', 1),
(83, 83, 'Civil', 'Local', 1),
(84, 84, 'Civil', 'Local', 1),
(85, 85, 'Civil', 'Local', 1),
(86, 86, 'Civil', 'Local', 1),
(87, 87, 'Civil', 'Local', 1),
(88, 88, 'Civil', 'Local', 1),
(89, 89, 'Civil', 'Local', 1),
(90, 90, 'Civil', 'Local', 1),
(91, 91, 'Civil', 'Local', 1),
(92, 92, 'Civil', 'Local', 1),
(93, 93, 'Civil', 'Local', 1),
(94, 94, 'Civil', 'Local', 1),
(95, 95, 'Civil', 'Local', 1),
(96, 96, 'Civil', 'Local', 1),
(97, 97, 'Civil', 'Local', 1),
(98, 98, 'Civil', 'Local', 1),
(99, 99, 'Civil', 'Local', 1),
(100, 100, 'Civil', 'Local', 1),
(101, 101, 'Civil', 'Local', 1),
(102, 102, 'Civil', 'Local', 1),
(103, 103, 'Civil', 'Local', 1),
(104, 104, 'Civil', 'Local', 1),
(105, 105, 'Civil', 'Local', 1),
(106, 106, 'Civil', 'Local', 1),
(107, 107, 'Civil', 'Local', 1),
(108, 108, 'Civil', 'Local', 1),
(109, 109, 'Civil', 'Local', 1),
(110, 110, 'Civil', 'Local', 1),
(111, 111, 'Civil', 'Local', 1),
(112, 112, 'Civil', 'Local', 1),
(113, 113, 'Civil', 'Local', 1),
(114, 114, 'Civil', 'Local', 1),
(115, 115, 'Civil', 'Local', 1),
(116, 116, 'Civil', 'Local', 1),
(117, 117, 'Civil', 'Local', 1),
(118, 118, 'Civil', 'Local', 1),
(119, 119, 'Civil', 'Local', 1),
(120, 120, 'Civil', 'Local', 1),
(121, 121, 'Civil', 'Local', 1),
(122, 122, 'Civil', 'Local', 1),
(123, 123, 'Civil', 'Local', 1),
(124, 124, 'Civil', 'Local', 1),
(125, 125, 'Civil', 'Local', 1),
(126, 126, 'Civil', 'Local', 1),
(127, 127, 'Civil', 'Local', 1),
(128, 128, 'Civil', 'Local', 1),
(129, 129, 'Civil', 'Local', 1),
(130, 130, 'Civil', 'Local', 1),
(131, 131, 'Civil', 'Local', 1),
(132, 132, 'Civil', 'Local', 1),
(133, 133, 'Civil', 'Local', 1),
(134, 134, 'Civil', 'Local', 1),
(135, 135, 'Civil', 'Local', 1),
(136, 136, 'Civil', 'Local', 1),
(137, 137, 'Civil', 'Local', 1),
(138, 138, 'Civil', 'Local', 1),
(139, 139, 'Civil', 'Local', 1),
(140, 140, 'Civil', 'Local', 1),
(141, 141, 'Civil', 'Local', 1),
(142, 142, 'Civil', 'Local', 1),
(143, 143, 'Civil', 'Local', 1),
(144, 144, 'Civil', 'Local', 1),
(145, 145, 'Civil', 'Local', 1),
(146, 146, 'Civil', 'Local', 1),
(147, 147, 'Civil', 'Local', 1),
(148, 148, 'Civil', 'Local', 1),
(149, 149, 'Civil', 'Local', 1),
(150, 150, 'Civil', 'Local', 1),
(151, 151, 'Civil', 'Local', 1),
(152, 152, 'Civil', 'Local', 1),
(153, 153, 'Civil', 'Local', 1),
(154, 154, 'Civil', 'Local', 1),
(155, 155, 'Civil', 'Local', 1),
(156, 156, 'Civil', 'District', 1),
(157, 26, 'Civil', 'District', 1),
(158, 113, 'Civil', 'District', 1),
(159, 116, 'Civil', 'District', 1),
(160, 2, 'Civil', 'District', 1),
(161, 3, 'Civil', 'District', 1),
(162, 9, 'Civil', 'District', 1),
(163, 10, 'Civil', 'District', 1),
(164, 18, 'Civil', 'District', 1),
(165, 22, 'Civil', 'District', 1),
(166, 32, 'Civil', 'District', 1),
(167, 36, 'Civil', 'District', 1),
(168, 44, 'Civil', 'District', 1),
(169, 47, 'Civil', 'District', 1),
(170, 56, 'Civil', 'District', 1),
(171, 57, 'Civil', 'District', 1),
(172, 58, 'Civil', 'District', 1),
(173, 60, 'Civil', 'District', 1),
(174, 79, 'Civil', 'District', 1),
(175, 90, 'Civil', 'District', 1),
(176, 105, 'Civil', 'District', 1),
(177, 108, 'Civil', 'District', 1),
(178, 111, 'Civil', 'District', 1),
(179, 112, 'Civil', 'District', 1),
(180, 119, 'Civil', 'District', 1),
(181, 157, 'Civil', 'District', 1),
(182, 130, 'Civil', 'District', 1),
(183, 131, 'Civil', 'District', 1),
(184, 138, 'Civil', 'District', 1),
(185, 151, 'Civil', 'District', 1),
(186, 158, 'Civil', 'Supreme', 1),
(187, 159, 'Criminal', 'Local', 1),
(188, 160, 'Criminal', 'Local', 1),
(189, 161, 'Criminal', 'Local', 1),
(190, 162, 'Criminal', 'Local', 1),
(191, 163, 'Criminal', 'Local', 1),
(192, 164, 'Criminal', 'Local', 1),
(193, 165, 'Criminal', 'Local', 1),
(194, 166, 'Criminal', 'Local', 1),
(195, 167, 'Criminal', 'Local', 1),
(196, 168, 'Criminal', 'Local', 1),
(197, 1, 'Criminal', 'Local', 1),
(198, 2, 'Criminal', 'Local', 1),
(199, 3, 'Criminal', 'Local', 1),
(200, 4, 'Criminal', 'Local', 1),
(201, 5, 'Criminal', 'Local', 1),
(202, 6, 'Criminal', 'Local', 1),
(203, 7, 'Criminal', 'Local', 1),
(204, 8, 'Criminal', 'Local', 1),
(205, 9, 'Criminal', 'Local', 1),
(206, 10, 'Criminal', 'Local', 1),
(207, 11, 'Criminal', 'Local', 1),
(208, 12, 'Criminal', 'Local', 1),
(209, 13, 'Criminal', 'Local', 1),
(210, 14, 'Criminal', 'Local', 1),
(211, 15, 'Criminal', 'Local', 1),
(212, 16, 'Criminal', 'Local', 1),
(213, 17, 'Criminal', 'Local', 1),
(214, 18, 'Criminal', 'Local', 1),
(215, 19, 'Criminal', 'Local', 1),
(216, 20, 'Criminal', 'Local', 1),
(217, 21, 'Criminal', 'Local', 1),
(218, 22, 'Criminal', 'Local', 1),
(219, 23, 'Criminal', 'Local', 1),
(220, 24, 'Criminal', 'Local', 1),
(221, 25, 'Criminal', 'Local', 1),
(222, 26, 'Criminal', 'Local', 1),
(223, 27, 'Criminal', 'Local', 1),
(224, 28, 'Criminal', 'Local', 1),
(225, 29, 'Criminal', 'Local', 1),
(226, 30, 'Criminal', 'Local', 1),
(227, 31, 'Criminal', 'Local', 1),
(228, 32, 'Criminal', 'Local', 1),
(229, 33, 'Criminal', 'Local', 1),
(230, 34, 'Criminal', 'Local', 1),
(231, 35, 'Criminal', 'Local', 1),
(232, 36, 'Criminal', 'Local', 1),
(233, 37, 'Criminal', 'Local', 1),
(234, 38, 'Criminal', 'Local', 1),
(235, 39, 'Criminal', 'Local', 1),
(236, 40, 'Criminal', 'Local', 1),
(237, 41, 'Criminal', 'Local', 1),
(238, 169, 'Criminal', 'Local', 1),
(239, 43, 'Criminal', 'Local', 1),
(240, 44, 'Criminal', 'Local', 1),
(241, 45, 'Criminal', 'Local', 1),
(242, 46, 'Criminal', 'Local', 1),
(243, 47, 'Criminal', 'Local', 1),
(244, 48, 'Criminal', 'Local', 1),
(245, 49, 'Criminal', 'Local', 1),
(246, 50, 'Criminal', 'Local', 1),
(247, 51, 'Criminal', 'Local', 1),
(248, 52, 'Criminal', 'Local', 1),
(249, 53, 'Criminal', 'Local', 1),
(250, 54, 'Criminal', 'Local', 1),
(251, 55, 'Criminal', 'Local', 1),
(252, 56, 'Criminal', 'Local', 1),
(253, 57, 'Criminal', 'Local', 1),
(254, 58, 'Criminal', 'Local', 1),
(255, 59, 'Criminal', 'Local', 1),
(256, 60, 'Criminal', 'Local', 1),
(257, 61, 'Criminal', 'Local', 1),
(258, 62, 'Criminal', 'Local', 1),
(259, 63, 'Criminal', 'Local', 1),
(260, 64, 'Criminal', 'Local', 1),
(261, 65, 'Criminal', 'Local', 1),
(262, 66, 'Criminal', 'Local', 1),
(263, 67, 'Criminal', 'Local', 1),
(264, 68, 'Criminal', 'Local', 1),
(265, 69, 'Criminal', 'Local', 1),
(266, 70, 'Criminal', 'Local', 1),
(267, 71, 'Criminal', 'Local', 1),
(268, 72, 'Criminal', 'Local', 1),
(269, 73, 'Criminal', 'Local', 1),
(270, 74, 'Criminal', 'Local', 1),
(271, 75, 'Criminal', 'Local', 1),
(272, 76, 'Criminal', 'Local', 1),
(273, 77, 'Criminal', 'Local', 1),
(274, 78, 'Criminal', 'Local', 1),
(275, 79, 'Criminal', 'Local', 1),
(276, 80, 'Criminal', 'Local', 1),
(277, 81, 'Criminal', 'Local', 1),
(278, 82, 'Criminal', 'Local', 1),
(279, 83, 'Criminal', 'Local', 1),
(280, 84, 'Criminal', 'Local', 1),
(281, 85, 'Criminal', 'Local', 1),
(282, 86, 'Criminal', 'Local', 1),
(283, 87, 'Criminal', 'Local', 1),
(284, 88, 'Criminal', 'Local', 1),
(285, 89, 'Criminal', 'Local', 1),
(286, 90, 'Criminal', 'Local', 1),
(287, 91, 'Criminal', 'Local', 1),
(288, 92, 'Criminal', 'Local', 1),
(289, 93, 'Criminal', 'Local', 1),
(290, 94, 'Criminal', 'Local', 1),
(291, 95, 'Criminal', 'Local', 1),
(292, 96, 'Criminal', 'Local', 1),
(293, 97, 'Criminal', 'Local', 1),
(294, 98, 'Criminal', 'Local', 1),
(295, 99, 'Criminal', 'Local', 1),
(296, 100, 'Criminal', 'Local', 1),
(297, 101, 'Criminal', 'Local', 1),
(298, 102, 'Criminal', 'Local', 1),
(299, 103, 'Criminal', 'Local', 1),
(300, 104, 'Criminal', 'Local', 1),
(301, 105, 'Criminal', 'Local', 1),
(302, 106, 'Criminal', 'Local', 1),
(303, 107, 'Criminal', 'Local', 1),
(304, 108, 'Criminal', 'Local', 1),
(305, 109, 'Criminal', 'Local', 1),
(306, 110, 'Criminal', 'Local', 1),
(307, 111, 'Criminal', 'Local', 1),
(308, 112, 'Criminal', 'Local', 1),
(309, 113, 'Criminal', 'Local', 1),
(310, 114, 'Criminal', 'Local', 1),
(311, 115, 'Criminal', 'Local', 1),
(312, 116, 'Criminal', 'Local', 1),
(313, 117, 'Criminal', 'Local', 1),
(314, 118, 'Criminal', 'Local', 1),
(315, 119, 'Criminal', 'Local', 1),
(316, 120, 'Criminal', 'Local', 1),
(317, 121, 'Criminal', 'Local', 1),
(318, 122, 'Criminal', 'Local', 1),
(319, 123, 'Criminal', 'Local', 1),
(320, 124, 'Criminal', 'Local', 1),
(321, 125, 'Criminal', 'Local', 1),
(322, 126, 'Criminal', 'Local', 1),
(323, 127, 'Criminal', 'Local', 1),
(324, 128, 'Criminal', 'Local', 1),
(325, 129, 'Criminal', 'Local', 1),
(326, 130, 'Criminal', 'Local', 1),
(327, 131, 'Criminal', 'Local', 1),
(328, 132, 'Criminal', 'Local', 1),
(329, 133, 'Criminal', 'Local', 1),
(330, 134, 'Criminal', 'Local', 1),
(331, 135, 'Criminal', 'Local', 1),
(332, 136, 'Criminal', 'Local', 1),
(333, 137, 'Criminal', 'Local', 1),
(334, 138, 'Criminal', 'Local', 1),
(335, 139, 'Criminal', 'Local', 1),
(336, 140, 'Criminal', 'Local', 1),
(337, 141, 'Criminal', 'Local', 1),
(338, 142, 'Criminal', 'Local', 1),
(339, 143, 'Criminal', 'Local', 1),
(340, 144, 'Criminal', 'Local', 1),
(341, 145, 'Criminal', 'Local', 1),
(342, 146, 'Criminal', 'Local', 1),
(343, 147, 'Criminal', 'Local', 1),
(344, 148, 'Criminal', 'Local', 1),
(345, 149, 'Criminal', 'Local', 1),
(346, 150, 'Criminal', 'Local', 1),
(347, 151, 'Criminal', 'Local', 1),
(348, 152, 'Criminal', 'Local', 1),
(349, 153, 'Criminal', 'Local', 1),
(350, 154, 'Criminal', 'Local', 1),
(351, 155, 'Criminal', 'Local', 1),
(352, 156, 'Criminal', 'District', 1),
(353, 26, 'Criminal', 'District', 1),
(354, 113, 'Criminal', 'District', 1),
(355, 116, 'Criminal', 'District', 1),
(356, 2, 'Criminal', 'District', 1),
(357, 3, 'Criminal', 'District', 1),
(358, 9, 'Criminal', 'District', 1),
(359, 10, 'Criminal', 'District', 1),
(360, 18, 'Criminal', 'District', 1),
(361, 22, 'Criminal', 'District', 1),
(362, 32, 'Criminal', 'District', 1),
(363, 36, 'Criminal', 'District', 1),
(364, 44, 'Criminal', 'District', 1),
(365, 47, 'Criminal', 'District', 1),
(366, 56, 'Criminal', 'District', 1),
(367, 57, 'Criminal', 'District', 1),
(368, 58, 'Criminal', 'District', 1),
(369, 60, 'Criminal', 'District', 1),
(370, 79, 'Criminal', 'District', 1),
(371, 90, 'Criminal', 'District', 1),
(372, 105, 'Criminal', 'District', 1),
(373, 108, 'Criminal', 'District', 1),
(374, 111, 'Criminal', 'District', 1),
(375, 112, 'Criminal', 'District', 1),
(376, 119, 'Criminal', 'District', 1),
(377, 157, 'Criminal', 'District', 1),
(378, 130, 'Criminal', 'District', 1),
(379, 131, 'Criminal', 'District', 1),
(380, 138, 'Criminal', 'District', 1),
(381, 151, 'Criminal', 'District', 1),
(382, 158, 'Criminal', 'Supreme', 1),
(383, 170, 'Environmental', 'District', 1),
(384, 158, 'Environmental', 'Supreme', 1),
(385, 171, 'Family', 'Local', 1),
(386, 172, 'Family', 'Local', 1),
(387, 2, 'Family', 'District', 1),
(388, 3, 'Family', 'District', 1),
(389, 22, 'Family', 'District', 1),
(390, 32, 'Family', 'District', 1),
(391, 44, 'Family', 'District', 1),
(392, 79, 'Family', 'District', 1),
(393, 111, 'Family', 'District', 1),
(394, 119, 'Family', 'District', 1),
(395, 130, 'Family', 'District', 1),
(396, 138, 'Family', 'District', 1),
(397, 173, 'Family', 'District', 1),
(398, 158, 'Family', 'Supreme', 1),
(399, 174, 'Family', 'Local', 1);

-- --------------------------------------------------------

--
-- Table structure for table `favorites`
--

CREATE TABLE IF NOT EXISTS `favorites` (
  `id` bigint(11) unsigned NOT NULL,
  `associate_id` bigint(20) unsigned NOT NULL,
  `other_associate_id` bigint(20) unsigned NOT NULL,
  `insert_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `favorites`
--

INSERT INTO `favorites` (`id`, `associate_id`, `other_associate_id`, `insert_time`) VALUES
(1, 12, 8, '2015-07-28 09:46:36'),
(4, 8, 12, '2015-07-28 09:48:02'),
(5, 12, 2, '2015-07-28 09:48:15'),
(6, 12, 3, '2015-07-28 09:53:20'),
(8, 8, 4, '2015-07-28 10:03:46'),
(9, 12, 10, '2015-08-01 20:56:02'),
(11, 2, 1, '2015-08-03 20:35:07'),
(12, 15, 11, '2015-08-10 08:52:28'),
(13, 15, 9, '2015-08-10 08:52:42'),
(14, 14, 13, '2015-08-19 03:22:28'),
(15, 19, 14, '2015-08-27 01:29:51'),
(16, 8, 1, '2015-10-20 08:30:37'),
(18, 9, 12, '2015-11-18 05:10:31'),
(19, 8, 21, '2016-01-15 11:26:59'),
(20, 25, 5, '2016-02-03 01:08:43'),
(27, 35, 2, '2016-04-16 05:55:02');

-- --------------------------------------------------------

--
-- Table structure for table `message_inboxes`
--

CREATE TABLE IF NOT EXISTS `message_inboxes` (
  `id` bigint(11) unsigned NOT NULL,
  `sender_associate_id` bigint(11) unsigned NOT NULL DEFAULT '0',
  `receiver_associate_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `channel` char(50) NOT NULL DEFAULT '',
  `message` text NOT NULL,
  `insert_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `message_inboxes`
--

INSERT INTO `message_inboxes` (`id`, `sender_associate_id`, `receiver_associate_id`, `channel`, `message`, `insert_time`, `update_time`) VALUES
(1, 8, 1, 'Channel_1-8', 'Hey there', '2015-07-26 06:47:12', '2015-10-06 06:38:53'),
(2, 1, 6, 'Channel_1-6', 'Hi', '2015-07-26 08:03:27', '2015-07-26 08:03:27'),
(3, 12, 8, 'Channel_8-12', 'Hello', '2015-07-27 20:50:43', '2015-10-06 06:32:23'),
(4, 12, 1, 'Channel_1-12', 'Hi', '2015-08-04 06:30:02', '2015-08-04 06:30:02'),
(5, 9, 10, 'Channel_9-10', 'Testing testing', '2015-08-04 09:03:15', '2015-08-04 09:03:20'),
(6, 8, 9, 'Channel_8-9', 'Will you be at Central Court this morning by chance?', '2015-08-04 22:34:36', '2015-08-13 21:58:19'),
(7, 15, 9, 'Channel_9-15', 'Hey are you getting these messages ?', '2015-08-10 08:53:06', '2015-08-10 09:10:22'),
(8, 15, 11, 'Channel_11-15', 'Hi Norin  are you getting these messages', '2015-08-10 09:11:08', '2015-08-10 09:11:08'),
(9, 14, 12, 'Channel_12-14', 'Sabi ni kd you people doesnt want to deal with me kaya i fired myself for this but still they asked me to finish this', '2015-08-14 03:49:58', '2015-11-27 07:35:53'),
(10, 14, 13, 'Channel_13-14', 'Hello need your feedbacks on that modification list, asap', '2015-08-17 05:49:49', '2015-08-17 05:49:49'),
(11, 19, 17, 'Channel_17-19', 'Hi', '2015-08-27 01:27:01', '2015-08-27 01:27:01'),
(12, 20, 20, 'Channel_20-20', '??', '2015-09-08 02:48:57', '2015-09-08 02:49:17'),
(13, 13, 9, 'Channel_9-13', 'Hi Chayana', '2015-10-06 06:25:01', '2015-10-06 06:25:01'),
(14, 13, 8, 'Channel_8-13', 'Testing for build #7', '2015-10-06 07:14:47', '2016-01-15 11:21:34'),
(15, 26, 9, 'Channel_9-26', 'Hey', '2016-01-27 23:53:39', '2016-01-28 07:15:59');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE IF NOT EXISTS `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`migration`, `batch`) VALUES
('2014_04_24_110151_create_oauth_scopes_table', 1),
('2014_04_24_110304_create_oauth_grants_table', 1),
('2014_04_24_110403_create_oauth_grant_scopes_table', 1),
('2014_04_24_110459_create_oauth_clients_table', 1),
('2014_04_24_110557_create_oauth_client_endpoints_table', 1),
('2014_04_24_110705_create_oauth_client_scopes_table', 1),
('2014_04_24_110817_create_oauth_client_grants_table', 1),
('2014_04_24_111002_create_oauth_sessions_table', 1),
('2014_04_24_111109_create_oauth_session_scopes_table', 1),
('2014_04_24_111254_create_oauth_auth_codes_table', 1),
('2014_04_24_111403_create_oauth_auth_code_scopes_table', 1),
('2014_04_24_111518_create_oauth_access_tokens_table', 1),
('2014_04_24_111657_create_oauth_access_token_scopes_table', 1),
('2014_04_24_111810_create_oauth_refresh_tokens_table', 1),
('2014_10_12_000000_create_users_table', 1),
('2014_10_12_100000_create_password_resets_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE IF NOT EXISTS `notifications` (
  `id` bigint(11) unsigned NOT NULL,
  `associate_id` bigint(11) unsigned NOT NULL,
  `other_associate_id` bigint(11) unsigned NOT NULL,
  `notification_type` int(11) unsigned NOT NULL,
  `insert_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `associate_id`, `other_associate_id`, `notification_type`, `insert_time`) VALUES
(1, 8, 1, 3, '2015-07-27 20:06:50'),
(2, 8, 1, 3, '2015-07-27 20:08:56'),
(3, 8, 12, 3, '2015-07-27 20:53:38'),
(4, 12, 8, 7, '2015-07-27 21:24:09'),
(5, 2, 12, 3, '2015-07-28 09:43:16'),
(6, 12, 8, 1, '2015-07-28 09:46:36'),
(7, 8, 12, 2, '2015-07-28 09:46:36'),
(8, 12, 1, 1, '2015-07-28 09:46:52'),
(9, 1, 12, 2, '2015-07-28 09:46:52'),
(10, 8, 1, 1, '2015-07-28 09:47:19'),
(11, 1, 8, 2, '2015-07-28 09:47:19'),
(12, 8, 12, 1, '2015-07-28 09:48:02'),
(13, 12, 8, 2, '2015-07-28 09:48:02'),
(14, 12, 2, 1, '2015-07-28 09:48:15'),
(15, 2, 12, 2, '2015-07-28 09:48:15'),
(16, 12, 3, 1, '2015-07-28 09:53:20'),
(17, 3, 12, 2, '2015-07-28 09:53:20'),
(18, 12, 5, 1, '2015-07-28 10:02:09'),
(19, 5, 12, 2, '2015-07-28 10:02:09'),
(20, 8, 4, 1, '2015-07-28 10:03:46'),
(21, 4, 8, 2, '2015-07-28 10:03:46'),
(22, 1, 8, 3, '2015-07-30 17:13:42'),
(23, 5, 8, 3, '2015-07-30 17:13:42'),
(24, 2, 8, 3, '2015-07-30 17:13:42'),
(25, 5, 8, 6, '2015-07-30 17:14:20'),
(26, 2, 8, 6, '2015-07-30 17:14:20'),
(27, 8, 1, 7, '2015-07-30 17:14:20'),
(28, 1, 8, 3, '2015-08-01 15:25:43'),
(29, 8, 1, 7, '2015-08-01 15:26:32'),
(30, 2, 12, 3, '2015-08-01 16:55:00'),
(31, 11, 12, 3, '2015-08-01 16:55:00'),
(32, 12, 10, 1, '2015-08-01 20:56:03'),
(33, 10, 12, 2, '2015-08-01 20:56:03'),
(34, 2, 1, 1, '2015-08-03 03:56:58'),
(35, 1, 2, 2, '2015-08-03 03:56:58'),
(36, 1, 2, 3, '2015-08-03 03:57:45'),
(37, 2, 1, 7, '2015-08-03 03:59:05'),
(38, 2, 1, 1, '2015-08-03 20:35:07'),
(39, 1, 2, 2, '2015-08-03 20:35:07'),
(40, 8, 12, 3, '2015-08-03 21:28:15'),
(41, 12, 8, 7, '2015-08-03 22:15:54'),
(42, 5, 12, 3, '2015-08-04 06:21:33'),
(43, 3, 12, 3, '2015-08-04 06:21:33'),
(44, 4, 12, 3, '2015-08-04 06:21:33'),
(45, 5, 12, 6, '2015-08-04 06:22:51'),
(46, 4, 12, 6, '2015-08-04 06:22:51'),
(47, 12, 3, 7, '2015-08-04 06:22:51'),
(48, 12, 14, 3, '2015-08-04 06:38:53'),
(49, 14, 12, 7, '2015-08-04 06:40:14'),
(50, 14, 12, 9, '2015-08-04 06:42:12'),
(51, 3, 14, 3, '2015-08-04 06:43:17'),
(52, 14, 3, 7, '2015-08-04 06:43:40'),
(53, 9, 14, 3, '2015-08-04 07:30:37'),
(54, 9, 8, 3, '2015-08-04 23:39:25'),
(55, 8, 9, 7, '2015-08-04 23:40:46'),
(56, 8, 9, 4, '2015-08-05 01:46:22'),
(57, 9, 8, 3, '2015-08-10 05:05:05'),
(58, 8, 9, 7, '2015-08-10 05:05:42'),
(59, 15, 11, 1, '2015-08-10 08:52:28'),
(60, 11, 15, 2, '2015-08-10 08:52:28'),
(61, 15, 9, 1, '2015-08-10 08:52:42'),
(62, 9, 15, 2, '2015-08-10 08:52:42'),
(63, 11, 15, 3, '2015-08-10 09:14:45'),
(64, 9, 15, 3, '2015-08-10 09:15:25'),
(65, 8, 9, 4, '2015-08-11 02:26:32'),
(66, 15, 9, 15, '2015-08-11 02:27:50'),
(67, 12, 14, 3, '2015-08-14 03:49:26'),
(68, 13, 14, 3, '2015-08-17 05:47:31'),
(69, 4, 17, 3, '2015-08-18 08:49:55'),
(70, 11, 17, 3, '2015-08-18 08:50:52'),
(71, 2, 17, 3, '2015-08-18 08:52:59'),
(72, 1, 17, 3, '2015-08-18 08:57:32'),
(73, 16, 17, 3, '2015-08-18 09:20:08'),
(74, 14, 13, 1, '2015-08-19 03:22:28'),
(75, 13, 14, 2, '2015-08-19 03:22:28'),
(76, 17, 19, 3, '2015-08-27 01:26:34'),
(77, 19, 14, 1, '2015-08-27 01:29:51'),
(78, 14, 19, 2, '2015-08-27 01:29:51'),
(79, 17, 14, 3, '2015-08-27 05:23:51'),
(80, 14, 20, 3, '2015-09-07 05:44:56'),
(81, 14, 20, 3, '2015-09-07 05:47:50'),
(82, 14, 20, 3, '2015-09-08 00:57:02'),
(83, 20, 17, 1, '2015-09-08 02:48:25'),
(84, 17, 20, 2, '2015-09-08 02:48:25'),
(85, 20, 17, 1, '2015-09-08 02:48:33'),
(86, 17, 20, 2, '2015-09-08 02:48:33'),
(87, 17, 20, 3, '2015-09-08 02:50:46'),
(88, 11, 20, 3, '2015-09-08 03:39:11'),
(89, 20, 14, 3, '2015-09-11 04:09:03'),
(90, 20, 17, 1, '2015-09-14 05:53:34'),
(91, 17, 20, 2, '2015-09-14 05:53:34'),
(92, 8, 1, 1, '2015-10-20 08:30:37'),
(93, 1, 8, 2, '2015-10-20 08:30:38'),
(94, 9, 12, 1, '2015-11-18 05:10:08'),
(95, 12, 9, 2, '2015-11-18 05:10:08'),
(96, 9, 12, 1, '2015-11-18 05:10:31'),
(97, 12, 9, 2, '2015-11-18 05:10:31'),
(98, 12, 14, 3, '2015-11-27 07:37:04'),
(99, 1, 8, 5, '2016-01-15 11:23:54'),
(100, 1, 8, 5, '2016-01-15 11:24:12'),
(101, 12, 8, 3, '2016-01-15 11:26:18'),
(102, 8, 21, 1, '2016-01-15 11:26:59'),
(103, 21, 8, 2, '2016-01-15 11:26:59'),
(104, 21, 8, 3, '2016-01-15 11:28:16'),
(105, 26, 9, 3, '2016-01-27 23:41:19'),
(106, 9, 26, 3, '2016-01-27 23:59:08'),
(107, 25, 5, 1, '2016-02-03 01:08:43'),
(108, 5, 25, 2, '2016-02-03 01:08:43'),
(109, 12, 8, 3, '2016-02-11 10:04:07'),
(110, 23, 8, 3, '2016-02-11 10:05:11'),
(111, 8, 23, 7, '2016-02-11 10:07:37');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE IF NOT EXISTS `oauth_access_tokens` (
  `id` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `session_id` int(10) unsigned NOT NULL,
  `expire_time` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `session_id`, `expire_time`, `created_at`, `updated_at`) VALUES
('1HlNxIheZdTfqb2kay1Y3NDdmXj6cxgdJET3I980', 2, 1459873319, '2016-04-05 07:21:59', '2016-04-05 07:21:59'),
('5jAFaN4XtLdZyen5GL32vskj6MGJ1YLx4wR8YZvs', 3, 1459874983, '2016-04-05 07:49:43', '2016-04-05 07:49:43'),
('AjOuQiUPrnD72aHtjcbFp1WjdywTT0JmwcvpcZX5', 9, 1460125201, '2016-04-08 05:20:01', '2016-04-08 05:20:01'),
('amcA8znOPRQepAvpgSMcVwSdCbDZcKUVA0KAL0PU', 4, 1459876261, '2016-04-05 08:11:01', '2016-04-05 08:11:01'),
('e97KC7cuOWNtXEPrG2UxP7h48MeTtuVpZ8fFsHjk', 10, 1460127974, '2016-04-08 06:06:14', '2016-04-08 06:06:14'),
('eFZ641BNFTzMt67QuFxXEyzj1EMysFIBLse80b5T', 6, 1460124514, '2016-04-08 05:08:34', '2016-04-08 05:08:34'),
('g5z8fNjUkw0DkFmyM3YzgJ36wqOptLPnTThA2JcD', 8, 1460125200, '2016-04-08 05:20:00', '2016-04-08 05:20:00'),
('PhqsTUenHz11yrFcr8ysoyn6RQWoeEKF1UeSxA9l', 5, 1459925992, '2016-04-05 21:59:52', '2016-04-05 21:59:52'),
('tc3VxeAwr3DaFngEYn6ndfpfdg2ttlC8rU1KjIrk', 7, 1460125197, '2016-04-08 05:19:57', '2016-04-08 05:19:57'),
('ZuxyQP9nSKpjatYVkEhHdhXUPBplaVNutt1XKMDj', 1, 1459866281, '2016-04-05 05:24:41', '2016-04-05 05:24:41');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_token_scopes`
--

CREATE TABLE IF NOT EXISTS `oauth_access_token_scopes` (
  `id` int(10) unsigned NOT NULL,
  `access_token_id` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `scope_id` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE IF NOT EXISTS `oauth_auth_codes` (
  `id` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `session_id` int(10) unsigned NOT NULL,
  `redirect_uri` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `expire_time` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_code_scopes`
--

CREATE TABLE IF NOT EXISTS `oauth_auth_code_scopes` (
  `id` int(10) unsigned NOT NULL,
  `auth_code_id` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `scope_id` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE IF NOT EXISTS `oauth_clients` (
  `id` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `secret` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `secret`, `name`, `created_at`, `updated_at`) VALUES
('1', '1', 'Test', NULL, NULL),
('f3d259ddd3ed8ff3843839b', '4c7f6f8fa93d59c45502c0ae8c4a95b', 'Main website', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_client_endpoints`
--

CREATE TABLE IF NOT EXISTS `oauth_client_endpoints` (
  `id` int(10) unsigned NOT NULL,
  `client_id` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `redirect_uri` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_client_grants`
--

CREATE TABLE IF NOT EXISTS `oauth_client_grants` (
  `id` int(10) unsigned NOT NULL,
  `client_id` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `grant_id` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_client_scopes`
--

CREATE TABLE IF NOT EXISTS `oauth_client_scopes` (
  `id` int(10) unsigned NOT NULL,
  `client_id` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `scope_id` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_grants`
--

CREATE TABLE IF NOT EXISTS `oauth_grants` (
  `id` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_grant_scopes`
--

CREATE TABLE IF NOT EXISTS `oauth_grant_scopes` (
  `id` int(10) unsigned NOT NULL,
  `grant_id` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `scope_id` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE IF NOT EXISTS `oauth_refresh_tokens` (
  `id` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `access_token_id` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `expire_time` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_scopes`
--

CREATE TABLE IF NOT EXISTS `oauth_scopes` (
  `id` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_sessions`
--

CREATE TABLE IF NOT EXISTS `oauth_sessions` (
  `id` int(10) unsigned NOT NULL,
  `client_id` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `owner_type` enum('client','user') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'user',
  `owner_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `client_redirect_uri` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `oauth_sessions`
--

INSERT INTO `oauth_sessions` (`id`, `client_id`, `owner_type`, `owner_id`, `client_redirect_uri`, `created_at`, `updated_at`) VALUES
(1, '1', 'user', '2', NULL, '2016-04-05 05:24:41', '2016-04-05 05:24:41'),
(2, '1', 'user', '2', NULL, '2016-04-05 07:21:59', '2016-04-05 07:21:59'),
(3, '1', 'user', '2', NULL, '2016-04-05 07:49:43', '2016-04-05 07:49:43'),
(4, '1', 'user', '2', NULL, '2016-04-05 08:11:01', '2016-04-05 08:11:01'),
(5, '1', 'user', '2', NULL, '2016-04-05 21:59:52', '2016-04-05 21:59:52'),
(6, '1', 'user', '2', NULL, '2016-04-08 05:08:34', '2016-04-08 05:08:34'),
(7, '1', 'user', '2', NULL, '2016-04-08 05:19:57', '2016-04-08 05:19:57'),
(8, '1', 'user', '2', NULL, '2016-04-08 05:20:00', '2016-04-08 05:20:00'),
(9, '1', 'user', '2', NULL, '2016-04-08 05:20:01', '2016-04-08 05:20:01'),
(10, '1', 'user', '2', NULL, '2016-04-08 06:06:14', '2016-04-08 06:06:14');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_session_scopes`
--

CREATE TABLE IF NOT EXISTS `oauth_session_scopes` (
  `id` int(10) unsigned NOT NULL,
  `session_id` int(10) unsigned NOT NULL,
  `scope_id` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `request_types`
--

CREATE TABLE IF NOT EXISTS `request_types` (
  `id` bigint(11) unsigned NOT NULL,
  `name` char(50) NOT NULL DEFAULT '',
  `description` char(255) NOT NULL DEFAULT '',
  `insert_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `request_types`
--

INSERT INTO `request_types` (`id`, `name`, `description`, `insert_time`) VALUES
(1, 'Arbitration', '', '2015-07-03 11:20:11'),
(2, 'Arraignment', '', '2015-07-03 11:22:15'),
(3, 'Bail', '', '2015-07-03 11:22:32'),
(4, 'Call-over', '', '2015-07-03 11:22:51'),
(5, 'Directions', '', '2015-07-03 11:50:36'),
(6, 'Duty Judge', '', '2015-07-03 11:50:44'),
(7, 'Examination', '', '2015-07-03 11:50:49'),
(8, 'Hearing', '', '2015-07-03 11:50:57'),
(9, 'Judgment', '', '2015-07-03 11:51:02'),
(10, 'Mediation', '', '2015-07-03 11:51:07'),
(11, 'Mention', '', '2015-07-03 11:51:12'),
(12, 'Motion', '', '2015-07-03 11:51:18'),
(13, 'Return of subpoena', '', '2015-07-03 11:51:24'),
(14, 'Review', '', '2015-07-03 11:51:29'),
(15, 'Sentence', '', '2015-07-03 11:51:33'),
(16, 'Special Fixture', '', '2015-07-03 11:51:40'),
(17, 'Trial', '', '2015-07-03 11:51:46');

-- --------------------------------------------------------

--
-- Table structure for table `schedules`
--

CREATE TABLE IF NOT EXISTS `schedules` (
  `id` bigint(11) unsigned NOT NULL,
  `court_detail_id` bigint(11) unsigned NOT NULL,
  `associate_id` bigint(11) unsigned NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `request_type_id` bigint(11) unsigned NOT NULL,
  `notes` char(255) NOT NULL DEFAULT '',
  `insert_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `schedules`
--

INSERT INTO `schedules` (`id`, `court_detail_id`, `associate_id`, `date_time`, `request_type_id`, `notes`, `insert_time`) VALUES
(1, 1, 8, '2015-07-28 06:02:52', 7, 'Some notes', '2015-07-27 20:03:26'),
(2, 1, 1, '2015-07-28 06:06:33', 4, '', '2015-07-27 20:06:50'),
(3, 1, 1, '2015-07-29 06:00:00', 7, '', '2015-07-27 20:08:56'),
(4, 352, 12, '2015-07-27 21:51:07', 14, 'Case lorem ipsum agb vs phil coulson', '2015-07-27 20:53:38'),
(5, 197, 12, '2015-07-29 16:00:00', 5, 'Blah blah', '2015-07-28 06:23:49'),
(6, 205, 12, '2015-07-28 10:34:12', 7, 'Asdfghjjbvccxddghjhfc', '2015-07-28 09:43:15'),
(7, 1, 8, '2015-07-28 10:45:15', 4, '', '2015-07-28 10:38:43'),
(9, 1, 8, '2015-07-30 18:16:13', 4, '', '2015-07-30 17:16:20'),
(10, 1, 1, '2015-08-01 15:30:45', 1, '', '2015-08-01 15:24:02'),
(12, 2, 8, '2015-08-02 04:35:53', 12, 'Notes and notes\nAnd more notes', '2015-08-01 16:36:42'),
(13, 1, 12, '2015-08-28 02:00:00', 7, 'Case details here', '2015-08-01 16:55:00'),
(14, 221, 2, '2015-08-20 16:00:00', 4, '', '2015-08-03 03:57:44'),
(15, 203, 12, '2015-08-05 06:00:00', 5, 'I need a rep for this case no. 12345 defendant Jason Bourne', '2015-08-03 21:28:14'),
(16, 1, 12, '2015-08-05 06:19:00', 1, 'Hello pls accept my request\n', '2015-08-04 06:21:33'),
(17, 399, 3, '2015-08-04 07:25:02', 5, '', '2015-08-04 06:25:20'),
(18, 198, 12, '2015-08-13 08:00:00', 4, '', '2015-08-04 06:34:22'),
(19, 386, 14, '2015-08-04 07:38:22', 3, 'Test me\n', '2015-08-04 06:38:53'),
(20, 200, 14, '2015-08-04 08:29:51', 2, 'Test me', '2015-08-04 07:30:37'),
(21, 238, 9, '2015-08-04 14:00:00', 11, 'Matter of Michael Mate', '2015-08-04 09:00:07'),
(22, 205, 8, '2015-08-05 23:36:37', 3, '', '2015-08-04 22:37:17'),
(24, 238, 8, '2015-08-05 01:38:57', 2, 'Can you do this ?', '2015-08-04 23:39:25'),
(25, 238, 9, '2015-08-10 06:03:23', 11, 'Available for mentions', '2015-08-10 05:04:09'),
(26, 238, 8, '2015-08-10 06:04:43', 11, 'Yes I can', '2015-08-10 05:05:05'),
(27, 199, 15, '2015-08-16 13:13:34', 6, 'Can you be here ?', '2015-08-10 09:14:45'),
(28, 197, 15, '2015-08-16 13:14:52', 9, 'Will you be here', '2015-08-10 09:15:25'),
(29, 199, 14, '2015-08-14 04:47:12', 8, 'Need updates and i emailed you????', '2015-08-14 03:48:03'),
(30, 199, 14, '2015-08-14 04:48:39', 8, 'Need update and i need the artworks', '2015-08-14 03:49:26'),
(31, 3, 14, '2015-08-17 06:46:26', 10, 'Mediation with our pricing, asap please.', '2015-08-17 05:47:31'),
(32, 1, 17, '2015-08-18 09:49:29', 2, '', '2015-08-18 08:49:55'),
(33, 1, 17, '2015-08-18 09:50:24', 1, '', '2015-08-18 08:50:52'),
(34, 197, 17, '2015-08-18 09:52:32', 1, 'Be there', '2015-08-18 08:52:59'),
(35, 1, 17, '2015-08-22 20:09:46', 1, 'Please be there', '2015-08-18 08:57:32'),
(36, 197, 17, '2015-08-18 10:19:36', 2, 'Sample', '2015-08-18 09:20:02'),
(37, 399, 13, '2015-08-19 04:09:31', 1, '', '2015-08-19 03:10:15'),
(38, 1, 8, '2015-08-21 00:25:55', 1, 'sample', '2015-08-20 23:26:07'),
(39, 213, 19, '2015-08-27 02:22:17', 11, '', '2015-08-27 01:23:07'),
(40, 213, 19, '2015-08-27 02:22:17', 11, '', '2015-08-27 01:23:08'),
(41, 399, 19, '2015-08-27 02:26:08', 5, '', '2015-08-27 01:26:34'),
(42, 399, 19, '2015-08-27 02:31:03', 3, 'Hahsjjsis\n', '2015-08-27 01:31:24'),
(43, 399, 14, '2015-08-27 06:23:20', 1, 'Proceed', '2015-08-27 05:23:51'),
(44, 399, 20, '2015-09-07 06:43:53', 5, '', '2015-09-07 05:44:55'),
(45, 399, 20, '2015-09-29 16:00:00', 12, '', '2015-09-07 05:47:49'),
(46, 399, 20, '2015-09-08 01:56:50', 3, '', '2015-09-08 00:57:01'),
(47, 399, 20, '2015-09-29 16:00:00', 6, '', '2015-09-08 02:50:46'),
(48, 399, 20, '2015-09-28 16:00:00', 9, 'Yytt', '2015-09-08 02:51:19'),
(49, 399, 20, '2015-09-28 16:00:00', 6, 'aaaf', '2015-09-08 02:55:45'),
(50, 399, 20, '2015-09-30 04:38:54', 10, '', '2015-09-08 03:39:10'),
(51, 399, 14, '2015-09-12 05:10:04', 7, 'Test', '2015-09-11 04:09:03'),
(52, 238, 1, '2015-10-06 11:22:45', 3, '', '2015-10-06 10:23:09'),
(53, 382, 14, '2015-11-27 08:36:03', 8, 'Test just to test the test of this test and test\n', '2015-11-27 07:37:03'),
(54, 42, 8, '2016-01-18 07:00:00', 4, 'Just testing', '2016-01-15 11:25:22'),
(55, 7, 8, '2016-01-18 09:00:40', 8, 'Go here please', '2016-01-15 11:26:18'),
(56, 238, 8, '2016-01-18 03:27:28', 14, 'Please test gps', '2016-01-15 11:28:16'),
(57, 238, 9, '2016-01-19 13:00:00', 11, 'Court 5.2', '2016-01-19 08:02:55'),
(58, 352, 9, '2016-01-21 13:00:00', 12, 'Available after 12', '2016-01-19 08:03:41'),
(59, 383, 24, '2016-01-20 09:16:15', 10, 'Crazy client', '2016-01-20 08:17:23'),
(60, 238, 23, '2016-01-27 02:00:17', 10, 'I need representation for case no. 1234', '2016-01-26 08:46:21'),
(61, 219, 9, '2016-01-28 13:00:00', 11, 'I am available for mentions until 11am', '2016-01-27 23:36:22'),
(62, 238, 26, '2016-01-28 13:00:00', 11, 'I''m available from 10 o''clock if need be', '2016-01-27 23:39:54'),
(63, 238, 9, '2016-01-29 00:40:21', 11, 'Matter of buggalugs in 4.3 - he''s excused, I have $200 - are you able to accept?', '2016-01-27 23:41:19'),
(64, 238, 26, '2016-01-28 00:58:18', 10, 'Test', '2016-01-27 23:59:08'),
(65, 1, 25, '2016-02-03 02:14:59', 3, '', '2016-02-03 01:15:19'),
(66, 238, 8, '2016-02-17 16:00:00', 10, '', '2016-02-11 10:03:05'),
(67, 225, 8, '2016-02-18 02:00:27', 8, '', '2016-02-11 10:04:07'),
(68, 42, 8, '2016-02-18 02:00:37', 8, '', '2016-02-11 10:05:11'),
(69, 29, 23, '2016-02-18 06:00:00', 7, '', '2016-02-11 10:08:42'),
(70, 199, 26, '2016-02-22 13:00:00', 3, '', '2016-02-21 01:43:51');

-- --------------------------------------------------------

--
-- Table structure for table `service_requests`
--

CREATE TABLE IF NOT EXISTS `service_requests` (
  `id` bigint(11) unsigned NOT NULL,
  `schedule_id` bigint(11) unsigned NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `assigned_associate_id` bigint(11) unsigned NOT NULL DEFAULT '0',
  `insert_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `service_requests`
--

INSERT INTO `service_requests` (`id`, `schedule_id`, `status`, `assigned_associate_id`, `insert_time`, `update_time`) VALUES
(1, 2, 0, 0, '2015-07-27 20:06:50', '2015-07-27 20:06:50'),
(2, 3, 0, 0, '2015-07-27 20:08:56', '2015-07-27 20:08:56'),
(3, 4, 1, 8, '2015-07-27 20:53:38', '2015-07-27 21:24:09'),
(4, 6, 0, 0, '2015-07-28 09:43:16', '2015-07-28 09:43:16'),
(7, 13, 0, 0, '2015-08-01 16:55:00', '2015-08-01 16:55:00'),
(8, 14, 1, 1, '2015-08-03 03:57:45', '2015-08-03 03:59:05'),
(9, 15, 1, 8, '2015-08-03 21:28:14', '2015-08-03 22:15:54'),
(10, 16, 1, 3, '2015-08-04 06:21:33', '2015-08-04 06:22:51'),
(11, 19, 1, 3, '2015-08-04 06:38:53', '2015-08-04 06:43:40'),
(12, 20, 0, 0, '2015-08-04 07:30:37', '2015-08-04 07:30:37'),
(13, 24, 2, 9, '2015-08-04 23:39:25', '2015-08-05 01:46:21'),
(14, 26, 2, 9, '2015-08-10 05:05:05', '2015-08-11 02:26:32'),
(15, 27, 0, 0, '2015-08-10 09:14:45', '2015-08-10 09:14:45'),
(16, 28, 0, 0, '2015-08-10 09:15:25', '2015-08-10 09:15:25'),
(17, 30, 0, 0, '2015-08-14 03:49:26', '2015-08-14 03:49:26'),
(18, 31, 0, 0, '2015-08-17 05:47:31', '2015-08-17 05:47:31'),
(19, 32, 0, 0, '2015-08-18 08:49:55', '2015-08-18 08:49:55'),
(20, 33, 0, 0, '2015-08-18 08:50:52', '2015-08-18 08:50:52'),
(21, 34, 0, 0, '2015-08-18 08:52:59', '2015-08-18 08:52:59'),
(22, 35, 0, 0, '2015-08-18 08:57:32', '2015-08-18 08:57:32'),
(23, 36, 0, 0, '2015-08-18 09:20:08', '2015-08-18 09:20:08'),
(24, 41, 0, 0, '2015-08-27 01:26:34', '2015-08-27 01:26:34'),
(25, 43, 0, 0, '2015-08-27 05:23:51', '2015-08-27 05:23:51'),
(26, 44, 0, 0, '2015-09-07 05:44:56', '2015-09-07 05:44:56'),
(27, 45, 0, 0, '2015-09-07 05:47:50', '2015-09-07 05:47:50'),
(28, 46, 0, 0, '2015-09-08 00:57:02', '2015-09-08 00:57:02'),
(29, 47, 0, 0, '2015-09-08 02:50:46', '2015-09-08 02:50:46'),
(30, 50, 0, 0, '2015-09-08 03:39:11', '2015-09-08 03:39:11'),
(31, 51, 0, 0, '2015-09-11 04:09:03', '2015-09-11 04:09:03'),
(32, 53, 0, 0, '2015-11-27 07:37:04', '2015-11-27 07:37:04'),
(33, 55, 0, 0, '2016-01-15 11:26:18', '2016-01-15 11:26:18'),
(34, 56, 0, 0, '2016-01-15 11:28:16', '2016-01-15 11:28:16'),
(35, 63, 0, 0, '2016-01-27 23:41:19', '2016-01-27 23:41:19'),
(36, 64, 0, 0, '2016-01-27 23:59:08', '2016-01-27 23:59:08'),
(37, 67, 0, 0, '2016-02-11 10:04:07', '2016-02-11 10:04:07'),
(38, 68, 1, 23, '2016-02-11 10:05:11', '2016-02-11 10:07:37');

-- --------------------------------------------------------

--
-- Table structure for table `service_request_assignees`
--

CREATE TABLE IF NOT EXISTS `service_request_assignees` (
  `id` bigint(11) unsigned NOT NULL,
  `service_request_id` bigint(11) unsigned NOT NULL,
  `associate_id` bigint(11) unsigned NOT NULL,
  `insert_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `service_request_assignees`
--

INSERT INTO `service_request_assignees` (`id`, `service_request_id`, `associate_id`, `insert_time`) VALUES
(1, 1, 8, '2015-07-27 20:06:50'),
(2, 2, 8, '2015-07-27 20:08:56'),
(4, 4, 2, '2015-07-28 09:43:16'),
(9, 7, 2, '2015-08-01 16:55:00'),
(10, 7, 11, '2015-08-01 16:55:00'),
(18, 12, 9, '2015-08-04 07:30:37'),
(21, 15, 11, '2015-08-10 09:14:45'),
(23, 17, 12, '2015-08-14 03:49:26'),
(24, 18, 13, '2015-08-17 05:47:31'),
(25, 19, 4, '2015-08-18 08:49:55'),
(26, 20, 11, '2015-08-18 08:50:52'),
(27, 21, 2, '2015-08-18 08:52:59'),
(28, 22, 1, '2015-08-18 08:57:32'),
(29, 23, 16, '2015-08-18 09:20:08'),
(30, 24, 17, '2015-08-27 01:26:34'),
(31, 25, 17, '2015-08-27 05:23:51'),
(32, 26, 14, '2015-09-07 05:44:56'),
(33, 27, 14, '2015-09-07 05:47:50'),
(34, 28, 14, '2015-09-08 00:57:02'),
(35, 29, 17, '2015-09-08 02:50:46'),
(36, 30, 11, '2015-09-08 03:39:11'),
(37, 31, 20, '2015-09-11 04:09:03'),
(38, 32, 12, '2015-11-27 07:37:04'),
(39, 33, 12, '2016-01-15 11:26:18'),
(40, 34, 21, '2016-01-15 11:28:16'),
(41, 35, 26, '2016-01-27 23:41:19'),
(42, 36, 9, '2016-01-27 23:59:08'),
(43, 37, 12, '2016-02-11 10:04:07');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(2, 'test user', 'test@test.com', '$2y$10$3OdRju2GfLOMead9.rBYvuNPPSi9yAA1L7BFG81KkK91O/NGMS2zK', NULL, '2016-04-05 04:59:54', '2016-04-05 04:59:54');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `associates`
--
ALTER TABLE `associates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `associate_devices`
--
ALTER TABLE `associate_devices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `associate_location`
--
ALTER TABLE `associate_location`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `auth`
--
ALTER TABLE `auth`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `courts`
--
ALTER TABLE `courts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `court_details`
--
ALTER TABLE `court_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `favorites`
--
ALTER TABLE `favorites`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `message_inboxes`
--
ALTER TABLE `message_inboxes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `oauth_access_tokens_id_session_id_unique` (`id`,`session_id`),
  ADD KEY `oauth_access_tokens_session_id_index` (`session_id`);

--
-- Indexes for table `oauth_access_token_scopes`
--
ALTER TABLE `oauth_access_token_scopes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_token_scopes_access_token_id_index` (`access_token_id`),
  ADD KEY `oauth_access_token_scopes_scope_id_index` (`scope_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_session_id_index` (`session_id`);

--
-- Indexes for table `oauth_auth_code_scopes`
--
ALTER TABLE `oauth_auth_code_scopes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_code_scopes_auth_code_id_index` (`auth_code_id`),
  ADD KEY `oauth_auth_code_scopes_scope_id_index` (`scope_id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `oauth_clients_id_secret_unique` (`id`,`secret`);

--
-- Indexes for table `oauth_client_endpoints`
--
ALTER TABLE `oauth_client_endpoints`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `oauth_client_endpoints_client_id_redirect_uri_unique` (`client_id`,`redirect_uri`);

--
-- Indexes for table `oauth_client_grants`
--
ALTER TABLE `oauth_client_grants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_client_grants_client_id_index` (`client_id`),
  ADD KEY `oauth_client_grants_grant_id_index` (`grant_id`);

--
-- Indexes for table `oauth_client_scopes`
--
ALTER TABLE `oauth_client_scopes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_client_scopes_client_id_index` (`client_id`),
  ADD KEY `oauth_client_scopes_scope_id_index` (`scope_id`);

--
-- Indexes for table `oauth_grants`
--
ALTER TABLE `oauth_grants`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_grant_scopes`
--
ALTER TABLE `oauth_grant_scopes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_grant_scopes_grant_id_index` (`grant_id`),
  ADD KEY `oauth_grant_scopes_scope_id_index` (`scope_id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`access_token_id`),
  ADD UNIQUE KEY `oauth_refresh_tokens_id_unique` (`id`);

--
-- Indexes for table `oauth_scopes`
--
ALTER TABLE `oauth_scopes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_sessions`
--
ALTER TABLE `oauth_sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_sessions_client_id_owner_type_owner_id_index` (`client_id`,`owner_type`,`owner_id`);

--
-- Indexes for table `oauth_session_scopes`
--
ALTER TABLE `oauth_session_scopes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_session_scopes_session_id_index` (`session_id`),
  ADD KEY `oauth_session_scopes_scope_id_index` (`scope_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`),
  ADD KEY `password_resets_token_index` (`token`);

--
-- Indexes for table `request_types`
--
ALTER TABLE `request_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `schedules`
--
ALTER TABLE `schedules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `service_requests`
--
ALTER TABLE `service_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `service_request_assignees`
--
ALTER TABLE `service_request_assignees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `associates`
--
ALTER TABLE `associates`
  MODIFY `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=36;
--
-- AUTO_INCREMENT for table `associate_devices`
--
ALTER TABLE `associate_devices`
  MODIFY `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT for table `associate_location`
--
ALTER TABLE `associate_location`
  MODIFY `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=66;
--
-- AUTO_INCREMENT for table `auth`
--
ALTER TABLE `auth`
  MODIFY `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `courts`
--
ALTER TABLE `courts`
  MODIFY `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=175;
--
-- AUTO_INCREMENT for table `court_details`
--
ALTER TABLE `court_details`
  MODIFY `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=400;
--
-- AUTO_INCREMENT for table `favorites`
--
ALTER TABLE `favorites`
  MODIFY `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT for table `message_inboxes`
--
ALTER TABLE `message_inboxes`
  MODIFY `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=112;
--
-- AUTO_INCREMENT for table `oauth_access_token_scopes`
--
ALTER TABLE `oauth_access_token_scopes`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oauth_auth_code_scopes`
--
ALTER TABLE `oauth_auth_code_scopes`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oauth_client_endpoints`
--
ALTER TABLE `oauth_client_endpoints`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oauth_client_grants`
--
ALTER TABLE `oauth_client_grants`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oauth_client_scopes`
--
ALTER TABLE `oauth_client_scopes`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oauth_grant_scopes`
--
ALTER TABLE `oauth_grant_scopes`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oauth_sessions`
--
ALTER TABLE `oauth_sessions`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `oauth_session_scopes`
--
ALTER TABLE `oauth_session_scopes`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `request_types`
--
ALTER TABLE `request_types`
  MODIFY `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `schedules`
--
ALTER TABLE `schedules`
  MODIFY `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=71;
--
-- AUTO_INCREMENT for table `service_requests`
--
ALTER TABLE `service_requests`
  MODIFY `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=39;
--
-- AUTO_INCREMENT for table `service_request_assignees`
--
ALTER TABLE `service_request_assignees`
  MODIFY `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=44;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD CONSTRAINT `oauth_access_tokens_session_id_foreign` FOREIGN KEY (`session_id`) REFERENCES `oauth_sessions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `oauth_access_token_scopes`
--
ALTER TABLE `oauth_access_token_scopes`
  ADD CONSTRAINT `oauth_access_token_scopes_access_token_id_foreign` FOREIGN KEY (`access_token_id`) REFERENCES `oauth_access_tokens` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `oauth_access_token_scopes_scope_id_foreign` FOREIGN KEY (`scope_id`) REFERENCES `oauth_scopes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD CONSTRAINT `oauth_auth_codes_session_id_foreign` FOREIGN KEY (`session_id`) REFERENCES `oauth_sessions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `oauth_auth_code_scopes`
--
ALTER TABLE `oauth_auth_code_scopes`
  ADD CONSTRAINT `oauth_auth_code_scopes_auth_code_id_foreign` FOREIGN KEY (`auth_code_id`) REFERENCES `oauth_auth_codes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `oauth_auth_code_scopes_scope_id_foreign` FOREIGN KEY (`scope_id`) REFERENCES `oauth_scopes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `oauth_client_endpoints`
--
ALTER TABLE `oauth_client_endpoints`
  ADD CONSTRAINT `oauth_client_endpoints_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `oauth_clients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `oauth_client_grants`
--
ALTER TABLE `oauth_client_grants`
  ADD CONSTRAINT `oauth_client_grants_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `oauth_clients` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `oauth_client_grants_grant_id_foreign` FOREIGN KEY (`grant_id`) REFERENCES `oauth_grants` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `oauth_client_scopes`
--
ALTER TABLE `oauth_client_scopes`
  ADD CONSTRAINT `oauth_client_scopes_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `oauth_clients` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `oauth_client_scopes_scope_id_foreign` FOREIGN KEY (`scope_id`) REFERENCES `oauth_scopes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `oauth_grant_scopes`
--
ALTER TABLE `oauth_grant_scopes`
  ADD CONSTRAINT `oauth_grant_scopes_grant_id_foreign` FOREIGN KEY (`grant_id`) REFERENCES `oauth_grants` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `oauth_grant_scopes_scope_id_foreign` FOREIGN KEY (`scope_id`) REFERENCES `oauth_scopes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD CONSTRAINT `oauth_refresh_tokens_access_token_id_foreign` FOREIGN KEY (`access_token_id`) REFERENCES `oauth_access_tokens` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `oauth_sessions`
--
ALTER TABLE `oauth_sessions`
  ADD CONSTRAINT `oauth_sessions_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `oauth_clients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `oauth_session_scopes`
--
ALTER TABLE `oauth_session_scopes`
  ADD CONSTRAINT `oauth_session_scopes_scope_id_foreign` FOREIGN KEY (`scope_id`) REFERENCES `oauth_scopes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `oauth_session_scopes_session_id_foreign` FOREIGN KEY (`session_id`) REFERENCES `oauth_sessions` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
