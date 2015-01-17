-- MySQL dump 10.13  Distrib 5.6.13, for osx10.8 (x86_64)
--
-- Host: localhost    Database: wangdong
-- ------------------------------------------------------
-- Server version	5.6.13

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
-- Table structure for table `app2_admin`
--

DROP TABLE IF EXISTS `app2_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app2_admin` (
  `userid` mediumint(6) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL,
  `roleid` smallint(5) DEFAULT '0',
  `encrypt` varchar(6) DEFAULT NULL,
  `lastloginip` varchar(15) DEFAULT NULL,
  `lastlogintime` int(10) unsigned DEFAULT '0',
  `email` varchar(40) DEFAULT NULL,
  `realname` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`userid`),
  KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app2_admin`
--

LOCK TABLES `app2_admin` WRITE;
/*!40000 ALTER TABLE `app2_admin` DISABLE KEYS */;
INSERT INTO `app2_admin` VALUES (1,'admin','f41811c88a2da17c9351ddffb4496d59',1,'GqlZUW','127.0.0.1',1421465447,'peterfeispace@gmail.com',''),(2,'gubei','a58638fc8d9cdb3cccf0b93af8c2bba8',3,'pNevAZ','0.0.0.0',1420007178,'gubei@163.com','gubei');
/*!40000 ALTER TABLE `app2_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app2_admin_role`
--

DROP TABLE IF EXISTS `app2_admin_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app2_admin_role` (
  `roleid` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `rolename` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`roleid`),
  KEY `listorder` (`listorder`),
  KEY `disabled` (`disabled`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app2_admin_role`
--

LOCK TABLES `app2_admin_role` WRITE;
/*!40000 ALTER TABLE `app2_admin_role` DISABLE KEYS */;
INSERT INTO `app2_admin_role` VALUES (1,'超级管理员','超级管理员',0,0),(2,'普通用户','普通用户',0,0),(3,'系统录入','',0,0);
/*!40000 ALTER TABLE `app2_admin_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app2_admin_role_priv`
--

DROP TABLE IF EXISTS `app2_admin_role_priv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app2_admin_role_priv` (
  `roleid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `c` char(20) NOT NULL,
  `a` char(20) NOT NULL,
  KEY `roleid` (`roleid`,`c`,`a`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app2_admin_role_priv`
--

LOCK TABLES `app2_admin_role_priv` WRITE;
/*!40000 ALTER TABLE `app2_admin_role_priv` DISABLE KEYS */;
INSERT INTO `app2_admin_role_priv` VALUES (3,'Employee','employeeList'),(3,'Employee','top'),(3,'Member','left'),(3,'Member','memberAdd'),(3,'Member','memberAddDetail'),(3,'Member','memberList'),(3,'Member','top'),(3,'MemberDetail','detailList'),(3,'Setting','left'),(3,'Setting','site'),(3,'Setting','top');
/*!40000 ALTER TABLE `app2_admin_role_priv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app2_category`
--

DROP TABLE IF EXISTS `app2_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app2_category` (
  `catid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `parentid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `catname` varchar(30) NOT NULL,
  `description` mediumtext NOT NULL,
  `url` varchar(100) NOT NULL,
  `setting` mediumtext NOT NULL,
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ismenu` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`catid`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app2_category`
--

LOCK TABLES `app2_category` WRITE;
/*!40000 ALTER TABLE `app2_category` DISABLE KEYS */;
INSERT INTO `app2_category` VALUES (1,0,0,'test','','','',0,1),(2,0,0,'2','','','',0,1),(3,0,0,'photo1','','','',0,1);
/*!40000 ALTER TABLE `app2_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app2_category_priv`
--

DROP TABLE IF EXISTS `app2_category_priv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app2_category_priv` (
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `roleid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `is_admin` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `action` char(30) NOT NULL,
  KEY `catid` (`catid`,`roleid`,`is_admin`,`action`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app2_category_priv`
--

LOCK TABLES `app2_category_priv` WRITE;
/*!40000 ALTER TABLE `app2_category_priv` DISABLE KEYS */;
/*!40000 ALTER TABLE `app2_category_priv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app2_cost`
--

DROP TABLE IF EXISTS `app2_cost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app2_cost` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` varchar(10) NOT NULL COMMENT '项目ID',
  `eid` int(11) NOT NULL COMMENT '发型师ID',
  `aid` int(11) DEFAULT NULL COMMENT '助理ID',
  `createdtime` int(10) NOT NULL COMMENT '创建时间',
  `modified` int(10) DEFAULT NULL COMMENT '修改时间',
  `operate_id` int(11) NOT NULL COMMENT '操作人ID',
  `account` decimal(10,2) NOT NULL COMMENT '应付款',
  `discount` decimal(10,2) DEFAULT '0.00' COMMENT '折扣',
  `real_pay` decimal(10,2) NOT NULL COMMENT '实付',
  `point` tinyint(4) DEFAULT '0' COMMENT '是否点牌',
  PRIMARY KEY (`id`),
  KEY `id_idx` (`eid`,`aid`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app2_cost`
--

LOCK TABLES `app2_cost` WRITE;
/*!40000 ALTER TABLE `app2_cost` DISABLE KEYS */;
INSERT INTO `app2_cost` VALUES (1,'0',0,0,0,NULL,0,100.00,0.00,100.00,0),(2,'0',0,0,0,NULL,0,10.00,0.00,0.00,0),(3,'0',2,1,0,NULL,0,0.00,0.00,0.00,0),(4,'0',2,1,0,NULL,0,0.00,0.00,0.00,0),(5,'ITEM_WASH',2,1,0,NULL,0,0.00,0.00,0.00,0),(6,'ITEM_WASH',2,1,0,NULL,0,0.00,0.00,0.00,0),(7,'ITEM_WASH',2,1,1419321862,1419321862,0,0.00,0.00,0.00,0),(8,'ITEM_WASH',2,1,1419325109,1419325109,1,0.00,0.00,0.00,0),(9,'ITEM_WASH',2,1,1419341459,1419341459,1,0.00,0.00,0.00,0),(10,'ITEM_WASH',2,1,1419569703,1419569703,1,0.00,0.00,0.00,1),(11,'ITEM_WASH',2,1,1419901457,1419901457,1,99.00,0.00,99.00,1),(12,'ITEM_WASH',3,4,1419915916,1419915916,1,100.00,0.00,88.00,1),(13,'ITEM_WASH',2,1,1420108153,1420108153,1,0.00,0.00,0.00,0),(14,'ITEM_WASH',2,1,1420108570,1420108570,1,0.00,0.00,0.00,0);
/*!40000 ALTER TABLE `app2_cost` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app2_employee`
--

DROP TABLE IF EXISTS `app2_employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app2_employee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `eno` varchar(45) NOT NULL COMMENT '工号',
  `age` int(11) DEFAULT NULL COMMENT '年龄',
  `work_age` int(11) DEFAULT '0' COMMENT '工龄',
  `status` int(11) DEFAULT '1' COMMENT '状态',
  `phone` varchar(45) NOT NULL COMMENT '手机号',
  `sex` int(11) DEFAULT '0' COMMENT '性别',
  `remark` text COMMENT '备注',
  `type` varchar(45) NOT NULL COMMENT '工种',
  `createdtime` int(10) DEFAULT NULL COMMENT '生成时间',
  `level` varchar(45) DEFAULT NULL COMMENT '员工级别',
  PRIMARY KEY (`id`),
  UNIQUE KEY `phone_UNIQUE` (`phone`),
  UNIQUE KEY `eno_UNIQUE` (`eno`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app2_employee`
--

LOCK TABLES `app2_employee` WRITE;
/*!40000 ALTER TABLE `app2_employee` DISABLE KEYS */;
INSERT INTO `app2_employee` VALUES (1,'王一','001',NULL,0,1,'18092058679',1,'','EMPLOYEE_LEARN',NULL,NULL),(2,'小宁波','002',NULL,0,1,'18092058690',1,'','EMPLOYEE_JUNIOR',NULL,NULL),(3,'王师','004',NULL,1,1,'18092057670',1,'','EMPLOYEE_JUNIOR',1419407131,NULL),(4,'小宋','009',NULL,0,1,'18292058670',1,'','EMPLOYEE_LEARN',1419412487,''),(5,'小张','0010',NULL,0,1,'18092058699',1,'','EMPLOYEE_JUNIOR',1419412603,'LEVEL_1');
/*!40000 ALTER TABLE `app2_employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app2_link`
--

DROP TABLE IF EXISTS `app2_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app2_link` (
  `linkid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `linktype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT '',
  `logo` varchar(255) NOT NULL DEFAULT '',
  `introduce` text NOT NULL,
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `passed` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`linkid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app2_link`
--

LOCK TABLES `app2_link` WRITE;
/*!40000 ALTER TABLE `app2_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `app2_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app2_log`
--

DROP TABLE IF EXISTS `app2_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app2_log` (
  `logid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `controller` varchar(15) NOT NULL,
  `action` varchar(20) NOT NULL,
  `querystring` mediumtext NOT NULL,
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` varchar(20) NOT NULL,
  `ip` varchar(15) NOT NULL,
  `time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`logid`),
  KEY `module` (`controller`,`action`),
  KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=408 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app2_log`
--

LOCK TABLES `app2_log` WRITE;
/*!40000 ALTER TABLE `app2_log` DISABLE KEYS */;
INSERT INTO `app2_log` VALUES (1,'Index','index','{\"GET\":[]}',1,'admin','0.0.0.0','2014-12-14 23:09:40'),(2,'Admin','memberlist','{\"GET\":{\"menuid\":\"12\",\"_\":\"1418569785684\"}}',1,'admin','0.0.0.0','2014-12-14 23:09:45'),(3,'Admin','memberlist','{\"GET\":{\"grid\":\"datagrid\"},\"POST\":{\"page\":\"1\",\"rows\":\"20\"}}',1,'admin','0.0.0.0','2014-12-14 23:09:46'),(4,'Setting','site','{\"GET\":{\"menuid\":\"10\",\"_\":\"1418569793396\"}}',1,'admin','0.0.0.0','2014-12-14 23:09:53'),(5,'Setting','site','{\"GET\":{\"grid\":\"propertygrid\"},\"POST\":[]}',1,'admin','0.0.0.0','2014-12-14 23:09:53'),(6,'Index','index','{\"GET\":[]}',1,'admin','0.0.0.0','2014-12-14 23:10:35'),(7,'Setting','site','{\"GET\":{\"menuid\":\"10\",\"_\":\"1418569838719\"}}',1,'admin','0.0.0.0','2014-12-14 23:10:38'),(8,'Setting','site','{\"GET\":{\"grid\":\"propertygrid\"},\"POST\":[]}',1,'admin','0.0.0.0','2014-12-14 23:10:38'),(9,'Setting','sitedefault','{\"GET\":[],\"POST\":[]}',1,'admin','0.0.0.0','2014-12-14 23:10:41'),(10,'Cost','costlist','{\"GET\":{\"menuid\":\"43\",\"_\":\"1420108565469\"}}',1,'admin','127.0.0.1','2015-01-01 18:36:05'),(11,'Cost','costlist','{\"GET\":{\"grid\":\"treegrid\"},\"POST\":{\"page\":\"1\",\"rows\":\"20\"}}',1,'admin','127.0.0.1','2015-01-01 18:36:05'),(12,'Cost','costadd','{\"GET\":{\"parentid\":\"0\",\"_\":\"1420108569334\"}}',1,'admin','127.0.0.1','2015-01-01 18:36:09'),(13,'Cost','costadd','{\"GET\":[],\"POST\":{\"info\":{\"pid\":\"ITEM_WASH\",\"eid\":\"2\",\"aid\":\"1\",\"account\":\"0\",\"discount\":\"0\",\"real_pay\":\"0\",\"point\":\"0\"}}}',1,'admin','127.0.0.1','2015-01-01 18:36:10'),(14,'Cost','costlist','{\"GET\":{\"grid\":\"treegrid\"},\"POST\":{\"page\":\"1\",\"rows\":\"20\"}}',1,'admin','127.0.0.1','2015-01-01 18:36:10'),(15,'System','loglist','{\"GET\":{\"menuid\":\"15\",\"_\":\"1420108573833\"}}',1,'admin','127.0.0.1','2015-01-01 18:36:13'),(16,'System','loglist','{\"GET\":{\"grid\":\"datagrid\"},\"POST\":{\"page\":\"1\",\"rows\":\"20\"}}',1,'admin','127.0.0.1','2015-01-01 18:36:14'),(17,'Index','index','{\"GET\":[]}',1,'admin','127.0.0.1','2015-01-01 18:36:34'),(18,'System','loglist','{\"GET\":{\"menuid\":\"15\",\"_\":\"1420108596973\"}}',1,'admin','127.0.0.1','2015-01-01 18:36:36'),(19,'System','loglist','{\"GET\":{\"grid\":\"datagrid\"},\"POST\":{\"page\":\"1\",\"rows\":\"20\"}}',1,'admin','127.0.0.1','2015-01-01 18:36:37'),(20,'Member','memberlist','{\"GET\":{\"menuid\":\"44\",\"_\":\"1420108614337\"}}',1,'admin','127.0.0.1','2015-01-01 18:36:54'),(21,'Member','memberlist','{\"GET\":{\"grid\":\"treegrid\"},\"POST\":{\"page\":\"1\",\"rows\":\"20\"}}',1,'admin','127.0.0.1','2015-01-01 18:36:54'),(22,'Member','memberadddetail','{\"GET\":{\"cid\":\"1112223\",\"_\":\"1420108643138\"}}',1,'admin','127.0.0.1','2015-01-01 18:37:23'),(23,'MemberDetail','detaillist','{\"GET\":{\"mid\":\"38\"},\"POST\":[]}',1,'admin','127.0.0.1','2015-01-01 18:37:23'),(24,'Member','memberadddetail','{\"GET\":[],\"POST\":{\"detail\":{\"mid\":\"38\",\"pay\":\"0\"}}}',1,'admin','127.0.0.1','2015-01-01 18:37:25'),(25,'Member','memberadddetail','{\"GET\":{\"cid\":\"1112223\",\"_\":\"1420108645051\"}}',1,'admin','127.0.0.1','2015-01-01 18:37:25'),(26,'MemberDetail','detaillist','{\"GET\":{\"mid\":\"38\"},\"POST\":[]}',1,'admin','127.0.0.1','2015-01-01 18:37:25'),(27,'System','loglist','{\"GET\":{\"menuid\":\"15\",\"_\":\"1420108651262\"}}',1,'admin','127.0.0.1','2015-01-01 18:37:31'),(28,'System','loglist','{\"GET\":{\"grid\":\"datagrid\"},\"POST\":{\"page\":\"1\",\"rows\":\"20\"}}',1,'admin','127.0.0.1','2015-01-01 18:37:31'),(29,'System','menulist','{\"GET\":{\"menuid\":\"16\",\"_\":\"1420108718621\"}}',1,'admin','127.0.0.1','2015-01-01 18:38:38'),(30,'System','menulist','{\"GET\":{\"grid\":\"treegrid\"},\"POST\":[]}',1,'admin','127.0.0.1','2015-01-01 18:38:40'),(31,'System','loglist','{\"GET\":{\"menuid\":\"15\",\"_\":\"1420108719953\"}}',1,'admin','127.0.0.1','2015-01-01 18:38:40'),(32,'System','loglist','{\"GET\":{\"grid\":\"datagrid\"},\"POST\":{\"page\":\"1\",\"rows\":\"20\"}}',1,'admin','127.0.0.1','2015-01-01 18:38:41'),(33,'Cost','costlist','{\"GET\":{\"menuid\":\"43\",\"_\":\"1420108916215\"}}',1,'admin','127.0.0.1','2015-01-01 18:41:56'),(34,'Cost','costlist','{\"GET\":{\"grid\":\"treegrid\"},\"POST\":{\"page\":\"1\",\"rows\":\"20\"}}',1,'admin','127.0.0.1','2015-01-01 18:41:56'),(35,'Cost','costlist','{\"GET\":{\"grid\":\"treegrid\"},\"POST\":{\"page\":\"1\",\"rows\":\"20\"}}',1,'admin','127.0.0.1','2015-01-01 18:42:33'),(36,'Cost','costlist','{\"GET\":{\"grid\":\"treegrid\"},\"POST\":{\"page\":\"1\",\"rows\":\"20\"}}',1,'admin','127.0.0.1','2015-01-01 18:42:34'),(37,'Income','incomelist','{\"GET\":{\"menuid\":\"52\",\"_\":\"1420108960820\"}}',1,'admin','127.0.0.1','2015-01-01 18:42:40'),(38,'Admin','memberlist','{\"GET\":{\"menuid\":\"12\",\"_\":\"1420108963692\"}}',1,'admin','127.0.0.1','2015-01-01 18:42:43'),(39,'Admin','memberlist','{\"GET\":{\"grid\":\"datagrid\"},\"POST\":{\"page\":\"1\",\"rows\":\"20\"}}',1,'admin','127.0.0.1','2015-01-01 18:42:43'),(40,'Cost','costlist','{\"GET\":{\"menuid\":\"43\",\"_\":\"1420108967525\"}}',1,'admin','127.0.0.1','2015-01-01 18:42:47'),(41,'Cost','costlist','{\"GET\":{\"grid\":\"treegrid\"},\"POST\":{\"page\":\"1\",\"rows\":\"20\"}}',1,'admin','127.0.0.1','2015-01-01 18:42:47'),(42,'Member','memberlist','{\"GET\":{\"menuid\":\"44\",\"_\":\"1420108968521\"}}',1,'admin','127.0.0.1','2015-01-01 18:42:48'),(43,'Member','memberlist','{\"GET\":{\"grid\":\"treegrid\"},\"POST\":{\"page\":\"1\",\"rows\":\"20\"}}',1,'admin','127.0.0.1','2015-01-01 18:42:48'),(44,'Member','memberadddetail','{\"GET\":{\"cid\":\"1112223\",\"_\":\"1420108969894\"}}',1,'admin','127.0.0.1','2015-01-01 18:42:49'),(45,'MemberDetail','detaillist','{\"GET\":{\"mid\":\"38\"},\"POST\":[]}',1,'admin','127.0.0.1','2015-01-01 18:42:49'),(46,'Member','memberadddetail','{\"GET\":{\"cid\":\"00006\",\"_\":\"1420113014916\"}}',1,'admin','127.0.0.1','2015-01-01 19:50:14'),(47,'MemberDetail','detaillist','{\"GET\":{\"mid\":\"37\"},\"POST\":[]}',1,'admin','127.0.0.1','2015-01-01 19:50:15'),(48,'Index','index','{\"GET\":[]}',1,'admin','127.0.0.1','2015-01-01 20:02:27'),(49,'Cost','costlist','{\"GET\":{\"menuid\":\"43\",\"_\":\"1420113749751\"}}',1,'admin','127.0.0.1','2015-01-01 20:02:29'),(50,'Cost','costlist','{\"GET\":{\"grid\":\"treegrid\"},\"POST\":{\"page\":\"1\",\"rows\":\"20\"}}',1,'admin','127.0.0.1','2015-01-01 20:02:30'),(51,'Member','memberlist','{\"GET\":{\"menuid\":\"44\",\"_\":\"1420113751286\"}}',1,'admin','127.0.0.1','2015-01-01 20:02:31'),(52,'Member','memberlist','{\"GET\":{\"grid\":\"treegrid\"},\"POST\":{\"page\":\"1\",\"rows\":\"20\"}}',1,'admin','127.0.0.1','2015-01-01 20:02:31'),(53,'Member','memberpay','{\"GET\":{\"cid\":\"1112223\",\"_\":\"1420113756007\"}}',1,'admin','127.0.0.1','2015-01-01 20:02:36'),(54,'Index','index','{\"GET\":[]}',1,'admin','127.0.0.1','2015-01-01 20:04:37'),(55,'Cost','costlist','{\"GET\":{\"menuid\":\"43\",\"_\":\"1420113879827\"}}',1,'admin','127.0.0.1','2015-01-01 20:04:39'),(56,'Cost','costlist','{\"GET\":{\"grid\":\"treegrid\"},\"POST\":{\"page\":\"1\",\"rows\":\"20\"}}',1,'admin','127.0.0.1','2015-01-01 20:04:40'),(57,'Member','memberlist','{\"GET\":{\"menuid\":\"44\",\"_\":\"1420113880397\"}}',1,'admin','127.0.0.1','2015-01-01 20:04:40'),(58,'Member','memberlist','{\"GET\":{\"grid\":\"treegrid\"},\"POST\":{\"page\":\"1\",\"rows\":\"20\"}}',1,'admin','127.0.0.1','2015-01-01 20:04:40'),(59,'Member','memberpay','{\"GET\":{\"cid\":\"1112223\",\"_\":\"1420113881927\"}}',1,'admin','127.0.0.1','2015-01-01 20:04:41'),(60,'Member','memberpay','{\"GET\":{\"cid\":\"1112223\",\"_\":\"1420114079456\"}}',1,'admin','127.0.0.1','2015-01-01 20:07:59'),(61,'MemberDetail','detaillist','{\"GET\":{\"mid\":\"\"},\"POST\":[]}',1,'admin','127.0.0.1','2015-01-01 20:07:59'),(62,'Member','memberpay','{\"GET\":{\"cid\":\"00006\",\"_\":\"1420114121177\"}}',1,'admin','127.0.0.1','2015-01-01 20:08:41'),(63,'MemberDetail','detaillist','{\"GET\":{\"mid\":\"\"},\"POST\":[]}',1,'admin','127.0.0.1','2015-01-01 20:08:41'),(64,'Member','memberpay','{\"GET\":{\"cid\":\"00006\",\"_\":\"1420114126497\"}}',1,'admin','127.0.0.1','2015-01-01 20:08:46'),(65,'MemberDetail','detaillist','{\"GET\":{\"mid\":\"\"},\"POST\":[]}',1,'admin','127.0.0.1','2015-01-01 20:08:46'),(66,'Index','index','{\"GET\":[]}',1,'admin','127.0.0.1','2015-01-01 20:10:53'),(67,'Cost','costlist','{\"GET\":{\"menuid\":\"43\",\"_\":\"1420114255641\"}}',1,'admin','127.0.0.1','2015-01-01 20:10:55'),(68,'Cost','costlist','{\"GET\":{\"grid\":\"treegrid\"},\"POST\":{\"page\":\"1\",\"rows\":\"20\"}}',1,'admin','127.0.0.1','2015-01-01 20:10:55'),(69,'Member','memberlist','{\"GET\":{\"menuid\":\"44\",\"_\":\"1420114256198\"}}',1,'admin','127.0.0.1','2015-01-01 20:10:56'),(70,'Member','memberlist','{\"GET\":{\"grid\":\"treegrid\"},\"POST\":{\"page\":\"1\",\"rows\":\"20\"}}',1,'admin','127.0.0.1','2015-01-01 20:10:56'),(71,'Member','memberpay','{\"GET\":{\"cid\":\"1112223\",\"_\":\"1420114258213\"}}',1,'admin','127.0.0.1','2015-01-01 20:10:58'),(72,'Index','index','{\"GET\":[]}',1,'admin','127.0.0.1','2015-01-01 20:11:59'),(73,'Cost','costlist','{\"GET\":{\"menuid\":\"43\",\"_\":\"1420114322317\"}}',1,'admin','127.0.0.1','2015-01-01 20:12:02'),(74,'Cost','costlist','{\"GET\":{\"grid\":\"treegrid\"},\"POST\":{\"page\":\"1\",\"rows\":\"20\"}}',1,'admin','127.0.0.1','2015-01-01 20:12:02'),(75,'Member','memberlist','{\"GET\":{\"menuid\":\"44\",\"_\":\"1420114322930\"}}',1,'admin','127.0.0.1','2015-01-01 20:12:02'),(76,'Member','memberlist','{\"GET\":{\"grid\":\"treegrid\"},\"POST\":{\"page\":\"1\",\"rows\":\"20\"}}',1,'admin','127.0.0.1','2015-01-01 20:12:03'),(77,'Member','memberpay','{\"GET\":{\"cid\":\"1112223\",\"_\":\"1420114324576\"}}',1,'admin','127.0.0.1','2015-01-01 20:12:04'),(78,'Member','memberpay','{\"GET\":[],\"POST\":{\"detail\":{\"mid\":\"38\",\"pay\":\"243\"}}}',1,'admin','127.0.0.1','2015-01-01 20:12:11'),(79,'Member','memberpay','{\"GET\":[],\"POST\":{\"detail\":{\"mid\":\"38\",\"pay\":\"243\"}}}',1,'admin','127.0.0.1','2015-01-01 20:12:35'),(80,'Member','memberpay','{\"GET\":[],\"POST\":{\"detail\":{\"mid\":\"38\",\"pay\":\"243\"}}}',1,'admin','127.0.0.1','2015-01-01 20:13:17'),(81,'Member','memberpay','{\"GET\":[],\"POST\":{\"detail\":{\"mid\":\"38\",\"pay\":\"243\"}}}',1,'admin','127.0.0.1','2015-01-01 20:15:48'),(82,'Member','memberpay','{\"GET\":{\"cid\":\"1112223\",\"_\":\"1420114548789\"}}',1,'admin','127.0.0.1','2015-01-01 20:15:48'),(83,'Member','memberpay','{\"GET\":[],\"POST\":{\"detail\":{\"mid\":\"38\",\"pay\":\"486\"}}}',1,'admin','127.0.0.1','2015-01-01 20:16:48'),(84,'Member','memberpay','{\"GET\":{\"cid\":\"1112223\",\"_\":\"1420114608284\"}}',1,'admin','127.0.0.1','2015-01-01 20:16:48'),(85,'Member','memberpay','{\"GET\":[],\"POST\":{\"detail\":{\"mid\":\"38\",\"pay\":\"1\"}}}',1,'admin','127.0.0.1','2015-01-01 20:16:52'),(86,'Member','memberpay','{\"GET\":{\"cid\":\"1112223\",\"_\":\"1420114612071\"}}',1,'admin','127.0.0.1','2015-01-01 20:16:52'),(87,'Member','memberpay','{\"GET\":{\"cid\":\"1112223\",\"_\":\"1420114619097\"}}',1,'admin','127.0.0.1','2015-01-01 20:16:59'),(88,'Member','memberpay','{\"GET\":[],\"POST\":{\"detail\":{\"mid\":\"38\",\"pay\":\"100\"}}}',1,'admin','127.0.0.1','2015-01-01 20:17:05'),(89,'Member','memberpay','{\"GET\":{\"cid\":\"1112223\",\"_\":\"1420114625411\"}}',1,'admin','127.0.0.1','2015-01-01 20:17:05'),(90,'Member','memberpay','{\"GET\":{\"cid\":\"1112223\",\"_\":\"1420114632133\"}}',1,'admin','127.0.0.1','2015-01-01 20:17:12'),(91,'Member','memberpay','{\"GET\":{\"cid\":\"00006\",\"_\":\"1420114653655\"}}',1,'admin','127.0.0.1','2015-01-01 20:17:33'),(92,'Member','memberpay','{\"GET\":{\"cid\":\"00006\",\"_\":\"1420114661732\"}}',1,'admin','127.0.0.1','2015-01-01 20:17:41'),(93,'Member','memberadddetail','{\"GET\":{\"cid\":\"1112223\",\"_\":\"1420114669579\"}}',1,'admin','127.0.0.1','2015-01-01 20:17:49'),(94,'MemberDetail','detaillist','{\"GET\":{\"mid\":\"38\"},\"POST\":[]}',1,'admin','127.0.0.1','2015-01-01 20:17:49'),(95,'Member','memberadd','{\"GET\":{\"parentid\":\"0\",\"_\":\"1420114675784\"}}',1,'admin','127.0.0.1','2015-01-01 20:17:55'),(96,'Cost','costlist','{\"GET\":{\"menuid\":\"43\",\"_\":\"1420114703604\"}}',1,'admin','127.0.0.1','2015-01-01 20:18:23'),(97,'Cost','costlist','{\"GET\":{\"grid\":\"treegrid\"},\"POST\":{\"page\":\"1\",\"rows\":\"20\"}}',1,'admin','127.0.0.1','2015-01-01 20:18:23'),(98,'Member','memberlist','{\"GET\":{\"menuid\":\"44\",\"_\":\"1420114706171\"}}',1,'admin','127.0.0.1','2015-01-01 20:18:26'),(99,'Member','memberlist','{\"GET\":{\"grid\":\"treegrid\"},\"POST\":{\"page\":\"1\",\"rows\":\"20\"}}',1,'admin','127.0.0.1','2015-01-01 20:18:26'),(100,'Member','memberadd','{\"GET\":{\"parentid\":\"0\",\"_\":\"1420114708371\"}}',1,'admin','127.0.0.1','2015-01-01 20:18:28'),(101,'Member','memberadd','{\"GET\":{\"parentid\":\"0\",\"_\":\"1420114726886\"}}',1,'admin','127.0.0.1','2015-01-01 20:18:46'),(102,'Member','memberadddetail','{\"GET\":{\"cid\":\"1112223\",\"_\":\"1420114748364\"}}',1,'admin','127.0.0.1','2015-01-01 20:19:08'),(103,'MemberDetail','detaillist','{\"GET\":{\"mid\":\"38\"},\"POST\":[]}',1,'admin','127.0.0.1','2015-01-01 20:19:08'),(104,'Member','memberadddetail','{\"GET\":{\"cid\":\"1112223\",\"_\":\"1420114787884\"}}',1,'admin','127.0.0.1','2015-01-01 20:19:47'),(105,'MemberDetail','detaillist','{\"GET\":{\"mid\":\"38\"},\"POST\":[]}',1,'admin','127.0.0.1','2015-01-01 20:19:48'),(106,'Member','memberadddetail','{\"GET\":{\"cid\":\"00006\",\"_\":\"1420114791953\"}}',1,'admin','127.0.0.1','2015-01-01 20:19:51'),(107,'MemberDetail','detaillist','{\"GET\":{\"mid\":\"37\"},\"POST\":[]}',1,'admin','127.0.0.1','2015-01-01 20:19:52'),(108,'Member','memberadddetail','{\"GET\":{\"cid\":\"11111111\",\"_\":\"1420114794927\"}}',1,'admin','127.0.0.1','2015-01-01 20:19:54'),(109,'MemberDetail','detaillist','{\"GET\":{\"mid\":\"36\"},\"POST\":[]}',1,'admin','127.0.0.1','2015-01-01 20:19:55'),(110,'Member','memberadd','{\"GET\":{\"parentid\":\"0\",\"_\":\"1420114805295\"}}',1,'admin','127.0.0.1','2015-01-01 20:20:05'),(111,'Member','memberpay','{\"GET\":{\"cid\":\"100000\",\"_\":\"1420114808822\"}}',1,'admin','127.0.0.1','2015-01-01 20:20:08'),(112,'Member','memberpay','{\"GET\":{\"cid\":\"1112223\",\"_\":\"1420114812258\"}}',1,'admin','127.0.0.1','2015-01-01 20:20:12'),(113,'Member','memberpay','{\"GET\":[],\"POST\":{\"detail\":{\"mid\":\"38\",\"pay\":\"100\"}}}',1,'admin','127.0.0.1','2015-01-01 20:20:18'),(114,'Member','memberpay','{\"GET\":{\"cid\":\"1112223\",\"_\":\"1420114818795\"}}',1,'admin','127.0.0.1','2015-01-01 20:20:18'),(115,'Member','memberadddetail','{\"GET\":{\"cid\":\"1112223\",\"_\":\"1420114827499\"}}',1,'admin','127.0.0.1','2015-01-01 20:20:27'),(116,'MemberDetail','detaillist','{\"GET\":{\"mid\":\"38\"},\"POST\":[]}',1,'admin','127.0.0.1','2015-01-01 20:20:27'),(117,'Member','memberpay','{\"GET\":{\"cid\":\"1112223\",\"_\":\"1420114928129\"}}',1,'admin','127.0.0.1','2015-01-01 20:22:08'),(118,'Member','memberadddetail','{\"GET\":{\"cid\":\"1112223\",\"_\":\"1420114932518\"}}',1,'admin','127.0.0.1','2015-01-01 20:22:12'),(119,'MemberDetail','detaillist','{\"GET\":{\"mid\":\"38\"},\"POST\":[]}',1,'admin','127.0.0.1','2015-01-01 20:22:12'),(120,'Member','memberadddetail','{\"GET\":[],\"POST\":{\"detail\":{\"mid\":\"38\",\"pay\":\"-100\"}}}',1,'admin','127.0.0.1','2015-01-01 20:22:41'),(121,'Member','memberadddetail','{\"GET\":{\"cid\":\"1112223\",\"_\":\"1420114961681\"}}',1,'admin','127.0.0.1','2015-01-01 20:22:41'),(122,'MemberDetail','detaillist','{\"GET\":{\"mid\":\"38\"},\"POST\":[]}',1,'admin','127.0.0.1','2015-01-01 20:22:41'),(123,'Member','memberadddetail','{\"GET\":[],\"POST\":{\"detail\":{\"mid\":\"38\",\"pay\":\"-100\"}}}',1,'admin','127.0.0.1','2015-01-01 20:23:51'),(124,'Member','memberadddetail','{\"GET\":{\"cid\":\"1112223\",\"_\":\"1420115031542\"}}',1,'admin','127.0.0.1','2015-01-01 20:23:51'),(125,'MemberDetail','detaillist','{\"GET\":{\"mid\":\"38\"},\"POST\":[]}',1,'admin','127.0.0.1','2015-01-01 20:23:51'),(126,'Index','index','{\"GET\":[]}',1,'admin','127.0.0.1','2015-01-01 20:28:55'),(127,'Cost','costlist','{\"GET\":{\"menuid\":\"43\",\"_\":\"1420115337770\"}}',1,'admin','127.0.0.1','2015-01-01 20:28:57'),(128,'Cost','costlist','{\"GET\":{\"grid\":\"treegrid\"},\"POST\":{\"page\":\"1\",\"rows\":\"20\"}}',1,'admin','127.0.0.1','2015-01-01 20:28:57'),(129,'Index','index','{\"GET\":[]}',1,'admin','127.0.0.1','2015-01-01 20:29:06'),(130,'Cost','costlist','{\"GET\":{\"menuid\":\"43\",\"_\":\"1420115348905\"}}',1,'admin','127.0.0.1','2015-01-01 20:29:08'),(131,'Cost','costlist','{\"GET\":{\"grid\":\"treegrid\"},\"POST\":{\"page\":\"1\",\"rows\":\"20\"}}',1,'admin','127.0.0.1','2015-01-01 20:29:09'),(132,'Index','index','{\"GET\":[]}',1,'admin','127.0.0.1','2015-01-01 20:29:23'),(133,'Member','memberlist','{\"GET\":{\"menuid\":\"44\",\"_\":\"1420115365683\"}}',1,'admin','127.0.0.1','2015-01-01 20:29:25'),(134,'Member','memberlist','{\"GET\":{\"grid\":\"treegrid\"},\"POST\":{\"page\":\"1\",\"rows\":\"20\"}}',1,'admin','127.0.0.1','2015-01-01 20:29:25'),(135,'Member','memberadddetail','{\"GET\":{\"cid\":\"1112223\",\"_\":\"1420115367755\"}}',1,'admin','127.0.0.1','2015-01-01 20:29:27'),(136,'MemberDetail','detaillist','{\"GET\":{\"mid\":\"38\"},\"POST\":[]}',1,'admin','127.0.0.1','2015-01-01 20:29:27'),(137,'Member','memberpay','{\"GET\":{\"cid\":\"1112223\",\"_\":\"1420116274567\"}}',1,'admin','127.0.0.1','2015-01-01 20:44:34'),(138,'Member','memberadddetail','{\"GET\":{\"cid\":\"1112223\",\"_\":\"1420116284395\"}}',1,'admin','127.0.0.1','2015-01-01 20:44:44'),(139,'MemberDetail','detaillist','{\"GET\":{\"mid\":\"38\"},\"POST\":[]}',1,'admin','127.0.0.1','2015-01-01 20:44:44'),(140,'Member','memberpay','{\"GET\":{\"cid\":\"1112223\",\"_\":\"1420116385619\"}}',1,'admin','127.0.0.1','2015-01-01 20:46:25'),(141,'Member','memberadddetail','{\"GET\":{\"cid\":\"1112223\",\"_\":\"1420116393392\"}}',1,'admin','127.0.0.1','2015-01-01 20:46:33'),(142,'MemberDetail','detaillist','{\"GET\":{\"mid\":\"38\"},\"POST\":[]}',1,'admin','127.0.0.1','2015-01-01 20:46:33'),(143,'Member','memberpay','{\"GET\":{\"cid\":\"1112223\",\"_\":\"1420116404399\"}}',1,'admin','127.0.0.1','2015-01-01 20:46:44'),(144,'Member','memberadddetail','{\"GET\":{\"cid\":\"1112223\",\"_\":\"1420116412665\"}}',1,'admin','127.0.0.1','2015-01-01 20:46:52'),(145,'MemberDetail','detaillist','{\"GET\":{\"mid\":\"38\"},\"POST\":[]}',1,'admin','127.0.0.1','2015-01-01 20:46:52'),(146,'Member','memberpay','{\"GET\":{\"cid\":\"1112223\",\"_\":\"1420116422325\"}}',1,'admin','127.0.0.1','2015-01-01 20:47:02'),(147,'Member','memberadddetail','{\"GET\":{\"cid\":\"1112223\",\"_\":\"1420116425471\"}}',1,'admin','127.0.0.1','2015-01-01 20:47:05'),(148,'MemberDetail','detaillist','{\"GET\":{\"mid\":\"38\"},\"POST\":[]}',1,'admin','127.0.0.1','2015-01-01 20:47:05'),(149,'Member','memberadddetail','{\"GET\":{\"cid\":\"11111111\",\"_\":\"1420116599144\"}}',1,'admin','127.0.0.1','2015-01-01 20:49:59'),(150,'MemberDetail','detaillist','{\"GET\":{\"mid\":\"36\"},\"POST\":[]}',1,'admin','127.0.0.1','2015-01-01 20:49:59'),(151,'Member','memberpay','{\"GET\":{\"cid\":\"11111111\",\"_\":\"1420116993870\"}}',1,'admin','127.0.0.1','2015-01-01 20:56:33'),(152,'Member','memberpay','{\"GET\":[],\"POST\":{\"detail\":{\"mid\":\"36\",\"pay\":\"10\"}}}',1,'admin','127.0.0.1','2015-01-01 20:56:38'),(153,'Member','memberpay','{\"GET\":{\"cid\":\"11111111\",\"_\":\"1420116998650\"}}',1,'admin','127.0.0.1','2015-01-01 20:56:38'),(154,'Member','memberadddetail','{\"GET\":{\"cid\":\"11111111\",\"_\":\"1420117002636\"}}',1,'admin','127.0.0.1','2015-01-01 20:56:42'),(155,'MemberDetail','detaillist','{\"GET\":{\"mid\":\"36\"},\"POST\":[]}',1,'admin','127.0.0.1','2015-01-01 20:56:42'),(156,'Index','index','{\"GET\":[]}',1,'admin','127.0.0.1','2015-01-01 20:57:11'),(157,'Cost','costlist','{\"GET\":{\"menuid\":\"43\",\"_\":\"1420117033585\"}}',1,'admin','127.0.0.1','2015-01-01 20:57:13'),(158,'Cost','costlist','{\"GET\":{\"grid\":\"treegrid\"},\"POST\":{\"page\":\"1\",\"rows\":\"20\"}}',1,'admin','127.0.0.1','2015-01-01 20:57:13'),(159,'Member','memberlist','{\"GET\":{\"menuid\":\"44\",\"_\":\"1420117034761\"}}',1,'admin','127.0.0.1','2015-01-01 20:57:14'),(160,'Member','memberlist','{\"GET\":{\"grid\":\"treegrid\"},\"POST\":{\"page\":\"1\",\"rows\":\"20\"}}',1,'admin','127.0.0.1','2015-01-01 20:57:14'),(161,'Member','memberadddetail','{\"GET\":{\"cid\":\"11111111\",\"_\":\"1420117038416\"}}',1,'admin','127.0.0.1','2015-01-01 20:57:18'),(162,'MemberDetail','detaillist','{\"GET\":{\"mid\":\"36\"},\"POST\":[]}',1,'admin','127.0.0.1','2015-01-01 20:57:18'),(163,'Index','index','{\"GET\":[]}',1,'admin','127.0.0.1','2015-01-01 20:58:24'),(164,'Cost','costlist','{\"GET\":{\"menuid\":\"43\",\"_\":\"1420117106693\"}}',1,'admin','127.0.0.1','2015-01-01 20:58:26'),(165,'Cost','costlist','{\"GET\":{\"grid\":\"treegrid\"},\"POST\":{\"page\":\"1\",\"rows\":\"20\"}}',1,'admin','127.0.0.1','2015-01-01 20:58:26'),(166,'Member','memberlist','{\"GET\":{\"menuid\":\"44\",\"_\":\"1420117107928\"}}',1,'admin','127.0.0.1','2015-01-01 20:58:27'),(167,'Member','memberlist','{\"GET\":{\"grid\":\"treegrid\"},\"POST\":{\"page\":\"1\",\"rows\":\"20\"}}',1,'admin','127.0.0.1','2015-01-01 20:58:28'),(168,'Member','memberadddetail','{\"GET\":{\"cid\":\"11111111\",\"_\":\"1420117109904\"}}',1,'admin','127.0.0.1','2015-01-01 20:58:29'),(169,'MemberDetail','detaillist','{\"GET\":{\"mid\":\"36\"},\"POST\":[]}',1,'admin','127.0.0.1','2015-01-01 20:58:30'),(170,'Member','memberpay','{\"GET\":{\"cid\":\"11111111\",\"_\":\"1420117127854\"}}',1,'admin','127.0.0.1','2015-01-01 20:58:47'),(171,'Member','memberpay','{\"GET\":[],\"POST\":{\"detail\":{\"mid\":\"36\",\"pay\":\"10\"}}}',1,'admin','127.0.0.1','2015-01-01 20:58:51'),(172,'Member','memberpay','{\"GET\":{\"cid\":\"11111111\",\"_\":\"1420117131900\"}}',1,'admin','127.0.0.1','2015-01-01 20:58:51'),(173,'Member','memberadddetail','{\"GET\":{\"cid\":\"11111111\",\"_\":\"1420117135061\"}}',1,'admin','127.0.0.1','2015-01-01 20:58:55'),(174,'MemberDetail','detaillist','{\"GET\":{\"mid\":\"36\"},\"POST\":[]}',1,'admin','127.0.0.1','2015-01-01 20:58:55'),(175,'Member','memberpay','{\"GET\":{\"cid\":\"11111111\",\"_\":\"1420117183719\"}}',1,'admin','127.0.0.1','2015-01-01 20:59:44'),(176,'Member','memberpay','{\"GET\":[],\"POST\":{\"detail\":{\"mid\":\"36\",\"pay\":\"10\"}}}',1,'admin','127.0.0.1','2015-01-01 20:59:47'),(177,'Member','memberpay','{\"GET\":{\"cid\":\"11111111\",\"_\":\"1420117187427\"}}',1,'admin','127.0.0.1','2015-01-01 20:59:47'),(178,'Member','memberadddetail','{\"GET\":{\"cid\":\"11111111\",\"_\":\"1420117190456\"}}',1,'admin','127.0.0.1','2015-01-01 20:59:50'),(179,'MemberDetail','detaillist','{\"GET\":{\"mid\":\"36\"},\"POST\":[]}',1,'admin','127.0.0.1','2015-01-01 20:59:50'),(180,'Member','memberpay','{\"GET\":{\"cid\":\"1112223\",\"_\":\"1420117209165\"}}',1,'admin','127.0.0.1','2015-01-01 21:00:09'),(181,'Member','memberadddetail','{\"GET\":{\"cid\":\"1112223\",\"_\":\"1420117212289\"}}',1,'admin','127.0.0.1','2015-01-01 21:00:12'),(182,'MemberDetail','detaillist','{\"GET\":{\"mid\":\"38\"},\"POST\":[]}',1,'admin','127.0.0.1','2015-01-01 21:00:12'),(183,'Member','memberadddetail','{\"GET\":{\"cid\":\"2222\",\"_\":\"1420117218091\"}}',1,'admin','127.0.0.1','2015-01-01 21:00:18'),(184,'MemberDetail','detaillist','{\"GET\":{\"mid\":\"26\"},\"POST\":[]}',1,'admin','127.0.0.1','2015-01-01 21:00:18'),(185,'Member','memberadddetail','{\"GET\":{\"cid\":\"2222\",\"_\":\"1420117221635\"}}',1,'admin','127.0.0.1','2015-01-01 21:00:21'),(186,'MemberDetail','detaillist','{\"GET\":{\"mid\":\"26\"},\"POST\":[]}',1,'admin','127.0.0.1','2015-01-01 21:00:21'),(187,'Member','memberpay','{\"GET\":{\"cid\":\"2222\",\"_\":\"1420117225944\"}}',1,'admin','127.0.0.1','2015-01-01 21:00:25'),(188,'Member','memberpay','{\"GET\":[],\"POST\":{\"detail\":{\"mid\":\"26\",\"pay\":\"100\"}}}',1,'admin','127.0.0.1','2015-01-01 21:00:29'),(189,'Member','memberpay','{\"GET\":{\"cid\":\"2222\",\"_\":\"1420117229814\"}}',1,'admin','127.0.0.1','2015-01-01 21:00:29'),(190,'Member','memberadddetail','{\"GET\":{\"cid\":\"2222\",\"_\":\"1420117232954\"}}',1,'admin','127.0.0.1','2015-01-01 21:00:32'),(191,'MemberDetail','detaillist','{\"GET\":{\"mid\":\"26\"},\"POST\":[]}',1,'admin','127.0.0.1','2015-01-01 21:00:33'),(192,'Member','memberadddetail','{\"GET\":[],\"POST\":{\"detail\":{\"mid\":\"26\",\"pay\":\"10\"}}}',1,'admin','127.0.0.1','2015-01-01 21:00:40'),(193,'Member','memberadddetail','{\"GET\":{\"cid\":\"2222\",\"_\":\"1420117241141\"}}',1,'admin','127.0.0.1','2015-01-01 21:00:41'),(194,'MemberDetail','detaillist','{\"GET\":{\"mid\":\"26\"},\"POST\":[]}',1,'admin','127.0.0.1','2015-01-01 21:00:41'),(195,'Member','memberadddetail','{\"GET\":{\"cid\":\"222222\",\"_\":\"1420117268358\"}}',1,'admin','127.0.0.1','2015-01-01 21:01:08'),(196,'MemberDetail','detaillist','{\"GET\":{\"mid\":\"28\"},\"POST\":[]}',1,'admin','127.0.0.1','2015-01-01 21:01:08'),(197,'Member','memberadd','{\"GET\":{\"parentid\":\"0\",\"_\":\"1420117286350\"}}',1,'admin','127.0.0.1','2015-01-01 21:01:26'),(198,'Member','memberadddetail','{\"GET\":{\"cid\":\"222222\",\"_\":\"1420122550017\"}}',1,'admin','127.0.0.1','2015-01-01 22:29:11'),(199,'MemberDetail','detaillist','{\"GET\":{\"mid\":\"28\"},\"POST\":[]}',1,'admin','127.0.0.1','2015-01-01 22:29:12'),(200,'Member','memberpay','{\"GET\":{\"cid\":\"222222\",\"_\":\"1420122555016\"}}',1,'admin','127.0.0.1','2015-01-01 22:29:15'),(201,'Member','memberpay','{\"GET\":[],\"POST\":{\"detail\":{\"mid\":\"28\",\"pay\":\"100\"}}}',1,'admin','127.0.0.1','2015-01-01 22:29:20'),(202,'Member','memberpay','{\"GET\":{\"cid\":\"222222\",\"_\":\"1420122560807\"}}',1,'admin','127.0.0.1','2015-01-01 22:29:20'),(203,'System','loglist','{\"GET\":{\"menuid\":\"15\",\"_\":\"1420123040130\"}}',1,'admin','127.0.0.1','2015-01-01 22:37:20'),(204,'System','loglist','{\"GET\":{\"grid\":\"datagrid\"},\"POST\":{\"page\":\"1\",\"rows\":\"20\"}}',1,'admin','127.0.0.1','2015-01-01 22:37:20'),(205,'Index','index','{\"GET\":[]}',1,'admin','127.0.0.1','2015-01-02 15:39:38'),(206,'System','loglist','{\"GET\":{\"menuid\":\"15\",\"_\":\"1420184382760\"}}',1,'admin','127.0.0.1','2015-01-02 15:39:42'),(207,'System','loglist','{\"GET\":{\"grid\":\"datagrid\"},\"POST\":{\"page\":\"1\",\"rows\":\"20\"}}',1,'admin','127.0.0.1','2015-01-02 15:39:43'),(208,'Cost','costlist','{\"GET\":{\"menuid\":\"43\",\"_\":\"1420184385335\"}}',1,'admin','127.0.0.1','2015-01-02 15:39:45'),(209,'Cost','costlist','{\"GET\":{\"grid\":\"treegrid\"},\"POST\":{\"page\":\"1\",\"rows\":\"20\"}}',1,'admin','127.0.0.1','2015-01-02 15:39:45'),(210,'Member','memberlist','{\"GET\":{\"menuid\":\"44\",\"_\":\"1420184387444\"}}',1,'admin','127.0.0.1','2015-01-02 15:39:47'),(211,'Member','memberlist','{\"GET\":{\"grid\":\"treegrid\"},\"POST\":{\"page\":\"1\",\"rows\":\"20\"}}',1,'admin','127.0.0.1','2015-01-02 15:39:47'),(212,'Member','memberadddetail','{\"GET\":{\"cid\":\"00006\",\"_\":\"1420184390126\"}}',1,'admin','127.0.0.1','2015-01-02 15:39:50'),(213,'MemberDetail','detaillist','{\"GET\":{\"mid\":\"37\"},\"POST\":[]}',1,'admin','127.0.0.1','2015-01-02 15:39:50'),(214,'Index','index','{\"GET\":[]}',1,'admin','127.0.0.1','2015-01-02 15:41:42'),(215,'Cost','costlist','{\"GET\":{\"menuid\":\"43\",\"_\":\"1420184505293\"}}',1,'admin','127.0.0.1','2015-01-02 15:41:45'),(216,'Cost','costlist','{\"GET\":{\"grid\":\"treegrid\"},\"POST\":{\"page\":\"1\",\"rows\":\"20\"}}',1,'admin','127.0.0.1','2015-01-02 15:41:45'),(217,'Member','memberlist','{\"GET\":{\"menuid\":\"44\",\"_\":\"1420184505873\"}}',1,'admin','127.0.0.1','2015-01-02 15:41:45'),(218,'Member','memberlist','{\"GET\":{\"grid\":\"treegrid\"},\"POST\":{\"page\":\"1\",\"rows\":\"20\"}}',1,'admin','127.0.0.1','2015-01-02 15:41:46'),(219,'Member','memberlist','{\"GET\":{\"grid\":\"treegrid\"},\"POST\":{\"search\":{\"cid\":\"6\",\"phone\":\"\",\"name\":\"\"},\"page\":\"1\",\"rows\":\"20\"}}',1,'admin','127.0.0.1','2015-01-02 15:41:52'),(220,'Member','memberadddetail','{\"GET\":{\"cid\":\"6\",\"_\":\"1420184515191\"}}',1,'admin','127.0.0.1','2015-01-02 15:41:55'),(221,'MemberDetail','detaillist','{\"GET\":{\"mid\":\"16\"},\"POST\":[]}',1,'admin','127.0.0.1','2015-01-02 15:41:55'),(222,'Index','index','{\"GET\":[]}',1,'admin','127.0.0.1','2015-01-02 15:45:22'),(223,'Member','memberlist','{\"GET\":{\"menuid\":\"44\",\"_\":\"1420184724851\"}}',1,'admin','127.0.0.1','2015-01-02 15:45:24'),(224,'Member','memberlist','{\"GET\":{\"grid\":\"treegrid\"},\"POST\":{\"page\":\"1\",\"rows\":\"20\"}}',1,'admin','127.0.0.1','2015-01-02 15:45:25'),(225,'Index','index','{\"GET\":[]}',1,'admin','127.0.0.1','2015-01-02 15:46:07'),(226,'Member','memberlist','{\"GET\":{\"menuid\":\"44\",\"_\":\"1420184770299\"}}',1,'admin','127.0.0.1','2015-01-02 15:46:10'),(227,'Member','memberlist','{\"GET\":{\"grid\":\"treegrid\"},\"POST\":{\"page\":\"1\",\"rows\":\"20\"}}',1,'admin','127.0.0.1','2015-01-02 15:46:10'),(228,'Index','index','{\"GET\":[]}',1,'admin','127.0.0.1','2015-01-02 15:50:20'),(229,'Member','memberlist','{\"GET\":{\"menuid\":\"44\",\"_\":\"1420185022163\"}}',1,'admin','127.0.0.1','2015-01-02 15:50:22'),(230,'Member','memberlist','{\"GET\":{\"grid\":\"treegrid\"},\"POST\":{\"page\":\"1\",\"rows\":\"20\"}}',1,'admin','127.0.0.1','2015-01-02 15:50:22'),(231,'Member','memberadddetail','{\"GET\":{\"cid\":\"1112223\",\"_\":\"1420185023601\"}}',1,'admin','127.0.0.1','2015-01-02 15:50:23'),(232,'MemberDetail','detaillist','{\"GET\":{\"mid\":\"38\"},\"POST\":[]}',1,'admin','127.0.0.1','2015-01-02 15:50:23'),(233,'Member','memberadddetail','{\"GET\":[],\"POST\":{\"detail\":{\"mid\":\"38\",\"pay\":\"1\"}}}',1,'admin','127.0.0.1','2015-01-02 15:50:26'),(234,'Member','memberadddetail','{\"GET\":{\"cid\":\"1112223\",\"_\":\"1420185026218\"}}',1,'admin','127.0.0.1','2015-01-02 15:50:26'),(235,'MemberDetail','detaillist','{\"GET\":{\"mid\":\"38\"},\"POST\":[]}',1,'admin','127.0.0.1','2015-01-02 15:50:26'),(236,'Index','index','{\"GET\":[]}',1,'admin','127.0.0.1','2015-01-02 15:52:51'),(237,'Member','memberlist','{\"GET\":{\"menuid\":\"44\",\"_\":\"1420185174512\"}}',1,'admin','127.0.0.1','2015-01-02 15:52:54'),(238,'Member','memberlist','{\"GET\":{\"grid\":\"treegrid\"},\"POST\":{\"page\":\"1\",\"rows\":\"20\"}}',1,'admin','127.0.0.1','2015-01-02 15:52:54'),(239,'Member','memberadddetail','{\"GET\":{\"cid\":\"1112223\",\"_\":\"1420185175878\"}}',1,'admin','127.0.0.1','2015-01-02 15:52:55'),(240,'MemberDetail','detaillist','{\"GET\":{\"mid\":\"38\"},\"POST\":[]}',1,'admin','127.0.0.1','2015-01-02 15:52:56'),(241,'Member','memberadddetail','{\"GET\":[],\"POST\":{\"detail\":{\"mid\":\"38\",\"pay\":\"100\"}}}',1,'admin','127.0.0.1','2015-01-02 15:52:59'),(242,'Member','memberadddetail','{\"GET\":{\"cid\":\"1112223\",\"_\":\"1420185179859\"}}',1,'admin','127.0.0.1','2015-01-02 15:52:59'),(243,'MemberDetail','detaillist','{\"GET\":{\"mid\":\"38\"},\"POST\":[]}',1,'admin','127.0.0.1','2015-01-02 15:52:59'),(244,'Index','index','{\"GET\":[]}',1,'admin','127.0.0.1','2015-01-02 15:53:56'),(245,'Member','memberlist','{\"GET\":{\"menuid\":\"44\",\"_\":\"1420185239166\"}}',1,'admin','127.0.0.1','2015-01-02 15:53:59'),(246,'Member','memberlist','{\"GET\":{\"grid\":\"treegrid\"},\"POST\":{\"page\":\"1\",\"rows\":\"20\"}}',1,'admin','127.0.0.1','2015-01-02 15:53:59'),(247,'Member','memberadddetail','{\"GET\":{\"cid\":\"10000\",\"_\":\"1420185241083\"}}',1,'admin','127.0.0.1','2015-01-02 15:54:01'),(248,'MemberDetail','detaillist','{\"GET\":{\"mid\":\"34\"},\"POST\":[]}',1,'admin','127.0.0.1','2015-01-02 15:54:01'),(249,'Member','memberadddetail','{\"GET\":[],\"POST\":{\"detail\":{\"mid\":\"34\",\"pay\":\"0\"}}}',1,'admin','127.0.0.1','2015-01-02 15:54:03'),(250,'Member','memberadddetail','{\"GET\":{\"cid\":\"10000\",\"_\":\"1420185243759\"}}',1,'admin','127.0.0.1','2015-01-02 15:54:03'),(251,'MemberDetail','detaillist','{\"GET\":{\"mid\":\"34\"},\"POST\":[]}',1,'admin','127.0.0.1','2015-01-02 15:54:03'),(252,'Index','index','{\"GET\":[]}',1,'admin','127.0.0.1','2015-01-02 15:54:09'),(253,'Member','memberlist','{\"GET\":{\"menuid\":\"44\",\"_\":\"1420185251507\"}}',1,'admin','127.0.0.1','2015-01-02 15:54:11'),(254,'Member','memberlist','{\"GET\":{\"grid\":\"treegrid\"},\"POST\":{\"page\":\"1\",\"rows\":\"20\"}}',1,'admin','127.0.0.1','2015-01-02 15:54:11'),(255,'Member','memberlist','{\"GET\":{\"grid\":\"treegrid\"},\"POST\":{\"page\":\"1\",\"rows\":\"20\"}}',1,'admin','127.0.0.1','2015-01-02 15:54:23'),(256,'Member','memberlist','{\"GET\":{\"grid\":\"treegrid\"},\"POST\":{\"page\":\"1\",\"rows\":\"20\"}}',1,'admin','127.0.0.1','2015-01-02 15:54:24'),(257,'Member','memberlist','{\"GET\":{\"grid\":\"treegrid\"},\"POST\":{\"page\":\"1\",\"rows\":\"20\"}}',1,'admin','127.0.0.1','2015-01-02 15:54:45'),(258,'Member','memberlist','{\"GET\":{\"grid\":\"treegrid\"},\"POST\":{\"page\":\"1\",\"rows\":\"20\"}}',1,'admin','127.0.0.1','2015-01-02 15:54:47'),(259,'Member','memberlist','{\"GET\":{\"grid\":\"treegrid\"},\"POST\":{\"page\":\"1\",\"rows\":\"20\"}}',1,'admin','127.0.0.1','2015-01-02 15:54:48'),(260,'Member','memberlist','{\"GET\":{\"grid\":\"treegrid\"},\"POST\":{\"page\":\"1\",\"rows\":\"20\"}}',1,'admin','127.0.0.1','2015-01-02 15:54:54'),(261,'Member','memberadddetail','{\"GET\":{\"cid\":\"11111\",\"_\":\"1420185297507\"}}',1,'admin','127.0.0.1','2015-01-02 15:54:57'),(262,'MemberDetail','detaillist','{\"GET\":{\"mid\":\"27\"},\"POST\":[]}',1,'admin','127.0.0.1','2015-01-02 15:54:57'),(263,'Member','memberadddetail','{\"GET\":[],\"POST\":{\"detail\":{\"mid\":\"27\",\"pay\":\"0\"}}}',1,'admin','127.0.0.1','2015-01-02 15:54:58'),(264,'Member','memberadddetail','{\"GET\":{\"cid\":\"11111\",\"_\":\"1420185298966\"}}',1,'admin','127.0.0.1','2015-01-02 15:54:59'),(265,'MemberDetail','detaillist','{\"GET\":{\"mid\":\"27\"},\"POST\":[]}',1,'admin','127.0.0.1','2015-01-02 15:54:59'),(266,'Member','memberlist','{\"GET\":{\"grid\":\"treegrid\"},\"POST\":{\"page\":\"1\",\"rows\":\"20\"}}',1,'admin','127.0.0.1','2015-01-02 15:55:02'),(267,'Index','index','{\"GET\":[]}',1,'admin','127.0.0.1','2015-01-02 15:55:42'),(268,'Member','memberlist','{\"GET\":{\"menuid\":\"44\",\"_\":\"1420185346308\"}}',1,'admin','127.0.0.1','2015-01-02 15:55:46'),(269,'Member','memberlist','{\"GET\":{\"grid\":\"treegrid\"},\"POST\":{\"page\":\"1\",\"rows\":\"20\"}}',1,'admin','127.0.0.1','2015-01-02 15:55:46'),(270,'Member','memberlist','{\"GET\":{\"grid\":\"treegrid\"},\"POST\":{\"page\":\"1\",\"rows\":\"20\"}}',1,'admin','127.0.0.1','2015-01-02 15:55:49'),(271,'Member','memberlist','{\"GET\":{\"grid\":\"treegrid\"},\"POST\":{\"page\":\"1\",\"rows\":\"20\"}}',1,'admin','127.0.0.1','2015-01-02 15:55:50'),(272,'Member','memberlist','{\"GET\":{\"grid\":\"treegrid\"},\"POST\":{\"page\":\"1\",\"rows\":\"20\"}}',1,'admin','127.0.0.1','2015-01-02 15:55:51'),(273,'Member','memberlist','{\"GET\":{\"grid\":\"treegrid\"},\"POST\":{\"page\":\"1\",\"rows\":\"20\"}}',1,'admin','127.0.0.1','2015-01-02 15:55:51'),(274,'Member','memberlist','{\"GET\":{\"grid\":\"treegrid\"},\"POST\":{\"page\":\"1\",\"rows\":\"20\"}}',1,'admin','127.0.0.1','2015-01-02 15:55:52'),(275,'Member','memberadddetail','{\"GET\":{\"cid\":\"11111111\",\"_\":\"1420185362729\"}}',1,'admin','127.0.0.1','2015-01-02 15:56:02'),(276,'MemberDetail','detaillist','{\"GET\":{\"mid\":\"36\"},\"POST\":[]}',1,'admin','127.0.0.1','2015-01-02 15:56:02'),(277,'Member','memberadddetail','{\"GET\":[],\"POST\":{\"detail\":{\"mid\":\"36\",\"pay\":\"0\"}}}',1,'admin','127.0.0.1','2015-01-02 15:56:04'),(278,'Member','memberadddetail','{\"GET\":{\"cid\":\"11111111\",\"_\":\"1420185364186\"}}',1,'admin','127.0.0.1','2015-01-02 15:56:04'),(279,'MemberDetail','detaillist','{\"GET\":{\"mid\":\"36\"},\"POST\":[]}',1,'admin','127.0.0.1','2015-01-02 15:56:04'),(280,'Member','memberlist','{\"GET\":{\"grid\":\"treegrid\"},\"POST\":{\"page\":\"1\",\"rows\":\"20\"}}',1,'admin','127.0.0.1','2015-01-02 15:56:07'),(281,'Member','memberlist','{\"GET\":{\"grid\":\"treegrid\"},\"POST\":{\"search\":{\"cid\":\"1\",\"phone\":\"\",\"name\":\"\"},\"page\":\"1\",\"rows\":\"20\"}}',1,'admin','127.0.0.1','2015-01-02 15:56:36'),(282,'Member','memberadddetail','{\"GET\":{\"cid\":\"10000\",\"_\":\"1420185583571\"}}',1,'admin','127.0.0.1','2015-01-02 15:59:43'),(283,'MemberDetail','detaillist','{\"GET\":{\"mid\":\"34\"},\"POST\":[]}',1,'admin','127.0.0.1','2015-01-02 15:59:43'),(284,'Member','memberadddetail','{\"GET\":[],\"POST\":{\"detail\":{\"mid\":\"34\",\"pay\":\"0\"}}}',1,'admin','127.0.0.1','2015-01-02 15:59:47'),(285,'Member','memberadddetail','{\"GET\":{\"cid\":\"10000\",\"_\":\"1420185587943\"}}',1,'admin','127.0.0.1','2015-01-02 15:59:47'),(286,'MemberDetail','detaillist','{\"GET\":{\"mid\":\"34\"},\"POST\":[]}',1,'admin','127.0.0.1','2015-01-02 15:59:48'),(287,'Member','memberlist','{\"GET\":{\"grid\":\"treegrid\"},\"POST\":{\"search\":{\"cid\":\"1\",\"phone\":\"\",\"name\":\"\"},\"page\":\"1\",\"rows\":\"20\"}}',1,'admin','127.0.0.1','2015-01-02 15:59:51'),(288,'Member','memberadddetail','{\"GET\":{\"cid\":\"10000\",\"_\":\"1420185604451\"}}',1,'admin','127.0.0.1','2015-01-02 16:00:04'),(289,'MemberDetail','detaillist','{\"GET\":{\"mid\":\"34\"},\"POST\":[]}',1,'admin','127.0.0.1','2015-01-02 16:00:04'),(290,'Member','memberadddetail','{\"GET\":{\"cid\":\"100000\",\"_\":\"1420185616331\"}}',1,'admin','127.0.0.1','2015-01-02 16:00:16'),(291,'MemberDetail','detaillist','{\"GET\":{\"mid\":\"35\"},\"POST\":[]}',1,'admin','127.0.0.1','2015-01-02 16:00:16'),(292,'Member','memberpay','{\"GET\":{\"cid\":\"11111\",\"_\":\"1420186057233\"}}',1,'admin','127.0.0.1','2015-01-02 16:07:37'),(293,'Member','memberadddetail','{\"GET\":{\"cid\":\"11111\",\"_\":\"1420186061413\"}}',1,'admin','127.0.0.1','2015-01-02 16:07:41'),(294,'MemberDetail','detaillist','{\"GET\":{\"mid\":\"27\"},\"POST\":[]}',1,'admin','127.0.0.1','2015-01-02 16:07:41'),(295,'Member','memberadddetail','{\"GET\":{\"cid\":\"10000\",\"_\":\"1420194228669\"}}',1,'admin','127.0.0.1','2015-01-02 18:23:48'),(296,'MemberDetail','detaillist','{\"GET\":{\"mid\":\"34\"},\"POST\":[]}',1,'admin','127.0.0.1','2015-01-02 18:23:49'),(297,'Index','index','{\"GET\":[]}',1,'admin','127.0.0.1','2015-01-02 21:15:49'),(298,'Cost','costlist','{\"GET\":{\"menuid\":\"43\",\"_\":\"1420204553452\"}}',1,'admin','127.0.0.1','2015-01-02 21:15:53'),(299,'Cost','costlist','{\"GET\":{\"grid\":\"treegrid\"},\"POST\":{\"page\":\"1\",\"rows\":\"20\"}}',1,'admin','127.0.0.1','2015-01-02 21:15:53'),(300,'Member','memberlist','{\"GET\":{\"menuid\":\"44\",\"_\":\"1420204554538\"}}',1,'admin','127.0.0.1','2015-01-02 21:15:54'),(301,'Member','memberlist','{\"GET\":{\"grid\":\"treegrid\"},\"POST\":{\"page\":\"1\",\"rows\":\"20\"}}',1,'admin','127.0.0.1','2015-01-02 21:15:54'),(302,'Member','memberadddetail','{\"GET\":{\"cid\":\"11111\",\"_\":\"1420204557228\"}}',1,'admin','127.0.0.1','2015-01-02 21:15:57'),(303,'MemberDetail','detaillist','{\"GET\":{\"mid\":\"27\"},\"POST\":[]}',1,'admin','127.0.0.1','2015-01-02 21:15:57'),(304,'Member','memberadddetail','{\"GET\":{\"cid\":\"1112223\",\"_\":\"1420204562955\"}}',1,'admin','127.0.0.1','2015-01-02 21:16:02'),(305,'MemberDetail','detaillist','{\"GET\":{\"mid\":\"38\"},\"POST\":[]}',1,'admin','127.0.0.1','2015-01-02 21:16:03'),(306,'Member','memberadddetail','{\"GET\":{\"cid\":\"1111111\",\"_\":\"1420204567307\"}}',1,'admin','127.0.0.1','2015-01-02 21:16:07'),(307,'MemberDetail','detaillist','{\"GET\":{\"mid\":\"33\"},\"POST\":[]}',1,'admin','127.0.0.1','2015-01-02 21:16:07'),(308,'Member','memberadddetail','{\"GET\":{\"cid\":\"2312\",\"_\":\"1420204573703\"}}',1,'admin','127.0.0.1','2015-01-02 21:16:13'),(309,'MemberDetail','detaillist','{\"GET\":{\"mid\":\"32\"},\"POST\":[]}',1,'admin','127.0.0.1','2015-01-02 21:16:13'),(310,'Member','memberadddetail','{\"GET\":{\"cid\":\"1212\",\"_\":\"1420204576673\"}}',1,'admin','127.0.0.1','2015-01-02 21:16:16'),(311,'MemberDetail','detaillist','{\"GET\":{\"mid\":\"30\"},\"POST\":[]}',1,'admin','127.0.0.1','2015-01-02 21:16:16'),(312,'System','menulist','{\"GET\":{\"menuid\":\"16\",\"_\":\"1420265216430\"}}',1,'admin','127.0.0.1','2015-01-03 14:06:56'),(313,'System','menulist','{\"GET\":{\"grid\":\"treegrid\"},\"POST\":[]}',1,'admin','127.0.0.1','2015-01-03 14:06:56'),(314,'Member','memberlist','{\"GET\":{\"menuid\":\"44\",\"_\":\"1420265250838\"}}',1,'admin','127.0.0.1','2015-01-03 14:07:30'),(315,'Member','memberlist','{\"GET\":{\"grid\":\"treegrid\"},\"POST\":{\"page\":\"1\",\"rows\":\"20\"}}',1,'admin','127.0.0.1','2015-01-03 14:07:31'),(316,'Member','memberpay','{\"GET\":{\"cid\":\"10000\",\"_\":\"1420265255414\"}}',1,'admin','127.0.0.1','2015-01-03 14:07:35'),(317,'Member','memberadddetail','{\"GET\":{\"cid\":\"10000\",\"_\":\"1420266300391\"}}',1,'admin','127.0.0.1','2015-01-03 14:25:00'),(318,'MemberDetail','detaillist','{\"GET\":{\"mid\":\"34\"},\"POST\":[]}',1,'admin','127.0.0.1','2015-01-03 14:25:01'),(319,'Member','memberadddetail','{\"GET\":[],\"POST\":{\"detail\":{\"mid\":\"34\",\"pay\":\"1\"}}}',1,'admin','127.0.0.1','2015-01-03 14:25:09'),(320,'Member','memberadddetail','{\"GET\":{\"cid\":\"10000\",\"_\":\"1420266309680\"}}',1,'admin','127.0.0.1','2015-01-03 14:25:09'),(321,'MemberDetail','detaillist','{\"GET\":{\"mid\":\"34\"},\"POST\":[]}',1,'admin','127.0.0.1','2015-01-03 14:25:09'),(322,'Member','memberadddetail','{\"GET\":[],\"POST\":{\"detail\":{\"mid\":\"34\",\"pay\":\"11\"}}}',1,'admin','127.0.0.1','2015-01-03 14:25:44'),(323,'Member','memberadddetail','{\"GET\":{\"cid\":\"10000\",\"_\":\"1420266344578\"}}',1,'admin','127.0.0.1','2015-01-03 14:25:44'),(324,'MemberDetail','detaillist','{\"GET\":{\"mid\":\"34\"},\"POST\":[]}',1,'admin','127.0.0.1','2015-01-03 14:25:44'),(325,'Member','memberadddetail','{\"GET\":{\"cid\":\"10000\",\"_\":\"1420266349949\"}}',1,'admin','127.0.0.1','2015-01-03 14:25:50'),(326,'MemberDetail','detaillist','{\"GET\":{\"mid\":\"34\"},\"POST\":[]}',1,'admin','127.0.0.1','2015-01-03 14:25:50'),(327,'Member','memberadddetail','{\"GET\":[],\"POST\":{\"detail\":{\"mid\":\"34\",\"pay\":\"11\"}}}',1,'admin','127.0.0.1','2015-01-03 14:26:08'),(328,'Member','memberadddetail','{\"GET\":{\"cid\":\"10000\",\"_\":\"1420266368563\"}}',1,'admin','127.0.0.1','2015-01-03 14:26:08'),(329,'MemberDetail','detaillist','{\"GET\":{\"mid\":\"34\"},\"POST\":[]}',1,'admin','127.0.0.1','2015-01-03 14:26:08'),(330,'Member','memberadddetail','{\"GET\":[],\"POST\":{\"detail\":{\"mid\":\"34\",\"pay\":\"12\"}}}',1,'admin','127.0.0.1','2015-01-03 14:26:33'),(331,'Member','memberadddetail','{\"GET\":{\"cid\":\"10000\",\"_\":\"1420266393471\"}}',1,'admin','127.0.0.1','2015-01-03 14:26:33'),(332,'MemberDetail','detaillist','{\"GET\":{\"mid\":\"34\"},\"POST\":[]}',1,'admin','127.0.0.1','2015-01-03 14:26:33'),(333,'Index','index','{\"GET\":[]}',1,'admin','127.0.0.1','2015-01-03 14:27:19'),(334,'Cost','costlist','{\"GET\":{\"menuid\":\"43\",\"_\":\"1420266445299\"}}',1,'admin','127.0.0.1','2015-01-03 14:27:25'),(335,'Cost','costlist','{\"GET\":{\"grid\":\"treegrid\"},\"POST\":{\"page\":\"1\",\"rows\":\"20\"}}',1,'admin','127.0.0.1','2015-01-03 14:27:25'),(336,'Member','memberlist','{\"GET\":{\"menuid\":\"44\",\"_\":\"1420266445978\"}}',1,'admin','127.0.0.1','2015-01-03 14:27:25'),(337,'Member','memberlist','{\"GET\":{\"grid\":\"treegrid\"},\"POST\":{\"page\":\"1\",\"rows\":\"20\"}}',1,'admin','127.0.0.1','2015-01-03 14:27:26'),(338,'Cost','costlist','{\"GET\":{\"menuid\":\"43\",\"_\":\"1420266453055\"}}',1,'admin','127.0.0.1','2015-01-03 14:27:33'),(339,'Cost','costlist','{\"GET\":{\"grid\":\"treegrid\"},\"POST\":{\"page\":\"1\",\"rows\":\"20\"}}',1,'admin','127.0.0.1','2015-01-03 14:27:33'),(340,'Cost','costadd','{\"GET\":{\"parentid\":\"0\",\"_\":\"1420266454557\"}}',1,'admin','127.0.0.1','2015-01-03 14:27:34'),(341,'Member','memberlist','{\"GET\":{\"menuid\":\"44\",\"_\":\"1420266463962\"}}',1,'admin','127.0.0.1','2015-01-03 14:27:43'),(342,'Member','memberlist','{\"GET\":{\"grid\":\"treegrid\"},\"POST\":{\"page\":\"1\",\"rows\":\"20\"}}',1,'admin','127.0.0.1','2015-01-03 14:27:44'),(343,'Employee','employeelist','{\"GET\":{\"menuid\":\"50\",\"_\":\"1420266500448\"}}',1,'admin','127.0.0.1','2015-01-03 14:28:20'),(344,'Employee','employeelist','{\"GET\":{\"grid\":\"treegrid\"},\"POST\":{\"page\":\"1\",\"rows\":\"20\"}}',1,'admin','127.0.0.1','2015-01-03 14:28:20'),(345,'Member','memberlist','{\"GET\":{\"menuid\":\"44\",\"_\":\"1420266544963\"}}',1,'admin','127.0.0.1','2015-01-03 14:29:04'),(346,'Member','memberlist','{\"GET\":{\"grid\":\"treegrid\"},\"POST\":{\"page\":\"1\",\"rows\":\"20\"}}',1,'admin','127.0.0.1','2015-01-03 14:29:05'),(347,'Member','memberorder','{\"GET\":[],\"POST\":[]}',1,'admin','127.0.0.1','2015-01-03 14:29:13'),(348,'Member','memberlist','{\"GET\":{\"grid\":\"treegrid\"},\"POST\":{\"page\":\"1\",\"rows\":\"20\"}}',1,'admin','127.0.0.1','2015-01-03 14:29:28'),(349,'Member','memberadddetail','{\"GET\":{\"cid\":\"10000\",\"_\":\"1420266576487\"}}',1,'admin','127.0.0.1','2015-01-03 14:29:36'),(350,'MemberDetail','detaillist','{\"GET\":{\"mid\":\"34\"},\"POST\":[]}',1,'admin','127.0.0.1','2015-01-03 14:29:36'),(351,'Member','memberadddetail','{\"GET\":{\"cid\":\"2312\",\"_\":\"1420266588686\"}}',1,'admin','127.0.0.1','2015-01-03 14:29:48'),(352,'MemberDetail','detaillist','{\"GET\":{\"mid\":\"32\"},\"POST\":[]}',1,'admin','127.0.0.1','2015-01-03 14:29:48'),(353,'Member','memberadddetail','{\"GET\":[],\"POST\":{\"detail\":{\"mid\":\"32\",\"pay\":\"0\"}}}',1,'admin','127.0.0.1','2015-01-03 14:29:50'),(354,'Member','memberadddetail','{\"GET\":{\"cid\":\"2312\",\"_\":\"1420266590445\"}}',1,'admin','127.0.0.1','2015-01-03 14:29:50'),(355,'MemberDetail','detaillist','{\"GET\":{\"mid\":\"32\"},\"POST\":[]}',1,'admin','127.0.0.1','2015-01-03 14:29:50'),(356,'Member','memberlist','{\"GET\":{\"grid\":\"treegrid\"},\"POST\":{\"page\":\"1\",\"rows\":\"20\"}}',1,'admin','127.0.0.1','2015-01-03 14:29:54'),(357,'Member','memberadddetail','{\"GET\":{\"cid\":\"2312\",\"_\":\"1420266598019\"}}',1,'admin','127.0.0.1','2015-01-03 14:29:58'),(358,'MemberDetail','detaillist','{\"GET\":{\"mid\":\"32\"},\"POST\":[]}',1,'admin','127.0.0.1','2015-01-03 14:29:58'),(359,'Cost','costlist','{\"GET\":{\"menuid\":\"43\",\"_\":\"1420266630349\"}}',1,'admin','127.0.0.1','2015-01-03 14:30:30'),(360,'Cost','costlist','{\"GET\":{\"grid\":\"treegrid\"},\"POST\":{\"page\":\"1\",\"rows\":\"20\"}}',1,'admin','127.0.0.1','2015-01-03 14:30:30'),(361,'Cost','costlist','{\"GET\":{\"grid\":\"treegrid\"},\"POST\":{\"page\":\"1\",\"rows\":\"20\",\"sort\":\"pid\",\"order\":\"asc\"}}',1,'admin','127.0.0.1','2015-01-03 14:30:31'),(362,'Cost','costlist','{\"GET\":{\"grid\":\"treegrid\"},\"POST\":{\"page\":\"1\",\"rows\":\"20\",\"sort\":\"pid\",\"order\":\"desc\"}}',1,'admin','127.0.0.1','2015-01-03 14:30:32'),(363,'Cost','costlist','{\"GET\":{\"grid\":\"treegrid\"},\"POST\":{\"page\":\"1\",\"rows\":\"20\",\"sort\":\"eid\",\"order\":\"asc\"}}',1,'admin','127.0.0.1','2015-01-03 14:30:33'),(364,'Cost','costlist','{\"GET\":{\"grid\":\"treegrid\"},\"POST\":{\"page\":\"1\",\"rows\":\"20\",\"sort\":\"eid\",\"order\":\"desc\"}}',1,'admin','127.0.0.1','2015-01-03 14:30:34'),(365,'Cost','costlist','{\"GET\":{\"grid\":\"treegrid\"},\"POST\":{\"page\":\"1\",\"rows\":\"20\",\"sort\":\"aid\",\"order\":\"asc\"}}',1,'admin','127.0.0.1','2015-01-03 14:30:36'),(366,'Cost','costlist','{\"GET\":{\"grid\":\"treegrid\"},\"POST\":{\"page\":\"1\",\"rows\":\"20\",\"sort\":\"aid\",\"order\":\"desc\"}}',1,'admin','127.0.0.1','2015-01-03 14:30:37'),(367,'Member','memberlist','{\"GET\":{\"menuid\":\"44\",\"_\":\"1420266640531\"}}',1,'admin','127.0.0.1','2015-01-03 14:30:40'),(368,'Member','memberlist','{\"GET\":{\"grid\":\"treegrid\"},\"POST\":{\"page\":\"1\",\"rows\":\"20\"}}',1,'admin','127.0.0.1','2015-01-03 14:30:40'),(369,'Member','memberpay','{\"GET\":{\"cid\":\"2312\",\"_\":\"1420266813912\"}}',1,'admin','127.0.0.1','2015-01-03 14:33:33'),(370,'Member','memberpay','{\"GET\":[],\"POST\":{\"detail\":{\"mid\":\"32\",\"pay\":\"100\"}}}',1,'admin','127.0.0.1','2015-01-03 14:33:53'),(371,'Member','memberpay','{\"GET\":{\"cid\":\"2312\",\"_\":\"1420266833541\"}}',1,'admin','127.0.0.1','2015-01-03 14:33:53'),(372,'Member','memberadddetail','{\"GET\":{\"cid\":\"2312\",\"_\":\"1420266900317\"}}',1,'admin','127.0.0.1','2015-01-03 14:35:00'),(373,'MemberDetail','detaillist','{\"GET\":{\"mid\":\"32\"},\"POST\":[]}',1,'admin','127.0.0.1','2015-01-03 14:35:00'),(374,'Member','memberadd','{\"GET\":{\"parentid\":\"0\",\"_\":\"1420267108977\"}}',1,'admin','127.0.0.1','2015-01-03 14:38:29'),(375,'Cost','costlist','{\"GET\":{\"menuid\":\"43\",\"_\":\"1420274306440\"}}',1,'admin','127.0.0.1','2015-01-03 16:38:26'),(376,'Cost','costlist','{\"GET\":{\"grid\":\"treegrid\"},\"POST\":{\"page\":\"1\",\"rows\":\"20\"}}',1,'admin','127.0.0.1','2015-01-03 16:38:26'),(377,'Cost','costadd','{\"GET\":{\"parentid\":\"0\",\"_\":\"1420274307991\"}}',1,'admin','127.0.0.1','2015-01-03 16:38:28'),(378,'Cost','costadd','{\"GET\":{\"parentid\":\"0\",\"_\":\"1420274332505\"}}',1,'admin','127.0.0.1','2015-01-03 16:38:52'),(379,'Cost','costlist','{\"GET\":{\"grid\":\"treegrid\"},\"POST\":{\"page\":\"1\",\"rows\":\"20\"}}',1,'admin','127.0.0.1','2015-01-04 11:56:39'),(380,'Cost','costlist','{\"GET\":{\"grid\":\"treegrid\"},\"POST\":{\"page\":\"1\",\"rows\":\"20\"}}',1,'admin','127.0.0.1','2015-01-04 19:04:52'),(381,'Cost','costlist','{\"GET\":{\"grid\":\"treegrid\"},\"POST\":{\"page\":\"1\",\"rows\":\"20\"}}',1,'admin','127.0.0.1','2015-01-04 19:04:53'),(382,'Cost','costlist','{\"GET\":{\"grid\":\"treegrid\"},\"POST\":{\"page\":\"1\",\"rows\":\"20\"}}',1,'admin','127.0.0.1','2015-01-04 19:04:55'),(383,'Cost','costlist','{\"GET\":{\"grid\":\"treegrid\"},\"POST\":{\"page\":\"1\",\"rows\":\"20\"}}',1,'admin','127.0.0.1','2015-01-04 19:04:55'),(384,'Cost','costlist','{\"GET\":{\"grid\":\"treegrid\"},\"POST\":{\"page\":\"1\",\"rows\":\"20\"}}',1,'admin','127.0.0.1','2015-01-04 19:04:56'),(385,'Cost','costlist','{\"GET\":{\"grid\":\"treegrid\"},\"POST\":{\"page\":\"1\",\"rows\":\"20\"}}',1,'admin','127.0.0.1','2015-01-04 19:04:57'),(386,'Cost','costlist','{\"GET\":{\"grid\":\"treegrid\"},\"POST\":{\"page\":\"1\",\"rows\":\"20\"}}',1,'admin','127.0.0.1','2015-01-04 19:04:57'),(387,'Cost','costlist','{\"GET\":{\"grid\":\"treegrid\"},\"POST\":{\"page\":\"1\",\"rows\":\"20\"}}',1,'admin','127.0.0.1','2015-01-04 19:04:58'),(388,'Cost','costlist','{\"GET\":{\"grid\":\"treegrid\"},\"POST\":{\"page\":\"1\",\"rows\":\"20\"}}',1,'admin','127.0.0.1','2015-01-04 19:04:58'),(389,'Cost','costlist','{\"GET\":{\"grid\":\"treegrid\"},\"POST\":{\"page\":\"1\",\"rows\":\"20\"}}',1,'admin','127.0.0.1','2015-01-04 19:04:59'),(390,'Cost','costlist','{\"GET\":{\"grid\":\"treegrid\"},\"POST\":{\"page\":\"1\",\"rows\":\"20\"}}',1,'admin','127.0.0.1','2015-01-04 19:05:00'),(391,'Cost','costlist','{\"GET\":{\"grid\":\"treegrid\"},\"POST\":{\"page\":\"1\",\"rows\":\"20\"}}',1,'admin','127.0.0.1','2015-01-04 19:05:00'),(392,'Cost','costlist','{\"GET\":{\"grid\":\"treegrid\"},\"POST\":{\"page\":\"1\",\"rows\":\"20\"}}',1,'admin','127.0.0.1','2015-01-04 19:05:01'),(393,'Cost','costlist','{\"GET\":{\"grid\":\"treegrid\"},\"POST\":{\"page\":\"1\",\"rows\":\"20\"}}',1,'admin','127.0.0.1','2015-01-04 19:05:07'),(394,'Cost','costlist','{\"GET\":{\"grid\":\"treegrid\"},\"POST\":{\"page\":\"1\",\"rows\":\"20\"}}',1,'admin','127.0.0.1','2015-01-04 19:05:08'),(395,'Cost','costlist','{\"GET\":{\"grid\":\"treegrid\"},\"POST\":{\"page\":\"1\",\"rows\":\"20\"}}',1,'admin','127.0.0.1','2015-01-04 19:05:09'),(396,'System','loglist','{\"GET\":{\"menuid\":\"15\",\"_\":\"1420371385608\"}}',1,'admin','127.0.0.1','2015-01-04 19:36:25'),(397,'System','loglist','{\"GET\":{\"grid\":\"datagrid\"},\"POST\":{\"page\":\"1\",\"rows\":\"20\"}}',1,'admin','127.0.0.1','2015-01-04 19:36:26'),(398,'Cost','costlist','{\"GET\":{\"menuid\":\"43\",\"_\":\"1420371388961\"}}',1,'admin','127.0.0.1','2015-01-04 19:36:29'),(399,'Cost','costlist','{\"GET\":{\"grid\":\"treegrid\"},\"POST\":{\"page\":\"1\",\"rows\":\"20\"}}',1,'admin','127.0.0.1','2015-01-04 19:36:29'),(400,'Member','memberlist','{\"GET\":{\"menuid\":\"44\",\"_\":\"1420371390115\"}}',1,'admin','127.0.0.1','2015-01-04 19:36:30'),(401,'Member','memberlist','{\"GET\":{\"grid\":\"treegrid\"},\"POST\":{\"page\":\"1\",\"rows\":\"20\"}}',1,'admin','127.0.0.1','2015-01-04 19:36:30'),(402,'Index','index','{\"GET\":[]}',1,'admin','127.0.0.1','2015-01-05 20:26:49'),(403,'Index','index','{\"GET\":[]}',1,'admin','127.0.0.1','2015-01-17 11:30:47'),(404,'Cost','costlist','{\"GET\":{\"menuid\":\"43\",\"_\":\"1421465451558\"}}',1,'admin','127.0.0.1','2015-01-17 11:30:51'),(405,'Cost','costlist','{\"GET\":{\"grid\":\"treegrid\"},\"POST\":{\"page\":\"1\",\"rows\":\"20\"}}',1,'admin','127.0.0.1','2015-01-17 11:30:52'),(406,'Member','memberlist','{\"GET\":{\"menuid\":\"44\",\"_\":\"1421465453395\"}}',1,'admin','127.0.0.1','2015-01-17 11:30:53'),(407,'Member','memberlist','{\"GET\":{\"grid\":\"treegrid\"},\"POST\":{\"page\":\"1\",\"rows\":\"20\"}}',1,'admin','127.0.0.1','2015-01-17 11:30:53');
/*!40000 ALTER TABLE `app2_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app2_member`
--

DROP TABLE IF EXISTS `app2_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app2_member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` varchar(45) NOT NULL COMMENT '卡号',
  `name` varchar(45) DEFAULT NULL COMMENT '姓名',
  `sex` int(11) DEFAULT NULL COMMENT '性别',
  `created` varchar(45) DEFAULT NULL COMMENT '创建日期',
  `level` varchar(45) DEFAULT NULL COMMENT '会员卡等级',
  `preferential_way` varchar(45) DEFAULT NULL COMMENT '优惠方式',
  `blance` decimal(10,2) DEFAULT '0.00' COMMENT '余额',
  `cumulative` decimal(10,2) DEFAULT '0.00' COMMENT '累计消费',
  `status` int(11) DEFAULT '0' COMMENT '状态',
  `phone` varchar(45) NOT NULL COMMENT '会员电话',
  `remark` text COMMENT '备注',
  `modified` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app2_membercol_UNIQUE` (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app2_member`
--

LOCK TABLES `app2_member` WRITE;
/*!40000 ALTER TABLE `app2_member` DISABLE KEYS */;
INSERT INTO `app2_member` VALUES (1,'1','test',1,NULL,'1',NULL,0.00,0.00,0,'1111',NULL,NULL),(11,'00001','首页',1,NULL,'0',NULL,111.00,0.00,0,'18092058670','',NULL),(13,'2','功能介绍',0,NULL,'1',NULL,1.00,0.00,0,'18092058671','',NULL),(14,'4','首页',1,NULL,'0',NULL,1.00,0.00,0,'18092058672','',NULL),(15,'5','功能介绍',1,NULL,'0',NULL,0.00,0.00,0,'18092058670','',NULL),(16,'6','联系我们',1,NULL,'0',NULL,1.00,0.00,0,'18092058670','',NULL),(17,'9','底部',1,NULL,'0',NULL,0.00,0.00,0,'18092058670','',NULL),(18,'11','11',1,NULL,'0',NULL,0.00,0.00,0,'18092058672','',NULL),(19,'99','图片',1,NULL,'0',NULL,0.00,0.00,0,'18092058670','',NULL),(20,'33','关于简美',1,NULL,'0',NULL,0.00,0.00,0,'18092058670','',NULL),(21,'22','关于简美',1,NULL,'0',NULL,0.00,0.00,0,'18092058670','',NULL),(23,'112','关于简美',1,NULL,'0',NULL,0.00,0.00,0,'18092058670','',NULL),(24,'111','11',1,NULL,'0',NULL,-1.00,0.00,0,'18092058670','',NULL),(25,'1111','关于简美',1,NULL,'0',NULL,0.00,0.00,0,'18092058670','',NULL),(26,'2222','关于简美',1,NULL,'0',NULL,90.00,0.00,0,'18092058670','',NULL),(27,'11111','11',1,NULL,'0',NULL,0.00,0.00,0,'18092058670','',1420185298),(28,'222222','2',1,NULL,'0',NULL,100.00,0.00,0,'22','',NULL),(29,'2121','关于简美',1,NULL,'0',NULL,0.00,0.00,0,'18092058670','',NULL),(30,'1212','关于简美',1,NULL,'0',NULL,0.00,0.00,0,'18092058670','',NULL),(31,'232323','首页',1,NULL,'0',NULL,0.00,0.00,0,'18092058670','',NULL),(32,'2312','功能介绍',1,NULL,'0',NULL,100.00,0.00,0,'18092058670','',1420266590),(33,'1111111','关于简美',1,NULL,'MEMER_JUNIOR',NULL,0.00,0.00,0,'18092058673','',NULL),(34,'10000','小刘',1,NULL,'MEMER_JUNIOR',NULL,928.20,0.00,0,'18092058674','',1420266393),(35,'100000','小王',1,NULL,'MEMER_JUNIOR',NULL,600.00,0.00,0,'18092058676','',NULL),(36,'11111111','小张',1,NULL,'MEMER_JUNIOR',NULL,821.00,0.00,0,'18092058679','',1420185364),(37,'00006','刘飞',1,NULL,'MEMER_JUNIOR',NULL,280.00,0.00,0,'18092058690','开卡充值500',NULL),(38,'1112223','首页',0,NULL,'MEMER_JUNIOR',NULL,300.00,0.00,0,'18092068670','',1420185179);
/*!40000 ALTER TABLE `app2_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app2_member_detail`
--

DROP TABLE IF EXISTS `app2_member_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app2_member_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mid` int(11) NOT NULL,
  `pay` decimal(10,2) DEFAULT '0.00',
  `re_pay` decimal(10,2) DEFAULT '0.00',
  `cumulative` decimal(10,2) DEFAULT '0.00' COMMENT '明细累计',
  `createtime` int(10) NOT NULL DEFAULT '0' COMMENT '消费时间',
  `operate_id` int(11) NOT NULL COMMENT '操作人',
  PRIMARY KEY (`id`),
  KEY `mid_idx` (`mid`),
  CONSTRAINT `mid` FOREIGN KEY (`mid`) REFERENCES `app2_member` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app2_member_detail`
--

LOCK TABLES `app2_member_detail` WRITE;
/*!40000 ALTER TABLE `app2_member_detail` DISABLE KEYS */;
INSERT INTO `app2_member_detail` VALUES (1,33,0.00,0.00,0.00,0,0),(2,33,0.00,0.00,0.00,0,0),(3,33,0.00,0.00,0.00,0,0),(4,33,0.00,0.00,0.00,0,0),(5,33,0.00,0.00,0.00,0,0),(6,32,0.00,0.00,0.00,0,0),(7,31,0.00,0.00,0.00,0,0),(8,33,0.00,0.00,0.00,0,0),(9,33,100.00,0.00,0.00,0,0),(10,33,0.00,0.00,0.00,0,0),(11,33,0.00,0.00,0.00,0,0),(12,33,0.00,0.00,0.00,0,0),(13,33,0.00,0.00,0.00,0,0),(14,33,0.00,0.00,0.00,0,0),(15,33,0.00,0.00,0.00,0,0),(16,33,60.00,0.00,0.00,0,0),(17,33,0.00,0.00,0.00,0,0),(18,33,10.00,0.00,0.00,0,0),(19,33,10.00,0.00,0.00,0,0),(20,33,0.00,0.00,0.00,0,0),(21,33,0.00,0.00,0.00,0,0),(22,34,0.00,0.00,0.00,0,0),(23,34,1.00,0.00,0.00,0,0),(24,34,1.00,0.00,0.00,0,0),(25,34,1.00,0.00,0.00,0,0),(26,34,1.00,0.00,0.00,0,0),(27,34,0.00,0.00,0.00,0,0),(28,34,0.00,0.00,0.00,0,0),(29,34,0.00,0.00,0.00,0,0),(30,34,0.00,0.00,0.00,0,0),(31,34,0.00,0.00,0.00,0,0),(32,34,0.00,0.00,0.00,0,0),(33,34,1.00,0.00,0.00,0,0),(34,34,0.00,0.00,0.00,0,0),(35,34,1.00,0.00,9.00,0,0),(36,34,1.00,0.00,997.00,0,0),(37,34,1.00,0.00,996.00,0,0),(38,34,10.00,0.00,986.00,0,0),(39,34,19.80,0.00,966.20,0,0),(40,34,0.00,0.00,966.20,0,0),(41,34,0.00,0.00,966.20,0,0),(42,34,1.00,0.00,965.20,0,0),(43,34,0.00,0.00,965.20,1419162480,0),(44,34,0.00,0.00,965.20,1419162756,0),(45,34,1.00,0.00,964.20,1419164208,0),(46,34,1.00,0.00,963.20,1419164229,0),(47,35,10.00,0.00,990.00,1419173930,0),(48,35,100.00,0.00,890.00,1419173945,0),(49,35,0.00,0.00,890.00,1419174121,0),(50,35,10.00,0.00,880.00,1419176492,0),(51,35,0.00,0.00,880.00,1419176624,0),(52,35,0.00,0.00,880.00,1419180531,0),(53,35,99.00,0.00,781.00,1419180552,0),(54,35,10.00,0.00,771.00,1419181867,0),(55,35,5.00,0.00,766.00,1419181876,0),(56,35,10.00,0.00,756.00,1419182573,0),(57,35,100.00,0.00,656.00,1419210174,0),(58,35,55.00,0.00,601.00,1419210186,0),(59,35,1.00,0.00,600.00,1419325234,1),(60,36,10.00,0.00,890.00,1419341406,1),(61,36,99.00,0.00,791.00,1419341491,1),(62,36,0.00,0.00,791.00,1419413224,1),(63,37,20.00,0.00,480.00,1419915793,1),(64,37,100.00,0.00,380.00,1419915828,1),(65,38,110.00,0.00,-110.00,1420007052,2),(66,38,22.00,0.00,-132.00,1420007062,2),(67,37,100.00,0.00,280.00,1420010150,1),(68,38,0.00,0.00,-132.00,1420028530,1),(69,24,0.00,0.00,0.00,1420028547,1),(70,24,1.00,0.00,-1.00,1420028552,1),(71,38,111.00,0.00,-243.00,1420028676,1),(72,38,0.00,0.00,-243.00,1420108645,1),(73,38,-100.00,0.00,301.00,1420114961,1),(74,38,-100.00,0.00,401.00,1420115031,1),(75,36,0.00,0.00,801.00,1420116998,1),(76,36,0.00,0.00,811.00,1420117131,1),(77,36,0.00,10.00,821.00,1420117187,1),(78,26,0.00,100.00,100.00,1420117229,1),(79,26,10.00,0.00,90.00,1420117241,1),(80,28,0.00,100.00,100.00,1420122560,1),(81,38,1.00,0.00,400.00,1420185026,1),(82,38,100.00,0.00,300.00,1420185179,1),(83,34,0.00,0.00,963.20,1420185243,1),(84,27,0.00,0.00,0.00,1420185298,1),(85,36,0.00,0.00,821.00,1420185364,1),(86,34,0.00,0.00,963.20,1420185587,1),(87,34,1.00,0.00,962.20,1420266309,1),(88,34,11.00,0.00,951.20,1420266344,1),(89,34,11.00,0.00,940.20,1420266368,1),(90,34,12.00,0.00,928.20,1420266393,1),(91,32,0.00,0.00,0.00,1420266590,1),(92,32,0.00,100.00,100.00,1420266833,1);
/*!40000 ALTER TABLE `app2_member_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app2_menu`
--

DROP TABLE IF EXISTS `app2_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app2_menu` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(40) NOT NULL DEFAULT '',
  `parentid` smallint(6) NOT NULL DEFAULT '0',
  `c` char(20) NOT NULL DEFAULT '',
  `a` char(20) NOT NULL DEFAULT '',
  `data` char(255) NOT NULL DEFAULT '',
  `is_system` tinyint(1) NOT NULL DEFAULT '0',
  `listorder` smallint(6) unsigned NOT NULL DEFAULT '0',
  `display` enum('1','0') NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `listorder` (`listorder`),
  KEY `parentid` (`parentid`),
  KEY `module` (`c`,`a`)
) ENGINE=MyISAM AUTO_INCREMENT=58 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app2_menu`
--

LOCK TABLES `app2_menu` WRITE;
/*!40000 ALTER TABLE `app2_menu` DISABLE KEYS */;
INSERT INTO `app2_menu` VALUES (1,'我的面板',0,'Admin','public_top','',1,1,'1'),(2,'系统设置',0,'Setting','top','',0,2,'1'),(3,'内容管理',0,'Content','top','',0,3,'0'),(4,'用户管理',0,'Member','top','',0,4,'1'),(5,'后台管理',0,'System','top','',0,5,'1'),(6,'个人信息',1,'Admin','public_left','',1,0,'1'),(7,'修改密码',6,'Admin','public_editPwd','',1,1,'1'),(8,'修改个人信息',6,'Admin','public_editInfo','',1,0,'1'),(9,'系统设置',2,'Setting','left','',0,1,'1'),(10,'站点设置',9,'Setting','site','',0,1,'1'),(11,'管理员设置',2,'Admin','left','',0,2,'1'),(12,'管理员管理',11,'Admin','memberList','',0,1,'1'),(13,'角色管理',11,'Admin','roleList','',0,2,'1'),(14,'后台管理',5,'System','left','',0,1,'1'),(15,'日志管理',14,'System','logList','',0,1,'1'),(16,'菜单管理',14,'System','menuList','',0,2,'1'),(17,'查看菜单',16,'System','menuView','',0,0,'1'),(18,'添加菜单',16,'System','menuAdd','',0,0,'1'),(19,'修改菜单',16,'System','menuEdit','',0,0,'1'),(20,'删除菜单',16,'System','menuDelete','',0,0,'1'),(21,'菜单排序',16,'System','menuOrder','',0,0,'1'),(22,'查看日志',15,'System','logView','',0,0,'1'),(23,'删除日志',15,'System','logDelete','',0,0,'1'),(24,'查看管理员',12,'Admin','memberView','',0,0,'1'),(25,'添加管理员',12,'Admin','memberAdd','',0,0,'1'),(26,'编辑管理员',12,'Admin','memberEdit','',0,0,'1'),(27,'删除管理员',12,'Admin','memberDelete','',0,0,'1'),(28,'查看角色',13,'Admin','roleView','',0,0,'1'),(29,'添加角色',13,'Admin','roleAdd','',0,0,'1'),(30,'编辑角色',13,'Admin','roleEdit','',0,0,'1'),(31,'删除角色',13,'Admin','roleDelete','',0,0,'1'),(32,'角色排序',13,'Admin','roleOrder','',0,0,'1'),(33,'权限设置',13,'Admin','roleSet','',0,0,'1'),(34,'发布管理',3,'Content','left','',0,0,'1'),(35,'内容管理',34,'Content','index','',0,0,'1'),(36,'栏目管理',34,'Category','categoryList','',0,0,'1'),(37,'查看栏目',36,'Category','categoryView','',0,0,'1'),(38,'添加栏目',36,'Category','categoryAdd','',0,0,'1'),(39,'编辑栏目',36,'Category','categoryEdit','',0,0,'1'),(40,'删除栏目',36,'Category','categoryDelete','',0,0,'1'),(41,'栏目排序',36,'Category','categoryOrder','',0,0,'1'),(42,'用户中心',4,'Member','left','',0,0,'1'),(43,'普通消费管理',42,'Cost','costList','',0,0,'1'),(44,'会员消费管理',42,'Member','memberList','',0,0,'1'),(50,'员工管理',49,'Employee','employeeList','',0,0,'1'),(49,'员工模块',2,'Employee','top','',0,0,'1'),(51,'收入统计模块',1,'Income','top','',0,0,'1'),(52,'门店收入',51,'Income','incomeList','',0,0,'1'),(55,'加入会员明细',42,'Member','memberAddDetail','',0,0,'0'),(54,'面板',53,'Index','index','',0,0,'1'),(56,'加入明细',42,'Member','memberAdd','',0,0,'0'),(57,'明细列表显示',42,'MemberDetail','detailList','',0,0,'0');
/*!40000 ALTER TABLE `app2_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app2_news`
--

DROP TABLE IF EXISTS `app2_news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app2_news` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `title` varchar(80) NOT NULL DEFAULT '',
  `style` char(24) NOT NULL DEFAULT '',
  `thumb` varchar(100) NOT NULL DEFAULT '',
  `keywords` char(40) NOT NULL DEFAULT '',
  `description` mediumtext NOT NULL,
  `content` mediumtext NOT NULL,
  `url` char(100) NOT NULL,
  `listorder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `islink` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `username` char(20) NOT NULL,
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `status` (`status`,`listorder`,`id`),
  KEY `listorder` (`catid`,`status`,`listorder`,`id`),
  KEY `catid` (`catid`,`status`,`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app2_news`
--

LOCK TABLES `app2_news` WRITE;
/*!40000 ALTER TABLE `app2_news` DISABLE KEYS */;
INSERT INTO `app2_news` VALUES (1,1,'test','','/wangdong/Public/upload/2014/12/14/548d9a7a268da.png','test','test...','1111','',0,1,0,'admin',1418566274,0);
/*!40000 ALTER TABLE `app2_news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app2_page`
--

DROP TABLE IF EXISTS `app2_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app2_page` (
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `title` varchar(160) NOT NULL,
  `keywords` varchar(40) NOT NULL,
  `content` text NOT NULL,
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  KEY `catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app2_page`
--

LOCK TABLES `app2_page` WRITE;
/*!40000 ALTER TABLE `app2_page` DISABLE KEYS */;
/*!40000 ALTER TABLE `app2_page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app2_setting`
--

DROP TABLE IF EXISTS `app2_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app2_setting` (
  `key` varchar(50) NOT NULL,
  `value` varchar(5000) DEFAULT '',
  PRIMARY KEY (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app2_setting`
--

LOCK TABLES `app2_setting` WRITE;
/*!40000 ALTER TABLE `app2_setting` DISABLE KEYS */;
INSERT INTO `app2_setting` VALUES ('SAVE_LOG_OPEN','1');
/*!40000 ALTER TABLE `app2_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app2_times`
--

DROP TABLE IF EXISTS `app2_times`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app2_times` (
  `username` char(40) NOT NULL,
  `ip` char(15) NOT NULL,
  `logintime` int(10) unsigned NOT NULL DEFAULT '0',
  `isadmin` tinyint(1) NOT NULL DEFAULT '0',
  `times` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`username`,`isadmin`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app2_times`
--

LOCK TABLES `app2_times` WRITE;
/*!40000 ALTER TABLE `app2_times` DISABLE KEYS */;
/*!40000 ALTER TABLE `app2_times` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-01-17 12:10:16
