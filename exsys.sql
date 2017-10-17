/*
Navicat MySQL Data Transfer

Source Server         : mysql@go.vm
Source Server Version : 50554
Source Host           : 192.168.56.5:3306
Source Database       : exsys

Target Server Type    : MYSQL
Target Server Version : 50554
File Encoding         : 65001

Date: 2017-10-15 12:26:29
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for advance_history
-- ----------------------------
DROP TABLE IF EXISTS `advance_history`;
CREATE TABLE `advance_history` (
  `adv_history_id` int(10) NOT NULL AUTO_INCREMENT,
  `id_adv` varchar(100) NOT NULL,
  `status_id` int(10) NOT NULL,
  `user_act` int(100) NOT NULL,
  `date` datetime NOT NULL,
  `notes` text,
  PRIMARY KEY (`adv_history_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of advance_history
-- ----------------------------
INSERT INTO `advance_history` VALUES ('1', '2', '9', '2', '2017-10-13 22:31:27', 'sudah oke');
INSERT INTO `advance_history` VALUES ('2', '2', '3', '3', '2017-10-14 10:32:57', null);
INSERT INTO `advance_history` VALUES ('5', '1', '2', '1', '2017-10-14 19:01:17', null);
INSERT INTO `advance_history` VALUES ('6', '5', '2', '1', '2017-10-14 19:05:55', null);
INSERT INTO `advance_history` VALUES ('7', '6', '2', '1', '2017-10-14 19:05:57', null);
INSERT INTO `advance_history` VALUES ('8', '7', '2', '1', '2017-10-14 19:05:59', null);
INSERT INTO `advance_history` VALUES ('12', '9', '2', '1', '2017-10-14 21:15:10', null);
INSERT INTO `advance_history` VALUES ('13', '8', '2', '1', '2017-10-14 21:16:22', null);

-- ----------------------------
-- Table structure for advance_item
-- ----------------------------
DROP TABLE IF EXISTS `advance_item`;
CREATE TABLE `advance_item` (
  `advance_item_id` int(10) NOT NULL AUTO_INCREMENT,
  `id_adv` int(10) NOT NULL,
  `description` varchar(255) NOT NULL,
  `currency_id` int(10) NOT NULL,
  `amounts` double(15,0) NOT NULL,
  PRIMARY KEY (`advance_item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of advance_item
-- ----------------------------
INSERT INTO `advance_item` VALUES ('1', '1', 'A', '1', '1999');
INSERT INTO `advance_item` VALUES ('3', '7', 'asdasd', '1', '2123');
INSERT INTO `advance_item` VALUES ('4', '2', 'beli gazebo', '1', '1000000');
INSERT INTO `advance_item` VALUES ('5', '2', 'sewa tenda', '1', '250000');
INSERT INTO `advance_item` VALUES ('6', '9', 'A', '1', '56000');
INSERT INTO `advance_item` VALUES ('7', '8', 'A', '1', '562222');

-- ----------------------------
-- Table structure for advance_table
-- ----------------------------
DROP TABLE IF EXISTS `advance_table`;
CREATE TABLE `advance_table` (
  `id_adv` int(11) NOT NULL AUTO_INCREMENT,
  `adv_no` varchar(50) NOT NULL,
  `subject_adv` varchar(150) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `type` int(11) NOT NULL,
  `purpose` int(11) NOT NULL,
  `other_purpose` text,
  `attachment` text,
  `id_user` int(11) NOT NULL,
  `received_by` varchar(50) DEFAULT NULL,
  `received_date` datetime DEFAULT NULL,
  `date_end` date NOT NULL,
  `date_start` date NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id_adv`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of advance_table
-- ----------------------------
INSERT INTO `advance_table` VALUES ('1', 'ADV#0001', 'kegiatan1', '2017-10-14 18:27:28', '1', '8', null, 'form_start.html', '0', null, null, '2017-10-12', '2017-10-14', '2');
INSERT INTO `advance_table` VALUES ('2', 'ADV#0002', 'kegiatan2', '2017-10-14 18:27:32', '3', '10', null, null, '0', null, null, '2017-10-14', '2017-10-15', '3');
INSERT INTO `advance_table` VALUES ('5', 'ADV#0003', 'Hello', '2017-10-14 18:27:35', '3', '10', null, null, '1', null, null, '2017-10-16', '2017-10-15', '2');
INSERT INTO `advance_table` VALUES ('6', 'ADV#0004', 'asas', '2017-10-14 18:27:39', '3', '12', null, null, '1', null, null, '2017-10-21', '2017-10-14', '2');
INSERT INTO `advance_table` VALUES ('7', 'ADV#0005', 'asdasd', '2017-10-14 18:27:43', '3', '13', null, null, '1', null, null, '2017-10-28', '2017-10-21', '2');
INSERT INTO `advance_table` VALUES ('8', 'ADV#0006', 'No Items', '2017-10-14 19:07:13', '3', '11', null, null, '1', null, null, '2017-10-16', '2017-10-15', '2');
INSERT INTO `advance_table` VALUES ('9', 'ADV#0007', 'Has Items', '2017-10-14 21:14:31', '4', '16', null, null, '1', null, null, '2017-10-16', '2017-10-15', '2');

-- ----------------------------
-- Table structure for advance_task
-- ----------------------------
DROP TABLE IF EXISTS `advance_task`;
CREATE TABLE `advance_task` (
  `adv_task_id` int(10) NOT NULL AUTO_INCREMENT,
  `id_adv` int(10) NOT NULL,
  `su_id` int(10) NOT NULL,
  `grade_id` int(10) NOT NULL,
  `is_allowed` int(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`adv_task_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of advance_task
-- ----------------------------
INSERT INTO `advance_task` VALUES ('1', '9', '3', '23', '1');
INSERT INTO `advance_task` VALUES ('2', '9', '4', '29', '1');
INSERT INTO `advance_task` VALUES ('3', '8', '3', '23', '1');
INSERT INTO `advance_task` VALUES ('4', '8', '4', '29', '1');

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
-- Table structure for example_1
-- ----------------------------
DROP TABLE IF EXISTS `example_1`;
CREATE TABLE `example_1` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `fullname` varchar(255) DEFAULT NULL,
  `sex` int(1) DEFAULT NULL,
  `admin` int(1) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `points` double(15,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of example_1
-- ----------------------------

-- ----------------------------
-- Table structure for example_2
-- ----------------------------
DROP TABLE IF EXISTS `example_2`;
CREATE TABLE `example_2` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of example_2
-- ----------------------------

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
  PRIMARY KEY (`item_form_id`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of item_form_table
-- ----------------------------
INSERT INTO `item_form_table` VALUES ('1', 'Jenis Tiket', 'radio', 'number', '[{\"text\":\"Tiket Pesawat\", \"value\":1}, {\"text\":\"Tiket Kereta\", \"value\":2}]', '0', '1');
INSERT INTO `item_form_table` VALUES ('2', 'Tujuan', 'text', 'string', '', '1', '1');
INSERT INTO `item_form_table` VALUES ('3', 'Tanggal Keberangkatan', 'datepicker', 'date', '', '2', '1');
INSERT INTO `item_form_table` VALUES ('4', 'Tanggal Tiba', 'datepicker', 'date', '', '3', '1');
INSERT INTO `item_form_table` VALUES ('5', 'Nilai Tiket', 'text', 'number', '', '4', '1');
INSERT INTO `item_form_table` VALUES ('6', 'Cash / Credit Card', 'radio', 'number', '[{\"text\":\"Cash\", \"value\":1},{\"text\":\"Credit Card\", \"value\":2}]', '5', '1');
INSERT INTO `item_form_table` VALUES ('7', 'Currency', 'currency', 'number', '', '6', '1');
INSERT INTO `item_form_table` VALUES ('8', 'Start Date Kost', 'datepicker', 'date', '', '0', '74');
INSERT INTO `item_form_table` VALUES ('9', 'End Date Kost', 'datepicker', 'date', '', '1', '74');
INSERT INTO `item_form_table` VALUES ('10', 'Lokasi', 'text', 'string', '', '2', '74');
INSERT INTO `item_form_table` VALUES ('11', 'Nominal', 'text', 'number', '', '3', '74');
INSERT INTO `item_form_table` VALUES ('12', 'Cash / Credit Card', 'radio', 'number', '[{\"text\":\"Cash\", \"value\":1},{\"text\":\"Credit Card\", \"value\":2}]', '4', '74');
INSERT INTO `item_form_table` VALUES ('13', 'Currency', 'currency', 'number', '', '5', '74');
INSERT INTO `item_form_table` VALUES ('14', 'Nilai', 'text', 'number', '', '0', '76');
INSERT INTO `item_form_table` VALUES ('15', 'Keterangan', 'text', 'string', '', '1', '76');
INSERT INTO `item_form_table` VALUES ('16', 'Nilai', 'text', 'number', '', '0', '77');
INSERT INTO `item_form_table` VALUES ('17', 'Keterangan', 'text', 'string', '', '1', '77');
INSERT INTO `item_form_table` VALUES ('18', 'Nilai', 'text', 'number', '', '0', '78');
INSERT INTO `item_form_table` VALUES ('19', 'Keterangan', 'text', 'string', '', '1', '78');
INSERT INTO `item_form_table` VALUES ('20', 'Nilai', 'text', 'number', null, '0', '80');
INSERT INTO `item_form_table` VALUES ('21', 'Keterangan', 'text', 'string', null, '1', '80');
INSERT INTO `item_form_table` VALUES ('22', 'Tanggal pengisian', 'datepicker', 'date', null, '0', '82');
INSERT INTO `item_form_table` VALUES ('23', 'Jenis BBM', 'dropdown', 'string', '[{\"text\":\"Premium\", \"value\":1},{\"text\":\"Pertalite\", \"value\":2},{\"text\":\"Pertamax\", \"value\":3},{\"text\":\"Solar\", \"value\":4}]', '1', '82');
INSERT INTO `item_form_table` VALUES ('24', 'KM pengisian', 'text', 'number', null, '2', '82');
INSERT INTO `item_form_table` VALUES ('25', 'Nilai BBM', 'text', 'number', null, '3', '82');
INSERT INTO `item_form_table` VALUES ('26', 'Nomer Polisi', 'text', 'string', null, '4', '82');
INSERT INTO `item_form_table` VALUES ('27', 'Cash / Credit Card', 'radio', 'number', '[{\"text\":\"Cash\", \"value\":1},{\"text\":\"Credit Card\", \"value\":2}]', '5', '82');
INSERT INTO `item_form_table` VALUES ('28', 'Currency', 'currency', 'number', null, '6', '82');
INSERT INTO `item_form_table` VALUES ('29', 'Tanggal', 'datepicker', 'date', null, '0', '83');
INSERT INTO `item_form_table` VALUES ('30', 'KM awal', 'text', 'number', null, '1', '83');
INSERT INTO `item_form_table` VALUES ('31', 'KM akhir', 'text', 'number', null, '2', '83');
INSERT INTO `item_form_table` VALUES ('32', 'Nilai', 'text', 'number', null, '3', '83');
INSERT INTO `item_form_table` VALUES ('33', 'Cash / Credit Card', 'radio', 'number', '[{\"text\":\"Cash\", \"value\":1},{\"text\":\"Credit Card\", \"value\":2}]', '4', '83');
INSERT INTO `item_form_table` VALUES ('34', 'Currency', 'currency', 'number', null, '5', '83');
INSERT INTO `item_form_table` VALUES ('35', 'Tanggal', 'datepicker', 'date', null, '0', '3');
INSERT INTO `item_form_table` VALUES ('36', 'Tujuan', 'text', 'string', null, '1', '3');
INSERT INTO `item_form_table` VALUES ('37', 'Nilai', 'text', 'number', null, '2', '3');
INSERT INTO `item_form_table` VALUES ('38', 'Cash / Credit Card', 'radio', 'number', '[{\"text\":\"Cash\", \"value\":1},{\"text\":\"Credit Card\", \"value\":2}]', '3', '3');
INSERT INTO `item_form_table` VALUES ('39', 'Currency', 'currency', 'number', null, '4', '3');
INSERT INTO `item_form_table` VALUES ('40', 'Tanggal', 'datepicker', 'date', null, '0', '4');
INSERT INTO `item_form_table` VALUES ('41', 'Lokasi', 'text', 'string', null, '1', '4');
INSERT INTO `item_form_table` VALUES ('42', 'Nilai', 'text', 'number', null, '2', '4');
INSERT INTO `item_form_table` VALUES ('43', 'Cash/Credit Card', 'radio', 'number', '[{\"text\":\"Cash\", \"value\":1},{\"text\":\"Credit Card\", \"value\":2}]', '3', '4');
INSERT INTO `item_form_table` VALUES ('44', 'Currency', 'currency', 'number', null, '4', '4');
INSERT INTO `item_form_table` VALUES ('45', 'Tanggal', 'datepicker', 'date', null, '0', '5');
INSERT INTO `item_form_table` VALUES ('46', 'Tujuan', 'text', 'string', null, '1', '5');
INSERT INTO `item_form_table` VALUES ('47', 'Nilai', 'text', 'number', null, '2', '5');
INSERT INTO `item_form_table` VALUES ('48', 'Cash/Credit Card', 'radio', 'number', '[{\"text\":\"Cash\", \"value\":1},{\"text\":\"Credit Card\", \"value\":2}]', '3', '5');
INSERT INTO `item_form_table` VALUES ('49', 'Currency', 'currency', 'number', null, '4', '5');
INSERT INTO `item_form_table` VALUES ('50', 'Start Date Sewa', 'datepicker', 'date', null, '0', '6');
INSERT INTO `item_form_table` VALUES ('51', 'Start Date Sewa', 'datepicker', 'date', null, '0', '6');
INSERT INTO `item_form_table` VALUES ('52', 'End Date Sewa', 'datepicker', 'date', null, '1', '6');
INSERT INTO `item_form_table` VALUES ('53', 'End Date Sewa', 'datepicker', 'date', null, '1', '6');
INSERT INTO `item_form_table` VALUES ('54', 'Nomer polisi', 'text', 'string', null, '2', '6');
INSERT INTO `item_form_table` VALUES ('55', 'Nomer polisi', 'text', 'string', null, '2', '6');
INSERT INTO `item_form_table` VALUES ('56', 'Nilai', 'text', 'number', null, '3', '6');
INSERT INTO `item_form_table` VALUES ('57', 'Nilai', 'text', 'number', null, '3', '6');
INSERT INTO `item_form_table` VALUES ('58', 'Cash/Credit Card', 'radio', 'number', '[{\"text\":\"Cash\", \"value\":1},{\"text\":\"Credit Card\", \"value\":2}]', '4', '6');
INSERT INTO `item_form_table` VALUES ('59', 'Cash/Credit Card', 'radio', 'number', '[{\"text\":\"Cash\", \"value\":1},{\"text\":\"Credit Card\", \"value\":2}]', '4', '6');
INSERT INTO `item_form_table` VALUES ('60', 'Currency', 'currency', 'number', null, '5', '6');
INSERT INTO `item_form_table` VALUES ('61', 'Currency', 'currency', 'number', null, '5', '6');
INSERT INTO `item_form_table` VALUES ('62', 'Remark', 'text', 'string', null, '7', '82');
INSERT INTO `item_form_table` VALUES ('63', 'Remark', 'text', 'string', null, '6', '83');
INSERT INTO `item_form_table` VALUES ('64', 'Tanggal', 'datepicker', 'date', null, '0', '7');
INSERT INTO `item_form_table` VALUES ('65', 'Tujuan', 'text', 'string', null, '1', '7');
INSERT INTO `item_form_table` VALUES ('66', 'Nilai', 'text', 'number', null, '2', '7');
INSERT INTO `item_form_table` VALUES ('67', 'Nomer polisi', 'text', 'string', null, '3', '7');
INSERT INTO `item_form_table` VALUES ('68', 'Cash/Credit Card', 'radio', 'string', '[{\"text\":\"Cash\", \"value\":1},{\"text\":\"Credit Card\", \"value\":2}]', '4', '7');
INSERT INTO `item_form_table` VALUES ('69', 'Currency', 'currency', 'number', null, '5', '7');
INSERT INTO `item_form_table` VALUES ('70', 'Tanggal', 'datepicker', 'date', null, '0', '8');
INSERT INTO `item_form_table` VALUES ('71', 'Tujuan', 'text', 'string', null, '1', '8');
INSERT INTO `item_form_table` VALUES ('72', 'Nilai', 'text', 'number', null, '2', '8');
INSERT INTO `item_form_table` VALUES ('73', 'Cash/Credit Card', 'radio', 'string', '[{\"text\":\"Cash\", \"value\":1},{\"text\":\"Credit Card\", \"value\":2}]', '3', '8');
INSERT INTO `item_form_table` VALUES ('74', 'Currency', 'currency', 'number', null, '4', '8');
INSERT INTO `item_form_table` VALUES ('75', 'Tanggal', 'datepicker', 'date', null, '0', '10');
INSERT INTO `item_form_table` VALUES ('76', 'Nama hotel', 'text', 'string', null, '1', '10');
INSERT INTO `item_form_table` VALUES ('77', 'Nilai', 'text', 'number', null, '2', '10');
INSERT INTO `item_form_table` VALUES ('78', 'Tanggal check in', 'datepicker', 'date', null, '3', '10');
INSERT INTO `item_form_table` VALUES ('79', 'Tanggal check out', 'datepicker', 'date', null, '4', '10');
INSERT INTO `item_form_table` VALUES ('80', 'Cash/Credit Card', 'radio', 'string', '[{\"text\":\"Cash\", \"value\":1},{\"text\":\"Credit Card\", \"value\":2}]', '5', '10');
INSERT INTO `item_form_table` VALUES ('81', 'Currency', 'currency', 'number', null, '6', '10');
INSERT INTO `item_form_table` VALUES ('82', 'Tanggal', 'datepicker', 'date', null, '0', '11');
INSERT INTO `item_form_table` VALUES ('83', 'Tujuan', 'text', 'string', null, '1', '11');
INSERT INTO `item_form_table` VALUES ('84', 'Nilai', 'text', 'number', null, '2', '11');
INSERT INTO `item_form_table` VALUES ('85', 'Cash/Credit Card', 'radio', 'string', '[{\"text\":\"Cash\", \"value\":1},{\"text\":\"Credit Card\", \"value\":2}]', '3', '11');
INSERT INTO `item_form_table` VALUES ('86', 'Currency', 'currency', 'number', null, '4', '11');

-- ----------------------------
-- Table structure for item_table
-- ----------------------------
DROP TABLE IF EXISTS `item_table`;
CREATE TABLE `item_table` (
  `item_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `item_name` varchar(100) NOT NULL,
  `parent_id` varchar(100) DEFAULT NULL,
  `coa` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of item_table
-- ----------------------------
INSERT INTO `item_table` VALUES ('1', 'Travelling Domestic - Air, Train, Bus, Travel, or Other Tickets', null, '613101');
INSERT INTO `item_table` VALUES ('2', 'Travelling Domestic - Taxi, Parking, Toll and other transport', null, '613103');
INSERT INTO `item_table` VALUES ('3', 'Taxi', '2', '613103');
INSERT INTO `item_table` VALUES ('4', 'Parkir', '2', '613103');
INSERT INTO `item_table` VALUES ('5', 'Toll', '2', '613103');
INSERT INTO `item_table` VALUES ('6', 'Sewa Motor Harian / Bulanan\r', '2', '613103');
INSERT INTO `item_table` VALUES ('7', 'Sewa Mobil (Traveling)', '2', '613103');
INSERT INTO `item_table` VALUES ('8', 'Ojek', '2', '613103');
INSERT INTO `item_table` VALUES ('9', 'Travelling Domestic - Hotels and Other Accomodation', null, '613104');
INSERT INTO `item_table` VALUES ('10', 'Hotel', '9', '613104');
INSERT INTO `item_table` VALUES ('11', 'Laundry', '9', '613104');
INSERT INTO `item_table` VALUES ('12', 'Travelling Domestic - Meals, Food, and Beverage', null, '613105');
INSERT INTO `item_table` VALUES ('13', 'Meals', '12', '613105');
INSERT INTO `item_table` VALUES ('14', 'Travelling Domestic - Other Expense related to Travelling', null, '613199');
INSERT INTO `item_table` VALUES ('15', 'Free Supir', '14', '613199');
INSERT INTO `item_table` VALUES ('16', 'Travelling Overseas - Air, Train, Bus, Travel, or Other Tickets', null, '613201');
INSERT INTO `item_table` VALUES ('17', 'Tiket Travell', '16', '613201');
INSERT INTO `item_table` VALUES ('18', 'Tiket Bis', '16', '613201');
INSERT INTO `item_table` VALUES ('19', 'Tiket Kereta', '16', '613201');
INSERT INTO `item_table` VALUES ('20', 'Tiket Kapal Laut', '16', '613201');
INSERT INTO `item_table` VALUES ('21', 'Tiket Pesawat', '16', '613201');
INSERT INTO `item_table` VALUES ('22', 'Travelling Overseas - Taxi, Parking, Toll and other transpor', null, '613202');
INSERT INTO `item_table` VALUES ('23', 'Taxi', '22', '613202');
INSERT INTO `item_table` VALUES ('24', 'Parkir', '22', '613202');
INSERT INTO `item_table` VALUES ('25', 'Toll', '22', '613202');
INSERT INTO `item_table` VALUES ('26', 'Travelling Overseas - Hotels and Other Accomodation', null, '613203');
INSERT INTO `item_table` VALUES ('27', 'Hotel', '26', '613203');
INSERT INTO `item_table` VALUES ('28', 'Laundry', '26', '613203');
INSERT INTO `item_table` VALUES ('29', 'Travelling Overseas - Meals, Food, and Beverage', null, '613204');
INSERT INTO `item_table` VALUES ('30', 'Meals', '29', '613204');
INSERT INTO `item_table` VALUES ('31', 'Travelling Overseas - Other Expense related to Travelling', null, '613299');
INSERT INTO `item_table` VALUES ('32', 'VISA', '31', '613299');
INSERT INTO `item_table` VALUES ('33', 'Travel Insurance', '31', '613299');
INSERT INTO `item_table` VALUES ('34', 'Farm Field Days', null, '614301');
INSERT INTO `item_table` VALUES ('35', 'FFD', '34', '614301');
INSERT INTO `item_table` VALUES ('36', 'Banner', '34', '614301');
INSERT INTO `item_table` VALUES ('37', 'Spanduk', '34', '614301');
INSERT INTO `item_table` VALUES ('38', 'Poster', '34', '614301');
INSERT INTO `item_table` VALUES ('39', 'Photo  copy undangan', '34', '614301');
INSERT INTO `item_table` VALUES ('40', 'Counseling Activity', null, '614302');
INSERT INTO `item_table` VALUES ('41', 'Counseling (Konsumasi)', '40', '614302');
INSERT INTO `item_table` VALUES ('42', 'Photo  copy undangan', '40', '614302');
INSERT INTO `item_table` VALUES ('43', 'Comparative Study', null, '614303');
INSERT INTO `item_table` VALUES ('44', 'Study Banding', '43', '614303');
INSERT INTO `item_table` VALUES ('45', 'Spanduk', '43', '614303');
INSERT INTO `item_table` VALUES ('46', 'Poster', '43', '614303');
INSERT INTO `item_table` VALUES ('47', 'Photo  copy undangan', '43', '614303');
INSERT INTO `item_table` VALUES ('48', 'Clinical Seed (Others)', null, '614306');
INSERT INTO `item_table` VALUES ('49', 'Konsumsi (Biasanya di Dealer)', '48', '614306');
INSERT INTO `item_table` VALUES ('50', 'Other Sales Activity Promotion Expense (Others)', null, '614399');
INSERT INTO `item_table` VALUES ('51', 'Gathering Dg Dealer', '50', '614399');
INSERT INTO `item_table` VALUES ('52', 'Meeting dg Bandar', '50', '614399');
INSERT INTO `item_table` VALUES ('53', 'Expense for Mobile Telephony', null, '617101');
INSERT INTO `item_table` VALUES ('54', 'Pulsa Telephone', '53', '617101');
INSERT INTO `item_table` VALUES ('55', 'Office Supplier', null, '619301');
INSERT INTO `item_table` VALUES ('56', 'Stationary (Buku, Ballpoint, Kertas, tipe X, Cutter, Tonner, Batu baterai,Kalkulator)', '55', '619301');
INSERT INTO `item_table` VALUES ('57', 'Printing and Photocopying', null, '619401');
INSERT INTO `item_table` VALUES ('58', 'Print', '57', '619401');
INSERT INTO `item_table` VALUES ('59', 'Photo copy', '57', '619401');
INSERT INTO `item_table` VALUES ('60', 'Scann', '57', '619401');
INSERT INTO `item_table` VALUES ('61', 'Laminating', '57', '619401');
INSERT INTO `item_table` VALUES ('62', 'Couriers', null, '619403');
INSERT INTO `item_table` VALUES ('63', 'Kirim Dokumen', '62', '619403');
INSERT INTO `item_table` VALUES ('64', 'Stamp Duty (Others)', null, '619405');
INSERT INTO `item_table` VALUES ('65', 'Materai', '64', '619405');
INSERT INTO `item_table` VALUES ('66', 'External Meeting & Entertainment', null, '620203');
INSERT INTO `item_table` VALUES ('67', 'Pertemuan Petani (Produksi)', '66', '620203');
INSERT INTO `item_table` VALUES ('68', 'Tiket Travell', '1', '613101');
INSERT INTO `item_table` VALUES ('69', 'Tiket Bis', '1', '613101');
INSERT INTO `item_table` VALUES ('70', 'Tiket Kereta', '1', '613101');
INSERT INTO `item_table` VALUES ('71', 'Tiket Kapal  Laut', '1', '613101');
INSERT INTO `item_table` VALUES ('72', 'Tiket Pesawat', '1', '613101');
INSERT INTO `item_table` VALUES ('73', 'Housing Rent - Staff', null, '611415');
INSERT INTO `item_table` VALUES ('74', 'Kost', '73', '611415');
INSERT INTO `item_table` VALUES ('75', 'Relocation Expense Claim - Staff', null, '611416');
INSERT INTO `item_table` VALUES ('76', 'Kirim Barang', '75', '611416');
INSERT INTO `item_table` VALUES ('77', 'Pindahan Sekolah Anak', '75', '611416');
INSERT INTO `item_table` VALUES ('78', 'Transportasi', '75', '611416');
INSERT INTO `item_table` VALUES ('79', 'Other personnel related cost (Others)', null, '611699');
INSERT INTO `item_table` VALUES ('80', 'Uang Suka/Duka', '79', '611699');
INSERT INTO `item_table` VALUES ('81', 'Travelling Domestic - Gasoline', null, '613102');
INSERT INTO `item_table` VALUES ('82', 'BBM', '81', '613102');
INSERT INTO `item_table` VALUES ('83', 'BBM Per KM', '81', '613102');

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
-- Table structure for master_currency
-- ----------------------------
DROP TABLE IF EXISTS `master_currency`;
CREATE TABLE `master_currency` (
  `currency_id` int(10) NOT NULL AUTO_INCREMENT,
  `currency_name` varchar(100) DEFAULT NULL,
  `currency_code` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`currency_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of master_currency
-- ----------------------------
INSERT INTO `master_currency` VALUES ('1', 'Rupiah', 'IDR');
INSERT INTO `master_currency` VALUES ('2', 'US Dollar', 'USD');
INSERT INTO `master_currency` VALUES ('3', 'EURO', 'EUR');
INSERT INTO `master_currency` VALUES ('4', 'BAHT', 'THB');

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
  `limit` int(10) DEFAULT NULL,
  PRIMARY KEY (`grade_id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of master_grade
-- ----------------------------
INSERT INTO `master_grade` VALUES ('1', 'K.IA      ', 'NON STAFF', '0', '0', '0');
INSERT INTO `master_grade` VALUES ('2', 'K.IB      ', 'NON STAFF', '0', '0', '0');
INSERT INTO `master_grade` VALUES ('3', 'K.IC      ', 'NON STAFF', '0', '0', '0');
INSERT INTO `master_grade` VALUES ('4', 'K.ID      ', 'NON STAFF', '0', '0', '0');
INSERT INTO `master_grade` VALUES ('5', 'K.IIA     ', 'NON STAFF', '0', '0', '0');
INSERT INTO `master_grade` VALUES ('6', 'K.IIB     ', 'NON STAFF', '0', '0', '0');
INSERT INTO `master_grade` VALUES ('7', 'K.IIC     ', 'NON STAFF', '0', '0', '0');
INSERT INTO `master_grade` VALUES ('8', 'K.IID     ', 'NON STAFF', '0', '0', '0');
INSERT INTO `master_grade` VALUES ('9', 'K.IIIA    ', 'NON STAFF', '0', '0', '0');
INSERT INTO `master_grade` VALUES ('10', 'K.IIIB    ', 'NON STAFF', '0', '0', '0');
INSERT INTO `master_grade` VALUES ('11', 'K.IIIC    ', 'NON STAFF', '0', '0', '0');
INSERT INTO `master_grade` VALUES ('12', 'K.IVA     ', 'NON STAFF', '0', '0', '0');
INSERT INTO `master_grade` VALUES ('13', 'IA        ', 'STAFF', '0', '0', '0');
INSERT INTO `master_grade` VALUES ('14', 'IB        ', 'STAFF', '0', '0', '0');
INSERT INTO `master_grade` VALUES ('15', 'IC        ', 'STAFF', '0', '0', '0');
INSERT INTO `master_grade` VALUES ('16', 'IIA       ', 'STAFF', '0', '0', '0');
INSERT INTO `master_grade` VALUES ('17', 'IIB       ', 'STAFF', '0', '0', '0');
INSERT INTO `master_grade` VALUES ('18', 'IIC       ', 'STAFF', '0', '0', '0');
INSERT INTO `master_grade` VALUES ('19', 'IIIA      ', 'STAFF', '0', '0', '0');
INSERT INTO `master_grade` VALUES ('20', 'IIIB      ', 'STAFF', '0', '0', '0');
INSERT INTO `master_grade` VALUES ('21', 'IIIC      ', 'STAFF', '0', '0', '0');
INSERT INTO `master_grade` VALUES ('22', 'IVA       ', 'STAFF', '1', '0', '0');
INSERT INTO `master_grade` VALUES ('23', 'IVB       ', 'STAFF', '1', '0', '0');
INSERT INTO `master_grade` VALUES ('24', 'IVC       ', 'STAFF', '1', '0', '0');
INSERT INTO `master_grade` VALUES ('25', 'VA        ', 'STAFF', '1', '0', '0');
INSERT INTO `master_grade` VALUES ('26', 'VB        ', 'STAFF', '1', '0', '0');
INSERT INTO `master_grade` VALUES ('27', 'VC        ', 'STAFF', '1', '0', '0');
INSERT INTO `master_grade` VALUES ('28', 'VIA       ', 'STAFF', '0', '1', '10000000');
INSERT INTO `master_grade` VALUES ('29', 'VIB       ', 'STAFF', '0', '1', '15000000');
INSERT INTO `master_grade` VALUES ('30', 'VIC       ', 'STAFF', '0', '1', '20000000');
INSERT INTO `master_grade` VALUES ('31', 'VIIA      ', 'STAFF', '0', '1', '25000000');
INSERT INTO `master_grade` VALUES ('32', 'VIIB      ', 'STAFF', '0', '1', '30000000');
INSERT INTO `master_grade` VALUES ('33', 'VIIC      ', 'STAFF', '0', '1', '35000000');
INSERT INTO `master_grade` VALUES ('34', 'VIIIA     ', 'STAFF', '0', '1', '40000000');
INSERT INTO `master_grade` VALUES ('35', 'VIIIB     ', 'STAFF', '0', '1', '45000000');
INSERT INTO `master_grade` VALUES ('36', 'VIIIC     ', 'STAFF', '0', '1', '50000000');
INSERT INTO `master_grade` VALUES ('37', 'ITP', 'TRAINEE PROGRAM DIII', '0', '0', '0');
INSERT INTO `master_grade` VALUES ('38', 'IITP', 'TRAINEE PROGRAM SI', '0', '0', '0');
INSERT INTO `master_grade` VALUES ('39', 'IIITP', 'TRAINEE PROGRAM SII', '0', '0', '0');

-- ----------------------------
-- Table structure for master_status
-- ----------------------------
DROP TABLE IF EXISTS `master_status`;
CREATE TABLE `master_status` (
  `status_id` int(11) NOT NULL AUTO_INCREMENT,
  `status_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of master_status
-- ----------------------------
INSERT INTO `master_status` VALUES ('1', 'Draft');
INSERT INTO `master_status` VALUES ('2', 'Submitted');
INSERT INTO `master_status` VALUES ('3', 'Approved');
INSERT INTO `master_status` VALUES ('4', 'Final Approved');
INSERT INTO `master_status` VALUES ('5', 'FA Approved');
INSERT INTO `master_status` VALUES ('6', 'HRD Approved');
INSERT INTO `master_status` VALUES ('7', 'Reject');
INSERT INTO `master_status` VALUES ('8', 'Outstanding');
INSERT INTO `master_status` VALUES ('9', 'Verified');
INSERT INTO `master_status` VALUES ('10', 'Change Request');

-- ----------------------------
-- Table structure for master_type
-- ----------------------------
DROP TABLE IF EXISTS `master_type`;
CREATE TABLE `master_type` (
  `type_id` int(10) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(100) NOT NULL,
  `parent_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of master_type
-- ----------------------------
INSERT INTO `master_type` VALUES ('1', 'Travelling', null);
INSERT INTO `master_type` VALUES ('3', 'Marketing Promo', null);
INSERT INTO `master_type` VALUES ('4', 'Production Promo', null);
INSERT INTO `master_type` VALUES ('5', 'Trial', null);
INSERT INTO `master_type` VALUES ('6', 'Others', null);
INSERT INTO `master_type` VALUES ('7', 'Meeting', '1');
INSERT INTO `master_type` VALUES ('8', 'Training ', '1');
INSERT INTO `master_type` VALUES ('9', 'Visit', '1');
INSERT INTO `master_type` VALUES ('10', 'FFD', '3');
INSERT INTO `master_type` VALUES ('11', 'Counseling', '3');
INSERT INTO `master_type` VALUES ('12', 'Comparative', '3');
INSERT INTO `master_type` VALUES ('13', 'Mini Expo', '3');
INSERT INTO `master_type` VALUES ('14', 'Enrichment', '3');
INSERT INTO `master_type` VALUES ('15', 'Others', '3');
INSERT INTO `master_type` VALUES ('16', 'Farmer Meeting', '4');
INSERT INTO `master_type` VALUES ('17', 'Product Expo', '4');
INSERT INTO `master_type` VALUES ('18', 'Others', '4');

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
INSERT INTO `sys_config` VALUES ('3', 'app_title', 'EXSYS');
INSERT INTO `sys_config` VALUES ('4', 'app_version', '1.0.0');
INSERT INTO `sys_config` VALUES ('5', 'app_description', 'Crafted with next generation of progressive web');
INSERT INTO `sys_config` VALUES ('6', 'app_keywords', '');
INSERT INTO `sys_config` VALUES ('7', 'app_author', 'Exsys Team');
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
  PRIMARY KEY (`smn_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_menus
-- ----------------------------
INSERT INTO `sys_menus` VALUES ('1', '0', 'Homepage', 'social:public', '/home', '1', '1');
INSERT INTO `sys_menus` VALUES ('3', '0', 'Dashboard', 'dashboard', '/dashboard', '2', '0');
INSERT INTO `sys_menus` VALUES ('4', '0', 'Worksheet', 'view-carousel', '/kanban', '3', '0');
INSERT INTO `sys_menus` VALUES ('6', '11', 'Ganttchart', 'image:tune', '/components/gantt', '52', '1');
INSERT INTO `sys_menus` VALUES ('7', '0', 'Settings', 'device:usb', '/settings', '99', '1');
INSERT INTO `sys_menus` VALUES ('14', '5', 'Foo', 'add', '/', '50', '1');
INSERT INTO `sys_menus` VALUES ('15', '5', 'Bar', 'add', '/', '2', '1');
INSERT INTO `sys_menus` VALUES ('16', '0', 'Customer Data', 'account-circle', '/customers', '5', '0');
INSERT INTO `sys_menus` VALUES ('17', '0', 'Leads', 'communication:phone', '/leads', '4', '0');
INSERT INTO `sys_menus` VALUES ('18', '0', 'Products', 'shopping-cart', '/products', '6', '0');
INSERT INTO `sys_menus` VALUES ('19', '0', 'Advance Expense', 'description', '/advance', '4', '1');
INSERT INTO `sys_menus` VALUES ('21', '0', 'Claim Expense', 'description', '/claim', '6', '1');
INSERT INTO `sys_menus` VALUES ('22', '0', 'References', 'description', '', '6', '1');
INSERT INTO `sys_menus` VALUES ('23', '22', 'Currency', 'description', '/currency', '1', '1');
INSERT INTO `sys_menus` VALUES ('24', '0', 'Tasklist', 'description', '', '8', '1');
INSERT INTO `sys_menus` VALUES ('25', '24', 'Task Advance', 'description', '/tasks/tasks-advance', '1', '1');
INSERT INTO `sys_menus` VALUES ('26', '24', 'Task Trip', 'description', '/tasks/tasks-trip', '2', '1');
INSERT INTO `sys_menus` VALUES ('27', '24', 'Task Expense', 'description', '/tasks/tasks-expense', '3', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sys_modules
-- ----------------------------
INSERT INTO `sys_modules` VALUES ('1', 'assets', '1.0.0', 'Assets', 'KCT Team', 'https://github.com/progmodules/assets', '/assets');
INSERT INTO `sys_modules` VALUES ('2', 'auth', '1.0.0', 'Authentication', 'KCT Team', 'https://github.com/progmodules/auth', '/auth');
INSERT INTO `sys_modules` VALUES ('3', 'application', '1.0.0', 'Application', 'KCT Team', null, '/');
INSERT INTO `sys_modules` VALUES ('5', 'home', '1.0.0', 'Homepage', 'KCT Team', null, '/home');
INSERT INTO `sys_modules` VALUES ('7', 'roles', '1.0.0', 'Roles', 'KCT Team', null, '/roles');
INSERT INTO `sys_modules` VALUES ('8', 'users', '1.0.0', 'Users', 'KCT Team', null, '/users');
INSERT INTO `sys_modules` VALUES ('9', 'modules', '1.0.0', 'Modules', 'KCT Team', null, '/modules');
INSERT INTO `sys_modules` VALUES ('10', 'worksheet', '1.0.0', 'Worksheet', 'KCT Team', null, '/kanban');
INSERT INTO `sys_modules` VALUES ('13', 'dashboard', '1.0', 'Dashboard', 'KCT Team', null, '/dashboard');
INSERT INTO `sys_modules` VALUES ('14', 'leads', '1.0', 'Leads', 'KCT Team', null, '/leads');
INSERT INTO `sys_modules` VALUES ('15', 'customers', '1.0', 'Customers', 'KCT Team', null, '/customers');
INSERT INTO `sys_modules` VALUES ('16', 'products', '1.0', 'Products', 'KCT Team', null, '/products');
INSERT INTO `sys_modules` VALUES ('17', 'settings', '1.0', 'Settings', 'KCT Team', null, '/settings');
INSERT INTO `sys_modules` VALUES ('18', 'advance', '1.0.0', 'Advance Expense', 'EXSYS', null, '/advance');
INSERT INTO `sys_modules` VALUES ('19', 'claim', '1.0.0', 'Claim Expense', 'KCT Team', null, '/claim');
INSERT INTO `sys_modules` VALUES ('20', 'currency', '1.0.0', 'Currency', 'KCT Team', null, '/currency');
INSERT INTO `sys_modules` VALUES ('21', 'tasks-advance', '1.0.0', 'Tasks Advance', 'KCT Team', null, '/tasks/tasks-advance');
INSERT INTO `sys_modules` VALUES ('22', 'tasks-trip', '1.0.0', 'Tasks Trip', 'KCT Team', null, '/tasks/tasks-trip');
INSERT INTO `sys_modules` VALUES ('23', 'tasks-expense', '1.0.0', 'Tasks Expense', 'KCT Team', null, '/tasks/tasks-expense');

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
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sys_modules_capabilities
-- ----------------------------
INSERT INTO `sys_modules_capabilities` VALUES ('3', '1', 'GET_RESOURCE', 'Allow user to download resources (image, file etc.)');
INSERT INTO `sys_modules_capabilities` VALUES ('12', '3', 'MANAGE', 'Allow user to manage whole application');
INSERT INTO `sys_modules_capabilities` VALUES ('16', '2', 'LOGIN', 'Allow user to perform login action');
INSERT INTO `sys_modules_capabilities` VALUES ('17', '1', 'GET_THUMBNAIL', 'Allow user to download image thumbnail');
INSERT INTO `sys_modules_capabilities` VALUES ('20', '10', 'CREATE', 'Allow user to create new kanban setting');
INSERT INTO `sys_modules_capabilities` VALUES ('22', '5', 'UPDATE_NOTES', 'Allow user to update welcome notes');
INSERT INTO `sys_modules_capabilities` VALUES ('23', '5', 'UPDATE_COVER', 'Allow user to update background image');
INSERT INTO `sys_modules_capabilities` VALUES ('24', '3', 'ACCESS', 'Allow user to send mail');
INSERT INTO `sys_modules_capabilities` VALUES ('26', '10', 'UPDATE', 'Allow user to display detail and modify item');
INSERT INTO `sys_modules_capabilities` VALUES ('27', '10', 'DELETE', 'Allow user to delete kanban item');
INSERT INTO `sys_modules_capabilities` VALUES ('28', '14', 'add', 'Allow user to add new lead');
INSERT INTO `sys_modules_capabilities` VALUES ('29', '14', 'edit', 'Allow user to edit lead');
INSERT INTO `sys_modules_capabilities` VALUES ('30', '14', 'remove', 'Allow user to remove lead');

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_numbers
-- ----------------------------
INSERT INTO `sys_numbers` VALUES ('1', 'SALES_TICKET', '35', '5', 'SP', null);
INSERT INTO `sys_numbers` VALUES ('2', 'ADVANCE', '7', '4', 'ADV#', null);

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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sys_roles
-- ----------------------------
INSERT INTO `sys_roles` VALUES ('4', 'Administator', 'administator', 'Role for administrator user', '0', '2017-05-24 18:48:45', 'system');
INSERT INTO `sys_roles` VALUES ('7', 'General Manager', 'general-manager', null, '0', '2017-09-18 09:00:50', 'system');
INSERT INTO `sys_roles` VALUES ('8', 'Sales Manager FMCG', 'sales-manager-fmcg', null, '0', '2017-09-18 09:00:58', 'system');
INSERT INTO `sys_roles` VALUES ('9', 'Account Manager FMCG', 'account-manager-fmcg', null, '0', '2017-09-18 09:01:09', 'system');
INSERT INTO `sys_roles` VALUES ('10', 'Sales Manager MAETL', 'sales-manager-maetl', null, '0', '2017-09-27 13:52:46', 'system');
INSERT INTO `sys_roles` VALUES ('11', 'Account Manager MAETL', 'account-manager-maetl', null, '0', '2017-09-27 13:53:16', 'system');
INSERT INTO `sys_roles` VALUES ('12', 'Sales Manager EPSE', 'sales-manager-epse', null, '0', '2017-09-27 13:53:37', 'system');
INSERT INTO `sys_roles` VALUES ('13', 'Account Manager EPSE', 'account-manager-epse', null, '0', '2017-09-27 13:53:51', 'system');
INSERT INTO `sys_roles` VALUES ('14', 'Sales Manager Reseller & SME', 'sales-manager-reseller-sme', null, '0', '2017-09-27 13:54:22', 'system');
INSERT INTO `sys_roles` VALUES ('15', 'Account Manager Reseller & SME', 'account-manager-reseller-sme', null, '0', '2017-09-27 13:54:35', 'system');

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
-- Table structure for sys_roles_menus
-- ----------------------------
DROP TABLE IF EXISTS `sys_roles_menus`;
CREATE TABLE `sys_roles_menus` (
  `srm_id` int(11) NOT NULL AUTO_INCREMENT,
  `srm_sr_id` int(11) DEFAULT NULL,
  `srm_smn_id` int(11) DEFAULT NULL,
  `srm_selected` int(1) DEFAULT '0',
  PRIMARY KEY (`srm_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_roles_menus
-- ----------------------------
INSERT INTO `sys_roles_menus` VALUES ('1', '4', '1', '1');
INSERT INTO `sys_roles_menus` VALUES ('2', '4', '4', '0');
INSERT INTO `sys_roles_menus` VALUES ('3', '4', '14', '1');
INSERT INTO `sys_roles_menus` VALUES ('4', '4', '3', '0');
INSERT INTO `sys_roles_menus` VALUES ('5', '4', '17', '0');
INSERT INTO `sys_roles_menus` VALUES ('6', '4', '16', '0');
INSERT INTO `sys_roles_menus` VALUES ('7', '4', '18', '0');
INSERT INTO `sys_roles_menus` VALUES ('8', '4', '7', '1');
INSERT INTO `sys_roles_menus` VALUES ('9', '4', '19', '1');
INSERT INTO `sys_roles_menus` VALUES ('10', '4', '21', '1');
INSERT INTO `sys_roles_menus` VALUES ('11', '4', '23', '1');
INSERT INTO `sys_roles_menus` VALUES ('12', '4', '24', '0');
INSERT INTO `sys_roles_menus` VALUES ('13', '4', '25', '1');
INSERT INTO `sys_roles_menus` VALUES ('14', '4', '26', '1');
INSERT INTO `sys_roles_menus` VALUES ('15', '4', '27', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_roles_permissions
-- ----------------------------
INSERT INTO `sys_roles_permissions` VALUES ('12', '4', '24', '1');
INSERT INTO `sys_roles_permissions` VALUES ('13', '4', '12', '1');
INSERT INTO `sys_roles_permissions` VALUES ('14', '4', '3', '1');
INSERT INTO `sys_roles_permissions` VALUES ('15', '4', '18', '0');
INSERT INTO `sys_roles_permissions` VALUES ('16', '4', '19', '0');
INSERT INTO `sys_roles_permissions` VALUES ('17', '4', '22', '1');
INSERT INTO `sys_roles_permissions` VALUES ('18', '4', '23', '1');
INSERT INTO `sys_roles_permissions` VALUES ('19', '4', '20', '1');
INSERT INTO `sys_roles_permissions` VALUES ('20', '4', '25', '0');
INSERT INTO `sys_roles_permissions` VALUES ('21', '4', '17', '1');
INSERT INTO `sys_roles_permissions` VALUES ('22', '4', '16', '1');
INSERT INTO `sys_roles_permissions` VALUES ('23', '4', '21', '0');
INSERT INTO `sys_roles_permissions` VALUES ('24', '4', '26', '1');
INSERT INTO `sys_roles_permissions` VALUES ('25', '4', '27', '1');
INSERT INTO `sys_roles_permissions` VALUES ('26', '4', '28', '1');
INSERT INTO `sys_roles_permissions` VALUES ('27', '4', '29', '1');
INSERT INTO `sys_roles_permissions` VALUES ('28', '4', '30', '1');

-- ----------------------------
-- Table structure for sys_users
-- ----------------------------
DROP TABLE IF EXISTS `sys_users`;
CREATE TABLE `sys_users` (
  `su_id` int(11) NOT NULL AUTO_INCREMENT,
  `su_grade_id` int(11) DEFAULT NULL,
  `su_superior` int(11) DEFAULT NULL,
  `su_sr_id` int(11) DEFAULT NULL,
  `su_email` varchar(255) DEFAULT NULL,
  `su_passwd` varchar(255) DEFAULT NULL,
  `su_fullname` varchar(255) DEFAULT NULL,
  `su_nip` varchar(100) DEFAULT NULL,
  `su_avatar` varchar(255) DEFAULT NULL,
  `su_access_token` varchar(255) DEFAULT NULL,
  `su_refresh_token` varchar(255) DEFAULT NULL,
  `su_sex` varchar(30) DEFAULT NULL,
  `su_dob` date DEFAULT NULL,
  `su_job_title` varchar(100) DEFAULT NULL,
  `su_company` varchar(255) DEFAULT NULL,
  `su_active` int(1) DEFAULT '1',
  `su_created_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `su_created_by` varchar(50) DEFAULT 'system',
  PRIMARY KEY (`su_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sys_users
-- ----------------------------
INSERT INTO `sys_users` VALUES ('1', '10', '2', '4', 'roso@kct.co.id', '$2y$08$dWZ2bnZPZGlZTFRzcFM3O.0H1nj9De85nlg47ErMwBPwhnDzCJlFq', 'Roso Sasongko', null, 'roso_kct_co_id.png', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJpYXQiOjE1MDgwMTgyMjIsImp0aSI6IldhODFlWEt1eE5mZ25RbVVyTmNXY3AyUjRITmloUm1TM0VJQlRcL2dtNm9ZPSIsImlzcyI6IktyZWFzaW5kbyBDaXB0YSBUZWtub2xvZ2kiLCJuYmYiOjE1MDgwMTgyMjMsImV4cCI6MTUwODEwMjIyMywiZGF0YSI6eyJzdV9lbWFpbCI6InJvc2', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJpYXQiOjE1MDgwMTgyMjIsImp0aSI6InBBYkIwSnlOaVwvSFhTcnpuaGhYcVlEaHZHTHVvaWUxSXJickcxTmc5dWNRPSIsImlzcyI6IktyZWFzaW5kbyBDaXB0YSBUZWtub2xvZ2kiLCJuYmYiOjE1MDgwMTgyMjMsImV4cCI6MTUwODEyNjIyMywiZGF0YSI6bnVsbH0.6JlAXxxW6K2X5w', 'Male', '1985-07-03', 'Programmer', 'Kreasindo Cipta Teknologi', '1', '2017-04-27 20:52:36', 'system');
INSERT INTO `sys_users` VALUES ('2', '13', '3', '4', 'vidi@kct.co.id', '$2y$08$MVg1UndEeTVGRWJrL1BxS.DUf6A5rt36rq9CByczAtresY5PvVykO', 'Vidi Meylan', null, 'defaults/avatar-0.png', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJpYXQiOjE0OTM4NzczNTUsImp0aSI6ImJaTzgzMFZnTmMzOXlpaGc5Wk02WlBlNTR3WURlK0pjVEZYbytVelFDOFU9IiwiaXNzIjoiS3JlYXNpbmRvIENpcHRhIFRla25vbG9naSIsIm5iZiI6MTQ5Mzg3NzM1NiwiZXhwIjoxNDkzOTYxMzU2LCJkYXRhIjp7InN1X2VtYWlsIjoidmlkaU', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJpYXQiOjE0OTM4NzczNTUsImp0aSI6ImF3VXJ6cFIrVGJqaGNyMDJGZ01wNENhSUxOSmpUdTVSTXhFXC9HUTMydlEwPSIsImlzcyI6IktyZWFzaW5kbyBDaXB0YSBUZWtub2xvZ2kiLCJuYmYiOjE0OTM4NzczNTYsImV4cCI6MTQ5Mzk4NTM1NiwiZGF0YSI6bnVsbH0.UjnERoG8tMcfLB', null, null, null, null, '1', '2017-05-04 05:55:15', 'system');
INSERT INTO `sys_users` VALUES ('3', '23', '4', '4', 'cahya@kct.co.id', '$2y$08$JInjOtkULdYcwjnWPXwUL.V5ZUAn8rANXsYliJDdPXrS9bUnS/QfW', 'Cahya Dyzin', null, 'defaults/avatar-0.png', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJpYXQiOjE1MDgwMjA0ODEsImp0aSI6IlwvYTRpUWwzbkM3XC95QWJEdVo2Y1dudzB6QXh0bGh4d1J6aHI4MWNZWDFaYz0iLCJpc3MiOiJLcmVhc2luZG8gQ2lwdGEgVGVrbm9sb2dpIiwibmJmIjoxNTA4MDIwNDgyLCJleHAiOjE1MDgxMDQ0ODIsImRhdGEiOnsic3VfZW1haWwiOiJjYW', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJpYXQiOjE1MDgwMjA0ODEsImp0aSI6IlBiQk9NR2wxSlRHREJxXC9Tb2IyVzNRV3NmMldqMG1pXC8yeVVGZHBOQTdaVT0iLCJpc3MiOiJLcmVhc2luZG8gQ2lwdGEgVGVrbm9sb2dpIiwibmJmIjoxNTA4MDIwNDgyLCJleHAiOjE1MDgxMjg0ODIsImRhdGEiOm51bGx9.J6wJo5gsB7MPK', 'Male', null, null, null, '1', '2017-05-04 06:24:39', 'system');
INSERT INTO `sys_users` VALUES ('4', '29', '7', '4', 'wili@kct.co.id', '$2y$08$JD1lu23K6va7KJlh7x1o6uMN55nAUsQjFUFcH9o8AFPTitLBS8Y0y', 'Wiliarko M.', null, 'defaults/avatar-0.png', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJpYXQiOjE1MDgwMTgyOTAsImp0aSI6IlJpTlJFZE1RUDhcL1RvRnhaQk90WVBOT1lJNzhHVGRoUVwvYTFPb3lEaklDUT0iLCJpc3MiOiJLcmVhc2luZG8gQ2lwdGEgVGVrbm9sb2dpIiwibmJmIjoxNTA4MDE4MjkxLCJleHAiOjE1MDgxMDIyOTEsImRhdGEiOnsic3VfZW1haWwiOiJ3aW', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJpYXQiOjE1MDgwMTgyOTAsImp0aSI6Ikg2SzdoZWh6Y20xaVVTZFMrMGJsRzdxMGU0S3ZCalJmVlwvUitjSlpTbVwvdz0iLCJpc3MiOiJLcmVhc2luZG8gQ2lwdGEgVGVrbm9sb2dpIiwibmJmIjoxNTA4MDE4MjkxLCJleHAiOjE1MDgxMjYyOTEsImRhdGEiOm51bGx9.qUfiCV9KHZ1se', null, null, null, null, '1', '2017-05-04 07:20:15', 'system');
INSERT INTO `sys_users` VALUES ('7', '30', null, '4', 'said@kct.co.id', '$2y$08$swEfrnafombDpMRGinkU2u2NsCet8xnfpuZdoeF90cMrpWgZ5TyHS', 'Said M Fahmi', null, '1757649-me_avatar_big.png', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJpYXQiOjE1MDc4ODg1MzQsImp0aSI6IlZacEt0RllGXC9hMjFIWUxBdkdidHFlNHk2ODU3TEZid1wvZmhNY01QYXNvVT0iLCJpc3MiOiJLcmVhc2luZG8gQ2lwdGEgVGVrbm9sb2dpIiwibmJmIjoxNTA3ODg4NTM1LCJleHAiOjE1MDc5NzI1MzUsImRhdGEiOnsic3VfZW1haWwiOiJzYW', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJpYXQiOjE1MDc4ODg1MzQsImp0aSI6ImFYem91Tit1NVU1VVJndlJzUkxveDQ0N3dhT1F2WE16N3lRR0czMWpYUnM9IiwiaXNzIjoiS3JlYXNpbmRvIENpcHRhIFRla25vbG9naSIsIm5iZiI6MTUwNzg4ODUzNSwiZXhwIjoxNTA3OTk2NTM1LCJkYXRhIjpudWxsfQ.pztfKUgff6rC5O0', null, null, null, null, '1', '2017-08-04 15:12:15', 'system');

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
-- Table structure for trx_leads
-- ----------------------------
DROP TABLE IF EXISTS `trx_leads`;
CREATE TABLE `trx_leads` (
  `tl_id` int(11) NOT NULL AUTO_INCREMENT,
  `tl_mc_id` int(11) DEFAULT NULL,
  `tl_status` varchar(30) DEFAULT NULL,
  `tl_notes` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`tl_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of trx_leads
-- ----------------------------
INSERT INTO `trx_leads` VALUES ('1', '1', 'HOT', 'Tertarik Penawaran');
INSERT INTO `trx_leads` VALUES ('2', '2', 'HOLD', 'Ada Kemungkinan Tahun Depan Bisa Di Prospek');
INSERT INTO `trx_leads` VALUES ('3', '3', 'HOT', 'Minta Penawaran');
INSERT INTO `trx_leads` VALUES ('4', '6', 'DUMP', 'Tidak Ada Kebutuhan');
INSERT INTO `trx_leads` VALUES ('5', '8', 'HOT', '');
INSERT INTO `trx_leads` VALUES ('6', '9', 'HOT', '');
INSERT INTO `trx_leads` VALUES ('7', '4', 'HOT', 'Minta Penawaran');
INSERT INTO `trx_leads` VALUES ('8', '11', 'HOT', '');
INSERT INTO `trx_leads` VALUES ('9', '5', 'HOT', 'Bulan Depan Ada Keputusan');
INSERT INTO `trx_leads` VALUES ('10', '12', 'HOT', null);

-- ----------------------------
-- Table structure for trx_products
-- ----------------------------
DROP TABLE IF EXISTS `trx_products`;
CREATE TABLE `trx_products` (
  `tp_id` int(11) NOT NULL AUTO_INCREMENT,
  `tp_service` varchar(255) NOT NULL DEFAULT '0',
  `tp_sub_service` varchar(255) NOT NULL DEFAULT '0',
  PRIMARY KEY (`tp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of trx_products
-- ----------------------------
INSERT INTO `trx_products` VALUES ('1', 'GSM', 'Postpaid');
INSERT INTO `trx_products` VALUES ('2', 'GSM', 'Prepaid');
INSERT INTO `trx_products` VALUES ('5', 'NGSM', 'Revenue - Tracking Systems & MPLS');
INSERT INTO `trx_products` VALUES ('6', 'NGSM', 'Revenue - Leased Line');

-- ----------------------------
-- Table structure for trx_sales
-- ----------------------------
DROP TABLE IF EXISTS `trx_sales`;
CREATE TABLE `trx_sales` (
  `ts_id` int(11) NOT NULL AUTO_INCREMENT,
  `ts_ticket_number` varchar(30) DEFAULT NULL,
  `ts_tl_id` int(11) DEFAULT NULL,
  `ts_mc_id` int(11) DEFAULT NULL,
  `ts_tp_id` int(11) DEFAULT NULL,
  `ts_segment` varchar(50) DEFAULT NULL,
  `ts_amounts` double(15,2) DEFAULT NULL,
  `ts_products` varchar(100) DEFAULT NULL,
  `ts_creator` int(11) DEFAULT NULL,
  `ts_drop_status` varchar(50) DEFAULT 'active',
  `ts_date_opportunity` varchar(30) DEFAULT NULL,
  `ts_date_submitted` varchar(30) DEFAULT NULL,
  `ts_date_negotiated` varchar(30) DEFAULT NULL,
  `ts_date_po` varchar(30) DEFAULT NULL,
  `ts_date_closed` varchar(30) DEFAULT NULL,
  `ts_expected_date_closed` varchar(30) DEFAULT NULL,
  `ts_revenue_type` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`ts_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of trx_sales
-- ----------------------------
INSERT INTO `trx_sales` VALUES ('1', 'SP00033-A', null, '1', '1', 'FSI', '1000000.00', 'GSM - Postpaid', '7', 'drop', '2017-10-05', '2017-10-06', null, null, null, '2017-10-05', 'Recurring');
INSERT INTO `trx_sales` VALUES ('2', 'SP00033-B', null, '1', '6', 'FSI', '1500002.00', 'NGSM - Revenue - Leased Line', '7', 'drop', '2017-10-05', null, null, null, null, '2017-10-05', 'Recurring');
INSERT INTO `trx_sales` VALUES ('3', 'SP00034-A', null, '1', '1', 'FSI', '2000000.00', 'GSM - Postpaid', '7', 'drop', '2017-10-09', null, null, null, null, '2017-10-09', 'Recurring');
INSERT INTO `trx_sales` VALUES ('4', 'SP00034-B', null, '1', '2', 'FSI', '3000000.00', 'GSM - Prepaid', '7', 'drop', '2017-10-09', null, null, null, null, '2017-10-09', 'Recurring');
INSERT INTO `trx_sales` VALUES ('5', 'SP00034-C', null, '1', '6', 'FSI', '1000000.00', 'NGSM - Revenue - Leased Line', '7', 'drop', '2017-10-09', null, null, null, null, '2017-10-09', 'Recurring');
INSERT INTO `trx_sales` VALUES ('6', 'SP00035-A', null, '12', '1', 'FSI', '1000000.00', null, null, 'active', '2017-10-10', null, null, null, null, '2017-10-10', 'Recurring');
INSERT INTO `trx_sales` VALUES ('7', 'SP00035-B', null, '12', '5', 'FSI', '1200000.00', 'NGSM - Revenue - Tracking Systems & MPLS', null, 'drop', '2017-10-10', null, null, null, null, '2017-10-10', 'Recurring');

-- ----------------------------
-- Table structure for trx_sales_comments
-- ----------------------------
DROP TABLE IF EXISTS `trx_sales_comments`;
CREATE TABLE `trx_sales_comments` (
  `tsc_id` int(11) NOT NULL AUTO_INCREMENT,
  `tsc_ts_id` int(11) NOT NULL DEFAULT '0',
  `tsc_sender` int(11) NOT NULL DEFAULT '0',
  `tsc_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `tsc_message` text NOT NULL,
  PRIMARY KEY (`tsc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of trx_sales_comments
-- ----------------------------
INSERT INTO `trx_sales_comments` VALUES ('1', '1', '7', '2017-10-05 14:01:00', 'tesss');
INSERT INTO `trx_sales_comments` VALUES ('2', '2', '7', '2017-10-05 14:06:03', 'tossss');
INSERT INTO `trx_sales_comments` VALUES ('3', '2', '7', '2017-10-05 14:32:02', 'jkdhsjkdhskdhs');
INSERT INTO `trx_sales_comments` VALUES ('4', '2', '7', '2017-10-05 08:27:43', 'lkjklsd sdsdlkj sdsdsd');
INSERT INTO `trx_sales_comments` VALUES ('5', '2', '7', '2017-10-05 08:28:19', 'lkjklsd sdsdlkj sdsdsd sfssds');
INSERT INTO `trx_sales_comments` VALUES ('6', '2', '7', '2017-10-05 08:31:05', 'lkjklsd sdsdlkj sdsdsd sfssds  232323');
INSERT INTO `trx_sales_comments` VALUES ('7', '2', '7', '2017-10-05 08:33:03', 'lkjklsd sdsdlkj sdsdsd sfssds  232323 fddff');
INSERT INTO `trx_sales_comments` VALUES ('8', '2', '7', '2017-10-05 08:33:28', 'lkjklsd sdsdlkj sdsdsd sfssds  232323 fddff');
INSERT INTO `trx_sales_comments` VALUES ('9', '2', '7', '2017-10-05 08:34:24', 'lkjklsd sdsdlkj sdsdsd sfssds  232323 fddff');
INSERT INTO `trx_sales_comments` VALUES ('10', '2', '7', '2017-10-05 08:38:00', 'lkjklsd sdsdlkj sdsdsd sfssds  232323 fddff');
INSERT INTO `trx_sales_comments` VALUES ('11', '2', '7', '2017-10-05 08:38:17', 'lkjklsd sdsdlkj sdsdsd sfssds  232323 fddff');
INSERT INTO `trx_sales_comments` VALUES ('12', '2', '7', '2017-10-05 08:40:58', 'lkjklsd sdsdlkj sdsdsd sfssds  232323 fddff');
INSERT INTO `trx_sales_comments` VALUES ('13', '2', '7', '2017-10-05 08:41:34', 'sdsds');
INSERT INTO `trx_sales_comments` VALUES ('14', '2', '7', '2017-10-05 08:42:49', 'okeeey');
INSERT INTO `trx_sales_comments` VALUES ('15', '2', '7', '2017-10-05 08:43:33', 'yaaaeee');
INSERT INTO `trx_sales_comments` VALUES ('16', '2', '7', '2017-10-05 08:43:37', 'dsdsds');
INSERT INTO `trx_sales_comments` VALUES ('17', '2', '7', '2017-10-05 08:45:55', '13298jkjhkwew sdsjdks\nsdsdsdsd');
INSERT INTO `trx_sales_comments` VALUES ('18', '2', '7', '2017-10-05 09:08:14', 'jhkhjkhj');

-- ----------------------------
-- Table structure for trx_sales_products
-- ----------------------------
DROP TABLE IF EXISTS `trx_sales_products`;
CREATE TABLE `trx_sales_products` (
  `tsp_id` int(11) NOT NULL AUTO_INCREMENT,
  `tsp_ts_id` int(11) DEFAULT NULL,
  `tsp_tp_id` int(11) DEFAULT NULL,
  `tsp_amount` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`tsp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of trx_sales_products
-- ----------------------------
INSERT INTO `trx_sales_products` VALUES ('1', '15', '1', '100000');
INSERT INTO `trx_sales_products` VALUES ('2', '15', '6', '2000000');

-- ----------------------------
-- Table structure for trx_sales_statuses
-- ----------------------------
DROP TABLE IF EXISTS `trx_sales_statuses`;
CREATE TABLE `trx_sales_statuses` (
  `tss_id` int(11) NOT NULL AUTO_INCREMENT,
  `tss_ts_id` int(11) DEFAULT NULL,
  `tss_status` int(11) DEFAULT NULL,
  `tss_target` int(11) DEFAULT NULL,
  `tss_worker` varchar(100) DEFAULT NULL,
  `tss_deleted` int(1) DEFAULT '0',
  `tss_created` datetime DEFAULT NULL,
  PRIMARY KEY (`tss_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of trx_sales_statuses
-- ----------------------------
INSERT INTO `trx_sales_statuses` VALUES ('1', '1', '629', '826', 'sales-flow', '1', '2017-10-05 04:17:08');
INSERT INTO `trx_sales_statuses` VALUES ('2', '2', '629', '826', 'sales-flow', '1', '2017-10-05 04:17:08');
INSERT INTO `trx_sales_statuses` VALUES ('3', '1', '630', '827', 'sales-flow', '1', '2017-10-05 04:19:30');
INSERT INTO `trx_sales_statuses` VALUES ('4', '1', '631', '828', 'sales-flow', '1', '2017-10-05 04:21:13');
INSERT INTO `trx_sales_statuses` VALUES ('6', '1', '645', '835', 'sales-flow', '1', '2017-10-05 04:22:51');
INSERT INTO `trx_sales_statuses` VALUES ('8', '2', '639', '835', 'sales-flow', '1', '2017-10-09 03:25:56');
INSERT INTO `trx_sales_statuses` VALUES ('9', '3', '644', '839', 'sales-flow', '1', '2017-10-09 09:22:26');
INSERT INTO `trx_sales_statuses` VALUES ('10', '4', '644', '839', 'sales-flow', '1', '2017-10-09 09:22:26');
INSERT INTO `trx_sales_statuses` VALUES ('11', '5', '644', '839', 'sales-flow', '1', '2017-10-09 09:22:26');
INSERT INTO `trx_sales_statuses` VALUES ('12', '4', '629', '826', 'sales-flow', '1', '2017-10-09 09:22:41');
INSERT INTO `trx_sales_statuses` VALUES ('13', '4', '630', '827', 'sales-flow', '1', '2017-10-09 09:22:51');
INSERT INTO `trx_sales_statuses` VALUES ('14', '4', '640', '835', 'sales-flow', '1', '2017-10-09 09:22:51');
INSERT INTO `trx_sales_statuses` VALUES ('15', '3', '629', '826', 'sales-flow', '1', '2017-10-09 09:25:43');
INSERT INTO `trx_sales_statuses` VALUES ('16', '3', '640', '835', 'sales-flow', '0', '2017-10-09 09:25:49');
INSERT INTO `trx_sales_statuses` VALUES ('17', '4', '641', '835', 'sales-flow', '0', '2017-10-09 11:30:38');
INSERT INTO `trx_sales_statuses` VALUES ('18', '4', '648', '833', 'sales-flow', '0', '2017-10-09 11:30:38');
INSERT INTO `trx_sales_statuses` VALUES ('19', '2', '641', '835', 'sales-flow', '0', '2017-10-09 11:30:57');
INSERT INTO `trx_sales_statuses` VALUES ('20', '2', '648', '833', 'sales-flow', '0', '2017-10-09 11:30:57');
INSERT INTO `trx_sales_statuses` VALUES ('21', '1', '648', '833', 'sales-flow', '0', '2017-10-09 11:32:05');
INSERT INTO `trx_sales_statuses` VALUES ('22', '5', '629', '826', 'sales-flow', '1', '2017-10-10 02:46:48');
INSERT INTO `trx_sales_statuses` VALUES ('23', '5', '630', '827', 'sales-flow', '1', '2017-10-10 02:46:53');
INSERT INTO `trx_sales_statuses` VALUES ('24', '5', '631', '828', 'sales-flow', '1', '2017-10-10 02:46:55');
INSERT INTO `trx_sales_statuses` VALUES ('26', '5', '645', '835', 'sales-flow', '0', '2017-10-10 04:16:57');
INSERT INTO `trx_sales_statuses` VALUES ('27', '6', '644', '839', 'sales-flow', '0', '2017-10-10 04:21:49');
INSERT INTO `trx_sales_statuses` VALUES ('28', '7', '644', '839', 'sales-flow', '1', '2017-10-10 04:21:49');
INSERT INTO `trx_sales_statuses` VALUES ('29', '7', '629', '826', 'sales-flow', '1', '2017-10-10 11:16:05');
INSERT INTO `trx_sales_statuses` VALUES ('30', '7', '630', '827', 'sales-flow', '1', '2017-10-10 11:16:24');
INSERT INTO `trx_sales_statuses` VALUES ('31', '7', '641', '835', 'sales-flow', '0', '2017-10-10 11:16:46');

-- ----------------------------
-- Table structure for trx_siteplan
-- ----------------------------
DROP TABLE IF EXISTS `trx_siteplan`;
CREATE TABLE `trx_siteplan` (
  `tsp_id` int(11) NOT NULL AUTO_INCREMENT,
  `tsp_name` varchar(100) DEFAULT NULL,
  `tsp_description` varchar(200) DEFAULT NULL,
  `tsp_date_upload` varchar(30) DEFAULT NULL,
  `tsp_is_rejected` int(1) DEFAULT NULL,
  `tsp_date_approve` varchar(30) DEFAULT NULL,
  `tss_bss_date_upload` varchar(30) DEFAULT NULL,
  `tss_date_power` varchar(30) DEFAULT NULL,
  `tss_date_trm_review` varchar(30) DEFAULT NULL,
  `tss_date_netplan` varchar(30) DEFAULT NULL,
  `tss_proj_def` varchar(100) DEFAULT NULL,
  `tss_request_type` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`tsp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of trx_siteplan
-- ----------------------------
INSERT INTO `trx_siteplan` VALUES ('1', 'A', null, 'A', '0', 'A', 'A', 'A', 'A', 'A', 'A', 'NEW');
INSERT INTO `trx_siteplan` VALUES ('2', 'Site Bandung', null, 'A', '0', 'A', null, null, null, null, null, null);
INSERT INTO `trx_siteplan` VALUES ('3', 'B', null, 'B', '1', null, null, null, null, null, null, null);
INSERT INTO `trx_siteplan` VALUES ('4', 'Site Manggarai', null, 'C', null, null, null, null, null, null, null, null);
INSERT INTO `trx_siteplan` VALUES ('5', 'Site Katulampa', null, 'D', '0', 'D', 'D', null, null, null, null, null);
INSERT INTO `trx_siteplan` VALUES ('6', 'TRIP', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `trx_siteplan` VALUES ('7', 'TRIO', null, '1', '0', '1', '1', null, '1', null, null, 'NEW');
INSERT INTO `trx_siteplan` VALUES ('8', 'AD', null, '1', '0', '1', '1', null, null, null, null, null);
INSERT INTO `trx_siteplan` VALUES ('9', null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for trx_siteplan_statuses
-- ----------------------------
DROP TABLE IF EXISTS `trx_siteplan_statuses`;
CREATE TABLE `trx_siteplan_statuses` (
  `tsps_id` int(11) NOT NULL AUTO_INCREMENT,
  `tsps_tsp_id` int(11) DEFAULT NULL,
  `tsps_status` int(11) DEFAULT NULL,
  `tsps_target` int(11) DEFAULT NULL,
  `tsps_worker` varchar(100) DEFAULT NULL,
  `tsps_deleted` int(1) DEFAULT '0',
  `tsps_created` datetime DEFAULT NULL,
  PRIMARY KEY (`tsps_id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of trx_siteplan_statuses
-- ----------------------------
INSERT INTO `trx_siteplan_statuses` VALUES ('3', '1', '610', '815', 'flow-site-ssr', '1', '2017-08-07 11:11:30');
INSERT INTO `trx_siteplan_statuses` VALUES ('4', '1', '611', '819', 'flow-site-ssr', '1', '2017-08-07 11:11:30');
INSERT INTO `trx_siteplan_statuses` VALUES ('5', '1', '612', '821', 'flow-site-ssr', '1', '2017-08-07 11:11:30');
INSERT INTO `trx_siteplan_statuses` VALUES ('6', '1', '613', '811', 'flow-site-ssr', '1', '2017-08-07 11:11:30');
INSERT INTO `trx_siteplan_statuses` VALUES ('8', '1', '616', '817', 'flow-site-ssr', '1', '2017-08-07 11:11:34');
INSERT INTO `trx_siteplan_statuses` VALUES ('9', '1', '617', '821', 'flow-site-ssr', '1', '2017-08-07 11:11:34');
INSERT INTO `trx_siteplan_statuses` VALUES ('10', '1', '618', '821', 'flow-site-ssr', '1', '2017-08-07 11:11:40');
INSERT INTO `trx_siteplan_statuses` VALUES ('11', '1', '615', '821', 'flow-site-ssr', '1', '2017-08-07 11:11:45');
INSERT INTO `trx_siteplan_statuses` VALUES ('13', '2', '607', '809', 'flow-site-ssr', '1', '2017-08-07 11:19:36');
INSERT INTO `trx_siteplan_statuses` VALUES ('14', '3', '607', '809', 'flow-site-ssr', '1', '2017-08-07 11:19:40');
INSERT INTO `trx_siteplan_statuses` VALUES ('15', '4', '607', '809', 'flow-site-ssr', '0', '2017-08-07 11:19:44');
INSERT INTO `trx_siteplan_statuses` VALUES ('16', '2', '608', '813', 'flow-site-ssr', '0', '2017-08-07 11:19:49');
INSERT INTO `trx_siteplan_statuses` VALUES ('17', '5', '607', '809', 'flow-site-ssr', '1', '2017-08-07 11:19:55');
INSERT INTO `trx_siteplan_statuses` VALUES ('18', '5', '608', '813', 'flow-site-ssr', '1', '2017-08-07 11:19:59');
INSERT INTO `trx_siteplan_statuses` VALUES ('19', '5', '610', '815', 'flow-site-ssr', '1', '2017-08-07 11:20:13');
INSERT INTO `trx_siteplan_statuses` VALUES ('20', '5', '611', '819', 'flow-site-ssr', '0', '2017-08-07 11:20:13');
INSERT INTO `trx_siteplan_statuses` VALUES ('21', '5', '612', '821', 'flow-site-ssr', '0', '2017-08-07 11:20:13');
INSERT INTO `trx_siteplan_statuses` VALUES ('22', '5', '613', '811', 'flow-site-ssr', '0', '2017-08-07 11:20:13');
INSERT INTO `trx_siteplan_statuses` VALUES ('23', '3', '609', '810', 'flow-site-ssr', '0', '2017-08-07 11:20:20');
INSERT INTO `trx_siteplan_statuses` VALUES ('24', '5', '614', '821', 'flow-site-ssr', '0', '2017-08-07 12:12:43');
INSERT INTO `trx_siteplan_statuses` VALUES ('25', '7', '607', '809', 'flow-site-ssr', '1', '2017-09-01 14:21:01');
INSERT INTO `trx_siteplan_statuses` VALUES ('26', '7', '608', '813', 'flow-site-ssr', '1', '2017-09-01 14:21:19');
INSERT INTO `trx_siteplan_statuses` VALUES ('27', '7', '610', '815', 'flow-site-ssr', '1', '2017-09-01 14:21:29');
INSERT INTO `trx_siteplan_statuses` VALUES ('28', '7', '611', '819', 'flow-site-ssr', '1', '2017-09-01 14:21:29');
INSERT INTO `trx_siteplan_statuses` VALUES ('29', '7', '612', '821', 'flow-site-ssr', '1', '2017-09-01 14:21:29');
INSERT INTO `trx_siteplan_statuses` VALUES ('30', '7', '613', '811', 'flow-site-ssr', '0', '2017-09-01 14:21:29');
INSERT INTO `trx_siteplan_statuses` VALUES ('31', '7', '614', '821', 'flow-site-ssr', '1', '2017-09-01 14:21:39');
INSERT INTO `trx_siteplan_statuses` VALUES ('32', '7', '616', '817', 'flow-site-ssr', '0', '2017-09-01 14:21:39');
INSERT INTO `trx_siteplan_statuses` VALUES ('33', '7', '617', '821', 'flow-site-ssr', '1', '2017-09-01 14:21:39');
INSERT INTO `trx_siteplan_statuses` VALUES ('34', '7', '619', '824', 'flow-site-ssr', '0', '2017-09-01 14:21:46');
INSERT INTO `trx_siteplan_statuses` VALUES ('35', '8', '607', '809', 'flow-site-ssr', '1', '2017-09-01 14:23:18');
INSERT INTO `trx_siteplan_statuses` VALUES ('36', '8', '608', '813', 'flow-site-ssr', '1', '2017-09-01 14:23:26');
INSERT INTO `trx_siteplan_statuses` VALUES ('37', '8', '610', '815', 'flow-site-ssr', '0', '2017-09-01 14:24:00');
INSERT INTO `trx_siteplan_statuses` VALUES ('38', '8', '611', '819', 'flow-site-ssr', '0', '2017-09-01 14:24:00');
INSERT INTO `trx_siteplan_statuses` VALUES ('39', '8', '612', '821', 'flow-site-ssr', '0', '2017-09-01 14:24:00');
INSERT INTO `trx_siteplan_statuses` VALUES ('40', '8', '613', '811', 'flow-site-ssr', '0', '2017-09-01 14:24:00');

-- ----------------------------
-- Table structure for trx_tasks
-- ----------------------------
DROP TABLE IF EXISTS `trx_tasks`;
CREATE TABLE `trx_tasks` (
  `tt_id` int(11) NOT NULL AUTO_INCREMENT,
  `tt_title` varchar(255) DEFAULT NULL,
  `tt_status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`tt_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of trx_tasks
-- ----------------------------
INSERT INTO `trx_tasks` VALUES ('1', 'Create module bpmn', 'todo');
