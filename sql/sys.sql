/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50540
Source Host           : localhost:3306
Source Database       : jcbc

Target Server Type    : MYSQL
Target Server Version : 50540
File Encoding         : 65001

Date: 2018-11-29 20:14:56
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sys
-- ----------------------------
DROP TABLE IF EXISTS `sys`;
CREATE TABLE `sys` (
  `sysid` varchar(32) NOT NULL COMMENT '系统信息系统编号',
  `sysvalue` varchar(1024) NOT NULL,
  PRIMARY KEY (`sysid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys
-- ----------------------------
INSERT INTO `sys` VALUES ('23232323434322345654655345343245', '石阡县教育云平台');
