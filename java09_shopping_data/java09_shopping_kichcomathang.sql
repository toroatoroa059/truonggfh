-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: localhost    Database: java09_shopping
-- ------------------------------------------------------
-- Server version	8.0.23

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
-- Table structure for table `kichcomathang`
--

DROP TABLE IF EXISTS `kichcomathang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kichcomathang` (
  `MaMH` int NOT NULL,
  `KiHieu` varchar(5) NOT NULL,
  `SoLuong` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`MaMH`,`KiHieu`),
  KEY `fk_MatHang_has_KichCoMatHang_KichCoMatHang1_idx` (`KiHieu`),
  KEY `fk_MatHang_has_KichCoMatHang_MatHang1_idx` (`MaMH`),
  CONSTRAINT `fk_MatHang_has_KichCoMatHang_MatHang1` FOREIGN KEY (`MaMH`) REFERENCES `mathang` (`MaMH`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kichcomathang`
--

LOCK TABLES `kichcomathang` WRITE;
/*!40000 ALTER TABLE `kichcomathang` DISABLE KEYS */;
INSERT INTO `kichcomathang` VALUES (1,'1',80),(1,'2',46),(2,'1',98),(2,'2',120),(3,'1',360),(3,'2',22),(4,'3',236),(4,'4',36),(5,'1',85),(5,'2',43),(6,'1',26),(6,'2',36),(7,'4',25),(7,'5',78),(8,'1',400),(8,'2',23),(9,'1',90),(9,'2',100),(10,'1',120),(10,'2',236);
/*!40000 ALTER TABLE `kichcomathang` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-03-08 20:18:56
