-- MySQL dump 10.14  Distrib 5.5.57-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: mydb
-- ------------------------------------------------------
-- Server version	5.5.57-MariaDB

DROP SCHEMA IF EXISTS `mydb`;
CREATE SCHEMA `mydb`;
USE `mydb`;

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ad`
--

DROP TABLE IF EXISTS `ad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ad` (
  `ad_id` varchar(20) NOT NULL,
  `duration` time NOT NULL,
  `company` char(15) NOT NULL,
  PRIMARY KEY (`ad_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ad`
--

LOCK TABLES `ad` WRITE;
/*!40000 ALTER TABLE `ad` DISABLE KEYS */;
INSERT INTO `ad` VALUES ('AD1','00:01:30','Ultrex'),('AD2','00:00:30','Victoria Secret'),('AD3','00:00:45','Razer'),('AD4','00:00:25','Gilette'),('AD5','00:00:06','Aura'),('AD6','00:13:34','Google'),('AD7','00:09:38','H.P.');
/*!40000 ALTER TABLE `ad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `advertisement_in_videos`
--

DROP TABLE IF EXISTS `advertisement_in_videos`;
/*!50001 DROP VIEW IF EXISTS `advertisement_in_videos`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `advertisement_in_videos` (
  `video_id` tinyint NOT NULL,
  `likes` tinyint NOT NULL,
  `dislikes` tinyint NOT NULL,
  `views` tinyint NOT NULL,
  `ad_id` tinyint NOT NULL,
  `company` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `channel`
--

DROP TABLE IF EXISTS `channel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `channel` (
  `channel_id` varchar(20) NOT NULL,
  `name` char(15) NOT NULL,
  `country` char(15) DEFAULT NULL,
  `number_of_videos` int(11) DEFAULT NULL,
  `user_id` varchar(20) NOT NULL,
  PRIMARY KEY (`channel_id`),
  KEY `fk_channel_user1_idx` (`user_id`),
  CONSTRAINT `fk_channel_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `channel`
--

LOCK TABLES `channel` WRITE;
/*!40000 ALTER TABLE `channel` DISABLE KEYS */;
INSERT INTO `channel` VALUES ('CH1','Catlady','UK',2,'UI8'),('CH2','Ironsmith','Finland',3,'UI9'),('CH3','Jokes4u','Canada',4,'UI10'),('CH4','DbManiac63','SouthAfrica',1,'UI11'),('CH5','Electricbasics','US',1,'UI12'),('CH6','Hollywood','China',1,'UI13'),('CH7','Mechistorian','Netherlands',3,'UI14');
/*!40000 ALTER TABLE `channel` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `mydb`.`Channel_BEFORE_INSERT`
BEFORE INSERT ON `mydb`.`channel`
FOR EACH ROW
BEGIN
	IF (NEW.number_of_videos < 0) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid data';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `mydb`.`Channel_BEFORE_UPDATE`
BEFORE UPDATE ON `mydb`.`channel`
FOR EACH ROW
BEGIN
	IF (NEW.number_of_videos < 0) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid data';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary table structure for view `dislikes`
--

DROP TABLE IF EXISTS `dislikes`;
/*!50001 DROP VIEW IF EXISTS `dislikes`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `dislikes` (
  `video_id` tinyint NOT NULL,
  `dislikes` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `likes`
--

DROP TABLE IF EXISTS `likes`;
/*!50001 DROP VIEW IF EXISTS `likes`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `likes` (
  `video_id` tinyint NOT NULL,
  `likes` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `photo`
--

DROP TABLE IF EXISTS `photo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `photo` (
  `photo_id` varchar(20) NOT NULL,
  `channel_id` varchar(20) NOT NULL,
  `title` char(15) NOT NULL,
  `path` varchar(100) NOT NULL,
  `resolution` varchar(20) NOT NULL,
  `upload_date` date NOT NULL,
  PRIMARY KEY (`photo_id`,`channel_id`),
  KEY `channel_id_idx` (`channel_id`),
  CONSTRAINT `channel_id1` FOREIGN KEY (`channel_id`) REFERENCES `channel` (`channel_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `photo`
--

LOCK TABLES `photo` WRITE;
/*!40000 ALTER TABLE `photo` DISABLE KEYS */;
INSERT INTO `photo` VALUES ('PH1','CH1','Cats','C:\\photos\\PH1.jpeg','500x520','2019-11-03'),('PH10','CH4','Hot nigga','C:\\photos\\PH10.jpeg','130x256','2019-12-20'),('PH11','CH4','Cold girl','C:\\photos\\PH11.jpeg','500x520','2017-12-05'),('PH12','CH5','Cold nigga','C:\\photos\\PH12.jpeg','130x256','2017-01-05'),('PH13','CH6','View','C:\\photos\\PH13.jpeg','920x260','2019-12-25'),('PH14','CH7','Mountain','C:\\photos\\PH14.jpeg','500x520','2013-08-09'),('PH2','CH2','Autumn','C:\\photos\\PH2.jpeg','1020x1500','2018-08-04'),('PH3','CH3','Guitar','C:\\photos\\PH3.jpeg','130x256','2017-12-05'),('PH4','CH4','Mood','C:\\photos\\PH4.jpeg','920x260','2019-06-25'),('PH5','CH5','Doge','C:\\photos\\PH5.jpeg','500x520','2016-05-20'),('PH6','CH6','Flowers','C:\\photos\\PH6.jpeg','920x260','2019-12-20'),('PH7','CH7','Dinner','C:\\photos\\PH7.jpeg','1025x920','2010-06-30'),('PH8','CH1','Beach','C:\\photos\\PH8.jpeg','500x520','2019-06-25'),('PH9','CH1','Hot girl','C:\\photos\\PH9.jpeg','920x260','2017-12-04');
/*!40000 ALTER TABLE `photo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playlist`
--

DROP TABLE IF EXISTS `playlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `playlist` (
  `playlist_id` varchar(20) NOT NULL,
  `channel_id` varchar(20) NOT NULL,
  `name` char(15) NOT NULL,
  `number_of_videos` int(11) NOT NULL,
  `creation_date` date NOT NULL,
  `last_update` date NOT NULL,
  PRIMARY KEY (`playlist_id`),
  KEY `channelID_idx` (`channel_id`),
  CONSTRAINT `channel_id2` FOREIGN KEY (`channel_id`) REFERENCES `channel` (`channel_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playlist`
--

LOCK TABLES `playlist` WRITE;
/*!40000 ALTER TABLE `playlist` DISABLE KEYS */;
INSERT INTO `playlist` VALUES ('PL1','CH1','CatVideos',4,'2009-02-03','2019-04-11'),('PL10','CH2','Thug',0,'2013-08-15','2018-09-09'),('PL11','CH3','Running',0,'2013-02-28','2019-04-04'),('PL12','CH4','Redbull',0,'2003-02-27','2019-06-06'),('PL13','CH4','Whatever',0,'2005-09-21','2017-02-02'),('PL14','CH4','Cars',0,'2009-08-23','2018-01-01'),('PL2','CH2','HeavyMetal',1,'2010-06-13','2019-11-20'),('PL3','CH3','Funny',1,'2009-07-03','2017-05-11'),('PL4','CH4','DbTutorial',2,'2005-05-01','2015-04-11'),('PL5','CH5','NI Multisim',2,'2014-01-31','2018-05-02'),('PL6','CH6','Top10s',2,'2007-04-01','2011-10-08'),('PL7','CH7','Trains',2,'2004-07-03','2008-06-02'),('PL8','CH1','Rap',0,'2015-06-09','2018-09-02'),('PL9','CH1','LOL',0,'2014-06-07','2018-05-05');
/*!40000 ALTER TABLE `playlist` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `mydb`.`Playlist_BEFORE_INSERT`
BEFORE INSERT ON `mydb`.`playlist`
FOR EACH ROW
BEGIN
		IF (NEW.number_of_videos < 0) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid data';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `mydb`.`Playlist_BEFORE_UPDATE`
BEFORE UPDATE ON `mydb`.`playlist`
FOR EACH ROW
BEGIN
	IF (NEW.number_of_videos < 0) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid data';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `playlist_consists_of_videos`
--

DROP TABLE IF EXISTS `playlist_consists_of_videos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `playlist_consists_of_videos` (
  `playlist_id` varchar(20) NOT NULL,
  `video_id` varchar(20) NOT NULL,
  `playlist_position` int(11) NOT NULL,
  `add_date` date NOT NULL,
  PRIMARY KEY (`playlist_id`,`video_id`),
  KEY `playlist_id_idx` (`playlist_id`),
  KEY `video_id1` (`video_id`),
  CONSTRAINT `video_id1` FOREIGN KEY (`video_id`) REFERENCES `video` (`video_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `playlist_id` FOREIGN KEY (`playlist_id`) REFERENCES `playlist` (`playlist_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playlist_consists_of_videos`
--

LOCK TABLES `playlist_consists_of_videos` WRITE;
/*!40000 ALTER TABLE `playlist_consists_of_videos` DISABLE KEYS */;
INSERT INTO `playlist_consists_of_videos` VALUES ('PL1','VI1',1,'2009-11-07'),('PL1','VI2',2,'2009-11-07'),('PL1','VI3',3,'2018-02-06'),('PL1','VI6',4,'2015-08-30'),('PL2','VI2',1,'2018-02-06'),('PL3','VI3',1,'2015-08-30'),('PL4','VI4',1,'2019-05-24'),('PL4','VI5',2,'2019-05-24'),('PL5','VI5',1,'2013-07-17'),('PL5','VI7',2,'2013-07-17'),('PL6','VI6',1,'2010-02-20'),('PL6','VI7',2,'2010-02-20'),('PL7','VI5',2,'2004-07-12'),('PL7','VI7',1,'2004-07-12');
/*!40000 ALTER TABLE `playlist_consists_of_videos` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `mydb`.`Playlist_Consists_of_Videos_BEFORE_INSERT`
BEFORE INSERT ON `mydb`.`playlist_consists_of_videos`
FOR EACH ROW
BEGIN
	IF (NEW.playlist_position < 0) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid data';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `mydb`.`Playlist_Consists_of_Videos_BEFORE_UPDATE`
BEFORE UPDATE ON `mydb`.`playlist_consists_of_videos`
FOR EACH ROW
BEGIN
	IF (NEW.playlist_position < 0) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid data';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `user_id` varchar(20) NOT NULL,
  `name` char(15) NOT NULL,
  `age` int(11) NOT NULL,
  `e-mail` varchar(30) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('UI1','John',17,'johnrock@gmail.com'),('UI10','James',19,'jamescan@gmail.com'),('UI11','Pam',54,'pamthepan@gmail.com'),('UI12','Jefrey',37,'mylitlepony32@gmail.com'),('UI13','Jeley',16,'mogaper@gmail.com'),('UI14','Chong',77,'chongmao@gmail.com'),('UI2','Maharaja',42,'mahajarosa@gmail.com'),('UI3','Bill',19,'billbuild@gmail.com'),('UI4','Kate',34,'katherinecos@gmail.com'),('UI5','Peter',67,'mylitlepony@gmail.com'),('UI6','Julie',16,'pergamo@gmail.com'),('UI7','Young',87,'tsingchao@gmail.com'),('UI8','Patricia',17,'patriciajones@gmail.com'),('UI9','Benedict',50,'benedictpeters@gmail.com');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `mydb`.`User_BEFORE_INSERT`
BEFORE INSERT ON `mydb`.`user`
FOR EACH ROW
BEGIN
	IF (NEW.age < 0) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid data';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `mydb`.`User_BEFORE_UPDATE`
BEFORE UPDATE ON `mydb`.`user`
FOR EACH ROW
BEGIN
	IF (NEW.age < 0) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid data';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `user_reacts_video`
--

DROP TABLE IF EXISTS `user_reacts_video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_reacts_video` (
  `video_id` varchar(20) NOT NULL,
  `user_id` varchar(20) NOT NULL,
  `comment` mediumtext,
  `likes` enum('0','1','2') NOT NULL,
  PRIMARY KEY (`video_id`,`user_id`),
  KEY `user_id_idx` (`user_id`),
  CONSTRAINT `user_id2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `video_id2` FOREIGN KEY (`video_id`) REFERENCES `video` (`video_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_reacts_video`
--

LOCK TABLES `user_reacts_video` WRITE;
/*!40000 ALTER TABLE `user_reacts_video` DISABLE KEYS */;
INSERT INTO `user_reacts_video` VALUES ('VI1','UI1','This is great','1'),('VI1','UI10','Horrible','2'),('VI1','UI8',NULL,'0'),('VI2','UI1','That was very nice','1'),('VI2','UI2','This is horrible','2'),('VI2','UI3',NULL,'1'),('VI2','UI9','Waste of time','2'),('VI3','UI11','Awful','2'),('VI3','UI12','Really good work','1'),('VI3','UI2',NULL,'0'),('VI3','UI3','Awesome','1'),('VI3','UI5','Comsi comsa','0'),('VI4','UI4','Learn editing!!!','0'),('VI5','UI4',NULL,'1'),('VI5','UI5','Im really impressed','0'),('VI5','UI6',NULL,'2'),('VI6','UI6','WOW','1'),('VI7','UI7','Interesting','0');
/*!40000 ALTER TABLE `user_reacts_video` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `mydb`.`User_Reacts_Video_BEFORE_INSERT`
BEFORE INSERT ON `mydb`.`user_reacts_video`
FOR EACH ROW
BEGIN
	IF ((NEW.likes != '0') AND (NEW.likes != '1') AND (NEW.likes != '2')) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid data';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `mydb`.`User_Reacts_Video_BEFORE_UPDATE`
BEFORE UPDATE ON `mydb`.`user_reacts_video`
FOR EACH ROW
BEGIN
	IF ((NEW.likes != '0') AND (NEW.likes != '1') AND (NEW.likes != '2')) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid data';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `user_sex`
--

DROP TABLE IF EXISTS `user_sex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_sex` (
  `user_id` varchar(20) NOT NULL,
  `sex` char(15) NOT NULL,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `user_id3` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_sex`
--

LOCK TABLES `user_sex` WRITE;
/*!40000 ALTER TABLE `user_sex` DISABLE KEYS */;
INSERT INTO `user_sex` VALUES ('UI1','Male'),('UI10','Male'),('UI11','Female'),('UI12','Male'),('UI13','Female'),('UI14','Male'),('UI2','Male'),('UI3','Male'),('UI4','Female'),('UI5','Male'),('UI6','Female'),('UI7','Male'),('UI8','Female'),('UI9','Male');
/*!40000 ALTER TABLE `user_sex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `video`
--

DROP TABLE IF EXISTS `video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `video` (
  `video_id` varchar(20) NOT NULL,
  `channel_id` varchar(20) NOT NULL,
  `title` char(30) NOT NULL,
  `duration` time NOT NULL,
  `path` varchar(100) NOT NULL,
  `upload_date` date NOT NULL,
  PRIMARY KEY (`video_id`),
  KEY `channel_id_idx` (`channel_id`),
  CONSTRAINT `channel_id3` FOREIGN KEY (`channel_id`) REFERENCES `channel` (`channel_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `video`
--

LOCK TABLES `video` WRITE;
/*!40000 ALTER TABLE `video` DISABLE KEYS */;
INSERT INTO `video` VALUES ('VI1','CH1','Persian cat drinks milk','00:01:30','C:\\videos\\VI1.mp4','2009-11-07'),('VI10','CH2','Big trees','00:05:21','C:\\videos\\VI10.mp4','2014-07-23'),('VI11','CH3','Now you see me','00:02:07','C:\\videos\\VI11.mp4','2018-09-12'),('VI12','CH3','Lets roll','00:09:06','C:\\videos\\VI12.mp4','2019-08-30'),('VI13','CH3','Have fun','00:08:09','C:\\videos\\VI13.mp4','2016-07-20'),('VI14','CH7','Keep it up','00:23:05','C:\\videos\\VI14.mp4','2010-04-05'),('VI15','CH7','OK nigga','00:00:10','C:\\videos\\VI15.mp4','2009-05-09'),('VI2','CH2','Motorhead ace of spades cover','00:03:25','C:\\videos\\VI2.mp4','2018-02-06'),('VI3','CH3','Best pranks of 2015','00:10:56','C:\\videos\\VI3.mp4','2015-08-30'),('VI4','CH4','Primary keys','00:25:00','C:\\videos\\VI4.mp4','2019-05-24'),('VI5','CH5','How to make FFT work','00:04:20','C:\\videos\\VI5.mp4','2013-07-17'),('VI6','CH6','Top 10 on stage fails','00:11:04','C:\\videos\\VI6.mp4','2010-02-20'),('VI7','CH7','Carbon based trains','00:30:25','C:\\videos\\VI7.mp4','2004-07-12'),('VI8','CH1','Best day ever','00:16:04','C:\\videos\\VI8.mp4','2015-07-13'),('VI9','CH2','Night walk','00:12:34','C:\\videos\\VI9.mp4','2016-02-21');
/*!40000 ALTER TABLE `video` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `video_category`
--

DROP TABLE IF EXISTS `video_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `video_category` (
  `video_id` varchar(20) NOT NULL,
  `category` enum('Funny','Music','Animals','Educational') NOT NULL,
  PRIMARY KEY (`video_id`,`category`),
  CONSTRAINT `video_id4` FOREIGN KEY (`video_id`) REFERENCES `video` (`video_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `video_category`
--

LOCK TABLES `video_category` WRITE;
/*!40000 ALTER TABLE `video_category` DISABLE KEYS */;
INSERT INTO `video_category` VALUES ('VI1','Funny'),('VI1','Animals'),('VI10','Funny'),('VI11','Funny'),('VI12','Animals'),('VI13','Funny'),('VI14','Educational'),('VI15','Animals'),('VI2','Music'),('VI3','Funny'),('VI4','Educational'),('VI5','Educational'),('VI6','Funny'),('VI7','Educational'),('VI8','Funny'),('VI8','Music'),('VI9','Educational');
/*!40000 ALTER TABLE `video_category` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `mydb`.`Video_Category_BEFORE_INSERT`
BEFORE INSERT ON `mydb`.`video_category`
FOR EACH ROW
BEGIN
	IF ((NEW.category != 'Funny') AND (NEW.category != 'Music') AND (NEW.category != 'Animals') AND (NEW.category != 'Educational')) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid data';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `mydb`.`Video_Category_BEFORE_UPDATE`
BEFORE UPDATE ON `mydb`.`video_category`
FOR EACH ROW
BEGIN
	IF ((NEW.category != 'Funny') AND (NEW.category != 'Music') AND (NEW.category != 'Animals') AND (NEW.category != 'Educational')) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid data';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `video_has_ad`
--

DROP TABLE IF EXISTS `video_has_ad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `video_has_ad` (
  `video_id` varchar(20) NOT NULL,
  `ad_id` varchar(20) NOT NULL,
  `date_added` date NOT NULL,
  PRIMARY KEY (`video_id`,`ad_id`),
  KEY `ad_id_idx` (`ad_id`),
  CONSTRAINT `video_id5` FOREIGN KEY (`video_id`) REFERENCES `video` (`video_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `ad_id` FOREIGN KEY (`ad_id`) REFERENCES `ad` (`ad_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `video_has_ad`
--

LOCK TABLES `video_has_ad` WRITE;
/*!40000 ALTER TABLE `video_has_ad` DISABLE KEYS */;
INSERT INTO `video_has_ad` VALUES ('VI1','AD1','2019-07-03'),('VI1','AD2','2019-10-05'),('VI2','AD2','2018-06-04'),('VI2','AD3','2018-11-07'),('VI3','AD3','2017-05-05'),('VI3','AD4','2017-05-14'),('VI4','AD4','2019-05-25'),('VI5','AD5','2016-03-20'),('VI6','AD6','2019-11-20'),('VI7','AD7','2010-12-06');
/*!40000 ALTER TABLE `video_has_ad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `video_popularity`
--

DROP TABLE IF EXISTS `video_popularity`;
/*!50001 DROP VIEW IF EXISTS `video_popularity`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `video_popularity` (
  `video_id` tinyint NOT NULL,
  `views` tinyint NOT NULL,
  `likes` tinyint NOT NULL,
  `dislikes` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `video_quality`
--

DROP TABLE IF EXISTS `video_quality`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `video_quality` (
  `video_id` varchar(20) NOT NULL,
  `quality` enum('144p','240p','360p','480p','720p','1080p') NOT NULL,
  PRIMARY KEY (`video_id`,`quality`),
  CONSTRAINT `video_id6` FOREIGN KEY (`video_id`) REFERENCES `video` (`video_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `video_quality`
--

LOCK TABLES `video_quality` WRITE;
/*!40000 ALTER TABLE `video_quality` DISABLE KEYS */;
INSERT INTO `video_quality` VALUES ('VI1','480p'),('VI1','720p'),('VI10','144p'),('VI11','1080p'),('VI12','480p'),('VI12','720p'),('VI13','720p'),('VI14','144p'),('VI15','240p'),('VI2','144p'),('VI3','1080p'),('VI4','480p'),('VI5','720p'),('VI6','144p'),('VI7','240p'),('VI8','480p'),('VI8','720p'),('VI9','480p');
/*!40000 ALTER TABLE `video_quality` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `mydb`.`Video_Quality_BEFORE_INSERT`
BEFORE INSERT ON `mydb`.`video_quality`
FOR EACH ROW
BEGIN
	IF ((NEW.quality != '144p') AND (NEW.quality != '240p') AND (NEW.quality != '360p') AND (NEW.quality != '480p') AND (NEW.quality != '720p') AND (NEW.quality != '1080p')) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid data';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `mydb`.`Video_Quality_BEFORE_UPDATE`
BEFORE UPDATE ON `mydb`.`video_quality`
FOR EACH ROW
BEGIN
	IF ((NEW.quality != '144p') AND (NEW.quality != '240p') AND (NEW.quality != '360p') AND (NEW.quality != '480p') AND (NEW.quality != '720p') AND (NEW.quality != '1080p')) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid data';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary table structure for view `views`
--

DROP TABLE IF EXISTS `views`;
/*!50001 DROP VIEW IF EXISTS `views`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `views` (
  `video_id` tinyint NOT NULL,
  `views` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `advertisement_in_videos`
--

/*!50001 DROP TABLE IF EXISTS `advertisement_in_videos`*/;
/*!50001 DROP VIEW IF EXISTS `advertisement_in_videos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `advertisement_in_videos` AS select `video_popularity`.`video_id` AS `video_id`,`video_popularity`.`likes` AS `likes`,`video_popularity`.`dislikes` AS `dislikes`,`video_popularity`.`views` AS `views`,`ad`.`ad_id` AS `ad_id`,`ad`.`company` AS `company` from ((`video_popularity` join `video_has_ad` on((`video_popularity`.`video_id` = `video_has_ad`.`video_id`))) join `ad` on((`video_has_ad`.`ad_id` = `ad`.`ad_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `dislikes`
--

/*!50001 DROP TABLE IF EXISTS `dislikes`*/;
/*!50001 DROP VIEW IF EXISTS `dislikes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `dislikes` AS select `user_reacts_video`.`video_id` AS `video_id`,count(`user_reacts_video`.`user_id`) AS `dislikes` from `user_reacts_video` where (`user_reacts_video`.`likes` = '2') group by `user_reacts_video`.`video_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `likes`
--

/*!50001 DROP TABLE IF EXISTS `likes`*/;
/*!50001 DROP VIEW IF EXISTS `likes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `likes` AS select `user_reacts_video`.`video_id` AS `video_id`,count(`user_reacts_video`.`user_id`) AS `likes` from `user_reacts_video` where (`user_reacts_video`.`likes` = '1') group by `user_reacts_video`.`video_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `video_popularity`
--

/*!50001 DROP TABLE IF EXISTS `video_popularity`*/;
/*!50001 DROP VIEW IF EXISTS `video_popularity`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `video_popularity` AS select `views`.`video_id` AS `video_id`,`views`.`views` AS `views`,`likes`.`likes` AS `likes`,`dislikes`.`dislikes` AS `dislikes` from ((`views` left join `likes` on((`likes`.`video_id` = `views`.`video_id`))) left join `dislikes` on((`dislikes`.`video_id` = `views`.`video_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `views`
--

/*!50001 DROP TABLE IF EXISTS `views`*/;
/*!50001 DROP VIEW IF EXISTS `views`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `views` AS select `user_reacts_video`.`video_id` AS `video_id`,count(`user_reacts_video`.`user_id`) AS `views` from `user_reacts_video` group by `user_reacts_video`.`video_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-12-23  0:01:36
