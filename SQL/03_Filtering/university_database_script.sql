CREATE DATABASE  IF NOT EXISTS `university` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `university`;
-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: university
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
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `courses` (
  `course_id` int NOT NULL AUTO_INCREMENT,
  `course_name` varchar(100) NOT NULL,
  `department_id` int DEFAULT NULL,
  `teacher_id` int DEFAULT NULL,
  PRIMARY KEY (`course_id`),
  KEY `department_id` (`department_id`),
  KEY `teacher_id` (`teacher_id`),
  CONSTRAINT `courses_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `departments` (`department_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `courses_ibfk_2` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`teacher_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses`
--

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
INSERT INTO `courses` VALUES (1,'Data Structures',5,NULL),(2,'Algorithms',5,2),(3,'Database Systems',5,1),(4,'Operating Systems',5,1),(5,'Artificial Intelligence',5,13),(6,'Calculus',4,13),(7,'Linear Algebra',4,5),(8,'Statistics',4,12),(9,'Quantum Mechanics',2,13),(10,'Electromagnetism',2,2),(11,'Classical Mechanics',2,NULL),(12,'Thermodynamics',2,12),(13,'Cell Biology',1,7),(14,'Genetics',1,5);
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departments` (
  `department_id` int NOT NULL AUTO_INCREMENT,
  `department_name` varchar(50) NOT NULL,
  `budget` decimal(10,2) DEFAULT NULL,
  `head_id` int DEFAULT NULL,
  PRIMARY KEY (`department_id`),
  KEY `head_id` (`head_id`),
  CONSTRAINT `departments_ibfk_1` FOREIGN KEY (`head_id`) REFERENCES `teachers` (`teacher_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES (1,'Computer Science',500000.00,10),(2,'Mathematics',300000.00,6),(3,'Physics',400000.00,10),(4,'Biology',250000.00,4),(5,'History',200000.00,NULL);
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enrollments`
--

DROP TABLE IF EXISTS `enrollments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enrollments` (
  `enrollment_id` int NOT NULL AUTO_INCREMENT,
  `student_id` int DEFAULT NULL,
  `course_id` int DEFAULT NULL,
  `grade` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`enrollment_id`),
  KEY `student_id` (`student_id`),
  KEY `course_id` (`course_id`),
  CONSTRAINT `enrollments_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `enrollments_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enrollments`
--

LOCK TABLES `enrollments` WRITE;
/*!40000 ALTER TABLE `enrollments` DISABLE KEYS */;
INSERT INTO `enrollments` VALUES (1,54,6,'D'),(2,23,6,'C'),(3,36,14,'C'),(4,53,13,'B'),(5,19,4,'B'),(6,14,3,'F'),(7,31,9,'C'),(8,21,3,'D'),(9,60,3,'D'),(10,2,5,'B'),(11,52,5,'F'),(12,24,14,'B'),(13,3,14,'F'),(14,49,2,'D'),(15,35,11,'A'),(16,26,7,'D'),(17,45,11,'A'),(18,46,1,'A'),(19,54,1,'D'),(20,13,1,'F'),(21,2,6,'D'),(22,16,10,'B'),(23,37,2,'A'),(24,23,6,'B'),(25,51,2,'A'),(26,31,11,'B'),(27,30,7,'B'),(28,17,5,'B'),(29,35,1,'F'),(30,21,11,'B'),(31,23,3,'C'),(32,35,8,'B'),(33,11,6,'C'),(34,1,8,'C'),(35,2,11,'F'),(36,53,3,'B'),(37,11,1,'A'),(38,12,7,'D'),(39,58,13,'A'),(40,28,13,'A'),(41,37,14,'C'),(42,6,14,'D'),(43,61,5,'F'),(44,34,11,'D'),(45,46,9,'A'),(46,28,5,'D'),(47,44,14,'F'),(48,7,10,'A'),(49,29,4,'F'),(50,33,12,'A'),(51,29,2,'A'),(52,49,7,'C'),(53,42,11,'F'),(54,13,4,'D'),(55,9,14,'F'),(56,42,3,'C'),(57,10,11,'D'),(58,18,2,'F'),(59,16,5,'D'),(60,21,5,'C'),(61,57,8,'B'),(62,46,4,'A'),(63,47,11,'A'),(64,52,8,'A'),(65,47,14,'A'),(66,52,1,'F'),(67,28,3,'D'),(68,21,13,'A'),(69,46,8,'F'),(70,21,6,'A'),(71,15,1,'F'),(72,8,13,'D'),(73,50,4,'B'),(74,2,3,'A'),(75,35,12,'D'),(76,16,6,'F'),(77,52,14,'A'),(78,7,2,'D'),(79,22,10,'B'),(80,49,4,'F'),(81,2,3,'D'),(82,2,8,'C'),(83,36,13,'F'),(84,39,8,'A'),(85,13,8,'B'),(86,33,13,'D'),(87,2,5,'A'),(88,52,10,'B'),(89,42,6,'C'),(90,24,14,'B'),(91,12,11,'B');
/*!40000 ALTER TABLE `enrollments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `students` (
  `student_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `age` int DEFAULT NULL,
  `department_id` int DEFAULT NULL,
  PRIMARY KEY (`student_id`),
  KEY `department_id` (`department_id`),
  CONSTRAINT `students_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `departments` (`department_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (1,'Jennifer Davis',22,3),(2,'Leslie Elliott',23,2),(3,'Joel Cohen',25,5),(4,'Bryan Clark',21,4),(5,'Linda Huber',19,5),(6,'Tricia Maldonado',24,4),(7,'Jo Norris',23,2),(8,'Amy Bell',25,4),(9,'Mark Strong',19,1),(10,'Tiffany Jones',25,1),(11,'Jonathan Schmitt',19,5),(12,'Mrs. Monique Hernandez MD',18,5),(13,'Alexis Owens',22,1),(14,'Rebekah Bell',18,1),(15,'Bobby Suarez',23,1),(16,'Jared Adams',25,1),(17,'John Jackson',24,5),(18,'Lori Adams',19,1),(19,'Christine Graham',25,1),(20,'Matthew Jordan',20,5),(21,'David Coleman Jr.',19,2),(22,'Brenda Wagner',23,2),(23,'Erica Burns MD',25,5),(24,'Adam Hale',20,2),(25,'Leslie Hayes',19,3),(26,'Steve Moore',25,2),(27,'Teresa Washington',20,1),(28,'Robert Vaughan',24,5),(29,'Brian Barber',18,2),(30,'Kenneth Obrien',21,2),(31,'Olivia Kelly',20,2),(32,'Taylor Mason',22,3),(33,'Andrew Herrera',21,1),(34,'Theresa Torres',24,1),(35,'Scott Fry',25,3),(36,'Christian Jenkins',18,3),(37,'Leslie Young',24,2),(38,'John Baker',23,3),(39,'James Meadows',24,2),(40,'Chelsey Townsend',21,1),(41,'Jonathan Mcfarland',24,3),(42,'Gary Davidson',20,4),(43,'Darrell Brown',18,3),(44,'Alexis Baker',24,5),(45,'Shannon Elliott',24,2),(46,'Donald Miller',23,3),(47,'Stephanie Grant',25,2),(48,'Bonnie Harris',22,4),(49,'Karen Brown',23,1),(50,'Heather Stone',21,5),(51,'James Johnson',22,3),(52,'Mario Quinn',23,3),(53,'Eric Smith',23,1),(54,'Nathan Neal',19,3),(55,'Julian Mcmahon',18,2),(56,'Barbara Jones',23,3),(57,'Brittany Wilson',22,1),(58,'Deborah Hernandez',18,1),(59,'Kristina Lopez',19,2),(60,'Chad Moore',22,5),(61,'Lisa Alvarez',22,2);
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teachers`
--

DROP TABLE IF EXISTS `teachers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teachers` (
  `teacher_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `age` int NOT NULL,
  `salary` decimal(10,2) NOT NULL,
  `specialization` varchar(100) NOT NULL,
  PRIMARY KEY (`teacher_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teachers`
--

LOCK TABLES `teachers` WRITE;
/*!40000 ALTER TABLE `teachers` DISABLE KEYS */;
INSERT INTO `teachers` VALUES (1,'Anthony Clark',46,77065.66,'Mathematics'),(2,'James Adams MD',38,106226.37,'Computer Science'),(3,'Julie Wilson',30,99462.15,'Computer Science'),(4,'Scott Kirk DDS',59,115801.56,'English'),(5,'Michelle Ramirez',31,64647.16,'Biology'),(6,'Jessica Garcia',52,98318.38,'Physics'),(7,'Tanya Mendez',44,99749.96,'Philosophy'),(8,'Todd Morton',50,58317.18,'Physics'),(9,'Melinda Moore',40,105752.30,'History'),(10,'Teresa Garcia',45,83086.65,'Philosophy'),(11,'Gregory Crawford',32,90422.65,'Computer Science'),(12,'Cory Jordan',39,93485.97,'Mathematics'),(13,'Nichole Harrison',57,55635.31,'English');
/*!40000 ALTER TABLE `teachers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-10 21:24:14
