-- MySQL dump 10.13  Distrib 5.5.58, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: test2
-- ------------------------------------------------------
-- Server version	5.5.58-0ubuntu0.14.04.1

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
-- Table structure for table `carts`
--

DROP TABLE IF EXISTS `carts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `carts` (
  `user_id` int(11) DEFAULT NULL,
  `variant_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `product_quantity` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xyz` (`variant_id`),
  KEY `w` (`user_id`),
  KEY `r` (`product_id`),
  KEY `t` (`order_id`),
  CONSTRAINT `e` FOREIGN KEY (`variant_id`) REFERENCES `variants` (`id`) ON DELETE CASCADE,
  CONSTRAINT `r` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `w` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `xyz` FOREIGN KEY (`variant_id`) REFERENCES `variants` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carts`
--

LOCK TABLES `carts` WRITE;
/*!40000 ALTER TABLE `carts` DISABLE KEYS */;
INSERT INTO `carts` VALUES (2,6,2,3,3,'2017-11-17 21:25:06','2017-11-17 21:25:06',3),(2,2,2,3,4,'2017-11-17 21:25:32','2017-11-17 21:25:32',4);
/*!40000 ALTER TABLE `carts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_history`
--

DROP TABLE IF EXISTS `order_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_history` (
  `user_id` int(11) DEFAULT NULL,
  `variant_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `product_quantity` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `i` (`user_id`),
  KEY `o` (`variant_id`),
  KEY `p` (`product_id`),
  KEY `a` (`order_id`),
  CONSTRAINT `a` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `i` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `o` FOREIGN KEY (`variant_id`) REFERENCES `variants` (`id`) ON DELETE CASCADE,
  CONSTRAINT `p` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_history`
--

LOCK TABLES `order_history` WRITE;
/*!40000 ALTER TABLE `order_history` DISABLE KEYS */;
INSERT INTO `order_history` VALUES (1,1,1,3,1,'2017-11-17 21:21:23','2017-11-17 21:21:23',1),(1,5,1,2,2,'2017-11-17 21:21:48','2017-11-17 21:21:48',2),(2,6,2,3,3,'2017-11-17 21:25:06','2017-11-17 21:25:06',3),(2,2,2,3,4,'2017-11-17 21:25:32','2017-11-17 21:25:32',4);
/*!40000 ALTER TABLE `order_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `order_date` date DEFAULT NULL,
  `order_status` varchar(20) DEFAULT NULL,
  `final_cost` decimal(10,0) DEFAULT NULL,
  `shipping_date` date DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `y` (`user_id`),
  CONSTRAINT `y` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1,'2017-11-17','placed',208,'2017-11-17','2017-11-17 21:22:53','2017-11-17 21:22:53'),(2,1,'2017-11-17','placed',208,'2017-11-17','2017-11-17 21:23:07','2017-11-17 21:23:07'),(3,2,'2017-11-17','placed',0,'2017-11-17','2017-11-17 21:23:21','2017-11-17 21:23:21'),(4,2,'2017-11-17','placed',0,'2017-11-17','2017-11-17 21:23:30','2017-11-17 21:23:30');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payments` (
  `id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `payment_type` varchar(20) NOT NULL,
  `discount_amount` decimal(10,0) DEFAULT '10',
  `payment_date` date DEFAULT NULL,
  `payment_status` varchar(20) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `checkout_cost` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `u` (`order_id`),
  CONSTRAINT `u` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` VALUES (1,2,'cash',20,'2017-11-17','paid','2017-11-17 00:00:00','2017-11-17 21:42:57',188);
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'shoes','2017-12-11 11:42:21','2017-12-11 18:24:21'),(2,'shirt','2017-12-11 15:12:54','2017-12-11 17:45:25'),(3,'watch','2017-12-11 16:12:54','2017-12-11 18:12:32'),(4,'jacket','2017-12-11 15:14:24','2017-12-11 16:25:26'),(5,'belt','2017-12-11 14:14:24','2017-12-11 15:25:35');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `role` varchar(20) DEFAULT NULL,
  `email` varchar(20) NOT NULL,
  `password` varchar(15) NOT NULL,
  `username` varchar(20) NOT NULL,
  `contact` varchar(10) DEFAULT NULL,
  `address` varchar(20) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'buyer','madan@webonise.com','root','madan','8446831141','pune','2017-12-11 18:56:17','2017-12-11 18:57:44'),(2,'buyer','shivani@webonise.com','root','shivani','7845831141','mumbai','2017-12-11 17:56:01','2017-12-11 18:57:44'),(3,'buyer','kamal@webonise.com','root','kamal','5478431141','uttarpradesh','2017-12-11 16:45:01','2017-12-11 17:45:21'),(4,'inventory_manager','owais@webonise.com','root','owais','5478412457','nagpur','2017-12-11 13:25:01','2017-12-11 18:40:21'),(5,'inventory_manager','akansha@webonise.com','root','akansha','7845112457','kanpur','2017-12-11 11:25:01','2017-12-11 13:12:21');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `variants`
--

DROP TABLE IF EXISTS `variants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `variants` (
  `id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `color_name` varchar(20) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `price` decimal(10,0) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `q` (`product_id`),
  CONSTRAINT `q` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `variants`
--

LOCK TABLES `variants` WRITE;
/*!40000 ALTER TABLE `variants` DISABLE KEYS */;
INSERT INTO `variants` VALUES (1,1,'BLACK',91,50,'2017-11-13 00:00:00','2017-11-16 19:19:17'),(2,2,'RED',97,58,'2017-11-13 00:00:00','2017-11-16 18:36:20'),(3,3,'BROWN',100,75,'2017-11-13 00:00:00','2017-11-13 00:00:00'),(4,4,'BLUE',100,68,'2017-11-13 00:00:00','2017-11-13 00:00:00'),(5,1,'GREY',94,52,'2017-11-14 00:00:00','2017-11-14 00:00:00'),(6,2,'BLACK',97,55,'2017-11-14 00:00:00','2017-11-14 00:00:00');
/*!40000 ALTER TABLE `variants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `view_monthly_report`
--

DROP TABLE IF EXISTS `view_monthly_report`;
/*!50001 DROP VIEW IF EXISTS `view_monthly_report`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `view_monthly_report` (
  `order_id` tinyint NOT NULL,
  `Order Date` tinyint NOT NULL,
  `Product names` tinyint NOT NULL,
  `cost of ecah product` tinyint NOT NULL,
  `total cost of order` tinyint NOT NULL,
  `user name` tinyint NOT NULL,
  `email` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `view_orderdetails_productssold`
--

DROP TABLE IF EXISTS `view_orderdetails_productssold`;
/*!50001 DROP VIEW IF EXISTS `view_orderdetails_productssold`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `view_orderdetails_productssold` (
  `Oredr Id` tinyint NOT NULL,
  `Order Total` tinyint NOT NULL,
  `Date` tinyint NOT NULL,
  `Discount` tinyint NOT NULL,
  `Payment method` tinyint NOT NULL,
  `Payment status` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `view_monthly_report`
--

/*!50001 DROP TABLE IF EXISTS `view_monthly_report`*/;
/*!50001 DROP VIEW IF EXISTS `view_monthly_report`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_monthly_report` AS select `o`.`id` AS `order_id`,`o`.`order_date` AS `Order Date`,`p`.`product_name` AS `Product names`,`v`.`price` AS `cost of ecah product`,`pay`.`checkout_cost` AS `total cost of order`,`u`.`username` AS `user name`,`u`.`email` AS `email` from (((((`orders` `o` join `products` `p`) join `variants` `v`) join `payments` `pay`) join `users` `u`) join `order_history` `oh`) where ((`oh`.`user_id` = `u`.`id`) and (`oh`.`variant_id` = `v`.`id`) and (`oh`.`product_id` = `p`.`id`) and (`oh`.`order_id` = `o`.`id`) and (`oh`.`order_id` = `pay`.`order_id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_orderdetails_productssold`
--

/*!50001 DROP TABLE IF EXISTS `view_orderdetails_productssold`*/;
/*!50001 DROP VIEW IF EXISTS `view_orderdetails_productssold`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_orderdetails_productssold` AS select `o`.`id` AS `Oredr Id`,`o`.`final_cost` AS `Order Total`,`o`.`order_date` AS `Date`,`p`.`discount_amount` AS `Discount`,`p`.`payment_type` AS `Payment method`,`p`.`payment_status` AS `Payment status` from (`orders` `o` join `payments` `p`) where (`o`.`id` = `p`.`order_id`) */;
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

-- Dump completed on 2017-11-22 21:44:19
