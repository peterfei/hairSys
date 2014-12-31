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
create database 'wangdong';
use 'wangdong';
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
INSERT INTO `app2_admin` VALUES (1,'admin','f41811c88a2da17c9351ddffb4496d59',1,'GqlZUW','0.0.0.0',1420007098,'peterfeispace@gmail.com',''),(2,'gubei','a58638fc8d9cdb3cccf0b93af8c2bba8',3,'pNevAZ','0.0.0.0',1420007178,'gubei@163.com','gubei');
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app2_cost`
--

LOCK TABLES `app2_cost` WRITE;
/*!40000 ALTER TABLE `app2_cost` DISABLE KEYS */;
INSERT INTO `app2_cost` VALUES (1,'0',0,0,0,NULL,0,100.00,0.00,100.00,0),(2,'0',0,0,0,NULL,0,10.00,0.00,0.00,0),(3,'0',2,1,0,NULL,0,0.00,0.00,0.00,0),(4,'0',2,1,0,NULL,0,0.00,0.00,0.00,0),(5,'ITEM_WASH',2,1,0,NULL,0,0.00,0.00,0.00,0),(6,'ITEM_WASH',2,1,0,NULL,0,0.00,0.00,0.00,0),(7,'ITEM_WASH',2,1,1419321862,1419321862,0,0.00,0.00,0.00,0),(8,'ITEM_WASH',2,1,1419325109,1419325109,1,0.00,0.00,0.00,0),(9,'ITEM_WASH',2,1,1419341459,1419341459,1,0.00,0.00,0.00,0),(10,'ITEM_WASH',2,1,1419569703,1419569703,1,0.00,0.00,0.00,1),(11,'ITEM_WASH',2,1,1419901457,1419901457,1,99.00,0.00,99.00,1),(12,'ITEM_WASH',3,4,1419915916,1419915916,1,100.00,0.00,88.00,1);
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
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app2_log`
--

LOCK TABLES `app2_log` WRITE;
/*!40000 ALTER TABLE `app2_log` DISABLE KEYS */;
INSERT INTO `app2_log` VALUES (1,'Index','index','{\"GET\":[]}',1,'admin','0.0.0.0','2014-12-14 23:09:40'),(2,'Admin','memberlist','{\"GET\":{\"menuid\":\"12\",\"_\":\"1418569785684\"}}',1,'admin','0.0.0.0','2014-12-14 23:09:45'),(3,'Admin','memberlist','{\"GET\":{\"grid\":\"datagrid\"},\"POST\":{\"page\":\"1\",\"rows\":\"20\"}}',1,'admin','0.0.0.0','2014-12-14 23:09:46'),(4,'Setting','site','{\"GET\":{\"menuid\":\"10\",\"_\":\"1418569793396\"}}',1,'admin','0.0.0.0','2014-12-14 23:09:53'),(5,'Setting','site','{\"GET\":{\"grid\":\"propertygrid\"},\"POST\":[]}',1,'admin','0.0.0.0','2014-12-14 23:09:53'),(6,'Index','index','{\"GET\":[]}',1,'admin','0.0.0.0','2014-12-14 23:10:35'),(7,'Setting','site','{\"GET\":{\"menuid\":\"10\",\"_\":\"1418569838719\"}}',1,'admin','0.0.0.0','2014-12-14 23:10:38'),(8,'Setting','site','{\"GET\":{\"grid\":\"propertygrid\"},\"POST\":[]}',1,'admin','0.0.0.0','2014-12-14 23:10:38'),(9,'Setting','sitedefault','{\"GET\":[],\"POST\":[]}',1,'admin','0.0.0.0','2014-12-14 23:10:41');
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `app2_membercol_UNIQUE` (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app2_member`
--

LOCK TABLES `app2_member` WRITE;
/*!40000 ALTER TABLE `app2_member` DISABLE KEYS */;
INSERT INTO `app2_member` VALUES (1,'1','test',1,NULL,'1',NULL,0.00,0.00,0,'1111',NULL),(11,'00001','首页',1,NULL,'0',NULL,111.00,0.00,0,'18092058670',''),(13,'2','功能介绍',0,NULL,'1',NULL,1.00,0.00,0,'18092058671',''),(14,'4','首页',1,NULL,'0',NULL,1.00,0.00,0,'18092058672',''),(15,'5','功能介绍',1,NULL,'0',NULL,0.00,0.00,0,'18092058670',''),(16,'6','联系我们',1,NULL,'0',NULL,1.00,0.00,0,'18092058670',''),(17,'9','底部',1,NULL,'0',NULL,0.00,0.00,0,'18092058670',''),(18,'11','11',1,NULL,'0',NULL,0.00,0.00,0,'18092058672',''),(19,'99','图片',1,NULL,'0',NULL,0.00,0.00,0,'18092058670',''),(20,'33','关于简美',1,NULL,'0',NULL,0.00,0.00,0,'18092058670',''),(21,'22','关于简美',1,NULL,'0',NULL,0.00,0.00,0,'18092058670',''),(23,'112','关于简美',1,NULL,'0',NULL,0.00,0.00,0,'18092058670',''),(24,'111','11',1,NULL,'0',NULL,0.00,0.00,0,'18092058670',''),(25,'1111','关于简美',1,NULL,'0',NULL,0.00,0.00,0,'18092058670',''),(26,'2222','关于简美',1,NULL,'0',NULL,0.00,0.00,0,'18092058670',''),(27,'11111','11',1,NULL,'0',NULL,0.00,0.00,0,'18092058670',''),(28,'222222','2',1,NULL,'0',NULL,0.00,0.00,0,'22',''),(29,'2121','关于简美',1,NULL,'0',NULL,0.00,0.00,0,'18092058670',''),(30,'1212','关于简美',1,NULL,'0',NULL,0.00,0.00,0,'18092058670',''),(31,'232323','首页',1,NULL,'0',NULL,0.00,0.00,0,'18092058670',''),(32,'2312','功能介绍',1,NULL,'0',NULL,0.00,0.00,0,'18092058670',''),(33,'1111111','关于简美',1,NULL,'MEMER_JUNIOR',NULL,0.00,0.00,0,'18092058673',''),(34,'10000','小刘',1,NULL,'MEMER_JUNIOR',NULL,963.20,0.00,0,'18092058674',''),(35,'100000','小王',1,NULL,'MEMER_JUNIOR',NULL,600.00,0.00,0,'18092058676',''),(36,'11111111','小张',1,NULL,'MEMER_JUNIOR',NULL,791.00,0.00,0,'18092058679',''),(37,'00006','刘飞',1,NULL,'MEMER_JUNIOR',NULL,380.00,0.00,0,'18092058690','开卡充值500'),(38,'1112223','首页',0,NULL,'MEMER_JUNIOR',NULL,-132.00,0.00,0,'18092068670','');
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
  `cumulative` decimal(10,2) DEFAULT '0.00' COMMENT '明细累计',
  `createtime` int(10) NOT NULL DEFAULT '0' COMMENT '消费时间',
  `operate_id` int(11) NOT NULL COMMENT '操作人',
  PRIMARY KEY (`id`),
  KEY `mid_idx` (`mid`),
  CONSTRAINT `mid` FOREIGN KEY (`mid`) REFERENCES `app2_member` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app2_member_detail`
--

LOCK TABLES `app2_member_detail` WRITE;
/*!40000 ALTER TABLE `app2_member_detail` DISABLE KEYS */;
INSERT INTO `app2_member_detail` VALUES (1,33,0.00,0.00,0,0),(2,33,0.00,0.00,0,0),(3,33,0.00,0.00,0,0),(4,33,0.00,0.00,0,0),(5,33,0.00,0.00,0,0),(6,32,0.00,0.00,0,0),(7,31,0.00,0.00,0,0),(8,33,0.00,0.00,0,0),(9,33,100.00,0.00,0,0),(10,33,0.00,0.00,0,0),(11,33,0.00,0.00,0,0),(12,33,0.00,0.00,0,0),(13,33,0.00,0.00,0,0),(14,33,0.00,0.00,0,0),(15,33,0.00,0.00,0,0),(16,33,60.00,0.00,0,0),(17,33,0.00,0.00,0,0),(18,33,10.00,0.00,0,0),(19,33,10.00,0.00,0,0),(20,33,0.00,0.00,0,0),(21,33,0.00,0.00,0,0),(22,34,0.00,0.00,0,0),(23,34,1.00,0.00,0,0),(24,34,1.00,0.00,0,0),(25,34,1.00,0.00,0,0),(26,34,1.00,0.00,0,0),(27,34,0.00,0.00,0,0),(28,34,0.00,0.00,0,0),(29,34,0.00,0.00,0,0),(30,34,0.00,0.00,0,0),(31,34,0.00,0.00,0,0),(32,34,0.00,0.00,0,0),(33,34,1.00,0.00,0,0),(34,34,0.00,0.00,0,0),(35,34,1.00,9.00,0,0),(36,34,1.00,997.00,0,0),(37,34,1.00,996.00,0,0),(38,34,10.00,986.00,0,0),(39,34,19.80,966.20,0,0),(40,34,0.00,966.20,0,0),(41,34,0.00,966.20,0,0),(42,34,1.00,965.20,0,0),(43,34,0.00,965.20,1419162480,0),(44,34,0.00,965.20,1419162756,0),(45,34,1.00,964.20,1419164208,0),(46,34,1.00,963.20,1419164229,0),(47,35,10.00,990.00,1419173930,0),(48,35,100.00,890.00,1419173945,0),(49,35,0.00,890.00,1419174121,0),(50,35,10.00,880.00,1419176492,0),(51,35,0.00,880.00,1419176624,0),(52,35,0.00,880.00,1419180531,0),(53,35,99.00,781.00,1419180552,0),(54,35,10.00,771.00,1419181867,0),(55,35,5.00,766.00,1419181876,0),(56,35,10.00,756.00,1419182573,0),(57,35,100.00,656.00,1419210174,0),(58,35,55.00,601.00,1419210186,0),(59,35,1.00,600.00,1419325234,1),(60,36,10.00,890.00,1419341406,1),(61,36,99.00,791.00,1419341491,1),(62,36,0.00,791.00,1419413224,1),(63,37,20.00,480.00,1419915793,1),(64,37,100.00,380.00,1419915828,1),(65,38,110.00,-110.00,1420007052,2),(66,38,22.00,-132.00,1420007062,2);
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

-- Dump completed on 2014-12-31 14:36:56
