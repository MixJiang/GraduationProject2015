/*
Navicat MySQL Data Transfer

Source Server         : pinewsDB
Source Server Version : 50541
Source Host           : localhost:3306
Source Database       : pinews

Target Server Type    : MYSQL
Target Server Version : 50541
File Encoding         : 65001

Date: 2015-01-13 10:53:24
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for collection
-- ----------------------------
DROP TABLE IF EXISTS `collection`;
CREATE TABLE `collection` (
  `id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `newsid` int(11) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `newstitle` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of collection
-- ----------------------------

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `newsid` int(11) NOT NULL,
  `newstitle` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  `state` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of comment
-- ----------------------------

-- ----------------------------
-- Table structure for news
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `id` int(11) NOT NULL,
  `title` varchar(256) NOT NULL COMMENT '新闻标题',
  `content` varchar(255) NOT NULL COMMENT '新闻内容',
  `createtime` datetime NOT NULL COMMENT '发布时间',
  `author` varchar(32) DEFAULT NULL COMMENT '发布作者',
  `imgUrl` varchar(256) NOT NULL COMMENT '图片url',
  `type` int(3) NOT NULL COMMENT '新闻类别',
  `state` tinyint(3) NOT NULL COMMENT '0待审核,1已发布，2已删除',
  `click` int(11) DEFAULT NULL COMMENT '点击次数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of news
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `sex` char(1) DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `type` tinyint(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', '123456', 'm', '13026310448', '0');
INSERT INTO `user` VALUES ('2', 'test2', '2222', 'm', '13026310448', '10');
INSERT INTO `user` VALUES ('3', '1833559609@qq.com', '123456', null, null, '10');
INSERT INTO `user` VALUES ('4', 'test3', '111111', null, null, '10');
INSERT INTO `user` VALUES ('5', 'test4', '2222', null, null, '10');
INSERT INTO `user` VALUES ('6', 'test5', '123456', null, null, '10');
