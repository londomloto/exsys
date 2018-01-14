/*
 Navicat Premium Data Transfer

 Source Server         : mysqlpc
 Source Server Type    : MySQL
 Source Server Version : 50718
 Source Host           : localhost
 Source Database       : db_exsys

 Target Server Type    : MySQL
 Target Server Version : 50718
 File Encoding         : utf-8

 Date: 01/15/2018 02:31:45 AM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `ax_api_data`
-- ----------------------------
DROP TABLE IF EXISTS `ax_api_data`;
CREATE TABLE `ax_api_data` (
  `ref_id` int(11) NOT NULL AUTO_INCREMENT,
  `ref_id_adv` varchar(255) DEFAULT NULL,
  `ref_type` varchar(255) DEFAULT NULL,
  `ref_data` text,
  `ref_status` int(11) DEFAULT NULL,
  `ref_date` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`ref_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

SET FOREIGN_KEY_CHECKS = 1;
