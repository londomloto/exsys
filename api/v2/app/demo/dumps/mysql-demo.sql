/*
Navicat MySQL Data Transfer

Source Server         : mysql@go.vm
Source Server Version : 50554
Source Host           : 192.168.56.5:3306
Source Database       : demo

Target Server Type    : MYSQL
Target Server Version : 50554
File Encoding         : 65001

Date: 2017-05-22 17:12:19
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for dia_diagrams
-- ----------------------------
DROP TABLE IF EXISTS `dia_diagrams`;
CREATE TABLE `dia_diagrams` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(50) DEFAULT 'activity',
  `name` varchar(100) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `cover` varchar(255) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dia_diagrams
-- ----------------------------
INSERT INTO `dia_diagrams` VALUES ('28', 'Graph.diagram.type.Activity', 'Activity Diagram', 'activity-diagram-33', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmodtempor incididunt ut labore et dolore magna aliqua', '092d9715408e6fd6b6753169c7cb4f7c.jpg', '2016-12-19 02:07:29', null);
INSERT INTO `dia_diagrams` VALUES ('32', 'Graph.diagram.type.Activity', 'Stacked Diagram', 'stacked-diagram', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmodtempor incididunt ut labore et dolore magna aliqua', '886e37e7a994026fdcaf71b22f15511d.jpg', '2016-12-19 05:16:11', null);
INSERT INTO `dia_diagrams` VALUES ('33', 'Graph.diagram.type.Activity', 'Registration Flow', 'registration-flow', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmodtempor incididunt ut labore et dolore magna aliqua', '7ebab72aeee11907f5c448f61c7fb68d.jpg', '2016-12-19 05:34:12', null);
INSERT INTO `dia_diagrams` VALUES ('34', 'Graph.diagram.type.Activity', 'Decision Flow', 'decision-flow', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmodtempor incididunt ut labore et dolore magna aliqua', 'f344cb4e2304e36e83c743fc1818c677.jpg', '2016-12-19 05:49:06', null);
INSERT INTO `dia_diagrams` VALUES ('37', 'Graph.diagram.type.Activity', 'Multi Phase', 'multi-phase', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmodtempor incididunt ut labore et dolore magna aliqua', 'b6dcf94d5957d40523e9db399075536d.jpg', '2016-12-19 16:37:58', null);
INSERT INTO `dia_diagrams` VALUES ('39', 'Graph.diagram.type.Activity', 'Activity Diagram', 'activity-diagram-32', 'No diagram description', '506a2e8a42adf10db533fef41648469e.jpg', '2016-12-19 23:51:36', null);
INSERT INTO `dia_diagrams` VALUES ('40', 'Graph.diagram.type.Activity', 'x', 'x', 'No diagram description', '0b4e4a92f445d44827604a06ee7224ba.jpg', '2017-01-26 09:07:02', null);
INSERT INTO `dia_diagrams` VALUES ('41', 'Graph.diagram.type.Activity', 'Activity Diagram', 'activity-diagram-31', 'No diagram description', 'd96523c808c97eec2bbaf9ed06a79a02.jpg', '2017-01-26 09:45:11', null);
INSERT INTO `dia_diagrams` VALUES ('42', 'Graph.diagram.type.Activity', 'Activity Diagram', 'activity-diagram-30', 'No diagram description', '5ce78a66dc9bccb932dbcbc1caf6effa.jpg', '2017-02-10 03:08:49', null);
INSERT INTO `dia_diagrams` VALUES ('43', 'Graph.diagram.type.Activity', 'Activity Diagram', 'activity-diagram-22', 'No diagram description', '9c008da92805a446ae2d27cd2e24b26e.jpg', '2017-02-10 04:01:55', null);
INSERT INTO `dia_diagrams` VALUES ('44', 'Graph.diagram.type.Activity', 'Activity Diagram', 'activity-diagram-21', 'No diagram description', '7e228c8ec4c8cd6ba0ead47274a4ed78.jpg', '2017-02-10 10:12:44', null);
INSERT INTO `dia_diagrams` VALUES ('45', 'Graph.diagram.type.Activity', 'Activity Diagram', 'activity-diagram-20', 'No diagram description', '95309f5a4e5c6555bffce367a3a77929.jpg', '2017-02-11 13:54:06', null);
INSERT INTO `dia_diagrams` VALUES ('46', 'Graph.diagram.type.Activity', 'Aplikasi A', 'aplikasi-a', 'No diagram description', '5488884517ab31527363bfb008153d8d.jpg', '2017-02-22 02:03:54', null);
INSERT INTO `dia_diagrams` VALUES ('47', 'Graph.diagram.type.Activity', 'Foobar', 'foobar', 'No diagram description', '87694c2c76689613f1c793529be2a23e.jpg', '2017-03-01 10:38:42', null);
INSERT INTO `dia_diagrams` VALUES ('49', 'Graph.diagram.type.Activity', 'Activity Diagram', 'activity-diagram-29', 'No diagram description', '2b6c85f472194e6db2f2536b5335128a.jpg', '2017-05-19 22:33:47', null);
INSERT INTO `dia_diagrams` VALUES ('50', 'Graph.diagram.type.Activity', 'Activity Diagram', 'activity-diagram-24', 'No diagram description', '7524926dd201e9d2415c1149de2342ea.jpg', '2017-05-19 22:34:42', null);
INSERT INTO `dia_diagrams` VALUES ('51', 'Graph.diagram.type.Activity', 'Activity Diagram', 'activity-diagram-28', 'No diagram description', '736276aa786c2fcbb42f295b1cc25802.jpg', '2017-05-19 22:35:20', null);
INSERT INTO `dia_diagrams` VALUES ('52', 'Graph.diagram.type.Activity', 'Activity Diagram', 'activity-diagram-26', 'No diagram description', 'ed0517fab7f33e5767a146be078be462.jpg', '2017-05-19 22:36:11', null);
INSERT INTO `dia_diagrams` VALUES ('53', 'Graph.diagram.type.Activity', 'Activity Diagram', 'activity-diagram-34', 'No diagram description', '74e196c8aba600fc993d9eb235c1c5de.jpg', '2017-05-19 22:37:01', null);
INSERT INTO `dia_diagrams` VALUES ('54', 'Graph.diagram.type.Activity', 'Test Diagram', 'test-diagram', 'No diagram description', '44f203fc1117170e59675f7cab9534c5.jpg', '2017-05-21 12:36:19', null);
INSERT INTO `dia_diagrams` VALUES ('55', 'Graph.diagram.type.Activity', 'Activity Diagram', 'activity-diagram-35', 'No diagram description', null, '2017-05-21 15:56:23', null);
INSERT INTO `dia_diagrams` VALUES ('56', 'Graph.diagram.type.Activity', 'Activity Diagram', 'activity-diagram-36', 'No diagram description', 'bd7e878b621202d87a79b95e6c5cac7e.jpg', '2017-05-21 18:39:05', null);
INSERT INTO `dia_diagrams` VALUES ('57', 'Graph.diagram.type.Activity', 'Triangle', 'triangle', 'No diagram description', '571d8481dcfccb1c12e5f8c8223b6d00.jpg', '2017-05-22 10:05:32', null);

-- ----------------------------
-- Table structure for dia_links
-- ----------------------------
DROP TABLE IF EXISTS `dia_links`;
CREATE TABLE `dia_links` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
) ENGINE=InnoDB AUTO_INCREMENT=329 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dia_links
-- ----------------------------
INSERT INTO `dia_links` VALUES ('96', 'graph-link-24', 'graph-shape-52', 'graph-shape-51', 'Graph.link.Orthogonal', 'orthogonal', '28', '138', '137', 'M282.69453865462975,155.50279722297637L282.69453865462975,194.14489748226708L490.13203610513415,194.14489748226708L490.13203610513415,126.14489748226701L547.6945386546297,126.14489748226681', null, '', '0.50000', '1', '0', '6', '[{\"key\":\"Data source\",\"value\":\"db.example\"}]');
INSERT INTO `dia_links` VALUES ('97', 'graph-link-25', 'graph-shape-51', 'graph-shape-53', 'Graph.link.Orthogonal', 'orthogonal', '28', '137', '139', 'M617.6945386546297,155.50279722297626L617.6945386546297,235.44029885325745L430.8889473697866,235.44029885325745L430.8889473697866,271.50279722297626L352.69453865462975,271.50279722297574', null, '', '0.50000', '1', '0', '6', '[{\"key\":\"Data source\",\"value\":\"db.example\"}]');
INSERT INTO `dia_links` VALUES ('98', 'graph-link-26', 'graph-shape-53', 'graph-shape-55', 'Graph.link.Orthogonal', 'orthogonal', '28', '139', '141', 'M268.01394736977517,301.50279722297626L268.0139473697754,373.1448988904174L547.6945386546297,373.14489889041783', null, '', '0.50000', '1', '0', '6', '[{\"key\":\"Data source\",\"value\":\"db.example\"}]');
INSERT INTO `dia_links` VALUES ('99', 'graph-link-27', 'graph-shape-55', 'graph-shape-54', 'Graph.link.Orthogonal', 'orthogonal', '28', '141', '140', 'M613.5559707293403,398.50279722297563L613.5559707293357,502.4545152268099L282.69453865462975,502.4545152268099L282.6945386546303,454.5027972229766', null, '', '0.50000', '1', '0', '6', '[{\"key\":\"Data source\",\"value\":\"db.example\"}]');
INSERT INTO `dia_links` VALUES ('105', 'graph-link-28', 'graph-shape-51', 'graph-shape-57', 'Graph.link.Orthogonal', 'orthogonal', '28', '137', '171', 'M687.6945386546297,125.50279722297641L1034.2788389893965,125.50279722297627L1034.2788389893965,299.9999999999998', null, '', '0.50000', '1', '0', '6', '[{\"key\":\"Data source\",\"value\":\"db.example\"}]');
INSERT INTO `dia_links` VALUES ('107', 'graph-link-29', 'graph-shape-56', 'graph-shape-57', 'Graph.link.Orthogonal', 'orthogonal', '28', '169', '171', 'M792.4280895728643,209.50279722297694L792.4280895728627,274.50279722297626L881.6698887128887,274.50279722297626L881.6698887128878,299.50279722297665', null, '', '0.50000', '1', '0', '6', '[{\"key\":\"Data source\",\"value\":\"db.example\"}]');
INSERT INTO `dia_links` VALUES ('109', 'graph-link-30', 'graph-shape-57', 'graph-shape-55', 'Graph.link.Orthogonal', 'orthogonal', '28', '171', '141', 'M921.5406925007683,314.50279722297665L921.5406925007683,368.50279722297626L687.6945386546297,368.50279722297637', null, '', '0.50000', '1', '0', '6', '[{\"key\":\"Data source\",\"value\":\"db.example\"}]');
INSERT INTO `dia_links` VALUES ('116', 'graph-link-22', 'graph-shape-44', 'graph-shape-46', 'Graph.link.Orthogonal', 'orthogonal', '32', '179', '181', 'M325,114.00000000000132L419.0000000000007,114L419.0000000000013,307.9999999999998', null, '', '0.50000', '1', '0', '6', '[{\"key\":\"Data source\",\"value\":\"db.example\"}]');
INSERT INTO `dia_links` VALUES ('117', 'graph-link-23', 'graph-shape-46', 'graph-shape-48', 'Graph.link.Orthogonal', 'orthogonal', '32', '181', '183', 'M489.00000000000006,338.0000000000006L611.0000000000058,338.0000000000017L611.000000000005,733.0000000000008', null, '', '0.50000', '1', '0', '6', '[{\"key\":\"Data source\",\"value\":\"db.example\"}]');
INSERT INTO `dia_links` VALUES ('124', 'graph-link-16', 'graph-shape-28', 'graph-shape-30', 'Graph.link.Orthogonal', 'orthogonal', '33', '200', '202', 'M268.5886073376147,-55.45473101035168L404.79020265344747,-55.45473101035168L404.79020265344775,-12.000000000000227', null, '', '0.50000', '1', '0', '6', '[{\"key\":\"Data source\",\"value\":\"db.example\"}]');
INSERT INTO `dia_links` VALUES ('125', 'graph-link-17', 'graph-shape-32', 'graph-shape-29', 'Graph.link.Orthogonal', 'orthogonal', '33', '204', '201', 'M953.0000000000001,17.545268989650253L1015.7902026534485,17.545268989649287L1015.7902026534485,-25.037965039470862', null, '', '0.50000', '1', '0', '6', '[{\"key\":\"Data source\",\"value\":\"db.example\"}]');
INSERT INTO `dia_links` VALUES ('126', 'graph-link-18', 'graph-shape-30', 'graph-shape-34', 'Graph.link.Orthogonal', 'orthogonal', '33', '202', '206', 'M405,48.00000000000011L405,367.99999999999886', null, '', '0.50000', '1', '0', '6', '[{\"key\":\"Data source\",\"value\":\"db.example\"}]');
INSERT INTO `dia_links` VALUES ('127', 'graph-link-19', 'graph-shape-34', 'graph-shape-35', 'Graph.link.Orthogonal', 'orthogonal', '33', '206', '207', 'M474.99999999999994,397.99999999999756L579,398.00000000000375', null, '', '0.50000', '1', '0', '6', '[{\"key\":\"Data source\",\"value\":\"db.example\"}]');
INSERT INTO `dia_links` VALUES ('128', 'graph-link-20', 'graph-shape-35', 'graph-shape-31', 'Graph.link.Orthogonal', 'orthogonal', '33', '207', '203', 'M649,368.0000000000003L649,47.99999999999995', null, '', '0.50000', '1', '0', '6', '[{\"key\":\"Data source\",\"value\":\"db.example\"}]');
INSERT INTO `dia_links` VALUES ('129', 'graph-link-21', 'graph-shape-31', 'graph-shape-32', 'Graph.link.Orthogonal', 'orthogonal', '33', '203', '204', 'M719.0000000000001,18.000000000002217L813.0000000000001,17.999999999999574', null, '', '0.50000', '1', '0', '6', '[{\"key\":\"Data source\",\"value\":\"db.example\"}]');
INSERT INTO `dia_links` VALUES ('135', 'graph-link-16', 'graph-shape-34', 'graph-shape-32', 'Graph.link.Orthogonal', 'orthogonal', '34', '215', '213', 'M466.0000000000004,226.9999999999998L466.00000000000085,277.0000000000005', null, '', '0.50000', '1', null, '6', '[{\"key\":\"Data source\",\"value\":\"db.example\"}]');
INSERT INTO `dia_links` VALUES ('136', 'graph-link-17', 'graph-shape-32', 'graph-shape-34', 'Graph.link.Orthogonal', 'orthogonal', '34', '213', '215', 'M415.9999999999983,327.0000000000005L273.0000000000001,327L273.0000000000001,197L396,197.00000000000003', null, 'Tidak', '0.08681', '1', null, '6', '[{\"key\":\"Data source\",\"value\":\"db.example\"}]');
INSERT INTO `dia_links` VALUES ('137', 'graph-link-18', 'graph-shape-32', 'graph-shape-35', 'Graph.link.Orthogonal', 'orthogonal', '34', '213', '216', 'M466.0000000000022,376.9999999999996L465.9999999999978,451.99999999999903', null, 'Ya', '0.50000', '1', null, '6', '[{\"key\":\"Data source\",\"value\":\"db.example\"}]');
INSERT INTO `dia_links` VALUES ('138', 'graph-link-19', 'graph-shape-33', 'graph-shape-34', 'Graph.link.Orthogonal', 'orthogonal', '34', '214', '215', 'M466,125.99999999999994L465.99999999999994,167.00000000000003', null, '', '0.50000', '1', null, '6', '[{\"key\":\"Data source\",\"value\":\"db.example\"}]');
INSERT INTO `dia_links` VALUES ('139', 'graph-link-20', 'graph-shape-35', 'graph-shape-36', 'Graph.link.Orthogonal', 'orthogonal', '34', '216', '217', 'M466.0000000000017,512.0000000000003L465.99999999999613,580.0000000000018', null, '', '0.50000', '1', null, '6', '[{\"key\":\"Data source\",\"value\":\"db.example\"}]');
INSERT INTO `dia_links` VALUES ('189', 'graph-link-15', 'graph-shape-21', 'graph-shape-24', 'Graph.link.Orthogonal', 'orthogonal', '39', '307', '310', 'M548.9190658390112,251.51334691694677L386.04544635261817,251.51334691694666L386.045446352627,468.7639108102417', null, '', '0.50000', '1', '0', '6', '[{\"key\":\"Data source\",\"value\":\"db.example\"}]');
INSERT INTO `dia_links` VALUES ('208', 'graph-link-5', 'graph-shape-8', 'graph-shape-9', 'Graph.link.Orthogonal', 'orthogonal', '37', '257', '258', 'M251.59570298818898,153.99999999999912L303,153.9999999999994', null, '', '0.50000', '1', '0', '6', '[{\"key\":\"Data source\",\"value\":\"db.example\"}]');
INSERT INTO `dia_links` VALUES ('209', 'graph-link-6', 'graph-shape-9', 'graph-shape-11', 'Graph.link.Orthogonal', 'orthogonal', '37', '258', '260', 'M372.99999999999943,184L373.0000000000009,284.00000000000045', null, '', '0.50000', '1', '0', '6', '[{\"key\":\"Data source\",\"value\":\"db.example\"}]');
INSERT INTO `dia_links` VALUES ('210', 'graph-link-7', 'graph-shape-11', 'graph-shape-12', 'Graph.link.Orthogonal', 'orthogonal', '37', '260', '322', 'M373.00000000000176,343.9999999999999L373.0000000000011,375.0000000000003', null, '', '0.50000', '1', '0', '6', '[{\"key\":\"Data source\",\"value\":\"db.example\"}]');
INSERT INTO `dia_links` VALUES ('211', 'graph-link-8', 'graph-shape-12', 'graph-shape-15', 'Graph.link.Orthogonal', 'orthogonal', '37', '322', '273', 'M372.99999999999415,425.00000000000335L373.0000000000029,530.0000000000014', null, '', '0.50000', '1', '0', '6', '[{\"key\":\"Data source\",\"value\":\"db.example\"}]');
INSERT INTO `dia_links` VALUES ('212', 'graph-link-9', 'graph-shape-12', 'graph-shape-14', 'Graph.link.Orthogonal', 'orthogonal', '37', '322', '262', 'M348.00000000000216,399.9999999999998L223.1241388768854,400L223.12413887688948,530.2034247693547', null, '', '0.50000', '1', '0', '6', '[{\"key\":\"Data source\",\"value\":\"db.example\"}]');
INSERT INTO `dia_links` VALUES ('213', 'graph-link-10', 'graph-shape-15', 'graph-shape-17', 'Graph.link.Orthogonal', 'orthogonal', '37', '273', '265', 'M443,559.999999999985L851.0000000000006,560L851.0000000000016,383.99999999999966', null, 'MESSAGE', '0.39943', '1', '0', '6', '[{\"key\":\"Data source\",\"value\":\"db.example\"}]');
INSERT INTO `dia_links` VALUES ('216', 'graph-link-6', 'graph-shape-10', 'graph-shape-12', 'Graph.link.Orthogonal', 'orthogonal', '41', '330', '332', 'M381.33385901661643,6.172267586551612L527.738156028427,6.172267586551726', null, '', '0.50000', '1', '0', '6', '[{\"key\":\"Data source\",\"value\":\"db.example\"}]');
INSERT INTO `dia_links` VALUES ('217', 'graph-link-7', 'graph-shape-12', 'graph-shape-11', 'Graph.link.Orthogonal', 'orthogonal', '41', '332', '331', 'M667.738156028427,6.1722675865517544L785.1424530402373,6.1722675865517544', null, '', '0.50000', '1', '0', '6', '[{\"key\":\"Data source\",\"value\":\"db.example\"}]');
INSERT INTO `dia_links` VALUES ('223', 'graph-link-8', 'graph-shape-16', 'graph-shape-11', 'Graph.link.Orthogonal', 'orthogonal', '41', '341', '331', 'M814.7185111200231,169.00495571006107L814.7380092452591,36.172241024590505', null, '', '0.50000', '1', '0', '6', '[{\"key\":\"Data source\",\"value\":\"db.example\"}]');
INSERT INTO `dia_links` VALUES ('224', 'graph-link-9', 'graph-shape-14', 'graph-shape-15', 'Graph.link.Orthogonal', 'orthogonal', '41', '339', '340', 'M402.73815602842706,199.17226758656076L527.738156028427,199.1722675865477', null, '', '0.50000', '1', '0', '6', '[{\"key\":\"Data source\",\"value\":\"db.example\"}]');
INSERT INTO `dia_links` VALUES ('225', 'graph-link-10', 'graph-shape-15', 'graph-shape-16', 'Graph.link.Orthogonal', 'orthogonal', '41', '340', '341', 'M667.7240519165344,199.0086114071482L744.7183643329507,199.00500258138717', null, '', '0.50000', '1', '0', '6', '[{\"key\":\"Data source\",\"value\":\"db.example\"}]');
INSERT INTO `dia_links` VALUES ('227', 'graph-link-11', 'graph-shape-16', 'graph-shape-17', 'Graph.link.Orthogonal', 'orthogonal', '41', '341', '344', 'M884.738156028427,199.17226758655718L1015.738156028427,199.17226758655804', null, '', '0.50000', '1', '0', '6', '[{\"key\":\"Data source\",\"value\":\"db.example\"}]');
INSERT INTO `dia_links` VALUES ('229', 'graph-link-12', 'graph-shape-12', 'graph-shape-15', 'Graph.link.Orthogonal', 'orthogonal', '41', '332', '340', 'M597.7381560284243,36.17226758655326L597.738156028435,169.17226758655246', null, 'reject', '0.25376', '1', '0', '6', '[{\"key\":\"Data source\",\"value\":\"db.example\"}]');
INSERT INTO `dia_links` VALUES ('231', 'graph-link-13', 'graph-shape-10', 'graph-shape-14', 'Graph.link.Orthogonal', 'orthogonal', '41', '330', '339', 'M322.404297011811,6.000000000000008L256.3085263987965,6L256.3085263987965,199L282,198.99999999999997', null, '', '0.50000', '1', '0', '6', '[{\"key\":\"Data source\",\"value\":\"db.example\"}]');
INSERT INTO `dia_links` VALUES ('233', 'graph-link-14', 'graph-shape-14', 'graph-shape-19', 'Graph.link.Orthogonal', 'orthogonal', '41', '339', '346', 'M342.2381560284264,229.17226758655266L342.23815602842706,330.89820397868795L489.0000000000002,330.89820397868795L488.9999999999993,381.9999999999992', null, '', '0.50000', '1', '0', '6', '[{\"key\":\"Data source\",\"value\":\"db.example\"}]');
INSERT INTO `dia_links` VALUES ('238', 'graph-link-5', 'graph-shape-7', 'graph-shape-8', 'Graph.link.Orthogonal', 'orthogonal', '42', '349', '354', 'M323,161.99999999999997L486.28427124,161.99999999999986L486.2842712399996,277.2842712399986', null, '', '0.50000', '1', '0', '6', '[{\"key\":\"Data source\",\"value\":\"db.example\"}]');
INSERT INTO `dia_links` VALUES ('240', 'graph-link-4', 'graph-shape-4', 'graph-shape-5', 'Graph.link.Orthogonal', 'orthogonal', '43', '357', '358', 'M217.00000000000003,154.00000000000207L430,154.00000000000233', null, '', '0.50000', '1', null, '6', '[{\"field\":\"A\",\"comparison\":\"=\",\"value\":\"1\",\"operator\":\"AND\",\"editing\":false},{\"field\":\"B\",\"comparison\":\"<\",\"value\":\"1\",\"operator\":\"\"}]');
INSERT INTO `dia_links` VALUES ('250', 'graph-link-1', 'graph-shape-1', 'graph-shape-2', 'Graph.link.Orthogonal', 'orthogonal', '44', '368', '369', 'M315.99999999999994,186.99999999999994L440,187L440.00000000000085,316.0000000000001', null, '', '0.50000', '1', null, '6', '[]');
INSERT INTO `dia_links` VALUES ('251', 'graph-link-2', 'graph-shape-1', 'graph-shape-3', 'Graph.link.Orthogonal', 'orthogonal', '44', '368', '370', 'M246.00000000000014,217.00000000000009L246.00000000000034,316.0000000000003', null, '', '0.50000', '1', null, '6', '[]');
INSERT INTO `dia_links` VALUES ('252', 'graph-link-3', 'graph-shape-2', 'graph-shape-3', 'Graph.link.Orthogonal', 'orthogonal', '44', '369', '370', 'M370,345.99999999999994L316,345.9999999999988', null, '', '0.50000', '1', null, '6', '[]');
INSERT INTO `dia_links` VALUES ('254', 'graph-link-16', 'graph-shape-20', 'graph-shape-19', 'Graph.link.Orthogonal', 'orthogonal', '40', '324', '323', 'M272,215.00000000000023L382,215L382.00000000000006,167', null, '', '0.50000', '1', null, '6', '[]');
INSERT INTO `dia_links` VALUES ('269', 'graph-link-1', 'graph-shape-1', 'graph-shape-3', 'Graph.link.Orthogonal', 'orthogonal', '45', '382', '384', 'M192.5957029881889,130.00000000000003L346,130L346,159.00000000000014', null, '', '0.50000', '1', null, '6', '[]');
INSERT INTO `dia_links` VALUES ('270', 'graph-link-12', 'graph-shape-11', 'graph-shape-2', 'Graph.link.Orthogonal', 'orthogonal', '45', '392', '383', 'M163.0000000000015,622.9999999999994L163.00000000000043,673.0000000000001', null, '', '0.50000', '1', null, '6', '[]');
INSERT INTO `dia_links` VALUES ('271', 'graph-link-3', 'graph-shape-3', 'graph-shape-5', 'Graph.link.Orthogonal', 'orthogonal', '45', '384', '386', 'M416,189.00000000000054L579,189L579.0000000000009,341.00000000000017', null, '', '0.50000', '1', null, '6', '[]');
INSERT INTO `dia_links` VALUES ('272', 'graph-link-5', 'graph-shape-3', 'graph-shape-4', 'Graph.link.Orthogonal', 'orthogonal', '45', '384', '385', 'M345.9999999999999,219.00000000000054L346.00000000000034,341.00000000000057', null, '', '0.50000', '1', null, '6', '[]');
INSERT INTO `dia_links` VALUES ('273', 'graph-link-13', 'graph-shape-6', 'graph-shape-3', 'Graph.link.Orthogonal', 'orthogonal', '45', '387', '384', 'M162.99999999999986,341.0000000000002L163,189L276,188.99999999999994', null, '', '0.50000', '1', null, '6', '[]');
INSERT INTO `dia_links` VALUES ('274', 'graph-link-4', 'graph-shape-5', 'graph-shape-4', 'Graph.link.Orthogonal', 'orthogonal', '45', '386', '385', 'M509.00000000000006,370.99999999999994L416,370.9999999999976', null, '', '0.50000', '1', null, '6', '[]');
INSERT INTO `dia_links` VALUES ('275', 'graph-link-14', 'graph-shape-4', 'graph-shape-10', 'Graph.link.Orthogonal', 'orthogonal', '45', '385', '391', 'M346.00000000000006,401.0000000000012L345.99999999999994,563', null, '', '0.50000', '1', null, '6', '[]');
INSERT INTO `dia_links` VALUES ('276', 'graph-link-6', 'graph-shape-5', 'graph-shape-6', 'Graph.link.Orthogonal', 'orthogonal', '45', '386', '387', 'M578.999999999999,401.0000000000004L579,446.0000000000007L163,446.0000000000007L163.0000000000004,401.00000000000017', null, '', '0.50000', '1', null, '6', '[]');
INSERT INTO `dia_links` VALUES ('277', 'graph-link-7', 'graph-shape-5', 'graph-shape-7', 'Graph.link.Orthogonal', 'orthogonal', '45', '386', '388', 'M649,371.00000000000153L699,371.00000000000205', null, '', '0.50000', '1', null, '6', '[]');
INSERT INTO `dia_links` VALUES ('278', 'graph-link-15', 'graph-shape-8', 'graph-shape-6', 'Graph.link.Orthogonal', 'orthogonal', '45', '389', '387', 'M699,503.99999999999665L47,504L47,371L92.99999999999999,371.0000000000001', null, '', '0.50000', '1', null, '6', '[]');
INSERT INTO `dia_links` VALUES ('279', 'graph-link-8', 'graph-shape-7', 'graph-shape-8', 'Graph.link.Orthogonal', 'orthogonal', '45', '388', '389', 'M768.9999999999905,400.9999999999997L768.9999999999936,473.9999999999972', null, '', '0.50000', '1', null, '6', '[]');
INSERT INTO `dia_links` VALUES ('280', 'graph-link-9', 'graph-shape-8', 'graph-shape-9', 'Graph.link.Orthogonal', 'orthogonal', '45', '389', '390', 'M769,534.0000000000014L769.0000000000005,593L649,593.0000000000014', null, '', '0.50000', '1', null, '6', '[]');
INSERT INTO `dia_links` VALUES ('281', 'graph-link-10', 'graph-shape-9', 'graph-shape-10', 'Graph.link.Orthogonal', 'orthogonal', '45', '390', '391', 'M509.00000000000006,592.999999999994L416,593.0000000000044', null, '', '0.50000', '1', null, '6', '[]');
INSERT INTO `dia_links` VALUES ('282', 'graph-link-11', 'graph-shape-10', 'graph-shape-11', 'Graph.link.Orthogonal', 'orthogonal', '45', '391', '392', 'M276,593L233,593', null, '', '0.50000', '1', null, '6', '[]');
INSERT INTO `dia_links` VALUES ('290', 'graph-link-1', 'graph-shape-1', 'graph-shape-2', 'Graph.link.Orthogonal', 'orthogonal', '46', '401', '402', 'M135.99999999999991,104.00000000000007L136.00000000000014,141.00000000000006', null, '', '0.50000', '1', null, '6', '[]');
INSERT INTO `dia_links` VALUES ('291', 'graph-link-2', 'graph-shape-2', 'graph-shape-3', 'Graph.link.Orthogonal', 'orthogonal', '46', '402', '403', 'M135.99999999999952,200.99999999999994L135.99999999999986,256.00000000000006', null, '', '0.50000', '1', null, '6', '[]');
INSERT INTO `dia_links` VALUES ('292', 'graph-link-3', 'graph-shape-3', 'graph-shape-4', 'Graph.link.Orthogonal', 'orthogonal', '46', '403', '404', 'M136.00000000000009,316L136.0000000000002,378.0000000000002', null, '', '0.50000', '1', null, '6', '[]');
INSERT INTO `dia_links` VALUES ('293', 'graph-link-4', 'graph-shape-4', 'graph-shape-5', 'Graph.link.Orthogonal', 'orthogonal', '46', '404', '405', 'M206,407.9999999999982L261.00000000000017,408L261.00000000000017,-1.9184653865522705e-13L573,-1.9184653865522705e-13L573.0000000000001,43.999999999999964', null, '', '0.50000', '1', null, '6', '[]');
INSERT INTO `dia_links` VALUES ('294', 'graph-link-5', 'graph-shape-5', 'graph-shape-6', 'Graph.link.Orthogonal', 'orthogonal', '46', '405', '406', 'M573.0000000000003,104.00000000000023L573.0000000000003,140.99999999999994', null, '', '0.50000', '1', null, '6', '[]');
INSERT INTO `dia_links` VALUES ('295', 'graph-link-6', 'graph-shape-6', 'graph-shape-7', 'Graph.link.Orthogonal', 'orthogonal', '46', '406', '407', 'M572.9999999999997,201.00000000000023L573.0000000000013,256.00000000000017', null, '', '0.50000', '1', null, '6', '[]');
INSERT INTO `dia_links` VALUES ('296', 'graph-link-7', 'graph-shape-7', 'graph-shape-8', 'Graph.link.Orthogonal', 'orthogonal', '46', '407', '408', 'M573.000000000003,315.99999999999926L573.0000000000022,377.99999999999926', null, '', '0.50000', '1', null, '6', '[]');
INSERT INTO `dia_links` VALUES ('299', 'graph-link-8', 'graph-shape-5', 'graph-shape-9', 'Graph.link.Orthogonal', 'orthogonal', '46', '405', '410', 'M503,73.99999999999979L374,74L373.99999999999994,141.00000000000009', null, '', '0.50000', '1', null, '6', '[]');
INSERT INTO `dia_links` VALUES ('300', 'graph-link-9', 'graph-shape-9', 'graph-shape-7', 'Graph.link.Orthogonal', 'orthogonal', '46', '410', '407', 'M373.99999999999966,200.99999999999991L374,286L503,286.0000000000014', null, '', '0.50000', '1', null, '6', '[]');
INSERT INTO `dia_links` VALUES ('304', 'graph-link-10', 'graph-shape-5', 'graph-shape-10', 'Graph.link.Orthogonal', 'orthogonal', '46', '405', '413', 'M643,74.00000000000013L770,74L769.9999999999999,140.9999999999993', null, '', '0.50000', '1', null, '6', '[]');
INSERT INTO `dia_links` VALUES ('305', 'graph-link-11', 'graph-shape-11', 'graph-shape-8', 'Graph.link.Orthogonal', 'orthogonal', '46', '414', '408', 'M769.9999999999997,316.0000000000008L770,339.00000000000114L573,339.00000000000114L572.9999999999992,377.99999999999983', null, '', '0.50000', '1', null, '6', '[]');
INSERT INTO `dia_links` VALUES ('306', 'graph-link-12', 'graph-shape-10', 'graph-shape-11', 'Graph.link.Orthogonal', 'orthogonal', '46', '413', '414', 'M770.0000000000014,201.0000000000013L770,255.99999999999906', null, '', '0.50000', '1', null, '6', '[]');
INSERT INTO `dia_links` VALUES ('309', 'graph-link-1', 'graph-shape-1', 'graph-shape-2', 'Graph.link.Orthogonal', 'orthogonal', '47', '419', '420', 'M441.99999999999994,166.99999999999886L575,167.0000000000008', '#000', '', '0.50000', '1', '0', '6', '[]');
INSERT INTO `dia_links` VALUES ('310', 'graph-link-3', 'graph-shape-4', 'graph-shape-5', 'Graph.link.Orthogonal', 'orthogonal', '49', '421', '422', 'M196.59570298818866,92.99999999999966L414,93.00000000000229', '#000', '', '0.50000', '1', '1', '6', '[]');
INSERT INTO `dia_links` VALUES ('311', 'graph-link-4', 'graph-shape-5', 'graph-shape-6', 'Graph.link.Orthogonal', 'orthogonal', '49', '422', '423', 'M483.99999999999983,123.00000000000021L484.0000000000029,223.99999999999946', '#000', '', '0.50000', '1', '1', '6', '[]');
INSERT INTO `dia_links` VALUES ('312', 'graph-link-1', 'graph-shape-1', 'graph-shape-2', 'Graph.link.Orthogonal', 'orthogonal', '50', '424', '425', 'M196.59570298818866,92.99999999999966L414,93.00000000000229', '#000', '', '0.50000', '1', '0', '6', '[]');
INSERT INTO `dia_links` VALUES ('313', 'graph-link-2', 'graph-shape-2', 'graph-shape-3', 'Graph.link.Orthogonal', 'orthogonal', '50', '425', '426', 'M483.99999999999983,123.00000000000021L484.0000000000029,223.99999999999946', '#000', '', '0.50000', '1', '0', '6', '[]');
INSERT INTO `dia_links` VALUES ('315', 'graph-link-1', 'graph-shape-1', 'graph-shape-3', 'Graph.link.Orthogonal', 'orthogonal', '51', '427', '435', 'M435.82959641255917,142.82959641255937L435.8295964125595,81L615.1315789473643,81L615.1315789473643,227.99999999999952', '#000', '', '0.50000', '1', '0', '6', '[]');
INSERT INTO `dia_links` VALUES ('316', 'graph-link-2', 'graph-shape-2', 'graph-shape-3', 'Graph.link.Orthogonal', 'orthogonal', '51', '434', '435', 'M435.88516746411466,359.1148325358851L435.88516746411466,422L612.2916666666575,422L612.2916666666575,288.0000000000007', '#000', '', '0.50000', '1', '0', '6', '[]');
INSERT INTO `dia_links` VALUES ('317', 'graph-link-1', 'graph-shape-2', 'graph-shape-3', 'Graph.link.Orthogonal', 'orthogonal', '54', '438', '439', 'M580.5957029881888,120.99999999999989L792,121L791.9999999999998,162.99999999999986', '#000', '', '0.50000', '1', '0', '6', '[]');
INSERT INTO `dia_links` VALUES ('318', 'graph-link-1', 'graph-shape-1', 'graph-shape-2', 'Graph.link.Orthogonal', 'orthogonal', '56', '440', '441', 'M493.595702988189,131.99999999999974L597,131.99999999999974L596.9999999999793,248.000000000004', '#000', '', '0.50000', '1', '0', '6', '[{\"field\":\"A\",\"comparison\":\"=\",\"value\":\"10\",\"operator\":\"AND\"},{\"field\":\"B\",\"comparison\":\"=\",\"value\":\"20\",\"operator\":\"\"}]');
INSERT INTO `dia_links` VALUES ('324', 'graph-link-1', 'graph-shape-1', 'graph-shape-2', 'Graph.link.Orthogonal', 'orthogonal', '57', '448', '449', 'M426.99999999999983,104.00000000000031L427,127.99999999999984', '#000', '', '0.50000', '1', '0', '6', '[]');
INSERT INTO `dia_links` VALUES ('325', 'graph-link-2', 'graph-shape-2', 'graph-shape-3', 'Graph.link.Orthogonal', 'orthogonal', '57', '449', '450', 'M426.9999999999992,188.00000000000065L426.9999999999994,225.99999999999943', '#000', '', '0.50000', '1', '0', '6', '[]');
INSERT INTO `dia_links` VALUES ('326', 'graph-link-3', 'graph-shape-3', 'graph-shape-4', 'Graph.link.Orthogonal', 'orthogonal', '57', '450', '451', 'M427,285.9999999999994L427,329.99999999999943', '#000', '', '0.50000', '1', '0', '6', '[]');
INSERT INTO `dia_links` VALUES ('327', 'graph-link-4', 'graph-shape-4', 'graph-shape-5', 'Graph.link.Orthogonal', 'orthogonal', '57', '451', '452', 'M426.9999999999988,390.0000000000014L427.00000000000307,431.76190476190527', '#000', '', '0.50000', '1', '0', '6', '[]');
INSERT INTO `dia_links` VALUES ('328', 'graph-link-5', 'graph-shape-5', 'graph-shape-6', 'Graph.link.Orthogonal', 'orthogonal', '57', '452', '453', 'M427,491.7619047619044L427,537.7619047619046', '#000', '', '0.50000', '1', '0', '6', '[]');

-- ----------------------------
-- Table structure for dia_shapes
-- ----------------------------
DROP TABLE IF EXISTS `dia_shapes`;
CREATE TABLE `dia_shapes` (
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
) ENGINE=InnoDB AUTO_INCREMENT=454 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dia_shapes
-- ----------------------------
INSERT INTO `dia_shapes` VALUES ('136', 'graph-shape-50', null, 'pool-18', 'Graph.shape.activity.Lane', null, '28', null, '1040', '451', '139', '76', null, 'Participant Role', 'rgb(255, 255, 255)', 'rgb(0, 0, 0)', '2', '[{\"key\":\"Source\",\"value\":\"db.employee\"}]');
INSERT INTO `dia_shapes` VALUES ('137', 'graph-shape-51', 'graph-shape-50', null, 'Graph.shape.activity.Action', null, '28', '136', '140', '60', '359', '20', null, 'Action', 'rgb(255, 255, 255)', 'rgb(0, 0, 0)', '2', '[{\"key\":\"Source\",\"value\":\"db.employee\"}]');
INSERT INTO `dia_shapes` VALUES ('138', 'graph-shape-52', 'graph-shape-50', null, 'Graph.shape.activity.Action', null, '28', '136', '140', '60', '24', '20', null, 'Action', 'rgb(255, 255, 255)', 'rgb(0, 0, 0)', '2', '[{\"key\":\"Source\",\"value\":\"db.employee\"}]');
INSERT INTO `dia_shapes` VALUES ('139', 'graph-shape-53', 'graph-shape-50', null, 'Graph.shape.activity.Action', null, '28', '136', '140', '60', '24', '166', null, 'A', 'rgb(255, 255, 255)', 'rgb(0, 0, 0)', '2', '[{\"key\":\"Source\",\"value\":\"db.employee\"}]');
INSERT INTO `dia_shapes` VALUES ('140', 'graph-shape-54', 'graph-shape-50', null, 'Graph.shape.activity.Action', null, '28', '136', '140', '60', '24', '319', null, 'Action', 'rgb(255, 255, 255)', 'rgb(0, 0, 0)', '2', '[{\"key\":\"Source\",\"value\":\"db.employee\"}]');
INSERT INTO `dia_shapes` VALUES ('141', 'graph-shape-55', 'graph-shape-50', null, 'Graph.shape.activity.Action', null, '28', '136', '140', '60', '359', '263', null, 'Action', 'rgb(255, 255, 255)', 'rgb(0, 0, 0)', '2', '[{\"key\":\"Source\",\"value\":\"db.employee\"}]');
INSERT INTO `dia_shapes` VALUES ('169', 'graph-shape-56', 'graph-shape-50', null, 'Graph.shape.activity.Action', null, '28', '136', '140', '60', '526', '74', null, 'Action', 'rgb(255, 255, 255)', 'rgb(0, 0, 0)', '2', '[{\"key\":\"Source\",\"value\":\"db.employee\"}]');
INSERT INTO `dia_shapes` VALUES ('171', 'graph-shape-57', 'graph-shape-50', null, 'Graph.shape.activity.Join', null, '28', '136', '300', '15', '595', '224', null, '', 'rgb(255, 255, 255)', 'rgb(0, 0, 0)', '2', '[{\"key\":\"Source\",\"value\":\"db.employee\"}]');
INSERT INTO `dia_shapes` VALUES ('178', 'graph-shape-43', null, 'pool-14', 'Graph.shape.activity.Lane', null, '32', null, '1000', '200', '75', '38', null, 'Participant Role', 'rgb(255, 255, 255)', 'rgb(0, 0, 0)', '2', '[{\"key\":\"Source\",\"value\":\"db.employee\"}]');
INSERT INTO `dia_shapes` VALUES ('179', 'graph-shape-44', 'graph-shape-43', null, 'Graph.shape.activity.Action', null, '32', '178', '140', '60', '60', '46', null, 'A', 'rgb(255, 255, 255)', 'rgb(0, 0, 0)', '2', '[{\"key\":\"Source\",\"value\":\"db.employee\"}]');
INSERT INTO `dia_shapes` VALUES ('180', 'graph-shape-45', null, 'pool-14', 'Graph.shape.activity.Lane', null, '32', null, '1000', '200', '75', '238', null, 'Participant Role', 'rgb(255, 255, 255)', 'rgb(0, 0, 0)', '2', '[{\"key\":\"Source\",\"value\":\"db.employee\"}]');
INSERT INTO `dia_shapes` VALUES ('181', 'graph-shape-46', 'graph-shape-45', null, 'Graph.shape.activity.Action', null, '32', '180', '140', '60', '224', '70', null, 'B', 'rgb(255, 255, 255)', 'rgb(0, 0, 0)', '2', '[{\"key\":\"Source\",\"value\":\"db.employee\"}]');
INSERT INTO `dia_shapes` VALUES ('182', 'graph-shape-47', null, 'pool-14', 'Graph.shape.activity.Lane', null, '32', null, '1000', '200', '75', '638', null, 'Participant Role', 'rgb(255, 255, 255)', 'rgb(0, 0, 0)', '2', '[{\"key\":\"Source\",\"value\":\"db.employee\"}]');
INSERT INTO `dia_shapes` VALUES ('183', 'graph-shape-48', 'graph-shape-47', null, 'Graph.shape.activity.Action', null, '32', '182', '140', '60', '416', '95', null, 'C', 'rgb(255, 255, 255)', 'rgb(0, 0, 0)', '2', '[{\"key\":\"Source\",\"value\":\"db.employee\"}]');
INSERT INTO `dia_shapes` VALUES ('185', 'graph-shape-49', null, 'pool-14', 'Graph.shape.activity.Lane', null, '32', null, '1000', '200', '75', '438', null, 'Participant Role', 'rgb(255, 255, 255)', 'rgb(0, 0, 0)', '2', '[{\"key\":\"Source\",\"value\":\"db.employee\"}]');
INSERT INTO `dia_shapes` VALUES ('199', 'graph-shape-27', null, 'pool-9', 'Graph.shape.activity.Lane', null, '33', null, '1000', '200', '103', '-119', null, 'Visitor', 'rgb(255, 255, 255)', 'rgb(0, 0, 0)', '2', '[{\"key\":\"Source\",\"value\":\"db.employee\"}]');
INSERT INTO `dia_shapes` VALUES ('200', 'graph-shape-28', 'graph-shape-27', null, 'Graph.shape.activity.Start', null, '33', '199', '60', '60', '56', '34', null, 'Start', 'rgb(255, 255, 255)', '#FF4081', '2', '[{\"key\":\"Source\",\"value\":\"db.employee\"}]');
INSERT INTO `dia_shapes` VALUES ('201', 'graph-shape-29', 'graph-shape-27', null, 'Graph.shape.activity.Final', null, '33', '199', '60', '60', '833', '34', null, 'End', '#FF4081', 'rgb(0, 0, 0)', '2', '[{\"key\":\"Source\",\"value\":\"db.employee\"}]');
INSERT INTO `dia_shapes` VALUES ('202', 'graph-shape-30', 'graph-shape-27', null, 'Graph.shape.activity.Action', null, '33', '199', '140', '60', '182', '107', null, 'Daftar', '#FFFFFF', '#0CC2AA', '2', '[{\"key\":\"Source\",\"value\":\"db.employee\"}]');
INSERT INTO `dia_shapes` VALUES ('203', 'graph-shape-31', 'graph-shape-27', null, 'Graph.shape.activity.Action', null, '33', '199', '140', '60', '426', '107', null, 'Terima Email', 'rgb(255, 255, 255)', '#FF4081', '2', '[{\"key\":\"Source\",\"value\":\"db.employee\"}]');
INSERT INTO `dia_shapes` VALUES ('204', 'graph-shape-32', 'graph-shape-27', null, 'Graph.shape.activity.Action', null, '33', '199', '140', '60', '660', '107', null, 'Login', 'rgb(255, 255, 255)', 'rgb(0, 0, 0)', '2', '[{\"key\":\"Source\",\"value\":\"db.employee\"}]');
INSERT INTO `dia_shapes` VALUES ('205', 'graph-shape-33', null, 'pool-9', 'Graph.shape.activity.Lane', null, '33', null, '1000', '200', '103', '281', null, 'Administrator', 'rgb(255, 255, 255)', 'rgb(0, 0, 0)', '2', '[{\"key\":\"Source\",\"value\":\"db.employee\"}]');
INSERT INTO `dia_shapes` VALUES ('206', 'graph-shape-34', 'graph-shape-33', null, 'Graph.shape.activity.Action', null, '33', '205', '140', '60', '182', '87', null, 'Approval', 'rgb(255, 255, 255)', '#000000', '2', '[{\"key\":\"Source\",\"value\":\"db.employee\"}]');
INSERT INTO `dia_shapes` VALUES ('207', 'graph-shape-35', 'graph-shape-33', null, 'Graph.shape.activity.Action', null, '33', '205', '140', '60', '426', '87', null, 'Kirim Email', '#FFFFFF', 'rgb(0, 0, 0)', '2', '[{\"key\":\"Source\",\"value\":\"db.employee\"}]');
INSERT INTO `dia_shapes` VALUES ('213', 'graph-shape-32', null, null, 'Graph.shape.activity.Router', null, '34', null, '100', '100', '416', '277', null, 'X > 5', 'rgb(255, 255, 255)', 'rgb(0, 0, 0)', '2', '[{\"key\":\"Source\",\"value\":\"db.employee\"}]');
INSERT INTO `dia_shapes` VALUES ('214', 'graph-shape-33', null, null, 'Graph.shape.activity.Start', null, '34', null, '60', '60', '436', '66', null, 'Start', 'rgb(255, 255, 255)', 'rgb(0, 0, 0)', '2', '[{\"key\":\"Source\",\"value\":\"db.employee\"}]');
INSERT INTO `dia_shapes` VALUES ('215', 'graph-shape-34', null, null, 'Graph.shape.activity.Action', null, '34', null, '140', '60', '396', '167', null, 'Input X', 'rgb(255, 255, 255)', 'rgb(0, 0, 0)', '2', '[{\"key\":\"Source\",\"value\":\"db.employee\"}]');
INSERT INTO `dia_shapes` VALUES ('216', 'graph-shape-35', null, null, 'Graph.shape.activity.Action', null, '34', null, '140', '60', '396', '452', null, 'Tampilkan', 'rgb(255, 255, 255)', 'rgb(0, 0, 0)', '2', '[{\"key\":\"Source\",\"value\":\"db.employee\"}]');
INSERT INTO `dia_shapes` VALUES ('217', 'graph-shape-36', null, null, 'Graph.shape.activity.Final', null, '34', null, '60', '60', '436', '580', null, 'End', '#FF4081', 'rgb(0, 0, 0)', '2', '[{\"key\":\"Source\",\"value\":\"db.employee\"}]');
INSERT INTO `dia_shapes` VALUES ('255', 'graph-shape-7', null, 'pool-1', 'Graph.shape.activity.Lane', null, '37', null, '377', '181', '124', '69', null, 'Participant Role', 'rgb(255, 255, 255)', 'rgb(0, 0, 0)', '2', '[{\"key\":\"Source\",\"value\":\"db.employee\"}]');
INSERT INTO `dia_shapes` VALUES ('257', 'graph-shape-8', 'graph-shape-7', null, 'Graph.shape.activity.Start', null, '37', '255', '60', '60', '18', '55', null, 'Start', 'rgb(255, 255, 255)', 'rgb(0, 0, 0)', '2', '[{\"key\":\"Source\",\"value\":\"db.employee\"}]');
INSERT INTO `dia_shapes` VALUES ('258', 'graph-shape-9', 'graph-shape-7', null, 'Graph.shape.activity.Action', null, '37', '255', '140', '60', '129', '55', null, 'Action', 'rgb(255, 255, 255)', 'rgb(0, 0, 0)', '2', '[{\"key\":\"Source\",\"value\":\"db.employee\"}]');
INSERT INTO `dia_shapes` VALUES ('259', 'graph-shape-10', null, 'pool-1', 'Graph.shape.activity.Lane', null, '37', null, '377', '215', '124', '250', null, 'Participant Role', 'rgb(255, 255, 255)', 'rgb(0, 0, 0)', '2', '[{\"key\":\"Source\",\"value\":\"db.employee\"}]');
INSERT INTO `dia_shapes` VALUES ('260', 'graph-shape-11', 'graph-shape-10', null, 'Graph.shape.activity.Action', null, '37', '259', '140', '60', '129', '34', null, 'Action', 'rgb(255, 255, 255)', 'rgb(0, 0, 0)', '2', '[{\"key\":\"Source\",\"value\":\"db.employee\"}]');
INSERT INTO `dia_shapes` VALUES ('261', 'graph-shape-13', null, 'pool-1', 'Graph.shape.activity.Lane', null, '37', null, '377', '200', '124', '465', null, 'Participant Role', 'rgb(255, 255, 255)', 'rgb(0, 0, 0)', '2', '[{\"key\":\"Source\",\"value\":\"db.employee\"}]');
INSERT INTO `dia_shapes` VALUES ('262', 'graph-shape-14', 'graph-shape-13', null, 'Graph.shape.activity.Final', null, '37', '261', '60', '60', '18', '65', null, 'End', '#FF4081', 'rgb(0, 0, 0)', '2', '[{\"key\":\"Source\",\"value\":\"db.employee\"}]');
INSERT INTO `dia_shapes` VALUES ('263', 'graph-shape-16', null, 'pool-4', 'Graph.shape.activity.Lane', null, '37', null, '402', '200', '643', '257', null, 'Participant Role', 'rgb(255, 255, 255)', 'rgb(0, 0, 0)', '2', '[{\"key\":\"Source\",\"value\":\"db.employee\"}]');
INSERT INTO `dia_shapes` VALUES ('265', 'graph-shape-17', 'graph-shape-16', null, 'Graph.shape.activity.Action', null, '37', '263', '140', '60', '88', '67', null, 'Action', 'rgb(255, 255, 255)', 'rgb(0, 0, 0)', '2', '[{\"key\":\"Source\",\"value\":\"db.employee\"}]');
INSERT INTO `dia_shapes` VALUES ('273', 'graph-shape-15', 'graph-shape-13', null, 'Graph.shape.activity.Action', null, '37', '261', '140', '60', '129', '65', null, 'Action', 'rgb(255, 255, 255)', 'rgb(0, 0, 0)', '2', '[{\"key\":\"Source\",\"value\":\"db.employee\"}]');
INSERT INTO `dia_shapes` VALUES ('281', 'graph-shape-36', 'graph-shape-33', null, 'Graph.shape.activity.Action', null, '33', '205', '140', '60', '16', '87', null, 'Action', 'rgb(255, 255, 255)', 'rgb(0, 0, 0)', '2', '[{\"key\":\"Source\",\"value\":\"db.employee\"}]');
INSERT INTO `dia_shapes` VALUES ('282', 'graph-shape-37', null, 'pool-9', 'Graph.shape.activity.Lane', null, '33', null, '1000', '200', '103', '681', null, 'Participant Role', 'rgb(255, 255, 255)', 'rgb(0, 0, 0)', '2', '[{\"key\":\"Source\",\"value\":\"db.employee\"}]');
INSERT INTO `dia_shapes` VALUES ('283', 'graph-shape-38', null, 'pool-9', 'Graph.shape.activity.Lane', null, '33', null, '1000', '200', '103', '81', null, 'Participant Role', 'rgb(255, 255, 255)', 'rgb(0, 0, 0)', '2', '[{\"key\":\"Source\",\"value\":\"db.employee\"}]');
INSERT INTO `dia_shapes` VALUES ('284', 'graph-shape-39', 'graph-shape-38', null, 'Graph.shape.activity.Action', null, '33', '283', '140', '60', '16', '66', null, 'Action', 'rgb(255, 255, 255)', 'rgb(0, 0, 0)', '2', '[{\"key\":\"Source\",\"value\":\"db.employee\"}]');
INSERT INTO `dia_shapes` VALUES ('285', 'graph-shape-40', 'graph-shape-38', null, 'Graph.shape.activity.Router', null, '33', '283', '100', '100', '680', '46', null, 'Route', 'rgb(255, 255, 255)', 'rgb(0, 0, 0)', '2', '[{\"key\":\"Source\",\"value\":\"db.employee\"}]');
INSERT INTO `dia_shapes` VALUES ('286', 'graph-shape-41', null, 'pool-9', 'Graph.shape.activity.Lane', null, '33', null, '1000', '200', '103', '481', null, 'Participant Role', 'rgb(255, 255, 255)', 'rgb(0, 0, 0)', '2', '[{\"key\":\"Source\",\"value\":\"db.employee\"}]');
INSERT INTO `dia_shapes` VALUES ('287', 'graph-shape-42', 'graph-shape-41', null, 'Graph.shape.activity.Join', null, '33', '286', '300', '15', '129', '106', null, '', 'rgb(255, 255, 255)', 'rgb(0, 0, 0)', '2', '[{\"key\":\"Source\",\"value\":\"db.employee\"}]');
INSERT INTO `dia_shapes` VALUES ('297', 'graph-shape-18', null, null, 'Graph.shape.common.Label', null, '37', null, null, null, '124', '37', null, 'PHASE 1', 'rgb(255, 255, 255)', 'rgb(0, 0, 0)', '2', '[{\"key\":\"Source\",\"value\":\"db.employee\"}]');
INSERT INTO `dia_shapes` VALUES ('298', 'graph-shape-19', null, null, 'Graph.shape.common.Label', null, '37', null, null, null, '644', '221', null, 'PHASE 2', 'rgb(255, 255, 255)', 'rgb(0, 0, 0)', '2', '[{\"key\":\"Source\",\"value\":\"db.employee\"}]');
INSERT INTO `dia_shapes` VALUES ('306', 'graph-shape-20', null, 'pool-4', 'Graph.shape.activity.Lane', null, '39', null, '1000', '248', '276', '140', null, 'Participant Role', 'rgb(255, 255, 255)', 'rgb(0, 0, 0)', '2', '[{\"key\":\"Source\",\"value\":\"db.employee\"}]');
INSERT INTO `dia_shapes` VALUES ('307', 'graph-shape-21', 'graph-shape-20', null, 'Graph.shape.activity.Action', null, '39', '306', '140', '60', '223', '82', null, 'Action', 'rgb(255, 255, 255)', 'rgb(0, 0, 0)', '2', '[{\"key\":\"Source\",\"value\":\"db.employee\"}]');
INSERT INTO `dia_shapes` VALUES ('308', 'graph-shape-22', null, 'pool-4', 'Graph.shape.activity.Lane', null, '39', null, '1000', '200', '276', '-60', null, 'Participant Role', 'rgb(255, 255, 255)', 'rgb(0, 0, 0)', '2', '[{\"key\":\"Source\",\"value\":\"db.employee\"}]');
INSERT INTO `dia_shapes` VALUES ('309', 'graph-shape-23', null, 'pool-4', 'Graph.shape.activity.Lane', null, '39', null, '1000', '200', '276', '388', null, 'Participant Role', 'rgb(255, 255, 255)', 'rgb(0, 0, 0)', '2', '[{\"key\":\"Source\",\"value\":\"db.employee\"}]');
INSERT INTO `dia_shapes` VALUES ('310', 'graph-shape-24', 'graph-shape-23', null, 'Graph.shape.activity.Router', null, '39', '309', '50', '50', '35', '81', null, 'Route', 'rgb(255, 255, 255)', 'rgb(0, 0, 0)', '2', '[{\"key\":\"Source\",\"value\":\"db.employee\"}]');
INSERT INTO `dia_shapes` VALUES ('311', 'graph-shape-25', null, 'pool-4', 'Graph.shape.activity.Lane', null, '39', null, '1000', '200', '276', '-260', null, 'Participant Role', 'rgb(255, 255, 255)', 'rgb(0, 0, 0)', '2', '[{\"key\":\"Source\",\"value\":\"db.employee\"}]');
INSERT INTO `dia_shapes` VALUES ('312', 'graph-shape-26', null, 'pool-4', 'Graph.shape.activity.Lane', null, '39', null, '1000', '200', '276', '588', null, 'Participant Role', 'rgb(255, 255, 255)', 'rgb(0, 0, 0)', '2', '[{\"key\":\"Source\",\"value\":\"db.employee\"}]');
INSERT INTO `dia_shapes` VALUES ('322', 'graph-shape-12', 'graph-shape-10', null, 'Graph.shape.activity.Router', 'xor', '37', '259', '50', '50', '174', '125', null, 'Route', 'rgb(255, 255, 255)', 'rgb(0, 0, 0)', '2', '[{\"key\":\"Source\",\"value\":\"db.employee\"}]');
INSERT INTO `dia_shapes` VALUES ('323', 'graph-shape-19', null, null, 'Graph.shape.activity.Start', null, '40', null, '60', '60', '352', '107', null, 'Start', 'rgb(255, 255, 255)', 'rgb(0, 0, 0)', '2', '[{\"key\":\"Source\",\"value\":\"db.employee\"}]');
INSERT INTO `dia_shapes` VALUES ('324', 'graph-shape-20', null, null, 'Graph.shape.activity.Action', null, '40', null, '140', '60', '132', '185', null, 'Action', 'rgb(255, 255, 255)', 'rgb(0, 0, 0)', '2', '[{\"key\":\"Source\",\"value\":\"db.employee\"}]');
INSERT INTO `dia_shapes` VALUES ('329', 'graph-shape-9', null, 'pool-1', 'Graph.shape.activity.Lane', null, '41', null, '1000', '200', '214', '-94', null, 'Participant Role', 'rgb(255, 255, 255)', 'rgb(0, 0, 0)', '2', '[{\"key\":\"Source\",\"value\":\"db.employee\"}]');
INSERT INTO `dia_shapes` VALUES ('330', 'graph-shape-10', 'graph-shape-9', null, 'Graph.shape.activity.Start', null, '41', '329', '60', '60', '58', '70', null, 'Start', 'rgb(255, 255, 255)', 'rgb(0, 0, 0)', '2', '[{\"key\":\"Source\",\"value\":\"db.employee\"}]');
INSERT INTO `dia_shapes` VALUES ('331', 'graph-shape-11', 'graph-shape-9', null, 'Graph.shape.activity.Final', null, '41', '329', '60', '60', '521', '70', null, 'End', '#FF4081', 'rgb(0, 0, 0)', '2', '[{\"key\":\"Source\",\"value\":\"db.employee\"}]');
INSERT INTO `dia_shapes` VALUES ('332', 'graph-shape-12', 'graph-shape-9', null, 'Graph.shape.activity.Action', null, '41', '329', '140', '60', '264', '70', null, 'Action', 'rgb(255, 255, 255)', 'rgb(0, 0, 0)', '2', '[{\"key\":\"Source\",\"value\":\"db.employee\"}]');
INSERT INTO `dia_shapes` VALUES ('338', 'graph-shape-13', null, 'pool-1', 'Graph.shape.activity.Lane', null, '41', null, '1000', '200', '214', '106', null, 'Participant Role', 'rgb(255, 255, 255)', 'rgb(0, 0, 0)', '2', '[{\"key\":\"Source\",\"value\":\"db.employee\"}]');
INSERT INTO `dia_shapes` VALUES ('339', 'graph-shape-14', 'graph-shape-13', null, 'Graph.shape.activity.Action', null, '41', '338', '121', '60', '18', '63', null, 'Action', 'rgb(255, 255, 255)', 'rgb(0, 0, 0)', '2', '[{\"key\":\"Source\",\"value\":\"db.employee\"}]');
INSERT INTO `dia_shapes` VALUES ('340', 'graph-shape-15', 'graph-shape-13', null, 'Graph.shape.activity.Action', null, '41', '338', '140', '60', '264', '63', null, 'Action', 'rgb(255, 255, 255)', 'rgb(0, 0, 0)', '2', '[{\"key\":\"Source\",\"value\":\"db.employee\"}]');
INSERT INTO `dia_shapes` VALUES ('341', 'graph-shape-16', 'graph-shape-13', null, 'Graph.shape.activity.Action', null, '41', '338', '140', '60', '481', '63', null, 'Action', 'rgb(255, 255, 255)', 'rgb(0, 0, 0)', '2', '[{\"key\":\"Source\",\"value\":\"db.employee\"}]');
INSERT INTO `dia_shapes` VALUES ('342', 'graph-shape-18', null, 'pool-1', 'Graph.shape.activity.Lane', null, '41', null, '1000', '200', '214', '306', null, 'Participant Role', 'rgb(255, 255, 255)', 'rgb(0, 0, 0)', '2', '[{\"key\":\"Source\",\"value\":\"db.employee\"}]');
INSERT INTO `dia_shapes` VALUES ('344', 'graph-shape-17', 'graph-shape-13', null, 'Graph.shape.activity.Action', null, '41', '338', '140', '60', '752', '63', null, 'Action', 'rgb(255, 255, 255)', 'rgb(0, 0, 0)', '2', '[{\"key\":\"Source\",\"value\":\"db.employee\"}]');
INSERT INTO `dia_shapes` VALUES ('346', 'graph-shape-19', 'graph-shape-18', null, 'Graph.shape.activity.Action', null, '41', '342', '140', '60', '155', '76', null, 'Action', 'rgb(255, 255, 255)', 'rgb(0, 0, 0)', '2', '[{\"key\":\"Source\",\"value\":\"db.employee\"}]');
INSERT INTO `dia_shapes` VALUES ('349', 'graph-shape-7', null, null, 'Graph.shape.activity.Action', null, '42', null, '140', '60', '183', '132', null, 'Action', 'rgb(255, 255, 255)', 'rgb(0, 0, 0)', '2', '[{\"key\":\"Source\",\"value\":\"db.employee\"}]');
INSERT INTO `dia_shapes` VALUES ('354', 'graph-shape-8', null, null, 'Graph.shape.activity.Action', null, '42', null, '140', '60', '458', '249', '45', 'Action', 'rgb(255, 255, 255)', 'rgb(0, 0, 0)', '2', '[{\"key\":\"Source\",\"value\":\"db.employee\"}]');
INSERT INTO `dia_shapes` VALUES ('357', 'graph-shape-4', null, null, 'Graph.shape.activity.Action', null, '43', null, '140', '60', '77', '124', null, 'Action', 'rgb(255, 255, 255)', 'rgb(0, 0, 0)', '2', '[{\"key\":\"X\",\"value\":\"X\"}]');
INSERT INTO `dia_shapes` VALUES ('358', 'graph-shape-5', null, null, 'Graph.shape.activity.Action', null, '43', null, '140', '60', '430', '124', null, 'Action', 'rgb(255, 255, 255)', 'rgb(0, 0, 0)', '2', '[]');
INSERT INTO `dia_shapes` VALUES ('368', 'graph-shape-1', null, null, 'Graph.shape.activity.Action', null, '44', null, '140', '60', '176', '157', null, 'Action', 'rgb(255, 255, 255)', 'rgb(0, 0, 0)', '2', '[]');
INSERT INTO `dia_shapes` VALUES ('369', 'graph-shape-2', null, null, 'Graph.shape.activity.Action', null, '44', null, '140', '60', '370', '316', null, 'Action', 'rgb(255, 255, 255)', 'rgb(0, 0, 0)', '2', '[]');
INSERT INTO `dia_shapes` VALUES ('370', 'graph-shape-3', null, null, 'Graph.shape.activity.Action', null, '44', null, '140', '60', '176', '316', null, 'Action', 'rgb(255, 255, 255)', 'rgb(0, 0, 0)', '2', '[]');
INSERT INTO `dia_shapes` VALUES ('382', 'graph-shape-1', null, null, 'Graph.shape.activity.Start', null, '45', null, '60', '60', '133', '100', null, 'Start', 'rgb(255, 255, 255)', 'rgb(0, 0, 0)', '2', '[]');
INSERT INTO `dia_shapes` VALUES ('383', 'graph-shape-2', null, null, 'Graph.shape.activity.Final', null, '45', null, '60', '60', '133', '673', null, 'End', '#FF4081', 'rgb(0, 0, 0)', '2', '[]');
INSERT INTO `dia_shapes` VALUES ('384', 'graph-shape-3', null, null, 'Graph.shape.activity.Action', null, '45', null, '140', '60', '276', '159', null, 'Action', 'rgb(255, 255, 255)', 'rgb(0, 0, 0)', '2', '[]');
INSERT INTO `dia_shapes` VALUES ('385', 'graph-shape-4', null, null, 'Graph.shape.activity.Action', null, '45', null, '140', '60', '276', '341', null, 'Action', 'rgb(255, 255, 255)', 'rgb(0, 0, 0)', '2', '[]');
INSERT INTO `dia_shapes` VALUES ('386', 'graph-shape-5', null, null, 'Graph.shape.activity.Action', null, '45', null, '140', '60', '509', '341', null, 'Action', 'rgb(255, 255, 255)', 'rgb(0, 0, 0)', '2', '[]');
INSERT INTO `dia_shapes` VALUES ('387', 'graph-shape-6', null, null, 'Graph.shape.activity.Action', null, '45', null, '140', '60', '93', '341', null, 'Action', 'rgb(255, 255, 255)', 'rgb(0, 0, 0)', '2', '[]');
INSERT INTO `dia_shapes` VALUES ('388', 'graph-shape-7', null, null, 'Graph.shape.activity.Action', null, '45', null, '140', '60', '699', '341', null, 'Action', 'rgb(255, 255, 255)', 'rgb(0, 0, 0)', '2', '[]');
INSERT INTO `dia_shapes` VALUES ('389', 'graph-shape-8', null, null, 'Graph.shape.activity.Action', null, '45', null, '140', '60', '699', '474', null, 'Action', 'rgb(255, 255, 255)', 'rgb(0, 0, 0)', '2', '[]');
INSERT INTO `dia_shapes` VALUES ('390', 'graph-shape-9', null, null, 'Graph.shape.activity.Action', null, '45', null, '140', '60', '509', '563', null, 'Action', 'rgb(255, 255, 255)', 'rgb(0, 0, 0)', '2', '[]');
INSERT INTO `dia_shapes` VALUES ('391', 'graph-shape-10', null, null, 'Graph.shape.activity.Action', null, '45', null, '140', '60', '276', '563', null, 'Action', 'rgb(255, 255, 255)', 'rgb(0, 0, 0)', '2', '[]');
INSERT INTO `dia_shapes` VALUES ('392', 'graph-shape-11', null, null, 'Graph.shape.activity.Action', null, '45', null, '140', '60', '93', '563', null, 'Action', 'rgb(255, 255, 255)', 'rgb(0, 0, 0)', '2', '[]');
INSERT INTO `dia_shapes` VALUES ('401', 'graph-shape-1', null, null, 'Graph.shape.activity.Start', null, '46', null, '60', '60', '106', '44', null, 'Start', 'rgb(255, 255, 255)', 'rgb(0, 0, 0)', '2', '[]');
INSERT INTO `dia_shapes` VALUES ('402', 'graph-shape-2', null, null, 'Graph.shape.activity.Action', null, '46', null, '140', '60', '66', '141', null, 'Action', 'rgb(255, 255, 255)', 'rgb(0, 0, 0)', '2', '[]');
INSERT INTO `dia_shapes` VALUES ('403', 'graph-shape-3', null, null, 'Graph.shape.activity.Action', null, '46', null, '140', '60', '66', '256', null, 'Action', 'rgb(255, 255, 255)', 'rgb(0, 0, 0)', '2', '[]');
INSERT INTO `dia_shapes` VALUES ('404', 'graph-shape-4', null, null, 'Graph.shape.activity.Action', null, '46', null, '140', '60', '66', '378', null, 'Action', 'rgb(255, 255, 255)', 'rgb(0, 0, 0)', '2', '[]');
INSERT INTO `dia_shapes` VALUES ('405', 'graph-shape-5', null, null, 'Graph.shape.activity.Action', null, '46', null, '140', '60', '503', '44', null, 'Action', 'rgb(255, 255, 255)', 'rgb(0, 0, 0)', '2', '[]');
INSERT INTO `dia_shapes` VALUES ('406', 'graph-shape-6', null, null, 'Graph.shape.activity.Action', null, '46', null, '140', '60', '503', '141', null, 'Action', 'rgb(255, 255, 255)', 'rgb(0, 0, 0)', '2', '[]');
INSERT INTO `dia_shapes` VALUES ('407', 'graph-shape-7', null, null, 'Graph.shape.activity.Action', null, '46', null, '140', '60', '503', '256', null, 'Action', 'rgb(255, 255, 255)', 'rgb(0, 0, 0)', '2', '[]');
INSERT INTO `dia_shapes` VALUES ('408', 'graph-shape-8', null, null, 'Graph.shape.activity.Final', null, '46', null, '60', '60', '543', '378', null, 'End', '#FF4081', 'rgb(0, 0, 0)', '2', '[]');
INSERT INTO `dia_shapes` VALUES ('410', 'graph-shape-9', null, null, 'Graph.shape.activity.Action', null, '46', null, '140', '60', '304', '141', null, 'Action', 'rgb(255, 255, 255)', 'rgb(0, 0, 0)', '2', '[]');
INSERT INTO `dia_shapes` VALUES ('413', 'graph-shape-10', null, null, 'Graph.shape.activity.Action', null, '46', null, '140', '60', '700', '141', null, 'Action', 'rgb(255, 255, 255)', 'rgb(0, 0, 0)', '2', '[]');
INSERT INTO `dia_shapes` VALUES ('414', 'graph-shape-11', null, null, 'Graph.shape.activity.Action', null, '46', null, '140', '60', '700', '256', null, 'Action', 'rgb(255, 255, 255)', 'rgb(0, 0, 0)', '2', '[]');
INSERT INTO `dia_shapes` VALUES ('416', 'graph-shape-12', null, null, 'Graph.shape.activity.Action', null, '46', null, '140', '60', '304', '378', null, 'Action', 'rgb(255, 255, 255)', 'rgb(0, 0, 0)', '2', '[]');
INSERT INTO `dia_shapes` VALUES ('419', 'graph-shape-1', null, null, 'Graph.shape.activity.Action', null, '47', null, '140', '60', '302', '137', null, 'Action', 'rgb(255, 255, 255)', 'rgb(0, 0, 0)', '2', '[]');
INSERT INTO `dia_shapes` VALUES ('420', 'graph-shape-2', null, null, 'Graph.shape.activity.Action', null, '47', null, '140', '60', '575', '137', null, 'Action', 'rgb(255, 255, 255)', 'rgb(0, 0, 0)', '2', '[]');
INSERT INTO `dia_shapes` VALUES ('421', 'graph-shape-4', null, null, 'Graph.shape.activity.Start', null, '49', null, '60', '60', '137', '63', '0', 'Start', 'rgb(255, 255, 255)', 'rgb(0, 0, 0)', '2', '[]');
INSERT INTO `dia_shapes` VALUES ('422', 'graph-shape-5', null, null, 'Graph.shape.activity.Action', null, '49', null, '140', '60', '414', '63', '0', 'Action', 'rgb(255, 255, 255)', 'rgb(0, 0, 0)', '2', '[]');
INSERT INTO `dia_shapes` VALUES ('423', 'graph-shape-6', null, null, 'Graph.shape.activity.Action', null, '49', null, '140', '60', '414', '224', '0', 'Action', 'rgb(255, 255, 255)', 'rgb(0, 0, 0)', '2', '[]');
INSERT INTO `dia_shapes` VALUES ('424', 'graph-shape-1', null, null, 'Graph.shape.activity.Start', null, '50', null, '60', '60', '137', '63', '0', 'Start', 'rgb(255, 255, 255)', 'rgb(0, 0, 0)', '2', '[]');
INSERT INTO `dia_shapes` VALUES ('425', 'graph-shape-2', null, null, 'Graph.shape.activity.Action', null, '50', null, '140', '60', '414', '63', '0', 'Action', 'rgb(255, 255, 255)', 'rgb(0, 0, 0)', '2', '[]');
INSERT INTO `dia_shapes` VALUES ('426', 'graph-shape-3', null, null, 'Graph.shape.activity.Action', null, '50', null, '140', '60', '414', '224', '0', 'Action', 'rgb(255, 255, 255)', 'rgb(0, 0, 0)', '2', '[]');
INSERT INTO `dia_shapes` VALUES ('427', 'graph-shape-1', null, null, 'Graph.shape.activity.Router', 'xor', '51', null, '50', '50', '410', '142', '0', 'Route', 'rgb(255, 255, 255)', 'rgb(0, 0, 0)', '2', '[]');
INSERT INTO `dia_shapes` VALUES ('430', 'graph-shape-1', null, null, 'Graph.shape.activity.Final', null, '52', null, '60', '60', '515', '140', '0', 'End', '#FF4081', 'rgb(0, 0, 0)', '2', '[]');
INSERT INTO `dia_shapes` VALUES ('433', 'graph-shape-4', null, null, 'Graph.shape.activity.Start', null, '53', null, '60', '60', '377', '174', '0', 'Start', 'rgb(255, 255, 255)', 'rgb(0, 0, 0)', '2', '[]');
INSERT INTO `dia_shapes` VALUES ('434', 'graph-shape-2', null, null, 'Graph.shape.activity.Router', 'xor', '51', null, '50', '50', '410', '310', '0', 'Route', 'rgb(255, 255, 255)', 'rgb(0, 0, 0)', '2', '[]');
INSERT INTO `dia_shapes` VALUES ('435', 'graph-shape-3', null, null, 'Graph.shape.activity.Action', null, '51', null, '140', '60', '550', '228', '0', 'Action', 'rgb(255, 255, 255)', 'rgb(0, 0, 0)', '2', '[]');
INSERT INTO `dia_shapes` VALUES ('437', 'graph-shape-1', null, 'pool-1', 'Graph.shape.activity.Lane', null, '54', null, '1000', '200', '449', '65', '0', 'Participant Role', 'rgb(255, 255, 255)', 'rgb(0, 0, 0)', '2', '[]');
INSERT INTO `dia_shapes` VALUES ('438', 'graph-shape-2', 'graph-shape-1', null, 'Graph.shape.activity.Start', null, '54', '437', '60', '60', '22', '26', '0', 'Start', 'rgb(255, 255, 255)', 'rgb(0, 0, 0)', '2', '[]');
INSERT INTO `dia_shapes` VALUES ('439', 'graph-shape-3', 'graph-shape-1', null, 'Graph.shape.activity.Action', null, '54', '437', '140', '60', '223', '98', '0', 'Action', 'rgb(255, 255, 255)', 'rgb(0, 0, 0)', '2', '[]');
INSERT INTO `dia_shapes` VALUES ('440', 'graph-shape-1', null, null, 'Graph.shape.activity.Start', null, '56', null, '60', '60', '434', '102', '0', 'Startx', 'rgb(255, 255, 255)', 'rgb(0, 0, 0)', '2', '[{\"name\":\"database\",\"value\":\"demo\"},{\"name\":\"table\",\"value\":\"dia_shape\"},{\"name\":\"client_id\",\"value\":\"graph-shape-3\"}]');
INSERT INTO `dia_shapes` VALUES ('441', 'graph-shape-2', null, null, 'Graph.shape.activity.Start', null, '56', null, '60', '60', '567', '248', '0', 'Start', 'rgb(255, 255, 255)', 'rgb(0, 0, 0)', '2', '[]');
INSERT INTO `dia_shapes` VALUES ('448', 'graph-shape-1', null, null, 'Graph.shape.activity.Start', null, '57', null, '60', '60', '397', '44', '0', 'Start', 'rgb(255, 255, 255)', 'rgb(0, 0, 0)', '2', '[]');
INSERT INTO `dia_shapes` VALUES ('449', 'graph-shape-2', null, null, 'Graph.shape.activity.Action', null, '57', null, '140', '60', '357', '128', '0', 'input alas', 'rgb(255, 255, 255)', 'rgb(0, 0, 0)', '2', '[]');
INSERT INTO `dia_shapes` VALUES ('450', 'graph-shape-3', null, null, 'Graph.shape.activity.Action', null, '57', null, '140', '60', '357', '226', '0', 'input tinggi', 'rgb(255, 255, 255)', 'rgb(0, 0, 0)', '2', '[]');
INSERT INTO `dia_shapes` VALUES ('451', 'graph-shape-4', null, null, 'Graph.shape.activity.Action', null, '57', null, '140', '60', '357', '330', '0', 'hitung luas', 'rgb(255, 255, 255)', 'rgb(0, 0, 0)', '2', '[]');
INSERT INTO `dia_shapes` VALUES ('452', 'graph-shape-5', null, null, 'Graph.shape.activity.Action', null, '57', null, '140', '60', '357', '432', '0', 'simpan', 'rgb(255, 255, 255)', 'rgb(0, 0, 0)', '2', '[]');
INSERT INTO `dia_shapes` VALUES ('453', 'graph-shape-6', null, null, 'Graph.shape.activity.Final', null, '57', null, '60', '60', '397', '538', '0', 'End', '#FF4081', 'rgb(0, 0, 0)', '2', '[]');

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
INSERT INTO `sys_config` VALUES ('3', 'app_title', 'DEMO');
INSERT INTO `sys_config` VALUES ('4', 'app_version', '1.0.0');
INSERT INTO `sys_config` VALUES ('5', 'app_description', '');
INSERT INTO `sys_config` VALUES ('6', 'app_keywords', '');
INSERT INTO `sys_config` VALUES ('7', 'app_author', 'Kreasindo Cipta Teknologi');
INSERT INTO `sys_config` VALUES ('8', 'app_repository', '');
INSERT INTO `sys_config` VALUES ('9', 'app_host', 'bpm.go.vm');
INSERT INTO `sys_config` VALUES ('10', 'app_base', '/demo/');
INSERT INTO `sys_config` VALUES ('11', 'app_site', 'http://bpm.go.vm/demo/');

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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sys_modules
-- ----------------------------
INSERT INTO `sys_modules` VALUES ('1', 'assets', '1.0.0', 'Assets', 'KCT Team', 'https://github.com/progmodules/assets', '/assets');
INSERT INTO `sys_modules` VALUES ('2', 'auth', '1.0.0', 'Authentication', 'KCT Team', 'https://github.com/progmodules/auth', '/auth');
INSERT INTO `sys_modules` VALUES ('3', 'config', '1.0.0', 'Application Config', 'KCT Team', null, '/config');
INSERT INTO `sys_modules` VALUES ('4', 'diagrams', '1.0.0', 'Diagrams', 'KCT Team', null, '/diagrams');
INSERT INTO `sys_modules` VALUES ('5', 'home', '1.0.0', 'Homepage', 'KCT Team', null, '/home');
INSERT INTO `sys_modules` VALUES ('6', 'profile', '1.0.0', 'User Profile', 'KCT Team', null, '/profile');
INSERT INTO `sys_modules` VALUES ('7', 'roles', '1.0.0', 'User Roles', 'KCT Team', null, '/roles');
INSERT INTO `sys_modules` VALUES ('8', 'users', '1.0.0', 'Application Users', 'KCT Team', null, '/users');
INSERT INTO `sys_modules` VALUES ('9', 'modules', '1.0.0', 'Application Modules', 'KCT Team', null, '/modules');
INSERT INTO `sys_modules` VALUES ('10', 'workflow', '1.0.0', 'Workflow', 'KCT Team', null, '/workflow');

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sys_modules_capabilities
-- ----------------------------
INSERT INTO `sys_modules_capabilities` VALUES ('1', '1', 'access', 'Allow module accessed from menu');

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
  `sr_name` varchar(255) DEFAULT NULL,
  `sr_description` varchar(255) DEFAULT NULL,
  `sr_default` int(1) DEFAULT '0',
  `sr_created_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `sr_created_by` varchar(50) DEFAULT 'system',
  PRIMARY KEY (`sr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sys_roles
-- ----------------------------
INSERT INTO `sys_roles` VALUES ('1', 'Developer', 'Role for developer users', '1', '2017-05-07 19:33:24', 'system');
INSERT INTO `sys_roles` VALUES ('2', 'Director', 'Role for directors', '0', null, null);
INSERT INTO `sys_roles` VALUES ('3', 'Customer', 'Role for customer', '0', '2017-05-07 19:47:35', 'system');

-- ----------------------------
-- Table structure for sys_users
-- ----------------------------
DROP TABLE IF EXISTS `sys_users`;
CREATE TABLE `sys_users` (
  `su_id` int(11) NOT NULL AUTO_INCREMENT,
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sys_users
-- ----------------------------
INSERT INTO `sys_users` VALUES ('1', 'roso@kct.co.id', '$2y$08$UG9kTFBmVlZnZnNyVk1HT.WAs90x9KE2frZCElrT/BdY0XbFsG95O', 'Roso Sasongko', '5.jpg', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJpYXQiOjE0OTUzODYyNjksImp0aSI6InJ1dk1Ebm5RYTBFM3NacHpadnlybGpoaXdQQVR5NjVRNzVpb2RhXC9ZRzY4PSIsImlzcyI6IktyZWFzaW5kbyBDaXB0YSBUZWtub2xvZ2kiLCJuYmYiOjE0OTUzODYyNzAsImV4cCI6MTQ5NTQ3MDI3MCwiZGF0YSI6eyJzdV9lbWFpbCI6InJvc2', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJpYXQiOjE0OTUzODYyNjksImp0aSI6Ikxna2h5aVVDUnoySlB3M3ZQcjkyV1lKWWFXOURYb3Y2RzBlUnVHaHQxM1k9IiwiaXNzIjoiS3JlYXNpbmRvIENpcHRhIFRla25vbG9naSIsIm5iZiI6MTQ5NTM4NjI3MCwiZXhwIjoxNDk1NDk0MjcwLCJkYXRhIjpudWxsfQ.92zl2rR1yRBDqhC', 'Male', '1985-07-03', 'Programmer', 'Kreasindo Cipta Teknologi', '1', '2017-04-27 20:52:36', 'system');
INSERT INTO `sys_users` VALUES ('2', 'vidi@kct.co.id', '$2y$08$MVg1UndEeTVGRWJrL1BxS.DUf6A5rt36rq9CByczAtresY5PvVykO', 'Vidi Meylan', '1.jpg', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJpYXQiOjE0OTM4NzczNTUsImp0aSI6ImJaTzgzMFZnTmMzOXlpaGc5Wk02WlBlNTR3WURlK0pjVEZYbytVelFDOFU9IiwiaXNzIjoiS3JlYXNpbmRvIENpcHRhIFRla25vbG9naSIsIm5iZiI6MTQ5Mzg3NzM1NiwiZXhwIjoxNDkzOTYxMzU2LCJkYXRhIjp7InN1X2VtYWlsIjoidmlkaU', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJpYXQiOjE0OTM4NzczNTUsImp0aSI6ImF3VXJ6cFIrVGJqaGNyMDJGZ01wNENhSUxOSmpUdTVSTXhFXC9HUTMydlEwPSIsImlzcyI6IktyZWFzaW5kbyBDaXB0YSBUZWtub2xvZ2kiLCJuYmYiOjE0OTM4NzczNTYsImV4cCI6MTQ5Mzk4NTM1NiwiZGF0YSI6bnVsbH0.UjnERoG8tMcfLB', null, null, null, null, '1', '2017-05-04 05:55:15', 'system');
INSERT INTO `sys_users` VALUES ('3', 'asep@kct.co.id', '$2y$08$NGtZcDhxaDJISU9ML1VvV.ccvQQitqMUQkIsDfPsm1HZpLtE1uowa', 'Asep Asepso', '4.jpg', null, null, 'Male', null, null, null, '1', '2017-05-04 06:24:39', 'system');
INSERT INTO `sys_users` VALUES ('4', 'john@foo.com', '$2y$08$RmxCdXJhV0pnaGpXUjJlRuLrIB3njIlyOV5jDLa5KK3pIXVVPFg0.', 'John Doe', '2.jpg', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJpYXQiOjE0OTM4ODMzMjEsImp0aSI6IlhYaERLUTBSUmtweVBKVEJYbkJNQ3ZaZzU1UnRBWXpiVUVFQkFldEZRZVU9IiwiaXNzIjoiS3JlYXNpbmRvIENpcHRhIFRla25vbG9naSIsIm5iZiI6MTQ5Mzg4MzMyMiwiZXhwIjoxNDkzOTY3MzIyLCJkYXRhIjp7InN1X2VtYWlsIjoiam9obk', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJpYXQiOjE0OTM4ODMzMjEsImp0aSI6IktjdFwvRG5pWWZVUlRPY2lTZ1VJVEEwNHFIXC91dlJvYW9cL05vcVJaUmNUanc9IiwiaXNzIjoiS3JlYXNpbmRvIENpcHRhIFRla25vbG9naSIsIm5iZiI6MTQ5Mzg4MzMyMiwiZXhwIjoxNDkzOTkxMzIyLCJkYXRhIjpudWxsfQ.rQO76C44g9N', null, null, null, null, '1', '2017-05-04 07:20:15', 'system');
INSERT INTO `sys_users` VALUES ('5', 'fani@foo.com', '$2y$08$aUl1RFphVTVQTkRRbVcxQOyLx4xAgGjhgsV9rtB.cOaztVty6YJpO', 'Fani Fadilah', '3.jpg', null, null, null, null, null, null, '1', '2017-05-04 07:22:29', 'system');
INSERT INTO `sys_users` VALUES ('6', 'budi@foo.com', '$2y$08$dko5RDM3VHZtUThjbDZnde54FNlz/K2LrTA4l2Ph.p1UlqwoN0Nsm', 'Budi Santoso', '9.jpg', null, null, null, null, null, null, '1', '2017-05-04 07:26:51', 'system');
INSERT INTO `sys_users` VALUES ('7', 'abc@foo.com', '$2y$08$b1F6L2lmSUpEUHBMNGtqROn2AzYmds8UFCudj7HUPBG6pV9XS.iKe', 'Anonymous', '10.jpg', null, null, null, null, null, null, '1', '2017-05-04 07:28:38', 'system');
INSERT INTO `sys_users` VALUES ('8', 'exo@foo.com', '$2y$08$cVlicFBnWmYrMDBuWDRqM.iMtDO1BvmPS2EO9o27Ljh3g7L.p9EPe', 'Britney Sepir', '13.jpg', null, null, null, null, null, null, '1', '2017-05-04 07:29:54', 'system');
INSERT INTO `sys_users` VALUES ('9', 'boo@foo.com', '$2y$08$MndDOVhXckp3ZitILzZJcO1jfDMYMOds9mWoxIOulISx1AnkrC62G', 'Boo Boo', '14.jpg', null, null, 'M', null, null, null, '1', '2017-05-04 07:31:51', 'system');
INSERT INTO `sys_users` VALUES ('10', 'bar@foo.com', '$2y$08$UXY1akk0dnJqdFJ1UEZ2MurwWBRfV2FMmDPf68Eu7Z8bc1JhOYnvm', 'Foo Bar', '15.jpg', null, null, null, null, null, null, '1', '2017-05-04 07:32:11', 'system');
INSERT INTO `sys_users` VALUES ('11', 'momo@yahoo.com', null, 'Momoy', '6.jpg', null, null, null, null, null, null, '1', '2017-05-10 10:47:32', 'system');
INSERT INTO `sys_users` VALUES ('12', 'abe@yahoo.com', null, 'Abe Bumen', '16.jpg', null, null, null, null, null, null, '0', '2017-05-10 19:07:08', 'system');
