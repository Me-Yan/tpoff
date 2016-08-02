/*
Navicat MySQL Data Transfer

Source Server         : yyh
Source Server Version : 50515
Source Host           : localhost:3306
Source Database       : tpoff

Target Server Type    : MYSQL
Target Server Version : 50515
File Encoding         : 65001

Date: 2016-06-01 16:10:44
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `t_addresses`
-- ----------------------------
DROP TABLE IF EXISTS `t_addresses`;
CREATE TABLE `t_addresses` (
  `aid` int(11) NOT NULL AUTO_INCREMENT,
  `receiver` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `addr` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  PRIMARY KEY (`aid`),
  KEY `FK53027597A39B8A9B` (`uid`),
  CONSTRAINT `FK53027597A39B8A9B` FOREIGN KEY (`uid`) REFERENCES `t_users` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of t_addresses
-- ----------------------------
INSERT INTO t_addresses VALUES ('1', '严杨鸿', '18380448173', '成都信息工程大学', '0', '2');

-- ----------------------------
-- Table structure for `t_adminusers`
-- ----------------------------
DROP TABLE IF EXISTS `t_adminusers`;
CREATE TABLE `t_adminusers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `permission` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of t_adminusers
-- ----------------------------
INSERT INTO t_adminusers VALUES ('1', 'admin', 'admin', '1');

-- ----------------------------
-- Table structure for `t_cartitems`
-- ----------------------------
DROP TABLE IF EXISTS `t_cartitems`;
CREATE TABLE `t_cartitems` (
  `cmid` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT NULL,
  `subcount` int(11) DEFAULT NULL,
  `subtotal` double DEFAULT NULL,
  `cid` int(11) DEFAULT NULL,
  PRIMARY KEY (`cmid`),
  KEY `FK2C215A95D0D8C772` (`pid`),
  KEY `FK2C215A95314440B3` (`cid`),
  CONSTRAINT `FK2C215A95314440B3` FOREIGN KEY (`cid`) REFERENCES `t_carts` (`cid`),
  CONSTRAINT `FK2C215A95D0D8C772` FOREIGN KEY (`pid`) REFERENCES `t_products` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of t_cartitems
-- ----------------------------
INSERT INTO t_cartitems VALUES ('1', '39', '4', '48', '1');
INSERT INTO t_cartitems VALUES ('2', '38', '2', '40', '1');

-- ----------------------------
-- Table structure for `t_carts`
-- ----------------------------
DROP TABLE IF EXISTS `t_carts`;
CREATE TABLE `t_carts` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `total` double DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  PRIMARY KEY (`cid`),
  KEY `FKA01025C8A39B8A9B` (`uid`),
  CONSTRAINT `FKA01025C8A39B8A9B` FOREIGN KEY (`uid`) REFERENCES `t_users` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of t_carts
-- ----------------------------
INSERT INTO t_carts VALUES ('1', '88', '2', '6');

-- ----------------------------
-- Table structure for `t_categorys`
-- ----------------------------
DROP TABLE IF EXISTS `t_categorys`;
CREATE TABLE `t_categorys` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `cname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of t_categorys
-- ----------------------------
INSERT INTO t_categorys VALUES ('1', '时令果蔬');
INSERT INTO t_categorys VALUES ('2', '肉禽蛋品');

-- ----------------------------
-- Table structure for `t_categoryseconds`
-- ----------------------------
DROP TABLE IF EXISTS `t_categoryseconds`;
CREATE TABLE `t_categoryseconds` (
  `csid` int(11) NOT NULL AUTO_INCREMENT,
  `csname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cid` int(11) DEFAULT NULL,
  PRIMARY KEY (`csid`),
  KEY `FK1CA381F611B48DEF` (`cid`),
  CONSTRAINT `FK1CA381F611B48DEF` FOREIGN KEY (`cid`) REFERENCES `t_categorys` (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of t_categoryseconds
-- ----------------------------
INSERT INTO t_categoryseconds VALUES ('1', '时令蔬菜', '1');
INSERT INTO t_categoryseconds VALUES ('2', '新鲜水果', '1');
INSERT INTO t_categoryseconds VALUES ('3', '肉类制品', '2');
INSERT INTO t_categoryseconds VALUES ('4', '猪牛羊肉', '2');

-- ----------------------------
-- Table structure for `t_collections`
-- ----------------------------
DROP TABLE IF EXISTS `t_collections`;
CREATE TABLE `t_collections` (
  `colid` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT NULL,
  `coldate` date DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  PRIMARY KEY (`colid`),
  KEY `FK5CCB764AA39B8A9B` (`uid`),
  KEY `FK5CCB764AD0D8C772` (`pid`),
  CONSTRAINT `FK5CCB764AA39B8A9B` FOREIGN KEY (`uid`) REFERENCES `t_users` (`uid`),
  CONSTRAINT `FK5CCB764AD0D8C772` FOREIGN KEY (`pid`) REFERENCES `t_products` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of t_collections
-- ----------------------------
INSERT INTO t_collections VALUES ('1', '39', '2016-05-25', '2');
INSERT INTO t_collections VALUES ('2', '36', '2016-05-25', '2');

-- ----------------------------
-- Table structure for `t_orderitems`
-- ----------------------------
DROP TABLE IF EXISTS `t_orderitems`;
CREATE TABLE `t_orderitems` (
  `omid` int(11) NOT NULL AUTO_INCREMENT,
  `subcount` int(11) DEFAULT NULL,
  `subtotal` double DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  `oid` int(11) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  PRIMARY KEY (`omid`),
  KEY `FKEB0005DD849C2011` (`oid`),
  KEY `FKEB0005DDD0D8C772` (`pid`),
  CONSTRAINT `FKEB0005DD849C2011` FOREIGN KEY (`oid`) REFERENCES `t_orders` (`oid`),
  CONSTRAINT `FKEB0005DDD0D8C772` FOREIGN KEY (`pid`) REFERENCES `t_products` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of t_orderitems
-- ----------------------------
INSERT INTO t_orderitems VALUES ('1', '7', '42', '16', '1', '0');
INSERT INTO t_orderitems VALUES ('2', '12', '48', '30', '1', '0');
INSERT INTO t_orderitems VALUES ('3', '3', '36', '39', '1', '0');
INSERT INTO t_orderitems VALUES ('4', '2', '40', '38', '2', '0');
INSERT INTO t_orderitems VALUES ('5', '7', '140', '38', '3', '0');
INSERT INTO t_orderitems VALUES ('6', '15', '180', '39', '3', '0');
INSERT INTO t_orderitems VALUES ('7', '2', '8', '30', '4', '0');
INSERT INTO t_orderitems VALUES ('8', '2', '24', '39', '4', '0');
INSERT INTO t_orderitems VALUES ('9', '2', '24', '39', '5', '1');
INSERT INTO t_orderitems VALUES ('10', '2', '52', '37', '5', '1');
INSERT INTO t_orderitems VALUES ('11', '2', '40', '38', '5', '1');
INSERT INTO t_orderitems VALUES ('12', '2', '24', '39', '6', '1');
INSERT INTO t_orderitems VALUES ('13', '2', '8', '30', '6', '1');
INSERT INTO t_orderitems VALUES ('14', '6', '72', '39', '7', '1');

-- ----------------------------
-- Table structure for `t_orders`
-- ----------------------------
DROP TABLE IF EXISTS `t_orders`;
CREATE TABLE `t_orders` (
  `oid` int(11) NOT NULL AUTO_INCREMENT,
  `total` double DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `odate` datetime DEFAULT NULL,
  `number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `paytotal` double DEFAULT NULL,
  `addr` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `receiver` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `flag` int(11) DEFAULT NULL,
  PRIMARY KEY (`oid`),
  KEY `FK7757B510A39B8A9B` (`uid`),
  CONSTRAINT `FK7757B510A39B8A9B` FOREIGN KEY (`uid`) REFERENCES `t_users` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of t_orders
-- ----------------------------
INSERT INTO t_orders VALUES ('1', '126', '22', '1', '2016-05-21 22:49:21', '201605212249211', '2', '126', '成都信息工程大学', '严杨鸿', '18380448173', '0');
INSERT INTO t_orders VALUES ('2', '40', '2', '2', '2016-05-25 21:41:20', '201605252141202', '2', '55', '成都信息工程大学', '严杨鸿', '18380448173', '0');
INSERT INTO t_orders VALUES ('3', '320', '22', '4', '2016-05-29 23:23:06', '201605292323063', '2', '320', '成都信息工程大学', '严杨鸿', '18380448173', '1');
INSERT INTO t_orders VALUES ('4', '32', '4', '0', '2016-05-30 00:39:23', '201605300039234', '2', '47', '成都信息工程大学', '严杨鸿', '18380448173', '0');
INSERT INTO t_orders VALUES ('5', '116', '6', '4', '2016-05-30 17:43:43', '201605301743435', '2', '116', '成都信息工程大学', '严杨鸿', '18380448173', '1');
INSERT INTO t_orders VALUES ('6', '32', '4', '4', '2016-05-31 02:11:29', '201605310211296', '2', '47', '成都信息工程大学', '严杨鸿', '18380448173', '1');
INSERT INTO t_orders VALUES ('7', '72', '6', '4', '2016-05-31 14:51:59', '201605311451597', '2', '87', '成都信息工程大学', '严杨鸿', '18380448173', '1');

-- ----------------------------
-- Table structure for `t_pcomments`
-- ----------------------------
DROP TABLE IF EXISTS `t_pcomments`;
CREATE TABLE `t_pcomments` (
  `pcid` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cdate` datetime DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  PRIMARY KEY (`pcid`),
  KEY `FKD8EA6859D0D8C772` (`pid`),
  CONSTRAINT `FKD8EA6859D0D8C772` FOREIGN KEY (`pid`) REFERENCES `t_products` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of t_pcomments
-- ----------------------------
INSERT INTO t_pcomments VALUES ('1', '我不知道你在想什么，还是那个地点那条街！', 'admin', '2016-05-31 02:04:00', '39');
INSERT INTO t_pcomments VALUES ('2', '这是我第二次评论了，不知道这个东西到底好不好！', 'admin', '2016-05-31 02:08:26', '37');
INSERT INTO t_pcomments VALUES ('3', '你的东西好不好，我要试过才知道!', 'admin', '2016-05-31 02:08:50', '38');
INSERT INTO t_pcomments VALUES ('5', '《以后的以后》依旧延续了《心有所爱》的情感风格走向，\n同时也不乏心妍式的独特演绎，具备了不俗的可听性。多了伤感的气息，但是又不乏真诚，带有不少新意。动听的旋律、流畅的编曲、精良的制作，无论从哪一个方面来说，庄心妍都成功地实现了自我突破，最可贵的是，这些突破并没有以失去好听旋律为代价。而优良的制作团队配合，更是为歌曲', 'admin', '2016-05-31 02:20:44', '39');
INSERT INTO t_pcomments VALUES ('6', '文字太短了为什么就出错了呢，真的是好奇怪呢！', 'admin', '2016-05-31 14:46:14', '30');
INSERT INTO t_pcomments VALUES ('7', '希望这次的测试通过哟，不然的话，我又要花很多的时间去修改了，好蛋疼哟！', 'admin', '2016-05-31 14:54:01', '39');

-- ----------------------------
-- Table structure for `t_pdetails`
-- ----------------------------
DROP TABLE IF EXISTS `t_pdetails`;
CREATE TABLE `t_pdetails` (
  `pdid` int(11) NOT NULL AUTO_INCREMENT,
  `pdpath` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  PRIMARY KEY (`pdid`),
  KEY `FK8609073DD0D8C772` (`pid`),
  CONSTRAINT `FK8609073DD0D8C772` FOREIGN KEY (`pid`) REFERENCES `t_products` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=481 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of t_pdetails
-- ----------------------------
INSERT INTO t_pdetails VALUES ('1', 'products/details/11463821572817.jpg', '1');
INSERT INTO t_pdetails VALUES ('2', 'products/details/21463821572871.jpg', '1');
INSERT INTO t_pdetails VALUES ('3', 'products/details/31463821572916.jpg', '1');
INSERT INTO t_pdetails VALUES ('4', 'products/details/41463821572960.jpg', '1');
INSERT INTO t_pdetails VALUES ('5', 'products/details/51463821573009.jpg', '1');
INSERT INTO t_pdetails VALUES ('6', 'products/details/61463821573065.jpg', '1');
INSERT INTO t_pdetails VALUES ('7', 'products/details/71463821573133.jpg', '1');
INSERT INTO t_pdetails VALUES ('8', 'products/details/81463821573193.jpg', '1');
INSERT INTO t_pdetails VALUES ('9', 'products/details/91463821573238.jpg', '1');
INSERT INTO t_pdetails VALUES ('10', 'products/details/101463821573283.jpg', '1');
INSERT INTO t_pdetails VALUES ('11', 'products/details/111463821573329.jpg', '1');
INSERT INTO t_pdetails VALUES ('12', 'products/details/121463821573373.jpg', '1');
INSERT INTO t_pdetails VALUES ('13', 'products/details/131463837477061.jpg', '2');
INSERT INTO t_pdetails VALUES ('14', 'products/details/141463837477106.jpg', '2');
INSERT INTO t_pdetails VALUES ('15', 'products/details/151463837477151.jpg', '2');
INSERT INTO t_pdetails VALUES ('16', 'products/details/161463837477195.jpg', '2');
INSERT INTO t_pdetails VALUES ('17', 'products/details/171463837477264.jpg', '2');
INSERT INTO t_pdetails VALUES ('18', 'products/details/181463837477388.jpg', '2');
INSERT INTO t_pdetails VALUES ('19', 'products/details/191463837477440.jpg', '2');
INSERT INTO t_pdetails VALUES ('20', 'products/details/201463837477485.jpg', '2');
INSERT INTO t_pdetails VALUES ('21', 'products/details/211463837477540.jpg', '2');
INSERT INTO t_pdetails VALUES ('22', 'products/details/221463837477585.jpg', '2');
INSERT INTO t_pdetails VALUES ('23', 'products/details/231463837477639.jpg', '2');
INSERT INTO t_pdetails VALUES ('24', 'products/details/241463837477690.jpg', '2');
INSERT INTO t_pdetails VALUES ('25', 'products/details/251463837587241.jpg', '3');
INSERT INTO t_pdetails VALUES ('26', 'products/details/261463837587297.jpg', '3');
INSERT INTO t_pdetails VALUES ('27', 'products/details/271463837587352.jpg', '3');
INSERT INTO t_pdetails VALUES ('28', 'products/details/281463837587407.jpg', '3');
INSERT INTO t_pdetails VALUES ('29', 'products/details/291463837587453.jpg', '3');
INSERT INTO t_pdetails VALUES ('30', 'products/details/301463837587508.jpg', '3');
INSERT INTO t_pdetails VALUES ('31', 'products/details/311463837587562.jpg', '3');
INSERT INTO t_pdetails VALUES ('32', 'products/details/321463837587608.jpg', '3');
INSERT INTO t_pdetails VALUES ('33', 'products/details/331463837587676.jpg', '3');
INSERT INTO t_pdetails VALUES ('34', 'products/details/341463837587736.jpg', '3');
INSERT INTO t_pdetails VALUES ('35', 'products/details/351463837588080.jpg', '3');
INSERT INTO t_pdetails VALUES ('36', 'products/details/361463837588140.jpg', '3');
INSERT INTO t_pdetails VALUES ('37', 'products/details/371463837679740.jpg', '4');
INSERT INTO t_pdetails VALUES ('38', 'products/details/381463837680046.jpg', '4');
INSERT INTO t_pdetails VALUES ('39', 'products/details/391463837680111.jpg', '4');
INSERT INTO t_pdetails VALUES ('40', 'products/details/401463837680151.jpg', '4');
INSERT INTO t_pdetails VALUES ('41', 'products/details/411463837680195.jpg', '4');
INSERT INTO t_pdetails VALUES ('42', 'products/details/421463837680251.jpg', '4');
INSERT INTO t_pdetails VALUES ('43', 'products/details/431463837680296.jpg', '4');
INSERT INTO t_pdetails VALUES ('44', 'products/details/441463837680340.jpg', '4');
INSERT INTO t_pdetails VALUES ('45', 'products/details/451463837680387.jpg', '4');
INSERT INTO t_pdetails VALUES ('46', 'products/details/461463837680429.jpg', '4');
INSERT INTO t_pdetails VALUES ('47', 'products/details/471463837680474.jpg', '4');
INSERT INTO t_pdetails VALUES ('48', 'products/details/481463837680520.jpg', '4');
INSERT INTO t_pdetails VALUES ('49', 'products/details/491463837742124.jpg', '5');
INSERT INTO t_pdetails VALUES ('50', 'products/details/501463837742170.jpg', '5');
INSERT INTO t_pdetails VALUES ('51', 'products/details/511463837742247.jpg', '5');
INSERT INTO t_pdetails VALUES ('52', 'products/details/521463837742291.jpg', '5');
INSERT INTO t_pdetails VALUES ('53', 'products/details/531463837742336.jpg', '5');
INSERT INTO t_pdetails VALUES ('54', 'products/details/541463837742382.jpg', '5');
INSERT INTO t_pdetails VALUES ('55', 'products/details/551463837742425.jpg', '5');
INSERT INTO t_pdetails VALUES ('56', 'products/details/561463837742472.jpg', '5');
INSERT INTO t_pdetails VALUES ('57', 'products/details/571463837742529.jpg', '5');
INSERT INTO t_pdetails VALUES ('58', 'products/details/581463837742581.jpg', '5');
INSERT INTO t_pdetails VALUES ('59', 'products/details/591463837742625.jpg', '5');
INSERT INTO t_pdetails VALUES ('60', 'products/details/601463837742671.jpg', '5');
INSERT INTO t_pdetails VALUES ('61', 'products/details/611463837852938.jpg', '6');
INSERT INTO t_pdetails VALUES ('62', 'products/details/621463837852983.jpg', '6');
INSERT INTO t_pdetails VALUES ('63', 'products/details/631463837853026.jpg', '6');
INSERT INTO t_pdetails VALUES ('64', 'products/details/641463837853071.jpg', '6');
INSERT INTO t_pdetails VALUES ('65', 'products/details/651463837853124.jpg', '6');
INSERT INTO t_pdetails VALUES ('66', 'products/details/661463837853171.jpg', '6');
INSERT INTO t_pdetails VALUES ('67', 'products/details/671463837853217.jpg', '6');
INSERT INTO t_pdetails VALUES ('68', 'products/details/681463837853260.jpg', '6');
INSERT INTO t_pdetails VALUES ('69', 'products/details/691463837853340.jpg', '6');
INSERT INTO t_pdetails VALUES ('70', 'products/details/701463837853524.jpg', '6');
INSERT INTO t_pdetails VALUES ('71', 'products/details/711463837853677.jpg', '6');
INSERT INTO t_pdetails VALUES ('72', 'products/details/721463837853735.jpg', '6');
INSERT INTO t_pdetails VALUES ('73', 'products/details/731463838086645.jpg', '7');
INSERT INTO t_pdetails VALUES ('74', 'products/details/741463838086690.jpg', '7');
INSERT INTO t_pdetails VALUES ('75', 'products/details/751463838086736.jpg', '7');
INSERT INTO t_pdetails VALUES ('76', 'products/details/761463838086783.jpg', '7');
INSERT INTO t_pdetails VALUES ('77', 'products/details/771463838086846.jpg', '7');
INSERT INTO t_pdetails VALUES ('78', 'products/details/781463838086893.jpg', '7');
INSERT INTO t_pdetails VALUES ('79', 'products/details/791463838086934.jpg', '7');
INSERT INTO t_pdetails VALUES ('80', 'products/details/801463838086982.jpg', '7');
INSERT INTO t_pdetails VALUES ('81', 'products/details/811463838087026.jpg', '7');
INSERT INTO t_pdetails VALUES ('82', 'products/details/821463838087070.jpg', '7');
INSERT INTO t_pdetails VALUES ('83', 'products/details/831463838087115.jpg', '7');
INSERT INTO t_pdetails VALUES ('84', 'products/details/841463838087160.jpg', '7');
INSERT INTO t_pdetails VALUES ('85', 'products/details/851463838208351.jpg', '8');
INSERT INTO t_pdetails VALUES ('86', 'products/details/861463838208398.jpg', '8');
INSERT INTO t_pdetails VALUES ('87', 'products/details/871463838208439.jpg', '8');
INSERT INTO t_pdetails VALUES ('88', 'products/details/881463838208495.jpg', '8');
INSERT INTO t_pdetails VALUES ('89', 'products/details/891463838208539.jpg', '8');
INSERT INTO t_pdetails VALUES ('90', 'products/details/901463838208584.jpg', '8');
INSERT INTO t_pdetails VALUES ('91', 'products/details/911463838208628.jpg', '8');
INSERT INTO t_pdetails VALUES ('92', 'products/details/921463838208672.jpg', '8');
INSERT INTO t_pdetails VALUES ('93', 'products/details/931463838208717.jpg', '8');
INSERT INTO t_pdetails VALUES ('94', 'products/details/941463838208761.jpg', '8');
INSERT INTO t_pdetails VALUES ('95', 'products/details/951463838208806.jpg', '8');
INSERT INTO t_pdetails VALUES ('96', 'products/details/961463838208851.jpg', '8');
INSERT INTO t_pdetails VALUES ('97', 'products/details/971463838376054.jpg', '9');
INSERT INTO t_pdetails VALUES ('98', 'products/details/981463838376101.jpg', '9');
INSERT INTO t_pdetails VALUES ('99', 'products/details/991463838376142.jpg', '9');
INSERT INTO t_pdetails VALUES ('100', 'products/details/1001463838376187.jpg', '9');
INSERT INTO t_pdetails VALUES ('101', 'products/details/1011463838376231.jpg', '9');
INSERT INTO t_pdetails VALUES ('102', 'products/details/1021463838376276.jpg', '9');
INSERT INTO t_pdetails VALUES ('103', 'products/details/1031463838376336.jpg', '9');
INSERT INTO t_pdetails VALUES ('104', 'products/details/1041463838376376.jpg', '9');
INSERT INTO t_pdetails VALUES ('105', 'products/details/1051463838376420.jpg', '9');
INSERT INTO t_pdetails VALUES ('106', 'products/details/1061463838376465.jpg', '9');
INSERT INTO t_pdetails VALUES ('107', 'products/details/1071463838376511.jpg', '9');
INSERT INTO t_pdetails VALUES ('108', 'products/details/1081463838376554.jpg', '9');
INSERT INTO t_pdetails VALUES ('109', 'products/details/1091463838519712.jpg', '10');
INSERT INTO t_pdetails VALUES ('110', 'products/details/1101463838520051.jpg', '10');
INSERT INTO t_pdetails VALUES ('111', 'products/details/1111463838520105.jpg', '10');
INSERT INTO t_pdetails VALUES ('112', 'products/details/1121463838520144.jpg', '10');
INSERT INTO t_pdetails VALUES ('113', 'products/details/1131463838520188.jpg', '10');
INSERT INTO t_pdetails VALUES ('114', 'products/details/1141463838520233.jpg', '10');
INSERT INTO t_pdetails VALUES ('115', 'products/details/1151463838520278.jpg', '10');
INSERT INTO t_pdetails VALUES ('116', 'products/details/1161463838520322.jpg', '10');
INSERT INTO t_pdetails VALUES ('117', 'products/details/1171463838520367.jpg', '10');
INSERT INTO t_pdetails VALUES ('118', 'products/details/1181463838520411.jpg', '10');
INSERT INTO t_pdetails VALUES ('119', 'products/details/1191463838520455.jpg', '10');
INSERT INTO t_pdetails VALUES ('120', 'products/details/1201463838520500.jpg', '10');
INSERT INTO t_pdetails VALUES ('121', 'products/details/1211463838622213.jpg', '11');
INSERT INTO t_pdetails VALUES ('122', 'products/details/1221463838622258.jpg', '11');
INSERT INTO t_pdetails VALUES ('123', 'products/details/1231463838622302.jpg', '11');
INSERT INTO t_pdetails VALUES ('124', 'products/details/1241463838622346.jpg', '11');
INSERT INTO t_pdetails VALUES ('125', 'products/details/1251463838622390.jpg', '11');
INSERT INTO t_pdetails VALUES ('126', 'products/details/1261463838622435.jpg', '11');
INSERT INTO t_pdetails VALUES ('127', 'products/details/1271463838622480.jpg', '11');
INSERT INTO t_pdetails VALUES ('128', 'products/details/1281463838622514.jpg', '11');
INSERT INTO t_pdetails VALUES ('129', 'products/details/1291463838622557.jpg', '11');
INSERT INTO t_pdetails VALUES ('130', 'products/details/1301463838622602.jpg', '11');
INSERT INTO t_pdetails VALUES ('131', 'products/details/1311463838622646.jpg', '11');
INSERT INTO t_pdetails VALUES ('132', 'products/details/1321463838622691.jpg', '11');
INSERT INTO t_pdetails VALUES ('133', 'products/details/1331463838690291.jpg', '12');
INSERT INTO t_pdetails VALUES ('134', 'products/details/1341463838690336.jpg', '12');
INSERT INTO t_pdetails VALUES ('135', 'products/details/1351463838690381.jpg', '12');
INSERT INTO t_pdetails VALUES ('136', 'products/details/1361463838690425.jpg', '12');
INSERT INTO t_pdetails VALUES ('137', 'products/details/1371463838690480.jpg', '12');
INSERT INTO t_pdetails VALUES ('138', 'products/details/1381463838690525.jpg', '12');
INSERT INTO t_pdetails VALUES ('139', 'products/details/1391463838690569.jpg', '12');
INSERT INTO t_pdetails VALUES ('140', 'products/details/1401463838690625.jpg', '12');
INSERT INTO t_pdetails VALUES ('141', 'products/details/1411463838690682.jpg', '12');
INSERT INTO t_pdetails VALUES ('142', 'products/details/1421463838690736.jpg', '12');
INSERT INTO t_pdetails VALUES ('143', 'products/details/1431463838690801.jpg', '12');
INSERT INTO t_pdetails VALUES ('144', 'products/details/1441463838690869.jpg', '12');
INSERT INTO t_pdetails VALUES ('145', 'products/details/1451463838760127.jpg', '13');
INSERT INTO t_pdetails VALUES ('146', 'products/details/1461463838760170.jpg', '13');
INSERT INTO t_pdetails VALUES ('147', 'products/details/1471463838760215.jpg', '13');
INSERT INTO t_pdetails VALUES ('148', 'products/details/1481463838760259.jpg', '13');
INSERT INTO t_pdetails VALUES ('149', 'products/details/1491463838760304.jpg', '13');
INSERT INTO t_pdetails VALUES ('150', 'products/details/1501463838760348.jpg', '13');
INSERT INTO t_pdetails VALUES ('151', 'products/details/1511463838760393.jpg', '13');
INSERT INTO t_pdetails VALUES ('152', 'products/details/1521463838760444.jpg', '13');
INSERT INTO t_pdetails VALUES ('153', 'products/details/1531463838760493.jpg', '13');
INSERT INTO t_pdetails VALUES ('154', 'products/details/1541463838760537.jpg', '13');
INSERT INTO t_pdetails VALUES ('155', 'products/details/1551463838760581.jpg', '13');
INSERT INTO t_pdetails VALUES ('156', 'products/details/1561463838760628.jpg', '13');
INSERT INTO t_pdetails VALUES ('157', 'products/details/1571463838881027.jpg', '14');
INSERT INTO t_pdetails VALUES ('158', 'products/details/1581463838881071.jpg', '14');
INSERT INTO t_pdetails VALUES ('159', 'products/details/1591463838881116.jpg', '14');
INSERT INTO t_pdetails VALUES ('160', 'products/details/1601463838881161.jpg', '14');
INSERT INTO t_pdetails VALUES ('161', 'products/details/1611463838881205.jpg', '14');
INSERT INTO t_pdetails VALUES ('162', 'products/details/1621463838881249.jpg', '14');
INSERT INTO t_pdetails VALUES ('163', 'products/details/1631463838881294.jpg', '14');
INSERT INTO t_pdetails VALUES ('164', 'products/details/1641463838881403.jpg', '14');
INSERT INTO t_pdetails VALUES ('165', 'products/details/1651463838881587.jpg', '14');
INSERT INTO t_pdetails VALUES ('166', 'products/details/1661463838881725.jpg', '14');
INSERT INTO t_pdetails VALUES ('167', 'products/details/1671463838882067.jpg', '14');
INSERT INTO t_pdetails VALUES ('168', 'products/details/1681463838882166.jpg', '14');
INSERT INTO t_pdetails VALUES ('169', 'products/details/1691463838958876.jpg', '15');
INSERT INTO t_pdetails VALUES ('170', 'products/details/1701463838958941.jpg', '15');
INSERT INTO t_pdetails VALUES ('171', 'products/details/1711463838958997.jpg', '15');
INSERT INTO t_pdetails VALUES ('172', 'products/details/1721463838959097.jpg', '15');
INSERT INTO t_pdetails VALUES ('173', 'products/details/1731463838959153.jpg', '15');
INSERT INTO t_pdetails VALUES ('174', 'products/details/1741463838959196.jpg', '15');
INSERT INTO t_pdetails VALUES ('175', 'products/details/1751463838959292.jpg', '15');
INSERT INTO t_pdetails VALUES ('176', 'products/details/1761463838959351.jpg', '15');
INSERT INTO t_pdetails VALUES ('177', 'products/details/1771463838959396.jpg', '15');
INSERT INTO t_pdetails VALUES ('178', 'products/details/1781463838959441.jpg', '15');
INSERT INTO t_pdetails VALUES ('179', 'products/details/1791463838959495.jpg', '15');
INSERT INTO t_pdetails VALUES ('180', 'products/details/1801463838959540.jpg', '15');
INSERT INTO t_pdetails VALUES ('181', 'products/details/1811463839094844.jpg', '16');
INSERT INTO t_pdetails VALUES ('182', 'products/details/1821463839094887.jpg', '16');
INSERT INTO t_pdetails VALUES ('183', 'products/details/1831463839094932.jpg', '16');
INSERT INTO t_pdetails VALUES ('184', 'products/details/1841463839094977.jpg', '16');
INSERT INTO t_pdetails VALUES ('185', 'products/details/1851463839095021.jpg', '16');
INSERT INTO t_pdetails VALUES ('186', 'products/details/1861463839095065.jpg', '16');
INSERT INTO t_pdetails VALUES ('187', 'products/details/1871463839095112.jpg', '16');
INSERT INTO t_pdetails VALUES ('188', 'products/details/1881463839095153.jpg', '16');
INSERT INTO t_pdetails VALUES ('189', 'products/details/1891463839095198.jpg', '16');
INSERT INTO t_pdetails VALUES ('190', 'products/details/1901463839095247.jpg', '16');
INSERT INTO t_pdetails VALUES ('191', 'products/details/1911463839095298.jpg', '16');
INSERT INTO t_pdetails VALUES ('192', 'products/details/1921463839095343.jpg', '16');
INSERT INTO t_pdetails VALUES ('193', 'products/details/1931463839274612.jpg', '17');
INSERT INTO t_pdetails VALUES ('194', 'products/details/1941463839274657.jpg', '17');
INSERT INTO t_pdetails VALUES ('195', 'products/details/1951463839274701.jpg', '17');
INSERT INTO t_pdetails VALUES ('196', 'products/details/1961463839274746.jpg', '17');
INSERT INTO t_pdetails VALUES ('197', 'products/details/1971463839274792.jpg', '17');
INSERT INTO t_pdetails VALUES ('198', 'products/details/1981463839274834.jpg', '17');
INSERT INTO t_pdetails VALUES ('199', 'products/details/1991463839274879.jpg', '17');
INSERT INTO t_pdetails VALUES ('200', 'products/details/2001463839274924.jpg', '17');
INSERT INTO t_pdetails VALUES ('201', 'products/details/2011463839274967.jpg', '17');
INSERT INTO t_pdetails VALUES ('202', 'products/details/2021463839275025.jpg', '17');
INSERT INTO t_pdetails VALUES ('203', 'products/details/2031463839275079.jpg', '17');
INSERT INTO t_pdetails VALUES ('204', 'products/details/2041463839275134.jpg', '17');
INSERT INTO t_pdetails VALUES ('205', 'products/details/2051463839365536.jpg', '18');
INSERT INTO t_pdetails VALUES ('206', 'products/details/2061463839365581.jpg', '18');
INSERT INTO t_pdetails VALUES ('207', 'products/details/2071463839365625.jpg', '18');
INSERT INTO t_pdetails VALUES ('208', 'products/details/2081463839365669.jpg', '18');
INSERT INTO t_pdetails VALUES ('209', 'products/details/2091463839365713.jpg', '18');
INSERT INTO t_pdetails VALUES ('210', 'products/details/2101463839366024.jpg', '18');
INSERT INTO t_pdetails VALUES ('211', 'products/details/2111463839366101.jpg', '18');
INSERT INTO t_pdetails VALUES ('212', 'products/details/2121463839366189.jpg', '18');
INSERT INTO t_pdetails VALUES ('213', 'products/details/2131463839366261.jpg', '18');
INSERT INTO t_pdetails VALUES ('214', 'products/details/2141463839366302.jpg', '18');
INSERT INTO t_pdetails VALUES ('215', 'products/details/2151463839366347.jpg', '18');
INSERT INTO t_pdetails VALUES ('216', 'products/details/2161463839366404.jpg', '18');
INSERT INTO t_pdetails VALUES ('217', 'products/details/2171463839446582.jpg', '19');
INSERT INTO t_pdetails VALUES ('218', 'products/details/2181463839446631.jpg', '19');
INSERT INTO t_pdetails VALUES ('219', 'products/details/2191463839446672.jpg', '19');
INSERT INTO t_pdetails VALUES ('220', 'products/details/2201463839446715.jpg', '19');
INSERT INTO t_pdetails VALUES ('221', 'products/details/2211463839446793.jpg', '19');
INSERT INTO t_pdetails VALUES ('222', 'products/details/2221463839446837.jpg', '19');
INSERT INTO t_pdetails VALUES ('223', 'products/details/2231463839446887.jpg', '19');
INSERT INTO t_pdetails VALUES ('224', 'products/details/2241463839446941.jpg', '19');
INSERT INTO t_pdetails VALUES ('225', 'products/details/2251463839446981.jpg', '19');
INSERT INTO t_pdetails VALUES ('226', 'products/details/2261463839447026.jpg', '19');
INSERT INTO t_pdetails VALUES ('227', 'products/details/2271463839447071.jpg', '19');
INSERT INTO t_pdetails VALUES ('228', 'products/details/2281463839447115.jpg', '19');
INSERT INTO t_pdetails VALUES ('229', 'products/details/2291463839561622.jpg', '20');
INSERT INTO t_pdetails VALUES ('230', 'products/details/2301463839561973.jpg', '20');
INSERT INTO t_pdetails VALUES ('231', 'products/details/2311463839562336.jpg', '20');
INSERT INTO t_pdetails VALUES ('232', 'products/details/2321463839562395.jpg', '20');
INSERT INTO t_pdetails VALUES ('233', 'products/details/2331463839562443.jpg', '20');
INSERT INTO t_pdetails VALUES ('234', 'products/details/2341463839562494.jpg', '20');
INSERT INTO t_pdetails VALUES ('235', 'products/details/2351463839562538.jpg', '20');
INSERT INTO t_pdetails VALUES ('236', 'products/details/2361463839562583.jpg', '20');
INSERT INTO t_pdetails VALUES ('237', 'products/details/2371463839562628.jpg', '20');
INSERT INTO t_pdetails VALUES ('238', 'products/details/2381463839562672.jpg', '20');
INSERT INTO t_pdetails VALUES ('239', 'products/details/2391463839562716.jpg', '20');
INSERT INTO t_pdetails VALUES ('240', 'products/details/2401463839562763.jpg', '20');
INSERT INTO t_pdetails VALUES ('241', 'products/details/2411463839664285.jpg', '21');
INSERT INTO t_pdetails VALUES ('242', 'products/details/2421463839664329.jpg', '21');
INSERT INTO t_pdetails VALUES ('243', 'products/details/2431463839664374.jpg', '21');
INSERT INTO t_pdetails VALUES ('244', 'products/details/2441463839664423.jpg', '21');
INSERT INTO t_pdetails VALUES ('245', 'products/details/2451463839664462.jpg', '21');
INSERT INTO t_pdetails VALUES ('246', 'products/details/2461463839664507.jpg', '21');
INSERT INTO t_pdetails VALUES ('247', 'products/details/2471463839664552.jpg', '21');
INSERT INTO t_pdetails VALUES ('248', 'products/details/2481463839664596.jpg', '21');
INSERT INTO t_pdetails VALUES ('249', 'products/details/2491463839664641.jpg', '21');
INSERT INTO t_pdetails VALUES ('250', 'products/details/2501463839664686.jpg', '21');
INSERT INTO t_pdetails VALUES ('251', 'products/details/2511463839664729.jpg', '21');
INSERT INTO t_pdetails VALUES ('252', 'products/details/2521463839664774.jpg', '21');
INSERT INTO t_pdetails VALUES ('253', 'products/details/2531463839787075.jpg', '22');
INSERT INTO t_pdetails VALUES ('254', 'products/details/2541463839787124.jpg', '22');
INSERT INTO t_pdetails VALUES ('255', 'products/details/2551463839787165.jpg', '22');
INSERT INTO t_pdetails VALUES ('256', 'products/details/2561463839787222.jpg', '22');
INSERT INTO t_pdetails VALUES ('257', 'products/details/2571463839787264.jpg', '22');
INSERT INTO t_pdetails VALUES ('258', 'products/details/2581463839787311.jpg', '22');
INSERT INTO t_pdetails VALUES ('259', 'products/details/2591463839787355.jpg', '22');
INSERT INTO t_pdetails VALUES ('260', 'products/details/2601463839787398.jpg', '22');
INSERT INTO t_pdetails VALUES ('261', 'products/details/2611463839787442.jpg', '22');
INSERT INTO t_pdetails VALUES ('262', 'products/details/2621463839787487.jpg', '22');
INSERT INTO t_pdetails VALUES ('263', 'products/details/2631463839787531.jpg', '22');
INSERT INTO t_pdetails VALUES ('264', 'products/details/2641463839787587.jpg', '22');
INSERT INTO t_pdetails VALUES ('265', 'products/details/2651463839864633.jpg', '23');
INSERT INTO t_pdetails VALUES ('266', 'products/details/2661463839864678.jpg', '23');
INSERT INTO t_pdetails VALUES ('267', 'products/details/2671463839864722.jpg', '23');
INSERT INTO t_pdetails VALUES ('268', 'products/details/2681463839864766.jpg', '23');
INSERT INTO t_pdetails VALUES ('269', 'products/details/2691463839864810.jpg', '23');
INSERT INTO t_pdetails VALUES ('270', 'products/details/2701463839864855.jpg', '23');
INSERT INTO t_pdetails VALUES ('271', 'products/details/2711463839864899.jpg', '23');
INSERT INTO t_pdetails VALUES ('272', 'products/details/2721463839864943.jpg', '23');
INSERT INTO t_pdetails VALUES ('273', 'products/details/2731463839864989.jpg', '23');
INSERT INTO t_pdetails VALUES ('274', 'products/details/2741463839865038.jpg', '23');
INSERT INTO t_pdetails VALUES ('275', 'products/details/2751463839865089.jpg', '23');
INSERT INTO t_pdetails VALUES ('276', 'products/details/2761463839865133.jpg', '23');
INSERT INTO t_pdetails VALUES ('277', 'products/details/2771463839972201.jpg', '24');
INSERT INTO t_pdetails VALUES ('278', 'products/details/2781463839972245.jpg', '24');
INSERT INTO t_pdetails VALUES ('279', 'products/details/2791463839972289.jpg', '24');
INSERT INTO t_pdetails VALUES ('280', 'products/details/2801463839972334.jpg', '24');
INSERT INTO t_pdetails VALUES ('281', 'products/details/2811463839972378.jpg', '24');
INSERT INTO t_pdetails VALUES ('282', 'products/details/2821463839972437.jpg', '24');
INSERT INTO t_pdetails VALUES ('283', 'products/details/2831463839972479.jpg', '24');
INSERT INTO t_pdetails VALUES ('284', 'products/details/2841463839972535.jpg', '24');
INSERT INTO t_pdetails VALUES ('285', 'products/details/2851463839972579.jpg', '24');
INSERT INTO t_pdetails VALUES ('286', 'products/details/2861463839972626.jpg', '24');
INSERT INTO t_pdetails VALUES ('287', 'products/details/2871463839972669.jpg', '24');
INSERT INTO t_pdetails VALUES ('288', 'products/details/2881463839972712.jpg', '24');
INSERT INTO t_pdetails VALUES ('289', 'products/details/2891463840124239.jpg', '25');
INSERT INTO t_pdetails VALUES ('290', 'products/details/2901463840124289.jpg', '25');
INSERT INTO t_pdetails VALUES ('291', 'products/details/2911463840124343.jpg', '25');
INSERT INTO t_pdetails VALUES ('292', 'products/details/2921463840124392.jpg', '25');
INSERT INTO t_pdetails VALUES ('293', 'products/details/2931463840124457.jpg', '25');
INSERT INTO t_pdetails VALUES ('294', 'products/details/2941463840124503.jpg', '25');
INSERT INTO t_pdetails VALUES ('295', 'products/details/2951463840124564.jpg', '25');
INSERT INTO t_pdetails VALUES ('296', 'products/details/2961463840124603.jpg', '25');
INSERT INTO t_pdetails VALUES ('297', 'products/details/2971463840124649.jpg', '25');
INSERT INTO t_pdetails VALUES ('298', 'products/details/2981463840124693.jpg', '25');
INSERT INTO t_pdetails VALUES ('299', 'products/details/2991463840124754.jpg', '25');
INSERT INTO t_pdetails VALUES ('300', 'products/details/3001463840124804.jpg', '25');
INSERT INTO t_pdetails VALUES ('301', 'products/details/3011463840219518.jpg', '26');
INSERT INTO t_pdetails VALUES ('302', 'products/details/3021463840219572.jpg', '26');
INSERT INTO t_pdetails VALUES ('303', 'products/details/3031463840219645.jpg', '26');
INSERT INTO t_pdetails VALUES ('304', 'products/details/3041463840219707.jpg', '26');
INSERT INTO t_pdetails VALUES ('305', 'products/details/3051463840220107.jpg', '26');
INSERT INTO t_pdetails VALUES ('306', 'products/details/3061463840220192.jpg', '26');
INSERT INTO t_pdetails VALUES ('307', 'products/details/3071463840220252.jpg', '26');
INSERT INTO t_pdetails VALUES ('308', 'products/details/3081463840220306.jpg', '26');
INSERT INTO t_pdetails VALUES ('309', 'products/details/3091463840220362.jpg', '26');
INSERT INTO t_pdetails VALUES ('310', 'products/details/3101463840220419.jpg', '26');
INSERT INTO t_pdetails VALUES ('311', 'products/details/3111463840220473.jpg', '26');
INSERT INTO t_pdetails VALUES ('312', 'products/details/3121463840220530.jpg', '26');
INSERT INTO t_pdetails VALUES ('313', 'products/details/3131463840321286.jpg', '27');
INSERT INTO t_pdetails VALUES ('314', 'products/details/3141463840321340.jpg', '27');
INSERT INTO t_pdetails VALUES ('315', 'products/details/3151463840321396.jpg', '27');
INSERT INTO t_pdetails VALUES ('316', 'products/details/3161463840321453.jpg', '27');
INSERT INTO t_pdetails VALUES ('317', 'products/details/3171463840321507.jpg', '27');
INSERT INTO t_pdetails VALUES ('318', 'products/details/3181463840321563.jpg', '27');
INSERT INTO t_pdetails VALUES ('319', 'products/details/3191463840321619.jpg', '27');
INSERT INTO t_pdetails VALUES ('320', 'products/details/3201463840321675.jpg', '27');
INSERT INTO t_pdetails VALUES ('321', 'products/details/3211463840321736.jpg', '27');
INSERT INTO t_pdetails VALUES ('322', 'products/details/3221463840322087.jpg', '27');
INSERT INTO t_pdetails VALUES ('323', 'products/details/3231463840322224.jpg', '27');
INSERT INTO t_pdetails VALUES ('324', 'products/details/3241463840322330.jpg', '27');
INSERT INTO t_pdetails VALUES ('325', 'products/details/3251463840393754.jpg', '28');
INSERT INTO t_pdetails VALUES ('326', 'products/details/3261463840394066.jpg', '28');
INSERT INTO t_pdetails VALUES ('327', 'products/details/3271463840394121.jpg', '28');
INSERT INTO t_pdetails VALUES ('328', 'products/details/3281463840394175.jpg', '28');
INSERT INTO t_pdetails VALUES ('329', 'products/details/3291463840394231.jpg', '28');
INSERT INTO t_pdetails VALUES ('330', 'products/details/3301463840394285.jpg', '28');
INSERT INTO t_pdetails VALUES ('331', 'products/details/3311463840394347.jpg', '28');
INSERT INTO t_pdetails VALUES ('332', 'products/details/3321463840394430.jpg', '28');
INSERT INTO t_pdetails VALUES ('333', 'products/details/3331463840394489.jpg', '28');
INSERT INTO t_pdetails VALUES ('334', 'products/details/3341463840394529.jpg', '28');
INSERT INTO t_pdetails VALUES ('335', 'products/details/3351463840394586.jpg', '28');
INSERT INTO t_pdetails VALUES ('336', 'products/details/3361463840394641.jpg', '28');
INSERT INTO t_pdetails VALUES ('337', 'products/details/3371463840472830.jpg', '29');
INSERT INTO t_pdetails VALUES ('338', 'products/details/3381463840472875.jpg', '29');
INSERT INTO t_pdetails VALUES ('339', 'products/details/3391463840472920.jpg', '29');
INSERT INTO t_pdetails VALUES ('340', 'products/details/3401463840472964.jpg', '29');
INSERT INTO t_pdetails VALUES ('341', 'products/details/3411463840473041.jpg', '29');
INSERT INTO t_pdetails VALUES ('342', 'products/details/3421463840473087.jpg', '29');
INSERT INTO t_pdetails VALUES ('343', 'products/details/3431463840473131.jpg', '29');
INSERT INTO t_pdetails VALUES ('344', 'products/details/3441463840473175.jpg', '29');
INSERT INTO t_pdetails VALUES ('345', 'products/details/3451463840473220.jpg', '29');
INSERT INTO t_pdetails VALUES ('346', 'products/details/3461463840473265.jpg', '29');
INSERT INTO t_pdetails VALUES ('347', 'products/details/3471463840473309.jpg', '29');
INSERT INTO t_pdetails VALUES ('348', 'products/details/3481463840473365.jpg', '29');
INSERT INTO t_pdetails VALUES ('349', 'products/details/3491463840539740.jpg', '30');
INSERT INTO t_pdetails VALUES ('350', 'products/details/3501463840540077.jpg', '30');
INSERT INTO t_pdetails VALUES ('351', 'products/details/3511463840540132.jpg', '30');
INSERT INTO t_pdetails VALUES ('352', 'products/details/3521463840540176.jpg', '30');
INSERT INTO t_pdetails VALUES ('353', 'products/details/3531463840540220.jpg', '30');
INSERT INTO t_pdetails VALUES ('354', 'products/details/3541463840540267.jpg', '30');
INSERT INTO t_pdetails VALUES ('355', 'products/details/3551463840540311.jpg', '30');
INSERT INTO t_pdetails VALUES ('356', 'products/details/3561463840540354.jpg', '30');
INSERT INTO t_pdetails VALUES ('357', 'products/details/3571463840540399.jpg', '30');
INSERT INTO t_pdetails VALUES ('358', 'products/details/3581463840540444.jpg', '30');
INSERT INTO t_pdetails VALUES ('359', 'products/details/3591463840540487.jpg', '30');
INSERT INTO t_pdetails VALUES ('360', 'products/details/3601463840540532.jpg', '30');
INSERT INTO t_pdetails VALUES ('361', 'products/details/3611463840631137.jpg', '31');
INSERT INTO t_pdetails VALUES ('362', 'products/details/3621463840631181.jpg', '31');
INSERT INTO t_pdetails VALUES ('363', 'products/details/3631463840631225.jpg', '31');
INSERT INTO t_pdetails VALUES ('364', 'products/details/3641463840631270.jpg', '31');
INSERT INTO t_pdetails VALUES ('365', 'products/details/3651463840631327.jpg', '31');
INSERT INTO t_pdetails VALUES ('366', 'products/details/3661463840631382.jpg', '31');
INSERT INTO t_pdetails VALUES ('367', 'products/details/3671463840631428.jpg', '31');
INSERT INTO t_pdetails VALUES ('368', 'products/details/3681463840631484.jpg', '31');
INSERT INTO t_pdetails VALUES ('369', 'products/details/3691463840631538.jpg', '31');
INSERT INTO t_pdetails VALUES ('370', 'products/details/3701463840631583.jpg', '31');
INSERT INTO t_pdetails VALUES ('371', 'products/details/3711463840631626.jpg', '31');
INSERT INTO t_pdetails VALUES ('372', 'products/details/3721463840631671.jpg', '31');
INSERT INTO t_pdetails VALUES ('373', 'products/details/3731463840718469.jpg', '32');
INSERT INTO t_pdetails VALUES ('374', 'products/details/3741463840718524.jpg', '32');
INSERT INTO t_pdetails VALUES ('375', 'products/details/3751463840718589.jpg', '32');
INSERT INTO t_pdetails VALUES ('376', 'products/details/3761463840718647.jpg', '32');
INSERT INTO t_pdetails VALUES ('377', 'products/details/3771463840718702.jpg', '32');
INSERT INTO t_pdetails VALUES ('378', 'products/details/3781463840718758.jpg', '32');
INSERT INTO t_pdetails VALUES ('379', 'products/details/3791463840718814.jpg', '32');
INSERT INTO t_pdetails VALUES ('380', 'products/details/3801463840718869.jpg', '32');
INSERT INTO t_pdetails VALUES ('381', 'products/details/3811463840718924.jpg', '32');
INSERT INTO t_pdetails VALUES ('382', 'products/details/3821463840718996.jpg', '32');
INSERT INTO t_pdetails VALUES ('383', 'products/details/3831463840719057.jpg', '32');
INSERT INTO t_pdetails VALUES ('384', 'products/details/3841463840719114.jpg', '32');
INSERT INTO t_pdetails VALUES ('385', 'products/details/3851463840814892.jpg', '33');
INSERT INTO t_pdetails VALUES ('386', 'products/details/3861463840814949.jpg', '33');
INSERT INTO t_pdetails VALUES ('387', 'products/details/3871463840815003.jpg', '33');
INSERT INTO t_pdetails VALUES ('388', 'products/details/3881463840815058.jpg', '33');
INSERT INTO t_pdetails VALUES ('389', 'products/details/3891463840815114.jpg', '33');
INSERT INTO t_pdetails VALUES ('390', 'products/details/3901463840815170.jpg', '33');
INSERT INTO t_pdetails VALUES ('391', 'products/details/3911463840815226.jpg', '33');
INSERT INTO t_pdetails VALUES ('392', 'products/details/3921463840815283.jpg', '33');
INSERT INTO t_pdetails VALUES ('393', 'products/details/3931463840815344.jpg', '33');
INSERT INTO t_pdetails VALUES ('394', 'products/details/3941463840815437.jpg', '33');
INSERT INTO t_pdetails VALUES ('395', 'products/details/3951463840815496.jpg', '33');
INSERT INTO t_pdetails VALUES ('396', 'products/details/3961463840815551.jpg', '33');
INSERT INTO t_pdetails VALUES ('397', 'products/details/3971463840900997.jpg', '34');
INSERT INTO t_pdetails VALUES ('398', 'products/details/3981463840901049.jpg', '34');
INSERT INTO t_pdetails VALUES ('399', 'products/details/3991463840901093.jpg', '34');
INSERT INTO t_pdetails VALUES ('400', 'products/details/4001463840901138.jpg', '34');
INSERT INTO t_pdetails VALUES ('401', 'products/details/4011463840901183.jpg', '34');
INSERT INTO t_pdetails VALUES ('402', 'products/details/4021463840901227.jpg', '34');
INSERT INTO t_pdetails VALUES ('403', 'products/details/4031463840901271.jpg', '34');
INSERT INTO t_pdetails VALUES ('404', 'products/details/4041463840901315.jpg', '34');
INSERT INTO t_pdetails VALUES ('405', 'products/details/4051463840901360.jpg', '34');
INSERT INTO t_pdetails VALUES ('406', 'products/details/4061463840901405.jpg', '34');
INSERT INTO t_pdetails VALUES ('407', 'products/details/4071463840901449.jpg', '34');
INSERT INTO t_pdetails VALUES ('408', 'products/details/4081463840901494.jpg', '34');
INSERT INTO t_pdetails VALUES ('409', 'products/details/4091463841143604.jpg', '35');
INSERT INTO t_pdetails VALUES ('410', 'products/details/4101463841143671.jpg', '35');
INSERT INTO t_pdetails VALUES ('411', 'products/details/4111463841143738.jpg', '35');
INSERT INTO t_pdetails VALUES ('412', 'products/details/4121463841144048.jpg', '35');
INSERT INTO t_pdetails VALUES ('413', 'products/details/4131463841144116.jpg', '35');
INSERT INTO t_pdetails VALUES ('414', 'products/details/4141463841144179.jpg', '35');
INSERT INTO t_pdetails VALUES ('415', 'products/details/4151463841144234.jpg', '35');
INSERT INTO t_pdetails VALUES ('416', 'products/details/4161463841144290.jpg', '35');
INSERT INTO t_pdetails VALUES ('417', 'products/details/4171463841144346.jpg', '35');
INSERT INTO t_pdetails VALUES ('418', 'products/details/4181463841144401.jpg', '35');
INSERT INTO t_pdetails VALUES ('419', 'products/details/4191463841144479.jpg', '35');
INSERT INTO t_pdetails VALUES ('420', 'products/details/4201463841144598.jpg', '35');
INSERT INTO t_pdetails VALUES ('421', 'products/details/4211463841288714.jpg', '36');
INSERT INTO t_pdetails VALUES ('422', 'products/details/4221463841288783.jpg', '36');
INSERT INTO t_pdetails VALUES ('423', 'products/details/4231463841288872.jpg', '36');
INSERT INTO t_pdetails VALUES ('424', 'products/details/4241463841288914.jpg', '36');
INSERT INTO t_pdetails VALUES ('425', 'products/details/4251463841288959.jpg', '36');
INSERT INTO t_pdetails VALUES ('426', 'products/details/4261463841289002.jpg', '36');
INSERT INTO t_pdetails VALUES ('427', 'products/details/4271463841289047.jpg', '36');
INSERT INTO t_pdetails VALUES ('428', 'products/details/4281463841289092.jpg', '36');
INSERT INTO t_pdetails VALUES ('429', 'products/details/4291463841289140.jpg', '36');
INSERT INTO t_pdetails VALUES ('430', 'products/details/4301463841289203.jpg', '36');
INSERT INTO t_pdetails VALUES ('431', 'products/details/4311463841289247.jpg', '36');
INSERT INTO t_pdetails VALUES ('432', 'products/details/4321463841289337.jpg', '36');
INSERT INTO t_pdetails VALUES ('433', 'products/details/4331463841430427.jpg', '37');
INSERT INTO t_pdetails VALUES ('434', 'products/details/4341463841430483.jpg', '37');
INSERT INTO t_pdetails VALUES ('435', 'products/details/4351463841430527.jpg', '37');
INSERT INTO t_pdetails VALUES ('436', 'products/details/4361463841430582.jpg', '37');
INSERT INTO t_pdetails VALUES ('437', 'products/details/4371463841430633.jpg', '37');
INSERT INTO t_pdetails VALUES ('438', 'products/details/4381463841430684.jpg', '37');
INSERT INTO t_pdetails VALUES ('439', 'products/details/4391463841430728.jpg', '37');
INSERT INTO t_pdetails VALUES ('440', 'products/details/4401463841430773.jpg', '37');
INSERT INTO t_pdetails VALUES ('441', 'products/details/4411463841430816.jpg', '37');
INSERT INTO t_pdetails VALUES ('442', 'products/details/4421463841430861.jpg', '37');
INSERT INTO t_pdetails VALUES ('443', 'products/details/4431463841430902.jpg', '37');
INSERT INTO t_pdetails VALUES ('444', 'products/details/4441463841430946.jpg', '37');
INSERT INTO t_pdetails VALUES ('445', 'products/details/4451463841477426.jpg', '38');
INSERT INTO t_pdetails VALUES ('446', 'products/details/4461463841477481.jpg', '38');
INSERT INTO t_pdetails VALUES ('447', 'products/details/4471463841477541.jpg', '38');
INSERT INTO t_pdetails VALUES ('448', 'products/details/4481463841477592.jpg', '38');
INSERT INTO t_pdetails VALUES ('449', 'products/details/4491463841477647.jpg', '38');
INSERT INTO t_pdetails VALUES ('450', 'products/details/4501463841477703.jpg', '38');
INSERT INTO t_pdetails VALUES ('451', 'products/details/4511463841478071.jpg', '38');
INSERT INTO t_pdetails VALUES ('452', 'products/details/4521463841478137.jpg', '38');
INSERT INTO t_pdetails VALUES ('453', 'products/details/4531463841478196.jpg', '38');
INSERT INTO t_pdetails VALUES ('454', 'products/details/4541463841478247.jpg', '38');
INSERT INTO t_pdetails VALUES ('455', 'products/details/4551463841478303.jpg', '38');
INSERT INTO t_pdetails VALUES ('456', 'products/details/4561463841478359.jpg', '38');
INSERT INTO t_pdetails VALUES ('457', 'products/details/4571463841550328.jpg', '39');
INSERT INTO t_pdetails VALUES ('458', 'products/details/4581463841550371.jpg', '39');
INSERT INTO t_pdetails VALUES ('459', 'products/details/4591463841550415.jpg', '39');
INSERT INTO t_pdetails VALUES ('460', 'products/details/4601463841550459.jpg', '39');
INSERT INTO t_pdetails VALUES ('461', 'products/details/4611463841550505.jpg', '39');
INSERT INTO t_pdetails VALUES ('462', 'products/details/4621463841550548.jpg', '39');
INSERT INTO t_pdetails VALUES ('463', 'products/details/4631463841550593.jpg', '39');
INSERT INTO t_pdetails VALUES ('464', 'products/details/4641463841550637.jpg', '39');
INSERT INTO t_pdetails VALUES ('465', 'products/details/4651463841550683.jpg', '39');
INSERT INTO t_pdetails VALUES ('466', 'products/details/4661463841550726.jpg', '39');
INSERT INTO t_pdetails VALUES ('467', 'products/details/4671463841550771.jpg', '39');
INSERT INTO t_pdetails VALUES ('468', 'products/details/4681463841550815.jpg', '39');
INSERT INTO t_pdetails VALUES ('469', 'products/details/4691463841625376.jpg', '40');
INSERT INTO t_pdetails VALUES ('470', 'products/details/4701463841625427.jpg', '40');
INSERT INTO t_pdetails VALUES ('471', 'products/details/4711463841625473.jpg', '40');
INSERT INTO t_pdetails VALUES ('472', 'products/details/4721463841625516.jpg', '40');
INSERT INTO t_pdetails VALUES ('473', 'products/details/4731463841625561.jpg', '40');
INSERT INTO t_pdetails VALUES ('474', 'products/details/4741463841625611.jpg', '40');
INSERT INTO t_pdetails VALUES ('475', 'products/details/4751463841625669.jpg', '40');
INSERT INTO t_pdetails VALUES ('476', 'products/details/4761463841625728.jpg', '40');
INSERT INTO t_pdetails VALUES ('477', 'products/details/4771463841626067.jpg', '40');
INSERT INTO t_pdetails VALUES ('478', 'products/details/4781463841626160.jpg', '40');
INSERT INTO t_pdetails VALUES ('479', 'products/details/4791463841626206.jpg', '40');
INSERT INTO t_pdetails VALUES ('480', 'products/details/4801463841626249.jpg', '40');

-- ----------------------------
-- Table structure for `t_products`
-- ----------------------------
DROP TABLE IF EXISTS `t_products`;
CREATE TABLE `t_products` (
  `pid` int(11) NOT NULL AUTO_INCREMENT,
  `csid` int(11) DEFAULT NULL,
  `pname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` double DEFAULT NULL,
  `least` int(11) DEFAULT NULL,
  `unit` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `function` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pdate` datetime DEFAULT NULL,
  `salecount` int(11) DEFAULT NULL,
  `pimg` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ucount` int(11) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  PRIMARY KEY (`pid`),
  KEY `FK7AD844CF48512104` (`csid`),
  CONSTRAINT `FK7AD844CF48512104` FOREIGN KEY (`csid`) REFERENCES `t_categoryseconds` (`csid`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of t_products
-- ----------------------------
INSERT INTO t_products VALUES ('1', '1', '胡萝卜绿色蔬菜', '4.3', '5', '斤', '胡萝卜是一种质脆味美、营养丰富的家常蔬菜，素有“小人参”之称。胡萝卜富含糖类、脂肪、挥发油、胡萝卜素、维生素A、维生素B1、维生素B2、花青素、钙、铁等营养成分。每100克胡萝卜中，约含蛋白质0.6克，脂肪0.3克，糖类7.6-8.3克，铁0.6毫克，维生素A原（胡萝卜素）1.35-17.25毫克，维生素B10.02-0.04毫克，维生素B20.04-0.05毫克，维生素C12毫克，热量150.7千焦，另含果胶、淀粉、无机盐和多种氨基酸。各类品种中，尤以深橘红色胡萝卜素含量最高。美国科学家研究证实：每天吃两根胡萝卜，可使血中胆固醇降低10%-20%;每天吃三根胡萝卜，有助于预防心脏疾病和肿瘤。', '2016-05-21 17:06:12', '0', 'products/titles/11463821572541.jpg', '0', '1');
INSERT INTO t_products VALUES ('2', '4', '安格斯无骨小排', '25.3', '5', '斤', '排骨有很高的营养价值，排骨味甘咸、性平，入脾、胃、肾经；补肾养血，滋阴润燥；主治热病伤津、消渴羸瘦、肾虚体弱、产后血虚、燥咳、便秘、补虚、滋阴、润燥、滋肝阴，润肌肤，利二便和止消渴。', '2016-05-21 21:31:16', '0', 'products/titles/21463837476744.jpg', '0', '1');
INSERT INTO t_products VALUES ('3', '4', '安格斯眼肉', '56', '10', '斤', '也指牛背上两侧前面的部位肉。属高档部位肉，经精细分割后，外观呈四方圆弧状，每块平均重量为3-5kg，肉质红白镶嵌，呈大理石花斑纹状。 选牛脊背第七根至第十根肋骨之间的肉,此肉形如眼状,也称为眼牛眼肉菜品牛眼肉菜品肉 ，眼肉肉质细嫩，脂肪含量较高，吃起来的口感比较香甜多汁，不干涩。', '2016-05-21 21:33:06', '0', 'products/titles/31463837586922.jpg', '0', '1');
INSERT INTO t_products VALUES ('4', '2', '安岳柠檬', '15', '10', '斤', '柠檬富含维生素C、糖类、钙、磷、铁、维生素B1、维生素B2、烟酸、奎宁酸、柠檬酸、苹果酸、橙皮苷、柚皮苷、香豆精、高量钾元素和低量钠元素等，对人体十分有益。维生素C能维持人体各种组织和细胞间质的生成，并保持它们正常的生理机能。人体内的母质、粘合和成胶质等，都需要维生素C来保护。当维生素C缺少了，细胞之间的间质——胶状物也就跟着变少。这样，细胞组织就会变脆，失去抵抗外力的能力，人体就容易出现坏血症，它还有更多用途，如预防感冒、刺激造血和抗癌等作用。', '2016-05-21 21:34:39', '0', 'products/titles/41463837679462.png', '0', '1');
INSERT INTO t_products VALUES ('5', '1', '茶树菇', '15', '2', '斤', '茶树菇含有人体所需的18种氨基酸，特别是含有人体所不能合成的8种氨基酸、葡聚糖、菌蛋白、碳水化合物等营养成分，其菇柄脆嫩爽口，味道清香。还有丰富的B族维生素和多种矿物质元素，如铁、钾、锌、硒等元素都高于其它菌类，中医认为该菇具有补肾、利尿、治腰酸痛、渗湿、健脾、止泻等功效， 是高血压、心血管和肥胖症患者的理想食品。其味道鲜美，脆嫩可口，又具有较好的保健作用，是美味珍稀的食用菌之一。', '2016-05-21 21:35:41', '0', 'products/titles/51463837741760.jpg', '0', '1');
INSERT INTO t_products VALUES ('6', '2', '番石榴', '17', '10', '斤', '具有降血糖的功效，在国外常用来治疗糖尿病。实验表明，糖尿病患者经常食用番石榴，对于病症的减轻有辅助治疗作用。在宝岛台湾采用番石榴降低血糖很普遍。大陆民间也有这方面的例子，比如轻度患者，每日三餐后各服1～3杯番石榴汁，即有疗效。若取番石榴干果50克，苦瓜一个，水煎服，每日1～2次，对改善糖尿病症状也有较好的效果。但是，因番石榴甘温而涩并且含有鞣质，食之可以止泻多食容易导致便秘，所以，患有便秘或者内有火气者不宜食用。此外，番石榴的树皮、根、叶也可入药，用来治疗某些病症。', '2016-05-21 21:37:32', '0', 'products/titles/61463837852599.jpg', '0', '1');
INSERT INTO t_products VALUES ('7', '4', '格芬无骨小排', '32', '5', '斤', '猪小排又名猪肋排。猪小排是指猪腹腔靠近肚腩部分的排骨，它的上边是肋排和子排。小排的肉层比较厚，并带有白色软骨，猪肉为人类提供优质蛋白质和必需的脂肪酸。', '2016-05-21 21:41:26', '0', 'products/titles/71463838086370.jpg', '0', '1');
INSERT INTO t_products VALUES ('8', '4', '格芬眼肉', '39', '5', '斤', '也指牛背上两侧前面的部位肉。属高档部位肉，经精细分割后，外观呈四方圆弧状，每块平均重量为3-5kg，肉质红白镶嵌，呈大理石花斑纹状。 选牛脊背第七根至第十根肋骨之间的肉,此肉形如眼状,也称为眼肉 ，眼肉肉质细嫩，脂肪含量较高，吃起来的口感比较香甜多汁，不干涩。', '2016-05-21 21:43:28', '0', 'products/titles/81463838208033.jpg', '0', '1');
INSERT INTO t_products VALUES ('9', '2', '黑布林', '12', '10', '斤', '黑布林的果实含有丰富的糖，维生素，果酸，氨基酸等营养成分。具有很高的营养价值，黑布林的保健功能十分突出，有生津利尿，清肝养肝，解郁毒，清湿热的作用。', '2016-05-21 21:46:15', '0', 'products/titles/91463838375402.jpg', '0', '1');
INSERT INTO t_products VALUES ('10', '4', '黑猪后上肉', '26', '5', '斤', '肉类含蛋白质丰富，一般在10-20%之间。瘦肉比肥肉含蛋白质多。肉类食品含蛋白质是优质蛋白质，不仅含有的必需氮基酸全面、数量多，而且比例恰当，接近于人体的蛋白质，容易消化吸收。肉类中脂肪含量平均在10-30%左右，主要是各种脂肪酸和甘油三脂。还有少量卵磷脂、胆固醇、游离脂肪酸及脂溶性色素。肉类脂肪可提供较多的热量，如100克肥猪肉可提供热量830千卡。', '2016-05-21 21:48:39', '0', 'products/titles/101463838519405.jpg', '0', '1');
INSERT INTO t_products VALUES ('11', '4', '黑猪前排骨', '24', '5', '斤', '猪排骨提供人体生理活动必需的优质蛋白质、脂肪，尤其是丰富的钙质可维护骨骼健康。', '2016-05-21 21:50:21', '0', 'products/titles/111463838621934.jpg', '0', '1');
INSERT INTO t_products VALUES ('12', '4', '黑猪前上肉', '23', '5', '斤', '肉类含蛋白质丰富，一般在10-20%之间。瘦肉比肥肉含蛋白质多。肉类食品含蛋白质是优质蛋白质，不仅含有的必需氮基酸全面、数量多，而且比例恰当，接近于人体的蛋白质，容易消化吸收。肉类中脂肪含量平均在10-30%左右，主要是各种脂肪酸和甘油三脂。还有少量卵磷脂、胆固醇、游离脂肪酸及脂溶性色素。肉类脂肪可提供较多的热量，如100克肥猪肉可提供热量830千卡。', '2016-05-21 21:51:29', '0', 'products/titles/121463838689587.jpg', '0', '1');
INSERT INTO t_products VALUES ('13', '4', '黑猪瘦肉', '23', '2', '斤', '黑猪肉肉质细腻且营养价值丰富。肌肉中的不饱和脂肪酸的含量为8.87%，特别是亚麻酸能保护肝脏，能提高人体免疫能力，同时还可以改善人体内SOD的活性，抑制MDA的生成，延缓机体衰老，细胞老化，含量显著高于其他猪种，对人体有极高的营养价值及保健作用，如长期食用可延年益寿，并有着汤汁浓郁，绕齿留香。姜家黑猪肌肉内的肉品鲜味主要特征氨基酸天门冬氨酸、谷氨酸、甘氨酸、丙氨酸和肌苷酸的总含量明显高于洋猪，烹饪调出的汤汁浓郁，口留余香，对人体有着较大的辅助功能。', '2016-05-21 21:52:39', '0', 'products/titles/131463838759751.jpg', '0', '1');
INSERT INTO t_products VALUES ('14', '1', '花菜', '4', '2', '斤', '菜花的营养比一般蔬菜丰富。它含有蛋白质、脂肪、碳水化合物、食物纤维、维生素A、B、C、E、P、U和钙、磷、铁等矿物质。菜花质地细嫩，味甘鲜美，食后极易消化吸收，其嫩茎纤维，烹炒后柔嫩可口，适宜于中老年人、小孩和脾胃虚弱、消化功能不强者食用。尤其在暑热之际，口干渴、小便呈金黄色，大便硬实或不畅通时，用菜花30克煎汤，频频饮服，有清热解渴，利尿通便之功效。', '2016-05-21 21:54:40', '0', 'products/titles/141463838880795.jpg', '0', '1');
INSERT INTO t_products VALUES ('15', '1', '黄秋葵', '6', '2', '斤', '秋葵中富含的锌和硒等微量元素，对增强人体防癌抗癌能力很有帮助。主要有利咽、通淋、下乳、调经等功效。[5]  还可治疗咽喉肿痛、小便淋涩、预防糖尿病、预防癌症、保护胃黏膜。', '2016-05-21 21:55:58', '0', 'products/titles/151463838958490.jpg', '0', '1');
INSERT INTO t_products VALUES ('16', '2', '进口香蕉', '6', '2', '斤', '香蕉是淀粉质丰富的有益水果。味甘性寒，可清热润肠，促进肠胃蠕动，但脾虚泄泻者却不宜。根据“热者寒之”的原理，最适合燥热人士享用。痔疮出血者、因燥热而致胎动不安者，都可生吃蕉。', '2016-05-21 21:58:14', '0', 'products/titles/161463839094626.jpg', '0', '1');
INSERT INTO t_products VALUES ('17', '4', '肋骨', '23', '2', '斤', '猪排骨提供人体生理活动必需的优质蛋白质、脂肪，尤其是丰富的钙质可维护骨骼健康。猪排骨具有滋阴润燥、益精补血的功效；适宜于气血不足，阴虚纳差者；湿热痰滞内蕴者慎服；肥胖、血脂较高者不宜多食。猪肉烹调前莫用热水清洗，因猪肉中含有一种肌溶蛋白的物质，在15摄氏度以上的水中易溶解，若用热水浸泡就会散失很多营养，同时口味也欠佳；猪肉应煮熟，因为猪肉中有时会有寄生虫，如果生吃或调理不完全时，可能会在肝脏或脑部寄生有钩绦虫。', '2016-05-21 22:01:14', '0', 'products/titles/171463839274325.jpg', '0', '1');
INSERT INTO t_products VALUES ('18', '1', '奶白菜苗', '4.5', '3', '斤', '奶白菜具有清热除火、解毒、亮发、提高免疫力、明目、健脾、和胃、润肠、壮骨、养颜护肤、养阴补虚、抗衰抗辐射等功效。', '2016-05-21 22:02:45', '0', 'products/titles/181463839365230.jpg', '0', '1');
INSERT INTO t_products VALUES ('19', '3', '牛腩块', '23', '6', '斤', '1.牛腩提供高质量的蛋白质，含有全部种类的氨基酸，各种氨基酸的比例与人体蛋白质中各种氨基酸的比例基本一致，其中所含的肌氨酸比任何食物都高。2.牛腩的脂肪含量很低，但它却是低脂的亚油酸的来源，还是潜在的抗氧化剂。3.牛腩含有矿物质和维他命B群，包括烟酸，维生素B1和核黄素。牛肉还是每天所需要的铁质的最佳来源。4.牛腩还含肉毒碱。', '2016-05-21 22:04:06', '0', 'products/titles/191463839446295.jpg', '0', '1');
INSERT INTO t_products VALUES ('20', '3', '牛肉压块', '26', '2', '斤', '牛肉中的肌氨酸含量比任何其它食品都高，它对增长肌肉、增强力量特别有效。在进行训练的头几秒钟里，肌氨酸是肌肉燃料之源，有效补充三磷酸腺苷，使训练能坚持得更久。', '2016-05-21 22:06:01', '0', 'products/titles/201463839561144.jpg', '0', '1');
INSERT INTO t_products VALUES ('21', '2', '牛油果', '23', '10', '斤', '油梨果肉营养丰富，每100克果肉含脂肪23.49克，糖分5.6克，蛋白质1.25克，纤维1.8克，灰分0.7克，维生素C8毫克，是一种高热能水果，营养价值与奶油相当。果核，果皮，叶子中含有一种心血管毒素Persin，是一种自然真菌毒素，对成人无明显毒害（儿童和宠物有毒性），欧洲、美国、日本等国家将其视为果类珍品。', '2016-05-21 22:07:43', '0', 'products/titles/211463839663772.jpg', '0', '1');
INSERT INTO t_products VALUES ('22', '2', '圣女果', '4', '2', '斤', '圣女果具有生津止渴、健胃消食、清热解毒、凉血平肝，补血养血和增进食欲的功效。可治口渴，食欲不振。', '2016-05-21 22:09:46', '0', 'products/titles/221463839786800.jpg', '0', '1');
INSERT INTO t_products VALUES ('23', '4', '特级排骨', '26', '3', '斤', '排骨有很高的营养价值，排骨味甘咸、性平，入脾、胃、肾经；补肾养血，滋阴润燥；主治热病伤津、消渴羸瘦、肾虚体弱、产后血虚、燥咳、便秘、补虚、滋阴、润燥、滋肝阴，润肌肤，利二便和止消渴。', '2016-05-21 22:11:04', '0', 'products/titles/231463839864303.jpg', '0', '1');
INSERT INTO t_products VALUES ('24', '4', '特级五花肉', '26', '5', '斤', '肉类含蛋白质丰富，一般在10-20%之间。瘦肉比肥肉含蛋白质多。肉类食品含蛋白质是优质蛋白质，不仅含有的必需氮基酸全面、数量多，而且比例恰当，接近于人体的蛋白质，容易消化吸收。[2] \r\n肉类中脂肪含量平均在10-30%左右，主要是各种脂肪酸和甘油三脂。还有少量卵磷脂、胆固醇、游离脂肪酸及脂溶性色素。肉类脂肪可提供较多的热量，如100克肥猪肉可提供热量830千卡。', '2016-05-21 22:12:51', '0', 'products/titles/241463839971678.jpg', '0', '1');
INSERT INTO t_products VALUES ('25', '4', '土猪花肉', '18', '3', '斤', '壹号土猪肉香味美，营养丰富，蛋白质含量14.2%，脂肪含量28%，是目前市场上营养价值最高、质量最好的猪肉产品。2008年1月，在中国金猪比赛中，壹号土猪获得广州地区烹饪协会颁发的“最佳肉质奖”和“最佳风味奖”。2009年1月，壹号土猪分别获得无公害产地和无公害产品认证，是广东省唯一一家被农业部核准的无公害土猪。', '2016-05-21 22:15:23', '0', 'products/titles/251463840123659.jpg', '0', '1');
INSERT INTO t_products VALUES ('26', '4', '土猪瘦肉', '23', '2', '斤', '各种瘦肉所含营养成分相近且较肥肉易于消化。约含蛋白质20%，脂肪1－15%，无机盐1%，其余水分。一般来说，猪肉、牛肉、羊肉都含饱和脂肪较高，禽肉、鸡及兔肉中含饱和脂肪较少。 同时含无机盐丰富,尤以含铁（红色瘦肉）、磷、钾、钠等较多,唯含钙较少。瘦肉也是维生素B1、B2、B12、PP的良好来源，瘦猪肉中的维生素B1含量相当高，不过，含维生素A却很少，几乎不含维生素C。', '2016-05-21 22:16:59', '0', 'products/titles/261463840219176.jpg', '0', '1');
INSERT INTO t_products VALUES ('27', '1', '无公害菜心', '5', '2', '斤', '菜心在中国江南地区为食用习惯极广的大路蔬菜。在中国北方地区生产面积很小，消费量也很小，属稀特蔬菜行列。菜心在北方发展不起来，估计有如下原因：春夏季为菜心栽培适期，可是北方人喜食果菜类蔬菜。此时正值果菜上市期，黄瓜、番茄、茄子等蔬菜把菜心挤出了市场；秋季大白菜的产量高、栽培容易、群众喜食是菜心无法比拟的，菜心自然不可能取代大白菜而大量栽培；菜心在江南有冬季持续生长、陆续采收供应上市的优势，这一优势在北方受严寒的限制发挥不出来。', '2016-05-21 22:18:40', '0', 'products/titles/271463840320934.jpg', '0', '1');
INSERT INTO t_products VALUES ('28', '1', '无公害芥兰', '6', '2', '斤', '芥蓝中另一种独特的苦味成分是金鸡纳霜，能抑制过度兴奋的体温中枢，起到消暑解热作用。它还含有大量膳食纤维，能防止便秘。降低胆固醇，软化血管，预防心脏病等功效。有利水化痰、解毒祛风、消暑解热、解劳乏、清心明目等功效，能润肠祛热气、下虚火、止牙龈出血，对肠胃热重、熬夜失眠、虚火上升、牙龈肿胀出血等也有辅助治疗效果。', '2016-05-21 22:19:53', '0', 'products/titles/281463840393411.jpg', '0', '1');
INSERT INTO t_products VALUES ('29', '1', '无公害青瓜', '6', '2', '斤', '黄瓜富含蛋白质、糖类、维生素B2、维生素C、维生素E、胡萝卜素、尼克酸、钙、磷、铁等营养成分。另外，黄瓜还可美容：黄瓜平和除湿，可以收敛和消除皮肤皱纹，对皮肤较黑的人效果尤佳。', '2016-05-21 22:21:12', '0', 'products/titles/291463840472565.jpg', '0', '1');
INSERT INTO t_products VALUES ('30', '1', '无公害甜玉米', '4', '2', '斤', '德国营养保健协会的研究表明，在所有主食中，玉米的营养价值和保健作用最高。玉米含有7种“抗衰剂”即钙、谷胱甘肽、维生素、镁、硒、维生素E和脂肪酸。', '2016-05-21 22:22:19', '0', 'products/titles/301463840539472.jpg', '0', '1');
INSERT INTO t_products VALUES ('31', '4', '无骨小排', '29', '2', '斤', '排骨有很高的营养价值，排骨味甘咸、性平，入脾、胃、肾经；补肾养血，滋阴润燥；主治热病伤津、消渴羸瘦、肾虚体弱、产后血虚、燥咳、便秘、补虚、滋阴、润燥、滋肝阴，润肌肤，利二便和止消渴。', '2016-05-21 22:23:50', '0', 'products/titles/311463840630816.jpg', '0', '0');
INSERT INTO t_products VALUES ('32', '4', '五丰屯黑猪五花肉', '30', '2', '斤', '肉类含蛋白质丰富，一般在10-20%之间。瘦肉比肥肉含蛋白质多。肉类食品含蛋白质是优质蛋白质，不仅含有的必需氮基酸全面、数量多，而且比例恰当，接近于人体的蛋白质，容易消化吸收。\r\n肉类中脂肪含量平均在10-30%左右，主要是各种脂肪酸和甘油三脂。还有少量卵磷脂、胆固醇、游离脂肪酸及脂溶性色素。肉类脂肪可提供较多的热量，如100克肥猪肉可提供热量830千卡。', '2016-05-21 22:25:18', '0', 'products/titles/321463840718122.jpg', '0', '1');
INSERT INTO t_products VALUES ('33', '2', '新疆香梨', '23', '2', '斤', '1. 梨性寒凉，一次不要吃得过多；\r\n2. 脾胃虚弱的人不宜吃生梨，可把梨切块煮水食用；\r\n3. 吃梨时喝热水、食油腻食品会导致腹泻；\r\n4. 梨可清喉降火，播音、演唱人员经常食用煮好的熟梨，能增加口中的津液，起到保养嗓子的作用。', '2016-05-21 22:26:54', '0', 'products/titles/331463840814347.jpg', '0', '1');
INSERT INTO t_products VALUES ('34', '3', '新疆羊肉串', '36', '2', '斤', '1.羊肉性温，冬季常吃羊肉，不仅可以增加人体热量，抵御寒冷，而且还能增加消化酶，保护胃壁，修复胃粘膜，帮助脾胃消化，起到抗衰老的作用；\r\n2.羊肉营养丰富，对肺结核、气管炎、哮喘、贫血、产后气血两虚、腹部冷痛、体虚畏寒、营养不良、腰膝酸软、阳痿早泄以及一切虚寒病症均有很大裨益；具有补肾壮阳、补虚温中等作用，男士适合经常食用。', '2016-05-21 22:28:20', '0', 'products/titles/341463840900677.jpg', '0', '1');
INSERT INTO t_products VALUES ('35', '3', '眼肉', '23', '2', '斤', '也指牛背上两侧前面的部位肉。属高档部位肉，经精细分割后，外观呈四方圆弧状，每块平均重量为3-5kg，肉质红白镶嵌，呈大理石花斑纹状。 选牛脊背第七根至第十根肋骨之间的肉,此肉形如眼状,也称为眼肉 ，眼肉肉质细嫩，脂肪含量较高，吃起来的口感比较香甜多汁，不干涩。', '2016-05-21 22:32:23', '0', 'products/titles/351463841143230.jpg', '0', '1');
INSERT INTO t_products VALUES ('36', '2', '柚子', '16', '2', '斤', '柚子含有糖类、维生素B1、维生素B2、维生素C、维生素P、胡萝卜素、钾、磷、枸橼酸等。柚皮主要成分有柚皮甙、新橙皮甙等，柚核含有脂肪油、黄柏酮、黄柏内酯等。柚子营养丰富，每100克可食部分，含水分84.8克、蛋白质0.7克、脂肪0.6克、碳水化合物12.2克、热量57千卡、粗纤维0.8克、钙41毫克、磷43毫克、铁0.9毫克、胡萝卜素0.12毫克、硫酸素0.07毫克、核黄素0.02毫克、尼克酸0.5毫克、抗坏血酸41毫克。', '2016-05-21 22:34:47', '0', 'products/titles/361463841287850.jpg', '0', '0');
INSERT INTO t_products VALUES ('37', '2', '越南红肉火龙果', '26', '2', '斤', '火龙果性甘平，主要营养成分有蛋白质、膳食纤维、维生素B2、维生素B3、维生素C、铁、磷、钙、镁、钾等。富含大量果肉纤维，有丰富的胡萝卜素，维他命B1、B2、B3、B12、C等，果核内 (黑色芝麻之种子) 更含有丰富的钙、磷、铁等矿物质及各种酶、白蛋白、纤维质及高浓度天然色素花青素(尤以红肉为最)，花、茎及嫩芽更有如其近亲 (芦荟) 之各种功效。值得注意的是火龙果的果肉几乎不含果糖和蔗糖，糖分以葡萄糖为主，这种天然葡萄糖，容易吸收，适合运动后食用。在吃火龙果时，可以用小刀刮下内层的紫色果皮——他们可以生吃，也可以凉拌或者像霸王花一样放入汤里。', '2016-05-21 22:37:09', '0', 'products/titles/371463841429968.jpg', '0', '1');
INSERT INTO t_products VALUES ('38', '2', '越南火龙果', '20', '2', '斤', '火龙果性甘平，主要营养成分有蛋白质、膳食纤维、维生素B2、维生素B3、维生素C、铁、磷、钙、镁、钾等。富含大量果肉纤维，有丰富的胡萝卜素，维他命B1、B2、B3、B12、C等，果核内 (黑色芝麻之种子) 更含有丰富的钙、磷、铁等矿物质及各种酶、白蛋白、纤维质及高浓度天然色素花青素(尤以红肉为最)，花、茎及嫩芽更有如其近亲 (芦荟) 之各种功效。值得注意的是火龙果的果肉几乎不含果糖和蔗糖，糖分以葡萄糖为主，这种天然葡萄糖，容易吸收，适合运动后食用。在吃火龙果时，可以用小刀刮下内层的紫色果皮——他们可以生吃，也可以凉拌或者像霸王花一样放入汤里。', '2016-05-21 22:37:57', '0', 'products/titles/381463841477158.jpg', '0', '1');
INSERT INTO t_products VALUES ('39', '1', '正宗甜玉米', '12', '2', '斤', '德国营养保健协会的研究表明，在所有主食中，玉米的营养价值和保健作用最高。玉米含有7种“抗衰剂”即钙、谷胱甘肽、维生素、镁、硒、维生素E和脂肪酸。', '2016-05-21 22:39:10', '0', 'products/titles/391463841550076.jpg', '0', '1');
INSERT INTO t_products VALUES ('40', '3', '猪肉馅', '23', '2', '斤', '营养价值 在畜肉中，猪肉的蛋白质含量最低，脂肪含量最高。瘦猪肉含蛋白质较高，每100克可含高达29克的蛋白质，含脂肪6克。经煮炖后，猪肉的脂肪含量还会降低。猪肉还含有丰富的维生素B．，可以使身体感到更有力气。猪肉还能提供人体必需的脂肪酸。猪肉性味甘成，滋阴润燥，可提供血红素（有机铁）和促进铁吸收的半胱氨酸，能改善缺铁性贫血。猪排滋阴，猪肚补虚损、健脾胃。', '2016-05-21 22:40:25', '0', 'products/titles/401463841625048.jpg', '0', '1');

-- ----------------------------
-- Table structure for `t_pshows`
-- ----------------------------
DROP TABLE IF EXISTS `t_pshows`;
CREATE TABLE `t_pshows` (
  `sid` int(11) NOT NULL AUTO_INCREMENT,
  `pspath` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  PRIMARY KEY (`sid`),
  KEY `FK791C9CD1D0D8C772` (`pid`),
  CONSTRAINT `FK791C9CD1D0D8C772` FOREIGN KEY (`pid`) REFERENCES `t_products` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=189 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of t_pshows
-- ----------------------------
INSERT INTO t_pshows VALUES ('1', 'products/shows/11463821572628.jpg', '1');
INSERT INTO t_pshows VALUES ('2', 'products/shows/21463821572676.jpg', '1');
INSERT INTO t_pshows VALUES ('3', 'products/shows/31463821572729.jpg', '1');
INSERT INTO t_pshows VALUES ('4', 'products/shows/41463821572771.jpg', '1');
INSERT INTO t_pshows VALUES ('5', 'products/shows/51463837476818.jpg', '2');
INSERT INTO t_pshows VALUES ('6', 'products/shows/61463837476872.jpg', '2');
INSERT INTO t_pshows VALUES ('7', 'products/shows/71463837476917.jpg', '2');
INSERT INTO t_pshows VALUES ('8', 'products/shows/81463837476961.jpg', '2');
INSERT INTO t_pshows VALUES ('9', 'products/shows/91463837477007.jpg', '2');
INSERT INTO t_pshows VALUES ('10', 'products/shows/101463837586984.jpg', '3');
INSERT INTO t_pshows VALUES ('11', 'products/shows/111463837587030.jpg', '3');
INSERT INTO t_pshows VALUES ('12', 'products/shows/121463837587073.jpg', '3');
INSERT INTO t_pshows VALUES ('13', 'products/shows/131463837587127.jpg', '3');
INSERT INTO t_pshows VALUES ('14', 'products/shows/141463837587193.jpg', '3');
INSERT INTO t_pshows VALUES ('15', 'products/shows/151463837679514.png', '4');
INSERT INTO t_pshows VALUES ('16', 'products/shows/161463837679558.jpg', '4');
INSERT INTO t_pshows VALUES ('17', 'products/shows/171463837679606.jpg', '4');
INSERT INTO t_pshows VALUES ('18', 'products/shows/181463837679650.jpg', '4');
INSERT INTO t_pshows VALUES ('19', 'products/shows/191463837679695.jpg', '4');
INSERT INTO t_pshows VALUES ('20', 'products/shows/201463837741903.jpg', '5');
INSERT INTO t_pshows VALUES ('21', 'products/shows/211463837741946.jpg', '5');
INSERT INTO t_pshows VALUES ('22', 'products/shows/221463837741991.jpg', '5');
INSERT INTO t_pshows VALUES ('23', 'products/shows/231463837742036.jpg', '5');
INSERT INTO t_pshows VALUES ('24', 'products/shows/241463837742082.jpg', '5');
INSERT INTO t_pshows VALUES ('25', 'products/shows/251463837852671.jpg', '6');
INSERT INTO t_pshows VALUES ('26', 'products/shows/261463837852726.png', '6');
INSERT INTO t_pshows VALUES ('27', 'products/shows/271463837852758.jpg', '6');
INSERT INTO t_pshows VALUES ('28', 'products/shows/281463837852804.jpg', '6');
INSERT INTO t_pshows VALUES ('29', 'products/shows/291463837852849.jpg', '6');
INSERT INTO t_pshows VALUES ('30', 'products/shows/301463837852894.jpg', '6');
INSERT INTO t_pshows VALUES ('31', 'products/shows/311463838086423.jpg', '7');
INSERT INTO t_pshows VALUES ('32', 'products/shows/321463838086468.jpg', '7');
INSERT INTO t_pshows VALUES ('33', 'products/shows/331463838086511.jpg', '7');
INSERT INTO t_pshows VALUES ('34', 'products/shows/341463838086556.jpg', '7');
INSERT INTO t_pshows VALUES ('35', 'products/shows/351463838086600.jpg', '7');
INSERT INTO t_pshows VALUES ('36', 'products/shows/361463838208096.jpg', '8');
INSERT INTO t_pshows VALUES ('37', 'products/shows/371463838208139.jpg', '8');
INSERT INTO t_pshows VALUES ('38', 'products/shows/381463838208189.jpg', '8');
INSERT INTO t_pshows VALUES ('39', 'products/shows/391463838208242.jpg', '8');
INSERT INTO t_pshows VALUES ('40', 'products/shows/401463838208299.jpg', '8');
INSERT INTO t_pshows VALUES ('41', 'products/shows/411463838375521.jpg', '9');
INSERT INTO t_pshows VALUES ('42', 'products/shows/421463838375586.jpg', '9');
INSERT INTO t_pshows VALUES ('43', 'products/shows/431463838375649.jpg', '9');
INSERT INTO t_pshows VALUES ('44', 'products/shows/441463838375715.jpg', '9');
INSERT INTO t_pshows VALUES ('45', 'products/shows/451463838376005.jpg', '9');
INSERT INTO t_pshows VALUES ('46', 'products/shows/461463838519482.jpg', '10');
INSERT INTO t_pshows VALUES ('47', 'products/shows/471463838519522.jpg', '10');
INSERT INTO t_pshows VALUES ('48', 'products/shows/481463838519566.jpg', '10');
INSERT INTO t_pshows VALUES ('49', 'products/shows/491463838519611.jpg', '10');
INSERT INTO t_pshows VALUES ('50', 'products/shows/501463838519658.jpg', '10');
INSERT INTO t_pshows VALUES ('51', 'products/shows/511463838622002.jpg', '11');
INSERT INTO t_pshows VALUES ('52', 'products/shows/521463838622047.jpg', '11');
INSERT INTO t_pshows VALUES ('53', 'products/shows/531463838622091.jpg', '11');
INSERT INTO t_pshows VALUES ('54', 'products/shows/541463838622125.jpg', '11');
INSERT INTO t_pshows VALUES ('55', 'products/shows/551463838622169.jpg', '11');
INSERT INTO t_pshows VALUES ('56', 'products/shows/561463838689803.jpg', '12');
INSERT INTO t_pshows VALUES ('57', 'products/shows/571463838690091.jpg', '12');
INSERT INTO t_pshows VALUES ('58', 'products/shows/581463838690156.jpg', '12');
INSERT INTO t_pshows VALUES ('59', 'products/shows/591463838690202.jpg', '12');
INSERT INTO t_pshows VALUES ('60', 'products/shows/601463838690248.jpg', '12');
INSERT INTO t_pshows VALUES ('61', 'products/shows/611463838759902.jpg', '13');
INSERT INTO t_pshows VALUES ('62', 'products/shows/621463838759948.jpg', '13');
INSERT INTO t_pshows VALUES ('63', 'products/shows/631463838759993.jpg', '13');
INSERT INTO t_pshows VALUES ('64', 'products/shows/641463838760038.jpg', '13');
INSERT INTO t_pshows VALUES ('65', 'products/shows/651463838760082.jpg', '13');
INSERT INTO t_pshows VALUES ('66', 'products/shows/661463838880850.jpg', '14');
INSERT INTO t_pshows VALUES ('67', 'products/shows/671463838880893.jpg', '14');
INSERT INTO t_pshows VALUES ('68', 'products/shows/681463838880938.jpg', '14');
INSERT INTO t_pshows VALUES ('69', 'products/shows/691463838880982.jpg', '14');
INSERT INTO t_pshows VALUES ('70', 'products/shows/701463838958620.jpg', '15');
INSERT INTO t_pshows VALUES ('71', 'products/shows/711463838958697.jpg', '15');
INSERT INTO t_pshows VALUES ('72', 'products/shows/721463838958752.jpg', '15');
INSERT INTO t_pshows VALUES ('73', 'products/shows/731463838958814.jpg', '15');
INSERT INTO t_pshows VALUES ('74', 'products/shows/741463839094677.jpg', '16');
INSERT INTO t_pshows VALUES ('75', 'products/shows/751463839094754.jpg', '16');
INSERT INTO t_pshows VALUES ('76', 'products/shows/761463839094798.jpg', '16');
INSERT INTO t_pshows VALUES ('77', 'products/shows/771463839274379.jpg', '17');
INSERT INTO t_pshows VALUES ('78', 'products/shows/781463839274438.jpg', '17');
INSERT INTO t_pshows VALUES ('79', 'products/shows/791463839274483.jpg', '17');
INSERT INTO t_pshows VALUES ('80', 'products/shows/801463839274525.jpg', '17');
INSERT INTO t_pshows VALUES ('81', 'products/shows/811463839274567.jpg', '17');
INSERT INTO t_pshows VALUES ('82', 'products/shows/821463839365336.jpg', '18');
INSERT INTO t_pshows VALUES ('83', 'products/shows/831463839365402.jpg', '18');
INSERT INTO t_pshows VALUES ('84', 'products/shows/841463839365446.jpg', '18');
INSERT INTO t_pshows VALUES ('85', 'products/shows/851463839365491.jpg', '18');
INSERT INTO t_pshows VALUES ('86', 'products/shows/861463839446348.jpg', '19');
INSERT INTO t_pshows VALUES ('87', 'products/shows/871463839446393.jpg', '19');
INSERT INTO t_pshows VALUES ('88', 'products/shows/881463839446448.jpg', '19');
INSERT INTO t_pshows VALUES ('89', 'products/shows/891463839446493.jpg', '19');
INSERT INTO t_pshows VALUES ('90', 'products/shows/901463839446537.jpg', '19');
INSERT INTO t_pshows VALUES ('91', 'products/shows/911463839561210.jpg', '20');
INSERT INTO t_pshows VALUES ('92', 'products/shows/921463839561263.jpg', '20');
INSERT INTO t_pshows VALUES ('93', 'products/shows/931463839561308.jpg', '20');
INSERT INTO t_pshows VALUES ('94', 'products/shows/941463839561352.jpg', '20');
INSERT INTO t_pshows VALUES ('95', 'products/shows/951463839561452.jpg', '20');
INSERT INTO t_pshows VALUES ('96', 'products/shows/961463839664009.jpg', '21');
INSERT INTO t_pshows VALUES ('97', 'products/shows/971463839664068.jpg', '21');
INSERT INTO t_pshows VALUES ('98', 'products/shows/981463839664129.jpg', '21');
INSERT INTO t_pshows VALUES ('99', 'products/shows/991463839664194.jpg', '21');
INSERT INTO t_pshows VALUES ('100', 'products/shows/1001463839664240.jpg', '21');
INSERT INTO t_pshows VALUES ('101', 'products/shows/1011463839786854.jpg', '22');
INSERT INTO t_pshows VALUES ('102', 'products/shows/1021463839786897.jpg', '22');
INSERT INTO t_pshows VALUES ('103', 'products/shows/1031463839786942.jpg', '22');
INSERT INTO t_pshows VALUES ('104', 'products/shows/1041463839786988.jpg', '22');
INSERT INTO t_pshows VALUES ('105', 'products/shows/1051463839787030.jpg', '22');
INSERT INTO t_pshows VALUES ('106', 'products/shows/1061463839864380.jpg', '23');
INSERT INTO t_pshows VALUES ('107', 'products/shows/1071463839864426.jpg', '23');
INSERT INTO t_pshows VALUES ('108', 'products/shows/1081463839864468.jpg', '23');
INSERT INTO t_pshows VALUES ('109', 'products/shows/1091463839864514.jpg', '23');
INSERT INTO t_pshows VALUES ('110', 'products/shows/1101463839864585.jpg', '23');
INSERT INTO t_pshows VALUES ('111', 'products/shows/1111463839971746.jpg', '24');
INSERT INTO t_pshows VALUES ('112', 'products/shows/1121463839972037.jpg', '24');
INSERT INTO t_pshows VALUES ('113', 'products/shows/1131463839972108.jpg', '24');
INSERT INTO t_pshows VALUES ('114', 'products/shows/1141463839972156.jpg', '24');
INSERT INTO t_pshows VALUES ('115', 'products/shows/1151463840123727.jpg', '25');
INSERT INTO t_pshows VALUES ('116', 'products/shows/1161463840123976.jpg', '25');
INSERT INTO t_pshows VALUES ('117', 'products/shows/1171463840124058.jpg', '25');
INSERT INTO t_pshows VALUES ('118', 'products/shows/1181463840124120.jpg', '25');
INSERT INTO t_pshows VALUES ('119', 'products/shows/1191463840124188.jpg', '25');
INSERT INTO t_pshows VALUES ('120', 'products/shows/1201463840219239.jpg', '26');
INSERT INTO t_pshows VALUES ('121', 'products/shows/1211463840219295.jpg', '26');
INSERT INTO t_pshows VALUES ('122', 'products/shows/1221463840219350.jpg', '26');
INSERT INTO t_pshows VALUES ('123', 'products/shows/1231463840219406.jpg', '26');
INSERT INTO t_pshows VALUES ('124', 'products/shows/1241463840219461.jpg', '26');
INSERT INTO t_pshows VALUES ('125', 'products/shows/1251463840320997.jpg', '27');
INSERT INTO t_pshows VALUES ('126', 'products/shows/1261463840321054.jpg', '27');
INSERT INTO t_pshows VALUES ('127', 'products/shows/1271463840321107.jpg', '27');
INSERT INTO t_pshows VALUES ('128', 'products/shows/1281463840321163.jpg', '27');
INSERT INTO t_pshows VALUES ('129', 'products/shows/1291463840321224.jpg', '27');
INSERT INTO t_pshows VALUES ('130', 'products/shows/1301463840393474.jpg', '28');
INSERT INTO t_pshows VALUES ('131', 'products/shows/1311463840393530.jpg', '28');
INSERT INTO t_pshows VALUES ('132', 'products/shows/1321463840393586.jpg', '28');
INSERT INTO t_pshows VALUES ('133', 'products/shows/1331463840393641.jpg', '28');
INSERT INTO t_pshows VALUES ('134', 'products/shows/1341463840393700.jpg', '28');
INSERT INTO t_pshows VALUES ('135', 'products/shows/1351463840472628.jpg', '29');
INSERT INTO t_pshows VALUES ('136', 'products/shows/1361463840472684.jpg', '29');
INSERT INTO t_pshows VALUES ('137', 'products/shows/1371463840472735.jpg', '29');
INSERT INTO t_pshows VALUES ('138', 'products/shows/1381463840472780.jpg', '29');
INSERT INTO t_pshows VALUES ('139', 'products/shows/1391463840539547.jpg', '30');
INSERT INTO t_pshows VALUES ('140', 'products/shows/1401463840539590.jpg', '30');
INSERT INTO t_pshows VALUES ('141', 'products/shows/1411463840539632.jpg', '30');
INSERT INTO t_pshows VALUES ('142', 'products/shows/1421463840539679.jpg', '30');
INSERT INTO t_pshows VALUES ('143', 'products/shows/1431463840630880.jpg', '31');
INSERT INTO t_pshows VALUES ('144', 'products/shows/1441463840630926.jpg', '31');
INSERT INTO t_pshows VALUES ('145', 'products/shows/1451463840630990.jpg', '31');
INSERT INTO t_pshows VALUES ('146', 'products/shows/1461463840631048.jpg', '31');
INSERT INTO t_pshows VALUES ('147', 'products/shows/1471463840631092.jpg', '31');
INSERT INTO t_pshows VALUES ('148', 'products/shows/1481463840718191.jpg', '32');
INSERT INTO t_pshows VALUES ('149', 'products/shows/1491463840718246.jpg', '32');
INSERT INTO t_pshows VALUES ('150', 'products/shows/1501463840718302.jpg', '32');
INSERT INTO t_pshows VALUES ('151', 'products/shows/1511463840718358.jpg', '32');
INSERT INTO t_pshows VALUES ('152', 'products/shows/1521463840718413.jpg', '32');
INSERT INTO t_pshows VALUES ('153', 'products/shows/1531463840814421.jpg', '33');
INSERT INTO t_pshows VALUES ('154', 'products/shows/1541463840814541.jpg', '33');
INSERT INTO t_pshows VALUES ('155', 'products/shows/1551463840814714.jpg', '33');
INSERT INTO t_pshows VALUES ('156', 'products/shows/1561463840814782.jpg', '33');
INSERT INTO t_pshows VALUES ('157', 'products/shows/1571463840814836.jpg', '33');
INSERT INTO t_pshows VALUES ('158', 'products/shows/1581463840900761.jpg', '34');
INSERT INTO t_pshows VALUES ('159', 'products/shows/1591463840900804.jpg', '34');
INSERT INTO t_pshows VALUES ('160', 'products/shows/1601463840900849.jpg', '34');
INSERT INTO t_pshows VALUES ('161', 'products/shows/1611463840900893.jpg', '34');
INSERT INTO t_pshows VALUES ('162', 'products/shows/1621463840900938.jpg', '34');
INSERT INTO t_pshows VALUES ('163', 'products/shows/1631463841143306.jpg', '35');
INSERT INTO t_pshows VALUES ('164', 'products/shows/1641463841143366.jpg', '35');
INSERT INTO t_pshows VALUES ('165', 'products/shows/1651463841143422.jpg', '35');
INSERT INTO t_pshows VALUES ('166', 'products/shows/1661463841143477.jpg', '35');
INSERT INTO t_pshows VALUES ('167', 'products/shows/1671463841143537.jpg', '35');
INSERT INTO t_pshows VALUES ('168', 'products/shows/1681463841288264.jpg', '36');
INSERT INTO t_pshows VALUES ('169', 'products/shows/1691463841288354.jpg', '36');
INSERT INTO t_pshows VALUES ('170', 'products/shows/1701463841288444.jpg', '36');
INSERT INTO t_pshows VALUES ('171', 'products/shows/1711463841288533.jpg', '36');
INSERT INTO t_pshows VALUES ('172', 'products/shows/1721463841288612.jpg', '36');
INSERT INTO t_pshows VALUES ('173', 'products/shows/1731463841430181.jpg', '37');
INSERT INTO t_pshows VALUES ('174', 'products/shows/1741463841430313.jpg', '37');
INSERT INTO t_pshows VALUES ('175', 'products/shows/1751463841430384.jpg', '37');
INSERT INTO t_pshows VALUES ('176', 'products/shows/1761463841477214.jpg', '38');
INSERT INTO t_pshows VALUES ('177', 'products/shows/1771463841477259.jpg', '38');
INSERT INTO t_pshows VALUES ('178', 'products/shows/1781463841477314.jpg', '38');
INSERT INTO t_pshows VALUES ('179', 'products/shows/1791463841477370.jpg', '38');
INSERT INTO t_pshows VALUES ('180', 'products/shows/1801463841550146.jpg', '39');
INSERT INTO t_pshows VALUES ('181', 'products/shows/1811463841550194.jpg', '39');
INSERT INTO t_pshows VALUES ('182', 'products/shows/1821463841550238.jpg', '39');
INSERT INTO t_pshows VALUES ('183', 'products/shows/1831463841550282.jpg', '39');
INSERT INTO t_pshows VALUES ('184', 'products/shows/1841463841625121.jpg', '40');
INSERT INTO t_pshows VALUES ('185', 'products/shows/1851463841625160.jpg', '40');
INSERT INTO t_pshows VALUES ('186', 'products/shows/1861463841625205.jpg', '40');
INSERT INTO t_pshows VALUES ('187', 'products/shows/1871463841625259.jpg', '40');
INSERT INTO t_pshows VALUES ('188', 'products/shows/1881463841625314.jpg', '40');

-- ----------------------------
-- Table structure for `t_slideimgs`
-- ----------------------------
DROP TABLE IF EXISTS `t_slideimgs`;
CREATE TABLE `t_slideimgs` (
  `sid` int(11) NOT NULL AUTO_INCREMENT,
  `spath` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  `flag` int(11) DEFAULT NULL,
  PRIMARY KEY (`sid`),
  KEY `FKEF725836D0D8C772` (`pid`),
  CONSTRAINT `FKEF725836D0D8C772` FOREIGN KEY (`pid`) REFERENCES `t_products` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of t_slideimgs
-- ----------------------------
INSERT INTO t_slideimgs VALUES ('1', 'images/slideImg/1463837087212.jpg', '1', '1');
INSERT INTO t_slideimgs VALUES ('2', 'images/slideImg/1463837101732.jpg', '1', '1');
INSERT INTO t_slideimgs VALUES ('3', 'images/slideImg/1463837116395.jpg', '1', '1');
INSERT INTO t_slideimgs VALUES ('4', 'images/slideImg/1463837125166.jpg', '1', '1');
INSERT INTO t_slideimgs VALUES ('5', 'images/slideImg/1463837133250.jpg', '1', '1');
INSERT INTO t_slideimgs VALUES ('6', 'images/slideImg/orange.png', '1', '0');
INSERT INTO t_slideimgs VALUES ('7', 'images/slideImg/toothbrush.png', '1', '0');

-- ----------------------------
-- Table structure for `t_users`
-- ----------------------------
DROP TABLE IF EXISTS `t_users`;
CREATE TABLE `t_users` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `realname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gender` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `province` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `regtime` datetime DEFAULT NULL,
  `upath` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pcode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ecode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of t_users
-- ----------------------------
INSERT INTO t_users VALUES ('2', 'admin', 'admin', '严杨鸿', '男', '四川', '2016-03-24 00:00:00', 'images/headImg/headImg.png', '18380448173', null, '875649210@qq.com', null, '1');
INSERT INTO t_users VALUES ('3', '123456', '123456', null, null, null, '2016-03-26 00:00:00', 'images/headImg/headImg.png', null, null, '131648639@qq.com', 'yanyanghong_work@163.com&4efc0eaf2a2649d684ac66e6a7c1107c34d8570324d44207b996212dcc1872a7', '1');
INSERT INTO t_users VALUES ('4', '严fdas去', null, null, null, null, '2016-05-08 03:26:01', 'images/headImg/headImg.png', null, null, '1@qq.com', null, '1');
INSERT INTO t_users VALUES ('5', '杨fdsaf我', null, null, null, null, '2016-05-01 00:00:00', 'images/headImg/headImg.png', null, null, '2@qq.com', null, '1');
INSERT INTO t_users VALUES ('6', '鸿1534fd额', null, null, null, null, '2016-05-12 02:26:14', 'images/headImg/headImg.png', null, null, '3@qq.com', null, '1');
INSERT INTO t_users VALUES ('7', '锦fd5f人', null, null, null, null, '2016-05-21 00:00:00', 'images/headImg/headImg.png', null, null, '4@qq.com', null, '0');
INSERT INTO t_users VALUES ('8', '昱fds54他', null, null, null, null, '2016-05-17 01:26:26', 'images/headImg/headImg.png', null, null, '5@qq.com', null, '1');
INSERT INTO t_users VALUES ('9', '春fdsa4啊', null, null, null, null, '2016-05-01 00:00:00', 'images/headImg/headImg.png', null, null, '6@qq.com', null, '1');
INSERT INTO t_users VALUES ('10', '容hgjh是', null, null, null, null, '2016-05-25 03:26:40', 'images/headImg/headImg.png', null, null, '7@qq.com', null, '0');
INSERT INTO t_users VALUES ('11', '荣trewt的', null, null, null, null, '2016-05-01 00:00:00', 'images/headImg/headImg.png', null, null, '8@qq.com', null, '1');
INSERT INTO t_users VALUES ('12', '祥yrwe飞', null, null, null, null, '2016-05-07 01:26:49', 'images/headImg/headImg.png', null, null, '9@qq.com', null, '1');
INSERT INTO t_users VALUES ('13', '魏qwrre个', null, null, null, null, '2016-05-08 00:00:00', 'images/headImg/headImg.png', null, null, '10@qq.com', null, '0');
INSERT INTO t_users VALUES ('14', '海fdsg在', null, null, null, null, '2016-05-26 03:26:59', 'images/headImg/headImg.png', null, null, '11@qq.com', null, '1');
INSERT INTO t_users VALUES ('15', '燕rwqrw想', null, null, null, null, '2016-05-30 00:00:00', 'images/headImg/headImg.png', null, null, '12@qq.com', null, '1');
INSERT INTO t_users VALUES ('16', '123456', '123456', null, null, null, '2016-04-11 00:00:00', 'images/headImg/headImg.png', null, null, '1131648639@qq.com', null, '1');
INSERT INTO t_users VALUES ('20', '444444', '4444444', '444444', '女', '444444', '2016-05-03 00:00:00', 'images/headImg/headImg.png', '18380448139', null, '444444@qq.com', null, '1');
INSERT INTO t_users VALUES ('21', '2222222', '222222', '222222', '男', '222222', '2016-05-03 00:00:00', 'images/headImg/headImg.png', '18380448139', null, '222222@qq.com', null, '0');
INSERT INTO t_users VALUES ('22', '333333', '333333', '333333', '男', '333333', '2016-05-03 00:00:00', 'images/headImg/headImg.png', '18380448139', null, '333@qq.com', null, '0');
INSERT INTO t_users VALUES ('23', 'fdasfsdaf', '123456', 'fdsaf', '男', 'fdsaf', '2016-05-04 00:00:00', 'images/headImg/headImg.png', '12345678977', null, '123@qq.com', null, '1');
