CREATE DATABASE  IF NOT EXISTS `pratitiprojectdb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */;
USE `pratitiprojectdb`;
-- MySQL dump 10.13  Distrib 8.0.17, for Win64 (x86_64)
--
-- Host: localhost    Database: pratitiprojectdb
-- ------------------------------------------------------
-- Server version	8.0.11

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
-- Table structure for table `projectinfo`
--

DROP TABLE IF EXISTS `projectinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projectinfo` (
  `projectid` varchar(30) NOT NULL,
  `project_name` varchar(100) NOT NULL,
  `project_domain` varchar(50) NOT NULL DEFAULT '-',
  `project_status` varchar(20) NOT NULL DEFAULT 'incomplete',
  `project_deadline` date NOT NULL DEFAULT '2021-12-31',
  PRIMARY KEY (`projectid`),
  UNIQUE KEY `project_name` (`project_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projectinfo`
--

LOCK TABLES `projectinfo` WRITE;
/*!40000 ALTER TABLE `projectinfo` DISABLE KEYS */;
INSERT INTO `projectinfo` VALUES ('P-1','College inquiry Chat Bot','Data Mining','complete','2020-05-29'),('P-2','Stock Market Analysis and Prediction','Data Mining','incomplete','2020-05-28'),('P-3','Online Logistic Chat bot System','Artificial Intelligence','incomplete','2020-05-13'),('P-4','Daily Route Planner','-','complete','2020-05-30'),('P-5','Advanced Tour Guide','-','incomplete','2021-12-31'),('P-6','Read Me My Book App','Machine Learning','incomplete','2020-05-30'),('P-6152','Solar Panel Output Analyser','Android','incomplete','2020-05-31'),('P-7','Health Prediction System','Data Analysis','incomplete','2020-05-29');
/*!40000 ALTER TABLE `projectinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userlogininfo`
--

DROP TABLE IF EXISTS `userlogininfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userlogininfo` (
  `username` varchar(30) NOT NULL,
  `pwd` varchar(30) NOT NULL,
  `permission` varchar(20) NOT NULL,
  `_role` varchar(30) NOT NULL,
  `fullname` varchar(30) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userlogininfo`
--

LOCK TABLES `userlogininfo` WRITE;
/*!40000 ALTER TABLE `userlogininfo` DISABLE KEYS */;
INSERT INTO `userlogininfo` VALUES ('akash','Password@123','user','Software Developer','Akash Chaudhary'),('amit','Password@123','user','Software Developer','Amit Patil'),('ansh','Password@123','user','Software Developer','Ansh Salode'),('nikhil','Password@123','user','Software Developer','Nikhil Patil'),('pooja','Password@123','user','Software Developer','Pooja Karangale'),('prathmesh','Password@123','admin','Software Developer','Prathmesh Chopade'),('rahul','Password@123','user','Software Developer','Rahul Chintawar'),('rohit','Password@123','user','Software Developer','Rohit Yadav'),('sharvesh','Password@123','user','Software Developer','Sharvesh Chaudhary'),('shubham','Password@123','user','Software Developer','Shubham Mahajan'),('tejal','Password@123','user','Software Developer','Tejal Bhusate'),('vaibhavi','Password@123','user','Software Developer','Vaibhavi Joshi');
/*!40000 ALTER TABLE `userlogininfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userprojectmapping`
--

DROP TABLE IF EXISTS `userprojectmapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userprojectmapping` (
  `username` varchar(30) NOT NULL,
  `projectid` varchar(30) NOT NULL,
  PRIMARY KEY (`username`,`projectid`),
  KEY `projectid` (`projectid`),
  CONSTRAINT `userprojectmapping_ibfk_1` FOREIGN KEY (`username`) REFERENCES `userlogininfo` (`username`),
  CONSTRAINT `userprojectmapping_ibfk_2` FOREIGN KEY (`projectid`) REFERENCES `projectinfo` (`projectid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userprojectmapping`
--

LOCK TABLES `userprojectmapping` WRITE;
/*!40000 ALTER TABLE `userprojectmapping` DISABLE KEYS */;
INSERT INTO `userprojectmapping` VALUES ('amit','P-1'),('nikhil','P-1'),('sharvesh','P-1'),('tejal','P-1'),('ansh','P-2'),('pooja','P-2'),('rahul','P-2'),('tejal','P-2'),('vaibhavi','P-2'),('amit','P-3'),('nikhil','P-3'),('rohit','P-3'),('akash','P-4'),('nikhil','P-4'),('vaibhavi','P-4'),('rahul','P-5'),('pooja','P-6'),('rohit','P-6'),('shubham','P-6');
/*!40000 ALTER TABLE `userprojectmapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usertimeentryinfo`
--

DROP TABLE IF EXISTS `usertimeentryinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usertimeentryinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `projectid` varchar(30) NOT NULL,
  `date` datetime NOT NULL,
  `timespent` time NOT NULL,
  `task_desc` varchar(500) NOT NULL,
  `infoupdatetime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `username` (`username`),
  KEY `projectid` (`projectid`),
  CONSTRAINT `usertimeentryinfo_ibfk_1` FOREIGN KEY (`username`) REFERENCES `userlogininfo` (`username`),
  CONSTRAINT `usertimeentryinfo_ibfk_2` FOREIGN KEY (`projectid`) REFERENCES `projectinfo` (`projectid`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usertimeentryinfo`
--

LOCK TABLES `usertimeentryinfo` WRITE;
/*!40000 ALTER TABLE `usertimeentryinfo` DISABLE KEYS */;
INSERT INTO `usertimeentryinfo` VALUES (6,'amit','P-3','2020-04-18 00:00:00','08:31:00','Data analysis related to most used chatting words used is done.','2020-04-20 23:35:09'),(7,'amit','P-3','2020-04-19 00:00:00','07:29:00','Database schema is designed.','2020-04-20 23:40:55'),(8,'amit','P-3','2020-04-20 00:00:00','08:12:00','Chat bot UI front page structure design is completed.','2020-04-20 23:41:46'),(9,'ansh','P-2','2020-04-18 00:00:00','08:00:00','Stock market data analysis sdudy is done.','2020-04-20 23:43:50'),(10,'ansh','P-2','2020-04-19 00:00:00','09:00:00','Stock market value prediction algorithm is done','2020-04-20 23:45:56'),(11,'ansh','P-2','2020-04-20 00:00:00','07:10:00','front UI design is completed.','2020-04-20 23:54:03'),(15,'pooja','P-2','2020-04-18 00:00:00','08:12:00','data analysis related to stock market is done.','2020-04-21 00:24:37'),(16,'pooja','P-2','2020-04-19 00:00:00','07:03:00','database schema is designed.','2020-04-21 00:24:57'),(17,'pooja','P-2','2020-04-20 00:00:00','08:00:00','Front page UI is designed.','2020-04-21 00:25:24'),(18,'pooja','P-6','2020-04-17 00:00:00','08:30:00','Text to speech conversion language is analysed.','2020-04-21 00:31:08'),(19,'pooja','P-6','2020-04-19 00:00:00','09:21:00','text to speech conversion algorithm is done','2020-04-21 00:31:29'),(20,'pooja','P-6','2020-04-20 00:00:00','06:10:00','front page UI is dsigned','2020-04-21 00:31:49'),(21,'rohit','P-5','2020-04-18 00:00:00','08:10:00','Scope of the project related to places is done.','2020-04-21 07:27:06'),(22,'rohit','P-5','2020-04-19 00:00:00','07:00:00','database structure to store huge amount pf place information is designed.','2020-04-21 07:27:45'),(23,'rohit','P-5','2020-04-20 00:00:00','08:00:00','Front page UI is completed.','2020-04-21 07:28:13'),(26,'shubham','P-6','2020-04-18 00:00:00','08:00:00','Data related to book is collected and analysed.','2020-04-21 07:33:13'),(27,'shubham','P-6','2020-04-19 00:00:00','07:00:00','database schema is designed','2020-04-21 07:33:30'),(28,'shubham','P-6','2020-04-20 00:00:00','09:10:00','front page UI designed is completed.','2020-04-21 07:33:52'),(29,'tejal','P-2','2020-04-18 00:00:00','08:00:00','Data related to stock market is collected and analysed.','2020-04-21 07:35:17'),(30,'tejal','P-2','2020-04-19 00:00:00','07:00:00','Dtabase schema is designed.','2020-04-21 07:35:39'),(31,'vaibhavi','P-2','2020-04-18 00:00:00','09:00:00','data related to stock market is analysed.','2020-04-21 07:36:27'),(32,'vaibhavi','P-2','2020-04-19 00:00:00','07:12:00','database schema is designed.','2020-04-21 07:36:42'),(33,'vaibhavi','P-2','2020-04-20 00:00:00','09:10:00','front page UI is designed.','2020-04-21 07:37:03'),(34,'akash','P-4','2020-04-18 00:00:00','08:10:00','Daily need things list is collected.','2020-04-21 00:00:00'),(35,'akash','P-4','2020-04-19 00:00:00','07:00:00','Database design is done.','2020-04-21 00:00:00'),(36,'akash','P-4','2020-04-20 00:00:00','08:00:00','Front page UI design is completed.','2020-04-21 00:00:00'),(37,'amit','P-1','2020-04-18 00:00:00','08:21:00','Daily used chatting word collected and analysed.','2020-04-21 00:00:00'),(38,'amit','P-1','2020-04-19 00:00:00','07:10:00','Database design is done.','2020-04-21 00:00:00'),(39,'amit','P-1','2020-04-20 00:00:00','08:00:00','Front page UI design is completed.','2020-04-21 00:00:00'),(40,'nikhil','P-1','2020-04-18 00:00:00','08:00:00','Daily used chatting word collected and analysed.','2020-04-21 00:00:00'),(41,'nikhil','P-1','2020-04-19 00:00:00','07:00:00','Database design is done.','2020-04-21 00:00:00'),(42,'nikhil','P-1','2020-04-20 00:00:00','08:21:00','Front page UI design is completed.','2020-04-21 00:00:00'),(43,'nikhil','P-4','2020-04-18 00:00:00','08:10:00','Daily need things list is collected.','2020-04-21 00:00:00'),(44,'nikhil','P-4','2020-04-19 00:00:00','06:00:00','Database design is done.','2020-04-21 00:00:00'),(45,'nikhil','P-4','2020-04-20 00:00:00','08:02:00','Front page UI design is completed.','2020-04-21 00:00:00'),(46,'sharvesh','P-1','2020-04-18 00:00:00','08:10:09','Daily used chatting word collected and analysed.','2020-04-21 00:00:00'),(47,'sharvesh','P-1','2020-04-19 00:00:00','07:00:00','Database design is done.','2020-04-21 00:00:00'),(48,'sharvesh','P-1','2020-04-20 00:00:00','08:00:00','Front page UI design is completed.','2020-04-21 00:00:00'),(49,'tejal','P-1','2020-04-18 00:00:00','08:00:09','Daily used chatting word collected and analysed.','2020-04-21 00:00:00'),(50,'tejal','P-1','2020-04-19 00:00:00','07:00:00','Database design is done.','2020-04-21 00:00:00'),(52,'vaibhavi','P-4','2020-04-18 00:00:00','08:30:00','Daily need things list is collected.','2020-04-21 00:00:00'),(53,'vaibhavi','P-4','2020-04-19 00:00:00','07:10:00','Database design is done.','2020-04-21 00:00:00'),(54,'vaibhavi','P-4','2020-04-20 00:00:00','09:00:00','Front page UI design is completed.','2020-04-21 00:00:00'),(61,'tejal','P-2','2020-04-20 00:00:00','08:23:00','Ui front design is complete.','2020-04-21 14:44:25');
/*!40000 ALTER TABLE `usertimeentryinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'pratitiprojectdb'
--

--
-- Dumping routines for database 'pratitiprojectdb'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-04-21 16:59:33
