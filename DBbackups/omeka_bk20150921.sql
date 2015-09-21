-- MySQL dump 10.14  Distrib 5.5.44-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: omeka_db
-- ------------------------------------------------------
-- Server version	5.5.44-MariaDB

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
-- Table structure for table `omeka_collection_trees`
--

DROP TABLE IF EXISTS `omeka_collection_trees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `omeka_collection_trees` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_collection_id` int(10) unsigned NOT NULL,
  `collection_id` int(10) unsigned NOT NULL,
  `name` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `collection_id` (`collection_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `omeka_collection_trees`
--

LOCK TABLES `omeka_collection_trees` WRITE;
/*!40000 ALTER TABLE `omeka_collection_trees` DISABLE KEYS */;
INSERT INTO `omeka_collection_trees` VALUES (1,0,1,'test1');
/*!40000 ALTER TABLE `omeka_collection_trees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `omeka_collections`
--

DROP TABLE IF EXISTS `omeka_collections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `omeka_collections` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `public` tinyint(4) NOT NULL,
  `featured` tinyint(4) NOT NULL,
  `added` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `owner_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `public` (`public`),
  KEY `featured` (`featured`),
  KEY `owner_id` (`owner_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `omeka_collections`
--

LOCK TABLES `omeka_collections` WRITE;
/*!40000 ALTER TABLE `omeka_collections` DISABLE KEYS */;
INSERT INTO `omeka_collections` VALUES (1,1,1,'2015-09-02 13:39:05','2015-09-08 17:07:09',1),(2,1,1,'2015-09-08 17:05:02','2015-09-08 17:05:36',1);
/*!40000 ALTER TABLE `omeka_collections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `omeka_csv_import_imported_items`
--

DROP TABLE IF EXISTS `omeka_csv_import_imported_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `omeka_csv_import_imported_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` int(10) unsigned NOT NULL,
  `import_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `item_id` (`item_id`),
  KEY `import_id` (`import_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `omeka_csv_import_imported_items`
--

LOCK TABLES `omeka_csv_import_imported_items` WRITE;
/*!40000 ALTER TABLE `omeka_csv_import_imported_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `omeka_csv_import_imported_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `omeka_csv_import_imports`
--

DROP TABLE IF EXISTS `omeka_csv_import_imports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `omeka_csv_import_imports` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item_type_id` int(10) unsigned DEFAULT NULL,
  `collection_id` int(10) unsigned DEFAULT NULL,
  `owner_id` int(10) unsigned NOT NULL,
  `delimiter` varchar(1) COLLATE utf8_unicode_ci NOT NULL,
  `original_filename` text COLLATE utf8_unicode_ci NOT NULL,
  `file_path` text COLLATE utf8_unicode_ci NOT NULL,
  `file_position` bigint(20) unsigned NOT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `skipped_row_count` int(10) unsigned NOT NULL,
  `skipped_item_count` int(10) unsigned NOT NULL,
  `is_public` tinyint(1) DEFAULT '0',
  `is_featured` tinyint(1) DEFAULT '0',
  `serialized_column_maps` text COLLATE utf8_unicode_ci NOT NULL,
  `added` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `omeka_csv_import_imports`
--

LOCK TABLES `omeka_csv_import_imports` WRITE;
/*!40000 ALTER TABLE `omeka_csv_import_imports` DISABLE KEYS */;
/*!40000 ALTER TABLE `omeka_csv_import_imports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `omeka_element_sets`
--

DROP TABLE IF EXISTS `omeka_element_sets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `omeka_element_sets` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `record_type` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `record_type` (`record_type`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `omeka_element_sets`
--

LOCK TABLES `omeka_element_sets` WRITE;
/*!40000 ALTER TABLE `omeka_element_sets` DISABLE KEYS */;
INSERT INTO `omeka_element_sets` VALUES (1,NULL,'Dublin Core','The Dublin Core metadata element set is common to all Omeka records, including items, files, and collections. For more information see, http://dublincore.org/documents/dces/.'),(3,'Item','Item Type Metadata','The item type metadata element set, consisting of all item type elements bundled with Omeka and all item type elements created by an administrator.');
/*!40000 ALTER TABLE `omeka_element_sets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `omeka_element_texts`
--

DROP TABLE IF EXISTS `omeka_element_texts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `omeka_element_texts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `record_id` int(10) unsigned NOT NULL,
  `record_type` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `element_id` int(10) unsigned NOT NULL,
  `html` tinyint(4) NOT NULL,
  `text` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `record_type_record_id` (`record_type`,`record_id`),
  KEY `element_id` (`element_id`),
  KEY `text` (`text`(20))
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `omeka_element_texts`
--

LOCK TABLES `omeka_element_texts` WRITE;
/*!40000 ALTER TABLE `omeka_element_texts` DISABLE KEYS */;
INSERT INTO `omeka_element_texts` VALUES (1,1,'Collection',50,0,'Ancient Greece'),(2,1,'Collection',49,0,'subj1'),(3,1,'Collection',41,0,'desc1'),(4,1,'Collection',39,0,'creator1'),(5,1,'Item',50,0,'some Egyptian thing'),(6,1,'Item',49,0,'s1'),(7,1,'Item',41,0,'d1'),(8,1,'Item',39,0,'c1'),(9,1,'Item',48,0,'s1'),(10,1,'Item',45,0,'p1'),(11,1,'Item',40,0,'d1'),(12,1,'Item',37,0,'c1'),(13,1,'Item',47,0,'r1'),(14,1,'Item',46,0,'rl1'),(15,1,'Item',42,0,'f1'),(16,1,'Item',44,0,'l1'),(17,1,'Item',51,0,'t1'),(18,1,'Item',43,0,'id1'),(19,1,'Item',38,0,'c1'),(20,1,'Item',7,0,'f1'),(21,1,'Item',10,0,'d1'),(22,2,'Collection',50,0,'Ancient Egypt'),(23,2,'Collection',49,0,'Ancient Egypt artefacts'),(24,2,'Item',50,0,'Egyptian thing'),(25,2,'Item',49,0,'Egyptian thing'),(26,2,'Item',42,0,'jpg'),(27,3,'Item',50,0,'Greek thing'),(28,3,'Item',49,0,'Greek thing'),(29,4,'Item',50,0,'another Greek thing');
/*!40000 ALTER TABLE `omeka_element_texts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `omeka_elements`
--

DROP TABLE IF EXISTS `omeka_elements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `omeka_elements` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `element_set_id` int(10) unsigned NOT NULL,
  `order` int(10) unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `comment` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_element_set_id` (`element_set_id`,`name`),
  UNIQUE KEY `order_element_set_id` (`element_set_id`,`order`),
  KEY `element_set_id` (`element_set_id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `omeka_elements`
--

LOCK TABLES `omeka_elements` WRITE;
/*!40000 ALTER TABLE `omeka_elements` DISABLE KEYS */;
INSERT INTO `omeka_elements` VALUES (1,3,NULL,'Text','Any textual data included in the document',''),(2,3,NULL,'Interviewer','The person(s) performing the interview',NULL),(3,3,NULL,'Interviewee','The person(s) being interviewed',NULL),(4,3,NULL,'Location','The location of the interview',NULL),(5,3,NULL,'Transcription','Any written text transcribed from a sound',NULL),(6,3,NULL,'Local URL','The URL of the local directory containing all assets of the website',NULL),(7,3,NULL,'Original Format','The type of object, such as painting, sculpture, paper, photo, and additional data',''),(10,3,NULL,'Physical Dimensions','The actual physical size of the original image',NULL),(11,3,NULL,'Duration','Length of time involved (seconds, minutes, hours, days, class periods, etc.)',NULL),(12,3,NULL,'Compression','Type/rate of compression for moving image file (i.e. MPEG-4)',NULL),(13,3,NULL,'Producer','Name (or names) of the person who produced the video',NULL),(14,3,NULL,'Director','Name (or names) of the person who produced the video',NULL),(15,3,NULL,'Bit Rate/Frequency','Rate at which bits are transferred (i.e. 96 kbit/s would be FM quality audio)',NULL),(16,3,NULL,'Time Summary','A summary of an interview given for different time stamps throughout the interview',NULL),(17,3,NULL,'Email Body','The main body of the email, including all replied and forwarded text and headers',NULL),(18,3,NULL,'Subject Line','The content of the subject line of the email',NULL),(19,3,NULL,'From','The name and email address of the person sending the email',NULL),(20,3,NULL,'To','The name(s) and email address(es) of the person to whom the email was sent',NULL),(21,3,NULL,'CC','The name(s) and email address(es) of the person to whom the email was carbon copied',NULL),(22,3,NULL,'BCC','The name(s) and email address(es) of the person to whom the email was blind carbon copied',NULL),(23,3,NULL,'Number of Attachments','The number of attachments to the email',NULL),(24,3,NULL,'Standards','',NULL),(25,3,NULL,'Objectives','',NULL),(26,3,NULL,'Materials','',NULL),(27,3,NULL,'Lesson Plan Text','',NULL),(28,3,NULL,'URL','',NULL),(29,3,NULL,'Event Type','',NULL),(30,3,NULL,'Participants','Names of individuals or groups participating in the event',NULL),(31,3,NULL,'Birth Date','',NULL),(32,3,NULL,'Birthplace','',NULL),(33,3,NULL,'Death Date','',NULL),(34,3,NULL,'Occupation','',NULL),(35,3,NULL,'Biographical Text','',NULL),(36,3,NULL,'Bibliography','',NULL),(37,1,8,'Contributor','An entity responsible for making contributions to the resource',NULL),(38,1,15,'Coverage','The spatial or temporal topic of the resource, the spatial applicability of the resource, or the jurisdiction under which the resource is relevant',NULL),(39,1,4,'Creator','An entity primarily responsible for making the resource',NULL),(40,1,7,'Date','A point or period of time associated with an event in the lifecycle of the resource',NULL),(41,1,3,'Description','An account of the resource',NULL),(42,1,11,'Format','The file format, physical medium, or dimensions of the resource',NULL),(43,1,14,'Identifier','An unambiguous reference to the resource within a given context',NULL),(44,1,12,'Language','A language of the resource',NULL),(45,1,6,'Publisher','An entity responsible for making the resource available',NULL),(46,1,10,'Relation','A related resource',NULL),(47,1,9,'Rights','Information about rights held in and over the resource',NULL),(48,1,5,'Source','A related resource from which the described resource is derived',NULL),(49,1,2,'Subject','The topic of the resource',NULL),(50,1,1,'Title','A name given to the resource',NULL),(51,1,13,'Type','The nature or genre of the resource',NULL);
/*!40000 ALTER TABLE `omeka_elements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `omeka_exhibit_block_attachments`
--

DROP TABLE IF EXISTS `omeka_exhibit_block_attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `omeka_exhibit_block_attachments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `block_id` int(10) unsigned NOT NULL,
  `item_id` int(10) unsigned NOT NULL,
  `file_id` int(10) unsigned DEFAULT NULL,
  `caption` text COLLATE utf8_unicode_ci,
  `order` smallint(5) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `block_id_order` (`block_id`,`order`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `omeka_exhibit_block_attachments`
--

LOCK TABLES `omeka_exhibit_block_attachments` WRITE;
/*!40000 ALTER TABLE `omeka_exhibit_block_attachments` DISABLE KEYS */;
INSERT INTO `omeka_exhibit_block_attachments` VALUES (1,1,1,1,NULL,1);
/*!40000 ALTER TABLE `omeka_exhibit_block_attachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `omeka_exhibit_page_blocks`
--

DROP TABLE IF EXISTS `omeka_exhibit_page_blocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `omeka_exhibit_page_blocks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `page_id` int(10) unsigned NOT NULL,
  `layout` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `options` text COLLATE utf8_unicode_ci,
  `text` mediumtext COLLATE utf8_unicode_ci,
  `order` smallint(5) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `page_id_order` (`page_id`,`order`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `omeka_exhibit_page_blocks`
--

LOCK TABLES `omeka_exhibit_page_blocks` WRITE;
/*!40000 ALTER TABLE `omeka_exhibit_page_blocks` DISABLE KEYS */;
INSERT INTO `omeka_exhibit_page_blocks` VALUES (1,2,'file-text','{\"file-position\":\"left\",\"file-size\":\"fullsize\",\"captions-position\":\"center\"}','<p>testing</p>',1);
/*!40000 ALTER TABLE `omeka_exhibit_page_blocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `omeka_exhibit_pages`
--

DROP TABLE IF EXISTS `omeka_exhibit_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `omeka_exhibit_pages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `exhibit_id` int(10) unsigned NOT NULL,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `order` smallint(5) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `exhibit_id_parent_id_slug` (`exhibit_id`,`parent_id`,`slug`),
  KEY `exhibit_id_order` (`exhibit_id`,`order`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `omeka_exhibit_pages`
--

LOCK TABLES `omeka_exhibit_pages` WRITE;
/*!40000 ALTER TABLE `omeka_exhibit_pages` DISABLE KEYS */;
INSERT INTO `omeka_exhibit_pages` VALUES (1,1,NULL,'e1page1','e1page1slug',1),(2,1,NULL,'exhibit 2','ex2',0);
/*!40000 ALTER TABLE `omeka_exhibit_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `omeka_exhibits`
--

DROP TABLE IF EXISTS `omeka_exhibits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `omeka_exhibits` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `credits` text COLLATE utf8_unicode_ci,
  `featured` tinyint(1) DEFAULT '0',
  `public` tinyint(1) DEFAULT '0',
  `theme` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `theme_options` text COLLATE utf8_unicode_ci,
  `slug` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `added` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `owner_id` int(10) unsigned DEFAULT NULL,
  `use_summary_page` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `public` (`public`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `omeka_exhibits`
--

LOCK TABLES `omeka_exhibits` WRITE;
/*!40000 ALTER TABLE `omeka_exhibits` DISABLE KEYS */;
INSERT INTO `omeka_exhibits` VALUES (1,'exhibit1','','',1,1,'',NULL,'testexhibit1','2015-09-05 12:56:23','2015-09-05 15:32:05',1,0);
/*!40000 ALTER TABLE `omeka_exhibits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `omeka_external_images`
--

DROP TABLE IF EXISTS `omeka_external_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `omeka_external_images` (
  `external_image_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `omeka_id` int(10) unsigned NOT NULL,
  `thumbnail_uri` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `full_uri` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `linkto_uri` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `width` int(10) unsigned NOT NULL DEFAULT '0',
  `height` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`external_image_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `omeka_external_images`
--

LOCK TABLES `omeka_external_images` WRITE;
/*!40000 ALTER TABLE `omeka_external_images` DISABLE KEYS */;
/*!40000 ALTER TABLE `omeka_external_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `omeka_files`
--

DROP TABLE IF EXISTS `omeka_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `omeka_files` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` int(10) unsigned NOT NULL,
  `order` int(10) unsigned DEFAULT NULL,
  `size` int(10) unsigned NOT NULL,
  `has_derivative_image` tinyint(1) NOT NULL,
  `authentication` char(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mime_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type_os` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `filename` text COLLATE utf8_unicode_ci NOT NULL,
  `original_filename` text COLLATE utf8_unicode_ci NOT NULL,
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `added` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `stored` tinyint(1) NOT NULL DEFAULT '0',
  `metadata` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `item_id` (`item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `omeka_files`
--

LOCK TABLES `omeka_files` WRITE;
/*!40000 ALTER TABLE `omeka_files` DISABLE KEYS */;
INSERT INTO `omeka_files` VALUES (5,4,NULL,3061,1,'d1e471ee289c2661902faa93a453a3b2','image/jpeg','JPEG image data, JFIF standard 1.01','92a656fa929ae01646cdb25827bb9294.jpg','greekthing.jpg','2015-09-08 18:40:31','2015-09-08 18:40:30',1,'{\"mime_type\":\"image\\/jpeg\",\"video\":{\"dataformat\":\"jpg\",\"lossless\":false,\"bits_per_sample\":24,\"pixel_aspect_ratio\":1}}'),(6,3,NULL,3061,1,'d1e471ee289c2661902faa93a453a3b2','image/jpeg','JPEG image data, JFIF standard 1.01','5d34373057067440cc62afe99d848e7a.jpg','greekthing.jpg','2015-09-08 18:42:39','2015-09-08 18:42:38',1,'{\"mime_type\":\"image\\/jpeg\",\"video\":{\"dataformat\":\"jpg\",\"lossless\":false,\"bits_per_sample\":24,\"pixel_aspect_ratio\":1}}'),(7,2,NULL,1853,1,'6e26832d23e398cc764c4dd4c900c8bb','image/jpeg','JPEG image data, JFIF standard 1.01','4bdb70b8795eb5c56421272e7e037a5a.jpg','egyptianthing.jpg','2015-09-08 18:43:56','2015-09-08 18:43:55',1,'{\"mime_type\":\"image\\/jpeg\",\"video\":{\"dataformat\":\"jpg\",\"lossless\":false,\"bits_per_sample\":24,\"pixel_aspect_ratio\":1}}'),(8,1,NULL,7374,1,'604858ada203e883c0e5db71c87d81ff','image/jpeg','JPEG image data, JFIF standard 1.01','3c341d18a06cd63486e8ea16a0e470ca.jpg','images3.jpg','2015-09-08 18:46:16','2015-09-08 18:46:15',1,'{\"mime_type\":\"image\\/jpeg\",\"video\":{\"dataformat\":\"jpg\",\"lossless\":false,\"bits_per_sample\":24,\"pixel_aspect_ratio\":1}}');
/*!40000 ALTER TABLE `omeka_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `omeka_item_types`
--

DROP TABLE IF EXISTS `omeka_item_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `omeka_item_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `omeka_item_types`
--

LOCK TABLES `omeka_item_types` WRITE;
/*!40000 ALTER TABLE `omeka_item_types` DISABLE KEYS */;
INSERT INTO `omeka_item_types` VALUES (1,'Text','test1'),(3,'Moving Image','A series of visual representations imparting an impression of motion when shown in succession. Examples include animations, movies, television programs, videos, zoetropes, or visual output from a simulation.'),(4,'Oral History','A resource containing historical information obtained in interviews with persons having firsthand knowledge.'),(5,'Sound','A resource primarily intended to be heard. Examples include a music playback file format, an audio compact disc, and recorded speech or sounds.'),(6,'Still Image','A static visual representation. Examples include paintings, drawings, graphic designs, plans and maps. Recommended best practice is to assign the type Text to images of textual materials.'),(7,'Website','A resource comprising of a web page or web pages and all related assets ( such as images, sound and video files, etc. ).'),(8,'Event','A non-persistent, time-based occurrence. Metadata for an event provides descriptive information that is the basis for discovery of the purpose, location, duration, and responsible agents associated with an event. Examples include an exhibition, webcast, conference, workshop, open day, performance, battle, trial, wedding, tea party, conflagration.'),(9,'Email','A resource containing textual messages and binary attachments sent electronically from one person to another or one person to many people.'),(10,'Lesson Plan','A resource that gives a detailed description of a course of instruction.'),(11,'Hyperlink','A link, or reference, to another resource on the Internet.'),(12,'Person','An individual.'),(13,'Interactive Resource','A resource requiring interaction from the user to be understood, executed, or experienced. Examples include forms on Web pages, applets, multimedia learning objects, chat services, or virtual reality environments.'),(14,'Dataset','Data encoded in a defined structure. Examples include lists, tables, and databases. A dataset may be useful for direct machine processing.'),(15,'Physical Object','An inanimate, three-dimensional object or substance. Note that digital representations of, or surrogates for, these objects should use Moving Image, Still Image, Text or one of the other types.'),(16,'Service','A system that provides one or more functions. Examples include a photocopying service, a banking service, an authentication service, interlibrary loans, a Z39.50 or Web server.'),(17,'Software','A computer program in source or compiled form. Examples include a C source file, MS-Windows .exe executable, or Perl script.');
/*!40000 ALTER TABLE `omeka_item_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `omeka_item_types_elements`
--

DROP TABLE IF EXISTS `omeka_item_types_elements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `omeka_item_types_elements` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item_type_id` int(10) unsigned NOT NULL,
  `element_id` int(10) unsigned NOT NULL,
  `order` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `item_type_id_element_id` (`item_type_id`,`element_id`),
  KEY `item_type_id` (`item_type_id`),
  KEY `element_id` (`element_id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `omeka_item_types_elements`
--

LOCK TABLES `omeka_item_types_elements` WRITE;
/*!40000 ALTER TABLE `omeka_item_types_elements` DISABLE KEYS */;
INSERT INTO `omeka_item_types_elements` VALUES (1,1,7,2),(2,1,1,1),(3,6,7,NULL),(6,6,10,NULL),(7,3,7,NULL),(8,3,11,NULL),(9,3,12,NULL),(10,3,13,NULL),(11,3,14,NULL),(12,3,5,NULL),(13,5,7,NULL),(14,5,11,NULL),(15,5,15,NULL),(16,5,5,NULL),(17,4,7,NULL),(18,4,11,NULL),(19,4,15,NULL),(20,4,5,NULL),(21,4,2,NULL),(22,4,3,NULL),(23,4,4,NULL),(24,4,16,NULL),(25,9,17,NULL),(26,9,18,NULL),(27,9,20,NULL),(28,9,19,NULL),(29,9,21,NULL),(30,9,22,NULL),(31,9,23,NULL),(32,10,24,NULL),(33,10,25,NULL),(34,10,26,NULL),(35,10,11,NULL),(36,10,27,NULL),(37,7,6,NULL),(38,11,28,NULL),(39,8,29,NULL),(40,8,30,NULL),(41,8,11,NULL),(42,12,31,NULL),(43,12,32,NULL),(44,12,33,NULL),(45,12,34,NULL),(46,12,35,NULL),(47,12,36,NULL);
/*!40000 ALTER TABLE `omeka_item_types_elements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `omeka_items`
--

DROP TABLE IF EXISTS `omeka_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `omeka_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item_type_id` int(10) unsigned DEFAULT NULL,
  `collection_id` int(10) unsigned DEFAULT NULL,
  `featured` tinyint(4) NOT NULL,
  `public` tinyint(4) NOT NULL,
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `added` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `owner_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item_type_id` (`item_type_id`),
  KEY `collection_id` (`collection_id`),
  KEY `public` (`public`),
  KEY `featured` (`featured`),
  KEY `owner_id` (`owner_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `omeka_items`
--

LOCK TABLES `omeka_items` WRITE;
/*!40000 ALTER TABLE `omeka_items` DISABLE KEYS */;
INSERT INTO `omeka_items` VALUES (1,6,1,1,1,'2015-09-08 18:46:16','2015-09-04 12:29:30',1),(2,6,2,1,1,'2015-09-08 18:43:56','2015-09-08 17:10:52',1),(3,6,1,1,1,'2015-09-08 18:42:39','2015-09-08 17:13:28',1),(4,6,1,1,1,'2015-09-08 18:40:30','2015-09-08 18:40:30',1);
/*!40000 ALTER TABLE `omeka_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `omeka_keys`
--

DROP TABLE IF EXISTS `omeka_keys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `omeka_keys` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `label` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `key` char(40) COLLATE utf8_unicode_ci NOT NULL,
  `ip` varbinary(16) DEFAULT NULL,
  `accessed` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `omeka_keys`
--

LOCK TABLES `omeka_keys` WRITE;
/*!40000 ALTER TABLE `omeka_keys` DISABLE KEYS */;
/*!40000 ALTER TABLE `omeka_keys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `omeka_options`
--

DROP TABLE IF EXISTS `omeka_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `omeka_options` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=148 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `omeka_options`
--

LOCK TABLES `omeka_options` WRITE;
/*!40000 ALTER TABLE `omeka_options` DISABLE KEYS */;
INSERT INTO `omeka_options` VALUES (7,'thumbnail_constraint','200'),(8,'square_thumbnail_constraint','200'),(9,'fullsize_constraint','800'),(10,'per_page_admin','10'),(11,'per_page_public','10'),(12,'show_empty_elements','0'),(14,'admin_theme','default'),(16,'file_extension_whitelist','aac,aif,aiff,asf,asx,avi,bmp,c,cc,class,css,divx,doc,docx,exe,gif,gz,gzip,h,ico,j2k,jp2,jpe,jpeg,jpg,m4a,mdb,mid,midi,mov,mp2,mp3,mp4,mpa,mpe,mpeg,mpg,mpp,odb,odc,odf,odg,odp,ods,odt,ogg, pdf,png,pot,pps,ppt,pptx,qt,ra,ram,rtf,rtx,swf,tar,tif,tiff,txt, wav,wax,wma,wmv,wmx,wri,xla,xls,xlsx,xlt,xlw,zip'),(17,'file_mime_type_whitelist','application/msword,application/ogg,application/pdf,application/rtf,application/vnd.ms-access,application/vnd.ms-excel,application/vnd.ms-powerpoint,application/vnd.ms-project,application/vnd.ms-write,application/vnd.oasis.opendocument.chart,application/vnd.oasis.opendocument.database,application/vnd.oasis.opendocument.formula,application/vnd.oasis.opendocument.graphics,application/vnd.oasis.opendocument.presentation,application/vnd.oasis.opendocument.spreadsheet,application/vnd.oasis.opendocument.text,application/x-ms-wmp,application/x-ogg,application/x-gzip,application/x-msdownload,application/x-shockwave-flash,application/x-tar,application/zip,audio/aac,audio/aiff,audio/mid,audio/midi,audio/mp3,audio/mp4,audio/mpeg,audio/mpeg3,audio/ogg,audio/wav,audio/wma,audio/x-aac,audio/x-aiff,audio/x-midi,audio/x-mp3,audio/x-mp4,audio/x-mpeg,audio/x-mpeg3,audio/x-mpegaudio,audio/x-ms-wax,audio/x-realaudio,audio/x-wav,audio/x-wma,image/bmp,image/gif,image/icon,image/jpeg,image/pjpeg,image/png,image/tiff,image/x-icon,image/x-ms-bmp,text/css,text/plain,text/richtext,text/rtf,video/asf,video/avi,video/divx,video/mp4,video/mpeg,video/msvideo,video/ogg,video/quicktime,video/x-ms-wmv,video/x-msvideo'),(18,'disable_default_file_validation',''),(20,'display_system_info','1'),(21,'html_purifier_is_enabled','1'),(22,'html_purifier_allowed_html_elements','p,br,strong,em,span,div,ul,ol,li,a,h1,h2,h3,h4,h5,h6,address,pre,table,tr,td,blockquote,thead,tfoot,tbody,th,dl,dt,dd,q,small,strike,sup,sub,b,i,big,small,tt'),(23,'html_purifier_allowed_html_attributes','*.style,*.class,a.href,a.title,a.target'),(26,'search_record_types','a:3:{s:4:\"Item\";s:4:\"Item\";s:4:\"File\";s:4:\"File\";s:10:\"Collection\";s:10:\"Collection\";}'),(27,'api_enable',''),(28,'api_per_page','50'),(29,'show_element_set_headings','1'),(32,'omeka_version','2.3.1'),(35,'exhibit_builder_sort_browse','recent'),(37,'simple_pages_filter_page_content','0'),(57,'digitalobjectlinkerplugin_embed_admin','0'),(58,'digitalobjectlinkerplugin_width_admin','200'),(59,'digitalobjectlinkerplugin_embed_public','0'),(60,'digitalobjectlinkerplugin_width_public','200'),(61,'digitalobjectlinkerplugin_items_page_width_public','400'),(62,'digitalobjectlinkerplugin_thumb_tag','thumb:'),(63,'digitalobjectlinkerplugin_preg_thumb_string','/^thumb:([a-zA-Z0-9]*:){0,1}/'),(64,'digitalobjectlinkerplugin_full_image_tag','full:'),(65,'digitalobjectlinkerplugin_preg_full_image_string','/^full:([a-zA-Z0-9]*:){0,1}/'),(66,'digitalobjectlinkerplugin_linkto_tag','linkto:'),(67,'digitalobjectlinkerplugin_preg_linkto_string','/^linkto:([a-zA-Z0-9]*:){0,1}/'),(68,'csv_import_memory_limit',''),(69,'csv_import_php_path',''),(70,'csv_import_column_delimiter',','),(71,'csv_import_element_delimiter',''),(72,'csv_import_tag_delimiter',','),(73,'csv_import_file_delimiter',','),(75,'collection_tree_alpha_order','0'),(79,'social_bookmarking_add_to_omeka_items','1'),(80,'social_bookmarking_add_to_omeka_collections','1'),(81,'social_bookmarking_services','a:299:{s:11:\"100zakladok\";i:0;s:7:\"2linkme\";i:0;s:4:\"2tag\";i:0;s:6:\"a97abi\";i:0;s:10:\"addressbar\";i:0;s:5:\"adfty\";i:0;s:6:\"adifni\";i:0;s:5:\"advqr\";i:0;s:3:\"aim\";i:0;s:14:\"amazonwishlist\";i:0;s:6:\"amenme\";i:0;s:7:\"aolmail\";i:0;s:7:\"apsense\";i:0;s:4:\"arto\";i:0;s:7:\"azadegi\";i:0;s:5:\"baang\";i:0;s:5:\"baidu\";i:0;s:9:\"balltribe\";i:0;s:7:\"beat100\";i:0;s:13:\"biggerpockets\";i:0;s:5:\"bitly\";i:0;s:8:\"bizsugar\";i:0;s:5:\"bland\";i:0;s:9:\"blinklist\";i:0;s:7:\"blogger\";i:0;s:6:\"bloggy\";i:0;s:8:\"blogkeen\";i:0;s:9:\"blogmarks\";i:0;s:13:\"blurpalicious\";i:0;s:8:\"bobrdobr\";i:0;s:8:\"bonzobox\";i:0;s:11:\"bookmarkycz\";i:0;s:12:\"bookmerkende\";i:0;s:3:\"box\";i:0;s:8:\"brainify\";i:0;s:7:\"bryderi\";i:0;s:10:\"buddymarks\";i:0;s:6:\"buffer\";i:0;s:6:\"buzzzy\";i:0;s:6:\"camyoo\";i:0;s:5:\"care2\";i:0;s:4:\"chiq\";i:0;s:5:\"cirip\";i:0;s:9:\"citeulike\";i:0;s:14:\"classicalplace\";i:0;s:10:\"cleanprint\";i:0;s:9:\"cleansave\";i:0;s:5:\"cndig\";i:0;s:7:\"colivia\";i:0;s:6:\"cosmiq\";i:0;s:8:\"cssbased\";i:0;s:8:\"curateus\";i:0;s:9:\"delicious\";i:1;s:14:\"digaculturanet\";i:0;s:4:\"digg\";i:0;s:7:\"diggita\";i:0;s:4:\"digo\";i:0;s:5:\"diigo\";i:0;s:16:\"domaintoolswhois\";i:0;s:8:\"domelhor\";i:0;s:14:\"dotnetshoutout\";i:0;s:6:\"douban\";i:0;s:8:\"draugiem\";i:0;s:8:\"dropjack\";i:0;s:4:\"dudu\";i:0;s:5:\"dzone\";i:0;s:7:\"efactor\";i:0;s:6:\"ekudos\";i:0;s:10:\"elefantapl\";i:0;s:5:\"email\";i:1;s:9:\"embarkons\";i:0;s:8:\"evernote\";i:0;s:9:\"extraplay\";i:0;s:7:\"ezyspot\";i:0;s:12:\"fabulously40\";i:0;s:8:\"facebook\";i:1;s:13:\"facebook_like\";i:0;s:4:\"fark\";i:0;s:8:\"farkinda\";i:0;s:11:\"fashiolista\";i:0;s:7:\"favable\";i:0;s:5:\"faves\";i:0;s:8:\"favlogde\";i:0;s:11:\"favoritende\";i:0;s:9:\"favorites\";i:0;s:9:\"favoritus\";i:0;s:14:\"financialjuice\";i:0;s:6:\"flaker\";i:0;s:9:\"flipboard\";i:0;s:5:\"folkd\";i:0;s:7:\"foodlve\";i:0;s:10:\"formspring\";i:0;s:10:\"foursquare\";i:0;s:7:\"fresqui\";i:0;s:10:\"friendfeed\";i:0;s:4:\"funp\";i:0;s:5:\"fwisp\";i:0;s:10:\"gamekicker\";i:0;s:2:\"gg\";i:0;s:7:\"giftery\";i:0;s:9:\"gigbasket\";i:0;s:9:\"givealink\";i:0;s:8:\"gluvsnap\";i:0;s:5:\"gmail\";i:0;s:9:\"goodnoows\";i:0;s:6:\"google\";i:0;s:14:\"google_plusone\";i:0;s:20:\"google_plusone_share\";i:1;s:10:\"googleplus\";i:0;s:15:\"googletranslate\";i:0;s:4:\"govn\";i:0;s:14:\"greaterdebater\";i:0;s:10:\"hackernews\";i:0;s:6:\"hatena\";i:0;s:9:\"hedgehogs\";i:0;s:10:\"historious\";i:0;s:9:\"hootsuite\";i:0;s:7:\"hotklix\";i:0;s:7:\"hotmail\";i:0;s:8:\"identica\";i:0;s:8:\"ihavegot\";i:0;s:7:\"indexor\";i:0;s:12:\"informazione\";i:0;s:10:\"instapaper\";i:0;s:15:\"internetarchive\";i:0;s:6:\"iorbix\";i:0;s:9:\"irepeater\";i:0;s:8:\"isociety\";i:0;s:4:\"iwiw\";i:0;s:8:\"jamespot\";i:0;s:5:\"jappy\";i:0;s:5:\"jolly\";i:0;s:8:\"jumptags\";i:0;s:8:\"kaboodle\";i:0;s:6:\"kaevur\";i:0;s:6:\"kaixin\";i:0;s:7:\"ketnooi\";i:0;s:8:\"kindleit\";i:0;s:5:\"kledy\";i:0;s:10:\"kommenting\";i:0;s:13:\"latafaneracat\";i:0;s:8:\"librerio\";i:0;s:5:\"lidar\";i:0;s:8:\"linkedin\";i:1;s:11:\"linksgutter\";i:0;s:10:\"linkshares\";i:0;s:6:\"linkuj\";i:0;s:4:\"live\";i:0;s:11:\"livejournal\";i:0;s:13:\"lockerblogger\";i:0;s:8:\"logger24\";i:0;s:6:\"mailto\";i:0;s:8:\"margarin\";i:0;s:6:\"markme\";i:0;s:7:\"mashant\";i:0;s:8:\"mashbord\";i:0;s:6:\"me2day\";i:0;s:6:\"meinvz\";i:0;s:10:\"mekusharim\";i:0;s:7:\"memonic\";i:0;s:6:\"memori\";i:0;s:8:\"mendeley\";i:0;s:7:\"meneame\";i:0;s:10:\"misterwong\";i:0;s:13:\"misterwong_de\";i:0;s:4:\"mixi\";i:0;s:8:\"moemesto\";i:0;s:7:\"moikrug\";i:0;s:12:\"mrcnetworkit\";i:0;s:8:\"mymailru\";i:0;s:7:\"myspace\";i:0;s:9:\"myvidster\";i:0;s:3:\"n4g\";i:0;s:10:\"naszaklasa\";i:0;s:6:\"netlog\";i:0;s:8:\"netvibes\";i:0;s:7:\"netvouz\";i:0;s:10:\"newsmeback\";i:0;s:9:\"newstrust\";i:0;s:8:\"newsvine\";i:0;s:5:\"nujij\";i:0;s:16:\"odnoklassniki_ru\";i:0;s:9:\"oknotizie\";i:0;s:11:\"openthedoor\";i:0;s:5:\"oyyla\";i:0;s:5:\"packg\";i:0;s:8:\"pafnetde\";i:0;s:8:\"pdfmyurl\";i:0;s:9:\"pdfonline\";i:0;s:9:\"phonefavs\";i:0;s:9:\"pinterest\";i:0;s:15:\"pinterest_share\";i:1;s:8:\"planypus\";i:0;s:5:\"plaxo\";i:0;s:5:\"plurk\";i:0;s:6:\"pocket\";i:0;s:8:\"posteezy\";i:0;s:5:\"print\";i:0;s:13:\"printfriendly\";i:0;s:5:\"pusha\";i:0;s:5:\"qrfin\";i:0;s:5:\"qrsrc\";i:0;s:9:\"quantcast\";i:0;s:5:\"qzone\";i:0;s:14:\"raiseyourvoice\";i:0;s:6:\"reddit\";i:0;s:6:\"rediff\";i:0;s:6:\"redkum\";i:0;s:12:\"researchgate\";i:0;s:11:\"safelinking\";i:0;s:7:\"scoopat\";i:0;s:7:\"scoopit\";i:0;s:7:\"sekoman\";i:0;s:13:\"select2gether\";i:0;s:6:\"sharer\";i:0;s:6:\"shaveh\";i:0;s:9:\"shetoldme\";i:0;s:9:\"sinaweibo\";i:0;s:7:\"skyrock\";i:0;s:5:\"smiru\";i:0;s:20:\"socialbookmarkingnet\";i:0;s:8:\"sodahead\";i:0;s:6:\"sonico\";i:0;s:8:\"spinsnap\";i:0;s:9:\"springpad\";i:0;s:8:\"startaid\";i:0;s:8:\"startlap\";i:0;s:13:\"storyfollower\";i:0;s:7:\"studivz\";i:0;s:8:\"stuffpit\";i:0;s:11:\"stumbleupon\";i:0;s:9:\"stumpedia\";i:0;s:11:\"stylishhome\";i:0;s:5:\"sulia\";i:0;s:7:\"sunlize\";i:0;s:6:\"supbro\";i:0;s:11:\"surfingbird\";i:0;s:5:\"svejo\";i:0;s:8:\"symbaloo\";i:0;s:5:\"taaza\";i:0;s:5:\"tagza\";i:0;s:8:\"tapiture\";i:0;s:7:\"taringa\";i:0;s:8:\"technerd\";i:0;s:6:\"textme\";i:0;s:8:\"thefancy\";i:0;s:17:\"thefreedictionary\";i:0;s:11:\"thewebblend\";i:0;s:11:\"thinkfinity\";i:0;s:8:\"thisnext\";i:0;s:8:\"thrillon\";i:0;s:9:\"throwpile\";i:0;s:4:\"toly\";i:0;s:13:\"topsitelernet\";i:0;s:9:\"transferr\";i:0;s:6:\"tuenti\";i:0;s:6:\"tulinq\";i:0;s:6:\"tumblr\";i:0;s:5:\"tvinx\";i:0;s:7:\"twitter\";i:1;s:8:\"twitthis\";i:0;s:7:\"typepad\";i:0;s:6:\"upnews\";i:0;s:13:\"urlaubswerkde\";i:0;s:6:\"viadeo\";i:0;s:4:\"virb\";i:0;s:14:\"visitezmonsite\";i:0;s:2:\"vk\";i:0;s:12:\"vkrugudruzei\";i:0;s:9:\"voxopolis\";i:0;s:10:\"vybralisme\";i:0;s:11:\"w3validator\";i:0;s:6:\"wanelo\";i:0;s:7:\"webnews\";i:0;s:8:\"webshare\";i:0;s:11:\"werkenntwen\";i:0;s:8:\"whatsapp\";i:0;s:7:\"windows\";i:0;s:7:\"wirefan\";i:0;s:9:\"wishmindr\";i:0;s:9:\"wordpress\";i:0;s:8:\"wowbored\";i:0;s:5:\"wykop\";i:0;s:5:\"xanga\";i:0;s:4:\"xing\";i:0;s:8:\"yahoobkm\";i:0;s:9:\"yahoomail\";i:0;s:6:\"yammer\";i:0;s:10:\"yardbarker\";i:0;s:4:\"yigg\";i:0;s:4:\"yiid\";i:0;s:6:\"yookos\";i:0;s:7:\"yoolink\";i:0;s:10:\"yorumcuyum\";i:0;s:6:\"youmob\";i:0;s:5:\"yuuby\";i:0;s:11:\"zakladoknet\";i:0;s:6:\"ziczac\";i:0;s:6:\"zingme\";i:0;}'),(82,'theme_avantgarde_options','a:11:{s:20:\"header_image_heading\";s:20:\"header image heading\";s:17:\"header_image_text\";s:14:\"Paragraph text\";s:21:\"display_featured_item\";s:1:\"1\";s:27:\"display_featured_collection\";s:1:\"1\";s:24:\"display_featured_exhibit\";s:1:\"1\";s:21:\"homepage_recent_items\";s:0:\"\";s:13:\"homepage_text\";s:26:\"HOMEPAGE TEXT - AvantGarde\";s:11:\"footer_text\";s:11:\"FOOTER TEXT\";s:19:\"use_advanced_search\";s:1:\"0\";s:4:\"logo\";s:36:\"0a470ccfeab50f70db62a6fce3263bf0.png\";s:12:\"header_image\";s:36:\"88362618ab3f69598777b079594b03c8.jpg\";}'),(94,'theme_seasons_options','a:12:{s:11:\"style_sheet\";s:6:\"autumn\";s:4:\"logo\";N;s:21:\"display_featured_item\";s:1:\"1\";s:27:\"display_featured_collection\";s:1:\"1\";s:24:\"display_featured_exhibit\";s:1:\"1\";s:21:\"homepage_recent_items\";s:0:\"\";s:13:\"homepage_text\";s:21:\"homepage text Seasons\";s:11:\"footer_text\";s:0:\"\";s:24:\"display_footer_copyright\";s:1:\"0\";s:17:\"item_file_gallery\";s:1:\"0\";s:19:\"use_advanced_search\";s:1:\"1\";s:12:\"exhibits_nav\";s:4:\"full\";}'),(97,'theme_berlin_options','a:10:{s:4:\"logo\";N;s:12:\"header_image\";N;s:21:\"display_featured_item\";s:1:\"1\";s:27:\"display_featured_collection\";s:1:\"1\";s:24:\"display_featured_exhibit\";s:1:\"1\";s:21:\"homepage_recent_items\";s:0:\"\";s:13:\"homepage_text\";s:20:\"homepage text Berlin\";s:11:\"footer_text\";s:0:\"\";s:24:\"display_footer_copyright\";s:1:\"0\";s:19:\"use_advanced_search\";s:1:\"0\";}'),(100,'theme_default_options','a:17:{s:10:\"text_color\";s:7:\"#444444\";s:16:\"background_color\";s:7:\"#FFFFFF\";s:10:\"link_color\";s:7:\"#888888\";s:12:\"button_color\";s:7:\"#000000\";s:17:\"button_text_color\";s:7:\"#FFFFFF\";s:18:\"header_title_color\";s:7:\"#000000\";s:4:\"logo\";N;s:17:\"header_background\";N;s:11:\"footer_text\";s:0:\"\";s:24:\"display_footer_copyright\";s:1:\"0\";s:21:\"display_featured_item\";s:1:\"1\";s:27:\"display_featured_collection\";s:1:\"1\";s:24:\"display_featured_exhibit\";s:1:\"1\";s:21:\"homepage_recent_items\";s:0:\"\";s:13:\"homepage_text\";s:17:\"homepage text Roy\";s:17:\"item_file_gallery\";s:1:\"1\";s:19:\"use_advanced_search\";s:1:\"0\";}'),(107,'theme_rhythm_options','a:8:{s:11:\"style_sheet\";s:4:\"fall\";s:12:\"site_tagline\";s:0:\"\";s:4:\"logo\";N;s:21:\"homepage_recent_items\";s:0:\"\";s:13:\"homepage_text\";s:16:\"homepage text...\";s:11:\"footer_text\";s:0:\"\";s:24:\"display_footer_copyright\";s:1:\"0\";s:19:\"use_advanced_search\";s:1:\"0\";}'),(108,'public_theme','emiglio'),(130,'public_navigation_main','[{\"uid\":\"\\/omeka\\/about\",\"can_delete\":false,\"type\":\"Omeka_Navigation_Page_Uri\",\"label\":\"About\",\"fragment\":null,\"id\":null,\"class\":null,\"title\":null,\"target\":null,\"accesskey\":null,\"rel\":[],\"rev\":[],\"customHtmlAttribs\":[],\"order\":1,\"resource\":null,\"privilege\":null,\"active\":false,\"visible\":true,\"pages\":[],\"uri\":\"\\/omeka\\/about\"},{\"uid\":\"\\/omeka\\/visit\",\"can_delete\":false,\"type\":\"Omeka_Navigation_Page_Uri\",\"label\":\"Your visit\",\"fragment\":null,\"id\":null,\"class\":null,\"title\":null,\"target\":null,\"accesskey\":null,\"rel\":[],\"rev\":[],\"customHtmlAttribs\":[],\"order\":2,\"resource\":null,\"privilege\":null,\"active\":false,\"visible\":true,\"pages\":[],\"uri\":\"\\/omeka\\/visit\"},{\"uid\":\"\\/omeka\\/news_events\",\"can_delete\":false,\"type\":\"Omeka_Navigation_Page_Uri\",\"label\":\"News\\/Events\",\"fragment\":null,\"id\":null,\"class\":null,\"title\":null,\"target\":null,\"accesskey\":null,\"rel\":[],\"rev\":[],\"customHtmlAttribs\":[],\"order\":3,\"resource\":null,\"privilege\":null,\"active\":false,\"visible\":true,\"pages\":[{\"uid\":\"\\/omeka\\/news\",\"can_delete\":false,\"type\":\"Omeka_Navigation_Page_Uri\",\"label\":\"News\",\"fragment\":null,\"id\":null,\"class\":null,\"title\":null,\"target\":null,\"accesskey\":null,\"rel\":[],\"rev\":[],\"customHtmlAttribs\":[],\"order\":4,\"resource\":null,\"privilege\":null,\"active\":false,\"visible\":true,\"pages\":[],\"uri\":\"\\/omeka\\/news\"},{\"uid\":\"\\/omeka\\/events\",\"can_delete\":false,\"type\":\"Omeka_Navigation_Page_Uri\",\"label\":\"Events\",\"fragment\":null,\"id\":null,\"class\":null,\"title\":null,\"target\":null,\"accesskey\":null,\"rel\":[],\"rev\":[],\"customHtmlAttribs\":[],\"order\":5,\"resource\":null,\"privilege\":null,\"active\":false,\"visible\":true,\"pages\":[],\"uri\":\"\\/omeka\\/events\"},{\"uid\":\"\\/omeka\\/education\",\"can_delete\":false,\"type\":\"Omeka_Navigation_Page_Uri\",\"label\":\"Education\",\"fragment\":null,\"id\":null,\"class\":null,\"title\":null,\"target\":null,\"accesskey\":null,\"rel\":[],\"rev\":[],\"customHtmlAttribs\":[],\"order\":6,\"resource\":null,\"privilege\":null,\"active\":false,\"visible\":true,\"pages\":[],\"uri\":\"\\/omeka\\/education\"},{\"uid\":\"\\/omeka\\/programs\",\"can_delete\":false,\"type\":\"Omeka_Navigation_Page_Uri\",\"label\":\"Programs\",\"fragment\":null,\"id\":null,\"class\":null,\"title\":null,\"target\":null,\"accesskey\":null,\"rel\":[],\"rev\":[],\"customHtmlAttribs\":[],\"order\":7,\"resource\":null,\"privilege\":null,\"active\":false,\"visible\":true,\"pages\":[],\"uri\":\"\\/omeka\\/programs\"}],\"uri\":\"\\/omeka\\/news_events\"},{\"uid\":\"\\/omeka\\/collections\",\"can_delete\":false,\"type\":\"Omeka_Navigation_Page_Uri\",\"label\":\"Collections\",\"fragment\":null,\"id\":null,\"class\":null,\"title\":null,\"target\":null,\"accesskey\":null,\"rel\":[],\"rev\":[],\"customHtmlAttribs\":[],\"order\":8,\"resource\":null,\"privilege\":null,\"active\":false,\"visible\":true,\"pages\":[{\"uid\":\"\\/omeka\\/collections\\/browse\",\"can_delete\":false,\"type\":\"Omeka_Navigation_Page_Uri\",\"label\":\"Browse Collections\",\"fragment\":null,\"id\":null,\"class\":null,\"title\":null,\"target\":null,\"accesskey\":null,\"rel\":[],\"rev\":[],\"customHtmlAttribs\":[],\"order\":9,\"resource\":null,\"privilege\":null,\"active\":false,\"visible\":true,\"pages\":[],\"uri\":\"\\/omeka\\/collections\\/browse\"},{\"uid\":\"\\/omeka\\/items\\/browse\",\"can_delete\":false,\"type\":\"Omeka_Navigation_Page_Uri\",\"label\":\"Browse Items\",\"fragment\":null,\"id\":null,\"class\":null,\"title\":null,\"target\":null,\"accesskey\":null,\"rel\":[],\"rev\":[],\"customHtmlAttribs\":[],\"order\":10,\"resource\":null,\"privilege\":null,\"active\":false,\"visible\":true,\"pages\":[],\"uri\":\"\\/omeka\\/items\\/browse\"},{\"uid\":\"\\/omeka\\/exhibits\",\"can_delete\":false,\"type\":\"Omeka_Navigation_Page_Uri\",\"label\":\"Browse Exhibits\",\"fragment\":null,\"id\":null,\"class\":null,\"title\":null,\"target\":null,\"accesskey\":null,\"rel\":[],\"rev\":[],\"customHtmlAttribs\":[],\"order\":11,\"resource\":null,\"privilege\":null,\"active\":false,\"visible\":true,\"pages\":[],\"uri\":\"\\/omeka\\/exhibits\"}],\"uri\":\"\\/omeka\\/collections\"},{\"uid\":\"\\/omeka\\/contact\",\"can_delete\":false,\"type\":\"Omeka_Navigation_Page_Uri\",\"label\":\"Contact Us\",\"fragment\":null,\"id\":null,\"class\":null,\"title\":null,\"target\":null,\"accesskey\":null,\"rel\":[],\"rev\":[],\"customHtmlAttribs\":[],\"order\":12,\"resource\":null,\"privilege\":null,\"active\":false,\"visible\":true,\"pages\":[],\"uri\":\"\\/omeka\\/contact\"},{\"uid\":\"\\/omeka\\/althome\",\"can_delete\":false,\"type\":\"Omeka_Navigation_Page_Uri\",\"label\":\"Macquarie University MUSEUM of ANCIENT CULTURES\",\"fragment\":null,\"id\":null,\"class\":null,\"title\":null,\"target\":null,\"accesskey\":null,\"rel\":[],\"rev\":[],\"customHtmlAttribs\":[],\"order\":13,\"resource\":null,\"privilege\":null,\"active\":false,\"visible\":false,\"pages\":[],\"uri\":\"\\/omeka\\/althome\"}]'),(131,'homepage_uri','/'),(137,'site_title','Sample Omeka Site'),(138,'description',''),(139,'administrator_email','Steve.Cassidy@mq.edu.au'),(140,'copyright',''),(141,'author',''),(142,'tag_delimiter',','),(143,'path_to_convert','/usr/bin'),(144,'theme_emiglio_options','a:11:{s:21:\"display_featured_item\";s:1:\"1\";s:27:\"display_featured_collection\";s:1:\"1\";s:24:\"display_featured_exhibit\";s:1:\"1\";s:21:\"homepage_recent_items\";s:1:\"4\";s:13:\"homepage_text\";s:79:\"homepage text - the above image could perhaps be a scrolling banner<br /><br />\";s:11:\"footer_text\";s:0:\"\";s:24:\"display_footer_copyright\";s:1:\"1\";s:17:\"item_file_gallery\";s:1:\"1\";s:19:\"use_advanced_search\";s:1:\"0\";s:4:\"logo\";s:36:\"593781cba7db37392c036b01109bf7d7.jpg\";s:12:\"header_image\";s:36:\"770b5fc2a9544299a546b3e30e6e9ab7.jpg\";}'),(147,'omeka_update','a:2:{s:14:\"latest_version\";s:5:\"2.3.1\";s:12:\"last_updated\";i:1442846557;}');
/*!40000 ALTER TABLE `omeka_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `omeka_plugins`
--

DROP TABLE IF EXISTS `omeka_plugins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `omeka_plugins` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `active` tinyint(4) NOT NULL,
  `version` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `active_idx` (`active`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `omeka_plugins`
--

LOCK TABLES `omeka_plugins` WRITE;
/*!40000 ALTER TABLE `omeka_plugins` DISABLE KEYS */;
INSERT INTO `omeka_plugins` VALUES (1,'ExhibitBuilder',1,'3.2.1'),(2,'SimplePages',1,'3.0.6'),(3,'DigitalObjectLinker',1,'2.0.0'),(4,'CsvImport',1,'2.0.3'),(5,'CollectionTree',0,'2.0.2'),(6,'Reports',1,'2.0.1'),(7,'ShortcodeCarousel',1,'1.0'),(8,'SocialBookmarking',1,'2.0.2'),(10,'CSSEditor',1,'1.0.1');
/*!40000 ALTER TABLE `omeka_plugins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `omeka_processes`
--

DROP TABLE IF EXISTS `omeka_processes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `omeka_processes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `class` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `pid` int(10) unsigned DEFAULT NULL,
  `status` enum('starting','in progress','completed','paused','error','stopped') COLLATE utf8_unicode_ci NOT NULL,
  `args` text COLLATE utf8_unicode_ci NOT NULL,
  `started` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `stopped` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `pid` (`pid`),
  KEY `started` (`started`),
  KEY `stopped` (`stopped`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `omeka_processes`
--

LOCK TABLES `omeka_processes` WRITE;
/*!40000 ALTER TABLE `omeka_processes` DISABLE KEYS */;
/*!40000 ALTER TABLE `omeka_processes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `omeka_records_tags`
--

DROP TABLE IF EXISTS `omeka_records_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `omeka_records_tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `record_id` int(10) unsigned NOT NULL,
  `record_type` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tag_id` int(10) unsigned NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tag` (`record_type`,`record_id`,`tag_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `omeka_records_tags`
--

LOCK TABLES `omeka_records_tags` WRITE;
/*!40000 ALTER TABLE `omeka_records_tags` DISABLE KEYS */;
INSERT INTO `omeka_records_tags` VALUES (1,2,'Item',1,'2015-09-08 17:10:52'),(2,3,'Item',2,'2015-09-08 17:13:28'),(3,4,'Item',2,'2015-09-08 18:40:31');
/*!40000 ALTER TABLE `omeka_records_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `omeka_reports`
--

DROP TABLE IF EXISTS `omeka_reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `omeka_reports` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `query` text COLLATE utf8_unicode_ci,
  `creator` int(10) unsigned NOT NULL,
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `omeka_reports`
--

LOCK TABLES `omeka_reports` WRITE;
/*!40000 ALTER TABLE `omeka_reports` DISABLE KEYS */;
/*!40000 ALTER TABLE `omeka_reports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `omeka_reports_files`
--

DROP TABLE IF EXISTS `omeka_reports_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `omeka_reports_files` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `report_id` int(10) unsigned NOT NULL,
  `type` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `filename` text COLLATE utf8_unicode_ci,
  `status` enum('starting','in progress','completed','error') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'starting',
  `messages` text COLLATE utf8_unicode_ci,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `options` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `report_id` (`report_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `omeka_reports_files`
--

LOCK TABLES `omeka_reports_files` WRITE;
/*!40000 ALTER TABLE `omeka_reports_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `omeka_reports_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `omeka_reports_items`
--

DROP TABLE IF EXISTS `omeka_reports_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `omeka_reports_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `report_id` int(10) unsigned NOT NULL,
  `item_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `report_id` (`report_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `omeka_reports_items`
--

LOCK TABLES `omeka_reports_items` WRITE;
/*!40000 ALTER TABLE `omeka_reports_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `omeka_reports_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `omeka_schema_migrations`
--

DROP TABLE IF EXISTS `omeka_schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `omeka_schema_migrations` (
  `version` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `omeka_schema_migrations`
--

LOCK TABLES `omeka_schema_migrations` WRITE;
/*!40000 ALTER TABLE `omeka_schema_migrations` DISABLE KEYS */;
INSERT INTO `omeka_schema_migrations` VALUES ('20100401000000'),('20100810120000'),('20110113000000'),('20110124000001'),('20110301103900'),('20110328192100'),('20110426181300'),('20110601112200'),('20110627223000'),('20110824110000'),('20120112100000'),('20120220000000'),('20120221000000'),('20120224000000'),('20120224000001'),('20120402000000'),('20120516000000'),('20120612112000'),('20120623095000'),('20120710000000'),('20120723000000'),('20120808000000'),('20120808000001'),('20120813000000'),('20120914000000'),('20121007000000'),('20121015000000'),('20121015000001'),('20121018000001'),('20121110000000'),('20121218000000'),('20130422000000'),('20130426000000'),('20130429000000'),('20130701000000'),('20130809000000'),('20140304131700'),('20150211000000'),('20150310141100'),('20150814155100');
/*!40000 ALTER TABLE `omeka_schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `omeka_search_texts`
--

DROP TABLE IF EXISTS `omeka_search_texts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `omeka_search_texts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `record_type` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `record_id` int(10) unsigned NOT NULL,
  `public` tinyint(1) NOT NULL,
  `title` mediumtext COLLATE utf8_unicode_ci,
  `text` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `record_name` (`record_type`,`record_id`),
  FULLTEXT KEY `text` (`text`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `omeka_search_texts`
--

LOCK TABLES `omeka_search_texts` WRITE;
/*!40000 ALTER TABLE `omeka_search_texts` DISABLE KEYS */;
INSERT INTO `omeka_search_texts` VALUES (1,'Collection',1,1,'Ancient Greece','Ancient Greece subj1 desc1 creator1 '),(2,'Item',1,1,'some Egyptian thing','some Egyptian thing s1 d1 c1 s1 p1 d1 c1 r1 rl1 f1 l1 t1 id1 c1 f1 d1 '),(3,'SimplePagesPage',1,1,'About','About <p>This is an example page. Feel free to replace this content, or delete the page and start from scratch.</p> '),(4,'Exhibit',1,1,'exhibit1','exhibit1  '),(5,'ExhibitPage',1,1,'e1page1','e1page1 '),(6,'SimplePagesPage',2,1,'Education','Education Education offerings include:\r\n- AHIS111\r\n- AHIS222\r\n- AHIS333\r\n- schools\r\n '),(7,'SimplePagesPage',3,1,'Programs','Programs Programs:\r\n- Education\r\n- Volunteers '),(8,'SimplePagesPage',4,1,'Contact Us','Contact Us <h2>Location</h2>\r\n<p><strong><a title=\"Your Visit (Museum of Ancient Cultures)\" href=\"http://www.mac.mq.edu.au/public/redirect.jsp?id=4682\">See university map here</a></strong></p>\r\n<p>Building X5B Level 3<br />Ph: (02) 9850 9263<br />FX: (02) 9850 9267<br />E-mail:&nbsp;<a href=\"mailto:karl.vandyke@mq.edu.au\">karl.vandyke@mq.edu.au</a></p>\r\n<h2>Opening Hours</h2>\r\n<p>9.30am - 4.30pm Monday - Friday</p>\r\n<p>Other times by special arrangement</p> '),(9,'SimplePagesPage',5,1,'Your visit','Your visit <h2>Opening Hours</h2>\r\n<p>9.30am - 4.30pm Monday - Friday (Other times by special arrangement)</p>\r\n<p>Please note that the Museum is usually open for major University events such as Information and Open Days, as well as major Ancient History events such as the annual Ancient History Teachers\' Conference and student Study Days.</p>\r\n<h2>Map</h2>\r\n<p><img src=\"http://www.mac.mq.edu.au/custom/files/media/mac-map_v2_thumbnail.jpg\" alt=\"MAC - Map Thumbnail\" /><a href=\"http://www.mac.mq.edu.au/custom/files/media/mac-map_v2.jpg\" target=\"_blank\"><br />View the full map</a></p>\r\n<h2>Transportation</h2>\r\n<p>Visit Macquarie University\'s&nbsp;<a href=\"http://mq.edu.au/transport/\">transportation</a>&nbsp;page for more information about getting to the Museum of Ancient Cultures including train and bus timetables, parking locations and other maps.&nbsp;</p> '),(10,'ExhibitPage',2,1,'exhibit 2','<p>testing</p>  exhibit 2 '),(11,'SimplePagesPage',6,1,'AltHome','AltHome <h2>Macquarie University MUSEUM of ANCIENT CULTURES</h2>\r\n<p>About</p>\r\n<p>Your visit</p>\r\n<p>News/Events</p>\r\n<p>Collections</p>\r\n<p>Contact Us</p> '),(12,'SimplePagesPage',7,1,'News/Events','News/Events <h2>&nbsp;</h2> '),(14,'SimplePagesPage',9,1,'Events','Events <h2><span style=\"font-size: 1.5em;\">Events</span></h2>\r\n<p>No events today...</p> '),(13,'SimplePagesPage',8,1,'News','News <p>News (last updated 8 Sep 2015)</p>\r\n<p>Following plugins may prove useful:</p>\r\n<p>- Simple Pages</p>\r\n<p>- Exhibit Builder</p>\r\n<p>- CSV Import</p> '),(15,'SimplePagesPage',10,1,'Collections','Collections  '),(16,'Collection',2,1,'Ancient Egypt','Ancient Egypt Ancient Egypt artefacts '),(17,'Item',2,1,'Egyptian thing','egypt Egyptian thing Egyptian thing jpg '),(18,'Item',3,1,'Greek thing','greece Greek thing Greek thing '),(19,'Item',4,1,'another Greek thing','greece another Greek thing ');
/*!40000 ALTER TABLE `omeka_search_texts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `omeka_sessions`
--

DROP TABLE IF EXISTS `omeka_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `omeka_sessions` (
  `id` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `modified` bigint(20) DEFAULT NULL,
  `lifetime` int(11) DEFAULT NULL,
  `data` blob,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `omeka_sessions`
--

LOCK TABLES `omeka_sessions` WRITE;
/*!40000 ALTER TABLE `omeka_sessions` DISABLE KEYS */;
INSERT INTO `omeka_sessions` VALUES ('0khp2sc60k35olgk7bh8igtnc5',1441719009,1209600,'Default|a:1:{s:8:\"redirect\";s:1:\"/\";}Zend_Auth|a:1:{s:7:\"storage\";i:1;}OmekaSessionCsrfToken|a:1:{s:5:\"token\";s:32:\"9c9b99ca099c88ed6ca7b6ff7b5ab9bf\";}'),('32ngp0al75tboutvo7k4cm8do6',1441382442,1209600,'Default|a:1:{s:8:\"redirect\";s:6:\"/users\";}Zend_Auth|a:1:{s:7:\"storage\";i:1;}OmekaSessionCsrfToken|a:1:{s:5:\"token\";s:32:\"fd26444f3fde843a428a74bfa60e5105\";}'),('g8m95bu17dida11i7op1kkmnj0',1441723730,1209600,'Default|a:1:{s:8:\"redirect\";s:1:\"/\";}Zend_Auth|a:1:{s:7:\"storage\";i:1;}__ZF|a:2:{s:41:\"Zend_Form_Element_Hash_salt_settings_csrf\";a:2:{s:4:\"ENNH\";i:1;s:3:\"ENT\";i:1441726304;}s:45:\"Zend_Form_Element_Hash_salt_theme_config_csrf\";a:2:{s:4:\"ENNH\";i:1;s:3:\"ENT\";i:1441727300;}}Zend_Form_Element_Hash_salt_settings_csrf|a:1:{s:4:\"hash\";s:32:\"a930138fcc2c5ece76c4351d8bab79bd\";}OmekaSessionCsrfToken|a:1:{s:5:\"token\";s:32:\"324dbc88f4128201bb680a7712606ce0\";}Zend_Form_Element_Hash_salt_theme_config_csrf|a:1:{s:4:\"hash\";s:32:\"fba6279951220cbda80d0a2087f62298\";}'),('i4oc7iaelqifcd5jvpl0530b07',1441124843,1209600,'Default|a:1:{s:8:\"redirect\";s:1:\"/\";}Zend_Auth|a:1:{s:7:\"storage\";i:1;}OmekaSessionCsrfToken|a:1:{s:5:\"token\";s:32:\"222755aa89af5a9aa86bafa8c37bdd96\";}__ZF|a:1:{s:37:\"Zend_Form_Element_Hash_salt_user_csrf\";a:2:{s:4:\"ENNH\";i:1;s:3:\"ENT\";i:1441126401;}}Zend_Form_Element_Hash_salt_user_csrf|a:1:{s:4:\"hash\";s:32:\"6859ae9780b4f16b069265e7d02defa4\";}'),('ocpo8obg349tqlvbaj1cdlavk7',1442846638,1209600,'Default|a:1:{s:8:\"redirect\";s:1:\"/\";}Zend_Auth|a:1:{s:7:\"storage\";i:1;}OmekaSessionCsrfToken|a:1:{s:5:\"token\";s:32:\"f6488adb45e4420ed77eba1b29dd9cd3\";}'),('sf9fq0ovl6kfk7c2vfveibeua3',1440982502,1209600,'Default|a:1:{s:8:\"redirect\";s:1:\"/\";}Zend_Auth|a:1:{s:7:\"storage\";i:1;}OmekaSessionCsrfToken|a:1:{s:5:\"token\";s:32:\"1ca9685328a442f4285a403cfc180c44\";}');
/*!40000 ALTER TABLE `omeka_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `omeka_simple_pages_pages`
--

DROP TABLE IF EXISTS `omeka_simple_pages_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `omeka_simple_pages_pages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `modified_by_user_id` int(10) unsigned NOT NULL,
  `created_by_user_id` int(10) unsigned NOT NULL,
  `is_published` tinyint(1) NOT NULL,
  `title` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `slug` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `text` mediumtext COLLATE utf8_unicode_ci,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `inserted` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `order` int(10) unsigned NOT NULL,
  `parent_id` int(10) unsigned NOT NULL,
  `template` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `use_tiny_mce` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `is_published` (`is_published`),
  KEY `inserted` (`inserted`),
  KEY `updated` (`updated`),
  KEY `created_by_user_id` (`created_by_user_id`),
  KEY `modified_by_user_id` (`modified_by_user_id`),
  KEY `order` (`order`),
  KEY `parent_id` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `omeka_simple_pages_pages`
--

LOCK TABLES `omeka_simple_pages_pages` WRITE;
/*!40000 ALTER TABLE `omeka_simple_pages_pages` DISABLE KEYS */;
INSERT INTO `omeka_simple_pages_pages` VALUES (1,1,1,1,'About','about','<p>This is an example page. Feel free to replace this content, or delete the page and start from scratch.</p>','2015-09-08 16:39:22','2015-09-05 12:50:13',0,0,'',0),(2,1,1,1,'Education','education','Education offerings include:\r\n- AHIS111\r\n- AHIS222\r\n- AHIS333\r\n- schools\r\n','2015-09-08 16:40:17','2015-09-05 14:07:17',0,0,'',0),(3,1,1,1,'Programs','programs','Programs:\r\n- Education\r\n- Volunteers','2015-09-08 16:40:44','2015-09-05 14:16:09',0,0,'',0),(4,1,1,1,'Contact Us','contact','<h2>Location</h2>\r\n<p><strong><a title=\"Your Visit (Museum of Ancient Cultures)\" href=\"http://www.mac.mq.edu.au/public/redirect.jsp?id=4682\">See university map here</a></strong></p>\r\n<p>Building X5B Level 3<br />Ph: (02) 9850 9263<br />FX: (02) 9850 9267<br />E-mail:&nbsp;<a href=\"mailto:karl.vandyke@mq.edu.au\">karl.vandyke@mq.edu.au</a></p>\r\n<h2>Opening Hours</h2>\r\n<p>9.30am - 4.30pm Monday - Friday</p>\r\n<p>Other times by special arrangement</p>','2015-09-08 16:38:55','2015-09-05 15:05:25',2,0,'',1),(5,1,1,1,'Your visit','visit','<h2>Opening Hours</h2>\r\n<p>9.30am - 4.30pm Monday - Friday (Other times by special arrangement)</p>\r\n<p>Please note that the Museum is usually open for major University events such as Information and Open Days, as well as major Ancient History events such as the annual Ancient History Teachers\' Conference and student Study Days.</p>\r\n<h2>Map</h2>\r\n<p><img src=\"http://www.mac.mq.edu.au/custom/files/media/mac-map_v2_thumbnail.jpg\" alt=\"MAC - Map Thumbnail\" /><a href=\"http://www.mac.mq.edu.au/custom/files/media/mac-map_v2.jpg\" target=\"_blank\"><br />View the full map</a></p>\r\n<h2>Transportation</h2>\r\n<p>Visit Macquarie University\'s&nbsp;<a href=\"http://mq.edu.au/transport/\">transportation</a>&nbsp;page for more information about getting to the Museum of Ancient Cultures including train and bus timetables, parking locations and other maps.&nbsp;</p>','2015-09-05 18:30:45','2015-09-05 15:08:32',1,6,'',1),(6,1,1,1,'AltHome','althome','<h2>Macquarie University MUSEUM of ANCIENT CULTURES</h2>\r\n<p>About</p>\r\n<p>Your visit</p>\r\n<p>News/Events</p>\r\n<p>Collections</p>\r\n<p>Contact Us</p>','2015-09-08 16:42:38','2015-09-05 18:28:10',0,0,'',1),(7,1,1,1,'News/Events','news_events','<h2>&nbsp;</h2>','2015-09-08 16:06:44','2015-09-08 15:28:43',0,0,'',1),(8,1,1,1,'News','news','<p>News (last updated 8 Sep 2015)</p>\r\n<p>Following plugins may prove useful:</p>\r\n<p>- Simple Pages</p>\r\n<p>- Exhibit Builder</p>\r\n<p>- CSV Import</p>','2015-09-08 16:00:45','2015-09-08 16:00:45',0,7,'',1),(9,1,1,1,'Events','events','<h2><span style=\"font-size: 1.5em;\">Events</span></h2>\r\n<p>No events today...</p>','2015-09-08 16:12:46','2015-09-08 16:08:24',0,7,'',1),(10,1,1,1,'Collections','collections','','2015-09-08 16:13:24','2015-09-08 16:09:21',0,0,'',0);
/*!40000 ALTER TABLE `omeka_simple_pages_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `omeka_tags`
--

DROP TABLE IF EXISTS `omeka_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `omeka_tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `omeka_tags`
--

LOCK TABLES `omeka_tags` WRITE;
/*!40000 ALTER TABLE `omeka_tags` DISABLE KEYS */;
INSERT INTO `omeka_tags` VALUES (1,'egypt'),(2,'greece');
/*!40000 ALTER TABLE `omeka_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `omeka_users`
--

DROP TABLE IF EXISTS `omeka_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `omeka_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `name` text COLLATE utf8_unicode_ci NOT NULL,
  `email` text COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `salt` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` tinyint(4) NOT NULL,
  `role` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'default',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `active_idx` (`active`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `omeka_users`
--

LOCK TABLES `omeka_users` WRITE;
/*!40000 ALTER TABLE `omeka_users` DISABLE KEYS */;
INSERT INTO `omeka_users` VALUES (1,'webdev','Super User','webdev@example.org','99f7d2d6afb0de90f7e7ff05be00fc66ffa37dd4','da401a06dfa4463c',1,'super');
/*!40000 ALTER TABLE `omeka_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `omeka_users_activations`
--

DROP TABLE IF EXISTS `omeka_users_activations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `omeka_users_activations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `url` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `added` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `omeka_users_activations`
--

LOCK TABLES `omeka_users_activations` WRITE;
/*!40000 ALTER TABLE `omeka_users_activations` DISABLE KEYS */;
/*!40000 ALTER TABLE `omeka_users_activations` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-09-21 10:48:12
