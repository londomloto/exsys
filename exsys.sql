/*
Navicat MySQL Data Transfer

Source Server         : mysql@127.0.0.1
Source Server Version : 50626
Source Host           : 127.0.0.1:3306
Source Database       : exsys

Target Server Type    : MYSQL
Target Server Version : 50626
File Encoding         : 65001

Date: 2017-12-18 17:34:47
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for accounts
-- ----------------------------
DROP TABLE IF EXISTS `accounts`;
CREATE TABLE `accounts` (
  `acc_id` int(11) NOT NULL AUTO_INCREMENT,
  `acc_code` varchar(255) DEFAULT NULL,
  `acc_name` varchar(255) DEFAULT NULL,
  `acc_parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`acc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of accounts
-- ----------------------------
INSERT INTO `accounts` VALUES ('1', '611415', 'Housing Rent - Staff', '0');
INSERT INTO `accounts` VALUES ('2', '611416', 'Relocation Expense Claim - Staff', '0');
INSERT INTO `accounts` VALUES ('3', '611699', 'Other personnel related cost (Others)', '0');
INSERT INTO `accounts` VALUES ('4', '613101', 'Travelling Domestic - Air, Train, Bus, Travel, or Other Tick', '0');
INSERT INTO `accounts` VALUES ('5', '613102', 'Travelling Domestic - Gasoline', '0');
INSERT INTO `accounts` VALUES ('6', '613103', 'Travelling Domestic - Taxi, Parking, Toll and other transpor', '0');
INSERT INTO `accounts` VALUES ('7', '613104', 'Travelling Domestic - Hotels and Other Accomodation', '0');
INSERT INTO `accounts` VALUES ('8', '613105', 'Travelling Domestic - Meals, Food, and Beverage', '0');
INSERT INTO `accounts` VALUES ('9', '613199', 'Travelling Domestic - Other Expense related to Travelling', '0');
INSERT INTO `accounts` VALUES ('10', '613201', 'Travelling Overseas - Taxi, Parking, Toll and other transpor', '0');
INSERT INTO `accounts` VALUES ('11', '613203', 'Travelling Overseas - Hotels and Other Accomodation', '0');
INSERT INTO `accounts` VALUES ('12', '613204', 'Travelling Overseas - Meals, Food, and Beverage', '0');
INSERT INTO `accounts` VALUES ('13', '613299', 'Travelling Overseas - Other Expense related to Travelling', '0');
INSERT INTO `accounts` VALUES ('14', '614301', 'Farm Field Days', '0');
INSERT INTO `accounts` VALUES ('15', '614302', 'Counseling Activity', '0');
INSERT INTO `accounts` VALUES ('16', '614303', 'Comparative Study', '0');
INSERT INTO `accounts` VALUES ('17', '614306', 'Clinical Seed (Others)', '0');
INSERT INTO `accounts` VALUES ('18', '614399', 'Other Sales Activity Promotion Expense (Others)', '0');
INSERT INTO `accounts` VALUES ('19', '617101', 'Expense for Mobile Telephony', '0');
INSERT INTO `accounts` VALUES ('20', '619301', 'Office Supplier', '0');
INSERT INTO `accounts` VALUES ('21', '619401', 'Printing and Photocopying', '0');
INSERT INTO `accounts` VALUES ('22', '619403', 'Couriers', '0');
INSERT INTO `accounts` VALUES ('23', '619405', 'Stamp Duty (Others)', '0');
INSERT INTO `accounts` VALUES ('24', '620203', 'External Meeting & Entertainment', '0');
INSERT INTO `accounts` VALUES ('25', '614304', 'Mini Expo', '0');
INSERT INTO `accounts` VALUES ('26', '614305', 'Enrichment', '0');

-- ----------------------------
-- Table structure for advance_history
-- ----------------------------
DROP TABLE IF EXISTS `advance_history`;
CREATE TABLE `advance_history` (
  `adv_history_id` int(10) NOT NULL AUTO_INCREMENT,
  `category` varchar(50) DEFAULT 'advance',
  `id_adv` varchar(100) NOT NULL,
  `status_id` int(10) NOT NULL,
  `user_act` int(100) NOT NULL,
  `date` datetime NOT NULL,
  `notes` text,
  PRIMARY KEY (`adv_history_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of advance_history
-- ----------------------------
INSERT INTO `advance_history` VALUES ('1', 'advance', '1', '2', '1', '2017-11-17 02:46:15', '');
INSERT INTO `advance_history` VALUES ('2', 'advance', '1', '4', '4', '2017-11-17 02:46:38', '');
INSERT INTO `advance_history` VALUES ('3', 'advance', '1', '5', '8', '2017-11-17 03:11:16', '');
INSERT INTO `advance_history` VALUES ('4', 'advance', '3', '2', '1', '2017-11-17 03:31:06', '');
INSERT INTO `advance_history` VALUES ('5', 'advance', '3', '10', '4', '2017-11-17 03:39:16', '');
INSERT INTO `advance_history` VALUES ('6', 'advance', '3', '2', '1', '2017-11-17 03:41:10', '');
INSERT INTO `advance_history` VALUES ('7', 'advance', '3', '4', '4', '2017-11-17 03:46:56', '');
INSERT INTO `advance_history` VALUES ('8', 'advance', '3', '5', '8', '2017-11-17 03:49:25', '');
INSERT INTO `advance_history` VALUES ('9', 'advance', '3', '4', '4', '2017-11-17 04:19:23', '');
INSERT INTO `advance_history` VALUES ('10', 'advance', '4', '2', '1', '2017-11-17 09:18:54', '');
INSERT INTO `advance_history` VALUES ('11', 'advance', '4', '4', '4', '2017-11-17 09:20:56', '');
INSERT INTO `advance_history` VALUES ('12', 'advance', '4', '5', '8', '2017-11-17 11:58:08', 'OK');

-- ----------------------------
-- Table structure for advance_item
-- ----------------------------
DROP TABLE IF EXISTS `advance_item`;
CREATE TABLE `advance_item` (
  `advance_item_id` int(10) NOT NULL AUTO_INCREMENT,
  `id_adv` int(10) NOT NULL,
  `description` varchar(255) NOT NULL,
  `currency_id` int(10) NOT NULL,
  `currency_rate` double(15,6) DEFAULT NULL,
  `amounts` double(15,2) NOT NULL,
  `created_date` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`advance_item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of advance_item
-- ----------------------------
INSERT INTO `advance_item` VALUES ('1', '1', 'Biaya transport', '1', '1.000000', '1250000.00', '2017-11-17 02:46:02', '1', '2017-11-17 03:09:43', '8');
INSERT INTO `advance_item` VALUES ('2', '1', 'Biaya makan dan minum', '1', '1.000000', '2500000.00', '2017-11-17 02:46:12', '1', '2017-11-17 03:09:11', '8');
INSERT INTO `advance_item` VALUES ('3', '2', 'Item A', '1', '1.000000', '500000.00', '2017-11-17 03:23:28', '1', null, null);
INSERT INTO `advance_item` VALUES ('4', '2', 'Item B', '1', '1.000000', '750000.00', '2017-11-17 03:23:38', '1', null, null);
INSERT INTO `advance_item` VALUES ('5', '3', 'Item A', '1', '1.000000', '1500000.00', '2017-11-17 03:25:09', '1', null, null);
INSERT INTO `advance_item` VALUES ('6', '4', 'Item A', '1', '1.000000', '5000000.00', '2017-11-17 09:17:33', '1', null, null);

-- ----------------------------
-- Table structure for advance_item_history
-- ----------------------------
DROP TABLE IF EXISTS `advance_item_history`;
CREATE TABLE `advance_item_history` (
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime DEFAULT NULL,
  `advance_item_id` int(10) DEFAULT NULL,
  `id_adv` int(10) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `currency_id` int(10) DEFAULT NULL,
  `currency_rate` double(15,6) DEFAULT NULL,
  `amounts` double(15,2) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`history_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of advance_item_history
-- ----------------------------
INSERT INTO `advance_item_history` VALUES ('5', '2017-11-17 03:03:14', '1', '1', 'Item A', '1', '1.000000', '7500000.00', '2017-11-17 02:46:02', '1', null, null);
INSERT INTO `advance_item_history` VALUES ('6', '2017-11-17 03:07:57', '1', '1', 'Item A', '1', '1.000000', '1500000.00', '2017-11-17 02:46:02', '1', '2017-11-17 03:03:14', '8');
INSERT INTO `advance_item_history` VALUES ('7', '2017-11-17 03:08:53', '2', '1', 'Item B', '1', '1.000000', '1000000.00', '2017-11-17 02:46:12', '1', null, null);
INSERT INTO `advance_item_history` VALUES ('8', '2017-11-17 03:09:11', '2', '1', 'Item B', '1', '1.000000', '2500000.00', '2017-11-17 02:46:12', '1', '2017-11-17 03:08:53', '8');
INSERT INTO `advance_item_history` VALUES ('9', '2017-11-17 03:09:43', '1', '1', 'Item A', '1', '1.000000', '1250000.00', '2017-11-17 02:46:02', '1', '2017-11-17 03:07:57', '8');

-- ----------------------------
-- Table structure for advance_refund
-- ----------------------------
DROP TABLE IF EXISTS `advance_refund`;
CREATE TABLE `advance_refund` (
  `refund_id` int(11) NOT NULL AUTO_INCREMENT,
  `id_adv` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `currency_id` int(11) DEFAULT NULL,
  `amounts` double(15,2) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `attachment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`refund_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of advance_refund
-- ----------------------------

-- ----------------------------
-- Table structure for advance_table
-- ----------------------------
DROP TABLE IF EXISTS `advance_table`;
CREATE TABLE `advance_table` (
  `id_adv` int(11) NOT NULL AUTO_INCREMENT,
  `adv_no` varchar(50) NOT NULL,
  `subject_adv` varchar(150) NOT NULL,
  `date` datetime NOT NULL,
  `type` int(11) DEFAULT NULL,
  `purpose` int(11) DEFAULT NULL,
  `other_purpose` text,
  `attachment` text,
  `id_user` int(11) NOT NULL,
  `received_by` varchar(50) DEFAULT NULL,
  `received_date` datetime DEFAULT NULL,
  `date_end` date NOT NULL,
  `date_start` date NOT NULL,
  `status` int(11) NOT NULL,
  `refund_status` int(11) DEFAULT '1',
  `amounts` double(15,2) NOT NULL,
  `is_open` int(1) DEFAULT '0',
  PRIMARY KEY (`id_adv`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of advance_table
-- ----------------------------
INSERT INTO `advance_table` VALUES ('1', 'ADV#0076', 'Advance Trial', '2017-11-17 02:45:52', '3', '10', null, null, '1', null, null, '2017-11-18', '2017-11-17', '5', '1', '3750000.00', '1');
INSERT INTO `advance_table` VALUES ('2', 'ADV#0077', 'Advance for Trip Bandung', '2017-11-17 03:22:56', '1', '7', null, null, '1', null, null, '2017-11-18', '2017-11-17', '1', '1', '1250000.00', '0');
INSERT INTO `advance_table` VALUES ('3', 'ADV#0078', 'Advance for Trip Semarang', '2017-11-17 03:24:57', '1', '8', null, null, '1', null, null, '2017-11-18', '2017-11-17', '4', '1', '1500000.00', '1');
INSERT INTO `advance_table` VALUES ('4', 'ADV#0079', 'Advance for Trip Bandung', '2017-11-17 09:17:22', '1', '7', null, null, '1', null, null, '2017-11-18', '2017-11-17', '5', '1', '5000000.00', '1');
INSERT INTO `advance_table` VALUES ('5', 'ADV#0080', 'aaa', '2017-11-18 01:23:51', '3', '10', null, null, '8', null, null, '2017-11-19', '2017-11-18', '1', '1', '0.00', '0');

-- ----------------------------
-- Table structure for airport_list
-- ----------------------------
DROP TABLE IF EXISTS `airport_list`;
CREATE TABLE `airport_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `city_name` varchar(300) NOT NULL,
  `airport_code` varchar(10) NOT NULL,
  `airport_name` varchar(300) NOT NULL,
  `country_name` varchar(200) NOT NULL,
  `country_abbrev` varchar(10) NOT NULL,
  `world_area_code` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=212 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of airport_list
-- ----------------------------
INSERT INTO `airport_list` VALUES ('1', 'Aek Godang', 'AEG', 'Aek Godang', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('2', 'Alor Island', 'ARD', 'Alor Island', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('3', 'Amahai', 'AHI', 'Amahai', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('4', 'Ambon', 'AMQ', 'Pattimura', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('5', 'Anggi', 'AGD', 'Anggi', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('6', 'Apalapsili', 'AAS', 'Apalapsili', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('7', 'Arso', 'ARJ', 'Arso', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('8', 'Astraksetra', 'AKQ', 'Gunung Batin', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('9', 'Atambua', 'ABU', 'Atambua', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('10', 'Atauro', 'AUT', 'Atauro', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('11', 'Ayawasi', 'AYW', 'Ayawasi', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('12', 'Babo', 'BXB', 'Babo', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('13', 'Bade', 'BXD', 'Bade', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('14', 'Bajawa', 'BJW', 'Bajawa', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('15', 'Balikpapan', 'BPN', 'Sepingan', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('16', 'Banaina', 'NAF', 'Banaina', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('17', 'Banda Aceh', 'BTJ', 'Blang Bintang', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('18', 'Bandanaira', 'NDA', 'Bandanaira', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('19', 'Bandar Lampung', 'TKG', 'Branti', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('20', 'Bandung', 'BDO', 'Husein Sastranegara', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('21', 'Banjarmasin', 'BDJ', 'Sjamsudin Noor', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('22', 'Batam', 'BTH', 'Hang Nadim', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('23', 'Batom', 'BXM', 'Batom', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('24', 'Batu Licin', 'BTW', 'Batu Licin', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('25', 'Baubau', 'BUW', 'Baubau', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('26', 'Bengkulu', 'BKS', 'Padangkemiling', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('27', 'Benjina', 'BJK', 'Benjina', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('28', 'Berau', 'BEJ', 'Berau', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('29', 'Biak', 'BIK', 'Mokmer', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('30', 'Bima', 'BMU', 'Bima', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('31', 'Bintuni', 'NTI', 'Bintuni', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('32', 'Bokondini', 'BUI', 'Bokondini', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('33', 'Bolaang', 'BJG', 'Bolaang', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('34', 'Bontang', 'BXT', 'Bontang', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('35', 'Bunyu', 'BYQ', 'Bunyu', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('36', 'Buol', 'UOL', 'Buol', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('37', 'Cepu', 'CPF', 'Cepu', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('38', 'Cilacap', 'CXP', 'Tunggul Wulung', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('39', 'Cirebon', 'CBN', 'Penggung', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('40', 'Dabra', 'DRH', 'Dabra', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('41', 'Datadawai', 'DTD', 'Datadawai', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('42', 'Denpasar Bali', 'DPS', 'Ngurah Rai', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('43', 'Dili', 'DIL', 'Comoro', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('44', 'Dobo', 'DOB', 'Dobo Airport', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('45', 'Dumai', 'DUM', 'Pinang Kampai', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('46', 'Elelim', 'ELR', 'Elelim', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('47', 'Enarotali', 'EWI', 'Enarotali', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('48', 'Ende', 'ENE', 'Ende', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('49', 'Ewer', 'EWE', 'Ewer', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('50', 'Fak Fak', 'FKQ', 'Fak Fak', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('51', 'Gag Island', 'GAV', 'Gag Island', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('52', 'Galela', 'GLX', 'Galela', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('53', 'Gebe', 'GEB', 'Gebe', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('54', 'Gorontalo', 'GTO', 'Tolotio', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('55', 'Gunungsitoli', 'GNS', 'Gunungsitoli', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('56', 'Illaga', 'ILA', 'Illaga', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('57', 'Ilu', 'IUL', 'Ilu', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('58', 'Inanwatan', 'INX', 'Inanwatan', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('59', 'Jakarta', 'HLP', 'Halim Perdana Kusuma', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('60', 'Jakarta', 'CGK', 'Soekarno-Hatta Intl', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('61', 'Jambi', 'DJB', 'Sultan Taha Syarifudn', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('62', 'Jayapura', 'DJJ', 'Sentani', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('63', 'Kaimana', 'KNG', 'Kaimana', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('64', 'Kambuaya', 'KBX', 'Kambuaya', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('65', 'Kamur', 'KCD', 'Kamur', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('66', 'Karimunjawa', 'KWB', 'Karimunjawa', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('67', 'Karubaga', 'KBF', 'Karubaga', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('68', 'Kau', 'KAZ', 'Kau', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('69', 'Kebar', 'KEQ', 'Kebar', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('70', 'Keisah', 'KEA', 'Keisah', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('71', 'Kelila', 'LLN', 'Kelila', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('72', 'Keluang', 'KLQ', 'Keluang', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('73', 'Kendari', 'KDI', 'Wolter Monginsidi', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('74', 'Kepi', 'KEI', 'Kepi', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('75', 'Kerinci', 'KRC', 'Kerinci', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('76', 'Ketapang', 'KTG', 'Ketapang', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('77', 'Kimam', 'KMM', 'Kimam', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('78', 'Kokonao', 'KOX', 'Kokonao', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('79', 'Kon', 'KCI', 'Kon', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('80', 'Kotabangun', 'KOD', 'Kotabangun', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('81', 'Kotabaru', 'KBU', 'Kotabaru', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('82', 'Kupang', 'KOE', 'Eltari', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('83', 'Labuan Bajo', 'LBJ', 'Mutiara', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('84', 'Labuha', 'LAH', 'Labuha', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('85', 'Langgur', 'LUV', 'Langgur', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('86', 'Larantuka', 'LKA', 'Larantuka', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('87', 'Lereh', 'LHI', 'Lereh', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('88', 'Lewoleba', 'LWE', 'Lewoleba', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('89', 'Lhok Sukon', 'LSX', 'Lhok Sukon', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('90', 'Lhoksumawe', 'LSW', 'Lhoksumawe', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('91', 'Long Apung', 'LPU', 'Long Apung', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('92', 'Long Bawan', 'LBW', 'Long Bawan', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('93', 'Lunyuk', 'LYK', 'Lunyuk', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('94', 'Luwuk', 'LUW', 'Luwuk', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('95', 'Malang', 'MLG', 'Abdul Rahman Saleh', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('96', 'Maliana', 'MPT', 'Maliana', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('97', 'Mamuju', 'MJU', 'Mamuju', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('98', 'Manado', 'MDC', 'Samratulangi', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('99', 'Mangole', 'MAL', 'Mangole', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('100', 'Mangunjaya', 'MJY', 'Mangunjaya', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('101', 'Manokwari', 'MKW', 'Rendani', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('102', 'Masalembo', 'MSI', 'Masalembo', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('103', 'Masamba', 'MXB', 'Masamba', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('104', 'Matak', 'MWK', 'Matak', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('105', 'Mataram', 'AMI', 'Selaparang', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('106', 'Maumere', 'MOF', 'Waioti', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('107', 'Medan', 'MES', 'Polania', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('108', 'Melangguane', 'MNA', 'Melangguane', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('109', 'Merauke', 'MKQ', 'Mopah', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('110', 'Merdey', 'RDE', 'Merdey', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('111', 'Meulaboh', 'MEQ', 'Seunagan', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('112', 'Mindiptana', 'MDP', 'Mindiptana', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('113', 'Moanamani', 'ONI', 'Moanamani', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('114', 'Pitu, Morotai Island', 'OTI', 'Morotai Island', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('115', 'Muko-Muko', 'MPC', 'Muko-Muko', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('116', 'Mulia', 'LII', 'Mulia', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('117', 'Muting', 'MUF', 'Muting', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('118', 'Nabire', 'NBX', 'Nabire', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('119', 'Naha', 'NAH', 'Naha', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('120', 'Namlea', 'NAM', 'Namlea', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('121', 'Namrole', 'NRE', 'Namrole', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('122', 'Nangapinoh', 'NPO', 'Nangapinoh', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('123', 'Natuna Ranai', 'NTX', 'Natuna Ranai', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('124', 'Numfoor', 'FOO', 'Numfoor', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('125', 'Nunukan', 'NNX', 'Nunukan', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('126', 'Obano', 'OBD', 'Obano', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('127', 'Ocussi', 'OEC', 'Ocussi', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('128', 'Okaba', 'OKQ', 'Okaba', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('129', 'Oksibil', 'OKL', 'Oksibil', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('130', 'Padang', 'PDG', 'Minangkabau International Airport', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('131', 'Palangkaraya', 'PKY', 'Palangkaraya', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('132', 'Palembang', 'PLM', 'Mahmud Badaruddin Ii', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('133', 'Palibelo', 'PBW', 'Palibelo', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('134', 'Palu', 'PLW', 'Mutiara', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('135', 'Pangkalanbuun', 'PKN', 'Pangkalanbuun', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('136', 'Pangkalpinang', 'PGK', 'Pangkalpinang', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('137', 'Pasir Pangarayan', 'PPR', 'Pasir Pangarayan', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('138', 'Pekanbaru', 'PKU', 'Simpang Tiga', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('139', 'Pendopo', 'PDO', 'Pendopo', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('140', 'Pomala', 'PUM', 'Pomala', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('141', 'Pondok Cabe', 'PCB', 'Pondok Cabe', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('142', 'Pontianak', 'PNK', 'Supadio', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('143', 'Poso', 'PSJ', 'Poso', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('144', 'Pulau Panjang', 'PPJ', 'Pulau Panjang', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('145', 'Purwokerto', 'PWL', 'Purwokerto', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('146', 'Putussibau', 'PSU', 'Putussibau', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('147', 'Raha', 'RAQ', 'Sugimanuru', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('148', 'Ransiki', 'RSK', 'Ransiki', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('149', 'Rengat', 'RGT', 'Japura', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('150', 'Rokot', 'RKI', 'Rokot', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('151', 'Roti', 'RTI', 'Roti', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('152', 'Ruteng', 'RTG', 'Ruteng', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('153', 'Sabang', 'SBG', 'Narita', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('154', 'Samarinda', 'SRI', 'Samarinda', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('155', 'Sampit', 'SMQ', 'Sampit', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('156', 'Sanana', 'SQN', 'Sanana', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('157', 'Sanggata', 'SGQ', 'Sanggata', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('158', 'Sangir', 'SAE', 'Sangir', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('159', 'Sarmi', 'ZRM', 'Sarmi', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('160', 'Saumlaki', 'SXK', 'Saumlaki', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('161', 'Sawu', 'SAU', 'Sawu', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('162', 'Semarang', 'SRG', 'Achmad Yani', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('163', 'Senggeh', 'SEH', 'Senggeh', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('164', 'Senggo', 'ZEG', 'Senggo', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('165', 'Senipah', 'SZH', 'Senipah', 'Indonesia', 'ID', '62');
INSERT INTO `airport_list` VALUES ('166', 'Serui', 'ZRI', 'Serui', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('167', 'Sibisa', 'SIW', 'Sibisa', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('168', 'Sinak', 'NKD', 'Sinak', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('169', 'Singkep', 'SIQ', 'Dabo', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('170', 'Sintang', 'SQG', 'Sintang', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('171', 'Sipora', 'RKO', 'Sipora', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('172', 'Solo City', 'SOC', 'Adi Sumarmo', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('173', 'Soroako', 'SQR', 'Soroako', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('174', 'Sorong', 'SOQ', 'Jefman', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('175', 'Steenkool', 'ZKL', 'Steenkool', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('176', 'Suai', 'UAI', 'Suai', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('177', 'Sumbawa', 'SWQ', 'Brang Bidji', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('178', 'Sumenep', 'SUP', 'Trunojoyo', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('179', 'Sungai Pakning', 'SEQ', 'Sungai Pakning', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('180', 'Surabaya', 'SUB', 'Juanda', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('181', 'Taliabu', 'TAX', 'Taliabu', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('182', 'Tambolaka', 'TMC', 'Tjilik Riwut', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('183', 'Tana Toraja', 'TTR', 'Tana Toraja', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('184', 'Tanah Grogot', 'TNB', 'Tanah Grogot', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('185', 'Tanahmerah', 'TMH', 'Tanahmerah', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('186', 'Tanjung Balai', 'TJB', 'Tanjung Balai', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('187', 'Tanjung Pandan', 'TJQ', 'Bulutumbang', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('188', 'Tanjung Pinang', 'TNJ', 'Kidjang', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('189', 'Tanjung Santan', 'TSX', 'Tanjung Santan', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('190', 'Tanjung Selor', 'TJS', 'Tanjung Selor', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('191', 'Tanjung Warukin', 'TJG', 'Tanjung Warukin', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('192', 'Tapaktuan', 'TPK', 'Tapaktuan', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('193', 'Tarakan', 'TRK', 'Tarakan', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('194', 'Tasikmalaya', 'TSY', 'Tasikmalaya', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('195', 'Tembagapura', 'TIM', 'Timika', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('196', 'Teminabuan', 'TXM', 'Teminabuan', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('197', 'Ternate', 'TTE', 'Babullah', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('198', 'Tiom', 'TMY', 'Tiom', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('199', 'Tolitoli', 'TLI', 'Tolitoli', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('200', 'Tumbang Samba', 'TBM', 'Tumbang Samba', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('201', 'Ubrub', 'UBR', 'Ubrub', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('202', 'Ujung Pandang', 'UPG', 'Hasanudin', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('203', 'Viqueque', 'VIQ', 'Viqueque', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('204', 'Wagethe', 'WET', 'Wagethe', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('205', 'Waingapu', 'WGP', 'Waingapu', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('206', 'Wamena', 'WMX', 'Wamena', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('207', 'Waris', 'WAR', 'Waris', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('208', 'Wasior', 'WSR', 'Wasior', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('209', 'Yogyakarta', 'JOG', 'Adisutjipto', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('210', 'Yuruf', 'RUF', 'Yuruf', 'Indonesia', 'ID', '832');
INSERT INTO `airport_list` VALUES ('211', 'Zugapa', 'UGU', 'Zugapa', 'Indonesia', 'ID', '832');

-- ----------------------------
-- Table structure for bpm_diagrams
-- ----------------------------
DROP TABLE IF EXISTS `bpm_diagrams`;
CREATE TABLE `bpm_diagrams` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(50) DEFAULT 'activity',
  `name` varchar(100) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `cover` varchar(255) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bpm_diagrams
-- ----------------------------
INSERT INTO `bpm_diagrams` VALUES ('52', 'Graph.diagram.type.Activity', 'Sales Flow', 'sales-flow', 'No diagram description', '053fb0df419548f726d32e906e0e3a49.jpg', '2017-09-18 09:14:51', null);
INSERT INTO `bpm_diagrams` VALUES ('54', 'Graph.diagram.type.Activity', 'Advance Flow', 'advance-flow', 'No diagram description', '7e1f577e60aacafc8444412aae31d81d.jpg', '2017-10-14 08:20:53', null);

-- ----------------------------
-- Table structure for bpm_forms
-- ----------------------------
DROP TABLE IF EXISTS `bpm_forms`;
CREATE TABLE `bpm_forms` (
  `bf_id` int(11) NOT NULL AUTO_INCREMENT,
  `bf_activity` int(11) DEFAULT NULL,
  `bf_name` varchar(100) DEFAULT NULL,
  `bf_description` varchar(200) DEFAULT NULL,
  `bf_tpl_file` varchar(100) DEFAULT NULL,
  `bf_tpl_orig` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`bf_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bpm_forms
-- ----------------------------
INSERT INTO `bpm_forms` VALUES ('12', '808', 'Site planning upload template', 'No description', '19d1f246a90d48307faeac3fdb31a30e.html', 'upload.html');
INSERT INTO `bpm_forms` VALUES ('13', '809', 'Approval template', 'No description', '6f64be85304054dee25e47629da7c6d3.html', 'approval.html');
INSERT INTO `bpm_forms` VALUES ('14', '813', 'Create SSR template', 'No description', 'fe6683b844815e3e1864772e20fab81c.html', 'create-site-ssr.html');
INSERT INTO `bpm_forms` VALUES ('15', '821', 'Sent Data SSR template', 'No description', '73a72a7da1f948d2ae66541209894d24.html', 'send-data-ssr.html');
INSERT INTO `bpm_forms` VALUES ('16', '819', 'Add far end template', 'No description', '6edbcdb933fae65132a71f658fb14038.html', 'add-far-end.html');
INSERT INTO `bpm_forms` VALUES ('17', '817', 'Review far end template', 'No description', 'dbce59b50bb42ef7997246eea071a6f7.html', 'review-far-end.html');
INSERT INTO `bpm_forms` VALUES ('18', '811', 'Update prodef template', 'No description', '6fb5ce6462d47296620683c9d779ce27.html', 'upload-prodef.html');
INSERT INTO `bpm_forms` VALUES ('19', '825', 'Open Opportunity Form', 'No description', 'e870a901848a6d2859d15f04d6284630.html', 'oportunity_form_2.html');
INSERT INTO `bpm_forms` VALUES ('20', '826', 'Submit Form', 'No description', '86333d1659b9d7010411f1c172ad5f8c.html', 'create-opportunity-form.html');
INSERT INTO `bpm_forms` VALUES ('21', '827', 'Negotiation Form', 'No description', '0308f85453e0a6d519b3d053aef43927.html', 'oportunity_form_2.html');
INSERT INTO `bpm_forms` VALUES ('22', '828', 'PO Form', 'No description', '0f6d07a6c88d6086ff122ced1119c608.html', 'po_form.html');
INSERT INTO `bpm_forms` VALUES ('23', '835', 'DROP Form', 'No description', '6e5920b270691cf7e8ef18e8870e5106.html', 'create-opportunity-form.html');
INSERT INTO `bpm_forms` VALUES ('24', '839', 'Open Opprtunity Form', 'No description', '8ca4ebd7cf18f47102ab3338c2ff5c84.html', 'create-opportunity-form.html');
INSERT INTO `bpm_forms` VALUES ('25', '836', 'Create Opportunity Form', 'No description', 'ecff692986dc4a65f478aad6a53bcfd0.html', 'create-opportunity-form.html');
INSERT INTO `bpm_forms` VALUES ('26', '850', 'Form Start', 'No description', '6ecdb52d26ec82ffd548da2ec2cf144e.html', 'form_start.html');

-- ----------------------------
-- Table structure for bpm_forms_roles
-- ----------------------------
DROP TABLE IF EXISTS `bpm_forms_roles`;
CREATE TABLE `bpm_forms_roles` (
  `bfr_id` int(11) NOT NULL AUTO_INCREMENT,
  `bfr_bf_id` int(11) DEFAULT NULL,
  `bfr_sr_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`bfr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bpm_forms_roles
-- ----------------------------
INSERT INTO `bpm_forms_roles` VALUES ('9', '12', '1');
INSERT INTO `bpm_forms_roles` VALUES ('10', '13', '1');
INSERT INTO `bpm_forms_roles` VALUES ('11', '26', '4');

-- ----------------------------
-- Table structure for bpm_forms_users
-- ----------------------------
DROP TABLE IF EXISTS `bpm_forms_users`;
CREATE TABLE `bpm_forms_users` (
  `bfu_id` int(11) NOT NULL AUTO_INCREMENT,
  `bfu_bf_id` int(11) DEFAULT NULL,
  `bfu_su_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`bfu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bpm_forms_users
-- ----------------------------
INSERT INTO `bpm_forms_users` VALUES ('6', '12', '1');
INSERT INTO `bpm_forms_users` VALUES ('7', '12', '7');
INSERT INTO `bpm_forms_users` VALUES ('8', '13', '1');
INSERT INTO `bpm_forms_users` VALUES ('9', '13', '7');
INSERT INTO `bpm_forms_users` VALUES ('10', '14', '1');
INSERT INTO `bpm_forms_users` VALUES ('11', '14', '7');
INSERT INTO `bpm_forms_users` VALUES ('12', '15', '1');
INSERT INTO `bpm_forms_users` VALUES ('13', '15', '7');
INSERT INTO `bpm_forms_users` VALUES ('14', '16', '1');
INSERT INTO `bpm_forms_users` VALUES ('15', '16', '7');
INSERT INTO `bpm_forms_users` VALUES ('16', '17', '1');
INSERT INTO `bpm_forms_users` VALUES ('17', '17', '7');
INSERT INTO `bpm_forms_users` VALUES ('18', '18', '1');
INSERT INTO `bpm_forms_users` VALUES ('19', '18', '7');
INSERT INTO `bpm_forms_users` VALUES ('20', '19', '7');
INSERT INTO `bpm_forms_users` VALUES ('21', '20', '7');
INSERT INTO `bpm_forms_users` VALUES ('22', '21', '7');
INSERT INTO `bpm_forms_users` VALUES ('23', '22', '7');
INSERT INTO `bpm_forms_users` VALUES ('24', '23', '7');
INSERT INTO `bpm_forms_users` VALUES ('25', '24', '7');
INSERT INTO `bpm_forms_users` VALUES ('26', '25', '7');

-- ----------------------------
-- Table structure for bpm_links
-- ----------------------------
DROP TABLE IF EXISTS `bpm_links`;
CREATE TABLE `bpm_links` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `client_id` varchar(50) DEFAULT NULL,
  `client_source` varchar(50) DEFAULT NULL,
  `client_target` varchar(50) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `router_type` varchar(255) DEFAULT NULL,
  `diagram_id` int(11) DEFAULT NULL,
  `source_id` int(11) DEFAULT NULL,
  `target_id` int(11) DEFAULT NULL,
  `command` varchar(1000) DEFAULT NULL,
  `stroke` varchar(50) DEFAULT NULL,
  `label` varchar(200) DEFAULT NULL,
  `label_distance` double(15,5) DEFAULT '0.50000',
  `convex` int(1) DEFAULT '1',
  `smooth` int(1) DEFAULT '1',
  `smoothness` int(11) DEFAULT NULL,
  `params` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=659 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bpm_links
-- ----------------------------
INSERT INTO `bpm_links` VALUES ('629', null, 'graph-link-1', 'graph-shape-7', 'graph-shape-1', 'Graph.link.Orthogonal', 'orthogonal', '52', '839', '826', 'M455.0000000000002,54.16686024548826L455,127.9999999999999', '#000', 'Submitted', '0.50000', '1', '0', '6', '[{\"field\":\"ts_drop_status\",\"comparison\":\"=\",\"value\":\"active\",\"operator\":\"\"}]');
INSERT INTO `bpm_links` VALUES ('630', null, 'graph-link-2', 'graph-shape-1', 'graph-shape-2', 'Graph.link.Orthogonal', 'orthogonal', '52', '826', '827', 'M454.72942463744926,187.6494465700588L454.7294246374479,250.64944657005876', '#000', 'Negotiation', '0.50000', '1', '0', '6', '[{\"field\":\"ts_drop_status\",\"comparison\":\"=\",\"value\":\"active\",\"operator\":\"\"}]');
INSERT INTO `bpm_links` VALUES ('631', null, 'graph-link-3', 'graph-shape-2', 'graph-shape-3', 'Graph.link.Orthogonal', 'orthogonal', '52', '827', '828', 'M454.72942463745346,310.6494465700598L454.7294246374503,380.649446570059', '#000', 'PO Received', '0.50000', '1', '0', '6', '[{\"field\":\"ts_drop_status\",\"comparison\":\"=\",\"value\":\"active\",\"operator\":\"\"}]');
INSERT INTO `bpm_links` VALUES ('632', null, 'graph-link-4', 'graph-shape-3', 'graph-shape-4', 'Graph.link.Orthogonal', 'orthogonal', '52', '828', '833', 'M454.99999999999835,441.000000000001L454.99999999999875,490.000000000002', '#000', '', '0.50000', '1', '0', '6', '[]');
INSERT INTO `bpm_links` VALUES ('639', null, 'graph-link-5', 'graph-shape-7', 'graph-shape-5', 'Graph.link.Orthogonal', 'orthogonal', '52', '839', '835', 'M525,16.249104404750934L809.4608088940569,16.249104404751648L809.4608088940571,380.999999999998', '#000', 'Drop from Opportunity', '0.34644', '1', '0', '6', '[{\"field\":\"ts_drop_status\",\"comparison\":\"=\",\"value\":\"drop\",\"operator\":\"\"}]');
INSERT INTO `bpm_links` VALUES ('640', null, 'graph-link-6', 'graph-shape-1', 'graph-shape-5', 'Graph.link.Orthogonal', 'orthogonal', '52', '826', '835', 'M525,147.124154160045L764,147.12415416004285L764.0000000000001,381.00000000000057', '#000', 'Drop from Submit', '0.41878', '1', '0', '6', '[{\"field\":\"ts_drop_status\",\"comparison\":\"=\",\"value\":\"drop\",\"operator\":\"\"}]');
INSERT INTO `bpm_links` VALUES ('641', null, 'graph-link-7', 'graph-shape-2', 'graph-shape-5', 'Graph.link.Orthogonal', 'orthogonal', '52', '827', '835', 'M525,277.1241541600551L714.7808248827354,277.1241541600459L714.7808248827336,381.0000000000024', '#000', 'Drop from Negotiation', '0.50000', '1', '0', '6', '[{\"field\":\"ts_drop_status\",\"comparison\":\"=\",\"value\":\"drop\",\"operator\":\"\"}]');
INSERT INTO `bpm_links` VALUES ('644', null, 'graph-link-8', 'graph-shape-6', 'graph-shape-7', 'Graph.link.Orthogonal', 'orthogonal', '52', '836', '839', 'M455.28899452062643,-62.0511976328378L455.2889945206265,-5.833139754511613', '#000', 'Opportunity', '0.50000', '1', '0', '6', '[]');
INSERT INTO `bpm_links` VALUES ('645', null, 'graph-link-9', 'graph-shape-3', 'graph-shape-5', 'Graph.link.Orthogonal', 'orthogonal', '52', '828', '835', 'M525,411.00000000000085L694,410.99999999999454', '#000', 'Drop from PO', '0.50000', '1', '0', '6', '[{\"field\":\"ts_drop_status\",\"comparison\":\"=\",\"value\":\"drop\",\"operator\":\"\"}]');
INSERT INTO `bpm_links` VALUES ('648', null, 'graph-link-10', 'graph-shape-5', 'graph-shape-4', 'Graph.link.Orthogonal', 'orthogonal', '52', '835', '833', 'M764.0000000000033,441.00000000000176L764,520L484.5957029881911,519.9999999999975', '#000', '', '0.50000', '1', '0', '6', '[]');
INSERT INTO `bpm_links` VALUES ('656', null, 'graph-link-1', 'graph-shape-1', 'graph-shape-2', 'Graph.link.Orthogonal', 'orthogonal', '54', '850', '851', 'M552,94.00000000000001L552,140.9999999999999', '#000', 'Draft', '0.50000', '1', '0', '6', '[]');
INSERT INTO `bpm_links` VALUES ('657', null, 'graph-link-2', 'graph-shape-2', 'graph-shape-3', 'Graph.link.Orthogonal', 'orthogonal', '54', '851', '852', 'M551.9999999999995,201.00000000000028L551.9999999999983,262.0000000000009', '#000', 'Submitted', '0.50000', '1', '0', '6', '[]');
INSERT INTO `bpm_links` VALUES ('658', null, 'graph-link-3', 'graph-shape-3', 'graph-shape-4', 'Graph.link.Orthogonal', 'orthogonal', '54', '852', '853', 'M552,322.00000000000017L552,365.9999999999982', '#000', 'Approved', '0.50000', '1', '0', '6', '[]');

-- ----------------------------
-- Table structure for bpm_shapes
-- ----------------------------
DROP TABLE IF EXISTS `bpm_shapes`;
CREATE TABLE `bpm_shapes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` varchar(50) DEFAULT NULL,
  `client_parent` varchar(50) DEFAULT NULL,
  `client_pool` varchar(50) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `mode` varchar(50) DEFAULT NULL,
  `diagram_id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `width` double(15,0) DEFAULT NULL,
  `height` double(15,0) DEFAULT NULL,
  `left` double(15,0) DEFAULT NULL,
  `top` double(15,0) DEFAULT NULL,
  `rotate` double(15,0) DEFAULT NULL,
  `label` varchar(100) DEFAULT NULL,
  `fill` varchar(30) DEFAULT NULL,
  `stroke` varchar(30) DEFAULT NULL,
  `stroke_width` int(11) DEFAULT NULL,
  `params` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=854 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bpm_shapes
-- ----------------------------
INSERT INTO `bpm_shapes` VALUES ('826', 'graph-shape-1', null, null, 'Graph.shape.activity.Action', null, '52', null, '140', '60', '385', '128', '0', 'Submit', 'rgb(255, 255, 255)', 'rgb(0, 0, 0)', '2', '[]');
INSERT INTO `bpm_shapes` VALUES ('827', 'graph-shape-2', null, null, 'Graph.shape.activity.Action', null, '52', null, '140', '60', '385', '251', '0', 'Negotiation', 'rgb(255, 255, 255)', 'rgb(0, 0, 0)', '2', '[]');
INSERT INTO `bpm_shapes` VALUES ('828', 'graph-shape-3', null, null, 'Graph.shape.activity.Action', null, '52', null, '140', '60', '385', '381', '0', 'PO', 'rgb(255, 255, 255)', 'rgb(0, 0, 0)', '2', '[]');
INSERT INTO `bpm_shapes` VALUES ('833', 'graph-shape-4', null, null, 'Graph.shape.activity.Final', null, '52', null, '60', '60', '425', '490', '0', 'End', '#FF4081', 'rgb(0, 0, 0)', '2', '[]');
INSERT INTO `bpm_shapes` VALUES ('835', 'graph-shape-5', null, null, 'Graph.shape.activity.Action', null, '52', null, '140', '60', '694', '381', '0', 'Drop', 'rgb(255, 255, 255)', 'rgb(0, 0, 0)', '2', '[]');
INSERT INTO `bpm_shapes` VALUES ('836', 'graph-shape-6', null, null, 'Graph.shape.activity.Start', null, '52', null, '60', '60', '425', '-122', '0', 'Start', 'rgb(255, 255, 255)', 'rgb(0, 0, 0)', '2', '[]');
INSERT INTO `bpm_shapes` VALUES ('839', 'graph-shape-7', null, null, 'Graph.shape.activity.Action', null, '52', null, '140', '60', '385', '-6', '0', 'Opportunity', 'rgb(255, 255, 255)', 'rgb(0, 0, 0)', '2', '[]');
INSERT INTO `bpm_shapes` VALUES ('850', 'graph-shape-1', null, null, 'Graph.shape.activity.Start', null, '54', null, '60', '60', '522', '34', '0', 'Start', 'rgb(255, 255, 255)', 'rgb(0, 0, 0)', '2', '[]');
INSERT INTO `bpm_shapes` VALUES ('851', 'graph-shape-2', null, null, 'Graph.shape.activity.Action', null, '54', null, '140', '60', '482', '141', '0', 'Submit', 'rgb(255, 255, 255)', 'rgb(0, 0, 0)', '2', '[]');
INSERT INTO `bpm_shapes` VALUES ('852', 'graph-shape-3', null, null, 'Graph.shape.activity.Action', null, '54', null, '140', '60', '482', '262', '0', 'Approval', 'rgb(255, 255, 255)', 'rgb(0, 0, 0)', '2', '[]');
INSERT INTO `bpm_shapes` VALUES ('853', 'graph-shape-4', null, null, 'Graph.shape.activity.Final', null, '54', null, '60', '60', '522', '366', '0', 'End', '#FF4081', 'rgb(0, 0, 0)', '2', '[]');

-- ----------------------------
-- Table structure for company
-- ----------------------------
DROP TABLE IF EXISTS `company`;
CREATE TABLE `company` (
  `com_id` int(11) NOT NULL,
  `com_name` varchar(100) DEFAULT NULL,
  `com_addr` varchar(255) DEFAULT NULL,
  `com_email` varchar(100) DEFAULT NULL,
  `com_phone` varchar(50) DEFAULT NULL,
  `com_fax` varchar(50) DEFAULT NULL,
  `com_currency_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`com_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of company
-- ----------------------------
INSERT INTO `company` VALUES ('1', 'PT. Panah Merah Indonesia', 'Jl. KH. Agus Salim No. 201-205 Jakarta Pusat', 'company@panahmerah.id', '(021) 7612716', '(021) 8712171', '1');

-- ----------------------------
-- Table structure for dx_auth
-- ----------------------------
DROP TABLE IF EXISTS `dx_auth`;
CREATE TABLE `dx_auth` (
  `auth_col_id` int(11) NOT NULL AUTO_INCREMENT,
  `group_child_id` int(11) DEFAULT NULL,
  `map_id` int(11) DEFAULT NULL,
  `dx_read` int(11) DEFAULT NULL,
  `dx_write` int(11) DEFAULT NULL,
  `dx_edit` int(11) DEFAULT NULL,
  `dx_delete` int(11) DEFAULT NULL,
  `dx_default` int(11) DEFAULT NULL,
  PRIMARY KEY (`auth_col_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dx_auth
-- ----------------------------

-- ----------------------------
-- Table structure for dx_mapping
-- ----------------------------
DROP TABLE IF EXISTS `dx_mapping`;
CREATE TABLE `dx_mapping` (
  `map_id` int(11) NOT NULL AUTO_INCREMENT,
  `map_profile_id` int(11) NOT NULL,
  `map_table` varchar(50) NOT NULL,
  `map_type` varchar(20) DEFAULT 'data',
  `map_xls_col` varchar(50) NOT NULL,
  `map_tbl_col` varchar(50) DEFAULT NULL,
  `map_dtype` varchar(50) DEFAULT 'string',
  `map_pk` int(11) DEFAULT '0',
  `map_mandatory` int(11) DEFAULT '0',
  `map_ref_table` varchar(50) DEFAULT NULL,
  `map_ref_col` varchar(50) DEFAULT NULL,
  `map_ref_fk` varchar(50) DEFAULT NULL,
  `map_ref_ignore` int(11) DEFAULT '0',
  `map_active` int(11) DEFAULT NULL,
  `map_col_alias` varchar(100) DEFAULT NULL,
  `map_grp_seq` int(11) DEFAULT NULL,
  `map_sk` int(11) DEFAULT '0',
  `map_ref_contents` longtext,
  `map_col_seq` int(11) DEFAULT NULL,
  PRIMARY KEY (`map_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dx_mapping
-- ----------------------------
INSERT INTO `dx_mapping` VALUES ('1', '1', 'example_1', 'data', 'EMAIL', 'email', 'string', '1', '0', null, null, null, '0', '1', null, '1', '0', null, null);
INSERT INTO `dx_mapping` VALUES ('3', '1', 'example_1', 'data', 'DEBUG', 'debug', 'string', '0', '0', null, null, null, '0', '1', null, '1', '0', null, null);
INSERT INTO `dx_mapping` VALUES ('4', '1', 'example_1', 'data', 'SEX', 'sex', 'int', '0', '0', null, null, null, '0', '1', null, '1', '0', null, null);
INSERT INTO `dx_mapping` VALUES ('5', '1', 'example_2', 'data', 'USERNAME', 'username', 'string', '1', '0', null, null, null, '0', '0', null, '1', '0', null, null);
INSERT INTO `dx_mapping` VALUES ('6', '1', 'example_1', 'data', 'DOB', 'dob', 'date', '0', '0', null, null, null, '0', '1', null, '1', '0', null, null);
INSERT INTO `dx_mapping` VALUES ('7', '1', 'example_1', 'data', 'AVATAR', 'avatar', 'string', '0', '0', null, null, null, '0', '1', null, '1', '0', null, null);
INSERT INTO `dx_mapping` VALUES ('8', '1', 'example_1', 'data', 'POINTS', 'points', 'double', '0', '0', null, null, null, '0', '1', null, '1', '0', null, null);
INSERT INTO `dx_mapping` VALUES ('9', '1', 'example_1', 'data', 'FULLNAME', 'fullname', 'string', '0', '0', null, null, null, '0', '1', null, '1', '0', null, null);
INSERT INTO `dx_mapping` VALUES ('10', '4', 'A', 'data', '1', 'A', 'A', '1', '0', null, null, null, '0', '1', null, null, '1', null, null);

-- ----------------------------
-- Table structure for dx_profiles
-- ----------------------------
DROP TABLE IF EXISTS `dx_profiles`;
CREATE TABLE `dx_profiles` (
  `profile_id` int(11) NOT NULL AUTO_INCREMENT,
  `profile_name` varchar(50) DEFAULT NULL,
  `profile_desc` varchar(200) DEFAULT NULL,
  `header_row_idx` int(11) DEFAULT NULL,
  `col_offset` varchar(20) DEFAULT NULL,
  `row_offset` int(11) DEFAULT NULL,
  `map_header` int(11) DEFAULT NULL,
  `has_merge_cell` int(1) DEFAULT NULL,
  PRIMARY KEY (`profile_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dx_profiles
-- ----------------------------
INSERT INTO `dx_profiles` VALUES ('1', 'Example Profile', 'Example profile', '1', 'B', '2', '1', null);
INSERT INTO `dx_profiles` VALUES ('4', 'foo', null, '1', 'A', '2', '1', null);
INSERT INTO `dx_profiles` VALUES ('5', 'bar', null, '1', 'A', '1', '1', null);

-- ----------------------------
-- Table structure for expense_crop
-- ----------------------------
DROP TABLE IF EXISTS `expense_crop`;
CREATE TABLE `expense_crop` (
  `exp_crop_id` int(11) NOT NULL AUTO_INCREMENT,
  `id_exp` int(11) DEFAULT NULL,
  `seed_id` int(11) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`exp_crop_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of expense_crop
-- ----------------------------
INSERT INTO `expense_crop` VALUES ('1', '2', '2', '-');
INSERT INTO `expense_crop` VALUES ('2', '2', '3', '-');
INSERT INTO `expense_crop` VALUES ('4', '2', '6', '-');
INSERT INTO `expense_crop` VALUES ('5', '2', '5', '-');

-- ----------------------------
-- Table structure for expense_detail
-- ----------------------------
DROP TABLE IF EXISTS `expense_detail`;
CREATE TABLE `expense_detail` (
  `exp_detail_id` int(10) NOT NULL AUTO_INCREMENT,
  `exp_item_id` int(11) DEFAULT NULL,
  `exp_id` int(11) DEFAULT NULL,
  `item_form_id` int(11) DEFAULT NULL,
  `item_form_value` text,
  PRIMARY KEY (`exp_detail_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of expense_detail
-- ----------------------------
INSERT INTO `expense_detail` VALUES ('3', '2', '1', '35', '2017-11-17');
INSERT INTO `expense_detail` VALUES ('4', '2', '1', '36', 'Kalibata');
INSERT INTO `expense_detail` VALUES ('5', '3', '1', '40', '');
INSERT INTO `expense_detail` VALUES ('6', '3', '1', '41', 'Blok M');
INSERT INTO `expense_detail` VALUES ('7', '3', '1', '35', '2017-11-26');
INSERT INTO `expense_detail` VALUES ('8', '7', '3', '35', '2017-11-18');
INSERT INTO `expense_detail` VALUES ('9', '7', '3', '36', 'aaa');
INSERT INTO `expense_detail` VALUES ('10', '2', '1', '40', '2017-11-20');
INSERT INTO `expense_detail` VALUES ('11', '3', '1', '1', '1');
INSERT INTO `expense_detail` VALUES ('12', '3', '1', '2', 'Jakarta');
INSERT INTO `expense_detail` VALUES ('13', '3', '1', '3', '2017-11-18');
INSERT INTO `expense_detail` VALUES ('14', '3', '1', '4', '2017-11-18');
INSERT INTO `expense_detail` VALUES ('15', '3', '1', '70', '2017-11-26');
INSERT INTO `expense_detail` VALUES ('16', '2', '1', '70', '2017-11-20');
INSERT INTO `expense_detail` VALUES ('17', '2', '1', '71', 'A');
INSERT INTO `expense_detail` VALUES ('18', '3', '1', '71', 'Bandung');
INSERT INTO `expense_detail` VALUES ('19', '3', '1', '45', '');
INSERT INTO `expense_detail` VALUES ('20', '3', '1', '46', 'A');
INSERT INTO `expense_detail` VALUES ('21', '3', '1', '50', '2017-11-26');
INSERT INTO `expense_detail` VALUES ('22', '3', '1', '53', '2017-11-26');
INSERT INTO `expense_detail` VALUES ('23', '3', '1', '54', '1');
INSERT INTO `expense_detail` VALUES ('24', '3', '1', '36', 'A');

-- ----------------------------
-- Table structure for expense_detail_history
-- ----------------------------
DROP TABLE IF EXISTS `expense_detail_history`;
CREATE TABLE `expense_detail_history` (
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `item_history_id` int(11) DEFAULT NULL,
  `exp_detail_id` int(10) DEFAULT NULL,
  `exp_item_id` int(11) DEFAULT NULL,
  `exp_id` int(11) DEFAULT NULL,
  `item_form_id` int(11) DEFAULT NULL,
  `item_form_value` text,
  PRIMARY KEY (`history_id`)
) ENGINE=InnoDB AUTO_INCREMENT=319 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of expense_detail_history
-- ----------------------------
INSERT INTO `expense_detail_history` VALUES ('1', '1', '5', '3', '1', '40', '2017-11-18');
INSERT INTO `expense_detail_history` VALUES ('2', '1', '6', '3', '1', '41', 'Senayan');
INSERT INTO `expense_detail_history` VALUES ('3', '1', '7', '3', '1', '35', '');
INSERT INTO `expense_detail_history` VALUES ('4', '2', '5', '3', '1', '40', '2017-11-18');
INSERT INTO `expense_detail_history` VALUES ('5', '2', '6', '3', '1', '41', 'Senayan');
INSERT INTO `expense_detail_history` VALUES ('6', '2', '7', '3', '1', '35', '');
INSERT INTO `expense_detail_history` VALUES ('7', '3', '3', '2', '1', '35', '2017-11-17');
INSERT INTO `expense_detail_history` VALUES ('8', '3', '4', '2', '1', '36', 'Kalibata');
INSERT INTO `expense_detail_history` VALUES ('9', '4', '5', '3', '1', '40', '2017-11-18');
INSERT INTO `expense_detail_history` VALUES ('10', '4', '6', '3', '1', '41', 'Senayan');
INSERT INTO `expense_detail_history` VALUES ('11', '4', '7', '3', '1', '35', '');
INSERT INTO `expense_detail_history` VALUES ('12', '5', '5', '3', '1', '40', '2017-11-18');
INSERT INTO `expense_detail_history` VALUES ('13', '5', '6', '3', '1', '41', 'Blok M');
INSERT INTO `expense_detail_history` VALUES ('14', '5', '7', '3', '1', '35', '');
INSERT INTO `expense_detail_history` VALUES ('15', '6', '5', '3', '1', '40', '2017-11-18');
INSERT INTO `expense_detail_history` VALUES ('16', '6', '6', '3', '1', '41', 'Blok M');
INSERT INTO `expense_detail_history` VALUES ('17', '6', '7', '3', '1', '35', '');
INSERT INTO `expense_detail_history` VALUES ('18', '7', '5', '3', '1', '40', '2017-11-18');
INSERT INTO `expense_detail_history` VALUES ('19', '7', '6', '3', '1', '41', 'Blok M');
INSERT INTO `expense_detail_history` VALUES ('20', '7', '7', '3', '1', '35', '');
INSERT INTO `expense_detail_history` VALUES ('21', '8', '5', '3', '1', '40', '2017-11-18');
INSERT INTO `expense_detail_history` VALUES ('22', '8', '6', '3', '1', '41', 'Blok M');
INSERT INTO `expense_detail_history` VALUES ('23', '8', '7', '3', '1', '35', '');
INSERT INTO `expense_detail_history` VALUES ('24', '8', '11', '3', '1', '1', '1');
INSERT INTO `expense_detail_history` VALUES ('25', '8', '12', '3', '1', '2', 'Jakarta');
INSERT INTO `expense_detail_history` VALUES ('26', '8', '13', '3', '1', '3', '2017-11-18');
INSERT INTO `expense_detail_history` VALUES ('27', '8', '14', '3', '1', '4', '2017-11-18');
INSERT INTO `expense_detail_history` VALUES ('28', '9', '5', '3', '1', '40', '2017-11-18');
INSERT INTO `expense_detail_history` VALUES ('29', '9', '6', '3', '1', '41', 'Blok M');
INSERT INTO `expense_detail_history` VALUES ('30', '9', '7', '3', '1', '35', '');
INSERT INTO `expense_detail_history` VALUES ('31', '9', '11', '3', '1', '1', '1');
INSERT INTO `expense_detail_history` VALUES ('32', '9', '12', '3', '1', '2', 'Jakarta');
INSERT INTO `expense_detail_history` VALUES ('33', '9', '13', '3', '1', '3', '2017-11-18');
INSERT INTO `expense_detail_history` VALUES ('34', '9', '14', '3', '1', '4', '2017-11-18');
INSERT INTO `expense_detail_history` VALUES ('35', '10', '5', '3', '1', '40', '2017-11-18');
INSERT INTO `expense_detail_history` VALUES ('36', '10', '6', '3', '1', '41', 'Blok M');
INSERT INTO `expense_detail_history` VALUES ('37', '10', '7', '3', '1', '35', '');
INSERT INTO `expense_detail_history` VALUES ('38', '10', '11', '3', '1', '1', '1');
INSERT INTO `expense_detail_history` VALUES ('39', '10', '12', '3', '1', '2', 'Jakarta');
INSERT INTO `expense_detail_history` VALUES ('40', '10', '13', '3', '1', '3', '2017-11-18');
INSERT INTO `expense_detail_history` VALUES ('41', '10', '14', '3', '1', '4', '2017-11-18');
INSERT INTO `expense_detail_history` VALUES ('42', '11', '3', '2', '1', '35', '2017-11-17');
INSERT INTO `expense_detail_history` VALUES ('43', '11', '4', '2', '1', '36', 'Kalibata');
INSERT INTO `expense_detail_history` VALUES ('44', '11', '10', '2', '1', '40', '');
INSERT INTO `expense_detail_history` VALUES ('45', '12', '3', '2', '1', '35', '2017-11-17');
INSERT INTO `expense_detail_history` VALUES ('46', '12', '4', '2', '1', '36', 'Kalibata');
INSERT INTO `expense_detail_history` VALUES ('47', '12', '10', '2', '1', '40', '2017-11-20');
INSERT INTO `expense_detail_history` VALUES ('48', '13', '5', '3', '1', '40', '2017-11-18');
INSERT INTO `expense_detail_history` VALUES ('49', '13', '6', '3', '1', '41', 'Blok M');
INSERT INTO `expense_detail_history` VALUES ('50', '13', '7', '3', '1', '35', '');
INSERT INTO `expense_detail_history` VALUES ('51', '13', '11', '3', '1', '1', '1');
INSERT INTO `expense_detail_history` VALUES ('52', '13', '12', '3', '1', '2', 'Jakarta');
INSERT INTO `expense_detail_history` VALUES ('53', '13', '13', '3', '1', '3', '2017-11-18');
INSERT INTO `expense_detail_history` VALUES ('54', '13', '14', '3', '1', '4', '2017-11-18');
INSERT INTO `expense_detail_history` VALUES ('55', '13', '15', '3', '1', '70', '');
INSERT INTO `expense_detail_history` VALUES ('56', '14', '5', '3', '1', '40', '2017-11-18');
INSERT INTO `expense_detail_history` VALUES ('57', '14', '6', '3', '1', '41', 'Blok M');
INSERT INTO `expense_detail_history` VALUES ('58', '14', '7', '3', '1', '35', '');
INSERT INTO `expense_detail_history` VALUES ('59', '14', '11', '3', '1', '1', '1');
INSERT INTO `expense_detail_history` VALUES ('60', '14', '12', '3', '1', '2', 'Jakarta');
INSERT INTO `expense_detail_history` VALUES ('61', '14', '13', '3', '1', '3', '2017-11-18');
INSERT INTO `expense_detail_history` VALUES ('62', '14', '14', '3', '1', '4', '2017-11-18');
INSERT INTO `expense_detail_history` VALUES ('63', '14', '15', '3', '1', '70', '');
INSERT INTO `expense_detail_history` VALUES ('64', '15', '5', '3', '1', '40', '2017-11-18');
INSERT INTO `expense_detail_history` VALUES ('65', '15', '6', '3', '1', '41', 'Blok M');
INSERT INTO `expense_detail_history` VALUES ('66', '15', '7', '3', '1', '35', '');
INSERT INTO `expense_detail_history` VALUES ('67', '15', '11', '3', '1', '1', '1');
INSERT INTO `expense_detail_history` VALUES ('68', '15', '12', '3', '1', '2', 'Jakarta');
INSERT INTO `expense_detail_history` VALUES ('69', '15', '13', '3', '1', '3', '2017-11-18');
INSERT INTO `expense_detail_history` VALUES ('70', '15', '14', '3', '1', '4', '2017-11-18');
INSERT INTO `expense_detail_history` VALUES ('71', '15', '15', '3', '1', '70', '2017-11-26');
INSERT INTO `expense_detail_history` VALUES ('72', '15', '18', '3', '1', '71', 'Bandung');
INSERT INTO `expense_detail_history` VALUES ('73', '16', '5', '3', '1', '40', '2017-11-18');
INSERT INTO `expense_detail_history` VALUES ('74', '16', '6', '3', '1', '41', 'Blok M');
INSERT INTO `expense_detail_history` VALUES ('75', '16', '7', '3', '1', '35', '');
INSERT INTO `expense_detail_history` VALUES ('76', '16', '11', '3', '1', '1', '1');
INSERT INTO `expense_detail_history` VALUES ('77', '16', '12', '3', '1', '2', 'Jakarta');
INSERT INTO `expense_detail_history` VALUES ('78', '16', '13', '3', '1', '3', '2017-11-18');
INSERT INTO `expense_detail_history` VALUES ('79', '16', '14', '3', '1', '4', '2017-11-18');
INSERT INTO `expense_detail_history` VALUES ('80', '16', '15', '3', '1', '70', '2017-11-26');
INSERT INTO `expense_detail_history` VALUES ('81', '16', '18', '3', '1', '71', 'Bandung');
INSERT INTO `expense_detail_history` VALUES ('82', '16', '19', '3', '1', '45', '2017-11-26');
INSERT INTO `expense_detail_history` VALUES ('83', '16', '20', '3', '1', '46', 'A');
INSERT INTO `expense_detail_history` VALUES ('84', '17', '5', '3', '1', '40', '2017-11-18');
INSERT INTO `expense_detail_history` VALUES ('85', '17', '6', '3', '1', '41', 'Blok M');
INSERT INTO `expense_detail_history` VALUES ('86', '17', '7', '3', '1', '35', '');
INSERT INTO `expense_detail_history` VALUES ('87', '17', '11', '3', '1', '1', '1');
INSERT INTO `expense_detail_history` VALUES ('88', '17', '12', '3', '1', '2', 'Jakarta');
INSERT INTO `expense_detail_history` VALUES ('89', '17', '13', '3', '1', '3', '2017-11-18');
INSERT INTO `expense_detail_history` VALUES ('90', '17', '14', '3', '1', '4', '2017-11-18');
INSERT INTO `expense_detail_history` VALUES ('91', '17', '15', '3', '1', '70', '2017-11-26');
INSERT INTO `expense_detail_history` VALUES ('92', '17', '18', '3', '1', '71', 'Bandung');
INSERT INTO `expense_detail_history` VALUES ('93', '17', '19', '3', '1', '45', '2017-11-26');
INSERT INTO `expense_detail_history` VALUES ('94', '17', '20', '3', '1', '46', 'A');
INSERT INTO `expense_detail_history` VALUES ('95', '18', '5', '3', '1', '40', '2017-11-18');
INSERT INTO `expense_detail_history` VALUES ('96', '18', '6', '3', '1', '41', 'Blok M');
INSERT INTO `expense_detail_history` VALUES ('97', '18', '7', '3', '1', '35', '');
INSERT INTO `expense_detail_history` VALUES ('98', '18', '11', '3', '1', '1', '1');
INSERT INTO `expense_detail_history` VALUES ('99', '18', '12', '3', '1', '2', 'Jakarta');
INSERT INTO `expense_detail_history` VALUES ('100', '18', '13', '3', '1', '3', '2017-11-18');
INSERT INTO `expense_detail_history` VALUES ('101', '18', '14', '3', '1', '4', '2017-11-18');
INSERT INTO `expense_detail_history` VALUES ('102', '18', '15', '3', '1', '70', '2017-11-26');
INSERT INTO `expense_detail_history` VALUES ('103', '18', '18', '3', '1', '71', 'Bandung');
INSERT INTO `expense_detail_history` VALUES ('104', '18', '19', '3', '1', '45', '2017-11-26');
INSERT INTO `expense_detail_history` VALUES ('105', '18', '20', '3', '1', '46', 'A');
INSERT INTO `expense_detail_history` VALUES ('106', '19', '5', '3', '1', '40', '2017-11-18');
INSERT INTO `expense_detail_history` VALUES ('107', '19', '6', '3', '1', '41', 'Blok M');
INSERT INTO `expense_detail_history` VALUES ('108', '19', '7', '3', '1', '35', '');
INSERT INTO `expense_detail_history` VALUES ('109', '19', '11', '3', '1', '1', '1');
INSERT INTO `expense_detail_history` VALUES ('110', '19', '12', '3', '1', '2', 'Jakarta');
INSERT INTO `expense_detail_history` VALUES ('111', '19', '13', '3', '1', '3', '2017-11-18');
INSERT INTO `expense_detail_history` VALUES ('112', '19', '14', '3', '1', '4', '2017-11-18');
INSERT INTO `expense_detail_history` VALUES ('113', '19', '15', '3', '1', '70', '2017-11-26');
INSERT INTO `expense_detail_history` VALUES ('114', '19', '18', '3', '1', '71', 'Bandung');
INSERT INTO `expense_detail_history` VALUES ('115', '19', '19', '3', '1', '45', '2017-11-26');
INSERT INTO `expense_detail_history` VALUES ('116', '19', '20', '3', '1', '46', 'A');
INSERT INTO `expense_detail_history` VALUES ('117', '20', '5', '3', '1', '40', '2017-11-18');
INSERT INTO `expense_detail_history` VALUES ('118', '20', '6', '3', '1', '41', 'Blok M');
INSERT INTO `expense_detail_history` VALUES ('119', '20', '7', '3', '1', '35', '');
INSERT INTO `expense_detail_history` VALUES ('120', '20', '11', '3', '1', '1', '1');
INSERT INTO `expense_detail_history` VALUES ('121', '20', '12', '3', '1', '2', 'Jakarta');
INSERT INTO `expense_detail_history` VALUES ('122', '20', '13', '3', '1', '3', '2017-11-18');
INSERT INTO `expense_detail_history` VALUES ('123', '20', '14', '3', '1', '4', '2017-11-18');
INSERT INTO `expense_detail_history` VALUES ('124', '20', '15', '3', '1', '70', '2017-11-26');
INSERT INTO `expense_detail_history` VALUES ('125', '20', '18', '3', '1', '71', 'Bandung');
INSERT INTO `expense_detail_history` VALUES ('126', '20', '19', '3', '1', '45', '2017-11-26');
INSERT INTO `expense_detail_history` VALUES ('127', '20', '20', '3', '1', '46', 'A');
INSERT INTO `expense_detail_history` VALUES ('128', '21', '5', '3', '1', '40', '2017-11-18');
INSERT INTO `expense_detail_history` VALUES ('129', '21', '6', '3', '1', '41', 'Blok M');
INSERT INTO `expense_detail_history` VALUES ('130', '21', '7', '3', '1', '35', '');
INSERT INTO `expense_detail_history` VALUES ('131', '21', '11', '3', '1', '1', '1');
INSERT INTO `expense_detail_history` VALUES ('132', '21', '12', '3', '1', '2', 'Jakarta');
INSERT INTO `expense_detail_history` VALUES ('133', '21', '13', '3', '1', '3', '2017-11-18');
INSERT INTO `expense_detail_history` VALUES ('134', '21', '14', '3', '1', '4', '2017-11-18');
INSERT INTO `expense_detail_history` VALUES ('135', '21', '15', '3', '1', '70', '2017-11-26');
INSERT INTO `expense_detail_history` VALUES ('136', '21', '18', '3', '1', '71', 'Bandung');
INSERT INTO `expense_detail_history` VALUES ('137', '21', '19', '3', '1', '45', '2017-11-26');
INSERT INTO `expense_detail_history` VALUES ('138', '21', '20', '3', '1', '46', 'A');
INSERT INTO `expense_detail_history` VALUES ('139', '21', '21', '3', '1', '50', '2017-11-26');
INSERT INTO `expense_detail_history` VALUES ('140', '21', '22', '3', '1', '53', '2017-11-26');
INSERT INTO `expense_detail_history` VALUES ('141', '21', '23', '3', '1', '54', '1');
INSERT INTO `expense_detail_history` VALUES ('142', '22', '5', '3', '1', '40', '2017-11-18');
INSERT INTO `expense_detail_history` VALUES ('143', '22', '6', '3', '1', '41', 'Blok M');
INSERT INTO `expense_detail_history` VALUES ('144', '22', '7', '3', '1', '35', '');
INSERT INTO `expense_detail_history` VALUES ('145', '22', '11', '3', '1', '1', '1');
INSERT INTO `expense_detail_history` VALUES ('146', '22', '12', '3', '1', '2', 'Jakarta');
INSERT INTO `expense_detail_history` VALUES ('147', '22', '13', '3', '1', '3', '2017-11-18');
INSERT INTO `expense_detail_history` VALUES ('148', '22', '14', '3', '1', '4', '2017-11-18');
INSERT INTO `expense_detail_history` VALUES ('149', '22', '15', '3', '1', '70', '2017-11-26');
INSERT INTO `expense_detail_history` VALUES ('150', '22', '18', '3', '1', '71', 'Bandung');
INSERT INTO `expense_detail_history` VALUES ('151', '22', '19', '3', '1', '45', '2017-11-26');
INSERT INTO `expense_detail_history` VALUES ('152', '22', '20', '3', '1', '46', 'A');
INSERT INTO `expense_detail_history` VALUES ('153', '22', '21', '3', '1', '50', '2017-11-26');
INSERT INTO `expense_detail_history` VALUES ('154', '22', '22', '3', '1', '53', '2017-11-26');
INSERT INTO `expense_detail_history` VALUES ('155', '22', '23', '3', '1', '54', '1');
INSERT INTO `expense_detail_history` VALUES ('156', '23', '5', '3', '1', '40', '');
INSERT INTO `expense_detail_history` VALUES ('157', '23', '6', '3', '1', '41', 'Blok M');
INSERT INTO `expense_detail_history` VALUES ('158', '23', '7', '3', '1', '35', '');
INSERT INTO `expense_detail_history` VALUES ('159', '23', '11', '3', '1', '1', '1');
INSERT INTO `expense_detail_history` VALUES ('160', '23', '12', '3', '1', '2', 'Jakarta');
INSERT INTO `expense_detail_history` VALUES ('161', '23', '13', '3', '1', '3', '2017-11-18');
INSERT INTO `expense_detail_history` VALUES ('162', '23', '14', '3', '1', '4', '2017-11-18');
INSERT INTO `expense_detail_history` VALUES ('163', '23', '15', '3', '1', '70', '2017-11-26');
INSERT INTO `expense_detail_history` VALUES ('164', '23', '18', '3', '1', '71', 'Bandung');
INSERT INTO `expense_detail_history` VALUES ('165', '23', '19', '3', '1', '45', '2017-11-26');
INSERT INTO `expense_detail_history` VALUES ('166', '23', '20', '3', '1', '46', 'A');
INSERT INTO `expense_detail_history` VALUES ('167', '23', '21', '3', '1', '50', '2017-11-26');
INSERT INTO `expense_detail_history` VALUES ('168', '23', '22', '3', '1', '53', '2017-11-26');
INSERT INTO `expense_detail_history` VALUES ('169', '23', '23', '3', '1', '54', '1');
INSERT INTO `expense_detail_history` VALUES ('170', '24', '5', '3', '1', '40', '');
INSERT INTO `expense_detail_history` VALUES ('171', '24', '6', '3', '1', '41', 'Blok M');
INSERT INTO `expense_detail_history` VALUES ('172', '24', '7', '3', '1', '35', '');
INSERT INTO `expense_detail_history` VALUES ('173', '24', '11', '3', '1', '1', '1');
INSERT INTO `expense_detail_history` VALUES ('174', '24', '12', '3', '1', '2', 'Jakarta');
INSERT INTO `expense_detail_history` VALUES ('175', '24', '13', '3', '1', '3', '2017-11-18');
INSERT INTO `expense_detail_history` VALUES ('176', '24', '14', '3', '1', '4', '2017-11-18');
INSERT INTO `expense_detail_history` VALUES ('177', '24', '15', '3', '1', '70', '2017-11-26');
INSERT INTO `expense_detail_history` VALUES ('178', '24', '18', '3', '1', '71', 'Bandung');
INSERT INTO `expense_detail_history` VALUES ('179', '24', '19', '3', '1', '45', '2017-11-26');
INSERT INTO `expense_detail_history` VALUES ('180', '24', '20', '3', '1', '46', 'A');
INSERT INTO `expense_detail_history` VALUES ('181', '24', '21', '3', '1', '50', '2017-11-26');
INSERT INTO `expense_detail_history` VALUES ('182', '24', '22', '3', '1', '53', '2017-11-26');
INSERT INTO `expense_detail_history` VALUES ('183', '24', '23', '3', '1', '54', '1');
INSERT INTO `expense_detail_history` VALUES ('184', '25', '5', '3', '1', '40', '');
INSERT INTO `expense_detail_history` VALUES ('185', '25', '6', '3', '1', '41', 'Blok M');
INSERT INTO `expense_detail_history` VALUES ('186', '25', '7', '3', '1', '35', '2017-11-26');
INSERT INTO `expense_detail_history` VALUES ('187', '25', '11', '3', '1', '1', '1');
INSERT INTO `expense_detail_history` VALUES ('188', '25', '12', '3', '1', '2', 'Jakarta');
INSERT INTO `expense_detail_history` VALUES ('189', '25', '13', '3', '1', '3', '2017-11-18');
INSERT INTO `expense_detail_history` VALUES ('190', '25', '14', '3', '1', '4', '2017-11-18');
INSERT INTO `expense_detail_history` VALUES ('191', '25', '15', '3', '1', '70', '2017-11-26');
INSERT INTO `expense_detail_history` VALUES ('192', '25', '18', '3', '1', '71', 'Bandung');
INSERT INTO `expense_detail_history` VALUES ('193', '25', '19', '3', '1', '45', '2017-11-26');
INSERT INTO `expense_detail_history` VALUES ('194', '25', '20', '3', '1', '46', 'A');
INSERT INTO `expense_detail_history` VALUES ('195', '25', '21', '3', '1', '50', '2017-11-26');
INSERT INTO `expense_detail_history` VALUES ('196', '25', '22', '3', '1', '53', '2017-11-26');
INSERT INTO `expense_detail_history` VALUES ('197', '25', '23', '3', '1', '54', '1');
INSERT INTO `expense_detail_history` VALUES ('198', '25', '24', '3', '1', '36', 'A');
INSERT INTO `expense_detail_history` VALUES ('199', '26', '5', '3', '1', '40', '');
INSERT INTO `expense_detail_history` VALUES ('200', '26', '6', '3', '1', '41', 'Blok M');
INSERT INTO `expense_detail_history` VALUES ('201', '26', '7', '3', '1', '35', '2017-11-26');
INSERT INTO `expense_detail_history` VALUES ('202', '26', '11', '3', '1', '1', '1');
INSERT INTO `expense_detail_history` VALUES ('203', '26', '12', '3', '1', '2', 'Jakarta');
INSERT INTO `expense_detail_history` VALUES ('204', '26', '13', '3', '1', '3', '2017-11-18');
INSERT INTO `expense_detail_history` VALUES ('205', '26', '14', '3', '1', '4', '2017-11-18');
INSERT INTO `expense_detail_history` VALUES ('206', '26', '15', '3', '1', '70', '2017-11-26');
INSERT INTO `expense_detail_history` VALUES ('207', '26', '18', '3', '1', '71', 'Bandung');
INSERT INTO `expense_detail_history` VALUES ('208', '26', '19', '3', '1', '45', '2017-11-26');
INSERT INTO `expense_detail_history` VALUES ('209', '26', '20', '3', '1', '46', 'A');
INSERT INTO `expense_detail_history` VALUES ('210', '26', '21', '3', '1', '50', '2017-11-26');
INSERT INTO `expense_detail_history` VALUES ('211', '26', '22', '3', '1', '53', '2017-11-26');
INSERT INTO `expense_detail_history` VALUES ('212', '26', '23', '3', '1', '54', '1');
INSERT INTO `expense_detail_history` VALUES ('213', '26', '24', '3', '1', '36', 'A');
INSERT INTO `expense_detail_history` VALUES ('214', '27', '5', '3', '1', '40', '');
INSERT INTO `expense_detail_history` VALUES ('215', '27', '6', '3', '1', '41', 'Blok M');
INSERT INTO `expense_detail_history` VALUES ('216', '27', '7', '3', '1', '35', '2017-11-26');
INSERT INTO `expense_detail_history` VALUES ('217', '27', '11', '3', '1', '1', '1');
INSERT INTO `expense_detail_history` VALUES ('218', '27', '12', '3', '1', '2', 'Jakarta');
INSERT INTO `expense_detail_history` VALUES ('219', '27', '13', '3', '1', '3', '2017-11-18');
INSERT INTO `expense_detail_history` VALUES ('220', '27', '14', '3', '1', '4', '2017-11-18');
INSERT INTO `expense_detail_history` VALUES ('221', '27', '15', '3', '1', '70', '2017-11-26');
INSERT INTO `expense_detail_history` VALUES ('222', '27', '18', '3', '1', '71', 'Bandung');
INSERT INTO `expense_detail_history` VALUES ('223', '27', '19', '3', '1', '45', '2017-11-26');
INSERT INTO `expense_detail_history` VALUES ('224', '27', '20', '3', '1', '46', 'A');
INSERT INTO `expense_detail_history` VALUES ('225', '27', '21', '3', '1', '50', '2017-11-26');
INSERT INTO `expense_detail_history` VALUES ('226', '27', '22', '3', '1', '53', '2017-11-26');
INSERT INTO `expense_detail_history` VALUES ('227', '27', '23', '3', '1', '54', '1');
INSERT INTO `expense_detail_history` VALUES ('228', '27', '24', '3', '1', '36', 'A');
INSERT INTO `expense_detail_history` VALUES ('229', '28', '5', '3', '1', '40', '');
INSERT INTO `expense_detail_history` VALUES ('230', '28', '6', '3', '1', '41', 'Blok M');
INSERT INTO `expense_detail_history` VALUES ('231', '28', '7', '3', '1', '35', '2017-11-26');
INSERT INTO `expense_detail_history` VALUES ('232', '28', '11', '3', '1', '1', '1');
INSERT INTO `expense_detail_history` VALUES ('233', '28', '12', '3', '1', '2', 'Jakarta');
INSERT INTO `expense_detail_history` VALUES ('234', '28', '13', '3', '1', '3', '2017-11-18');
INSERT INTO `expense_detail_history` VALUES ('235', '28', '14', '3', '1', '4', '2017-11-18');
INSERT INTO `expense_detail_history` VALUES ('236', '28', '15', '3', '1', '70', '2017-11-26');
INSERT INTO `expense_detail_history` VALUES ('237', '28', '18', '3', '1', '71', 'Bandung');
INSERT INTO `expense_detail_history` VALUES ('238', '28', '19', '3', '1', '45', '2017-11-26');
INSERT INTO `expense_detail_history` VALUES ('239', '28', '20', '3', '1', '46', 'A');
INSERT INTO `expense_detail_history` VALUES ('240', '28', '21', '3', '1', '50', '2017-11-26');
INSERT INTO `expense_detail_history` VALUES ('241', '28', '22', '3', '1', '53', '2017-11-26');
INSERT INTO `expense_detail_history` VALUES ('242', '28', '23', '3', '1', '54', '1');
INSERT INTO `expense_detail_history` VALUES ('243', '28', '24', '3', '1', '36', 'A');
INSERT INTO `expense_detail_history` VALUES ('244', '29', '5', '3', '1', '40', '');
INSERT INTO `expense_detail_history` VALUES ('245', '29', '6', '3', '1', '41', 'Blok M');
INSERT INTO `expense_detail_history` VALUES ('246', '29', '7', '3', '1', '35', '2017-11-26');
INSERT INTO `expense_detail_history` VALUES ('247', '29', '11', '3', '1', '1', '1');
INSERT INTO `expense_detail_history` VALUES ('248', '29', '12', '3', '1', '2', 'Jakarta');
INSERT INTO `expense_detail_history` VALUES ('249', '29', '13', '3', '1', '3', '2017-11-18');
INSERT INTO `expense_detail_history` VALUES ('250', '29', '14', '3', '1', '4', '2017-11-18');
INSERT INTO `expense_detail_history` VALUES ('251', '29', '15', '3', '1', '70', '2017-11-26');
INSERT INTO `expense_detail_history` VALUES ('252', '29', '18', '3', '1', '71', 'Bandung');
INSERT INTO `expense_detail_history` VALUES ('253', '29', '19', '3', '1', '45', '2017-11-26');
INSERT INTO `expense_detail_history` VALUES ('254', '29', '20', '3', '1', '46', 'A');
INSERT INTO `expense_detail_history` VALUES ('255', '29', '21', '3', '1', '50', '2017-11-26');
INSERT INTO `expense_detail_history` VALUES ('256', '29', '22', '3', '1', '53', '2017-11-26');
INSERT INTO `expense_detail_history` VALUES ('257', '29', '23', '3', '1', '54', '1');
INSERT INTO `expense_detail_history` VALUES ('258', '29', '24', '3', '1', '36', 'A');
INSERT INTO `expense_detail_history` VALUES ('259', '30', '5', '3', '1', '40', '');
INSERT INTO `expense_detail_history` VALUES ('260', '30', '6', '3', '1', '41', 'Blok M');
INSERT INTO `expense_detail_history` VALUES ('261', '30', '7', '3', '1', '35', '2017-11-26');
INSERT INTO `expense_detail_history` VALUES ('262', '30', '11', '3', '1', '1', '1');
INSERT INTO `expense_detail_history` VALUES ('263', '30', '12', '3', '1', '2', 'Jakarta');
INSERT INTO `expense_detail_history` VALUES ('264', '30', '13', '3', '1', '3', '2017-11-18');
INSERT INTO `expense_detail_history` VALUES ('265', '30', '14', '3', '1', '4', '2017-11-18');
INSERT INTO `expense_detail_history` VALUES ('266', '30', '15', '3', '1', '70', '2017-11-26');
INSERT INTO `expense_detail_history` VALUES ('267', '30', '18', '3', '1', '71', 'Bandung');
INSERT INTO `expense_detail_history` VALUES ('268', '30', '19', '3', '1', '45', '2017-11-26');
INSERT INTO `expense_detail_history` VALUES ('269', '30', '20', '3', '1', '46', 'A');
INSERT INTO `expense_detail_history` VALUES ('270', '30', '21', '3', '1', '50', '2017-11-26');
INSERT INTO `expense_detail_history` VALUES ('271', '30', '22', '3', '1', '53', '2017-11-26');
INSERT INTO `expense_detail_history` VALUES ('272', '30', '23', '3', '1', '54', '1');
INSERT INTO `expense_detail_history` VALUES ('273', '30', '24', '3', '1', '36', 'A');
INSERT INTO `expense_detail_history` VALUES ('274', '31', '5', '3', '1', '40', '');
INSERT INTO `expense_detail_history` VALUES ('275', '31', '6', '3', '1', '41', 'Blok M');
INSERT INTO `expense_detail_history` VALUES ('276', '31', '7', '3', '1', '35', '2017-11-26');
INSERT INTO `expense_detail_history` VALUES ('277', '31', '11', '3', '1', '1', '1');
INSERT INTO `expense_detail_history` VALUES ('278', '31', '12', '3', '1', '2', 'Jakarta');
INSERT INTO `expense_detail_history` VALUES ('279', '31', '13', '3', '1', '3', '2017-11-18');
INSERT INTO `expense_detail_history` VALUES ('280', '31', '14', '3', '1', '4', '2017-11-18');
INSERT INTO `expense_detail_history` VALUES ('281', '31', '15', '3', '1', '70', '2017-11-26');
INSERT INTO `expense_detail_history` VALUES ('282', '31', '18', '3', '1', '71', 'Bandung');
INSERT INTO `expense_detail_history` VALUES ('283', '31', '19', '3', '1', '45', '2017-11-26');
INSERT INTO `expense_detail_history` VALUES ('284', '31', '20', '3', '1', '46', 'A');
INSERT INTO `expense_detail_history` VALUES ('285', '31', '21', '3', '1', '50', '2017-11-26');
INSERT INTO `expense_detail_history` VALUES ('286', '31', '22', '3', '1', '53', '2017-11-26');
INSERT INTO `expense_detail_history` VALUES ('287', '31', '23', '3', '1', '54', '1');
INSERT INTO `expense_detail_history` VALUES ('288', '31', '24', '3', '1', '36', 'A');
INSERT INTO `expense_detail_history` VALUES ('289', '32', '5', '3', '1', '40', '');
INSERT INTO `expense_detail_history` VALUES ('290', '32', '6', '3', '1', '41', 'Blok M');
INSERT INTO `expense_detail_history` VALUES ('291', '32', '7', '3', '1', '35', '2017-11-26');
INSERT INTO `expense_detail_history` VALUES ('292', '32', '11', '3', '1', '1', '1');
INSERT INTO `expense_detail_history` VALUES ('293', '32', '12', '3', '1', '2', 'Jakarta');
INSERT INTO `expense_detail_history` VALUES ('294', '32', '13', '3', '1', '3', '2017-11-18');
INSERT INTO `expense_detail_history` VALUES ('295', '32', '14', '3', '1', '4', '2017-11-18');
INSERT INTO `expense_detail_history` VALUES ('296', '32', '15', '3', '1', '70', '2017-11-26');
INSERT INTO `expense_detail_history` VALUES ('297', '32', '18', '3', '1', '71', 'Bandung');
INSERT INTO `expense_detail_history` VALUES ('298', '32', '19', '3', '1', '45', '');
INSERT INTO `expense_detail_history` VALUES ('299', '32', '20', '3', '1', '46', 'A');
INSERT INTO `expense_detail_history` VALUES ('300', '32', '21', '3', '1', '50', '2017-11-26');
INSERT INTO `expense_detail_history` VALUES ('301', '32', '22', '3', '1', '53', '2017-11-26');
INSERT INTO `expense_detail_history` VALUES ('302', '32', '23', '3', '1', '54', '1');
INSERT INTO `expense_detail_history` VALUES ('303', '32', '24', '3', '1', '36', 'A');
INSERT INTO `expense_detail_history` VALUES ('304', '33', '5', '3', '1', '40', '');
INSERT INTO `expense_detail_history` VALUES ('305', '33', '6', '3', '1', '41', 'Blok M');
INSERT INTO `expense_detail_history` VALUES ('306', '33', '7', '3', '1', '35', '2017-11-26');
INSERT INTO `expense_detail_history` VALUES ('307', '33', '11', '3', '1', '1', '1');
INSERT INTO `expense_detail_history` VALUES ('308', '33', '12', '3', '1', '2', 'Jakarta');
INSERT INTO `expense_detail_history` VALUES ('309', '33', '13', '3', '1', '3', '2017-11-18');
INSERT INTO `expense_detail_history` VALUES ('310', '33', '14', '3', '1', '4', '2017-11-18');
INSERT INTO `expense_detail_history` VALUES ('311', '33', '15', '3', '1', '70', '2017-11-26');
INSERT INTO `expense_detail_history` VALUES ('312', '33', '18', '3', '1', '71', 'Bandung');
INSERT INTO `expense_detail_history` VALUES ('313', '33', '19', '3', '1', '45', '');
INSERT INTO `expense_detail_history` VALUES ('314', '33', '20', '3', '1', '46', 'A');
INSERT INTO `expense_detail_history` VALUES ('315', '33', '21', '3', '1', '50', '2017-11-26');
INSERT INTO `expense_detail_history` VALUES ('316', '33', '22', '3', '1', '53', '2017-11-26');
INSERT INTO `expense_detail_history` VALUES ('317', '33', '23', '3', '1', '54', '1');
INSERT INTO `expense_detail_history` VALUES ('318', '33', '24', '3', '1', '36', 'A');

-- ----------------------------
-- Table structure for expense_exchange
-- ----------------------------
DROP TABLE IF EXISTS `expense_exchange`;
CREATE TABLE `expense_exchange` (
  `exp_exchange_id` int(11) NOT NULL AUTO_INCREMENT,
  `id_exp` varchar(255) DEFAULT NULL,
  `remarks` varchar(100) DEFAULT NULL,
  `from_currency_id` int(11) DEFAULT NULL,
  `from_amounts` double(15,2) DEFAULT NULL,
  `to_currency_id` int(11) DEFAULT NULL,
  `to_amounts` double(15,2) DEFAULT NULL,
  `rates` double(15,6) DEFAULT NULL,
  `exchange_date` date DEFAULT NULL,
  PRIMARY KEY (`exp_exchange_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of expense_exchange
-- ----------------------------
INSERT INTO `expense_exchange` VALUES ('1', '1', 'Exchange from IDR to THB', '1', '1000000.00', '4', '500000.00', '0.500000', '2017-11-17');
INSERT INTO `expense_exchange` VALUES ('2', '2', 'Exchange from IDR to PHP', '1', '500000.00', '5', '1000000.00', '2.000000', '2017-11-17');

-- ----------------------------
-- Table structure for expense_history
-- ----------------------------
DROP TABLE IF EXISTS `expense_history`;
CREATE TABLE `expense_history` (
  `exp_history_id` int(10) NOT NULL AUTO_INCREMENT,
  `id_exp` varchar(100) NOT NULL,
  `status_id` int(10) NOT NULL,
  `user_act` int(100) NOT NULL,
  `date` datetime NOT NULL,
  `notes` text,
  PRIMARY KEY (`exp_history_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of expense_history
-- ----------------------------
INSERT INTO `expense_history` VALUES ('1', '1', '2', '1', '2017-11-17 14:14:36', '');
INSERT INTO `expense_history` VALUES ('2', '2', '2', '1', '2017-11-17 21:55:34', '');
INSERT INTO `expense_history` VALUES ('3', '1', '10', '4', '2017-11-17 22:23:49', '');
INSERT INTO `expense_history` VALUES ('4', '1', '2', '1', '2017-11-17 22:31:09', '');
INSERT INTO `expense_history` VALUES ('5', '1', '7', '4', '2017-11-17 22:33:47', '');
INSERT INTO `expense_history` VALUES ('6', '1', '2', '1', '2017-11-17 22:34:59', '');
INSERT INTO `expense_history` VALUES ('7', '1', '4', '4', '2017-11-17 22:45:36', '');
INSERT INTO `expense_history` VALUES ('8', '1', '13', '0', '2017-11-17 22:45:36', 'Send to finance by system');
INSERT INTO `expense_history` VALUES ('9', '2', '4', '4', '2017-11-17 22:45:59', '');
INSERT INTO `expense_history` VALUES ('10', '2', '13', '0', '2017-11-17 22:45:59', 'Send to finance by system');
INSERT INTO `expense_history` VALUES ('11', '2', '11', '2', '2017-11-18 00:04:59', '');
INSERT INTO `expense_history` VALUES ('12', '1', '11', '2', '2017-11-18 00:08:12', '');

-- ----------------------------
-- Table structure for expense_item
-- ----------------------------
DROP TABLE IF EXISTS `expense_item`;
CREATE TABLE `expense_item` (
  `exp_item_id` int(10) NOT NULL AUTO_INCREMENT,
  `id_exp` int(10) NOT NULL,
  `item_id` int(10) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `item_date` date DEFAULT NULL,
  `currency_id` int(10) DEFAULT NULL,
  `currency_rate` double(15,6) DEFAULT NULL,
  `currency_offset_id` int(11) DEFAULT NULL,
  `currency_offset_rate` double(15,6) DEFAULT NULL,
  `currency_rate_exchanged` double(15,6) DEFAULT NULL,
  `amounts` double(15,2) DEFAULT '0.00',
  `payment_type` int(11) DEFAULT NULL,
  `cnb` int(1) DEFAULT '0',
  `created_date` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`exp_item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of expense_item
-- ----------------------------
INSERT INTO `expense_item` VALUES ('2', '1', '8', null, null, '4', '2.000000', '1', '0.500000', '0.500000', '5000.00', '1', '0', '2017-11-17 14:04:15', '1', '2017-11-20 19:11:50', '8');
INSERT INTO `expense_item` VALUES ('3', '1', '5', null, null, '4', '2.000000', '1', '0.500000', '0.500000', '100.00', '1', '0', '2017-11-17 14:06:17', '1', '2017-11-26 12:30:55', '8');
INSERT INTO `expense_item` VALUES ('4', '2', null, 'Item A', '2017-11-17', '5', '0.500000', '1', '2.000000', '2.000000', '100000.00', '1', '0', '2017-11-17 21:32:36', '1', '2017-11-17 21:39:21', '1');
INSERT INTO `expense_item` VALUES ('5', '2', null, 'Item B', '2017-11-17', '5', '0.500000', '1', '2.000000', '2.000000', '700000.00', '1', '0', '2017-11-17 21:39:38', '1', null, null);
INSERT INTO `expense_item` VALUES ('6', '2', null, 'Item C', '2017-11-17', '1', '1.000000', '1', '1.000000', '1.000000', '100000.00', '1', '0', '2017-11-17 21:39:57', '1', '2017-11-17 21:41:46', '1');
INSERT INTO `expense_item` VALUES ('7', '3', '3', null, null, '1', '1.000000', '1', '1.000000', '1.000000', '1111.00', '1', '0', '2017-11-18 01:25:08', '8', '2017-11-18 01:25:52', '8');

-- ----------------------------
-- Table structure for expense_item_history
-- ----------------------------
DROP TABLE IF EXISTS `expense_item_history`;
CREATE TABLE `expense_item_history` (
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime DEFAULT NULL,
  `exp_item_id` int(10) DEFAULT NULL,
  `id_exp` int(10) DEFAULT NULL,
  `item_id` int(10) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `item_date` date DEFAULT NULL,
  `currency_id` int(10) DEFAULT NULL,
  `currency_rate` double(15,2) DEFAULT NULL,
  `currency_offset_id` int(11) DEFAULT NULL,
  `currency_offset_rate` double(15,2) DEFAULT NULL,
  `currency_rate_exchanged` double(15,2) DEFAULT NULL,
  `amounts` double(15,2) DEFAULT '0.00',
  `payment_type` int(2) DEFAULT NULL,
  `cnb` int(1) DEFAULT '0',
  `created_date` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`history_id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of expense_item_history
-- ----------------------------
INSERT INTO `expense_item_history` VALUES ('1', '2017-11-18 01:54:29', '3', '1', '4', null, null, '4', '2.00', '1', '0.50', '0.50', '100.00', '1', '0', '2017-11-17 14:06:17', '1', '2017-11-18 01:52:26', '8');
INSERT INTO `expense_item_history` VALUES ('2', '2017-11-18 01:54:48', '3', '1', '4', null, null, '4', '2.00', '1', '0.50', '0.50', '100.00', '1', '0', '2017-11-17 14:06:17', '1', '2017-11-18 01:54:28', '8');
INSERT INTO `expense_item_history` VALUES ('3', '2017-11-18 01:55:02', '2', '1', '3', null, null, '4', '2.00', '1', '0.50', '0.50', '5000.00', '1', '0', '2017-11-17 14:04:15', '1', null, null);
INSERT INTO `expense_item_history` VALUES ('4', '2017-11-18 03:51:19', '3', '1', '4', null, null, '4', '2.00', '1', '0.50', '0.50', '100.00', '1', '0', '2017-11-17 14:06:17', '1', '2017-11-18 01:54:48', '8');
INSERT INTO `expense_item_history` VALUES ('5', '2017-11-18 03:51:33', '3', '1', '4', null, null, '4', '2.00', '1', '0.50', '0.50', '100.00', '1', '0', '2017-11-17 14:06:17', '1', '2017-11-18 03:51:19', '8');
INSERT INTO `expense_item_history` VALUES ('6', '2017-11-18 03:51:57', '3', '1', '4', null, null, '4', '2.00', '1', '0.50', '0.50', '100.00', '1', '0', '2017-11-17 14:06:17', '1', '2017-11-18 03:51:33', '8');
INSERT INTO `expense_item_history` VALUES ('7', '2017-11-18 03:53:10', '3', '1', '4', null, null, '4', '2.00', '1', '0.50', '0.50', '100.00', '1', '0', '2017-11-17 14:06:17', '1', '2017-11-18 03:51:57', '8');
INSERT INTO `expense_item_history` VALUES ('8', '2017-11-18 03:53:19', '3', '1', '85', null, null, '4', '2.00', '1', '0.50', '0.50', '100.00', '1', '0', '2017-11-17 14:06:17', '1', '2017-11-18 03:53:10', '8');
INSERT INTO `expense_item_history` VALUES ('9', '2017-11-18 03:53:40', '3', '1', '85', null, null, '4', '2.00', '1', '0.50', '0.50', '100.00', '1', '0', '2017-11-17 14:06:17', '1', '2017-11-18 03:53:19', '8');
INSERT INTO `expense_item_history` VALUES ('10', '2017-11-20 18:48:50', '3', '1', '85', null, null, '4', '2.00', '1', '0.50', '0.50', '100.00', '1', '0', '2017-11-17 14:06:17', '1', '2017-11-18 03:53:40', '8');
INSERT INTO `expense_item_history` VALUES ('11', '2017-11-20 18:49:05', '2', '1', '3', null, null, '4', '2.00', '1', '0.50', '0.50', '5000.00', '1', '0', '2017-11-17 14:04:15', '1', '2017-11-18 01:55:02', '8');
INSERT INTO `expense_item_history` VALUES ('12', '2017-11-20 19:11:50', '2', '1', '4', null, null, '4', '2.00', '1', '0.50', '0.50', '5000.00', '1', '0', '2017-11-17 14:04:15', '1', '2017-11-20 18:49:05', '8');
INSERT INTO `expense_item_history` VALUES ('13', '2017-11-22 03:21:12', '3', '1', '85', null, null, '4', '2.00', '1', '0.50', '0.50', '100.00', '1', '0', '2017-11-17 14:06:17', '1', '2017-11-20 18:48:50', '8');
INSERT INTO `expense_item_history` VALUES ('14', '2017-11-26 09:37:43', '3', '1', '85', null, null, '4', '2.00', '1', '0.50', '0.50', '100.00', '1', '0', '2017-11-17 14:06:17', '1', '2017-11-22 03:21:12', '8');
INSERT INTO `expense_item_history` VALUES ('15', '2017-11-26 10:45:33', '3', '1', '8', null, null, '4', '2.00', '1', '0.50', '0.50', '100.00', '1', '0', '2017-11-17 14:06:17', '1', '2017-11-26 09:37:43', '8');
INSERT INTO `expense_item_history` VALUES ('16', '2017-11-26 10:50:56', '3', '1', '5', null, null, '4', '2.00', '1', '0.50', '0.50', '100.00', '1', '0', '2017-11-17 14:06:17', '1', '2017-11-26 10:45:33', '8');
INSERT INTO `expense_item_history` VALUES ('17', '2017-11-26 10:51:06', '3', '1', '3', null, null, '4', '2.00', '1', '0.50', '0.50', '100.00', '1', '0', '2017-11-17 14:06:17', '1', '2017-11-26 10:50:56', '8');
INSERT INTO `expense_item_history` VALUES ('18', '2017-11-26 11:37:30', '3', '1', '3', null, null, '4', '2.00', '1', '0.50', '0.50', '100.00', '1', '0', '2017-11-17 14:06:17', '1', '2017-11-26 10:51:06', '8');
INSERT INTO `expense_item_history` VALUES ('19', '2017-11-26 11:39:59', '3', '1', '5', null, null, '4', '2.00', '1', '0.50', '0.50', '100.00', '1', '0', '2017-11-17 14:06:17', '1', '2017-11-26 11:37:30', '8');
INSERT INTO `expense_item_history` VALUES ('20', '2017-11-26 11:40:16', '3', '1', '3', null, null, '4', '2.00', '1', '0.50', '0.50', '100.00', '1', '0', '2017-11-17 14:06:17', '1', '2017-11-26 11:39:59', '8');
INSERT INTO `expense_item_history` VALUES ('21', '2017-11-26 11:40:45', '3', '1', '6', null, null, '4', '2.00', '1', '0.50', '0.50', '100.00', '1', '0', '2017-11-17 14:06:17', '1', '2017-11-26 11:40:16', '8');
INSERT INTO `expense_item_history` VALUES ('22', '2017-11-26 11:48:15', '3', '1', '6', null, null, '4', '2.00', '1', '0.50', '0.50', '100.00', '1', '0', '2017-11-17 14:06:17', '1', '2017-11-26 11:40:45', '8');
INSERT INTO `expense_item_history` VALUES ('23', '2017-11-26 11:58:40', '3', '1', '4', null, null, '4', '2.00', '1', '0.50', '0.50', '100.00', '1', '0', '2017-11-17 14:06:17', '1', '2017-11-26 11:48:15', '8');
INSERT INTO `expense_item_history` VALUES ('24', '2017-11-26 11:59:07', '3', '1', '4', null, null, '4', '2.00', '1', '0.50', '0.50', '100.00', '1', '0', '2017-11-17 14:06:17', '1', '2017-11-26 11:58:40', '8');
INSERT INTO `expense_item_history` VALUES ('25', '2017-11-26 11:59:28', '3', '1', '3', null, null, '4', '2.00', '1', '0.50', '0.50', '100.00', '1', '0', '2017-11-17 14:06:17', '1', '2017-11-26 11:59:07', '8');
INSERT INTO `expense_item_history` VALUES ('26', '2017-11-26 12:05:50', '3', '1', '3', null, null, '1', '1.00', '1', '1.00', '1.00', '100.00', '1', '0', '2017-11-17 14:06:17', '1', '2017-11-26 11:59:28', '8');
INSERT INTO `expense_item_history` VALUES ('27', '2017-11-26 12:07:36', '3', '1', '3', null, null, '4', null, '1', '0.50', '0.50', '100.00', '1', '0', '2017-11-17 14:06:17', '1', '2017-11-26 12:05:49', '8');
INSERT INTO `expense_item_history` VALUES ('28', '2017-11-26 12:20:35', '3', '1', '3', null, null, '1', null, '1', '1.00', '1.00', '100.00', '1', '0', '2017-11-17 14:06:17', '1', '2017-11-26 12:07:36', '8');
INSERT INTO `expense_item_history` VALUES ('29', '2017-11-26 12:21:31', '3', '1', '3', null, null, '4', '2.00', '1', '0.50', '0.50', '100.00', '1', '0', '2017-11-17 14:06:17', '1', '2017-11-26 12:20:35', '8');
INSERT INTO `expense_item_history` VALUES ('30', '2017-11-26 12:28:27', '3', '1', '3', null, null, '4', '2.00', '1', '0.50', '0.50', '100.00', '1', '0', '2017-11-17 14:06:17', '1', '2017-11-26 12:20:35', '8');
INSERT INTO `expense_item_history` VALUES ('31', '2017-11-26 12:29:02', '3', '1', '3', null, null, '4', '2.00', '1', '0.50', '0.50', '100.00', '1', '0', '2017-11-17 14:06:17', '1', '2017-11-26 12:20:35', '8');
INSERT INTO `expense_item_history` VALUES ('32', '2017-11-26 12:30:10', '3', '1', '3', null, null, '4', '2.00', '1', '0.50', '0.50', '100.00', '1', '0', '2017-11-17 14:06:17', '1', '2017-11-26 12:20:35', '8');
INSERT INTO `expense_item_history` VALUES ('33', '2017-11-26 12:30:55', '3', '1', '3', null, null, '4', '2.00', '1', '0.50', '0.50', '100.00', '1', '0', '2017-11-17 14:06:17', '1', '2017-11-26 12:20:35', '8');

-- ----------------------------
-- Table structure for expense_table
-- ----------------------------
DROP TABLE IF EXISTS `expense_table`;
CREATE TABLE `expense_table` (
  `id_exp` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(30) DEFAULT 'claim',
  `exp_no` varchar(50) NOT NULL,
  `subject_exp` varchar(150) NOT NULL,
  `date` datetime NOT NULL,
  `type` int(11) DEFAULT NULL,
  `purpose` int(11) DEFAULT NULL,
  `other_purpose` text,
  `attachment` text,
  `id_user` int(11) NOT NULL,
  `received_by` varchar(50) DEFAULT NULL,
  `received_date` datetime DEFAULT NULL,
  `date_end` date NOT NULL,
  `date_start` date NOT NULL,
  `status` int(11) NOT NULL,
  `adv_ref` int(10) DEFAULT NULL,
  `amounts` double(15,2) DEFAULT '0.00',
  `location` varchar(200) DEFAULT NULL,
  `participant` int(11) DEFAULT NULL,
  `activity` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id_exp`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of expense_table
-- ----------------------------
INSERT INTO `expense_table` VALUES ('1', 'expense', 'EXP#0046', 'Reambuse Trial', '2017-11-17 13:10:26', '1', '7', '', 'expense_1.jpeg', '1', '2', '2017-11-18 00:08:12', '2017-11-18', '2017-11-17', '11', '0', '10200.00', null, null, null);
INSERT INTO `expense_table` VALUES ('2', 'expense', 'EXP#0047', 'Reambuse Crop', '2017-11-17 14:22:04', '3', '10', '', 'expense_2.jpeg', '1', '2', '2017-11-18 00:04:59', '2017-11-18', '2017-11-17', '11', '0', '500000.00', 'Jakarta', '100', 'Promosi');
INSERT INTO `expense_table` VALUES ('3', 'expense', 'EXP#0048', 'aa', '2017-11-18 01:24:44', '1', '7', '', null, '8', null, null, '2017-11-19', '2017-11-18', '1', '0', '1111.00', null, null, null);

-- ----------------------------
-- Table structure for item_form_table
-- ----------------------------
DROP TABLE IF EXISTS `item_form_table`;
CREATE TABLE `item_form_table` (
  `item_form_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `item_form_label` varchar(100) NOT NULL,
  `item_form_editor` varchar(100) NOT NULL,
  `item_form_type` varchar(100) NOT NULL,
  `option` varchar(150) DEFAULT NULL,
  `index` varchar(100) NOT NULL,
  `item_id` varchar(100) NOT NULL,
  `mandatory` int(1) DEFAULT '0',
  PRIMARY KEY (`item_form_id`)
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of item_form_table
-- ----------------------------
INSERT INTO `item_form_table` VALUES ('1', 'Jenis Tiket', 'dropdown', 'number', '[{\"text\":\"Tiket Pesawat\",\"value\":\"1\"},{\"text\":\"Tiket Kereta\",\"value\":\"2\"}]', '0', '85', '1');
INSERT INTO `item_form_table` VALUES ('2', 'Tujuan', 'text', 'string', '', '1', '85', '0');
INSERT INTO `item_form_table` VALUES ('3', 'Tanggal Keberangkatan', 'datepicker', 'date', '', '2', '85', '0');
INSERT INTO `item_form_table` VALUES ('4', 'Tanggal Tiba', 'datepicker', 'date', '', '3', '85', '0');
INSERT INTO `item_form_table` VALUES ('8', 'Start Date Kost', 'datepicker', 'date', '', '0', '74', '1');
INSERT INTO `item_form_table` VALUES ('9', 'End Date Kost', 'datepicker', 'date', '', '1', '74', '1');
INSERT INTO `item_form_table` VALUES ('10', 'Lokasi', 'text', 'string', '', '2', '74', '1');
INSERT INTO `item_form_table` VALUES ('15', 'Keterangan', 'text', 'string', '', '1', '76', '0');
INSERT INTO `item_form_table` VALUES ('17', 'Keterangan', 'text', 'string', '', '1', '77', '0');
INSERT INTO `item_form_table` VALUES ('19', 'Keterangan', 'text', 'string', '', '1', '78', '0');
INSERT INTO `item_form_table` VALUES ('21', 'Keterangan', 'text', 'string', null, '1', '80', '0');
INSERT INTO `item_form_table` VALUES ('22', 'Tanggal pengisian', 'datepicker', 'date', null, '0', '82', '0');
INSERT INTO `item_form_table` VALUES ('23', 'Jenis BBM', 'dropdown', 'string', '[{\"text\":\"Premium\", \"value\":\"1\"},{\"text\":\"Pertalite\", \"value\":\"2\"},{\"text\":\"Pertamax\", \"value\":\"3\"},{\"text\":\"Solar\", \"value\":\"4\"}]', '1', '82', '0');
INSERT INTO `item_form_table` VALUES ('24', 'KM pengisian', 'text', 'number', null, '2', '82', '0');
INSERT INTO `item_form_table` VALUES ('26', 'Nomer Polisi', 'text', 'string', null, '4', '82', '0');
INSERT INTO `item_form_table` VALUES ('29', 'Tanggal', 'datepicker', 'date', null, '0', '83', '0');
INSERT INTO `item_form_table` VALUES ('30', 'KM awal', 'text', 'number', null, '1', '83', '0');
INSERT INTO `item_form_table` VALUES ('31', 'KM akhir', 'text', 'number', null, '2', '83', '0');
INSERT INTO `item_form_table` VALUES ('35', 'Tanggal', 'datepicker', 'date', '[]', '1', '3', '0');
INSERT INTO `item_form_table` VALUES ('36', 'Tujuan', 'text', 'string', null, '1', '3', '0');
INSERT INTO `item_form_table` VALUES ('40', 'Tanggal', 'datepicker', 'date', null, '0', '4', '0');
INSERT INTO `item_form_table` VALUES ('41', 'Lokasi', 'text', 'string', null, '1', '4', '0');
INSERT INTO `item_form_table` VALUES ('45', 'Tanggal', 'datepicker', 'date', null, '0', '5', '0');
INSERT INTO `item_form_table` VALUES ('46', 'Tujuan', 'text', 'string', null, '1', '5', '0');
INSERT INTO `item_form_table` VALUES ('50', 'Start Date Sewa', 'datepicker', 'date', null, '0', '6', '0');
INSERT INTO `item_form_table` VALUES ('53', 'End Date Sewa', 'datepicker', 'date', null, '1', '6', '0');
INSERT INTO `item_form_table` VALUES ('54', 'Nomer polisi', 'text', 'string', null, '2', '6', '0');
INSERT INTO `item_form_table` VALUES ('62', 'Remark', 'text', 'string', null, '7', '82', '0');
INSERT INTO `item_form_table` VALUES ('63', 'Remark', 'text', 'string', null, '6', '83', '0');
INSERT INTO `item_form_table` VALUES ('64', 'Tanggal', 'datepicker', 'date', null, '0', '7', '0');
INSERT INTO `item_form_table` VALUES ('65', 'Tujuan', 'text', 'string', null, '1', '7', '0');
INSERT INTO `item_form_table` VALUES ('67', 'Nomer polisi', 'text', 'string', null, '3', '7', '0');
INSERT INTO `item_form_table` VALUES ('70', 'Tanggal', 'datepicker', 'date', null, '0', '8', '0');
INSERT INTO `item_form_table` VALUES ('71', 'Tujuan', 'text', 'string', null, '1', '8', '0');
INSERT INTO `item_form_table` VALUES ('75', 'Tanggal', 'datepicker', 'date', null, '0', '10', '0');
INSERT INTO `item_form_table` VALUES ('76', 'Nama hotel', 'text', 'string', null, '1', '10', '0');
INSERT INTO `item_form_table` VALUES ('78', 'Tanggal check in', 'datepicker', 'date', null, '3', '10', '0');
INSERT INTO `item_form_table` VALUES ('79', 'Tanggal check out', 'datepicker', 'date', null, '4', '10', '0');
INSERT INTO `item_form_table` VALUES ('82', 'Tanggal', 'datepicker', 'date', null, '0', '11', '0');
INSERT INTO `item_form_table` VALUES ('83', 'Tujuan', 'text', 'string', null, '1', '11', '0');
INSERT INTO `item_form_table` VALUES ('87', 'Tanggal', 'datepicker', 'date', null, '0', '12', '0');
INSERT INTO `item_form_table` VALUES ('91', 'Tanggal', 'datepicker', 'date', null, '0', '13', '0');
INSERT INTO `item_form_table` VALUES ('95', 'Tanggal', 'datepicker', 'date', null, '0', '15', '0');
INSERT INTO `item_form_table` VALUES ('96', 'Tujuan', 'text', 'string', null, '1', '15', '0');
INSERT INTO `item_form_table` VALUES ('100', 'Jenis Tiket', 'dropdown', 'string', '[{\"text\":\"Tiket Pesawat\", \"value\":\"1\"}, {\"text\":\"Tiket Kereta\", \"value\":\"2\"}]', '0', '16', '0');
INSERT INTO `item_form_table` VALUES ('101', 'Tujuan', 'text', 'string', null, '1', '16', '0');
INSERT INTO `item_form_table` VALUES ('102', 'Tanggal Berangkat', 'datepicker', 'date', null, '2', '16', '0');
INSERT INTO `item_form_table` VALUES ('103', 'Tanggal Tiba', 'datepicker', 'date', null, '3', '16', '0');
INSERT INTO `item_form_table` VALUES ('112', 'Provider', 'text', 'string', '', '0', '54', '0');

-- ----------------------------
-- Table structure for item_form_table_backup
-- ----------------------------
DROP TABLE IF EXISTS `item_form_table_backup`;
CREATE TABLE `item_form_table_backup` (
  `item_form_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `item_form_label` varchar(100) NOT NULL,
  `item_form_editor` varchar(100) NOT NULL,
  `item_form_type` varchar(100) NOT NULL,
  `option` varchar(150) DEFAULT NULL,
  `index` varchar(100) NOT NULL,
  `item_id` varchar(100) NOT NULL,
  PRIMARY KEY (`item_form_id`)
) ENGINE=InnoDB AUTO_INCREMENT=186 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of item_form_table_backup
-- ----------------------------
INSERT INTO `item_form_table_backup` VALUES ('1', 'Jenis Tiket', 'radio', 'number', '[{\"text\":\"Tiket Pesawat\", \"value\":1}, {\"text\":\"Tiket Kereta\", \"value\":2}]', '0', '1');
INSERT INTO `item_form_table_backup` VALUES ('2', 'Tujuan', 'text', 'string', '', '1', '1');
INSERT INTO `item_form_table_backup` VALUES ('3', 'Tanggal Keberangkatan', 'datepicker', 'date', '', '2', '1');
INSERT INTO `item_form_table_backup` VALUES ('4', 'Tanggal Tiba', 'datepicker', 'date', '', '3', '1');
INSERT INTO `item_form_table_backup` VALUES ('5', 'Nilai Tiket', 'text', 'number', '', '4', '1');
INSERT INTO `item_form_table_backup` VALUES ('6', 'Cash / Credit Card', 'radio', 'number', '[{\"text\":\"Cash\", \"value\":1},{\"text\":\"Credit Card\", \"value\":2}]', '5', '1');
INSERT INTO `item_form_table_backup` VALUES ('7', 'Currency', 'currency', 'number', '', '6', '1');
INSERT INTO `item_form_table_backup` VALUES ('8', 'Start Date Kost', 'datepicker', 'date', '', '0', '74');
INSERT INTO `item_form_table_backup` VALUES ('9', 'End Date Kost', 'datepicker', 'date', '', '1', '74');
INSERT INTO `item_form_table_backup` VALUES ('10', 'Lokasi', 'text', 'string', '', '2', '74');
INSERT INTO `item_form_table_backup` VALUES ('11', 'Nominal', 'text', 'number', '', '3', '74');
INSERT INTO `item_form_table_backup` VALUES ('12', 'Cash / Credit Card', 'radio', 'number', '[{\"text\":\"Cash\", \"value\":1},{\"text\":\"Credit Card\", \"value\":2}]', '4', '74');
INSERT INTO `item_form_table_backup` VALUES ('13', 'Currency', 'currency', 'number', '', '5', '74');
INSERT INTO `item_form_table_backup` VALUES ('14', 'Nilai', 'text', 'number', '', '0', '76');
INSERT INTO `item_form_table_backup` VALUES ('15', 'Keterangan', 'text', 'string', '', '1', '76');
INSERT INTO `item_form_table_backup` VALUES ('16', 'Nilai', 'text', 'number', '', '0', '77');
INSERT INTO `item_form_table_backup` VALUES ('17', 'Keterangan', 'text', 'string', '', '1', '77');
INSERT INTO `item_form_table_backup` VALUES ('18', 'Nilai', 'text', 'number', '', '0', '78');
INSERT INTO `item_form_table_backup` VALUES ('19', 'Keterangan', 'text', 'string', '', '1', '78');
INSERT INTO `item_form_table_backup` VALUES ('20', 'Nilai', 'text', 'number', null, '0', '80');
INSERT INTO `item_form_table_backup` VALUES ('21', 'Keterangan', 'text', 'string', null, '1', '80');
INSERT INTO `item_form_table_backup` VALUES ('22', 'Tanggal pengisian', 'datepicker', 'date', null, '0', '82');
INSERT INTO `item_form_table_backup` VALUES ('23', 'Jenis BBM', 'dropdown', 'string', '[{\"text\":\"Premium\", \"value\":1},{\"text\":\"Pertalite\", \"value\":2},{\"text\":\"Pertamax\", \"value\":3},{\"text\":\"Solar\", \"value\":4}]', '1', '82');
INSERT INTO `item_form_table_backup` VALUES ('24', 'KM pengisian', 'text', 'number', null, '2', '82');
INSERT INTO `item_form_table_backup` VALUES ('25', 'Nilai BBM', 'text', 'number', null, '3', '82');
INSERT INTO `item_form_table_backup` VALUES ('26', 'Nomer Polisi', 'text', 'string', null, '4', '82');
INSERT INTO `item_form_table_backup` VALUES ('27', 'Cash / Credit Card', 'radio', 'number', '[{\"text\":\"Cash\", \"value\":1},{\"text\":\"Credit Card\", \"value\":2}]', '5', '82');
INSERT INTO `item_form_table_backup` VALUES ('28', 'Currency', 'currency', 'number', null, '6', '82');
INSERT INTO `item_form_table_backup` VALUES ('29', 'Tanggal', 'datepicker', 'date', null, '0', '83');
INSERT INTO `item_form_table_backup` VALUES ('30', 'KM awal', 'text', 'number', null, '1', '83');
INSERT INTO `item_form_table_backup` VALUES ('31', 'KM akhir', 'text', 'number', null, '2', '83');
INSERT INTO `item_form_table_backup` VALUES ('32', 'Nilai', 'text', 'number', null, '3', '83');
INSERT INTO `item_form_table_backup` VALUES ('33', 'Cash / Credit Card', 'radio', 'number', '[{\"text\":\"Cash\", \"value\":1},{\"text\":\"Credit Card\", \"value\":2}]', '4', '83');
INSERT INTO `item_form_table_backup` VALUES ('34', 'Currency', 'currency', 'number', null, '5', '83');
INSERT INTO `item_form_table_backup` VALUES ('35', 'Tanggal', 'datepicker', 'date', null, '0', '3');
INSERT INTO `item_form_table_backup` VALUES ('36', 'Tujuan', 'text', 'string', null, '1', '3');
INSERT INTO `item_form_table_backup` VALUES ('37', 'Nilai', 'text', 'number', null, '2', '3');
INSERT INTO `item_form_table_backup` VALUES ('38', 'Cash / Credit Card', 'radio', 'number', '[{\"text\":\"Cash\", \"value\":1},{\"text\":\"Credit Card\", \"value\":2}]', '3', '3');
INSERT INTO `item_form_table_backup` VALUES ('39', 'Currency', 'currency', 'number', null, '4', '3');
INSERT INTO `item_form_table_backup` VALUES ('40', 'Tanggal', 'datepicker', 'date', null, '0', '4');
INSERT INTO `item_form_table_backup` VALUES ('41', 'Lokasi', 'text', 'string', null, '1', '4');
INSERT INTO `item_form_table_backup` VALUES ('42', 'Nilai', 'text', 'number', null, '2', '4');
INSERT INTO `item_form_table_backup` VALUES ('43', 'Cash/Credit Card', 'radio', 'number', '[{\"text\":\"Cash\", \"value\":1},{\"text\":\"Credit Card\", \"value\":2}]', '3', '4');
INSERT INTO `item_form_table_backup` VALUES ('44', 'Currency', 'currency', 'number', null, '4', '4');
INSERT INTO `item_form_table_backup` VALUES ('45', 'Tanggal', 'datepicker', 'date', null, '0', '5');
INSERT INTO `item_form_table_backup` VALUES ('46', 'Tujuan', 'text', 'string', null, '1', '5');
INSERT INTO `item_form_table_backup` VALUES ('47', 'Nilai', 'text', 'number', null, '2', '5');
INSERT INTO `item_form_table_backup` VALUES ('48', 'Cash/Credit Card', 'radio', 'number', '[{\"text\":\"Cash\", \"value\":1},{\"text\":\"Credit Card\", \"value\":2}]', '3', '5');
INSERT INTO `item_form_table_backup` VALUES ('49', 'Currency', 'currency', 'number', null, '4', '5');
INSERT INTO `item_form_table_backup` VALUES ('50', 'Start Date Sewa', 'datepicker', 'date', null, '0', '6');
INSERT INTO `item_form_table_backup` VALUES ('52', 'End Date Sewa', 'datepicker', 'date', null, '1', '6');
INSERT INTO `item_form_table_backup` VALUES ('54', 'Nomer polisi', 'text', 'string', null, '2', '6');
INSERT INTO `item_form_table_backup` VALUES ('56', 'Nilai', 'text', 'number', null, '3', '6');
INSERT INTO `item_form_table_backup` VALUES ('58', 'Cash/Credit Card', 'radio', 'number', '[{\"text\":\"Cash\", \"value\":1},{\"text\":\"Credit Card\", \"value\":2}]', '4', '6');
INSERT INTO `item_form_table_backup` VALUES ('60', 'Currency', 'currency', 'number', null, '5', '6');
INSERT INTO `item_form_table_backup` VALUES ('62', 'Remark', 'text', 'string', null, '7', '82');
INSERT INTO `item_form_table_backup` VALUES ('63', 'Remark', 'text', 'string', null, '6', '83');
INSERT INTO `item_form_table_backup` VALUES ('64', 'Tanggal', 'datepicker', 'date', null, '0', '7');
INSERT INTO `item_form_table_backup` VALUES ('65', 'Tujuan', 'text', 'string', null, '1', '7');
INSERT INTO `item_form_table_backup` VALUES ('66', 'Nilai', 'text', 'number', null, '2', '7');
INSERT INTO `item_form_table_backup` VALUES ('67', 'Nomer polisi', 'text', 'string', null, '3', '7');
INSERT INTO `item_form_table_backup` VALUES ('68', 'Cash/Credit Card', 'radio', 'string', '[{\"text\":\"Cash\", \"value\":1},{\"text\":\"Credit Card\", \"value\":2}]', '4', '7');
INSERT INTO `item_form_table_backup` VALUES ('69', 'Currency', 'currency', 'number', null, '5', '7');
INSERT INTO `item_form_table_backup` VALUES ('70', 'Tanggal', 'datepicker', 'date', null, '0', '8');
INSERT INTO `item_form_table_backup` VALUES ('71', 'Tujuan', 'text', 'string', null, '1', '8');
INSERT INTO `item_form_table_backup` VALUES ('72', 'Nilai', 'text', 'number', null, '2', '8');
INSERT INTO `item_form_table_backup` VALUES ('73', 'Cash/Credit Card', 'radio', 'string', '[{\"text\":\"Cash\", \"value\":1},{\"text\":\"Credit Card\", \"value\":2}]', '3', '8');
INSERT INTO `item_form_table_backup` VALUES ('74', 'Currency', 'currency', 'number', null, '4', '8');
INSERT INTO `item_form_table_backup` VALUES ('75', 'Tanggal', 'datepicker', 'date', null, '0', '10');
INSERT INTO `item_form_table_backup` VALUES ('76', 'Nama hotel', 'text', 'string', null, '1', '10');
INSERT INTO `item_form_table_backup` VALUES ('77', 'Nilai', 'text', 'number', null, '2', '10');
INSERT INTO `item_form_table_backup` VALUES ('78', 'Tanggal check in', 'datepicker', 'date', null, '3', '10');
INSERT INTO `item_form_table_backup` VALUES ('79', 'Tanggal check out', 'datepicker', 'date', null, '4', '10');
INSERT INTO `item_form_table_backup` VALUES ('80', 'Cash/Credit Card', 'radio', 'string', '[{\"text\":\"Cash\", \"value\":1},{\"text\":\"Credit Card\", \"value\":2}]', '5', '10');
INSERT INTO `item_form_table_backup` VALUES ('81', 'Currency', 'currency', 'number', null, '6', '10');
INSERT INTO `item_form_table_backup` VALUES ('82', 'Tanggal', 'datepicker', 'date', null, '0', '11');
INSERT INTO `item_form_table_backup` VALUES ('83', 'Tujuan', 'text', 'string', null, '1', '11');
INSERT INTO `item_form_table_backup` VALUES ('84', 'Nilai', 'text', 'number', null, '2', '11');
INSERT INTO `item_form_table_backup` VALUES ('85', 'Cash/Credit Card', 'radio', 'string', '[{\"text\":\"Cash\", \"value\":1},{\"text\":\"Credit Card\", \"value\":2}]', '3', '11');
INSERT INTO `item_form_table_backup` VALUES ('86', 'Currency', 'currency', 'number', null, '4', '11');
INSERT INTO `item_form_table_backup` VALUES ('87', 'Tanggal', 'datepicker', 'date', null, '1', '23');
INSERT INTO `item_form_table_backup` VALUES ('88', 'Tujuan', 'text', 'string', null, '2', '23');
INSERT INTO `item_form_table_backup` VALUES ('89', 'Nilai', 'text', 'number', null, '3', '23');
INSERT INTO `item_form_table_backup` VALUES ('90', 'Cash/Credit Card', 'radio', 'string', '[{\"text\":\"Cash\", \"value\":1},{\"text\":\"Credit Card\", \"value\":2}]', '4', '23');
INSERT INTO `item_form_table_backup` VALUES ('91', 'Currency', 'currency', 'number', null, '5', '23');
INSERT INTO `item_form_table_backup` VALUES ('92', 'Tanggal', 'datepicker', 'date', null, '0', '23');
INSERT INTO `item_form_table_backup` VALUES ('93', 'Tujuan', 'text', 'string', null, '1', '23');
INSERT INTO `item_form_table_backup` VALUES ('94', 'Nilai', 'text', 'number', null, '2', '23');
INSERT INTO `item_form_table_backup` VALUES ('95', 'Cash/Credit Card', 'radio', 'string', '[{\"text\":\"Cash\", \"value\":1},{\"text\":\"Credit Card\", \"value\":2}]', '3', '23');
INSERT INTO `item_form_table_backup` VALUES ('96', 'Currency', 'currency', 'number', null, '0', '23');
INSERT INTO `item_form_table_backup` VALUES ('97', 'Tanggal', 'datepicker', 'date', '', '1', '23');
INSERT INTO `item_form_table_backup` VALUES ('98', 'Tujuan', 'text', 'string', '', '2', '23');
INSERT INTO `item_form_table_backup` VALUES ('99', 'Nilai', 'text', 'number', '', '3', '23');
INSERT INTO `item_form_table_backup` VALUES ('100', 'Cash/Credit Card', 'radio', 'string', '[{\"text\":\"Cash\", \"value\":1},{\"text\":\"Credit Card\", \"value\":2}]', '4', '23');
INSERT INTO `item_form_table_backup` VALUES ('101', 'Currency', 'currency', 'number', '', '5', '23');
INSERT INTO `item_form_table_backup` VALUES ('102', 'Tanggal', 'datepicker', 'date', '', '0', '23');
INSERT INTO `item_form_table_backup` VALUES ('103', 'Tujuan', 'text', 'string', '', '1', '23');
INSERT INTO `item_form_table_backup` VALUES ('104', 'Nilai', 'text', 'number', '', '2', '23');
INSERT INTO `item_form_table_backup` VALUES ('105', 'Cash/Credit Card', 'radio', 'string', '[{\"text\":\"Cash\", \"value\":1},{\"text\":\"Credit Card\", \"value\":2}]', '3', '23');
INSERT INTO `item_form_table_backup` VALUES ('106', 'Currency', 'currency', 'number', '', '4', '23');
INSERT INTO `item_form_table_backup` VALUES ('107', 'Tanggal', 'datepicker', 'date', '', '0', '23');
INSERT INTO `item_form_table_backup` VALUES ('108', 'Tujuan', 'text', 'string', '', '1', '23');
INSERT INTO `item_form_table_backup` VALUES ('109', 'Nilai', 'text', 'number', '', '2', '23');
INSERT INTO `item_form_table_backup` VALUES ('110', 'Cash/Credit Card', 'radio', 'string', '[{\"text\":\"Cash\", \"value\":1},{\"text\":\"Credit Card\", \"value\":2}]', '3', '23');
INSERT INTO `item_form_table_backup` VALUES ('111', 'Currency', 'currency', 'number', '', '4', '23');
INSERT INTO `item_form_table_backup` VALUES ('112', 'Tanggal', 'datepicker', 'date', '', '0', '24');
INSERT INTO `item_form_table_backup` VALUES ('113', 'Parkir', 'text', 'string', '', '1', '24');
INSERT INTO `item_form_table_backup` VALUES ('114', 'Nilai', 'text', 'number', '', '2', '24');
INSERT INTO `item_form_table_backup` VALUES ('115', 'Cash/Credit Card', 'radio', 'string', '[{\"text\":\"Cash\", \"value\":1},{\"text\":\"Credit Card\", \"value\":2}]', '3', '24');
INSERT INTO `item_form_table_backup` VALUES ('116', 'Currency', 'currency', 'number', '', '4', '24');
INSERT INTO `item_form_table_backup` VALUES ('117', 'Tanggal', 'datepicker', 'date', '', '0', '25');
INSERT INTO `item_form_table_backup` VALUES ('118', 'Tujuan', 'text', 'string', '', '1', '25');
INSERT INTO `item_form_table_backup` VALUES ('119', 'Nilai', 'text', 'number', '', '2', '25');
INSERT INTO `item_form_table_backup` VALUES ('120', 'Cash/Credit Card', 'radio', 'string', '[{\"text\":\"Cash\", \"value\":1},{\"text\":\"Credit Card\", \"value\":2}]', '3', '25');
INSERT INTO `item_form_table_backup` VALUES ('121', 'Currency', 'currency', 'number', '', '4', '25');
INSERT INTO `item_form_table_backup` VALUES ('122', 'Tanggal', 'datepicker', 'date', '', '0', '27');
INSERT INTO `item_form_table_backup` VALUES ('123', 'Nama hotel', 'text', 'string', '', '1', '27');
INSERT INTO `item_form_table_backup` VALUES ('124', 'Nilai', 'text', 'number', '', '2', '27');
INSERT INTO `item_form_table_backup` VALUES ('125', 'Tanggal check in', 'datepicker', 'date', '', '3', '27');
INSERT INTO `item_form_table_backup` VALUES ('126', 'Tanggal check out', 'datepicker', 'date', '', '4', '27');
INSERT INTO `item_form_table_backup` VALUES ('127', 'Cash/Credit Card', 'radio', 'string', '[{\"text\":\"Cash\", \"value\":1},{\"text\":\"Credit Card\", \"value\":2}]', '5', '27');
INSERT INTO `item_form_table_backup` VALUES ('128', 'Currency', 'currency', 'number', '', '6', '27');
INSERT INTO `item_form_table_backup` VALUES ('129', 'Tanggal', 'datepicker', 'date', '', '0', '28');
INSERT INTO `item_form_table_backup` VALUES ('130', 'Tujuan', 'text', 'string', '', '1', '28');
INSERT INTO `item_form_table_backup` VALUES ('131', 'Nilai', 'text', 'number', '', '2', '28');
INSERT INTO `item_form_table_backup` VALUES ('132', 'Cash/Credit Card', 'radio', 'string', '[{\"text\":\"Cash\", \"value\":1},{\"text\":\"Credit Card\", \"value\":2}]', '3', '28');
INSERT INTO `item_form_table_backup` VALUES ('133', 'Currency', 'currency', 'number', '', '4', '28');
INSERT INTO `item_form_table_backup` VALUES ('134', 'Tanggal', 'datepicker', 'date', '', '0', '30');
INSERT INTO `item_form_table_backup` VALUES ('136', 'Nilai', 'text', 'number', '', '1', '30');
INSERT INTO `item_form_table_backup` VALUES ('137', 'Cash/Credit Card', 'radio', 'string', '[{\"text\":\"Cash\", \"value\":1},{\"text\":\"Credit Card\", \"value\":2}]', '2', '30');
INSERT INTO `item_form_table_backup` VALUES ('138', 'Currency', 'currency', 'number', '', '3', '30');
INSERT INTO `item_form_table_backup` VALUES ('139', 'Tanggal', 'datepicker', 'date', '', '0', '32');
INSERT INTO `item_form_table_backup` VALUES ('140', 'Tujuan', 'text', 'string', '', '1', '32');
INSERT INTO `item_form_table_backup` VALUES ('141', 'Nilai', 'text', 'number', '', '2', '32');
INSERT INTO `item_form_table_backup` VALUES ('142', 'Cash/Credit Card', 'radio', 'string', '[{\"text\":\"Cash\", \"value\":1},{\"text\":\"Credit Card\", \"value\":2}]', '3', '32');
INSERT INTO `item_form_table_backup` VALUES ('143', 'Currency', 'currency', 'number', '', '4', '32');
INSERT INTO `item_form_table_backup` VALUES ('144', 'Tanggal', 'datepicker', 'date', '', '0', '33');
INSERT INTO `item_form_table_backup` VALUES ('145', 'Tujuan', 'text', 'string', '', '1', '33');
INSERT INTO `item_form_table_backup` VALUES ('146', 'Nilai', 'text', 'number', '', '2', '33');
INSERT INTO `item_form_table_backup` VALUES ('147', 'Cash/Credit Card', 'radio', 'string', '[{\"text\":\"Cash\", \"value\":1},{\"text\":\"Credit Card\", \"value\":2}]', '3', '33');
INSERT INTO `item_form_table_backup` VALUES ('148', 'Currency', 'currency', 'number', '', '4', '33');
INSERT INTO `item_form_table_backup` VALUES ('149', 'Tanggal', 'datepicker', 'date', null, '0', '54');
INSERT INTO `item_form_table_backup` VALUES ('150', 'Start Date', 'datepicker', 'date', null, '1', '54');
INSERT INTO `item_form_table_backup` VALUES ('151', 'End Date', 'datepicker', 'date', null, '2', '54');
INSERT INTO `item_form_table_backup` VALUES ('152', 'Nomer Telepon', 'text', 'string', null, '3', '54');
INSERT INTO `item_form_table_backup` VALUES ('153', 'Nilai', 'text', 'number', null, '4', '54');
INSERT INTO `item_form_table_backup` VALUES ('154', 'Cash/Credit Card', 'radio', 'string', '[{\"text\":\"Cash\", \"value\":1},{\"text\":\"Credit Card\", \"value\":2}]', '5', '54');
INSERT INTO `item_form_table_backup` VALUES ('155', 'Currency', 'currency', 'number', null, '6', '54');
INSERT INTO `item_form_table_backup` VALUES ('156', 'Tanggal', 'datepicker', 'date', '', '0', '56');
INSERT INTO `item_form_table_backup` VALUES ('157', 'Nilai', 'text', 'number', '', '1', '56');
INSERT INTO `item_form_table_backup` VALUES ('158', 'Cash/Credit Card', 'radio', 'string', '[{\"text\":\"Cash\", \"value\":1},{\"text\":\"Credit Card\", \"value\":2}]', '2', '56');
INSERT INTO `item_form_table_backup` VALUES ('159', 'Currency', 'currency', 'number', '', '3', '56');
INSERT INTO `item_form_table_backup` VALUES ('160', 'Tanggal', 'datepicker', 'date', '', '0', '58');
INSERT INTO `item_form_table_backup` VALUES ('161', 'Nilai', 'text', 'number', '', '1', '58');
INSERT INTO `item_form_table_backup` VALUES ('162', 'Cash/Credit Card', 'radio', 'string', '[{\"text\":\"Cash\", \"value\":1},{\"text\":\"Credit Card\", \"value\":2}]', '2', '58');
INSERT INTO `item_form_table_backup` VALUES ('163', 'Currency', 'currency', 'number', '', '3', '58');
INSERT INTO `item_form_table_backup` VALUES ('164', 'Tanggal', 'datepicker', 'date', '', '0', '59');
INSERT INTO `item_form_table_backup` VALUES ('165', 'Nilai', 'text', 'number', '', '1', '59');
INSERT INTO `item_form_table_backup` VALUES ('166', 'Cash/Credit Card', 'radio', 'string', '[{\"text\":\"Cash\", \"value\":1},{\"text\":\"Credit Card\", \"value\":2}]', '2', '59');
INSERT INTO `item_form_table_backup` VALUES ('167', 'Currency', 'currency', 'number', '', '3', '59');
INSERT INTO `item_form_table_backup` VALUES ('168', 'Tanggal', 'datepicker', 'date', '', '0', '60');
INSERT INTO `item_form_table_backup` VALUES ('169', 'Nilai', 'text', 'number', '', '1', '60');
INSERT INTO `item_form_table_backup` VALUES ('170', 'Cash/Credit Card', 'radio', 'string', '[{\"text\":\"Cash\", \"value\":1},{\"text\":\"Credit Card\", \"value\":2}]', '2', '60');
INSERT INTO `item_form_table_backup` VALUES ('171', 'Currency', 'currency', 'number', '', '3', '60');
INSERT INTO `item_form_table_backup` VALUES ('172', 'Tanggal', 'datepicker', 'date', '', '0', '61');
INSERT INTO `item_form_table_backup` VALUES ('173', 'Nilai', 'text', 'number', '', '1', '61');
INSERT INTO `item_form_table_backup` VALUES ('174', 'Cash/Credit Card', 'radio', 'string', '[{\"text\":\"Cash\", \"value\":1},{\"text\":\"Credit Card\", \"value\":2}]', '2', '61');
INSERT INTO `item_form_table_backup` VALUES ('175', 'Currency', 'currency', 'number', '', '3', '61');
INSERT INTO `item_form_table_backup` VALUES ('176', 'Tanggal', 'datepicker', 'date', '', '0', '63');
INSERT INTO `item_form_table_backup` VALUES ('177', 'Tujuan Pengiriman', 'text', 'string', '', '1', '63');
INSERT INTO `item_form_table_backup` VALUES ('178', 'Nilai', 'radio', 'string', '', '2', '62');
INSERT INTO `item_form_table_backup` VALUES ('179', 'Cash/Credit Card', 'radio', 'string', '[{\"text\":\"Cash\", \"value\":1},{\"text\":\"Credit Card\", \"value\":2}]', '3', '63');
INSERT INTO `item_form_table_backup` VALUES ('180', 'Currency', 'currency', 'number', '', '4', '63');
INSERT INTO `item_form_table_backup` VALUES ('181', 'Tanggal', 'datepicker', 'date', '', '0', '65');
INSERT INTO `item_form_table_backup` VALUES ('182', 'Tujuan Pembelian', 'text', 'string', '', '1', '65');
INSERT INTO `item_form_table_backup` VALUES ('183', 'Nilai', 'text', 'number', '', '2', '65');
INSERT INTO `item_form_table_backup` VALUES ('184', 'Cash/Credit Card', 'radio', 'string', '[{\"text\":\"Cash\", \"value\":1},{\"text\":\"Credit Card\", \"value\":2}]', '3', '65');
INSERT INTO `item_form_table_backup` VALUES ('185', 'Currency', 'currency', 'number', '', '4', '65');

-- ----------------------------
-- Table structure for item_form_table_copy1
-- ----------------------------
DROP TABLE IF EXISTS `item_form_table_copy1`;
CREATE TABLE `item_form_table_copy1` (
  `item_form_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `item_form_label` varchar(100) NOT NULL,
  `item_form_editor` varchar(100) NOT NULL,
  `item_form_type` varchar(100) NOT NULL,
  `option` varchar(150) DEFAULT NULL,
  `index` varchar(100) NOT NULL,
  `item_id` varchar(100) NOT NULL,
  PRIMARY KEY (`item_form_id`)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of item_form_table_copy1
-- ----------------------------
INSERT INTO `item_form_table_copy1` VALUES ('1', 'Jenis Tiket', 'radio', 'number', '[{\"text\":\"Tiket Pesawat\", \"value\":1}, {\"text\":\"Tiket Kereta\", \"value\":2}]', '0', '84');
INSERT INTO `item_form_table_copy1` VALUES ('2', 'Tujuan', 'text', 'string', '', '1', '84');
INSERT INTO `item_form_table_copy1` VALUES ('3', 'Tanggal Keberangkatan', 'datepicker', 'date', '', '2', '84');
INSERT INTO `item_form_table_copy1` VALUES ('4', 'Tanggal Tiba', 'datepicker', 'date', '', '3', '84');
INSERT INTO `item_form_table_copy1` VALUES ('5', 'Nilai Tiket', 'text', 'number', '', '4', '84');
INSERT INTO `item_form_table_copy1` VALUES ('6', 'Cash / Credit Card', 'radio', 'number', '[{\"text\":\"Cash\", \"value\":1},{\"text\":\"Credit Card\", \"value\":2}]', '5', '84');
INSERT INTO `item_form_table_copy1` VALUES ('7', 'Currency', 'currency', 'number', '', '6', '84');
INSERT INTO `item_form_table_copy1` VALUES ('8', 'Start Date Kost', 'datepicker', 'date', '', '0', '74');
INSERT INTO `item_form_table_copy1` VALUES ('9', 'End Date Kost', 'datepicker', 'date', '', '1', '74');
INSERT INTO `item_form_table_copy1` VALUES ('10', 'Lokasi', 'text', 'string', '', '2', '74');
INSERT INTO `item_form_table_copy1` VALUES ('11', 'Nominal', 'text', 'number', '', '3', '74');
INSERT INTO `item_form_table_copy1` VALUES ('12', 'Cash / Credit Card', 'radio', 'number', '[{\"text\":\"Cash\", \"value\":1},{\"text\":\"Credit Card\", \"value\":2}]', '4', '74');
INSERT INTO `item_form_table_copy1` VALUES ('13', 'Currency', 'currency', 'number', '', '5', '74');
INSERT INTO `item_form_table_copy1` VALUES ('14', 'Nilai', 'text', 'number', '', '0', '76');
INSERT INTO `item_form_table_copy1` VALUES ('15', 'Keterangan', 'text', 'string', '', '1', '76');
INSERT INTO `item_form_table_copy1` VALUES ('16', 'Nilai', 'text', 'number', '', '0', '77');
INSERT INTO `item_form_table_copy1` VALUES ('17', 'Keterangan', 'text', 'string', '', '1', '77');
INSERT INTO `item_form_table_copy1` VALUES ('18', 'Nilai', 'text', 'number', '', '0', '78');
INSERT INTO `item_form_table_copy1` VALUES ('19', 'Keterangan', 'text', 'string', '', '1', '78');
INSERT INTO `item_form_table_copy1` VALUES ('20', 'Nilai', 'text', 'number', null, '0', '80');
INSERT INTO `item_form_table_copy1` VALUES ('21', 'Keterangan', 'text', 'string', null, '1', '80');
INSERT INTO `item_form_table_copy1` VALUES ('22', 'Tanggal pengisian', 'datepicker', 'date', null, '0', '82');
INSERT INTO `item_form_table_copy1` VALUES ('23', 'Jenis BBM', 'dropdown', 'string', '[{\"text\":\"Premium\", \"value\":1},{\"text\":\"Pertalite\", \"value\":2},{\"text\":\"Pertamax\", \"value\":3},{\"text\":\"Solar\", \"value\":4}]', '1', '82');
INSERT INTO `item_form_table_copy1` VALUES ('24', 'KM pengisian', 'text', 'number', null, '2', '82');
INSERT INTO `item_form_table_copy1` VALUES ('25', 'Nilai BBM', 'text', 'number', null, '3', '82');
INSERT INTO `item_form_table_copy1` VALUES ('26', 'Nomer Polisi', 'text', 'string', null, '4', '82');
INSERT INTO `item_form_table_copy1` VALUES ('27', 'Cash / Credit Card', 'radio', 'number', '[{\"text\":\"Cash\", \"value\":1},{\"text\":\"Credit Card\", \"value\":2}]', '5', '82');
INSERT INTO `item_form_table_copy1` VALUES ('28', 'Currency', 'currency', 'number', null, '6', '82');
INSERT INTO `item_form_table_copy1` VALUES ('29', 'Tanggal', 'datepicker', 'date', null, '0', '83');
INSERT INTO `item_form_table_copy1` VALUES ('30', 'KM awal', 'text', 'number', null, '1', '83');
INSERT INTO `item_form_table_copy1` VALUES ('31', 'KM akhir', 'text', 'number', null, '2', '83');
INSERT INTO `item_form_table_copy1` VALUES ('32', 'Nilai', 'text', 'number', null, '3', '83');
INSERT INTO `item_form_table_copy1` VALUES ('33', 'Cash / Credit Card', 'radio', 'number', '[{\"text\":\"Cash\", \"value\":1},{\"text\":\"Credit Card\", \"value\":2}]', '4', '83');
INSERT INTO `item_form_table_copy1` VALUES ('34', 'Currency', 'currency', 'number', null, '5', '83');
INSERT INTO `item_form_table_copy1` VALUES ('35', 'Tanggal', 'datepicker', 'date', null, '0', '3');
INSERT INTO `item_form_table_copy1` VALUES ('36', 'Tujuan', 'text', 'string', null, '1', '3');
INSERT INTO `item_form_table_copy1` VALUES ('37', 'Nilai', 'text', 'number', null, '2', '3');
INSERT INTO `item_form_table_copy1` VALUES ('38', 'Cash / Credit Card', 'radio', 'number', '[{\"text\":\"Cash\", \"value\":1},{\"text\":\"Credit Card\", \"value\":2}]', '3', '3');
INSERT INTO `item_form_table_copy1` VALUES ('39', 'Currency', 'currency', 'number', null, '4', '3');
INSERT INTO `item_form_table_copy1` VALUES ('40', 'Tanggal', 'datepicker', 'date', null, '0', '4');
INSERT INTO `item_form_table_copy1` VALUES ('41', 'Lokasi', 'text', 'string', null, '1', '4');
INSERT INTO `item_form_table_copy1` VALUES ('42', 'Nilai', 'text', 'number', null, '2', '4');
INSERT INTO `item_form_table_copy1` VALUES ('43', 'Cash/Credit Card', 'radio', 'number', '[{\"text\":\"Cash\", \"value\":1},{\"text\":\"Credit Card\", \"value\":2}]', '3', '4');
INSERT INTO `item_form_table_copy1` VALUES ('44', 'Currency', 'currency', 'number', null, '4', '4');
INSERT INTO `item_form_table_copy1` VALUES ('45', 'Tanggal', 'datepicker', 'date', null, '0', '5');
INSERT INTO `item_form_table_copy1` VALUES ('46', 'Tujuan', 'text', 'string', null, '1', '5');
INSERT INTO `item_form_table_copy1` VALUES ('47', 'Nilai', 'text', 'number', null, '2', '5');
INSERT INTO `item_form_table_copy1` VALUES ('48', 'Cash/Credit Card', 'radio', 'number', '[{\"text\":\"Cash\", \"value\":1},{\"text\":\"Credit Card\", \"value\":2}]', '3', '5');
INSERT INTO `item_form_table_copy1` VALUES ('49', 'Currency', 'currency', 'number', null, '4', '5');
INSERT INTO `item_form_table_copy1` VALUES ('50', 'Start Date Sewa', 'datepicker', 'date', null, '0', '6');
INSERT INTO `item_form_table_copy1` VALUES ('51', 'Start Date Sewa', 'datepicker', 'date', null, '0', '6');
INSERT INTO `item_form_table_copy1` VALUES ('52', 'End Date Sewa', 'datepicker', 'date', null, '1', '6');
INSERT INTO `item_form_table_copy1` VALUES ('53', 'End Date Sewa', 'datepicker', 'date', null, '1', '6');
INSERT INTO `item_form_table_copy1` VALUES ('54', 'Nomer polisi', 'text', 'string', null, '2', '6');
INSERT INTO `item_form_table_copy1` VALUES ('55', 'Nomer polisi', 'text', 'string', null, '2', '6');
INSERT INTO `item_form_table_copy1` VALUES ('56', 'Nilai', 'text', 'number', null, '3', '6');
INSERT INTO `item_form_table_copy1` VALUES ('57', 'Nilai', 'text', 'number', null, '3', '6');
INSERT INTO `item_form_table_copy1` VALUES ('58', 'Cash/Credit Card', 'radio', 'number', '[{\"text\":\"Cash\", \"value\":1},{\"text\":\"Credit Card\", \"value\":2}]', '4', '6');
INSERT INTO `item_form_table_copy1` VALUES ('59', 'Cash/Credit Card', 'radio', 'number', '[{\"text\":\"Cash\", \"value\":1},{\"text\":\"Credit Card\", \"value\":2}]', '4', '6');
INSERT INTO `item_form_table_copy1` VALUES ('60', 'Currency', 'currency', 'number', null, '5', '6');
INSERT INTO `item_form_table_copy1` VALUES ('61', 'Currency', 'currency', 'number', null, '5', '6');
INSERT INTO `item_form_table_copy1` VALUES ('62', 'Remark', 'text', 'string', null, '7', '82');
INSERT INTO `item_form_table_copy1` VALUES ('63', 'Remark', 'text', 'string', null, '6', '83');
INSERT INTO `item_form_table_copy1` VALUES ('64', 'Tanggal', 'datepicker', 'date', null, '0', '7');
INSERT INTO `item_form_table_copy1` VALUES ('65', 'Tujuan', 'text', 'string', null, '1', '7');
INSERT INTO `item_form_table_copy1` VALUES ('66', 'Nilai', 'text', 'number', null, '2', '7');
INSERT INTO `item_form_table_copy1` VALUES ('67', 'Nomer polisi', 'text', 'string', null, '3', '7');
INSERT INTO `item_form_table_copy1` VALUES ('68', 'Cash/Credit Card', 'radio', 'string', '[{\"text\":\"Cash\", \"value\":1},{\"text\":\"Credit Card\", \"value\":2}]', '4', '7');
INSERT INTO `item_form_table_copy1` VALUES ('69', 'Currency', 'currency', 'number', null, '5', '7');
INSERT INTO `item_form_table_copy1` VALUES ('70', 'Tanggal', 'datepicker', 'date', null, '0', '8');
INSERT INTO `item_form_table_copy1` VALUES ('71', 'Tujuan', 'text', 'string', null, '1', '8');
INSERT INTO `item_form_table_copy1` VALUES ('72', 'Nilai', 'text', 'number', null, '2', '8');
INSERT INTO `item_form_table_copy1` VALUES ('73', 'Cash/Credit Card', 'radio', 'string', '[{\"text\":\"Cash\", \"value\":1},{\"text\":\"Credit Card\", \"value\":2}]', '3', '8');
INSERT INTO `item_form_table_copy1` VALUES ('74', 'Currency', 'currency', 'number', null, '4', '8');
INSERT INTO `item_form_table_copy1` VALUES ('75', 'Tanggal', 'datepicker', 'date', null, '0', '10');
INSERT INTO `item_form_table_copy1` VALUES ('76', 'Nama hotel', 'text', 'string', null, '1', '10');
INSERT INTO `item_form_table_copy1` VALUES ('77', 'Nilai', 'text', 'number', null, '2', '10');
INSERT INTO `item_form_table_copy1` VALUES ('78', 'Tanggal check in', 'datepicker', 'date', null, '3', '10');
INSERT INTO `item_form_table_copy1` VALUES ('79', 'Tanggal check out', 'datepicker', 'date', null, '4', '10');
INSERT INTO `item_form_table_copy1` VALUES ('80', 'Cash/Credit Card', 'radio', 'string', '[{\"text\":\"Cash\", \"value\":1},{\"text\":\"Credit Card\", \"value\":2}]', '5', '10');
INSERT INTO `item_form_table_copy1` VALUES ('81', 'Currency', 'currency', 'number', null, '6', '10');
INSERT INTO `item_form_table_copy1` VALUES ('82', 'Tanggal', 'datepicker', 'date', null, '0', '11');
INSERT INTO `item_form_table_copy1` VALUES ('83', 'Tujuan', 'text', 'string', null, '1', '11');
INSERT INTO `item_form_table_copy1` VALUES ('84', 'Nilai', 'text', 'number', null, '2', '11');
INSERT INTO `item_form_table_copy1` VALUES ('85', 'Cash/Credit Card', 'radio', 'string', '[{\"text\":\"Cash\", \"value\":1},{\"text\":\"Credit Card\", \"value\":2}]', '3', '11');
INSERT INTO `item_form_table_copy1` VALUES ('86', 'Currency', 'currency', 'number', null, '4', '11');
INSERT INTO `item_form_table_copy1` VALUES ('87', 'Tanggal', 'datepicker', 'date', null, '0', '12');
INSERT INTO `item_form_table_copy1` VALUES ('88', 'Nilai', 'text', 'number', null, '1', '12');
INSERT INTO `item_form_table_copy1` VALUES ('89', 'Cash/Credit Card', 'radio', 'string', '[{\"text\":\"Cash\", \"value\":1},{\"text\":\"Credit Card\", \"value\":2}]', '2', '12');
INSERT INTO `item_form_table_copy1` VALUES ('90', 'Currency', 'currency', 'number', null, '3', '12');
INSERT INTO `item_form_table_copy1` VALUES ('91', 'Tanggal', 'datepicker', 'date', null, '0', '13');
INSERT INTO `item_form_table_copy1` VALUES ('92', 'Nilai', 'text', 'number', null, '1', '13');
INSERT INTO `item_form_table_copy1` VALUES ('93', 'Cash/Credit Card', 'radio', 'string', '[{\"text\":\"Cash\", \"value\":1},{\"text\":\"Credit Card\", \"value\":2}]', '2', '13');
INSERT INTO `item_form_table_copy1` VALUES ('94', 'Currency', 'currency', 'number', null, '3', '13');
INSERT INTO `item_form_table_copy1` VALUES ('95', 'Tanggal', 'datepicker', 'date', null, '0', '15');
INSERT INTO `item_form_table_copy1` VALUES ('96', 'Tujuan', 'text', 'string', null, '1', '15');
INSERT INTO `item_form_table_copy1` VALUES ('97', 'Nilai', 'text', 'number', null, '2', '15');
INSERT INTO `item_form_table_copy1` VALUES ('98', 'Cash/Credit Card', 'radio', 'string', '[{\"text\":\"Cash\", \"value\":1},{\"text\":\"Credit Card\", \"value\":2}]', '3', '15');
INSERT INTO `item_form_table_copy1` VALUES ('99', 'Currency', 'currency', 'number', null, '4', '15');
INSERT INTO `item_form_table_copy1` VALUES ('100', 'Jenis Tiket', 'text', 'string', '[{\"text\":\"Tiket Pesawat\", \"value\":1}, {\"text\":\"Tiket Kereta\", \"value\":2}]', '0', '16');
INSERT INTO `item_form_table_copy1` VALUES ('101', 'Tujuan', 'text', 'string', null, '1', '16');
INSERT INTO `item_form_table_copy1` VALUES ('102', 'Tanggal Berangkat', 'datepicker', 'date', null, '2', '16');
INSERT INTO `item_form_table_copy1` VALUES ('103', 'Tanggal Tiba', 'datepicker', 'date', null, '3', '16');
INSERT INTO `item_form_table_copy1` VALUES ('104', 'Nilai Tiket', 'text', 'number', null, '4', '16');
INSERT INTO `item_form_table_copy1` VALUES ('105', 'Cash/Credit Card', 'radio', 'string', '[{\"text\":\"Cash\", \"value\":1},{\"text\":\"Credit Card\", \"value\":2}]', '5', '16');
INSERT INTO `item_form_table_copy1` VALUES ('106', 'Currency', 'currency', 'number', null, '6', '16');

-- ----------------------------
-- Table structure for item_form_table_copy2
-- ----------------------------
DROP TABLE IF EXISTS `item_form_table_copy2`;
CREATE TABLE `item_form_table_copy2` (
  `item_form_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `item_form_label` varchar(100) NOT NULL,
  `item_form_editor` varchar(100) NOT NULL,
  `item_form_type` varchar(100) NOT NULL,
  `option` text,
  `index` varchar(100) NOT NULL,
  `item_id` varchar(100) NOT NULL,
  `mandatory` int(1) DEFAULT '0',
  PRIMARY KEY (`item_form_id`)
) ENGINE=InnoDB AUTO_INCREMENT=155 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of item_form_table_copy2
-- ----------------------------
INSERT INTO `item_form_table_copy2` VALUES ('1', 'Jenis Tiket', 'dropdown', 'number', '[{\"text\":\"Pesawat\",\"value\":\"1\"},{\"text\":\"Kereta\",\"value\":\"2\"},{\"text\":\"Kapal Laut\",\"value\":\"3\"}, {\"text\":\"Bus\",\"value\":\"4\"},{\"text\":\"Travel\",\"value\":\"5\"}]', '0', '105', '1');
INSERT INTO `item_form_table_copy2` VALUES ('2', 'Tujuan', 'text', 'string', '', '1', '105', '0');
INSERT INTO `item_form_table_copy2` VALUES ('3', 'Tanggal Keberangkatan', 'datepicker', 'date', '', '2', '105', '0');
INSERT INTO `item_form_table_copy2` VALUES ('4', 'Tanggal Tiba', 'datepicker', 'date', '', '3', '105', '0');
INSERT INTO `item_form_table_copy2` VALUES ('8', 'Start Date Kost', 'datepicker', 'date', '', '0', '88', '1');
INSERT INTO `item_form_table_copy2` VALUES ('9', 'End Date Kost', 'datepicker', 'date', '', '1', '88', '1');
INSERT INTO `item_form_table_copy2` VALUES ('10', 'Lokasi', 'text', 'string', '', '2', '88', '1');
INSERT INTO `item_form_table_copy2` VALUES ('15', 'Keterangan', 'text', 'string', '', '1', '76', '0');
INSERT INTO `item_form_table_copy2` VALUES ('17', 'Keterangan', 'text', 'string', '', '1', '77', '0');
INSERT INTO `item_form_table_copy2` VALUES ('19', 'Keterangan', 'text', 'string', '', '1', '78', '0');
INSERT INTO `item_form_table_copy2` VALUES ('21', 'Keterangan', 'text', 'string', null, '1', '80', '0');
INSERT INTO `item_form_table_copy2` VALUES ('22', 'Tanggal pengisian', 'datepicker', 'date', null, '0', '91', '0');
INSERT INTO `item_form_table_copy2` VALUES ('23', 'Jenis BBM', 'dropdown', 'string', '[{\"text\":\"Premium\", \"value\":\"1\"},{\"text\":\"Pertalite\", \"value\":\"2\"},{\"text\":\"Pertamax\", \"value\":\"3\"},{\"text\":\"Solar\", \"value\":\"4\"}]', '1', '91', '0');
INSERT INTO `item_form_table_copy2` VALUES ('24', 'KM pengisian', 'text', 'number', null, '2', '91', '0');
INSERT INTO `item_form_table_copy2` VALUES ('26', 'Nomer Polisi', 'text', 'string', null, '3', '91', '0');
INSERT INTO `item_form_table_copy2` VALUES ('29', 'Tanggal', 'datepicker', 'date', null, '0', '90', '0');
INSERT INTO `item_form_table_copy2` VALUES ('30', 'KM awal', 'text', 'number', null, '1', '90', '0');
INSERT INTO `item_form_table_copy2` VALUES ('31', 'KM akhir', 'text', 'number', null, '2', '90', '0');
INSERT INTO `item_form_table_copy2` VALUES ('35', 'Tanggal', 'datepicker', 'date', '[]', '1', '3', '0');
INSERT INTO `item_form_table_copy2` VALUES ('36', 'Tujuan', 'text', 'string', null, '1', '3', '0');
INSERT INTO `item_form_table_copy2` VALUES ('40', 'Tanggal', 'datepicker', 'date', null, '0', '4', '0');
INSERT INTO `item_form_table_copy2` VALUES ('41', 'Lokasi', 'text', 'string', null, '1', '4', '0');
INSERT INTO `item_form_table_copy2` VALUES ('45', 'Tanggal', 'datepicker', 'date', null, '0', '5', '0');
INSERT INTO `item_form_table_copy2` VALUES ('46', 'Tujuan', 'text', 'string', null, '1', '5', '0');
INSERT INTO `item_form_table_copy2` VALUES ('50', 'Start Date Sewa', 'datepicker', 'date', null, '0', '6', '0');
INSERT INTO `item_form_table_copy2` VALUES ('53', 'End Date Sewa', 'datepicker', 'date', null, '1', '6', '0');
INSERT INTO `item_form_table_copy2` VALUES ('54', 'Nomer polisi', 'text', 'string', null, '2', '6', '0');
INSERT INTO `item_form_table_copy2` VALUES ('62', 'Remark', 'text', 'string', null, '7', '82', '0');
INSERT INTO `item_form_table_copy2` VALUES ('63', 'Remark', 'text', 'string', null, '6', '83', '0');
INSERT INTO `item_form_table_copy2` VALUES ('64', 'Tanggal', 'datepicker', 'date', null, '0', '7', '0');
INSERT INTO `item_form_table_copy2` VALUES ('65', 'Tujuan', 'text', 'string', null, '1', '7', '0');
INSERT INTO `item_form_table_copy2` VALUES ('67', 'Nomer polisi', 'text', 'string', null, '3', '7', '0');
INSERT INTO `item_form_table_copy2` VALUES ('70', 'Tanggal', 'datepicker', 'date', null, '0', '8', '0');
INSERT INTO `item_form_table_copy2` VALUES ('71', 'Tujuan', 'text', 'string', null, '1', '8', '0');
INSERT INTO `item_form_table_copy2` VALUES ('75', 'Tanggal', 'datepicker', 'date', null, '0', '93', '0');
INSERT INTO `item_form_table_copy2` VALUES ('76', 'Nama hotel', 'text', 'string', null, '1', '93', '0');
INSERT INTO `item_form_table_copy2` VALUES ('78', 'Tanggal check in', 'datepicker', 'date', null, '2', '93', '0');
INSERT INTO `item_form_table_copy2` VALUES ('79', 'Tanggal check out', 'datepicker', 'date', null, '3', '93', '0');
INSERT INTO `item_form_table_copy2` VALUES ('82', 'Tanggal', 'datepicker', 'date', null, '0', '11', '0');
INSERT INTO `item_form_table_copy2` VALUES ('83', 'Tujuan', 'text', 'string', null, '1', '11', '0');
INSERT INTO `item_form_table_copy2` VALUES ('87', 'Tanggal', 'datepicker', 'date', null, '0', '12', '0');
INSERT INTO `item_form_table_copy2` VALUES ('91', 'Tanggal', 'datepicker', 'date', null, '0', '13', '0');
INSERT INTO `item_form_table_copy2` VALUES ('95', 'Tanggal', 'datepicker', 'date', null, '0', '15', '0');
INSERT INTO `item_form_table_copy2` VALUES ('96', 'Tujuan', 'text', 'string', null, '1', '15', '0');
INSERT INTO `item_form_table_copy2` VALUES ('100', 'Jenis Tiket', 'dropdown', 'string', '[{\"text\":\"Pesawat\",\"value\":\"1\"},{\"text\":\"Kereta\",\"value\":\"2\"},{\"text\":\"Kapal Laut\",\"value\":\"3\"}, {\"text\":\"Bus\",\"value\":\"4\"},{\"text\":\"Travel\",\"value\":\"5\"}]', '0', '106', '0');
INSERT INTO `item_form_table_copy2` VALUES ('101', 'Tujuan', 'text', 'string', null, '1', '106', '0');
INSERT INTO `item_form_table_copy2` VALUES ('102', 'Tanggal Berangkat', 'datepicker', 'date', null, '2', '106', '0');
INSERT INTO `item_form_table_copy2` VALUES ('103', 'Tanggal Tiba', 'datepicker', 'date', null, '3', '106', '0');
INSERT INTO `item_form_table_copy2` VALUES ('113', 'Remarks', 'text', 'string', null, '4', '91', '0');
INSERT INTO `item_form_table_copy2` VALUES ('114', 'Jumlah Liter', 'text', 'number', null, '5', '91', '0');
INSERT INTO `item_form_table_copy2` VALUES ('115', 'Remarks', 'text', 'string', null, '3', '90', '0');
INSERT INTO `item_form_table_copy2` VALUES ('116', 'Tanggal', 'datepicker', 'date', null, '0', '94', '0');
INSERT INTO `item_form_table_copy2` VALUES ('117', 'Nama hotel', 'text', 'string', null, '1', '94', '0');
INSERT INTO `item_form_table_copy2` VALUES ('118', 'Tanggal check in', 'datepicker', 'date', null, '2', '94', '0');
INSERT INTO `item_form_table_copy2` VALUES ('119', 'Tanggal check out', 'datepicker', 'date', null, '3', '94', '0');
INSERT INTO `item_form_table_copy2` VALUES ('120', 'Tanggal', 'datepicker', 'date', null, '0', '96', '0');
INSERT INTO `item_form_table_copy2` VALUES ('121', 'Tanggal', 'datepicker', 'date', null, '0', '97', '0');
INSERT INTO `item_form_table_copy2` VALUES ('122', 'Tanggal', 'datepicker', 'date', null, '0', '99', '0');
INSERT INTO `item_form_table_copy2` VALUES ('123', 'Tipe', 'dropdown', 'string', '[{\"text\":\"Meals\", \"value\":\"1\"},{\"text\":\"Drink\", \"value\":\"2\"}]', '1', '99', '0');
INSERT INTO `item_form_table_copy2` VALUES ('124', 'Tanggal', 'datepicker', 'date', null, '0', '100', '0');
INSERT INTO `item_form_table_copy2` VALUES ('125', 'Tipe', 'dropdown', 'string', '[{\"text\":\"Meals\", \"value\":\"1\"},{\"text\":\"Drink\", \"value\":\"2\"}]', '1', '100', '0');
INSERT INTO `item_form_table_copy2` VALUES ('126', 'Tanggal', 'datepicker', 'date', null, '0', '102', '0');
INSERT INTO `item_form_table_copy2` VALUES ('127', 'Tujuan', 'text', 'string', null, '1', '102', '0');
INSERT INTO `item_form_table_copy2` VALUES ('128', 'Tipe', 'dropdown', 'string', '[{\"text\":\"Fee Supir\", \"value\":\"1\"}]', '2', '102', '0');
INSERT INTO `item_form_table_copy2` VALUES ('129', 'Tanggal', 'datepicker', 'date', null, '0', '103', '0');
INSERT INTO `item_form_table_copy2` VALUES ('130', 'Tujuan', 'text', 'string', null, '1', '103', '0');
INSERT INTO `item_form_table_copy2` VALUES ('131', 'Tipe', 'dropdown', 'string', '[{\"text\":\"Visa\", \"value\":\"1\"},{\"text\":\"Travel Insurance\", \"value\":\"2\"}]', '2', '103', '0');
INSERT INTO `item_form_table_copy2` VALUES ('132', 'Tanggal', 'datepicker', 'date', null, '0', '108', '0');
INSERT INTO `item_form_table_copy2` VALUES ('133', 'Tujuan', 'text', 'string', null, '1', '109', '0');
INSERT INTO `item_form_table_copy2` VALUES ('134', 'Tipe', 'dropdown', 'string', '[{\"text\":\"Taxi\", \"value\":\"1\"}, {\"text\":\"Ojek\", \"value\":\"2\"},{\"text\":\"MRT\", \"value\":\"3\"},{\"text\":\"KRL\", \"value\":\"4\"}, {\"text\":\"Bus\", \"value\":\"5\"},{\"text\":\"Rent Car\", \"value\":\"6\"},{\"text\":\"Rent Motorcycle\", \"value\":\"7\"}]', '2', '108', '0');
INSERT INTO `item_form_table_copy2` VALUES ('135', 'Tanggal', 'datepicker', 'date', null, '0', '109', '0');
INSERT INTO `item_form_table_copy2` VALUES ('136', 'Tujuan', 'text', 'string', null, '1', '109', '0');
INSERT INTO `item_form_table_copy2` VALUES ('137', 'Tipe', 'dropdown', 'string', '[{\"text\":\"Taxi\", \"value\":\"1\"}, {\"text\":\"Ojek\", \"value\":\"2\"},{\"text\":\"MRT\", \"value\":\"3\"},{\"text\":\"KRL\", \"value\":\"4\"}, {\"text\":\"Bus\", \"value\":\"5\"},{\"text\":\"Rent Car\", \"value\":\"6\"},]', '2', '109', '0');
INSERT INTO `item_form_table_copy2` VALUES ('138', 'Tanggal', 'datepicker', 'date', null, '0', '111', '0');
INSERT INTO `item_form_table_copy2` VALUES ('139', 'Remarks', 'text', 'string', null, '1', '111', '0');
INSERT INTO `item_form_table_copy2` VALUES ('140', 'Tipe', 'dropdown', 'string', '[{\"text\":\"Parkir\", \"value\":\"1\"}, {\"text\":\"Toll\", \"value\":\"2\"}]', '2', '111', '0');
INSERT INTO `item_form_table_copy2` VALUES ('141', 'Tanggal', 'datepicker', 'date', null, '0', '112', '0');
INSERT INTO `item_form_table_copy2` VALUES ('142', 'Remarks', 'text', 'string', null, '1', '112', '0');
INSERT INTO `item_form_table_copy2` VALUES ('143', 'Tipe', 'dropdown', 'string', '[{\"text\":\"Parkir\", \"value\":\"1\"}, {\"text\":\"Toll\", \"value\":\"2\"}]', '2', '112', '0');
INSERT INTO `item_form_table_copy2` VALUES ('144', 'Tanggal', 'datepicker', 'date', 'NULL', '0', '114', '0');
INSERT INTO `item_form_table_copy2` VALUES ('145', 'Periode', 'text', 'string', null, '1', '114', '0');
INSERT INTO `item_form_table_copy2` VALUES ('146', 'Nomor Telepon', 'text', 'string', null, '2', '114', '0');
INSERT INTO `item_form_table_copy2` VALUES ('147', 'Tanggal', 'datepicker', 'date', 'NULL', '0', '116', '0');
INSERT INTO `item_form_table_copy2` VALUES ('148', 'Deskripsi', 'text', 'string', null, '1', '116', '0');
INSERT INTO `item_form_table_copy2` VALUES ('149', 'Tanggal', 'datepicker', 'date', 'NULL', '0', '118', '0');
INSERT INTO `item_form_table_copy2` VALUES ('150', 'Tipe', 'dropdown', 'string', '[{\"text\":\"Printing\", \"value\":\"1\"}, {\"text\":\"Photocopy\", \"value\":\"2\"},{\"text\":\"Binding\", \"value\":\"3\"},{\"text\":\"Laminating\", \"value\":\"4\"},{\"text\":\"Scanning\", \"value\":\"5\"}]', '2', '118', '0');
INSERT INTO `item_form_table_copy2` VALUES ('151', 'Tanggal', 'datepicker', 'date', 'NULL', '0', '120', '0');
INSERT INTO `item_form_table_copy2` VALUES ('152', 'Tujuan Pengiriman', 'text', 'string', null, '1', '120', '0');
INSERT INTO `item_form_table_copy2` VALUES ('153', 'Tanggal', 'datepicker', 'date', 'NULL', '0', '122', '0');
INSERT INTO `item_form_table_copy2` VALUES ('154', 'Deskripsi', 'text', 'string', null, '1', '122', '0');

-- ----------------------------
-- Table structure for item_table
-- ----------------------------
DROP TABLE IF EXISTS `item_table`;
CREATE TABLE `item_table` (
  `item_id` int(11) NOT NULL AUTO_INCREMENT,
  `item_name` varchar(100) NOT NULL,
  `parent_id` int(11) DEFAULT '0',
  `coa` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of item_table
-- ----------------------------
INSERT INTO `item_table` VALUES ('2', 'Travelling Domestic - Taxi, Parking, Toll and other transport', '0', '613103');
INSERT INTO `item_table` VALUES ('3', 'Parkir', '2', '613103');
INSERT INTO `item_table` VALUES ('4', 'Parkir', '2', '613103');
INSERT INTO `item_table` VALUES ('5', 'Parkir', '2', '613103');
INSERT INTO `item_table` VALUES ('6', 'Sewa Motor Harian / Bulanan\r', '2', '613103');
INSERT INTO `item_table` VALUES ('7', 'Sewa Mobil (Traveling)', '2', '613103');
INSERT INTO `item_table` VALUES ('8', 'Ojek', '2', '613103');
INSERT INTO `item_table` VALUES ('9', 'Travelling Domestic - Hotels and Other Accomodation', '0', '613104');
INSERT INTO `item_table` VALUES ('10', 'Hotel Domestic', '9', '613104');
INSERT INTO `item_table` VALUES ('11', 'Laundry Domestic', '9', '613104');
INSERT INTO `item_table` VALUES ('12', 'Travelling Domestic - Meals, Food, and Beverage', '0', '613105');
INSERT INTO `item_table` VALUES ('13', 'Meals', '12', '613105');
INSERT INTO `item_table` VALUES ('14', 'Travelling Domestic - Other Expense related to Travelling', '0', '613199');
INSERT INTO `item_table` VALUES ('15', 'Free Supir', '14', '613199');
INSERT INTO `item_table` VALUES ('16', 'Travelling Overseas - Air, Train, Bus, Travel, or Other Tickets', '0', '613201');
INSERT INTO `item_table` VALUES ('22', 'Travelling Overseas - Taxi, Parking, Toll and other transport', '0', '613202');
INSERT INTO `item_table` VALUES ('23', 'Taxi', '22', '613202');
INSERT INTO `item_table` VALUES ('24', 'Parkir', '22', '613202');
INSERT INTO `item_table` VALUES ('25', 'Toll', '22', '613202');
INSERT INTO `item_table` VALUES ('26', 'Travelling Overseas - Hotels and Other Accomodation', '0', '613203');
INSERT INTO `item_table` VALUES ('27', 'Hotel Overseas', '26', '613203');
INSERT INTO `item_table` VALUES ('28', 'Laundry Overseas', '26', '613203');
INSERT INTO `item_table` VALUES ('29', 'Travelling Overseas - Meals, Food, and Beverage', '0', '613204');
INSERT INTO `item_table` VALUES ('30', 'Meals', '29', '613204');
INSERT INTO `item_table` VALUES ('31', 'Travelling Overseas - Other Expense related to Travelling', '0', '613299');
INSERT INTO `item_table` VALUES ('32', 'VISA', '31', '613299');
INSERT INTO `item_table` VALUES ('33', 'Travel Insurance', '31', '613299');
INSERT INTO `item_table` VALUES ('34', 'Farm Field Days', '0', '614301');
INSERT INTO `item_table` VALUES ('35', 'FFD', '34', '614301');
INSERT INTO `item_table` VALUES ('36', 'Banner', '34', '614301');
INSERT INTO `item_table` VALUES ('37', 'Spanduk', '34', '614301');
INSERT INTO `item_table` VALUES ('38', 'Poster', '34', '614301');
INSERT INTO `item_table` VALUES ('39', 'Photo  copy undangan', '34', '614301');
INSERT INTO `item_table` VALUES ('40', 'Counseling Activity', '0', '614302');
INSERT INTO `item_table` VALUES ('41', 'Counseling (Konsumasi)', '40', '614302');
INSERT INTO `item_table` VALUES ('42', 'Photo  copy undangan', '40', '614302');
INSERT INTO `item_table` VALUES ('43', 'Comparative Study', '0', '614303');
INSERT INTO `item_table` VALUES ('44', 'Study Banding', '43', '614303');
INSERT INTO `item_table` VALUES ('45', 'Spanduk', '43', '614303');
INSERT INTO `item_table` VALUES ('46', 'Poster', '43', '614303');
INSERT INTO `item_table` VALUES ('47', 'Photo  copy undangan', '43', '614303');
INSERT INTO `item_table` VALUES ('48', 'Clinical Seed (Others)', '0', '614306');
INSERT INTO `item_table` VALUES ('49', 'Konsumsi (Biasanya di Dealer)', '48', '614306');
INSERT INTO `item_table` VALUES ('50', 'Other Sales Activity Promotion Expense (Others)', '0', '614399');
INSERT INTO `item_table` VALUES ('51', 'Gathering Dg Dealer', '50', '614399');
INSERT INTO `item_table` VALUES ('52', 'Meeting dg Bandar', '50', '614399');
INSERT INTO `item_table` VALUES ('53', 'Expense for Mobile Telephony', '0', '617101');
INSERT INTO `item_table` VALUES ('54', 'Pulsa Telephone', '53', '617101');
INSERT INTO `item_table` VALUES ('55', 'Office Supplier', '0', '619301');
INSERT INTO `item_table` VALUES ('56', 'Stationary (Buku, Ballpoint, Kertas, tipe X, Cutter, Tonner, Batu baterai,Kalkulator)', '55', '619301');
INSERT INTO `item_table` VALUES ('57', 'Printing and Photocopying', '0', '619401');
INSERT INTO `item_table` VALUES ('58', 'Print', '57', '619401');
INSERT INTO `item_table` VALUES ('59', 'Photo copy', '57', '619401');
INSERT INTO `item_table` VALUES ('60', 'Scann', '57', '619401');
INSERT INTO `item_table` VALUES ('61', 'Laminating', '57', '619401');
INSERT INTO `item_table` VALUES ('62', 'Couriers', '0', '619403');
INSERT INTO `item_table` VALUES ('63', 'Kirim Dokumen', '62', '619403');
INSERT INTO `item_table` VALUES ('64', 'Stamp Duty (Others)', '0', '619405');
INSERT INTO `item_table` VALUES ('65', 'Materai', '64', '619405');
INSERT INTO `item_table` VALUES ('66', 'External Meeting & Entertainment', '0', '620203');
INSERT INTO `item_table` VALUES ('67', 'Pertemuan Petani (Produksi)', '66', '620203');
INSERT INTO `item_table` VALUES ('73', 'Housing Rent - Staff', '0', '611415');
INSERT INTO `item_table` VALUES ('74', 'Kost', '73', '611415');
INSERT INTO `item_table` VALUES ('75', 'Relocation Expense Claim - Staff', '0', '611416');
INSERT INTO `item_table` VALUES ('76', 'Kirim Barang', '75', '611416');
INSERT INTO `item_table` VALUES ('77', 'Pindahan Sekolah Anak', '75', '611416');
INSERT INTO `item_table` VALUES ('78', 'Transportasi', '75', '611416');
INSERT INTO `item_table` VALUES ('79', 'Other personnel related cost (Others)', '0', '611699');
INSERT INTO `item_table` VALUES ('80', 'Uang Suka/Duka', '79', '611699');
INSERT INTO `item_table` VALUES ('81', 'Travelling Domestic - Gasoline', '0', '613102');
INSERT INTO `item_table` VALUES ('82', 'BBM', '81', '613102');
INSERT INTO `item_table` VALUES ('83', 'BBM Per KM', '81', '613102');
INSERT INTO `item_table` VALUES ('86', 'Tickets', '16', '613201');

-- ----------------------------
-- Table structure for item_table_copy
-- ----------------------------
DROP TABLE IF EXISTS `item_table_copy`;
CREATE TABLE `item_table_copy` (
  `item_id` int(11) NOT NULL AUTO_INCREMENT,
  `item_name` varchar(100) NOT NULL,
  `parent_id` int(11) DEFAULT '0',
  `coa` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of item_table_copy
-- ----------------------------
INSERT INTO `item_table_copy` VALUES ('2', 'Travelling Domestic - Taxi, Parking, Toll and other transport', '0', '613103');
INSERT INTO `item_table_copy` VALUES ('3', 'Taxi', '2', '613103');
INSERT INTO `item_table_copy` VALUES ('4', 'Parkir', '2', '613103');
INSERT INTO `item_table_copy` VALUES ('5', 'Toll', '2', '613103');
INSERT INTO `item_table_copy` VALUES ('6', 'Sewa Motor Harian / Bulanan\r', '2', '613103');
INSERT INTO `item_table_copy` VALUES ('7', 'Sewa Mobil (Traveling)', '2', '613103');
INSERT INTO `item_table_copy` VALUES ('8', 'Ojek', '2', '613103');
INSERT INTO `item_table_copy` VALUES ('9', 'Travelling Domestic - Hotels and Other Accomodation', '0', '613104');
INSERT INTO `item_table_copy` VALUES ('10', 'Hotel Domestic', '9', '613104');
INSERT INTO `item_table_copy` VALUES ('11', 'Laundry Domestic', '9', '613104');
INSERT INTO `item_table_copy` VALUES ('12', 'Travelling Domestic - Meals, Food, and Beverage', '0', '613105');
INSERT INTO `item_table_copy` VALUES ('13', 'Meals', '12', '613105');
INSERT INTO `item_table_copy` VALUES ('14', 'Travelling Domestic - Other Expense related to Travelling', '0', '613199');
INSERT INTO `item_table_copy` VALUES ('15', 'Free Supir', '14', '613199');
INSERT INTO `item_table_copy` VALUES ('16', 'Travelling Overseas - Air, Train, Bus, Travel, or Other Tickets', '0', '613201');
INSERT INTO `item_table_copy` VALUES ('22', 'Travelling Overseas - Taxi, Parking, Toll and other transport', '0', '613202');
INSERT INTO `item_table_copy` VALUES ('23', 'Taxi', '22', '613202');
INSERT INTO `item_table_copy` VALUES ('24', 'Parkir', '22', '613202');
INSERT INTO `item_table_copy` VALUES ('25', 'Toll', '22', '613202');
INSERT INTO `item_table_copy` VALUES ('26', 'Travelling Overseas - Hotels and Other Accomodation', '0', '613203');
INSERT INTO `item_table_copy` VALUES ('27', 'Hotel Overseas', '26', '613203');
INSERT INTO `item_table_copy` VALUES ('28', 'Laundry Overseas', '26', '613203');
INSERT INTO `item_table_copy` VALUES ('29', 'Travelling Overseas - Meals, Food, and Beverage', '0', '613204');
INSERT INTO `item_table_copy` VALUES ('30', 'Meals', '29', '613204');
INSERT INTO `item_table_copy` VALUES ('31', 'Travelling Overseas - Other Expense related to Travelling', '0', '613299');
INSERT INTO `item_table_copy` VALUES ('32', 'VISA', '31', '613299');
INSERT INTO `item_table_copy` VALUES ('33', 'Travel Insurance', '31', '613299');
INSERT INTO `item_table_copy` VALUES ('34', 'Farm Field Days', '0', '614301');
INSERT INTO `item_table_copy` VALUES ('35', 'FFD', '34', '614301');
INSERT INTO `item_table_copy` VALUES ('36', 'Banner', '34', '614301');
INSERT INTO `item_table_copy` VALUES ('37', 'Spanduk', '34', '614301');
INSERT INTO `item_table_copy` VALUES ('38', 'Poster', '34', '614301');
INSERT INTO `item_table_copy` VALUES ('39', 'Photo  copy undangan', '34', '614301');
INSERT INTO `item_table_copy` VALUES ('40', 'Counseling Activity', '0', '614302');
INSERT INTO `item_table_copy` VALUES ('41', 'Counseling (Konsumasi)', '40', '614302');
INSERT INTO `item_table_copy` VALUES ('42', 'Photo  copy undangan', '40', '614302');
INSERT INTO `item_table_copy` VALUES ('43', 'Comparative Study', '0', '614303');
INSERT INTO `item_table_copy` VALUES ('44', 'Study Banding', '43', '614303');
INSERT INTO `item_table_copy` VALUES ('45', 'Spanduk', '43', '614303');
INSERT INTO `item_table_copy` VALUES ('46', 'Poster', '43', '614303');
INSERT INTO `item_table_copy` VALUES ('47', 'Photo  copy undangan', '43', '614303');
INSERT INTO `item_table_copy` VALUES ('48', 'Clinical Seed (Others)', '0', '614306');
INSERT INTO `item_table_copy` VALUES ('49', 'Konsumsi (Biasanya di Dealer)', '48', '614306');
INSERT INTO `item_table_copy` VALUES ('50', 'Other Sales Activity Promotion Expense (Others)', '0', '614399');
INSERT INTO `item_table_copy` VALUES ('51', 'Gathering Dg Dealer', '50', '614399');
INSERT INTO `item_table_copy` VALUES ('52', 'Meeting dg Bandar', '50', '614399');
INSERT INTO `item_table_copy` VALUES ('53', 'Expense for Mobile Telephony', '0', '617101');
INSERT INTO `item_table_copy` VALUES ('54', 'Pulsa Telephone', '53', '617101');
INSERT INTO `item_table_copy` VALUES ('55', 'Office Supplier', '0', '619301');
INSERT INTO `item_table_copy` VALUES ('56', 'Stationary (Buku, Ballpoint, Kertas, tipe X, Cutter, Tonner, Batu baterai,Kalkulator)', '55', '619301');
INSERT INTO `item_table_copy` VALUES ('57', 'Printing and Photocopying', '0', '619401');
INSERT INTO `item_table_copy` VALUES ('58', 'Print', '57', '619401');
INSERT INTO `item_table_copy` VALUES ('59', 'Photo copy', '57', '619401');
INSERT INTO `item_table_copy` VALUES ('60', 'Scann', '57', '619401');
INSERT INTO `item_table_copy` VALUES ('61', 'Laminating', '57', '619401');
INSERT INTO `item_table_copy` VALUES ('62', 'Couriers', '0', '619403');
INSERT INTO `item_table_copy` VALUES ('63', 'Kirim Dokumen', '62', '619403');
INSERT INTO `item_table_copy` VALUES ('64', 'Stamp Duty (Others)', '0', '619405');
INSERT INTO `item_table_copy` VALUES ('65', 'Materai', '64', '619405');
INSERT INTO `item_table_copy` VALUES ('66', 'External Meeting & Entertainment', '0', '620203');
INSERT INTO `item_table_copy` VALUES ('67', 'Pertemuan Petani (Produksi)', '66', '620203');
INSERT INTO `item_table_copy` VALUES ('73', 'Housing Rent - Staff', '0', '611415');
INSERT INTO `item_table_copy` VALUES ('74', 'Kost', '73', '611415');
INSERT INTO `item_table_copy` VALUES ('75', 'Relocation Expense Claim - Staff', '0', '611416');
INSERT INTO `item_table_copy` VALUES ('76', 'Kirim Barang', '75', '611416');
INSERT INTO `item_table_copy` VALUES ('77', 'Pindahan Sekolah Anak', '75', '611416');
INSERT INTO `item_table_copy` VALUES ('78', 'Transportasi', '75', '611416');
INSERT INTO `item_table_copy` VALUES ('79', 'Other personnel related cost (Others)', '0', '611699');
INSERT INTO `item_table_copy` VALUES ('80', 'Uang Suka/Duka', '79', '611699');
INSERT INTO `item_table_copy` VALUES ('81', 'Travelling Domestic - Gasoline', '0', '613102');
INSERT INTO `item_table_copy` VALUES ('82', 'BBM', '81', '613102');
INSERT INTO `item_table_copy` VALUES ('83', 'BBM Per KM', '81', '613102');
INSERT INTO `item_table_copy` VALUES ('86', 'Tickets', '16', '613201');

-- ----------------------------
-- Table structure for item_table_copy1
-- ----------------------------
DROP TABLE IF EXISTS `item_table_copy1`;
CREATE TABLE `item_table_copy1` (
  `item_id` int(11) NOT NULL AUTO_INCREMENT,
  `item_name` varchar(100) NOT NULL,
  `parent_id` int(11) DEFAULT '0',
  `coa` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=123 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of item_table_copy1
-- ----------------------------
INSERT INTO `item_table_copy1` VALUES ('87', 'Housing Rent', '0', null);
INSERT INTO `item_table_copy1` VALUES ('88', 'Kost', '87', '611415');
INSERT INTO `item_table_copy1` VALUES ('89', 'BBM', '0', null);
INSERT INTO `item_table_copy1` VALUES ('90', 'BBM Per KM', '89', '613102');
INSERT INTO `item_table_copy1` VALUES ('91', 'BBM On Bill', '89', '613102');
INSERT INTO `item_table_copy1` VALUES ('92', 'Hotel', '0', null);
INSERT INTO `item_table_copy1` VALUES ('93', 'Hotel Domestic', '92', '613104');
INSERT INTO `item_table_copy1` VALUES ('94', 'Hotel Overseas', '92', '613203');
INSERT INTO `item_table_copy1` VALUES ('95', 'Laundry', '0', null);
INSERT INTO `item_table_copy1` VALUES ('96', 'Laundry Domestic', '95', '613104');
INSERT INTO `item_table_copy1` VALUES ('97', 'Laundry Overseas', '95', '613203');
INSERT INTO `item_table_copy1` VALUES ('98', 'Food And Beverages', '0', null);
INSERT INTO `item_table_copy1` VALUES ('99', 'Food And Beverages Domestic', '98', '613105');
INSERT INTO `item_table_copy1` VALUES ('100', 'Food And Beverages Overseas', '98', '613204');
INSERT INTO `item_table_copy1` VALUES ('101', 'Other Travelling Expenses', '0', null);
INSERT INTO `item_table_copy1` VALUES ('102', 'Other Travelling Expenses Domestic', '101', '613199');
INSERT INTO `item_table_copy1` VALUES ('103', 'Other Travelling Expenses Overseas', '101', '613299');
INSERT INTO `item_table_copy1` VALUES ('104', 'Tiket Antar Wilayah', '0', null);
INSERT INTO `item_table_copy1` VALUES ('105', 'Tiket Domestic', '104', '613101');
INSERT INTO `item_table_copy1` VALUES ('106', 'Tiket Overseas', '104', '613201');
INSERT INTO `item_table_copy1` VALUES ('107', 'Public City Transport', '0', null);
INSERT INTO `item_table_copy1` VALUES ('108', 'Public City Transport Domestic', '107', '613103');
INSERT INTO `item_table_copy1` VALUES ('109', 'Public City Transport Overseas', '107', '613202');
INSERT INTO `item_table_copy1` VALUES ('110', 'Other Transportation Related', '0', null);
INSERT INTO `item_table_copy1` VALUES ('111', 'Other Transportation Related - Domestic', '110', '613103');
INSERT INTO `item_table_copy1` VALUES ('112', 'Other Transportation Related - Overseas', '110', '613202');
INSERT INTO `item_table_copy1` VALUES ('113', 'Mobile Phone', '0', null);
INSERT INTO `item_table_copy1` VALUES ('114', 'Pulsa', '113', '617101');
INSERT INTO `item_table_copy1` VALUES ('115', 'Alat Tulis Kantor', '0', null);
INSERT INTO `item_table_copy1` VALUES ('116', 'Alat Tulis Kantor', '115', '619301');
INSERT INTO `item_table_copy1` VALUES ('117', 'Printing And Photocopying', '0', null);
INSERT INTO `item_table_copy1` VALUES ('118', 'Printing And Photocopying', '117', '619401');
INSERT INTO `item_table_copy1` VALUES ('119', 'Kirim Dokumen', '0', null);
INSERT INTO `item_table_copy1` VALUES ('120', 'Kirim Dokumen', '119', '619403');
INSERT INTO `item_table_copy1` VALUES ('121', 'Other Expenses', '0', null);
INSERT INTO `item_table_copy1` VALUES ('122', 'Other Expenses', '121', '619999');

-- ----------------------------
-- Table structure for kanban
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
-- Table structure for kanban_forms
-- ----------------------------
DROP TABLE IF EXISTS `kanban_forms`;
CREATE TABLE `kanban_forms` (
  `kf_id` int(11) NOT NULL AUTO_INCREMENT,
  `kf_diagrams_id` int(11) DEFAULT NULL,
  `kf_status` int(11) DEFAULT NULL,
  `kf_form_edit` varchar(255) DEFAULT NULL,
  `kf_form_view` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`kf_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of kanban_forms
-- ----------------------------
INSERT INTO `kanban_forms` VALUES ('1', '49', '396', '', '');
INSERT INTO `kanban_forms` VALUES ('2', '49', '397', '', '');
INSERT INTO `kanban_forms` VALUES ('3', '49', '397', 'Capture.JPG', '');
INSERT INTO `kanban_forms` VALUES ('4', '28', '96', '', '');
INSERT INTO `kanban_forms` VALUES ('5', '28', '97', '', '');
INSERT INTO `kanban_forms` VALUES ('6', '28', '98', '', '');
INSERT INTO `kanban_forms` VALUES ('7', '28', '99', '', '');
INSERT INTO `kanban_forms` VALUES ('8', '28', '105', '', '');

-- ----------------------------
-- Table structure for kanban_panels
-- ----------------------------
DROP TABLE IF EXISTS `kanban_panels`;
CREATE TABLE `kanban_panels` (
  `kp_id` int(11) NOT NULL AUTO_INCREMENT,
  `kp_ks_id` int(11) DEFAULT NULL,
  `kp_title` varchar(50) DEFAULT NULL,
  `kp_accent` varchar(30) DEFAULT NULL,
  `kp_order` int(11) DEFAULT '1',
  PRIMARY KEY (`kp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of kanban_panels
-- ----------------------------
INSERT INTO `kanban_panels` VALUES ('51', '16', 'Open Opportunity', 'var(--paper-purple-500)', '0');
INSERT INTO `kanban_panels` VALUES ('52', '16', 'Submit', 'var(--paper-red-500)', '1');
INSERT INTO `kanban_panels` VALUES ('53', '16', 'Negoitation', 'var(--paper-amber-500)', '2');
INSERT INTO `kanban_panels` VALUES ('54', '16', 'PO', 'var(--paper-blue-500)', '3');
INSERT INTO `kanban_panels` VALUES ('55', '16', 'Drop', 'var(--paper-blue-500)', '4');
INSERT INTO `kanban_panels` VALUES ('59', '18', 'Document Draft', 'var(--paper-blue-500)', '0');
INSERT INTO `kanban_panels` VALUES ('60', '18', 'Document Submitted', 'var(--paper-blue-grey-500)', '1');

-- ----------------------------
-- Table structure for kanban_settings
-- ----------------------------
DROP TABLE IF EXISTS `kanban_settings`;
CREATE TABLE `kanban_settings` (
  `ks_id` int(11) NOT NULL AUTO_INCREMENT,
  `ks_name` varchar(100) DEFAULT NULL,
  `ks_description` varchar(200) DEFAULT NULL,
  `ks_api` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ks_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of kanban_settings
-- ----------------------------
INSERT INTO `kanban_settings` VALUES ('16', 'Sales Flow', 'No description', null);
INSERT INTO `kanban_settings` VALUES ('18', 'Advance', null, null);

-- ----------------------------
-- Table structure for kanban_statuses
-- ----------------------------
DROP TABLE IF EXISTS `kanban_statuses`;
CREATE TABLE `kanban_statuses` (
  `kst_id` int(11) NOT NULL AUTO_INCREMENT,
  `kst_kp_id` int(11) DEFAULT NULL,
  `kst_diagrams_id` int(11) DEFAULT NULL,
  `kst_status` int(11) DEFAULT NULL,
  `kst_color` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`kst_id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of kanban_statuses
-- ----------------------------
INSERT INTO `kanban_statuses` VALUES ('55', '55', '52', '639', '#000');
INSERT INTO `kanban_statuses` VALUES ('56', '55', '52', '640', '#000');
INSERT INTO `kanban_statuses` VALUES ('57', '55', '52', '641', '#000');
INSERT INTO `kanban_statuses` VALUES ('58', '55', '52', '645', '#000');
INSERT INTO `kanban_statuses` VALUES ('59', '51', '52', '644', '#000');
INSERT INTO `kanban_statuses` VALUES ('60', '52', '52', '629', '#000');
INSERT INTO `kanban_statuses` VALUES ('61', '53', '52', '630', '#000');
INSERT INTO `kanban_statuses` VALUES ('62', '54', '52', '631', '#000');
INSERT INTO `kanban_statuses` VALUES ('64', '59', '54', '656', '#000');
INSERT INTO `kanban_statuses` VALUES ('65', '60', '54', '657', '#000');

-- ----------------------------
-- Table structure for master_cnb
-- ----------------------------
DROP TABLE IF EXISTS `master_cnb`;
CREATE TABLE `master_cnb` (
  `cnb_id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) DEFAULT NULL,
  `grade_id` int(11) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `position_id` int(11) DEFAULT NULL,
  `amounts` double(15,2) DEFAULT NULL,
  `allow_over` int(1) DEFAULT '0',
  PRIMARY KEY (`cnb_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of master_cnb
-- ----------------------------
INSERT INTO `master_cnb` VALUES ('4', '54', null, null, '102', '50000.00', '0');
INSERT INTO `master_cnb` VALUES ('5', '10', '1', null, null, '200000.00', '1');
INSERT INTO `master_cnb` VALUES ('6', '10', '2', null, null, '200000.00', '1');
INSERT INTO `master_cnb` VALUES ('7', '10', '3', null, null, '200000.00', '1');
INSERT INTO `master_cnb` VALUES ('8', '10', '4', null, null, '200000.00', '1');
INSERT INTO `master_cnb` VALUES ('9', '10', '5', null, null, '200000.00', '1');
INSERT INTO `master_cnb` VALUES ('10', '10', '6', null, null, '200000.00', '1');
INSERT INTO `master_cnb` VALUES ('11', '10', '7', null, null, '200000.00', '1');
INSERT INTO `master_cnb` VALUES ('12', '10', '8', null, null, '200000.00', '1');
INSERT INTO `master_cnb` VALUES ('13', '10', '9', null, null, '200000.00', '1');
INSERT INTO `master_cnb` VALUES ('14', '10', '10', null, null, '200000.00', '1');
INSERT INTO `master_cnb` VALUES ('15', '10', '11', null, null, '200000.00', '1');
INSERT INTO `master_cnb` VALUES ('16', '10', '12', null, null, '200000.00', '1');
INSERT INTO `master_cnb` VALUES ('17', '11', '13', null, null, '20000.00', '0');
INSERT INTO `master_cnb` VALUES ('18', '10', '13', null, null, '400000.00', '1');

-- ----------------------------
-- Table structure for master_currency
-- ----------------------------
DROP TABLE IF EXISTS `master_currency`;
CREATE TABLE `master_currency` (
  `currency_id` int(10) NOT NULL AUTO_INCREMENT,
  `currency_name` varchar(100) DEFAULT NULL,
  `currency_code` varchar(100) DEFAULT NULL,
  `currency_rate` double(15,6) DEFAULT NULL,
  `currency_acceptable` int(1) DEFAULT '0',
  PRIMARY KEY (`currency_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of master_currency
-- ----------------------------
INSERT INTO `master_currency` VALUES ('1', 'Rupiah', 'IDR', '1.000000', '1');
INSERT INTO `master_currency` VALUES ('2', 'US Dollar', 'USD', '13000.000000', '1');
INSERT INTO `master_currency` VALUES ('3', 'EURO', 'EUR', '15000.000000', '1');
INSERT INTO `master_currency` VALUES ('4', 'THai Bat', 'THB', '3000.000000', '1');
INSERT INTO `master_currency` VALUES ('5', 'Peso Philippine', 'PHP', '262.780000', '0');
INSERT INTO `master_currency` VALUES ('6', 'Italian Lira', 'ITL', '8.140000', '0');

-- ----------------------------
-- Table structure for master_grade
-- ----------------------------
DROP TABLE IF EXISTS `master_grade`;
CREATE TABLE `master_grade` (
  `grade_id` int(10) NOT NULL AUTO_INCREMENT,
  `grade_code` varchar(10) DEFAULT NULL,
  `grade_desc` varchar(20) DEFAULT NULL,
  `verificator` int(1) DEFAULT NULL,
  `approver` int(1) DEFAULT NULL,
  `grade_limit` int(10) DEFAULT NULL,
  PRIMARY KEY (`grade_id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of master_grade
-- ----------------------------
INSERT INTO `master_grade` VALUES ('1', 'K.IA', 'NON STAFF', '0', '0', '0');
INSERT INTO `master_grade` VALUES ('2', 'K.IB', 'NON STAFF', '0', '0', '0');
INSERT INTO `master_grade` VALUES ('3', 'K.IC', 'NON STAFF', '0', '0', '0');
INSERT INTO `master_grade` VALUES ('4', 'K.ID', 'NON STAFF', '0', '0', '0');
INSERT INTO `master_grade` VALUES ('5', 'K.IIA', 'NON STAFF', '0', '0', '0');
INSERT INTO `master_grade` VALUES ('6', 'K.IIB', 'NON STAFF', '0', '0', '0');
INSERT INTO `master_grade` VALUES ('7', 'K.IIC', 'NON STAFF', '0', '0', '0');
INSERT INTO `master_grade` VALUES ('8', 'K.IID', 'NON STAFF', '0', '0', '0');
INSERT INTO `master_grade` VALUES ('9', 'K.IIIA', 'NON STAFF', '0', '0', '0');
INSERT INTO `master_grade` VALUES ('10', 'K.IIIB', 'NON STAFF', '0', '0', '0');
INSERT INTO `master_grade` VALUES ('11', 'K.IIIC', 'NON STAFF', '0', '0', '0');
INSERT INTO `master_grade` VALUES ('12', 'K.IVA', 'NON STAFF', '0', '0', '0');
INSERT INTO `master_grade` VALUES ('13', 'IA', 'STAFF', '0', '0', '0');
INSERT INTO `master_grade` VALUES ('14', 'IB', 'STAFF', '0', '0', '0');
INSERT INTO `master_grade` VALUES ('15', 'IC', 'STAFF', '0', '0', '0');
INSERT INTO `master_grade` VALUES ('16', 'IIA', 'STAFF', '0', '0', '0');
INSERT INTO `master_grade` VALUES ('17', 'IIB', 'STAFF', '0', '0', '0');
INSERT INTO `master_grade` VALUES ('18', 'IIC', 'STAFF', '0', '0', '0');
INSERT INTO `master_grade` VALUES ('19', 'IIIA', 'STAFF', '0', '0', '0');
INSERT INTO `master_grade` VALUES ('20', 'IIIB', 'STAFF', '0', '0', '0');
INSERT INTO `master_grade` VALUES ('21', 'IIIC', 'STAFF', '0', '0', '0');
INSERT INTO `master_grade` VALUES ('22', 'IVA', 'STAFF', '1', '0', '0');
INSERT INTO `master_grade` VALUES ('23', 'IVB', 'STAFF', '1', '0', '0');
INSERT INTO `master_grade` VALUES ('24', 'IVC', 'STAFF', '1', '0', '0');
INSERT INTO `master_grade` VALUES ('25', 'VA', 'STAFF', '1', '0', '0');
INSERT INTO `master_grade` VALUES ('26', 'VB', 'STAFF', '1', '0', '0');
INSERT INTO `master_grade` VALUES ('27', 'VC', 'STAFF', '1', '0', '0');
INSERT INTO `master_grade` VALUES ('28', 'VIA', 'STAFF', '0', '1', '10000000');
INSERT INTO `master_grade` VALUES ('29', 'VIB', 'STAFF', '0', '1', '15000000');
INSERT INTO `master_grade` VALUES ('30', 'VIC', 'STAFF', '0', '1', '20000000');
INSERT INTO `master_grade` VALUES ('31', 'VIIA', 'STAFF', '0', '1', '25000000');
INSERT INTO `master_grade` VALUES ('32', 'VIIB', 'STAFF', '0', '1', '30000000');
INSERT INTO `master_grade` VALUES ('33', 'VIIC', 'STAFF', '0', '1', '35000000');
INSERT INTO `master_grade` VALUES ('34', 'VIIIA', 'STAFF', '0', '1', '40000000');
INSERT INTO `master_grade` VALUES ('35', 'VIIIB', 'STAFF', '0', '1', '45000000');
INSERT INTO `master_grade` VALUES ('36', 'VIIIC', 'STAFF', '0', '1', '50000000');
INSERT INTO `master_grade` VALUES ('37', 'ITP', 'TRAINEE PROGRAM DIII', '0', '0', '0');
INSERT INTO `master_grade` VALUES ('38', 'IITP', 'TRAINEE PROGRAM SI', '0', '0', '0');
INSERT INTO `master_grade` VALUES ('39', 'IIITP', 'TRAINEE PROGRAM SII', '0', '0', '0');

-- ----------------------------
-- Table structure for master_organization
-- ----------------------------
DROP TABLE IF EXISTS `master_organization`;
CREATE TABLE `master_organization` (
  `org_id` int(11) NOT NULL AUTO_INCREMENT,
  `org_type_id` int(11) DEFAULT NULL,
  `org_parent_id` int(11) DEFAULT NULL,
  `org_name` varchar(100) DEFAULT NULL,
  `org_code` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`org_id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of master_organization
-- ----------------------------
INSERT INTO `master_organization` VALUES ('1', '1', '0', 'East West Seed Indonesia', 'EWSI');
INSERT INTO `master_organization` VALUES ('2', '2', '1', 'Research & Development', 'RND');
INSERT INTO `master_organization` VALUES ('3', '2', '1', 'Seed Operation', 'SO');
INSERT INTO `master_organization` VALUES ('4', '2', '1', 'Sales & Marketing', 'MKT');
INSERT INTO `master_organization` VALUES ('5', '2', '1', 'Finance & Accounting', 'FA');
INSERT INTO `master_organization` VALUES ('6', '2', '1', 'General Admin', 'GA');
INSERT INTO `master_organization` VALUES ('7', '3', '2', 'CBM A', 'CBMA');
INSERT INTO `master_organization` VALUES ('8', '3', '2', 'CBM B', 'CBMB');
INSERT INTO `master_organization` VALUES ('9', '3', '2', 'CBM C', 'CBMC');
INSERT INTO `master_organization` VALUES ('10', '3', '2', 'LAB PP', 'LABPP');
INSERT INTO `master_organization` VALUES ('11', '3', '2', 'LAB Biotechnology', 'LABBIO');
INSERT INTO `master_organization` VALUES ('12', '3', '2', 'PDS', 'PDS');
INSERT INTO `master_organization` VALUES ('13', '3', '3', 'Production', 'PROD');
INSERT INTO `master_organization` VALUES ('14', '3', '3', 'Plant', 'PLANT');
INSERT INTO `master_organization` VALUES ('15', '3', '3', 'Stock Seed', 'SS');
INSERT INTO `master_organization` VALUES ('16', '3', '3', 'Seed Research', 'SR');
INSERT INTO `master_organization` VALUES ('17', '3', '3', 'Quality Assurance', 'QA');
INSERT INTO `master_organization` VALUES ('18', '3', '2', 'CBM D', 'CBMD');
INSERT INTO `master_organization` VALUES ('19', '3', '4', 'ASM 1', 'ASM1');
INSERT INTO `master_organization` VALUES ('20', '3', '4', 'ASM 2', 'ASM2');
INSERT INTO `master_organization` VALUES ('21', '3', '4', 'ASM 3', 'ASM3');
INSERT INTO `master_organization` VALUES ('22', '3', '4', 'ASM 4', 'ASM4');
INSERT INTO `master_organization` VALUES ('23', '3', '4', 'ASM 5', 'ASM 5');
INSERT INTO `master_organization` VALUES ('24', '3', '4', 'Customer Service', 'CS');
INSERT INTO `master_organization` VALUES ('25', '3', '4', 'Export Import', 'EXIM');
INSERT INTO `master_organization` VALUES ('26', '3', '5', 'ICT', 'ICT');
INSERT INTO `master_organization` VALUES ('27', '3', '6', 'Human Resource', 'HR');
INSERT INTO `master_organization` VALUES ('28', '3', '6', 'General Affair', 'GA');
INSERT INTO `master_organization` VALUES ('29', '3', '4', 'Sales & Marketing', 'MKT');
INSERT INTO `master_organization` VALUES ('30', '3', '2', 'Genetic Resources', 'GR');
INSERT INTO `master_organization` VALUES ('31', '3', '4', 'ASM 6', 'ASM6');
INSERT INTO `master_organization` VALUES ('32', '3', '4', 'Technology Transfer', 'TTF');
INSERT INTO `master_organization` VALUES ('33', '3', '5', 'Finance & Accounting', 'F&A');
INSERT INTO `master_organization` VALUES ('34', '3', '6', 'General Admin', 'G.ADM');
INSERT INTO `master_organization` VALUES ('35', '3', '3', 'Supply Chain', 'SC');
INSERT INTO `master_organization` VALUES ('36', '3', '3', 'Quality Production', 'QP');
INSERT INTO `master_organization` VALUES ('37', '2', '1', 'Business Development', 'BUSDEV');
INSERT INTO `master_organization` VALUES ('38', '3', '37', 'Business Development', 'BUSDEV');

-- ----------------------------
-- Table structure for master_organization_type
-- ----------------------------
DROP TABLE IF EXISTS `master_organization_type`;
CREATE TABLE `master_organization_type` (
  `org_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `org_type_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`org_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of master_organization_type
-- ----------------------------
INSERT INTO `master_organization_type` VALUES ('1', 'Company');
INSERT INTO `master_organization_type` VALUES ('2', 'Division');
INSERT INTO `master_organization_type` VALUES ('3', 'Department');

-- ----------------------------
-- Table structure for master_payment
-- ----------------------------
DROP TABLE IF EXISTS `master_payment`;
CREATE TABLE `master_payment` (
  `pym_id` int(11) NOT NULL AUTO_INCREMENT,
  `pym_name` varchar(50) DEFAULT NULL,
  `pym_code` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`pym_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of master_payment
-- ----------------------------
INSERT INTO `master_payment` VALUES ('1', 'Cash', 'cash');
INSERT INTO `master_payment` VALUES ('2', 'Corporate Credit Card', 'corporate-credit-card');

-- ----------------------------
-- Table structure for master_position
-- ----------------------------
DROP TABLE IF EXISTS `master_position`;
CREATE TABLE `master_position` (
  `pos_id` int(11) NOT NULL AUTO_INCREMENT,
  `pos_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`pos_id`)
) ENGINE=InnoDB AUTO_INCREMENT=337 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of master_position
-- ----------------------------
INSERT INTO `master_position` VALUES ('1', 'ABS ADMIN');
INSERT INTO `master_position` VALUES ('2', 'ABS ANALYST');
INSERT INTO `master_position` VALUES ('3', 'ABS LOGISTIC STAFF');
INSERT INTO `master_position` VALUES ('4', 'ABS STAFF');
INSERT INTO `master_position` VALUES ('5', 'ACC & FIN PROD SPV');
INSERT INTO `master_position` VALUES ('6', 'ACCOUNTING MANAGER');
INSERT INTO `master_position` VALUES ('7', 'ACCOUNTING OFFICER');
INSERT INTO `master_position` VALUES ('8', 'ACCOUNTING RECEIVABLE AND BUDGET CONTROL SPECIALIST');
INSERT INTO `master_position` VALUES ('9', 'ACTING ABS STAFF');
INSERT INTO `master_position` VALUES ('10', 'ACTING AFTER SALES SERVICE OFFICER');
INSERT INTO `master_position` VALUES ('11', 'ACTING AREA PRODUCTION MANAGER');
INSERT INTO `master_position` VALUES ('12', 'ACTING AREA SALES AND MARKETING MANAGER');
INSERT INTO `master_position` VALUES ('13', 'ACTING ASSISTANT AREA SALES AND MARKETING MANAGER');
INSERT INTO `master_position` VALUES ('14', 'ACTING ASSISTANT INDOOR PRODUCTION MANAGER');
INSERT INTO `master_position` VALUES ('15', 'ACTING CHANNEL MANAGEMENT OFFICER');
INSERT INTO `master_position` VALUES ('16', 'ACTING CROP LEADER');
INSERT INTO `master_position` VALUES ('17', 'ACTING FARM AND FACILITY MANAGER');
INSERT INTO `master_position` VALUES ('18', 'ACTING FIELD INSPECTION LEADER');
INSERT INTO `master_position` VALUES ('19', 'ACTING INDOOR PRODUCTION SUPERVISOR');
INSERT INTO `master_position` VALUES ('20', 'ACTING MARKETING REPRESENTATIVE');
INSERT INTO `master_position` VALUES ('21', 'ACTING NATIONAL SALES MANAGER');
INSERT INTO `master_position` VALUES ('22', 'ACTING PARENTAL MAINTENANCE SUPERINTENDENT');
INSERT INTO `master_position` VALUES ('23', 'ACTING POTATO PRODUCTION SUPERINTENDENT');
INSERT INTO `master_position` VALUES ('24', 'ACTING PROCESSING SUPERVISOR');
INSERT INTO `master_position` VALUES ('25', 'ACTING PRODUCT PROMOTION INTRO SUPERVISOR');
INSERT INTO `master_position` VALUES ('26', 'ACTING PRODUCT SPECIALIST');
INSERT INTO `master_position` VALUES ('27', 'ACTING PRODUCT SPECIALIST FOR CORN AND BRASSICA');
INSERT INTO `master_position` VALUES ('28', 'ACTING PRODUCTION SUPERINTENDENT');
INSERT INTO `master_position` VALUES ('29', 'ACTING QUALITY PRODUCTION MANAGER');
INSERT INTO `master_position` VALUES ('30', 'ACTING QUALITY PRODUCTION SUPERVISOR');
INSERT INTO `master_position` VALUES ('31', 'ACTING STOCK SEED SUPERINTENDENT');
INSERT INTO `master_position` VALUES ('32', 'ACTING STTC SUPERINTENDENT');
INSERT INTO `master_position` VALUES ('33', 'ACTING TEMPERATE CROP PRODUCTION SPECIALIST');
INSERT INTO `master_position` VALUES ('34', 'ADMIN EXIM');
INSERT INTO `master_position` VALUES ('35', 'ADMIN LAB POLLEN');
INSERT INTO `master_position` VALUES ('36', 'ADMIN TO GA & SO DIRECTOR');
INSERT INTO `master_position` VALUES ('37', 'ADVISOR TO MANAGING DIRECTOR');
INSERT INTO `master_position` VALUES ('38', 'AFTER SALES SERVICE OFFICER');
INSERT INTO `master_position` VALUES ('39', 'AGRONOMY OFFICER');
INSERT INTO `master_position` VALUES ('40', 'AGRONOMY SPECIALIST');
INSERT INTO `master_position` VALUES ('41', 'AREA PRODUCTION MANAGER');
INSERT INTO `master_position` VALUES ('42', 'AREA SALES AND MARKETING MANAGER');
INSERT INTO `master_position` VALUES ('43', 'ASSISTANT AREA SALES AND MARKETING MANAGER');
INSERT INTO `master_position` VALUES ('44', 'ASSISTANT BREEDING MANAGER');
INSERT INTO `master_position` VALUES ('45', 'ASSISTANT FARM AND FACILITY MANAGER');
INSERT INTO `master_position` VALUES ('46', 'ASSISTANT FARM MANAGER');
INSERT INTO `master_position` VALUES ('47', 'ASSISTANT GENERAL AFFAIRS MANAGER');
INSERT INTO `master_position` VALUES ('48', 'ASSISTANT HUMAN RESOURCES MANAGER');
INSERT INTO `master_position` VALUES ('49', 'ASSISTANT INDOOR PRODUCTION MANAGER');
INSERT INTO `master_position` VALUES ('50', 'ASSISTANT PLANT PATHOLOGY');
INSERT INTO `master_position` VALUES ('51', 'ASSISTANT PRODUCT MANAGER');
INSERT INTO `master_position` VALUES ('52', 'ASSISTANT PRODUCTION MANAGER');
INSERT INTO `master_position` VALUES ('53', 'ASSISTANT PURCHASING MANAGER');
INSERT INTO `master_position` VALUES ('54', 'ASSISTANT QUALITY ASSURANCE MANAGER');
INSERT INTO `master_position` VALUES ('55', 'ASSISTANT STOCK SEED PRODUCTION MANAGER');
INSERT INTO `master_position` VALUES ('56', 'BIOMOL WORKER KBU');
INSERT INTO `master_position` VALUES ('57', 'BIOTECH MANAGER');
INSERT INTO `master_position` VALUES ('58', 'BREEDING MANAGER');
INSERT INTO `master_position` VALUES ('59', 'BREEDING OFFICER');
INSERT INTO `master_position` VALUES ('60', 'BREEDING SPECIALIST');
INSERT INTO `master_position` VALUES ('61', 'BREEDING SUPERVISOR');
INSERT INTO `master_position` VALUES ('62', 'BUSINESS DEVELOPMENT DIRECTOR');
INSERT INTO `master_position` VALUES ('63', 'BUSINESS DEVELOPMENT MANAGER');
INSERT INTO `master_position` VALUES ('64', 'BUSINESS INTELIGENCE DEVELOPMENT SUPERVISOR');
INSERT INTO `master_position` VALUES ('65', 'CANTEEN AND KITCHEN WORKER');
INSERT INTO `master_position` VALUES ('66', 'CASH ACCOUNTANT SUPERVISOR');
INSERT INTO `master_position` VALUES ('67', 'CBM BREEDING B');
INSERT INTO `master_position` VALUES ('68', 'CHANNEL MANAGEMENT OFFICER');
INSERT INTO `master_position` VALUES ('69', 'CHEF');
INSERT INTO `master_position` VALUES ('70', 'CHIEF SECURITY');
INSERT INTO `master_position` VALUES ('71', 'COMPENSATION AND BENEFIT SPECIALIST');
INSERT INTO `master_position` VALUES ('72', 'CORN FIELD INSPECTION OFFICER');
INSERT INTO `master_position` VALUES ('73', 'CORN PRODUCTION ADMIN');
INSERT INTO `master_position` VALUES ('74', 'CORN PRODUCTION SUPERINTENDENT');
INSERT INTO `master_position` VALUES ('75', 'CORN PRODUCTION WORKER');
INSERT INTO `master_position` VALUES ('76', 'CORPORATE ENGAGEMENT MANAGER');
INSERT INTO `master_position` VALUES ('77', 'COST ACCOUNTANT SUPERVISOR');
INSERT INTO `master_position` VALUES ('78', 'CROP LEADER');
INSERT INTO `master_position` VALUES ('79', 'CROP LEADER KBL');
INSERT INTO `master_position` VALUES ('80', 'CROP MANAGER');
INSERT INTO `master_position` VALUES ('81', 'CROP RESEARCH SPECIALIST');
INSERT INTO `master_position` VALUES ('82', 'CUSTOMER SERVICE ADMIN');
INSERT INTO `master_position` VALUES ('83', 'CUSTOMER SERVICE OFFICER');
INSERT INTO `master_position` VALUES ('84', 'CUSTOMER SERVICE OPERATOR');
INSERT INTO `master_position` VALUES ('85', 'CUSTOMER SERVICE SUPERVISOR');
INSERT INTO `master_position` VALUES ('86', 'DEPUTY SEED OPERATION DIRECTOR');
INSERT INTO `master_position` VALUES ('87', 'DIRECTOR');
INSERT INTO `master_position` VALUES ('88', 'DNA SAMPLER');
INSERT INTO `master_position` VALUES ('89', 'DRIVER');
INSERT INTO `master_position` VALUES ('90', 'DRIVER MARKETING');
INSERT INTO `master_position` VALUES ('91', 'DYNAMICS-AX FUNCTION SUPERVISOR');
INSERT INTO `master_position` VALUES ('92', 'ERP AND BUSINESS INTELLIGENT SPECIALIST');
INSERT INTO `master_position` VALUES ('93', 'EXPORT IMPORT MANAGER');
INSERT INTO `master_position` VALUES ('94', 'EXPORT IMPORT OFFICER');
INSERT INTO `master_position` VALUES ('95', 'EXPORT IMPORT SUPERVISOR');
INSERT INTO `master_position` VALUES ('96', 'FARM ADMIN');
INSERT INTO `master_position` VALUES ('97', 'FARM AND FACILITY MANAGER');
INSERT INTO `master_position` VALUES ('98', 'FARM AND FACILITY SUPERVISOR');
INSERT INTO `master_position` VALUES ('99', 'FARM OFFICER');
INSERT INTO `master_position` VALUES ('100', 'FARM PRODUCTION ADMIN');
INSERT INTO `master_position` VALUES ('101', 'FARM PRODUCTION ADMINISTRATION STAFF');
INSERT INTO `master_position` VALUES ('102', 'FARM PRODUCTION WORKER');
INSERT INTO `master_position` VALUES ('103', 'FARM SUPERINTENDENT');
INSERT INTO `master_position` VALUES ('104', 'FARM WORKER KBL');
INSERT INTO `master_position` VALUES ('105', 'FARM WORKER KBU');
INSERT INTO `master_position` VALUES ('106', 'FARM WORKER KBW');
INSERT INTO `master_position` VALUES ('107', 'FIELD ASSISTANT');
INSERT INTO `master_position` VALUES ('108', 'FIELD ASSISTANT STAFF');
INSERT INTO `master_position` VALUES ('109', 'FIELD BREEDING ASSISTANT');
INSERT INTO `master_position` VALUES ('110', 'FIELD INSPECTION ASSISTANT');
INSERT INTO `master_position` VALUES ('111', 'FIELD INSPECTION FARM OFFICER');
INSERT INTO `master_position` VALUES ('112', 'FIELD INSPECTION FARM SUPERVISOR');
INSERT INTO `master_position` VALUES ('113', 'FIELD INSPECTION OFFICER');
INSERT INTO `master_position` VALUES ('114', 'FIELD INSPECTION SUPERVISOR');
INSERT INTO `master_position` VALUES ('115', 'FIELD QUALITY ASSISTANT');
INSERT INTO `master_position` VALUES ('116', 'FIELD QUALITY OFFICER');
INSERT INTO `master_position` VALUES ('117', 'FIELD QUALITY SUPERINTENDENT');
INSERT INTO `master_position` VALUES ('118', 'FIELD TRIAL OFFICER');
INSERT INTO `master_position` VALUES ('119', 'FINANCE MANAGER');
INSERT INTO `master_position` VALUES ('120', 'FLOWER SPECIALIST');
INSERT INTO `master_position` VALUES ('121', 'GARDEN SUPERVISOR');
INSERT INTO `master_position` VALUES ('122', 'GARDENER WORKER');
INSERT INTO `master_position` VALUES ('123', 'GENERAL ADMINISTRATION');
INSERT INTO `master_position` VALUES ('124', 'GENERAL AFFAIRS SUPERVISOR');
INSERT INTO `master_position` VALUES ('125', 'GENERAL AGRONOMIST');
INSERT INTO `master_position` VALUES ('126', 'GENETIC RESOURCES ADM');
INSERT INTO `master_position` VALUES ('127', 'GENETIC RESOURCES MANAGER');
INSERT INTO `master_position` VALUES ('128', 'GENETIC RESOURCES OFFICER');
INSERT INTO `master_position` VALUES ('129', 'GRAPHIC DESIGNER');
INSERT INTO `master_position` VALUES ('130', 'GROW OUT TEST OFFICER');
INSERT INTO `master_position` VALUES ('131', 'GROW OUT TEST WORKER');
INSERT INTO `master_position` VALUES ('132', 'HEAD CASHIER');
INSERT INTO `master_position` VALUES ('133', 'HUMAN RESOURCES & GENERAL AFFAIR SUPERINTENDENT');
INSERT INTO `master_position` VALUES ('134', 'HUMAN RESOURCES ADMIN');
INSERT INTO `master_position` VALUES ('135', 'HUMAN RESOURCES STAFF');
INSERT INTO `master_position` VALUES ('136', 'HUMAN RESOURCES SUPERVISOR');
INSERT INTO `master_position` VALUES ('137', 'ICT MANAGER');
INSERT INTO `master_position` VALUES ('138', 'ICT OFFICER');
INSERT INTO `master_position` VALUES ('139', 'ICT WORKER');
INSERT INTO `master_position` VALUES ('140', 'IEF OPERATOR');
INSERT INTO `master_position` VALUES ('141', 'IEF/DNA OFFICER');
INSERT INTO `master_position` VALUES ('142', 'INDOOR PRODUCTION ADMIN');
INSERT INTO `master_position` VALUES ('143', 'INDOOR PRODUCTION STAFF');
INSERT INTO `master_position` VALUES ('144', 'INDOOR PRODUCTION WORKER');
INSERT INTO `master_position` VALUES ('145', 'INTERNAL AUDITOR');
INSERT INTO `master_position` VALUES ('146', 'INVENTORY ADMIN');
INSERT INTO `master_position` VALUES ('147', 'INVENTORY STAFF');
INSERT INTO `master_position` VALUES ('148', 'JUNIOR GRAPHIC DESIGNER');
INSERT INTO `master_position` VALUES ('149', 'JUNIOR PRODUCT SPECIALIST FOR CHILI');
INSERT INTO `master_position` VALUES ('150', 'LAB LEADER KBL');
INSERT INTO `master_position` VALUES ('151', 'LAB SUPERINTENDENT');
INSERT INTO `master_position` VALUES ('152', 'LAB WOKER PURWAKARTA');
INSERT INTO `master_position` VALUES ('153', 'LAB WORKER');
INSERT INTO `master_position` VALUES ('154', 'LAB WORKER - CTC');
INSERT INTO `master_position` VALUES ('155', 'LAB WORKER - PP');
INSERT INTO `master_position` VALUES ('156', 'LAB WORKER KBU');
INSERT INTO `master_position` VALUES ('157', 'LAB WORKER PP - KBL');
INSERT INTO `master_position` VALUES ('158', 'LAB WORKER PP - KBW');
INSERT INTO `master_position` VALUES ('159', 'LABORATORY TISSUE CULTURE STAFF');
INSERT INTO `master_position` VALUES ('160', 'LEADER GENERAL');
INSERT INTO `master_position` VALUES ('161', 'LEGAL OFFICER');
INSERT INTO `master_position` VALUES ('162', 'LOGISTIC ADMINISTRATOR');
INSERT INTO `master_position` VALUES ('163', 'LOGISTIC DRIVER');
INSERT INTO `master_position` VALUES ('164', 'LOGISTIC LEADER');
INSERT INTO `master_position` VALUES ('165', 'LOGISTIC OFFICER');
INSERT INTO `master_position` VALUES ('166', 'LOGISTIC SUPERINTENDENT');
INSERT INTO `master_position` VALUES ('167', 'LOGISTIC WORKER');
INSERT INTO `master_position` VALUES ('168', 'MAINTENANCE, SAFETY & SANITARY STAFF');
INSERT INTO `master_position` VALUES ('169', 'MANAGING DIRECTOR');
INSERT INTO `master_position` VALUES ('170', 'MARKETING ADMIN');
INSERT INTO `master_position` VALUES ('171', 'MARKETING ANALYST');
INSERT INTO `master_position` VALUES ('172', 'MARKETING COMMUNICATION MANAGER');
INSERT INTO `master_position` VALUES ('173', 'MARKETING COMMUNICATION STAFF');
INSERT INTO `master_position` VALUES ('174', 'MARKETING DRIVER');
INSERT INTO `master_position` VALUES ('175', 'MARKETING MANAGER');
INSERT INTO `master_position` VALUES ('176', 'MARKETING REPRESENTATIVE');
INSERT INTO `master_position` VALUES ('177', 'MARKETING TRAINEE PROGRAM');
INSERT INTO `master_position` VALUES ('178', 'MOLECULAR BIOLOGY OFFICER');
INSERT INTO `master_position` VALUES ('179', 'MOLECULAR BIOLOGY SPECIALIST');
INSERT INTO `master_position` VALUES ('180', 'MSS  WORKER');
INSERT INTO `master_position` VALUES ('181', 'MSS & PROJECT SUPERINTENDENT');
INSERT INTO `master_position` VALUES ('182', 'MSS SUPERVISOR');
INSERT INTO `master_position` VALUES ('183', 'MSS WORKER');
INSERT INTO `master_position` VALUES ('184', 'OPERATOR SEED HEALTH TREATMENT');
INSERT INTO `master_position` VALUES ('185', 'PACKING ADMIN');
INSERT INTO `master_position` VALUES ('186', 'PACKING LEADER');
INSERT INTO `master_position` VALUES ('187', 'PACKING MATERIAL ADMIN');
INSERT INTO `master_position` VALUES ('188', 'PACKING SUPERINTENDENT');
INSERT INTO `master_position` VALUES ('189', 'PACKING SUPERVISOR');
INSERT INTO `master_position` VALUES ('190', 'PACKING WORKER');
INSERT INTO `master_position` VALUES ('191', 'PARENTAL MAINTENANCE OFFICER');
INSERT INTO `master_position` VALUES ('192', 'PDS ADMINISTRATION');
INSERT INTO `master_position` VALUES ('193', 'PDS MANAGER');
INSERT INTO `master_position` VALUES ('194', 'PDS OFFICER');
INSERT INTO `master_position` VALUES ('195', 'PDS STAFF');
INSERT INTO `master_position` VALUES ('196', 'PDS SUPERINTENDENT');
INSERT INTO `master_position` VALUES ('197', 'PDS SUPERVISOR');
INSERT INTO `master_position` VALUES ('198', 'PERSONAL ASSISTANT MANAGING DIRECTOR');
INSERT INTO `master_position` VALUES ('199', 'PLANT INSPECTOR');
INSERT INTO `master_position` VALUES ('200', 'PLANT LOGISTIC OFFICER');
INSERT INTO `master_position` VALUES ('201', 'PLANT MANAGER');
INSERT INTO `master_position` VALUES ('202', 'PLANT PATHOLOGY');
INSERT INTO `master_position` VALUES ('203', 'PLANT PATHOLOGY ADMIN AND LOGISTIC');
INSERT INTO `master_position` VALUES ('204', 'PLANT PATHOLOGY MANAGER');
INSERT INTO `master_position` VALUES ('205', 'PLANT PATHOLOGY OFFICER');
INSERT INTO `master_position` VALUES ('206', 'PLANT PATHOLOGY SUPERVISOR');
INSERT INTO `master_position` VALUES ('207', 'PLANT SUPERINTENDENT');
INSERT INTO `master_position` VALUES ('208', 'POLINATOR');
INSERT INTO `master_position` VALUES ('209', 'POLLEN FIELD INSPECTION OFFICER');
INSERT INTO `master_position` VALUES ('210', 'POLLEN PRODUCTION WORKER');
INSERT INTO `master_position` VALUES ('211', 'POLLEN SUPPLY SUPERINTENDENT');
INSERT INTO `master_position` VALUES ('212', 'POTATO VALUE CHAIN SPECIALIST AND COMERCIAL');
INSERT INTO `master_position` VALUES ('213', 'PP WORKER KBL');
INSERT INTO `master_position` VALUES ('214', 'PPIC MANAGER');
INSERT INTO `master_position` VALUES ('215', 'PPIC OFFICER');
INSERT INTO `master_position` VALUES ('216', 'PPIC STAFF');
INSERT INTO `master_position` VALUES ('217', 'PROC. & CLEANING WORKER');
INSERT INTO `master_position` VALUES ('218', 'PROCESSING ADMIN');
INSERT INTO `master_position` VALUES ('219', 'PROCESSING SUPERINTENDENT');
INSERT INTO `master_position` VALUES ('220', 'PROCESSING SUPERVISOR');
INSERT INTO `master_position` VALUES ('221', 'PROCESSING WORKER');
INSERT INTO `master_position` VALUES ('222', 'PRODUCT PROMOTION INTRO SUPERVISOR');
INSERT INTO `master_position` VALUES ('223', 'PRODUCT PROMOTION OFFICER');
INSERT INTO `master_position` VALUES ('224', 'PRODUCT PROMOTION SUPERVISOR');
INSERT INTO `master_position` VALUES ('225', 'PRODUCT SPECIALIST FOR CUCURBIT');
INSERT INTO `master_position` VALUES ('226', 'PRODUCT SPECIALIST FOR TOMATO');
INSERT INTO `master_position` VALUES ('227', 'PRODUCTION ADMIN');
INSERT INTO `master_position` VALUES ('228', 'PRODUCTION ADMINISTRATOR');
INSERT INTO `master_position` VALUES ('229', 'PRODUCTION SUPERINTENDENT');
INSERT INTO `master_position` VALUES ('230', 'PRODUCTION TRAINEE PROGRAM');
INSERT INTO `master_position` VALUES ('231', 'PRODUCTION WORKER');
INSERT INTO `master_position` VALUES ('232', 'PROJECT & GOVERNMENT RELATION MANAGER');
INSERT INTO `master_position` VALUES ('233', 'PROJECT MANAGER');
INSERT INTO `master_position` VALUES ('234', 'PROJECT MONITORING SPECIALIST');
INSERT INTO `master_position` VALUES ('235', 'PROJECT OFFICER');
INSERT INTO `master_position` VALUES ('236', 'PUBLICITY SPECIALIST');
INSERT INTO `master_position` VALUES ('237', 'PURCHASING STAFF');
INSERT INTO `master_position` VALUES ('238', 'PURCHASING SUPERVISOR');
INSERT INTO `master_position` VALUES ('239', 'PURCHASING WORKER');
INSERT INTO `master_position` VALUES ('240', 'QA ADMIN');
INSERT INTO `master_position` VALUES ('241', 'QA PLANT LAB OFFICER');
INSERT INTO `master_position` VALUES ('242', 'QUALITY ASSURANCE MANAGER');
INSERT INTO `master_position` VALUES ('243', 'QUALITY PRODUCTION MANAGER');
INSERT INTO `master_position` VALUES ('244', 'QUALITY TRAINEE PROGRAM');
INSERT INTO `master_position` VALUES ('245', 'R & D FACILITY OFFICER');
INSERT INTO `master_position` VALUES ('246', 'R & D GENERAL ADMINISTRATION STAFF');
INSERT INTO `master_position` VALUES ('247', 'R & D MAINTENANCE WORKER');
INSERT INTO `master_position` VALUES ('248', 'R&D GENERAL ADMINISTRATION OFFICER');
INSERT INTO `master_position` VALUES ('249', 'RECEPTIONIST');
INSERT INTO `master_position` VALUES ('250', 'RECEPTIONIST & GA ADMIN');
INSERT INTO `master_position` VALUES ('251', 'RECRUITMENT SPECIALIST');
INSERT INTO `master_position` VALUES ('252', 'RESEARCH AND DEVELOPMENT DIRECTOR');
INSERT INTO `master_position` VALUES ('253', 'SALES  AND  MARKETING DIRECTOR');
INSERT INTO `master_position` VALUES ('254', 'SALES PLANNER');
INSERT INTO `master_position` VALUES ('255', 'SAMPLING AND FACTORY INSPECTION OFFICER');
INSERT INTO `master_position` VALUES ('256', 'SECURITY COORDINATOR KBL');
INSERT INTO `master_position` VALUES ('257', 'SECURITY COORDINATOR KBW');
INSERT INTO `master_position` VALUES ('258', 'SECURITY JEMBER');
INSERT INTO `master_position` VALUES ('259', 'SECURITY KBL');
INSERT INTO `master_position` VALUES ('260', 'SECURITY KBW');
INSERT INTO `master_position` VALUES ('261', 'SECURITY PRODUCTION');
INSERT INTO `master_position` VALUES ('262', 'SECURITY PWK');
INSERT INTO `master_position` VALUES ('263', 'SEED ADMIN GROUP A');
INSERT INTO `master_position` VALUES ('264', 'SEED ADMINISTRATION');
INSERT INTO `master_position` VALUES ('265', 'SEED ANALYST');
INSERT INTO `master_position` VALUES ('266', 'SEED INSPECTOR');
INSERT INTO `master_position` VALUES ('267', 'SEED LAB OFFICER');
INSERT INTO `master_position` VALUES ('268', 'SEED LABORATORY OFFICER');
INSERT INTO `master_position` VALUES ('269', 'SEED LABORATORY SUPERINTENDENT');
INSERT INTO `master_position` VALUES ('270', 'SEED LABORATORY SUPERVISOR');
INSERT INTO `master_position` VALUES ('271', 'SEED PATHOLOGY ANALYST');
INSERT INTO `master_position` VALUES ('272', 'SEED PATHOLOGY RESEARCH OFFICER');
INSERT INTO `master_position` VALUES ('273', 'SEED PHYSIOLOGIST');
INSERT INTO `master_position` VALUES ('274', 'SEED RESEARCH MANAGER');
INSERT INTO `master_position` VALUES ('275', 'SEED RESEARCH TRAINEE PROGRAM');
INSERT INTO `master_position` VALUES ('276', 'SEED SAMPLER');
INSERT INTO `master_position` VALUES ('277', 'SEED TECHNOLOGY RESEARCH SUPERINTENDENT');
INSERT INTO `master_position` VALUES ('278', 'SEED TECHNOLOGY RESEARCH SUPERVISOR');
INSERT INTO `master_position` VALUES ('279', 'SENIOR BREEDING MANAGER');
INSERT INTO `master_position` VALUES ('280', 'SENIOR COMPENSATION AND BENEFIT SPECIALIST');
INSERT INTO `master_position` VALUES ('281', 'SENIOR COST ACCOUNTANT');
INSERT INTO `master_position` VALUES ('282', 'SENIOR CUSTOMER SERVICE OFFICER');
INSERT INTO `master_position` VALUES ('283', 'SENIOR FARM ACCOUNTING & ADMINISTRATOR OFFICER');
INSERT INTO `master_position` VALUES ('284', 'SENIOR FINANCE & ACCOUNTING MANAGER');
INSERT INTO `master_position` VALUES ('285', 'SENIOR GRAPHIC DESIGNER');
INSERT INTO `master_position` VALUES ('286', 'SENIOR HUMAN RESOURCES MANAGER');
INSERT INTO `master_position` VALUES ('287', 'SENIOR ICT SUPERVISOR');
INSERT INTO `master_position` VALUES ('288', 'SENIOR INDOOR PRODUCTION OFFICER');
INSERT INTO `master_position` VALUES ('289', 'SENIOR LEGAL OFFICER');
INSERT INTO `master_position` VALUES ('290', 'SENIOR MAINTENANCE OFFICER');
INSERT INTO `master_position` VALUES ('291', 'SENIOR PLANT MANAGER');
INSERT INTO `master_position` VALUES ('292', 'SENIOR PLANT PATHOLOGY');
INSERT INTO `master_position` VALUES ('293', 'SENIOR PRODUCT MANAGER');
INSERT INTO `master_position` VALUES ('294', 'SENIOR PRODUCTION MANAGER');
INSERT INTO `master_position` VALUES ('295', 'SENIOR SUPPLY CHAIN MANAGER');
INSERT INTO `master_position` VALUES ('296', 'SH LAB WORKER KBU');
INSERT INTO `master_position` VALUES ('297', 'SH LAB WORKER KBW');
INSERT INTO `master_position` VALUES ('298', 'SHIPPING & LOGISTIC ADMIN');
INSERT INTO `master_position` VALUES ('299', 'SHIPPING LEADER');
INSERT INTO `master_position` VALUES ('300', 'SHIPPING SUPERINTENDENT');
INSERT INTO `master_position` VALUES ('301', 'SHIPPING SUPERVISOR');
INSERT INTO `master_position` VALUES ('302', 'SHIPPING WORKER');
INSERT INTO `master_position` VALUES ('303', 'SHIPPING WORKER - STOCK POINT BANJARBARU');
INSERT INTO `master_position` VALUES ('304', 'SHIPPING WORKER - STOCK POINT MAKASSAR');
INSERT INTO `master_position` VALUES ('305', 'SHIPPING WORKER - STOCK POINT MEDAN');
INSERT INTO `master_position` VALUES ('306', 'SHIPPING WORKER - STOCK POINT PALEMBANG');
INSERT INTO `master_position` VALUES ('307', 'SHIPPING WORKER - STOCK POINT PONTIANAK');
INSERT INTO `master_position` VALUES ('308', 'SR.CASH & BANK CONTROLLER');
INSERT INTO `master_position` VALUES ('309', 'STOCK POINT SUPERVISOR');
INSERT INTO `master_position` VALUES ('310', 'STOCK SEED ADMINISTRATION');
INSERT INTO `master_position` VALUES ('311', 'STOCK SEED INVENTORY  & LOGISTIC SUPERVISOR');
INSERT INTO `master_position` VALUES ('312', 'STOCK SEED INVENTORY OFFICER');
INSERT INTO `master_position` VALUES ('313', 'STOCK SEED LOGISTIC WORKER');
INSERT INTO `master_position` VALUES ('314', 'STOCK SEED MANAGER');
INSERT INTO `master_position` VALUES ('315', 'STOCK SEED PROCESSING & INVENTORY OFFICER');
INSERT INTO `master_position` VALUES ('316', 'STOCK SEED PRODUCTION OFFICER');
INSERT INTO `master_position` VALUES ('317', 'STOCK SEED PRODUCTION SUPERINTENDENT');
INSERT INTO `master_position` VALUES ('318', 'STOCK SEED PRODUCTION WORKER');
INSERT INTO `master_position` VALUES ('319', 'STOCK SEED WORKER');
INSERT INTO `master_position` VALUES ('320', 'STOCKSEED TRAINEE PROGRAM');
INSERT INTO `master_position` VALUES ('321', 'STTC ADMINISTRATOR');
INSERT INTO `master_position` VALUES ('322', 'STTC PRODUCT INTRO WORKER');
INSERT INTO `master_position` VALUES ('323', 'STTC WORKER');
INSERT INTO `master_position` VALUES ('324', 'TAX SPECIALIST');
INSERT INTO `master_position` VALUES ('325', 'TECHNICAL TRAINEE PROGRAM');
INSERT INTO `master_position` VALUES ('326', 'TEMPERATE FARM LEADER TRIAL');
INSERT INTO `master_position` VALUES ('327', 'TISSUE CULTURE OFFICER');
INSERT INTO `master_position` VALUES ('328', 'TISSUE CULTURE SUPERVISOR');
INSERT INTO `master_position` VALUES ('329', 'TRAVEL OFFICER');
INSERT INTO `master_position` VALUES ('330', 'URBAN FARMING OFFICER');
INSERT INTO `master_position` VALUES ('331', 'URBAN FARMING SPECIALIST');
INSERT INTO `master_position` VALUES ('332', 'VARIETY REGISTRATION SUPERVISOR');
INSERT INTO `master_position` VALUES ('333', 'WAREHOUSE ADMIN');
INSERT INTO `master_position` VALUES ('334', 'WAREHOUSE SUPERINTENDENT');
INSERT INTO `master_position` VALUES ('335', 'WAREHOUSE SUPERVISOR');
INSERT INTO `master_position` VALUES ('336', 'WAREHOUSE WORKER');

-- ----------------------------
-- Table structure for master_seed
-- ----------------------------
DROP TABLE IF EXISTS `master_seed`;
CREATE TABLE `master_seed` (
  `seed_id` int(10) NOT NULL AUTO_INCREMENT,
  `seed_no` int(10) DEFAULT NULL,
  `seed_rnd` varchar(255) DEFAULT NULL,
  `seed_name` varchar(100) DEFAULT NULL,
  `parent_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`seed_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of master_seed
-- ----------------------------
INSERT INTO `master_seed` VALUES ('1', null, '1', 'CUCUMBER', '0');
INSERT INTO `master_seed` VALUES ('2', '20946', '2', 'EXPOSA', '1');
INSERT INTO `master_seed` VALUES ('3', '98581', '3', 'VANESA', '1');
INSERT INTO `master_seed` VALUES ('4', null, '4', 'KANGKONG', '0');
INSERT INTO `master_seed` VALUES ('5', '98727', '5', 'DINARA S', '4');
INSERT INTO `master_seed` VALUES ('6', '91966', '6', 'NEW SERIMPI', '4');
INSERT INTO `master_seed` VALUES ('7', null, '7', 'TOMATO', '0');
INSERT INTO `master_seed` VALUES ('8', '98767', '8', 'SERVO P', '7');
INSERT INTO `master_seed` VALUES ('9', '99038', '9', 'AGATHA PS', '7');

-- ----------------------------
-- Table structure for master_status
-- ----------------------------
DROP TABLE IF EXISTS `master_status`;
CREATE TABLE `master_status` (
  `status_id` int(11) NOT NULL AUTO_INCREMENT,
  `status_name` varchar(100) DEFAULT NULL,
  `status_code` varchar(100) DEFAULT NULL,
  `status_color` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of master_status
-- ----------------------------
INSERT INTO `master_status` VALUES ('1', 'Draft', 'draft', 'var(--paper-cyan-500)');
INSERT INTO `master_status` VALUES ('2', 'Submitted', 'submitted', 'var(--paper-indigo-400)');
INSERT INTO `master_status` VALUES ('3', 'Approved', 'approved', 'var(--paper-green-300)');
INSERT INTO `master_status` VALUES ('4', 'Final Approved', 'final-approved', 'var(--paper-green-500)');
INSERT INTO `master_status` VALUES ('5', 'FA Approved', 'fa-approved', 'var(--paper-purple-500)');
INSERT INTO `master_status` VALUES ('6', 'HR Approved', 'hr-approved', 'var(--paper-blue-500)');
INSERT INTO `master_status` VALUES ('7', 'Reject', 'reject', 'var(--paper-red-500)');
INSERT INTO `master_status` VALUES ('8', 'Outstanding', 'outstanding', 'var(--paper-purple-300)');
INSERT INTO `master_status` VALUES ('9', 'Verified', 'verified', 'var(--paper-green-300)');
INSERT INTO `master_status` VALUES ('10', 'Change Request', 'change-request', 'var(--paper-amber-500)');
INSERT INTO `master_status` VALUES ('11', 'FA Received', 'fa-received', 'var(--paper-purple-300)');
INSERT INTO `master_status` VALUES ('13', 'FA Pending', 'fa-pending', 'var(--paper-teal-400)');
INSERT INTO `master_status` VALUES ('15', 'Paid', 'paid', 'var(--paper-teal-400)');
INSERT INTO `master_status` VALUES ('16', 'Closed', 'closed', 'var(--paper-teal-400)');
INSERT INTO `master_status` VALUES ('17', 'Ticket Issued', 'ticket-issued', 'var(--paper-amber-500)');
INSERT INTO `master_status` VALUES ('18', 'No Ticket', 'no-ticket', 'var(--paper-red-300)');
INSERT INTO `master_status` VALUES ('19', 'Reschedule Request', 'reschedule-request', 'var(--paper-amber-500)');
INSERT INTO `master_status` VALUES ('20', 'Reschedule Rejected', 'reschedule-rejected', 'var(--paper-red-500)');
INSERT INTO `master_status` VALUES ('21', 'Reschedule Approved', 'reschedule-approved', 'var(--paper-green-300)');
INSERT INTO `master_status` VALUES ('22', 'Reschedule Revision', 'reschedule-revision', 'var(--paper-amber-500)');

-- ----------------------------
-- Table structure for master_travel
-- ----------------------------
DROP TABLE IF EXISTS `master_travel`;
CREATE TABLE `master_travel` (
  `trv_id` int(11) NOT NULL AUTO_INCREMENT,
  `trv_name` varchar(50) DEFAULT NULL,
  `trv_code` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`trv_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of master_travel
-- ----------------------------
INSERT INTO `master_travel` VALUES ('1', 'Domestic', 'domestic');
INSERT INTO `master_travel` VALUES ('2', 'International', 'international');

-- ----------------------------
-- Table structure for master_type
-- ----------------------------
DROP TABLE IF EXISTS `master_type`;
CREATE TABLE `master_type` (
  `type_id` int(10) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(100) NOT NULL,
  `type_code` varchar(100) DEFAULT NULL,
  `parent_id` int(10) DEFAULT NULL,
  `coa` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of master_type
-- ----------------------------
INSERT INTO `master_type` VALUES ('1', 'Travelling', 'travelling', null, null);
INSERT INTO `master_type` VALUES ('3', 'Marketing Promo', 'marketing-promo', null, null);
INSERT INTO `master_type` VALUES ('4', 'Production Promo', 'production-promo', null, null);
INSERT INTO `master_type` VALUES ('5', 'Trial', 'trials', null, null);
INSERT INTO `master_type` VALUES ('6', 'Others', 'others', null, null);
INSERT INTO `master_type` VALUES ('7', 'Meeting', 'meeting', '1', null);
INSERT INTO `master_type` VALUES ('8', 'Training ', 'training', '1', null);
INSERT INTO `master_type` VALUES ('9', 'Visit', 'visit', '1', null);
INSERT INTO `master_type` VALUES ('10', 'FFD', 'ffd', '3', '614301');
INSERT INTO `master_type` VALUES ('11', 'Counseling', 'counseling', '3', '614302');
INSERT INTO `master_type` VALUES ('12', 'Comparative', 'comparative', '3', '614303');
INSERT INTO `master_type` VALUES ('13', 'Mini Expo', 'mini-expo', '3', '614304');
INSERT INTO `master_type` VALUES ('14', 'Enrichment', 'enrichment', '3', '614305');
INSERT INTO `master_type` VALUES ('15', 'Others', 'marketing-others', '3', '614399');
INSERT INTO `master_type` VALUES ('16', 'Farmer Meeting', 'farmer-meeting', '4', '614405');
INSERT INTO `master_type` VALUES ('17', 'Product Expo', 'product-expo', '4', '614406');
INSERT INTO `master_type` VALUES ('18', 'Others', 'production-promo-others', '4', '614499');

-- ----------------------------
-- Table structure for mst_customers
-- ----------------------------
DROP TABLE IF EXISTS `mst_customers`;
CREATE TABLE `mst_customers` (
  `mc_id` int(11) NOT NULL AUTO_INCREMENT,
  `mc_company_name` varchar(100) DEFAULT NULL,
  `mc_contact_name` varchar(100) DEFAULT NULL,
  `mc_phone` varchar(30) DEFAULT NULL,
  `mc_email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`mc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mst_customers
-- ----------------------------
INSERT INTO `mst_customers` VALUES ('1', 'Pertamina', 'John Doe', '(021) 1234567', 'sales@company.com');
INSERT INTO `mst_customers` VALUES ('2', 'Indofood', 'John Doe', '(021) 1234567', 'sales@company.com');
INSERT INTO `mst_customers` VALUES ('3', 'XL Axiata', 'John Doe', '(021) 1234567', 'sales@company.com');
INSERT INTO `mst_customers` VALUES ('4', 'Indosat', 'John Doe', '(021) 1234567', 'sales@company.com');
INSERT INTO `mst_customers` VALUES ('5', 'Telkomsel', 'John Doe', '(021) 1234567', 'sales@company.com');
INSERT INTO `mst_customers` VALUES ('6', 'Sampoerna', 'John Doe', '(021) 1234567', 'sales@company.com');
INSERT INTO `mst_customers` VALUES ('7', 'Net Mediatama', 'John Doe', '(021) 1234567', 'sales@company.com');
INSERT INTO `mst_customers` VALUES ('8', 'Rajawali Citra', 'John Doe', '(021) 1234567', 'sales@company.com');
INSERT INTO `mst_customers` VALUES ('9', 'Trans Media', 'John Doe', '(021) 1234567', 'sales@company.com');
INSERT INTO `mst_customers` VALUES ('11', 'Sinar Mas', 'John Doe', '(021) 1234567', 'sales@company.com');
INSERT INTO `mst_customers` VALUES ('12', 'PT KCT', 'Said', '0818990199', 'said@kct.co.id');

-- ----------------------------
-- Table structure for sys_captcha
-- ----------------------------
DROP TABLE IF EXISTS `sys_captcha`;
CREATE TABLE `sys_captcha` (
  `id` varchar(40) NOT NULL,
  `namespace` varchar(32) NOT NULL,
  `code` varchar(32) NOT NULL,
  `code_display` varchar(32) NOT NULL,
  `created` int(11) NOT NULL,
  `audio_data` mediumblob,
  PRIMARY KEY (`id`,`namespace`),
  KEY `created` (`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_captcha
-- ----------------------------

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `sc_id` int(11) NOT NULL AUTO_INCREMENT,
  `sc_name` varchar(255) DEFAULT NULL,
  `sc_value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`sc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES ('1', 'app_id', '21000182918');
INSERT INTO `sys_config` VALUES ('3', 'app_title', 'Exsys App');
INSERT INTO `sys_config` VALUES ('4', 'app_version', '1.0.0');
INSERT INTO `sys_config` VALUES ('5', 'app_description', 'east west seed indonesia expense system');
INSERT INTO `sys_config` VALUES ('6', 'app_keywords', '');
INSERT INTO `sys_config` VALUES ('7', 'app_author', 'Smartproject');
INSERT INTO `sys_config` VALUES ('8', 'app_repository', '');
INSERT INTO `sys_config` VALUES ('9', 'app_token', '66c3ff424414b74560788b53434baf309a7b510c5a4ec33f65932671af73f2a5');

-- ----------------------------
-- Table structure for sys_menus
-- ----------------------------
DROP TABLE IF EXISTS `sys_menus`;
CREATE TABLE `sys_menus` (
  `smn_id` int(11) NOT NULL AUTO_INCREMENT,
  `smn_parent_id` int(11) DEFAULT '0',
  `smn_title` varchar(50) DEFAULT NULL,
  `smn_icon` varchar(30) DEFAULT NULL,
  `smn_path` varchar(100) DEFAULT NULL,
  `smn_order` int(11) DEFAULT '1',
  `smn_visible` int(1) DEFAULT '1',
  `smn_group` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`smn_id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_menus
-- ----------------------------
INSERT INTO `sys_menus` VALUES ('1', '0', 'Homepage', 'home', '/home', '1', '1', null);
INSERT INTO `sys_menus` VALUES ('6', '11', 'Ganttchart', 'image:tune', '/components/gantt', '52', '1', null);
INSERT INTO `sys_menus` VALUES ('7', '0', 'Settings', 'settings', '/settings', '99', '1', 'Application');
INSERT INTO `sys_menus` VALUES ('14', '5', 'Foo', 'add', '/', '50', '1', null);
INSERT INTO `sys_menus` VALUES ('15', '5', 'Bar', 'add', '/', '2', '1', null);
INSERT INTO `sys_menus` VALUES ('19', '0', 'My Advance', 'communication:business', '/advance', '3', '1', 'Transaction');
INSERT INTO `sys_menus` VALUES ('21', '0', 'Expense', 'communication:business', '/expense', '5', '1', null);
INSERT INTO `sys_menus` VALUES ('30', '22', 'Types', 'label-outline', '/references/types', '4', '1', null);
INSERT INTO `sys_menus` VALUES ('31', '0', 'Operational', 'communication:business', '/opex', '6', '1', null);
INSERT INTO `sys_menus` VALUES ('32', '0', 'Trips Request', 'communication:business', '/trips', '4', '1', null);
INSERT INTO `sys_menus` VALUES ('37', '0', 'Todo List', 'social:notifications', '/tasks', '2', '1', null);
INSERT INTO `sys_menus` VALUES ('38', '0', 'Advance Return', 'communication:business', '/refund', '7', '1', null);

-- ----------------------------
-- Table structure for sys_modules
-- ----------------------------
DROP TABLE IF EXISTS `sys_modules`;
CREATE TABLE `sys_modules` (
  `sm_id` int(11) NOT NULL AUTO_INCREMENT,
  `sm_name` varchar(100) DEFAULT NULL,
  `sm_version` varchar(30) DEFAULT NULL,
  `sm_title` varchar(100) DEFAULT NULL,
  `sm_author` varchar(50) DEFAULT 'KCT Team',
  `sm_repository` varchar(255) DEFAULT NULL,
  `sm_api` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`sm_id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sys_modules
-- ----------------------------
INSERT INTO `sys_modules` VALUES ('5', 'home', '1.0.0', 'Homepage', 'KCT Team', null, '/home');
INSERT INTO `sys_modules` VALUES ('17', 'settings', '1.0', 'Settings', 'KCT Team', null, '/settings');
INSERT INTO `sys_modules` VALUES ('18', 'advance', '1.0.0', 'My Advance', 'EXSYS', null, '/advance');
INSERT INTO `sys_modules` VALUES ('19', 'expense', '1.0.0', 'Expense', 'KCT Team', null, '/expense');
INSERT INTO `sys_modules` VALUES ('27', 'operational', '1.0.0', 'Operational Expense', 'Smartproject', null, '/opex');
INSERT INTO `sys_modules` VALUES ('28', 'trips', '1.0.0', 'Trips Request', 'Smartproject', null, '/trips');
INSERT INTO `sys_modules` VALUES ('33', 'refund', '1.0.0', 'Refund', 'KCT Team', null, '/refund');
INSERT INTO `sys_modules` VALUES ('34', 'tasks', '1.0.0', 'Tasks', 'KCT Team', null, '/tasks');

-- ----------------------------
-- Table structure for sys_modules_capabilities
-- ----------------------------
DROP TABLE IF EXISTS `sys_modules_capabilities`;
CREATE TABLE `sys_modules_capabilities` (
  `smc_id` int(11) NOT NULL AUTO_INCREMENT,
  `smc_sm_id` int(11) DEFAULT NULL,
  `smc_name` varchar(100) DEFAULT NULL,
  `smc_description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`smc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sys_modules_capabilities
-- ----------------------------

-- ----------------------------
-- Table structure for sys_numbers
-- ----------------------------
DROP TABLE IF EXISTS `sys_numbers`;
CREATE TABLE `sys_numbers` (
  `sn_id` int(11) NOT NULL AUTO_INCREMENT,
  `sn_name` varchar(50) DEFAULT NULL,
  `sn_value` int(11) DEFAULT NULL,
  `sn_length` int(11) DEFAULT NULL,
  `sn_prefix` varchar(30) DEFAULT NULL,
  `sn_suffix` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`sn_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_numbers
-- ----------------------------
INSERT INTO `sys_numbers` VALUES ('2', 'ADVANCE', '80', '4', 'ADV#', null);
INSERT INTO `sys_numbers` VALUES ('3', 'EXPENSE', '48', '4', 'EXP#', null);
INSERT INTO `sys_numbers` VALUES ('4', 'TRIP', '54', '4', 'TRP#', null);
INSERT INTO `sys_numbers` VALUES ('5', 'OPEX', '22', '4', 'OPX#', null);

-- ----------------------------
-- Table structure for sys_permissions
-- ----------------------------
DROP TABLE IF EXISTS `sys_permissions`;
CREATE TABLE `sys_permissions` (
  `sp_id` int(11) NOT NULL AUTO_INCREMENT,
  `sp_sr_id` int(11) DEFAULT NULL,
  `sp_smc_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`sp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sys_permissions
-- ----------------------------
INSERT INTO `sys_permissions` VALUES ('1', '1', '1');

-- ----------------------------
-- Table structure for sys_roles
-- ----------------------------
DROP TABLE IF EXISTS `sys_roles`;
CREATE TABLE `sys_roles` (
  `sr_id` int(11) NOT NULL AUTO_INCREMENT,
  `sr_name` varchar(100) DEFAULT NULL,
  `sr_slug` varchar(100) DEFAULT NULL,
  `sr_description` varchar(255) DEFAULT NULL,
  `sr_default` int(1) DEFAULT '0',
  `sr_created_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `sr_created_by` varchar(50) DEFAULT 'system',
  PRIMARY KEY (`sr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sys_roles
-- ----------------------------
INSERT INTO `sys_roles` VALUES ('4', 'Demo', 'demo', 'Role for demo users', '0', '2017-05-24 18:48:45', 'system');
INSERT INTO `sys_roles` VALUES ('16', 'FA Receiver', 'fa-receiver', 'Role for accounting receiver users', '0', '2017-10-22 19:56:32', 'system');
INSERT INTO `sys_roles` VALUES ('17', 'FA Approver', 'fa-approver', 'Role for accounting approver users', '0', '2017-10-23 17:08:09', 'system');
INSERT INTO `sys_roles` VALUES ('18', 'Human Resource', 'human-resource', 'Role for human resource users', '0', '2017-10-23 17:09:45', 'system');
INSERT INTO `sys_roles` VALUES ('19', 'Employee', 'employee', 'Role for application user', '0', '2017-10-24 02:23:30', 'system');
INSERT INTO `sys_roles` VALUES ('20', 'Ticketing', 'ticketing', 'Role for user ticketing', '0', '2017-10-29 15:52:18', 'system');

-- ----------------------------
-- Table structure for sys_roles_kanban
-- ----------------------------
DROP TABLE IF EXISTS `sys_roles_kanban`;
CREATE TABLE `sys_roles_kanban` (
  `srk_id` int(11) NOT NULL AUTO_INCREMENT,
  `srk_sr_id` int(11) DEFAULT NULL,
  `srk_ks_id` int(11) DEFAULT NULL,
  `srk_selected` int(1) DEFAULT '0',
  PRIMARY KEY (`srk_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_roles_kanban
-- ----------------------------
INSERT INTO `sys_roles_kanban` VALUES ('7', '4', '16', '1');
INSERT INTO `sys_roles_kanban` VALUES ('9', '4', '18', '1');

-- ----------------------------
-- Table structure for sys_roles_limit
-- ----------------------------
DROP TABLE IF EXISTS `sys_roles_limit`;
CREATE TABLE `sys_roles_limit` (
  `srl_id` int(11) NOT NULL AUTO_INCREMENT,
  `srl_sr_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`srl_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_roles_limit
-- ----------------------------

-- ----------------------------
-- Table structure for sys_roles_menus
-- ----------------------------
DROP TABLE IF EXISTS `sys_roles_menus`;
CREATE TABLE `sys_roles_menus` (
  `srm_id` int(11) NOT NULL AUTO_INCREMENT,
  `srm_sr_id` int(11) DEFAULT NULL,
  `srm_smn_id` int(11) DEFAULT NULL,
  `srm_selected` int(1) DEFAULT '0',
  PRIMARY KEY (`srm_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_roles_menus
-- ----------------------------
INSERT INTO `sys_roles_menus` VALUES ('1', '4', '1', '1');
INSERT INTO `sys_roles_menus` VALUES ('2', '4', '4', '0');
INSERT INTO `sys_roles_menus` VALUES ('3', '4', '14', '0');
INSERT INTO `sys_roles_menus` VALUES ('4', '4', '3', '0');
INSERT INTO `sys_roles_menus` VALUES ('5', '4', '17', '0');
INSERT INTO `sys_roles_menus` VALUES ('6', '4', '16', '0');
INSERT INTO `sys_roles_menus` VALUES ('7', '4', '18', '0');
INSERT INTO `sys_roles_menus` VALUES ('8', '4', '7', '1');
INSERT INTO `sys_roles_menus` VALUES ('9', '4', '19', '1');
INSERT INTO `sys_roles_menus` VALUES ('10', '4', '21', '1');
INSERT INTO `sys_roles_menus` VALUES ('11', '4', '23', '0');
INSERT INTO `sys_roles_menus` VALUES ('12', '4', '24', '0');
INSERT INTO `sys_roles_menus` VALUES ('13', '4', '25', '0');
INSERT INTO `sys_roles_menus` VALUES ('14', '4', '26', '0');
INSERT INTO `sys_roles_menus` VALUES ('15', '4', '27', '0');
INSERT INTO `sys_roles_menus` VALUES ('16', '4', '28', '0');
INSERT INTO `sys_roles_menus` VALUES ('17', '4', '29', '0');
INSERT INTO `sys_roles_menus` VALUES ('18', '4', '30', '0');
INSERT INTO `sys_roles_menus` VALUES ('19', '4', '31', '1');
INSERT INTO `sys_roles_menus` VALUES ('20', '4', '32', '1');
INSERT INTO `sys_roles_menus` VALUES ('21', '4', '33', '0');
INSERT INTO `sys_roles_menus` VALUES ('22', '19', '1', '0');
INSERT INTO `sys_roles_menus` VALUES ('23', '4', '34', '0');
INSERT INTO `sys_roles_menus` VALUES ('24', '4', '35', '0');
INSERT INTO `sys_roles_menus` VALUES ('25', '4', '36', '0');
INSERT INTO `sys_roles_menus` VALUES ('26', '4', '37', '1');
INSERT INTO `sys_roles_menus` VALUES ('27', '4', '38', '1');

-- ----------------------------
-- Table structure for sys_roles_permissions
-- ----------------------------
DROP TABLE IF EXISTS `sys_roles_permissions`;
CREATE TABLE `sys_roles_permissions` (
  `srp_id` int(11) NOT NULL AUTO_INCREMENT,
  `srp_sr_id` int(11) DEFAULT NULL,
  `srp_smc_id` int(11) DEFAULT NULL,
  `srp_selected` int(1) DEFAULT '0',
  PRIMARY KEY (`srp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_roles_permissions
-- ----------------------------
INSERT INTO `sys_roles_permissions` VALUES ('12', '4', '24', '0');
INSERT INTO `sys_roles_permissions` VALUES ('13', '4', '12', '0');
INSERT INTO `sys_roles_permissions` VALUES ('14', '4', '3', '0');
INSERT INTO `sys_roles_permissions` VALUES ('15', '4', '18', '0');
INSERT INTO `sys_roles_permissions` VALUES ('16', '4', '19', '0');
INSERT INTO `sys_roles_permissions` VALUES ('17', '4', '22', '0');
INSERT INTO `sys_roles_permissions` VALUES ('18', '4', '23', '0');
INSERT INTO `sys_roles_permissions` VALUES ('19', '4', '20', '0');
INSERT INTO `sys_roles_permissions` VALUES ('20', '4', '25', '0');
INSERT INTO `sys_roles_permissions` VALUES ('21', '4', '17', '0');
INSERT INTO `sys_roles_permissions` VALUES ('22', '4', '16', '0');
INSERT INTO `sys_roles_permissions` VALUES ('23', '4', '21', '0');
INSERT INTO `sys_roles_permissions` VALUES ('24', '4', '26', '0');
INSERT INTO `sys_roles_permissions` VALUES ('25', '4', '27', '0');
INSERT INTO `sys_roles_permissions` VALUES ('26', '4', '28', '0');
INSERT INTO `sys_roles_permissions` VALUES ('27', '4', '29', '0');
INSERT INTO `sys_roles_permissions` VALUES ('28', '4', '30', '0');
INSERT INTO `sys_roles_permissions` VALUES ('29', '19', '25', '0');

-- ----------------------------
-- Table structure for sys_roles_users
-- ----------------------------
DROP TABLE IF EXISTS `sys_roles_users`;
CREATE TABLE `sys_roles_users` (
  `sru_id` int(11) NOT NULL AUTO_INCREMENT,
  `sru_sr_id` int(11) DEFAULT NULL,
  `sru_su_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`sru_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_roles_users
-- ----------------------------
INSERT INTO `sys_roles_users` VALUES ('5', '4', '2');
INSERT INTO `sys_roles_users` VALUES ('6', '16', '2');
INSERT INTO `sys_roles_users` VALUES ('7', '4', '9');
INSERT INTO `sys_roles_users` VALUES ('11', '4', '1');
INSERT INTO `sys_roles_users` VALUES ('13', '4', '7');
INSERT INTO `sys_roles_users` VALUES ('14', '4', '3');
INSERT INTO `sys_roles_users` VALUES ('15', '4', '4');
INSERT INTO `sys_roles_users` VALUES ('16', '4', '8');
INSERT INTO `sys_roles_users` VALUES ('18', '17', '8');
INSERT INTO `sys_roles_users` VALUES ('19', '20', '9');
INSERT INTO `sys_roles_users` VALUES ('20', '18', '7');
INSERT INTO `sys_roles_users` VALUES ('21', '4', '10');

-- ----------------------------
-- Table structure for sys_users
-- ----------------------------
DROP TABLE IF EXISTS `sys_users`;
CREATE TABLE `sys_users` (
  `su_id` int(11) NOT NULL AUTO_INCREMENT,
  `su_position_id` int(11) DEFAULT NULL,
  `su_grade_id` int(11) DEFAULT NULL,
  `su_superior` int(11) DEFAULT NULL,
  `su_email` varchar(255) DEFAULT NULL,
  `su_username` varchar(255) DEFAULT NULL,
  `su_passwd` varchar(255) DEFAULT NULL,
  `su_fullname` varchar(255) DEFAULT NULL,
  `su_nip` varchar(100) DEFAULT NULL,
  `su_avatar` varchar(255) DEFAULT NULL,
  `su_access_token` text,
  `su_sex` varchar(30) DEFAULT NULL,
  `su_dob` date DEFAULT NULL,
  `su_job_title` varchar(100) DEFAULT NULL,
  `su_company` varchar(255) DEFAULT NULL,
  `su_phone` varchar(30) DEFAULT NULL,
  `su_active` int(1) DEFAULT '1',
  `su_created_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `su_created_by` varchar(50) DEFAULT 'system',
  PRIMARY KEY (`su_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sys_users
-- ----------------------------
INSERT INTO `sys_users` VALUES ('1', '102', '13', '10', 'user@x.app', null, '$2y$08$dWZ2bnZPZGlZTFRzcFM3O.0H1nj9De85nlg47ErMwBPwhnDzCJlFq', 'Operator User', null, 'admin_x_app.png', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJpYXQiOjE1MTE2NjM2NDMsImp0aSI6IjhmbG9YWTJFcytWRzgzbDN6dVdEZ05EV2pKdnN0TytTQkJGeXE2c2taSXM9IiwiaXNzIjoiS3JlYXNpbmRvIENpcHRhIFRla25vbG9naSIsIm5iZiI6MTUxMTY2MzY0NCwiZXhwIjoxNTExNjkxNjQ0LCJkYXRhIjp7InN1X2VtYWlsIjoidXNlckB4LmFwcCJ9fQ.eHlYHMAUJ5wCRMRwL5GFgJmODvjT6zVSXe98EdDXauQ7o22ErukOH7WDcLw2I1S3Z_3K34eqaGaUxZ6Fw8L82w', 'Female', '1985-07-03', 'Programmer', 'Kreasindo Cipta Teknologi', '(021) 1234567', '1', '2017-04-27 20:52:36', 'system');
INSERT INTO `sys_users` VALUES ('2', '2', '31', '3', 'receiver@x.app', null, '$2y$08$UU9UcTVGY3pxcUFxcHRTT.Z6qTH2pEdxtCNTaASlmhekOG0M3jLmG', 'Receiver User', null, 'vidi_x_app.png', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJpYXQiOjE1MTA5MzM1OTcsImp0aSI6InNaZU00NDFcL0Rpbm1iZmR1aUhBdmJONmpVbXJMWlg3WWFXRXZsTUJzalNBPSIsImlzcyI6IktyZWFzaW5kbyBDaXB0YSBUZWtub2xvZ2kiLCJuYmYiOjE1MTA5MzM1OTgsImV4cCI6MTUxMDk2MTU5OCwiZGF0YSI6eyJzdV9lbWFpbCI6InJlY2VpdmVyQHguYXBwIn19.PkmW2YHspBhc0RfP1JVQ9QkS90uvlbiQH2uvfyYexIhEaAs4dYQ9espEJc3_6B4jkn7BJ0aDhGF8sOFs1dYWOA', 'Male', '2017-10-17', 'Manager', null, '(021) 7654321', '1', '2017-05-04 05:55:15', 'system');
INSERT INTO `sys_users` VALUES ('3', '1', '31', null, 'superior@x.app', null, '$2y$08$JInjOtkULdYcwjnWPXwUL.V5ZUAn8rANXsYliJDdPXrS9bUnS/QfW', 'Superior User', null, 'cahya_x_app.png', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJpYXQiOjE1MDk1MDkwMzYsImp0aSI6IlRnRW11cVdMUkJMSWUwemJjS3FnM1hEUXE2YkN2TWJxdlozcEpRSlpqWTg9IiwiaXNzIjoiS3JlYXNpbmRvIENpcHRhIFRla25vbG9naSIsIm5iZiI6MTUwOTUwOTAzNywiZXhwIjoxNTA5NTM3MDM3LCJkYXRhIjp7InN1X2VtYWlsIjoiY2FoeWFAeC5hcHAifX0.C97Yu99_Ut8WhDrpjyDJDgehxA9SoWkxa3m97AwbSbKhy4sz8w9GYSTjjFt2SVUG-ZjKDsOgjbi9BPT8MBA64Q', 'Male', '2017-10-17', 'Developer', null, '(021) 11223344', '1', '2017-05-04 06:24:39', 'system');
INSERT INTO `sys_users` VALUES ('4', '1', '31', '8', 'manager@x.app', null, '$2y$08$JD1lu23K6va7KJlh7x1o6uMN55nAUsQjFUFcH9o8AFPTitLBS8Y0y', 'Manager User', null, 'wili_x_app.png', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJpYXQiOjE1MTA5MzE3OTYsImp0aSI6InR1aWtpemxzeUlQeGt4Z0UxTnNvN3VFUHEyU0RCU2dzMVpNY1lxcnV3TVE9IiwiaXNzIjoiS3JlYXNpbmRvIENpcHRhIFRla25vbG9naSIsIm5iZiI6MTUxMDkzMTc5NywiZXhwIjoxNTEwOTU5Nzk3LCJkYXRhIjp7InN1X2VtYWlsIjoibWFuYWdlckB4LmFwcCJ9fQ.Yxbl4JfGqoX6l7xzu_keW_HcsigW9wZjgp1HfsRfCP_ZE_q1cOhcAGqMtMFVSm9C65J2A9QPT_9mZnSR-s9LHw', null, '2017-10-17', 'Developer', null, '(021) 7718271', '1', '2017-05-04 07:20:15', 'system');
INSERT INTO `sys_users` VALUES ('7', '1', '28', '8', 'hr@x.app', null, '$2y$08$swEfrnafombDpMRGinkU2u2NsCet8xnfpuZdoeF90cMrpWgZ5TyHS', 'HR User', null, 'said_x_app.png', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJpYXQiOjE1MTA1NTA4NTgsImp0aSI6IkNDclYyT3h3aXpTdzhzYU1veG5VR296NDl3cEg3NnFPQVQwdHNlTHp0aTg9IiwiaXNzIjoiS3JlYXNpbmRvIENpcHRhIFRla25vbG9naSIsIm5iZiI6MTUxMDU1MDg1OSwiZXhwIjoxNTEwNTc4ODU5LCJkYXRhIjp7InN1X2VtYWlsIjoiaHJAeC5hcHAifX0.zTgB6ZTEBMgTDhDbsBZe6TpXjWOPfntHA03maJD7i0Jhm1YIpqrq-oc-W_tPwD_SlVT6aWlGPVZiRpMtcft0dQ', null, null, 'CEO', null, '(021) 7711827', '1', '2017-08-04 15:12:15', 'system');
INSERT INTO `sys_users` VALUES ('8', '1', '31', '3', 'fa@x.app', null, '$2y$08$OEtacHF3cTR2OXlyR1NEVuA89dNtb2w1Bxd8h/elOxi7anybCaCLy', 'Finance User', null, 'john_x_app.png', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJpYXQiOjE1MTE2Njc4OTksImp0aSI6IkdYbkwxOTlyZkFRanArNFhlQnZPZ1BhQzhTZ1JcL3FcL0JsY0FQd0tzelJIZz0iLCJpc3MiOiJLcmVhc2luZG8gQ2lwdGEgVGVrbm9sb2dpIiwibmJmIjoxNTExNjY3OTAwLCJleHAiOjE1MTE2OTU5MDAsImRhdGEiOnsic3VfZW1haWwiOiJmYUB4LmFwcCJ9fQ.JOn0ZvyV79oaJXc9mzlIGNqECGbcAgE25lGmOCK7gq-58B-sJWIuYuUHnTtuilcRoB7D-yZ70K-D7k8fCl1kQA', 'Male', '2017-10-17', 'Developer', null, '(021) 7716271', '1', '2017-10-15 08:18:07', 'system');
INSERT INTO `sys_users` VALUES ('9', '1', '31', '8', 'ticketing@x.app', null, '$2y$08$eGdqRUQ0NTlSSTlBOGhIZO/QMdy0.I/oW9S85l0k3jAar1ZRXB5V.', 'Ticketing User', null, 'mama_x_app.png', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJpYXQiOjE1MTA4OTc1ODEsImp0aSI6IkJhRXU4UmxYTktkMFRnc3VHSUhrYUVQQmJ4ZWc4WHNYbEVJbjk1biszaUU9IiwiaXNzIjoiS3JlYXNpbmRvIENpcHRhIFRla25vbG9naSIsIm5iZiI6MTUxMDg5NzU4MiwiZXhwIjoxNTEwOTI1NTgyLCJkYXRhIjp7InN1X2VtYWlsIjoidGlja2V0aW5nQHguYXBwIn19.g3ArJugXSthH0ujkwmNOPwP1uf9NXlO3taJJdcZyhiwpTx6esdFZ_eOGwmfZ3YcLP66LTSEahUBZ2m83OaP_xw', 'Female', '2017-10-31', 'Staff administrasi', null, '(021) 5612516', '1', '2017-10-24 02:12:30', 'system');
INSERT INTO `sys_users` VALUES ('10', '4', '25', '4', 'verificator@x.app', null, '$2y$08$c2VKV05wZ2dJbTVSSXBtO.WaLQfacpufKlCn8HQpBPbSeOX9TxjNS', 'Verificator User', null, 'verificator_x_app.png', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJpYXQiOjE1MTAyMjY4NDgsImp0aSI6InBDY2ZaSkJIT1wvYUJZdmdGSTJiZU9PS0k1TU9kaDkrWStkNXhTMmdzMzJJPSIsImlzcyI6IktyZWFzaW5kbyBDaXB0YSBUZWtub2xvZ2kiLCJuYmYiOjE1MTAyMjY4NDksImV4cCI6MTUxMDI1NDg0OSwiZGF0YSI6eyJzdV9lbWFpbCI6InZlcmlmaWNhdG9yQHguYXBwIn19.IgQE2e1DsrJCqfwD7P85xV6e2Tqb-YCyxruhtSq406-p4iJk12DpB8bNhF52aHMArojwqhcCWlZ5--ntrLDsLA', null, null, null, null, null, '1', '2017-11-09 11:44:08', 'system');

-- ----------------------------
-- Table structure for sys_users_kanban
-- ----------------------------
DROP TABLE IF EXISTS `sys_users_kanban`;
CREATE TABLE `sys_users_kanban` (
  `suk_id` int(11) NOT NULL AUTO_INCREMENT,
  `suk_su_id` int(11) DEFAULT NULL,
  `suk_ks_id` int(11) DEFAULT NULL,
  `suk_selected` int(1) DEFAULT '0',
  PRIMARY KEY (`suk_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_users_kanban
-- ----------------------------
INSERT INTO `sys_users_kanban` VALUES ('26', '7', '16', '0');
INSERT INTO `sys_users_kanban` VALUES ('27', '1', '16', '0');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_users_menus
-- ----------------------------

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_users_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for tasks
-- ----------------------------
DROP TABLE IF EXISTS `tasks`;
CREATE TABLE `tasks` (
  `t_id` int(11) NOT NULL AUTO_INCREMENT,
  `t_type` varchar(255) DEFAULT NULL,
  `t_link` int(11) DEFAULT NULL,
  `t_code` varchar(50) DEFAULT NULL,
  `t_user` int(11) DEFAULT NULL,
  `t_date` datetime DEFAULT NULL,
  `t_read` int(1) DEFAULT '0',
  `t_done` int(1) DEFAULT '0',
  `t_show` int(1) DEFAULT '1',
  `t_drop` int(1) DEFAULT '0',
  PRIMARY KEY (`t_id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tasks
-- ----------------------------
INSERT INTO `tasks` VALUES ('1', 'trip', '1', 'TRP#0052', '10', '2017-11-17 09:18:53', '0', '0', '1', '1');
INSERT INTO `tasks` VALUES ('2', 'trip', '1', 'TRP#0052', '4', '2017-11-17 09:18:54', '1', '1', '1', '1');
INSERT INTO `tasks` VALUES ('3', 'advance', '4', 'ADV#0079', '10', '2017-11-17 09:18:54', '0', '0', '0', '1');
INSERT INTO `tasks` VALUES ('4', 'advance', '4', 'ADV#0079', '4', '2017-11-17 09:18:54', '0', '1', '0', '1');
INSERT INTO `tasks` VALUES ('5', 'advance-finance', '4', 'ADV#0079', '8', '2017-11-17 09:20:56', '1', '1', '1', '1');
INSERT INTO `tasks` VALUES ('6', 'ticket-request', '1', 'TRP#0052', '9', '2017-11-17 09:20:56', '1', '1', '1', '1');
INSERT INTO `tasks` VALUES ('7', 'trip-reschedule', '1', 'TRP#0052', '10', '2017-11-17 09:27:59', '0', '1', '1', '1');
INSERT INTO `tasks` VALUES ('8', 'trip-reschedule', '1', 'TRP#0052', '4', '2017-11-17 09:27:59', '1', '1', '1', '1');
INSERT INTO `tasks` VALUES ('9', 'trip-reschedule', '1', 'TRP#0052', '10', '2017-11-17 10:31:51', '0', '1', '1', '1');
INSERT INTO `tasks` VALUES ('10', 'trip-reschedule', '1', 'TRP#0052', '4', '2017-11-17 10:31:51', '1', '1', '1', '1');
INSERT INTO `tasks` VALUES ('11', 'trip-reschedule', '1', 'TRP#0052', '10', '2017-11-17 10:35:34', '0', '1', '1', '1');
INSERT INTO `tasks` VALUES ('12', 'trip-reschedule', '1', 'TRP#0052', '4', '2017-11-17 10:35:34', '1', '1', '1', '1');
INSERT INTO `tasks` VALUES ('13', 'trip-reschedule', '1', 'TRP#0052', '10', '2017-11-17 10:37:29', '0', '1', '1', '1');
INSERT INTO `tasks` VALUES ('14', 'trip-reschedule', '1', 'TRP#0052', '4', '2017-11-17 10:37:29', '1', '1', '1', '1');
INSERT INTO `tasks` VALUES ('15', 'trip-reschedule', '1', 'TRP#0052', '10', '2017-11-17 10:52:23', '0', '1', '1', '1');
INSERT INTO `tasks` VALUES ('16', 'trip-reschedule', '1', 'TRP#0052', '4', '2017-11-17 10:52:23', '1', '1', '1', '1');
INSERT INTO `tasks` VALUES ('17', 'trip-reschedule', '1', 'TRP#0052', '10', '2017-11-17 11:02:57', '0', '1', '1', '1');
INSERT INTO `tasks` VALUES ('18', 'trip-reschedule', '1', 'TRP#0052', '4', '2017-11-17 11:02:57', '1', '1', '1', '1');
INSERT INTO `tasks` VALUES ('19', 'trip-reschedule', '1', 'TRP#0052', '10', '2017-11-17 11:11:01', '0', '1', '1', '1');
INSERT INTO `tasks` VALUES ('20', 'trip-reschedule', '1', 'TRP#0052', '4', '2017-11-17 11:11:01', '1', '1', '1', '1');
INSERT INTO `tasks` VALUES ('21', 'trip-reschedule', '1', 'TRP#0052', '10', '2017-11-17 11:19:43', '0', '0', '1', '1');
INSERT INTO `tasks` VALUES ('22', 'trip-reschedule', '1', 'TRP#0052', '4', '2017-11-17 11:19:44', '1', '1', '1', '1');
INSERT INTO `tasks` VALUES ('23', 'ticket-reschedule', '1', 'TRP#0052', '9', '2017-11-17 11:32:55', '1', '1', '1', '1');
INSERT INTO `tasks` VALUES ('24', 'trip-reschedule', '1', 'TRP#0052', '10', '2017-11-17 11:51:17', '0', '0', '1', '1');
INSERT INTO `tasks` VALUES ('25', 'trip-reschedule', '1', 'TRP#0052', '4', '2017-11-17 11:51:17', '1', '1', '1', '1');
INSERT INTO `tasks` VALUES ('26', 'ticket-reschedule', '1', 'TRP#0052', '9', '2017-11-17 11:51:52', '1', '1', '1', '1');
INSERT INTO `tasks` VALUES ('27', 'trip', '2', 'TRP#0053', '10', '2017-11-17 12:15:07', '0', '0', '1', '1');
INSERT INTO `tasks` VALUES ('28', 'trip', '2', 'TRP#0053', '4', '2017-11-17 12:15:07', '1', '1', '1', '1');
INSERT INTO `tasks` VALUES ('29', 'ticket-request', '2', 'TRP#0053', '9', '2017-11-17 12:15:46', '1', '1', '1', '1');
INSERT INTO `tasks` VALUES ('30', 'trip-reschedule', '2', 'TRP#0053', '10', '2017-11-17 12:19:30', '0', '0', '1', '1');
INSERT INTO `tasks` VALUES ('31', 'trip-reschedule', '2', 'TRP#0053', '4', '2017-11-17 12:19:30', '1', '1', '1', '1');
INSERT INTO `tasks` VALUES ('32', 'ticket-reschedule', '2', 'TRP#0053', '9', '2017-11-17 12:31:38', '1', '1', '1', '1');
INSERT INTO `tasks` VALUES ('33', 'trip-reschedule', '2', 'TRP#0053', '10', '2017-11-17 12:37:20', '0', '0', '1', '1');
INSERT INTO `tasks` VALUES ('34', 'trip-reschedule', '2', 'TRP#0053', '4', '2017-11-17 12:37:20', '1', '1', '1', '1');
INSERT INTO `tasks` VALUES ('35', 'ticket-reschedule', '2', 'TRP#0053', '9', '2017-11-17 12:38:09', '1', '1', '1', '1');
INSERT INTO `tasks` VALUES ('36', 'trip-reschedule', '2', 'TRP#0053', '10', '2017-11-17 12:39:34', '0', '0', '1', '1');
INSERT INTO `tasks` VALUES ('37', 'trip-reschedule', '2', 'TRP#0053', '4', '2017-11-17 12:39:34', '1', '1', '1', '1');
INSERT INTO `tasks` VALUES ('38', 'ticket-reschedule', '2', 'TRP#0053', '9', '2017-11-17 12:40:00', '1', '1', '1', '1');
INSERT INTO `tasks` VALUES ('39', 'trip', '3', 'TRP#0054', '10', '2017-11-17 12:45:38', '0', '0', '1', '1');
INSERT INTO `tasks` VALUES ('40', 'trip', '3', 'TRP#0054', '4', '2017-11-17 12:45:39', '1', '1', '1', '1');
INSERT INTO `tasks` VALUES ('41', 'ticket-request', '3', 'TRP#0054', '9', '2017-11-17 12:46:02', '1', '1', '1', '1');
INSERT INTO `tasks` VALUES ('50', 'expense-receive', '1', 'EXP#0046', '2', '2017-11-17 22:45:36', '1', '1', '1', '1');
INSERT INTO `tasks` VALUES ('51', 'expense-receive', '2', 'EXP#0047', '2', '2017-11-17 22:45:59', '1', '1', '1', '1');
INSERT INTO `tasks` VALUES ('52', 'expense-finance', '1', 'EXP#0046', '8', '2017-11-18 00:03:48', '0', '0', '1', '0');
INSERT INTO `tasks` VALUES ('53', 'expense-finance', '2', 'EXP#0047', '8', '2017-11-18 00:05:00', '1', '0', '1', '0');
INSERT INTO `tasks` VALUES ('54', 'expense-finance', '1', 'EXP#0046', '8', '2017-11-18 00:08:13', '1', '0', '1', '0');

-- ----------------------------
-- Table structure for trip_history
-- ----------------------------
DROP TABLE IF EXISTS `trip_history`;
CREATE TABLE `trip_history` (
  `trip_history_id` int(10) NOT NULL AUTO_INCREMENT,
  `id_trip` varchar(100) NOT NULL,
  `status_id` int(10) NOT NULL,
  `user_act` int(100) NOT NULL,
  `date` datetime NOT NULL,
  `notes` text,
  PRIMARY KEY (`trip_history_id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of trip_history
-- ----------------------------
INSERT INTO `trip_history` VALUES ('1', '1', '2', '1', '2017-11-17 09:18:53', '');
INSERT INTO `trip_history` VALUES ('2', '1', '4', '4', '2017-11-17 09:20:55', '');
INSERT INTO `trip_history` VALUES ('3', '1', '17', '9', '2017-11-17 09:26:40', '');
INSERT INTO `trip_history` VALUES ('4', '1', '19', '1', '2017-11-17 09:27:59', 'Request for ticket rescheduling');
INSERT INTO `trip_history` VALUES ('5', '1', '19', '1', '2017-11-17 09:30:13', 'Request for ticket rescheduling');
INSERT INTO `trip_history` VALUES ('6', '1', '17', '4', '2017-11-17 10:24:28', 'NOT WORTHED');
INSERT INTO `trip_history` VALUES ('7', '1', '19', '1', '2017-11-17 10:31:51', 'Request for ticket rescheduling');
INSERT INTO `trip_history` VALUES ('8', '1', '20', '4', '2017-11-17 10:33:03', 'Bad request');
INSERT INTO `trip_history` VALUES ('9', '1', '19', '1', '2017-11-17 10:35:34', 'Request for ticket rescheduling');
INSERT INTO `trip_history` VALUES ('10', '1', '20', '4', '2017-11-17 10:35:59', 'Bad request');
INSERT INTO `trip_history` VALUES ('11', '1', '19', '1', '2017-11-17 10:37:29', 'Request for ticket rescheduling');
INSERT INTO `trip_history` VALUES ('12', '1', '22', '4', '2017-11-17 10:50:51', 'Bad date');
INSERT INTO `trip_history` VALUES ('13', '1', '19', '1', '2017-11-17 10:52:23', 'Request for ticket rescheduling');
INSERT INTO `trip_history` VALUES ('14', '1', '22', '4', '2017-11-17 10:53:13', 'Mundurin');
INSERT INTO `trip_history` VALUES ('15', '1', '19', '1', '2017-11-17 11:02:56', 'Request for ticket rescheduling');
INSERT INTO `trip_history` VALUES ('16', '1', '20', '4', '2017-11-17 11:10:33', 'Bad');
INSERT INTO `trip_history` VALUES ('17', '1', '19', '1', '2017-11-17 11:11:01', 'Request for ticket rescheduling');
INSERT INTO `trip_history` VALUES ('18', '1', '22', '4', '2017-11-17 11:13:01', 'update please');
INSERT INTO `trip_history` VALUES ('19', '1', '19', '1', '2017-11-17 11:19:43', 'Request for ticket rescheduling');
INSERT INTO `trip_history` VALUES ('20', '1', '21', '4', '2017-11-17 11:32:55', 'FORWARD TO TICKETING');
INSERT INTO `trip_history` VALUES ('21', '1', '17', '9', '2017-11-17 11:50:44', 'Reschedule not accepted and ticket(s) have been rollback');
INSERT INTO `trip_history` VALUES ('22', '1', '19', '1', '2017-11-17 11:51:16', 'Request for ticket rescheduling');
INSERT INTO `trip_history` VALUES ('23', '1', '21', '4', '2017-11-17 11:51:52', 'OK');
INSERT INTO `trip_history` VALUES ('24', '1', '17', '9', '2017-11-17 11:54:12', '');
INSERT INTO `trip_history` VALUES ('25', '2', '2', '1', '2017-11-17 12:15:07', '');
INSERT INTO `trip_history` VALUES ('26', '2', '4', '4', '2017-11-17 12:15:46', '');
INSERT INTO `trip_history` VALUES ('27', '2', '17', '9', '2017-11-17 12:18:06', '');
INSERT INTO `trip_history` VALUES ('28', '2', '19', '1', '2017-11-17 12:19:30', 'Request for ticket rescheduling');
INSERT INTO `trip_history` VALUES ('29', '2', '21', '4', '2017-11-17 12:31:38', '');
INSERT INTO `trip_history` VALUES ('30', '2', '17', '9', '2017-11-17 12:36:37', '');
INSERT INTO `trip_history` VALUES ('31', '2', '19', '1', '2017-11-17 12:37:20', 'Request for ticket rescheduling');
INSERT INTO `trip_history` VALUES ('32', '2', '21', '4', '2017-11-17 12:38:09', '');
INSERT INTO `trip_history` VALUES ('33', '2', '17', '9', '2017-11-17 12:38:59', 'Reschedule not accepted and ticket(s) have been rollback');
INSERT INTO `trip_history` VALUES ('34', '2', '19', '1', '2017-11-17 12:39:34', 'Request for ticket rescheduling');
INSERT INTO `trip_history` VALUES ('35', '2', '21', '4', '2017-11-17 12:39:59', '');
INSERT INTO `trip_history` VALUES ('36', '2', '17', '9', '2017-11-17 12:40:35', '');
INSERT INTO `trip_history` VALUES ('37', '3', '2', '1', '2017-11-17 12:45:38', '');
INSERT INTO `trip_history` VALUES ('38', '3', '4', '4', '2017-11-17 12:46:02', '');
INSERT INTO `trip_history` VALUES ('39', '3', '17', '9', '2017-11-17 12:52:47', '');

-- ----------------------------
-- Table structure for trip_item
-- ----------------------------
DROP TABLE IF EXISTS `trip_item`;
CREATE TABLE `trip_item` (
  `trip_item_id` int(10) NOT NULL AUTO_INCREMENT,
  `id_trip` int(10) NOT NULL,
  `departure_date` date DEFAULT NULL,
  `origin` varchar(100) DEFAULT NULL,
  `destination` varchar(100) DEFAULT NULL,
  `transport` int(1) DEFAULT '1',
  `transport_operator` varchar(100) DEFAULT NULL,
  `transport_departure_time` varchar(30) DEFAULT NULL,
  `transport_prices` double(15,2) DEFAULT '0.00',
  `attachment` varchar(255) DEFAULT NULL,
  `visa` int(1) DEFAULT '0',
  `special_request` text,
  `status` int(1) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`trip_item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of trip_item
-- ----------------------------
INSERT INTO `trip_item` VALUES ('1', '1', '2017-11-17', 'Jakarta', 'Bandung', '1', 'GA 400', '08:00', '1500000.00', 'ticket_1_171117115235.jpeg', '0', null, '3', '2017-11-17 09:17:07', '1', '2017-11-17 11:52:34', '9');
INSERT INTO `trip_item` VALUES ('2', '1', '2017-11-17', 'Bandung', 'Jakarta', '1', null, null, '0.00', null, '0', null, '6', '2017-11-17 09:17:16', '1', null, null);
INSERT INTO `trip_item` VALUES ('3', '2', '2017-11-17', 'Jakarta', 'Semarang', '1', 'GA 300', '08:00', '500000.00', null, '0', null, '3', '2017-11-17 12:14:52', '1', '2017-11-17 12:36:18', '9');
INSERT INTO `trip_item` VALUES ('4', '2', '2017-11-18', 'Semarang', 'Jakarta', '1', 'GA 200', '10:00', '750000.00', 'ticket_4_171117124030.jpeg', '0', null, '3', '2017-11-17 12:15:03', '1', '2017-11-17 12:40:29', '9');
INSERT INTO `trip_item` VALUES ('5', '3', '2017-11-17', 'Jakarta', 'Bandung', '1', 'Ga 400', '10:00', '600000.00', 'ticket_5_171117125227.jpeg', '0', null, '1', '2017-11-17 12:45:36', '1', '2017-11-17 12:52:34', '9');

-- ----------------------------
-- Table structure for trip_item_history
-- ----------------------------
DROP TABLE IF EXISTS `trip_item_history`;
CREATE TABLE `trip_item_history` (
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime DEFAULT NULL,
  `trip_item_id` int(10) NOT NULL,
  `id_trip` int(10) NOT NULL,
  `departure_date` date DEFAULT NULL,
  `origin` varchar(100) DEFAULT NULL,
  `destination` varchar(100) DEFAULT NULL,
  `transport` int(1) DEFAULT '1',
  `transport_operator` varchar(100) DEFAULT NULL,
  `transport_departure_time` varchar(30) DEFAULT NULL,
  `transport_prices` double(15,2) DEFAULT '0.00',
  `attachment` varchar(255) DEFAULT NULL,
  `visa` int(1) DEFAULT '0',
  `special_request` text,
  `status` int(1) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`history_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of trip_item_history
-- ----------------------------
INSERT INTO `trip_item_history` VALUES ('9', '2017-11-17 11:51:16', '1', '1', '2017-11-18', 'Jakarta', 'Bandung', '1', 'GA 232', '10:45', '750000.00', 'ticket_1.jpeg', '0', null, '5', '2017-11-17 09:17:07', '1', '2017-11-17 09:23:00', '9');
INSERT INTO `trip_item_history` VALUES ('10', '2017-11-17 12:19:29', '3', '2', '2017-11-17', 'Jakarta', 'Semarang', '1', 'GA 300', '08:00', '500000.00', null, '0', null, '5', '2017-11-17 12:14:52', '1', '2017-11-17 12:17:31', '9');
INSERT INTO `trip_item_history` VALUES ('12', '2017-11-17 12:39:34', '4', '2', '2017-11-18', 'Semarang', 'Jakarta', '1', 'GA 200', '10:00', '750000.00', null, '0', null, '5', '2017-11-17 12:15:03', '1', '2017-11-17 12:17:47', '9');

-- ----------------------------
-- Table structure for trip_table
-- ----------------------------
DROP TABLE IF EXISTS `trip_table`;
CREATE TABLE `trip_table` (
  `id_trip` int(11) NOT NULL AUTO_INCREMENT,
  `trip_no` varchar(50) NOT NULL,
  `subject_trip` varchar(150) NOT NULL,
  `date` datetime NOT NULL,
  `type` int(11) DEFAULT NULL,
  `purpose` int(11) DEFAULT NULL,
  `other_purpose` text,
  `identity_no` varchar(100) DEFAULT NULL,
  `travel_type` int(1) DEFAULT NULL,
  `attachment` text,
  `id_user` int(11) NOT NULL,
  `received_by` varchar(50) DEFAULT NULL,
  `received_date` datetime DEFAULT NULL,
  `date_end` date NOT NULL,
  `date_start` date NOT NULL,
  `status` int(11) NOT NULL,
  `ticket_status` int(11) DEFAULT '0',
  `adv_ref` int(10) DEFAULT NULL,
  `amounts` double(15,2) DEFAULT '0.00',
  `phone_no` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_trip`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of trip_table
-- ----------------------------
INSERT INTO `trip_table` VALUES ('1', 'TRP#0052', 'Trip Bandung', '2017-11-17 09:16:56', '1', '7', null, '-', '1', null, '1', null, null, '2017-11-18', '2017-11-17', '17', '4', '4', '0.00', null);
INSERT INTO `trip_table` VALUES ('2', 'TRP#0053', 'Trip Semarang', '2017-11-17 12:14:42', '1', '8', null, '-', '1', null, '1', null, null, '2017-11-18', '2017-11-17', '17', '4', null, '0.00', null);
INSERT INTO `trip_table` VALUES ('3', 'TRP#0054', 'Trap Trip', '2017-11-17 12:45:25', '1', '7', null, '-', '1', null, '1', null, null, '2017-11-18', '2017-11-17', '17', '1', null, '0.00', null);
