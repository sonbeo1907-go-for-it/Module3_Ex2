mysqldump: [Warning] Using a password on the command line interface can be insecure.
-- MySQL dump 10.13  Distrib 9.2.0, for Linux (x86_64)
--
-- Host: localhost    Database: CCVatTu
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
-- Table structure for table `CTDONDH`
--

DROP TABLE IF EXISTS `CTDONDH`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CTDONDH` (
  `SoDH` char(4) NOT NULL,
  `MaVTU` char(4) NOT NULL,
  PRIMARY KEY (`SoDH`,`MaVTU`),
  KEY `fk_ctd_vt` (`MaVTU`),
  CONSTRAINT `fk_ctd_dh` FOREIGN KEY (`SoDH`) REFERENCES `DONDH` (`SoDH`) ON DELETE CASCADE,
  CONSTRAINT `fk_ctd_vt` FOREIGN KEY (`MaVTU`) REFERENCES `VATTU` (`MaVTU`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CTDONDH`
--

LOCK TABLES `CTDONDH` WRITE;
/*!40000 ALTER TABLE `CTDONDH` DISABLE KEYS */;
/*!40000 ALTER TABLE `CTDONDH` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CTPHIEUNHAP`
--

DROP TABLE IF EXISTS `CTPHIEUNHAP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CTPHIEUNHAP` (
  `SoPN` char(4) NOT NULL,
  `MaVTU` char(4) NOT NULL,
  `DGNhap` decimal(15,2) NOT NULL,
  `SLNhap` int NOT NULL,
  PRIMARY KEY (`SoPN`,`MaVTU`),
  KEY `fk_ctn_vt` (`MaVTU`),
  CONSTRAINT `fk_ctn_pn` FOREIGN KEY (`SoPN`) REFERENCES `PHIEUNHAP` (`SoPN`) ON DELETE CASCADE,
  CONSTRAINT `fk_ctn_vt` FOREIGN KEY (`MaVTU`) REFERENCES `VATTU` (`MaVTU`),
  CONSTRAINT `CTPHIEUNHAP_chk_1` CHECK ((`DGNhap` > 0)),
  CONSTRAINT `CTPHIEUNHAP_chk_2` CHECK ((`SLNhap` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CTPHIEUNHAP`
--

LOCK TABLES `CTPHIEUNHAP` WRITE;
/*!40000 ALTER TABLE `CTPHIEUNHAP` DISABLE KEYS */;
/*!40000 ALTER TABLE `CTPHIEUNHAP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CTPHIEUXUAT`
--

DROP TABLE IF EXISTS `CTPHIEUXUAT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CTPHIEUXUAT` (
  `SoPX` char(4) NOT NULL,
  `MaVTU` char(4) NOT NULL,
  `DGXuat` decimal(15,2) NOT NULL,
  `SLXuat` int NOT NULL,
  PRIMARY KEY (`SoPX`,`MaVTU`),
  KEY `fk_ctx_vt` (`MaVTU`),
  CONSTRAINT `fk_ctx_px` FOREIGN KEY (`SoPX`) REFERENCES `PHIEUXUAT` (`SoPX`) ON DELETE CASCADE,
  CONSTRAINT `fk_ctx_vt` FOREIGN KEY (`MaVTU`) REFERENCES `VATTU` (`MaVTU`),
  CONSTRAINT `CTPHIEUXUAT_chk_1` CHECK ((`DGXuat` > 0)),
  CONSTRAINT `CTPHIEUXUAT_chk_2` CHECK ((`SLXuat` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CTPHIEUXUAT`
--

LOCK TABLES `CTPHIEUXUAT` WRITE;
/*!40000 ALTER TABLE `CTPHIEUXUAT` DISABLE KEYS */;
/*!40000 ALTER TABLE `CTPHIEUXUAT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DONDH`
--

DROP TABLE IF EXISTS `DONDH`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DONDH` (
  `SoDH` char(4) NOT NULL,
  `NgayDH` date NOT NULL,
  `MaNCC` char(3) DEFAULT NULL,
  PRIMARY KEY (`SoDH`),
  KEY `fk_don_ncc` (`MaNCC`),
  CONSTRAINT `fk_don_ncc` FOREIGN KEY (`MaNCC`) REFERENCES `NHACC` (`MaNCC`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DONDH`
--

LOCK TABLES `DONDH` WRITE;
/*!40000 ALTER TABLE `DONDH` DISABLE KEYS */;
/*!40000 ALTER TABLE `DONDH` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `NHACC`
--

DROP TABLE IF EXISTS `NHACC`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `NHACC` (
  `MaNCC` char(3) NOT NULL,
  `TenNCC` varchar(100) NOT NULL,
  `DiaChi` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`MaNCC`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `NHACC`
--

LOCK TABLES `NHACC` WRITE;
/*!40000 ALTER TABLE `NHACC` DISABLE KEYS */;
/*!40000 ALTER TABLE `NHACC` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `NHACC_SDT`
--

DROP TABLE IF EXISTS `NHACC_SDT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `NHACC_SDT` (
  `MaNCC` char(3) NOT NULL,
  `SDT` varchar(15) NOT NULL,
  PRIMARY KEY (`MaNCC`,`SDT`),
  CONSTRAINT `fk_sdt_ncc` FOREIGN KEY (`MaNCC`) REFERENCES `NHACC` (`MaNCC`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `NHACC_SDT`
--

LOCK TABLES `NHACC_SDT` WRITE;
/*!40000 ALTER TABLE `NHACC_SDT` DISABLE KEYS */;
/*!40000 ALTER TABLE `NHACC_SDT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PHIEUNHAP`
--

DROP TABLE IF EXISTS `PHIEUNHAP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PHIEUNHAP` (
  `SoPN` char(4) NOT NULL,
  `NgayNhap` date NOT NULL,
  PRIMARY KEY (`SoPN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PHIEUNHAP`
--

LOCK TABLES `PHIEUNHAP` WRITE;
/*!40000 ALTER TABLE `PHIEUNHAP` DISABLE KEYS */;
/*!40000 ALTER TABLE `PHIEUNHAP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PHIEUXUAT`
--

DROP TABLE IF EXISTS `PHIEUXUAT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PHIEUXUAT` (
  `SoPX` char(4) NOT NULL,
  `NgayXuat` date NOT NULL,
  PRIMARY KEY (`SoPX`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PHIEUXUAT`
--

LOCK TABLES `PHIEUXUAT` WRITE;
/*!40000 ALTER TABLE `PHIEUXUAT` DISABLE KEYS */;
/*!40000 ALTER TABLE `PHIEUXUAT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `VATTU`
--

DROP TABLE IF EXISTS `VATTU`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `VATTU` (
  `MaVTU` char(4) NOT NULL,
  `TenVTU` varchar(100) NOT NULL,
  PRIMARY KEY (`MaVTU`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `VATTU`
--

LOCK TABLES `VATTU` WRITE;
/*!40000 ALTER TABLE `VATTU` DISABLE KEYS */;
/*!40000 ALTER TABLE `VATTU` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-03-31  8:24:47
