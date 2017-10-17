SET FOREIGN_KEY_CHECKS=0;

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


ALTER TABLE `sys_roles_kanban` ADD `srk_selected` INT(1) DEFAULT 0;
ALTER TABLE `sys_roles_menus` ADD `srm_selected` INT(1) DEFAULT 0;
ALTER TABLE `sys_roles_permissions` ADD `srp_selected` INT(1) DEFAULT 0;
ALTER TABLE `sys_users_kanban` ADD `suk_selected` INT(1) DEFAULT 0;