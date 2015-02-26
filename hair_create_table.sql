-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Feb 26, 2015 at 09:13 AM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `hairsys`
--
CREATE DATABASE IF NOT EXISTS `hairsys` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `hairsys`;

-- --------------------------------------------------------

--
-- Table structure for table `app2_admin`
--

DROP TABLE IF EXISTS `app2_admin`;
CREATE TABLE IF NOT EXISTS `app2_admin` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `app2_admin_role`
--

DROP TABLE IF EXISTS `app2_admin_role`;
CREATE TABLE IF NOT EXISTS `app2_admin_role` (
  `roleid` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `rolename` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`roleid`),
  KEY `listorder` (`listorder`),
  KEY `disabled` (`disabled`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `app2_admin_role_priv`
--

DROP TABLE IF EXISTS `app2_admin_role_priv`;
CREATE TABLE IF NOT EXISTS `app2_admin_role_priv` (
  `roleid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `c` char(20) NOT NULL,
  `a` char(20) NOT NULL,
  KEY `roleid` (`roleid`,`c`,`a`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `app2_category`
--

DROP TABLE IF EXISTS `app2_category`;
CREATE TABLE IF NOT EXISTS `app2_category` (
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `app2_category_priv`
--

DROP TABLE IF EXISTS `app2_category_priv`;
CREATE TABLE IF NOT EXISTS `app2_category_priv` (
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `roleid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `is_admin` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `action` char(30) NOT NULL,
  KEY `catid` (`catid`,`roleid`,`is_admin`,`action`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `app2_cost`
--

DROP TABLE IF EXISTS `app2_cost`;
CREATE TABLE IF NOT EXISTS `app2_cost` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action` varchar(10) NOT NULL COMMENT '顾客行为(充值, 洗, 剪, 吹, 染,烫)',
  `cid` varchar(20) DEFAULT '' COMMENT '会员卡号',
  `eid` int(11) NOT NULL COMMENT '发型师ID',
  `aid` int(11) DEFAULT NULL COMMENT '助理ID',
  `payables` decimal(10,2) NOT NULL COMMENT '应付款',
  `discount` decimal(10,2) DEFAULT '0.00' COMMENT '折扣',
  `real_pay` decimal(10,2) NOT NULL COMMENT '实付',
  `point` tinyint(4) DEFAULT '0' COMMENT '是否点牌',
  `operate_id` int(11) NOT NULL COMMENT '操作人ID',
  `created_time` int(10) NOT NULL COMMENT '创建时间',
  `modified_time` int(10) DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `id_idx` (`eid`,`aid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

--
-- Triggers `app2_cost`
--
DROP TRIGGER IF EXISTS `tg_d_on_cost`;
DELIMITER //
CREATE TRIGGER `tg_d_on_cost` AFTER DELETE ON `app2_cost`
 FOR EACH ROW begin
    select date_format(from_unixtime(old.created_time),'%y-%m-%d') into @delete_date; 
    if old.cid <> '' && old.action <> 'topup' then
        update app2_cost_daily set card_cost = card_cost - old.real_pay where created_date = @delete_date;
    elseif old.cid <> '' && old.action = 'topup' then
        update app2_cost_daily set topup = topup - old.real_pay where created_date = @delete_date;
    else
        update app2_cost_daily set non_card_cost = non_card_cost - old.real_pay where created_date = @delete_date;
    end if;
end
//
DELIMITER ;
DROP TRIGGER IF EXISTS `tg_i_on_cost`;
DELIMITER //
CREATE TRIGGER `tg_i_on_cost` AFTER INSERT ON `app2_cost`
 FOR EACH ROW begin
 select date_format(from_unixtime(new.created_time),'%y-%m-%d') into @insert_date;
 if not exists (select created_date from app2_cost_daily where created_date = @insert_date) then
        if new.cid <> '' && new.action <> 'topup' then
            insert into app2_cost_daily(card_cost, created_date, created_time) values(new.real_pay, @insert_date, unix_timestamp(@insert_date));
        elseif new.cid <> '' && new.action = 'topup' then
            insert into app2_cost_daily(topup, created_date, created_time) values(new.real_pay, @insert_date, unix_timestamp(@insert_date));
        else
            insert into app2_cost_daily(non_card_cost, created_date, created_time) values(new.real_pay, @insert_date, unix_timestamp(@insert_date));
        end if;
    else
        if new.cid <> '' && new.action <> 'topup' then
            update app2_cost_daily set card_cost = card_cost + new.real_pay where created_date = @insert_date;
        elseif new.cid <> '' && new.action = 'topup' then
            update app2_cost_daily set topup = topup + new.real_pay where created_date = @insert_date;
        else
            update app2_cost_daily set non_card_cost = non_card_cost + new.real_pay where created_date = @insert_date;
        end if;
    end if;
end
//
DELIMITER ;
DROP TRIGGER IF EXISTS `tg_u_on_cost`;
DELIMITER //
CREATE TRIGGER `tg_u_on_cost` AFTER UPDATE ON `app2_cost`
 FOR EACH ROW begin
    select date_format(from_unixtime(new.created_time),'%y-%m-%d') into @update_date; 
    if new.cid <> '' && new.action <> 'topup' then
        update app2_cost_daily set card_cost = card_cost + (new.real_pay - old.real_pay) where created_date = @update_date;
    elseif new.cid <> '' && new.action = 'topup' then
        update app2_cost_daily set topup = topup + (new.real_pay - old.real_pay) where created_date = @update_date;
    else
        update app2_cost_daily set non_card_cost = non_card_cost + (new.real_pay - old.real_pay) where created_date = @update_date;
    end if;
end
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `app2_cost_daily`
--

DROP TABLE IF EXISTS `app2_cost_daily`;
CREATE TABLE IF NOT EXISTS `app2_cost_daily` (
  `topup` decimal(10,2) NOT NULL COMMENT '每日会员卡充值总额',
  `card_cost` decimal(10,2) NOT NULL COMMENT '每日会员卡消费总额',
  `non_card_cost` decimal(10,2) NOT NULL COMMENT '每日非会员消费总额',
  `created_date` date NOT NULL,
  `created_time` int(10) NOT NULL COMMENT 'GMT时间戳, 与created_date一致',
  PRIMARY KEY (`created_date`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `app2_employee`
--

DROP TABLE IF EXISTS `app2_employee`;
CREATE TABLE IF NOT EXISTS `app2_employee` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `app2_item_data`
--

DROP TABLE IF EXISTS `app2_item_data`;
CREATE TABLE IF NOT EXISTS `app2_item_data` (
  `group` varchar(100) CHARACTER SET utf8 COLLATE utf8_croatian_ci NOT NULL DEFAULT '' COMMENT '项目组名称',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_croatian_ci NOT NULL DEFAULT '' COMMENT '项目名称',
  `value` varchar(100) CHARACTER SET utf8 COLLATE utf8_croatian_ci DEFAULT NULL COMMENT '项目值',
  `editor` varchar(10) CHARACTER SET utf8 COLLATE utf8_croatian_ci DEFAULT 'text' COMMENT '是否可编辑',
  PRIMARY KEY (`group`,`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='存储系统所有的用户自定义项目';

-- --------------------------------------------------------

--
-- Table structure for table `app2_link`
--

DROP TABLE IF EXISTS `app2_link`;
CREATE TABLE IF NOT EXISTS `app2_link` (
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

-- --------------------------------------------------------

--
-- Table structure for table `app2_log`
--

DROP TABLE IF EXISTS `app2_log`;
CREATE TABLE IF NOT EXISTS `app2_log` (
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `app2_member`
--

DROP TABLE IF EXISTS `app2_member`;
CREATE TABLE IF NOT EXISTS `app2_member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` varchar(45) NOT NULL COMMENT '卡号',
  `name` varchar(45) DEFAULT NULL COMMENT '姓名',
  `sex` int(11) DEFAULT NULL COMMENT '性别: 男(1) 女(0)',
  `created` int(10) NOT NULL COMMENT '创建日期',
  `level` varchar(45) DEFAULT NULL COMMENT '会员卡等级',
  `preferential_way` varchar(45) DEFAULT NULL COMMENT '优惠方式',
  `blance` decimal(10,2) DEFAULT '0.00' COMMENT '余额',
  `cumulative` decimal(10,2) DEFAULT '0.00' COMMENT '累计消费',
  `status` int(11) DEFAULT '0' COMMENT '状态',
  `phone` varchar(45) NOT NULL COMMENT '会员电话',
  `remark` text COMMENT '备注',
  `modified` int(10) DEFAULT NULL,
  `expire_date` int(10) DEFAULT NULL COMMENT '会员卡过期日期',
  PRIMARY KEY (`id`),
  UNIQUE KEY `app2_membercol_UNIQUE` (`cid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `app2_member_detail`
--

DROP TABLE IF EXISTS `app2_member_detail`;
CREATE TABLE IF NOT EXISTS `app2_member_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mid` int(11) NOT NULL,
  `pay` decimal(10,2) DEFAULT '0.00',
  `re_pay` decimal(10,2) DEFAULT '0.00' COMMENT '充值历史',
  `cumulative` decimal(10,2) DEFAULT '0.00' COMMENT '明细累计',
  `createtime` int(10) NOT NULL DEFAULT '0' COMMENT '消费时间',
  `operate_id` int(11) NOT NULL COMMENT '操作人',
  PRIMARY KEY (`id`),
  KEY `mid_idx` (`mid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `app2_menu`
--

DROP TABLE IF EXISTS `app2_menu`;
CREATE TABLE IF NOT EXISTS `app2_menu` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `app2_news`
--

DROP TABLE IF EXISTS `app2_news`;
CREATE TABLE IF NOT EXISTS `app2_news` (
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `app2_page`
--

DROP TABLE IF EXISTS `app2_page`;
CREATE TABLE IF NOT EXISTS `app2_page` (
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `title` varchar(160) NOT NULL,
  `keywords` varchar(40) NOT NULL,
  `content` text NOT NULL,
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  KEY `catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `app2_setting`
--

DROP TABLE IF EXISTS `app2_setting`;
CREATE TABLE IF NOT EXISTS `app2_setting` (
  `key` varchar(50) NOT NULL,
  `value` varchar(5000) DEFAULT '',
  PRIMARY KEY (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `app2_times`
--

DROP TABLE IF EXISTS `app2_times`;
CREATE TABLE IF NOT EXISTS `app2_times` (
  `username` char(40) NOT NULL,
  `ip` char(15) NOT NULL,
  `logintime` int(10) unsigned NOT NULL DEFAULT '0',
  `isadmin` tinyint(1) NOT NULL DEFAULT '0',
  `times` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`username`,`isadmin`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `app2_member_detail`
--
ALTER TABLE `app2_member_detail`
  ADD CONSTRAINT `mid` FOREIGN KEY (`mid`) REFERENCES `app2_member` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;