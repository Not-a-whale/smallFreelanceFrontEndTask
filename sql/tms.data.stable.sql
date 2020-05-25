-- MySQL dump 10.13  Distrib 5.6.43, for FreeBSD12.0 (amd64)
--
-- Host: balancer    Database: tms
-- ------------------------------------------------------
-- Server version	5.7.24-log
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping data for table `app_account_locks`
--

LOCK TABLES `app_account_locks` WRITE;
/*!40000 ALTER TABLE `app_account_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_account_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `app_account_logins`
--

LOCK TABLES `app_account_logins` WRITE;
/*!40000 ALTER TABLE `app_account_logins` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_account_logins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `app_accounts`
--

LOCK TABLES `app_accounts` WRITE;
/*!40000 ALTER TABLE `app_accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `app_features`
--

LOCK TABLES `app_features` WRITE;
/*!40000 ALTER TABLE `app_features` DISABLE KEYS */;
INSERT INTO `app_features` VALUES (1,'HR Associates','/api/associates','GET',NULL),(3,'All Routes','/api/routes','GET',NULL),(5,'API Builder','/prefetch','GET',NULL);
/*!40000 ALTER TABLE `app_features` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `app_menu_items`
--

LOCK TABLES `app_menu_items` WRITE;
/*!40000 ALTER TABLE `app_menu_items` DISABLE KEYS */;
INSERT INTO `app_menu_items` VALUES (1,NULL,'my stuff',NULL,NULL,'tmsapp.main.error',NULL,0.000,1,'mainnav'),(3,NULL,'trip managment',NULL,NULL,'tmsapp.main.trpmgmt',NULL,0.040,1,'mainnav'),(5,NULL,'finances',NULL,NULL,'tmsapp.main.fin',NULL,0.300,1,'mainnav'),(7,NULL,'safety',NULL,NULL,'tmsapp.main.safety',NULL,0.045,1,'mainnav'),(9,NULL,'administration',NULL,'sdfsd','tmsapp.main.admin',NULL,0.100,1,'mainnav'),(11,1,'dashboard','dashboard','imgs/icons.svg#bargraph','tmsapp.main.dashboard',NULL,0.000,1,'mainnav'),(13,1,'calendar','calendar','imgs/icons.svg#calendar','tmsapp.main.calendar',NULL,0.100,1,'mainnav'),(15,3,'trucks','trucks','imgs/icons.svg#vehicle','tmsapp.main.trpmgmt.trucks',NULL,0.000,1,'mainnav'),(17,3,'loads','loads','imgs/icons.svg#boxes','tmsapp.main.trpmgmt.loads.availability',NULL,0.100,1,'mainnav'),(23,15,'my trucks','my trucks',NULL,'tmsapp.main.trpmgmt.trucks.mytrucks',NULL,0.300,1,'topnav'),(25,17,'available','available',NULL,'tmsapp.main.trpmgmt.loads.available',NULL,0.000,1,'topnav'),(27,17,'en route','en route',NULL,'tmsapp.main.trpmgmt.loads.enroute',NULL,0.100,1,'topnav'),(29,17,'pending','pending',NULL,'tmsapp.main.trpmgmt.loads.pending',NULL,0.200,1,'topnav'),(31,17,'build a load','build a load',NULL,'tmsapp.main.trpmgmt.loads.buildaload',NULL,0.300,1,'mainnav'),(33,17,'archives','archives',NULL,'tmsapp.main.trpmgmt.loads.archives',NULL,0.400,1,'mainnav'),(35,9,'users','users','imgs/icons.svg#users','tmsapp.main.admin.users',NULL,0.000,1,'mainnav'),(37,9,'groups','groups',NULL,'tmsapp.main.error',NULL,0.100,0,'mainnav'),(39,9,'reporting','reporting','imgs/icons.svg#globe','tmsapp.main.admin.webadmin',NULL,0.200,1,'mainnav'),(72,NULL,'human resources',NULL,NULL,'tms.app.hr',NULL,0.050,1,'mainnav'),(74,72,'personnel','View Personnel','imgs/icons.svg#addressbook','tmsapp.main.hr.prsnl.ops',NULL,0.000,1,'mainnav'),(119,5,'invoices',NULL,'imgs/icons.svg#document-solid','tmsapp.main.fin.invoice',NULL,0.000,1,'mainnav'),(121,5,'settlements',NULL,'imgs/icons.svg#dollar-sign','tmsapp.main.fin.settlments',NULL,0.000,1,'mainnav'),(123,15,'view map',NULL,NULL,'tmsapp.main.trpmgmt.trucks.map',NULL,0.000,1,'mainnav'),(125,15,'my team','my team',NULL,'tmsapp.main.trpmgmt.trucks.myteam',NULL,0.200,1,'topnav'),(127,15,'all trucks','all trucks',NULL,'tmsapp.main.trpmgmt.trucks.all',NULL,0.100,1,'topnav'),(129,17,'public load boards','public load boards',NULL,'tmsapp.main.trpmgmt.loads.public',NULL,0.350,1,'mainnav'),(187,5,'accounting',NULL,'imgs/icons.svg#book','tmsapp.main.fin.chargeitems',NULL,9.000,1,'mainnav'),(189,187,'generate',NULL,NULL,'tmsapp.main.fin.chargeitems.generate',NULL,0.100,1,'topnav'),(213,74,'operators','list of operators',NULL,'tmsapp.main.hr.prsnl.ops.list',NULL,0.000,1,'topnav'),(215,74,'associates','list of all associates',NULL,'tmsapp.main.hr.prsnl.asc',NULL,1.000,1,'topnav'),(217,74,'employees','list of all employees',NULL,'tmsapp.main.hr.prsnl.emp',NULL,2.000,1,'topnav'),(219,7,'inventory','list of all equipment','imgs/icons.svg#briefcase','tmsapp.main.safety.inv',NULL,1.000,1,'mainnav'),(221,7,'maintenance',NULL,'imgs/icons.svg#tools','tms.app.error',NULL,2.000,1,'mainnav'),(223,7,'expirations',NULL,'imgs/icons.svg#exclamation-triangle','tms.app.error',NULL,3.000,1,'mainnav'),(225,219,'register truck',NULL,NULL,'tmsapp.main.safety.inv.regtruck',NULL,1.000,1,'mainnav'),(227,219,'register trailer',NULL,NULL,'tmsapp.main.safety.inv.regtrailer',NULL,2.000,1,'mainnav'),(229,219,'vehicles','all vehicles registered',NULL,'tmsapp.main.safety.inv.vehicles',NULL,1.000,1,'topnav'),(231,219,'other assets','all other assets registered in the system',NULL,'tmsapp.main.safety.inv.assets',NULL,2.000,1,'topnav'),(233,72,'businesses','all the businesses','imgs/icons.svg#buildings','tmsapp.main.hr.biz',NULL,2.000,1,'mainnav'),(235,233,'register carrier','register a new carrier business',NULL,'tmsapp.main.hr.biz.carrier.form',NULL,1.000,1,'mainnav'),(237,233,'carriers','list of carriers',NULL,'tmsapp.main.hr.biz.carrier.list',NULL,1.000,1,'topnav'),(239,233,'brokers','list of brokers',NULL,'tmsapp.main.hr.biz.broker.list',NULL,2.000,1,'topnav'),(241,233,'vendors','list of vendors','','tms.app.error',NULL,0.000,1,'topnav'),(243,233,'other','list of everyone else',NULL,'tmsapp.main.hr.biz.other.list',NULL,0.000,1,'topnav');
/*!40000 ALTER TABLE `app_menu_items` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`192.168.1%.%`*/ /*!50003 TRIGGER `tms`.`app_menu_items_AFTER_INSERT` AFTER INSERT ON `app_menu_items` FOR EACH ROW
BEGIN
	INSERT INTO 
		app_menu_items_trees (AncestorId, DescendantId, Depth)
	SELECT
		AncestorId, NEW.MenuItemId, Depth + 1
	FROM 
		app_menu_items_trees
	WHERE
		DescendantId = NEW.ParentId
	UNION ALL
		SELECT
			NEW.MenuItemId, NEW.MenuItemId, 0;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`192.168.1%.%`*/ /*!50003 TRIGGER `tms`.`app_menu_items_BEFORE_DELETE` BEFORE DELETE ON `app_menu_items` FOR EACH ROW
BEGIN
	DECLARE has_ancestors BIGINT(20) DEFAULT NULL;
    SELECT
		tree.AncestorId
	INTO 
		has_ancestors
	FROM
		app_menu_items_trees tree
	WHERE
		tree.AncestorId = OLD.MenuItemId
        AND tree.DescendantId <> tree.AncestorId
	LIMIT 1;
    
    IF (has_ancestors IS NOT NULL) THEN
		DELETE b FROM
			app_menu_items_trees a,
            app_menu_items_trees b
		WHERE
			a.AncestorId = OLD.MenuItemId OR
            b.DescendantId = OLD.MenuItemId OR 
            (a.AncestorId = OLD.MenuItemId AND a.DescendantId = b.DescendantId);
	ELSE
		DELETE FROM app_menu_items_trees WHERE DescendantId = OLD.MenuItemId;
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping data for table `app_menu_items_trees`
--

LOCK TABLES `app_menu_items_trees` WRITE;
/*!40000 ALTER TABLE `app_menu_items_trees` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_menu_items_trees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `app_role_menus`
--

LOCK TABLES `app_role_menus` WRITE;
/*!40000 ALTER TABLE `app_role_menus` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_role_menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `app_role_permissions`
--

LOCK TABLES `app_role_permissions` WRITE;
/*!40000 ALTER TABLE `app_role_permissions` DISABLE KEYS */;
INSERT INTO `app_role_permissions` VALUES (1,3,1),(3,5,1),(5,5,3),(7,5,5);
/*!40000 ALTER TABLE `app_role_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `app_roles`
--

LOCK TABLES `app_roles` WRITE;
/*!40000 ALTER TABLE `app_roles` DISABLE KEYS */;
INSERT INTO `app_roles` VALUES (1,'Admin','Website Admin, full Access to everything.',0,0,NULL,NULL,'2019-05-20 17:15:46',NULL),(3,'Managers',NULL,1,1,NULL,NULL,'2020-03-10 17:04:42',NULL),(5,'Developers',NULL,1,1,NULL,NULL,'2020-03-10 17:19:15',NULL);
/*!40000 ALTER TABLE `app_roles` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`192.168.1%.%`*/ /*!50003 TRIGGER `tms`.`app_roles_editing_restrictions` BEFORE UPDATE ON `app_roles` FOR EACH ROW
BEGIN
	IF (NEW.UserDefined IS NOT NULL AND NEW.UserDefined <> OLD.UserDefined) THEN
		SIGNAL SQLSTATE "45000" 
        SET MESSAGE_TEXT = "This action is not allowed!";
	END IF;
    
    IF (OLD.UserDefined <> 1) THEN
		SIGNAL SQLSTATE "45000"
        SET MESSAGE_TEXT = "Cannot change system defined roles";
    END IF;
    
    IF (OLD.Editable <> 1) THEN
		IF (NEW.Editable = 1) THEN
			SET NEW.RoleName = OLD.RoleName;
            SET NEW.Description = OLD.Description;
		ELSE
        SIGNAL SQLSTATE "45000"
        SET MESSAGE_TEXT = "This role is locked, unlock to make updates.";
        END IF;
    END IF;
    
    SET NEW.DateUpdated = CURRENT_TIMESTAMP;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`192.168.1%.%`*/ /*!50003 TRIGGER `tms`.`app_roles_no_delete_admin` BEFORE DELETE ON `app_roles` FOR EACH ROW
BEGIN
	IF (OLD.UserDefined <> 1) THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'This role cannot be deleted.';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping data for table `app_roles_assigned`
--

LOCK TABLES `app_roles_assigned` WRITE;
/*!40000 ALTER TABLE `app_roles_assigned` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_roles_assigned` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `app_sessions`
--

LOCK TABLES `app_sessions` WRITE;
/*!40000 ALTER TABLE `app_sessions` DISABLE KEYS */;
INSERT INTO `app_sessions` VALUES (3,'Xmaf4wABc9H1LkoYbgBZCal_Zd-wQwnc','{\"pid\":95185}','2020-03-09 12:58:27','2020-03-09 12:58:27'),(5,'XmaFSwABEYnUsSRDBm1_eZ0N9feyi2Ay','{\"pid\":94252}','2020-03-09 11:04:59','2020-03-09 12:54:11'),(7,'XmahMgABeL4J54P5Wwptmwn5Mw0BQN7h','{\"pid\":3490}','2020-03-09 13:04:03','2020-03-09 13:26:12'),(9,'XmapAQAADaJ8NjsS82lOnAbCEBqA9kdV','{\"userid\":\"test\",\"pid\":3490}','2020-03-09 13:37:21','2020-03-09 13:57:12'),(11,'XmauFAAAKDqXxCOBNLfLJjnuaWRD4u4m','{\"userid\":\"test\"}','2020-03-09 13:59:00','2020-03-09 13:59:00'),(13,'XmavpwAALtSXpWsN-n5clKQuQsDPmIWj','{\"userid\":\"test\",\"pid\":11988}','2020-03-09 14:05:43','2020-03-09 14:05:43'),(15,'XmawGgAALtQnEDtpX1Jh8hGQa9kUuhAn','{\"userid\":\"test\"}','2020-03-09 14:07:38','2020-03-09 14:07:38'),(17,'Xma1yQAAQ7iOM1cqFC0DeQA6p7PsNwwp','{\"userid\":\"test\",\"pid\":17336}','2020-03-09 14:31:53','2020-03-09 14:31:53'),(19,'Xme7AAAARlPq4SfjyRtfUkiA74-veIX1','{\"userid\":\"test\"}','2020-03-10 09:06:24','2020-03-10 09:06:24'),(21,'XmfVOAAARlP58kKE-D1Z3Uc4j_QmG8Qz','{\"userid\":\"test\"}','2020-03-10 10:58:16','2020-03-10 10:58:16'),(23,'XmfgCwAARlP0u7TeehM1gY5e71m8rl05','{\"userid\":\"test\"}','2020-03-10 11:44:27','2020-03-10 11:44:27'),(25,'XmfuyAABgbRpZkY0f7YT8TVt0fyNxOm8','{\"userid\":\"test\",\"pid\":98740}','2020-03-10 12:47:20','2020-03-10 13:35:57'),(27,'XmgdKAAASLPtvAAI4wTc3CP2KK59T74d','{\"pid\":18611,\"userid\":\"test\"}','2020-03-10 16:05:12','2020-03-10 17:18:58'),(29,'XmgtuAABIvYHUbbWcxa1uD-KunBM7LNT','{\"userid\":\"test\"}','2020-03-10 17:15:52','2020-03-10 17:15:52'),(31,'XmkBugAA9TvuZBFQeu0waoBzNbYuo7dS','{\"userid\":\"test\"}','2020-03-11 08:20:26','2020-03-11 08:20:26'),(33,'XmkHngAA_PzjjDH1hmE7U45pSAMiEOG-','{\"pid\":64764,\"userid\":\"test\"}','2020-03-11 08:45:34','2020-03-12 11:26:51'),(35,'XmkOeQAA_YicLsl1W7gjfrgFN13_7Uhp','{\"userid\":\"test\"}','2020-03-11 09:14:49','2020-03-11 09:14:49'),(37,'XmkbMAAA_YgYeJOkCPZuW5vh6oKWs4oh','{\"userid\":\"test\"}','2020-03-11 10:09:04','2020-03-11 10:09:04'),(39,'XmkfHAAA_YjGtl26nfnZeyS84XLNocdm','{\"userid\":\"test\",\"pid\":64904}','2020-03-11 10:25:48','2020-03-11 10:25:53'),(41,'XmkqAQAA_Yjjv6UjJ6Hoguqsv5nyfSFL','{\"userid\":\"test\"}','2020-03-11 11:12:17','2020-03-11 11:12:17'),(43,'XmlFoAAA_YgySulogb5PlYCAaAlOKvRP','{\"userid\":\"test\"}','2020-03-11 13:10:08','2020-03-11 13:10:08'),(45,'XmlY0wAA_Yi2N0CGX4MnhyIvGeu64hjL','{\"userid\":\"test\"}','2020-03-11 14:32:03','2020-03-11 14:32:03'),(47,'Xmlc9QAA_YjJQm3OLvCHPvSpNLC575Ix','{\"userid\":\"test\"}','2020-03-11 14:49:41','2020-03-11 14:49:41'),(49,'XmllewAA_YjhvXLyyOqKQiLE9qqUXWwI','{\"userid\":\"test\"}','2020-03-11 15:26:03','2020-03-11 15:26:03'),(51,'XmlpeQAA_YhNLGy5mHNn8HiUPA1K5Ese','{\"userid\":\"test\",\"pid\":64904}','2020-03-11 15:43:05','2020-03-11 15:43:05'),(53,'Xml8iwABQYbHl35-m-YQYijIimnaHowM','{\"userid\":\"test\"}','2020-03-11 17:04:27','2020-03-11 17:04:27'),(55,'XmpSyAABIpCmvNaytJ9tKa8IB9BD8QiY','{\"userid\":\"test\"}','2020-03-12 08:18:32','2020-03-12 08:18:32'),(57,'XmpbfQABIpBk6MsdP83JfF_hHu65bh4t','{\"userid\":\"test\"}','2020-03-12 08:55:41','2020-03-12 08:55:41'),(59,'XmqaeQAAnvgx6s1Y5GtxqI4XOBsFTsYZ','{\"userid\":\"test\"}','2020-03-12 13:24:25','2020-03-12 13:24:25'),(61,'XmqcIgAApFIok5RjlP_JTdeEYkMUare7','{\"userid\":\"test\"}','2020-03-12 13:31:30','2020-03-12 13:31:30'),(63,'Xmqe-QAAr8aCC8EefJogoDKrA3Dt8VuC','{\"userid\":\"test\"}','2020-03-12 13:43:37','2020-03-12 13:43:37'),(65,'Xmq2bAAA8pRn25ma2k7OJ54uadL1SSBH','{\"userid\":\"test\"}','2020-03-12 15:23:40','2020-03-12 15:23:40'),(67,'XmuY8QABIYd3K_eVYe99yfjZrMKfVE-l','{\"userid\":\"test\"}','2020-03-13 07:30:10','2020-03-13 07:30:10'),(69,'XmuZbgABIYeEVIjEcFDKc5kq2O8-EeKv','{\"userid\":\"test\"}','2020-03-13 07:32:14','2020-03-13 07:32:14'),(71,'XmuqMQABJ01_FP21GdZEs_aPy7c1NH_r','{\"userid\":\"test\"}','2020-03-13 08:43:45','2020-03-13 08:43:45'),(73,'XmuwQAABJ002CdSdFI5F0OQsWfvEryox','{\"userid\":\"test\"}','2020-03-13 09:09:36','2020-03-13 09:09:36'),(75,'Xmu8ugAAFkT1KJSl6NNy4ra4OULU9slX','{\"userid\":\"test\"}','2020-03-13 10:02:50','2020-03-13 10:02:50'),(77,'XmvIfwAAQFUZPiBDHsRJ_l4QQmGOLNaH','{\"userid\":\"test\"}','2020-03-13 10:53:03','2020-03-13 10:53:03'),(79,'XmvYUwAAXtWIcYuYQUYaQnEq2FhftLKU','{\"userid\":\"test\"}','2020-03-13 12:00:35','2020-03-13 12:00:35'),(81,'Xmvj1wAAXtX1uoVqmkKXhvhPiDwWi_q-','{\"userid\":\"test\"}','2020-03-13 12:49:43','2020-03-13 12:49:43'),(83,'XmvlDwAAXtVedMCVp32Y1CMNznshHsmk','{\"userid\":\"test\"}','2020-03-13 12:54:55','2020-03-13 12:54:55'),(85,'XmvrdgAAXtVyfzd50B2M9ZkaNViCqvKF','{\"userid\":\"test\"}','2020-03-13 13:22:14','2020-03-13 13:22:14'),(87,'Xmv2aQAA2b76zed-8FTbce1OGRJJquHD','{\"userid\":\"test\"}','2020-03-13 14:08:57','2020-03-13 14:08:57'),(89,'Xm-VHQABP9yhj2l3PvtJabIskru7MEVF','{\"userid\":\"test\"}','2020-03-16 08:02:54','2020-03-16 08:02:54'),(91,'Xm-VIwABP9ybRQhHZ-kuXBuYzaAtcOQZ','{\"userid\":\"test\"}','2020-03-16 08:02:59','2020-03-16 08:02:59'),(93,'Xm-loAABP9wm-DJ52RKuAdxLTSrxe1Og','{\"userid\":\"test\"}','2020-03-16 09:13:20','2020-03-16 09:13:20'),(95,'Xm-qQgABP9zcpw9rRM2EaJo2PwPTMXOa','{\"userid\":\"test\"}','2020-03-16 09:33:06','2020-03-16 09:33:06'),(97,'Xm_RLwABTnK1eyguuDn0D8SL4lb2EMO5','{\"userid\":\"test\"}','2020-03-16 12:19:11','2020-03-16 12:19:11'),(99,'Xm_pkwAAGMJCspahjIFrNpsy1EW5IEo2','{\"userid\":\"test\"}','2020-03-16 14:03:16','2020-03-16 14:03:16'),(101,'Xm_vuQABTnIPkm1xAe1vnDXtRgCWKDea','{\"userid\":\"test\"}','2020-03-16 14:29:29','2020-03-16 14:29:29'),(103,'Xm_-_wABTnKlcLNK7Es44BUob0vwAAby','{\"userid\":\"test\"}','2020-03-16 15:34:39','2020-03-16 15:34:39'),(105,'XnAICwAAUGIzV4gLbqb2nrVRj9rSYI7E','{\"userid\":\"test\"}','2020-03-16 16:13:15','2020-03-16 16:13:15'),(107,'XnARAQAAVgvbyKDDvE4UrT-Ui0DSTM9v','{\"userid\":\"test\"}','2020-03-16 16:51:29','2020-03-16 16:51:29'),(109,'XnDoXgAAx6xzfP6DCa4-6vc0GVoI_PZt','{\"userid\":\"test\"}','2020-03-17 08:10:22','2020-03-17 08:10:23'),(111,'XnDo3wAAx6wGmgTNJfuHV7on5NAw-x5b','{\"userid\":\"test\"}','2020-03-17 08:12:31','2020-03-17 08:12:31'),(113,'XnD22gAAx6yVcpWE9kCKCO0aLo7qruMx','{\"userid\":\"test\"}','2020-03-17 09:12:10','2020-03-17 09:12:10'),(115,'XnERRgAA2vFrH5T9QHJW-sVV9b8eA3I_','{\"userid\":\"test\"}','2020-03-17 11:04:54','2020-03-17 11:04:54'),(117,'XnEWaQAA2vGkGM8_vrJivlB6oiyI7GbP','{\"userid\":\"test\"}','2020-03-17 11:26:49','2020-03-17 11:26:49'),(119,'XnEpRQAA67EO_UZ-xNdl7bqaozYZFwM3','{\"userid\":\"test\"}','2020-03-17 12:47:17','2020-03-17 12:47:17'),(121,'XnE1mgAA67EiI00__Kly8oyPif0TA2Nb','{\"userid\":\"test\"}','2020-03-17 13:39:54','2020-03-17 13:39:54'),(123,'XnFj7QAA67Gb3LhfXOW0ADv8KpkF5ORj','{\"userid\":\"test\"}','2020-03-17 16:57:33','2020-03-17 16:57:33'),(125,'XnI3HwAA67FdtuU8Exat416E4fKFF2M6','{\"userid\":\"test\"}','2020-03-18 07:58:39','2020-03-18 07:58:39'),(127,'XnJaNgAAS7vra9shjtAbEHnETTewOq2z','{\"userid\":\"test\"}','2020-03-18 10:28:22','2020-03-18 10:28:22'),(129,'XnJiRQAAWFKXePoN2v0KN_ObT3WzebYr','{\"userid\":\"test\"}','2020-03-18 11:02:45','2020-03-18 11:02:45'),(131,'XnJo0AAAWFIZ5KE5yr2bdEdOPWedfaTw','{\"userid\":\"test\"}','2020-03-18 11:30:40','2020-03-18 11:30:40'),(133,'XnKHMgAAWFLYBJZjggPnDYMOxXnP02li','{\"userid\":\"test\"}','2020-03-18 13:40:18','2020-03-18 13:40:18'),(135,'XnKYCgAAWFLt24__kVajlcKHsfaz-0G9','{\"userid\":\"test\"}','2020-03-18 14:52:10','2020-03-18 14:52:10'),(137,'XnKkcAAAWFK-RgAXvvBxRyly67oUOaRj','{\"userid\":\"test\"}','2020-03-18 15:45:04','2020-03-18 15:45:04'),(139,'XnKt9wAAWFJMhs6UfLUYU9rhHB5QSa1D','{\"userid\":\"test\"}','2020-03-18 16:25:43','2020-03-18 16:25:43'),(141,'XnL0XwAAWFIy8RUwZiEo8mjRG-US-aA0','{\"userid\":\"test\"}','2020-03-18 21:26:07','2020-03-18 21:26:07'),(143,'XnOLYgAAWFKUvFgCBU581GO29afigZb5','{\"userid\":\"test\"}','2020-03-19 08:10:26','2020-03-19 08:10:26'),(145,'XnORsgABAOVaRdKD1ENWBgNak_oOmxMz','{\"userid\":\"test\"}','2020-03-19 08:37:22','2020-03-19 08:37:22'),(147,'XnOYYgABAOVB_l_N3iJ_7Cr7JAjLn_gV','{\"userid\":\"test\"}','2020-03-19 09:05:54','2020-03-19 09:05:54'),(149,'XnOthAABAOUlME6BuHNF6_eBlu4EX6_W','{\"userid\":\"test\"}','2020-03-19 10:36:04','2020-03-19 10:36:04'),(151,'XnO9CgABAOXpYd5Q0hrffr2yCoHD4nXg','{\"userid\":\"test\"}','2020-03-19 11:42:18','2020-03-19 11:42:18'),(153,'XnPAdAABAOUHNMqc59FuEYXR_L4OYBmS','{\"userid\":\"test\"}','2020-03-19 11:56:52','2020-03-19 11:56:52'),(155,'XnTjTAAAXyIZQr9LML2l_y6as-cPNWtQ','{\"userid\":\"test\"}','2020-03-20 08:37:48','2020-03-20 08:37:48'),(157,'XnTtfwAAXyJFHgHqbOD7EJ1QfUWwrtH0','{\"userid\":\"test\"}','2020-03-20 09:21:19','2020-03-20 09:21:19'),(159,'XnUgVQAAXyL9scQ-_RS1PNAPMdJGODr-','{\"userid\":\"test\"}','2020-03-20 12:58:13','2020-03-20 12:58:13'),(161,'XnUxIAAAXyIHzPIx0zOvUE6KLp4TRCKV','{\"userid\":\"test\"}','2020-03-20 14:09:52','2020-03-20 14:09:52'),(163,'XnVAHQAAXyJmitSlbIZTBBs7sYOAJy56','{\"userid\":\"test\"}','2020-03-20 15:13:49','2020-03-20 15:13:49'),(165,'XnjK-wAAmr1_MhbmsTZY7DeqVMEqt2Tz','{\"userid\":\"test\"}','2020-03-23 07:43:07','2020-03-23 07:43:07'),(167,'XnjqZwAAmr1VHVSFiFLhLsWuz8jEV7KB','{\"userid\":\"test\"}','2020-03-23 09:57:11','2020-03-23 09:57:11'),(169,'Xnjx4QAAmr11aMbdelRnO9WP18Uq8EFd','{\"userid\":\"test\"}','2020-03-23 10:29:05','2020-03-23 10:29:05'),(171,'XnkF8AABd5NC_NpzhXI_iaSo5PtpaQ0C','{\"userid\":\"test\"}','2020-03-23 11:54:40','2020-03-23 11:54:40'),(173,'Xnlx0wAAFQw937oXqzs0GVPhDsbYO-Kc','{\"userid\":\"test\"}','2020-03-23 19:34:59','2020-03-23 19:34:59'),(175,'XnocAgAAlRPm7YbSJbfBvfEEZBaZ3zC0','{\"userid\":\"test\"}','2020-03-24 07:41:06','2020-03-24 07:41:06'),(177,'Xno49AAAlRNQ1rjGFuYnhj-6_1yWZNl8','{\"userid\":\"test\"}','2020-03-24 09:44:36','2020-03-24 09:44:36'),(179,'XnpWAQAAlRPZLRykAtX4L4LFqmwvGcAo','{\"userid\":\"test\"}','2020-03-24 11:48:33','2020-03-24 11:48:33'),(181,'Xnpr7wAAuzxEWZfHuC1A9TYIG7IXadvT','{\"userid\":\"test\"}','2020-03-24 13:22:07','2020-03-24 13:22:07'),(183,'Xnp-KgAAuzwhq-VYlf3MQtCFomJzHEIF','{\"userid\":\"test\"}','2020-03-24 14:39:54','2020-03-24 14:39:54'),(185,'XnqR7wAAuzypC5ndTLEfqk8s3ZSqQfhO','{\"userid\":\"test\"}','2020-03-24 16:04:15','2020-03-24 16:04:15'),(187,'Xnq3KAAAuzzKFtlawEJZzqowFKs3gKxd','{\"userid\":\"test\"}','2020-03-24 18:43:04','2020-03-24 18:43:04'),(189,'XntplQAAuzzr5kuNUJ7mn0yoqc8awKKQ','{\"userid\":\"test\"}','2020-03-25 07:24:21','2020-03-25 07:24:21'),(191,'Xnt4BgAAuzzYvE2NIkhWoEhdqQmX-7Wd','{\"userid\":\"test\"}','2020-03-25 08:25:58','2020-03-25 08:25:58'),(193,'XnutSQABcbP9ks7RkYvg8I-LN-RA7rKi','{\"userid\":\"test\"}','2020-03-25 12:13:13','2020-03-25 12:13:13'),(195,'XnzHXQABcbPg_mfuE2_OchSoXJhEwUJe','{\"userid\":\"test\"}','2020-03-26 08:16:45','2020-03-26 08:16:45'),(197,'XnzPNAABcbNDJ-8IPaU83wcSvc_epVMS','{\"userid\":\"test\"}','2020-03-26 08:50:12','2020-03-26 08:50:12'),(199,'XnzZMQABcbM37JSIss22k5Sj7LN-CMpV','{\"userid\":\"test\"}','2020-03-26 09:32:49','2020-03-26 09:32:49'),(201,'XnzkQgABcbMsc6K_c8eYu_v4PhJc0bMm','{\"userid\":\"test\"}','2020-03-26 10:20:02','2020-03-26 10:20:02'),(203,'Xnzp4QABcbNbGuiVTlSOYvsMa7Ti-Ju2','{\"userid\":\"test\"}','2020-03-26 10:44:01','2020-03-26 10:44:01'),(205,'Xn0AJwABcbPJpdgIBgUBuV1HjbDqeumR','{\"userid\":\"test\"}','2020-03-26 12:19:03','2020-03-26 12:19:03'),(207,'Xn0HZAABcbM0Lsmia1Wx5HjglZOuf9Tr','{\"userid\":\"test\"}','2020-03-26 12:49:56','2020-03-26 12:49:56'),(209,'Xn09YwABOC_Mo8DyJEyI7gDeb99Oi91N','{\"userid\":\"test\"}','2020-03-26 16:40:19','2020-03-26 16:40:19'),(211,'Xn4S9gABQG423C2D97leqLq5Op1fBW4I','{\"userid\":\"test\"}','2020-03-27 07:51:34','2020-03-27 07:51:34'),(213,'Xn4uGQAAPU0jo6gdvJtWuFIplMLZn4WP','{\"userid\":\"test\"}','2020-03-27 09:47:21','2020-03-27 09:47:21'),(215,'Xn422wAAPU2sWoRXjM_5Px45RXBD-bWV','{\"userid\":\"test\"}','2020-03-27 10:24:43','2020-03-27 10:24:43'),(217,'Xn5BAAAAPU1fSO1wA5C63gbBCo6KOl2B','{\"userid\":\"test\"}','2020-03-27 11:08:00','2020-03-27 11:08:00'),(219,'Xn5VvAAAPU27iym0ObRJl81zuCJlRrw6','{\"userid\":\"test\"}','2020-03-27 12:36:28','2020-03-27 12:36:28'),(221,'Xn5b0gAAPU3SOYovDFchjVd0agh8vfF5','{\"userid\":\"test\"}','2020-03-27 13:02:26','2020-03-27 13:02:26'),(223,'Xn5vVAAAPU0xf2Nc-7_GbD62oEhxcm3_','{\"userid\":\"test\"}','2020-03-27 14:25:40','2020-03-27 14:25:40'),(225,'Xn56TAAAPU0kbtXlAj1Rzg_1tqAP_fzP','{\"userid\":\"test\"}','2020-03-27 15:12:28','2020-03-27 15:12:28'),(227,'XoHzogAAPU3kuL9Ad3GcrGPtv128qqv0','{\"userid\":\"test\"}','2020-03-30 06:26:58','2020-03-30 06:26:58'),(229,'XoILFwAAF8JXs5szZa5fUFsNWzncF1b6','{\"userid\":\"test\"}','2020-03-30 08:07:03','2020-03-30 08:07:03'),(231,'XoIMzgAA4y4qfTyH6Qw4XuNBu22mQAEr','{\"userid\":\"test\"}','2020-03-30 08:14:22','2020-03-30 08:14:22'),(233,'XoJD1gAAx9pJnV4BhhiLdzBOeRdIQ5Zo','{\"userid\":\"test\"}','2020-03-30 12:09:10','2020-03-30 12:09:10'),(235,'XoJcXAABIAP_PV_l7G4P_UP_bPZK4m-K','{\"userid\":\"test\"}','2020-03-30 13:53:48','2020-03-30 13:53:48'),(237,'XoJqqgABIAMRn1i6nVdmqPsX2Hs3F9wa','{\"userid\":\"test\"}','2020-03-30 14:54:50','2020-03-30 14:54:50'),(239,'XoNalAABIAOFn5FAcUefvHQwzv-q0RtS','{\"userid\":\"test\"}','2020-03-31 07:58:28','2020-03-31 07:58:28'),(241,'XoNdNgABIAP7kzjHz6LRWmzMNuuEM0uJ','{\"userid\":\"test\"}','2020-03-31 08:09:42','2020-03-31 08:09:42'),(243,'XoNnQwABTBzyVJWEdkpRX0irVL62GhEK','{\"userid\":\"test\"}','2020-03-31 08:52:35','2020-03-31 08:52:35'),(245,'XoN49gABTBzvt5Rhgl0QUU9-Bm4UHZJg','{\"userid\":\"test\"}','2020-03-31 10:08:06','2020-03-31 10:08:06'),(247,'XoODcwABTBwH_A4RaGZNYaVjFnCwwrXP','{\"userid\":\"test\"}','2020-03-31 10:52:51','2020-03-31 10:52:51'),(249,'XoOc0QAA-AxvEp--d-QNSK1aBp76bPN0','{\"userid\":\"test\"}','2020-03-31 12:41:06','2020-03-31 12:41:06'),(251,'XoOtSAAA-AzZL0RiNx05QaKmYH7Nq5zv','{\"userid\":\"test\"}','2020-03-31 13:51:20','2020-03-31 13:51:20'),(253,'XoOyGQAA-AzwcuDP-Ge5lBOQ93a9GiN2','{\"userid\":\"test\"}','2020-03-31 14:11:53','2020-03-31 14:11:53'),(255,'XoO8xwAA-AwMEWdkVVwgTgV951sss5EQ','{\"userid\":\"test\"}','2020-03-31 14:57:27','2020-03-31 14:57:27'),(257,'XoSw7QAA-Ay8tU8Z5RkLmDMkgKaXNFpp','{\"userid\":\"test\"}','2020-04-01 08:19:09','2020-04-01 08:19:09'),(259,'XoS4lwAAug4yGbqMFi0Z9MrTPMwxdhd2','{\"userid\":\"test\"}','2020-04-01 08:51:51','2020-04-01 08:51:51'),(261,'XoTBHwAAug5Xqu_vu_702ChMEF9-bir1','{\"userid\":\"test\"}','2020-04-01 09:28:15','2020-04-01 09:28:15'),(263,'XoTIxgAAug7PZZfDQVBZYIskdALNMZZJ','{\"userid\":\"test\"}','2020-04-01 10:00:54','2020-04-01 10:00:54'),(265,'XoT-fwAAkPHtbtgo9HO2Y-w2pwIGMT63','{\"userid\":\"test\"}','2020-04-01 13:51:05','2020-04-01 13:51:18'),(267,'XoUGgwAAkPEVPV6Ka-MBs1_78Ou3TTNb','{\"userid\":\"test\"}','2020-04-01 14:24:19','2020-04-01 14:24:20'),(269,'XoUMQQAAkPGSpRI4lr8M_AGinslYK_aG','{\"userid\":\"test\"}','2020-04-01 14:48:49','2020-04-01 14:48:50'),(271,'XoUUgwABF3AW55H0OToPXPt7q9dhcQd9','{\"userid\":\"test\"}','2020-04-01 15:24:03','2020-04-01 15:24:03'),(273,'XoUUgwABF3Aw_YNjksyUXuP0DukXgnL_','{\"userid\":\"test\"}','2020-04-01 15:24:03','2020-04-01 15:24:03'),(275,'XoX_bwABGzEqyhN7Y7VF2eip6_D-QD46','{\"userid\":\"test\"}','2020-04-02 08:06:23','2020-04-02 08:06:23'),(277,'XoYK8wABGzF9XXATbcDHg-A-8UR274h9','{\"userid\":\"test\"}','2020-04-02 08:55:31','2020-04-02 08:55:31'),(279,'XoYcWwABGzGZuWMx-tH2PC5FXA-G22X7','{\"userid\":\"test\"}','2020-04-02 10:09:47','2020-04-02 10:09:47'),(281,'XoYnQQABGzG2ETECNho6LOQYxVEKrvti','{\"userid\":\"test\"}','2020-04-02 10:56:17','2020-04-02 10:56:17'),(283,'XoZCHAABGzGL96SrehjVjFaRySVu_su9','{\"userid\":\"test\"}','2020-04-02 12:50:52','2020-04-02 12:50:52'),(285,'XoZQIwABGzE1VFDiHP1eDLJmq3vbH7Ja','{\"userid\":\"test\"}','2020-04-02 13:50:43','2020-04-02 13:50:43'),(287,'XoZyQgABGzG9b_LqjqCFxsoZI9xG9ZLl','{\"userid\":\"test\"}','2020-04-02 16:16:18','2020-04-02 16:16:18'),(289,'XodKQQAATFT_dqR9-G0TCHzNee2p8aw-','{\"userid\":\"test\"}','2020-04-03 07:37:53','2020-04-03 07:37:53'),(291,'XodNWQAATFTangK0Qxt3d8A7gVoA8Ekc','{\"userid\":\"test\"}','2020-04-03 07:51:05','2020-04-03 07:51:05'),(293,'XodVeQAATFS8aa4d9btE3MQxN2EIc1r1','{\"userid\":\"test\"}','2020-04-03 08:25:45','2020-04-03 08:25:45'),(295,'XodfZAAATFSZWInmSXoiqKuFUdRVKmCt','{\"userid\":\"test\"}','2020-04-03 09:08:04','2020-04-03 09:08:04'),(297,'Xodo2wAATFRn44d5MJ1RTvW7CSctgdHS','{\"userid\":\"test\"}','2020-04-03 09:48:27','2020-04-03 09:48:27'),(299,'XodpKwAATFR-5NaQci9ys3uRB4K1v0qS','{\"userid\":\"test\"}','2020-04-03 09:49:47','2020-04-03 09:49:47'),(301,'Xod6ywAATFS6repRnSMgtsGq9ofhT26V','{\"userid\":\"test\"}','2020-04-03 11:04:59','2020-04-03 11:04:59'),(303,'Xoek_QAAqNc5s0l6k6Z-uNjpqWnsmVO4','{\"userid\":\"test\"}','2020-04-03 14:05:01','2020-04-03 14:05:01'),(305,'XotFRgAABoNP86Hn3nXkvF9tmO1cMYnC','{\"userid\":\"test\"}','2020-04-06 08:05:42','2020-04-06 08:05:42'),(307,'Xot0LAAABoMLtQPmFY9y8QxoQYss-ev5','{\"userid\":\"test\"}','2020-04-06 11:25:49','2020-04-06 11:25:49'),(309,'XouKNQAABoOT9-eG26Vv4kbVaSMIfjZ-','{\"userid\":\"test\"}','2020-04-06 12:59:49','2020-04-06 12:59:49'),(311,'XoubkQAABoPTdSthMQ4Fm_E_ZbMXe1-U','{\"userid\":\"test\"}','2020-04-06 14:13:53','2020-04-06 14:13:53'),(313,'XouffwAABoOinjarYbg0Hrk8nzPGfHo9','{\"userid\":\"test\"}','2020-04-06 14:30:39','2020-04-06 14:30:39'),(315,'Xou_MwAAZ6JUGFV_pOkeM4euqxcFu8XU','{\"userid\":\"test\"}','2020-04-06 16:45:55','2020-04-06 16:45:55'),(317,'Xou_NAAAZ6IJvXiIUR9Ql0IdZzTa59KM','{\"userid\":\"test\"}','2020-04-06 16:45:56','2020-04-06 16:45:56'),(319,'Xou_NAAAZ6InEKD06ZYjalOo6zetA5yp','{\"userid\":\"test\"}','2020-04-06 16:45:56','2020-04-06 16:45:56'),(321,'Xou_NAAAZ6JXfaAZ_X2elWh2Ty3CwZXx','{\"userid\":\"test\"}','2020-04-06 16:45:56','2020-04-06 16:45:56'),(323,'Xou_NAAAZ6KRjEzCushV9_cdFirx9ba8','{\"userid\":\"test\"}','2020-04-06 16:45:56','2020-04-06 16:45:56'),(325,'XoyoHAAAZ6Ke-MFyvGptG9MU1QQLvvv6','{\"userid\":\"test\"}','2020-04-07 09:19:40','2020-04-07 09:19:40'),(327,'Xoy5MAABRFzRL6xiabsG8waglqLkkkEM','{\"userid\":\"test\"}','2020-04-07 10:32:32','2020-04-07 10:32:32'),(329,'XozQQgABRFyl4WZk4P4yd_JK6NSGuxWC','{\"userid\":\"test\"}','2020-04-07 12:10:58','2020-04-07 12:10:58'),(331,'Xozr-gABd-0oKlpLjS6ojxMbncrnfPC9','{\"userid\":\"test\"}','2020-04-07 14:09:14','2020-04-07 14:09:14'),(333,'Xozr-gABd-2NRWrfQEY5y8c7S053-TGe','{\"userid\":\"test\"}','2020-04-07 14:09:14','2020-04-07 14:09:14'),(335,'Xozr-gABd-33FhQTdXjZdBIfiGWIdD9T','{\"userid\":\"test\"}','2020-04-07 14:09:14','2020-04-07 14:09:14'),(337,'Xo3sqQABd-1wxERxrbP8ABfSLjHhoIS4','{\"userid\":\"test\"}','2020-04-08 08:24:27','2020-04-08 08:24:27'),(339,'Xo3uqQABd-0do5QrMG78QQ-EBOamTZy8','{\"userid\":\"test\"}','2020-04-08 08:32:57','2020-04-08 08:32:57'),(341,'Xo39AAABCEvV704K9KeLhBmIETrm-Yak','{\"userid\":\"test\"}','2020-04-08 09:34:08','2020-04-08 09:34:08'),(343,'Xo39MQABFQZCU4-wm6yYdvUq0FuwwD39','{\"userid\":\"test\"}','2020-04-08 09:34:58','2020-04-08 09:34:58'),(345,'Xo4FJgABFQatP-JpQrBvg0VmLtZ3YaAz','{\"userid\":\"test\"}','2020-04-08 10:08:54','2020-04-08 10:08:54'),(347,'Xo4cAQABJZndK2-oBiSYOwk-9bq0G4I_','{\"userid\":\"test\"}','2020-04-08 11:46:25','2020-04-08 11:46:25'),(349,'Xo4cAQABJZnVO6569B-XKPu7ENXH03YQ','{\"userid\":\"test\"}','2020-04-08 11:46:25','2020-04-08 11:46:25'),(351,'Xo4rZwABJZnQFAKNW6ifl1BdDRqkKfIB','{\"userid\":\"test\"}','2020-04-08 12:52:07','2020-04-08 12:52:07'),(353,'Xo5FPgABJZkKUBPj8xBPlx34idsQDKLR','{\"userid\":\"test\"}','2020-04-08 14:42:22','2020-04-08 14:42:22'),(355,'Xo9GqQABJZkXEnHiA_zieGKZR2PNy_UT','{\"userid\":\"test\"}','2020-04-09 09:00:42','2020-04-09 09:00:42'),(357,'Xo9SqgAAvlzgGfTUN3SJTDg11dWJVpFt','{\"userid\":\"test\"}','2020-04-09 09:51:54','2020-04-09 09:51:54'),(359,'Xo9SqgAAvlwdmURt_w2Wk2_je7AGaDRe','{\"userid\":\"test\"}','2020-04-09 09:51:54','2020-04-09 09:51:54'),(361,'Xo9SqgAAvly0IrHFgP-ymlaCMNc21kqA','{\"userid\":\"test\"}','2020-04-09 09:51:54','2020-04-09 09:51:54'),(363,'Xo9d3QAAvlyeN-ydGDpq5daT5GG-rebG','{\"userid\":\"test\"}','2020-04-09 10:39:41','2020-04-09 10:39:41'),(365,'Xo9vKwAAvlyM-L-0kasvis5LiUo7Rkvs','{\"userid\":\"test\"}','2020-04-09 11:53:31','2020-04-09 11:53:31'),(367,'Xo-HvQAAvlx8NcP5fjosvholwBtlTlzY','{\"userid\":\"test\"}','2020-04-09 13:38:21','2020-04-09 13:38:21'),(369,'Xo-R1wAAvlyBuRDlXqUN6js8ygmqBLBc','{\"userid\":\"test\"}','2020-04-09 14:21:27','2020-04-09 14:21:27'),(371,'Xo-wLQABHO7Wofwih26Ve4EQ4lxeYrlT','{\"userid\":\"test\"}','2020-04-09 16:30:53','2020-04-09 16:30:53'),(373,'Xo_UEQABHO5lyTRLSz_7mE_NqBpahRFF','{\"userid\":\"test\"}','2020-04-09 19:04:01','2020-04-09 19:04:01'),(375,'Xo_jLAABHO7rxXOvw2YuA_axxgN_Asw2','{\"userid\":\"test\"}','2020-04-09 20:08:29','2020-04-09 20:08:29'),(377,'XpCMiAAAIrEYTlj4f6NeNDWADo-xm0VN','{\"userid\":\"test\"}','2020-04-10 08:11:04','2020-04-10 08:11:04'),(379,'XpCaIgAAIrFVPj7t5Yf3C1yvj53tnhLI','{\"userid\":\"test\"}','2020-04-10 09:09:06','2020-04-10 09:09:06'),(381,'XpCriwAAMBiOn7uYy1u-GODDPD-Qk3we','{\"userid\":\"test\"}','2020-04-10 10:23:23','2020-04-10 10:23:23'),(383,'XpC1fgAAMBh6f7DDyDtsGYXgvruHe3Ab','{\"userid\":\"test\"}','2020-04-10 11:05:50','2020-04-10 11:05:50'),(385,'XpDGqgAAMBhfsuFjkuxwibZ6f65_QEGm','{\"userid\":\"test\"}','2020-04-10 12:19:06','2020-04-10 12:19:06'),(387,'XpDjuAAAMBh7c5QLFe9lmvSRrim9--iG','{\"userid\":\"test\"}','2020-04-10 14:23:04','2020-04-10 14:23:04'),(389,'XpEAHQAAMBhECY_DQURwjTOU_cZx9GBj','{\"userid\":\"test\"}','2020-04-10 16:24:13','2020-04-10 16:24:13'),(391,'XpSL9AAATVw6qFg_d_fsUYwaep2ju-S3','{\"userid\":\"test\"}','2020-04-13 08:57:40','2020-04-13 08:57:40'),(393,'XpSc6gAAUfQJLNyQsR7UX3G00vxaCtV-','{\"userid\":\"test\"}','2020-04-13 10:10:02','2020-04-13 10:10:02'),(395,'XpSt-wAAUfQ_l5O9jH-_oZxTcwFfATFD','{\"userid\":\"test\"}','2020-04-13 11:22:51','2020-04-13 11:22:51'),(397,'XpS5GwAAUfQxzOpd8vWC-KF8-IyDuAIR','{\"userid\":\"test\"}','2020-04-13 12:10:19','2020-04-13 12:10:19'),(399,'XpXXWAAAUfSviTSAc8D1Jz1kPyjfxDT8','{\"userid\":\"test\"}','2020-04-14 08:31:36','2020-04-14 08:31:36'),(401,'XpXf3gAAUfRMUjHezHZdQGUtYZnCaiAC','{\"userid\":\"test\"}','2020-04-14 09:07:58','2020-04-14 09:07:58'),(403,'XpX0bAAAUfSCTUAEDpiqTfE6wrfzZQCK','{\"userid\":\"test\"}','2020-04-14 10:35:40','2020-04-14 10:35:40'),(405,'XpYTQQAAJV7YcYApctqDhG3R2__3Noie','{\"userid\":\"test\"}','2020-04-14 12:47:13','2020-04-14 12:47:13'),(407,'XpZIvwAAJV5ZMyOqUJqZCCKU3_K8SldL','{\"userid\":\"test\"}','2020-04-14 16:35:27','2020-04-14 16:35:27'),(409,'Xpck5AABEE0tgtmPZ44kJgazSM5RpRAC','{\"userid\":\"test\"}','2020-04-15 08:14:44','2020-04-15 08:14:44'),(411,'XpcydwABHYvejEDzdSVBJ0win6EXC98N','{\"userid\":\"test\"}','2020-04-15 09:12:40','2020-04-15 09:12:40'),(413,'Xpc1wgABIPb-sFg0NHMrVAmImXCBa3zu','{\"userid\":\"test\"}','2020-04-15 09:26:42','2020-04-15 09:26:42'),(415,'Xpc5XwABIPZlkuhopPKRQdK_9FnI16LR','{\"userid\":\"test\"}','2020-04-15 09:42:07','2020-04-15 09:42:07'),(417,'Xpd1XwABKkv4vDqRuA1DCg-UIXRK6CTD','{\"userid\":\"test\"}','2020-04-15 13:58:07','2020-04-15 13:58:07'),(419,'XpeAjwABYOfcgVTxrXQoAbYAlGhvyg4X','{\"userid\":\"test\"}','2020-04-15 14:45:51','2020-04-15 14:45:51'),(421,'XpeAswABYOdI-5jXs6G2vx_j_rAom3Oo','{\"userid\":\"test\"}','2020-04-15 14:46:27','2020-04-15 14:46:27'),(423,'XpeLpAABYOfqZ_nw4nLvF9Uy0qTx3KzQ','{\"userid\":\"test\"}','2020-04-15 15:33:08','2020-04-15 15:33:08'),(425,'XpepZgABYOdG4_vzH_0G0D7i0NDxtc6D','{\"userid\":\"test\"}','2020-04-15 17:40:06','2020-04-15 17:40:06'),(427,'Xpe9TgABYOcg6K2As5IEC8fOpz4rOrph','{\"userid\":\"test\"}','2020-04-15 19:05:02','2020-04-15 19:05:02'),(429,'XpfTGAABYOdxDV5TMyyNmVMzP83F4or2','{\"userid\":\"test\"}','2020-04-15 20:38:00','2020-04-15 20:38:00'),(431,'XpiG7QABYOe1FAHZqxFWTLsXQBw6Ymix','{\"userid\":\"test\"}','2020-04-16 09:25:18','2020-04-16 09:25:18'),(433,'Xpij9wAA3Ck4iCNnpbzUrRj2kAQYHKM1','{\"userid\":\"test\"}','2020-04-16 11:29:11','2020-04-16 11:29:11'),(435,'Xpi43QAA3Cnv6PYfjFFN33XiiTWdbM84','{\"userid\":\"test\"}','2020-04-16 12:58:21','2020-04-16 12:58:21'),(437,'XpjtJQABD8Wmmqh_XjUZYVLvWuMkzvJw','{\"userid\":\"test\"}','2020-04-16 16:41:25','2020-04-16 16:41:25'),(439,'XpnGvwAAVy2g2NlzKoahvdsXk-Ta8hHm','{\"userid\":\"test\"}','2020-04-17 08:09:52','2020-04-17 08:09:52'),(441,'XpnHjAAAVy2HMeBS8rWRlwR7rqZKga4Z','{\"userid\":\"test\"}','2020-04-17 08:13:16','2020-04-17 08:13:16'),(443,'XpnzkwAAaUMlrw_L65UcPgROjkbobbGD','{\"userid\":\"test\"}','2020-04-17 11:21:07','2020-04-17 11:21:07'),(445,'XpoJ5AAAaUN49IEecDFAdt-zsnC-COno','{\"userid\":\"test\"}','2020-04-17 12:56:20','2020-04-17 12:56:20'),(447,'XpogbgAAaUNYKt6ikILqpl64ZNOrBDaT','{\"userid\":\"test\"}','2020-04-17 14:32:30','2020-04-17 14:32:30'),(449,'XpogegAAaUPQ6Xk3HrDvyemORW-ZMoWZ','{\"userid\":\"test\"}','2020-04-17 14:32:42','2020-04-17 14:32:42'),(451,'XpopvwAAtlVr78PZ7esn-r-PGHtfBF2c','{\"userid\":\"test\"}','2020-04-17 15:12:16','2020-04-17 15:12:16'),(453,'XpqCOwAAtlVpyCLGzxBaR8bK7zXlOByl','{\"userid\":\"test\"}','2020-04-17 21:29:48','2020-04-17 21:29:48'),(455,'Xp3G9QAAgvVbUOpCF29ILCmFPVtwPMLf','{\"userid\":\"test\"}','2020-04-20 08:59:49','2020-04-20 08:59:49'),(457,'Xp3_mwAAgvUu9FnEDVSldYW3p4rhIu_z','{\"userid\":\"test\"}','2020-04-20 13:01:31','2020-04-20 13:01:31'),(459,'Xp8IyQAAgvWBuT66-BTlzabnRNXZDuHJ','{\"userid\":\"test\"}','2020-04-21 07:52:59','2020-04-21 07:52:59'),(461,'Xp85AAAAMWPykjaFZJPxfeBQ2UG_iYPF','{\"userid\":\"test\"}','2020-04-21 11:18:40','2020-04-21 11:18:40'),(463,'Xp9K8wAAWEzycPqaiULSzrX5Y7_bbTia','{\"userid\":\"test\"}','2020-04-21 12:35:16','2020-04-21 12:35:16'),(465,'XqBXSQABSdvuGAKzATUW6JTj-5tBuS11','{\"userid\":\"test\"}','2020-04-22 07:40:10','2020-04-22 07:40:10'),(467,'XqBrAgABSdt5pRNrgy-Q5Ccc6W2Oi83h','{\"userid\":\"test\"}','2020-04-22 09:04:18','2020-04-22 09:04:18'),(469,'XqB5JwABSdsfjsx-vEWRuzBfo2dLrTF7','{\"userid\":\"test\"}','2020-04-22 10:04:39','2020-04-22 10:04:39'),(471,'XqCf5gABSdtom7EAvvsFmT9OI5uTeuOw','{\"userid\":\"test\"}','2020-04-22 12:49:58','2020-04-22 12:49:58'),(473,'XqCoDwABSdvapDHUQz9TsJmN0I_7DPzj','{\"userid\":\"test\"}','2020-04-22 13:24:47','2020-04-22 13:24:47'),(475,'XqGv6QAA-pA0A7z0ogvqg8CQeZltOyFd','{\"userid\":\"test\"}','2020-04-23 08:10:33','2020-04-23 08:10:33'),(477,'XqGx6gAA-zJt9d45GoVGm_ta1RRD9pXf','{\"userid\":\"test\"}','2020-04-23 08:19:06','2020-04-23 08:19:06'),(479,'XqG5KwABAZCL_gM8otN1x8fD0-hpOFGb','{\"userid\":\"test\"}','2020-04-23 08:50:03','2020-04-23 08:50:03'),(481,'XqG-yQABBMS9fCqYKyHzOGZQiXQLhPvL','{\"userid\":\"test\"}','2020-04-23 09:14:01','2020-04-23 09:14:01'),(483,'XqHD6wABBMSk2K2EMYaFSKO-W2fcGwPN','{\"userid\":\"test\"}','2020-04-23 09:35:55','2020-04-23 09:35:55'),(485,'XqH_HQABBMSM-lu0Ge020RTh7Kj3Sc_X','{\"userid\":\"test\"}','2020-04-23 13:48:29','2020-04-23 13:48:29'),(487,'XqIWqQABThf0XHHprq9UHBFQn9NOGF97','{\"userid\":\"test\"}','2020-04-23 15:28:57','2020-04-23 15:28:57'),(489,'XqMDUwAAorcqZPMNOXkp4eTCWgkXlxiy','{\"userid\":\"test\"}','2020-04-24 08:18:43','2020-04-24 08:18:43'),(491,'XqMESgABThekymqzUd0EVA2TLRmeyU6k','{\"userid\":\"test\"}','2020-04-24 08:22:51','2020-04-24 08:22:51'),(493,'XqMaNwAAqKGL6g91-icemUvCS-mSi8f1','{\"userid\":\"test\"}','2020-04-24 09:56:23','2020-04-24 09:56:24'),(495,'XqMpLgAAqKEXoce_hE6cT3K1sHjH8XrR','{\"userid\":\"test\"}','2020-04-24 11:00:15','2020-04-24 11:00:15'),(497,'XqNI0AAAqKED0YCv7o691GKoXCxKuaIV','{\"userid\":\"test\"}','2020-04-24 13:15:12','2020-04-24 13:15:13'),(499,'XqOTuwAAqKFCQuzUdx-uaPEwsbNA9sFg','{\"userid\":\"test\"}','2020-04-24 18:34:51','2020-04-24 18:34:51'),(501,'Xqb-HwAAqKHOMZonEunV4YH-tUlj7nU9','{\"userid\":\"test\"}','2020-04-27 08:45:36','2020-04-27 08:45:36'),(503,'XqcCkQAAygwveeDzw2SwFldpd3JUI12N','{\"userid\":\"test\"}','2020-04-27 09:04:33','2020-04-27 09:04:33'),(505,'XqcPyAAAygym4kgj_8PKGgtDJRskBkVR','{\"userid\":\"test\"}','2020-04-27 10:00:56','2020-04-27 10:00:56'),(507,'XqcbvAAAygwdIeN8HyvxG_6DK-CCgsy7','{\"userid\":\"test\"}','2020-04-27 10:51:56','2020-04-27 10:51:56'),(509,'XqcrHQAAygw2bsKQOkfHRdNItqu31TwE','{\"userid\":\"test\"}','2020-04-27 11:57:33','2020-04-27 11:57:33'),(511,'Xqcu3QAA9MnvuEsiFMqh570Yfi-_kNJi','{\"userid\":\"test\"}','2020-04-27 12:13:33','2020-04-27 12:13:33'),(513,'XqdHVwAA9Mla8FvHeXyA4I_ku42TaRSt','{\"userid\":\"test\"}','2020-04-27 13:57:59','2020-04-27 13:57:59'),(515,'XqdT1QAA9MlVRuvDGRW5SKkO2pNT5B7W','{\"userid\":\"test\"}','2020-04-27 14:51:17','2020-04-27 14:51:17'),(517,'XqdUaQAA9MkcAwSM1_9YCQeN9-MyWshA','{\"userid\":\"test\"}','2020-04-27 14:53:45','2020-04-27 14:53:45'),(519,'XqdUagAA9MniFzwwqZDVwcLYOHyua2Ie','{\"userid\":\"test\"}','2020-04-27 14:53:46','2020-04-27 14:53:46'),(521,'XqdUagAA9Mlth-4uVLiXY9jCE_6dtWQv','{\"userid\":\"test\"}','2020-04-27 14:53:46','2020-04-27 14:53:46'),(523,'XqdehAAA9MnneRcH55J6FnNpuMErvsOJ','{\"userid\":\"test\"}','2020-04-27 15:36:52','2020-04-27 15:36:52'),(525,'XqdljwAA9MkoqLKeYd8ySQufHvgDThD7','{\"userid\":\"test\"}','2020-04-27 16:06:55','2020-04-27 16:06:55'),(527,'XqdsAAAA9Ml5ohHw_iF2dlgF4a5bxEW-','{\"userid\":\"test\"}','2020-04-27 16:34:24','2020-04-27 16:34:24'),(529,'XqhW8AAA1EMxGG8sAuXMQvBE7iNzZxy6','{\"userid\":\"test\"}','2020-04-28 09:16:49','2020-04-28 09:16:49'),(531,'Xqh0MwAA6CeG-xIfcWD650U3fP7RFYc5','{\"userid\":\"test\"}','2020-04-28 11:21:39','2020-04-28 11:21:39'),(533,'Xqh6ygAA_we3qIy_Pwf4pbrKsrCWqiqO','{\"userid\":\"test\"}','2020-04-28 11:49:46','2020-04-28 11:49:46'),(535,'XqiJmAABBmJimyNNtvpfRO-TmgppjLta','{\"userid\":\"test\"}','2020-04-28 12:52:56','2020-04-28 12:52:56'),(537,'XqixDQABJftULa_OjSlOANpoq6WFwwPr','{\"userid\":\"test\"}','2020-04-28 15:41:17','2020-04-28 15:41:17'),(539,'XqmRgAABJfseDYsZQbSr51vqXpp9LJQ9','{\"userid\":\"test\"}','2020-04-29 07:38:56','2020-04-29 07:38:56'),(541,'XqmoFwAAkXe0GncmQmPzQ4gU1RwZWk7D','{\"userid\":\"test\"}','2020-04-29 09:15:19','2020-04-29 09:15:19'),(543,'XqnF5AAApcSqxJSwi8N0LL-jED5UGq1H','{\"userid\":\"test\"}','2020-04-29 11:22:28','2020-04-29 11:22:28'),(545,'XqnT1gAApcRrNFcwPDWW6fUL8Hm-0yaD','{\"userid\":\"test\"}','2020-04-29 12:21:58','2020-04-29 12:21:58'),(547,'XqoJtgAA-EeeSlsV7Mzilmg_YC35t0WP','{\"userid\":\"test\"}','2020-04-29 16:11:50','2020-04-29 16:11:50'),(549,'XqrzygAARmCq3Zp67H_o-0LZBksni8rK','{\"userid\":\"test\"}','2020-04-30 08:50:34','2020-04-30 08:50:34'),(551,'Xqr0NQAARmCPgal3etqZsClDo5XmAJL-','{\"userid\":\"test\"}','2020-04-30 08:52:21','2020-04-30 08:52:21'),(553,'XqsoPgAAfZSxyw9hXI-ad7WO9cRSf0F7','{\"userid\":\"test\"}','2020-04-30 12:34:22','2020-04-30 12:34:22'),(555,'XqtEMQAAmRHWzWnCNjkJy_XG3zHbgP_q','{\"userid\":\"test\"}','2020-04-30 14:33:37','2020-04-30 14:33:37'),(557,'XqtP8QAAm97NSAduG4IJZwVN7mdvDXdV','{\"userid\":\"test\"}','2020-04-30 15:23:45','2020-04-30 15:23:45'),(559,'Xqts9gAAt_4X45RJt3N4pXcjeZo-k73d','{\"userid\":\"test\"}','2020-04-30 17:27:34','2020-04-30 17:27:34'),(561,'XqxamgAAKtR8IoHswOfiu1vb8kXDy2T9','{\"userid\":\"test\"}','2020-05-01 10:21:31','2020-05-01 10:21:31'),(563,'Xqx7RgAAT9wxXAoAeVXxLrQMQXT3xNdH','{\"userid\":\"test\"}','2020-05-01 12:40:54','2020-05-01 12:40:54'),(565,'Xqx-fwAAT9z4CRjUNw9-m58vkUIZ5D2j','{\"userid\":\"test\"}','2020-05-01 12:54:39','2020-05-01 12:54:39'),(567,'XqyQJgAAXGrfnwegCIbAvd1qNeNXcQjf','{\"userid\":\"test\"}','2020-05-01 14:09:58','2020-05-01 14:09:58'),(569,'XqynwwAAbt3fdFGC3dXCY7e5oUGF9Tnl','{\"userid\":\"test\"}','2020-05-01 15:50:43','2020-05-01 15:50:43'),(571,'XrAviAABc3VMaZ6tRkktF9Ee7JikAMVp','{\"userid\":\"test\"}','2020-05-04 08:06:48','2020-05-04 08:06:48'),(573,'XrBRjQABc3WQSSEDLXPHyWritmV7kVAd','{\"userid\":\"test\"}','2020-05-04 10:31:57','2020-05-04 10:31:57'),(575,'XrBujgABc3UfCeeE7iZH3QInTxUCpdxt','{\"userid\":\"test\"}','2020-05-04 12:35:42','2020-05-04 12:35:42'),(577,'XrB4eQABc3WL5tM-atpuZNpNx8Psgtcl','{\"userid\":\"test\"}','2020-05-04 13:18:01','2020-05-04 13:18:01'),(579,'XrCMOQABc3W4xaOMRTArVaBMoLhANuAw','{\"userid\":\"test\"}','2020-05-04 14:42:17','2020-05-04 14:42:17'),(581,'XrCkzQABc3U8gm25ftySQzmqjEH5KvLi','{\"userid\":\"test\"}','2020-05-04 16:27:09','2020-05-04 16:27:09'),(583,'XrCmDwABc3Ugi7YdjH2VKU5DvDvuN9Ni','{\"userid\":\"test\"}','2020-05-04 16:32:31','2020-05-04 16:32:31'),(585,'XrCzXAAA3ndQUobrfBMZfYOxF9R67Mqe','{\"userid\":\"test\"}','2020-05-04 17:29:16','2020-05-04 17:29:16'),(587,'XrC7DQAA3ndeE8p4aQdrfd1afUQo4hyq','{\"userid\":\"test\"}','2020-05-04 18:02:05','2020-05-04 18:02:05'),(589,'XrDE_AAA_Kq5D8h1N6_T3VLQBIKhBX_-','{\"userid\":\"test\"}','2020-05-04 18:44:28','2020-05-04 18:44:28'),(591,'XrGAugAA_s2bjopjF7ZrINoXolU0gYx_','{\"userid\":\"test\"}','2020-05-05 08:05:31','2020-05-05 08:05:31'),(593,'XrGf7QAAw1l8vwSpJlDWfvlt69qojd0r','{\"userid\":\"test\"}','2020-05-05 10:18:37','2020-05-05 10:18:38'),(595,'XrHdPQABJHI7D-Of6GPNKz3kZsMsLWEH','{\"userid\":\"test\"}','2020-05-05 14:40:13','2020-05-05 14:40:13'),(597,'XrHnKgABJHKH3RKWJmdEyVReJcCN4-lj','{\"userid\":\"test\"}','2020-05-05 15:22:34','2020-05-05 15:22:34'),(599,'XrHxiAABJHJ-r6OBBfG5_1091XWfawRC','{\"userid\":\"test\"}','2020-05-05 16:06:48','2020-05-05 16:06:48'),(601,'XrHxiQABJHKsg6bk9qoa043gEuLHJgiX','{\"userid\":\"test\"}','2020-05-05 16:06:49','2020-05-05 16:06:49'),(603,'XrH6mgABJHKdSYPfQak8G47g3MOu77jJ','{\"userid\":\"test\"}','2020-05-05 16:45:30','2020-05-05 16:45:30'),(605,'XrLW7gABJHInrRq9hGRFDyFFmYD0AKiK','{\"userid\":\"test\"}','2020-05-06 08:25:35','2020-05-06 08:25:35'),(607,'XrLW7wABJHKkXgb7lGpcfrNBdyrbsSes','{\"userid\":\"test\"}','2020-05-06 08:25:35','2020-05-06 08:25:35'),(609,'XrLW7wABJHKOvcI_CEKsc-dBrP3tlMdW','{\"userid\":\"test\"}','2020-05-06 08:25:35','2020-05-06 08:25:35'),(611,'XrLW7wABJHL_KuT1S8bTGWvV00nMPvum','{\"userid\":\"test\"}','2020-05-06 08:25:35','2020-05-06 08:25:35'),(613,'XrLW7wABJHIAdqndbZXriA35QP6IEcU8','{\"userid\":\"test\"}','2020-05-06 08:25:35','2020-05-06 08:25:35'),(615,'XrLW7wABJHKg_IKk_luSILU41G_qZovs','{\"userid\":\"test\"}','2020-05-06 08:25:35','2020-05-06 08:25:35'),(617,'XrLelwABWXjfxVziFgidnQVWBCHp3p7h','{\"userid\":\"test\"}','2020-05-06 08:58:15','2020-05-06 08:58:15'),(619,'XrL-qQABWXhhFKMjKSvSeRccjWPFhoTL','{\"userid\":\"test\"}','2020-05-06 11:15:05','2020-05-06 11:15:05'),(621,'XrMdtgABWXhjFiaRAqdTtLCYV_CbppuO','{\"userid\":\"test\"}','2020-05-06 13:27:34','2020-05-06 13:27:34'),(623,'XrQsHgAANNr7mrfUQ8m6Hwqib9hooF5Z','{\"userid\":\"test\"}','2020-05-07 08:41:19','2020-05-07 08:41:20'),(625,'XrQ4qwAANNpRQTWtoCXv3sl_j7nDvNz2','{\"userid\":\"test\"}','2020-05-07 09:34:51','2020-05-07 09:34:51'),(627,'XrQ__QABUhQV4FPtmQEryC5sCq_dNZfw','{\"userid\":\"test\"}','2020-05-07 10:06:05','2020-05-07 10:06:05'),(629,'XrRJZAABUhRCP1Bf8aMC325swSLHp4s2','{\"userid\":\"test\"}','2020-05-07 10:46:12','2020-05-07 10:46:12'),(631,'XrRmsAABcWOf50LP-1x027y3tl05FmnB','{\"userid\":\"test\"}','2020-05-07 12:51:13','2020-05-07 12:51:13'),(633,'XrR3FgAAA4JEQhFSGaDstU9enfcFMKUp','{\"userid\":\"test\"}','2020-05-07 14:01:10','2020-05-07 14:01:10'),(635,'XrSKWgAAA4JIXsy29YNC46vlGL6_QDnP','{\"userid\":\"test\"}','2020-05-07 15:23:22','2020-05-07 15:23:22'),(637,'XrVm9wAAA4IUdncslWX31DEg3Tk2TlWa','{\"userid\":\"test\"}','2020-05-08 07:04:40','2020-05-08 07:04:40'),(639,'XrWHxwABAMs6wruj5GoVxLwy5qdJsfEI','{\"userid\":\"test\"}','2020-05-08 09:24:40','2020-05-08 09:24:40'),(641,'XrwiuQAAeAYr0Xr23qUp7h_DqLD47vZI','{\"userid\":\"test\"}','2020-05-13 09:39:22','2020-05-13 09:39:23'),(643,'XrwtDwAAeAbB1yu9uZ5gKF4j8P1kme9u','{\"userid\":\"test\"}','2020-05-13 10:23:27','2020-05-13 10:23:27'),(645,'XrxiMQAAeAbY9Gb4TuAAHDUt1xIpjQ9g','{\"userid\":\"test\"}','2020-05-13 14:10:30','2020-05-13 14:10:33'),(647,'XsMB4AAApyTto98X0Sm_GW-AER-N8xhR','{\"userid\":\"test\"}','2020-05-18 14:45:05','2020-05-18 14:45:05'),(649,'XsMEaAAApyTKAAA76hcRxBL-t__VlCsk','{\"userid\":\"test\"}','2020-05-18 14:55:52','2020-05-18 14:55:52'),(651,'XsPaJwAAarW0bNC8Z8cL_Oy-BaPVVEQ-','{\"userid\":\"test\"}','2020-05-19 06:07:51','2020-05-19 06:07:51'),(653,'XsP7qQAAbePMqSYPzMAGwPuEID1Zk7jX','{\"userid\":\"test\"}','2020-05-19 08:30:49','2020-05-19 08:30:49'),(655,'XsQw3QAAuwFKrCSHuB1CWxabAZIvsC9L','{\"userid\":\"test\"}','2020-05-19 12:18:18','2020-05-19 12:18:21'),(657,'XsQw_gAAuwGJSHDPoxPmG9rw-Ebx8umN','{\"userid\":\"test\"}','2020-05-19 12:18:22','2020-05-19 12:18:22'),(659,'XsRSmQAA8EWIOC3LXCWuKG9nKRgFkfR2','{\"userid\":\"test\"}','2020-05-19 14:41:45','2020-05-19 14:41:46'),(661,'XsVCjAAAVfVlSO83mUw8K-VZss6QJy62','{\"userid\":\"test\"}','2020-05-20 07:45:33','2020-05-20 07:45:33'),(663,'XsVJeAAAuwGnZ9GSD0xyIXX8ZHXPatlw','{\"userid\":\"test\"}','2020-05-20 08:15:04','2020-05-20 08:15:04'),(665,'XsVPHQAAVfUaHlXxnRt7A3QrJ_dT1tPX','{\"userid\":\"test\"}','2020-05-20 08:39:09','2020-05-20 08:39:09'),(667,'XsVPHQAAVfXy07LUpKTQHUD4gHF55wt7','{\"userid\":\"test\"}','2020-05-20 08:39:09','2020-05-20 08:39:09'),(669,'XsVSQgAAuwFQTAfHEPMu1n26GMXmUbqa','{\"userid\":\"test\"}','2020-05-20 08:52:34','2020-05-20 08:52:34'),(671,'XsVYDAAAZur6JB4FrPEY3CPVe3H0E4rl','{\"userid\":\"test\"}','2020-05-20 09:17:16','2020-05-20 09:17:16'),(673,'XsVYDAAAZuprJ9swKAnFGe4yMfkU2M5T','{\"userid\":\"test\"}','2020-05-20 09:17:16','2020-05-20 09:17:16'),(675,'XsVnQQAAereTOGJuLXtziKZc-V-aM0YL','{\"userid\":\"test\"}','2020-05-20 10:22:09','2020-05-20 10:22:09'),(677,'XsVu8QAAgxcRYMncnTvz1AQbL9yMTznD','{\"userid\":\"test\"}','2020-05-20 10:54:57','2020-05-20 10:54:57'),(679,'XsWBDwAAuwEWTVswLWszNBHZOnYqk9M_','{\"userid\":\"test\"}','2020-05-20 12:12:19','2020-05-20 12:12:20'),(681,'XsWJ1QAAuwHvD5oHJZ4zOURNJkzCXlsH','{\"userid\":\"test\"}','2020-05-20 12:49:41','2020-05-20 12:49:41'),(683,'XsWkiwAAuwHRSE2gRKbqKOMgo6sYlW16','{\"userid\":\"test\"}','2020-05-20 14:43:40','2020-05-20 14:43:40'),(685,'XsWkjQAAuwHNM5KpHPMtxTFzHaBin20O','{\"userid\":\"test\"}','2020-05-20 14:43:41','2020-05-20 14:43:41'),(687,'XsWkjQAAuwE3n0GKrSMD1DoZiokWDBEy','{\"userid\":\"test\"}','2020-05-20 14:43:41','2020-05-20 14:43:41'),(689,'XsbHKAAAZBBkOaTCbnzP9T05rxgSYxmA','{\"userid\":\"test\"}','2020-05-21 11:23:36','2020-05-21 11:23:36'),(691,'XsbgVgAAuwGFRQbrNT6ncfhoAHxoFfcr','{\"userid\":\"test\"}','2020-05-21 13:11:06','2020-05-21 13:11:06'),(693,'XsbgWgAAuwFo1F4zaLRaSwwAPbE_Mrux','{\"userid\":\"test\"}','2020-05-21 13:11:06','2020-05-21 13:11:06'),(695,'Xsbh-QAAuwHSBT2cfOwKJ-0GgPZ1Xe8s','{\"userid\":\"test\"}','2020-05-21 13:18:02','2020-05-21 13:18:02'),(697,'XsbqcQAAuwH7JAlnwDT6_NIR4sQmwMqq','{\"userid\":\"test\"}','2020-05-21 13:54:09','2020-05-21 13:54:09'),(699,'XscOowAAtb-a5yj3sHEdUN4hL41yRkZ6','{\"userid\":\"test\"}','2020-05-21 16:28:36','2020-05-21 16:28:36'),(701,'XsfcsQAAtb_u_wUdwcKNDZgZtyFKQMFA','{\"userid\":\"test\"}','2020-05-22 07:07:46','2020-05-22 07:07:46'),(703,'Xsfr-wABeJJpQMJvc_J6OyL9A7NhagvC','{\"userid\":\"test\"}','2020-05-22 08:12:59','2020-05-22 08:12:59'),(705,'Xsf6CgAAFi0qV3X7irZM9QcvWbC2XBPJ','{\"userid\":\"test\"}','2020-05-22 09:12:59','2020-05-22 09:12:59'),(707,'XsgLHAAAJBFiYz7yXiQbscsoGOiHjMbh','{\"userid\":\"test\"}','2020-05-22 10:25:49','2020-05-22 10:25:52'),(709,'Xsga7gAAJBGk3u8Ado62iqErRsUHNwKu','{\"userid\":\"test\"}','2020-05-22 11:33:19','2020-05-22 11:33:19'),(711,'XsgePwAAQlwvuO608pqteckiZSIyPjpw','{\"userid\":\"test\"}','2020-05-22 11:47:28','2020-05-22 11:47:29'),(713,'XsgusAAAUHPWMUuHi2HZga-ySENaYpnb','{\"userid\":\"test\"}','2020-05-22 12:57:36','2020-05-22 12:57:36'),(715,'XsgusAAAUHNqSkU6-887E8T5iHSkzLUj','{\"userid\":\"test\"}','2020-05-22 12:57:36','2020-05-22 12:57:36'),(717,'XshC1wAAUHN3pMPrGfkc1Ezbg6h_fVh4','{\"userid\":\"test\"}','2020-05-22 14:23:36','2020-05-22 14:23:36'),(719,'XshVqwAAUHMMZjMkTBCCSbqXaT_H5jJo','{\"userid\":\"test\"}','2020-05-22 15:43:56','2020-05-22 15:43:56'),(721,'XsvUKQAAUHOUNKwpMkyiFlla1rR4TuxT','{\"userid\":\"test\"}','2020-05-25 07:20:25','2020-05-25 07:20:26'),(723,'XsvaDAAAUHOQC6aAqlwvspIs2Wew9FwI','{\"userid\":\"test\"}','2020-05-25 07:45:32','2020-05-25 07:45:32'),(725,'XsvgEwAAlioNCcEBvs-ZUwMLyHQcp_DG','{\"userid\":\"test\"}','2020-05-25 08:11:15','2020-05-25 08:11:15'),(727,'Xsv_XwAAt33p1qFxZqgpFkX80Mhxvjip','{\"userid\":\"test\"}','2020-05-25 10:24:47','2020-05-25 10:24:47'),(729,'XswmNgAAxFniZgSfymuCCYg2DA0Pld39','{\"userid\":\"test\"}','2020-05-25 13:10:30','2020-05-25 13:10:30'),(731,'Xsw4YQABCJjjd0YPqicKyPix2rEF0Miy','{\"userid\":\"test\"}','2020-05-25 14:28:01','2020-05-25 14:28:01'),(733,'Xsw4nQABCJgJTGQi_IOftvvYsOsz2_k5','{\"userid\":\"test\"}','2020-05-25 14:29:01','2020-05-25 14:29:01');
/*!40000 ALTER TABLE `app_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `biz_branches`
--

LOCK TABLES `biz_branches` WRITE;
/*!40000 ALTER TABLE `biz_branches` DISABLE KEYS */;
INSERT INTO `biz_branches` VALUES (7,'CALIFORNIA HEAD QUARTERS',7,7,21,19,'info@uskoinc.com'),(15,'THE FAKE COMPANY',13,13,25,NULL,NULL),(73,'RANCHO',55,55,25,NULL,NULL),(77,'RANCHO DE KOPOBA',61,59,127,129,'info@uskoinc.com'),(85,'ANTELOPE',69,67,145,NULL,NULL),(87,'NORTH HIGHLANDS',71,69,147,NULL,NULL),(91,'XCBX',75,73,153,NULL,NULL),(93,'CARMICHEAL',71,75,155,NULL,NULL),(95,'ARDEN',71,77,157,NULL,NULL),(97,'FOLSOM',71,79,159,NULL,NULL),(99,'ELK GROVE',71,81,161,NULL,NULL),(101,'SOUTH SAC',71,83,163,NULL,NULL),(113,'ROSEVILLE',83,95,201,NULL,NULL),(115,'ROSEVILLE',83,99,201,NULL,NULL),(117,'RANCHO CORDOVA',69,101,203,NULL,NULL),(121,'GERBER',69,105,207,NULL,NULL),(125,'RANCHO CORDOVA',123,143,211,NULL,NULL),(127,'RANCHO CORDOVA',123,145,211,NULL,NULL),(155,'THE NEW COMPANY',13,171,217,NULL,NULL),(159,'THE BORING COMPANY',13,175,233,NULL,NULL),(161,'THE FUN COMPANY',13,177,235,NULL,NULL),(163,'RUSTIC',125,179,225,NULL,NULL),(183,'TEST2',11,13,243,NULL,NULL),(185,'VFDSFSDFSDF',11,13,245,NULL,NULL);
/*!40000 ALTER TABLE `biz_branches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `biz_company_nodes`
--

LOCK TABLES `biz_company_nodes` WRITE;
/*!40000 ALTER TABLE `biz_company_nodes` DISABLE KEYS */;
INSERT INTO `biz_company_nodes` VALUES (7,NULL,'Executive Office','Other',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `biz_company_nodes` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`192.168.1%.%`*/ /*!50003 TRIGGER `tms`.`biz_company_node_AFTER_INSERT` AFTER INSERT ON `biz_company_nodes` FOR EACH ROW
BEGIN
	INSERT INTO 
		biz_company_trees (AncestorId, DescendantId, Depth) 
    SELECT 
		AncestorId, NEW.NodeId, Depth + 1
	FROM 
		biz_company_trees
	WHERE 
		DescendantId = NEW.ParentId
	UNION ALL 
		SELECT 
			NEW.NodeId, NEW.NodeId, 0;
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
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`192.168.1%.%`*/ /*!50003 TRIGGER `tms`.`biz_company_node_BEFORE_UPDATE` BEFORE UPDATE ON `biz_company_nodes` FOR EACH ROW
BEGIN
	DELETE a FROM biz_company_trees AS a 
    JOIN biz_company_trees AS d 
		ON a.DescendantId = d.DescendantId
    LEFT JOIN biz_company_trees AS x 
		ON x.AncestorId = d.AncestorId 
		AND x.DescendantId = a.AncestorId 
    WHERE d.AncestorId = OLD.NodeId 
		AND x.AncestorId IS NULL;
               
	INSERT INTO biz_company_trees (AncestorId, DescendantId, Depth)
    SELECT 
		sup.AncestorId, sub.DescendantId, sup.Depth + sub.Depth + 1
	FROM 
		biz_company_trees sup JOIN biz_company_trees sub 
               
	WHERE 
		sub.AncestorId = OLD.NodeId
        AND sup.DescendantId = NEW.ParentId;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`192.168.1%.%`*/ /*!50003 TRIGGER `tms`.`biz_company_node_BEFORE_DELETE` BEFORE DELETE ON `biz_company_nodes` FOR EACH ROW
BEGIN
DELETE b FROM
			biz_company_trees a,
            biz_company_trees b
		WHERE 
			b.AncestorId = OLD.NodeId OR
            b.DescendantId = OLD.NodeId OR
            (a.AncestorId = OLD.NodeId AND a.DescendantId = b.DescendantId);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping data for table `biz_company_trees`
--

LOCK TABLES `biz_company_trees` WRITE;
/*!40000 ALTER TABLE `biz_company_trees` DISABLE KEYS */;
INSERT INTO `biz_company_trees` VALUES (7,7,7,0);
/*!40000 ALTER TABLE `biz_company_trees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `brk_loadstatus`
--

LOCK TABLES `brk_loadstatus` WRITE;
/*!40000 ALTER TABLE `brk_loadstatus` DISABLE KEYS */;
/*!40000 ALTER TABLE `brk_loadstatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `brk_statuslist`
--

LOCK TABLES `brk_statuslist` WRITE;
/*!40000 ALTER TABLE `brk_statuslist` DISABLE KEYS */;
/*!40000 ALTER TABLE `brk_statuslist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `cmm_assignments`
--

LOCK TABLES `cmm_assignments` WRITE;
/*!40000 ALTER TABLE `cmm_assignments` DISABLE KEYS */;
/*!40000 ALTER TABLE `cmm_assignments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `cmm_assignments_customers`
--

LOCK TABLES `cmm_assignments_customers` WRITE;
/*!40000 ALTER TABLE `cmm_assignments_customers` DISABLE KEYS */;
/*!40000 ALTER TABLE `cmm_assignments_customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `cmm_assignments_groups`
--

LOCK TABLES `cmm_assignments_groups` WRITE;
/*!40000 ALTER TABLE `cmm_assignments_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `cmm_assignments_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `cmm_package_tiers`
--

LOCK TABLES `cmm_package_tiers` WRITE;
/*!40000 ALTER TABLE `cmm_package_tiers` DISABLE KEYS */;
/*!40000 ALTER TABLE `cmm_package_tiers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `cmm_packages`
--

LOCK TABLES `cmm_packages` WRITE;
/*!40000 ALTER TABLE `cmm_packages` DISABLE KEYS */;
/*!40000 ALTER TABLE `cmm_packages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `cnt_addresses`
--

LOCK TABLES `cnt_addresses` WRITE;
/*!40000 ALTER TABLE `cnt_addresses` DISABLE KEYS */;
INSERT INTO `cnt_addresses` VALUES (7,'11290 POINT EAST DRIVE','STE 200','','RANCHO CORDOVA','CA','95742','United States',NULL,NULL,NULL,NULL),(11,'1234 FAKE STREET','','','SACRAMENTO','CA','95435','United States',NULL,NULL,NULL,NULL),(13,'1234 FAKE STREET','','','SACRAMENTO','CA','99999','United States',NULL,NULL,NULL,NULL),(15,'12345 NEW STREET','','','NEW CITY','CA','95646','United States',NULL,NULL,NULL,NULL),(55,'1234 FAKE STREET','','','SACRAMENTO','CA','95684','United States',NULL,NULL,NULL,NULL),(59,'1 PERFECTLY STRAIGHT CIRCLE','','','THE BEAUTIFUL ONE','CA','93721','United States',NULL,NULL,NULL,NULL),(63,'4320 ELVERTA RD','','','ANTELOPE','CA','95843','United States',NULL,NULL,NULL,NULL),(65,'5545 OIL DRIVE','','','FREEMONT','CA','93244','United States',NULL,NULL,NULL,NULL),(67,'1881 ANTELOPE WAY','','','ANTELOPE','CA','95843','United States',NULL,NULL,NULL,NULL),(69,'4981 WATT AVE','','','NORTH HIGHLANDS','CA','95660','United States',NULL,NULL,NULL,NULL),(71,'5435 BURGER DRIVE','','','FASTFOODCITY','CA','76567','United States',NULL,NULL,NULL,NULL),(73,'BXCVBX','','','BXCBX','CA','54646','United States',NULL,NULL,NULL,NULL),(75,'4100 MANZANITA AVE','','','CARMICHAEL','CA','95608','United States',NULL,NULL,NULL,NULL),(77,'2334 ARDEN WAY','','','SACRAMENTO','CA','95825','United States',NULL,NULL,NULL,NULL),(79,'5648 FOLSOM BLVD','','','SACRAMENTO','CA','95819','United States',NULL,NULL,NULL,NULL),(81,'8417 ELK GROVE FLORIN RD','','','ELK GROVE','CA','95624','United States',NULL,NULL,NULL,NULL),(83,'1441 MEADOWVIEW RD','','','SACRAMENTO','CA','95832','United States',NULL,NULL,NULL,NULL),(87,'7465 WATT AVE','','','NORTH HIGHLANDS','CA','95660','United States',NULL,NULL,NULL,NULL),(89,'4012 FOOTHILLS BLVD','','','ROSEVILLE','CA','95747','United States',NULL,NULL,NULL,NULL),(91,'5310 AUBURN BLVD','','','SACRAMENTO','CA','95841','United States',NULL,NULL,NULL,NULL),(93,'1300 HOWE AVE','','','SACRAMENTO','CA','95825','United States',NULL,NULL,NULL,NULL),(95,'1544 EUREKA RD','SUITE 125','','ROSEVILLE','CA','95661','United States',NULL,NULL,NULL,NULL),(99,'1544 EUREKA BLVD','SUITE 125','','ROSEVILLE','CA','95661','United States',NULL,NULL,NULL,NULL),(101,'10655 FOLSOM BLVD','','','RANCHO CORDOVA','CA','95670','United States',NULL,NULL,NULL,NULL),(103,'10881 OLSON DRIVE','','','RANCHO CORDOVA','CA','95670','United States',NULL,NULL,NULL,NULL),(105,'8915 GERBER RD','','','SACRAMENTO','CA','95829','United States',NULL,NULL,NULL,NULL),(107,'123 STREETNAME','768','','ANTELOPE','CA','87654','United States',NULL,NULL,NULL,NULL),(143,'2756 SUNRISE BLVD','','','RANCHO CORDOVA','CA','95742','United States',NULL,NULL,NULL,NULL),(145,'2756 SUNRISE BLVD','RANCHO CORDOVA','','RANCHO CORDOVA','CA','95742','United States',NULL,NULL,NULL,NULL),(147,'4900 W ELKHORN BLVD','','','SACRAMENTO','CA','95835','United States',NULL,NULL,NULL,NULL),(151,'1234 POTATO LANE','','','POTATOVILLE','PA','99999','United States',NULL,NULL,NULL,NULL),(153,'1234 DRAGON LANE','','','DRAGONVILLE','PA','99999','United States',NULL,NULL,NULL,NULL),(155,'123213 ADFASDF ST','','','ASDFASDF','CA','56565','United States',NULL,NULL,NULL,NULL),(157,'345435 ASDFASDF SDF','','','ADSFASDF','CA','95959','United States',NULL,NULL,NULL,NULL),(159,'AASJDF 313 DFSDF','','','ASFASDFSD','CA','54684','United States',NULL,NULL,NULL,NULL),(161,'ADFASDF 123','','','ASDFHASKDFJ','CA','54654','United States',NULL,NULL,NULL,NULL),(163,'ASFASFA 2 32','','','ADFASDF','CA','54654','United States',NULL,NULL,NULL,NULL),(165,'ADSFASDF 134','','','ADSFJASDJF','CA','32165','United States',NULL,NULL,NULL,NULL),(167,'ASDFASDFS 123 ASDFASDF','','','ASDFASDF','CA','54654','United States',NULL,NULL,NULL,NULL),(169,'1234 POTATO LANE','','','POTATOSVILLE','PA','99999','United States',NULL,NULL,NULL,NULL),(171,'1234 FAKE STREET','','','FAKELANDIA','CA','99999','United States',NULL,NULL,NULL,NULL),(173,'1234 FAKESVILLE','','','FAKELANDIA','CA','88888','United States',NULL,NULL,NULL,NULL),(175,'4321 BORING LANE','','','BORINGSVILLE','CA','55555','United States',NULL,NULL,NULL,NULL),(177,'4444 FUN DRIVE','','','FUNSVILLE','CA','55555','United States',NULL,NULL,NULL,NULL),(179,'1234 POTATO LANE','','','RUSTIC','ID','55555','United States',NULL,NULL,NULL,NULL),(181,'1234 SACRAMENTO','','','SACRAMENTO','CA','95827','United States',NULL,NULL,NULL,NULL),(183,'1234 HELLO BRANCH','','','SACRAMENTO','CA','99999','United States',NULL,NULL,NULL,NULL),(185,'1234 FAKE STREET','','','SACRAMENTO','CA','95828','United States',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `cnt_addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `cnt_phonesfaxes`
--

LOCK TABLES `cnt_phonesfaxes` WRITE;
/*!40000 ALTER TABLE `cnt_phonesfaxes` DISABLE KEYS */;
INSERT INTO `cnt_phonesfaxes` VALUES (19,'916-515-8066','0','VOICE','LAND LINE',NULL,NULL,NULL,NULL),(21,'916-515-8065','0','VOICE','LAND LINE',NULL,NULL,NULL,NULL),(23,'916-515-8065','1001','VOICE','LAND LINE',NULL,NULL,NULL,NULL),(25,'833-366-8564','0','VOICE','LAND LINE',NULL,NULL,NULL,NULL),(27,'111-222-3333','0','VOICE','LAND LINE',NULL,NULL,NULL,NULL),(45,'555-123-4567','1','VOICE','LAND LINE',NULL,NULL,NULL,NULL),(47,'555-142-1546','33','VOICE','LAND LINE',NULL,NULL,NULL,NULL),(127,'777-888-9999','0','VOICE','LAND LINE',NULL,NULL,NULL,NULL),(129,'777-888-9990','0','VOICE','LAND LINE',NULL,NULL,NULL,NULL),(131,'777-888-9999','65283','VOICE','LAND LINE',NULL,NULL,NULL,NULL),(135,'555-321-3212','0','VOICE','LAND LINE',NULL,NULL,NULL,NULL),(141,'916-111-2154','1234','VOICE','LAND LINE',NULL,NULL,NULL,NULL),(143,'812-555-1234','0','VOICE','LAND LINE',NULL,NULL,NULL,NULL),(145,'916-433-5661','0','VOICE','LAND LINE',NULL,NULL,NULL,NULL),(147,'916-900-3878','0','VOICE','LAND LINE',NULL,NULL,NULL,NULL),(149,'456-210-5468','0','VOICE','LAND LINE',NULL,NULL,NULL,NULL),(151,'458-987-6532','0','VOICE','LAND LINE',NULL,NULL,NULL,NULL),(153,'555-456-4564','0','VOICE','LAND LINE',NULL,NULL,NULL,NULL),(155,'916-407-2025','0','VOICE','LAND LINE',NULL,NULL,NULL,NULL),(157,'916-920-4941','0','VOICE','LAND LINE',NULL,NULL,NULL,NULL),(159,'916-450-9081','0','VOICE','LAND LINE',NULL,NULL,NULL,NULL),(161,'916-525-2531','0','VOICE','LAND LINE',NULL,NULL,NULL,NULL),(163,'916-399-8646','0','VOICE','LAND LINE',NULL,NULL,NULL,NULL),(169,'123-456-7890','12','VOICE','LAND LINE',NULL,NULL,NULL,NULL),(171,'555-123-4567','12','VOICE','LAND LINE',NULL,NULL,NULL,NULL),(175,'555-111-2223','11','VOICE','LAND LINE',NULL,NULL,NULL,NULL),(177,'555-333-4444','0','VOICE','LAND LINE',NULL,NULL,NULL,NULL),(179,'123-123-4123','12','VOICE','LAND LINE',NULL,NULL,NULL,NULL),(181,'555-123-4567','3','VOICE','LAND LINE',NULL,NULL,NULL,NULL),(185,'654-123-3344','56','VOICE','LAND LINE',NULL,NULL,NULL,NULL),(187,'564-123-1234','0','VOICE','LAND LINE',NULL,NULL,NULL,NULL),(189,'555-123-1234','12','VOICE','LAND LINE',NULL,NULL,NULL,NULL),(191,'555-123-4564','0','VOICE','LAND LINE',NULL,NULL,NULL,NULL),(193,'916-348-2464','0','VOICE','LAND LINE',NULL,NULL,NULL,NULL),(195,'916-872-2666','0','VOICE','LAND LINE',NULL,NULL,NULL,NULL),(197,'916-348-2420','0','VOICE','LAND LINE',NULL,NULL,NULL,NULL),(199,'916-883-1246','0','VOICE','LAND LINE',NULL,NULL,NULL,NULL),(201,'916-787-6300','0','VOICE','LAND LINE',NULL,NULL,NULL,NULL),(203,'916-361-0296','0','VOICE','LAND LINE',NULL,NULL,NULL,NULL),(205,'916-503-2512','0','VOICE','LAND LINE',NULL,NULL,NULL,NULL),(207,'916-897-5020','0','VOICE','LAND LINE',NULL,NULL,NULL,NULL),(209,'916-345-7665','9876','VOICE','LAND LINE',NULL,NULL,NULL,NULL),(211,'916-852-0900','0','VOICE','LAND LINE',NULL,NULL,NULL,NULL),(213,'855-579-1743','0','VOICE','LAND LINE',NULL,NULL,NULL,NULL),(217,'999-999-9990','0','VOICE','LAND LINE',NULL,NULL,NULL,NULL),(219,'565-656-5656','0','VOICE','LAND LINE',NULL,NULL,NULL,NULL),(221,'546-546-4545','0','VOICE','LAND LINE',NULL,NULL,NULL,NULL),(223,'456-456-4564','0','VOICE','LAND LINE',NULL,NULL,NULL,NULL),(225,'612-354-4456','0','VOICE','LAND LINE',NULL,NULL,NULL,NULL),(227,'644-444-5123','0','VOICE','LAND LINE',NULL,NULL,NULL,NULL),(229,'123-123-1234','1234','VOICE','LAND LINE',NULL,NULL,NULL,NULL),(231,'888-888-8888','0','VOICE','LAND LINE',NULL,NULL,NULL,NULL),(233,'555-555-5555','0','VOICE','LAND LINE',NULL,NULL,NULL,NULL),(235,'444-444-4444','0','VOICE','LAND LINE',NULL,NULL,NULL,NULL),(237,'916-919-6161','0','VOICE','LAND LINE',NULL,NULL,NULL,NULL),(241,'999-999-9999','99','VOICE','LAND LINE',NULL,NULL,NULL,NULL),(243,'999-999-9991','0','VOICE','LAND LINE',NULL,NULL,NULL,NULL),(245,'999-999-9999','0','VOICE','LAND LINE',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `cnt_phonesfaxes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `crr_ifta_decal`
--

LOCK TABLES `crr_ifta_decal` WRITE;
/*!40000 ALTER TABLE `crr_ifta_decal` DISABLE KEYS */;
/*!40000 ALTER TABLE `crr_ifta_decal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `crr_iftas`
--

LOCK TABLES `crr_iftas` WRITE;
/*!40000 ALTER TABLE `crr_iftas` DISABLE KEYS */;
INSERT INTO `crr_iftas` VALUES (1,'ca','THISISLICENSE','MC123456',15,'2020-01-01','2026-01-02',55);
/*!40000 ALTER TABLE `crr_iftas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `crr_permit_account_docs`
--

LOCK TABLES `crr_permit_account_docs` WRITE;
/*!40000 ALTER TABLE `crr_permit_account_docs` DISABLE KEYS */;
INSERT INTO `crr_permit_account_docs` VALUES (1,9,15),(3,11,15),(5,13,15),(7,17,15),(9,19,15),(11,21,15);
/*!40000 ALTER TABLE `crr_permit_account_docs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `crr_permit_accounts`
--

LOCK TABLES `crr_permit_accounts` WRITE;
/*!40000 ALTER TABLE `crr_permit_accounts` DISABLE KEYS */;
INSERT INTO `crr_permit_accounts` VALUES (9,'fasdfasdf','ca',55),(11,'asdfsdasdf','ca',55),(13,'potatoman','id',55),(17,'new account','zz',55),(19,'newpermit','ca',55),(21,'x permit name','ca',55);
/*!40000 ALTER TABLE `crr_permit_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `crr_permit_images`
--

LOCK TABLES `crr_permit_images` WRITE;
/*!40000 ALTER TABLE `crr_permit_images` DISABLE KEYS */;
/*!40000 ALTER TABLE `crr_permit_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `crr_state_permits`
--

LOCK TABLES `crr_state_permits` WRITE;
/*!40000 ALTER TABLE `crr_state_permits` DISABLE KEYS */;
/*!40000 ALTER TABLE `crr_state_permits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `crr_statistics`
--

LOCK TABLES `crr_statistics` WRITE;
/*!40000 ALTER TABLE `crr_statistics` DISABLE KEYS */;
/*!40000 ALTER TABLE `crr_statistics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `drv_cdl_endorsements`
--

LOCK TABLES `drv_cdl_endorsements` WRITE;
/*!40000 ALTER TABLE `drv_cdl_endorsements` DISABLE KEYS */;
/*!40000 ALTER TABLE `drv_cdl_endorsements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `drv_desttypes`
--

LOCK TABLES `drv_desttypes` WRITE;
/*!40000 ALTER TABLE `drv_desttypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `drv_desttypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `drv_driverlicences`
--

LOCK TABLES `drv_driverlicences` WRITE;
/*!40000 ALTER TABLE `drv_driverlicences` DISABLE KEYS */;
/*!40000 ALTER TABLE `drv_driverlicences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `drv_drivers`
--

LOCK TABLES `drv_drivers` WRITE;
/*!40000 ALTER TABLE `drv_drivers` DISABLE KEYS */;
/*!40000 ALTER TABLE `drv_drivers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `drv_medcards`
--

LOCK TABLES `drv_medcards` WRITE;
/*!40000 ALTER TABLE `drv_medcards` DISABLE KEYS */;
/*!40000 ALTER TABLE `drv_medcards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `drv_schedules`
--

LOCK TABLES `drv_schedules` WRITE;
/*!40000 ALTER TABLE `drv_schedules` DISABLE KEYS */;
/*!40000 ALTER TABLE `drv_schedules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `dsp_loads`
--

LOCK TABLES `dsp_loads` WRITE;
/*!40000 ALTER TABLE `dsp_loads` DISABLE KEYS */;
/*!40000 ALTER TABLE `dsp_loads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `dsp_loads_destinations`
--

LOCK TABLES `dsp_loads_destinations` WRITE;
/*!40000 ALTER TABLE `dsp_loads_destinations` DISABLE KEYS */;
/*!40000 ALTER TABLE `dsp_loads_destinations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `dsp_loads_destinations_docs`
--

LOCK TABLES `dsp_loads_destinations_docs` WRITE;
/*!40000 ALTER TABLE `dsp_loads_destinations_docs` DISABLE KEYS */;
/*!40000 ALTER TABLE `dsp_loads_destinations_docs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `dsp_loads_dispatched`
--

LOCK TABLES `dsp_loads_dispatched` WRITE;
/*!40000 ALTER TABLE `dsp_loads_dispatched` DISABLE KEYS */;
/*!40000 ALTER TABLE `dsp_loads_dispatched` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `dsp_loads_docs`
--

LOCK TABLES `dsp_loads_docs` WRITE;
/*!40000 ALTER TABLE `dsp_loads_docs` DISABLE KEYS */;
/*!40000 ALTER TABLE `dsp_loads_docs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `dsp_loads_required_equipment`
--

LOCK TABLES `dsp_loads_required_equipment` WRITE;
/*!40000 ALTER TABLE `dsp_loads_required_equipment` DISABLE KEYS */;
/*!40000 ALTER TABLE `dsp_loads_required_equipment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `dsp_loads_tracking`
--

LOCK TABLES `dsp_loads_tracking` WRITE;
/*!40000 ALTER TABLE `dsp_loads_tracking` DISABLE KEYS */;
/*!40000 ALTER TABLE `dsp_loads_tracking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `dsp_trips`
--

LOCK TABLES `dsp_trips` WRITE;
/*!40000 ALTER TABLE `dsp_trips` DISABLE KEYS */;
/*!40000 ALTER TABLE `dsp_trips` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `dsp_trips_loads`
--

LOCK TABLES `dsp_trips_loads` WRITE;
/*!40000 ALTER TABLE `dsp_trips_loads` DISABLE KEYS */;
/*!40000 ALTER TABLE `dsp_trips_loads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `ent_blacklist`
--

LOCK TABLES `ent_blacklist` WRITE;
/*!40000 ALTER TABLE `ent_blacklist` DISABLE KEYS */;
/*!40000 ALTER TABLE `ent_blacklist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `ent_businesses`
--

LOCK TABLES `ent_businesses` WRITE;
/*!40000 ALTER TABLE `ent_businesses` DISABLE KEYS */;
INSERT INTO `ent_businesses` VALUES (7,'USKO EXPRESS INC',NULL,'http://uskoinc.com',NULL),(11,'SNAKE OIL CORP2',NULL,'www.snakeoil.com',NULL),(13,'ANOTHER COMPANY',NULL,NULL,NULL),(55,'SNAKE OIL INC 4',NULL,'www.snakeoil.com',NULL),(61,'USKO DESIGNS',NULL,NULL,NULL),(69,'WALMART',NULL,NULL,NULL),(71,'TOGOS',NULL,NULL,NULL),(75,'FBVCVB',NULL,NULL,NULL),(79,'BANK OF AMERICA',NULL,NULL,NULL),(83,'C.H. ROBINSON',NULL,NULL,NULL),(123,'THE HOME DEPOT',NULL,NULL,NULL),(125,'POTATOLAND',NULL,NULL,NULL);
/*!40000 ALTER TABLE `ent_businesses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `ent_carriers`
--

LOCK TABLES `ent_carriers` WRITE;
/*!40000 ALTER TABLE `ent_carriers` DISABLE KEYS */;
INSERT INTO `ent_carriers` VALUES (55,'MC555555',NULL,'USDOT555555','Company Carrier',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-05-22');
/*!40000 ALTER TABLE `ent_carriers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `ent_customers`
--

LOCK TABLES `ent_customers` WRITE;
/*!40000 ALTER TABLE `ent_customers` DISABLE KEYS */;
INSERT INTO `ent_customers` VALUES (61,'SM45H3R5',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1);
/*!40000 ALTER TABLE `ent_customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `ent_owner_operators`
--

LOCK TABLES `ent_owner_operators` WRITE;
/*!40000 ALTER TABLE `ent_owner_operators` DISABLE KEYS */;
/*!40000 ALTER TABLE `ent_owner_operators` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `ent_people`
--

LOCK TABLES `ent_people` WRITE;
/*!40000 ALTER TABLE `ent_people` DISABLE KEYS */;
INSERT INTO `ent_people` VALUES (199,'','','NEW CONTACT','','HELLO','',73),(7,'','','VLADIMIR','','SKOTS','',7),(193,'','Madam','PERSON','POTATO','SUPER','II',183);
/*!40000 ALTER TABLE `ent_people` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `ent_shippers`
--

LOCK TABLES `ent_shippers` WRITE;
/*!40000 ALTER TABLE `ent_shippers` DISABLE KEYS */;
/*!40000 ALTER TABLE `ent_shippers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `entities`
--

LOCK TABLES `entities` WRITE;
/*!40000 ALTER TABLE `entities` DISABLE KEYS */;
INSERT INTO `entities` VALUES (15,1,'2020-04-03 15:21:39',NULL,NULL,79),(19,1,'2020-04-03 15:46:25',NULL,NULL,83),(21,1,'2020-04-06 08:08:18',NULL,NULL,69),(23,1,'2020-04-06 15:31:18',NULL,NULL,11),(63,1,'2020-04-14 12:48:25',NULL,NULL,123),(65,1,'2020-04-28 09:56:21',NULL,NULL,125),(67,1,'2020-04-29 15:47:19',NULL,NULL,55);
/*!40000 ALTER TABLE `entities` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`192.168.1%.%`*/ /*!50003 TRIGGER `tms`.`entities_BEFORE_INSERT` BEFORE INSERT ON `entities` FOR EACH ROW
BEGIN
	IF (ISNULL(NEW.PersonId) = ISNULL(NEW.BusinessId)) THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Entity must exclusively be a person or business';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`192.168.1%.%`*/ /*!50003 TRIGGER `tms`.`entities_BEFORE_UPDATE` BEFORE UPDATE ON `entities` FOR EACH ROW
BEGIN
	IF (NOT ISNULL(NEW.BusinessId) AND NOT ISNULL(NEW.PersonId)) THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Entity must exclusively be a person or business';
    END IF;

	IF (NOT ISNULL(OLD.PersonId)) THEN 
		IF (NOT ISNULL(NEW.BusinessId)) THEN
			SET NEW.PersonId = NULL;
        END IF;
    END IF;
    
    IF (NOT ISNULL(OLD.BusinessId)) THEN
		IF (NOT ISNULL(NEW.PersonId)) THEN 
			SET NEW.BusinessId = NULL;
        END IF;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping data for table `fin_account_types`
--

LOCK TABLES `fin_account_types` WRITE;
/*!40000 ALTER TABLE `fin_account_types` DISABLE KEYS */;
INSERT INTO `fin_account_types` VALUES (1,'Asset',NULL,0,1,0,1.00,-1.00,0,100,1,0),(3,'Liability',NULL,0,1,0,-1.00,1.00,0,300,1,0),(5,'Equity',NULL,0,1,0,-1.00,1.00,0,500,1,0),(7,'Gain',NULL,0,1,0,-1.00,1.00,1,600,0,1),(9,'Loss',NULL,0,1,0,1.00,-1.00,1,610,0,1),(11,'Bank',NULL,0,1,0,1.00,-1.00,0,105,0,0),(13,'Non-Posting Asset',1,1,1,1,1.00,-1.00,0,900,1,0),(15,'Contra Asset',1,0,1,0,-1.00,1.00,0,130,1,0),(17,'Contra Liability',3,0,1,0,1.00,-1.00,0,330,1,0),(19,'Contra Equity',5,0,1,0,1.00,-1.00,0,530,1,0),(21,'Net Income',5,0,1,0,-1.00,1.00,1,505,1,1),(23,'Revenue',21,1,1,1,-1.00,1.00,0,510,1,0),(25,'Expense',21,1,1,1,1.00,-1.00,0,520,1,0),(27,'Fixed Asset',1,1,1,1,1.00,-1.00,0,120,1,0),(29,'Current Asset',1,1,1,1,1.00,-1.00,0,110,1,0),(31,'Current Liability',3,1,1,1,-1.00,1.00,0,310,1,0),(33,'Long Term Liability',3,1,1,1,-1.00,1.00,0,320,1,0),(35,'Loan',3,1,1,1,-1.00,1.00,0,360,1,0),(37,'Credit Card',3,1,1,1,-1.00,1.00,0,340,1,0),(39,'Non-Posting Liability',3,1,1,1,-1.00,1.00,0,901,0,0),(41,'Non-Posting Equity',5,1,1,1,-1.00,1.00,0,902,0,0),(43,'Cost of Goods Sold',25,1,1,1,1.00,-1.00,0,540,1,0),(45,'Other Expense',25,1,1,1,1.00,-1.00,0,525,1,0),(47,'Other Revenue',23,1,1,1,-1.00,1.00,0,515,1,0),(49,'Other Current Asset',1,1,1,1,1.00,-1.00,0,115,1,0);
/*!40000 ALTER TABLE `fin_account_types` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`192.168.1%.%`*/ /*!50003 TRIGGER `tms`.`fin_account_types_AFTER_INSERT` AFTER INSERT ON `fin_account_types` FOR EACH ROW
BEGIN
	INSERT INTO 
		fin_account_types_trees (AncestorId, DescendantId, Depth)
	SELECT
		AncestorId, NEW.AccountTypeId, Depth + 1
	FROM 
		fin_account_types_trees
	WHERE
		DescendantId = NEW.ParentId
	UNION ALL
		SELECT
			NEW.AccountTypeId, NEW.AccountTypeId, 0;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`192.168.1%.%`*/ /*!50003 TRIGGER `tms`.`fin_account_types_BEFORE_DELETE` BEFORE DELETE ON `fin_account_types` FOR EACH ROW
BEGIN
	DECLARE has_ancestors BIGINT(20) DEFAULT NULL;
    SELECT
		tree.AncestorId
	INTO 
		has_ancestors
	FROM
		fin_account_types_trees tree
	WHERE
		tree.AncestorId = OLD.AccountTypeId
        AND tree.DescendantId <> tree.AncestorId
	LIMIT 1;
    
    IF (has_ancestors IS NOT NULL) THEN
		DELETE b FROM
			fin_account_types_trees a,
            fin_account_types_trees b
		WHERE
			a.AncestorId = OLD.AccountTypeId OR
            b.DescendantId = OLD.AccountTypeId OR 
            (a.AncestorId = OLD.AccountTypeId AND a.DescendantId = b.DescendantId);
	ELSE
		DELETE FROM fin_account_types_trees WHERE DescendantId = OLD.AccountTypeId;
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping data for table `fin_account_types_trees`
--

LOCK TABLES `fin_account_types_trees` WRITE;
/*!40000 ALTER TABLE `fin_account_types_trees` DISABLE KEYS */;
INSERT INTO `fin_account_types_trees` VALUES (1,1,0),(3,3,0),(5,5,0),(7,7,0),(9,9,0),(11,11,0),(13,13,0),(15,15,0),(17,17,0),(19,19,0),(21,21,0),(23,23,0),(25,25,0),(27,27,0),(29,29,0),(31,31,0),(33,33,0),(35,35,0),(37,37,0),(39,39,0),(41,41,0),(43,43,0),(45,45,0),(47,47,0),(49,49,0),(1,13,1),(1,15,1),(1,27,1),(1,29,1),(1,49,1),(3,17,1),(3,31,1),(3,33,1),(3,35,1),(3,37,1),(3,39,1),(5,19,1),(5,21,1),(5,41,1),(21,23,1),(21,25,1),(23,47,1),(25,43,1),(25,45,1),(5,23,2),(5,25,2),(21,43,2),(21,45,2),(21,47,2),(5,43,3),(5,45,3),(5,47,3);
/*!40000 ALTER TABLE `fin_account_types_trees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `fin_accounts`
--

LOCK TABLES `fin_accounts` WRITE;
/*!40000 ALTER TABLE `fin_accounts` DISABLE KEYS */;
INSERT INTO `fin_accounts` VALUES (1,1,NULL,0,NULL,1,1,'2019-05-13 14:08:59','Accounts Receivable',NULL,NULL,0.00,NULL),(3,3,NULL,0,NULL,1,1,'2019-05-13 14:08:59','Accounts Payable',NULL,NULL,0.00,NULL),(5,1,NULL,0,NULL,1,1,'2019-05-13 14:27:47','Cash',NULL,NULL,0.00,NULL),(7,25,NULL,0,NULL,1,1,'2019-05-13 14:27:47','Service Expense',NULL,NULL,0.00,NULL),(9,5,NULL,0,NULL,1,1,'2019-05-13 14:27:47','Retained Earnings',NULL,NULL,0.00,NULL),(11,25,NULL,0,NULL,1,1,'2019-05-13 14:27:47','Advertisement Expense',NULL,NULL,0.00,NULL),(13,23,NULL,0,NULL,1,1,'2019-05-13 14:27:47','Service Revenue',NULL,NULL,0.00,NULL),(15,1,NULL,0,NULL,1,1,'2019-05-13 14:27:47','Equipment',NULL,NULL,0.00,NULL),(17,1,NULL,0,NULL,1,1,'2019-05-13 14:27:47','Driver Advance',NULL,NULL,0.00,NULL),(19,1,NULL,0,NULL,1,1,'2019-05-13 14:27:47','Prepaid Insurance',NULL,NULL,0.00,NULL),(21,15,NULL,0,NULL,1,1,'2019-05-13 14:27:47','Accumulated Depreciation',NULL,NULL,0.00,NULL),(23,1,NULL,0,NULL,1,1,'2019-05-13 14:27:47','Tractors and Trailers',NULL,NULL,0.00,NULL),(25,3,3,0,NULL,1,1,'2019-05-13 14:27:47','Payroll Liabilities',NULL,NULL,0.00,NULL),(27,5,NULL,0,NULL,1,1,'2019-05-13 14:27:47','Openning Balance Equity',NULL,NULL,0.00,NULL),(29,19,NULL,0,NULL,1,1,'2019-05-13 14:27:47','Owners Draw',NULL,NULL,0.00,NULL),(31,5,NULL,0,NULL,1,1,'2019-05-13 14:27:47','Owners Equity',NULL,NULL,0.00,NULL),(33,25,NULL,0,NULL,1,1,'2019-05-13 14:27:47','Fuel Surcharge',NULL,NULL,0.00,NULL),(35,25,NULL,0,NULL,1,1,'2019-05-13 14:27:47','Driver Travel Expense',NULL,NULL,0.00,NULL),(37,25,NULL,0,NULL,1,1,'2019-05-13 14:27:47','Fuel for Hired Vehicles',NULL,NULL,0.00,NULL),(39,25,NULL,0,NULL,1,1,'2019-05-13 14:27:47','Truck Maintenance Costs',NULL,NULL,0.00,NULL),(41,25,NULL,0,NULL,1,1,'2019-05-13 14:27:47','Insurance Expense',NULL,NULL,0.00,NULL),(43,25,NULL,0,NULL,1,1,'2019-05-13 14:27:47','Payroll Expense',NULL,NULL,0.00,NULL),(45,25,NULL,0,NULL,1,1,'2019-05-13 14:27:47','Utilities',NULL,NULL,0.00,NULL),(47,25,NULL,0,NULL,1,1,'2019-05-13 14:27:47','Telephone Expense',NULL,NULL,0.00,NULL),(49,25,NULL,0,NULL,1,1,'2019-05-13 14:27:47','Meals and Entertainment',NULL,NULL,0.00,NULL),(51,25,NULL,0,NULL,1,1,'2019-05-13 14:27:47','Bank Service Charge',NULL,NULL,0.00,NULL),(53,25,NULL,0,NULL,1,1,'2019-05-13 14:27:47','Business Licenses and Permits',NULL,NULL,0.00,NULL),(55,25,NULL,0,NULL,1,1,'2019-05-13 14:27:47','Computer and Internet Expense',NULL,NULL,0.00,NULL);
/*!40000 ALTER TABLE `fin_accounts` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`192.168.1%.%`*/ /*!50003 TRIGGER `tms`.`fin_accounts_AFTER_INSERT` AFTER INSERT ON `fin_accounts` FOR EACH ROW
BEGIN
	INSERT INTO 
		fin_accounts_trees (AncestorId, DescendantId, Depth)
	SELECT
		AncestorId, NEW.AccountId, Depth + 1
	FROM 
		fin_accounts_trees
	WHERE
		DescendantId = NEW.ParentId
	UNION ALL
		SELECT
			NEW.AccountId, NEW.AccountId, 0;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`192.168.1%.%`*/ /*!50003 TRIGGER `tms`.`fin_accounts_BEFORE_UPDATE` BEFORE UPDATE ON `fin_accounts` FOR EACH ROW
BEGIN

	IF (NEW.AccountId <> OLD.AccountId) THEN 
		SIGNAL SQLSTATE "45000"
        SET MESSAGE_TEXT = "One or more fields are not allowed to be updated.";
    END IF;
	
	DELETE a FROM fin_accounts_trees AS a
        JOIN
    fin_accounts_trees AS d ON a.DescendantId = d.DescendantId
        LEFT JOIN
    fin_accounts_trees AS x ON x.AncestorId = d.AncestorId
        AND x.DescendantId = a.AncestorId 
	WHERE
		d.AncestorId = NEW.AccountId
		AND x.AncestorId IS NULL;
	
    
    INSERT INTO fin_accounts_trees (AncestorId, DescendantId, Depth)
    SELECT sup.AncestorId, sub.DescendantId, sup.Depth + sub.Depth + 1
    FROM fin_accounts_trees AS sup JOIN fin_accounts_trees AS sub
    WHERE sub.AncestorId = NEW.AccountId AND sup.DescendantId = NEW.ParentId;
        
	
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`192.168.1%.%`*/ /*!50003 TRIGGER `tms`.`fin_accounts_BEFORE_DELETE` BEFORE DELETE ON `fin_accounts` FOR EACH ROW
BEGIN
	DECLARE has_ancestors BIGINT(20) DEFAULT NULL;
    
    SELECT
		tree.AncestorId
	INTO 
		has_ancestors
	FROM
		fin_accounts_trees tree
	WHERE
		tree.AncestorId = OLD.AccountId
        AND tree.DescendantId <> tree.AncestorId
	LIMIT 1;
    
    IF (has_ancestors IS NOT NULL) THEN
		DELETE b FROM
			fin_accounts_trees a,
            fin_accounts_trees b
		WHERE
			a.AncestorId = OLD.AccountId OR
            b.DescendantId = OLD.AccountId OR 
            (a.AncestorId = OLD.AccountId AND a.DescendantId = b.DescendantId);
	ELSE
		DELETE FROM fin_accounts_trees WHERE DescendantId = OLD.AccountId;
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping data for table `fin_accounts_trees`
--

LOCK TABLES `fin_accounts_trees` WRITE;
/*!40000 ALTER TABLE `fin_accounts_trees` DISABLE KEYS */;
INSERT INTO `fin_accounts_trees` VALUES (1,1,0),(3,3,0),(5,5,0),(7,7,0),(9,9,0),(11,11,0),(13,13,0),(15,15,0),(17,17,0),(19,19,0),(21,21,0),(23,23,0),(25,25,0),(27,27,0),(29,29,0),(31,31,0),(33,33,0),(35,35,0),(37,37,0),(39,39,0),(41,41,0),(43,43,0),(45,45,0),(47,47,0),(49,49,0),(51,51,0),(53,53,0),(55,55,0),(3,25,1);
/*!40000 ALTER TABLE `fin_accounts_trees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `fin_billing_banks`
--

LOCK TABLES `fin_billing_banks` WRITE;
/*!40000 ALTER TABLE `fin_billing_banks` DISABLE KEYS */;
/*!40000 ALTER TABLE `fin_billing_banks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `fin_billing_infos`
--

LOCK TABLES `fin_billing_infos` WRITE;
/*!40000 ALTER TABLE `fin_billing_infos` DISABLE KEYS */;
/*!40000 ALTER TABLE `fin_billing_infos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `fin_billing_rules`
--

LOCK TABLES `fin_billing_rules` WRITE;
/*!40000 ALTER TABLE `fin_billing_rules` DISABLE KEYS */;
/*!40000 ALTER TABLE `fin_billing_rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `fin_billing_tags`
--

LOCK TABLES `fin_billing_tags` WRITE;
/*!40000 ALTER TABLE `fin_billing_tags` DISABLE KEYS */;
INSERT INTO `fin_billing_tags` VALUES (2,'Billing',0,NULL,'2019-06-28 14:05:04'),(4,'Payment',0,NULL,'2019-06-28 14:05:04'),(6,'Shipping',0,NULL,'2019-06-28 14:05:04'),(7,'Billing and Payment',0,NULL,'2019-11-26 09:47:08');
/*!40000 ALTER TABLE `fin_billing_tags` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`192.168.1%.%`*/ /*!50003 TRIGGER `tms`.`fin_billing_tags_BEFORE_UPDATE` BEFORE UPDATE ON `fin_billing_tags` FOR EACH ROW
BEGIN
	IF (OLD.UserDefined = 0) THEN
		SIGNAL sqlstate "45000"
        SET MESSAGE_TEXT = "This row can not be updated.";
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`192.168.1%.%`*/ /*!50003 TRIGGER `tms`.`fin_billing_tags_BEFORE_DELETE` BEFORE DELETE ON `fin_billing_tags` FOR EACH ROW
BEGIN
	IF (OLD.UserDefined = 0) THEN
		SIGNAL sqlstate "45000"
        SET MESSAGE_TEXT = "This row can not be deleted.";
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping data for table `fin_cheques`
--

LOCK TABLES `fin_cheques` WRITE;
/*!40000 ALTER TABLE `fin_cheques` DISABLE KEYS */;
/*!40000 ALTER TABLE `fin_cheques` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `fin_cheques_prints`
--

LOCK TABLES `fin_cheques_prints` WRITE;
/*!40000 ALTER TABLE `fin_cheques_prints` DISABLE KEYS */;
/*!40000 ALTER TABLE `fin_cheques_prints` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `fin_classes`
--

LOCK TABLES `fin_classes` WRITE;
/*!40000 ALTER TABLE `fin_classes` DISABLE KEYS */;
/*!40000 ALTER TABLE `fin_classes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `fin_invoice_payment_items`
--

LOCK TABLES `fin_invoice_payment_items` WRITE;
/*!40000 ALTER TABLE `fin_invoice_payment_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `fin_invoice_payment_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `fin_invoice_payments`
--

LOCK TABLES `fin_invoice_payments` WRITE;
/*!40000 ALTER TABLE `fin_invoice_payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `fin_invoice_payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `fin_invoices`
--

LOCK TABLES `fin_invoices` WRITE;
/*!40000 ALTER TABLE `fin_invoices` DISABLE KEYS */;
/*!40000 ALTER TABLE `fin_invoices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `fin_invoices_items`
--

LOCK TABLES `fin_invoices_items` WRITE;
/*!40000 ALTER TABLE `fin_invoices_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `fin_invoices_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `fin_item_template`
--

LOCK TABLES `fin_item_template` WRITE;
/*!40000 ALTER TABLE `fin_item_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `fin_item_template` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`192.168.1%.%`*/ /*!50003 TRIGGER `tms`.`fin_item_templates_AFTER_INSERT` AFTER INSERT ON `fin_item_template` FOR EACH ROW
BEGIN
	INSERT INTO 
		fin_item_templates_trees (AncestorId, DescendantId, Depth) 
    SELECT 
		AncestorId, NEW.ItemTemplateId, Depth + 1
	FROM 
		fin_item_templates_trees
	WHERE 
		DescendantId = NEW.ParentId
	UNION ALL 
		SELECT 
			NEW.ItemTemplateId, NEW.ItemTemplateId, 0;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`192.168.1%.%`*/ /*!50003 TRIGGER `tms`.`fin_item_templates_BEFORE_DELETE` BEFORE DELETE ON `fin_item_template` FOR EACH ROW
BEGIN
	DECLARE has_ancestors BIGINT(20) DEFAULT NULL;
	SELECT 
		tree.AncestorId
    INTO 
		has_ancestors
    FROM
		fin_item_templates_trees tree
	WHERE
		tree.AncestorId = OLD.ItemTemplateId AND
        tree.DescendantId <> tree.AncestorId
	LIMIT 1;
	IF (has_ancestors IS NOT NULL) THEN
		DELETE b FROM
			fin_item_templates_trees a,
            fin_item_templates_trees b
		WHERE 
			b.AncestorId = OLD.ItemTemplateId OR
            b.DescendantId = OLD.ItemTemplateId OR
            (a.AncestorId = OLD.ItemTemplateId AND a.DescendantId = b.DescendantId);
    ELSE 
		DELETE FROM fin_item_templates_trees WHERE DescendantId = OLD.ItemTemplateId;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping data for table `fin_item_templates_trees`
--

LOCK TABLES `fin_item_templates_trees` WRITE;
/*!40000 ALTER TABLE `fin_item_templates_trees` DISABLE KEYS */;
/*!40000 ALTER TABLE `fin_item_templates_trees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `fin_item_templates_types`
--

LOCK TABLES `fin_item_templates_types` WRITE;
/*!40000 ALTER TABLE `fin_item_templates_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `fin_item_templates_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `fin_jobs`
--

LOCK TABLES `fin_jobs` WRITE;
/*!40000 ALTER TABLE `fin_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `fin_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `fin_journal_entries`
--

LOCK TABLES `fin_journal_entries` WRITE;
/*!40000 ALTER TABLE `fin_journal_entries` DISABLE KEYS */;
/*!40000 ALTER TABLE `fin_journal_entries` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`192.168.1%.%`*/ /*!50003 TRIGGER `tms`.`set_signed_amount` BEFORE INSERT ON `fin_journal_entries` FOR EACH ROW
BEGIN
	DECLARE sign_dr INT;
    DECLARE sign_cr INT;
    DECLARE root_sign INT;
SELECT 
    child.Debit, child.Credit, root.Credit
INTO sign_dr , sign_cr , root_sign FROM
    fin_accounts acc
        LEFT JOIN
    fin_account_types_roots acc_tr ON acc.AccountTypeId = acc_tr.DescendantId
        LEFT JOIN
    fin_account_types root ON acc_tr.RootId = root.AccountTypeId
        LEFT JOIN
    fin_account_types child ON acc_tr.DescendantId = child.AccountTypeId
WHERE
    acc.AccountId = NEW.AccountId;
        
    SET NEW.Amount := IF (NEW.DebitCredit = 'debit', ABS(NEW.Amount) * sign_dr, ABS(NEW.Amount) * sign_cr);
    SET NEW.VendorAmount := NEW.Amount * root_sign;
    SET NEW.ReportAmount := NEW.Amount * sign_cr * root_sign;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`192.168.1%.%`*/ /*!50003 TRIGGER `tms`.`update_account_balance_AFTER_INSERT` AFTER INSERT ON `fin_journal_entries` FOR EACH ROW
BEGIN
	UPDATE fin_accounts acc SET acc.Balance = acc.Balance + NEW.Amount WHERE acc.AccountId = NEW.AccountId;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`192.168.1%.%`*/ /*!50003 TRIGGER `tms`.`fin_journal_entries_BEFORE_UPDATE` BEFORE UPDATE ON `fin_journal_entries` FOR EACH ROW
BEGIN
	IF (OLD.AccountId <> NEW.AccountId) THEN
		SIGNAL SQLSTATE "45000"
        SET message_text = 'You are not allowed to change the account for this journal entry.';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`192.168.1%.%`*/ /*!50003 TRIGGER `tms`.`update_account_balance_AFTER_UPDATE` AFTER UPDATE ON `fin_journal_entries` FOR EACH ROW
BEGIN
	UPDATE fin_accounts acc SET acc.Balance = acc.Balance - OLD.Amount + NEW.Amount WHERE acc.AccountId = OLD.AccountId;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`192.168.1%.%`*/ /*!50003 TRIGGER `tms`.`update_account_balance_AFTER_DELETE` AFTER DELETE ON `fin_journal_entries` FOR EACH ROW
BEGIN
	UPDATE fin_accounts acc SET acc.Balance = acc.Balance - OLD.Amount WHERE acc.AccountId = OLD.AccountId;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping data for table `fin_payment_methods`
--

LOCK TABLES `fin_payment_methods` WRITE;
/*!40000 ALTER TABLE `fin_payment_methods` DISABLE KEYS */;
/*!40000 ALTER TABLE `fin_payment_methods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `fin_payment_terms`
--

LOCK TABLES `fin_payment_terms` WRITE;
/*!40000 ALTER TABLE `fin_payment_terms` DISABLE KEYS */;
/*!40000 ALTER TABLE `fin_payment_terms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `fin_scheduled_deductions`
--

LOCK TABLES `fin_scheduled_deductions` WRITE;
/*!40000 ALTER TABLE `fin_scheduled_deductions` DISABLE KEYS */;
/*!40000 ALTER TABLE `fin_scheduled_deductions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `fin_tax_ids`
--

LOCK TABLES `fin_tax_ids` WRITE;
/*!40000 ALTER TABLE `fin_tax_ids` DISABLE KEYS */;
/*!40000 ALTER TABLE `fin_tax_ids` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `fin_transaction_types`
--

LOCK TABLES `fin_transaction_types` WRITE;
/*!40000 ALTER TABLE `fin_transaction_types` DISABLE KEYS */;
INSERT INTO `fin_transaction_types` VALUES (1,'Cash'),(3,'Check'),(5,'Credit Card Charge'),(7,'Deposit'),(9,'Journal Entry'),(11,'Payment'),(14,'Service'),(13,'Transfer');
/*!40000 ALTER TABLE `fin_transaction_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `fin_transactions`
--

LOCK TABLES `fin_transactions` WRITE;
/*!40000 ALTER TABLE `fin_transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `fin_transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `gen_files`
--

LOCK TABLES `gen_files` WRITE;
/*!40000 ALTER TABLE `gen_files` DISABLE KEYS */;
INSERT INTO `gen_files` VALUES (15,NULL,NULL,'guesswho.jpg','data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAMCAgMCAgMDAwMEAwMEBQgFBQQEBQoHBwYIDAoMDAsKCwsNDhIQDQ4RDgsLEBYQERMUFRUVDA8XGBYUGBIUFRQBAwQEBgUGCgYGCg8NCA0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0ODQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0ODQ0NDQ0NDf/AABEIACgAKAMBEQACEQEDEQH/xAAbAAADAAIDAAAAAAAAAAAAAAAHCAkFBgADBP/EADQQAAEDAwMCAwUGBwAAAAAAAAECAwQFBhEAByESMQhRcRMiQUJhFDKBkcLhCRZSYoKhwf/EABoBAQEAAwEBAAAAAAAAAAAAAAUEAQMGAAL/xAAdEQACAwADAQEAAAAAAAAAAAAAAgEDEQQSITFB/9oADAMBAAIRAxEAPwBUfAyhEbfGlh0pQ3JjuthRH3fcJ/TqDk7MF3HxZG68R9xzZUuJalEnmjRVwptSm1RDwQ863GDYLTZGVIBU6MqGCehQHmTKa50QueMFwqES5KnY8iiWZLeuh2u4hOIfeUo5U24rqSpxRUCAy4CCce8ggDBzfE5PpH12AWWnZ8qoXS3SKrGehTHW1RWqS4CwQ4tBbyoHukKOSfLJzjW9mXDQqTElHbNtluhm2Y8dsoZjudCASSQkJIHJ57eehHkWSCeOzGz9SqO4lm0W4DWKDDqz2GpkBz2LzjK+ErQog8HkcjS91sYFVpOj4Tf4elNttTFYs+rTX6/GQQH604JDUkKGHG3kAJBSpJxxgg4Pw0SvKycFJ4+webZzw8Vbb26ZFTr7USM4ykqjU+m5cbQopUkuZUlPyrcSkY49ooknCenNt2/DFVGR6c3Tq7CL0ojLtMp7MghLK0NpPX1KV8hIyQBjJwMkdh216FZoMzMLIYKNFbTUqM3jnrPH+J1M0lKwJNYN0RheFsiqzPsApYU3HmONKdbSlBT0JIBBBGD28vx0pK9oDUbqUZ2k3eou4lLVJpc5uYwh1ccvJBCVLQcHv+fpg9tDWV9ZE0ftBk7ooFQn11l+E8hmK40UOqS2FLBByOnPAzznIPYa+fhtwCe6O18S2H/5gUWkYUFvSJZ6nCB/cew+g89Vo7Ejov6dG316wLjvSixY7yXFBxQKc/HoUf8AmsMmHkfSaVjbsM1e+4NuVBRpdJnSVNSJjow4hZBCRg8JHVgEnz+GNdAydVBobtJQ/wAOlqRtsGpEOPIL0Ga8HVhas9JwAD+/p5aAt9kXp8DZd9x1GjUiQ5TZy23G0KXnhXQByTznU6r6VNZsEufFruBuVdIiVSqXTUZkSC+QuKhz2bDZ6vcUW0AJJB4yQe+ug4yLnoHyJbfDdPBjecqbu5YVQVNL0SoOusPtKVy08Gl5Hoe/oRrTyUw2cdtFJ3VtZNs3ChcYLTGfQFoyfukcEA/TjSVbd4IHjB+vCRuNVNz9uYclTTYm0xz7C+77Q5WUpSQoj6gj8c6I5K9ZE+NPgfnqxPVNnsSciFNjeycxyWlhPScZ+BGDqNYLJFg3is+LNptwU8OZRKYWjn+ogkK9c4OkKmwisgU7w0X69Y+7dqlxfRGYrDTygTwPkV/oj8tIXLqkFTZJ/9k=','3524273774df6aca455bfbdaf76cb00afe6e43eda9e396cc5c482491f6a5a6c0','image/jpeg','2020-04-29 10:33:47',NULL,NULL);
/*!40000 ALTER TABLE `gen_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `hr_associates`
--

LOCK TABLES `hr_associates` WRITE;
/*!40000 ALTER TABLE `hr_associates` DISABLE KEYS */;
INSERT INTO `hr_associates` VALUES (7,'CEO',7,'executive','2020-03-10 15:56:41',NULL,23,19,'vlad@uskoinc.com','Founder and CEO',1),(193,'owner',NULL,'executive','2020-05-06 13:41:25',NULL,NULL,NULL,NULL,NULL,1),(199,NULL,NULL,'member','2020-05-07 13:22:24',NULL,NULL,NULL,NULL,NULL,0);
/*!40000 ALTER TABLE `hr_associates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `hr_confidentials`
--

LOCK TABLES `hr_confidentials` WRITE;
/*!40000 ALTER TABLE `hr_confidentials` DISABLE KEYS */;
/*!40000 ALTER TABLE `hr_confidentials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `hr_emrgency_contacts`
--

LOCK TABLES `hr_emrgency_contacts` WRITE;
/*!40000 ALTER TABLE `hr_emrgency_contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `hr_emrgency_contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `hr_govidcards`
--

LOCK TABLES `hr_govidcards` WRITE;
/*!40000 ALTER TABLE `hr_govidcards` DISABLE KEYS */;
/*!40000 ALTER TABLE `hr_govidcards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `hr_hire_records`
--

LOCK TABLES `hr_hire_records` WRITE;
/*!40000 ALTER TABLE `hr_hire_records` DISABLE KEYS */;
/*!40000 ALTER TABLE `hr_hire_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `hr_payrates`
--

LOCK TABLES `hr_payrates` WRITE;
/*!40000 ALTER TABLE `hr_payrates` DISABLE KEYS */;
/*!40000 ALTER TABLE `hr_payrates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `hr_references`
--

LOCK TABLES `hr_references` WRITE;
/*!40000 ALTER TABLE `hr_references` DISABLE KEYS */;
/*!40000 ALTER TABLE `hr_references` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `hr_residences`
--

LOCK TABLES `hr_residences` WRITE;
/*!40000 ALTER TABLE `hr_residences` DISABLE KEYS */;
/*!40000 ALTER TABLE `hr_residences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `ins_policies`
--

LOCK TABLES `ins_policies` WRITE;
/*!40000 ALTER TABLE `ins_policies` DISABLE KEYS */;
INSERT INTO `ins_policies` VALUES (17,79,NULL,'potatoes','potatoes','1234567','2020-01-01','2020-12-31',10000.00,0.00,'Owner',NULL),(19,79,NULL,'potatoes','potatoes','123123','2020-12-31','2021-01-01',10000.00,0.00,'Owner',NULL),(21,79,NULL,'tomatoes','tomatoes','123123123','2020-12-31','2021-01-01',10.00,10.00,'Owner',NULL),(23,13,NULL,'tomatoes','tomatoes','123123','2020-12-31','2021-12-30',55000.00,0.00,'Owner',NULL),(25,79,NULL,'beef','beef','123456','2020-12-31','2022-01-01',1000.00,1000.00,'Owner',NULL),(27,7,NULL,'Cargo Liability','bananas only','8734298732','1996-10-31','2022-10-31',30.00,10.00,'Owner',NULL);
/*!40000 ALTER TABLE `ins_policies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `ins_to_entities`
--

LOCK TABLES `ins_to_entities` WRITE;
/*!40000 ALTER TABLE `ins_to_entities` DISABLE KEYS */;
INSERT INTO `ins_to_entities` VALUES (1,17,23,7,'2020-05-06 10:09:29',7,'2020-05-06',NULL,NULL,NULL,NULL),(3,19,23,7,'2020-05-06 10:24:41',7,'2020-05-06',NULL,NULL,NULL,NULL),(5,21,23,7,'2020-05-06 10:26:15',7,'2020-05-06',NULL,NULL,NULL,NULL),(7,23,67,7,'2020-05-06 14:54:44',7,'2020-05-06',NULL,NULL,NULL,NULL),(9,25,67,7,'2020-05-07 11:42:49',NULL,NULL,NULL,NULL,NULL,NULL),(11,27,23,7,'2020-05-13 10:30:18',7,'2020-05-13',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `ins_to_entities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `ins_to_vehicles`
--

LOCK TABLES `ins_to_vehicles` WRITE;
/*!40000 ALTER TABLE `ins_to_vehicles` DISABLE KEYS */;
/*!40000 ALTER TABLE `ins_to_vehicles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `inv_elog_device`
--

LOCK TABLES `inv_elog_device` WRITE;
/*!40000 ALTER TABLE `inv_elog_device` DISABLE KEYS */;
/*!40000 ALTER TABLE `inv_elog_device` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `inv_equipment`
--

LOCK TABLES `inv_equipment` WRITE;
/*!40000 ALTER TABLE `inv_equipment` DISABLE KEYS */;
/*!40000 ALTER TABLE `inv_equipment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `inv_equipment_docs`
--

LOCK TABLES `inv_equipment_docs` WRITE;
/*!40000 ALTER TABLE `inv_equipment_docs` DISABLE KEYS */;
/*!40000 ALTER TABLE `inv_equipment_docs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `inv_equipment_to_support`
--

LOCK TABLES `inv_equipment_to_support` WRITE;
/*!40000 ALTER TABLE `inv_equipment_to_support` DISABLE KEYS */;
/*!40000 ALTER TABLE `inv_equipment_to_support` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `inv_equipment_types`
--

LOCK TABLES `inv_equipment_types` WRITE;
/*!40000 ALTER TABLE `inv_equipment_types` DISABLE KEYS */;
INSERT INTO `inv_equipment_types` VALUES (1,'Dry Van'),(3,'Reefer');
/*!40000 ALTER TABLE `inv_equipment_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `inv_notes`
--

LOCK TABLES `inv_notes` WRITE;
/*!40000 ALTER TABLE `inv_notes` DISABLE KEYS */;
/*!40000 ALTER TABLE `inv_notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `inv_roles`
--

LOCK TABLES `inv_roles` WRITE;
/*!40000 ALTER TABLE `inv_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `inv_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `inv_semitrucks`
--

LOCK TABLES `inv_semitrucks` WRITE;
/*!40000 ALTER TABLE `inv_semitrucks` DISABLE KEYS */;
/*!40000 ALTER TABLE `inv_semitrucks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `inv_sprinters`
--

LOCK TABLES `inv_sprinters` WRITE;
/*!40000 ALTER TABLE `inv_sprinters` DISABLE KEYS */;
/*!40000 ALTER TABLE `inv_sprinters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `inv_support_vendors`
--

LOCK TABLES `inv_support_vendors` WRITE;
/*!40000 ALTER TABLE `inv_support_vendors` DISABLE KEYS */;
/*!40000 ALTER TABLE `inv_support_vendors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `inv_tiresizes`
--

LOCK TABLES `inv_tiresizes` WRITE;
/*!40000 ALTER TABLE `inv_tiresizes` DISABLE KEYS */;
/*!40000 ALTER TABLE `inv_tiresizes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `inv_trailer_types`
--

LOCK TABLES `inv_trailer_types` WRITE;
/*!40000 ALTER TABLE `inv_trailer_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `inv_trailer_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `inv_trailers`
--

LOCK TABLES `inv_trailers` WRITE;
/*!40000 ALTER TABLE `inv_trailers` DISABLE KEYS */;
/*!40000 ALTER TABLE `inv_trailers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `inv_unit_reservations`
--

LOCK TABLES `inv_unit_reservations` WRITE;
/*!40000 ALTER TABLE `inv_unit_reservations` DISABLE KEYS */;
/*!40000 ALTER TABLE `inv_unit_reservations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `inv_units`
--

LOCK TABLES `inv_units` WRITE;
/*!40000 ALTER TABLE `inv_units` DISABLE KEYS */;
/*!40000 ALTER TABLE `inv_units` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `inv_units_to_equipment`
--

LOCK TABLES `inv_units_to_equipment` WRITE;
/*!40000 ALTER TABLE `inv_units_to_equipment` DISABLE KEYS */;
/*!40000 ALTER TABLE `inv_units_to_equipment` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`192.168.1%.%`*/ /*!50003 TRIGGER `tms`.`inv_units_to_equipment_BEFORE_INSERT` BEFORE INSERT ON `inv_units_to_equipment` FOR EACH ROW
BEGIN
	IF (SELECT DateRemoved FROM inv_units_to_equipment WHERE EquipmentId = New.EquipmentId ORDER BY DateAdded ASC LIMIT 1) IS NULL
    THEN 
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'This equiptment is already used in a different unit.';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`192.168.1%.%`*/ /*!50003 TRIGGER `tms`.`inv_units_to_equipment_BEFORE_UPDATE` BEFORE UPDATE ON `inv_units_to_equipment` FOR EACH ROW
BEGIN
	IF (OLD.UnitId <> NEW.UnitId OR OLD.EquipmentId <> NEW.EquipmentId OR OLD.DateAdded <> NEW.DateAdded <> (OLD.DateRemoved IS NOT NULL AND OLD.DateRemoved <> NEW.DateRemoved))
    THEN 
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Updating one or more of the columns is not allowed.';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping data for table `inv_vehicles`
--

LOCK TABLES `inv_vehicles` WRITE;
/*!40000 ALTER TABLE `inv_vehicles` DISABLE KEYS */;
/*!40000 ALTER TABLE `inv_vehicles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `msg_access`
--

LOCK TABLES `msg_access` WRITE;
/*!40000 ALTER TABLE `msg_access` DISABLE KEYS */;
INSERT INTO `msg_access` VALUES (1,'read');
/*!40000 ALTER TABLE `msg_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `msg_notes`
--

LOCK TABLES `msg_notes` WRITE;
/*!40000 ALTER TABLE `msg_notes` DISABLE KEYS */;
INSERT INTO `msg_notes` VALUES (3,'note to user','this is s note to the user','2020-03-13 10:34:36',7,'ent_people',15,1,NULL),(5,'note of address','this address is great','2020-03-13 10:58:20',7,'cnt_addresses',7,1,NULL);
/*!40000 ALTER TABLE `msg_notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `sft_elog_stats`
--

LOCK TABLES `sft_elog_stats` WRITE;
/*!40000 ALTER TABLE `sft_elog_stats` DISABLE KEYS */;
/*!40000 ALTER TABLE `sft_elog_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `sft_ifta`
--

LOCK TABLES `sft_ifta` WRITE;
/*!40000 ALTER TABLE `sft_ifta` DISABLE KEYS */;
/*!40000 ALTER TABLE `sft_ifta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `sft_inspection_schedules`
--

LOCK TABLES `sft_inspection_schedules` WRITE;
/*!40000 ALTER TABLE `sft_inspection_schedules` DISABLE KEYS */;
/*!40000 ALTER TABLE `sft_inspection_schedules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `sft_log_entries`
--

LOCK TABLES `sft_log_entries` WRITE;
/*!40000 ALTER TABLE `sft_log_entries` DISABLE KEYS */;
/*!40000 ALTER TABLE `sft_log_entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `sft_logbooks`
--

LOCK TABLES `sft_logbooks` WRITE;
/*!40000 ALTER TABLE `sft_logbooks` DISABLE KEYS */;
/*!40000 ALTER TABLE `sft_logbooks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `sft_vehicle_inspect_items`
--

LOCK TABLES `sft_vehicle_inspect_items` WRITE;
/*!40000 ALTER TABLE `sft_vehicle_inspect_items` DISABLE KEYS */;
INSERT INTO `sft_vehicle_inspect_items` VALUES (1,'Brakes',NULL),(3,'BrakesAdjustment',NULL),(5,'BrakesMechanicalComponent',NULL),(7,'BrakesDrumRotor',NULL),(9,'BrakesHoseTubing',NULL),(11,'BrakesLining',NULL),(13,'BrakesAntilockSystem',NULL),(15,'BrakesAutomaticAdjusters',NULL),(17,'BrakesLowAirWarning',NULL),(19,'BrakesTrailerAirSupply',NULL),(21,'BrakesCompressor',NULL),(23,'BrakesParkingBrakes',NULL),(25,'BrakesOther',NULL),(27,'Couplers',NULL),(29,'CouplersFifthWheelMount',NULL),(31,'CouplersPinUpperPlate',NULL),(33,'CouplersPintleHookEye',NULL),(35,'CouplersSafetyChains',NULL),(37,'Exhaust',NULL),(39,'ExhaustLeaks',NULL),(41,'ExhaustPlacement',NULL),(43,'Lighting',NULL),(45,'LightingHeadlights',NULL),(47,'LightingTailStop',NULL),(49,'LightingClearanceMarker',NULL),(51,'LightingIdentification',NULL),(53,'LightingReflectors',NULL),(55,'LightingOther',NULL),(57,'CabBody',NULL),(59,'CabBodyAccess',NULL),(61,'CabBodyEqptLoadSecure',NULL),(63,'CabBodyTieDowns',NULL),(65,'CabBodyHeaderboard',NULL),(67,'CabBodyMotorcoachSeats',NULL),(69,'CabBodyOther',NULL),(71,'Steering',NULL),(73,'SteeringAdjustment',NULL),(75,'SteeringColumnGear',NULL),(77,'SteeringAxle',NULL),(79,'SteeringLinkage',NULL),(81,'SteeringPowerSteering',NULL),(83,'SteeringOther',NULL),(85,'FuelSystem',NULL),(87,'FuelSystemTanks',NULL),(89,'FuelSystemLines',NULL),(91,'Suspension',NULL),(93,'SuspensionSprings',NULL),(95,'SuspensionAttachments',NULL),(97,'SuspensionSliders',NULL),(99,'Mirrors',NULL),(101,'Frame',NULL),(103,'FrameMembers',NULL),(105,'FrameClearance',NULL),(107,'Tires',NULL),(109,'TiresTread',NULL),(111,'TiresInflation',NULL),(113,'TiresDamage',NULL),(115,'TiresSpeedRestrictions',NULL),(117,'TiresOther',NULL),(119,'WheelsRim',NULL),(121,'WheelsRimFasteners',NULL),(123,'WheelsRimDiskSpoke',NULL),(125,'Windshield',NULL),(127,'WindshieldWipers',NULL);
/*!40000 ALTER TABLE `sft_vehicle_inspect_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `sft_vehicle_inspect_proofs`
--

LOCK TABLES `sft_vehicle_inspect_proofs` WRITE;
/*!40000 ALTER TABLE `sft_vehicle_inspect_proofs` DISABLE KEYS */;
/*!40000 ALTER TABLE `sft_vehicle_inspect_proofs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `sft_vehicle_inspected_items`
--

LOCK TABLES `sft_vehicle_inspected_items` WRITE;
/*!40000 ALTER TABLE `sft_vehicle_inspected_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `sft_vehicle_inspected_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `sft_vehicle_inspections`
--

LOCK TABLES `sft_vehicle_inspections` WRITE;
/*!40000 ALTER TABLE `sft_vehicle_inspections` DISABLE KEYS */;
/*!40000 ALTER TABLE `sft_vehicle_inspections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `sft_vehicle_registration`
--

LOCK TABLES `sft_vehicle_registration` WRITE;
/*!40000 ALTER TABLE `sft_vehicle_registration` DISABLE KEYS */;
/*!40000 ALTER TABLE `sft_vehicle_registration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `tmp_relations_clsr`
--

LOCK TABLES `tmp_relations_clsr` WRITE;
/*!40000 ALTER TABLE `tmp_relations_clsr` DISABLE KEYS */;
/*!40000 ALTER TABLE `tmp_relations_clsr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `tmp_relations_nodes`
--

LOCK TABLES `tmp_relations_nodes` WRITE;
/*!40000 ALTER TABLE `tmp_relations_nodes` DISABLE KEYS */;
/*!40000 ALTER TABLE `tmp_relations_nodes` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`192.168.1%.%`*/ /*!50003 TRIGGER `tms`.`tmp_relations_nodes_AFTER_INSERT` AFTER INSERT ON `tmp_relations_nodes` FOR EACH ROW
BEGIN
	INSERT INTO 
		tmp_relations_clsr (AncestorId, DescendantId, Depth) 
    SELECT 
		AncestorId, NEW.RelNodeId, Depth + 1
	FROM 
		tmp_relations_clsr 
	WHERE 
		DescendantId = NEW.ParentId
	UNION ALL 
		SELECT 
			NEW.RelNodeId, NEW.RelNodeId, 0;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`192.168.1%.%`*/ /*!50003 TRIGGER `tms`.`tmp_relations_nodes_AFTER_UPDATE` AFTER UPDATE ON `tmp_relations_nodes` FOR EACH ROW
BEGIN
	DELETE a FROM tmp_relations_clsr AS a 
    JOIN tmp_relations_clsr AS d 
		ON a.DescendantId = d.DescendantId
    LEFT JOIN tmp_relations_clsr AS x 
		ON x.AncestorId = d.AncestorId 
		AND x.DescendantId = a.AncestorId 
    WHERE d.AncestorId = OLD.RelNodeId 
		AND x.AncestorId IS NULL;
               
	INSERT INTO tmp_relations_clsr (AncestorId, DescendantId, Depth)
    SELECT 
		sup.AncestorId, sub.DescendantId, sup.Depth + sub.Depth+1
	FROM 
		tmp_relations_clsr AS sup JOIN tmp_relations_clsr AS sub 
               
	WHERE 
		sub.AncestorId = OLD.RelNodeId
        AND sup.DescendantId = NEW.ParentId;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`192.168.1%.%`*/ /*!50003 TRIGGER `tms`.`tmp_relations_nodes_BEFORE_DELETE` BEFORE DELETE ON `tmp_relations_nodes` FOR EACH ROW
BEGIN
DELETE b FROM
			tmp_relations_clsr a,
            tmp_relations_clsr b
		WHERE 
			b.AncestorId = OLD.RelNodeId OR
            b.DescendantId = OLD.RelNodeId OR
            (a.AncestorId = OLD.RelNodeId AND a.DescendantId = b.DescendantId);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping data for table `tsk_actns`
--

LOCK TABLES `tsk_actns` WRITE;
/*!40000 ALTER TABLE `tsk_actns` DISABLE KEYS */;
/*!40000 ALTER TABLE `tsk_actns` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`192.168.1%.%`*/ /*!50003 TRIGGER `tms`.`tsk_actns_BEFORE_INSERT` BEFORE INSERT ON `tsk_actns` FOR EACH ROW
BEGIN
 INSERT IGNORE INTO tsk_resps (tskid,PrsnId,role) VALUES (NEW.tskid,NEW.PrsnId,"Task Executor");
 UPDATE tsk_times SET finished=now(),duration= timediff(now(),started),fulllength =  UNIX_TIMESTAMP(now()) - UNIX_TIMESTAMP(started) WHERE ISNULL(finished) AND  PrsnId=NEW.PrsnId;
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
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`192.168.1%.%`*/ /*!50003 TRIGGER `tms`.`tsk_actns_AFTER_INSERT` AFTER INSERT ON `tsk_actns` FOR EACH ROW
BEGIN
 insert into tsk_times (actid,PrsnId) values (NEW.actid, NEW.PrsnId);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping data for table `tsk_alrms`
--

LOCK TABLES `tsk_alrms` WRITE;
/*!40000 ALTER TABLE `tsk_alrms` DISABLE KEYS */;
/*!40000 ALTER TABLE `tsk_alrms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `tsk_ntfis`
--

LOCK TABLES `tsk_ntfis` WRITE;
/*!40000 ALTER TABLE `tsk_ntfis` DISABLE KEYS */;
/*!40000 ALTER TABLE `tsk_ntfis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `tsk_resps`
--

LOCK TABLES `tsk_resps` WRITE;
/*!40000 ALTER TABLE `tsk_resps` DISABLE KEYS */;
/*!40000 ALTER TABLE `tsk_resps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `tsk_tasks`
--

LOCK TABLES `tsk_tasks` WRITE;
/*!40000 ALTER TABLE `tsk_tasks` DISABLE KEYS */;
/*!40000 ALTER TABLE `tsk_tasks` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`192.168.1%.%`*/ /*!50003 TRIGGER `tms`.`tsk_tasks_AFTER_INSERT` AFTER INSERT ON `tsk_tasks` FOR EACH ROW
BEGIN
INSERT INTO tsk_trees (ancestor, descendant, length)
    SELECT
         ancestor,
         new.tskid,
         length+1
    FROM
         tsk_trees
    WHERE
        descendant = new.prjid
    UNION ALL
    SELECT new.tskid, new.tskid, 0;
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
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`192.168.1%.%`*/ /*!50003 TRIGGER `tms`.`tsk_tasks_AFTER_UPDATE` AFTER UPDATE ON `tsk_tasks` FOR EACH ROW
BEGIN
     DELETE a FROM tsk_trees AS a
        JOIN tsk_trees AS d ON a.descendant = d.descendant
        LEFT JOIN tsk_trees AS x
        ON x.ancestor = d.ancestor AND x.descendant = a.ancestor
     WHERE d.ancestor = NEW.tskid AND x.ancestor IS NULL;

    INSERT INTO tsk_trees (ancestor, descendant, length)
        SELECT
            supertree.ancestor,
            subtree.descendant,
            supertree.length+subtree.length + 1
        FROM
            tsk_trees AS supertree JOIN tsk_trees AS subtree
        WHERE
            subtree.ancestor = NEW.tskid
            AND
            supertree.descendant = NEW.prjid;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping data for table `tsk_times`
--

LOCK TABLES `tsk_times` WRITE;
/*!40000 ALTER TABLE `tsk_times` DISABLE KEYS */;
/*!40000 ALTER TABLE `tsk_times` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `tsk_trees`
--

LOCK TABLES `tsk_trees` WRITE;
/*!40000 ALTER TABLE `tsk_trees` DISABLE KEYS */;
/*!40000 ALTER TABLE `tsk_trees` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-25 14:37:38
