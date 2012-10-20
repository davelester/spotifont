# ************************************************************
# Sequel Pro SQL dump
# Version 3408
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: 127.0.0.1 (MySQL 5.5.25)
# Database: spotifont
# Generation Time: 2012-10-20 23:38:17 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table Fonts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Fonts`;

CREATE TABLE `Fonts` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `Fonts` WRITE;
/*!40000 ALTER TABLE `Fonts` DISABLE KEYS */;

INSERT INTO `Fonts` (`id`, `name`)
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
	(2,6,7,1,'2012-10-20 13:42:53'),
	(3,6,8,2,'2012-10-20 13:43:03'),
	(4,7,7,1,'2012-10-20 13:59:25');

/*!40000 ALTER TABLE `Tag_Links` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Tags
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Tags`;

CREATE TABLE `Tags` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(2) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `Tags` WRITE;
/*!40000 ALTER TABLE `Tags` DISABLE KEYS */;

INSERT INTO `Tags` (`id`, `type`, `name`)
VALUES
	(6,'u','fancy'),
	(7,'c','Serif'),
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
	(2,'dave');

/*!40000 ALTER TABLE `Users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
