-- phpMyAdmin SQL Dump
-- version 3.5.3
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Erstellungszeit: 16. Dez 2013 um 13:30
-- Server Version: 5.1.49
-- PHP-Version: 5.3.27

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
  `passwd varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Daten für Tabelle `accounts`
-- Testaccountpasswort -> sharing
--

INSERT INTO `accounts` (`id`, `email`, `login`, `passwd`) VALUES
(1, 'test@test.com', 'bike', '06b3513ef848b1cf5ffa20e67ad18254');

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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Daten für Tabelle `bikes`
--

INSERT INTO `bikes` (`id`, `model`, `station`, `price`, `longitude`, `latitude`, `isUsed`) VALUES
(1, 2, 2, 100, '13.74951000', '51.02927000', 0),
(2, 2, 1, 80, '13.40898606', '51.21727401', 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `bookings`
--

CREATE TABLE IF NOT EXISTS `bookings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bike` int(10) unsigned NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `account` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=18 ;

--
-- Daten für Tabelle `bookings`
--

INSERT INTO `bookings` (`id`, `bike`, `date`, `account`) VALUES
(1, 1, '2013-12-16 11:08:03', 1),
(2, 6, '2013-12-16 12:24:02', 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `models`
--

CREATE TABLE IF NOT EXISTS `models` (
  `id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL DEFAULT '',
  `description` varchar(500) DEFAULT '',
  `picture` varchar(75) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Daten für Tabelle `models`
--

INSERT INTO `models` (`id`, `name`, `description`, `picture`) VALUES
(1, 'Rennrad', 'Bestens geeignet für das Fahren auf dem Asphalt.', 'www.test.de/bild1.jpg'),
(2, 'Kinderfahrrad', 'Geeignet für Kinder zwischen 6 und 9 Jahren.', 'www.test.de/bild2.jpg');

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
  `picture` varchar(75) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Daten für Tabelle `stations`
--

INSERT INTO `stations` (`id`, `name`, `longitude`, `latitude`, `description`, `picture`) VALUES
(1, 'Hauptbahnhof', '13.73371', '51.04053', 'Tolle Station am Hauptbahnhof, direkt vor dem Ausgang.', 'www.test.de/station1.jpg'),
(2, 'Zoo', '13.75272', '51.03699', 'Station am Zoo.', 'www.test.de/station2.jpg');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
