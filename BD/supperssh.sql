-- MySQL dump 10.13  Distrib 5.5.62, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: supperssh
-- ------------------------------------------------------
-- Server version	5.5.62-0+deb8u1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

drop database if exists supperssh;
create database supperssh;

use supperssh;

--
-- Table structure for table `Utilisateur`
--

DROP TABLE IF EXISTS `Utilisateur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Utilisateur` (
  `login` varchar(10) NOT NULL,
  `mdp` varchar(25) NOT NULL,
  PRIMARY KEY (`login`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Composant`
--

LOCK TABLES `Utilisateur` WRITE;
/*!40000 ALTER TABLE `Utilisateur` DISABLE KEYS */;
INSERT INTO Utilisateur(login,mdp) VALUES ('a131','azerty');
/*!40000 ALTER TABLE `Utilisateur` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Admin`
--

DROP TABLE IF EXISTS `Admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Admin` (
  `login` varchar(10) NOT NULL,
  `mdp` varchar(25) NOT NULL,
  PRIMARY KEY (`login`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Admin`
--

LOCK TABLES `Admin` WRITE;
/*!40000 ALTER TABLE `Admin` DISABLE KEYS */;
INSERT INTO Admin(login,mdp) VALUES ('admin','azerty');
/*!40000 ALTER TABLE `Admin` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `Commande`
--

DROP TABLE IF EXISTS `Commande`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Commande` (
  `id` int(20) NOT NULL auto_increment,
  `saisie` varchar(250) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Commande`
--

LOCK TABLES `Commande` WRITE;
/*!40000 ALTER TABLE `Commande` DISABLE KEYS */;
INSERT INTO Commande(saisie) VALUES ('ifconfig');
/*!40000 ALTER TABLE `Commande` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Machine`
--

DROP TABLE IF EXISTS `Machine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Machine` (
  `id` int(20) NOT NULL auto_increment,
  `ip` varchar(20) NOT NULL,
  `mask` varchar(20) NOT NULL,
  `passerelle` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Machine`
--

LOCK TABLES `Machine` WRITE;
/*!40000 ALTER TABLE `Machine` DISABLE KEYS */;
INSERT INTO Machine(ip,mask,passerelle) VALUES ('192.168.0.80','255.255.255.0','192.168.0.1');
/*!40000 ALTER TABLE `Machine` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `RapportConnection`
--

DROP TABLE IF EXISTS `RapportConnection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RapportConnection` (
  `id` int(20) NOT NULL auto_increment,
  `date_heure` datetime NOT NULL,
  `reponse` varchar(255) DEFAULT NULL,
  `utilisateur` varchar(10) NOT NULL,
  `machine` int(20) NOT NULL,
  `commande` int(20) NOT NULL ,
  PRIMARY KEY (`id`),
  CONSTRAINT `FK_CONSTITUER_MACHINE` FOREIGN KEY (`machine`) REFERENCES `Machine` (`id`),
  CONSTRAINT `FK_CONSTITUER_COMMANDE` FOREIGN KEY (`commande`) REFERENCES `Commande` (`id`),
  CONSTRAINT `FK_CONSTITUER_UTILISATEUR` FOREIGN KEY (`utilisateur`) REFERENCES `Utilisateur` (`login`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RapportConnection`
--

LOCK TABLES `RapportConnection` WRITE;
/*!40000 ALTER TABLE `RapportConnection` DISABLE KEYS */;
INSERT INTO RapportConnection(date_heure, reponse, utilisateur, machine, commande) VALUES ('2023-04-18 12:30:00','erreur', 'a131',1,1);
/*!40000 ALTER TABLE `RapportConnection` ENABLE KEYS */;
UNLOCK TABLES;
