-- MySQL dump 10.14  Distrib 5.5.41-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: omeka_db
-- ------------------------------------------------------
-- Server version	5.5.40-MariaDB-wsrep

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
INSERT INTO `omeka_collections` VALUES (1,1,1,'2015-09-02 13:39:05','2015-10-29 13:54:38',1),(2,1,0,'2015-09-08 17:05:02','2015-09-24 17:14:59',1);
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
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `omeka_element_texts`
--

LOCK TABLES `omeka_element_texts` WRITE;
/*!40000 ALTER TABLE `omeka_element_texts` DISABLE KEYS */;
INSERT INTO `omeka_element_texts` VALUES (1,1,'Collection',50,0,'Funerary Collection'),(2,1,'Collection',49,0,'subj1'),(3,1,'Collection',41,1,'The Funerary Collection has objects ranging in date from the beginning of pre-history to early Christianity in the Byzantine era.'),(4,1,'Collection',39,0,'creator1'),(5,1,'Item',50,0,'Egyptian sand castle'),(6,1,'Item',49,0,'s1'),(7,1,'Item',41,0,'d1'),(8,1,'Item',39,0,'c1'),(9,1,'Item',48,0,'s1'),(10,1,'Item',45,0,'p1'),(11,1,'Item',40,0,'d1'),(12,1,'Item',37,0,'c1'),(13,1,'Item',47,0,'r1'),(14,1,'Item',46,0,'rl1'),(15,1,'Item',42,0,'f1'),(16,1,'Item',44,0,'l1'),(17,1,'Item',51,0,'t1'),(18,1,'Item',43,0,'id1'),(19,1,'Item',38,0,'c1'),(20,1,'Item',7,0,'f1'),(21,1,'Item',10,0,'d1'),(22,2,'Collection',50,0,'Ancient Egypt Collection'),(23,2,'Collection',49,0,'Ancient Egypt artefacts'),(24,2,'Item',50,0,'Egyptian thing'),(25,2,'Item',49,0,'Egyptian thing'),(26,2,'Item',42,0,'jpg'),(27,3,'Item',50,0,'Shiny vase'),(28,3,'Item',49,0,'vases'),(29,4,'Item',50,0,'an Egyptian coin'),(30,5,'Item',50,0,'gold heart'),(31,6,'Item',50,0,'an old brown pot '),(32,7,'Item',50,0,'an old egyptian bottle'),(33,8,'Item',50,0,'gold funerary mask'),(34,9,'Item',50,0,'old gold amulet'),(43,15,'Item',50,0,'amnh1'),(47,19,'Item',50,0,'little gold mummy'),(48,20,'Item',50,0,'Egyptian skull'),(49,21,'Item',50,0,'Ancient Egyptian beer mug'),(50,27,'Item',50,0,'Snapshot of Berlin Mac1 theme'),(54,23,'Item',50,0,'Snapshot of Seasons-mac1 (winter) with slider in body'),(56,21,'Item',28,1,'<a href=\"http://elsi.ltc.mq.edu.au/~skcdev/3d/exhibit.php?model=MU4078_FINAL.obj\">Beer Mug 3D iFrame</a>'),(57,21,'Item',6,0,'https://toolbox.ltc.mq.edu.au/3dbeta/exhibit.php?model=MU3878,DECIMATE.obj '),(58,20,'Item',28,1,'<a href=\"http://elsi.ltc.mq.edu.au/~skcdev/3d/exhibit.php?model=skull.obj\">3D Skull iFrame</a>'),(59,19,'Item',28,1,'<a>3D mummy</a>'),(60,9,'Item',28,1,'<a href=\"http://elsi.ltc.mq.edu.au/~skcdev/3d/exhibit.php?model=MU520,DECIMATED.obj\">3D Amulet iFrame</a>'),(61,7,'Item',28,1,'<a href=\"http://elsi.ltc.mq.edu.au/~skcdev/3d/exhibit.php?model=MU868-egyptian_bottle.obj\">3D Egyptian Bottle iFrame</a>'),(62,3,'Item',28,1,'<a href=\"http://elsi.ltc.mq.edu.au/~skcdev/3d/exhibit.php?model=MU4439_Gnathia_Ware_done.obj\" data-featherlight=\"iframe\" data-featherlight-iframe-width=\"1050\" data-featherlight-iframe-height=\"800\">3D Gnathia Ware iFrame</a>'),(63,6,'Item',48,0,'source unknown'),(64,6,'Item',28,1,'<a href=\"http://elsi.ltc.mq.edu.au/~skcdev/3d/exhibit.php?model=MU1452_Final.obj\">3D Brown Pot iFrame</a>'),(65,20,'Item',39,0,'creator unknown'),(66,5,'Item',28,1,'<a href=\"http://elsi.ltc.mq.edu.au/~skcdev/3d/exhibit.php?model=heart_low2.obj\">3D Heart iFrame</a>'),(68,21,'Item',41,0,'Beer mugs back in Egyptian times had to be quite large, since building pyramids was thirsty work.'),(69,20,'Item',41,0,'This is thought to be the skull of Ancient Egyptian God ANUBIS - preserved in gold.'),(70,19,'Item',41,0,'Not only did they mummify you, but they also shrunk you down to a more manageable size.'),(71,9,'Item',41,0,'An old Egyptian amulet. A replica of this item also exists (printed on our 3D printer).'),(72,7,'Item',41,0,'This is a rather large bottle - note the wide bottom and very narrow rim to avoid splillages.'),(73,6,'Item',41,0,'This is one of the oldest pots in our collection.'),(74,5,'Item',41,0,'A model of a heart for medical education purposes.'),(75,3,'Item',41,0,'This is a shiny vase - illustrating the advanced pottery techniques already in use at the time.');
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
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `omeka_exhibit_block_attachments`
--

LOCK TABLES `omeka_exhibit_block_attachments` WRITE;
/*!40000 ALTER TABLE `omeka_exhibit_block_attachments` DISABLE KEYS */;
INSERT INTO `omeka_exhibit_block_attachments` VALUES (6,3,9,14,NULL,1),(7,3,5,10,NULL,2),(8,3,7,12,NULL,3),(9,3,2,7,NULL,4),(13,5,20,23,NULL,2),(14,5,19,22,NULL,3),(15,5,9,14,NULL,4),(16,5,7,12,NULL,5),(17,5,3,15,NULL,6),(18,5,5,10,NULL,7),(19,5,21,24,NULL,1),(20,5,6,11,'<p>This is the caption for the old brown pot...</p>',8),(21,6,27,30,NULL,1),(22,6,25,28,NULL,2),(23,6,24,27,NULL,3),(24,6,23,26,NULL,4),(25,6,23,26,NULL,5),(26,6,22,25,NULL,6),(27,6,21,24,NULL,7),(28,6,20,23,NULL,8),(29,6,19,22,NULL,9),(30,6,9,14,NULL,10),(31,6,8,13,NULL,11),(32,6,7,12,NULL,12),(33,6,6,11,NULL,13),(34,6,5,10,NULL,14),(35,6,4,5,NULL,15),(36,6,3,15,NULL,16),(37,6,2,7,NULL,17),(38,6,1,8,NULL,18);
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `omeka_exhibit_page_blocks`
--

LOCK TABLES `omeka_exhibit_page_blocks` WRITE;
/*!40000 ALTER TABLE `omeka_exhibit_page_blocks` DISABLE KEYS */;
INSERT INTO `omeka_exhibit_page_blocks` VALUES (3,3,'gallery','{\"showcase-position\":\"left\",\"gallery-position\":\"right\",\"gallery-file-size\":\"square_thumbnail\",\"captions-position\":\"center\"}',NULL,1),(5,5,'gallery','{\"showcase-position\":\"none\",\"gallery-position\":\"left\",\"gallery-file-size\":\"square_thumbnail\",\"captions-position\":\"center\"}',NULL,1),(6,6,'gallery','{\"showcase-position\":\"none\",\"gallery-position\":\"left\",\"gallery-file-size\":\"square_thumbnail\",\"captions-position\":\"center\"}',NULL,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `omeka_exhibit_pages`
--

LOCK TABLES `omeka_exhibit_pages` WRITE;
/*!40000 ALTER TABLE `omeka_exhibit_pages` DISABLE KEYS */;
INSERT INTO `omeka_exhibit_pages` VALUES (3,2,NULL,'Egyptian Exhibit','e2p1',0),(5,4,NULL,'3D exhibits','ex3dp1',0),(6,5,NULL,'Multi p1','exmulti1',0);
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `omeka_exhibits`
--

LOCK TABLES `omeka_exhibits` WRITE;
/*!40000 ALTER TABLE `omeka_exhibits` DISABLE KEYS */;
INSERT INTO `omeka_exhibits` VALUES (2,'Egyptian exhibit','','',0,1,'',NULL,'ex2g','2015-09-23 07:57:02','2015-10-04 00:44:49',1,0),(4,'3D Exhibit','<p>Exhibit of 3D items. Click on an item when inside the exhibit, then click on the URL above its picture.</p>','',1,1,'',NULL,'ex3d','2015-10-02 14:41:48','2015-10-04 00:51:07',1,0),(5,'Multi Exhibit','<p>This exhibit contains a multitude of items across many cultures and periods - mostly to allow testing of \'exhibits\' as a contrast to \'collections\' for displaying many \'items\'.</p>','',0,1,'',NULL,'exmulti','2015-10-07 09:56:30','2015-10-07 10:04:22',1,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `omeka_files`
--

LOCK TABLES `omeka_files` WRITE;
/*!40000 ALTER TABLE `omeka_files` DISABLE KEYS */;
INSERT INTO `omeka_files` VALUES (5,4,NULL,3061,1,'d1e471ee289c2661902faa93a453a3b2','image/jpeg','JPEG image data, JFIF standard 1.01','92a656fa929ae01646cdb25827bb9294.jpg','greekthing.jpg','2015-10-29 14:01:51','2015-09-08 18:40:30',1,'{\"mime_type\":\"image\\/jpeg\",\"video\":{\"dataformat\":\"jpg\",\"lossless\":false,\"bits_per_sample\":24,\"pixel_aspect_ratio\":1}}'),(7,2,NULL,1853,1,'6e26832d23e398cc764c4dd4c900c8bb','image/jpeg','JPEG image data, JFIF standard 1.01','4bdb70b8795eb5c56421272e7e037a5a.jpg','egyptianthing.jpg','2015-10-01 18:42:12','2015-09-08 18:43:55',1,'{\"mime_type\":\"image\\/jpeg\",\"video\":{\"dataformat\":\"jpg\",\"lossless\":false,\"bits_per_sample\":24,\"pixel_aspect_ratio\":1}}'),(8,1,NULL,7374,1,'604858ada203e883c0e5db71c87d81ff','image/jpeg','JPEG image data, JFIF standard 1.01','3c341d18a06cd63486e8ea16a0e470ca.jpg','images3.jpg','2015-10-29 14:08:31','2015-09-08 18:46:15',1,'{\"mime_type\":\"image\\/jpeg\",\"video\":{\"dataformat\":\"jpg\",\"lossless\":false,\"bits_per_sample\":24,\"pixel_aspect_ratio\":1}}'),(10,5,NULL,23669,1,'63f63e8bd731b6efe84468544168d818','image/jpeg','JPEG image data, JFIF standard 1.01','ac6a1fb9c37304df5cf37110df40e8d8.jpg','heart_thumb.jpg','2015-10-06 08:43:12','2015-09-23 05:53:11',1,'{\"mime_type\":\"image\\/jpeg\",\"video\":{\"dataformat\":\"jpg\",\"lossless\":false,\"bits_per_sample\":24,\"pixel_aspect_ratio\":1}}'),(11,6,NULL,53163,1,'3a1023e4080938d11600473b1350d717','image/png','PNG image data, 244 x 236, 8-bit/color RGBA, non-interlaced','732f222fa376cf55765dd9574dff8902.png','MU1452_thumb.png','2015-10-06 08:40:47','2015-09-23 05:54:20',1,'{\"mime_type\":\"image\\/png\",\"video\":{\"dataformat\":\"png\",\"lossless\":false,\"resolution_x\":244,\"resolution_y\":236,\"bits_per_sample\":32,\"compression_ratio\":0.23080630036121},\"comments\":{\"XML:com.adobe.xmp\":[\"<x:xmpmeta xmlns:x=\\\"adobe:ns:meta\\/\\\" x:xmptk=\\\"XMP Core 5.4.0\\\">\\n   <rdf:RDF xmlns:rdf=\\\"http:\\/\\/www.w3.org\\/1999\\/02\\/22-rdf-syntax-ns#\\\">\\n      <rdf:Description rdf:about=\\\"\\\"\\n            xmlns:exif=\\\"http:\\/\\/ns.adobe.com\\/exif\\/1.0\\/\\\">\\n         <exif:PixelXDimension>488<\\/exif:PixelXDimension>\\n         <exif:PixelYDimension>471<\\/exif:PixelYDimension>\\n      <\\/rdf:Description>\\n   <\\/rdf:RDF>\\n<\\/x:xmpmeta>\"]},\"comments_html\":{\"XML:com.adobe.xmp\":[\"&lt;x:xmpmeta xmlns:x=&quot;adobe:ns:meta\\/&quot; x:xmptk=&quot;XMP Core 5.4.0&quot;&gt;&#10;   &lt;rdf:RDF xmlns:rdf=&quot;http:\\/\\/www.w3.org\\/1999\\/02\\/22-rdf-syntax-ns#&quot;&gt;&#10;      &lt;rdf:Description rdf:about=&quot;&quot;&#10;            xmlns:exif=&quot;http:\\/\\/ns.adobe.com\\/exif\\/1.0\\/&quot;&gt;&#10;         &lt;exif:PixelXDimension&gt;488&lt;\\/exif:PixelXDimension&gt;&#10;         &lt;exif:PixelYDimension&gt;471&lt;\\/exif:PixelYDimension&gt;&#10;      &lt;\\/rdf:Description&gt;&#10;   &lt;\\/rdf:RDF&gt;&#10;&lt;\\/x:xmpmeta&gt;\"]}}'),(12,7,NULL,50205,1,'519b17f5de8320986a32ab97091bdacb','image/png','PNG image data, 295 x 262, 8-bit/color RGB, non-interlaced','5d6b4470b6b654fe945ad406f1bf8b67.png','MU868-egyptian_bottle.png','2015-10-06 08:41:09','2015-09-23 05:55:24',1,'{\"mime_type\":\"image\\/png\",\"video\":{\"dataformat\":\"png\",\"lossless\":false,\"resolution_x\":295,\"resolution_y\":262,\"bits_per_sample\":24,\"compression_ratio\":0.21652218915772}}'),(13,8,NULL,54484,1,'c67b132ec1c0f6b13d61fedc030531f1','image/png','PNG image data, 244 x 261, 8-bit/color RGB, non-interlaced','bc33f458ee195b37dff5f1c90c9fb32f.png','MU1777-Memmi,wood.png','2015-10-29 14:02:41','2015-09-23 06:01:28',1,'{\"mime_type\":\"image\\/png\",\"video\":{\"dataformat\":\"png\",\"lossless\":false,\"resolution_x\":244,\"resolution_y\":261,\"bits_per_sample\":24,\"compression_ratio\":0.28517890417269}}'),(14,9,NULL,72459,1,'68714400c40e7fc999d952cd0ba53d7a','image/png','PNG image data, 288 x 249, 8-bit/color RGB, non-interlaced','a349837e48829d68022dc8203e071592.png','MU52.png','2015-10-06 08:41:30','2015-09-23 06:02:22',1,'{\"mime_type\":\"image\\/png\",\"video\":{\"dataformat\":\"png\",\"lossless\":false,\"resolution_x\":288,\"resolution_y\":249,\"bits_per_sample\":24,\"compression_ratio\":0.33680555555556}}'),(15,3,NULL,35807,1,'bc0050cc51d3b926deff0434d7cb462c','image/jpeg','JPEG image data, EXIF standard','a050f155add005336dc24c55adefdc9b.jpg','MU4439_thumb.jpg','2015-10-29 14:00:41','2015-09-23 10:58:54',1,'{\"mime_type\":\"image\\/jpeg\",\"video\":{\"dataformat\":\"jpg\",\"lossless\":false,\"bits_per_sample\":24,\"pixel_aspect_ratio\":1},\"iptc\":{\"IPTCEnvelope\":{\"CodedCharacterSet\":[\"\\u001b%G\"]},\"IPTCApplication\":{\"ApplicationRecordVersion\":[\"\\u0000\\u0000\"]}}}'),(18,15,NULL,112997,1,'310f0a6a24ca6d6b63726e78095bcc7b','image/jpeg','JPEG image data, JFIF standard 1.01','696c45e62c2030dec75c38ddf0cd59d2.jpg','secretocean_v2_homepage_slide.jpg','2015-10-01 22:34:21','2015-09-23 14:28:28',1,'{\"mime_type\":\"image\\/jpeg\",\"video\":{\"dataformat\":\"jpg\",\"lossless\":false,\"bits_per_sample\":24,\"pixel_aspect_ratio\":1}}'),(22,19,NULL,34899,1,'f3e0ad669d12eac913446dd8a5cde901','image/png','PNG image data, 222 x 265, 8-bit/color RGB, non-interlaced','a33240b26b706f342f1738a76aecbc4b.png','MU2608.png','2015-10-29 13:56:00','2015-09-23 17:13:08',1,'{\"mime_type\":\"image\\/png\",\"video\":{\"dataformat\":\"png\",\"lossless\":false,\"resolution_x\":222,\"resolution_y\":265,\"bits_per_sample\":24,\"compression_ratio\":0.19773924868264}}'),(23,20,NULL,14280,1,'5b476a1ac7906ba79a8638b3c4e1f69c','image/jpeg','JPEG image data, JFIF standard 1.01','e70cfade9d5929336e34dbf3ca3793e1.jpg','skull.jpg','2015-10-29 13:58:25','2015-09-23 17:15:06',1,'{\"mime_type\":\"image\\/jpeg\",\"video\":{\"dataformat\":\"jpg\",\"lossless\":false,\"bits_per_sample\":24,\"pixel_aspect_ratio\":1}}'),(24,21,NULL,65868,1,'c49e15fae73d5a8beb00aa10c3286550','image/png','PNG image data, 256 x 256, 8-bit/color RGB, non-interlaced','450d6d0d9159693245d5b8bff3614e28.jpg','MU4078_THUMB.jpg','2015-10-06 08:41:50','2015-09-23 17:17:53',1,'{\"mime_type\":\"image\\/png\",\"video\":{\"dataformat\":\"png\",\"lossless\":false,\"resolution_x\":256,\"resolution_y\":256,\"bits_per_sample\":24,\"compression_ratio\":0.33502197265625},\"comments\":{\"XML:com.adobe.xmp\":[\"<?xpacket begin=\\\"\\ufeff\\\" id=\\\"W5M0MpCehiHzreSzNTczkc9d\\\"?>\\n<x:xmpmeta xmlns:x=\\\"adobe:ns:meta\\/\\\" x:xmptk=\\\"Adobe XMP Core 5.6-c014 79.156797, 2014\\/08\\/20-09:53:02        \\\">\\n   <rdf:RDF xmlns:rdf=\\\"http:\\/\\/www.w3.org\\/1999\\/02\\/22-rdf-syntax-ns#\\\">\\n      <rdf:Description rdf:about=\\\"\\\"\\n            xmlns:xmp=\\\"http:\\/\\/ns.adobe.com\\/xap\\/1.0\\/\\\"\\n            xmlns:dc=\\\"http:\\/\\/purl.org\\/dc\\/elements\\/1.1\\/\\\"\\n            xmlns:photoshop=\\\"http:\\/\\/ns.adobe.com\\/photoshop\\/1.0\\/\\\"\\n            xmlns:xmpMM=\\\"http:\\/\\/ns.adobe.com\\/xap\\/1.0\\/mm\\/\\\"\\n            xmlns:stEvt=\\\"http:\\/\\/ns.adobe.com\\/xap\\/1.0\\/sType\\/ResourceEvent#\\\"\\n            xmlns:tiff=\\\"http:\\/\\/ns.adobe.com\\/tiff\\/1.0\\/\\\"\\n            xmlns:exif=\\\"http:\\/\\/ns.adobe.com\\/exif\\/1.0\\/\\\">\\n         <xmp:CreateDate>2015-04-07T10:50:46+10:00<\\/xmp:CreateDate>\\n         <xmp:ModifyDate>2015-04-07T10:52:05+10:00<\\/xmp:ModifyDate>\\n         <xmp:MetadataDate>2015-04-07T10:52:05+10:00<\\/xmp:MetadataDate>\\n         <xmp:CreatorTool>Adobe Photoshop CC 2014 (Macintosh)<\\/xmp:CreatorTool>\\n         <dc:format>image\\/png<\\/dc:format>\\n         <photoshop:ColorMode>3<\\/photoshop:ColorMode>\\n         <photoshop:ICCProfile>Adobe RGB (1998)<\\/photoshop:ICCProfile>\\n         <xmpMM:InstanceID>xmp.iid:ca6d630f-ad05-4de6-9555-6c3abab39b8d<\\/xmpMM:InstanceID>\\n         <xmpMM:DocumentID>adobe:docid:photoshop:bcc9a12a-1d4e-1178-9a66-ff4148f92fcd<\\/xmpMM:DocumentID>\\n         <xmpMM:OriginalDocumentID>xmp.did:951664c2-36c6-4a38-adb7-59a6a6dfa2ac<\\/xmpMM:OriginalDocumentID>\\n         <xmpMM:History>\\n            <rdf:Seq>\\n               <rdf:li rdf:parseType=\\\"Resource\\\">\\n                  <stEvt:action>saved<\\/stEvt:action>\\n                  <stEvt:instanceID>xmp.iid:951664c2-36c6-4a38-adb7-59a6a6dfa2ac<\\/stEvt:instanceID>\\n                  <stEvt:when>2015-04-07T10:52:05+10:00<\\/stEvt:when>\\n                  <stEvt:softwareAgent>Adobe Photoshop CC 2014 (Macintosh)<\\/stEvt:softwareAgent>\\n                  <stEvt:changed>\\/<\\/stEvt:changed>\\n               <\\/rdf:li>\\n               <rdf:li rdf:parseType=\\\"Resource\\\">\\n                  <stEvt:action>saved<\\/stEvt:action>\\n                  <stEvt:instanceID>xmp.iid:ca6d630f-ad05-4de6-9555-6c3abab39b8d<\\/stEvt:instanceID>\\n                  <stEvt:when>2015-04-07T10:52:05+10:00<\\/stEvt:when>\\n                  <stEvt:softwareAgent>Adobe Photoshop CC 2014 (Macintosh)<\\/stEvt:softwareAgent>\\n                  <stEvt:changed>\\/<\\/stEvt:changed>\\n               <\\/rdf:li>\\n            <\\/rdf:Seq>\\n         <\\/xmpMM:History>\\n         <tiff:Orientation>1<\\/tiff:Orientation>\\n         <tiff:XResolution>720000\\/10000<\\/tiff:XResolution>\\n         <tiff:YResolution>720000\\/10000<\\/tiff:YResolution>\\n         <tiff:ResolutionUnit>2<\\/tiff:ResolutionUnit>\\n         <exif:ColorSpace>65535<\\/exif:ColorSpace>\\n         <exif:PixelXDimension>256<\\/exif:PixelXDimension>\\n         <exif:PixelYDimension>256<\\/exif:PixelYDimension>\\n      <\\/rdf:Description>\\n   <\\/rdf:RDF>\\n<\\/x:xmpmeta>\\n                                                                                                    \\n                                                                                                    \\n                                                                                                    \\n                                                                                                    \\n                                                                                                    \\n                                                                                                    \\n                                                                                                    \\n                                                                                                    \\n                                                                                                    \\n                                                                                                    \\n                                                                                                    \\n                                                                                                    \\n                                                                                                    \\n                                                                                                    \\n                                                                                                    \\n                                                                                                    \\n                                                                                                    \\n                                                                                                    \\n                                                                                                    \\n                                                                                                    \\n                                                                                                    \\n                                                                                                    \\n                                                                                                    \\n                                                                                                    \\n                                                                                                    \\n                                                                                                    \\n                                                                                                    \\n                                                                                                    \\n                                                                                                    \\n                                                                                                    \\n                                                                                                    \\n                                                                                                    \\n                                                                                                    \\n                                                                                                    \\n                                                                                                    \\n                                                                                                    \\n                                                                                                    \\n                                                                                                    \\n                                                                                                    \\n                                                                                                    \\n                                                                                                    \\n                                                                                                    \\n                                                                                                    \\n                                                                                                    \\n                                                                                                    \\n                                                                                                    \\n                                                                                                    \\n                                                                                                    \\n                                                                                                    \\n                                                                                                    \\n                                                                                                    \\n                                                                                                    \\n                                                                                                    \\n                                                                                                    \\n                                                                                                    \\n                                                                                                    \\n                                                                                                    \\n                                                                                                    \\n                                                                                                    \\n                                                                                                    \\n                                                                                                    \\n                                                                                                    \\n                                                                                                    \\n                                                                                                    \\n                                                                                                    \\n                                                                                                    \\n                                                                                                    \\n                                                                                                    \\n                                                                                                    \\n                                                                                                    \\n                                                                                                    \\n                                                                                                    \\n                                                                                                    \\n                                                                                                    \\n                                                                                                    \\n                                                                                                    \\n                                                                                                    \\n                                                                                                    \\n                                                                                                    \\n                                                                                                    \\n                                                                                                    \\n                                                                                                    \\n                                                                                                    \\n                                                                                                    \\n                                                                                                    \\n                                                                                                    \\n                                                                                                    \\n                                                                                                    \\n                                                                                                    \\n                                                                                                    \\n                                                                                                    \\n                                                                                                    \\n                                                                                                    \\n                                                                                                    \\n                                                                                                    \\n                                                                                                    \\n                                                                                                    \\n                                                                                                    \\n                                                                                                    \\n                                                                                                    \\n                                                                                                    \\n                                                                                                    \\n                                                                                                    \\n                                                                                                    \\n                                                                                                    \\n                                                                                                    \\n                                                                                                    \\n                                                                                                    \\n                                                                                                    \\n                                                                                                    \\n                                                                                                    \\n                                                                                                    \\n                                                                                                    \\n                                                                                                    \\n                                                                                                    \\n                                                                                                    \\n                                                                                                    \\n                                                                                                    \\n                                                                                                    \\n                            \\n<?xpacket end=\\\"w\\\"?>\"]},\"comments_html\":{\"XML:com.adobe.xmp\":[\"&lt;?xpacket begin=&quot;&#65279;&quot; id=&quot;W5M0MpCehiHzreSzNTczkc9d&quot;?&gt;&#10;&lt;x:xmpmeta xmlns:x=&quot;adobe:ns:meta\\/&quot; x:xmptk=&quot;Adobe XMP Core 5.6-c014 79.156797, 2014\\/08\\/20-09:53:02        &quot;&gt;&#10;   &lt;rdf:RDF xmlns:rdf=&quot;http:\\/\\/www.w3.org\\/1999\\/02\\/22-rdf-syntax-ns#&quot;&gt;&#10;      &lt;rdf:Description rdf:about=&quot;&quot;&#10;            xmlns:xmp=&quot;http:\\/\\/ns.adobe.com\\/xap\\/1.0\\/&quot;&#10;            xmlns:dc=&quot;http:\\/\\/purl.org\\/dc\\/elements\\/1.1\\/&quot;&#10;            xmlns:photoshop=&quot;http:\\/\\/ns.adobe.com\\/photoshop\\/1.0\\/&quot;&#10;            xmlns:xmpMM=&quot;http:\\/\\/ns.adobe.com\\/xap\\/1.0\\/mm\\/&quot;&#10;            xmlns:stEvt=&quot;http:\\/\\/ns.adobe.com\\/xap\\/1.0\\/sType\\/ResourceEvent#&quot;&#10;            xmlns:tiff=&quot;http:\\/\\/ns.adobe.com\\/tiff\\/1.0\\/&quot;&#10;            xmlns:exif=&quot;http:\\/\\/ns.adobe.com\\/exif\\/1.0\\/&quot;&gt;&#10;         &lt;xmp:CreateDate&gt;2015-04-07T10:50:46+10:00&lt;\\/xmp:CreateDate&gt;&#10;         &lt;xmp:ModifyDate&gt;2015-04-07T10:52:05+10:00&lt;\\/xmp:ModifyDate&gt;&#10;         &lt;xmp:MetadataDate&gt;2015-04-07T10:52:05+10:00&lt;\\/xmp:MetadataDate&gt;&#10;         &lt;xmp:CreatorTool&gt;Adobe Photoshop CC 2014 (Macintosh)&lt;\\/xmp:CreatorTool&gt;&#10;         &lt;dc:format&gt;image\\/png&lt;\\/dc:format&gt;&#10;         &lt;photoshop:ColorMode&gt;3&lt;\\/photoshop:ColorMode&gt;&#10;         &lt;photoshop:ICCProfile&gt;Adobe RGB (1998)&lt;\\/photoshop:ICCProfile&gt;&#10;         &lt;xmpMM:InstanceID&gt;xmp.iid:ca6d630f-ad05-4de6-9555-6c3abab39b8d&lt;\\/xmpMM:InstanceID&gt;&#10;         &lt;xmpMM:DocumentID&gt;adobe:docid:photoshop:bcc9a12a-1d4e-1178-9a66-ff4148f92fcd&lt;\\/xmpMM:DocumentID&gt;&#10;         &lt;xmpMM:OriginalDocumentID&gt;xmp.did:951664c2-36c6-4a38-adb7-59a6a6dfa2ac&lt;\\/xmpMM:OriginalDocumentID&gt;&#10;         &lt;xmpMM:History&gt;&#10;            &lt;rdf:Seq&gt;&#10;               &lt;rdf:li rdf:parseType=&quot;Resource&quot;&gt;&#10;                  &lt;stEvt:action&gt;saved&lt;\\/stEvt:action&gt;&#10;                  &lt;stEvt:instanceID&gt;xmp.iid:951664c2-36c6-4a38-adb7-59a6a6dfa2ac&lt;\\/stEvt:instanceID&gt;&#10;                  &lt;stEvt:when&gt;2015-04-07T10:52:05+10:00&lt;\\/stEvt:when&gt;&#10;                  &lt;stEvt:softwareAgent&gt;Adobe Photoshop CC 2014 (Macintosh)&lt;\\/stEvt:softwareAgent&gt;&#10;                  &lt;stEvt:changed&gt;\\/&lt;\\/stEvt:changed&gt;&#10;               &lt;\\/rdf:li&gt;&#10;               &lt;rdf:li rdf:parseType=&quot;Resource&quot;&gt;&#10;                  &lt;stEvt:action&gt;saved&lt;\\/stEvt:action&gt;&#10;                  &lt;stEvt:instanceID&gt;xmp.iid:ca6d630f-ad05-4de6-9555-6c3abab39b8d&lt;\\/stEvt:instanceID&gt;&#10;                  &lt;stEvt:when&gt;2015-04-07T10:52:05+10:00&lt;\\/stEvt:when&gt;&#10;                  &lt;stEvt:softwareAgent&gt;Adobe Photoshop CC 2014 (Macintosh)&lt;\\/stEvt:softwareAgent&gt;&#10;                  &lt;stEvt:changed&gt;\\/&lt;\\/stEvt:changed&gt;&#10;               &lt;\\/rdf:li&gt;&#10;            &lt;\\/rdf:Seq&gt;&#10;         &lt;\\/xmpMM:History&gt;&#10;         &lt;tiff:Orientation&gt;1&lt;\\/tiff:Orientation&gt;&#10;         &lt;tiff:XResolution&gt;720000\\/10000&lt;\\/tiff:XResolution&gt;&#10;         &lt;tiff:YResolution&gt;720000\\/10000&lt;\\/tiff:YResolution&gt;&#10;         &lt;tiff:ResolutionUnit&gt;2&lt;\\/tiff:ResolutionUnit&gt;&#10;         &lt;exif:ColorSpace&gt;65535&lt;\\/exif:ColorSpace&gt;&#10;         &lt;exif:PixelXDimension&gt;256&lt;\\/exif:PixelXDimension&gt;&#10;         &lt;exif:PixelYDimension&gt;256&lt;\\/exif:PixelYDimension&gt;&#10;      &lt;\\/rdf:Description&gt;&#10;   &lt;\\/rdf:RDF&gt;&#10;&lt;\\/x:xmpmeta&gt;&#10;                                                                                                    &#10;                                                                                                    &#10;                                                                                                    &#10;                                                                                                    &#10;                                                                                                    &#10;                                                                                                    &#10;                                                                                                    &#10;                                                                                                    &#10;                                                                                                    &#10;                                                                                                    &#10;                                                                                                    &#10;                                                                                                    &#10;                                                                                                    &#10;                                                                                                    &#10;                                                                                                    &#10;                                                                                                    &#10;                                                                                                    &#10;                                                                                                    &#10;                                                                                                    &#10;                                                                                                    &#10;                                                                                                    &#10;                                                                                                    &#10;                                                                                                    &#10;                                                                                                    &#10;                                                                                                    &#10;                                                                                                    &#10;                                                                                                    &#10;                                                                                                    &#10;                                                                                                    &#10;                                                                                                    &#10;                                                                                                    &#10;                                                                                                    &#10;                                                                                                    &#10;                                                                                                    &#10;                                                                                                    &#10;                                                                                                    &#10;                                                                                                    &#10;                                                                                                    &#10;                                                                                                    &#10;                                                                                                    &#10;                                                                                                    &#10;                                                                                                    &#10;                                                                                                    &#10;                                                                                                    &#10;                                                                                                    &#10;                                                                                                    &#10;                                                                                                    &#10;                                                                                                    &#10;                                                                                                    &#10;                                                                                                    &#10;                                                                                                    &#10;                                                                                                    &#10;                                                                                                    &#10;                                                                                                    &#10;                                                                                                    &#10;                                                                                                    &#10;                                                                                                    &#10;                                                                                                    &#10;                                                                                                    &#10;                                                                                                    &#10;                                                                                                    &#10;                                                                                                    &#10;                                                                                                    &#10;                                                                                                    &#10;                                                                                                    &#10;                                                                                                    &#10;                                                                                                    &#10;                                                                                                    &#10;                                                                                                    &#10;                                                                                                    &#10;                                                                                                    &#10;                                                                                                    &#10;                                                                                                    &#10;                                                                                                    &#10;                                                                                                    &#10;                                                                                                    &#10;                                                                                                    &#10;                                                                                                    &#10;                                                                                                    &#10;                                                                                                    &#10;                                                                                                    &#10;                                                                                                    &#10;                                                                                                    &#10;                                                                                                    &#10;                                                                                                    &#10;                                                                                                    &#10;                                                                                                    &#10;                                                                                                    &#10;                                                                                                    &#10;                                                                                                    &#10;                                                                                                    &#10;                                                                                                    &#10;                                                                                                    &#10;                                                                                                    &#10;                                                                                                    &#10;                                                                                                    &#10;                                                                                                    &#10;                                                                                                    &#10;                                                                                                    &#10;                                                                                                    &#10;                                                                                                    &#10;                                                                                                    &#10;                                                                                                    &#10;                                                                                                    &#10;                                                                                                    &#10;                                                                                                    &#10;                                                                                                    &#10;                                                                                                    &#10;                                                                                                    &#10;                                                                                                    &#10;                                                                                                    &#10;                                                                                                    &#10;                                                                                                    &#10;                                                                                                    &#10;                                                                                                    &#10;                                                                                                    &#10;                                                                                                    &#10;                                                                                                    &#10;                                                                                                    &#10;                            &#10;&lt;?xpacket end=&quot;w&quot;?&gt;\"]}}'),(26,23,NULL,245748,1,'1926ebc7f267b2ced56ab4604cd2d4bd','image/jpeg','JPEG image data, JFIF standard 1.01','eaaf68a0bd93d3169b1914a2109096e7.JPG','Snapshot Seasons-mac1-sliderBody-Winter.JPG','2015-10-01 22:24:17','2015-10-01 14:57:17',1,'{\"mime_type\":\"image\\/jpeg\",\"video\":{\"dataformat\":\"jpg\",\"lossless\":false,\"bits_per_sample\":24,\"pixel_aspect_ratio\":1}}'),(30,27,NULL,75654,1,'72f8d1bc66b466adb5651b54153a8094','image/jpeg','JPEG image data, JFIF standard 1.01','1b383a727b7dd5776d0761da5f651a50.JPG','Snapshot Berlin-mac1.JPG','2015-10-01 22:21:08','2015-10-01 14:59:49',1,'{\"mime_type\":\"image\\/jpeg\",\"video\":{\"dataformat\":\"jpg\",\"lossless\":false,\"bits_per_sample\":24,\"pixel_aspect_ratio\":1}}');
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
INSERT INTO `omeka_item_types` VALUES (1,'Text','A resource consisting primarily of words for reading. Examples include books, letters, dissertations, poems, newspapers, articles, archives of mailing lists. Note that facsimiles or images of texts are still of the genre Text.'),(3,'Moving Image','A series of visual representations imparting an impression of motion when shown in succession. Examples include animations, movies, television programs, videos, zoetropes, or visual output from a simulation.'),(4,'Oral History','A resource containing historical information obtained in interviews with persons having firsthand knowledge.'),(5,'Sound','A resource primarily intended to be heard. Examples include a music playback file format, an audio compact disc, and recorded speech or sounds.'),(6,'Still Image','A static visual representation. Examples include paintings, drawings, graphic designs, plans and maps. Recommended best practice is to assign the type Text to images of textual materials.'),(7,'Website','A resource comprising of a web page or web pages and all related assets ( such as images, sound and video files, etc. ).'),(8,'Event','A non-persistent, time-based occurrence. Metadata for an event provides descriptive information that is the basis for discovery of the purpose, location, duration, and responsible agents associated with an event. Examples include an exhibition, webcast, conference, workshop, open day, performance, battle, trial, wedding, tea party, conflagration.'),(9,'Email','A resource containing textual messages and binary attachments sent electronically from one person to another or one person to many people.'),(10,'Lesson Plan','A resource that gives a detailed description of a course of instruction.'),(11,'Hyperlink','A link, or reference, to another resource on the Internet.'),(12,'Person','An individual.'),(13,'Interactive Resource','A resource requiring interaction from the user to be understood, executed, or experienced. Examples include forms on Web pages, applets, multimedia learning objects, chat services, or virtual reality environments.'),(14,'Dataset','Data encoded in a defined structure. Examples include lists, tables, and databases. A dataset may be useful for direct machine processing.'),(15,'Physical Object','An inanimate, three-dimensional object or substance. Note that digital representations of, or surrogates for, these objects should use Moving Image, Still Image, Text or one of the other types.'),(16,'Service','A system that provides one or more functions. Examples include a photocopying service, a banking service, an authentication service, interlibrary loans, a Z39.50 or Web server.'),(17,'Software','A computer program in source or compiled form. Examples include a C source file, MS-Windows .exe executable, or Perl script.');
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
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `omeka_items`
--

LOCK TABLES `omeka_items` WRITE;
/*!40000 ALTER TABLE `omeka_items` DISABLE KEYS */;
INSERT INTO `omeka_items` VALUES (1,6,2,0,1,'2015-10-29 14:08:31','2015-09-04 12:29:30',1),(2,6,2,0,1,'2015-10-01 18:42:12','2015-09-08 17:10:52',1),(3,11,1,1,1,'2015-10-29 14:00:41','2015-09-08 17:13:28',1),(4,6,2,0,1,'2015-10-29 14:01:51','2015-09-08 18:40:30',1),(5,11,1,0,1,'2015-10-06 08:43:12','2015-09-23 05:53:11',1),(6,11,2,1,1,'2015-10-06 08:40:47','2015-09-23 05:54:20',1),(7,11,2,1,1,'2015-10-06 08:41:09','2015-09-23 05:55:24',1),(8,6,1,0,1,'2015-10-29 14:02:41','2015-09-23 06:01:28',1),(9,11,2,1,1,'2015-10-06 08:41:30','2015-09-23 06:02:22',1),(15,6,NULL,0,0,'2015-10-01 22:34:21','2015-09-23 14:28:28',1),(19,11,1,1,1,'2015-10-29 13:56:00','2015-09-23 17:13:08',1),(20,11,1,0,1,'2015-10-29 13:58:25','2015-09-23 17:15:06',1),(21,11,2,1,1,'2015-10-06 08:41:50','2015-09-23 17:17:53',1),(23,NULL,NULL,0,1,'2015-10-29 14:09:09','2015-10-01 14:57:17',1),(27,NULL,NULL,0,1,'2015-10-29 14:09:09','2015-10-01 14:59:49',1);
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
) ENGINE=InnoDB AUTO_INCREMENT=594 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `omeka_options`
--

LOCK TABLES `omeka_options` WRITE;
/*!40000 ALTER TABLE `omeka_options` DISABLE KEYS */;
INSERT INTO `omeka_options` VALUES (7,'thumbnail_constraint','200'),(8,'square_thumbnail_constraint','200'),(9,'fullsize_constraint','800'),(10,'per_page_admin','10'),(11,'per_page_public','10'),(12,'show_empty_elements','0'),(14,'admin_theme','default'),(20,'display_system_info','1'),(26,'search_record_types','a:3:{s:4:\"Item\";s:4:\"Item\";s:4:\"File\";s:4:\"File\";s:10:\"Collection\";s:10:\"Collection\";}'),(27,'api_enable',''),(28,'api_per_page','50'),(29,'show_element_set_headings','1'),(32,'omeka_version','2.3.1'),(35,'exhibit_builder_sort_browse','recent'),(37,'simple_pages_filter_page_content','0'),(57,'digitalobjectlinkerplugin_embed_admin','0'),(58,'digitalobjectlinkerplugin_width_admin','200'),(59,'digitalobjectlinkerplugin_embed_public','0'),(60,'digitalobjectlinkerplugin_width_public','200'),(61,'digitalobjectlinkerplugin_items_page_width_public','400'),(62,'digitalobjectlinkerplugin_thumb_tag','thumb:'),(63,'digitalobjectlinkerplugin_preg_thumb_string','/^thumb:([a-zA-Z0-9]*:){0,1}/'),(64,'digitalobjectlinkerplugin_full_image_tag','full:'),(65,'digitalobjectlinkerplugin_preg_full_image_string','/^full:([a-zA-Z0-9]*:){0,1}/'),(66,'digitalobjectlinkerplugin_linkto_tag','linkto:'),(67,'digitalobjectlinkerplugin_preg_linkto_string','/^linkto:([a-zA-Z0-9]*:){0,1}/'),(68,'csv_import_memory_limit',''),(69,'csv_import_php_path',''),(70,'csv_import_column_delimiter',','),(71,'csv_import_element_delimiter',''),(72,'csv_import_tag_delimiter',','),(73,'csv_import_file_delimiter',','),(75,'collection_tree_alpha_order','0'),(79,'social_bookmarking_add_to_omeka_items','1'),(80,'social_bookmarking_add_to_omeka_collections','1'),(81,'social_bookmarking_services','a:299:{s:11:\"100zakladok\";i:0;s:7:\"2linkme\";i:0;s:4:\"2tag\";i:0;s:6:\"a97abi\";i:0;s:10:\"addressbar\";i:0;s:5:\"adfty\";i:0;s:6:\"adifni\";i:0;s:5:\"advqr\";i:0;s:3:\"aim\";i:0;s:14:\"amazonwishlist\";i:0;s:6:\"amenme\";i:0;s:7:\"aolmail\";i:0;s:7:\"apsense\";i:0;s:4:\"arto\";i:0;s:7:\"azadegi\";i:0;s:5:\"baang\";i:0;s:5:\"baidu\";i:0;s:9:\"balltribe\";i:0;s:7:\"beat100\";i:0;s:13:\"biggerpockets\";i:0;s:5:\"bitly\";i:0;s:8:\"bizsugar\";i:0;s:5:\"bland\";i:0;s:9:\"blinklist\";i:0;s:7:\"blogger\";i:0;s:6:\"bloggy\";i:0;s:8:\"blogkeen\";i:0;s:9:\"blogmarks\";i:0;s:13:\"blurpalicious\";i:0;s:8:\"bobrdobr\";i:0;s:8:\"bonzobox\";i:0;s:11:\"bookmarkycz\";i:0;s:12:\"bookmerkende\";i:0;s:3:\"box\";i:0;s:8:\"brainify\";i:0;s:7:\"bryderi\";i:0;s:10:\"buddymarks\";i:0;s:6:\"buffer\";i:0;s:6:\"buzzzy\";i:0;s:6:\"camyoo\";i:0;s:5:\"care2\";i:0;s:4:\"chiq\";i:0;s:5:\"cirip\";i:0;s:9:\"citeulike\";i:0;s:14:\"classicalplace\";i:0;s:10:\"cleanprint\";i:0;s:9:\"cleansave\";i:0;s:5:\"cndig\";i:0;s:7:\"colivia\";i:0;s:6:\"cosmiq\";i:0;s:8:\"cssbased\";i:0;s:8:\"curateus\";i:0;s:9:\"delicious\";i:1;s:14:\"digaculturanet\";i:0;s:4:\"digg\";i:0;s:7:\"diggita\";i:0;s:4:\"digo\";i:0;s:5:\"diigo\";i:0;s:16:\"domaintoolswhois\";i:0;s:8:\"domelhor\";i:0;s:14:\"dotnetshoutout\";i:0;s:6:\"douban\";i:0;s:8:\"draugiem\";i:0;s:8:\"dropjack\";i:0;s:4:\"dudu\";i:0;s:5:\"dzone\";i:0;s:7:\"efactor\";i:0;s:6:\"ekudos\";i:0;s:10:\"elefantapl\";i:0;s:5:\"email\";i:1;s:9:\"embarkons\";i:0;s:8:\"evernote\";i:0;s:9:\"extraplay\";i:0;s:7:\"ezyspot\";i:0;s:12:\"fabulously40\";i:0;s:8:\"facebook\";i:1;s:13:\"facebook_like\";i:0;s:4:\"fark\";i:0;s:8:\"farkinda\";i:0;s:11:\"fashiolista\";i:0;s:7:\"favable\";i:0;s:5:\"faves\";i:0;s:8:\"favlogde\";i:0;s:11:\"favoritende\";i:0;s:9:\"favorites\";i:0;s:9:\"favoritus\";i:0;s:14:\"financialjuice\";i:0;s:6:\"flaker\";i:0;s:9:\"flipboard\";i:0;s:5:\"folkd\";i:0;s:7:\"foodlve\";i:0;s:10:\"formspring\";i:0;s:10:\"foursquare\";i:0;s:7:\"fresqui\";i:0;s:10:\"friendfeed\";i:0;s:4:\"funp\";i:0;s:5:\"fwisp\";i:0;s:10:\"gamekicker\";i:0;s:2:\"gg\";i:0;s:7:\"giftery\";i:0;s:9:\"gigbasket\";i:0;s:9:\"givealink\";i:0;s:8:\"gluvsnap\";i:0;s:5:\"gmail\";i:0;s:9:\"goodnoows\";i:0;s:6:\"google\";i:0;s:14:\"google_plusone\";i:0;s:20:\"google_plusone_share\";i:1;s:10:\"googleplus\";i:0;s:15:\"googletranslate\";i:0;s:4:\"govn\";i:0;s:14:\"greaterdebater\";i:0;s:10:\"hackernews\";i:0;s:6:\"hatena\";i:0;s:9:\"hedgehogs\";i:0;s:10:\"historious\";i:0;s:9:\"hootsuite\";i:0;s:7:\"hotklix\";i:0;s:7:\"hotmail\";i:0;s:8:\"identica\";i:0;s:8:\"ihavegot\";i:0;s:7:\"indexor\";i:0;s:12:\"informazione\";i:0;s:10:\"instapaper\";i:0;s:15:\"internetarchive\";i:0;s:6:\"iorbix\";i:0;s:9:\"irepeater\";i:0;s:8:\"isociety\";i:0;s:4:\"iwiw\";i:0;s:8:\"jamespot\";i:0;s:5:\"jappy\";i:0;s:5:\"jolly\";i:0;s:8:\"jumptags\";i:0;s:8:\"kaboodle\";i:0;s:6:\"kaevur\";i:0;s:6:\"kaixin\";i:0;s:7:\"ketnooi\";i:0;s:8:\"kindleit\";i:0;s:5:\"kledy\";i:0;s:10:\"kommenting\";i:0;s:13:\"latafaneracat\";i:0;s:8:\"librerio\";i:0;s:5:\"lidar\";i:0;s:8:\"linkedin\";i:1;s:11:\"linksgutter\";i:0;s:10:\"linkshares\";i:0;s:6:\"linkuj\";i:0;s:4:\"live\";i:0;s:11:\"livejournal\";i:0;s:13:\"lockerblogger\";i:0;s:8:\"logger24\";i:0;s:6:\"mailto\";i:0;s:8:\"margarin\";i:0;s:6:\"markme\";i:0;s:7:\"mashant\";i:0;s:8:\"mashbord\";i:0;s:6:\"me2day\";i:0;s:6:\"meinvz\";i:0;s:10:\"mekusharim\";i:0;s:7:\"memonic\";i:0;s:6:\"memori\";i:0;s:8:\"mendeley\";i:0;s:7:\"meneame\";i:0;s:10:\"misterwong\";i:0;s:13:\"misterwong_de\";i:0;s:4:\"mixi\";i:0;s:8:\"moemesto\";i:0;s:7:\"moikrug\";i:0;s:12:\"mrcnetworkit\";i:0;s:8:\"mymailru\";i:0;s:7:\"myspace\";i:0;s:9:\"myvidster\";i:0;s:3:\"n4g\";i:0;s:10:\"naszaklasa\";i:0;s:6:\"netlog\";i:0;s:8:\"netvibes\";i:0;s:7:\"netvouz\";i:0;s:10:\"newsmeback\";i:0;s:9:\"newstrust\";i:0;s:8:\"newsvine\";i:0;s:5:\"nujij\";i:0;s:16:\"odnoklassniki_ru\";i:0;s:9:\"oknotizie\";i:0;s:11:\"openthedoor\";i:0;s:5:\"oyyla\";i:0;s:5:\"packg\";i:0;s:8:\"pafnetde\";i:0;s:8:\"pdfmyurl\";i:0;s:9:\"pdfonline\";i:0;s:9:\"phonefavs\";i:0;s:9:\"pinterest\";i:0;s:15:\"pinterest_share\";i:1;s:8:\"planypus\";i:0;s:5:\"plaxo\";i:0;s:5:\"plurk\";i:0;s:6:\"pocket\";i:0;s:8:\"posteezy\";i:0;s:5:\"print\";i:0;s:13:\"printfriendly\";i:0;s:5:\"pusha\";i:0;s:5:\"qrfin\";i:0;s:5:\"qrsrc\";i:0;s:9:\"quantcast\";i:0;s:5:\"qzone\";i:0;s:14:\"raiseyourvoice\";i:0;s:6:\"reddit\";i:0;s:6:\"rediff\";i:0;s:6:\"redkum\";i:0;s:12:\"researchgate\";i:0;s:11:\"safelinking\";i:0;s:7:\"scoopat\";i:0;s:7:\"scoopit\";i:0;s:7:\"sekoman\";i:0;s:13:\"select2gether\";i:0;s:6:\"sharer\";i:0;s:6:\"shaveh\";i:0;s:9:\"shetoldme\";i:0;s:9:\"sinaweibo\";i:0;s:7:\"skyrock\";i:0;s:5:\"smiru\";i:0;s:20:\"socialbookmarkingnet\";i:0;s:8:\"sodahead\";i:0;s:6:\"sonico\";i:0;s:8:\"spinsnap\";i:0;s:9:\"springpad\";i:0;s:8:\"startaid\";i:0;s:8:\"startlap\";i:0;s:13:\"storyfollower\";i:0;s:7:\"studivz\";i:0;s:8:\"stuffpit\";i:0;s:11:\"stumbleupon\";i:0;s:9:\"stumpedia\";i:0;s:11:\"stylishhome\";i:0;s:5:\"sulia\";i:0;s:7:\"sunlize\";i:0;s:6:\"supbro\";i:0;s:11:\"surfingbird\";i:0;s:5:\"svejo\";i:0;s:8:\"symbaloo\";i:0;s:5:\"taaza\";i:0;s:5:\"tagza\";i:0;s:8:\"tapiture\";i:0;s:7:\"taringa\";i:0;s:8:\"technerd\";i:0;s:6:\"textme\";i:0;s:8:\"thefancy\";i:0;s:17:\"thefreedictionary\";i:0;s:11:\"thewebblend\";i:0;s:11:\"thinkfinity\";i:0;s:8:\"thisnext\";i:0;s:8:\"thrillon\";i:0;s:9:\"throwpile\";i:0;s:4:\"toly\";i:0;s:13:\"topsitelernet\";i:0;s:9:\"transferr\";i:0;s:6:\"tuenti\";i:0;s:6:\"tulinq\";i:0;s:6:\"tumblr\";i:0;s:5:\"tvinx\";i:0;s:7:\"twitter\";i:1;s:8:\"twitthis\";i:0;s:7:\"typepad\";i:0;s:6:\"upnews\";i:0;s:13:\"urlaubswerkde\";i:0;s:6:\"viadeo\";i:0;s:4:\"virb\";i:0;s:14:\"visitezmonsite\";i:0;s:2:\"vk\";i:0;s:12:\"vkrugudruzei\";i:0;s:9:\"voxopolis\";i:0;s:10:\"vybralisme\";i:0;s:11:\"w3validator\";i:0;s:6:\"wanelo\";i:0;s:7:\"webnews\";i:0;s:8:\"webshare\";i:0;s:11:\"werkenntwen\";i:0;s:8:\"whatsapp\";i:0;s:7:\"windows\";i:0;s:7:\"wirefan\";i:0;s:9:\"wishmindr\";i:0;s:9:\"wordpress\";i:0;s:8:\"wowbored\";i:0;s:5:\"wykop\";i:0;s:5:\"xanga\";i:0;s:4:\"xing\";i:0;s:8:\"yahoobkm\";i:0;s:9:\"yahoomail\";i:0;s:6:\"yammer\";i:0;s:10:\"yardbarker\";i:0;s:4:\"yigg\";i:0;s:4:\"yiid\";i:0;s:6:\"yookos\";i:0;s:7:\"yoolink\";i:0;s:10:\"yorumcuyum\";i:0;s:6:\"youmob\";i:0;s:5:\"yuuby\";i:0;s:11:\"zakladoknet\";i:0;s:6:\"ziczac\";i:0;s:6:\"zingme\";i:0;}'),(270,'theme_santa-fe_options','a:9:{s:4:\"logo\";s:36:\"9ed7c1c958ddbd67dca088518645baaa.jpg\";s:21:\"display_featured_item\";s:1:\"0\";s:27:\"display_featured_collection\";s:1:\"1\";s:24:\"display_featured_exhibit\";s:1:\"1\";s:21:\"homepage_recent_items\";s:0:\"\";s:13:\"homepage_text\";s:0:\"\";s:11:\"footer_text\";s:0:\"\";s:24:\"display_footer_copyright\";s:1:\"0\";s:19:\"use_advanced_search\";s:1:\"0\";}'),(273,'theme_minimalist_options','a:10:{s:4:\"logo\";s:36:\"64e7a1f4c5c1f57a902f26b5f5002aa6.jpg\";s:21:\"display_featured_item\";s:1:\"0\";s:27:\"display_featured_collection\";s:1:\"1\";s:24:\"display_featured_exhibit\";s:1:\"1\";s:21:\"homepage_recent_items\";s:0:\"\";s:13:\"homepage_text\";s:0:\"\";s:11:\"footer_text\";s:0:\"\";s:24:\"display_footer_copyright\";s:1:\"0\";s:19:\"use_advanced_search\";s:1:\"1\";s:12:\"exhibits_nav\";s:4:\"full\";}'),(292,'theme_rhythm_options','a:8:{s:11:\"style_sheet\";s:4:\"fall\";s:12:\"site_tagline\";s:0:\"\";s:4:\"logo\";s:36:\"129204e000aa589aef2d07a1efd89444.jpg\";s:21:\"homepage_recent_items\";s:1:\"2\";s:13:\"homepage_text\";s:77:\"<h4>Welcome to Macquarie University Museum of Ancient Cultures web site.</h4>\";s:11:\"footer_text\";s:11:\"footer text\";s:24:\"display_footer_copyright\";s:1:\"1\";s:19:\"use_advanced_search\";s:1:\"1\";}'),(310,'theme_berlin_options','a:10:{s:4:\"logo\";s:36:\"2aa045adf2459260b95cb98808c7a48c.jpg\";s:12:\"header_image\";N;s:21:\"display_featured_item\";s:1:\"0\";s:27:\"display_featured_collection\";s:1:\"1\";s:24:\"display_featured_exhibit\";s:1:\"1\";s:21:\"homepage_recent_items\";s:1:\"2\";s:13:\"homepage_text\";s:440:\"<p>Welcome to the Macquarie University Museum of Ancient Cultures web site!</p>\n<p>This Museum is an Ancient History/ Archaeology museum designed to support the teaching of undergraduate and postgraduate programs on offer at Macquarie University within the department of Ancient History. It also promotes Ancient History and Archaeology to the primary and secondary schools of NSW and the ACT as well as to the broader general community</p>\";s:11:\"footer_text\";s:0:\"\";s:24:\"display_footer_copyright\";s:1:\"1\";s:19:\"use_advanced_search\";s:1:\"0\";}'),(326,'theme_emiglio_options','a:11:{s:12:\"header_image\";N;s:21:\"display_featured_item\";s:1:\"1\";s:27:\"display_featured_collection\";s:1:\"1\";s:24:\"display_featured_exhibit\";s:1:\"1\";s:21:\"homepage_recent_items\";s:1:\"2\";s:13:\"homepage_text\";s:68:\"<h3>Welcome to Macquarie University Museum of Ancient Cultures!</h3>\";s:11:\"footer_text\";s:0:\"\";s:24:\"display_footer_copyright\";s:1:\"0\";s:17:\"item_file_gallery\";s:1:\"1\";s:19:\"use_advanced_search\";s:1:\"0\";s:4:\"logo\";s:36:\"627c7be7b77e5b68e7b7f8b8d5bec2d0.jpg\";}'),(333,'theme_seasons_options','a:12:{s:11:\"style_sheet\";s:6:\"winter\";s:21:\"display_featured_item\";s:1:\"1\";s:27:\"display_featured_collection\";s:1:\"1\";s:24:\"display_featured_exhibit\";s:1:\"1\";s:21:\"homepage_recent_items\";s:1:\"1\";s:13:\"homepage_text\";s:90:\"Welcome to Macquarie University Museum of Ancient Cultures!<br /><br /><span><br /></span>\";s:11:\"footer_text\";s:0:\"\";s:24:\"display_footer_copyright\";s:1:\"0\";s:17:\"item_file_gallery\";s:1:\"1\";s:19:\"use_advanced_search\";s:1:\"1\";s:12:\"exhibits_nav\";s:4:\"full\";s:4:\"logo\";s:36:\"9a98ef4c18a3e1f5038637ed232e0347.jpg\";}'),(367,'theme_minimalist-mac1_options','a:10:{s:4:\"logo\";s:36:\"3b207b785ba3553d19377494f3ff47a9.jpg\";s:21:\"display_featured_item\";s:1:\"1\";s:27:\"display_featured_collection\";s:1:\"1\";s:24:\"display_featured_exhibit\";s:1:\"1\";s:21:\"homepage_recent_items\";s:1:\"2\";s:13:\"homepage_text\";s:68:\"<h4>Welcome to Macquarie University Museum of Ancient Cultures!</h4>\";s:11:\"footer_text\";s:0:\"\";s:24:\"display_footer_copyright\";s:1:\"0\";s:19:\"use_advanced_search\";s:1:\"1\";s:12:\"exhibits_nav\";s:4:\"full\";}'),(369,'theme_berlin-mac2_options','a:10:{s:4:\"logo\";s:36:\"a1a32fb8d140a06aa140186228c8aeab.jpg\";s:12:\"header_image\";N;s:21:\"display_featured_item\";s:1:\"1\";s:27:\"display_featured_collection\";s:1:\"1\";s:24:\"display_featured_exhibit\";s:1:\"1\";s:21:\"homepage_recent_items\";s:1:\"2\";s:13:\"homepage_text\";s:68:\"<h4>Welcome to Macquarie University Museum of Ancient Cultures!</h4>\";s:11:\"footer_text\";s:0:\"\";s:24:\"display_footer_copyright\";s:1:\"0\";s:19:\"use_advanced_search\";s:1:\"1\";}'),(390,'theme_default-mac1_options','a:17:{s:10:\"text_color\";s:7:\"#444444\";s:16:\"background_color\";s:7:\"#FFFFFF\";s:10:\"link_color\";s:7:\"#888888\";s:12:\"button_color\";s:7:\"#000000\";s:17:\"button_text_color\";s:7:\"#FFFFFF\";s:18:\"header_title_color\";s:7:\"#000000\";s:17:\"header_background\";N;s:11:\"footer_text\";s:0:\"\";s:24:\"display_footer_copyright\";s:1:\"0\";s:21:\"display_featured_item\";s:1:\"0\";s:27:\"display_featured_collection\";s:1:\"1\";s:24:\"display_featured_exhibit\";s:1:\"1\";s:21:\"homepage_recent_items\";s:1:\"3\";s:13:\"homepage_text\";s:464:\"<h2>Welcome to Macquarie University Museum of Ancient Cultures!</h2>\n<h3><span style=\"font-size:1.5em;\">Opening Hours</span></h3>\n<p>9.30am - 4.30pm Monday - Friday (Other times by special arrangement)</p>\n<p>Please note that the Museum is usually open for major University events such as Information and Open Days, as well as major Ancient History events such as the annual Ancient History Teachers\' Conference and student Study Days.<br /><br /></p>\n<h2> </h2>\";s:17:\"item_file_gallery\";s:1:\"1\";s:19:\"use_advanced_search\";s:1:\"1\";s:4:\"logo\";s:36:\"20ece02707d5b8b3986e937e90d30a20.jpg\";}'),(396,'theme_avantgarde_options','a:11:{s:12:\"header_image\";N;s:20:\"header_image_heading\";s:0:\"\";s:17:\"header_image_text\";s:0:\"\";s:21:\"display_featured_item\";s:1:\"1\";s:27:\"display_featured_collection\";s:1:\"1\";s:24:\"display_featured_exhibit\";s:1:\"0\";s:21:\"homepage_recent_items\";s:1:\"2\";s:13:\"homepage_text\";s:59:\"Welcome to Macquarie University Museum of Ancient Cultures!\";s:11:\"footer_text\";s:11:\"FOOTER TEXT\";s:19:\"use_advanced_search\";s:1:\"1\";s:4:\"logo\";s:36:\"fb4e0ab7b659cb1bbb86e0e38ca1f2bf.jpg\";}'),(446,'theme_default_options','a:17:{s:10:\"text_color\";s:7:\"#a6192e\";s:16:\"background_color\";s:7:\"#333333\";s:10:\"link_color\";s:7:\"#a6192e\";s:12:\"button_color\";s:7:\"#a6192e\";s:17:\"button_text_color\";s:7:\"#efede7\";s:18:\"header_title_color\";s:7:\"#333333\";s:11:\"footer_text\";s:0:\"\";s:24:\"display_footer_copyright\";s:1:\"1\";s:21:\"display_featured_item\";s:1:\"1\";s:27:\"display_featured_collection\";s:1:\"1\";s:24:\"display_featured_exhibit\";s:1:\"1\";s:21:\"homepage_recent_items\";s:0:\"\";s:13:\"homepage_text\";s:58:\"Welcome to Macquarie University Museum of Ancient Cultures\";s:17:\"item_file_gallery\";s:1:\"1\";s:19:\"use_advanced_search\";s:1:\"0\";s:4:\"logo\";s:36:\"bb5ceb2e67f56fc602e7545b5d94d650.jpg\";s:17:\"header_background\";s:36:\"dc6531b594eb63da3ed825f6dae1d2a5.jpg\";}'),(469,'theme_seasons-mac2_options','a:13:{s:11:\"style_sheet\";s:6:\"winter\";s:4:\"logo\";N;s:21:\"display_featured_item\";s:1:\"1\";s:27:\"display_featured_collection\";s:1:\"1\";s:24:\"display_featured_exhibit\";s:1:\"1\";s:21:\"homepage_recent_items\";N;s:13:\"homepage_text\";N;s:11:\"footer_text\";N;s:24:\"display_footer_copyright\";s:1:\"0\";s:17:\"item_file_gallery\";s:1:\"0\";s:19:\"use_advanced_search\";s:1:\"1\";s:12:\"exhibits_nav\";s:4:\"full\";s:17:\"theme_config_csrf\";N;}'),(477,'theme_seasons-mac1_options','a:12:{s:11:\"style_sheet\";s:6:\"winter\";s:21:\"display_featured_item\";s:1:\"1\";s:27:\"display_featured_collection\";s:1:\"1\";s:24:\"display_featured_exhibit\";s:1:\"1\";s:21:\"homepage_recent_items\";s:1:\"2\";s:13:\"homepage_text\";s:68:\"<h4>Welcome to Macquarie University Museum of Ancient Cultures!</h4>\";s:11:\"footer_text\";s:0:\"\";s:24:\"display_footer_copyright\";s:1:\"0\";s:17:\"item_file_gallery\";s:1:\"0\";s:19:\"use_advanced_search\";s:1:\"1\";s:12:\"exhibits_nav\";s:4:\"full\";s:4:\"logo\";s:36:\"5336125bf53a993a5fffd8708e1f2456.jpg\";}'),(521,'disable_default_file_validation','0'),(522,'file_extension_whitelist','aac,aif,aiff,asf,asx,avi,bmp,c,cc,class,css,divx,doc,docx,exe,gif,gz,gzip,h,ico,j2k,jp2,jpe,jpeg,jpg,m4a,mdb,mid,midi,mov,mp2,mp3,mp4,mpa,mpe,mpeg,mpg,mpp,odb,odc,odf,odg,odp,ods,odt,ogg, pdf,png,pot,pps,ppt,pptx,qt,ra,ram,rtf,rtx,swf,tar,tif,tiff,txt, wav,wax,wma,wmv,wmx,wri,xla,xls,xlsx,xlt,xlw,zip'),(523,'file_mime_type_whitelist','application/msword,application/ogg,application/pdf,application/rtf,application/vnd.ms-access,application/vnd.ms-excel,application/vnd.ms-powerpoint,application/vnd.ms-project,application/vnd.ms-write,application/vnd.oasis.opendocument.chart,application/vnd.oasis.opendocument.database,application/vnd.oasis.opendocument.formula,application/vnd.oasis.opendocument.graphics,application/vnd.oasis.opendocument.presentation,application/vnd.oasis.opendocument.spreadsheet,application/vnd.oasis.opendocument.text,application/x-ms-wmp,application/x-ogg,application/x-gzip,application/x-msdownload,application/x-shockwave-flash,application/x-tar,application/zip,audio/aac,audio/aiff,audio/mid,audio/midi,audio/mp3,audio/mp4,audio/mpeg,audio/mpeg3,audio/ogg,audio/wav,audio/wma,audio/x-aac,audio/x-aiff,audio/x-midi,audio/x-mp3,audio/x-mp4,audio/x-mpeg,audio/x-mpeg3,audio/x-mpegaudio,audio/x-ms-wax,audio/x-realaudio,audio/x-wav,audio/x-wma,image/bmp,image/gif,image/icon,image/jpeg,image/pjpeg,image/png,image/tiff,image/x-icon,image/x-ms-bmp,text/css,text/plain,text/richtext,text/rtf,video/asf,video/avi,video/divx,video/mp4,video/mpeg,video/msvideo,video/ogg,video/quicktime,video/x-ms-wmv,video/x-msvideo'),(524,'recaptcha_public_key',''),(525,'recaptcha_private_key',''),(526,'html_purifier_is_enabled','0'),(527,'html_purifier_allowed_html_elements','p,br,strong,em,span,div,ul,ol,li,a,h1,h2,h3,h4,h5,h6,address,pre,table,tr,td,blockquote,thead,tfoot,tbody,th,dl,dt,dd,q,small,strike,sup,sub,b,i,big,small,tt,javascript,script'),(528,'html_purifier_allowed_html_attributes','*.style,*.class,a.href,a.title,a.target,script'),(567,'theme_berlin-mac1_options','a:10:{s:4:\"logo\";s:36:\"ce506670924f0b126afdd820c961c13d.JPG\";s:21:\"display_featured_item\";s:1:\"1\";s:27:\"display_featured_collection\";s:1:\"1\";s:24:\"display_featured_exhibit\";s:1:\"1\";s:21:\"homepage_recent_items\";s:1:\"0\";s:13:\"homepage_text\";s:487:\"<h2>Welcome to <br />Aegyptiaca Down Under!</h2>\r\n<h5>This museum&nbsp;makes available to a world-wide public the rich and important collections of artefacts and monuments from Ancient Egypt now in Australian Collections; as well as an on-line catalogue with photographs of objects, its goal is to create a virtual Egyptian Museum accessible to all on the internet with high quality 3D image of all the most important objects that the viewer will be able to examine from all angles.</h5>\";s:11:\"footer_text\";s:0:\"\";s:24:\"display_footer_copyright\";s:1:\"0\";s:19:\"use_advanced_search\";s:1:\"1\";s:12:\"header_image\";s:36:\"4aa6979224f58ee0d03549ef0a549a5d.JPG\";}'),(571,'site_title','COMP356 Aegyptiaca Down Under (formerly MAC)'),(572,'description',''),(573,'administrator_email','Steve.Cassidy@mq.edu.au'),(574,'copyright',''),(575,'author',''),(576,'tag_delimiter',','),(577,'path_to_convert','/usr/bin'),(579,'public_theme','berlin-mac1'),(590,'public_navigation_main','[{\"uid\":\"\\/\",\"can_delete\":true,\"type\":\"Omeka_Navigation_Page_Uri\",\"label\":\"HOME\",\"fragment\":null,\"id\":null,\"class\":null,\"title\":null,\"target\":null,\"accesskey\":null,\"rel\":[],\"rev\":[],\"customHtmlAttribs\":[],\"order\":1,\"resource\":null,\"privilege\":null,\"active\":false,\"visible\":true,\"pages\":[],\"uri\":\"\\/\"},{\"uid\":\"\\/about\",\"can_delete\":false,\"type\":\"Omeka_Navigation_Page_Uri\",\"label\":\"ABOUT\",\"fragment\":null,\"id\":null,\"class\":null,\"title\":null,\"target\":null,\"accesskey\":null,\"rel\":[],\"rev\":[],\"customHtmlAttribs\":[],\"order\":2,\"resource\":null,\"privilege\":null,\"active\":false,\"visible\":true,\"pages\":[],\"uri\":\"\\/about\"},{\"uid\":\"\\/news_events\",\"can_delete\":false,\"type\":\"Omeka_Navigation_Page_Uri\",\"label\":\"NEWS+EVENTS\",\"fragment\":null,\"id\":null,\"class\":null,\"title\":null,\"target\":null,\"accesskey\":null,\"rel\":[],\"rev\":[],\"customHtmlAttribs\":[],\"order\":3,\"resource\":null,\"privilege\":null,\"active\":false,\"visible\":true,\"pages\":[],\"uri\":\"\\/news_events\"},{\"uid\":\"\\/collections\",\"can_delete\":false,\"type\":\"Omeka_Navigation_Page_Uri\",\"label\":\"COLLECTIONS\",\"fragment\":null,\"id\":null,\"class\":null,\"title\":null,\"target\":null,\"accesskey\":null,\"rel\":[],\"rev\":[],\"customHtmlAttribs\":[],\"order\":4,\"resource\":null,\"privilege\":null,\"active\":false,\"visible\":true,\"pages\":[{\"uid\":\"\\/collections\\/browse\",\"can_delete\":false,\"type\":\"Omeka_Navigation_Page_Uri\",\"label\":\"BROWSE COLLECTIONS\",\"fragment\":null,\"id\":null,\"class\":null,\"title\":null,\"target\":null,\"accesskey\":null,\"rel\":[],\"rev\":[],\"customHtmlAttribs\":[],\"order\":5,\"resource\":null,\"privilege\":null,\"active\":false,\"visible\":true,\"pages\":[{\"uid\":\"http:\\/\\/australianmuseum.net.au\\/\",\"can_delete\":true,\"type\":\"Omeka_Navigation_Page_Uri\",\"label\":\"The Australia Museum\",\"fragment\":null,\"id\":null,\"class\":null,\"title\":null,\"target\":null,\"accesskey\":null,\"rel\":[],\"rev\":[],\"customHtmlAttribs\":[],\"order\":6,\"resource\":null,\"privilege\":null,\"active\":false,\"visible\":false,\"pages\":[],\"uri\":\"http:\\/\\/australianmuseum.net.au\\/\"},{\"uid\":\"http:\\/\\/www.mq.edu.au\\/research\\/research-centres,-groups-and-facilities\\/resilient-societies\\/centres\\/ancient-cultures-research-centre\\/about-the-acrc\\/the-australian-centre-for-egyptology\\/fieldwork-activities\",\"can_delete\":true,\"type\":\"Omeka_Navigation_Page_Uri\",\"label\":\"ACRC\",\"fragment\":null,\"id\":null,\"class\":null,\"title\":null,\"target\":null,\"accesskey\":null,\"rel\":[],\"rev\":[],\"customHtmlAttribs\":[],\"order\":7,\"resource\":null,\"privilege\":null,\"active\":false,\"visible\":false,\"pages\":[],\"uri\":\"http:\\/\\/www.mq.edu.au\\/research\\/research-centres,-groups-and-facilities\\/resilient-societies\\/centres\\/ancient-cultures-research-centre\\/about-the-acrc\\/the-australian-centre-for-egyptology\\/fieldwork-activities\"}],\"uri\":\"\\/collections\\/browse\"},{\"uid\":\"\\/exhibits\",\"can_delete\":false,\"type\":\"Omeka_Navigation_Page_Uri\",\"label\":\"BROWSE EXHIBITS\",\"fragment\":null,\"id\":null,\"class\":null,\"title\":null,\"target\":null,\"accesskey\":null,\"rel\":[],\"rev\":[],\"customHtmlAttribs\":[],\"order\":8,\"resource\":null,\"privilege\":null,\"active\":false,\"visible\":true,\"pages\":[],\"uri\":\"\\/exhibits\"},{\"uid\":\"\\/items\\/browse\",\"can_delete\":false,\"type\":\"Omeka_Navigation_Page_Uri\",\"label\":\"BROWSE ITEMS\",\"fragment\":null,\"id\":null,\"class\":null,\"title\":null,\"target\":null,\"accesskey\":null,\"rel\":[],\"rev\":[],\"customHtmlAttribs\":[],\"order\":9,\"resource\":null,\"privilege\":null,\"active\":false,\"visible\":true,\"pages\":[],\"uri\":\"\\/items\\/browse\"}],\"uri\":\"\\/collections\"},{\"uid\":\"\\/contact\",\"can_delete\":false,\"type\":\"Omeka_Navigation_Page_Uri\",\"label\":\"CONTACT US\",\"fragment\":null,\"id\":null,\"class\":null,\"title\":null,\"target\":null,\"accesskey\":null,\"rel\":[],\"rev\":[],\"customHtmlAttribs\":[],\"order\":10,\"resource\":null,\"privilege\":null,\"active\":false,\"visible\":true,\"pages\":[],\"uri\":\"\\/contact\"},{\"uid\":\"http:\\/\\/www.mq.edu.au\",\"can_delete\":true,\"type\":\"Omeka_Navigation_Page_Uri\",\"label\":\"MQ\",\"fragment\":null,\"id\":null,\"class\":null,\"title\":null,\"target\":null,\"accesskey\":null,\"rel\":[],\"rev\":[],\"customHtmlAttribs\":[],\"order\":11,\"resource\":null,\"privilege\":null,\"active\":false,\"visible\":false,\"pages\":[],\"uri\":\"http:\\/\\/www.mq.edu.au\"},{\"uid\":\"\\/visit\",\"can_delete\":false,\"type\":\"Omeka_Navigation_Page_Uri\",\"label\":\"Your visit\",\"fragment\":null,\"id\":null,\"class\":null,\"title\":null,\"target\":null,\"accesskey\":null,\"rel\":[],\"rev\":[],\"customHtmlAttribs\":[],\"order\":12,\"resource\":null,\"privilege\":null,\"active\":false,\"visible\":false,\"pages\":[],\"uri\":\"\\/visit\"},{\"uid\":\"\\/news\",\"can_delete\":false,\"type\":\"Omeka_Navigation_Page_Uri\",\"label\":\"News\",\"fragment\":null,\"id\":null,\"class\":null,\"title\":null,\"target\":null,\"accesskey\":null,\"rel\":[],\"rev\":[],\"customHtmlAttribs\":[],\"order\":13,\"resource\":null,\"privilege\":null,\"active\":false,\"visible\":false,\"pages\":[],\"uri\":\"\\/news\"},{\"uid\":\"\\/events\",\"can_delete\":false,\"type\":\"Omeka_Navigation_Page_Uri\",\"label\":\"Events\",\"fragment\":null,\"id\":null,\"class\":null,\"title\":null,\"target\":null,\"accesskey\":null,\"rel\":[],\"rev\":[],\"customHtmlAttribs\":[],\"order\":14,\"resource\":null,\"privilege\":null,\"active\":false,\"visible\":false,\"pages\":[],\"uri\":\"\\/events\"},{\"uid\":\"\\/althome\",\"can_delete\":false,\"type\":\"Omeka_Navigation_Page_Uri\",\"label\":\"AltHome\",\"fragment\":null,\"id\":null,\"class\":null,\"title\":null,\"target\":null,\"accesskey\":null,\"rel\":[],\"rev\":[],\"customHtmlAttribs\":[],\"order\":15,\"resource\":null,\"privilege\":null,\"active\":false,\"visible\":false,\"pages\":[],\"uri\":\"\\/althome\"}]'),(591,'homepage_uri','/'),(593,'omeka_update','a:2:{s:14:\"latest_version\";s:5:\"2.3.1\";s:12:\"last_updated\";i:1454829402;}');
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `omeka_plugins`
--

LOCK TABLES `omeka_plugins` WRITE;
/*!40000 ALTER TABLE `omeka_plugins` DISABLE KEYS */;
INSERT INTO `omeka_plugins` VALUES (1,'ExhibitBuilder',1,'3.2.1'),(2,'SimplePages',1,'3.0.6'),(3,'DigitalObjectLinker',1,'2.0.0'),(4,'CsvImport',1,'2.0.3'),(5,'CollectionTree',0,'2.0.2'),(6,'Reports',1,'2.0.1'),(7,'ShortcodeCarousel',1,'1.0'),(8,'SocialBookmarking',1,'2.0.2'),(10,'CSSEditor',1,'1.0.1'),(11,'ShortcodeHomeslider',0,'1.0'),(12,'ShortcodeCarofull',0,'1.0');
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
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `omeka_records_tags`
--

LOCK TABLES `omeka_records_tags` WRITE;
/*!40000 ALTER TABLE `omeka_records_tags` DISABLE KEYS */;
INSERT INTO `omeka_records_tags` VALUES (1,2,'Item',1,'2015-09-08 17:10:52'),(2,3,'Item',2,'2015-09-08 17:13:28'),(3,4,'Item',2,'2015-09-08 18:40:31'),(13,19,'Item',5,'2015-09-26 15:00:22'),(15,23,'Item',6,'2015-10-01 14:57:17'),(19,27,'Item',6,'2015-10-01 14:59:49'),(23,15,'Item',7,'2015-10-01 22:34:21'),(24,27,'Item',5,'2015-10-01 22:36:43'),(28,23,'Item',5,'2015-10-01 22:36:43'),(30,21,'Item',8,'2015-10-02 14:23:47'),(31,20,'Item',8,'2015-10-02 14:24:10'),(32,19,'Item',8,'2015-10-02 14:26:24'),(33,9,'Item',8,'2015-10-02 14:28:39'),(36,3,'Item',8,'2015-10-02 14:34:31'),(37,7,'Item',8,'2015-10-02 14:35:17'),(38,4,'Exhibit',8,'2015-10-02 14:41:48'),(39,6,'Item',8,'2015-10-04 00:27:29'),(40,5,'Item',8,'2015-10-04 00:40:37');
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
) ENGINE=MyISAM AUTO_INCREMENT=54 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `omeka_search_texts`
--

LOCK TABLES `omeka_search_texts` WRITE;
/*!40000 ALTER TABLE `omeka_search_texts` DISABLE KEYS */;
INSERT INTO `omeka_search_texts` VALUES (1,'Collection',1,1,'Funerary Collection','Funerary Collection subj1 The Funerary Collection has objects ranging in date from the beginning of pre-history to early Christianity in the Byzantine era. creator1 '),(2,'Item',1,1,'Egyptian sand castle','Egyptian sand castle s1 d1 c1 s1 p1 d1 c1 r1 rl1 f1 l1 t1 id1 c1 f1 d1 '),(3,'SimplePagesPage',1,1,'ABOUT','ABOUT <p>Ancient Egypt has held a fascination for Australians since Colonial times and over the centuries a considerable number of ancient Egyptian artefacts have come to make Australia their home.</p>\r\n<p>Amongst the earliest objects to reach our shores are ones that were brought to Adelaide in 1849 by&nbsp; the country&rsquo;s first Egyptologist, Maximillian Weidenbach. The 19 year old Max was the youngest member of the Royal Prussian Expedition to Egypt, led by Richard Lepsius, which travelled through the country from 1842 to 1845; he was an expert in copying hieroglyphic inscriptions and during his travels he collected a number of artefacts that he also brought with him to South Australia. Newspaper records indicate that he spoke at public gatherings about his Egyptian adventures and showed the objects he had brought back, which were eventually to be donated to the South Australian Museum.</p>\r\n<p>The largest and most significant collection of Aegyptiaca was amassed by Sir Charles Nicholson, founder of the Nicholson Museum at the University of Sydney. He visited Egypt in 1856-57 where he collected objects that were to be donated to the University of Sydney in 1860. He again visited Egypt in 1862 and the objects he acquired on that occasion were donated to the University in 1864.</p>\r\n<p>In the late 19<sup>th</sup> Century, Australian museums began contributing financially to excavations conducted by British Egyptologists, notably William Matthew Flinders Petrie (who was related to the explorer of Australia Matthew Flinders), and in return they received a share of the objects excavated. Amongst these museums was the Australian Museum, Sydney, from whom the Museum of Ancient Cultures at Macquarie University has the majority of them on long-term loan.</p>\r\n<p>From the early 20<sup>th</sup> Century onwards, Museum holdings of Egyptian objects were also to be supplemented by purchases on the antiquities market.</p>\r\n<p>Australians&rsquo; engagement with Egypt was greatly intensified from the beginning of the 20<sup>th</sup> Century. During the First World War, thousands of servicemen and women spent time in Egypt, an important staging post on the way to theatres of war in the Middle East and also Europe. As ship travel to and from Britain through the Suez Canal increased, great numbers of Australian travellers took the opportunity to make an excursion to Cairo and the pyramids of Giza while their ship was negotiating the canal. The Second World War again brought thousands of service personnel to Egypt. Many souvenirs were brought back to Australia by these visitors, most of them tourist trinkets, but amongst them there were also valuable original ancient artefacts, many of which have found their way into museum collections.</p>\r\n<p>Thus over the last 170 years thousands of ancient Egyptian artefacts have come to Australia but most of them remain relatively unknown. Only a small proportion of them are on public display in museums, the bulk are in storage. Even fewer have been published and where they have it has been primarily in specialist publications to which the general public does not have ready access.</p>\r\n<p>Yet the interest of the general public, both in Australia and abroad, in the history and culture of Ancient Egypt is as great as or greater than it has ever been. It is for this reason that the project <em>Aegyptiaca in Australia</em> has been instigated. Its aim is to make available to a world-wide public the rich and important collections of artefacts and monuments from Ancient Egypt now in Australian Collections; as well as an on-line catalogue with photographs of objects, its goal is to create a virtual Egyptian Museum accessible to all on the internet with high quality 3D image of all the most important objects that the viewer will be able to examine from all angles. <a href=\"http://130.56.249.104/\" target=\"_blank\">aegyptiaca.mq.edu.au</a>&nbsp; represents a pilot project that draws on the Egyptian holding of the Museum of Ancient Cultures and demonstrates the exciting possibilities that a virtual museum can offer.</p>\r\n<p>In addition to providing access to the ancient Egyptian artefacts in Australian collections, the project <em>Aegyptiaca in Australia</em> also aims to contribute to a better understanding of the individual who brought them here; what lay behind their interest in Egypt and its history, what are the social and cultural influences that may have played a role, and how did the Australian general public react to the arrival and display of these witnesses to a culture distant both in time and space from the very different world in which they lived?</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;&nbsp;</p>\r\n<p>Website Credits:</p>\r\n<p>This site was developed by the following COMP356 students in semester 2, 2015 under the supervision of Dr Steve Cassidy:&nbsp;</p>\r\n<ul>\r\n<li>Dan Buskariol</li>\r\n<li>Greg Lawrence</li>\r\n<li>Kevin Nguyen</li>\r\n<li>Jordan Ung</li>\r\n</ul> '),(8,'SimplePagesPage',4,1,'CONTACT US','CONTACT US <h2><span style=\"font-size: 1.5em;\">Contact Form</span></h2>\r\n<p>TBA</p>\r\n<div id=\"map\">&nbsp;</div>\r\n<script type=\"text/javascript\">// <![CDATA[\r\nfunction initMap() {\r\n  var myLatLng = {lat: -33.77447, lng: 151.11027};\r\n\r\n  var map = new google.maps.Map(document.getElementById(\'map\'), {\r\n    zoom: 18,\r\n    center: myLatLng\r\n  });\r\n\r\n  var marker = new google.maps.Marker({\r\n    position: myLatLng,\r\n    map: map,\r\n	\r\n    title: \'Level 3\'\r\n  });\r\n}\r\n// ]]></script>\r\n<script type=\"text/javascript\" src=\"https://maps.googleapis.com/maps/api/js?key=AIzaSyBARGxoKIoc81VbLnqfPzOwzMVE3CFGmrk&amp;signed_in=true&amp;callback=initMap\" defer=\"defer\">// <![CDATA[\r\n\r\n// ]]></script> '),(26,'ExhibitPage',3,1,'Egyptian Exhibit','     Egyptian Exhibit '),(9,'SimplePagesPage',5,1,'Your visit','Your visit <h2>Opening Hours</h2>\r\n<p>9.30am - 4.30pm Monday - Friday (Other times by special arrangement)</p>\r\n<p>Please note that the Museum is usually open for major University events such as Information and Open Days, as well as major Ancient History events such as the annual Ancient History Teachers\' Conference and student Study Days.</p>\r\n<h2>Map</h2>\r\n<p><img src=\"http://www.mac.mq.edu.au/custom/files/media/mac-map_v2_thumbnail.jpg\" alt=\"MAC - Map Thumbnail\" /><a href=\"http://www.mac.mq.edu.au/custom/files/media/mac-map_v2.jpg\" target=\"_blank\"><br />View the full map</a></p>\r\n<h2>Transportation</h2>\r\n<p>Visit Macquarie University\'s&nbsp;<a href=\"http://mq.edu.au/transport/\">transportation</a>&nbsp;page for more information about getting to the Museum of Ancient Cultures including train and bus timetables, parking locations and other maps.&nbsp;</p>\r\n<div id=\"map\">&nbsp;</div>\r\n<script type=\"text/javascript\">// <![CDATA[\r\nfunction initMap() {\r\n  var myLatLng = {lat: -33.77447, lng: 151.11027};\r\n\r\n  var map = new google.maps.Map(document.getElementById(\'map\'), {\r\n    zoom: 18,\r\n    center: myLatLng\r\n  });\r\n\r\n  var marker = new google.maps.Marker({\r\n    position: myLatLng,\r\n    map: map,\r\n	\r\n    title: \'Level 3\'\r\n  });\r\n}\r\n// ]]></script>\r\n<p>&nbsp;</p> '),(25,'Exhibit',2,1,'Egyptian exhibit','Egyptian exhibit  '),(11,'SimplePagesPage',6,1,'AltHome','AltHome <h2>Macquarie University MUSEUM of ANCIENT CULTURES</h2>\r\n<p>&nbsp;</p>\r\n<div id=\"primary\">\r\n<h3>Welcome to Macquarie University Museum of Ancient Cultures!</h3>\r\n</div>\r\n<div id=\"secondary\"><!-- end featured collection -->\r\n<h2>Opening Hours</h2>\r\n<h4>9.30am - 4.30pm Monday - Friday</h4>\r\n<p>(Other times by special arrangement)</p>\r\n<h2>&nbsp;</h2>\r\n<h2><span style=\"font-size: 10px;\">[featured_collections num=2]</span></h2>\r\n</div>\r\n<p>[featured_exhibits num=2]</p>\r\n<p>[featured_carousel autoscroll=true tags=3D interval=2600]</p>\r\n<p>&nbsp;</p>\r\n<p><a href=\"https://www.facebook.com\"><img src=\"http://130.56.249.104/themes/berlin-mac1/theme.jpg\" alt=\"FacebookIcon\" width=\"90\" height=\"90\" /></a></p>\r\n<p><a href=\"https://www.google.com\"><img src=\"imgsrctest.jpg\" alt=\"Google\" width=\"70\" height=\"70\" /></a></p>\r\n<p><a href=\"https://www.mq.edu.au\"><img src=\"./themes/berlin-mac1/theme.jpg\" alt=\"FacebookIcon\" width=\"120\" height=\"120\" /></a></p>\r\n<div id=\"map\">&nbsp;</div>\r\n<script type=\"text/javascript\">// <![CDATA[\r\nfunction initMap() {\r\n  var myLatLng = {lat: -33.77447, lng: 151.11027};\r\n\r\n  var map = new google.maps.Map(document.getElementById(\'map\'), {\r\n    zoom: 18,\r\n    center: myLatLng\r\n  });\r\n\r\n  var marker = new google.maps.Marker({\r\n    position: myLatLng,\r\n    map: map,\r\n	\r\n    title: \'Level 3\'\r\n  });\r\n}\r\n// ]]></script>\r\n<script type=\"text/javascript\" src=\"https://maps.googleapis.com/maps/api/js?key=AIzaSyBARGxoKIoc81VbLnqfPzOwzMVE3CFGmrk&amp;signed_in=true&amp;callback=initMap\" defer=\"defer\">// <![CDATA[\r\n\r\n// ]]></script> '),(12,'SimplePagesPage',7,1,'NEWS+EVENTS','NEWS+EVENTS <h2>&nbsp;NEWS</h2>\r\n<p>No news today...</p>\r\n<p>&nbsp;</p>\r\n<h2><span>EVENTS</span></h2>\r\n<p>No events today...</p> '),(14,'SimplePagesPage',9,1,'Events','Events <h2><span style=\"font-size: 1.5em;\">Events</span></h2>\r\n<p>No events today...</p> '),(13,'SimplePagesPage',8,1,'News','News <h3>Local News:</h3>\r\n<p>[items collection=3]</p>\r\n<p>&nbsp;</p>\r\n<h3>World News:&nbsp;</h3>\r\n<p>[items collection=4]</p>\r\n<p>&nbsp;</p>\r\n<h3>Developer News (last updated 8 Sep 2015)</h3>\r\n<p>Following plugins may prove useful:</p>\r\n<p>- Simple Pages</p>\r\n<p>- Exhibit Builder</p>\r\n<p>- CSV Import</p>\r\n<p>Local:&nbsp;[items num=3 collection=3 sort=\"Dublin Core,Title\" order=d]</p>\r\n<p>World:&nbsp;[items num=3 collection=4 sort=\"Dublin Core,Title\" order=d]</p> '),(15,'SimplePagesPage',10,1,'COLLECTIONS','COLLECTIONS  '),(16,'Collection',2,1,'Ancient Egypt Collection','Ancient Egypt Collection Ancient Egypt artefacts '),(17,'Item',2,1,'Egyptian thing','egypt Egyptian thing Egyptian thing jpg '),(18,'Item',3,1,'Shiny vase','3D greece Shiny vase vases <a href=\"http://elsi.ltc.mq.edu.au/~skcdev/3d/exhibit.php?model=MU4439_Gnathia_Ware_done.obj\" data-featherlight=\"iframe\" data-featherlight-iframe-width=\"1050\" data-featherlight-iframe-height=\"800\">3D Gnathia Ware iFrame</a> This is a shiny vase - illustrating the advanced pottery techniques already in use at the time. '),(19,'Item',4,1,'an Egyptian coin','greece an Egyptian coin '),(20,'Item',5,1,'gold heart','3D gold heart <a href=\"http://elsi.ltc.mq.edu.au/~skcdev/3d/exhibit.php?model=heart_low2.obj\">3D Heart iFrame</a> A model of a heart for medical education purposes. '),(21,'Item',6,1,'an old brown pot ','3D an old brown pot  source unknown <a href=\"http://elsi.ltc.mq.edu.au/~skcdev/3d/exhibit.php?model=MU1452_Final.obj\">3D Brown Pot iFrame</a> This is one of the oldest pots in our collection. '),(22,'Item',7,1,'an old egyptian bottle','3D an old egyptian bottle <a href=\"http://elsi.ltc.mq.edu.au/~skcdev/3d/exhibit.php?model=MU868-egyptian_bottle.obj\">3D Egyptian Bottle iFrame</a> This is a rather large bottle - note the wide bottom and very narrow rim to avoid splillages. '),(23,'Item',8,1,'gold funerary mask','gold funerary mask '),(24,'Item',9,1,'old gold amulet','3D old gold amulet <a href=\"http://elsi.ltc.mq.edu.au/~skcdev/3d/exhibit.php?model=MU520,DECIMATED.obj\">3D Amulet iFrame</a> An old Egyptian amulet. A replica of this item also exists (printed on our 3D printer). '),(36,'Item',15,0,'amnh1','amnh amnh1 '),(40,'Item',19,1,'little gold mummy','3D carousel little gold mummy <a>3D mummy</a> Not only did they mummify you, but they also shrunk you down to a more manageable size. '),(41,'Item',20,1,'Egyptian skull','3D Egyptian skull <a href=\"http://elsi.ltc.mq.edu.au/~skcdev/3d/exhibit.php?model=skull.obj\">3D Skull iFrame</a> creator unknown This is thought to be the skull of Ancient Egyptian God ANUBIS - preserved in gold. '),(42,'Item',21,1,'Ancient Egyptian beer mug','3D Ancient Egyptian beer mug <a href=\"http://elsi.ltc.mq.edu.au/~skcdev/3d/exhibit.php?model=MU4078_FINAL.obj\">Beer Mug 3D iFrame</a> https://toolbox.ltc.mq.edu.au/3dbeta/exhibit.php?model=MU3878,DECIMATE.obj  Beer mugs back in Egyptian times had to be quite large, since building pyramids was thirsty work. '),(49,'Exhibit',4,1,'3D Exhibit','3D Exhibit <p>Exhibit of 3D items. Click on an item when inside the exhibit, then click on the URL above its picture.</p> 3D '),(44,'Item',23,1,'Snapshot of Seasons-mac1 (winter) with slider in body','carousel screenshots Snapshot of Seasons-mac1 (winter) with slider in body '),(48,'Item',27,1,'Snapshot of Berlin Mac1 theme','carousel screenshots Snapshot of Berlin Mac1 theme '),(50,'ExhibitPage',5,1,'3D exhibits','        <p>This is the caption for the old brown pot...</p> 3D exhibits '),(51,'Exhibit',5,1,'Multi Exhibit','Multi Exhibit <p>This exhibit contains a multitude of items across many cultures and periods - mostly to allow testing of \'exhibits\' as a contrast to \'collections\' for displaying many \'items\'.</p> '),(52,'ExhibitPage',6,1,'Multi p1','                   Multi p1 ');
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
INSERT INTO `omeka_sessions` VALUES ('05eg7ibdv7lro5kh047850v044',1453516036,1209600,''),('0b5n28r8k7c1icaka86f7mei03',1453433202,1209600,''),('0hlb7m4d3btpmq7ll1qfp1h664',1454851087,1209600,'Default|a:1:{s:8:\"redirect\";s:1:\"/\";}Zend_Auth|a:1:{s:7:\"storage\";i:1;}'),('0olgi0a63ls25u8cb50cjbhk12',1453593086,1209600,''),('0q338rnvkqi7afao1sepd7o095',1454453527,1209600,''),('0sru9nna0s0a623r0sbijv0to0',1454429572,1209600,''),('11ic58squnbe6fe92d9bbsght4',1454895360,1209600,''),('12c3v0uo4qukaf8jil0v0uirj3',1453362361,1209600,'Default|a:1:{s:8:\"redirect\";s:1:\"/\";}'),('16o0pbauvohgilegf36lh3v611',1454893385,1209600,''),('18ulr5581oi5af680571jueh11',1454452225,1209600,''),('1a302r4ulkqe1qodc33qae0pf3',1454810618,1209600,''),('1i3oci0scu284qnb0ppmfto9r7',1454783176,1209600,''),('1iucud799eut1gtp66jjsa64g0',1454510847,1209600,''),('1k6vtlrptn6uonn49df2570gf3',1454341516,1209600,''),('1kuq05264a6mq2nvah9laurhk4',1454135623,1209600,''),('1oq0h2cp58u66encmfp81p2v01',1454167997,1209600,''),('1v19vgfh0iiehfo54qepgf9oe7',1453927040,1209600,''),('2048qgmadljnudc88qdocn32n0',1454810624,1209600,''),('2445apms1rcgc8eenfj74fu194',1453742879,1209600,''),('25k8en355rjfijqosua06tmg71',1454810620,1209600,''),('29mpdq7sm11e87cbvqu7fbloq4',1454547043,1209600,''),('2a6nq4tjcei3m7n6qi4acpdep3',1453812900,1209600,''),('2bis8k3913m8fdu7rqbejdc2l1',1454168006,1209600,''),('2cli2ucl149qdo0qk5qmhfoms4',1453455678,1209600,''),('2da017tgau7svljcsnfic5u7g1',1453905564,1209600,''),('2dbbtcqs9ohuttmerddb5guo44',1454335401,1209600,''),('2g6pnv188vpmjj7ep7qblumna1',1454188633,1209600,''),('2ipe83hnmcftt9ijp6p37rf9k1',1454793245,1209600,''),('2islagh2v8ndfujsje72v3on32',1454429882,1209600,''),('2qj8e82pd4vl2fuulaa1br00p2',1453433077,1209600,''),('2qjhg65n9gg05ut2036l2vesf7',1454135631,1209600,''),('2qm7ooer10o2d7784rmhn0qpd5',1453884551,1209600,''),('2rj40ht0v3m7hctv9juspkklv0',1453687596,1209600,''),('2rlgkhofq7iqj5ld3mqdpb8np1',1454474873,1209600,''),('2u4keepadjsjqhbk4574fnmd37',1453815567,1209600,''),('33s0rsddahh1n8838stveqoa46',1454429573,1209600,''),('36mcavbdocf326uttnlt20eem0',1453517525,1209600,''),('3alpquq9faj9e8masu3l4rb6f1',1454279363,1209600,''),('3c7gt3ik1lkdta1r7e5s8d0v00',1454810623,1209600,''),('3gkg8292mq41nv7knp24ht3nk5',1453845691,1209600,''),('3gsc9i4l45p2q8k0aqnc2vkgs2',1454161176,1209600,''),('3n9fjh57t5gni6qicvggn1tne5',1454810622,1209600,''),('3p6pfhgacoke71dk53adc4co53',1453627416,1209600,''),('3q7uov9d08tq21dfqho8j8jfb3',1453687595,1209600,''),('3rtrek8o0i4hn9spj3ih3toi12',1454168000,1209600,''),('3vgf9q30hrk8u5fue2ga8uk531',1453517523,1209600,''),('4ab40o63qrk75ka3h3sjkup592',1454429575,1209600,''),('4dj3h5hqmjj7a8bo9asrar8074',1454792919,1209600,''),('4fk0f09665aivmkjsupo9k1kv5',1453455677,1209600,''),('4i7esm696th60kta8q3mom5900',1454905221,1209600,''),('4jv6si7ljivahgiec3j54vlq61',1453421510,1209600,''),('4kgtaa4fj7dic3mr392aehfar2',1453306324,1209600,'Default|a:1:{s:8:\"redirect\";s:6:\"/login\";}'),('4sc47cpr74b2043ogfujt4nfd3',1454452224,1209600,''),('4t99l964d6onuji3edg7jnhut7',1454341533,1209600,''),('4teu0q5rs1t4ormh8846q4ap33',1454188643,1209600,''),('4vekc883hurcng5sv6l0evu3c7',1453433203,1209600,''),('4vkq5auu7fjag5bkqb2psnukc0',1453495042,1209600,''),('57jo4bb7c22o2q435bjc5j08c0',1454188636,1209600,''),('5bo3f3sokiauj7dhosojt1mqt1',1454501771,1209600,''),('5ct3gt3gnssvglcmm02ngt3pa0',1454452220,1209600,''),('5cv9r9hed6unfd0c9ftt2gje75',1454432567,1209600,''),('5k1tg96o4s7h85s9ilce5uv3c7',1454794510,1209600,''),('5maak63os5okfktcovsf4i8181',1454274830,1209600,''),('5ml2quq79jfsue4anph1sc8390',1454188632,1209600,''),('5p6j713ug5q6ugadg849i5g391',1454611165,1209600,''),('5qijqb2spgjg1hbnnjummbcga2',1453848220,1209600,''),('5r784ag22ta1aj37cgko3gbcr3',1454429571,1209600,''),('5t3d3ahha3gm6hm5tlq8ohjcr7',1453842864,1209600,''),('5u1u2fbe9mk1utl1eeauoqbre2',1454168004,1209600,''),('63grr7cvm06utnml7qt82mvsk6',1454453331,1209600,''),('63ihit1qp17sa0ualq8fh0jjc2',1454141113,1209600,''),('640k4stp7h2cmg2mg5vm2rga03',1453397427,1209600,''),('647jgh6kv0hgeihkqdp488g490',1454668172,1209600,''),('65dt7scfpt5j9cmr8e5teqlfl3',1454905216,1209600,''),('65eelffkba2kj8ph5lhavqjlc6',1453728963,1209600,''),('662ode11hcbq2hop8rd3aeif90',1454452774,1209600,''),('67cf34ha227dq54ukkd5kvloj0',1454262384,1209600,''),('68j6gghi15b769vvpdhbkc3aq6',1454186050,1209600,''),('6cnl7ls7fpt8qe35uatal8ed26',1453740889,1209600,''),('6e50mabjn4e6gu6usbllj1d0u7',1454905221,1209600,''),('6ecmrkku3m06eshaio9e5v3bg7',1454443308,1209600,''),('6fd429jh6j2pv4qkhbh6oi9qg1',1453669342,1209600,''),('6m8fh79fd4qqtb6ri5bmvsoh96',1454341534,1209600,''),('6n4f84shf2vhimab0ss51truq4',1454188637,1209600,''),('6oiuu96fkp1hdhan3d410hg7v4',1454637281,1209600,''),('6r49noonclu07k871dhcdd9jk6',1454324180,1209600,''),('6s0jhu94hhc8ll7qhs8so30s31',1454790710,1209600,''),('6sul4frrtjfajkntg48g64uma5',1454341531,1209600,''),('6vheplgflcuknv4i4nm03tu5r5',1453687592,1209600,''),('746otgg29qcjajsv56289kn620',1454443311,1209600,''),('75v6lo4188oanevgudnvifhvt4',1453847626,1209600,''),('765q3lrgpkid7cbrohudk7k1n4',1454472783,1209600,''),('77cbpgcagotau0tu4atqvktlh2',1454139959,1209600,''),('7at2k4ujmrogd2bm51cikjdnm2',1454895370,1209600,''),('7e3bm02lvsdqn8sfd0oq0p7gk1',1454159931,1209600,''),('7elfif8r88qc9a69mc6j107236',1453337899,1209600,''),('7gjn0tmdrt90hsbn3cchjquh44',1453892116,1209600,''),('7n0gc3f3k8j63bhdd7ebm6asd4',1454102330,1209600,''),('7np4ttu6e1s5cqs8a2qmo22ju5',1453687595,1209600,''),('7qickhv929u4ropv7qa5e7gca0',1454135621,1209600,''),('7r7ph378b0jnl4gd8pe4vnne02',1453643314,1209600,''),('81lauuagjjblut3f86tejjrum4',1454341524,1209600,''),('85qulesauc0b0uu4q1qujgc6j3',1454514443,1209600,''),('89ik97ca3m3rf9j0dptrgr03e4',1453401509,1209600,''),('8ca5ab88b62ogdmc56pr31p937',1454455964,1209600,''),('8dfael7gaap3ufdfd5069uqft2',1453645855,1209600,''),('8flujrfm1l2ngc4ef2g64u0l75',1454535842,1209600,''),('8g8op62kkgqdlvo16vv401b5i0',1453687594,1209600,''),('8m8qqm8q45fjpgaut0kel40o43',1453599558,1209600,''),('8q096q6fa5eov28cdijbca88g5',1453518691,1209600,''),('8qh2shqa8roich84ncu1j84hl2',1454274859,1209600,''),('8thjqv6q5a2p9njea1tig3bpc7',1454432568,1209600,''),('93fu1bfspn54b9j4bct875ue84',1454895370,1209600,''),('946vv4d7sdmau7a8njg8qal7b4',1454341499,1209600,''),('95uh2agla2nr77gnt4u9jkua66',1454350130,1209600,''),('9a5tnmdkk2qojd40vf26lmi1n6',1454341532,1209600,''),('9adlrqmelciv2umpmvo9sn7bq7',1453824479,1209600,''),('9b8hi5n0sag0tp6k7n8qbhjfb1',1453687593,1209600,''),('9c0q6d63qf32asde5eavf4val0',1454188633,1209600,'Default|a:1:{s:8:\"redirect\";s:1:\"/\";}'),('9c2ogm68dm7gkvgrr2jef4ug14',1453550548,1209600,''),('9cc8p8m0fjj6pt43dqpu64u936',1453498057,1209600,''),('9ccoa9c3bptll8vck7n7d3sbq0',1454586192,1209600,''),('9f2f0016sgmuo9l67c03m04fv6',1454879462,1209600,''),('9fst3ennajb1a6bl5vugpcevs1',1454168003,1209600,''),('9ir780ck3f6gi4qa8h1kn29950',1453815651,1209600,''),('9l0v3fo1s0mo551feqnh7mrif0',1454341338,1209600,''),('9lgf3e88qh6sg853hf4htg9726',1453484529,1209600,''),('9nillehmqmeo6esbuoqehuc5i0',1454188639,1209600,''),('9od1p79sk2jrhagvp3dnrabg73',1453627405,1209600,''),('9ol5r7lm3jo9mqiig0ks5ubfo0',1454443311,1209600,''),('9tmukjra0ftj8ugtheo482uuu0',1453648521,1209600,''),('a2aa7j6la9ird91l13c0fc9322',1453828435,1209600,''),('a5r8i2nc5onvgvhrs2l2g98rn1',1453599559,1209600,''),('acfof451geluh9srqk0atosph3',1454341532,1209600,''),('acse1fkmtimasq12kmm1d6edf4',1454304448,1209600,''),('afnp677bitesbmgt02f666r795',1454679081,1209600,''),('ajq525198ups6ia53d6c5ajgq4',1454501772,1209600,''),('ampha0gdum250951kc78tlr810',1453824478,1209600,''),('ao3us12mcvg8manft1bo9m7i35',1453627415,1209600,''),('ao7sgdoe11t6fjpprrn1kekhq3',1453824478,1209600,''),('ar5cfedsaeu9igd31aasrpkji2',1454783178,1209600,''),('arvhp8u667gfe27sf9snkj6qb2',1453517819,1209600,''),('as78lede9e31heiu2kvrcv5dh5',1454470179,1209600,''),('av2ldtduceq8rr2q4i28rqkqf2',1454038919,1209600,''),('avsaclhcjesumasoe2agav4gh0',1454215419,1209600,''),('baggi9tsl917e052t93qms5co5',1453954481,1209600,''),('bbvqdpl3k9up0beqgarkt980r2',1454135625,1209600,''),('bmermo8c2kesl9al8r19k8e9m2',1454432561,1209600,''),('bmkg2iksjdv3kngebs30bg31l6',1453936520,1209600,''),('bn3t2p4v85jgfnnsusdbhuf1e0',1454341498,1209600,''),('bn4fndvptu5gu8mr8mpbdgg7i3',1453812900,1209600,''),('bodfg578c5cr41altoausi2pf0',1454419792,1209600,''),('bof0er85och5bmtoh981u16vv0',1454141112,1209600,''),('bp55mg7m3b0lv562je9ir9urp2',1454341617,1209600,''),('bs7ei6b115e3apfat2uofui8c6',1454429574,1209600,''),('buahtkn4t3pl8ofkfaa65upt42',1454783179,1209600,''),('bum7fjmlcfod0irs77m9jju8g3',1454494670,1209600,''),('c3khf51i164biamh95ph7i8s75',1454168005,1209600,''),('c65ii3vau1j2ftuv5ev9gtion2',1453386400,1209600,''),('c6h99j0530km1o1tvg6nahe276',1454769249,1209600,''),('ca45gkmnh1uadmfntej345tqp6',1453508781,1209600,''),('cfd9s7mvnes98o8u3l43bg3ro1',1454401999,1209600,''),('cfeb23qr59qvftqsvagv0un954',1454308708,1209600,''),('cg97pgpgsb70p2l4m234g85ob4',1453598331,1209600,''),('cglo0drhmd90q72mksa0hmqng7',1453317060,1209600,''),('chk8d0j67l4dbcjboh48ae5mg2',1454313392,1209600,''),('culkmtued9mv1pp23qqjhe80k5',1454188642,1209600,''),('d8bjb60i7nsl2tv868jh06lpg7',1454188638,1209600,''),('db8nu20evl3igng5uvps4g7s80',1453785639,1209600,''),('dbbose4r4ubq7f28oo1t18lm72',1453441920,1209600,''),('dfdl1vr5eleuv1urt9qduoeh84',1454257698,1209600,''),('dgi0j7itgldjm5m1lc3tjsf6j2',1453712225,1209600,''),('djlgc341p9ge537qk0gvnjnfu6',1454546099,1209600,''),('dkcl832477fh0r2h6thu7lh2t0',1453687593,1209600,''),('dm8v31gvtnagqgs19c7hgtgjc4',1453906194,1209600,''),('dnajkt6fvj638er4v4n4h5lj51',1454501776,1209600,''),('dohob1f7t4cgu3u3k6hg6ge6k2',1454553698,1209600,''),('duop2eg78nme7cqqskbms1bhr2',1454747272,1209600,''),('e2i67uru62lpfgheemeof4hls2',1453824478,1209600,''),('e4eb290bv3sjk2kmq7f2nhveu5',1453739616,1209600,''),('e8ck4n2t73pj7f7ta55aaou8v3',1454135626,1209600,''),('ejvdth53eo9gq64q0bqkj9vhj0',1453275037,1209600,''),('ektsccdhge9storpu25on6d6t7',1453699192,1209600,''),('elbb52rna0da2fv9pi2foo8ff2',1453714283,1209600,''),('elqaiu4li5v04fbdd66jnlv9b6',1453885844,1209600,''),('en5of7j3h8d6r1e3o4rolm1i42',1454452226,1209600,''),('epktggrs5i1hdcvqvsj4ppa466',1454895361,1209600,''),('ev6rq74na2vsgeev7n271up4p1',1454810617,1209600,''),('f1jk9o8qvt9dgqp1drrcffbq84',1453911353,1209600,''),('f4d7gkglnhe1stvc9fvqhr5k47',1454167998,1209600,''),('f5q5iaheq3jk6gnsjjheg51m94',1454893366,1209600,''),('f7381jbao69j66kq51hbaf4j81',1453812901,1209600,''),('fft7gfbhkj60llv4rm1mktavl5',1454905219,1209600,''),('fk267utdst6vl5s7uf7qlckn75',1454679082,1209600,''),('fliok1d03qb7ajjmj8cv3lhto2',1453687592,1209600,''),('fo25gs4vksaui854jddirt9p60',1453903950,1209600,''),('focd4m7vmqurolh8bo89nr9sp6',1454135627,1209600,''),('fril2vrr7ognc4s1sf5n5aemt0',1454452227,1209600,''),('frskdfbrh6d857nq250264kcc6',1454893382,1209600,''),('fscotgdd9rc4gdidjiplbqui70',1454135629,1209600,''),('fsdmlmkeqru0gmve042e8d9ik0',1454188643,1209600,''),('furbvof8648vkmji1jpkfa6ir2',1454135622,1209600,''),('fuv41mvn38tv5vk26ofn12clu0',1454168007,1209600,''),('g0qt0v88q0s4c85c1agearqpq1',1454483959,1209600,''),('g2jed8l73m2cqtet545undhch1',1454341541,1209600,''),('g52khb7820cdu5unvhcjjd0ih0',1454188637,1209600,''),('g74e7snci4nkn3hr1o3mc1qpb5',1454188636,1209600,''),('gel75gdlfo8jjq1qtsc8m4lld2',1453841971,1209600,''),('gh44jigvgh6c3r9l48r2r30m11',1453398691,1209600,''),('ghhdokams8ngtilctb4cjfapb3',1454429570,1209600,''),('go51v135bptb1ir21tcqildma0',1454188635,1209600,''),('go7qhrv8lqiee4p2rslhbim2a0',1454501779,1209600,''),('gq7s4dnrapfersglgg3hq86l15',1454167999,1209600,''),('gtseemcuoi05dt7iaojqj126s2',1453927041,1209600,''),('h2gfe37pet20qukc2j2kl6f9r2',1454188631,1209600,''),('h789pv649bus7c6nhpvqi5i153',1454168001,1209600,''),('hdiie5n7hc9tok1kuomlnsstf5',1454473497,1209600,''),('hee7jcnlqe12dh6vmlj28itn55',1453371108,1209600,''),('hetbpsiqio07et74ubp3a1jss2',1454810616,1209600,''),('hhfkutrrh5k7a24nj1d79sbum4',1453884552,1209600,''),('hklrm562bvftjhmdvt9oe48ns3',1454168008,1209600,''),('hnl685fsl7vjcau5itd1a81k87',1453815080,1209600,''),('i868c283d4jpdnkkqu6mgj8qd5',1453421505,1209600,''),('idb7ub19ojhi7jq64t02ieb4v2',1454168002,1209600,''),('ih5rpqpch4c14ap5af2b26ce81',1453725266,1209600,''),('ird6jkd126nutqi709l2epf772',1453652782,1209600,''),('isrcr8vjo4rhtn2m7som81j132',1454501775,1209600,''),('iu1ng2mam68iu96sqkdek479p7',1453928226,1209600,''),('j5513h0gfihru8kgp758pkha00',1454432566,1209600,''),('j5jc00ifv0vvva28et449hs4b0',1454341531,1209600,''),('jea5ru1oipbhtt817flbk21b63',1453568614,1209600,''),('jk4bdsf54otir00etk4pt995h4',1453545150,1209600,''),('jl2a7js7egtdor07gchac5fi34',1454274837,1209600,''),('jl9et6qhtfu0n85595n825m8m1',1454141114,1209600,''),('jrstn2oq3rtodca7j4tg4vq915',1454188639,1209600,''),('js0s910685ft2ulfchubp9chn5',1453812901,1209600,''),('jt5j0ck04ujhok89b8sj5pl3v6',1454141119,1209600,''),('ju3umfufboedd66nrcnr5e3t26',1453517524,1209600,''),('jv86b8h3sg6rj5qvpq8q6j4ld2',1454141120,1209600,''),('k0kbq638h802ijdmo65r9tuj70',1454089048,1209600,''),('k198muo8e6m0eevfefk9nem3v5',1454861696,1209600,''),('k7ascjg9p9lqvhvkfdmfo7cho7',1454636046,1209600,''),('kd1v8fl2pl4ghrs472lg7c5sv1',1453377802,1209600,''),('kijb25d5dm0oeubtp9oo73flr7',1454341542,1209600,''),('kq9s46bk17uge5baj8ef6rp210',1454135624,1209600,''),('kqo5lllnil35e1h8j8h2lmo1h6',1454557926,1209600,''),('kr8got5nf31ifrd54lnbrlrk31',1453687594,1209600,''),('ks7u2fub5ungi3vmsd3oihivv4',1453339691,1209600,''),('kvfgkpg925ml0mhdcaptr1s7k3',1453345441,1209600,'Default|a:1:{s:8:\"redirect\";s:16:\"/i18n/readme.txt\";}'),('l2nbc5pjt1dh8oc5imoeqostd5',1453261372,1209600,''),('l44va496cj89vpg39ddft8nb26',1454429576,1209600,''),('l7dbscc2c2ondv5hrtkdlsbjh2',1454185131,1209600,''),('l9bg6t7icl40uv3156ag4lbrq2',1454455056,1209600,''),('lct0m4i45tn79453ovqou0mkn0',1453623400,1209600,'Default|a:1:{s:8:\"redirect\";s:1:\"/\";}'),('lhqat9egf7oibmnecc34a7uom2',1454443309,1209600,''),('lhu406f45q28llf6jsbqsfuam6',1454188635,1209600,''),('lksaam4kdb57646jrk9j6p5ia4',1454783177,1209600,''),('lnn3m7nq8pn2ggocgsdri7auc5',1453627406,1209600,''),('lp6k1cjd86semg9daurffh8t50',1454135630,1209600,''),('m2nv77sk1gg2ojpj588imuo6v0',1454188634,1209600,''),('m4dt101hnhm9cs43e51rcpu1g4',1453525789,1209600,''),('m8h8v3a1902vbr1p2pbp9q6bv4',1453504534,1209600,''),('ma35v4103i1io5t1hlh1dfut91',1454557524,1209600,''),('md3c6k8jn8iirnslg3juhnm1u1',1454141112,1209600,''),('mg4qkraradl18v74302t3gkel5',1454432559,1209600,''),('mi44r1buvlupf9rqdvsbabqhb0',1454124444,1209600,''),('mkvsdtlcdt5htp1cus04vjlag1',1454185132,1209600,''),('mqki3unlo65mlrdj9727hqek92',1454601365,1209600,''),('mudujljr25d92q0n62hs9bj151',1454038918,1209600,''),('n6ktdmn0t018sun5oa6u31ch87',1453824477,1209600,''),('n6s7v9gchmoia65hob6ar9me81',1454501773,1209600,''),('n9u467ljrsu4mbn620fudfkb15',1453839337,1209600,''),('nco9l1tp14difc2gicj4e8e0l6',1454141118,1209600,''),('nd0ec87uhev3upfpdii57urnr6',1454188641,1209600,''),('ndlas700k54uufeppgrfhfj3h0',1454341538,1209600,''),('nf5n4nfvpgs691dop293b5bpa5',1453310610,1209600,''),('nl77m2ob9509hp0at4f9c5m6m1',1453968989,1209600,''),('nmt4kddpo8j73j715q8jsmlg01',1453572008,1209600,'Default|a:1:{s:8:\"redirect\";s:21:\"/orders.php/login.php\";}'),('nodaeamu7himf9bikl3dn5bcl3',1454893370,1209600,''),('noe0cbrckups4q1mg4oor22np3',1454452225,1209600,''),('nopmltuskbi767pfi7bf1vrvg0',1454341532,1209600,''),('np89q5l62dnmqvl6eshenmmm71',1453322151,1209600,''),('nrkbefl4idojjnnh209651tsf0',1454341535,1209600,''),('o46mmj7orc1duud7rfl6nte0h5',1454432565,1209600,''),('o51dl518b7f8bir1l9i8f76hi5',1454905217,1209600,''),('o67q4pcm6ejn4tfku2fo5nhqd7',1454432560,1209600,''),('og98478omf1sgk8jufv2m5puo5',1454270955,1209600,''),('ogonpuctid0onm0b4gr6tmqlm5',1454141115,1209600,''),('oj8m2fsvjqhlt9969hcflp2kc4',1454135628,1209600,''),('ojboheegasgv96uei93bs8e024',1454341535,1209600,''),('ok26dmt0n60fb3kn176u1bqfq2',1454139959,1209600,''),('oslf8pjuhmm9rmgarjcsuv5l17',1453687593,1209600,''),('p4coo67rd4lrrpafr94tu5f3c4',1454141117,1209600,''),('p506eedpltt5nofp9g2gkut392',1454494717,1209600,''),('pdmbelrnp1s03m094ff4n058u0',1454802096,1209600,''),('pf34ahlhnlbo622o0kej6e7rr1',1453740890,1209600,''),('pkasucujh09il68nf8fs66sbr6',1454515187,1209600,''),('pp9ruothruu1c7n7jlpganhk24',1454139960,1209600,''),('ps4s1h54r9opuekqnae0rpk2t6',1453669336,1209600,''),('pto4ujnjhmthnoh7p0cea6nae2',1454910880,1209600,''),('q28ce6uvikpdls9u3ncqdqogu3',1454614099,1209600,''),('qcrvd5m78kidmupe8p4t7scbv6',1454675176,1209600,''),('qframbkd0oiri11sb4l6aa1vg6',1454341537,1209600,''),('qg7lm6916e79h569ceatun8103',1454341510,1209600,''),('qjlmemtblfl5hfl36c1kana285',1454905214,1209600,''),('qk8223itefi0k8c99dlgrn2hh7',1454341536,1209600,''),('ql8iirvsuaojsdglktqnpbhv22',1454328498,1209600,''),('ql9ennhhtp9cejjuptt3e85ju5',1454304590,1209600,''),('qqh794gar19fagqaldid6obdd0',1454149645,1209600,''),('r1ikn118ouobrfa850if11cgc7',1454308708,1209600,''),('r4en9hp7n2vfbh89o75g91u4i6',1454424673,1209600,''),('r9ufq1r49nmhfgjv1gmpphojm6',1454341541,1209600,''),('rg9718fjlatvgliml2p3dqgq15',1454661744,1209600,''),('rh6i45i1vercmd9lm7ie52gdk4',1454233145,1209600,''),('rhem4t27dgt5tpncj7u7sp73s6',1454016721,1209600,''),('rhksks5kmq5mkk9lvr6gqq1iq3',1454188640,1209600,''),('rnh94j51nkll264kl4kcueoqf1',1453806004,1209600,''),('rq3hqd9bjdptpuu7b35cpd63q7',1454188642,1209600,''),('rqaq2do5o9jpkmgia8a8evmj94',1453725266,1209600,''),('rrdmbhbfcoppc5mu0173bv8jm0',1454810621,1209600,''),('rroha051diikvumsukcf2kfhc0',1454443310,1209600,''),('rulu86gag8eqka90ti39q58hv1',1454905218,1209600,''),('s0o9rbe4rs39q1cribjg9othi6',1454341533,1209600,''),('s1cavaglibne856j56bei6dqo6',1453824477,1209600,''),('s2eol7sctiho6r22ucn2agogi0',1454455519,1209600,''),('s47jdrasrieq3nme0o373p89q2',1454895368,1209600,''),('s5livsdln87fdv20g1o8t4vua6',1453516035,1209600,''),('s7chqk81loh279g6lbc99fnh66',1454905220,1209600,''),('s99043b6rtf4sftuh7q52ue7i1',1454425948,1209600,''),('sbslsd6e6veli3585d714bs4g6',1454341540,1209600,''),('sc61tfk59jcvi2jlhkmj91j493',1454168004,1209600,''),('sc6sk6l47tel6369ldld5he080',1453884220,1209600,''),('scvuu5vbq06icnjf69kho8q0f3',1454544338,1209600,''),('sh79tmntnen1m5mofduj0u02i1',1453392986,1209600,''),('sid68mqa67giku0lqvarudp0t7',1454783180,1209600,''),('sjt34phf4aimloj6rqqp5ed943',1453725228,1209600,''),('sl2ikiohsph0u6n8ramt22rcp2',1454341504,1209600,''),('snnpljjjo53giuj8e27oc62143',1454274829,1209600,''),('su5qgqi0ta55a0anh240q4cvj1',1454895369,1209600,''),('t6qqibg6hg59epmta4ggti2c67',1453812899,1209600,''),('t7ap7lc9en662pqh567khrjb20',1453310611,1209600,''),('t7linpdigdgdndsrd3v87vhte6',1454141122,1209600,''),('t8noqsd8v8em7auesqa8gv6rm2',1454783182,1209600,''),('t8ssu61ico2j7pi14rjj14je67',1454341498,1209600,''),('t9i6flus0ubkbnvv9t3r10a5f0',1454188631,1209600,''),('taj3gu9tpcungh30itvt8ndjk4',1453901373,1209600,''),('tb5j8l0u6t1ut102e4m21reer3',1454367307,1209600,''),('tepf9v3ffpka8t2jadiov5ptq2',1453516034,1209600,''),('tg6gi4qmue9j3enrshcf7go524',1454472784,1209600,''),('tnv750f025375vi3opk0ve8q60',1453798883,1209600,''),('toq7esnq706d7br6480mpa25u4',1454141108,1209600,''),('tpjs1kh12qdo6fn707so9hdv25',1454168009,1209600,''),('tqubh45cdvhhnfv79uuf7t4563',1454135627,1209600,''),('tth5k2itr5m18c300s57d7fih2',1454443307,1209600,''),('tujtnq90s3si8k9l40a5jlivn4',1454501774,1209600,''),('u38714o1adsn04d92kvppldub7',1454341535,1209600,''),('u4a1glvn088qr6c4rnb12rh2d5',1453927042,1209600,''),('u8bjv4ooqe6k1ehaidhtuih414',1453627412,1209600,''),('u97deokhnf0b9e0f0l71l8rp90',1454328497,1209600,''),('u9fspp4po0jd0e3ebovlpmaqq3',1454475969,1209600,''),('ucbctmdcmccaf5cvuvmcoeaca2',1454141121,1209600,''),('ucfqr16319e6hib7burg447kf2',1454135631,1209600,''),('ufc0hgmbq88u6avjo1d2bk4qh4',1453924866,1209600,''),('uiongp9b6oso8ruatmki2p3hq0',1454274847,1209600,''),('ujid205l7gtaf1stgom23tvfa6',1454792919,1209600,''),('ulo6tl1t5snj1qsq4rjsvaju12',1454104427,1209600,''),('unebtd4ea0kfumma23u04rcl25',1454679083,1209600,''),('unsaj6eo2e6icq0t6t8fijrtk3',1454188641,1209600,''),('upcb5u7lie0tillmbvu1f27is7',1454188632,1209600,''),('uvn97no16g6l27svt2pjns64a5',1454454164,1209600,''),('v35tga30dofku87bcqckh345t5',1454341539,1209600,''),('v3aalua96u8me38jfmgsk0pj07',1454783181,1209600,''),('v8f269dbpr221lpt457nndrc03',1454395963,1209600,''),('vc2hoe0neik5e7pjrga43dthh2',1454396990,1209600,''),('velk2a9c7l37q4nr76kv10sg46',1454141109,1209600,''),('vg8164m6g7oq51447d1mkclsk0',1454135622,1209600,''),('vj01tr3lkt352kpd6l1rif1b22',1454496289,1209600,''),('vj051nsopjluo3kpt1hksdsdf2',1454501777,1209600,''),('vjf52jdcm7tc60puneahqtn8i7',1454188640,1209600,''),('vjkom1fegtqfeulbbj291csa65',1454341504,1209600,''),('vjodkei3t886mr33u6d7ut4a56',1454432559,1209600,''),('vk0tmjpka3r7q9frnjbfqr41l1',1453627401,1209600,''),('vkp77hr522iqaebgpgspepiom6',1454341521,1209600,''),('vl1hmn960g6ompmr9aljmknue4',1454141119,1209600,''),('vo28sod1i1sefuibmmaaq8vuc5',1453812902,1209600,'');
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
INSERT INTO `omeka_simple_pages_pages` VALUES (1,1,1,1,'ABOUT','about','<p>Ancient Egypt has held a fascination for Australians since Colonial times and over the centuries a considerable number of ancient Egyptian artefacts have come to make Australia their home.</p>\r\n<p>Amongst the earliest objects to reach our shores are ones that were brought to Adelaide in 1849 by&nbsp; the country&rsquo;s first Egyptologist, Maximillian Weidenbach. The 19 year old Max was the youngest member of the Royal Prussian Expedition to Egypt, led by Richard Lepsius, which travelled through the country from 1842 to 1845; he was an expert in copying hieroglyphic inscriptions and during his travels he collected a number of artefacts that he also brought with him to South Australia. Newspaper records indicate that he spoke at public gatherings about his Egyptian adventures and showed the objects he had brought back, which were eventually to be donated to the South Australian Museum.</p>\r\n<p>The largest and most significant collection of Aegyptiaca was amassed by Sir Charles Nicholson, founder of the Nicholson Museum at the University of Sydney. He visited Egypt in 1856-57 where he collected objects that were to be donated to the University of Sydney in 1860. He again visited Egypt in 1862 and the objects he acquired on that occasion were donated to the University in 1864.</p>\r\n<p>In the late 19<sup>th</sup> Century, Australian museums began contributing financially to excavations conducted by British Egyptologists, notably William Matthew Flinders Petrie (who was related to the explorer of Australia Matthew Flinders), and in return they received a share of the objects excavated. Amongst these museums was the Australian Museum, Sydney, from whom the Museum of Ancient Cultures at Macquarie University has the majority of them on long-term loan.</p>\r\n<p>From the early 20<sup>th</sup> Century onwards, Museum holdings of Egyptian objects were also to be supplemented by purchases on the antiquities market.</p>\r\n<p>Australians&rsquo; engagement with Egypt was greatly intensified from the beginning of the 20<sup>th</sup> Century. During the First World War, thousands of servicemen and women spent time in Egypt, an important staging post on the way to theatres of war in the Middle East and also Europe. As ship travel to and from Britain through the Suez Canal increased, great numbers of Australian travellers took the opportunity to make an excursion to Cairo and the pyramids of Giza while their ship was negotiating the canal. The Second World War again brought thousands of service personnel to Egypt. Many souvenirs were brought back to Australia by these visitors, most of them tourist trinkets, but amongst them there were also valuable original ancient artefacts, many of which have found their way into museum collections.</p>\r\n<p>Thus over the last 170 years thousands of ancient Egyptian artefacts have come to Australia but most of them remain relatively unknown. Only a small proportion of them are on public display in museums, the bulk are in storage. Even fewer have been published and where they have it has been primarily in specialist publications to which the general public does not have ready access.</p>\r\n<p>Yet the interest of the general public, both in Australia and abroad, in the history and culture of Ancient Egypt is as great as or greater than it has ever been. It is for this reason that the project <em>Aegyptiaca in Australia</em> has been instigated. Its aim is to make available to a world-wide public the rich and important collections of artefacts and monuments from Ancient Egypt now in Australian Collections; as well as an on-line catalogue with photographs of objects, its goal is to create a virtual Egyptian Museum accessible to all on the internet with high quality 3D image of all the most important objects that the viewer will be able to examine from all angles. <a href=\"http://130.56.249.104/\" target=\"_blank\">aegyptiaca.mq.edu.au</a>&nbsp; represents a pilot project that draws on the Egyptian holding of the Museum of Ancient Cultures and demonstrates the exciting possibilities that a virtual museum can offer.</p>\r\n<p>In addition to providing access to the ancient Egyptian artefacts in Australian collections, the project <em>Aegyptiaca in Australia</em> also aims to contribute to a better understanding of the individual who brought them here; what lay behind their interest in Egypt and its history, what are the social and cultural influences that may have played a role, and how did the Australian general public react to the arrival and display of these witnesses to a culture distant both in time and space from the very different world in which they lived?</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;&nbsp;</p>\r\n<p>Website Credits:</p>\r\n<p>This site was developed by the following COMP356 students in semester 2, 2015 under the supervision of Dr Steve Cassidy:&nbsp;</p>\r\n<ul>\r\n<li>Dan Buskariol</li>\r\n<li>Greg Lawrence</li>\r\n<li>Kevin Nguyen</li>\r\n<li>Jordan Ung</li>\r\n</ul>','2015-10-29 21:36:51','2015-09-05 12:50:13',0,0,'',1),(4,1,1,1,'CONTACT US','contact','<h2><span style=\"font-size: 1.5em;\">Contact Form</span></h2>\r\n<p>TBA</p>\r\n<div id=\"map\">&nbsp;</div>\r\n<script type=\"text/javascript\">// <![CDATA[\r\nfunction initMap() {\r\n  var myLatLng = {lat: -33.77447, lng: 151.11027};\r\n\r\n  var map = new google.maps.Map(document.getElementById(\'map\'), {\r\n    zoom: 18,\r\n    center: myLatLng\r\n  });\r\n\r\n  var marker = new google.maps.Marker({\r\n    position: myLatLng,\r\n    map: map,\r\n	\r\n    title: \'Level 3\'\r\n  });\r\n}\r\n// ]]></script>\r\n<script type=\"text/javascript\" src=\"https://maps.googleapis.com/maps/api/js?key=AIzaSyBARGxoKIoc81VbLnqfPzOwzMVE3CFGmrk&amp;signed_in=true&amp;callback=initMap\" defer=\"defer\">// <![CDATA[\r\n\r\n// ]]></script>','2015-10-29 07:24:54','2015-09-05 15:05:25',2,0,'',1),(5,1,1,1,'Your visit','visit','<h2>Opening Hours</h2>\r\n<p>9.30am - 4.30pm Monday - Friday (Other times by special arrangement)</p>\r\n<p>Please note that the Museum is usually open for major University events such as Information and Open Days, as well as major Ancient History events such as the annual Ancient History Teachers\' Conference and student Study Days.</p>\r\n<h2>Map</h2>\r\n<p><img src=\"http://www.mac.mq.edu.au/custom/files/media/mac-map_v2_thumbnail.jpg\" alt=\"MAC - Map Thumbnail\" /><a href=\"http://www.mac.mq.edu.au/custom/files/media/mac-map_v2.jpg\" target=\"_blank\"><br />View the full map</a></p>\r\n<h2>Transportation</h2>\r\n<p>Visit Macquarie University\'s&nbsp;<a href=\"http://mq.edu.au/transport/\">transportation</a>&nbsp;page for more information about getting to the Museum of Ancient Cultures including train and bus timetables, parking locations and other maps.&nbsp;</p>\r\n<div id=\"map\">&nbsp;</div>\r\n<script type=\"text/javascript\">// <![CDATA[\r\nfunction initMap() {\r\n  var myLatLng = {lat: -33.77447, lng: 151.11027};\r\n\r\n  var map = new google.maps.Map(document.getElementById(\'map\'), {\r\n    zoom: 18,\r\n    center: myLatLng\r\n  });\r\n\r\n  var marker = new google.maps.Marker({\r\n    position: myLatLng,\r\n    map: map,\r\n	\r\n    title: \'Level 3\'\r\n  });\r\n}\r\n// ]]></script>\r\n<p>&nbsp;</p>','2015-10-20 09:32:45','2015-09-05 15:08:32',1,6,'',1),(6,1,1,1,'AltHome','althome','<h2>Macquarie University MUSEUM of ANCIENT CULTURES</h2>\r\n<p>&nbsp;</p>\r\n<div id=\"primary\">\r\n<h3>Welcome to Macquarie University Museum of Ancient Cultures!</h3>\r\n</div>\r\n<div id=\"secondary\"><!-- end featured collection -->\r\n<h2>Opening Hours</h2>\r\n<h4>9.30am - 4.30pm Monday - Friday</h4>\r\n<p>(Other times by special arrangement)</p>\r\n<h2>&nbsp;</h2>\r\n<h2><span style=\"font-size: 10px;\">[featured_collections num=2]</span></h2>\r\n</div>\r\n<p>[featured_exhibits num=2]</p>\r\n<p>[featured_carousel autoscroll=true tags=3D interval=2600]</p>\r\n<p>&nbsp;</p>\r\n<p><a href=\"https://www.facebook.com\"><img src=\"http://130.56.249.104/themes/berlin-mac1/theme.jpg\" alt=\"FacebookIcon\" width=\"90\" height=\"90\" /></a></p>\r\n<p><a href=\"https://www.google.com\"><img src=\"imgsrctest.jpg\" alt=\"Google\" width=\"70\" height=\"70\" /></a></p>\r\n<p><a href=\"https://www.mq.edu.au\"><img src=\"./themes/berlin-mac1/theme.jpg\" alt=\"FacebookIcon\" width=\"120\" height=\"120\" /></a></p>\r\n<div id=\"map\">&nbsp;</div>\r\n<script type=\"text/javascript\">// <![CDATA[\r\nfunction initMap() {\r\n  var myLatLng = {lat: -33.77447, lng: 151.11027};\r\n\r\n  var map = new google.maps.Map(document.getElementById(\'map\'), {\r\n    zoom: 18,\r\n    center: myLatLng\r\n  });\r\n\r\n  var marker = new google.maps.Marker({\r\n    position: myLatLng,\r\n    map: map,\r\n	\r\n    title: \'Level 3\'\r\n  });\r\n}\r\n// ]]></script>\r\n<script type=\"text/javascript\" src=\"https://maps.googleapis.com/maps/api/js?key=AIzaSyBARGxoKIoc81VbLnqfPzOwzMVE3CFGmrk&amp;signed_in=true&amp;callback=initMap\" defer=\"defer\">// <![CDATA[\r\n\r\n// ]]></script>','2015-10-20 10:14:50','2015-09-05 18:28:10',0,0,'',1),(7,1,1,1,'NEWS+EVENTS','news_events','<h2>&nbsp;NEWS</h2>\r\n<p>No news today...</p>\r\n<p>&nbsp;</p>\r\n<h2><span>EVENTS</span></h2>\r\n<p>No events today...</p>','2015-10-29 07:28:52','2015-09-08 15:28:43',0,0,'',1),(8,1,1,1,'News','news','<h3>Local News:</h3>\r\n<p>[items collection=3]</p>\r\n<p>&nbsp;</p>\r\n<h3>World News:&nbsp;</h3>\r\n<p>[items collection=4]</p>\r\n<p>&nbsp;</p>\r\n<h3>Developer News (last updated 8 Sep 2015)</h3>\r\n<p>Following plugins may prove useful:</p>\r\n<p>- Simple Pages</p>\r\n<p>- Exhibit Builder</p>\r\n<p>- CSV Import</p>\r\n<p>Local:&nbsp;[items num=3 collection=3 sort=\"Dublin Core,Title\" order=d]</p>\r\n<p>World:&nbsp;[items num=3 collection=4 sort=\"Dublin Core,Title\" order=d]</p>','2015-09-23 12:24:31','2015-09-08 16:00:45',0,7,'',1),(9,1,1,1,'Events','events','<h2><span style=\"font-size: 1.5em;\">Events</span></h2>\r\n<p>No events today...</p>','2015-09-08 16:12:46','2015-09-08 16:08:24',0,7,'',1),(10,1,1,1,'COLLECTIONS','collections','','2015-10-29 07:29:23','2015-09-08 16:09:21',0,0,'',0);
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `omeka_tags`
--

LOCK TABLES `omeka_tags` WRITE;
/*!40000 ALTER TABLE `omeka_tags` DISABLE KEYS */;
INSERT INTO `omeka_tags` VALUES (9,'3'),(8,'3D'),(7,'amnh'),(5,'carousel'),(1,'egypt'),(2,'greece'),(4,'localnews'),(6,'screenshots'),(3,'worldnews');
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

-- Dump completed on 2016-02-08  6:11:13
