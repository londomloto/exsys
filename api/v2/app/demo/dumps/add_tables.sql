/*
Navicat MySQL Data Transfer

Source Server         : mysql@go.vm
Source Server Version : 50554
Source Host           : 192.168.56.5:3306
Source Database       : wssales

Target Server Type    : MYSQL
Target Server Version : 50554
File Encoding         : 65001

Date: 2017-10-10 16:15:19
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sys_users_menus
-- ----------------------------
DROP TABLE IF EXISTS `sys_users_menus`;
CREATE TABLE `sys_users_menus` (
  `sum_id` int(11) NOT NULL AUTO_INCREMENT,
  `sum_su_id` int(11) DEFAULT NULL,
  `sum_smn_id` int(11) DEFAULT NULL,
  `sum_selected` int(1) DEFAULT '0',
  PRIMARY KEY (`sum_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_users_menus
-- ----------------------------
INSERT INTO `sys_users_menus` VALUES ('1', '1', '1', '1');
INSERT INTO `sys_users_menus` VALUES ('3', '1', '4', '1');
INSERT INTO `sys_users_menus` VALUES ('4', '1', '17', '1');
INSERT INTO `sys_users_menus` VALUES ('5', '1', '7', '1');
INSERT INTO `sys_users_menus` VALUES ('6', '1', '3', '1');

-- ----------------------------
-- Table structure for sys_users_permissions
-- ----------------------------
DROP TABLE IF EXISTS `sys_users_permissions`;
CREATE TABLE `sys_users_permissions` (
  `sup_id` int(11) NOT NULL AUTO_INCREMENT,
  `sup_su_id` int(11) DEFAULT NULL,
  `sup_smc_id` int(11) DEFAULT NULL,
  `sup_selected` int(1) DEFAULT '0',
  PRIMARY KEY (`sup_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_users_permissions
-- ----------------------------
INSERT INTO `sys_users_permissions` VALUES ('1', '1', '22', '1');
INSERT INTO `sys_users_permissions` VALUES ('2', '1', '23', '1');
INSERT INTO `sys_users_permissions` VALUES ('3', '1', '20', '1');
INSERT INTO `sys_users_permissions` VALUES ('4', '1', '21', '1');
INSERT INTO `sys_users_permissions` VALUES ('5', '1', '26', '1');
INSERT INTO `sys_users_permissions` VALUES ('6', '1', '27', '1');
INSERT INTO `sys_users_permissions` VALUES ('7', '1', '28', '1');
