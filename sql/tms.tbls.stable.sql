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
) ENGINE=InnoDB AUTO_INCREMENT=3827 DEFAULT CHARSET=utf8 COMMENT='Office Branch Details';
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=3969 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=4305 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=283 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ins_to_entities`
--

DROP TABLE IF EXISTS `ins_to_entities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ins_to_entities` (
  `InsEntId` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `InsId` bigint(20) unsigned NOT NULL,
  `EntityId` bigint(20) unsigned NOT NULL,
  `AddedBy` bigint(20) unsigned NOT NULL,
  `DateAdded` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Connects all equipment tables with unique primary keys';
/*!40101 SET character_set_client = @saved_cs_client */;

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
-- Table structure for table `inv_equipment_types`
--

DROP TABLE IF EXISTS `inv_equipment_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inv_equipment_types` (
  `EquipmentTypeId` bigint(64) unsigned NOT NULL AUTO_INCREMENT,
  `Name` varchar(64) NOT NULL,
  PRIMARY KEY (`EquipmentTypeId`),
  KEY `idx_inv_equipment_types_Name` (`Name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Types of equipment used for load requirement contraints';
/*!40101 SET character_set_client = @saved_cs_client */;

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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-01-08  9:39:36
