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
-- Table structure for table `mathang`
--

DROP TABLE IF EXISTS `mathang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mathang` (
  `MaMH` int NOT NULL,
  `TenMH` varchar(255) NOT NULL,
  `MauSac` varchar(255) NOT NULL,
  `ChatLieu` varchar(255) NOT NULL,
  `GiaBan` double NOT NULL,
  `GiaMua` double NOT NULL,
  `HinhAnh` text,
  `MaLoai` int NOT NULL,
  PRIMARY KEY (`MaMH`),
  KEY `fk_MatHang_LoaiHang_idx` (`MaLoai`),
  CONSTRAINT `fk_MatHang_LoaiHang` FOREIGN KEY (`MaLoai`) REFERENCES `loaihang` (`MaLoai`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mathang`
--

LOCK TABLES `mathang` WRITE;
/*!40000 ALTER TABLE `mathang` DISABLE KEYS */;
INSERT INTO `mathang` VALUES (1,'Áo sơ mi Nam','Trắng','UD',80,160,'ud.png',1),(2,'Áo sơ mi Nữ','Hồng','UD',94,220,'ud.png',1),(3,'Quần tây Nam','Xanh','UD',300,800,'ud.png',2),(4,'Quần jean Nam','Nâu','UD',220,600,'ud.png',2),(5,'Quần jean Nữ','Trắng','UD',140,280,'ud.png',2),(6,'Giày da Nam','Đen','UD',220,750,'ud.png',3),(7,'Giày thể thao Nữ','Vàng','UD',240,780,'ud.png',3),(8,'Thắt lưng Nam','Hồng','UD',40,260,'ud.png',4),(9,'Thắt lưng Nữ','Xanh','UD',42,220,'ud.png',4),(10,'Mũ thể thao Nam','Trắng','UD',180,260,'ud.png',5);
/*!40000 ALTER TABLE `mathang` ENABLE KEYS */;
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
