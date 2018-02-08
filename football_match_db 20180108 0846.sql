-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.1.53-community


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema football_match_db
--

CREATE DATABASE IF NOT EXISTS football_match_db;
USE football_match_db;

--
-- Definition of table `campusminds`
--

DROP TABLE IF EXISTS `campusminds`;
CREATE TABLE `campusminds` (
  `MID` bigint(20) NOT NULL AUTO_INCREMENT,
  `lead` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `trackID` int(11) NOT NULL,
  PRIMARY KEY (`MID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `campusminds`
--

/*!40000 ALTER TABLE `campusminds` DISABLE KEYS */;
/*!40000 ALTER TABLE `campusminds` ENABLE KEYS */;


--
-- Definition of table `lead`
--

DROP TABLE IF EXISTS `lead`;
CREATE TABLE `lead` (
  `MID` bigint(20) NOT NULL AUTO_INCREMENT,
  `location` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `orchardHead` varchar(255) DEFAULT NULL,
  `trackID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`MID`),
  KEY `FK_dtxfr4byi0i258t8naa1qcqla` (`trackID`),
  CONSTRAINT `FK_dtxfr4byi0i258t8naa1qcqla` FOREIGN KEY (`trackID`) REFERENCES `campusminds` (`MID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lead`
--

/*!40000 ALTER TABLE `lead` DISABLE KEYS */;
/*!40000 ALTER TABLE `lead` ENABLE KEYS */;


--
-- Definition of table `matches`
--

DROP TABLE IF EXISTS `matches`;
CREATE TABLE `matches` (
  `MATCH_ID` int(11) NOT NULL AUTO_INCREMENT,
  `MATCH_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `FIRST_TEAM_NAME` varchar(25) DEFAULT NULL,
  `SECOND_TEAM_NAME` varchar(25) DEFAULT NULL,
  `FIRST_TEAM_GOALS` int(11) NOT NULL,
  `SECOND_TEAM_GOALS` int(11) NOT NULL,
  PRIMARY KEY (`MATCH_ID`),
  KEY `FIRST_TEAM_NAME` (`FIRST_TEAM_NAME`),
  KEY `SECOND_TEAM_NAME` (`SECOND_TEAM_NAME`),
  CONSTRAINT `matches_ibfk_1` FOREIGN KEY (`FIRST_TEAM_NAME`) REFERENCES `teams` (`TEAM_NAME`),
  CONSTRAINT `matches_ibfk_2` FOREIGN KEY (`SECOND_TEAM_NAME`) REFERENCES `teams` (`TEAM_NAME`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `matches`
--

/*!40000 ALTER TABLE `matches` DISABLE KEYS */;
INSERT INTO `matches` (`MATCH_ID`,`MATCH_DATE`,`FIRST_TEAM_NAME`,`SECOND_TEAM_NAME`,`FIRST_TEAM_GOALS`,`SECOND_TEAM_GOALS`) VALUES 
 (2,'2013-02-16 04:30:00','Chennaiyan','Goa',2,2),
 (3,'2013-02-13 06:45:00','Chennaiyan','Kerala Blasters',1,1),
 (4,'2013-02-12 04:30:00','Bengaluru FC','Chennaiyan',2,2),
 (5,'2013-02-16 04:30:00','Chennaiyan','Goa',2,2),
 (6,'2013-02-16 04:30:00','Chennaiyan','Goa',2,2),
 (7,'2013-02-16 04:30:00','Chennaiyan','Goa',2,2),
 (8,'2013-02-16 04:30:00','Chennaiyan','Goa',2,2),
 (9,'2013-02-16 04:30:00','Chennaiyan','Goa',2,2),
 (10,'2013-02-16 04:30:00','Chennaiyan','Goa',2,2),
 (11,'2013-02-16 04:30:00','Chennaiyan','Goa',2,2);
/*!40000 ALTER TABLE `matches` ENABLE KEYS */;


--
-- Definition of table `orchardheads`
--

DROP TABLE IF EXISTS `orchardheads`;
CREATE TABLE `orchardheads` (
  `MID` bigint(20) NOT NULL AUTO_INCREMENT,
  `location` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `trackID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`MID`),
  KEY `FK_d19awpyy8nsryca2ybc8m06g5` (`trackID`),
  CONSTRAINT `FK_d19awpyy8nsryca2ybc8m06g5` FOREIGN KEY (`trackID`) REFERENCES `lead` (`MID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orchardheads`
--

/*!40000 ALTER TABLE `orchardheads` DISABLE KEYS */;
/*!40000 ALTER TABLE `orchardheads` ENABLE KEYS */;


--
-- Definition of table `teams`
--

DROP TABLE IF EXISTS `teams`;
CREATE TABLE `teams` (
  `TEAM_NAME` varchar(25) NOT NULL,
  `TEAM_CITY` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`TEAM_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `teams`
--

/*!40000 ALTER TABLE `teams` DISABLE KEYS */;
INSERT INTO `teams` (`TEAM_NAME`,`TEAM_CITY`) VALUES 
 ('Bengaluru FC','Bangalore'),
 ('Chennaiyan','Chennai'),
 ('Delhi Dynamos','Delhi'),
 ('Goa','Margoa'),
 ('Kerala Blasters','Kochi');
/*!40000 ALTER TABLE `teams` ENABLE KEYS */;

--
-- Create schema orchard3
--

CREATE DATABASE IF NOT EXISTS orchard3;
USE orchard3;

--
-- Definition of table `campusminds`
--

DROP TABLE IF EXISTS `campusminds`;
CREATE TABLE `campusminds` (
  `MID` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `leadId` int(11) DEFAULT NULL,
  PRIMARY KEY (`MID`),
  KEY `FK_2ntx7etj2wjkddxenq13aoa8p` (`leadId`),
  CONSTRAINT `FK_2ntx7etj2wjkddxenq13aoa8p` FOREIGN KEY (`leadId`) REFERENCES `leads` (`leadsId`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `campusminds`
--

/*!40000 ALTER TABLE `campusminds` DISABLE KEYS */;
INSERT INTO `campusminds` (`MID`,`name`,`leadId`) VALUES 
 (1,'Suraj',1),
 (2,'Shubham',1),
 (3,'Navneet',1),
 (4,'Aman',2),
 (5,'Bhagwat',2),
 (6,'Gaurob',2),
 (7,'Vinay Annanya',2),
 (8,'SabyaSachi Thakur',9),
 (9,'Hemant kumar',9),
 (10,'Lionel Messi',2),
 (11,'Ronaldo',11),
 (12,'Zlatan',13),
 (13,'Hazard',9),
 (14,'Annay Vinay',9),
 (15,'Aman Singh',9),
 (16,'Higuain',13),
 (17,'Drogba',2),
 (18,'Not Drogba',2),
 (19,'Dybala',2),
 (20,'Chellani',2),
 (21,'Ronaldinho',2),
 (22,'Chaudhary',2),
 (23,'Bale',2),
 (24,'Dybala',2),
 (25,'Morata',2),
 (26,'Dybala',2),
 (28,'Cloud Singh',2);
/*!40000 ALTER TABLE `campusminds` ENABLE KEYS */;


--
-- Definition of table `leads`
--

DROP TABLE IF EXISTS `leads`;
CREATE TABLE `leads` (
  `leadsId` int(11) NOT NULL AUTO_INCREMENT,
  `mId` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `trackId` int(11) DEFAULT NULL,
  PRIMARY KEY (`leadsId`),
  KEY `FK_rj9fjvi4k2j1v5b2fql2hrs49` (`trackId`),
  CONSTRAINT `FK_rj9fjvi4k2j1v5b2fql2hrs49` FOREIGN KEY (`trackId`) REFERENCES `tracks` (`trackId`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `leads`
--

/*!40000 ALTER TABLE `leads` DISABLE KEYS */;
INSERT INTO `leads` (`leadsId`,`mId`,`name`,`trackId`) VALUES 
 (1,1,'Prem',1),
 (2,5,'Smruti',2),
 (9,3,'Vivek Kumar Singh',10),
 (10,4,'SAP',12),
 (11,15,'Sri vidya',13),
 (13,8,'Smruti Singh',13);
/*!40000 ALTER TABLE `leads` ENABLE KEYS */;


--
-- Definition of table `tracks`
--

DROP TABLE IF EXISTS `tracks`;
CREATE TABLE `tracks` (
  `trackId` int(11) NOT NULL AUTO_INCREMENT,
  `trackName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`trackId`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tracks`
--

/*!40000 ALTER TABLE `tracks` DISABLE KEYS */;
INSERT INTO `tracks` (`trackId`,`trackName`) VALUES 
 (1,'EAI'),
 (2,'Java'),
 (8,'Data Science'),
 (9,'.NET'),
 (10,'.NET'),
 (11,'Data analytics'),
 (12,'Sitecore'),
 (13,'SDET'),
 (39,'Linkin Park'),
 (81,'CheckTrack');
/*!40000 ALTER TABLE `tracks` ENABLE KEYS */;

--
-- Create schema training
--

CREATE DATABASE IF NOT EXISTS training;
USE training;

--
-- Definition of table `american`
--

DROP TABLE IF EXISTS `american`;
CREATE TABLE `american` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(45) NOT NULL,
  `price` int(10) unsigned NOT NULL,
  `departureDate` varchar(45) NOT NULL,
  `origin` varchar(45) NOT NULL,
  `destination` varchar(45) NOT NULL,
  `emptySeats` varchar(45) NOT NULL,
  `planeId` int(10) unsigned NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `american`
--

/*!40000 ALTER TABLE `american` DISABLE KEYS */;
INSERT INTO `american` (`ID`,`code`,`price`,`departureDate`,`origin`,`destination`,`emptySeats`,`planeId`) VALUES 
 (1,'ER38sd',400,'2017/07/26','CLE','SFO','0',1),
 (2,'ER39sd',600,'2017/07/27','LAX','PDX','115',2),
 (3,'ER40sd',350,'2017/07/28','LAX','CLE','12',3),
 (4,'ER40sd',350,'2017/07/29','SFO','LAX','12',3),
 (5,'ER38sd',400,'2016/03/20','MUA','SFO','0',13),
 (6,'ER38sd',400,'2016/03/20','MUA','SFO','0',14),
 (7,'ER38sd',400,'2016/03/20','MUA','SFO','0',14),
 (8,'ER38sd',400,'2016/03/20','MUA','SFO','0',1),
 (9,'ER38sd',400,'2016/03/20','MUA','SFO','0',1),
 (10,'ER38sd',400,'2016/03/20','MUA','SFO','0',1),
 (11,'ER38sd',400,'2016/03/20','MUA','SFO','0',1),
 (12,'ER41sd',400,'2016/03/20','MUA','SFO','0',1),
 (13,'ER42sd',400,'2016/03/20','MUA','SFO','0',18);
/*!40000 ALTER TABLE `american` ENABLE KEYS */;


--
-- Definition of table `planes`
--

DROP TABLE IF EXISTS `planes`;
CREATE TABLE `planes` (
  `planeId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(45) NOT NULL,
  `totalSeats` varchar(45) NOT NULL,
  PRIMARY KEY (`planeId`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `planes`
--

/*!40000 ALTER TABLE `planes` DISABLE KEYS */;
INSERT INTO `planes` (`planeId`,`type`,`totalSeats`) VALUES 
 (1,'Boeing 737','150'),
 (2,'Boeing 738','350'),
 (3,'Boeing 739','250'),
 (12,'Boeing 740','450'),
 (13,'Boeing 741','150'),
 (14,'Boeing 742','250'),
 (15,'Boeing 742','250'),
 (16,'Boeing 737','150'),
 (17,'Boeing 737','150'),
 (18,'Boeing 743','150');
/*!40000 ALTER TABLE `planes` ENABLE KEYS */;

--
-- Create schema orchard4
--

CREATE DATABASE IF NOT EXISTS orchard4;
USE orchard4;

--
-- Definition of table `campusminds`
--

DROP TABLE IF EXISTS `campusminds`;
CREATE TABLE `campusminds` (
  `MID` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `leadId` int(11) DEFAULT NULL,
  `trackId` int(11) DEFAULT NULL,
  PRIMARY KEY (`MID`),
  KEY `FK_2ntx7etj2wjkddxenq13aoa8p` (`leadId`),
  KEY `FK_t9n4otpohr1am05atfxgljjki` (`trackId`),
  CONSTRAINT `FK_2ntx7etj2wjkddxenq13aoa8p` FOREIGN KEY (`leadId`) REFERENCES `leads` (`leadsId`),
  CONSTRAINT `FK_t9n4otpohr1am05atfxgljjki` FOREIGN KEY (`trackId`) REFERENCES `leads` (`leadsId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `campusminds`
--

/*!40000 ALTER TABLE `campusminds` DISABLE KEYS */;
INSERT INTO `campusminds` (`MID`,`name`,`leadId`,`trackId`) VALUES 
 (1,'Suraj',1,NULL);
/*!40000 ALTER TABLE `campusminds` ENABLE KEYS */;


--
-- Definition of table `leads`
--

DROP TABLE IF EXISTS `leads`;
CREATE TABLE `leads` (
  `leadsId` int(11) NOT NULL AUTO_INCREMENT,
  `mId` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `trackId` int(11) DEFAULT NULL,
  PRIMARY KEY (`leadsId`),
  KEY `FK_rj9fjvi4k2j1v5b2fql2hrs49` (`trackId`),
  CONSTRAINT `FK_rj9fjvi4k2j1v5b2fql2hrs49` FOREIGN KEY (`trackId`) REFERENCES `tracks` (`trackId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `leads`
--

/*!40000 ALTER TABLE `leads` DISABLE KEYS */;
INSERT INTO `leads` (`leadsId`,`mId`,`name`,`trackId`) VALUES 
 (1,3,'Prem',1);
/*!40000 ALTER TABLE `leads` ENABLE KEYS */;


--
-- Definition of table `tracks`
--

DROP TABLE IF EXISTS `tracks`;
CREATE TABLE `tracks` (
  `trackId` int(11) NOT NULL AUTO_INCREMENT,
  `trackName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`trackId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tracks`
--

/*!40000 ALTER TABLE `tracks` DISABLE KEYS */;
INSERT INTO `tracks` (`trackId`,`trackName`) VALUES 
 (1,'EAI');
/*!40000 ALTER TABLE `tracks` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
