-- MySQL dump 10.13  Distrib 5.6.43, for FreeBSD12.0 (amd64)
--
-- Host: dbs01b    Database: tms
-- ------------------------------------------------------
-- Server version	5.7.29-log
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
-- Dumping data for table `app_permissions`
--

LOCK TABLES `app_permissions` WRITE;
/*!40000 ALTER TABLE `app_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_permissions` ENABLE KEYS */;
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
/*!40000 ALTER TABLE `app_role_permissions` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `app_roles_assigned`
--

LOCK TABLES `app_roles_assigned` WRITE;
/*!40000 ALTER TABLE `app_roles_assigned` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_roles_assigned` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `biz_branches`
--

LOCK TABLES `biz_branches` WRITE;
/*!40000 ALTER TABLE `biz_branches` DISABLE KEYS */;
/*!40000 ALTER TABLE `biz_branches` ENABLE KEYS */;
UNLOCK TABLES;

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
/*!40000 ALTER TABLE `biz_company_trees` ENABLE KEYS */;
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
/*!40000 ALTER TABLE `cnt_addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `cnt_phonesfaxes`
--

LOCK TABLES `cnt_phonesfaxes` WRITE;
/*!40000 ALTER TABLE `cnt_phonesfaxes` DISABLE KEYS */;
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
/*!40000 ALTER TABLE `crr_iftas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `crr_permit_account_docs`
--

LOCK TABLES `crr_permit_account_docs` WRITE;
/*!40000 ALTER TABLE `crr_permit_account_docs` DISABLE KEYS */;
/*!40000 ALTER TABLE `crr_permit_account_docs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `crr_permit_accounts`
--

LOCK TABLES `crr_permit_accounts` WRITE;
/*!40000 ALTER TABLE `crr_permit_accounts` DISABLE KEYS */;
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
/*!40000 ALTER TABLE `ent_businesses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `ent_carriers`
--

LOCK TABLES `ent_carriers` WRITE;
/*!40000 ALTER TABLE `ent_carriers` DISABLE KEYS */;
/*!40000 ALTER TABLE `ent_carriers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `ent_customers`
--

LOCK TABLES `ent_customers` WRITE;
/*!40000 ALTER TABLE `ent_customers` DISABLE KEYS */;
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
INSERT INTO `fin_accounts` VALUES (1,1,NULL,0,NULL,1,1,'2019-05-13 14:08:59','Accounts Receivable',NULL,NULL,0.00),(3,3,NULL,0,NULL,1,1,'2019-05-13 14:08:59','Accounts Payable',NULL,NULL,0.00),(5,1,NULL,0,NULL,1,1,'2019-05-13 14:27:47','Cash',NULL,NULL,0.00),(7,25,NULL,0,NULL,1,1,'2019-05-13 14:27:47','Service Expense',NULL,NULL,0.00),(9,5,NULL,0,NULL,1,1,'2019-05-13 14:27:47','Retained Earnings',NULL,NULL,0.00),(11,25,NULL,0,NULL,1,1,'2019-05-13 14:27:47','Advertisement Expense',NULL,NULL,0.00),(13,23,NULL,0,NULL,1,1,'2019-05-13 14:27:47','Service Revenue',NULL,NULL,0.00),(15,1,NULL,0,NULL,1,1,'2019-05-13 14:27:47','Equipment',NULL,NULL,0.00),(17,1,NULL,0,NULL,1,1,'2019-05-13 14:27:47','Driver Advance',NULL,NULL,0.00),(19,1,NULL,0,NULL,1,1,'2019-05-13 14:27:47','Prepaid Insurance',NULL,NULL,0.00),(21,15,NULL,0,NULL,1,1,'2019-05-13 14:27:47','Accumulated Depreciation',NULL,NULL,0.00),(23,1,NULL,0,NULL,1,1,'2019-05-13 14:27:47','Tractors and Trailers',NULL,NULL,0.00),(25,3,3,0,NULL,1,1,'2019-05-13 14:27:47','Payroll Liabilities',NULL,NULL,0.00),(27,5,NULL,0,NULL,1,1,'2019-05-13 14:27:47','Openning Balance Equity',NULL,NULL,0.00),(29,19,NULL,0,NULL,1,1,'2019-05-13 14:27:47','Owners Draw',NULL,NULL,0.00),(31,5,NULL,0,NULL,1,1,'2019-05-13 14:27:47','Owners Equity',NULL,NULL,0.00),(33,25,NULL,0,NULL,1,1,'2019-05-13 14:27:47','Fuel Surcharge',NULL,NULL,0.00),(35,25,NULL,0,NULL,1,1,'2019-05-13 14:27:47','Driver Travel Expense',NULL,NULL,0.00),(37,25,NULL,0,NULL,1,1,'2019-05-13 14:27:47','Fuel for Hired Vehicles',NULL,NULL,0.00),(39,25,NULL,0,NULL,1,1,'2019-05-13 14:27:47','Truck Maintenance Costs',NULL,NULL,0.00),(41,25,NULL,0,NULL,1,1,'2019-05-13 14:27:47','Insurance Expense',NULL,NULL,0.00),(43,25,NULL,0,NULL,1,1,'2019-05-13 14:27:47','Payroll Expense',NULL,NULL,0.00),(45,25,NULL,0,NULL,1,1,'2019-05-13 14:27:47','Utilities',NULL,NULL,0.00),(47,25,NULL,0,NULL,1,1,'2019-05-13 14:27:47','Telephone Expense',NULL,NULL,0.00),(49,25,NULL,0,NULL,1,1,'2019-05-13 14:27:47','Meals and Entertainment',NULL,NULL,0.00),(51,25,NULL,0,NULL,1,1,'2019-05-13 14:27:47','Bank Service Charge',NULL,NULL,0.00),(53,25,NULL,0,NULL,1,1,'2019-05-13 14:27:47','Business Licenses and Permits',NULL,NULL,0.00),(55,25,NULL,0,NULL,1,1,'2019-05-13 14:27:47','Computer and Internet Expense',NULL,NULL,0.00);
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
/*!40000 ALTER TABLE `gen_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `hr_associates`
--

LOCK TABLES `hr_associates` WRITE;
/*!40000 ALTER TABLE `hr_associates` DISABLE KEYS */;
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
/*!40000 ALTER TABLE `ins_policies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `ins_to_entities`
--

LOCK TABLES `ins_to_entities` WRITE;
/*!40000 ALTER TABLE `ins_to_entities` DISABLE KEYS */;
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
/*!40000 ALTER TABLE `msg_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `msg_notes`
--

LOCK TABLES `msg_notes` WRITE;
/*!40000 ALTER TABLE `msg_notes` DISABLE KEYS */;
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

-- Dump completed on 2020-03-04 14:42:13
