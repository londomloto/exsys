/*
Navicat MySQL Data Transfer

Source Server         : mysql@go.vm
Source Server Version : 50554
Source Host           : 192.168.56.5:3306
Source Database       : demo

Target Server Type    : MYSQL
Target Server Version : 50554
File Encoding         : 65001

Date: 2017-08-07 03:51:11
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
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bpm_diagrams
-- ----------------------------
INSERT INTO `bpm_diagrams` VALUES ('49', 'Graph.diagram.type.Activity', 'Document Approval', 'document-approval', 'No diagram description', '3d5c83afefb72acaf34678c1bb12c513.jpg', '2017-06-07 11:30:14', null);
INSERT INTO `bpm_diagrams` VALUES ('50', 'Graph.diagram.type.Activity', 'Flow Site SSR', 'flow-site-ssr', 'No diagram description', 'c5db81d1e7b0eb1500e270514f3aa585.jpg', '2017-08-04 15:30:12', null);

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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

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

-- ----------------------------
-- Table structure for bpm_forms_roles
-- ----------------------------
DROP TABLE IF EXISTS `bpm_forms_roles`;
CREATE TABLE `bpm_forms_roles` (
  `bfr_id` int(11) NOT NULL AUTO_INCREMENT,
  `bfr_bf_id` int(11) DEFAULT NULL,
  `bfr_sr_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`bfr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bpm_forms_roles
-- ----------------------------
INSERT INTO `bpm_forms_roles` VALUES ('9', '12', '1');
INSERT INTO `bpm_forms_roles` VALUES ('10', '13', '1');

-- ----------------------------
-- Table structure for bpm_forms_users
-- ----------------------------
DROP TABLE IF EXISTS `bpm_forms_users`;
CREATE TABLE `bpm_forms_users` (
  `bfu_id` int(11) NOT NULL AUTO_INCREMENT,
  `bfu_bf_id` int(11) DEFAULT NULL,
  `bfu_su_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`bfu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=621 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bpm_links
-- ----------------------------
INSERT INTO `bpm_links` VALUES ('396', 'START', 'graph-link-1', 'graph-shape-2', 'graph-shape-3', 'Graph.link.Orthogonal', 'orthogonal', '49', '482', '483', 'M177.83908752787897,136.12316657107425L377.2434725330551,136.1231665710718', '#000', 'Start', '0.50000', '1', '0', '6', '[]');
INSERT INTO `bpm_links` VALUES ('397', 'DRAFT', 'graph-link-2', 'graph-shape-3', 'graph-shape-5', 'Graph.link.Orthogonal', 'orthogonal', '49', '483', '485', 'M447.243472533054,166.1231665710737L447.2434725328829,296.0645965116414', '#000', 'Draft', '0.39735', '1', '0', '6', '[]');
INSERT INTO `bpm_links` VALUES ('398', 'APPROVED-BY-SPV', 'graph-link-3', 'graph-shape-5', 'graph-shape-7', 'Graph.link.Orthogonal', 'orthogonal', '49', '485', '487', 'M377.2433845396901,325.661571299836L251.1005273968329,325.6615712998273L251.1005273968333,485.67786083980627', '#000', 'Approved by spv', '0.33679', '1', '0', '6', '[]');
INSERT INTO `bpm_links` VALUES ('399', 'REJECTED-BY-SPV', 'graph-link-4', 'graph-shape-5', 'graph-shape-8', 'Graph.link.Orthogonal', 'orthogonal', '49', '485', '488', 'M517.2434725328824,325.6615712998325L708.3852536737958,325.66157129983173L708.3852536737958,695.8650183498571L476.7977836344425,695.865018349856', '#000', 'Rejected by spv', '0.50000', '1', '0', '6', '[]');
INSERT INTO `bpm_links` VALUES ('400', 'REJECTED-BY-MGR', 'graph-link-5', 'graph-shape-7', 'graph-shape-8', 'Graph.link.Orthogonal', 'orthogonal', '49', '487', '488', 'M181.10052739683374,513.381287567703L121.69520786652829,513.3812875677033L121.69520786652829,695.8650183498348L417.60637765806104,695.8650183498344', '#000', 'Rejected by manager', '0.25551', '1', '0', '6', '[]');
INSERT INTO `bpm_links` VALUES ('401', 'APPROVED-BY-MGR', 'graph-link-6', 'graph-shape-7', 'graph-shape-9', 'Graph.link.Orthogonal', 'orthogonal', '49', '487', '489', 'M321.1005273968337,515.6778608398067L469.2433845396901,515.6778608398067', '#000', 'Approved by manager', '0.50000', '1', '0', '6', '[]');
INSERT INTO `bpm_links` VALUES ('402', null, 'graph-link-7', 'graph-shape-9', 'graph-shape-8', 'Graph.link.Orthogonal', 'orthogonal', '49', '489', '488', 'M578.8579989731376,545.6778608398048L578.8579989731362,616.873133400879L447.2434725328664,616.873133400879L447.24347253286334,667.6778767630948', '#000', 'Document completed', '0.19423', '1', '0', '6', '[]');
INSERT INTO `bpm_links` VALUES ('607', null, 'graph-link-57', 'graph-shape-74', 'graph-shape-75', 'Graph.link.Orthogonal', 'orthogonal', '50', '808', '809', 'M209.09570298818917,131.0000000000006L443,131.00000000000065', '#000', 'Site Planning', '0.49700', '1', '0', '6', '[{\"field\":\"tsp_date_upload\",\"comparison\":\"is not null\",\"value\":\"\",\"operator\":\"\"}]');
INSERT INTO `bpm_links` VALUES ('608', null, 'graph-link-58', 'graph-shape-75', 'graph-shape-79', 'Graph.link.Orthogonal', 'orthogonal', '50', '809', '813', 'M513.0147754857599,160.58814936571332L513.0148785791251,475.58814936571275', '#000', 'Site Plan Approved', '0.39088', '1', '0', '6', '[{\"field\":\"tsp_date_approve\",\"comparison\":\"is not null\",\"value\":\"\",\"operator\":\"\"}]');
INSERT INTO `bpm_links` VALUES ('609', null, 'graph-link-59', 'graph-shape-75', 'graph-shape-76', 'Graph.link.Orthogonal', 'orthogonal', '50', '809', '810', 'M487.06484720298363,160.5881493657141L487.0648472029825,244.1229140156788L249.5145218914771,244.12291401567896', '#000', 'Site Plan Rejected', '0.50026', '1', '0', '6', '[{\"field\":\"tsp_is_rejected\",\"comparison\":\"=\",\"value\":\"1\",\"operator\":\"\"}]');
INSERT INTO `bpm_links` VALUES ('610', null, 'graph-link-60', 'graph-shape-79', 'graph-shape-81', 'Graph.link.Orthogonal', 'orthogonal', '50', '813', '815', 'M443.01487890640567,497.88784409487664L282.95916800038435,497.88784409487744L282.95916800038185,650.588149365713', '#000', 'Power Not Complete', '0.30375', '1', '0', '6', '[{\"field\":\"tss_bss_date_upload\",\"comparison\":\"is not null\",\"value\":\"\",\"operator\":\"\"}]');
INSERT INTO `bpm_links` VALUES ('611', null, 'graph-link-61', 'graph-shape-79', 'graph-shape-85', 'Graph.link.Orthogonal', 'orthogonal', '50', '813', '819', 'M583.0148789064057,517.9639607404197L797.7626249273885,517.9639607404205L797.7626249273951,1098.588149365713', '#000', 'Trm Not Complete', '0.50000', '1', '0', '6', '[{\"field\":\"tss_bss_date_upload\",\"comparison\":\"is not null\",\"value\":\"\",\"operator\":\"\"}]');
INSERT INTO `bpm_links` VALUES ('612', null, 'graph-link-62', 'graph-shape-79', 'graph-shape-87', 'Graph.link.Orthogonal', 'orthogonal', '50', '813', '821', 'M525.7730175635033,535.58814936571L525.7730175635033,757.3238701489961L166.4335856367778,757.3238701489961L166.43358563677688,1323.58814936571', '#000', 'BSS Complate', '0.24677', '1', '0', '6', '[{\"field\":\"tss_bss_date_upload\",\"comparison\":\"is not null\",\"value\":\"\",\"operator\":\"\"}]');
INSERT INTO `bpm_links` VALUES ('613', null, 'graph-link-63', 'graph-shape-79', 'graph-shape-77', 'Graph.link.Orthogonal', 'orthogonal', '50', '813', '811', 'M583.0148789064069,499.5474205242067L799.1972986592892,499.5474205242059L799.1972986592906,161.00000000000009', '#000', 'Netplan Not Complete', '0.76527', '1', '0', '6', '[{\"field\":\"tss_bss_date_upload\",\"comparison\":\"is not null\",\"value\":\"\",\"operator\":\"\"}]');
INSERT INTO `bpm_links` VALUES ('614', null, 'graph-link-64', 'graph-shape-81', 'graph-shape-87', 'Graph.link.Orthogonal', 'orthogonal', '50', '815', '821', 'M209.01477515847876,676.6757863808973L131.55345394121727,676.6757863808972L131.55345394121647,1323.588149365717', '#000', 'Power Complete', '0.08887', '1', '0', '6', '[]');
INSERT INTO `bpm_links` VALUES ('615', null, 'graph-link-65', 'graph-shape-83', 'graph-shape-87', 'Graph.link.Orthogonal', 'orthogonal', '50', '817', '821', 'M460,905.1926422596603L196.4465441777446,905.1926422596606L196.4465441777329,1323.5881493657096', '#000', 'Civil Complete', '0.10071', '1', '0', '6', '[{\"field\":\"tss_date_power\",\"comparison\":\"is not null\",\"value\":\"\",\"operator\":\"\"},{\"field\":\"tss_power\",\"comparison\":\"is not null\",\"value\":\"\",\"operator\":\"\"}]');
INSERT INTO `bpm_links` VALUES ('616', null, 'graph-link-66', 'graph-shape-85', 'graph-shape-83', 'Graph.link.Orthogonal', 'orthogonal', '50', '819', '817', 'M769.0426137052518,1098.5881493657107L769.0426137052548,902.5494892611989L599.9999999999959,902.5494892612011', '#000', 'Civil Not Complete', '0.79092', '1', '0', '6', '[{\"field\":\"tss_date_trm_review\",\"comparison\":\"is not null\",\"value\":\"\",\"operator\":\"\"}]');
INSERT INTO `bpm_links` VALUES ('617', null, 'graph-link-67', 'graph-shape-85', 'graph-shape-87', 'Graph.link.Orthogonal', 'orthogonal', '50', '819', '821', 'M732.0147751584808,1137.0127480939489L229.17734159622267,1137.012748093947L229.17734159621926,1323.5881493657146', '#000', 'Trm Complete', '0.08703', '1', '0', '6', '[{\"field\":\"tss_date_trm_review\",\"comparison\":\"is not null\",\"value\":\"\",\"operator\":\"\"}]');
INSERT INTO `bpm_links` VALUES ('618', null, 'graph-link-68', 'graph-shape-77', 'graph-shape-87', 'Graph.link.Orthogonal', 'orthogonal', '50', '811', '821', 'M871.9999410613665,127.91585654421358L958.0209191365202,127.91585654421394L958.0209191365202,1354L259,1353.9999999999427', '#000', 'Netplan Complete', '0.41443', '1', '0', '6', '[{\"field\":\"tss_date_netplan\",\"comparison\":\"is not null\",\"value\":\"\",\"operator\":\"\"},{\"field\":\"tss_proj_def\",\"comparison\":\"is not null\",\"value\":\"\",\"operator\":\"\"}]');
INSERT INTO `bpm_links` VALUES ('619', null, 'graph-link-69', 'graph-shape-87', 'graph-shape-90', 'Graph.link.Orthogonal', 'orthogonal', '50', '821', '824', 'M152.84693742598955,1384L152.84693742599032,1653.392641079716', '#000', 'Sent To Sitac', '0.78186', '1', '0', '6', '[{\"field\":\"tss_request_type\",\"comparison\":\"=\",\"value\":\"NEW\",\"operator\":\"\"}]');
INSERT INTO `bpm_links` VALUES ('620', null, 'graph-link-70', 'graph-shape-87', 'graph-shape-88', 'Graph.link.Orthogonal', 'orthogonal', '50', '821', '822', 'M205.12858074915627,1383.9999999999993L205.1285807491546,1445.6743748190288L529.4616321818355,1445.6743748190604', '#000', 'Sent To NDC', '0.83062', '1', '0', '6', '[{\"field\":\"tss_request_type\",\"comparison\":\"=\",\"value\":\"ADD ON\",\"operator\":\"\"}]');

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
) ENGINE=InnoDB AUTO_INCREMENT=825 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bpm_shapes
-- ----------------------------
INSERT INTO `bpm_shapes` VALUES ('481', 'graph-shape-1', null, 'pool-1', 'Graph.shape.activity.Lane', null, '49', null, '769', '200', '47', '40', '0', 'Admin Role', 'rgb(255, 255, 255)', 'rgb(0, 0, 0)', '2', '[]');
INSERT INTO `bpm_shapes` VALUES ('482', 'graph-shape-2', 'graph-shape-1', null, 'Graph.shape.activity.Start', null, '49', '481', '60', '60', '21', '66', '0', 'Start', 'rgb(255, 255, 255)', 'rgb(0, 0, 0)', '2', '[]');
INSERT INTO `bpm_shapes` VALUES ('483', 'graph-shape-3', 'graph-shape-1', null, 'Graph.shape.activity.Action', null, '49', '481', '140', '60', '280', '66', '0', 'Submit Data', 'rgb(255, 255, 255)', 'rgb(0, 0, 0)', '2', '[]');
INSERT INTO `bpm_shapes` VALUES ('484', 'graph-shape-4', null, 'pool-1', 'Graph.shape.activity.Lane', null, '49', null, '769', '203', '47', '240', '0', 'Supervisor Role', 'rgb(255, 255, 255)', 'rgb(0, 0, 0)', '2', '[]');
INSERT INTO `bpm_shapes` VALUES ('485', 'graph-shape-5', 'graph-shape-4', null, 'Graph.shape.activity.Action', null, '49', '484', '140', '60', '280', '56', '0', 'Approval Supervisor', 'rgb(255, 255, 255)', 'rgb(0, 0, 0)', '2', '[]');
INSERT INTO `bpm_shapes` VALUES ('486', 'graph-shape-6', null, 'pool-1', 'Graph.shape.activity.Lane', null, '49', null, '769', '336', '47', '443', '0', 'Manager Role', 'rgb(255, 255, 255)', 'rgb(0, 0, 0)', '2', '[]');
INSERT INTO `bpm_shapes` VALUES ('487', 'graph-shape-7', 'graph-shape-6', null, 'Graph.shape.activity.Action', null, '49', '486', '140', '60', '84', '43', '0', 'Approval Manager', 'rgb(255, 255, 255)', 'rgb(0, 0, 0)', '2', '[]');
INSERT INTO `bpm_shapes` VALUES ('488', 'graph-shape-8', 'graph-shape-6', null, 'Graph.shape.activity.Final', null, '49', '486', '60', '60', '320', '225', '0', 'End', '#FF4081', 'rgb(0, 0, 0)', '2', '[]');
INSERT INTO `bpm_shapes` VALUES ('489', 'graph-shape-9', 'graph-shape-6', null, 'Graph.shape.activity.Action', null, '49', '486', '140', '60', '372', '43', '0', 'Sent Document', 'rgb(255, 255, 255)', 'rgb(0, 0, 0)', '2', '[]');
INSERT INTO `bpm_shapes` VALUES ('807', 'graph-shape-73', null, 'pool-29', 'Graph.shape.activity.Lane', null, '50', null, '1167', '319', '23', '38', '0', 'Netplan', 'rgb(255, 255, 255)', 'rgb(0, 0, 0)', '2', '[]');
INSERT INTO `bpm_shapes` VALUES ('808', 'graph-shape-74', 'graph-shape-73', null, 'Graph.shape.activity.Start', null, '50', '807', '60', '60', '76', '63', '0', 'Upload', 'rgb(255, 255, 255)', 'rgb(0, 0, 0)', '2', '[]');
INSERT INTO `bpm_shapes` VALUES ('809', 'graph-shape-75', 'graph-shape-73', null, 'Graph.shape.activity.Action', null, '50', '807', '140', '60', '370', '63', '0', 'Approval', 'rgb(255, 255, 255)', 'rgb(0, 0, 0)', '2', '[]');
INSERT INTO `bpm_shapes` VALUES ('810', 'graph-shape-76', 'graph-shape-73', null, 'Graph.shape.activity.Action', null, '50', '807', '140', '60', '36', '166', '0', 'Data Reject', 'rgb(255, 255, 255)', 'rgb(0, 0, 0)', '2', '[]');
INSERT INTO `bpm_shapes` VALUES ('811', 'graph-shape-77', 'graph-shape-73', null, 'Graph.shape.activity.Action', null, '50', '807', '140', '60', '659', '63', '0', 'Update Prodef', 'rgb(255, 255, 255)', 'rgb(0, 0, 0)', '2', '[]');
INSERT INTO `bpm_shapes` VALUES ('812', 'graph-shape-78', null, 'pool-29', 'Graph.shape.activity.Lane', null, '50', null, '1167', '220', '23', '357', '0', 'RND', 'rgb(255, 255, 255)', 'rgb(0, 0, 0)', '2', '[]');
INSERT INTO `bpm_shapes` VALUES ('813', 'graph-shape-79', 'graph-shape-78', null, 'Graph.shape.activity.Action', null, '50', '812', '140', '60', '370', '119', '0', 'Create Site SSR', 'rgb(255, 255, 255)', 'rgb(0, 0, 0)', '2', '[]');
INSERT INTO `bpm_shapes` VALUES ('814', 'graph-shape-80', null, 'pool-29', 'Graph.shape.activity.Lane', null, '50', null, '1167', '200', '23', '577', '0', 'Power', 'rgb(255, 255, 255)', 'rgb(0, 0, 0)', '2', '[]');
INSERT INTO `bpm_shapes` VALUES ('815', 'graph-shape-81', 'graph-shape-80', null, 'Graph.shape.activity.Action', null, '50', '814', '140', '60', '136', '74', '0', 'Complete Data Power', 'rgb(255, 255, 255)', 'rgb(0, 0, 0)', '2', '[]');
INSERT INTO `bpm_shapes` VALUES ('816', 'graph-shape-82', null, 'pool-29', 'Graph.shape.activity.Lane', null, '50', null, '1167', '243', '23', '777', '0', 'Civil', 'rgb(255, 255, 255)', 'rgb(0, 0, 0)', '2', '[]');
INSERT INTO `bpm_shapes` VALUES ('817', 'graph-shape-83', 'graph-shape-82', null, 'Graph.shape.activity.Action', null, '50', '816', '140', '60', '387', '94', '0', 'Review Far End', 'rgb(255, 255, 255)', 'rgb(0, 0, 0)', '2', '[]');
INSERT INTO `bpm_shapes` VALUES ('818', 'graph-shape-84', null, 'pool-29', 'Graph.shape.activity.Lane', null, '50', null, '1167', '200', '23', '1021', '0', 'Transmision', 'rgb(255, 255, 255)', 'rgb(0, 0, 0)', '2', '[]');
INSERT INTO `bpm_shapes` VALUES ('819', 'graph-shape-85', 'graph-shape-84', null, 'Graph.shape.activity.Action', null, '50', '818', '140', '60', '659', '78', '0', 'Add Far End', 'rgb(255, 255, 255)', 'rgb(0, 0, 0)', '2', '[]');
INSERT INTO `bpm_shapes` VALUES ('820', 'graph-shape-86', null, 'pool-29', 'Graph.shape.activity.Lane', null, '50', null, '1167', '323', '23', '1221', '0', 'NDC', 'rgb(255, 255, 255)', 'rgb(0, 0, 0)', '2', '[]');
INSERT INTO `bpm_shapes` VALUES ('821', 'graph-shape-87', 'graph-shape-86', null, 'Graph.shape.activity.Action', null, '50', '820', '159', '60', '27', '103', '0', 'Sent Data SSR', 'rgb(255, 255, 255)', 'rgb(0, 0, 0)', '2', '[]');
INSERT INTO `bpm_shapes` VALUES ('822', 'graph-shape-88', 'graph-shape-86', null, 'Graph.shape.activity.Final', null, '50', '820', '60', '60', '456', '191', '0', 'End', '#FF4081', 'rgb(0, 0, 0)', '2', '[]');
INSERT INTO `bpm_shapes` VALUES ('823', 'graph-shape-89', null, 'pool-29', 'Graph.shape.activity.Lane', null, '50', null, '1167', '200', '23', '1544', '0', 'Sitac', 'rgb(255, 255, 255)', 'rgb(0, 0, 0)', '2', '[]');
INSERT INTO `bpm_shapes` VALUES ('824', 'graph-shape-90', 'graph-shape-89', null, 'Graph.shape.activity.Final', null, '50', '823', '60', '60', '50', '109', '0', 'End', '#FF4081', 'rgb(0, 0, 0)', '2', '[]');

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
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of kanban_panels
-- ----------------------------
INSERT INTO `kanban_panels` VALUES ('1', '1', 'Todo', '--paper-indigo-500', '0');
INSERT INTO `kanban_panels` VALUES ('2', '1', 'Doing', '--paper-purple-500', '1');
INSERT INTO `kanban_panels` VALUES ('3', '1', 'Done', '--paper-pink-500', '2');
INSERT INTO `kanban_panels` VALUES ('36', '14', 'Site Planning', '--paper-blue-500', '0');
INSERT INTO `kanban_panels` VALUES ('37', '14', 'Site Plan Approved', '--paper-green-500', '1');
INSERT INTO `kanban_panels` VALUES ('38', '14', 'Site Plan Rejected', '--paper-amber-500', '2');
INSERT INTO `kanban_panels` VALUES ('39', '14', 'Power Not Complete', '--paper-teal-500', '3');
INSERT INTO `kanban_panels` VALUES ('40', '14', 'TRM Not Complete', '--paper-pink-500', '4');
INSERT INTO `kanban_panels` VALUES ('41', '14', 'BSS Complete', '--paper-pink-500', '5');
INSERT INTO `kanban_panels` VALUES ('42', '14', 'Netplan Not Complete', '--paper-blue-grey-500', '6');
INSERT INTO `kanban_panels` VALUES ('43', '14', 'Power Complete', '--paper-blue-grey-500', '7');
INSERT INTO `kanban_panels` VALUES ('44', '14', 'Civil Complete', '--paper-green-500', '8');
INSERT INTO `kanban_panels` VALUES ('45', '14', 'Civil Not Complete', '--paper-amber-500', '9');
INSERT INTO `kanban_panels` VALUES ('46', '14', 'TRM Complete', '--paper-green-500', '10');
INSERT INTO `kanban_panels` VALUES ('47', '14', 'Netplan Complete', '--paper-purple-500', '11');
INSERT INTO `kanban_panels` VALUES ('48', '14', 'Sent To Sitac', '--paper-purple-500', '12');
INSERT INTO `kanban_panels` VALUES ('49', '14', 'Sent To NDS', '--paper-teal-500', '13');

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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of kanban_settings
-- ----------------------------
INSERT INTO `kanban_settings` VALUES ('1', 'Kanban Demo', 'No description', null);
INSERT INTO `kanban_settings` VALUES ('14', 'Kanban SSR Process', 'XL Axiata SSR Process', '/siteplan');

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
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of kanban_statuses
-- ----------------------------
INSERT INTO `kanban_statuses` VALUES ('3', '2', '49', '398', '#000');
INSERT INTO `kanban_statuses` VALUES ('6', '3', '49', '398', '#000');
INSERT INTO `kanban_statuses` VALUES ('7', '2', '49', '400', '#000');
INSERT INTO `kanban_statuses` VALUES ('11', '1', '49', '396', '#000');
INSERT INTO `kanban_statuses` VALUES ('20', '1', '49', '397', '#000');
INSERT INTO `kanban_statuses` VALUES ('21', '36', '50', '607', '#000');
INSERT INTO `kanban_statuses` VALUES ('22', '37', '50', '608', '#000');
INSERT INTO `kanban_statuses` VALUES ('23', '38', '50', '609', '#000');
INSERT INTO `kanban_statuses` VALUES ('24', '39', '50', '610', '#000');
INSERT INTO `kanban_statuses` VALUES ('25', '40', '50', '611', '#000');
INSERT INTO `kanban_statuses` VALUES ('26', '41', '50', '612', '#000');
INSERT INTO `kanban_statuses` VALUES ('27', '42', '50', '613', '#000');
INSERT INTO `kanban_statuses` VALUES ('28', '43', '50', '614', '#000');
INSERT INTO `kanban_statuses` VALUES ('29', '44', '50', '615', '#000');
INSERT INTO `kanban_statuses` VALUES ('30', '45', '50', '616', '#000');
INSERT INTO `kanban_statuses` VALUES ('31', '46', '50', '617', '#000');
INSERT INTO `kanban_statuses` VALUES ('32', '47', '50', '618', '#000');
INSERT INTO `kanban_statuses` VALUES ('33', '48', '50', '619', '#000');
INSERT INTO `kanban_statuses` VALUES ('34', '49', '50', '620', '#000');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `sc_id` int(11) NOT NULL AUTO_INCREMENT,
  `sc_name` varchar(255) DEFAULT NULL,
  `sc_value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`sc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES ('1', 'app_id', '21000182918');
INSERT INTO `sys_config` VALUES ('2', 'app_name', 'demo');
INSERT INTO `sys_config` VALUES ('3', 'app_title', 'BPM APPLICATION');
INSERT INTO `sys_config` VALUES ('4', 'app_version', '1.0.0');
INSERT INTO `sys_config` VALUES ('5', 'app_description', '');
INSERT INTO `sys_config` VALUES ('6', 'app_keywords', '');
INSERT INTO `sys_config` VALUES ('7', 'app_author', 'Kreasindo Cipta Teknologi');
INSERT INTO `sys_config` VALUES ('8', 'app_repository', '');
INSERT INTO `sys_config` VALUES ('9', 'app_host', 'bpm.go.vm');
INSERT INTO `sys_config` VALUES ('10', 'app_base', '/demo/');
INSERT INTO `sys_config` VALUES ('11', 'app_site', 'https://bpm.go.vm/demo/');

-- ----------------------------
-- Table structure for sys_menus
-- ----------------------------
DROP TABLE IF EXISTS `sys_menus`;
CREATE TABLE `sys_menus` (
  `smn_id` int(11) NOT NULL AUTO_INCREMENT,
  `smn_title` varchar(50) DEFAULT NULL,
  `smn_icon` varchar(30) DEFAULT NULL,
  `smn_path` varchar(100) DEFAULT NULL,
  `smn_group` varchar(50) DEFAULT NULL,
  `smn_order` int(11) DEFAULT '1',
  PRIMARY KEY (`smn_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_menus
-- ----------------------------
INSERT INTO `sys_menus` VALUES ('1', 'Homepage', 'home', '/home', 'Module', '1');
INSERT INTO `sys_menus` VALUES ('2', 'Projects', 'work', '/projects', 'Module', '1');
INSERT INTO `sys_menus` VALUES ('3', 'Dashboard', 'dashboard', '/dashboard', 'Module', '1');
INSERT INTO `sys_menus` VALUES ('4', 'Kanban', 'view-carousel', '/kanban', 'Module', '1');
INSERT INTO `sys_menus` VALUES ('5', 'Calendar', 'today', '/components/calendar', 'Module', '1');
INSERT INTO `sys_menus` VALUES ('6', 'Ganttchart', 'image:tune', '/components/gantt', 'Module', '1');
INSERT INTO `sys_menus` VALUES ('7', 'Settings', 'device:usb', '/settings', 'Module', '1');
INSERT INTO `sys_menus` VALUES ('8', 'Datagrid', 'editor:border-all', '/components/datagrid', 'Component', '1');
INSERT INTO `sys_menus` VALUES ('9', 'Maps', 'maps:map', '/components/maps', 'Component', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sys_modules
-- ----------------------------
INSERT INTO `sys_modules` VALUES ('1', 'assets', '1.0.0', 'Assets', 'KCT Team', 'https://github.com/progmodules/assets', '/assets');
INSERT INTO `sys_modules` VALUES ('2', 'auth', '1.0.0', 'Authentication', 'KCT Team', 'https://github.com/progmodules/auth', '/auth');
INSERT INTO `sys_modules` VALUES ('3', 'application', '1.0.0', 'Application', 'KCT Team', null, '/');
INSERT INTO `sys_modules` VALUES ('4', 'bpmn', '1.0.0', 'Workflow', 'KCT Team', null, '/bpmn');
INSERT INTO `sys_modules` VALUES ('5', 'home', '1.0.0', 'Homepage', 'KCT Team', null, '/home');
INSERT INTO `sys_modules` VALUES ('7', 'roles', '1.0.0', 'Roles', 'KCT Team', null, '/roles');
INSERT INTO `sys_modules` VALUES ('8', 'users', '1.0.0', 'Users', 'KCT Team', null, '/users');
INSERT INTO `sys_modules` VALUES ('9', 'modules', '1.0.0', 'Modules', 'KCT Team', null, '/modules');
INSERT INTO `sys_modules` VALUES ('10', 'kanban', '1.0.0', 'Kanban', 'KCT Team', null, '/kanban');
INSERT INTO `sys_modules` VALUES ('11', 'test', '1.0.0', 'Test', 'KCT Team', null, '/test');

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
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sys_modules_capabilities
-- ----------------------------
INSERT INTO `sys_modules_capabilities` VALUES ('3', '1', 'GET_RESOURCE', 'Allow user to download resources (image, file etc.)');
INSERT INTO `sys_modules_capabilities` VALUES ('12', '3', 'MANAGE', 'Allow user to manage whole application');
INSERT INTO `sys_modules_capabilities` VALUES ('16', '2', 'LOGIN', 'Allow user to perform login action');
INSERT INTO `sys_modules_capabilities` VALUES ('17', '1', 'GET_THUMBNAIL', 'Allow user to download image thumbnail');
INSERT INTO `sys_modules_capabilities` VALUES ('18', '4', 'GET_STATUS', 'Allow user to get worker statuses');
INSERT INTO `sys_modules_capabilities` VALUES ('19', '4', 'GET_WORKER', 'Allow user to get available workers');
INSERT INTO `sys_modules_capabilities` VALUES ('20', '10', 'CREATE', 'Allow user to create new kanban setting');
INSERT INTO `sys_modules_capabilities` VALUES ('21', '10', 'CREATE_PANEL', 'Allow user to add new kanban panel');
INSERT INTO `sys_modules_capabilities` VALUES ('22', '5', 'UPDATE_NOTES', 'Allow user to update welcome notes');
INSERT INTO `sys_modules_capabilities` VALUES ('23', '5', 'UPDATE_COVER', 'Allow user to update background image');
INSERT INTO `sys_modules_capabilities` VALUES ('24', '3', 'ACCESS', 'Allow user to send mail');
INSERT INTO `sys_modules_capabilities` VALUES ('25', '11', 'DEBUG', 'Allow user to run debug');

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sys_roles
-- ----------------------------
INSERT INTO `sys_roles` VALUES ('1', 'Netplan', 'netplan', 'Role for developer users', '0', '2017-05-07 19:33:24', 'system');
INSERT INTO `sys_roles` VALUES ('2', 'BSS', 'bss', 'No description', '0', null, null);
INSERT INTO `sys_roles` VALUES ('3', 'Transmission', 'transmission', 'Role for customer', '0', '2017-05-07 19:47:35', 'system');
INSERT INTO `sys_roles` VALUES ('4', 'Administator', 'administator', 'Role for administrator user', '0', '2017-05-24 18:48:45', 'system');
INSERT INTO `sys_roles` VALUES ('5', 'Civil', 'civil', null, '0', '2017-08-04 17:08:15', 'system');
INSERT INTO `sys_roles` VALUES ('6', 'Power', 'power', null, '0', '2017-08-04 17:08:26', 'system');

-- ----------------------------
-- Table structure for sys_roles_kanban
-- ----------------------------
DROP TABLE IF EXISTS `sys_roles_kanban`;
CREATE TABLE `sys_roles_kanban` (
  `srk_id` int(11) NOT NULL AUTO_INCREMENT,
  `srk_sr_id` int(11) DEFAULT NULL,
  `srk_ks_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`srk_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_roles_kanban
-- ----------------------------
INSERT INTO `sys_roles_kanban` VALUES ('1', '1', '1');
INSERT INTO `sys_roles_kanban` VALUES ('3', '1', '5');
INSERT INTO `sys_roles_kanban` VALUES ('4', '1', '6');
INSERT INTO `sys_roles_kanban` VALUES ('5', '4', '1');
INSERT INTO `sys_roles_kanban` VALUES ('6', '4', '14');

-- ----------------------------
-- Table structure for sys_roles_permissions
-- ----------------------------
DROP TABLE IF EXISTS `sys_roles_permissions`;
CREATE TABLE `sys_roles_permissions` (
  `srp_id` int(11) NOT NULL AUTO_INCREMENT,
  `srp_sr_id` int(11) DEFAULT NULL,
  `srp_smc_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`srp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_roles_permissions
-- ----------------------------
INSERT INTO `sys_roles_permissions` VALUES ('1', '1', '24');
INSERT INTO `sys_roles_permissions` VALUES ('2', '1', '12');
INSERT INTO `sys_roles_permissions` VALUES ('3', '1', '17');
INSERT INTO `sys_roles_permissions` VALUES ('4', '1', '3');
INSERT INTO `sys_roles_permissions` VALUES ('5', '1', '16');
INSERT INTO `sys_roles_permissions` VALUES ('6', '1', '22');
INSERT INTO `sys_roles_permissions` VALUES ('7', '1', '23');
INSERT INTO `sys_roles_permissions` VALUES ('8', '1', '20');
INSERT INTO `sys_roles_permissions` VALUES ('9', '1', '21');
INSERT INTO `sys_roles_permissions` VALUES ('10', '1', '19');
INSERT INTO `sys_roles_permissions` VALUES ('11', '1', '18');
INSERT INTO `sys_roles_permissions` VALUES ('12', '4', '24');
INSERT INTO `sys_roles_permissions` VALUES ('13', '4', '12');

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
INSERT INTO `sys_users` VALUES ('1', '1', 'roso@kct.co.id', '$2y$08$dWZ2bnZPZGlZTFRzcFM3O.0H1nj9De85nlg47ErMwBPwhnDzCJlFq', 'Roso Sasongko', 'roso_kct_co_id.png', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJpYXQiOjE1MDIwMjkxNjAsImp0aSI6IndVOVpRXC9teHZydTlWeXU5TXFZZU50SlVzUFJVYndxWVNDSXBYN1JXTWlZPSIsImlzcyI6IktyZWFzaW5kbyBDaXB0YSBUZWtub2xvZ2kiLCJuYmYiOjE1MDIwMjkxNjEsImV4cCI6MTUwMjExMzE2MSwiZGF0YSI6eyJzdV9lbWFpbCI6InJvc2', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJpYXQiOjE1MDIwMjkxNjAsImp0aSI6ImlMbkF3c0M4eG42V1ZGaWZ1KzY5SGV5em1Zdmw2T1k3UFNcL1QwWmFGZHh3PSIsImlzcyI6IktyZWFzaW5kbyBDaXB0YSBUZWtub2xvZ2kiLCJuYmYiOjE1MDIwMjkxNjEsImV4cCI6MTUwMjEzNzE2MSwiZGF0YSI6bnVsbH0.ofnq5QKjaC8je9', 'Male', '1985-07-03', 'Programmer', 'Kreasindo Cipta Teknologi', '1', '2017-04-27 20:52:36', 'system');
INSERT INTO `sys_users` VALUES ('2', '1', 'vidi@kct.co.id', '$2y$08$MVg1UndEeTVGRWJrL1BxS.DUf6A5rt36rq9CByczAtresY5PvVykO', 'Vidi Meylan', 'vidi_kct_co_id.png', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJpYXQiOjE0OTM4NzczNTUsImp0aSI6ImJaTzgzMFZnTmMzOXlpaGc5Wk02WlBlNTR3WURlK0pjVEZYbytVelFDOFU9IiwiaXNzIjoiS3JlYXNpbmRvIENpcHRhIFRla25vbG9naSIsIm5iZiI6MTQ5Mzg3NzM1NiwiZXhwIjoxNDkzOTYxMzU2LCJkYXRhIjp7InN1X2VtYWlsIjoidmlkaU', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJpYXQiOjE0OTM4NzczNTUsImp0aSI6ImF3VXJ6cFIrVGJqaGNyMDJGZ01wNENhSUxOSmpUdTVSTXhFXC9HUTMydlEwPSIsImlzcyI6IktyZWFzaW5kbyBDaXB0YSBUZWtub2xvZ2kiLCJuYmYiOjE0OTM4NzczNTYsImV4cCI6MTQ5Mzk4NTM1NiwiZGF0YSI6bnVsbH0.UjnERoG8tMcfLB', null, null, null, null, '1', '2017-05-04 05:55:15', 'system');
INSERT INTO `sys_users` VALUES ('3', '2', 'cahya@kct.co.id', '$2y$08$JInjOtkULdYcwjnWPXwUL.V5ZUAn8rANXsYliJDdPXrS9bUnS/QfW', 'Cahya Dyzin', 'cahya_kct_co_id.png', null, null, 'Male', null, null, null, '1', '2017-05-04 06:24:39', 'system');
INSERT INTO `sys_users` VALUES ('4', '3', 'wili@kct.co.id', '$2y$08$JD1lu23K6va7KJlh7x1o6uMN55nAUsQjFUFcH9o8AFPTitLBS8Y0y', 'Wiliarko M.', 'wili_kct_co_id.png', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJpYXQiOjE0OTM4ODMzMjEsImp0aSI6IlhYaERLUTBSUmtweVBKVEJYbkJNQ3ZaZzU1UnRBWXpiVUVFQkFldEZRZVU9IiwiaXNzIjoiS3JlYXNpbmRvIENpcHRhIFRla25vbG9naSIsIm5iZiI6MTQ5Mzg4MzMyMiwiZXhwIjoxNDkzOTY3MzIyLCJkYXRhIjp7InN1X2VtYWlsIjoiam9obk', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJpYXQiOjE0OTM4ODMzMjEsImp0aSI6IktjdFwvRG5pWWZVUlRPY2lTZ1VJVEEwNHFIXC91dlJvYW9cL05vcVJaUmNUanc9IiwiaXNzIjoiS3JlYXNpbmRvIENpcHRhIFRla25vbG9naSIsIm5iZiI6MTQ5Mzg4MzMyMiwiZXhwIjoxNDkzOTkxMzIyLCJkYXRhIjpudWxsfQ.rQO76C44g9N', null, null, null, null, '1', '2017-05-04 07:20:15', 'system');
INSERT INTO `sys_users` VALUES ('7', '4', 'said@kct.co.id', '$2y$08$swEfrnafombDpMRGinkU2u2NsCet8xnfpuZdoeF90cMrpWgZ5TyHS', 'Said M Fahmi', 'said_kct_co_id.png', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJpYXQiOjE1MDE4NDgyMzksImp0aSI6Ijd5STBNT05rSE0zTk9kWWxBNzRMTTdoSHcwUVFUOVlDdE96U25zbUM5bkU9IiwiaXNzIjoiS3JlYXNpbmRvIENpcHRhIFRla25vbG9naSIsIm5iZiI6MTUwMTg0ODI0MCwiZXhwIjoxNTAxOTMyMjQwLCJkYXRhIjp7InN1X2VtYWlsIjoic2FpZE', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJpYXQiOjE1MDE4NDgyMzksImp0aSI6Ijl6Rkl0czNWRFQreVh2dGlKV0MzaVl2VTdWcXFUVWNxWFNHSGdaUHo3bUE9IiwiaXNzIjoiS3JlYXNpbmRvIENpcHRhIFRla25vbG9naSIsIm5iZiI6MTUwMTg0ODI0MCwiZXhwIjoxNTAxOTU2MjQwLCJkYXRhIjpudWxsfQ.zsfEMB2r4DO93XJ', null, null, null, null, '1', '2017-08-04 15:12:15', 'system');

-- ----------------------------
-- Table structure for sys_users_kanban
-- ----------------------------
DROP TABLE IF EXISTS `sys_users_kanban`;
CREATE TABLE `sys_users_kanban` (
  `suk_id` int(11) NOT NULL AUTO_INCREMENT,
  `suk_su_id` int(11) DEFAULT NULL,
  `suk_ks_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`suk_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_users_kanban
-- ----------------------------
INSERT INTO `sys_users_kanban` VALUES ('16', '2', '1');
INSERT INTO `sys_users_kanban` VALUES ('20', '7', '14');
INSERT INTO `sys_users_kanban` VALUES ('22', '7', '1');
INSERT INTO `sys_users_kanban` VALUES ('23', '1', '14');
INSERT INTO `sys_users_kanban` VALUES ('24', '1', '1');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of trx_siteplan
-- ----------------------------

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of trx_siteplan_statuses
-- ----------------------------

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
