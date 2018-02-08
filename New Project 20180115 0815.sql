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
 (3,'Evening Snacks'),
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_items`
--

/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
INSERT INTO `order_items` (`id`,`order_id`,`meal_id`) VALUES 
 (1,'O1064',1),
 (2,'O1064',2);
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
 ('O1042','M1043142','Lunch','2017-08-28 13:24:53',NULL),
 ('O1043','M1043142','Lunch','2017-08-28 13:24:53',NULL),
 ('O1045','M1043142','Lunch','2017-08-28 13:24:53',NULL),
 ('O1046','M1043142','Lunch','2017-08-28 13:24:53',NULL),
 ('O1047','M1043142','Lunch','2017-08-28 13:24:53',NULL),
 ('O1048','M1043142','Lunch','2017-08-28 13:24:53',NULL),
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
 ('O1064','M1043142','Lunch','2017-08-28 13:24:53',NULL);
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




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
