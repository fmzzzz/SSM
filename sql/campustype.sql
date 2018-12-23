/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50540
Source Host           : localhost:3306
Source Database       : jcbc

Target Server Type    : MYSQL
Target Server Version : 50540
File Encoding         : 65001

Date: 2018-11-29 20:14:25
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for campustype
-- ----------------------------
DROP TABLE IF EXISTS `campustype`;
CREATE TABLE `campustype` (
  `ctypeid` varchar(32) NOT NULL COMMENT '学校类型表系统编号',
  `ctypenum` int(1) NOT NULL COMMENT '类型编号',
  `ctypename` varchar(32) NOT NULL COMMENT '类型名称',
  PRIMARY KEY (`ctypeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of campustype
-- ----------------------------
INSERT INTO `campustype` VALUES ('66545341f21c11e8885c34c74a1baa03', '1', '公办学校');
INSERT INTO `campustype` VALUES ('802f652df21c11e8885c34c74a1baa03', '2', '民办学校');
