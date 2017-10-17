-- --------------------------------------------------------
-- Host:                         192.168.56.5
-- Server version:               5.5.54-0ubuntu0.14.04.1 - (Ubuntu)
-- Server OS:                    debian-linux-gnu
-- HeidiSQL Version:             9.3.0.4984
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for table wssales.bpm_diagrams
CREATE TABLE IF NOT EXISTS `bpm_diagrams` (
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

-- Dumping data for table wssales.bpm_diagrams: ~1 rows (approximately)
/*!40000 ALTER TABLE `bpm_diagrams` DISABLE KEYS */;
INSERT INTO `bpm_diagrams` (`id`, `type`, `name`, `slug`, `description`, `cover`, `created_date`, `created_by`) VALUES
	(52, 'Graph.diagram.type.Activity', 'Sales Flow', 'sales-flow', 'No diagram description', '053fb0df419548f726d32e906e0e3a49.jpg', '2017-09-18 09:14:51', NULL);
/*!40000 ALTER TABLE `bpm_diagrams` ENABLE KEYS */;


-- Dumping structure for table wssales.bpm_forms
CREATE TABLE IF NOT EXISTS `bpm_forms` (
  `bf_id` int(11) NOT NULL AUTO_INCREMENT,
  `bf_activity` int(11) DEFAULT NULL,
  `bf_name` varchar(100) DEFAULT NULL,
  `bf_description` varchar(200) DEFAULT NULL,
  `bf_tpl_file` varchar(100) DEFAULT NULL,
  `bf_tpl_orig` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`bf_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- Dumping data for table wssales.bpm_forms: ~14 rows (approximately)
/*!40000 ALTER TABLE `bpm_forms` DISABLE KEYS */;
INSERT INTO `bpm_forms` (`bf_id`, `bf_activity`, `bf_name`, `bf_description`, `bf_tpl_file`, `bf_tpl_orig`) VALUES
	(12, 808, 'Site planning upload template', 'No description', '19d1f246a90d48307faeac3fdb31a30e.html', 'upload.html'),
	(13, 809, 'Approval template', 'No description', '6f64be85304054dee25e47629da7c6d3.html', 'approval.html'),
	(14, 813, 'Create SSR template', 'No description', 'fe6683b844815e3e1864772e20fab81c.html', 'create-site-ssr.html'),
	(15, 821, 'Sent Data SSR template', 'No description', '73a72a7da1f948d2ae66541209894d24.html', 'send-data-ssr.html'),
	(16, 819, 'Add far end template', 'No description', '6edbcdb933fae65132a71f658fb14038.html', 'add-far-end.html'),
	(17, 817, 'Review far end template', 'No description', 'dbce59b50bb42ef7997246eea071a6f7.html', 'review-far-end.html'),
	(18, 811, 'Update prodef template', 'No description', '6fb5ce6462d47296620683c9d779ce27.html', 'upload-prodef.html'),
	(19, 825, 'Open Opportunity Form', 'No description', 'e870a901848a6d2859d15f04d6284630.html', 'oportunity_form_2.html'),
	(20, 826, 'Submit Form', 'No description', '86333d1659b9d7010411f1c172ad5f8c.html', 'create-opportunity-form.html'),
	(21, 827, 'Negotiation Form', 'No description', '0308f85453e0a6d519b3d053aef43927.html', 'oportunity_form_2.html'),
	(22, 828, 'PO Form', 'No description', '0f6d07a6c88d6086ff122ced1119c608.html', 'po_form.html'),
	(23, 835, 'DROP Form', 'No description', '6e5920b270691cf7e8ef18e8870e5106.html', 'create-opportunity-form.html'),
	(24, 839, 'Open Opprtunity Form', 'No description', '8ca4ebd7cf18f47102ab3338c2ff5c84.html', 'create-opportunity-form.html'),
	(25, 836, 'Create Opportunity Form', 'No description', 'ecff692986dc4a65f478aad6a53bcfd0.html', 'create-opportunity-form.html');
/*!40000 ALTER TABLE `bpm_forms` ENABLE KEYS */;


-- Dumping structure for table wssales.bpm_forms_roles
CREATE TABLE IF NOT EXISTS `bpm_forms_roles` (
  `bfr_id` int(11) NOT NULL AUTO_INCREMENT,
  `bfr_bf_id` int(11) DEFAULT NULL,
  `bfr_sr_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`bfr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- Dumping data for table wssales.bpm_forms_roles: ~2 rows (approximately)
/*!40000 ALTER TABLE `bpm_forms_roles` DISABLE KEYS */;
INSERT INTO `bpm_forms_roles` (`bfr_id`, `bfr_bf_id`, `bfr_sr_id`) VALUES
	(9, 12, 1),
	(10, 13, 1);
/*!40000 ALTER TABLE `bpm_forms_roles` ENABLE KEYS */;


-- Dumping structure for table wssales.bpm_forms_users
CREATE TABLE IF NOT EXISTS `bpm_forms_users` (
  `bfu_id` int(11) NOT NULL AUTO_INCREMENT,
  `bfu_bf_id` int(11) DEFAULT NULL,
  `bfu_su_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`bfu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- Dumping data for table wssales.bpm_forms_users: ~21 rows (approximately)
/*!40000 ALTER TABLE `bpm_forms_users` DISABLE KEYS */;
INSERT INTO `bpm_forms_users` (`bfu_id`, `bfu_bf_id`, `bfu_su_id`) VALUES
	(6, 12, 1),
	(7, 12, 7),
	(8, 13, 1),
	(9, 13, 7),
	(10, 14, 1),
	(11, 14, 7),
	(12, 15, 1),
	(13, 15, 7),
	(14, 16, 1),
	(15, 16, 7),
	(16, 17, 1),
	(17, 17, 7),
	(18, 18, 1),
	(19, 18, 7),
	(20, 19, 7),
	(21, 20, 7),
	(22, 21, 7),
	(23, 22, 7),
	(24, 23, 7),
	(25, 24, 7),
	(26, 25, 7);
/*!40000 ALTER TABLE `bpm_forms_users` ENABLE KEYS */;


-- Dumping structure for table wssales.bpm_links
CREATE TABLE IF NOT EXISTS `bpm_links` (
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
) ENGINE=InnoDB AUTO_INCREMENT=649 DEFAULT CHARSET=utf8;

-- Dumping data for table wssales.bpm_links: ~10 rows (approximately)
/*!40000 ALTER TABLE `bpm_links` DISABLE KEYS */;
INSERT INTO `bpm_links` (`id`, `name`, `client_id`, `client_source`, `client_target`, `type`, `router_type`, `diagram_id`, `source_id`, `target_id`, `command`, `stroke`, `label`, `label_distance`, `convex`, `smooth`, `smoothness`, `params`) VALUES
	(629, NULL, 'graph-link-1', 'graph-shape-7', 'graph-shape-1', 'Graph.link.Orthogonal', 'orthogonal', 52, 839, 826, 'M455.0000000000002,54.16686024548826L455,127.9999999999999', '#000', 'Submitted', 0.50000, 1, 0, 6, '[{"field":"ts_drop_status","comparison":"=","value":"active","operator":""}]'),
	(630, NULL, 'graph-link-2', 'graph-shape-1', 'graph-shape-2', 'Graph.link.Orthogonal', 'orthogonal', 52, 826, 827, 'M454.72942463744926,187.6494465700588L454.7294246374479,250.64944657005876', '#000', 'Negotiation', 0.50000, 1, 0, 6, '[{"field":"ts_drop_status","comparison":"=","value":"active","operator":""}]'),
	(631, NULL, 'graph-link-3', 'graph-shape-2', 'graph-shape-3', 'Graph.link.Orthogonal', 'orthogonal', 52, 827, 828, 'M454.72942463745346,310.6494465700598L454.7294246374503,380.649446570059', '#000', 'PO Received', 0.50000, 1, 0, 6, '[{"field":"ts_drop_status","comparison":"=","value":"active","operator":""}]'),
	(632, NULL, 'graph-link-4', 'graph-shape-3', 'graph-shape-4', 'Graph.link.Orthogonal', 'orthogonal', 52, 828, 833, 'M454.99999999999835,441.000000000001L454.99999999999875,490.000000000002', '#000', '', 0.50000, 1, 0, 6, '[]'),
	(639, NULL, 'graph-link-5', 'graph-shape-7', 'graph-shape-5', 'Graph.link.Orthogonal', 'orthogonal', 52, 839, 835, 'M525,16.249104404750934L809.4608088940569,16.249104404751648L809.4608088940571,380.999999999998', '#000', 'Drop from Opportunity', 0.34644, 1, 0, 6, '[{"field":"ts_drop_status","comparison":"=","value":"drop","operator":""}]'),
	(640, NULL, 'graph-link-6', 'graph-shape-1', 'graph-shape-5', 'Graph.link.Orthogonal', 'orthogonal', 52, 826, 835, 'M525,147.124154160045L764,147.12415416004285L764.0000000000001,381.00000000000057', '#000', 'Drop from Submit', 0.41878, 1, 0, 6, '[{"field":"ts_drop_status","comparison":"=","value":"drop","operator":""}]'),
	(641, NULL, 'graph-link-7', 'graph-shape-2', 'graph-shape-5', 'Graph.link.Orthogonal', 'orthogonal', 52, 827, 835, 'M525,277.1241541600551L714.7808248827354,277.1241541600459L714.7808248827336,381.0000000000024', '#000', 'Drop from Negotiation', 0.50000, 1, 0, 6, '[{"field":"ts_drop_status","comparison":"=","value":"drop","operator":""}]'),
	(644, NULL, 'graph-link-8', 'graph-shape-6', 'graph-shape-7', 'Graph.link.Orthogonal', 'orthogonal', 52, 836, 839, 'M455.28899452062643,-62.0511976328378L455.2889945206265,-5.833139754511613', '#000', 'Opportunity', 0.50000, 1, 0, 6, '[]'),
	(645, NULL, 'graph-link-9', 'graph-shape-3', 'graph-shape-5', 'Graph.link.Orthogonal', 'orthogonal', 52, 828, 835, 'M525,411.00000000000085L694,410.99999999999454', '#000', 'Drop from PO', 0.50000, 1, 0, 6, '[{"field":"ts_drop_status","comparison":"=","value":"drop","operator":""}]'),
	(648, NULL, 'graph-link-10', 'graph-shape-5', 'graph-shape-4', 'Graph.link.Orthogonal', 'orthogonal', 52, 835, 833, 'M764.0000000000033,441.00000000000176L764,520L484.5957029881911,519.9999999999975', '#000', '', 0.50000, 1, 0, 6, '[]');
/*!40000 ALTER TABLE `bpm_links` ENABLE KEYS */;


-- Dumping structure for table wssales.bpm_shapes
CREATE TABLE IF NOT EXISTS `bpm_shapes` (
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
) ENGINE=InnoDB AUTO_INCREMENT=840 DEFAULT CHARSET=utf8;

-- Dumping data for table wssales.bpm_shapes: ~7 rows (approximately)
/*!40000 ALTER TABLE `bpm_shapes` DISABLE KEYS */;
INSERT INTO `bpm_shapes` (`id`, `client_id`, `client_parent`, `client_pool`, `type`, `mode`, `diagram_id`, `parent_id`, `width`, `height`, `left`, `top`, `rotate`, `label`, `fill`, `stroke`, `stroke_width`, `params`) VALUES
	(826, 'graph-shape-1', NULL, NULL, 'Graph.shape.activity.Action', NULL, 52, NULL, 140, 60, 385, 128, 0, 'Submit', 'rgb(255, 255, 255)', 'rgb(0, 0, 0)', 2, '[]'),
	(827, 'graph-shape-2', NULL, NULL, 'Graph.shape.activity.Action', NULL, 52, NULL, 140, 60, 385, 251, 0, 'Negotiation', 'rgb(255, 255, 255)', 'rgb(0, 0, 0)', 2, '[]'),
	(828, 'graph-shape-3', NULL, NULL, 'Graph.shape.activity.Action', NULL, 52, NULL, 140, 60, 385, 381, 0, 'PO', 'rgb(255, 255, 255)', 'rgb(0, 0, 0)', 2, '[]'),
	(833, 'graph-shape-4', NULL, NULL, 'Graph.shape.activity.Final', NULL, 52, NULL, 60, 60, 425, 490, 0, 'End', '#FF4081', 'rgb(0, 0, 0)', 2, '[]'),
	(835, 'graph-shape-5', NULL, NULL, 'Graph.shape.activity.Action', NULL, 52, NULL, 140, 60, 694, 381, 0, 'Drop', 'rgb(255, 255, 255)', 'rgb(0, 0, 0)', 2, '[]'),
	(836, 'graph-shape-6', NULL, NULL, 'Graph.shape.activity.Start', NULL, 52, NULL, 60, 60, 425, -122, 0, 'Start', 'rgb(255, 255, 255)', 'rgb(0, 0, 0)', 2, '[]'),
	(839, 'graph-shape-7', NULL, NULL, 'Graph.shape.activity.Action', NULL, 52, NULL, 140, 60, 385, -6, 0, 'Opportunity', 'rgb(255, 255, 255)', 'rgb(0, 0, 0)', 2, '[]');
/*!40000 ALTER TABLE `bpm_shapes` ENABLE KEYS */;


-- Dumping structure for table wssales.dx_auth
CREATE TABLE IF NOT EXISTS `dx_auth` (
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

-- Dumping data for table wssales.dx_auth: ~0 rows (approximately)
/*!40000 ALTER TABLE `dx_auth` DISABLE KEYS */;
/*!40000 ALTER TABLE `dx_auth` ENABLE KEYS */;


-- Dumping structure for table wssales.dx_mapping
CREATE TABLE IF NOT EXISTS `dx_mapping` (
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

-- Dumping data for table wssales.dx_mapping: ~9 rows (approximately)
/*!40000 ALTER TABLE `dx_mapping` DISABLE KEYS */;
INSERT INTO `dx_mapping` (`map_id`, `map_profile_id`, `map_table`, `map_type`, `map_xls_col`, `map_tbl_col`, `map_dtype`, `map_pk`, `map_mandatory`, `map_ref_table`, `map_ref_col`, `map_ref_fk`, `map_ref_ignore`, `map_active`, `map_col_alias`, `map_grp_seq`, `map_sk`, `map_ref_contents`, `map_col_seq`) VALUES
	(1, 1, 'example_1', 'data', 'EMAIL', 'email', 'string', 1, 0, NULL, NULL, NULL, 0, 1, NULL, 1, 0, NULL, NULL),
	(3, 1, 'example_1', 'data', 'DEBUG', 'debug', 'string', 0, 0, NULL, NULL, NULL, 0, 1, NULL, 1, 0, NULL, NULL),
	(4, 1, 'example_1', 'data', 'SEX', 'sex', 'int', 0, 0, NULL, NULL, NULL, 0, 1, NULL, 1, 0, NULL, NULL),
	(5, 1, 'example_2', 'data', 'USERNAME', 'username', 'string', 1, 0, NULL, NULL, NULL, 0, 0, NULL, 1, 0, NULL, NULL),
	(6, 1, 'example_1', 'data', 'DOB', 'dob', 'date', 0, 0, NULL, NULL, NULL, 0, 1, NULL, 1, 0, NULL, NULL),
	(7, 1, 'example_1', 'data', 'AVATAR', 'avatar', 'string', 0, 0, NULL, NULL, NULL, 0, 1, NULL, 1, 0, NULL, NULL),
	(8, 1, 'example_1', 'data', 'POINTS', 'points', 'double', 0, 0, NULL, NULL, NULL, 0, 1, NULL, 1, 0, NULL, NULL),
	(9, 1, 'example_1', 'data', 'FULLNAME', 'fullname', 'string', 0, 0, NULL, NULL, NULL, 0, 1, NULL, 1, 0, NULL, NULL),
	(10, 4, 'A', 'data', '1', 'A', 'A', 1, 0, NULL, NULL, NULL, 0, 1, NULL, NULL, 1, NULL, NULL);
/*!40000 ALTER TABLE `dx_mapping` ENABLE KEYS */;


-- Dumping structure for table wssales.dx_profiles
CREATE TABLE IF NOT EXISTS `dx_profiles` (
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

-- Dumping data for table wssales.dx_profiles: ~3 rows (approximately)
/*!40000 ALTER TABLE `dx_profiles` DISABLE KEYS */;
INSERT INTO `dx_profiles` (`profile_id`, `profile_name`, `profile_desc`, `header_row_idx`, `col_offset`, `row_offset`, `map_header`, `has_merge_cell`) VALUES
	(1, 'example', 'Example profile', 1, 'B', 2, 1, NULL),
	(4, 'foo', NULL, 1, 'A', 2, 1, NULL),
	(5, 'bar', NULL, 1, 'A', 1, 1, NULL);
/*!40000 ALTER TABLE `dx_profiles` ENABLE KEYS */;


-- Dumping structure for table wssales.example_1
CREATE TABLE IF NOT EXISTS `example_1` (
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

-- Dumping data for table wssales.example_1: ~0 rows (approximately)
/*!40000 ALTER TABLE `example_1` DISABLE KEYS */;
/*!40000 ALTER TABLE `example_1` ENABLE KEYS */;


-- Dumping structure for table wssales.example_2
CREATE TABLE IF NOT EXISTS `example_2` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table wssales.example_2: ~0 rows (approximately)
/*!40000 ALTER TABLE `example_2` DISABLE KEYS */;
/*!40000 ALTER TABLE `example_2` ENABLE KEYS */;


-- Dumping structure for table wssales.kanban
CREATE TABLE IF NOT EXISTS `kanban` (
  `panel_id` int(11) NOT NULL AUTO_INCREMENT,
  `panel_color` varchar(100) DEFAULT NULL,
  `panel_card_filter` varchar(100) DEFAULT NULL,
  `panel_title` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`panel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Dumping data for table wssales.kanban: ~3 rows (approximately)
/*!40000 ALTER TABLE `kanban` DISABLE KEYS */;
INSERT INTO `kanban` (`panel_id`, `panel_color`, `panel_card_filter`, `panel_title`) VALUES
	(1, 'pink', 'isCardFilterTodo', 'To Do'),
	(2, 'blue', 'isCardFilterDoing', 'Doing'),
	(3, 'green', 'isCardFilterDone', 'Done');
/*!40000 ALTER TABLE `kanban` ENABLE KEYS */;


-- Dumping structure for table wssales.kanban_forms
CREATE TABLE IF NOT EXISTS `kanban_forms` (
  `kf_id` int(11) NOT NULL AUTO_INCREMENT,
  `kf_diagrams_id` int(11) DEFAULT NULL,
  `kf_status` int(11) DEFAULT NULL,
  `kf_form_edit` varchar(255) DEFAULT NULL,
  `kf_form_view` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`kf_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- Dumping data for table wssales.kanban_forms: ~8 rows (approximately)
/*!40000 ALTER TABLE `kanban_forms` DISABLE KEYS */;
INSERT INTO `kanban_forms` (`kf_id`, `kf_diagrams_id`, `kf_status`, `kf_form_edit`, `kf_form_view`) VALUES
	(1, 49, 396, '', ''),
	(2, 49, 397, '', ''),
	(3, 49, 397, 'Capture.JPG', ''),
	(4, 28, 96, '', ''),
	(5, 28, 97, '', ''),
	(6, 28, 98, '', ''),
	(7, 28, 99, '', ''),
	(8, 28, 105, '', '');
/*!40000 ALTER TABLE `kanban_forms` ENABLE KEYS */;


-- Dumping structure for table wssales.kanban_panels
CREATE TABLE IF NOT EXISTS `kanban_panels` (
  `kp_id` int(11) NOT NULL AUTO_INCREMENT,
  `kp_ks_id` int(11) DEFAULT NULL,
  `kp_title` varchar(50) DEFAULT NULL,
  `kp_accent` varchar(30) DEFAULT NULL,
  `kp_order` int(11) DEFAULT '1',
  PRIMARY KEY (`kp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;

-- Dumping data for table wssales.kanban_panels: ~5 rows (approximately)
/*!40000 ALTER TABLE `kanban_panels` DISABLE KEYS */;
INSERT INTO `kanban_panels` (`kp_id`, `kp_ks_id`, `kp_title`, `kp_accent`, `kp_order`) VALUES
	(51, 16, 'Open Opportunity', 'var(--paper-purple-500)', 0),
	(52, 16, 'Submit', 'var(--paper-red-500)', 1),
	(53, 16, 'Negoitation', 'var(--paper-amber-500)', 2),
	(54, 16, 'PO', 'var(--paper-blue-500)', 3),
	(55, 16, 'Drop', 'var(--paper-blue-500)', 4);
/*!40000 ALTER TABLE `kanban_panels` ENABLE KEYS */;


-- Dumping structure for table wssales.kanban_settings
CREATE TABLE IF NOT EXISTS `kanban_settings` (
  `ks_id` int(11) NOT NULL AUTO_INCREMENT,
  `ks_name` varchar(100) DEFAULT NULL,
  `ks_description` varchar(200) DEFAULT NULL,
  `ks_api` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ks_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

-- Dumping data for table wssales.kanban_settings: ~1 rows (approximately)
/*!40000 ALTER TABLE `kanban_settings` DISABLE KEYS */;
INSERT INTO `kanban_settings` (`ks_id`, `ks_name`, `ks_description`, `ks_api`) VALUES
	(16, 'Sales Flow', 'No description', NULL);
/*!40000 ALTER TABLE `kanban_settings` ENABLE KEYS */;


-- Dumping structure for table wssales.kanban_statuses
CREATE TABLE IF NOT EXISTS `kanban_statuses` (
  `kst_id` int(11) NOT NULL AUTO_INCREMENT,
  `kst_kp_id` int(11) DEFAULT NULL,
  `kst_diagrams_id` int(11) DEFAULT NULL,
  `kst_status` int(11) DEFAULT NULL,
  `kst_color` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`kst_id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=latin1;

-- Dumping data for table wssales.kanban_statuses: ~8 rows (approximately)
/*!40000 ALTER TABLE `kanban_statuses` DISABLE KEYS */;
INSERT INTO `kanban_statuses` (`kst_id`, `kst_kp_id`, `kst_diagrams_id`, `kst_status`, `kst_color`) VALUES
	(55, 55, 52, 639, '#000'),
	(56, 55, 52, 640, '#000'),
	(57, 55, 52, 641, '#000'),
	(58, 55, 52, 645, '#000'),
	(59, 51, 52, 644, '#000'),
	(60, 52, 52, 629, '#000'),
	(61, 53, 52, 630, '#000'),
	(62, 54, 52, 631, '#000');
/*!40000 ALTER TABLE `kanban_statuses` ENABLE KEYS */;


-- Dumping structure for table wssales.mst_customers
CREATE TABLE IF NOT EXISTS `mst_customers` (
  `mc_id` int(11) NOT NULL AUTO_INCREMENT,
  `mc_company_name` varchar(100) DEFAULT NULL,
  `mc_contact_name` varchar(100) DEFAULT NULL,
  `mc_phone` varchar(30) DEFAULT NULL,
  `mc_email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`mc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- Dumping data for table wssales.mst_customers: ~11 rows (approximately)
/*!40000 ALTER TABLE `mst_customers` DISABLE KEYS */;
INSERT INTO `mst_customers` (`mc_id`, `mc_company_name`, `mc_contact_name`, `mc_phone`, `mc_email`) VALUES
	(1, 'Pertamina', 'John Doe', '(021) 1234567', 'sales@company.com'),
	(2, 'Indofood', 'John Doe', '(021) 1234567', 'sales@company.com'),
	(3, 'XL Axiata', 'John Doe', '(021) 1234567', 'sales@company.com'),
	(4, 'Indosat', 'John Doe', '(021) 1234567', 'sales@company.com'),
	(5, 'Telkomsel', 'John Doe', '(021) 1234567', 'sales@company.com'),
	(6, 'Sampoerna', 'John Doe', '(021) 1234567', 'sales@company.com'),
	(7, 'Net Mediatama', 'John Doe', '(021) 1234567', 'sales@company.com'),
	(8, 'Rajawali Citra', 'John Doe', '(021) 1234567', 'sales@company.com'),
	(9, 'Trans Media', 'John Doe', '(021) 1234567', 'sales@company.com'),
	(11, 'Sinar Mas', 'John Doe', '(021) 1234567', 'sales@company.com'),
	(12, 'PT KCT', 'Said', '0818990199', 'said@kct.co.id');
/*!40000 ALTER TABLE `mst_customers` ENABLE KEYS */;


-- Dumping structure for table wssales.sys_captcha
CREATE TABLE IF NOT EXISTS `sys_captcha` (
  `id` varchar(40) NOT NULL,
  `namespace` varchar(32) NOT NULL,
  `code` varchar(32) NOT NULL,
  `code_display` varchar(32) NOT NULL,
  `created` int(11) NOT NULL,
  `audio_data` mediumblob,
  PRIMARY KEY (`id`,`namespace`),
  KEY `created` (`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table wssales.sys_captcha: ~0 rows (approximately)
/*!40000 ALTER TABLE `sys_captcha` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_captcha` ENABLE KEYS */;


-- Dumping structure for table wssales.sys_config
CREATE TABLE IF NOT EXISTS `sys_config` (
  `sc_id` int(11) NOT NULL AUTO_INCREMENT,
  `sc_name` varchar(255) DEFAULT NULL,
  `sc_value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`sc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- Dumping data for table wssales.sys_config: ~7 rows (approximately)
/*!40000 ALTER TABLE `sys_config` DISABLE KEYS */;
INSERT INTO `sys_config` (`sc_id`, `sc_name`, `sc_value`) VALUES
	(1, 'app_id', '21000182918'),
	(3, 'app_title', 'WS SALES'),
	(4, 'app_version', '1.0.0'),
	(5, 'app_description', 'Crafted with next generation of progressive web'),
	(6, 'app_keywords', ''),
	(7, 'app_author', 'Kreasindo Cipta Teknologi'),
	(8, 'app_repository', '');
/*!40000 ALTER TABLE `sys_config` ENABLE KEYS */;


-- Dumping structure for table wssales.sys_menus
CREATE TABLE IF NOT EXISTS `sys_menus` (
  `smn_id` int(11) NOT NULL AUTO_INCREMENT,
  `smn_parent_id` int(11) DEFAULT '0',
  `smn_title` varchar(50) DEFAULT NULL,
  `smn_icon` varchar(30) DEFAULT NULL,
  `smn_path` varchar(100) DEFAULT NULL,
  `smn_order` int(11) DEFAULT '1',
  `smn_visible` int(1) DEFAULT '1',
  PRIMARY KEY (`smn_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- Dumping data for table wssales.sys_menus: ~13 rows (approximately)
/*!40000 ALTER TABLE `sys_menus` DISABLE KEYS */;
INSERT INTO `sys_menus` (`smn_id`, `smn_parent_id`, `smn_title`, `smn_icon`, `smn_path`, `smn_order`, `smn_visible`) VALUES
	(1, 0, 'Homepage', 'social:public', '/home', 1, 1),
	(3, 0, 'Dashboard', 'dashboard', '/dashboard', 2, 1),
	(4, 0, 'Worksheet', 'view-carousel', '/kanban', 3, 1),
	(6, 11, 'Ganttchart', 'image:tune', '/components/gantt', 52, 1),
	(7, 0, 'Settings', 'device:usb', '/settings', 7, 1),
	(14, 5, 'Foo', 'add', '/', 50, 1),
	(15, 5, 'Bar', 'add', '/', 2, 1),
	(16, 0, 'Customer Data', 'account-circle', '/customers', 5, 1),
	(17, 0, 'Leads', 'communication:phone', '/leads', 4, 1),
	(18, 0, 'Products', 'icons:shopping-cart', '/products', 6, 1);
/*!40000 ALTER TABLE `sys_menus` ENABLE KEYS */;


-- Dumping structure for table wssales.sys_modules
CREATE TABLE IF NOT EXISTS `sys_modules` (
  `sm_id` int(11) NOT NULL AUTO_INCREMENT,
  `sm_name` varchar(100) DEFAULT NULL,
  `sm_version` varchar(30) DEFAULT NULL,
  `sm_title` varchar(100) DEFAULT NULL,
  `sm_author` varchar(50) DEFAULT 'KCT Team',
  `sm_repository` varchar(255) DEFAULT NULL,
  `sm_api` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`sm_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

-- Dumping data for table wssales.sys_modules: ~11 rows (approximately)
/*!40000 ALTER TABLE `sys_modules` DISABLE KEYS */;
INSERT INTO `sys_modules` (`sm_id`, `sm_name`, `sm_version`, `sm_title`, `sm_author`, `sm_repository`, `sm_api`) VALUES
	(1, 'assets', '1.0.0', 'Assets', 'KCT Team', 'https://github.com/progmodules/assets', '/assets'),
	(2, 'auth', '1.0.0', 'Authentication', 'KCT Team', 'https://github.com/progmodules/auth', '/auth'),
	(3, 'application', '1.0.0', 'Application', 'KCT Team', NULL, '/'),
	(5, 'home', '1.0.0', 'Homepage', 'KCT Team', NULL, '/home'),
	(7, 'roles', '1.0.0', 'Roles', 'KCT Team', NULL, '/roles'),
	(8, 'users', '1.0.0', 'Users', 'KCT Team', NULL, '/users'),
	(9, 'modules', '1.0.0', 'Modules', 'KCT Team', NULL, '/modules'),
	(10, 'worksheet', '1.0.0', 'Worksheet', 'KCT Team', NULL, '/kanban'),
	(13, 'dashboard', '1.0', 'Dashboard', 'KCT Team', NULL, '/dashboard'),
	(14, 'leads', '1.0', 'Leads', 'KCT Team', NULL, '/leads'),
	(15, 'customers', '1.0', 'Customers', 'KCT Team', NULL, '/customers'),
	(16, 'products', '1.0', 'Products', 'KCT Team', NULL, '/products'),
	(17, 'settings', '1.0', 'Settings', 'KCT Team', NULL, '/settings');
/*!40000 ALTER TABLE `sys_modules` ENABLE KEYS */;


-- Dumping structure for table wssales.sys_modules_capabilities
CREATE TABLE IF NOT EXISTS `sys_modules_capabilities` (
  `smc_id` int(11) NOT NULL AUTO_INCREMENT,
  `smc_sm_id` int(11) DEFAULT NULL,
  `smc_name` varchar(100) DEFAULT NULL,
  `smc_description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`smc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;

-- Dumping data for table wssales.sys_modules_capabilities: ~12 rows (approximately)
/*!40000 ALTER TABLE `sys_modules_capabilities` DISABLE KEYS */;
INSERT INTO `sys_modules_capabilities` (`smc_id`, `smc_sm_id`, `smc_name`, `smc_description`) VALUES
	(3, 1, 'GET_RESOURCE', 'Allow user to download resources (image, file etc.)'),
	(12, 3, 'MANAGE', 'Allow user to manage whole application'),
	(16, 2, 'LOGIN', 'Allow user to perform login action'),
	(17, 1, 'GET_THUMBNAIL', 'Allow user to download image thumbnail'),
	(20, 10, 'CREATE', 'Allow user to create new kanban setting'),
	(22, 5, 'UPDATE_NOTES', 'Allow user to update welcome notes'),
	(23, 5, 'UPDATE_COVER', 'Allow user to update background image'),
	(24, 3, 'ACCESS', 'Allow user to send mail'),
	(26, 10, 'UPDATE', 'Allow user to display detail and modify item'),
	(27, 10, 'DELETE', 'Allow user to delete kanban item');
/*!40000 ALTER TABLE `sys_modules_capabilities` ENABLE KEYS */;


-- Dumping structure for table wssales.sys_numbers
CREATE TABLE IF NOT EXISTS `sys_numbers` (
  `sn_id` int(11) NOT NULL AUTO_INCREMENT,
  `sn_name` varchar(50) DEFAULT NULL,
  `sn_value` int(11) DEFAULT NULL,
  `sn_length` int(11) DEFAULT NULL,
  `sn_prefix` varchar(30) DEFAULT NULL,
  `sn_suffix` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`sn_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Dumping data for table wssales.sys_numbers: ~1 rows (approximately)
/*!40000 ALTER TABLE `sys_numbers` DISABLE KEYS */;
INSERT INTO `sys_numbers` (`sn_id`, `sn_name`, `sn_value`, `sn_length`, `sn_prefix`, `sn_suffix`) VALUES
	(1, 'SALES_TICKET', 35, 5, 'SP', NULL);
/*!40000 ALTER TABLE `sys_numbers` ENABLE KEYS */;


-- Dumping structure for table wssales.sys_permissions
CREATE TABLE IF NOT EXISTS `sys_permissions` (
  `sp_id` int(11) NOT NULL AUTO_INCREMENT,
  `sp_sr_id` int(11) DEFAULT NULL,
  `sp_smc_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`sp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table wssales.sys_permissions: ~1 rows (approximately)
/*!40000 ALTER TABLE `sys_permissions` DISABLE KEYS */;
INSERT INTO `sys_permissions` (`sp_id`, `sp_sr_id`, `sp_smc_id`) VALUES
	(1, 1, 1);
/*!40000 ALTER TABLE `sys_permissions` ENABLE KEYS */;


-- Dumping structure for table wssales.sys_roles
CREATE TABLE IF NOT EXISTS `sys_roles` (
  `sr_id` int(11) NOT NULL AUTO_INCREMENT,
  `sr_name` varchar(100) DEFAULT NULL,
  `sr_slug` varchar(100) DEFAULT NULL,
  `sr_description` varchar(255) DEFAULT NULL,
  `sr_default` int(1) DEFAULT '0',
  `sr_created_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `sr_created_by` varchar(50) DEFAULT 'system',
  PRIMARY KEY (`sr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

-- Dumping data for table wssales.sys_roles: ~10 rows (approximately)
/*!40000 ALTER TABLE `sys_roles` DISABLE KEYS */;
INSERT INTO `sys_roles` (`sr_id`, `sr_name`, `sr_slug`, `sr_description`, `sr_default`, `sr_created_date`, `sr_created_by`) VALUES
	(4, 'Administator', 'administator', 'Role for administrator user', 0, '2017-05-24 18:48:45', 'system'),
	(7, 'General Manager', 'general-manager', NULL, 0, '2017-09-18 09:00:50', 'system'),
	(8, 'Sales Manager FMCG', 'sales-manager-fmcg', NULL, 0, '2017-09-18 09:00:58', 'system'),
	(9, 'Account Manager FMCG', 'account-manager-fmcg', NULL, 0, '2017-09-18 09:01:09', 'system'),
	(10, 'Sales Manager MAETL', 'sales-manager-maetl', NULL, 0, '2017-09-27 13:52:46', 'system'),
	(11, 'Account Manager MAETL', 'account-manager-maetl', NULL, 0, '2017-09-27 13:53:16', 'system'),
	(12, 'Sales Manager EPSE', 'sales-manager-epse', NULL, 0, '2017-09-27 13:53:37', 'system'),
	(13, 'Account Manager EPSE', 'account-manager-epse', NULL, 0, '2017-09-27 13:53:51', 'system'),
	(14, 'Sales Manager Reseller & SME', 'sales-manager-reseller-sme', NULL, 0, '2017-09-27 13:54:22', 'system'),
	(15, 'Account Manager Reseller & SME', 'account-manager-reseller-sme', NULL, 0, '2017-09-27 13:54:35', 'system');
/*!40000 ALTER TABLE `sys_roles` ENABLE KEYS */;


-- Dumping structure for table wssales.sys_roles_kanban
CREATE TABLE IF NOT EXISTS `sys_roles_kanban` (
  `srk_id` int(11) NOT NULL AUTO_INCREMENT,
  `srk_sr_id` int(11) DEFAULT NULL,
  `srk_ks_id` int(11) DEFAULT NULL,
  `srk_selected` int(1) DEFAULT '0',
  PRIMARY KEY (`srk_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- Dumping data for table wssales.sys_roles_kanban: ~1 rows (approximately)
/*!40000 ALTER TABLE `sys_roles_kanban` DISABLE KEYS */;
INSERT INTO `sys_roles_kanban` (`srk_id`, `srk_sr_id`, `srk_ks_id`, `srk_selected`) VALUES
	(7, 4, 16, 1);
/*!40000 ALTER TABLE `sys_roles_kanban` ENABLE KEYS */;


-- Dumping structure for table wssales.sys_roles_menus
CREATE TABLE IF NOT EXISTS `sys_roles_menus` (
  `srm_id` int(11) NOT NULL AUTO_INCREMENT,
  `srm_sr_id` int(11) DEFAULT NULL,
  `srm_smn_id` int(11) DEFAULT NULL,
  `srm_selected` int(1) DEFAULT '0',
  PRIMARY KEY (`srm_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- Dumping data for table wssales.sys_roles_menus: ~0 rows (approximately)
/*!40000 ALTER TABLE `sys_roles_menus` DISABLE KEYS */;
INSERT INTO `sys_roles_menus` (`srm_id`, `srm_sr_id`, `srm_smn_id`, `srm_selected`) VALUES
	(1, 4, 1, 1),
	(2, 4, 4, 1),
	(3, 4, 14, 1),
	(4, 4, 3, 1),
	(5, 4, 17, 1),
	(6, 4, 16, 1),
	(7, 4, 18, 1),
	(8, 4, 7, 1);
/*!40000 ALTER TABLE `sys_roles_menus` ENABLE KEYS */;


-- Dumping structure for table wssales.sys_roles_permissions
CREATE TABLE IF NOT EXISTS `sys_roles_permissions` (
  `srp_id` int(11) NOT NULL AUTO_INCREMENT,
  `srp_sr_id` int(11) DEFAULT NULL,
  `srp_smc_id` int(11) DEFAULT NULL,
  `srp_selected` int(1) DEFAULT '0',
  PRIMARY KEY (`srp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- Dumping data for table wssales.sys_roles_permissions: ~2 rows (approximately)
/*!40000 ALTER TABLE `sys_roles_permissions` DISABLE KEYS */;
INSERT INTO `sys_roles_permissions` (`srp_id`, `srp_sr_id`, `srp_smc_id`, `srp_selected`) VALUES
	(12, 4, 24, 1),
	(13, 4, 12, 1),
	(14, 4, 3, 1),
	(15, 4, 18, 0),
	(16, 4, 19, 0),
	(17, 4, 22, 1),
	(18, 4, 23, 1),
	(19, 4, 20, 1),
	(20, 4, 25, 0),
	(21, 4, 17, 1),
	(22, 4, 16, 1),
	(23, 4, 21, 0),
	(24, 4, 26, 0),
	(25, 4, 27, 1);
/*!40000 ALTER TABLE `sys_roles_permissions` ENABLE KEYS */;


-- Dumping structure for table wssales.sys_users
CREATE TABLE IF NOT EXISTS `sys_users` (
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

-- Dumping data for table wssales.sys_users: ~5 rows (approximately)
/*!40000 ALTER TABLE `sys_users` DISABLE KEYS */;
INSERT INTO `sys_users` (`su_id`, `su_sr_id`, `su_email`, `su_passwd`, `su_fullname`, `su_avatar`, `su_access_token`, `su_refresh_token`, `su_sex`, `su_dob`, `su_job_title`, `su_company`, `su_active`, `su_created_date`, `su_created_by`) VALUES
	(1, 4, 'roso@kct.co.id', '$2y$08$dWZ2bnZPZGlZTFRzcFM3O.0H1nj9De85nlg47ErMwBPwhnDzCJlFq', 'Roso Sasongko', 'roso_kct_co_id.png', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJpYXQiOjE1MDcwODQ4MTYsImp0aSI6ImltbkNJMjlEVDhSNHZhYmY1RXg2TkZxbGlxdXNRWjc1RjZpS25EUmtESzA9IiwiaXNzIjoiS3JlYXNpbmRvIENpcHRhIFRla25vbG9naSIsIm5iZiI6MTUwNzA4NDgxNywiZXhwIjoxNTA3MTY4ODE3LCJkYXRhIjp7InN1X2VtYWlsIjoicm9zb0', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJpYXQiOjE1MDYwNjk4NzksImp0aSI6Ik9TM0t3VHV3cTJjXC9tNUM0N3BvZk4xMXRnSU54WEtjRFZZNE5oWDZ2bUlRPSIsImlzcyI6IktyZWFzaW5kbyBDaXB0YSBUZWtub2xvZ2kiLCJuYmYiOjE1MDYwNjk4ODAsImV4cCI6MTUwNjE3Nzg4MCwiZGF0YSI6bnVsbH0.Fok1kGgnSvfOgZ', 'Male', '1985-07-03', 'Programmer', 'Kreasindo Cipta Teknologi', 1, '2017-04-27 20:52:36', 'system'),
	(2, 1, 'vidi@kct.co.id', '$2y$08$MVg1UndEeTVGRWJrL1BxS.DUf6A5rt36rq9CByczAtresY5PvVykO', 'Vidi Meylan', 'vidi_kct_co_id.png', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJpYXQiOjE0OTM4NzczNTUsImp0aSI6ImJaTzgzMFZnTmMzOXlpaGc5Wk02WlBlNTR3WURlK0pjVEZYbytVelFDOFU9IiwiaXNzIjoiS3JlYXNpbmRvIENpcHRhIFRla25vbG9naSIsIm5iZiI6MTQ5Mzg3NzM1NiwiZXhwIjoxNDkzOTYxMzU2LCJkYXRhIjp7InN1X2VtYWlsIjoidmlkaU', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJpYXQiOjE0OTM4NzczNTUsImp0aSI6ImF3VXJ6cFIrVGJqaGNyMDJGZ01wNENhSUxOSmpUdTVSTXhFXC9HUTMydlEwPSIsImlzcyI6IktyZWFzaW5kbyBDaXB0YSBUZWtub2xvZ2kiLCJuYmYiOjE0OTM4NzczNTYsImV4cCI6MTQ5Mzk4NTM1NiwiZGF0YSI6bnVsbH0.UjnERoG8tMcfLB', NULL, NULL, NULL, NULL, 1, '2017-05-04 05:55:15', 'system'),
	(3, 2, 'cahya@kct.co.id', '$2y$08$JInjOtkULdYcwjnWPXwUL.V5ZUAn8rANXsYliJDdPXrS9bUnS/QfW', 'Cahya Dyzin', 'cahya_kct_co_id.png', NULL, NULL, 'Male', NULL, NULL, NULL, 1, '2017-05-04 06:24:39', 'system'),
	(4, 3, 'wili@kct.co.id', '$2y$08$JD1lu23K6va7KJlh7x1o6uMN55nAUsQjFUFcH9o8AFPTitLBS8Y0y', 'Wiliarko M.', 'wili_kct_co_id.png', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJpYXQiOjE0OTM4ODMzMjEsImp0aSI6IlhYaERLUTBSUmtweVBKVEJYbkJNQ3ZaZzU1UnRBWXpiVUVFQkFldEZRZVU9IiwiaXNzIjoiS3JlYXNpbmRvIENpcHRhIFRla25vbG9naSIsIm5iZiI6MTQ5Mzg4MzMyMiwiZXhwIjoxNDkzOTY3MzIyLCJkYXRhIjp7InN1X2VtYWlsIjoiam9obk', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJpYXQiOjE0OTM4ODMzMjEsImp0aSI6IktjdFwvRG5pWWZVUlRPY2lTZ1VJVEEwNHFIXC91dlJvYW9cL05vcVJaUmNUanc9IiwiaXNzIjoiS3JlYXNpbmRvIENpcHRhIFRla25vbG9naSIsIm5iZiI6MTQ5Mzg4MzMyMiwiZXhwIjoxNDkzOTkxMzIyLCJkYXRhIjpudWxsfQ.rQO76C44g9N', NULL, NULL, NULL, NULL, 1, '2017-05-04 07:20:15', 'system'),
	(7, 4, 'said@kct.co.id', '$2y$08$swEfrnafombDpMRGinkU2u2NsCet8xnfpuZdoeF90cMrpWgZ5TyHS', 'Said M Fahmi', 'said_kct_co_id.png', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJpYXQiOjE1MDc3MTc2MTQsImp0aSI6InNYaXRNcWFFdHRPQmVFT2t2dlg2RENkSVJxSmwwY0FVT2pDd1hlZTB2R1E9IiwiaXNzIjoiS3JlYXNpbmRvIENpcHRhIFRla25vbG9naSIsIm5iZiI6MTUwNzcxNzYxNSwiZXhwIjoxNTA3ODAxNjE1LCJkYXRhIjp7InN1X2VtYWlsIjoic2FpZE', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJpYXQiOjE1MDc3MTc2MTQsImp0aSI6IjN0NlY1eU1qS0hra0ZcL1dMMHZmSHFHSXNGVzQ2TnNianFaQnhxdnhCWlhZPSIsImlzcyI6IktyZWFzaW5kbyBDaXB0YSBUZWtub2xvZ2kiLCJuYmYiOjE1MDc3MTc2MTUsImV4cCI6MTUwNzgyNTYxNSwiZGF0YSI6bnVsbH0.nbk9d70EFECCat', NULL, NULL, NULL, NULL, 1, '2017-08-04 15:12:15', 'system');
/*!40000 ALTER TABLE `sys_users` ENABLE KEYS */;


-- Dumping structure for table wssales.sys_users_kanban
CREATE TABLE IF NOT EXISTS `sys_users_kanban` (
  `suk_id` int(11) NOT NULL AUTO_INCREMENT,
  `suk_su_id` int(11) DEFAULT NULL,
  `suk_ks_id` int(11) DEFAULT NULL,
  `suk_selected` int(1) DEFAULT '0',
  PRIMARY KEY (`suk_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- Dumping data for table wssales.sys_users_kanban: ~2 rows (approximately)
/*!40000 ALTER TABLE `sys_users_kanban` DISABLE KEYS */;
INSERT INTO `sys_users_kanban` (`suk_id`, `suk_su_id`, `suk_ks_id`, `suk_selected`) VALUES
	(26, 7, 16, 0),
	(27, 1, 16, 0);
/*!40000 ALTER TABLE `sys_users_kanban` ENABLE KEYS */;


-- Dumping structure for table wssales.trx_leads
CREATE TABLE IF NOT EXISTS `trx_leads` (
  `tl_id` int(11) NOT NULL AUTO_INCREMENT,
  `tl_mc_id` int(11) DEFAULT NULL,
  `tl_status` varchar(30) DEFAULT NULL,
  `tl_notes` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`tl_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- Dumping data for table wssales.trx_leads: ~11 rows (approximately)
/*!40000 ALTER TABLE `trx_leads` DISABLE KEYS */;
INSERT INTO `trx_leads` (`tl_id`, `tl_mc_id`, `tl_status`, `tl_notes`) VALUES
	(1, 1, 'HOT', 'Tertarik Penawaran'),
	(2, 2, 'HOLD', 'Ada Kemungkinan Tahun Depan Bisa Di Prospek'),
	(3, 3, 'HOT', 'Minta Penawaran'),
	(4, 6, 'DUMP', 'Tidak Ada Kebutuhan'),
	(5, 8, 'HOT', ''),
	(6, 9, 'HOT', ''),
	(7, 4, 'HOT', 'Minta Penawaran'),
	(8, 11, 'HOT', ''),
	(9, 5, 'HOT', 'Bulan Depan Ada Keputusan'),
	(10, 12, 'HOT', NULL),
	(11, NULL, '', '');
/*!40000 ALTER TABLE `trx_leads` ENABLE KEYS */;


-- Dumping structure for table wssales.trx_products
CREATE TABLE IF NOT EXISTS `trx_products` (
  `tp_id` int(11) NOT NULL AUTO_INCREMENT,
  `tp_service` varchar(255) NOT NULL DEFAULT '0',
  `tp_sub_service` varchar(255) NOT NULL DEFAULT '0',
  PRIMARY KEY (`tp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- Dumping data for table wssales.trx_products: ~4 rows (approximately)
/*!40000 ALTER TABLE `trx_products` DISABLE KEYS */;
INSERT INTO `trx_products` (`tp_id`, `tp_service`, `tp_sub_service`) VALUES
	(1, 'GSM', 'Postpaid'),
	(2, 'GSM', 'Prepaid'),
	(5, 'NGSM', 'Revenue - Tracking Systems & MPLS'),
	(6, 'NGSM', 'Revenue - Leased Line');
/*!40000 ALTER TABLE `trx_products` ENABLE KEYS */;


-- Dumping structure for table wssales.trx_sales
CREATE TABLE IF NOT EXISTS `trx_sales` (
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

-- Dumping data for table wssales.trx_sales: ~7 rows (approximately)
/*!40000 ALTER TABLE `trx_sales` DISABLE KEYS */;
INSERT INTO `trx_sales` (`ts_id`, `ts_ticket_number`, `ts_tl_id`, `ts_mc_id`, `ts_tp_id`, `ts_segment`, `ts_amounts`, `ts_products`, `ts_creator`, `ts_drop_status`, `ts_date_opportunity`, `ts_date_submitted`, `ts_date_negotiated`, `ts_date_po`, `ts_date_closed`, `ts_expected_date_closed`, `ts_revenue_type`) VALUES
	(1, 'SP00033-A', NULL, 1, 1, 'FSI', 1000000.00, 'GSM - Postpaid', 7, 'drop', '2017-10-05', '2017-10-06', NULL, NULL, NULL, '2017-10-05', 'Recurring'),
	(2, 'SP00033-B', NULL, 1, 6, 'FSI', 1500002.00, 'NGSM - Revenue - Leased Line', 7, 'drop', '2017-10-05', NULL, NULL, NULL, NULL, '2017-10-05', 'Recurring'),
	(3, 'SP00034-A', NULL, 1, 1, 'FSI', 2000000.00, 'GSM - Postpaid', 7, 'drop', '2017-10-09', NULL, NULL, NULL, NULL, '2017-10-09', 'Recurring'),
	(4, 'SP00034-B', NULL, 1, 2, 'FSI', 3000000.00, 'GSM - Prepaid', 7, 'drop', '2017-10-09', NULL, NULL, NULL, NULL, '2017-10-09', 'Recurring'),
	(5, 'SP00034-C', NULL, 1, 6, 'FSI', 1000000.00, 'NGSM - Revenue - Leased Line', 7, 'drop', '2017-10-09', NULL, NULL, NULL, NULL, '2017-10-09', 'Recurring'),
	(6, 'SP00035-A', NULL, 12, 1, 'FSI', 1000000.00, NULL, NULL, 'active', '2017-10-10', NULL, NULL, NULL, NULL, '2017-10-10', 'Recurring'),
	(7, 'SP00035-B', NULL, 12, 5, 'FSI', 1200000.00, 'NGSM - Revenue - Tracking Systems & MPLS', NULL, 'drop', '2017-10-10', NULL, NULL, NULL, NULL, '2017-10-10', 'Recurring');
/*!40000 ALTER TABLE `trx_sales` ENABLE KEYS */;


-- Dumping structure for table wssales.trx_sales_comments
CREATE TABLE IF NOT EXISTS `trx_sales_comments` (
  `tsc_id` int(11) NOT NULL AUTO_INCREMENT,
  `tsc_ts_id` int(11) NOT NULL DEFAULT '0',
  `tsc_sender` int(11) NOT NULL DEFAULT '0',
  `tsc_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `tsc_message` text NOT NULL,
  PRIMARY KEY (`tsc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

-- Dumping data for table wssales.trx_sales_comments: ~18 rows (approximately)
/*!40000 ALTER TABLE `trx_sales_comments` DISABLE KEYS */;
INSERT INTO `trx_sales_comments` (`tsc_id`, `tsc_ts_id`, `tsc_sender`, `tsc_created`, `tsc_message`) VALUES
	(1, 1, 7, '2017-10-05 14:01:00', 'tesss'),
	(2, 2, 7, '2017-10-05 14:06:03', 'tossss'),
	(3, 2, 7, '2017-10-05 14:32:02', 'jkdhsjkdhskdhs'),
	(4, 2, 7, '2017-10-05 08:27:43', 'lkjklsd sdsdlkj sdsdsd'),
	(5, 2, 7, '2017-10-05 08:28:19', 'lkjklsd sdsdlkj sdsdsd sfssds'),
	(6, 2, 7, '2017-10-05 08:31:05', 'lkjklsd sdsdlkj sdsdsd sfssds  232323'),
	(7, 2, 7, '2017-10-05 08:33:03', 'lkjklsd sdsdlkj sdsdsd sfssds  232323 fddff'),
	(8, 2, 7, '2017-10-05 08:33:28', 'lkjklsd sdsdlkj sdsdsd sfssds  232323 fddff'),
	(9, 2, 7, '2017-10-05 08:34:24', 'lkjklsd sdsdlkj sdsdsd sfssds  232323 fddff'),
	(10, 2, 7, '2017-10-05 08:38:00', 'lkjklsd sdsdlkj sdsdsd sfssds  232323 fddff'),
	(11, 2, 7, '2017-10-05 08:38:17', 'lkjklsd sdsdlkj sdsdsd sfssds  232323 fddff'),
	(12, 2, 7, '2017-10-05 08:40:58', 'lkjklsd sdsdlkj sdsdsd sfssds  232323 fddff'),
	(13, 2, 7, '2017-10-05 08:41:34', 'sdsds'),
	(14, 2, 7, '2017-10-05 08:42:49', 'okeeey'),
	(15, 2, 7, '2017-10-05 08:43:33', 'yaaaeee'),
	(16, 2, 7, '2017-10-05 08:43:37', 'dsdsds'),
	(17, 2, 7, '2017-10-05 08:45:55', '13298jkjhkwew sdsjdks\nsdsdsdsd'),
	(18, 2, 7, '2017-10-05 09:08:14', 'jhkhjkhj');
/*!40000 ALTER TABLE `trx_sales_comments` ENABLE KEYS */;


-- Dumping structure for table wssales.trx_sales_products
CREATE TABLE IF NOT EXISTS `trx_sales_products` (
  `tsp_id` int(11) NOT NULL AUTO_INCREMENT,
  `tsp_ts_id` int(11) DEFAULT NULL,
  `tsp_tp_id` int(11) DEFAULT NULL,
  `tsp_amount` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`tsp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Dumping data for table wssales.trx_sales_products: ~2 rows (approximately)
/*!40000 ALTER TABLE `trx_sales_products` DISABLE KEYS */;
INSERT INTO `trx_sales_products` (`tsp_id`, `tsp_ts_id`, `tsp_tp_id`, `tsp_amount`) VALUES
	(1, 15, 1, 100000),
	(2, 15, 6, 2000000);
/*!40000 ALTER TABLE `trx_sales_products` ENABLE KEYS */;


-- Dumping structure for table wssales.trx_sales_statuses
CREATE TABLE IF NOT EXISTS `trx_sales_statuses` (
  `tss_id` int(11) NOT NULL AUTO_INCREMENT,
  `tss_ts_id` int(11) DEFAULT NULL,
  `tss_status` int(11) DEFAULT NULL,
  `tss_target` int(11) DEFAULT NULL,
  `tss_worker` varchar(100) DEFAULT NULL,
  `tss_deleted` int(1) DEFAULT '0',
  `tss_created` datetime DEFAULT NULL,
  PRIMARY KEY (`tss_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- Dumping data for table wssales.trx_sales_statuses: ~28 rows (approximately)
/*!40000 ALTER TABLE `trx_sales_statuses` DISABLE KEYS */;
INSERT INTO `trx_sales_statuses` (`tss_id`, `tss_ts_id`, `tss_status`, `tss_target`, `tss_worker`, `tss_deleted`, `tss_created`) VALUES
	(1, 1, 629, 826, 'sales-flow', 1, '2017-10-05 04:17:08'),
	(2, 2, 629, 826, 'sales-flow', 1, '2017-10-05 04:17:08'),
	(3, 1, 630, 827, 'sales-flow', 1, '2017-10-05 04:19:30'),
	(4, 1, 631, 828, 'sales-flow', 1, '2017-10-05 04:21:13'),
	(6, 1, 645, 835, 'sales-flow', 1, '2017-10-05 04:22:51'),
	(8, 2, 639, 835, 'sales-flow', 1, '2017-10-09 03:25:56'),
	(9, 3, 644, 839, 'sales-flow', 1, '2017-10-09 09:22:26'),
	(10, 4, 644, 839, 'sales-flow', 1, '2017-10-09 09:22:26'),
	(11, 5, 644, 839, 'sales-flow', 1, '2017-10-09 09:22:26'),
	(12, 4, 629, 826, 'sales-flow', 1, '2017-10-09 09:22:41'),
	(13, 4, 630, 827, 'sales-flow', 1, '2017-10-09 09:22:51'),
	(14, 4, 640, 835, 'sales-flow', 1, '2017-10-09 09:22:51'),
	(15, 3, 629, 826, 'sales-flow', 1, '2017-10-09 09:25:43'),
	(16, 3, 640, 835, 'sales-flow', 0, '2017-10-09 09:25:49'),
	(17, 4, 641, 835, 'sales-flow', 0, '2017-10-09 11:30:38'),
	(18, 4, 648, 833, 'sales-flow', 0, '2017-10-09 11:30:38'),
	(19, 2, 641, 835, 'sales-flow', 0, '2017-10-09 11:30:57'),
	(20, 2, 648, 833, 'sales-flow', 0, '2017-10-09 11:30:57'),
	(21, 1, 648, 833, 'sales-flow', 0, '2017-10-09 11:32:05'),
	(22, 5, 629, 826, 'sales-flow', 1, '2017-10-10 02:46:48'),
	(23, 5, 630, 827, 'sales-flow', 1, '2017-10-10 02:46:53'),
	(24, 5, 631, 828, 'sales-flow', 1, '2017-10-10 02:46:55'),
	(26, 5, 645, 835, 'sales-flow', 0, '2017-10-10 04:16:57'),
	(27, 6, 644, 839, 'sales-flow', 0, '2017-10-10 04:21:49'),
	(28, 7, 644, 839, 'sales-flow', 1, '2017-10-10 04:21:49'),
	(29, 7, 629, 826, 'sales-flow', 1, '2017-10-10 11:16:05'),
	(30, 7, 630, 827, 'sales-flow', 1, '2017-10-10 11:16:24'),
	(31, 7, 641, 835, 'sales-flow', 0, '2017-10-10 11:16:46');
/*!40000 ALTER TABLE `trx_sales_statuses` ENABLE KEYS */;


-- Dumping structure for table wssales.trx_siteplan
CREATE TABLE IF NOT EXISTS `trx_siteplan` (
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

-- Dumping data for table wssales.trx_siteplan: ~9 rows (approximately)
/*!40000 ALTER TABLE `trx_siteplan` DISABLE KEYS */;
INSERT INTO `trx_siteplan` (`tsp_id`, `tsp_name`, `tsp_description`, `tsp_date_upload`, `tsp_is_rejected`, `tsp_date_approve`, `tss_bss_date_upload`, `tss_date_power`, `tss_date_trm_review`, `tss_date_netplan`, `tss_proj_def`, `tss_request_type`) VALUES
	(1, 'A', NULL, 'A', 0, 'A', 'A', 'A', 'A', 'A', 'A', 'NEW'),
	(2, 'Site Bandung', NULL, 'A', 0, 'A', NULL, NULL, NULL, NULL, NULL, NULL),
	(3, 'B', NULL, 'B', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(4, 'Site Manggarai', NULL, 'C', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(5, 'Site Katulampa', NULL, 'D', 0, 'D', 'D', NULL, NULL, NULL, NULL, NULL),
	(6, 'TRIP', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(7, 'TRIO', NULL, '1', 0, '1', '1', NULL, '1', NULL, NULL, 'NEW'),
	(8, 'AD', NULL, '1', 0, '1', '1', NULL, NULL, NULL, NULL, NULL),
	(9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `trx_siteplan` ENABLE KEYS */;


-- Dumping structure for table wssales.trx_siteplan_statuses
CREATE TABLE IF NOT EXISTS `trx_siteplan_statuses` (
  `tsps_id` int(11) NOT NULL AUTO_INCREMENT,
  `tsps_tsp_id` int(11) DEFAULT NULL,
  `tsps_status` int(11) DEFAULT NULL,
  `tsps_target` int(11) DEFAULT NULL,
  `tsps_worker` varchar(100) DEFAULT NULL,
  `tsps_deleted` int(1) DEFAULT '0',
  `tsps_created` datetime DEFAULT NULL,
  PRIMARY KEY (`tsps_id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

-- Dumping data for table wssales.trx_siteplan_statuses: ~36 rows (approximately)
/*!40000 ALTER TABLE `trx_siteplan_statuses` DISABLE KEYS */;
INSERT INTO `trx_siteplan_statuses` (`tsps_id`, `tsps_tsp_id`, `tsps_status`, `tsps_target`, `tsps_worker`, `tsps_deleted`, `tsps_created`) VALUES
	(3, 1, 610, 815, 'flow-site-ssr', 1, '2017-08-07 11:11:30'),
	(4, 1, 611, 819, 'flow-site-ssr', 1, '2017-08-07 11:11:30'),
	(5, 1, 612, 821, 'flow-site-ssr', 1, '2017-08-07 11:11:30'),
	(6, 1, 613, 811, 'flow-site-ssr', 1, '2017-08-07 11:11:30'),
	(8, 1, 616, 817, 'flow-site-ssr', 1, '2017-08-07 11:11:34'),
	(9, 1, 617, 821, 'flow-site-ssr', 1, '2017-08-07 11:11:34'),
	(10, 1, 618, 821, 'flow-site-ssr', 1, '2017-08-07 11:11:40'),
	(11, 1, 615, 821, 'flow-site-ssr', 1, '2017-08-07 11:11:45'),
	(13, 2, 607, 809, 'flow-site-ssr', 1, '2017-08-07 11:19:36'),
	(14, 3, 607, 809, 'flow-site-ssr', 1, '2017-08-07 11:19:40'),
	(15, 4, 607, 809, 'flow-site-ssr', 0, '2017-08-07 11:19:44'),
	(16, 2, 608, 813, 'flow-site-ssr', 0, '2017-08-07 11:19:49'),
	(17, 5, 607, 809, 'flow-site-ssr', 1, '2017-08-07 11:19:55'),
	(18, 5, 608, 813, 'flow-site-ssr', 1, '2017-08-07 11:19:59'),
	(19, 5, 610, 815, 'flow-site-ssr', 1, '2017-08-07 11:20:13'),
	(20, 5, 611, 819, 'flow-site-ssr', 0, '2017-08-07 11:20:13'),
	(21, 5, 612, 821, 'flow-site-ssr', 0, '2017-08-07 11:20:13'),
	(22, 5, 613, 811, 'flow-site-ssr', 0, '2017-08-07 11:20:13'),
	(23, 3, 609, 810, 'flow-site-ssr', 0, '2017-08-07 11:20:20'),
	(24, 5, 614, 821, 'flow-site-ssr', 0, '2017-08-07 12:12:43'),
	(25, 7, 607, 809, 'flow-site-ssr', 1, '2017-09-01 14:21:01'),
	(26, 7, 608, 813, 'flow-site-ssr', 1, '2017-09-01 14:21:19'),
	(27, 7, 610, 815, 'flow-site-ssr', 1, '2017-09-01 14:21:29'),
	(28, 7, 611, 819, 'flow-site-ssr', 1, '2017-09-01 14:21:29'),
	(29, 7, 612, 821, 'flow-site-ssr', 1, '2017-09-01 14:21:29'),
	(30, 7, 613, 811, 'flow-site-ssr', 0, '2017-09-01 14:21:29'),
	(31, 7, 614, 821, 'flow-site-ssr', 1, '2017-09-01 14:21:39'),
	(32, 7, 616, 817, 'flow-site-ssr', 0, '2017-09-01 14:21:39'),
	(33, 7, 617, 821, 'flow-site-ssr', 1, '2017-09-01 14:21:39'),
	(34, 7, 619, 824, 'flow-site-ssr', 0, '2017-09-01 14:21:46'),
	(35, 8, 607, 809, 'flow-site-ssr', 1, '2017-09-01 14:23:18'),
	(36, 8, 608, 813, 'flow-site-ssr', 1, '2017-09-01 14:23:26'),
	(37, 8, 610, 815, 'flow-site-ssr', 0, '2017-09-01 14:24:00'),
	(38, 8, 611, 819, 'flow-site-ssr', 0, '2017-09-01 14:24:00'),
	(39, 8, 612, 821, 'flow-site-ssr', 0, '2017-09-01 14:24:00'),
	(40, 8, 613, 811, 'flow-site-ssr', 0, '2017-09-01 14:24:00');
/*!40000 ALTER TABLE `trx_siteplan_statuses` ENABLE KEYS */;


-- Dumping structure for table wssales.trx_tasks
CREATE TABLE IF NOT EXISTS `trx_tasks` (
  `tt_id` int(11) NOT NULL AUTO_INCREMENT,
  `tt_title` varchar(255) DEFAULT NULL,
  `tt_status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`tt_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table wssales.trx_tasks: ~1 rows (approximately)
/*!40000 ALTER TABLE `trx_tasks` DISABLE KEYS */;
INSERT INTO `trx_tasks` (`tt_id`, `tt_title`, `tt_status`) VALUES
	(1, 'Create module bpmn', 'todo');
/*!40000 ALTER TABLE `trx_tasks` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
