/*
Navicat MySQL Data Transfer

Source Server         : remote_rms_db
Source Server Version : 50549
Source Host           : 172.20.20.245:3306
Source Database       : rmsdb

Target Server Type    : MYSQL
Target Server Version : 50549
File Encoding         : 65001

Date: 2016-09-18 13:23:42
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for application
-- ----------------------------
DROP TABLE IF EXISTS `application`;
CREATE TABLE `application` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自建主键',
  `rid` int(11) NOT NULL COMMENT '申请资产编号',
  `owner` varchar(255) NOT NULL DEFAULT '' COMMENT '资产当前拥有者',
  `receiver` varchar(255) NOT NULL DEFAULT '' COMMENT '资产获得者',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注信息',
  `time` varchar(255) NOT NULL DEFAULT '' COMMENT '申请时间',
  `type` int(11) NOT NULL DEFAULT '0' COMMENT '申请类型（0：在库资产分配；1：个人资产转移；2：个人资产归还）',
  `flow` int(11) NOT NULL COMMENT '申请流程',
  `step` int(11) NOT NULL DEFAULT '1' COMMENT '申请所处流程步骤（申请创建时位于流程的第一步）',
  `finished` int(11) NOT NULL DEFAULT '0' COMMENT '申请是否处理结束（0：未结束；1：结束）',
  `refused` int(11) NOT NULL DEFAULT '0' COMMENT '申请是否被拒绝（0：未被拒绝，1：被拒绝）',
  PRIMARY KEY (`id`),
  KEY `application_ibfk_1` (`rid`),
  KEY `application_ibfk_2` (`flow`),
  CONSTRAINT `application_ibfk_1` FOREIGN KEY (`rid`) REFERENCES `resource` (`id`),
  CONSTRAINT `application_ibfk_2` FOREIGN KEY (`flow`) REFERENCES `flow` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=160 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of application
-- ----------------------------
INSERT INTO `application` VALUES ('1', '14', 'wangjianjun', 'warehouse', '归还入库', '2016/08/19 14:00:12', '2', '2', '1', '1', '0');
INSERT INTO `application` VALUES ('2', '273', 'warehouse', 'heyunxian', '', '2016/08/22 18:40:20', '0', '1', '2', '1', '0');
INSERT INTO `application` VALUES ('3', '254', 'heyunxian', 'shaoyi', '', '2016/08/22 18:40:54', '1', '3', '1', '1', '0');
INSERT INTO `application` VALUES ('4', '269', 'warehouse', 'wubo', '吴波', '2016/08/22 18:43:15', '0', '1', '2', '1', '0');
INSERT INTO `application` VALUES ('5', '268', 'warehouse', 'daichen', '', '2016/08/22 18:44:18', '0', '1', '2', '1', '0');
INSERT INTO `application` VALUES ('6', '277', 'warehouse', 'libin', '', '2016/08/22 18:45:53', '0', '1', '2', '1', '0');
INSERT INTO `application` VALUES ('7', '15', 'chenyang', 'xuyue', 'test', '2016/08/22 21:56:53', '1', '3', '1', '0', '0');
INSERT INTO `application` VALUES ('8', '15', 'chenyang', 'xuyue', '', '2016/08/22 22:06:47', '1', '3', '1', '0', '0');
INSERT INTO `application` VALUES ('9', '15', 'chenyang', 'wangheng', '热辐射发个第三方公司的故事对方感受的风格受到弗格森的风格山东分公司的搞定胜负个', '2016/08/22 22:24:27', '1', '3', '1', '0', '0');
INSERT INTO `application` VALUES ('10', '15', 'chenyang', 'xuyue', 'test', '2016/08/22 22:25:04', '1', '3', '1', '0', '0');
INSERT INTO `application` VALUES ('11', '15', 'chenyang', 'xuyue', 'test', '2016/08/22 22:25:07', '1', '3', '1', '0', '0');
INSERT INTO `application` VALUES ('12', '15', 'chenyang', 'xuyue', 'test', '2016/08/22 22:25:08', '1', '3', '1', '0', '0');
INSERT INTO `application` VALUES ('13', '15', 'chenyang', 'xuyue', 'test', '2016/08/22 22:25:09', '1', '3', '1', '0', '0');
INSERT INTO `application` VALUES ('14', '14', 'warehouse', 'geminxia', '新版亲见连接测服，申请一个测试手机跟连接正服的亲见做对比测试使用\r\n', '2016/08/23 18:12:02', '0', '1', '2', '1', '0');
INSERT INTO `application` VALUES ('15', '380', 'warehouse', 'zhangzhiliang', '', '2016/08/23 18:14:23', '0', '1', '2', '1', '1');
INSERT INTO `application` VALUES ('16', '379', 'warehouse', 'zhangzhiliang', '', '2016/08/23 18:15:11', '0', '1', '2', '1', '0');
INSERT INTO `application` VALUES ('17', '380', 'warehouse', 'zhangzhiliang', '', '2016/08/23 18:15:30', '0', '1', '2', '1', '1');
INSERT INTO `application` VALUES ('18', '382', 'warehouse', 'zhangzhiliang', '', '2016/08/23 18:15:38', '0', '1', '2', '1', '0');
INSERT INTO `application` VALUES ('19', '392', 'warehouse', 'zhangzhiliang', '', '2016/08/23 18:16:09', '0', '1', '2', '1', '1');
INSERT INTO `application` VALUES ('20', '392', 'warehouse', 'zhangzhiliang', '', '2016/08/23 18:16:19', '0', '1', '2', '1', '1');
INSERT INTO `application` VALUES ('21', '380', 'warehouse', 'zhangzhiliang', '', '2016/08/23 18:16:41', '0', '1', '2', '1', '0');
INSERT INTO `application` VALUES ('22', '383', 'warehouse', 'zhangzhiliang', '', '2016/08/23 18:16:46', '0', '1', '2', '1', '0');
INSERT INTO `application` VALUES ('23', '392', 'warehouse', 'zhangzhiliang', '', '2016/08/23 18:16:54', '0', '1', '2', '1', '0');
INSERT INTO `application` VALUES ('24', '385', 'warehouse', 'zhangzhiliang', '', '2016/08/23 18:17:19', '0', '1', '2', '1', '0');
INSERT INTO `application` VALUES ('25', '38', 'shenxueke', 'jiyue', '', '2016/08/24 11:31:44', '1', '3', '1', '1', '1');
INSERT INTO `application` VALUES ('26', '264', 'warehouse', 'xuyue', 'armstrong', '2016/08/24 12:35:27', '0', '1', '2', '1', '0');
INSERT INTO `application` VALUES ('27', '174', 'wangjianjun', 'warehouse', '坏了，已经归还给学可过了。', '2016/08/25 11:10:20', '2', '2', '1', '1', '1');
INSERT INTO `application` VALUES ('28', '51', 'warehouse', 'geminxia', 'APP团队开发调试测试使用', '2016/08/25 11:13:44', '0', '1', '2', '1', '0');
INSERT INTO `application` VALUES ('29', '214', 'warehouse', 'zhanglin', '调试Game Server', '2016/08/25 16:00:14', '0', '1', '2', '1', '0');
INSERT INTO `application` VALUES ('30', '223', 'wangqu', 'sunfan', '', '2016/08/25 16:22:51', '1', '3', '1', '1', '1');
INSERT INTO `application` VALUES ('31', '223', 'wangqu', 'sunfan', '', '2016/08/25 16:32:27', '1', '3', '1', '1', '1');
INSERT INTO `application` VALUES ('32', '216', 'wangqu', 'sunfan', '', '2016/08/25 16:39:56', '1', '3', '1', '1', '1');
INSERT INTO `application` VALUES ('33', '223', 'wangqu', 'sunfan', '测试RMS邮件系统', '2016/08/25 16:48:57', '1', '3', '1', '1', '1');
INSERT INTO `application` VALUES ('34', '223', 'wangqu', 'warehouse', 'RMS邮件测试', '2016/08/25 17:37:05', '2', '2', '1', '1', '1');
INSERT INTO `application` VALUES ('35', '182', 'wangqu', 'warehouse', 'RMS邮件测试 ', '2016/08/25 17:56:22', '2', '2', '1', '1', '0');
INSERT INTO `application` VALUES ('36', '55', 'warehouse', 'zhangzhiliang', '', '2016/08/26 10:40:55', '0', '1', '2', '1', '0');
INSERT INTO `application` VALUES ('37', '56', 'warehouse', 'zhangzhiliang', '', '2016/08/26 10:42:19', '0', '1', '2', '1', '0');
INSERT INTO `application` VALUES ('38', '57', 'warehouse', 'zhangzhiliang', '', '2016/08/26 10:42:25', '0', '1', '2', '1', '0');
INSERT INTO `application` VALUES ('39', '58', 'warehouse', 'zhangzhiliang', '', '2016/08/26 10:42:29', '0', '1', '2', '1', '0');
INSERT INTO `application` VALUES ('40', '154', 'xiahui', 'fanghui', '请善待这个盒子', '2016/08/26 11:14:29', '1', '3', '1', '1', '0');
INSERT INTO `application` VALUES ('41', '152', 'shaoyi', 'warehouse', '方辉已经归还', '2016/08/26 11:16:27', '2', '2', '1', '1', '0');
INSERT INTO `application` VALUES ('42', '363', 'warehouse', 'wangjianjun', '手机号13952674168', '2016/08/29 16:25:18', '0', '1', '2', '1', '0');
INSERT INTO `application` VALUES ('43', '364', 'warehouse', 'wangjianjun', '手机号13952674168', '2016/08/29 16:25:24', '0', '1', '2', '1', '0');
INSERT INTO `application` VALUES ('44', '363', 'wangjianjun', 'warehouse', '', '2016/08/29 17:05:44', '2', '2', '1', '1', '0');
INSERT INTO `application` VALUES ('45', '364', 'wangjianjun', 'warehouse', '', '2016/08/29 17:05:46', '2', '2', '1', '1', '0');
INSERT INTO `application` VALUES ('46', '381', 'warehouse', 'wangjianjun', '刚才申请错误', '2016/08/29 17:06:12', '0', '1', '2', '1', '0');
INSERT INTO `application` VALUES ('47', '384', 'warehouse', 'wangjianjun', '刚才申请错误', '2016/08/29 17:06:15', '0', '1', '2', '1', '0');
INSERT INTO `application` VALUES ('48', '174', 'wangjianjun', 'xiaxingsuo', '锁哥的', '2016/08/29 17:12:50', '1', '3', '1', '1', '0');
INSERT INTO `application` VALUES ('49', '253', 'libin', 'gengshengen', '', '2016/08/29 17:13:35', '1', '3', '1', '1', '0');
INSERT INTO `application` VALUES ('50', '48', 'libin', 'gengshengen', '', '2016/08/29 17:13:44', '1', '3', '1', '1', '0');
INSERT INTO `application` VALUES ('51', '203', 'wangheng', 'warehouse', 'usb口损坏，已还给学可', '2016/08/30 13:16:08', '2', '2', '1', '1', '0');
INSERT INTO `application` VALUES ('52', '210', 'warehouse', 'wangkui', '用于PSTN Convertor测试和验证', '2016/08/30 13:40:45', '0', '1', '2', '1', '0');
INSERT INTO `application` VALUES ('53', '213', 'warehouse', 'lizheng', '功能验证使用', '2016/08/30 13:47:39', '0', '1', '2', '1', '0');
INSERT INTO `application` VALUES ('54', '394', 'warehouse', 'heyunxian', '用于voip volte 测试', '2016/08/30 13:51:16', '0', '1', '2', '1', '0');
INSERT INTO `application` VALUES ('55', '395', 'warehouse', 'heyunxian', '用于voip/volte 测试', '2016/08/30 13:51:44', '0', '1', '2', '1', '0');
INSERT INTO `application` VALUES ('56', '363', 'warehouse', 'shenxueke', '15695292212联通卡借给熙熙做fota测试，现在欠费申请充值一百元。', '2016/08/31 10:46:25', '0', '1', '2', '1', '0');
INSERT INTO `application` VALUES ('57', '364', 'warehouse', 'shenxueke', '15695292212卡借个熙熙做fota测试，目前欠费申请充值一百元。', '2016/08/31 10:46:56', '0', '1', '2', '1', '0');
INSERT INTO `application` VALUES ('58', '363', 'warehouse', 'shaoyi', 'Volte测试用', '2016/08/31 11:00:33', '0', '1', '2', '1', '1');
INSERT INTO `application` VALUES ('59', '363', 'warehouse', 'shaoyi', 'Volte测试用', '2016/08/31 11:00:38', '0', '1', '2', '1', '1');
INSERT INTO `application` VALUES ('60', '386', 'warehouse', 'shaoyi', '', '2016/08/31 15:07:40', '0', '1', '2', '1', '0');
INSERT INTO `application` VALUES ('61', '387', 'warehouse', 'shaoyi', '', '2016/08/31 15:07:45', '0', '1', '2', '1', '0');
INSERT INTO `application` VALUES ('62', '386', 'warehouse', 'zhangzhiliang', '13912984168   14点04分', '2016/09/01 08:42:40', '0', '1', '2', '1', '1');
INSERT INTO `application` VALUES ('63', '387', 'warehouse', 'zhangzhiliang', '13912984168  0830', '2016/09/01 08:42:57', '0', '1', '2', '1', '1');
INSERT INTO `application` VALUES ('64', '387', 'warehouse', 'zhangzhiliang', '13912984168   0826', '2016/09/01 08:44:47', '0', '1', '2', '1', '1');
INSERT INTO `application` VALUES ('65', '400', 'warehouse', 'zhangzhiliang', '', '2016/09/01 08:45:14', '0', '1', '2', '1', '0');
INSERT INTO `application` VALUES ('66', '38', 'shenxueke', 'sunfan', 'test', '2016/09/01 15:38:23', '1', '3', '1', '1', '1');
INSERT INTO `application` VALUES ('67', '406', 'warehouse', 'wubo', '18751858915  亲见', '2016/09/01 16:00:34', '0', '1', '2', '1', '0');
INSERT INTO `application` VALUES ('68', '402', 'warehouse', 'wubo', '18751858915 亲见', '2016/09/01 16:00:51', '0', '1', '2', '1', '0');
INSERT INTO `application` VALUES ('69', '140', 'wubo', 'warehouse', '标号61的已归还。', '2016/09/02 16:46:48', '2', '2', '1', '1', '0');
INSERT INTO `application` VALUES ('70', '212', 'shenxueke', 'warehouse', 'USB口坏', '2016/09/02 19:03:40', '2', '2', '1', '1', '0');
INSERT INTO `application` VALUES ('71', '212', 'shenxueke', 'warehouse', '', '2016/09/02 19:04:55', '2', '2', '1', '1', '1');
INSERT INTO `application` VALUES ('72', '212', 'shenxueke', 'warehouse', '', '2016/09/02 19:05:10', '2', '2', '1', '1', '1');
INSERT INTO `application` VALUES ('73', '388', 'warehouse', 'fanghui', 'Fanghui: 8/29和今天，两次远程支持威海营业厅复现问题和抓取log，通话时间较长，我个人的手机产生了几十块钱的费用，所以想申请一张面值50元的移动充值卡。望批准。\r\n\r\n\r\n\r\nLizheng:好的，没问题。需要在RMS系统里面提一个request哦。\r\n\r\n', '2016/09/05 13:37:54', '0', '1', '2', '1', '0');
INSERT INTO `application` VALUES ('74', '389', 'warehouse', 'gengshengen', '充值9904 sim卡', '2016/09/05 15:22:29', '0', '1', '2', '1', '0');
INSERT INTO `application` VALUES ('75', '390', 'warehouse', 'zhangzhiliang', '13912984168', '2016/09/05 16:16:09', '0', '1', '2', '1', '0');
INSERT INTO `application` VALUES ('76', '391', 'warehouse', 'zhangzhiliang', '13912984168   0830', '2016/09/05 16:16:21', '0', '1', '2', '1', '0');
INSERT INTO `application` VALUES ('77', '393', 'warehouse', 'zhangzhiliang', '18795892997   0902', '2016/09/05 16:16:32', '0', '1', '2', '1', '0');
INSERT INTO `application` VALUES ('78', '396', 'warehouse', 'zhangzhiliang', '13912996246   0902  \r\n', '2016/09/05 16:16:43', '0', '1', '2', '1', '0');
INSERT INTO `application` VALUES ('79', '397', 'warehouse', 'zhangzhiliang', '', '2016/09/05 16:16:47', '0', '1', '2', '1', '0');
INSERT INTO `application` VALUES ('80', '398', 'warehouse', 'zhangzhiliang', '', '2016/09/05 16:16:50', '0', '1', '2', '1', '0');
INSERT INTO `application` VALUES ('81', '399', 'warehouse', 'zhangzhiliang', '', '2016/09/05 16:16:54', '0', '1', '2', '1', '0');
INSERT INTO `application` VALUES ('82', '401', 'warehouse', 'shenxueke', '13776610392国际漫游需要预充500元', '2016/09/06 13:58:31', '0', '1', '2', '1', '0');
INSERT INTO `application` VALUES ('83', '403', 'warehouse', 'shenxueke', '13776610392国际漫游需要预充500元', '2016/09/06 13:58:38', '0', '1', '2', '1', '0');
INSERT INTO `application` VALUES ('84', '404', 'warehouse', 'shenxueke', '13776610392国际漫游需要预充500元', '2016/09/06 13:58:44', '0', '1', '2', '1', '0');
INSERT INTO `application` VALUES ('85', '405', 'warehouse', 'shenxueke', '13776610392国际漫游需要预充500元', '2016/09/06 13:58:51', '0', '1', '2', '1', '0');
INSERT INTO `application` VALUES ('86', '407', 'warehouse', 'shenxueke', '13776610392国际漫游需要预充500元', '2016/09/06 13:59:00', '0', '1', '2', '1', '0');
INSERT INTO `application` VALUES ('87', '408', 'warehouse', 'shenxueke', '13776610392国际漫游需要预充500元', '2016/09/06 13:59:06', '0', '1', '2', '1', '0');
INSERT INTO `application` VALUES ('88', '409', 'warehouse', 'shenxueke', '13776610392国际漫游需要预充500元', '2016/09/06 13:59:12', '0', '1', '2', '1', '0');
INSERT INTO `application` VALUES ('89', '410', 'warehouse', 'shenxueke', '13776610392国际漫游需要预充500元', '2016/09/06 13:59:18', '0', '1', '2', '1', '0');
INSERT INTO `application` VALUES ('90', '411', 'warehouse', 'shenxueke', '13776610392国际漫游需要预充500元', '2016/09/06 13:59:28', '0', '1', '2', '1', '0');
INSERT INTO `application` VALUES ('91', '412', 'warehouse', 'shenxueke', '13776610392国际漫游需要预充500元', '2016/09/06 14:00:19', '0', '1', '2', '1', '0');
INSERT INTO `application` VALUES ('92', '429', 'warehouse', 'donggaole', '', '2016/09/07 10:28:12', '0', '1', '2', '1', '0');
INSERT INTO `application` VALUES ('93', '430', 'warehouse', 'xuxixi', '用于camera stress测试。 ', '2016/09/07 14:40:49', '0', '1', '2', '1', '0');
INSERT INTO `application` VALUES ('94', '438', 'warehouse', 'xiahui', '申请一台Armstrong验证bug，如果有其他team需要可以转出', '2016/09/07 15:45:13', '0', '1', '2', '1', '0');
INSERT INTO `application` VALUES ('95', '432', 'warehouse', 'zhengyanli', 'featurePM郑艳丽和陈伟共用一台', '2016/09/07 15:46:20', '0', '1', '2', '1', '0');
INSERT INTO `application` VALUES ('96', '365', 'warehouse', 'zhengyanli', '2016年9月申请', '2016/09/07 15:47:00', '0', '1', '2', '1', '0');
INSERT INTO `application` VALUES ('97', '417', 'warehouse', 'chenwei', '50元话费申请', '2016/09/07 15:50:38', '0', '1', '2', '0', '0');
INSERT INTO `application` VALUES ('98', '416', 'warehouse', 'qixuewen', '手机号码 18851027946 ', '2016/09/07 15:57:55', '0', '1', '2', '1', '0');
INSERT INTO `application` VALUES ('99', '416', 'warehouse', 'qixuewen', '手机号码 18851027946 ', '2016/09/07 15:58:01', '0', '1', '2', '1', '1');
INSERT INTO `application` VALUES ('100', '431', 'warehouse', 'zhangzhiliang', 'voip stability及performance 测试', '2016/09/07 16:37:17', '0', '1', '2', '1', '0');
INSERT INTO `application` VALUES ('101', '442', 'warehouse', 'zhangzhiliang', 'voip stability及performance 测试', '2016/09/07 16:37:32', '0', '1', '2', '1', '0');
INSERT INTO `application` VALUES ('102', '443', 'warehouse', 'zhangzhiliang', 'voip stability及performance 测试', '2016/09/07 16:37:36', '0', '1', '2', '1', '0');
INSERT INTO `application` VALUES ('103', '444', 'warehouse', 'zhangzhiliang', 'voip stability及performance 测试', '2016/09/07 16:37:40', '0', '1', '2', '1', '0');
INSERT INTO `application` VALUES ('104', '445', 'warehouse', 'zhangzhiliang', 'voip stability及performance 测试', '2016/09/07 16:37:44', '0', '1', '2', '1', '0');
INSERT INTO `application` VALUES ('105', '437', 'warehouse', 'zhangzhiliang', 'voip stability及performance 测试', '2016/09/07 16:37:56', '0', '1', '2', '1', '0');
INSERT INTO `application` VALUES ('106', '413', 'warehouse', 'wangjianjun', '手机号 18851027486', '2016/09/07 17:10:59', '0', '1', '2', '1', '0');
INSERT INTO `application` VALUES ('107', '414', 'warehouse', 'wangjianjun', '手机号 18851027486', '2016/09/07 17:11:03', '0', '1', '2', '1', '0');
INSERT INTO `application` VALUES ('108', '433', 'warehouse', 'liuzhiyuan', 'camera tuning 使用', '2016/09/08 15:23:14', '0', '1', '2', '1', '0');
INSERT INTO `application` VALUES ('109', '434', 'warehouse', 'lizheng', '调试使用', '2016/09/08 15:29:42', '0', '1', '2', '1', '0');
INSERT INTO `application` VALUES ('110', '415', 'warehouse', 'qixuewen', '给18851027946号码充值', '2016/09/08 16:25:17', '0', '1', '2', '1', '0');
INSERT INTO `application` VALUES ('111', '435', 'warehouse', 'wubo', '亲见需要一台', '2016/09/08 16:37:16', '0', '1', '2', '1', '0');
INSERT INTO `application` VALUES ('112', '436', 'warehouse', 'wubo', '亲见需要2台', '2016/09/08 16:37:36', '0', '1', '2', '1', '1');
INSERT INTO `application` VALUES ('113', '439', 'warehouse', 'wubo', '亲见申请3太总共', '2016/09/08 16:43:15', '0', '1', '2', '1', '0');
INSERT INTO `application` VALUES ('114', '440', 'warehouse', 'xiaxingsuo', '申请一台armStrong,用于开发', '2016/09/08 17:03:00', '0', '1', '2', '1', '0');
INSERT INTO `application` VALUES ('115', '450', 'warehouse', 'shaoyi', '音频调试', '2016/09/08 17:49:22', '0', '1', '2', '1', '0');
INSERT INTO `application` VALUES ('116', '446', 'zhaobo', 'qixuewen', '', '2016/09/08 18:13:13', '1', '3', '1', '1', '0');
INSERT INTO `application` VALUES ('117', '441', 'warehouse', 'zhaobo', '', '2016/09/08 18:14:00', '0', '1', '2', '1', '0');
INSERT INTO `application` VALUES ('118', '140', 'warehouse', 'wangqu', '用于客服后台管理调试。\r\n\r\n\r\n\r\n\r\n', '2016/09/09 09:40:40', '0', '1', '2', '1', '1');
INSERT INTO `application` VALUES ('119', '447', 'warehouse', 'wangqu', '客服系统后台调试使用。\r\n（刚刚的Discovery申请失败）', '2016/09/09 10:00:08', '0', '1', '1', '1', '1');
INSERT INTO `application` VALUES ('120', '213', 'lizheng', 'wangqu', '', '2016/09/09 10:07:07', '1', '3', '1', '1', '0');
INSERT INTO `application` VALUES ('121', '140', 'warehouse', 'wubo', '再次申请', '2016/09/09 10:16:29', '0', '1', '2', '1', '0');
INSERT INTO `application` VALUES ('122', '447', 'warehouse', 'daichen', '给陈潜申请', '2016/09/09 10:23:31', '0', '1', '1', '1', '1');
INSERT INTO `application` VALUES ('123', '448', 'warehouse', 'daichen', '给刁伟申请', '2016/09/09 10:23:51', '0', '1', '2', '1', '0');
INSERT INTO `application` VALUES ('124', '449', 'warehouse', 'houhaiying', 'for camera', '2016/09/09 10:25:13', '0', '1', '2', '1', '0');
INSERT INTO `application` VALUES ('125', '214', 'zhanglin', 'warehouse', '', '2016/09/09 10:28:54', '2', '2', '1', '1', '0');
INSERT INTO `application` VALUES ('126', '439', 'wubo', 'warehouse', '坏的机器归还已经。', '2016/09/09 10:29:25', '2', '2', '1', '1', '0');
INSERT INTO `application` VALUES ('127', '452', 'warehouse', 'zhanglin', 'for debug', '2016/09/09 10:29:56', '0', '1', '2', '1', '0');
INSERT INTO `application` VALUES ('128', '451', 'warehouse', 'liulinxiang', 'qlove邮寄到北京，希望可以申请一台Armstrong调试。', '2016/09/09 10:34:07', '0', '1', '1', '1', '1');
INSERT INTO `application` VALUES ('129', '453', 'warehouse', 'wangqu', '后台管理系统调试使用', '2016/09/09 10:34:27', '0', '1', '1', '1', '1');
INSERT INTO `application` VALUES ('130', '213', 'wangqu', 'warehouse', '归还入库，重新申请Armstrong机器', '2016/09/09 10:35:12', '2', '2', '1', '1', '0');
INSERT INTO `application` VALUES ('131', '454', 'warehouse', 'wangjianjun', '全网通测试需要', '2016/09/09 10:43:35', '0', '1', '2', '1', '0');
INSERT INTO `application` VALUES ('132', '455', 'warehouse', 'jiyue', '', '2016/09/09 10:45:25', '0', '1', '1', '1', '1');
INSERT INTO `application` VALUES ('133', '457', 'warehouse', 'wangkai', 'server组调测汪凯使用', '2016/09/09 10:53:40', '0', '1', '1', '1', '1');
INSERT INTO `application` VALUES ('134', '439', 'warehouse', 'zhengyanli', '帮闻伟伟测试申请一台', '2016/09/09 10:56:13', '0', '1', '2', '1', '1');
INSERT INTO `application` VALUES ('135', '439', 'warehouse', 'zhengyanli', '帮闻伟伟测试申请一台', '2016/09/09 10:56:15', '0', '1', '1', '1', '1');
INSERT INTO `application` VALUES ('136', '456', 'warehouse', 'zhengyanli', '帮杨洋测试申请一台', '2016/09/09 10:56:27', '0', '1', '2', '1', '0');
INSERT INTO `application` VALUES ('137', '251', 'houhaiying', 'wangkai', '', '2016/09/09 11:03:24', '1', '3', '1', '1', '0');
INSERT INTO `application` VALUES ('138', '457', 'warehouse', 'zhengyanli', '帮闻伟伟申请测试使用', '2016/09/09 11:07:04', '0', '1', '2', '1', '0');
INSERT INTO `application` VALUES ('139', '439', 'warehouse', 'heyunxian', '', '2016/09/09 11:19:25', '0', '1', '1', '1', '1');
INSERT INTO `application` VALUES ('140', '453', 'warehouse', 'shaoyi', '中科胡莉莉测试需要', '2016/09/09 11:31:41', '0', '1', '2', '1', '0');
INSERT INTO `application` VALUES ('141', '438', 'xiahui', 'warehouse', '', '2016/09/09 14:07:08', '2', '2', '1', '1', '0');
INSERT INTO `application` VALUES ('142', '426', 'zhangzhiliang', 'daichen', '编号12', '2016/09/09 14:08:26', '1', '3', '1', '1', '0');
INSERT INTO `application` VALUES ('143', '261', 'zhangzhiliang', 'liulinxiang', '编号27', '2016/09/09 14:09:22', '1', '3', '1', '1', '0');
INSERT INTO `application` VALUES ('144', '262', 'zhangzhiliang', 'jiyue', '编号36', '2016/09/09 14:09:54', '1', '3', '1', '1', '0');
INSERT INTO `application` VALUES ('145', '439', 'warehouse', 'xiahui', '', '2016/09/09 14:13:08', '0', '1', '2', '1', '0');
INSERT INTO `application` VALUES ('146', '447', 'warehouse', 'heyunxian', '', '2016/09/09 14:13:28', '0', '1', '2', '1', '0');
INSERT INTO `application` VALUES ('147', '455', 'warehouse', 'baiwenke', '', '2016/09/09 14:14:29', '0', '1', '1', '1', '1');
INSERT INTO `application` VALUES ('148', '451', 'warehouse', 'baiwenke', '', '2016/09/09 14:14:33', '0', '1', '2', '1', '0');
INSERT INTO `application` VALUES ('149', '438', 'warehouse', 'baiwenke', '', '2016/09/09 14:15:22', '0', '1', '1', '1', '1');
INSERT INTO `application` VALUES ('150', '455', 'warehouse', 'shaoyi', '中科胡莉莉使用', '2016/09/09 14:16:40', '0', '1', '2', '1', '0');
INSERT INTO `application` VALUES ('151', '213', 'warehouse', 'wangqu', '刚刚表哥拿过来的那台Discovery，补一下申请。', '2016/09/09 14:25:30', '0', '1', '2', '1', '0');
INSERT INTO `application` VALUES ('152', '436', 'warehouse', 'shenxueke', '', '2016/09/09 14:28:44', '0', '1', '2', '1', '0');
INSERT INTO `application` VALUES ('153', '198', 'yeshuyan', 'warehouse', '', '2016/09/12 13:09:42', '2', '2', '1', '1', '0');
INSERT INTO `application` VALUES ('154', '175', 'lijianzhong', 'shenxueke', '', '2016/09/12 13:32:05', '1', '3', '1', '1', '0');
INSERT INTO `application` VALUES ('155', '261', 'liulinxiang', 'zhangdiping', '', '2016/09/14 11:07:28', '1', '3', '1', '1', '0');
INSERT INTO `application` VALUES ('156', '438', 'warehouse', 'liulinxiang', '', '2016/09/14 11:07:49', '0', '1', '2', '1', '0');
INSERT INTO `application` VALUES ('157', '445', 'zhangzhiliang', 'wuguangliang', '南京寄送一台设备给光亮', '2016/09/14 11:34:28', '1', '3', '1', '0', '0');
INSERT INTO `application` VALUES ('158', '439', 'xiahui', 'gaoweixing', 'NJ-AS-47, core team meeting', '2016/09/14 11:36:36', '1', '3', '1', '1', '0');
INSERT INTO `application` VALUES ('159', '42', 'zhuyunxia', 'gaoweixing', 'Armstrong', '2016/09/14 12:39:36', '1', '3', '1', '1', '0');

-- ----------------------------
-- Table structure for application_approval
-- ----------------------------
DROP TABLE IF EXISTS `application_approval`;
CREATE TABLE `application_approval` (
  `application_id` int(11) NOT NULL COMMENT '申请标识',
  `step` int(11) NOT NULL COMMENT '所处步骤',
  `reviewer` varchar(255) NOT NULL COMMENT '审核人',
  `approve` int(11) NOT NULL COMMENT '是否同意（0：同意；1：不同意）',
  `time` varchar(255) NOT NULL DEFAULT '' COMMENT '审核时间',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`application_id`,`step`),
  CONSTRAINT `application_approval_ibfk_1` FOREIGN KEY (`application_id`) REFERENCES `application` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of application_approval
-- ----------------------------
INSERT INTO `application_approval` VALUES ('1', '1', 'shenxueke', '0', '2016/08/19 14:02:52', '');
INSERT INTO `application_approval` VALUES ('2', '1', 'lizheng', '0', '2016/08/22 18:47:30', '');
INSERT INTO `application_approval` VALUES ('2', '2', 'shenxueke', '0', '2016/08/27 17:21:18', '');
INSERT INTO `application_approval` VALUES ('3', '1', 'shaoyi', '0', '2016/08/22 18:41:51', '');
INSERT INTO `application_approval` VALUES ('4', '1', 'lizheng', '0', '2016/08/22 18:47:37', '');
INSERT INTO `application_approval` VALUES ('4', '2', 'shenxueke', '0', '2016/08/27 17:21:14', '');
INSERT INTO `application_approval` VALUES ('5', '1', 'lizheng', '0', '2016/08/22 18:47:42', '');
INSERT INTO `application_approval` VALUES ('5', '2', 'shenxueke', '0', '2016/08/27 17:21:11', '');
INSERT INTO `application_approval` VALUES ('6', '1', 'lizheng', '0', '2016/08/22 18:47:47', '');
INSERT INTO `application_approval` VALUES ('6', '2', 'shenxueke', '0', '2016/08/27 17:21:08', '');
INSERT INTO `application_approval` VALUES ('14', '1', 'lizheng', '0', '2016/08/25 17:18:54', '');
INSERT INTO `application_approval` VALUES ('14', '2', 'shenxueke', '0', '2016/08/27 17:21:02', '');
INSERT INTO `application_approval` VALUES ('15', '1', 'lizheng', '0', '2016/08/25 17:19:20', '');
INSERT INTO `application_approval` VALUES ('15', '2', 'shenxueke', '1', '2016/08/29 16:55:43', '该卡已被分配，请重新申请其他未消耗的充值卡。');
INSERT INTO `application_approval` VALUES ('16', '1', 'lizheng', '0', '2016/08/26 13:48:09', '');
INSERT INTO `application_approval` VALUES ('16', '2', 'shenxueke', '0', '2016/08/27 17:20:44', '');
INSERT INTO `application_approval` VALUES ('17', '1', 'lizheng', '0', '2016/08/26 13:48:17', '');
INSERT INTO `application_approval` VALUES ('17', '2', 'shenxueke', '1', '2016/08/29 16:55:51', '该卡已被分配，请重新申请其他未消耗的充值卡。');
INSERT INTO `application_approval` VALUES ('18', '1', 'lizheng', '0', '2016/08/26 13:48:24', '');
INSERT INTO `application_approval` VALUES ('18', '2', 'shenxueke', '0', '2016/08/27 17:20:40', '');
INSERT INTO `application_approval` VALUES ('19', '1', 'lizheng', '0', '2016/08/26 13:48:32', '');
INSERT INTO `application_approval` VALUES ('19', '2', 'shenxueke', '1', '2016/08/29 16:56:01', '该卡已被分配，请重新申请其他未消耗的充值卡。');
INSERT INTO `application_approval` VALUES ('20', '1', 'lizheng', '0', '2016/08/26 13:48:47', '');
INSERT INTO `application_approval` VALUES ('20', '2', 'shenxueke', '1', '2016/08/29 16:56:07', '该卡已被分配，请重新申请其他未消耗的充值卡。');
INSERT INTO `application_approval` VALUES ('21', '1', 'lizheng', '0', '2016/08/26 13:48:58', '');
INSERT INTO `application_approval` VALUES ('21', '2', 'shenxueke', '0', '2016/08/27 17:20:08', '');
INSERT INTO `application_approval` VALUES ('22', '1', 'lizheng', '0', '2016/08/26 20:08:11', '');
INSERT INTO `application_approval` VALUES ('22', '2', 'shenxueke', '0', '2016/08/27 17:20:04', '');
INSERT INTO `application_approval` VALUES ('23', '1', 'lizheng', '0', '2016/08/26 20:10:16', '');
INSERT INTO `application_approval` VALUES ('23', '2', 'shenxueke', '0', '2016/08/27 17:19:59', '');
INSERT INTO `application_approval` VALUES ('24', '1', 'lizheng', '0', '2016/08/29 16:28:57', '');
INSERT INTO `application_approval` VALUES ('24', '2', 'shenxueke', '0', '2016/08/29 16:29:36', '');
INSERT INTO `application_approval` VALUES ('25', '1', 'jiyue', '1', '2016/08/24 14:06:23', '测试');
INSERT INTO `application_approval` VALUES ('26', '1', 'lizheng', '0', '2016/08/29 16:28:50', '');
INSERT INTO `application_approval` VALUES ('26', '2', 'shenxueke', '0', '2016/08/29 16:29:31', '');
INSERT INTO `application_approval` VALUES ('27', '1', 'shenxueke', '1', '2016/08/30 13:31:11', '');
INSERT INTO `application_approval` VALUES ('28', '1', 'lizheng', '0', '2016/08/29 16:28:43', '');
INSERT INTO `application_approval` VALUES ('28', '2', 'shenxueke', '0', '2016/08/29 16:29:19', '');
INSERT INTO `application_approval` VALUES ('29', '1', 'lizheng', '0', '2016/08/29 16:28:34', '');
INSERT INTO `application_approval` VALUES ('29', '2', 'shenxueke', '0', '2016/08/29 16:29:12', '');
INSERT INTO `application_approval` VALUES ('30', '1', 'sunfan', '1', '2016/08/25 16:23:12', 'RMS测试');
INSERT INTO `application_approval` VALUES ('31', '1', 'sunfan', '1', '2016/08/25 16:48:13', 'RMS邮件测试');
INSERT INTO `application_approval` VALUES ('32', '1', 'sunfan', '1', '2016/08/25 16:48:24', 'RMS邮件测试');
INSERT INTO `application_approval` VALUES ('33', '1', 'sunfan', '1', '2016/08/25 16:49:43', 'RMS邮件测试');
INSERT INTO `application_approval` VALUES ('34', '1', 'shenxueke', '1', '2016/08/25 17:40:10', 'RMS邮件测试');
INSERT INTO `application_approval` VALUES ('35', '1', 'shenxueke', '0', '2016/08/26 11:43:19', '');
INSERT INTO `application_approval` VALUES ('36', '1', 'lizheng', '0', '2016/08/29 16:28:27', '');
INSERT INTO `application_approval` VALUES ('36', '2', 'shenxueke', '0', '2016/08/29 16:28:54', '');
INSERT INTO `application_approval` VALUES ('37', '1', 'lizheng', '0', '2016/08/29 16:28:21', '');
INSERT INTO `application_approval` VALUES ('37', '2', 'shenxueke', '0', '2016/08/29 16:29:01', '');
INSERT INTO `application_approval` VALUES ('38', '1', 'lizheng', '0', '2016/08/29 16:28:13', '');
INSERT INTO `application_approval` VALUES ('38', '2', 'shenxueke', '0', '2016/08/29 16:29:05', '');
INSERT INTO `application_approval` VALUES ('39', '1', 'lizheng', '0', '2016/08/29 16:28:04', '');
INSERT INTO `application_approval` VALUES ('39', '2', 'shenxueke', '0', '2016/08/29 16:29:08', '');
INSERT INTO `application_approval` VALUES ('40', '1', 'fanghui', '0', '2016/08/26 11:16:10', '');
INSERT INTO `application_approval` VALUES ('41', '1', 'shenxueke', '0', '2016/08/29 17:07:26', '');
INSERT INTO `application_approval` VALUES ('42', '1', 'lizheng', '0', '2016/08/29 16:27:41', '');
INSERT INTO `application_approval` VALUES ('42', '2', 'shenxueke', '0', '2016/08/29 16:28:26', '');
INSERT INTO `application_approval` VALUES ('43', '1', 'lizheng', '0', '2016/08/29 16:27:49', '');
INSERT INTO `application_approval` VALUES ('43', '2', 'shenxueke', '0', '2016/08/29 16:28:31', '');
INSERT INTO `application_approval` VALUES ('44', '1', 'shenxueke', '0', '2016/08/29 17:07:30', '');
INSERT INTO `application_approval` VALUES ('45', '1', 'shenxueke', '0', '2016/08/29 17:07:34', '');
INSERT INTO `application_approval` VALUES ('46', '1', 'lizheng', '0', '2016/08/29 17:09:12', '');
INSERT INTO `application_approval` VALUES ('46', '2', 'shenxueke', '0', '2016/08/29 17:12:42', '');
INSERT INTO `application_approval` VALUES ('47', '1', 'lizheng', '0', '2016/08/29 17:09:19', '');
INSERT INTO `application_approval` VALUES ('47', '2', 'shenxueke', '0', '2016/08/29 17:12:45', '');
INSERT INTO `application_approval` VALUES ('48', '1', 'xiaxingsuo', '0', '2016/08/29 17:14:30', '');
INSERT INTO `application_approval` VALUES ('49', '1', 'gengshengen', '0', '2016/08/29 17:35:27', '');
INSERT INTO `application_approval` VALUES ('50', '1', 'gengshengen', '0', '2016/08/29 17:35:21', '');
INSERT INTO `application_approval` VALUES ('51', '1', 'shenxueke', '0', '2016/08/30 13:30:28', '');
INSERT INTO `application_approval` VALUES ('52', '1', 'lizheng', '0', '2016/08/30 13:44:42', '');
INSERT INTO `application_approval` VALUES ('52', '2', 'shenxueke', '0', '2016/08/30 13:48:16', '');
INSERT INTO `application_approval` VALUES ('53', '1', 'lizheng', '0', '2016/08/30 13:47:53', '');
INSERT INTO `application_approval` VALUES ('53', '2', 'shenxueke', '0', '2016/08/30 13:48:19', '');
INSERT INTO `application_approval` VALUES ('54', '1', 'lizheng', '0', '2016/08/31 15:01:37', '');
INSERT INTO `application_approval` VALUES ('54', '2', 'shenxueke', '0', '2016/08/31 15:08:03', '');
INSERT INTO `application_approval` VALUES ('55', '1', 'lizheng', '0', '2016/08/31 15:01:48', '');
INSERT INTO `application_approval` VALUES ('55', '2', 'shenxueke', '0', '2016/08/31 15:08:07', '');
INSERT INTO `application_approval` VALUES ('56', '1', 'lizheng', '0', '2016/08/31 15:02:03', '');
INSERT INTO `application_approval` VALUES ('56', '2', 'shenxueke', '0', '2016/08/31 15:08:11', '');
INSERT INTO `application_approval` VALUES ('57', '1', 'lizheng', '0', '2016/08/31 15:02:13', '');
INSERT INTO `application_approval` VALUES ('57', '2', 'shenxueke', '0', '2016/08/31 15:08:15', '');
INSERT INTO `application_approval` VALUES ('58', '1', 'lizheng', '0', '2016/08/31 15:03:46', '');
INSERT INTO `application_approval` VALUES ('58', '2', 'shenxueke', '1', '2016/08/31 15:08:31', '应该是移动卡……');
INSERT INTO `application_approval` VALUES ('59', '1', 'lizheng', '0', '2016/08/31 15:04:03', '');
INSERT INTO `application_approval` VALUES ('59', '2', 'shenxueke', '1', '2016/08/31 15:08:45', '应该是移动卡。。');
INSERT INTO `application_approval` VALUES ('60', '1', 'lizheng', '0', '2016/09/05 15:58:15', '');
INSERT INTO `application_approval` VALUES ('60', '2', 'shenxueke', '0', '2016/09/05 16:02:38', '');
INSERT INTO `application_approval` VALUES ('61', '1', 'lizheng', '0', '2016/09/05 15:58:21', '');
INSERT INTO `application_approval` VALUES ('61', '2', 'shenxueke', '0', '2016/09/05 16:02:42', '');
INSERT INTO `application_approval` VALUES ('62', '1', 'lizheng', '0', '2016/09/05 15:58:29', '');
INSERT INTO `application_approval` VALUES ('62', '2', 'shenxueke', '1', '2016/09/05 16:10:46', '');
INSERT INTO `application_approval` VALUES ('63', '1', 'lizheng', '0', '2016/09/05 15:59:04', '');
INSERT INTO `application_approval` VALUES ('63', '2', 'shenxueke', '1', '2016/09/05 16:10:50', '');
INSERT INTO `application_approval` VALUES ('64', '1', 'lizheng', '0', '2016/09/05 15:58:59', '');
INSERT INTO `application_approval` VALUES ('64', '2', 'shenxueke', '1', '2016/09/05 16:10:56', '');
INSERT INTO `application_approval` VALUES ('65', '1', 'lizheng', '0', '2016/09/05 15:58:55', '');
INSERT INTO `application_approval` VALUES ('65', '2', 'shenxueke', '0', '2016/09/05 16:03:04', '');
INSERT INTO `application_approval` VALUES ('66', '1', 'sunfan', '1', '2016/09/01 15:39:50', 'test');
INSERT INTO `application_approval` VALUES ('67', '1', 'lizheng', '0', '2016/09/05 15:58:49', '');
INSERT INTO `application_approval` VALUES ('67', '2', 'shenxueke', '0', '2016/09/05 16:03:09', '');
INSERT INTO `application_approval` VALUES ('68', '1', 'lizheng', '0', '2016/09/05 15:58:44', '');
INSERT INTO `application_approval` VALUES ('68', '2', 'shenxueke', '0', '2016/09/05 16:03:13', '');
INSERT INTO `application_approval` VALUES ('69', '1', 'shenxueke', '0', '2016/09/02 19:03:02', '');
INSERT INTO `application_approval` VALUES ('70', '1', 'shenxueke', '0', '2016/09/02 19:05:19', '');
INSERT INTO `application_approval` VALUES ('71', '1', 'shenxueke', '1', '2016/09/02 19:05:24', '');
INSERT INTO `application_approval` VALUES ('72', '1', 'shenxueke', '1', '2016/09/02 19:05:28', '');
INSERT INTO `application_approval` VALUES ('73', '1', 'lizheng', '0', '2016/09/05 15:58:39', '');
INSERT INTO `application_approval` VALUES ('73', '2', 'shenxueke', '0', '2016/09/05 16:03:21', '');
INSERT INTO `application_approval` VALUES ('74', '1', 'lizheng', '0', '2016/09/05 15:58:34', '');
INSERT INTO `application_approval` VALUES ('74', '2', 'shenxueke', '0', '2016/09/05 16:03:30', '');
INSERT INTO `application_approval` VALUES ('75', '1', 'lizheng', '0', '2016/09/05 16:17:55', '');
INSERT INTO `application_approval` VALUES ('75', '2', 'shenxueke', '0', '2016/09/05 16:49:18', '');
INSERT INTO `application_approval` VALUES ('76', '1', 'lizheng', '0', '2016/09/05 16:20:40', '');
INSERT INTO `application_approval` VALUES ('76', '2', 'shenxueke', '0', '2016/09/05 16:49:21', '');
INSERT INTO `application_approval` VALUES ('77', '1', 'lizheng', '0', '2016/09/05 16:20:45', '');
INSERT INTO `application_approval` VALUES ('77', '2', 'shenxueke', '0', '2016/09/05 16:49:25', '');
INSERT INTO `application_approval` VALUES ('78', '1', 'lizheng', '0', '2016/09/05 16:20:50', '');
INSERT INTO `application_approval` VALUES ('78', '2', 'shenxueke', '0', '2016/09/05 16:49:28', '');
INSERT INTO `application_approval` VALUES ('79', '1', 'lizheng', '0', '2016/09/05 16:20:55', '');
INSERT INTO `application_approval` VALUES ('79', '2', 'shenxueke', '0', '2016/09/05 16:49:31', '');
INSERT INTO `application_approval` VALUES ('80', '1', 'lizheng', '0', '2016/09/05 16:21:00', '');
INSERT INTO `application_approval` VALUES ('80', '2', 'shenxueke', '0', '2016/09/05 16:49:35', '');
INSERT INTO `application_approval` VALUES ('81', '1', 'lizheng', '0', '2016/09/05 16:21:07', '');
INSERT INTO `application_approval` VALUES ('81', '2', 'shenxueke', '0', '2016/09/05 16:49:38', '');
INSERT INTO `application_approval` VALUES ('82', '1', 'lizheng', '0', '2016/09/06 15:17:08', '');
INSERT INTO `application_approval` VALUES ('82', '2', 'shenxueke', '0', '2016/09/07 15:46:17', '');
INSERT INTO `application_approval` VALUES ('83', '1', 'lizheng', '0', '2016/09/06 15:17:14', '');
INSERT INTO `application_approval` VALUES ('83', '2', 'shenxueke', '0', '2016/09/07 15:46:21', '');
INSERT INTO `application_approval` VALUES ('84', '1', 'lizheng', '0', '2016/09/06 15:17:19', '');
INSERT INTO `application_approval` VALUES ('84', '2', 'shenxueke', '0', '2016/09/07 15:46:24', '');
INSERT INTO `application_approval` VALUES ('85', '1', 'lizheng', '0', '2016/09/06 15:17:25', '');
INSERT INTO `application_approval` VALUES ('85', '2', 'shenxueke', '0', '2016/09/07 15:46:27', '');
INSERT INTO `application_approval` VALUES ('86', '1', 'lizheng', '0', '2016/09/06 15:17:31', '');
INSERT INTO `application_approval` VALUES ('86', '2', 'shenxueke', '0', '2016/09/07 15:46:31', '');
INSERT INTO `application_approval` VALUES ('87', '1', 'lizheng', '0', '2016/09/06 15:17:36', '');
INSERT INTO `application_approval` VALUES ('87', '2', 'shenxueke', '0', '2016/09/07 15:46:34', '');
INSERT INTO `application_approval` VALUES ('88', '1', 'lizheng', '0', '2016/09/06 15:18:12', '');
INSERT INTO `application_approval` VALUES ('88', '2', 'shenxueke', '0', '2016/09/07 15:46:38', '');
INSERT INTO `application_approval` VALUES ('89', '1', 'lizheng', '0', '2016/09/06 15:18:20', '');
INSERT INTO `application_approval` VALUES ('89', '2', 'shenxueke', '0', '2016/09/07 15:46:41', '');
INSERT INTO `application_approval` VALUES ('90', '1', 'lizheng', '0', '2016/09/06 15:18:24', '');
INSERT INTO `application_approval` VALUES ('90', '2', 'shenxueke', '0', '2016/09/07 15:46:44', '');
INSERT INTO `application_approval` VALUES ('91', '1', 'lizheng', '0', '2016/09/06 15:18:31', '');
INSERT INTO `application_approval` VALUES ('91', '2', 'shenxueke', '0', '2016/09/07 15:46:48', '');
INSERT INTO `application_approval` VALUES ('92', '1', 'lizheng', '0', '2016/09/07 14:48:01', '');
INSERT INTO `application_approval` VALUES ('92', '2', 'shenxueke', '0', '2016/09/07 15:48:26', '');
INSERT INTO `application_approval` VALUES ('93', '1', 'lizheng', '0', '2016/09/07 14:48:11', '');
INSERT INTO `application_approval` VALUES ('93', '2', 'shenxueke', '0', '2016/09/07 15:48:29', '');
INSERT INTO `application_approval` VALUES ('94', '1', 'lizheng', '0', '2016/09/08 15:26:08', '');
INSERT INTO `application_approval` VALUES ('94', '2', 'shenxueke', '0', '2016/09/08 15:32:00', '');
INSERT INTO `application_approval` VALUES ('95', '1', 'lizheng', '0', '2016/09/08 15:26:16', '');
INSERT INTO `application_approval` VALUES ('95', '2', 'shenxueke', '0', '2016/09/08 15:32:13', '');
INSERT INTO `application_approval` VALUES ('96', '1', 'lizheng', '0', '2016/09/08 15:26:23', '');
INSERT INTO `application_approval` VALUES ('96', '2', 'shenxueke', '0', '2016/09/08 15:47:14', '');
INSERT INTO `application_approval` VALUES ('97', '1', 'lizheng', '0', '2016/09/08 15:26:29', '');
INSERT INTO `application_approval` VALUES ('98', '1', 'lizheng', '0', '2016/09/08 15:26:34', '');
INSERT INTO `application_approval` VALUES ('98', '2', 'shenxueke', '0', '2016/09/08 15:32:29', '');
INSERT INTO `application_approval` VALUES ('99', '1', 'lizheng', '0', '2016/09/08 15:26:39', '');
INSERT INTO `application_approval` VALUES ('99', '2', 'shenxueke', '1', '2016/09/08 15:47:03', '学文 这张手机卡和别人申请的冲突了 我点同意处理 失败了 麻烦再申请一张拉~');
INSERT INTO `application_approval` VALUES ('100', '1', 'lizheng', '0', '2016/09/08 15:26:45', '');
INSERT INTO `application_approval` VALUES ('100', '2', 'shenxueke', '0', '2016/09/08 15:35:04', '');
INSERT INTO `application_approval` VALUES ('101', '1', 'lizheng', '0', '2016/09/08 15:26:50', '');
INSERT INTO `application_approval` VALUES ('101', '2', 'shenxueke', '0', '2016/09/08 15:35:42', '');
INSERT INTO `application_approval` VALUES ('102', '1', 'lizheng', '0', '2016/09/08 15:26:59', '');
INSERT INTO `application_approval` VALUES ('102', '2', 'shenxueke', '0', '2016/09/08 15:35:52', '');
INSERT INTO `application_approval` VALUES ('103', '1', 'lizheng', '0', '2016/09/08 15:27:15', '');
INSERT INTO `application_approval` VALUES ('103', '2', 'shenxueke', '0', '2016/09/08 15:39:21', '');
INSERT INTO `application_approval` VALUES ('104', '1', 'lizheng', '0', '2016/09/08 15:27:20', '');
INSERT INTO `application_approval` VALUES ('104', '2', 'shenxueke', '0', '2016/09/08 15:39:24', '');
INSERT INTO `application_approval` VALUES ('105', '1', 'lizheng', '0', '2016/09/08 15:27:27', '');
INSERT INTO `application_approval` VALUES ('105', '2', 'shenxueke', '0', '2016/09/08 15:40:38', '');
INSERT INTO `application_approval` VALUES ('106', '1', 'lizheng', '0', '2016/09/08 15:27:33', '');
INSERT INTO `application_approval` VALUES ('106', '2', 'shenxueke', '0', '2016/09/08 15:41:38', '');
INSERT INTO `application_approval` VALUES ('107', '1', 'lizheng', '0', '2016/09/08 15:27:40', '');
INSERT INTO `application_approval` VALUES ('107', '2', 'shenxueke', '0', '2016/09/08 15:41:42', '');
INSERT INTO `application_approval` VALUES ('108', '1', 'lizheng', '0', '2016/09/08 15:27:47', '');
INSERT INTO `application_approval` VALUES ('108', '2', 'shenxueke', '0', '2016/09/08 15:40:53', '');
INSERT INTO `application_approval` VALUES ('109', '1', 'lizheng', '0', '2016/09/08 15:31:25', '');
INSERT INTO `application_approval` VALUES ('109', '2', 'shenxueke', '0', '2016/09/08 15:42:24', '');
INSERT INTO `application_approval` VALUES ('110', '1', 'lizheng', '0', '2016/09/09 09:42:43', '');
INSERT INTO `application_approval` VALUES ('110', '2', 'shenxueke', '0', '2016/09/09 09:51:32', '');
INSERT INTO `application_approval` VALUES ('111', '1', 'lizheng', '0', '2016/09/09 09:42:53', '');
INSERT INTO `application_approval` VALUES ('111', '2', 'shenxueke', '0', '2016/09/09 10:27:45', '');
INSERT INTO `application_approval` VALUES ('112', '1', 'lizheng', '0', '2016/09/09 09:43:05', '');
INSERT INTO `application_approval` VALUES ('112', '2', 'shenxueke', '1', '2016/09/09 14:28:00', '');
INSERT INTO `application_approval` VALUES ('113', '1', 'lizheng', '0', '2016/09/09 09:42:59', '');
INSERT INTO `application_approval` VALUES ('113', '2', 'shenxueke', '0', '2016/09/09 10:02:11', '');
INSERT INTO `application_approval` VALUES ('114', '1', 'lizheng', '0', '2016/09/09 09:43:43', '');
INSERT INTO `application_approval` VALUES ('114', '2', 'shenxueke', '0', '2016/09/09 10:02:07', '');
INSERT INTO `application_approval` VALUES ('115', '1', 'lizheng', '0', '2016/09/09 09:43:31', '');
INSERT INTO `application_approval` VALUES ('115', '2', 'shenxueke', '0', '2016/09/09 09:52:08', '');
INSERT INTO `application_approval` VALUES ('116', '1', 'qixuewen', '0', '2016/09/08 18:25:08', '');
INSERT INTO `application_approval` VALUES ('117', '1', 'lizheng', '0', '2016/09/09 09:43:22', '');
INSERT INTO `application_approval` VALUES ('117', '2', 'shenxueke', '0', '2016/09/09 10:01:39', '');
INSERT INTO `application_approval` VALUES ('118', '1', 'lizheng', '0', '2016/09/09 09:43:15', '');
INSERT INTO `application_approval` VALUES ('118', '2', 'shenxueke', '1', '2016/09/09 10:01:24', '这台机器在吴波那里。。。');
INSERT INTO `application_approval` VALUES ('119', '1', 'lizheng', '1', '2016/09/09 10:08:54', 'Armstrong P2紧张，请使用Discovery，67转给你了');
INSERT INTO `application_approval` VALUES ('120', '1', 'wangqu', '0', '2016/09/09 10:09:25', '');
INSERT INTO `application_approval` VALUES ('121', '1', 'lizheng', '0', '2016/09/09 10:58:28', '');
INSERT INTO `application_approval` VALUES ('121', '2', 'shenxueke', '0', '2016/09/09 11:06:37', '');
INSERT INTO `application_approval` VALUES ('122', '1', 'lizheng', '1', '2016/09/09 14:10:38', '');
INSERT INTO `application_approval` VALUES ('123', '1', 'lizheng', '0', '2016/09/09 10:58:46', '');
INSERT INTO `application_approval` VALUES ('123', '2', 'shenxueke', '0', '2016/09/09 11:07:39', '');
INSERT INTO `application_approval` VALUES ('124', '1', 'lizheng', '0', '2016/09/09 10:58:54', '');
INSERT INTO `application_approval` VALUES ('124', '2', 'shenxueke', '0', '2016/09/09 11:09:14', '');
INSERT INTO `application_approval` VALUES ('125', '1', 'shenxueke', '0', '2016/09/09 10:46:09', '');
INSERT INTO `application_approval` VALUES ('126', '1', 'shenxueke', '0', '2016/09/09 10:46:20', '');
INSERT INTO `application_approval` VALUES ('127', '1', 'lizheng', '0', '2016/09/09 13:57:27', '');
INSERT INTO `application_approval` VALUES ('127', '2', 'shenxueke', '0', '2016/09/09 14:09:37', '');
INSERT INTO `application_approval` VALUES ('128', '1', 'lizheng', '1', '2016/09/09 14:11:31', 'Pls apply P1 instead.');
INSERT INTO `application_approval` VALUES ('129', '1', 'lizheng', '1', '2016/09/09 13:58:22', '机器不够了，还是先拿那台Discovery用着吧，以后富余了一定给你换过来。');
INSERT INTO `application_approval` VALUES ('130', '1', 'shenxueke', '0', '2016/09/09 10:46:33', '');
INSERT INTO `application_approval` VALUES ('131', '1', 'lizheng', '0', '2016/09/09 10:58:18', '');
INSERT INTO `application_approval` VALUES ('131', '2', 'shenxueke', '0', '2016/09/09 11:08:15', '');
INSERT INTO `application_approval` VALUES ('132', '1', 'lizheng', '1', '2016/09/09 14:11:41', 'Pls apply P1 instead.');
INSERT INTO `application_approval` VALUES ('133', '1', 'lizheng', '1', '2016/09/09 11:03:27', 'Holly will transfer one P1 to you.');
INSERT INTO `application_approval` VALUES ('134', '1', 'lizheng', '0', '2016/09/09 10:59:17', '');
INSERT INTO `application_approval` VALUES ('134', '2', 'shenxueke', '1', '2016/09/09 11:07:57', '屏幕有问题 换一台吧');
INSERT INTO `application_approval` VALUES ('135', '1', 'lizheng', '1', '2016/09/09 11:01:44', 'Duplicated Application, reject');
INSERT INTO `application_approval` VALUES ('136', '1', 'lizheng', '0', '2016/09/09 10:59:25', '');
INSERT INTO `application_approval` VALUES ('136', '2', 'shenxueke', '0', '2016/09/09 11:08:02', '');
INSERT INTO `application_approval` VALUES ('137', '1', 'wangkai', '0', '2016/09/09 11:05:08', '');
INSERT INTO `application_approval` VALUES ('138', '1', 'lizheng', '0', '2016/09/09 11:28:33', '');
INSERT INTO `application_approval` VALUES ('138', '2', 'shenxueke', '0', '2016/09/09 11:29:28', '');
INSERT INTO `application_approval` VALUES ('139', '1', 'lizheng', '1', '2016/09/09 14:10:29', '');
INSERT INTO `application_approval` VALUES ('140', '1', 'lizheng', '0', '2016/09/09 14:07:03', '');
INSERT INTO `application_approval` VALUES ('140', '2', 'shenxueke', '0', '2016/09/09 14:09:08', '');
INSERT INTO `application_approval` VALUES ('141', '1', 'shenxueke', '0', '2016/09/09 14:08:54', '');
INSERT INTO `application_approval` VALUES ('142', '1', 'daichen', '0', '2016/09/09 14:10:58', '');
INSERT INTO `application_approval` VALUES ('143', '1', 'liulinxiang', '0', '2016/09/09 14:43:33', '');
INSERT INTO `application_approval` VALUES ('144', '1', 'jiyue', '0', '2016/09/09 14:44:24', '');
INSERT INTO `application_approval` VALUES ('145', '1', 'lizheng', '0', '2016/09/09 14:15:53', '');
INSERT INTO `application_approval` VALUES ('145', '2', 'shenxueke', '0', '2016/09/09 14:27:26', '');
INSERT INTO `application_approval` VALUES ('146', '1', 'lizheng', '0', '2016/09/09 14:15:12', '');
INSERT INTO `application_approval` VALUES ('146', '2', 'shenxueke', '0', '2016/09/09 14:27:21', '');
INSERT INTO `application_approval` VALUES ('147', '1', 'lizheng', '1', '2016/09/09 14:15:42', '');
INSERT INTO `application_approval` VALUES ('148', '1', 'lizheng', '0', '2016/09/09 14:15:24', '');
INSERT INTO `application_approval` VALUES ('148', '2', 'shenxueke', '0', '2016/09/09 14:27:09', '');
INSERT INTO `application_approval` VALUES ('149', '1', 'lizheng', '1', '2016/09/14 11:07:08', '');
INSERT INTO `application_approval` VALUES ('150', '1', 'lizheng', '0', '2016/09/09 14:16:59', '');
INSERT INTO `application_approval` VALUES ('150', '2', 'shenxueke', '0', '2016/09/09 14:26:46', '');
INSERT INTO `application_approval` VALUES ('151', '1', 'lizheng', '0', '2016/09/09 14:28:33', '');
INSERT INTO `application_approval` VALUES ('151', '2', 'shenxueke', '0', '2016/09/09 17:14:29', '');
INSERT INTO `application_approval` VALUES ('152', '1', 'lizheng', '0', '2016/09/14 11:07:41', '');
INSERT INTO `application_approval` VALUES ('152', '2', 'shenxueke', '0', '2016/09/14 11:37:10', '');
INSERT INTO `application_approval` VALUES ('153', '1', 'shenxueke', '0', '2016/09/12 13:10:12', '');
INSERT INTO `application_approval` VALUES ('154', '1', 'shenxueke', '0', '2016/09/12 13:32:45', '');
INSERT INTO `application_approval` VALUES ('155', '1', 'zhangdiping', '0', '2016/09/14 11:10:38', '');
INSERT INTO `application_approval` VALUES ('156', '1', 'lizheng', '0', '2016/09/14 11:08:23', '');
INSERT INTO `application_approval` VALUES ('156', '2', 'shenxueke', '0', '2016/09/14 11:37:16', '');
INSERT INTO `application_approval` VALUES ('158', '1', 'gaoweixing', '0', '2016/09/14 12:42:10', '');
INSERT INTO `application_approval` VALUES ('159', '1', 'gaoweixing', '0', '2016/09/14 12:42:05', '');

-- ----------------------------
-- Table structure for flow
-- ----------------------------
DROP TABLE IF EXISTS `flow`;
CREATE TABLE `flow` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '流程标识',
  `name` varchar(255) NOT NULL COMMENT '流程名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of flow
-- ----------------------------
INSERT INTO `flow` VALUES ('1', '经理-管理员');
INSERT INTO `flow` VALUES ('2', '管理员');
INSERT INTO `flow` VALUES ('3', '资产接收者');

-- ----------------------------
-- Table structure for flow_step
-- ----------------------------
DROP TABLE IF EXISTS `flow_step`;
CREATE TABLE `flow_step` (
  `flowId` int(11) NOT NULL COMMENT '流程标识',
  `step` int(11) NOT NULL COMMENT '所处步骤',
  `userGroup` int(11) NOT NULL COMMENT '用户群组',
  `remark` varchar(255) DEFAULT '' COMMENT '步骤描述',
  PRIMARY KEY (`flowId`,`step`),
  KEY `userGroup` (`userGroup`),
  CONSTRAINT `flow_step_ibfk_1` FOREIGN KEY (`flowId`) REFERENCES `flow` (`id`),
  CONSTRAINT `flow_step_ibfk_2` FOREIGN KEY (`userGroup`) REFERENCES `user_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of flow_step
-- ----------------------------
INSERT INTO `flow_step` VALUES ('1', '1', '3', '经理进行审核');
INSERT INTO `flow_step` VALUES ('1', '2', '2', '管理员进行处理');
INSERT INTO `flow_step` VALUES ('2', '1', '2', '管理员进行审核和处理');
INSERT INTO `flow_step` VALUES ('3', '1', '1', '资产接收用户进行审核');

-- ----------------------------
-- Table structure for log
-- ----------------------------
DROP TABLE IF EXISTS `log`;
CREATE TABLE `log` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `rid` int(11) NOT NULL COMMENT '资产标识',
  `owner` varchar(255) DEFAULT '' COMMENT '资产拥有者',
  `startTime` varchar(255) DEFAULT '' COMMENT '开始使用时间',
  `endTime` varchar(255) DEFAULT '' COMMENT '结束使用时间',
  `remark` varchar(255) DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`id`),
  KEY `rid` (`rid`),
  CONSTRAINT `log_ibfk_1` FOREIGN KEY (`rid`) REFERENCES `resource` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=590 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of log
-- ----------------------------
INSERT INTO `log` VALUES ('2', '1', 'zhangzhiliang', '2016/8/17', '', '手机亲见app');
INSERT INTO `log` VALUES ('3', '2', 'heyunxian', '2016/5/25', '', '');
INSERT INTO `log` VALUES ('4', '3', 'wangjianjun', '2016/3/22', '', 'VOLTE');
INSERT INTO `log` VALUES ('5', '4', 'donggaole', '2016/8/17', '', '手机亲见app');
INSERT INTO `log` VALUES ('6', '5', 'wubo', '2016/3/22', '', '手机亲见APP');
INSERT INTO `log` VALUES ('7', '6', 'wangjianjun', '2016/4/11', '', 'VOLTE');
INSERT INTO `log` VALUES ('8', '7', 'zhoudong', '2016/03/22 15:08:23', '', '带到北京');
INSERT INTO `log` VALUES ('9', '8', 'xuxixi', '2016/4/20', '', '非公司资产，李彬');
INSERT INTO `log` VALUES ('10', '9', 'warehouse', '2016/07/29 15:11:19', '', '只支持2.4G');
INSERT INTO `log` VALUES ('11', '10', 'wubo', '2016/6/17', '', '');
INSERT INTO `log` VALUES ('12', '11', 'wangjianjun', '2016/6/24', '', '');
INSERT INTO `log` VALUES ('13', '12', 'xuxixi', '2016/07/29 15:12:38', '', '同时支持2.4G和5G投屏，经常投屏一小时信号发射会主动中断一次');
INSERT INTO `log` VALUES ('14', '13', 'huashasha', '2016/6/28', '', '');
INSERT INTO `log` VALUES ('15', '14', 'wangjianjun', '2016/7/18', '2016/08/19 14:02:52', '');
INSERT INTO `log` VALUES ('16', '15', 'chenyang', '2016/7/3', '', '');
INSERT INTO `log` VALUES ('17', '16', 'xuyue', '2016/7/3', '', '');
INSERT INTO `log` VALUES ('18', '17', 'shaoyi', '42396', '', '');
INSERT INTO `log` VALUES ('19', '18', 'shaoyi', '42396', '', '');
INSERT INTO `log` VALUES ('20', '19', 'shaoyi', '42446', '', '');
INSERT INTO `log` VALUES ('21', '20', 'shaoyi', '42446', '', '');
INSERT INTO `log` VALUES ('22', '21', 'xuxixi', '2016/3/23', '', '流量卡，半年有效');
INSERT INTO `log` VALUES ('23', '22', 'shaoyi', '1/27/16', '', '');
INSERT INTO `log` VALUES ('24', '23', 'shaoyi', '1/27/16', '', '');
INSERT INTO `log` VALUES ('25', '24', 'warehouse', '', '', '');
INSERT INTO `log` VALUES ('26', '25', 'xuxixi', '2016/3/23', '', '流量卡，半年有效，2016/7/19流量用完注销');
INSERT INTO `log` VALUES ('27', '26', 'shaoyi', '1/27/16', '', '');
INSERT INTO `log` VALUES ('28', '27', 'shaoyi', '1/27/16', '', '');
INSERT INTO `log` VALUES ('29', '28', 'wangjianjun', '2016/3/23', '', 'VOLTE');
INSERT INTO `log` VALUES ('30', '29', 'warehouse', '', '', '');
INSERT INTO `log` VALUES ('31', '30', 'wangjianjun', '2016/3/23', '', 'VOLTE+多方');
INSERT INTO `log` VALUES ('32', '31', 'qixuewen', '早期', '', 'VOLTE+多方');
INSERT INTO `log` VALUES ('33', '32', 'wangjianjun', '早期', '', 'VOLTE+多方');
INSERT INTO `log` VALUES ('34', '33', 'houhaiying', '早期', '', '');
INSERT INTO `log` VALUES ('35', '34', 'wubo', '早期', '', '');
INSERT INTO `log` VALUES ('36', '35', 'wangqu', '早期', '', 'VOLTE');
INSERT INTO `log` VALUES ('37', '36', 'tanhongyan', '早期', '', 'VOLTE');
INSERT INTO `log` VALUES ('38', '37', 'donggaole', '2016/6/28', '', '');
INSERT INTO `log` VALUES ('39', '38', 'shenxueke', '早期', '', '');
INSERT INTO `log` VALUES ('40', '39', 'warehouse', '早期', '', '欠费');
INSERT INTO `log` VALUES ('41', '40', 'warehouse', '2016/5/30', '', 'VOLTE\r\n外借至迪士尼');
INSERT INTO `log` VALUES ('42', '41', 'libin', '2016/5/30', '', 'VOLTE');
INSERT INTO `log` VALUES ('45', '42', 'zhuyunxia', '2016/5/31', '2016/09/14 12:42:05', 'VOLTE');
INSERT INTO `log` VALUES ('50', '43', 'xuxixi', '2016/6/1', '', 'VOLTE\r\n');
INSERT INTO `log` VALUES ('51', '44', 'lizheng', '2016/6/28', '', 'VOLTE\r\n');
INSERT INTO `log` VALUES ('52', '45', 'lizheng', '2016/6/28', '', 'VOLTE\r\n');
INSERT INTO `log` VALUES ('53', '46', 'heyunxian', '2016/7/20', '', 'VOLTE\r\n');
INSERT INTO `log` VALUES ('54', '47', 'shaoyi', '2016/1/27', '', '');
INSERT INTO `log` VALUES ('55', '48', 'libin', '2016/8/15', '2016/08/29 17:35:21', '已充值500元\r\n');
INSERT INTO `log` VALUES ('56', '49', 'shaoyi', '2016/1/27 17:02:11', '', '');
INSERT INTO `log` VALUES ('57', '50', 'warehouse', '2016/7/29 17:03:13', '', '测试（北边吧台）');
INSERT INTO `log` VALUES ('58', '51', 'warehouse', '2016/7/29 17:04:14', '2016/08/29 16:29:19', '会议室');
INSERT INTO `log` VALUES ('59', '52', 'yongxiaowen', '2016/7/21 17:04:50', '', '');
INSERT INTO `log` VALUES ('60', '53', 'xiaxingsuo', '2016/7/28 17:06:35', '', '');
INSERT INTO `log` VALUES ('61', '54', 'huashasha', '2016/8/17 17:07:18', '', '放在机房');
INSERT INTO `log` VALUES ('64', '55', 'warehouse', '2016/8/15', '2016/08/29 16:28:54', '已充值500元\r\n');
INSERT INTO `log` VALUES ('65', '56', 'warehouse', '2016/8/15', '2016/08/29 16:29:01', '已充值500元\r\n');
INSERT INTO `log` VALUES ('66', '57', 'warehouse', '2016/8/15', '2016/08/29 16:29:05', '已充值500元\r\n');
INSERT INTO `log` VALUES ('67', '58', 'warehouse', '2016/8/15', '2016/08/29 16:29:08', '已充值500元\r\n');
INSERT INTO `log` VALUES ('68', '59', 'warehouse', '2016/8/15', '', '已充值500元\r\n');
INSERT INTO `log` VALUES ('69', '60', 'lijianzhong', '2016/4/18', '', '党宁寄,已寄回北京');
INSERT INTO `log` VALUES ('70', '61', 'lijianzhong', '2016/4/18', '', '党宁寄,已寄回北京');
INSERT INTO `log` VALUES ('71', '62', 'houhaiying', '早期', '', '非公司资产，Holly');
INSERT INTO `log` VALUES ('72', '63', 'xuxixi', '早期', '', '朱云霞机器');
INSERT INTO `log` VALUES ('73', '64', 'jiyue', '2016/6/23', '', '申购产品');
INSERT INTO `log` VALUES ('74', '65', 'tanhongyan', '2016/4/13', '', '');
INSERT INTO `log` VALUES ('75', '66', 'chenzilong', '2016/4/13', '', '');
INSERT INTO `log` VALUES ('76', '67', 'chenzilong', '2016/4/13', '', '');
INSERT INTO `log` VALUES ('77', '68', 'chenzilong', '2016/4/15', '', '');
INSERT INTO `log` VALUES ('78', '69', 'tanhongyan', '2016/6/23', '', '申购产品\r\n');
INSERT INTO `log` VALUES ('79', '70', 'qixuewen', '2016/4/14', '', '');
INSERT INTO `log` VALUES ('80', '71', 'chenzilong', '2016/4/14', '', '');
INSERT INTO `log` VALUES ('81', '72', 'chenzilong', '2016/4/15', '', '');
INSERT INTO `log` VALUES ('82', '73', 'tanhongyan', '2016/6/23', '', '申购产品\r\n');
INSERT INTO `log` VALUES ('83', '74', 'tanhongyan', '2016/6/23', '', '申购产品\r\n');
INSERT INTO `log` VALUES ('84', '75', 'sunjian', '2016/6/30', '', '');
INSERT INTO `log` VALUES ('85', '76', 'sunjian', '2016/6/30', '', '');
INSERT INTO `log` VALUES ('86', '77', 'sunjian', '2016/6/30', '', '');
INSERT INTO `log` VALUES ('87', '78', 'donggaole', '2016/7/19', '', '测试使用\r\n');
INSERT INTO `log` VALUES ('88', '79', 'warehouse', '2016/7/19', '', '');
INSERT INTO `log` VALUES ('89', '80', 'shaoyi', '1/27/16', '', ' ');
INSERT INTO `log` VALUES ('90', '81', 'zhanglin', '5/23/16', '', ' ');
INSERT INTO `log` VALUES ('91', '82', 'shaoyi', '1/27/16', '', ' ');
INSERT INTO `log` VALUES ('92', '83', 'shaoyi', '1/27/16', '', ' ');
INSERT INTO `log` VALUES ('93', '84', 'warehouse', '', '', ' ');
INSERT INTO `log` VALUES ('94', '85', 'warehouse', '', '', ' ');
INSERT INTO `log` VALUES ('95', '86', 'shaoyi', '1/27/16', '', ' ');
INSERT INTO `log` VALUES ('96', '87', 'shaoyi', '1/27/16', '', ' ');
INSERT INTO `log` VALUES ('97', '88', 'shaoyi', '1/27/16', '', ' ');
INSERT INTO `log` VALUES ('98', '89', 'warehouse', '', '', ' ');
INSERT INTO `log` VALUES ('99', '90', 'warehouse', '', '', ' ');
INSERT INTO `log` VALUES ('100', '91', 'warehouse', '', '', ' ');
INSERT INTO `log` VALUES ('101', '92', 'warehouse', '', '', ' ');
INSERT INTO `log` VALUES ('102', '93', 'shaoyi', '2/29/16', '', ' ');
INSERT INTO `log` VALUES ('103', '94', 'shaoyi', '2/29/16', '', ' ');
INSERT INTO `log` VALUES ('104', '95', 'xuxixi', '2016/7/19', '', '测试使用\r\n');
INSERT INTO `log` VALUES ('105', '96', 'warehouse', '2016/7/19', '', '亲粉会使用\r\n');
INSERT INTO `log` VALUES ('106', '97', 'chenzilong', '2016/8/8', '', '');
INSERT INTO `log` VALUES ('107', '98', 'zhaobo', '2016/8/8', '', '');
INSERT INTO `log` VALUES ('108', '99', 'chenzilong', '2016/8/12', '', '');
INSERT INTO `log` VALUES ('109', '100', 'warehouse', '2016/8/15', '', '');
INSERT INTO `log` VALUES ('110', '101', 'wangqu', '2016/3/22', '', '');
INSERT INTO `log` VALUES ('111', '102', 'wangqu', '2016/3/22', '', '');
INSERT INTO `log` VALUES ('112', '103', 'heyunxian', '2016/4/5', '', '');
INSERT INTO `log` VALUES ('113', '104', 'heyunxian', '2016/4/5', '', '');
INSERT INTO `log` VALUES ('114', '105', 'wubo', '2016/4/5', '', '');
INSERT INTO `log` VALUES ('115', '106', 'wubo', '2016/4/5', '', '');
INSERT INTO `log` VALUES ('116', '107', 'tanhongyan', '2016/4/5', '', '');
INSERT INTO `log` VALUES ('117', '108', 'qixuewen', '2016/4/11', '', '');
INSERT INTO `log` VALUES ('118', '109', 'qixuewen', '2016/4/11', '', '');
INSERT INTO `log` VALUES ('119', '110', 'donggaole', '2016/4/14', '', '');
INSERT INTO `log` VALUES ('120', '111', 'donggaole', '2016/4/14', '', '');
INSERT INTO `log` VALUES ('121', '112', 'donggaole', '2016/4/20', '', '');
INSERT INTO `log` VALUES ('122', '113', 'donggaole', '2016/4/22', '', '');
INSERT INTO `log` VALUES ('123', '114', 'tanhongyan', '2016/4/26', '', '');
INSERT INTO `log` VALUES ('124', '115', 'wangjianjun', '2016/4/27', '', '');
INSERT INTO `log` VALUES ('125', '116', 'wubo', '2016/5/3', '', '');
INSERT INTO `log` VALUES ('126', '117', 'wangjianjun', '2016/5/4', '', '');
INSERT INTO `log` VALUES ('127', '118', 'wangqu', '2016/5/4', '', '');
INSERT INTO `log` VALUES ('128', '119', 'wangjianjun', '2016/5/4', '', '');
INSERT INTO `log` VALUES ('129', '120', 'wangqu', '2016/5/17', '', '');
INSERT INTO `log` VALUES ('130', '121', 'wangqu', '2016/5/23', '', 'VOLTE demo\r\n');
INSERT INTO `log` VALUES ('131', '122', 'wangqu', '2016/5/23', '', 'VOLTE demo\r\n');
INSERT INTO `log` VALUES ('132', '123', 'wangqu', '2016/5/23', '', 'VOLTE demo\r\n');
INSERT INTO `log` VALUES ('133', '124', 'wangqu', '2016/4/22', '', 'VOLTE demo\r\n');
INSERT INTO `log` VALUES ('134', '125', 'wangqu', '2016/4/22', '', 'VOLTE demo\r\n');
INSERT INTO `log` VALUES ('135', '14', 'warehouse', '2016/08/19 14:02:52', '2016/08/27 17:21:02', '归还入库');
INSERT INTO `log` VALUES ('136', '126', 'baiwenke', '2016/3/28', '', '');
INSERT INTO `log` VALUES ('137', '127', 'warehouse', '2016/4/27', '', '在外（中科胡莉莉）');
INSERT INTO `log` VALUES ('138', '128', 'warehouse', '2016/2/26', '', '会议室');
INSERT INTO `log` VALUES ('139', '129', 'xuxixi', '2016/6/28', '', 'fota');
INSERT INTO `log` VALUES ('140', '130', 'xuxixi', '2016/4/27', '', '屏坏，2016/7/25寄回北京做验证。');
INSERT INTO `log` VALUES ('141', '131', 'tanhongyan', '2016/7/7', '', '');
INSERT INTO `log` VALUES ('142', '132', 'suguosong', '2016/3/30', '', '在家');
INSERT INTO `log` VALUES ('143', '133', 'warehouse', '2016/4/1', '', '在外（中科胡莉莉）');
INSERT INTO `log` VALUES ('144', '134', 'heyunxian', '2016/3/30', '', '');
INSERT INTO `log` VALUES ('145', '135', 'houhaiying', '2016/3/24', '', '');
INSERT INTO `log` VALUES ('146', '136', 'qixuewen', '2016/6/12', '', '');
INSERT INTO `log` VALUES ('147', '137', 'warehouse', '2016/4/1', '', '在外（中科胡莉莉）');
INSERT INTO `log` VALUES ('148', '138', 'shaoyi', '2016/5/3', '', '');
INSERT INTO `log` VALUES ('149', '139', 'zhouyanxin', '2016/3/31', '', '');
INSERT INTO `log` VALUES ('150', '140', 'wubo', '2016/3/30', '2016/09/02 19:03:02', '');
INSERT INTO `log` VALUES ('151', '141', 'warehouse', '2016/1/28', '', '在库（铁箱）');
INSERT INTO `log` VALUES ('152', '142', 'warehouse', '2016/7/25', '', '');
INSERT INTO `log` VALUES ('153', '143', 'suguosong', '2016/4/28', '', '');
INSERT INTO `log` VALUES ('154', '144', 'suguosong', '2016/4/28', '', '');
INSERT INTO `log` VALUES ('155', '145', 'warehouse', '2016/4/28', '', '在库（铁箱）');
INSERT INTO `log` VALUES ('156', '146', 'warehouse', '2016/4/28', '', '在库（铁箱）');
INSERT INTO `log` VALUES ('157', '147', 'fanzikang', '2016/4/19', '', '');
INSERT INTO `log` VALUES ('158', '148', 'warehouse', '2016/3/22', '', '在外（中科牛丽娟）');
INSERT INTO `log` VALUES ('159', '149', 'warehouse', '2016/3/17', '', '在外（中科徐娅）');
INSERT INTO `log` VALUES ('160', '150', 'warehouse', '2016/7/25', '', '');
INSERT INTO `log` VALUES ('161', '151', 'warehouse', '2016/3/17', '', '在外（中科徐娅）');
INSERT INTO `log` VALUES ('162', '152', 'shaoyi', '2016/6/20', '2016/08/29 17:07:26', '');
INSERT INTO `log` VALUES ('163', '153', 'warehouse', '2016/8/17', '', '在外（中科毕伟）');
INSERT INTO `log` VALUES ('164', '154', 'xiahui', '2016/8/18', '2016/08/26 11:16:11', '');
INSERT INTO `log` VALUES ('165', '155', 'wuhongwei', '2016/7/14', '', '');
INSERT INTO `log` VALUES ('166', '156', 'xuehui', '2016/7/14', '', '');
INSERT INTO `log` VALUES ('167', '157', 'wubo', '2016/7/13', '', '');
INSERT INTO `log` VALUES ('168', '158', 'warehouse', '2016/3/17', '', '在外（中科徐娅）');
INSERT INTO `log` VALUES ('169', '159', 'heyunxian', '2016/1/22', '', '');
INSERT INTO `log` VALUES ('170', '160', 'warehouse', '2016/3/24', '', '在外（中科胡莉莉）');
INSERT INTO `log` VALUES ('171', '161', 'chenwei', '2016/6/12', '', '');
INSERT INTO `log` VALUES ('172', '162', 'jiyue', '2016/3/2', '', '');
INSERT INTO `log` VALUES ('173', '163', 'diaowei', '2016/6/12', '', '');
INSERT INTO `log` VALUES ('174', '164', 'warehouse', '2016/3/17', '', '在外（中科徐娅，吴波）');
INSERT INTO `log` VALUES ('175', '165', 'huashasha', '2016/6/13', '', '');
INSERT INTO `log` VALUES ('176', '166', 'warehouse', '2016/4/28', '', '在外（中科胡莉莉）');
INSERT INTO `log` VALUES ('177', '167', 'liulinxiang', '2016/2/2', '', '2016/7/25寄回北京做验证');
INSERT INTO `log` VALUES ('178', '168', 'warehouse', '2016/8/15', '', '在外（中科胡莉莉）');
INSERT INTO `log` VALUES ('179', '169', 'liujian', '2016/7/29', '', '');
INSERT INTO `log` VALUES ('180', '170', 'xuxixi', '2016/6/28', '', 'fota');
INSERT INTO `log` VALUES ('181', '171', 'warehouse', '早期', '', '在库，硬件有问题，在厂测模式');
INSERT INTO `log` VALUES ('182', '172', 'shaoyi', '2016/3/21', '', '');
INSERT INTO `log` VALUES ('183', '173', 'warehouse', '2016/3/21', '', '在外（中科陈彬）');
INSERT INTO `log` VALUES ('184', '174', 'wangjianjun', '2016/7/18', '2016/08/29 17:14:30', '');
INSERT INTO `log` VALUES ('185', '175', 'lijianzhong', '2016/3/22', '2016/09/12 13:32:45', '');
INSERT INTO `log` VALUES ('186', '176', 'suguosong', '2016/3/22', '', '');
INSERT INTO `log` VALUES ('187', '177', 'warehouse', '2016/3/22', '', '在外（中科张岱岳）');
INSERT INTO `log` VALUES ('188', '178', 'warehouse', '2016/4/21', '', '在外（中科邓昌志/胡莉莉） ');
INSERT INTO `log` VALUES ('189', '179', 'warehouse', '2016/4/27', '', '在外（中科胡莉莉）');
INSERT INTO `log` VALUES ('190', '180', 'zhuyunxia', '2016/6/30', '', '');
INSERT INTO `log` VALUES ('191', '181', 'warehouse', '2016/6/3', '', '李彦涛');
INSERT INTO `log` VALUES ('192', '182', 'wangqu', '2016/6/28', '2016/08/26 11:43:19', '2016/7/25寄回北京做验证');
INSERT INTO `log` VALUES ('193', '183', 'warehouse', '2016/4/27', '', '在外（中科胡莉莉）');
INSERT INTO `log` VALUES ('194', '184', 'xuxixi', '2016/6/29', '', '');
INSERT INTO `log` VALUES ('195', '185', 'lizheng', '2016/5/17', '', '2016/7/25寄回北京做验证');
INSERT INTO `log` VALUES ('196', '186', 'warehouse', '2016/5/3', '', '在外（中科胡莉莉）');
INSERT INTO `log` VALUES ('197', '187', 'tanhongyan', '2016/6/17', '', '');
INSERT INTO `log` VALUES ('198', '188', 'warehouse', '2016/5/18', '', '在外（91-game）');
INSERT INTO `log` VALUES ('199', '189', 'xuxixi', '2016/6/28', '', 'fota');
INSERT INTO `log` VALUES ('200', '190', 'libin', '2016/5/4', '', '');
INSERT INTO `log` VALUES ('201', '191', 'zhangzhiliang', '2016/7/29', '', '');
INSERT INTO `log` VALUES ('202', '192', 'warehouse', '2016/6/6', '', '在外（虹软）');
INSERT INTO `log` VALUES ('203', '193', 'xuyue', '2016/6/13', '', '');
INSERT INTO `log` VALUES ('204', '194', 'donggaole', '2016/7/29', '', '');
INSERT INTO `log` VALUES ('205', '195', 'donggaole', '2016/6/29', '', '');
INSERT INTO `log` VALUES ('206', '196', 'zhangzhiliang', '2016/6/30', '', '');
INSERT INTO `log` VALUES ('207', '197', 'warehouse', '2016/6/6', '', '在外（虹软）');
INSERT INTO `log` VALUES ('208', '198', 'yeshuyan', '2016/6/29', '2016/09/12 13:10:12', '');
INSERT INTO `log` VALUES ('209', '199', 'chenzilong', '2016/6/29', '', '');
INSERT INTO `log` VALUES ('210', '200', 'warehouse', '2016/6/20', '', 'wifi连接有问题，无法识别sim卡，2016/7/25寄回北京做验证');
INSERT INTO `log` VALUES ('211', '201', 'chenyang', '2016/6/23', '', '');
INSERT INTO `log` VALUES ('212', '202', 'liuzhiyuan', '2016/6/29', '', '');
INSERT INTO `log` VALUES ('213', '203', 'wangheng', '2016/6/28', '2016/08/30 13:30:28', '');
INSERT INTO `log` VALUES ('214', '204', 'yongxiaowen', '2016/7/1', '', '');
INSERT INTO `log` VALUES ('215', '205', 'warehouse', '2016/6/20', '', '');
INSERT INTO `log` VALUES ('216', '206', 'yuanfanjie', '2016/7/29', '', '');
INSERT INTO `log` VALUES ('217', '207', 'wubo', '2016/8/2', '', '');
INSERT INTO `log` VALUES ('218', '208', 'geminxia', '2016/8/1', '', '');
INSERT INTO `log` VALUES ('219', '209', 'warehouse', '2016/8/17', '', '在外（中科毕伟）');
INSERT INTO `log` VALUES ('220', '210', 'warehouse', '2016/8/8', '2016/08/30 13:48:16', '');
INSERT INTO `log` VALUES ('221', '211', 'wangjianjun', '2016/8/11', '', '');
INSERT INTO `log` VALUES ('222', '212', 'shenxueke', '2016/8/16', '2016/09/02 19:05:19', '');
INSERT INTO `log` VALUES ('223', '213', 'warehouse', '2016/8/8', '2016/08/30 13:48:19', '');
INSERT INTO `log` VALUES ('224', '214', 'warehouse', '2016/8/8', '2016/08/29 16:29:12', '');
INSERT INTO `log` VALUES ('225', '215', 'warehouse', '2016/8/8', '', 'USB口没法充电');
INSERT INTO `log` VALUES ('226', '216', 'wangqu', '2016/6/17', '', 'VOLTEdemo\r\n');
INSERT INTO `log` VALUES ('227', '217', 'lijianzhong', '2016/6/21', '', '2016/6/20，2016/7/25寄回北京做验证\r\n');
INSERT INTO `log` VALUES ('228', '218', 'qixuewen', '2016/4/6', '', '');
INSERT INTO `log` VALUES ('229', '219', 'zhanglin', '2016/3/2', '', '');
INSERT INTO `log` VALUES ('230', '220', 'lizheng', '2016/3/2', '', '');
INSERT INTO `log` VALUES ('231', '221', 'houhaiying', '2016/6/2', '', '在家');
INSERT INTO `log` VALUES ('232', '222', 'warehouse', '早期', '', '');
INSERT INTO `log` VALUES ('233', '223', 'wangqu', '早期', '', 'VOLTEdemo');
INSERT INTO `log` VALUES ('234', '224', 'warehouse', '2016/3/23', '', '在外（中科张岱岳）');
INSERT INTO `log` VALUES ('235', '225', 'warehouse', '2016/3/22', '', '在外（中科胡莉莉）');
INSERT INTO `log` VALUES ('236', '226', 'warehouse', '2016/5/3', '', '会议室');
INSERT INTO `log` VALUES ('237', '227', 'chenzilong', '2016/3/4', '', '');
INSERT INTO `log` VALUES ('238', '228', 'zhuyunxia', '2016/6/16', '', '');
INSERT INTO `log` VALUES ('239', '229', 'chenzilong', '2016/2/26', '', '');
INSERT INTO `log` VALUES ('240', '230', 'warehouse', '2016/5/3', '', '音乐电台换一台');
INSERT INTO `log` VALUES ('241', '231', 'warehouse', '2016/3/17', '', '在外（中科徐娅）');
INSERT INTO `log` VALUES ('242', '232', 'tanhongyan', '2016/7/7', '', '在家');
INSERT INTO `log` VALUES ('243', '233', 'suguosong', '早期', '', '在家');
INSERT INTO `log` VALUES ('244', '234', 'xuxixi', '2016/6/16', '', '');
INSERT INTO `log` VALUES ('245', '235', 'heyunxian', '早期', '', '在家');
INSERT INTO `log` VALUES ('246', '236', 'houhaiying', '早期', '', '在家');
INSERT INTO `log` VALUES ('247', '237', 'yongxiaowen', '2016/5/30', '', '');
INSERT INTO `log` VALUES ('248', '238', 'lizheng', '早期', '', '在家');
INSERT INTO `log` VALUES ('249', '239', 'shaoyi', '2016/6/12', '', '');
INSERT INTO `log` VALUES ('250', '240', 'xuxixi', '2016/6/16', '', '');
INSERT INTO `log` VALUES ('251', '241', 'wubo', '2016/6/15', '', '');
INSERT INTO `log` VALUES ('252', '242', 'jiyue', '2016/3/2', '', '');
INSERT INTO `log` VALUES ('253', '243', 'zhanglin', '2016/3/2', '', '');
INSERT INTO `log` VALUES ('254', '244', 'lizheng', '2016/3/2', '', '');
INSERT INTO `log` VALUES ('255', '245', 'chenzilong', '2016/3/2', '', '');
INSERT INTO `log` VALUES ('256', '246', 'warehouse', '早期', '', '');
INSERT INTO `log` VALUES ('257', '247', 'warehouse', '2016/3/17', '', '在外（中科徐娅）');
INSERT INTO `log` VALUES ('258', '248', 'warehouse', '2016/3/22', '', '在外（中科胡莉莉）');
INSERT INTO `log` VALUES ('259', '249', 'warehouse', '2016/3/23', '', '在外（中科张岱岳）');
INSERT INTO `log` VALUES ('263', '250', 'tanhongyan', '2016/7/25', '', '7/15寄到南京十台');
INSERT INTO `log` VALUES ('264', '251', 'houhaiying', '2016/7/25', '2016/09/09 11:05:08', '7/16寄到南京十台');
INSERT INTO `log` VALUES ('265', '252', 'zhouyanxin', '2016/7/25', '', '7/17寄到南京十台');
INSERT INTO `log` VALUES ('266', '253', 'libin', '2016/7/25', '2016/08/29 17:35:27', '7/18寄到南京十台');
INSERT INTO `log` VALUES ('267', '254', 'heyunxian', '2016/7/25', '2016/08/22 18:41:51', '7/19寄到南京十台');
INSERT INTO `log` VALUES ('268', '255', 'baiwenke', '2016/7/25', '', '7/20寄到南京十台');
INSERT INTO `log` VALUES ('269', '256', 'lijianzhong', '2016/7/25', '', '7/21寄到南京十台');
INSERT INTO `log` VALUES ('270', '257', 'warehouse', '2016/8/17', '', '7/22寄到南京十台   在外（中科胡莉莉）');
INSERT INTO `log` VALUES ('271', '258', 'warehouse', '2016/8/12', '', '7/23寄到南京十台   在外（中科胡莉莉）');
INSERT INTO `log` VALUES ('272', '259', 'warehouse', '2016/8/17', '', '7/24寄到南京十台   在外（中科胡莉莉）');
INSERT INTO `log` VALUES ('273', '260', 'suleilong', '2016/8/11', '', '7/22寄到南京二十二台');
INSERT INTO `log` VALUES ('274', '261', 'zhangzhiliang', '2016/8/8', '2016/09/09 14:43:34', '7/23寄到南京二十二台');
INSERT INTO `log` VALUES ('275', '262', 'zhangzhiliang', '2016/8/8', '2016/09/09 14:44:24', '7/24寄到南京二十二台');
INSERT INTO `log` VALUES ('276', '263', 'xuxixi', '2016/8/8', '', '7/25寄到南京二十二台');
INSERT INTO `log` VALUES ('277', '264', 'warehouse', '早期', '2016/08/29 16:29:31', '7/26寄到南京二十二台');
INSERT INTO `log` VALUES ('278', '265', 'warehouse', '2016/8/4', '', '7/27寄到南京二十二台   在外（中科戴婵娟）');
INSERT INTO `log` VALUES ('279', '266', 'warehouse', '2016/8/12', '', '7/28寄到南京二十二台   在外（中科胡莉莉）');
INSERT INTO `log` VALUES ('280', '267', 'warehouse', '2016/8/17', '', '7/29寄到南京二十二台   在外（中科胡莉莉）');
INSERT INTO `log` VALUES ('281', '268', 'warehouse', '早期', '2016/08/27 17:21:11', '7/30寄到南京二十二台');
INSERT INTO `log` VALUES ('282', '269', 'warehouse', '早期', '2016/08/27 17:21:14', '7/31寄到南京二十二台');
INSERT INTO `log` VALUES ('283', '270', 'warehouse', '2016/8/12', '', '7/32寄到南京二十二台   在外（中科胡莉莉）');
INSERT INTO `log` VALUES ('284', '271', 'donggaole', '2016/8/8', '', '7/33寄到南京二十二台');
INSERT INTO `log` VALUES ('285', '272', 'warehouse', '2016/8/4', '', '7/34寄到南京二十二台   在外（中科朱晓祥）');
INSERT INTO `log` VALUES ('286', '273', 'warehouse', '早期', '2016/08/27 17:21:18', '7/35寄到南京二十二台');
INSERT INTO `log` VALUES ('287', '274', 'warehouse', '2016/8/4', '', '7/36寄到南京二十二台   在外（中科胡莉莉）');
INSERT INTO `log` VALUES ('288', '275', 'warehouse', '2016/8/4', '', '7/37寄到南京二十二台   在外（中科朱丽楠）');
INSERT INTO `log` VALUES ('289', '276', 'warehouse', '2016/8/12', '', '7/38寄到南京二十二台   在外（中科张岱岳）');
INSERT INTO `log` VALUES ('290', '277', 'warehouse', '早期', '2016/08/27 17:21:08', '7/39寄到南京二十二台');
INSERT INTO `log` VALUES ('291', '278', 'warehouse', '2016/8/8', '', '7/40寄到南京二十二台   在外（中科石娇娇）');
INSERT INTO `log` VALUES ('292', '279', 'warehouse', '2016/8/4', '', '7/41寄到南京二十二台   在外（中科胡莉莉）');
INSERT INTO `log` VALUES ('293', '280', 'warehouse', '2016/8/12', '', '7/42寄到南京二十二台   在外（中科胡莉莉）');
INSERT INTO `log` VALUES ('294', '281', 'warehouse', '2016/8/17', '', '7/43寄到南京二十二台   在外（中科胡莉莉）');
INSERT INTO `log` VALUES ('295', '282', 'zhaobo', '2016/8/5', '', '2016/8/5建忠带回南京');
INSERT INTO `log` VALUES ('296', '283', 'warehouse', '2016/8/3', '', '2016/8/3征哥带回');
INSERT INTO `log` VALUES ('297', '284', 'warehouse', '2016/8/15', '', '2016/8/3征哥带回   在外（中科胡莉莉）');
INSERT INTO `log` VALUES ('298', '285', 'warehouse', '2016/8/3', '', '2016/8/3征哥带回');
INSERT INTO `log` VALUES ('299', '286', 'warehouse', '2016/8/3', '', '2016/8/3征哥带回');
INSERT INTO `log` VALUES ('300', '287', 'warehouse', '2016/8/3', '', '2016/8/3征哥带回');
INSERT INTO `log` VALUES ('301', '288', 'warehouse', '2016/8/15', '', '2016/8/3征哥带回   在外（中科胡莉莉）');
INSERT INTO `log` VALUES ('302', '289', 'warehouse', '2016/8/3', '', '2016/8/3征哥带回');
INSERT INTO `log` VALUES ('303', '290', 'warehouse', '2016/8/15', '', '2016/8/3征哥带回   在外（中科胡莉莉）');
INSERT INTO `log` VALUES ('304', '291', 'warehouse', '2016/8/3', '', '2016/8/3征哥带回');
INSERT INTO `log` VALUES ('305', '292', 'warehouse', '2016/8/3', '', '2016/8/3征哥带回');
INSERT INTO `log` VALUES ('306', '293', 'warehouse', '2016/8/15', '', '2016/8/3征哥带回   在外（中科胡莉莉）');
INSERT INTO `log` VALUES ('307', '294', 'warehouse', '2016/8/3', '', '2016/8/3征哥带回');
INSERT INTO `log` VALUES ('308', '295', 'warehouse', '2016/8/15', '', '2016/8/3征哥带回   在外（中科胡莉莉）');
INSERT INTO `log` VALUES ('309', '296', 'warehouse', '2016/8/15', '', '2016/8/3征哥带回   在外（中科胡莉莉）');
INSERT INTO `log` VALUES ('310', '297', 'warehouse', '2016/8/15', '', '2016/8/3征哥带回   在外（中科胡莉莉）');
INSERT INTO `log` VALUES ('311', '298', 'warehouse', '2016/8/3', '', '2016/8/3征哥带回');
INSERT INTO `log` VALUES ('312', '299', 'warehouse', '2016/8/15', '', '2016/8/3征哥带回   在外（中科胡莉莉）');
INSERT INTO `log` VALUES ('313', '300', 'warehouse', '2016/8/3', '', '2016/8/3征哥带回');
INSERT INTO `log` VALUES ('314', '301', 'warehouse', '2016/8/3', '', '2016/8/3征哥带回');
INSERT INTO `log` VALUES ('315', '302', 'warehouse', '2016/8/3', '', '2016/8/3征哥带回');
INSERT INTO `log` VALUES ('316', '303', 'wangjianjun', '2016/6/1', '', '');
INSERT INTO `log` VALUES ('317', '304', 'wangqu', '2016/6/1', '', '迪士尼');
INSERT INTO `log` VALUES ('318', '305', 'wangqu', '2016/6/1', '', '迪士尼');
INSERT INTO `log` VALUES ('319', '306', 'wangqu', '2016/6/1', '', '');
INSERT INTO `log` VALUES ('320', '307', 'wubo', '2016/6/2', '', '');
INSERT INTO `log` VALUES ('321', '308', 'qixuewen', '2016/6/2', '', '');
INSERT INTO `log` VALUES ('322', '309', 'wangqu', '2016/6/3', '', '迪士尼');
INSERT INTO `log` VALUES ('323', '310', 'wangqu', '2016/3/2', '', '迪士尼');
INSERT INTO `log` VALUES ('324', '311', 'wangqu', '2016/3/2', '', '迪士尼');
INSERT INTO `log` VALUES ('325', '312', 'wangqu', '2016/6/16', '', '转给中科王栋，北京转2张100元充值卡给南京');
INSERT INTO `log` VALUES ('326', '313', 'wangqu', '2016/6/16', '', '转给中科王栋，北京转2张100元充值卡给南京');
INSERT INTO `log` VALUES ('327', '314', 'wangqu', '2016/6/16', '', '');
INSERT INTO `log` VALUES ('328', '315', 'tanhongyan', '2016/6/17', '', '');
INSERT INTO `log` VALUES ('329', '316', 'houhaiying', '2016/6/21', '', '');
INSERT INTO `log` VALUES ('330', '317', 'shenxueke', '2016/6/24', '', '');
INSERT INTO `log` VALUES ('331', '318', 'houhaiying', '2016/6/24', '', '');
INSERT INTO `log` VALUES ('332', '319', 'libin', '2016/6/24', '', '');
INSERT INTO `log` VALUES ('333', '320', 'wangqu', '2016/6/29', '', '');
INSERT INTO `log` VALUES ('334', '321', 'wubo', '2016/7/1', '', '');
INSERT INTO `log` VALUES ('335', '322', 'heyunxian', '2016/7/4', '', '');
INSERT INTO `log` VALUES ('336', '323', 'shenxueke', '2016/7/4', '', '');
INSERT INTO `log` VALUES ('337', '324', 'shenxueke', '2016/7/4', '', '');
INSERT INTO `log` VALUES ('338', '325', 'wangjianjun', '2016/7/4', '', '');
INSERT INTO `log` VALUES ('339', '326', 'wangqu', '2016/7/6', '', '');
INSERT INTO `log` VALUES ('340', '327', 'wangqu', '2016/7/6', '', '');
INSERT INTO `log` VALUES ('341', '328', 'wangjianjun', '2016/7/7', '', '');
INSERT INTO `log` VALUES ('342', '329', 'tanhongyan', '2016/7/8', '', '');
INSERT INTO `log` VALUES ('343', '330', 'heyunxian', '2016/7/13', '', '');
INSERT INTO `log` VALUES ('344', '331', 'libin', '2016/7/14', '', '');
INSERT INTO `log` VALUES ('345', '332', 'heyunxian', '2016/7/18', '', '');
INSERT INTO `log` VALUES ('346', '333', 'wangjianjun', '2016/7/18', '', '');
INSERT INTO `log` VALUES ('347', '334', 'xuxixi', '2016/7/21', '', '');
INSERT INTO `log` VALUES ('348', '335', 'xuxixi', '2016/7/21', '', '');
INSERT INTO `log` VALUES ('349', '336', 'wangqu', '2016/7/21', '', 'VOLTE demo');
INSERT INTO `log` VALUES ('350', '337', 'wangqu', '2016/7/21', '', 'VOLTE demo');
INSERT INTO `log` VALUES ('351', '338', 'wangqu', '2016/7/21', '', 'VOLTE demo');
INSERT INTO `log` VALUES ('352', '339', 'wangqu', '2016/7/21', '', 'VOLTE demo');
INSERT INTO `log` VALUES ('353', '340', 'liuzhiyuan', '2016/7/21', '', '');
INSERT INTO `log` VALUES ('354', '341', 'wangjianjun', '2016/7/23', '', '用于亲粉会');
INSERT INTO `log` VALUES ('355', '342', 'wangjianjun', '2016/7/23', '', '用于亲粉会');
INSERT INTO `log` VALUES ('356', '343', 'heyunxian', '2016/7/23', '', '用于亲粉会');
INSERT INTO `log` VALUES ('357', '344', 'heyunxian', '2016/7/23', '', '用于亲粉会');
INSERT INTO `log` VALUES ('358', '345', 'houhaiying', '2016/7/23', '', '用于亲粉会');
INSERT INTO `log` VALUES ('359', '346', 'houhaiying', '2016/7/23', '', '用于亲粉会');
INSERT INTO `log` VALUES ('360', '347', 'wangjianjun', '2016/7/28', '', '');
INSERT INTO `log` VALUES ('361', '348', 'wangjianjun', '2016/7/28', '', '');
INSERT INTO `log` VALUES ('362', '349', 'wubo', '2016/8/2', '', '');
INSERT INTO `log` VALUES ('363', '350', 'wubo', '2016/8/2', '', '');
INSERT INTO `log` VALUES ('364', '351', 'houhaiying', '2016/8/2', '', '');
INSERT INTO `log` VALUES ('365', '352', 'houhaiying', '2016/8/2', '', '');
INSERT INTO `log` VALUES ('366', '353', 'tanhongyan', '2016/8/2', '', '');
INSERT INTO `log` VALUES ('367', '354', 'wangjianjun', '2016/8/8', '', '');
INSERT INTO `log` VALUES ('368', '355', 'wangjianjun', '2016/8/8', '', '');
INSERT INTO `log` VALUES ('369', '356', 'shenxueke', '2016/8/9', '', '');
INSERT INTO `log` VALUES ('370', '357', 'zhengyanli', '2016/8/9', '', '');
INSERT INTO `log` VALUES ('371', '358', 'chenwei', '2016/8/9', '', '');
INSERT INTO `log` VALUES ('372', '359', 'wangjianjun', '2016/8/16', '', '');
INSERT INTO `log` VALUES ('373', '360', 'wangjianjun', '2016/8/16', '', '');
INSERT INTO `log` VALUES ('374', '361', 'zhangzhiliang', '2016/8/16', '', '');
INSERT INTO `log` VALUES ('375', '362', 'zhangzhiliang', '2016/8/16', '', '');
INSERT INTO `log` VALUES ('378', '363', 'warehouse', '2016/4/22', '2016/08/29 16:28:26', '');
INSERT INTO `log` VALUES ('379', '364', 'warehouse', '2016/4/22', '2016/08/29 16:28:31', '');
INSERT INTO `log` VALUES ('380', '365', 'warehouse', '2016/4/22', '2016/09/08 15:47:14', '');
INSERT INTO `log` VALUES ('381', '366', 'warehouse', '2016/4/22', '', '');
INSERT INTO `log` VALUES ('382', '367', 'warehouse', '2016/4/22', '', '');
INSERT INTO `log` VALUES ('383', '368', 'warehouse', '2016/4/22', '', '');
INSERT INTO `log` VALUES ('384', '369', 'warehouse', '2016/4/22', '', '');
INSERT INTO `log` VALUES ('385', '370', 'warehouse', '2016/4/22', '', '');
INSERT INTO `log` VALUES ('386', '371', 'warehouse', '2016/4/22', '', '');
INSERT INTO `log` VALUES ('387', '372', 'warehouse', '2016/4/22', '', '');
INSERT INTO `log` VALUES ('388', '373', 'warehouse', '2016/4/22', '', '');
INSERT INTO `log` VALUES ('389', '374', 'warehouse', '2016/4/22', '', '');
INSERT INTO `log` VALUES ('390', '375', 'warehouse', '2016/4/22', '', '');
INSERT INTO `log` VALUES ('391', '376', 'warehouse', '2016/4/22', '', '');
INSERT INTO `log` VALUES ('392', '377', 'warehouse', '2016/4/22', '', '');
INSERT INTO `log` VALUES ('393', '378', 'warehouse', '2016/4/22', '', '');
INSERT INTO `log` VALUES ('394', '379', 'warehouse', '2016/7/28', '2016/08/27 17:20:44', '');
INSERT INTO `log` VALUES ('395', '380', 'warehouse', '2016/7/28', '2016/08/27 17:20:08', '');
INSERT INTO `log` VALUES ('396', '381', 'warehouse', '2016/7/28', '2016/08/29 17:12:42', '');
INSERT INTO `log` VALUES ('397', '382', 'warehouse', '2016/7/28', '2016/08/27 17:20:40', '');
INSERT INTO `log` VALUES ('398', '383', 'warehouse', '2016/7/28', '2016/08/27 17:20:04', '');
INSERT INTO `log` VALUES ('399', '384', 'warehouse', '2016/7/28', '2016/08/29 17:12:45', '');
INSERT INTO `log` VALUES ('400', '385', 'warehouse', '2016/7/28', '2016/08/29 16:29:36', '');
INSERT INTO `log` VALUES ('401', '386', 'warehouse', '2016/7/28', '2016/09/05 16:02:38', '');
INSERT INTO `log` VALUES ('402', '387', 'warehouse', '2016/7/28', '2016/09/05 16:02:42', '');
INSERT INTO `log` VALUES ('403', '388', 'warehouse', '2016/7/28', '2016/09/05 16:03:21', '');
INSERT INTO `log` VALUES ('404', '389', 'warehouse', '2016/7/28', '2016/09/05 16:03:30', '');
INSERT INTO `log` VALUES ('405', '390', 'warehouse', '2016/7/28', '2016/09/05 16:49:18', '');
INSERT INTO `log` VALUES ('406', '391', 'warehouse', '2016/7/28', '2016/09/05 16:49:21', '');
INSERT INTO `log` VALUES ('407', '392', 'warehouse', '2016/7/28', '2016/08/27 17:19:59', '');
INSERT INTO `log` VALUES ('408', '393', 'warehouse', '2016/7/28', '2016/09/05 16:49:25', '');
INSERT INTO `log` VALUES ('409', '394', 'warehouse', '2016/7/28', '2016/08/31 15:08:03', '');
INSERT INTO `log` VALUES ('410', '395', 'warehouse', '2016/7/28', '2016/08/31 15:08:07', '');
INSERT INTO `log` VALUES ('411', '396', 'warehouse', '2016/7/28', '2016/09/05 16:49:28', '');
INSERT INTO `log` VALUES ('412', '397', 'warehouse', '2016/7/28', '2016/09/05 16:49:31', '');
INSERT INTO `log` VALUES ('413', '398', 'warehouse', '2016/7/28', '2016/09/05 16:49:35', '');
INSERT INTO `log` VALUES ('414', '399', 'warehouse', '2016/7/28', '2016/09/05 16:49:38', '');
INSERT INTO `log` VALUES ('415', '400', 'warehouse', '2016/7/28', '2016/09/05 16:03:04', '');
INSERT INTO `log` VALUES ('416', '401', 'warehouse', '2016/7/28', '2016/09/07 15:46:17', '');
INSERT INTO `log` VALUES ('417', '402', 'warehouse', '2016/7/28', '2016/09/05 16:03:13', '');
INSERT INTO `log` VALUES ('418', '403', 'warehouse', '2016/7/28', '2016/09/07 15:46:21', '');
INSERT INTO `log` VALUES ('419', '404', 'warehouse', '2016/7/28', '2016/09/07 15:46:24', '');
INSERT INTO `log` VALUES ('420', '405', 'warehouse', '2016/7/28', '2016/09/07 15:46:27', '');
INSERT INTO `log` VALUES ('421', '406', 'warehouse', '2016/7/28', '2016/09/05 16:03:09', '');
INSERT INTO `log` VALUES ('422', '407', 'warehouse', '2016/7/28', '2016/09/07 15:46:31', '');
INSERT INTO `log` VALUES ('423', '408', 'warehouse', '2016/7/28', '2016/09/07 15:46:34', '');
INSERT INTO `log` VALUES ('424', '409', 'warehouse', '2016/7/28', '2016/09/07 15:46:38', '');
INSERT INTO `log` VALUES ('425', '410', 'warehouse', '2016/7/28', '2016/09/07 15:46:41', '');
INSERT INTO `log` VALUES ('426', '411', 'warehouse', '2016/7/28', '2016/09/07 15:46:44', '');
INSERT INTO `log` VALUES ('427', '412', 'warehouse', '2016/7/28', '2016/09/07 15:46:48', '');
INSERT INTO `log` VALUES ('428', '413', 'warehouse', '2016/7/28', '2016/09/08 15:41:38', '');
INSERT INTO `log` VALUES ('429', '414', 'warehouse', '2016/7/28', '2016/09/08 15:41:42', '');
INSERT INTO `log` VALUES ('430', '415', 'warehouse', '2016/7/28', '2016/09/09 09:51:32', '');
INSERT INTO `log` VALUES ('431', '416', 'warehouse', '2016/7/28', '2016/09/08 15:32:29', '');
INSERT INTO `log` VALUES ('432', '417', 'warehouse', '2016/7/28', '', '');
INSERT INTO `log` VALUES ('433', '418', 'baiwenke', '2016/08/22 11:28:17', '', '');
INSERT INTO `log` VALUES ('434', '419', 'yuanfanjie', '2016/08/22 11:32:55', '', '');
INSERT INTO `log` VALUES ('435', '420', 'sunjian', '2016/08/22 11:34:47', '', '');
INSERT INTO `log` VALUES ('436', '421', 'suguosong', '2016/08/22 15:13:45', '', '从北京带回来的（From Guangliang');
INSERT INTO `log` VALUES ('437', '254', 'shaoyi', '2016/08/22 18:41:51', '', '');
INSERT INTO `log` VALUES ('438', '154', 'fanghui', '2016/08/26 11:16:11', '', '请善待这个盒子');
INSERT INTO `log` VALUES ('439', '182', 'warehouse', '2016/08/26 11:43:19', '', 'RMS邮件测试 ');
INSERT INTO `log` VALUES ('440', '392', 'zhangzhiliang', '2016/08/27 17:19:59', '', '');
INSERT INTO `log` VALUES ('441', '383', 'zhangzhiliang', '2016/08/27 17:20:04', '', '');
INSERT INTO `log` VALUES ('442', '380', 'zhangzhiliang', '2016/08/27 17:20:08', '', '');
INSERT INTO `log` VALUES ('443', '382', 'zhangzhiliang', '2016/08/27 17:20:40', '', '');
INSERT INTO `log` VALUES ('444', '379', 'zhangzhiliang', '2016/08/27 17:20:44', '', '');
INSERT INTO `log` VALUES ('445', '14', 'geminxia', '2016/08/27 17:21:02', '', '新版亲见连接测服，申请一个测试手机跟连接正服的亲见做对比测试使用\r\n');
INSERT INTO `log` VALUES ('446', '277', 'libin', '2016/08/27 17:21:08', '', '');
INSERT INTO `log` VALUES ('447', '268', 'daichen', '2016/08/27 17:21:11', '', '');
INSERT INTO `log` VALUES ('448', '269', 'wubo', '2016/08/27 17:21:14', '', '吴波');
INSERT INTO `log` VALUES ('449', '273', 'heyunxian', '2016/08/27 17:21:18', '', '');
INSERT INTO `log` VALUES ('450', '363', 'wangjianjun', '2016/08/29 16:28:26', '2016/08/29 17:07:30', '手机号13952674168');
INSERT INTO `log` VALUES ('451', '364', 'wangjianjun', '2016/08/29 16:28:31', '2016/08/29 17:07:34', '手机号13952674168');
INSERT INTO `log` VALUES ('452', '55', 'zhangzhiliang', '2016/08/29 16:28:54', '', '');
INSERT INTO `log` VALUES ('453', '56', 'zhangzhiliang', '2016/08/29 16:29:01', '', '');
INSERT INTO `log` VALUES ('454', '57', 'zhangzhiliang', '2016/08/29 16:29:05', '', '');
INSERT INTO `log` VALUES ('455', '58', 'zhangzhiliang', '2016/08/29 16:29:08', '', '');
INSERT INTO `log` VALUES ('456', '214', 'zhanglin', '2016/08/29 16:29:12', '2016/09/09 10:46:09', '调试Game Server');
INSERT INTO `log` VALUES ('457', '51', 'geminxia', '2016/08/29 16:29:19', '', 'APP团队开发调试测试使用');
INSERT INTO `log` VALUES ('458', '264', 'xuyue', '2016/08/29 16:29:31', '', '����armstrong���һ̨');
INSERT INTO `log` VALUES ('459', '385', 'zhangzhiliang', '2016/08/29 16:29:36', '', '');
INSERT INTO `log` VALUES ('460', '152', 'warehouse', '2016/08/29 17:07:26', '', '方辉已经归还');
INSERT INTO `log` VALUES ('461', '363', 'warehouse', '2016/08/29 17:07:30', '2016/08/31 15:08:11', '');
INSERT INTO `log` VALUES ('462', '364', 'warehouse', '2016/08/29 17:07:34', '2016/08/31 15:08:15', '');
INSERT INTO `log` VALUES ('463', '381', 'wangjianjun', '2016/08/29 17:12:42', '', '刚才申请错误');
INSERT INTO `log` VALUES ('464', '384', 'wangjianjun', '2016/08/29 17:12:45', '', '刚才申请错误');
INSERT INTO `log` VALUES ('465', '174', 'xiaxingsuo', '2016/08/29 17:14:30', '', '锁哥的');
INSERT INTO `log` VALUES ('466', '48', 'gengshengen', '2016/08/29 17:35:21', '', '');
INSERT INTO `log` VALUES ('467', '253', 'gengshengen', '2016/08/29 17:35:27', '', '');
INSERT INTO `log` VALUES ('468', '203', 'warehouse', '2016/08/30 13:30:28', '', 'usb口损坏，已还给学可');
INSERT INTO `log` VALUES ('469', '210', 'wangkui', '2016/08/30 13:48:16', '', '用于PSTN Convertor测试和验证');
INSERT INTO `log` VALUES ('470', '213', 'lizheng', '2016/08/30 13:48:19', '2016/09/09 10:09:25', '功能验证使用');
INSERT INTO `log` VALUES ('471', '394', 'heyunxian', '2016/08/31 15:08:03', '', '用于voip volte 测试');
INSERT INTO `log` VALUES ('472', '395', 'heyunxian', '2016/08/31 15:08:07', '', '用于voip/volte 测试');
INSERT INTO `log` VALUES ('473', '363', 'shenxueke', '2016/08/31 15:08:11', '', '15695292212联通卡借给熙熙做fota测试，现在欠费申请充值一百元。');
INSERT INTO `log` VALUES ('474', '364', 'shenxueke', '2016/08/31 15:08:15', '', '15695292212卡借个熙熙做fota测试，目前欠费申请充值一百元。');
INSERT INTO `log` VALUES ('475', '422', 'warehouse', '2016/08/31 15:46:24', '', 'test');
INSERT INTO `log` VALUES ('479', '426', 'zhangzhiliang', '2016/08/31 16:49:04', '2016/09/09 14:10:58', '2016/8/31曾鹏寄给南京测试');
INSERT INTO `log` VALUES ('480', '427', 'shaoyi', '2016/09/02 10:19:20', '', '');
INSERT INTO `log` VALUES ('481', '140', 'warehouse', '2016/09/02 19:03:02', '2016/09/09 11:06:38', '标号61的已归还。');
INSERT INTO `log` VALUES ('482', '212', 'warehouse', '2016/09/02 19:05:19', '', 'USB口坏');
INSERT INTO `log` VALUES ('483', '386', 'shaoyi', '2016/09/05 16:02:38', '', '');
INSERT INTO `log` VALUES ('484', '387', 'shaoyi', '2016/09/05 16:02:42', '', '');
INSERT INTO `log` VALUES ('485', '400', 'zhangzhiliang', '2016/09/05 16:03:04', '', '');
INSERT INTO `log` VALUES ('486', '406', 'wubo', '2016/09/05 16:03:09', '', '18751858915  亲见');
INSERT INTO `log` VALUES ('487', '402', 'wubo', '2016/09/05 16:03:13', '', '18751858915 亲见');
INSERT INTO `log` VALUES ('488', '388', 'fanghui', '2016/09/05 16:03:21', '', 'Fanghui: 8/29和今天，两次远程支持威海营业厅复现问题和抓取log，通话时间较长，我个人的手机产生了几十块钱的费用，所以想申请一张面值50元的移动充值卡。望批准。\r\n\r\n\r\n\r\nLizheng:好的，没问题。需要在RMS系统里面提一个request哦。\r\n\r\n');
INSERT INTO `log` VALUES ('489', '389', 'gengshengen', '2016/09/05 16:03:30', '', '充值9904 sim卡');
INSERT INTO `log` VALUES ('490', '390', 'zhangzhiliang', '2016/09/05 16:49:18', '', '13912984168');
INSERT INTO `log` VALUES ('491', '391', 'zhangzhiliang', '2016/09/05 16:49:21', '', '13912984168   0830');
INSERT INTO `log` VALUES ('492', '393', 'zhangzhiliang', '2016/09/05 16:49:25', '', '18795892997   0902');
INSERT INTO `log` VALUES ('493', '396', 'zhangzhiliang', '2016/09/05 16:49:28', '', '13912996246   0902  \r\n');
INSERT INTO `log` VALUES ('494', '397', 'zhangzhiliang', '2016/09/05 16:49:31', '', '');
INSERT INTO `log` VALUES ('495', '398', 'zhangzhiliang', '2016/09/05 16:49:35', '', '');
INSERT INTO `log` VALUES ('496', '399', 'zhangzhiliang', '2016/09/05 16:49:38', '', '');
INSERT INTO `log` VALUES ('497', '428', 'shaoyi', '2016/09/06 10:57:09', '', '');
INSERT INTO `log` VALUES ('498', '429', 'warehouse', '2016/09/06 17:16:38', '2016/09/07 15:48:26', '');
INSERT INTO `log` VALUES ('499', '430', 'warehouse', '2016/09/06 17:18:58', '2016/09/07 15:48:29', '');
INSERT INTO `log` VALUES ('500', '431', 'warehouse', '2016/09/06 17:19:32', '2016/09/08 15:35:04', '');
INSERT INTO `log` VALUES ('501', '432', 'warehouse', '2016/09/06 17:19:54', '2016/09/08 15:32:13', '');
INSERT INTO `log` VALUES ('502', '433', 'warehouse', '2016/09/06 17:20:20', '2016/09/08 15:40:53', '');
INSERT INTO `log` VALUES ('503', '434', 'warehouse', '2016/09/06 17:20:46', '2016/09/08 15:42:24', '');
INSERT INTO `log` VALUES ('504', '435', 'warehouse', '2016/09/06 17:21:08', '2016/09/09 10:27:45', '');
INSERT INTO `log` VALUES ('505', '436', 'warehouse', '2016/09/06 17:21:37', '2016/09/14 11:37:10', '');
INSERT INTO `log` VALUES ('506', '437', 'warehouse', '2016/09/06 17:22:01', '2016/09/08 15:40:38', '');
INSERT INTO `log` VALUES ('507', '438', 'warehouse', '2016/09/06 17:22:31', '2016/09/08 15:32:00', '');
INSERT INTO `log` VALUES ('508', '439', 'warehouse', '2016/09/06 17:22:51', '2016/09/09 10:02:11', '');
INSERT INTO `log` VALUES ('509', '440', 'warehouse', '2016/09/06 17:23:30', '2016/09/09 10:02:07', '');
INSERT INTO `log` VALUES ('510', '441', 'warehouse', '2016/09/06 17:23:53', '2016/09/09 10:01:39', '');
INSERT INTO `log` VALUES ('511', '442', 'warehouse', '2016/09/06 17:24:24', '2016/09/08 15:35:42', '');
INSERT INTO `log` VALUES ('512', '443', 'warehouse', '2016/09/06 17:24:51', '2016/09/08 15:35:52', '');
INSERT INTO `log` VALUES ('513', '444', 'warehouse', '2016/09/06 17:25:14', '2016/09/08 15:39:21', '');
INSERT INTO `log` VALUES ('514', '445', 'warehouse', '2016/09/06 17:25:34', '2016/09/08 15:39:24', '');
INSERT INTO `log` VALUES ('515', '401', 'shenxueke', '2016/09/07 15:46:17', '', '13776610392国际漫游需要预充500元');
INSERT INTO `log` VALUES ('516', '403', 'shenxueke', '2016/09/07 15:46:21', '', '13776610392国际漫游需要预充500元');
INSERT INTO `log` VALUES ('517', '404', 'shenxueke', '2016/09/07 15:46:24', '', '13776610392国际漫游需要预充500元');
INSERT INTO `log` VALUES ('518', '405', 'shenxueke', '2016/09/07 15:46:27', '', '13776610392国际漫游需要预充500元');
INSERT INTO `log` VALUES ('519', '407', 'shenxueke', '2016/09/07 15:46:31', '', '13776610392国际漫游需要预充500元');
INSERT INTO `log` VALUES ('520', '408', 'shenxueke', '2016/09/07 15:46:34', '', '13776610392国际漫游需要预充500元');
INSERT INTO `log` VALUES ('521', '409', 'shenxueke', '2016/09/07 15:46:38', '', '13776610392国际漫游需要预充500元');
INSERT INTO `log` VALUES ('522', '410', 'shenxueke', '2016/09/07 15:46:41', '', '13776610392国际漫游需要预充500元');
INSERT INTO `log` VALUES ('523', '411', 'shenxueke', '2016/09/07 15:46:44', '', '13776610392国际漫游需要预充500元');
INSERT INTO `log` VALUES ('524', '412', 'shenxueke', '2016/09/07 15:46:48', '', '13776610392国际漫游需要预充500元');
INSERT INTO `log` VALUES ('525', '429', 'donggaole', '2016/09/07 15:48:26', '', '');
INSERT INTO `log` VALUES ('526', '430', 'xuxixi', '2016/09/07 15:48:29', '', '用于camera stress测试。 ');
INSERT INTO `log` VALUES ('527', '446', 'zhaobo', '2016/09/08 12:34:38', '2016/09/08 18:25:08', '2016/9/8寄到南京12台 A47');
INSERT INTO `log` VALUES ('528', '438', 'xiahui', '2016/09/08 15:32:00', '2016/09/09 14:08:54', '申请一台Armstrong验证bug，如果有其他team需要可以转出');
INSERT INTO `log` VALUES ('529', '432', 'zhengyanli', '2016/09/08 15:32:13', '', 'featurePM郑艳丽和陈伟共用一台');
INSERT INTO `log` VALUES ('530', '416', 'qixuewen', '2016/09/08 15:32:29', '', '手机号码 18851027946 ');
INSERT INTO `log` VALUES ('531', '431', 'zhangzhiliang', '2016/09/08 15:35:04', '', 'voip stability及performance 测试');
INSERT INTO `log` VALUES ('532', '442', 'zhangzhiliang', '2016/09/08 15:35:42', '', 'voip stability及performance 测试');
INSERT INTO `log` VALUES ('533', '443', 'zhangzhiliang', '2016/09/08 15:35:52', '', 'voip stability及performance 测试');
INSERT INTO `log` VALUES ('534', '444', 'zhangzhiliang', '2016/09/08 15:39:21', '', 'voip stability及performance 测试');
INSERT INTO `log` VALUES ('535', '445', 'zhangzhiliang', '2016/09/08 15:39:24', '', 'voip stability及performance 测试');
INSERT INTO `log` VALUES ('536', '437', 'zhangzhiliang', '2016/09/08 15:40:38', '', 'voip stability及performance 测试');
INSERT INTO `log` VALUES ('537', '433', 'liuzhiyuan', '2016/09/08 15:40:53', '', 'camera tuning 使用');
INSERT INTO `log` VALUES ('538', '413', 'wangjianjun', '2016/09/08 15:41:38', '', '手机号 18851027486');
INSERT INTO `log` VALUES ('539', '414', 'wangjianjun', '2016/09/08 15:41:42', '', '手机号 18851027486');
INSERT INTO `log` VALUES ('540', '434', 'lizheng', '2016/09/08 15:42:24', '', '调试使用');
INSERT INTO `log` VALUES ('541', '365', 'zhengyanli', '2016/09/08 15:47:14', '', '2016年9月申请');
INSERT INTO `log` VALUES ('542', '447', 'warehouse', '2016/09/08 16:07:07', '2016/09/09 14:27:21', '');
INSERT INTO `log` VALUES ('543', '448', 'warehouse', '2016/09/08 16:07:57', '2016/09/09 11:07:39', '');
INSERT INTO `log` VALUES ('544', '449', 'warehouse', '2016/09/08 16:08:34', '2016/09/09 11:09:14', '');
INSERT INTO `log` VALUES ('545', '450', 'warehouse', '2016/09/08 16:09:18', '2016/09/09 09:52:08', '');
INSERT INTO `log` VALUES ('546', '451', 'warehouse', '2016/09/08 16:09:49', '2016/09/09 14:27:09', '');
INSERT INTO `log` VALUES ('547', '452', 'warehouse', '2016/09/08 16:10:16', '2016/09/09 14:09:37', '');
INSERT INTO `log` VALUES ('548', '453', 'warehouse', '2016/09/08 16:10:40', '2016/09/09 14:09:08', '');
INSERT INTO `log` VALUES ('549', '454', 'warehouse', '2016/09/08 16:11:05', '2016/09/09 11:08:15', '');
INSERT INTO `log` VALUES ('550', '455', 'warehouse', '2016/09/08 16:11:31', '2016/09/09 14:26:46', '');
INSERT INTO `log` VALUES ('551', '456', 'warehouse', '2016/09/08 16:12:02', '2016/09/09 11:08:02', '');
INSERT INTO `log` VALUES ('552', '457', 'warehouse', '2016/09/08 16:12:20', '2016/09/09 11:29:28', '');
INSERT INTO `log` VALUES ('553', '446', 'qixuewen', '2016/09/08 18:25:08', '', '');
INSERT INTO `log` VALUES ('554', '415', 'qixuewen', '2016/09/09 09:51:32', '', '给18851027946号码充值');
INSERT INTO `log` VALUES ('555', '450', 'shaoyi', '2016/09/09 09:52:08', '', '音频调试');
INSERT INTO `log` VALUES ('556', '441', 'zhaobo', '2016/09/09 10:01:39', '', '');
INSERT INTO `log` VALUES ('557', '440', 'xiaxingsuo', '2016/09/09 10:02:07', '', '申请一台armStrong,用于开发');
INSERT INTO `log` VALUES ('558', '439', 'wubo', '2016/09/09 10:02:11', '2016/09/09 10:46:20', '亲见申请3太总共');
INSERT INTO `log` VALUES ('559', '213', 'wangqu', '2016/09/09 10:09:25', '2016/09/09 10:46:33', '');
INSERT INTO `log` VALUES ('560', '435', 'wubo', '2016/09/09 10:27:45', '', '亲见需要一台');
INSERT INTO `log` VALUES ('561', '214', 'warehouse', '2016/09/09 10:46:09', '', '');
INSERT INTO `log` VALUES ('562', '439', 'warehouse', '2016/09/09 10:46:20', '2016/09/09 14:27:26', '坏的机器归还已经。');
INSERT INTO `log` VALUES ('563', '213', 'warehouse', '2016/09/09 10:46:33', '2016/09/09 17:14:29', '归还入库，重新申请Armstrong机器');
INSERT INTO `log` VALUES ('564', '251', 'wangkai', '2016/09/09 11:05:08', '', '');
INSERT INTO `log` VALUES ('565', '140', 'wubo', '2016/09/09 11:06:38', '', '再次申请');
INSERT INTO `log` VALUES ('566', '448', 'daichen', '2016/09/09 11:07:39', '', '给刁伟申请');
INSERT INTO `log` VALUES ('567', '456', 'zhengyanli', '2016/09/09 11:08:02', '', '帮杨洋测试申请一台');
INSERT INTO `log` VALUES ('568', '454', 'wangjianjun', '2016/09/09 11:08:15', '', '全网通测试需要');
INSERT INTO `log` VALUES ('569', '449', 'houhaiying', '2016/09/09 11:09:14', '', 'for camera');
INSERT INTO `log` VALUES ('570', '457', 'zhengyanli', '2016/09/09 11:29:28', '', '帮闻伟伟申请测试使用');
INSERT INTO `log` VALUES ('571', '438', 'warehouse', '2016/09/09 14:08:54', '2016/09/14 11:37:16', '');
INSERT INTO `log` VALUES ('572', '453', 'shaoyi', '2016/09/09 14:09:08', '', '中科胡莉莉测试需要');
INSERT INTO `log` VALUES ('573', '452', 'zhanglin', '2016/09/09 14:09:37', '', 'for debug');
INSERT INTO `log` VALUES ('574', '426', 'daichen', '2016/09/09 14:10:58', '', '编号12');
INSERT INTO `log` VALUES ('575', '455', 'shaoyi', '2016/09/09 14:26:46', '', '中科胡莉莉使用');
INSERT INTO `log` VALUES ('576', '451', 'baiwenke', '2016/09/09 14:27:09', '', '');
INSERT INTO `log` VALUES ('577', '447', 'heyunxian', '2016/09/09 14:27:21', '', '');
INSERT INTO `log` VALUES ('578', '439', 'xiahui', '2016/09/09 14:27:26', '2016/09/14 12:42:10', '');
INSERT INTO `log` VALUES ('579', '261', 'liulinxiang', '2016/09/09 14:43:34', '2016/09/14 11:10:38', '编号27');
INSERT INTO `log` VALUES ('580', '262', 'jiyue', '2016/09/09 14:44:24', '', '编号36');
INSERT INTO `log` VALUES ('581', '213', 'wangqu', '2016/09/09 17:14:29', '', '刚刚表哥拿过来的那台Discovery，补一下申请。');
INSERT INTO `log` VALUES ('582', '198', 'warehouse', '2016/09/12 13:10:12', '', '');
INSERT INTO `log` VALUES ('583', '175', 'shenxueke', '2016/09/12 13:32:45', '', '');
INSERT INTO `log` VALUES ('584', '458', 'wangkui', '2016/09/12 15:20:09', '', '');
INSERT INTO `log` VALUES ('585', '261', 'zhangdiping', '2016/09/14 11:10:38', '', '');
INSERT INTO `log` VALUES ('586', '436', 'shenxueke', '2016/09/14 11:37:10', '', '');
INSERT INTO `log` VALUES ('587', '438', 'liulinxiang', '2016/09/14 11:37:16', '', '');
INSERT INTO `log` VALUES ('588', '42', 'gaoweixing', '2016/09/14 12:42:05', '', 'Armstrong');
INSERT INTO `log` VALUES ('589', '439', 'gaoweixing', '2016/09/14 12:42:10', '', 'NJ-AS-47, core team meeting');

-- ----------------------------
-- Table structure for purchase_application
-- ----------------------------
DROP TABLE IF EXISTS `purchase_application`;
CREATE TABLE `purchase_application` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `user` varchar(255) NOT NULL DEFAULT '' COMMENT '发起申购请求的的用户',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '物品名称',
  `number` varchar(255) NOT NULL DEFAULT '' COMMENT '物品数量',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '申购描述',
  `time` varchar(255) NOT NULL DEFAULT '' COMMENT '申请时间',
  `flow` int(11) NOT NULL COMMENT '申购流程',
  `step` int(11) NOT NULL DEFAULT '1' COMMENT '申购所处步骤（申请创建时位于流程的第一步）',
  `finished` int(11) NOT NULL DEFAULT '0' COMMENT '申请是否处理结束（0：未结束；1：结束）',
  `refused` int(11) NOT NULL DEFAULT '0' COMMENT '申请是否被拒绝（0：未被拒绝，1：被拒绝）',
  PRIMARY KEY (`id`),
  KEY `flow` (`flow`),
  CONSTRAINT `purchase_application_ibfk_1` FOREIGN KEY (`flow`) REFERENCES `flow` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of purchase_application
-- ----------------------------
INSERT INTO `purchase_application` VALUES ('1', 'geminxia', 'NETGEAR R6220 1200M 双频千兆无线路由器', '1', '亲见APP团队开发调试测试使用,请批准。\r\n\r\n\r\n购买链接：http://product.suning.com/0000000000/131246154.html   京东无货，苏宁有', '2016/08/25 11:21:17', '1', '2', '1', '0');
INSERT INTO `purchase_application` VALUES ('2', 'shaoyi', '铁三角 ATR2500 心形指向性电容式话筒', '1', 'https://item.jd.com/1188239.html', '2016/08/26 20:04:01', '1', '2', '1', '0');
INSERT INTO `purchase_application` VALUES ('3', 'shaoyi', '录音外置声卡', '1', 'https://item.taobao.com/item.htm?spm=a230r.1.14.16.s5kZsy&id=13616706354&ns=1&abbucket=14#detail', '2016/08/26 20:04:47', '1', '2', '1', '0');
INSERT INTO `purchase_application` VALUES ('4', 'shaoyi', '数字式分贝仪', '1', 'http://item.jd.com/1590028846.html', '2016/08/26 20:07:52', '1', '2', '1', '0');
INSERT INTO `purchase_application` VALUES ('5', 'zhangzhiliang', '中国移动SIM卡', '6', '南京voip及volte测试团队增加三人（6个设备），目前只有两张sim卡，需要再申请6张', '2016/08/29 18:23:51', '1', '2', '1', '0');
INSERT INTO `purchase_application` VALUES ('6', 'qixuewen', '移动充值卡50元', '2', '为18851027946的手机号码充值', '2016/09/06 14:56:21', '1', '2', '0', '0');
INSERT INTO `purchase_application` VALUES ('7', 'huashasha', '  LG Nexus 5X Google 谷歌亲儿子 原生安卓6.0', '1', 'http://item.jd.hk/1956225225.html\r\n\r\n自动化测试申请（放机房），原生google，也可做对比机，各种用途', '2016/09/14 17:12:45', '1', '1', '0', '0');

-- ----------------------------
-- Table structure for purchase_application_approval
-- ----------------------------
DROP TABLE IF EXISTS `purchase_application_approval`;
CREATE TABLE `purchase_application_approval` (
  `application_id` int(11) NOT NULL COMMENT '申请标识',
  `step` int(11) NOT NULL COMMENT '所处步骤',
  `reviewer` varchar(255) NOT NULL COMMENT '审核人',
  `approve` int(11) NOT NULL COMMENT '是否同意（0：同意；1：不同意）',
  `time` varchar(255) NOT NULL DEFAULT '' COMMENT '审核时间',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`application_id`,`step`),
  CONSTRAINT `purchase_application_approval_ibfk_1` FOREIGN KEY (`application_id`) REFERENCES `purchase_application` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of purchase_application_approval
-- ----------------------------
INSERT INTO `purchase_application_approval` VALUES ('1', '1', 'lizheng', '0', '2016/08/26 20:07:33', '');
INSERT INTO `purchase_application_approval` VALUES ('1', '2', 'shenxueke', '0', '2016/08/27 17:26:06', '');
INSERT INTO `purchase_application_approval` VALUES ('2', '1', 'lizheng', '0', '2016/08/26 20:07:40', '');
INSERT INTO `purchase_application_approval` VALUES ('2', '2', 'shenxueke', '0', '2016/08/29 19:29:50', '');
INSERT INTO `purchase_application_approval` VALUES ('3', '1', 'lizheng', '0', '2016/08/26 20:07:46', '');
INSERT INTO `purchase_application_approval` VALUES ('3', '2', 'shenxueke', '0', '2016/08/29 19:29:55', '');
INSERT INTO `purchase_application_approval` VALUES ('4', '1', 'lizheng', '0', '2016/08/26 20:07:56', '');
INSERT INTO `purchase_application_approval` VALUES ('4', '2', 'shenxueke', '0', '2016/08/29 19:30:00', '');
INSERT INTO `purchase_application_approval` VALUES ('5', '1', 'lizheng', '0', '2016/08/29 18:33:58', '');
INSERT INTO `purchase_application_approval` VALUES ('5', '2', 'shenxueke', '0', '2016/08/29 19:30:09', '');
INSERT INTO `purchase_application_approval` VALUES ('6', '1', 'lizheng', '0', '2016/09/08 15:30:31', '');

-- ----------------------------
-- Table structure for resource
-- ----------------------------
DROP TABLE IF EXISTS `resource`;
CREATE TABLE `resource` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `name` varchar(255) DEFAULT '' COMMENT '资产名',
  `model` varchar(255) DEFAULT '' COMMENT '资产型号',
  `trackingNo` varchar(255) DEFAULT '' COMMENT '追踪码',
  `trackingNo2` varchar(255) DEFAULT '' COMMENT '外借设备追踪码',
  `IMEI` varchar(255) DEFAULT '' COMMENT '移动设备标识',
  `serialNo` varchar(255) DEFAULT '' COMMENT '设备序列号',
  `entryDate` varchar(255) DEFAULT '' COMMENT '入库日期',
  `owner` varchar(255) DEFAULT '' COMMENT '资产当前拥有者',
  `status` int(11) DEFAULT '0' COMMENT '资产状态：0：正常；1：损坏；2：资产被消耗；3：资产外借',
  `remark` varchar(255) DEFAULT '' COMMENT '资产备注',
  `type` int(11) NOT NULL COMMENT '资产类型',
  `phoneNumber` varchar(255) DEFAULT '' COMMENT '手机号码（SIM卡号码或是充值卡充值号码）',
  `purchaser` varchar(255) DEFAULT '' COMMENT '资产购买人',
  `IMSI` varchar(255) DEFAULT '' COMMENT 'SIM卡标识码',
  `package` varchar(255) DEFAULT '' COMMENT 'SIM卡套餐',
  `password` varchar(255) DEFAULT '' COMMENT 'SIM卡密码',
  `param1` varchar(255) DEFAULT '' COMMENT '备用字段1',
  `param2` varchar(255) DEFAULT '' COMMENT '备用字段2',
  `param3` varchar(255) DEFAULT '' COMMENT '备用字段3',
  `param4` varchar(255) DEFAULT '' COMMENT '备用字段4',
  `param5` varchar(255) DEFAULT '' COMMENT '备用字段5',
  PRIMARY KEY (`id`),
  KEY `TYPE` (`type`),
  CONSTRAINT `resource_ibfk_1` FOREIGN KEY (`type`) REFERENCES `type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=459 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of resource
-- ----------------------------
INSERT INTO `resource` VALUES ('1', 'iphone6S', 'iphone 6S 16G A1700 银白', 'NJ-iphone-01', '', '352098071766776', '', '2016/3/22', 'zhangzhiliang', '0', '手机亲见app', '18', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('2', '三星S6', 'samsung galaxy S6 32G SM-G9200 冰玉蓝', 'NJ-samsung-01', '', '358108068130888', '', '2016/3/22', 'heyunxian', '0', '', '18', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('3', '三星Note5', 'samsung galaxy Note5 32G SM-N9200 雪晶白', 'NJ-samsung-02', '', '352575071904481', '', '2016/3/22', 'wangjianjun', '0', 'VOLTE', '18', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('4', '华为荣耀7', 'huawei honor7 16G PLK-UL00双卡 冰河银', 'NJ-huawei-01', '', '866947027186886;866947027562557', '', '2016/3/22', 'donggaole', '0', '手机亲见app', '18', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('5', '魅族MX5', 'meizu MX5 16G M575 灰色', 'NJ-meizu-01', '', '867283212224988', '', '2016/3/22', 'wubo', '0', '手机亲见APP', '18', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('6', '小米5', 'xiaomi5 64G 双卡 白色', 'NJ-xiaomi-01', '', '868030023540527', '', '2016/4/11', 'wangjianjun', '0', 'VOLTE', '18', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('7', 'WiFI Display Box', 'MiraCast& Airplay', 'NJ-WDB-01', '', '', '', '2016/03/22 15:08:23', 'zhoudong', '0', '带到北京', '23', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('8', '索尼手机', 'Best sonny 512M L82双卡 白色', 'NJ-Bestsonny-01', '', '8655120224377030', '', '2016/4/20', 'xuxixi', '0', '非公司资产，李彬', '18', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('9', 'WiFI Display 无线投屏', 'MiraCast& Airplay', 'NJ-WD-01', '', '', '', '2016/07/29 15:11:19', 'warehouse', '0', '只支持2.4G', '23', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('10', 'iphone6', 'iphone 6 16G A1586 银白', 'NJ-iphone-02', '', '354434068178121', '', '2016/6/17', 'wubo', '0', '', '18', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('11', '中国移动N1 Max', 'M823 星空灰', 'NJ-yidong_01', '', '868375020954944', '', '2016/6/24', 'wangjianjun', '0', '', '18', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('12', 'NetGear WiFi Display无线投屏', 'PTV3000', 'NJ-PTV-01', '', '', '3X0148NS000CE', '2016/07/29 15:12:38', 'xuxixi', '0', '同时支持2.4G和5G投屏，经常投屏一小时信号发射会主动中断一次', '23', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('13', '红米Note3', '红米Note3 3GB内存 32GB 经典金色', 'NJ-xiaomi-02', '', '861374034587607', '', '2016/6/28', 'huashasha', '0', '', '18', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('14', '华为荣耀V8', 'KNT-AL20香槟金', 'NJ-huawei-02', '', '869395023255817', '', '2016/6/29', 'geminxia', '0', '', '18', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('15', '华为P9', '华为P9 64G 陶瓷白', 'NJ-huawei-03', '', '861757036994997', '', '2016/7/3', 'chenyang', '0', '', '18', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('16', '小米5', '小米5 64G 白色', 'NJ-xiaomi-03', '', '868930025452722', '', '2016/7/3', 'xuyue', '0', '', '18', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('17', 'DELL 商用台式机', 'OPTIPLEX 9020', 'NJ-P-PC-01', '', '', '服务编号 8K6YL82;快速服务代码 18635273714', '2016/1/27', 'shaoyi', '0', '', '13', null, null, null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('18', 'DELL 商用台式机', 'OPTIPLEX 9020', 'NJ-P-PC-02', '', '', '服务编号 8K63K82;快速服务代码 18633826082', '2016/1/27', 'shaoyi', '0', '', '13', null, null, null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('19', 'iMAC', '', 'NJ-iMAC-01', '', '', '888462479042', '2016/3/17', 'shaoyi', '0', '', '13', null, null, null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('20', 'MAC mini', '', 'NJ-MACmini-01', '', '', '885909955022', '2016/3/17', 'shaoyi', '0', '', '13', null, null, null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('21', '中国联通小卡', '', '', '', '', '', '2016/3/23', 'xuxixi', '0', '流量卡，半年有效', '7', '14526021680', '', '86860,11683,40003,7363L', '6个月19G，无通话功能，有效期半年', '汪曲151118', '', '', '', '', '');
INSERT INTO `resource` VALUES ('22', 'DELL 显示器', '', 'NJ-P-LCD-01', '', '', 'JCQ-0071401E22PE00H33-159805057-A', '2016/1/27', 'shaoyi', '0', '', '14', null, null, null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('23', 'DELL 显示器', '', 'NJ-P-LCD-02', '', '', 'JCQ-0071401E22PE00H33-159Y01455-A', '2016/1/27', 'shaoyi', '0', '', '14', null, null, null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('24', 'DELL 显示器', 'E2014H', 'NJ-P-LCD-03', '', '', 'CN-011HFV-72872-58D-AJ9L', '', 'warehouse', '0', '', '14', null, null, null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('25', '中国联通中卡', '', '', '', '', '', '2016/3/23', 'xuxixi', '0', '流量卡，半年有效，2016/7/19流量用完注销', '7', '14526019368', '', '8986,0115,8340,3343,690N', '6个月19G，无通话功能，有效期半年', '汪曲151118', '', '', '', '', '');
INSERT INTO `resource` VALUES ('26', 'DELL键盘', 'KB212-B', 'NJ-P-KB-01', '', '', 'CN-0DJ365-71616-5AE-0BMF-A00', '2016/1/27', 'shaoyi', '0', '', '24', null, null, null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('27', 'DELL键盘', 'KB212-B', 'NJ-P-KB-02', '', '', 'CN-0DJ365-71616-5A8-19HI-A00', '2016/1/27', 'shaoyi', '0', '', '24', null, null, null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('28', '中国移动中卡', '', '', '', '', '', '2016/3/23', 'wangjianjun', '0', 'VOLTE', '7', '13913027976', '', '15778.00384.0377', '50元1G，18元50分钟，返30元/前3个月，返2G/前6个月', '汪曲151118', '', '', '', '', '');
INSERT INTO `resource` VALUES ('29', 'DELL键盘', 'KB213-B', 'NJ-P-KB-03', '', '', 'CN-0N291F-71581-594-02JF', '', 'warehouse', '0', '', '24', null, null, null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('30', '中国移动小卡', '', '', '', '', '', '2016/3/23', 'wangjianjun', '0', 'VOLTE+多方', '7', '13912996246', '', '10169.14000.60960.40000', '50元1G，18元50分钟，返30元/前3个月，返2G/前6个月', '汪曲151118', '', '', '', '', '');
INSERT INTO `resource` VALUES ('31', '中国移动中卡', '', '', '', '', '', '早期', 'qixuewen', '0', 'VOLTE+多方', '7', '18851027946', '', '10157.70002.05841.70000', '70元2G，28元100分钟，返20元/前12个月', '王健军', '', '', '', '', '');
INSERT INTO `resource` VALUES ('32', '中国移动中卡', '', '', '', '', '', '早期', 'wangjianjun', '0', 'VOLTE+多方', '7', '18851027486', '', '10157.70002.05841.80000', '70元2G，28元100分钟，返20元/前12个月', '王健军', '', '', '', '', '');
INSERT INTO `resource` VALUES ('33', '中国移动中卡', '', '', '', '', '', '早期', 'houhaiying', '0', '', '7', '13951674168', '', '15778.00387.7104', '50元1G，28元100分钟，返20元/前6个月，返1G，每月至少通话10分钟', '范莉莉', '', '', '', '', '');
INSERT INTO `resource` VALUES ('34', '中国移动小卡', '', '', '', '', '', '早期', 'wubo', '0', '', '7', '18751858915', '', '10157.75002.91971.60000', '40元700M，88元500分钟，返30元/6个月', '纪跃107011', '', '', '', '', '');
INSERT INTO `resource` VALUES ('35', '中国移动中卡', '', '', '', '', '', '早期', 'wangqu', '0', 'VOLTE', '7', '13912984268', '', '15778.00387.7106', '50元1G，28元100分钟，返20元/前6个月，返1G，每月至少通话10分钟', '纪跃', '', '', '', '', '');
INSERT INTO `resource` VALUES ('36', '中国移动中卡', '', '', '', '', '', '早期', 'tanhongyan', '0', 'VOLTE', '7', '18751883385', '', '10157.70004.25666.20000', '500M，500分钟，118元', '祁学文151118', '', '', '', '', '');
INSERT INTO `resource` VALUES ('37', '中国移动中卡', '', '', '', '', '', '2016/6/28', 'donggaole', '0', '', '7', '13912984168', '', '15778.00387.7105', '70元2G，28元100分钟', '纪跃103020', '', '', '', '', '');
INSERT INTO `resource` VALUES ('38', '中国联通', '', '', '', '', '', '早期', 'shenxueke', '0', '', '7', '15695292212', '', '89860.11583.40427.7454L', '500M，500分钟，88元', '祁学文', '', '', '', '', '');
INSERT INTO `resource` VALUES ('39', '中国联通小卡', '', '', '', '', '', '早期', 'warehouse', '0', '欠费', '7', '15695291951', '', '89860.11583.40438.4489J', '24元500M，56元500分钟，6元来电显示			', '纪跃', '', '', '', '', '');
INSERT INTO `resource` VALUES ('40', '中国移动中卡', '', '', '', '', '', '2016/5/30', 'warehouse', '3', 'VOLTE\r\n外借至迪士尼', '7', '15261499792', '', '10157.70002.07081.70000', '18元，100M流量，通话0.2元/分钟，5元全国漫游，30元500M			', '耿胜恩123321', '', '', '', '', '');
INSERT INTO `resource` VALUES ('41', '中国移动中卡', '', '', '', '', '', '2016/5/30', 'libin', '0', 'VOLTE', '7', '15190489904', '', '10157.70002.07081.80000', '18元，100M流量，通话0.2元/分钟			', '耿胜恩123321', '', '', '', '', '');
INSERT INTO `resource` VALUES ('42', '中国移动小卡', '', '', '', '', '', '2016/5/31', 'gaoweixing', '0', 'VOLTE', '7', '15050566531', '', '10169.14000.96719.60000', '', '朱云霞', '', '', '', '', '');
INSERT INTO `resource` VALUES ('43', '中国移动小卡', '', '', '', '', '', '2016/6/1', 'xuxixi', '0', 'VOLTE\r\n', '7', '15950498532', '', '10169.14001.06103.40000', '18元100M流量			', '沈学可121311', '', '', '', '', '');
INSERT INTO `resource` VALUES ('44', '中国移动中卡', '', '', '', '', '', '2016/6/28', 'lizheng', '3', 'VOLTE\r\n', '7', '13770335547', '', '10147.75029.53691.80000', '18元100M流量			', '沈学可121311', '', '', '', '', '');
INSERT INTO `resource` VALUES ('45', '中国移动中卡', '', '', '', '', '', '2016/6/28', 'lizheng', '3', 'VOLTE\r\n', '7', '13776610392', '', '10147.75029.53691.90000', '18元100M流量			', '沈学可121311', '', '', '', '', '');
INSERT INTO `resource` VALUES ('46', '中国移动中卡', '', '', '', '', '', '2016/7/20', 'heyunxian', '0', 'VOLTE\r\n', '7', '13400060945', '', '10169.15001.48179.60000', '18元100M流量（48返30）			', '徐熙熙', '', '', '', '', '');
INSERT INTO `resource` VALUES ('47', 'CISCO 路由器', 'RV325', 'NJ-P-R-01', '', '', 'NKS17472012', '2016/1/27', 'shaoyi', '0', '', '15', null, null, null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('48', '中国电信', '', '', '', '', '', '2016/8/15', 'gengshengen', '0', '已充值500元\r\n', '7', '17361851213', '', '8986 0316 2402 5313 231H Q', '99元 1G 300分钟			', '无', '', '', '', '', '');
INSERT INTO `resource` VALUES ('49', 'HUAWEI 路由器', 'MT-ViKi 8口智能USB2.0KVM切换器', 'NJ-P-R-02', '', '', 'D46AA8856356-58(3)', '2016/1/27 17:02:11', 'shaoyi', '0', '', '15', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('50', 'HUAWEI 无线局域网接入点（白色）', 'AP6010DN-AGN', 'NJ-P-AP-01', '', '', '21023541Q6W0EA005102', '2016/7/29 17:03:13', 'warehouse', '0', '测试（北边吧台）', '15', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('51', 'NETGEAR AC1200智能无线路由器', 'R6220', 'NJ-AC-01', '', '', '2C3033237738', '2016/7/29 17:04:14', 'geminxia', '0', '会议室', '15', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('52', 'TP-LinkAC900双频无线路由器', 'TL-WDR5600', 'NJ-AC-02', '', '', '1166253027339,8ca6df93f863', '2016/7/21 17:04:50', 'yongxiaowen', '0', '', '15', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('53', 'TP-Link 450M无线路由器', 'TL-WR886N', 'NJ-AC-03', '', '', '1166492016462，8ca6dfa6866b', '2016/7/28 17:06:35', 'xiaxingsuo', '0', '', '15', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('54', 'NETGEAR路由器', 'NETGEAR（R6220)', 'NJ-AC-04', '', '', '2C3033325480', '2016/8/17 17:07:18', 'huashasha', '0', '放在机房', '15', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('55', '中国电信', '', '', '', '', '', '2016/8/15', 'zhangzhiliang', '0', '已充值500元\r\n', '7', '17361850565', '', '8987 0316 2402 5313 235H Q', '99元 1G 300分钟			', '无', '', '', '', '', '');
INSERT INTO `resource` VALUES ('56', '中国电信', '', '', '', '', '', '2016/8/15', 'zhangzhiliang', '0', '已充值500元\r\n', '7', '17361854909', '', '8988 0316 2402 5313 233H Q', '99元 1G 300分钟			', '无', '', '', '', '', '');
INSERT INTO `resource` VALUES ('57', '中国电信', '', '', '', '', '', '2016/8/15', 'zhangzhiliang', '0', '已充值500元\r\n', '7', '17361856761', '', '8989 0316 2402 5313 234H Q', '99元 1G 300分钟			', '无', '', '', '', '', '');
INSERT INTO `resource` VALUES ('58', '中国电信', '', '', '', '', '', '2016/8/15', 'zhangzhiliang', '0', '已充值500元\r\n', '7', '17361851149', '', '8990 0316 2402 5313 232H Q', '99元 1G 300分钟			', '无', '', '', '', '', '');
INSERT INTO `resource` VALUES ('59', '中国电信', '', '', '', '', '', '2016/8/15', 'warehouse', '0', '已充值500元\r\n', '7', '17361859294', '', '8991 0316 2402 5313 236H Q', '99元 1G 300分钟			', '无', '', '', '', '', '');
INSERT INTO `resource` VALUES ('60', '金士顿SD卡', '16G', '', '', '', '', '2016/4/18', 'lijianzhong', '0', '党宁寄,已寄回北京', '19', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('61', '闪迪SD卡', '16G', '', '', '', '', '2016/4/18', 'lijianzhong', '0', '党宁寄,已寄回北京', '19', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('62', '金士顿SD卡', '16G', '', '', '', '', '早期', 'houhaiying', '0', '非公司资产，Holly', '19', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('63', 'OV SD卡', '32G', '', '', '', '', '早期', 'xuxixi', '0', '朱云霞机器', '19', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('64', '闪迪SD卡', '32G', '', '', '', '', '2016/6/23', 'jiyue', '0', '申购产品', '19', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('65', '三星蓝牙耳机MG900', '1287036白色', 'BTE-01', '', '', '', '2016/4/13', 'tanhongyan', '0', '', '20', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('66', '小米蓝牙耳机LYEJ01LM', 'ZBW4140CN白色', 'BTE-02', '', '', '', '2016/4/13', 'chenzilong', '0', '', '20', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('67', '索尼蓝牙耳机MBH20', 'BDA44746CFC0A50白色', 'BTE-03', '', '', '', '2016/4/13', 'chenzilong', '0', '', '20', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('68', '华为荣耀蓝牙耳机AM07', '2015DP2606白色', 'BTE-04', '', '', '', '2016/4/15', 'chenzilong', '0', '', '20', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('69', '罗技USB耳机麦克风', 'h340黑色1614ALC02868', 'BTE-05', '', '', '', '2016/6/23', 'tanhongyan', '0', '申购产品\r\n', '20', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('70', 'padmate蓝牙手柄', '底座(-A)+手柄(-B)', 'BTH-01-A，BTH-01-B', '', '', '', '2016/4/14', 'qixuewen', '0', '', '20', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('71', 'padmate蓝牙手柄', '底座(-A)+手柄(-B)', 'BTH-02-A，BTH-02-B', '', '', '', '2016/4/14', 'chenzilong', '0', '', '20', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('72', 'padmate蓝牙手柄', '底座(-A)+手柄(-B)', 'BTH-02-A，BTH-03-B', '', '', '', '2016/4/15', 'chenzilong', '0', '', '20', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('73', '漫步者耳塞式手机耳机', 'H180P 白色', 'EP-01', '', '', '', '2016/6/23', 'tanhongyan', '0', '申购产品\r\n', '20', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('74', '漫步者耳塞式手机耳机', 'H180P 白色', 'EP-02', '', '', '', '2016/6/23', 'tanhongyan', '0', '申购产品\r\n', '20', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('75', 'iphone数据线', '白色', '', '', '', '', '2016/6/30', 'sunjian', '0', '', '20', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('76', 'iphone数据线', '白色', '', '', '', '', '2016/6/30', 'sunjian', '0', '', '20', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('77', 'iphone数据线', '白色', '', '', '', '', '2016/6/30', 'sunjian', '0', '', '20', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('78', 'Kingston存储卡', '8G，80MB/s', '', '', '', '', '2016/7/19', 'donggaole', '0', '测试使用\r\n', '20', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('79', 'SanDisk存储卡', '8G，class4', '', '', '', '', '2016/7/19', 'warehouse', '0', '', '20', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('80', 'DELL服务器', 'PoweEdge R730', 'NJ-P-SE-01', '', '', 'CN-00CMMN-42945-5B1-015E-A02', '2016/1/27', 'shaoyi', '0', ' ', '17', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('81', 'DELL服务器', 'PowerEdge T20', 'NJ-P-SE-02', '', '', '33140564282', '2016/5/23', 'zhanglin', '0', ' ', '17', null, null, null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('82', 'HUAWEI 交换机', 'Quidway S1700-8-AC', 'NJ-P-SW-01', '', '', '21989194548YFB005897 Y S1700-8-AC', '1/27/16', 'shaoyi', '0', ' ', '16', null, null, null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('83', 'HUAWEI 交换机', 'S5700S', 'NJ-P-SW-02', '', '', '21023538368YF2002388 Y S 5700S-28P-LI-AC', '1/27/16', 'shaoyi', '0', ' ', '16', null, null, null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('84', 'TP-LINK交换机', 'TL-SF1048S', 'NJ-P-SW-03', '', '', '1159442002222', '', 'warehouse', '0', ' ', '16', null, null, null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('85', 'H3C 交换机', 'SMB-81224V2', 'NJ-P-SW-04', '', '', '219801A0FB915BQ01084 Y2 A2', '', 'warehouse', '0', ' ', '16', null, null, null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('86', 'Synology', 'Rackstation RS815+', 'NJ-P-F-02', '', '', '15B0MRN639000', '1/27/16', 'shaoyi', '0', ' ', '17', null, null, null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('87', 'WD', 'MyBook', 'NJ-P-F-01', '', '', 'WCC4N2VAURXE', '1/27/16', 'shaoyi', '0', ' ', '25', null, null, null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('88', 'APC SMART-UPS 3000VA', 'SUA3000R21CH', 'NJ-P-UPS-01', '', '', 'US1545100206', '1/27/16', 'shaoyi', '0', ' ', '25', null, null, null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('89', '欧声美', '', 'NJ-P-LP', '', '', '', '', 'warehouse', '0', ' ', '25', null, null, null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('90', '三括机柜', '', 'NJ-P-MC-01', '', '', '', '', 'warehouse', '0', ' ', '25', null, null, null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('91', '三括机柜', '', 'NJ-P-MC-02', '', '', '', '', 'warehouse', '0', ' ', '25', null, null, null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('92', '三括机柜', '', 'NJ-P-MC-03', '', '', '', '', 'warehouse', '0', ' ', '25', null, null, null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('93', '三星DVD Writer', 'SE-208', 'NJ-DW-01', '', '', 'SE-208GB/CHBS', '2/29/16', 'shaoyi', '0', ' ', '25', null, null, null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('94', 'MT-ViKi 8口智能USB2.0KVM切换器', 'MT-ViKi 8口智能USB2.0KVM切换器', 'NJ-KS-01', '', '', '6931626401237', '2/29/16', 'shaoyi', '0', ' ', '25', null, null, null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('95', 'Kingston读卡器', 'USB2.0', '', '', '', '', '2016/7/19', 'xuxixi', '0', '测试使用\r\n', '20', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('96', '绿联 音频线3.5转双莲花头', '2米', '', '', '', '', '2016/7/19', 'warehouse', '0', '亲粉会使用\r\n', '20', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('97', 'PHILIPS hue personal wireless Lighting', '(一个无线桥接器和三个灯泡）6947939113163', 'PH-Light-01', '', '', '', '2016/8/8', 'chenzilong', '0', '', '20', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('98', '加长梅花六角扳手（九件套）', '6951325436941 ', '', '', '', '', '2016/8/8', 'zhaobo', '0', '', '20', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('99', 'PHILIPS Accessories(Dimmer swith/Gradateur)', '46677458157', 'PH-Light-Acc-01', '', '', '', '2016/8/12', 'chenzilong', '0', '', '20', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('100', 'Zigbee USB Dongle', '', 'USB-01', '', '', '', '2016/8/15', 'warehouse', '0', '', '20', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('101', '移动100元充值卡', '', '', '', '', '', '早期', 'wangqu', '2', '', '8', '18751858915', 'wangjianjun', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('102', '移动100元充值卡', '', '', '', '', '', '早期', 'wangqu', '2', '', '8', '13912984168', 'wangjianjun', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('103', '移动50元充值卡', '', '', '', '', '', '2016/3/23', 'heyunxian', '2', '', '8', '13812984168', 'wangqu', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('104', '移动50元充值卡', '', '', '', '', '', '2016/3/23', 'heyunxian', '2', '', '8', '13812984168', 'wangqu', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('105', '移动50元充值卡', '', '', '', '', '', '2016/3/23', 'wubo', '2', '', '8', '18751858915', 'wangqu', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('106', '移动50元充值卡', '', '', '', '', '', '2016/3/23', 'wubo', '2', '', '8', '18751858915', 'wangqu', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('107', '移动50元充值卡', '', '', '', '', '', '2016/3/23', 'tanhongyan', '2', '', '8', '13912984268', 'wangqu', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('108', '移动50元充值卡', '', '', '', '', '', '2016/3/23', 'qixuewen', '2', '', '8', '18751883385', 'wangqu', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('109', '移动50元充值卡', '', '', '', '', '', '2016/3/23', 'qixuewen', '2', '', '8', '18751883385', 'wangqu', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('110', '移动50元充值卡', '', '', '', '', '', '2016/3/23', 'donggaole', '2', '', '8', '13951674168', 'wangqu', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('111', '移动50元充值卡', '', '', '', '', '', '2016/3/23', 'donggaole', '2', '', '8', '13951674168', 'wangqu', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('112', '移动50元充值卡', '', '', '', '', '', '2016/3/23', 'donggaole', '2', '', '8', '13951674168', 'wangqu', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('113', '移动100元充值卡', '', '', '', '', '', '2016/4/22', 'donggaole', '2', '', '8', '13913027976', 'xiahui', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('114', '移动100元充值卡', '', '', '', '', '', '2016/4/22', 'tanhongyan', '2', '', '8', '18751883385', 'xiahui', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('115', '移动100元充值卡', '', '', '', '', '', '2016/4/22', 'wangjianjun', '2', '', '8', '13912984168', 'xiahui', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('116', '移动100元充值卡', '', '', '', '', '', '2016/4/22', 'wubo', '2', '', '8', '18951858915', 'xiahui', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('117', '移动100元充值卡', '', '', '', '', '', '2016/4/22', 'wangjianjun', '2', '', '8', '18851027486', 'xiahui', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('118', '移动100元充值卡', '', '', '', '', '', '2016/4/22', 'wangqu', '2', '', '8', '13912984268', 'xiahui', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('119', '移动100元充值卡', '', '', '', '', '', '2016/4/22', 'wangjianjun', '2', '', '8', '13912996246', 'xiahui', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('120', '移动100元充值卡', '', '', '', '', '', '2016/4/22', 'wangqu', '2', '', '8', '13951674168', 'xiahui', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('121', '移动100元充值卡', '', '', '', '', '', '2016/4/22', 'wangqu', '2', 'VOLTE demo', '8', '13912984268', 'xiahui', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('122', '移动100元充值卡', '', '', '', '', '', '2016/4/22', 'wangqu', '2', 'VOLTE demo\r\n', '8', '13912984268', 'xiahui', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('123', '移动100元充值卡', '', '', '', '', '', '2016/4/22', 'wangqu', '2', 'VOLTE demo', '8', '13912984268', 'xiahui', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('124', '移动100元充值卡', '', '', '', '', '', '2016/4/22', 'wangqu', '2', 'VOLTE demo\r\n', '8', '13912984268', 'xiahui', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('125', '移动100元充值卡', '', '', '', '', '', '2016/4/22', 'wangqu', '2', 'VOLTE demo\r\n', '8', '13912984268', 'xiahui', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('126', 'discovery 真机', 'PILOT', 'NJ-PILOT-01', '', '120102160122000000', '', '2016/3/28', 'baiwenke', '0', '', '9', null, null, null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('127', 'discovery 真机', 'PILOT', 'NJ-PILOT-02', 'TS-DP-10', '861102160125000960', '', '2016/4/27', 'warehouse', '3', '在外（中科胡莉莉）', '9', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('128', 'discovery 真机', 'PILOT', 'NJ-PILOT-03', '', '861102160124999940', '', '2016/2/26', 'warehouse', '3', '会议室,请勿申请', '9', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('129', 'discovery 真机', 'PILOT', 'NJ-PILOT-04', '', '861102160124999940', '', '2016/6/28', 'xuxixi', '0', 'fota', '9', null, null, null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('130', 'discovery 真机', 'PILOT', 'NJ-PILOT-05', '', '861102160124999940', '', '2016/4/27', 'xuxixi', '1', '屏坏，2016/7/25寄回北京做验证。', '9', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('131', 'discovery 真机', 'UT', 'NJ-UT-01', '', '861102151130000000', '', '2016/7/7', 'tanhongyan', '0', '', '9', null, null, null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('132', 'discovery 真机', 'UT', 'NJ-UT-02', '', 'N/A', '', '2016/3/30', 'suguosong', '0', '在家', '9', null, null, null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('133', 'discovery 真机', 'UT', 'NJ-UT-03', 'TS-DP-06', 'N/A', '', '2016/4/1', 'warehouse', '3', '在外（中科胡莉莉）', '9', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('134', 'discovery 真机', 'UT', 'NJ-UT-04', '', 'N/A', '', '2016/3/30', 'heyunxian', '0', '', '9', null, null, null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('135', 'discovery 真机', 'UT', 'NJ-UT-05', '', 'N/A', '', '2016/3/24', 'houhaiying', '0', '', '9', null, null, null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('136', 'discovery 真机', 'UT', 'NJ-UT-06', '', 'N/A', '', '2016/6/12', 'qixuewen', '0', '', '9', null, null, null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('137', 'discovery 真机', 'UT', 'NJ-UT-07', 'TS-DP-07', 'N/A', '', '2016/4/1', 'warehouse', '3', '在外（中科胡莉莉）', '9', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('138', 'discovery 真机', 'UT', 'NJ-UT-08', '', 'N/A', '', '2016/5/3', 'shaoyi', '0', '', '9', null, null, null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('139', 'discovery 真机', 'UT', 'NJ-UT-09', '', 'N/A', '', '2016/3/31', 'zhouyanxin', '0', '', '9', null, null, null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('140', 'discovery 真机', 'UT', 'NJ-UT-10', '', 'N/A', '', '2016/3/30', 'wubo', '0', '', '9', null, null, null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('141', 'discovery 盒子', '', 'NJ-DT-01', '', 'N/A', '', '2016/1/28', 'warehouse', '1', '在库（铁箱）', '9', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('142', 'discovery 盒子', '', 'NJ-DT-02', '', 'N/A', '', '2016/7/25', 'warehouse', '1', '屏幕坏', '9', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('143', 'discovery 盒子', '', 'NJ-DT-03', '', 'N/A', '', '2016/4/28', 'suguosong', '0', '', '9', null, null, null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('144', 'discovery 盒子', '', 'NJ-DT-04', '', 'N/A', '', '2016/4/28', 'suguosong', '0', '', '9', null, null, null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('145', 'discovery 盒子', '', 'NJ-DT-05', '', 'N/A', '', '2016/4/28', 'warehouse', '1', '在库（铁箱）', '9', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('146', 'discovery 盒子', '', 'NJ-DT-06', '', 'N/A', '', '2016/4/28', 'warehouse', '1', '在库（铁箱）', '9', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('147', 'discovery 盒子', '', 'NJ-DT-07', '', '862983020005314', '', '2016/4/19', 'fanzikang', '0', '', '9', null, null, null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('148', 'discovery 盒子', '', 'NJ-DT-08', 'TS-BB-01', '862983020005371', '', '2016/3/22', 'warehouse', '3', '在外（中科牛丽娟）', '9', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('149', 'discovery 盒子', '', 'NJ-DT-09', 'TS-BB-02', '862983020005496', '', '2016/3/17', 'warehouse', '3', '在外（中科徐娅）', '9', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('150', 'discovery 盒子', '', 'NJ-DT-10', '', '862983020005801', '', '2016/7/25', 'warehouse', '1', 'USB口坏', '9', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('151', 'discovery 盒子', '', 'NJ-DT-11', 'TS-BB-04', '862983020005488', '', '2016/3/17', 'warehouse', '3', '在外（中科徐娅）', '9', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('152', 'discovery 盒子', '', 'NJ-DT-13', '', '862983020005363', '', '2016/6/20', 'warehouse', '1', 'USB口坏', '9', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('153', 'discovery 盒子', '', 'NJ-DT-14', '', '862983020006114', '', '2016/8/17', 'warehouse', '1', 'USB口坏', '9', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('154', 'discovery 盒子', '', 'NJ-DT-15', '', '862983020006106', '', '2016/8/18', 'fanghui', '0', '', '9', null, null, null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('155', 'discovery 盒子', '', 'NJ-DT-16', '', '862983020005470', '', '2016/7/14', 'wuhongwei', '0', '', '9', null, null, null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('156', 'discovery 盒子', '', 'NJ-DT-17', '', '862983020005074', '', '2016/7/14', 'xuehui', '0', '', '9', null, null, null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('157', 'discovery 盒子', '', 'NJ-DT-18', '', '862983020005686', '', '2016/7/13', 'wubo', '0', '', '9', null, null, null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('158', 'discovery 真机', '', 'NJ-DP-01', 'TS-DP-01', '862983020009498', '', '2016/3/17', 'warehouse', '3', '在外（中科徐娅）', '9', null, null, null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('159', 'discovery 真机', '', 'NJ-DP-02', '', '862983020009225', '', '2016/1/22', 'heyunxian', '0', '', '9', null, null, null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('160', 'discovery 真机', '', 'NJ-DP-03', 'TS-DP-05', '862983020009100', '', '2016/3/24', 'warehouse', '3', '在外（中科胡莉莉）', '9', null, null, null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('161', 'discovery 真机', '', 'NJ-DP-04', '', '862983020008748', '', '2016/6/12', 'chenwei', '0', '', '9', null, null, null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('162', 'discovery 真机', '', 'NJ-DP-05', '', '862983020008854', '', '2016/3/2', 'jiyue', '0', '', '9', null, null, null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('163', 'discovery 真机', '', 'NJ-DP-06', '', '862983020008698', '', '2016/6/12', 'diaowei', '0', '', '9', null, null, null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('164', 'discovery 真机', '', 'NJ-DP-08', 'TS-DP-02', '862983020008516', '', '2016/3/17', 'warehouse', '3', '在外（中科徐娅，吴波）', '9', null, null, null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('165', 'discovery 真机', '', 'NJ-DP-09', '', '862983020008607', '', '2016/6/13', 'huashasha', '0', '', '9', null, null, null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('166', 'discovery 真机', '', 'NJ-DP-10', 'TS-DP-13', '862983020009290', '', '2016/4/28', 'warehouse', '3', '在外（中科胡莉莉）', '9', null, null, null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('167', 'discovery 真机', '', 'NJ-DP-11', '', '013586910050296', '', '2016/2/2', 'liulinxiang', '0', '2016/7/25寄回北京做验证', '9', null, null, null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('168', 'discovery 真机', '', 'NJ-DP-12', '', '862983020008623', '', '2016/8/15', 'warehouse', '3', '在外（中科胡莉莉）', '9', null, null, null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('169', 'discovery 真机', '', 'NJ-DP-15', '', '869453020052370', '', '2016/7/29', 'liujian', '0', '', '9', null, null, null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('170', 'discovery 真机', '', 'NJ-DP-16', '', '869453020052412', '', '2016/6/28', 'xuxixi', '0', 'fota', '9', null, null, null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('171', 'discovery 真机', '', 'NJ-DP-17', '', '869453020052404', '', '早期', 'warehouse', '1', '在库，硬件有问题，在厂测模式', '9', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('172', 'discovery 真机', '', 'NJ-DP-18', 'TS-DP-08', '869453020052487', '', '2016/3/21', 'shaoyi', '3', '在外（中科用）', '9', null, null, null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('173', 'discovery 真机', '', 'NJ-DP-19', 'TS-DP-03', '869453020052420', '', '2016/3/18 ', 'warehouse', '3', '在外（中科陈彬）', '9', null, null, null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('174', 'discovery 真机', '', 'NJ-DP-20', '', '862983020006783', '', '2016/3/18', 'xiaxingsuo', '0', '', '9', null, null, null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('175', 'discovery 真机', '', 'NJ-DP-21', '', 'N/A', '', '2016/3/18', 'shenxueke', '0', '', '9', null, null, null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('176', 'discovery 真机', '', 'NJ-DP-24', '', '862983020009308', '', '2016/3/21', 'suguosong', '0', '', '9', null, null, null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('177', 'discovery 真机', '', 'NJ-DP-25', 'TS-DP-04', '862983020009209', '', '2016/3/21', 'warehouse', '1', '中科张岱岳——8.31已归还 USB口坏', '9', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('178', 'discovery 真机', '', 'NJ-DP-26', 'TS-DP-09', '862983020008557', '', '2016/3/21', 'warehouse', '3', '在外（中科邓昌志/胡莉莉） ', '9', null, null, null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('179', 'discovery 真机', '', 'NJ-DP-27', 'TS-DP-12', '869453020051232', '', '2016/4/27', 'warehouse', '3', '在外（中科胡莉莉）', '9', null, null, null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('180', 'discovery 真机', '', 'NJ-DP-28', '', '869453020051315', '', '2016/6/30', 'zhuyunxia', '0', '', '9', null, null, null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('181', 'discovery 真机', '', 'NJ-DP-29', '', '869453020102209', '', '2016/4/18', 'warehouse', '3', '李彦涛 资产已寄回北京', '9', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('182', 'discovery 真机', '', 'NJ-DP-30', '', '869453020052172', '', '2016/4/18', 'warehouse', '3', '2016/7/25寄回北京做验证', '9', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('183', 'discovery 真机', '', 'NJ-DP-31', 'TS-DP-11', '869453020052214', '', '2016/4/18', 'warehouse', '3', '在外（中科胡莉莉）', '9', null, null, null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('184', 'discovery 真机', '', 'NJ-DP-32', '', '869453020052180', '', '2016/4/18', 'xuxixi', '0', '', '9', null, null, null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('185', 'discovery 真机', '', 'NJ-DP-33', '', '869453020052222', '', '2016/5/3', 'lizheng', '0', '2016/7/25寄回北京做验证', '9', null, null, null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('186', 'discovery 真机', '', 'NJ-DP-34', 'TS-DP-15', '869453020052321', '', '2016/5/3', 'warehouse', '3', '在外（中科胡莉莉）', '9', null, null, null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('187', 'discovery 真机', '', 'NJ-DP-35', '', '869453020052263', '', '2016/5/3', 'tanhongyan', '0', '', '9', null, null, null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('188', 'discovery 真机', '', 'NJ-DP-36', '', '869453020052156', '', '2016/5/3', 'warehouse', '3', '在外（91-game）', '9', null, null, null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('189', 'discovery 真机', '', 'NJ-DP-37', '', '869453020052362', '', '2016/5/3', 'xuxixi', '0', 'fota', '9', null, null, null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('190', 'discovery 真机', '', 'NJ-DP-38', '', '869453020052248', '', '2016/5/3', 'libin', '0', '', '9', null, null, null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('191', 'discovery 真机', '', 'NJ-DP-41', '', '869453020052321', '', '2016/6/6', 'zhangzhiliang', '0', '', '9', null, null, null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('192', 'discovery 真机', '', 'NJ-DP-42', '', '869453020052545', '', '2016/6/6', 'warehouse', '3', '在外（虹软）', '9', null, null, null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('193', 'discovery 真机', '', 'NJ-DP-43', '', '869453020052057', '', '2016/6/6', 'xuyue', '0', '', '9', null, null, null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('194', 'discovery 真机', '', 'NJ-DP-44', '', '869453020052313', '', '2016/6/6', 'donggaole', '0', '', '9', null, null, null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('195', 'discovery 真机', '', 'NJ-DP-45', '', '004402600038222', '', '2016/6/6', 'donggaole', '0', '', '9', null, null, null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('196', 'discovery 真机', '', 'NJ-DP-46', '', '869453020051208', '', '2016/6/6', 'zhangzhiliang', '0', '', '9', null, null, null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('197', 'discovery 真机', '', 'NJ-DP-47', '', '869453020052610', '', '2016/6/6', 'warehouse', '3', '在外（虹软）', '9', null, null, null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('198', 'discovery 真机', '', 'NJ-DP-51', '', '862983020006270', '', '2016/6/20', 'warehouse', '1', 'USB口坏', '9', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('199', 'discovery 真机', '', 'NJ-DP-52', '', '862983020008185', '', '2016/6/20', 'chenzilong', '0', '', '9', null, null, null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('200', 'discovery 真机', '', 'NJ-DP-54', '', '862983020006494', '', '2016/6/20', 'warehouse', '3', 'wifi连接有问题，无法识别sim卡，2016/7/25寄回北京做验证', '9', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('201', 'discovery 真机', '', 'NJ-DP-55', '', '004402600038222', '', '2016/6/20', 'chenyang', '0', '', '9', null, null, null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('202', 'discovery 真机', '', 'NJ-DP-56', '', '004402600038222', '', '2016/6/20', 'liuzhiyuan', '0', '', '9', null, null, null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('203', 'discovery 真机', '', 'NJ-DP-57', '', '862983020006403', '', '2016/6/20', 'warehouse', '1', 'USB口坏', '9', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('204', 'discovery 真机', '', 'NJ-DP-58', '', '862983020007039', '', '2016/6/20', 'yongxiaowen', '0', '', '9', null, null, null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('205', 'discovery 真机', '', 'NJ-DP-59', '', '004402600038222', '', '2016/6/20', 'warehouse', '0', '', '9', null, null, null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('206', 'discovery 真机', '', 'NJ-DP-60', '', '862983020006577', '', '2016/7/29', 'yuanfanjie', '0', '', '9', null, null, null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('207', 'discovery 真机', '', 'NJ-DP-61', '', '862983020006262', '', '2016/7/29', 'wubo', '1', 'USB口坏', '9', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('208', 'discovery 真机', '', 'NJ-DP-62', '', '862983020006247', '', '2016/7/29', 'geminxia', '0', '', '9', null, null, null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('209', 'discovery 真机', '', 'NJ-DP-63', '', '862983020006221', '', '2016/8/8', 'warehouse', '3', '在外（中科毕伟）', '9', null, null, null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('210', 'discovery 真机', '', 'NJ-DP-64', '', '862983020006395', '', '2016/8/8', 'wangkui', '0', '', '9', null, null, null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('211', 'discovery 真机', '', 'NJ-DP-65', '', '862983020006957', '', '2016/8/8', 'wangjianjun', '0', '', '9', null, null, null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('212', 'discovery 真机', '', 'NJ-DP-66', '', '862983020007203', '', '2016/8/8', 'warehouse', '1', '', '9', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('213', 'discovery 真机', '', 'NJ-DP-67', '', '862983020006742', '', '2016/8/8', 'wangqu', '0', '', '9', null, null, null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('214', 'discovery 真机', '', 'NJ-DP-68', '', '862983020006478', '', '2016/8/8', 'warehouse', '3', '陈潜（家圆）', '9', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('215', 'discovery 真机', '', 'NJ-DP-69', '', '862983020006874', '', '2016/8/8', 'warehouse', '1', 'USB口没法充电', '9', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('216', 'discovery 真机', '', 'NJ-DP-48', '', '869453020052032', '', '2016/6/17', 'wangqu', '0', 'VOLTEdemo\r\n', '9', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('217', 'discovery 真机', '', 'NJ-DP-50', '', '004402600038222', '', '2016/6/20', 'lijianzhong', '3', '2016/7/25寄回北京做验证', '9', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('218', 'discovery BT 音箱', '', 'NJ-DBT-LS-01', '', '', '', '2016/3/2', 'qixuewen', '0', '', '11', null, null, null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('219', 'discovery BT 音箱', '', 'NJ-DBT-LS-02', '', '', '', '2016/3/2', 'zhanglin', '0', '', '11', null, null, null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('220', 'discovery BT 音箱', '', 'NJ-DBT-LS-03', '', '', '', '2016/3/2', 'lizheng', '0', '', '11', null, null, null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('221', 'discovery BT 音箱', '', 'NJ-DBT-LS-04', '', '', '', '2016/6/2', 'houhaiying', '0', '在家', '11', null, null, null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('222', 'discovery BT 音箱', '', 'NJ-DBT-LS-05', '', '', '', '2016/3/18', 'warehouse', '0', '', '11', null, null, null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('223', 'discovery BT 音箱', '', 'NJ-DBT-LS-06', '', '', '', '2016/3/18', 'wangqu', '0', 'VOLTEdemo', '11', null, null, null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('224', 'discovery BT 音箱', '', 'NJ-DBT-LS-07', 'TS-BT-03', '', '', '2016/3/18', 'warehouse', '3', '在外（中科张岱岳）', '11', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('225', 'discovery BT 音箱', '', 'NJ-DBT-LS-08', 'TS-BT-02', '', '', '2016/3/18', 'warehouse', '3', '在外（中科胡莉莉）', '11', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('226', 'discovery BT 音箱', '', 'NJ-DBT-LS-09', '', '', '', '2016/5/3', 'warehouse', '0', '会议室', '11', null, null, null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('227', 'discovery BT PILOT 音箱', '', 'NJ-PILOT-BT-01', '', '', '', '2016/2/26', 'chenzilong', '0', '', '11', null, null, null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('228', 'discovery BT PILOT 音箱', '', 'NJ-PILOT-BT-02', '', '', '', '2016/2/26', 'zhuyunxia', '0', '', '11', null, null, null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('229', 'discovery BT PILOT 音箱', '', 'NJ-PILOT-BT-03', '', '', '', '2016/2/26', 'chenzilong', '0', '', '11', null, null, null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('230', 'discovery BT PILOT 音箱', '', 'NJ-PILOT-BT-04', '', '', '', '2016/2/26', 'warehouse', '0', '音乐电台换一台', '11', null, null, null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('231', 'discovery BT PILOT 音箱', '', 'NJ-PILOT-BT-05', 'TS_BT-01', '', '', '2016/2/26', 'warehouse', '3', '在外（中科徐娅）', '11', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('232', 'discovery UT 音箱', '', 'NJ-UT-BT-01', '', '', '', '早期', 'tanhongyan', '0', '在家', '11', null, null, null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('233', 'discovery UT 音箱', '', 'NJ-UT-BT-02', '', '', '', '2016/3/7', 'suguosong', '0', '在家', '11', null, null, null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('234', 'discovery UT 音箱', '', 'NJ-UT-BT-03', '', '', '', '早期', 'xuxixi', '0', '', '11', null, null, null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('235', 'discovery UT 音箱', '', 'NJ-UT-BT-04', '', '', '', '2016/3/7', 'heyunxian', '0', '在家', '11', null, null, null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('236', 'discovery UT 音箱', '', 'NJ-UT-BT-05', '', '', '', '2016/3/7', 'houhaiying', '0', '在家', '11', null, null, null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('237', 'discovery UT 音箱', '', 'NJ-UT-BT-06', '', '', '', '早期', 'yongxiaowen', '0', '', '11', null, null, null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('238', 'discovery UT 音箱', '', 'NJ-UT-BT-07', '', '', '', '2016/3/7', 'lizheng', '0', '在家', '11', null, null, null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('239', 'discovery UT 音箱', '', 'NJ-UT-BT-08', '', '', '', '早期', 'shaoyi', '0', '', '11', null, null, null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('240', 'discovery UT 音箱', '', 'NJ-UT-BT-09', '', '', '', '早期', 'xuxixi', '0', '', '11', null, null, null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('241', 'discovery UT 音箱', '', 'NJ-UT-BT-10', '', '', '', '2016/6/15', 'wubo', '0', '', '11', null, null, null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('242', 'discovery BT 音箱充电器', '', 'NJ-DBT-LS-C-01', '', '', '', '2016/3/2', 'jiyue', '0', '', '11', null, null, null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('243', 'discovery BT 音箱充电器', '', 'NJ-DBT-LS-C-02', '', '', '', '2016/3/2', 'zhanglin', '0', '', '11', null, null, null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('244', 'discovery BT 音箱充电器', '', 'NJ-DBT-LS-C-03', '', '', '', '2016/3/2', 'lizheng', '0', '', '11', null, null, null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('245', 'discovery BT 音箱充电器', '', 'NJ-DBT-LS-C-04', '', '', '', '2016/3/2', 'chenzilong', '0', '', '11', null, null, null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('246', 'discovery BT 音箱充电器', '', 'NJ-DBT-LS-C-05', '', '', '', '早期', 'warehouse', '0', '', '11', null, null, null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('247', 'discovery BT 音箱充电器', '', 'TS-ADT-01', '', '', '', '2016/3/17', 'warehouse', '3', '在外（中科徐娅）', '11', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('248', 'discovery BT 音箱充电器', '', 'NJ-DBT-LS-C-06', 'NJ-ADT-02', '', '', '2016/3/18', 'warehouse', '3', '在外（中科胡莉莉）', '11', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('249', 'discovery BT 音箱充电器', '', 'NJ-DBT-LS-C-07', 'TS-ADT-03', '', '', '2016/3/18', 'warehouse', '3', '在外（中科张岱岳）', '11', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('250', 'ArmstrongP1', '', 'NJ-AS-01', '', '869453020060803', '', '2016/7/25', 'tanhongyan', '0', '7/15寄到南京十台', '10', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('251', 'ArmstrongP1', '', 'NJ-AS-02', '', '869453020060795', '', '2016/7/25', 'wangkai', '0', '7/16寄到南京十台', '10', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('252', 'ArmstrongP1', '', 'NJ-AS-03', '', '869453020060761', '', '2016/7/25', 'zhouyanxin', '0', '7/17寄到南京十台', '10', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('253', 'ArmstrongP1', '', 'NJ-AS-04', '', '869453020060811', '', '2016/7/25', 'gengshengen', '0', '7/18寄到南京十台', '10', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('254', 'ArmstrongP1', '', 'NJ-AS-05', '', '869453020060852', '', '2016/7/25', 'shaoyi', '0', '7/19寄到南京十台', '10', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('255', 'ArmstrongP1', '', 'NJ-AS-06', '', '869453020060746', '', '2016/7/25', 'baiwenke', '0', '7/20寄到南京十台', '10', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('256', 'ArmstrongP1', '', 'NJ-AS-07', '', '869453020060753', '', '2016/7/25', 'lijianzhong', '0', '7/21寄到南京十台', '10', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('257', 'ArmstrongP1', '', 'NJ-AS-08', '', '869453020060845', '', '2016/8/17', 'warehouse', '3', '7/22寄到南京十台   在外（中科胡莉莉）', '10', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('258', 'ArmstrongP1', '', 'NJ-AS-09', '', '869453020060712', '', '2016/8/12', 'warehouse', '3', '7/23寄到南京十台   在外（中科胡莉莉）', '10', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('259', 'ArmstrongP1', '', 'NJ-AS-10', '', '869453020060837', '', '2016/8/17', 'warehouse', '3', '7/24寄到南京十台   在外（中科胡莉莉）', '10', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('260', 'ArmstrongP1', '', 'NJ-AS-11', '', '869453020061165', '', '2016/8/11', 'suleilong', '0', '7/22寄到南京二十二台', '10', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('261', 'ArmstrongP1', '', 'NJ-AS-12', '', '869453020061272', '', '2016/8/8', 'zhangdiping', '0', '7/23寄到南京二十二台', '10', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('262', 'ArmstrongP1', '', 'NJ-AS-13', '', '869453020061470', '', '2016/8/8', 'jiyue', '0', '7/24寄到南京二十二台', '10', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('263', 'ArmstrongP1', '', 'NJ-AS-14', '', '869453020061546', '', '2016/8/8', 'xuxixi', '0', '7/25寄到南京二十二台', '10', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('264', 'ArmstrongP1', '', 'NJ-AS-15', '', '869453020061363', '', '早期', 'xuyue', '0', '7/26寄到南京二十二台', '10', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('265', 'ArmstrongP1', '', 'NJ-AS-16', '', '869453020061371', '', '2016/8/4', 'warehouse', '3', '7/27寄到南京二十二台   在外（中科戴婵娟）', '10', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('266', 'ArmstrongP1', '', 'NJ-AS-17', '', '869453020061231', '', '2016/8/12', 'warehouse', '3', '7/28寄到南京二十二台   在外（中科胡莉莉）', '10', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('267', 'ArmstrongP1', '', 'NJ-AS-18', '', '869453020061488', '', '2016/8/17', 'warehouse', '3', '7/29寄到南京二十二台   在外（中科胡莉莉）', '10', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('268', 'ArmstrongP1', '', 'NJ-AS-19', '', '869453020060704', '', '早期', 'daichen', '0', '7/30寄到南京二十二台', '10', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('269', 'ArmstrongP1', '', 'NJ-AS-20', '', '869453020060738', '', '早期', 'wubo', '0', '7/31寄到南京二十二台', '10', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('270', 'ArmstrongP1', '', 'NJ-AS-21', '', '869453020060720', '', '2016/8/12', 'warehouse', '3', '7/32寄到南京二十二台   在外（中科胡莉莉）', '10', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('271', 'ArmstrongP1', '', 'NJ-AS-22', '', '869453020061587', '', '2016/8/8', 'donggaole', '0', '7/33寄到南京二十二台', '10', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('272', 'ArmstrongP1', '', 'NJ-AS-23', '', '869453020061306', '', '2016/8/4', 'warehouse', '3', '7/34寄到南京二十二台   在外（中科朱晓祥）', '10', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('273', 'ArmstrongP1', '', 'NJ-AS-24', '', '869453020061330', '', '早期', 'heyunxian', '0', '7/35寄到南京二十二台', '10', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('274', 'ArmstrongP1', '', 'NJ-AS-25', '', '869453020061504', '', '2016/8/4', 'warehouse', '3', '7/36寄到南京二十二台   在外（中科胡莉莉）', '10', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('275', 'ArmstrongP1', '', 'NJ-AS-26', '', '869453020061405', '', '2016/8/4', 'warehouse', '3', '7/37寄到南京二十二台   在外（中科朱丽楠）', '10', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('276', 'Armstrong盒子', '', 'NJ-AS-27', '', '869453020061462', '', '2016/8/12', 'warehouse', '3', '7/38寄到南京二十二台   在外（中科张岱岳）', '10', null, null, null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('277', 'Armstrong盒子', '', 'NJ-AS-28', '', '869453020061439', '', '早期', 'libin', '0', '7/39寄到南京二十二台', '10', null, null, null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('278', 'Armstrong盒子', '', 'NJ-AS-29', '', '869453020061520', '', '2016/8/8', 'warehouse', '3', '7/40寄到南京二十二台   在外（中科石娇娇）', '10', null, null, null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('279', 'Armstrong盒子', '', 'NJ-AS-30', '', '869453020061322', '', '2016/8/4', 'warehouse', '3', '7/41寄到南京二十二台   在外（中科胡莉莉）', '10', null, null, null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('280', 'Armstrong盒子', '', 'NJ-AS-31', '', '869453020061314', '', '2016/8/12', 'warehouse', '3', '7/42寄到南京二十二台   在外（中科胡莉莉）', '10', null, null, null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('281', 'Armstrong盒子', '', 'NJ-AS-32', '', '869453020061256', '', '2016/8/17', 'warehouse', '3', '7/43寄到南京二十二台   在外（中科胡莉莉）', '10', null, null, null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('282', 'Armstrong盒子', '', 'NJ-AS-33', '', '（已拆，未记IME)', '', '2016/8/5', 'zhaobo', '0', '2016/8/5建忠带回南京', '10', null, null, null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('283', 'Armstrong充电器', '', 'NJ-AS-C-01', '', '', '', '2016/8/3', 'warehouse', '0', '2016/8/3征哥带回', '12', null, null, null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('284', 'Armstrong充电器', '', 'NJ-AS-C-02', '', '', '', '2016/8/3', 'warehouse', '3', '2016/8/3征哥带回   在外（中科胡莉莉）', '12', null, null, null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('285', 'Armstrong充电器', '', 'NJ-AS-C-03', '', '', '', '2016/8/3', 'warehouse', '0', '2016/8/3征哥带回', '12', null, null, null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('286', 'Armstrong充电器', '', 'NJ-AS-C-04', '', '', '', '2016/8/3', 'warehouse', '0', '2016/8/3征哥带回', '12', null, null, null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('287', 'Armstrong充电器', '', 'NJ-AS-C-05', '', '', '', '2016/8/3', 'warehouse', '0', '2016/8/3征哥带回', '12', null, null, null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('288', 'Armstrong充电器', '', 'NJ-AS-C-06', '', '', '', '2016/8/3', 'warehouse', '3', '2016/8/3征哥带回   在外（中科胡莉莉）', '12', null, null, null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('289', 'Armstrong充电器', '', 'NJ-AS-C-07', '', '', '', '2016/8/3', 'warehouse', '0', '2016/8/3征哥带回', '12', null, null, null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('290', 'Armstrong充电器', '', 'NJ-AS-C-08', '', '', '', '2016/8/3', 'warehouse', '3', '2016/8/3征哥带回   在外（中科胡莉莉）', '12', null, null, null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('291', 'Armstrong充电器', '', 'NJ-AS-C-09', '', '', '', '2016/8/3', 'warehouse', '0', '2016/8/3征哥带回', '12', null, null, null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('292', 'Armstrong充电器', '', 'NJ-AS-C-10', '', '', '', '2016/8/3', 'warehouse', '0', '2016/8/3征哥带回', '12', null, null, null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('293', 'Armstrong充电器', '', 'NJ-AS-C-11', '', '', '', '2016/8/3', 'warehouse', '3', '2016/8/3征哥带回   在外（中科胡莉莉）', '12', null, null, null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('294', 'Armstrong充电器', '', 'NJ-AS-C-12', '', '', '', '2016/8/3', 'warehouse', '0', '2016/8/3征哥带回', '12', null, null, null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('295', 'Armstrong充电器', '', 'NJ-AS-C-13', '', '', '', '2016/8/3', 'warehouse', '3', '2016/8/3征哥带回   在外（中科胡莉莉）', '12', null, null, null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('296', 'Armstrong充电器', '', 'NJ-AS-C-14', '', '', '', '2016/8/3', 'warehouse', '3', '2016/8/3征哥带回   在外（中科胡莉莉）', '12', null, null, null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('297', 'Armstrong充电器', '', 'NJ-AS-C-15', '', '', '', '2016/8/3', 'warehouse', '3', '2016/8/3征哥带回   在外（中科胡莉莉）', '12', null, null, null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('298', 'Armstrong充电器', '', 'NJ-AS-C-16', '', '', '', '2016/8/3', 'warehouse', '0', '2016/8/3征哥带回', '12', null, null, null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('299', 'Armstrong充电器', '', 'NJ-AS-C-17', '', '', '', '2016/8/3', 'warehouse', '3', '2016/8/3征哥带回   在外（中科胡莉莉）', '12', null, null, null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('300', 'Armstrong充电器', '', 'NJ-AS-C-18', '', '', '', '2016/8/3', 'warehouse', '0', '2016/8/3征哥带回', '12', null, null, null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('301', 'Armstrong充电器', '', 'NJ-AS-C-19', '', '', '', '2016/8/3', 'warehouse', '0', '2016/8/3征哥带回', '12', null, null, null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('302', 'Armstrong充电器', '', 'NJ-AS-C-20', '', '', '', '2016/8/3', 'warehouse', '0', '2016/8/3征哥带回', '12', null, null, null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('303', '移动100元充值卡', '', '', '', '', '', '2016/4/22', 'wangjianjun', '2', '', '8', '18851027486', 'xiahui', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('304', '移动100元充值卡', '', '', '', '', '', '2016/4/22', 'wangqu', '2', '迪士尼', '8', '15261499792', 'xiahui', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('305', '移动100元充值卡', '', '', '', '', '', '2016/4/22', 'wangqu', '2', '迪士尼', '8', '15261499792', 'xiahui', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('306', '移动100元充值卡', null, null, null, null, null, '2016/4/22', 'wangqu', '2', '', '8', '18751883385', 'xiahui', null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('307', '移动100元充值卡', null, null, null, null, null, '2016/4/22', 'wubo', '2', '', '8', '18751858915', 'xiahui', null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('308', '移动100元充值卡', null, null, null, null, null, '2016/4/22', 'qixuewen', '2', '', '8', '18851027946', 'xiahui', null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('309', '移动100元充值卡', null, null, null, null, null, '2016/4/22', 'wangqu', '2', '迪士尼', '8', '15261499792', 'xiahui', null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('310', '移动100元充值卡', null, null, null, null, null, '2016/6/3', 'wangqu', '2', '迪士尼', '8', '15261499792', 'xiahui', null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('311', '移动100元充值卡', null, null, null, null, null, '2016/6/3', 'wangqu', '2', '迪士尼', '8', '15261499792', 'xiahui', null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('312', '移动100元充值卡', null, null, null, null, null, '2016/6/3', 'wangqu', '2', '转给中科王栋，北京转2张100元充值卡给南京', '8', '', 'xiahui', null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('313', '移动100元充值卡', null, null, null, null, null, '2016/6/3', 'wangqu', '2', '转给中科王栋，北京转2张100元充值卡给南京', '8', '', 'xiahui', null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('314', '移动100元充值卡', null, null, null, null, null, '2016/6/3', 'wangqu', '2', '', '8', '18851027946', 'xiahui', null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('315', '移动100元充值卡', null, null, null, null, null, '2016/6/3', 'tanhongyan', '2', '', '8', '18751883385', 'xiahui', null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('316', '移动100元充值卡', null, null, null, null, null, '2016/6/3', 'houhaiying', '2', '', '8', '13951674168', 'xiahui', null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('317', '联通50元充值卡', null, null, null, null, null, '2016/4/22', 'shenxueke', '2', '', '8', '15695292212', 'xiahui', null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('318', '移动100元充值卡', null, null, null, null, null, '2016/6/3', 'houhaiying', '2', '', '8', '13951674168', 'xiahui', null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('319', '移动100元充值卡', null, null, null, null, null, '2016/6/3', 'libin', '2', '', '8', '15190489904', 'xiahui', null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('320', '移动100元充值卡', null, null, null, null, null, '2016/6/3', 'wangqu', '2', '', '8', '13912984168', 'xiahui', null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('321', '移动100元充值卡', null, null, null, null, null, '2016/6/3', 'wubo', '2', '', '8', '18751858915', 'xiahui', null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('322', '移动100元充值卡', null, null, null, null, null, '2016/6/3', 'heyunxian', '2', '', '8', '18851027486', 'xiahui', null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('323', '联通50元充值卡', null, null, null, null, null, '2016/4/22', 'shenxueke', '2', '', '8', '15695292212', 'xiahui', null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('324', '联通50元充值卡', null, null, null, null, null, '2016/4/22', 'shenxueke', '2', '', '8', '15695292212', 'xiahui', null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('325', '移动100元充值卡', null, null, null, null, null, '2016/6/3', 'wangjianjun', '2', '', '8', '13913027976', 'xiahui', null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('326', '移动100元充值卡', null, null, null, null, null, '2016/6/3', 'wangqu', '2', '', '8', '13912984168', 'xiahui', null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('327', '移动100元充值卡', null, null, null, null, null, '2016/6/3', 'wangqu', '2', '', '8', '13912984168', 'xiahui', null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('328', '移动100元充值卡', null, null, null, null, null, '2016/6/3', 'wangjianjun', '2', '', '8', '13913027976', 'xiahui', null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('329', '移动100元充值卡', null, null, null, null, null, '2016/6/3', 'tanhongyan', '2', '', '8', '18751883385', 'xiahui', null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('330', '移动100元充值卡', null, null, null, null, null, '2016/6/3', 'heyunxian', '2', '', '8', '18851027486', 'xiahui', null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('331', '移动100元充值卡', null, null, null, null, null, '2016/6/3', 'libin', '2', '', '8', '15190489904', 'xiahui', null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('332', '移动100元充值卡', null, null, null, null, null, '2016/6/3', 'heyunxian', '2', '', '8', '18851027486', 'xiahui', null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('333', '移动100元充值卡', null, null, null, null, null, '2016/6/3', 'wangjianjun', '2', '', '8', '13913027976', 'xiahui', null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('334', '移动100元充值卡', null, null, null, null, null, '2016/6/3', 'xuxixi', '2', '', '8', '15950498532', 'xiahui', null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('335', '移动100元充值卡', null, null, null, null, null, '2016/6/3', 'xuxixi', '2', '', '8', '15950498532', 'xiahui', null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('336', '移动100元充值卡', null, null, null, null, null, '2016/6/3', 'wangqu', '2', 'VOLTE demo', '8', '13912984268', 'xiahui', null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('337', '移动100元充值卡', null, null, null, null, null, '2016/6/3', 'wangqu', '2', 'VOLTE demo', '8', '13912984268', 'xiahui', null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('338', '移动100元充值卡', null, null, null, null, null, '2016/6/3', 'wangqu', '2', 'VOLTE demo', '8', '13912984268', 'xiahui', null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('339', '移动100元充值卡', null, null, null, null, null, '2016/6/3', 'wangqu', '2', 'VOLTE demo', '8', '13912984268', 'xiahui', null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('340', '移动100元充值卡', null, null, null, null, null, '2016/6/3', 'liuzhiyuan', '2', '', '8', '15190489904', 'xiahui', null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('341', '移动50元充值卡', null, null, null, null, null, '2016/7/28', 'wangjianjun', '2', '用于亲粉会', '8', '13912996246', 'xiahui', null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('342', '移动50元充值卡', null, null, null, null, null, '2016/7/28', 'wangjianjun', '2', '用于亲粉会', '8', '13912996246', 'xiahui', null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('343', '移动50元充值卡', null, null, null, null, null, '2016/7/28', 'heyunxian', '2', '用于亲粉会', '8', '18851027486', 'xiahui', null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('344', '移动50元充值卡', null, null, null, null, null, '2016/7/28', 'heyunxian', '2', '用于亲粉会', '8', '18851027486', 'xiahui', null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('345', '移动50元充值卡', null, null, null, null, null, '2016/7/28', 'houhaiying', '2', '用于亲粉会', '8', '13951674168', 'xiahui', null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('346', '移动50元充值卡', null, null, null, null, null, '2016/7/28', 'houhaiying', '2', '用于亲粉会', '8', '13951674168', 'xiahui', null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('347', '移动50元充值卡', null, null, null, null, null, '2016/7/28', 'wangjianjun', '2', '', '8', '18851027486', 'xiahui', null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('348', '移动50元充值卡', null, null, null, null, null, '2016/7/28', 'wangjianjun', '2', '', '8', '18851027486', 'xiahui', null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('349', '移动50元充值卡', null, null, null, null, null, '2016/7/28', 'wubo', '2', '', '8', '18751858915', 'xiahui', null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('350', '移动50元充值卡', null, null, null, null, null, '2016/7/28', 'wubo', '2', '', '8', '18751858915', 'xiahui', null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('351', '移动50元充值卡', null, null, null, null, null, '2016/7/28', 'houhaiying', '2', '', '8', '13913027976', 'xiahui', null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('352', '移动50元充值卡', null, null, null, null, null, '2016/7/28', 'houhaiying', '2', '', '8', '13913027976', 'xiahui', null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('353', '移动50元充值卡', null, null, null, null, null, '2016/7/28', 'tanhongyan', '2', '', '8', '18751883385', 'xiahui', null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('354', '移动50元充值卡', null, null, null, null, null, '2016/7/28', 'wangjianjun', '2', '', '8', '15190489904', 'xiahui', null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('355', '移动50元充值卡', null, null, null, null, null, '2016/7/28', 'wangjianjun', '2', '', '8', '15190489904', 'xiahui', null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('356', '移动50元充值卡', null, null, null, null, null, '2016/7/28', 'shenxueke', '2', '', '8', '15250973488', 'xiahui', null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('357', '联通50元充值卡', null, null, null, null, null, '2016/7/28', 'zhengyanli', '2', '', '8', '18652035690', 'xiahui', null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('358', '移动50元充值卡', null, null, null, null, null, '2016/7/28', 'chenwei', '2', '', '8', '13776600761', 'xiahui', null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('359', '移动50元充值卡', null, null, null, null, null, '2016/7/28', 'wangjianjun', '2', '', '8', '18851027486', 'xiahui', null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('360', '移动50元充值卡', null, null, null, null, null, '2016/7/28', 'wangjianjun', '2', '', '8', '18851027486', 'xiahui', null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('361', '移动50元充值卡', null, null, null, null, null, '2016/7/28', 'zhangzhiliang', '2', '', '8', '15950498532', 'xiahui', null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('362', '移动50元充值卡', null, null, null, null, null, '2016/7/28', 'zhangzhiliang', '2', '', '8', '15950498532', 'xiahui', null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('363', '联通50元充值卡', null, null, null, null, null, '2016/4/22', 'shenxueke', '2', '', '8', '', 'xiahui', null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('364', '联通50元充值卡', null, null, null, null, null, '2016/4/22', 'shenxueke', '2', '', '8', '', 'xiahui', null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('365', '联通50元充值卡', null, null, null, null, null, '2016/4/22', 'zhengyanli', '2', '', '8', '', 'xiahui', null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('366', '联通50元充值卡', null, null, null, null, null, '2016/4/22', 'warehouse', '0', '', '8', '', 'xiahui', null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('367', '联通50元充值卡', null, null, null, null, null, '2016/4/22', 'warehouse', '0', '', '8', '', 'xiahui', null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('368', '联通50元充值卡', null, null, null, null, null, '2016/4/22', 'warehouse', '0', '', '8', '', 'xiahui', null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('369', '联通50元充值卡', null, null, null, null, null, '2016/4/22', 'warehouse', '0', '', '8', '', 'xiahui', null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('370', '联通50元充值卡', null, null, null, null, null, '2016/4/22', 'warehouse', '0', '', '8', '', 'xiahui', null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('371', '联通50元充值卡', null, null, null, null, null, '2016/4/22', 'warehouse', '0', '', '8', '', 'xiahui', null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('372', '联通50元充值卡', null, null, null, null, null, '2016/4/22', 'warehouse', '0', '', '8', '', 'xiahui', null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('373', '联通50元充值卡', null, null, null, null, null, '2016/4/22', 'warehouse', '0', '', '8', '', 'xiahui', null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('374', '联通50元充值卡', null, null, null, null, null, '2016/4/22', 'warehouse', '0', '', '8', '', 'xiahui', null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('375', '联通50元充值卡', null, null, null, null, null, '2016/4/22', 'warehouse', '0', '', '8', '', 'xiahui', null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('376', '联通50元充值卡', null, null, null, null, null, '2016/4/22', 'warehouse', '0', '', '8', '', 'xiahui', null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('377', '联通50元充值卡', null, null, null, null, null, '2016/4/22', 'warehouse', '0', '', '8', '', 'xiahui', null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('378', '联通50元充值卡', null, null, null, null, null, '2016/4/22', 'warehouse', '0', '', '8', '', 'xiahui', null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('379', '移动50元充值卡', null, null, null, null, null, '2016/7/28', 'zhangzhiliang', '0', '', '8', '', 'xiahui', null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('380', '移动50元充值卡', null, null, null, null, null, '2016/7/28', 'zhangzhiliang', '0', '', '8', '', 'xiahui', null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('381', '移动50元充值卡', null, null, null, null, null, '2016/7/28', 'wangjianjun', '0', '', '8', '', 'xiahui', null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('382', '移动50元充值卡', null, null, null, null, null, '2016/7/28', 'zhangzhiliang', '0', '', '8', '', 'xiahui', null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('383', '移动50元充值卡', null, null, null, null, null, '2016/7/28', 'zhangzhiliang', '0', '', '8', '', 'xiahui', null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('384', '移动50元充值卡', null, null, null, null, null, '2016/7/28', 'wangjianjun', '0', '', '8', '', 'xiahui', null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('385', '移动50元充值卡', null, null, null, null, null, '2016/7/28', 'zhangzhiliang', '0', '', '8', '', 'xiahui', null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('386', '移动50元充值卡', null, null, null, null, null, '2016/7/28', 'shaoyi', '2', '', '8', '', 'xiahui', null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('387', '移动50元充值卡', null, null, null, null, null, '2016/7/28', 'shaoyi', '2', '', '8', '', 'xiahui', null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('388', '移动50元充值卡', null, null, null, null, null, '2016/7/28', 'fanghui', '2', '', '8', '', 'xiahui', null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('389', '移动50元充值卡', null, null, null, null, null, '2016/7/28', 'gengshengen', '2', '', '8', '', 'xiahui', null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('390', '移动50元充值卡', null, null, null, null, null, '2016/7/28', 'zhangzhiliang', '2', '', '8', '', 'xiahui', null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('391', '移动50元充值卡', null, null, null, null, null, '2016/7/28', 'zhangzhiliang', '2', '', '8', '', 'xiahui', null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('392', '移动50元充值卡', null, null, null, null, null, '2016/7/28', 'zhangzhiliang', '0', '', '8', '', 'xiahui', null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('393', '移动50元充值卡', null, null, null, null, null, '2016/7/28', 'zhangzhiliang', '2', '', '8', '', 'xiahui', null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('394', '移动50元充值卡', null, null, null, null, null, '2016/7/28', 'heyunxian', '2', '', '8', '', 'xiahui', null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('395', '移动50元充值卡', null, null, null, null, null, '2016/7/28', 'heyunxian', '2', '', '8', '', 'xiahui', null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('396', '移动50元充值卡', null, null, null, null, null, '2016/7/28', 'zhangzhiliang', '2', '', '8', '', 'xiahui', null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('397', '移动50元充值卡', null, null, null, null, null, '2016/7/28', 'zhangzhiliang', '2', '', '8', '', 'xiahui', null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('398', '移动50元充值卡', null, null, null, null, null, '2016/7/28', 'zhangzhiliang', '2', '', '8', '', 'xiahui', null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('399', '移动50元充值卡', null, null, null, null, null, '2016/7/28', 'zhangzhiliang', '2', '', '8', '', 'xiahui', null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('400', '移动50元充值卡', null, null, null, null, null, '2016/7/28', 'zhangzhiliang', '2', '', '8', '', 'xiahui', null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('401', '移动50元充值卡', null, null, null, null, null, '2016/7/28', 'shenxueke', '2', '', '8', '', 'xiahui', null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('402', '移动50元充值卡', null, null, null, null, null, '2016/7/28', 'wubo', '2', '', '8', '', 'xiahui', null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('403', '移动50元充值卡', null, null, null, null, null, '2016/7/28', 'shenxueke', '2', '', '8', '', 'xiahui', null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('404', '移动50元充值卡', null, null, null, null, null, '2016/7/28', 'shenxueke', '2', '', '8', '', 'xiahui', null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('405', '移动50元充值卡', null, null, null, null, null, '2016/7/28', 'shenxueke', '2', '', '8', '', 'xiahui', null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('406', '移动50元充值卡', null, null, null, null, null, '2016/7/28', 'wubo', '2', '', '8', '', 'xiahui', null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('407', '移动50元充值卡', null, null, null, null, null, '2016/7/28', 'shenxueke', '2', '', '8', '', 'xiahui', null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('408', '移动50元充值卡', null, null, null, null, null, '2016/7/28', 'shenxueke', '2', '', '8', '', 'xiahui', null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('409', '移动50元充值卡', null, null, null, null, null, '2016/7/28', 'shenxueke', '2', '', '8', '', 'xiahui', null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('410', '移动50元充值卡', null, null, null, null, null, '2016/7/28', 'shenxueke', '2', '', '8', '', 'xiahui', null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('411', '移动50元充值卡', null, null, null, null, null, '2016/7/28', 'shenxueke', '2', '', '8', '', 'xiahui', null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('412', '移动50元充值卡', null, null, null, null, null, '2016/7/28', 'shenxueke', '2', '', '8', '', 'xiahui', null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('413', '移动50元充值卡', null, null, null, null, null, '2016/7/28', 'wangjianjun', '2', '', '8', '', 'xiahui', null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('414', '移动50元充值卡', null, null, null, null, null, '2016/7/28', 'wangjianjun', '2', '', '8', '', 'xiahui', null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('415', '移动50元充值卡', null, null, null, null, null, '2016/7/28', 'qixuewen', '2', '', '8', '', 'xiahui', null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('416', '移动50元充值卡', null, null, null, null, null, '2016/7/28', 'qixuewen', '2', '', '8', '', 'xiahui', null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('417', '移动50元充值卡', null, null, null, null, null, '2016/7/28', 'warehouse', '0', '', '8', '', 'xiahui', null, null, null, '', '', '', '', '');
INSERT INTO `resource` VALUES ('418', '红米Note 3', '红米Note3 2GB内存 16GB 金典金色', 'NJ-Xiaomi-04', '', '861735037216719', '', '2016/08/22 11:28:17', 'baiwenke', '0', '', '18', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('419', 'Iphone 6s plus ', '16G 银白 A1699', 'NJ-Iphone-03', '', '354986074163819', '', '2016/08/22 11:32:55', 'yuanfanjie', '0', '', '18', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('420', 'Iphone SE', '16G A1723 玫瑰金', 'NJ-Iphone-04', '', '355797079336717', '', '2016/08/22 11:34:47', 'sunjian', '0', '', '18', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('421', 'Armstrong盒子', '', 'NJ-AS-34', '', '869453020061702', '', '2016/08/22 15:13:45', 'suguosong', '0', '从北京带回来的（From Guangliang', '10', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('422', '测试的资产路由器', '', 'NJ-test-01', '', '2222222222', '', '2016/08/31 15:46:24', 'warehouse', '0', 'test', '15', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('426', 'Armstrong盒子', '', 'NJ-AS-35', '', '004402600038222', '', '2016/08/31 16:49:04', 'daichen', '0', '2016/8/31曾鹏寄给南京测试', '10', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('427', 'VICTOR胜利仪器', 'VICTOR 824', 'NJ-IST-01', '', '092334489', '', '2016/09/02 10:19:20', 'shaoyi', '0', '', '25', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('428', 'ArmstongP2', '', 'NJ-AS-36', '', '863002030003463', '', '2016/09/06 10:57:09', 'shaoyi', '0', '2016/9/06寄到南京18台', '10', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('429', 'ArmstongP2', '', 'NJ-AS-37', '', '863002030003240', '', '2016/09/06 17:16:38', 'donggaole', '0', '2016/9/06寄到南京18台', '10', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('430', 'ArmstongP2', '', 'NJ-AS-38', '', '863002030003749', '', '2016/09/06 17:18:58', 'xuxixi', '0', '2016/9/06寄到南京18台', '10', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('431', 'ArmstongP2', '', 'NJ-AS-39', '', '863002030003729', '', '2016/09/06 17:19:32', 'zhangzhiliang', '0', '2016/9/06寄到南京18台', '10', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('432', 'ArmstongP2', '', 'NJ-AS-40', '', '863002030003299', '', '2016/09/06 17:19:54', 'zhengyanli', '0', '2016/9/06寄到南京18台', '10', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('433', 'ArmstongP2', '', 'NJ-AS-41', '', '863002030003588', '', '2016/09/06 17:20:20', 'liuzhiyuan', '0', '2016/9/06寄到南京18台', '10', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('434', 'ArmstongP2', '', 'NJ-AS-42', '', '863002030003232', '', '2016/09/06 17:20:46', 'lizheng', '0', '2016/9/06寄到南京18台', '10', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('435', 'ArmstongP2', '', 'NJ-AS-43', '', '863002030003562', '', '2016/09/06 17:21:08', 'wubo', '0', '2016/9/06寄到南京18台', '10', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('436', 'ArmstongP2', '', 'NJ-AS-44', '', '863002030003265', '', '2016/09/06 17:21:37', 'shenxueke', '0', '2016/9/06寄到南京18台', '10', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('437', 'ArmstongP2', '', 'NJ-AS-45', '', '863002030003406', '', '2016/09/06 17:22:01', 'zhangzhiliang', '0', '2016/9/06寄到南京18台', '10', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('438', 'ArmstongP2', '', 'NJ-AS-46', '', '863002030003414', '', '2016/09/06 17:22:31', 'liulinxiang', '0', '2016/9/06寄到南京18台', '10', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('439', 'ArmstongP2', '', 'NJ-AS-47', '', '863002030003497', '', '2016/09/06 17:22:51', 'gaoweixing', '0', '屏幕有雪花 2016/9/06寄到南京18台', '10', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('440', 'ArmstongP2', '', 'NJ-AS-48', '', '863002030003539', '', '2016/09/06 17:23:30', 'xiaxingsuo', '0', '2016/9/06寄到南京18台', '10', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('441', 'ArmstongP2', '', 'NJ-AS-49', '', '863002030003349', '', '2016/09/06 17:23:53', 'zhaobo', '0', '2016/9/06寄到南京18台', '10', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('442', 'ArmstongP2', '', 'NJ-AS-50', '', '863002030003554', '', '2016/09/06 17:24:24', 'zhangzhiliang', '0', '2016/9/06寄到南京18台', '10', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('443', 'ArmstongP2', '', 'NJ-AS-51', '', '863002030003273', '', '2016/09/06 17:24:51', 'zhangzhiliang', '0', '2016/9/06寄到南京18台', '10', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('444', 'ArmstongP2', '', 'NJ-AS-52', '', '863002030003489', '', '2016/09/06 17:25:14', 'zhangzhiliang', '0', '2016/9/06寄到南京18台', '10', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('445', 'ArmstongP2', '', 'NJ-AS-53', '', '863002030003331', '', '2016/09/06 17:25:34', 'zhangzhiliang', '3', '2016/9/06寄到南京18台 9/14寄回北京吴光亮', '10', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('446', 'ArmstongP2', '', 'NJ-AS-54', '', '863002030002473', '', '2016/09/08 12:34:38', 'qixuewen', '0', '2016/9/8寄到南京12台 有盖', '10', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('447', 'ArmstongP2', '', 'NJ-AS-55', '', '863002030003547', '', '2016/09/08 16:07:07', 'heyunxian', '0', '2016/9/8寄到南京12台', '10', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('448', 'ArmstongP2', '', 'NJ-AS-56', '', '863002030003687', '', '2016/09/08 16:07:57', 'daichen', '0', '2016/9/8寄到南京12台', '10', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('449', 'ArmstongP2', '', 'NJ-AS-57', '', '863002030003364', '', '2016/09/08 16:08:34', 'houhaiying', '0', '2016/9/8寄到南京12台', '10', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('450', 'ArmstongP2', '', 'NJ-AS-58', '', '863002030002697', '', '2016/09/08 16:09:18', 'shaoyi', '0', '2016/9/8寄到南京12台 有盖', '10', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('451', 'ArmstongP2', '', 'NJ-AS-59', '', '863002030003398', '', '2016/09/08 16:09:49', 'baiwenke', '0', '2016/9/8寄到南京12台', '10', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('452', 'ArmstongP2', '', 'NJ-AS-60', '', '863002030003224', '', '2016/09/08 16:10:16', 'zhanglin', '0', '2016/9/8寄到南京12台', '10', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('453', 'ArmstongP2', '', 'NJ-AS-61', '', '863002030003505', '', '2016/09/08 16:10:40', 'shaoyi', '0', '2016/9/8寄到南京12台', '10', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('454', 'ArmstongP2', '', 'NJ-AS-62', '', '863002030003323', '', '2016/09/08 16:11:05', 'wangjianjun', '0', '2016/9/8寄到南京12台', '10', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('455', 'ArmstongP2', '', 'NJ-AS-63', '', '863002030003471', '', '2016/09/08 16:11:31', 'shaoyi', '0', '2016/9/8寄到南京12台', '10', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('456', 'ArmstongP2', '', 'NJ-AS-64', '', '863002030003430', '', '2016/09/08 16:12:02', 'zhengyanli', '0', '2016/9/8寄到南京12台', '10', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('457', 'ArmstongP2', '', 'NJ-AS-65', '', '863002030003737', '', '2016/09/08 16:12:20', 'zhengyanli', '0', '2016/9/8寄到南京12台', '10', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `resource` VALUES ('458', 'Precision Power Tower 3420', 'Precision Power Tower 3420', '', '', '', '6WZWND2', '2016/09/12 15:20:09', 'wangkui', '0', '', '25', '', '', '', '', '', '', '', '', '', '');

-- ----------------------------
-- Table structure for resource_file
-- ----------------------------
DROP TABLE IF EXISTS `resource_file`;
CREATE TABLE `resource_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `rid` int(11) NOT NULL COMMENT '资产标识',
  `fileName` varchar(255) NOT NULL COMMENT '文件名',
  `remark` varchar(255) DEFAULT '' COMMENT '备注信息',
  `uploader` varchar(255) NOT NULL COMMENT '上传人',
  `uploadTime` varchar(255) NOT NULL COMMENT '上传时间',
  PRIMARY KEY (`id`),
  KEY `rid` (`rid`),
  CONSTRAINT `resource_file_ibfk_1` FOREIGN KEY (`rid`) REFERENCES `resource` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of resource_file
-- ----------------------------

-- ----------------------------
-- Table structure for type
-- ----------------------------
DROP TABLE IF EXISTS `type`;
CREATE TABLE `type` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键 ',
  `name` varchar(255) NOT NULL COMMENT '类别名称',
  `fatherType` int(11) NOT NULL DEFAULT '0' COMMENT '父类目',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of type
-- ----------------------------
INSERT INTO `type` VALUES ('1', '工程机', '0');
INSERT INTO `type` VALUES ('2', '办公设备', '0');
INSERT INTO `type` VALUES ('3', '研发设备', '0');
INSERT INTO `type` VALUES ('4', '手机相关', '0');
INSERT INTO `type` VALUES ('5', '消耗品', '0');
INSERT INTO `type` VALUES ('6', '其他物品', '0');
INSERT INTO `type` VALUES ('7', 'SIM卡', '4');
INSERT INTO `type` VALUES ('8', '手机充值卡', '4');
INSERT INTO `type` VALUES ('9', 'Discovery真机', '1');
INSERT INTO `type` VALUES ('10', 'Armstrong真机', '1');
INSERT INTO `type` VALUES ('11', 'Discovery配件', '1');
INSERT INTO `type` VALUES ('12', 'Armstrong配件', '1');
INSERT INTO `type` VALUES ('13', '电脑', '2');
INSERT INTO `type` VALUES ('14', '显示器', '2');
INSERT INTO `type` VALUES ('15', '路由器', '3');
INSERT INTO `type` VALUES ('16', '交换机', '3');
INSERT INTO `type` VALUES ('17', '服务器', '3');
INSERT INTO `type` VALUES ('18', '手机', '4');
INSERT INTO `type` VALUES ('19', 'SD卡', '4');
INSERT INTO `type` VALUES ('20', '手机配件', '4');
INSERT INTO `type` VALUES ('21', '通用物品', '6');
INSERT INTO `type` VALUES ('22', '固定资产', '6');
INSERT INTO `type` VALUES ('23', '无线同屏器', '3');
INSERT INTO `type` VALUES ('24', '电脑配件', '2');
INSERT INTO `type` VALUES ('25', '其他', '3');

-- ----------------------------
-- Table structure for user_group
-- ----------------------------
DROP TABLE IF EXISTS `user_group`;
CREATE TABLE `user_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `name` varchar(255) NOT NULL COMMENT '用户群组名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_group
-- ----------------------------
INSERT INTO `user_group` VALUES ('1', 'user');
INSERT INTO `user_group` VALUES ('2', 'admin');
INSERT INTO `user_group` VALUES ('3', 'manager');
