/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50540
Source Host           : localhost:3306
Source Database       : jcbc

Target Server Type    : MYSQL
Target Server Version : 50540
File Encoding         : 65001

Date: 2018-11-29 20:14:40
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for menus
-- ----------------------------
DROP TABLE IF EXISTS `menus`;
CREATE TABLE `menus` (
  `menuid` varchar(32) NOT NULL COMMENT '菜单表系统编号',
  `menuname` varchar(255) NOT NULL COMMENT '菜单名称',
  `murl` varchar(255) DEFAULT NULL COMMENT '菜单路径',
  `mpid` varchar(32) DEFAULT NULL COMMENT '父级菜单系统编号',
  `mpath` varchar(3000) DEFAULT NULL COMMENT '菜单路径使用@进行分割',
  PRIMARY KEY (`menuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of menus
-- ----------------------------
INSERT INTO `menus` VALUES ('2992c284ec8911e892995658ba99cf45', '教师备课', null, '8e1fa59cec8811e892995658ba99cf45', '8e1fa59cec8811e892995658ba99cf45@2992c284ec8911e892995658ba99cf45');
INSERT INTO `menus` VALUES ('50e131baec8911e892995658ba99cf45', '学校管理', '', '0', null);
INSERT INTO `menus` VALUES ('8e1fa59cec8811e892995658ba99cf45', '教师管理', '', '0', '');
INSERT INTO `menus` VALUES ('a21a8940ec8911e892995658ba99cf45', '学校管理', 'campusManager.htm', '50e131baec8911e892995658ba99cf45', '50e131baec8911e892995658ba99cf45@a21a8940ec8911e892995658ba99cf45');
INSERT INTO `menus` VALUES ('bde7994eee7411e892995658ba99cf45', '教务处', null, '0', null);
INSERT INTO `menus` VALUES ('c757f3ebec8811e892995658ba99cf45', '教师档案', null, '8e1fa59cec8811e892995658ba99cf45', '8e1fa59cec8811e892995658ba99cf45@c757f3ebec8811e892995658ba99cf45');
INSERT INTO `menus` VALUES ('dd21facbee7411e892995658ba99cf45', '教研活动', null, 'bde7994eee7411e892995658ba99cf45', 'bde7994eee7411e892995658ba99cf45@dd21facbee7411e892995658ba99cf45');
INSERT INTO `menus` VALUES ('f4393697ec8811e892995658ba99cf45', '教师信息', null, '8e1fa59cec8811e892995658ba99cf45', '8e1fa59cec8811e892995658ba99cf45@f4393697ec8811e892995658ba99cf45');
