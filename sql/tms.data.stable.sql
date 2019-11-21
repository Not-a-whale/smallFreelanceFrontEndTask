-- MySQL dump 10.13  Distrib 5.7.27, for FreeBSD11.2 (amd64)
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
/*!40000 ALTER TABLE `app_features` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `app_menu_items`
--

LOCK TABLES `app_menu_items` WRITE;
/*!40000 ALTER TABLE `app_menu_items` DISABLE KEYS */;
INSERT INTO `app_menu_items` VALUES (1,NULL,'my stuff',NULL,NULL,'tmsapp.main.error',NULL,0.000,1,'mainnav'),(3,NULL,'trip managment',NULL,NULL,'tmsapp.main.trpmgmt',NULL,0.040,1,'mainnav'),(5,NULL,'finances',NULL,NULL,'tmsapp.main.fin',NULL,0.300,1,'mainnav'),(7,7,'safety',NULL,NULL,'tmsapp.main.safety',NULL,0.045,1,'mainnav'),(9,NULL,'administration',NULL,'sdfsd','tmsapp.main.admin',NULL,0.100,1,'mainnav'),(11,1,'dashboard','dashboard','imgs/icons.svg#square','tmsapp.main.dashboard',NULL,0.000,1,'mainnav'),(13,1,'calendar','calendar','imgs/icons.svg#calendar','tmsapp.main.calendar',NULL,0.100,1,'mainnav'),(15,3,'trucks','trucks','imgs/icons.svg#vehicle','tmsapp.main.trpmgmt.trucks',NULL,0.000,1,'mainnav'),(17,3,'loads','loads','imgs/icons.svg#boxes','tmsapp.main.trpmgmt.loads',NULL,0.100,1,'mainnav'),(23,15,'my trucks','my trucks',NULL,'tmsapp.main.trpmgmt.trucks.mytrucks',NULL,0.300,1,'topnav'),(25,17,'available','available',NULL,'tmsapp.main.trpmgmt.loads.available',NULL,0.000,1,'topnav'),(27,17,'en route','en route',NULL,'tmsapp.main.trpmgmt.loads.enroute',NULL,0.100,1,'topnav'),(29,17,'pending','pending',NULL,'tmsapp.main.trpmgmt.loads.pending',NULL,0.200,1,'topnav'),(31,17,'build a load','build a load',NULL,'tmsapp.main.trpmgmt.loads.buildaload',NULL,0.300,1,'mainnav'),(33,17,'archives','archives',NULL,'tmsapp.main.trpmgmt.loads.archives',NULL,0.400,1,'mainnav'),(35,9,'users','users','imgs/icons.svg#users','tmsapp.main.admin.users',NULL,0.000,1,'mainnav'),(37,9,'groups','groups',NULL,'tmsapp.main.error',NULL,0.100,0,'mainnav'),(39,9,'web admin','web admin','imgs/icons.svg#internet','tmsapp.main.admin.webadmin',NULL,0.200,1,'mainnav'),(45,39,'Nav Menu Editor','Nav Menu Editor',NULL,'tmsapp.main.admin.webadmin.navmenueditor',NULL,0.000,1,'mainnav'),(47,39,'test page','test page',NULL,'tmsapp.main.admin.webadmin.testpage',NULL,9.000,1,'mainnav'),(59,209,'buttons','buttons',NULL,'tmsapp.main.testpg.inputs.buttons',NULL,0.000,1,'topnav'),(61,191,'fonts','fonts',NULL,'tmsapp.main.testpg.fonts',NULL,0.000,1,'mainnav'),(63,191,'forms','forms',NULL,'tmsapp.main.testpg.forms',NULL,0.000,1,'mainnav'),(65,209,'input','inputs',NULL,'tmsapp.main.testpg.inputs.inputs',NULL,0.000,1,'topnav'),(67,63,'section','single',NULL,'tmsapp.main.testpg.forms.section',NULL,9.000,1,'topnav'),(72,NULL,'human resources',NULL,NULL,'tms.app.hr',NULL,0.050,1,'mainnav'),(74,72,'personnel','View Personnel','imgs/icons.svg#addressbook','tmsapp.main.hr.prsnl',NULL,0.000,1,'mainnav'),(119,5,'invoices',NULL,'imgs/icons.svg#document','tmsapp.main.fin.invoice',NULL,0.000,1,'mainnav'),(121,5,'settlements',NULL,'imgs/icons.svg#dollar-sign','tmsapp.main.fin.settlments',NULL,0.000,1,'mainnav'),(123,15,'view map',NULL,NULL,'tmsapp.main.trpmgmt.trucks.map',NULL,0.000,1,'mainnav'),(125,15,'my team','my team',NULL,'tmsapp.main.trpmgmt.trucks.myteam',NULL,0.200,1,'topnav'),(127,15,'all trucks','all trucks',NULL,'tmsapp.main.trpmgmt.trucks.all',NULL,0.100,1,'topnav'),(129,17,'public load boards','public load boards',NULL,'tmsapp.main.trpmgmt.loads.public',NULL,0.350,1,'mainnav'),(187,5,'transaction templates',NULL,NULL,'tmsapp.main.fin.chargeitems',NULL,9.000,1,'mainnav'),(189,187,'generate',NULL,NULL,'tmsapp.main.fin.chargeitems.generate',NULL,0.100,1,'topnav'),(191,NULL,'test pages',NULL,NULL,'tmsapp.main.testpg',NULL,9.999,1,'mainnav'),(197,191,'tables','list of different types of tables',NULL,'tmsapp.main.testpg.tables',NULL,0.000,1,'mainnav'),(199,197,'accordian','accordian style table',NULL,'tmsapp.main.testpg.tables.accordion',NULL,1.000,1,'topnav'),(201,197,'selector','table with selection',NULL,'tmsapp.main.testpg.tables.selector',NULL,2.000,1,'topnav'),(203,197,'flowout','table where data is displayed in another component',NULL,'tmsapp.main.testpg.tables.flowout',NULL,3.000,1,'topnav'),(205,197,'focused','table where data is displayed using all table area',NULL,'tmsapp.main.testpg.tables.focused',NULL,4.000,1,'topnav'),(209,191,'inputs','list of different input types',NULL,'tmsapp.main.testpg.inputs',NULL,0.100,1,'mainnav'),(211,209,'file upload','demo of uploading file','','tmsapp.main.testpg.inputs.uploadfile',NULL,9.000,1,'topnav');
/*!40000 ALTER TABLE `app_menu_items` ENABLE KEYS */;
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
INSERT INTO `app_menu_items_trees` VALUES (1,1,0),(3,3,0),(5,5,0),(7,7,0),(9,9,0),(11,11,0),(13,13,0),(15,15,0),(17,17,0),(23,23,0),(25,25,0),(27,27,0),(29,29,0),(31,31,0),(33,33,0),(35,35,0),(37,37,0),(39,39,0),(45,45,0),(47,47,0),(59,59,0),(61,61,0),(63,63,0),(65,65,0),(67,67,0),(72,72,0),(74,74,0),(119,119,0),(121,121,0),(123,123,0),(125,125,0),(127,127,0),(129,129,0),(187,187,0),(189,189,0),(191,191,0),(197,197,0),(199,199,0),(201,201,0),(203,203,0),(205,205,0),(209,209,0),(211,211,0),(1,11,1),(1,13,1),(3,15,1),(3,17,1),(5,119,1),(5,121,1),(5,187,1),(9,35,1),(9,37,1),(9,39,1),(15,23,1),(15,123,1),(15,125,1),(15,127,1),(17,25,1),(17,27,1),(17,29,1),(17,31,1),(17,33,1),(17,129,1),(39,45,1),(39,47,1),(47,59,1),(47,61,1),(47,63,1),(47,65,1),(47,67,1),(72,74,1),(187,189,1),(191,197,1),(191,209,1),(197,199,1),(197,201,1),(197,203,1),(197,205,1),(209,211,1),(3,23,2),(3,25,2),(3,27,2),(3,29,2),(3,31,2),(3,33,2),(3,123,2),(3,125,2),(3,127,2),(3,129,2),(5,189,2),(9,45,2),(9,47,2),(39,59,2),(39,61,2),(39,63,2),(39,65,2),(39,67,2),(191,199,2),(191,201,2),(191,203,2),(191,205,2),(191,211,2),(9,59,3),(9,61,3),(9,63,3),(9,65,3),(9,67,3);
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
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
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
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
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
INSERT INTO `biz_branches` VALUES (3,'Antelope',11,3,17,15,'email@email.com'),(5,'Main',13,5,19,21,'asfjsfsdfs@uskoinc.com'),(7,'main',15,7,25,23,'an email of sorts'),(9,'dont have one',17,9,27,29,'NO'),(3758,'Architecto quasi alias fugit sunt quae et. Et sapiente aliquam nihil ea.',108,3762,3970,3972,'Eum libero quia laboriosam.'),(3760,'Aperiam accusantium debitis voluptatum. Illum hic et ut illo iusto velit.',112,3766,3978,3980,'A hic eum repellat. Quis tempora et omnis omnis illo iste eius id. Iste adipisci inventore deleniti et eos.'),(3762,'Aut pariatur et aut omnis dicta voluptas. At voluptas fugiat molestiae iste.',116,3770,3988,3986,'Dignissimos modi laboriosam consequatur inventore voluptatem numquam porro accusamus. Qui autem perspiciatis dolor magni aut. Quibusdam rerum quas minima.'),(3764,'Unde laboriosam vitae dolores sunt.',136,3798,4026,4024,'Pariatur corrupti consequuntur officiis.'),(3766,'Ut error quia architecto incidunt aut et ullam animi. Expedita est fugit ad in enim molestias rerum. Est enim aut exercitationem.',140,3802,4034,4032,'Sit voluptas possimus corporis unde. Blanditiis commodi ut eligendi exercitationem sed illum eos et. Quasi autem ad veritatis corporis harum ex quo et.'),(3768,'Voluptate aut nihil consequuntur aut facilis quaerat eligendi et. Incidunt sequi neque excepturi molestias eos. Aut et ad sunt minus excepturi.',160,3818,4084,4082,'Impedit optio quia nostrum quis non est tempora.'),(3770,'Velit laudantium et molestiae sunt consectetur.',164,3822,4092,4090,'Pariatur quisquam molestias nihil. Et voluptas et illo.'),(3772,'Explicabo qui eius perspiciatis. Quidem fugiat eligendi autem fuga quia ullam aut. Adipisci ut libero necessitatibus et reprehenderit natus.',168,3826,4098,4100,'Fugit quia eveniet facere quo laudantium unde. Vitae sed molestiae laudantium et consequuntur id. Vero laborum fugiat cupiditate dolores.'),(3774,'Sint eum totam dolorem esse. Expedita voluptatem maxime perspiciatis architecto. Fugit quod ut reprehenderit soluta maiores.',172,3830,4106,4108,'Officia accusamus aperiam modi neque vel eum.'),(3776,'Eligendi voluptatem tempore non.',176,3834,4114,4116,'Dolor aut ipsum voluptas.'),(3778,'Expedita aperiam quam voluptatem sint iusto ut. Voluptatem provident deleniti voluptatem voluptas laborum quas.',180,3838,4124,4122,'Quaerat quia ducimus rerum omnis sed. Aut suscipit dicta similique itaque eos rerum. Aliquam ut saepe alias illum quia occaecati ipsum quasi.'),(3780,'A et omnis rerum eligendi eum assumenda quasi. Sequi minus totam nemo sit voluptatem quisquam eum. Quisquam neque est aut dolorem.',184,3842,4132,4130,'Voluptate sed eius minus iure optio maiores. Fuga nulla et doloremque dolores enim rerum.'),(3782,' ',186,3844,4134,4136,'qAVev@zy5gnl.net'),(3783,NULL,237,3927,4227,NULL,NULL),(3785,NULL,239,3927,4227,NULL,NULL),(3787,'California Head Quarters',241,3931,4239,4237,NULL);
/*!40000 ALTER TABLE `biz_branches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `biz_company_nodes`
--

LOCK TABLES `biz_company_nodes` WRITE;
/*!40000 ALTER TABLE `biz_company_nodes` DISABLE KEYS */;
INSERT INTO `biz_company_nodes` VALUES (2,NULL,'Consectetur est labore nihil possimus esse.','Team'),(4,NULL,'Occaecati quaerat quidem sapiente dolorem ratione sunt. Qui sit et expedita.','Other'),(6,NULL,'Consectetur sunt ratione eius eaque quam laudantium minus. Quasi nobis similique sed omnis ipsum et laboriosam.','Team'),(8,NULL,'Ab magnam vel sunt aut ut nihil dolor necessitatibus. Qui odit quia ea suscipit aliquid asperiores odit maxime. Sed voluptatum quia voluptatem repellat aut vero enim.','Group'),(10,NULL,'Qui ullam velit reiciendis nisi ea dolores et. Animi ea quo perspiciatis reprehenderit. Et rem est odio fuga repudiandae sunt.','Other'),(12,NULL,'Tenetur alias architecto recusandae impedit voluptatem.','Team'),(14,NULL,'Ut accusantium non consequatur explicabo aut unde vero doloribus. Maiores qui sed repudiandae et. Optio laboriosam qui qui eligendi et occaecati et non.','Group'),(16,NULL,'Quisquam officia qui omnis nihil consequatur dignissimos nulla modi. Omnis praesentium harum consequatur. Eum dolores ut enim aperiam dolorem.','Other'),(18,NULL,'Iusto laboriosam nesciunt qui dolorem sint libero enim. Quo nihil alias pariatur autem et provident reiciendis a.','Department'),(20,NULL,'Voluptate est distinctio est qui nam quos molestiae. Accusamus velit dolor sint.','Group'),(22,NULL,'Necessitatibus tempora ad velit blanditiis dolores fuga iste sunt.','Other'),(24,NULL,'Animi distinctio et error consequatur numquam blanditiis. Voluptas aliquam est aut voluptatem repudiandae sapiente reiciendis.','Other'),(26,NULL,'Debitis labore hic atque eveniet velit labore aliquam et. Corrupti debitis libero ex. Ullam neque error est velit odio architecto animi inventore.','Department'),(28,NULL,'Tenetur doloribus distinctio sit sit praesentium. Accusamus ut excepturi exercitationem suscipit qui.','Office'),(30,NULL,'Velit aut quisquam itaque ut architecto unde blanditiis minima.','Office'),(32,NULL,'Dignissimos odio dolores quisquam sed rerum aut repellat. Et ad tempore voluptas sit dolorum dolorum eaque delectus. Aut tenetur ut libero quia esse laborum facere vitae.','Team'),(34,NULL,'Sed numquam laudantium eaque qui ea a debitis. Eveniet enim laudantium enim incidunt impedit occaecati accusantium distinctio. Voluptas aut non aut accusantium ut debitis in cupiditate.','Department'),(36,NULL,'Doloremque beatae aliquam culpa. Quia eum omnis eos sint architecto illum.','Group'),(38,NULL,'Adipisci ipsa sit quidem.','Office'),(40,NULL,'Autem similique cum veniam temporibus. Laboriosam et inventore at veniam sed repudiandae quia et.','Department'),(42,NULL,'Ipsum sed maiores aperiam dignissimos quia nesciunt et.','Team'),(44,NULL,'Voluptate nihil aut autem omnis praesentium aut eaque. Reprehenderit debitis eum non.','Other'),(46,NULL,'Consequatur maxime fugiat vero nihil laboriosam ducimus iure libero. Quis rem provident magni sit nemo labore similique aspernatur.','Office'),(48,NULL,'Porro sunt culpa nihil qui deleniti.','Department'),(50,NULL,'Itaque mollitia molestiae alias vel quae.','Department'),(54,NULL,'Officia rem sunt iusto aut alias sapiente reiciendis.','Team'),(56,NULL,'Et modi dolorem veritatis perferendis similique ducimus quo. Fugit praesentium fugiat corporis repellendus non natus ut amet. Ut provident quibusdam iusto dolores quis.','Group'),(58,NULL,'A modi rerum incidunt at.','Group'),(62,NULL,'Ipsum non eligendi provident amet voluptatem enim est aspernatur.','Department'),(66,NULL,'Error aliquid adipisci sed. A mollitia aut consectetur. Magnam vitae qui eligendi est fuga pariatur ea facilis.','Other'),(70,NULL,'Quia voluptate harum reiciendis molestiae. Omnis molestiae cupiditate possimus autem recusandae.','Other'),(74,NULL,'Amet consequatur laboriosam at non vitae et. Harum qui tempora sint eum.','Team'),(92,NULL,'Quibusdam nihil consectetur velit assumenda in. Quisquam minus rerum magnam odio deleniti a.','Office'),(106,NULL,'Placeat et non sunt fugit ducimus qui repellat.','Other'),(108,NULL,'Eum mollitia praesentium vel quos eum odio. Consequatur deserunt fuga ad.','Other'),(110,NULL,'Omnis numquam laudantium quo ipsam voluptatem consequatur ut veniam.','Department'),(112,NULL,'Et numquam sit incidunt occaecati. Maiores optio magnam corporis et eligendi maiores veritatis ratione.','Office'),(130,NULL,'Accusantium ipsa sed totam earum sunt eaque aut. Modi recusandae et quidem magni.','Team'),(132,NULL,'Mollitia reiciendis dolorem commodi qui eligendi et ipsam. Magni earum omnis porro eum doloremque tempora magni harum.','Other'),(134,NULL,'Et impedit sunt ratione suscipit enim odio quae rerum. Perferendis id incidunt ipsa labore et enim dicta eos. Cum corporis laudantium pariatur sed enim praesentium saepe in.','Group'),(136,NULL,'Iusto sit id ducimus quia voluptas nobis sed. Dolorem nihil et amet est iure labore.','Department'),(138,NULL,'Sapiente sint vitae perferendis doloribus magni perspiciatis libero. Quaerat consectetur omnis eum recusandae quaerat hic doloribus.','Group'),(140,NULL,'Et id tempore laborum qui rerum et non suscipit.','Group'),(142,NULL,'Amet blanditiis quas beatae itaque. Veniam esse tempora maiores expedita ducimus autem molestiae.','Other'),(144,NULL,'Non illum deleniti repudiandae beatae debitis quibusdam ut nam.','Group'),(146,NULL,'Tempora molestias atque et optio voluptate quam. Officia et sed provident. Quam ipsam id mollitia ullam voluptas reiciendis dolorem laborum.','Department'),(152,NULL,'Aut pariatur voluptatem dolore fugiat labore voluptas quis.','Group'),(154,NULL,'Nulla delectus nihil labore. Sint quas dolorum incidunt aut asperiores.','Other'),(156,NULL,'Consequatur quis iste quaerat numquam dolorum qui.','Team'),(158,NULL,'Beatae quas quis quibusdam qui. Ut ut reiciendis dolores dolor repellendus nobis ea. Quam omnis corporis quae.','Office'),(168,NULL,'Fuga libero id consectetur dolorem qui dolor voluptas culpa. Nostrum numquam necessitatibus pariatur voluptatem voluptas eius. Sint ducimus ut illum voluptatem qui error.','Team'),(170,NULL,'Commodi deleniti tempore similique voluptatem tempora.','Team'),(172,NULL,'Id qui adipisci dignissimos consectetur animi est rerum libero. Cum ullam natus quaerat. Accusantium explicabo minima est esse consequuntur sit omnis.','Group'),(178,NULL,'Eos aut dicta provident temporibus. Quam voluptate aut quidem laudantium non sint.','Team'),(180,NULL,'Sit rerum dolorem eligendi.','Office'),(182,NULL,'Aperiam sequi sequi repellat facilis. In placeat necessitatibus assumenda in qui.','Office'),(188,NULL,'Voluptatem velit quia est eum assumenda eveniet debitis iste.','Office'),(190,NULL,'Officiis et facere blanditiis iure iusto quaerat ratione quaerat. Omnis est sit laboriosam. Ullam ab odit consequatur quia debitis et eos vero.','Team'),(192,NULL,'Sunt consequatur doloribus unde.','Department'),(194,NULL,'Unde eum tempore eaque deleniti. Dignissimos vel quia repudiandae possimus aut. Autem repellat nihil eligendi aut quo placeat et eum.','Office'),(196,NULL,'Pariatur eos quae aut blanditiis non. Magnam dolor a ut. Aut harum dignissimos perspiciatis modi velit dolorum.','Other'),(198,NULL,'In et natus laborum rerum alias natus et deleniti. Perferendis beatae beatae illum sed sed non aut.','Group'),(200,NULL,'Ipsam illo consequuntur dolorum quia. Error dolorem non debitis nam.','Team'),(202,NULL,'Placeat consequuntur qui vitae iusto dignissimos. Odit quis provident autem explicabo quidem.','Other'),(204,NULL,'Maxime ex ut possimus incidunt laudantium dignissimos iste. Quia sint voluptatem placeat. Animi autem magni exercitationem.','Group'),(210,NULL,'Quis sed cum officia. Corrupti vel qui enim repudiandae iure ut nisi quo.','Group'),(212,NULL,'Dolor ut ut eius autem nostrum incidunt.','Group'),(214,NULL,'Voluptatem ut optio error et dolorem consectetur. Enim harum quas voluptatem rerum.','Team'),(220,NULL,'Enim et impedit distinctio omnis optio dolor incidunt. Ut vitae vel at et modi. Dolorum nobis ea et expedita distinctio minus provident et.','Team'),(222,NULL,'Officiis sed cum recusandae. Aut nobis ducimus aperiam perspiciatis nisi nulla dolore quam. Ex soluta laborum magni est qui quos.','Department'),(224,NULL,'Soluta libero placeat facilis quia sequi ut sed sint. Cum soluta deleniti dolor. Asperiores vel ipsa deleniti laborum et.','Group'),(234,NULL,'Sint amet rerum dignissimos. Eos harum fuga quos et quisquam autem. Magnam et temporibus minima et.','Department'),(236,NULL,'Quasi consequatur quidem est nihil quam nam praesentium. Est libero cupiditate qui qui sed ducimus sit.','Department'),(238,NULL,'Eos consequatur laudantium inventore possimus.','Department'),(244,NULL,'Perspiciatis rem delectus delectus. Ipsum eaque doloribus dolorem quia est rerum. A et quod inventore tempora consequuntur fugiat facere.','Office'),(246,NULL,'Facere a est architecto expedita et accusantium reprehenderit qui. Molestias sint recusandae quia facilis et in asperiores.','Team'),(248,NULL,'Soluta dolorum repellendus velit qui unde. Laudantium aut aut unde possimus illum. Quasi qui et veniam quaerat odit qui vero.','Group'),(250,NULL,'Laudantium cum rerum porro expedita. Aspernatur illo dolores voluptatem praesentium.','Other'),(252,NULL,'Nisi delectus quibusdam et sed. Qui blanditiis ut molestiae porro veritatis corporis deserunt quod. Autem dolorem rerum excepturi est tenetur asperiores.','Team'),(254,NULL,'Sed possimus fugit officia ut eos.','Group'),(256,NULL,'Tempora omnis natus provident. Et in natus dolorem dolor laudantium quod fugit.','Office'),(258,NULL,'Corporis eum saepe et aspernatur. Aut rerum ipsa ut laborum sit earum qui. Error repudiandae pariatur omnis nihil quos quia eum.','Department'),(260,NULL,'Tempore ut et quod in. Beatae qui nostrum quia ut. Repellat eligendi labore dolorem cupiditate cum et veniam.','Other'),(262,NULL,'Non eveniet laudantium omnis sunt incidunt. Qui vitae quibusdam amet. Ullam nihil molestias accusamus velit autem cupiditate a distinctio.','Department'),(264,NULL,'Nesciunt magni voluptatum asperiores quis nesciunt laborum eligendi. Eos vel ut modi sit nulla iste quae aperiam. Magnam eius fugit similique magnam voluptate exercitationem.','Group'),(266,NULL,'Non et omnis deserunt dolore.','Group'),(268,NULL,'Molestiae et laudantium praesentium in voluptatum reprehenderit. Accusantium est iusto qui vitae esse.','Team'),(270,NULL,'Qui possimus velit maiores repellat qui. Alias et facere consequatur consectetur et eum. Tempore et voluptatem sed nesciunt corrupti.','Office'),(272,NULL,'Vel hic tenetur voluptas incidunt aperiam rerum vel.','Office'),(274,NULL,'Occaecati atque quae repellendus quia totam. Non quidem quae ipsum nostrum autem.','Group'),(276,NULL,'Ut vero blanditiis sunt. Sed accusantium odit officia provident sit dignissimos.','Department'),(278,NULL,'Ullam laudantium ad earum aperiam commodi excepturi perferendis.','Other'),(280,NULL,'Sunt qui repellendus et. Ut ipsam sit fugit laboriosam atque officiis accusamus. Itaque eum est quo.','Department'),(282,NULL,'Minima at aut quisquam. Nostrum tempore quia quae. Eaque earum soluta perspiciatis explicabo.','Group'),(284,NULL,'Dolorem nulla illo minus id cumque optio. Doloribus voluptatem id quas ut.','Department'),(286,NULL,'Ut ipsam vel consequatur aliquam consequatur beatae. Doloremque est omnis in dolor dignissimos sit. Voluptatem eos in est.','Department'),(288,NULL,'Quaerat corporis maxime omnis. Dolor itaque et et eum ut. Maiores et qui et velit amet quos voluptatem laudantium.','Team'),(290,NULL,'Consequatur voluptas et animi cumque error consequatur expedita ipsam.','Department'),(292,NULL,'Error libero consequatur vel quaerat odio. Consequatur soluta quia saepe. Eveniet voluptatem qui molestiae qui nostrum aspernatur.','Team'),(298,NULL,'Velit consectetur maiores hic illo nam sapiente accusamus. Et voluptatem alias velit. Dolor occaecati molestiae incidunt aliquam quia expedita alias.','Group'),(300,NULL,'Temporibus iure qui tempore qui dolorum quo.','Department'),(302,NULL,'Porro dignissimos ut numquam ipsa labore earum maiores vitae. Omnis excepturi aut possimus corrupti accusantium facere impedit.','Department'),(308,NULL,'Rerum asperiores in accusantium illo. Aliquid quos rem ipsa. Impedit nesciunt ad soluta fugit.','Group'),(310,NULL,'Corporis suscipit eaque voluptatem est et laudantium reprehenderit eveniet.','Group'),(312,NULL,'Vitae amet magni commodi occaecati velit quibusdam fuga quae. Possimus maxime sed culpa id et. Qui autem fugit unde ut autem distinctio maxime.','Department'),(318,NULL,'Et perferendis explicabo atque vel beatae. Ipsam aut quia aut magni non sunt.','Department'),(320,NULL,'Quibusdam tempora suscipit sit.','Office'),(322,NULL,'Error rerum laboriosam occaecati distinctio dolor suscipit consequatur excepturi. Quasi sed voluptas ad aut. Sequi hic odio veritatis.','Team'),(328,NULL,'Accusantium blanditiis eligendi ullam.','Group'),(330,NULL,'Eaque velit dicta minus minus cupiditate placeat magnam sint. Quas asperiores voluptatibus perferendis et voluptatem delectus officiis ut. Sit consectetur vel et.','Team'),(332,NULL,'Totam asperiores occaecati et.','Office'),(338,NULL,'Vel accusamus atque vel. Explicabo rem voluptatem sed vel voluptatum quas quasi quia. Ea voluptatem odit porro est facilis facilis nisi.','Other'),(340,NULL,'Ipsum sed dolorem quia et nemo itaque dolorem.','Other'),(342,NULL,'At quam cum et ut quis. Vel animi exercitationem distinctio. Possimus in incidunt eius laborum ea expedita ut.','Department'),(348,NULL,'Sed voluptatem non ratione est. Et asperiores sit aut placeat non consequatur.','Team'),(350,NULL,'Officia dolore ut repellendus impedit impedit nihil. Quo aut necessitatibus est natus. Quod iusto neque eos.','Department'),(352,NULL,'Asperiores omnis assumenda deleniti hic. Iure dolore soluta vitae sapiente est. Qui qui deserunt perspiciatis sit labore.','Other'),(358,NULL,'Harum asperiores eos vero dignissimos voluptatem sunt asperiores.','Group'),(360,NULL,'Reiciendis qui corrupti voluptatem.','Other'),(362,NULL,'Numquam beatae autem quae aut totam non. Ut ut repellat non consectetur sequi. Et alias eum nam aut esse ullam alias eos.','Team'),(368,NULL,'Voluptas eos dolores mollitia aperiam voluptates non. Sed porro dolorem facere.','Office'),(370,NULL,'Est aut asperiores perspiciatis. Aut enim adipisci illo voluptas sit vero. Et sint officia aut consequatur officia.','Team'),(372,NULL,'A voluptatem recusandae ratione dicta. Voluptate tempora voluptatem blanditiis explicabo velit inventore.','Group'),(374,NULL,'Modi ut reprehenderit quis minima. Sapiente provident rerum cum. Placeat optio rerum inventore nobis.','Team'),(376,NULL,'Reiciendis molestiae nostrum similique repellat reiciendis voluptatem. Enim neque iure ut quas necessitatibus sunt.','Group'),(378,NULL,'Labore nulla molestiae consequuntur sint in voluptatem et. Sunt possimus sit pariatur eum.','Group'),(380,NULL,'Ipsam minus nihil ducimus repudiandae. Dolor et expedita vero. Voluptate doloribus eligendi porro optio.','Group'),(382,NULL,'Veritatis quia quia iste. Velit perspiciatis quo reiciendis doloribus. Eum aliquid consequatur sit.','Team'),(384,NULL,'Hic aut expedita et. Quae fugiat eaque est nesciunt molestiae consequatur.','Office'),(386,NULL,'Ut a quia qui error tempore voluptas enim.','Office'),(388,NULL,'Sed nobis quae non enim non et ut et. Numquam consequuntur beatae aut assumenda. Corrupti quidem atque modi possimus.','Office'),(390,NULL,'Placeat qui et in quia iste recusandae.','Team'),(392,NULL,'Velit modi illo voluptas a. Voluptates aperiam repellendus omnis sunt provident et nemo illo.','Other'),(394,NULL,'Sed dicta omnis ratione quasi vel quod et et.','Office');
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
INSERT INTO `biz_company_trees` VALUES (12,298,298,0),(14,300,300,0),(16,302,302,0),(24,308,308,0),(26,310,310,0),(28,312,312,0),(36,318,318,0),(38,320,320,0),(40,322,322,0),(48,328,328,0),(50,330,330,0),(52,332,332,0),(60,338,338,0),(62,340,340,0),(64,342,342,0),(72,348,348,0),(74,350,350,0),(76,352,352,0),(84,358,358,0),(86,360,360,0),(88,362,362,0),(96,368,368,0),(98,370,370,0),(100,372,372,0),(102,374,374,0),(104,376,376,0),(106,378,378,0),(108,380,380,0),(110,382,382,0),(112,384,384,0),(114,386,386,0),(116,388,388,0),(118,390,390,0),(120,392,392,0),(122,394,394,0);
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
INSERT INTO `cnt_addresses` VALUES (1,'12344 Fake Street','','','Antelope','55555','','USA',NULL,NULL,NULL),(3,'464 sdfsadhf st','','','antelope','654654','','USA',NULL,NULL,NULL),(5,'11920 Point East','','','Rancho Cordova','95625','','USA',NULL,NULL,NULL),(7,'12345 Fake st','Building B12','Suite 5','Nowhere land','87987','','USA',NULL,NULL,'some notes'),(9,'NO','NO','STOP ASKING NO','NO','NEVER','','USA',NULL,NULL,'IM NOT TELLING YOU'),(3762,'Neque Nisi Tenetur Commodi Voluptatem Ea. Sed Et Dolorem Dolor S','Vitae Quia Iusto Sapiente Officiis Totam.','Molestiae Autem Voluptas Earum.','Nihil Et Quam Facere Nemo Impedit Culpa Vel Eos. Quidem Cumque T','63667-6585','VA','United States',3160.42,5706.04,'Asperiores maiores nesciunt consequatur error placeat et qui. Quisquam sed accusantium sapiente pariatur saepe veritatis tempore est.'),(3764,'Ut In Reprehenderit Molestiae Quo Id.','Ut Modi Repellendus Quia Laudantium. Odit Recusandae Consequatur','Omnis Consectetur Ex Enim Nam Nesciunt Provident. Voluptatibus T','Cumque Quos Adipisci Doloremque.','98690-9361','TX','Canada',9451.56,7425.48,'Fuga vel est eligendi quos deleniti consequuntur qui non.'),(3766,'Sint Exercitationem Est Dolores Alias.','Molestiae Dolor Fugiat Et Voluptatem Est Neque Et. Et Molestiae','Alias Tempora Qui Aut Rerum Ratione Tempore. Voluptatem Autem Ip','Eveniet Ex Sit Est Tenetur Perspiciatis. Hic In Qui Placeat.','13784-2953','UT','Canada',474.61,7801.27,'Corrupti asperiores qui ullam nostrum aliquam et consequatur occaecati. Ea consectetur earum odit quibusdam qui occaecati.'),(3768,'Magni Aut Dolores Similique. Ad Et Quis Odio Deleniti Earum Labo','Reprehenderit Minus Sunt Rem Fugiat Rerum Natus Rem.','Nisi Enim Est Tempore Et Voluptas Qui Quia Veniam. Assumenda Acc','Corporis Exercitationem Repudiandae Non. Voluptatibus Qui Qui At','63520-8542','VT','United States',5575.04,5004.2,'Qui et voluptatem quia facilis quibusdam cum ea. Rerum et consequuntur repudiandae molestiae alias.'),(3770,'Quod Consequatur Libero Velit Ut Atque Ea Voluptatem Incidunt. U','Et Voluptates Maiores Sit. Autem Dolor Enim Accusantium Molestia','Labore Sit Perferendis Officia Quis Necessitatibus Quia Eum Solu','Dolor Necessitatibus Corporis Officia Commodi Inventore. In Dolo','99360-4091','NV','Canada',2240.52,3357.12,'Soluta vero repudiandae fugit dicta molestiae ea repellendus quos. Labore aliquid sit minus officia voluptatibus veniam sunt magnam.'),(3772,'Corporis Sequi Maiores Omnis Aut. Voluptate Nam Accusamus Itaque','Minima Et Et Ex Esse Dolorem Corporis. Ut Eos Dignissimos Repell','Culpa Quia Qui Alias. Minima Quibusdam Blanditiis Unde Magni.','Totam Nihil Eaque Iusto. Aliquam Commodi Dignissimos Accusamus E','93430-1603','HI','Canada',9133.22,2673.8,'Placeat deserunt qui et consequuntur eum. Modi eius natus praesentium minus quae quos nobis. Est culpa aut quod eum aut architecto voluptas neque.'),(3798,'Est Unde Dolorem Veritatis Neque Facere A. Sit Consequuntur A Vo','Praesentium Et Tenetur Ea Delectus Ducimus Quibusdam Maiores Vol','Illum Laborum Cupiditate Nam. Aut Praesentium Repudiandae Archit','Possimus Minus Molestiae Vero Et Quas Impedit Non.','43197-2330','VA','United States',6742.25,2417.24,'Consequatur vitae soluta nesciunt.'),(3800,'Expedita Ut Suscipit Asperiores Qui Tenetur Molestiae Qui.','Repellat Voluptatem Fugiat Voluptatem Voluptate Aliquam.','Alias Recusandae Odio Illum. Suscipit Consectetur Facilis Et Tem','Nobis Eos Eum Esse Enim Est. Saepe Deleniti Distinctio Odit. Dol','61796-8481','WV','Canada',5925.27,3586.33,'Adipisci quidem omnis sit sunt qui dolores voluptas. Voluptatem magni iusto labore alias.'),(3802,'Id Architecto Adipisci Voluptatem Delectus Dolor Hic Vel Ut.','Non Consequuntur Illo Itaque Omnis Aut Voluptas In. Nulla Deleni','Veniam Asperiores Reprehenderit Pariatur Voluptates. Sint Vitae','Rem Iure Et Voluptatum Deleniti In Et. Repellendus Ipsa Fugiat V','93532-7111','OK','United States',941.35,2939.88,'Eaque quis vero molestias aut sequi.'),(3804,'Dolorum Libero Quo Est Vero. Quae Nulla Dolores Porro.','Reprehenderit Sed Quo Impedit Accusantium Itaque Velit In. Corru','Sunt Vitae Doloribus Culpa. Tempore Eos Nihil Nostrum Et Consequ','Quae Accusamus Sit Eos Quod Sed Aut.','30553-2890','VT','Canada',2838.1,9523.48,'Sunt modi sint velit est nesciunt. Laboriosam iusto enim soluta nihil assumenda ipsum.'),(3818,'Voluptas Error Tempora Voluptas Libero Minus.','Ducimus Assumenda Autem Perferendis Quibusdam Alias Asperiores Q','Repudiandae Ut Autem Temporibus Sunt Autem.','Rerum Officia Ut Et Esse Dolorem.','88889-2927','AZ','Canada',9049.42,2787.59,'Odio in est at aspernatur incidunt nihil nostrum.'),(3820,'Ipsam Inventore Ullam Omnis Voluptatum.','Natus Atque Consectetur Velit Laudantium Eaque Fugit Perferendis','Porro Atque Quos Nesciunt Et Vitae Dolorem. Illum Repellendus Et','Sequi Voluptatem Rerum Id Eius Earum. Eaque Eius Enim Beatae Qui','62622-8741','TN','United States',5306.99,297.53,'Animi facere sed minima qui inventore. Rerum qui perferendis quisquam. Provident eveniet maxime quia.'),(3822,'Repudiandae Ut Consequatur Quasi Et Beatae Cupiditate. Qui Ad Of','Nesciunt Dolores Magni Et Ut Velit Placeat Fugiat.','Aut Et Maxime Ut Assumenda Molestiae Et Perferendis Ut. Doloribu','Earum Ea Minus Consequatur Quo Ea Porro Molestias Voluptates. Re','34360-3421','MO','Canada',9804.87,690.57,'Cum aliquid aut et cumque ipsam est.'),(3824,'Et Voluptatem Est Ratione Nihil Autem Et Quasi. Quasi Vero Volup','Et Culpa Ex Hic Veritatis Quae Ea Id. Quia Sed Tempore Sed Dicta','Iure Hic Qui Cum Corporis Sit. Et Eius Officia Quia Exercitation','Voluptatem Nam Est Vero Impedit. Architecto Qui Qui Et.','67898-6806','ND','United States',9484.3,1056.18,'Explicabo reiciendis commodi sunt.'),(3826,'Consequatur Et Ullam Veniam Veniam Molestiae Facere Et.','Dignissimos Aspernatur Qui Nihil Earum. Doloremque Error Nesciun','Est Voluptate Culpa Odit Rem Dolores Laudantium Dicta. Ut Dolor','Rerum Eveniet Consequatur Eaque.','47702-4612','AK','United States',3732.58,5909.48,'Consequatur ut sed amet itaque id exercitationem quam aperiam.'),(3828,'Vel Ullam Quis Quia.','In Molestiae Ut Praesentium Enim Inventore Velit Omnis. Deleniti','Ab Suscipit Quia Modi Commodi In.','Dicta Repellendus Possimus Doloribus Porro Sunt Eaque.','84176-3533','MI','United States',5937.31,5678.19,'Cupiditate accusamus ad eius hic.'),(3830,'Quae Vitae Tenetur Cupiditate Quo Molestiae Commodi Ipsam. Est D','Harum Dolores Veritatis Blanditiis Voluptatem Voluptatem Qui Ver','Nostrum Excepturi Possimus Eos Aut Sed Velit Culpa Quidem. Labor','Qui Sit Dolorem Enim Illo Odio. Porro Maxime Perspiciatis Neque','57915-9663','WI','Canada',1322.6,9152.94,'Ipsum velit aut natus fugit aut alias sed totam. Soluta vitae nam impedit doloribus inventore repellat.'),(3832,'Dolores Quasi Iste In Velit Id Cumque Sunt Placeat. Commodi Sint','Sapiente Qui Neque Quis Inventore Dolorem. Nobis Incidunt Est No','Et Tempora Sint Officiis Ratione. Ullam Reiciendis Et Enim. Hic','Nemo Molestias Repudiandae Qui Rem Aperiam. Facere Laborum Sit E','60344-9832','PA','United States',4004.4,1553.24,'Sunt est voluptas sint quasi voluptatem. Distinctio optio maiores quia saepe.'),(3834,'Qui Culpa Magni Sit Adipisci Amet. Eum Vitae Aperiam Quae Explic','Iure Sed In Facere. Illum Sit Facilis Pariatur Voluptas Eligendi','Beatae Molestias Quo Dicta Est Ipsum Id Officiis. Iusto Amet Eni','Maiores Consequatur Eligendi Blanditiis Est Voluptas.','60832-4906','ME','United States',1580.95,4222.56,'Voluptatem repudiandae quis est. Repellendus aut autem veritatis optio et reprehenderit.'),(3836,'Maiores Optio Sit In Omnis. Vitae Placeat Quas Ab. Cum Qui Volup','Pariatur Blanditiis Ut Earum Veniam Ex.','Est Fugiat Magnam Consequatur Fugit Impedit Repellendus Voluptat','Occaecati Neque Illo Consequatur Et Ipsum Ratione Odio Placeat.','30087-4287','NE','Canada',9683.85,7360.14,'Voluptas qui aut dignissimos et quasi in commodi dolores. Aliquam sunt exercitationem ipsam officia at enim aut. Ea et iusto voluptatem et dolores magnam aspernatur reprehenderit.'),(3838,'Libero Cumque Dolorem Vitae Eaque Est Ducimus Laudantium Et. Eni','Cumque Eligendi Possimus Et Recusandae Deserunt Repudiandae.','Sapiente Occaecati Natus Quasi.','Harum Voluptates Illum Molestiae Qui Sed Illum Cupiditate.','94445-6002','CO','United States',9756.78,172.46,'Fuga temporibus sunt et natus sunt qui reprehenderit assumenda. Deleniti eos neque repudiandae aut velit dolores velit non.'),(3840,'Consequuntur Voluptatum Placeat Assumenda Consequatur Reiciendis','Qui Tenetur Doloremque Enim Debitis Adipisci Voluptatem. Molesti','Reiciendis Omnis Est Qui Eius Quibusdam Minus Sit.','Et Cupiditate Veniam Et Vel Omnis.','48237-2874','WY','Canada',1924.54,5654.7,'Voluptatibus et pariatur aut.'),(3842,'Iure At Impedit Iusto Harum Adipisci Pariatur Architecto Laudant','In Veritatis Aspernatur Temporibus Pariatur Omnis Reprehenderit','Quidem Ipsam Consequatur Facere Et Explicabo Sunt Temporibus Mod','Atque Eos Soluta Molestiae Ut Quasi Eligendi Aut. Illum Laborum','52780-1439','ID','Canada',9665.47,9354.76,'Harum odit aliquam molestias impedit occaecati tempora autem. Optio culpa repellendus animi rerum sed.'),(3844,'Vel Illo Consequatur Consequuntur Molestiae Porro.','Facere Necessitatibus Ab Quas Dolore Totam Accusamus Eligendi En','Voluptatibus Omnis Asperiores Ad.','Omnis Et Unde Labore.','61264-7312','TX','Canada',9849,9389.34,'Unde natus eos eos minus iste expedita. Praesentium doloribus reiciendis odit reiciendis magni beatae officiis fuga. Sunt et pariatur totam qui accusamus.'),(3846,'Unde Vero Dolor Nulla Nobis Iusto Ipsa Ut Est. Sed Vel Et Suscip','Maxime Nihil Nihil Modi Laudantium Voluptatibus Excepturi.','Esse Exercitationem Modi Ducimus. Ut Laboriosam Sed Rerum Dolore','Aut Omnis Et Quo Minus Possimus Rerum.','96830-5124','PA','United States',4814.75,1650.41,'Aut distinctio ut ullam nulla in ut.'),(3898,'Sint Debitis Rem Autem Vel. Eos Aut Corrupti Cupiditate Sint Eaq','Nobis Maxime Accusantium Maiores.','Ratione Iure Similique Aut Sint Quia Qui. Reprehenderit Rerum Cu','Corrupti Officiis Eaque Distinctio.','64640-7762','OK','Canada',6270.16,6652.13,'Sapiente omnis quos dicta in id error debitis ratione.'),(3900,'Hic In Delectus Eligendi Alias Ab Corrupti Perspiciatis. Dolores','Tempora Ea Libero Voluptatibus Molestias Animi Libero Iste. Est','Quas Eos Soluta Eum Nobis Quia Minus Asperiores.','Consequatur Amet Enim Ut Dolorem. Harum Et Et Quia Ab Ex Aperiam','65341-3932','NJ','Canada',2898.13,7036.85,'Sint consequatur repellendus error. Consequatur aut dignissimos nihil nulla. Ullam quas dolor in amet ex.'),(3902,'Illo Voluptas Suscipit Quia Sit. Deserunt Blanditiis Omnis Quasi','Ut Tenetur Ab Sed Quibusdam Accusantium Dignissimos Nobis. Enim','Iure Accusantium Laborum Aut Quia Sint Excepturi Voluptas.','Et Enim Inventore Et Quia Aliquam Consectetur Quo Laudantium. Es','79469-7658','WY','Canada',1444.45,4240.48,'Sint nesciunt quia excepturi corporis totam cumque. Alias quam rem voluptatem delectus quam. In vel rerum nihil.'),(3904,'Praesentium A Facilis Corrupti Distinctio Maiores Aut. Cum Corpo','Est Voluptatem Quas Dolorum Voluptatem Dolores. Perferendis Ut E','Quae Rerum Rerum Perferendis Officiis Ratione.','Magnam Velit Est Eveniet Sit Maxime Necessitatibus Occaecati. Ma','27561-9954','MA','United States',3757.63,5129.49,'Explicabo eligendi quia inventore at ea adipisci et. Minus pariatur non ea. Qui sed ex rerum et.'),(3919,'1234 MAIN CT','','','SAN FRANCISCO','12345','CA','USA',NULL,NULL,NULL),(3921,'1234 POINT Z CT','','','SAN FRANCISCO','12345','CA','USA',NULL,NULL,NULL),(3923,'ABC','HELLO','','HJKWHJ','67629','CA','USA',NULL,NULL,NULL),(3925,'ABC','HELLO','','HJKWHJ','67629','FL','USA',NULL,NULL,NULL),(3927,'3558 MADDIEWOOD CIR','','','SACRAMENTO','95827','CA','USA',NULL,NULL,NULL),(3929,'35558 MAX AVE','','','SACRAMENTO','88762','CA','USA',NULL,NULL,NULL),(3931,'11290 POINT EAST DRIVE','STE 200','','SACRAMENTO','95742','CA','USA',NULL,NULL,NULL);
/*!40000 ALTER TABLE `cnt_addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `cnt_phonesfaxes`
--

LOCK TABLES `cnt_phonesfaxes` WRITE;
/*!40000 ALTER TABLE `cnt_phonesfaxes` DISABLE KEYS */;
INSERT INTO `cnt_phonesfaxes` VALUES (15,'987-987-9879','546','VOICE','LAND LINE','notes notes aj2o3423ndak dfa'),(17,'654-987-9874','123','VOICE','LAND LINE','1231 fbsdbf 34 e3v'),(19,'123-123-4567','0','VOICE','LAND LINE','askdfhsakd'),(21,'566-458-4854','545','VOICE','LAND LINE','asdfsdjfhkjh'),(23,'654-789-4545','0','VOICE,SMS,MMS','LAND LINE','even more notes'),(25,'444-478-9878','5','VOICE','LAND LINE','some more notes'),(27,'000-000-0000','12','VOICE','MOBILE','hackhackhackhack'),(29,'619-123-4567','0','VOICE','LAND LINE','STOP'),(3970,'430-293-1967','*49,972075','SMS,FAX','MOBILE','Rerum delectus nam esse nisi. Voluptas aliquid doloribus alias et dicta.'),(3972,'830-914-0591','4873184952','FAX','SOFT PHONE','Eos incidunt tenetur voluptate aperiam natus quae sed.'),(3974,'762-824-2352','98607*0509','SMS','MOBILE','Necessitatibus dolor deserunt tempore eaque.'),(3976,'918-378-0840','#84,**#363','SMS','SOFT PHONE','Illum enim quo iure aut fuga minus. Non sed sit nihil incidunt ut nisi asperiores maxime. Cum est eligendi cumque occaecati dolores sapiente vitae est.'),(3978,'180-292-3086',',165,9#413','SMS,FAX','SOFT PHONE','Error omnis unde omnis libero. Qui maxime dolorem sint. Quaerat possimus nam consectetur consequuntur suscipit voluptas voluptatibus est.'),(3980,'404-453-9341','6015314,60','SMS,FAX','MOBILE','Assumenda eum aut perspiciatis quibusdam velit praesentium. Aut repellendus accusantium et. Necessitatibus porro repellendus alias sint enim non tempora doloremque.'),(3982,'382-030-4839','**21#*,##4','SMS,MMS','LAND LINE','Voluptatem nemo modi optio amet. Ipsum adipisci exercitationem quasi quasi consequuntur.'),(3984,'418-388-4783','0*64#43470','MMS,FAX','SOFT PHONE','Eius ipsam voluptate aut.'),(3986,'509-848-4543','8921580068','MMS,FAX','LAND LINE','Et id quia a est vel. Eos ea et rem ea.'),(3988,'125-225-5153',',445,90282','VOICE,SMS,MMS,FAX','MOBILE','Dolorum ab qui et ipsa magnam. Voluptas nihil ratione dolore sit consequuntur odio sunt. Blanditiis sunt et provident sit.'),(3990,'969-357-7270','018,8*5*15','VOICE,SMS,MMS,FAX','LAND LINE','Qui debitis ducimus corrupti beatae placeat.'),(3992,'298-082-6481','26#05#5439','SMS,MMS','SOFT PHONE','Optio blanditiis aut provident repellat tempore dolorem.'),(4024,'823-345-5327','#6189*4,83','MMS,FAX','SOFT PHONE','Deleniti aut eligendi modi. Consectetur et consectetur autem. Reprehenderit minima excepturi nisi asperiores nulla.'),(4026,'746-223-4524','84*8#29#,6','SMS','SOFT PHONE','Doloribus enim eligendi qui aut debitis eum minus. Aperiam libero dolorem tenetur ex non veniam et. Et esse velit ipsam ad quibusdam minus aut.'),(4028,'116-274-6116','40#5#68282','SMS,FAX','MOBILE','Sit sit voluptatem delectus. Et fugit quisquam perferendis. Et commodi reprehenderit assumenda quia a.'),(4030,'935-236-2187','6#220#8#84','VOICE,SMS,MMS,FAX','MOBILE','Veritatis velit et dolorem aut ratione.'),(4032,'364-332-2769',',2803,*6#6','VOICE,SMS,FAX','MOBILE','Quisquam quos error incidunt consequatur. Aspernatur dolor at ut et ut.'),(4034,'257-618-4249','3879404375','VOICE,SMS,MMS,FAX','LAND LINE','Deserunt adipisci dignissimos ut accusantium qui quia voluptas odio. Earum et rerum ut minima velit nihil odio.'),(4036,'264-230-3059','2500*#*,,9','SMS,MMS,FAX','MOBILE','Magni magni voluptatum quasi et cum. Et velit impedit vero nihil tempore ipsam qui est. Neque hic sequi excepturi dolor.'),(4038,'419-061-3999','512786*2#7','VOICE,SMS,MMS,FAX','MOBILE','Iste laboriosam optio exercitationem doloremque eaque voluptatem. Suscipit ex doloribus odit. Recusandae quis omnis aliquam fugiat dolores.'),(4082,'460-084-6093','*869*,6*86','VOICE,SMS,MMS,FAX','LAND LINE','Aliquid enim ullam earum dolorem recusandae cumque.'),(4084,'960-031-5218','6#0#,90**8','FAX','LAND LINE','Odio aut quo suscipit doloribus dolorem.'),(4086,'319-310-7211','1613143862','SMS','LAND LINE','Vel laborum rerum facere iusto.'),(4088,'301-264-8672','64#3327660','VOICE,FAX','SOFT PHONE','Pariatur debitis dolores cum ad maiores.'),(4090,'851-148-2613','*#36220695','VOICE,MMS','SOFT PHONE','Blanditiis aperiam tenetur eos nisi praesentium quaerat laborum tempora. Mollitia earum sed ut harum vero. Et autem sunt dolore qui facere ut.'),(4092,'765-867-5538','3869438400','MMS,FAX','SOFT PHONE','Laboriosam inventore cumque non consequatur. Expedita ullam blanditiis dolorem ipsum.'),(4094,'587-582-0072','56#3*#7936','FAX','LAND LINE','Hic perferendis nihil quaerat quisquam. In dolores possimus magnam. Eius provident quidem repellat veniam voluptatem aut blanditiis.'),(4096,'616-622-8955','4995341145','FAX','SOFT PHONE','Neque ea sunt et repellat voluptas nihil sequi. Dolorem quod quos sunt laudantium natus suscipit eaque. Saepe vero dolores odit quae sint quaerat nulla.'),(4098,'136-053-6553','56,11,0399','VOICE,SMS','SOFT PHONE','Voluptatem delectus necessitatibus molestias.'),(4100,'664-136-9807','068,6181*4','VOICE,SMS,MMS,FAX','MOBILE','Ipsam omnis recusandae ab vel.'),(4102,'398-845-5037','9933,18,*6','VOICE,SMS,FAX','MOBILE','Provident earum expedita sint. Doloribus esse porro dolorem totam.'),(4104,'128-924-7809','7,866*9654','VOICE','LAND LINE','Vero est beatae quaerat similique atque laborum rem. Debitis aut hic atque rerum.'),(4106,'470-859-4433',',012#22366','VOICE,SMS,MMS,FAX','LAND LINE','Consequatur nam dolor ut est error. Magnam aliquid sint delectus molestiae ut deleniti autem porro.'),(4108,'773-386-1469','1895,##662','VOICE,SMS,MMS,FAX','LAND LINE','Expedita omnis excepturi corrupti.'),(4110,'248-315-1753','8#617958#4','SMS,MMS,FAX','LAND LINE','In provident dolorem itaque voluptatem voluptas.'),(4112,'608-633-3721','3646,03354','VOICE,FAX','SOFT PHONE','Debitis provident excepturi sed odio. Est ex dolore qui impedit. Atque recusandae et non in minus enim ab quo.'),(4114,'220-433-5733','662075#540','VOICE,SMS,MMS','LAND LINE','Provident ipsa quia nihil dolor eius. Esse id quidem exercitationem quis id explicabo sit. Quos eum autem fugiat et nulla magni excepturi doloremque.'),(4116,'762-361-5616','5813#86#34','VOICE,SMS,MMS,FAX','MOBILE','Cumque cupiditate ut amet. Sapiente rem explicabo minus aspernatur dolorum. Quam eligendi cupiditate beatae distinctio doloribus.'),(4118,'343-693-3697','649194#7#0','VOICE,MMS,FAX','LAND LINE','Corporis atque ullam fuga quos enim.'),(4120,'394-819-9334','388*955446','MMS','MOBILE','Porro dolorem sed facilis aliquid cumque.'),(4122,'334-168-2929','#03**22**1','VOICE,SMS,MMS,FAX','LAND LINE','Est eveniet nam sint consequatur neque nesciunt.'),(4124,'900-553-0326','0*5#253259','VOICE,SMS,MMS,FAX','MOBILE','Minima consequatur fugit quia quis consequuntur laudantium. Odio sequi et quis quisquam voluptatibus quaerat fugit. Nihil dolores reprehenderit sapiente et doloribus explicabo qui.'),(4126,'613-678-3141','5493363574','VOICE','SOFT PHONE','Rerum possimus unde sed optio natus. Voluptas voluptate aut eligendi fuga in ut.'),(4128,'788-991-2169','11*09,8*#8','VOICE','SOFT PHONE','Harum sequi molestiae est voluptatem quos. Similique quibusdam ut voluptas exercitationem.'),(4130,'425-057-0606','0#75128#29','SMS','MOBILE','Voluptatem molestiae in enim. Dolor recusandae eius impedit esse quisquam alias a eos. In consequatur rem fugiat.'),(4132,'783-736-0023','0444297109','VOICE,SMS,MMS,FAX','MOBILE','Provident incidunt est sapiente nesciunt sint. Laboriosam dolore iste unde.'),(4134,'538-732-2695','3633842##7','SMS,MMS,FAX','MOBILE','Iure ad et aperiam. Nulla hic facere quo.'),(4136,'582-849-8229','8770239014','VOICE,SMS','MOBILE','Consequatur quo qui error distinctio. Vel possimus non provident tenetur quia quis.'),(4138,'597-155-5654','63,6#,,338','VOICE,MMS,FAX','LAND LINE','Eos iure velit a ut dolor ex quibusdam qui. Dolorum doloribus cum odit ipsa. Sequi reiciendis error voluptatibus vero autem quas.'),(4140,'868-083-5572','0791119494','VOICE,SMS,MMS,FAX','LAND LINE','Maiores reiciendis nemo harum quisquam. Eos est consequatur dolores nihil hic.'),(4198,'787-983-5692','85906#*8,6','VOICE,SMS,MMS,FAX','MOBILE','Odit quia autem eligendi harum nobis totam assumenda optio. Quia error molestias est nostrum. Corrupti ratione voluptatibus et reprehenderit qui voluptatibus numquam.'),(4200,'668-891-4055','2047293753','SMS,MMS','MOBILE','Neque velit perspiciatis similique voluptas non iure.'),(4202,'180-900-2566','*92,235543','VOICE,SMS,FAX','MOBILE','Voluptas asperiores impedit voluptas delectus et aut et perspiciatis.'),(4204,'344-280-2437','69570,7051','SMS,MMS,FAX','MOBILE','Et illum est officiis aut. Ad nesciunt distinctio voluptatum impedit explicabo sunt.'),(4206,'796-133-9327','2738005242','VOICE,MMS,FAX','MOBILE','Exercitationem nihil recusandae nemo quis doloribus. Itaque incidunt itaque et quis facere ut dolor sit.'),(4208,'744-981-1054','1,,#40*362','SMS','LAND LINE','Ducimus labore odio quam quas.'),(4210,'464-059-6382','4869,6#749','MMS,FAX','SOFT PHONE','Et impedit tempora sint hic cupiditate placeat nam autem. Sequi sapiente fugit ad tempora id. Sed et adipisci a dolor qui sint.'),(4212,'768-853-8546','*54,74*#76','SMS,FAX','MOBILE','Dolorum culpa ab placeat quo. Ea quasi quo sit nemo magni ea aut.'),(4214,'786-491-3038','0214*,9852','SMS,MMS','SOFT PHONE','Quia dicta ea inventore illo ducimus ut dignissimos et. Et excepturi est eveniet aliquam.'),(4216,'421-567-1640','*4##607#82','VOICE,MMS','SOFT PHONE','Eum dolorum molestias fugit. Sit harum illum libero omnis. Aut dolorum nisi quis inventore adipisci.'),(4218,'428-252-2894','**27080481','VOICE,SMS,MMS,FAX','MOBILE','Dolores illum ea culpa facere aut sapiente enim. Optio enim fugit veniam animi dolorem perferendis. Reprehenderit quisquam necessitatibus hic ipsum dolores quis harum amet.'),(4220,'601-539-9318','#85688,919','VOICE,SMS,MMS,FAX','LAND LINE','Quas ut ad ut ea deserunt corrupti. Iure velit ullam odio.'),(4221,'916-718-8451','0','VOICE','LAND LINE',NULL),(4223,'619-555-1212','0','VOICE','LAND LINE',NULL),(4227,'916-880-8506','0','VOICE,SMS,MMS','LAND LINE',NULL),(4237,'916-515-8066','0','VOICE','LAND LINE',NULL),(4239,'916-515-8065','0','VOICE','LAND LINE',NULL);
/*!40000 ALTER TABLE `cnt_phonesfaxes` ENABLE KEYS */;
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
-- Dumping data for table `dsp_blacklist`
--

LOCK TABLES `dsp_blacklist` WRITE;
/*!40000 ALTER TABLE `dsp_blacklist` DISABLE KEYS */;
/*!40000 ALTER TABLE `dsp_blacklist` ENABLE KEYS */;
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
-- Dumping data for table `ent_businesses`
--

LOCK TABLES `ent_businesses` WRITE;
/*!40000 ALTER TABLE `ent_businesses` DISABLE KEYS */;
INSERT INTO `ent_businesses` VALUES (11,'Target','target.com',NULL),(13,'Usko Express','uskoinc.com',NULL),(15,'Turing Logistics','turinglogistics.com',NULL),(17,'Vika INC','Vikainc.fakefakefake',NULL),(102,'Sapiente qui illum quis eos consequuntur sit ut voluptas.','Natus sit quia itaque omnis id. Delectus consequatur voluptatem numquam est temporibus nostrum deserunt animi.',NULL),(108,'Ipsam cumque quis laboriosam. Omnis aut dolorem et dolore. Repellat quaerat rerum voluptas nobis hic aliquid explicabo optio.','Et dolorem necessitatibus pariatur nobis vitae reiciendis veritatis. Sequi aut sint rerum. Fuga ut molestias repellendus veniam iure qui.',130),(110,'Eius qui id voluptatum assumenda repellat quis. Et asperiores accusamus expedita reprehenderit ut.','Recusandae aut cumque dolorem. Nam doloremque aperiam consequuntur. Quos aperiam asperiores non nulla ipsa unde.',132),(112,'Est et quisquam laboriosam officia esse quam quisquam blanditiis. Aliquam est architecto vitae nobis delectus nesciunt. Et hic laboriosam illum.','Qui quidem ipsum quis neque. Nobis temporibus amet facilis ex. Esse fugit exercitationem sed iure expedita.',136),(114,'Voluptas neque enim aut quisquam sit ducimus est sit.','Veniam et et iusto repellat. Architecto hic labore est et nulla a. Velit adipisci praesentium ad ut quia impedit ea libero.',138),(116,'Voluptas corrupti ut saepe tenetur corrupti eveniet aut ut. Dicta pariatur excepturi consequuntur aut et distinctio sint sapiente.','Hic voluptas blanditiis quaerat autem numquam ullam. Magnam perferendis aut corrupti delectus.',142),(118,'Necessitatibus eos inventore voluptatem aperiam impedit.','Natus odit et et vel illo aut. In aliquam quibusdam ad velit nihil vel quia optio.',144),(136,'Eum enim sit sed quo.','Quia ipsam eos illo recusandae et itaque.',194),(138,'Excepturi a laudantium fugiat nesciunt. Qui fugiat qui omnis esse quo omnis labore autem. Omnis aut voluptatem in eligendi temporibus iusto facere necessitatibus.','Neque fugiat fugit dolore fugit ut velit. Necessitatibus voluptatem ut aspernatur.',196),(140,'Consequuntur consequatur enim et quisquam esse est asperiores impedit. Asperiores nostrum provident id quae sed aliquam assumenda numquam.','Consectetur ipsum non eos et repellendus et est. Doloremque reiciendis excepturi aspernatur quis. Quasi dolorem alias blanditiis nihil fuga.',200),(142,'Ut sed voluptatem rerum sint quis fuga. Totam dolores porro mollitia dolore ut maxime.','Harum laboriosam iusto culpa et voluptas eligendi quae.',202),(160,'Doloribus quisquam voluptatibus iusto libero ullam. Cupiditate ut magnam placeat distinctio sit atque sequi ducimus. Odio velit et ab.','Iure quae fugiat et perspiciatis est. Delectus consequuntur quae iusto ea atque explicabo vel id.',250),(162,'Nostrum et perspiciatis earum id. Eos quas quod vitae.','Ea aspernatur excepturi consequuntur. Laudantium eaque iste et quasi non.',252),(164,'Non quia soluta corporis. Non hic ducimus cum accusamus repudiandae aut pariatur. Quaerat consectetur iste cum qui necessitatibus.','Molestias aliquid earum pariatur.',256),(166,'Quia illum inventore nemo. Sed quia vel officiis animi aut.','Quam eum culpa veniam in accusantium quae reiciendis veritatis. Culpa et qui est minima. Velit maiores nesciunt tenetur dolorem nulla ut animi.',258),(168,'Est nihil ut rerum qui. Ut magni id voluptatem. Ea fuga quam nisi sint pariatur quasi.','Exercitationem pariatur sed aut beatae non voluptatibus. Quis accusamus eius aut ut et dolores harum amet. Ipsum vitae inventore distinctio voluptatibus.',262),(170,'A odio esse occaecati debitis nulla officiis et corporis.','Sapiente excepturi voluptatem quia officiis.',264),(172,'Quia dolor at ut saepe magnam rerum autem ullam. Est eos et nam sed ad corporis nostrum velit. Necessitatibus ut laboriosam voluptates sunt.','Qui ipsa est delectus autem maiores quae. Ratione occaecati ut voluptatem quia sunt commodi soluta. Repellendus itaque enim et ullam quas.',268),(174,'Cupiditate non incidunt accusamus quo veniam velit sit molestiae. Soluta similique sed voluptates magnam non dolor illo. Maiores velit mollitia odio eum voluptatibus quisquam neque.','Non qui autem et veritatis omnis sint voluptatibus ducimus. Praesentium sapiente ut aspernatur fugiat inventore earum facere nisi. Vitae in illo provident amet.',270),(176,'Architecto unde rerum consequatur officiis culpa eligendi qui. Debitis commodi maiores cupiditate velit quis voluptas.','Harum modi ab qui illum incidunt mollitia. Facilis in voluptatum sunt facere neque.',274),(178,'Ut numquam quia maxime qui.','Qui est dolores et aliquam est qui. Voluptatem ut non aut ut illo ratione consequuntur. Est et nesciunt nulla nesciunt vitae est occaecati.',276),(180,'Iusto ipsam explicabo vel reiciendis aliquam voluptatem. Necessitatibus cupiditate placeat libero temporibus earum magnam.','Temporibus velit reiciendis est nihil et occaecati dolor aperiam.',280),(182,'Laboriosam odio est labore. Harum qui non inventore sed. Consectetur eveniet suscipit voluptatem sed dicta harum qui totam.','Aut commodi ut id ullam quisquam rem eligendi quis.',282),(184,'Quidem dicta quia dolorum error excepturi fugit explicabo. Et voluptatum natus molestias id quas.','Enim maxime aliquam maxime autem. Aspernatur vel molestias a omnis. Vel illum quam non quia reiciendis asperiores quod optio.',286),(186,'Sit possimus ea corporis tempore. Delectus pariatur impedit et accusantium.','Provident perspiciatis placeat ipsum. Et quod dolorem voluptatem dolorem architecto exercitationem sit.',288),(188,'Sit qui eligendi et minus porro dolor atque quidem. Sunt fugit repellat harum saepe magnam illum. Asperiores ex qui commodi consequatur ratione numquam saepe.','Aspernatur non esse eum ab dolor architecto animi sed. Laborum mollitia consequuntur distinctio molestiae.',290),(226,'Corporis ipsum quis tempora vitae quod itaque natus et. Aut iusto deserunt voluptatem.','Dignissimos consectetur ducimus amet qui quis aperiam. Eligendi corrupti sunt quaerat eaque sunt qui reiciendis.',380),(228,'Vero deleniti et perspiciatis provident. Voluptatum fuga qui nostrum. Asperiores porro dicta ut et ducimus ratione consequatur.','Esse doloribus voluptatum sit ipsam. Exercitationem accusantium nihil quaerat sequi facilis quasi.',382),(230,'Aut veniam qui pariatur dolor consectetur. Labore laudantium et veritatis.','Sint ea et quasi ab maxime sit cumque.',388),(232,'Qui quaerat neque autem provident illum. Dolores ad ad numquam. Iure ut nemo optio ea dolores quia earum.','Animi sed voluptatibus quod laborum non labore.',390),(233,'Havenly Cookies and More, LLc',NULL,NULL),(235,'Havenly Cookies and More, LLc','http://www.heavnlycookiesandmore.com',NULL),(237,'Heavenly Cookies and More, LLC','http://www.heavenlycookiesandmore.com',NULL),(239,'Heavenly Cookies and More, LLC','http=>//www.heavenlycookiesandmore.com',NULL),(241,'Usko Express Inc','www.uskoinc.com',NULL);
/*!40000 ALTER TABLE `ent_businesses` ENABLE KEYS */;
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
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
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
INSERT INTO `entities` VALUES (1,1,'2019-07-03 12:46:57','This should be the company that is using the software, also for testing purposes',NULL,NULL),(3,1,'2019-07-18 16:08:43','Driver, for testing purposes',NULL,NULL),(5,1,'2019-07-18 16:08:43','Broker, for testing purposes',NULL,NULL),(7,1,'2019-07-18 16:16:46','Comdata, for testing purposes',NULL,NULL),(5080,1,'2019-09-09 13:40:45',NULL,NULL,102),(5088,1,'2019-09-09 16:27:52',NULL,NULL,108),(5090,1,'2019-09-09 16:27:52',NULL,NULL,110),(5092,1,'2019-09-09 16:28:25',NULL,NULL,112),(5094,1,'2019-09-09 16:28:25',NULL,NULL,114),(5096,1,'2019-09-09 16:28:50',NULL,NULL,116),(5098,1,'2019-09-09 16:28:50',NULL,NULL,118),(5124,1,'2019-09-09 17:28:55',NULL,NULL,136),(5126,1,'2019-09-09 17:28:56',NULL,NULL,138),(5128,1,'2019-09-09 17:41:34',NULL,NULL,140),(5130,1,'2019-09-09 17:41:34',NULL,NULL,142),(5156,1,'2019-09-10 11:08:03',NULL,NULL,160),(5158,1,'2019-09-10 11:08:03',NULL,NULL,162),(5160,1,'2019-09-10 11:15:15',NULL,NULL,164),(5162,1,'2019-09-10 11:15:16',NULL,NULL,166),(5164,1,'2019-09-10 11:20:12',NULL,NULL,168),(5166,1,'2019-09-10 11:20:13',NULL,NULL,170),(5168,1,'2019-09-10 11:24:07',NULL,NULL,172),(5170,1,'2019-09-10 11:24:07',NULL,NULL,174),(5172,1,'2019-09-10 11:35:35',NULL,NULL,176),(5174,1,'2019-09-10 11:35:36',NULL,NULL,178),(5176,1,'2019-09-10 11:36:10',NULL,NULL,180),(5178,1,'2019-09-10 11:36:10',NULL,NULL,182),(5180,1,'2019-09-10 11:37:18',NULL,NULL,184),(5182,1,'2019-09-10 13:35:23',NULL,NULL,186),(5184,1,'2019-09-10 13:35:23',NULL,NULL,188),(5240,1,'2019-09-11 16:26:57',NULL,NULL,226),(5242,1,'2019-09-11 16:26:58',NULL,NULL,228),(5244,1,'2019-09-11 16:29:29',NULL,NULL,230),(5246,1,'2019-09-11 16:29:29',NULL,NULL,232),(5247,1,'2019-11-20 08:58:43',NULL,NULL,233),(5249,1,'2019-11-20 08:59:58',NULL,NULL,235),(5251,1,'2019-11-20 11:39:37',NULL,NULL,237),(5253,1,'2019-11-20 13:36:08',NULL,NULL,239),(5255,1,'2019-11-20 16:00:19',NULL,NULL,241);
/*!40000 ALTER TABLE `entities` ENABLE KEYS */;
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
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
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
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
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
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
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
INSERT INTO `fin_invoices_items` VALUES (1,NULL,NULL,2250.00,1,NULL,'2019-07-18 16:30:27',NULL,NULL,6,NULL,1),(3,NULL,NULL,200.00,1,NULL,'2019-07-18 16:32:44',NULL,NULL,NULL,10,1),(5,NULL,NULL,2500.00,1,NULL,'2019-07-18 16:29:45',NULL,NULL,NULL,2,1),(7,NULL,NULL,4.00,1,NULL,'2019-07-18 16:33:15',NULL,NULL,NULL,12,1),(9,NULL,NULL,200.00,1,NULL,'2019-07-18 16:35:55',NULL,NULL,16,NULL,1),(11,NULL,NULL,4.00,1,NULL,'2019-07-18 16:36:23',NULL,NULL,18,NULL,1);
/*!40000 ALTER TABLE `fin_invoices_items` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `fin_item_templates_trees`
--

LOCK TABLES `fin_item_templates_trees` WRITE;
/*!40000 ALTER TABLE `fin_item_templates_trees` DISABLE KEYS */;
INSERT INTO `fin_item_templates_trees` VALUES (34,34,0),(36,36,0),(38,38,0),(40,40,0),(41,41,0),(75,75,0),(34,36,1),(38,40,1);
/*!40000 ALTER TABLE `fin_item_templates_trees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `fin_item_templates_types`
--

LOCK TABLES `fin_item_templates_types` WRITE;
/*!40000 ALTER TABLE `fin_item_templates_types` DISABLE KEYS */;
INSERT INTO `fin_item_templates_types` VALUES (1,'Service',0,1,'A service provided by your company.'),(3,'Fee',0,1,'A fee which usually is attached to a service'),(5,'Vendor Service',0,1,'A service provided from another company for your customers.'),(7,'Payment',0,1,'A payment that your company is making to another company.'),(11,'Loan',0,1,'A loan provided by your company to a customer.'),(13,'Reimbursement',0,1,'An amount which is owed back to a cutomer or vendor.'),(15,'Scheduled Deduction',0,0,'A deduction that is automatically supposed to be charged to a customer or vendor.');
/*!40000 ALTER TABLE `fin_item_templates_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `fin_jobs`
--

LOCK TABLES `fin_jobs` WRITE;
/*!40000 ALTER TABLE `fin_jobs` DISABLE KEYS */;
INSERT INTO `fin_jobs` VALUES (1,'Trip 1',0,'2019-07-03 17:42:32');
/*!40000 ALTER TABLE `fin_jobs` ENABLE KEYS */;
UNLOCK TABLES;

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
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
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
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
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
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
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
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
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
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
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
INSERT INTO `fin_transactions` VALUES (1,1,'1-0001',NULL,NULL,'2019-07-03 12:43:10','2019-07-03 12:43:10',NULL,NULL,'Broker Rate for trip'),(3,1,'1-0002',NULL,NULL,'2019-07-18 16:24:17','2019-07-18 16:24:17',NULL,NULL,'Driver payment'),(5,1,'1-0003',NULL,NULL,'2019-07-18 16:24:17','2019-07-18 16:24:17',NULL,NULL,'Driver advance via ComData'),(7,3,'34453',NULL,NULL,'2019-07-18 16:24:17','2019-07-18 16:24:17',NULL,NULL,'Check to driver'),(9,11,'72399',NULL,NULL,'2019-07-18 16:24:17','2019-07-18 16:24:17',NULL,NULL,'Broker payment for trip');
/*!40000 ALTER TABLE `fin_transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `gen_files`
--

LOCK TABLES `gen_files` WRITE;
/*!40000 ALTER TABLE `gen_files` DISABLE KEYS */;
INSERT INTO `gen_files` VALUES (2,'Sequi necessitatibus laborum accusamus. Nihil aut ut non. Consectetur at et harum non velit.','Et sit tenetur mollitia aut recusandae at officia. Voluptas voluptates qui tempora doloremque officiis.','Et ea ratione commodi dolor omnis quia beatae iste. Aliquam sed autem corrupti similique voluptatem ut.',_binary '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\n','Temporibus voluptas voluptates et nesciunt distinctio sint.','Provident minima eum rem est delectus blanditiis aperiam. Eaque ut nostrum quis ut et sunt error impedit.','2020-04-14 04:27:38','2020-06-05 13:36:32','Dolorem debitis blanditiis dolores. Iste sint assumenda modi recusandae.'),(8,'Praesentium id vel iste. Sapiente et iure voluptatibus eaque. Quis non nihil beatae amet soluta veniam voluptas ex.','Officia nobis et incidunt saepe. Et dolor quas earum.','Qui tempora neque minima nam.',_binary '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\n','Alias dolor molestias expedita.','Rerum vero ratione enim ipsa aperiam. Aut nulla quo at architecto sint odio modi.','2020-02-25 00:15:10','2019-10-10 15:30:29','Sequi qui recusandae earum perferendis quia accusamus dicta est.'),(22,'Omnis suscipit quaerat qui in. Consequuntur minima nam quidem rerum.','Enim eos aut adipisci impedit omnis ut. Et incidunt alias amet et in ut esse eos. Ex eum sit id est sunt sit ab.','A consequatur ullam neque tempore impedit omnis perferendis. Accusamus debitis hic totam odio maxime.',_binary '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\n','e6114a6c83f3dedede1637f2aa6ee42d094293bdb72c9573a753d813b1dcb512','Eum et nihil delectus harum quis unde.','2019-09-28 06:50:14','2020-06-26 18:50:39','Aliquam praesentium hic vero nostrum eveniet voluptate.'),(24,'Est praesentium eum eaque. Repudiandae iste non nesciunt perferendis.','Ad omnis deserunt modi. Sed dicta rem asperiores accusantium. Aut velit fugit voluptas.','Voluptatem quas inventore dolor qui repudiandae. Ut assumenda ullam explicabo ducimus quod labore aut. Nihil eaque facere iusto eos necessitatibus.',_binary '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\nRK5CYII=\n','26934c4a3c5111f99da04e2a9c7b6ed66d0a142b06d1b7bac3e7f80d05d28543','Delectus qui odio id officiis a.','2019-09-12 00:09:52','2019-11-22 14:22:58','Et sunt nulla earum qui. Sapiente optio porro eveniet culpa.'),(32,'Tempore atque qui quo corrupti eos sapiente aliquid ut. Suscipit maxime deleniti officiis.','Est autem rerum deleniti.','Repudiandae explicabo veritatis esse ut.',_binary 'iVBORw0KGgoAAAANSUhEUgAAAGwAAACnAQMAAADOhyv5AAAABlBMVEV1wiT/uh9vt9lFAAAACXBI\nWXMAAA7EAAAOxAGVKw4bAAAJwklEQVRIiQ3UiT8Tjh8G8E8JKWVUKNfk+yMdWK7mCKF8UUaSrJjk\nNibHEjIldMh8kYqySK5klRwxOcLkPpJzm8w5x5y5/fwJz/N6njck9p34b+CuGgcZV78VgwR2Fn4j\nODuJQzyga71CgvQmmVTpJM3VmRx+WxIC2ol9IplyHbG/Zi2+zHHhnEu7rfrH6izOjlHJ4wB0lx3H\nw+w2eR6iln+NABBamlaZCzymVz8yVE+SQa+7O1JjyjPXun1FzA8B48mp+zVEC9UbnRafv6JCAKPF\nL/DbbJWlkv93ARyE0Qq/cxEFIRIF8xofMXDYs9WHyNf6LMZRffQJEghDs17zxzo2BSbXmMIEGMfO\nCc2JUDqfUfhqw6jwdOhA+7MOHl/J9zyRniyILS15kvoP3QZbVDmnjgRq8QrHqaG4LMktYzwLByVC\n8lu365wZ52kuYbNkmPD2+naqNCDe6vOTkktU4Ci+VnCdP/lOKeGApzIL9rRMehhIl3Ue8TrUZq8C\n4itHOY/vebTs+LqqI06GxmPccyvj9Wr1V9oEwzBwRDJbJq3cSCQ1Xo3yRQV+5NepJbn/JV5V0DDw\nJEHoV7P3E9mC8Z1BSso0BAjbV9oNSz/fCO9D5fVRYeZF3N5AOWuPTo1zFUFISD8xocQIx0N3QfPZ\nUhLEfynndc1pxBjwec46AWgwWdkLIjf7y6TeK22R4fpmjfEHq4wOto70tegKMLN2xIpk8Sathv5P\nyxcHmWcJ5dn03Cm1olWrNQoMhGREF8cZDEg+aLv2UQXeKryVbXGwCFrbh8pXo8I3LcPNNU3Gfy4j\nPm2qBNh3I6HHsJnSxdx6SK1DwqGvDahO6suGKOPZrZ8k8PiYzRVN+uIaTBzAl+NglxStDrUjSYdX\nlzaigIFFT94th83g4dnlRqFcAihWbtxS9FVfmOvaT5xGwFrF9TxGd7O73WIU5h4FNB4X/Wi02O2y\n/r/X5acJMImew7YQFCQGBYiVf1ngZejHEc0xHHwU/da1lwDOhJvFH5d/xHZf7HsyxwIhn0FXVWP0\nMacUkR4UCyzzH+HjZOQcrNu42o8BdvfI5q58Lll8Hi+pKE4BYZJfWqx4st6lCs6ff1vhOEcRWTr7\ni2uvlvdJnQR+olcuFnK/jl0pZjP4CaDLDDt6eCQvauXiqf4RfXB+eupsIP2E7aanBVuYC/2m3qFb\nIWUuLuP8f1taIWRncZAIEvXy2zTWak8rdN3s0jNPV+7gdKyWbMff+M1fer08knl7gDmwwYUi03wd\n80PLwQPVlyVk9YGwGadun8eo1cu9WW7JBZV2MSFSf4FwpMPkY0cqjCUq4Uy9JoZ1MZ9Dh8lgcopT\nu/nsFf/utqg/SxSgSWkkkEtlL53dQhpIswCL9RnDB/7o8g3d8TKZDOc/aJ/SVntkRWu58j2MAv6l\n8ktvpjrDtx5/dnAnALHZ9x9X81UKT7gOR5AAEX1+cyZS9bx2y0Oi+jj490KUA5EWah/wzVmWjoAG\nGkWQeYlrpiawhY+tgG/Nu+SkL/QzcvocbBQqIIJZYJ6yuot2Id42/VEFLB2snWvKSWZ/PXK3RIcL\nCX74SF+TTCpP9d382lY4fXlZyfXoZJtEREFBoT4YRxyu0Q6zOFIvyrM2RYH85eRCgYN6n+RjE4Kr\nMOAfV9OwtPtHck+wfNe/BOCV19gYixk85PmzynwEB8ROSw8V6/tLZ3b27Q8hwNvABiG4LKBz2tTa\nn0IBlYfKo6GiDQLBdq9tbDFQVu3j3+Cc6EubkGluRIAcljDFe1vS/492wX4LLgjeXRo++VVYBZ0x\neGoeoPlwGJ+8ex6vaJ7PTBQZyh5fd0XJTys3ot3EFEkQVIqOWUgp4k8amPz7ohXG0xacVgJrT2SX\n5PbcpwJFuqQzpSbIMo65X3YWBzPYsvj7yNulqr/W2UVUWBgcVvZ4XhanuLPsRDMX6jS6enqdjL7c\ncTyUu1wB+xIxg7yjoaP4jEbCm21FLXsb3eX3VmYkxpvXEeCq6D1DRY1ZxQ9sIb0H27WvOp8g2leV\n/ZleGmWTwFow/crEh0f3P1DDftlVQNKQwQH0eO7iUOyrTWEMXN7BqC+X+6RJF38Ue4wLtqwDevtV\nz8SR4rkzsa0gnIM+PnjtxgR6agQhyYV8+jTjuZbW+vXln5ISFZAemhEzSDTYuPcgewBJAlumGzH3\nGvJY54ZzVz0GTvbru3nzm0lok5VtRAkwKKX6cGBeZz67Ryc8BQdHUV7mxlb0KlNDxYdFrRCn4PXS\nWwaVJTHJKvHHwF3Sb/P6iNv0Hdm0kNcsMCpMlo/APG3x/nDUep0LV7PeYewMUIz8P/luaBLUoO3P\nBwuZc3bt6z/7CQl770Su3fLOOKd73UrclAzhytWp54+NB3PT5gM8uYC1KaHyKFoYi3IF1Z5QYPO7\nUNOzYikt0791bJvtAYu859fa6DQ+OB/cKoOAQZnvIe13on6b7hrVHWGBNm9fipSto7V7N/4WhwW/\n35sY1XiVG9wzwGVKUADPd+r5uoQebsnU930nAlzShkLNGMhOni6bUQ4JfFOLS359CvBwdVCS3IYi\nLf5Og7J1iFu+eeA9JBlujlaatK9pdnZY+pSsk6D/hV7TmzD01R/rvqQoDCzYjN36bOHId6F+jBZN\ngvFXubaZWBw/pq0QRSJB6dSeGcGegDNvHtiweivAZDlbH+UVe9xRUyxlqQLopwvZKUtKa5UXzWvl\nVGC5Hv9gFt2KTUiMXvmAgMX1YYkh/IFreHmh2vs4cLKWNuoazNlX8IleZ64P312Ka1r9o1PAMV05\nAQMcr/kJ5uTKq4O5qmN7KbBeFWJ06IUb7vyGa6IoDjoY+7X5uUHJqW1h54JVQN2ocnfvmfAQMp1H\n2p4MhZbXdKKJi1kalUJWnhTQfEXg+JdVHX/3mzF8DQk8S70nR9maLZe90dheLgS1Z71jpuY4fdGK\n0t9mZBrRkruye4aiJKb7ai8GakTSmhy30ml3dF6+OUyBKCV1RMxyW7fxl+ZyQwBEUY/BtwBtJUWN\ngJQsKkSyH3JX2ZKr1dhsMRMu3CpEig+WPj+PxiM8frDA7NhckWv2LYeMjjNhFymwM9XjabV2qoo/\nwr16FgNqd+mZsxs9wrJSlWsXyPD4HTUunZ8/duHBTUYXApQipeweRZoFOH9OPzBGhkV2PJOYWi9o\nzdcYM8GCE85iKTdCz/FH7SGtbz/UIzPiqWuv7mtf4zHjZhJ4Tr2wb6b9lKBa9gTpAmh5lu68EdF+\nm/s6u9WBAKjFeLqZw1nTKp7p16YkCN6Z6E7AFf5z4XqjY0YFsPdOLObhFDukrzaNZAHEajpZDOq+\noI+02R805P4f5Zy9z4fG93gAAAAASUVORK5CYII=\n','18ffab19085deb7bec2a09dd9176b1b504445456a1ec47bcd45bf2a1e6c40a49','Ut veniam itaque reprehenderit accusamus. Dolorem tempora earum saepe. Recusandae porro harum inventore.','2020-05-28 01:55:01','2019-10-04 07:31:23','Sed ea optio nihil voluptatum nulla eos debitis. Reprehenderit eaque incidunt et. Minus blanditiis ut quis repellat voluptates omnis est cum.'),(34,'Velit est vel porro qui laboriosam autem velit.','Culpa cum laboriosam commodi dolores ut accusantium. Voluptatem in molestiae qui dicta voluptatem vero et ea.','Corrupti error eius est explicabo excepturi alias repellat laborum. Aut voluptatibus eligendi in. Qui consequatur magni facere repellendus sint.',_binary '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\nRK5CYII=\n','5616d09aac0a390aedd15cd51efe2c3f4b47ec9195333e1759a4260b5cc2013a','Voluptas qui voluptas quam veritatis aspernatur. Possimus autem harum quis sint ex. Mollitia eum quibusdam nihil earum.','2020-03-31 14:31:04','2020-08-01 09:14:07','Eum culpa culpa sed omnis veniam unde aspernatur voluptatibus. Natus ea est impedit sequi vel nulla quia.'),(36,'Qui nisi quam eum. Eum nisi est quidem. Quia porro suscipit dignissimos fuga molestiae atque voluptatum.','Tempora pariatur rerum provident et ut.','Dolore voluptas laborum ex sunt neque perspiciatis atque. Sint voluptate illo illum ad quia in. Libero voluptatibus ea delectus cumque voluptatibus.',_binary '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\nSUVORK5CYII=\n','c80295d708dcab60667fed949ebf8d01bee0959b4e3188d5814a2f110641bf60','Quod similique sit dolores inventore quos. Velit aut voluptatem modi a culpa rerum quisquam expedita.','2019-10-16 22:58:53','2020-03-09 23:18:02','Vitae aut est atque et laborum dolor ut aspernatur. Fugit sit omnis alias minus cum.');
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
INSERT INTO `inv_tiresizes` VALUES (2,'10R22.5','Truck'),(4,'11R22.5','Truck'),(6,'11R24.5','Truck'),(8,'12R22.5','Truck'),(10,'12R24.5','Truck'),(12,'255/70R22.5','Truck'),(14,'275/70R22.5','Truck'),(16,'275/80R22.5','Truck'),(18,'285/75R24.5','Truck'),(20,'295/75R22.5','Truck');
/*!40000 ALTER TABLE `inv_tiresizes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `inv_trailer_types`
--

LOCK TABLES `inv_trailer_types` WRITE;
/*!40000 ALTER TABLE `inv_trailer_types` DISABLE KEYS */;
INSERT INTO `inv_trailer_types` VALUES ('Car Hauler'),('Dry Van'),('Flatbed'),('Reefer'),('Step Deck');
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
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
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
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
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
INSERT INTO `tsk_resps` VALUES (19,13,21,'Task Executor');
/*!40000 ALTER TABLE `tsk_resps` ENABLE KEYS */;
UNLOCK TABLES;

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
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
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
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
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
INSERT INTO `tsk_trees` VALUES (2,13,13,0);
/*!40000 ALTER TABLE `tsk_trees` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-11-21  7:51:29
