-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: music
-- ------------------------------------------------------
-- Server version	8.0.39

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
-- Table structure for table `artists`
--

DROP TABLE IF EXISTS `artists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artists` (
  `idArtists` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(30) COLLATE utf8mb3_danish_ci NOT NULL,
  `LastName` varchar(30) COLLATE utf8mb3_danish_ci NOT NULL,
  `Birth` date DEFAULT NULL,
  ` Instrument` varchar(20) COLLATE utf8mb3_danish_ci DEFAULT NULL,
  `Band` varchar(30) COLLATE utf8mb3_danish_ci DEFAULT NULL,
  `idBands` int NOT NULL,
  PRIMARY KEY (`idArtists`),
  KEY `fk_Artists_Bands1_idx` (`idBands`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_danish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artists`
--

LOCK TABLES `artists` WRITE;
/*!40000 ALTER TABLE `artists` DISABLE KEYS */;
INSERT INTO `artists` VALUES (1,'Chris ','Cornell ','1975-02-15','Singer & guitar','Sound Garden',1),(2,'Lane ','Staley','1978-06-14','Singer','AIC',2),(3,'Freddie ','Mercury','1946-03-07','Singer','Queen',3);
/*!40000 ALTER TABLE `artists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artists_has_instruments`
--

DROP TABLE IF EXISTS `artists_has_instruments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artists_has_instruments` (
  `Artists_idArtists` int NOT NULL,
  `Instruments_id_instrument` int NOT NULL,
  PRIMARY KEY (`Artists_idArtists`,`Instruments_id_instrument`),
  KEY `fk_Artists_has_Instruments_Instruments1_idx` (`Instruments_id_instrument`),
  KEY `fk_Artists_has_Instruments_Artists1_idx` (`Artists_idArtists`),
  CONSTRAINT `fk_Artists_has_Instruments_Artists1` FOREIGN KEY (`Artists_idArtists`) REFERENCES `artists` (`idArtists`),
  CONSTRAINT `fk_Artists_has_Instruments_Instruments1` FOREIGN KEY (`Instruments_id_instrument`) REFERENCES `instruments` (`id_instrument`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_danish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artists_has_instruments`
--

LOCK TABLES `artists_has_instruments` WRITE;
/*!40000 ALTER TABLE `artists_has_instruments` DISABLE KEYS */;
INSERT INTO `artists_has_instruments` VALUES (2,1),(1,2);
/*!40000 ALTER TABLE `artists_has_instruments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bands`
--

DROP TABLE IF EXISTS `bands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bands` (
  `idBands` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(30) COLLATE utf8mb3_danish_ci NOT NULL,
  `City` varchar(20) COLLATE utf8mb3_danish_ci NOT NULL,
  `Genre` varchar(20) COLLATE utf8mb3_danish_ci NOT NULL,
  `Albums` int DEFAULT '0',
  `Active` tinyint DEFAULT '0',
  PRIMARY KEY (`idBands`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_danish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bands`
--

LOCK TABLES `bands` WRITE;
/*!40000 ALTER TABLE `bands` DISABLE KEYS */;
INSERT INTO `bands` VALUES (1,'Sound Garden','Seattle','grunge',6,0),(2,'AIC','Seattle','grunge',5,0),(3,'Queen','London','rock',7,1),(12,'Her','Rome','Classic',0,0);
/*!40000 ALTER TABLE `bands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bands_has_festivals`
--

DROP TABLE IF EXISTS `bands_has_festivals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bands_has_festivals` (
  `Bands_idBands` int NOT NULL,
  `Festivals_idFestivals` int NOT NULL,
  PRIMARY KEY (`Bands_idBands`,`Festivals_idFestivals`),
  KEY `fk_Bands_has_Festivals_Festivals1_idx` (`Festivals_idFestivals`),
  KEY `fk_Bands_has_Festivals_Bands1_idx` (`Bands_idBands`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_danish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bands_has_festivals`
--

LOCK TABLES `bands_has_festivals` WRITE;
/*!40000 ALTER TABLE `bands_has_festivals` DISABLE KEYS */;
/*!40000 ALTER TABLE `bands_has_festivals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `festivals`
--

DROP TABLE IF EXISTS `festivals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `festivals` (
  `idFestivals` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(20) COLLATE utf8mb3_danish_ci NOT NULL,
  `City` varchar(20) COLLATE utf8mb3_danish_ci DEFAULT NULL,
  `Country` varchar(30) COLLATE utf8mb3_danish_ci DEFAULT NULL,
  `Month` varchar(45) COLLATE utf8mb3_danish_ci DEFAULT NULL,
  PRIMARY KEY (`idFestivals`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_danish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `festivals`
--

LOCK TABLES `festivals` WRITE;
/*!40000 ALTER TABLE `festivals` DISABLE KEYS */;
INSERT INTO `festivals` VALUES (1,'Coachella','California','USA','September'),(2,'Glastonbury','Pilton','UK','January'),(3,'Primavera Sound','BCN','Spain','July'),(4,'Tomorrowland','Boom','Belgium','November');
/*!40000 ALTER TABLE `festivals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instruments`
--

DROP TABLE IF EXISTS `instruments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `instruments` (
  `id_instrument` int NOT NULL AUTO_INCREMENT,
  `Type` varchar(15) COLLATE utf8mb3_danish_ci NOT NULL,
  `Material` varchar(20) COLLATE utf8mb3_danish_ci NOT NULL,
  PRIMARY KEY (`id_instrument`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_danish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instruments`
--

LOCK TABLES `instruments` WRITE;
/*!40000 ALTER TABLE `instruments` DISABLE KEYS */;
INSERT INTO `instruments` VALUES (1,'guitar','wood'),(2,'drums','wood');
/*!40000 ALTER TABLE `instruments` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-28 10:58:30
