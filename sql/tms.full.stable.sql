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
-- Current Database: `tms`
--

/*!40000 DROP DATABASE IF EXISTS `tms`*/;

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `tms` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `tms`;

--
-- Table structure for table `app_account_locks`
--

DROP TABLE IF EXISTS `app_account_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_account_locks` (
  `AccLockId` bigint(20) unsigned NOT NULL,
  `AppAccountId` bigint(20) unsigned NOT NULL,
  `IPAddress` int(11) NOT NULL,
  `LoginAttempts` int(11) unsigned NOT NULL DEFAULT '0',
  `Locked` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `DateLastAttempt` datetime DEFAULT NULL,
  PRIMARY KEY (`AccLockId`),
  KEY `idx_app_account_logins_IPAddress` (`IPAddress`),
  KEY `idx_app_account_logins_LoginAttempts` (`LoginAttempts`),
  KEY `idx_app_account_logins_Locked` (`Locked`),
  KEY `idx_app_account_logins_DateLastAttempt` (`DateLastAttempt`),
  KEY `AppAccLoginAccountRef_idx` (`AppAccountId`),
  CONSTRAINT `AppAccLoginAccountRef` FOREIGN KEY (`AppAccountId`) REFERENCES `app_accounts` (`AppAccountId`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_account_locks`
--

LOCK TABLES `app_account_locks` WRITE;
/*!40000 ALTER TABLE `app_account_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_account_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_account_logins`
--

DROP TABLE IF EXISTS `app_account_logins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_account_logins` (
  `AccLoginId` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `AppAccountId` bigint(20) unsigned NOT NULL,
  `IPAddress` int(11) unsigned NOT NULL,
  `DateLogin` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Type` enum('Login','Logout') NOT NULL DEFAULT 'Login',
  PRIMARY KEY (`AccLoginId`),
  KEY `AppAccLoginsAccountRef_idx` (`AppAccountId`),
  KEY `idx_app_account_logins_IPAddress` (`IPAddress`),
  KEY `idx_app_account_logins_DateLogin` (`DateLogin`),
  KEY `idx_app_account_logins_Type` (`Type`),
  CONSTRAINT `AppAccLoginsAccountRef` FOREIGN KEY (`AppAccountId`) REFERENCES `app_accounts` (`AppAccountId`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='tracks when the account logged in and logged out';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_account_logins`
--

LOCK TABLES `app_account_logins` WRITE;
/*!40000 ALTER TABLE `app_account_logins` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_account_logins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_accounts`
--

DROP TABLE IF EXISTS `app_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_accounts` (
  `AppAccountId` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `UserId` bigint(20) unsigned NOT NULL,
  `PasswordHash` varchar(64) NOT NULL,
  `Salt` varchar(64) NOT NULL,
  `Username` varchar(64) NOT NULL,
  `DateCreated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Locked` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`AppAccountId`),
  UNIQUE KEY `Username_UNIQUE` (`Username`),
  KEY `idx_app_accounts_UserId` (`UserId`),
  KEY `idx_app_accounts_PasswordHash` (`PasswordHash`),
  KEY `idx_app_accounts_Salt` (`Salt`),
  KEY `idx_app_accounts_Username` (`Username`),
  KEY `idx_app_accounts_DateCreated` (`DateCreated`),
  KEY `idx_app_accounts_Locked` (`Locked`),
  CONSTRAINT `AppAccountUserRef` FOREIGN KEY (`UserId`) REFERENCES `hr_associates` (`AstId`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_accounts`
--

LOCK TABLES `app_accounts` WRITE;
/*!40000 ALTER TABLE `app_accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_features`
--

DROP TABLE IF EXISTS `app_features`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_features` (
  `AppFeatureId` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `Name` varchar(64) NOT NULL,
  `Notes` text COMMENT 'Dev Notes',
  PRIMARY KEY (`AppFeatureId`),
  UNIQUE KEY `Name_UNIQUE` (`Name`),
  KEY `idx_app_features_Name` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Maps features to routes which then can be mapped to permissions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_features`
--

LOCK TABLES `app_features` WRITE;
/*!40000 ALTER TABLE `app_features` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_features` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_menu_items`
--

DROP TABLE IF EXISTS `app_menu_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_menu_items` (
  `MenuItemId` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `ParentId` bigint(20) unsigned DEFAULT NULL,
  `Label` varchar(32) NOT NULL,
  `Title` varchar(1024) DEFAULT NULL,
  `Icon` varchar(1024) DEFAULT NULL,
  `Route` varchar(1024) NOT NULL DEFAULT 'tms.app.error',
  `Help` text,
  `SortIndex` decimal(6,3) DEFAULT '0.000',
  `Enabled` tinyint(1) unsigned DEFAULT '1',
  `Target` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`MenuItemId`),
  UNIQUE KEY `Label_UNIQUE` (`Label`),
  KEY `MenuItemParentRef_idx` (`ParentId`),
  KEY `idx_app_menu_items_Label` (`Label`),
  KEY `idx_app_menu_items_Title` (`Title`),
  KEY `idx_app_menu_items_Enabled` (`Enabled`),
  KEY `idx_app_menu_items_Icon` (`Icon`),
  KEY `idx_app_menu_items_SortIndex` (`SortIndex`),
  KEY `idx_app_menu_items_Route` (`Route`),
  KEY `idx_app_menu_items_Target` (`Target`),
  CONSTRAINT `MenuItemParentRef` FOREIGN KEY (`ParentId`) REFERENCES `app_menu_items` (`MenuItemId`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=244 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_menu_items`
--

LOCK TABLES `app_menu_items` WRITE;
/*!40000 ALTER TABLE `app_menu_items` DISABLE KEYS */;
INSERT INTO `app_menu_items` VALUES (1,NULL,'my stuff',NULL,NULL,'tmsapp.main.error',NULL,0.000,1,'mainnav'),(3,NULL,'trip managment',NULL,NULL,'tmsapp.main.trpmgmt',NULL,0.040,1,'mainnav'),(5,NULL,'finances',NULL,NULL,'tmsapp.main.fin',NULL,0.300,1,'mainnav'),(7,NULL,'safety',NULL,NULL,'tmsapp.main.safety',NULL,0.045,1,'mainnav'),(9,NULL,'administration',NULL,'sdfsd','tmsapp.main.admin',NULL,0.100,1,'mainnav'),(11,1,'dashboard','dashboard','imgs/icons.svg#bargraph','tmsapp.main.dashboard',NULL,0.000,1,'mainnav'),(13,1,'calendar','calendar','imgs/icons.svg#calendar','tmsapp.main.calendar',NULL,0.100,1,'mainnav'),(15,3,'trucks','trucks','imgs/icons.svg#vehicle','tmsapp.main.trpmgmt.trucks',NULL,0.000,1,'mainnav'),(17,3,'loads','loads','imgs/icons.svg#boxes','tmsapp.main.trpmgmt.loads.availability',NULL,0.100,1,'mainnav'),(23,15,'my trucks','my trucks',NULL,'tmsapp.main.trpmgmt.trucks.mytrucks',NULL,0.300,1,'topnav'),(25,17,'available','available',NULL,'tmsapp.main.trpmgmt.loads.available',NULL,0.000,1,'topnav'),(27,17,'en route','en route',NULL,'tmsapp.main.trpmgmt.loads.enroute',NULL,0.100,1,'topnav'),(29,17,'pending','pending',NULL,'tmsapp.main.trpmgmt.loads.pending',NULL,0.200,1,'topnav'),(31,17,'build a load','build a load',NULL,'tmsapp.main.trpmgmt.loads.buildaload',NULL,0.300,1,'mainnav'),(33,17,'archives','archives',NULL,'tmsapp.main.trpmgmt.loads.archives',NULL,0.400,1,'mainnav'),(35,9,'users','users','imgs/icons.svg#users','tmsapp.main.admin.users',NULL,0.000,1,'mainnav'),(37,9,'groups','groups',NULL,'tmsapp.main.error',NULL,0.100,0,'mainnav'),(39,9,'reporting','reporting','imgs/icons.svg#globe','tmsapp.main.admin.webadmin',NULL,0.200,1,'mainnav'),(72,NULL,'human resources',NULL,NULL,'tms.app.hr',NULL,0.050,1,'mainnav'),(74,72,'personnel','View Personnel','imgs/icons.svg#addressbook','tmsapp.main.hr.prsnl.ops',NULL,0.000,1,'mainnav'),(119,5,'invoices',NULL,'imgs/icons.svg#document-solid','tmsapp.main.fin.invoice',NULL,0.000,1,'mainnav'),(121,5,'settlements',NULL,'imgs/icons.svg#dollar-sign','tmsapp.main.fin.settlments',NULL,0.000,1,'mainnav'),(123,15,'view map',NULL,NULL,'tmsapp.main.trpmgmt.trucks.map',NULL,0.000,1,'mainnav'),(125,15,'my team','my team',NULL,'tmsapp.main.trpmgmt.trucks.myteam',NULL,0.200,1,'topnav'),(127,15,'all trucks','all trucks',NULL,'tmsapp.main.trpmgmt.trucks.all',NULL,0.100,1,'topnav'),(129,17,'public load boards','public load boards',NULL,'tmsapp.main.trpmgmt.loads.public',NULL,0.350,1,'mainnav'),(187,5,'accounting',NULL,'imgs/icons.svg#book','tmsapp.main.fin.chargeitems',NULL,9.000,1,'mainnav'),(189,187,'generate',NULL,NULL,'tmsapp.main.fin.chargeitems.generate',NULL,0.100,1,'topnav'),(213,74,'operators','list of operators',NULL,'tmsapp.main.hr.prsnl.ops.list',NULL,0.000,1,'topnav'),(215,74,'associates','list of all associates',NULL,'tmsapp.main.hr.prsnl.asc',NULL,1.000,1,'topnav'),(217,74,'employees','list of all employees',NULL,'tmsapp.main.hr.prsnl.emp',NULL,2.000,1,'topnav'),(219,7,'inventory','list of all equipment','imgs/icons.svg#briefcase','tmsapp.main.safety.inv',NULL,1.000,1,'mainnav'),(221,7,'maintenance',NULL,'imgs/icons.svg#tools','tms.app.error',NULL,2.000,1,'mainnav'),(223,7,'expirations',NULL,'imgs/icons.svg#exclamation-triangle','tms.app.error',NULL,3.000,1,'mainnav'),(225,219,'register truck',NULL,NULL,'tmsapp.main.safety.inv.regtruck',NULL,1.000,1,'mainnav'),(227,219,'register trailer',NULL,NULL,'tmsapp.main.safety.inv.regtrailer',NULL,2.000,1,'mainnav'),(229,219,'vehicles','all vehicles registered',NULL,'tmsapp.main.safety.inv.vehicles',NULL,1.000,1,'topnav'),(231,219,'other assets','all other assets registered in the system',NULL,'tmsapp.main.safety.inv.assets',NULL,2.000,1,'topnav'),(233,72,'businesses','all the businesses','imgs/icons.svg#buildings','tmsapp.main.hr.biz',NULL,2.000,1,'mainnav'),(235,233,'register carrier','register a new carrier business',NULL,'tmsapp.main.hr.biz.carrier.form',NULL,1.000,1,'mainnav'),(237,233,'carriers','list of carriers',NULL,'tmsapp.main.hr.biz.carrier.list',NULL,1.000,1,'topnav'),(239,233,'customers','list of customers',NULL,'tms.app.error',NULL,0.000,1,'topnav'),(241,233,'vendors','list of vendors','','tms.app.error',NULL,0.000,1,'topnav'),(243,233,'other','list of everyone else',NULL,'tmsapp.main.hr.biz.other.list',NULL,0.000,1,'topnav');
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
-- Table structure for table `app_menu_items_trees`
--

DROP TABLE IF EXISTS `app_menu_items_trees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_menu_items_trees` (
  `AncestorId` bigint(20) unsigned NOT NULL,
  `DescendantId` bigint(20) unsigned NOT NULL,
  `Depth` int(11) unsigned NOT NULL,
  PRIMARY KEY (`AncestorId`,`DescendantId`),
  KEY `MenuItemTreeDescendantRef_idx` (`DescendantId`),
  KEY `idx_app_menu_items_trees_Depth` (`Depth`),
  CONSTRAINT `MenuItemTreeAncestorRef` FOREIGN KEY (`AncestorId`) REFERENCES `app_menu_items` (`MenuItemId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `MenuItemTreeDescendantRef` FOREIGN KEY (`DescendantId`) REFERENCES `app_menu_items` (`MenuItemId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_menu_items_trees`
--

LOCK TABLES `app_menu_items_trees` WRITE;
/*!40000 ALTER TABLE `app_menu_items_trees` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_menu_items_trees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `app_menu_items_with_depth`
--

DROP TABLE IF EXISTS `app_menu_items_with_depth`;
/*!50001 DROP VIEW IF EXISTS `app_menu_items_with_depth`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `app_menu_items_with_depth` AS SELECT 
 1 AS `MenuItemId`,
 1 AS `ParentId`,
 1 AS `Label`,
 1 AS `Title`,
 1 AS `Icon`,
 1 AS `Route`,
 1 AS `Help`,
 1 AS `SortIndex`,
 1 AS `Enabled`,
 1 AS `Path`,
 1 AS `Depth`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `app_permissions`
--

DROP TABLE IF EXISTS `app_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_permissions` (
  `PermissionId` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `Feature` bigint(20) unsigned NOT NULL,
  `AccessName` varchar(64) NOT NULL,
  PRIMARY KEY (`PermissionId`),
  KEY `AppPermissionFeatureRef_idx` (`Feature`),
  KEY `idx_app_permissions_Name` (`AccessName`),
  CONSTRAINT `AppPermissionFeatureRef` FOREIGN KEY (`Feature`) REFERENCES `app_features` (`AppFeatureId`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Table that holds different permissions for features offered by the application';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_permissions`
--

LOCK TABLES `app_permissions` WRITE;
/*!40000 ALTER TABLE `app_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_role_menus`
--

DROP TABLE IF EXISTS `app_role_menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_role_menus` (
  `RoleMenuBranchId` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `RoleId` bigint(20) unsigned NOT NULL,
  `MenuItemId` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`RoleMenuBranchId`),
  UNIQUE KEY `UniqMenuRole` (`RoleId`,`MenuItemId`),
  KEY `RoleToMenuRef_idx` (`RoleId`),
  KEY `MenuToRoleRef_idx` (`MenuItemId`),
  CONSTRAINT `MenuToRoleRef` FOREIGN KEY (`MenuItemId`) REFERENCES `app_menu_items` (`MenuItemId`) ON UPDATE CASCADE,
  CONSTRAINT `RoleToMenuRef` FOREIGN KEY (`RoleId`) REFERENCES `app_roles` (`RoleId`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_role_menus`
--

LOCK TABLES `app_role_menus` WRITE;
/*!40000 ALTER TABLE `app_role_menus` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_role_menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_role_permissions`
--

DROP TABLE IF EXISTS `app_role_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_role_permissions` (
  `RoleVsPermId` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `Role` bigint(20) unsigned NOT NULL,
  `Permission` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`RoleVsPermId`),
  UNIQUE KEY `RoleVsPermUnq` (`Role`,`Permission`),
  KEY `RolePermissionPermissionRef_idx` (`Permission`),
  CONSTRAINT `RolePermissionPermissionRef` FOREIGN KEY (`Permission`) REFERENCES `app_permissions` (`PermissionId`) ON UPDATE CASCADE,
  CONSTRAINT `RolePermissionRoleRef` FOREIGN KEY (`Role`) REFERENCES `app_roles` (`RoleId`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_role_permissions`
--

LOCK TABLES `app_role_permissions` WRITE;
/*!40000 ALTER TABLE `app_role_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_role_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_roles`
--

DROP TABLE IF EXISTS `app_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_roles` (
  `RoleId` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `RoleName` varchar(255) NOT NULL,
  `Description` text COMMENT 'Brief description of the purpose of the role',
  `UserDefined` tinyint(1) unsigned DEFAULT '1',
  `Editable` tinyint(1) unsigned DEFAULT '1',
  `CreatedBy` bigint(20) unsigned DEFAULT NULL,
  `UpdatedBy` bigint(20) unsigned DEFAULT NULL,
  `DateCreated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DateUpdated` datetime DEFAULT NULL,
  PRIMARY KEY (`RoleId`),
  UNIQUE KEY `Name_UNIQUE` (`RoleName`),
  KEY `AppRoleCreatorRef_idx` (`CreatedBy`),
  KEY `AppRoleUpdaterRef_idx` (`UpdatedBy`),
  KEY `idx_app_roles_UserDefined` (`UserDefined`),
  KEY `idx_app_roles_Editable` (`Editable`),
  KEY `idx_app_roles_DateCreated` (`DateCreated`),
  KEY `idx_app_roles_DateUpdated` (`DateUpdated`),
  CONSTRAINT `AppRoleCreatorRef` FOREIGN KEY (`CreatedBy`) REFERENCES `hr_associates` (`AstId`) ON UPDATE CASCADE,
  CONSTRAINT `AppRoleUpdaterRef` FOREIGN KEY (`UpdatedBy`) REFERENCES `hr_associates` (`AstId`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_roles`
--

LOCK TABLES `app_roles` WRITE;
/*!40000 ALTER TABLE `app_roles` DISABLE KEYS */;
INSERT INTO `app_roles` VALUES (1,'Admin','Website Admin, full Access to everything.',0,0,NULL,NULL,'2019-05-20 17:15:46',NULL);
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
-- Table structure for table `app_roles_assigned`
--

DROP TABLE IF EXISTS `app_roles_assigned`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_roles_assigned` (
  `RolePermitId` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `AppAccountId` bigint(20) unsigned NOT NULL,
  `RoleId` bigint(20) unsigned NOT NULL,
  `ValidFrom` datetime NOT NULL,
  `ValidUntill` datetime DEFAULT NULL,
  `RoleAssignedBy` bigint(20) unsigned NOT NULL,
  `RoleAssignedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`RolePermitId`),
  KEY `PermittedRoleRef_idx` (`RoleId`),
  KEY `AccountToRoleRef_idx` (`AppAccountId`),
  KEY `ManagerRef_idx` (`RoleAssignedBy`),
  KEY `idx_app_roles_assigned_ValidFrom` (`ValidFrom`),
  KEY `idx_app_roles_assigned_ValidUntill` (`ValidUntill`),
  KEY `idx_app_roles_assigned_RoleAssignedDate` (`RoleAssignedDate`),
  CONSTRAINT `AccountToRoleRef` FOREIGN KEY (`AppAccountId`) REFERENCES `app_accounts` (`AppAccountId`) ON UPDATE CASCADE,
  CONSTRAINT `ManagerRef` FOREIGN KEY (`RoleAssignedBy`) REFERENCES `hr_associates` (`AstId`) ON UPDATE CASCADE,
  CONSTRAINT `PermittedRoleRef` FOREIGN KEY (`RoleId`) REFERENCES `app_roles` (`RoleId`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Roles permitted or assigned to the user';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_roles_assigned`
--

LOCK TABLES `app_roles_assigned` WRITE;
/*!40000 ALTER TABLE `app_roles_assigned` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_roles_assigned` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `biz_branches`
--

DROP TABLE IF EXISTS `biz_branches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `biz_branches` (
  `BrnchId` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `OfficeName` varchar(255) NOT NULL DEFAULT '',
  `BizId` bigint(20) unsigned NOT NULL,
  `BrnchAddress` bigint(20) unsigned NOT NULL,
  `BrnchPhone` bigint(20) unsigned NOT NULL,
  `BrnchFax` bigint(20) unsigned DEFAULT NULL,
  `BrnchEMail` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`BrnchId`),
  KEY `idx_biz_branches_OfficeName` (`OfficeName`),
  KEY `BrnchAddrRef_idx` (`BrnchAddress`),
  KEY `BrnchPhoneRef_idx` (`BrnchPhone`),
  KEY `BrnchFaxRef_idx` (`BrnchFax`),
  KEY `idx_biz_branches_BrnchEMail` (`BrnchEMail`),
  KEY `BrnchBizNameRef_idx` (`BizId`),
  KEY `UniqBranch` (`OfficeName`,`BizId`,`BrnchAddress`),
  CONSTRAINT `BrnchAddress` FOREIGN KEY (`BrnchAddress`) REFERENCES `cnt_addresses` (`AddrId`) ON UPDATE CASCADE,
  CONSTRAINT `BrnchBizNameRef` FOREIGN KEY (`BizId`) REFERENCES `ent_businesses` (`BizId`) ON UPDATE CASCADE,
  CONSTRAINT `BrnchFaxRef` FOREIGN KEY (`BrnchFax`) REFERENCES `cnt_phonesfaxes` (`PhnFaxId`) ON UPDATE CASCADE,
  CONSTRAINT `BrnchPhoneRef` FOREIGN KEY (`BrnchPhone`) REFERENCES `cnt_phonesfaxes` (`PhnFaxId`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3821 DEFAULT CHARSET=utf8 COMMENT='Office Branch Details';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `biz_branches`
--

LOCK TABLES `biz_branches` WRITE;
/*!40000 ALTER TABLE `biz_branches` DISABLE KEYS */;
INSERT INTO `biz_branches` VALUES (3801,'California Head Quarters',253,3935,4255,4257,'info@uskoinc.com'),(3803,'',255,3941,4259,4291,NULL),(3805,'',257,3943,4265,NULL,NULL),(3809,'Sunrise Blvd and Douglas Rd',265,3949,4269,NULL,NULL),(3813,'Texas Office',271,3953,4273,NULL,NULL),(3815,'Royalty Financial',275,3955,4289,4287,'info@uskoinc.com'),(3819,'Texas Head Quarters',253,3840,4255,4257,'sdfsd@sadfsad.com');
/*!40000 ALTER TABLE `biz_branches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `biz_company_nodes`
--

DROP TABLE IF EXISTS `biz_company_nodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `biz_company_nodes` (
  `NodeId` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `ParentId` bigint(20) unsigned DEFAULT NULL,
  `UnitName` varchar(255) NOT NULL,
  `Type` enum('Department','Office','Team','Group','Other') NOT NULL DEFAULT 'Other',
  PRIMARY KEY (`NodeId`),
  UNIQUE KEY `UniqBizUnitName` (`UnitName`,`Type`),
  KEY `BizParentRef_idx` (`ParentId`),
  KEY `BizName_inx` (`UnitName`),
  KEY `idx_biz_company_nodes_Type` (`Type`),
  CONSTRAINT `BizCompanyParentNodeRef` FOREIGN KEY (`ParentId`) REFERENCES `biz_company_nodes` (`NodeId`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=402 DEFAULT CHARSET=utf8 COMMENT='Holds the nodes for the structure of the client/user company hierarchy ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `biz_company_nodes`
--

LOCK TABLES `biz_company_nodes` WRITE;
/*!40000 ALTER TABLE `biz_company_nodes` DISABLE KEYS */;
INSERT INTO `biz_company_nodes` VALUES (395,NULL,'Dispatchers','Other'),(397,395,'Express','Other'),(399,NULL,'Executive Office','Other'),(401,NULL,'IT','Other');
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
-- Table structure for table `biz_company_trees`
--

DROP TABLE IF EXISTS `biz_company_trees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `biz_company_trees` (
  `Ans_Des_Id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `AncestorId` bigint(20) unsigned NOT NULL,
  `DescendantId` bigint(20) unsigned NOT NULL,
  `Depth` int(11) unsigned NOT NULL,
  PRIMARY KEY (`Ans_Des_Id`),
  UNIQUE KEY `idx_biz_company_trees_unq` (`AncestorId`,`DescendantId`),
  KEY `idx_biz_company_trees_Depth` (`Depth`),
  KEY `CompanyTreeDescendantNodeRef_idx` (`DescendantId`),
  CONSTRAINT `CompanyTreeAncestorNodeRef` FOREIGN KEY (`AncestorId`) REFERENCES `biz_company_nodes` (`NodeId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `CompanyTreeDescendantNodeRef` FOREIGN KEY (`DescendantId`) REFERENCES `biz_company_nodes` (`NodeId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=134 DEFAULT CHARSET=utf8 COMMENT='Holds the tree for the structure of the heirarchy of the client/user company';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `biz_company_trees`
--

LOCK TABLES `biz_company_trees` WRITE;
/*!40000 ALTER TABLE `biz_company_trees` DISABLE KEYS */;
INSERT INTO `biz_company_trees` VALUES (123,395,395,0),(125,395,397,1),(127,397,397,0),(131,399,399,0),(133,401,401,0);
/*!40000 ALTER TABLE `biz_company_trees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmm_assignments`
--

DROP TABLE IF EXISTS `cmm_assignments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmm_assignments` (
  `AssociateId` bigint(20) unsigned NOT NULL,
  `CommissionPackage` varchar(255) NOT NULL,
  `DateAdded` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `AddedBy` bigint(20) unsigned NOT NULL,
  KEY `CommissionAssignmentGroupRef_idx` (`CommissionPackage`),
  KEY `CommissionAssignmentAssociateRef_idx` (`AssociateId`),
  KEY `idx_cmm_assignments_DateAdded` (`DateAdded`),
  KEY `CommissionAssignmentCreatorRef_idx` (`AddedBy`),
  CONSTRAINT `CommissionAssignmentAssociateRef` FOREIGN KEY (`AssociateId`) REFERENCES `hr_associates` (`AstId`) ON UPDATE CASCADE,
  CONSTRAINT `CommissionAssignmentCreatorRef` FOREIGN KEY (`AddedBy`) REFERENCES `hr_associates` (`AstId`) ON UPDATE CASCADE,
  CONSTRAINT `CommissionAssignmentPackageRef` FOREIGN KEY (`CommissionPackage`) REFERENCES `cmm_packages` (`Name`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmm_assignments`
--

LOCK TABLES `cmm_assignments` WRITE;
/*!40000 ALTER TABLE `cmm_assignments` DISABLE KEYS */;
/*!40000 ALTER TABLE `cmm_assignments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmm_assignments_customers`
--

DROP TABLE IF EXISTS `cmm_assignments_customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmm_assignments_customers` (
  `AssociateId` bigint(20) unsigned NOT NULL,
  `CommissionPackage` varchar(255) NOT NULL,
  `DateAdded` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `AddedBy` bigint(20) unsigned NOT NULL,
  `CustomerId` bigint(20) unsigned NOT NULL,
  KEY `CommAssignCustPackageRef_idx` (`CommissionPackage`),
  KEY `CommAssignCustCustomerRef_idx` (`CustomerId`),
  KEY `CommAssignCustAssociateRef_idx` (`AssociateId`),
  KEY `idx_cmm_assignments_customers_DateAdded` (`DateAdded`),
  KEY `CommAssignCustCreatedByRef_idx` (`AddedBy`),
  CONSTRAINT `CommAssignCustAssociateRef` FOREIGN KEY (`AssociateId`) REFERENCES `hr_associates` (`AstId`) ON UPDATE CASCADE,
  CONSTRAINT `CommAssignCustCreatedByRef` FOREIGN KEY (`AddedBy`) REFERENCES `hr_associates` (`AstId`) ON UPDATE CASCADE,
  CONSTRAINT `CommAssignCustCustomerRef` FOREIGN KEY (`CustomerId`) REFERENCES `ent_customers` (`CstmrId`) ON UPDATE CASCADE,
  CONSTRAINT `CommAssignCustPackageRef` FOREIGN KEY (`CommissionPackage`) REFERENCES `cmm_packages` (`Name`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Commission assignments based on customer	';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmm_assignments_customers`
--

LOCK TABLES `cmm_assignments_customers` WRITE;
/*!40000 ALTER TABLE `cmm_assignments_customers` DISABLE KEYS */;
/*!40000 ALTER TABLE `cmm_assignments_customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmm_assignments_groups`
--

DROP TABLE IF EXISTS `cmm_assignments_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmm_assignments_groups` (
  `AssociateId` bigint(20) unsigned NOT NULL,
  `CommissionPackage` varchar(255) NOT NULL,
  `DateAdded` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `AddedBy` bigint(20) unsigned NOT NULL,
  KEY `CommAssignmentGroupPackageRef_idx` (`CommissionPackage`),
  KEY `CommAssignmentGroupCreatorRef_idx` (`AddedBy`),
  KEY `CommAssignmentGroupAssociateRef_idx` (`AssociateId`),
  KEY `idx_cmm_assignments_groups_DateAdded` (`DateAdded`),
  CONSTRAINT `CommAssignmentGroupAssociateRef` FOREIGN KEY (`AssociateId`) REFERENCES `hr_associates` (`AstId`) ON UPDATE CASCADE,
  CONSTRAINT `CommAssignmentGroupCreatorRef` FOREIGN KEY (`AddedBy`) REFERENCES `hr_associates` (`AstId`) ON UPDATE CASCADE,
  CONSTRAINT `CommAssignmentGroupPackageRef` FOREIGN KEY (`CommissionPackage`) REFERENCES `cmm_packages` (`Name`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmm_assignments_groups`
--

LOCK TABLES `cmm_assignments_groups` WRITE;
/*!40000 ALTER TABLE `cmm_assignments_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `cmm_assignments_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmm_package_tiers`
--

DROP TABLE IF EXISTS `cmm_package_tiers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmm_package_tiers` (
  `TierId` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `Package` varchar(255) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Percentage` decimal(5,2) unsigned NOT NULL,
  `Threshold` decimal(12,2) DEFAULT NULL COMMENT 'The minimum amount required for the tier to be in effect',
  PRIMARY KEY (`TierId`),
  UNIQUE KEY `PkgVsTierUnq` (`Package`,`Name`),
  KEY `CommissionPackagePackageRef_idx` (`Package`),
  KEY `idx_cmm_package_tiers_Percentage` (`Percentage`),
  KEY `idx_cmm_package_tiers_Name` (`Name`),
  KEY `idx_cmm_package_tiers_Threshold` (`Threshold`),
  CONSTRAINT `CommissionPackagePackageRef` FOREIGN KEY (`Package`) REFERENCES `cmm_packages` (`Name`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmm_package_tiers`
--

LOCK TABLES `cmm_package_tiers` WRITE;
/*!40000 ALTER TABLE `cmm_package_tiers` DISABLE KEYS */;
/*!40000 ALTER TABLE `cmm_package_tiers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmm_packages`
--

DROP TABLE IF EXISTS `cmm_packages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmm_packages` (
  `Name` varchar(255) NOT NULL,
  PRIMARY KEY (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmm_packages`
--

LOCK TABLES `cmm_packages` WRITE;
/*!40000 ALTER TABLE `cmm_packages` DISABLE KEYS */;
/*!40000 ALTER TABLE `cmm_packages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cnt_addresses`
--

DROP TABLE IF EXISTS `cnt_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cnt_addresses` (
  `AddrId` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `Street1` varchar(64) NOT NULL COMMENT 'Street or P.O. Box',
  `Street2` varchar(64) NOT NULL DEFAULT '' COMMENT 'Street',
  `Street3` varchar(64) NOT NULL DEFAULT '',
  `City` varchar(64) NOT NULL,
  `State` char(2) NOT NULL,
  `Zip` char(11) NOT NULL,
  `Country` varchar(255) NOT NULL DEFAULT 'USA',
  `GpsLng` double DEFAULT NULL,
  `GpsLat` double DEFAULT NULL,
  `Notes` text,
  PRIMARY KEY (`AddrId`),
  UNIQUE KEY `UnqAddr` (`Country`,`State`,`Zip`,`City`,`Street1`,`Street2`,`Street3`),
  KEY `idx_cnt_addresses_Street2` (`Street2`),
  KEY `idx_cnt_addresses_City` (`City`),
  KEY `idx_cnt_addresses_Zip` (`Zip`),
  KEY `idx_cnt_addresses_Street3` (`Street3`),
  KEY `idx_cnt_addresses_GpsLng` (`GpsLng`),
  KEY `idx_cnt_addresses_GpsLat` (`GpsLat`),
  KEY `idx_cnt_addresses_State` (`State`),
  KEY `idx_cnt_addresses_Country` (`Country`),
  KEY `idx_cnt_addresses_Street1` (`Street1`)
) ENGINE=InnoDB AUTO_INCREMENT=3956 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cnt_addresses`
--

LOCK TABLES `cnt_addresses` WRITE;
/*!40000 ALTER TABLE `cnt_addresses` DISABLE KEYS */;
INSERT INTO `cnt_addresses` VALUES (1,'12344 Fake Street','','','Antelope','','55555','USA',NULL,NULL,NULL),(3764,'Ut In Reprehenderit Molestiae Quo Id.','Ut Modi Repellendus Quia Laudantium. Odit Recusandae Consequatur','Omnis Consectetur Ex Enim Nam Nesciunt Provident. Voluptatibus T','Cumque Quos Adipisci Doloremque.','TX','98690-9361','Canada',9451.56,7425.48,'Fuga vel est eligendi quos deleniti consequuntur qui non.'),(3768,'Magni Aut Dolores Similique. Ad Et Quis Odio Deleniti Earum Labo','Reprehenderit Minus Sunt Rem Fugiat Rerum Natus Rem.','Nisi Enim Est Tempore Et Voluptas Qui Quia Veniam. Assumenda Acc','Corporis Exercitationem Repudiandae Non. Voluptatibus Qui Qui At','VT','63520-8542','United States',5575.04,5004.2,'Qui et voluptatem quia facilis quibusdam cum ea. Rerum et consequuntur repudiandae molestiae alias.'),(3772,'Corporis Sequi Maiores Omnis Aut. Voluptate Nam Accusamus Itaque','Minima Et Et Ex Esse Dolorem Corporis. Ut Eos Dignissimos Repell','Culpa Quia Qui Alias. Minima Quibusdam Blanditiis Unde Magni.','Totam Nihil Eaque Iusto. Aliquam Commodi Dignissimos Accusamus E','HI','93430-1603','Canada',9133.22,2673.8,'Placeat deserunt qui et consequuntur eum. Modi eius natus praesentium minus quae quos nobis. Est culpa aut quod eum aut architecto voluptas neque.'),(3800,'Expedita Ut Suscipit Asperiores Qui Tenetur Molestiae Qui.','Repellat Voluptatem Fugiat Voluptatem Voluptate Aliquam.','Alias Recusandae Odio Illum. Suscipit Consectetur Facilis Et Tem','Nobis Eos Eum Esse Enim Est. Saepe Deleniti Distinctio Odit. Dol','WV','61796-8481','Canada',5925.27,3586.33,'Adipisci quidem omnis sit sunt qui dolores voluptas. Voluptatem magni iusto labore alias.'),(3804,'Dolorum Libero Quo Est Vero. Quae Nulla Dolores Porro.','Reprehenderit Sed Quo Impedit Accusantium Itaque Velit In. Corru','Sunt Vitae Doloribus Culpa. Tempore Eos Nihil Nostrum Et Consequ','Quae Accusamus Sit Eos Quod Sed Aut.','VT','30553-2890','Canada',2838.1,9523.48,'Sunt modi sint velit est nesciunt. Laboriosam iusto enim soluta nihil assumenda ipsum.'),(3820,'Ipsam Inventore Ullam Omnis Voluptatum.','Natus Atque Consectetur Velit Laudantium Eaque Fugit Perferendis','Porro Atque Quos Nesciunt Et Vitae Dolorem. Illum Repellendus Et','Sequi Voluptatem Rerum Id Eius Earum. Eaque Eius Enim Beatae Qui','TN','62622-8741','United States',5306.99,297.53,'Animi facere sed minima qui inventore. Rerum qui perferendis quisquam. Provident eveniet maxime quia.'),(3824,'Et Voluptatem Est Ratione Nihil Autem Et Quasi. Quasi Vero Volup','Et Culpa Ex Hic Veritatis Quae Ea Id. Quia Sed Tempore Sed Dicta','Iure Hic Qui Cum Corporis Sit. Et Eius Officia Quia Exercitation','Voluptatem Nam Est Vero Impedit. Architecto Qui Qui Et.','ND','67898-6806','United States',9484.3,1056.18,'Explicabo reiciendis commodi sunt.'),(3828,'Vel Ullam Quis Quia.','In Molestiae Ut Praesentium Enim Inventore Velit Omnis. Deleniti','Ab Suscipit Quia Modi Commodi In.','Dicta Repellendus Possimus Doloribus Porro Sunt Eaque.','MI','84176-3533','United States',5937.31,5678.19,'Cupiditate accusamus ad eius hic.'),(3832,'Dolores Quasi Iste In Velit Id Cumque Sunt Placeat. Commodi Sint','Sapiente Qui Neque Quis Inventore Dolorem. Nobis Incidunt Est No','Et Tempora Sint Officiis Ratione. Ullam Reiciendis Et Enim. Hic','Nemo Molestias Repudiandae Qui Rem Aperiam. Facere Laborum Sit E','PA','60344-9832','United States',4004.4,1553.24,'Sunt est voluptas sint quasi voluptatem. Distinctio optio maiores quia saepe.'),(3836,'Maiores Optio Sit In Omnis. Vitae Placeat Quas Ab. Cum Qui Volup','Pariatur Blanditiis Ut Earum Veniam Ex.','Est Fugiat Magnam Consequatur Fugit Impedit Repellendus Voluptat','Occaecati Neque Illo Consequatur Et Ipsum Ratione Odio Placeat.','NE','30087-4287','Canada',9683.85,7360.14,'Voluptas qui aut dignissimos et quasi in commodi dolores. Aliquam sunt exercitationem ipsam officia at enim aut. Ea et iusto voluptatem et dolores magnam aspernatur reprehenderit.'),(3840,'Consequuntur Voluptatum Placeat Assumenda Consequatur Reiciendis','Qui Tenetur Doloremque Enim Debitis Adipisci Voluptatem. Molesti','Reiciendis Omnis Est Qui Eius Quibusdam Minus Sit.','Et Cupiditate Veniam Et Vel Omnis.','WY','48237-2874','Canada',1924.54,5654.7,'Voluptatibus et pariatur aut.'),(3846,'Unde Vero Dolor Nulla Nobis Iusto Ipsa Ut Est. Sed Vel Et Suscip','Maxime Nihil Nihil Modi Laudantium Voluptatibus Excepturi.','Esse Exercitationem Modi Ducimus. Ut Laboriosam Sed Rerum Dolore','Aut Omnis Et Quo Minus Possimus Rerum.','PA','96830-5124','United States',4814.75,1650.41,'Aut distinctio ut ullam nulla in ut.'),(3898,'Sint Debitis Rem Autem Vel. Eos Aut Corrupti Cupiditate Sint Eaq','Nobis Maxime Accusantium Maiores.','Ratione Iure Similique Aut Sint Quia Qui. Reprehenderit Rerum Cu','Corrupti Officiis Eaque Distinctio.','OK','64640-7762','Canada',6270.16,6652.13,'Sapiente omnis quos dicta in id error debitis ratione.'),(3900,'Hic In Delectus Eligendi Alias Ab Corrupti Perspiciatis. Dolores','Tempora Ea Libero Voluptatibus Molestias Animi Libero Iste. Est','Quas Eos Soluta Eum Nobis Quia Minus Asperiores.','Consequatur Amet Enim Ut Dolorem. Harum Et Et Quia Ab Ex Aperiam','NJ','65341-3932','Canada',2898.13,7036.85,'Sint consequatur repellendus error. Consequatur aut dignissimos nihil nulla. Ullam quas dolor in amet ex.'),(3902,'Illo Voluptas Suscipit Quia Sit. Deserunt Blanditiis Omnis Quasi','Ut Tenetur Ab Sed Quibusdam Accusantium Dignissimos Nobis. Enim','Iure Accusantium Laborum Aut Quia Sint Excepturi Voluptas.','Et Enim Inventore Et Quia Aliquam Consectetur Quo Laudantium. Es','WY','79469-7658','Canada',1444.45,4240.48,'Sint nesciunt quia excepturi corporis totam cumque. Alias quam rem voluptatem delectus quam. In vel rerum nihil.'),(3904,'Praesentium A Facilis Corrupti Distinctio Maiores Aut. Cum Corpo','Est Voluptatem Quas Dolorum Voluptatem Dolores. Perferendis Ut E','Quae Rerum Rerum Perferendis Officiis Ratione.','Magnam Velit Est Eveniet Sit Maxime Necessitatibus Occaecati. Ma','MA','27561-9954','United States',3757.63,5129.49,'Explicabo eligendi quia inventore at ea adipisci et. Minus pariatur non ea. Qui sed ex rerum et.'),(3919,'1234 MAIN CT','','','SAN FRANCISCO','CA','12345','USA',NULL,NULL,NULL),(3921,'1234 POINT Z CT','','','SAN FRANCISCO','CA','12345','USA',NULL,NULL,NULL),(3923,'ABC','HELLO','','HJKWHJ','CA','67629','USA',NULL,NULL,NULL),(3925,'ABC','HELLO','','HJKWHJ','FL','67629','USA',NULL,NULL,NULL),(3929,'35558 MAX AVE','','','SACRAMENTO','CA','88762','USA',NULL,NULL,NULL),(3935,'11290 POINT EAST DRIVE','STE 200','','RANCHO CORDOVA','CA','95742','USA',NULL,NULL,NULL),(3941,'3558 MADDIEWOOD CIR','','','SACRAMENTO','CA','95827','United States',NULL,NULL,NULL),(3943,'8130 LEYDEN ST','','','ELVERTA','CA','95626','USA',NULL,NULL,NULL),(3949,'4026 Sunrise Blvd','','','Rancho Cordova','CA','95742','USA',NULL,NULL,NULL),(3953,'17480 DALLAS PKWY','STE 124','','Dallas','TX','75287','USA',NULL,NULL,NULL),(3955,'14345 Victory Blvd','','','Van Nuys','CA','91411','USA',NULL,NULL,NULL);
/*!40000 ALTER TABLE `cnt_addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cnt_phonesfaxes`
--

DROP TABLE IF EXISTS `cnt_phonesfaxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cnt_phonesfaxes` (
  `PhnFaxId` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `Number` varchar(12) NOT NULL,
  `Extension` varchar(10) NOT NULL DEFAULT '0',
  `Features` set('VOICE','SMS','MMS','FAX') NOT NULL DEFAULT 'VOICE',
  `Mobility` enum('LAND LINE','MOBILE','SOFT PHONE') NOT NULL DEFAULT 'LAND LINE',
  `Notes` text,
  PRIMARY KEY (`PhnFaxId`),
  UNIQUE KEY `UnqNum` (`Number`,`Extension`),
  KEY `idx_cnt_phonesfaxes_Number` (`Number`) USING BTREE,
  KEY `idx_cnt_phonesfaxes_Extension` (`Extension`) USING BTREE,
  KEY `idx_cnt_phonesfaxes_Features` (`Features`) USING BTREE,
  KEY `idx_cnt_phonesfaxes_Mobility` (`Mobility`)
) ENGINE=InnoDB AUTO_INCREMENT=4293 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cnt_phonesfaxes`
--

LOCK TABLES `cnt_phonesfaxes` WRITE;
/*!40000 ALTER TABLE `cnt_phonesfaxes` DISABLE KEYS */;
INSERT INTO `cnt_phonesfaxes` VALUES (3974,'762-824-2352','98607*0509','SMS','MOBILE','Necessitatibus dolor deserunt tempore eaque.'),(3976,'918-378-0840','#84,**#363','SMS','SOFT PHONE','Illum enim quo iure aut fuga minus. Non sed sit nihil incidunt ut nisi asperiores maxime. Cum est eligendi cumque occaecati dolores sapiente vitae est.'),(3982,'382-030-4839','**21#*,##4','SMS,MMS','LAND LINE','Voluptatem nemo modi optio amet. Ipsum adipisci exercitationem quasi quasi consequuntur.'),(3984,'418-388-4783','0*64#43470','MMS,FAX','SOFT PHONE','Eius ipsam voluptate aut.'),(3990,'969-357-7270','018,8*5*15','VOICE,SMS,MMS,FAX','LAND LINE','Qui debitis ducimus corrupti beatae placeat.'),(3992,'298-082-6481','26#05#5439','SMS,MMS','SOFT PHONE','Optio blanditiis aut provident repellat tempore dolorem.'),(4028,'116-274-6116','40#5#68282','SMS,FAX','MOBILE','Sit sit voluptatem delectus. Et fugit quisquam perferendis. Et commodi reprehenderit assumenda quia a.'),(4030,'935-236-2187','6#220#8#84','VOICE,SMS,MMS,FAX','MOBILE','Veritatis velit et dolorem aut ratione.'),(4036,'264-230-3059','2500*#*,,9','SMS,MMS,FAX','MOBILE','Magni magni voluptatum quasi et cum. Et velit impedit vero nihil tempore ipsam qui est. Neque hic sequi excepturi dolor.'),(4038,'419-061-3999','512786*2#7','VOICE,SMS,MMS,FAX','MOBILE','Iste laboriosam optio exercitationem doloremque eaque voluptatem. Suscipit ex doloribus odit. Recusandae quis omnis aliquam fugiat dolores.'),(4086,'319-310-7211','1613143862','SMS','LAND LINE','Vel laborum rerum facere iusto.'),(4088,'301-264-8672','64#3327660','VOICE,FAX','SOFT PHONE','Pariatur debitis dolores cum ad maiores.'),(4094,'587-582-0072','56#3*#7936','FAX','LAND LINE','Hic perferendis nihil quaerat quisquam. In dolores possimus magnam. Eius provident quidem repellat veniam voluptatem aut blanditiis.'),(4096,'616-622-8955','4995341145','FAX','SOFT PHONE','Neque ea sunt et repellat voluptas nihil sequi. Dolorem quod quos sunt laudantium natus suscipit eaque. Saepe vero dolores odit quae sint quaerat nulla.'),(4102,'398-845-5037','9933,18,*6','VOICE,SMS,FAX','MOBILE','Provident earum expedita sint. Doloribus esse porro dolorem totam.'),(4104,'128-924-7809','7,866*9654','VOICE','LAND LINE','Vero est beatae quaerat similique atque laborum rem. Debitis aut hic atque rerum.'),(4110,'248-315-1753','8#617958#4','SMS,MMS,FAX','LAND LINE','In provident dolorem itaque voluptatem voluptas.'),(4112,'608-633-3721','3646,03354','VOICE,FAX','SOFT PHONE','Debitis provident excepturi sed odio. Est ex dolore qui impedit. Atque recusandae et non in minus enim ab quo.'),(4118,'343-693-3697','649194#7#0','VOICE,MMS,FAX','LAND LINE','Corporis atque ullam fuga quos enim.'),(4120,'394-819-9334','388*955446','MMS','MOBILE','Porro dolorem sed facilis aliquid cumque.'),(4126,'613-678-3141','5493363574','VOICE','SOFT PHONE','Rerum possimus unde sed optio natus. Voluptas voluptate aut eligendi fuga in ut.'),(4128,'788-991-2169','11*09,8*#8','VOICE','SOFT PHONE','Harum sequi molestiae est voluptatem quos. Similique quibusdam ut voluptas exercitationem.'),(4138,'597-155-5654','63,6#,,338','VOICE,MMS,FAX','LAND LINE','Eos iure velit a ut dolor ex quibusdam qui. Dolorum doloribus cum odit ipsa. Sequi reiciendis error voluptatibus vero autem quas.'),(4140,'868-083-5572','0791119494','VOICE,SMS,MMS,FAX','LAND LINE','Maiores reiciendis nemo harum quisquam. Eos est consequatur dolores nihil hic.'),(4198,'787-983-5692','85906#*8,6','VOICE,SMS,MMS,FAX','MOBILE','Odit quia autem eligendi harum nobis totam assumenda optio. Quia error molestias est nostrum. Corrupti ratione voluptatibus et reprehenderit qui voluptatibus numquam.'),(4200,'668-891-4055','2047293753','SMS,MMS','MOBILE','Neque velit perspiciatis similique voluptas non iure.'),(4202,'180-900-2566','*92,235543','VOICE,SMS,FAX','MOBILE','Voluptas asperiores impedit voluptas delectus et aut et perspiciatis.'),(4204,'344-280-2437','69570,7051','SMS,MMS,FAX','MOBILE','Et illum est officiis aut. Ad nesciunt distinctio voluptatum impedit explicabo sunt.'),(4206,'796-133-9327','2738005242','VOICE,MMS,FAX','MOBILE','Exercitationem nihil recusandae nemo quis doloribus. Itaque incidunt itaque et quis facere ut dolor sit.'),(4208,'744-981-1054','1,,#40*362','SMS','LAND LINE','Ducimus labore odio quam quas.'),(4210,'464-059-6382','4869,6#749','MMS,FAX','SOFT PHONE','Et impedit tempora sint hic cupiditate placeat nam autem. Sequi sapiente fugit ad tempora id. Sed et adipisci a dolor qui sint.'),(4212,'768-853-8546','*54,74*#76','SMS,FAX','MOBILE','Dolorum culpa ab placeat quo. Ea quasi quo sit nemo magni ea aut.'),(4214,'786-491-3038','0214*,9852','SMS,MMS','SOFT PHONE','Quia dicta ea inventore illo ducimus ut dignissimos et. Et excepturi est eveniet aliquam.'),(4216,'421-567-1640','*4##607#82','VOICE,MMS','SOFT PHONE','Eum dolorum molestias fugit. Sit harum illum libero omnis. Aut dolorum nisi quis inventore adipisci.'),(4218,'428-252-2894','**27080481','VOICE,SMS,MMS,FAX','MOBILE','Dolores illum ea culpa facere aut sapiente enim. Optio enim fugit veniam animi dolorem perferendis. Reprehenderit quisquam necessitatibus hic ipsum dolores quis harum amet.'),(4220,'601-539-9318','#85688,919','VOICE,SMS,MMS,FAX','LAND LINE','Quas ut ad ut ea deserunt corrupti. Iure velit ullam odio.'),(4221,'916-718-8451','0','VOICE','LAND LINE',NULL),(4223,'619-555-1212','0','VOICE','LAND LINE',NULL),(4255,'916-515-8065','0','VOICE','LAND LINE',NULL),(4257,'916-515-8066','0','VOICE','LAND LINE',NULL),(4259,'916-880-8506','0','VOICE','LAND LINE',NULL),(4261,'916-515-8065','1001','VOICE','LAND LINE',NULL),(4263,'916-515-8065','1009','VOICE','LAND LINE',NULL),(4265,'916-389-4508','0','VOICE','LAND LINE',NULL),(4269,'916-850-6884','0','VOICE','LAND LINE',NULL),(4273,'214-250-1011','0','VOICE','LAND LINE',NULL),(4275,'08023628','0','VOICE','LAND LINE',NULL),(4277,'08023608','0','VOICE','LAND LINE',NULL),(4279,'080236760','0','VOICE','LAND LINE',NULL),(4281,'080407240','0','VOICE','LAND LINE',NULL),(4283,'777-888-8888','0','VOICE','LAND LINE',NULL),(4287,'818-989-0208','0','FAX','LAND LINE',NULL),(4289,'818-989-0206','0','VOICE','LAND LINE',NULL),(4291,'916-880-8507','0','VOICE','LAND LINE',NULL);
/*!40000 ALTER TABLE `cnt_phonesfaxes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crr_ifta_decal`
--

DROP TABLE IF EXISTS `crr_ifta_decal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `crr_ifta_decal` (
  `DecalId` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `IftaAcctId` bigint(20) unsigned NOT NULL,
  `DecalNo` varchar(255) NOT NULL,
  `DecalImg` bigint(20) unsigned NOT NULL,
  `VehicleId` bigint(20) unsigned NOT NULL,
  `EffectiveDate` date NOT NULL,
  `ExpirationDate` date NOT NULL,
  `DateIssued` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`DecalId`),
  KEY `IftaDeclRef_idx` (`IftaAcctId`),
  KEY `DecalImfRef_idx` (`DecalImg`),
  KEY `IftaTruckRef_idx` (`VehicleId`),
  KEY `idx_crr_ifta_decal_DecalNo` (`DecalNo`),
  KEY `DecalIssuedBy_idx` (`CreatedBy`),
  KEY `idx_crr_ifta_decal_EffectiveDate` (`EffectiveDate`),
  KEY `idx_crr_ifta_decal_ExpirationDate` (`ExpirationDate`),
  KEY `idx_crr_ifta_decal_DateIssued` (`DateIssued`),
  CONSTRAINT `DecalImfRef` FOREIGN KEY (`DecalImg`) REFERENCES `gen_files` (`FileId`) ON UPDATE CASCADE,
  CONSTRAINT `DecalIssuedBy` FOREIGN KEY (`CreatedBy`) REFERENCES `hr_associates` (`AstId`) ON UPDATE CASCADE,
  CONSTRAINT `IftaDeclRef` FOREIGN KEY (`IftaAcctId`) REFERENCES `crr_iftas` (`IftaAcctId`) ON UPDATE CASCADE,
  CONSTRAINT `IftaTruckRef` FOREIGN KEY (`VehicleId`) REFERENCES `inv_vehicles` (`VehicleId`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crr_ifta_decal`
--

LOCK TABLES `crr_ifta_decal` WRITE;
/*!40000 ALTER TABLE `crr_ifta_decal` DISABLE KEYS */;
/*!40000 ALTER TABLE `crr_ifta_decal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crr_iftas`
--

DROP TABLE IF EXISTS `crr_iftas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `crr_iftas` (
  `IftaAcctId` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `State` char(2) NOT NULL,
  `IFTALicense` varchar(255) NOT NULL,
  `McAccount` varchar(255) NOT NULL,
  `ProofDoc` bigint(20) unsigned DEFAULT NULL,
  `Effective` date NOT NULL,
  `Expiration` date NOT NULL,
  `BizId` bigint(20) unsigned NOT NULL COMMENT 'Who pays for it',
  PRIMARY KEY (`IftaAcctId`),
  UNIQUE KEY `mcaccount_UNIQUE` (`McAccount`),
  UNIQUE KEY `IFTALicense_UNIQUE` (`IFTALicense`),
  KEY `IftaProofRef_idx` (`ProofDoc`),
  KEY `idx_crr_iftas_State` (`State`),
  KEY `idx_crr_iftas_Effective` (`Effective`),
  KEY `idx_crr_iftas_Expiration` (`Expiration`),
  KEY `IftaPayerBizRef_idx` (`BizId`),
  KEY `idx_crr_iftas_IFTALicense` (`IFTALicense`),
  KEY `idx_crr_iftas_McAccount` (`McAccount`),
  CONSTRAINT `IftaPayerBizRef` FOREIGN KEY (`BizId`) REFERENCES `ent_businesses` (`BizId`) ON UPDATE CASCADE,
  CONSTRAINT `IftaProofRef` FOREIGN KEY (`ProofDoc`) REFERENCES `gen_files` (`FileId`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crr_iftas`
--

LOCK TABLES `crr_iftas` WRITE;
/*!40000 ALTER TABLE `crr_iftas` DISABLE KEYS */;
INSERT INTO `crr_iftas` VALUES (1,'CA','changeme','changeme',NULL,'2019-01-01','2019-12-31',257);
/*!40000 ALTER TABLE `crr_iftas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crr_permit_account_docs`
--

DROP TABLE IF EXISTS `crr_permit_account_docs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `crr_permit_account_docs` (
  `PrmtRegDocId` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `CrrPrmtAccId` bigint(20) unsigned NOT NULL,
  `CrrPrmtAccDoc` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`PrmtRegDocId`),
  UNIQUE KEY `UniqPermitRegDoc` (`CrrPrmtAccId`,`CrrPrmtAccDoc`),
  KEY `PrmtRegAccDocRef_idx` (`CrrPrmtAccDoc`),
  CONSTRAINT `PrmtRegAccDocRef` FOREIGN KEY (`CrrPrmtAccDoc`) REFERENCES `gen_files` (`FileId`) ON UPDATE CASCADE,
  CONSTRAINT `PrmtRegAccRef` FOREIGN KEY (`CrrPrmtAccId`) REFERENCES `crr_permit_accounts` (`CrrPrmtAccId`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='State Registration Documents	';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crr_permit_account_docs`
--

LOCK TABLES `crr_permit_account_docs` WRITE;
/*!40000 ALTER TABLE `crr_permit_account_docs` DISABLE KEYS */;
/*!40000 ALTER TABLE `crr_permit_account_docs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crr_permit_accounts`
--

DROP TABLE IF EXISTS `crr_permit_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `crr_permit_accounts` (
  `CrrPrmtAccId` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `AccountNo` varchar(255) NOT NULL,
  `State` char(2) NOT NULL,
  `CarrierId` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`CrrPrmtAccId`),
  KEY `PermCarrRef_idx` (`CarrierId`),
  KEY `idx_crr_permit_accounts_AccountNo` (`AccountNo`),
  KEY `idx_crr_permit_accounts_State` (`State`),
  CONSTRAINT `PermCarrRef` FOREIGN KEY (`CarrierId`) REFERENCES `ent_carriers` (`CarrierId`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crr_permit_accounts`
--

LOCK TABLES `crr_permit_accounts` WRITE;
/*!40000 ALTER TABLE `crr_permit_accounts` DISABLE KEYS */;
INSERT INTO `crr_permit_accounts` VALUES (1,'ChangeMe','CA',257),(3,'FakeOne','OR',257);
/*!40000 ALTER TABLE `crr_permit_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crr_permit_images`
--

DROP TABLE IF EXISTS `crr_permit_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `crr_permit_images` (
  `PrmtImgId` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `StatePrmtId` bigint(20) unsigned NOT NULL,
  `PermtImageId` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`PrmtImgId`),
  UNIQUE KEY `StateUnqImage` (`StatePrmtId`,`PermtImageId`),
  KEY `StatePermRef_idx` (`StatePrmtId`),
  KEY `StatePermImg_idx` (`PermtImageId`),
  CONSTRAINT `StatePermImg` FOREIGN KEY (`PermtImageId`) REFERENCES `gen_files` (`FileId`) ON UPDATE CASCADE,
  CONSTRAINT `StatePermRef` FOREIGN KEY (`StatePrmtId`) REFERENCES `crr_state_permits` (`StatePrmtId`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crr_permit_images`
--

LOCK TABLES `crr_permit_images` WRITE;
/*!40000 ALTER TABLE `crr_permit_images` DISABLE KEYS */;
/*!40000 ALTER TABLE `crr_permit_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crr_state_permits`
--

DROP TABLE IF EXISTS `crr_state_permits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `crr_state_permits` (
  `StatePrmtId` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `CrrPrmtAccId` bigint(20) unsigned NOT NULL,
  `VehicleId` bigint(20) unsigned NOT NULL,
  `ReceiptNo` varchar(255) NOT NULL,
  `Effective` date NOT NULL,
  `Expired` date NOT NULL,
  `Issued` date NOT NULL,
  PRIMARY KEY (`StatePrmtId`),
  UNIQUE KEY `UniqVhclPermit` (`ReceiptNo`,`Effective`,`Expired`),
  KEY `PermAccRef_idx` (`CrrPrmtAccId`),
  KEY `PermVhclRef_idx` (`VehicleId`),
  KEY `idx_crr_state_permits_ReceiptNo` (`ReceiptNo`),
  KEY `idx_crr_state_permits_Effective` (`Effective`),
  KEY `idx_crr_state_permits_Expired` (`Expired`),
  KEY `idx_crr_state_permits_Issued` (`Issued`),
  CONSTRAINT `PermAccRef` FOREIGN KEY (`CrrPrmtAccId`) REFERENCES `crr_permit_accounts` (`CrrPrmtAccId`) ON UPDATE CASCADE,
  CONSTRAINT `PermVhclRef` FOREIGN KEY (`VehicleId`) REFERENCES `inv_vehicles` (`VehicleId`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crr_state_permits`
--

LOCK TABLES `crr_state_permits` WRITE;
/*!40000 ALTER TABLE `crr_state_permits` DISABLE KEYS */;
/*!40000 ALTER TABLE `crr_state_permits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drv_cdl_endorsements`
--

DROP TABLE IF EXISTS `drv_cdl_endorsements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `drv_cdl_endorsements` (
  `EndrsId` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `Endorsement` varchar(255) NOT NULL,
  `ValidFromDate` date NOT NULL,
  `ExpiredDate` date NOT NULL,
  PRIMARY KEY (`EndrsId`),
  KEY `idx_drv_cdl_endorsements_Endorsement` (`Endorsement`),
  KEY `idx_drv_cdl_endorsements_ValidFromDate` (`ValidFromDate`),
  KEY `idx_drv_cdl_endorsements_ExpiredDate` (`ExpiredDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drv_cdl_endorsements`
--

LOCK TABLES `drv_cdl_endorsements` WRITE;
/*!40000 ALTER TABLE `drv_cdl_endorsements` DISABLE KEYS */;
/*!40000 ALTER TABLE `drv_cdl_endorsements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drv_desttypes`
--

DROP TABLE IF EXISTS `drv_desttypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `drv_desttypes` (
  `DesiredDestId` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `DestName` varchar(255) NOT NULL,
  `Notes` text,
  PRIMARY KEY (`DesiredDestId`),
  KEY `idx_drv_desttypes_DestName` (`DestName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drv_desttypes`
--

LOCK TABLES `drv_desttypes` WRITE;
/*!40000 ALTER TABLE `drv_desttypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `drv_desttypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drv_driverlicences`
--

DROP TABLE IF EXISTS `drv_driverlicences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `drv_driverlicences` (
  `DrLcId` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `DriverId` bigint(20) unsigned NOT NULL,
  `DrLicNumber` varchar(255) NOT NULL,
  `DrLcDateValid` date NOT NULL,
  `DrLcDateExpired` date NOT NULL,
  `DrLcSate` char(2) NOT NULL,
  `DrLcEndorsement` bigint(20) unsigned DEFAULT NULL,
  `Photo` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`DrLcId`),
  KEY `LicToDriverRef_idx` (`DriverId`),
  KEY `EndorseRef_idx` (`DrLcEndorsement`),
  KEY `idx_drv_driverlicences_DrLicNumber` (`DrLicNumber`),
  KEY `idx_drv_driverlicences_DrLcDateExpired` (`DrLcDateExpired`),
  KEY `idx_drv_driverlicences_DrLcDateValid` (`DrLcDateValid`),
  KEY `DrLicPhoto_idx` (`Photo`),
  KEY `idx_drv_driverlicences_DrLcSate` (`DrLcSate`),
  CONSTRAINT `DrLicPhoto` FOREIGN KEY (`Photo`) REFERENCES `gen_files` (`FileId`) ON UPDATE CASCADE,
  CONSTRAINT `EndorseRef` FOREIGN KEY (`DrLcEndorsement`) REFERENCES `drv_cdl_endorsements` (`EndrsId`) ON UPDATE CASCADE,
  CONSTRAINT `LicToDriverRef` FOREIGN KEY (`DriverId`) REFERENCES `drv_drivers` (`DriverId`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drv_driverlicences`
--

LOCK TABLES `drv_driverlicences` WRITE;
/*!40000 ALTER TABLE `drv_driverlicences` DISABLE KEYS */;
/*!40000 ALTER TABLE `drv_driverlicences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drv_drivers`
--

DROP TABLE IF EXISTS `drv_drivers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `drv_drivers` (
  `DriverId` bigint(20) unsigned NOT NULL,
  `LocalRoutes` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `InternationalRoutes` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `LastAnnualReview` date DEFAULT NULL,
  `PullNotice` date DEFAULT NULL,
  PRIMARY KEY (`DriverId`),
  KEY `DriverPersonRef_idx` (`DriverId`),
  KEY `idx_drv_drivers_LocalRoutes` (`LocalRoutes`),
  KEY `idx_drv_drivers_InternationalRoutes` (`InternationalRoutes`),
  KEY `idx_drv_drivers_LastAnnualReview` (`LastAnnualReview`),
  KEY `idx_drv_drivers_PullNotice` (`PullNotice`),
  CONSTRAINT `DriverPersonRef` FOREIGN KEY (`DriverId`) REFERENCES `hr_associates` (`AstId`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drv_drivers`
--

LOCK TABLES `drv_drivers` WRITE;
/*!40000 ALTER TABLE `drv_drivers` DISABLE KEYS */;
/*!40000 ALTER TABLE `drv_drivers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drv_medcards`
--

DROP TABLE IF EXISTS `drv_medcards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `drv_medcards` (
  `MedCardId` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `DriverId` bigint(20) unsigned NOT NULL,
  `Photo` bigint(20) unsigned NOT NULL,
  `ExpirationDate` date DEFAULT NULL,
  PRIMARY KEY (`MedCardId`),
  KEY `MedPhotoRef_idx` (`Photo`),
  KEY `MedDriverRef_idx` (`DriverId`),
  KEY `idx_drv_medcards_ExpirationDate` (`ExpirationDate`),
  CONSTRAINT `MedDriverRef` FOREIGN KEY (`DriverId`) REFERENCES `drv_drivers` (`DriverId`) ON UPDATE CASCADE,
  CONSTRAINT `MedPhotoRef` FOREIGN KEY (`Photo`) REFERENCES `gen_files` (`FileId`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drv_medcards`
--

LOCK TABLES `drv_medcards` WRITE;
/*!40000 ALTER TABLE `drv_medcards` DISABLE KEYS */;
/*!40000 ALTER TABLE `drv_medcards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drv_schedules`
--

DROP TABLE IF EXISTS `drv_schedules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `drv_schedules` (
  `DrvSchdId` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `DriverId` bigint(20) unsigned NOT NULL,
  `ChangeDate` datetime NOT NULL,
  `DesiredDestId` bigint(20) unsigned NOT NULL,
  `DesiredDestNote` text,
  `PostedBy` bigint(20) unsigned NOT NULL,
  `PostedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`DrvSchdId`),
  KEY `SchToDrvRef_idx` (`DriverId`),
  KEY `DestIdRef_idx` (`DesiredDestId`),
  KEY `SchdUpdatedByRef_idx` (`PostedBy`),
  KEY `idx_drv_schedules_ChangeDate` (`ChangeDate`),
  KEY `idx_drv_schedules_PostedDate` (`PostedDate`),
  CONSTRAINT `DestIdRef` FOREIGN KEY (`DesiredDestId`) REFERENCES `drv_desttypes` (`DesiredDestId`) ON UPDATE CASCADE,
  CONSTRAINT `SchToDrvRef` FOREIGN KEY (`DriverId`) REFERENCES `drv_drivers` (`DriverId`) ON UPDATE CASCADE,
  CONSTRAINT `SchdUpdatedByRef` FOREIGN KEY (`PostedBy`) REFERENCES `hr_associates` (`AstId`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drv_schedules`
--

LOCK TABLES `drv_schedules` WRITE;
/*!40000 ALTER TABLE `drv_schedules` DISABLE KEYS */;
/*!40000 ALTER TABLE `drv_schedules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dsp_loads`
--

DROP TABLE IF EXISTS `dsp_loads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dsp_loads` (
  `LoadId` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `CreatedBy` bigint(20) unsigned NOT NULL,
  `BrokerId` bigint(20) unsigned NOT NULL,
  `ShipperId` bigint(20) unsigned DEFAULT NULL,
  `BookedBy` bigint(20) unsigned DEFAULT NULL,
  `DateCreated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DateBooked` datetime DEFAULT NULL,
  `LoadNumber` varchar(64) DEFAULT NULL,
  `ProNumber` varchar(16) DEFAULT NULL,
  `LoadType` enum('FTL','LTL','Partial') DEFAULT NULL,
  `TruckType` varchar(24) DEFAULT NULL COMMENT 'This is technically the trailer type for the load but will be called TruckType due to nomenclature used in office',
  `ReeferTempLow` decimal(5,2) DEFAULT NULL,
  `ReeferTempHigh` decimal(5,2) DEFAULT NULL,
  `Precooling` decimal(5,2) DEFAULT NULL,
  `TempMode` enum('continuous','start/stop') DEFAULT NULL,
  `TeamRequired` enum('yes','no') DEFAULT NULL,
  `DispatchNote` text,
  `Job` bigint(20) unsigned DEFAULT NULL,
  `GoogleRoute` text,
  `Status` varchar(45) DEFAULT NULL COMMENT 'Internal status for load, cancelled, tonu, etc.',
  `LoadRate` decimal(12,2) NOT NULL,
  PRIMARY KEY (`LoadId`),
  KEY `LoadsTrailerTypeRef_idx` (`TruckType`),
  KEY `LoadsBrokerRef_idx` (`BrokerId`),
  KEY `LoadsShipperRef_idx` (`ShipperId`),
  KEY `LoadsCreatedByRef_idx` (`CreatedBy`),
  KEY `LoadsBookedByRef_idx` (`BookedBy`),
  KEY `LoadsJobRef_idx` (`Job`),
  KEY `idx_dsp_loads_DateCreated` (`DateCreated`),
  KEY `idx_dsp_loads_DateBooked` (`DateBooked`),
  KEY `idx_dsp_loads_LoadNumber` (`LoadNumber`),
  KEY `idx_dsp_loads_ProNumber` (`ProNumber`),
  KEY `idx_dsp_loads_LoadType` (`LoadType`),
  KEY `idx_dsp_loads_TruckType` (`TruckType`),
  KEY `idx_dsp_loads_ReeferTempLow` (`ReeferTempLow`),
  KEY `idx_dsp_loads_ReeferTempHigh` (`ReeferTempHigh`),
  KEY `idx_dsp_loads_Precooling` (`Precooling`),
  KEY `idx_dsp_loads_TempMode` (`TempMode`),
  KEY `idx_dsp_loads_TeamRequired` (`TeamRequired`),
  KEY `idx_dsp_loads_Status` (`Status`),
  KEY `idx_dsp_loads_LoadRate` (`LoadRate`),
  CONSTRAINT `LoadsBookedByRef` FOREIGN KEY (`BookedBy`) REFERENCES `hr_associates` (`AstId`) ON UPDATE CASCADE,
  CONSTRAINT `LoadsBrokerRef` FOREIGN KEY (`BrokerId`) REFERENCES `ent_customers` (`CstmrId`) ON UPDATE CASCADE,
  CONSTRAINT `LoadsCreatedByRef` FOREIGN KEY (`CreatedBy`) REFERENCES `hr_associates` (`AstId`) ON UPDATE CASCADE,
  CONSTRAINT `LoadsJobRef` FOREIGN KEY (`Job`) REFERENCES `fin_jobs` (`JobId`) ON UPDATE CASCADE,
  CONSTRAINT `LoadsShipperRef` FOREIGN KEY (`ShipperId`) REFERENCES `ent_shippers` (`ShipperId`) ON UPDATE CASCADE,
  CONSTRAINT `LoadsTrailerTypeRef` FOREIGN KEY (`TruckType`) REFERENCES `inv_trailer_types` (`Name`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='tables of all loads in our system';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dsp_loads`
--

LOCK TABLES `dsp_loads` WRITE;
/*!40000 ALTER TABLE `dsp_loads` DISABLE KEYS */;
/*!40000 ALTER TABLE `dsp_loads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dsp_loads_destinations`
--

DROP TABLE IF EXISTS `dsp_loads_destinations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dsp_loads_destinations` (
  `DestinationId` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `LoadId` bigint(20) unsigned NOT NULL,
  `PU_PO` varchar(255) NOT NULL COMMENT 'PU#/PO# ????',
  `Commodity` varchar(255) NOT NULL,
  `Pallets` int(11) DEFAULT NULL,
  `Pieces` int(11) DEFAULT NULL,
  `Weight` float DEFAULT NULL,
  `AppointmentStart` datetime NOT NULL,
  `AppointmentEnd` datetime DEFAULT NULL,
  `AppointmentType` enum('Appointment','Time Open') NOT NULL,
  `StopOrder` int(11) NOT NULL DEFAULT '0',
  `StopType` enum('PickUp','DropOff') NOT NULL,
  `Branch` bigint(20) unsigned NOT NULL,
  `AppointmentNotes` text,
  PRIMARY KEY (`DestinationId`),
  KEY `LoadsDestinationsLoadRef_idx` (`LoadId`),
  KEY `LoadsDestinationsBranchRef_idx` (`Branch`),
  KEY `idx_dsp_loads_destinations_AppointmentStart` (`AppointmentStart`),
  KEY `idx_dsp_loads_destinations_AppointmentEnd` (`AppointmentEnd`),
  KEY `idx_dsp_loads_destinations_AppointmentType` (`AppointmentType`),
  KEY `idx_dsp_loads_destinations_Pallets` (`Pallets`),
  KEY `idx_dsp_loads_destinations_PU_PO` (`PU_PO`),
  KEY `idx_dsp_loads_destinations_Commodity` (`Commodity`),
  KEY `idx_dsp_loads_destinations_Pieces` (`Pieces`),
  KEY `idx_dsp_loads_destinations_Weight` (`Weight`),
  KEY `idx_dsp_loads_destinations_StopOrder` (`StopOrder`),
  KEY `idx_dsp_loads_destinations_StopType` (`StopType`),
  CONSTRAINT `LoadsDestinationsBranchRef` FOREIGN KEY (`Branch`) REFERENCES `biz_branches` (`BrnchId`) ON UPDATE CASCADE,
  CONSTRAINT `LoadsDestinationsLoadRef` FOREIGN KEY (`LoadId`) REFERENCES `dsp_loads` (`LoadId`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dsp_loads_destinations`
--

LOCK TABLES `dsp_loads_destinations` WRITE;
/*!40000 ALTER TABLE `dsp_loads_destinations` DISABLE KEYS */;
/*!40000 ALTER TABLE `dsp_loads_destinations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dsp_loads_destinations_docs`
--

DROP TABLE IF EXISTS `dsp_loads_destinations_docs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dsp_loads_destinations_docs` (
  `DestFileId` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `LoadDestinationId` bigint(20) unsigned NOT NULL,
  `FileId` bigint(20) unsigned NOT NULL,
  `Verified` enum('unknown','yes','no') NOT NULL,
  `ApprovedBy` bigint(20) unsigned NOT NULL,
  `FactoredDoc` tinyint(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`DestFileId`),
  UNIQUE KEY `LoadDestUnqDoc` (`LoadDestinationId`,`FileId`),
  KEY `LoadsTrackingDocsTrackingRef_idx` (`LoadDestinationId`),
  KEY `LoadsDestinationDocsApproverRef_idx` (`ApprovedBy`),
  KEY `idx_dsp_loads_destinations_docs_Verified` (`Verified`),
  KEY `LoadsDestinationDocsFileRef_idx` (`FileId`),
  KEY `idx_dsp_loads_destinations_docs_FactoredDoc` (`FactoredDoc`),
  CONSTRAINT `LoadsDestinationDocsApproverRef` FOREIGN KEY (`ApprovedBy`) REFERENCES `hr_associates` (`AstId`) ON UPDATE CASCADE,
  CONSTRAINT `LoadsDestinationDocsFileRef` FOREIGN KEY (`FileId`) REFERENCES `gen_files` (`FileId`) ON UPDATE CASCADE,
  CONSTRAINT `LoadsDestinationDocsTrackingRef` FOREIGN KEY (`LoadDestinationId`) REFERENCES `dsp_loads_destinations` (`DestinationId`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dsp_loads_destinations_docs`
--

LOCK TABLES `dsp_loads_destinations_docs` WRITE;
/*!40000 ALTER TABLE `dsp_loads_destinations_docs` DISABLE KEYS */;
/*!40000 ALTER TABLE `dsp_loads_destinations_docs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dsp_loads_dispatched`
--

DROP TABLE IF EXISTS `dsp_loads_dispatched`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dsp_loads_dispatched` (
  `LoadVsUnitId` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `LoadId` bigint(20) unsigned NOT NULL,
  `UnitId` bigint(20) unsigned NOT NULL,
  `DateDispatched` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DispatchedBy` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`LoadVsUnitId`),
  UNIQUE KEY `DspLoadUnitUNQ` (`LoadId`,`UnitId`),
  KEY `idx_dsp_loads_dispatched_DateAdded` (`DateDispatched`),
  KEY `DispacherRef_idx` (`DispatchedBy`),
  KEY `LoadsToUnitsUnitRef_idx` (`UnitId`),
  CONSTRAINT `DispacherRef` FOREIGN KEY (`DispatchedBy`) REFERENCES `hr_associates` (`AstId`) ON UPDATE CASCADE,
  CONSTRAINT `LoadsToUnitsLoadRef` FOREIGN KEY (`LoadId`) REFERENCES `dsp_loads` (`LoadId`) ON UPDATE CASCADE,
  CONSTRAINT `LoadsToUnitsUnitRef` FOREIGN KEY (`UnitId`) REFERENCES `inv_units` (`UnitId`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dsp_loads_dispatched`
--

LOCK TABLES `dsp_loads_dispatched` WRITE;
/*!40000 ALTER TABLE `dsp_loads_dispatched` DISABLE KEYS */;
/*!40000 ALTER TABLE `dsp_loads_dispatched` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dsp_loads_docs`
--

DROP TABLE IF EXISTS `dsp_loads_docs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dsp_loads_docs` (
  `DocsLoadId` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `FileId` bigint(20) unsigned NOT NULL,
  `LoadId` bigint(20) unsigned NOT NULL,
  `DateAdded` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `AddedBy` bigint(20) unsigned NOT NULL,
  `FactoredDoc` tinyint(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`DocsLoadId`),
  KEY `LoadsDocsPersonRef_idx` (`AddedBy`),
  KEY `idx_dsp_loads_docs_DateAdded` (`DateAdded`),
  KEY `LoadsDocsFileRef_idx` (`FileId`),
  KEY `LoadsDocsLoadRef_idx` (`LoadId`),
  KEY `idx_dsp_loads_docs_FactoredDoc` (`FactoredDoc`),
  CONSTRAINT `LoadsDocsFileRef` FOREIGN KEY (`FileId`) REFERENCES `gen_files` (`FileId`) ON UPDATE CASCADE,
  CONSTRAINT `LoadsDocsLoadRef` FOREIGN KEY (`LoadId`) REFERENCES `dsp_loads` (`LoadId`) ON UPDATE CASCADE,
  CONSTRAINT `LoadsDocsPersonRef` FOREIGN KEY (`AddedBy`) REFERENCES `hr_associates` (`AstId`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dsp_loads_docs`
--

LOCK TABLES `dsp_loads_docs` WRITE;
/*!40000 ALTER TABLE `dsp_loads_docs` DISABLE KEYS */;
/*!40000 ALTER TABLE `dsp_loads_docs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dsp_loads_required_equipment`
--

DROP TABLE IF EXISTS `dsp_loads_required_equipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dsp_loads_required_equipment` (
  `LoadsEquipId` bigint(64) unsigned NOT NULL,
  `LoadId` bigint(64) unsigned NOT NULL,
  `EquipmentType` bigint(64) unsigned NOT NULL,
  PRIMARY KEY (`LoadsEquipId`),
  KEY `LoadsReqEquipmentRef_idx` (`EquipmentType`),
  KEY `LoadsReqLoadRef_idx` (`LoadId`),
  CONSTRAINT `LoadsReqEquipmentRef` FOREIGN KEY (`EquipmentType`) REFERENCES `inv_equipment_types` (`EquipmentTypeId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `LoadsReqLoadRef` FOREIGN KEY (`LoadId`) REFERENCES `dsp_loads` (`LoadId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='list of equipment required for the load, will be used to search for trucks that satisfy the criteria ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dsp_loads_required_equipment`
--

LOCK TABLES `dsp_loads_required_equipment` WRITE;
/*!40000 ALTER TABLE `dsp_loads_required_equipment` DISABLE KEYS */;
/*!40000 ALTER TABLE `dsp_loads_required_equipment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dsp_loads_tracking`
--

DROP TABLE IF EXISTS `dsp_loads_tracking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dsp_loads_tracking` (
  `DestinationId` bigint(20) unsigned NOT NULL,
  `DriverId` bigint(20) unsigned NOT NULL,
  `DateArrived` datetime DEFAULT NULL,
  `DateDeparted` datetime DEFAULT NULL,
  `Pallets` int(11) DEFAULT NULL,
  `Weight` float DEFAULT NULL,
  `Pieces` int(11) DEFAULT NULL,
  `BolPod` enum('yes','no','na') NOT NULL DEFAULT 'na',
  `BolPodNumber` varchar(255) DEFAULT NULL,
  `SealNumber` varchar(255) DEFAULT NULL,
  `Notes` text,
  `ReeferTemp` decimal(5,2) DEFAULT NULL,
  `Status` varchar(64) NOT NULL,
  PRIMARY KEY (`DestinationId`),
  KEY `LoadsTrackingDriverRef_idx` (`DriverId`),
  KEY `idx_dsp_loads_tracking_DateArrived` (`DateArrived`),
  KEY `idx_dsp_loads_tracking_DateDeparted` (`DateDeparted`),
  KEY `idx_dsp_loads_tracking_Pallets` (`Pallets`),
  KEY `idx_dsp_loads_tracking_Weight` (`Weight`),
  KEY `idx_dsp_loads_tracking_Pieces` (`Pieces`),
  KEY `idx_dsp_loads_tracking_BolPod` (`BolPod`),
  KEY `idx_dsp_loads_tracking_BolPodNumber` (`BolPodNumber`),
  KEY `idx_dsp_loads_tracking_SealNumber` (`SealNumber`),
  KEY `idx_dsp_loads_tracking_ReeferTemp` (`ReeferTemp`),
  KEY `idx_dsp_loads_tracking_Status` (`Status`),
  CONSTRAINT `LoadsTrackingDesitinationRef` FOREIGN KEY (`DestinationId`) REFERENCES `dsp_loads_destinations` (`DestinationId`) ON UPDATE CASCADE,
  CONSTRAINT `LoadsTrackingDriverRef` FOREIGN KEY (`DriverId`) REFERENCES `drv_drivers` (`DriverId`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Entries of loads being delivered or recieved';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dsp_loads_tracking`
--

LOCK TABLES `dsp_loads_tracking` WRITE;
/*!40000 ALTER TABLE `dsp_loads_tracking` DISABLE KEYS */;
/*!40000 ALTER TABLE `dsp_loads_tracking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dsp_trips`
--

DROP TABLE IF EXISTS `dsp_trips`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dsp_trips` (
  `TripId` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'For financial purposes TripNumber === JobNumber, TripId === JobId',
  `CreatedBy` bigint(20) unsigned NOT NULL,
  `TripNumber` varchar(12) NOT NULL COMMENT 'For financial purposes TripNumber === JobNumber, TripId === JobId',
  `DateCreated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DateStarted` datetime DEFAULT NULL,
  `DateCompleted` datetime DEFAULT NULL,
  `DateBooked` datetime DEFAULT NULL,
  `DateDispatched` datetime DEFAULT NULL,
  `IsValid` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `TripStatus` enum('Pending','Dispatched','Complete','Other','TONU','Cancelled') NOT NULL,
  `Notes` text,
  `GoogleRoute` text,
  PRIMARY KEY (`TripId`),
  UNIQUE KEY `TripNumber_UNIQUE` (`TripNumber`),
  KEY `TripCreatedByRef_idx` (`CreatedBy`),
  KEY `idx_dsp_trips_TripNumber` (`TripNumber`),
  KEY `idx_dsp_trips_DateCreated` (`DateCreated`),
  KEY `idx_dsp_trips_DateStarted` (`DateStarted`),
  KEY `idx_dsp_trips_DateCompleted` (`DateCompleted`),
  KEY `idx_dsp_trips_DateBooked` (`DateBooked`),
  KEY `idx_dsp_trips_DateDispatched` (`DateDispatched`),
  KEY `idx_dsp_trips_IsValid` (`IsValid`),
  KEY `idx_dsp_trips_TripStatus` (`TripStatus`),
  CONSTRAINT `TripCreatedByRef` FOREIGN KEY (`CreatedBy`) REFERENCES `hr_associates` (`AstId`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dsp_trips`
--

LOCK TABLES `dsp_trips` WRITE;
/*!40000 ALTER TABLE `dsp_trips` DISABLE KEYS */;
/*!40000 ALTER TABLE `dsp_trips` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dsp_trips_loads`
--

DROP TABLE IF EXISTS `dsp_trips_loads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dsp_trips_loads` (
  `TripLoadId` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `TripId` bigint(20) unsigned NOT NULL,
  `LoadId` bigint(20) unsigned NOT NULL,
  `DateDispatched` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `LoadDispatcher` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`TripLoadId`),
  UNIQUE KEY `TripLoadUnq` (`TripId`,`LoadId`),
  KEY `idx_dsp_trips_loads_DateAdded` (`DateDispatched`),
  KEY `TripLoadsDispatcherRef_idx` (`LoadDispatcher`),
  KEY `TripsLoadsLoadRef_idx` (`LoadId`),
  CONSTRAINT `TripLoadsDispatcherRef` FOREIGN KEY (`LoadDispatcher`) REFERENCES `hr_associates` (`AstId`) ON UPDATE CASCADE,
  CONSTRAINT `TripsLoadsJobRef` FOREIGN KEY (`TripId`) REFERENCES `dsp_trips` (`TripId`) ON UPDATE CASCADE,
  CONSTRAINT `TripsLoadsLoadRef` FOREIGN KEY (`LoadId`) REFERENCES `dsp_loads` (`LoadId`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dsp_trips_loads`
--

LOCK TABLES `dsp_trips_loads` WRITE;
/*!40000 ALTER TABLE `dsp_trips_loads` DISABLE KEYS */;
/*!40000 ALTER TABLE `dsp_trips_loads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ent_blacklist`
--

DROP TABLE IF EXISTS `ent_blacklist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ent_blacklist` (
  `BlackListId` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `EntityId` bigint(20) unsigned NOT NULL,
  `DateCreated` datetime NOT NULL,
  `Creator` bigint(20) unsigned NOT NULL,
  `Reason` text NOT NULL,
  `Type` enum('public','private') NOT NULL DEFAULT 'private',
  PRIMARY KEY (`BlackListId`),
  KEY `DspBlacklistCreatorRef_idx` (`Creator`),
  KEY `idx_dsp_blacklist_DateCreated` (`DateCreated`),
  KEY `BadCstmrRef_idx` (`EntityId`),
  KEY `idx_ent_blacklist_Type` (`Type`),
  CONSTRAINT `BadCstmrRef` FOREIGN KEY (`EntityId`) REFERENCES `entities` (`EntityId`) ON UPDATE CASCADE,
  CONSTRAINT `DspBlacklistCreatorRef` FOREIGN KEY (`Creator`) REFERENCES `hr_associates` (`AstId`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Complaints about entities and why you should not do business with them';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ent_blacklist`
--

LOCK TABLES `ent_blacklist` WRITE;
/*!40000 ALTER TABLE `ent_blacklist` DISABLE KEYS */;
/*!40000 ALTER TABLE `ent_blacklist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ent_businesses`
--

DROP TABLE IF EXISTS `ent_businesses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ent_businesses` (
  `BizId` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `BizName` varchar(1024) NOT NULL,
  `BizURL` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`BizId`),
  UNIQUE KEY `BizName_UNIQUE` (`BizName`),
  KEY `idx_ent_businesses_BizName` (`BizName`) USING BTREE,
  KEY `idx_ent_businesses_BizURL` (`BizURL`)
) ENGINE=InnoDB AUTO_INCREMENT=276 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ent_businesses`
--

LOCK TABLES `ent_businesses` WRITE;
/*!40000 ALTER TABLE `ent_businesses` DISABLE KEYS */;
INSERT INTO `ent_businesses` VALUES (253,'Usko Express Inc','http://uskoinc.com'),(255,'Heavenly Cookies and More, LLC','www.heavenlycookiesandmore.com'),(257,'4 RINGS EXPRESS INC',NULL),(265,'JPMorgan Chase & Co','http://chase.com'),(271,'USKO LOGISTICS INC',NULL),(275,'Royalty Financial',NULL);
/*!40000 ALTER TABLE `ent_businesses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ent_carriers`
--

DROP TABLE IF EXISTS `ent_carriers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ent_carriers` (
  `CarrierId` bigint(20) unsigned NOT NULL,
  `MC` varchar(10) DEFAULT NULL,
  `McCertificatePhoto` bigint(20) unsigned DEFAULT NULL,
  `DOT` varchar(15) DEFAULT NULL,
  `CrType` enum('Company Carrier','Brokerage Only') DEFAULT NULL,
  `SCAC` varchar(4) DEFAULT NULL,
  `RateConfEmailAddress` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`CarrierId`),
  UNIQUE KEY `MC_UNIQUE` (`MC`),
  UNIQUE KEY `DOT_UNIQUE` (`DOT`),
  UNIQUE KEY `SCAC_UNIQUE` (`SCAC`),
  KEY `McCertRef_idx` (`McCertificatePhoto`),
  KEY `idx_ent_carriers_MC` (`MC`),
  KEY `idx_ent_carriers_CrType` (`CrType`),
  KEY `idx_ent_carriers_SCAC` (`SCAC`),
  KEY `idx_ent_carriers_RateConfEmailAddress` (`RateConfEmailAddress`),
  CONSTRAINT `CarrierBusinessRef` FOREIGN KEY (`CarrierId`) REFERENCES `ent_businesses` (`BizId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `McCertRef` FOREIGN KEY (`McCertificatePhoto`) REFERENCES `gen_files` (`FileId`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ent_carriers`
--

LOCK TABLES `ent_carriers` WRITE;
/*!40000 ALTER TABLE `ent_carriers` DISABLE KEYS */;
INSERT INTO `ent_carriers` VALUES (257,NULL,NULL,'USDOT3151801','Company Carrier',NULL,NULL),(271,'728260',NULL,'USDOT2337754','Company Carrier',NULL,NULL);
/*!40000 ALTER TABLE `ent_carriers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ent_customers`
--

DROP TABLE IF EXISTS `ent_customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ent_customers` (
  `CstmrId` bigint(20) unsigned NOT NULL,
  `MC` varchar(10) DEFAULT NULL COMMENT 'MC number',
  `DOT` varchar(15) DEFAULT NULL,
  `SCAC` varchar(255) DEFAULT NULL COMMENT 'SCACC',
  `Terms` varchar(255) DEFAULT NULL COMMENT 'Payment terms',
  `Factoring` enum('yes','no') DEFAULT NULL,
  `CreditLimit` decimal(10,2) unsigned DEFAULT NULL COMMENT 'Credit Limit',
  `Bond` varchar(64) DEFAULT NULL,
  `DUNS` char(9) DEFAULT NULL,
  `DontUse` enum('do not use','can use') DEFAULT NULL COMMENT 'Do not use',
  `WhyDontUse` text COMMENT 'Why do not use',
  `RequireOriginals` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`CstmrId`),
  UNIQUE KEY `MC_UNIQUE` (`MC`),
  UNIQUE KEY `DOT_UNIQUE` (`DOT`),
  UNIQUE KEY `SCAC_UNIQUE` (`SCAC`),
  KEY `idx_ent_customers_MC` (`MC`),
  KEY `idx_ent_customers_DOT` (`DOT`),
  KEY `idx_ent_customers_SCAC` (`SCAC`),
  KEY `idx_ent_customers_Terms` (`Terms`),
  KEY `idx_ent_customers_Factoring` (`Factoring`),
  KEY `idx_ent_customers_CreditLimit` (`CreditLimit`),
  KEY `idx_ent_customers_Bond` (`Bond`),
  KEY `idx_ent_customers_DUNS` (`DUNS`),
  KEY `idx_ent_customers_DontUse` (`DontUse`),
  KEY `idx_ent_customers_RequireOriginals` (`RequireOriginals`),
  CONSTRAINT `CustomerBusinessRef` FOREIGN KEY (`CstmrId`) REFERENCES `ent_businesses` (`BizId`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ent_customers`
--

LOCK TABLES `ent_customers` WRITE;
/*!40000 ALTER TABLE `ent_customers` DISABLE KEYS */;
/*!40000 ALTER TABLE `ent_customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `ent_dropdown_names`
--

DROP TABLE IF EXISTS `ent_dropdown_names`;
/*!50001 DROP VIEW IF EXISTS `ent_dropdown_names`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `ent_dropdown_names` AS SELECT 
 1 AS `Id`,
 1 AS `WhatAmI`,
 1 AS `Name`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `ent_owner_operators`
--

DROP TABLE IF EXISTS `ent_owner_operators`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ent_owner_operators` (
  `BizId` bigint(20) unsigned NOT NULL,
  `CarrierId` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`BizId`),
  KEY `UnderCarrierSignesRef_idx` (`CarrierId`),
  CONSTRAINT `OwnerOprBizRef` FOREIGN KEY (`BizId`) REFERENCES `ent_businesses` (`BizId`) ON UPDATE CASCADE,
  CONSTRAINT `UnderCarrierSignesRef` FOREIGN KEY (`CarrierId`) REFERENCES `ent_carriers` (`CarrierId`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ent_owner_operators`
--

LOCK TABLES `ent_owner_operators` WRITE;
/*!40000 ALTER TABLE `ent_owner_operators` DISABLE KEYS */;
INSERT INTO `ent_owner_operators` VALUES (253,257);
/*!40000 ALTER TABLE `ent_owner_operators` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ent_people`
--

DROP TABLE IF EXISTS `ent_people`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ent_people` (
  `PrsnId` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `NickName` varchar(512) NOT NULL DEFAULT '',
  `Prefix` enum('','Mr.','Mrs.','Ms.','Dr.','Sir','Madam') NOT NULL DEFAULT '',
  `FirstName` varchar(64) NOT NULL,
  `MiddleName` varchar(64) NOT NULL DEFAULT '',
  `LastName` varchar(64) NOT NULL,
  `Suffix` enum('','Sr','Jr','I','II','III','IV') NOT NULL DEFAULT '',
  `BrnchId` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`PrsnId`),
  UNIQUE KEY `UniqFullName` (`Prefix`,`FirstName`,`MiddleName`,`LastName`,`Suffix`,`BrnchId`,`NickName`),
  KEY `PeopleToBranchRef_idx` (`BrnchId`),
  KEY `idx_ent_people_NickName` (`NickName`) USING BTREE,
  KEY `idx_ent_people_Prefix` (`Prefix`) USING BTREE,
  KEY `idx_ent_people_FirstName` (`FirstName`) USING BTREE,
  KEY `idx_ent_people_MiddleName` (`MiddleName`) USING BTREE,
  KEY `idx_ent_people_LastName` (`LastName`) USING BTREE,
  KEY `idx_ent_people_Suffix` (`Suffix`) USING BTREE,
  KEY `idx_ent_people_BrnchId` (`BrnchId`) USING BTREE,
  CONSTRAINT `PeopleBranchRef` FOREIGN KEY (`BrnchId`) REFERENCES `biz_branches` (`BrnchId`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ent_people`
--

LOCK TABLES `ent_people` WRITE;
/*!40000 ALTER TABLE `ent_people` DISABLE KEYS */;
INSERT INTO `ent_people` VALUES (11,'','','Mila','','Chuk','',3803),(13,'','','Peter','','Chuk','',3801),(15,'','','Sergiy','','Podnizhnyy','',3805),(9,'','','Vladimir','','Skots','',3801),(17,'boss','','Vladimir','','Skots','',3801);
/*!40000 ALTER TABLE `ent_people` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ent_shippers`
--

DROP TABLE IF EXISTS `ent_shippers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ent_shippers` (
  `ShipperId` bigint(20) unsigned NOT NULL,
  `Notes` text,
  PRIMARY KEY (`ShipperId`),
  CONSTRAINT `ShipperBusinessRef` FOREIGN KEY (`ShipperId`) REFERENCES `ent_businesses` (`BizId`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ent_shippers`
--

LOCK TABLES `ent_shippers` WRITE;
/*!40000 ALTER TABLE `ent_shippers` DISABLE KEYS */;
/*!40000 ALTER TABLE `ent_shippers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entities`
--

DROP TABLE IF EXISTS `entities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entities` (
  `EntityId` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `IsActive` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT 'Boolean',
  `DateCreated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Notes` text,
  `PersonId` bigint(20) unsigned DEFAULT NULL,
  `BusinessId` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`EntityId`),
  UNIQUE KEY `BusinessId_UNIQUE` (`BusinessId`),
  UNIQUE KEY `PersonId_UNIQUE` (`PersonId`),
  KEY `idx_entities_DateCreated` (`DateCreated`),
  KEY `idx_entities_IsActive` (`IsActive`),
  KEY `EntityPersonRef_idx` (`PersonId`),
  KEY `EntityBusinessRef_idx` (`BusinessId`),
  CONSTRAINT `EntityBusinessRef` FOREIGN KEY (`BusinessId`) REFERENCES `ent_businesses` (`BizId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `EntityPersonRef` FOREIGN KEY (`PersonId`) REFERENCES `ent_people` (`PrsnId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5312 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entities`
--

LOCK TABLES `entities` WRITE;
/*!40000 ALTER TABLE `entities` DISABLE KEYS */;
INSERT INTO `entities` VALUES (1,1,'2019-07-03 12:46:57','This should be the company that is using the software, also for testing purposes',NULL,NULL),(3,1,'2019-07-18 16:08:43','Driver, for testing purposes',NULL,NULL),(5,1,'2019-07-18 16:08:43','Broker, for testing purposes',NULL,NULL),(7,1,'2019-07-18 16:16:46','Comdata, for testing purposes',NULL,NULL),(5275,1,'2019-11-25 09:33:07','Usko Express Inc',NULL,253),(5277,1,'2019-11-25 09:33:07','Heavenly Cookies and More, LLC',NULL,255),(5279,1,'2019-11-25 09:41:33','  Vladimir Skots ',9,NULL),(5281,1,'2019-11-25 09:50:34','  Mila Chuk ',11,NULL),(5283,1,'2019-11-26 10:19:37','  Peter Chuk ',13,NULL),(5285,1,'2019-11-26 10:24:59','4 RINGS EXPRESS INC',NULL,257),(5287,1,'2019-12-03 17:26:29','  Sergiy Podnizhnyy ',15,NULL),(5289,1,'2019-12-06 14:44:09','boss  Vladimir Skots ',17,NULL),(5301,1,'2019-12-10 11:58:34','JPMorgan Chase & Co',NULL,265),(5311,1,'2019-12-10 13:45:10','USKO LOGISTICS INC',NULL,271);
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
-- Temporary table structure for view `fin_account_type_tree_structures`
--

DROP TABLE IF EXISTS `fin_account_type_tree_structures`;
/*!50001 DROP VIEW IF EXISTS `fin_account_type_tree_structures`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `fin_account_type_tree_structures` AS SELECT 
 1 AS `RootTypeId`,
 1 AS `AccountTypeId`,
 1 AS `Structure`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `fin_account_types`
--

DROP TABLE IF EXISTS `fin_account_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fin_account_types` (
  `AccountTypeId` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) NOT NULL,
  `ParentId` bigint(20) unsigned DEFAULT NULL,
  `Editable` tinyint(1) unsigned DEFAULT '1',
  `Valid` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `UserDefined` tinyint(1) unsigned DEFAULT '1',
  `Debit` decimal(12,2) NOT NULL DEFAULT '1.00',
  `Credit` decimal(12,2) NOT NULL DEFAULT '-1.00',
  `Temp` tinyint(1) unsigned DEFAULT '0',
  `DisplayOrder` int(11) DEFAULT NULL,
  `BalanceSheet` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `IncomeSheet` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`AccountTypeId`),
  UNIQUE KEY `Name_UNIQUE` (`Name`),
  KEY `AccTypeAccTypeRef_idx` (`ParentId`),
  KEY `idx_fin_account_types_Name` (`Name`),
  KEY `idx_fin_account_types_Valid` (`Valid`),
  KEY `idx_fin_account_types_BalanceSheet` (`BalanceSheet`),
  KEY `idx_fin_account_types_IncomeSheet` (`IncomeSheet`),
  KEY `idx_fin_account_types_Editable` (`Editable`),
  KEY `idx_fin_account_types_UserDefined` (`UserDefined`),
  KEY `idx_fin_account_types_Debit` (`Debit`),
  KEY `idx_fin_account_types_Credit` (`Credit`),
  KEY `idx_fin_account_types_Temp` (`Temp`),
  KEY `idx_fin_account_types_DisplayOrder` (`DisplayOrder`),
  CONSTRAINT `AccTypeAccTypeRef` FOREIGN KEY (`ParentId`) REFERENCES `fin_account_types` (`AccountTypeId`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
-- Temporary table structure for view `fin_account_types_roots`
--

DROP TABLE IF EXISTS `fin_account_types_roots`;
/*!50001 DROP VIEW IF EXISTS `fin_account_types_roots`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `fin_account_types_roots` AS SELECT 
 1 AS `RootId`,
 1 AS `DescendantId`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `fin_account_types_tree_structures`
--

DROP TABLE IF EXISTS `fin_account_types_tree_structures`;
/*!50001 DROP VIEW IF EXISTS `fin_account_types_tree_structures`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `fin_account_types_tree_structures` AS SELECT 
 1 AS `AccountId`,
 1 AS `Structure`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `fin_account_types_trees`
--

DROP TABLE IF EXISTS `fin_account_types_trees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fin_account_types_trees` (
  `AncestorId` bigint(20) unsigned NOT NULL,
  `DescendantId` bigint(20) unsigned NOT NULL,
  `Depth` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`AncestorId`,`DescendantId`),
  KEY `AccountTypeTreeDescendantRef_idx` (`DescendantId`),
  KEY `idx_fin_account_types_trees_Depth` (`Depth`),
  CONSTRAINT `AccountTypeTreeAncestorRef` FOREIGN KEY (`AncestorId`) REFERENCES `fin_account_types` (`AccountTypeId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `AccountTypeTreeDescendantRef` FOREIGN KEY (`DescendantId`) REFERENCES `fin_account_types` (`AccountTypeId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fin_account_types_trees`
--

LOCK TABLES `fin_account_types_trees` WRITE;
/*!40000 ALTER TABLE `fin_account_types_trees` DISABLE KEYS */;
INSERT INTO `fin_account_types_trees` VALUES (1,1,0),(3,3,0),(5,5,0),(7,7,0),(9,9,0),(11,11,0),(13,13,0),(15,15,0),(17,17,0),(19,19,0),(21,21,0),(23,23,0),(25,25,0),(27,27,0),(29,29,0),(31,31,0),(33,33,0),(35,35,0),(37,37,0),(39,39,0),(41,41,0),(43,43,0),(45,45,0),(47,47,0),(49,49,0),(1,13,1),(1,15,1),(1,27,1),(1,29,1),(1,49,1),(3,17,1),(3,31,1),(3,33,1),(3,35,1),(3,37,1),(3,39,1),(5,19,1),(5,21,1),(5,41,1),(21,23,1),(21,25,1),(23,47,1),(25,43,1),(25,45,1),(5,23,2),(5,25,2),(21,43,2),(21,45,2),(21,47,2),(5,43,3),(5,45,3),(5,47,3);
/*!40000 ALTER TABLE `fin_account_types_trees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fin_accounts`
--

DROP TABLE IF EXISTS `fin_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fin_accounts` (
  `AccountId` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `AccountTypeId` bigint(20) unsigned NOT NULL,
  `ParentId` bigint(20) unsigned DEFAULT NULL,
  `UserDefined` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `Code` varchar(12) DEFAULT NULL,
  `Active` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `Valid` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `DateCreated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Name` varchar(255) NOT NULL,
  `Description` varchar(1024) DEFAULT NULL,
  `ExternalName` varchar(255) DEFAULT NULL,
  `Balance` decimal(12,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`AccountId`),
  UNIQUE KEY `Name_UNIQUE` (`Name`),
  KEY `AccAccTypeRef_idx` (`AccountTypeId`),
  KEY `AccountParentRef_idx` (`ParentId`),
  KEY `idx_fin_accounts_Code` (`Code`),
  KEY `idx_fin_accounts_Active` (`Active`),
  KEY `idx_fin_accounts_Valid` (`Valid`),
  KEY `idx_fin_accounts_Name` (`Name`),
  KEY `idx_fin_accounts_ExternalName` (`ExternalName`),
  KEY `idx_fin_accounts_Balance` (`Balance`),
  KEY `idx_fin_accounts_UserDefined` (`UserDefined`),
  KEY `idx_fin_accounts_DateCreated` (`DateCreated`),
  KEY `idx_fin_accounts_Description` (`Description`),
  CONSTRAINT `AccAccTypeRef` FOREIGN KEY (`AccountTypeId`) REFERENCES `fin_account_types` (`AccountTypeId`) ON UPDATE CASCADE,
  CONSTRAINT `AccountParentRef` FOREIGN KEY (`ParentId`) REFERENCES `fin_accounts` (`AccountId`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fin_accounts`
--

LOCK TABLES `fin_accounts` WRITE;
/*!40000 ALTER TABLE `fin_accounts` DISABLE KEYS */;
INSERT INTO `fin_accounts` VALUES (1,1,NULL,0,NULL,1,1,'2019-05-13 14:08:59','Accounts Receivable',NULL,NULL,0.00),(3,3,NULL,0,NULL,1,1,'2019-05-13 14:08:59','Accounts Payable',NULL,NULL,0.00),(5,1,NULL,0,NULL,1,1,'2019-05-13 14:27:47','Cash',NULL,NULL,454.00),(7,25,NULL,0,NULL,1,1,'2019-05-13 14:27:47','Service Expense',NULL,NULL,2252.00),(9,5,NULL,0,NULL,1,1,'2019-05-13 14:27:47','Retained Earnings',NULL,NULL,0.00),(11,25,NULL,0,NULL,1,1,'2019-05-13 14:27:47','Advertisement Expense',NULL,NULL,0.00),(13,23,NULL,0,NULL,1,1,'2019-05-13 14:27:47','Service Revenue',NULL,NULL,2504.00),(15,1,NULL,0,NULL,1,1,'2019-05-13 14:27:47','Equipment',NULL,NULL,0.00),(17,1,NULL,0,NULL,1,1,'2019-05-13 14:27:47','Driver Advance',NULL,NULL,0.00),(19,1,NULL,0,NULL,1,1,'2019-05-13 14:27:47','Prepaid Insurance',NULL,NULL,0.00),(21,15,NULL,0,NULL,1,1,'2019-05-13 14:27:47','Accumulated Depreciation',NULL,NULL,0.00),(23,1,NULL,0,NULL,1,1,'2019-05-13 14:27:47','Tractors and Trailers',NULL,NULL,0.00),(25,3,3,0,NULL,1,1,'2019-05-13 14:27:47','Payroll Liabilities',NULL,NULL,202.00),(27,5,NULL,0,NULL,1,1,'2019-05-13 14:27:47','Openning Balance Equity',NULL,NULL,0.00),(29,19,NULL,0,NULL,1,1,'2019-05-13 14:27:47','Owners Draw',NULL,NULL,0.00),(31,5,NULL,0,NULL,1,1,'2019-05-13 14:27:47','Owners Equity',NULL,NULL,0.00),(33,25,NULL,0,NULL,1,1,'2019-05-13 14:27:47','Fuel Surcharge',NULL,NULL,0.00),(35,25,NULL,0,NULL,1,1,'2019-05-13 14:27:47','Driver Travel Expense',NULL,NULL,0.00),(37,25,NULL,0,NULL,1,1,'2019-05-13 14:27:47','Fuel for Hired Vehicles',NULL,NULL,0.00),(39,25,NULL,0,NULL,1,1,'2019-05-13 14:27:47','Truck Maintenance Costs',NULL,NULL,0.00),(41,25,NULL,0,NULL,1,1,'2019-05-13 14:27:47','Insurance Expense',NULL,NULL,0.00),(43,25,NULL,0,NULL,1,1,'2019-05-13 14:27:47','Payroll Expense',NULL,NULL,0.00),(45,25,NULL,0,NULL,1,1,'2019-05-13 14:27:47','Utilities',NULL,NULL,0.00),(47,25,NULL,0,NULL,1,1,'2019-05-13 14:27:47','Telephone Expense',NULL,NULL,0.00),(49,25,NULL,0,NULL,1,1,'2019-05-13 14:27:47','Meals and Entertainment',NULL,NULL,0.00),(51,25,NULL,0,NULL,1,1,'2019-05-13 14:27:47','Bank Service Charge',NULL,NULL,0.00),(53,25,NULL,0,NULL,1,1,'2019-05-13 14:27:47','Business Licenses and Permits',NULL,NULL,0.00),(55,25,NULL,0,NULL,1,1,'2019-05-13 14:27:47','Computer and Internet Expense',NULL,NULL,0.00);
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
-- Temporary table structure for view `fin_accounts_roots`
--

DROP TABLE IF EXISTS `fin_accounts_roots`;
/*!50001 DROP VIEW IF EXISTS `fin_accounts_roots`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `fin_accounts_roots` AS SELECT 
 1 AS `RootId`,
 1 AS `DescendantId`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `fin_accounts_tree_structures`
--

DROP TABLE IF EXISTS `fin_accounts_tree_structures`;
/*!50001 DROP VIEW IF EXISTS `fin_accounts_tree_structures`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `fin_accounts_tree_structures` AS SELECT 
 1 AS `AccountId`,
 1 AS `Structure`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `fin_accounts_trees`
--

DROP TABLE IF EXISTS `fin_accounts_trees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fin_accounts_trees` (
  `AncestorId` bigint(20) unsigned NOT NULL,
  `DescendantId` bigint(20) unsigned NOT NULL,
  `Depth` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`AncestorId`,`DescendantId`),
  KEY `AccountTreeDescendantRef_idx` (`DescendantId`),
  KEY `idx_fin_accounts_trees_Depth` (`Depth`),
  CONSTRAINT `AccountTreeAncestorRef` FOREIGN KEY (`AncestorId`) REFERENCES `fin_accounts` (`AccountId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `AccountTreeDescendantRef` FOREIGN KEY (`DescendantId`) REFERENCES `fin_accounts` (`AccountId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fin_accounts_trees`
--

LOCK TABLES `fin_accounts_trees` WRITE;
/*!40000 ALTER TABLE `fin_accounts_trees` DISABLE KEYS */;
INSERT INTO `fin_accounts_trees` VALUES (1,1,0),(3,3,0),(5,5,0),(7,7,0),(9,9,0),(11,11,0),(13,13,0),(15,15,0),(17,17,0),(19,19,0),(21,21,0),(23,23,0),(25,25,0),(27,27,0),(29,29,0),(31,31,0),(33,33,0),(35,35,0),(37,37,0),(39,39,0),(41,41,0),(43,43,0),(45,45,0),(47,47,0),(49,49,0),(51,51,0),(53,53,0),(55,55,0),(3,25,1);
/*!40000 ALTER TABLE `fin_accounts_trees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fin_billing_banks`
--

DROP TABLE IF EXISTS `fin_billing_banks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fin_billing_banks` (
  `BankId` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `BillingId` bigint(20) unsigned NOT NULL,
  `Institution` bigint(20) unsigned NOT NULL,
  `AccountNickname` varchar(255) DEFAULT NULL,
  `AccountNumber` varchar(255) NOT NULL,
  `RoutingNumber` varchar(255) NOT NULL,
  `AccountType` enum('checking','savings') NOT NULL DEFAULT 'checking',
  `Purpose` enum('payment','billing','billing and payment','other') NOT NULL DEFAULT 'billing and payment',
  `Active` tinyint(1) NOT NULL DEFAULT '1',
  `VoidCheck` bigint(20) unsigned DEFAULT NULL,
  `Notes` text,
  PRIMARY KEY (`BankId`),
  KEY `BankOrgRef_idx` (`Institution`),
  KEY `BillingIdToBankRef_idx` (`BillingId`),
  KEY `idx_fin_billing_banks_AccountNumber` (`AccountNumber`),
  KEY `idx_fin_billing_banks_RoutingNumber` (`RoutingNumber`),
  KEY `idx_fin_billing_banks_AccountType` (`AccountType`),
  KEY `idx_fin_billing_banks_Purpose` (`Purpose`),
  KEY `idx_fin_billing_banks_Active` (`Active`),
  KEY `VoidCheckRef_idx` (`VoidCheck`),
  CONSTRAINT `BankOrgRef` FOREIGN KEY (`Institution`) REFERENCES `biz_branches` (`BrnchId`) ON UPDATE CASCADE,
  CONSTRAINT `BillingIdToBankRef` FOREIGN KEY (`BillingId`) REFERENCES `fin_billing_infos` (`BillingId`) ON UPDATE CASCADE,
  CONSTRAINT `VoidCheckRef` FOREIGN KEY (`VoidCheck`) REFERENCES `gen_files` (`FileId`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fin_billing_banks`
--

LOCK TABLES `fin_billing_banks` WRITE;
/*!40000 ALTER TABLE `fin_billing_banks` DISABLE KEYS */;
INSERT INTO `fin_billing_banks` VALUES (1,1,3809,'Tin Can','1234567890','987654321','checking','billing and payment',1,37,NULL);
/*!40000 ALTER TABLE `fin_billing_banks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fin_billing_infos`
--

DROP TABLE IF EXISTS `fin_billing_infos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fin_billing_infos` (
  `BillingId` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `EntityId` bigint(20) unsigned NOT NULL,
  `PayToTheOrderOf` varchar(255) NOT NULL,
  `ContactName` varchar(255) DEFAULT NULL,
  `Phone` bigint(20) unsigned NOT NULL,
  `Fax` bigint(20) unsigned DEFAULT NULL,
  `Address` bigint(20) unsigned NOT NULL,
  `EMail` varchar(255) DEFAULT NULL,
  `BillingTagId` bigint(20) unsigned NOT NULL,
  `DateIn` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DateOut` datetime DEFAULT NULL,
  `CreditLimit` decimal(10,2) DEFAULT NULL,
  `CreditHold` enum('yes','no') DEFAULT NULL,
  `Notes` text,
  PRIMARY KEY (`BillingId`),
  UNIQUE KEY `TagVsEntity` (`EntityId`,`BillingTagId`),
  KEY `BillingInfoEntityRef_idx` (`EntityId`),
  KEY `idx_fin_billing_infos_PayToTheOrderOf` (`PayToTheOrderOf`),
  KEY `idx_fin_billing_infos_DateIn` (`DateIn`),
  KEY `idx_fin_billing_infos_DateOut` (`DateOut`),
  KEY `BillingInfoTagRef_idx` (`BillingTagId`),
  KEY `BillingPhone_idx` (`Phone`),
  KEY `BillingFax_idx` (`Fax`),
  KEY `BillingAddress_idx` (`Address`),
  KEY `idx_fin_billing_infos_ContactName` (`ContactName`),
  KEY `idx_fin_billing_infos_EMail` (`EMail`),
  KEY `idx_fin_billing_infos_CreditLimit` (`CreditLimit`),
  KEY `idx_fin_billing_infos_CreditHold` (`CreditHold`),
  CONSTRAINT `BillingAddress` FOREIGN KEY (`Address`) REFERENCES `cnt_addresses` (`AddrId`) ON UPDATE CASCADE,
  CONSTRAINT `BillingFax` FOREIGN KEY (`Fax`) REFERENCES `cnt_phonesfaxes` (`PhnFaxId`) ON UPDATE CASCADE,
  CONSTRAINT `BillingInfoEntityRef` FOREIGN KEY (`EntityId`) REFERENCES `entities` (`EntityId`) ON UPDATE CASCADE,
  CONSTRAINT `BillingInfoTagRef` FOREIGN KEY (`BillingTagId`) REFERENCES `fin_billing_tags` (`BillingTagId`) ON UPDATE CASCADE,
  CONSTRAINT `BillingPhone` FOREIGN KEY (`Phone`) REFERENCES `cnt_phonesfaxes` (`PhnFaxId`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fin_billing_infos`
--

LOCK TABLES `fin_billing_infos` WRITE;
/*!40000 ALTER TABLE `fin_billing_infos` DISABLE KEYS */;
INSERT INTO `fin_billing_infos` VALUES (1,5285,'4 RINGS EXPRESS INC','Sergiy Podnizhnyy',4265,NULL,3943,NULL,7,'2019-11-26 10:25:00',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `fin_billing_infos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fin_billing_rules`
--

DROP TABLE IF EXISTS `fin_billing_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fin_billing_rules` (
  `BillRuleId` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `BankAccount` bigint(20) unsigned NOT NULL,
  `Rule` enum('percentage','fixed amount') NOT NULL DEFAULT 'percentage',
  `Amount` decimal(12,2) NOT NULL DEFAULT '100.00',
  `Notes` text,
  `Active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`BillRuleId`),
  KEY `BankToRuleRef_idx` (`BankAccount`),
  KEY `idx_fin_billing_rules_Rule` (`Rule`),
  KEY `idx_fin_billing_rules_Active` (`Active`),
  KEY `idx_fin_billing_rules_Amount` (`Amount`),
  CONSTRAINT `BankToRuleRef` FOREIGN KEY (`BankAccount`) REFERENCES `fin_billing_banks` (`BankId`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fin_billing_rules`
--

LOCK TABLES `fin_billing_rules` WRITE;
/*!40000 ALTER TABLE `fin_billing_rules` DISABLE KEYS */;
INSERT INTO `fin_billing_rules` VALUES (1,1,'percentage',100.00,NULL,1);
/*!40000 ALTER TABLE `fin_billing_rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fin_billing_tags`
--

DROP TABLE IF EXISTS `fin_billing_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fin_billing_tags` (
  `BillingTagId` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `BillingTag` varchar(45) NOT NULL,
  `UserDefined` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `CreatedBy` bigint(20) unsigned DEFAULT NULL,
  `DateCreated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`BillingTagId`),
  UNIQUE KEY `BillingTag_UNIQUE` (`BillingTag`),
  KEY `idx_fin_billing_tags_DateCreated` (`DateCreated`),
  KEY `idx_fin_billing_tags_UserDefined` (`UserDefined`),
  KEY `FinBillingTagsCreatorRef_idx` (`CreatedBy`),
  CONSTRAINT `FinBillingTagsCreatorRef` FOREIGN KEY (`CreatedBy`) REFERENCES `hr_associates` (`AstId`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='Tags for billing info to distinguish the purpose of the billing info, shipping, billing, payment etc.';
/*!40101 SET character_set_client = @saved_cs_client */;

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
-- Table structure for table `fin_cheques`
--

DROP TABLE IF EXISTS `fin_cheques`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fin_cheques` (
  `ChequeId` bigint(20) unsigned NOT NULL,
  `ChequeNumber` int(11) unsigned NOT NULL,
  `TransactionId` bigint(20) unsigned NOT NULL,
  `CreatedBy` bigint(20) unsigned NOT NULL,
  `AuthorizedBy` bigint(20) unsigned DEFAULT NULL,
  `VoidedBy` bigint(20) unsigned DEFAULT NULL,
  `Payer` bigint(20) unsigned NOT NULL,
  `Payee` bigint(20) unsigned NOT NULL,
  `Bank` bigint(20) unsigned NOT NULL,
  `Amount` decimal(12,2) unsigned NOT NULL,
  `Memo` varchar(255) DEFAULT NULL,
  `PayerName` varchar(255) DEFAULT NULL,
  `PayerStreetAddress` varchar(255) DEFAULT NULL,
  `PayerCityAddress` varchar(255) DEFAULT NULL,
  `PayerPhone` varchar(15) DEFAULT NULL,
  `PayeeName` varchar(255) DEFAULT NULL,
  `PayeeStreetAddress` varchar(255) DEFAULT NULL,
  `PayeeCityAddress` varchar(255) DEFAULT NULL,
  `PayeePhone` varchar(15) DEFAULT NULL,
  `BankName` varchar(255) DEFAULT NULL,
  `BankStreetAddress` varchar(255) DEFAULT NULL,
  `BankCityAddress` varchar(255) DEFAULT NULL,
  `BankPhone` varchar(15) DEFAULT NULL,
  `BankRoutingNumber` varchar(255) DEFAULT NULL,
  `BankAccountNumber` varchar(255) DEFAULT NULL,
  `DateCreated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DateVoided` datetime DEFAULT NULL,
  `DateAuthorized` datetime DEFAULT NULL,
  PRIMARY KEY (`ChequeId`),
  UNIQUE KEY `ChequeNumber_UNIQUE` (`ChequeNumber`),
  KEY `ChequePayerRef_idx` (`Payer`),
  KEY `ChequePayeeRef_idx` (`Payee`),
  KEY `ChequeTransationRef_idx` (`TransactionId`),
  KEY `ChequeBankRef_idx` (`Bank`),
  KEY `idx_fin_cheques_Memo` (`Memo`),
  KEY `idx_fin_cheques_DateAuthorized` (`DateAuthorized`),
  KEY `idx_fin_cheques_DateCreated` (`DateCreated`),
  KEY `idx_fin_cheques_DateVoided` (`DateVoided`),
  KEY `idx_fin_cheques_BankRoutingNumber` (`BankRoutingNumber`),
  KEY `idx_fin_cheques_BankAccountNumber` (`BankAccountNumber`),
  KEY `ChequeCreatorRef_idx` (`CreatedBy`),
  KEY `ChequeAuthorizerRef_idx` (`AuthorizedBy`),
  KEY `ChequeVoiderRef_idx` (`VoidedBy`),
  CONSTRAINT `ChequeAuthorizerRef` FOREIGN KEY (`AuthorizedBy`) REFERENCES `hr_associates` (`AstId`) ON UPDATE CASCADE,
  CONSTRAINT `ChequeBankRef` FOREIGN KEY (`Bank`) REFERENCES `biz_branches` (`BrnchId`) ON UPDATE CASCADE,
  CONSTRAINT `ChequeCreatorRef` FOREIGN KEY (`CreatedBy`) REFERENCES `hr_associates` (`AstId`) ON UPDATE CASCADE,
  CONSTRAINT `ChequePayeeRef` FOREIGN KEY (`Payee`) REFERENCES `entities` (`EntityId`),
  CONSTRAINT `ChequePayerRef` FOREIGN KEY (`Payer`) REFERENCES `entities` (`EntityId`),
  CONSTRAINT `ChequeTransationRef` FOREIGN KEY (`TransactionId`) REFERENCES `fin_transactions` (`TransactionId`) ON UPDATE CASCADE,
  CONSTRAINT `ChequeVoiderRef` FOREIGN KEY (`VoidedBy`) REFERENCES `hr_associates` (`AstId`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fin_cheques`
--

LOCK TABLES `fin_cheques` WRITE;
/*!40000 ALTER TABLE `fin_cheques` DISABLE KEYS */;
/*!40000 ALTER TABLE `fin_cheques` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fin_cheques_prints`
--

DROP TABLE IF EXISTS `fin_cheques_prints`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fin_cheques_prints` (
  `PrintedBy` bigint(20) unsigned NOT NULL,
  `ChequeId` bigint(20) unsigned NOT NULL,
  `DatePrinted` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  KEY `ChequePrintedPersonRef_idx` (`PrintedBy`),
  KEY `ChequePrintedChequeRef_idx` (`ChequeId`),
  KEY `idx_fin_cheques_prints_DatePrinted` (`DatePrinted`),
  CONSTRAINT `ChequePrintedChequeRef` FOREIGN KEY (`ChequeId`) REFERENCES `fin_cheques` (`ChequeId`) ON UPDATE CASCADE,
  CONSTRAINT `ChequePrintedPersonRef` FOREIGN KEY (`PrintedBy`) REFERENCES `hr_associates` (`AstId`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fin_cheques_prints`
--

LOCK TABLES `fin_cheques_prints` WRITE;
/*!40000 ALTER TABLE `fin_cheques_prints` DISABLE KEYS */;
/*!40000 ALTER TABLE `fin_cheques_prints` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fin_classes`
--

DROP TABLE IF EXISTS `fin_classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fin_classes` (
  `ClassId` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  PRIMARY KEY (`ClassId`),
  UNIQUE KEY `Name_UNIQUE` (`Name`),
  KEY `idx_fin_classes_Name` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Classes for classifying transactions, just like in some popular financial applications that shall not be mentioned.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fin_classes`
--

LOCK TABLES `fin_classes` WRITE;
/*!40000 ALTER TABLE `fin_classes` DISABLE KEYS */;
/*!40000 ALTER TABLE `fin_classes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `fin_invoice_amounts`
--

DROP TABLE IF EXISTS `fin_invoice_amounts`;
/*!50001 DROP VIEW IF EXISTS `fin_invoice_amounts`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `fin_invoice_amounts` AS SELECT 
 1 AS `InvoiceId`,
 1 AS `EntityId`,
 1 AS `PaymentTermsId`,
 1 AS `DateCreated`,
 1 AS `RefNumber`,
 1 AS `Notes`,
 1 AS `Comments`,
 1 AS `PONumber`,
 1 AS `Status`,
 1 AS `DateInvoiced`,
 1 AS `FactoredParent`,
 1 AS `Amount`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `fin_invoice_payment_items`
--

DROP TABLE IF EXISTS `fin_invoice_payment_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fin_invoice_payment_items` (
  `InvoicePaymentItemId` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `InvoicePaymentId` bigint(20) unsigned NOT NULL,
  `InvoiceItemId` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`InvoicePaymentItemId`),
  KEY `InvoicePaymentItemsInvoicePaymentRef_idx` (`InvoicePaymentId`),
  KEY `InvoicePaymentItemsItemRef_idx` (`InvoiceItemId`),
  CONSTRAINT `InvoicePaymentItemsInvoicePaymentRef` FOREIGN KEY (`InvoicePaymentId`) REFERENCES `fin_invoice_payments` (`InvoicePaymentId`) ON UPDATE CASCADE,
  CONSTRAINT `InvoicePaymentItemsItemRef` FOREIGN KEY (`InvoiceItemId`) REFERENCES `fin_invoices_items` (`InvoiceItemId`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Which items have been paid for';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fin_invoice_payment_items`
--

LOCK TABLES `fin_invoice_payment_items` WRITE;
/*!40000 ALTER TABLE `fin_invoice_payment_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `fin_invoice_payment_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fin_invoice_payments`
--

DROP TABLE IF EXISTS `fin_invoice_payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fin_invoice_payments` (
  `InvoicePaymentId` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `InvoiceId` bigint(20) unsigned NOT NULL,
  `TransactionId` bigint(20) unsigned NOT NULL,
  `PaymentMethodId` bigint(20) unsigned NOT NULL,
  `PayerId` bigint(20) unsigned NOT NULL,
  `CreatedBy` bigint(20) unsigned DEFAULT NULL,
  `Amount` decimal(12,2) unsigned NOT NULL,
  `DateCreated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DatePayment` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Valid` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`InvoicePaymentId`),
  KEY `InvoicePaymentInvoiceRef_idx` (`InvoiceId`),
  KEY `InvoicePaymentTransactionRef_idx` (`TransactionId`),
  KEY `InvoicePaymentPayerRef_idx` (`PayerId`),
  KEY `InvoicePaymentCreatorRef_idx` (`CreatedBy`),
  KEY `InvoicePaymentPaymentRef_idx` (`PaymentMethodId`),
  KEY `idx_fin_invoice_payments_DatePayment` (`DatePayment`),
  KEY `idx_fin_invoice_payments_DateCreated` (`DateCreated`),
  KEY `idx_fin_invoice_payments_Amount` (`Amount`),
  KEY `idx_fin_invoice_payments_Valid` (`Valid`),
  CONSTRAINT `InvoicePaymentCreatorRef` FOREIGN KEY (`CreatedBy`) REFERENCES `hr_associates` (`AstId`) ON UPDATE CASCADE,
  CONSTRAINT `InvoicePaymentInvoiceRef` FOREIGN KEY (`InvoiceId`) REFERENCES `fin_invoices` (`InvoiceId`) ON UPDATE CASCADE,
  CONSTRAINT `InvoicePaymentPayerRef` FOREIGN KEY (`PayerId`) REFERENCES `entities` (`EntityId`) ON UPDATE CASCADE,
  CONSTRAINT `InvoicePaymentPaymentRef` FOREIGN KEY (`PaymentMethodId`) REFERENCES `fin_payment_methods` (`PaymentMethodId`) ON UPDATE CASCADE,
  CONSTRAINT `InvoicePaymentTransactionRef` FOREIGN KEY (`TransactionId`) REFERENCES `fin_transactions` (`TransactionId`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fin_invoice_payments`
--

LOCK TABLES `fin_invoice_payments` WRITE;
/*!40000 ALTER TABLE `fin_invoice_payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `fin_invoice_payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fin_invoices`
--

DROP TABLE IF EXISTS `fin_invoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fin_invoices` (
  `InvoiceId` bigint(20) unsigned NOT NULL,
  `EntityId` bigint(20) unsigned NOT NULL,
  `PaymentTermsId` bigint(20) unsigned NOT NULL,
  `DateCreated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `RefNumber` varchar(20) DEFAULT NULL,
  `Notes` text,
  `Comments` text,
  `PONumber` varchar(32) DEFAULT NULL,
  `Status` enum('invalid','pending','invoiced','paid') NOT NULL DEFAULT 'pending',
  `DateInvoiced` datetime DEFAULT NULL,
  `FactoredParent` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`InvoiceId`),
  KEY `InvoiceEntityRef_idx` (`EntityId`),
  KEY `InvoicePaymentTermsRef_idx` (`PaymentTermsId`),
  KEY `InvoiceFactoredParent_idx` (`FactoredParent`),
  KEY `idx_fin_invoices_RefNumber` (`RefNumber`),
  KEY `idx_fin_invoices_PONumber` (`PONumber`),
  KEY `idx_fin_invoices_Status` (`Status`),
  KEY `idx_fin_invoices_DateInvoiced` (`DateInvoiced`),
  KEY `idx_fin_invoices_DateCreated` (`DateCreated`),
  CONSTRAINT `InvoiceEntityRef` FOREIGN KEY (`EntityId`) REFERENCES `entities` (`EntityId`) ON UPDATE CASCADE,
  CONSTRAINT `InvoiceFactoredParent` FOREIGN KEY (`FactoredParent`) REFERENCES `fin_invoices` (`InvoiceId`) ON UPDATE CASCADE,
  CONSTRAINT `InvoicePaymentTermsRef` FOREIGN KEY (`PaymentTermsId`) REFERENCES `fin_payment_terms` (`PaymentTermId`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fin_invoices`
--

LOCK TABLES `fin_invoices` WRITE;
/*!40000 ALTER TABLE `fin_invoices` DISABLE KEYS */;
/*!40000 ALTER TABLE `fin_invoices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fin_invoices_items`
--

DROP TABLE IF EXISTS `fin_invoices_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fin_invoices_items` (
  `InvoiceItemId` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `InvoiceId` bigint(20) unsigned DEFAULT NULL,
  `ItemTemplateId` bigint(20) unsigned DEFAULT NULL,
  `Amount` decimal(12,2) DEFAULT NULL,
  `Quantity` bigint(20) unsigned NOT NULL DEFAULT '1',
  `CreatedBy` bigint(20) unsigned DEFAULT NULL,
  `DateCreated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Notes` text,
  `Comments` text,
  `CreditJournalEntryId` bigint(20) unsigned DEFAULT NULL,
  `DebitJournalEntryId` bigint(20) unsigned DEFAULT NULL,
  `JobId` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`InvoiceItemId`),
  KEY `InvoiceItemInvoiceRef_idx` (`InvoiceId`),
  KEY `InvoiceItemItemTemplateRef_idx` (`ItemTemplateId`),
  KEY `InvoiceItemCreatorRef_idx` (`CreatedBy`),
  KEY `InvoiceItemJrlEntryDebitRef_idx` (`DebitJournalEntryId`),
  KEY `InvoiceItemJrlEntryCreditRef_idx` (`CreditJournalEntryId`),
  KEY `InvoiceItemJobRef_idx` (`JobId`),
  KEY `idx_fin_invoices_items_DateCreated` (`DateCreated`),
  KEY `idx_fin_invoices_items_Amount` (`Amount`),
  KEY `idx_fin_invoices_items_Quantity` (`Quantity`),
  CONSTRAINT `InvoiceItemCreatorRef` FOREIGN KEY (`CreatedBy`) REFERENCES `hr_associates` (`AstId`) ON UPDATE CASCADE,
  CONSTRAINT `InvoiceItemInvoiceRef` FOREIGN KEY (`InvoiceId`) REFERENCES `fin_invoices` (`InvoiceId`) ON UPDATE CASCADE,
  CONSTRAINT `InvoiceItemItemTemplateRef` FOREIGN KEY (`ItemTemplateId`) REFERENCES `fin_item_template` (`ItemTemplateId`) ON UPDATE CASCADE,
  CONSTRAINT `InvoiceItemJobRef` FOREIGN KEY (`JobId`) REFERENCES `fin_jobs` (`JobId`) ON UPDATE CASCADE,
  CONSTRAINT `InvoiceItemJrlEntryCreditRef` FOREIGN KEY (`CreditJournalEntryId`) REFERENCES `fin_journal_entries` (`JrlEntryId`) ON UPDATE CASCADE,
  CONSTRAINT `InvoiceItemJrlEntryDebitRef` FOREIGN KEY (`DebitJournalEntryId`) REFERENCES `fin_journal_entries` (`JrlEntryId`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fin_invoices_items`
--

LOCK TABLES `fin_invoices_items` WRITE;
/*!40000 ALTER TABLE `fin_invoices_items` DISABLE KEYS */;
INSERT INTO `fin_invoices_items` VALUES (1,NULL,NULL,2250.00,1,NULL,'2019-07-18 16:30:27',NULL,NULL,6,NULL,1),(3,NULL,NULL,200.00,1,NULL,'2019-07-18 16:32:44',NULL,NULL,NULL,10,1),(5,NULL,NULL,2500.00,1,NULL,'2019-07-18 16:29:45',NULL,NULL,NULL,2,1),(7,NULL,NULL,4.00,1,NULL,'2019-07-18 16:33:15',NULL,NULL,NULL,12,1),(9,NULL,NULL,200.00,1,NULL,'2019-07-18 16:35:55',NULL,NULL,16,NULL,1),(11,NULL,NULL,4.00,1,NULL,'2019-07-18 16:36:23',NULL,NULL,18,NULL,1);
/*!40000 ALTER TABLE `fin_invoices_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fin_item_template`
--

DROP TABLE IF EXISTS `fin_item_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fin_item_template` (
  `ItemTemplateId` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `TemplateTypeId` bigint(20) unsigned NOT NULL,
  `EntityId` bigint(20) unsigned DEFAULT NULL,
  `DebitAccountId` bigint(20) unsigned DEFAULT NULL,
  `CreditAccountId` bigint(20) unsigned DEFAULT NULL,
  `CreatedBy` bigint(20) unsigned DEFAULT NULL,
  `ParentId` bigint(20) unsigned DEFAULT NULL COMMENT 'For AFTER INSERT trigger functionality',
  `DateCreated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Price` decimal(12,2) unsigned DEFAULT NULL,
  `UserDefined` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `PriceType` enum('flat rate','percentage') DEFAULT NULL,
  `Name` varchar(1024) NOT NULL,
  `Description` text,
  `Deleted` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `DeletedBy` bigint(20) unsigned DEFAULT NULL,
  `DateDeleted` datetime DEFAULT NULL,
  `UpdatedBy` bigint(20) unsigned DEFAULT NULL,
  `DateUpdated` datetime DEFAULT NULL,
  `TransactionType` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`ItemTemplateId`),
  UNIQUE KEY `Name_UNIQUE` (`Name`),
  KEY `ItemTemplateTypeRef_idx` (`TemplateTypeId`),
  KEY `ItemTemplateEntityRef_idx` (`EntityId`),
  KEY `ItemTemplateDebitAccRef_idx` (`DebitAccountId`),
  KEY `ItemTemplateCreditAccRef_idx` (`CreditAccountId`),
  KEY `ItemTemplateCreatorRef_idx` (`CreatedBy`),
  KEY `ItemTemplateParentRef_idx` (`ParentId`),
  KEY `ItemTemplateDeletorRef_idx` (`DeletedBy`),
  KEY `ItemTemplateTransTypeRef_idx` (`TransactionType`),
  KEY `idx_fin_item_template_Name` (`Name`),
  KEY `idx_fin_item_template_Deleted` (`Deleted`),
  KEY `idx_fin_item_template_DateUpdated` (`DateUpdated`),
  KEY `idx_fin_item_template_DateDeleted` (`DateDeleted`),
  KEY `idx_fin_item_template_PriceType` (`PriceType`),
  KEY `idx_fin_item_template_DateCreated` (`DateCreated`),
  KEY `idx_fin_item_template_Price` (`Price`),
  KEY `idx_fin_item_template_UserDefined` (`UserDefined`),
  KEY `ItemTemplateUpdateByRef_idx` (`UpdatedBy`),
  CONSTRAINT `ItemTemplateCreatorRef` FOREIGN KEY (`CreatedBy`) REFERENCES `hr_associates` (`AstId`) ON UPDATE CASCADE,
  CONSTRAINT `ItemTemplateCreditAccRef` FOREIGN KEY (`CreditAccountId`) REFERENCES `fin_accounts` (`AccountId`) ON UPDATE CASCADE,
  CONSTRAINT `ItemTemplateDebitAccRef` FOREIGN KEY (`DebitAccountId`) REFERENCES `fin_accounts` (`AccountId`) ON UPDATE CASCADE,
  CONSTRAINT `ItemTemplateDeletorRef` FOREIGN KEY (`DeletedBy`) REFERENCES `hr_associates` (`AstId`) ON UPDATE CASCADE,
  CONSTRAINT `ItemTemplateEntityRef` FOREIGN KEY (`EntityId`) REFERENCES `entities` (`EntityId`) ON UPDATE CASCADE,
  CONSTRAINT `ItemTemplateItemTemplateRef` FOREIGN KEY (`ParentId`) REFERENCES `fin_item_template` (`ItemTemplateId`) ON UPDATE CASCADE,
  CONSTRAINT `ItemTemplateTransTypeRef` FOREIGN KEY (`TransactionType`) REFERENCES `fin_transaction_types` (`TransTypeId`) ON UPDATE CASCADE,
  CONSTRAINT `ItemTemplateTypeRef` FOREIGN KEY (`TemplateTypeId`) REFERENCES `fin_item_templates_types` (`TemplateTypeId`) ON UPDATE CASCADE,
  CONSTRAINT `ItemTemplateUpdateByRef` FOREIGN KEY (`UpdatedBy`) REFERENCES `hr_associates` (`AstId`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fin_item_template`
--

LOCK TABLES `fin_item_template` WRITE;
/*!40000 ALTER TABLE `fin_item_template` DISABLE KEYS */;
INSERT INTO `fin_item_template` VALUES (34,7,NULL,NULL,3,NULL,NULL,'2019-07-08 14:16:13',NULL,0,'flat rate','Driver Payment','Payment to driver for delivery service',0,NULL,NULL,NULL,NULL,11),(36,7,1,7,NULL,NULL,34,'2019-07-08 14:19:22',100.00,0,'percentage','Driver Payment Expense','The expense part of the driver payment',0,NULL,NULL,NULL,NULL,11),(38,1,NULL,1,NULL,NULL,NULL,'2019-07-08 14:32:45',NULL,0,'flat rate','Load Rate from Broker','Load Rate from Broker',0,NULL,NULL,NULL,NULL,14),(40,1,1,NULL,13,NULL,38,'2019-07-08 14:32:45',100.00,0,'percentage','Load Rate from Broker Revenue','Load Rate from Broker recorded as Revenue',0,NULL,NULL,NULL,NULL,14),(41,1,NULL,NULL,NULL,NULL,NULL,'2019-10-02 16:54:21',NULL,1,NULL,'sfgsdfgd',NULL,0,NULL,NULL,NULL,NULL,NULL),(75,1,NULL,NULL,NULL,NULL,NULL,'2019-10-03 10:25:01',NULL,1,NULL,'adfsadfsd',NULL,0,NULL,NULL,NULL,NULL,NULL);
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
-- Table structure for table `fin_item_templates_trees`
--

DROP TABLE IF EXISTS `fin_item_templates_trees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fin_item_templates_trees` (
  `AncestorId` bigint(20) unsigned NOT NULL,
  `DescendantId` bigint(20) unsigned NOT NULL,
  `Depth` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`AncestorId`,`DescendantId`),
  KEY `ItemTemplateTreeDescendantRef_idx` (`DescendantId`),
  KEY `idx_fin_item_templates_trees_Depth` (`Depth`),
  CONSTRAINT `ItemTemplateTreeAncestorRef` FOREIGN KEY (`AncestorId`) REFERENCES `fin_item_template` (`ItemTemplateId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ItemTemplateTreeDescendantRef` FOREIGN KEY (`DescendantId`) REFERENCES `fin_item_template` (`ItemTemplateId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fin_item_templates_trees`
--

LOCK TABLES `fin_item_templates_trees` WRITE;
/*!40000 ALTER TABLE `fin_item_templates_trees` DISABLE KEYS */;
INSERT INTO `fin_item_templates_trees` VALUES (34,34,0),(36,36,0),(38,38,0),(40,40,0),(41,41,0),(75,75,0),(34,36,1),(38,40,1);
/*!40000 ALTER TABLE `fin_item_templates_trees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fin_item_templates_types`
--

DROP TABLE IF EXISTS `fin_item_templates_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fin_item_templates_types` (
  `TemplateTypeId` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `Name` varchar(1024) NOT NULL,
  `UserDefined` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `DisplayToUser` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `Description` text NOT NULL,
  PRIMARY KEY (`TemplateTypeId`),
  KEY `idx_fin_item_templates_types_Name` (`Name`),
  KEY `idx_fin_item_templates_types_DisplayToUser` (`DisplayToUser`),
  KEY `idx_fin_item_templates_types_UserDefined` (`UserDefined`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fin_item_templates_types`
--

LOCK TABLES `fin_item_templates_types` WRITE;
/*!40000 ALTER TABLE `fin_item_templates_types` DISABLE KEYS */;
INSERT INTO `fin_item_templates_types` VALUES (1,'Service',0,1,'A service provided by your company.'),(3,'Fee',0,1,'A fee which usually is attached to a service'),(5,'Vendor Service',0,1,'A service provided from another company for your customers.'),(7,'Payment',0,1,'A payment that your company is making to another company.'),(11,'Loan',0,1,'A loan provided by your company to a customer.'),(13,'Reimbursement',0,1,'An amount which is owed back to a cutomer or vendor.'),(15,'Scheduled Deduction',0,0,'A deduction that is automatically supposed to be charged to a customer or vendor.');
/*!40000 ALTER TABLE `fin_item_templates_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fin_jobs`
--

DROP TABLE IF EXISTS `fin_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fin_jobs` (
  `JobId` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `Title` varchar(255) DEFAULT NULL,
  `JobAddedBy` bigint(20) unsigned NOT NULL,
  `JobCreated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`JobId`),
  KEY `idx_jobs_Title` (`Title`),
  KEY `JobAddedByEmplRef_idx` (`JobAddedBy`),
  KEY `idx_jobs_JobCreated` (`JobCreated`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fin_jobs`
--

LOCK TABLES `fin_jobs` WRITE;
/*!40000 ALTER TABLE `fin_jobs` DISABLE KEYS */;
INSERT INTO `fin_jobs` VALUES (1,'Trip 1',0,'2019-07-03 17:42:32');
/*!40000 ALTER TABLE `fin_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fin_journal_entries`
--

DROP TABLE IF EXISTS `fin_journal_entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fin_journal_entries` (
  `JrlEntryId` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `TransactionId` bigint(20) unsigned NOT NULL,
  `AccountId` bigint(20) unsigned NOT NULL,
  `EntityId` bigint(20) unsigned NOT NULL,
  `CreatedBy` bigint(20) unsigned DEFAULT NULL,
  `DateCreated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DebitCredit` enum('debit','credit') NOT NULL DEFAULT 'debit',
  `Amount` decimal(12,2) NOT NULL,
  `Classification` enum('customer','vendor') NOT NULL DEFAULT 'customer',
  `JobId` bigint(20) unsigned DEFAULT NULL,
  `VendorAmount` decimal(12,2) DEFAULT NULL COMMENT 'The amount to show for customer invoices',
  `ReportAmount` decimal(12,2) DEFAULT NULL COMMENT 'The amount to show on reports.',
  PRIMARY KEY (`JrlEntryId`),
  KEY `JournalEntryTransactionRef_idx` (`TransactionId`),
  KEY `JournalEntryAccountRef_idx` (`AccountId`),
  KEY `JournalEntryEntityRef_idx` (`EntityId`),
  KEY `JournalEntryCreatorRef_idx` (`CreatedBy`),
  KEY `JournalEntryJobRef_idx` (`JobId`),
  KEY `idx_fin_journal_entries_Amount` (`Amount`),
  KEY `idx_fin_journal_entries_VendorAmount` (`VendorAmount`),
  KEY `idx_fin_journal_entries_ReportAmount` (`ReportAmount`),
  KEY `idx_fin_journal_entries_DateCreated` (`DateCreated`),
  KEY `idx_fin_journal_entries_DebitCredit` (`DebitCredit`),
  KEY `idx_fin_journal_entries_Classification` (`Classification`),
  CONSTRAINT `JournalEntryAccountRef` FOREIGN KEY (`AccountId`) REFERENCES `fin_accounts` (`AccountId`) ON UPDATE CASCADE,
  CONSTRAINT `JournalEntryCreatorRef` FOREIGN KEY (`CreatedBy`) REFERENCES `hr_associates` (`AstId`) ON UPDATE CASCADE,
  CONSTRAINT `JournalEntryEntityRef` FOREIGN KEY (`EntityId`) REFERENCES `entities` (`EntityId`) ON UPDATE CASCADE,
  CONSTRAINT `JournalEntryJobRef` FOREIGN KEY (`JobId`) REFERENCES `fin_jobs` (`JobId`) ON UPDATE CASCADE,
  CONSTRAINT `JournalEntryTransactionRef` FOREIGN KEY (`TransactionId`) REFERENCES `fin_transactions` (`TransactionId`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fin_journal_entries`
--

LOCK TABLES `fin_journal_entries` WRITE;
/*!40000 ALTER TABLE `fin_journal_entries` DISABLE KEYS */;
INSERT INTO `fin_journal_entries` VALUES (2,1,1,5,NULL,'2019-07-03 17:28:19','debit',2500.00,'customer',1,-2500.00,2500.00),(4,1,13,1,NULL,'2019-07-03 17:28:19','credit',2500.00,'customer',1,2500.00,2500.00),(6,3,3,3,NULL,'2019-07-03 17:28:19','credit',2250.00,'customer',1,2250.00,2250.00),(8,3,7,1,NULL,'2019-07-03 17:28:19','debit',2250.00,'customer',1,2250.00,-2250.00),(10,5,17,3,NULL,'2019-07-03 17:28:19','debit',200.00,'customer',1,-200.00,200.00),(12,5,1,3,NULL,'2019-07-03 17:28:19','debit',4.00,'customer',1,-4.00,4.00),(14,5,13,1,NULL,'2019-07-03 17:28:19','credit',4.00,'customer',1,4.00,4.00),(16,5,25,7,NULL,'2019-07-03 17:28:19','credit',200.00,'customer',1,200.00,200.00),(18,5,25,7,NULL,'2019-07-03 17:28:19','credit',2.00,'customer',1,2.00,2.00),(20,5,7,1,NULL,'2019-07-03 17:28:19','debit',2.00,'customer',1,2.00,-2.00),(22,7,3,3,NULL,'2019-07-03 17:28:19','debit',-2250.00,'customer',1,-2250.00,-2250.00),(24,7,17,3,NULL,'2019-07-03 17:28:19','credit',-200.00,'customer',1,200.00,-200.00),(26,7,1,3,NULL,'2019-07-03 17:28:19','credit',-4.00,'customer',1,4.00,-4.00),(28,7,5,1,NULL,'2019-07-03 17:28:19','credit',-2046.00,'customer',1,2046.00,-2046.00),(30,9,1,5,NULL,'2019-07-03 17:28:19','credit',-2500.00,'customer',1,2500.00,-2500.00),(32,9,5,1,NULL,'2019-07-03 17:28:19','debit',2500.00,'customer',1,-2500.00,2500.00);
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
-- Table structure for table `fin_payment_methods`
--

DROP TABLE IF EXISTS `fin_payment_methods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fin_payment_methods` (
  `PaymentMethodId` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`PaymentMethodId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fin_payment_methods`
--

LOCK TABLES `fin_payment_methods` WRITE;
/*!40000 ALTER TABLE `fin_payment_methods` DISABLE KEYS */;
/*!40000 ALTER TABLE `fin_payment_methods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fin_payment_terms`
--

DROP TABLE IF EXISTS `fin_payment_terms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fin_payment_terms` (
  `PaymentTermId` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `Name` varchar(1024) NOT NULL,
  `DueNext` int(11) DEFAULT NULL COMMENT 'Net 7, 10, 30, 60, 90',
  `DueInDays` int(11) DEFAULT NULL,
  `DiscountAmount` decimal(12,2) DEFAULT NULL,
  `DiscountPercent` decimal(12,2) DEFAULT NULL,
  `DiscountInDays` int(11) unsigned DEFAULT NULL,
  `Type` enum('STANDARD','BY DATE','CASH') NOT NULL,
  PRIMARY KEY (`PaymentTermId`),
  UNIQUE KEY `Name_UNIQUE` (`Name`),
  KEY `idx_fin_payment_terms_Name` (`Name`),
  KEY `idx_fin_payment_terms_Type` (`Type`),
  KEY `idx_fin_payment_terms_DueNext` (`DueNext`),
  KEY `idx_fin_payment_terms_DueInDays` (`DueInDays`),
  KEY `idx_fin_payment_terms_DiscountAmount` (`DiscountAmount`),
  KEY `idx_fin_payment_terms_DiscountPercent` (`DiscountPercent`),
  KEY `idx_fin_payment_terms_DiscountInDays` (`DiscountInDays`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fin_payment_terms`
--

LOCK TABLES `fin_payment_terms` WRITE;
/*!40000 ALTER TABLE `fin_payment_terms` DISABLE KEYS */;
/*!40000 ALTER TABLE `fin_payment_terms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fin_scheduled_deductions`
--

DROP TABLE IF EXISTS `fin_scheduled_deductions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fin_scheduled_deductions` (
  `SchedDeductionId` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `ItemTemplateId` bigint(20) unsigned NOT NULL,
  `EntityId` bigint(20) unsigned NOT NULL,
  `DateStart` date NOT NULL,
  `DateStop` date DEFAULT NULL,
  `PaymentAmount` decimal(12,2) NOT NULL COMMENT 'How much to pay per peroid',
  `CumulativeAmount` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT 'The amount charged so far for this particular scheduled deduction item for the entity',
  `TotalAmount` decimal(12,2) DEFAULT NULL COMMENT 'Total amount to charge can be null if there is no limit to reach',
  `Comments` text,
  `ScheduleType` enum('loan','one-time charge','recurring charge') NOT NULL DEFAULT 'one-time charge',
  `Period` enum('null','annually','bi-annually','quarterly','monthly','bi-monthly','weekly','bi-weekly','daily') DEFAULT 'null',
  `PeriodDay` int(11) unsigned DEFAULT NULL,
  `Valid` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `CreatedBy` bigint(20) unsigned NOT NULL,
  `DateCreated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`SchedDeductionId`),
  KEY `SchedDeductionItemTemplateRef_idx` (`ItemTemplateId`),
  KEY `SchedDeductionEntityRef_idx` (`EntityId`),
  KEY `idx_fin_scheduled_deductions_DateStart` (`DateStart`),
  KEY `idx_fin_scheduled_deductions_DateStop` (`DateStop`),
  KEY `idx_fin_scheduled_deductions_TotalAmount` (`TotalAmount`),
  KEY `idx_fin_scheduled_deductions_ScheduleType` (`ScheduleType`),
  KEY `idx_fin_scheduled_deductions_Period` (`Period`),
  KEY `idx_fin_scheduled_deductions_PeriodDay` (`PeriodDay`),
  KEY `idx_fin_scheduled_deductions_Valid` (`Valid`),
  KEY `idx_fin_scheduled_deductions_DateCreated` (`DateCreated`),
  KEY `SchedDeductionCreatorRef_idx` (`CreatedBy`),
  KEY `idx_fin_scheduled_deductions_PaymentAmount` (`PaymentAmount`),
  KEY `idx_fin_scheduled_deductions_CumulativeAmount` (`CumulativeAmount`),
  CONSTRAINT `SchedDeductionCreatorRef` FOREIGN KEY (`CreatedBy`) REFERENCES `hr_associates` (`AstId`) ON UPDATE CASCADE,
  CONSTRAINT `SchedDeductionEntityRef` FOREIGN KEY (`EntityId`) REFERENCES `entities` (`EntityId`) ON UPDATE CASCADE,
  CONSTRAINT `SchedDeductionItemTemplateRef` FOREIGN KEY (`ItemTemplateId`) REFERENCES `fin_item_template` (`ItemTemplateId`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fin_scheduled_deductions`
--

LOCK TABLES `fin_scheduled_deductions` WRITE;
/*!40000 ALTER TABLE `fin_scheduled_deductions` DISABLE KEYS */;
/*!40000 ALTER TABLE `fin_scheduled_deductions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fin_tax_ids`
--

DROP TABLE IF EXISTS `fin_tax_ids`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fin_tax_ids` (
  `EntityId` bigint(20) unsigned NOT NULL,
  `Photo` bigint(20) unsigned DEFAULT NULL,
  `Tax_ID` char(16) NOT NULL,
  `ID_Type` enum('SSN','EIN','ITIN') NOT NULL,
  `Entered` datetime DEFAULT CURRENT_TIMESTAMP,
  `Notes` text,
  `Need1099` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`EntityId`),
  UNIQUE KEY `Tax_ID_UNIQUE` (`Tax_ID`),
  UNIQUE KEY `EntityId_UNIQUE` (`EntityId`),
  KEY `SSN_PhotoRef_idx` (`Photo`),
  KEY `idx_hr_tax_ids_Tax_ID` (`Tax_ID`),
  KEY `idx_fin_tax_ids_ID_Type` (`ID_Type`),
  KEY `idx_fin_tax_ids_Entered` (`Entered`),
  KEY `idx_fin_tax_ids_Need1099` (`Need1099`),
  CONSTRAINT `FinTaxIdsEntityRef` FOREIGN KEY (`EntityId`) REFERENCES `entities` (`EntityId`) ON UPDATE CASCADE,
  CONSTRAINT `SSN_PhotoRef` FOREIGN KEY (`Photo`) REFERENCES `gen_files` (`FileId`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fin_tax_ids`
--

LOCK TABLES `fin_tax_ids` WRITE;
/*!40000 ALTER TABLE `fin_tax_ids` DISABLE KEYS */;
INSERT INTO `fin_tax_ids` VALUES (5285,NULL,'123-45-6789','SSN','2019-12-10 11:21:18',NULL,1);
/*!40000 ALTER TABLE `fin_tax_ids` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fin_transaction_types`
--

DROP TABLE IF EXISTS `fin_transaction_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fin_transaction_types` (
  `TransTypeId` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `TransTypeName` varchar(64) NOT NULL,
  PRIMARY KEY (`TransTypeId`),
  UNIQUE KEY `TransTypeName_UNIQUE` (`TransTypeName`),
  KEY `idx_fin_transaction_types_TransTypeName` (`TransTypeName`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fin_transaction_types`
--

LOCK TABLES `fin_transaction_types` WRITE;
/*!40000 ALTER TABLE `fin_transaction_types` DISABLE KEYS */;
INSERT INTO `fin_transaction_types` VALUES (1,'Cash'),(3,'Check'),(5,'Credit Card Charge'),(7,'Deposit'),(9,'Journal Entry'),(11,'Payment'),(14,'Service'),(13,'Transfer');
/*!40000 ALTER TABLE `fin_transaction_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fin_transactions`
--

DROP TABLE IF EXISTS `fin_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fin_transactions` (
  `TransactionId` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `TransactionType` bigint(20) unsigned NOT NULL,
  `RefNumber` varchar(20) DEFAULT NULL,
  `JobId` bigint(20) unsigned DEFAULT NULL,
  `CreatedBy` bigint(20) unsigned DEFAULT NULL,
  `DateCreated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DateTransaction` datetime DEFAULT CURRENT_TIMESTAMP,
  `Status` enum('pending','valid','invalid') DEFAULT NULL,
  `Class` bigint(20) unsigned DEFAULT NULL,
  `Memo` text,
  PRIMARY KEY (`TransactionId`),
  KEY `TransactionJobRef_idx` (`JobId`),
  KEY `TransactionCreatorRef_idx` (`CreatedBy`),
  KEY `TransactionClassRef_idx` (`Class`),
  KEY `idx_fin_transactions_Class` (`Class`),
  KEY `idx_fin_transactions_Status` (`Status`),
  KEY `idx_fin_transactions_DateTransaction` (`DateTransaction`),
  KEY `idx_fin_transactions_DateCreated` (`DateCreated`),
  KEY `idx_fin_transactions_RefNumber` (`RefNumber`),
  KEY `TransactionTransTypeRef_idx` (`TransactionType`),
  CONSTRAINT `TransactionClassRef` FOREIGN KEY (`Class`) REFERENCES `fin_classes` (`ClassId`) ON UPDATE CASCADE,
  CONSTRAINT `TransactionCreatorRef` FOREIGN KEY (`CreatedBy`) REFERENCES `hr_associates` (`AstId`) ON UPDATE CASCADE,
  CONSTRAINT `TransactionJobRef` FOREIGN KEY (`JobId`) REFERENCES `fin_jobs` (`JobId`) ON UPDATE CASCADE,
  CONSTRAINT `TransactionTransTypeRef` FOREIGN KEY (`TransactionType`) REFERENCES `fin_transaction_types` (`TransTypeId`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fin_transactions`
--

LOCK TABLES `fin_transactions` WRITE;
/*!40000 ALTER TABLE `fin_transactions` DISABLE KEYS */;
INSERT INTO `fin_transactions` VALUES (1,1,'1-0001',NULL,NULL,'2019-07-03 12:43:10','2019-07-03 12:43:10',NULL,NULL,'Broker Rate for trip'),(3,1,'1-0002',NULL,NULL,'2019-07-18 16:24:17','2019-07-18 16:24:17',NULL,NULL,'Driver payment'),(5,1,'1-0003',NULL,NULL,'2019-07-18 16:24:17','2019-07-18 16:24:17',NULL,NULL,'Driver advance via ComData'),(7,3,'34453',NULL,NULL,'2019-07-18 16:24:17','2019-07-18 16:24:17',NULL,NULL,'Check to driver'),(9,11,'72399',NULL,NULL,'2019-07-18 16:24:17','2019-07-18 16:24:17',NULL,NULL,'Broker payment for trip');
/*!40000 ALTER TABLE `fin_transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gen_files`
--

DROP TABLE IF EXISTS `gen_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gen_files` (
  `FileId` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `DocumentTitle` varchar(255) DEFAULT NULL,
  `Keywords` varchar(1024) DEFAULT NULL,
  `FileName` varchar(1024) DEFAULT NULL,
  `FileData` longblob NOT NULL,
  `SHASIG` char(64) NOT NULL,
  `MIMEType` varchar(1024) DEFAULT NULL,
  `UploadDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `ExpiredDate` datetime DEFAULT NULL,
  `Notes` text,
  PRIMARY KEY (`FileId`),
  UNIQUE KEY `SHASIG_UNIQUE` (`SHASIG`),
  KEY `idx_gen_files_DocumentTitle` (`DocumentTitle`),
  KEY `idx_gen_files_MIMEType` (`MIMEType`),
  KEY `idx_gen_files_FileName` (`FileName`),
  KEY `idx_gen_files_SHASIG` (`SHASIG`),
  KEY `idx_gen_files_UploadDate` (`UploadDate`),
  KEY `idx_gen_files_Keywords` (`Keywords`),
  KEY `idx_gen_files_ExpiredDate` (`ExpiredDate`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gen_files`
--

LOCK TABLES `gen_files` WRITE;
/*!40000 ALTER TABLE `gen_files` DISABLE KEYS */;
INSERT INTO `gen_files` VALUES (2,'Sequi necessitatibus laborum accusamus. Nihil aut ut non. Consectetur at et harum non velit.','Et sit tenetur mollitia aut recusandae at officia. Voluptas voluptates qui tempora doloremque officiis.','Et ea ratione commodi dolor omnis quia beatae iste. Aliquam sed autem corrupti similique voluptatem ut.','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\n','Temporibus voluptas voluptates et nesciunt distinctio sint.','Provident minima eum rem est delectus blanditiis aperiam. Eaque ut nostrum quis ut et sunt error impedit.','2020-04-14 04:27:38','2020-06-05 13:36:32','Dolorem debitis blanditiis dolores. Iste sint assumenda modi recusandae.'),(8,'Praesentium id vel iste. Sapiente et iure voluptatibus eaque. Quis non nihil beatae amet soluta veniam voluptas ex.','Officia nobis et incidunt saepe. Et dolor quas earum.','Qui tempora neque minima nam.','iVBORw0KGgoAAAANSUhEUgAAAJMAAADHAQMAAAAnNPO3AAAABlBMVEUsFqPehZ6zI2I8AAAACXBI\nWXMAAA7EAAAOxAGVKw4bAAAL1klEQVRIiSVXXWwc13k99+6d4Z3Vyr2zXNIjVjbuLJfMkKDhJUMY\nalGgd5YrYSkzwdCQA8JwgZGsBHKbACxqIC4KFHdGK3pFy+iKVhslSIElTRRskgfG9oMe8jCm5YAR\nUoBtVSAJ8sC0RZu+FG6Rl/ap37D7tJi5v+c73zln0EcnOsJdg8BAos0sgH9ROFFSo8efiWU36tSa\nQEtEQw4h3W170uJKhQJo7wylhaIZkMej9pymv1t8AR48zWsOk9zop3V6W8EjxcWlAXLGG0/kCPrs\nITJZIBZSc+7reXrERaaYz/XcrUI5tD4NU5KeW9xBoZlIEIEBf97105ataN5rfWAwpho3yjGhcWms\n/ncm4QeDQODsZ2f6qpsvJM3l+3eHVYuh33g8xAhgqvqxNnf42SiOGG5LvF8F+92evDYFhOA5ePVp\njda8JEQtpjMXHg1Nq2/m6vtoms9meED73fm786u3tIRcUcj6LZZrXExwZJuEVn1DGH8keYPmdWlt\nG05UrGd9xo9Vy8ARkwzKcEG7QdrzRQJ02FeqCPLro442OuTTnEqTqUYHW44yYa1iWIWDGVguJqy5\nJ12jUm2EYZsGrynueV8wJv5gKUZfa+gCzzp7jQcMl6H+bV0Q4NEccJOPT/LgBTrAypM+D5WhMzeK\nlc/V0AR+flPD7elZGMAfaVw/ds8hivUpZoECyUaOLt2W4BBWIRyPzgAUiWJcSTGdiT84+QsCtSG7\nfQ4jMTVX4Sd169Byhu+2ska8cK+GYXOP2HJMZRgLB/mouIUUSnUEFvYtVjRvznO8H3Q76l43FIxq\nPqhyJKns4O1YeJzuP6bRxmlrYFHF8gt3YP+nI4h/rKDTGGx9omHmWn4iGxodY3XcGnJ2e74xJF50\nCT99/G6NGN+8p4ZvYHaBFiQWMG+HSvyog0MqrMQR7ds3fXozIZqusrZ+S1ToHp5mdhzzW1Rrs0Z3\nNzgtu2CTTWsqp+zVOQqfZukRl60qWmpNGxv/viz3YIyl9U8glqKWRfpa7Qw98yEygkwToEgwBnrq\nZ0mXj1Hz/N75u3jE65PbFn+zudVAtZ1/myhVZLNbVlkwfnpfcQVv1bXpvfs3di8YRPmS/Ps95DNl\n88hzIpg1hJVdQ2ITtAjp2WPtEg62ghbvJYMpHhAJ38rBUuwagVSYkV78dtIpufkR4bLfy3HX4nw2\nJepGLjujUiVUn2AEj7x+Xn9WfaugZtULxt//1K6d8odCibGZD4FlAizFFdS0pM3tNaUMRHs6JHhT\noyclRvrjrARGobPyU2oUrr9aQhKWEsE25oVYEquOyIkyS+gAexO979QUFWgzYEIdgKhAc5Sc68oO\nQ/8CpoZtuitaNR0rb8jf6D+TWME00gI9BSlkGrmZJCZ37WQVOPdNasvE1JhRSjfbz3pXgaUrsQD1\n74B6qzYkIXzZwjWfL3cwgZHyNe2nKmMlzcbysmSkXvClvblxbGnnGXALAdHsS3kuTddJIaUOtm1G\nLZONPG55j7DymWXL/2Adx/jyf+kNC025LE5a6MOOQsM1ItLAF7Szph9fxanwmHrLVvLjAj/hdepv\nGszvq1ZUz2ISSiZkLnxiKppCvqJGAUmccOea9cPLMbvZtV7cbd+RJcntqqJTVnNTs/WW+CP6r8+b\nfy51FW7TebIl1SWqGNWjy2q/Zo6d7TbU21HziKgEKf9UIv/NoW2uRd4tRWfkGVzOImpm9YI1VuBr\nxKu7zuI5BjlhODTPQklIWdU64qjSIYHxBUXSoJFUF2iYToTsmxhs/HVLolLFQ68warD3xX/CeKQz\navA3an8tDxNb+6W5zJgVcXWpVJyBnWvqKrjDOjcr+MeSBpIK7Ldl7nWpwa/P94gvRposGcacAFcP\nCFKzpvFin/zsG20eTo/LxaCcB5ACJATB0gP0HklGT/6KIKjcf5OOlEOIHu7UzAk5l0+XKdR5gqfG\nRe/HECUGZB/sZ9h7Z7+5n0rOSixdtgoHpXlpy6+pjZIU2hZDEQuj2DELWhdZ9copxgMSLKGxA/lU\n1t7RA9LOFX5Nvjr/tT8MrETEH23pS7TMVNuF04MpdcUTdao+DkSHl/SLBPSPnItKD4nmf+lJ23Xj\n7YTMMoL4jBrEhxeRAsi+FRI/gHJpD7szJcXapRH5LbuMD28YsotO83CtT144OVmL5uVD2pRIFGCV\nuEqAaEka2OnwFGzbVlwsvbKLl3r6O6+KqEWWoV2fqiE38WQn1Wz2xzcL0sn9VW/fYVVRXz935UQ6\nSpe2P4eHRes4FSsX2z4qFYsOwdSPq/W78HOZJ2eWvx1m4irdi/mrWYDTiu5q3A3xmvGMEuepn6/c\nYKD7Jon9b6t1RQp8jvzl/XiUomn/PzbQ79OcqZ9nhJnUDFTLeKNUdtss3PItgSdpKbngBAhX0B+C\nHGXUp5ARMgE72NQTinrT6XUSn/PlK4QCHyU1yFOsNx5EVc1iwmjUKYQltz5bz4H2G5/Uwele2fGZ\nuOf2AZ7CmrAqN8V7NMxr7MJtdPcfRt3Nujt9jxoSNr6c0pn0TZFamnpsKI/phUNGHixQyzJtcNJX\nI2IdKeSo0WauuIzXvxxQMgLyeY+/qHlFSZt/L9gF9Yee6cUpk+IAtknpwGjy6TyOBkpeMPqUhYeq\nXuYqfEZIGbn9VSMeW1v94yprFVAf8aBls4HRMtJ8g42IG1m7l8uf9XTzY5KnRl+PSHf3+EYzHoK9\nJGCMbmhBObGINHEg+Y/K+5mwB19fiUrClqnS4UEP1yF8seQ2TvGZNQpHg2paYcQ4ao7bI1Iue05n\n1D228Qq+tNzaoau9eYQfSV69QBKDEXXOWV2NAXkA/vXCu2xA3SOJz+2AtONiDcYtTQk4oS1FHcmk\nL8zVAe7jtzfK65IOWU4eCMQpkYd5Za82arIiXKG2yXZTRd1MNVpfXC/YXdNuDCma1IU3E5fcpbkJ\nbg/jtYriVb8iSw+Ikt5z8w519UALu++RKU475KEhWM6keZ7MaHCWMNXKn/FVY4z3srzwX1aVwfNY\nChsw9sHYlLIh6ECkBVXeofp1GadYYRPepnvmQZSi4EV5ekMha0cVaL/3TYvnKrr4Vd7fXGLKtOkk\nJGJGzMzfWWEY6P3xOcJssBsK+WnrhFhemWUqP5OkgGg/qkbQ72Lgil6Z4C3hVvpIm3pOzMlUljkq\nDOk2PBovW6XhzunrZfZJ9evk/Fxo7a6XubbM0l0qgdw0z1uzrbq/LsoF9UzHcYdc6rfLAj/bO0v8\nNr5DTuHVnC/9gpqWRJ/qQBVQiwvmMcI+5V+Wl7S8wJlkAzaP32BBOpQiwfvCXfen2mXc+oohA3XJ\n4/URKYohhjUJuUFkQotveRTf5JTVgzG6zc5mryjIjEnzWtinsmvjCcF3aY9nXmy7Djq1qC4KnMU/\nVBpHhsID/x3ZumGHLG+WDUnPfcPQWbt9ka1107cSitU4WEHSz8z7plbvzNWX6Xxfnz6aUmyF4rgN\nvzCEGbgFKEmL5kHnmvRWlYBXGZDOHyell6QMM1zKPb+3WGJ7vkOcU7uwi7vxpSDjlP+2Loiw0WWy\nu9kT4ItHdarH1e3/BNMf7AosI+gRmp9QKUnS3YSrHnsHuTELFWtxDRtPQkbGyfD4Nk9S7o9KUNf2\nWHDR7BxMkS/PZaXfC888LUvvtnP6hHjOTcvvmwYCJbNdpJJNjnsNt1wmF9Q0N6z6xWNrYoYDwuVv\n7ZfdytL1kQo3fN0w4j7pLuwT4FW/wLp4wmPWJD3I2sLpeH/CmP/dmA5Z+R7FaRvxQP0UiPqDBJeL\n4WKFquh9IyXaRGLpKiM/vFdKQlv6yuyq0HL6kPlV3eCLwEc8TicZCRJlkR9ml5wp6qPnuyE96eg2\noS8xsOpK6alcBFz3RTFacSJqiyGFsv5vUTG7tdrKDcnkrfYYYWCUe7wFoSKKnnvkwkQhTIu41kOT\nSfXI4pBdu0LfVv0WRdb5bGJ22GvUyEt65Pv7rYMVm03AlaN3FOlDCZ+k/hw4lERlTqzK1l6icebw\nqb2lyhRcLyOeCGjfWAnpfKxPAsv6PHlvuGPwfwxQ5Ieql8l+AAAAAElFTkSuQmCC\n','Alias dolor molestias expedita.','Rerum vero ratione enim ipsa aperiam. Aut nulla quo at architecto sint odio modi.','2020-02-25 00:15:10','2019-10-10 15:30:29','Sequi qui recusandae earum perferendis quia accusamus dicta est.'),(22,'Omnis suscipit quaerat qui in. Consequuntur minima nam quidem rerum.','Enim eos aut adipisci impedit omnis ut. Et incidunt alias amet et in ut esse eos. Ex eum sit id est sunt sit ab.','A consequatur ullam neque tempore impedit omnis perferendis. Accusamus debitis hic totam odio maxime.','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\n','e6114a6c83f3dedede1637f2aa6ee42d094293bdb72c9573a753d813b1dcb512','Eum et nihil delectus harum quis unde.','2019-09-28 06:50:14','2020-06-26 18:50:39','Aliquam praesentium hic vero nostrum eveniet voluptate.'),(24,'Est praesentium eum eaque. Repudiandae iste non nesciunt perferendis.','Ad omnis deserunt modi. Sed dicta rem asperiores accusantium. Aut velit fugit voluptas.','Voluptatem quas inventore dolor qui repudiandae. Ut assumenda ullam explicabo ducimus quod labore aut. Nihil eaque facere iusto eos necessitatibus.','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\nRK5CYII=\n','26934c4a3c5111f99da04e2a9c7b6ed66d0a142b06d1b7bac3e7f80d05d28543','Delectus qui odio id officiis a.','2019-09-12 00:09:52','2019-11-22 14:22:58','Et sunt nulla earum qui. Sapiente optio porro eveniet culpa.'),(32,'Tempore atque qui quo corrupti eos sapiente aliquid ut. Suscipit maxime deleniti officiis.','Est autem rerum deleniti.','Repudiandae explicabo veritatis esse ut.','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\noI+02R805P4f5Zy9z4fG93gAAAAASUVORK5CYII=\n','18ffab19085deb7bec2a09dd9176b1b504445456a1ec47bcd45bf2a1e6c40a49','Ut veniam itaque reprehenderit accusamus. Dolorem tempora earum saepe. Recusandae porro harum inventore.','2020-05-28 01:55:01','2019-10-04 07:31:23','Sed ea optio nihil voluptatum nulla eos debitis. Reprehenderit eaque incidunt et. Minus blanditiis ut quis repellat voluptates omnis est cum.'),(34,'Velit est vel porro qui laboriosam autem velit.','Culpa cum laboriosam commodi dolores ut accusantium. Voluptatem in molestiae qui dicta voluptatem vero et ea.','Corrupti error eius est explicabo excepturi alias repellat laborum. Aut voluptatibus eligendi in. Qui consequatur magni facere repellendus sint.','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\nRK5CYII=\n','5616d09aac0a390aedd15cd51efe2c3f4b47ec9195333e1759a4260b5cc2013a','Voluptas qui voluptas quam veritatis aspernatur. Possimus autem harum quis sint ex. Mollitia eum quibusdam nihil earum.','2020-03-31 14:31:04','2020-08-01 09:14:07','Eum culpa culpa sed omnis veniam unde aspernatur voluptatibus. Natus ea est impedit sequi vel nulla quia.'),(36,'Qui nisi quam eum. Eum nisi est quidem. Quia porro suscipit dignissimos fuga molestiae atque voluptatum.','Tempora pariatur rerum provident et ut.','Dolore voluptas laborum ex sunt neque perspiciatis atque. Sint voluptate illo illum ad quia in. Libero voluptatibus ea delectus cumque voluptatibus.','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\nSUVORK5CYII=\n','c80295d708dcab60667fed949ebf8d01bee0959b4e3188d5814a2f110641bf60','Quod similique sit dolores inventore quos. Velit aut voluptatem modi a culpa rerum quisquam expedita.','2019-10-16 22:58:53','2020-03-09 23:18:02','Vitae aut est atque et laborum dolor ut aspernatur. Fugit sit omnis alias minus cum.'),(37,'Fake Check','VoidCheck','unimportant.jpeg','Hi, I am the void check','fake data','text/plain','2019-12-10 12:39:10',NULL,NULL);
/*!40000 ALTER TABLE `gen_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hr_associates`
--

DROP TABLE IF EXISTS `hr_associates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hr_associates` (
  `AstId` bigint(20) unsigned NOT NULL,
  `CurrentTitle` varchar(255) DEFAULT NULL,
  `NodeId` bigint(20) unsigned DEFAULT NULL,
  `AuthorityLevel` enum('member','vise','executive') NOT NULL DEFAULT 'member',
  `DateCreated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DateRemoved` datetime DEFAULT NULL,
  `BizPhone` bigint(20) unsigned DEFAULT NULL,
  `BizFax` bigint(20) unsigned DEFAULT NULL,
  `BizEmail` varchar(255) DEFAULT NULL,
  `Notes` text,
  `PrimaryContact` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`AstId`),
  KEY `AssociatePersonRef_idx` (`AstId`),
  KEY `BizNodeRef_idx` (`NodeId`),
  KEY `idx_hr_associates_Title` (`CurrentTitle`),
  KEY `idx_hr_associates_DateCreated` (`DateCreated`),
  KEY `idx_hr_associates_DateRemoved` (`DateRemoved`),
  KEY `BizPhnRef_idx` (`BizPhone`),
  KEY `BizFaxRef_idx` (`BizFax`),
  KEY `idx_hr_associates_BizEmail` (`BizEmail`),
  KEY `idx_hr_associates_AuthorityLevel` (`AuthorityLevel`),
  KEY `idx_hr_associates_PrimaryContact` (`PrimaryContact`),
  CONSTRAINT `AssociatePersonRef` FOREIGN KEY (`AstId`) REFERENCES `ent_people` (`PrsnId`) ON UPDATE CASCADE,
  CONSTRAINT `BizFaxRef` FOREIGN KEY (`BizFax`) REFERENCES `cnt_phonesfaxes` (`PhnFaxId`) ON UPDATE CASCADE,
  CONSTRAINT `BizNodeRef` FOREIGN KEY (`NodeId`) REFERENCES `biz_company_nodes` (`NodeId`) ON UPDATE CASCADE,
  CONSTRAINT `BizPhnRef` FOREIGN KEY (`BizPhone`) REFERENCES `cnt_phonesfaxes` (`PhnFaxId`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hr_associates`
--

LOCK TABLES `hr_associates` WRITE;
/*!40000 ALTER TABLE `hr_associates` DISABLE KEYS */;
INSERT INTO `hr_associates` VALUES (9,'CEO',399,'executive','2019-11-25 16:09:53',NULL,4261,4257,'vlad@uskoinc.com','Founder and CEO',1),(13,'Software Engineer',401,'member','2019-11-26 10:19:37',NULL,4263,4257,'cpeter@uskoinc.com',NULL,0),(15,'Owner',399,'executive','2019-12-10 10:30:24',NULL,4265,4257,'hello@123.com','Owner Operator',0),(17,'CEO',399,'executive','2019-12-06 14:44:10',NULL,4261,4257,'vlad@uskoinc.com','Founder and CEO',1);
/*!40000 ALTER TABLE `hr_associates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hr_confidentials`
--

DROP TABLE IF EXISTS `hr_confidentials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hr_confidentials` (
  `AstId` bigint(20) unsigned NOT NULL,
  `Birthday` date NOT NULL,
  `MaritalStatus` enum('single','married','widowed','divorsed') NOT NULL,
  `Gender` enum('male','female') NOT NULL,
  `PersonalPhone` bigint(20) unsigned NOT NULL COMMENT 'mobile phone',
  `PersonalEmail` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`AstId`),
  KEY `CellPhoneRef_idx` (`PersonalPhone`),
  KEY `idx_hr_confidentials_Birthday` (`Birthday`),
  KEY `idx_hr_confidentials_MaritalStatus` (`MaritalStatus`),
  KEY `idx_hr_confidentials_PersonalEmail` (`PersonalEmail`),
  KEY `idx_hr_confidentials_Gender` (`Gender`),
  CONSTRAINT `CellPhoneRef` FOREIGN KEY (`PersonalPhone`) REFERENCES `cnt_phonesfaxes` (`PhnFaxId`) ON UPDATE CASCADE,
  CONSTRAINT `ConfToAstRef` FOREIGN KEY (`AstId`) REFERENCES `hr_associates` (`AstId`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hr_confidentials`
--

LOCK TABLES `hr_confidentials` WRITE;
/*!40000 ALTER TABLE `hr_confidentials` DISABLE KEYS */;
/*!40000 ALTER TABLE `hr_confidentials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hr_emrgency_contacts`
--

DROP TABLE IF EXISTS `hr_emrgency_contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hr_emrgency_contacts` (
  `EmrgncyId` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `AstId` bigint(20) unsigned NOT NULL,
  `ContactName` varchar(255) NOT NULL,
  `ContactPhone` bigint(20) unsigned NOT NULL,
  `Relationship` varchar(255) NOT NULL,
  `Effective` datetime NOT NULL,
  `Expired` datetime NOT NULL,
  `Notes` text,
  PRIMARY KEY (`EmrgncyId`),
  KEY `EmrgAst_idx` (`AstId`),
  KEY `idx_hr_emrgency_contacts_Effective` (`Effective`),
  KEY `idx_hr_emrgency_contacts_Expired` (`Expired`),
  KEY `idx_hr_emrgency_contacts_Relationship` (`Relationship`),
  KEY `EmrgPhoneRef_idx` (`ContactPhone`),
  KEY `idx_hr_emrgency_contacts_ContactName` (`ContactName`),
  CONSTRAINT `EmrgAst` FOREIGN KEY (`AstId`) REFERENCES `hr_associates` (`AstId`) ON UPDATE CASCADE,
  CONSTRAINT `EmrgPhoneRef` FOREIGN KEY (`ContactPhone`) REFERENCES `cnt_phonesfaxes` (`PhnFaxId`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hr_emrgency_contacts`
--

LOCK TABLES `hr_emrgency_contacts` WRITE;
/*!40000 ALTER TABLE `hr_emrgency_contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `hr_emrgency_contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hr_govidcards`
--

DROP TABLE IF EXISTS `hr_govidcards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hr_govidcards` (
  `CardId` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `AstId` bigint(20) unsigned NOT NULL,
  `CardNumber` varchar(255) NOT NULL,
  `CardDateExpired` date NOT NULL,
  `CardDateValid` date NOT NULL,
  `CardSate` char(2) NOT NULL,
  `CardType` varchar(255) NOT NULL,
  `Photo` bigint(20) unsigned DEFAULT NULL,
  `AddedBy` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`CardId`),
  KEY `CardToAstRef_idx` (`AstId`),
  KEY `idx_hr_govidcards_CardSate` (`CardSate`),
  KEY `idx_hr_govidcards_CardNumber` (`CardNumber`),
  KEY `idx_hr_govidcards_CardDateExpired` (`CardDateExpired`),
  KEY `idx_hr_govidcards_CardDateValid` (`CardDateValid`),
  KEY `idx_hr_govidcards_CardType` (`CardType`),
  KEY `GovCardPhoto_idx` (`Photo`),
  KEY `GovCardAddedByRef_idx` (`AddedBy`),
  CONSTRAINT `CardToAstRef` FOREIGN KEY (`AstId`) REFERENCES `hr_associates` (`AstId`) ON UPDATE CASCADE,
  CONSTRAINT `GovCardAddedByRef` FOREIGN KEY (`AddedBy`) REFERENCES `hr_associates` (`AstId`) ON UPDATE CASCADE,
  CONSTRAINT `GovCardPhotoRef` FOREIGN KEY (`Photo`) REFERENCES `gen_files` (`FileId`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hr_govidcards`
--

LOCK TABLES `hr_govidcards` WRITE;
/*!40000 ALTER TABLE `hr_govidcards` DISABLE KEYS */;
/*!40000 ALTER TABLE `hr_govidcards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hr_hire_records`
--

DROP TABLE IF EXISTS `hr_hire_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hr_hire_records` (
  `HireId` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `AstId` bigint(20) unsigned NOT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `StatusChangedDate` date DEFAULT NULL,
  `StatusChangedNote` varchar(1024) DEFAULT NULL,
  `Status` enum('active','terminated','leave of absence','suspended') NOT NULL DEFAULT 'active',
  `Photo` bigint(20) unsigned DEFAULT NULL,
  `EmploymentAuthorization` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`HireId`),
  KEY `HireAstRef_idx` (`AstId`),
  KEY `idx_biz_hire_records_Title` (`Title`),
  KEY `idx_biz_hire_records_DateHired` (`StatusChangedDate`),
  KEY `idx_biz_hire_records_ReasonForTermination` (`StatusChangedNote`),
  KEY `PhotoRef_idx` (`Photo`),
  KEY `EmplAuthDocRef_idx` (`EmploymentAuthorization`),
  KEY `idx_hr_hire_records_Status` (`Status`),
  CONSTRAINT `EmplAuthDocRef` FOREIGN KEY (`EmploymentAuthorization`) REFERENCES `hr_govidcards` (`CardId`) ON UPDATE CASCADE,
  CONSTRAINT `HireAstRef` FOREIGN KEY (`AstId`) REFERENCES `hr_associates` (`AstId`) ON UPDATE CASCADE,
  CONSTRAINT `PhotoRef` FOREIGN KEY (`Photo`) REFERENCES `gen_files` (`FileId`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hr_hire_records`
--

LOCK TABLES `hr_hire_records` WRITE;
/*!40000 ALTER TABLE `hr_hire_records` DISABLE KEYS */;
/*!40000 ALTER TABLE `hr_hire_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hr_payrates`
--

DROP TABLE IF EXISTS `hr_payrates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hr_payrates` (
  `PayRateId` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `AstId` bigint(20) unsigned NOT NULL,
  `RateType` enum('hourly','salary','weekly','biweekly','monthly','mileage','load percentage','flat rate') NOT NULL DEFAULT 'hourly',
  `RateAmount` decimal(12,2) NOT NULL,
  `Agreement` bigint(20) unsigned NOT NULL,
  `EffectiveDate` date NOT NULL,
  `ExpirationDate` date NOT NULL,
  PRIMARY KEY (`PayRateId`),
  KEY `PayAstRef_idx` (`AstId`),
  KEY `AgreementDocRef_idx` (`Agreement`),
  KEY `idx_hr_payrates_ExpirationDate` (`ExpirationDate`),
  KEY `idx_hr_payrates_EffectiveDate` (`EffectiveDate`),
  KEY `idx_hr_payrates_RateType` (`RateType`),
  KEY `idx_hr_payrates_RateAmount` (`RateAmount`),
  CONSTRAINT `AgreementDocRef` FOREIGN KEY (`Agreement`) REFERENCES `gen_files` (`FileId`) ON UPDATE CASCADE,
  CONSTRAINT `PayAstRef` FOREIGN KEY (`AstId`) REFERENCES `hr_associates` (`AstId`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hr_payrates`
--

LOCK TABLES `hr_payrates` WRITE;
/*!40000 ALTER TABLE `hr_payrates` DISABLE KEYS */;
/*!40000 ALTER TABLE `hr_payrates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hr_references`
--

DROP TABLE IF EXISTS `hr_references`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hr_references` (
  `ReferenceId` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `ReferenceFor` bigint(20) unsigned NOT NULL,
  `ReferensorName` varchar(255) NOT NULL,
  `ReferensorPhone` bigint(20) unsigned NOT NULL,
  `ReceivedBy` bigint(20) unsigned NOT NULL,
  `ReceivedDate` date NOT NULL,
  `ReferenceNotes` text NOT NULL,
  PRIMARY KEY (`ReferenceId`),
  KEY `RefEmplyee_idx` (`ReferenceFor`),
  KEY `RefRequestor_idx` (`ReceivedBy`),
  KEY `RefRefPhoneRef_idx` (`ReferensorPhone`),
  KEY `idx_hr_references_ReceivedDate` (`ReceivedDate`),
  KEY `idx_hr_references_ReferensorName` (`ReferensorName`),
  CONSTRAINT `RefEmplyee` FOREIGN KEY (`ReferenceFor`) REFERENCES `hr_associates` (`AstId`) ON UPDATE CASCADE,
  CONSTRAINT `RefRefPhoneRef` FOREIGN KEY (`ReferensorPhone`) REFERENCES `cnt_phonesfaxes` (`PhnFaxId`) ON UPDATE CASCADE,
  CONSTRAINT `RefRequestor` FOREIGN KEY (`ReceivedBy`) REFERENCES `hr_associates` (`AstId`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hr_references`
--

LOCK TABLES `hr_references` WRITE;
/*!40000 ALTER TABLE `hr_references` DISABLE KEYS */;
/*!40000 ALTER TABLE `hr_references` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hr_residences`
--

DROP TABLE IF EXISTS `hr_residences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hr_residences` (
  `ResdenceId` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `AstId` bigint(20) unsigned NOT NULL,
  `ResAddress` bigint(20) unsigned NOT NULL,
  `ResPhone` bigint(20) unsigned NOT NULL,
  `DateMovedIn` date NOT NULL,
  `DateMovedOut` date DEFAULT NULL,
  PRIMARY KEY (`ResdenceId`),
  KEY `AstResidenceRef_idx` (`AstId`),
  KEY `ResAddrResRef_idx` (`ResAddress`),
  KEY `ResPhoneRef_idx` (`ResPhone`),
  KEY `idx_hr_residences_DateMovedIn` (`DateMovedIn`),
  KEY `idx_hr_residences_DateMovedOut` (`DateMovedOut`),
  CONSTRAINT `AstResidenceRef` FOREIGN KEY (`AstId`) REFERENCES `hr_associates` (`AstId`) ON UPDATE CASCADE,
  CONSTRAINT `ResAddrResRef` FOREIGN KEY (`ResAddress`) REFERENCES `cnt_addresses` (`AddrId`) ON UPDATE CASCADE,
  CONSTRAINT `ResPhoneRef` FOREIGN KEY (`ResPhone`) REFERENCES `cnt_phonesfaxes` (`PhnFaxId`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hr_residences`
--

LOCK TABLES `hr_residences` WRITE;
/*!40000 ALTER TABLE `hr_residences` DISABLE KEYS */;
/*!40000 ALTER TABLE `hr_residences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ins_policies`
--

DROP TABLE IF EXISTS `ins_policies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ins_policies` (
  `InsId` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `ProviderAgent` bigint(20) unsigned NOT NULL COMMENT 'Insurance Provider Record',
  `ProofOfInsurance` bigint(20) unsigned DEFAULT NULL,
  `TagName` varchar(64) NOT NULL,
  `WhatIsInsured` varchar(255) DEFAULT NULL,
  `PolicyNumber` varchar(255) NOT NULL COMMENT 'Policy Number',
  `EffectiveDate` date NOT NULL COMMENT 'Effective Date',
  `ExpirationDate` date NOT NULL COMMENT 'Expiration Date',
  `InsuredAmount` decimal(12,2) unsigned NOT NULL COMMENT 'Amount Insured',
  `DownpaymentAmount` decimal(12,2) unsigned NOT NULL DEFAULT '0.00' COMMENT 'Downpayment Amount',
  `PaidBy` enum('Owner','Company') DEFAULT NULL COMMENT 'Paid By',
  PRIMARY KEY (`InsId`),
  UNIQUE KEY `TagPolicyIndx` (`TagName`,`PolicyNumber`,`EffectiveDate`,`ExpirationDate`,`InsuredAmount`),
  KEY `ProofDocument_idx` (`ProofOfInsurance`),
  KEY `PolicyNumberIndx` (`PolicyNumber`) USING BTREE,
  KEY `ProviderAgentRef_idx` (`ProviderAgent`),
  KEY `idx_ins_policies_WhatIsInsured` (`WhatIsInsured`),
  KEY `idx_ins_policies_EffectiveDate` (`EffectiveDate`),
  KEY `idx_ins_policies_ExpirationDate` (`ExpirationDate`),
  KEY `idx_ins_policies_InsuredAmount` (`InsuredAmount`),
  KEY `idx_ins_policies_DownpaymentAmount` (`DownpaymentAmount`),
  KEY `idx_ins_policies_PaidBy` (`PaidBy`),
  CONSTRAINT `ProofDocument` FOREIGN KEY (`ProofOfInsurance`) REFERENCES `gen_files` (`FileId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ProviderAgentRef` FOREIGN KEY (`ProviderAgent`) REFERENCES `hr_associates` (`AstId`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ins_policies`
--

LOCK TABLES `ins_policies` WRITE;
/*!40000 ALTER TABLE `ins_policies` DISABLE KEYS */;
/*!40000 ALTER TABLE `ins_policies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ins_to_entities`
--

DROP TABLE IF EXISTS `ins_to_entities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ins_to_entities` (
  `InsEntId` bigint(20) unsigned NOT NULL,
  `InsId` bigint(20) unsigned NOT NULL,
  `EntityId` bigint(20) unsigned NOT NULL,
  `AddedBy` bigint(20) unsigned NOT NULL,
  `DateAdded` date NOT NULL,
  `RemovedBy` bigint(20) unsigned DEFAULT NULL,
  `DateRemoved` date DEFAULT NULL,
  `Notes` text,
  `ActionReminder` datetime DEFAULT NULL,
  `ActionNote` text,
  `ActionEmail` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`InsEntId`),
  KEY `idx_ins_to_entities_DateAdded` (`DateAdded`),
  KEY `InsIdRef_idx` (`InsId`),
  KEY `EntIdRef_idx` (`EntityId`),
  KEY `WhoAddedInsRef_idx` (`AddedBy`),
  KEY `WhoRemovedInsRed_idx` (`RemovedBy`),
  KEY `idx_ins_to_entities_DateRemoved` (`DateRemoved`),
  KEY `idx_ins_to_entities_ActionReminder` (`ActionReminder`),
  KEY `idx_ins_to_entities_ActionEmail` (`ActionEmail`),
  CONSTRAINT `EntIdRef` FOREIGN KEY (`EntityId`) REFERENCES `entities` (`EntityId`) ON UPDATE CASCADE,
  CONSTRAINT `EntInsAddedInsRef` FOREIGN KEY (`AddedBy`) REFERENCES `hr_associates` (`AstId`) ON UPDATE CASCADE,
  CONSTRAINT `EntInsRemovedInsRef` FOREIGN KEY (`RemovedBy`) REFERENCES `hr_associates` (`AstId`) ON UPDATE CASCADE,
  CONSTRAINT `InsIdRef` FOREIGN KEY (`InsId`) REFERENCES `ins_policies` (`InsId`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ins_to_entities`
--

LOCK TABLES `ins_to_entities` WRITE;
/*!40000 ALTER TABLE `ins_to_entities` DISABLE KEYS */;
/*!40000 ALTER TABLE `ins_to_entities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ins_to_vehicles`
--

DROP TABLE IF EXISTS `ins_to_vehicles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ins_to_vehicles` (
  `VhlInsId` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `InsId` bigint(20) unsigned NOT NULL,
  `VehicleId` bigint(20) unsigned NOT NULL,
  `AddedBy` bigint(20) unsigned NOT NULL,
  `DateAdded` date NOT NULL,
  `RemovedBy` bigint(20) unsigned DEFAULT NULL,
  `DateRemoved` date DEFAULT NULL,
  `ActionReminder` datetime DEFAULT NULL,
  `ActionNote` text,
  `ActionEmail` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`VhlInsId`),
  UNIQUE KEY `InsVsDateUnq` (`VhlInsId`,`DateAdded`),
  KEY `InsuranceVehicleVehicleRef_idx` (`VehicleId`),
  KEY `idx_ins_to_vehicles_DateAdded` (`DateAdded`),
  KEY `InsAddedByEmployeeRef_idx` (`AddedBy`),
  KEY `idx_ins_to_vehicles_DateRemoved` (`DateRemoved`),
  KEY `InsuranceVehiclePolicyRef_idx` (`InsId`),
  KEY `InsCanceledByEmployeeRef_idx` (`RemovedBy`),
  KEY `idx_ins_to_vehicles_ActionReminder` (`ActionReminder`),
  KEY `idx_ins_to_vehicles_ActionEmail` (`ActionEmail`),
  CONSTRAINT `InsAddedByEmployeeRef` FOREIGN KEY (`AddedBy`) REFERENCES `hr_associates` (`AstId`) ON UPDATE CASCADE,
  CONSTRAINT `InsCanceledByEmployeeRef` FOREIGN KEY (`RemovedBy`) REFERENCES `hr_associates` (`AstId`) ON UPDATE CASCADE,
  CONSTRAINT `InsuranceVehiclePolicyRef` FOREIGN KEY (`InsId`) REFERENCES `ins_policies` (`InsId`) ON UPDATE CASCADE,
  CONSTRAINT `InsuranceVehicleVehicleRef` FOREIGN KEY (`VehicleId`) REFERENCES `inv_vehicles` (`VehicleId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ins_to_vehicles`
--

LOCK TABLES `ins_to_vehicles` WRITE;
/*!40000 ALTER TABLE `ins_to_vehicles` DISABLE KEYS */;
/*!40000 ALTER TABLE `ins_to_vehicles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inv_elog_device`
--

DROP TABLE IF EXISTS `inv_elog_device`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inv_elog_device` (
  `ElogDeviceId` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`ElogDeviceId`),
  CONSTRAINT `ElogDeviceEquipmentRef` FOREIGN KEY (`ElogDeviceId`) REFERENCES `inv_equipment` (`EquipmentId`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inv_elog_device`
--

LOCK TABLES `inv_elog_device` WRITE;
/*!40000 ALTER TABLE `inv_elog_device` DISABLE KEYS */;
/*!40000 ALTER TABLE `inv_elog_device` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inv_equipment`
--

DROP TABLE IF EXISTS `inv_equipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inv_equipment` (
  `EquipmentId` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `GeneralName` varchar(1024) NOT NULL,
  `OwnerId` bigint(20) unsigned NOT NULL,
  `VendorId` bigint(20) unsigned DEFAULT NULL,
  `DatePurchased` date DEFAULT NULL,
  `DateSold` date DEFAULT NULL,
  `PricePurchased` decimal(12,2) DEFAULT NULL,
  `PriceSold` decimal(12,2) DEFAULT NULL,
  `SerialNo` varchar(255) DEFAULT NULL,
  `EquipmentType` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`EquipmentId`),
  KEY `EquipVendorRef_idx` (`VendorId`),
  KEY `idx_inv_equipment_GeneralName` (`GeneralName`),
  KEY `idx_inv_equipment_DatePurchased` (`DatePurchased`),
  KEY `idx_inv_equipment_DateSold` (`DateSold`),
  KEY `idx_inv_equipment_PricePurchased` (`PricePurchased`),
  KEY `idx_inv_equipment_PriceSold` (`PriceSold`),
  KEY `idx_inv_equipment_SerialNo` (`SerialNo`),
  KEY `EquipmentOwnerRef_idx` (`OwnerId`),
  KEY `EquipmentTypeRef_idx` (`EquipmentType`),
  CONSTRAINT `EquipVendorRef` FOREIGN KEY (`VendorId`) REFERENCES `biz_branches` (`BrnchId`) ON UPDATE CASCADE,
  CONSTRAINT `EquipmentOwnerRef` FOREIGN KEY (`OwnerId`) REFERENCES `hr_associates` (`AstId`) ON UPDATE CASCADE,
  CONSTRAINT `EquipmentTypeRef` FOREIGN KEY (`EquipmentType`) REFERENCES `inv_equipment_types` (`EquipmentTypeId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Connects all equipment tables with unique primary keys';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inv_equipment`
--

LOCK TABLES `inv_equipment` WRITE;
/*!40000 ALTER TABLE `inv_equipment` DISABLE KEYS */;
/*!40000 ALTER TABLE `inv_equipment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inv_equipment_docs`
--

DROP TABLE IF EXISTS `inv_equipment_docs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inv_equipment_docs` (
  `FileVsEquipId` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `FileId` bigint(20) unsigned NOT NULL,
  `EquipmentId` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`FileVsEquipId`),
  UNIQUE KEY `inv_equ_fls_uniq` (`FileId`,`EquipmentId`),
  KEY `EquipmentDocsEquipmentRef_idx` (`EquipmentId`),
  CONSTRAINT `EquipmentDocsEquipmentRef` FOREIGN KEY (`EquipmentId`) REFERENCES `inv_equipment` (`EquipmentId`) ON UPDATE CASCADE,
  CONSTRAINT `EquipmentDocsFileRef` FOREIGN KEY (`FileId`) REFERENCES `gen_files` (`FileId`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inv_equipment_docs`
--

LOCK TABLES `inv_equipment_docs` WRITE;
/*!40000 ALTER TABLE `inv_equipment_docs` DISABLE KEYS */;
/*!40000 ALTER TABLE `inv_equipment_docs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inv_equipment_to_support`
--

DROP TABLE IF EXISTS `inv_equipment_to_support`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inv_equipment_to_support` (
  `EquipSuppId` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `EquipmentId` bigint(20) unsigned NOT NULL,
  `SupportId` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`EquipSuppId`),
  KEY `EquipSupportSupportRef_idx` (`SupportId`),
  KEY `EquipSupportEquipRef` (`EquipmentId`),
  CONSTRAINT `EquipSupportEquipRef` FOREIGN KEY (`EquipmentId`) REFERENCES `inv_equipment` (`EquipmentId`) ON UPDATE CASCADE,
  CONSTRAINT `EquipSupportSupportRef` FOREIGN KEY (`SupportId`) REFERENCES `inv_support_vendors` (`SupportId`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inv_equipment_to_support`
--

LOCK TABLES `inv_equipment_to_support` WRITE;
/*!40000 ALTER TABLE `inv_equipment_to_support` DISABLE KEYS */;
/*!40000 ALTER TABLE `inv_equipment_to_support` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inv_equipment_types`
--

DROP TABLE IF EXISTS `inv_equipment_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inv_equipment_types` (
  `EquipmentTypeId` bigint(64) unsigned NOT NULL,
  `Name` varchar(64) NOT NULL,
  PRIMARY KEY (`EquipmentTypeId`),
  KEY `idx_inv_equipment_types_Name` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Types of equipment used for load requirement contraints';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inv_equipment_types`
--

LOCK TABLES `inv_equipment_types` WRITE;
/*!40000 ALTER TABLE `inv_equipment_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `inv_equipment_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inv_notes`
--

DROP TABLE IF EXISTS `inv_notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inv_notes` (
  `EqNoteId` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `EquipmentId` bigint(20) unsigned NOT NULL,
  `DateCreated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `PostedBy` bigint(20) unsigned NOT NULL,
  `Notes` text NOT NULL,
  PRIMARY KEY (`EqNoteId`),
  KEY `EqNoteHWref_idx` (`EquipmentId`),
  KEY `EqPersonRef_idx` (`PostedBy`),
  KEY `idx_inv_notes_DateCreated` (`DateCreated`),
  CONSTRAINT `EqNoteHWref` FOREIGN KEY (`EquipmentId`) REFERENCES `inv_equipment` (`EquipmentId`) ON UPDATE CASCADE,
  CONSTRAINT `EqPersonRef` FOREIGN KEY (`PostedBy`) REFERENCES `hr_associates` (`AstId`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inv_notes`
--

LOCK TABLES `inv_notes` WRITE;
/*!40000 ALTER TABLE `inv_notes` DISABLE KEYS */;
/*!40000 ALTER TABLE `inv_notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inv_roles`
--

DROP TABLE IF EXISTS `inv_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inv_roles` (
  `InvRoleId` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `RoleName` varchar(255) NOT NULL,
  `Notes` text,
  PRIMARY KEY (`InvRoleId`),
  UNIQUE KEY `RoleName_UNIQUE` (`RoleName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inv_roles`
--

LOCK TABLES `inv_roles` WRITE;
/*!40000 ALTER TABLE `inv_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `inv_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inv_semitrucks`
--

DROP TABLE IF EXISTS `inv_semitrucks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inv_semitrucks` (
  `SemitruckId` bigint(20) unsigned NOT NULL,
  `FuelTankSize` decimal(12,2) unsigned DEFAULT NULL COMMENT 'gallons',
  `MilesPerGallonEstimated` decimal(12,2) unsigned DEFAULT NULL COMMENT 'estimated mpg from trip distances and fuel usage or reported by driver',
  `MilesPerGallonRated` int(11) unsigned DEFAULT NULL COMMENT 'manufacturer''s claimed mpg',
  `TowCapacity` int(11) unsigned DEFAULT NULL COMMENT 'pounds',
  UNIQUE KEY `SemitruckId_UNIQUE` (`SemitruckId`),
  KEY `idx_inv_semitrucks_FuelTankSize` (`FuelTankSize`),
  KEY `idx_inv_semitrucks_MilesPerGallonEstimated` (`MilesPerGallonEstimated`),
  KEY `idx_inv_semitrucks_MilesPerGallonRated` (`MilesPerGallonRated`),
  KEY `idx_inv_semitrucks_TowCapacity` (`TowCapacity`),
  CONSTRAINT `TruckVehicleRef` FOREIGN KEY (`SemitruckId`) REFERENCES `inv_vehicles` (`VehicleId`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inv_semitrucks`
--

LOCK TABLES `inv_semitrucks` WRITE;
/*!40000 ALTER TABLE `inv_semitrucks` DISABLE KEYS */;
/*!40000 ALTER TABLE `inv_semitrucks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inv_sprinters`
--

DROP TABLE IF EXISTS `inv_sprinters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inv_sprinters` (
  `SprinterId` bigint(20) unsigned NOT NULL,
  `FuelTankCapacity` decimal(12,2) unsigned DEFAULT NULL COMMENT 'gallons',
  `MilesPerGallonEstimated` decimal(12,2) unsigned DEFAULT NULL COMMENT 'estimate from trip distances and fuel usage or reported from driver',
  `MilesPerGallonRated` int(11) unsigned DEFAULT NULL COMMENT 'manufacturer''s claimed mpg',
  `LoadLength` int(11) unsigned DEFAULT NULL COMMENT 'inches',
  `LoadWidth` int(11) unsigned DEFAULT NULL COMMENT 'inches',
  `RoofHeight` int(11) unsigned DEFAULT NULL COMMENT 'inches, top of bed floor to bottom of ceiling',
  `DoorHeight` int(11) unsigned DEFAULT NULL COMMENT 'inches',
  `DoorWidth` int(11) unsigned DEFAULT NULL COMMENT 'inches',
  `TowCapacity` int(11) unsigned DEFAULT NULL COMMENT 'pounds',
  `LoadCapacity` int(11) unsigned DEFAULT NULL COMMENT 'pounds',
  `LoadVolume` int(11) GENERATED ALWAYS AS (if(((`LoadLength` is not null) and (`LoadWidth` is not null) and (`RoofHeight` is not null)),((`LoadLength` * `LoadWidth`) * `RoofHeight`),NULL)) VIRTUAL COMMENT 'cubic inches',
  UNIQUE KEY `SprinterId_UNIQUE` (`SprinterId`),
  KEY `idx_inv_sprinters_FuelTankCapacity` (`FuelTankCapacity`),
  KEY `idx_inv_sprinters_MilesPerGallonEstimated` (`MilesPerGallonEstimated`),
  KEY `idx_inv_sprinters_MilesPerGallonRated` (`MilesPerGallonRated`),
  KEY `idx_inv_sprinters_LoadLength` (`LoadLength`),
  KEY `idx_inv_sprinters_LoadWidth` (`LoadWidth`),
  KEY `idx_inv_sprinters_RoofHeight` (`RoofHeight`),
  KEY `idx_inv_sprinters_DoorHeight` (`DoorHeight`),
  KEY `idx_inv_sprinters_DoorWidth` (`DoorWidth`),
  KEY `idx_inv_sprinters_TowCapacity` (`TowCapacity`),
  KEY `idx_inv_sprinters_LoadCapacity` (`LoadCapacity`),
  KEY `idx_inv_sprinters_LoadVolume` (`LoadVolume`),
  CONSTRAINT `SprinterVehicleRef` FOREIGN KEY (`SprinterId`) REFERENCES `inv_vehicles` (`VehicleId`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inv_sprinters`
--

LOCK TABLES `inv_sprinters` WRITE;
/*!40000 ALTER TABLE `inv_sprinters` DISABLE KEYS */;
/*!40000 ALTER TABLE `inv_sprinters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inv_support_vendors`
--

DROP TABLE IF EXISTS `inv_support_vendors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inv_support_vendors` (
  `SupportId` bigint(20) unsigned NOT NULL,
  `VendorId` bigint(20) unsigned NOT NULL,
  `PrimaryContact` bigint(20) unsigned DEFAULT NULL,
  `Name` varchar(255) NOT NULL,
  `Description` text,
  PRIMARY KEY (`SupportId`),
  KEY `SupportVendorPersonId_idx` (`VendorId`),
  KEY `idx_inv_support_vendors_Name` (`Name`),
  KEY `SupportContactRef_idx` (`PrimaryContact`),
  CONSTRAINT `SupportContactRef` FOREIGN KEY (`PrimaryContact`) REFERENCES `hr_associates` (`AstId`) ON UPDATE CASCADE,
  CONSTRAINT `SupportVendorPersonId` FOREIGN KEY (`VendorId`) REFERENCES `biz_branches` (`BrnchId`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inv_support_vendors`
--

LOCK TABLES `inv_support_vendors` WRITE;
/*!40000 ALTER TABLE `inv_support_vendors` DISABLE KEYS */;
/*!40000 ALTER TABLE `inv_support_vendors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inv_tiresizes`
--

DROP TABLE IF EXISTS `inv_tiresizes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inv_tiresizes` (
  `TireId` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `Name` varchar(16) NOT NULL,
  `Type` set('Truck','Trailer','Sprinter') NOT NULL DEFAULT 'Truck',
  PRIMARY KEY (`TireId`),
  UNIQUE KEY `Name_UNIQUE` (`Name`),
  KEY `idx_inv_tiresizes_Type` (`Type`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inv_tiresizes`
--

LOCK TABLES `inv_tiresizes` WRITE;
/*!40000 ALTER TABLE `inv_tiresizes` DISABLE KEYS */;
INSERT INTO `inv_tiresizes` VALUES (2,'10R22.5','Truck'),(4,'11R22.5','Truck'),(6,'11R24.5','Truck'),(8,'12R22.5','Truck'),(10,'12R24.5','Truck'),(12,'255/70R22.5','Truck'),(14,'275/70R22.5','Truck'),(16,'275/80R22.5','Truck'),(18,'285/75R24.5','Truck'),(20,'295/75R22.5','Truck');
/*!40000 ALTER TABLE `inv_tiresizes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inv_trailer_types`
--

DROP TABLE IF EXISTS `inv_trailer_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inv_trailer_types` (
  `Name` varchar(24) NOT NULL,
  PRIMARY KEY (`Name`),
  UNIQUE KEY `Name_UNIQUE` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Keeps the types of trailers which needs to be used in dsp_loads to find proper trailers';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inv_trailer_types`
--

LOCK TABLES `inv_trailer_types` WRITE;
/*!40000 ALTER TABLE `inv_trailer_types` DISABLE KEYS */;
INSERT INTO `inv_trailer_types` VALUES ('Car Hauler'),('Dry Van'),('Flatbed'),('Reefer'),('Step Deck');
/*!40000 ALTER TABLE `inv_trailer_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inv_trailers`
--

DROP TABLE IF EXISTS `inv_trailers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inv_trailers` (
  `TrailerId` bigint(20) unsigned NOT NULL,
  `Type` varchar(24) NOT NULL DEFAULT 'Van',
  `HazMat` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `LoadLength` int(11) unsigned DEFAULT NULL COMMENT 'In inches',
  `LoadWidth` int(11) unsigned DEFAULT NULL COMMENT 'In inches',
  `LoadHeight` int(11) unsigned DEFAULT NULL COMMENT 'In inches\n',
  `DoorWidth` int(11) unsigned DEFAULT NULL,
  `DoorHeight` int(11) unsigned DEFAULT NULL,
  `LoadCapactiy` int(11) unsigned DEFAULT NULL,
  `HasLiftGate` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `HasPalletJack` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `HasRamps` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `LoadVolume` int(11) GENERATED ALWAYS AS (if(((`LoadLength` is not null) and (`LoadWidth` is not null) and (`LoadHeight` is not null)),((`LoadLength` * `LoadWidth`) * `LoadHeight`),NULL)) STORED,
  UNIQUE KEY `TrailerId_UNIQUE` (`TrailerId`),
  KEY `TrailerTrailerTypeRef_idx` (`Type`),
  KEY `TrailerEquipRef_idx` (`TrailerId`),
  KEY `idx_inv_trailers_HazMat` (`HazMat`),
  KEY `idx_inv_trailers_LoadLength` (`LoadLength`),
  KEY `idx_inv_trailers_LoadWidth` (`LoadWidth`),
  KEY `idx_inv_trailers_LoadHeight` (`LoadHeight`),
  KEY `idx_inv_trailers_DoorWidth` (`DoorWidth`),
  KEY `idx_inv_trailers_DoorHeight` (`DoorHeight`),
  KEY `idx_inv_trailers_LoadCapactiy` (`LoadCapactiy`),
  KEY `idx_inv_trailers_HasLiftGate` (`HasLiftGate`),
  KEY `idx_inv_trailers_HasPalletJack` (`HasPalletJack`),
  KEY `idx_inv_trailers_HasRamps` (`HasRamps`),
  KEY `idx_inv_trailers_LoadVolume` (`LoadVolume`),
  CONSTRAINT `TrailerEquipRef` FOREIGN KEY (`TrailerId`) REFERENCES `inv_vehicles` (`VehicleId`) ON UPDATE CASCADE,
  CONSTRAINT `TrailerTrailerTypeRef` FOREIGN KEY (`Type`) REFERENCES `inv_trailer_types` (`Name`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='All trailers that can be attached to trucks';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inv_trailers`
--

LOCK TABLES `inv_trailers` WRITE;
/*!40000 ALTER TABLE `inv_trailers` DISABLE KEYS */;
/*!40000 ALTER TABLE `inv_trailers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inv_unit_reservations`
--

DROP TABLE IF EXISTS `inv_unit_reservations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inv_unit_reservations` (
  `ReservationId` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `PrsnId` bigint(20) unsigned NOT NULL,
  `UnitId` bigint(20) unsigned NOT NULL,
  `InvRoleId` bigint(20) unsigned NOT NULL COMMENT 'this should be a table called ''Roles'' or ''People_Roles'' that should be a foreign key which is also tied to ent_people, and ent_people should be able to have mutliple Roles and have the dataentry user select the role from a dropdown that is specific to the person they are trying to reserve under.',
  `DateReserved` date NOT NULL,
  `DateReleased` date DEFAULT NULL,
  `CreatedBy` bigint(20) unsigned DEFAULT NULL,
  `CreatedOn` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ReservationId`),
  KEY `UnitReservesPersonRef_idx` (`PrsnId`),
  KEY `UnitReservesUnitRef_idx` (`UnitId`),
  KEY `UnitRoleRef_idx` (`InvRoleId`),
  KEY `UnitAssignedByRef_idx` (`CreatedBy`),
  KEY `idx_inv_unit_reservations_DateReserved` (`DateReserved`),
  KEY `idx_inv_unit_reservations_DateReleased` (`DateReleased`),
  KEY `idx_inv_unit_reservations_CreatedOn` (`CreatedOn`),
  CONSTRAINT `UnitAssignedByRef` FOREIGN KEY (`CreatedBy`) REFERENCES `hr_associates` (`AstId`) ON UPDATE CASCADE,
  CONSTRAINT `UnitReservesPersonRef` FOREIGN KEY (`PrsnId`) REFERENCES `hr_associates` (`AstId`) ON UPDATE CASCADE,
  CONSTRAINT `UnitReservesUnitRef` FOREIGN KEY (`UnitId`) REFERENCES `inv_units` (`UnitId`) ON UPDATE CASCADE,
  CONSTRAINT `UnitRoleRef` FOREIGN KEY (`InvRoleId`) REFERENCES `inv_roles` (`InvRoleId`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Reservations for specific units, same unit can be reserved by multiple people in different roles';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inv_unit_reservations`
--

LOCK TABLES `inv_unit_reservations` WRITE;
/*!40000 ALTER TABLE `inv_unit_reservations` DISABLE KEYS */;
/*!40000 ALTER TABLE `inv_unit_reservations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inv_units`
--

DROP TABLE IF EXISTS `inv_units`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inv_units` (
  `UnitId` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `UnitTag` varchar(45) NOT NULL,
  PRIMARY KEY (`UnitId`),
  UNIQUE KEY `UnitTag_UNIQUE` (`UnitTag`),
  KEY `idx_inv_units_UnitTag` (`UnitTag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inv_units`
--

LOCK TABLES `inv_units` WRITE;
/*!40000 ALTER TABLE `inv_units` DISABLE KEYS */;
/*!40000 ALTER TABLE `inv_units` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inv_units_to_equipment`
--

DROP TABLE IF EXISTS `inv_units_to_equipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inv_units_to_equipment` (
  `EquipUnitResId` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `UnitId` bigint(20) unsigned NOT NULL,
  `EquipmentId` bigint(20) unsigned NOT NULL,
  `DateAdded` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `AddedBy` bigint(20) unsigned NOT NULL,
  `DateRemoved` datetime DEFAULT NULL,
  `RemovedBy` bigint(20) unsigned DEFAULT NULL,
  `Notes` text,
  PRIMARY KEY (`EquipUnitResId`),
  UNIQUE KEY `ReserveUnique` (`EquipmentId`,`UnitId`,`DateAdded`),
  KEY `idx_inv_units_to_equipment_DateAdded` (`DateAdded`),
  KEY `idx_inv_units_to_equipment_DateRemoved` (`DateRemoved`),
  KEY `UnitsToEquipAddedBy_idx` (`AddedBy`),
  KEY `UnitsToEquipRemovedBy_idx` (`RemovedBy`),
  KEY `UnitsToEquipUnitRef_idx` (`UnitId`),
  CONSTRAINT `UnitsToEquipAddedBy` FOREIGN KEY (`AddedBy`) REFERENCES `hr_associates` (`AstId`) ON UPDATE CASCADE,
  CONSTRAINT `UnitsToEquipEquipRef` FOREIGN KEY (`EquipmentId`) REFERENCES `inv_equipment` (`EquipmentId`) ON UPDATE CASCADE,
  CONSTRAINT `UnitsToEquipRemovedBy` FOREIGN KEY (`RemovedBy`) REFERENCES `hr_associates` (`AstId`) ON UPDATE CASCADE,
  CONSTRAINT `UnitsToEquipUnitRef` FOREIGN KEY (`UnitId`) REFERENCES `inv_units` (`UnitId`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Table that links which equipment belonged to which unit at which time';
/*!40101 SET character_set_client = @saved_cs_client */;

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
-- Table structure for table `inv_vehicles`
--

DROP TABLE IF EXISTS `inv_vehicles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inv_vehicles` (
  `VehicleId` bigint(20) unsigned NOT NULL,
  `CarrierId` bigint(20) unsigned NOT NULL,
  `Make` varchar(24) DEFAULT NULL,
  `Model` varchar(24) DEFAULT NULL,
  `Color` varchar(24) DEFAULT NULL,
  `VIN` varchar(19) NOT NULL,
  `TireSize` bigint(20) unsigned DEFAULT NULL,
  `Year` year(4) DEFAULT NULL,
  `Axels` int(11) DEFAULT NULL,
  `Length` int(11) unsigned DEFAULT NULL,
  `Height` int(11) unsigned DEFAULT NULL,
  `Width` int(11) unsigned DEFAULT NULL,
  `UnladenWeight` int(11) DEFAULT NULL,
  `Fuel` enum('none','deisel','unleaded') NOT NULL DEFAULT 'none',
  PRIMARY KEY (`VehicleId`),
  UNIQUE KEY `VIN_UNIQUE` (`VIN`),
  KEY `VehicleCarrierRef_idx` (`CarrierId`),
  KEY `VehicleTireSizeRef_idx` (`TireSize`),
  KEY `idx_inv_vehicles_Make` (`Make`),
  KEY `idx_inv_vehicles_Model` (`Model`),
  KEY `idx_inv_vehicles_Color` (`Color`),
  KEY `idx_inv_vehicles_VIN` (`VIN`),
  KEY `idx_inv_vehicles_TireSize` (`TireSize`),
  KEY `idx_inv_vehicles_Year` (`Year`),
  KEY `idx_inv_vehicles_Axels` (`Axels`),
  KEY `idx_inv_vehicles_Length` (`Length`),
  KEY `idx_inv_vehicles_Height` (`Height`),
  KEY `idx_inv_vehicles_Width` (`Width`),
  KEY `idx_inv_vehicles_UnladenWeight` (`UnladenWeight`),
  KEY `idx_inv_vehicles_Fuel` (`Fuel`),
  CONSTRAINT `VehicleCarrierRef` FOREIGN KEY (`CarrierId`) REFERENCES `ent_carriers` (`CarrierId`) ON UPDATE CASCADE,
  CONSTRAINT `VehicleEquipmentRef` FOREIGN KEY (`VehicleId`) REFERENCES `inv_equipment` (`EquipmentId`) ON UPDATE CASCADE,
  CONSTRAINT `VehicleTireSizeRef` FOREIGN KEY (`TireSize`) REFERENCES `inv_tiresizes` (`TireId`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inv_vehicles`
--

LOCK TABLES `inv_vehicles` WRITE;
/*!40000 ALTER TABLE `inv_vehicles` DISABLE KEYS */;
/*!40000 ALTER TABLE `inv_vehicles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `msg_access`
--

DROP TABLE IF EXISTS `msg_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `msg_access` (
  `macsid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `PermissionName` varchar(255) NOT NULL,
  PRIMARY KEY (`macsid`),
  UNIQUE KEY `PermissionName_UNIQUE` (`PermissionName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `msg_access`
--

LOCK TABLES `msg_access` WRITE;
/*!40000 ALTER TABLE `msg_access` DISABLE KEYS */;
/*!40000 ALTER TABLE `msg_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `msg_notes`
--

DROP TABLE IF EXISTS `msg_notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `msg_notes` (
  `mnoteid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `subject` varchar(1024) DEFAULT NULL,
  `body` text NOT NULL,
  `posted` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `author` bigint(20) unsigned NOT NULL,
  `sourcetable` varchar(64) NOT NULL,
  `sourceid` bigint(20) unsigned NOT NULL COMMENT 'record id from the source table',
  `macsid` bigint(20) unsigned NOT NULL,
  `keywords` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`mnoteid`),
  KEY `NoteAuthorRef_idx` (`author`),
  KEY `NoteACLref_idx` (`macsid`),
  KEY `idx_msg_notes_subject` (`subject`),
  KEY `idx_msg_notes_sourcetable` (`sourcetable`),
  KEY `idx_msg_notes_posted` (`posted`),
  KEY `idx_msg_notes_sourceid` (`sourceid`),
  KEY `idx_msg_notes_keywords` (`keywords`),
  CONSTRAINT `NoteACLref` FOREIGN KEY (`macsid`) REFERENCES `msg_access` (`macsid`) ON UPDATE CASCADE,
  CONSTRAINT `NoteAuthorRef` FOREIGN KEY (`author`) REFERENCES `hr_associates` (`AstId`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `msg_notes`
--

LOCK TABLES `msg_notes` WRITE;
/*!40000 ALTER TABLE `msg_notes` DISABLE KEYS */;
/*!40000 ALTER TABLE `msg_notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sft_elog_stats`
--

DROP TABLE IF EXISTS `sft_elog_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sft_elog_stats` (
  `GpsReqId` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `EquipmentId` bigint(20) unsigned NOT NULL,
  `Longitude` double NOT NULL,
  `Latitude` double NOT NULL,
  `Bearings` double DEFAULT NULL,
  `Speed` double unsigned DEFAULT NULL,
  `Fuel` double unsigned DEFAULT NULL,
  `Odometer` double unsigned DEFAULT NULL,
  `LocationProviderId` varchar(1024) NOT NULL,
  `EngineHours` double unsigned DEFAULT NULL,
  `VehicleState` varchar(255) DEFAULT NULL,
  `Acquired` datetime DEFAULT NULL,
  `Posted` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`GpsReqId`),
  UNIQUE KEY `LocationProviderId_UNIQUE` (`LocationProviderId`),
  KEY `GPSCoordsEquipmentRef_idx` (`EquipmentId`),
  KEY `idx_sft_elog_stats_Longitude` (`Longitude`),
  KEY `idx_sft_elog_stats_Latitude` (`Latitude`),
  KEY `idx_sft_elog_stats_Bearings` (`Bearings`),
  KEY `idx_sft_elog_stats_Speed` (`Speed`),
  KEY `idx_sft_elog_stats_Fuel` (`Fuel`),
  KEY `idx_sft_elog_stats_Odometer` (`Odometer`),
  KEY `idx_sft_elog_stats_EngineHours` (`EngineHours`),
  KEY `idx_sft_elog_stats_VehicleState` (`VehicleState`),
  KEY `idx_sft_elog_stats_Acquired` (`Acquired`),
  KEY `idx_sft_elog_stats_Posted` (`Posted`),
  CONSTRAINT `GPSCoordsEquipmentRef` FOREIGN KEY (`EquipmentId`) REFERENCES `inv_equipment` (`EquipmentId`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sft_elog_stats`
--

LOCK TABLES `sft_elog_stats` WRITE;
/*!40000 ALTER TABLE `sft_elog_stats` DISABLE KEYS */;
/*!40000 ALTER TABLE `sft_elog_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sft_ifta`
--

DROP TABLE IF EXISTS `sft_ifta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sft_ifta` (
  `IFTAId` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`IFTAId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sft_ifta`
--

LOCK TABLES `sft_ifta` WRITE;
/*!40000 ALTER TABLE `sft_ifta` DISABLE KEYS */;
/*!40000 ALTER TABLE `sft_ifta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sft_inspection_schedules`
--

DROP TABLE IF EXISTS `sft_inspection_schedules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sft_inspection_schedules` (
  `InspectionScheduleId` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `VehicleId` bigint(20) unsigned NOT NULL,
  `InspectionType` enum('Quarterly','Annually','90 Days') DEFAULT NULL,
  PRIMARY KEY (`InspectionScheduleId`),
  KEY `InspectScheduleVehicleRef_idx` (`VehicleId`),
  KEY `idx_sft_inspection_schedules_InspectionType` (`InspectionType`),
  CONSTRAINT `InspectScheduleVehicleRef` FOREIGN KEY (`VehicleId`) REFERENCES `inv_vehicles` (`VehicleId`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sft_inspection_schedules`
--

LOCK TABLES `sft_inspection_schedules` WRITE;
/*!40000 ALTER TABLE `sft_inspection_schedules` DISABLE KEYS */;
/*!40000 ALTER TABLE `sft_inspection_schedules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sft_log_entries`
--

DROP TABLE IF EXISTS `sft_log_entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sft_log_entries` (
  `LogbookEntryId` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `LogbookId` bigint(20) unsigned NOT NULL,
  `Location` bigint(20) unsigned DEFAULT NULL,
  `StartTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Activity` enum('ON DUTY','OFF DUTY','DRIVING','SLEEPING') NOT NULL,
  `DriverId` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`LogbookEntryId`),
  KEY `LogBookRef_idx` (`LogbookId`),
  KEY `LogBookGPSref_idx` (`Location`),
  KEY `LogBookDriverRef_idx` (`DriverId`),
  CONSTRAINT `LogBookDriverRef` FOREIGN KEY (`DriverId`) REFERENCES `drv_drivers` (`DriverId`) ON UPDATE CASCADE,
  CONSTRAINT `LogBookGPSref` FOREIGN KEY (`Location`) REFERENCES `sft_elog_stats` (`GpsReqId`) ON UPDATE CASCADE,
  CONSTRAINT `LogBookRef` FOREIGN KEY (`LogbookId`) REFERENCES `sft_logbooks` (`LogbookId`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Entries for the driver logbook';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sft_log_entries`
--

LOCK TABLES `sft_log_entries` WRITE;
/*!40000 ALTER TABLE `sft_log_entries` DISABLE KEYS */;
/*!40000 ALTER TABLE `sft_log_entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sft_logbooks`
--

DROP TABLE IF EXISTS `sft_logbooks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sft_logbooks` (
  `LogbookId` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `DateStarted` date NOT NULL,
  `Notes` text,
  `Trip` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`LogbookId`),
  KEY `LogbookTripRef_idx` (`Trip`),
  KEY `idx_sft_logbooks_Date` (`DateStarted`),
  CONSTRAINT `LogbookTripRef` FOREIGN KEY (`Trip`) REFERENCES `dsp_trips` (`TripId`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Driver logbook meta table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sft_logbooks`
--

LOCK TABLES `sft_logbooks` WRITE;
/*!40000 ALTER TABLE `sft_logbooks` DISABLE KEYS */;
/*!40000 ALTER TABLE `sft_logbooks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sft_vehicle_inspect_items`
--

DROP TABLE IF EXISTS `sft_vehicle_inspect_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sft_vehicle_inspect_items` (
  `InspItmId` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `ItemAreaName` varchar(255) NOT NULL,
  `Notes` text,
  PRIMARY KEY (`InspItmId`),
  UNIQUE KEY `ItemAreaName_UNIQUE` (`ItemAreaName`)
) ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sft_vehicle_inspect_items`
--

LOCK TABLES `sft_vehicle_inspect_items` WRITE;
/*!40000 ALTER TABLE `sft_vehicle_inspect_items` DISABLE KEYS */;
INSERT INTO `sft_vehicle_inspect_items` VALUES (1,'Brakes',NULL),(3,'BrakesAdjustment',NULL),(5,'BrakesMechanicalComponent',NULL),(7,'BrakesDrumRotor',NULL),(9,'BrakesHoseTubing',NULL),(11,'BrakesLining',NULL),(13,'BrakesAntilockSystem',NULL),(15,'BrakesAutomaticAdjusters',NULL),(17,'BrakesLowAirWarning',NULL),(19,'BrakesTrailerAirSupply',NULL),(21,'BrakesCompressor',NULL),(23,'BrakesParkingBrakes',NULL),(25,'BrakesOther',NULL),(27,'Couplers',NULL),(29,'CouplersFifthWheelMount',NULL),(31,'CouplersPinUpperPlate',NULL),(33,'CouplersPintleHookEye',NULL),(35,'CouplersSafetyChains',NULL),(37,'Exhaust',NULL),(39,'ExhaustLeaks',NULL),(41,'ExhaustPlacement',NULL),(43,'Lighting',NULL),(45,'LightingHeadlights',NULL),(47,'LightingTailStop',NULL),(49,'LightingClearanceMarker',NULL),(51,'LightingIdentification',NULL),(53,'LightingReflectors',NULL),(55,'LightingOther',NULL),(57,'CabBody',NULL),(59,'CabBodyAccess',NULL),(61,'CabBodyEqptLoadSecure',NULL),(63,'CabBodyTieDowns',NULL),(65,'CabBodyHeaderboard',NULL),(67,'CabBodyMotorcoachSeats',NULL),(69,'CabBodyOther',NULL),(71,'Steering',NULL),(73,'SteeringAdjustment',NULL),(75,'SteeringColumnGear',NULL),(77,'SteeringAxle',NULL),(79,'SteeringLinkage',NULL),(81,'SteeringPowerSteering',NULL),(83,'SteeringOther',NULL),(85,'FuelSystem',NULL),(87,'FuelSystemTanks',NULL),(89,'FuelSystemLines',NULL),(91,'Suspension',NULL),(93,'SuspensionSprings',NULL),(95,'SuspensionAttachments',NULL),(97,'SuspensionSliders',NULL),(99,'Mirrors',NULL),(101,'Frame',NULL),(103,'FrameMembers',NULL),(105,'FrameClearance',NULL),(107,'Tires',NULL),(109,'TiresTread',NULL),(111,'TiresInflation',NULL),(113,'TiresDamage',NULL),(115,'TiresSpeedRestrictions',NULL),(117,'TiresOther',NULL),(119,'WheelsRim',NULL),(121,'WheelsRimFasteners',NULL),(123,'WheelsRimDiskSpoke',NULL),(125,'Windshield',NULL),(127,'WindshieldWipers',NULL);
/*!40000 ALTER TABLE `sft_vehicle_inspect_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sft_vehicle_inspect_proofs`
--

DROP TABLE IF EXISTS `sft_vehicle_inspect_proofs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sft_vehicle_inspect_proofs` (
  `InspectImageId` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `FileRef` bigint(20) unsigned NOT NULL,
  `InspectedItemId` bigint(20) unsigned NOT NULL,
  `Notes` text,
  PRIMARY KEY (`InspectImageId`),
  KEY `proofsFileRef_idx` (`FileRef`),
  KEY `proofsItemRef_idx` (`InspectedItemId`),
  CONSTRAINT `proofsFileRef` FOREIGN KEY (`FileRef`) REFERENCES `gen_files` (`FileId`) ON UPDATE CASCADE,
  CONSTRAINT `proofsItemRef` FOREIGN KEY (`InspectedItemId`) REFERENCES `sft_vehicle_inspected_items` (`InspectedId`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sft_vehicle_inspect_proofs`
--

LOCK TABLES `sft_vehicle_inspect_proofs` WRITE;
/*!40000 ALTER TABLE `sft_vehicle_inspect_proofs` DISABLE KEYS */;
/*!40000 ALTER TABLE `sft_vehicle_inspect_proofs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sft_vehicle_inspected_items`
--

DROP TABLE IF EXISTS `sft_vehicle_inspected_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sft_vehicle_inspected_items` (
  `InspectedId` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `InspectionId` bigint(20) unsigned NOT NULL,
  `InspectedItem` bigint(20) unsigned NOT NULL,
  `Status` enum('NA','OK','REPAIR') NOT NULL,
  `InspectedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`InspectedId`),
  KEY `InspctdInspectedItemRef_idx` (`InspectedItem`),
  KEY `InspctdInspectionRef_idx` (`InspectionId`),
  KEY `idx_sft_vehicle_inspected_items_InspectedDate` (`InspectedDate`),
  KEY `idx_sft_vehicle_inspected_items_Status` (`Status`),
  CONSTRAINT `InspctdInspectedItemRef` FOREIGN KEY (`InspectedItem`) REFERENCES `sft_vehicle_inspect_items` (`InspItmId`) ON UPDATE CASCADE,
  CONSTRAINT `InspctdInspectionRef` FOREIGN KEY (`InspectionId`) REFERENCES `sft_vehicle_inspections` (`InspectionId`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sft_vehicle_inspected_items`
--

LOCK TABLES `sft_vehicle_inspected_items` WRITE;
/*!40000 ALTER TABLE `sft_vehicle_inspected_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `sft_vehicle_inspected_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sft_vehicle_inspections`
--

DROP TABLE IF EXISTS `sft_vehicle_inspections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sft_vehicle_inspections` (
  `InspectionId` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `InspectionScheduleId` bigint(20) unsigned NOT NULL,
  `InspectorId` bigint(20) unsigned NOT NULL,
  `InspectorSignatureId` bigint(20) unsigned NOT NULL,
  `LocationOfRecords` bigint(20) unsigned NOT NULL,
  `InspectionNumber` varchar(10) NOT NULL,
  `DateInspection` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Status` enum('Passed','Failed','Postponed','Other') NOT NULL DEFAULT 'Other',
  `Remarks` text,
  `Mileage` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`InspectionId`),
  KEY `VehicleInspectScheduleRef_idx` (`InspectionScheduleId`),
  KEY `VehicleInspectInspectorRef_idx` (`InspectorId`),
  KEY `VehicleInspectionSignatureRef_idx` (`InspectorSignatureId`),
  KEY `LocationOfRecords_idx` (`LocationOfRecords`),
  KEY `idx_sft_vehicle_inspections_InspectionNumber` (`InspectionNumber`),
  KEY `idx_sft_vehicle_inspections_DateInspection` (`DateInspection`),
  KEY `idx_sft_vehicle_inspections_Status` (`Status`),
  CONSTRAINT `LocationOfRecordsRef` FOREIGN KEY (`LocationOfRecords`) REFERENCES `cnt_addresses` (`AddrId`) ON UPDATE CASCADE,
  CONSTRAINT `VehicleInspectInspectionScheduleIdRef` FOREIGN KEY (`InspectorId`) REFERENCES `hr_associates` (`AstId`) ON UPDATE CASCADE,
  CONSTRAINT `VehicleInspectScheduleRef` FOREIGN KEY (`InspectionScheduleId`) REFERENCES `sft_inspection_schedules` (`InspectionScheduleId`) ON UPDATE CASCADE,
  CONSTRAINT `VehicleInspectionSignatureRef` FOREIGN KEY (`InspectorSignatureId`) REFERENCES `gen_files` (`FileId`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sft_vehicle_inspections`
--

LOCK TABLES `sft_vehicle_inspections` WRITE;
/*!40000 ALTER TABLE `sft_vehicle_inspections` DISABLE KEYS */;
/*!40000 ALTER TABLE `sft_vehicle_inspections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sft_vehicle_registration`
--

DROP TABLE IF EXISTS `sft_vehicle_registration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sft_vehicle_registration` (
  `RegistrationId` bigint(20) unsigned NOT NULL,
  `VehicleId` bigint(20) unsigned NOT NULL,
  `PlateNumber` varchar(16) NOT NULL,
  `State` varchar(2) NOT NULL,
  `RegistrationCard` bigint(20) unsigned NOT NULL,
  `RegistrationDate` datetime NOT NULL,
  `DateExpiration` datetime NOT NULL,
  `ProRate` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT 'vehicle has international tag',
  PRIMARY KEY (`RegistrationId`),
  UNIQUE KEY `PlateNumber_UNIQUE` (`PlateNumber`,`State`),
  KEY `VehicleRegVehicleRef_idx` (`VehicleId`),
  KEY `idx_sft_vehicle_registration_PlateNumber` (`PlateNumber`),
  KEY `idx_sft_vehicle_registration_State` (`State`),
  KEY `idx_sft_vehicle_registration_DateRegistration` (`RegistrationDate`),
  KEY `idx_sft_vehicle_registration_DateExpiration` (`DateExpiration`),
  KEY `idx_sft_vehicle_registration_ProRate` (`ProRate`),
  KEY `VehicleRegCardPhotoRef_idx` (`RegistrationCard`),
  CONSTRAINT `VehicleRegCardPhotoRef` FOREIGN KEY (`RegistrationCard`) REFERENCES `gen_files` (`FileId`) ON UPDATE CASCADE,
  CONSTRAINT `VehicleRegVehicleRef` FOREIGN KEY (`VehicleId`) REFERENCES `inv_vehicles` (`VehicleId`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sft_vehicle_registration`
--

LOCK TABLES `sft_vehicle_registration` WRITE;
/*!40000 ALTER TABLE `sft_vehicle_registration` DISABLE KEYS */;
/*!40000 ALTER TABLE `sft_vehicle_registration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tmp_relations_clsr`
--

DROP TABLE IF EXISTS `tmp_relations_clsr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tmp_relations_clsr` (
  `AncestorId` bigint(20) unsigned NOT NULL,
  `DescendantId` bigint(20) unsigned NOT NULL,
  `Depth` int(11) NOT NULL,
  KEY `TmpRelClsrAncestorRef_idx` (`AncestorId`),
  KEY `TmpRelClsrDescendantRef_idx` (`DescendantId`),
  CONSTRAINT `TmpRelationClsrAncestorRef` FOREIGN KEY (`AncestorId`) REFERENCES `tmp_relations_nodes` (`RelNodeId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `TmpRelationClsrDescendant` FOREIGN KEY (`DescendantId`) REFERENCES `tmp_relations_nodes` (`RelNodeId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This is a temporary table that helps remind how to setup closure tables.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tmp_relations_clsr`
--

LOCK TABLES `tmp_relations_clsr` WRITE;
/*!40000 ALTER TABLE `tmp_relations_clsr` DISABLE KEYS */;
/*!40000 ALTER TABLE `tmp_relations_clsr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tmp_relations_nodes`
--

DROP TABLE IF EXISTS `tmp_relations_nodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tmp_relations_nodes` (
  `RelNodeId` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) DEFAULT NULL,
  `ParentId` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`RelNodeId`),
  KEY `TmpRelNodesParentRef_idx` (`ParentId`),
  CONSTRAINT `TmpRelNodesParentRef` FOREIGN KEY (`ParentId`) REFERENCES `tmp_relations_nodes` (`RelNodeId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This is a temporary Table that helps remind how to setup closure tables';
/*!40101 SET character_set_client = @saved_cs_client */;

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
-- Table structure for table `tsk_actns`
--

DROP TABLE IF EXISTS `tsk_actns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tsk_actns` (
  `actid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tskid` bigint(20) unsigned NOT NULL,
  `PrsnId` bigint(20) unsigned NOT NULL,
  `note` varchar(1024) DEFAULT NULL COMMENT 'Notes or comments if required',
  PRIMARY KEY (`actid`),
  KEY `idx_tsk_actns_note` (`note`),
  KEY `ActnToTask_idx` (`tskid`),
  KEY `ActnToUid_idx` (`PrsnId`),
  CONSTRAINT `ActnToTask` FOREIGN KEY (`tskid`) REFERENCES `tsk_tasks` (`tskid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ActnToUid` FOREIGN KEY (`PrsnId`) REFERENCES `ent_people` (`PrsnId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Actions - actual execution of the task';
/*!40101 SET character_set_client = @saved_cs_client */;

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
-- Table structure for table `tsk_alrms`
--

DROP TABLE IF EXISTS `tsk_alrms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tsk_alrms` (
  `alrmid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tskid` bigint(20) unsigned NOT NULL,
  `message` varchar(512) NOT NULL COMMENT 'message to display',
  `atcrontab` varchar(255) NOT NULL COMMENT 'the AT or CRONTAB time',
  `periodic` enum('yes','no') NOT NULL DEFAULT 'no',
  `repeat` int(11) NOT NULL DEFAULT '0' COMMENT 'Limit itirations to given number. Zero means no limit.',
  `turnoff` datetime DEFAULT NULL COMMENT 'Turn off alarm at specific time and date',
  PRIMARY KEY (`alrmid`),
  UNIQUE KEY `unq_tsk_alrms_tskid_message` (`tskid`,`message`),
  KEY `AlertToTask_idx` (`tskid`),
  KEY `idx_tsk_alrms_message` (`message`) USING BTREE,
  KEY `idx_tsk_alrms_atcrontab` (`atcrontab`) USING BTREE,
  KEY `idx_tsk_alrms_periodic` (`periodic`) USING BTREE,
  KEY `idx_tsk_alrms_turnoff` (`turnoff`) USING BTREE,
  CONSTRAINT `AlertToTask` FOREIGN KEY (`tskid`) REFERENCES `tsk_tasks` (`tskid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Reminders';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tsk_alrms`
--

LOCK TABLES `tsk_alrms` WRITE;
/*!40000 ALTER TABLE `tsk_alrms` DISABLE KEYS */;
/*!40000 ALTER TABLE `tsk_alrms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tsk_ntfis`
--

DROP TABLE IF EXISTS `tsk_ntfis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tsk_ntfis` (
  `alrtid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `PrsnId` bigint(20) unsigned NOT NULL,
  `alrmid` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`alrtid`),
  KEY `alrt_to_alrm_idx` (`alrmid`),
  KEY `alrt_to_PrsnId_idx` (`PrsnId`),
  CONSTRAINT `alrt_to_PrsnId` FOREIGN KEY (`PrsnId`) REFERENCES `ent_people` (`PrsnId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `alrt_to_alrm` FOREIGN KEY (`alrmid`) REFERENCES `tsk_alrms` (`alrmid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Who to notify when alarm triggers';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tsk_ntfis`
--

LOCK TABLES `tsk_ntfis` WRITE;
/*!40000 ALTER TABLE `tsk_ntfis` DISABLE KEYS */;
/*!40000 ALTER TABLE `tsk_ntfis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `tsk_pedigree`
--

DROP TABLE IF EXISTS `tsk_pedigree`;
/*!50001 DROP VIEW IF EXISTS `tsk_pedigree`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `tsk_pedigree` AS SELECT 
 1 AS `ancestor`,
 1 AS `descendant`,
 1 AS `Parent`,
 1 AS `Child`,
 1 AS `length`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `tsk_peditree`
--

DROP TABLE IF EXISTS `tsk_peditree`;
/*!50001 DROP VIEW IF EXISTS `tsk_peditree`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `tsk_peditree` AS SELECT 
 1 AS `Parent`,
 1 AS `Child`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `tsk_resps`
--

DROP TABLE IF EXISTS `tsk_resps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tsk_resps` (
  `respid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tskid` bigint(20) unsigned NOT NULL,
  `PrsnId` bigint(20) unsigned NOT NULL,
  `role` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`respid`),
  UNIQUE KEY `WhoDoesUnq` (`tskid`,`PrsnId`),
  KEY `WhoDoTaskRef_idx` (`tskid`),
  KEY `WhoDoUidRef_idx` (`PrsnId`),
  KEY `idx_whods_role` (`role`),
  CONSTRAINT `WhoDoTaskRef` FOREIGN KEY (`tskid`) REFERENCES `tsk_tasks` (`tskid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `WhoDoUidRef` FOREIGN KEY (`PrsnId`) REFERENCES `ent_people` (`PrsnId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='Task, User, Action - connections';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tsk_resps`
--

LOCK TABLES `tsk_resps` WRITE;
/*!40000 ALTER TABLE `tsk_resps` DISABLE KEYS */;
INSERT INTO `tsk_resps` VALUES (19,13,21,'Task Executor');
/*!40000 ALTER TABLE `tsk_resps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tsk_tasks`
--

DROP TABLE IF EXISTS `tsk_tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tsk_tasks` (
  `tskid` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Task ID',
  `prjid` bigint(20) unsigned DEFAULT NULL COMMENT 'Parent Task or Project ID',
  `PrsnId` bigint(20) unsigned NOT NULL COMMENT 'Who created the tsk_tasks',
  `name` varchar(255) NOT NULL COMMENT 'Short name of the task/project',
  `created` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'When created',
  `startdate` datetime DEFAULT NULL,
  `duedate` datetime DEFAULT NULL,
  `completed` datetime DEFAULT NULL COMMENT 'When completed',
  `estimated` int(11) unsigned DEFAULT NULL COMMENT 'Estimated time to complete hrs:min',
  `priority` int(11) unsigned DEFAULT '0' COMMENT 'Task priority: higher then number more urgent it is',
  `severity` int(11) unsigned DEFAULT '0' COMMENT 'Severity: higher the number more important it is',
  PRIMARY KEY (`tskid`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  KEY `prjtskfk` (`prjid`),
  KEY `tskPrsnIdfk` (`PrsnId`),
  KEY `idx_tsk_tasks_name` (`name`),
  KEY `idx_tsk_tasks_created` (`created`),
  KEY `idx_tsk_tasks_completed` (`completed`),
  KEY `idx_tsk_tasks_estimated` (`estimated`),
  KEY `idx_tsk_tasks_priority` (`priority`),
  KEY `idx_tsk_tasks_severity` (`severity`),
  KEY `idx_tsk_tasks_startdate` (`startdate`),
  KEY `idx_tsk_tasks_duedate` (`duedate`),
  CONSTRAINT `prjtskfk` FOREIGN KEY (`prjid`) REFERENCES `tsk_tasks` (`tskid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tskPrsnIdfk` FOREIGN KEY (`PrsnId`) REFERENCES `ent_people` (`PrsnId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='Task/Project Tree';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tsk_tasks`
--

LOCK TABLES `tsk_tasks` WRITE;
/*!40000 ALTER TABLE `tsk_tasks` DISABLE KEYS */;
INSERT INTO `tsk_tasks` VALUES (13,NULL,21,'Test Project','2019-06-16 08:09:50',NULL,NULL,NULL,NULL,1,1);
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
-- Table structure for table `tsk_times`
--

DROP TABLE IF EXISTS `tsk_times`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tsk_times` (
  `tmeid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `actid` bigint(20) unsigned NOT NULL,
  `PrsnId` bigint(20) unsigned NOT NULL,
  `started` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `finished` datetime DEFAULT NULL,
  `duration` time DEFAULT NULL,
  `fulllength` int(11) DEFAULT NULL,
  PRIMARY KEY (`tmeid`),
  KEY `TimesOfActns_idx` (`actid`),
  KEY `idx_tsk_times_started` (`started`),
  KEY `idx_tsk_times_finished` (`finished`),
  KEY `TimesOfUser_idx` (`PrsnId`),
  KEY `idx_tsk_times_duration` (`duration`) USING BTREE,
  KEY `idx_tsk_times_fulllength` (`fulllength`) USING BTREE,
  CONSTRAINT `TimesOfActns` FOREIGN KEY (`actid`) REFERENCES `tsk_actns` (`actid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `TimesOfUser` FOREIGN KEY (`PrsnId`) REFERENCES `ent_people` (`PrsnId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tsk_times`
--

LOCK TABLES `tsk_times` WRITE;
/*!40000 ALTER TABLE `tsk_times` DISABLE KEYS */;
/*!40000 ALTER TABLE `tsk_times` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tsk_trees`
--

DROP TABLE IF EXISTS `tsk_trees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tsk_trees` (
  `ans_des_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `ancestor` bigint(20) unsigned NOT NULL,
  `descendant` bigint(20) unsigned NOT NULL,
  `length` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ans_des_id`),
  UNIQUE KEY `TskAnsDesUnq` (`ancestor`,`descendant`),
  KEY `idx_tsk_trees_length` (`length`),
  KEY `DesTaskRef_idx` (`descendant`),
  CONSTRAINT `AncTaskRef` FOREIGN KEY (`ancestor`) REFERENCES `tsk_tasks` (`tskid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `DesTaskRef` FOREIGN KEY (`descendant`) REFERENCES `tsk_tasks` (`tskid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Project Tree Closures';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tsk_trees`
--

LOCK TABLES `tsk_trees` WRITE;
/*!40000 ALTER TABLE `tsk_trees` DISABLE KEYS */;
INSERT INTO `tsk_trees` VALUES (2,13,13,0);
/*!40000 ALTER TABLE `tsk_trees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'tms'
--
/*!50003 DROP PROCEDURE IF EXISTS `ancestors` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `ancestors`(IN PrjName VARCHAR(255))
BEGIN
    DECLARE ProjId BIGINT UNSIGNED DEFAULT NULL;
    SELECT tskid INTO ProjId FROM tsk_tasks WHERE `name` = PrjName;
    IF ISNULL(ProjId) THEN
		select `Parent`,`Child`,`length` from `tsk_pedigree`;
	ELSE
		select `Parent`,`Child`,`length` from `tsk_pedigree` WHERE `descendant` = ProjId;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `descendants` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `descendants`(IN PrjName VARCHAR(255))
BEGIN
    DECLARE ProjId BIGINT UNSIGNED DEFAULT NULL;
    SELECT tskid INTO ProjId FROM tsk_tasks WHERE `name` = PrjName;
    IF ISNULL(ProjId) THEN
		select `Parent`,`Child`,`length` from `tsk_pedigree`;
	ELSE
		select `Parent`,`Child`,`length` from `tsk_pedigree` WHERE `ancestor`=ProjId;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `dist_500_meters` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`192.168.1%.%` PROCEDURE `dist_500_meters`(IN lat DECIMAL(8,6) , IN lon DECIMAL(9,6))
BEGIN
	SELECT IF (ST_Distance_Sphere( point(lat, lon), point(0,0)) < 500.0, 1, 0) as Answer;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `entities_per_jobid` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`192.168.1%.%` PROCEDURE `entities_per_jobid`(IN trip_id BIGINT(20))
BEGIN
(SELECT 
    CreatedBy AS id
FROM
    dsp_trips
WHERE
    TripId = trip_id) UNION (SELECT 
    AddedBy AS id
FROM
    dsp_trips_loads
WHERE
    TripId = trip_id) UNION (SELECT 
    CreatedBy AS id
FROM
    dsp_loads lds
        LEFT JOIN
    dsp_trips_loads tr_lds ON lds.LoadId = tr_lds.LoadId
WHERE
    tr_lds.TripId = trip_id) UNION (SELECT 
    BrokerId AS id
FROM
    dsp_loads lds
        LEFT JOIN
    dsp_trips_loads tr_lds ON lds.LoadId = tr_lds.LoadId
WHERE
    tr_lds.TripId = trip_id) UNION (SELECT 
    ShipperId AS id
FROM
    dsp_loads lds
        LEFT JOIN
    dsp_trips_loads tr_lds ON lds.LoadId = tr_lds.LoadId
WHERE
    tr_lds.TripId = trip_id) UNION (SELECT 
    BookedBy AS id
FROM
    dsp_loads lds
        LEFT JOIN
    dsp_trips_loads tr_lds ON lds.LoadId = tr_lds.LoadId
WHERE
    tr_lds.TripId = trip_id) UNION (SELECT 
    lds_u.AddedBy AS id
FROM
    dsp_loads_dispatched lds_u
        LEFT JOIN
    dsp_trips_loads tr_lds ON lds_u.LoadId = tr_lds.LoadId
WHERE
    tr_lds.TripId = trip_id) UNION (SELECT 
    u_r.PrsnId AS id
FROM
    inv_unit_reservations u_r
        LEFT JOIN
    dsp_loads_dispatched lds_u ON lds_u.UnitId = u_r.UnitId
        LEFT JOIN
    dsp_trips_loads tr_lds ON tr_lds.LoadId = lds_u.LoadId
WHERE
    tr_lds.TripId = trip_id) UNION (SELECT 
    OwnerId AS id
FROM
    inv_equipment e
        LEFT JOIN
    inv_unit_reservations u_r ON u_r.UnitId = e.EquipmentId
        LEFT JOIN
    dsp_loads_dispatched lds_u ON lds_u.UnitId = u_r.UnitId
        LEFT JOIN
    dsp_trips_loads tr_lds ON tr_lds.LoadId = lds_u.LoadId
WHERE
    tr_lds.TripId = trip_id) UNION (SELECT 
    VendorId AS id
FROM
    inv_support_vendors s_v
        LEFT JOIN
    inv_equipment_to_support e_t_s ON s_v.SupportId = e_t_s.SupportId
        LEFT JOIN
    inv_equipment e ON e.EquipmentId = e_t_s.EquipmentId
        LEFT JOIN
    inv_unit_reservations u_r ON u_r.UnitId = e.EquipmentId
        LEFT JOIN
    dsp_loads_dispatched lds_u ON lds_u.UnitId = u_r.UnitId
        LEFT JOIN
    dsp_trips_loads tr_lds ON tr_lds.LoadId = lds_u.LoadId
WHERE
    tr_lds.TripId = trip_id) UNION (SELECT 
    CarrierId AS id
FROM
	inv_vehicles v 
        LEFT JOIN
    inv_equipment e ON e.EquipmentId = v.VehicleId
        LEFT JOIN
    inv_unit_reservations u_r ON u_r.UnitId = e.EquipmentId
        LEFT JOIN
    dsp_loads_dispatched lds_u ON lds_u.UnitId = u_r.UnitId
        LEFT JOIN
    dsp_trips_loads tr_lds ON tr_lds.LoadId = lds_u.LoadId
WHERE
    tr_lds.TripId = trip_id);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `fin_invoice_factor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`192.168.1%.%` PROCEDURE `fin_invoice_factor`(IN parent BIGINT(20), IN invoice BIGINT(20))
BEGIN
	START TRANSACTION;
		UPDATE fin_invoices
		SET FactoredParent = parent
		WHERE InvoiceId = invoice;
		
		INSERT INTO 
			fin_invoice_factor_trees (AncestorId, DescendantId, Depth) 
		SELECT 
			AncestorId, invoice, Depth + 1
		FROM 
			fin_invoice_factor_trees
		WHERE 
			DescendantId = parent
		UNION ALL 
			SELECT 
				invoice, invoice, 0;
	COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `moveact` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`192.168.1%.%` PROCEDURE `moveact`(IN PrjName VARCHAR(255),IN ActionID bigint unsigned)
BEGIN
    DECLARE ProjId BIGINT UNSIGNED DEFAULT NULL;
    SELECT tskid INTO ProjId FROM tsk_tasks WHERE `name` = PrjName;
    IF NOT ISNULL(ProjId) AND NOT ISNULL(ActionID) THEN
	     UPDATE `tsk_actns` SET `tskid`=ProjId WHERE `actid` = ActionID;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `movetask` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`192.168.1%.%` PROCEDURE `movetask`(IN PrjName VARCHAR(255),IN TskName VARCHAR(255))
BEGIN
    DECLARE ProjId BIGINT UNSIGNED DEFAULT NULL;
    DECLARE TaskId BIGINT UNSIGNED DEFAULT NULL;
    
    SELECT tskid INTO ProjId FROM tsk_tasks WHERE `name` = PrjName;
    SELECT tskid INTO TaskId FROM tsk_tasks WHERE `name` = TskName;
    
    IF NOT ISNULL(ProjId) AND NOT ISNULL(TaskId) THEN
	     UPDATE `tsk_tasks` SET `prjid`=ProjId WHERE `tskid` = TaskId;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `relatives` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`192.168.1%.%` PROCEDURE `relatives`(IN PrjName VARCHAR(255))
BEGIN
    DECLARE ProjId BIGINT UNSIGNED DEFAULT NULL;
    SELECT tskid INTO ProjId FROM tsk_tasks WHERE `name` = PrjName;
    IF ISNULL(ProjId) THEN
		select `Parent`,`Child`,`length` from `tsk_pedigree`;
	ELSE
		select `Parent`,`Child`,`length` from `tsk_pedigree` WHERE `descendant` = ProjId or `ancestor`=ProjId ORDER BY ancestor,descendant;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `tv` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`192.168.1%.%` PROCEDURE `tv`(name varchar(255))
BEGIN
show full tables where Tables_in_tms RLIKE name;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Current Database: `tms`
--

USE `tms`;

--
-- Final view structure for view `app_menu_items_with_depth`
--

/*!50001 DROP VIEW IF EXISTS `app_menu_items_with_depth`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`192.168.1%.%` SQL SECURITY DEFINER */
/*!50001 VIEW `app_menu_items_with_depth` AS select `items`.`MenuItemId` AS `MenuItemId`,`items`.`ParentId` AS `ParentId`,`items`.`Label` AS `Label`,`items`.`Title` AS `Title`,`items`.`Icon` AS `Icon`,`items`.`Route` AS `Route`,`items`.`Help` AS `Help`,`items`.`SortIndex` AS `SortIndex`,`items`.`Enabled` AS `Enabled`,group_concat(`cl2`.`AncestorId` order by `cl2`.`Depth` DESC separator '.') AS `Path`,max(`cl2`.`Depth`) AS `Depth` from ((`app_menu_items` `items` left join `app_menu_items_trees` `cl1` on((`items`.`MenuItemId` = `cl1`.`DescendantId`))) left join `app_menu_items_trees` `cl2` on((`cl1`.`DescendantId` = `cl2`.`DescendantId`))) where `cl1`.`AncestorId` in (select `app_menu_items`.`MenuItemId` from `app_menu_items` where isnull(`app_menu_items`.`ParentId`)) group by `items`.`MenuItemId` order by `Path` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `ent_dropdown_names`
--

/*!50001 DROP VIEW IF EXISTS `ent_dropdown_names`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`192.168.1%.%` SQL SECURITY DEFINER */
/*!50001 VIEW `ent_dropdown_names` AS select `entity`.`EntityId` AS `Id`,if(isnull(`person`.`PrsnId`),if(isnull(`business`.`BizId`),'unknown','business'),'person') AS `WhatAmI`,if(isnull(`business`.`BizId`),concat_ws(' ',`person`.`Prefix`,`person`.`FirstName`,`person`.`MiddleName`,`person`.`LastName`,`person`.`Suffix`),concat_ws(' ',`business`.`BizName`,`branch`.`OfficeName`)) AS `Name` from (((`entities` `entity` left join `ent_people` `person` on((`person`.`PrsnId` = `entity`.`EntityId`))) left join `ent_businesses` `business` on((`business`.`BizId` = `entity`.`EntityId`))) left join `biz_branches` `branch` on((`business`.`BizId` = `branch`.`BizId`))) order by concat_ws(' ',`business`.`BizName`,`branch`.`OfficeName`),concat_ws(' ',`person`.`Prefix`,`person`.`FirstName`,`person`.`MiddleName`,`person`.`LastName`,`person`.`Suffix`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `fin_account_type_tree_structures`
--

/*!50001 DROP VIEW IF EXISTS `fin_account_type_tree_structures`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`192.168.1%.%` SQL SECURITY DEFINER */
/*!50001 VIEW `fin_account_type_tree_structures` AS select `root`.`RootId` AS `RootTypeId`,`tree`.`DescendantId` AS `AccountTypeId`,group_concat(`tree`.`AncestorId` separator ',') AS `Structure` from (`fin_account_types_trees` `tree` join `fin_account_types_roots` `root`) where ((`tree`.`DescendantId` = `root`.`DescendantId`) and (`root`.`RootId` in (1,3,5))) group by `root`.`RootId`,`tree`.`DescendantId` order by `Structure` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `fin_account_types_roots`
--

/*!50001 DROP VIEW IF EXISTS `fin_account_types_roots`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`192.168.1%.%` SQL SECURITY DEFINER */
/*!50001 VIEW `fin_account_types_roots` AS select `a`.`AncestorId` AS `RootId`,`b`.`DescendantId` AS `DescendantId` from (`fin_account_types_trees` `a` join `fin_account_types_trees` `b`) where ((`a`.`DescendantId` = `b`.`AncestorId`) and (`b`.`AncestorId` = `b`.`DescendantId`) and (not(exists(select 1 from `fin_account_types_trees` `c` where ((`c`.`Depth` > 0) and (`c`.`DescendantId` = `a`.`AncestorId`)))))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `fin_account_types_tree_structures`
--

/*!50001 DROP VIEW IF EXISTS `fin_account_types_tree_structures`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`192.168.1%.%` SQL SECURITY DEFINER */
/*!50001 VIEW `fin_account_types_tree_structures` AS select `tree`.`DescendantId` AS `AccountId`,group_concat(`tree`.`AncestorId` separator ',') AS `Structure` from (`fin_account_types_trees` `tree` join `fin_account_types_roots` `root`) where ((`tree`.`DescendantId` = `root`.`DescendantId`) and (`root`.`RootId` in (1,3,5))) group by `tree`.`DescendantId` order by `Structure` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `fin_accounts_roots`
--

/*!50001 DROP VIEW IF EXISTS `fin_accounts_roots`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`192.168.1%.%` SQL SECURITY DEFINER */
/*!50001 VIEW `fin_accounts_roots` AS select `a`.`AncestorId` AS `RootId`,`b`.`DescendantId` AS `DescendantId` from (`fin_accounts_trees` `a` join `fin_accounts_trees` `b`) where ((`a`.`DescendantId` = `b`.`AncestorId`) and (`b`.`AncestorId` = `b`.`DescendantId`) and (not(exists(select 1 from `fin_accounts_trees` `c` where ((`c`.`Depth` > 0) and (`c`.`DescendantId` = `a`.`AncestorId`)))))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `fin_accounts_tree_structures`
--

/*!50001 DROP VIEW IF EXISTS `fin_accounts_tree_structures`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`192.168.1%.%` SQL SECURITY DEFINER */
/*!50001 VIEW `fin_accounts_tree_structures` AS select `tree`.`DescendantId` AS `AccountId`,group_concat(`tree`.`AncestorId` separator ',') AS `Structure` from `fin_accounts_trees` `tree` group by `tree`.`DescendantId` order by `Structure` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `fin_invoice_amounts`
--

/*!50001 DROP VIEW IF EXISTS `fin_invoice_amounts`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`192.168.1%.%` SQL SECURITY DEFINER */
/*!50001 VIEW `fin_invoice_amounts` AS select `inv`.`InvoiceId` AS `InvoiceId`,`inv`.`EntityId` AS `EntityId`,`inv`.`PaymentTermsId` AS `PaymentTermsId`,`inv`.`DateCreated` AS `DateCreated`,`inv`.`RefNumber` AS `RefNumber`,`inv`.`Notes` AS `Notes`,`inv`.`Comments` AS `Comments`,`inv`.`PONumber` AS `PONumber`,`inv`.`Status` AS `Status`,`inv`.`DateInvoiced` AS `DateInvoiced`,`inv`.`FactoredParent` AS `FactoredParent`,sum(`inv_i`.`Amount`) AS `Amount` from (`fin_invoices` `inv` left join `fin_invoices_items` `inv_i` on((`inv`.`InvoiceId` = `inv_i`.`InvoiceId`))) group by `inv`.`InvoiceId` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `tsk_pedigree`
--

/*!50001 DROP VIEW IF EXISTS `tsk_pedigree`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`root`@`192.168.1%.%` SQL SECURITY DEFINER */
/*!50001 VIEW `tsk_pedigree` AS select `t1`.`ancestor` AS `ancestor`,`t1`.`descendant` AS `descendant`,`t2`.`name` AS `Parent`,`t3`.`name` AS `Child`,`t1`.`length` AS `length` from ((`tsk_trees` `t1` join `tsk_tasks` `t2` on((`t1`.`ancestor` = `t2`.`tskid`))) join `tsk_tasks` `t3` on((`t1`.`descendant` = `t3`.`tskid`))) order by `t1`.`ancestor`,`t1`.`descendant` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `tsk_peditree`
--

/*!50001 DROP VIEW IF EXISTS `tsk_peditree`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`root`@`192.168.1%.%` SQL SECURITY DEFINER */
/*!50001 VIEW `tsk_peditree` AS select `t2`.`name` AS `Parent`,`t3`.`name` AS `Child` from ((`tsk_trees` `t1` join `tsk_tasks` `t2` on((`t1`.`ancestor` = `t2`.`tskid`))) join `tsk_tasks` `t3` on((`t1`.`descendant` = `t3`.`tskid`))) where (`t1`.`length` = 1) order by `t1`.`ancestor`,`t1`.`descendant` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-12-26 15:43:44
