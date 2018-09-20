-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: hakaton
-- ------------------------------------------------------
-- Server version	5.7.21-log

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

--
-- Table structure for table `clanovi`
--

DROP TABLE IF EXISTS `clanovi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clanovi` (
  `idclan` int(11) NOT NULL AUTO_INCREMENT,
  `idtim` int(11) DEFAULT NULL,
  `ime` varchar(45) NOT NULL,
  `prezime` varchar(45) NOT NULL,
  `godiskustva` int(11) NOT NULL,
  `email` varchar(45) NOT NULL,
  PRIMARY KEY (`idclan`),
  KEY `idprijavaClan_idx` (`idtim`),
  CONSTRAINT `idprijavaClan` FOREIGN KEY (`idtim`) REFERENCES `timovi` (`idtim`) ON DELETE SET NULL ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clanovi`
--

LOCK TABLES `clanovi` WRITE;
/*!40000 ALTER TABLE `clanovi` DISABLE KEYS */;
INSERT INTO `clanovi` VALUES (1,2,'Una','Gvozdenov',2,'ug@gmail.com'),(2,2,'Marijana','Gajic',4,'mg@gmail.com'),(3,2,'Aleksandra','Grozdanoski',13,'ag@yahoo.com'),(4,13,'Milos','Milosevic',6,'mm@gmail.com'),(5,1,'Stefan','Stefanovic',7,'ss@gmail.com'),(6,2,'Nikola','Nikolic',4,'nn@outlook.com'),(7,4,'Petar','Petrovic',8,'pp@gmail.com'),(8,4,'Pera ','Peric',8,'ppp@gmail.com'),(9,4,'Vanja','Obradovic',6,'vo@gmail.com'),(10,4,'Marina','Rakic',11,'mr@gmail.com'),(11,1,'Jovana','Jovanovic',20,'jj@gmail.com'),(12,9,'Aleksandra','Aleksic',1,'aa@gmail.com'),(13,13,'Ana','Popovic',3,'ap@codeus.rs'),(14,9,'Teodora','Vukolic',5,'tvuk@codeus.rs'),(15,6,'Una','Gvozdenov',7,'ug@gmail.com'),(16,6,'Milos','Matkovic',7,'mm@gmail.com'),(17,6,'Marijana','Gajic',7,'m@gmail.com'),(18,13,'Aleksandra','Aleksic',2,'aa@gmail.com'),(25,9,'Jovan','Jovanovic',5,'jj@gmail.com');
/*!40000 ALTER TABLE `clanovi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gradovi`
--

DROP TABLE IF EXISTS `gradovi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gradovi` (
  `idgrad` int(11) NOT NULL AUTO_INCREMENT,
  `naziv` varchar(45) NOT NULL,
  PRIMARY KEY (`idgrad`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gradovi`
--

LOCK TABLES `gradovi` WRITE;
/*!40000 ALTER TABLE `gradovi` DISABLE KEYS */;
INSERT INTO `gradovi` VALUES (1,'Beograd'),(2,'Novi Sad'),(3,'Niš');
/*!40000 ALTER TABLE `gradovi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projekat`
--

DROP TABLE IF EXISTS `projekat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projekat` (
  `idprojekat` int(11) NOT NULL AUTO_INCREMENT,
  `idclan` int(11) NOT NULL,
  `naziv` varchar(45) NOT NULL,
  `tehnologije` varchar(45) NOT NULL,
  `opis` varchar(145) DEFAULT NULL,
  PRIMARY KEY (`idprojekat`),
  KEY `idprijavaProjekat_idx` (`idclan`),
  CONSTRAINT `idprijavaProjekat` FOREIGN KEY (`idclan`) REFERENCES `timovi` (`idtim`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projekat`
--

LOCK TABLES `projekat` WRITE;
/*!40000 ALTER TABLE `projekat` DISABLE KEYS */;
INSERT INTO `projekat` VALUES (1,4,'Projekat','',''),(2,2,'Projekat 1','',''),(3,2,'Projekat 2','','');
/*!40000 ALTER TABLE `projekat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timovi`
--

DROP TABLE IF EXISTS `timovi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `timovi` (
  `idtim` int(11) NOT NULL AUTO_INCREMENT,
  `nazivtima` varchar(45) CHARACTER SET utf8 COLLATE utf8_slovenian_ci NOT NULL,
  `napomena` varchar(45) CHARACTER SET utf8 COLLATE utf8_slovenian_ci DEFAULT NULL,
  `username` varchar(45) CHARACTER SET utf8 COLLATE utf8_slovenian_ci NOT NULL,
  `password` varchar(45) CHARACTER SET utf8 COLLATE utf8_slovenian_ci NOT NULL,
  `idgrad` int(11) DEFAULT NULL,
  `brojtakmicenja` varchar(45) DEFAULT NULL,
  `brojclanova` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idtim`),
  KEY `idgradPrijava_idx` (`idgrad`),
  CONSTRAINT `idgradPrijava` FOREIGN KEY (`idgrad`) REFERENCES `gradovi` (`idgrad`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timovi`
--

LOCK TABLES `timovi` WRITE;
/*!40000 ALTER TABLE `timovi` DISABLE KEYS */;
INSERT INTO `timovi` VALUES (1,'clojure','clojure ','clojure123','code',1,'2','4'),(2,'Tim1','pobednici na 2 hakatona','tim1','tim1',1,'2','4'),(4,'Tim3','web tehnologije','tim3','tim3',3,'0','4'),(6,'Tim 5','funkcionalno programiranje','tim5','tim5',1,'8','3'),(9,'Tim 6','UI/IX design','tim6','k',2,'4','4'),(13,'Tim 7','android aplikacije','tim7','2',2,'2','2');
/*!40000 ALTER TABLE `timovi` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-09-20 12:33:17
