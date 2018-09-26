/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50639
Source Host           : localhost:3306
Source Database       : springboot-vue

Target Server Type    : MYSQL
Target Server Version : 50639
File Encoding         : 65001

Date: 2018-09-26 17:47:42
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `article`
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) DEFAULT '' COMMENT '文章内容',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `delete_status` varchar(1) DEFAULT '1' COMMENT '是否有效  1.有效  2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='发布号作者表';

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES ('5', '莎士比亚', '2017-10-25 09:08:45', '2017-10-30 17:59:41', '1');
INSERT INTO `article` VALUES ('6', '亚里士多德', '2017-10-26 10:49:28', '2017-11-18 09:54:15', '1');
INSERT INTO `article` VALUES ('10', '亚历山大', '2017-10-26 14:57:45', '2017-11-08 13:28:52', '1');
INSERT INTO `article` VALUES ('11', '李白', '2017-10-26 15:23:42', '2017-10-26 15:23:42', '1');
INSERT INTO `article` VALUES ('19', '文章test2', '2017-11-18 13:37:07', '2017-11-18 13:37:11', '1');

-- ----------------------------
-- Table structure for `sys_permission`
-- ----------------------------
DROP TABLE IF EXISTS `sys_permission`;
CREATE TABLE `sys_permission` (
  `id` int(11) NOT NULL DEFAULT '0' COMMENT '自定id,主要供前端展示权限列表分类排序使用.',
  `menu_code` varchar(255) DEFAULT '' COMMENT '归属菜单,前端判断并展示菜单使用,',
  `menu_name` varchar(255) DEFAULT '' COMMENT '菜单的中文释义',
  `permission_code` varchar(255) DEFAULT '' COMMENT '权限的代码/通配符,对应代码中@RequiresPermissions 的value',
  `permission_name` varchar(255) DEFAULT '' COMMENT '本权限的中文释义',
  `required_permission` tinyint(1) DEFAULT '2' COMMENT '是否本菜单必选权限, 1.必选 2非必选 通常是"列表"权限是必选',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='后台权限表';

-- ----------------------------
-- Records of sys_permission
-- ----------------------------
INSERT INTO `sys_permission` VALUES ('101', 'article', '文章管理', 'article:list', '列表', '1');
INSERT INTO `sys_permission` VALUES ('102', 'article', '文章管理', 'article:add', '新增', '2');
INSERT INTO `sys_permission` VALUES ('103', 'article', '文章管理', 'article:update', '修改', '2');
INSERT INTO `sys_permission` VALUES ('601', 'user', '用户', 'user:list', '列表', '1');
INSERT INTO `sys_permission` VALUES ('602', 'user', '用户', 'user:add', '新增', '2');
INSERT INTO `sys_permission` VALUES ('603', 'user', '用户', 'user:update', '修改', '2');
INSERT INTO `sys_permission` VALUES ('701', 'role', '角色权限', 'role:list', '列表', '1');
INSERT INTO `sys_permission` VALUES ('702', 'role', '角色权限', 'role:add', '新增', '2');
INSERT INTO `sys_permission` VALUES ('703', 'role', '角色权限', 'role:update', '修改', '2');
INSERT INTO `sys_permission` VALUES ('704', 'role', '角色权限', 'role:delete', '删除', '2');
INSERT INTO `sys_permission` VALUES ('801', 'auth', '菜单权限', 'auth:list', '列表', '1');
INSERT INTO `sys_permission` VALUES ('802', 'auth', '菜单权限', 'auth:add', '新增', '2');
INSERT INTO `sys_permission` VALUES ('803', 'auth', '菜单权限', 'auth:update', '修改', '2');
INSERT INTO `sys_permission` VALUES ('804', 'auth', '菜单权限', 'auth:delete', '删除', '2');

-- ----------------------------
-- Table structure for `sys_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(20) DEFAULT NULL COMMENT '角色名',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` smallint(2) DEFAULT '1' COMMENT '状态，1:启用 ， 0：停用',
  `del_flag` smallint(2) DEFAULT '0' COMMENT '删除标记，1：已删除，0：正常',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='后台角色表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '管理员', '2017-11-22 16:24:34', '2018-09-20 06:12:30', '1', '0');
INSERT INTO `sys_role` VALUES ('2', '作家', '2017-11-22 16:24:34', '2018-09-20 06:12:30', '1', '0');
INSERT INTO `sys_role` VALUES ('3', '程序员', '2017-11-22 16:28:47', '2018-09-20 07:47:45', '0', '0');
INSERT INTO `sys_role` VALUES ('4', '建筑师', '2018-09-20 01:25:01', '2018-09-20 06:12:31', '1', '0');
INSERT INTO `sys_role` VALUES ('22', '角色测试五', '2018-09-20 08:20:13', '2018-09-20 09:12:03', '1', '0');
INSERT INTO `sys_role` VALUES ('23', '角色66', '2018-09-26 17:36:49', '2018-09-26 17:37:11', '0', '0');
INSERT INTO `sys_role` VALUES ('24', '角色77', '2018-09-26 17:36:58', '2018-09-26 17:37:39', '1', '1');
INSERT INTO `sys_role` VALUES ('25', '角色77', '2018-09-26 17:39:20', '2018-09-26 17:39:20', '1', '0');

-- ----------------------------
-- Table structure for `sys_role_permission`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_permission`;
CREATE TABLE `sys_role_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) DEFAULT NULL COMMENT '角色id',
  `permission_id` int(11) DEFAULT NULL COMMENT '权限id',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` smallint(2) DEFAULT '1' COMMENT '状态，1:启用 ， 0：停用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COMMENT='角色-权限关联表';

-- ----------------------------
-- Records of sys_role_permission
-- ----------------------------
INSERT INTO `sys_role_permission` VALUES ('1', '2', '101', '2017-11-22 16:26:21', '2018-09-26 17:29:36', '1');
INSERT INTO `sys_role_permission` VALUES ('2', '2', '102', '2017-11-22 16:26:21', '2018-09-26 17:29:38', '1');
INSERT INTO `sys_role_permission` VALUES ('5', '2', '602', '2017-11-22 16:28:28', '2018-09-26 17:29:39', '1');
INSERT INTO `sys_role_permission` VALUES ('6', '2', '601', '2017-11-22 16:28:28', '2017-11-22 16:28:28', '1');
INSERT INTO `sys_role_permission` VALUES ('7', '2', '603', '2017-11-22 16:28:28', '2017-11-22 16:28:28', '1');
INSERT INTO `sys_role_permission` VALUES ('8', '2', '703', '2017-11-22 16:28:28', '2017-11-22 16:28:28', '1');
INSERT INTO `sys_role_permission` VALUES ('9', '2', '701', '2017-11-22 16:28:28', '2017-11-22 16:28:28', '1');
INSERT INTO `sys_role_permission` VALUES ('10', '2', '702', '2017-11-22 16:28:28', '2017-11-22 16:28:28', '1');
INSERT INTO `sys_role_permission` VALUES ('11', '2', '704', '2017-11-22 16:28:31', '2017-11-22 16:28:31', '1');
INSERT INTO `sys_role_permission` VALUES ('12', '2', '103', '2017-11-22 16:28:31', '2017-11-22 16:28:31', '1');
INSERT INTO `sys_role_permission` VALUES ('13', '3', '601', '2017-11-22 16:28:47', '2017-11-22 16:28:47', '1');
INSERT INTO `sys_role_permission` VALUES ('14', '3', '701', '2017-11-22 16:28:47', '2017-11-22 16:28:47', '1');
INSERT INTO `sys_role_permission` VALUES ('15', '3', '702', '2017-11-22 16:35:01', '2017-11-22 16:35:01', '1');
INSERT INTO `sys_role_permission` VALUES ('16', '3', '704', '2017-11-22 16:35:01', '2017-11-22 16:35:01', '1');
INSERT INTO `sys_role_permission` VALUES ('17', '3', '102', '2017-11-22 16:35:01', '2017-11-22 16:35:01', '1');
INSERT INTO `sys_role_permission` VALUES ('18', '3', '101', '2017-11-22 16:35:01', '2017-11-22 16:35:01', '1');
INSERT INTO `sys_role_permission` VALUES ('19', '3', '603', '2017-11-22 16:35:01', '2017-11-22 16:35:01', '1');
INSERT INTO `sys_role_permission` VALUES ('20', '4', '101', '2018-09-20 01:25:01', '2018-09-20 01:25:01', '1');
INSERT INTO `sys_role_permission` VALUES ('21', '4', '601', '2018-09-20 01:25:01', '2018-09-20 01:25:01', '1');
INSERT INTO `sys_role_permission` VALUES ('22', '4', '602', '2018-09-20 01:25:01', '2018-09-20 01:25:01', '1');
INSERT INTO `sys_role_permission` VALUES ('23', '4', '103', '2018-09-20 01:25:19', '2018-09-20 01:25:19', '1');
INSERT INTO `sys_role_permission` VALUES ('24', '5', '101', '2018-09-20 06:41:39', '2018-09-20 06:41:39', '1');
INSERT INTO `sys_role_permission` VALUES ('25', '5', '601', '2018-09-20 06:41:39', '2018-09-20 06:41:39', '1');
INSERT INTO `sys_role_permission` VALUES ('26', '5', '701', '2018-09-20 06:41:39', '2018-09-20 06:41:39', '1');
INSERT INTO `sys_role_permission` VALUES ('27', '4', '702', '2018-09-20 08:19:33', '2018-09-20 08:19:33', '1');
INSERT INTO `sys_role_permission` VALUES ('28', '4', '701', '2018-09-20 08:19:33', '2018-09-20 08:19:33', '1');
INSERT INTO `sys_role_permission` VALUES ('29', '22', '702', '2018-09-20 08:20:13', '2018-09-20 08:20:13', '1');
INSERT INTO `sys_role_permission` VALUES ('30', '22', '701', '2018-09-20 08:20:13', '2018-09-20 08:20:13', '1');
INSERT INTO `sys_role_permission` VALUES ('31', '23', '101', '2018-09-26 17:38:13', '2018-09-26 17:38:13', '1');
INSERT INTO `sys_role_permission` VALUES ('32', '25', '601', '2018-09-26 17:39:20', '2018-09-26 17:39:20', '1');
INSERT INTO `sys_role_permission` VALUES ('33', '25', '602', '2018-09-26 17:39:20', '2018-09-26 17:39:20', '1');

-- ----------------------------
-- Table structure for `sys_user`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) DEFAULT NULL COMMENT '密码',
  `nickname` varchar(255) DEFAULT NULL COMMENT '昵称',
  `role_id` int(11) DEFAULT '0' COMMENT '角色ID',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `status` smallint(2) DEFAULT '1' COMMENT '状态，1:启用，0：停用',
  `del_flag` smallint(2) DEFAULT '0' COMMENT '删除标记，1：已删除，0：正常',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10018 DEFAULT CHARSET=utf8 COMMENT='运营后台用户表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('10003', 'admin', '123456', '超级用户23', '1', '2017-10-30 11:52:38', '2017-11-17 23:51:40', '1', '0');
INSERT INTO `sys_user` VALUES ('10004', 'user', '123456', '莎士比亚', '2', '2017-10-30 16:13:02', '2017-11-18 02:48:24', '1', '0');
INSERT INTO `sys_user` VALUES ('10005', 'aaa', '123456', 'abba', '1', '2017-11-15 14:02:56', '2017-11-17 23:51:42', '1', '0');
INSERT INTO `sys_user` VALUES ('10007', 'test', '123456', '就看看列表', '3', '2017-11-22 16:29:41', '2017-11-22 16:29:41', '1', '0');
INSERT INTO `sys_user` VALUES ('10008', 'tom', '123456', '汤姆', '3', '2018-07-19 11:30:33', '2018-09-21 10:00:34', '0', '0');
INSERT INTO `sys_user` VALUES ('10009', 'jianzhushi', '123456', '一级建筑师', '3', '2018-09-20 01:26:18', '2018-09-26 17:12:45', '0', '0');
INSERT INTO `sys_user` VALUES ('10010', 'user1', '1', '用户1', '22', '2018-09-20 09:13:50', '2018-09-20 09:13:50', '1', '0');
INSERT INTO `sys_user` VALUES ('10011', 'user2', '2', '用户2', '4', '2018-09-20 09:15:16', '2018-09-20 09:15:16', '1', '0');
INSERT INTO `sys_user` VALUES ('10012', 'user3', '3', '用户3', '3', '2018-09-20 09:34:47', '2018-09-26 17:35:04', '1', '0');
INSERT INTO `sys_user` VALUES ('10013', 'user4', '41', '用户4xg', '4', '2018-09-20 09:35:37', '2018-09-26 17:34:28', '0', '1');
INSERT INTO `sys_user` VALUES ('10014', 'user5', '5', '用户5', '2', '2018-09-21 08:27:13', '2018-09-26 17:34:24', '1', '1');
INSERT INTO `sys_user` VALUES ('10015', 'user6', '6', '角色6修改', '4', '2018-09-21 10:00:58', '2018-09-26 17:34:16', '1', '1');
INSERT INTO `sys_user` VALUES ('10016', 'user44', '44', '用户44', '4', '2018-09-26 17:36:02', '2018-09-26 17:36:02', '1', '0');
INSERT INTO `sys_user` VALUES ('10017', 'user55', '55', '用户55', '22', '2018-09-26 17:36:23', '2018-09-26 17:36:23', '0', '0');

-- ----------------------------
-- Table structure for `sys_user_permission`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_permission`;
CREATE TABLE `sys_user_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '角色id',
  `permission_id` int(11) DEFAULT NULL COMMENT '权限id',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` smallint(2) DEFAULT '1' COMMENT '状态，1:启用 ， 0：停用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COMMENT='角色-权限关联表';

-- ----------------------------
-- Records of sys_user_permission
-- ----------------------------
INSERT INTO `sys_user_permission` VALUES ('1', '2', '101', '2017-11-22 16:26:21', '2017-11-22 16:26:32', '1');
INSERT INTO `sys_user_permission` VALUES ('2', '2', '102', '2017-11-22 16:26:21', '2017-11-22 16:26:32', '1');
INSERT INTO `sys_user_permission` VALUES ('5', '2', '602', '2017-11-22 16:28:28', '2017-11-22 16:28:28', '1');
INSERT INTO `sys_user_permission` VALUES ('6', '2', '601', '2017-11-22 16:28:28', '2017-11-22 16:28:28', '1');
INSERT INTO `sys_user_permission` VALUES ('7', '2', '603', '2017-11-22 16:28:28', '2017-11-22 16:28:28', '1');
INSERT INTO `sys_user_permission` VALUES ('8', '2', '703', '2017-11-22 16:28:28', '2017-11-22 16:28:28', '1');
INSERT INTO `sys_user_permission` VALUES ('9', '2', '701', '2017-11-22 16:28:28', '2017-11-22 16:28:28', '1');
INSERT INTO `sys_user_permission` VALUES ('10', '2', '702', '2017-11-22 16:28:28', '2017-11-22 16:28:28', '1');
INSERT INTO `sys_user_permission` VALUES ('11', '2', '704', '2017-11-22 16:28:31', '2017-11-22 16:28:31', '1');
INSERT INTO `sys_user_permission` VALUES ('12', '2', '103', '2017-11-22 16:28:31', '2017-11-22 16:28:31', '1');
INSERT INTO `sys_user_permission` VALUES ('13', '3', '601', '2017-11-22 16:28:47', '2017-11-22 16:28:47', '1');
INSERT INTO `sys_user_permission` VALUES ('14', '3', '701', '2017-11-22 16:28:47', '2017-11-22 16:28:47', '1');
INSERT INTO `sys_user_permission` VALUES ('15', '3', '702', '2017-11-22 16:35:01', '2017-11-22 16:35:01', '1');
INSERT INTO `sys_user_permission` VALUES ('16', '3', '704', '2017-11-22 16:35:01', '2017-11-22 16:35:01', '1');
INSERT INTO `sys_user_permission` VALUES ('17', '3', '102', '2017-11-22 16:35:01', '2017-11-22 16:35:01', '1');
INSERT INTO `sys_user_permission` VALUES ('18', '3', '101', '2017-11-22 16:35:01', '2017-11-22 16:35:01', '1');
INSERT INTO `sys_user_permission` VALUES ('19', '3', '603', '2017-11-22 16:35:01', '2017-11-22 16:35:01', '1');
INSERT INTO `sys_user_permission` VALUES ('20', '4', '101', '2018-09-20 01:25:01', '2018-09-20 01:25:01', '1');
INSERT INTO `sys_user_permission` VALUES ('21', '4', '601', '2018-09-20 01:25:01', '2018-09-20 01:25:01', '1');
INSERT INTO `sys_user_permission` VALUES ('22', '4', '602', '2018-09-20 01:25:01', '2018-09-20 01:25:01', '1');
INSERT INTO `sys_user_permission` VALUES ('23', '4', '103', '2018-09-20 01:25:19', '2018-09-20 01:25:19', '1');
INSERT INTO `sys_user_permission` VALUES ('24', '5', '101', '2018-09-20 06:41:39', '2018-09-20 06:41:39', '1');
INSERT INTO `sys_user_permission` VALUES ('25', '5', '601', '2018-09-20 06:41:39', '2018-09-20 06:41:39', '1');
INSERT INTO `sys_user_permission` VALUES ('26', '5', '701', '2018-09-20 06:41:39', '2018-09-20 06:41:39', '1');
INSERT INTO `sys_user_permission` VALUES ('27', '4', '702', '2018-09-20 08:19:33', '2018-09-20 08:19:33', '1');
INSERT INTO `sys_user_permission` VALUES ('28', '4', '701', '2018-09-20 08:19:33', '2018-09-20 08:19:33', '1');
INSERT INTO `sys_user_permission` VALUES ('29', '22', '702', '2018-09-20 08:20:13', '2018-09-20 08:20:13', '1');
INSERT INTO `sys_user_permission` VALUES ('30', '22', '701', '2018-09-20 08:20:13', '2018-09-20 08:20:13', '1');
