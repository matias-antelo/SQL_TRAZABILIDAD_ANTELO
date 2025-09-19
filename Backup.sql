CREATE DATABASE  IF NOT EXISTS `trazabilidad+antelo` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `trazabilidad+antelo`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: trazabilidad+antelo
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `agua_dest`
--

DROP TABLE IF EXISTS `agua_dest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `agua_dest` (
  `ID_AGUA` int NOT NULL AUTO_INCREMENT,
  `FECHA_ENTRADA` date NOT NULL,
  `CONTROL` varchar(100) DEFAULT NULL,
  `ID_ANALISTA` int DEFAULT NULL,
  PRIMARY KEY (`ID_AGUA`),
  KEY `ID_ANALISTA` (`ID_ANALISTA`),
  CONSTRAINT `agua_dest_ibfk_1` FOREIGN KEY (`ID_ANALISTA`) REFERENCES `analista_firma` (`ID_ANALISTA`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agua_dest`
--

LOCK TABLES `agua_dest` WRITE;
/*!40000 ALTER TABLE `agua_dest` DISABLE KEYS */;
INSERT INTO `agua_dest` VALUES (1,'2025-01-20','Conductividad < 1 µS/cm',1),(2,'2025-02-10','pH dentro de rango',2),(3,'2025-03-05','Libre de contaminantes',3);
/*!40000 ALTER TABLE `agua_dest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `analista_firma`
--

DROP TABLE IF EXISTS `analista_firma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `analista_firma` (
  `ID_ANALISTA` int NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(100) NOT NULL,
  PRIMARY KEY (`ID_ANALISTA`),
  UNIQUE KEY `NOMBRE` (`NOMBRE`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `analista_firma`
--

LOCK TABLES `analista_firma` WRITE;
/*!40000 ALTER TABLE `analista_firma` DISABLE KEYS */;
INSERT INTO `analista_firma` VALUES (2,'GR'),(4,'IB'),(3,'JM'),(1,'MA');
/*!40000 ALTER TABLE `analista_firma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `autoclave_verif`
--

DROP TABLE IF EXISTS `autoclave_verif`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `autoclave_verif` (
  `ID_AUTOCLAVE` int NOT NULL AUTO_INCREMENT,
  `ID_EQUIPO` int NOT NULL,
  `FECHA` date NOT NULL,
  `LECTURA_1` decimal(8,3) DEFAULT NULL,
  `LECTURA_2` decimal(8,3) DEFAULT NULL,
  `CUMPLE` tinyint(1) DEFAULT NULL,
  `ID_ANALISTA` int DEFAULT NULL,
  PRIMARY KEY (`ID_AUTOCLAVE`),
  KEY `ID_EQUIPO` (`ID_EQUIPO`),
  KEY `ID_ANALISTA` (`ID_ANALISTA`),
  CONSTRAINT `autoclave_verif_ibfk_1` FOREIGN KEY (`ID_EQUIPO`) REFERENCES `equipos` (`ID_EQUIPO`),
  CONSTRAINT `autoclave_verif_ibfk_2` FOREIGN KEY (`ID_ANALISTA`) REFERENCES `analista_firma` (`ID_ANALISTA`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autoclave_verif`
--

LOCK TABLES `autoclave_verif` WRITE;
/*!40000 ALTER TABLE `autoclave_verif` DISABLE KEYS */;
INSERT INTO `autoclave_verif` VALUES (1,1,'2025-02-01',121.000,121.200,1,1),(2,1,'2025-02-15',120.800,121.100,1,2),(3,1,'2025-03-01',119.500,121.000,0,3);
/*!40000 ALTER TABLE `autoclave_verif` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cepa_reserva`
--

DROP TABLE IF EXISTS `cepa_reserva`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cepa_reserva` (
  `ID_RESERVA` int NOT NULL AUTO_INCREMENT,
  `ID_STOCK` int NOT NULL,
  `NUMERO_ALICUOTA` varchar(10) NOT NULL,
  `FECHA_RECONSTITUCION` date DEFAULT NULL,
  `ID_OBSERVACION` int DEFAULT NULL,
  `ID_ANALISTA` int DEFAULT NULL,
  PRIMARY KEY (`ID_RESERVA`),
  KEY `ID_ANALISTA` (`ID_ANALISTA`),
  KEY `ID_OBSERVACION` (`ID_OBSERVACION`),
  KEY `ID_STOCK` (`ID_STOCK`),
  CONSTRAINT `cepa_reserva_ibfk_1` FOREIGN KEY (`ID_ANALISTA`) REFERENCES `analista_firma` (`ID_ANALISTA`),
  CONSTRAINT `cepa_reserva_ibfk_2` FOREIGN KEY (`ID_OBSERVACION`) REFERENCES `observacion_reserva` (`ID_OBSERVACION`),
  CONSTRAINT `cepa_reserva_ibfk_3` FOREIGN KEY (`ID_STOCK`) REFERENCES `stock_cepas` (`ID_STOCK`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cepa_reserva`
--

LOCK TABLES `cepa_reserva` WRITE;
/*!40000 ALTER TABLE `cepa_reserva` DISABLE KEYS */;
INSERT INTO `cepa_reserva` VALUES (1,1,'1','2025-02-01',1,1),(2,1,'2',NULL,NULL,NULL),(3,1,'3',NULL,NULL,NULL),(4,1,'4',NULL,NULL,NULL),(5,1,'5',NULL,NULL,NULL),(6,4,'1','2025-03-01',2,2),(7,4,'2',NULL,NULL,NULL),(8,4,'3',NULL,NULL,NULL),(9,4,'4',NULL,NULL,NULL),(10,4,'5',NULL,NULL,NULL),(11,6,'1','2025-02-15',3,3),(12,6,'2',NULL,NULL,NULL),(13,6,'3',NULL,NULL,NULL),(14,6,'4',NULL,NULL,NULL),(15,6,'5',NULL,NULL,NULL),(16,9,'1','2025-03-05',1,4),(17,9,'2',NULL,NULL,NULL),(18,9,'3',NULL,NULL,NULL),(19,9,'4',NULL,NULL,NULL),(20,9,'5',NULL,NULL,NULL),(21,10,'1','2025-02-10',2,1),(22,10,'2',NULL,NULL,NULL),(23,10,'3',NULL,NULL,NULL),(24,10,'4',NULL,NULL,NULL),(25,10,'5',NULL,NULL,NULL);
/*!40000 ALTER TABLE `cepa_reserva` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_insert_cepa_reserva` AFTER INSERT ON `cepa_reserva` FOR EACH ROW BEGIN
    INSERT INTO CEPA_RESERVA_AUDITORIA (
        ID_RESERVA, ID_STOCK, NUMERO_ALICUOTA, FECHA_RECONSTITUCION, 
        ID_OBSERVACION, ID_ANALISTA, USUARIO, FECHA, ACCION
    )
    VALUES (
        NEW.ID_RESERVA, NEW.ID_STOCK, NEW.NUMERO_ALICUOTA, NEW.FECHA_RECONSTITUCION, 
        NEW.ID_OBSERVACION, NEW.ID_ANALISTA, USER(), NOW(), 'Se insertó nueva reserva'
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_delete_cepa_reserva` BEFORE DELETE ON `cepa_reserva` FOR EACH ROW BEGIN
    INSERT INTO CEPA_RESERVA_AUDITORIA (
        ID_RESERVA, ID_STOCK, NUMERO_ALICUOTA, FECHA_RECONSTITUCION, 
        ID_OBSERVACION, ID_ANALISTA, USUARIO, FECHA, ACCION
    )
    VALUES (
        OLD.ID_RESERVA, OLD.ID_STOCK, OLD.NUMERO_ALICUOTA, OLD.FECHA_RECONSTITUCION, 
        OLD.ID_OBSERVACION, OLD.ID_ANALISTA, USER(), NOW(), 'Se eliminó una reserva'
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `cepa_reserva_auditoria`
--

DROP TABLE IF EXISTS `cepa_reserva_auditoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cepa_reserva_auditoria` (
  `ID_AUDITORIA` int NOT NULL AUTO_INCREMENT,
  `ID_RESERVA` int DEFAULT NULL,
  `ID_STOCK` int DEFAULT NULL,
  `NUMERO_ALICUOTA` varchar(10) DEFAULT NULL,
  `FECHA_RECONSTITUCION` date DEFAULT NULL,
  `ID_OBSERVACION` int DEFAULT NULL,
  `ID_ANALISTA` int DEFAULT NULL,
  `USUARIO` varchar(100) DEFAULT NULL,
  `FECHA` datetime DEFAULT NULL,
  `ACCION` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`ID_AUDITORIA`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cepa_reserva_auditoria`
--

LOCK TABLES `cepa_reserva_auditoria` WRITE;
/*!40000 ALTER TABLE `cepa_reserva_auditoria` DISABLE KEYS */;
INSERT INTO `cepa_reserva_auditoria` VALUES (1,27,10,'200',NULL,NULL,NULL,'root@localhost','2025-09-08 17:43:43','Se insertó nueva reserva'),(2,27,10,'200',NULL,NULL,NULL,'root@localhost','2025-09-08 17:44:31','Se eliminó una reserva');
/*!40000 ALTER TABLE `cepa_reserva_auditoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cepa_trabajo`
--

DROP TABLE IF EXISTS `cepa_trabajo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cepa_trabajo` (
  `ID_TRABAJO` int NOT NULL AUTO_INCREMENT,
  `NIVEL` int NOT NULL,
  `ID_RESERVA_ORIGEN` int DEFAULT NULL,
  `ID_TRABAJO_ORIGEN` int DEFAULT NULL,
  `FECHA_ACTIVACION` date NOT NULL,
  `ID_PRUEBAS` int DEFAULT NULL,
  `RESULTADO` varchar(500) DEFAULT NULL,
  `ID_OBSERVACIONTRABAJO` int DEFAULT NULL,
  `ID_ANALISTA` int DEFAULT NULL,
  `FECHA_BAJA` date DEFAULT NULL,
  `ID_PREPARACION` int DEFAULT NULL,
  PRIMARY KEY (`ID_TRABAJO`),
  KEY `ID_PRUEBAS` (`ID_PRUEBAS`),
  KEY `ID_OBSERVACIONTRABAJO` (`ID_OBSERVACIONTRABAJO`),
  KEY `ID_ANALISTA` (`ID_ANALISTA`),
  KEY `ID_RESERVA_ORIGEN` (`ID_RESERVA_ORIGEN`),
  KEY `ID_TRABAJO_ORIGEN` (`ID_TRABAJO_ORIGEN`),
  KEY `FK_CEPA_TRABAJO_PREPARACION` (`ID_PREPARACION`),
  CONSTRAINT `cepa_trabajo_ibfk_1` FOREIGN KEY (`ID_PRUEBAS`) REFERENCES `pruebas_cepas` (`ID_PRUEBAS`),
  CONSTRAINT `cepa_trabajo_ibfk_2` FOREIGN KEY (`ID_OBSERVACIONTRABAJO`) REFERENCES `observacion_trabajo` (`ID_OBSERVACIONTRABAJO`),
  CONSTRAINT `cepa_trabajo_ibfk_3` FOREIGN KEY (`ID_ANALISTA`) REFERENCES `analista_firma` (`ID_ANALISTA`),
  CONSTRAINT `cepa_trabajo_ibfk_4` FOREIGN KEY (`ID_RESERVA_ORIGEN`) REFERENCES `cepa_reserva` (`ID_RESERVA`) ON DELETE CASCADE,
  CONSTRAINT `cepa_trabajo_ibfk_5` FOREIGN KEY (`ID_TRABAJO_ORIGEN`) REFERENCES `cepa_trabajo` (`ID_TRABAJO`) ON DELETE CASCADE,
  CONSTRAINT `FK_CEPA_TRABAJO_PREPARACION` FOREIGN KEY (`ID_PREPARACION`) REFERENCES `preparacion_medio_cultivo` (`ID_PREPARACION`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cepa_trabajo`
--

LOCK TABLES `cepa_trabajo` WRITE;
/*!40000 ALTER TABLE `cepa_trabajo` DISABLE KEYS */;
INSERT INTO `cepa_trabajo` VALUES (1,2,1,NULL,'2025-02-15',1,'TSI y urea positivos',1,1,NULL,NULL),(2,2,6,NULL,'2025-03-10',2,'API WEB OK',2,2,NULL,NULL),(3,2,11,NULL,'2025-02-20',3,'Crecimiento en agar selective',3,3,NULL,NULL),(4,2,16,NULL,'2025-03-15',1,'Crecimiento rápido en agar Pseudomonas',1,4,NULL,NULL),(5,2,21,NULL,'2025-02-18',2,'Coagulasa positivo',2,1,NULL,NULL),(6,3,NULL,1,'2025-03-01',1,'TSI y urea positivos confirmados',1,2,NULL,NULL),(7,3,NULL,2,'2025-03-15',2,'API WEB OK',2,3,NULL,NULL),(8,3,NULL,3,'2025-03-05',3,'Crecimiento consistente',3,1,NULL,NULL),(9,3,NULL,4,'2025-03-25',1,'Crecimiento rápido confirmado',1,4,NULL,NULL),(10,3,NULL,5,'2025-03-10',2,'Coagulasa confirmado',2,2,NULL,NULL),(11,4,NULL,6,'2025-03-20',1,'TSI y urea positivos repetidos',1,3,'2025-12-31',NULL),(12,4,NULL,7,'2025-04-01',2,'API WEB OK confirmado',2,4,'2025-12-31',NULL),(13,4,NULL,8,'2025-03-25',3,'Crecimiento estable',3,2,'2025-12-31',NULL),(14,4,NULL,9,'2025-04-05',1,'Crecimiento rápido OK',1,1,'2025-12-31',NULL),(15,4,NULL,10,'2025-03-28',2,'Coagulasa positivo repetido',2,3,'2025-12-31',NULL),(22,2,1,NULL,'2025-02-15',1,'TSI y urea positivos',1,1,NULL,1),(23,2,6,NULL,'2025-03-10',2,'API WEB OK',2,2,NULL,2),(24,2,11,NULL,'2025-02-20',3,'Crecimiento en agar selectivo',3,3,NULL,3),(25,2,16,NULL,'2025-03-15',1,'Crecimiento rápido en agar Pseudomonas',1,4,NULL,1),(26,2,21,NULL,'2025-02-18',2,'Coagulasa positivo',2,1,NULL,2),(27,3,NULL,1,'2025-03-01',1,'TSI y urea positivos confirmados',1,2,NULL,1),(28,3,NULL,2,'2025-03-15',2,'API WEB OK confirmado',2,3,NULL,2),(29,3,NULL,3,'2025-03-05',3,'Crecimiento consistente',3,1,NULL,3),(30,3,NULL,4,'2025-03-25',1,'Crecimiento rápido confirmado',1,4,NULL,1),(31,3,NULL,5,'2025-03-10',2,'Coagulasa confirmado',2,2,NULL,2),(32,4,NULL,6,'2025-03-20',1,'TSI y urea positivos repetidos',1,3,'2025-12-31',1),(33,4,NULL,7,'2025-04-01',2,'API WEB OK confirmado',2,4,'2025-12-31',2),(34,4,NULL,8,'2025-03-25',3,'Crecimiento estable',3,2,'2025-12-31',3),(35,4,NULL,9,'2025-04-05',1,'Crecimiento rápido OK',1,1,'2025-12-31',1),(36,4,NULL,10,'2025-03-28',2,'Coagulasa positivo repetido',2,3,'2025-12-31',2);
/*!40000 ALTER TABLE `cepa_trabajo` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_insert_cepa_trabajo` AFTER INSERT ON `cepa_trabajo` FOR EACH ROW BEGIN
    INSERT INTO CEPA_TRABAJO_AUDITORIA (
        ID_TRABAJO, NIVEL, ID_RESERVA_ORIGEN, ID_TRABAJO_ORIGEN, FECHA_ACTIVACION,
        ID_PRUEBAS, RESULTADO, ID_OBSERVACIONTRABAJO, ID_ANALISTA, FECHA_BAJA,
        USUARIO, FECHA, ACCION
    )
    VALUES (
        NEW.ID_TRABAJO, NEW.NIVEL, NEW.ID_RESERVA_ORIGEN, NEW.ID_TRABAJO_ORIGEN, NEW.FECHA_ACTIVACION,
        NEW.ID_PRUEBAS, NEW.RESULTADO, NEW.ID_OBSERVACIONTRABAJO, NEW.ID_ANALISTA, NEW.FECHA_BAJA,
        USER(), NOW(), 'Se insertó nueva cepa de trabajo'
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_delete_cepa_trabajo` BEFORE DELETE ON `cepa_trabajo` FOR EACH ROW BEGIN
    INSERT INTO CEPA_TRABAJO_AUDITORIA (
        ID_TRABAJO, NIVEL, ID_RESERVA_ORIGEN, ID_TRABAJO_ORIGEN, FECHA_ACTIVACION,
        ID_PRUEBAS, RESULTADO, ID_OBSERVACIONTRABAJO, ID_ANALISTA, FECHA_BAJA,
        USUARIO, FECHA, ACCION
    )
    VALUES (
        OLD.ID_TRABAJO, OLD.NIVEL, OLD.ID_RESERVA_ORIGEN, OLD.ID_TRABAJO_ORIGEN, OLD.FECHA_ACTIVACION,
        OLD.ID_PRUEBAS, OLD.RESULTADO, OLD.ID_OBSERVACIONTRABAJO, OLD.ID_ANALISTA, OLD.FECHA_BAJA,
        USER(), NOW(), 'Se eliminó una cepa de trabajo'
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `cepa_trabajo_auditoria`
--

DROP TABLE IF EXISTS `cepa_trabajo_auditoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cepa_trabajo_auditoria` (
  `ID_AUDITORIA` int NOT NULL AUTO_INCREMENT,
  `ID_TRABAJO` int DEFAULT NULL,
  `NIVEL` int DEFAULT NULL,
  `ID_RESERVA_ORIGEN` int DEFAULT NULL,
  `ID_TRABAJO_ORIGEN` int DEFAULT NULL,
  `FECHA_ACTIVACION` date DEFAULT NULL,
  `ID_PRUEBAS` int DEFAULT NULL,
  `RESULTADO` varchar(500) DEFAULT NULL,
  `ID_OBSERVACIONTRABAJO` int DEFAULT NULL,
  `ID_ANALISTA` int DEFAULT NULL,
  `FECHA_BAJA` date DEFAULT NULL,
  `USUARIO` varchar(100) DEFAULT NULL,
  `FECHA` datetime DEFAULT NULL,
  `ACCION` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`ID_AUDITORIA`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cepa_trabajo_auditoria`
--

LOCK TABLES `cepa_trabajo_auditoria` WRITE;
/*!40000 ALTER TABLE `cepa_trabajo_auditoria` DISABLE KEYS */;
INSERT INTO `cepa_trabajo_auditoria` VALUES (1,16,2,1,NULL,'2029-02-15',1,'TSI y urea asdasdasd positivos',1,1,NULL,'root@localhost','2025-09-08 17:46:09','Se insertó nueva cepa de trabajo'),(2,16,2,1,NULL,'2029-02-15',1,'TSI y urea asdasdasd positivos',1,1,NULL,'root@localhost','2025-09-08 17:46:43','Se eliminó una cepa de trabajo'),(3,22,2,1,NULL,'2025-02-15',1,'TSI y urea positivos',1,1,NULL,'root@localhost','2025-09-14 18:29:15','Se insertó nueva cepa de trabajo'),(4,23,2,6,NULL,'2025-03-10',2,'API WEB OK',2,2,NULL,'root@localhost','2025-09-14 18:29:15','Se insertó nueva cepa de trabajo'),(5,24,2,11,NULL,'2025-02-20',3,'Crecimiento en agar selectivo',3,3,NULL,'root@localhost','2025-09-14 18:29:15','Se insertó nueva cepa de trabajo'),(6,25,2,16,NULL,'2025-03-15',1,'Crecimiento rápido en agar Pseudomonas',1,4,NULL,'root@localhost','2025-09-14 18:29:15','Se insertó nueva cepa de trabajo'),(7,26,2,21,NULL,'2025-02-18',2,'Coagulasa positivo',2,1,NULL,'root@localhost','2025-09-14 18:29:15','Se insertó nueva cepa de trabajo'),(8,27,3,NULL,1,'2025-03-01',1,'TSI y urea positivos confirmados',1,2,NULL,'root@localhost','2025-09-14 18:29:17','Se insertó nueva cepa de trabajo'),(9,28,3,NULL,2,'2025-03-15',2,'API WEB OK confirmado',2,3,NULL,'root@localhost','2025-09-14 18:29:17','Se insertó nueva cepa de trabajo'),(10,29,3,NULL,3,'2025-03-05',3,'Crecimiento consistente',3,1,NULL,'root@localhost','2025-09-14 18:29:17','Se insertó nueva cepa de trabajo'),(11,30,3,NULL,4,'2025-03-25',1,'Crecimiento rápido confirmado',1,4,NULL,'root@localhost','2025-09-14 18:29:17','Se insertó nueva cepa de trabajo'),(12,31,3,NULL,5,'2025-03-10',2,'Coagulasa confirmado',2,2,NULL,'root@localhost','2025-09-14 18:29:17','Se insertó nueva cepa de trabajo'),(13,32,4,NULL,6,'2025-03-20',1,'TSI y urea positivos repetidos',1,3,'2025-12-31','root@localhost','2025-09-14 18:29:19','Se insertó nueva cepa de trabajo'),(14,33,4,NULL,7,'2025-04-01',2,'API WEB OK confirmado',2,4,'2025-12-31','root@localhost','2025-09-14 18:29:19','Se insertó nueva cepa de trabajo'),(15,34,4,NULL,8,'2025-03-25',3,'Crecimiento estable',3,2,'2025-12-31','root@localhost','2025-09-14 18:29:19','Se insertó nueva cepa de trabajo'),(16,35,4,NULL,9,'2025-04-05',1,'Crecimiento rápido OK',1,1,'2025-12-31','root@localhost','2025-09-14 18:29:19','Se insertó nueva cepa de trabajo'),(17,36,4,NULL,10,'2025-03-28',2,'Coagulasa positivo repetido',2,3,'2025-12-31','root@localhost','2025-09-14 18:29:19','Se insertó nueva cepa de trabajo');
/*!40000 ALTER TABLE `cepa_trabajo_auditoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cepas`
--

DROP TABLE IF EXISTS `cepas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cepas` (
  `MOO_ID` int NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(100) NOT NULL,
  PRIMARY KEY (`MOO_ID`),
  UNIQUE KEY `NOMBRE` (`NOMBRE`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cepas`
--

LOCK TABLES `cepas` WRITE;
/*!40000 ALTER TABLE `cepas` DISABLE KEYS */;
INSERT INTO `cepas` VALUES (2,'E. coli'),(3,'Listeria monocytogenes'),(4,'Pseudomonas aeruginosa'),(1,'Salmonella'),(5,'Staphylococcus aureus');
/*!40000 ALTER TABLE `cepas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `cepas_no_vencidas_sin_usar`
--

DROP TABLE IF EXISTS `cepas_no_vencidas_sin_usar`;
/*!50001 DROP VIEW IF EXISTS `cepas_no_vencidas_sin_usar`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `cepas_no_vencidas_sin_usar` AS SELECT 
 1 AS `CEPA`,
 1 AS `NUMERACION`,
 1 AS `FECHA_RECEPCION`,
 1 AS `FECHA_VTO`,
 1 AS `FECHA_RECONSTITUCION`,
 1 AS `RESULTADO`,
 1 AS `OBSERVACIONES`,
 1 AS `ANALISTA`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `cepas_reconstituidas`
--

DROP TABLE IF EXISTS `cepas_reconstituidas`;
/*!50001 DROP VIEW IF EXISTS `cepas_reconstituidas`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `cepas_reconstituidas` AS SELECT 
 1 AS `CEPA`,
 1 AS `NUMERACION`,
 1 AS `FECHA_RECEPCION`,
 1 AS `FECHA_VTO`,
 1 AS `FECHA_RECONSTITUCION`,
 1 AS `RESULTADO`,
 1 AS `OBSERVACIONES`,
 1 AS `ANALISTA`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `cepas_reserva_no_reconstituidas`
--

DROP TABLE IF EXISTS `cepas_reserva_no_reconstituidas`;
/*!50001 DROP VIEW IF EXISTS `cepas_reserva_no_reconstituidas`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `cepas_reserva_no_reconstituidas` AS SELECT 
 1 AS `NUMERO_ALICUOTA`,
 1 AS `FECHA_RECONSTITUCION`,
 1 AS `CEPA`,
 1 AS `NUMERACION`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `cepas_reserva_reconstituidas`
--

DROP TABLE IF EXISTS `cepas_reserva_reconstituidas`;
/*!50001 DROP VIEW IF EXISTS `cepas_reserva_reconstituidas`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `cepas_reserva_reconstituidas` AS SELECT 
 1 AS `NUMERO_ALICUOTA`,
 1 AS `FECHA_RECONSTITUCION`,
 1 AS `OBSERVACION`,
 1 AS `ANALISTA`,
 1 AS `CEPA`,
 1 AS `NUMERACION`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `cepas_vencidas_sin_usar`
--

DROP TABLE IF EXISTS `cepas_vencidas_sin_usar`;
/*!50001 DROP VIEW IF EXISTS `cepas_vencidas_sin_usar`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `cepas_vencidas_sin_usar` AS SELECT 
 1 AS `CEPA`,
 1 AS `NUMERACION`,
 1 AS `FECHA_RECEPCION`,
 1 AS `FECHA_VTO`,
 1 AS `FECHA_RECONSTITUCION`,
 1 AS `RESULTADO`,
 1 AS `OBSERVACIONES`,
 1 AS `ANALISTA`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `ecometrico`
--

DROP TABLE IF EXISTS `ecometrico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ecometrico` (
  `ID_ECOMETRICO` int NOT NULL AUTO_INCREMENT,
  `FECHA` date NOT NULL,
  `ICA` int NOT NULL,
  `ICE` int NOT NULL,
  `RESULTADO` varchar(100) NOT NULL,
  PRIMARY KEY (`ID_ECOMETRICO`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ecometrico`
--

LOCK TABLES `ecometrico` WRITE;
/*!40000 ALTER TABLE `ecometrico` DISABLE KEYS */;
INSERT INTO `ecometrico` VALUES (1,'2025-02-01',95,98,'Aceptado'),(2,'2025-02-15',90,96,'Aceptado'),(3,'2025-03-01',80,85,'Rechazado');
/*!40000 ALTER TABLE `ecometrico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipos`
--

DROP TABLE IF EXISTS `equipos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipos` (
  `ID_EQUIPO` int NOT NULL AUTO_INCREMENT,
  `MARCA` varchar(100) DEFAULT NULL,
  `FECHA_CALIBRACION` date DEFAULT NULL,
  `VTO_CALIBRACION` date DEFAULT NULL,
  PRIMARY KEY (`ID_EQUIPO`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipos`
--

LOCK TABLES `equipos` WRITE;
/*!40000 ALTER TABLE `equipos` DISABLE KEYS */;
INSERT INTO `equipos` VALUES (1,'Autoclave Raypa','2025-01-10','2026-01-10'),(2,'Balanza Ohaus','2025-02-05','2026-02-05'),(3,'Incubadora Memmert','2025-03-01','2026-03-01'),(16,'Sanyo','2029-01-10','2026-01-10');
/*!40000 ALTER TABLE `equipos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `esterilizacion`
--

DROP TABLE IF EXISTS `esterilizacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `esterilizacion` (
  `ID_CICLO` int NOT NULL AUTO_INCREMENT,
  `ID_EQUIPO` int NOT NULL,
  `FECHA` date NOT NULL,
  `TIEMPO` int DEFAULT NULL,
  `TEMPERATURA` int DEFAULT NULL,
  `ID_ANALISTA` int DEFAULT NULL,
  PRIMARY KEY (`ID_CICLO`),
  KEY `ID_EQUIPO` (`ID_EQUIPO`),
  KEY `ID_ANALISTA` (`ID_ANALISTA`),
  CONSTRAINT `esterilizacion_ibfk_1` FOREIGN KEY (`ID_EQUIPO`) REFERENCES `equipos` (`ID_EQUIPO`),
  CONSTRAINT `esterilizacion_ibfk_2` FOREIGN KEY (`ID_ANALISTA`) REFERENCES `analista_firma` (`ID_ANALISTA`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `esterilizacion`
--

LOCK TABLES `esterilizacion` WRITE;
/*!40000 ALTER TABLE `esterilizacion` DISABLE KEYS */;
INSERT INTO `esterilizacion` VALUES (1,1,'2025-02-01',30,121,1),(2,1,'2025-02-15',35,121,2),(3,1,'2025-03-01',30,121,3);
/*!40000 ALTER TABLE `esterilizacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medio_cultivo_stock`
--

DROP TABLE IF EXISTS `medio_cultivo_stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medio_cultivo_stock` (
  `ID_MEDIO` int NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(100) NOT NULL,
  `FABRICANTE` varchar(100) DEFAULT NULL,
  `LOTE` varchar(50) DEFAULT NULL,
  `VENCIMIENTO` date DEFAULT NULL,
  PRIMARY KEY (`ID_MEDIO`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medio_cultivo_stock`
--

LOCK TABLES `medio_cultivo_stock` WRITE;
/*!40000 ALTER TABLE `medio_cultivo_stock` DISABLE KEYS */;
INSERT INTO `medio_cultivo_stock` VALUES (1,'Agar MacConkey','Oxoid','MC-2025','2026-01-15'),(2,'Agar Nutriente','Merck','AN-4578','2026-03-20'),(3,'Agar Sangre','Biokar','AS-3350','2025-12-10'),(4,'Caldo Lactosado','Oxoid','CL-9987','2026-05-30');
/*!40000 ALTER TABLE `medio_cultivo_stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `observacion_reserva`
--

DROP TABLE IF EXISTS `observacion_reserva`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `observacion_reserva` (
  `ID_OBSERVACION` int NOT NULL AUTO_INCREMENT,
  `DESCRIPCION` varchar(255) NOT NULL,
  PRIMARY KEY (`ID_OBSERVACION`),
  UNIQUE KEY `DESCRIPCION` (`DESCRIPCION`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `observacion_reserva`
--

LOCK TABLES `observacion_reserva` WRITE;
/*!40000 ALTER TABLE `observacion_reserva` DISABLE KEYS */;
INSERT INTO `observacion_reserva` VALUES (3,'Contaminación'),(2,'Descarte'),(1,'Sin crecimiento');
/*!40000 ALTER TABLE `observacion_reserva` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `observacion_trabajo`
--

DROP TABLE IF EXISTS `observacion_trabajo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `observacion_trabajo` (
  `ID_OBSERVACIONTRABAJO` int NOT NULL AUTO_INCREMENT,
  `DESCRIPCION` varchar(200) NOT NULL,
  PRIMARY KEY (`ID_OBSERVACIONTRABAJO`),
  UNIQUE KEY `DESCRIPCION` (`DESCRIPCION`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `observacion_trabajo`
--

LOCK TABLES `observacion_trabajo` WRITE;
/*!40000 ALTER TABLE `observacion_trabajo` DISABLE KEYS */;
INSERT INTO `observacion_trabajo` VALUES (3,'Descarte'),(2,'Descarte por contaminación'),(4,'Ok'),(1,'Sin crecimiento');
/*!40000 ALTER TABLE `observacion_trabajo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `preparacion_medio_cultivo`
--

DROP TABLE IF EXISTS `preparacion_medio_cultivo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `preparacion_medio_cultivo` (
  `ID_PREPARACION` int NOT NULL AUTO_INCREMENT,
  `ID_MEDIO` int NOT NULL,
  `FECHA_PREPARACION` date NOT NULL,
  `ID_ECOMETRICO` int DEFAULT NULL,
  `ID_AGUA` int DEFAULT NULL,
  `ID_ANALISTA` int DEFAULT NULL,
  `PH` int DEFAULT NULL,
  `OBSERVACIONES` varchar(500) DEFAULT NULL,
  `ID_CICLO` int DEFAULT NULL,
  PRIMARY KEY (`ID_PREPARACION`),
  KEY `ID_MEDIO` (`ID_MEDIO`),
  KEY `ID_ECOMETRICO` (`ID_ECOMETRICO`),
  KEY `ID_AGUA` (`ID_AGUA`),
  KEY `ID_ANALISTA` (`ID_ANALISTA`),
  KEY `FK_PREPARACION_CICLO` (`ID_CICLO`),
  CONSTRAINT `FK_PREPARACION_CICLO` FOREIGN KEY (`ID_CICLO`) REFERENCES `esterilizacion` (`ID_CICLO`) ON DELETE SET NULL,
  CONSTRAINT `preparacion_medio_cultivo_ibfk_1` FOREIGN KEY (`ID_MEDIO`) REFERENCES `medio_cultivo_stock` (`ID_MEDIO`),
  CONSTRAINT `preparacion_medio_cultivo_ibfk_2` FOREIGN KEY (`ID_ECOMETRICO`) REFERENCES `ecometrico` (`ID_ECOMETRICO`),
  CONSTRAINT `preparacion_medio_cultivo_ibfk_3` FOREIGN KEY (`ID_AGUA`) REFERENCES `agua_dest` (`ID_AGUA`),
  CONSTRAINT `preparacion_medio_cultivo_ibfk_4` FOREIGN KEY (`ID_ANALISTA`) REFERENCES `analista_firma` (`ID_ANALISTA`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `preparacion_medio_cultivo`
--

LOCK TABLES `preparacion_medio_cultivo` WRITE;
/*!40000 ALTER TABLE `preparacion_medio_cultivo` DISABLE KEYS */;
INSERT INTO `preparacion_medio_cultivo` VALUES (1,1,'2025-02-02',1,1,1,7,'Preparación estándar de MacConkey',1),(2,2,'2025-02-16',2,2,2,7,'Preparación de Agar Nutriente',2),(3,3,'2025-03-02',3,3,3,6,'Preparación de Agar Sangre - lote crítico',3);
/*!40000 ALTER TABLE `preparacion_medio_cultivo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pruebas_cepas`
--

DROP TABLE IF EXISTS `pruebas_cepas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pruebas_cepas` (
  `ID_PRUEBAS` int NOT NULL AUTO_INCREMENT,
  `TIPOS` varchar(200) NOT NULL,
  PRIMARY KEY (`ID_PRUEBAS`),
  UNIQUE KEY `TIPOS` (`TIPOS`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pruebas_cepas`
--

LOCK TABLES `pruebas_cepas` WRITE;
/*!40000 ALTER TABLE `pruebas_cepas` DISABLE KEYS */;
INSERT INTO `pruebas_cepas` VALUES (2,'API WEB'),(4,'MALDI-TOF'),(3,'PCR'),(5,'Prueba confirmatoria'),(1,'Pruebas bioquímicas');
/*!40000 ALTER TABLE `pruebas_cepas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock_cepas`
--

DROP TABLE IF EXISTS `stock_cepas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock_cepas` (
  `ID_STOCK` int NOT NULL AUTO_INCREMENT,
  `MOO_ID` int NOT NULL,
  `NUMERACION` int NOT NULL,
  `FECHA_RECEPCION` date NOT NULL,
  `FECHA_VTO` date NOT NULL,
  `FECHA_RECONSTITUCION` date DEFAULT NULL,
  `ID_PRUEBAS` int DEFAULT NULL,
  `RESULTADO` varchar(500) DEFAULT NULL,
  `OBSERVACIONES` varchar(500) DEFAULT NULL,
  `ID_ANALISTA` int DEFAULT NULL,
  PRIMARY KEY (`ID_STOCK`),
  KEY `ID_ANALISTA` (`ID_ANALISTA`),
  KEY `ID_PRUEBAS` (`ID_PRUEBAS`),
  KEY `MOO_ID` (`MOO_ID`),
  CONSTRAINT `stock_cepas_ibfk_1` FOREIGN KEY (`ID_ANALISTA`) REFERENCES `analista_firma` (`ID_ANALISTA`),
  CONSTRAINT `stock_cepas_ibfk_2` FOREIGN KEY (`ID_PRUEBAS`) REFERENCES `pruebas_cepas` (`ID_PRUEBAS`),
  CONSTRAINT `stock_cepas_ibfk_3` FOREIGN KEY (`MOO_ID`) REFERENCES `cepas` (`MOO_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock_cepas`
--

LOCK TABLES `stock_cepas` WRITE;
/*!40000 ALTER TABLE `stock_cepas` DISABLE KEYS */;
INSERT INTO `stock_cepas` VALUES (1,1,1,'2024-06-15','2025-06-15','2025-02-01',1,'TSI positivos, urea negativo, LIA positivo','Reconstitución según protocolo estándar',1),(2,1,2,'2024-07-10','2025-07-10',NULL,NULL,NULL,NULL,NULL),(3,1,3,'2024-08-05','2025-08-05',NULL,NULL,NULL,NULL,NULL),(4,2,1,'2024-06-20','2025-06-20','2025-03-01',2,'TSI negativos, urea positivo','Reconstitución según protocolo estándar',2),(5,2,2,'2024-07-12','2025-07-12',NULL,NULL,NULL,NULL,NULL),(6,3,1,'2024-06-25','2025-06-25','2025-02-15',3,'Crecimiento positivo en agar selective','Reconstitución según protocolo estándar',3),(7,3,2,'2024-07-20','2025-07-20',NULL,NULL,NULL,NULL,NULL),(8,3,3,'2024-08-10','2025-08-10',NULL,NULL,NULL,NULL,NULL),(9,4,1,'2024-07-01','2025-07-01','2025-03-05',4,'Crecimiento rápido en agar Pseudomonas','Reconstitución según protocolo estándar',4),(10,5,1,'2024-06-18','2025-06-18','2025-02-10',5,'Crecimiento positivo, coagulasa positivo','Reconstitución según protocolo estándar',1),(11,5,2,'2024-07-15','2025-07-15',NULL,NULL,NULL,NULL,NULL),(12,5,3,'2024-08-12','2025-08-12',NULL,NULL,NULL,NULL,NULL),(13,4,2,'2024-08-05','2027-08-05',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `stock_cepas` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_insert_stock_cepas` AFTER INSERT ON `stock_cepas` FOR EACH ROW BEGIN
    INSERT INTO STOCK_CEPAS_AUDITORIA (
        ID_STOCK, MOO_ID, NUMERACION, FECHA_RECEPCION, FECHA_VTO, 
        FECHA_RECONSTITUCION, ID_PRUEBAS, RESULTADO, OBSERVACIONES, ID_ANALISTA,
        USUARIO, FECHA, ACCION
    )
    VALUES (
        NEW.ID_STOCK, NEW.MOO_ID, NEW.NUMERACION, NEW.FECHA_RECEPCION, NEW.FECHA_VTO, 
        NEW.FECHA_RECONSTITUCION, NEW.ID_PRUEBAS, NEW.RESULTADO, NEW.OBSERVACIONES, NEW.ID_ANALISTA,
        USER(), NOW(), 'Se insertó nueva cepa'
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_delete_stock_cepas` BEFORE DELETE ON `stock_cepas` FOR EACH ROW BEGIN
    INSERT INTO STOCK_CEPAS_AUDITORIA (
        ID_STOCK, MOO_ID, NUMERACION, FECHA_RECEPCION, FECHA_VTO, 
        FECHA_RECONSTITUCION, ID_PRUEBAS, RESULTADO, OBSERVACIONES, ID_ANALISTA,
        USUARIO, FECHA, ACCION
    )
    VALUES (
        OLD.ID_STOCK, OLD.MOO_ID, OLD.NUMERACION, OLD.FECHA_RECEPCION, OLD.FECHA_VTO, 
        OLD.FECHA_RECONSTITUCION, OLD.ID_PRUEBAS, OLD.RESULTADO, OLD.OBSERVACIONES, OLD.ID_ANALISTA,
        USER(), NOW(), 'Se eliminó la cepa'
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `stock_cepas_auditoria`
--

DROP TABLE IF EXISTS `stock_cepas_auditoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock_cepas_auditoria` (
  `ID_AUDITORIA` int NOT NULL AUTO_INCREMENT,
  `ID_STOCK` int DEFAULT NULL,
  `MOO_ID` int DEFAULT NULL,
  `NUMERACION` int DEFAULT NULL,
  `FECHA_RECEPCION` date DEFAULT NULL,
  `FECHA_VTO` date DEFAULT NULL,
  `FECHA_RECONSTITUCION` date DEFAULT NULL,
  `ID_PRUEBAS` int DEFAULT NULL,
  `RESULTADO` varchar(500) DEFAULT NULL,
  `OBSERVACIONES` varchar(500) DEFAULT NULL,
  `ID_ANALISTA` int DEFAULT NULL,
  `USUARIO` varchar(100) DEFAULT NULL,
  `FECHA` datetime DEFAULT NULL,
  `ACCION` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`ID_AUDITORIA`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock_cepas_auditoria`
--

LOCK TABLES `stock_cepas_auditoria` WRITE;
/*!40000 ALTER TABLE `stock_cepas_auditoria` DISABLE KEYS */;
INSERT INTO `stock_cepas_auditoria` VALUES (1,14,1,2,'2024-07-10','2029-07-10',NULL,NULL,NULL,NULL,NULL,'root@localhost','2025-09-08 17:35:48','Se insertó nueva cepa'),(2,14,1,2,'2024-07-10','2029-07-10',NULL,NULL,NULL,NULL,NULL,'root@localhost','2025-09-08 17:39:17','Se eliminó la cepa');
/*!40000 ALTER TABLE `stock_cepas_auditoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `trazabilidad_cepa_trabajo`
--

DROP TABLE IF EXISTS `trazabilidad_cepa_trabajo`;
/*!50001 DROP VIEW IF EXISTS `trazabilidad_cepa_trabajo`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `trazabilidad_cepa_trabajo` AS SELECT 
 1 AS `CEPA`,
 1 AS `NUMERACION`,
 1 AS `NUMERO_ALICUOTA`,
 1 AS `NIVEL2`,
 1 AS `FECHA_ACTIVACION2`,
 1 AS `PRUEBA2`,
 1 AS `RESULTADO2`,
 1 AS `OBSERVACION2`,
 1 AS `FECHA_BAJA2`,
 1 AS `ANALISTA2`,
 1 AS `NIVEL3`,
 1 AS `FECHA_ACTIVACION3`,
 1 AS `PRUEBA3`,
 1 AS `RESULTADO3`,
 1 AS `OBSERVACION3`,
 1 AS `FECHA_BAJA3`,
 1 AS `ANALISTA3`,
 1 AS `NIVEL4`,
 1 AS `FECHA_ACTIVACION4`,
 1 AS `PRUEBA4`,
 1 AS `RESULTADO4`,
 1 AS `OBSERVACION4`,
 1 AS `FECHA_BAJA4`,
 1 AS `ANALISTA4`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `trazabilidad_preparacion_esterilizacion`
--

DROP TABLE IF EXISTS `trazabilidad_preparacion_esterilizacion`;
/*!50001 DROP VIEW IF EXISTS `trazabilidad_preparacion_esterilizacion`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `trazabilidad_preparacion_esterilizacion` AS SELECT 
 1 AS `FECHA_PREPARACION`,
 1 AS `PH`,
 1 AS `OBSERVACIONES`,
 1 AS `ANALISTA_PREPARACION`,
 1 AS `FECHA_CICLO`,
 1 AS `TIEMPO`,
 1 AS `TEMPERATURA`,
 1 AS `ANALISTA_ESTERILIZACION`,
 1 AS `MARCA`,
 1 AS `FECHA_CALIBRACION`,
 1 AS `VTO_CALIBRACION`,
 1 AS `FECHA_VERIFICACION`,
 1 AS `LECTURA_1`,
 1 AS `LECTURA_2`,
 1 AS `CUMPLE_AUTOCLAVE`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_trazabilidad_medios`
--

DROP TABLE IF EXISTS `v_trazabilidad_medios`;
/*!50001 DROP VIEW IF EXISTS `v_trazabilidad_medios`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_trazabilidad_medios` AS SELECT 
 1 AS `FECHA_PREPARACION`,
 1 AS `PH`,
 1 AS `OBSERVACIONES`,
 1 AS `ANALISTA_PREPARACION`,
 1 AS `MEDIO_NOMBRE`,
 1 AS `FABRICANTE`,
 1 AS `LOTE`,
 1 AS `VENCIMIENTO`,
 1 AS `FECHA_ECOMETRICO`,
 1 AS `ICA`,
 1 AS `ICE`,
 1 AS `RESULTADO_ECOMETRICO`,
 1 AS `FECHA_AGUA`,
 1 AS `CONTROL_AGUA`,
 1 AS `ANALISTA_AGUA`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'trazabilidad+antelo'
--
/*!50003 DROP FUNCTION IF EXISTS `dias_hasta_vencimiento` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `dias_hasta_vencimiento`(p_id_stock INT) RETURNS varchar(50) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    DECLARE v_fecha_vto DATE;
    DECLARE v_dias INT;
    DECLARE v_resultado VARCHAR(50);

    SELECT FECHA_VTO INTO v_fecha_vto
    FROM STOCK_CEPAS
    WHERE ID_STOCK = p_id_stock;

    SET v_dias = DATEDIFF(v_fecha_vto, CURDATE());

    IF v_dias > 0 THEN
        SET v_resultado = CONCAT(v_dias, ' días restantes');
    ELSE
        SET v_resultado = 'vencida';
    END IF;

    RETURN v_resultado;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `proxima_alicuota` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `proxima_alicuota`(p_id_stock INT) RETURNS int
    DETERMINISTIC
BEGIN
    DECLARE v_num INT;

    -- Busca la alícuota con el número más bajo que aún NO tenga fecha de reconstitución
    SELECT NUMERO_ALICUOTA
    INTO v_num
    FROM CEPA_RESERVA
    WHERE ID_STOCK = p_id_stock
      AND FECHA_RECONSTITUCION IS NULL
    ORDER BY NUMERO_ALICUOTA ASC
    LIMIT 1;

    -- Si no encuentra ninguna disponible, devuelve -1 como señal
    IF v_num IS NULL THEN
        RETURN 1;
    END IF;

    RETURN v_num;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `agregar_analista` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `agregar_analista`(
    IN p_nombre VARCHAR(100)
)
BEGIN
    DECLARE v_existente INT;

    -- Verificar si ya existe un analista con ese nombre
    SELECT COUNT(*) INTO v_existente
    FROM ANALISTA_FIRMA
    WHERE NOMBRE = p_nombre;

    IF v_existente = 0 THEN
        -- Insertar el nuevo analista
        INSERT INTO ANALISTA_FIRMA (NOMBRE)
        VALUES (p_nombre);
        SELECT 'Analista agregado correctamente' AS mensaje;
    ELSE
        SELECT 'El analista ya existe' AS mensaje;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `agregar_cepa` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `agregar_cepa`(
    IN p_nombre VARCHAR(100)
)
BEGIN
    DECLARE v_existente INT;

    -- Verificar si ya existe una cepa con ese nombre
    SELECT COUNT(*) INTO v_existente
    FROM CEPAS
    WHERE NOMBRE = p_nombre;

    IF v_existente = 0 THEN
        -- Insertar la nueva cepa
        INSERT INTO CEPAS (NOMBRE)
        VALUES (p_nombre);
        SELECT 'Cepa agregada correctamente' AS mensaje;
    ELSE
        SELECT 'La cepa ya existe' AS mensaje;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `agregar_prueba` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `agregar_prueba`(
    IN p_tipo VARCHAR(200)
)
BEGIN
    DECLARE v_existente INT;

    -- Verificar si ya existe una prueba con ese tipo
    SELECT COUNT(*) INTO v_existente
    FROM PRUEBAS_CEPAS
    WHERE TIPOS = p_tipo;

    IF v_existente = 0 THEN
        -- Insertar la nueva prueba
        INSERT INTO PRUEBAS_CEPAS (TIPOS)
        VALUES (p_tipo);
        SELECT 'Prueba agregada correctamente' AS mensaje;
    ELSE
        SELECT 'La prueba ya existe' AS mensaje;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `borrar_analista` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `borrar_analista`(
    IN p_nombre VARCHAR(100)
)
BEGIN
    DECLARE v_existente INT;

    -- Verificar si existe el analista
    SELECT COUNT(*) INTO v_existente
    FROM ANALISTA_FIRMA
    WHERE NOMBRE = p_nombre;

    IF v_existente > 0 THEN
        DELETE FROM ANALISTA_FIRMA
        WHERE NOMBRE = p_nombre;
        SELECT 'Analista eliminado correctamente' AS mensaje;
    ELSE
        SELECT 'El analista no existe en la base de datos' AS mensaje;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `borrar_cepa` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `borrar_cepa`(
    IN p_nombre VARCHAR(100)
)
BEGIN
    DECLARE v_existente INT;

    -- Verificar si existe la cepa
    SELECT COUNT(*) INTO v_existente
    FROM CEPAS
    WHERE NOMBRE = p_nombre;

    IF v_existente > 0 THEN
        DELETE FROM CEPAS
        WHERE NOMBRE = p_nombre;
        SELECT 'Cepa eliminada correctamente' AS mensaje;
    ELSE
        SELECT 'La cepa no existe en la base de datos' AS mensaje;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `borrar_prueba` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `borrar_prueba`(
    IN p_tipo VARCHAR(200)
)
BEGIN
    DECLARE v_existente INT;

    -- Verificar si existe la prueba
    SELECT COUNT(*) INTO v_existente
    FROM PRUEBAS_CEPAS
    WHERE TIPOS = p_tipo;

    IF v_existente > 0 THEN
        DELETE FROM PRUEBAS_CEPAS
        WHERE TIPOS = p_tipo;
        SELECT 'Prueba eliminada correctamente' AS mensaje;
    ELSE
        SELECT 'La prueba no existe en la base de datos' AS mensaje;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `cepas_no_vencidas_sin_usar`
--

/*!50001 DROP VIEW IF EXISTS `cepas_no_vencidas_sin_usar`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `cepas_no_vencidas_sin_usar` AS select `c`.`NOMBRE` AS `CEPA`,`s`.`NUMERACION` AS `NUMERACION`,`s`.`FECHA_RECEPCION` AS `FECHA_RECEPCION`,`s`.`FECHA_VTO` AS `FECHA_VTO`,`s`.`FECHA_RECONSTITUCION` AS `FECHA_RECONSTITUCION`,`s`.`RESULTADO` AS `RESULTADO`,`s`.`OBSERVACIONES` AS `OBSERVACIONES`,`a`.`NOMBRE` AS `ANALISTA` from ((`stock_cepas` `s` join `cepas` `c` on((`s`.`MOO_ID` = `c`.`MOO_ID`))) left join `analista_firma` `a` on((`s`.`ID_ANALISTA` = `a`.`ID_ANALISTA`))) where ((`s`.`FECHA_VTO` >= curdate()) and (`s`.`FECHA_RECONSTITUCION` is null)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `cepas_reconstituidas`
--

/*!50001 DROP VIEW IF EXISTS `cepas_reconstituidas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `cepas_reconstituidas` AS select `c`.`NOMBRE` AS `CEPA`,`s`.`NUMERACION` AS `NUMERACION`,`s`.`FECHA_RECEPCION` AS `FECHA_RECEPCION`,`s`.`FECHA_VTO` AS `FECHA_VTO`,`s`.`FECHA_RECONSTITUCION` AS `FECHA_RECONSTITUCION`,`s`.`RESULTADO` AS `RESULTADO`,`s`.`OBSERVACIONES` AS `OBSERVACIONES`,`a`.`NOMBRE` AS `ANALISTA` from ((`stock_cepas` `s` join `cepas` `c` on((`s`.`MOO_ID` = `c`.`MOO_ID`))) left join `analista_firma` `a` on((`s`.`ID_ANALISTA` = `a`.`ID_ANALISTA`))) where (`s`.`FECHA_RECONSTITUCION` is not null) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `cepas_reserva_no_reconstituidas`
--

/*!50001 DROP VIEW IF EXISTS `cepas_reserva_no_reconstituidas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `cepas_reserva_no_reconstituidas` AS select `r`.`NUMERO_ALICUOTA` AS `NUMERO_ALICUOTA`,`r`.`FECHA_RECONSTITUCION` AS `FECHA_RECONSTITUCION`,`c`.`NOMBRE` AS `CEPA`,`s`.`NUMERACION` AS `NUMERACION` from ((`cepa_reserva` `r` join `stock_cepas` `s` on((`r`.`ID_STOCK` = `s`.`ID_STOCK`))) join `cepas` `c` on((`s`.`MOO_ID` = `c`.`MOO_ID`))) where (`r`.`FECHA_RECONSTITUCION` is null) order by `c`.`NOMBRE`,`s`.`NUMERACION`,`r`.`NUMERO_ALICUOTA` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `cepas_reserva_reconstituidas`
--

/*!50001 DROP VIEW IF EXISTS `cepas_reserva_reconstituidas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `cepas_reserva_reconstituidas` AS select `r`.`NUMERO_ALICUOTA` AS `NUMERO_ALICUOTA`,`r`.`FECHA_RECONSTITUCION` AS `FECHA_RECONSTITUCION`,`o`.`DESCRIPCION` AS `OBSERVACION`,`a`.`NOMBRE` AS `ANALISTA`,`c`.`NOMBRE` AS `CEPA`,`s`.`NUMERACION` AS `NUMERACION` from ((((`cepa_reserva` `r` left join `observacion_reserva` `o` on((`r`.`ID_OBSERVACION` = `o`.`ID_OBSERVACION`))) left join `analista_firma` `a` on((`r`.`ID_ANALISTA` = `a`.`ID_ANALISTA`))) join `stock_cepas` `s` on((`r`.`ID_STOCK` = `s`.`ID_STOCK`))) join `cepas` `c` on((`s`.`MOO_ID` = `c`.`MOO_ID`))) where (`r`.`FECHA_RECONSTITUCION` is not null) order by `c`.`NOMBRE`,`s`.`NUMERACION`,`r`.`NUMERO_ALICUOTA` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `cepas_vencidas_sin_usar`
--

/*!50001 DROP VIEW IF EXISTS `cepas_vencidas_sin_usar`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `cepas_vencidas_sin_usar` AS select `c`.`NOMBRE` AS `CEPA`,`s`.`NUMERACION` AS `NUMERACION`,`s`.`FECHA_RECEPCION` AS `FECHA_RECEPCION`,`s`.`FECHA_VTO` AS `FECHA_VTO`,`s`.`FECHA_RECONSTITUCION` AS `FECHA_RECONSTITUCION`,`s`.`RESULTADO` AS `RESULTADO`,`s`.`OBSERVACIONES` AS `OBSERVACIONES`,`a`.`NOMBRE` AS `ANALISTA` from ((`stock_cepas` `s` join `cepas` `c` on((`s`.`MOO_ID` = `c`.`MOO_ID`))) left join `analista_firma` `a` on((`s`.`ID_ANALISTA` = `a`.`ID_ANALISTA`))) where ((`s`.`FECHA_VTO` < curdate()) and (`s`.`FECHA_RECONSTITUCION` is null)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `trazabilidad_cepa_trabajo`
--

/*!50001 DROP VIEW IF EXISTS `trazabilidad_cepa_trabajo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `trazabilidad_cepa_trabajo` AS select `c`.`NOMBRE` AS `CEPA`,`s`.`NUMERACION` AS `NUMERACION`,`r`.`NUMERO_ALICUOTA` AS `NUMERO_ALICUOTA`,`t2`.`NIVEL` AS `NIVEL2`,`t2`.`FECHA_ACTIVACION` AS `FECHA_ACTIVACION2`,`p2`.`TIPOS` AS `PRUEBA2`,`t2`.`RESULTADO` AS `RESULTADO2`,`o2`.`DESCRIPCION` AS `OBSERVACION2`,`t2`.`FECHA_BAJA` AS `FECHA_BAJA2`,`a2`.`NOMBRE` AS `ANALISTA2`,`t3`.`NIVEL` AS `NIVEL3`,`t3`.`FECHA_ACTIVACION` AS `FECHA_ACTIVACION3`,`p3`.`TIPOS` AS `PRUEBA3`,`t3`.`RESULTADO` AS `RESULTADO3`,`o3`.`DESCRIPCION` AS `OBSERVACION3`,`t3`.`FECHA_BAJA` AS `FECHA_BAJA3`,`a3`.`NOMBRE` AS `ANALISTA3`,`t4`.`NIVEL` AS `NIVEL4`,`t4`.`FECHA_ACTIVACION` AS `FECHA_ACTIVACION4`,`p4`.`TIPOS` AS `PRUEBA4`,`t4`.`RESULTADO` AS `RESULTADO4`,`o4`.`DESCRIPCION` AS `OBSERVACION4`,`t4`.`FECHA_BAJA` AS `FECHA_BAJA4`,`a4`.`NOMBRE` AS `ANALISTA4` from ((((((((((((((`cepa_reserva` `r` join `stock_cepas` `s` on((`r`.`ID_STOCK` = `s`.`ID_STOCK`))) join `cepas` `c` on((`s`.`MOO_ID` = `c`.`MOO_ID`))) left join `cepa_trabajo` `t2` on((`t2`.`ID_RESERVA_ORIGEN` = `r`.`ID_RESERVA`))) left join `pruebas_cepas` `p2` on((`t2`.`ID_PRUEBAS` = `p2`.`ID_PRUEBAS`))) left join `observacion_trabajo` `o2` on((`t2`.`ID_OBSERVACIONTRABAJO` = `o2`.`ID_OBSERVACIONTRABAJO`))) left join `analista_firma` `a2` on((`t2`.`ID_ANALISTA` = `a2`.`ID_ANALISTA`))) left join `cepa_trabajo` `t3` on((`t3`.`ID_TRABAJO_ORIGEN` = `t2`.`ID_TRABAJO`))) left join `pruebas_cepas` `p3` on((`t3`.`ID_PRUEBAS` = `p3`.`ID_PRUEBAS`))) left join `observacion_trabajo` `o3` on((`t3`.`ID_OBSERVACIONTRABAJO` = `o3`.`ID_OBSERVACIONTRABAJO`))) left join `analista_firma` `a3` on((`t3`.`ID_ANALISTA` = `a3`.`ID_ANALISTA`))) left join `cepa_trabajo` `t4` on((`t4`.`ID_TRABAJO_ORIGEN` = `t3`.`ID_TRABAJO`))) left join `pruebas_cepas` `p4` on((`t4`.`ID_PRUEBAS` = `p4`.`ID_PRUEBAS`))) left join `observacion_trabajo` `o4` on((`t4`.`ID_OBSERVACIONTRABAJO` = `o4`.`ID_OBSERVACIONTRABAJO`))) left join `analista_firma` `a4` on((`t4`.`ID_ANALISTA` = `a4`.`ID_ANALISTA`))) where (`t2`.`FECHA_ACTIVACION` is not null) order by `c`.`NOMBRE`,`s`.`NUMERACION`,`r`.`NUMERO_ALICUOTA`,`t2`.`NIVEL`,`t3`.`NIVEL`,`t4`.`NIVEL` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `trazabilidad_preparacion_esterilizacion`
--

/*!50001 DROP VIEW IF EXISTS `trazabilidad_preparacion_esterilizacion`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `trazabilidad_preparacion_esterilizacion` AS select `pmc`.`FECHA_PREPARACION` AS `FECHA_PREPARACION`,`pmc`.`PH` AS `PH`,`pmc`.`OBSERVACIONES` AS `OBSERVACIONES`,`af1`.`NOMBRE` AS `ANALISTA_PREPARACION`,`ec`.`FECHA` AS `FECHA_CICLO`,`ec`.`TIEMPO` AS `TIEMPO`,`ec`.`TEMPERATURA` AS `TEMPERATURA`,`af2`.`NOMBRE` AS `ANALISTA_ESTERILIZACION`,`eq`.`MARCA` AS `MARCA`,`eq`.`FECHA_CALIBRACION` AS `FECHA_CALIBRACION`,`eq`.`VTO_CALIBRACION` AS `VTO_CALIBRACION`,`av`.`FECHA` AS `FECHA_VERIFICACION`,`av`.`LECTURA_1` AS `LECTURA_1`,`av`.`LECTURA_2` AS `LECTURA_2`,`av`.`CUMPLE` AS `CUMPLE_AUTOCLAVE` from (((((`preparacion_medio_cultivo` `pmc` left join `esterilizacion` `ec` on((`pmc`.`ID_CICLO` = `ec`.`ID_CICLO`))) left join `equipos` `eq` on((`ec`.`ID_EQUIPO` = `eq`.`ID_EQUIPO`))) left join `autoclave_verif` `av` on((`eq`.`ID_EQUIPO` = `av`.`ID_EQUIPO`))) left join `analista_firma` `af1` on((`pmc`.`ID_ANALISTA` = `af1`.`ID_ANALISTA`))) left join `analista_firma` `af2` on((`ec`.`ID_ANALISTA` = `af2`.`ID_ANALISTA`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_trazabilidad_medios`
--

/*!50001 DROP VIEW IF EXISTS `v_trazabilidad_medios`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_trazabilidad_medios` AS select `pmc`.`FECHA_PREPARACION` AS `FECHA_PREPARACION`,`pmc`.`PH` AS `PH`,`pmc`.`OBSERVACIONES` AS `OBSERVACIONES`,`af2`.`NOMBRE` AS `ANALISTA_PREPARACION`,`mcs`.`NOMBRE` AS `MEDIO_NOMBRE`,`mcs`.`FABRICANTE` AS `FABRICANTE`,`mcs`.`LOTE` AS `LOTE`,`mcs`.`VENCIMIENTO` AS `VENCIMIENTO`,`ec`.`FECHA` AS `FECHA_ECOMETRICO`,`ec`.`ICA` AS `ICA`,`ec`.`ICE` AS `ICE`,`ec`.`RESULTADO` AS `RESULTADO_ECOMETRICO`,`ad`.`FECHA_ENTRADA` AS `FECHA_AGUA`,`ad`.`CONTROL` AS `CONTROL_AGUA`,`af1`.`NOMBRE` AS `ANALISTA_AGUA` from (((((`preparacion_medio_cultivo` `pmc` left join `medio_cultivo_stock` `mcs` on((`pmc`.`ID_MEDIO` = `mcs`.`ID_MEDIO`))) left join `ecometrico` `ec` on((`pmc`.`ID_ECOMETRICO` = `ec`.`ID_ECOMETRICO`))) left join `agua_dest` `ad` on((`pmc`.`ID_AGUA` = `ad`.`ID_AGUA`))) left join `analista_firma` `af1` on((`ad`.`ID_ANALISTA` = `af1`.`ID_ANALISTA`))) left join `analista_firma` `af2` on((`pmc`.`ID_ANALISTA` = `af2`.`ID_ANALISTA`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-09-19 17:33:25
