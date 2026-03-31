mysqldump: [Warning] Using a password on the command line interface can be insecure.
-- MySQL dump 10.13  Distrib 9.2.0, for Linux (x86_64)
--
-- Host: localhost    Database: DON_DAT_HANG
-- ------------------------------------------------------
-- Server version	9.2.0

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
-- Table structure for table `CT_DonHang`
--

DROP TABLE IF EXISTS `CT_DonHang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CT_DonHang` (
  `SoDH` int NOT NULL,
  `MaHang` int NOT NULL,
  `SoLuongDat` int NOT NULL,
  PRIMARY KEY (`SoDH`,`MaHang`),
  KEY `fk_ctdh_hh` (`MaHang`),
  CONSTRAINT `fk_ctdh_dh` FOREIGN KEY (`SoDH`) REFERENCES `DonDatHang` (`SoDH`) ON DELETE CASCADE,
  CONSTRAINT `fk_ctdh_hh` FOREIGN KEY (`MaHang`) REFERENCES `HangHoa` (`MaHang`),
  CONSTRAINT `CT_DonHang_chk_1` CHECK ((`SoLuongDat` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CT_DonHang`
--

LOCK TABLES `CT_DonHang` WRITE;
/*!40000 ALTER TABLE `CT_DonHang` DISABLE KEYS */;
/*!40000 ALTER TABLE `CT_DonHang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CT_PhieuGiao`
--

DROP TABLE IF EXISTS `CT_PhieuGiao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CT_PhieuGiao` (
  `SoPG` int NOT NULL,
  `MaHang` int NOT NULL,
  `SoLuongGiao` int NOT NULL,
  `DonGia` decimal(15,2) NOT NULL,
  PRIMARY KEY (`SoPG`,`MaHang`),
  KEY `fk_ctpg_hh` (`MaHang`),
  CONSTRAINT `fk_ctpg_hh` FOREIGN KEY (`MaHang`) REFERENCES `HangHoa` (`MaHang`),
  CONSTRAINT `fk_ctpg_pg` FOREIGN KEY (`SoPG`) REFERENCES `PhieuGiaoHang` (`SoPG`) ON DELETE CASCADE,
  CONSTRAINT `CT_PhieuGiao_chk_1` CHECK ((`SoLuongGiao` > 0)),
  CONSTRAINT `CT_PhieuGiao_chk_2` CHECK ((`DonGia` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CT_PhieuGiao`
--

LOCK TABLES `CT_PhieuGiao` WRITE;
/*!40000 ALTER TABLE `CT_PhieuGiao` DISABLE KEYS */;
/*!40000 ALTER TABLE `CT_PhieuGiao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DonDatHang`
--

DROP TABLE IF EXISTS `DonDatHang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DonDatHang` (
  `SoDH` int NOT NULL AUTO_INCREMENT,
  `NgayDat` date NOT NULL,
  `HoTenND` varchar(100) DEFAULT NULL,
  `MaKH` int DEFAULT NULL,
  PRIMARY KEY (`SoDH`),
  KEY `fk_dh_kh` (`MaKH`),
  CONSTRAINT `fk_dh_kh` FOREIGN KEY (`MaKH`) REFERENCES `KhachHang` (`MaKH`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DonDatHang`
--

LOCK TABLES `DonDatHang` WRITE;
/*!40000 ALTER TABLE `DonDatHang` DISABLE KEYS */;
/*!40000 ALTER TABLE `DonDatHang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `HangHoa`
--

DROP TABLE IF EXISTS `HangHoa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `HangHoa` (
  `MaHang` int NOT NULL AUTO_INCREMENT,
  `TenHang` varchar(255) NOT NULL,
  `MoTa` text,
  `DvTinh` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`MaHang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HangHoa`
--

LOCK TABLES `HangHoa` WRITE;
/*!40000 ALTER TABLE `HangHoa` DISABLE KEYS */;
/*!40000 ALTER TABLE `HangHoa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `KhachHang`
--

DROP TABLE IF EXISTS `KhachHang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `KhachHang` (
  `MaKH` int NOT NULL AUTO_INCREMENT,
  `TenDV` varchar(255) NOT NULL,
  `DiaChi` varchar(255) DEFAULT NULL,
  `DienThoai` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`MaKH`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `KhachHang`
--

LOCK TABLES `KhachHang` WRITE;
/*!40000 ALTER TABLE `KhachHang` DISABLE KEYS */;
/*!40000 ALTER TABLE `KhachHang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `NguoiGiaoHang`
--

DROP TABLE IF EXISTS `NguoiGiaoHang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `NguoiGiaoHang` (
  `MaNG` int NOT NULL AUTO_INCREMENT,
  `HoTenNG` varchar(100) NOT NULL,
  `DienThoaiNG` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`MaNG`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `NguoiGiaoHang`
--

LOCK TABLES `NguoiGiaoHang` WRITE;
/*!40000 ALTER TABLE `NguoiGiaoHang` DISABLE KEYS */;
/*!40000 ALTER TABLE `NguoiGiaoHang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PhieuGiaoHang`
--

DROP TABLE IF EXISTS `PhieuGiaoHang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PhieuGiaoHang` (
  `SoPG` int NOT NULL AUTO_INCREMENT,
  `NgayGiao` date NOT NULL,
  `TenNoiGH` varchar(255) DEFAULT NULL,
  `HoTenNN` varchar(100) DEFAULT NULL,
  `SoDH` int DEFAULT NULL,
  `MaNG` int DEFAULT NULL,
  PRIMARY KEY (`SoPG`),
  KEY `fk_pg_dh` (`SoDH`),
  KEY `fk_pg_ng` (`MaNG`),
  CONSTRAINT `fk_pg_dh` FOREIGN KEY (`SoDH`) REFERENCES `DonDatHang` (`SoDH`),
  CONSTRAINT `fk_pg_ng` FOREIGN KEY (`MaNG`) REFERENCES `NguoiGiaoHang` (`MaNG`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PhieuGiaoHang`
--

LOCK TABLES `PhieuGiaoHang` WRITE;
/*!40000 ALTER TABLE `PhieuGiaoHang` DISABLE KEYS */;
/*!40000 ALTER TABLE `PhieuGiaoHang` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-03-31  7:59:24
