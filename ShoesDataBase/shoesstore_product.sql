CREATE DATABASE  IF NOT EXISTS `shoesstore` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `shoesstore`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: shoesstore
-- ------------------------------------------------------
-- Server version	8.0.37

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
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `product_code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `quantity` int NOT NULL,
  PRIMARY KEY (`product_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES ('S0001','Adidas X_PLR PHASE',120.00,10),('S0002','Adidas ULTRABOOST',130.38,5),('S0003','Adidas  SUPERNOVA STRIDE',80.00,20),('S0004','Adidas ULTRABOOST LIGHT',60.00,15),('S0005','Adidas DURAMO SPEED',62.67,6),('S0006','Adidas GALAXY 6',50.13,8),('S0007','Adidas DURAMO 10',50.13,24),('S0008','Adidas RACER TR23',53.26,12),('S0009','Adidas PUREBOOST 23',86.49,35),('S0010','Adidas DURAMO SPEED',62.67,63),('S0011','Adidas SUPERNOVA RISE',84.61,12),('S0012','Adidas X_PLR BOOST',115.96,53),('S0013','Adidas RUNFALCON 3.0',50.13,22),('S0014','Adidas CORERACER',45.74,14),('S0015','Adidas RUN 70S',53.26,22),('S0016','Adidas ALPHABOUNCE+',62.67,33),('S0017','Adidas ADIZERO SL',75.21,73),('S0018','Adidas ALPHABOOST V1',86.49,9),('S0019','Adidas QUESTAR',62.67,7),('S0020','Adidas ADIZERO AVANTI',134.49,6),('S0021','Nike Jordan Stay Loyal 3',90.20,35),('S0022','Nike Air Force 1 \'07',112.79,21),('S0023','Nike Air Jordan 1',119.05,11),('S0024','Nike Air Max Ishod',97.12,94),('S0025','Nike  P-6000',97.12,57),('S0026','Nike Air Force 1 \'07 Fresh',125.32,23),('S0027','Nike Air Jordan 4 Retro \"Industrial Blue\"',225.58,74),('S0028','Nike Zoom Vomero 5',153.52,38),('S0029','Nike Killshot 2',106.52,42),('S0030','Nike Air Force 1 \'07',112.79,21),('S0031','Nike Court Vision',62.63,86),('S0032','Nike Luka 3 PF \"Speedway\"',125.32,36),('S0033','Nike Zoom Vomero 5',125.32,72),('S0034','Nike Vaporfly 3',238.11,23),('S0035','Nike ACG Rufus',112.79,45),('S0036','Nike Giannis Immortality 4 EP',78.32,67),('S0037','Nike Juniper Trail 2 GORE-TEX',119.05,42),('S0038','Nike Tatum 2 PF \"Red Cement\"',125.32,21),('S0039','Nike Calm',84.59,12),('S0040','Nike Pegasus 41 Electric',134.72,34),('S0041','Nike Asuna 3',50.13,23);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-27 10:08:32
