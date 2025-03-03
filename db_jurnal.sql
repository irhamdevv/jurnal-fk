-- MySQL dump 10.13  Distrib 8.0.35, for macos13 (arm64)
--
-- Host: 172.16.0.76    Database: dboj
-- ------------------------------------------------------
-- Server version	5.7.38

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `access_keys`
--

DROP TABLE IF EXISTS `access_keys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `access_keys` (
  `access_key_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `context` varchar(40) NOT NULL,
  `key_hash` varchar(40) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `assoc_id` bigint(20) DEFAULT NULL,
  `expiry_date` datetime NOT NULL,
  PRIMARY KEY (`access_key_id`),
  KEY `access_keys_hash` (`key_hash`,`user_id`,`context`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `access_keys`
--

LOCK TABLES `access_keys` WRITE;
/*!40000 ALTER TABLE `access_keys` DISABLE KEYS */;
/*!40000 ALTER TABLE `access_keys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `announcement_settings`
--

DROP TABLE IF EXISTS `announcement_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `announcement_settings` (
  `announcement_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) DEFAULT NULL,
  UNIQUE KEY `announcement_settings_pkey` (`announcement_id`,`locale`,`setting_name`),
  KEY `announcement_settings_announcement_id` (`announcement_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `announcement_settings`
--

LOCK TABLES `announcement_settings` WRITE;
/*!40000 ALTER TABLE `announcement_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `announcement_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `announcement_type_settings`
--

DROP TABLE IF EXISTS `announcement_type_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `announcement_type_settings` (
  `type_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `announcement_type_settings_pkey` (`type_id`,`locale`,`setting_name`),
  KEY `announcement_type_settings_type_id` (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `announcement_type_settings`
--

LOCK TABLES `announcement_type_settings` WRITE;
/*!40000 ALTER TABLE `announcement_type_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `announcement_type_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `announcement_types`
--

DROP TABLE IF EXISTS `announcement_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `announcement_types` (
  `type_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `assoc_type` smallint(6) NOT NULL,
  `assoc_id` bigint(20) NOT NULL,
  PRIMARY KEY (`type_id`),
  KEY `announcement_types_assoc` (`assoc_type`,`assoc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `announcement_types`
--

LOCK TABLES `announcement_types` WRITE;
/*!40000 ALTER TABLE `announcement_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `announcement_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `announcements`
--

DROP TABLE IF EXISTS `announcements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `announcements` (
  `announcement_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `assoc_type` smallint(6) DEFAULT NULL,
  `assoc_id` bigint(20) NOT NULL,
  `type_id` bigint(20) DEFAULT NULL,
  `date_expire` date DEFAULT NULL,
  `date_posted` datetime NOT NULL,
  PRIMARY KEY (`announcement_id`),
  KEY `announcements_assoc` (`assoc_type`,`assoc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `announcements`
--

LOCK TABLES `announcements` WRITE;
/*!40000 ALTER TABLE `announcements` DISABLE KEYS */;
/*!40000 ALTER TABLE `announcements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_sources`
--

DROP TABLE IF EXISTS `auth_sources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_sources` (
  `auth_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(60) NOT NULL,
  `plugin` varchar(32) NOT NULL,
  `auth_default` smallint(6) NOT NULL DEFAULT '0',
  `settings` text,
  PRIMARY KEY (`auth_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_sources`
--

LOCK TABLES `auth_sources` WRITE;
/*!40000 ALTER TABLE `auth_sources` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_sources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `author_settings`
--

DROP TABLE IF EXISTS `author_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `author_settings` (
  `author_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  UNIQUE KEY `author_settings_pkey` (`author_id`,`locale`,`setting_name`),
  KEY `author_settings_author_id` (`author_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author_settings`
--

LOCK TABLES `author_settings` WRITE;
/*!40000 ALTER TABLE `author_settings` DISABLE KEYS */;
INSERT INTO `author_settings` VALUES (1,'','country','ID'),(1,'','orcid',''),(1,'','url',''),(1,'id_ID','affiliation','Universitas Islam Al Azhar'),(1,'id_ID','biography',''),(1,'id_ID','familyName',''),(1,'id_ID','givenName','Indika Safitri Megalanik'),(1,'id_ID','preferredPublicName',''),(2,'','country','ID'),(2,'','orcid',''),(2,'','url',''),(2,'id_ID','affiliation','Universitas Islam Al Azhar'),(2,'id_ID','biography',''),(2,'id_ID','familyName',''),(2,'id_ID','givenName','Nur Asmita Purnamasari'),(2,'id_ID','preferredPublicName',''),(4,'','country','ID'),(4,'','orcid',''),(4,'','url',''),(4,'id_ID','affiliation',''),(4,'id_ID','biography',''),(4,'id_ID','familyName',''),(4,'id_ID','givenName','Nur Asmita Purnamasari'),(4,'id_ID','preferredPublicName',''),(5,'','country','ID'),(5,'','orcid',''),(5,'','url',''),(5,'id_ID','affiliation',''),(5,'id_ID','biography',''),(5,'id_ID','familyName',''),(5,'id_ID','givenName','Nur Asmita Purnamasari'),(5,'id_ID','preferredPublicName','indika'),(7,'','country','AL'),(7,'','orcid',''),(7,'','url',''),(7,'id_ID','affiliation',''),(7,'id_ID','biography','<p>aaa</p>'),(7,'id_ID','familyName',''),(7,'id_ID','givenName','aaa'),(7,'id_ID','preferredPublicName','');
/*!40000 ALTER TABLE `author_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authors`
--

DROP TABLE IF EXISTS `authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authors` (
  `author_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email` varchar(90) NOT NULL,
  `include_in_browse` smallint(6) NOT NULL DEFAULT '1',
  `publication_id` bigint(20) NOT NULL,
  `seq` double(8,2) NOT NULL DEFAULT '0.00',
  `user_group_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`author_id`),
  KEY `authors_publication_id` (`publication_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authors`
--

LOCK TABLES `authors` WRITE;
/*!40000 ALTER TABLE `authors` DISABLE KEYS */;
INSERT INTO `authors` VALUES (1,'megalanik43@gmail.com',1,3,0.00,14),(2,'asmitapurnamsari@unram.ac.id',1,3,1.00,14),(4,'nur@gmail.com',1,7,0.00,14),(5,'isa@gmail.com',1,8,0.00,14),(7,'ddd@gmail.com',1,12,0.00,14);
/*!40000 ALTER TABLE `authors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `category_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `context_id` bigint(20) NOT NULL,
  `parent_id` bigint(20) NOT NULL,
  `seq` bigint(20) DEFAULT NULL,
  `path` varchar(255) NOT NULL,
  `image` text,
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `category_path` (`context_id`,`path`),
  KEY `category_context_id` (`context_id`,`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_settings`
--

DROP TABLE IF EXISTS `category_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category_settings` (
  `category_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)',
  UNIQUE KEY `category_settings_pkey` (`category_id`,`locale`,`setting_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_settings`
--

LOCK TABLES `category_settings` WRITE;
/*!40000 ALTER TABLE `category_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `category_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `citation_settings`
--

DROP TABLE IF EXISTS `citation_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `citation_settings` (
  `citation_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `citation_settings_pkey` (`citation_id`,`locale`,`setting_name`),
  KEY `citation_settings_citation_id` (`citation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `citation_settings`
--

LOCK TABLES `citation_settings` WRITE;
/*!40000 ALTER TABLE `citation_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `citation_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `citations`
--

DROP TABLE IF EXISTS `citations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `citations` (
  `citation_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `publication_id` bigint(20) NOT NULL DEFAULT '0',
  `raw_citation` text NOT NULL,
  `seq` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`citation_id`),
  UNIQUE KEY `citations_publication_seq` (`publication_id`,`seq`),
  KEY `citations_publication` (`publication_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `citations`
--

LOCK TABLES `citations` WRITE;
/*!40000 ALTER TABLE `citations` DISABLE KEYS */;
/*!40000 ALTER TABLE `citations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `completed_payments`
--

DROP TABLE IF EXISTS `completed_payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `completed_payments` (
  `completed_payment_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `timestamp` datetime NOT NULL,
  `payment_type` bigint(20) NOT NULL,
  `context_id` bigint(20) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `assoc_id` bigint(20) DEFAULT NULL,
  `amount` double(8,2) NOT NULL,
  `currency_code_alpha` varchar(3) DEFAULT NULL,
  `payment_method_plugin_name` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`completed_payment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `completed_payments`
--

LOCK TABLES `completed_payments` WRITE;
/*!40000 ALTER TABLE `completed_payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `completed_payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `controlled_vocab_entries`
--

DROP TABLE IF EXISTS `controlled_vocab_entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `controlled_vocab_entries` (
  `controlled_vocab_entry_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `controlled_vocab_id` bigint(20) NOT NULL,
  `seq` double(8,2) DEFAULT NULL,
  PRIMARY KEY (`controlled_vocab_entry_id`),
  KEY `controlled_vocab_entries_cv_id` (`controlled_vocab_id`,`seq`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `controlled_vocab_entries`
--

LOCK TABLES `controlled_vocab_entries` WRITE;
/*!40000 ALTER TABLE `controlled_vocab_entries` DISABLE KEYS */;
INSERT INTO `controlled_vocab_entries` VALUES (32,12,1.00),(33,12,2.00),(34,12,3.00),(22,32,1.00);
/*!40000 ALTER TABLE `controlled_vocab_entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `controlled_vocab_entry_settings`
--

DROP TABLE IF EXISTS `controlled_vocab_entry_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `controlled_vocab_entry_settings` (
  `controlled_vocab_entry_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `c_v_e_s_pkey` (`controlled_vocab_entry_id`,`locale`,`setting_name`),
  KEY `c_v_e_s_entry_id` (`controlled_vocab_entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `controlled_vocab_entry_settings`
--

LOCK TABLES `controlled_vocab_entry_settings` WRITE;
/*!40000 ALTER TABLE `controlled_vocab_entry_settings` DISABLE KEYS */;
INSERT INTO `controlled_vocab_entry_settings` VALUES (22,'id_ID','submissionKeyword','Bacillus','string'),(32,'id_ID','submissionKeyword','Students opportunity','string'),(33,'id_ID','submissionKeyword','Master’s','string'),(34,'id_ID','submissionKeyword','Study','string');
/*!40000 ALTER TABLE `controlled_vocab_entry_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `controlled_vocabs`
--

DROP TABLE IF EXISTS `controlled_vocabs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `controlled_vocabs` (
  `controlled_vocab_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `symbolic` varchar(64) NOT NULL,
  `assoc_type` bigint(20) NOT NULL DEFAULT '0',
  `assoc_id` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`controlled_vocab_id`),
  UNIQUE KEY `controlled_vocab_symbolic` (`symbolic`,`assoc_type`,`assoc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `controlled_vocabs`
--

LOCK TABLES `controlled_vocabs` WRITE;
/*!40000 ALTER TABLE `controlled_vocabs` DISABLE KEYS */;
INSERT INTO `controlled_vocabs` VALUES (1,'interest',0,0),(6,'submissionAgency',1048588,1),(11,'submissionAgency',1048588,2),(16,'submissionAgency',1048588,3),(21,'submissionAgency',1048588,4),(26,'submissionAgency',1048588,5),(31,'submissionAgency',1048588,6),(36,'submissionAgency',1048588,7),(41,'submissionAgency',1048588,8),(46,'submissionAgency',1048588,9),(51,'submissionAgency',1048588,10),(56,'submissionAgency',1048588,11),(61,'submissionAgency',1048588,12),(4,'submissionDiscipline',1048588,1),(9,'submissionDiscipline',1048588,2),(14,'submissionDiscipline',1048588,3),(19,'submissionDiscipline',1048588,4),(24,'submissionDiscipline',1048588,5),(29,'submissionDiscipline',1048588,6),(34,'submissionDiscipline',1048588,7),(39,'submissionDiscipline',1048588,8),(44,'submissionDiscipline',1048588,9),(49,'submissionDiscipline',1048588,10),(54,'submissionDiscipline',1048588,11),(59,'submissionDiscipline',1048588,12),(2,'submissionKeyword',1048588,1),(7,'submissionKeyword',1048588,2),(12,'submissionKeyword',1048588,3),(17,'submissionKeyword',1048588,4),(22,'submissionKeyword',1048588,5),(27,'submissionKeyword',1048588,6),(32,'submissionKeyword',1048588,7),(37,'submissionKeyword',1048588,8),(42,'submissionKeyword',1048588,9),(47,'submissionKeyword',1048588,10),(52,'submissionKeyword',1048588,11),(57,'submissionKeyword',1048588,12),(5,'submissionLanguage',1048588,1),(10,'submissionLanguage',1048588,2),(15,'submissionLanguage',1048588,3),(20,'submissionLanguage',1048588,4),(25,'submissionLanguage',1048588,5),(30,'submissionLanguage',1048588,6),(35,'submissionLanguage',1048588,7),(40,'submissionLanguage',1048588,8),(45,'submissionLanguage',1048588,9),(50,'submissionLanguage',1048588,10),(55,'submissionLanguage',1048588,11),(60,'submissionLanguage',1048588,12),(3,'submissionSubject',1048588,1),(8,'submissionSubject',1048588,2),(13,'submissionSubject',1048588,3),(18,'submissionSubject',1048588,4),(23,'submissionSubject',1048588,5),(28,'submissionSubject',1048588,6),(33,'submissionSubject',1048588,7),(38,'submissionSubject',1048588,8),(43,'submissionSubject',1048588,9),(48,'submissionSubject',1048588,10),(53,'submissionSubject',1048588,11),(58,'submissionSubject',1048588,12);
/*!40000 ALTER TABLE `controlled_vocabs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_issue_orders`
--

DROP TABLE IF EXISTS `custom_issue_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `custom_issue_orders` (
  `issue_id` bigint(20) NOT NULL,
  `journal_id` bigint(20) NOT NULL,
  `seq` double(8,2) NOT NULL DEFAULT '0.00',
  UNIQUE KEY `custom_issue_orders_pkey` (`issue_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_issue_orders`
--

LOCK TABLES `custom_issue_orders` WRITE;
/*!40000 ALTER TABLE `custom_issue_orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_issue_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_section_orders`
--

DROP TABLE IF EXISTS `custom_section_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `custom_section_orders` (
  `issue_id` bigint(20) NOT NULL,
  `section_id` bigint(20) NOT NULL,
  `seq` double(8,2) NOT NULL DEFAULT '0.00',
  UNIQUE KEY `custom_section_orders_pkey` (`issue_id`,`section_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_section_orders`
--

LOCK TABLES `custom_section_orders` WRITE;
/*!40000 ALTER TABLE `custom_section_orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_section_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_object_tombstone_oai_set_objects`
--

DROP TABLE IF EXISTS `data_object_tombstone_oai_set_objects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `data_object_tombstone_oai_set_objects` (
  `object_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tombstone_id` bigint(20) NOT NULL,
  `assoc_type` bigint(20) NOT NULL,
  `assoc_id` bigint(20) NOT NULL,
  PRIMARY KEY (`object_id`),
  KEY `data_object_tombstone_oai_set_objects_tombstone_id` (`tombstone_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_object_tombstone_oai_set_objects`
--

LOCK TABLES `data_object_tombstone_oai_set_objects` WRITE;
/*!40000 ALTER TABLE `data_object_tombstone_oai_set_objects` DISABLE KEYS */;
INSERT INTO `data_object_tombstone_oai_set_objects` VALUES (3,2,256,1),(4,2,530,1),(5,3,256,1),(6,3,530,1);
/*!40000 ALTER TABLE `data_object_tombstone_oai_set_objects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_object_tombstone_settings`
--

DROP TABLE IF EXISTS `data_object_tombstone_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `data_object_tombstone_settings` (
  `tombstone_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)',
  UNIQUE KEY `data_object_tombstone_settings_pkey` (`tombstone_id`,`locale`,`setting_name`),
  KEY `data_object_tombstone_settings_tombstone_id` (`tombstone_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_object_tombstone_settings`
--

LOCK TABLES `data_object_tombstone_settings` WRITE;
/*!40000 ALTER TABLE `data_object_tombstone_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `data_object_tombstone_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_object_tombstones`
--

DROP TABLE IF EXISTS `data_object_tombstones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `data_object_tombstones` (
  `tombstone_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `data_object_id` bigint(20) NOT NULL,
  `date_deleted` datetime NOT NULL,
  `set_spec` varchar(255) NOT NULL,
  `set_name` varchar(255) NOT NULL,
  `oai_identifier` varchar(255) NOT NULL,
  PRIMARY KEY (`tombstone_id`),
  KEY `data_object_tombstones_data_object_id` (`data_object_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_object_tombstones`
--

LOCK TABLES `data_object_tombstones` WRITE;
/*!40000 ALTER TABLE `data_object_tombstones` DISABLE KEYS */;
INSERT INTO `data_object_tombstones` VALUES (2,7,'2025-02-27 13:07:10','mcd:ART','Artikel','oai:ojs2.202.46.155.66:6677:article/7'),(3,3,'2025-02-27 13:07:17','mcd:ART','Artikel','oai:ojs2.202.46.155.66:6677:article/3');
/*!40000 ALTER TABLE `data_object_tombstones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edit_decisions`
--

DROP TABLE IF EXISTS `edit_decisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `edit_decisions` (
  `edit_decision_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `submission_id` bigint(20) NOT NULL,
  `review_round_id` bigint(20) NOT NULL,
  `stage_id` bigint(20) DEFAULT NULL,
  `round` smallint(6) NOT NULL,
  `editor_id` bigint(20) NOT NULL,
  `decision` smallint(6) NOT NULL,
  `date_decided` datetime NOT NULL,
  PRIMARY KEY (`edit_decision_id`),
  KEY `edit_decisions_submission_id` (`submission_id`),
  KEY `edit_decisions_editor_id` (`editor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edit_decisions`
--

LOCK TABLES `edit_decisions` WRITE;
/*!40000 ALTER TABLE `edit_decisions` DISABLE KEYS */;
/*!40000 ALTER TABLE `edit_decisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_log`
--

DROP TABLE IF EXISTS `email_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `email_log` (
  `log_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `assoc_type` bigint(20) NOT NULL,
  `assoc_id` bigint(20) NOT NULL,
  `sender_id` bigint(20) NOT NULL,
  `date_sent` datetime NOT NULL,
  `event_type` bigint(20) DEFAULT NULL,
  `from_address` varchar(255) DEFAULT NULL,
  `recipients` text,
  `cc_recipients` text,
  `bcc_recipients` text,
  `subject` varchar(255) DEFAULT NULL,
  `body` text,
  PRIMARY KEY (`log_id`),
  KEY `email_log_assoc` (`assoc_type`,`assoc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_log`
--

LOCK TABLES `email_log` WRITE;
/*!40000 ALTER TABLE `email_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_log_users`
--

DROP TABLE IF EXISTS `email_log_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `email_log_users` (
  `email_log_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  UNIQUE KEY `email_log_user_id` (`email_log_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_log_users`
--

LOCK TABLES `email_log_users` WRITE;
/*!40000 ALTER TABLE `email_log_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_log_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_templates`
--

DROP TABLE IF EXISTS `email_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `email_templates` (
  `email_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email_key` varchar(64) NOT NULL COMMENT 'Unique identifier for this email.',
  `context_id` bigint(20) NOT NULL,
  `enabled` smallint(6) NOT NULL DEFAULT '1',
  PRIMARY KEY (`email_id`),
  UNIQUE KEY `email_templates_email_key` (`email_key`,`context_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_templates`
--

LOCK TABLES `email_templates` WRITE;
/*!40000 ALTER TABLE `email_templates` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_templates_default`
--

DROP TABLE IF EXISTS `email_templates_default`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `email_templates_default` (
  `email_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email_key` varchar(64) NOT NULL COMMENT 'Unique identifier for this email.',
  `can_disable` smallint(6) NOT NULL DEFAULT '0',
  `can_edit` smallint(6) NOT NULL DEFAULT '0',
  `from_role_id` bigint(20) DEFAULT NULL,
  `to_role_id` bigint(20) DEFAULT NULL,
  `stage_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`email_id`),
  KEY `email_templates_default_email_key` (`email_key`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_templates_default`
--

LOCK TABLES `email_templates_default` WRITE;
/*!40000 ALTER TABLE `email_templates_default` DISABLE KEYS */;
INSERT INTO `email_templates_default` VALUES (1,'NOTIFICATION',0,1,NULL,NULL,NULL),(2,'NOTIFICATION_CENTER_DEFAULT',0,1,NULL,NULL,NULL),(3,'PASSWORD_RESET_CONFIRM',0,1,NULL,NULL,NULL),(4,'USER_REGISTER',0,1,NULL,NULL,NULL),(5,'USER_VALIDATE',0,1,NULL,NULL,NULL),(6,'REVIEWER_REGISTER',0,1,NULL,NULL,NULL),(7,'PUBLISH_NOTIFY',0,1,NULL,NULL,NULL),(8,'LOCKSS_EXISTING_ARCHIVE',0,1,NULL,NULL,NULL),(9,'LOCKSS_NEW_ARCHIVE',0,1,NULL,NULL,NULL),(10,'SUBMISSION_ACK',1,1,NULL,65536,1),(11,'SUBMISSION_ACK_NOT_USER',1,1,NULL,65536,1),(12,'EDITOR_ASSIGN',1,1,16,16,1),(13,'REVIEW_CANCEL',1,1,16,4096,3),(14,'REVIEW_REINSTATE',1,1,16,4096,3),(15,'REVIEW_REQUEST',1,1,16,4096,3),(16,'REVIEW_REQUEST_SUBSEQUENT',1,1,16,4096,3),(17,'REVIEW_REQUEST_ONECLICK',1,1,16,4096,3),(18,'REVIEW_REQUEST_ONECLICK_SUBSEQUENT',1,1,16,4096,3),(19,'REVIEW_REQUEST_ATTACHED',0,1,16,4096,3),(20,'REVIEW_REQUEST_ATTACHED_SUBSEQUENT',0,1,16,4096,3),(21,'REVIEW_REQUEST_REMIND_AUTO',0,1,NULL,4096,3),(22,'REVIEW_REQUEST_REMIND_AUTO_ONECLICK',0,1,NULL,4096,3),(23,'REVIEW_CONFIRM',1,1,4096,16,3),(24,'REVIEW_DECLINE',1,1,4096,16,3),(25,'REVIEW_ACK',1,1,16,4096,3),(26,'REVIEW_REMIND',0,1,16,4096,3),(27,'REVIEW_REMIND_AUTO',0,1,NULL,4096,3),(28,'REVIEW_REMIND_ONECLICK',0,1,16,4096,3),(29,'REVIEW_REMIND_AUTO_ONECLICK',0,1,NULL,4096,3),(30,'EDITOR_DECISION_ACCEPT',0,1,16,65536,3),(31,'EDITOR_DECISION_SEND_TO_EXTERNAL',0,1,16,65536,3),(32,'EDITOR_DECISION_SEND_TO_PRODUCTION',0,1,16,65536,5),(33,'EDITOR_DECISION_REVISIONS',0,1,16,65536,3),(34,'EDITOR_DECISION_RESUBMIT',0,1,16,65536,3),(35,'EDITOR_DECISION_DECLINE',0,1,16,65536,3),(36,'EDITOR_DECISION_INITIAL_DECLINE',0,1,16,65536,1),(37,'EDITOR_RECOMMENDATION',0,1,16,16,3),(38,'COPYEDIT_REQUEST',1,1,16,4097,4),(39,'LAYOUT_REQUEST',1,1,16,4097,5),(40,'LAYOUT_COMPLETE',1,1,4097,16,5),(41,'EMAIL_LINK',0,1,1048576,NULL,NULL),(42,'SUBSCRIPTION_NOTIFY',0,1,NULL,1048576,NULL),(43,'OPEN_ACCESS_NOTIFY',0,1,NULL,1048576,NULL),(44,'SUBSCRIPTION_BEFORE_EXPIRY',0,1,NULL,1048576,NULL),(45,'SUBSCRIPTION_AFTER_EXPIRY',0,1,NULL,1048576,NULL),(46,'SUBSCRIPTION_AFTER_EXPIRY_LAST',0,1,NULL,1048576,NULL),(47,'SUBSCRIPTION_PURCHASE_INDL',0,1,NULL,2097152,NULL),(48,'SUBSCRIPTION_PURCHASE_INSTL',0,1,NULL,2097152,NULL),(49,'SUBSCRIPTION_RENEW_INDL',0,1,NULL,2097152,NULL),(50,'SUBSCRIPTION_RENEW_INSTL',0,1,NULL,2097152,NULL),(51,'CITATION_EDITOR_AUTHOR_QUERY',0,1,NULL,NULL,4),(52,'REVISED_VERSION_NOTIFY',0,1,NULL,16,3),(53,'STATISTICS_REPORT_NOTIFICATION',1,1,16,17,NULL),(54,'ANNOUNCEMENT',0,1,16,1048576,NULL),(55,'ORCID_COLLECT_AUTHOR_ID',0,1,NULL,NULL,NULL),(56,'ORCID_REQUEST_AUTHOR_AUTHORIZATION',0,1,NULL,NULL,NULL),(57,'MANUAL_PAYMENT_NOTIFICATION',0,1,NULL,NULL,NULL),(58,'PAYPAL_INVESTIGATE_PAYMENT',0,1,NULL,NULL,NULL);
/*!40000 ALTER TABLE `email_templates_default` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_templates_default_data`
--

DROP TABLE IF EXISTS `email_templates_default_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `email_templates_default_data` (
  `email_key` varchar(64) NOT NULL COMMENT 'Unique identifier for this email.',
  `locale` varchar(14) NOT NULL DEFAULT 'en_US',
  `subject` varchar(120) NOT NULL,
  `body` text,
  `description` text,
  UNIQUE KEY `email_templates_default_data_pkey` (`email_key`,`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_templates_default_data`
--

LOCK TABLES `email_templates_default_data` WRITE;
/*!40000 ALTER TABLE `email_templates_default_data` DISABLE KEYS */;
INSERT INTO `email_templates_default_data` VALUES ('ANNOUNCEMENT','en_US','{$title}','<b>{$title}</b><br />\n<br />\n{$summary}<br />\n<br />\nVisit our website to read the <a href=\"{$url}\">full announcement</a>.','This email is sent when a new announcement is created.'),('ANNOUNCEMENT','id_ID','{$title}','<b>{$title}</b><br />\n<br />\n{$summary}<br />\n<br />\nKunjungi website kami untuk melihat <a href=\"{$url}\">pengumuman selengkapnya</a>.','Surel ini dikirim ketika terdapat pengumuman baru.'),('CITATION_EDITOR_AUTHOR_QUERY','en_US','Citation Editing','{$authorFirstName},<br />\n<br />\nCould you please verify or provide us with the proper citation for the following reference from your article, {$submissionTitle}:<br />\n<br />\n{$rawCitation}<br />\n<br />\nThanks!<br />\n<br />\n{$userFirstName}<br />\nCopy-Editor, {$contextName}<br />\n','This email allows copyeditors to request additional information about references from authors.'),('CITATION_EDITOR_AUTHOR_QUERY','id_ID','Penyuntingan Sitiran','{$authorFirstName},<br />\n<br />\nMohon verifikasi atau berikan sitasi yang benar untuk rujukan berikut dari artikel Anda, {$submissionTitle}:<br />\n<br />\n{$rawCitation}<br />\n<br />\nTerimakasih!<br />\n<br />\n{$userFirstName}<br />\nCopy-Editor, {$contextName}<br />\n','Email ini memungkinkan copyeditor untuk meminta informasi tambahan tentang rujukan dari penulis.'),('COPYEDIT_REQUEST','en_US','Copyediting Request','{$participantName}:<br />\n<br />\nI would ask that you undertake the copyediting of &quot;{$submissionTitle}&quot; for {$contextName} by following these steps.<br />\n1. Click on the Submission URL below.<br />\n2. Open any files available under Draft Files and do your copyediting, while adding any Copyediting Discussions as needed.<br />\n3. Save copyedited file(s), and upload to Copyedited panel.<br />\n4. Notify the Editor that all files have been prepared, and that the Production process may begin.<br />\n<br />\n{$contextName} URL: {$contextUrl}<br />\nSubmission URL: {$submissionUrl}<br />\nUsername: {$participantUsername}','This email is sent by a Section Editor to a submission\'s Copyeditor to request that they begin the copyediting process. It provides information about the submission and how to access it.'),('COPYEDIT_REQUEST','id_ID','Permohonan Copyediting','{$participantName}:<br />\n<br />\nKami meminta Anda melakukan copyediting terhadap &quot;{$submissionTitle}&quot; untuk {$contextName} mengikuti langkah-langkah berikut.<br />\n1. Klik URL Naskah di bawah.<br />\n2. Buka semua file yang ada di file Draft dan lakukan copyediting, tambahkan Diskusi Copyediting sesuai kebutuhan.<br />\n3. Simpan file yang telah di-copyedit, dan unggah ke panel Sudah Copyedit.<br />\n4. Beritahu Editor bahwa semua file telah siap, dan bahwa proses Produksi dapat dimulai.<br />\n<br />\n{$contextName} URL: {$contextUrl}<br />\nURL Naskah: {$submissionUrl}<br />\nNama pengguna: {$participantUsername}','Email ini dari Editor Bagian ke Copyeditor naskah agar memulai proses copyediting.  Email ini memuat informasi terkait penyerahan naskah dan bagaimana mengaksesnya.'),('EDITOR_ASSIGN','en_US','Editorial Assignment','{$editorialContactName}:<br />\n<br />\nThe submission, &quot;{$submissionTitle},&quot; to {$contextName} has been assigned to you to see through the editorial process in your role as Section Editor.<br />\n<br />\nSubmission URL: {$submissionUrl}<br />\nUsername: {$editorUsername}<br />\n<br />\nThank you.','This email notifies a Section Editor that the Editor has assigned them the task of overseeing a submission through the editing process. It provides information about the submission and how to access the journal site.'),('EDITOR_ASSIGN','id_ID','Penugasan Editorial','{$editorialContactName}:<br />\n<br />\nNaskah, &quot;{$submissionTitle},&quot; di {$contextName} telah ditugaskan kepada Anda sebagai Editor Bagian untuk memastikan selesainya seluruh proses editorial.<br />\n<br />\nURL Naskah: {$submissionUrl}<br />\nNama pengguna: {$editorUsername}<br />\n<br />\nTerimakasih.','Email ini memberitahu Editor Bagian bahwa Editor telah memberikan tugas untuk mengawasi suatu naskah dalam menyelesaikan proses editorial. Email ini memberikan informasi mengenai naskah dan cara mengaksesnya di website jurnal.'),('EDITOR_DECISION_ACCEPT','en_US','Editor Decision','{$authorName}:<br />\n<br />\nWe have reached a decision regarding your submission to {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nOur decision is to: Accept Submission','This email from the Editor or Section Editor to an Author notifies them of a final \"accept submission\" decision regarding their submission.'),('EDITOR_DECISION_ACCEPT','id_ID','Keputusan Editor','{$authorName}:<br />\n<br />\nKami telah membuat keputusan terkait naskah yang Anda kirimkan ke {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nKeputusan kami adalah: Naskah Diterima','Email ini dari Editor atau Editor Bagian kepada Penulis memberitahukan keputusan final \"Naskah Diterima\".'),('EDITOR_DECISION_DECLINE','en_US','Editor Decision','{$authorName}:<br />\n<br />\nWe have reached a decision regarding your submission to {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nOur decision is to: Decline Submission','This email from the Editor or Section Editor to an Author notifies them of a final \"decline\" decision regarding their submission.'),('EDITOR_DECISION_DECLINE','id_ID','Keputusan Editor','{$authorName}:<br />\n<br />\nKami telah membuat keputusan terkait naskah yang Anda kirimkan ke {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nKeputusan kami adalah: Naskah Ditolak','Email ini dari Editor atau Editor Bagian kepada Penulis memberitahukan keputusan final \"Naskah Ditolak\".'),('EDITOR_DECISION_INITIAL_DECLINE','en_US','Editor Decision','\n			{$authorName}:<br />\n<br />\nWe have reached a decision regarding your submission to {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nOur decision is to: Decline Submission','This email is sent to the author if the editor declines their submission initially, before the review stage'),('EDITOR_DECISION_INITIAL_DECLINE','id_ID','Keputusan Penyunting','\n			{$authorName}:<br />\n<br />\nKami telah sampai pada keputusan mengenai naskah Anda {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nKeputusannya adalah: Menolak Naskah','Email ini dikirim kepada penulis jika naskah mereka ditolak oleh editor lebih awal, sebelum masuk ke tahap review'),('EDITOR_DECISION_RESUBMIT','en_US','Editor Decision','{$authorName}:<br />\n<br />\nWe have reached a decision regarding your submission to {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nOur decision is to: Resubmit for Review','This email from the Editor or Section Editor to an Author notifies them of a final \"resubmit\" decision regarding their submission.'),('EDITOR_DECISION_RESUBMIT','id_ID','Keputusan Editor','{$authorName}:<br />\n<br />\nKami telah membuat keputusan terkait naskah yang Anda kirimkan ke {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nKeputusan kami adalah: Kirim Ulang untuk Review','Email ini dari Editor atau Editor Bagian kepada Penulis memberitahukan bahwa Penulis perlu mengirim ulang naskahnya.'),('EDITOR_DECISION_REVISIONS','en_US','Editor Decision','{$authorName}:<br />\n<br />\nWe have reached a decision regarding your submission to {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nOur decision is: Revisions Required','This email from the Editor or Section Editor to an Author notifies them of a final \"revisions required\" decision regarding their submission.'),('EDITOR_DECISION_REVISIONS','id_ID','Keputusan Editor','{$authorName}:<br />\n<br />\nKami telah membuat keputusan terkait naskah yang Anda kirimkan ke {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nKeputusan kami adalah: Perlu Revisi','Email ini dari Editor atau Editor Bagian kepada Penulis memberitahukan keputusan final \"Perlu Revisi\".'),('EDITOR_DECISION_SEND_TO_EXTERNAL','en_US','Editor Decision','{$authorName}:<br />\n<br />\nWe have reached a decision regarding your submission to {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nOur decision is to: Send to Review<br />\n<br />\nSubmission URL: {$submissionUrl}','This email from the Editor or Section Editor to an Author notifies them that their submission is being sent to an external review.'),('EDITOR_DECISION_SEND_TO_EXTERNAL','id_ID','Keputusan Editor','{$authorName}:<br />\n<br />\nKami telah membuat keputusan terkait naskah yang Anda kirimkan ke {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nKeputusan kami adalah: Dikirimkan ke Reviewer Eksternal<br />\n<br />\nURL Naskah: {$submissionUrl}','Email ini dari Editor atau Editor Bagian kepada Penulis memberitahukan bahwa naskah dikirimkan ke reviewer eksternal.'),('EDITOR_DECISION_SEND_TO_PRODUCTION','en_US','Editor Decision','{$authorName}:<br />\n<br />\nThe editing of your submission, &quot;{$submissionTitle},&quot; is complete.  We are now sending it to production.<br />\n<br />\nSubmission URL: {$submissionUrl}','This email from the Editor or Section Editor to an Author notifies them that their submission is being sent to production.'),('EDITOR_DECISION_SEND_TO_PRODUCTION','id_ID','Keputusan Editor','{$authorName}:<br />\n<br />\nProses editing naskah Anda, &quot;{$submissionTitle},&quot; telah selesai.  Kami sekarang mengirimkannya ke produksi.<br />\n<br />\nURL Naskah: {$submissionUrl}','Email ini dari Editor atau Editor Bagian kepada Penulis memberitahukan bahwa naskah dikirim ke produksi.'),('EDITOR_RECOMMENDATION','en_US','Editor Recommendation','{$editors}:<br />\n<br />\nThe recommendation regarding the submission to {$contextName}, &quot;{$submissionTitle}&quot; is: {$recommendation}','This email from the recommending Editor or Section Editor to the decision making Editors or Section Editors notifies them of a final recommendation regarding the submission.'),('EDITOR_RECOMMENDATION','id_ID','Rekomendasi Penyunting','{$editors}:<br />\n<br />\nRekomendasi berkaitan dengan  naskah {$contextName}, &quot;{$submissionTitle}&quot; adalah: {$recommendation}','Email ini berasal dari Editor atau Editor Bagian kepada Editor pengambilan keputusan atau Editor Bagian memberi tahu mereka tentang rekomendasi akhir mengenai naskah tersebut.'),('EMAIL_LINK','en_US','Article of Possible Interest','Thought you might be interested in seeing &quot;{$submissionTitle}&quot; by {$authorName} published in Vol {$volume}, No {$number} ({$year}) of {$contextName} at &quot;{$articleUrl}&quot;.','This email template provides a registered reader with the opportunity to send information about an article to somebody who may be interested. It is available via the Reading Tools and must be enabled by the Journal Manager in the Reading Tools Administration page.'),('EMAIL_LINK','id_ID','Artikel Menarik','Anda mungkin tertarik dengan &quot;{$submissionTitle}&quot; oleh {$authorName} diterbitkan di Vol {$volume}, No {$number} ({$year}) {$contextName} yang tersedia di &quot;{$articleUrl}&quot;.','Template email ini memungkinkan pembaca terdaftar mengirimkan informasi tentang suatu artikel kepada seseorang yang mungkin akan tertarik. Email ini tersedia di Alat Baca dan harus diaktifkan oleh Manajer Jurnal di halaman Administrasi Alat Baca.'),('LAYOUT_COMPLETE','en_US','Galleys Complete','{$editorialContactName}:<br />\n<br />\nGalleys have now been prepared for the manuscript, &quot;{$submissionTitle},&quot; for {$contextName} and are ready for proofreading.<br />\n<br />\nIf you have any questions, please contact me.<br />\n<br />\n{$participantName}','This email from the Layout Editor to the Section Editor notifies them that the layout process has been completed.'),('LAYOUT_COMPLETE','id_ID','Galley Selesai','{$editorialContactName}:<br />\n<br />\nGalley telah dipersiapkan bagi naskah, &quot;{$submissionTitle},&quot; di {$contextName} dan siap untuk proofreading.<br />\n<br />\nJika ada pertanyaan, silakan hubungi kami.<br />\n<br />\n{$participantName}','Email from the Layout Editor kepada Editor Bagian memberitahukan bahwa proses layout telah selesai.'),('LAYOUT_REQUEST','en_US','Request Galleys','{$participantName}:<br />\n<br />\nThe submission &quot;{$submissionTitle}&quot; to {$contextName} now needs galleys laid out by following these steps.<br />\n1. Click on the Submission URL below.<br />\n2. Log into the journal and use the Production Ready files to create the galleys according to the journal\'s standards.<br />\n3. Upload the galleys to the Galley Files section.<br />\n4. Notify the Editor using Production Discussions that the galleys are uploaded and ready.<br />\n<br />\n{$contextName} URL: {$contextUrl}<br />\nSubmission URL: {$submissionUrl}<br />\nUsername: {$participantUsername}<br />\n<br />\nIf you are unable to undertake this work at this time or have any questions, please contact me. Thank you for your contribution to this journal.','This email from the Section Editor to the Layout Editor notifies them that they have been assigned the task of performing layout editing on a submission. It provides information about the submission and how to access it.'),('LAYOUT_REQUEST','id_ID','Permohonan Galley','{$participantName}:<br />\n<br />\nNaskah &quot;{$submissionTitle}&quot; di {$contextName} memerlukan pembuatan galley dengan mengikuti langkah-langkah berikut.<br />\n1. Klik URL Naskah di bawah.<br />\n2. Login ke jurnal dan gunakan file Siap Produksi untuk membuat galley sesuai standar jurnal.<br />\n3. Unggah galley ke bagian File Galley.<br />\n4. Beritahu Editor menggunakan Diskusi Produksi bahwa galley telah diunggah dan siap digunakan.<br />\n<br />\n{$contextName} URL: {$contextUrl}<br />\nURL Naskah: {$submissionUrl}<br />\nNama pengguna: {$participantUsername}<br />\n<br />\nJika Anda tidak dapat melakukan tugas ini saat ini atau mempunyai pertanyaan, silakan hubungi kami.  Terimakasih atas kontribusi Anda ke jurnal ini.','Email dari Editor Bagian kepada Layout Editor memberitahukan bahwa mereka telah ditugaskan untuk melakukan layout editing terhadap suatu naskah.  Email ini memuat informasi terkait penyerahan naskah dan bagaimana mengaksesnya.'),('LOCKSS_EXISTING_ARCHIVE','en_US','Archiving Request for {$contextName}','Dear [University Librarian]<br />\n<br />\n{$contextName} &amp;lt;{$contextUrl}&amp;gt;, is a journal for which a member of your faculty, [name of member], serves as a [title of position]. The journal is seeking to establish a LOCKSS (Lots of Copies Keep Stuff Safe) compliant archive with this and other university libraries.<br />\n<br />\n[Brief description of journal]<br />\n<br />\nThe URL to the LOCKSS Publisher Manifest for our journal is: {$contextUrl}/gateway/lockss<br />\n<br />\nWe understand that you are already participating in LOCKSS. If we can provide any additional metadata for purposes of registering our journal with your version of LOCKSS, we would be happy to provide it.<br />\n<br />\nThank you,<br />\n{$principalContactSignature}','This email requests the keeper of a LOCKSS archive to consider including this journal in their archive. It provides the URL to the journal\'s LOCKSS Publisher Manifest.'),('LOCKSS_EXISTING_ARCHIVE','id_ID','Permohonan Pengarsipan untuk {$contextName}','Yang terhormat [Pustakawan Universitas]<br />\n<br />\n{$contextName} &amp;lt;{$contextUrl}&amp;gt;, merupakan jurnal yang salah satu anggota fakultas Anda, [name of member], menjadi [title of position]. Jurnal ini hendak membuat arsip sesuai LOCKSS (Lots of Copies Keep Stuff Safe) di perpustakaan Anda dan perpustakaan universitas lainnya.<br />\n<br />\n[Deskripsi singkat jurnal]<br />\n<br />\nURL Publisher Manifest LOCKSS jurnal kami adalah: {$contextUrl}/gateway/lockss<br />\n<br />\nKami memahami bahwa Anda telah bergabung dengan LOCKSS. Jika kami perlu memberikan metadata tambahan untuk mendaftarkan jurnal kami di versi LOCKSS Anda, dengan senang hati kami akan memberikannya.<br />\n<br />\nTerimakasih,<br />\n{$principalContactSignature}','Email ini meminta penjaga arsip LOCKSS untuk mempertimbangkan memasukkan jurnal ini ke dalam arsip mereka. Email ini memberikan URL Publisher Manifest LOCKSS jurnal.'),('LOCKSS_NEW_ARCHIVE','en_US','Archiving Request for {$contextName}','Dear [University Librarian]<br />\n<br />\n{$contextName} &amp;lt;{$contextUrl}&amp;gt;, is a journal for which a member of your faculty, [name of member] serves as a [title of position]. The journal is seeking to establish a LOCKSS (Lots of Copies Keep Stuff Safe) compliant archive with this and other university libraries.<br />\n<br />\n[Brief description of journal]<br />\n<br />\nThe LOCKSS Program &amp;lt;http://lockss.org/&amp;gt;, an international library/publisher initiative, is a working example of a distributed preservation and archiving repository, additional details are below. The software, which runs on an ordinary personal computer is free; the system is easily brought on-line; very little ongoing maintenance is required.<br />\n<br />\nTo assist in the archiving of our journal, we invite you to become a member of the LOCKSS community, to help collect and preserve titles produced by your faculty and by other scholars worldwide. To do so, please have someone on your staff visit the LOCKSS site for information on how this system operates. I look forward to hearing from you on the feasibility of providing this archiving support for this journal.<br />\n<br />\nThank you,<br />\n{$principalContactSignature}','This email encourages the recipient to participate in the LOCKSS initiative and include this journal in the archive. It provides information about the LOCKSS initiative and ways to become involved.'),('LOCKSS_NEW_ARCHIVE','id_ID','Permohonan Pengarsipan untuk {$contextName}','Yang terhormat [University Librarian]<br />\n<br />\n{$contextName} &amp;lt;{$contextUrl}&amp;gt;, merupakan jurnal yang salah satu anggota fakultas Anda, [name of member], menjadi [title of position]. Jurnal ini hendak membuat arsip sesuai LOCKSS (Lots of Copies Keep Stuff Safe) di perpustakaan Anda dan perpustakaan universitas lainnya.<br />\n<br />\n[Deskripsi singkat jurnal]<br />\n<br />\nProgram LOCKSS &amp;lt;http://lockss.org/&amp;gt;, suatu gerakan perpustakaan/penerbit internasional, merupakan contoh nyata penyimpanan dan pengarsipan terdistribusi, detail tambahan dapat dilihat di bawah. Piranti lunak ini, yang berjalan di komputer biasa, merupakan piranti lunak yang gratis; sistemnya mudah di-online-kan; tidak membutuhkan banyak perawatan.<br />\n<br />\nUntuk membantu mengarsipkan jurnal kami, kami mengundang Anda untuk menjadi anggota komunitas LOCKSS, guna membantu mengumpulkan dan menyimpan judul-judul karya anggota fakultas Anda dan ilmuwan lainnya di seluruh dunia. Jika berkenan, silakan mengunjungi website LOCKSS untuk informasi mengenai bagaimana cara kerja sistem ini. Kami berharap Anda berkenan mendukung pengarsipan jurnal ini.<br />\n<br />\nTerimakasih,<br />\n{$principalContactSignature}','Email ini mendorong penerima untuk berpartisipasi di gerakan LOCKSS dan memasukkan jurnal ini dalam arsip. Email ini memberikan informasi tentang gerakan LOCKSS dan cara untuk bergabung.'),('MANUAL_PAYMENT_NOTIFICATION','en_US','Manual Payment Notification','A manual payment needs to be processed for the journal {$contextName} and the user {$userFullName} (username &quot;{$userName}&quot;).<br />\n<br />\nThe item being paid for is &quot;{$itemName}&quot;.<br />\nThe cost is {$itemCost} ({$itemCurrencyCode}).<br />\n<br />\nThis email was generated by Open Journal Systems\' Manual Payment plugin.','This email template is used to notify a journal manager contact that a manual payment was requested.'),('MANUAL_PAYMENT_NOTIFICATION','id_ID','Pemberitahuan Pembayaran Manual','Pembayaran manual harus diproses untuk jurnal {$contextName} dan pengguna {$userFullName} (username &quot;{$userName}&quot;).<br />\n<br />\nItem yang akan dibayar adalah &quot;{$itemName}&quot;.<br />\nBiayanya {$itemCost} ({$itemCurrencyCode}).<br />\n<br />\nSurat elektronik ini dibuat oleh plugin Pembayaran Manual OJS.','Email ini digunakan untuk memberitahukan kontak manajer jurnal bahwa pembayaran manual dibutuhkan.'),('NOTIFICATION','en_US','New notification from {$siteTitle}','You have a new notification from {$siteTitle}:<br />\n<br />\n{$notificationContents}<br />\n<br />\nLink: {$url}<br />\n<br />\n{$principalContactSignature}','The email is sent to registered users that have selected to have this type of notification emailed to them.'),('NOTIFICATION','id_ID','Notifikasi baru dari {$siteTitle}','Anda memperoleh satu notifikasi baru dari {$siteTitle}:<br />\n<br />\n{$notificationContents}<br />\n<br />\nTautan: {$url}<br />\n<br />\n{$principalContactSignature}','Email ini dikirimkan ke pengguna terdaftar yang memilih untuk memperoleh jenis notifikasi ini dikirimkan melalui email.'),('NOTIFICATION_CENTER_DEFAULT','en_US','A message regarding {$contextName}','Please enter your message.','The default (blank) message used in the Notification Center Message Listbuilder.'),('NOTIFICATION_CENTER_DEFAULT','id_ID','Pesan terkait {$contextName}','Silakan tuliskan pesan Anda.','Pesan default (kosong) yang digunakan di Pengelola Pesan Pusat Notifikasi.'),('OPEN_ACCESS_NOTIFY','en_US','Issue Now Open Access','Readers:<br />\n<br />\n{$contextName} has just made available in an open access format the following issue. We invite you to review the Table of Contents here and then visit our web site ({$contextUrl}) to review articles and items of interest.<br />\n<br />\nThanks for the continuing interest in our work,<br />\n{$editorialContactSignature}','This email is sent to registered readers who have requested to receive a notification email when an issue becomes open access.'),('OPEN_ACCESS_NOTIFY','id_ID','Terbitan Sudah Open Access','Readers:<br />\n<br />\n{$contextName} telah menjadikan terbitan berikut Open Access. Kami mengundang Anda untuk menelaah Daftar Isi berikut dan mengunjungi website kami ({$contextUrl}) untuk membaca artikel dan item yang Anda minati.<br />\n<br />\nTerimakasih atas perhatiannya,<br />\n{$editorialContactSignature}','Email ini dikirimkan ke pembaca terdaftar yang meminta untuk dikirimkan email pemberitahuan saat suatu terbitan menjadi Open Access.'),('ORCID_COLLECT_AUTHOR_ID','en_US','Submission ORCID','Dear {$authorName},<br/>\n<br/>\nYou have been listed as an author on a manuscript submission to {$contextName}.<br/>\nTo confirm your authorship, please add your ORCID id to this submission by visiting the link provided below.<br/>\n<br/>\n<a href=\"{$authorOrcidUrl}\"><img id=\"orcid-id-logo\" src=\"https://orcid.org/sites/default/files/images/orcid_16x16.png\" width=\'16\' height=\'16\' alt=\"ORCID iD icon\" style=\"display: block; margin: 0 .5em 0 0; padding: 0; float: left;\"/>Register or connect your ORCID iD</a><br/>\n<br/>\n<br>\n<a href=\"{$orcidAboutUrl}\">More information about ORCID at {$contextName}</a><br/>\n<br/>\nIf you have any questions, please contact me.<br/>\n<br/>\n{$principalContactSignature}<br/>\n','This email template is used to collect the ORCID id\'s from authors.'),('ORCID_COLLECT_AUTHOR_ID','id_ID','ORCID Naskah','Yang Kami Hormati {$authorName},<br/>\n<br/>\nAnda telah terdaftar sebagai penulis naskah{$contextName}.<br/>\nUntuk mengonfirmasi kepenulisan tersebut, tambahkanlah id ORCID Anda pada naskah tersebut dengan membuka tautan berikut ini.<br/>\n<br/>\n<a href=\"{$authorOrcidUrl}\"><img id=\"orcid-id-logo\" src=\"https://orcid.org/sites/default/files/images/orcid_16x16.png\" width=\'16\' height=\'16\' alt=\"ORCID iD icon\" style=\"display: block; margin: 0 .5em 0 0; padding: 0; float: left;\"/>Register atau hubungkan iD ORCID Anda</a><br/>\n<br/>\n<br>\n<a href=\"{$orcidAboutUrl}\">Informasi selengkapnya tentang ORCID pada {$contextName}</a><br/>\n<br/>\nBila ada pertanyaan, silakan hubungi kami.<br/>\n<br/>\n{$principalContactSignature}<br/>\n','Template surel ini digunakan untuk mengumpulkan id ORCID penulis.'),('ORCID_REQUEST_AUTHOR_AUTHORIZATION','en_US','Requesting ORCID record access','Dear {$authorName},<br>\n<br>\nYou have been listed as an author on the manuscript submission \"{$submissionTitle}\" to {$contextName}.\n<br>\n<br>\nPlease allow us to add your ORCID id to this submission and also to add the submission to your ORCID profile on publication.<br>\nVisit the link to the official ORCID website, login with your profile and authorize the access by following the instructions.<br>\n<a href=\"{$authorOrcidUrl}\"><img id=\"orcid-id-logo\" src=\"https://orcid.org/sites/default/files/images/orcid_16x16.png\" width=\'16\' height=\'16\' alt=\"ORCID iD icon\" style=\"display: block; margin: 0 .5em 0 0; padding: 0; float: left;\"/>Register or Connect your ORCID iD</a><br/>\n<br>\n<br>\n<a href=\"{$orcidAboutUrl}\">More about ORCID at {$contextName}</a><br/>\n<br>\nIf you have any questions, please contact me.<br>\n<br>\n{$principalContactSignature}<br>\n','This email template is used to request ORCID record access from authors.'),('ORCID_REQUEST_AUTHOR_AUTHORIZATION','id_ID','Meminta akses rekaman ORCID','Yang Kami Hormati {$authorName},<br>\n<br>\nAnda telah terdaftar sebagai penulis naskah \"{$submissionTitle}\" pada {$contextName}.\n<br>\n<br>\nIjinkanlah kami menambahkan id ORCID Anda pada naskah ini serta menambahkan naskah pada profil ORCID Anda pada terbitan.<br>\nBuka tautan web ORCID, login dan beri akses sesuai petunjuk berikut.<br>\n<a href=\"{$authorOrcidUrl}\"><img id=\"orcid-id-logo\" src=\"https://orcid.org/sites/default/files/images/orcid_16x16.png\" width=\'16\' height=\'16\' alt=\"ORCID iD icon\" style=\"display: block; margin: 0 .5em 0 0; padding: 0; float: left;\"/>Register atau hubungkan iD ORCID Anda</a><br/>\n<br>\n<br>\n<a href=\"{$orcidAboutUrl}\">nformasi selengkapnya tentang ORCID pada {$contextName}</a><br/>\n<br>\nBila ada pertanyaan, silakan hubungi kami.<br>\n<br>\n{$principalContactSignature}<br/>\n','Template surel ini digunakan untuk meminta akses rekaman ORCID penulis.'),('PASSWORD_RESET_CONFIRM','en_US','Password Reset Confirmation','We have received a request to reset your password for the {$siteTitle} web site.<br />\n<br />\nIf you did not make this request, please ignore this email and your password will not be changed. If you wish to reset your password, click on the below URL.<br />\n<br />\nReset my password: {$url}<br />\n<br />\n{$principalContactSignature}','This email is sent to a registered user when they indicate that they have forgotten their password or are unable to login. It provides a URL they can follow to reset their password.'),('PASSWORD_RESET_CONFIRM','id_ID','Konfirmasi Reset Sandi','Kami menerima permintaan reset sandi untuk akun Anda di website {$siteTitle}.<br />\n<br />\nJika Anda tidak merasa mengajukan permintaan ini, abaikan pesan ini dan sandi Anda tidak akan diubah.  Jika Anda memang ingin melakukan reset sandi, klik tautan berikut ini.<br />\n<br />\nReset sandi saya: {$url}<br />\n<br />\n{$principalContactSignature}','Email ini dikirimkan ke pengguna terdaftar ketika lupa sandi atau tidak dapat login. Email ini memberikan URL untuk melakukan reset sandi.'),('PAYPAL_INVESTIGATE_PAYMENT','en_US','Unusual PayPal Activity','Open Journal Systems has encountered unusual activity relating to PayPal payment support for the journal {$contextName}. This activity may need further investigation or manual intervention.<br />\n                       <br />\nThis email was generated by Open Journal Systems\' PayPal plugin.<br />\n<br />\nFull post information for the request:<br />\n{$postInfo}<br />\n<br />\nAdditional information (if supplied):<br />\n{$additionalInfo}<br />\n<br />\nServer vars:<br />\n{$serverVars}<br />\n','This email template is used to notify a journal\'s primary contact that suspicious activity or activity requiring manual intervention was encountered by the PayPal plugin.'),('PAYPAL_INVESTIGATE_PAYMENT','id_ID','Kegiatan pembayaran paypal yang tidak biasa','Open Journal System telah menemukan kegiatan yang tidak biasa yang terkait dengan bantuan pembayaran paypal untuk jurnal {$contextName}. Kegiatan ini mungkin memerlukan investigasi lebih lanjut atau intervensi manual.<br />\n                       <br />\nSurel ini dibuat oleh plugin PayPal pada OJS.<br />\n<br />\nInformasi posting penuh untuk permohonan:<br />\n{$postInfo}<br />\n<br />\nInformasi tambahan (jika tersedia):<br />\n{$additionalInfo}<br />\n<br />\nServer vars:<br />\n{$serverVars}<br />\n','Email ini digunakan untuk memberitahukan narahubung utama jurnal bahwa plugin PayPal menemukan kegiatan mencurigakan atau kegiatan yang membutuhkan intervensi manual.'),('PUBLISH_NOTIFY','en_US','New Issue Published','Readers:<br />\n<br />\n{$contextName} has just published its latest issue at {$contextUrl}. We invite you to review the Table of Contents here and then visit our web site to review articles and items of interest.<br />\n<br />\nThanks for the continuing interest in our work,<br />\n{$editorialContactSignature}','This email is sent to registered readers via the \"Notify Users\" link in the Editor\'s User Home. It notifies readers of a new issue and invites them to visit the journal at a supplied URL.'),('PUBLISH_NOTIFY','id_ID','Terbitan Baru','Readers:<br />\n<br />\n{$contextName} baru saja menerbitkan terbitan terbarunya di {$contextUrl}. Kami mengundang Anda untuk membaca Daftar Isi dan selanjutnya mengunjungi website kami untuk membaca artikel yang Anda minati.<br />\n<br />\nTerimakasih atas perhatian Anda,<br />\n{$editorialContactSignature}','Email ini dikirimkan ke pembaca terdaftar melalui tautan \"Beritahu Pengguna\" di Beranda Pengguna Editor. Email ini memberitahu pembaca tentang terbitan baru dan mengundang pembaca untuk mengunjungi jurnal melalui URL yang diberikan.'),('REVIEWER_REGISTER','en_US','Registration as Reviewer with {$contextName}','In light of your expertise, we have taken the liberty of registering your name in the reviewer database for {$contextName}. This does not entail any form of commitment on your part, but simply enables us to approach you with a submission to possibly review. On being invited to review, you will have an opportunity to see the title and abstract of the paper in question, and you\'ll always be in a position to accept or decline the invitation. You can also ask at any point to have your name removed from this reviewer list.<br />\n<br />\nWe are providing you with a username and password, which is used in all interactions with the journal through its website. You may wish, for example, to update your profile, including your reviewing interests.<br />\n<br />\nUsername: {$username}<br />\nPassword: {$password}<br />\n<br />\nThank you,<br />\n{$principalContactSignature}','This email is sent to a newly registered reviewer to welcome them to the system and provide them with a record of their username and password.'),('REVIEWER_REGISTER','id_ID','Registrasi sebagai Reviewer di {$contextName}','Dengan mempertimbangkan keahlian Anda, kami memasukkan nama Anda dalam database reviewer di {$contextName}. Hal ini tidak bersifat mengikat, hanya sekedar memudahkan kami untuk mengundang Anda untuk melakukan review terhadap suatu naskah. Ketika memperoleh undangan untuk melakukan review suatu naskah, Anda dapat melihat judul dan abstrak naskah tersebut, dan Anda berhak menentukan apakah akan menerima atau menolak undangan tersebut. Anda juga dapat meminta dihapus dari daftar reviewer kapan saja Anda menghendaki.<br />\n<br />\nKami menyertakan nama pengguna dan sandi Anda, yang digunakan dalam semua interaksi dengan jurnal melalui website. Anda dapat melakukan update profil, termasuk minat review Anda.<br />\n<br />\nNama pengguna: {$username}<br />\nSandi: {$password}<br />\n<br />\nTerimakasih,<br />\n{$principalContactSignature}','Email ini dikirimkan ke reviewer baru untuk menyambut dan memberikan informasi nama pengguna dan sandi.'),('REVIEW_ACK','en_US','Article Review Acknowledgement','{$reviewerName}:<br />\n<br />\nThank you for completing the review of the submission, &quot;{$submissionTitle},&quot; for {$contextName}. We appreciate your contribution to the quality of the work that we publish.','This email is sent by a Section Editor to confirm receipt of a completed review and thank the reviewer for their contributions.'),('REVIEW_ACK','id_ID','Ucapan Terimakasih atas Review Artikel','{$reviewerName}:<br />\n<br />\nTerimakasih telah menyelesaikan review terhadap naskah, &quot;{$submissionTitle},&quot; untuk {$contextName}. Kami sangat menghargai kontribusi Anda terhadap kualitas karya yang kami publikasikan.','Email ini dikirimkan Editor Bagian untuk mengkonfirmasi penerimaan review dan mengucapkan terimakasih atas kontribusinya.'),('REVIEW_CANCEL','en_US','Request for Review Cancelled','{$reviewerName}:<br />\n<br />\nWe have decided at this point to cancel our request for you to review the submission, &quot;{$submissionTitle},&quot; for {$contextName}. We apologize for any inconvenience this may cause you and hope that we will be able to call on you to assist with this journal\'s review process in the future.<br />\n<br />\nIf you have any questions, please contact me.','This email is sent by the Section Editor to a Reviewer who has a submission review in progress to notify them that the review has been cancelled.'),('REVIEW_CANCEL','id_ID','Permohonan Review Dibatalkan','{$reviewerName}:<br />\n<br />\nKami memutuskan untuk membatalkan permohonan review kami kepada Anda untuk naskah, &quot;{$submissionTitle},&quot; di {$contextName}. Kami mohon maaf sebesar-besarnya untuk ketidaknyamanan ini dan kami harap di masa mendatang Anda dapat membantu proses review di jurnal ini.<br />\n<br />\nJika ada pertanyaan, silakan hubungi kami.','Email ini dikirimkan Editor Bagian kepada Reviewer yang sedang melakukan review untuk memberitahukan pembatalan review.'),('REVIEW_CONFIRM','en_US','Able to Review','Editors:<br />\n<br />\nI am able and willing to review the submission, &quot;{$submissionTitle},&quot; for {$contextName}. Thank you for thinking of me, and I plan to have the review completed by its due date, {$reviewDueDate}, if not before.<br />\n<br />\n{$reviewerName}','This email is sent by a Reviewer to the Section Editor in response to a review request to notify the Section Editor that the review request has been accepted and will be completed by the specified date.'),('REVIEW_CONFIRM','id_ID','Dapat Melakukan Review','Editor:<br />\n<br />\nSaya dapat dan bersedia melakukan review terhadap naskah, &quot;{$submissionTitle},&quot; untuk {$contextName}. Terimakasih telah mempercayakan kepada saya, dan saya berencana untuk menyelesaikan review ini sesuai tenggat, {$reviewDueDate}, atau sebelumnya.<br />\n<br />\n{$reviewerName}','Email ini dikirimkan Reviewer kepada Editor Bagian sebagai respon terhadap permohonan review untuk memberitahu Editor Bagian bahwa permohonan review diterima dan akan diselesaikan pada tanggal yang ditetapkan.'),('REVIEW_DECLINE','en_US','Unable to Review','Editors:<br />\n<br />\nI am afraid that at this time I am unable to review the submission, &quot;{$submissionTitle},&quot; for {$contextName}. Thank you for thinking of me, and another time feel free to call on me.<br />\n<br />\n{$reviewerName}','This email is sent by a Reviewer to the Section Editor in response to a review request to notify the Section Editor that the review request has been declined.'),('REVIEW_DECLINE','id_ID','Tidak Dapat Melakukan Review','Editor:<br />\n<br />\nMohon maaf saat ini saya tidak dapat melakukan review terhadap naskah, &quot;{$submissionTitle},&quot; untuk {$contextName}. Terimakasih telah mempercayakann kepada saya, dan lain waktu silakan menghubungi saya lagi.<br />\n<br />\n{$reviewerName}','Email ini dikirimkan Reviewer kepada Editor Bagian sebagai respon terhadap permohonan review untuk memberitahu Editor Bagian bahwa permohonan review ditolak.'),('REVIEW_REINSTATE','en_US','Request for Review Reinstated','{$reviewerName}:<br />\n<br />\nWe would like to reinstate our request for you to review the submission, &quot;{$submissionTitle},&quot; for {$contextName}. We hope that you will be able to assist with this journal\'s review process.<br />\n<br />\nIf you have any questions, please contact me.','This email is sent by the Section Editor to a Reviewer who has a submission review in progress to notify them that a cancelled review has been reinstated.'),('REVIEW_REINSTATE','id_ID','Meminta Pemulihan Review','{$reviewerName}:<br />\n<br />\nKami ingin memulihkan permintaan kami kepada Anda untuk mereview naskah, &quot;{$submissionTitle},&quot; untuk {$contextName}. Kami berharap Anda dapat membantu proses review jurnal kami.<br />\n<br />\nJika ada pertanyaan, silakan hubungi saya.','Email ini dikirim oleh Editor Bagian kepada Mitra Bestari yang sedang mereview naskah untuk memberi tahu bahwa ulasan mereka yang dibatalkan telah dipulihkan.'),('REVIEW_REMIND','en_US','Submission Review Reminder','{$reviewerName}:<br />\n<br />\nJust a gentle reminder of our request for your review of the submission, &quot;{$submissionTitle},&quot; for {$contextName}. We were hoping to have this review by {$reviewDueDate}, and would be pleased to receive it as soon as you are able to prepare it.<br />\n<br />\nIf you do not have your username and password for the journal\'s web site, you can use this link to reset your password (which will then be emailed to you along with your username). {$passwordResetUrl}<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nPlease confirm your ability to complete this vital contribution to the work of the journal. I look forward to hearing from you.<br />\n<br />\n{$editorialContactSignature}','This email is sent by a Section Editor to remind a reviewer that their review is due.'),('REVIEW_REMIND','id_ID','Pengingat Review Naskah','{$reviewerName}:<br />\n<br />\nSekedar mengingatkan tentang permohonan kami untuk melakukan review terhadap naskah, &quot;{$submissionTitle},&quot; untuk {$contextName}. Kami mengharapkan telah menerima review ini pada {$reviewDueDate}, dan akan sangat berbahagia untuk dapat menerimanya segera setelah Anda menyelesaikannya.<br />\n<br />\nJika Anda tidak memiliki nama pengguna dan sandi untuk website jurnal ini, Anda dapat menggunakan tautan berikut untuk mereset sandi Anda (yang selanjutnya akan diemailkan kepada Anda bersama nama pengguna Anda). {$passwordResetUrl}<br />\n<br />\nURL Naskah: {$submissionReviewUrl}<br />\n<br />\nMohon konfirmasi kesanggupan Anda untuk menyelesaikan kontribusi penting ini.  Kami menunggu balasan Anda.<br />\n<br />\n{$editorialContactSignature}','Email ini dikirimkan Editor Bagian untuk mengingatkan reviewer bahwa review telah mencapai tenggat.'),('REVIEW_REMIND_AUTO','en_US','Automated Submission Review Reminder','{$reviewerName}:<br />\n<br />\nJust a gentle reminder of our request for your review of the submission, &quot;{$submissionTitle},&quot; for {$contextName}. We were hoping to have this review by {$reviewDueDate}, and this email has been automatically generated and sent with the passing of that date. We would still be pleased to receive it as soon as you are able to prepare it.<br />\n<br />\nIf you do not have your username and password for the journal\'s web site, you can use this link to reset your password (which will then be emailed to you along with your username). {$passwordResetUrl}<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nPlease confirm your ability to complete this vital contribution to the work of the journal. I look forward to hearing from you.<br />\n<br />\n{$editorialContactSignature}','This email is automatically sent when a reviewer\'s due date elapses (see Review Options under Settings > Workflow > Review) and one-click reviewer access is disabled. Scheduled tasks must be enabled and configured (see the site configuration file).'),('REVIEW_REMIND_AUTO','id_ID','Pengingat Otomatis Review Naskah','{$reviewerName}:<br />\n<br />\nSekedar mengingatkan tentang permohonan kami untuk melakukan review terhadap naskah, &quot;{$submissionTitle},&quot; untuk {$contextName}. Kami mengharapkan telah menerima review ini pada {$reviewDueDate}, dan email ini dikirim secara otomatis seiring terlewatinya tanggal tersebut. Kami masih tetap menanti review tersebut segera setelah Anda dapat menyelesaikannya.<br />\n<br />\nJika Anda tidak memiliki nama pengguna dan sandi untuk website jurnal ini, Anda dapat menggunakan tautan berikut untuk mereset sandi Anda (yang selanjutnya akan diemailkan kepada Anda bersama nama pengguna Anda). {$passwordResetUrl}<br />\n<br />\nURL Naskah: {$submissionReviewUrl}<br />\n<br />\nMohon konfirmasi kesanggupan Anda untuk menyelesaikan kontribusi penting ini.  Kami menunggu balasan Anda.<br />\n<br />\n{$editorialContactSignature}','Email ini dikirimkan otomatis saat tenggat waktu review terlewati (lihat Opsi Review di menu Pengaturan > Alur Kerja > Review) and one-click reviewer access is disabled. Scheduled tasks must be enabled and configured (see the site configuration file).'),('REVIEW_REMIND_AUTO_ONECLICK','en_US','Automated Submission Review Reminder','{$reviewerName}:<br />\n<br />\nJust a gentle reminder of our request for your review of the submission, &quot;{$submissionTitle},&quot; for {$contextName}. We were hoping to have this review by {$reviewDueDate}, and this email has been automatically generated and sent with the passing of that date. We would still be pleased to receive it as soon as you are able to prepare it.<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nPlease confirm your ability to complete this vital contribution to the work of the journal. I look forward to hearing from you.<br />\n<br />\n{$editorialContactSignature}','This email is automatically sent when a reviewer\'s due date elapses (see Review Options under Settings > Workflow > Review) and one-click reviewer access is enabled. Scheduled tasks must be enabled and configured (see the site configuration file).'),('REVIEW_REMIND_AUTO_ONECLICK','id_ID','Pengingat Review Naskah Otomatis','{$reviewerName}:<br />\n<br />\nSekedar mengingatkan tentang permohonan kami untuk melakukan review terhadap naskah, &quot;{$submissionTitle},&quot; untuk {$contextName}. We were hoping to have this review by {$reviewDueDate}, dan email ini dikirim secara otomatis seiring terlewatinya tanggal tersebut. We would still be pleased to receive it as soon as you are able to prepare it.<br />\n<br />\nURL Naskah: {$submissionReviewUrl}<br />\n<br />\nMohon konfirmasi kesanggupan Anda untuk menyelesaikan kontribusi penting ini.  Kami menunggu balasan Anda.<br />\n<br />\n{$editorialContactSignature}','Email ini dikirimkan otomatis saat tenggat waktu review terlewati (lihat Opsi Review di menu Pengaturan > Alur Kerja > Review) dan akses one-click reviewer diaktifkan. Tugas terjadwal harus diaktifkan dan diatur (lihat file konfigurasi website).'),('REVIEW_REMIND_ONECLICK','en_US','Submission Review Reminder','{$reviewerName}:<br />\n<br />\nJust a gentle reminder of our request for your review of the submission, &quot;{$submissionTitle},&quot; for {$contextName}. We were hoping to have this review by {$reviewDueDate}, and would be pleased to receive it as soon as you are able to prepare it.<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nPlease confirm your ability to complete this vital contribution to the work of the journal. I look forward to hearing from you.<br />\n<br />\n{$editorialContactSignature}','This email is sent by a Section Editor to remind a reviewer that their review is due.'),('REVIEW_REMIND_ONECLICK','id_ID','Pengingat Review Naskah','{$reviewerName}:<br />\n<br />\nSekedar mengingatkan tentang permohonan kami untuk melakukan review terhadap naskah, &quot;{$submissionTitle},&quot; untuk {$contextName}. Kami mengharapkan telah menerima review ini pada {$reviewDueDate}, dan akan sangat berbahagia untuk dapat menerimanya segera setelah Anda menyelesaikannya.<br />\n<br />\nURL Naskah: {$submissionReviewUrl}<br />\n<br />\nMohon konfirmasi kesanggupan Anda untuk menyelesaikan kontribusi penting ini.  Kami menunggu balasan Anda.<br />\n<br />\n{$editorialContactSignature}','Email ini dikirimkan Editor Bagian untuk mengingatkan reviewer bahwa review telah mencapai tenggat.'),('REVIEW_REQUEST','en_US','Article Review Request','{$reviewerName}:<br />\n<br />\nI believe that you would serve as an excellent reviewer of the manuscript, &quot;{$submissionTitle},&quot; which has been submitted to {$contextName}. The submission\'s abstract is inserted below, and I hope that you will consider undertaking this important task for us.<br />\n<br />\nPlease log into the journal web site by {$responseDueDate} to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation. The web site is {$contextUrl}<br />\n<br />\nThe review itself is due {$reviewDueDate}.<br />\n<br />\nIf you do not have your username and password for the journal\'s web site, you can use this link to reset your password (which will then be emailed to you along with your username). {$passwordResetUrl}<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nThank you for considering this request.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n{$submissionAbstract}','This email from the Section Editor to a Reviewer requests that the reviewer accept or decline the task of reviewing a submission. It provides information about the submission such as the title and abstract, a review due date, and how to access the submission itself. This message is used when the Standard Review Process is selected in Management > Settings > Workflow > Review. (Otherwise see REVIEW_REQUEST_ATTACHED.)'),('REVIEW_REQUEST','id_ID','Permohonan Review Artikel','{$reviewerName}:<br />\n<br />\nKami memandang bahwa Anda merupakan reviewer yang tepat untuk naskah, &quot;{$submissionTitle},&quot; yang diserahkan ke {$contextName}. Abstrak naskah tersebut disertakan di bawah ini, dan kami berharap Anda berkenan melakukannya.<br />\n<br />\nSilakan login ke website jurnal sebelum {$responseDueDate} untuk memberitahukan apakah Anda bersedia melakukan review atau tidak, juga untuk mengakses naskah dan menyerahkan review beserta rekomendasi Anda. Website jurnal adalah {$contextUrl}<br />\n<br />\nTenggat review ini sendiri adalah {$reviewDueDate}.<br />\n<br />\nJika Anda tidak memiliki nama pengguna dan sandi untuk website jurnal ini, Anda dapat menggunakan tautan berikut untuk mereset sandi Anda (yang selanjutnya akan diemailkan kepada Anda bersama nama pengguna Anda). {$passwordResetUrl}<br />\n<br />\nURL Naskah: {$submissionReviewUrl}<br />\n<br />\nTerimakasih atas perhatiannya.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n{$submissionAbstract}','Email ini dari Editor Bagian kepada Reviewer untuk meminta reviewer memberitahukan apakah menerima atau menolak permohonan review. Email ini memberikan informasi tentang naskah meliputi judul dan abstrak, tenggat review, dan cara mengakses naskah. Pesan ini digunakan saat Proses Review Standar dipilih di Manajemen > Pengaturan > Alur Kerja > Review. (Selain itu lihat di REVIEW_REQUEST_ATTACHED.)'),('REVIEW_REQUEST_ATTACHED','en_US','Article Review Request','{$reviewerName}:<br />\n<br />\nI believe that you would serve as an excellent reviewer of the manuscript, &quot;{$submissionTitle},&quot; and I am asking that you consider undertaking this important task for us. The Review Guidelines for this journal are appended below, and the submission is attached to this email. Your review of the submission, along with your recommendation, should be emailed to me by {$reviewDueDate}.<br />\n<br />\nPlease indicate in a return email by {$responseDueDate} whether you are able and willing to do the review.<br />\n<br />\nThank you for considering this request.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n<br />\nReview Guidelines<br />\n<br />\n{$reviewGuidelines}<br />\n','This email is sent by the Section Editor to a Reviewer to request that they accept or decline the task of reviewing a submission. It includes the submission as an attachment. This message is used when the Email-Attachment Review Process is selected in Management > Settings > Workflow > Review. (Otherwise see REVIEW_REQUEST.)'),('REVIEW_REQUEST_ATTACHED','id_ID','Permohonan Review Artikel','{$reviewerName}:<br />\n<br />\nKami memandang bahwa Anda merupakan reviewer yang tepat untuk naskah, &quot;{$submissionTitle},&quot; dan kami mengharapkan Anda berkenan melakukan review. Panduan Review untuk jurnal ini disertakan di bawah, dan naskah telah dilampirkan bersama email ini. Review beserta rekomendasi Anda, kami harap telah diemailkan sebelum tenggat review {$reviewDueDate}.<br />\n<br />\nMohon sampaikan dalam email balasan sebelum {$responseDueDate} tentang kesediaan Anda untuk melakukan review.<br />\n<br />\nTerimakasih atas perhatiannya.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n<br />\nPanduan Review<br />\n<br />\n{$reviewGuidelines}<br />\n','Email ini dari Editor Bagian kepada Reviewer untuk meminta reviewer memberitahukan apakah menerima atau menolak permohonan review. Email disertai naskah terlampir bersama email. Pesan ini digunakan saat Proses Review Lampiran Email dipilih di Manajemen > Pengaturan > Alur Kerja > Review. (Selain itu lihat REVIEW_REQUEST.)'),('REVIEW_REQUEST_ATTACHED_SUBSEQUENT','en_US','Article Review Request','{$reviewerName}:<br />\n<br />\nThis regards the manuscript &quot;{$submissionTitle},&quot; which is under consideration by {$contextName}.<br />\n<br />\nFollowing the review of the previous version of the manuscript, the authors have now submitted a revised version of their paper. We would appreciate it if you could help evaluate it.<br />\n<br />\nThe Review Guidelines for this journal are appended below, and the submission is attached to this email. Your review of the submission, along with your recommendation, should be emailed to me by {$reviewDueDate}.<br />\n<br />\nPlease indicate in a return email by {$responseDueDate} whether you are able and willing to do the review.<br />\n<br />\nThank you for considering this request.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n<br />\nReview Guidelines<br />\n<br />\n{$reviewGuidelines}<br />\n','This email is sent by the Section Editor to a Reviewer to request that they accept or decline the task of reviewing a submission for a second or greater round of review. It includes the submission as an attachment. This message is used when the Email-Attachment Review Process is selected in Management > Settings > Workflow > Review. (Otherwise see REVIEW_REQUEST_SUBSEQUENT.)'),('REVIEW_REQUEST_ATTACHED_SUBSEQUENT','id_ID','Permohonan Review Artikel','{$reviewerName}:<br />\n<br />\nEmail ini terkait naskah &quot;{$submissionTitle},&quot; yang sedang dalam pertimbangan di {$contextName}.<br />\n<br />\nSetelah review untuk versi naskah sebelumnya, penulis saat ini telah menyerahkan versi revisi naskahnya.  Kami berharap Anda dapat membantu mengevaluasinya.<br />\n<br />\nPanduan Review untuk jurnal ini disertakan di bawah, dan naskah dilampirkan bersama email ini. Review dan rekomendasi Anda, mohon dapat diemailkan ke kami pada {$reviewDueDate}.<br />\n<br />\nMohon sampaikan di email balasan sebelum {$responseDueDate} tentang kesediaan Anda untuk melakukan review.<br />\n<br />\nTerimakasih atas perhatiannya.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n<br />\nPanduan Review<br />\n<br />\n{$reviewGuidelines}<br />\n','Email ini dari Editor Bagian kepada Reviewer untuk meminta reviewer memberitahukan apakah menerima atau menolak permohonan review untuk ronde kedua atau berikutnya.  Email disertai naskah terlampir bersama email. Pesan ini digunakan saat Proses Review Lampiran Email dipilih di Manajemen > Pengaturan > Alur Kerja > Review. (Selain itu lihat REVIEW_REQUEST_SUBSEQUENT.)'),('REVIEW_REQUEST_ONECLICK','en_US','Article Review Request','{$reviewerName}:<br />\n<br />\nI believe that you would serve as an excellent reviewer of the manuscript, &quot;{$submissionTitle},&quot; which has been submitted to {$contextName}. The submission\'s abstract is inserted below, and I hope that you will consider undertaking this important task for us.<br />\n<br />\nPlease log into the journal web site by {$responseDueDate} to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation.<br />\n<br />\nThe review itself is due {$reviewDueDate}.<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nThank you for considering this request.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n{$submissionAbstract}','This email from the Section Editor to a Reviewer requests that the reviewer accept or decline the task of reviewing a submission. It provides information about the submission such as the title and abstract, a review due date, and how to access the submission itself. This message is used when the Standard Review Process is selected in Management > Settings > Workflow > Review, and one-click reviewer access is enabled.'),('REVIEW_REQUEST_ONECLICK','id_ID','Permohonan Review Artikel','{$reviewerName}:<br />\n<br />\nKami memandang bahwa Anda merupakan reviewer yang tepat untuk naskah, &quot;{$submissionTitle},&quot; yang diserahkan ke {$contextName}. Abstrak naskah tersebut disertakan di bawah ini, dan kami berharap Anda berkenan melakukannya.<br />\n<br />\nSilakan login ke website jurnal sebelum {$responseDueDate} untuk memberitahukan apakah Anda bersedia melakukan review atau tidak, juga untuk mengakses naskah dan menyerahkan review beserta rekomendasi Anda. Website jurnal adalah {$contextUrl}<br />\n<br />\nTenggat review ini sendiri adalah {$reviewDueDate}.<br />\n<br />\nURL Naskah: {$submissionReviewUrl}<br />\n<br />\nTerimakasih atas perhatiannya.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n{$submissionAbstract}','Email ini dari Editor Bagian kepada Reviewer  untuk meminta reviewer memberitahukan apakah menerima atau menolak permohonan review. Email ini memberikan informasi tentang naskah meliputi judul dan abstrak, tenggat review, dan cara mengakses naskah. Pesan ini digunakan saat Proses Review Standar dipilih di Manajemen > Pengaturan > Alur Kerja > Review, dan akses one-click reviewer diaktifkan.'),('REVIEW_REQUEST_ONECLICK_SUBSEQUENT','en_US','Article Review Request','{$reviewerName}:<br />\n<br />\nThis regards the manuscript &quot;{$submissionTitle},&quot; which is under consideration by {$contextName}.<br />\n<br />\nFollowing the review of the previous version of the manuscript, the authors have now submitted a revised version of their paper. We would appreciate it if you could help evaluate it.<br />\n<br />\nPlease log into the journal web site by {$responseDueDate} to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation.<br />\n<br />\nThe review itself is due {$reviewDueDate}.<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nThank you for considering this request.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n{$submissionAbstract}','This email from the Section Editor to a Reviewer requests that the reviewer accept or decline the task of reviewing a submission for a second or greater round of review. It provides information about the submission such as the title and abstract, a review due date, and how to access the submission itself. This message is used when the Standard Review Process is selected in Management > Settings > Workflow > Review, and one-click reviewer access is enabled.'),('REVIEW_REQUEST_ONECLICK_SUBSEQUENT','id_ID','Permohonan Review Artikel','{$reviewerName}:<br />\n<br />\nEmail ini terkait naskah &quot;{$submissionTitle},&quot; yang sedang dalam pertimbangan di {$contextName}.<br />\n<br />\nSetelah review untuk versi naskah sebelumnya, penulis saat ini telah menyerahkan versi revisi naskahnya.  Kami berharap Anda dapat membantu mengevaluasinya.<br />\n<br />\nSilakan login ke website jurnal sebelum {$responseDueDate} untuk memberitahukan apakah Anda bersedia melakukan review atau tidak, juga untuk mengakses naskah dan menyerahkan review beserta rekomendasi Anda.<br />\n<br />\nTenggat review ini sendiri adalah {$reviewDueDate}.<br />\n<br />\nURL Naskah: {$submissionReviewUrl}<br />\n<br />\nTerimakasih atas perhatiannya.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n{$submissionAbstract}','Email ini dari Editor Bagian kepada Reviewer untuk meminta reviewer memberitahukan apakah menerima atau menolak permohonan review untuk ronde kedua atau berikutnya. Email ini memberikan informasi tentang naskah meliputi judul dan abstrak, tenggat review, dan cara mengakses naskah. Pesan ini digunakan saat Proses Review Standar dipilih di Manajemen > Pengaturan > Alur Kerja > Review, dan akses one-click reviewer diaktifkan.'),('REVIEW_REQUEST_REMIND_AUTO','en_US','Article Review Request Reminder','{$reviewerName}:<br />\nJust a gentle reminder of our request for your review of the submission, &quot;{$submissionTitle},&quot; for {$contextName}. We were hoping to have your response by {$responseDueDate}, and this email has been automatically generated and sent with the passing of that date.\n<br />\nI believe that you would serve as an excellent reviewer of the manuscript. The submission\'s abstract is inserted below, and I hope that you will consider undertaking this important task for us.<br />\n<br />\nPlease log into the journal web site to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation. The web site is {$contextUrl}<br />\n<br />\nThe review itself is due {$reviewDueDate}.<br />\n<br />\nIf you do not have your username and password for the journal\'s web site, you can use this link to reset your password (which will then be emailed to you along with your username). {$passwordResetUrl}<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nThank you for considering this request.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n{$submissionAbstract}','This email is automatically sent when a reviewer\'s confirmation due date elapses (see Review Options under Settings > Workflow > Review) and one-click reviewer access is disabled. Scheduled tasks must be enabled and configured (see the site configuration file).'),('REVIEW_REQUEST_REMIND_AUTO','id_ID','Pengingat Permintaan Review Artikel','{$reviewerName}:<br />\nSekedar mengingatkan tentang permohonan kami untuk melakukan review terhadap naskah, &quot;{$submissionTitle},&quot; untuk {$contextName}. Kami berharap telah menerima respon Anda pada {$responseDueDate}, dan email ini dikirim secara otomatis seiring terlewatinya tanggal tersebut.\n<br />\nKami memandang bahwa Anda merupakan reviewer yang tepat untuk naskah tersebut. Abstrak naskah tersebut disertakan di bawah ini, dan kami berharap Anda berkenan melakukannya.<br />\n<br />\nSilakan login ke website jurnal untuk memberitahukan apakah Anda bersedia melakukan review atau tidak, juga untuk mengakses naskah dan menyerahkan review beserta rekomendasi Anda. Website jurnal adalah {$contextUrl}<br />\n<br />\nTenggat review ini sendiri adalah {$reviewDueDate}.<br />\n<br />\nJika Anda tidak memiliki nama pengguna dan sandi untuk website jurnal ini, Anda dapat menggunakan tautan berikut untuk mereset sandi Anda (yang selanjutnya akan diemailkan kepada Anda bersama nama pengguna Anda). {$passwordResetUrl}<br />\n<br />\nURL Naskah: {$submissionReviewUrl}<br />\n<br />\nTerimakasih atas perhatiannya.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n{$submissionAbstract}','Email ini dikirim otomatis saat tenggat konfirmasi terlewati (lihat Opsi Review di menu Pengaturan > Alur Kerja > Review) dan akses one-click reviewer dinonaktifkan. Scheduled tasks must be enabled and configured (see the site configuration file).'),('REVIEW_REQUEST_REMIND_AUTO_ONECLICK','en_US','Article Review Request','{$reviewerName}:<br />\nJust a gentle reminder of our request for your review of the submission, &quot;{$submissionTitle},&quot; for {$contextName}. We were hoping to have your response by {$responseDueDate}, and this email has been automatically generated and sent with the passing of that date.\n<br />\nI believe that you would serve as an excellent reviewer of the manuscript. The submission\'s abstract is inserted below, and I hope that you will consider undertaking this important task for us.<br />\n<br />\nPlease log into the journal web site to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation.<br />\n<br />\nThe review itself is due {$reviewDueDate}.<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nThank you for considering this request.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n{$submissionAbstract}','This email is automatically sent when a reviewer\'s confirmation due date elapses (see Review Options under Settings > Workflow > Review) and one-click reviewer access is enabled. Scheduled tasks must be enabled and configured (see the site configuration file).'),('REVIEW_REQUEST_REMIND_AUTO_ONECLICK','id_ID','Permohonan Review Artikel','{$reviewerName}:<br />\nSekedar mengingatkan tentang permohonan kami untuk melakukan review terhadap naskah, &quot;{$submissionTitle},&quot; untuk {$contextName}. Kami berharap telah menerima respon Anda pada {$responseDueDate}, dan email ini dikirim secara otomatis seiring terlewatinya tanggal tersebut.\n<br />\nKami memandang bahwa Anda merupakan reviewer yang tepat untuk naskah tersebut. Abstrak naskah tersebut disertakan di bawah ini, dan kami berharap Anda berkenan melakukannya.<br />\n<br />\nSilakan login ke website jurnal untuk memberitahukan apakah Anda bersedia melakukan review atau tidak, juga untuk mengakses naskah dan menyerahkan review beserta rekomendasi Anda. Website jurnal adalah {$contextUrl}<br />\n<br />\nTenggat review ini sendiri adalah {$reviewDueDate}.<br />\n<br />\nURL Naskah: {$submissionReviewUrl}<br />\n<br />\nTerimakasih atas perhatiannya.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n{$submissionAbstract}','Email ini dikirim otomatis saat tenggat konfirmasi reviewer terlewati (lihat Opsi Review di menu Pengaturan > Alur Kerja > Review) dan akses one-click reviewer diaktifkan. Tugas Terjadwal harus diaktifkan dan diatur (lihat file konfigurasi website).'),('REVIEW_REQUEST_SUBSEQUENT','en_US','Article Review Request','{$reviewerName}:<br />\n<br />\nThis regards the manuscript &quot;{$submissionTitle},&quot; which is under consideration by {$contextName}.<br />\n<br />\nFollowing the review of the previous version of the manuscript, the authors have now submitted a revised version of their paper. We would appreciate it if you could help evaluate it.<br />\n<br />\nPlease log into the journal web site by {$responseDueDate} to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation. The web site is {$contextUrl}<br />\n<br />\nThe review itself is due {$reviewDueDate}.<br />\n<br />\nIf you do not have your username and password for the journal\'s web site, you can use this link to reset your password (which will then be emailed to you along with your username). {$passwordResetUrl}<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nThank you for considering this request.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n{$submissionAbstract}','This email from the Section Editor to a Reviewer requests that the reviewer accept or decline the task of reviewing a submission for a second or greater round of review. It provides information about the submission such as the title and abstract, a review due date, and how to access the submission itself. This message is used when the Standard Review Process is selected in Management > Settings > Workflow > Review. (Otherwise see REVIEW_REQUEST_ATTACHED_SUBSEQUENT.)'),('REVIEW_REQUEST_SUBSEQUENT','id_ID','Permohonan Review Artikel','{$reviewerName}:<br />\n<br />\nEmail ini terkait naskah &quot;{$submissionTitle},&quot; yang sedang dalam pertimbangan di {$contextName}.<br />\n<br />\nSetelah review untuk versi naskah sebelumnya, penulis saat ini telah menyerahkan versi revisi naskahnya.  Kami berharap Anda dapat membantu mengevaluasinya.<br />\n<br />\nSilakan login ke website jurnal sebelum {$responseDueDate} untuk memberitahukan apakah Anda bersedia melakukan review atau tidak, juga untuk mengakses naskah dan menyerahkan review beserta rekomendasi Anda. Website jurnal adalah {$contextUrl}<br />\n<br />\nTenggat review ini sendiri adalah {$reviewDueDate}.<br />\n<br />\nJika Anda tidak memiliki nama pengguna dan sandi untuk website jurnal ini, Anda dapat menggunakan tautan berikut untuk mereset sandi Anda (yang selanjutnya akan diemailkan kepada Anda bersama nama pengguna Anda). {$passwordResetUrl}<br />\n<br />\nURL Naskah: {$submissionReviewUrl}<br />\n<br />\nTerimakasih atas perhatiannya.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n{$submissionAbstract}','Email ini dari Editor Bagian kepada Reviewer untuk meminta reviewer memberitahukan apakah menerima atau menolak permohonan review untuk ronde kedua atau berikutnya. Email ini memberikan informasi tentang naskah meliputi judul dan abstrak, tenggat review, dan cara mengakses naskah. Pesan ini digunakan saat Proses Review Standar dipilih di Manajemen > Pengaturan > Alur Kerja > Review. (Selain itu lihat REVIEW_REQUEST_ATTACHED_SUBSEQUENT.)'),('REVISED_VERSION_NOTIFY','en_US','Revised Version Uploaded','Editors:<br />\n<br />\nA revised version of &quot;{$submissionTitle}&quot; has been uploaded by the author {$authorName}.<br />\n<br />\nSubmission URL: {$submissionUrl}<br />\n<br />\n{$editorialContactSignature}','This email is automatically sent to the assigned editor when author uploads a revised version of an article.'),('REVISED_VERSION_NOTIFY','id_ID','Versi Revisi telah Diunggah','Editor:<br />\n<br />\nVersi revisi dari &quot;{$submissionTitle}&quot; telah diunggah oleh penulis {$authorName}.<br />\n<br />\nURL naskah: {$submissionUrl}<br />\n<br />\n{$editorialContactSignature}','Email ini dikirim secara otomatis ke editor yang ditugaskan saat penulis mengunggah naskah versi revisi.'),('STATISTICS_REPORT_NOTIFICATION','en_US','Editorial activity for {$month}, {$year}','\n{$name}, <br />\n<br />\nYour journal health report for {$month}, {$year} is now available. Your key stats for this month are below.<br />\n<ul>\n	<li>New submissions this month: {$newSubmissions}</li>\n	<li>Declined submissions this month: {$declinedSubmissions}</li>\n	<li>Accepted submissions this month: {$acceptedSubmissions}</li>\n	<li>Total submissions in the system: {$totalSubmissions}</li>\n</ul>\nLogin to the journal to view more detailed <a href=\"{$editorialStatsLink}\">editorial trends</a> and <a href=\"{$publicationStatsLink}\">published article stats</a>. A full copy of this month\'s editorial trends is attached.<br />\n<br />\nSincerely,<br />\n{$principalContactSignature}','This email is automatically sent monthly to editors and journal managers to provide them a system health overview.'),('STATISTICS_REPORT_NOTIFICATION','id_ID','Kagiatan redaksi selama {$month}, {$year}','\n{$name}, <br />\n<br />\nLaporan kondisi jurnal Anda untuk {$month}, {$year} sudah tersedia. Statistik utama Anda bulan ini tersaji sebagai berikut.<br />\n<ul>\n	<li>Naskah baru yang masuk bulan ini: {$newSubmissions}</li>\n	<li>Naskah ditolak bulan ini: {$declinedSubmissions}</li>\n	<li>Naskah yang diterima bulan ini: {$acceptedSubmissions}</li>\n	<li>Total naskah dalam sistem: {$totalSubmissions}</li>\n</ul>\nLogin untuk melihat lebih rinci <a href=\"{$editorialStatsLink}\">trend editorial</a> dan <a href=\"{$publicationStatsLink}\">statistik artikel yang dipublikasikan</a>. Salinan lengkap trend bulan ini terlampir.<br />\n<br />\nSalam Hormat,<br />\n{$principalContactSignature}','Email ini dikirim secara otomatis setiap bulan kepada editor dan manajer jurnal untuk menyediakan pratinjau kestabilan sistem.'),('SUBMISSION_ACK','en_US','Submission Acknowledgement','{$authorName}:<br />\n<br />\nThank you for submitting the manuscript, &quot;{$submissionTitle}&quot; to {$contextName}. With the online journal management system that we are using, you will be able to track its progress through the editorial process by logging in to the journal web site:<br />\n<br />\nSubmission URL: {$submissionUrl}<br />\nUsername: {$authorUsername}<br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this journal as a venue for your work.<br />\n<br />\n{$editorialContactSignature}','This email, when enabled, is automatically sent to an author when they complete the process of submitting a manuscript to the journal. It provides information about tracking the submission through the process and thanks the author for the submission.'),('SUBMISSION_ACK','id_ID','Ucapan Terimakasih atas Penyerahan Naskah','{$authorName}:<br />\n<br />\nTerimakasih telah menyerahkan naskah, &quot;{$submissionTitle}&quot; ke {$contextName}. Dengan sistem manajemenn jurnal online yang kami gunakan, Anda dapat memantau kemajuan proses editorial naskah Anda melalui:<br />\n<br />\nURL Naskah: {$submissionUrl}<br />\nNama pengguna: {$authorUsername}<br />\n<br />\nJika ada pertanyaan, silakan hubungi kami. Terimakasih telah mempercayakan publikasi karya Anda di jurnal kami.<br />\n<br />\n{$editorialContactSignature}','Email ini, jika diaktifkan, secara otomatis dikirimkan ke penulis saat menyelesaikan proses penyerahan naskah ke jurnal. Email ini berisi informasi tentang pemantauan kemajuan proses editorial dan ucaan terima kasih atas naskah yang dikirimkan.'),('SUBMISSION_ACK_NOT_USER','en_US','Submission Acknowledgement','Hello,<br />\n<br />\n{$submitterName} has submitted the manuscript, &quot;{$submissionTitle}&quot; to {$contextName}. <br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this journal as a venue for your work.<br />\n<br />\n{$editorialContactSignature}','This email, when enabled, is automatically sent to the other authors who are not users within OJS specified during the submission process.'),('SUBMISSION_ACK_NOT_USER','id_ID','Pemberitahuan Penyerahan Naskah','Hello,<br />\n<br />\n{$submitterName} telah menyerahkan naskah, &quot;{$submissionTitle}&quot; ke {$contextName}. <br />\n<br />\nJika ada pertanyaan, silakan hubungi kami. Terimakasih telah mempercayakan publikasi karya Anda di jurnal kami.<br />\n<br />\n{$editorialContactSignature}','Email ini, jika diaktifkan, secara otomatis dikirimkan ke penulis saat menyelesaikan proses penyerahan naskah ke jurnal. Email ini memberikan informasi mengenai pemantauan kemajuan proses editorial dan mengucapkan terimakasih atas naskah yang dikirimkan.'),('SUBSCRIPTION_AFTER_EXPIRY','en_US','Subscription Expired','{$subscriberName}:<br />\n<br />\nYour {$contextName} subscription has expired.<br />\n<br />\n{$subscriptionType}<br />\nExpiry date: {$expiryDate}<br />\n<br />\nTo renew your subscription, please go to the journal website. You are able to log in to the system with your username, &quot;{$username}&quot;.<br />\n<br />\nIf you have any questions, please feel free to contact me.<br />\n<br />\n{$subscriptionContactSignature}','This email notifies a subscriber that their subscription has expired. It provides the journal\'s URL along with instructions for access.'),('SUBSCRIPTION_AFTER_EXPIRY','id_ID','Langganan Berakhir','{$subscriberName}:<br />\n<br />\nLangganan {$contextName} Anda telah berakhir.<br />\n<br />\n{$subscriptionType}<br />\nTanggal berakhir: {$expiryDate}<br />\n<br />\nUntuk memperbaharui langganan Anda, silakan kunjungi website jurnal.  Anda dapat login dengan menggunakan nama pengguna Anda, &quot;{$username}&quot;.<br />\n<br />\nJika ada pertanyaan, silakan hubungi kami.<br />\n<br />\n{$subscriptionContactSignature}','Email ini memberitahu seorang pelanggan bahwa langganannya telah berakhir.  Email ini memberikan URL jurnal beserta petunjuk aksesnya.'),('SUBSCRIPTION_AFTER_EXPIRY_LAST','en_US','Subscription Expired - Final Reminder','{$subscriberName}:<br />\n<br />\nYour {$contextName} subscription has expired.<br />\nPlease note that this is the final reminder that will be emailed to you.<br />\n<br />\n{$subscriptionType}<br />\nExpiry date: {$expiryDate}<br />\n<br />\nTo renew your subscription, please go to the journal website. You are able to log in to the system with your username, &quot;{$username}&quot;.<br />\n<br />\nIf you have any questions, please feel free to contact me.<br />\n<br />\n{$subscriptionContactSignature}','This email notifies a subscriber that their subscription has expired. It provides the journal\'s URL along with instructions for access.'),('SUBSCRIPTION_AFTER_EXPIRY_LAST','id_ID','Langganan Berakhir - Pengingat Terakhir','{$subscriberName}:<br />\n<br />\nLangganan {$contextName} Anda telah berakhir.<br />\nIni adalah pengingat terakhir yang diemailkan kepada Anda.<br />\n<br />\n{$subscriptionType}<br />\nTanggal berakhir: {$expiryDate}<br />\n<br />\nUntuk memperbaharui langganan Anda, silakan kunjungi website jurnal.  Anda dapat login dengan menggunakan nama pengguna Anda, &quot;{$username}&quot;.<br />\n<br />\nJika ada pertanyaan, silakan hubungi kami.<br />\n<br />\n{$subscriptionContactSignature}','Email ini memberitahu seorang pelanggan bahwa langganannya telah berakhir.  Email ini memberikan URL jurnal beserta petunjuk aksesnya.'),('SUBSCRIPTION_BEFORE_EXPIRY','en_US','Notice of Subscription Expiry','{$subscriberName}:<br />\n<br />\nYour {$contextName} subscription is about to expire.<br />\n<br />\n{$subscriptionType}<br />\nExpiry date: {$expiryDate}<br />\n<br />\nTo ensure the continuity of your access to this journal, please go to the journal website and renew your subscription. You are able to log in to the system with your username, &quot;{$username}&quot;.<br />\n<br />\nIf you have any questions, please feel free to contact me.<br />\n<br />\n{$subscriptionContactSignature}','This email notifies a subscriber that their subscription will soon expire. It provides the journal\'s URL along with instructions for access.'),('SUBSCRIPTION_BEFORE_EXPIRY','id_ID','Pemberitahuan Tanggal Berakhir Langganan','{$subscriberName}:<br />\n<br />\nLangganan {$contextName} Anda hampir berakhir.<br />\n<br />\n{$subscriptionType}<br />\nTanggal berakhir: {$expiryDate}<br />\n<br />\nUntuk terus memperoleh akses ke jurnal ini, silakan kunjungi website jurnal dan perbaharui langganan Anda. Anda dapat login menggunakan nama pengguna Anda, &quot;{$username}&quot;.<br />\n<br />\nJika ada pertanyaan, silakan hubungi kami.<br />\n<br />\n{$subscriptionContactSignature}','Email ini memberitahu seorang pelanggan bahwa langganannya hampir berakhir.  Email ini memberikan URL jurnal beserta petunjuk aksesnya.'),('SUBSCRIPTION_NOTIFY','en_US','Subscription Notification','{$subscriberName}:<br />\n<br />\nYou have now been registered as a subscriber in our online journal management system for {$contextName}, with the following subscription:<br />\n<br />\n{$subscriptionType}<br />\n<br />\nTo access content that is available only to subscribers, simply log in to the system with your username, &quot;{$username}&quot;.<br />\n<br />\nOnce you have logged in to the system you can change your profile details and password at any point.<br />\n<br />\nPlease note that if you have an institutional subscription, there is no need for users at your institution to log in, since requests for subscription content will be automatically authenticated by the system.<br />\n<br />\nIf you have any questions, please feel free to contact me.<br />\n<br />\n{$subscriptionContactSignature}','This email notifies a registered reader that the Manager has created a subscription for them. It provides the journal\'s URL along with instructions for access.'),('SUBSCRIPTION_NOTIFY','id_ID','Pemberitahuan Langganan','{$subscriberName}:<br />\n<br />\nAnda sekarang telah terdaftar sebagai pelanggan di sistem manajemen jurnal online kami, {$contextName}, dengan jenis langganan:<br />\n<br />\n{$subscriptionType}<br />\n<br />\nUntuk mengakses konten yang hanya tersedia bagi pelanggan, silakan login ke sistem dengan menggunakan nama pengguna Anda, &quot;{$username}&quot;.<br />\n<br />\nSetelah login, Anda dapat mengubah detail profil Anda dan sandi Anda kapanpun Anda kehendaki.<br />\n<br />\nJika Anda memiliki langganan institusi, pengguna di institusi Anda tidak perlu login karena semua akses secara otomatis diotentikasi oleh sistem.<br />\n<br />\nJika ada pertanyaan, silakan hubungi kami.<br />\n<br />\n{$subscriptionContactSignature}','Email ini memberitahu pembaca terdaftar bahwa Manajer telah membuat akses langganan untuk mereka.  Email ini memberikan URL jurnal beserta petunjuk aksesnya.'),('SUBSCRIPTION_PURCHASE_INDL','en_US','Subscription Purchase: Individual','An individual subscription has been purchased online for {$contextName} with the following details.<br />\n<br />\nSubscription Type:<br />\n{$subscriptionType}<br />\n<br />\nUser:<br />\n{$userDetails}<br />\n<br />\nMembership Information (if provided):<br />\n{$membership}<br />\n<br />\nTo view or edit this subscription, please use the following URL.<br />\n<br />\nSubscription URL: {$subscriptionUrl}<br />\n','This email notifies the Subscription Manager that an individual subscription has been purchased online. It provides summary information about the subscription and a quick access link to the purchased subscription.'),('SUBSCRIPTION_PURCHASE_INDL','id_ID','Pembelian Langganan: Individu','Sebuah langganan individu telah dibeli online untuk {$contextName} dengan rincian berikut.<br />\n<br />\nJenis Langganan:<br />\n{$subscriptionType}<br />\n<br />\nPengguna:<br />\n{$userDetails}<br />\n<br />\nInformasi Keanggotaan (jika ada):<br />\n{$membership}<br />\n<br />\nUntuk melihat atau mengubah langganan ini, silakan gunakan URL berikut ini.<br />\n<br />\nURL Langganan: {$subscriptionUrl}<br />\n','Email ini memberitahu Manajer Langganan bahwa sebuah langganan individu telah dibeli online.  Email ini memberikan ringkasan informasi tentang langganan tersebut beserta tautan untuk mengakses langganan yang dibeli.'),('SUBSCRIPTION_PURCHASE_INSTL','en_US','Subscription Purchase: Institutional','An institutional subscription has been purchased online for {$contextName} with the following details. To activate this subscription, please use the provided Subscription URL and set the subscription status to \'Active\'.<br />\n<br />\nSubscription Type:<br />\n{$subscriptionType}<br />\n<br />\nInstitution:<br />\n{$institutionName}<br />\n{$institutionMailingAddress}<br />\n<br />\nDomain (if provided):<br />\n{$domain}<br />\n<br />\nIP Ranges (if provided):<br />\n{$ipRanges}<br />\n<br />\nContact Person:<br />\n{$userDetails}<br />\n<br />\nMembership Information (if provided):<br />\n{$membership}<br />\n<br />\nTo view or edit this subscription, please use the following URL.<br />\n<br />\nSubscription URL: {$subscriptionUrl}<br />\n','This email notifies the Subscription Manager that an institutional subscription has been purchased online. It provides summary information about the subscription and a quick access link to the purchased subscription.'),('SUBSCRIPTION_PURCHASE_INSTL','id_ID','Pembelian Langganan: Institusi','Sebuah langganan institusi telah dibeli online untuk {$contextName} dengan rincian berikut. Untuk mengaktifkan langganan ini, silakan gunakan URL Langganan dan jadikan status langganan ke \'Aktif\'.<br />\n<br />\nJenis Langganan:<br />\n{$subscriptionType}<br />\n<br />\nInstitusi:<br />\n{$institutionName}<br />\n{$institutionMailingAddress}<br />\n<br />\nDomain (jika ada):<br />\n{$domain}<br />\n<br />\nIP Ranges (jika ada):<br />\n{$ipRanges}<br />\n<br />\nContact Person:<br />\n{$userDetails}<br />\n<br />\nInformasi Keanggotaan (jika ada):<br />\n{$membership}<br />\n<br />\nUntuk melihat atau mengubah langganan ini, silakan gunakan URL berikut ini.<br />\n<br />\nURL Langganan: {$subscriptionUrl}<br />\n','Email ini memberitahu Manajer Langganan bahwa sebuah langganan institusi telah dibeli online.  Email ini memberikan ringkasan informasi tentang langganan tersebut beserta tautan untuk mengakses langganan yang dibeli.'),('SUBSCRIPTION_RENEW_INDL','en_US','Subscription Renewal: Individual','An individual subscription has been renewed online for {$contextName} with the following details.<br />\n<br />\nSubscription Type:<br />\n{$subscriptionType}<br />\n<br />\nUser:<br />\n{$userDetails}<br />\n<br />\nMembership Information (if provided):<br />\n{$membership}<br />\n<br />\nTo view or edit this subscription, please use the following URL.<br />\n<br />\nSubscription URL: {$subscriptionUrl}<br />\n','This email notifies the Subscription Manager that an individual subscription has been renewed online. It provides summary information about the subscription and a quick access link to the renewed subscription.'),('SUBSCRIPTION_RENEW_INDL','id_ID','Pembaharuan Langganan: Individu','Sebuah langganan individu telah diperbaharui online untuk {$contextName} dengan rincian berikut.<br />\n<br />\nJenis Langganan:<br />\n{$subscriptionType}<br />\n<br />\nPengguna:<br />\n{$userDetails}<br />\n<br />\nInformasi Keanggotaan (jika ada):<br />\n{$membership}<br />\n<br />\nUntuk melihat atau mengubah langganan ini, silakan gunakan URL berikut ini.<br />\n<br />\nURL Langganan: {$subscriptionUrl}<br />\n','Email ini memberitahu Manajer Langganan bahwa sebuah langganan individu telah diperbaharui online.  Email ini memberikan ringkasan informasi tentang langganan tersebut beserta tautan untuk mengakses langganan yang diperbaharui.'),('SUBSCRIPTION_RENEW_INSTL','en_US','Subscription Renewal: Institutional','An institutional subscription has been renewed online for {$contextName} with the following details.<br />\n<br />\nSubscription Type:<br />\n{$subscriptionType}<br />\n<br />\nInstitution:<br />\n{$institutionName}<br />\n{$institutionMailingAddress}<br />\n<br />\nDomain (if provided):<br />\n{$domain}<br />\n<br />\nIP Ranges (if provided):<br />\n{$ipRanges}<br />\n<br />\nContact Person:<br />\n{$userDetails}<br />\n<br />\nMembership Information (if provided):<br />\n{$membership}<br />\n<br />\nTo view or edit this subscription, please use the following URL.<br />\n<br />\nSubscription URL: {$subscriptionUrl}<br />\n','This email notifies the Subscription Manager that an institutional subscription has been renewed online. It provides summary information about the subscription and a quick access link to the renewed subscription.'),('SUBSCRIPTION_RENEW_INSTL','id_ID','Pembaharuan Langganan: Institusi','Sebuah langganan institusi telah diperbaharui online untuk {$contextName} dengan rincian berikut.<br />\n<br />\nJenis Langganan:<br />\n{$subscriptionType}<br />\n<br />\nInstitusi:<br />\n{$institutionName}<br />\n{$institutionMailingAddress}<br />\n<br />\nDomain (jika ada):<br />\n{$domain}<br />\n<br />\nIP Ranges (jika ada):<br />\n{$ipRanges}<br />\n<br />\nContact Person:<br />\n{$userDetails}<br />\n<br />\nInformasi Keanggotaan (jika ada):<br />\n{$membership}<br />\n<br />\nUntuk melihat atau mengubah langganan ini, silakan gunakan URL berikut ini.<br />\n<br />\nURL Langganan: {$subscriptionUrl}<br />\n','Email ini memberitahu Manajer Langganan bahwa sebuah langganan institusi telah diperbaharui online.  Email ini memberikan ringkasan informasi tentang langganan tersebut beserta tautan untuk mengakses langganan yang diperbaharui.'),('USER_REGISTER','en_US','Journal Registration','{$userFullName}<br />\n<br />\nYou have now been registered as a user with {$contextName}. We have included your username and password in this email, which are needed for all work with this journal through its website. At any point, you can ask to be removed from the journal\'s list of users by contacting me.<br />\n<br />\nUsername: {$username}<br />\nPassword: {$password}<br />\n<br />\nThank you,<br />\n{$principalContactSignature}','This email is sent to a newly registered user to welcome them to the system and provide them with a record of their username and password.'),('USER_REGISTER','id_ID','Registrasi Jurnal','{$userFullName}<br />\n<br />\nAnda sekarang telah terdaftar sebagai pengguna di {$contextName}.  Kami sertakan nama pengguna dan sandi Anda di email ini, keduanya diperlukan untuk semua kegiatan melalui website jurnal ini. Anda dapat keluar dari daftar pengguna jurnal kapan saja dengan menghubungi kami.<br />\n<br />\nNama pengguna: {$username}<br />\nSandi: {$password}<br />\n<br />\nTerimakasih,<br />\n{$principalContactSignature}','Email ini dikirimkan ke pengguna baru untuk menyambut dan memberikan informasi nama pengguna dan sandi.'),('USER_VALIDATE','en_US','Validate Your Account','{$userFullName}<br />\n<br />\nYou have created an account with {$contextName}, but before you can start using it, you need to validate your email account. To do this, simply follow the link below:<br />\n<br />\n{$activateUrl}<br />\n<br />\nThank you,<br />\n{$principalContactSignature}','This email is sent to a newly registered user to validate their email account.'),('USER_VALIDATE','id_ID','Validasi Akun Anda','{$userFullName}<br />\n<br />\nAnda telah membuat akun di {$contextName}.  Sebelum dapat menggunakannya, Anda perlu melakukan validasi akun email. Untuk melakukannya, klik tautan berikut ini:<br />\n<br />\n{$activateUrl}<br />\n<br />\nTerimakasih,<br />\n{$principalContactSignature}','Email ini dikirim ke pengguna baru agar melakukan validasi email yang mereka gunakan untuk registrasi.');
/*!40000 ALTER TABLE `email_templates_default_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_templates_settings`
--

DROP TABLE IF EXISTS `email_templates_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `email_templates_settings` (
  `email_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  UNIQUE KEY `email_settings_pkey` (`email_id`,`locale`,`setting_name`),
  KEY `email_settings_email_id` (`email_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_templates_settings`
--

LOCK TABLES `email_templates_settings` WRITE;
/*!40000 ALTER TABLE `email_templates_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_templates_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_log`
--

DROP TABLE IF EXISTS `event_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_log` (
  `log_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `assoc_type` bigint(20) NOT NULL,
  `assoc_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `date_logged` datetime NOT NULL,
  `event_type` bigint(20) DEFAULT NULL,
  `message` text,
  `is_translated` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`log_id`),
  KEY `event_log_assoc` (`assoc_type`,`assoc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_log`
--

LOCK TABLES `event_log` WRITE;
/*!40000 ALTER TABLE `event_log` DISABLE KEYS */;
INSERT INTO `event_log` VALUES (1,1048585,3,1,'2025-02-25 06:58:29',268435458,'submission.event.general.metadataUpdated',0),(2,1048585,3,1,'2025-02-25 06:59:10',268435458,'submission.event.general.metadataUpdated',0),(3,515,1,1,'2025-02-25 07:01:00',1342177281,'submission.event.fileUploaded',0),(4,1048585,3,1,'2025-02-25 07:01:01',1342177288,'submission.event.fileRevised',0),(5,515,1,1,'2025-02-25 07:01:27',1342177296,'submission.event.fileEdited',0),(6,1048585,3,1,'2025-02-25 07:01:27',1342177296,'submission.event.fileEdited',0),(7,1048585,3,1,'2025-02-25 07:02:16',268435458,'submission.event.general.metadataUpdated',0),(8,515,2,1,'2025-02-25 07:02:17',1342177281,'submission.event.fileUploaded',0),(9,1048585,3,1,'2025-02-25 07:02:17',1342177288,'submission.event.fileRevised',0),(10,1048585,3,1,'2025-02-25 07:02:18',268435462,'publication.event.scheduled',0),(11,1048585,3,1,'2025-02-25 07:03:46',268435462,'publication.event.published',0),(12,1048585,3,1,'2025-02-27 10:11:18',268435463,'publication.event.unpublished',0),(13,1048585,3,1,'2025-02-27 10:11:19',268435462,'publication.event.scheduled',0),(14,515,3,1,'2025-02-27 10:12:20',1342177281,'submission.event.fileUploaded',0),(15,1048585,3,1,'2025-02-27 10:12:20',1342177288,'submission.event.fileRevised',0),(16,515,4,1,'2025-02-27 10:12:47',1342177281,'submission.event.fileUploaded',0),(17,1048585,3,1,'2025-02-27 10:12:47',1342177288,'submission.event.fileRevised',0),(18,515,4,1,'2025-02-27 10:12:57',1342177296,'submission.event.fileEdited',0),(19,1048585,3,1,'2025-02-27 10:12:57',1342177296,'submission.event.fileEdited',0),(20,515,5,1,'2025-02-27 10:15:21',1342177281,'submission.event.fileUploaded',0),(21,1048585,3,1,'2025-02-27 10:15:22',1342177288,'submission.event.fileRevised',0),(22,515,5,1,'2025-02-27 10:15:28',1342177296,'submission.event.fileEdited',0),(23,1048585,3,1,'2025-02-27 10:15:28',1342177296,'submission.event.fileEdited',0),(24,1048585,3,1,'2025-02-27 11:45:21',268435462,'publication.event.published',0),(26,515,6,1,'2025-02-27 11:53:13',1342177281,'submission.event.fileUploaded',0),(28,515,6,1,'2025-02-27 11:53:19',1342177296,'submission.event.fileEdited',0),(30,515,6,1,'2025-02-27 11:54:06',1342177282,'submission.event.fileDeleted',0),(31,1048585,7,1,'2025-02-27 11:55:15',268435458,'submission.event.general.metadataUpdated',0),(32,515,7,1,'2025-02-27 11:55:35',1342177281,'submission.event.fileUploaded',0),(33,1048585,7,1,'2025-02-27 11:55:35',1342177288,'submission.event.fileRevised',0),(34,515,7,1,'2025-02-27 11:55:41',1342177296,'submission.event.fileEdited',0),(35,1048585,7,1,'2025-02-27 11:55:41',1342177296,'submission.event.fileEdited',0),(36,1048585,7,1,'2025-02-27 11:56:13',268435458,'submission.event.general.metadataUpdated',0),(37,515,8,1,'2025-02-27 11:56:13',1342177281,'submission.event.fileUploaded',0),(38,1048585,7,1,'2025-02-27 11:56:14',1342177288,'submission.event.fileRevised',0),(39,1048585,7,1,'2025-02-27 11:56:14',268435462,'publication.event.published',0),(40,1048585,7,1,'2025-02-27 13:07:10',268435463,'publication.event.unpublished',0),(41,1048585,7,1,'2025-02-27 13:07:11',268435458,'submission.event.general.metadataUpdated',0),(42,1048585,3,1,'2025-02-27 13:07:17',268435463,'publication.event.unpublished',0),(43,1048585,3,1,'2025-02-27 13:07:19',268435462,'publication.event.scheduled',0),(44,515,1,1,'2025-02-27 13:07:44',1342177282,'submission.event.fileDeleted',0),(45,515,3,1,'2025-02-27 13:07:45',1342177282,'submission.event.fileDeleted',0),(46,515,4,1,'2025-02-27 13:07:45',1342177282,'submission.event.fileDeleted',0),(47,515,5,1,'2025-02-27 13:07:46',1342177282,'submission.event.fileDeleted',0),(48,1048585,3,1,'2025-02-27 13:08:17',268435463,'publication.event.unpublished',0),(49,1048585,3,1,'2025-02-27 13:08:18',268435458,'submission.event.general.metadataUpdated',0),(50,1048585,8,1,'2025-02-27 13:09:52',268435458,'submission.event.general.metadataUpdated',0),(52,1048585,12,1,'2025-02-27 13:19:21',268435458,'submission.event.general.metadataUpdated',0),(53,1048585,12,1,'2025-02-27 13:19:26',268435458,'submission.event.general.metadataUpdated',0),(54,1048585,12,1,'2025-02-27 13:19:26',268435462,'publication.event.scheduled',0),(55,1048585,12,1,'2025-02-27 13:19:36',268435462,'publication.event.published',0);
/*!40000 ALTER TABLE `event_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_log_settings`
--

DROP TABLE IF EXISTS `event_log_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_log_settings` (
  `log_id` bigint(20) NOT NULL,
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)',
  UNIQUE KEY `event_log_settings_pkey` (`log_id`,`setting_name`),
  KEY `event_log_settings_log_id` (`log_id`),
  KEY `event_log_settings_name_value` (`setting_name`(50),`setting_value`(150))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_log_settings`
--

LOCK TABLES `event_log_settings` WRITE;
/*!40000 ALTER TABLE `event_log_settings` DISABLE KEYS */;
INSERT INTO `event_log_settings` VALUES (3,'fileId','1','int'),(3,'fileStage','10','int'),(3,'originalFileName','541-Article Text-4026-1-10-20240623.pdf','string'),(3,'sourceSubmissionFileId',NULL,'string'),(3,'submissionFileId','1','int'),(3,'submissionId','3','int'),(3,'username','username_ojs','string'),(4,'fileId','1','int'),(4,'fileStage','10','int'),(4,'name','541-Article Text-4026-1-10-20240623.pdf','string'),(4,'submissionFileId','1','int'),(4,'submissionId','3','int'),(4,'username','username_ojs','string'),(5,'fileId','1','int'),(5,'fileStage','10','int'),(5,'originalFileName','541-Article Text-4026-1-10-20240623.pdf','string'),(5,'sourceSubmissionFileId',NULL,'string'),(5,'submissionFileId','1','int'),(5,'submissionId','3','int'),(5,'username','username_ojs','string'),(6,'fileId','1','int'),(6,'fileStage','10','int'),(6,'name','541-Article Text-4026-1-10-20240623.pdf','string'),(6,'originalFileName','541-Article Text-4026-1-10-20240623.pdf','string'),(6,'sourceSubmissionFileId',NULL,'string'),(6,'submissionFileId','1','int'),(6,'submissionId','3','int'),(6,'username','username_ojs','string'),(8,'fileId','1','int'),(8,'fileStage','2','int'),(8,'originalFileName','541-Article Text-4026-1-10-20240623.pdf','string'),(8,'sourceSubmissionFileId','1','int'),(8,'submissionFileId','2','int'),(8,'submissionId','3','int'),(8,'username','username_ojs','string'),(9,'fileId','1','int'),(9,'fileStage','2','int'),(9,'name','541-Article Text-4026-1-10-20240623.pdf','string'),(9,'submissionFileId','2','int'),(9,'submissionId','3','int'),(9,'username','username_ojs','string'),(14,'fileId','2','int'),(14,'fileStage','10','int'),(14,'originalFileName','541-Article+Text-4026-1-10-20240623.pdf','string'),(14,'sourceSubmissionFileId',NULL,'string'),(14,'submissionFileId','3','int'),(14,'submissionId','3','int'),(14,'username','username_ojs','string'),(15,'fileId','2','int'),(15,'fileStage','10','int'),(15,'name','541-Article+Text-4026-1-10-20240623.pdf','string'),(15,'submissionFileId','3','int'),(15,'submissionId','3','int'),(15,'username','username_ojs','string'),(16,'fileId','3','int'),(16,'fileStage','10','int'),(16,'originalFileName','541-Article+Text-4026-1-10-20240623.pdf','string'),(16,'sourceSubmissionFileId',NULL,'string'),(16,'submissionFileId','4','int'),(16,'submissionId','3','int'),(16,'username','username_ojs','string'),(17,'fileId','3','int'),(17,'fileStage','10','int'),(17,'name','541-Article+Text-4026-1-10-20240623.pdf','string'),(17,'submissionFileId','4','int'),(17,'submissionId','3','int'),(17,'username','username_ojs','string'),(18,'fileId','3','int'),(18,'fileStage','10','int'),(18,'originalFileName','naskah111.pdf','string'),(18,'sourceSubmissionFileId',NULL,'string'),(18,'submissionFileId','4','int'),(18,'submissionId','3','int'),(18,'username','username_ojs','string'),(19,'fileId','3','int'),(19,'fileStage','10','int'),(19,'name','naskah111.pdf','string'),(19,'originalFileName','naskah111.pdf','string'),(19,'sourceSubmissionFileId',NULL,'string'),(19,'submissionFileId','4','int'),(19,'submissionId','3','int'),(19,'username','username_ojs','string'),(20,'fileId','4','int'),(20,'fileStage','10','int'),(20,'originalFileName','541-Article+Text-4026-1-10-20240623.pdf','string'),(20,'sourceSubmissionFileId',NULL,'string'),(20,'submissionFileId','5','int'),(20,'submissionId','3','int'),(20,'username','username_ojs','string'),(21,'fileId','4','int'),(21,'fileStage','10','int'),(21,'name','541-Article+Text-4026-1-10-20240623.pdf','string'),(21,'submissionFileId','5','int'),(21,'submissionId','3','int'),(21,'username','username_ojs','string'),(22,'fileId','4','int'),(22,'fileStage','10','int'),(22,'originalFileName','541-Article+Text-4026-1-10-20240623.pdf','string'),(22,'sourceSubmissionFileId',NULL,'string'),(22,'submissionFileId','5','int'),(22,'submissionId','3','int'),(22,'username','username_ojs','string'),(23,'fileId','4','int'),(23,'fileStage','10','int'),(23,'name','541-Article+Text-4026-1-10-20240623.pdf','string'),(23,'originalFileName','541-Article+Text-4026-1-10-20240623.pdf','string'),(23,'sourceSubmissionFileId',NULL,'string'),(23,'submissionFileId','5','int'),(23,'submissionId','3','int'),(23,'username','username_ojs','string'),(26,'fileId','5','int'),(26,'fileStage','10','int'),(26,'originalFileName','document.pdf','string'),(26,'sourceSubmissionFileId',NULL,'string'),(26,'submissionFileId','6','int'),(26,'submissionId','6','int'),(26,'username','username_ojs','string'),(28,'fileId','5','int'),(28,'fileStage','10','int'),(28,'originalFileName','document.pdf','string'),(28,'sourceSubmissionFileId',NULL,'string'),(28,'submissionFileId','6','int'),(28,'submissionId','6','int'),(28,'username','username_ojs','string'),(30,'fileStage','10','int'),(30,'sourceSubmissionFileId',NULL,'string'),(30,'submissionFileId','6','int'),(30,'submissionId','6','int'),(30,'username','username_ojs','string'),(32,'fileId','6','int'),(32,'fileStage','10','int'),(32,'originalFileName','document.pdf','string'),(32,'sourceSubmissionFileId',NULL,'string'),(32,'submissionFileId','7','int'),(32,'submissionId','7','int'),(32,'username','username_ojs','string'),(33,'fileId','6','int'),(33,'fileStage','10','int'),(33,'name','document.pdf','string'),(33,'submissionFileId','7','int'),(33,'submissionId','7','int'),(33,'username','username_ojs','string'),(34,'fileId','6','int'),(34,'fileStage','10','int'),(34,'originalFileName','document.pdf','string'),(34,'sourceSubmissionFileId',NULL,'string'),(34,'submissionFileId','7','int'),(34,'submissionId','7','int'),(34,'username','username_ojs','string'),(35,'fileId','6','int'),(35,'fileStage','10','int'),(35,'name','document.pdf','string'),(35,'originalFileName','document.pdf','string'),(35,'sourceSubmissionFileId',NULL,'string'),(35,'submissionFileId','7','int'),(35,'submissionId','7','int'),(35,'username','username_ojs','string'),(37,'fileId','6','int'),(37,'fileStage','2','int'),(37,'originalFileName','document.pdf','string'),(37,'sourceSubmissionFileId','7','int'),(37,'submissionFileId','8','int'),(37,'submissionId','7','int'),(37,'username','username_ojs','string'),(38,'fileId','6','int'),(38,'fileStage','2','int'),(38,'name','document.pdf','string'),(38,'submissionFileId','8','int'),(38,'submissionId','7','int'),(38,'username','username_ojs','string'),(44,'fileStage','10','int'),(44,'sourceSubmissionFileId',NULL,'string'),(44,'submissionFileId','1','int'),(44,'submissionId','3','int'),(44,'username','username_ojs','string'),(45,'fileStage','10','int'),(45,'sourceSubmissionFileId',NULL,'string'),(45,'submissionFileId','3','int'),(45,'submissionId','3','int'),(45,'username','username_ojs','string'),(46,'fileStage','10','int'),(46,'sourceSubmissionFileId',NULL,'string'),(46,'submissionFileId','4','int'),(46,'submissionId','3','int'),(46,'username','username_ojs','string'),(47,'fileStage','10','int'),(47,'sourceSubmissionFileId',NULL,'string'),(47,'submissionFileId','5','int'),(47,'submissionId','3','int'),(47,'username','username_ojs','string');
/*!40000 ALTER TABLE `event_log_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `files`
--

DROP TABLE IF EXISTS `files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `files` (
  `file_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `path` varchar(255) NOT NULL,
  `mimetype` varchar(255) NOT NULL,
  PRIMARY KEY (`file_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `files`
--

LOCK TABLES `files` WRITE;
/*!40000 ALTER TABLE `files` DISABLE KEYS */;
INSERT INTO `files` VALUES (1,'journals/1/articles/3/67bd6aac7ac73.pdf','application/pdf'),(6,'journals/1/articles/7/67c052b6d1691.pdf','application/pdf');
/*!40000 ALTER TABLE `files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filter_groups`
--

DROP TABLE IF EXISTS `filter_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `filter_groups` (
  `filter_group_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `symbolic` varchar(255) DEFAULT NULL,
  `display_name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `input_type` varchar(255) DEFAULT NULL,
  `output_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`filter_group_id`),
  UNIQUE KEY `filter_groups_symbolic` (`symbolic`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filter_groups`
--

LOCK TABLES `filter_groups` WRITE;
/*!40000 ALTER TABLE `filter_groups` DISABLE KEYS */;
INSERT INTO `filter_groups` VALUES (1,'article=>dc11','plugins.metadata.dc11.articleAdapter.displayName','plugins.metadata.dc11.articleAdapter.description','class::classes.submission.Submission','metadata::plugins.metadata.dc11.schema.Dc11Schema(ARTICLE)'),(2,'issue=>crossref-xml','plugins.importexport.crossref.displayName','plugins.importexport.crossref.description','class::classes.issue.Issue[]','xml::schema(https://www.crossref.org/schemas/crossref4.3.6.xsd)'),(3,'article=>crossref-xml','plugins.importexport.crossref.displayName','plugins.importexport.crossref.description','class::classes.submission.Submission[]','xml::schema(https://www.crossref.org/schemas/crossref4.3.6.xsd)'),(4,'user=>user-xml','plugins.importexport.users.displayName','plugins.importexport.users.description','class::lib.pkp.classes.user.User[]','xml::schema(lib/pkp/plugins/importexport/users/pkp-users.xsd)'),(5,'user-xml=>user','plugins.importexport.users.displayName','plugins.importexport.users.description','xml::schema(lib/pkp/plugins/importexport/users/pkp-users.xsd)','class::classes.users.User[]'),(6,'usergroup=>user-xml','plugins.importexport.users.displayName','plugins.importexport.users.description','class::lib.pkp.classes.security.UserGroup[]','xml::schema(lib/pkp/plugins/importexport/users/pkp-users.xsd)'),(7,'user-xml=>usergroup','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(lib/pkp/plugins/importexport/users/pkp-users.xsd)','class::lib.pkp.classes.security.UserGroup[]'),(8,'article=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::classes.submission.Submission[]','xml::schema(plugins/importexport/native/native.xsd)'),(9,'native-xml=>article','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::classes.submission.Submission[]'),(10,'issue=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::classes.issue.Issue[]','xml::schema(plugins/importexport/native/native.xsd)'),(11,'native-xml=>issue','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::classes.issue.Issue[]'),(12,'issuegalley=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::classes.issue.IssueGalley[]','xml::schema(plugins/importexport/native/native.xsd)'),(13,'native-xml=>issuegalley','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::classes.issue.IssueGalley[]'),(14,'author=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::classes.article.Author[]','xml::schema(plugins/importexport/native/native.xsd)'),(15,'native-xml=>author','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::classes.article.Author[]'),(16,'SubmissionFile=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::lib.pkp.classes.submission.SubmissionFile','xml::schema(plugins/importexport/native/native.xsd)'),(17,'native-xml=>SubmissionFile','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::lib.pkp.classes.submission.SubmissionFile'),(18,'article-galley=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::classes.article.ArticleGalley','xml::schema(plugins/importexport/native/native.xsd)'),(19,'native-xml=>ArticleGalley','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::classes.article.ArticleGalley[]'),(20,'publication=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::classes.publication.Publication','xml::schema(plugins/importexport/native/native.xsd)'),(21,'native-xml=>Publication','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::classes.publication.Publication'),(22,'article=>doaj-xml','plugins.importexport.doaj.displayName','plugins.importexport.doaj.description','class::classes.submission.Submission[]','xml::schema(plugins/importexport/doaj/doajArticles.xsd)'),(23,'article=>doaj-json','plugins.importexport.doaj.displayName','plugins.importexport.doaj.description','class::classes.submission.Submission','primitive::string'),(24,'article=>pubmed-xml','plugins.importexport.pubmed.displayName','plugins.importexport.pubmed.description','class::classes.submission.Submission[]','xml::dtd'),(25,'issue=>datacite-xml','plugins.importexport.datacite.displayName','plugins.importexport.datacite.description','class::classes.issue.Issue','xml::schema(http://schema.datacite.org/meta/kernel-4/metadata.xsd)'),(26,'article=>datacite-xml','plugins.importexport.datacite.displayName','plugins.importexport.datacite.description','class::classes.submission.Submission','xml::schema(http://schema.datacite.org/meta/kernel-4/metadata.xsd)'),(27,'galley=>datacite-xml','plugins.importexport.datacite.displayName','plugins.importexport.datacite.description','class::classes.article.ArticleGalley','xml::schema(http://schema.datacite.org/meta/kernel-4/metadata.xsd)');
/*!40000 ALTER TABLE `filter_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filter_settings`
--

DROP TABLE IF EXISTS `filter_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `filter_settings` (
  `filter_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `filter_settings_pkey` (`filter_id`,`locale`,`setting_name`),
  KEY `filter_settings_id` (`filter_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filter_settings`
--

LOCK TABLES `filter_settings` WRITE;
/*!40000 ALTER TABLE `filter_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `filter_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filters`
--

DROP TABLE IF EXISTS `filters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `filters` (
  `filter_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `filter_group_id` bigint(20) NOT NULL DEFAULT '0',
  `context_id` bigint(20) NOT NULL DEFAULT '0',
  `display_name` varchar(255) DEFAULT NULL,
  `class_name` varchar(255) DEFAULT NULL,
  `is_template` smallint(6) NOT NULL DEFAULT '0',
  `parent_filter_id` bigint(20) NOT NULL DEFAULT '0',
  `seq` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`filter_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filters`
--

LOCK TABLES `filters` WRITE;
/*!40000 ALTER TABLE `filters` DISABLE KEYS */;
INSERT INTO `filters` VALUES (1,1,0,'Extract metadata from a(n) Submission','plugins.metadata.dc11.filter.Dc11SchemaArticleAdapter',0,0,0),(2,2,0,'Crossref XML issue export','plugins.importexport.crossref.filter.IssueCrossrefXmlFilter',0,0,0),(3,3,0,'Crossref XML issue export','plugins.importexport.crossref.filter.ArticleCrossrefXmlFilter',0,0,0),(4,4,0,'User XML user export','lib.pkp.plugins.importexport.users.filter.PKPUserUserXmlFilter',0,0,0),(5,5,0,'User XML user import','lib.pkp.plugins.importexport.users.filter.UserXmlPKPUserFilter',0,0,0),(6,6,0,'Native XML user group export','lib.pkp.plugins.importexport.users.filter.UserGroupNativeXmlFilter',0,0,0),(7,7,0,'Native XML user group import','lib.pkp.plugins.importexport.users.filter.NativeXmlUserGroupFilter',0,0,0),(8,8,0,'Native XML submission export','plugins.importexport.native.filter.ArticleNativeXmlFilter',0,0,0),(9,9,0,'Native XML submission import','plugins.importexport.native.filter.NativeXmlArticleFilter',0,0,0),(10,10,0,'Native XML issue export','plugins.importexport.native.filter.IssueNativeXmlFilter',0,0,0),(11,11,0,'Native XML issue import','plugins.importexport.native.filter.NativeXmlIssueFilter',0,0,0),(12,12,0,'Native XML issue galley export','plugins.importexport.native.filter.IssueGalleyNativeXmlFilter',0,0,0),(13,13,0,'Native XML issue galley import','plugins.importexport.native.filter.NativeXmlIssueGalleyFilter',0,0,0),(14,14,0,'Native XML author export','plugins.importexport.native.filter.AuthorNativeXmlFilter',0,0,0),(15,15,0,'Native XML author import','plugins.importexport.native.filter.NativeXmlAuthorFilter',0,0,0),(16,17,0,'Native XML submission file import','plugins.importexport.native.filter.NativeXmlArticleFileFilter',0,0,0),(17,16,0,'Native XML submission file export','lib.pkp.plugins.importexport.native.filter.SubmissionFileNativeXmlFilter',0,0,0),(18,18,0,'Native XML representation export','plugins.importexport.native.filter.ArticleGalleyNativeXmlFilter',0,0,0),(19,19,0,'Native XML representation import','plugins.importexport.native.filter.NativeXmlArticleGalleyFilter',0,0,0),(20,20,0,'Native XML Publication export','plugins.importexport.native.filter.PublicationNativeXmlFilter',0,0,0),(21,21,0,'Native XML publication import','plugins.importexport.native.filter.NativeXmlPublicationFilter',0,0,0),(22,22,0,'DOAJ XML export','plugins.importexport.doaj.filter.DOAJXmlFilter',0,0,0),(23,23,0,'DOAJ JSON export','plugins.importexport.doaj.filter.DOAJJsonFilter',0,0,0),(24,24,0,'ArticlePubMedXmlFilter','plugins.importexport.pubmed.filter.ArticlePubMedXmlFilter',0,0,0),(25,25,0,'DataCite XML export','plugins.importexport.datacite.filter.DataciteXmlFilter',0,0,0),(26,26,0,'DataCite XML export','plugins.importexport.datacite.filter.DataciteXmlFilter',0,0,0),(27,27,0,'DataCite XML export','plugins.importexport.datacite.filter.DataciteXmlFilter',0,0,0);
/*!40000 ALTER TABLE `filters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genre_settings`
--

DROP TABLE IF EXISTS `genre_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genre_settings` (
  `genre_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)',
  UNIQUE KEY `genre_settings_pkey` (`genre_id`,`locale`,`setting_name`),
  KEY `genre_settings_genre_id` (`genre_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genre_settings`
--

LOCK TABLES `genre_settings` WRITE;
/*!40000 ALTER TABLE `genre_settings` DISABLE KEYS */;
INSERT INTO `genre_settings` VALUES (1,'id_ID','name','File Utama Naskah','string'),(2,'id_ID','name','Instrumen Penelitian','string'),(3,'id_ID','name','Bahan Penelitian','string'),(4,'id_ID','name','Hasil Penelitian','string'),(5,'id_ID','name','Transkrip','string'),(6,'id_ID','name','Analisis Data','string'),(7,'id_ID','name','Data Set','string'),(8,'id_ID','name','Teks Sumber','string'),(9,'id_ID','name','Multimedia','string'),(10,'id_ID','name','Gambar','string'),(11,'id_ID','name','HTML StyleSheet','string'),(12,'id_ID','name','Lainnya','string');
/*!40000 ALTER TABLE `genre_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genres`
--

DROP TABLE IF EXISTS `genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genres` (
  `genre_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `context_id` bigint(20) NOT NULL,
  `seq` bigint(20) NOT NULL,
  `enabled` smallint(6) NOT NULL DEFAULT '1',
  `category` bigint(20) NOT NULL DEFAULT '1',
  `dependent` smallint(6) NOT NULL DEFAULT '0',
  `supplementary` smallint(6) NOT NULL DEFAULT '0',
  `entry_key` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`genre_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genres`
--

LOCK TABLES `genres` WRITE;
/*!40000 ALTER TABLE `genres` DISABLE KEYS */;
INSERT INTO `genres` VALUES (1,1,0,1,1,0,0,'SUBMISSION'),(2,1,1,1,3,0,1,'RESEARCHINSTRUMENT'),(3,1,2,1,3,0,1,'RESEARCHMATERIALS'),(4,1,3,1,3,0,1,'RESEARCHRESULTS'),(5,1,4,1,3,0,1,'TRANSCRIPTS'),(6,1,5,1,3,0,1,'DATAANALYSIS'),(7,1,6,1,3,0,1,'DATASET'),(8,1,7,1,3,0,1,'SOURCETEXTS'),(9,1,8,1,1,1,1,'MULTIMEDIA'),(10,1,9,1,2,1,0,'IMAGE'),(11,1,10,1,1,1,0,'STYLE'),(12,1,11,1,3,0,1,'OTHER');
/*!40000 ALTER TABLE `genres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `institutional_subscription_ip`
--

DROP TABLE IF EXISTS `institutional_subscription_ip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `institutional_subscription_ip` (
  `institutional_subscription_ip_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `subscription_id` bigint(20) NOT NULL,
  `ip_string` varchar(40) NOT NULL,
  `ip_start` bigint(20) NOT NULL,
  `ip_end` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`institutional_subscription_ip_id`),
  KEY `institutional_subscription_ip_subscription_id` (`subscription_id`),
  KEY `institutional_subscription_ip_start` (`ip_start`),
  KEY `institutional_subscription_ip_end` (`ip_end`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `institutional_subscription_ip`
--

LOCK TABLES `institutional_subscription_ip` WRITE;
/*!40000 ALTER TABLE `institutional_subscription_ip` DISABLE KEYS */;
/*!40000 ALTER TABLE `institutional_subscription_ip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `institutional_subscriptions`
--

DROP TABLE IF EXISTS `institutional_subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `institutional_subscriptions` (
  `institutional_subscription_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `subscription_id` bigint(20) NOT NULL,
  `institution_name` varchar(255) NOT NULL,
  `mailing_address` varchar(255) DEFAULT NULL,
  `domain` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`institutional_subscription_id`),
  KEY `institutional_subscriptions_subscription_id` (`subscription_id`),
  KEY `institutional_subscriptions_domain` (`domain`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `institutional_subscriptions`
--

LOCK TABLES `institutional_subscriptions` WRITE;
/*!40000 ALTER TABLE `institutional_subscriptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `institutional_subscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issue_files`
--

DROP TABLE IF EXISTS `issue_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `issue_files` (
  `file_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `issue_id` bigint(20) NOT NULL,
  `file_name` varchar(90) NOT NULL,
  `file_type` varchar(255) NOT NULL,
  `file_size` bigint(20) NOT NULL,
  `content_type` bigint(20) NOT NULL,
  `original_file_name` varchar(127) DEFAULT NULL,
  `date_uploaded` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`file_id`),
  KEY `issue_files_issue_id` (`issue_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issue_files`
--

LOCK TABLES `issue_files` WRITE;
/*!40000 ALTER TABLE `issue_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `issue_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issue_galley_settings`
--

DROP TABLE IF EXISTS `issue_galley_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `issue_galley_settings` (
  `galley_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)',
  UNIQUE KEY `issue_galley_settings_pkey` (`galley_id`,`locale`,`setting_name`),
  KEY `issue_galley_settings_galley_id` (`galley_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issue_galley_settings`
--

LOCK TABLES `issue_galley_settings` WRITE;
/*!40000 ALTER TABLE `issue_galley_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `issue_galley_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issue_galleys`
--

DROP TABLE IF EXISTS `issue_galleys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `issue_galleys` (
  `galley_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `locale` varchar(14) DEFAULT NULL,
  `issue_id` bigint(20) NOT NULL,
  `file_id` bigint(20) NOT NULL,
  `label` varchar(32) DEFAULT NULL,
  `seq` double(8,2) NOT NULL DEFAULT '0.00',
  `url_path` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`galley_id`),
  KEY `issue_galleys_issue_id` (`issue_id`),
  KEY `issue_galleys_url_path` (`url_path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issue_galleys`
--

LOCK TABLES `issue_galleys` WRITE;
/*!40000 ALTER TABLE `issue_galleys` DISABLE KEYS */;
/*!40000 ALTER TABLE `issue_galleys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issue_settings`
--

DROP TABLE IF EXISTS `issue_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `issue_settings` (
  `issue_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `issue_settings_pkey` (`issue_id`,`locale`,`setting_name`),
  KEY `issue_settings_issue_id` (`issue_id`),
  KEY `issue_settings_name_value` (`setting_name`(50),`setting_value`(150))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issue_settings`
--

LOCK TABLES `issue_settings` WRITE;
/*!40000 ALTER TABLE `issue_settings` DISABLE KEYS */;
INSERT INTO `issue_settings` VALUES (1,'id_ID','coverImage','cover_issue_1_id_ID.jpg','string'),(1,'id_ID','coverImageAltText','','string'),(1,'id_ID','description','','string'),(1,'id_ID','title','FEBRUARI','string');
/*!40000 ALTER TABLE `issue_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issues`
--

DROP TABLE IF EXISTS `issues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `issues` (
  `issue_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `journal_id` bigint(20) NOT NULL,
  `volume` smallint(6) DEFAULT NULL,
  `number` varchar(40) DEFAULT NULL,
  `year` smallint(6) DEFAULT NULL,
  `published` smallint(6) NOT NULL DEFAULT '0',
  `current` smallint(6) NOT NULL DEFAULT '0',
  `date_published` datetime DEFAULT NULL,
  `date_notified` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `access_status` smallint(6) NOT NULL DEFAULT '1',
  `open_access_date` datetime DEFAULT NULL,
  `show_volume` smallint(6) NOT NULL DEFAULT '0',
  `show_number` smallint(6) NOT NULL DEFAULT '0',
  `show_year` smallint(6) NOT NULL DEFAULT '0',
  `show_title` smallint(6) NOT NULL DEFAULT '0',
  `style_file_name` varchar(90) DEFAULT NULL,
  `original_style_file_name` varchar(255) DEFAULT NULL,
  `url_path` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`issue_id`),
  KEY `issues_journal_id` (`journal_id`),
  KEY `issues_url_path` (`url_path`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issues`
--

LOCK TABLES `issues` WRITE;
/*!40000 ALTER TABLE `issues` DISABLE KEYS */;
INSERT INTO `issues` VALUES (1,1,3,'1',2025,1,1,'2025-02-27 13:19:36',NULL,'2025-02-27 13:19:36',1,NULL,1,1,1,1,NULL,NULL,'');
/*!40000 ALTER TABLE `issues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_views`
--

DROP TABLE IF EXISTS `item_views`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_views` (
  `assoc_type` bigint(20) NOT NULL,
  `assoc_id` bigint(20) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `date_last_viewed` datetime DEFAULT NULL,
  UNIQUE KEY `item_views_pkey` (`assoc_type`,`assoc_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_views`
--

LOCK TABLES `item_views` WRITE;
/*!40000 ALTER TABLE `item_views` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_views` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_reserved_at_index` (`queue`,`reserved_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `journal_settings`
--

DROP TABLE IF EXISTS `journal_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `journal_settings` (
  `journal_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext,
  `setting_type` varchar(6) DEFAULT NULL,
  UNIQUE KEY `journal_settings_pkey` (`journal_id`,`locale`,`setting_name`),
  KEY `journal_settings_journal_id` (`journal_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `journal_settings`
--

LOCK TABLES `journal_settings` WRITE;
/*!40000 ALTER TABLE `journal_settings` DISABLE KEYS */;
INSERT INTO `journal_settings` VALUES (1,'','contactEmail','unizar@gmail.com',NULL),(1,'','contactName','UNIZAR',NULL),(1,'','contactPhone','087909888000',NULL),(1,'','copyrightHolderType','author',NULL),(1,'','copyrightYearBasis','issue',NULL),(1,'','defaultReviewMode','2',NULL),(1,'','disableSubmissions','0',NULL),(1,'','emailSignature','<br/>\n________________________________________________________________________<br/>\n<a href=\"http://202.46.155.66:6677/index.php/junizar\">Jurnal Kampus Unizar</a>',NULL),(1,'','enableAnnouncements','1',NULL),(1,'','enableOai','1',NULL),(1,'','itemsPerPage','25',NULL),(1,'','keywords','request',NULL),(1,'','licenseUrl','https://creativecommons.org/licenses/by-nc-sa/4.0',NULL),(1,'','mailingAddress','Jl. Unizar No.20, Turida, Kec. Sandubaya, Kota Mataram, Nusa Tenggara Barat',NULL),(1,'','membershipFee','0',NULL),(1,'','numPageLinks','10',NULL),(1,'','numWeeksPerResponse','4',NULL),(1,'','numWeeksPerReview','4',NULL),(1,'','publicationFee','0',NULL),(1,'','publishingMode','0',NULL),(1,'','purchaseArticleFee','0',NULL),(1,'','sidebar','[\"sidebar\"]',NULL),(1,'','styleSheet','{\"name\":\"styleSheet.css\",\"uploadName\":\"styleSheet.css\",\"dateUploaded\":\"2025-02-27 13:13:46\"}',NULL),(1,'','supportedFormLocales','[\"id_ID\"]',NULL),(1,'','supportedLocales','[\"id_ID\"]',NULL),(1,'','supportedSubmissionLocales','[\"id_ID\"]',NULL),(1,'','supportEmail','irham@gmail.com',NULL),(1,'','supportName','IRHAM',NULL),(1,'','supportPhone','085333001601',NULL),(1,'','themePluginPath','default',NULL),(1,'en_US','acronym',NULL,NULL),(1,'en_US','description',NULL,NULL),(1,'en_US','name',NULL,NULL),(1,'id_ID','abbreviation','mcd',NULL),(1,'id_ID','about','<p lang=\"en-ID\" align=\"justify\">Yayasan Pesantren Luhur Al-Azhar berdiri tahun 1979, mengambil peran di bidang pendidikan. Yayasan menganggap bidang pendidikan merupakan persoalan yang sangat urgen untuk dipecahkan. Pada saat yang bersamaan, jumlah perguruan tinggi di NTB masih sangat sedikit, tidak sebanding dengan jumlah calon mahasiswa yang terus mengalami peningkatan dari tahun ke tahun. Untuk alasan itulah, kemudian pada tanggal 10 Mei 1981 Yayasan Pesantren Luhur Al-Azhar mengeluarkan Surat Keputusan Nomor 01/YPLA/1981 tentang Pembentukan Universitas Islam Al-Azhar di Provinsi Nusa Tenggara Barat.</p>\n<p lang=\"en-ID\" align=\"justify\">Pada mulanya UNIZAR memiliki 4 (empat) Fakultas, yakni: </p>\n<p lang=\"en-ID\" align=\"justify\">(1) <strong>Fakultas Hukum</strong>: Jurusan Hukum Keperdataan dan Jurusan Hukum Pidana, yang belakangan pada tahun 1993, program nasional pendidikan tinggi ilmu hukum mengalami reorientasi pendidikan yang dilaksanakan dengan melebur seluruh jurusan menjadi program studi tunggal, yakni program studi ilmu hukum, </p>\n<p lang=\"en-ID\" align=\"justify\">(2) <strong>Fakultas Pertanian</strong>: Program Studi Sosial Ekonomi,</p>\n<p lang=\"en-ID\" align=\"justify\">(3) <strong>Fakultas Teknik</strong>: Program Studi Teknik Sipil,</p>\n<p lang=\"en-ID\" align=\"justify\">(4) <strong>Fakultas Ekonomi</strong>: Program Studi Ekonomi Pembangunan.</p>\n<p lang=\"en-ID\" align=\"justify\">Kesemuanya mendapat status terdaftar dari Menteri Pendidikan dan Kebudayaan, yang kala itu dijabat oleh Prof. Dr. Nugroho Notusanto, pada tanggal 18 Agustus 1984, dengan SK Nomor 0378/0/1984 tentang Pemberian Status Terdaftar kepada Fakultas dan Jurusan dalam Lingkungan Universitas Islam Al-Azhar di Mataram.</p>\n<p lang=\"en-ID\" align=\"justify\">Setelah itu, Rektor sekaligus pendiri Unizar, orang menyebutnya tokoh tiga zaman, H. Abdurrahim, S.H, menggagas pendirian Fakultas Kedokteran. Namun, karena berbagai persyaratan masih belum dipenuhi saat itu, maka atas saran Prof. Dr. dr. Soewignjo Soemohardjo, Sp.PD, KGEH, tahun 1990 berdirilah Fakultas Biologi. Dalam proses pengurusan ijin, atas saran dari Kopertis Wilayah VIII, namanya kemudian berubah menjadi Fakultas Matematika dan Ilmu Pengetahuan Alam (MIPA), sedangkan biologi dijadikan nama jurusan dan program studi.</p>\n<p lang=\"en-ID\" align=\"justify\">Kurang lebih dua tahun berikutnya, tepatnya tanggal 28 April 1992, Fakultas MIPA mendapat status terdaftar dari Direktur Jenderal Pendidikan Tinggi (Dirjen Dikti) dengan Keputusan Nomor 154/DIKTI/Kep/1992 tentang Pemberian Status Terdaftar kepada Jurusan Biologi Program Studi Biologi untuk Jenjang Program S1 pada Fakultas MIPA di Lingkungan Unizar di Mataram. Fakultas baru ini dianggap sebagai embrio dari Fakultas Kedokteran.</p>\n<p lang=\"en-ID\" align=\"justify\">Beberapa tahun setelahnya, tepatnya tahun 2000, gagasan untuk mendirikan Fakultas Kedokteran dimunculkan kembali, dan baru setelah 4 (empat) tahun kemudian, tepatnya pada tanggal 17 Juni 2004, Dirjen Dikti mengeluarkan Surat Ijin Penyelenggaraan, yakni dengan Surat nomor 2100/D/T/2004, perihal Ijin Penyelenggaraan Program Studi Pendidikan Dokter pada Universitas Islam Al-Azhar (Unizar) Mataram. </p>\n<p lang=\"en-ID\" align=\"justify\">Setelah itu, berdirilah Program Studi Akuntansi dengan SK Izin Operasional Nomor 500/KPT/I/2016 tanggal 7 Desember 2016. Selanjutnya, Program Studi Agroekoteknologi berdiri melalui Keputusan Menteri Pendidikan Dan Kebudayaan Republik Indonesia Nomor 1193/M/2020 tentang Izin Pembukaan Program Studi Agroekoteknologi Program Sarjana Pada Universitas Islam Al-Azhar di Kota Mataram yang diselenggarakan oleh Yayasan Pesantren Luhur Al-Azhar tanggal 30 Desember 2020.</p>\n<p lang=\"en-ID\" align=\"justify\">Saat ini terdapat enam (6) fakultas dengan 9 (sembilan) program studi di Universitas Islam Al-Azhar:</p>',NULL),(1,'id_ID','acronym','MCD',NULL),(1,'id_ID','announcementsIntroduction','<h2><a href=\"https://journal.sekawan-org.id/index.php/jsn/announcement/view/26\">Perubahan Frekuensi Terbitan</a></h2>\n<div class=\"date\"> 2025-02-10</div>\n<div class=\"summary\">\n<p>Yth. Pembaca dan Penulis,</p>\n<p>Kami informasikan bahwa mulai tahun 2025, JSN akan mengalami perubahan frekuensi terbitan. Jika sebelumnya jurnal ini diterbitkan <strong>empat kali dalam setahun</strong>, maka mulai periode tersebut jurnal akan diterbitkan <strong>dua kali dalam setahun</strong>, yaitu pada bulan <strong>Februari</strong> dan <strong>Agustus</strong></p>\n<p>Perubahan ini dilakukan untuk meningkatkan kualitas publikasi dan memberikan ruang yang lebih luas bagi proses review serta penyempurnaan setiap artikel yang diterbitkan. Kami berkomitmen untuk tetap menghadirkan karya ilmiah yang berkualitas dan bermanfaat bagi para pembaca serta komunitas akademik.</p>\n<p>Kami mengucapkan terima kasih atas dukungan dan partisipasi Bapak/Ibu selama ini.</p>\n</div>',NULL),(1,'id_ID','authorGuidelines','<h2>Pedoman Penulis</h2>\n<div class=\"page\">\n<p><strong><a href=\"https://docs.google.com/document/d/1bpZXx-uw21apEFyN7SVJGmeZPHyNHbas/edit?usp=sharing&amp;ouid=115163117247405190765&amp;rtpof=true&amp;sd=true\" target=\"_blank\" rel=\"noopener\">Download</a> : Tempelate Jurnal Sains Natural<br /></strong></p>\n<p>Jurnal Sains Natural, menerima artikel ilmiah hasil kegiatan penelitian ataupun hasil telaah literatur yang belum pernah dipublikasi sebelumnya. Naskah diketik menggunakan MS. Word, dengan tipe huruf<strong> Cambria</strong>, ukuran<strong> 11</strong>, serta ukuran <strong>kertas A4 (210 mm x 297 mm)</strong>. <strong>Margin</strong> yang digunakan adalah <strong>atas - bawah -</strong> <strong>kiri - kanan </strong>sama dengan<strong> 2.54 cm</strong></p>\n<p>Naskah dikirimkan secara <strong>online via OJS</strong> Jurnal Sains Natural yaitu <a href=\"https://journal.sekawan-org.id/index.php/jsn\">https://journal.sekawan-org.id/index.php/jsn</a></p>\n<p><span class=\"VIiyi\" lang=\"id\"><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"id\" data-language-to-translate-into=\"en\" data-phrase-index=\"0\">Semua penulis dalam artikel harus dimasukkan / diketik di OJS saat mengisi \"author\" pada proses pengiriman artikel.</span></span></p>\n<p><span class=\"VIiyi\" lang=\"id\"><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"id\" data-language-to-translate-into=\"en\" data-phrase-index=\"0\">Ditulis dalam <strong>bahasa Indonesia standar</strong>.</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"id\" data-language-to-translate-into=\"en\" data-phrase-index=\"1\"><strong>1 spasi</strong> antar baris.</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"id\" data-language-to-translate-into=\"en\" data-phrase-index=\"2\">Setiap paragraf dimulai sekitar 3 ketukan ke kanan.</span></span></p>\n<p>Sistematika penulisan artikel : Judul (Bahasa Indonesia), identitas penulis (nama, afiliasi, dan email), abstrak (bahasa Indonesia dan Inggris) sekaligus kata kuncinya, <strong>Pendahuluan, Metode, Hasil dan Pembahasan, Kesimpulan, Ucapan Terima Kasih, </strong>dan <strong>Daftar Pustaka.</strong></p>\n<p>Judul pada artikel tidak lebih dari 14 kata, dengan format <strong>rata tengah</strong>, dengan hurud <strong>Cambria</strong>, berukuran 16 pt <strong>tebal</strong> dalam bahasa Indonesia</p>\n<p>Identitas penulis, nama lengkap tanpa gelar akademik (jika penulis lebih dari 1, semua nama penulis ditulis secara lengkap beserta afiliasi dan email dari setiap penulis) menggunakan huruf Cambria dengan ukuran 12 pt untuk nama penulis, 10 pt untuk afiliasi dan email penulis</p>\n<p><span class=\"VIiyi\" lang=\"id\"><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"id\" data-language-to-translate-into=\"en\" data-phrase-index=\"0\">Abstrak ditulis dalam Bahasa Indonesia dan Bahasa Inggris menggunakan 1 spasi disertai 3-5 kata atau frase kata kunci (ditulis dalam abjad), menggunakan Cambria dengan ukuran huruf 10 pt.</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"id\" data-language-to-translate-into=\"en\" data-phrase-index=\"1\">Panjang abstrak bahasa Indonesia antara 150-250 kata (Abstrak Inggris menyesuaikan).</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"id\" data-language-to-translate-into=\"en\" data-phrase-index=\"2\">Abstrak ditulis dalam satu paragraf, minimal memuat tujuan, metode, hasil penelitian, dan kesimpulan.</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"id\" data-language-to-translate-into=\"en\" data-phrase-index=\"3\">Abstrak dan kata kunci yang dimasukkan dalam OJS bersifat abstrak, dan kata kunci dalam bahasa Inggris.</span></span></p>\n<p><span class=\"VIiyi\" lang=\"id\"><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"id\" data-language-to-translate-into=\"en\" data-phrase-index=\"3\"><strong>Pendahuluan</strong>, b</span></span>agian ini berisi analisis situasi pada mitra pengabdian, rumusan permasalahan yang ditemui, serta opsi solusi/metode yang ditawarkan. Bagian ini juga berisi teori pendukung terhadap solusi atau metode yang digunakan dalam mewujudkan kegiatan pengabdian kepada masyarakat</p>\n<p><strong>Metode</strong>, bagian ini berisi tahapan pelaksanaan kegiatan, teknik atau bentuk kegiatan, serta gambaran pelaksanaannya. Metode sebaiknya dibuat dalam bentuk <em>flowchart</em> atau diagram serta dijelaskan. Jika metode yang digunakan berasal dari sumber lain agar mencantumkan sitasinya</p>\n<p><strong>Hasil dan Pembahasan</strong>, Bagian ini berisi uraian hasil dan pembahasan rinci dari penelitian atau telaah literatur  yang  telah dilaksanakan</p>\n<p><strong>Kesimpulan</strong>, Bagian ini berisi kesimpulan dari penelitian serta saran keberlanjutan atau peluang riset lanjutan</p>\n<p><strong>Ucapan Terima Kasih</strong>, Bagian ini berisi ucapan termakasih kepada pihak terkait, biasanya pada institusi atau perusahaan yang mendanai kegiatan penelitian yang dilaksanakan</p>\n<p><strong>Daftar Pustaka</strong>, Berisi seluruh pustaka yang menjadi acuan dalam artikel dengan ukuran huruf 10pt. Gunakan format APA Style dan jumlah referensi minimal 5.</p>\n</div>',NULL),(1,'id_ID','authorInformation','Tertarik menerbitkan jurnal? Kami merekomendasikan Anda mereview halaman <a href=\"http://202.46.155.66:6677/index.php/junizar/about\">Tentang Kami </a>untuk kebijakan bagian jurnal serta <a href=\"http://202.46.155.66:6677/index.php/junizar/about/submissions#authorGuidelines\">Petunjuk Penulis </a>. Penulis perlu <a href=\"http://202.46.155.66:6677/index.php/junizar/user/register\">Mendaftar </a>dengan jurnal sebelum menyerahkan atau jika sudah terdaftar <a href=\"http://202.46.155.66:6677/index.php/index/login\">login</a>dan mulai proses lima langkah.',NULL),(1,'id_ID','clockssLicense','Journal ini memakai sistem CLOCKSS untum membuat sistem pengarsipan terdistribusi di antara pustaka yang turut berpartisipasi dan mengizinkan pustaka tersebut membuat arsip jurnal secara permanen untuk tujuan pemeliharaan dan pemulihan. <a href=\"http://clockss.org/\">More...</a>',NULL),(1,'id_ID','contactAffiliation','ojs',NULL),(1,'id_ID','description','<p><strong>UNIZAR: Jurnal Studi Keislaman</strong> memuat kajian keislaman yang meliputi pendidikan, hukum, ekonomi, dan pemikiran islam, serta kajian islam lainnya. Terbit dua kali setahun, yaitu bulan Juni dan Desember. Diterbitkan oleh Sekolah Tinggi Agama Islam Hasan Jufri Bawean, E-ISSN: <strong><a href=\"https://issn.brin.go.id/terbit/detail/1489511577\" target=\"_blank\" rel=\"noopener\" data-original-attrs=\"{&quot;data-original-href&quot;:&quot;http://issn.pdii.lipi.go.id/issn.cgi?daftar&amp;1489511577&quot;,&quot;target&quot;:&quot;_blank&quot;}\">2579-5503</a></strong>  P-ISSN: <a href=\"https://issn.brin.go.id/terbit/detail/1430760000\" target=\"_blank\" rel=\"noopener\" data-original-attrs=\"{&quot;data-original-href&quot;:&quot;http://issn.pdii.lipi.go.id/issn.cgi?daftar&amp;1430760000&quot;,&quot;target&quot;:&quot;_blank&quot;}\"><strong>2443-2741</strong></a></p>',NULL),(1,'id_ID','editorialTeam','<p>1. MUHAMMAD ISA ASRORI</p>\n<p>2. IRHAM</p>',NULL),(1,'id_ID','favicon','{\"name\":\"LOGO-removebg-preview (2).png\",\"uploadName\":\"favicon_id_ID.png\",\"width\":100,\"height\":100,\"dateUploaded\":\"2025-02-25 02:24:07\",\"altText\":\"\"}',NULL),(1,'id_ID','homepageImage','{\"name\":\"cover_issue_23_en_US.jpg\",\"uploadName\":\"homepageImage_id_ID.jpg\",\"width\":1131,\"height\":1600,\"dateUploaded\":\"2025-02-25 03:39:13\",\"altText\":\"\"}',NULL),(1,'id_ID','journalThumbnail','{\"name\":\"LOGO-removebg-preview (2).png\",\"uploadName\":\"journalThumbnail_id_ID.png\",\"width\":100,\"height\":100,\"dateUploaded\":\"2025-02-25 02:24:03\",\"altText\":\"\"}',NULL),(1,'id_ID','librarianInformation','Kami mendorong pustakawan riset untuk mendaftar jurnal diantara pemegang jurnal eletronik perpustakaan. Begitu juga, ini mungkin berharga bahwa sistem penerbitan sumber terbuka jurnal cocok untuk perpustakaan untuk menjadi tuan rumah untuk anggota fakultas untuk menggunakan jurnal saat mereka terlibat dalam proses editing. (Lihat <a href=\"http://pkp.sfu.ca/ojs\">Open Journal Systems</a>).',NULL),(1,'id_ID','lockssLicense','OJS sistem LOCKSS berfungsi sebagai sistem pengarsipan terdistribusi antar-perpustakaan yang menggunakan sistem ini dengan tujuan membuat arsip permanen (untuk preservasi dan restorasi). <a href=\"http://www.lockss.org/\">Lanjut...</a>',NULL),(1,'id_ID','name','Medical Community Dedication',NULL),(1,'id_ID','openAccessPolicy','Jurnal ini menyediakan akses terbuka yang pada prinsipnya membuat riset tersedia secara gratis untuk publik dan akan mensupport pertukaran pengetahuan global terbesar.',NULL),(1,'id_ID','pageFooter','<div class=\"elementor-element elementor-element-625180a2 elementor-widget elementor-widget-image\" data-id=\"625180a2\" data-element_type=\"widget\" data-widget_type=\"image.default\">\n<div class=\"elementor-widget-container\">\n<div class=\"elementor-element elementor-element-625180a2 elementor-widget elementor-widget-image\" data-id=\"625180a2\" data-element_type=\"widget\" data-widget_type=\"image.default\">\n<div class=\"elementor-widget-container\"><img class=\"attachment-medium size-medium wp-image-3597\" src=\"https://unizar.ac.id/wp-content/uploads/2022/08/LOGO_UNIZAR_TEXT-PUTIH.png\" alt=\"\" width=\"300\" height=\"100\" /></div>\n</div>\n<div class=\"elementor-element elementor-element-6a0ce8db elementor-widget elementor-widget-text-editor\" data-id=\"6a0ce8db\" data-element_type=\"widget\" data-widget_type=\"text-editor.default\">\n<div class=\"elementor-widget-container\">\n<p>Diselenggarakan oleh<br /><strong>Yayasan Pesantren Luhur Al-Azhar</strong><br />Jl. Unizar No.20, Turida, Kec. Sandubaya, Kota Mataram, Nusa Tenggara Barat</p>\n<ul>\n<li>Telepon : <span role=\"link\" aria-label=\"Hubungi Nomor Telepon (0370) 6175565\">(0370) 7562077<br /></span></li>\n<li>Fax : <span role=\"link\" aria-label=\"Hubungi Nomor Telepon (0370) 6175565\">(0370) 7562077<br /></span></li>\n<li>Email : mail@unizar.ac.id</li>\n</ul>\n</div>\n</div>\n<div class=\"elementor-element elementor-element-7cba98b elementor-shape-circle e-grid-align-left elementor-grid-0 elementor-widget elementor-widget-social-icons\" data-id=\"7cba98b\" data-element_type=\"widget\" data-widget_type=\"social-icons.default\">\n<div class=\"elementor-widget-container\">\n<div class=\"elementor-social-icons-wrapper elementor-grid\"><span class=\"elementor-grid-item\"><a class=\"elementor-icon elementor-social-icon elementor-social-icon-facebook elementor-repeater-item-8add3b3\" href=\"https://www.facebook.com/officialunizarmataram/\" target=\"_blank\" rel=\"noopener\"><span class=\"elementor-screen-only\">Facebook</span></a></span> <span class=\"elementor-grid-item\"><a class=\"elementor-icon elementor-social-icon elementor-social-icon-x-twitter elementor-repeater-item-b1a3251\" href=\"https://twitter.com/mataramunizar\" target=\"_blank\" rel=\"noopener\"><span class=\"elementor-screen-only\">X-twitter</span></a></span> <span class=\"elementor-grid-item\"><a class=\"elementor-icon elementor-social-icon elementor-social-icon-youtube elementor-repeater-item-af5a59f\" href=\"https://www.youtube.com/c/UNIZARChannel\" target=\"_blank\" rel=\"noopener\"><span class=\"elementor-screen-only\">Youtube</span></a></span></div>\n</div>\n</div>\n</div>\n</div>',NULL),(1,'id_ID','pageHeaderLogoImage','{\"name\":\"pageHeader 1.png\",\"uploadName\":\"pageHeaderLogoImage_id_ID.png\",\"width\":2398,\"height\":353,\"dateUploaded\":\"2025-02-27 03:24:37\",\"altText\":\"\"}',NULL),(1,'id_ID','privacyStatement','<p>Nama dan alamat email yang dimasukkan di website ini hanya akan digunakan untuk tujuan yang sudah disebutkan, tidak akan disalahgunakan untuk tujuan lain atau untuk disebarluaskan ke pihak lain.</p>',NULL),(1,'id_ID','readerInformation','Kami mendorong pembaca untuk mendaftarkan diri di layanan notifikasi penerbitan untuk jurnal ini. Gunakan tautan <a href=\"http://202.46.155.66:6677/index.php/junizar/user/register\">Daftar</a>di bagian atas beranda jurnal. Dengan mendaftar, pembaca akan memperoleh email berisi Daftar Isi tiap ada terbitan jurnal baru. Daftar ini juga membuat jurnal dapat mengetahui tingkat dukungan atau jumlah pembaca. Lihat jurnal <a href=\"http://202.46.155.66:6677/index.php/junizar/about/submissions#privacyStatement\">Pernyataan Privasi</a>, yang meyakinkan pembaca bahwa nama dan alamat email yang didaftarkan tidak akan digunakan untuk tujuan lain.',NULL),(1,'id_ID','submissionChecklist','[{\"order\":1,\"content\":\"Naskah belum pernah diterbitkan sebelumnya, dan tidak sedang dalam pertimbangan untuk diterbitkan di jurnal lain (atau sudah dijelaskan dalam Komentar kepada Editor).\"},{\"order\":2,\"content\":\"File naskah dalam format dokumen OpenOffice, Microsoft Word, atau RTF.\"},{\"order\":3,\"content\":\"Referensi yang dapat diakses online telah dituliskan URL-nya.\"},{\"order\":4,\"content\":\"Naskah diketik dengan teks 1 spasi; font 12; menggunakan huruf miring, bukan huruf bergaris bawah (kecuali alamat URL); dan semua ilustrasi, gambar, dan tabel diletakkan dalam teks pada tempat yang diharapkan, bukan dikelompokkan tersendiri di akhir naskah.\"},{\"order\":5,\"content\":\"Naskah mengikuti aturan gaya selingkung dan bibliografi yang disyaratkan dalam Panduan Penulis.\"}]',NULL);
/*!40000 ALTER TABLE `journal_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `journals`
--

DROP TABLE IF EXISTS `journals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `journals` (
  `journal_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `path` varchar(32) NOT NULL,
  `seq` double(8,2) NOT NULL DEFAULT '0.00' COMMENT 'Used to order lists of journals',
  `primary_locale` varchar(14) NOT NULL,
  `enabled` smallint(6) NOT NULL DEFAULT '1' COMMENT 'Controls whether or not the journal is considered "live" and will appear on the website. (Note that disabled journals may still be accessible, but only if the user knows the URL.)',
  PRIMARY KEY (`journal_id`),
  UNIQUE KEY `journals_path` (`path`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `journals`
--

LOCK TABLES `journals` WRITE;
/*!40000 ALTER TABLE `journals` DISABLE KEYS */;
INSERT INTO `journals` VALUES (1,'mcd',1.00,'id_ID',1);
/*!40000 ALTER TABLE `journals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `library_file_settings`
--

DROP TABLE IF EXISTS `library_file_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `library_file_settings` (
  `file_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object|date)',
  UNIQUE KEY `library_file_settings_pkey` (`file_id`,`locale`,`setting_name`),
  KEY `library_file_settings_id` (`file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `library_file_settings`
--

LOCK TABLES `library_file_settings` WRITE;
/*!40000 ALTER TABLE `library_file_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `library_file_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `library_files`
--

DROP TABLE IF EXISTS `library_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `library_files` (
  `file_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `context_id` bigint(20) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `original_file_name` varchar(255) NOT NULL,
  `file_type` varchar(255) NOT NULL,
  `file_size` bigint(20) NOT NULL,
  `type` smallint(6) NOT NULL,
  `date_uploaded` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  `submission_id` bigint(20) NOT NULL,
  `public_access` smallint(6) DEFAULT '0',
  PRIMARY KEY (`file_id`),
  KEY `library_files_context_id` (`context_id`),
  KEY `library_files_submission_id` (`submission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `library_files`
--

LOCK TABLES `library_files` WRITE;
/*!40000 ALTER TABLE `library_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `library_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metadata_description_settings`
--

DROP TABLE IF EXISTS `metadata_description_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `metadata_description_settings` (
  `metadata_description_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `metadata_descripton_settings_pkey` (`metadata_description_id`,`locale`,`setting_name`),
  KEY `metadata_description_settings_id` (`metadata_description_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metadata_description_settings`
--

LOCK TABLES `metadata_description_settings` WRITE;
/*!40000 ALTER TABLE `metadata_description_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `metadata_description_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metadata_descriptions`
--

DROP TABLE IF EXISTS `metadata_descriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `metadata_descriptions` (
  `metadata_description_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `assoc_type` bigint(20) NOT NULL DEFAULT '0',
  `assoc_id` bigint(20) NOT NULL DEFAULT '0',
  `schema_namespace` varchar(255) NOT NULL,
  `schema_name` varchar(255) NOT NULL,
  `display_name` varchar(255) DEFAULT NULL,
  `seq` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`metadata_description_id`),
  KEY `metadata_descriptions_assoc` (`assoc_type`,`assoc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metadata_descriptions`
--

LOCK TABLES `metadata_descriptions` WRITE;
/*!40000 ALTER TABLE `metadata_descriptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `metadata_descriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metrics`
--

DROP TABLE IF EXISTS `metrics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `metrics` (
  `load_id` varchar(255) NOT NULL,
  `context_id` bigint(20) NOT NULL,
  `pkp_section_id` bigint(20) DEFAULT NULL,
  `assoc_object_type` bigint(20) DEFAULT NULL,
  `assoc_object_id` bigint(20) DEFAULT NULL,
  `submission_id` bigint(20) DEFAULT NULL,
  `representation_id` bigint(20) DEFAULT NULL,
  `assoc_type` bigint(20) NOT NULL,
  `assoc_id` bigint(20) NOT NULL,
  `day` varchar(8) DEFAULT NULL,
  `month` varchar(6) DEFAULT NULL,
  `file_type` smallint(6) DEFAULT NULL,
  `country_id` varchar(2) DEFAULT NULL,
  `region` varchar(2) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `metric_type` varchar(255) NOT NULL,
  `metric` int(11) NOT NULL,
  KEY `metrics_load_id` (`load_id`),
  KEY `metrics_metric_type_context_id` (`metric_type`,`context_id`),
  KEY `metrics_metric_type_submission_id_assoc_type` (`metric_type`,`submission_id`,`assoc_type`),
  KEY `metrics_metric_type_submission_id_assoc` (`metric_type`,`context_id`,`assoc_type`,`assoc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metrics`
--

LOCK TABLES `metrics` WRITE;
/*!40000 ALTER TABLE `metrics` DISABLE KEYS */;
INSERT INTO `metrics` VALUES ('usage_events_20250225.log',1,NULL,NULL,NULL,NULL,NULL,256,1,'20250225','202502',NULL,NULL,NULL,NULL,'ojs::counter',54),('usage_events_20250225.log',1,NULL,NULL,NULL,NULL,NULL,259,1,'20250225','202502',NULL,NULL,NULL,NULL,'ojs::counter',5),('usage_events_20250225.log',1,1,259,1,3,NULL,1048585,3,'20250225','202502',NULL,NULL,NULL,NULL,'ojs::counter',3),('usage_events_20250226.log',1,NULL,NULL,NULL,NULL,NULL,256,1,'20250226','202502',NULL,NULL,NULL,NULL,'ojs::counter',7),('usage_events_20250227.log',1,NULL,NULL,NULL,NULL,NULL,256,1,'20250227','202502',NULL,NULL,NULL,NULL,'ojs::counter',111),('usage_events_20250227.log',1,NULL,NULL,NULL,NULL,NULL,259,1,'20250227','202502',NULL,NULL,NULL,NULL,'ojs::counter',14),('usage_events_20250227.log',1,1,259,1,3,NULL,1048585,3,'20250227','202502',NULL,NULL,NULL,NULL,'ojs::counter',13),('usage_events_20250227.log',1,1,259,1,7,NULL,1048585,7,'20250227','202502',NULL,NULL,NULL,NULL,'ojs::counter',6),('usage_events_20250228.log',1,NULL,NULL,NULL,NULL,NULL,256,1,'20250228','202502',NULL,NULL,NULL,NULL,'ojs::counter',1);
/*!40000 ALTER TABLE `metrics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `navigation_menu_item_assignment_settings`
--

DROP TABLE IF EXISTS `navigation_menu_item_assignment_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `navigation_menu_item_assignment_settings` (
  `navigation_menu_item_assignment_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `navigation_menu_item_assignment_settings_pkey` (`navigation_menu_item_assignment_id`,`locale`,`setting_name`),
  KEY `assignment_settings_navigation_menu_item_assignment_id` (`navigation_menu_item_assignment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `navigation_menu_item_assignment_settings`
--

LOCK TABLES `navigation_menu_item_assignment_settings` WRITE;
/*!40000 ALTER TABLE `navigation_menu_item_assignment_settings` DISABLE KEYS */;
INSERT INTO `navigation_menu_item_assignment_settings` VALUES (93,'id_ID','title','HOME','string'),(94,'id_ID','title','TENTANG KAMI','string'),(95,'id_ID','title','PROFIL','string'),(96,'id_ID','title','SEJARAH JURNAL','string'),(97,'id_ID','title','DEWAN EDITRO','string'),(98,'id_ID','title','TERBITAN','string'),(99,'id_ID','title','TERKINI','string'),(100,'id_ID','title','ARSIP','string'),(101,'id_ID','title','PENGUMUMAN','string'),(102,'id_ID','title','KONTAK','string');
/*!40000 ALTER TABLE `navigation_menu_item_assignment_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `navigation_menu_item_assignments`
--

DROP TABLE IF EXISTS `navigation_menu_item_assignments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `navigation_menu_item_assignments` (
  `navigation_menu_item_assignment_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `navigation_menu_id` bigint(20) NOT NULL,
  `navigation_menu_item_id` bigint(20) NOT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `seq` bigint(20) DEFAULT '0',
  PRIMARY KEY (`navigation_menu_item_assignment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `navigation_menu_item_assignments`
--

LOCK TABLES `navigation_menu_item_assignments` WRITE;
/*!40000 ALTER TABLE `navigation_menu_item_assignments` DISABLE KEYS */;
INSERT INTO `navigation_menu_item_assignments` VALUES (1,1,1,0,0),(2,1,2,0,1),(3,1,3,0,2),(4,1,4,3,0),(5,1,5,3,1),(6,1,6,3,2),(7,1,7,3,3),(54,2,8,0,0),(55,2,9,0,1),(56,2,10,0,2),(57,2,11,10,3),(58,2,12,10,4),(59,2,13,10,5),(60,2,14,10,6),(93,3,25,0,0),(94,3,26,0,1),(95,3,27,26,2),(96,3,28,26,3),(97,3,33,0,4),(98,3,29,0,5),(99,3,30,29,6),(100,3,31,29,7),(101,3,32,0,8),(102,3,23,0,9);
/*!40000 ALTER TABLE `navigation_menu_item_assignments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `navigation_menu_item_settings`
--

DROP TABLE IF EXISTS `navigation_menu_item_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `navigation_menu_item_settings` (
  `navigation_menu_item_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` longtext,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `navigation_menu_item_settings_pkey` (`navigation_menu_item_id`,`locale`,`setting_name`),
  KEY `navigation_menu_item_settings_navigation_menu_id` (`navigation_menu_item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `navigation_menu_item_settings`
--

LOCK TABLES `navigation_menu_item_settings` WRITE;
/*!40000 ALTER TABLE `navigation_menu_item_settings` DISABLE KEYS */;
INSERT INTO `navigation_menu_item_settings` VALUES (1,'','titleLocaleKey','navigation.register','string'),(2,'','titleLocaleKey','navigation.login','string'),(3,'','titleLocaleKey','{$loggedInUsername}','string'),(4,'','titleLocaleKey','navigation.dashboard','string'),(5,'','titleLocaleKey','common.viewProfile','string'),(6,'','titleLocaleKey','navigation.admin','string'),(7,'','titleLocaleKey','user.logOut','string'),(8,'','titleLocaleKey','navigation.register','string'),(9,'','titleLocaleKey','navigation.login','string'),(10,'','titleLocaleKey','{$loggedInUsername}','string'),(11,'','titleLocaleKey','navigation.dashboard','string'),(12,'','titleLocaleKey','common.viewProfile','string'),(13,'','titleLocaleKey','navigation.admin','string'),(14,'','titleLocaleKey','user.logOut','string'),(15,'','titleLocaleKey','navigation.current','string'),(16,'','titleLocaleKey','navigation.archives','string'),(17,'','titleLocaleKey','manager.announcements','string'),(18,'','titleLocaleKey','navigation.about','string'),(19,'','titleLocaleKey','about.aboutContext','string'),(20,'','titleLocaleKey','about.submissions','string'),(21,'','titleLocaleKey','about.editorialTeam','string'),(22,'','titleLocaleKey','manager.setup.privacyStatement','string'),(23,'','titleLocaleKey','about.contact','string'),(23,'id_ID','content','','string'),(23,'id_ID','remoteUrl','http://202.46.155.66:6677/index.php/mcd/kontak','string'),(23,'id_ID','title','KONTAK','string'),(24,'','titleLocaleKey','common.search','string'),(25,'id_ID','content','','string'),(25,'id_ID','remoteUrl','http://202.46.155.66:6677/index.php/mcd','string'),(25,'id_ID','title','HOME','string'),(26,'id_ID','content','','string'),(26,'id_ID','remoteUrl','','string'),(26,'id_ID','title','TENTANG KAMI','string'),(27,'id_ID','content','','string'),(27,'id_ID','remoteUrl','http://202.46.155.66:6677/index.php/mcd/profil','string'),(27,'id_ID','title','PROFIL','string'),(28,'id_ID','content','<p>Yayasan Pesantren Luhur Al-Azhar berdiri tahun 1979, mengambil peran di bidang pendidikan. Yayasan menganggap bidang pendidikan merupakan persoalan yang sangat urgen untuk dipecahkan. Pada saat yang bersamaan, jumlah perguruan tinggi di NTB masih sangat sedikit, tidak sebanding dengan jumlah calon mahasiswa yang terus mengalami peningkatan dari tahun ke tahun. Untuk alasan itulah, kemudian pada tanggal 10 Mei 1981 Yayasan Pesantren Luhur Al-Azhar mengeluarkan Surat Keputusan Nomor 01/YPLA/1981 tentang Pembentukan Universitas Islam Al-Azhar di Provinsi Nusa Tenggara Barat.</p>','string'),(28,'id_ID','remoteUrl','','string'),(28,'id_ID','title','SEJARAH JURNAL','string'),(29,'id_ID','content','','string'),(29,'id_ID','remoteUrl','','string'),(29,'id_ID','title','TERBITAN','string'),(30,'id_ID','content','','string'),(30,'id_ID','remoteUrl','','string'),(30,'id_ID','title','TERKINI','string'),(31,'id_ID','content','','string'),(31,'id_ID','remoteUrl','','string'),(31,'id_ID','title','ARSIP','string'),(32,'id_ID','content','','string'),(32,'id_ID','remoteUrl','','string'),(32,'id_ID','title','PENGUMUMAN','string'),(33,'id_ID','content','','string'),(33,'id_ID','remoteUrl','http://202.46.155.66:6677/index.php/mcd/editorial-team','string'),(33,'id_ID','title','DEWAN EDITOR','string'),(34,'id_ID','content','<p><strong>JUNZIAR: Jurnal UNIZAR</strong>(eISSN&nbsp;<a href=\"https://issn.brin.go.id/terbit/detail/20230207330938918\" target=\"_blank\" rel=\"noopener\">2987-3258</a>) : merupakan Jurnal Ilmiah bidang sains dan eksakta yang dikelola oleh Pusat Penelitian dan Pengembangan (PUSLITBANG) SEKAWAN Institue Nusa Tenggara. Jurnal ini dikelola oleh para dosen dan praktisi yang berasal dari berbagai&nbsp;<em>background</em>&nbsp;perguruan tinggi di Indonesia khususnya NTB. Jurnal Sains Natural (JSN) terbit 4 (empat) kali dalam 1 tahun yaitu setiap bulan Februari, Mei, Agustus<strong>,&nbsp;</strong>dan November. Akan tetapi mulai tahun 2025, JSN terbit 2 (dua) kali setahun, yaitu&nbsp;<strong>Februari</strong>&nbsp;dan&nbsp;<strong>Agustus</strong>. Cakupan dan Fokus Jurnal ini pada Bidang Ilmu Sains&nbsp; dan atau yang serumpun dengannya dengan cakupan tema seperti Biologi, Kimia, Fisika, Matematika, Statistik, Ilmu Komputer, Sains Data dan lainnya yang masih serumpun dengan bidang Ilmu Sains dan Eksakta.</p>\r\n<p><strong>JUNIZAR</strong>&nbsp;dipublikasikan oleh PUSLITBANG SEKAWAN Institue Nusa Tenggara.</p>','string'),(34,'id_ID','title','PROFIL','string'),(35,'id_ID','content','<h1 class=\"page_title\">&nbsp;</h1>\r\n<p>FOKUS<br>Fokus jurnal ini adalah upaya mengaktualkan pemahaman yang lebih baik tentang keilmuan dan pemikiran Islam, baik lokal maupun internasional melalui publikasi artikel, laporan penelitian, dan ulasan buku.</p>\r\n<p>RUANG LINGKUP<br>Berisi kajian-kajian keislaman yang meliputi pendidikan, hukum, ekonomi, dan pemikiran islam, serta kajian islam lainnya</p>\r\n<p>_____________________</p>\r\n<p>FOCUS<br>The focus of this journal is efforts to actualize a better understanding of Islamic scholarship and thought, both locally and internationally through the publication of articles, research reports and book reviews.</p>\r\n<p>SCOPE<br>Contains Islamic studies which include education, law, economics, and Islamic thought, as well as other Islamic studies</p>','string'),(35,'id_ID','title','Focus dan Scope','string'),(36,'id_ID','content','<div id=\"pkp_content_main\" class=\"pkp_structure_main\" role=\"main\">\r\n<div class=\"page\">\r\n<table width=\"100%\">\r\n<tbody>\r\n<tr bgcolor=\"#4b8b3b\">\r\n<td style=\"padding-top: 10px; padding-bottom: 10px; padding-left: 5px;\" colspan=\"5\" align=\"center\"><strong><span style=\"color: white; font-family: Arial;\">KETUA REDAKSI</span></strong></td>\r\n</tr>\r\n<tr bgcolor=\"#F8F8FF\">\r\n<td style=\"padding-top: 5px;\" colspan=\"5\" align=\"center\"><img style=\"width: 360px; height: 360px; border-radius: 50%;\" src=\"http://202.46.155.66:6677/public/site/images/username_ojs/bingung-removebg-preview.png\"><br><strong><a>Muhammad Isa Asrori</a></strong><br>Politeknik Medica Farma Husada Mataram<br><em>[Biologi, Mikrobiologi]</em><br>|<a href=\"https://scholar.google.com/citations?user=CAdswlAAAAAJ&amp;hl=id\" target=\"_blank\" rel=\"noopener\"><img src=\"https://journal.sekawan-org.id/public/site/images/yunus024/scholarl1.png\"></a>|<a href=\"https://sinta.kemdikbud.go.id/authors/profile/185233&amp;view=overview\" target=\"_blank\" rel=\"noopener\"><img src=\"https://journal.sekawan-org.id/public/site/images/yunus024/sintal1.jpg\"></a>|</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<div>&nbsp;</div>\r\n<table width=\"100%\">\r\n<tbody>\r\n<tr bgcolor=\"#4b8b3b\">\r\n<td style=\"padding-top: 10px; padding-bottom: 10px; padding-left: 5px;\" colspan=\"10\" align=\"center\"><strong><span style=\"color: white; font-family: Arial;\">REDAKSI PELAKSANA</span></strong></td>\r\n</tr>\r\n<tr bgcolor=\"#F8F8FF\">\r\n<td style=\"padding-top: 5px;\" colspan=\"5\" align=\"center\" valign=\"top\"><img style=\"width: 225px; height: 225px; border-radius: 50%;\" src=\"http://202.46.155.66:6677/public/site/images/username_ojs/images.png\"><br><a><strong>Dhika Juliana Sukmana</strong></a><br>Politeknik Kesehatan Yogyakarta<br><em>[Imunoserologi, Biologi Molekuler]</em><br>|<a href=\"https://scholar.google.com/citations?user=OWng_fQAAAAJ&amp;hl=id\" target=\"_blank\" rel=\"noopener\"><img src=\"/public/site/images/yunus024/scholarl1.png\"></a>|<a href=\"https://sinta.kemdikbud.go.id/authors/profile/6723106\" target=\"_blank\" rel=\"noopener\"><img src=\"/public/site/images/yunus024/sintal1.jpg\"></a>|<strong><a href=\"https://www.scopus.com/authid/detail.uri?authorId=57217256293\" target=\"_blank\" rel=\"noopener\"><img src=\"https://journal.sekawan-org.id/public/site/images/yunus024/Scopus_type_logo1.jpg\"></a>|</strong></td>\r\n<td style=\"padding-top: 5px;\" colspan=\"5\" align=\"center\" width=\"50%\"><img style=\"width: 225px; height: 225px; border-radius: 50%;\" src=\"http://202.46.155.66:6677/public/site/images/username_ojs/images-c15a50d9a3640bdae0bb816e4ed1cfb0.png\"><br><a><strong>Baiq Isti Hijriani</strong></a><br>Politeknik Medika Farma Husada Mataram<br><em>[Mikrobiologi]</em><br>|<a href=\"https://scholar.google.com/citations?user=-NyEFcEAAAAJ&amp;hl=id\" target=\"_blank\" rel=\"noopener\"><img src=\"https://journal.sekawan-org.id/public/site/images/yunus024/scholarl1.png\"></a>|<a href=\"https://sinta.kemdikbud.go.id/authors/profile/6790096\" target=\"_blank\" rel=\"noopener\"><img src=\"https://journal.sekawan-org.id/public/site/images/yunus024/sintal1.jpg\"></a>|</td>\r\n</tr>\r\n<tr bgcolor=\"#F8F8FF\">\r\n<td style=\"padding-top: 5px;\" colspan=\"5\" align=\"center\" valign=\"top\"><img style=\"width: 225px; height: 225px; border-radius: 50%;\" src=\"http://202.46.155.66:6677/public/site/images/username_ojs/images-4bae79cb2201834b1bc177a465a493e7.png\"><br><a><strong>Roushandy Asri Fardani<br></strong></a>Politeknik Medika Farma Husada Mataram<br><em>[Kimia]</em><br>|<a href=\"https://scholar.google.com/citations?user=dG3M2hgAAAAJ&amp;hl=id\" target=\"_blank\" rel=\"noopener\"><img src=\"/public/site/images/yunus024/scholarl1.png\"></a>|<a href=\"https://sinta.kemdikbud.go.id/authors/profile/6682339\" target=\"_blank\" rel=\"noopener\"><img src=\"https://journal.sekawan-org.id/public/site/images/yunus024/sintal1.jpg\"></a>|</td>\r\n<td style=\"padding-top: 5px;\" colspan=\"5\" align=\"center\" width=\"50%\"><img style=\"width: 360px; height: 360px; border-radius: 50%;\" src=\"http://202.46.155.66:6677/public/site/images/username_ojs/bingung-removebg-preview-a9d4ec8ea69022372cc333b149e76114.png\" width=\"112\" height=\"120\"><br><a><strong>Siti Soraya<br></strong></a>Universitas Bumigora<br><em>[Statistika]</em><br>|<a href=\"https://scholar.google.com/citations?user=qbj2gQIAAAAJ&amp;hl=en&amp;oi=ao\" target=\"_blank\" rel=\"noopener\"><img src=\"/public/site/images/yunus024/scholarl1.png\"></a>|<a href=\"https://sinta.kemdikbud.go.id/authors/profile/5994189\" target=\"_blank\" rel=\"noopener\"><img src=\"/public/site/images/yunus024/sintal1.jpg\"></a>|<a href=\"https://www.scopus.com/authid/detail.uri?authorId=57209226434\" target=\"_blank\" rel=\"noopener\"><img src=\"https://journal.sekawan-org.id/public/site/images/yunus024/Scopus_type_logo1.jpg\"></a>|</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<div>&nbsp;</div>\r\n<table width=\"100%\">\r\n<tbody>\r\n<tr bgcolor=\"#4b8b3b\">\r\n<td style=\"padding-top: 10px; padding-bottom: 10px; padding-left: 5px;\" colspan=\"5\" align=\"center\"><strong><span style=\"color: white; font-family: Arial;\">PEMERIKSA NASKAH</span></strong></td>\r\n</tr>\r\n<tr bgcolor=\"#F8F8FF\">\r\n<td style=\"padding-top: 5px;\" colspan=\"5\" align=\"center\"><img style=\"width: 360px; height: 360px; border-radius: 50%;\" src=\"http://202.46.155.66:6677/public/site/images/username_ojs/bingung-removebg-preview-d6beb6d1824216c35139809b588b90ab.png\"><br><strong><a>Abdurahim</a></strong><br>Universitas Mataram<br><em>[Matematika]</em><br>|<a href=\"https://scholar.google.co.id/citations?user=giY-rPUAAAAJ&amp;hl=id\" target=\"_blank\" rel=\"noopener\"><img src=\"https://journal.sekawan-org.id/public/site/images/yunus024/scholarl1.png\"></a>|<a href=\"https://sinta.kemdikbud.go.id/authors/profile/5992938&amp;view=overview\" target=\"_blank\" rel=\"noopener\"><img src=\"https://journal.sekawan-org.id/public/site/images/yunus024/sintal1.jpg\"></a>|<a href=\"https://www.scopus.com/authid/detail.uri?authorId=57209227329\" target=\"_blank\" rel=\"noopener\"><img src=\"https://journal.sekawan-org.id/public/site/images/yunus024/Scopus_type_logo1.jpg\"></a>|</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<div>&nbsp;</div>\r\n</div>\r\n</div>','string'),(36,'id_ID','title','Dewan Editor','string'),(37,'id_ID','content','<div class=\"elementor-element elementor-element-625180a2 elementor-widget elementor-widget-image\" data-id=\"625180a2\" data-element_type=\"widget\" data-widget_type=\"image.default\">\r\n<div class=\"elementor-widget-container\"><strong>Yayasan Pesantren Luhur Al-Azhar</strong></div>\r\n</div>\r\n<div class=\"elementor-element elementor-element-6a0ce8db elementor-widget elementor-widget-text-editor\" data-id=\"6a0ce8db\" data-element_type=\"widget\" data-widget_type=\"text-editor.default\">\r\n<div class=\"elementor-widget-container\">\r\n<p>Jl. Unizar No.20, Turida, Kec. Sandubaya, Kota Mataram, Nusa Tenggara Barat</p>\r\n<ul>\r\n<li>Telepon :&nbsp;<span role=\"link\" aria-label=\"Hubungi Nomor Telepon (0370) 6175565\">(0370) 7562077<br></span></li>\r\n<li>Fax :&nbsp;<span role=\"link\" aria-label=\"Hubungi Nomor Telepon (0370) 6175565\">(0370) 7562077<br></span></li>\r\n<li>Email : mail@unizar.ac.id</li>\r\n</ul>\r\n<p><strong>Maps</strong></p>\r\n<iframe style=\"border: 0;\" src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3076.804008891247!2d116.14178787374065!3d-8.607129487424036!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x2dcdb8c91b50dff9%3A0xb4a0eebb78f94178!2sJl.%20Unizar%20No.20%2C%20Turida%2C%20Kec.%20Sandubaya%2C%20Kota%20Mataram%2C%20Nusa%20Tenggara%20Bar.%2083232!5e1!3m2!1sid!2sid!4v1740464339122!5m2!1sid!2sid\" width=\"800\" height=\"600\" allowfullscreen=\"\"></iframe>\r\n<p>&nbsp;</p>\r\n</div>\r\n</div>','string'),(37,'id_ID','title','KONTAK','string');
/*!40000 ALTER TABLE `navigation_menu_item_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `navigation_menu_items`
--

DROP TABLE IF EXISTS `navigation_menu_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `navigation_menu_items` (
  `navigation_menu_item_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `context_id` bigint(20) NOT NULL,
  `path` varchar(255) DEFAULT '',
  `type` varchar(255) DEFAULT '',
  PRIMARY KEY (`navigation_menu_item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `navigation_menu_items`
--

LOCK TABLES `navigation_menu_items` WRITE;
/*!40000 ALTER TABLE `navigation_menu_items` DISABLE KEYS */;
INSERT INTO `navigation_menu_items` VALUES (1,0,NULL,'NMI_TYPE_USER_REGISTER'),(2,0,NULL,'NMI_TYPE_USER_LOGIN'),(3,0,NULL,'NMI_TYPE_USER_DASHBOARD'),(4,0,NULL,'NMI_TYPE_USER_DASHBOARD'),(5,0,NULL,'NMI_TYPE_USER_PROFILE'),(6,0,NULL,'NMI_TYPE_ADMINISTRATION'),(7,0,NULL,'NMI_TYPE_USER_LOGOUT'),(8,1,NULL,'NMI_TYPE_USER_REGISTER'),(9,1,NULL,'NMI_TYPE_USER_LOGIN'),(10,1,NULL,'NMI_TYPE_USER_DASHBOARD'),(11,1,NULL,'NMI_TYPE_USER_DASHBOARD'),(12,1,NULL,'NMI_TYPE_USER_PROFILE'),(13,1,NULL,'NMI_TYPE_ADMINISTRATION'),(14,1,NULL,'NMI_TYPE_USER_LOGOUT'),(15,1,NULL,'NMI_TYPE_CURRENT'),(16,1,NULL,'NMI_TYPE_ARCHIVES'),(17,1,NULL,'NMI_TYPE_ANNOUNCEMENTS'),(18,1,NULL,'NMI_TYPE_ABOUT'),(19,1,NULL,'NMI_TYPE_ABOUT'),(20,1,NULL,'NMI_TYPE_SUBMISSIONS'),(21,1,NULL,'NMI_TYPE_EDITORIAL_TEAM'),(22,1,NULL,'NMI_TYPE_PRIVACY'),(23,1,'','NMI_TYPE_REMOTE_URL'),(24,1,NULL,'NMI_TYPE_SEARCH'),(25,1,'','NMI_TYPE_REMOTE_URL'),(26,1,'','NMI_TYPE_ABOUT'),(27,1,'profil','NMI_TYPE_REMOTE_URL'),(28,1,'sejarah','NMI_TYPE_CUSTOM'),(29,1,'','NMI_TYPE_CURRENT'),(30,1,'','NMI_TYPE_CURRENT'),(31,1,'','NMI_TYPE_ARCHIVES'),(32,1,'','NMI_TYPE_ANNOUNCEMENTS'),(33,1,'','NMI_TYPE_REMOTE_URL'),(34,1,'profil','NMI_TYPE_CUSTOM'),(35,1,'focus-dan-scope','NMI_TYPE_CUSTOM'),(36,1,'editorial-team','NMI_TYPE_CUSTOM'),(37,1,'kontak','NMI_TYPE_CUSTOM');
/*!40000 ALTER TABLE `navigation_menu_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `navigation_menus`
--

DROP TABLE IF EXISTS `navigation_menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `navigation_menus` (
  `navigation_menu_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `context_id` bigint(20) NOT NULL,
  `area_name` varchar(255) DEFAULT '',
  `title` varchar(255) NOT NULL,
  PRIMARY KEY (`navigation_menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `navigation_menus`
--

LOCK TABLES `navigation_menus` WRITE;
/*!40000 ALTER TABLE `navigation_menus` DISABLE KEYS */;
INSERT INTO `navigation_menus` VALUES (1,0,'user','User Navigation Menu'),(2,1,'user','User Navigation Menu'),(3,1,'primary','Primary Navigation Menu');
/*!40000 ALTER TABLE `navigation_menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notes`
--

DROP TABLE IF EXISTS `notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notes` (
  `note_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `assoc_type` bigint(20) NOT NULL,
  `assoc_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `date_created` datetime NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `contents` text,
  PRIMARY KEY (`note_id`),
  KEY `notes_assoc` (`assoc_type`,`assoc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notes`
--

LOCK TABLES `notes` WRITE;
/*!40000 ALTER TABLE `notes` DISABLE KEYS */;
/*!40000 ALTER TABLE `notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification_mail_list`
--

DROP TABLE IF EXISTS `notification_mail_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notification_mail_list` (
  `notification_mail_list_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email` varchar(90) NOT NULL,
  `confirmed` smallint(6) NOT NULL DEFAULT '0',
  `token` varchar(40) NOT NULL,
  `context` bigint(20) NOT NULL,
  PRIMARY KEY (`notification_mail_list_id`),
  UNIQUE KEY `notification_mail_list_email_context` (`email`,`context`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification_mail_list`
--

LOCK TABLES `notification_mail_list` WRITE;
/*!40000 ALTER TABLE `notification_mail_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `notification_mail_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification_settings`
--

DROP TABLE IF EXISTS `notification_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notification_settings` (
  `notification_id` bigint(20) NOT NULL,
  `locale` varchar(14) DEFAULT NULL,
  `setting_name` varchar(64) NOT NULL,
  `setting_value` text NOT NULL,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)',
  UNIQUE KEY `notification_settings_pkey` (`notification_id`,`locale`,`setting_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification_settings`
--

LOCK TABLES `notification_settings` WRITE;
/*!40000 ALTER TABLE `notification_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `notification_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification_subscription_settings`
--

DROP TABLE IF EXISTS `notification_subscription_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notification_subscription_settings` (
  `setting_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `setting_name` varchar(64) NOT NULL,
  `setting_value` text NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `context` bigint(20) NOT NULL,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)',
  PRIMARY KEY (`setting_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification_subscription_settings`
--

LOCK TABLES `notification_subscription_settings` WRITE;
/*!40000 ALTER TABLE `notification_subscription_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `notification_subscription_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifications` (
  `notification_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `context_id` bigint(20) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `level` bigint(20) NOT NULL,
  `type` bigint(20) NOT NULL,
  `date_created` datetime NOT NULL,
  `date_read` datetime DEFAULT NULL,
  `assoc_type` bigint(20) DEFAULT NULL,
  `assoc_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`notification_id`),
  KEY `notifications_context_id_user_id` (`context_id`,`user_id`,`level`),
  KEY `notifications_context_id` (`context_id`,`level`),
  KEY `notifications_assoc` (`assoc_type`,`assoc_id`),
  KEY `notifications_user_id_level` (`user_id`,`level`)
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
INSERT INTO `notifications` VALUES (38,1,2,2,268435477,'2025-02-25 07:03:50',NULL,259,1),(40,1,1,2,268435477,'2025-02-25 07:03:50',NULL,259,1),(65,1,2,2,268435477,'2025-02-27 11:45:25',NULL,259,1),(67,1,1,2,268435477,'2025-02-27 11:45:25',NULL,259,1),(95,1,2,2,268435477,'2025-02-27 13:19:36',NULL,259,1),(97,1,1,2,268435477,'2025-02-27 13:19:36',NULL,259,1);
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oai_resumption_tokens`
--

DROP TABLE IF EXISTS `oai_resumption_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oai_resumption_tokens` (
  `token` varchar(32) NOT NULL,
  `expire` bigint(20) NOT NULL,
  `record_offset` int(11) NOT NULL,
  `params` text,
  UNIQUE KEY `oai_resumption_tokens_pkey` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oai_resumption_tokens`
--

LOCK TABLES `oai_resumption_tokens` WRITE;
/*!40000 ALTER TABLE `oai_resumption_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `oai_resumption_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugin_settings`
--

DROP TABLE IF EXISTS `plugin_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plugin_settings` (
  `plugin_name` varchar(80) NOT NULL,
  `context_id` bigint(20) NOT NULL,
  `setting_name` varchar(80) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)',
  UNIQUE KEY `plugin_settings_pkey` (`plugin_name`,`context_id`,`setting_name`),
  KEY `plugin_settings_plugin_name` (`plugin_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugin_settings`
--

LOCK TABLES `plugin_settings` WRITE;
/*!40000 ALTER TABLE `plugin_settings` DISABLE KEYS */;
INSERT INTO `plugin_settings` VALUES ('acronplugin',0,'crontab','[{\"className\":\"plugins.generic.usageStats.UsageStatsLoader\",\"frequency\":{\"hour\":24},\"args\":[\"autoStage\"]},{\"className\":\"plugins.generic.usageStats.UsageStatsLoader\",\"frequency\":{\"hour\":24},\"args\":[\"autoStage\"]},{\"className\":\"plugins.importexport.crossref.CrossrefInfoSender\",\"frequency\":{\"hour\":24},\"args\":[]},{\"className\":\"plugins.importexport.doaj.DOAJInfoSender\",\"frequency\":{\"hour\":24},\"args\":[]},{\"className\":\"plugins.importexport.datacite.DataciteInfoSender\",\"frequency\":{\"hour\":24},\"args\":[]},{\"className\":\"plugins.generic.usageStats.UsageStatsLoader\",\"frequency\":{\"hour\":24},\"args\":[\"autoStage\"]},{\"className\":\"plugins.importexport.crossref.CrossrefInfoSender\",\"frequency\":{\"hour\":24},\"args\":[]},{\"className\":\"plugins.importexport.doaj.DOAJInfoSender\",\"frequency\":{\"hour\":24},\"args\":[]},{\"className\":\"plugins.importexport.datacite.DataciteInfoSender\",\"frequency\":{\"hour\":24},\"args\":[]},{\"className\":\"plugins.generic.usageStats.UsageStatsLoader\",\"frequency\":{\"hour\":24},\"args\":[\"autoStage\"]},{\"className\":\"plugins.importexport.crossref.CrossrefInfoSender\",\"frequency\":{\"hour\":24},\"args\":[]},{\"className\":\"plugins.importexport.doaj.DOAJInfoSender\",\"frequency\":{\"hour\":24},\"args\":[]},{\"className\":\"plugins.importexport.datacite.DataciteInfoSender\",\"frequency\":{\"hour\":24},\"args\":[]},{\"className\":\"plugins.generic.usageStats.UsageStatsLoader\",\"frequency\":{\"hour\":24},\"args\":[\"autoStage\"]},{\"className\":\"plugins.importexport.crossref.CrossrefInfoSender\",\"frequency\":{\"hour\":24},\"args\":[]},{\"className\":\"plugins.importexport.doaj.DOAJInfoSender\",\"frequency\":{\"hour\":24},\"args\":[]},{\"className\":\"plugins.importexport.datacite.DataciteInfoSender\",\"frequency\":{\"hour\":24},\"args\":[]},{\"className\":\"plugins.generic.usageStats.UsageStatsLoader\",\"frequency\":{\"hour\":24},\"args\":[\"autoStage\"]},{\"className\":\"plugins.importexport.crossref.CrossrefInfoSender\",\"frequency\":{\"hour\":24},\"args\":[]},{\"className\":\"plugins.importexport.doaj.DOAJInfoSender\",\"frequency\":{\"hour\":24},\"args\":[]},{\"className\":\"plugins.importexport.datacite.DataciteInfoSender\",\"frequency\":{\"hour\":24},\"args\":[]},{\"className\":\"lib.pkp.classes.task.ReviewReminder\",\"frequency\":{\"hour\":24},\"args\":[]},{\"className\":\"lib.pkp.classes.task.StatisticsReport\",\"frequency\":{\"day\":\"1\"},\"args\":[]},{\"className\":\"classes.tasks.SubscriptionExpiryReminder\",\"frequency\":{\"day\":\"1\"},\"args\":[]}]','object'),('acronplugin',0,'enabled','1','bool'),('bootstrapthreethemeplugin',1,'bootstrapTheme','bootstrap3','string'),('bootstrapthreethemeplugin',1,'enabled','1','bool'),('customblockmanagerplugin',1,'blocks','[\"sidebar\"]','object'),('customblockmanagerplugin',1,'enabled','1','bool'),('defaultmanuscriptchildthemeplugin',1,'accentColour','#00923F','string'),('defaultmanuscriptchildthemeplugin',1,'enabled','1','bool'),('defaultthemeplugin',0,'enabled','1','bool'),('defaultthemeplugin',1,'baseColour','#154D42','string'),('defaultthemeplugin',1,'enabled','1','bool'),('defaultthemeplugin',1,'showDescriptionInJournalIndex','true','string'),('defaultthemeplugin',1,'typography','notoSans','string'),('defaultthemeplugin',1,'useHomepageImageAsHeader','false','string'),('developedbyblockplugin',0,'enabled','0','bool'),('developedbyblockplugin',0,'seq','0','int'),('developedbyblockplugin',1,'enabled','0','bool'),('developedbyblockplugin',1,'seq','0','int'),('dublincoremetaplugin',1,'enabled','1','bool'),('googlescholarplugin',1,'enabled','1','bool'),('htmlarticlegalleyplugin',1,'enabled','1','bool'),('informationblockplugin',1,'enabled','1','bool'),('informationblockplugin',1,'seq','7','int'),('languagetoggleblockplugin',0,'enabled','1','bool'),('languagetoggleblockplugin',0,'seq','4','int'),('languagetoggleblockplugin',1,'enabled','1','bool'),('languagetoggleblockplugin',1,'seq','4','int'),('lensgalleyplugin',1,'enabled','1','bool'),('pdfjsviewerplugin',1,'enabled','1','bool'),('resolverplugin',1,'enabled','1','bool'),('sidebar',1,'blockContent','{\"id_ID\":\"<div class=\\\"content\\\">\\r\\n<div id=\\\"customblock-sidebar\\\" class=\\\"pkp_block block_custom\\\">\\r\\n<h2 class=\\\"title\\\">Author Information<\\/h2>\\r\\n<\\/div>\\r\\n<ul class=\\\"sidemenu full\\\">\\r\\n<li><a href=\\\"https:\\/\\/jurnal.unmer.ac.id\\/index.php\\/jpkm\\/about\\/editorialTeam\\\"><em class=\\\"fa fa-user\\\">&nbsp;&nbsp; <\\/em>Editorial Team<\\/a><\\/li>\\r\\n<li><a href=\\\"https:\\/\\/jurnal.unmer.ac.id\\/index.php\\/jpkm\\/reviewer\\\"><em class=\\\"fa fa-users\\\">&nbsp;&nbsp; <\\/em>Peer Reviewer<\\/a><\\/li>\\r\\n<li><a href=\\\"http:\\/\\/202.46.155.66:6677\\/index.php\\/mcd\\/kontak\\\"><em class=\\\"fa fa-address-book-o\\\">&nbsp;&nbsp; <\\/em>Contact<\\/a><\\/li>\\r\\n<li><a href=\\\"https:\\/\\/jurnal.unmer.ac.id\\/index.php\\/jpkm\\/focusscope\\\"><em class=\\\"fa fa-bookmark\\\">&nbsp;&nbsp; <\\/em>Focus and Scope<\\/a><\\/li>\\r\\n<li><a href=\\\"https:\\/\\/jurnal.unmer.ac.id\\/index.php\\/jpkm\\/about\\/submissions\\\"><em class=\\\"fa fa-book\\\">&nbsp;&nbsp; <\\/em>Author Guidelines<\\/a><\\/li>\\r\\n<li><a href=\\\"https:\\/\\/jurnal.unmer.ac.id\\/index.php\\/jpkm\\/publicationfrequency\\\"><em class=\\\"fa fa-tags\\\">&nbsp;&nbsp; <\\/em>Publication Frequency<\\/a><\\/li>\\r\\n<li><a href=\\\"https:\\/\\/jurnal.unmer.ac.id\\/index.php\\/jpkm\\/peerreviewprocess\\\"><em class=\\\"fa fa-retweet\\\">&nbsp;&nbsp; <\\/em>Peer Review Process<\\/a><\\/li>\\r\\n<li><a href=\\\"https:\\/\\/jurnal.unmer.ac.id\\/index.php\\/jpkm\\/publicationethics\\\"><em class=\\\"fa fa-print\\\">&nbsp;&nbsp; <\\/em>Publication Ethics<\\/a><\\/li>\\r\\n<li><a href=\\\"https:\\/\\/jurnal.unmer.ac.id\\/index.php\\/jpkm\\/archiving\\\"><em class=\\\"fa fa-archive\\\">&nbsp;&nbsp; <\\/em>Archiving<\\/a><\\/li>\\r\\n<li><a href=\\\"https:\\/\\/jurnal.unmer.ac.id\\/index.php\\/jpkm\\/about\\/privacy\\\"><em class=\\\"fa fa-lock\\\">&nbsp;&nbsp; <\\/em>Privacy Statement<\\/a><\\/li>\\r\\n<li><a href=\\\"https:\\/\\/jurnal.unmer.ac.id\\/index.php\\/jpkm\\/copyrightnotice\\\"><em class=\\\"fa fa-copyright\\\">&nbsp;&nbsp; <\\/em>Copyright Notice<\\/a><\\/li>\\r\\n<\\/ul>\\r\\n<\\/div>\\r\\n<div id=\\\"customblock-submmisions\\\" class=\\\"pkp_block block_custom\\\">\\r\\n<h2 class=\\\"title pkp_screen_reader\\\">Online Submission<\\/h2>\\r\\n<div class=\\\"content\\\">\\r\\n<div id=\\\"customblock-sidebar\\\" class=\\\"pkp_block block_custom\\\">\\r\\n<h2 class=\\\"title\\\">Online Submission<\\/h2>\\r\\n<\\/div>\\r\\n<ul class=\\\"sidemenu full\\\">\\r\\n<li><a href=\\\"https:\\/\\/jurnal.unmer.ac.id\\/index.php\\/jpkm\\/instructions\\\"><em class=\\\"fa fa-print\\\">&nbsp; &nbsp; <\\/em>Instructions<\\/a><\\/li>\\r\\n<li><a href=\\\"https:\\/\\/drive.google.com\\/file\\/d\\/11DwHADH1scrlLnzMVRNRdI7WrpFK-5UA\\/view\\\"><em class=\\\"fa fa-download\\\">&nbsp; &nbsp; <\\/em>Download Template<\\/a><\\/li>\\r\\n<li><a href=\\\"https:\\/\\/jurnal.unmer.ac.id\\/index.php\\/jpkm\\/user\\/register\\\"><em class=\\\"fa fa-user\\\">&nbsp; &nbsp; <\\/em>Register<\\/a><\\/li>\\r\\n<li><a href=\\\"https:\\/\\/jurnal.unmer.ac.id\\/index.php\\/jpkm\\/login\\\"><em class=\\\"fa fa-sign-in\\\">&nbsp; &nbsp; <\\/em>Login<\\/a><\\/li>\\r\\n<\\/ul>\\r\\n<\\/div>\\r\\n<\\/div>\\r\\n<div id=\\\"customblock-google-scholar-cite\\\" class=\\\"pkp_block block_custom\\\">\\r\\n<h2 class=\\\"title pkp_screen_reader\\\">Google Scholar Cite<\\/h2>\\r\\n<div class=\\\"content\\\">\\r\\n<div id=\\\"customblock-editorial-office\\\" class=\\\"pkp_block block_custom\\\">\\r\\n<h2 class=\\\"title\\\">Google Scholar Cite<\\/h2>\\r\\n<\\/div>\\r\\n<p><iframe src=\\\"https:\\/\\/docs.google.com\\/spreadsheets\\/d\\/e\\/2PACX-1vTCSFv7kx7nVIJy2_XlWE4HgHOKGAACzfb56x1n7RqO6es8KjLsavRAs59C3C7KLwpUoHGpaLPPNI_K\\/pubhtml?gid=0&amp;single=true&amp;widget=true&amp;headers=false\\\"><\\/iframe><\\/p>\\r\\n<p><iframe src=\\\"https:\\/\\/docs.google.com\\/spreadsheets\\/d\\/e\\/2PACX-1vTCSFv7kx7nVIJy2_XlWE4HgHOKGAACzfb56x1n7RqO6es8KjLsavRAs59C3C7KLwpUoHGpaLPPNI_K\\/pubhtml?gid=774399844&amp;single=true&amp;widget=true&amp;headers=false\\\"><\\/iframe><\\/p>\\r\\n<\\/div>\\r\\n<\\/div>\\r\\n<div id=\\\"customblock-statistics\\\" class=\\\"pkp_block block_custom\\\">\\r\\n<h2 class=\\\"title pkp_screen_reader\\\">Statistics<\\/h2>\\r\\n<div class=\\\"content\\\">\\r\\n<div id=\\\"customblock-editorial-office\\\" class=\\\"pkp_block block_custom\\\">\\r\\n<h2 class=\\\"title\\\">Visitor Statistics<\\/h2>\\r\\n<\\/div>\\r\\n<div style=\\\"text-align: center;\\\"><a title=\\\"web counter\\\" href=\\\"http:\\/\\/statcounter.com\\/\\\" target=\\\"_blank\\\" rel=\\\"noopener\\\"><img src=\\\"https:\\/\\/jurnal.unmer.ac.id\\/public\\/site\\/images\\/sariabdimas\\/stats-removebg-preview.png\\\" alt=\\\"\\\" width=\\\"100\\\" height=\\\"33\\\"><\\/a>\\r\\n<div style=\\\"text-align: center;\\\"><a title=\\\"web counter\\\" href=\\\"http:\\/\\/statcounter.com\\/\\\" target=\\\"_blank\\\" rel=\\\"noopener\\\"><img src=\\\"https:\\/\\/c.statcounter.com\\/12163741\\/0\\/f03bea77\\/0\\/\\\" alt=\\\"web counter\\\"><\\/a>\\r\\n<div style=\\\"text-align: center;\\\"><a href=\\\"http:\\/\\/statcounter.com\\/p12163741\\/summary\\/?guest=1\\\" target=\\\"_blank\\\" rel=\\\"noopener\\\">View My Stats<\\/a>\\r\\n<div style=\\\"text-align: center;\\\"><a href=\\\"https:\\/\\/info.flagcounter.com\\/4jTF\\\"><img src=\\\"https:\\/\\/s11.flagcounter.com\\/count2\\/4jTF\\/bg_FFFFFF\\/txt_000000\\/border_CCCCCC\\/columns_2\\/maxflags_10\\/viewers_0\\/labels_0\\/pageviews_0\\/flags_0\\/percent_0\\/\\\" alt=\\\"Flag Counter\\\" border=\\\"0\\\"><\\/a><\\/div>\\r\\n<\\/div>\\r\\n<\\/div>\\r\\n<\\/div>\\r\\n<\\/div>\\r\\n<\\/div>\\r\\n<div id=\\\"customblock-member\\\" class=\\\"pkp_block block_custom\\\">\\r\\n<h2 class=\\\"title pkp_screen_reader\\\">member<\\/h2>\\r\\n<div class=\\\"content\\\">\\r\\n<div id=\\\"customblock-member-of\\\" class=\\\"pkp_block block_custom\\\">\\r\\n<h2 class=\\\"title\\\">Member of<\\/h2>\\r\\n<\\/div>\\r\\n<table width=\\\"100%\\\" cellspacing=\\\"0\\\" cellpadding=\\\"0\\\" align=\\\"center\\\">\\r\\n<tbody>\\r\\n<tr>\\r\\n<td style=\\\"height: 50px; padding-left: 10px; padding-top: 5px; vertical-align: center; border-bottom: 0px solid #ffffff; text-align: center;\\\"><a href=\\\"https:\\/\\/search.crossref.org\\\"><img src=\\\"https:\\/\\/jurnal.unmer.ac.id\\/public\\/site\\/images\\/sariabdimas\\/crossref.jpg\\\" alt=\\\"\\\" width=\\\"150\\\" height=\\\"150\\\"><\\/a><\\/td>\\r\\n<\\/tr>\\r\\n<\\/tbody>\\r\\n<\\/table>\\r\\n<\\/div>\\r\\n<\\/div>\\r\\n<div id=\\\"customblock-issn\\\" class=\\\"pkp_block block_custom\\\">\\r\\n<h2 class=\\\"title pkp_screen_reader\\\">issn<\\/h2>\\r\\n<div class=\\\"content\\\">\\r\\n<div id=\\\"customblock-author-information\\\" class=\\\"pkp_block block_custom\\\">\\r\\n<h2 class=\\\"title\\\">ISSN Number<\\/h2>\\r\\n<\\/div>\\r\\n<div style=\\\"text-align: center;\\\"><a href=\\\"https:\\/\\/issn.brin.go.id\\/terbit\\/detail\\/1481679977\\\"><img src=\\\"\\/public\\/site\\/images\\/admin\\/1481679977.png\\\" alt=\\\"\\\" width=\\\"100\\\" height=\\\"70\\\" border=\\\"1\\\" hspace=\\\"10\\\" vspace=\\\"10\\\"><\\/a><\\/div>\\r\\n<div style=\\\"text-align: center;\\\"><a href=\\\"https:\\/\\/issn.brin.go.id\\/terbit\\/detail\\/1481679977\\\">E-ISSN<\\/a>\\r\\n<div style=\\\"text-align: center;\\\"><a href=\\\"https:\\/\\/issn.brin.go.id\\/terbit\\/detail\\/1580458285\\\"><img src=\\\"\\/public\\/site\\/images\\/admin\\/1580458285.png\\\" alt=\\\"\\\" width=\\\"100\\\" height=\\\"70\\\" border=\\\"1\\\" hspace=\\\"10\\\" vspace=\\\"10\\\"><\\/a>\\r\\n<div style=\\\"text-align: center; padding-bottom: 10px;\\\"><a href=\\\"https:\\/\\/issn.brin.go.id\\/terbit\\/detail\\/1580458285\\\">P-ISSN<\\/a><\\/div>\\r\\n<\\/div>\\r\\n<\\/div>\\r\\n<\\/div>\\r\\n<\\/div>\\r\\n<div id=\\\"customblock-office\\\" class=\\\"pkp_block block_custom\\\">\\r\\n<h2 class=\\\"title pkp_screen_reader\\\">office<\\/h2>\\r\\n<div class=\\\"content\\\">\\r\\n<div id=\\\"customblock-editorial-office\\\" class=\\\"pkp_block block_custom\\\">\\r\\n<h2 class=\\\"title\\\">Editorial Office<\\/h2>\\r\\n<\\/div>\\r\\n<table border=\\\"1\\\" width=\\\"100%\\\" cellspacing=\\\"1\\\" cellpadding=\\\"1\\\" align=\\\"left\\\">\\r\\n<tbody>\\r\\n<tr>\\r\\n<td width=\\\"100%\\\"><iframe style=\\\"border: 0;\\\" src=\\\"https:\\/\\/www.google.com\\/maps\\/embed?pb=!1m18!1m12!1m3!1d3569.914396267673!2d116.14178787464299!3d-8.607129487425903!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x2dcdb8c91b50dff9%3A0xb4a0eebb78f94178!2sJl.%20Unizar%20No.20%2C%20Turida%2C%20Kec.%20Sandubaya%2C%20Kota%20Mataram%2C%20Nusa%20Tenggara%20Bar.%2083232!5e1!3m2!1sid!2sid!4v1740625368219!5m2!1sid!2sid\\\" width=\\\"400\\\" height=\\\"300\\\" allowfullscreen=\\\"\\\"><\\/iframe><\\/td>\\r\\n<\\/tr>\\r\\n<\\/tbody>\\r\\n<\\/table>\\r\\n<\\/div>\\r\\n<\\/div>\"}','object'),('sidebar',1,'blockTitle','{\"id_ID\":\"sidebar\"}','object'),('sidebar',1,'enabled','1','bool'),('sidebar',1,'showName',NULL,'string'),('staticpagesplugin',1,'enabled','1','bool'),('subscriptionblockplugin',1,'enabled','1','bool'),('subscriptionblockplugin',1,'seq','2','int'),('tinymceplugin',0,'enabled','1','bool'),('tinymceplugin',1,'enabled','1','bool'),('usageeventplugin',0,'enabled','1','bool'),('usageeventplugin',0,'uniqueSiteId','67bd251a41e72','string'),('usagestatsplugin',0,'accessLogFileParseRegex','/^(?P<ip>\\S+) \\S+ \\S+ \\[(?P<date>.*?)\\] \"\\S+ (?P<url>\\S+).*?\" (?P<returnCode>\\S+) \\S+ \".*?\" \"(?P<userAgent>.*?)\"/','string'),('usagestatsplugin',0,'chartType','bar','string'),('usagestatsplugin',0,'createLogFiles','1','bool'),('usagestatsplugin',0,'datasetMaxCount','4','string'),('usagestatsplugin',0,'enabled','1','bool'),('usagestatsplugin',0,'optionalColumns','[\"city\",\"region\"]','object'),('webfeedplugin',1,'displayItems','1','bool'),('webfeedplugin',1,'displayPage','homepage','string'),('webfeedplugin',1,'enabled','1','bool');
/*!40000 ALTER TABLE `plugin_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publication_categories`
--

DROP TABLE IF EXISTS `publication_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `publication_categories` (
  `publication_id` bigint(20) NOT NULL,
  `category_id` bigint(20) NOT NULL,
  UNIQUE KEY `publication_categories_id` (`publication_id`,`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publication_categories`
--

LOCK TABLES `publication_categories` WRITE;
/*!40000 ALTER TABLE `publication_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `publication_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publication_galley_settings`
--

DROP TABLE IF EXISTS `publication_galley_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `publication_galley_settings` (
  `galley_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  UNIQUE KEY `publication_galley_settings_pkey` (`galley_id`,`locale`,`setting_name`),
  KEY `publication_galley_settings_galley_id` (`galley_id`),
  KEY `publication_galley_settings_name_value` (`setting_name`(50),`setting_value`(150))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publication_galley_settings`
--

LOCK TABLES `publication_galley_settings` WRITE;
/*!40000 ALTER TABLE `publication_galley_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `publication_galley_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publication_galleys`
--

DROP TABLE IF EXISTS `publication_galleys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `publication_galleys` (
  `galley_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `locale` varchar(14) DEFAULT NULL,
  `publication_id` bigint(20) NOT NULL,
  `label` varchar(255) DEFAULT NULL,
  `submission_file_id` bigint(20) unsigned DEFAULT NULL,
  `seq` double(8,2) NOT NULL DEFAULT '0.00',
  `remote_url` varchar(2047) DEFAULT NULL,
  `is_approved` smallint(6) NOT NULL DEFAULT '0',
  `url_path` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`galley_id`),
  KEY `publication_galleys_publication_id` (`publication_id`),
  KEY `publication_galleys_url_path` (`url_path`),
  KEY `publication_galleys_submission_file_id_foreign` (`submission_file_id`),
  CONSTRAINT `publication_galleys_submission_file_id_foreign` FOREIGN KEY (`submission_file_id`) REFERENCES `submission_files` (`submission_file_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publication_galleys`
--

LOCK TABLES `publication_galleys` WRITE;
/*!40000 ALTER TABLE `publication_galleys` DISABLE KEYS */;
INSERT INTO `publication_galleys` VALUES (3,'id_ID',7,'PDF',7,0.00,'',0,''),(6,'id_ID',12,'Google drive',NULL,0.00,'https://drive.google.com/file/d/1Y-FQOsax_YABOuXpvXzgbWmkzQ3c6xUV/view',0,'');
/*!40000 ALTER TABLE `publication_galleys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publication_settings`
--

DROP TABLE IF EXISTS `publication_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `publication_settings` (
  `publication_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  UNIQUE KEY `publication_settings_pkey` (`publication_id`,`locale`,`setting_name`),
  KEY `publication_settings_publication_id` (`publication_id`),
  KEY `publication_settings_name_value` (`setting_name`(50),`setting_value`(150))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publication_settings`
--

LOCK TABLES `publication_settings` WRITE;
/*!40000 ALTER TABLE `publication_settings` DISABLE KEYS */;
INSERT INTO `publication_settings` VALUES (3,'','categoryIds','[]'),(3,'','copyrightYear','2025'),(3,'','issueId','1'),(3,'','licenseUrl','https://creativecommons.org/licenses/by-nc-sa/4.0'),(3,'','pages','32-35'),(3,'id_ID','abstract','<p>The objective of this research is to analyse the discrete probability distribution of undergraduate students<br>who wish to pursue a master\'s degree. By utilizing statistical methods and probability models, this research<br>evaluates the factors that influence students\' decisions to continue their studies at a higher level. Data were<br>collected through a survey involving students from the Mathematics Study Program in the Faculty of<br>Mathematics and Natural Sciences at the University of Mataram. This analysis considers various variables<br>such as information about master\'s programs, the choice of the university, education plans, financial<br>support, and other external factors. Additionally, personal motivation and family support also play an<br>important role in this decision. These findings are expected to provide insights for educational institutions<br>and policymakers to develop strategies that support the increase in the number of students continuing to the<br>master\'s level.</p>'),(3,'id_ID','copyrightHolder',''),(3,'id_ID','prefix',''),(3,'id_ID','subtitle',''),(3,'id_ID','title','Analisis Distribusi Peluang Diskrit Mahasiswa yang Sedang Menempuh Sarjana Menuju Magister'),(7,'','categoryIds','[]'),(7,'','copyrightYear','2025'),(7,'','issueId','1'),(7,'','licenseUrl','https://creativecommons.org/licenses/by-nc-sa/4.0'),(7,'','pages','54-58'),(7,'id_ID','abstract','<p>The increase in food demand is not in line with the increase in the amount of production and<br>quality of agricultural products. The strategy to increase agricultural production so far has<br>been carried out through the provision of chemical synthetic fertilizers, this strategy has a<br>negative impact on the quality of agricultural land, namely a decrease in the essential organic<br>elements of the soil which are needed by plants. Organic farming is a necessary solution to<br>restore land quality and Bacillus laterosporus is a microorganism that has the ability to<br>produce various beneficial metabolites for plant growth and maintain soil fertility.</p>'),(7,'id_ID','copyrightHolder',''),(7,'id_ID','prefix',''),(7,'id_ID','subtitle',''),(7,'id_ID','title','Pengaruh Pemberian Suspensi Bacillus laterosporus dengan Sumber Karbon Alami Berbeda terhadap Laju Germinasi Kedelai (Glycine max)'),(8,'','categoryIds','[]'),(12,'','categoryIds','[]'),(12,'','copyrightYear','2025'),(12,'','issueId','1'),(12,'','licenseUrl','https://creativecommons.org/licenses/by-nc-sa/4.0'),(12,'','pages',''),(12,'id_ID','abstract','<p>tesss</p>'),(12,'id_ID','copyrightHolder',''),(12,'id_ID','prefix',''),(12,'id_ID','subtitle','tttt'),(12,'id_ID','title','tesss');
/*!40000 ALTER TABLE `publication_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publications`
--

DROP TABLE IF EXISTS `publications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `publications` (
  `publication_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `access_status` bigint(20) DEFAULT '0',
  `date_published` date DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `locale` varchar(14) DEFAULT NULL,
  `primary_contact_id` bigint(20) DEFAULT NULL,
  `section_id` bigint(20) DEFAULT NULL,
  `seq` double(8,2) NOT NULL DEFAULT '0.00',
  `submission_id` bigint(20) NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '1',
  `url_path` varchar(64) DEFAULT NULL,
  `version` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`publication_id`),
  KEY `publications_submission_id` (`submission_id`),
  KEY `publications_section_id` (`section_id`),
  KEY `publications_url_path` (`url_path`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publications`
--

LOCK TABLES `publications` WRITE;
/*!40000 ALTER TABLE `publications` DISABLE KEYS */;
INSERT INTO `publications` VALUES (1,0,NULL,'2025-02-25 06:44:42',NULL,NULL,1,0.00,1,1,NULL,1),(2,0,NULL,'2025-02-25 06:44:49',NULL,NULL,1,0.00,2,1,NULL,1),(3,0,'2025-02-25','2025-02-27 13:08:17',NULL,1,1,0.00,3,1,NULL,1),(4,0,NULL,'2025-02-27 10:10:52',NULL,NULL,1,0.00,4,1,NULL,1),(5,0,NULL,'2025-02-27 11:12:46',NULL,NULL,1,0.00,5,1,NULL,1),(7,0,'2025-02-11','2025-02-27 13:07:11',NULL,4,1,0.00,7,1,NULL,1),(8,0,NULL,'2025-02-27 13:09:51',NULL,5,1,0.00,8,1,NULL,1),(10,0,NULL,'2025-02-27 13:15:37',NULL,NULL,1,0.00,10,1,NULL,1),(12,0,'2025-02-27','2025-02-27 13:19:36',NULL,NULL,1,1.00,12,3,NULL,1);
/*!40000 ALTER TABLE `publications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `queries`
--

DROP TABLE IF EXISTS `queries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `queries` (
  `query_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `assoc_type` bigint(20) NOT NULL,
  `assoc_id` bigint(20) NOT NULL,
  `stage_id` smallint(6) NOT NULL,
  `seq` double(8,2) NOT NULL DEFAULT '0.00',
  `date_posted` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `closed` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`query_id`),
  KEY `queries_assoc_id` (`assoc_type`,`assoc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `queries`
--

LOCK TABLES `queries` WRITE;
/*!40000 ALTER TABLE `queries` DISABLE KEYS */;
/*!40000 ALTER TABLE `queries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `query_participants`
--

DROP TABLE IF EXISTS `query_participants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `query_participants` (
  `query_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  UNIQUE KEY `query_participants_pkey` (`query_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `query_participants`
--

LOCK TABLES `query_participants` WRITE;
/*!40000 ALTER TABLE `query_participants` DISABLE KEYS */;
/*!40000 ALTER TABLE `query_participants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `queued_payments`
--

DROP TABLE IF EXISTS `queued_payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `queued_payments` (
  `queued_payment_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date_created` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  `expiry_date` date DEFAULT NULL,
  `payment_data` text,
  PRIMARY KEY (`queued_payment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `queued_payments`
--

LOCK TABLES `queued_payments` WRITE;
/*!40000 ALTER TABLE `queued_payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `queued_payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_assignments`
--

DROP TABLE IF EXISTS `review_assignments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review_assignments` (
  `review_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `submission_id` bigint(20) NOT NULL,
  `reviewer_id` bigint(20) NOT NULL,
  `competing_interests` text,
  `recommendation` smallint(6) DEFAULT NULL,
  `date_assigned` datetime DEFAULT NULL,
  `date_notified` datetime DEFAULT NULL,
  `date_confirmed` datetime DEFAULT NULL,
  `date_completed` datetime DEFAULT NULL,
  `date_acknowledged` datetime DEFAULT NULL,
  `date_due` datetime DEFAULT NULL,
  `date_response_due` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `reminder_was_automatic` smallint(6) NOT NULL DEFAULT '0',
  `declined` smallint(6) NOT NULL DEFAULT '0',
  `cancelled` smallint(6) NOT NULL DEFAULT '0',
  `reviewer_file_id` bigint(20) DEFAULT NULL,
  `date_rated` datetime DEFAULT NULL,
  `date_reminded` datetime DEFAULT NULL,
  `quality` smallint(6) DEFAULT NULL,
  `review_round_id` bigint(20) NOT NULL,
  `stage_id` smallint(6) NOT NULL,
  `review_method` smallint(6) NOT NULL DEFAULT '1',
  `round` smallint(6) NOT NULL DEFAULT '1',
  `step` smallint(6) NOT NULL DEFAULT '1',
  `review_form_id` bigint(20) DEFAULT NULL,
  `unconsidered` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`review_id`),
  KEY `review_assignments_submission_id` (`submission_id`),
  KEY `review_assignments_reviewer_id` (`reviewer_id`),
  KEY `review_assignments_form_id` (`review_form_id`),
  KEY `review_assignments_reviewer_review` (`reviewer_id`,`review_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_assignments`
--

LOCK TABLES `review_assignments` WRITE;
/*!40000 ALTER TABLE `review_assignments` DISABLE KEYS */;
/*!40000 ALTER TABLE `review_assignments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_files`
--

DROP TABLE IF EXISTS `review_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review_files` (
  `review_id` bigint(20) NOT NULL,
  `submission_file_id` bigint(20) unsigned NOT NULL,
  UNIQUE KEY `review_files_pkey` (`review_id`,`submission_file_id`),
  KEY `review_files_review_id` (`review_id`),
  KEY `review_files_submission_file_id_foreign` (`submission_file_id`),
  CONSTRAINT `review_files_submission_file_id_foreign` FOREIGN KEY (`submission_file_id`) REFERENCES `submission_files` (`submission_file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_files`
--

LOCK TABLES `review_files` WRITE;
/*!40000 ALTER TABLE `review_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `review_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_form_element_settings`
--

DROP TABLE IF EXISTS `review_form_element_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review_form_element_settings` (
  `review_form_element_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `review_form_element_settings_pkey` (`review_form_element_id`,`locale`,`setting_name`),
  KEY `review_form_element_settings_review_form_element_id` (`review_form_element_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_form_element_settings`
--

LOCK TABLES `review_form_element_settings` WRITE;
/*!40000 ALTER TABLE `review_form_element_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `review_form_element_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_form_elements`
--

DROP TABLE IF EXISTS `review_form_elements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review_form_elements` (
  `review_form_element_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `review_form_id` bigint(20) NOT NULL,
  `seq` double(8,2) DEFAULT NULL,
  `element_type` bigint(20) DEFAULT NULL,
  `required` smallint(6) DEFAULT NULL,
  `included` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`review_form_element_id`),
  KEY `review_form_elements_review_form_id` (`review_form_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_form_elements`
--

LOCK TABLES `review_form_elements` WRITE;
/*!40000 ALTER TABLE `review_form_elements` DISABLE KEYS */;
/*!40000 ALTER TABLE `review_form_elements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_form_responses`
--

DROP TABLE IF EXISTS `review_form_responses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review_form_responses` (
  `review_form_element_id` bigint(20) NOT NULL,
  `review_id` bigint(20) NOT NULL,
  `response_type` varchar(6) DEFAULT NULL,
  `response_value` text,
  KEY `review_form_responses_pkey` (`review_form_element_id`,`review_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_form_responses`
--

LOCK TABLES `review_form_responses` WRITE;
/*!40000 ALTER TABLE `review_form_responses` DISABLE KEYS */;
/*!40000 ALTER TABLE `review_form_responses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_form_settings`
--

DROP TABLE IF EXISTS `review_form_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review_form_settings` (
  `review_form_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `review_form_settings_pkey` (`review_form_id`,`locale`,`setting_name`),
  KEY `review_form_settings_review_form_id` (`review_form_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_form_settings`
--

LOCK TABLES `review_form_settings` WRITE;
/*!40000 ALTER TABLE `review_form_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `review_form_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_forms`
--

DROP TABLE IF EXISTS `review_forms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review_forms` (
  `review_form_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `assoc_type` bigint(20) NOT NULL,
  `assoc_id` bigint(20) NOT NULL,
  `seq` double(8,2) DEFAULT NULL,
  `is_active` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`review_form_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_forms`
--

LOCK TABLES `review_forms` WRITE;
/*!40000 ALTER TABLE `review_forms` DISABLE KEYS */;
/*!40000 ALTER TABLE `review_forms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_round_files`
--

DROP TABLE IF EXISTS `review_round_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review_round_files` (
  `submission_id` bigint(20) NOT NULL,
  `review_round_id` bigint(20) NOT NULL,
  `stage_id` smallint(6) NOT NULL,
  `submission_file_id` bigint(20) unsigned NOT NULL,
  UNIQUE KEY `review_round_files_pkey` (`submission_id`,`review_round_id`,`submission_file_id`),
  KEY `review_round_files_submission_id` (`submission_id`),
  KEY `review_round_files_submission_file_id_foreign` (`submission_file_id`),
  CONSTRAINT `review_round_files_submission_file_id_foreign` FOREIGN KEY (`submission_file_id`) REFERENCES `submission_files` (`submission_file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_round_files`
--

LOCK TABLES `review_round_files` WRITE;
/*!40000 ALTER TABLE `review_round_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `review_round_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_rounds`
--

DROP TABLE IF EXISTS `review_rounds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review_rounds` (
  `review_round_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `submission_id` bigint(20) NOT NULL,
  `stage_id` bigint(20) DEFAULT NULL,
  `round` smallint(6) NOT NULL,
  `review_revision` bigint(20) DEFAULT NULL,
  `status` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`review_round_id`),
  UNIQUE KEY `review_rounds_submission_id_stage_id_round_pkey` (`submission_id`,`stage_id`,`round`),
  KEY `review_rounds_submission_id` (`submission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_rounds`
--

LOCK TABLES `review_rounds` WRITE;
/*!40000 ALTER TABLE `review_rounds` DISABLE KEYS */;
/*!40000 ALTER TABLE `review_rounds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scheduled_tasks`
--

DROP TABLE IF EXISTS `scheduled_tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `scheduled_tasks` (
  `class_name` varchar(255) NOT NULL,
  `last_run` datetime DEFAULT NULL,
  UNIQUE KEY `scheduled_tasks_pkey` (`class_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scheduled_tasks`
--

LOCK TABLES `scheduled_tasks` WRITE;
/*!40000 ALTER TABLE `scheduled_tasks` DISABLE KEYS */;
INSERT INTO `scheduled_tasks` VALUES ('classes.tasks.SubscriptionExpiryReminder','2025-02-25 01:51:46'),('lib.pkp.classes.task.ReviewReminder','2025-03-03 03:28:53'),('lib.pkp.classes.task.StatisticsReport','2025-02-25 01:51:46'),('plugins.generic.usageStats.UsageStatsLoader','2025-03-03 03:28:52'),('plugins.importexport.crossref.CrossrefInfoSender','2025-03-03 03:28:53'),('plugins.importexport.datacite.DataciteInfoSender','2025-03-03 03:28:53'),('plugins.importexport.doaj.DOAJInfoSender','2025-03-03 03:28:53');
/*!40000 ALTER TABLE `scheduled_tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `section_settings`
--

DROP TABLE IF EXISTS `section_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `section_settings` (
  `section_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)',
  UNIQUE KEY `section_settings_pkey` (`section_id`,`locale`,`setting_name`),
  KEY `section_settings_section_id` (`section_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `section_settings`
--

LOCK TABLES `section_settings` WRITE;
/*!40000 ALTER TABLE `section_settings` DISABLE KEYS */;
INSERT INTO `section_settings` VALUES (1,'id_ID','abbrev','ART','string'),(1,'id_ID','policy','Kebijakan Bagian','string'),(1,'id_ID','title','Artikel','string'),(2,'id_ID','abbrev','jr','string'),(2,'id_ID','identifyType','','string'),(2,'id_ID','policy','','string'),(2,'id_ID','title','Jurnal Rivew','string');
/*!40000 ALTER TABLE `section_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sections`
--

DROP TABLE IF EXISTS `sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sections` (
  `section_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `journal_id` bigint(20) NOT NULL,
  `review_form_id` bigint(20) DEFAULT NULL,
  `seq` double(8,2) NOT NULL DEFAULT '0.00',
  `editor_restricted` smallint(6) NOT NULL DEFAULT '0',
  `meta_indexed` smallint(6) NOT NULL DEFAULT '0',
  `meta_reviewed` smallint(6) NOT NULL DEFAULT '1',
  `abstracts_not_required` smallint(6) NOT NULL DEFAULT '0',
  `hide_title` smallint(6) NOT NULL DEFAULT '0',
  `hide_author` smallint(6) NOT NULL DEFAULT '0',
  `is_inactive` smallint(6) NOT NULL DEFAULT '0',
  `abstract_word_count` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`section_id`),
  KEY `sections_journal_id` (`journal_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sections`
--

LOCK TABLES `sections` WRITE;
/*!40000 ALTER TABLE `sections` DISABLE KEYS */;
INSERT INTO `sections` VALUES (1,1,0,1.00,0,1,1,0,0,0,0,0),(2,1,0,2.00,0,1,1,0,0,0,0,NULL);
/*!40000 ALTER TABLE `sections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `session_id` varchar(128) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `ip_address` varchar(39) NOT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `created` bigint(20) NOT NULL DEFAULT '0',
  `last_used` bigint(20) NOT NULL DEFAULT '0',
  `remember` smallint(6) NOT NULL DEFAULT '0',
  `data` text NOT NULL,
  `domain` varchar(255) DEFAULT NULL,
  UNIQUE KEY `sessions_pkey` (`session_id`),
  KEY `sessions_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('37rjjbuvqdt3ki88423a069vhg',NULL,'172.16.0.1','Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Mobile Safari/537.36',1740626187,1740626301,0,'','202.46.155.66'),('5ejigs339moqtp3c2crjkobvbf',NULL,'172.16.0.1','\'Mozilla/5.0 (compatible; GenomeCrawlerd/1.0; +https://www.nokia.com/genomecrawler)\'',1740637726,1740637726,0,'','202.46.155.66'),('5ivoek4fs2l0odd733dsd278kl',NULL,'172.16.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36',1740980456,1740980457,0,'','202.46.155.66'),('7964plmqr2evuu8jafi3n70m78',NULL,'172.16.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36',1740980526,1740980868,0,'','202.46.155.66'),('7ickub276efjtcjpdn858k44bn',1,'172.16.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36',1740448530,1740455920,1,'csrf|a:2:{s:9:\"timestamp\";i:1740455920;s:5:\"token\";s:32:\"82b026c2ef11ae86a2be2bf8dedec945\";}username|s:12:\"username_ojs\";userId|i:1;','202.46.155.66'),('8guc6od7h4848abhbc0recif2s',NULL,'172.16.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36',1740972532,1740972533,0,'','202.46.155.66'),('9bvcjm66r0csqf23otbhapl1jd',1,'172.16.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36',1740662069,1740662388,1,'csrf|a:2:{s:9:\"timestamp\";i:1740662388;s:5:\"token\";s:32:\"4e864043d6da30f188b3d5653d96c387\";}userId|i:1;username|s:12:\"username_ojs\";','202.46.155.66'),('anvch3fa9e9l6hki29t6fi99ls',NULL,'172.16.0.1','Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Mobile Safari/537.36',1740972600,1740972600,0,'','202.46.155.66'),('cnvt2t2ef39sb6n6607gqpctjs',1,'172.16.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36',1740569137,1740650590,1,'csrf|a:2:{s:9:\"timestamp\";i:1740637159;s:5:\"token\";s:32:\"15990643c4d93e226a4e026793132238\";}userId|i:1;username|s:12:\"username_ojs\";','202.46.155.66'),('e0oghd71tsa8csuirrgfmjntco',NULL,'172.16.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36',1740631823,1740632260,0,'csrf|a:2:{s:9:\"timestamp\";i:1740632227;s:5:\"token\";s:32:\"4135546978409df8e300c98e59b92713\";}','202.46.155.66'),('hod6u3uv4vkophu85ho0v5ehm3',NULL,'172.16.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36',1740711775,1740711776,0,'','202.46.155.66'),('i0adh0qdjkqfmiamsbpc6lv683',NULL,'172.16.0.1','Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Mobile Safari/537.36',1740659835,1740660404,0,'','rsud.mataramkota.go.id'),('i4keb99mgq2d88dhle9i7p8131',1,'172.16.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36',1740654714,1740662406,1,'csrf|a:2:{s:9:\"timestamp\";i:1740662406;s:5:\"token\";s:32:\"b2c4ed31b008ce29ce41a1ad2ebc93c1\";}userId|i:1;username|s:12:\"username_ojs\";','202.46.155.66'),('ikqn6jr13a7tdpl0env9l80kl2',NULL,'172.16.0.1','Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Mobile Safari/537.36',1740972572,1740972612,0,'','202.46.155.66'),('l1frg38fhc16qmfc75esvneggk',NULL,'172.16.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36',1740659422,1740660466,0,'','rsud.mataramkota.go.id'),('lkcqdb5bkfsr8f1vicb62u1k79',NULL,'172.16.0.1','Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Mobile Safari/537.36',1740636019,1740637159,0,'','202.46.155.66'),('no9aa8s008ci7a7jn8958jtgiq',NULL,'172.16.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:135.0) Gecko/20100101 Firefox/135.0',1740636927,1740657879,0,'','202.46.155.66'),('r3nntj79vir7egedj6m0vlced9',NULL,'172.16.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36',1740455921,1740645354,0,'username|s:12:\"username_ojs\";csrf|a:2:{s:9:\"timestamp\";i:1740645354;s:5:\"token\";s:32:\"de8000c7cbc61c6f324409029aea1b31\";}','202.46.155.66'),('r55utbspp91kl2qs0m4pkqc54c',NULL,'172.16.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36',1740661314,1740661415,0,'','202.46.155.66'),('u113ekdifjb9q8584piekmi2ak',1,'172.16.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36',1740637342,1740662011,1,'csrf|a:2:{s:9:\"timestamp\";i:1740659266;s:5:\"token\";s:32:\"31b9e98c28cf4edaadf11a4ec3b0abf1\";}userId|i:1;username|s:12:\"username_ojs\";','202.46.155.66');
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `site`
--

DROP TABLE IF EXISTS `site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `site` (
  `redirect` bigint(20) NOT NULL DEFAULT '0' COMMENT 'If not 0, redirect to the specified journal/conference/... site.',
  `primary_locale` varchar(14) NOT NULL COMMENT 'Primary locale for the site.',
  `min_password_length` smallint(6) NOT NULL DEFAULT '6',
  `installed_locales` varchar(1024) NOT NULL DEFAULT 'en_US' COMMENT 'Locales for which support has been installed.',
  `supported_locales` varchar(1024) DEFAULT NULL COMMENT 'Locales supported by the site (for hosted journals/conferences/...).',
  `original_style_file_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site`
--

LOCK TABLES `site` WRITE;
/*!40000 ALTER TABLE `site` DISABLE KEYS */;
INSERT INTO `site` VALUES (0,'id_ID',6,'[\"en_US\",\"id_ID\"]','[\"en_US\",\"id_ID\"]',NULL);
/*!40000 ALTER TABLE `site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `site_settings`
--

DROP TABLE IF EXISTS `site_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `site_settings` (
  `setting_name` varchar(255) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_value` text,
  UNIQUE KEY `site_settings_pkey` (`setting_name`,`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site_settings`
--

LOCK TABLES `site_settings` WRITE;
/*!40000 ALTER TABLE `site_settings` DISABLE KEYS */;
INSERT INTO `site_settings` VALUES ('contactEmail','id_ID','irham.devv@gmail.com'),('contactName','en_US','Open Journal Systems'),('contactName','id_ID','Open Journal Systems'),('themePluginPath','','default');
/*!40000 ALTER TABLE `site_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stage_assignments`
--

DROP TABLE IF EXISTS `stage_assignments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stage_assignments` (
  `stage_assignment_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `submission_id` bigint(20) NOT NULL,
  `user_group_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `date_assigned` datetime NOT NULL,
  `recommend_only` smallint(6) NOT NULL DEFAULT '0',
  `can_change_metadata` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`stage_assignment_id`),
  UNIQUE KEY `stage_assignment` (`submission_id`,`user_group_id`,`user_id`),
  KEY `stage_assignments_submission_id` (`submission_id`),
  KEY `stage_assignments_user_group_id` (`user_group_id`),
  KEY `stage_assignments_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stage_assignments`
--

LOCK TABLES `stage_assignments` WRITE;
/*!40000 ALTER TABLE `stage_assignments` DISABLE KEYS */;
INSERT INTO `stage_assignments` VALUES (1,1,2,1,'2025-02-25 06:44:42',0,1),(2,2,2,1,'2025-02-25 06:44:50',0,1),(3,3,2,1,'2025-02-25 06:52:43',0,1),(4,4,2,1,'2025-02-27 10:10:53',0,1),(5,5,2,1,'2025-02-27 11:12:47',0,1),(6,6,2,1,'2025-02-27 11:50:21',0,1),(7,7,2,1,'2025-02-27 11:54:09',0,1),(8,8,2,1,'2025-02-27 13:08:24',0,1),(9,9,2,1,'2025-02-27 13:14:27',0,1),(10,10,2,1,'2025-02-27 13:15:37',0,1),(11,11,2,1,'2025-02-27 13:16:21',0,1),(12,12,2,1,'2025-02-27 13:17:11',0,1);
/*!40000 ALTER TABLE `stage_assignments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `static_page_settings`
--

DROP TABLE IF EXISTS `static_page_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `static_page_settings` (
  `static_page_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` longtext,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)',
  UNIQUE KEY `static_page_settings_pkey` (`static_page_id`,`locale`,`setting_name`),
  KEY `static_page_settings_static_page_id` (`static_page_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `static_page_settings`
--

LOCK TABLES `static_page_settings` WRITE;
/*!40000 ALTER TABLE `static_page_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `static_page_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `static_pages`
--

DROP TABLE IF EXISTS `static_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `static_pages` (
  `static_page_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `path` varchar(255) NOT NULL,
  `context_id` bigint(20) NOT NULL,
  PRIMARY KEY (`static_page_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `static_pages`
--

LOCK TABLES `static_pages` WRITE;
/*!40000 ALTER TABLE `static_pages` DISABLE KEYS */;
/*!40000 ALTER TABLE `static_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subeditor_submission_group`
--

DROP TABLE IF EXISTS `subeditor_submission_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subeditor_submission_group` (
  `context_id` bigint(20) NOT NULL,
  `assoc_id` bigint(20) NOT NULL,
  `assoc_type` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  UNIQUE KEY `section_editors_pkey` (`context_id`,`assoc_id`,`assoc_type`,`user_id`),
  KEY `section_editors_context_id` (`context_id`),
  KEY `subeditor_submission_group_assoc_id` (`assoc_id`,`assoc_type`),
  KEY `subeditor_submission_group_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subeditor_submission_group`
--

LOCK TABLES `subeditor_submission_group` WRITE;
/*!40000 ALTER TABLE `subeditor_submission_group` DISABLE KEYS */;
INSERT INTO `subeditor_submission_group` VALUES (1,2,530,2);
/*!40000 ALTER TABLE `subeditor_submission_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submission_comments`
--

DROP TABLE IF EXISTS `submission_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `submission_comments` (
  `comment_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `comment_type` bigint(20) DEFAULT NULL,
  `role_id` bigint(20) NOT NULL,
  `submission_id` bigint(20) NOT NULL,
  `assoc_id` bigint(20) NOT NULL,
  `author_id` bigint(20) NOT NULL,
  `comment_title` text NOT NULL,
  `comments` text,
  `date_posted` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `viewable` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `submission_comments_submission_id` (`submission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_comments`
--

LOCK TABLES `submission_comments` WRITE;
/*!40000 ALTER TABLE `submission_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `submission_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submission_file_revisions`
--

DROP TABLE IF EXISTS `submission_file_revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `submission_file_revisions` (
  `revision_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `submission_file_id` bigint(20) unsigned NOT NULL,
  `file_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`revision_id`),
  KEY `submission_file_revisions_submission_file_id_foreign` (`submission_file_id`),
  KEY `submission_file_revisions_file_id_foreign` (`file_id`),
  CONSTRAINT `submission_file_revisions_file_id_foreign` FOREIGN KEY (`file_id`) REFERENCES `files` (`file_id`),
  CONSTRAINT `submission_file_revisions_submission_file_id_foreign` FOREIGN KEY (`submission_file_id`) REFERENCES `submission_files` (`submission_file_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_file_revisions`
--

LOCK TABLES `submission_file_revisions` WRITE;
/*!40000 ALTER TABLE `submission_file_revisions` DISABLE KEYS */;
INSERT INTO `submission_file_revisions` VALUES (2,2,1),(7,7,6),(8,8,6);
/*!40000 ALTER TABLE `submission_file_revisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submission_file_settings`
--

DROP TABLE IF EXISTS `submission_file_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `submission_file_settings` (
  `submission_file_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL DEFAULT 'string' COMMENT '(bool|int|float|string|object|date)',
  UNIQUE KEY `submission_file_settings_pkey` (`submission_file_id`,`locale`,`setting_name`),
  KEY `submission_file_settings_id` (`submission_file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_file_settings`
--

LOCK TABLES `submission_file_settings` WRITE;
/*!40000 ALTER TABLE `submission_file_settings` DISABLE KEYS */;
INSERT INTO `submission_file_settings` VALUES (2,'id_ID','name','541-Article Text-4026-1-10-20240623.pdf','string'),(7,'','dateCreated','','string'),(7,'','language','','string'),(7,'id_ID','creator','','string'),(7,'id_ID','description','','string'),(7,'id_ID','name','document.pdf','string'),(7,'id_ID','publisher','','string'),(7,'id_ID','source','','string'),(7,'id_ID','sponsor','','string'),(7,'id_ID','subject','','string'),(8,'','dateCreated','','string'),(8,'','language','','string'),(8,'id_ID','creator','','string'),(8,'id_ID','description','','string'),(8,'id_ID','name','document.pdf','string'),(8,'id_ID','publisher','','string'),(8,'id_ID','source','','string'),(8,'id_ID','sponsor','','string'),(8,'id_ID','subject','','string');
/*!40000 ALTER TABLE `submission_file_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submission_files`
--

DROP TABLE IF EXISTS `submission_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `submission_files` (
  `submission_file_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `submission_id` bigint(20) NOT NULL,
  `file_id` bigint(20) unsigned NOT NULL,
  `source_submission_file_id` bigint(20) DEFAULT NULL,
  `genre_id` bigint(20) DEFAULT NULL,
  `file_stage` bigint(20) NOT NULL,
  `direct_sales_price` varchar(255) DEFAULT NULL,
  `sales_type` varchar(255) DEFAULT NULL,
  `viewable` smallint(6) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `uploader_user_id` bigint(20) DEFAULT NULL,
  `assoc_type` bigint(20) DEFAULT NULL,
  `assoc_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`submission_file_id`),
  KEY `submission_files_submission_id` (`submission_id`),
  KEY `submission_files_stage_assoc` (`file_stage`,`assoc_type`,`assoc_id`),
  KEY `submission_files_file_id_foreign` (`file_id`),
  CONSTRAINT `submission_files_file_id_foreign` FOREIGN KEY (`file_id`) REFERENCES `files` (`file_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_files`
--

LOCK TABLES `submission_files` WRITE;
/*!40000 ALTER TABLE `submission_files` DISABLE KEYS */;
INSERT INTO `submission_files` VALUES (2,3,1,1,1,2,NULL,NULL,1,'2025-02-25 07:02:17','2025-02-25 07:02:17',1,NULL,NULL),(7,7,6,NULL,4,10,NULL,NULL,NULL,'2025-02-27 11:55:34','2025-02-27 11:55:40',1,521,3),(8,7,6,7,4,2,NULL,NULL,1,'2025-02-27 11:56:13','2025-02-27 11:56:13',1,NULL,NULL);
/*!40000 ALTER TABLE `submission_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submission_search_keyword_list`
--

DROP TABLE IF EXISTS `submission_search_keyword_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `submission_search_keyword_list` (
  `keyword_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `keyword_text` varchar(60) NOT NULL,
  PRIMARY KEY (`keyword_id`),
  UNIQUE KEY `submission_search_keyword_text` (`keyword_text`)
) ENGINE=InnoDB AUTO_INCREMENT=143 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_search_keyword_list`
--

LOCK TABLES `submission_search_keyword_list` WRITE;
/*!40000 ALTER TABLE `submission_search_keyword_list` DISABLE KEYS */;
INSERT INTO `submission_search_keyword_list` VALUES (140,'aaa'),(132,'ability'),(67,'additionally'),(110,'agricultural'),(96,'alami'),(107,'amount'),(10,'analisis'),(23,'analyse'),(56,'analysis'),(8,'asmita'),(6,'azhar'),(91,'bacillus'),(134,'beneficial'),(97,'berbeda'),(113,'carried'),(115,'chemical'),(61,'choice'),(45,'collected'),(57,'considers'),(40,'continue'),(86,'continuing'),(44,'data'),(74,'decision'),(39,'decisions'),(121,'decrease'),(31,'degree'),(105,'demand'),(93,'dengan'),(82,'develop'),(24,'discrete'),(13,'diskrit'),(11,'distribusi'),(26,'distribution'),(62,'education'),(79,'educational'),(124,'elements'),(122,'essential'),(36,'evaluates'),(76,'expected'),(66,'external'),(37,'factors'),(51,'faculty'),(70,'family'),(128,'farming'),(139,'fertility'),(117,'fertilizers'),(64,'financial'),(75,'findings'),(104,'food'),(100,'germinasi'),(102,'glycine'),(137,'growth'),(42,'higher'),(119,'impact'),(72,'important'),(84,'increase'),(1,'indika'),(38,'influence'),(59,'information'),(78,'insights'),(80,'institutions'),(47,'involving'),(5,'islam'),(95,'karbon'),(101,'kedelai'),(99,'laju'),(120,'land'),(92,'laterosporus'),(43,'level'),(106,'line'),(20,'magister'),(14,'mahasiswa'),(138,'maintain'),(30,'master'),(55,'mataram'),(48,'mathematics'),(103,'max'),(3,'megalanik'),(17,'menempuh'),(19,'menuju'),(135,'metabolites'),(34,'methods'),(131,'microorganism'),(35,'models'),(69,'motivation'),(52,'natural'),(126,'needed'),(118,'negative'),(85,'number'),(7,'nur'),(21,'objective'),(87,'opportunity'),(123,'organic'),(12,'peluang'),(89,'pemberian'),(88,'pengaruh'),(68,'personal'),(63,'plans'),(136,'plant'),(127,'plants'),(71,'play'),(81,'policymakers'),(25,'probability'),(133,'produce'),(108,'production'),(111,'products'),(50,'program'),(60,'programs'),(77,'provide'),(114,'provision'),(9,'purnamasari'),(29,'pursue'),(109,'quality'),(22,'research'),(130,'restore'),(73,'role'),(2,'safitri'),(18,'sarjana'),(53,'sciences'),(16,'sedang'),(125,'soil'),(129,'solution'),(33,'statistical'),(83,'strategies'),(112,'strategy'),(28,'students'),(41,'studies'),(49,'study'),(94,'sumber'),(65,'support'),(46,'survey'),(90,'suspensi'),(116,'synthetic'),(98,'terhadap'),(141,'tesss'),(142,'tttt'),(27,'undergraduate'),(4,'universitas'),(54,'university'),(32,'utilizing'),(58,'variables'),(15,'yang');
/*!40000 ALTER TABLE `submission_search_keyword_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submission_search_object_keywords`
--

DROP TABLE IF EXISTS `submission_search_object_keywords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `submission_search_object_keywords` (
  `object_id` bigint(20) NOT NULL,
  `keyword_id` bigint(20) NOT NULL,
  `pos` int(11) NOT NULL COMMENT 'Word position of the keyword in the object.',
  UNIQUE KEY `submission_search_object_keywords_pkey` (`object_id`,`pos`),
  KEY `submission_search_object_keywords_keyword_id` (`keyword_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_search_object_keywords`
--

LOCK TABLES `submission_search_object_keywords` WRITE;
/*!40000 ALTER TABLE `submission_search_object_keywords` DISABLE KEYS */;
INSERT INTO `submission_search_object_keywords` VALUES (25,140,0),(25,140,1),(26,141,0),(27,141,0),(26,142,1);
/*!40000 ALTER TABLE `submission_search_object_keywords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submission_search_objects`
--

DROP TABLE IF EXISTS `submission_search_objects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `submission_search_objects` (
  `object_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `submission_id` bigint(20) NOT NULL,
  `type` int(11) NOT NULL COMMENT 'Type of item. E.g., abstract, fulltext, etc.',
  `assoc_id` bigint(20) DEFAULT NULL COMMENT 'Optional ID of an associated record (e.g., a file_id)',
  PRIMARY KEY (`object_id`),
  KEY `submission_search_object_submission` (`submission_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_search_objects`
--

LOCK TABLES `submission_search_objects` WRITE;
/*!40000 ALTER TABLE `submission_search_objects` DISABLE KEYS */;
INSERT INTO `submission_search_objects` VALUES (25,12,1,0),(26,12,2,0),(27,12,4,0),(28,12,16,0),(29,12,17,0),(30,12,8,0),(31,12,32,0),(32,12,64,0);
/*!40000 ALTER TABLE `submission_search_objects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submission_settings`
--

DROP TABLE IF EXISTS `submission_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `submission_settings` (
  `submission_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext,
  UNIQUE KEY `submission_settings_pkey` (`submission_id`,`locale`,`setting_name`),
  KEY `submission_settings_submission_id` (`submission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_settings`
--

LOCK TABLES `submission_settings` WRITE;
/*!40000 ALTER TABLE `submission_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `submission_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submission_tombstones`
--

DROP TABLE IF EXISTS `submission_tombstones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `submission_tombstones` (
  `tombstone_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `submission_id` bigint(20) NOT NULL,
  `date_deleted` datetime NOT NULL,
  `journal_id` bigint(20) NOT NULL,
  `section_id` bigint(20) NOT NULL,
  `set_spec` varchar(255) NOT NULL,
  `set_name` varchar(255) NOT NULL,
  `oai_identifier` varchar(255) NOT NULL,
  PRIMARY KEY (`tombstone_id`),
  KEY `submission_tombstones_journal_id` (`journal_id`),
  KEY `submission_tombstones_submission_id` (`submission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_tombstones`
--

LOCK TABLES `submission_tombstones` WRITE;
/*!40000 ALTER TABLE `submission_tombstones` DISABLE KEYS */;
/*!40000 ALTER TABLE `submission_tombstones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submissions`
--

DROP TABLE IF EXISTS `submissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `submissions` (
  `submission_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `context_id` bigint(20) NOT NULL,
  `current_publication_id` bigint(20) DEFAULT NULL,
  `date_last_activity` datetime DEFAULT NULL,
  `date_submitted` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `stage_id` bigint(20) NOT NULL DEFAULT '1',
  `locale` varchar(14) DEFAULT NULL,
  `status` smallint(6) NOT NULL DEFAULT '1',
  `submission_progress` smallint(6) NOT NULL DEFAULT '1',
  `work_type` smallint(6) DEFAULT '0',
  PRIMARY KEY (`submission_id`),
  KEY `submissions_context_id` (`context_id`),
  KEY `submissions_publication_id` (`current_publication_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submissions`
--

LOCK TABLES `submissions` WRITE;
/*!40000 ALTER TABLE `submissions` DISABLE KEYS */;
INSERT INTO `submissions` VALUES (1,1,1,'2025-02-25 06:44:42',NULL,'2025-02-25 06:44:42',1,'id_ID',1,1,0),(2,1,2,'2025-02-25 06:44:49',NULL,'2025-02-25 06:44:49',1,'id_ID',1,1,0),(3,1,3,'2025-02-27 13:08:18','2025-02-25 07:02:18','2025-02-25 06:52:43',5,'id_ID',1,0,0),(4,1,4,'2025-02-27 10:10:52',NULL,'2025-02-27 10:10:52',1,'id_ID',1,1,0),(5,1,5,'2025-02-27 11:12:46',NULL,'2025-02-27 11:12:46',1,'id_ID',1,1,0),(7,1,7,'2025-02-27 13:07:11','2025-02-27 11:56:14','2025-02-27 11:54:09',5,'id_ID',1,0,0),(8,1,8,'2025-02-27 13:09:52',NULL,'2025-02-27 13:08:23',1,'id_ID',1,1,0),(10,1,10,'2025-02-27 13:15:37',NULL,'2025-02-27 13:15:37',1,'id_ID',1,1,0),(12,1,12,'2025-02-27 13:19:36','2025-02-27 13:19:26','2025-02-27 13:17:10',5,'id_ID',3,0,0);
/*!40000 ALTER TABLE `submissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscription_type_settings`
--

DROP TABLE IF EXISTS `subscription_type_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subscription_type_settings` (
  `type_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `subscription_type_settings_pkey` (`type_id`,`locale`,`setting_name`),
  KEY `subscription_type_settings_type_id` (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscription_type_settings`
--

LOCK TABLES `subscription_type_settings` WRITE;
/*!40000 ALTER TABLE `subscription_type_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `subscription_type_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscription_types`
--

DROP TABLE IF EXISTS `subscription_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subscription_types` (
  `type_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `journal_id` bigint(20) NOT NULL,
  `cost` double(8,2) NOT NULL,
  `currency_code_alpha` varchar(3) NOT NULL,
  `duration` smallint(6) DEFAULT NULL,
  `format` smallint(6) NOT NULL,
  `institutional` smallint(6) NOT NULL DEFAULT '0',
  `membership` smallint(6) NOT NULL DEFAULT '0',
  `disable_public_display` smallint(6) NOT NULL,
  `seq` double(8,2) NOT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscription_types`
--

LOCK TABLES `subscription_types` WRITE;
/*!40000 ALTER TABLE `subscription_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `subscription_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscriptions`
--

DROP TABLE IF EXISTS `subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subscriptions` (
  `subscription_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `journal_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `type_id` bigint(20) NOT NULL,
  `date_start` date DEFAULT NULL,
  `date_end` datetime DEFAULT NULL,
  `status` smallint(6) NOT NULL DEFAULT '1',
  `membership` varchar(40) DEFAULT NULL,
  `reference_number` varchar(40) DEFAULT NULL,
  `notes` text,
  PRIMARY KEY (`subscription_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscriptions`
--

LOCK TABLES `subscriptions` WRITE;
/*!40000 ALTER TABLE `subscriptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `subscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `temporary_files`
--

DROP TABLE IF EXISTS `temporary_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `temporary_files` (
  `file_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `file_name` varchar(90) NOT NULL,
  `file_type` varchar(255) DEFAULT NULL,
  `file_size` bigint(20) NOT NULL,
  `original_file_name` varchar(127) DEFAULT NULL,
  `date_uploaded` datetime NOT NULL,
  PRIMARY KEY (`file_id`),
  KEY `temporary_files_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `temporary_files`
--

LOCK TABLES `temporary_files` WRITE;
/*!40000 ALTER TABLE `temporary_files` DISABLE KEYS */;
INSERT INTO `temporary_files` VALUES (5,1,'pngWyO4Xc','image/png',13920,'LOGO.png','2025-02-25 02:23:03'),(18,1,'jpgJvqlYX','image/jpeg',120803,'cover_issue_41_en_US.jpg','2025-02-25 06:48:16'),(19,1,'jpgylVM4g','image/jpeg',120803,'cover_issue_41_en_US.jpg','2025-02-25 06:49:26');
/*!40000 ALTER TABLE `temporary_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usage_stats_temporary_records`
--

DROP TABLE IF EXISTS `usage_stats_temporary_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usage_stats_temporary_records` (
  `assoc_id` bigint(20) NOT NULL,
  `assoc_type` bigint(20) NOT NULL,
  `day` bigint(20) NOT NULL,
  `entry_time` bigint(20) NOT NULL,
  `metric` bigint(20) NOT NULL DEFAULT '1',
  `country_id` varchar(2) DEFAULT NULL,
  `region` varchar(2) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `load_id` varchar(255) NOT NULL,
  `file_type` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usage_stats_temporary_records`
--

LOCK TABLES `usage_stats_temporary_records` WRITE;
/*!40000 ALTER TABLE `usage_stats_temporary_records` DISABLE KEYS */;
/*!40000 ALTER TABLE `usage_stats_temporary_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_group_settings`
--

DROP TABLE IF EXISTS `user_group_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_group_settings` (
  `user_group_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)',
  UNIQUE KEY `user_group_settings_pkey` (`user_group_id`,`locale`,`setting_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_group_settings`
--

LOCK TABLES `user_group_settings` WRITE;
/*!40000 ALTER TABLE `user_group_settings` DISABLE KEYS */;
INSERT INTO `user_group_settings` VALUES (1,'en_US','name','Site Admin','string'),(1,'id_ID','name','##default.groups.name.siteAdmin##','string'),(2,'','abbrevLocaleKey','default.groups.abbrev.manager','string'),(2,'','nameLocaleKey','default.groups.name.manager','string'),(2,'en_US','abbrev','##default.groups.abbrev.manager##','string'),(2,'en_US','name','##default.groups.name.manager##','string'),(2,'id_ID','abbrev','JM','string'),(2,'id_ID','name','Manajer Jurnal','string'),(3,'','abbrevLocaleKey','default.groups.abbrev.editor','string'),(3,'','nameLocaleKey','default.groups.name.editor','string'),(3,'en_US','abbrev','##default.groups.abbrev.editor##','string'),(3,'en_US','name','##default.groups.name.editor##','string'),(3,'id_ID','abbrev','JE','string'),(3,'id_ID','name','Editor Jurnal','string'),(4,'','abbrevLocaleKey','default.groups.abbrev.productionEditor','string'),(4,'','nameLocaleKey','default.groups.name.productionEditor','string'),(4,'en_US','abbrev','##default.groups.abbrev.productionEditor##','string'),(4,'en_US','name','##default.groups.name.productionEditor##','string'),(4,'id_ID','abbrev','ProdE','string'),(4,'id_ID','name','Editor produksi','string'),(5,'','abbrevLocaleKey','default.groups.abbrev.sectionEditor','string'),(5,'','nameLocaleKey','default.groups.name.sectionEditor','string'),(5,'en_US','abbrev','##default.groups.abbrev.sectionEditor##','string'),(5,'en_US','name','##default.groups.name.sectionEditor##','string'),(5,'id_ID','abbrev','EdBag','string'),(5,'id_ID','name','Editor Bagian','string'),(6,'','abbrevLocaleKey','default.groups.abbrev.guestEditor','string'),(6,'','nameLocaleKey','default.groups.name.guestEditor','string'),(6,'en_US','abbrev','##default.groups.abbrev.guestEditor##','string'),(6,'en_US','name','##default.groups.name.guestEditor##','string'),(6,'id_ID','abbrev','GE','string'),(6,'id_ID','name','Editor Tamu','string'),(7,'','abbrevLocaleKey','default.groups.abbrev.copyeditor','string'),(7,'','nameLocaleKey','default.groups.name.copyeditor','string'),(7,'en_US','abbrev','##default.groups.abbrev.copyeditor##','string'),(7,'en_US','name','##default.groups.name.copyeditor##','string'),(7,'id_ID','abbrev','CE','string'),(7,'id_ID','name','Copyeditor','string'),(8,'','abbrevLocaleKey','default.groups.abbrev.designer','string'),(8,'','nameLocaleKey','default.groups.name.designer','string'),(8,'en_US','abbrev','##default.groups.abbrev.designer##','string'),(8,'en_US','name','##default.groups.name.designer##','string'),(8,'id_ID','abbrev','Desain','string'),(8,'id_ID','name','Desainer','string'),(9,'','abbrevLocaleKey','default.groups.abbrev.funding','string'),(9,'','nameLocaleKey','default.groups.name.funding','string'),(9,'en_US','abbrev','##default.groups.abbrev.funding##','string'),(9,'en_US','name','##default.groups.name.funding##','string'),(9,'id_ID','abbrev','FC','string'),(9,'id_ID','name','Koordinator pendanaan','string'),(10,'','abbrevLocaleKey','default.groups.abbrev.indexer','string'),(10,'','nameLocaleKey','default.groups.name.indexer','string'),(10,'en_US','abbrev','##default.groups.abbrev.indexer##','string'),(10,'en_US','name','##default.groups.name.indexer##','string'),(10,'id_ID','abbrev','IND','string'),(10,'id_ID','name','Pengindeks','string'),(11,'','abbrevLocaleKey','default.groups.abbrev.layoutEditor','string'),(11,'','nameLocaleKey','default.groups.name.layoutEditor','string'),(11,'en_US','abbrev','##default.groups.abbrev.layoutEditor##','string'),(11,'en_US','name','##default.groups.name.layoutEditor##','string'),(11,'id_ID','abbrev','LE','string'),(11,'id_ID','name','Editor Tata Letak','string'),(12,'','abbrevLocaleKey','default.groups.abbrev.marketing','string'),(12,'','nameLocaleKey','default.groups.name.marketing','string'),(12,'en_US','abbrev','##default.groups.abbrev.marketing##','string'),(12,'en_US','name','##default.groups.name.marketing##','string'),(12,'id_ID','abbrev','MS','string'),(12,'id_ID','name','Koordinator penjualan dan pemasaran','string'),(13,'','abbrevLocaleKey','default.groups.abbrev.proofreader','string'),(13,'','nameLocaleKey','default.groups.name.proofreader','string'),(13,'en_US','abbrev','##default.groups.abbrev.proofreader##','string'),(13,'en_US','name','##default.groups.name.proofreader##','string'),(13,'id_ID','abbrev','PR','string'),(13,'id_ID','name','Proofreader','string'),(14,'','abbrevLocaleKey','default.groups.abbrev.author','string'),(14,'','nameLocaleKey','default.groups.name.author','string'),(14,'en_US','abbrev','##default.groups.abbrev.author##','string'),(14,'en_US','name','##default.groups.name.author##','string'),(14,'id_ID','abbrev','AU','string'),(14,'id_ID','name','Penulis','string'),(15,'','abbrevLocaleKey','default.groups.abbrev.translator','string'),(15,'','nameLocaleKey','default.groups.name.translator','string'),(15,'en_US','abbrev','##default.groups.abbrev.translator##','string'),(15,'en_US','name','##default.groups.name.translator##','string'),(15,'id_ID','abbrev','Trans','string'),(15,'id_ID','name','Penerjemah','string'),(16,'','abbrevLocaleKey','default.groups.abbrev.externalReviewer','string'),(16,'','nameLocaleKey','default.groups.name.externalReviewer','string'),(16,'en_US','abbrev','##default.groups.abbrev.externalReviewer##','string'),(16,'en_US','name','##default.groups.name.externalReviewer##','string'),(16,'id_ID','abbrev','R','string'),(16,'id_ID','name','Mitra Bestari','string'),(17,'','abbrevLocaleKey','default.groups.abbrev.reader','string'),(17,'','nameLocaleKey','default.groups.name.reader','string'),(17,'en_US','abbrev','##default.groups.abbrev.reader##','string'),(17,'en_US','name','##default.groups.name.reader##','string'),(17,'id_ID','abbrev','Baca','string'),(17,'id_ID','name','Pembaca','string'),(18,'','abbrevLocaleKey','default.groups.abbrev.subscriptionManager','string'),(18,'','nameLocaleKey','default.groups.name.subscriptionManager','string'),(18,'en_US','abbrev','##default.groups.abbrev.subscriptionManager##','string'),(18,'en_US','name','##default.groups.name.subscriptionManager##','string'),(18,'id_ID','abbrev','MReg','string'),(18,'id_ID','name','Manajer Langganan','string');
/*!40000 ALTER TABLE `user_group_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_group_stage`
--

DROP TABLE IF EXISTS `user_group_stage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_group_stage` (
  `context_id` bigint(20) NOT NULL,
  `user_group_id` bigint(20) NOT NULL,
  `stage_id` bigint(20) NOT NULL,
  UNIQUE KEY `user_group_stage_pkey` (`context_id`,`user_group_id`,`stage_id`),
  KEY `user_group_stage_context_id` (`context_id`),
  KEY `user_group_stage_user_group_id` (`user_group_id`),
  KEY `user_group_stage_stage_id` (`stage_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_group_stage`
--

LOCK TABLES `user_group_stage` WRITE;
/*!40000 ALTER TABLE `user_group_stage` DISABLE KEYS */;
INSERT INTO `user_group_stage` VALUES (1,3,1),(1,3,3),(1,3,4),(1,3,5),(1,4,4),(1,4,5),(1,5,1),(1,5,3),(1,5,4),(1,5,5),(1,6,1),(1,6,3),(1,6,4),(1,6,5),(1,7,4),(1,8,5),(1,9,1),(1,9,3),(1,10,5),(1,11,5),(1,12,4),(1,13,5),(1,14,1),(1,14,3),(1,14,4),(1,14,5),(1,15,1),(1,15,3),(1,15,4),(1,15,5),(1,16,3);
/*!40000 ALTER TABLE `user_group_stage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_groups`
--

DROP TABLE IF EXISTS `user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_groups` (
  `user_group_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `context_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  `is_default` smallint(6) NOT NULL DEFAULT '0',
  `show_title` smallint(6) NOT NULL DEFAULT '1',
  `permit_self_registration` smallint(6) NOT NULL DEFAULT '0',
  `permit_metadata_edit` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_group_id`),
  KEY `user_groups_user_group_id` (`user_group_id`),
  KEY `user_groups_context_id` (`context_id`),
  KEY `user_groups_role_id` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_groups`
--

LOCK TABLES `user_groups` WRITE;
/*!40000 ALTER TABLE `user_groups` DISABLE KEYS */;
INSERT INTO `user_groups` VALUES (1,0,1,1,0,0,0),(2,1,16,1,0,0,1),(3,1,16,1,0,0,1),(4,1,16,1,0,0,1),(5,1,17,1,0,0,1),(6,1,17,1,0,0,0),(7,1,4097,1,0,0,0),(8,1,4097,1,0,0,0),(9,1,4097,1,0,0,0),(10,1,4097,1,0,0,0),(11,1,4097,1,0,0,0),(12,1,4097,1,0,0,0),(13,1,4097,1,0,0,0),(14,1,65536,1,0,1,0),(15,1,65536,1,0,0,0),(16,1,4096,1,0,1,0),(17,1,1048576,1,0,1,0),(18,1,2097152,1,0,0,0);
/*!40000 ALTER TABLE `user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_interests`
--

DROP TABLE IF EXISTS `user_interests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_interests` (
  `user_id` bigint(20) NOT NULL,
  `controlled_vocab_entry_id` bigint(20) NOT NULL,
  UNIQUE KEY `u_e_pkey` (`user_id`,`controlled_vocab_entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_interests`
--

LOCK TABLES `user_interests` WRITE;
/*!40000 ALTER TABLE `user_interests` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_interests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_settings`
--

DROP TABLE IF EXISTS `user_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_settings` (
  `user_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `assoc_type` bigint(20) NOT NULL DEFAULT '0',
  `assoc_id` bigint(20) NOT NULL DEFAULT '0',
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `user_settings_pkey` (`user_id`,`locale`,`setting_name`,`assoc_type`,`assoc_id`),
  KEY `user_settings_user_id` (`user_id`),
  KEY `user_settings_locale_setting_name_index` (`setting_name`,`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_settings`
--

LOCK TABLES `user_settings` WRITE;
/*!40000 ALTER TABLE `user_settings` DISABLE KEYS */;
INSERT INTO `user_settings` VALUES (1,'en_US','familyName',0,0,'','string'),(1,'en_US','givenName',0,0,'','string'),(1,'en_US','preferredPublicName',0,0,'Fakultas Kedokteran Universitas Islam Al-Azhar','string'),(1,'id_ID','familyName',0,0,'username_ojs','string'),(1,'id_ID','givenName',0,0,'username_ojs','string'),(1,'id_ID','preferredPublicName',0,0,'Fakultas Kedokteran Universitas Islam Al-Azhar','string'),(2,'','orcid',0,0,'','string'),(2,'id_ID','affiliation',0,0,'','string'),(2,'id_ID','biography',0,0,'','string'),(2,'id_ID','familyName',0,0,' Kurniawan','string'),(2,'id_ID','givenName',0,0,'irham','string'),(2,'id_ID','preferredPublicName',0,0,'irham','string'),(2,'id_ID','signature',0,0,'','string');
/*!40000 ALTER TABLE `user_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_user_groups`
--

DROP TABLE IF EXISTS `user_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_user_groups` (
  `user_group_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  UNIQUE KEY `user_user_groups_pkey` (`user_group_id`,`user_id`),
  KEY `user_user_groups_user_group_id` (`user_group_id`),
  KEY `user_user_groups_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_user_groups`
--

LOCK TABLES `user_user_groups` WRITE;
/*!40000 ALTER TABLE `user_user_groups` DISABLE KEYS */;
INSERT INTO `user_user_groups` VALUES (1,1),(2,1),(3,2),(6,2),(15,2),(17,2);
/*!40000 ALTER TABLE `user_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `url` varchar(2047) DEFAULT NULL,
  `phone` varchar(32) DEFAULT NULL,
  `mailing_address` varchar(255) DEFAULT NULL,
  `billing_address` varchar(255) DEFAULT NULL,
  `country` varchar(90) DEFAULT NULL,
  `locales` varchar(255) DEFAULT NULL,
  `gossip` text,
  `date_last_email` datetime DEFAULT NULL,
  `date_registered` datetime NOT NULL,
  `date_validated` datetime DEFAULT NULL,
  `date_last_login` datetime NOT NULL,
  `must_change_password` smallint(6) DEFAULT NULL,
  `auth_id` bigint(20) DEFAULT NULL,
  `auth_str` varchar(255) DEFAULT NULL,
  `disabled` smallint(6) NOT NULL DEFAULT '0',
  `disabled_reason` text,
  `inline_help` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `users_username` (`username`),
  UNIQUE KEY `users_email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'username_ojs','$2y$10$poTQcLUp9KQxKNgXRoSHUeANNkKAhePwxkVX8GBngpaM5A4hEkzyS','irham.devv@gmail.com',NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,'2025-02-25 01:51:19',NULL,'2025-02-27 13:15:47',0,NULL,NULL,0,NULL,1),(2,'irham','$2y$10$TjnS87cQloMVE7dRh62f0.TK1VmKj7ODqRkC.ADhp/X3cgO9j4YYW','irham@gmail.com','','','',NULL,'ID','id_ID',NULL,NULL,'2025-02-25 02:33:47',NULL,'2025-02-25 02:33:47',1,NULL,NULL,0,NULL,1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `versions`
--

DROP TABLE IF EXISTS `versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `versions` (
  `major` int(11) NOT NULL DEFAULT '0' COMMENT 'Major component of version number, e.g. the 2 in OJS 2.3.8-0',
  `minor` int(11) NOT NULL DEFAULT '0' COMMENT 'Minor component of version number, e.g. the 3 in OJS 2.3.8-0',
  `revision` int(11) NOT NULL DEFAULT '0' COMMENT 'Revision component of version number, e.g. the 8 in OJS 2.3.8-0',
  `build` int(11) NOT NULL DEFAULT '0' COMMENT 'Build component of version number, e.g. the 0 in OJS 2.3.8-0',
  `date_installed` datetime NOT NULL,
  `current` smallint(6) NOT NULL DEFAULT '0' COMMENT '1 iff the version entry being described is currently active. This permits the table to store past installation history for forensic purposes.',
  `product_type` varchar(30) DEFAULT NULL COMMENT 'Describes the type of product this row describes, e.g. "plugins.generic" (for a generic plugin) or "core" for the application itelf',
  `product` varchar(30) DEFAULT NULL COMMENT 'Uniquely identifies the product this version row describes, e.g. "ojs2" for OJS 2.x, "languageToggle" for the language toggle block plugin, etc.',
  `product_class_name` varchar(80) DEFAULT NULL COMMENT 'Specifies the class name associated with this product, for plugins, or the empty string where not applicable.',
  `lazy_load` smallint(6) NOT NULL DEFAULT '0' COMMENT '1 iff the row describes a lazy-load plugin; 0 otherwise',
  `sitewide` smallint(6) NOT NULL DEFAULT '0' COMMENT '1 iff the row describes a site-wide plugin; 0 otherwise',
  UNIQUE KEY `versions_pkey` (`product_type`,`product`,`major`,`minor`,`revision`,`build`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `versions`
--

LOCK TABLES `versions` WRITE;
/*!40000 ALTER TABLE `versions` DISABLE KEYS */;
INSERT INTO `versions` VALUES (1,0,0,0,'2025-02-25 01:51:26',1,'plugins.metadata','dc11','',0,0),(1,0,0,0,'2025-02-25 01:51:26',1,'plugins.blocks','information','InformationBlockPlugin',1,0),(1,0,0,0,'2025-02-25 01:51:26',1,'plugins.blocks','languageToggle','LanguageToggleBlockPlugin',1,0),(1,1,0,0,'2025-02-25 01:51:26',1,'plugins.blocks','subscription','SubscriptionBlockPlugin',1,0),(1,0,1,0,'2025-02-25 01:51:26',1,'plugins.blocks','browse','BrowseBlockPlugin',1,0),(1,0,0,0,'2025-02-25 01:51:26',1,'plugins.blocks','makeSubmission','MakeSubmissionBlockPlugin',1,0),(1,0,0,0,'2025-02-25 01:51:26',1,'plugins.blocks','developedBy','DevelopedByBlockPlugin',1,0),(1,0,0,0,'2025-02-25 01:51:26',1,'plugins.gateways','resolver','',0,0),(1,0,0,0,'2025-02-25 01:51:26',1,'plugins.generic','recommendByAuthor','RecommendByAuthorPlugin',1,1),(1,2,0,0,'2025-02-25 01:51:26',1,'plugins.generic','customBlockManager','CustomBlockManagerPlugin',1,0),(1,0,0,0,'2025-02-25 01:51:27',1,'plugins.generic','recommendBySimilarity','RecommendBySimilarityPlugin',1,1),(1,1,0,0,'2025-02-25 01:51:27',1,'plugins.generic','googleScholar','GoogleScholarPlugin',1,0),(1,0,0,0,'2025-02-25 01:51:27',1,'plugins.generic','dublinCoreMeta','DublinCoreMetaPlugin',1,0),(1,0,0,0,'2025-02-25 01:51:27',1,'plugins.generic','usageEvent','',0,0),(1,0,0,0,'2025-02-25 01:51:27',1,'plugins.generic','googleAnalytics','GoogleAnalyticsPlugin',1,0),(1,0,0,0,'2025-02-25 01:51:27',1,'plugins.generic','announcementFeed','AnnouncementFeedPlugin',1,0),(1,0,0,0,'2025-02-25 01:51:27',1,'plugins.generic','tinymce','TinyMCEPlugin',1,0),(1,0,0,0,'2025-02-25 01:51:27',1,'plugins.generic','htmlArticleGalley','HtmlArticleGalleyPlugin',1,0),(1,0,1,0,'2025-02-25 01:51:27',1,'plugins.generic','pdfJsViewer','PdfJsViewerPlugin',1,0),(1,0,0,0,'2025-02-25 01:51:27',1,'plugins.generic','usageStats','UsageStatsPlugin',0,1),(1,2,0,0,'2025-02-25 01:51:27',1,'plugins.generic','staticPages','StaticPagesPlugin',1,0),(1,0,0,0,'2025-02-25 01:51:27',1,'plugins.generic','driver','DRIVERPlugin',1,0),(1,2,0,0,'2025-02-25 01:51:27',1,'plugins.generic','acron','AcronPlugin',1,1),(0,1,0,0,'2025-02-25 01:51:27',1,'plugins.generic','citationStyleLanguage','CitationStyleLanguagePlugin',1,0),(1,0,1,0,'2025-02-25 01:51:27',1,'plugins.generic','lensGalley','LensGalleyPlugin',1,0),(1,1,3,14,'2025-02-25 01:51:27',1,'plugins.generic','orcidProfile','OrcidProfilePlugin',1,0),(1,0,0,0,'2025-02-25 01:51:27',1,'plugins.generic','webFeed','WebFeedPlugin',1,0),(2,1,0,0,'2025-02-25 01:51:27',1,'plugins.importexport','crossref','',0,0),(1,0,0,0,'2025-02-25 01:51:27',1,'plugins.importexport','users','',0,0),(1,0,0,0,'2025-02-25 01:51:27',1,'plugins.importexport','native','',0,0),(1,1,0,0,'2025-02-25 01:51:27',1,'plugins.importexport','doaj','',0,0),(1,0,0,0,'2025-02-25 01:51:27',1,'plugins.importexport','pubmed','',0,0),(2,0,0,0,'2025-02-25 01:51:27',1,'plugins.importexport','datacite','',0,0),(1,0,0,0,'2025-02-25 01:51:27',1,'plugins.oaiMetadataFormats','rfc1807','',0,0),(1,0,0,0,'2025-02-25 01:51:27',1,'plugins.oaiMetadataFormats','marcxml','',0,0),(1,0,0,0,'2025-02-25 01:51:27',1,'plugins.oaiMetadataFormats','marc','',0,0),(1,0,0,0,'2025-02-25 01:51:27',1,'plugins.oaiMetadataFormats','dc','',0,0),(1,0,0,0,'2025-02-25 01:51:28',1,'plugins.paymethod','manual','',0,0),(1,0,0,0,'2025-02-25 01:51:28',1,'plugins.paymethod','paypal','',0,0),(1,0,0,0,'2025-02-25 01:51:28',1,'plugins.pubIds','doi','DOIPubIdPlugin',1,0),(1,0,0,0,'2025-02-25 01:51:28',1,'plugins.pubIds','urn','URNPubIdPlugin',1,0),(1,1,0,0,'2025-02-25 01:51:28',1,'plugins.reports','counterReport','',0,0),(1,0,0,0,'2025-02-25 01:51:28',1,'plugins.reports','views','',0,0),(1,0,0,0,'2025-02-25 01:51:28',1,'plugins.reports','subscriptions','',0,0),(2,0,0,0,'2025-02-25 01:51:28',1,'plugins.reports','reviewReport','',0,0),(1,0,0,0,'2025-02-25 01:51:28',1,'plugins.reports','articles','',0,0),(1,0,0,0,'2025-02-25 01:51:28',1,'plugins.themes','default','DefaultThemePlugin',1,0),(3,3,0,19,'2025-02-25 01:50:02',1,'core','ojs2','',0,1),(1,0,3,1,'2025-02-25 02:06:46',1,'plugins.themes','defaultManuscript','DefaultManuscriptChildThemePlugin',1,0),(1,0,6,2,'2025-02-25 06:44:09',1,'plugins.importexport','quickSubmit','',0,0),(3,2,0,6,'2025-02-27 00:16:38',1,'plugins.themes','bootstrap3','BootstrapThreeThemePlugin',1,0);
/*!40000 ALTER TABLE `versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'dboj'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-03 13:54:31
