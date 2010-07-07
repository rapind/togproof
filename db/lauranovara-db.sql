-- MySQL dump 10.13  Distrib 5.1.41, for debian-linux-gnu (i486)
--
-- Host: localhost    Database: lauranovara-db
-- ------------------------------------------------------
-- Server version	5.1.41-3ubuntu12.3

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
-- Table structure for table `bookings`
--

DROP TABLE IF EXISTS `bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bookings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `title` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `occurs_on` date DEFAULT NULL,
  `expires_on` date DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `ready` tinyint(1) DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookings`
--

LOCK TABLES `bookings` WRITE;
/*!40000 ALTER TABLE `bookings` DISABLE KEYS */;
INSERT INTO `bookings` VALUES (1,1,'Newborn Session','2010-05-12','2010-05-26',NULL,NULL,NULL,'2010-06-02 14:06:52','2010-06-02 14:06:52'),(2,1,'Family Session','2010-06-16','2010-06-30',NULL,NULL,NULL,'2010-06-02 14:06:52','2010-06-02 14:06:52');
/*!40000 ALTER TABLE `bookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `photographer_id` int(11) NOT NULL,
  `name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `crypted_password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_salt` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `persistence_token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `single_access_token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `perishable_token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `login_count` int(11) NOT NULL DEFAULT '0',
  `failed_login_count` int(11) NOT NULL DEFAULT '0',
  `last_request_at` datetime DEFAULT NULL,
  `current_login_at` datetime DEFAULT NULL,
  `last_login_at` datetime DEFAULT NULL,
  `current_login_ip` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_login_ip` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `street_1` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `street_2` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `postal_code` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `province` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_clients_on_email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` VALUES (1,1,'Demo Client','client@grokphoto.org','5fa6682831e85e2b44a3047cdf96e5703eb31132a60d2b3d5129a065a6034eddd17f0e4f27f0ccbbac55d123ddedbcea813586194caddc898a6eb12d11878e4a','dquo2UQgu_fstDwXipcQ','ab93be60519fe415307a0e70ad71c1d7c8342b8a145a35ca343960a8bf0a4ce5186a103057d0e0376d70294e815ac9bfed178bd13514452970e50bb85edebfa6','IzuqS7_6BB-N-4pukhuo','NOSt_xj4aAa0BENkiRU-',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2010-06-02 14:06:52','2010-06-02 14:06:52');
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `galleries`
--

DROP TABLE IF EXISTS `galleries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `galleries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `photographer_id` int(11) NOT NULL,
  `position` int(11) NOT NULL DEFAULT '1',
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `keywords` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `image_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image_file_size` int(11) DEFAULT NULL,
  `image_updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `cached_slug` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `galleries`
--

LOCK TABLES `galleries` WRITE;
/*!40000 ALTER TABLE `galleries` DISABLE KEYS */;
INSERT INTO `galleries` VALUES (5,1,1,'Jewels','Furla watch','Fine Art Jewels & Still Life','3229761180_a118d0c3d4_o.jpg','image/jpeg',117467,'2010-06-02 14:14:03','2010-06-02 14:14:10','2010-06-02 14:14:10','jewels'),(6,1,2,'Piglet stories','piglet','Trips & meets: NYC and something else.\r\n','3216679972_bc554cbb6d_b.jpg','image/jpeg',242726,'2010-06-19 19:33:48','2010-06-19 19:33:49','2010-06-20 17:09:06','piglet-stories');
/*!40000 ALTER TABLE `galleries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gallery_photos`
--

DROP TABLE IF EXISTS `gallery_photos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gallery_photos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gallery_id` int(11) NOT NULL,
  `position` int(11) NOT NULL DEFAULT '1',
  `title` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `featured` tinyint(1) NOT NULL DEFAULT '1',
  `featured_position` int(11) NOT NULL DEFAULT '1',
  `image_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image_file_size` int(11) DEFAULT NULL,
  `image_updated_at` datetime DEFAULT NULL,
  `width` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `camera_brand` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `camera_model` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `exposure_time` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `f_number` float DEFAULT NULL,
  `iso_speed_rating` int(11) DEFAULT NULL,
  `focal_length` float DEFAULT NULL,
  `shot_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gallery_photos`
--

LOCK TABLES `gallery_photos` WRITE;
/*!40000 ALTER TABLE `gallery_photos` DISABLE KEYS */;
INSERT INTO `gallery_photos` VALUES (53,5,1,'3163074353 3049c233ea O',1,1,'3163074353_3049c233ea_o.jpg','image/jpeg',234534,'2010-06-02 14:14:46',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2010-06-02 14:14:52','2010-06-02 14:14:52'),(54,5,2,'3163882786 E922f26205 O',1,1,'3163882786_e922f26205_o.jpg','image/jpeg',246421,'2010-06-02 14:15:03',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2010-06-02 14:15:06','2010-06-02 14:15:06'),(55,5,3,'3163895114 693c20db62 O',1,1,'3163895114_693c20db62_o.jpg','image/jpeg',134876,'2010-06-02 14:15:32',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2010-06-02 14:15:35','2010-06-02 14:15:35'),(56,5,4,'3184055451 280a280082 O',1,1,'3184055451_280a280082_o.jpg','image/jpeg',78759,'2010-06-02 14:15:58',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2010-06-02 14:15:59','2010-06-02 14:15:59'),(57,5,5,'3206397273 Ef12ab7880 O',1,1,'3206397273_ef12ab7880_o.jpg','image/jpeg',341493,'2010-06-02 14:16:24',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2010-06-02 14:16:27','2010-06-02 14:16:27'),(58,5,6,'4372869029 35da4576d4 O',1,1,'4372869029_35da4576d4_o.jpg','image/jpeg',98486,'2010-06-02 14:16:43',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2010-06-02 14:16:45','2010-06-02 14:16:45'),(59,5,7,'4372880855 4a48f27cb0 O',1,1,'4372880855_4a48f27cb0_o.jpg','image/jpeg',127339,'2010-06-02 14:17:19',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2010-06-02 14:17:22','2010-06-02 14:17:22'),(60,5,8,'Mauroleone 275x200',1,1,'mauroleone_275x200.jpg','image/jpeg',77704,'2010-06-02 14:17:44',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2010-06-02 14:17:45','2010-06-02 14:17:45'),(61,6,1,'3016455288 546e7e05b9 B',1,1,'3016455288_546e7e05b9_b.jpg','image/jpeg',161544,'2010-06-19 19:40:00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2010-06-19 19:40:01','2010-06-19 19:40:01'),(62,6,2,'3215828287 36f3b2f28b O',1,1,'3215828287_36f3b2f28b_o.jpg','image/jpeg',77748,'2010-06-19 19:40:27',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2010-06-19 19:40:28','2010-06-19 19:40:28'),(64,6,3,'3016459780 15acedb369 O',1,1,'3016459780_15acedb369_o.jpg','image/jpeg',80649,'2010-06-20 16:28:22',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2010-06-20 16:28:23','2010-06-20 16:28:23'),(65,6,4,'3215828025 47776fb389 B',1,1,'3215828025_47776fb389_b.jpg','image/jpeg',149281,'2010-06-20 16:32:16',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2010-06-20 16:32:17','2010-06-20 16:32:17'),(66,6,5,'3016459904 E32fe6485d O',1,1,'3016459904_e32fe6485d_o.jpg','image/jpeg',41662,'2010-06-20 16:34:22',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2010-06-20 16:34:23','2010-06-20 16:34:23'),(68,6,6,'3016460432 6289dbd7f3 O',1,1,'3016460432_6289dbd7f3_o.jpg','image/jpeg',61174,'2010-06-20 16:38:35',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2010-06-20 16:38:36','2010-06-20 16:38:36'),(69,6,7,'3015619029 F772256798 O',1,1,'3015619029_f772256798_o.jpg','image/jpeg',41923,'2010-06-20 17:11:08',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2010-06-20 17:11:10','2010-06-20 17:11:10'),(70,6,8,'3015622245 F683fb6be4 O',1,1,'3015622245_f683fb6be4_o.jpg','image/jpeg',98265,'2010-06-20 17:11:15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2010-06-20 17:11:16','2010-06-20 17:11:16'),(71,6,9,'3015623581 96fa2e2ff7 O',1,1,'3015623581_96fa2e2ff7_o.jpg','image/jpeg',54106,'2010-06-20 17:11:23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2010-06-20 17:11:24','2010-06-20 17:11:24'),(72,6,10,'3016457404 8c8b3c9561 O',1,1,'3016457404_8c8b3c9561_o.jpg','image/jpeg',71131,'2010-06-20 17:11:34',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2010-06-20 17:11:35','2010-06-20 17:11:35'),(73,6,11,'3016457692 D2960823ce O',1,1,'3016457692_d2960823ce_o.jpg','image/jpeg',57721,'2010-06-20 17:11:46',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2010-06-20 17:11:47','2010-06-20 17:11:47'),(74,6,12,'3016458444 F2c85c7f3a O',1,1,'3016458444_f2c85c7f3a_o.jpg','image/jpeg',59229,'2010-06-20 17:11:55',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2010-06-20 17:11:56','2010-06-20 17:11:56'),(75,6,13,'3016460950 C4e617923b O',1,1,'3016460950_c4e617923b_o.jpg','image/jpeg',56718,'2010-06-20 17:30:37',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2010-06-20 17:30:38','2010-06-20 17:30:38');
/*!40000 ALTER TABLE `gallery_photos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `package_product_sizes`
--

DROP TABLE IF EXISTS `package_product_sizes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `package_product_sizes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `package_id` int(11) NOT NULL,
  `product_size_id` int(11) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `package_product_sizes`
--

LOCK TABLES `package_product_sizes` WRITE;
/*!40000 ALTER TABLE `package_product_sizes` DISABLE KEYS */;
/*!40000 ALTER TABLE `package_product_sizes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `packages`
--

DROP TABLE IF EXISTS `packages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `packages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `photographer_id` int(11) NOT NULL,
  `position` int(11) NOT NULL DEFAULT '1',
  `title` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `packages`
--

LOCK TABLES `packages` WRITE;
/*!40000 ALTER TABLE `packages` DISABLE KEYS */;
INSERT INTO `packages` VALUES (1,1,1,'Collection 1','100.00',1,'2010-06-02 14:07:12','2010-06-02 14:07:12'),(2,1,2,'Collection 2','150.00',1,'2010-06-02 14:07:12','2010-06-02 14:07:12'),(3,1,3,'Collection 3','250.00',1,'2010-06-02 14:07:12','2010-06-02 14:07:12');
/*!40000 ALTER TABLE `packages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `photographer_id` int(11) NOT NULL,
  `position` int(11) NOT NULL DEFAULT '1',
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `intro` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `keywords` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `image_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image_file_size` int(11) DEFAULT NULL,
  `image_updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `cached_slug` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages`
--

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` VALUES (2,1,1,'About','Hi and welcome to my photo gallery ...','about photography, photo, gallery, still life','I\'m an aspirant writer, photographer, blogger, chronic procrastinator in pursuit of happyness. ','4591931573_e1c72178be.jpg','image/jpeg',25190,'2010-06-28 19:40:22','2010-06-28 19:30:42','2010-06-28 19:40:22','about');
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `photo_comments`
--

DROP TABLE IF EXISTS `photo_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `photo_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `photo_id` int(11) NOT NULL,
  `client_id` int(11) DEFAULT NULL,
  `photographer_id` int(11) DEFAULT NULL,
  `body` varchar(2000) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `photo_comments`
--

LOCK TABLES `photo_comments` WRITE;
/*!40000 ALTER TABLE `photo_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `photo_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `photographers`
--

DROP TABLE IF EXISTS `photographers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `photographers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `crypted_password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_salt` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `persistence_token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `single_access_token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `perishable_token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `login_count` int(11) NOT NULL DEFAULT '0',
  `failed_login_count` int(11) NOT NULL DEFAULT '0',
  `current_login_at` datetime DEFAULT NULL,
  `last_login_at` datetime DEFAULT NULL,
  `current_login_ip` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_login_ip` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `company_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `site_url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `company_email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `company_phone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `blog_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `facebook_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `twitter_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `google_analytics_key` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `google_verification_key` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `theme` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'default',
  `use_watermark` tinyint(1) NOT NULL DEFAULT '0',
  `watermark_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `watermark_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `watermark_file_size` int(11) DEFAULT NULL,
  `watermark_updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `home_page_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_photographers_on_email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `photographers`
--

LOCK TABLES `photographers` WRITE;
/*!40000 ALTER TABLE `photographers` DISABLE KEYS */;
INSERT INTO `photographers` VALUES (1,'novara.laura@gmail.com','943bee3db7d0c0ae2e994409d42a48f0add9f9304a086e9a214cd2128e9a512194528777b7c16294081edbaf2321609547ad22f7c277cee3d98c0ed16441564a','xosmUL6Y8kbUqk8-nlwP','d0a83f7c3eced3fef1d173d2c7103c0e1ea2563ea111a3f33afd38820038e52b2ce887dfc5e68b7e0ab24cbd8a19f4681f2fd3ef91a9f15ae892fbf111cc27db','BNFI62NDCmeOi0xRRJnW','S2SC7bpnQZ5SwUNkrg6f',7,0,'2010-07-07 13:39:48','2010-06-27 21:16:13','127.0.0.1','127.0.0.1','Laura Novara Photography','http://novaralaura.com','','','http://lauranovara.tumblr.com/','','http://twitter.com/elleenne','','','default_with_flash_paty',0,'watermark.png','image/png',8569,'2010-06-02 14:06:50','2010-06-02 14:06:50','2010-07-07 14:05:37','Laura Novara Photography'),(2,'photographer@grokphoto.org','c7ad9107befd591ae1b3145f1b3ab443a50496dbda9a0e475cf45c8c10b50fa8f27eb882e4e78ff622c745d39da3e348e82d9b02b296c35b5292a245262734f4','8P8wvfhhXRWflYQ21nli','fb0dc6b8b9813eb851683ec8f36bc4905bfbeccf7c050f8dc24360b417168cce9912415ec389ee25503618a285c4ed43105787cff79755a7299e0288017970e7','ds9wRRm08_Z7EzNE96Le','rNYQBkhxQQc46sLxXntF',0,0,NULL,NULL,NULL,NULL,'GrokPhoto','http://demo.grokphoto.org','info@grokphoto.org',NULL,'http://rapin.com',NULL,NULL,'UA-2450369-23','n4L_tj44fmy3dxPuLamOqAkrjRP7GW-ehMzRcN6mjM0','default',0,'watermark.png','image/png',8569,'2010-06-19 19:38:03','2010-06-19 19:38:03','2010-06-19 19:38:04','Open-source Photography');
/*!40000 ALTER TABLE `photographers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `photos`
--

DROP TABLE IF EXISTS `photos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `photos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `booking_id` int(11) NOT NULL,
  `title` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `image_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image_file_size` int(11) DEFAULT NULL,
  `image_updated_at` datetime DEFAULT NULL,
  `width` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `camera_brand` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `camera_model` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `exposure_time` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `f_number` float DEFAULT NULL,
  `iso_speed_rating` int(11) DEFAULT NULL,
  `focal_length` float DEFAULT NULL,
  `shot_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `photos`
--

LOCK TABLES `photos` WRITE;
/*!40000 ALTER TABLE `photos` DISABLE KEYS */;
/*!40000 ALTER TABLE `photos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_sizes`
--

DROP TABLE IF EXISTS `product_sizes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_sizes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `position` int(11) NOT NULL DEFAULT '1',
  `title` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_sizes`
--

LOCK TABLES `product_sizes` WRITE;
/*!40000 ALTER TABLE `product_sizes` DISABLE KEYS */;
INSERT INTO `product_sizes` VALUES (1,1,1,'3x5','3.99','2010-06-02 14:07:13','2010-06-02 14:07:13'),(2,1,2,'5x8','5.99','2010-06-02 14:07:13','2010-06-02 14:07:13'),(3,1,3,'8x11','9.99','2010-06-02 14:07:13','2010-06-02 14:07:13'),(4,1,4,'Digital - Low Res','10.99','2010-06-02 14:07:13','2010-06-02 14:07:13'),(5,1,5,'Digital - High Res','25.99','2010-06-02 14:07:13','2010-06-02 14:07:13');
/*!40000 ALTER TABLE `product_sizes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `photographer_id` int(11) NOT NULL,
  `position` int(11) NOT NULL DEFAULT '1',
  `title` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `image_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image_file_size` int(11) DEFAULT NULL,
  `image_updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,1,1,'Print',NULL,1,NULL,NULL,NULL,NULL,'2010-06-02 14:07:12','2010-06-02 14:07:12'),(2,1,2,'Album',NULL,1,NULL,NULL,NULL,NULL,'2010-06-02 14:07:12','2010-06-02 14:07:12'),(3,1,3,'Card',NULL,1,NULL,NULL,NULL,NULL,'2010-06-02 14:07:12','2010-06-02 14:07:12');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quotes`
--

DROP TABLE IF EXISTS `quotes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quotes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `photographer_id` int(11) NOT NULL,
  `position` int(11) NOT NULL DEFAULT '1',
  `author` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `body` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quotes`
--

LOCK TABLES `quotes` WRITE;
/*!40000 ALTER TABLE `quotes` DISABLE KEYS */;
INSERT INTO `quotes` VALUES (2,1,1,'by Nicole  Digital Photography School ','DP Assignment ... The bright, light colours not only fit in with the idea of being high tech, they also convey a feeling of lightness and happiness ... \r\n\r\nRead more: http://tinyurl.com/2fej868','2010-06-28 19:17:50','2010-06-28 19:25:12');
/*!40000 ALTER TABLE `quotes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20100112143336'),('20100112143341'),('20100112205703'),('20100115230942'),('20100117182247'),('20100119153613'),('20100119154100'),('20100120231854'),('20100131223834'),('20100215224920'),('20100220172209'),('20100305023637'),('20100305023722'),('20100305023814'),('20100305025241'),('20100424151009');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slugs`
--

DROP TABLE IF EXISTS `slugs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `slugs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sluggable_id` int(11) DEFAULT NULL,
  `sequence` int(11) NOT NULL DEFAULT '1',
  `sluggable_type` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `scope` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_slugs_on_name_and_sluggable_type_and_scope_and_sequence` (`name`,`sluggable_type`,`scope`,`sequence`),
  KEY `index_slugs_on_sluggable_id` (`sluggable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slugs`
--

LOCK TABLES `slugs` WRITE;
/*!40000 ALTER TABLE `slugs` DISABLE KEYS */;
INSERT INTO `slugs` VALUES (7,'jewels',5,1,'Gallery',NULL,'2010-06-02 14:14:10'),(8,'prova',6,1,'Gallery',NULL,'2010-06-19 19:33:50'),(9,'piglet-stories',6,1,'Gallery',NULL,'2010-06-20 17:09:06'),(11,'about',2,1,'Page',NULL,'2010-06-28 19:30:42');
/*!40000 ALTER TABLE `slugs` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-07-07 16:12:25
