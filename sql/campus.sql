/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50540
Source Host           : localhost:3306
Source Database       : jcbc

Target Server Type    : MYSQL
Target Server Version : 50540
File Encoding         : 65001

Date: 2018-11-29 20:14:14
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for campus
-- ----------------------------
DROP TABLE IF EXISTS `campus`;
CREATE TABLE `campus` (
  `csid` varchar(32) NOT NULL COMMENT '学校系统编号',
  `pccode` varchar(2) NOT NULL COMMENT '所属省份',
  `ctcode` varchar(8) NOT NULL COMMENT '所属市',
  `aacode` varchar(16) NOT NULL COMMENT '所属县区',
  `csname` varchar(512) NOT NULL COMMENT '学校名称',
  `cscode` varchar(16) NOT NULL COMMENT '学校标识码',
  `createyear` varchar(128) NOT NULL COMMENT '创建年份',
  `csotname` varchar(512) NOT NULL COMMENT '学校别名',
  `csproerty` int(2) NOT NULL COMMENT '学校性质：1公办2民办',
  `csaddres` varchar(1024) NOT NULL COMMENT '学校地址',
  `cstelnum` varchar(64) NOT NULL COMMENT '学校电话',
  `principal` varchar(64) NOT NULL COMMENT '校长名称',
  `prnum` varchar(16) NOT NULL COMMENT '校长电话',
  `charger` varchar(64) DEFAULT NULL COMMENT '分管领导姓名',
  `chagejob` varchar(64) DEFAULT NULL COMMENT '分管领导职务',
  `chrgtelnum` varchar(16) DEFAULT NULL COMMENT '分管领导电话',
  `email` varchar(32) DEFAULT NULL COMMENT '学校邮箱',
  `postcode` varchar(32) DEFAULT NULL COMMENT '邮政编码',
  `csintro` varchar(4000) DEFAULT NULL COMMENT '学校简介',
  `addtime` varchar(128) NOT NULL COMMENT '添加时间',
  `other1` varchar(1024) DEFAULT NULL COMMENT '备用字段1',
  `other2` varchar(1024) DEFAULT NULL COMMENT '备用字段2',
  `other3` varchar(1024) DEFAULT NULL COMMENT '备用字段3',
  PRIMARY KEY (`csid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
