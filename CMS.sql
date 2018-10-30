-- MySQL dump 10.13  Distrib 8.0.13, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: cms
-- ------------------------------------------------------
-- Server version	8.0.13

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `accounts` (
  `account_id` int(11) NOT NULL AUTO_INCREMENT,
  `un` varchar(255) NOT NULL,
  `pw` varchar(255) NOT NULL,
  `email` varchar(45) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `role` int(11) DEFAULT NULL,
  `contact_no` int(11) DEFAULT NULL,
  PRIMARY KEY (`account_id`),
  UNIQUE KEY `un_UNIQUE` (`un`),
  KEY `role_2_role_key_idx` (`role`),
  CONSTRAINT `role_2_role_key` FOREIGN KEY (`role`) REFERENCES `roles` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts`
--

LOCK TABLES `accounts` WRITE;
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
INSERT INTO `accounts` VALUES (1,'admin','password','test@test.com','tester',2,95550330),(2,'emailtest','pass','pbh928@hotmail.com','PMO',1,88888888);
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `agency`
--

DROP TABLE IF EXISTS `agency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `agency` (
  `agency_id` int(11) NOT NULL AUTO_INCREMENT,
  `agency_name` varchar(255) DEFAULT NULL,
  `agency_contactno` int(11) DEFAULT NULL,
  `agency_email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`agency_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agency`
--

LOCK TABLES `agency` WRITE;
/*!40000 ALTER TABLE `agency` DISABLE KEYS */;
INSERT INTO `agency` VALUES (1,'Test_Agency',99999999,'cmsservices.gov@gmail.com '),(2,'SCDF',555,'SCDF@test'),(3,'Singapore Power',666,'SP@gov.net');
/*!40000 ALTER TABLE `agency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assistance`
--

DROP TABLE IF EXISTS `assistance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `assistance` (
  `assistance_id` int(11) NOT NULL,
  `assistance_name` varchar(155) DEFAULT NULL,
  `assistance_provider` int(11) DEFAULT NULL,
  PRIMARY KEY (`assistance_id`),
  KEY `assistance_provider_idx` (`assistance_provider`),
  CONSTRAINT `assistance_provider` FOREIGN KEY (`assistance_provider`) REFERENCES `agency` (`agency_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assistance`
--

LOCK TABLES `assistance` WRITE;
/*!40000 ALTER TABLE `assistance` DISABLE KEYS */;
INSERT INTO `assistance` VALUES (1,'Emergency Ambulance	',2),(2,'Rescue and Evacuation',2),(3,'Fire-Fighting',2),(4,'Gas Leak Control',3);
/*!40000 ALTER TABLE `assistance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assistance_requests`
--

DROP TABLE IF EXISTS `assistance_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `assistance_requests` (
  `report_id` int(11) NOT NULL,
  `assistance_needed_id` int(11) NOT NULL,
  PRIMARY KEY (`report_id`,`assistance_needed_id`),
  KEY `assistance_fk_idx` (`assistance_needed_id`),
  CONSTRAINT `assistance_fk` FOREIGN KEY (`assistance_needed_id`) REFERENCES `assistance` (`assistance_id`),
  CONSTRAINT `report_fk` FOREIGN KEY (`report_id`) REFERENCES `inreport` (`report_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assistance_requests`
--

LOCK TABLES `assistance_requests` WRITE;
/*!40000 ALTER TABLE `assistance_requests` DISABLE KEYS */;
INSERT INTO `assistance_requests` VALUES (1,1),(1,3),(1,4);
/*!40000 ALTER TABLE `assistance_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inreport`
--

DROP TABLE IF EXISTS `inreport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `inreport` (
  `report_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `contactno` varchar(45) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `lat` varchar(45) DEFAULT NULL,
  `lng` varchar(45) DEFAULT NULL,
  `timereported` varchar(255) DEFAULT NULL,
  `lastupdated` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  PRIMARY KEY (`report_id`),
  KEY `status2report_idx` (`status`),
  KEY `type2report_idx` (`type`),
  CONSTRAINT `status2report` FOREIGN KEY (`status`) REFERENCES `status` (`status_id`),
  CONSTRAINT `type2report` FOREIGN KEY (`type`) REFERENCES `type` (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inreport`
--

LOCK TABLES `inreport` WRITE;
/*!40000 ALTER TABLE `inreport` DISABLE KEYS */;
INSERT INTO `inreport` VALUES (1,'test','bo chup','639798 50 Nanyang Ave Singapore 639798','HELP GAS EXPROSSION KILL BIG BIG','78901234','BO@CHUP.net','1.3492007','103.6876833',NULL,NULL,1,3),(2,'test','bo chup2','61 Cho Chu Kang Loop Singapore 689668','TERRORIST brought chewing gumss into SINGAPORE!!','01293127','BO@CHUP2.net.com','1.3875402','103.7452',NULL,NULL,1,2),(3,'test','bo chup3','Airport Blvd Changi Airport Singapore (SIN) Singapore','Its raining fireballs!!','0123541122','BO@CHUP3.net.com','1.3644202','103.9915308','','',2,1),(11,'test','bo chup4','238 Thomson Rd Singapore 307683','Too Much DURIANS!!','012321332','BO@CHUP4.net.com','1.3199153','103.8439456',NULL,NULL,3,2),(12,'test','bo chup5','180 Ang Mo Kio Ave 8 Singapore 569830','students gone wild!!','81278677','BO@CHUP5.net.com','1.3800709','103.8490213',NULL,NULL,2,1);
/*!40000 ALTER TABLE `inreport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `psi`
--

DROP TABLE IF EXISTS `psi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `psi` (
  `psicontrol` int(11) NOT NULL AUTO_INCREMENT,
  `current` int(11) DEFAULT NULL,
  `3hours` int(11) DEFAULT NULL,
  `12hours` int(11) DEFAULT NULL,
  `24hours` int(11) DEFAULT NULL,
  `lastupdated` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`psicontrol`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `psi`
--

LOCK TABLES `psi` WRITE;
/*!40000 ALTER TABLE `psi` DISABLE KEYS */;
INSERT INTO `psi` VALUES (1,101,120,101,110,NULL);
/*!40000 ALTER TABLE `psi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `roles` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(65) NOT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'PMO'),(2,'Admin'),(3,'Operator');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `status` (
  `status_id` int(11) NOT NULL AUTO_INCREMENT,
  `status_name` varchar(145) DEFAULT NULL,
  PRIMARY KEY (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status`
--

LOCK TABLES `status` WRITE;
/*!40000 ALTER TABLE `status` DISABLE KEYS */;
INSERT INTO `status` VALUES (1,'Active'),(2,'Interim'),(3,'Completed'),(4,'Warning');
/*!40000 ALTER TABLE `status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type`
--

DROP TABLE IF EXISTS `type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `type` (
  `type_id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(95) DEFAULT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type`
--

LOCK TABLES `type` WRITE;
/*!40000 ALTER TABLE `type` DISABLE KEYS */;
INSERT INTO `type` VALUES (1,'Terrorist Attack'),(2,'Fire'),(3,'Gas Leak'),(4,'Car Collision');
/*!40000 ALTER TABLE `type` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-10-30  9:00:36
