-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.1.73-community


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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

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
 (11,'2013-02-16 04:30:00','Chennaiyan','Goa',2,2),
 (12,'2013-02-16 04:30:00','Goa','Chennaiyan',4,5),
 (18,'2013-02-16 04:30:00','Goa','Chennaiyan',4,5),
 (20,'2013-02-16 04:30:00','Bengaluru FC','Chennaiyan',4,5);
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
-- Create schema cafe
--

CREATE DATABASE IF NOT EXISTS cafe;
USE cafe;

--
-- Definition of table `fooditems`
--

DROP TABLE IF EXISTS `fooditems`;
CREATE TABLE `fooditems` (
  `item_id` int(11) NOT NULL AUTO_INCREMENT,
  `item_name` varchar(255) DEFAULT NULL,
  `item_type` varchar(25) DEFAULT NULL,
  `item_meal_typeid` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `fkey3` (`item_meal_typeid`),
  CONSTRAINT `fkey3` FOREIGN KEY (`item_meal_typeid`) REFERENCES `mealtype` (`mealtype_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fooditems`
--

/*!40000 ALTER TABLE `fooditems` DISABLE KEYS */;
INSERT INTO `fooditems` (`item_id`,`item_name`,`item_type`,`item_meal_typeid`) VALUES 
 (1,'Paneer butter masala','Veg',2),
 (2,'Idli sambhar','Veg',1),
 (3,'Cornflakes','Veg',1),
 (4,'Vadapav','Veg',1),
 (5,'Uttapam','Veg',1),
 (6,'Chana dal','Veg',2),
 (7,'Gobhi aalu','Veg',2),
 (8,'Sambhar','Veg',2),
 (9,'Paneer pasanda','Veg',2),
 (10,'Rice','Veg',2),
 (11,'Roti','Veg',2),
 (12,'Roti','Veg',2),
 (13,'Dum aalu','Veg',2),
 (14,'Palak paneer','Veg',4),
 (15,'Dal makhani','Veg',4),
 (16,'Salad','Veg',2);
/*!40000 ALTER TABLE `fooditems` ENABLE KEYS */;


--
-- Definition of table `foodmeals`
--

DROP TABLE IF EXISTS `foodmeals`;
CREATE TABLE `foodmeals` (
  `meal_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  PRIMARY KEY (`meal_id`,`item_id`),
  KEY `fkey2` (`item_id`),
  CONSTRAINT `fkey1` FOREIGN KEY (`meal_id`) REFERENCES `meals` (`meal_id`),
  CONSTRAINT `fkey2` FOREIGN KEY (`item_id`) REFERENCES `fooditems` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `foodmeals`
--

/*!40000 ALTER TABLE `foodmeals` DISABLE KEYS */;
/*!40000 ALTER TABLE `foodmeals` ENABLE KEYS */;


--
-- Definition of table `meals`
--

DROP TABLE IF EXISTS `meals`;
CREATE TABLE `meals` (
  `meal_id` int(11) NOT NULL,
  `meal_name` varchar(200) DEFAULT NULL,
  `meal_price` mediumtext,
  `meal_desc` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`meal_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `meals`
--

/*!40000 ALTER TABLE `meals` DISABLE KEYS */;
INSERT INTO `meals` (`meal_id`,`meal_name`,`meal_price`,`meal_desc`) VALUES 
 (1,'Veg Thali','50','Combined goodness of delighting indian veg dishes served with rice and roti.'),
 (2,'Full Veg Thali','60','Combined goodness of delighting indian veg dishes served with rice and roti.');
/*!40000 ALTER TABLE `meals` ENABLE KEYS */;


--
-- Definition of table `mealtype`
--

DROP TABLE IF EXISTS `mealtype`;
CREATE TABLE `mealtype` (
  `mealtype_id` int(11) NOT NULL AUTO_INCREMENT,
  `mealtype_name` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`mealtype_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mealtype`
--

/*!40000 ALTER TABLE `mealtype` DISABLE KEYS */;
INSERT INTO `mealtype` (`mealtype_id`,`mealtype_name`) VALUES 
 (1,'Breakfast'),
 (2,'Lunch'),
 (3,'Evening Snacks'),
 (4,'Dinner');
/*!40000 ALTER TABLE `mealtype` ENABLE KEYS */;

--
-- Create schema cafe1
--

CREATE DATABASE IF NOT EXISTS cafe1;
USE cafe1;

--
-- Definition of table `fooditems`
--

DROP TABLE IF EXISTS `fooditems`;
CREATE TABLE `fooditems` (
  `item_id` int(11) NOT NULL AUTO_INCREMENT,
  `item_name` varchar(255) DEFAULT NULL,
  `item_type` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fooditems`
--

/*!40000 ALTER TABLE `fooditems` DISABLE KEYS */;
INSERT INTO `fooditems` (`item_id`,`item_name`,`item_type`) VALUES 
 (1,'Bread omelette','Non-veg'),
 (2,'Idli sambhar','Veg'),
 (3,'CornFlakes','Veg'),
 (4,'Pav Omelette','Non-veg'),
 (5,'Fruit salad','Veg'),
 (6,'Bread Butter','Veg'),
 (7,'Tea','Veg'),
 (8,'Milk','Veg'),
 (9,'Paneer Butter masala','Veg'),
 (10,'Arhar dal','Veg'),
 (11,'Veg pulav','Veg'),
 (12,'Veg Biryani','Veg'),
 (13,'Chicken Biryani','Non-Veg'),
 (14,'Salad','Veg'),
 (15,'Paneer pasanda','Veg'),
 (16,'Gobhi aalu','Veg'),
 (17,'Gobhi 65','Veg'),
 (18,'Dum aalu','Veg'),
 (19,'Aalu 65','Veg'),
 (20,'Palak paneer','Veg'),
 (21,'Uttapam','Veg'),
 (22,'Roti','Veg'),
 (23,'Rice','Veg'),
 (24,'Mutton','Non-Veg'),
 (25,'Chicken','Non-Veg');
/*!40000 ALTER TABLE `fooditems` ENABLE KEYS */;


--
-- Definition of table `foodmeals`
--

DROP TABLE IF EXISTS `foodmeals`;
CREATE TABLE `foodmeals` (
  `meal_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  PRIMARY KEY (`meal_id`,`item_id`),
  KEY `fkey2` (`item_id`),
  CONSTRAINT `fkey1` FOREIGN KEY (`meal_id`) REFERENCES `meals` (`meal_id`),
  CONSTRAINT `fkey2` FOREIGN KEY (`item_id`) REFERENCES `fooditems` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `foodmeals`
--

/*!40000 ALTER TABLE `foodmeals` DISABLE KEYS */;
INSERT INTO `foodmeals` (`meal_id`,`item_id`) VALUES 
 (5,2),
 (6,3),
 (1,9),
 (2,9),
 (1,10),
 (2,10),
 (3,13),
 (4,13),
 (1,14),
 (2,14),
 (3,14),
 (4,14),
 (1,16),
 (2,20),
 (7,21),
 (1,22),
 (2,22),
 (3,22),
 (4,22),
 (1,23),
 (2,23),
 (3,23),
 (3,24),
 (4,25);
/*!40000 ALTER TABLE `foodmeals` ENABLE KEYS */;


--
-- Definition of table `mealavail`
--

DROP TABLE IF EXISTS `mealavail`;
CREATE TABLE `mealavail` (
  `meal_id` int(11) NOT NULL,
  `mealtype_id` int(11) NOT NULL,
  PRIMARY KEY (`meal_id`,`mealtype_id`),
  KEY `fkey5` (`mealtype_id`),
  CONSTRAINT `fkey4` FOREIGN KEY (`meal_id`) REFERENCES `meals` (`meal_id`),
  CONSTRAINT `fkey5` FOREIGN KEY (`mealtype_id`) REFERENCES `mealtype` (`mealtype_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mealavail`
--

/*!40000 ALTER TABLE `mealavail` DISABLE KEYS */;
INSERT INTO `mealavail` (`meal_id`,`mealtype_id`) VALUES 
 (5,1),
 (6,1),
 (7,1),
 (1,2),
 (2,2),
 (3,2),
 (4,2),
 (1,4),
 (2,4),
 (3,4),
 (4,4);
/*!40000 ALTER TABLE `mealavail` ENABLE KEYS */;


--
-- Definition of table `meals`
--

DROP TABLE IF EXISTS `meals`;
CREATE TABLE `meals` (
  `meal_id` int(11) NOT NULL,
  `meal_name` varchar(200) DEFAULT NULL,
  `meal_price` mediumtext,
  `meal_desc` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`meal_id`),
  CONSTRAINT `gkey8` FOREIGN KEY (`meal_id`) REFERENCES `meals` (`meal_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `meals`
--

/*!40000 ALTER TABLE `meals` DISABLE KEYS */;
INSERT INTO `meals` (`meal_id`,`meal_name`,`meal_price`,`meal_desc`) VALUES 
 (1,'Veg Thali','50','Combined goodness of delighting indian veg dishes served with rice and roti.'),
 (2,'Full Veg Thali','60','Combined goodness of delighting indian veg dishes served with rice and roti.'),
 (3,'Mini Non Veg Thali','60','Combined goodness of delighting indian non-veg dishes served with rice and roti.'),
 (4,'Full Non Veg Thali','60','Combined goodness of delighting indian non-veg dishes served with rice and roti.'),
 (5,'Idli Sambhar','60','South indian goodness.'),
 (6,'Corn Flakes','60','Milk wth corn flakes'),
 (7,'Uttapam','60','South indian goodness.');
/*!40000 ALTER TABLE `meals` ENABLE KEYS */;


--
-- Definition of table `mealtype`
--

DROP TABLE IF EXISTS `mealtype`;
CREATE TABLE `mealtype` (
  `mealtype_id` int(11) NOT NULL AUTO_INCREMENT,
  `mealtype_name` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`mealtype_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mealtype`
--

/*!40000 ALTER TABLE `mealtype` DISABLE KEYS */;
INSERT INTO `mealtype` (`mealtype_id`,`mealtype_name`) VALUES 
 (1,'Breakfast'),
 (2,'Lunch'),
 (3,'Snacks'),
 (4,'Dinner');
/*!40000 ALTER TABLE `mealtype` ENABLE KEYS */;


--
-- Definition of table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
CREATE TABLE `order_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` varchar(25) DEFAULT NULL,
  `meal_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_items`
--

/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
INSERT INTO `order_items` (`id`,`order_id`,`meal_id`) VALUES 
 (1,'O1064',1),
 (2,'O1064',2),
 (3,'O1065',1),
 (4,'O1065',2);
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;


--
-- Definition of table `order_status`
--

DROP TABLE IF EXISTS `order_status`;
CREATE TABLE `order_status` (
  `status_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_status`
--

/*!40000 ALTER TABLE `order_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_status` ENABLE KEYS */;


--
-- Definition of table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `order_id` varchar(25) NOT NULL,
  `user_id` varchar(25) DEFAULT NULL,
  `order_desc` varchar(500) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `order_status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `fkey7` (`user_id`),
  CONSTRAINT `fkey7` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` (`order_id`,`user_id`,`order_desc`,`created`,`order_status`) VALUES 
 ('O1042','M1043142','Lunch','2017-08-28 13:24:53','Cancelled'),
 ('O1043','M1043142','Lunch','2017-08-28 13:24:53','Cancelled'),
 ('O1045','M1043142','Lunch','2017-08-28 13:24:53','Cancelled'),
 ('O1046','M1043142','Lunch','2017-08-28 13:24:53','Cancelled'),
 ('O1047','M1043142','Lunch','2017-08-28 13:24:53','Cancelled'),
 ('O1048','M1043142','Lunch','2017-08-28 13:24:53','Cancelled'),
 ('O1049','M1043142','Lunch','2017-08-28 13:24:53',NULL),
 ('O1050','M1043142','Lunch','2017-08-28 13:24:53',NULL),
 ('O1051','M1043142','Lunch','2017-08-28 13:24:53',NULL),
 ('O1052','M1043142','Lunch','2017-08-28 13:24:53',NULL),
 ('O1053','M1043142','Lunch','2017-08-28 13:24:53',NULL),
 ('O1054','M1043142','Lunch','2017-08-28 13:24:53',NULL),
 ('O1055','M1043142','Lunch','2017-08-28 13:24:53',NULL),
 ('O1056','M1043142','Lunch','2017-08-28 13:24:53',NULL),
 ('O1058','M1043142','Lunch','2017-08-28 13:24:53',NULL),
 ('O1059','M1043142','Lunch','2017-08-28 13:24:53',NULL),
 ('O1060','M1043142','Lunch','2017-08-28 13:24:53',NULL),
 ('O1062','M1043142','Lunch','2017-08-28 13:24:53',NULL),
 ('O1063','M1043142','Lunch','2017-08-28 13:24:53',NULL),
 ('O1064','M1043142','Lunch','2017-08-28 13:24:53',NULL),
 ('O1065','M1043142','Dinner','2017-08-28 13:24:53','Placed');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;


--
-- Definition of table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `user_id` varchar(25) NOT NULL,
  `user_name` varchar(100) DEFAULT NULL,
  `user_pass` varchar(100) DEFAULT NULL,
  `user_email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`user_id`,`user_name`,`user_pass`,`user_email`) VALUES 
 ('M1043142','Vidit Kumar','fHY2RGZBty9BXmn8dAuf/ckxwjs=','thvidit@gmail.com'),
 ('M1043143','Suraj Kalyampudi','OZ5lilphZogM5NbA92frMDQyffo=','suraj.kalyampudi@mindtree.com');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

--
-- Create schema jira
--

CREATE DATABASE IF NOT EXISTS jira;
USE jira;

--
-- Definition of table `mindscapabilities`
--

DROP TABLE IF EXISTS `mindscapabilities`;
CREATE TABLE `mindscapabilities` (
  `m_id` varchar(25) NOT NULL,
  `c_id` int(11) NOT NULL,
  `c_status` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mindscapabilities`
--

/*!40000 ALTER TABLE `mindscapabilities` DISABLE KEYS */;
/*!40000 ALTER TABLE `mindscapabilities` ENABLE KEYS */;

--
-- Create schema jira2
--

CREATE DATABASE IF NOT EXISTS jira2;
USE jira2;

--
-- Definition of table `mindscapabilities`
--

DROP TABLE IF EXISTS `mindscapabilities`;
CREATE TABLE `mindscapabilities` (
  `m_id` varchar(25) NOT NULL,
  `c_id` int(11) NOT NULL,
  `c_status` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mindscapabilities`
--

/*!40000 ALTER TABLE `mindscapabilities` DISABLE KEYS */;
/*!40000 ALTER TABLE `mindscapabilities` ENABLE KEYS */;

--
-- Create schema logincredentials
--

CREATE DATABASE IF NOT EXISTS logincredentials;
USE logincredentials;

--
-- Definition of table `logindetails`
--

DROP TABLE IF EXISTS `logindetails`;
CREATE TABLE `logindetails` (
  `username` varchar(25) DEFAULT NULL,
  `userpass` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `logindetails`
--

/*!40000 ALTER TABLE `logindetails` DISABLE KEYS */;
INSERT INTO `logindetails` (`username`,`userpass`) VALUES 
 ('vidit','P9ZvdSy9AW456DcWHH1M94RnQrg='),
 ('thvidit','h2vGC621WCBzJGfg17LLKX2+gX4='),
 ('surajk','GJYvguZyfwO2YjzxFDqFVn/C4uM='),
 ('nikhilPraveen','B3ddlT0L0CXflTmk+d07jL023S8='),
 ('mahesh','AHyRr7UMDQTQ65NJRC9WK5SXYNM=');
/*!40000 ALTER TABLE `logindetails` ENABLE KEYS */;

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




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
