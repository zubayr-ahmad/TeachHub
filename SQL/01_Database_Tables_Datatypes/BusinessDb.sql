-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: businessdb
-- ------------------------------------------------------
-- Server version	8.0.39

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `customer_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `city` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`customer_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (44,'Monica Drake','emily27@example.net','3193439320703','Oliviamouth'),(45,'Thomas Levine Jr.','anthonysolomon@example.com','1784961243954','Lake John'),(46,'Angela Medina','russellchristine@example.com','9433336619228','East Samantha'),(47,'Robert Young','qjohnson@example.org','5364131634057','Stoneside'),(48,'Krista Daniels','penaelizabeth@example.org','7814902183761','Torresshire'),(49,'Kevin Smith','kaitlin62@example.com','0072177306094','West Andrewchester'),(50,'Patricia Clark','samuel20@example.com','8524804184966','North David'),(51,'Toni Gonzales','pflowers@example.org','6119017510783','Danielport'),(52,'Robert Anderson','hunter74@example.net','0560971052003','South Alecstad'),(53,'Amber Mcgee','ajones@example.org','1633887427614','Newmanbury');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `employee_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `position` varchar(50) DEFAULT NULL,
  `salary` decimal(10,2) DEFAULT NULL,
  `hire_date` date DEFAULT NULL,
  PRIMARY KEY (`employee_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (23,'Kimberly Wilson','Manager',90689.00,'2022-11-13'),(24,'Patrick Baker','Salesperson',93726.00,'2023-09-04'),(25,'Daniel Murray','Developer',66879.00,'2021-11-11'),(26,'Susan Rojas','HR',84503.00,'2022-04-20'),(27,'Randy Kaufman','Analyst',42026.00,'2020-12-23');
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderdetails`
--

DROP TABLE IF EXISTS `orderdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderdetails` (
  `detail_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  `quantity` int NOT NULL,
  PRIMARY KEY (`detail_id`),
  KEY `order_id` (`order_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `orderdetails_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  CONSTRAINT `orderdetails_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=156 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderdetails`
--

LOCK TABLES `orderdetails` WRITE;
/*!40000 ALTER TABLE `orderdetails` DISABLE KEYS */;
INSERT INTO `orderdetails` VALUES (103,106,28,3),(104,106,24,3),(105,122,24,4),(106,125,24,2),(107,130,28,3),(108,130,25,5),(109,130,24,5),(110,108,24,1),(111,108,27,3),(112,112,25,2),(113,112,28,2),(114,120,28,4),(115,131,24,1),(116,118,27,1),(117,129,28,1),(118,129,25,4),(119,129,28,1),(120,113,26,4),(121,113,28,3),(122,119,24,3),(123,119,25,2),(124,132,26,5),(125,132,24,1),(126,121,24,3),(127,121,26,4),(128,124,25,2),(129,124,24,3),(130,104,25,2),(131,109,27,1),(132,110,26,2),(133,110,26,2),(134,110,26,4),(135,115,28,1),(136,115,26,5),(137,117,27,4),(138,117,24,1),(139,116,28,4),(140,116,28,3),(141,116,26,4),(142,123,27,2),(143,107,28,5),(144,111,28,4),(145,114,24,1),(146,114,26,4),(147,114,25,3),(148,126,24,4),(149,126,24,5),(150,127,28,4),(151,128,28,5),(152,133,28,1),(153,133,25,5),(154,133,24,2),(155,105,24,5);
/*!40000 ALTER TABLE `orderdetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `order_date` date NOT NULL,
  `customer_id` int DEFAULT NULL,
  `employee_id` int DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `customer_id` (`customer_id`),
  KEY `employee_id` (`employee_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`)
) ENGINE=InnoDB AUTO_INCREMENT=134 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (104,'2024-08-21',50,27),(105,'2024-05-02',53,27),(106,'2023-12-19',44,23),(107,'2024-01-18',52,27),(108,'2024-06-26',46,23),(109,'2024-06-02',50,23),(110,'2024-03-26',50,27),(111,'2024-05-15',52,25),(112,'2024-03-16',46,24),(113,'2024-07-09',48,24),(114,'2024-03-05',52,27),(115,'2023-09-10',50,24),(116,'2024-07-18',51,23),(117,'2023-09-08',50,26),(118,'2023-10-14',47,27),(119,'2024-04-07',48,25),(120,'2024-03-14',46,27),(121,'2023-09-24',49,23),(122,'2024-06-03',44,25),(123,'2023-09-13',51,25),(124,'2023-12-15',49,26),(125,'2023-10-22',44,26),(126,'2024-05-23',52,24),(127,'2023-10-25',52,25),(128,'2024-07-21',52,26),(129,'2024-02-27',47,24),(130,'2024-05-19',44,27),(131,'2024-04-11',46,24),(132,'2024-02-21',48,25),(133,'2024-05-19',52,26);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `category` varchar(50) DEFAULT NULL,
  `stock_quantity` int DEFAULT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (24,'Laptop',800.00,'Electronics',50),(25,'Smartphone',600.00,'Electronics',100),(26,'Table',150.00,'Furniture',20),(27,'Chair',75.00,'Furniture',50),(28,'Monitor',300.00,'Electronics',40);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-10 15:05:14
