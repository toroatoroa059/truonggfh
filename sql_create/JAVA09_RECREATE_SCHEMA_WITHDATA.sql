-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: localhost    Database: java09_shopping
-- ------------------------------------------------------
-- Server version	8.0.18

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
-- Table structure for table `chitietdonhang`
--

CREATE SCHEMA java09_shopping DEFAULT CHAR SET UTF8MB4;

USE java09_shopping;



DROP TABLE IF EXISTS `chitietdonhang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chitietdonhang` (
  `MaDH` int(11) NOT NULL,
  `MaMH` int(11) NOT NULL,
  `SoLuong` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`MaDH`,`MaMH`),
  KEY `fk_DonHang_has_MatHang_MatHang1_idx` (`MaMH`),
  KEY `fk_DonHang_has_MatHang_DonHang1_idx` (`MaDH`),
  CONSTRAINT `fk_DonHang_has_MatHang_DonHang1` FOREIGN KEY (`MaDH`) REFERENCES `donhang` (`MaDH`),
  CONSTRAINT `fk_DonHang_has_MatHang_MatHang1` FOREIGN KEY (`MaMH`) REFERENCES `mathang` (`MaMH`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chitietdonhang`
--

LOCK TABLES `chitietdonhang` WRITE;
/*!40000 ALTER TABLE `chitietdonhang` DISABLE KEYS */;
INSERT INTO `chitietdonhang` VALUES (1,1,'1'),(1,3,'2'),(1,4,'1'),(2,6,'2'),(2,8,'2'),(3,1,'4'),(3,2,'2');
/*!40000 ALTER TABLE `chitietdonhang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chitietttdh`
--

DROP TABLE IF EXISTS `chitietttdh`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chitietttdh` (
  `MaDH` int(11) NOT NULL,
  `MaTTDH` int(11) NOT NULL,
  `MaNV` int(11) NOT NULL,
  `ThoiGian` datetime NOT NULL,
  PRIMARY KEY (`MaDH`,`MaTTDH`),
  KEY `fk_DonHang_has_TinhTrangDonHang_TinhTrangDonHang1_idx` (`MaTTDH`),
  KEY `fk_DonHang_has_TinhTrangDonHang_DonHang1_idx` (`MaDH`),
  KEY `FK_NhanVien_ChiTietTTDH_idx` (`MaNV`),
  CONSTRAINT `FK_NhanVien_ChiTietTTDH` FOREIGN KEY (`MaNV`) REFERENCES `nhanvien` (`MaNV`),
  CONSTRAINT `fk_DonHang_has_TinhTrangDonHang_DonHang1` FOREIGN KEY (`MaDH`) REFERENCES `donhang` (`MaDH`),
  CONSTRAINT `fk_DonHang_has_TinhTrangDonHang_TinhTrangDonHang1` FOREIGN KEY (`MaTTDH`) REFERENCES `tinhtrangdonhang` (`MaTTDH`)
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

--
-- Table structure for table `donhang`
--

DROP TABLE IF EXISTS `donhang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `donhang` (
  `MaDH` int(11) NOT NULL,
  `DiaChiGiaoHang` text NOT NULL,
  `SDTNguoiNhan` varchar(255) NOT NULL,
  `PhiVanChuyen` double NOT NULL DEFAULT '0',
  `NgayTao` datetime NOT NULL,
  `TongTien` double NOT NULL,
  `MaKH` int(11) NOT NULL,
  `MaNV` int(11) NOT NULL,
  PRIMARY KEY (`MaDH`),
  KEY `fk_DonHang_KhachHang1_idx` (`MaKH`),
  KEY `fk_DonHang_NhanVien1_idx` (`MaNV`),
  CONSTRAINT `fk_DonHang_KhachHang1` FOREIGN KEY (`MaKH`) REFERENCES `khachhang` (`MaKH`),
  CONSTRAINT `fk_DonHang_NhanVien1` FOREIGN KEY (`MaNV`) REFERENCES `nhanvien` (`MaNV`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `donhang`
--

LOCK TABLES `donhang` WRITE;
/*!40000 ALTER TABLE `donhang` DISABLE KEYS */;
INSERT INTO `donhang` VALUES (1,'Âu Cơ - Hòa Khánh','034 767 2514',20,'2020-12-18 16:33:20',0,1,1),(2,'Nam Cao - Hòa Khánh','034 167 2514',50,'2020-12-18 20:12:44',0,2,2),(3,'Phan Chu Trinh - Hải Châu','034 267 2514',0,'2020-12-17 18:19:24',0,3,1),(4,'Lê Lai - Hải Châu','034 367 2514',120,'2021-01-05 21:07:53',0,3,2);
/*!40000 ALTER TABLE `donhang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hoadon`
--

DROP TABLE IF EXISTS `hoadon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hoadon` (
  `MaHD` int(11) NOT NULL,
  `MaDH` int(11) NOT NULL,
  `SoTienCanThanhToan` double NOT NULL DEFAULT '0',
  `NgayXuat` datetime NOT NULL,
  PRIMARY KEY (`MaHD`),
  UNIQUE KEY `MaDH_UNIQUE` (`MaDH`),
  KEY `fk_HoaDon_DonHang1_idx` (`MaDH`),
  CONSTRAINT `fk_HoaDon_DonHang1` FOREIGN KEY (`MaDH`) REFERENCES `donhang` (`MaDH`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hoadon`
--

LOCK TABLES `hoadon` WRITE;
/*!40000 ALTER TABLE `hoadon` DISABLE KEYS */;
/*!40000 ALTER TABLE `hoadon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `khachhang`
--

DROP TABLE IF EXISTS `khachhang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `khachhang` (
  `MaKH` int(11) NOT NULL,
  `TenKH` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `DiaChi` text NOT NULL,
  `SoDienThoai` varchar(255) NOT NULL,
  `MangXaHoi` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`MaKH`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `khachhang`
--

LOCK TABLES `khachhang` WRITE;
/*!40000 ALTER TABLE `khachhang` DISABLE KEYS */;
INSERT INTO `khachhang` VALUES (1,'Lê Văn Khách','defaul.com.tp@gmail.com','Nam Cao - Hòa Khánh - Đà nẵng','0936 126 363','nf'),(2,'Hoàng Văn Nam','defaul.com.tp@gmail.com','Phan Chu Trinh - Hải Châu 1 - Đà nẵng','036 126 363','nf'),(3,'Nguyễn Nam Bằng','defaul.com.tp@gmail.com','Phan Chu Trinh - Hải Châu 1 - Đà nẵng','097 126 363','nf');
/*!40000 ALTER TABLE `khachhang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kichco`
--

DROP TABLE IF EXISTS `kichco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kichco` (
  `KiHieu` int(11) NOT NULL,
  `MoTa` text NOT NULL,
  PRIMARY KEY (`KiHieu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kichco`
--

LOCK TABLES `kichco` WRITE;
/*!40000 ALTER TABLE `kichco` DISABLE KEYS */;
INSERT INTO `kichco` VALUES (1,'S - Nam Nữ 21 - 30KG'),(2,'M - Nam Nữ 31 - 40KG'),(3,'L - Nam Nữ 41 - 50KG'),(4,'XL - Nam Nữ 51 - 60KG'),(5,'XXL - Nam Nữ 61 - 70KG');
/*!40000 ALTER TABLE `kichco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kichcomathang`
--

DROP TABLE IF EXISTS `kichcomathang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kichcomathang` (
  `MaMH` int(11) NOT NULL,
  `KiHieu` varchar(5) NOT NULL,
  `SoLuong` int(11) NOT NULL DEFAULT '0',
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

--
-- Table structure for table `loaihang`
--

DROP TABLE IF EXISTS `loaihang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loaihang` (
  `MaLoai` int(11) NOT NULL,
  `TenLoai` varchar(255) NOT NULL,
  PRIMARY KEY (`MaLoai`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loaihang`
--

LOCK TABLES `loaihang` WRITE;
/*!40000 ALTER TABLE `loaihang` DISABLE KEYS */;
INSERT INTO `loaihang` VALUES (1,'Áo'),(2,'Quần'),(3,'Giày dép'),(4,'Thắt lưng'),(5,'Mũ');
/*!40000 ALTER TABLE `loaihang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mathang`
--

DROP TABLE IF EXISTS `mathang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mathang` (
  `MaMH` int(11) NOT NULL,
  `TenMH` varchar(255) NOT NULL,
  `MauSac` varchar(255) NOT NULL,
  `ChatLieu` varchar(255) NOT NULL,
  `GiaBan` double NOT NULL,
  `GiaMua` double NOT NULL,
  `HinhAnh` text,
  `MaLoai` int(11) NOT NULL,
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

--
-- Table structure for table `nhanvien`
--

DROP TABLE IF EXISTS `nhanvien`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nhanvien` (
  `MaNV` int(11) NOT NULL,
  `TenNV` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `DiaChi` text NOT NULL,
  `SoDienThoai` varchar(255) NOT NULL,
  PRIMARY KEY (`MaNV`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nhanvien`
--

LOCK TABLES `nhanvien` WRITE;
/*!40000 ALTER TABLE `nhanvien` DISABLE KEYS */;
INSERT INTO `nhanvien` VALUES (1,'Lê Tèo','com.default.tp@gmail.com','Nam Cao - Hòa Khánh - Đà Nẵng','0936 978 033'),(2,'Lê Na','com.default.tp@gmail.com','Âu Cơ - Hòa Khánh - Đà Nẵng','0936 978 033'),(3,'Hoàng Bửi','com.default.tp@gmail.com','Nam Cao - Hòa Khánh - Đà Nẵng','0936 978 033'),(4,'Ngọc Thành','com.default.tp@gmail.com','Lê Độ - Hòa Khánh - Đà Nẵng','0936 978 033'),(5,'Công Danh','com.default.tp@gmail.com','Nam Cao - Hòa Khánh - Đà Nẵng','0936 978 033');
/*!40000 ALTER TABLE `nhanvien` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tinhtrangdonhang`
--

DROP TABLE IF EXISTS `tinhtrangdonhang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tinhtrangdonhang` (
  `MaTTDH` int(11) NOT NULL,
  `MoTa` text NOT NULL,
  PRIMARY KEY (`MaTTDH`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tinhtrangdonhang`
--

LOCK TABLES `tinhtrangdonhang` WRITE;
/*!40000 ALTER TABLE `tinhtrangdonhang` DISABLE KEYS */;
INSERT INTO `tinhtrangdonhang` VALUES (1,'Yêu cầu đặt hàng'),(2,'Đặt hàng thành công'),(3,'Đang đóng gói'),(4,'Đang vận chuyển'),(5,'Giao hàng thành công');
/*!40000 ALTER TABLE `tinhtrangdonhang` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-03-08 17:12:14
