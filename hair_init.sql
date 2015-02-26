-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Feb 26, 2015 at 09:15 AM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Dumping data for table `app2_admin`
--

INSERT INTO `app2_admin` (`userid`, `username`, `password`, `roleid`, `encrypt`, `lastloginip`, `lastlogintime`, `email`, `realname`) VALUES
(1, 'xin', '9e763177cecfba071e3b8910b99a7ce2', 1, 'LmnJES', '127.0.0.1', 1423843091, 'lixin8611@gmail.com', '');

--
-- Dumping data for table `app2_admin_role`
--

INSERT INTO `app2_admin_role` (`roleid`, `rolename`, `description`, `listorder`, `disabled`) VALUES
(1, '超级管理员', '超级管理员', 0, 0),
(2, '普通用户', '普通用户', 0, 0);


--
-- Dumping data for table `app2_item_data`
--

INSERT INTO `app2_item_data` (`group`, `name`, `value`, `editor`) VALUES
('会员级别', '初级会员', '123', 'text'),
('会员级别', '中级会员', '223', 'text'),
('会员级别', '高级会员', '323', 'text'),
('员工工种', '助理', '0.92', 'text'),
('员工工种', '发型师', '0.94', 'text'),
('员工工种', '中级发型师', '0.94', 'text'),
('员工工种', '高级发型师', '0.94', 'text'),
('美发项目', '洗', '0.94', 'text'),
('美发项目', '剪', '0.94', 'text'),
('美发项目', '吹', '0.9', 'text'),
('美发项目', '染发', '0.9', 'text'),
('美发项目', '烫发', '0.9', 'text'),
('员工级别', '级别1', '0.9', 'text'),
('员工级别', '级别2', '0.9', 'text'),
('员工级别', '级别3', '0.9', 'text'),
('门店', '门店1', '0.9', 'text'),
('门店', '门店2', '0.9', 'text'),
('门店', '门店3', '0.9', 'text');

--
-- Dumping data for table `app2_menu`
--

INSERT INTO `app2_menu` (`id`, `name`, `parentid`, `c`, `a`, `data`, `is_system`, `listorder`, `display`) VALUES
(1, '我的面板', 0, 'Admin', 'public_top', '', 1, 1, '1'),
(2, '系统设置', 0, 'Setting', 'top', '', 0, 2, '1'),
(3, '内容管理', 0, 'Content', 'top', '', 0, 3, '1'),
(4, '用户管理', 0, 'Member', 'top', '', 0, 4, '1'),
(5, '后台管理', 0, 'System', 'top', '', 0, 5, '1'),
(6, '个人信息', 1, 'Admin', 'public_left', '', 1, 0, '1'),
(7, '修改密码', 6, 'Admin', 'public_editPwd', '', 1, 1, '1'),
(8, '修改个人信息', 6, 'Admin', 'public_editInfo', '', 1, 0, '1'),
(9, '系统设置', 2, 'Setting', 'left', '', 0, 1, '1'),
(10, '站点设置', 9, 'Setting', 'site', '', 0, 1, '1'),
(11, '管理员设置', 2, 'Admin', 'left', '', 0, 2, '1'),
(12, '管理员管理', 11, 'Admin', 'memberList', '', 0, 1, '1'),
(13, '角色管理', 11, 'Admin', 'roleList', '', 0, 2, '1'),
(14, '后台管理', 5, 'System', 'left', '', 0, 1, '1'),
(15, '日志管理', 14, 'System', 'logList', '', 0, 1, '1'),
(16, '菜单管理', 14, 'System', 'menuList', '', 0, 2, '1'),
(17, '查看菜单', 16, 'System', 'menuView', '', 0, 0, '1'),
(18, '添加菜单', 16, 'System', 'menuAdd', '', 0, 0, '1'),
(19, '修改菜单', 16, 'System', 'menuEdit', '', 0, 0, '1'),
(20, '删除菜单', 16, 'System', 'menuDelete', '', 0, 0, '1'),
(21, '菜单排序', 16, 'System', 'menuOrder', '', 0, 0, '1'),
(22, '查看日志', 15, 'System', 'logView', '', 0, 0, '1'),
(23, '删除日志', 15, 'System', 'logDelete', '', 0, 0, '1'),
(24, '查看管理员', 12, 'Admin', 'memberView', '', 0, 0, '1'),
(25, '添加管理员', 12, 'Admin', 'memberAdd', '', 0, 0, '1'),
(26, '编辑管理员', 12, 'Admin', 'memberEdit', '', 0, 0, '1'),
(27, '删除管理员', 12, 'Admin', 'memberDelete', '', 0, 0, '1'),
(28, '查看角色', 13, 'Admin', 'roleView', '', 0, 0, '1'),
(29, '添加角色', 13, 'Admin', 'roleAdd', '', 0, 0, '1'),
(30, '编辑角色', 13, 'Admin', 'roleEdit', '', 0, 0, '1'),
(31, '删除角色', 13, 'Admin', 'roleDelete', '', 0, 0, '1'),
(32, '角色排序', 13, 'Admin', 'roleOrder', '', 0, 0, '1'),
(33, '权限设置', 13, 'Admin', 'roleSet', '', 0, 0, '1'),
(34, '发布管理', 3, 'Content', 'left', '', 0, 0, '1'),
(35, '内容管理', 34, 'Content', 'index', '', 0, 0, '1'),
(36, '栏目管理', 34, 'Category', 'categoryList', '', 0, 0, '1'),
(37, '查看栏目', 36, 'Category', 'categoryView', '', 0, 0, '1'),
(38, '添加栏目', 36, 'Category', 'categoryAdd', '', 0, 0, '1'),
(39, '编辑栏目', 36, 'Category', 'categoryEdit', '', 0, 0, '1'),
(40, '删除栏目', 36, 'Category', 'categoryDelete', '', 0, 0, '1'),
(41, '栏目排序', 36, 'Category', 'categoryOrder', '', 0, 0, '1'),
(42, '用户中心', 4, 'Member', 'left', '', 0, 0, '1'),
(43, '用户列表', 42, 'Member', 'memberList', '', 0, 0, '1'),
(44, '用户分类', 42, 'Member', 'typeList', '', 0, 0, '1'),
(58, '统计', 0, 'top', 'top', '', 0, 0, '1'),
(60, '报表', 58, 'top', 'top', '', 0, 0, '1'),
(61, '收入总览', 60, 'Statistics', 'statisticsList', '', 0, 0, '1'),
(62, '统计图表', 60, 'Statistics', 'trendChart', '', 0, 0, '1');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
