/*
Navicat MySQL Data Transfer

Source Server         : mysql@go.vm
Source Server Version : 50554
Source Host           : 192.168.56.5:3306
Source Database       : wssales

Target Server Type    : MYSQL
Target Server Version : 50554
File Encoding         : 65001

Date: 2017-10-11 17:50:05
*/

SET FOREIGN_KEY_CHECKS=0;

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
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bpm_diagrams
-- ----------------------------
INSERT INTO `bpm_diagrams` VALUES ('52', 'Graph.diagram.type.Activity', 'Sales Flow', 'sales-flow', 'No diagram description', 'fb3ef7de300b1a7c3adce68126692190.jpg', '2017-09-18 09:14:51', null);

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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

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
INSERT INTO `bpm_forms` VALUES ('19', '825', 'Open Opportunity Form', 'No description', '012006cbc0b9b74aa58b83d36ad622e7.html', 'open_opportunity.html');
INSERT INTO `bpm_forms` VALUES ('20', '826', 'Submit Form', 'No description', '10bf0387b511128b39389ce65aafd2a0.html', 'submit.html');
INSERT INTO `bpm_forms` VALUES ('21', '827', 'Negotiation Form', 'No description', 'a86edf2e17c9c689362a4befbc6b4a20.html', 'negotiation.html');
INSERT INTO `bpm_forms` VALUES ('22', '828', 'PO Form', 'No description', '956fbcc20dec23f59b5a36602a534e82.html', 'po.html');

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
INSERT INTO `bpm_forms_roles` VALUES ('11', '19', '7');

-- ----------------------------
-- Table structure for bpm_forms_users
-- ----------------------------
DROP TABLE IF EXISTS `bpm_forms_users`;
CREATE TABLE `bpm_forms_users` (
  `bfu_id` int(11) NOT NULL AUTO_INCREMENT,
  `bfu_bf_id` int(11) DEFAULT NULL,
  `bfu_su_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`bfu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

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
INSERT INTO `bpm_forms_users` VALUES ('24', '19', '1');
INSERT INTO `bpm_forms_users` VALUES ('25', '20', '1');
INSERT INTO `bpm_forms_users` VALUES ('26', '21', '1');
INSERT INTO `bpm_forms_users` VALUES ('27', '22', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=639 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bpm_links
-- ----------------------------
INSERT INTO `bpm_links` VALUES ('629', null, 'graph-link-1', 'graph-shape-1', 'graph-shape-2', 'Graph.link.Orthogonal', 'orthogonal', '52', '825', '826', 'M454.7294246374472,72.6494465700595L454.72942463744675,127.64944657005893', '#000', 'Prospected', '0.50000', '1', '0', '6', '[{\"field\":\"ts_date_opportunity\",\"comparison\":\"is not null\",\"value\":\"\",\"operator\":\"\"}]');
INSERT INTO `bpm_links` VALUES ('630', null, 'graph-link-2', 'graph-shape-2', 'graph-shape-3', 'Graph.link.Orthogonal', 'orthogonal', '52', '826', '827', 'M454.72942463744926,187.6494465700588L454.7294246374479,250.64944657005876', '#000', 'Submited', '0.50000', '1', '0', '6', '[{\"field\":\"ts_date_submitted\",\"comparison\":\"is not null\",\"value\":\"\",\"operator\":\"\"}]');
INSERT INTO `bpm_links` VALUES ('631', null, 'graph-link-3', 'graph-shape-3', 'graph-shape-4', 'Graph.link.Orthogonal', 'orthogonal', '52', '827', '828', 'M454.72942463745346,310.6494465700598L454.7294246374503,380.649446570059', '#000', 'Negotiated', '0.50000', '1', '0', '6', '[{\"field\":\"ts_date_negotiated\",\"comparison\":\"is not null\",\"value\":\"\",\"operator\":\"\"}]');
INSERT INTO `bpm_links` VALUES ('632', null, 'graph-link-4', 'graph-shape-4', 'graph-shape-5', 'Graph.link.Orthogonal', 'orthogonal', '52', '828', '833', 'M454.7294246374486,440.64944657005833L454.7294246374463,489.649446570059', '#000', 'PO Received', '0.50000', '1', '0', '6', '[{\"field\":\"ts_date_po\",\"comparison\":\"is not null\",\"value\":\"\",\"operator\":\"\"}]');
INSERT INTO `bpm_links` VALUES ('637', null, 'graph-link-5', 'graph-shape-2', 'graph-shape-6', 'Graph.link.Orthogonal', 'orthogonal', '52', '826', '836', 'M525,158.0657894736856L676,158.06578947368106L676,280.9342105263148L754,280.93421052631487', '#000', '', '0.50000', '1', '0', '6', '[{\"field\":\"\",\"comparison\":\"\",\"value\":\"\",\"operator\":\"\"}]');
INSERT INTO `bpm_links` VALUES ('638', null, 'graph-link-6', 'graph-shape-6', 'graph-shape-4', 'Graph.link.Orthogonal', 'orthogonal', '52', '836', '828', 'M824.0000000000005,311.00000000000017L823.9999999999986,411L525,410.9999999999887', '#000', '', '0.50000', '1', '0', '6', '[]');

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
) ENGINE=InnoDB AUTO_INCREMENT=837 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bpm_shapes
-- ----------------------------
INSERT INTO `bpm_shapes` VALUES ('825', 'graph-shape-1', null, null, 'Graph.shape.activity.Start', null, '52', null, '60', '60', '425', '13', '0', 'Opportunity', 'rgb(255, 255, 255)', 'rgb(0, 0, 0)', '2', '[]');
INSERT INTO `bpm_shapes` VALUES ('826', 'graph-shape-2', null, null, 'Graph.shape.activity.Action', null, '52', null, '140', '60', '385', '128', '0', 'Submit', 'rgb(255, 255, 255)', 'rgb(0, 0, 0)', '2', '[]');
INSERT INTO `bpm_shapes` VALUES ('827', 'graph-shape-3', null, null, 'Graph.shape.activity.Action', null, '52', null, '140', '60', '385', '251', '0', 'Negotiation', 'rgb(255, 255, 255)', 'rgb(0, 0, 0)', '2', '[]');
INSERT INTO `bpm_shapes` VALUES ('828', 'graph-shape-4', null, null, 'Graph.shape.activity.Action', null, '52', null, '140', '60', '385', '381', '0', 'PO', 'rgb(255, 255, 255)', 'rgb(0, 0, 0)', '2', '[]');
INSERT INTO `bpm_shapes` VALUES ('833', 'graph-shape-5', null, null, 'Graph.shape.activity.Final', null, '52', null, '60', '60', '425', '490', '0', 'End', '#FF4081', 'rgb(0, 0, 0)', '2', '[]');
INSERT INTO `bpm_shapes` VALUES ('836', 'graph-shape-6', null, null, 'Graph.shape.activity.Action', null, '52', null, '140', '60', '754', '251', '0', 'Approval', 'rgb(255, 255, 255)', 'rgb(0, 0, 0)', '2', '[]');

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
INSERT INTO `dx_profiles` VALUES ('1', 'example', 'Example profile', '1', 'B', '2', '1', null);
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
INSERT INTO `kanban_panels` VALUES ('55', '17', 'Panel', 'var(--paper-purple-500)', '0');
INSERT INTO `kanban_panels` VALUES ('56', '17', 'Panel', 'var(--paper-indigo-500)', '1');
INSERT INTO `kanban_panels` VALUES ('57', '17', 'Panel', 'var(--paper-indigo-500)', '2');
INSERT INTO `kanban_panels` VALUES ('58', '18', 'Panel', 'var(--paper-amber-500)', '0');
INSERT INTO `kanban_panels` VALUES ('59', '18', 'Panel', 'var(--paper-amber-500)', '1');
INSERT INTO `kanban_panels` VALUES ('60', '18', 'Panel', 'var(--paper-indigo-500)', '2');

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
INSERT INTO `kanban_settings` VALUES ('17', 'Document Flow', 'No description', null);
INSERT INTO `kanban_settings` VALUES ('18', 'Approval Flow', 'No description', null);

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
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of kanban_statuses
-- ----------------------------
INSERT INTO `kanban_statuses` VALUES ('49', '51', '52', '629', '#000');
INSERT INTO `kanban_statuses` VALUES ('50', '52', '52', '630', '#000');
INSERT INTO `kanban_statuses` VALUES ('51', '53', '52', '631', '#000');
INSERT INTO `kanban_statuses` VALUES ('52', '54', '52', '632', '#000');

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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mst_customers
-- ----------------------------
INSERT INTO `mst_customers` VALUES ('1', 'Gudang Garam', 'John Doe', '(021) 1234567', 'sales@company.com');
INSERT INTO `mst_customers` VALUES ('2', 'Indofood', 'John Doe', '(021) 1234567', 'sales@company.com');
INSERT INTO `mst_customers` VALUES ('3', 'XL Axiata', 'John Doe', '(021) 1234567', 'sales@company.com');
INSERT INTO `mst_customers` VALUES ('4', 'Indosat', 'John Doe', '(021) 1234567', 'sales@company.com');
INSERT INTO `mst_customers` VALUES ('5', 'Telkomsel', 'John Doe', '(021) 1234567', 'sales@company.com');
INSERT INTO `mst_customers` VALUES ('6', 'Sampoerna', 'John Doe', '(021) 1234567', 'sales@company.com');
INSERT INTO `mst_customers` VALUES ('7', 'Net Mediatama', 'John Doe', '(021) 1234567', 'sales@company.com');
INSERT INTO `mst_customers` VALUES ('8', 'Rajawali Citra', 'John Doe', '(021) 1234567', 'sales@company.com');
INSERT INTO `mst_customers` VALUES ('9', 'Trans Media', 'John Doe', '(021) 1234567', 'sales@company.com');

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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES ('1', 'app_id', '21000182918');
INSERT INTO `sys_config` VALUES ('3', 'app_title', 'WS SALES');
INSERT INTO `sys_config` VALUES ('4', 'app_version', '1.0.0');
INSERT INTO `sys_config` VALUES ('5', 'app_description', 'Sales force application based on worksaurus platform');
INSERT INTO `sys_config` VALUES ('6', 'app_keywords', '');
INSERT INTO `sys_config` VALUES ('7', 'app_author', 'Kreasindo Cipta Teknologi');
INSERT INTO `sys_config` VALUES ('8', 'app_repository', '');
INSERT INTO `sys_config` VALUES ('12', 'app_token', '66c3ff424414b74560788b53434baf309a7b510c5a4ec33f65932671af73f2a5');

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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_menus
-- ----------------------------
INSERT INTO `sys_menus` VALUES ('1', '0', 'Homepage', 'social:public', '/home', '1', '1');
INSERT INTO `sys_menus` VALUES ('3', '0', 'Dashboard', 'dashboard', '/dashboard', '2', '1');
INSERT INTO `sys_menus` VALUES ('4', '0', 'Worksheet', 'view-carousel', '/kanban', '3', '1');
INSERT INTO `sys_menus` VALUES ('5', '11', 'Calendar', 'today', '/calendar', '53', '1');
INSERT INTO `sys_menus` VALUES ('6', '11', 'Ganttchart', 'image:tune', '/components/gantt', '52', '0');
INSERT INTO `sys_menus` VALUES ('7', '0', 'Settings', 'device:usb', '/settings', '7', '1');
INSERT INTO `sys_menus` VALUES ('8', '0', 'Datagrid', 'editor:border-all', '/components/datagrid', '99', '0');
INSERT INTO `sys_menus` VALUES ('9', '0', 'Maps', 'maps:map', '/components/maps', '6', '1');
INSERT INTO `sys_menus` VALUES ('11', '0', 'Components', 'device:widgets', '', '99', '1');
INSERT INTO `sys_menus` VALUES ('16', '0', 'Customer Data', 'account-circle', '/customers', '5', '1');
INSERT INTO `sys_menus` VALUES ('17', '0', 'Leads', 'communication:phone', '/leads', '4', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sys_modules
-- ----------------------------
INSERT INTO `sys_modules` VALUES ('4', 'bpmn', '1.0.0', 'Workflow', 'KCT Team', null, '/bpmn');
INSERT INTO `sys_modules` VALUES ('5', 'home', '1.0.0', 'Homepage', 'KCT Team', null, '/home');
INSERT INTO `sys_modules` VALUES ('7', 'roles', '1.0.0', 'Roles', 'KCT Team', null, '/roles');
INSERT INTO `sys_modules` VALUES ('8', 'users', '1.0.0', 'Users', 'KCT Team', null, '/users');
INSERT INTO `sys_modules` VALUES ('9', 'modules', '1.0.0', 'Modules', 'KCT Team', null, '/modules');
INSERT INTO `sys_modules` VALUES ('10', 'kanban', '1.0.0', 'Worksheet', 'KCT Team', null, '/kanban');
INSERT INTO `sys_modules` VALUES ('12', 'ABC', '1.0.0', 'Module ABC', 'KCT Team', null, '/abc');
INSERT INTO `sys_modules` VALUES ('13', 'dashboard', '1.0.0', 'Dashboard', 'KCT Team', null, '/dashboard');
INSERT INTO `sys_modules` VALUES ('14', 'leads', '1.0.0', 'Leads', 'KCT Team', null, '/leads');
INSERT INTO `sys_modules` VALUES ('15', 'settings', '1.0.0', 'Settings', 'KCT Team', null, '/settings');
INSERT INTO `sys_modules` VALUES ('16', 'calendar', '1.0.0', 'Calendar', 'KCT Team', null, '/calendar');
INSERT INTO `sys_modules` VALUES ('17', 'maps', '1.0.0', 'Maps', 'KCT Team', null, '/components/maps');

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
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sys_modules_capabilities
-- ----------------------------
INSERT INTO `sys_modules_capabilities` VALUES ('20', '10', 'CREATE', 'Add new worksheet setting');
INSERT INTO `sys_modules_capabilities` VALUES ('21', '10', 'CREATE_PANEL', 'Add panel to worksheet');
INSERT INTO `sys_modules_capabilities` VALUES ('22', '5', 'update', 'Display button edit');
INSERT INTO `sys_modules_capabilities` VALUES ('26', '14', 'add', 'Add data');
INSERT INTO `sys_modules_capabilities` VALUES ('27', '14', 'edit', 'Edit data');
INSERT INTO `sys_modules_capabilities` VALUES ('28', '14', 'remove', 'remove data');

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_numbers
-- ----------------------------
INSERT INTO `sys_numbers` VALUES ('1', 'SALES_TICKET', '26', '5', 'SP', null);

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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sys_roles
-- ----------------------------
INSERT INTO `sys_roles` VALUES ('4', 'Administator', 'administator', 'Role for administrator user', '0', '2017-05-24 18:48:45', 'system');
INSERT INTO `sys_roles` VALUES ('7', 'General Manager', 'general-manager', 'Role for general manager', '0', '2017-09-18 09:00:50', 'system');
INSERT INTO `sys_roles` VALUES ('8', 'Sales Manager', 'sales-manager', 'Role for sales manager', '0', '2017-09-18 09:00:58', 'system');
INSERT INTO `sys_roles` VALUES ('9', 'Account Manager', 'account-manager', 'Role for account manager', '0', '2017-09-18 09:01:09', 'system');

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
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_roles_kanban
-- ----------------------------
INSERT INTO `sys_roles_kanban` VALUES ('16', '4', '16', '1');
INSERT INTO `sys_roles_kanban` VALUES ('17', '4', '17', '1');
INSERT INTO `sys_roles_kanban` VALUES ('18', '4', '18', '1');
INSERT INTO `sys_roles_kanban` VALUES ('19', '7', '16', '1');
INSERT INTO `sys_roles_kanban` VALUES ('20', '7', '17', '1');
INSERT INTO `sys_roles_kanban` VALUES ('21', '7', '18', '1');
INSERT INTO `sys_roles_kanban` VALUES ('22', '8', '16', '1');
INSERT INTO `sys_roles_kanban` VALUES ('23', '8', '17', '1');
INSERT INTO `sys_roles_kanban` VALUES ('24', '8', '18', '1');
INSERT INTO `sys_roles_kanban` VALUES ('25', '9', '16', '1');
INSERT INTO `sys_roles_kanban` VALUES ('26', '9', '17', '1');
INSERT INTO `sys_roles_kanban` VALUES ('27', '9', '18', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_roles_menus
-- ----------------------------
INSERT INTO `sys_roles_menus` VALUES ('1', '4', '1', '1');
INSERT INTO `sys_roles_menus` VALUES ('2', '4', '4', '1');
INSERT INTO `sys_roles_menus` VALUES ('3', '4', '3', '1');
INSERT INTO `sys_roles_menus` VALUES ('4', '4', '17', '1');
INSERT INTO `sys_roles_menus` VALUES ('5', '4', '7', '1');
INSERT INTO `sys_roles_menus` VALUES ('6', '4', '5', '1');
INSERT INTO `sys_roles_menus` VALUES ('7', '4', '9', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_roles_permissions
-- ----------------------------
INSERT INTO `sys_roles_permissions` VALUES ('1', '4', '22', '1');
INSERT INTO `sys_roles_permissions` VALUES ('2', '4', '23', '0');
INSERT INTO `sys_roles_permissions` VALUES ('3', '4', '20', '1');
INSERT INTO `sys_roles_permissions` VALUES ('4', '4', '21', '1');
INSERT INTO `sys_roles_permissions` VALUES ('5', '4', '26', '1');
INSERT INTO `sys_roles_permissions` VALUES ('6', '4', '27', '1');
INSERT INTO `sys_roles_permissions` VALUES ('7', '4', '28', '1');
INSERT INTO `sys_roles_permissions` VALUES ('8', '7', '22', '1');
INSERT INTO `sys_roles_permissions` VALUES ('9', '7', '23', '1');

-- ----------------------------
-- Table structure for sys_users
-- ----------------------------
DROP TABLE IF EXISTS `sys_users`;
CREATE TABLE `sys_users` (
  `su_id` int(11) NOT NULL AUTO_INCREMENT,
  `su_sr_id` int(11) DEFAULT NULL,
  `su_email` varchar(255) DEFAULT NULL,
  `su_passwd` varchar(255) DEFAULT NULL,
  `su_fullname` varchar(255) DEFAULT NULL,
  `su_phone` varchar(30) DEFAULT NULL,
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
INSERT INTO `sys_users` VALUES ('1', '4', 'roso@kct.co.id', '$2y$08$dWZ2bnZPZGlZTFRzcFM3O.0H1nj9De85nlg47ErMwBPwhnDzCJlFq', 'Roso Sasongko', null, 'defaults/avatar-0.png', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJpYXQiOjE1MDcyODUzMzQsImp0aSI6IkxRNVducWVpK3pJanJTSUpiaXRSVmRyMVU0Y2lWRUNzTzUxV1MrUFRTR1U9IiwiaXNzIjoiS3JlYXNpbmRvIENpcHRhIFRla25vbG9naSIsIm5iZiI6MTUwNzI4NTMzNSwiZXhwIjoxNTA3MzY5MzM1LCJkYXRhIjp7InN1X2VtYWlsIjoicm9zb0', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJpYXQiOjE1MDcyODUzMzQsImp0aSI6ImtSREw3NE55NmFiZWdxRHBQZ2w3akhSZ0pVTXRQUkxYbGttWHdOWFRld0E9IiwiaXNzIjoiS3JlYXNpbmRvIENpcHRhIFRla25vbG9naSIsIm5iZiI6MTUwNzI4NTMzNSwiZXhwIjoxNTA3MzkzMzM1LCJkYXRhIjpudWxsfQ.KEEEm3DFhG11QCV', 'Male', '1985-07-03', 'Programmer', 'Kreasindo Cipta Teknologi', '1', '2017-04-27 20:52:36', 'system');
INSERT INTO `sys_users` VALUES ('2', '4', 'vidi@kct.co.id', '$2y$08$MVg1UndEeTVGRWJrL1BxS.DUf6A5rt36rq9CByczAtresY5PvVykO', 'Vidi Meylan', null, 'vidi_kct_co_id.png', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJpYXQiOjE0OTM4NzczNTUsImp0aSI6ImJaTzgzMFZnTmMzOXlpaGc5Wk02WlBlNTR3WURlK0pjVEZYbytVelFDOFU9IiwiaXNzIjoiS3JlYXNpbmRvIENpcHRhIFRla25vbG9naSIsIm5iZiI6MTQ5Mzg3NzM1NiwiZXhwIjoxNDkzOTYxMzU2LCJkYXRhIjp7InN1X2VtYWlsIjoidmlkaU', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJpYXQiOjE0OTM4NzczNTUsImp0aSI6ImF3VXJ6cFIrVGJqaGNyMDJGZ01wNENhSUxOSmpUdTVSTXhFXC9HUTMydlEwPSIsImlzcyI6IktyZWFzaW5kbyBDaXB0YSBUZWtub2xvZ2kiLCJuYmYiOjE0OTM4NzczNTYsImV4cCI6MTQ5Mzk4NTM1NiwiZGF0YSI6bnVsbH0.UjnERoG8tMcfLB', null, null, null, null, '1', '2017-05-04 05:55:15', 'system');
INSERT INTO `sys_users` VALUES ('3', '4', 'cahya@kct.co.id', '$2y$08$JInjOtkULdYcwjnWPXwUL.V5ZUAn8rANXsYliJDdPXrS9bUnS/QfW', 'Cahya Dyzin', null, 'defaults/avatar-0.png', null, null, 'Male', null, null, null, '1', '2017-05-04 06:24:39', 'system');
INSERT INTO `sys_users` VALUES ('4', '4', 'wili@kct.co.id', '$2y$08$JD1lu23K6va7KJlh7x1o6uMN55nAUsQjFUFcH9o8AFPTitLBS8Y0y', 'Wiliarko M.', null, 'defaults/avatar-0.png', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJpYXQiOjE0OTM4ODMzMjEsImp0aSI6IlhYaERLUTBSUmtweVBKVEJYbkJNQ3ZaZzU1UnRBWXpiVUVFQkFldEZRZVU9IiwiaXNzIjoiS3JlYXNpbmRvIENpcHRhIFRla25vbG9naSIsIm5iZiI6MTQ5Mzg4MzMyMiwiZXhwIjoxNDkzOTY3MzIyLCJkYXRhIjp7InN1X2VtYWlsIjoiam9obk', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJpYXQiOjE0OTM4ODMzMjEsImp0aSI6IktjdFwvRG5pWWZVUlRPY2lTZ1VJVEEwNHFIXC91dlJvYW9cL05vcVJaUmNUanc9IiwiaXNzIjoiS3JlYXNpbmRvIENpcHRhIFRla25vbG9naSIsIm5iZiI6MTQ5Mzg4MzMyMiwiZXhwIjoxNDkzOTkxMzIyLCJkYXRhIjpudWxsfQ.rQO76C44g9N', null, null, null, null, '1', '2017-05-04 07:20:15', 'system');
INSERT INTO `sys_users` VALUES ('7', '4', 'said@kct.co.id', '$2y$08$swEfrnafombDpMRGinkU2u2NsCet8xnfpuZdoeF90cMrpWgZ5TyHS', 'Said M Fahmi', null, 'avatar5.png', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJpYXQiOjE1MDc2Njk1MzAsImp0aSI6InFYUko1K3dzSlRWWkdBVWxWZ2U2R3g2dER0VzlyeDF1cXo0WGlZNVwvelpvPSIsImlzcyI6IktyZWFzaW5kbyBDaXB0YSBUZWtub2xvZ2kiLCJuYmYiOjE1MDc2Njk1MzEsImV4cCI6MTUwNzc1MzUzMSwiZGF0YSI6eyJzdV9lbWFpbCI6InNhaW', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJpYXQiOjE1MDc2Njk1MzAsImp0aSI6IkpIcithNHJiaGJwbit4R2VVTmpwSHd5aHhGZGVveUJGRmFMWStWNlNmakE9IiwiaXNzIjoiS3JlYXNpbmRvIENpcHRhIFRla25vbG9naSIsIm5iZiI6MTUwNzY2OTUzMSwiZXhwIjoxNTA3Nzc3NTMxLCJkYXRhIjpudWxsfQ.jUJlzxoNlnKKjE_', null, null, null, null, '1', '2017-08-04 15:12:15', 'system');

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_users_kanban
-- ----------------------------
INSERT INTO `sys_users_kanban` VALUES ('1', '7', '16', '1');
INSERT INTO `sys_users_kanban` VALUES ('2', '7', '17', '1');
INSERT INTO `sys_users_kanban` VALUES ('3', '7', '18', '1');
INSERT INTO `sys_users_kanban` VALUES ('4', '1', '16', '1');
INSERT INTO `sys_users_kanban` VALUES ('5', '1', '17', '0');
INSERT INTO `sys_users_kanban` VALUES ('6', '1', '18', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_users_menus
-- ----------------------------
INSERT INTO `sys_users_menus` VALUES ('7', '7', '1', '1');
INSERT INTO `sys_users_menus` VALUES ('8', '7', '4', '1');
INSERT INTO `sys_users_menus` VALUES ('9', '7', '3', '1');
INSERT INTO `sys_users_menus` VALUES ('10', '7', '17', '1');
INSERT INTO `sys_users_menus` VALUES ('11', '7', '7', '1');
INSERT INTO `sys_users_menus` VALUES ('12', '7', '5', '1');
INSERT INTO `sys_users_menus` VALUES ('13', '7', '9', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_users_permissions
-- ----------------------------
INSERT INTO `sys_users_permissions` VALUES ('14', '7', '22', '1');
INSERT INTO `sys_users_permissions` VALUES ('15', '7', '20', '1');
INSERT INTO `sys_users_permissions` VALUES ('16', '7', '21', '1');
INSERT INTO `sys_users_permissions` VALUES ('17', '7', '26', '1');
INSERT INTO `sys_users_permissions` VALUES ('18', '7', '27', '0');
INSERT INTO `sys_users_permissions` VALUES ('19', '7', '28', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of trx_leads
-- ----------------------------
INSERT INTO `trx_leads` VALUES ('1', '1', 'HOT', '-');

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
  `ts_amounts` double(15,2) DEFAULT NULL,
  `ts_products` varchar(100) DEFAULT NULL,
  `ts_date_opportunity` varchar(30) DEFAULT NULL,
  `ts_date_submitted` varchar(30) DEFAULT NULL,
  `ts_date_negotiated` varchar(30) DEFAULT NULL,
  `ts_date_po` varchar(30) DEFAULT NULL,
  `ts_date_closed` varchar(30) DEFAULT NULL,
  `ts_expected_date_closed` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`ts_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of trx_sales
-- ----------------------------
INSERT INTO `trx_sales` VALUES ('1', 'SP00024', '1', '1250000.00', 'A', '2017-09-28', null, null, null, null, null);
INSERT INTO `trx_sales` VALUES ('2', 'SP00025', null, '56000.00', null, '2017-10-03', null, null, null, null, '2017-10-03');
INSERT INTO `trx_sales` VALUES ('3', 'SP00026', null, '75000.00', null, '2017-10-03', null, null, null, null, '2017-10-03');

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of trx_sales_statuses
-- ----------------------------
INSERT INTO `trx_sales_statuses` VALUES ('1', '1', '629', '826', 'sales-flow', '0', '2017-09-28 09:05:55');
INSERT INTO `trx_sales_statuses` VALUES ('2', '2', '629', '826', 'sales-flow', '0', '2017-10-03 11:45:31');
INSERT INTO `trx_sales_statuses` VALUES ('3', '3', '629', '826', 'sales-flow', '0', '2017-10-03 11:45:31');

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
