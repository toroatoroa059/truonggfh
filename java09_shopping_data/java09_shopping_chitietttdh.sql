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
-- Table structure for table `chitietttdh`
--

DROP TABLE IF EXISTS `chitietttdh`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chitietttdh` (
  `MaDH` int NOT NULL,
  `MaTTDH` int NOT NULL,
  `MaNV` int NOT NULL,
  `ThoiGian` datetime NOT NULL,
  PRIMARY KEY (`MaDH`,`MaTTDH`),
  KEY `fk_DonHang_has_TinhTrangDonHang_TinhTrangDonHang1_idx` (`MaTTDH`),
  KEY `fk_DonHang_has_TinhTrangDonHang_DonHang1_idx` (`MaDH`),
  KEY `FK_NhanVien_ChiTietTTDH_idx` (`MaNV`),
  CONSTRAINT `fk_DonHang_has_TinhTrangDonHang_DonHang1` FOREIGN KEY (`MaDH`) REFERENCES `donhang` (`MaDH`),
  CONSTRAINT `fk_DonHang_has_TinhTrangDonHang_TinhTrangDonHang1` FOREIGN KEY (`MaTTDH`) REFERENCES `tinhtrangdonhang` (`MaTTDH`),
  CONSTRAINT `FK_NhanVien_ChiTietTTDH` FOREIGN KEY (`MaNV`) REFERENCES `nhanvien` (`MaNV`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chitietttdh`
--

LOCK TABLES `chitietttdh` WRITE;
/*!40000 ALTER TABLE `chitietttdh` DISABLE KEYS */;
INSERT INTO `chitietttdh` VALUES (1,3,2,'2020-12-14 18:20:20'),(1,4,2,'2020-12-15 18:20:20'),(1,5,2,'2020-12-16 18:20:20'),(2,3,2,'2020-12-14 18:20:20'),(2,4,2,'2020-12-15 18:20:20'),(2,5,2,'2020-12-16 18:20:20'),(3,3,2,'2020-12-14 18:20:20'),(3,4,2,'2020-12-15 18:20:20'),(3,5,2,'2020-12-16 18:20:20');
/*!40000 ALTER TABLE `chitietttdh` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-03-08 20:18:57
