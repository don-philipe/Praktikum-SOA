-- phpMyAdmin SQL Dump
-- version 4.1.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jan 31, 2014 at 04:44 PM
-- Server version: 5.1.71-log
-- PHP Version: 5.5.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `tobias90_bikesharingservice`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE IF NOT EXISTS `accounts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL DEFAULT '',
  `login` varchar(16) NOT NULL DEFAULT '',
  `passwd` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`id`, `email`, `login`, `passwd`) VALUES
(1, 'test@test.com', 'bike', '12345'),
(2, 'abc@abc.de', 'test', 'hallo');

-- --------------------------------------------------------

--
-- Table structure for table `bikes`
--

CREATE TABLE IF NOT EXISTS `bikes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `model` int(5) unsigned NOT NULL,
  `station` int(6) unsigned DEFAULT NULL,
  `price` int(3) unsigned NOT NULL,
  `longitude` decimal(11,8) NOT NULL,
  `latitude` decimal(10,8) NOT NULL,
  `isUsed` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `bikes`
--

INSERT INTO `bikes` (`id`, `model`, `station`, `price`, `longitude`, `latitude`, `isUsed`) VALUES
(1, 2, 2, 100, '13.74951000', '51.02927000', 0),
(2, 2, 1, 80, '-74.40898606', '40.21727401', 0),
(3, 1, 2, 200, '13.74951000', '51.02927000', 0),
(4, 1, 2, 200, '13.74981101', '51.02927101', 0),
(5, 1, 2, 200, '13.74951000', '51.02927000', 0),
(6, 1, NULL, 300, '13.00000000', '53.00000000', 0),
(7, 4, 4, 250, '13.37062000', '52.52629000', 0);

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE IF NOT EXISTS `bookings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bike` int(10) unsigned NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `account` int(10) unsigned NOT NULL,
  `released` timestamp NULL DEFAULT NULL,
  `costs` int(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=47 ;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`id`, `bike`, `date`, `account`, `released`, `costs`) VALUES
(40, 4, '2014-01-26 16:56:17', 1, '2014-01-26 16:58:00', 200),
(41, 5, '2014-01-26 16:57:09', 1, '2014-01-26 16:58:05', 200),
(29, 4, '2014-01-24 13:42:13', 1, '2014-01-24 14:10:53', 100),
(38, 1, '2014-01-26 16:55:13', 1, '2014-01-26 16:57:55', 100),
(31, 2, '2014-01-24 14:23:58', 1, '2014-01-24 14:24:08', 80),
(32, 3, '2014-01-24 14:27:29', 1, '2014-01-26 16:41:31', 40200),
(33, 5, '2014-01-24 14:28:56', 1, '2014-01-25 11:32:58', 17000),
(34, 4, '2014-01-24 14:29:34', 1, '2014-01-26 16:41:47', 40200),
(35, 1, '2014-01-25 10:44:48', 1, '2014-01-26 16:41:54', 12000),
(36, 5, '2014-01-25 14:11:25', 1, '2014-01-26 16:56:48', 21600),
(37, 2, '2014-01-26 16:13:32', 1, '2014-01-26 16:56:53', 240);

-- --------------------------------------------------------

--
-- Table structure for table `models`
--

CREATE TABLE IF NOT EXISTS `models` (
  `id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL DEFAULT '',
  `description` varchar(500) DEFAULT NULL,
  `picture` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `models`
--

INSERT INTO `models` (`id`, `name`, `description`, `picture`) VALUES
(1, 'Rennrad', 'Bestens geeignet für das Fahren auf dem Asphalt.', 'https://upload.wikimedia.org/wikipedia/commons/5/54/Ducati-corse-factory-900xr-01-1280.jpg'),
(2, 'Kinderfahrrad', 'Geeignet für Kinder zwischen 6 und 9 Jahren.', 'https://upload.wikimedia.org/wikipedia/commons/7/7c/Bicicleta_consertada.JPG?uselang=de'),
(3, 'Damenfahrrad', 'Mit tiefem Einstieg', 'https://upload.wikimedia.org/wikipedia/commons/7/70/Bike_948923.JPG?uselang=de'),
(4, 'Herrenfahrrad', 'Standard Stadtrad', 'https://upload.wikimedia.org/wikipedia/commons/a/a6/Brooklyn_NY_assorted_photos_near_Fulton_Street_8_bike_rack_and_bike.jpg?uselang=de'),
(5, 'Trekkingrad', 'Allrounder mit allem dran was man in Stadt und Land braucht.', 'https://upload.wikimedia.org/wikipedia/commons/2/2f/0004-fahrradsammlung-RalfR.jpg?uselang=de'),
(6, 'Mountainbike', 'Fürs Gelände.', 'https://upload.wikimedia.org/wikipedia/commons/6/61/12-11-02-fahrrad-salzburg-01.jpg?uselang=de');

-- --------------------------------------------------------

--
-- Table structure for table `stations`
--

CREATE TABLE IF NOT EXISTS `stations` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL DEFAULT '',
  `longitude` decimal(11,8) NOT NULL,
  `latitude` decimal(10,8) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `picture` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `stations`
--

INSERT INTO `stations` (`id`, `name`, `longitude`, `latitude`, `description`, `picture`) VALUES
(1, 'Hauptbahnhof Dresden', '13.73360000', '51.04050000', 'Tolle Station am Hauptbahnhof, direkt vor dem Ausgang.', 'http://media-cdn.tripadvisor.com/media/photo-s/03/9b/2d/b5/berlin.jpg'),
(2, 'Zoo Dresden', '13.75276000', '51.03697000', 'Station am Zoo.', 'http://upload.wikimedia.org/wikipedia/commons/1/1c/Zoo_Hannover_Eingang_innen.jpg'),
(3, 'Dresden, Prager Straße', '13.73556000', '51.04492000', 'Station an der Prager Straße.', 'http://www.kim-hotel.de/upload/pragerstrassedresden.jpg'),
(4, 'Hauptbahnhof Berlin', '13.37062000', '52.52629000', 'Direkt hinter dem Berliner Hauptbahnhof gelegen.', 'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b9/Berlin_Hauptbahnhof_innen.JPG/795px-Berlin_Hauptbahnhof_innen.JPG');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
