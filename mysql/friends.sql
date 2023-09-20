-- MySQL dump 10.13  Distrib 8.0.34, for Linux (x86_64)
--
-- Host: localhost    Database: Друзья человека
-- ------------------------------------------------------
-- Server version	8.0.34

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Вьючные животные`
--

DROP TABLE IF EXISTS `Вьючные животные`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Вьючные животные` (
  `id` int NOT NULL AUTO_INCREMENT,
  `animal` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Вьючные животные`
--

LOCK TABLES `Вьючные животные` WRITE;
/*!40000 ALTER TABLE `Вьючные животные` DISABLE KEYS */;
INSERT INTO `Вьючные животные` VALUES (1,'лошадь'),(2,'верблюд'),(3,'осел');
/*!40000 ALTER TABLE `Вьючные животные` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Домашние животные`
--

DROP TABLE IF EXISTS `Домашние животные`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Домашние животные` (
  `id` int NOT NULL AUTO_INCREMENT,
  `animal` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Домашние животные`
--

LOCK TABLES `Домашние животные` WRITE;
/*!40000 ALTER TABLE `Домашние животные` DISABLE KEYS */;
INSERT INTO `Домашние животные` VALUES (1,'собака'),(2,'кошка'),(3,'хомяк');
/*!40000 ALTER TABLE `Домашние животные` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Команды`
--

DROP TABLE IF EXISTS `Команды`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Команды` (
  `id` int NOT NULL AUTO_INCREMENT,
  `command` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Команды`
--

LOCK TABLES `Команды` WRITE;
/*!40000 ALTER TABLE `Команды` DISABLE KEYS */;
INSERT INTO `Команды` VALUES (1,'сидеть'),(2,'стоять'),(3,'лежать'),(4,'беги'),(5,'иди'),(6,'прыгай'),(7,'танцуй'),(8,'лапу'),(9,'фас'),(10,'голос'),(11,'ищи'),(12,'плюй');
/*!40000 ALTER TABLE `Команды` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `верблюды`
--

DROP TABLE IF EXISTS `верблюды`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `верблюды` (
  `id` int NOT NULL AUTO_INCREMENT,
  `animal_id` int DEFAULT NULL,
  `birth` date DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `command_list` text,
  PRIMARY KEY (`id`),
  KEY `animal_id` (`animal_id`),
  CONSTRAINT `верблюды_ibfk_1` FOREIGN KEY (`animal_id`) REFERENCES `Вьючные животные` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `верблюды`
--

LOCK TABLES `верблюды` WRITE;
/*!40000 ALTER TABLE `верблюды` DISABLE KEYS */;
/*!40000 ALTER TABLE `верблюды` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `кошки`
--

DROP TABLE IF EXISTS `кошки`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `кошки` (
  `id` int NOT NULL AUTO_INCREMENT,
  `animal_id` int DEFAULT NULL,
  `birth` date DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `command_list` text,
  PRIMARY KEY (`id`),
  KEY `animal_id` (`animal_id`),
  CONSTRAINT `кошки_ibfk_1` FOREIGN KEY (`animal_id`) REFERENCES `Домашние животные` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `кошки`
--

LOCK TABLES `кошки` WRITE;
/*!40000 ALTER TABLE `кошки` DISABLE KEYS */;
INSERT INTO `кошки` VALUES (1,2,'2018-05-20','Мурка','1 2 3 4 5 6 7 8 10 11'),(2,2,'2019-12-10','Васька','1 2 3 4 5 6 8 10 11');
/*!40000 ALTER TABLE `кошки` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `молодые животные`
--

DROP TABLE IF EXISTS `молодые животные`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `молодые животные` (
  `id` int NOT NULL AUTO_INCREMENT,
  `animal_id` int DEFAULT NULL,
  `birth` date DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `age_months` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `animal_id` (`animal_id`),
  CONSTRAINT `молодые животные_ibfk_1` FOREIGN KEY (`animal_id`) REFERENCES `Домашние животные` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `молодые животные`
--

LOCK TABLES `молодые животные` WRITE;
/*!40000 ALTER TABLE `молодые животные` DISABLE KEYS */;
INSERT INTO `молодые животные` VALUES (1,2,'2020-11-15','Оля',34);
/*!40000 ALTER TABLE `молодые животные` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `непарнокопытные`
--

DROP TABLE IF EXISTS `непарнокопытные`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `непарнокопытные` (
  `id` int NOT NULL DEFAULT '0',
  `animal_id` int DEFAULT NULL,
  `birth` date DEFAULT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `command_list` mediumtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `непарнокопытные`
--

LOCK TABLES `непарнокопытные` WRITE;
/*!40000 ALTER TABLE `непарнокопытные` DISABLE KEYS */;
INSERT INTO `непарнокопытные` VALUES (1,1,'2015-07-10','Буцефал','1 2 3 4 5 6 7 8 10'),(2,1,'2016-04-22','Рокки','1 2 4 5 6 8 10'),(1,3,'2019-04-30','Оскар','1 2 3 4 5 6 7 8 10'),(2,3,'2020-11-15','Оля','1 2 3 4 5 6 8 10');
/*!40000 ALTER TABLE `непарнокопытные` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `собаки`
--

DROP TABLE IF EXISTS `собаки`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `собаки` (
  `id` int NOT NULL AUTO_INCREMENT,
  `animal_id` int DEFAULT NULL,
  `birth` date DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `command_list` text,
  PRIMARY KEY (`id`),
  KEY `animal_id` (`animal_id`),
  CONSTRAINT `собаки_ibfk_1` FOREIGN KEY (`animal_id`) REFERENCES `Домашние животные` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `собаки`
--

LOCK TABLES `собаки` WRITE;
/*!40000 ALTER TABLE `собаки` DISABLE KEYS */;
INSERT INTO `собаки` VALUES (1,1,'2019-08-01','Рекс','1 2 3 4 5 6 7 8 9 10 11'),(2,1,'2020-03-15','Белла','1 2 3 4 5 6 7 8 9 10 11');
/*!40000 ALTER TABLE `собаки` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `хомяки`
--

DROP TABLE IF EXISTS `хомяки`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `хомяки` (
  `id` int NOT NULL AUTO_INCREMENT,
  `animal_id` int DEFAULT NULL,
  `birth` date DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `command_list` text,
  PRIMARY KEY (`id`),
  KEY `animal_id` (`animal_id`),
  CONSTRAINT `хомяки_ibfk_1` FOREIGN KEY (`animal_id`) REFERENCES `Домашние животные` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `хомяки`
--

LOCK TABLES `хомяки` WRITE;
/*!40000 ALTER TABLE `хомяки` DISABLE KEYS */;
INSERT INTO `хомяки` VALUES (1,3,'2022-02-05','Харри','1 2 3 4 5 6 7');
/*!40000 ALTER TABLE `хомяки` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-19 14:21:40
