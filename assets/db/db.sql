-- MariaDB dump 10.19  Distrib 10.5.15-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: chatafisha_d3
-- ------------------------------------------------------
-- Server version	10.5.15-MariaDB-0+deb11u1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `blogpost`
--

DROP TABLE IF EXISTS `blogpost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blogpost` (
  `articleID` int(11) NOT NULL AUTO_INCREMENT,
  `userID` int(11) NOT NULL,
  `bl_status` int(11) DEFAULT 1,
  `title` varchar(128) NOT NULL,
  `blog_img` varchar(64) NOT NULL,
  `blog_description` text NOT NULL,
  `post_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`articleID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blogpost`
--

LOCK TABLES `blogpost` WRITE;
/*!40000 ALTER TABLE `blogpost` DISABLE KEYS */;
INSERT INTO `blogpost` VALUES (1,1,1,'plastic','assets/images/1682583043169~aset~carbon2.jpeg','A carbon footprint (or greenhouse gas footprint) Broken down by fuel type, the single largest source of global CO2 emissions is the consumption of coal, followed by petroleum, then natural gasBroken down by fuel type, the single largest source of global CO2 emissions is the consumption of coal, followed by petroleum, then natural gasis a \"certain amount of gaseous emissions that are relevant to climate change and associated with human ','2023-05-01 06:28:29'),(2,1,1,'plastic','assets/images/1682922533826~aset~ai_training.jpg','we are here to collect plastic and do somethiong good for our society','2023-05-01 06:28:53'),(3,2,1,'Inc fucha','assets/images/1682921077553~aset~parrot.jpg','In 2018 (eons ago .. in ML timelines), Cagatay Demiralp and I were both Scientists at IBM Research NY, and were curious about building ML tools that generate visualizations from data. Such tools are valuable for users who lack the expertise to ask the right questions, select the right visual encoding or create charts (either via code or GUI tools). Could we really give raw data to a trained ML model, and get a set of initial relevant visualizations, with zero user input? Ideally, if we were successful, it would mean a system that could learn about visualization best practices directly from vast amounts of example data, addressing limitations of existing systems that relied on heuristics for visualization generation','2023-05-01 06:04:37');
/*!40000 ALTER TABLE `blogpost` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plastic_collection`
--

DROP TABLE IF EXISTS `plastic_collection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plastic_collection` (
  `collectionID` int(11) NOT NULL AUTO_INCREMENT,
  `userID` int(11) NOT NULL,
  `centerID` int(11) NOT NULL,
  `type` varchar(64) NOT NULL,
  `qnty` int(11) NOT NULL,
  `collected_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`collectionID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plastic_collection`
--

LOCK TABLES `plastic_collection` WRITE;
/*!40000 ALTER TABLE `plastic_collection` DISABLE KEYS */;
INSERT INTO `plastic_collection` VALUES (1,10,1,'MO',500,'2023-04-24 11:01:12');
/*!40000 ALTER TABLE `plastic_collection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile`
--

DROP TABLE IF EXISTS `profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profile` (
  `profileID` int(11) NOT NULL AUTO_INCREMENT,
  `profile_img` varchar(128) DEFAULT NULL,
  `userID` int(11) NOT NULL,
  `uploaded_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`profileID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile`
--

LOCK TABLES `profile` WRITE;
/*!40000 ALTER TABLE `profile` DISABLE KEYS */;
/*!40000 ALTER TABLE `profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project` (
  `projectID` int(11) NOT NULL AUTO_INCREMENT,
  `userID` int(11) NOT NULL,
  `title` varchar(128) NOT NULL,
  `location` varchar(64) NOT NULL,
  `monit_period` varchar(32) NOT NULL,
  `vvb_contact` varchar(64) DEFAULT NULL,
  `verification_plan` varchar(128) DEFAULT NULL,
  `milestone` varchar(128) NOT NULL,
  `design_baseline` text NOT NULL,
  PRIMARY KEY (`projectID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` VALUES (1,1,'Nipe Fagio','Kijitonyama DSM','12','D-9054-EA12','verified','100M','Alex Krizhevsky is a Soviet Ukrainian-born Canadian computer scientist most noted for his work on artificial neural networks and deep learning. Shortly after having won the ImageNet challenge in 2012 with AlexNet, he and his colleagues sold their startup, DNN Research Inc., to Google');
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `userID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `registration_no` varchar(64) NOT NULL,
  `location` varchar(128) NOT NULL,
  `email` varchar(64) DEFAULT NULL,
  `phone_no` varchar(64) NOT NULL,
  `role` int(11) DEFAULT 0,
  `password` varchar(64) NOT NULL,
  `reg_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`userID`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'EDGAR JN','202202004530','CoICT-Mabatini','aset@gmail.com','0678730906',2,'aset123','2023-04-18 10:00:00'),(2,'ALEX JN','ALX-56F-GH','Moro-Town','alex@gmail.com','0678738934',2,'$2b$15$fmItP.IjN56TshpUEuK3FudylFPGvYFb.WYTHxLNvfSF9tFoKnYki','2023-04-27 08:47:02'),(3,'YUZZO MX','YU-34','DSM','yuzzo@gmail.com','0678738934',2,'$2b$15$N1nRpDQfBMlFEo3aWJfp5OpMHqAmB4wJxjoa7pY8rFvubwUlWOJda','2023-04-27 08:51:38');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-01 10:13:34
