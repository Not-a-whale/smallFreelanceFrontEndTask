-- MySQL dump 10.13  Distrib 5.7.20, for FreeBSD11.0 (amd64)
--
-- Host: balancer    Database: tms
-- ------------------------------------------------------
-- Server version	5.7.26-log
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Position to start replication or point-in-time recovery from
--

CHANGE MASTER TO MASTER_LOG_FILE='mysql-bin.000014', MASTER_LOG_POS=30198342;

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
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8;
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
  `Route` varchar(1024) DEFAULT NULL,
  `Help` text,
  `SortIndex` decimal(6,3) DEFAULT '0.000',
  `Enabled` tinyint(1) unsigned DEFAULT '1',
  PRIMARY KEY (`MenuItemId`),
  UNIQUE KEY `Label_UNIQUE` (`Label`),
  KEY `MenuItemParentRef_idx` (`ParentId`),
  KEY `idx_app_menu_items_Label` (`Label`),
  KEY `idx_app_menu_items_Title` (`Title`),
  KEY `idx_app_menu_items_Enabled` (`Enabled`),
  KEY `idx_app_menu_items_Icon` (`Icon`),
  KEY `idx_app_menu_items_SortIndex` (`SortIndex`),
  KEY `idx_app_menu_items_Route` (`Route`),
  CONSTRAINT `MenuItemParentRef` FOREIGN KEY (`ParentId`) REFERENCES `app_menu_items` (`MenuItemId`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=230 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_menu_items`
--

LOCK TABLES `app_menu_items` WRITE;
/*!40000 ALTER TABLE `app_menu_items` DISABLE KEYS */;
INSERT INTO `app_menu_items` VALUES (78,139,'INVOICES','List of all invoices',NULL,NULL,NULL,0.000,1),(89,NULL,'ADMIN','Administrative Tasks','imgs/adim-icon.svg',NULL,NULL,99.000,1),(91,89,'APP ADMIN','Application Settings - webmaster only',NULL,NULL,NULL,0.000,1),(119,89,'GROUPS','tmsapp.main.test',NULL,NULL,NULL,0.000,1),(121,NULL,'INVENTORY',NULL,'imgs/inventory.svg',NULL,NULL,0.000,1),(123,121,'EQUIPMENT',NULL,NULL,NULL,NULL,0.000,1),(125,121,'UNITS',NULL,NULL,NULL,NULL,0.000,1),(127,121,'RESERVATIONS',NULL,NULL,NULL,NULL,0.000,1),(129,NULL,'DISPATCH','Dispatching','imgs/disptacher.svg',NULL,NULL,0.000,1),(131,129,'TRUCKS',NULL,NULL,NULL,NULL,0.000,1),(133,129,'PLANNER',NULL,NULL,NULL,NULL,0.000,1),(135,129,'TRIPS',NULL,NULL,NULL,NULL,0.000,1),(137,129,'LOADS','tmsapp.main.loads',NULL,'tmsapp.main.loads',NULL,0.000,1),(139,NULL,'FINANCE',NULL,'imgs/finances.svg',NULL,NULL,0.000,1),(141,139,'CHECKS',NULL,NULL,NULL,NULL,0.000,1),(143,139,'SETTLEMENTS',NULL,NULL,NULL,NULL,0.000,1),(145,139,'RATE CONFIRMATION',NULL,NULL,NULL,NULL,0.000,1),(147,139,'BILLS',NULL,NULL,NULL,NULL,0.000,0),(149,NULL,'Food','This is the menu for the food',NULL,NULL,NULL,0.000,0),(151,149,'BURGER',NULL,NULL,NULL,NULL,0.000,0),(196,NULL,'Phones','Phone stuff',NULL,NULL,NULL,999.000,1),(202,196,'List','List of the phones',NULL,NULL,NULL,100.000,1),(204,196,'Form',NULL,NULL,'tmsapp.main.form',NULL,0.000,1),(207,89,'demo','tmsapp.main',NULL,'tmsapp.main',NULL,0.000,1),(211,89,'bizlist','tmsapp.main.list',NULL,'tmsapp.main.list',NULL,0.000,1),(213,89,'navigation editor','create new items for navigation',NULL,'tmsapp.main.navigationEditor',NULL,0.000,1),(217,NULL,'Testing','Testing the submit',NULL,NULL,NULL,1.000,1),(219,NULL,'Test33','Testing the submit',NULL,NULL,NULL,1.000,1),(221,NULL,'Potato123','123123123',NULL,NULL,NULL,1.000,1),(223,217,'Test3','Testing the submit',NULL,NULL,NULL,1.000,1),(225,217,'Test2','123123123',NULL,NULL,NULL,1.000,1),(227,NULL,'New Stuffs','eerwerwe',NULL,NULL,NULL,1.000,1),(228,219,'ThisisaTest','testtesttest',NULL,NULL,NULL,0.500,1);
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
INSERT INTO `app_menu_items_trees` VALUES (78,78,0),(119,119,0),(121,121,0),(123,123,0),(125,125,0),(127,127,0),(129,129,0),(131,131,0),(133,133,0),(135,135,0),(137,137,0),(139,139,0),(141,141,0),(143,143,0),(145,145,0),(147,147,0),(149,149,0),(151,151,0),(196,196,0),(202,202,0),(204,204,0),(207,207,0),(211,211,0),(213,213,0),(217,217,0),(219,219,0),(221,221,0),(223,223,0),(225,225,0),(227,227,0),(228,228,0),(121,123,1),(121,125,1),(121,127,1),(129,131,1),(129,133,1),(129,135,1),(129,137,1),(139,141,1),(139,143,1),(139,145,1),(139,147,1),(149,151,1),(196,202,1),(196,204,1),(217,228,1);
/*!40000 ALTER TABLE `app_menu_items_trees` ENABLE KEYS */;
UNLOCK TABLES;

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
  `Role` bigint(20) unsigned NOT NULL,
  `Permission` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`Role`,`Permission`),
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
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
  `OfficeName` varchar(255) DEFAULT NULL,
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
  CONSTRAINT `BrnchAddress` FOREIGN KEY (`BrnchAddress`) REFERENCES `cnt_addresses` (`AddrId`) ON UPDATE CASCADE,
  CONSTRAINT `BrnchBizNameRef` FOREIGN KEY (`BizId`) REFERENCES `ent_businesses` (`BizId`) ON UPDATE CASCADE,
  CONSTRAINT `BrnchFaxRef` FOREIGN KEY (`BrnchFax`) REFERENCES `cnt_phonesfaxes` (`PhnFaxId`) ON UPDATE CASCADE,
  CONSTRAINT `BrnchPhoneRef` FOREIGN KEY (`BrnchPhone`) REFERENCES `cnt_phonesfaxes` (`PhnFaxId`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3758 DEFAULT CHARSET=utf8 COMMENT='Office Branch Details';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `biz_branches`
--

LOCK TABLES `biz_branches` WRITE;
/*!40000 ALTER TABLE `biz_branches` DISABLE KEYS */;
INSERT INTO `biz_branches` VALUES (3,'Antelope',11,3,17,15,'email@email.com'),(5,'Main',13,5,19,21,'asfjsfsdfs@uskoinc.com'),(7,'main',15,7,25,23,'an email of sorts'),(9,'dont have one',17,9,27,29,'NO');
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
  KEY `BizParentRef_idx` (`ParentId`),
  KEY `BizName_inx` (`UnitName`),
  KEY `idx_biz_company_nodes_Type` (`Type`),
  CONSTRAINT `BizCompanyParentNodeRef` FOREIGN KEY (`ParentId`) REFERENCES `biz_company_nodes` (`NodeId`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Holds the nodes for the structure of the client/user company hierarchy ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `biz_company_nodes`
--

LOCK TABLES `biz_company_nodes` WRITE;
/*!40000 ALTER TABLE `biz_company_nodes` DISABLE KEYS */;
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
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
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
		sup.AncestorId, sub.DescendantId, sup.Depth + sub.Depth+1
	FROM 
		biz_company_trees AS sup JOIN biz_company_tree AS sub 
               
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
  `AncestorId` bigint(20) unsigned NOT NULL,
  `DescendantId` bigint(20) unsigned NOT NULL,
  `Depth` int(11) unsigned NOT NULL,
  PRIMARY KEY (`AncestorId`,`DescendantId`),
  KEY `ClsrBizAncRef_idx` (`AncestorId`),
  KEY `ClsrBizDesRef_idx` (`DescendantId`),
  KEY `idx_biz_company_trees_Depth` (`Depth`),
  CONSTRAINT `CompanyTreeAncestorNodeRef` FOREIGN KEY (`AncestorId`) REFERENCES `biz_company_nodes` (`NodeId`) ON UPDATE CASCADE,
  CONSTRAINT `CompanyTreeDescendantNodeRef` FOREIGN KEY (`DescendantId`) REFERENCES `biz_company_nodes` (`NodeId`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Holds the tree for the structure of the heirarchy of the client/user company';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `biz_company_trees`
--

LOCK TABLES `biz_company_trees` WRITE;
/*!40000 ALTER TABLE `biz_company_trees` DISABLE KEYS */;
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
  `Name` varchar(255) DEFAULT NULL,
  `Percentage` decimal(5,2) unsigned NOT NULL,
  `Threshold` decimal(12,2) DEFAULT NULL COMMENT 'The minimum amount required for the tier to be in effect',
  PRIMARY KEY (`TierId`,`Package`),
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
  `Zip` char(11) NOT NULL,
  `State` char(2) NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=3726 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cnt_addresses`
--

LOCK TABLES `cnt_addresses` WRITE;
/*!40000 ALTER TABLE `cnt_addresses` DISABLE KEYS */;
INSERT INTO `cnt_addresses` VALUES (1,'12344 Fake Street','','','Antelope','55555','','USA',NULL,NULL,NULL),(3,'464 sdfsadhf st','','','antelope','654654','','USA',NULL,NULL,NULL),(5,'11920 Point East','','','Rancho Cordova','95625','','USA',NULL,NULL,NULL),(7,'12345 Fake st','Building B12','Suite 5','Nowhere land','87987','','USA',NULL,NULL,'some notes'),(9,'NO','NO','STOP ASKING NO','NO','NEVER','','USA',NULL,NULL,'IM NOT TELLING YOU'),(3700,'Vel Eligendi Et Tenetur Ratione Suscipit. Illo Vitae Voluptas Id','Enim Expedita Voluptas Veritatis Ut Nam Consequatur Pariatur. Ne','Fugit Ipsam Beatae Facilis Rerum Ab Vero Ab Reprehenderit. Asper','Vel Asperiores Nesciunt Iusto Sed. Fugiat Vitae Dolore Dolore Ut','38918-9677','TX','Canada',5668.79,297.94,'Vel cumque eaque error eos.');
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
) ENGINE=InnoDB AUTO_INCREMENT=3914 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cnt_phonesfaxes`
--

LOCK TABLES `cnt_phonesfaxes` WRITE;
/*!40000 ALTER TABLE `cnt_phonesfaxes` DISABLE KEYS */;
INSERT INTO `cnt_phonesfaxes` VALUES (15,'987-987-9879','546','VOICE','LAND LINE','notes notes aj2o3423ndak dfa'),(17,'654-987-9874','123','VOICE','LAND LINE','1231 fbsdbf 34 e3v'),(19,'123-123-4567','0','VOICE','LAND LINE','askdfhsakd'),(21,'566-458-4854','545','VOICE','LAND LINE','asdfsdjfhkjh'),(23,'654-789-4545','0','VOICE,SMS,MMS','LAND LINE','even more notes'),(25,'444-478-9878','5','VOICE','LAND LINE','some more notes'),(27,'000-000-0000','12','VOICE','MOBILE','hackhackhackhack'),(29,'619-123-4567','0','VOICE','LAND LINE','STOP');
/*!40000 ALTER TABLE `cnt_phonesfaxes` ENABLE KEYS */;
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
-- Table structure for table `dsp_blacklist`
--

DROP TABLE IF EXISTS `dsp_blacklist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dsp_blacklist` (
  `BlackListId` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `CstmrId` bigint(20) unsigned NOT NULL,
  `DateCreated` datetime NOT NULL,
  `Creator` bigint(20) unsigned NOT NULL,
  `ReasonPublic` text NOT NULL,
  `ReasonPrivate` text,
  PRIMARY KEY (`BlackListId`),
  KEY `DspBlacklistCreatorRef_idx` (`Creator`),
  KEY `idx_dsp_blacklist_DateCreated` (`DateCreated`),
  KEY `BadCstmrRef_idx` (`CstmrId`),
  CONSTRAINT `BadCstmrRef` FOREIGN KEY (`CstmrId`) REFERENCES `ent_customers` (`CstmrId`) ON UPDATE CASCADE,
  CONSTRAINT `DspBlacklistCreatorRef` FOREIGN KEY (`Creator`) REFERENCES `hr_associates` (`AstId`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Complaints about entities and why you should not do business with them';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dsp_blacklist`
--

LOCK TABLES `dsp_blacklist` WRITE;
/*!40000 ALTER TABLE `dsp_blacklist` DISABLE KEYS */;
/*!40000 ALTER TABLE `dsp_blacklist` ENABLE KEYS */;
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
  CONSTRAINT `LoadsBookedByRef` FOREIGN KEY (`BookedBy`) REFERENCES `hr_associates` (`AstId`) ON UPDATE CASCADE,
  CONSTRAINT `LoadsBrokerRef` FOREIGN KEY (`BrokerId`) REFERENCES `ent_customers` (`CstmrId`) ON UPDATE CASCADE,
  CONSTRAINT `LoadsCreatedByRef` FOREIGN KEY (`CreatedBy`) REFERENCES `hr_associates` (`AstId`) ON UPDATE CASCADE,
  CONSTRAINT `LoadsJobRef` FOREIGN KEY (`Job`) REFERENCES `fin_jobs` (`JobId`) ON UPDATE CASCADE,
  CONSTRAINT `LoadsShipperRef` FOREIGN KEY (`ShipperId`) REFERENCES `ent_shippers` (`ShipperId`) ON UPDATE CASCADE,
  CONSTRAINT `LoadsTrailerTypeRef` FOREIGN KEY (`TruckType`) REFERENCES `inv_trailer_types` (`Name`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='tables of all loads in our system';
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
  `LoadDestinationId` bigint(20) unsigned NOT NULL,
  `FileId` bigint(20) unsigned NOT NULL,
  `Verified` enum('unknown','yes','no') NOT NULL,
  `ApprovedBy` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`LoadDestinationId`,`FileId`),
  KEY `LoadsTrackingDocsFileRef_idx` (`FileId`),
  KEY `LoadsTrackingDocsTrackingRef_idx` (`LoadDestinationId`),
  KEY `LoadsDestinationDocsApproverRef_idx` (`ApprovedBy`),
  KEY `idx_dsp_loads_destinations_docs_Verified` (`Verified`),
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
  `LoadId` bigint(20) unsigned NOT NULL,
  `UnitId` bigint(20) unsigned NOT NULL,
  `DateDispatched` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DispatchedBy` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`LoadId`,`UnitId`),
  KEY `LoadsToUnitsUnitRef_idx` (`UnitId`),
  KEY `idx_dsp_loads_dispatched_DateAdded` (`DateDispatched`),
  KEY `DispacherRef_idx` (`DispatchedBy`),
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
  `FileId` bigint(20) unsigned NOT NULL,
  `LoadId` bigint(20) unsigned NOT NULL,
  `DateAdded` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `AddedBy` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`FileId`,`LoadId`),
  KEY `LoadsDocsLoadRef_idx` (`LoadId`),
  KEY `LoadsDocsPersonRef_idx` (`AddedBy`),
  KEY `idx_dsp_loads_docs_DateAdded` (`DateAdded`),
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
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
  `TripId` bigint(20) unsigned NOT NULL,
  `LoadId` bigint(20) unsigned NOT NULL,
  `DateDispatched` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `LoadDispatcher` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`TripId`,`LoadId`),
  KEY `TripsLoadsLoadRef_idx` (`LoadId`),
  KEY `TripsLoadsJobRef_idx` (`TripId`),
  KEY `idx_dsp_trips_loads_DateAdded` (`DateDispatched`),
  KEY `TripLoadsDispatcherRef_idx` (`LoadDispatcher`),
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
-- Table structure for table `ent_businesses`
--

DROP TABLE IF EXISTS `ent_businesses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ent_businesses` (
  `BizId` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `BizName` varchar(1024) NOT NULL,
  `BizURL` varchar(1024) DEFAULT NULL,
  `RootNode` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`BizId`),
  KEY `idx_ent_businesses_BizName` (`BizName`) USING BTREE,
  KEY `RootNodeRef_idx` (`RootNode`),
  KEY `idx_ent_businesses_BizURL` (`BizURL`),
  CONSTRAINT `RootNodeRef` FOREIGN KEY (`RootNode`) REFERENCES `biz_company_nodes` (`NodeId`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ent_businesses`
--

LOCK TABLES `ent_businesses` WRITE;
/*!40000 ALTER TABLE `ent_businesses` DISABLE KEYS */;
INSERT INTO `ent_businesses` VALUES (11,'Target','target.com',NULL),(13,'Usko Express','uskoinc.com',NULL),(15,'Turing Logistics','turinglogistics.com',NULL),(17,'Vika INC','Vikainc.fakefakefake',NULL);
/*!40000 ALTER TABLE `ent_businesses` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`192.168.1%.%`*/ /*!50003 TRIGGER `tms`.`ent_businesses_AFTER_INSERT` AFTER INSERT ON `ent_businesses` FOR EACH ROW
BEGIN
INSERT INTO entities (BusinessId) VALUES (NEW.BizId);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `ent_carriers`
--

DROP TABLE IF EXISTS `ent_carriers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ent_carriers` (
  `CarrierId` bigint(20) unsigned NOT NULL,
  `MC` varchar(255) DEFAULT NULL,
  `McCertificatePhoto` bigint(20) unsigned DEFAULT NULL,
  `DOT` varchar(255) DEFAULT NULL,
  `CrType` enum('Company Carrier','Brokerage Only') DEFAULT NULL,
  `IFTA_Acc` varchar(255) DEFAULT NULL,
  `IFTA_State` char(2) DEFAULT NULL,
  `SCAC` varchar(255) DEFAULT NULL,
  `state_OR` varchar(255) DEFAULT NULL,
  `state_NY` varchar(255) DEFAULT NULL,
  `state_NC` varchar(255) DEFAULT NULL,
  `state_SC` varchar(255) DEFAULT NULL,
  `state_NM` varchar(255) DEFAULT NULL,
  `state_KY` varchar(255) DEFAULT NULL,
  `state_FL` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`CarrierId`),
  UNIQUE KEY `MC_UNIQUE` (`MC`),
  UNIQUE KEY `DOT_UNIQUE` (`DOT`),
  UNIQUE KEY `SCAC_UNIQUE` (`SCAC`),
  KEY `McCertRef_idx` (`McCertificatePhoto`),
  KEY `idx_ent_carriers_MC` (`MC`),
  KEY `idx_ent_carriers_CrType` (`CrType`),
  KEY `idx_ent_carriers_IFTA_Acc` (`IFTA_Acc`),
  KEY `idx_ent_carriers_SCAC` (`SCAC`),
  KEY `idx_ent_carriers_state_OR` (`state_OR`),
  KEY `idx_ent_carriers_state_NY` (`state_NY`),
  KEY `idx_ent_carriers_state_NC` (`state_NC`),
  KEY `idx_ent_carriers_state_SC` (`state_SC`),
  KEY `idx_ent_carriers_state_NM` (`state_NM`),
  KEY `idx_ent_carriers_state_KY` (`state_KY`),
  KEY `idx_ent_carriers_state_FL` (`state_FL`),
  KEY `idx_ent_carriers_IFTA_State` (`IFTA_State`),
  CONSTRAINT `CarrierBusinessRef` FOREIGN KEY (`CarrierId`) REFERENCES `ent_businesses` (`BizId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `McCertRef` FOREIGN KEY (`McCertificatePhoto`) REFERENCES `gen_files` (`FileId`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ent_carriers`
--

LOCK TABLES `ent_carriers` WRITE;
/*!40000 ALTER TABLE `ent_carriers` DISABLE KEYS */;
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
  `MC` varchar(255) DEFAULT NULL COMMENT 'MC number',
  `DOT` varchar(64) DEFAULT NULL,
  `SCAC` varchar(255) DEFAULT NULL COMMENT 'SCACC',
  `Terms` varchar(255) DEFAULT NULL COMMENT 'Payment terms',
  `Factoring` enum('yes','no') DEFAULT NULL,
  `CreditLimit` decimal(10,2) unsigned DEFAULT NULL COMMENT 'Credit Limit',
  `Bond` varchar(64) DEFAULT NULL,
  `DUNS` varchar(64) DEFAULT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ent_people`
--

LOCK TABLES `ent_people` WRITE;
/*!40000 ALTER TABLE `ent_people` DISABLE KEYS */;
/*!40000 ALTER TABLE `ent_people` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`192.168.1%.%`*/ /*!50003 TRIGGER `tms`.`ent_people_AFTER_INSERT` AFTER INSERT ON `ent_people` FOR EACH ROW
BEGIN
INSERT INTO entities (PersonId) VALUES (NEW.PrsnId);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

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
  KEY `idx_entities_DateCreated` (`DateCreated`),
  KEY `idx_entities_IsActive` (`IsActive`),
  KEY `EntityPersonRef_idx` (`PersonId`),
  KEY `EntityBusinessRef_idx` (`BusinessId`),
  CONSTRAINT `EntityBusinessRef` FOREIGN KEY (`BusinessId`) REFERENCES `ent_businesses` (`BizId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `EntityPersonRef` FOREIGN KEY (`PersonId`) REFERENCES `ent_people` (`PrsnId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5080 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entities`
--

LOCK TABLES `entities` WRITE;
/*!40000 ALTER TABLE `entities` DISABLE KEYS */;
INSERT INTO `entities` VALUES (1,1,'2019-07-03 12:46:57','This should be the company that is using the software, also for testing purposes',NULL,NULL),(3,1,'2019-07-18 16:08:43','Driver, for testing purposes',NULL,NULL),(5,1,'2019-07-18 16:08:43','Broker, for testing purposes',NULL,NULL),(7,1,'2019-07-18 16:16:46','Comdata, for testing purposes',NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=212 DEFAULT CHARSET=utf8;
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
  `Notes` text,
  PRIMARY KEY (`BillingId`),
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
  CONSTRAINT `BillingAddress` FOREIGN KEY (`Address`) REFERENCES `cnt_addresses` (`AddrId`) ON UPDATE CASCADE,
  CONSTRAINT `BillingFax` FOREIGN KEY (`Fax`) REFERENCES `cnt_phonesfaxes` (`PhnFaxId`) ON UPDATE CASCADE,
  CONSTRAINT `BillingInfoEntityRef` FOREIGN KEY (`EntityId`) REFERENCES `entities` (`EntityId`) ON UPDATE CASCADE,
  CONSTRAINT `BillingInfoTagRef` FOREIGN KEY (`BillingTagId`) REFERENCES `fin_billing_tags` (`BillingTagId`) ON UPDATE CASCADE,
  CONSTRAINT `BillingPhone` FOREIGN KEY (`Phone`) REFERENCES `cnt_phonesfaxes` (`PhnFaxId`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fin_billing_infos`
--

LOCK TABLES `fin_billing_infos` WRITE;
/*!40000 ALTER TABLE `fin_billing_infos` DISABLE KEYS */;
/*!40000 ALTER TABLE `fin_billing_infos` ENABLE KEYS */;
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
INSERT INTO `fin_billing_tags` VALUES (2,'Billing',0,NULL,'2019-06-28 14:05:04'),(4,'Payment',0,NULL,'2019-06-28 14:05:04'),(6,'Shipping',0,NULL,'2019-06-28 14:05:04');
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
  `InvoicePaymentId` bigint(20) unsigned NOT NULL,
  `InvoiceItemId` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`InvoicePaymentId`,`InvoiceItemId`),
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
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fin_item_template`
--

LOCK TABLES `fin_item_template` WRITE;
/*!40000 ALTER TABLE `fin_item_template` DISABLE KEYS */;
INSERT INTO `fin_item_template` VALUES (34,7,NULL,NULL,3,NULL,NULL,'2019-07-08 14:16:13',NULL,0,'flat rate','Driver Payment','Payment to driver for delivery service',0,NULL,NULL,NULL,NULL,11),(36,7,1,7,NULL,NULL,34,'2019-07-08 14:19:22',100.00,0,'percentage','Driver Payment Expense','The expense part of the driver payment',0,NULL,NULL,NULL,NULL,11),(38,1,NULL,1,NULL,NULL,NULL,'2019-07-08 14:32:45',NULL,0,'flat rate','Load Rate from Broker','Load Rate from Broker',0,NULL,NULL,NULL,NULL,14),(40,1,1,NULL,13,NULL,38,'2019-07-08 14:32:45',100.00,0,'percentage','Load Rate from Broker Revenue','Load Rate from Broker recorded as Revenue',0,NULL,NULL,NULL,NULL,14);
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
INSERT INTO `fin_item_templates_trees` VALUES (34,34,0),(36,36,0),(38,38,0),(40,40,0),(34,36,1),(38,40,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;
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
  `Tax_ID` char(9) NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gen_files`
--

LOCK TABLES `gen_files` WRITE;
/*!40000 ALTER TABLE `gen_files` DISABLE KEYS */;
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
  `DateCreated` datetime DEFAULT NULL,
  `DateRemoved` datetime DEFAULT NULL,
  `BizPhone` bigint(20) unsigned DEFAULT NULL,
  `BizFax` bigint(20) unsigned DEFAULT NULL,
  `BizEmail` varchar(255) DEFAULT NULL,
  `Notes` text,
  PRIMARY KEY (`AstId`),
  KEY `AssociatePersonRef_idx` (`AstId`),
  KEY `BizNodeRef_idx` (`NodeId`),
  KEY `idx_hr_associates_Title` (`CurrentTitle`),
  KEY `idx_hr_associates_DateCreated` (`DateCreated`),
  KEY `idx_hr_associates_DateRemoved` (`DateRemoved`),
  KEY `BizPhnRef_idx` (`BizPhone`),
  KEY `BizFaxRef_idx` (`BizFax`),
  KEY `idx_hr_associates_BizEmail` (`BizEmail`),
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
/*!40000 ALTER TABLE `hr_associates` ENABLE KEYS */;
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
  `DateHired` date DEFAULT NULL,
  `DateTerminated` date DEFAULT NULL,
  `ReasonForTermination` varchar(1024) DEFAULT NULL,
  `Photo` bigint(20) unsigned DEFAULT NULL,
  `EmploymentAuthorization` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`HireId`),
  KEY `HireAstRef_idx` (`AstId`),
  KEY `idx_biz_hire_records_Title` (`Title`),
  KEY `idx_biz_hire_records_DateHired` (`DateHired`),
  KEY `idx_biz_hire_records_DateTerminated` (`DateTerminated`),
  KEY `idx_biz_hire_records_ReasonForTermination` (`ReasonForTermination`),
  KEY `PhotoRef_idx` (`Photo`),
  KEY `EmplAuthDocRef_idx` (`EmploymentAuthorization`),
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
  PRIMARY KEY (`VhlInsId`,`DateAdded`),
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
  PRIMARY KEY (`EquipmentId`),
  KEY `EquipVendorRef_idx` (`VendorId`),
  KEY `idx_inv_equipment_GeneralName` (`GeneralName`),
  KEY `idx_inv_equipment_DatePurchased` (`DatePurchased`),
  KEY `idx_inv_equipment_DateSold` (`DateSold`),
  KEY `idx_inv_equipment_PricePurchased` (`PricePurchased`),
  KEY `idx_inv_equipment_PriceSold` (`PriceSold`),
  KEY `idx_inv_equipment_SerialNo` (`SerialNo`),
  KEY `EquipmentOwnerRef_idx` (`OwnerId`),
  CONSTRAINT `EquipVendorRef` FOREIGN KEY (`VendorId`) REFERENCES `biz_branches` (`BrnchId`) ON UPDATE CASCADE,
  CONSTRAINT `EquipmentOwnerRef` FOREIGN KEY (`OwnerId`) REFERENCES `hr_associates` (`AstId`) ON UPDATE CASCADE
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
  `FileId` bigint(20) unsigned NOT NULL,
  `EquipmentId` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`FileId`,`EquipmentId`),
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
  `EquipmentId` bigint(20) unsigned NOT NULL,
  `SupportId` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`EquipmentId`,`SupportId`),
  KEY `EquipSupportSupportRef_idx` (`SupportId`),
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
  PRIMARY KEY (`SemitruckId`),
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
  PRIMARY KEY (`SprinterId`),
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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
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
  `UnitId` bigint(20) unsigned NOT NULL,
  `EquipmentId` bigint(20) unsigned NOT NULL,
  `DateAdded` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `AddedBy` bigint(20) unsigned NOT NULL,
  `DateRemoved` datetime DEFAULT NULL,
  `RemovedBy` bigint(20) unsigned DEFAULT NULL,
  `Notes` text,
  PRIMARY KEY (`UnitId`,`EquipmentId`,`DateAdded`),
  KEY `UnitsToEquipEquipRef_idx` (`EquipmentId`),
  KEY `idx_inv_units_to_equipment_DateAdded` (`DateAdded`),
  KEY `idx_inv_units_to_equipment_DateRemoved` (`DateRemoved`),
  KEY `UnitsToEquipAddedBy_idx` (`AddedBy`),
  KEY `UnitsToEquipRemovedBy_idx` (`RemovedBy`),
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
  `StateTag` varchar(12) DEFAULT NULL COMMENT 'State tag for vehicle',
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
  KEY `idx_inv_vehicles_StateTag` (`StateTag`),
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
) ENGINE=InnoDB AUTO_INCREMENT=129 DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
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
  `DateRegistration` datetime NOT NULL,
  `DateExpiration` datetime NOT NULL,
  `ProRate` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT 'vehicle has international tag',
  PRIMARY KEY (`RegistrationId`),
  UNIQUE KEY `PlateNumber_UNIQUE` (`PlateNumber`),
  KEY `VehicleRegVehicleRef_idx` (`VehicleId`),
  KEY `idx_sft_vehicle_registration_PlateNumber` (`PlateNumber`),
  KEY `idx_sft_vehicle_registration_State` (`State`),
  KEY `idx_sft_vehicle_registration_DateRegistration` (`DateRegistration`),
  KEY `idx_sft_vehicle_registration_DateExpiration` (`DateExpiration`),
  KEY `idx_sft_vehicle_registration_ProRate` (`ProRate`),
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='This is a temporary Table that helps remind how to setup closure tables';
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
  `ancestor` bigint(20) unsigned NOT NULL,
  `descendant` bigint(20) unsigned NOT NULL,
  `length` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ancestor`,`descendant`),
  KEY `idx_tsk_trees_length` (`length`),
  KEY `DesTaskRef_idx` (`descendant`),
  CONSTRAINT `AncTaskRef` FOREIGN KEY (`ancestor`) REFERENCES `tsk_tasks` (`tskid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `DesTaskRef` FOREIGN KEY (`descendant`) REFERENCES `tsk_tasks` (`tskid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Project Tree Closures';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tsk_trees`
--

LOCK TABLES `tsk_trees` WRITE;
/*!40000 ALTER TABLE `tsk_trees` DISABLE KEYS */;
INSERT INTO `tsk_trees` VALUES (13,13,0);
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

-- Dump completed on 2019-09-05  7:16:31
