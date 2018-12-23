/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50540
Source Host           : localhost:3306
Source Database       : jcbc

Target Server Type    : MYSQL
Target Server Version : 50540
File Encoding         : 65001

Date: 2018-11-29 20:15:03
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sysusers
-- ----------------------------
DROP TABLE IF EXISTS `sysusers`;
CREATE TABLE `sysusers` (
  `usid` varchar(32) NOT NULL COMMENT '用户系统编号',
  `usname` varchar(128) NOT NULL COMMENT '系统用户名',
  `password` varchar(512) NOT NULL COMMENT '密码',
  PRIMARY KEY (`usid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sysusers
-- ----------------------------
INSERT INTO `sysusers` VALUES ('9c166f7dec6311e892995658ba99cf45', 'admin', 'c56d0e9a7ccec67b4ea131655038d604');
