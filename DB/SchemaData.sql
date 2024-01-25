-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: agenda2
-- ------------------------------------------------------
-- Server version	8.0.35

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
-- Table structure for table `contactos`
--

DROP TABLE IF EXISTS `contactos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contactos` (
  `idContacto` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `edad` tinyint NOT NULL,
  PRIMARY KEY (`idContacto`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contactos`
--

LOCK TABLES `contactos` WRITE;
/*!40000 ALTER TABLE `contactos` DISABLE KEYS */;
INSERT INTO `contactos` VALUES (1,'Johan','johanoriginalplus@gmail.com',22),(5,'Libardo','libardo@email.com',25),(6,'Libardo','libardo@email.com',25),(7,'Libardo','libardo@email.com',25),(12,'Johaaaan','johanoriginalpluss@gmail.com',22),(13,'Johaaaan','johanoriginalpluss@gmail.com',30),(14,'Johaaaan','johanoriginalpluss@gmail.com',30),(15,'Johaaaan','johanoriginalpluss@gmail.com',31),(16,'Johaaaan','johanoriginalpluss@gmail.com',31),(17,'Johaaaan','johanoriginalpluss@gmail.com',33),(18,'Johaaaan','johanoriginalpluss@gmail.com',33),(19,'Eder','Eder@email.com',25),(20,'Dubi','dubi@mail.com',18),(21,'Dubi','dubi@mail.com',18),(22,'Daba','dubi@mail.com',19),(23,'praca','dubi@mail.com',19),(24,'trakaaa','dubi@mail.com',19),(25,'pruebasasa','dubi@mail.com',20),(26,'esteban','dubi@mail.com',20),(27,'Ederr','Eder@email.com',25),(28,'Ederito','dubi@mail.com',21),(29,'Ederito','dubi@mail.com',21),(30,'Laura','dubi@mail.com',22),(31,'duby','dubu',22),(32,'Ederr','Alta@email.com',27),(33,'Ederrr','Alta@email.com',27),(34,'Ederrr','Alta@email.com',27),(35,'Ederrr','Alta@email.com',27),(36,'Ederrr','Alta@email.com',27),(37,'Ederrr','Alta@email.com',27),(38,'Ederrr','Alta@email.com',27),(39,'Ederrr','Alta@email.com',27),(40,'Ederrr','Alta@email.com',27),(41,'Johan','johanoriginalplus@gmail.com',22),(42,'Johan','johanoriginalplus@gmail.com',22),(43,'Johan','johanoriginalplus@gmail.com',22),(44,'Johan','johanoriginalplus@gmail.com',22),(45,'Johan','johanoriginalplus@gmail.com',22),(46,'Johan','johanoriginalplus@gmail.com',22),(47,'Johan','johanoriginalplus@gmail.com',22),(48,'Johan','johanoriginalplus@gmail.com',22);
/*!40000 ALTER TABLE `contactos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol`
--

DROP TABLE IF EXISTS `rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rol` (
  `rol` varchar(50) NOT NULL,
  `user` varchar(100) NOT NULL,
  PRIMARY KEY (`rol`,`user`),
  KEY `user_idx` (`user`),
  CONSTRAINT `user` FOREIGN KEY (`user`) REFERENCES `users` (`user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol`
--

LOCK TABLES `rol` WRITE;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
INSERT INTO `rol` VALUES ('ROLE_ADMIN','admin'),('ROLE_USER','admin'),('ROLE_USER','user1'),('ROLE_OPERADOR','user2');
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user` varchar(100) NOT NULL,
  `password` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('admin','$2a$12$lpR3dXkA86CrODhnSJk6rO53PDC9.wStNr0nRNwiFbNmfQuIBKUvi'),('user1','$2a$12$HxMPquOuT2/1La6yRg/4u.fGFajHYx6XoTrSiQeolyg3MP/ehcOiG'),('user2','$2a$12$vc74r7.WmP1osKNv4abmIe8SNhaCZBqwzUKz1fqw5iRLxqY1oItPS');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-24 11:57:02
