# ************************************************************
# Sequel Pro SQL dump
# Version 3408
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: 127.0.0.1 (MySQL 5.5.25)
# Database: spotifont
# Generation Time: 2012-10-21 04:48:31 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table Controlled
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Controlled`;

CREATE TABLE `Controlled` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `font_id` int(11) DEFAULT NULL,
  `controlled_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `Controlled` WRITE;
/*!40000 ALTER TABLE `Controlled` DISABLE KEYS */;

INSERT INTO `Controlled` (`id`, `font_id`, `controlled_name`)
VALUES
	(1,7,'Serif'),
	(2,6,'Sans-Serif');

/*!40000 ALTER TABLE `Controlled` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Fonts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Fonts`;

CREATE TABLE `Fonts` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `font_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `Fonts` WRITE;
/*!40000 ALTER TABLE `Fonts` DISABLE KEYS */;

INSERT INTO `Fonts` (`id`, `font_name`)
VALUES
	(6,'Dave'),
	(7,'Garamond'),
	(8,'Arial');

/*!40000 ALTER TABLE `Fonts` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Tag_Links
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Tag_Links`;

CREATE TABLE `Tag_Links` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `font_id` int(11) DEFAULT NULL,
  `tag_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `Tag_Links` WRITE;
/*!40000 ALTER TABLE `Tag_Links` DISABLE KEYS */;

INSERT INTO `Tag_Links` (`id`, `font_id`, `tag_id`, `user_id`, `timestamp`)
VALUES
	(1,6,6,2,'2012-10-20 13:42:54'),
	(3,6,8,2,'2012-10-20 13:43:03'),
	(5,7,8,2,'2012-10-20 17:14:30'),
	(6,7,8,3,'2012-10-20 17:17:21');

/*!40000 ALTER TABLE `Tag_Links` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Tags
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Tags`;

CREATE TABLE `Tags` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(2) NOT NULL DEFAULT '',
  `tag_name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `Tags` WRITE;
/*!40000 ALTER TABLE `Tags` DISABLE KEYS */;

INSERT INTO `Tags` (`id`, `type`, `tag_name`)
VALUES
	(6,'u','fancy'),
	(8,'u','thematrix');

/*!40000 ALTER TABLE `Tags` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Users`;

CREATE TABLE `Users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `Users` WRITE;
/*!40000 ALTER TABLE `Users` DISABLE KEYS */;

INSERT INTO `Users` (`id`, `username`)
VALUES
	(1,'spotibot'),
	(2,'dave'),
	(4,'glushko');

/*!40000 ALTER TABLE `Users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
