-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: threat_iocs
-- ------------------------------------------------------
-- Server version	9.0.1

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
-- Table structure for table `iocs`
--

DROP TABLE IF EXISTS `iocs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `iocs` (
  `ioc_id` int NOT NULL AUTO_INCREMENT,
  `ioc_type` varchar(50) NOT NULL,
  `indicator` varchar(255) NOT NULL,
  `description` text,
  `confidence` tinyint DEFAULT NULL,
  `first_seen` date DEFAULT NULL,
  `last_seen` date DEFAULT NULL,
  PRIMARY KEY (`ioc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `iocs`
--

LOCK TABLES `iocs` WRITE;
/*!40000 ALTER TABLE `iocs` DISABLE KEYS */;
INSERT INTO `iocs` VALUES (1,'hash','e61ec62c05f24d878432305d47cf1a72','STRATT malware hash',90,'2024-08-10','2024-08-10'),(2,'hash','804ec801d0a79815e32834b36edfc65b','STRATT malware hash',90,'2024-08-10','2024-08-10'),(3,'hash','3d6c063d9183feff60847c81ca1f4e26','STRATT malware hash',90,'2024-08-10','2024-08-10'),(4,'hash','d28e484be0922fce5018edc36e4e7c7b','STRATT malware hash',90,'2024-08-10','2024-08-10'),(5,'hash','df70f0abbbf32f86ff5e2426e5c89463','STRATT malware hash',90,'2024-08-10','2024-08-10'),(6,'hash','6c6b4b50258f73741044e91698ff2254','STRATT malware hash',90,'2024-08-10','2024-08-10');
/*!40000 ALTER TABLE `iocs` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-11 19:35:03
