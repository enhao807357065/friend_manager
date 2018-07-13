/*
 Navicat Premium Data Transfer

 Source Server         : localDB
 Source Server Type    : MySQL
 Source Server Version : 50722
 Source Host           : localhost
 Source Database       : friend_manager

 Target Server Type    : MySQL
 Target Server Version : 50722
 File Encoding         : utf-8

 Date: 07/13/2018 17:45:34 PM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `talks`
-- ----------------------------
DROP TABLE IF EXISTS `talks`;
CREATE TABLE `talks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '用户id',
  `content` text NOT NULL COMMENT '文本内容',
  `photo` varchar(300) NOT NULL COMMENT '图片',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态 0正常 1禁用',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COMMENT='悄悄话信息';

-- ----------------------------
--  Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '姓名',
  `nickname` varchar(50) NOT NULL COMMENT '昵称',
  `avatar` text NOT NULL COMMENT '头像',
  `phone` varchar(30) NOT NULL COMMENT '手机号',
  `gender` tinyint(4) NOT NULL COMMENT '性别',
  `openid` varchar(100) NOT NULL COMMENT 'openid',
  `unionid` varchar(100) NOT NULL COMMENT 'unionid',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态 0正常 1禁用',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unionid_UNIQUE` (`unionid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COMMENT='用户信息';

-- ----------------------------
--  Table structure for `user_talks`
-- ----------------------------
DROP TABLE IF EXISTS `user_talks`;
CREATE TABLE `user_talks` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT 'uid',
  `visitor` int(11) NOT NULL COMMENT '访客id',
  `total` int(11) NOT NULL DEFAULT '0' COMMENT '浏览次数',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_uid_visitor` (`uid`,`visitor`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='用户的悄悄话信息';

-- ----------------------------
--  Table structure for `user_talks_0`
-- ----------------------------
DROP TABLE IF EXISTS `user_talks_0`;
CREATE TABLE `user_talks_0` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT 'uid',
  `visitor` int(11) NOT NULL COMMENT '访客id',
  `total` int(11) NOT NULL DEFAULT '0' COMMENT '浏览次数',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_uid_visitor` (`uid`,`visitor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
--  Table structure for `user_talks_1`
-- ----------------------------
DROP TABLE IF EXISTS `user_talks_1`;
CREATE TABLE `user_talks_1` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT 'uid',
  `visitor` int(11) NOT NULL COMMENT '访客id',
  `total` int(11) NOT NULL DEFAULT '0' COMMENT '浏览次数',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_uid_visitor` (`uid`,`visitor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
--  Table structure for `user_talks_10`
-- ----------------------------
DROP TABLE IF EXISTS `user_talks_10`;
CREATE TABLE `user_talks_10` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT 'uid',
  `visitor` int(11) NOT NULL COMMENT '访客id',
  `total` int(11) NOT NULL DEFAULT '0' COMMENT '浏览次数',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_uid_visitor` (`uid`,`visitor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
--  Table structure for `user_talks_11`
-- ----------------------------
DROP TABLE IF EXISTS `user_talks_11`;
CREATE TABLE `user_talks_11` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT 'uid',
  `visitor` int(11) NOT NULL COMMENT '访客id',
  `total` int(11) NOT NULL DEFAULT '0' COMMENT '浏览次数',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_uid_visitor` (`uid`,`visitor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
--  Table structure for `user_talks_12`
-- ----------------------------
DROP TABLE IF EXISTS `user_talks_12`;
CREATE TABLE `user_talks_12` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT 'uid',
  `visitor` int(11) NOT NULL COMMENT '访客id',
  `total` int(11) NOT NULL DEFAULT '0' COMMENT '浏览次数',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_uid_visitor` (`uid`,`visitor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
--  Table structure for `user_talks_13`
-- ----------------------------
DROP TABLE IF EXISTS `user_talks_13`;
CREATE TABLE `user_talks_13` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT 'uid',
  `visitor` int(11) NOT NULL COMMENT '访客id',
  `total` int(11) NOT NULL DEFAULT '0' COMMENT '浏览次数',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_uid_visitor` (`uid`,`visitor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
--  Table structure for `user_talks_14`
-- ----------------------------
DROP TABLE IF EXISTS `user_talks_14`;
CREATE TABLE `user_talks_14` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT 'uid',
  `visitor` int(11) NOT NULL COMMENT '访客id',
  `total` int(11) NOT NULL DEFAULT '0' COMMENT '浏览次数',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_uid_visitor` (`uid`,`visitor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
--  Table structure for `user_talks_15`
-- ----------------------------
DROP TABLE IF EXISTS `user_talks_15`;
CREATE TABLE `user_talks_15` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT 'uid',
  `visitor` int(11) NOT NULL COMMENT '访客id',
  `total` int(11) NOT NULL DEFAULT '0' COMMENT '浏览次数',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_uid_visitor` (`uid`,`visitor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
--  Table structure for `user_talks_16`
-- ----------------------------
DROP TABLE IF EXISTS `user_talks_16`;
CREATE TABLE `user_talks_16` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT 'uid',
  `visitor` int(11) NOT NULL COMMENT '访客id',
  `total` int(11) NOT NULL DEFAULT '0' COMMENT '浏览次数',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_uid_visitor` (`uid`,`visitor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
--  Table structure for `user_talks_17`
-- ----------------------------
DROP TABLE IF EXISTS `user_talks_17`;
CREATE TABLE `user_talks_17` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT 'uid',
  `visitor` int(11) NOT NULL COMMENT '访客id',
  `total` int(11) NOT NULL DEFAULT '0' COMMENT '浏览次数',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_uid_visitor` (`uid`,`visitor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
--  Table structure for `user_talks_18`
-- ----------------------------
DROP TABLE IF EXISTS `user_talks_18`;
CREATE TABLE `user_talks_18` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT 'uid',
  `visitor` int(11) NOT NULL COMMENT '访客id',
  `total` int(11) NOT NULL DEFAULT '0' COMMENT '浏览次数',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_uid_visitor` (`uid`,`visitor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
--  Table structure for `user_talks_19`
-- ----------------------------
DROP TABLE IF EXISTS `user_talks_19`;
CREATE TABLE `user_talks_19` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT 'uid',
  `visitor` int(11) NOT NULL COMMENT '访客id',
  `total` int(11) NOT NULL DEFAULT '0' COMMENT '浏览次数',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_uid_visitor` (`uid`,`visitor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
--  Table structure for `user_talks_2`
-- ----------------------------
DROP TABLE IF EXISTS `user_talks_2`;
CREATE TABLE `user_talks_2` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT 'uid',
  `visitor` int(11) NOT NULL COMMENT '访客id',
  `total` int(11) NOT NULL DEFAULT '0' COMMENT '浏览次数',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_uid_visitor` (`uid`,`visitor`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
--  Table structure for `user_talks_20`
-- ----------------------------
DROP TABLE IF EXISTS `user_talks_20`;
CREATE TABLE `user_talks_20` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT 'uid',
  `visitor` int(11) NOT NULL COMMENT '访客id',
  `total` int(11) NOT NULL DEFAULT '0' COMMENT '浏览次数',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_uid_visitor` (`uid`,`visitor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
--  Table structure for `user_talks_21`
-- ----------------------------
DROP TABLE IF EXISTS `user_talks_21`;
CREATE TABLE `user_talks_21` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT 'uid',
  `visitor` int(11) NOT NULL COMMENT '访客id',
  `total` int(11) NOT NULL DEFAULT '0' COMMENT '浏览次数',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_uid_visitor` (`uid`,`visitor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
--  Table structure for `user_talks_22`
-- ----------------------------
DROP TABLE IF EXISTS `user_talks_22`;
CREATE TABLE `user_talks_22` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT 'uid',
  `visitor` int(11) NOT NULL COMMENT '访客id',
  `total` int(11) NOT NULL DEFAULT '0' COMMENT '浏览次数',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_uid_visitor` (`uid`,`visitor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
--  Table structure for `user_talks_23`
-- ----------------------------
DROP TABLE IF EXISTS `user_talks_23`;
CREATE TABLE `user_talks_23` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT 'uid',
  `visitor` int(11) NOT NULL COMMENT '访客id',
  `total` int(11) NOT NULL DEFAULT '0' COMMENT '浏览次数',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_uid_visitor` (`uid`,`visitor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
--  Table structure for `user_talks_24`
-- ----------------------------
DROP TABLE IF EXISTS `user_talks_24`;
CREATE TABLE `user_talks_24` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT 'uid',
  `visitor` int(11) NOT NULL COMMENT '访客id',
  `total` int(11) NOT NULL DEFAULT '0' COMMENT '浏览次数',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_uid_visitor` (`uid`,`visitor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
--  Table structure for `user_talks_25`
-- ----------------------------
DROP TABLE IF EXISTS `user_talks_25`;
CREATE TABLE `user_talks_25` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT 'uid',
  `visitor` int(11) NOT NULL COMMENT '访客id',
  `total` int(11) NOT NULL DEFAULT '0' COMMENT '浏览次数',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_uid_visitor` (`uid`,`visitor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
--  Table structure for `user_talks_26`
-- ----------------------------
DROP TABLE IF EXISTS `user_talks_26`;
CREATE TABLE `user_talks_26` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT 'uid',
  `visitor` int(11) NOT NULL COMMENT '访客id',
  `total` int(11) NOT NULL DEFAULT '0' COMMENT '浏览次数',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_uid_visitor` (`uid`,`visitor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
--  Table structure for `user_talks_27`
-- ----------------------------
DROP TABLE IF EXISTS `user_talks_27`;
CREATE TABLE `user_talks_27` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT 'uid',
  `visitor` int(11) NOT NULL COMMENT '访客id',
  `total` int(11) NOT NULL DEFAULT '0' COMMENT '浏览次数',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_uid_visitor` (`uid`,`visitor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
--  Table structure for `user_talks_28`
-- ----------------------------
DROP TABLE IF EXISTS `user_talks_28`;
CREATE TABLE `user_talks_28` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT 'uid',
  `visitor` int(11) NOT NULL COMMENT '访客id',
  `total` int(11) NOT NULL DEFAULT '0' COMMENT '浏览次数',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_uid_visitor` (`uid`,`visitor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
--  Table structure for `user_talks_29`
-- ----------------------------
DROP TABLE IF EXISTS `user_talks_29`;
CREATE TABLE `user_talks_29` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT 'uid',
  `visitor` int(11) NOT NULL COMMENT '访客id',
  `total` int(11) NOT NULL DEFAULT '0' COMMENT '浏览次数',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_uid_visitor` (`uid`,`visitor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
--  Table structure for `user_talks_3`
-- ----------------------------
DROP TABLE IF EXISTS `user_talks_3`;
CREATE TABLE `user_talks_3` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT 'uid',
  `visitor` int(11) NOT NULL COMMENT '访客id',
  `total` int(11) NOT NULL DEFAULT '0' COMMENT '浏览次数',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_uid_visitor` (`uid`,`visitor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
--  Table structure for `user_talks_30`
-- ----------------------------
DROP TABLE IF EXISTS `user_talks_30`;
CREATE TABLE `user_talks_30` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT 'uid',
  `visitor` int(11) NOT NULL COMMENT '访客id',
  `total` int(11) NOT NULL DEFAULT '0' COMMENT '浏览次数',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_uid_visitor` (`uid`,`visitor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
--  Table structure for `user_talks_31`
-- ----------------------------
DROP TABLE IF EXISTS `user_talks_31`;
CREATE TABLE `user_talks_31` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT 'uid',
  `visitor` int(11) NOT NULL COMMENT '访客id',
  `total` int(11) NOT NULL DEFAULT '0' COMMENT '浏览次数',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_uid_visitor` (`uid`,`visitor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
--  Table structure for `user_talks_32`
-- ----------------------------
DROP TABLE IF EXISTS `user_talks_32`;
CREATE TABLE `user_talks_32` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT 'uid',
  `visitor` int(11) NOT NULL COMMENT '访客id',
  `total` int(11) NOT NULL DEFAULT '0' COMMENT '浏览次数',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_uid_visitor` (`uid`,`visitor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
--  Table structure for `user_talks_33`
-- ----------------------------
DROP TABLE IF EXISTS `user_talks_33`;
CREATE TABLE `user_talks_33` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT 'uid',
  `visitor` int(11) NOT NULL COMMENT '访客id',
  `total` int(11) NOT NULL DEFAULT '0' COMMENT '浏览次数',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_uid_visitor` (`uid`,`visitor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
--  Table structure for `user_talks_34`
-- ----------------------------
DROP TABLE IF EXISTS `user_talks_34`;
CREATE TABLE `user_talks_34` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT 'uid',
  `visitor` int(11) NOT NULL COMMENT '访客id',
  `total` int(11) NOT NULL DEFAULT '0' COMMENT '浏览次数',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_uid_visitor` (`uid`,`visitor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
--  Table structure for `user_talks_35`
-- ----------------------------
DROP TABLE IF EXISTS `user_talks_35`;
CREATE TABLE `user_talks_35` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT 'uid',
  `visitor` int(11) NOT NULL COMMENT '访客id',
  `total` int(11) NOT NULL DEFAULT '0' COMMENT '浏览次数',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_uid_visitor` (`uid`,`visitor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
--  Table structure for `user_talks_36`
-- ----------------------------
DROP TABLE IF EXISTS `user_talks_36`;
CREATE TABLE `user_talks_36` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT 'uid',
  `visitor` int(11) NOT NULL COMMENT '访客id',
  `total` int(11) NOT NULL DEFAULT '0' COMMENT '浏览次数',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_uid_visitor` (`uid`,`visitor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
--  Table structure for `user_talks_37`
-- ----------------------------
DROP TABLE IF EXISTS `user_talks_37`;
CREATE TABLE `user_talks_37` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT 'uid',
  `visitor` int(11) NOT NULL COMMENT '访客id',
  `total` int(11) NOT NULL DEFAULT '0' COMMENT '浏览次数',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_uid_visitor` (`uid`,`visitor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
--  Table structure for `user_talks_38`
-- ----------------------------
DROP TABLE IF EXISTS `user_talks_38`;
CREATE TABLE `user_talks_38` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT 'uid',
  `visitor` int(11) NOT NULL COMMENT '访客id',
  `total` int(11) NOT NULL DEFAULT '0' COMMENT '浏览次数',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_uid_visitor` (`uid`,`visitor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
--  Table structure for `user_talks_39`
-- ----------------------------
DROP TABLE IF EXISTS `user_talks_39`;
CREATE TABLE `user_talks_39` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT 'uid',
  `visitor` int(11) NOT NULL COMMENT '访客id',
  `total` int(11) NOT NULL DEFAULT '0' COMMENT '浏览次数',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_uid_visitor` (`uid`,`visitor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
--  Table structure for `user_talks_4`
-- ----------------------------
DROP TABLE IF EXISTS `user_talks_4`;
CREATE TABLE `user_talks_4` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT 'uid',
  `visitor` int(11) NOT NULL COMMENT '访客id',
  `total` int(11) NOT NULL DEFAULT '0' COMMENT '浏览次数',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_uid_visitor` (`uid`,`visitor`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
--  Table structure for `user_talks_40`
-- ----------------------------
DROP TABLE IF EXISTS `user_talks_40`;
CREATE TABLE `user_talks_40` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT 'uid',
  `visitor` int(11) NOT NULL COMMENT '访客id',
  `total` int(11) NOT NULL DEFAULT '0' COMMENT '浏览次数',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_uid_visitor` (`uid`,`visitor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
--  Table structure for `user_talks_41`
-- ----------------------------
DROP TABLE IF EXISTS `user_talks_41`;
CREATE TABLE `user_talks_41` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT 'uid',
  `visitor` int(11) NOT NULL COMMENT '访客id',
  `total` int(11) NOT NULL DEFAULT '0' COMMENT '浏览次数',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_uid_visitor` (`uid`,`visitor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
--  Table structure for `user_talks_42`
-- ----------------------------
DROP TABLE IF EXISTS `user_talks_42`;
CREATE TABLE `user_talks_42` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT 'uid',
  `visitor` int(11) NOT NULL COMMENT '访客id',
  `total` int(11) NOT NULL DEFAULT '0' COMMENT '浏览次数',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_uid_visitor` (`uid`,`visitor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
--  Table structure for `user_talks_43`
-- ----------------------------
DROP TABLE IF EXISTS `user_talks_43`;
CREATE TABLE `user_talks_43` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT 'uid',
  `visitor` int(11) NOT NULL COMMENT '访客id',
  `total` int(11) NOT NULL DEFAULT '0' COMMENT '浏览次数',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_uid_visitor` (`uid`,`visitor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
--  Table structure for `user_talks_44`
-- ----------------------------
DROP TABLE IF EXISTS `user_talks_44`;
CREATE TABLE `user_talks_44` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT 'uid',
  `visitor` int(11) NOT NULL COMMENT '访客id',
  `total` int(11) NOT NULL DEFAULT '0' COMMENT '浏览次数',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_uid_visitor` (`uid`,`visitor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
--  Table structure for `user_talks_45`
-- ----------------------------
DROP TABLE IF EXISTS `user_talks_45`;
CREATE TABLE `user_talks_45` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT 'uid',
  `visitor` int(11) NOT NULL COMMENT '访客id',
  `total` int(11) NOT NULL DEFAULT '0' COMMENT '浏览次数',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_uid_visitor` (`uid`,`visitor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
--  Table structure for `user_talks_46`
-- ----------------------------
DROP TABLE IF EXISTS `user_talks_46`;
CREATE TABLE `user_talks_46` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT 'uid',
  `visitor` int(11) NOT NULL COMMENT '访客id',
  `total` int(11) NOT NULL DEFAULT '0' COMMENT '浏览次数',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_uid_visitor` (`uid`,`visitor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
--  Table structure for `user_talks_47`
-- ----------------------------
DROP TABLE IF EXISTS `user_talks_47`;
CREATE TABLE `user_talks_47` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT 'uid',
  `visitor` int(11) NOT NULL COMMENT '访客id',
  `total` int(11) NOT NULL DEFAULT '0' COMMENT '浏览次数',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_uid_visitor` (`uid`,`visitor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
--  Table structure for `user_talks_48`
-- ----------------------------
DROP TABLE IF EXISTS `user_talks_48`;
CREATE TABLE `user_talks_48` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT 'uid',
  `visitor` int(11) NOT NULL COMMENT '访客id',
  `total` int(11) NOT NULL DEFAULT '0' COMMENT '浏览次数',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_uid_visitor` (`uid`,`visitor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
--  Table structure for `user_talks_49`
-- ----------------------------
DROP TABLE IF EXISTS `user_talks_49`;
CREATE TABLE `user_talks_49` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT 'uid',
  `visitor` int(11) NOT NULL COMMENT '访客id',
  `total` int(11) NOT NULL DEFAULT '0' COMMENT '浏览次数',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_uid_visitor` (`uid`,`visitor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
--  Table structure for `user_talks_5`
-- ----------------------------
DROP TABLE IF EXISTS `user_talks_5`;
CREATE TABLE `user_talks_5` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT 'uid',
  `visitor` int(11) NOT NULL COMMENT '访客id',
  `total` int(11) NOT NULL DEFAULT '0' COMMENT '浏览次数',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_uid_visitor` (`uid`,`visitor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
--  Table structure for `user_talks_50`
-- ----------------------------
DROP TABLE IF EXISTS `user_talks_50`;
CREATE TABLE `user_talks_50` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT 'uid',
  `visitor` int(11) NOT NULL COMMENT '访客id',
  `total` int(11) NOT NULL DEFAULT '0' COMMENT '浏览次数',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_uid_visitor` (`uid`,`visitor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
--  Table structure for `user_talks_51`
-- ----------------------------
DROP TABLE IF EXISTS `user_talks_51`;
CREATE TABLE `user_talks_51` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT 'uid',
  `visitor` int(11) NOT NULL COMMENT '访客id',
  `total` int(11) NOT NULL DEFAULT '0' COMMENT '浏览次数',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_uid_visitor` (`uid`,`visitor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
--  Table structure for `user_talks_52`
-- ----------------------------
DROP TABLE IF EXISTS `user_talks_52`;
CREATE TABLE `user_talks_52` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT 'uid',
  `visitor` int(11) NOT NULL COMMENT '访客id',
  `total` int(11) NOT NULL DEFAULT '0' COMMENT '浏览次数',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_uid_visitor` (`uid`,`visitor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
--  Table structure for `user_talks_53`
-- ----------------------------
DROP TABLE IF EXISTS `user_talks_53`;
CREATE TABLE `user_talks_53` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT 'uid',
  `visitor` int(11) NOT NULL COMMENT '访客id',
  `total` int(11) NOT NULL DEFAULT '0' COMMENT '浏览次数',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_uid_visitor` (`uid`,`visitor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
--  Table structure for `user_talks_54`
-- ----------------------------
DROP TABLE IF EXISTS `user_talks_54`;
CREATE TABLE `user_talks_54` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT 'uid',
  `visitor` int(11) NOT NULL COMMENT '访客id',
  `total` int(11) NOT NULL DEFAULT '0' COMMENT '浏览次数',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_uid_visitor` (`uid`,`visitor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
--  Table structure for `user_talks_55`
-- ----------------------------
DROP TABLE IF EXISTS `user_talks_55`;
CREATE TABLE `user_talks_55` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT 'uid',
  `visitor` int(11) NOT NULL COMMENT '访客id',
  `total` int(11) NOT NULL DEFAULT '0' COMMENT '浏览次数',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_uid_visitor` (`uid`,`visitor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
--  Table structure for `user_talks_56`
-- ----------------------------
DROP TABLE IF EXISTS `user_talks_56`;
CREATE TABLE `user_talks_56` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT 'uid',
  `visitor` int(11) NOT NULL COMMENT '访客id',
  `total` int(11) NOT NULL DEFAULT '0' COMMENT '浏览次数',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_uid_visitor` (`uid`,`visitor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
--  Table structure for `user_talks_57`
-- ----------------------------
DROP TABLE IF EXISTS `user_talks_57`;
CREATE TABLE `user_talks_57` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT 'uid',
  `visitor` int(11) NOT NULL COMMENT '访客id',
  `total` int(11) NOT NULL DEFAULT '0' COMMENT '浏览次数',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_uid_visitor` (`uid`,`visitor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
--  Table structure for `user_talks_58`
-- ----------------------------
DROP TABLE IF EXISTS `user_talks_58`;
CREATE TABLE `user_talks_58` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT 'uid',
  `visitor` int(11) NOT NULL COMMENT '访客id',
  `total` int(11) NOT NULL DEFAULT '0' COMMENT '浏览次数',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_uid_visitor` (`uid`,`visitor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
--  Table structure for `user_talks_59`
-- ----------------------------
DROP TABLE IF EXISTS `user_talks_59`;
CREATE TABLE `user_talks_59` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT 'uid',
  `visitor` int(11) NOT NULL COMMENT '访客id',
  `total` int(11) NOT NULL DEFAULT '0' COMMENT '浏览次数',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_uid_visitor` (`uid`,`visitor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
--  Table structure for `user_talks_6`
-- ----------------------------
DROP TABLE IF EXISTS `user_talks_6`;
CREATE TABLE `user_talks_6` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT 'uid',
  `visitor` int(11) NOT NULL COMMENT '访客id',
  `total` int(11) NOT NULL DEFAULT '0' COMMENT '浏览次数',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_uid_visitor` (`uid`,`visitor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
--  Table structure for `user_talks_60`
-- ----------------------------
DROP TABLE IF EXISTS `user_talks_60`;
CREATE TABLE `user_talks_60` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT 'uid',
  `visitor` int(11) NOT NULL COMMENT '访客id',
  `total` int(11) NOT NULL DEFAULT '0' COMMENT '浏览次数',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_uid_visitor` (`uid`,`visitor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
--  Table structure for `user_talks_61`
-- ----------------------------
DROP TABLE IF EXISTS `user_talks_61`;
CREATE TABLE `user_talks_61` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT 'uid',
  `visitor` int(11) NOT NULL COMMENT '访客id',
  `total` int(11) NOT NULL DEFAULT '0' COMMENT '浏览次数',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_uid_visitor` (`uid`,`visitor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
--  Table structure for `user_talks_62`
-- ----------------------------
DROP TABLE IF EXISTS `user_talks_62`;
CREATE TABLE `user_talks_62` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT 'uid',
  `visitor` int(11) NOT NULL COMMENT '访客id',
  `total` int(11) NOT NULL DEFAULT '0' COMMENT '浏览次数',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_uid_visitor` (`uid`,`visitor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
--  Table structure for `user_talks_63`
-- ----------------------------
DROP TABLE IF EXISTS `user_talks_63`;
CREATE TABLE `user_talks_63` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT 'uid',
  `visitor` int(11) NOT NULL COMMENT '访客id',
  `total` int(11) NOT NULL DEFAULT '0' COMMENT '浏览次数',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_uid_visitor` (`uid`,`visitor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
--  Table structure for `user_talks_64`
-- ----------------------------
DROP TABLE IF EXISTS `user_talks_64`;
CREATE TABLE `user_talks_64` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT 'uid',
  `visitor` int(11) NOT NULL COMMENT '访客id',
  `total` int(11) NOT NULL DEFAULT '0' COMMENT '浏览次数',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_uid_visitor` (`uid`,`visitor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
--  Table structure for `user_talks_65`
-- ----------------------------
DROP TABLE IF EXISTS `user_talks_65`;
CREATE TABLE `user_talks_65` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT 'uid',
  `visitor` int(11) NOT NULL COMMENT '访客id',
  `total` int(11) NOT NULL DEFAULT '0' COMMENT '浏览次数',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_uid_visitor` (`uid`,`visitor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
--  Table structure for `user_talks_66`
-- ----------------------------
DROP TABLE IF EXISTS `user_talks_66`;
CREATE TABLE `user_talks_66` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT 'uid',
  `visitor` int(11) NOT NULL COMMENT '访客id',
  `total` int(11) NOT NULL DEFAULT '0' COMMENT '浏览次数',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_uid_visitor` (`uid`,`visitor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
--  Table structure for `user_talks_67`
-- ----------------------------
DROP TABLE IF EXISTS `user_talks_67`;
CREATE TABLE `user_talks_67` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT 'uid',
  `visitor` int(11) NOT NULL COMMENT '访客id',
  `total` int(11) NOT NULL DEFAULT '0' COMMENT '浏览次数',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_uid_visitor` (`uid`,`visitor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
--  Table structure for `user_talks_68`
-- ----------------------------
DROP TABLE IF EXISTS `user_talks_68`;
CREATE TABLE `user_talks_68` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT 'uid',
  `visitor` int(11) NOT NULL COMMENT '访客id',
  `total` int(11) NOT NULL DEFAULT '0' COMMENT '浏览次数',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_uid_visitor` (`uid`,`visitor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
--  Table structure for `user_talks_69`
-- ----------------------------
DROP TABLE IF EXISTS `user_talks_69`;
CREATE TABLE `user_talks_69` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT 'uid',
  `visitor` int(11) NOT NULL COMMENT '访客id',
  `total` int(11) NOT NULL DEFAULT '0' COMMENT '浏览次数',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_uid_visitor` (`uid`,`visitor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
--  Table structure for `user_talks_7`
-- ----------------------------
DROP TABLE IF EXISTS `user_talks_7`;
CREATE TABLE `user_talks_7` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT 'uid',
  `visitor` int(11) NOT NULL COMMENT '访客id',
  `total` int(11) NOT NULL DEFAULT '0' COMMENT '浏览次数',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_uid_visitor` (`uid`,`visitor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
--  Table structure for `user_talks_70`
-- ----------------------------
DROP TABLE IF EXISTS `user_talks_70`;
CREATE TABLE `user_talks_70` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT 'uid',
  `visitor` int(11) NOT NULL COMMENT '访客id',
  `total` int(11) NOT NULL DEFAULT '0' COMMENT '浏览次数',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_uid_visitor` (`uid`,`visitor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
--  Table structure for `user_talks_71`
-- ----------------------------
DROP TABLE IF EXISTS `user_talks_71`;
CREATE TABLE `user_talks_71` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT 'uid',
  `visitor` int(11) NOT NULL COMMENT '访客id',
  `total` int(11) NOT NULL DEFAULT '0' COMMENT '浏览次数',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_uid_visitor` (`uid`,`visitor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
--  Table structure for `user_talks_72`
-- ----------------------------
DROP TABLE IF EXISTS `user_talks_72`;
CREATE TABLE `user_talks_72` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT 'uid',
  `visitor` int(11) NOT NULL COMMENT '访客id',
  `total` int(11) NOT NULL DEFAULT '0' COMMENT '浏览次数',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_uid_visitor` (`uid`,`visitor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
--  Table structure for `user_talks_73`
-- ----------------------------
DROP TABLE IF EXISTS `user_talks_73`;
CREATE TABLE `user_talks_73` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT 'uid',
  `visitor` int(11) NOT NULL COMMENT '访客id',
  `total` int(11) NOT NULL DEFAULT '0' COMMENT '浏览次数',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_uid_visitor` (`uid`,`visitor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
--  Table structure for `user_talks_74`
-- ----------------------------
DROP TABLE IF EXISTS `user_talks_74`;
CREATE TABLE `user_talks_74` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT 'uid',
  `visitor` int(11) NOT NULL COMMENT '访客id',
  `total` int(11) NOT NULL DEFAULT '0' COMMENT '浏览次数',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_uid_visitor` (`uid`,`visitor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
--  Table structure for `user_talks_75`
-- ----------------------------
DROP TABLE IF EXISTS `user_talks_75`;
CREATE TABLE `user_talks_75` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT 'uid',
  `visitor` int(11) NOT NULL COMMENT '访客id',
  `total` int(11) NOT NULL DEFAULT '0' COMMENT '浏览次数',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_uid_visitor` (`uid`,`visitor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
--  Table structure for `user_talks_76`
-- ----------------------------
DROP TABLE IF EXISTS `user_talks_76`;
CREATE TABLE `user_talks_76` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT 'uid',
  `visitor` int(11) NOT NULL COMMENT '访客id',
  `total` int(11) NOT NULL DEFAULT '0' COMMENT '浏览次数',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_uid_visitor` (`uid`,`visitor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
--  Table structure for `user_talks_77`
-- ----------------------------
DROP TABLE IF EXISTS `user_talks_77`;
CREATE TABLE `user_talks_77` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT 'uid',
  `visitor` int(11) NOT NULL COMMENT '访客id',
  `total` int(11) NOT NULL DEFAULT '0' COMMENT '浏览次数',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_uid_visitor` (`uid`,`visitor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
--  Table structure for `user_talks_78`
-- ----------------------------
DROP TABLE IF EXISTS `user_talks_78`;
CREATE TABLE `user_talks_78` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT 'uid',
  `visitor` int(11) NOT NULL COMMENT '访客id',
  `total` int(11) NOT NULL DEFAULT '0' COMMENT '浏览次数',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_uid_visitor` (`uid`,`visitor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
--  Table structure for `user_talks_79`
-- ----------------------------
DROP TABLE IF EXISTS `user_talks_79`;
CREATE TABLE `user_talks_79` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT 'uid',
  `visitor` int(11) NOT NULL COMMENT '访客id',
  `total` int(11) NOT NULL DEFAULT '0' COMMENT '浏览次数',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_uid_visitor` (`uid`,`visitor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
--  Table structure for `user_talks_8`
-- ----------------------------
DROP TABLE IF EXISTS `user_talks_8`;
CREATE TABLE `user_talks_8` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT 'uid',
  `visitor` int(11) NOT NULL COMMENT '访客id',
  `total` int(11) NOT NULL DEFAULT '0' COMMENT '浏览次数',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_uid_visitor` (`uid`,`visitor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
--  Table structure for `user_talks_80`
-- ----------------------------
DROP TABLE IF EXISTS `user_talks_80`;
CREATE TABLE `user_talks_80` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT 'uid',
  `visitor` int(11) NOT NULL COMMENT '访客id',
  `total` int(11) NOT NULL DEFAULT '0' COMMENT '浏览次数',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_uid_visitor` (`uid`,`visitor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
--  Table structure for `user_talks_81`
-- ----------------------------
DROP TABLE IF EXISTS `user_talks_81`;
CREATE TABLE `user_talks_81` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT 'uid',
  `visitor` int(11) NOT NULL COMMENT '访客id',
  `total` int(11) NOT NULL DEFAULT '0' COMMENT '浏览次数',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_uid_visitor` (`uid`,`visitor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
--  Table structure for `user_talks_82`
-- ----------------------------
DROP TABLE IF EXISTS `user_talks_82`;
CREATE TABLE `user_talks_82` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT 'uid',
  `visitor` int(11) NOT NULL COMMENT '访客id',
  `total` int(11) NOT NULL DEFAULT '0' COMMENT '浏览次数',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_uid_visitor` (`uid`,`visitor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
--  Table structure for `user_talks_83`
-- ----------------------------
DROP TABLE IF EXISTS `user_talks_83`;
CREATE TABLE `user_talks_83` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT 'uid',
  `visitor` int(11) NOT NULL COMMENT '访客id',
  `total` int(11) NOT NULL DEFAULT '0' COMMENT '浏览次数',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_uid_visitor` (`uid`,`visitor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
--  Table structure for `user_talks_84`
-- ----------------------------
DROP TABLE IF EXISTS `user_talks_84`;
CREATE TABLE `user_talks_84` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT 'uid',
  `visitor` int(11) NOT NULL COMMENT '访客id',
  `total` int(11) NOT NULL DEFAULT '0' COMMENT '浏览次数',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_uid_visitor` (`uid`,`visitor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
--  Table structure for `user_talks_85`
-- ----------------------------
DROP TABLE IF EXISTS `user_talks_85`;
CREATE TABLE `user_talks_85` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT 'uid',
  `visitor` int(11) NOT NULL COMMENT '访客id',
  `total` int(11) NOT NULL DEFAULT '0' COMMENT '浏览次数',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_uid_visitor` (`uid`,`visitor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
--  Table structure for `user_talks_86`
-- ----------------------------
DROP TABLE IF EXISTS `user_talks_86`;
CREATE TABLE `user_talks_86` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT 'uid',
  `visitor` int(11) NOT NULL COMMENT '访客id',
  `total` int(11) NOT NULL DEFAULT '0' COMMENT '浏览次数',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_uid_visitor` (`uid`,`visitor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
--  Table structure for `user_talks_87`
-- ----------------------------
DROP TABLE IF EXISTS `user_talks_87`;
CREATE TABLE `user_talks_87` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT 'uid',
  `visitor` int(11) NOT NULL COMMENT '访客id',
  `total` int(11) NOT NULL DEFAULT '0' COMMENT '浏览次数',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_uid_visitor` (`uid`,`visitor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
--  Table structure for `user_talks_88`
-- ----------------------------
DROP TABLE IF EXISTS `user_talks_88`;
CREATE TABLE `user_talks_88` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT 'uid',
  `visitor` int(11) NOT NULL COMMENT '访客id',
  `total` int(11) NOT NULL DEFAULT '0' COMMENT '浏览次数',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_uid_visitor` (`uid`,`visitor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
--  Table structure for `user_talks_89`
-- ----------------------------
DROP TABLE IF EXISTS `user_talks_89`;
CREATE TABLE `user_talks_89` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT 'uid',
  `visitor` int(11) NOT NULL COMMENT '访客id',
  `total` int(11) NOT NULL DEFAULT '0' COMMENT '浏览次数',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_uid_visitor` (`uid`,`visitor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
--  Table structure for `user_talks_9`
-- ----------------------------
DROP TABLE IF EXISTS `user_talks_9`;
CREATE TABLE `user_talks_9` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT 'uid',
  `visitor` int(11) NOT NULL COMMENT '访客id',
  `total` int(11) NOT NULL DEFAULT '0' COMMENT '浏览次数',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_uid_visitor` (`uid`,`visitor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
--  Table structure for `user_talks_90`
-- ----------------------------
DROP TABLE IF EXISTS `user_talks_90`;
CREATE TABLE `user_talks_90` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT 'uid',
  `visitor` int(11) NOT NULL COMMENT '访客id',
  `total` int(11) NOT NULL DEFAULT '0' COMMENT '浏览次数',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_uid_visitor` (`uid`,`visitor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
--  Table structure for `user_talks_91`
-- ----------------------------
DROP TABLE IF EXISTS `user_talks_91`;
CREATE TABLE `user_talks_91` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT 'uid',
  `visitor` int(11) NOT NULL COMMENT '访客id',
  `total` int(11) NOT NULL DEFAULT '0' COMMENT '浏览次数',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_uid_visitor` (`uid`,`visitor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
--  Table structure for `user_talks_92`
-- ----------------------------
DROP TABLE IF EXISTS `user_talks_92`;
CREATE TABLE `user_talks_92` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT 'uid',
  `visitor` int(11) NOT NULL COMMENT '访客id',
  `total` int(11) NOT NULL DEFAULT '0' COMMENT '浏览次数',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_uid_visitor` (`uid`,`visitor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
--  Table structure for `user_talks_93`
-- ----------------------------
DROP TABLE IF EXISTS `user_talks_93`;
CREATE TABLE `user_talks_93` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT 'uid',
  `visitor` int(11) NOT NULL COMMENT '访客id',
  `total` int(11) NOT NULL DEFAULT '0' COMMENT '浏览次数',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_uid_visitor` (`uid`,`visitor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
--  Table structure for `user_talks_94`
-- ----------------------------
DROP TABLE IF EXISTS `user_talks_94`;
CREATE TABLE `user_talks_94` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT 'uid',
  `visitor` int(11) NOT NULL COMMENT '访客id',
  `total` int(11) NOT NULL DEFAULT '0' COMMENT '浏览次数',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_uid_visitor` (`uid`,`visitor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
--  Table structure for `user_talks_95`
-- ----------------------------
DROP TABLE IF EXISTS `user_talks_95`;
CREATE TABLE `user_talks_95` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT 'uid',
  `visitor` int(11) NOT NULL COMMENT '访客id',
  `total` int(11) NOT NULL DEFAULT '0' COMMENT '浏览次数',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_uid_visitor` (`uid`,`visitor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
--  Table structure for `user_talks_96`
-- ----------------------------
DROP TABLE IF EXISTS `user_talks_96`;
CREATE TABLE `user_talks_96` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT 'uid',
  `visitor` int(11) NOT NULL COMMENT '访客id',
  `total` int(11) NOT NULL DEFAULT '0' COMMENT '浏览次数',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_uid_visitor` (`uid`,`visitor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
--  Table structure for `user_talks_97`
-- ----------------------------
DROP TABLE IF EXISTS `user_talks_97`;
CREATE TABLE `user_talks_97` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT 'uid',
  `visitor` int(11) NOT NULL COMMENT '访客id',
  `total` int(11) NOT NULL DEFAULT '0' COMMENT '浏览次数',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_uid_visitor` (`uid`,`visitor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
--  Table structure for `user_talks_98`
-- ----------------------------
DROP TABLE IF EXISTS `user_talks_98`;
CREATE TABLE `user_talks_98` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT 'uid',
  `visitor` int(11) NOT NULL COMMENT '访客id',
  `total` int(11) NOT NULL DEFAULT '0' COMMENT '浏览次数',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_uid_visitor` (`uid`,`visitor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
--  Table structure for `user_talks_99`
-- ----------------------------
DROP TABLE IF EXISTS `user_talks_99`;
CREATE TABLE `user_talks_99` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT 'uid',
  `visitor` int(11) NOT NULL COMMENT '访客id',
  `total` int(11) NOT NULL DEFAULT '0' COMMENT '浏览次数',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_uid_visitor` (`uid`,`visitor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

SET FOREIGN_KEY_CHECKS = 1;
