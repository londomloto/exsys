/*
Navicat MySQL Data Transfer

Source Server         : ws.io
Source Server Version : 50554
Source Host           : 192.168.56.5:3306
Source Database       : demo

Target Server Type    : MYSQL
Target Server Version : 50554
File Encoding         : 65001

Date: 2017-06-13 10:27:56
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `kanban`
-- ----------------------------
DROP TABLE IF EXISTS `kanban`;
CREATE TABLE `kanban` (
  `panel_id` int(11) NOT NULL AUTO_INCREMENT,
  `panel_color` varchar(100) DEFAULT NULL,
  `panel_card_filter` varchar(100) DEFAULT NULL,
  `panel_title` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`panel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of kanban
-- ----------------------------
INSERT INTO `kanban` VALUES ('1', 'pink', 'isCardFilterTodo', 'To Do');
INSERT INTO `kanban` VALUES ('2', 'blue', 'isCardFilterDoing', 'Doing');
INSERT INTO `kanban` VALUES ('3', 'green', 'isCardFilterDone', 'Done');

-- ----------------------------
-- Table structure for `kanban_category`
-- ----------------------------
DROP TABLE IF EXISTS `kanban_category`;
CREATE TABLE `kanban_category` (
  `kc_id` int(11) NOT NULL AUTO_INCREMENT,
  `kc_ks_id` int(50) DEFAULT NULL,
  `kc_title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`kc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of kanban_category
-- ----------------------------
INSERT INTO `kanban_category` VALUES ('1', '1', 'Anggur');
INSERT INTO `kanban_category` VALUES ('2', '1', 'Pisang');
INSERT INTO `kanban_category` VALUES ('3', '1', 'Jambu');
INSERT INTO `kanban_category` VALUES ('10', null, 'Anggur');
INSERT INTO `kanban_category` VALUES ('11', null, 'Pisang');
INSERT INTO `kanban_category` VALUES ('12', null, 'Jambu');
INSERT INTO `kanban_category` VALUES ('13', null, 'Anggur');
INSERT INTO `kanban_category` VALUES ('14', null, 'Pisang');
INSERT INTO `kanban_category` VALUES ('15', null, 'Jambu');
INSERT INTO `kanban_category` VALUES ('46', '4', 'jeruk');
INSERT INTO `kanban_category` VALUES ('47', '4', 'Bakso');
INSERT INTO `kanban_category` VALUES ('48', '4', 'Mangga');
INSERT INTO `kanban_category` VALUES ('49', '4', 'Aper');

-- ----------------------------
-- Table structure for `kanban_setting`
-- ----------------------------
DROP TABLE IF EXISTS `kanban_setting`;
CREATE TABLE `kanban_setting` (
  `ks_id` int(11) NOT NULL AUTO_INCREMENT,
  `ks_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ks_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of kanban_setting
-- ----------------------------
INSERT INTO `kanban_setting` VALUES ('1', 'Test 1');
INSERT INTO `kanban_setting` VALUES ('4', 'Test 2');

-- ----------------------------
-- Table structure for `kanban_status`
-- ----------------------------
DROP TABLE IF EXISTS `kanban_status`;
CREATE TABLE `kanban_status` (
  `kst_id` int(11) NOT NULL AUTO_INCREMENT,
  `kst_status` varchar(100) DEFAULT NULL,
  `kst_kc_id` varchar(100) DEFAULT NULL,
  `kst_ks_id` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`kst_id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of kanban_status
-- ----------------------------
INSERT INTO `kanban_status` VALUES ('1', 'a', '1', '1');
INSERT INTO `kanban_status` VALUES ('2', 'b', '1', '1');
INSERT INTO `kanban_status` VALUES ('3', 'c', '1', '1');
INSERT INTO `kanban_status` VALUES ('4', 'a', '2', '1');
INSERT INTO `kanban_status` VALUES ('5', 'b', '2', '1');
INSERT INTO `kanban_status` VALUES ('6', 'a', '3', '1');
INSERT INTO `kanban_status` VALUES ('7', 'a', '4', '2');
INSERT INTO `kanban_status` VALUES ('8', 'b', '4', '2');
INSERT INTO `kanban_status` VALUES ('9', 'c', '4', '2');
INSERT INTO `kanban_status` VALUES ('10', 'a', '5', '2');
INSERT INTO `kanban_status` VALUES ('11', 'b', '5', '2');
INSERT INTO `kanban_status` VALUES ('12', 'a', '6', '2');
INSERT INTO `kanban_status` VALUES ('13', 'a', '7', '3');
INSERT INTO `kanban_status` VALUES ('14', 'b', '7', '3');
INSERT INTO `kanban_status` VALUES ('15', 'c', '7', '3');
INSERT INTO `kanban_status` VALUES ('16', 'a', '8', '3');
INSERT INTO `kanban_status` VALUES ('17', 'b', '8', '3');
INSERT INTO `kanban_status` VALUES ('18', 'a', '9', '3');
INSERT INTO `kanban_status` VALUES ('19', 'a', '10', null);
INSERT INTO `kanban_status` VALUES ('20', 'b', '10', null);
INSERT INTO `kanban_status` VALUES ('21', 'c', '10', null);
INSERT INTO `kanban_status` VALUES ('22', 'a', '11', null);
INSERT INTO `kanban_status` VALUES ('23', 'b', '11', null);
INSERT INTO `kanban_status` VALUES ('24', 'a', '12', null);
INSERT INTO `kanban_status` VALUES ('25', 'a', '13', null);
INSERT INTO `kanban_status` VALUES ('26', 'b', '13', null);
INSERT INTO `kanban_status` VALUES ('27', 'c', '13', null);
INSERT INTO `kanban_status` VALUES ('28', 'a', '14', null);
INSERT INTO `kanban_status` VALUES ('29', 'b', '14', null);
INSERT INTO `kanban_status` VALUES ('30', 'a', '15', null);
INSERT INTO `kanban_status` VALUES ('31', 'c', '16', '4');
INSERT INTO `kanban_status` VALUES ('32', 'c', '17', '4');
INSERT INTO `kanban_status` VALUES ('33', 'a', '17', '4');
INSERT INTO `kanban_status` VALUES ('34', 'c', '18', '4');
INSERT INTO `kanban_status` VALUES ('35', 'c', '19', '4');
INSERT INTO `kanban_status` VALUES ('36', 'a', '19', '4');
INSERT INTO `kanban_status` VALUES ('37', 'c', '20', '4');
INSERT INTO `kanban_status` VALUES ('38', 'c', '21', '4');
INSERT INTO `kanban_status` VALUES ('39', 'a', '21', '4');
INSERT INTO `kanban_status` VALUES ('40', 'c', '22', '4');
INSERT INTO `kanban_status` VALUES ('41', 'c', '23', '4');
INSERT INTO `kanban_status` VALUES ('42', 'a', '23', '4');
INSERT INTO `kanban_status` VALUES ('43', 'c', '24', '4');
INSERT INTO `kanban_status` VALUES ('44', 'b', '24', '4');
INSERT INTO `kanban_status` VALUES ('45', 'c', '25', '4');
INSERT INTO `kanban_status` VALUES ('46', 'a', '25', '4');
INSERT INTO `kanban_status` VALUES ('47', 'c', '26', '4');
INSERT INTO `kanban_status` VALUES ('48', 'c', '27', '4');
INSERT INTO `kanban_status` VALUES ('49', 'a', '27', '4');
INSERT INTO `kanban_status` VALUES ('50', 'c', '28', '4');
INSERT INTO `kanban_status` VALUES ('51', 'c', '29', '4');
INSERT INTO `kanban_status` VALUES ('52', 'a', '29', '4');
INSERT INTO `kanban_status` VALUES ('53', 'c', '30', '4');
INSERT INTO `kanban_status` VALUES ('54', 'c', '31', '4');
INSERT INTO `kanban_status` VALUES ('55', 'a', '31', '4');
INSERT INTO `kanban_status` VALUES ('56', 'b', '36', '4');
INSERT INTO `kanban_status` VALUES ('57', 'b', '40', '4');
INSERT INTO `kanban_status` VALUES ('58', 'b', '44', '4');
INSERT INTO `kanban_status` VALUES ('59', 'b', '48', '4');
