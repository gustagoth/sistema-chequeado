CREATE DATABASE  IF NOT EXISTS `chekeado` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `chekeado`;
-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: chekeado
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorias` (
  `categoria_id` int NOT NULL AUTO_INCREMENT,
  `categoria_nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`categoria_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES (1,'Deportes'),(2,'Política'),(3,'Cine'),(4,'TV'),(5,'Música');
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chequeos`
--

DROP TABLE IF EXISTS `chequeos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chequeos` (
  `chequeo_id` int NOT NULL AUTO_INCREMENT,
  `chequeo_categoria` int NOT NULL,
  `chequeo_palabraclave` varchar(45) DEFAULT NULL,
  `chequeo_frase` varchar(45) DEFAULT NULL,
  `chequeo_medio_origen` varchar(45) DEFAULT NULL,
  `chequeo_enlace` varchar(45) DEFAULT NULL,
  `chequeo_fecha` date DEFAULT NULL,
  `chequeo_verificacion` bit(1) DEFAULT NULL,
  PRIMARY KEY (`chequeo_id`),
  KEY `chequeo_categoria_idx` (`chequeo_categoria`),
  CONSTRAINT `chequeo_categoria` FOREIGN KEY (`chequeo_categoria`) REFERENCES `categorias` (`categoria_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chequeos`
--

LOCK TABLES `chequeos` WRITE;
/*!40000 ALTER TABLE `chequeos` DISABLE KEYS */;
INSERT INTO `chequeos` VALUES (1,2,'maradona diego recuperado enfermedad','Maradona se recuperó','Infobae','infobae.com/maradona_recuperado','2020-10-12',_binary '');
/*!40000 ALTER TABLE `chequeos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `explicaciones`
--

DROP TABLE IF EXISTS `explicaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `explicaciones` (
  `explicacion_id` int NOT NULL AUTO_INCREMENT,
  `explicacion_nombre` varchar(45) DEFAULT NULL,
  `explicacion_epigrafe` varchar(225) DEFAULT NULL,
  `explicacion_contenido` varchar(225) DEFAULT NULL,
  `explicacion_fecha_creacion` date DEFAULT NULL,
  `explicacion_enlace` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`explicacion_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `explicaciones`
--

LOCK TABLES `explicaciones` WRITE;
/*!40000 ALTER TABLE `explicaciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `explicaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `explicaciones_has_chequeos`
--

DROP TABLE IF EXISTS `explicaciones_has_chequeos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `explicaciones_has_chequeos` (
  `explicaciones_explicacion_id` int NOT NULL,
  `chequeos_chequeo_id` int NOT NULL,
  PRIMARY KEY (`explicaciones_explicacion_id`,`chequeos_chequeo_id`),
  KEY `fk_explicaciones_has_chequeos_chequeos1_idx` (`chequeos_chequeo_id`),
  KEY `fk_explicaciones_has_chequeos_explicaciones1_idx` (`explicaciones_explicacion_id`),
  CONSTRAINT `fk_explicaciones_has_chequeos_chequeos1` FOREIGN KEY (`chequeos_chequeo_id`) REFERENCES `chequeos` (`chequeo_id`),
  CONSTRAINT `fk_explicaciones_has_chequeos_explicaciones1` FOREIGN KEY (`explicaciones_explicacion_id`) REFERENCES `explicaciones` (`explicacion_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `explicaciones_has_chequeos`
--

LOCK TABLES `explicaciones_has_chequeos` WRITE;
/*!40000 ALTER TABLE `explicaciones_has_chequeos` DISABLE KEYS */;
/*!40000 ALTER TABLE `explicaciones_has_chequeos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `investigaciones`
--

DROP TABLE IF EXISTS `investigaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `investigaciones` (
  `investigacion_id` int NOT NULL AUTO_INCREMENT,
  `investigacion_tema` varchar(45) DEFAULT NULL,
  `investigacion_palabraclave` varchar(45) DEFAULT NULL,
  `investigacion_titulo` varchar(45) DEFAULT NULL,
  `investigacion_epigrafe` text,
  `investigacion_contenido` text,
  `investigacion_fecha_creacion` date DEFAULT NULL,
  `investigacion_categoria` int DEFAULT NULL,
  PRIMARY KEY (`investigacion_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `investigaciones`
--

LOCK TABLES `investigaciones` WRITE;
/*!40000 ALTER TABLE `investigaciones` DISABLE KEYS */;
INSERT INTO `investigaciones` VALUES (1,'Eliminatorias mundial Qatar 2022','messi esta lesionado','Messi está lesionado','especialistas verifican el estado fisico de Messi','messi podría estar lesionado dicen especialistas y periodistas','2020-11-19',2);
/*!40000 ALTER TABLE `investigaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sugerencia`
--

DROP TABLE IF EXISTS `sugerencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sugerencia` (
  `sugerencia_id` int NOT NULL,
  `frase` varchar(255) NOT NULL,
  `sugerencia_autor_frase` varchar(45) DEFAULT NULL,
  `sugerencia_medio_frase` varchar(255) NOT NULL,
  `sugerencia_enlace` varchar(255) DEFAULT NULL,
  `sugerencia_fecha_frase` date NOT NULL,
  PRIMARY KEY (`sugerencia_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sugerencia`
--

LOCK TABLES `sugerencia` WRITE;
/*!40000 ALTER TABLE `sugerencia` DISABLE KEYS */;
/*!40000 ALTER TABLE `sugerencia` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-11-19 19:08:45
