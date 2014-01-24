-- phpMyAdmin SQL Dump
-- version 3.5.3
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Erstellungszeit: 24. Jan 2014 um 15:33
-- Server Version: 5.5.28
-- PHP-Version: 5.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Datenbank: `bikesharingservice`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `accounts`
--

CREATE TABLE IF NOT EXISTS `accounts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL DEFAULT '',
  `login` varchar(16) NOT NULL DEFAULT '',
  `passwd` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Daten für Tabelle `accounts`
--

INSERT INTO `accounts` (`id`, `email`, `login`, `passwd`) VALUES
(1, 'test@test.com', 'bike', '12345'),
(2, 'abc@abc.de', 'test', 'hallo');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `bikes`
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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Daten für Tabelle `bikes`
--

INSERT INTO `bikes` (`id`, `model`, `station`, `price`, `longitude`, `latitude`, `isUsed`) VALUES
(1, 2, 2, 100, 13.74951000, 51.02927000, 0),
(2, 2, 1, 80, -74.40898606, 40.21727401, 0),
(3, 1, 2, 200, 13.74951000, 51.02927000, 1),
(4, 1, 2, 200, 13.74981101, 51.02927101, 1),
(5, 1, 2, 200, 13.74951000, 51.02927000, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `bookings`
--

CREATE TABLE IF NOT EXISTS `bookings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bike` int(10) unsigned NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `account` int(10) unsigned NOT NULL,
  `released` timestamp NULL DEFAULT NULL,
  `costs` int(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=35 ;

--
-- Daten für Tabelle `bookings`
--

INSERT INTO `bookings` (`id`, `bike`, `date`, `account`, `released`, `costs`) VALUES
(28, 1, '2014-01-24 13:41:30', 2, '2014-01-24 13:41:30', NULL),
(27, 3, '2014-01-24 13:42:37', 1, '2014-01-24 13:42:37', NULL),
(26, 5, '2014-01-24 13:41:52', 1, '2014-01-24 13:41:52', NULL),
(29, 4, '2014-01-24 13:42:13', 1, '2014-01-24 14:10:53', 100),
(30, 5, '2014-01-24 14:06:02', 1, '2014-01-24 14:06:39', NULL),
(31, 2, '2014-01-24 14:23:58', 1, '2014-01-24 14:24:08', 80),
(32, 3, '2014-01-24 14:27:29', 1, NULL, NULL),
(33, 5, '2014-01-24 14:28:56', 1, NULL, NULL),
(34, 4, '2014-01-24 14:29:34', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `models`
--

CREATE TABLE IF NOT EXISTS `models` (
  `id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL DEFAULT '',
  `description` varchar(500) DEFAULT NULL,
  `picture` varchar(75) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Daten für Tabelle `models`
--

INSERT INTO `models` (`id`, `name`, `description`, `picture`) VALUES
(1, 'Rennrad', 'Bestens geeignet für das Fahren auf dem Asphalt.', 'www.test.de/bild1.jpg'),
(2, 'Kinderfahrrad', 'Geeignet für Kinder zwischen 6 und 9 Jahren.', 'www.test.de/bild2.jpg'),
(3, 'Modell2', '', NULL),
(4, 'Modell3', '', NULL),
(5, 'Modell4', '', NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `stations`
--

CREATE TABLE IF NOT EXISTS `stations` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL DEFAULT '',
  `longitude` decimal(11,8) NOT NULL,
  `latitude` decimal(10,8) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `picture` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Daten für Tabelle `stations`
--

INSERT INTO `stations` (`id`, `name`, `longitude`, `latitude`, `description`, `picture`) VALUES
(1, 'Hauptbahnhof', 13.68690000, 51.07640000, 'Tolle Station am Hauptbahnhof, direkt vor dem Ausgang. Tolle Station am Hauptbahnhof, direkt vor dem Ausgang. Tolle Station am Hauptbahnhof, direkt vor dem Ausgang. Tolle Station am Hauptbahnhof, direkt vor dem Ausgang. Tolle Station am Hauptbahnhof, direkt vor dem Ausgang. Tolle Station am Hauptbahnhof, direkt vor dem Ausgang. ', 'http://media-cdn.tripadvisor.com/media/photo-s/03/9b/2d/b5/berlin.jpg'),
(2, 'Zoo', -74.00898606, 40.71727401, 'Station am Zoo.', 'http://upload.wikimedia.org/wikipedia/commons/1/1c/Zoo_Hannover_Eingang_innen.jpg'),
(3, 'Prager Straße', -74.00898806, 40.71227401, 'Station an der Prager Straße.', 'http://www.kim-hotel.de/upload/pragerstrassedresden.jpg');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
