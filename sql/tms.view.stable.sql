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

-- Dump completed on 2019-11-21  7:51:29
