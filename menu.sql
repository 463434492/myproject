/*
Navicat MySQL Data Transfer

Source Server         : 192.168.31.52
Source Server Version : 50725
Source Host           : 192.168.31.52:3306
Source Database       : menu

Target Server Type    : MYSQL
Target Server Version : 50725
File Encoding         : 65001

Date: 2020-09-01 07:21:22
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for commodity
-- ----------------------------
DROP TABLE IF EXISTS `commodity`;
CREATE TABLE `commodity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL COMMENT '商品名称',
  `unitiId` int(11) DEFAULT NULL COMMENT '默认单位',
  `initial` varchar(10) DEFAULT NULL COMMENT '首字母',
  `status` int(11) DEFAULT '1' COMMENT '状态：0删除，1正常',
  PRIMARY KEY (`id`),
  KEY `idx_name_initial` (`name`,`initial`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of commodity
-- ----------------------------

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `id` int(11) NOT NULL,
  `orderNo` varchar(128) NOT NULL COMMENT '订单号',
  `name` varchar(16) DEFAULT NULL COMMENT '客户名称',
  `phoneNo` varchar(16) DEFAULT NULL COMMENT '电话号码',
  `gregorianCalendar` datetime DEFAULT NULL COMMENT '阳历',
  `lunarCalendar` varchar(32) DEFAULT NULL COMMENT '阴历',
  `status` int(11) DEFAULT '1' COMMENT '状态：0删除，1正常',
  PRIMARY KEY (`id`),
  KEY `idx_orderNo_name` (`orderNo`,`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order
-- ----------------------------

-- ----------------------------
-- Table structure for orderdetail
-- ----------------------------
DROP TABLE IF EXISTS `orderdetail`;
CREATE TABLE `orderdetail` (
  `id` int(11) NOT NULL,
  `orderNo` varchar(128) DEFAULT NULL COMMENT '订单号',
  `commodityId` int(11) DEFAULT NULL COMMENT '商品id',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `weight` double DEFAULT NULL COMMENT '重量',
  PRIMARY KEY (`id`),
  KEY `idx_orderNo` (`orderNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orderdetail
-- ----------------------------

-- ----------------------------
-- Table structure for unit
-- ----------------------------
DROP TABLE IF EXISTS `unit`;
CREATE TABLE `unit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `unit_name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of unit
-- ----------------------------
