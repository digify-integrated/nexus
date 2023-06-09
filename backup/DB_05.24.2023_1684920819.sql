-- MariaDB dump 10.19  Distrib 10.4.27-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: nexusdb
-- ------------------------------------------------------
-- Server version	10.4.27-MariaDB

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
-- Table structure for table `audit_log`
--

DROP TABLE IF EXISTS `audit_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `audit_log` (
  `audit_log_id` int(50) unsigned NOT NULL AUTO_INCREMENT,
  `table_name` varchar(255) NOT NULL,
  `reference_id` int(10) NOT NULL,
  `log` text NOT NULL,
  `changed_by` varchar(255) NOT NULL,
  `changed_at` datetime NOT NULL,
  PRIMARY KEY (`audit_log_id`),
  KEY `audit_log_index_audit_log_id` (`audit_log_id`),
  KEY `audit_log_index_table_name` (`table_name`),
  KEY `audit_log_index_reference_id` (`reference_id`)
) ENGINE=InnoDB AUTO_INCREMENT=446 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit_log`
--

LOCK TABLES `audit_log` WRITE;
/*!40000 ALTER TABLE `audit_log` DISABLE KEYS */;
INSERT INTO `audit_log` VALUES (1,'users',2,'user_status: Active -> Inactive<br/>','1','2023-04-08 20:33:17'),(2,'users',5,'User created.<br/>email_address: lmicayas@encorefinancials.com<br/>file_as: Administrator<br/>user_status: Active<br/>password_expiry_date: 2022-12-30','1','2023-04-08 21:53:20'),(3,'users',6,'User created.<br/>email_address: lmicayas@encorefinancials.com<br/>file_as: Administrator<br/>user_status: Active<br/>password_expiry_date: 2022-12-30','1','2023-04-08 22:04:22'),(4,'users',7,'User created.<br/>email_address: lmicayas@encorefinancials.com<br/>file_as: Administrator<br/>user_status: Active<br/>password_expiry_date: 2022-12-30','1','2023-04-08 22:07:26'),(5,'users',8,'User created.<br/>email_address: lmicayas@encorefinancials.com<br/>file_as: Administrator<br/>user_status: Active<br/>password_expiry_date: 2022-12-30','1','2023-04-08 22:21:47'),(6,'users',8,'The user 8 has been deleted','1','2023-04-08 22:22:05'),(7,'users',2,'password_expiry_date: 2023-10-07 -> 2022-10-07<br/>','1','2023-04-09 16:49:49'),(8,'users',2,'user_status: Inactive -> Active<br/>','1','2023-04-09 16:50:22'),(9,'users',2,'password_expiry_date: 2022-10-07 -> 2023-10-09<br/>','1','2023-04-09 16:50:33'),(10,'users',2,'Password history created.<br/>user id: 2<br/>email address: ldagulto@encorefinancials.com<br/>password change date: 2023-04-09 16:50:33','0','2023-04-09 16:50:33'),(11,'users',2,'last connection date: 2023-04-08 20:21:32 -> 2023-04-09 17:22:35<br/>','1','2023-04-09 17:22:35'),(12,'users',2,'User created.<br/>dark layout: true','0','2023-04-09 17:22:39'),(13,'users',2,'theme contrast: true -> false<br/>','0','2023-04-09 17:25:32'),(14,'users',2,'theme contrast: false -> true<br/>','0','2023-04-09 17:25:40'),(15,'users',2,'theme contrast: true -> false<br/>','0','2023-04-09 17:25:54'),(16,'users',2,'preset theme: preset-5 -> preset-7<br/>','0','2023-04-09 17:26:14'),(17,'users',2,'preset theme: preset-7 -> preset-1<br/>','0','2023-04-09 17:26:26'),(18,'users',2,'preset theme: preset-1 -> preset-8<br/>','0','2023-04-09 17:26:33'),(19,'users',2,'preset theme: preset-8 -> preset-9<br/>','0','2023-04-09 17:26:35'),(20,'users',2,'preset theme: preset-9 -> preset-8<br/>','0','2023-04-09 17:26:44'),(21,'users',2,'dark layout: true -> false<br/>','0','2023-04-09 17:26:45'),(22,'users',2,'preset theme: preset-8 -> preset-6<br/>','0','2023-04-09 17:26:56'),(23,'users',2,'caption show: false -> true<br/>','0','2023-04-09 17:27:09'),(24,'users',2,'preset theme: preset-6 -> preset-8<br/>','0','2023-04-09 17:40:09'),(25,'users',2,'dark layout: false -> true<br/>','0','2023-04-09 17:40:10'),(26,'users',2,'dark layout: true -> false<br/>','2','2023-04-09 19:00:28'),(27,'users',2,'UI Customization created. <br/><br/>dark layout: true','2','2023-04-09 19:00:55'),(28,'users',2,'caption show: false -> true<br/>','2','2023-04-09 19:21:41'),(29,'users',1,'last connection date: 2023-04-07 20:16:07 -> 2023-04-10 13:19:31<br/>','1','2023-04-10 13:19:31'),(30,'ui_customization_setting',3,'UI Customization created. <br/><br/>dark layout: true','1','2023-04-10 13:22:59'),(31,'ui_customization_setting',3,'dark layout: true -> false<br/>','1','2023-04-10 13:23:30'),(32,'menu_groups',1,'Menu group created. <br/><br/>menu group name: Menu Group<br/>order sequence: 1','1','2023-04-10 14:05:13'),(33,'users',1,'last connection date: 2023-04-10 13:19:31 -> 2023-04-10 18:10:39<br/>','1','2023-04-10 18:10:39'),(34,'menu_groups',2,'Menu group created. <br/><br/>menu group name: Administration','1','2023-04-10 19:22:52'),(35,'menu_groups',2,'The menu group \'2\' has been deleted.','1','2023-04-10 19:23:14'),(36,'menu_groups',1,'The menu group \'1\' has been deleted.','1','2023-04-10 19:23:16'),(37,'menu',1,'Menu created. <br/><br/>menu name: Menu Group<br/>menu group id: 1<br/>order sequence: 1','1','2023-04-10 20:24:47'),(38,'menu',2,'Menu created. <br/><br/>menu name: Menu Item<br/>menu group id: 1<br/>order sequence: 2','1','2023-04-10 20:24:47'),(39,'users',2,'last connection date: 2023-04-09 17:22:35 -> 2023-04-11 08:55:29<br/>','1','2023-04-11 08:55:29'),(40,'ui_customization_setting',2,'dark layout: true -> false<br/>','2','2023-04-11 08:56:32'),(41,'ui_customization_setting',2,'dark layout: false -> true<br/>','2','2023-04-11 08:58:47'),(42,'ui_customization_setting',2,'dark layout: true -> false<br/>','2','2023-04-11 08:58:57'),(43,'ui_customization_setting',2,'dark layout: false -> true<br/>','2','2023-04-11 08:59:00'),(44,'users',2,'password expiry date: 2023-10-09 -> 2022-10-09<br/>','1','2023-04-11 09:03:15'),(45,'users',2,'password expiry date: 2022-10-09 -> 2023-10-11<br/>','1','2023-04-11 09:03:37'),(46,'users',2,'password expiry date: 2023-10-11 -> 1899-12-31<br/>','1','2023-04-11 09:03:43'),(47,'users',2,'password expiry date: 1899-12-31 -> 2023-10-11<br/>','1','2023-04-11 09:04:49'),(48,'users',2,'failed login: 0 -> 1<br/>last failed login: 2023-04-07 19:57:52 -> 2023-04-11 09:05:45<br/>','1','2023-04-11 09:05:45'),(49,'users',2,'failed login: 1 -> 0<br/>','1','2023-04-11 09:05:48'),(50,'users',2,'last connection date: 2023-04-11 08:55:29 -> 2023-04-11 09:05:48<br/>','1','2023-04-11 09:05:48'),(51,'users',1,'failed login: 0 -> 1<br/>','1','2023-04-11 11:08:53'),(52,'users',1,'failed login: 1 -> 0<br/>','1','2023-04-11 11:08:57'),(53,'users',1,'last connection date: 2023-04-10 18:10:39 -> 2023-04-11 11:08:57<br/>','1','2023-04-11 11:08:57'),(54,'ui_customization_setting',3,'dark layout: false -> true<br/>','1','2023-04-11 11:09:02'),(55,'ui_customization_setting',3,'theme contrast: true -> false<br/>','1','2023-04-11 11:09:05'),(56,'ui_customization_setting',3,'theme contrast: false -> true<br/>','1','2023-04-11 11:09:06'),(57,'users',1,'failed login: 0 -> 1<br/>last failed login: 2023-04-11 11:08:53 -> 2023-04-12 09:13:12<br/>','1','2023-04-12 09:13:12'),(58,'users',1,'failed login: 1 -> 0<br/>','1','2023-04-12 09:13:16'),(59,'users',1,'last connection date: 2023-04-11 11:08:57 -> 2023-04-12 09:13:16<br/>','1','2023-04-12 09:13:16'),(60,'ui_customization_setting',3,'dark layout: true -> false<br/>','1','2023-04-12 09:23:17'),(61,'ui_customization_setting',3,'dark layout: false -> true<br/>','1','2023-04-12 09:32:05'),(62,'ui_customization_setting',3,'dark layout: true -> false<br/>','1','2023-04-12 09:32:06'),(63,'ui_customization_setting',3,'dark layout: false -> true<br/>','1','2023-04-12 09:40:40'),(64,'ui_customization_setting',3,'dark layout: true -> false<br/>','1','2023-04-12 09:40:41'),(65,'ui_customization_setting',3,'theme contrast: true -> false<br/>','1','2023-04-12 10:38:01'),(66,'ui_customization_setting',3,'theme contrast: false -> true<br/>','1','2023-04-12 10:38:08'),(67,'ui_customization_setting',3,'theme contrast: true -> false<br/>','1','2023-04-12 10:38:08'),(68,'ui_customization_setting',3,'dark layout: false -> true<br/>','1','2023-04-12 10:38:16'),(69,'ui_customization_setting',3,'theme contrast: false -> true<br/>','1','2023-04-12 10:38:17'),(70,'ui_customization_setting',3,'theme contrast: true -> false<br/>','1','2023-04-12 10:38:18'),(71,'ui_customization_setting',3,'dark layout: true -> false<br/>','1','2023-04-12 10:41:29'),(72,'users',1,'last connection date: 2023-04-12 09:13:16 -> 2023-04-12 13:56:44<br/>','1','2023-04-12 13:56:44'),(73,'ui_customization_setting',3,'preset theme: preset-5 -> preset-8<br/>','1','2023-04-12 15:38:52'),(74,'ui_customization_setting',3,'preset theme: preset-8 -> preset-9<br/>','1','2023-04-12 16:26:41'),(75,'users',1,'failed login: 0 -> 1<br/>last failed login: 2023-04-12 09:13:12 -> 2023-04-13 14:06:37<br/>','1','2023-04-13 14:06:38'),(76,'users',1,'failed login: 1 -> 0<br/>','1','2023-04-13 14:06:44'),(77,'users',1,'last connection date: 2023-04-12 13:56:44 -> 2023-04-13 14:06:44<br/>','1','2023-04-13 14:06:44'),(78,'users',2,'failed login: 0 -> 1<br/>last failed login: 2023-04-11 09:05:45 -> 2023-04-13 15:07:02<br/>','1','2023-04-13 15:07:02'),(79,'users',2,'failed login: 1 -> 2<br/>last failed login: 2023-04-13 15:07:02 -> 2023-04-13 15:07:06<br/>','1','2023-04-13 15:07:06'),(80,'users',1,'last connection date: 2023-04-13 14:06:44 -> 2023-04-13 15:07:13<br/>','1','2023-04-13 15:07:13'),(81,'ui_customization_setting',3,'preset theme: preset-9 -> preset-5<br/>','1','2023-04-13 15:11:09'),(82,'ui_customization_setting',3,'preset theme: preset-5 -> preset-1<br/>','1','2023-04-13 15:11:11'),(83,'users',1,'last connection date: 2023-04-13 15:07:13 -> 2023-04-14 09:34:16<br/>','1','2023-04-14 09:34:16'),(84,'ui_customization_setting',3,'dark layout: false -> true<br/>','1','2023-04-14 09:51:47'),(85,'ui_customization_setting',3,'dark layout: true -> false<br/>','1','2023-04-14 09:51:53'),(86,'users',1,'last connection date: 2023-04-14 09:34:16 -> 2023-04-17 15:15:22<br/>','1','2023-04-17 15:15:22'),(87,'users',1,'failed login: 0 -> 1<br/>last failed login: 2023-04-13 14:06:37 -> 2023-04-18 10:42:44<br/>','1','2023-04-18 10:42:44'),(88,'users',1,'failed login: 1 -> 0<br/>','1','2023-04-18 10:42:49'),(89,'users',1,'last connection date: 2023-04-17 15:15:22 -> 2023-04-18 10:42:49<br/>','1','2023-04-18 10:42:49'),(90,'menu_groups',2,'Menu group created. <br/><br/>menu group name: Human Resources<br/>order sequence: 1','1','2023-04-18 10:54:49'),(91,'menu_groups',2,'order sequence: 1 -> 2<br/>','1','2023-04-18 11:07:54'),(92,'menu_groups',2,'order sequence: 2 -> 1<br/>','1','2023-04-18 11:08:11'),(93,'menu_groups',2,'order sequence: 1 -> 3<br/>','1','2023-04-18 11:08:20'),(94,'menu_groups',2,'menu group name: Human Resources -> Human Resources Module<br/>order sequence: 3 -> 1<br/>','1','2023-04-18 11:08:28'),(95,'menu_groups',2,'Menu Group Name: Human Resources Module -> Human Resources<br/>Order Sequence: 1 -> 2<br/>','1','2023-04-18 15:14:02'),(96,'users',1,'Failed Login: 0 -> 1<br/>Last Failed Login: 2023-04-18 10:42:44 -> 2023-04-18 15:14:13<br/>','1','2023-04-18 15:14:13'),(97,'users',1,'Failed Login: 1 -> 0<br/>','1','2023-04-18 15:14:17'),(98,'users',1,'Last Connection Date: 2023-04-18 10:42:49 -> 2023-04-18 15:14:17<br/>','1','2023-04-18 15:14:17'),(99,'users',1,'Last Connection Date: 2023-04-18 15:14:17 -> 2023-04-19 11:37:42<br/>','1','2023-04-19 11:37:42'),(100,'users',1,'Last Connection Date: 2023-04-19 11:37:42 -> 2023-04-19 15:55:04<br/>','1','2023-04-19 15:55:04'),(101,'users',1,'Last Connection Date: 2023-04-19 15:55:04 -> 2023-04-20 10:26:10<br/>','1','2023-04-20 10:26:10'),(102,'menu_groups',3,'Menu group created. <br/><br/>Menu Group Name: admin<br/>Order Sequence: 1','1','2023-04-20 11:55:42'),(103,'menu_groups',4,'Menu group created. <br/><br/>Menu Group Name: Admin<br/>Order Sequence: 3','1','2023-04-20 12:59:31'),(104,'menu_groups',5,'Menu group created. <br/><br/>Menu Group Name: test<br/>Order Sequence: 5','1','2023-04-20 13:00:32'),(105,'menu_groups',6,'Menu group created. <br/><br/>Menu Group Name: asd<br/>Order Sequence: 5','1','2023-04-20 13:14:15'),(106,'menu_groups',7,'Menu group created. <br/><br/>Menu Group Name: asd2<br/>Order Sequence: 5','1','2023-04-20 13:14:23'),(107,'users',1,'Last Connection Date: 2023-04-20 10:26:10 -> 2023-04-21 10:56:42<br/>','1','2023-04-21 10:56:42'),(108,'menu_groups',8,'Menu group created. <br/><br/>Menu Group Name: test<br/>Order Sequence: 4','1','2023-04-21 12:34:59'),(109,'menu_groups',9,'Menu group created. <br/><br/>Menu Group Name: Test<br/>Order Sequence: 1','1','2023-04-21 12:43:59'),(110,'menu_groups',10,'Menu group created. <br/><br/>Menu Group Name: test<br/>Order Sequence: 2','1','2023-04-21 12:44:50'),(111,'menu_groups',11,'Menu group created. <br/><br/>Menu Group Name: test<br/>Order Sequence: 2','1','2023-04-21 12:51:45'),(112,'menu_groups',12,'Menu group created. <br/><br/>Menu Group Name: Administration<br/>Order Sequence: 1','1','2023-04-21 14:02:54'),(113,'menu_groups',13,'Menu group created. <br/><br/>Menu Group Name: Administration<br/>Order Sequence: 1','1','2023-04-21 14:03:03'),(114,'menu_groups',14,'Menu group created. <br/><br/>Menu Group Name: Administration<br/>Order Sequence: 1','1','2023-04-21 14:13:58'),(115,'menu_groups',15,'Menu group created. <br/><br/>Menu Group Name: Administration<br/>Order Sequence: 1','1','2023-04-21 14:21:46'),(116,'menu_groups',16,'Menu group created. <br/><br/>Menu Group Name: Administration<br/>Order Sequence: 1','1','2023-04-21 14:22:32'),(117,'menu_groups',17,'Menu group created. <br/><br/>Menu Group Name: Administration<br/>Order Sequence: 1','1','2023-04-21 14:29:02'),(118,'menu_groups',18,'Menu group created. <br/><br/>Menu Group Name: Administration<br/>Order Sequence: 1','1','2023-04-21 14:29:54'),(119,'menu_groups',19,'Menu group created. <br/><br/>Menu Group Name: Administration<br/>Order Sequence: 1','1','2023-04-21 14:30:26'),(120,'menu_groups',20,'Menu group created. <br/><br/>Menu Group Name: Administration<br/>Order Sequence: 1','1','2023-04-21 14:30:30'),(121,'menu_groups',1,'Menu group created. <br/><br/>Menu Group Name: Administrator<br/>Order Sequence: 1','1','2023-04-21 14:55:24'),(122,'menu_groups',1,'Order Sequence: 1 -> 2<br/>','1','2023-04-21 14:58:36'),(123,'menu_groups',1,'Menu Group Name: Administrator -> Administrators<br/>Order Sequence: 2 -> 1<br/>','1','2023-04-21 22:44:01'),(124,'users',1,'Last Connection Date: 2023-04-21 10:56:42 -> 2023-04-22 09:14:52<br/>','1','2023-04-22 09:14:52'),(125,'users',1,'Last Connection Date: 2023-04-22 09:14:52 -> 2023-04-22 11:18:22<br/>','1','2023-04-22 11:18:22'),(126,'users',1,'Last Connection Date: 2023-04-22 11:18:22 -> 2023-04-24 11:17:24<br/>','1','2023-04-24 11:17:24'),(127,'menu_groups',1,'Order Sequence: 1 -> 2<br/>','1','2023-04-25 16:11:32'),(128,'menu_groups',1,'Order Sequence: 2 -> 3<br/>','1','2023-04-25 16:12:46'),(129,'menu_groups',1,'Order Sequence: 3 -> 4<br/>','1','2023-04-25 16:15:34'),(130,'menu_groups',1,'Order Sequence: 4 -> 5<br/>','1','2023-04-25 16:16:52'),(131,'menu_groups',1,'Order Sequence: 5 -> 6<br/>','1','2023-04-25 16:21:45'),(132,'menu_groups',1,'Order Sequence: 6 -> 7<br/>','1','2023-04-25 16:35:17'),(133,'users',2,'Failed Login: 2 -> 3<br/>Last Failed Login: 2023-04-13 15:07:06 -> 2023-04-29 18:29:11<br/>','1','2023-04-29 18:29:11'),(134,'users',1,'Last Connection Date: 2023-04-24 11:17:24 -> 2023-05-01 08:42:11<br/>','1','2023-05-01 08:42:11'),(135,'users',2,'Failed Login: 3 -> 4<br/>Last Failed Login: 2023-04-29 18:29:11 -> 2023-05-01 08:42:32<br/>','1','2023-05-01 08:42:32'),(136,'users',2,'Failed Login: 4 -> 5<br/>Last Failed Login: 2023-05-01 08:42:32 -> 2023-05-01 08:42:36<br/>','1','2023-05-01 08:42:36'),(137,'users',1,'Failed Login: 0 -> 1<br/>Last Failed Login: 2023-04-18 15:14:13 -> 2023-05-01 08:50:59<br/>','1','2023-05-01 08:50:59'),(138,'users',1,'Failed Login: 1 -> 0<br/>','1','2023-05-01 08:51:03'),(139,'users',1,'Last Connection Date: 2023-05-01 08:42:11 -> 2023-05-01 08:51:03<br/>','1','2023-05-01 08:51:03'),(140,'menu_item',1,'Menu created. <br/><br/>Menu Item Name: Test<br/>Menu Group ID: 1<br/>Order Sequence: 1','1','2023-05-01 10:01:09'),(141,'menu_item',2,'Menu created. <br/><br/>Menu Item Name: test<br/>Menu Group ID: 1<br/>Order Sequence: 1','1','2023-05-01 11:20:11'),(142,'menu_item',3,'Menu created. <br/><br/>Menu Item Name: test<br/>Menu Group ID: 1<br/>Order Sequence: 1','1','2023-05-01 11:20:23'),(143,'menu_item',4,'Menu created. <br/><br/>Menu Item Name: test<br/>Menu Group ID: 1<br/>Order Sequence: 1','1','2023-05-01 11:21:11'),(144,'menu_item',5,'Menu created. <br/><br/>Menu Item Name: asd<br/>Menu Group ID: 1<br/>Order Sequence: 1','1','2023-05-01 11:25:04'),(145,'menu_item',6,'Menu created. <br/><br/>Menu Item Name: etes<br/>Menu Group ID: 1<br/>Order Sequence: 1','1','2023-05-01 11:32:47'),(146,'menu_item',7,'Menu created. <br/><br/>Menu Item Name: Test<br/>Menu Group ID: 1<br/>Order Sequence: 1','1','2023-05-01 11:35:15'),(147,'users',1,'Last Connection Date: 2023-05-01 08:51:03 -> 2023-05-01 13:07:21<br/>','1','2023-05-01 13:07:21'),(148,'menu_item',8,'Menu created. <br/><br/>Menu Item Name: Test<br/>Menu Group ID: 1<br/>Order Sequence: 1','1','2023-05-01 14:33:13'),(149,'menu_item',9,'Menu created. <br/><br/>Menu Item Name: Test<br/>Menu Group ID: 1<br/>Order Sequence: 2','1','2023-05-01 14:33:16'),(150,'menu_item',10,'Menu created. <br/><br/>Menu Item Name: Test<br/>Menu Group ID: 1<br/>Order Sequence: 3','1','2023-05-01 14:33:23'),(151,'menu_item',1,'Menu Item Name: Test -> 1<br/>Menu Group ID: 1 -> 0<br/>Order Sequence: 1 -> 8<br/>','1','2023-05-01 15:04:27'),(152,'menu_item',2,'Menu Item Name: test -> 1<br/>Menu Group ID: 1 -> 0<br/>Order Sequence: 1 -> 2<br/>','1','2023-05-01 15:05:16'),(153,'menu_item',1,'Menu Group ID: 0 -> 1<br/>','1','2023-05-01 15:07:15'),(154,'menu_item',2,'Menu Group ID: 0 -> 1<br/>','1','2023-05-01 15:07:18'),(155,'menu_item',1,'Menu Item Name: 1 -> test<br/>','1','2023-05-01 15:07:32'),(156,'menu_item',2,'Menu Item Name: 1 -> test2<br/>','1','2023-05-01 15:07:39'),(157,'menu_item',1,'Order Sequence: 8 -> 10<br/>','1','2023-05-01 15:07:43'),(158,'menu_groups',1,'Order Sequence: 7 -> 1<br/>','1','2023-05-01 15:46:42'),(159,'ui_customization_setting',3,'Box Container: true -> false<br/>','1','2023-05-01 15:50:50'),(160,'ui_customization_setting',3,'Caption Show: false -> true<br/>','1','2023-05-01 15:50:54'),(161,'ui_customization_setting',3,'RTL Layout: true -> false<br/>','1','2023-05-01 15:50:59'),(162,'ui_customization_setting',3,'Preset Theme: preset-1 -> preset-8<br/>','1','2023-05-01 15:51:03'),(163,'ui_customization_setting',3,'Theme Contrast: false -> true<br/>','1','2023-05-01 15:51:09'),(164,'menu_groups',1,'Menu group created. <br/><br/>Menu Group Name: Administration<br/>Order Sequence: 127','1','2023-05-01 16:12:43'),(165,'ui_customization_setting',3,'Theme Contrast: true -> false<br/>','1','2023-05-01 16:49:59'),(166,'menu_item',1,'Menu item created. <br/><br/>Menu Item Name: User Interface<br/>Menu Group ID: 1<br/>Order Sequence: 1','1','2023-05-01 17:48:56'),(167,'menu_item',1,'URL:  -> <br/>Parent ID: 1 -> 0<br/>','1','2023-05-01 19:34:26'),(168,'users',1,'Last Connection Date: 2023-05-01 13:07:21 -> 2023-05-02 09:35:57<br/>','1','2023-05-02 09:35:57'),(169,'ui_customization_setting',3,'Preset Theme: preset-8 -> preset-9<br/>','1','2023-05-02 09:36:02'),(170,'ui_customization_setting',3,'Preset Theme: preset-9 -> preset-5<br/>','1','2023-05-02 09:36:03'),(171,'ui_customization_setting',3,'Preset Theme: preset-5 -> preset-1<br/>','1','2023-05-02 09:36:05'),(172,'menu_item',1,'Menu item created. <br/><br/>Menu Item Name: User Interface<br/>Menu Group ID: 1<br/>Menu Item Icon: &lt;i data-feather=&quot;sidebar&quot;&gt;&lt;/i&gt;<br/>Order Sequence: 1','1','2023-05-02 11:58:11'),(173,'menu_item',1,'Menu Item Icon: &lt;i data-feather=&quot;sidebar&quot;&gt;&lt;/i&gt; -> sidebar<br/>','1','2023-05-02 11:58:33'),(174,'menu_item',1,'Menu Item Icon: sidebar -> &lt;i data-feather=&quot;sidebar&quot;&gt;&lt;/i&gt;<br/>','1','2023-05-02 11:59:50'),(175,'menu_item',1,'Menu Item Icon: &lt;i data-feather=&quot;sidebar&quot;&gt;&lt;/i&gt; -> &lt;svg class=&quot;pc-icon&quot;&gt;&lt;use xlink:href=&quot;#custom-row-vertical&quot;&gt;&lt;/use&gt;&lt;/svg&gt;<br/>','1','2023-05-02 12:39:40'),(176,'menu_item',1,'Menu Item Icon: &lt;svg class=&quot;pc-icon&quot;&gt;&lt;use xlink:href=&quot;#custom-row-vertical&quot;&gt;&lt;/use&gt;&lt;/svg&gt; -> &lt;i data-feather=&quot;sidebar&quot;&gt;&lt;/i&gt;<br/>','1','2023-05-02 12:39:53'),(177,'users',1,'Failed Login: 0 -> 1<br/>Last Failed Login: 2023-05-01 08:50:59 -> 2023-05-03 09:22:39<br/>','1','2023-05-03 09:22:39'),(178,'users',1,'Failed Login: 1 -> 0<br/>','1','2023-05-03 09:22:42'),(179,'users',1,'Last Connection Date: 2023-05-02 09:35:57 -> 2023-05-03 09:22:42<br/>','1','2023-05-03 09:22:42'),(180,'role',2,'Role created. <br/><br/>Role Name: Employee<br/>Role Description: Employee<br/>Assignable: 1','1','2023-05-03 15:28:15'),(181,'users',1,'Last Connection Date: 2023-05-03 09:22:42 -> 2023-05-04 09:17:10<br/>','1','2023-05-04 09:17:10'),(182,'menu_access_right',1,'Role ID: 1<br/>','1','2023-05-04 17:24:19'),(183,'menu_access_right',1,'Role ID: 1<br/>','1','2023-05-04 17:24:19'),(184,'menu_access_right',1,'Role ID: 1<br/>','1','2023-05-04 17:24:19'),(185,'menu_access_right',1,'Role ID: 1<br/>','1','2023-05-04 17:24:19'),(186,'menu_access_right',1,'Role ID: 2<br/>','0','2023-05-04 17:24:19'),(187,'menu_access_right',1,'Role ID: 2<br/>','0','2023-05-04 17:24:19'),(188,'menu_access_right',1,'Role ID: 2<br/>Create Access: 0 -> 1<br/>','0','2023-05-04 17:24:19'),(189,'menu_access_right',1,'Role ID: 2<br/>','0','2023-05-04 17:24:19'),(190,'menu_access_right',1,'Role ID: 1<br/>','1','2023-05-04 17:24:58'),(191,'menu_access_right',1,'Role ID: 1<br/>','1','2023-05-04 17:24:58'),(192,'menu_access_right',1,'Role ID: 1<br/>','1','2023-05-04 17:24:58'),(193,'menu_access_right',1,'Role ID: 1<br/>','1','2023-05-04 17:24:58'),(194,'menu_access_right',1,'Role ID: 2<br/>','0','2023-05-04 17:24:58'),(195,'menu_access_right',1,'Role ID: 2<br/>','0','2023-05-04 17:24:58'),(196,'menu_access_right',1,'Role ID: 2<br/>','0','2023-05-04 17:24:58'),(197,'menu_access_right',1,'Role ID: 2<br/>','0','2023-05-04 17:24:58'),(198,'menu_groups',2,'Menu group created. <br/><br/>Menu Group Name: Administration<br/>Order Sequence: 127','1','2023-05-04 17:25:30'),(199,'users',1,'Last Connection Date: 2023-05-04 09:17:10 -> 2023-05-05 08:36:19<br/>','1','2023-05-05 08:36:19'),(200,'menu_groups',2,'Menu Group Name: Administration -> Human Resources<br/>','1','2023-05-05 08:36:33'),(201,'menu_access_right',1,'Role ID: 1<br/>','1','2023-05-05 09:49:01'),(202,'menu_access_right',1,'Role ID: 1<br/>','1','2023-05-05 09:49:01'),(203,'menu_access_right',1,'Role ID: 1<br/>','1','2023-05-05 09:49:01'),(204,'menu_access_right',1,'Role ID: 1<br/>','1','2023-05-05 09:49:01'),(205,'menu_access_right',1,'Role ID: 2<br/>','0','2023-05-05 09:49:01'),(206,'menu_access_right',1,'Role ID: 2<br/>Write Access: 0 -> 1<br/>','0','2023-05-05 09:49:01'),(207,'menu_access_right',1,'Role ID: 2<br/>','0','2023-05-05 09:49:01'),(208,'menu_access_right',1,'Role ID: 2<br/>','0','2023-05-05 09:49:01'),(209,'menu_item',2,'Menu item created. <br/><br/>Menu Item Name: Menu Groups<br/>Menu Group ID: 1<br/>Parent ID: 1<br/>Order Sequence: 1','1','2023-05-05 09:59:08'),(210,'menu_item',3,'Menu item created. <br/><br/>Menu Item Name: Menu Item<br/>Menu Group ID: 1<br/>Parent ID: 1<br/>Order Sequence: 2','1','2023-05-05 10:00:21'),(211,'menu_access_right',3,'Role ID: 1<br/>Read Access: 0 -> 1<br/>','0','2023-05-05 10:25:32'),(212,'menu_access_right',3,'Role ID: 1<br/>Write Access: 0 -> 1<br/>','0','2023-05-05 10:25:32'),(213,'menu_access_right',3,'Role ID: 1<br/>Create Access: 0 -> 1<br/>','0','2023-05-05 10:25:32'),(214,'menu_access_right',3,'Role ID: 1<br/>Delete Access: 0 -> 1<br/>','0','2023-05-05 10:25:32'),(215,'menu_access_right',3,'Role ID: 2<br/>','0','2023-05-05 10:25:32'),(216,'menu_access_right',3,'Role ID: 2<br/>','0','2023-05-05 10:25:32'),(217,'menu_access_right',3,'Role ID: 2<br/>','0','2023-05-05 10:25:32'),(218,'menu_access_right',3,'Role ID: 2<br/>','0','2023-05-05 10:25:32'),(219,'menu_access_right',2,'Role ID: 1<br/>','1','2023-05-05 10:27:06'),(220,'menu_access_right',2,'Role ID: 1<br/>','1','2023-05-05 10:27:06'),(221,'menu_access_right',2,'Role ID: 1<br/>','1','2023-05-05 10:27:06'),(222,'menu_access_right',2,'Role ID: 1<br/>','1','2023-05-05 10:27:06'),(223,'menu_access_right',2,'Role ID: 2<br/>','0','2023-05-05 10:27:06'),(224,'menu_access_right',2,'Role ID: 2<br/>','0','2023-05-05 10:27:06'),(225,'menu_access_right',2,'Role ID: 2<br/>','0','2023-05-05 10:27:06'),(226,'menu_access_right',2,'Role ID: 2<br/>','0','2023-05-05 10:27:06'),(227,'menu_access_right',1,'Role ID: 1<br/>','1','2023-05-05 10:27:34'),(228,'menu_access_right',1,'Role ID: 1<br/>Write Access: 1 -> 0<br/>','1','2023-05-05 10:27:34'),(229,'menu_access_right',1,'Role ID: 1<br/>Create Access: 1 -> 0<br/>','1','2023-05-05 10:27:34'),(230,'menu_access_right',1,'Role ID: 1<br/>Delete Access: 1 -> 0<br/>','1','2023-05-05 10:27:34'),(231,'menu_access_right',1,'Role ID: 2<br/>','0','2023-05-05 10:27:34'),(232,'menu_access_right',1,'Role ID: 2<br/>Write Access: 1 -> 0<br/>','0','2023-05-05 10:27:34'),(233,'menu_access_right',1,'Role ID: 2<br/>Create Access: 1 -> 0<br/>','0','2023-05-05 10:27:34'),(234,'menu_access_right',1,'Role ID: 2<br/>Delete Access: 1 -> 0<br/>','0','2023-05-05 10:27:34'),(235,'menu_item',1,'Menu Item Icon: &lt;i data-feather=&quot;sidebar&quot;&gt;&lt;/i&gt; -> &amp;lt;i data-feather=&amp;quot;sidebar&amp;quot;&amp;gt;&amp;lt;/i&amp;gt;<br/>','1','2023-05-05 17:06:04'),(236,'menu_item',1,'Menu Item Icon: &amp;lt;i data-feather=&amp;quot;sidebar&amp;quot;&amp;gt;&amp;lt;/i&amp;gt; -> &amp;amp;lt;i data-feather=&amp;amp;quot;sidebar&amp;amp;quot;&amp;amp;gt;&amp;amp;lt;/i&amp;amp;gt;<br/>','1','2023-05-05 17:06:26'),(237,'menu_item',1,'Menu Item Icon: &amp;amp;lt;i data-feather=&amp;amp;quot;sidebar&amp;amp;quot;&amp;amp;gt;&amp;amp;lt;/i&amp;amp;gt; -> &amp;amp;amp;lt;i data-feather=&amp;amp;amp;quot;sidebar&amp;amp;amp;quot;&amp;amp;amp;gt;&amp;amp;amp;lt;/i&amp;amp;amp;gt;<br/>','1','2023-05-05 17:06:54'),(238,'menu_item',1,'Menu Item Icon: &amp;amp;amp;lt;i data-feather=&amp;amp;amp;quot;sidebar&amp;amp;amp;quot;&amp;amp;amp;gt;&amp;amp;amp;lt;/i&amp;amp;amp;gt; -> &amp;amp;amp;amp;lt;i data-feather=&amp;amp;amp;amp;quot;sidebar&amp;amp;amp;amp;quot;&amp;amp;amp;amp;gt;&amp;amp;amp;amp;lt;/i&amp;amp;amp;amp;gt;<br/>','1','2023-05-05 17:09:14'),(239,'menu_item',1,'Menu Item Icon: &amp;amp;amp;amp;lt;i data-feather=&amp;amp;amp;amp;quot;sidebar&amp;amp;amp;amp;quot;&amp;amp;amp;amp;gt;&amp;amp;amp;amp;lt;/i&amp;amp;amp;amp;gt; -> &amp;amp;amp;amp;amp;lt;i data-feather=&amp;amp;amp;amp;amp;quot;sidebar&amp;amp;amp;amp;amp;quot;&amp;amp;amp;amp;amp;gt;&amp;amp;amp;amp;amp;lt;/i&a<br/>','1','2023-05-05 17:09:38'),(240,'menu_item',1,'Menu Item Icon: &amp;amp;amp;amp;amp;lt;i data-feather=&amp;amp;amp;amp;amp;quot;sidebar&amp;amp;amp;amp;amp;quot;&amp;amp;amp;amp;amp;gt;&amp;amp;amp;amp;amp;lt;/i&a -> &amp;amp;amp;amp;amp;amp;lt;i data-feather=&amp;amp;amp;amp;amp;amp;quot;sidebar&amp;amp;amp;amp;amp;amp;quot;&amp;amp;amp;amp;amp;amp;gt;&amp;amp;amp<br/>','1','2023-05-05 17:14:37'),(241,'menu_item',1,'Menu Item Icon: &amp;amp;amp;amp;amp;amp;lt;i data-feather=&amp;amp;amp;amp;amp;amp;quot;sidebar&amp;amp;amp;amp;amp;amp;quot;&amp;amp;amp;amp;amp;amp;gt;&amp;amp;amp -> <br/>','1','2023-05-05 17:15:01'),(242,'users',1,'Last Connection Date: 2023-05-05 08:36:19 -> 2023-05-09 10:57:02<br/>','1','2023-05-09 10:57:02'),(243,'users',1,'Last Connection Date: 2023-05-09 10:57:02 -> 2023-05-10 11:35:14<br/>','1','2023-05-10 11:35:14'),(244,'menu_item',4,'Menu item created. <br/><br/>Menu Item Name: Menu Groups<br/>Menu Group ID: 1<br/>Parent ID: 1<br/>Order Sequence: 5','1','2023-05-10 14:33:32'),(245,'users',1,'Last Connection Date: 2023-05-10 11:35:14 -> 2023-05-11 13:06:39<br/>','1','2023-05-11 13:06:39'),(246,'users',1,'Last Connection Date: 2023-05-11 13:06:39 -> 2023-05-12 15:30:53<br/>','1','2023-05-12 15:30:53'),(247,'users',1,'Last Connection Date: 2023-05-12 15:30:53 -> 2023-05-14 10:06:58<br/>','1','2023-05-14 10:06:58'),(248,'menu_item',5,'Menu item created. <br/><br/>Menu Item Name: Menu Item<br/>Menu Group ID: 1<br/>Parent ID: 1<br/>Order Sequence: 2','1','2023-05-14 10:18:00'),(249,'menu_access_right',5,'Role ID: 1<br/>Read Access: 0 -> 1<br/>','0','2023-05-14 10:37:18'),(250,'menu_access_right',5,'Role ID: 1<br/>','0','2023-05-14 10:37:18'),(251,'menu_access_right',5,'Role ID: 1<br/>','0','2023-05-14 10:37:18'),(252,'menu_access_right',5,'Role ID: 1<br/>','0','2023-05-14 10:37:18'),(253,'menu_access_right',5,'Role ID: 2<br/>','0','2023-05-14 10:37:18'),(254,'menu_access_right',5,'Role ID: 2<br/>','0','2023-05-14 10:37:18'),(255,'menu_access_right',5,'Role ID: 2<br/>','0','2023-05-14 10:37:18'),(256,'menu_access_right',5,'Role ID: 2<br/>','0','2023-05-14 10:37:18'),(257,'menu_access_right',4,'Role ID: 1<br/>Read Access: 0 -> 1<br/>','0','2023-05-14 10:37:21'),(258,'menu_access_right',4,'Role ID: 1<br/>','0','2023-05-14 10:37:21'),(259,'menu_access_right',4,'Role ID: 1<br/>','0','2023-05-14 10:37:21'),(260,'menu_access_right',4,'Role ID: 1<br/>','0','2023-05-14 10:37:21'),(261,'menu_access_right',4,'Role ID: 2<br/>','0','2023-05-14 10:37:21'),(262,'menu_access_right',4,'Role ID: 2<br/>','0','2023-05-14 10:37:21'),(263,'menu_access_right',4,'Role ID: 2<br/>','0','2023-05-14 10:37:21'),(264,'menu_access_right',4,'Role ID: 2<br/>','0','2023-05-14 10:37:21'),(265,'menu_access_right',1,'Role ID: 1<br/>','1','2023-05-14 10:37:23'),(266,'menu_access_right',1,'Role ID: 1<br/>','1','2023-05-14 10:37:23'),(267,'menu_access_right',1,'Role ID: 1<br/>','1','2023-05-14 10:37:23'),(268,'menu_access_right',1,'Role ID: 1<br/>','1','2023-05-14 10:37:23'),(269,'menu_access_right',1,'Role ID: 2<br/>','0','2023-05-14 10:37:23'),(270,'menu_access_right',1,'Role ID: 2<br/>','0','2023-05-14 10:37:23'),(271,'menu_access_right',1,'Role ID: 2<br/>','0','2023-05-14 10:37:23'),(272,'menu_access_right',1,'Role ID: 2<br/>','0','2023-05-14 10:37:23'),(273,'users',1,'Last Connection Date: 2023-05-14 10:06:58 -> 2023-05-14 18:34:18<br/>','1','2023-05-14 18:34:18'),(274,'menu_item',6,'Menu item created. <br/><br/>Menu Item Name: Upload Settings<br/>Menu Group ID: 1<br/>Menu Item Icon: alert-triangle<br/>Order Sequence: 22','1','2023-05-14 18:51:51'),(275,'menu_access_right',6,'Role ID: 1<br/>Read Access: 0 -> 1<br/>','0','2023-05-14 18:51:59'),(276,'menu_access_right',6,'Role ID: 1<br/>','0','2023-05-14 18:51:59'),(277,'menu_access_right',6,'Role ID: 1<br/>','0','2023-05-14 18:51:59'),(278,'menu_access_right',6,'Role ID: 1<br/>','0','2023-05-14 18:51:59'),(279,'menu_access_right',6,'Role ID: 2<br/>','0','2023-05-14 18:51:59'),(280,'menu_access_right',6,'Role ID: 2<br/>','0','2023-05-14 18:51:59'),(281,'menu_access_right',6,'Role ID: 2<br/>','0','2023-05-14 18:51:59'),(282,'menu_access_right',6,'Role ID: 2<br/>','0','2023-05-14 18:51:59'),(283,'menu_item',6,'Menu Item Icon: alert-triangle -> sidebar<br/>','1','2023-05-14 18:55:39'),(284,'users',1,'Last Connection Date: 2023-05-14 18:34:18 -> 2023-05-21 08:07:58<br/>','1','2023-05-21 08:07:58'),(285,'menu_item',6,'Parent ID: 0 -> 4<br/>','1','2023-05-21 09:08:57'),(286,'menu_item',1,'Menu Item Icon:  -> sidebar<br/>','1','2023-05-21 09:38:19'),(287,'menu_item',6,'URL: Javascript: void(0); -> Javascript: void(0);<br/>Parent ID: 4 -> 0<br/>','1','2023-05-21 09:45:06'),(288,'menu_item',4,'URL:  -> menu-groups.php<br/>','1','2023-05-21 09:54:42'),(289,'menu_item',4,'URL: menu-groups.php -> menu-groups.php<br/>Parent ID: 5 -> 6<br/>','1','2023-05-21 10:11:58'),(290,'menu_item',4,'URL: menu-groups.php -> menu-groups.php<br/>Order Sequence: 5 -> 127<br/>','1','2023-05-21 10:12:13'),(291,'menu_item',4,'URL: menu-groups.php -> menu-groups.php<br/>Parent ID: 6 -> 1<br/>','1','2023-05-21 10:35:30'),(292,'menu_item',1,'Order Sequence: 1 -> 20<br/>','1','2023-05-21 10:41:28'),(293,'menu_item',4,'URL: menu-groups.php -> menu-groups.php<br/>Order Sequence: 127 -> 20<br/>','1','2023-05-21 10:41:41'),(294,'menu_item',5,'URL: menu-items.php -> menu-items.php<br/>Order Sequence: 2 -> 20<br/>','1','2023-05-21 10:41:51'),(295,'menu_item',4,'URL: menu-groups.php -> menu-groups.php<br/>Order Sequence: 20 -> 21<br/>','1','2023-05-21 10:42:22'),(296,'menu_item',5,'URL: menu-items.php -> menu-items.php<br/>Order Sequence: 20 -> 22<br/>','1','2023-05-21 10:42:29'),(297,'menu_item',1,'Menu item created. <br/><br/>Menu Item Name: User Interface<br/>Menu Group ID: 1<br/>Menu Item Icon: sidebar<br/>Order Sequence: 50','1','2023-05-21 11:21:17'),(298,'menu_item',2,'Menu item created. <br/><br/>Menu Item Name: Menu Group<br/>Menu Group ID: 1<br/>URL: menu-groups.php<br/>Parent ID: 1<br/>Order Sequence: 51','1','2023-05-21 11:21:43'),(299,'menu_item',3,'Menu item created. <br/><br/>Menu Item Name: Menu Item<br/>Menu Group ID: 1<br/>URL: menu-items.php<br/>Parent ID: 1<br/>Order Sequence: 52','1','2023-05-21 11:22:16'),(300,'menu_item',4,'Menu item created. <br/><br/>Menu Item Name: Configurations<br/>Menu Group ID: 1<br/>Order Sequence: 60','1','2023-05-21 12:07:33'),(301,'menu_item',4,'Menu Item Icon:  -> settings<br/>','1','2023-05-21 12:10:34'),(302,'menu_item',5,'Menu item created. <br/><br/>Menu Item Name: File Types<br/>Menu Group ID: 2<br/>URL: file-types.php<br/>Parent ID: 4<br/>Order Sequence: 61','1','2023-05-21 12:12:06'),(303,'menu_item',5,'Menu Group ID: 2 -> 1<br/>URL: file-types.php -> file-types.php<br/>','1','2023-05-21 12:12:14'),(304,'menu_item',6,'Menu item created. <br/><br/>Menu Item Name: File Extensions<br/>Menu Group ID: 1<br/>URL: file-extensions.php<br/>Parent ID: 4<br/>Order Sequence: 63','1','2023-05-21 12:12:48'),(305,'menu_item',5,'URL: file-types.php -> file-types.php<br/>Order Sequence: 61 -> 62<br/>','1','2023-05-21 12:13:40'),(306,'menu_item',5,'Menu Item Name: File Types -> Upload Settings<br/>URL: file-types.php -> upload-settings.php<br/>Order Sequence: 62 -> 61<br/>','1','2023-05-21 12:14:14'),(307,'menu_item',6,'Menu Item Name: File Extensions -> File Types<br/>URL: file-extensions.php -> file-types.php<br/>','1','2023-05-21 12:14:31'),(308,'menu_item',7,'Menu item created. <br/><br/>Menu Item Name: File Extensions<br/>Menu Group ID: 1<br/>URL: file-extensions.php<br/>Parent ID: 4<br/>Order Sequence: 63','1','2023-05-21 12:15:01'),(309,'menu_access_right',7,'Role ID: 1<br/>Read Access: 0 -> 1<br/>','0','2023-05-21 12:15:13'),(310,'menu_access_right',7,'Role ID: 1<br/>Write Access: 0 -> 1<br/>','0','2023-05-21 12:15:13'),(311,'menu_access_right',7,'Role ID: 1<br/>Create Access: 0 -> 1<br/>','0','2023-05-21 12:15:13'),(312,'menu_access_right',7,'Role ID: 1<br/>Delete Access: 0 -> 1<br/>','0','2023-05-21 12:15:13'),(313,'menu_access_right',7,'Role ID: 2<br/>','0','2023-05-21 12:15:13'),(314,'menu_access_right',7,'Role ID: 2<br/>','0','2023-05-21 12:15:13'),(315,'menu_access_right',7,'Role ID: 2<br/>','0','2023-05-21 12:15:13'),(316,'menu_access_right',7,'Role ID: 2<br/>','0','2023-05-21 12:15:13'),(317,'ui_customization_setting',3,'Caption Show: true -> false<br/>','1','2023-05-21 12:20:13'),(318,'ui_customization_setting',3,'Caption Show: false -> true<br/>','1','2023-05-21 12:20:16'),(319,'ui_customization_setting',3,'Box Container: false -> true<br/>','1','2023-05-21 12:20:23'),(320,'ui_customization_setting',3,'Box Container: true -> false<br/>','1','2023-05-21 12:20:25'),(321,'users',1,'Last Connection Date: 2023-05-21 08:07:58 -> 2023-05-21 17:47:23<br/>','1','2023-05-21 17:47:23'),(322,'menu_item',6,'URL: file-types.php -> file-types.php<br/>Order Sequence: 63 -> 62<br/>','1','2023-05-21 17:48:18'),(323,'ui_customization_setting',3,'Dark Layout: false -> true<br/>','1','2023-05-21 18:36:38'),(324,'users',1,'Last Connection Date: 2023-05-21 17:47:23 -> 2023-05-22 08:45:30<br/>','1','2023-05-22 08:45:30'),(325,'menu_item',7,'URL: file-extensions.php -> file-extensions.php<br/>Parent ID: 4 -> 0<br/>','1','2023-05-22 08:45:44'),(326,'menu_item',7,'Menu Item Icon:  -> sidebar<br/>','1','2023-05-22 08:45:57'),(327,'menu_item',7,'Parent ID: 0 -> 4<br/>Menu Item Icon: sidebar -> <br/>','1','2023-05-22 08:46:05'),(328,'menu_item',8,'Menu item created. <br/><br/>Menu Item Name: Interface Settings<br/>Menu Group ID: 1<br/>URL: test.php<br/>Parent ID: 6<br/>Order Sequence: 127','1','2023-05-22 08:46:39'),(329,'menu_item',8,'URL: test.php -> test.php<br/>Parent ID: 6 -> 7<br/>','1','2023-05-22 08:47:01'),(330,'menu_item',8,'URL: test.php -> test.php<br/>Order Sequence: 127 -> 60<br/>','1','2023-05-22 08:47:16'),(331,'menu_item',8,'URL: test.php -> test.php<br/>Order Sequence: 60 -> 127<br/>','1','2023-05-22 08:47:26'),(332,'menu_access_right',8,'Role ID: 1<br/>Read Access: 0 -> 1<br/>','0','2023-05-22 08:47:33'),(333,'menu_access_right',8,'Role ID: 1<br/>Write Access: 0 -> 1<br/>','0','2023-05-22 08:47:33'),(334,'menu_access_right',8,'Role ID: 1<br/>Create Access: 0 -> 1<br/>','0','2023-05-22 08:47:33'),(335,'menu_access_right',8,'Role ID: 1<br/>Delete Access: 0 -> 1<br/>','0','2023-05-22 08:47:33'),(336,'menu_access_right',8,'Role ID: 2<br/>','0','2023-05-22 08:47:33'),(337,'menu_access_right',8,'Role ID: 2<br/>','0','2023-05-22 08:47:33'),(338,'menu_access_right',8,'Role ID: 2<br/>','0','2023-05-22 08:47:33'),(339,'menu_access_right',8,'Role ID: 2<br/>','0','2023-05-22 08:47:33'),(340,'menu_item',8,'URL: test.php -> test.php<br/>Parent ID: 7 -> 4<br/>','1','2023-05-22 08:47:47'),(341,'menu_item',8,'URL: test.php -> test.php<br/>Order Sequence: 127 -> 59<br/>','1','2023-05-22 08:48:14'),(342,'menu_item',8,'URL: test.php -> test.php<br/>Order Sequence: 59 -> 60<br/>','1','2023-05-22 08:48:20'),(343,'menu_item',8,'URL: test.php -> test.php<br/>Parent ID: 4 -> 1<br/>','1','2023-05-22 08:48:43'),(344,'menu_item',7,'URL: file-extensions.php -> file-extensions.php<br/>Order Sequence: 63 -> 0<br/>','1','2023-05-22 09:22:55'),(345,'menu_item',7,'URL: file-extensions.php -> file-extensions.php<br/>Order Sequence: 0 -> 63<br/>','1','2023-05-22 09:23:04'),(346,'menu_item',6,'URL: file-types.php -> file-types.php<br/>Order Sequence: 62 -> 1<br/>','1','2023-05-22 09:23:32'),(347,'menu_item',6,'URL: file-types.php -> file-types.php<br/>Order Sequence: 1 -> 63<br/>','1','2023-05-22 09:23:38'),(348,'menu_item',6,'URL: file-types.php -> file-types.php<br/>Order Sequence: 63 -> 62<br/>','1','2023-05-22 09:23:46'),(349,'file_types',1,'File type created. <br/><br/>File Type Name: Audio','1','2023-05-22 11:57:46'),(350,'file_types',2,'File type created. <br/><br/>File Type Name: Audio','1','2023-05-22 11:57:47'),(351,'file_types',2,'File Type Name: Audio -> Audio2<br/>','1','2023-05-22 13:46:19'),(352,'file_types',2,'File Type Name: Audio2 -> Audio<br/>','1','2023-05-22 13:46:26'),(353,'file_extension',2,'File extension created. <br/><br/>File Extension Name: mp4<br/>File Type ID: 2','1','2023-05-22 15:17:37'),(354,'file_extension',3,'File extension created. <br/><br/>File Extension Name: mp4<br/>File Type ID: 2','1','2023-05-22 15:17:46'),(355,'file_extension',4,'File extension created. <br/><br/>File Extension Name: mp4<br/>File Type ID: 2','1','2023-05-22 15:30:12'),(356,'file_extension',5,'File extension created. <br/><br/>File Extension Name: test<br/>File Type ID: 2','1','2023-05-22 15:34:36'),(357,'file_extension',5,'File Extension Name: test -> test2<br/>','1','2023-05-22 15:39:35'),(358,'users',1,'Last Connection Date: 2023-05-22 08:45:30 -> 2023-05-23 09:04:30<br/>','1','2023-05-23 09:04:30'),(359,'ui_customization_setting',3,'Dark Layout: true -> false<br/>','1','2023-05-23 09:04:33'),(360,'file_types',3,'File type created. <br/><br/>File Type Name: test','1','2023-05-23 11:26:15'),(361,'file_types',4,'File type created. <br/><br/>File Type Name: Test','1','2023-05-23 11:27:05'),(362,'file_extension',6,'File extension created. <br/><br/>File Extension Name: test<br/>File Type ID: 4','1','2023-05-23 11:36:24'),(363,'file_extension',7,'File extension created. <br/><br/>File Extension Name: test<br/>File Type ID: 4','1','2023-05-23 11:36:32'),(364,'file_extension',8,'File extension created. <br/><br/>File Extension Name: test<br/>File Type ID: 4','1','2023-05-23 11:38:57'),(365,'file_extension',9,'File extension created. <br/><br/>File Extension Name: test<br/>File Type ID: 4','1','2023-05-23 11:39:00'),(366,'menu_groups',1,'Menu Group Name: Administration -> Administrations<br/>','1','2023-05-23 11:48:47'),(367,'menu_groups',1,'Menu Group Name: Administrations -> Administration<br/>','1','2023-05-23 11:48:50'),(368,'users',1,'Last Connection Date: 2023-05-23 09:04:30 -> 2023-05-24 09:57:05<br/>','1','2023-05-24 09:57:05'),(369,'file_extension',10,'File extension created. <br/><br/>File Extension Name: test<br/>File Type ID: 4','1','2023-05-24 13:12:04'),(370,'file_extension',11,'File extension created. <br/><br/>File Extension Name: test<br/>File Type ID: 4','1','2023-05-24 13:12:08'),(371,'file_extension',12,'File extension created. <br/><br/>File Extension Name: test<br/>File Type ID: 4','1','2023-05-24 13:13:01'),(372,'file_extension',12,'File Extension Name: test -> test2<br/>','1','2023-05-24 13:13:57'),(373,'file_extension',13,'File extension created. <br/><br/>File Extension Name: test2<br/>File Type ID: 4','1','2023-05-24 13:14:02'),(374,'file_types',5,'File type created. <br/><br/>File Type Name: Test','1','2023-05-24 13:15:47'),(375,'file_types',6,'File type created. <br/><br/>File Type Name: Test','1','2023-05-24 13:16:11'),(376,'file_types',7,'File type created. <br/><br/>File Type Name: Test','1','2023-05-24 13:16:19'),(377,'file_types',1,'File type created. <br/><br/>File Type Name: Audio','1','2023-05-24 14:10:04'),(378,'file_extension',1,'File extension created. <br/><br/>File Extension Name: mp3<br/>File Type ID: 1','1','2023-05-24 14:13:39'),(379,'file_extension',2,'File extension created. <br/><br/>File Extension Name: wav<br/>File Type ID: 1','1','2023-05-24 14:13:48'),(380,'file_types',2,'File type created. <br/><br/>File Type Name: Compressed File','1','2023-05-24 14:14:02'),(381,'file_extension',3,'File extension created. <br/><br/>File Extension Name: 7z<br/>File Type ID: 2','1','2023-05-24 14:14:09'),(382,'file_extension',4,'File extension created. <br/><br/>File Extension Name: rar<br/>File Type ID: 2','1','2023-05-24 14:14:20'),(383,'file_extension',5,'File extension created. <br/><br/>File Extension Name: zip<br/>File Type ID: 2','1','2023-05-24 14:14:30'),(384,'file_types',3,'File type created. <br/><br/>File Type Name: Database File','1','2023-05-24 14:14:45'),(385,'file_extension',6,'File extension created. <br/><br/>File Extension Name: csv<br/>File Type ID: 3','1','2023-05-24 14:14:50'),(386,'file_extension',7,'File extension created. <br/><br/>File Extension Name: dat<br/>File Type ID: 3','1','2023-05-24 14:14:54'),(387,'file_extension',8,'File extension created. <br/><br/>File Extension Name: db<br/>File Type ID: 3','1','2023-05-24 14:14:58'),(388,'file_extension',9,'File extension created. <br/><br/>File Extension Name: dbf<br/>File Type ID: 3','1','2023-05-24 14:15:01'),(389,'file_extension',10,'File extension created. <br/><br/>File Extension Name: log<br/>File Type ID: 3','1','2023-05-24 14:15:06'),(390,'file_extension',11,'File extension created. <br/><br/>File Extension Name: mdb<br/>File Type ID: 3','1','2023-05-24 14:15:10'),(391,'file_extension',12,'File extension created. <br/><br/>File Extension Name: sav<br/>File Type ID: 3','1','2023-05-24 14:15:15'),(392,'file_extension',13,'File extension created. <br/><br/>File Extension Name: sql<br/>File Type ID: 3','1','2023-05-24 14:15:19'),(393,'file_extension',14,'File extension created. <br/><br/>File Extension Name: sql<br/>File Type ID: 3','1','2023-05-24 14:15:24'),(394,'file_types',4,'File type created. <br/><br/>File Type Name: Font File','1','2023-05-24 14:20:25'),(395,'file_extension',15,'File extension created. <br/><br/>File Extension Name: fnt<br/>File Type ID: 4','1','2023-05-24 14:20:30'),(396,'file_extension',16,'File extension created. <br/><br/>File Extension Name: otf<br/>File Type ID: 4','1','2023-05-24 14:20:36'),(397,'file_extension',17,'File extension created. <br/><br/>File Extension Name: ttf<br/>File Type ID: 4','1','2023-05-24 14:20:40'),(398,'file_extension',18,'File extension created. <br/><br/>File Extension Name: Image Files<br/>File Type ID: 4','1','2023-05-24 14:21:02'),(399,'file_extension',18,'File Extension Name: Image Files -> fon<br/>','1','2023-05-24 14:21:15'),(400,'file_types',5,'File type created. <br/><br/>File Type Name: Image File','1','2023-05-24 14:21:24'),(401,'file_extension',19,'File extension created. <br/><br/>File Extension Name: bmp<br/>File Type ID: 5','1','2023-05-24 14:21:33'),(402,'file_extension',20,'File extension created. <br/><br/>File Extension Name: gif<br/>File Type ID: 5','1','2023-05-24 14:21:38'),(403,'file_extension',21,'File extension created. <br/><br/>File Extension Name: ico<br/>File Type ID: 5','1','2023-05-24 14:21:44'),(404,'file_extension',22,'File extension created. <br/><br/>File Extension Name: jpeg<br/>File Type ID: 5','1','2023-05-24 14:21:49'),(405,'file_extension',23,'File extension created. <br/><br/>File Extension Name: jpg<br/>File Type ID: 5','1','2023-05-24 14:21:52'),(406,'file_extension',24,'File extension created. <br/><br/>File Extension Name: png<br/>File Type ID: 5','1','2023-05-24 14:21:58'),(407,'file_extension',25,'File extension created. <br/><br/>File Extension Name: svg<br/>File Type ID: 5','1','2023-05-24 14:22:03'),(408,'file_extension',26,'File extension created. <br/><br/>File Extension Name: webp<br/>File Type ID: 5','1','2023-05-24 14:22:09'),(409,'file_types',6,'File type created. <br/><br/>File Type Name: Internet Related File','1','2023-05-24 14:22:28'),(410,'file_extension',27,'File extension created. <br/><br/>File Extension Name: asp<br/>File Type ID: 6','1','2023-05-24 14:22:34'),(411,'file_extension',28,'File extension created. <br/><br/>File Extension Name: aspx<br/>File Type ID: 6','1','2023-05-24 14:22:37'),(412,'file_extension',29,'File extension created. <br/><br/>File Extension Name: cer<br/>File Type ID: 6','1','2023-05-24 14:22:42'),(413,'file_extension',30,'File extension created. <br/><br/>File Extension Name: css<br/>File Type ID: 6','1','2023-05-24 14:22:52'),(414,'file_extension',31,'File extension created. <br/><br/>File Extension Name: html<br/>File Type ID: 6','1','2023-05-24 14:22:57'),(415,'file_extension',32,'File extension created. <br/><br/>File Extension Name: htm<br/>File Type ID: 6','1','2023-05-24 14:23:00'),(416,'file_extension',33,'File extension created. <br/><br/>File Extension Name: js<br/>File Type ID: 6','1','2023-05-24 14:23:04'),(417,'file_extension',34,'File extension created. <br/><br/>File Extension Name: php<br/>File Type ID: 6','1','2023-05-24 14:23:08'),(418,'file_types',7,'File type created. <br/><br/>File Type Name: Presentation File','1','2023-05-24 14:23:24'),(419,'file_extension',35,'File extension created. <br/><br/>File Extension Name: pps<br/>File Type ID: 7','1','2023-05-24 14:23:31'),(420,'file_extension',36,'File extension created. <br/><br/>File Extension Name: ppt<br/>File Type ID: 7','1','2023-05-24 14:23:34'),(421,'file_extension',37,'File extension created. <br/><br/>File Extension Name: pptx<br/>File Type ID: 7','1','2023-05-24 14:23:37'),(422,'file_types',8,'File type created. <br/><br/>File Type Name: Spreadsheet File','1','2023-05-24 14:23:53'),(423,'file_extension',38,'File extension created. <br/><br/>File Extension Name: xls<br/>File Type ID: 8','1','2023-05-24 14:23:58'),(424,'file_extension',39,'File extension created. <br/><br/>File Extension Name: xlsm<br/>File Type ID: 8','1','2023-05-24 14:24:04'),(425,'file_extension',40,'File extension created. <br/><br/>File Extension Name: xslx<br/>File Type ID: 8','1','2023-05-24 14:24:08'),(426,'file_types',9,'File type created. <br/><br/>File Type Name: Video File','1','2023-05-24 14:24:20'),(427,'file_extension',41,'File extension created. <br/><br/>File Extension Name: 3gp<br/>File Type ID: 9','1','2023-05-24 14:24:28'),(428,'file_extension',42,'File extension created. <br/><br/>File Extension Name: avi<br/>File Type ID: 9','1','2023-05-24 14:24:32'),(429,'file_extension',43,'File extension created. <br/><br/>File Extension Name: flv<br/>File Type ID: 9','1','2023-05-24 14:24:34'),(430,'file_extension',44,'File extension created. <br/><br/>File Extension Name: m4v<br/>File Type ID: 9','1','2023-05-24 14:24:40'),(431,'file_extension',45,'File extension created. <br/><br/>File Extension Name: mkv<br/>File Type ID: 9','1','2023-05-24 14:24:45'),(432,'file_extension',46,'File extension created. <br/><br/>File Extension Name: mov<br/>File Type ID: 9','1','2023-05-24 14:24:48'),(433,'file_extension',47,'File extension created. <br/><br/>File Extension Name: mp4<br/>File Type ID: 9','1','2023-05-24 14:24:54'),(434,'file_extension',48,'File extension created. <br/><br/>File Extension Name: mpg<br/>File Type ID: 9','1','2023-05-24 14:24:59'),(435,'file_extension',49,'File extension created. <br/><br/>File Extension Name: mpeg<br/>File Type ID: 9','1','2023-05-24 14:25:02'),(436,'file_extension',50,'File extension created. <br/><br/>File Extension Name: wmv<br/>File Type ID: 9','1','2023-05-24 14:25:10'),(437,'file_types',10,'File type created. <br/><br/>File Type Name: Word Processor File','1','2023-05-24 14:25:24'),(438,'file_types',1,'File Type Name: Audio -> Audio File<br/>','1','2023-05-24 14:25:33'),(439,'file_extension',51,'File extension created. <br/><br/>File Extension Name: doc<br/>File Type ID: 10','1','2023-05-24 14:25:52'),(440,'file_extension',52,'File extension created. <br/><br/>File Extension Name: docx<br/>File Type ID: 10','1','2023-05-24 14:25:55'),(441,'file_extension',53,'File extension created. <br/><br/>File Extension Name: odt<br/>File Type ID: 10','1','2023-05-24 14:26:01'),(442,'file_extension',54,'File extension created. <br/><br/>File Extension Name: pdf<br/>File Type ID: 10','1','2023-05-24 14:26:05'),(443,'file_extension',55,'File extension created. <br/><br/>File Extension Name: rft<br/>File Type ID: 10','1','2023-05-24 14:26:10'),(444,'file_extension',55,'File Extension Name: rft -> rtf<br/>','1','2023-05-24 14:26:13'),(445,'file_extension',55,'File Extension Name: rtf -> txt<br/>','1','2023-05-24 14:26:21');
/*!40000 ALTER TABLE `audit_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file_extension`
--

DROP TABLE IF EXISTS `file_extension`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `file_extension` (
  `file_extension_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `file_extension_name` varchar(100) NOT NULL,
  `file_type_id` int(10) unsigned NOT NULL,
  `last_log_by` int(10) NOT NULL,
  PRIMARY KEY (`file_extension_id`),
  KEY `file_extension_index_file_extension_id` (`file_extension_id`),
  KEY `file_type_id` (`file_type_id`),
  CONSTRAINT `file_extension_ibfk_1` FOREIGN KEY (`file_type_id`) REFERENCES `file_types` (`file_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file_extension`
--

LOCK TABLES `file_extension` WRITE;
/*!40000 ALTER TABLE `file_extension` DISABLE KEYS */;
INSERT INTO `file_extension` VALUES (1,'mp3',1,1),(2,'wav',1,1),(3,'7z',2,1),(4,'rar',2,1),(5,'zip',2,1),(6,'csv',3,1),(7,'dat',3,1),(8,'db',3,1),(9,'dbf',3,1),(10,'log',3,1),(11,'mdb',3,1),(12,'sav',3,1),(13,'sql',3,1),(14,'sql',3,1),(15,'fnt',4,1),(16,'otf',4,1),(17,'ttf',4,1),(18,'fon',4,1),(19,'bmp',5,1),(20,'gif',5,1),(21,'ico',5,1),(22,'jpeg',5,1),(23,'jpg',5,1),(24,'png',5,1),(25,'svg',5,1),(26,'webp',5,1),(27,'asp',6,1),(28,'aspx',6,1),(29,'cer',6,1),(30,'css',6,1),(31,'html',6,1),(32,'htm',6,1),(33,'js',6,1),(34,'php',6,1),(35,'pps',7,1),(36,'ppt',7,1),(37,'pptx',7,1),(38,'xls',8,1),(39,'xlsm',8,1),(40,'xslx',8,1),(41,'3gp',9,1),(42,'avi',9,1),(43,'flv',9,1),(44,'m4v',9,1),(45,'mkv',9,1),(46,'mov',9,1),(47,'mp4',9,1),(48,'mpg',9,1),(49,'mpeg',9,1),(50,'wmv',9,1),(51,'doc',10,1),(52,'docx',10,1),(53,'odt',10,1),(54,'pdf',10,1),(55,'txt',10,1);
/*!40000 ALTER TABLE `file_extension` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER file_extension_trigger_insert
AFTER INSERT ON file_extension
FOR EACH ROW
BEGIN
    DECLARE audit_log TEXT DEFAULT 'File extension created. <br/>';

    IF NEW.file_extension_name <> '' THEN
        SET audit_log = CONCAT(audit_log, "<br/>File Extension Name: ", NEW.file_extension_name);
    END IF;

    IF NEW.file_type_id <> '' THEN
        SET audit_log = CONCAT(audit_log, "<br/>File Type ID: ", NEW.file_type_id);
    END IF;

    INSERT INTO audit_log (table_name, reference_id, log, changed_by, changed_at) 
    VALUES ('file_extension', NEW.file_extension_id, audit_log, NEW.last_log_by, NOW());
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
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER file_extension_trigger_update
AFTER UPDATE ON file_extension
FOR EACH ROW
BEGIN
    DECLARE audit_log TEXT DEFAULT '';

    IF NEW.file_extension_name <> OLD.file_extension_name THEN
        SET audit_log = CONCAT(audit_log, "File Extension Name: ", OLD.file_extension_name, " -> ", NEW.file_extension_name, "<br/>");
    END IF;

    IF NEW.file_type_id <> OLD.file_type_id THEN
        SET audit_log = CONCAT(audit_log, "File Type ID: ", OLD.file_type_id, " -> ", NEW.file_type_id, "<br/>");
    END IF;
    
    IF LENGTH(audit_log) > 0 THEN
        INSERT INTO audit_log (table_name, reference_id, log, changed_by, changed_at) 
        VALUES ('file_extension', NEW.file_extension_id, audit_log, NEW.last_log_by, NOW());
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `file_types`
--

DROP TABLE IF EXISTS `file_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `file_types` (
  `file_type_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `file_type_name` varchar(100) NOT NULL,
  `last_log_by` int(10) NOT NULL,
  PRIMARY KEY (`file_type_id`),
  KEY `file_types_index_file_type_id` (`file_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file_types`
--

LOCK TABLES `file_types` WRITE;
/*!40000 ALTER TABLE `file_types` DISABLE KEYS */;
INSERT INTO `file_types` VALUES (1,'Audio File',1),(2,'Compressed File',1),(3,'Database File',1),(4,'Font File',1),(5,'Image File',1),(6,'Internet Related File',1),(7,'Presentation File',1),(8,'Spreadsheet File',1),(9,'Video File',1),(10,'Word Processor File',1);
/*!40000 ALTER TABLE `file_types` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER file_types_trigger_insert
AFTER INSERT ON file_types
FOR EACH ROW
BEGIN
    DECLARE audit_log TEXT DEFAULT 'File type created. <br/>';

    IF NEW.file_type_name <> '' THEN
        SET audit_log = CONCAT(audit_log, "<br/>File Type Name: ", NEW.file_type_name);
    END IF;

    INSERT INTO audit_log (table_name, reference_id, log, changed_by, changed_at) 
    VALUES ('file_types', NEW.file_type_id, audit_log, NEW.last_log_by, NOW());
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
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER file_types_trigger_update
AFTER UPDATE ON file_types
FOR EACH ROW
BEGIN
    DECLARE audit_log TEXT DEFAULT '';

    IF NEW.file_type_name <> OLD.file_type_name THEN
        SET audit_log = CONCAT(audit_log, "File Type Name: ", OLD.file_type_name, " -> ", NEW.file_type_name, "<br/>");
    END IF;
    
    IF LENGTH(audit_log) > 0 THEN
        INSERT INTO audit_log (table_name, reference_id, log, changed_by, changed_at) 
        VALUES ('file_types', NEW.file_type_id, audit_log, NEW.last_log_by, NOW());
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `menu_access_right`
--

DROP TABLE IF EXISTS `menu_access_right`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_access_right` (
  `menu_item_id` int(10) NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  `read_access` tinyint(1) NOT NULL,
  `write_access` tinyint(1) NOT NULL,
  `create_access` tinyint(1) NOT NULL,
  `delete_access` tinyint(1) NOT NULL,
  `last_log_by` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_access_right`
--

LOCK TABLES `menu_access_right` WRITE;
/*!40000 ALTER TABLE `menu_access_right` DISABLE KEYS */;
INSERT INTO `menu_access_right` VALUES (1,1,1,0,0,0,1),(2,1,1,1,1,1,1),(1,2,1,0,0,0,0),(3,1,1,1,1,1,0),(3,2,0,0,0,0,0),(2,2,0,0,0,0,0),(5,1,1,0,0,0,0),(5,2,0,0,0,0,0),(4,1,1,0,0,0,0),(4,2,0,0,0,0,0),(6,1,1,0,0,0,0),(6,2,0,0,0,0,0),(7,1,1,1,1,1,0),(7,2,0,0,0,0,0),(8,1,1,1,1,1,0),(8,2,0,0,0,0,0);
/*!40000 ALTER TABLE `menu_access_right` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER menu_access_right_update
AFTER UPDATE ON menu_access_right
FOR EACH ROW
BEGIN
    DECLARE audit_log TEXT DEFAULT '';

    SET audit_log = CONCAT(audit_log, "Role ID: ", OLD.role_id, "<br/>");

    IF NEW.read_access <> OLD.read_access THEN
        SET audit_log = CONCAT(audit_log, "Read Access: ", OLD.read_access, " -> ", NEW.read_access, "<br/>");
    END IF;

    IF NEW.write_access <> OLD.write_access THEN
        SET audit_log = CONCAT(audit_log, "Write Access: ", OLD.write_access, " -> ", NEW.write_access, "<br/>");
    END IF;

    IF NEW.create_access <> OLD.create_access THEN
        SET audit_log = CONCAT(audit_log, "Create Access: ", OLD.create_access, " -> ", NEW.create_access, "<br/>");
    END IF;

    IF NEW.delete_access <> OLD.delete_access THEN
        SET audit_log = CONCAT(audit_log, "Delete Access: ", OLD.delete_access, " -> ", NEW.delete_access, "<br/>");
    END IF;
    
    IF LENGTH(audit_log) > 0 THEN
        INSERT INTO audit_log (table_name, reference_id, log, changed_by, changed_at) 
        VALUES ('menu_access_right', NEW.menu_item_id, audit_log, NEW.last_log_by, NOW());
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `menu_groups`
--

DROP TABLE IF EXISTS `menu_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_groups` (
  `menu_group_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `menu_group_name` varchar(100) NOT NULL,
  `order_sequence` tinyint(10) NOT NULL,
  `last_log_by` int(10) NOT NULL,
  PRIMARY KEY (`menu_group_id`),
  KEY `menu_groups_index_menu_group_id` (`menu_group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_groups`
--

LOCK TABLES `menu_groups` WRITE;
/*!40000 ALTER TABLE `menu_groups` DISABLE KEYS */;
INSERT INTO `menu_groups` VALUES (1,'Administration',127,1),(2,'Human Resources',127,1);
/*!40000 ALTER TABLE `menu_groups` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER menu_groups_trigger_insert
AFTER INSERT ON menu_groups
FOR EACH ROW
BEGIN
    DECLARE audit_log TEXT DEFAULT 'Menu group created. <br/>';

    IF NEW.menu_group_name <> '' THEN
        SET audit_log = CONCAT(audit_log, "<br/>Menu Group Name: ", NEW.menu_group_name);
    END IF;

    IF NEW.order_sequence <> '' THEN
        SET audit_log = CONCAT(audit_log, "<br/>Order Sequence: ", NEW.order_sequence);
    END IF;

    INSERT INTO audit_log (table_name, reference_id, log, changed_by, changed_at) 
    VALUES ('menu_groups', NEW.menu_group_id, audit_log, NEW.last_log_by, NOW());
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
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER menu_groups_trigger_update
AFTER UPDATE ON menu_groups
FOR EACH ROW
BEGIN
    DECLARE audit_log TEXT DEFAULT '';

    IF NEW.menu_group_name <> OLD.menu_group_name THEN
        SET audit_log = CONCAT(audit_log, "Menu Group Name: ", OLD.menu_group_name, " -> ", NEW.menu_group_name, "<br/>");
    END IF;

    IF NEW.order_sequence <> OLD.order_sequence THEN
        SET audit_log = CONCAT(audit_log, "Order Sequence: ", OLD.order_sequence, " -> ", NEW.order_sequence, "<br/>");
    END IF;
    
    IF LENGTH(audit_log) > 0 THEN
        INSERT INTO audit_log (table_name, reference_id, log, changed_by, changed_at) 
        VALUES ('menu_groups', NEW.menu_group_id, audit_log, NEW.last_log_by, NOW());
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `menu_item`
--

DROP TABLE IF EXISTS `menu_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_item` (
  `menu_item_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `menu_item_name` varchar(100) NOT NULL,
  `menu_group_id` int(10) unsigned NOT NULL,
  `menu_item_url` varchar(50) DEFAULT NULL,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `menu_item_icon` varchar(150) DEFAULT NULL,
  `order_sequence` tinyint(10) NOT NULL,
  `last_log_by` int(10) NOT NULL,
  PRIMARY KEY (`menu_item_id`),
  KEY `menu_item_index_menu_item_id` (`menu_item_id`),
  KEY `menu_group_id` (`menu_group_id`),
  CONSTRAINT `menu_item_ibfk_1` FOREIGN KEY (`menu_group_id`) REFERENCES `menu_groups` (`menu_group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_item`
--

LOCK TABLES `menu_item` WRITE;
/*!40000 ALTER TABLE `menu_item` DISABLE KEYS */;
INSERT INTO `menu_item` VALUES (1,'User Interface',1,'',0,'sidebar',50,1),(2,'Menu Group',1,'menu-groups.php',1,'',51,1),(3,'Menu Item',1,'menu-items.php',1,'',52,1),(4,'Configurations',1,'',0,'settings',60,1),(5,'Upload Settings',1,'upload-settings.php',4,'',61,1),(6,'File Types',1,'file-types.php',4,'',62,1),(7,'File Extensions',1,'file-extensions.php',4,'',63,1),(8,'Interface Settings',1,'test.php',1,'',60,1);
/*!40000 ALTER TABLE `menu_item` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER menu_item_trigger_insert
AFTER INSERT ON menu_item
FOR EACH ROW
BEGIN
    DECLARE audit_log TEXT DEFAULT 'Menu item created. <br/>';

    IF NEW.menu_item_name <> '' THEN
        SET audit_log = CONCAT(audit_log, "<br/>Menu Item Name: ", NEW.menu_item_name);
    END IF;

    IF NEW.menu_group_id <> '' THEN
        SET audit_log = CONCAT(audit_log, "<br/>Menu Group ID: ", NEW.menu_group_id);
    END IF;

    IF NEW.menu_item_url <> '' THEN
        SET audit_log = CONCAT(audit_log, "<br/>URL: ", NEW.menu_item_url);
    END IF;

    IF NEW.parent_id <> '' THEN
        SET audit_log = CONCAT(audit_log, "<br/>Parent ID: ", NEW.parent_id);
    END IF;

    IF NEW.menu_item_icon <> '' THEN
        SET audit_log = CONCAT(audit_log, "<br/>Menu Item Icon: ", NEW.menu_item_icon);
    END IF;

    IF NEW.order_sequence <> '' THEN
        SET audit_log = CONCAT(audit_log, "<br/>Order Sequence: ", NEW.order_sequence);
    END IF;

    INSERT INTO audit_log (table_name, reference_id, log, changed_by, changed_at) 
    VALUES ('menu_item', NEW.menu_item_id, audit_log, NEW.last_log_by, NOW());
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
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER menu_item_trigger_update
AFTER UPDATE ON menu_item
FOR EACH ROW
BEGIN
    DECLARE audit_log TEXT DEFAULT '';

    IF NEW.menu_item_name <> OLD.menu_item_name THEN
        SET audit_log = CONCAT(audit_log, "Menu Item Name: ", OLD.menu_item_name, " -> ", NEW.menu_item_name, "<br/>");
    END IF;

    IF NEW.menu_group_id <> OLD.menu_group_id THEN
        SET audit_log = CONCAT(audit_log, "Menu Group ID: ", OLD.menu_group_id, " -> ", NEW.menu_group_id, "<br/>");
    END IF;

    IF NEW.menu_item_url <> OLD.parent_id THEN
        SET audit_log = CONCAT(audit_log, "URL: ", OLD.menu_item_url, " -> ", NEW.menu_item_url, "<br/>");
    END IF;

    IF NEW.parent_id <> OLD.parent_id THEN
        SET audit_log = CONCAT(audit_log, "Parent ID: ", OLD.parent_id, " -> ", NEW.parent_id, "<br/>");
    END IF;

    IF NEW.menu_item_icon <> OLD.menu_item_icon THEN
        SET audit_log = CONCAT(audit_log, "Menu Item Icon: ", OLD.menu_item_icon, " -> ", NEW.menu_item_icon, "<br/>");
    END IF;

    IF NEW.order_sequence <> OLD.order_sequence THEN
        SET audit_log = CONCAT(audit_log, "Order Sequence: ", OLD.order_sequence, " -> ", NEW.order_sequence, "<br/>");
    END IF;
    
    IF LENGTH(audit_log) > 0 THEN
        INSERT INTO audit_log (table_name, reference_id, log, changed_by, changed_at) 
        VALUES ('menu_item', NEW.menu_item_id, audit_log, NEW.last_log_by, NOW());
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `password_history`
--

DROP TABLE IF EXISTS `password_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_history` (
  `password_history_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `email_address` varchar(100) NOT NULL,
  `password` varchar(500) NOT NULL,
  `password_change_date` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`password_history_id`),
  KEY `password_history_index_password_history_id` (`password_history_id`),
  KEY `password_history_index_user_id` (`user_id`),
  KEY `password_history_index_email_address` (`email_address`),
  CONSTRAINT `password_history_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `password_history_ibfk_2` FOREIGN KEY (`email_address`) REFERENCES `users` (`email_address`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_history`
--

LOCK TABLES `password_history` WRITE;
/*!40000 ALTER TABLE `password_history` DISABLE KEYS */;
INSERT INTO `password_history` VALUES (1,2,'ldagulto@encorefinancials.com','HtRcNvyfnd4lXmZmkOihaFZ1c2QMlupV04mk1KEl%2Bj4%3D','2023-04-11 09:03:37'),(2,2,'ldagulto@encorefinancials.com','GgukHef0woUl4E8Dso5NUoA%2FW9Mnae5LVVBj6oPj8WQ%3D','2023-04-11 09:04:49');
/*!40000 ALTER TABLE `password_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `role_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) NOT NULL,
  `role_description` varchar(200) NOT NULL,
  `assignable` tinyint(1) NOT NULL,
  `last_log_by` int(10) NOT NULL,
  PRIMARY KEY (`role_id`),
  KEY `role_index_role_id` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'Administrator','Administrator',1,1),(2,'Employee','Employee',1,1);
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER role_trigger_insert
AFTER INSERT ON role
FOR EACH ROW
BEGIN
    DECLARE audit_log TEXT DEFAULT 'Role created. <br/>';

    IF NEW.role_name <> '' THEN
        SET audit_log = CONCAT(audit_log, "<br/>Role Name: ", NEW.role_name);
    END IF;

    IF NEW.role_description <> '' THEN
        SET audit_log = CONCAT(audit_log, "<br/>Role Description: ", NEW.role_description);
    END IF;

    IF NEW.assignable <> '' THEN
        SET audit_log = CONCAT(audit_log, "<br/>Assignable: ", NEW.assignable);
    END IF;

    INSERT INTO audit_log (table_name, reference_id, log, changed_by, changed_at) 
    VALUES ('role', NEW.role_id, audit_log, NEW.last_log_by, NOW());
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
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER role_trigger_update
AFTER UPDATE ON role
FOR EACH ROW
BEGIN
    DECLARE audit_log TEXT DEFAULT '';

    IF NEW.role_name <> OLD.role_name THEN
        SET audit_log = CONCAT(audit_log, "Role Name: ", OLD.role_name, " -> ", NEW.role_name, "<br/>");
    END IF;

    IF NEW.role_description <> OLD.role_description THEN
        SET audit_log = CONCAT(audit_log, "Role Description: ", OLD.role_description, " -> ", NEW.role_description, "<br/>");
    END IF;

    IF NEW.assignable <> OLD.assignable THEN
        SET audit_log = CONCAT(audit_log, "Assignable: ", OLD.assignable, " -> ", NEW.assignable, "<br/>");
    END IF;
    
    IF LENGTH(audit_log) > 0 THEN
        INSERT INTO audit_log (table_name, reference_id, log, changed_by, changed_at) 
        VALUES ('role', NEW.role_id, audit_log, NEW.last_log_by, NOW());
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `role_users`
--

DROP TABLE IF EXISTS `role_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_users` (
  `role_id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL,
  `last_log_by` int(10) NOT NULL,
  KEY `role_users_index_role_id` (`role_id`),
  KEY `role_users_index_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_users`
--

LOCK TABLES `role_users` WRITE;
/*!40000 ALTER TABLE `role_users` DISABLE KEYS */;
INSERT INTO `role_users` VALUES (1,1,1);
/*!40000 ALTER TABLE `role_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_action`
--

DROP TABLE IF EXISTS `system_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_action` (
  `system_action_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `system_action_name` varchar(100) NOT NULL,
  `last_log_by` int(10) NOT NULL,
  PRIMARY KEY (`system_action_id`),
  KEY `system_action_index_system_action_id` (`system_action_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_action`
--

LOCK TABLES `system_action` WRITE;
/*!40000 ALTER TABLE `system_action` DISABLE KEYS */;
INSERT INTO `system_action` VALUES (1,'Assign Menu Item Role Access',1);
/*!40000 ALTER TABLE `system_action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_action_access_rights`
--

DROP TABLE IF EXISTS `system_action_access_rights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_action_access_rights` (
  `system_action_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_action_access_rights`
--

LOCK TABLES `system_action_access_rights` WRITE;
/*!40000 ALTER TABLE `system_action_access_rights` DISABLE KEYS */;
INSERT INTO `system_action_access_rights` VALUES (1,1);
/*!40000 ALTER TABLE `system_action_access_rights` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ui_customization_setting`
--

DROP TABLE IF EXISTS `ui_customization_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ui_customization_setting` (
  `ui_customization_setting_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `email_address` varchar(100) NOT NULL,
  `theme_contrast` varchar(15) DEFAULT NULL,
  `caption_show` varchar(15) DEFAULT NULL,
  `preset_theme` varchar(15) DEFAULT NULL,
  `dark_layout` varchar(15) DEFAULT NULL,
  `rtl_layout` varchar(15) DEFAULT NULL,
  `box_container` varchar(15) DEFAULT NULL,
  `last_log_by` int(10) NOT NULL,
  PRIMARY KEY (`ui_customization_setting_id`),
  KEY `ui_customization_setting_index_ui_customization_setting_id` (`ui_customization_setting_id`),
  KEY `ui_customization_setting_index_user_id` (`user_id`),
  KEY `ui_customization_setting_index_email_address` (`email_address`),
  CONSTRAINT `ui_customization_setting_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `ui_customization_setting_ibfk_2` FOREIGN KEY (`email_address`) REFERENCES `users` (`email_address`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ui_customization_setting`
--

LOCK TABLES `ui_customization_setting` WRITE;
/*!40000 ALTER TABLE `ui_customization_setting` DISABLE KEYS */;
INSERT INTO `ui_customization_setting` VALUES (2,2,'ldagulto@encorefinancials.com','true','true',NULL,'true',NULL,NULL,2),(3,1,'admin@encorefinancials.com','false','true','preset-1','false','false','false',1);
/*!40000 ALTER TABLE `ui_customization_setting` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER ui_customization_setting_trigger_insert
AFTER INSERT ON ui_customization_setting
FOR EACH ROW
BEGIN
    DECLARE audit_log TEXT DEFAULT 'UI Customization created. <br/>';

    IF NEW.theme_contrast <> '' THEN
        SET audit_log = CONCAT(audit_log, "<br/>Theme Contrast: ", NEW.theme_contrast);
    END IF;

    IF NEW.caption_show <> '' THEN
        SET audit_log = CONCAT(audit_log, "<br/>Caption Show: ", NEW.caption_show);
    END IF;

    IF NEW.preset_theme <> '' THEN
        SET audit_log = CONCAT(audit_log, "<br/>Preset Theme: ", NEW.preset_theme);
    END IF;

    IF NEW.dark_layout <> '' THEN
        SET audit_log = CONCAT(audit_log, "<br/>Dark Layout: ", NEW.dark_layout);
    END IF;

    IF NEW.rtl_layout <> '' THEN
        SET audit_log = CONCAT(audit_log, "<br/>RTL Layout: ", NEW.rtl_layout);
    END IF;

    IF NEW.box_container <> '' THEN
        SET audit_log = CONCAT(audit_log, "<br/>Box Container: ", NEW.box_container);
    END IF;

    INSERT INTO audit_log (table_name, reference_id, log, changed_by, changed_at) 
    VALUES ('ui_customization_setting', NEW.ui_customization_setting_id, audit_log, NEW.last_log_by, NOW());
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
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER ui_customization_setting_trigger_update
AFTER UPDATE ON ui_customization_setting
FOR EACH ROW
BEGIN
    DECLARE audit_log TEXT DEFAULT '';

    IF NEW.theme_contrast <> OLD.theme_contrast THEN
        SET audit_log = CONCAT(audit_log, "Theme Contrast: ", OLD.theme_contrast, " -> ", NEW.theme_contrast, "<br/>");
    END IF;

    IF NEW.caption_show <> OLD.caption_show THEN
        SET audit_log = CONCAT(audit_log, "Caption Show: ", OLD.caption_show, " -> ", NEW.caption_show, "<br/>");
    END IF;

    IF NEW.preset_theme <> OLD.preset_theme THEN
        SET audit_log = CONCAT(audit_log, "Preset Theme: ", OLD.preset_theme, " -> ", NEW.preset_theme, "<br/>");
    END IF;

    IF NEW.dark_layout <> OLD.dark_layout THEN
        SET audit_log = CONCAT(audit_log, "Dark Layout: ", OLD.dark_layout, " -> ", NEW.dark_layout, "<br/>");
    END IF;

    IF NEW.rtl_layout <> OLD.rtl_layout THEN
        SET audit_log = CONCAT(audit_log, "RTL Layout: ", OLD.rtl_layout, " -> ", NEW.rtl_layout, "<br/>");
    END IF;

    IF NEW.box_container <> OLD.box_container THEN
        SET audit_log = CONCAT(audit_log, "Box Container: ", OLD.box_container, " -> ", NEW.box_container , "<br/>");
    END IF;
    
    IF LENGTH(audit_log) > 0 THEN
        INSERT INTO audit_log (table_name, reference_id, log, changed_by, changed_at) 
        VALUES ('ui_customization_setting', NEW.ui_customization_setting_id, audit_log, NEW.last_log_by, NOW());
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `upload_settings`
--

DROP TABLE IF EXISTS `upload_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `upload_settings` (
  `upload_setting_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `upload_setting_name` varchar(100) NOT NULL,
  `upload_setting_description` varchar(200) NOT NULL,
  `max_upload_size` double NOT NULL,
  `last_log_by` int(10) NOT NULL,
  PRIMARY KEY (`upload_setting_id`),
  KEY `upload_settings_index_upload_setting_id` (`upload_setting_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `upload_settings`
--

LOCK TABLES `upload_settings` WRITE;
/*!40000 ALTER TABLE `upload_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `upload_settings` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER upload_settings_trigger_insert
AFTER INSERT ON upload_settings
FOR EACH ROW
BEGIN
    DECLARE audit_log TEXT DEFAULT 'Upload setting created. <br/>';

    IF NEW.upload_setting_name <> '' THEN
        SET audit_log = CONCAT(audit_log, "<br/>Upload Setting Name: ", NEW.upload_setting_name);
    END IF;

    IF NEW.upload_setting_description <> '' THEN
        SET audit_log = CONCAT(audit_log, "<br/>Upload Setting Description: ", NEW.upload_setting_description);
    END IF;

    IF NEW.max_upload_size <> '' THEN
        SET audit_log = CONCAT(audit_log, "<br/>Max Upload Size: ", NEW.max_upload_size);
    END IF;

    INSERT INTO audit_log (table_name, reference_id, log, changed_by, changed_at) 
    VALUES ('upload_settings', NEW.upload_setting_id, audit_log, NEW.last_log_by, NOW());
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
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER upload_settings_trigger_update
AFTER UPDATE ON upload_settings
FOR EACH ROW
BEGIN
    DECLARE audit_log TEXT DEFAULT '';

    IF NEW.upload_setting_name <> OLD.upload_setting_name THEN
        SET audit_log = CONCAT(audit_log, "Upload Setting Name: ", OLD.upload_setting_name, " -> ", NEW.upload_setting_name, "<br/>");
    END IF;

    IF NEW.upload_setting_description <> OLD.upload_setting_description THEN
        SET audit_log = CONCAT(audit_log, "Upload Setting Description: ", OLD.upload_setting_description, " -> ", NEW.upload_setting_description, "<br/>");
    END IF;

    IF NEW.max_upload_size <> OLD.max_upload_size THEN
        SET audit_log = CONCAT(audit_log, "Max Upload Size: ", OLD.max_upload_size, " -> ", NEW.max_upload_size, "<br/>");
    END IF;
    
    IF LENGTH(audit_log) > 0 THEN
        INSERT INTO audit_log (table_name, reference_id, log, changed_by, changed_at) 
        VALUES ('upload_settings', NEW.upload_setting_id, audit_log, NEW.last_log_by, NOW());
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `upload_settings_file_extension`
--

DROP TABLE IF EXISTS `upload_settings_file_extension`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `upload_settings_file_extension` (
  `upload_setting_id` int(10) NOT NULL,
  `file_extension_id` int(10) NOT NULL,
  KEY `upload_settings_file_extension_index_upload_setting_id` (`upload_setting_id`),
  KEY `upload_settings_file_extension_index_file_extension_id` (`file_extension_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `upload_settings_file_extension`
--

LOCK TABLES `upload_settings_file_extension` WRITE;
/*!40000 ALTER TABLE `upload_settings_file_extension` DISABLE KEYS */;
/*!40000 ALTER TABLE `upload_settings_file_extension` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email_address` varchar(100) NOT NULL,
  `password` varchar(500) NOT NULL,
  `file_as` varchar(300) NOT NULL,
  `user_status` char(10) NOT NULL,
  `password_expiry_date` date NOT NULL,
  `failed_login` tinyint(1) NOT NULL DEFAULT 0,
  `last_failed_login` datetime DEFAULT NULL,
  `last_connection_date` datetime DEFAULT NULL,
  `last_log_by` int(10) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `email_address` (`email_address`),
  KEY `users_index_email_address` (`email_address`),
  KEY `users_index_user_status` (`user_status`),
  KEY `users_index_password_expiry_date` (`password_expiry_date`),
  KEY `users_index_last_connection_date` (`last_connection_date`),
  KEY `users_index_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin@encorefinancials.com','W5hvx4P278F8q50uZe2YFif%2ByRDeSeNaainzl5K9%2BQM%3D','Administrator','Active','2023-10-06',0,'2023-05-03 09:22:39','2023-05-24 09:57:05',1),(2,'ldagulto@encorefinancials.com','GgukHef0woUl4E8Dso5NUoA%2FW9Mnae5LVVBj6oPj8WQ%3D','Lawrence D. Agulto','Active','2023-10-11',5,'2023-05-01 08:42:36','2023-04-11 09:05:48',1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER users_trigger_insert
AFTER INSERT ON users
FOR EACH ROW
BEGIN
    DECLARE audit_log TEXT DEFAULT 'User created. <br/>';

    IF NEW.email_address <> '' THEN
        SET audit_log = CONCAT(audit_log, "<br/>Email Address: ", NEW.email_address);
    END IF;

    IF NEW.file_as <> '' THEN
        SET audit_log = CONCAT(audit_log, "<br/>File As: ", NEW.file_as);
    END IF;

    IF NEW.user_status <> '' THEN
        SET audit_log = CONCAT(audit_log, "<br/>User Status: ", NEW.user_status);
    END IF;

    IF NEW.password_expiry_date <> '' THEN
        SET audit_log = CONCAT(audit_log, "<br/>Password Expiry Date: ", NEW.password_expiry_date);
    END IF;

    INSERT INTO audit_log (table_name, reference_id, log, changed_by, changed_at) 
    VALUES ('users', NEW.user_id, audit_log, NEW.last_log_by, NOW());
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
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER users_trigger_update
AFTER UPDATE ON users
FOR EACH ROW
BEGIN
    DECLARE audit_log TEXT DEFAULT '';

    IF NEW.user_status <> OLD.user_status THEN
        SET audit_log = CONCAT(audit_log, "User Status: ", OLD.user_status, " -> ", NEW.user_status, "<br/>");
    END IF;

    IF NEW.password_expiry_date <> OLD.password_expiry_date THEN
        SET audit_log = CONCAT(audit_log, "Password Expiry Date: ", OLD.password_expiry_date, " -> ", NEW.password_expiry_date, "<br/>");
    END IF;

    IF NEW.failed_login <> OLD.failed_login THEN
        SET audit_log = CONCAT(audit_log, "Failed Login: ", OLD.failed_login, " -> ", NEW.failed_login, "<br/>");
    END IF;

    IF NEW.last_failed_login <> OLD.last_failed_login THEN
        SET audit_log = CONCAT(audit_log, "Last Failed Login: ", OLD.last_failed_login, " -> ", NEW.last_failed_login, "<br/>");
    END IF;

    IF NEW.last_connection_date <> OLD.last_connection_date THEN
        SET audit_log = CONCAT(audit_log, "Last Connection Date: ", OLD.last_connection_date, " -> ", NEW.last_connection_date, "<br/>");
    END IF;
    
    IF LENGTH(audit_log) > 0 THEN
        INSERT INTO audit_log (table_name, reference_id, log, changed_by, changed_at) 
        VALUES ('users', NEW.user_id, audit_log, NEW.last_log_by, NOW());
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping routines for database 'nexusdb'
--
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `build_menu_group` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `build_menu_group`(IN p_user_id INT(10))
BEGIN
    SELECT DISTINCT(mg.menu_group_id) as menu_group_id, mg.menu_group_name
    FROM menu_groups mg
    JOIN menu_item mi ON mi.menu_group_id = mg.menu_group_id
    WHERE EXISTS (
        SELECT 1
        FROM menu_access_right mar
        WHERE mar.menu_item_id = mi.menu_item_id
        AND mar.read_access = 1
        AND mar.role_id IN (
            SELECT role_id
            FROM role_users
            WHERE user_id = p_user_id
        )
    )
    ORDER BY mg.order_sequence;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `build_menu_item` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `build_menu_item`(IN p_user_id INT(10), IN p_menu_group_id INT(10))
BEGIN
    SELECT mi.menu_item_id, mi.menu_item_name, mi.menu_group_id, mi.menu_item_url, mi.parent_id, mi.menu_item_icon
    FROM menu_item AS mi
    INNER JOIN menu_access_right AS mar ON mi.menu_item_id = mar.menu_item_id
    INNER JOIN role_users AS ru ON mar.role_id = ru.role_id
    WHERE mar.read_access = 1 AND ru.user_id = p_user_id AND mi.menu_group_id = p_menu_group_id
    ORDER BY mi.order_sequence;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `check_file_extension_exist` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `check_file_extension_exist`(IN p_file_extension_id INT(10))
BEGIN
    SELECT COUNT(*) AS total
    FROM file_extension
    WHERE file_extension_id = p_file_extension_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `check_file_types_exist` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `check_file_types_exist`(IN p_file_type_id INT(10))
BEGIN
    SELECT COUNT(*) AS total
    FROM file_types
    WHERE file_type_id = p_file_type_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `check_menu_access_rights` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `check_menu_access_rights`(IN p_user_id INT(10), IN p_menu_item_id INT(10), IN p_access_type VARCHAR(10))
BEGIN
	IF p_access_type = 'read' THEN
        SELECT COUNT(role_id) AS TOTAL
        FROM role_users
        WHERE user_id = p_user_id AND role_id IN (SELECT role_id FROM menu_access_right where read_access = '1' AND menu_item_id = menu_item_id);
    ELSEIF p_access_type = 'write' THEN
        SELECT COUNT(role_id) AS TOTAL
        FROM role_users
        WHERE user_id = p_user_id AND role_id IN (SELECT role_id FROM menu_access_right where write_access = '1' AND menu_item_id = menu_item_id);
    ELSEIF p_access_type = 'create' THEN
        SELECT COUNT(role_id) AS TOTAL
        FROM role_users
        WHERE user_id = p_user_id AND role_id IN (SELECT role_id FROM menu_access_right where create_access = '1' AND menu_item_id = menu_item_id);
    ELSE
        SELECT COUNT(role_id) AS TOTAL
        FROM role_users
        WHERE user_id = p_user_id AND role_id IN (SELECT role_id FROM menu_access_right where delete_access = '1' AND menu_item_id = menu_item_id);
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `check_menu_groups_exist` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `check_menu_groups_exist`(IN p_menu_group_id INT(10))
BEGIN
    SELECT COUNT(*) AS total
    FROM menu_groups
    WHERE menu_group_id = p_menu_group_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `check_menu_item_exist` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `check_menu_item_exist`(IN p_menu_item_id INT(10))
BEGIN
    SELECT COUNT(*) AS total
    FROM menu_item
    WHERE menu_item_id = p_menu_item_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `check_role_menu_item_access_right_exist` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `check_role_menu_item_access_right_exist`(IN `p_menu_item_id` INT(10), IN `p_role_id` INT(10))
BEGIN
    SELECT COUNT(*) AS total
    FROM menu_access_right
    WHERE menu_item_id = p_menu_item_id AND role_id = p_role_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `check_system_action_access_rights` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `check_system_action_access_rights`(IN p_user_id INT(10), IN p_system_action_id INT(10))
BEGIN
	SELECT COUNT(role_id) AS TOTAL
    FROM role_users
    WHERE user_id = p_user_id AND role_id IN (SELECT role_id FROM system_action_access_rights where system_action_id = p_system_action_id);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `check_ui_customization_setting_exist` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `check_ui_customization_setting_exist`(IN p_user_id INT(10), IN p_email_address VARCHAR(100))
BEGIN
    SELECT COUNT(*) AS total
    FROM ui_customization_setting
    WHERE user_id = p_user_id OR email_address = BINARY p_email_address;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `check_upload_settings_exist` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `check_upload_settings_exist`(IN p_upload_setting_id INT(10))
BEGIN
    SELECT COUNT(*) AS total
    FROM upload_settings
    WHERE upload_setting_id = p_upload_setting_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `check_user_exist` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `check_user_exist`(IN p_user_id INT(10), IN p_email_address VARCHAR(100))
BEGIN
    SELECT COUNT(*) AS total
    FROM users
    WHERE user_id = p_user_id OR email_address = BINARY p_email_address;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_all_file_extension` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_all_file_extension`(IN p_file_type_id INT(10))
BEGIN
    DELETE FROM file_extension WHERE file_type_id = p_file_type_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_all_menu_item` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_all_menu_item`(IN p_menu_group_id INT(10))
BEGIN
    DELETE FROM menu_item WHERE menu_group_id = p_menu_group_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_all_upload_setting_file_extension` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_all_upload_setting_file_extension`(IN p_upload_setting_id INT(10))
BEGIN
    DELETE FROM upload_settings_file_extension WHERE upload_setting_id = p_upload_setting_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_file_extension` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_file_extension`(IN p_file_extension_id INT(10))
BEGIN
    DELETE FROM file_extension WHERE file_extension_id = p_file_extension_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_file_types` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_file_types`(IN p_file_type_id INT(10))
BEGIN
    DELETE FROM file_types WHERE file_type_id = p_file_type_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_menu_groups` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_menu_groups`(IN p_menu_group_id INT(10))
BEGIN
    DELETE FROM menu_groups WHERE menu_group_id = p_menu_group_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_menu_item` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_menu_item`(IN p_menu_item_id INT(10))
BEGIN
    DELETE FROM menu_item WHERE menu_item_id = p_menu_item_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_upload_settings` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_upload_settings`(IN p_upload_setting_id INT(10))
BEGIN
    DELETE FROM upload_settings WHERE upload_setting_id = p_upload_setting_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_upload_settings_file_extension` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_upload_settings_file_extension`(IN p_upload_setting_id INT(10), IN p_file_extension_id INT(10))
BEGIN
    DELETE FROM upload_settings WHERE upload_setting_id = p_upload_setting_id AND file_extension_id = p_file_extension_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_user` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_user`(IN p_user_id INT(10), IN p_email_address VARCHAR(100))
BEGIN
	DELETE FROM users 
	WHERE user_id = p_user_id OR email_address = BINARY p_email_address;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `duplicate_file_extension` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `duplicate_file_extension`(IN p_file_extension_id INT(10), IN p_last_log_by INT(10), OUT p_new_file_extension_id INT(10))
BEGIN
    DECLARE p_file_extension_name VARCHAR(255);
    DECLARE p_file_type_id INT(10);
    
    SELECT file_extension_name, file_type_id 
    INTO p_file_extension_name, p_file_type_id 
    FROM file_extension 
    WHERE file_extension_id = p_file_extension_id;
    
    INSERT INTO file_extension (file_extension_name, file_type_id, last_log_by) 
    VALUES(p_file_extension_name, p_file_type_id, p_last_log_by);
    
    SET p_new_file_extension_id = LAST_INSERT_ID();
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `duplicate_file_types` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `duplicate_file_types`(IN p_file_type_id INT(10), IN p_last_log_by INT(10), OUT p_new_file_type_id INT(10))
BEGIN
    DECLARE p_file_type_name VARCHAR(255);
    
    SELECT file_type_name 
    INTO p_file_type_name 
    FROM file_types 
    WHERE file_type_id = p_file_type_id;
    
    INSERT INTO file_types (file_type_name, last_log_by) 
    VALUES(p_file_type_name, p_last_log_by);
    
    SET p_new_file_type_id = LAST_INSERT_ID();
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `duplicate_menu_groups` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `duplicate_menu_groups`(IN p_menu_group_id INT(10), IN p_last_log_by INT(10), OUT p_new_menu_group_id INT(10))
BEGIN
    DECLARE p_menu_group_name VARCHAR(255);
    DECLARE p_order_sequence INT(10);
    
    SELECT menu_group_name, order_sequence 
    INTO p_menu_group_name, p_order_sequence 
    FROM menu_groups 
    WHERE menu_group_id = p_menu_group_id;
    
    INSERT INTO menu_groups (menu_group_name, order_sequence, last_log_by) 
    VALUES(p_menu_group_name, p_order_sequence, p_last_log_by);
    
    SET p_new_menu_group_id = LAST_INSERT_ID();
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `duplicate_menu_item` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `duplicate_menu_item`(IN `p_menu_item_id` INT(10), IN `p_last_log_by` INT(10), OUT `p_new_menu_item_id` INT(10))
BEGIN
    DECLARE p_menu_item_name VARCHAR(255);
    DECLARE p_menu_group_id INT(10);
    DECLARE p_menu_item_url VARCHAR(50);
    DECLARE p_parent_id INT(10);
    DECLARE p_menu_item_icon VARCHAR(150);
    DECLARE p_order_sequence TINYINT(10);
    
    SELECT menu_item_name, menu_group_id, menu_item_url, parent_id, menu_item_icon, order_sequence 
    INTO p_menu_item_name, p_menu_group_id, p_menu_item_url, p_parent_id, p_menu_item_icon, p_order_sequence 
    FROM menu_item 
    WHERE menu_item_id = p_menu_item_id;
    
    INSERT INTO menu_item (menu_item_name, menu_group_id, menu_item_url, parent_id, menu_item_icon, order_sequence, last_log_by) 
    VALUES(p_menu_item_name, p_menu_group_id, p_menu_item_url, p_parent_id, p_menu_item_icon, p_order_sequence, p_last_log_by);
    
    SET p_new_menu_item_id = LAST_INSERT_ID();
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `duplicate_upload_settings` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `duplicate_upload_settings`(IN p_upload_setting_id INT(10), IN p_last_log_by INT(10), OUT p_new_upload_setting_id INT(10))
BEGIN
    DECLARE p_upload_setting_name VARCHAR(100);
    DECLARE p_upload_setting_description VARCHAR(200);
    DECLARE p_max_upload_size DOUBLE;
    
    SELECT upload_setting_name, upload_setting_description, max_upload_size
    INTO p_upload_setting_name, p_upload_setting_description, p_max_upload_size
    FROM upload_settings 
    WHERE upload_setting_id = p_upload_setting_id;
    
    INSERT INTO upload_settings (upload_setting_name, upload_setting_description, max_upload_size, last_log_by) 
    VALUES(p_upload_setting_name, p_upload_setting_description, p_max_upload_size, p_last_log_by);
    
    SET p_new_upload_setting_id = LAST_INSERT_ID();
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_file_extension_details` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_file_extension_details`(IN p_file_extension_id INT(10))
BEGIN
    SELECT file_extension_name, file_type_id, last_log_by
	FROM file_extension 
	WHERE file_extension_id = p_file_extension_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_file_types_details` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_file_types_details`(IN p_file_type_id INT(10))
BEGIN
    SELECT file_type_name, last_log_by
	FROM file_types 
	WHERE file_type_id = p_file_type_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_menu_groups_details` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_menu_groups_details`(IN p_menu_group_id INT(10))
BEGIN
    SELECT menu_group_name, order_sequence, last_log_by
	FROM menu_groups 
	WHERE menu_group_id = p_menu_group_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_menu_item_details` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_menu_item_details`(IN p_menu_item_id INT(10))
BEGIN
    SELECT menu_item_name, menu_group_id, menu_item_url, parent_id, menu_item_icon, order_sequence, last_log_by
	FROM menu_item 
	WHERE menu_item_id = p_menu_item_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_role_details` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_role_details`(IN p_role_id INT(10))
BEGIN
    SELECT role_name, role_description, assignable, last_log_by
	FROM role 
	WHERE role_id = p_role_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_role_menu_access_rights` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_role_menu_access_rights`(IN p_menu_item_id INT(10), IN p_role_id INT(10))
BEGIN
    SELECT read_access, write_access, create_access, delete_access
    FROM menu_access_right 
    WHERE menu_item_id = p_menu_item_id AND role_id = p_role_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_ui_customization_setting_details` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_ui_customization_setting_details`(IN p_user_id INT(10), IN p_email_address VARCHAR(100))
BEGIN
    SELECT ui_customization_setting_id, user_id, email_address, theme_contrast, caption_show, preset_theme, dark_layout, rtl_layout, box_container, last_log_by
	FROM ui_customization_setting 
	WHERE user_id = p_user_id OR email_address = BINARY p_email_address;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_upload_settings_details` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_upload_settings_details`(IN p_upload_setting_id INT(10))
BEGIN
    SELECT upload_setting_name, upload_setting_description, max_upload_size, last_log_by
	FROM upload_settings 
	WHERE upload_setting_id = p_upload_setting_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_user_details` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_user_details`(IN p_user_id INT(10), IN p_email_address VARCHAR(100))
BEGIN
	SELECT user_id, email_address, password, file_as, user_status, password_expiry_date, failed_login, last_failed_login, last_connection_date, last_log_by
	FROM users 
	WHERE user_id = p_user_id OR email_address = BINARY p_email_address;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_user_password_history_details` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_user_password_history_details`(IN p_user_id INT(10), IN p_email_address VARCHAR(100))
BEGIN
    SELECT password 
	FROM password_history 
	WHERE user_id = p_user_id OR email_address = BINARY p_email_address;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_file_extension` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_file_extension`(IN p_file_extension_name VARCHAR(100), IN p_file_type_id INT(10), IN p_last_log_by INT(10), OUT p_file_extension_id INT(10))
BEGIN
    INSERT INTO file_extension (file_extension_name, file_type_id, last_log_by) 
	VALUES(p_file_extension_name, p_file_type_id, p_last_log_by);
	
    SET p_file_extension_id = LAST_INSERT_ID();
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_file_types` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_file_types`(IN p_file_type_name VARCHAR(100), IN p_last_log_by INT(10), OUT p_file_type_id INT(10))
BEGIN
    INSERT INTO file_types (file_type_name, last_log_by) 
	VALUES(p_file_type_name, p_last_log_by);
	
    SET p_file_type_id = LAST_INSERT_ID();
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_menu_groups` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_menu_groups`(IN p_menu_group_name VARCHAR(100), IN p_order_sequence TINYINT(10), IN p_last_log_by INT(10), OUT p_menu_group_id INT(10))
BEGIN
    INSERT INTO menu_groups (menu_group_name, order_sequence, last_log_by) 
	VALUES(p_menu_group_name, p_order_sequence, p_last_log_by);
	
    SET p_menu_group_id = LAST_INSERT_ID();
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_menu_item` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_menu_item`(IN p_menu_item_name VARCHAR(100), IN p_menu_group_id INT(10), IN p_menu_item_url VARCHAR(50), IN p_parent_id INT(10), IN p_menu_item_icon VARCHAR(150), IN p_order_sequence TINYINT(10), IN p_last_log_by INT(10), OUT p_menu_item_id INT(10))
BEGIN
    INSERT INTO menu_item (menu_item_name, menu_group_id, menu_item_url, parent_id, menu_item_icon, order_sequence, last_log_by) 
	VALUES(p_menu_item_name, p_menu_group_id, p_menu_item_url, p_parent_id, p_menu_item_icon, p_order_sequence, p_last_log_by);
	
    SET p_menu_item_id = LAST_INSERT_ID();
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_password_history` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_password_history`(IN p_user_id INT(10), IN p_email_address VARCHAR(100), IN p_password VARCHAR(500))
BEGIN
	INSERT INTO password_history (user_id, email_address, password) 
	VALUES(p_user_id, p_email_address, p_password);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_role_menu_item_access_right` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_role_menu_item_access_right`(IN `p_menu_item_id` INT(10), IN `p_role_id` INT(10))
BEGIN
    INSERT INTO menu_access_right (menu_item_id, role_id) 
	VALUES(p_menu_item_id, p_role_id);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_ui_customization_setting` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_ui_customization_setting`(IN p_user_id INT(10), IN p_email_address VARCHAR(100), IN p_type VARCHAR(30), IN p_customization_value VARCHAR(15), IN p_last_log_by INT(10))
BEGIN
	IF p_type = 'theme_contrast' THEN
        INSERT INTO ui_customization_setting (user_id, email_address, theme_contrast, last_log_by) 
	    VALUES(p_user_id, p_email_address, p_customization_value, p_last_log_by);
    ELSEIF p_type = 'caption_show' THEN
        INSERT INTO ui_customization_setting (user_id, email_address, caption_show, last_log_by) 
	    VALUES(p_user_id, p_email_address, p_customization_value, p_last_log_by);
    ELSEIF p_type = 'preset_theme' THEN
        INSERT INTO ui_customization_setting (user_id, email_address, preset_theme, last_log_by) 
	    VALUES(p_user_id, p_email_address, p_customization_value, p_last_log_by);
    ELSEIF p_type = 'dark_layout' THEN
        INSERT INTO ui_customization_setting (user_id, email_address, dark_layout, last_log_by) 
	    VALUES(p_user_id, p_email_address, p_customization_value, p_last_log_by);
    ELSEIF p_type = 'rtl_layout' THEN
        INSERT INTO ui_customization_setting (user_id, email_address, rtl_layout, last_log_by) 
	    VALUES(p_user_id, p_email_address, p_customization_value, p_last_log_by);
    ELSE
        INSERT INTO ui_customization_setting (user_id, email_address, box_container, last_log_by) 
	    VALUES(p_user_id, p_email_address, p_customization_value, p_last_log_by);
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_upload_settings` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_upload_settings`(IN p_upload_setting_name VARCHAR(100), IN p_upload_setting_description VARCHAR(200), IN p_max_upload_size DOUBLE, IN p_last_log_by INT(10), OUT p_upload_setting_id INT(10))
BEGIN
    INSERT INTO upload_settings (upload_setting_name, upload_setting_description, max_upload_size, last_log_by) 
	VALUES(p_upload_setting_name, p_upload_setting_description, p_max_upload_size, p_last_log_by);
	
    SET p_upload_setting_id = LAST_INSERT_ID();
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_upload_settings_file_extension` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_upload_settings_file_extension`(IN p_upload_setting_id INT(10), IN p_file_extension_id INT(10))
BEGIN
    INSERT INTO upload_settings_file_extension (upload_setting_id, file_extension_id) 
	VALUES(p_upload_setting_id, p_file_extension_id);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_user` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_user`(IN p_email_address VARCHAR(100), IN p_password VARCHAR(500), IN p_file_as VARCHAR (300), IN p_password_expiry_date DATE)
BEGIN
	INSERT INTO users (email_address, password, file_as, user_status, password_expiry_date, failed_login) 
	VALUES(p_email_address, p_password, p_file_as, "Inactive", p_password_expiry_date, 0);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_file_extension` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_file_extension`(IN p_file_extension_id INT(10), IN p_file_extension_name VARCHAR(100), IN p_file_type_id INT(10), IN p_last_log_by INT(10))
BEGIN
	UPDATE file_extension
        SET file_extension_name = p_file_extension_name,
        file_type_id = p_file_type_id,
        last_log_by = p_last_log_by
       	WHERE file_extension_id = p_file_extension_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_file_types` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_file_types`(IN p_file_type_id INT(10), IN p_file_type_name VARCHAR(100), IN p_last_log_by INT(10))
BEGIN
	UPDATE file_types
        SET file_type_name = p_file_type_name,
        last_log_by = p_last_log_by
       	WHERE file_type_id = p_file_type_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_menu_groups` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_menu_groups`(IN p_menu_group_id INT(10), IN p_menu_group_name VARCHAR(100), IN p_order_sequence TINYINT(10), IN p_last_log_by INT(10))
BEGIN
	UPDATE menu_groups
        SET menu_group_name = p_menu_group_name,
        order_sequence = p_order_sequence,
        last_log_by = p_last_log_by
       	WHERE menu_group_id = p_menu_group_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_menu_item` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_menu_item`(IN `p_menu_item_id` INT(10), IN `p_menu_item_name` VARCHAR(100), IN `p_menu_group_id` INT(10), IN `p_menu_item_url` VARCHAR(50), IN `p_parent_id` INT(10), IN `p_menu_item_icon` VARCHAR(150), IN `p_order_sequence` TINYINT(10), IN `p_last_log_by` INT(10))
BEGIN
	UPDATE menu_item
        SET menu_item_name = p_menu_item_name,
        menu_group_id = p_menu_group_id,
        menu_item_url = p_menu_item_url,
        parent_id = p_parent_id,
        menu_item_icon = p_menu_item_icon,
        order_sequence = p_order_sequence,
        last_log_by = p_last_log_by
       	WHERE menu_item_id = p_menu_item_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_role_menu_item_access_right` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_role_menu_item_access_right`(IN `p_menu_item_id` INT(10), IN `p_role_id` INT(10), IN `p_access_type` VARCHAR(10), IN `p_access` TINYINT(1))
BEGIN
	IF p_access_type = 'read' THEN
        UPDATE menu_access_right
        SET read_access = p_access
        WHERE menu_item_id = p_menu_item_id AND role_id = p_role_id;
    ELSEIF p_access_type = 'write' THEN
        UPDATE menu_access_right
        SET write_access = p_access
        WHERE menu_item_id = p_menu_item_id AND role_id = p_role_id;
    ELSEIF p_access_type = 'create' THEN
        UPDATE menu_access_right
        SET create_access = p_access
        WHERE menu_item_id = p_menu_item_id AND role_id = p_role_id;
    ELSE
        UPDATE menu_access_right
        SET delete_access = p_access
        WHERE menu_item_id = p_menu_item_id AND role_id = p_role_id;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_ui_customization_setting` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_ui_customization_setting`(IN p_user_id INT(10), IN p_email_address VARCHAR(100), IN p_type VARCHAR(30), IN p_customization_value VARCHAR(15), IN p_last_log_by INT(10))
BEGIN
	IF p_type = 'theme_contrast' THEN
        UPDATE ui_customization_setting
        SET theme_contrast = p_customization_value,
        last_log_by = p_last_log_by
       	WHERE user_id = p_user_id OR email_address = BINARY p_email_address;
    ELSEIF p_type = 'caption_show' THEN
        UPDATE ui_customization_setting
        SET caption_show = p_customization_value,
        last_log_by = p_last_log_by
       	WHERE user_id = p_user_id OR email_address = BINARY p_email_address;
    ELSEIF p_type = 'preset_theme' THEN
        UPDATE ui_customization_setting
        SET preset_theme = p_customization_value,
        last_log_by = p_last_log_by
       	WHERE user_id = p_user_id OR email_address = BINARY p_email_address;
    ELSEIF p_type = 'dark_layout' THEN
        UPDATE ui_customization_setting
        SET dark_layout = p_customization_value,
        last_log_by = p_last_log_by
       	WHERE user_id = p_user_id OR email_address = BINARY p_email_address;
    ELSEIF p_type = 'rtl_layout' THEN
        UPDATE ui_customization_setting
        SET rtl_layout = p_customization_value,
        last_log_by = p_last_log_by
       	WHERE user_id = p_user_id OR email_address = BINARY p_email_address;
    ELSE
        UPDATE ui_customization_setting
        SET box_container = p_customization_value,
        last_log_by = p_last_log_by
       	WHERE user_id = p_user_id OR email_address = BINARY p_email_address;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_upload_settings` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_upload_settings`(IN p_upload_setting_id INT(10), IN p_upload_setting_name VARCHAR(100), IN p_upload_setting_description VARCHAR(200), IN p_max_upload_size DOUBLE, IN p_last_log_by INT(10))
BEGIN
	UPDATE upload_settings
        SET upload_setting_name = p_upload_setting_name,
        upload_setting_description = p_upload_setting_description,
        max_upload_size = p_max_upload_size,
        last_log_by = p_last_log_by
       	WHERE upload_setting_id = p_upload_setting_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_user` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_user`(IN p_user_id INT(10), IN p_email_address VARCHAR(100), IN p_password VARCHAR(500), IN p_file_as VARCHAR (300), IN p_password_expiry_date DATE)
BEGIN
	IF p_password IS NOT NULL AND p_password <> '' THEN
        UPDATE users
        SET file_as = p_file_as, password = p_password, password_expiry_date = p_password_expiry_date
       	WHERE user_id = p_user_id OR email_address = BINARY p_email_address;
    ELSE
        UPDATE users
        SET file_as = p_file_as
      	WHERE user_id = p_user_id OR email_address = BINARY p_email_address;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_user_last_connection` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_user_last_connection`(IN p_user_id INT(10), IN p_email_address VARCHAR(100), p_last_connection_date DATETIME)
BEGIN
	UPDATE users 
	SET last_connection_date = p_last_connection_date
	WHERE user_id = p_user_id OR email_address = BINARY p_email_address;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_user_login_attempt` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_user_login_attempt`(IN p_user_id INT(10), IN p_email_address VARCHAR(100), IN p_login_attempt TINYINT(1), IN p_last_failed_attempt_date DATETIME)
BEGIN
    IF p_login_attempt > 0 THEN
        UPDATE users
        SET failed_login = p_login_attempt,
            last_failed_login = p_last_failed_attempt_date
        WHERE user_id = p_user_id OR email_address = BINARY p_email_address;
    ELSE
        UPDATE users
        SET failed_login = p_login_attempt
        WHERE user_id = p_user_id OR email_address = BINARY p_email_address;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_user_password` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_user_password`(IN p_user_id INT(10), IN p_email_address VARCHAR(100), p_password VARCHAR(500), p_password_expiry_date DATE)
BEGIN
	UPDATE users 
	SET PASSWORD = p_password, PASSWORD_EXPIRY_DATE = p_password_expiry_date
	WHERE user_id = p_user_id OR email_address = BINARY p_email_address;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-24 17:33:39
