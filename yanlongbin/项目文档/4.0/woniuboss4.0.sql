/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50615
Source Host           : localhost:3306
Source Database       : woniuboss4.0

Target Server Type    : MYSQL
Target Server Version : 50615
File Encoding         : 65001

Date: 2019-06-17 19:41:19
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for abandon_record
-- ----------------------------
DROP TABLE IF EXISTS `abandon_record`;
CREATE TABLE `abandon_record` (
  `abandon_record_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '资源废弃记录表',
  `customer_id` int(11) DEFAULT NULL COMMENT 'customer表主键id',
  `work_id` varchar(20) DEFAULT '' COMMENT '员工工号',
  `abandon_time` varchar(20) DEFAULT '' COMMENT '废弃时间',
  PRIMARY KEY (`abandon_record_id`)
) ENGINE=InnoDB AUTO_INCREMENT=326792 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of abandon_record
-- ----------------------------

-- ----------------------------
-- Table structure for account_detail
-- ----------------------------
DROP TABLE IF EXISTS `account_detail`;
CREATE TABLE `account_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL COMMENT '账户id',
  `finance_detail_id` int(11) DEFAULT NULL COMMENT '财务流水id',
  `amount` decimal(10,2) NOT NULL,
  `status` varchar(10) DEFAULT '' COMMENT '是否报账',
  `create_time` varchar(20) DEFAULT '',
  `update_time` varchar(20) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4033 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of account_detail
-- ----------------------------

-- ----------------------------
-- Table structure for account_subject
-- ----------------------------
DROP TABLE IF EXISTS `account_subject`;
CREATE TABLE `account_subject` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT '0',
  `subject_name` varchar(100) NOT NULL,
  `finance_type` varchar(10) NOT NULL DEFAULT '' COMMENT '收支类型',
  `remark` varchar(255) DEFAULT '无' COMMENT '备注',
  `create_time` varchar(50) DEFAULT '',
  `update_time` varchar(50) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of account_subject
-- ----------------------------
INSERT INTO `account_subject` VALUES ('1', '0', '主营业务收入', '01', '无', '2018-12-25', '2018-12-27 17:10');
INSERT INTO `account_subject` VALUES ('2', '0', '其他业务收入', '01', null, '2018-12-25', '2018-12-27 17:07');
INSERT INTO `account_subject` VALUES ('3', '0', '营业外收入', '01', '无', '2018-12-25', '2018-12-27 17:10');
INSERT INTO `account_subject` VALUES ('4', '0', '其他应收款', '01', '', '2018-12-25', '');
INSERT INTO `account_subject` VALUES ('5', '0', '利润分配', '01', '', '2018-12-25', '');
INSERT INTO `account_subject` VALUES ('6', '0', '实收资本', '01', '', '2018-12-25', '');
INSERT INTO `account_subject` VALUES ('7', '0', '长期股权投资', '01', '', '2018-12-25', '');
INSERT INTO `account_subject` VALUES ('8', '1', '就业培训', '01', '', '2018-12-25', '');
INSERT INTO `account_subject` VALUES ('9', '1', '人力外包', '01', '', '2018-12-25', '');
INSERT INTO `account_subject` VALUES ('10', '1', '在线教育', '01', '', '2018-12-25', '');
INSERT INTO `account_subject` VALUES ('11', '1', '项目收入', '01', '', '2018-12-25', '');
INSERT INTO `account_subject` VALUES ('12', '2', '公租房租金', '01', '', '2018-12-25', '');
INSERT INTO `account_subject` VALUES ('13', '2', '其他', '01', '', '2018-12-25', '');
INSERT INTO `account_subject` VALUES ('14', '3', '政府补助', '01', '', '2018-12-25', '');
INSERT INTO `account_subject` VALUES ('15', '3', '验证费', '01', '', '2018-12-25', '');
INSERT INTO `account_subject` VALUES ('16', '3', '偶然所得', '01', '', '2018-12-25', '');
INSERT INTO `account_subject` VALUES ('17', '3', '其他', '01', '', '2018-12-25', '');
INSERT INTO `account_subject` VALUES ('18', '4', '借款', '01', '', '2018-12-25', '');
INSERT INTO `account_subject` VALUES ('19', '90', '多贷缴费', '04', '无', '2018-12-25', '');
INSERT INTO `account_subject` VALUES ('20', '5', '应付股利', '01', '', '2018-12-25', '');
INSERT INTO `account_subject` VALUES ('21', '6', '投资款', '01', '', '2018-12-25', '');
INSERT INTO `account_subject` VALUES ('22', '7', '投资款', '01', '', '2018-12-25', '');
INSERT INTO `account_subject` VALUES ('23', '0', '主营业务支出', '02', null, '2018-12-25', '2018-12-27 17:08');
INSERT INTO `account_subject` VALUES ('24', '0', '人力成本', '02', '', '2018-12-25', '');
INSERT INTO `account_subject` VALUES ('25', '0', '销售费用', '02', '', '2018-12-25', '');
INSERT INTO `account_subject` VALUES ('26', '0', '管理费用', '02', '', '2018-12-25', '');
INSERT INTO `account_subject` VALUES ('27', '0', '固定资产', '02', '', '2018-12-25', '');
INSERT INTO `account_subject` VALUES ('28', '0', '财务费用', '02', '', '2018-12-25', '');
INSERT INTO `account_subject` VALUES ('29', '0', '应交税费', '02', '', '2018-12-25', '');
INSERT INTO `account_subject` VALUES ('30', '0', '房租物业', '02', '', '2018-12-25', '');
INSERT INTO `account_subject` VALUES ('31', '0', '营业外支出', '02', '', '2018-12-25', '');
INSERT INTO `account_subject` VALUES ('32', '23', '学员退费', '02', '', '2018-12-25', '');
INSERT INTO `account_subject` VALUES ('33', '23', '转介绍费', '02', '', '2018-12-25', '');
INSERT INTO `account_subject` VALUES ('34', '23', '学员活动', '02', '', '2018-12-25', '');
INSERT INTO `account_subject` VALUES ('35', '23', '学员奖学金', '02', '', '2018-12-25', '');
INSERT INTO `account_subject` VALUES ('36', '23', '教材费', '02', '', '2018-12-25', '');
INSERT INTO `account_subject` VALUES ('37', '23', '书包采购费', '02', '', '2018-12-25', '');
INSERT INTO `account_subject` VALUES ('38', '23', '兼职费', '02', '', '2018-12-25', '');
INSERT INTO `account_subject` VALUES ('39', '23', '教学设备', '02', '', '2018-12-25', '');
INSERT INTO `account_subject` VALUES ('40', '23', '软件服务费', '02', '', '2018-12-25', '');
INSERT INTO `account_subject` VALUES ('41', '23', '其他', '02', '', '2018-12-25', '');
INSERT INTO `account_subject` VALUES ('42', '24', '基本工资', '02', '', '2018-12-25', '');
INSERT INTO `account_subject` VALUES ('43', '24', '绩效工资', '02', '', '2018-12-25', '');
INSERT INTO `account_subject` VALUES ('44', '24', '补贴', '02', '', '2018-12-25', '');
INSERT INTO `account_subject` VALUES ('45', '24', '员工福利', '02', '', '2018-12-25', '');
INSERT INTO `account_subject` VALUES ('46', '24', '公司奖励', '02', '', '2018-12-25', '');
INSERT INTO `account_subject` VALUES ('47', '24', '社保', '02', '', '2018-12-25', '');
INSERT INTO `account_subject` VALUES ('48', '24', '公积金', '02', '', '2018-12-25', '');
INSERT INTO `account_subject` VALUES ('49', '25', '广告费（简历）', '02', '', '2018-12-25', '');
INSERT INTO `account_subject` VALUES ('50', '25', '广告费（专属简历）', '02', '', '2018-12-25', '');
INSERT INTO `account_subject` VALUES ('51', '25', '广告费（招聘会）', '02', '', '2018-12-25', '');
INSERT INTO `account_subject` VALUES ('52', '25', '广告费（智联）', '02', '', '2018-12-25', '');
INSERT INTO `account_subject` VALUES ('53', '25', '广告费（腾讯）', '02', '', '2018-12-25', '');
INSERT INTO `account_subject` VALUES ('54', '25', '广告费（今日头条）', '02', '', '2018-12-25', '');
INSERT INTO `account_subject` VALUES ('55', '25', '市场推广', '02', '', '2018-12-25', '');
INSERT INTO `account_subject` VALUES ('56', '25', '商务费用', '02', '', '2018-12-25', '');
INSERT INTO `account_subject` VALUES ('57', '25', '其他', '02', '', '2018-12-25', '');
INSERT INTO `account_subject` VALUES ('59', '26', '办公用品', '02', '', '2018-12-25', '');
INSERT INTO `account_subject` VALUES ('60', '26', '差旅费', '02', '', '2018-12-25', '');
INSERT INTO `account_subject` VALUES ('61', '26', '招待费', '02', '', '2018-12-25', '');
INSERT INTO `account_subject` VALUES ('62', '26', '市内交通费', '02', '', '2018-12-25', '');
INSERT INTO `account_subject` VALUES ('63', '26', '通信费', '02', '', '2018-12-25', '');
INSERT INTO `account_subject` VALUES ('64', '26', '保洁费', '02', '', '2018-12-25', '');
INSERT INTO `account_subject` VALUES ('65', '26', '聘请中介费', '02', '', '2018-12-25', '');
INSERT INTO `account_subject` VALUES ('66', '26', '职工教育培训费', '02', '', '2018-12-25', '');
INSERT INTO `account_subject` VALUES ('67', '26', '维修费', '02', '', '2018-12-25', '');
INSERT INTO `account_subject` VALUES ('68', '27', '电脑网络设备', '02', '', '2018-12-25', '');
INSERT INTO `account_subject` VALUES ('69', '27', '空调', '02', '', '2018-12-25', '2018-12-25 16:26');
INSERT INTO `account_subject` VALUES ('70', '27', '办公家具', '02', '', '2018-12-25', '2018-12-25 16:26');
INSERT INTO `account_subject` VALUES ('71', '28', '银行手续费', '02', '', '2018-12-25', '');
INSERT INTO `account_subject` VALUES ('72', '28', '刷卡手续费', '02', '', '2018-12-25', '');
INSERT INTO `account_subject` VALUES ('73', '28', '利息费用', '02', '', '2018-12-25', '');
INSERT INTO `account_subject` VALUES ('74', '29', '增值税', '02', '', '2018-12-25', '');
INSERT INTO `account_subject` VALUES ('75', '29', '附加税', '02', '', '2018-12-25', '');
INSERT INTO `account_subject` VALUES ('76', '29', '个人所得税', '02', '', '2018-12-25', '');
INSERT INTO `account_subject` VALUES ('77', '29', '企业所得税', '02', '', '2018-12-25', '');
INSERT INTO `account_subject` VALUES ('78', '30', '房租', '02', '', '2018-12-25', '');
INSERT INTO `account_subject` VALUES ('79', '30', '物业费', '02', '', '2018-12-25', '');
INSERT INTO `account_subject` VALUES ('80', '30', '装修费', '02', '', '2018-12-25', '');
INSERT INTO `account_subject` VALUES ('81', '30', '水电费', '02', '', '2018-12-25', '');
INSERT INTO `account_subject` VALUES ('82', '31', '其他', '02', '', '2018-12-25', '');
INSERT INTO `account_subject` VALUES ('83', '0', '内部流转款项', '03', '没有实际发生的收入和支出', '2018-12-25', '2019-01-07 09:34');
INSERT INTO `account_subject` VALUES ('84', '83', '备用金', '03', '', '2018-12-25', '');
INSERT INTO `account_subject` VALUES ('85', '83', '预支款', '03', '无', '2018-12-25', '2019-01-07 10:11');
INSERT INTO `account_subject` VALUES ('86', '3', '利息收入', '01', '无', '2019-01-06', '2019-01-07 09:33');
INSERT INTO `account_subject` VALUES ('88', '83', '转账', '03', null, '2019-01-10', '');
INSERT INTO `account_subject` VALUES ('89', '26', '办公运营', '02', null, '2019-01-10', '');
INSERT INTO `account_subject` VALUES ('90', '0', '外部流转款项', '04', '外部的钱,只是公司暂时保管', '2019-01-11', '2019-01-12 11:57');
INSERT INTO `account_subject` VALUES ('91', '90', '多贷退费', '04', '无', '', '');
INSERT INTO `account_subject` VALUES ('92', '0', '其他应收款', '01', '其他应收款', '2019-02-27', '');
INSERT INTO `account_subject` VALUES ('93', '92', '还款', '01', '还款', '2019-02-27', '');
INSERT INTO `account_subject` VALUES ('94', '0', '其他应收款', '02', '其他应收款', '2019-02-27', '');
INSERT INTO `account_subject` VALUES ('95', '94', '借款', '02', '借款', '2019-02-27', '');
INSERT INTO `account_subject` VALUES ('96', '0', '应付股利', '02', '应付股利', '2019-03-04', '2019-03-04 17:36');
INSERT INTO `account_subject` VALUES ('97', '7', '投资收益', '01', '投资收益', '2019-03-04', '');
INSERT INTO `account_subject` VALUES ('98', '96', '股东分红', '02', '股东分红', '2019-03-04', '');

-- ----------------------------
-- Table structure for apply
-- ----------------------------
DROP TABLE IF EXISTS `apply`;
CREATE TABLE `apply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `work_id` varchar(20) DEFAULT NULL,
  `start_time` varchar(50) DEFAULT '',
  `end_time` varchar(50) DEFAULT '',
  `hours` varchar(10) DEFAULT '',
  `region_id` int(10) DEFAULT '0' COMMENT '加班区域',
  `apply_time` varchar(20) DEFAULT '',
  `reason` varchar(255) DEFAULT '',
  `status` varchar(10) DEFAULT '',
  `accounting_way` varchar(10) DEFAULT '',
  `create_time` varchar(50) DEFAULT '',
  `update_time` varchar(50) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=963 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of apply
-- ----------------------------

-- ----------------------------
-- Table structure for approve
-- ----------------------------
DROP TABLE IF EXISTS `approve`;
CREATE TABLE `approve` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `apply_id` int(11) DEFAULT '0',
  `approve_type` varchar(10) DEFAULT '' COMMENT '审批类型',
  `approve_id` varchar(20) DEFAULT '',
  `comment` varchar(255) DEFAULT '',
  `create_time` varchar(20) DEFAULT '',
  `update_time` varchar(20) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1349 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of approve
-- ----------------------------

-- ----------------------------
-- Table structure for assets
-- ----------------------------
DROP TABLE IF EXISTS `assets`;
CREATE TABLE `assets` (
  `assets_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `assets_name` varchar(50) DEFAULT '' COMMENT '资产名称',
  `assets_type` varchar(50) DEFAULT '' COMMENT '型号',
  `bar_code` varchar(70) DEFAULT '' COMMENT '条形码',
  `price` double DEFAULT NULL COMMENT '价格',
  `state` varchar(20) DEFAULT '' COMMENT '状态',
  `purchase_employee_id` int(11) DEFAULT '0' COMMENT '购买人',
  `purchase_time` varchar(70) DEFAULT '' COMMENT '购买时间',
  `note` varchar(100) DEFAULT '' COMMENT '固定资产备注信息',
  `create_time` varchar(50) DEFAULT NULL,
  `update_time` varchar(50) DEFAULT '' COMMENT '更新时间',
  `assets_owner` varchar(50) DEFAULT '01' COMMENT '资产归属',
  PRIMARY KEY (`assets_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1045 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of assets
-- ----------------------------

-- ----------------------------
-- Table structure for attendance
-- ----------------------------
DROP TABLE IF EXISTS `attendance`;
CREATE TABLE `attendance` (
  `attendance_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '考勤表主键id',
  `attendance_student_id` int(11) DEFAULT NULL COMMENT '学生表id',
  `class_id` int(11) DEFAULT NULL,
  `result` varchar(10) DEFAULT '' COMMENT '0表示正常，1表示迟到，2表示早退，3表示旷课，4表示旷课，5面试',
  `teacher_id` varchar(10) DEFAULT '' COMMENT '教师id',
  `phase` varchar(10) DEFAULT NULL,
  `week` varchar(10) DEFAULT NULL,
  `create_time` varchar(50) DEFAULT '' COMMENT '创建时间',
  `update_time` varchar(50) DEFAULT '' COMMENT '更新时间',
  PRIMARY KEY (`attendance_id`),
  KEY `student_id_index` (`attendance_student_id`) USING HASH COMMENT '考勤表学生id索引'
) ENGINE=InnoDB AUTO_INCREMENT=127 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of attendance
-- ----------------------------

-- ----------------------------
-- Table structure for bank_account
-- ----------------------------
DROP TABLE IF EXISTS `bank_account`;
CREATE TABLE `bank_account` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '卡号ID',
  `region_id` int(11) DEFAULT '0',
  `account_type` varchar(50) DEFAULT NULL,
  `account_no` varchar(50) DEFAULT NULL,
  `account_name` varchar(50) DEFAULT NULL,
  `status` varchar(10) DEFAULT '01',
  `balance` decimal(10,2) DEFAULT NULL COMMENT '初始余额',
  `max_date` varchar(20) DEFAULT '',
  `create_time` varchar(50) DEFAULT '',
  `update_time` varchar(50) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bank_account
-- ----------------------------

-- ----------------------------
-- Table structure for borrow
-- ----------------------------
DROP TABLE IF EXISTS `borrow`;
CREATE TABLE `borrow` (
  `borrow_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '固定资产借用表主键id',
  `borrow_assets_id` int(11) DEFAULT '0' COMMENT '资产id',
  `borrower_type` varchar(20) DEFAULT '' COMMENT '借用人类型，员工，学生等',
  `borrow_student_id` int(11) DEFAULT NULL,
  `borrow_employee_id` int(11) DEFAULT NULL,
  `lender_id` int(11) DEFAULT '0' COMMENT '借出人id',
  `borrow_time` varchar(50) DEFAULT NULL,
  `note` varchar(255) DEFAULT '' COMMENT '借用备注信息',
  `create_time` varchar(50) DEFAULT '' COMMENT '创建时间',
  `update_time` varchar(50) DEFAULT '' COMMENT '更新时间',
  PRIMARY KEY (`borrow_id`)
) ENGINE=InnoDB AUTO_INCREMENT=923 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of borrow
-- ----------------------------

-- ----------------------------
-- Table structure for card
-- ----------------------------
DROP TABLE IF EXISTS `card`;
CREATE TABLE `card` (
  `card_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '卡号ID',
  `account_type` varchar(50) DEFAULT NULL,
  `card_no` varchar(50) DEFAULT NULL,
  `card_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`card_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of card
-- ----------------------------

-- ----------------------------
-- Table structure for check_account
-- ----------------------------
DROP TABLE IF EXISTS `check_account`;
CREATE TABLE `check_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL,
  `work_id` varchar(20) DEFAULT NULL,
  `income_amount` decimal(10,2) DEFAULT NULL,
  `expend_amount` decimal(10,2) DEFAULT NULL,
  `start_balance` decimal(10,2) DEFAULT NULL,
  `end_balance` decimal(10,2) DEFAULT NULL,
  `start_time` varchar(20) DEFAULT NULL,
  `end_time` varchar(20) DEFAULT NULL,
  `create_time` varchar(20) DEFAULT NULL,
  `update_time` varchar(20) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of check_account
-- ----------------------------

-- ----------------------------
-- Table structure for claim
-- ----------------------------
DROP TABLE IF EXISTS `claim`;
CREATE TABLE `claim` (
  `claim_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '认领资源表主键id',
  `customer_id` int(11) DEFAULT NULL COMMENT 'customer表id',
  `work_id` varchar(20) DEFAULT '' COMMENT '工号',
  `claim_time` varchar(20) DEFAULT '' COMMENT '认领时间',
  PRIMARY KEY (`claim_id`)
) ENGINE=InnoDB AUTO_INCREMENT=128813 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of claim
-- ----------------------------

-- ----------------------------
-- Table structure for class
-- ----------------------------
DROP TABLE IF EXISTS `class`;
CREATE TABLE `class` (
  `class_id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT COMMENT '班级主键id',
  `region_id` int(11) DEFAULT NULL,
  `class_headmaster_id` int(11) DEFAULT NULL,
  `class_no` varchar(10) DEFAULT '' COMMENT '班级编号',
  `orientation` varchar(20) DEFAULT NULL COMMENT '方向',
  `opening_time` varchar(20) DEFAULT '' COMMENT '开班时间',
  `opening_status` varchar(20) DEFAULT '' COMMENT '开班状态',
  `create_time` varchar(50) DEFAULT '' COMMENT '创建时间',
  `update_time` varchar(50) DEFAULT '' COMMENT '更新时间',
  PRIMARY KEY (`class_id`)
) ENGINE=InnoDB AUTO_INCREMENT=230 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of class
-- ----------------------------

-- ----------------------------
-- Table structure for classroom
-- ----------------------------
DROP TABLE IF EXISTS `classroom`;
CREATE TABLE `classroom` (
  `classroom_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '教室表的主键id',
  `classroom_name` varchar(20) DEFAULT '' COMMENT '教室名字',
  `positon` varchar(100) DEFAULT '' COMMENT '教室的位置',
  `region_id` varchar(20) DEFAULT '' COMMENT '区域',
  `create_time` varchar(20) DEFAULT '' COMMENT '创建时间',
  `update_time` varchar(20) DEFAULT '' COMMENT '更新时间',
  PRIMARY KEY (`classroom_id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of classroom
-- ----------------------------
INSERT INTO `classroom` VALUES ('1', '教室一', '', '1', '', '');
INSERT INTO `classroom` VALUES ('2', '教室二', '', '1', '', '');
INSERT INTO `classroom` VALUES ('3', '教室三', '', '1', '', '');
INSERT INTO `classroom` VALUES ('4', '教室四', '', '1', '', '');
INSERT INTO `classroom` VALUES ('5', '教室五', '', '1', '', '');
INSERT INTO `classroom` VALUES ('6', '教室六', '', '1', '', '');
INSERT INTO `classroom` VALUES ('7', '教室七', '', '1', '', '');
INSERT INTO `classroom` VALUES ('8', '教室八', '', '1', '', '');
INSERT INTO `classroom` VALUES ('9', '1教室', '', '2', '', '');
INSERT INTO `classroom` VALUES ('10', '2教室', '', '2', '', '');
INSERT INTO `classroom` VALUES ('11', '3教室', '', '2', '', '');
INSERT INTO `classroom` VALUES ('12', '4教室', '', '2', '', '');
INSERT INTO `classroom` VALUES ('13', '5教室', '', '2', '', '');
INSERT INTO `classroom` VALUES ('14', '一教室', '', '3', '', '');
INSERT INTO `classroom` VALUES ('15', '二教室', '', '3', '', '');
INSERT INTO `classroom` VALUES ('16', '三教室', '', '3', '', '');
INSERT INTO `classroom` VALUES ('17', '四教室', '', '3', '', '');
INSERT INTO `classroom` VALUES ('18', '五教室', '', '3', '', '');
INSERT INTO `classroom` VALUES ('19', '教室九', '', '1', '', '');
INSERT INTO `classroom` VALUES ('20', '教室十', '', '1', '', '');
INSERT INTO `classroom` VALUES ('21', '六教室', '', '3', '', '');
INSERT INTO `classroom` VALUES ('22', '七教室', '', '3', '', '');
INSERT INTO `classroom` VALUES ('23', '一教室', '', '4', '', '');
INSERT INTO `classroom` VALUES ('24', '二教室', '', '4', '', '');
INSERT INTO `classroom` VALUES ('25', '三教室', '', '4', '', '');
INSERT INTO `classroom` VALUES ('26', '四教室', '', '4', '', '');
INSERT INTO `classroom` VALUES ('27', '多媒体教室', '', '1', '', '');
INSERT INTO `classroom` VALUES ('28', '6教室', '', '2', '', '');
INSERT INTO `classroom` VALUES ('29', '7教室', '', '2', '', '');
INSERT INTO `classroom` VALUES ('30', '8教室', '', '2', '', '');
INSERT INTO `classroom` VALUES ('31', '9教室', '', '2', '', '');
INSERT INTO `classroom` VALUES ('32', ' 八教室', '', '3', '', '');
INSERT INTO `classroom` VALUES ('33', '九教室', '', '3', '', '');
INSERT INTO `classroom` VALUES ('34', '教室十一', '', '1', '', '');
INSERT INTO `classroom` VALUES ('35', '教室十二', '', '1', '', '');

-- ----------------------------
-- Table structure for class_change
-- ----------------------------
DROP TABLE IF EXISTS `class_change`;
CREATE TABLE `class_change` (
  `class_change_id` int(11) NOT NULL AUTO_INCREMENT,
  `class_change_student_id` int(11) DEFAULT NULL,
  `class_change_before_class` int(11) DEFAULT NULL COMMENT '原先班级的id',
  `operator` varchar(50) DEFAULT NULL,
  `create_time` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`class_change_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of class_change
-- ----------------------------

-- ----------------------------
-- Table structure for class_cost
-- ----------------------------
DROP TABLE IF EXISTS `class_cost`;
CREATE TABLE `class_cost` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `class_id` int(10) NOT NULL COMMENT '班级id',
  `detail_id` int(10) NOT NULL,
  `work_id` varchar(20) DEFAULT NULL,
  `create_time` varchar(20) DEFAULT NULL,
  `update_time` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of class_cost
-- ----------------------------

-- ----------------------------
-- Table structure for config
-- ----------------------------
DROP TABLE IF EXISTS `config`;
CREATE TABLE `config` (
  `config_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '配置类主键id',
  `config_type` varchar(50) DEFAULT '' COMMENT '配置类型',
  `config_desc` varchar(500) DEFAULT '' COMMENT '配置描述',
  `available` varchar(20) DEFAULT 'yes' COMMENT '是否可用',
  `create_time` varchar(50) DEFAULT '' COMMENT '创建时间',
  `update_time` varchar(50) DEFAULT '' COMMENT '更新时间',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of config
-- ----------------------------
INSERT INTO `config` VALUES ('1', 'net_mail_recipient', '网络资源邮件的接收人', 'yes', '', '');
INSERT INTO `config` VALUES ('2', 'tracking_mail_recipient', '跟踪资源邮件的接收人', 'yes', '', '');
INSERT INTO `config` VALUES ('3', 'headmaster', '班主任', 'yes', '', '');
INSERT INTO `config` VALUES ('4', 'mail_resource_dept', '获取邮箱资源的部门', 'yes', '', '');
INSERT INTO `config` VALUES ('5', 'assistant', '助教', 'yes', '', '');
INSERT INTO `config` VALUES ('6', 'approve', '加班审批', 'yes', '', '');

-- ----------------------------
-- Table structure for config_info
-- ----------------------------
DROP TABLE IF EXISTS `config_info`;
CREATE TABLE `config_info` (
  `config_info_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '配置信息详情主键',
  `config_id` int(11) NOT NULL COMMENT '配置表主键',
  `config_info_key` varchar(50) DEFAULT '' COMMENT '配置详情的键',
  `config_info_value` varchar(255) DEFAULT '' COMMENT '配置详情的值',
  `available` varchar(20) DEFAULT 'yes' COMMENT '是否可用',
  `create_time` varchar(50) DEFAULT '' COMMENT '创建时间',
  `update_time` varchar(50) DEFAULT '' COMMENT '更新时间',
  PRIMARY KEY (`config_info_id`)
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of config_info
-- ----------------------------
INSERT INTO `config_info` VALUES ('1', '1', '3', 'zhengxuejiao@woniuxy.com', 'yes', '', '');
INSERT INTO `config_info` VALUES ('5', '1', '4', 'nixue@woniuxy.com', 'no', '', '');
INSERT INTO `config_info` VALUES ('6', '1', '12', 'leimingju@woniuxy.com', 'yes', '', '');
INSERT INTO `config_info` VALUES ('7', '1', '15', 'chenji@woniuxy.com', 'yes', '', '');
INSERT INTO `config_info` VALUES ('8', '1', '13', 'liuxuemei@woniuxy.com', 'yes', '', '');
INSERT INTO `config_info` VALUES ('9', '3', 'WNCD011', '郑雪娇', 'yes', '', '');
INSERT INTO `config_info` VALUES ('10', '3', 'WNCD023', '李姣', 'yes', '', '');
INSERT INTO `config_info` VALUES ('11', '3', 'WNCD032', '邓秋菊', 'yes', '', '');
INSERT INTO `config_info` VALUES ('12', '3', 'WNCD033', '张婷', 'yes', '', '');
INSERT INTO `config_info` VALUES ('13', '3', 'WNCD044', '蒋婷婷', 'yes', '', '');
INSERT INTO `config_info` VALUES ('14', '3', 'WNCD064', '汤雪娜', 'yes', '', '');
INSERT INTO `config_info` VALUES ('15', '3', 'WNCD092', '余鑫婷', 'yes', '', '');
INSERT INTO `config_info` VALUES ('16', '3', 'WNCD012', '刘敏', 'yes', '', '');
INSERT INTO `config_info` VALUES ('17', '3', 'WNCD021', '李伟', 'yes', '', '');
INSERT INTO `config_info` VALUES ('18', '3', 'WNCD065', '邓为', 'yes', '', '');
INSERT INTO `config_info` VALUES ('19', '4', '1', '3', 'yes', '', '');
INSERT INTO `config_info` VALUES ('20', '4', '2', '12', 'yes', '', '');
INSERT INTO `config_info` VALUES ('21', '4', '3', '15', 'yes', '', '');
INSERT INTO `config_info` VALUES ('22', '4', '4', '22', 'yes', '', '');
INSERT INTO `config_info` VALUES ('23', '3', 'WNSH009', '张晨', 'no', '', '');
INSERT INTO `config_info` VALUES ('24', '3', 'WNSH008', '吴键', 'no', '', '');
INSERT INTO `config_info` VALUES ('25', '3', 'WNSH011', '田雨', 'no', '', '');
INSERT INTO `config_info` VALUES ('26', '3', 'WNCQ010', '雷明菊', 'yes', '', '');
INSERT INTO `config_info` VALUES ('27', '3', 'WNCQ022', '张曼丽', 'yes', '', '');
INSERT INTO `config_info` VALUES ('28', '3', 'WNCQ020', '高羽', 'yes', '', '');
INSERT INTO `config_info` VALUES ('29', '3', 'WNCQ033', '卢芳', 'no', '', '');
INSERT INTO `config_info` VALUES ('30', '3', 'WNCQ028', '肖俊彦', 'yes', '', '');
INSERT INTO `config_info` VALUES ('31', '3', 'WNXA002', '朱敏', 'yes', '', '');
INSERT INTO `config_info` VALUES ('32', '3', 'WNXA003', '郑梦杰', 'yes', '', '');
INSERT INTO `config_info` VALUES ('33', '3', 'WNXA006', '刘佩', 'yes', '', '');
INSERT INTO `config_info` VALUES ('34', '3', 'WNXA017', '路云', 'yes', '', '');
INSERT INTO `config_info` VALUES ('35', '3', 'WNSH000', '倪雪', 'yes', '', '');
INSERT INTO `config_info` VALUES ('36', '1', '22', 'liuxuemei@woniuxy.com', 'yes', '', '');
INSERT INTO `config_info` VALUES ('37', '3', 'WNXA020', '邓黎', 'yes', '', '');
INSERT INTO `config_info` VALUES ('38', '3', 'WNCD086', '王婧', 'yes', '', '');
INSERT INTO `config_info` VALUES ('39', '3', 'WNCD003', '陈华', 'yes', '', '');
INSERT INTO `config_info` VALUES ('40', '5', 'WNCD076', '易雪飞', 'yes', '', '');
INSERT INTO `config_info` VALUES ('41', '5', 'WNCD087', '杨婷', 'yes', '', '');
INSERT INTO `config_info` VALUES ('42', '6', 'WNCD024', 'WNCD095', 'yes', '', '');
INSERT INTO `config_info` VALUES ('43', '6', 'WNCD030', 'WNCD095', 'yes', '', '');
INSERT INTO `config_info` VALUES ('44', '6', 'WNCD051', 'WNCD095', 'yes', '', '');
INSERT INTO `config_info` VALUES ('45', '6', 'WNCD075', 'WNCD095', 'yes', '', '');
INSERT INTO `config_info` VALUES ('46', '6', 'WNCD093', 'WNCD095', 'yes', '', '');
INSERT INTO `config_info` VALUES ('47', '6', 'WNCD076', 'WNCD095', 'yes', '', '');
INSERT INTO `config_info` VALUES ('48', '6', 'WNCD028', 'WNCD097', 'yes', '', '');
INSERT INTO `config_info` VALUES ('49', '6', 'WNCD060', 'WNCD097', 'yes', '', '');
INSERT INTO `config_info` VALUES ('50', '6', 'WNCD072', 'WNCD097', 'yes', '', '');
INSERT INTO `config_info` VALUES ('51', '6', 'WNCD087', 'WNCD097', 'yes', '', '');
INSERT INTO `config_info` VALUES ('52', '6', 'WNCD095', 'WNCD097', 'yes', '', '');
INSERT INTO `config_info` VALUES ('53', '6', 'WNCD046', 'WNCD097', 'yes', '', '');
INSERT INTO `config_info` VALUES ('54', '6', 'WNCQ023', 'WNCQ007', 'yes', '', '');
INSERT INTO `config_info` VALUES ('55', '6', 'WNCQ027', 'WNCQ007', 'yes', '', '');
INSERT INTO `config_info` VALUES ('56', '6', 'WNCQ029', 'WNCQ007', 'yes', '', '');
INSERT INTO `config_info` VALUES ('57', '6', 'WNCQ034', 'WNCQ007', 'yes', '', '');
INSERT INTO `config_info` VALUES ('58', '6', 'WNCQ035', 'WNCQ007', 'yes', '', '');
INSERT INTO `config_info` VALUES ('59', '6', 'WNCQ036', 'WNCQ007', 'yes', '', '');
INSERT INTO `config_info` VALUES ('60', '6', 'WNCQ037', 'WNCQ007', 'yes', '', '');
INSERT INTO `config_info` VALUES ('61', '6', 'WNCQ038', 'WNCQ007', 'yes', '', '');
INSERT INTO `config_info` VALUES ('62', '6', 'WNCQ039', 'WNCQ007', 'yes', '', '');
INSERT INTO `config_info` VALUES ('63', '6', 'WNCQ007', 'WNCQ001', 'yes', '', '');
INSERT INTO `config_info` VALUES ('64', '6', 'WNXA008', 'WNXA005', 'yes', '', '');
INSERT INTO `config_info` VALUES ('65', '6', 'WNXA011', 'WNXA005', 'yes', '', '');
INSERT INTO `config_info` VALUES ('66', '6', 'WNXA015', 'WNXA005', 'yes', '', '');
INSERT INTO `config_info` VALUES ('67', '6', 'WNXA013', 'WNXA005', 'yes', '', '');
INSERT INTO `config_info` VALUES ('68', '6', 'WNXA018', 'WNXA005', 'yes', '', '');
INSERT INTO `config_info` VALUES ('69', '6', 'WNXA019', 'WNXA005', 'yes', '', '');
INSERT INTO `config_info` VALUES ('70', '6', 'WNXA021', 'WNXA005', 'yes', '', '');
INSERT INTO `config_info` VALUES ('71', '6', 'WNXA005', 'WNXA014', 'yes', '', '');
INSERT INTO `config_info` VALUES ('72', '6', 'WNSH007', 'WNSH015', 'yes', '', '');
INSERT INTO `config_info` VALUES ('73', '5', 'WNCQ039', '刘东明', 'yes', '', '');
INSERT INTO `config_info` VALUES ('74', '5', 'WNSH012', '于航', 'yes', '', '');
INSERT INTO `config_info` VALUES ('75', '3', 'WNSH010', '曾阳能', 'no', '', '');
INSERT INTO `config_info` VALUES ('76', '3', 'WNCQ002', '郭蕊', 'no', '', '');
INSERT INTO `config_info` VALUES ('77', '3', 'WNSH013', '舒晓宇', 'yes', '', '');
INSERT INTO `config_info` VALUES ('78', '3', 'WNCQ040', '覃玲', 'yes', '', '');
INSERT INTO `config_info` VALUES ('79', '6', 'WNSH015', 'WNSH001', 'yes', '', '');
INSERT INTO `config_info` VALUES ('80', '6', 'WNCQ045', 'WNCQ007', 'yes', '', '');
INSERT INTO `config_info` VALUES ('81', '6', 'WNSH012', 'WNSH015', 'yes', '', '');
INSERT INTO `config_info` VALUES ('82', '6', 'WNSH014', 'WNSH015', 'yes', '', '');
INSERT INTO `config_info` VALUES ('83', '6', 'WNXA024', 'WNXA005', 'yes', '', '');
INSERT INTO `config_info` VALUES ('84', '3', 'WNCD045', '李洋', 'yes', '', '');
INSERT INTO `config_info` VALUES ('85', '3', 'WNSH020', '王露苑', 'yes', '', '');
INSERT INTO `config_info` VALUES ('86', '6', 'WNCD101', 'WNCD095', 'yes', '', '');
INSERT INTO `config_info` VALUES ('87', '6', 'WNCD103', 'WNCD095', 'yes', '', '');
INSERT INTO `config_info` VALUES ('88', '3', 'WNXA023', '吕菲', 'yes', '', '');
INSERT INTO `config_info` VALUES ('89', '6', 'WNCQ043', 'WNCQ007', 'yes', '', '');
INSERT INTO `config_info` VALUES ('90', '6', 'WNCQ047', 'WNCQ007', 'yes', '', '');
INSERT INTO `config_info` VALUES ('91', '6', 'WNXA025', 'WNXA005', 'yes', '', '');
INSERT INTO `config_info` VALUES ('92', '6', 'WNSH021', 'WNSH001', 'yes', '', '');
INSERT INTO `config_info` VALUES ('93', '6', 'WNSH022', 'WNSH001', 'yes', '', '');
INSERT INTO `config_info` VALUES ('94', '6', 'WNCD108', 'WNCD097', 'yes', '', '');
INSERT INTO `config_info` VALUES ('95', '3', 'WNCQ044', '廖娟', 'yes', '', '');
INSERT INTO `config_info` VALUES ('96', '6', 'WNSH023', 'WNSH015', 'yes', '', '');
INSERT INTO `config_info` VALUES ('97', '3', 'WNSH021', '汪丹华', 'yes', '', '');

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `course_id` int(11) NOT NULL AUTO_INCREMENT,
  `plan` varchar(100) DEFAULT '' COMMENT '课程安排',
  `course_name` varchar(100) DEFAULT '' COMMENT '课程名称',
  `major` varchar(20) DEFAULT '' COMMENT '方向',
  `vision` varchar(20) DEFAULT '' COMMENT '课程体系版本',
  `phase` varchar(10) DEFAULT NULL,
  `weeks` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`course_id`)
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES ('1', '基础阶段-第一周', 'HTML5+CSS3', '公共', '4', null, null);
INSERT INTO `course` VALUES ('2', '基础阶段-第二周', 'JavaScript+Jquery', '公共', '4', null, null);
INSERT INTO `course` VALUES ('3', '基础阶段-第三周', 'SQLServer+MySQL', '公共', '4', null, null);
INSERT INTO `course` VALUES ('4', '基础阶段-第四周', 'Linux+研发管理工具', '公共', '4', null, null);
INSERT INTO `course` VALUES ('5', '第一阶段-第一周', 'Java程序设计基础', '开发', '4', null, null);
INSERT INTO `course` VALUES ('6', '第一阶段-第二周', 'Java进阶', '开发', '4', null, null);
INSERT INTO `course` VALUES ('7', '第一阶段-第三周', '坦克大战', '开发', '4', null, null);
INSERT INTO `course` VALUES ('8', '第二阶段-第一周', 'Java高级及网络编程', '开发', '4', null, null);
INSERT INTO `course` VALUES ('9', '第二阶段-第二周', 'JavaWeb服务器开发', '开发', '4', null, null);
INSERT INTO `course` VALUES ('10', '第二阶段-第三周', '网上商城项目', '开发', '4', null, null);
INSERT INTO `course` VALUES ('11', '第三阶段-第一周', 'Struts+Hibernate', '开发', '4', null, null);
INSERT INTO `course` VALUES ('12', '第三阶段-第二周', 'Spring+SpringMVC', '开发', '4', null, null);
INSERT INTO `course` VALUES ('13', '第三阶段-第三周', 'MyBatis+框架整合', '开发', '4', null, null);
INSERT INTO `course` VALUES ('14', '项目阶段-第一周', '项目', '开发', '4', null, null);
INSERT INTO `course` VALUES ('15', '项目阶段-第二周', '项目', '开发', '4', null, null);
INSERT INTO `course` VALUES ('16', '项目阶段-第三周', '项目', '开发', '4', null, null);
INSERT INTO `course` VALUES ('17', '第一阶段-第一周', 'Python程序设计基础', '测试', '4', null, null);
INSERT INTO `course` VALUES ('18', '第一阶段-第二周', 'Python高级', '测试', '4', null, null);
INSERT INTO `course` VALUES ('19', '第一阶段-第三周', '网络协议+实战项目', '测试', '4', null, null);
INSERT INTO `course` VALUES ('20', '第二阶段-第一周', 'Selenium自动化', '测试', '4', null, null);
INSERT INTO `course` VALUES ('21', '第二阶段-第二周', '系统测试+接口测试自动化', '测试', '4', null, null);
INSERT INTO `course` VALUES ('22', '第二阶段-第三周', '性能测试', '测试', '4', null, null);
INSERT INTO `course` VALUES ('23', '第三阶段-第一周', 'RobotFramework框架', '测试', '4', null, null);
INSERT INTO `course` VALUES ('24', '第三阶段-第二周', 'TinyShop项目', '测试', '4', null, null);
INSERT INTO `course` VALUES ('25', '第三阶段-第三周', 'VR租赁项目', '测试', '4', null, null);
INSERT INTO `course` VALUES ('26', '项目阶段-第一周', '项目', '测试', '4', null, null);
INSERT INTO `course` VALUES ('27', '项目阶段-第二周', '项目', '测试', '4', null, null);
INSERT INTO `course` VALUES ('28', '项目阶段-第三周', '项目', '测试', '4', null, null);
INSERT INTO `course` VALUES ('50', '第一阶段-第一周', 'HTML与JavaScript', '开发', '5', '01', null);
INSERT INTO `course` VALUES ('51', '第一阶段-第二周', 'Java编程基础', '开发', '5', '01', null);
INSERT INTO `course` VALUES ('52', '第一阶段-第三周', 'Java面向对象', '开发', '5', '01', null);
INSERT INTO `course` VALUES ('53', '第一阶段-第四周', 'Java核心对象', '开发', '5', '01', null);
INSERT INTO `course` VALUES ('54', '第一阶段-第五周', 'WoniuTank游戏项目', '开发', '5', '01', null);
INSERT INTO `course` VALUES ('55', '第二阶段-第一周', 'MySQL数据库', '开发', '5', '02', null);
INSERT INTO `course` VALUES ('56', '第二阶段-第二周', '网络与JDBC/DAO', '开发', '5', '02', null);
INSERT INTO `course` VALUES ('57', '第二阶段-第三周', 'JSP与Servlet', '开发', '5', '02', null);
INSERT INTO `course` VALUES ('58', '第二阶段-第四周', 'Java高级应用', '开发', '5', '02', null);
INSERT INTO `course` VALUES ('59', '第二阶段-第五周', 'WoniuShop网站项目', '开发', '5', '02', null);
INSERT INTO `course` VALUES ('60', '第三阶段-第一周', 'Linux操作系统', '开发', '5', '03', null);
INSERT INTO `course` VALUES ('61', '第三阶段-第二周', 'Java设计模式', '开发', '5', '03', null);
INSERT INTO `course` VALUES ('62', '第三阶段-第三周', '企业级框架SSH(一)', '开发', '5', '03', null);
INSERT INTO `course` VALUES ('63', '第三阶段-第四周', '企业级框架SSH(二)', '开发', '5', '03', null);
INSERT INTO `course` VALUES ('64', '第三阶段-第五周', '企业级框架SSM等', '开发', '5', '03', null);
INSERT INTO `course` VALUES ('65', '第三阶段-第六周', '企业快速开发框架', '开发', '5', '03', null);
INSERT INTO `course` VALUES ('66', '第四阶段-第一周', '综合项目实战', '开发', '5', '04', null);
INSERT INTO `course` VALUES ('67', '第四阶段-第二周', '综合项目实战', '开发', '5', '04', null);
INSERT INTO `course` VALUES ('68', '第四阶段-第三周', '综合项目实战', '开发', '5', '04', null);
INSERT INTO `course` VALUES ('69', '第四阶段-第四周', '综合项目实战', '开发', '5', '04', null);
INSERT INTO `course` VALUES ('70', '第四阶段-第五周', '总结补充与面试指导', '开发', '5', '04', null);
INSERT INTO `course` VALUES ('71', '第一阶段-第一周', 'HTML+JavaScript', '测试', '5', '01', null);
INSERT INTO `course` VALUES ('72', '第一阶段-第二周', 'MySQL数据库', '测试', '5', '01', null);
INSERT INTO `course` VALUES ('73', '第一阶段-第三周', 'Linux操作系统', '测试', '5', '01', null);
INSERT INTO `course` VALUES ('74', '第一阶段-第四周', 'Python编程基础', '测试', '5', '01', null);
INSERT INTO `course` VALUES ('75', '第一阶段-第五周', 'Python高级编程', '测试', '5', '01', null);
INSERT INTO `course` VALUES ('76', '第二阶段-第一周', '系统测试基础', '测试', '5', '02', null);
INSERT INTO `course` VALUES ('77', '第二阶段-第二周', '系统测试项目', '测试', '5', '02', null);
INSERT INTO `course` VALUES ('78', '第二阶段-第三周', 'GUI测试自动化', '测试', '5', '02', null);
INSERT INTO `course` VALUES ('79', '第二阶段-第四周', '接口测试自动化', '测试', '5', '02', null);
INSERT INTO `course` VALUES ('80', '第二阶段-第五周', '性能测试自动化', '测试', '5', '02', null);
INSERT INTO `course` VALUES ('81', '第三阶段-第一周', '综合项目+系统测试', '测试', '5', '03', null);
INSERT INTO `course` VALUES ('82', '第三阶段-第二周', '综合测试项目+自动化测试', '测试', '5', '03', null);
INSERT INTO `course` VALUES ('83', '第三阶段-第三周', '综合测试项目+性能测试', '测试', '5', '03', null);
INSERT INTO `course` VALUES ('84', '第三阶段-第四周', 'WoniuCBT测试框架', '测试', '5', '03', null);
INSERT INTO `course` VALUES ('85', '第三阶段-第五周', '自动化测试框架实战', '测试', '5', '03', null);
INSERT INTO `course` VALUES ('86', '第三阶段-第六周', '软件测试专题课程', '测试', '5', '03', null);
INSERT INTO `course` VALUES ('87', '第一阶段-第一周', 'JavaSE编程基础', '开发', '6', '01', '01');
INSERT INTO `course` VALUES ('88', '第一阶段-第二周', 'JavaSE面向对象', '开发', '6', '01', '02');
INSERT INTO `course` VALUES ('89', '第一阶段-第三周', 'JavaSE核心对象', '开发', '6', '01', '03');
INSERT INTO `course` VALUES ('90', '第一阶段-第四周', 'WoniuTank项目', '开发', '6', '01', '04');
INSERT INTO `course` VALUES ('91', '第一阶段-第五周', 'MySQL数据库', '开发', '6', '01', '05');
INSERT INTO `course` VALUES ('92', '第二阶段-第一周', 'Web前端编程', '开发', '6', '02', '01');
INSERT INTO `course` VALUES ('93', '第二阶段-第二周', 'Web前端高级', '开发', '6', '02', '02');
INSERT INTO `course` VALUES ('94', '第二阶段-第三周', 'JavaWeb开发', '开发', '6', '02', '03');
INSERT INTO `course` VALUES ('95', '第二阶段-第四周', '自定义Web框架', '开发', '6', '02', '04');
INSERT INTO `course` VALUES ('96', '第二阶段-第五周', 'WoniuShop项目', '开发', '6', '02', '05');
INSERT INTO `course` VALUES ('97', '第三阶段-第一周', 'Linux操作系统', '开发', '6', '03', '01');
INSERT INTO `course` VALUES ('98', '第三阶段-第二周', '企业级框架(1)', '开发', '6', '03', '02');
INSERT INTO `course` VALUES ('99', '第三阶段-第三周', '企业级框架(2)', '开发', '6', '03', '03');
INSERT INTO `course` VALUES ('100', '第三阶段-第四周', 'JavaEE项目实战', '开发', '6', '03', '04');
INSERT INTO `course` VALUES ('101', '第三阶段-第五周', 'JavaEE项目实战', '开发', '6', '03', '05');
INSERT INTO `course` VALUES ('102', '第四阶段-第一周', '分布式与微服务(1)', '开发', '6', '04', '01');
INSERT INTO `course` VALUES ('103', '第四阶段-第二周', '分布式与微服务(2)', '开发', '6', '04', '02');
INSERT INTO `course` VALUES ('104', '第四阶段-第三周', '分布式架构项目实战', '开发', '6', '04', '03');
INSERT INTO `course` VALUES ('105', '第四阶段-第四周', '分布式架构项目实战', '开发', '6', '04', '04');
INSERT INTO `course` VALUES ('106', '第四阶段-第五周', '分布式架构项目实战', '开发', '6', '04', '05');
INSERT INTO `course` VALUES ('107', '第一阶段-第一周', 'Web前端与编程基础', '测试', '6', '01', '01');
INSERT INTO `course` VALUES ('108', '第一阶段-第二周', 'MySQL数据库', '测试', '6', '01', '02');
INSERT INTO `course` VALUES ('109', '第一阶段-第三周', 'Linux操作系统', '测试', '6', '01', '03');
INSERT INTO `course` VALUES ('110', '第一阶段-第四周', 'Python编程基础', '测试', '6', '01', '04');
INSERT INTO `course` VALUES ('111', '第一阶段-第五周', 'Python高级编程', '测试', '6', '01', '05');
INSERT INTO `course` VALUES ('112', '第二阶段-第一周', '系统测试基础', '测试', '6', '02', '01');
INSERT INTO `course` VALUES ('113', '第二阶段-第二周', '系统测试项目', '测试', '6', '02', '02');
INSERT INTO `course` VALUES ('114', '第二阶段-第三周', 'GUI测试自动化', '测试', '6', '02', '03');
INSERT INTO `course` VALUES ('115', '第二阶段-第四周', '接口测试自动化', '测试', '6', '02', '04');
INSERT INTO `course` VALUES ('116', '第二阶段-第五周', '性能测试自动化', '测试', '6', '02', '05');
INSERT INTO `course` VALUES ('117', '第三阶段-第一周', '综合测试+系统测试', '测试', '6', '04', '01');
INSERT INTO `course` VALUES ('118', '第三阶段-第二周', '综合项目+自动化测试', '测试', '6', '04', '02');
INSERT INTO `course` VALUES ('119', '第三阶段-第三周', '综合项目+性能测试', '测试', '6', '04', '03');
INSERT INTO `course` VALUES ('120', '第三阶段-第四周', '测试开发与框架进阶', '测试', '6', '04', '04');
INSERT INTO `course` VALUES ('121', '第三阶段-第五周', '移动端测试项目', '测试', '6', '04', '05');
INSERT INTO `course` VALUES ('122', '第三阶段-第六周', '软件测试专题课程', '测试', '6', '04', '06');
INSERT INTO `course` VALUES ('123', '第四阶段-第一周', '就业与补充强化', '测试', '6', '05', '01');
INSERT INTO `course` VALUES ('124', '第五阶段-第一周', '就业与补充强化', '开发', '6', '05', '01');

-- ----------------------------
-- Table structure for curriculum_schedule
-- ----------------------------
DROP TABLE IF EXISTS `curriculum_schedule`;
CREATE TABLE `curriculum_schedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `work_id` varchar(10) DEFAULT NULL COMMENT '教师id',
  `course_id` varchar(255) DEFAULT NULL COMMENT '课程表id',
  `class_id` int(11) NOT NULL COMMENT '班级id',
  `classroom_id` int(11) DEFAULT NULL COMMENT '教室表id',
  `start_time` varchar(50) DEFAULT NULL COMMENT '开始时间',
  `end_time` varchar(50) DEFAULT NULL COMMENT '结束时间',
  `operator_id` varchar(20) DEFAULT '' COMMENT '排课人',
  `create_time` varchar(20) DEFAULT '' COMMENT '创建时间',
  `update_time` varchar(20) DEFAULT '' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1766 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of curriculum_schedule
-- ----------------------------

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `region_id` int(11) DEFAULT '1',
  `department_id` int(11) DEFAULT '3' COMMENT '资源归属于的部门id，默认为咨询部',
  `pool_type` varchar(20) DEFAULT 'temp' COMMENT '资源池类型，‘temp’临时池，private 个人池，public 公共池，student 学生池',
  `tracking_times` int(11) DEFAULT '0',
  `name` varchar(200) DEFAULT '',
  `age` varchar(50) DEFAULT '0',
  `sex` varchar(50) DEFAULT '男',
  `tel` varchar(100) DEFAULT '18B7AC559AC7D17A' COMMENT '电话号码，默认为加密的0',
  `email` varchar(50) DEFAULT '0',
  `work_id` varchar(50) DEFAULT '0' COMMENT '员工工号',
  `qq` varchar(100) DEFAULT '18B7AC559AC7D17A' COMMENT '加密后的0',
  `wechat` varchar(50) DEFAULT '18B7AC559AC7D17A',
  `school` varchar(100) DEFAULT '0',
  `major` varchar(100) DEFAULT '0',
  `education` varchar(50) DEFAULT '04',
  `workage` varchar(20) DEFAULT '08',
  `experience` text,
  `intent` text,
  `salary` varchar(100) DEFAULT '0',
  `type` varchar(50) DEFAULT '0',
  `source` varchar(50) DEFAULT '10',
  `applposition` text,
  `priority` varchar(20) DEFAULT '03' COMMENT '资源的优先级',
  `eduexp` text,
  `last_status` varchar(50) DEFAULT '01' COMMENT '状态:新入库 未跟踪 无意向 有意向',
  `last_tracking_remark` text COMMENT '最新的跟踪内容',
  `resume_content` varchar(255) DEFAULT '' COMMENT '简历的存放路径',
  `next_tracking_time` varchar(50) DEFAULT '' COMMENT '''下次跟踪时间''',
  `last_tracking` varchar(50) DEFAULT '' COMMENT '''最后跟踪时间''',
  `allot_time` varchar(50) DEFAULT '' COMMENT '废弃资源的时间',
  `create_time` varchar(50) DEFAULT '',
  `update_time` varchar(50) DEFAULT '',
  `abandon_time` varchar(50) DEFAULT '' COMMENT '资源废弃时间',
  `transmit_time` varchar(50) DEFAULT '' COMMENT '转交资源的时间',
  `alter_time` varchar(50) DEFAULT '' COMMENT '修改资源的时间',
  `receive_time` varchar(50) DEFAULT '' COMMENT '认领资源的时间',
  `mail_uid` varchar(50) DEFAULT NULL,
  `tel_source` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=731573 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of customer
-- ----------------------------

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `department_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '部门表主键id',
  `region_id` int(11) DEFAULT '0' COMMENT '区域id',
  `department_name` varchar(20) DEFAULT '' COMMENT '部门名称',
  `parent_department_id` int(11) DEFAULT '0' COMMENT '上级部门编号',
  `department_manager_id` int(11) DEFAULT '0' COMMENT '部门负责人，关联employee表',
  `kod_user` varchar(50) DEFAULT NULL,
  `create_time` varchar(20) DEFAULT '' COMMENT '创建时间',
  `update_time` varchar(20) DEFAULT '' COMMENT '更新时间',
  PRIMARY KEY (`department_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES ('1', '1', '管理部', '0', '0', 'user000', '', '');
INSERT INTO `department` VALUES ('2', '1', '就业部', '0', '0', 'user000', '', '');
INSERT INTO `department` VALUES ('3', '1', '咨询部', '0', '0', 'user000', '', '');
INSERT INTO `department` VALUES ('4', '1', '电销部', '0', '0', 'user000', '', '');
INSERT INTO `department` VALUES ('5', '1', '渠道部', '0', '0', 'user000', '', '');
INSERT INTO `department` VALUES ('6', '1', '市场部', '0', '0', 'user000', '', '');
INSERT INTO `department` VALUES ('7', '1', '教学部', '0', '0', 'user000', '', '');
INSERT INTO `department` VALUES ('8', '1', '研发部', '0', '0', 'user000', '', '');
INSERT INTO `department` VALUES ('9', '1', '财务部', '0', '0', 'user000', '', '');
INSERT INTO `department` VALUES ('10', '2', '管理部', '0', '0', 'user000', '', '');
INSERT INTO `department` VALUES ('11', '2', '就业部', '0', '0', 'user000', '', '');
INSERT INTO `department` VALUES ('12', '2', '咨询部', '0', '0', 'user000', '', '');
INSERT INTO `department` VALUES ('13', '2', '渠道部', '0', '0', 'user000', '', '');
INSERT INTO `department` VALUES ('14', '2', '教学部', '0', '0', 'user000', '', '');
INSERT INTO `department` VALUES ('15', '3', '咨询部', '0', '0', 'user000', '', '');
INSERT INTO `department` VALUES ('16', '3', '管理部', '0', '0', 'user000', '', '');
INSERT INTO `department` VALUES ('17', '3', '教学部', '0', '0', 'user000', '', '');
INSERT INTO `department` VALUES ('18', '2', '市场部', '0', '0', 'user000', '', '');
INSERT INTO `department` VALUES ('19', '3', '就业部', '0', '0', 'user000', '', '');
INSERT INTO `department` VALUES ('20', '4', '管理部', '0', '0', 'user000', '', '');
INSERT INTO `department` VALUES ('21', '4', '教学部', '0', '0', 'user000', '', '');
INSERT INTO `department` VALUES ('22', '4', '咨询部', '0', '0', 'user000', '', '');
INSERT INTO `department` VALUES ('23', '4', '就业部', '0', '0', 'user000', '', '');

-- ----------------------------
-- Table structure for dictionary_data
-- ----------------------------
DROP TABLE IF EXISTS `dictionary_data`;
CREATE TABLE `dictionary_data` (
  `dict_data_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '码表主键id',
  `dict_type_id` int(11) NOT NULL COMMENT '数据字典类型id',
  `dict_key` varchar(20) DEFAULT '' COMMENT '码表选项的值',
  `dict_value` varchar(100) DEFAULT '' COMMENT '码表选项的含义',
  `sort` int(10) DEFAULT NULL COMMENT '排序',
  `status` varchar(20) DEFAULT '' COMMENT '正常或者停用',
  `modifier_id` varchar(20) DEFAULT '' COMMENT '修改人的工号',
  `remarks` varchar(255) DEFAULT '' COMMENT '数据字典的描述',
  `create_time` varchar(50) DEFAULT '' COMMENT '创建时间',
  `update_time` varchar(50) DEFAULT '' COMMENT '更新时间',
  PRIMARY KEY (`dict_data_id`)
) ENGINE=InnoDB AUTO_INCREMENT=233 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dictionary_data
-- ----------------------------
INSERT INTO `dictionary_data` VALUES ('1', '1', '01', '新入库', '10', '启用', '', '无', '2018-02-14', '');
INSERT INTO `dictionary_data` VALUES ('2', '1', '02', '新认领', '20', '启用', '', '无', '2018-02-14', '');
INSERT INTO `dictionary_data` VALUES ('3', '1', '03', '已预约', '30', '启用', '', '无', '2018-02-14', '');
INSERT INTO `dictionary_data` VALUES ('4', '1', '04', '已上门', '40', '启用', '', '无', '2018-02-14', '');
INSERT INTO `dictionary_data` VALUES ('5', '1', '05', '再投递', '50', '启用', '', '无', '2018-02-14', '');
INSERT INTO `dictionary_data` VALUES ('6', '1', '06', '已报名', '60', '启用', '', '无', '2018-02-14', '');
INSERT INTO `dictionary_data` VALUES ('7', '1', '07', '可跟进', '70', '启用', '', '无', '2018-02-14', '');
INSERT INTO `dictionary_data` VALUES ('8', '1', '08', '无意向', '80', '启用', '', '无', '2018-02-14', '');
INSERT INTO `dictionary_data` VALUES ('9', '1', '09', '未联系上', '90', '启用', '', '无', '2018-02-14', '');
INSERT INTO `dictionary_data` VALUES ('10', '1', '10', '培训过', '100', '启用', '', '无', '2018-02-14', '');
INSERT INTO `dictionary_data` VALUES ('11', '1', '11', '条件不符', '110', '启用', '', '无', '2018-02-14', '');
INSERT INTO `dictionary_data` VALUES ('12', '2', '01', '在职', '10', '启用', '', '无', '2018-02-14', '');
INSERT INTO `dictionary_data` VALUES ('13', '2', '02', '长假', '20', '启用', '', '无', '2018-02-14', '');
INSERT INTO `dictionary_data` VALUES ('14', '2', '03', '离职', '30', '启用', '', '无', '2018-02-14', '');
INSERT INTO `dictionary_data` VALUES ('16', '2', '05', '请假', '50', '启用', '', '无', '2018-02-14', '');
INSERT INTO `dictionary_data` VALUES ('18', '2', '04', '出差', '40', '启用', '', '无', '2018-02-14', '');
INSERT INTO `dictionary_data` VALUES ('20', '3', 'temp', '临时池', '10', '启用', '', '无', '2018-02-14', '');
INSERT INTO `dictionary_data` VALUES ('21', '3', 'private', '个人池', '20', '启用', '', '无', '2018-02-14', '');
INSERT INTO `dictionary_data` VALUES ('22', '3', 'public', '公共池', '30', '启用', '', '无', '2018-02-14', '');
INSERT INTO `dictionary_data` VALUES ('23', '3', 'student', '学生池', '40', '启用', '', '无', '2018-02-14', '');
INSERT INTO `dictionary_data` VALUES ('24', '4', '01', '智联招聘', '80', '启用', 'WNCD056', '无', '2018-02-14', '2019-03-20 17:09');
INSERT INTO `dictionary_data` VALUES ('25', '4', '02', '前程无忧', '90', '启用', 'WNCD056', '无', '2018-02-14', '2019-03-20 17:09');
INSERT INTO `dictionary_data` VALUES ('26', '4', '03', '专属简历', '100', '启用', 'WNCD056', '无', '2018-02-14', '2019-03-20 17:09');
INSERT INTO `dictionary_data` VALUES ('27', '4', '04', '自然流量', '10', '启用', 'WNCD056', '网络资源改成了自然流量', '2018-02-14', '2019-03-20 17:07');
INSERT INTO `dictionary_data` VALUES ('28', '4', '05', '汇博人才', '110', '启用', 'WNCD056', '无', '2018-02-14', '2019-03-20 17:09');
INSERT INTO `dictionary_data` VALUES ('29', '4', '06', '搜索引擎', '60', '停用', '', '无', '2018-02-14', '');
INSERT INTO `dictionary_data` VALUES ('30', '4', '07', '58同城', '140', '启用', 'WNCD056', '无', '2018-02-14', '2019-03-20 16:57');
INSERT INTO `dictionary_data` VALUES ('31', '4', '08', '赶集网', '160', '启用', 'WNCD056', '无', '2018-02-14', '2019-03-20 17:10');
INSERT INTO `dictionary_data` VALUES ('32', '4', '09', '中华英才', '170', '启用', 'WNCD056', '无', '2018-02-14', '2019-03-20 17:10');
INSERT INTO `dictionary_data` VALUES ('33', '4', '11', '招聘会', '150', '启用', 'WNCD056', '无', '2018-02-14', '2019-03-20 17:10');
INSERT INTO `dictionary_data` VALUES ('34', '4', '12', '双选会', '120', '启用', '', '无', '2018-02-14', '');
INSERT INTO `dictionary_data` VALUES ('35', '4', '13', '高校渠道', '130', '启用', '', '无', '2018-02-14', '');
INSERT INTO `dictionary_data` VALUES ('36', '4', '14', '口碑介绍', '50', '启用', 'WNCD056', '无', '2018-02-14', '2019-03-20 17:08');
INSERT INTO `dictionary_data` VALUES ('37', '4', '15', '学员介绍', '40', '启用', 'WNCD056', '无', '2018-02-14', '2019-03-20 17:08');
INSERT INTO `dictionary_data` VALUES ('47', '6', '01', '可使用', '10', '启用', '', '无', '2018-02-14', '');
INSERT INTO `dictionary_data` VALUES ('48', '6', '02', '已报废', '20', '启用', '', '无', '2018-02-14', '');
INSERT INTO `dictionary_data` VALUES ('49', '6', '03', '已损坏', '30', '启用', '', '无', '2018-02-14', '');
INSERT INTO `dictionary_data` VALUES ('50', '6', '04', '已领用', '40', '启用', '', '无', '2018-02-14', '');
INSERT INTO `dictionary_data` VALUES ('52', '7', '01', '电脑', '10', '启用', '', '无', '2018-02-14', '');
INSERT INTO `dictionary_data` VALUES ('53', '7', '02', '投影仪', '20', '启用', '', '无', '2018-02-14', '');
INSERT INTO `dictionary_data` VALUES ('54', '7', '03', '打印机', '30', '启用', '', '无', '2018-02-14', '');
INSERT INTO `dictionary_data` VALUES ('55', '7', '04', '其他', '40', '启用', '', '无', '2018-02-14', '');
INSERT INTO `dictionary_data` VALUES ('57', '8', '01', 'T420', '10', '启用', '', '无', '2018-02-14', '');
INSERT INTO `dictionary_data` VALUES ('58', '8', '02', 'T420s', '20', '启用', '', '无', '2018-02-14', '');
INSERT INTO `dictionary_data` VALUES ('59', '8', '03', 'T430', '30', '启用', '', '无', '2018-02-14', '');
INSERT INTO `dictionary_data` VALUES ('60', '8', '04', 'T400', '40', '启用', '', '无', '2018-02-14', '');
INSERT INTO `dictionary_data` VALUES ('61', '8', '05', 'T440', '50', '启用', '', '无', '2018-02-14', '');
INSERT INTO `dictionary_data` VALUES ('62', '9', '01', '未开班', '10', '启用', '', '无', '2018-02-14', '');
INSERT INTO `dictionary_data` VALUES ('63', '9', '02', '在校学习', '20', '启用', '', '无', '2018-02-14', '');
INSERT INTO `dictionary_data` VALUES ('64', '9', '03', '转就业', '30', '启用', '', '无', '2018-02-14', '');
INSERT INTO `dictionary_data` VALUES ('65', '9', '04', '已就业', '40', '启用', '', '无', '2018-02-14', '');
INSERT INTO `dictionary_data` VALUES ('66', '9', '05', '已休学', '50', '启用', '', '无', '2018-02-14', '');
INSERT INTO `dictionary_data` VALUES ('67', '9', '06', '已失联', '60', '启用', '', '无', '2018-02-14', '');
INSERT INTO `dictionary_data` VALUES ('68', '9', '07', '已退学', '70', '启用', '', '无', '2018-02-14', '');
INSERT INTO `dictionary_data` VALUES ('69', '10', '01', '18800', '10', '启用', 'WNCD056', '无', '2018-02-14', '2019-01-02 20:22');
INSERT INTO `dictionary_data` VALUES ('70', '10', '02', '18500', '20', '启用', 'WNCD056', '无', '2018-02-14', '2019-01-02 20:22');
INSERT INTO `dictionary_data` VALUES ('71', '10', '03', '16800', '30', '启用', 'WNCD056', '无', '2018-02-14', '2019-01-02 20:22');
INSERT INTO `dictionary_data` VALUES ('72', '10', '04', '16500', '40', '启用', 'WNCD056', '无', '2018-02-14', '2019-01-02 20:22');
INSERT INTO `dictionary_data` VALUES ('73', '10', '05', '14800', '50', '启用', 'WNCD056', '无', '2018-02-14', '2019-01-02 20:22');
INSERT INTO `dictionary_data` VALUES ('74', '10', '06', '14500', '60', '启用', 'WNCD056', '无', '2018-02-14', '2019-01-02 20:22');
INSERT INTO `dictionary_data` VALUES ('75', '11', '01', '高', '10', '启用', '', '无', '2018-02-14', '');
INSERT INTO `dictionary_data` VALUES ('76', '11', '02', '中', '20', '启用', '', '无', '2018-02-14', '');
INSERT INTO `dictionary_data` VALUES ('77', '11', '03', '低', '30', '启用', '', '无', '2018-02-14', '');
INSERT INTO `dictionary_data` VALUES ('78', '12', '01', '本科', '10', '启用', '', '无', '2018-02-14', '');
INSERT INTO `dictionary_data` VALUES ('79', '12', '02', '硕士', '20', '启用', '', '无', '2018-02-14', '');
INSERT INTO `dictionary_data` VALUES ('80', '12', '03', '大专', '30', '启用', '', '无', '2018-02-14', '');
INSERT INTO `dictionary_data` VALUES ('81', '12', '04', '其他学历', '40', '启用', '', '无', '2018-02-14', '');
INSERT INTO `dictionary_data` VALUES ('82', '13', '01', '应届毕业生', '10', '启用', '', '无', '2018-02-14', '');
INSERT INTO `dictionary_data` VALUES ('83', '13', '02', '1年', '20', '启用', '', '无', '2018-02-14', '');
INSERT INTO `dictionary_data` VALUES ('84', '13', '03', '2年', '30', '启用', '', '无', '2018-02-14', '');
INSERT INTO `dictionary_data` VALUES ('85', '13', '04', '3年', '40', '启用', '', '无', '2018-02-14', '');
INSERT INTO `dictionary_data` VALUES ('86', '13', '05', '4年', '50', '启用', '', '无', '2018-02-14', '');
INSERT INTO `dictionary_data` VALUES ('87', '13', '06', '5年', '60', '启用', '', '无', '2018-02-14', '');
INSERT INTO `dictionary_data` VALUES ('88', '13', '07', '10年以上', '70', '启用', '', '无', '2018-02-14', '');
INSERT INTO `dictionary_data` VALUES ('89', '15', '01', '待缴费', '10', '启用', '', '无', '2018-02-14', '');
INSERT INTO `dictionary_data` VALUES ('90', '15', '02', '已缴定金', '20', '启用', '', '无', '2018-02-14', '');
INSERT INTO `dictionary_data` VALUES ('91', '15', '03', '未缴清', '30', '启用', '', '无', '2018-02-14', '');
INSERT INTO `dictionary_data` VALUES ('92', '15', '04', '已缴清', '40', '启用', '', '无', '2018-02-14', '');
INSERT INTO `dictionary_data` VALUES ('93', '16', '01', '可用', '10', '启用', '', '无', '2018-02-14', '');
INSERT INTO `dictionary_data` VALUES ('94', '16', '02', '停用', '20', '启用', '', '无', '2018-02-14', '');
INSERT INTO `dictionary_data` VALUES ('95', '17', '01', '正常', '10', '启用', '', '无', '2018-02-14', '');
INSERT INTO `dictionary_data` VALUES ('96', '17', '02', '休息', '20', '启用', '', '无', '2018-02-14', '');
INSERT INTO `dictionary_data` VALUES ('97', '17', '03', '实训', '30', '启用', '', '无', '2018-02-14', '');
INSERT INTO `dictionary_data` VALUES ('98', '18', '0', '否', '10', '启用', '', '无', '2018-02-14', '');
INSERT INTO `dictionary_data` VALUES ('99', '18', '1', '是', '20', '启用', '', '无', '2018-02-14', '');
INSERT INTO `dictionary_data` VALUES ('100', '19', '01', '正常', '10', '启用', '', '无', '2018-02-14', '');
INSERT INTO `dictionary_data` VALUES ('101', '19', '02', '迟到', '20', '启用', '', '无', '2018-02-14', '');
INSERT INTO `dictionary_data` VALUES ('102', '19', '03', '面试', '30', '启用', '', '无', '2018-02-14', '');
INSERT INTO `dictionary_data` VALUES ('103', '19', '04', '旷课', '40', '启用', '', '无', '2018-02-14', '');
INSERT INTO `dictionary_data` VALUES ('104', '19', '05', '请假', '50', '启用', '', '无', '2018-02-14', '');
INSERT INTO `dictionary_data` VALUES ('105', '20', '01', '请假中', '10', '启用', '', '无', '2018-02-14', '');
INSERT INTO `dictionary_data` VALUES ('106', '20', '02', '已销假', '20', '启用', '', '无', '2018-02-14', '');
INSERT INTO `dictionary_data` VALUES ('107', '21', '01', '课堂问答', '10', '启用', 'WNCD001', '无', '2018-02-14', '2019-01-21 18:16');
INSERT INTO `dictionary_data` VALUES ('108', '21', '02', '随堂笔试', '20', '启用', 'WNCD001', '无', '2018-02-14', '2019-01-21 18:17');
INSERT INTO `dictionary_data` VALUES ('109', '21', '03', '学生讲解', '30', '启用', 'WNCD001', '无', '2018-02-14', '2019-01-21 18:17');
INSERT INTO `dictionary_data` VALUES ('110', '21', '04', '考试系统', '40', '启用', '', '无', '2018-02-14', '');
INSERT INTO `dictionary_data` VALUES ('111', '21', '05', '家庭作业', '50', '启用', '', '无', '2018-02-14', '');
INSERT INTO `dictionary_data` VALUES ('112', '21', '06', '周考或其它', '60', '启用', 'WNCD001', '无', '2018-02-14', '2019-01-21 18:17');
INSERT INTO `dictionary_data` VALUES ('113', '22', '01', '事假', '10', '启用', '', '无', '2018-02-14', '');
INSERT INTO `dictionary_data` VALUES ('114', '22', '02', '病假', '20', '启用', '', '无', '2018-02-14', '');
INSERT INTO `dictionary_data` VALUES ('115', '22', '03', '休学', '30', '启用', '', '无', '2018-02-14', '');
INSERT INTO `dictionary_data` VALUES ('116', '23', '01', '第一阶段', '10', '启用', '', '无', '2018-02-14', '');
INSERT INTO `dictionary_data` VALUES ('117', '23', '02', '第二阶段', '20', '启用', '', '无', '2018-02-14', '');
INSERT INTO `dictionary_data` VALUES ('118', '23', '03', '第三阶段', '30', '启用', '', '无', '2018-02-14', '');
INSERT INTO `dictionary_data` VALUES ('119', '23', '04', '项目阶段', '40', '启用', '', '无', '2018-02-14', '');
INSERT INTO `dictionary_data` VALUES ('120', '13', '08', '其他', '80', '启用', '', '无', '2018-02-14', '');
INSERT INTO `dictionary_data` VALUES ('121', '4', '10', '其他', '190', '启用', 'WNCD056', null, '', '2019-03-20 17:12');
INSERT INTO `dictionary_data` VALUES ('122', '10', '07', '17800', '70', '启用', 'WNCD056', null, '', '2019-01-02 20:22');
INSERT INTO `dictionary_data` VALUES ('123', '10', '08', '17500', '80', '启用', 'WNCD056', null, '', '2019-01-02 20:23');
INSERT INTO `dictionary_data` VALUES ('124', '13', '09', '无经验', '90', '启用', 'WNCD056', null, '', '');
INSERT INTO `dictionary_data` VALUES ('127', '13', '10', '1-3年', '100', '启用', 'WNCD056', null, '', '');
INSERT INTO `dictionary_data` VALUES ('128', '13', '11', '3-5年', '110', '启用', 'WNCD056', null, '', '');
INSERT INTO `dictionary_data` VALUES ('130', '8', '06', 'T410s', '60', '启用', 'WNCD056', '无', '', '');
INSERT INTO `dictionary_data` VALUES ('132', '8', '07', 'T430s', '70', '启用', 'WNCD056', null, '', '');
INSERT INTO `dictionary_data` VALUES ('133', '8', '08', 'GP-3120TU', '80', '启用', 'WNCD056', null, '', '');
INSERT INTO `dictionary_data` VALUES ('134', '8', '09', 'PHM123fw', '90', '启用', 'WNCD056', null, '', '');
INSERT INTO `dictionary_data` VALUES ('135', '29', '01', '已通过', '10', '启用', 'WNCD056', '无', '', '2018-10-29 16:43');
INSERT INTO `dictionary_data` VALUES ('136', '29', '02', '已驳回', '20', '启用', 'WNCD056', '无', '', '2018-11-01 16:05');
INSERT INTO `dictionary_data` VALUES ('137', '29', '03', '待审核', '30', '启用', 'WNCD056', null, '', '2018-10-29');
INSERT INTO `dictionary_data` VALUES ('138', '29', '04', '已撤销', '40', '启用', 'WNCD056', null, '', '');
INSERT INTO `dictionary_data` VALUES ('139', '30', '01', '加班申请', '10', '启用', 'WNCD056', null, '', '');
INSERT INTO `dictionary_data` VALUES ('140', '30', '02', '值班申请', '20', '启用', 'WNCD056', null, '', '');
INSERT INTO `dictionary_data` VALUES ('141', '24', '01', '开发', '10', '启用', 'WNCD058', null, '', '');
INSERT INTO `dictionary_data` VALUES ('142', '24', '02', '测试', '20', '启用', 'WNCD058', null, '', '');
INSERT INTO `dictionary_data` VALUES ('143', '31', '01', '选择题', '10', '', '', '', '', '');
INSERT INTO `dictionary_data` VALUES ('144', '31', '02', '填空题', '20', '', '', '', '', '');
INSERT INTO `dictionary_data` VALUES ('145', '31', '03', '简答题', '30', '', '', '', '', '');
INSERT INTO `dictionary_data` VALUES ('146', '32', '01', '未填写', '10', '启用', 'WNCD056', null, '', '');
INSERT INTO `dictionary_data` VALUES ('147', '32', '02', '已填写', '20', '启用', 'WNCD056', null, '', '');
INSERT INTO `dictionary_data` VALUES ('148', '8', '10', 'HPM132fw', '100', '启用', 'WNCD056', null, '', '');
INSERT INTO `dictionary_data` VALUES ('149', '8', '11', 'MP-CR3115', '110', '启用', 'WNCD056', null, '', '');
INSERT INTO `dictionary_data` VALUES ('150', '8', '12', 'MP-CR3115/8470934CG', '120', '启用', 'WNCD056', null, '', '');
INSERT INTO `dictionary_data` VALUES ('151', '34', '01', '收入', '10', '启用', 'WNCD056', null, '', '');
INSERT INTO `dictionary_data` VALUES ('152', '34', '02', '支出', '20', '启用', 'WNCD056', null, '', '');
INSERT INTO `dictionary_data` VALUES ('153', '34', '03', '内部流转', '30', '启用', 'WNCD056', '公司内部的转账', '', '');
INSERT INTO `dictionary_data` VALUES ('154', '34', '04', '外部流转', '40', '启用', 'WNCD056', '外部的钱，公司只是暂时保管', '', '');
INSERT INTO `dictionary_data` VALUES ('155', '33', '01', '专用私账', '10', '启用', 'WNCD056', null, '', '');
INSERT INTO `dictionary_data` VALUES ('156', '33', '02', '专用公账', '20', '启用', 'WNCD056', null, '', '');
INSERT INTO `dictionary_data` VALUES ('157', '33', '03', '公用私账', '30', '启用', 'WNCD056', null, '', '');
INSERT INTO `dictionary_data` VALUES ('158', '33', '04', '公用公账', '40', '启用', 'WNCD056', null, '', '');
INSERT INTO `dictionary_data` VALUES ('159', '35', '01', '支付宝', '10', '启用', 'WNCD056', null, '', '2018-12-25 18:59');
INSERT INTO `dictionary_data` VALUES ('160', '35', '02', '微信', '20', '启用', 'WNCD056', null, '', '');
INSERT INTO `dictionary_data` VALUES ('161', '35', '03', '现金', '30', '启用', 'WNCD056', null, '', '');
INSERT INTO `dictionary_data` VALUES ('162', '35', '04', '刷卡', '40', '启用', 'WNCD056', null, '', '');
INSERT INTO `dictionary_data` VALUES ('163', '35', '05', '转账', '50', '启用', 'WNCD056', null, '', '');
INSERT INTO `dictionary_data` VALUES ('164', '35', '06', '贷款', '60', '启用', 'WNCD056', null, '', '');
INSERT INTO `dictionary_data` VALUES ('165', '36', '01', '缴费', '10', '启用', 'WNCD056', null, '', '');
INSERT INTO `dictionary_data` VALUES ('166', '36', '02', '退费', '20', '启用', 'WNCD056', null, '', '');
INSERT INTO `dictionary_data` VALUES ('167', '37', '01', '未开班', '10', '启用', 'WNCD056', null, '', '');
INSERT INTO `dictionary_data` VALUES ('168', '37', '02', '已开班', '20', '启用', 'WNCD056', null, '', '');
INSERT INTO `dictionary_data` VALUES ('169', '38', '01', '待退费', '10', '启用', 'WNCD056', null, '', '');
INSERT INTO `dictionary_data` VALUES ('170', '38', '02', '电脑退费', '20', '启用', 'WNCD056', null, '', '');
INSERT INTO `dictionary_data` VALUES ('171', '38', '03', '定金退学', '30', '启用', 'WNCD056', null, '', '');
INSERT INTO `dictionary_data` VALUES ('172', '38', '04', '中途退学', '40', '启用', 'WNCD056', null, '', '');
INSERT INTO `dictionary_data` VALUES ('173', '38', '05', '多贷退费', '50', '启用', 'WNCD056', null, '', '');
INSERT INTO `dictionary_data` VALUES ('174', '38', '06', '正常', '60', '启用', 'WNCD056', null, '', '');
INSERT INTO `dictionary_data` VALUES ('175', '4', '16', '同事推荐', '100', '启用', 'WNCD056', null, '', '');
INSERT INTO `dictionary_data` VALUES ('176', '4', '17', '智联教育', '60', '启用', 'WNCD056', '1月24日市场部要求新增', '', '2019-03-20 17:08');
INSERT INTO `dictionary_data` VALUES ('177', '8', '13', 'EPSON CB-X04', '130', '启用', 'WNCD088', null, '', '');
INSERT INTO `dictionary_data` VALUES ('178', '8', '14', 'BENQ ED933', '140', '启用', 'WNCD088', null, '', '');
INSERT INTO `dictionary_data` VALUES ('179', '35', '07', '扫码', '70', '启用', 'WNCD056', '', '', '');
INSERT INTO `dictionary_data` VALUES ('180', '8', '15', 'L430', '150', '启用', 'WNCD088', null, '', '');
INSERT INTO `dictionary_data` VALUES ('181', '4', '18', '肖俊彦录', '70', '启用', 'WNCD056', '重庆地推来源', '', '2019-03-20 17:09');
INSERT INTO `dictionary_data` VALUES ('182', '10', '09', '19800', '90', '启用', 'WNCD001', '上海2019年Java学费', '', '');
INSERT INTO `dictionary_data` VALUES ('183', '10', '10', '19500', '91', '启用', 'WNCD001', '上海2019年Java学费', '', '');
INSERT INTO `dictionary_data` VALUES ('184', '4', '19', '211校招网', '180', '启用', 'WNCD056', null, '', '2019-03-20 17:11');
INSERT INTO `dictionary_data` VALUES ('185', '4', '20', '百度竞价', '20', '启用', 'WNCD056', '将竞价推广改成百度竞价', '', '2019-04-23 11:30');
INSERT INTO `dictionary_data` VALUES ('186', '4', '21', '今日头条', '30', '启用', 'WNCD056', null, '', '2019-03-20 17:08');
INSERT INTO `dictionary_data` VALUES ('188', '39', '01', '申请调休', '10', '启用', 'WNCD056', '调休', '', '');
INSERT INTO `dictionary_data` VALUES ('189', '39', '02', '结算工资', '20', '启用', 'WNCD056', '算成加班费', '', '');
INSERT INTO `dictionary_data` VALUES ('190', '40', '01', '第一周', '10', '启用', '', '', '', '');
INSERT INTO `dictionary_data` VALUES ('191', '40', '02', '第二周', '20', '启用', '', '', '', '');
INSERT INTO `dictionary_data` VALUES ('192', '40', '03', '第三周', '30', '启用', '', '', '', '');
INSERT INTO `dictionary_data` VALUES ('193', '40', '04', '第四周', '40', '启用', '', '', '', '');
INSERT INTO `dictionary_data` VALUES ('194', '40', '05', '第五周', '50', '启用', '', '', '', '');
INSERT INTO `dictionary_data` VALUES ('195', '41', '01', '忧', '10', '启用', 'WNCD056', null, '', '2019-05-25 15:14');
INSERT INTO `dictionary_data` VALUES ('196', '41', '02', '良', '20', '启用', 'WNCD056', null, '', '2019-05-25 15:14');
INSERT INTO `dictionary_data` VALUES ('197', '4', '22', '360竞价', '20', '启用', 'WNCD056', null, '', '2019-04-23 11:33');
INSERT INTO `dictionary_data` VALUES ('198', '4', '23', '搜狗竞价', '20', '启用', 'WNCD056', null, '', '2019-04-23 11:33');
INSERT INTO `dictionary_data` VALUES ('199', '4', '24', '神马竞价', '20', '启用', 'WNCD056', null, '', '2019-04-23 11:33');
INSERT INTO `dictionary_data` VALUES ('200', '4', '25', '大街网', '230', '启用', 'WNCD056', null, '', '');
INSERT INTO `dictionary_data` VALUES ('201', '41', '03', '中', '30', '启用', 'WNCD056', null, '', '2019-05-25 15:15');
INSERT INTO `dictionary_data` VALUES ('202', '41', '04', '差', '40', '启用', 'WNCD056', null, '', '');
INSERT INTO `dictionary_data` VALUES ('203', '41', '05', '未交', '50', '启用', 'WNCD056', null, '', '');
INSERT INTO `dictionary_data` VALUES ('204', '42', '01', '公历', '10', '启用', 'WNCD056', null, '', '');
INSERT INTO `dictionary_data` VALUES ('205', '42', '02', '农历', '20', '启用', 'WNCD056', null, '', '');
INSERT INTO `dictionary_data` VALUES ('206', '43', '01', '不扣分', '10', '启用', 'WNCD056', null, '', '');
INSERT INTO `dictionary_data` VALUES ('207', '43', '02', '扣分', '20', '启用', 'WNCD056', null, '', '');
INSERT INTO `dictionary_data` VALUES ('208', '44', '01', 'A', '10', '启用', 'WNCD056', null, '', '');
INSERT INTO `dictionary_data` VALUES ('209', '44', '02', 'B', '20', '启用', 'WNCD056', null, '', '');
INSERT INTO `dictionary_data` VALUES ('210', '44', '03', 'C', '30', '启用', 'WNCD056', null, '', '');
INSERT INTO `dictionary_data` VALUES ('211', '44', '04', 'D', '40', '启用', 'WNCD056', null, '', '');
INSERT INTO `dictionary_data` VALUES ('212', '45', '01', '员工', '10', '启用', 'WNCD056', null, '', '');
INSERT INTO `dictionary_data` VALUES ('213', '45', '02', '学生', '20', '启用', 'WNCD056', null, '', '');
INSERT INTO `dictionary_data` VALUES ('214', '46', '01', '未复核', '10', '启用', 'WNCD056', '财务流水或缴费定金还未复核状态', '', '');
INSERT INTO `dictionary_data` VALUES ('215', '46', '02', '已复核', '20', '启用', 'WNCD056', '财务流水或缴费定金已经复核状态', '', '');
INSERT INTO `dictionary_data` VALUES ('216', '47', '01', '优', '10', '启用', 'WNCD056', null, '', '');
INSERT INTO `dictionary_data` VALUES ('217', '47', '02', '良', '20', '启用', 'WNCD056', null, '', '');
INSERT INTO `dictionary_data` VALUES ('218', '47', '03', '中', '30', '启用', 'WNCD056', null, '', '');
INSERT INTO `dictionary_data` VALUES ('219', '47', '04', '差', '40', '启用', 'WNCD056', null, '', '');
INSERT INTO `dictionary_data` VALUES ('220', '48', '01', '未认证', '10', '启用', 'WNCD056', null, '', '');
INSERT INTO `dictionary_data` VALUES ('221', '48', '02', '已认证', '20', '启用', 'WNCD056', null, '', '');
INSERT INTO `dictionary_data` VALUES ('222', '49', '01', '流程配合', '10', '启用', 'WNCD056', null, '', '');
INSERT INTO `dictionary_data` VALUES ('223', '49', '02', '系统缺陷', '20', '启用', 'WNCD056', null, '', '');
INSERT INTO `dictionary_data` VALUES ('224', '49', '03', '系统需求', '30', '启用', 'WNCD056', null, '', '');
INSERT INTO `dictionary_data` VALUES ('225', '50', '01', '待处理', '10', '启用', 'WNCD056', null, '', '');
INSERT INTO `dictionary_data` VALUES ('226', '50', '02', '处理中', '20', '启用', 'WNCD056', null, '', '');
INSERT INTO `dictionary_data` VALUES ('227', '50', '03', '已处理', '30', '启用', 'WNCD056', null, '', '');
INSERT INTO `dictionary_data` VALUES ('228', '51', '01', '我发起的', '10', '启用', 'WNCD056', null, '', '');
INSERT INTO `dictionary_data` VALUES ('229', '51', '02', '我受理的', '20', '启用', 'WNCD056', null, '', '');
INSERT INTO `dictionary_data` VALUES ('230', '6', '05', '已到期', '50', '启用', 'WNCD056', null, '', '');
INSERT INTO `dictionary_data` VALUES ('231', '52', '01', '公司', '10', '启用', 'WNCD056', null, '', '');
INSERT INTO `dictionary_data` VALUES ('232', '52', '02', '租借', '20', '启用', 'WNCD056', null, '', '2019-06-14 15:59');

-- ----------------------------
-- Table structure for dictionary_type
-- ----------------------------
DROP TABLE IF EXISTS `dictionary_type`;
CREATE TABLE `dictionary_type` (
  `dict_type_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '字典类型表主键id',
  `dict_typecode` varchar(100) DEFAULT '' COMMENT '字典类型编码',
  `dict_typename` varchar(100) DEFAULT '' COMMENT '字典类型名',
  `status` varchar(50) DEFAULT '' COMMENT '状态（正常或停用）',
  `remarks` varchar(255) DEFAULT '' COMMENT '类型备注',
  `create_time` varchar(50) DEFAULT '' COMMENT '创建时间',
  `update_time` varchar(50) DEFAULT '' COMMENT '更新时间',
  PRIMARY KEY (`dict_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dictionary_type
-- ----------------------------
INSERT INTO `dictionary_type` VALUES ('1', 'resource_status', '资源状态', '启用', '无', '2018-02-14', '');
INSERT INTO `dictionary_type` VALUES ('2', 'emp_status', '员工状态', '启用', '无', '2018-02-14', '');
INSERT INTO `dictionary_type` VALUES ('3', 'pool_type', '资源类型', '启用', '无', '2018-02-14', '');
INSERT INTO `dictionary_type` VALUES ('4', 'resource_source', '资源来源', '启用', '无', '2018-02-14', '');
INSERT INTO `dictionary_type` VALUES ('6', 'assets_state', '资产状态', '启用', '无', '2018-02-14', '');
INSERT INTO `dictionary_type` VALUES ('7', 'assets_kind', '资产类型', '启用', '无', '2018-02-14', '');
INSERT INTO `dictionary_type` VALUES ('8', 'comp_type', '电脑类型', '启用', '无', '2018-02-14', '');
INSERT INTO `dictionary_type` VALUES ('9', 'study_status', '学习状态 ', '启用', '无', '2018-02-14', '');
INSERT INTO `dictionary_type` VALUES ('10', 'tuition_fee', '学费', '启用', '无', '2018-02-14', '');
INSERT INTO `dictionary_type` VALUES ('11', 'resource_priority', '资源优先级', '启用', '无', '2018-02-14', '');
INSERT INTO `dictionary_type` VALUES ('12', 'education', '学历', '启用', '无', '2018-02-14', '');
INSERT INTO `dictionary_type` VALUES ('13', 'workage', '工作年限', '启用', '无', '2018-02-14', '');
INSERT INTO `dictionary_type` VALUES ('14', 'sex', '性别', '启用', '无', '2018-02-14', '');
INSERT INTO `dictionary_type` VALUES ('15', 'finance_status', '学生缴费状态', '启用', '无', '2018-02-14', '');
INSERT INTO `dictionary_type` VALUES ('16', 'user_status', '用户状态', '启用', '无', '2018-02-14', '');
INSERT INTO `dictionary_type` VALUES ('17', 'teacher_status', '讲师状态', '启用', '无', '2018-02-14', '');
INSERT INTO `dictionary_type` VALUES ('18', 'comp_return_yon', '是否归还电脑', '启用', '无', '2018-02-14', '');
INSERT INTO `dictionary_type` VALUES ('19', 'attendance_status', '考勤状态', '启用', '无', '2018-02-14', '');
INSERT INTO `dictionary_type` VALUES ('20', 'leave_state', '请假状态', '启用', '无', '2018-02-14', '');
INSERT INTO `dictionary_type` VALUES ('21', 'mornexam_type', '晨考类型', '启用', '无', '2018-02-14', '');
INSERT INTO `dictionary_type` VALUES ('22', 'leave_type', '请假类型', '启用', '无', '2018-02-14', '');
INSERT INTO `dictionary_type` VALUES ('23', 'phase', '学生阶段', '启用', '无', '2018-02-14', '');
INSERT INTO `dictionary_type` VALUES ('24', 'major', '专业方向', '启用', '无', '2018-11-20', '');
INSERT INTO `dictionary_type` VALUES ('29', 'approve_status', '审核状态', '启用', '无', '2018-10-20', '');
INSERT INTO `dictionary_type` VALUES ('30', 'apply_type', '申请类型', '启用', '无', '2018-10-20', '');
INSERT INTO `dictionary_type` VALUES ('31', 'question_type', '试题类型', '启用', '无', '2018-02-14', '');
INSERT INTO `dictionary_type` VALUES ('32', 'log_status', '值班日志情况', '启用', '是否填写了日志', '', '2019-01-11');
INSERT INTO `dictionary_type` VALUES ('33', 'account_type', '账号类型', '启用', '银行卡类型', '', '');
INSERT INTO `dictionary_type` VALUES ('34', 'finance_type', '收支类型', '启用', '收入支出等类型', '', '2019-01-11');
INSERT INTO `dictionary_type` VALUES ('35', 'payment_way', '支付方式', '启用', '支付方式', '', '');
INSERT INTO `dictionary_type` VALUES ('36', 'fee_type', '缴费/退费', '启用', '学员缴费/退费', '', '');
INSERT INTO `dictionary_type` VALUES ('37', 'opening_status', '开班状态', '启用', '班级的开班状态', '', '');
INSERT INTO `dictionary_type` VALUES ('38', 'refund_type', '退费类型', '启用', '学员退费的类型', '', '');
INSERT INTO `dictionary_type` VALUES ('39', 'accounting_way', '核算方式', '启用', '加班值班如何核算', '', '');
INSERT INTO `dictionary_type` VALUES ('40', 'week', '阶段第几周', '启用', '阶段周数', '', '');
INSERT INTO `dictionary_type` VALUES ('41', 'homework', '作业状态', '启用', '作业完成状态', '', '');
INSERT INTO `dictionary_type` VALUES ('42', 'birthday_type', '生日类型', '启用', '生日类型', '', '');
INSERT INTO `dictionary_type` VALUES ('43', 'leave_count', '请假扣分', '启用', '请假是否扣分', '', '');
INSERT INTO `dictionary_type` VALUES ('44', 'score_level', '成绩评级', '启用', '无', '', '');
INSERT INTO `dictionary_type` VALUES ('45', 'borrower_type', '领用类型', '启用', '资产领用人员类型', '', '');
INSERT INTO `dictionary_type` VALUES ('46', 'finance_check_status', '财务复核状态', '启用', '财务复核状态', '', '');
INSERT INTO `dictionary_type` VALUES ('47', 'exam_level', '成绩评价', '启用', '', '', '');
INSERT INTO `dictionary_type` VALUES ('48', 'stu_authen', '学员认证', '启用', '官网学员认证', '', '');
INSERT INTO `dictionary_type` VALUES ('49', 'work_order_type', '工单类型', '启用', '工单类型', '', '');
INSERT INTO `dictionary_type` VALUES ('50', 'work_order_status', '工单状态', '启用', '工单状态', '', '');
INSERT INTO `dictionary_type` VALUES ('51', 'work_order_submit_type', '工单发起类型', '启用', '工单发起类型', '', '');
INSERT INTO `dictionary_type` VALUES ('52', 'assets_owner', '资产归属', '启用', '资产归属于公司与否', '', '');

-- ----------------------------
-- Table structure for duty
-- ----------------------------
DROP TABLE IF EXISTS `duty`;
CREATE TABLE `duty` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `work_id` varchar(20) DEFAULT '',
  `duty_time` varchar(20) DEFAULT '' COMMENT '值班日期',
  `start_time` varchar(50) DEFAULT '',
  `end_time` varchar(50) DEFAULT '',
  `hours` varchar(10) DEFAULT '',
  `create_id` varchar(10) DEFAULT '' COMMENT '创建人',
  `region_id` int(10) DEFAULT '0',
  `status` varchar(10) DEFAULT '' COMMENT '''03''',
  `log` varchar(255) DEFAULT '',
  `log_status` varchar(10) DEFAULT '01' COMMENT '日志填写情况，默认‘未填写’',
  `apply_time` varchar(20) DEFAULT '',
  `accounting_way` varchar(10) DEFAULT '',
  `create_time` varchar(50) DEFAULT '',
  `update_time` varchar(50) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=586 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of duty
-- ----------------------------

-- ----------------------------
-- Table structure for employee
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee` (
  `employee_id` int(11) NOT NULL AUTO_INCREMENT,
  `region_id` int(11) DEFAULT '0' COMMENT '区域id',
  `department_id` int(11) DEFAULT '0' COMMENT '部门id',
  `work_id` varchar(50) DEFAULT NULL,
  `employee_name` varchar(50) DEFAULT '',
  `tel` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `qq` varchar(50) DEFAULT NULL,
  `sex` varchar(50) DEFAULT NULL,
  `position` varchar(50) DEFAULT NULL,
  `emp_status` varchar(50) DEFAULT '' COMMENT '员工最新状态',
  `education` varchar(50) DEFAULT NULL,
  `university` varchar(50) DEFAULT NULL,
  `major` varchar(50) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `source` varchar(50) DEFAULT NULL,
  `cardnum` varchar(50) DEFAULT NULL,
  `emergency_contact` varchar(50) DEFAULT NULL,
  `emergency_tel` varchar(50) DEFAULT NULL,
  `emegency_relation` varchar(50) DEFAULT NULL,
  `identity` varchar(50) DEFAULT NULL,
  `birthday` varchar(50) DEFAULT NULL,
  `birthday_type` varchar(50) DEFAULT NULL,
  `entry_time` varchar(50) DEFAULT NULL,
  `leave_time` varchar(50) DEFAULT NULL,
  `create_time` varchar(50) DEFAULT NULL,
  `update_time` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`employee_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of employee
-- ----------------------------
INSERT INTO `employee` VALUES ('1', '1', '8', 'WNCD000', '超级管理员', '188888888888888', null, null, null, null, '', null, null, null, null, null, null, null, null, null, null, null, null, '2019-06-17 19:35', null, null, null);

-- ----------------------------
-- Table structure for emp_attendance
-- ----------------------------
DROP TABLE IF EXISTS `emp_attendance`;
CREATE TABLE `emp_attendance` (
  `emp_attendance_id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_id` int(11) DEFAULT NULL,
  `region_id` int(11) DEFAULT NULL,
  `emp_attendance_pre` varchar(50) DEFAULT NULL,
  `emp_attendance_extra` varchar(50) DEFAULT NULL,
  `emp_attendance_leave` varchar(50) DEFAULT NULL,
  `emp_attendance_year` varchar(50) DEFAULT NULL,
  `emp_attendance_next` varchar(50) DEFAULT NULL,
  `emp_attendance_time` varchar(50) DEFAULT NULL,
  `create_time` varchar(50) DEFAULT NULL,
  `update_time` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`emp_attendance_id`)
) ENGINE=InnoDB AUTO_INCREMENT=172 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of emp_attendance
-- ----------------------------

-- ----------------------------
-- Table structure for enterprise_info
-- ----------------------------
DROP TABLE IF EXISTS `enterprise_info`;
CREATE TABLE `enterprise_info` (
  `enterprise_id` int(11) NOT NULL AUTO_INCREMENT,
  `ent_name` varchar(50) DEFAULT NULL,
  `ent_category` varchar(50) DEFAULT NULL COMMENT '企业类型',
  `ent_addr` varchar(100) DEFAULT NULL COMMENT '企业地址',
  `ent_header` varchar(50) DEFAULT NULL,
  `tel` varchar(50) DEFAULT NULL,
  `qq` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `ent_employee_id` int(11) DEFAULT '0' COMMENT '录入人',
  `create_time` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`enterprise_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1004 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of enterprise_info
-- ----------------------------

-- ----------------------------
-- Table structure for exercise
-- ----------------------------
DROP TABLE IF EXISTS `exercise`;
CREATE TABLE `exercise` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question_type` int(11) DEFAULT NULL,
  `blank_num` int(11) DEFAULT NULL COMMENT '填空题的空数',
  `knowlegde_type` int(11) DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  `times` int(11) DEFAULT '0',
  `employee_id` int(11) DEFAULT NULL,
  `orientation` varchar(20) DEFAULT NULL,
  `content` text,
  `create_time` varchar(200) DEFAULT NULL,
  `update_time` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1692 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of exercise
-- ----------------------------

-- ----------------------------
-- Table structure for exercise_answer
-- ----------------------------
DROP TABLE IF EXISTS `exercise_answer`;
CREATE TABLE `exercise_answer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question_id` int(11) DEFAULT NULL,
  `index` int(11) DEFAULT NULL,
  `answer` text,
  `create_time` varchar(200) DEFAULT NULL,
  `update_time` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2308 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of exercise_answer
-- ----------------------------

-- ----------------------------
-- Table structure for finance_detail
-- ----------------------------
DROP TABLE IF EXISTS `finance_detail`;
CREATE TABLE `finance_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `finance_detail_id` int(11) DEFAULT '0' COMMENT '流水id',
  `voucher_no` varchar(50) DEFAULT NULL COMMENT '凭证编号',
  `finance_type` varchar(10) DEFAULT '' COMMENT '收支类型',
  `check_status` varchar(10) DEFAULT NULL COMMENT '复核状态',
  `subject_id` int(11) DEFAULT NULL COMMENT '会计科目id',
  `region_id` int(11) DEFAULT '0' COMMENT '校区',
  `income_name` varchar(50) DEFAULT '' COMMENT '收入方',
  `income_no` varchar(50) DEFAULT '' COMMENT '收入账号',
  `expend_name` varchar(50) DEFAULT '' COMMENT '支出方',
  `expend_no` varchar(50) DEFAULT '' COMMENT '支出账号',
  `payment_way` varchar(10) DEFAULT '' COMMENT '支付方式',
  `amount` decimal(10,2) DEFAULT NULL COMMENT '金额',
  `remark` varchar(255) DEFAULT '' COMMENT '流水摘要',
  `operator_id` varchar(10) DEFAULT '',
  `trade_time` varchar(50) DEFAULT NULL,
  `create_time` varchar(50) DEFAULT '',
  `update_time` varchar(50) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3903 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of finance_detail
-- ----------------------------

-- ----------------------------
-- Table structure for finance_detail_move
-- ----------------------------
DROP TABLE IF EXISTS `finance_detail_move`;
CREATE TABLE `finance_detail_move` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `detail_id` int(11) DEFAULT NULL,
  `finance_detail_id` int(11) DEFAULT '0' COMMENT '流水id',
  `finance_type` varchar(10) DEFAULT '' COMMENT '收支类型',
  `subject_id` int(11) DEFAULT NULL COMMENT '会计科目id',
  `region_id` int(11) DEFAULT '0' COMMENT '校区',
  `income_name` varchar(50) DEFAULT '' COMMENT '收入方',
  `income_no` varchar(50) DEFAULT '' COMMENT '收入账号',
  `out_account_id` int(11) DEFAULT NULL,
  `in_account_id` int(11) DEFAULT NULL,
  `expend_name` varchar(50) DEFAULT '' COMMENT '支出方',
  `expend_no` varchar(50) DEFAULT '' COMMENT '支出账号',
  `payment_way` varchar(10) DEFAULT '' COMMENT '支付方式',
  `amount` decimal(10,2) DEFAULT NULL COMMENT '金额',
  `remark` varchar(255) DEFAULT '' COMMENT '流水摘要',
  `operator_id` varchar(10) DEFAULT '',
  `trade_time` varchar(50) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of finance_detail_move
-- ----------------------------

-- ----------------------------
-- Table structure for homework
-- ----------------------------
DROP TABLE IF EXISTS `homework`;
CREATE TABLE `homework` (
  `homework_id` int(11) NOT NULL AUTO_INCREMENT,
  `homework_student_id` int(11) DEFAULT NULL,
  `result` varchar(10) DEFAULT '',
  `teacher_id` varchar(10) DEFAULT '',
  `class_id` int(11) DEFAULT NULL,
  `phase` varchar(10) DEFAULT NULL,
  `week` varchar(10) DEFAULT NULL,
  `create_time` varchar(50) DEFAULT '',
  `update_time` varchar(50) DEFAULT '',
  PRIMARY KEY (`homework_id`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of homework
-- ----------------------------

-- ----------------------------
-- Table structure for interview_feedback
-- ----------------------------
DROP TABLE IF EXISTS `interview_feedback`;
CREATE TABLE `interview_feedback` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `student_no` varchar(50) NOT NULL,
  `enterprise_name` varchar(100) DEFAULT '',
  `position` varchar(50) DEFAULT '',
  `date` varchar(20) DEFAULT '',
  `process` varchar(200) DEFAULT '',
  `address` varchar(50) DEFAULT '',
  `contact` varchar(50) DEFAULT '',
  `feedback` text,
  `feeling` varchar(255) DEFAULT '',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of interview_feedback
-- ----------------------------

-- ----------------------------
-- Table structure for job_register
-- ----------------------------
DROP TABLE IF EXISTS `job_register`;
CREATE TABLE `job_register` (
  `job_regist_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '学员入职登记id',
  `region_id` int(11) DEFAULT NULL,
  `job_student_id` int(11) DEFAULT '0' COMMENT '学生id',
  `job_register_ent_id` int(11) DEFAULT NULL,
  `ent_name` varchar(50) DEFAULT NULL COMMENT '企业客户名称 ',
  `job_salary` varchar(50) DEFAULT NULL COMMENT '真实薪资',
  `job_time` varchar(50) DEFAULT NULL COMMENT '入职时间',
  `job_position` varchar(50) DEFAULT NULL COMMENT '入职岗位',
  `operator` varchar(50) DEFAULT NULL,
  `remark` varchar(50) DEFAULT NULL COMMENT '备注',
  `create_time` varchar(50) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_regist_id`)
) ENGINE=InnoDB AUTO_INCREMENT=927 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of job_register
-- ----------------------------

-- ----------------------------
-- Table structure for kod_login
-- ----------------------------
DROP TABLE IF EXISTS `kod_login`;
CREATE TABLE `kod_login` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `region_id` int(11) NOT NULL,
  `department_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `login_time` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of kod_login
-- ----------------------------

-- ----------------------------
-- Table structure for mockinterview
-- ----------------------------
DROP TABLE IF EXISTS `mockinterview`;
CREATE TABLE `mockinterview` (
  `minterview_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '就业部&模拟面试管理',
  `minterview_student_id` int(11) NOT NULL,
  `intent_salary` varchar(50) DEFAULT NULL,
  `comm` varchar(50) DEFAULT NULL COMMENT '沟通能力',
  `remark` tinytext COMMENT '备注',
  `update_time` varchar(50) DEFAULT NULL,
  `operator` varchar(50) DEFAULT NULL COMMENT '操作人',
  PRIMARY KEY (`minterview_id`),
  KEY `minterview_student_id` (`minterview_student_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mockinterview
-- ----------------------------

-- ----------------------------
-- Table structure for morn_exam
-- ----------------------------
DROP TABLE IF EXISTS `morn_exam`;
CREATE TABLE `morn_exam` (
  `morn_exam_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '晨考表主键id',
  `morn_exam_student_id` int(11) NOT NULL COMMENT 'student表的主键id',
  `result` varchar(10) DEFAULT '',
  `operator_id` varchar(10) DEFAULT '' COMMENT '操作者工号',
  `create_time` varchar(20) DEFAULT '' COMMENT '创建时间',
  `update_time` varchar(20) DEFAULT '' COMMENT '修改时间',
  PRIMARY KEY (`morn_exam_id`),
  KEY `student_id_index` (`morn_exam_student_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of morn_exam
-- ----------------------------

-- ----------------------------
-- Table structure for msg_sent
-- ----------------------------
DROP TABLE IF EXISTS `msg_sent`;
CREATE TABLE `msg_sent` (
  `msg_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '短信发送表主键',
  `msg_content` varchar(255) NOT NULL DEFAULT '' COMMENT '短信内容',
  `msg_sender` varchar(50) NOT NULL DEFAULT '' COMMENT '短信发送者',
  `create_time` varchar(50) CHARACTER SET ascii NOT NULL DEFAULT '' COMMENT '短信发送时间',
  `update_time` varchar(50) NOT NULL DEFAULT '' COMMENT '短信更新时间',
  PRIMARY KEY (`msg_id`)
) ENGINE=InnoDB AUTO_INCREMENT=481 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of msg_sent
-- ----------------------------

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) DEFAULT NULL,
  `content` longtext,
  `create_time` varchar(30) DEFAULT NULL,
  `update_time` varchar(30) DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of notice
-- ----------------------------
INSERT INTO `notice` VALUES ('1', 'BOSS系统上线3.5版本', '<p>新增功能：</p><p>1.首页</p><p>&nbsp; &nbsp;1.1 增加系统公告，倪雪可以发布和编辑公告，全员可见；</p><p>&nbsp; &nbsp;1.2 常用功能的快捷导航，不同角色展示不同的导航入口，功能类似于左边的导航栏；</p><p>&nbsp; &nbsp;1.3 今日任务，例如咨询师今日要跟踪的资源的资源，点击该任务，可快速查看想看的数据；</p><p>2.财务管理</p><p>&nbsp; 2.1 财务流水：添加收入，支出，内部流转款项；</p><p>&nbsp; 2.2 预支结算：月底结算预支款，添加预支款的支出明细；</p><p>&nbsp; 2.3 学员学费：学生的缴费，退费录入</p><p>&nbsp;2.4 账户管理：全公司的银行账户的管理</p><p>&nbsp;2.5 会计科目：财务的一级科目和二级科目的管理</p><p>3.班级管理：</p><p>&nbsp; 3.1 增加开班的功能，咨询主管可以在开班的当天，点击开班按钮，后台将该班的所有学员状态置为在校学习</p><p>&nbsp; &nbsp; &nbsp; &nbsp;同步开通在线课堂对应的班级</p><p>4.操作手册</p><p>&nbsp; &nbsp;系统版本已经迁移到系统管理目录下面</p><p><span style=\"background-color: rgb(238, 236, 224); color: rgb(194, 79, 74);\">注意：</span></p><p><span style=\"background-color: rgb(238, 236, 224); color: rgb(194, 79, 74);\">&nbsp;1.如果学员开始用公司的电脑，然后又要用自己的电脑。电脑费用退费之前，该学生的咨询师须先修改此学生的应缴学费金额</span></p><p><span style=\"background-color: rgb(238, 236, 224); color: rgb(194, 79, 74);\">&nbsp; &nbsp;修改的地方：学员管理--基本信息--修改按钮，修改金额后，保存；</span></p><p><span style=\"background-color: rgb(238, 236, 224); color: rgb(194, 79, 74);\">2.财务在录入数据的时候，都会有一个交易时间，默认的都是当天。如果是之前发生的流水，后面才补录的情况，记得一定录入实际的交易时间；</span></p><p><span style=\"background-color: rgb(238, 236, 224); color: rgb(194, 79, 74);\">3.学生多贷的情况：要录入两笔缴费，一笔是正常的学生缴费，另一笔是多贷（注意选择）；</span></p><p><span style=\"background-color: rgb(238, 236, 224); color: rgb(194, 79, 74);\">4.</span><span style=\"background-color: rgb(238, 236, 224); color: rgb(194, 79, 74);\">由于18年的财务数据没有全部导入到新的系统，</span><span style=\"background-color: rgb(238, 236, 224); color: rgb(194, 79, 74);\">如果18年的学生来退费，但是系统有没有缴费记录的话，自己线下确认后，录一笔支出，不录学员退费；</span></p><p><span style=\"background-color: rgb(238, 236, 224); color: rgb(194, 79, 74);\">5.系统中的班级开班必须要在实际的开班时间当天；</span></p><p><span style=\"color: rgb(194, 79, 74); background-color: rgb(238, 236, 224);\">6.新的财务模块操作比较复杂，如果不清楚的，可以咨询下李帅；</span></p><p><span style=\"color: rgb(194, 79, 74); background-color: rgb(238, 236, 224);\">7.学生报名后，请咨询师及时录入学生的报名信息，并在学员管理中完善其基本信息。</span></p><p><br></p>', '2019-01-14 16:07', '2019-04-02 18:25', '60');

-- ----------------------------
-- Table structure for notice_user
-- ----------------------------
DROP TABLE IF EXISTS `notice_user`;
CREATE TABLE `notice_user` (
  `id` int(11) NOT NULL DEFAULT '0',
  `notice_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `create_time` varchar(30) DEFAULT NULL,
  `visit_count` int(11) DEFAULT NULL,
  `update_time` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of notice_user
-- ----------------------------

-- ----------------------------
-- Table structure for option
-- ----------------------------
DROP TABLE IF EXISTS `option`;
CREATE TABLE `option` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `options` text,
  `exerId` int(11) DEFAULT NULL,
  `update_time` varchar(200) DEFAULT NULL,
  `create_time` varchar(200) DEFAULT NULL,
  `stide` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3059 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of option
-- ----------------------------

-- ----------------------------
-- Table structure for paper
-- ----------------------------
DROP TABLE IF EXISTS `paper`;
CREATE TABLE `paper` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `paper_name` varchar(50) DEFAULT '',
  `code` varchar(50) DEFAULT '' COMMENT '试卷编号',
  `path` varchar(50) DEFAULT '' COMMENT '试卷路径',
  `operator_id` varchar(10) DEFAULT NULL,
  `create_time` varchar(20) DEFAULT '',
  `type` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of paper
-- ----------------------------

-- ----------------------------
-- Table structure for payment
-- ----------------------------
DROP TABLE IF EXISTS `payment`;
CREATE TABLE `payment` (
  `payment_id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) DEFAULT NULL,
  `dealings_id` int(11) DEFAULT NULL,
  `check_status` varchar(20) DEFAULT NULL COMMENT '定金复核状态',
  `fee_type` varchar(10) DEFAULT '' COMMENT '缴费/缴费',
  `finance_status` varchar(10) DEFAULT '' COMMENT '缴费状态',
  `refund_type` varchar(10) DEFAULT '' COMMENT '退费类型',
  `create_time` varchar(50) DEFAULT '',
  `update_time` varchar(50) DEFAULT '',
  PRIMARY KEY (`payment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2524 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of payment
-- ----------------------------

-- ----------------------------
-- Table structure for phase_exam
-- ----------------------------
DROP TABLE IF EXISTS `phase_exam`;
CREATE TABLE `phase_exam` (
  `phase_exam_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '阶段考核表id',
  `phase_exam_student_id` int(11) NOT NULL COMMENT '学生表id',
  `phase_exam_class_id` int(11) DEFAULT NULL,
  `phase` varchar(50) DEFAULT '' COMMENT '阶段',
  `score` varchar(20) DEFAULT '' COMMENT '成绩',
  `comment` varchar(500) DEFAULT '' COMMENT '评语',
  `operator_id` varchar(50) DEFAULT '' COMMENT '录入人的工号',
  `create_time` varchar(50) DEFAULT '' COMMENT '创建时间',
  `update_time` varchar(50) DEFAULT '' COMMENT '更新时间',
  PRIMARY KEY (`phase_exam_id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of phase_exam
-- ----------------------------

-- ----------------------------
-- Table structure for process_exception
-- ----------------------------
DROP TABLE IF EXISTS `process_exception`;
CREATE TABLE `process_exception` (
  `process_exception_id` int(11) NOT NULL AUTO_INCREMENT,
  `cause` varchar(50) DEFAULT NULL,
  `exception_type` varchar(50) DEFAULT NULL,
  `create_time` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`process_exception_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of process_exception
-- ----------------------------

-- ----------------------------
-- Table structure for question_type
-- ----------------------------
DROP TABLE IF EXISTS `question_type`;
CREATE TABLE `question_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(50) DEFAULT '' COMMENT '类型名字',
  `type_desc` varchar(255) DEFAULT NULL,
  `type_no` varchar(10) DEFAULT '' COMMENT '题号',
  `create_time` varchar(50) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of question_type
-- ----------------------------
INSERT INTO `question_type` VALUES ('1', '单选题', '每题2分，共30分', '一', '');
INSERT INTO `question_type` VALUES ('2', '填空题', '每空两分，共30分', '二', '');
INSERT INTO `question_type` VALUES ('3', '简答题', '每题8分，共40分', '三', '');

-- ----------------------------
-- Table structure for realinterview
-- ----------------------------
DROP TABLE IF EXISTS `realinterview`;
CREATE TABLE `realinterview` (
  `rinterview_id` int(11) NOT NULL AUTO_INCREMENT,
  `rinterview_student_id` int(11) DEFAULT NULL,
  `rinterview_ent_id` varchar(50) DEFAULT NULL,
  `rinterview_time` varchar(50) DEFAULT NULL,
  `interview_post` varchar(50) DEFAULT NULL COMMENT '面试岗位',
  `remark` varchar(50) DEFAULT NULL,
  `create_time` varchar(50) DEFAULT NULL,
  `operator` varchar(50) DEFAULT NULL COMMENT '操作人',
  PRIMARY KEY (`rinterview_id`),
  KEY `学生面试记录` (`rinterview_student_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=150 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of realinterview
-- ----------------------------

-- ----------------------------
-- Table structure for recruitment_info
-- ----------------------------
DROP TABLE IF EXISTS `recruitment_info`;
CREATE TABLE `recruitment_info` (
  `recruit_id` int(11) NOT NULL AUTO_INCREMENT,
  `recruit_enterprise_id` int(11) DEFAULT NULL,
  `begin_time` varchar(50) DEFAULT NULL,
  `end_time` varchar(50) DEFAULT NULL,
  `nums` varchar(50) DEFAULT NULL,
  `position` varchar(50) DEFAULT NULL,
  `requirement` tinytext,
  `create_time` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`recruit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of recruitment_info
-- ----------------------------

-- ----------------------------
-- Table structure for region
-- ----------------------------
DROP TABLE IF EXISTS `region`;
CREATE TABLE `region` (
  `region_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '区域表主键id',
  `region_name` varchar(50) DEFAULT '' COMMENT '区域名称',
  `begin_code` varchar(50) DEFAULT '' COMMENT '开始编码，用于学号，班号，工号等',
  PRIMARY KEY (`region_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of region
-- ----------------------------
INSERT INTO `region` VALUES ('1', '成都', 'WNCD');
INSERT INTO `region` VALUES ('2', '重庆', 'WNCQ');
INSERT INTO `region` VALUES ('3', '西安', 'WNXA');
INSERT INTO `region` VALUES ('4', '上海', 'WNSH');
INSERT INTO `region` VALUES ('5', '网校', 'WNWX');

-- ----------------------------
-- Table structure for returns
-- ----------------------------
DROP TABLE IF EXISTS `returns`;
CREATE TABLE `returns` (
  `returns_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '归还表id',
  `returns_borrows_id` int(11) DEFAULT NULL,
  `return_time` varchar(30) DEFAULT NULL COMMENT '归还时间',
  `recipient_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`returns_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of returns
-- ----------------------------

-- ----------------------------
-- Table structure for skill_record
-- ----------------------------
DROP TABLE IF EXISTS `skill_record`;
CREATE TABLE `skill_record` (
  `skillrecord_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '技术面试记录id',
  `skillrecord_student_id` int(11) NOT NULL COMMENT '学生id',
  `valuate` varchar(1000) DEFAULT NULL COMMENT '评价',
  `questions` varchar(1000) DEFAULT NULL COMMENT '问题',
  `result` varchar(50) DEFAULT NULL COMMENT '是否通过',
  `interviwer` varchar(50) DEFAULT NULL COMMENT '提问人',
  `create_time` varchar(50) DEFAULT NULL,
  `operator` varchar(50) DEFAULT NULL COMMENT '操作人',
  PRIMARY KEY (`skillrecord_id`)
) ENGINE=InnoDB AUTO_INCREMENT=268 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of skill_record
-- ----------------------------

-- ----------------------------
-- Table structure for statistics
-- ----------------------------
DROP TABLE IF EXISTS `statistics`;
CREATE TABLE `statistics` (
  `statistics_id` int(11) NOT NULL AUTO_INCREMENT,
  `public_account_income` varchar(50) DEFAULT NULL COMMENT '公帐收入',
  `public_account_expenditure` varchar(50) DEFAULT NULL COMMENT '公帐支出',
  `public_account_balance` varchar(50) DEFAULT NULL COMMENT '公帐余额',
  `private_account_income` varchar(50) DEFAULT NULL,
  `private_account_expenditure` varchar(50) DEFAULT NULL,
  `private_account_balance` varchar(50) DEFAULT NULL,
  `temporary_support_account_income` varchar(50) DEFAULT NULL COMMENT '暂支款金额',
  `temporary_support_expenditure` varchar(50) DEFAULT NULL COMMENT '暂支款支出',
  `temporary_support_balance` varchar(50) DEFAULT NULL COMMENT '暂支款余额',
  `region` varchar(50) DEFAULT NULL COMMENT '地区',
  PRIMARY KEY (`statistics_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of statistics
-- ----------------------------

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `student_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '学生表主键id',
  `region_id` int(11) DEFAULT '0',
  `student_customer_id` int(11) NOT NULL,
  `student_class_id` int(11) NOT NULL,
  `student_no` varchar(20) NOT NULL COMMENT '学号',
  `student_name` varchar(200) DEFAULT '' COMMENT '学生姓名',
  `tel` varchar(200) DEFAULT '' COMMENT '电话',
  `email` varchar(50) DEFAULT '' COMMENT '邮箱',
  `QQ` varchar(100) DEFAULT '18B7AC559AC7D17A' COMMENT 'QQ号码',
  `wechat` varchar(50) DEFAULT '',
  `sex` varchar(10) DEFAULT '' COMMENT '性别',
  `age` varchar(20) DEFAULT '' COMMENT '年龄',
  `IDnumber` varchar(20) DEFAULT '' COMMENT '身份证号',
  `household` varchar(50) DEFAULT '' COMMENT '户籍',
  `education` varchar(50) DEFAULT '04' COMMENT '学历',
  `school` varchar(50) DEFAULT '' COMMENT '学校',
  `major` varchar(50) DEFAULT '' COMMENT '专业',
  `graduation_time` varchar(50) DEFAULT '' COMMENT '毕业时间',
  `finance_status` varchar(50) DEFAULT '' COMMENT '财务状态',
  `refund_type` varchar(50) DEFAULT '06' COMMENT '退费类型',
  `status` varchar(50) DEFAULT '' COMMENT '学生状态：待缴费，已缴800，未缴清，已缴清，已失联，转就业，已就业，已毕业，已退学',
  `employee_name` varchar(20) DEFAULT '' COMMENT '咨询师',
  `source` varchar(20) DEFAULT '' COMMENT '来源',
  `adress` varchar(50) DEFAULT '' COMMENT '现在居住地',
  `emergency_tel` varchar(20) DEFAULT '' COMMENT '紧急联系电话',
  `emergency_person` varchar(20) DEFAULT '' COMMENT '紧急联系人',
  `picture` varchar(50) DEFAULT '' COMMENT '学生照片',
  `entrance_time` varchar(50) DEFAULT '' COMMENT '入学时间',
  `skill` varchar(10) DEFAULT '0' COMMENT '技术面试是否通过，通过1，未通过0',
  `re_compu` varchar(10) DEFAULT '2' COMMENT '是否退还电脑',
  `is_sign` varchar(10) DEFAULT '0' COMMENT '是否签署协议',
  `pass_time` varchar(20) DEFAULT '未开始' COMMENT '人事面试通过，开始推荐时间',
  `is_hired` varchar(10) DEFAULT '0' COMMENT '''是否入职''',
  `need_fee` varchar(10) DEFAULT '' COMMENT '应缴学费',
  `authentication` varchar(20) DEFAULT '01' COMMENT '是否认证官网',
  `last_valuate` varchar(255) DEFAULT NULL COMMENT '最后一次技术评语',
  `create_time` varchar(50) DEFAULT '' COMMENT '创建时间',
  `update_time` varchar(50) DEFAULT '' COMMENT '更新时间',
  `hope` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3543 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student
-- ----------------------------

-- ----------------------------
-- Table structure for student-1
-- ----------------------------
DROP TABLE IF EXISTS `student-1`;
CREATE TABLE `student-1` (
  `student_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '学生表主键id',
  `region_id` int(11) DEFAULT '0',
  `student_customer_id` int(11) NOT NULL,
  `student_class_id` int(11) NOT NULL,
  `student_no` varchar(20) NOT NULL COMMENT '学号',
  `student_name` varchar(200) DEFAULT '' COMMENT '学生姓名',
  `tel` varchar(200) DEFAULT '' COMMENT '电话',
  `email` varchar(50) DEFAULT '' COMMENT '邮箱',
  `QQ` varchar(100) DEFAULT '18B7AC559AC7D17A' COMMENT 'QQ号码',
  `wechat` varchar(50) DEFAULT '',
  `sex` varchar(10) DEFAULT '' COMMENT '性别',
  `age` varchar(20) DEFAULT '' COMMENT '年龄',
  `IDnumber` varchar(20) DEFAULT '' COMMENT '身份证号',
  `household` varchar(50) DEFAULT '' COMMENT '户籍',
  `education` varchar(50) DEFAULT '04' COMMENT '学历',
  `school` varchar(50) DEFAULT '' COMMENT '学校',
  `major` varchar(50) DEFAULT '' COMMENT '专业',
  `graduation_time` varchar(50) DEFAULT '' COMMENT '毕业时间',
  `finance_status` varchar(50) DEFAULT '' COMMENT '财务状态',
  `refund_type` varchar(50) DEFAULT '06' COMMENT '退费类型',
  `status` varchar(50) DEFAULT '' COMMENT '学生状态：待缴费，已缴800，未缴清，已缴清，已失联，转就业，已就业，已毕业，已退学',
  `employee_name` varchar(20) DEFAULT '' COMMENT '咨询师',
  `source` varchar(20) DEFAULT '' COMMENT '来源',
  `adress` varchar(50) DEFAULT '' COMMENT '现在居住地',
  `emergency_tel` varchar(20) DEFAULT '' COMMENT '紧急联系电话',
  `emergency_person` varchar(20) DEFAULT '' COMMENT '紧急联系人',
  `picture` varchar(50) DEFAULT '' COMMENT '学生照片',
  `entrance_time` varchar(50) DEFAULT '' COMMENT '入学时间',
  `skill` varchar(10) DEFAULT '0' COMMENT '技术面试是否通过，通过1，未通过0',
  `re_compu` varchar(10) DEFAULT '0' COMMENT '是否退还电脑',
  `is_sign` varchar(10) DEFAULT '0' COMMENT '是否签署协议',
  `pass_time` varchar(20) DEFAULT '未开始' COMMENT '人事面试通过，开始推荐时间',
  `is_hired` varchar(10) DEFAULT '0' COMMENT '''是否入职''',
  `need_fee` varchar(10) DEFAULT '' COMMENT '应缴学费',
  `last_valuate` varchar(255) DEFAULT NULL COMMENT '最后一次技术评语',
  `create_time` varchar(50) DEFAULT '' COMMENT '创建时间',
  `update_time` varchar(50) DEFAULT '' COMMENT '更新时间',
  `authentication` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3532 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student-1
-- ----------------------------

-- ----------------------------
-- Table structure for student_leave
-- ----------------------------
DROP TABLE IF EXISTS `student_leave`;
CREATE TABLE `student_leave` (
  `leave_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '请假表主键id',
  `student_id` varchar(50) DEFAULT '0' COMMENT '学生姓名',
  `class_id` int(10) DEFAULT NULL,
  `teacher_id` varchar(50) DEFAULT '' COMMENT '任课教师的工号',
  `reason` varchar(255) DEFAULT '' COMMENT '请假理由',
  `comment` varchar(255) DEFAULT '' COMMENT '假期到期时的处理方法',
  `start_time` varchar(50) DEFAULT '',
  `end_time` varchar(50) DEFAULT '' COMMENT '结束时间',
  `days` varchar(10) DEFAULT '' COMMENT '请假天数',
  `approver_id` varchar(50) DEFAULT '' COMMENT '批假人工号',
  `path` varchar(100) DEFAULT '' COMMENT '假条上传的路径',
  `leave_status` varchar(50) DEFAULT '' COMMENT '是否销假或者延期',
  `leave_type` varchar(50) DEFAULT '' COMMENT '请假类型',
  `terminate_time` varchar(50) DEFAULT '' COMMENT '销假时间',
  `leave_count` varchar(50) DEFAULT NULL COMMENT '是否扣分',
  `phase` varchar(20) DEFAULT NULL,
  `create_time` varchar(50) DEFAULT '' COMMENT '创建时间',
  `update_time` varchar(50) DEFAULT '' COMMENT '更新时间',
  PRIMARY KEY (`leave_id`)
) ENGINE=InnoDB AUTO_INCREMENT=523 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student_leave
-- ----------------------------

-- ----------------------------
-- Table structure for system_res
-- ----------------------------
DROP TABLE IF EXISTS `system_res`;
CREATE TABLE `system_res` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT '0',
  `name` varchar(111) DEFAULT '',
  `permission` varchar(255) DEFAULT '' COMMENT '权限',
  `des` varchar(255) DEFAULT '',
  `url` varchar(255) DEFAULT '',
  `iconCls` varchar(255) DEFAULT 'am-icon-file',
  `seq` int(11) DEFAULT '1',
  `type` int(10) DEFAULT '2' COMMENT '1 功能 2 权限',
  `create_time` varchar(255) DEFAULT '',
  `update_time` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=150 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of system_res
-- ----------------------------
INSERT INTO `system_res` VALUES ('1', '0', '系统资源', '/', '系统资源', '', 'am-icon-file', '1', '2', '', '');
INSERT INTO `system_res` VALUES ('2', '1', '系统管理', '/system', '系统管理', '', 'am-icon-file', '1', '2', '', '');
INSERT INTO `system_res` VALUES ('3', '1', '资源管理', '/resource', '资源管理', '', 'am-icon-file', '1', '2', '', '');
INSERT INTO `system_res` VALUES ('4', '1', '学员管理', '/student', '学员管理', '', 'am-icon-file', '1', '2', '', '');
INSERT INTO `system_res` VALUES ('6', '1', '财务管理', '/finance', '财务管理', '', 'am-icon-file', '1', '2', '', '');
INSERT INTO `system_res` VALUES ('8', '1', '人事管理', '/employee', '人事管理', '', 'am-icon-file', '1', '2', '', '');
INSERT INTO `system_res` VALUES ('9', '1', '市场营销', '/market', '市场营销', '', 'am-icon-file', '1', '2', '', '');
INSERT INTO `system_res` VALUES ('10', '1', '行政综合', '/administration', '行政综合', '', 'am-icon-file', '1', '2', '', '');
INSERT INTO `system_res` VALUES ('12', '3', '培训资源', '/resource/training', '培训资源', 'resource', 'am-icon-file', '1', '2', '2018-09-27', '');
INSERT INTO `system_res` VALUES ('13', '3', '分配资源', '/resource/allot', '										\r\n			分配资源							', '', 'am-icon-file', '1', '2', '2018-09-27', '');
INSERT INTO `system_res` VALUES ('14', '3', '公共资源池', '/resource/public', '										\r\n										公共资源池', 'public', 'am-icon-file', '1', '2', '2018-09-27', '');
INSERT INTO `system_res` VALUES ('15', '3', '转交资源', '/resource/transmit', '										\r\n										转交资源', '', 'am-icon-file', '1', '2', '2018-09-27', '');
INSERT INTO `system_res` VALUES ('16', '12', '查询所有', '/resource/training/list', '										\r\n										查询所有校区的资源', '', 'am-icon-file', '1', '2', '2018-09-27', '');
INSERT INTO `system_res` VALUES ('17', '16', '查询区域', '/resource/training/list/region', '										\r\n										查询某个校区的所有资源', '', 'am-icon-file', '1', '2', '2018-09-27', '');
INSERT INTO `system_res` VALUES ('18', '16', '查询部门', '/resource/training/list/dept', '										\r\n										查询某个部门的资源', '', 'am-icon-file', '1', '2', '2018-09-27', '');
INSERT INTO `system_res` VALUES ('19', '12', '新增', '/resource/training/add', '										\r\n										新增培训资源', '', 'am-icon-file', '1', '2', '2018-09-27', '');
INSERT INTO `system_res` VALUES ('20', '9', '简历资源', '/market/addnet', '										\r\n										新增网络资源', 'market', 'am-icon-file', '1', '2', '2018-09-27', '');
INSERT INTO `system_res` VALUES ('21', '12', '修改', '/resource/training/edit', '										\r\n										修改培训资源', '', 'am-icon-file', '1', '2', '2018-09-27', '');
INSERT INTO `system_res` VALUES ('22', '12', '废弃', '/resource/public/abandon', '										\r\n										废弃资源', '', 'am-icon-file', '1', '2', '2018-09-27', '');
INSERT INTO `system_res` VALUES ('23', '14', '查询', '/resource/public/list', '										\r\n										查询公共资源池的资源', '', 'am-icon-file', '1', '2', '2018-09-27', '');
INSERT INTO `system_res` VALUES ('24', '14', '认领', '/resource/public/get', '										\r\n										认领公共资源池中的资源', '', 'am-icon-file', '1', '2', '2018-09-27', '');
INSERT INTO `system_res` VALUES ('25', '4', '学员信息', '/student/info', '										\r\n										学生的基本信息', 'studentInfo', 'am-icon-file', '1', '2', '2018-09-27', '');
INSERT INTO `system_res` VALUES ('26', '25', '查询所有', '/student/info/list', '										\r\n										查询所有校区的学生信息', '', 'am-icon-file', '1', '2', '2018-09-27', '');
INSERT INTO `system_res` VALUES ('27', '26', '查询区域', '/student/info/list/region', '										\r\n										查询某个校区的学生信息', '', 'am-icon-file', '1', '2', '2018-09-27', '');
INSERT INTO `system_res` VALUES ('28', '25', '修改', '/student/info/edit', '										\r\n										修改学生基本信息', '', 'am-icon-file', '1', '2', '2018-09-27', '');
INSERT INTO `system_res` VALUES ('29', '25', '上传照片', '/student/info/upload', '										\r\n										上传学生照片', '', 'am-icon-file', '1', '2', '2018-09-27', '');
INSERT INTO `system_res` VALUES ('30', '4', '考评录入', '/student/evaluation', '										\r\n										录入学生的考勤，晨考，阶段考试情况', 'evaluation', 'am-icon-file', '1', '2', '2018-09-27', '');
INSERT INTO `system_res` VALUES ('31', '4', '考勤晨考', '/student/exam', '										\r\n										查询考勤记录和晨考记录', '', 'am-icon-file', '1', '2', '2018-09-27', '');
INSERT INTO `system_res` VALUES ('32', '4', '阶段测评', '/student/phase', '										\r\n										查询阶段考试记录', '', 'am-icon-file', '1', '2', '2018-09-27', '');
INSERT INTO `system_res` VALUES ('33', '110', '学员班级', '/student/class', '										\r\n										班级管理', '', 'am-icon-file', '1', '2', '2018-09-27', '');
INSERT INTO `system_res` VALUES ('34', '110', '课程安排', '/student/course', '										\r\n										课程安排', '', 'am-icon-file', '1', '2', '2018-09-27', '');
INSERT INTO `system_res` VALUES ('35', '4', '学员请假', '/student/leave', '										\r\n										学生请假', '', 'am-icon-file', '1', '2', '2018-09-27', '');
INSERT INTO `system_res` VALUES ('36', '34', '查询', '/student/course/list', '									查询课程安排', '', 'am-icon-file', '1', '2', '2018-09-27', '');
INSERT INTO `system_res` VALUES ('37', '34', '新增', '/student/course/add', '										\r\n										新增排课记录', '', 'am-icon-file', '1', '2', '2018-09-27', '');
INSERT INTO `system_res` VALUES ('38', '34', '修改', '/student/course/edit', '										\r\n										修改排课记录', '', 'am-icon-file', '1', '2', '2018-09-27', '');
INSERT INTO `system_res` VALUES ('39', '35', '查询', '/student/leave/list', '										\r\n										查询学生请假信息', '', 'am-icon-file', '1', '2', '2018-09-27', '');
INSERT INTO `system_res` VALUES ('40', '35', '新增', '/student/leave/add', '										\r\n										新增学生请假信息', '', 'am-icon-file', '1', '2', '2018-09-27', '');
INSERT INTO `system_res` VALUES ('41', '35', '修改', '/student/leave/edit', '										\r\n										修改学生请假信息', '', 'am-icon-file', '1', '2', '2018-09-27', '');
INSERT INTO `system_res` VALUES ('42', '35', '上传假条', '/student/leave/upload', '										\r\n										上传学生请假假条', '', 'am-icon-file', '1', '2', '2018-09-27', '');
INSERT INTO `system_res` VALUES ('43', '31', '查询所有', '/student/exam/list', '										\r\n										查询所有校区的晨考记录', '', 'am-icon-file', '1', '2', '2018-09-27', '');
INSERT INTO `system_res` VALUES ('44', '43', '查询区域', '/student/exam/list/region', '										\r\n										查询某校区的晨考记录', '', 'am-icon-file', '1', '2', '2018-09-27', '');
INSERT INTO `system_res` VALUES ('45', '31', '修改', '/student/exam/edit', '										\r\n										修改晨考记录', '', 'am-icon-file', '1', '2', '2018-09-27', '');
INSERT INTO `system_res` VALUES ('46', '32', '查询所有', '/student/phase/list', '										\r\n										查询所有校区的阶段考试记录', '', 'am-icon-file', '1', '2', '2018-09-27', '');
INSERT INTO `system_res` VALUES ('47', '46', '查询区域', '/student/phase/list/region', '										\r\n										查询某个校区的阶段考试记录', '', 'am-icon-file', '1', '2', '2018-09-27', '');
INSERT INTO `system_res` VALUES ('48', '32', '修改', '/student/phase/edit', '										\r\n										修改阶段考试记录', '', 'am-icon-file', '1', '2', '2018-09-27', '');
INSERT INTO `system_res` VALUES ('49', '33', '查询', '/student/class/list', '										\r\n										查询所有的班级', '', 'am-icon-file', '1', '2', '2018-09-27', '');
INSERT INTO `system_res` VALUES ('50', '33', '新增', '/student/class/add', '										\r\n										添加班级', '', 'am-icon-file', '1', '2', '2018-09-27', '');
INSERT INTO `system_res` VALUES ('51', '33', '转校', '/student/class/change/school', '										\r\n										学生转校操作', '', 'am-icon-file', '1', '2', '2018-09-27', '');
INSERT INTO `system_res` VALUES ('52', '33', '转班', '/student/class/change/class', '										\r\n										学生转班操作', '', 'am-icon-file', '1', '2', '2018-09-27', '');
INSERT INTO `system_res` VALUES ('53', '12', '跟踪', '/resource/training/tracking', '										\r\n								跟踪培训资源		', '', 'am-icon-file', '1', '2', '2018-09-27', '');
INSERT INTO `system_res` VALUES ('66', '6', '财务流水', '/financeDetail', '财务流水', '/finance', 'am-icon-file', '1', '2', '2018-09-30', '');
INSERT INTO `system_res` VALUES ('67', '6', '预支结算', '/advanceDetail', '预支款结算', '/advance', 'am-icon-file', '1', '2', '2018-09-30', '');
INSERT INTO `system_res` VALUES ('68', '6', '学员缴费', '/payment', '学员缴费', '/payment', 'am-icon-file', '1', '2', '2018-09-30', '');
INSERT INTO `system_res` VALUES ('69', '8', '员工信息', '/employee', '员工信息									', 'employee', 'am-icon-file', '1', '2', '2018-09-30', '');
INSERT INTO `system_res` VALUES ('80', '10', '采购登记', '/administration/assets', '采购登记								', '', 'am-icon-file', '1', '2', '2018-09-30', '');
INSERT INTO `system_res` VALUES ('81', '80', '查询所有', '/assets/selectAll', '采购登记查询所有						', '', 'am-icon-file', '1', '2', '2018-09-30', '');
INSERT INTO `system_res` VALUES ('82', '81', '查询区域', '/assets/selectRegion', '采购登记查询区域					', '', 'am-icon-file', '1', '2', '2018-09-30', '');
INSERT INTO `system_res` VALUES ('83', '80', '新增采购登记', '/assets/add', '新增采购登记			', '', 'am-icon-file', '1', '2', '2018-09-30', '');
INSERT INTO `system_res` VALUES ('84', '80', '修改采购登记', '/assets/update', '修改采购登记			', '', 'am-icon-file', '1', '2', '2018-09-30', '');
INSERT INTO `system_res` VALUES ('85', '10', '领用登记', '/administration/borrow', '领用登记										', 'borrow', 'am-icon-file', '1', '2', '2018-09-30', '');
INSERT INTO `system_res` VALUES ('86', '85', '查询所有', '/borrow/selectAll', '领用登记查询所有									', '', 'am-icon-file', '1', '2', '2018-09-30', '');
INSERT INTO `system_res` VALUES ('87', '86', '查询区域', '/borrow/selectRegion', '领用登记查询区域									', '', 'am-icon-file', '1', '2', '2018-09-30', '');
INSERT INTO `system_res` VALUES ('88', '85', '新增领用登记', '/borrow/add', '新增领用登记									', '', 'am-icon-file', '1', '2', '2018-09-30', '');
INSERT INTO `system_res` VALUES ('89', '10', '归还登记', '/administration/returns', '归还登记								', '', 'am-icon-file', '1', '2', '2018-09-30', '');
INSERT INTO `system_res` VALUES ('90', '89', '查询所有', '/returns/selectAll', '查询所有							', '', 'am-icon-file', '1', '2', '2018-09-30', '');
INSERT INTO `system_res` VALUES ('91', '90', '查询区域', '/returns/selectRegion', '查询区域							', '', 'am-icon-file', '1', '2', '2018-09-30', '');
INSERT INTO `system_res` VALUES ('92', '89', '新增归还登记', '/returns/add', '新增归还登记					', '', 'am-icon-file', '1', '2', '2018-09-30', '');
INSERT INTO `system_res` VALUES ('93', '1', '就业管理', '/job', '就业管理									', '', 'am-icon-file', '1', '2', '2018-09-30', '');
INSERT INTO `system_res` VALUES ('94', '93', '技术面试', '/skills', '技术面试								', '', 'am-icon-file', '1', '2', '2018-09-30', '');
INSERT INTO `system_res` VALUES ('95', '93', '就业管理', '/employ', '就业管理				', 'employ', 'am-icon-file', '1', '2', '2018-09-30', '');
INSERT INTO `system_res` VALUES ('96', '94', '查询所有', '/skills/selectAll', '										\r\n										', '', 'am-icon-file', '1', '2', '2018-10-08', '');
INSERT INTO `system_res` VALUES ('97', '96', '查询区域', '/skills/selectRegion', '										\r\n										', '', 'am-icon-file', '1', '2', '2018-10-08', '');
INSERT INTO `system_res` VALUES ('98', '95', '查询所有', '/employ/selectAll', '										\r\n										', '', 'am-icon-file', '1', '2', '2018-10-08', '');
INSERT INTO `system_res` VALUES ('99', '98', '查询区域', '/employ/selectRegion', '										\r\n										', '', 'am-icon-file', '1', '2', '2018-10-08', '');
INSERT INTO `system_res` VALUES ('100', '95', '修改', '/employ/update', '										\r\n										', '', 'am-icon-file', '1', '2', '2018-10-08', '');
INSERT INTO `system_res` VALUES ('102', '1', '企业客户', '/enterprise', '										\r\n										', '', 'am-icon-file', '1', '2', '2018-10-08', '');
INSERT INTO `system_res` VALUES ('103', '102', '查询所有', '/enterprise/selectAll', '										\r\n										', '', 'am-icon-file', '1', '2', '2018-10-08', '');
INSERT INTO `system_res` VALUES ('104', '103', '查询区域', '/enterprise/selectRegion', '										\r\n										', '', 'am-icon-file', '1', '2', '2018-10-08', '');
INSERT INTO `system_res` VALUES ('105', '102', '新增企业', '/enterprise/addCompany', '										\r\n										', '', 'am-icon-file', '1', '2', '2018-10-08', '');
INSERT INTO `system_res` VALUES ('106', '102', '修改信息', '/enterprise/update', '										\r\n										', '', 'am-icon-file', '1', '2', '2018-10-08', '');
INSERT INTO `system_res` VALUES ('107', '94', '修改面试', '/skills/update', '										\r\n										', '', 'am-icon-file', '1', '2', '2018-10-09', '');
INSERT INTO `system_res` VALUES ('108', '35', '销假', '/student/leave/end', '										\r\n		销假								', '', 'am-icon-file', '1', '2', '2018-10-09', '');
INSERT INTO `system_res` VALUES ('109', '1', '报表中心', '/report', '										\r\n										报表中心', '', 'am-icon-file', '1', '2', '2018-10-10', '');
INSERT INTO `system_res` VALUES ('110', '1', '教学管理', '/teaching', '教学管理', '', 'am-icon-file', '1', '2', '', '');
INSERT INTO `system_res` VALUES ('111', '110', '加班申请', '/teaching/apply', '加班申请', '', 'am-icon-file', '1', '2', '', '');
INSERT INTO `system_res` VALUES ('112', '111', '查询', '/teaching/apply/list', '查询加班申请记录', '', 'am-icon-file', '1', '2', '', '');
INSERT INTO `system_res` VALUES ('113', '111', '查询所有', '/teaching/apply/listAll', '查询所有的加班申请', '', 'am-icon-file', '1', '2', '', '');
INSERT INTO `system_res` VALUES ('114', '110', '教师值班', '/teaching/duty', '教师值班', '', 'am-icon-file', '1', '2', '', '');
INSERT INTO `system_res` VALUES ('115', '114', '查询', '/teaching/duty/list', '查询教师值班记录', '', 'am-icon-file', '1', '2', '', '');
INSERT INTO `system_res` VALUES ('116', '114', '查询所有', '/teaching/dutylistAll', '查询所有的教师值班记录', '', 'am-icon-file', '1', '2', '', '');
INSERT INTO `system_res` VALUES ('117', '114', '新增', '/teaching/duty/add', '指定值班', '', 'am-icon-file', '1', '2', '', '');
INSERT INTO `system_res` VALUES ('118', '110', '我的审批', '/teaching/approve', '审批值班加班', '', 'am-icon-file', '1', '2', '', '');
INSERT INTO `system_res` VALUES ('119', '118', '查询', '/teaching/approve/list', '查询审批记录', '', 'am-icon-file', '1', '2', '', '');
INSERT INTO `system_res` VALUES ('120', '118', '审批', '/teaching/approve/update', '审批操作', '', 'am-icon-file', '1', '2', '', '');
INSERT INTO `system_res` VALUES ('121', '1', '题库管理', '/exercise', '题库管理', '', 'am-icon-file', '1', '2', '', '');
INSERT INTO `system_res` VALUES ('122', '121', '题库管理', '/exercise/manage', '查询题库中的题目', '', 'am-icon-file', '1', '2', '', '');
INSERT INTO `system_res` VALUES ('123', '122', '新增', '/exercise/manage/add', '新增题库中的题目', '', 'am-icon-file', '1', '2', '', '');
INSERT INTO `system_res` VALUES ('124', '122', '修改', '/exercise/manage/update', '修改题库中的题目', '', 'am-icon-file', '1', '2', '', '');
INSERT INTO `system_res` VALUES ('125', '121', '自动出题', '/exercise/problem', '自动出题', '', 'am-icon-file', '1', '2', '', '');
INSERT INTO `system_res` VALUES ('126', '121', '试卷记录', '/exercise/paper', '试卷的出卷', '', 'am-icon-file', '1', '2', '', '');
INSERT INTO `system_res` VALUES ('127', '1', '系统版本', '/version', '系统版本', '', 'am-icon-file', '1', '2', '', '');
INSERT INTO `system_res` VALUES ('128', '127', '上传', '/version/upload', '上传操作文档', '', 'am-icon-file', '1', '2', '', '');
INSERT INTO `system_res` VALUES ('129', '109', '查询所有', '/report/listAll', '查询所有的加班汇总', '', 'am-icon-file', '1', '2', '', '');
INSERT INTO `system_res` VALUES ('130', '2', '公告发布', '/notice/add', '新增公告', '/notice', 'am-icon-file', '1', '2', '2019-01-12', '');
INSERT INTO `system_res` VALUES ('131', '130', '修改公告', '/notice/edit', '修改公告', null, 'am-icon-file', '1', '2', '2019-01-12', '');
INSERT INTO `system_res` VALUES ('132', '6', '账户管理', '/account', '公司的银行账号', '/account', 'am-icon-file', '1', '2', '', '');
INSERT INTO `system_res` VALUES ('133', '6', '会计科目', '/subject', '财务的会计科目', '/subject', 'am-icon-file', '1', '2', '', '');
INSERT INTO `system_res` VALUES ('134', '66', '查询所有', '/financeDetail/findAll', '查询所有的财务流水', '', 'am-icon-file', '1', '2', '', '');
INSERT INTO `system_res` VALUES ('135', '67', '查询所有', '/advanceDetail/findAll', '查询所有的预支款报账', '', 'am-icon-file', '1', '2', '', '');
INSERT INTO `system_res` VALUES ('136', '68', '查询所有', '/payment/findAll', '查询所有的学员缴费', '', 'am-icon-file', '1', '2', '', '');
INSERT INTO `system_res` VALUES ('137', '33', '开班', '/student/class/open/class', '', '', 'am-icon-file', '1', '2', '', '');
INSERT INTO `system_res` VALUES ('138', '110', '加班汇总', '/teaching/count', '教学部的加班和值班汇总', '', 'am-icon-file', '1', '2', '', '');
INSERT INTO `system_res` VALUES ('139', '6', '财务审批', '/finance-check', '审核财务的修改', '', 'am-icon-file', '1', '2', '', '');
INSERT INTO `system_res` VALUES ('140', '139', '查看全部', '/finance-check/findAll', '查看所有修改的信息', '', 'am-icon-file', '1', '2', '', '');
INSERT INTO `system_res` VALUES ('141', '139', '审批', '/finance-check/check', '审核提交的修改', '', 'am-icon-file', '1', '2', '', '');
INSERT INTO `system_res` VALUES ('142', '66', '修改', '/financeDetail/edit', '修改财务流水', '', 'am-icon-file', '1', '2', '', '');
INSERT INTO `system_res` VALUES ('143', '4', '周考成绩', '/student/week', '周考成绩查询', '/student/week', 'am-icon-file', '1', '2', '2019-04-01', '');
INSERT INTO `system_res` VALUES ('144', '4', '综合评估', '/student/compre', '学生的综合评测分数查询', '/student/compre', 'am-icon-file', '1', '2', '2019-04-01', '');
INSERT INTO `system_res` VALUES ('145', '143', '查询所有', '/student/week/list', null, '/student/week/list', 'am-icon-file', '1', '2', '2019-04-01', '');
INSERT INTO `system_res` VALUES ('146', '143', '修改', '/student/week/edit', null, '/student/week/edit', 'am-icon-file', '1', '2', '2019-04-01', '');
INSERT INTO `system_res` VALUES ('147', '145', '查询区域', '/student/week/list/region', null, '/student/week/list/region', 'am-icon-file', '1', '2', '2019-04-01', '');
INSERT INTO `system_res` VALUES ('148', '144', '查询所有', '/student/compre/list', null, '/student/compre/list', 'am-icon-file', '1', '2', '2019-04-01', '');
INSERT INTO `system_res` VALUES ('149', '148', '查询区域', '/student/compre/list/region', null, '/student/compre/list/region', 'am-icon-file', '1', '2', '2019-04-01', '');

-- ----------------------------
-- Table structure for system_role
-- ----------------------------
DROP TABLE IF EXISTS `system_role`;
CREATE TABLE `system_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(55) DEFAULT NULL,
  `des` varchar(55) DEFAULT NULL,
  `seq` int(11) DEFAULT '1',
  `iconCls` varchar(55) DEFAULT 'status_online',
  `pid` int(11) DEFAULT '0',
  `createdate` varchar(50) DEFAULT NULL,
  `updatedate` varchar(50) DEFAULT '' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of system_role
-- ----------------------------
INSERT INTO `system_role` VALUES ('1', '超级管理员', '								\r\n										', '1', 'status_online', '0', '2018-10-09', '');
INSERT INTO `system_role` VALUES ('2', '系统管理员', '								\r\n										', '1', 'status_online', '0', '2018-10-09', '');
INSERT INTO `system_role` VALUES ('3', '总经理', '								\r\n										', '1', 'status_online', '0', '2018-10-09', '');
INSERT INTO `system_role` VALUES ('4', '副总经理', '								\r\n										', '1', 'status_online', '0', '2018-10-09', '');
INSERT INTO `system_role` VALUES ('5', '分公司总经理', '								\r\n										', '1', 'status_online', '0', '2018-10-09', '');
INSERT INTO `system_role` VALUES ('6', '销售总监', '								\r\n										', '1', 'status_online', '0', '2018-10-10', '');
INSERT INTO `system_role` VALUES ('7', '市场总监', '								\r\n										', '1', 'status_online', '0', '2018-10-10', '');
INSERT INTO `system_role` VALUES ('8', '市场部主管', '								\r\n										', '1', 'status_online', '0', '2018-10-10', '');
INSERT INTO `system_role` VALUES ('9', '电销部主管', '								\r\n										', '1', 'status_online', '0', '2018-10-10', '');
INSERT INTO `system_role` VALUES ('10', '渠道主管', '								\r\n										', '1', 'status_online', '0', '2018-10-10', '');
INSERT INTO `system_role` VALUES ('11', '教学部主管', '								\r\n										', '1', 'status_online', '0', '2018-10-10', '');
INSERT INTO `system_role` VALUES ('12', '咨询主管', '								\r\n										', '1', 'status_online', '0', '2018-10-10', '');
INSERT INTO `system_role` VALUES ('13', '咨询师', '								\r\n										', '1', 'status_online', '0', '2018-10-10', '');
INSERT INTO `system_role` VALUES ('14', '教学老师', '								\r\n										', '1', 'status_online', '0', '2018-10-10', '');
INSERT INTO `system_role` VALUES ('15', '就业老师', '								\r\n										', '1', 'status_online', '0', '2018-10-10', '');
INSERT INTO `system_role` VALUES ('16', '市场专员', '								\r\n										', '1', 'status_online', '0', '2018-10-10', '');
INSERT INTO `system_role` VALUES ('17', '教务', '								\r\n										', '1', 'status_online', '0', '2018-10-10', '');
INSERT INTO `system_role` VALUES ('18', '运维', '								\r\n										', '1', 'status_online', '0', '2018-10-10', '');
INSERT INTO `system_role` VALUES ('19', '出纳', '							', '1', 'status_online', '0', '2018-10-10', '2019-01-12 16:31');
INSERT INTO `system_role` VALUES ('21', '测试使用', '								\r\n										', '1', 'status_online', '0', '2018-10-10', '');
INSERT INTO `system_role` VALUES ('22', '暂无权限', '								\r\n										', '1', 'status_online', '0', '2018-10-10', '');
INSERT INTO `system_role` VALUES ('23', '行政', '', '1', 'status_online', '0', null, '');
INSERT INTO `system_role` VALUES ('24', '班主任', '								\r\n										', '1', 'status_online', '0', '2018-10-11', '');
INSERT INTO `system_role` VALUES ('25', '公司股东', '公司所有的股东', '1', 'status_online', '0', null, '');
INSERT INTO `system_role` VALUES ('26', '财务', null, '1', 'status_online', '0', '2019-01-12', '');
INSERT INTO `system_role` VALUES ('27', '校长', '分公司负责人', '1', 'status_online', '0', '2019-01-12', '');
INSERT INTO `system_role` VALUES ('28', 'BOSS小编', '发布和编辑公告', '1', 'status_online', '0', '2019-01-14', '');
INSERT INTO `system_role` VALUES ('29', '人事总监', null, '1', 'status_online', '0', '2019-01-25', '');
INSERT INTO `system_role` VALUES ('30', '财务总监', null, '1', 'status_online', '0', '2019-02-28', '');

-- ----------------------------
-- Table structure for system_role_res
-- ----------------------------
DROP TABLE IF EXISTS `system_role_res`;
CREATE TABLE `system_role_res` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `res_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5577 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of system_role_res
-- ----------------------------
INSERT INTO `system_role_res` VALUES ('361', '4', '8');
INSERT INTO `system_role_res` VALUES ('362', '25', '8');
INSERT INTO `system_role_res` VALUES ('363', '27', '8');
INSERT INTO `system_role_res` VALUES ('364', '31', '8');
INSERT INTO `system_role_res` VALUES ('365', '44', '8');
INSERT INTO `system_role_res` VALUES ('366', '32', '8');
INSERT INTO `system_role_res` VALUES ('367', '47', '8');
INSERT INTO `system_role_res` VALUES ('368', '33', '8');
INSERT INTO `system_role_res` VALUES ('369', '49', '8');
INSERT INTO `system_role_res` VALUES ('370', '34', '8');
INSERT INTO `system_role_res` VALUES ('371', '36', '8');
INSERT INTO `system_role_res` VALUES ('372', '35', '8');
INSERT INTO `system_role_res` VALUES ('373', '39', '8');
INSERT INTO `system_role_res` VALUES ('374', '8', '8');
INSERT INTO `system_role_res` VALUES ('375', '69', '8');
INSERT INTO `system_role_res` VALUES ('376', '10', '8');
INSERT INTO `system_role_res` VALUES ('377', '80', '8');
INSERT INTO `system_role_res` VALUES ('378', '82', '8');
INSERT INTO `system_role_res` VALUES ('379', '85', '8');
INSERT INTO `system_role_res` VALUES ('380', '87', '8');
INSERT INTO `system_role_res` VALUES ('381', '89', '8');
INSERT INTO `system_role_res` VALUES ('382', '91', '8');
INSERT INTO `system_role_res` VALUES ('383', '93', '8');
INSERT INTO `system_role_res` VALUES ('384', '94', '8');
INSERT INTO `system_role_res` VALUES ('385', '97', '8');
INSERT INTO `system_role_res` VALUES ('386', '95', '8');
INSERT INTO `system_role_res` VALUES ('387', '99', '8');
INSERT INTO `system_role_res` VALUES ('388', '3', '9');
INSERT INTO `system_role_res` VALUES ('389', '12', '9');
INSERT INTO `system_role_res` VALUES ('390', '16', '9');
INSERT INTO `system_role_res` VALUES ('391', '18', '9');
INSERT INTO `system_role_res` VALUES ('392', '19', '9');
INSERT INTO `system_role_res` VALUES ('393', '21', '9');
INSERT INTO `system_role_res` VALUES ('394', '22', '9');
INSERT INTO `system_role_res` VALUES ('395', '53', '9');
INSERT INTO `system_role_res` VALUES ('396', '13', '9');
INSERT INTO `system_role_res` VALUES ('397', '14', '9');
INSERT INTO `system_role_res` VALUES ('398', '23', '9');
INSERT INTO `system_role_res` VALUES ('399', '24', '9');
INSERT INTO `system_role_res` VALUES ('400', '4', '9');
INSERT INTO `system_role_res` VALUES ('401', '25', '9');
INSERT INTO `system_role_res` VALUES ('402', '27', '9');
INSERT INTO `system_role_res` VALUES ('403', '28', '9');
INSERT INTO `system_role_res` VALUES ('404', '31', '9');
INSERT INTO `system_role_res` VALUES ('405', '44', '9');
INSERT INTO `system_role_res` VALUES ('406', '32', '9');
INSERT INTO `system_role_res` VALUES ('407', '47', '9');
INSERT INTO `system_role_res` VALUES ('408', '33', '9');
INSERT INTO `system_role_res` VALUES ('409', '49', '9');
INSERT INTO `system_role_res` VALUES ('410', '34', '9');
INSERT INTO `system_role_res` VALUES ('411', '36', '9');
INSERT INTO `system_role_res` VALUES ('412', '35', '9');
INSERT INTO `system_role_res` VALUES ('413', '39', '9');
INSERT INTO `system_role_res` VALUES ('414', '8', '9');
INSERT INTO `system_role_res` VALUES ('415', '69', '9');
INSERT INTO `system_role_res` VALUES ('416', '10', '9');
INSERT INTO `system_role_res` VALUES ('417', '80', '9');
INSERT INTO `system_role_res` VALUES ('418', '82', '9');
INSERT INTO `system_role_res` VALUES ('419', '85', '9');
INSERT INTO `system_role_res` VALUES ('420', '87', '9');
INSERT INTO `system_role_res` VALUES ('421', '89', '9');
INSERT INTO `system_role_res` VALUES ('422', '91', '9');
INSERT INTO `system_role_res` VALUES ('523', '88', '21');
INSERT INTO `system_role_res` VALUES ('524', '1', '21');
INSERT INTO `system_role_res` VALUES ('525', '89', '21');
INSERT INTO `system_role_res` VALUES ('526', '2', '21');
INSERT INTO `system_role_res` VALUES ('527', '90', '21');
INSERT INTO `system_role_res` VALUES ('528', '3', '21');
INSERT INTO `system_role_res` VALUES ('529', '91', '21');
INSERT INTO `system_role_res` VALUES ('530', '12', '21');
INSERT INTO `system_role_res` VALUES ('531', '92', '21');
INSERT INTO `system_role_res` VALUES ('532', '16', '21');
INSERT INTO `system_role_res` VALUES ('533', '93', '21');
INSERT INTO `system_role_res` VALUES ('534', '17', '21');
INSERT INTO `system_role_res` VALUES ('535', '94', '21');
INSERT INTO `system_role_res` VALUES ('536', '18', '21');
INSERT INTO `system_role_res` VALUES ('537', '96', '21');
INSERT INTO `system_role_res` VALUES ('538', '97', '21');
INSERT INTO `system_role_res` VALUES ('539', '19', '21');
INSERT INTO `system_role_res` VALUES ('540', '107', '21');
INSERT INTO `system_role_res` VALUES ('541', '21', '21');
INSERT INTO `system_role_res` VALUES ('542', '95', '21');
INSERT INTO `system_role_res` VALUES ('543', '22', '21');
INSERT INTO `system_role_res` VALUES ('544', '98', '21');
INSERT INTO `system_role_res` VALUES ('545', '53', '21');
INSERT INTO `system_role_res` VALUES ('546', '99', '21');
INSERT INTO `system_role_res` VALUES ('547', '13', '21');
INSERT INTO `system_role_res` VALUES ('548', '100', '21');
INSERT INTO `system_role_res` VALUES ('549', '14', '21');
INSERT INTO `system_role_res` VALUES ('550', '102', '21');
INSERT INTO `system_role_res` VALUES ('551', '23', '21');
INSERT INTO `system_role_res` VALUES ('552', '103', '21');
INSERT INTO `system_role_res` VALUES ('553', '24', '21');
INSERT INTO `system_role_res` VALUES ('554', '104', '21');
INSERT INTO `system_role_res` VALUES ('555', '15', '21');
INSERT INTO `system_role_res` VALUES ('556', '105', '21');
INSERT INTO `system_role_res` VALUES ('557', '4', '21');
INSERT INTO `system_role_res` VALUES ('558', '106', '21');
INSERT INTO `system_role_res` VALUES ('559', '25', '21');
INSERT INTO `system_role_res` VALUES ('560', '26', '21');
INSERT INTO `system_role_res` VALUES ('561', '27', '21');
INSERT INTO `system_role_res` VALUES ('562', '28', '21');
INSERT INTO `system_role_res` VALUES ('563', '29', '21');
INSERT INTO `system_role_res` VALUES ('564', '30', '21');
INSERT INTO `system_role_res` VALUES ('565', '31', '21');
INSERT INTO `system_role_res` VALUES ('566', '43', '21');
INSERT INTO `system_role_res` VALUES ('567', '44', '21');
INSERT INTO `system_role_res` VALUES ('568', '45', '21');
INSERT INTO `system_role_res` VALUES ('569', '32', '21');
INSERT INTO `system_role_res` VALUES ('570', '46', '21');
INSERT INTO `system_role_res` VALUES ('571', '47', '21');
INSERT INTO `system_role_res` VALUES ('572', '48', '21');
INSERT INTO `system_role_res` VALUES ('573', '33', '21');
INSERT INTO `system_role_res` VALUES ('574', '49', '21');
INSERT INTO `system_role_res` VALUES ('575', '50', '21');
INSERT INTO `system_role_res` VALUES ('576', '51', '21');
INSERT INTO `system_role_res` VALUES ('577', '52', '21');
INSERT INTO `system_role_res` VALUES ('578', '34', '21');
INSERT INTO `system_role_res` VALUES ('579', '36', '21');
INSERT INTO `system_role_res` VALUES ('580', '37', '21');
INSERT INTO `system_role_res` VALUES ('581', '38', '21');
INSERT INTO `system_role_res` VALUES ('582', '35', '21');
INSERT INTO `system_role_res` VALUES ('583', '39', '21');
INSERT INTO `system_role_res` VALUES ('584', '40', '21');
INSERT INTO `system_role_res` VALUES ('585', '41', '21');
INSERT INTO `system_role_res` VALUES ('586', '42', '21');
INSERT INTO `system_role_res` VALUES ('587', '108', '21');
INSERT INTO `system_role_res` VALUES ('588', '6', '21');
INSERT INTO `system_role_res` VALUES ('589', '66', '21');
INSERT INTO `system_role_res` VALUES ('590', '67', '21');
INSERT INTO `system_role_res` VALUES ('591', '68', '21');
INSERT INTO `system_role_res` VALUES ('592', '8', '21');
INSERT INTO `system_role_res` VALUES ('593', '69', '21');
INSERT INTO `system_role_res` VALUES ('594', '9', '21');
INSERT INTO `system_role_res` VALUES ('595', '20', '21');
INSERT INTO `system_role_res` VALUES ('596', '10', '21');
INSERT INTO `system_role_res` VALUES ('597', '80', '21');
INSERT INTO `system_role_res` VALUES ('598', '81', '21');
INSERT INTO `system_role_res` VALUES ('599', '82', '21');
INSERT INTO `system_role_res` VALUES ('600', '83', '21');
INSERT INTO `system_role_res` VALUES ('601', '84', '21');
INSERT INTO `system_role_res` VALUES ('602', '85', '21');
INSERT INTO `system_role_res` VALUES ('603', '86', '21');
INSERT INTO `system_role_res` VALUES ('604', '87', '21');
INSERT INTO `system_role_res` VALUES ('605', '88', '21');
INSERT INTO `system_role_res` VALUES ('606', '89', '21');
INSERT INTO `system_role_res` VALUES ('607', '90', '21');
INSERT INTO `system_role_res` VALUES ('608', '91', '21');
INSERT INTO `system_role_res` VALUES ('609', '92', '21');
INSERT INTO `system_role_res` VALUES ('610', '93', '21');
INSERT INTO `system_role_res` VALUES ('611', '94', '21');
INSERT INTO `system_role_res` VALUES ('612', '96', '21');
INSERT INTO `system_role_res` VALUES ('613', '97', '21');
INSERT INTO `system_role_res` VALUES ('614', '107', '21');
INSERT INTO `system_role_res` VALUES ('615', '95', '21');
INSERT INTO `system_role_res` VALUES ('616', '98', '21');
INSERT INTO `system_role_res` VALUES ('617', '99', '21');
INSERT INTO `system_role_res` VALUES ('618', '100', '21');
INSERT INTO `system_role_res` VALUES ('619', '102', '21');
INSERT INTO `system_role_res` VALUES ('620', '103', '21');
INSERT INTO `system_role_res` VALUES ('621', '104', '21');
INSERT INTO `system_role_res` VALUES ('622', '105', '21');
INSERT INTO `system_role_res` VALUES ('623', '106', '21');
INSERT INTO `system_role_res` VALUES ('1238', '4', '16');
INSERT INTO `system_role_res` VALUES ('1239', '25', '16');
INSERT INTO `system_role_res` VALUES ('1240', '27', '16');
INSERT INTO `system_role_res` VALUES ('1241', '31', '16');
INSERT INTO `system_role_res` VALUES ('1242', '44', '16');
INSERT INTO `system_role_res` VALUES ('1243', '32', '16');
INSERT INTO `system_role_res` VALUES ('1244', '47', '16');
INSERT INTO `system_role_res` VALUES ('1245', '33', '16');
INSERT INTO `system_role_res` VALUES ('1246', '49', '16');
INSERT INTO `system_role_res` VALUES ('1247', '34', '16');
INSERT INTO `system_role_res` VALUES ('1248', '36', '16');
INSERT INTO `system_role_res` VALUES ('1249', '35', '16');
INSERT INTO `system_role_res` VALUES ('1250', '39', '16');
INSERT INTO `system_role_res` VALUES ('1251', '40', '16');
INSERT INTO `system_role_res` VALUES ('1252', '8', '16');
INSERT INTO `system_role_res` VALUES ('1253', '69', '16');
INSERT INTO `system_role_res` VALUES ('1254', '9', '16');
INSERT INTO `system_role_res` VALUES ('1255', '20', '16');
INSERT INTO `system_role_res` VALUES ('1256', '109', '16');
INSERT INTO `system_role_res` VALUES ('1299', '3', '10');
INSERT INTO `system_role_res` VALUES ('1300', '12', '10');
INSERT INTO `system_role_res` VALUES ('1301', '17', '10');
INSERT INTO `system_role_res` VALUES ('1302', '18', '10');
INSERT INTO `system_role_res` VALUES ('1303', '19', '10');
INSERT INTO `system_role_res` VALUES ('1304', '21', '10');
INSERT INTO `system_role_res` VALUES ('1305', '22', '10');
INSERT INTO `system_role_res` VALUES ('1306', '53', '10');
INSERT INTO `system_role_res` VALUES ('1307', '13', '10');
INSERT INTO `system_role_res` VALUES ('1308', '14', '10');
INSERT INTO `system_role_res` VALUES ('1309', '23', '10');
INSERT INTO `system_role_res` VALUES ('1310', '24', '10');
INSERT INTO `system_role_res` VALUES ('1311', '15', '10');
INSERT INTO `system_role_res` VALUES ('1312', '4', '10');
INSERT INTO `system_role_res` VALUES ('1313', '25', '10');
INSERT INTO `system_role_res` VALUES ('1314', '26', '10');
INSERT INTO `system_role_res` VALUES ('1315', '27', '10');
INSERT INTO `system_role_res` VALUES ('1316', '28', '10');
INSERT INTO `system_role_res` VALUES ('1317', '29', '10');
INSERT INTO `system_role_res` VALUES ('1318', '30', '10');
INSERT INTO `system_role_res` VALUES ('1319', '31', '10');
INSERT INTO `system_role_res` VALUES ('1320', '44', '10');
INSERT INTO `system_role_res` VALUES ('1321', '45', '10');
INSERT INTO `system_role_res` VALUES ('1322', '32', '10');
INSERT INTO `system_role_res` VALUES ('1323', '47', '10');
INSERT INTO `system_role_res` VALUES ('1324', '48', '10');
INSERT INTO `system_role_res` VALUES ('1325', '33', '10');
INSERT INTO `system_role_res` VALUES ('1326', '49', '10');
INSERT INTO `system_role_res` VALUES ('1327', '50', '10');
INSERT INTO `system_role_res` VALUES ('1328', '51', '10');
INSERT INTO `system_role_res` VALUES ('1329', '52', '10');
INSERT INTO `system_role_res` VALUES ('1330', '34', '10');
INSERT INTO `system_role_res` VALUES ('1331', '36', '10');
INSERT INTO `system_role_res` VALUES ('1332', '37', '10');
INSERT INTO `system_role_res` VALUES ('1333', '38', '10');
INSERT INTO `system_role_res` VALUES ('1334', '35', '10');
INSERT INTO `system_role_res` VALUES ('1335', '39', '10');
INSERT INTO `system_role_res` VALUES ('1336', '40', '10');
INSERT INTO `system_role_res` VALUES ('1337', '41', '10');
INSERT INTO `system_role_res` VALUES ('1338', '42', '10');
INSERT INTO `system_role_res` VALUES ('1339', '108', '10');
INSERT INTO `system_role_res` VALUES ('1340', '8', '10');
INSERT INTO `system_role_res` VALUES ('1341', '69', '10');
INSERT INTO `system_role_res` VALUES ('1342', '9', '10');
INSERT INTO `system_role_res` VALUES ('1343', '20', '10');
INSERT INTO `system_role_res` VALUES ('1344', '10', '10');
INSERT INTO `system_role_res` VALUES ('1345', '80', '10');
INSERT INTO `system_role_res` VALUES ('1346', '81', '10');
INSERT INTO `system_role_res` VALUES ('1347', '82', '10');
INSERT INTO `system_role_res` VALUES ('1348', '83', '10');
INSERT INTO `system_role_res` VALUES ('1349', '84', '10');
INSERT INTO `system_role_res` VALUES ('1350', '85', '10');
INSERT INTO `system_role_res` VALUES ('1351', '87', '10');
INSERT INTO `system_role_res` VALUES ('1352', '88', '10');
INSERT INTO `system_role_res` VALUES ('1353', '89', '10');
INSERT INTO `system_role_res` VALUES ('1354', '90', '10');
INSERT INTO `system_role_res` VALUES ('1355', '91', '10');
INSERT INTO `system_role_res` VALUES ('1356', '92', '10');
INSERT INTO `system_role_res` VALUES ('1357', '93', '10');
INSERT INTO `system_role_res` VALUES ('1358', '94', '10');
INSERT INTO `system_role_res` VALUES ('1359', '97', '10');
INSERT INTO `system_role_res` VALUES ('1360', '107', '10');
INSERT INTO `system_role_res` VALUES ('1361', '95', '10');
INSERT INTO `system_role_res` VALUES ('1362', '99', '10');
INSERT INTO `system_role_res` VALUES ('1363', '100', '10');
INSERT INTO `system_role_res` VALUES ('1364', '102', '10');
INSERT INTO `system_role_res` VALUES ('1365', '104', '10');
INSERT INTO `system_role_res` VALUES ('1366', '105', '10');
INSERT INTO `system_role_res` VALUES ('1367', '106', '10');
INSERT INTO `system_role_res` VALUES ('1368', '109', '10');
INSERT INTO `system_role_res` VALUES ('1531', '6', '19');
INSERT INTO `system_role_res` VALUES ('1532', '66', '19');
INSERT INTO `system_role_res` VALUES ('1533', '67', '19');
INSERT INTO `system_role_res` VALUES ('1534', '68', '19');
INSERT INTO `system_role_res` VALUES ('1535', '4', '19');
INSERT INTO `system_role_res` VALUES ('1536', '25', '19');
INSERT INTO `system_role_res` VALUES ('1537', '31', '19');
INSERT INTO `system_role_res` VALUES ('1538', '44', '19');
INSERT INTO `system_role_res` VALUES ('1539', '32', '19');
INSERT INTO `system_role_res` VALUES ('1540', '47', '19');
INSERT INTO `system_role_res` VALUES ('1541', '33', '19');
INSERT INTO `system_role_res` VALUES ('1542', '49', '19');
INSERT INTO `system_role_res` VALUES ('1543', '34', '19');
INSERT INTO `system_role_res` VALUES ('1544', '36', '19');
INSERT INTO `system_role_res` VALUES ('1545', '35', '19');
INSERT INTO `system_role_res` VALUES ('1546', '39', '19');
INSERT INTO `system_role_res` VALUES ('1547', '8', '19');
INSERT INTO `system_role_res` VALUES ('1548', '69', '19');
INSERT INTO `system_role_res` VALUES ('1549', '109', '19');
INSERT INTO `system_role_res` VALUES ('1748', '4', '17');
INSERT INTO `system_role_res` VALUES ('1749', '25', '17');
INSERT INTO `system_role_res` VALUES ('1750', '27', '17');
INSERT INTO `system_role_res` VALUES ('1751', '28', '17');
INSERT INTO `system_role_res` VALUES ('1752', '29', '17');
INSERT INTO `system_role_res` VALUES ('1753', '31', '17');
INSERT INTO `system_role_res` VALUES ('1754', '44', '17');
INSERT INTO `system_role_res` VALUES ('1755', '32', '17');
INSERT INTO `system_role_res` VALUES ('1756', '47', '17');
INSERT INTO `system_role_res` VALUES ('1757', '33', '17');
INSERT INTO `system_role_res` VALUES ('1758', '49', '17');
INSERT INTO `system_role_res` VALUES ('1759', '34', '17');
INSERT INTO `system_role_res` VALUES ('1760', '36', '17');
INSERT INTO `system_role_res` VALUES ('1761', '35', '17');
INSERT INTO `system_role_res` VALUES ('1762', '39', '17');
INSERT INTO `system_role_res` VALUES ('1763', '8', '17');
INSERT INTO `system_role_res` VALUES ('1764', '69', '17');
INSERT INTO `system_role_res` VALUES ('1765', '109', '17');
INSERT INTO `system_role_res` VALUES ('2900', '66', '27');
INSERT INTO `system_role_res` VALUES ('2901', '67', '27');
INSERT INTO `system_role_res` VALUES ('2902', '68', '27');
INSERT INTO `system_role_res` VALUES ('3317', '130', '28');
INSERT INTO `system_role_res` VALUES ('3318', '131', '28');
INSERT INTO `system_role_res` VALUES ('3319', '2', '2');
INSERT INTO `system_role_res` VALUES ('3320', '8', '2');
INSERT INTO `system_role_res` VALUES ('3321', '69', '2');
INSERT INTO `system_role_res` VALUES ('3322', '10', '18');
INSERT INTO `system_role_res` VALUES ('3323', '80', '18');
INSERT INTO `system_role_res` VALUES ('3324', '83', '18');
INSERT INTO `system_role_res` VALUES ('3325', '84', '18');
INSERT INTO `system_role_res` VALUES ('3326', '82', '18');
INSERT INTO `system_role_res` VALUES ('3327', '85', '18');
INSERT INTO `system_role_res` VALUES ('3328', '88', '18');
INSERT INTO `system_role_res` VALUES ('3329', '87', '18');
INSERT INTO `system_role_res` VALUES ('3330', '89', '18');
INSERT INTO `system_role_res` VALUES ('3331', '92', '18');
INSERT INTO `system_role_res` VALUES ('3332', '91', '18');
INSERT INTO `system_role_res` VALUES ('3333', '33', '18');
INSERT INTO `system_role_res` VALUES ('3334', '49', '18');
INSERT INTO `system_role_res` VALUES ('3335', '34', '18');
INSERT INTO `system_role_res` VALUES ('3336', '36', '18');
INSERT INTO `system_role_res` VALUES ('3701', '10', '23');
INSERT INTO `system_role_res` VALUES ('3702', '80', '23');
INSERT INTO `system_role_res` VALUES ('3703', '83', '23');
INSERT INTO `system_role_res` VALUES ('3704', '84', '23');
INSERT INTO `system_role_res` VALUES ('3705', '82', '23');
INSERT INTO `system_role_res` VALUES ('3706', '85', '23');
INSERT INTO `system_role_res` VALUES ('3707', '88', '23');
INSERT INTO `system_role_res` VALUES ('3708', '87', '23');
INSERT INTO `system_role_res` VALUES ('3709', '89', '23');
INSERT INTO `system_role_res` VALUES ('3710', '92', '23');
INSERT INTO `system_role_res` VALUES ('3711', '91', '23');
INSERT INTO `system_role_res` VALUES ('3712', '4', '23');
INSERT INTO `system_role_res` VALUES ('3713', '25', '23');
INSERT INTO `system_role_res` VALUES ('3714', '29', '23');
INSERT INTO `system_role_res` VALUES ('3715', '28', '23');
INSERT INTO `system_role_res` VALUES ('3716', '31', '23');
INSERT INTO `system_role_res` VALUES ('3717', '44', '23');
INSERT INTO `system_role_res` VALUES ('3718', '32', '23');
INSERT INTO `system_role_res` VALUES ('3719', '47', '23');
INSERT INTO `system_role_res` VALUES ('3720', '35', '23');
INSERT INTO `system_role_res` VALUES ('3721', '39', '23');
INSERT INTO `system_role_res` VALUES ('3722', '42', '23');
INSERT INTO `system_role_res` VALUES ('3723', '108', '23');
INSERT INTO `system_role_res` VALUES ('3724', '8', '23');
INSERT INTO `system_role_res` VALUES ('3725', '69', '23');
INSERT INTO `system_role_res` VALUES ('3726', '109', '23');
INSERT INTO `system_role_res` VALUES ('3727', '33', '23');
INSERT INTO `system_role_res` VALUES ('3728', '49', '23');
INSERT INTO `system_role_res` VALUES ('3729', '34', '23');
INSERT INTO `system_role_res` VALUES ('3730', '36', '23');
INSERT INTO `system_role_res` VALUES ('3731', '138', '23');
INSERT INTO `system_role_res` VALUES ('4002', '132', '26');
INSERT INTO `system_role_res` VALUES ('4003', '134', '26');
INSERT INTO `system_role_res` VALUES ('4004', '135', '26');
INSERT INTO `system_role_res` VALUES ('4005', '136', '26');
INSERT INTO `system_role_res` VALUES ('4006', '139', '26');
INSERT INTO `system_role_res` VALUES ('4465', '6', '30');
INSERT INTO `system_role_res` VALUES ('4466', '66', '30');
INSERT INTO `system_role_res` VALUES ('4467', '134', '30');
INSERT INTO `system_role_res` VALUES ('4468', '142', '30');
INSERT INTO `system_role_res` VALUES ('4469', '67', '30');
INSERT INTO `system_role_res` VALUES ('4470', '135', '30');
INSERT INTO `system_role_res` VALUES ('4471', '68', '30');
INSERT INTO `system_role_res` VALUES ('4472', '136', '30');
INSERT INTO `system_role_res` VALUES ('4473', '132', '30');
INSERT INTO `system_role_res` VALUES ('4474', '133', '30');
INSERT INTO `system_role_res` VALUES ('4475', '139', '30');
INSERT INTO `system_role_res` VALUES ('4476', '140', '30');
INSERT INTO `system_role_res` VALUES ('4477', '141', '30');
INSERT INTO `system_role_res` VALUES ('4478', '2', '1');
INSERT INTO `system_role_res` VALUES ('4479', '130', '1');
INSERT INTO `system_role_res` VALUES ('4480', '131', '1');
INSERT INTO `system_role_res` VALUES ('4481', '3', '1');
INSERT INTO `system_role_res` VALUES ('4482', '12', '1');
INSERT INTO `system_role_res` VALUES ('4483', '16', '1');
INSERT INTO `system_role_res` VALUES ('4484', '17', '1');
INSERT INTO `system_role_res` VALUES ('4485', '18', '1');
INSERT INTO `system_role_res` VALUES ('4486', '19', '1');
INSERT INTO `system_role_res` VALUES ('4487', '21', '1');
INSERT INTO `system_role_res` VALUES ('4488', '22', '1');
INSERT INTO `system_role_res` VALUES ('4489', '53', '1');
INSERT INTO `system_role_res` VALUES ('4490', '13', '1');
INSERT INTO `system_role_res` VALUES ('4491', '14', '1');
INSERT INTO `system_role_res` VALUES ('4492', '23', '1');
INSERT INTO `system_role_res` VALUES ('4493', '24', '1');
INSERT INTO `system_role_res` VALUES ('4494', '15', '1');
INSERT INTO `system_role_res` VALUES ('4495', '127', '1');
INSERT INTO `system_role_res` VALUES ('4496', '128', '1');
INSERT INTO `system_role_res` VALUES ('4497', '121', '1');
INSERT INTO `system_role_res` VALUES ('4498', '122', '1');
INSERT INTO `system_role_res` VALUES ('4499', '123', '1');
INSERT INTO `system_role_res` VALUES ('4500', '124', '1');
INSERT INTO `system_role_res` VALUES ('4501', '125', '1');
INSERT INTO `system_role_res` VALUES ('4502', '126', '1');
INSERT INTO `system_role_res` VALUES ('4503', '4', '1');
INSERT INTO `system_role_res` VALUES ('4504', '25', '1');
INSERT INTO `system_role_res` VALUES ('4505', '26', '1');
INSERT INTO `system_role_res` VALUES ('4506', '27', '1');
INSERT INTO `system_role_res` VALUES ('4507', '28', '1');
INSERT INTO `system_role_res` VALUES ('4508', '29', '1');
INSERT INTO `system_role_res` VALUES ('4509', '30', '1');
INSERT INTO `system_role_res` VALUES ('4510', '31', '1');
INSERT INTO `system_role_res` VALUES ('4511', '43', '1');
INSERT INTO `system_role_res` VALUES ('4512', '44', '1');
INSERT INTO `system_role_res` VALUES ('4513', '45', '1');
INSERT INTO `system_role_res` VALUES ('4514', '32', '1');
INSERT INTO `system_role_res` VALUES ('4515', '46', '1');
INSERT INTO `system_role_res` VALUES ('4516', '47', '1');
INSERT INTO `system_role_res` VALUES ('4517', '48', '1');
INSERT INTO `system_role_res` VALUES ('4518', '35', '1');
INSERT INTO `system_role_res` VALUES ('4519', '39', '1');
INSERT INTO `system_role_res` VALUES ('4520', '40', '1');
INSERT INTO `system_role_res` VALUES ('4521', '41', '1');
INSERT INTO `system_role_res` VALUES ('4522', '42', '1');
INSERT INTO `system_role_res` VALUES ('4523', '108', '1');
INSERT INTO `system_role_res` VALUES ('4524', '143', '1');
INSERT INTO `system_role_res` VALUES ('4525', '145', '1');
INSERT INTO `system_role_res` VALUES ('4526', '147', '1');
INSERT INTO `system_role_res` VALUES ('4527', '146', '1');
INSERT INTO `system_role_res` VALUES ('4528', '144', '1');
INSERT INTO `system_role_res` VALUES ('4529', '148', '1');
INSERT INTO `system_role_res` VALUES ('4530', '149', '1');
INSERT INTO `system_role_res` VALUES ('4531', '6', '1');
INSERT INTO `system_role_res` VALUES ('4532', '66', '1');
INSERT INTO `system_role_res` VALUES ('4533', '134', '1');
INSERT INTO `system_role_res` VALUES ('4534', '142', '1');
INSERT INTO `system_role_res` VALUES ('4535', '67', '1');
INSERT INTO `system_role_res` VALUES ('4536', '135', '1');
INSERT INTO `system_role_res` VALUES ('4537', '68', '1');
INSERT INTO `system_role_res` VALUES ('4538', '136', '1');
INSERT INTO `system_role_res` VALUES ('4539', '132', '1');
INSERT INTO `system_role_res` VALUES ('4540', '133', '1');
INSERT INTO `system_role_res` VALUES ('4541', '139', '1');
INSERT INTO `system_role_res` VALUES ('4542', '140', '1');
INSERT INTO `system_role_res` VALUES ('4543', '141', '1');
INSERT INTO `system_role_res` VALUES ('4544', '8', '1');
INSERT INTO `system_role_res` VALUES ('4545', '69', '1');
INSERT INTO `system_role_res` VALUES ('4546', '9', '1');
INSERT INTO `system_role_res` VALUES ('4547', '20', '1');
INSERT INTO `system_role_res` VALUES ('4548', '10', '1');
INSERT INTO `system_role_res` VALUES ('4549', '80', '1');
INSERT INTO `system_role_res` VALUES ('4550', '81', '1');
INSERT INTO `system_role_res` VALUES ('4551', '82', '1');
INSERT INTO `system_role_res` VALUES ('4552', '83', '1');
INSERT INTO `system_role_res` VALUES ('4553', '84', '1');
INSERT INTO `system_role_res` VALUES ('4554', '85', '1');
INSERT INTO `system_role_res` VALUES ('4555', '86', '1');
INSERT INTO `system_role_res` VALUES ('4556', '87', '1');
INSERT INTO `system_role_res` VALUES ('4557', '88', '1');
INSERT INTO `system_role_res` VALUES ('4558', '89', '1');
INSERT INTO `system_role_res` VALUES ('4559', '90', '1');
INSERT INTO `system_role_res` VALUES ('4560', '91', '1');
INSERT INTO `system_role_res` VALUES ('4561', '92', '1');
INSERT INTO `system_role_res` VALUES ('4562', '93', '1');
INSERT INTO `system_role_res` VALUES ('4563', '94', '1');
INSERT INTO `system_role_res` VALUES ('4564', '96', '1');
INSERT INTO `system_role_res` VALUES ('4565', '97', '1');
INSERT INTO `system_role_res` VALUES ('4566', '107', '1');
INSERT INTO `system_role_res` VALUES ('4567', '95', '1');
INSERT INTO `system_role_res` VALUES ('4568', '98', '1');
INSERT INTO `system_role_res` VALUES ('4569', '99', '1');
INSERT INTO `system_role_res` VALUES ('4570', '100', '1');
INSERT INTO `system_role_res` VALUES ('4571', '102', '1');
INSERT INTO `system_role_res` VALUES ('4572', '103', '1');
INSERT INTO `system_role_res` VALUES ('4573', '104', '1');
INSERT INTO `system_role_res` VALUES ('4574', '105', '1');
INSERT INTO `system_role_res` VALUES ('4575', '106', '1');
INSERT INTO `system_role_res` VALUES ('4576', '109', '1');
INSERT INTO `system_role_res` VALUES ('4577', '129', '1');
INSERT INTO `system_role_res` VALUES ('4578', '110', '1');
INSERT INTO `system_role_res` VALUES ('4579', '114', '1');
INSERT INTO `system_role_res` VALUES ('4580', '115', '1');
INSERT INTO `system_role_res` VALUES ('4581', '116', '1');
INSERT INTO `system_role_res` VALUES ('4582', '117', '1');
INSERT INTO `system_role_res` VALUES ('4583', '118', '1');
INSERT INTO `system_role_res` VALUES ('4584', '119', '1');
INSERT INTO `system_role_res` VALUES ('4585', '120', '1');
INSERT INTO `system_role_res` VALUES ('4586', '138', '1');
INSERT INTO `system_role_res` VALUES ('4587', '33', '1');
INSERT INTO `system_role_res` VALUES ('4588', '49', '1');
INSERT INTO `system_role_res` VALUES ('4589', '50', '1');
INSERT INTO `system_role_res` VALUES ('4590', '51', '1');
INSERT INTO `system_role_res` VALUES ('4591', '52', '1');
INSERT INTO `system_role_res` VALUES ('4592', '137', '1');
INSERT INTO `system_role_res` VALUES ('4593', '34', '1');
INSERT INTO `system_role_res` VALUES ('4594', '36', '1');
INSERT INTO `system_role_res` VALUES ('4595', '37', '1');
INSERT INTO `system_role_res` VALUES ('4596', '38', '1');
INSERT INTO `system_role_res` VALUES ('4597', '111', '1');
INSERT INTO `system_role_res` VALUES ('4598', '112', '1');
INSERT INTO `system_role_res` VALUES ('4599', '113', '1');
INSERT INTO `system_role_res` VALUES ('4600', '2', '3');
INSERT INTO `system_role_res` VALUES ('4601', '3', '3');
INSERT INTO `system_role_res` VALUES ('4602', '12', '3');
INSERT INTO `system_role_res` VALUES ('4603', '16', '3');
INSERT INTO `system_role_res` VALUES ('4604', '17', '3');
INSERT INTO `system_role_res` VALUES ('4605', '18', '3');
INSERT INTO `system_role_res` VALUES ('4606', '19', '3');
INSERT INTO `system_role_res` VALUES ('4607', '21', '3');
INSERT INTO `system_role_res` VALUES ('4608', '22', '3');
INSERT INTO `system_role_res` VALUES ('4609', '53', '3');
INSERT INTO `system_role_res` VALUES ('4610', '13', '3');
INSERT INTO `system_role_res` VALUES ('4611', '14', '3');
INSERT INTO `system_role_res` VALUES ('4612', '23', '3');
INSERT INTO `system_role_res` VALUES ('4613', '24', '3');
INSERT INTO `system_role_res` VALUES ('4614', '15', '3');
INSERT INTO `system_role_res` VALUES ('4615', '4', '3');
INSERT INTO `system_role_res` VALUES ('4616', '25', '3');
INSERT INTO `system_role_res` VALUES ('4617', '26', '3');
INSERT INTO `system_role_res` VALUES ('4618', '27', '3');
INSERT INTO `system_role_res` VALUES ('4619', '28', '3');
INSERT INTO `system_role_res` VALUES ('4620', '29', '3');
INSERT INTO `system_role_res` VALUES ('4621', '30', '3');
INSERT INTO `system_role_res` VALUES ('4622', '31', '3');
INSERT INTO `system_role_res` VALUES ('4623', '43', '3');
INSERT INTO `system_role_res` VALUES ('4624', '44', '3');
INSERT INTO `system_role_res` VALUES ('4625', '45', '3');
INSERT INTO `system_role_res` VALUES ('4626', '32', '3');
INSERT INTO `system_role_res` VALUES ('4627', '46', '3');
INSERT INTO `system_role_res` VALUES ('4628', '47', '3');
INSERT INTO `system_role_res` VALUES ('4629', '48', '3');
INSERT INTO `system_role_res` VALUES ('4630', '35', '3');
INSERT INTO `system_role_res` VALUES ('4631', '39', '3');
INSERT INTO `system_role_res` VALUES ('4632', '40', '3');
INSERT INTO `system_role_res` VALUES ('4633', '41', '3');
INSERT INTO `system_role_res` VALUES ('4634', '42', '3');
INSERT INTO `system_role_res` VALUES ('4635', '108', '3');
INSERT INTO `system_role_res` VALUES ('4636', '143', '3');
INSERT INTO `system_role_res` VALUES ('4637', '145', '3');
INSERT INTO `system_role_res` VALUES ('4638', '147', '3');
INSERT INTO `system_role_res` VALUES ('4639', '146', '3');
INSERT INTO `system_role_res` VALUES ('4640', '144', '3');
INSERT INTO `system_role_res` VALUES ('4641', '148', '3');
INSERT INTO `system_role_res` VALUES ('4642', '149', '3');
INSERT INTO `system_role_res` VALUES ('4643', '6', '3');
INSERT INTO `system_role_res` VALUES ('4644', '66', '3');
INSERT INTO `system_role_res` VALUES ('4645', '67', '3');
INSERT INTO `system_role_res` VALUES ('4646', '68', '3');
INSERT INTO `system_role_res` VALUES ('4647', '8', '3');
INSERT INTO `system_role_res` VALUES ('4648', '69', '3');
INSERT INTO `system_role_res` VALUES ('4649', '9', '3');
INSERT INTO `system_role_res` VALUES ('4650', '20', '3');
INSERT INTO `system_role_res` VALUES ('4651', '10', '3');
INSERT INTO `system_role_res` VALUES ('4652', '80', '3');
INSERT INTO `system_role_res` VALUES ('4653', '81', '3');
INSERT INTO `system_role_res` VALUES ('4654', '82', '3');
INSERT INTO `system_role_res` VALUES ('4655', '83', '3');
INSERT INTO `system_role_res` VALUES ('4656', '84', '3');
INSERT INTO `system_role_res` VALUES ('4657', '85', '3');
INSERT INTO `system_role_res` VALUES ('4658', '86', '3');
INSERT INTO `system_role_res` VALUES ('4659', '87', '3');
INSERT INTO `system_role_res` VALUES ('4660', '88', '3');
INSERT INTO `system_role_res` VALUES ('4661', '89', '3');
INSERT INTO `system_role_res` VALUES ('4662', '90', '3');
INSERT INTO `system_role_res` VALUES ('4663', '91', '3');
INSERT INTO `system_role_res` VALUES ('4664', '92', '3');
INSERT INTO `system_role_res` VALUES ('4665', '93', '3');
INSERT INTO `system_role_res` VALUES ('4666', '94', '3');
INSERT INTO `system_role_res` VALUES ('4667', '96', '3');
INSERT INTO `system_role_res` VALUES ('4668', '97', '3');
INSERT INTO `system_role_res` VALUES ('4669', '107', '3');
INSERT INTO `system_role_res` VALUES ('4670', '95', '3');
INSERT INTO `system_role_res` VALUES ('4671', '98', '3');
INSERT INTO `system_role_res` VALUES ('4672', '99', '3');
INSERT INTO `system_role_res` VALUES ('4673', '100', '3');
INSERT INTO `system_role_res` VALUES ('4674', '102', '3');
INSERT INTO `system_role_res` VALUES ('4675', '103', '3');
INSERT INTO `system_role_res` VALUES ('4676', '104', '3');
INSERT INTO `system_role_res` VALUES ('4677', '105', '3');
INSERT INTO `system_role_res` VALUES ('4678', '106', '3');
INSERT INTO `system_role_res` VALUES ('4679', '109', '3');
INSERT INTO `system_role_res` VALUES ('4680', '129', '3');
INSERT INTO `system_role_res` VALUES ('4681', '110', '3');
INSERT INTO `system_role_res` VALUES ('4682', '33', '3');
INSERT INTO `system_role_res` VALUES ('4683', '49', '3');
INSERT INTO `system_role_res` VALUES ('4684', '50', '3');
INSERT INTO `system_role_res` VALUES ('4685', '51', '3');
INSERT INTO `system_role_res` VALUES ('4686', '52', '3');
INSERT INTO `system_role_res` VALUES ('4687', '34', '3');
INSERT INTO `system_role_res` VALUES ('4688', '36', '3');
INSERT INTO `system_role_res` VALUES ('4689', '37', '3');
INSERT INTO `system_role_res` VALUES ('4690', '38', '3');
INSERT INTO `system_role_res` VALUES ('4691', '111', '3');
INSERT INTO `system_role_res` VALUES ('4692', '113', '3');
INSERT INTO `system_role_res` VALUES ('4693', '114', '3');
INSERT INTO `system_role_res` VALUES ('4694', '115', '3');
INSERT INTO `system_role_res` VALUES ('4695', '116', '3');
INSERT INTO `system_role_res` VALUES ('4696', '117', '3');
INSERT INTO `system_role_res` VALUES ('4697', '118', '3');
INSERT INTO `system_role_res` VALUES ('4698', '119', '3');
INSERT INTO `system_role_res` VALUES ('4699', '120', '3');
INSERT INTO `system_role_res` VALUES ('4700', '121', '3');
INSERT INTO `system_role_res` VALUES ('4701', '122', '3');
INSERT INTO `system_role_res` VALUES ('4702', '123', '3');
INSERT INTO `system_role_res` VALUES ('4703', '124', '3');
INSERT INTO `system_role_res` VALUES ('4704', '125', '3');
INSERT INTO `system_role_res` VALUES ('4705', '126', '3');
INSERT INTO `system_role_res` VALUES ('4706', '3', '4');
INSERT INTO `system_role_res` VALUES ('4707', '12', '4');
INSERT INTO `system_role_res` VALUES ('4708', '16', '4');
INSERT INTO `system_role_res` VALUES ('4709', '17', '4');
INSERT INTO `system_role_res` VALUES ('4710', '18', '4');
INSERT INTO `system_role_res` VALUES ('4711', '13', '4');
INSERT INTO `system_role_res` VALUES ('4712', '14', '4');
INSERT INTO `system_role_res` VALUES ('4713', '23', '4');
INSERT INTO `system_role_res` VALUES ('4714', '24', '4');
INSERT INTO `system_role_res` VALUES ('4715', '15', '4');
INSERT INTO `system_role_res` VALUES ('4716', '4', '4');
INSERT INTO `system_role_res` VALUES ('4717', '25', '4');
INSERT INTO `system_role_res` VALUES ('4718', '26', '4');
INSERT INTO `system_role_res` VALUES ('4719', '27', '4');
INSERT INTO `system_role_res` VALUES ('4720', '32', '4');
INSERT INTO `system_role_res` VALUES ('4721', '46', '4');
INSERT INTO `system_role_res` VALUES ('4722', '47', '4');
INSERT INTO `system_role_res` VALUES ('4723', '48', '4');
INSERT INTO `system_role_res` VALUES ('4724', '35', '4');
INSERT INTO `system_role_res` VALUES ('4725', '39', '4');
INSERT INTO `system_role_res` VALUES ('4726', '40', '4');
INSERT INTO `system_role_res` VALUES ('4727', '41', '4');
INSERT INTO `system_role_res` VALUES ('4728', '42', '4');
INSERT INTO `system_role_res` VALUES ('4729', '108', '4');
INSERT INTO `system_role_res` VALUES ('4730', '31', '4');
INSERT INTO `system_role_res` VALUES ('4731', '43', '4');
INSERT INTO `system_role_res` VALUES ('4732', '44', '4');
INSERT INTO `system_role_res` VALUES ('4733', '143', '4');
INSERT INTO `system_role_res` VALUES ('4734', '145', '4');
INSERT INTO `system_role_res` VALUES ('4735', '147', '4');
INSERT INTO `system_role_res` VALUES ('4736', '144', '4');
INSERT INTO `system_role_res` VALUES ('4737', '148', '4');
INSERT INTO `system_role_res` VALUES ('4738', '149', '4');
INSERT INTO `system_role_res` VALUES ('4739', '6', '4');
INSERT INTO `system_role_res` VALUES ('4740', '66', '4');
INSERT INTO `system_role_res` VALUES ('4741', '67', '4');
INSERT INTO `system_role_res` VALUES ('4742', '68', '4');
INSERT INTO `system_role_res` VALUES ('4743', '8', '4');
INSERT INTO `system_role_res` VALUES ('4744', '69', '4');
INSERT INTO `system_role_res` VALUES ('4745', '10', '4');
INSERT INTO `system_role_res` VALUES ('4746', '80', '4');
INSERT INTO `system_role_res` VALUES ('4747', '81', '4');
INSERT INTO `system_role_res` VALUES ('4748', '82', '4');
INSERT INTO `system_role_res` VALUES ('4749', '85', '4');
INSERT INTO `system_role_res` VALUES ('4750', '86', '4');
INSERT INTO `system_role_res` VALUES ('4751', '87', '4');
INSERT INTO `system_role_res` VALUES ('4752', '88', '4');
INSERT INTO `system_role_res` VALUES ('4753', '89', '4');
INSERT INTO `system_role_res` VALUES ('4754', '90', '4');
INSERT INTO `system_role_res` VALUES ('4755', '91', '4');
INSERT INTO `system_role_res` VALUES ('4756', '92', '4');
INSERT INTO `system_role_res` VALUES ('4757', '93', '4');
INSERT INTO `system_role_res` VALUES ('4758', '94', '4');
INSERT INTO `system_role_res` VALUES ('4759', '96', '4');
INSERT INTO `system_role_res` VALUES ('4760', '97', '4');
INSERT INTO `system_role_res` VALUES ('4761', '95', '4');
INSERT INTO `system_role_res` VALUES ('4762', '98', '4');
INSERT INTO `system_role_res` VALUES ('4763', '99', '4');
INSERT INTO `system_role_res` VALUES ('4764', '102', '4');
INSERT INTO `system_role_res` VALUES ('4765', '103', '4');
INSERT INTO `system_role_res` VALUES ('4766', '104', '4');
INSERT INTO `system_role_res` VALUES ('4767', '110', '4');
INSERT INTO `system_role_res` VALUES ('4768', '33', '4');
INSERT INTO `system_role_res` VALUES ('4769', '49', '4');
INSERT INTO `system_role_res` VALUES ('4770', '50', '4');
INSERT INTO `system_role_res` VALUES ('4771', '51', '4');
INSERT INTO `system_role_res` VALUES ('4772', '52', '4');
INSERT INTO `system_role_res` VALUES ('4773', '34', '4');
INSERT INTO `system_role_res` VALUES ('4774', '36', '4');
INSERT INTO `system_role_res` VALUES ('4775', '37', '4');
INSERT INTO `system_role_res` VALUES ('4776', '38', '4');
INSERT INTO `system_role_res` VALUES ('4777', '111', '4');
INSERT INTO `system_role_res` VALUES ('4778', '113', '4');
INSERT INTO `system_role_res` VALUES ('4779', '114', '4');
INSERT INTO `system_role_res` VALUES ('4780', '116', '4');
INSERT INTO `system_role_res` VALUES ('4781', '118', '4');
INSERT INTO `system_role_res` VALUES ('4782', '119', '4');
INSERT INTO `system_role_res` VALUES ('4783', '120', '4');
INSERT INTO `system_role_res` VALUES ('4784', '138', '4');
INSERT INTO `system_role_res` VALUES ('4785', '121', '4');
INSERT INTO `system_role_res` VALUES ('4786', '122', '4');
INSERT INTO `system_role_res` VALUES ('4787', '126', '4');
INSERT INTO `system_role_res` VALUES ('4788', '109', '4');
INSERT INTO `system_role_res` VALUES ('4789', '129', '4');
INSERT INTO `system_role_res` VALUES ('4862', '3', '6');
INSERT INTO `system_role_res` VALUES ('4863', '12', '6');
INSERT INTO `system_role_res` VALUES ('4864', '16', '6');
INSERT INTO `system_role_res` VALUES ('4865', '17', '6');
INSERT INTO `system_role_res` VALUES ('4866', '18', '6');
INSERT INTO `system_role_res` VALUES ('4867', '19', '6');
INSERT INTO `system_role_res` VALUES ('4868', '21', '6');
INSERT INTO `system_role_res` VALUES ('4869', '22', '6');
INSERT INTO `system_role_res` VALUES ('4870', '53', '6');
INSERT INTO `system_role_res` VALUES ('4871', '13', '6');
INSERT INTO `system_role_res` VALUES ('4872', '14', '6');
INSERT INTO `system_role_res` VALUES ('4873', '23', '6');
INSERT INTO `system_role_res` VALUES ('4874', '24', '6');
INSERT INTO `system_role_res` VALUES ('4875', '15', '6');
INSERT INTO `system_role_res` VALUES ('4876', '4', '6');
INSERT INTO `system_role_res` VALUES ('4877', '25', '6');
INSERT INTO `system_role_res` VALUES ('4878', '26', '6');
INSERT INTO `system_role_res` VALUES ('4879', '27', '6');
INSERT INTO `system_role_res` VALUES ('4880', '28', '6');
INSERT INTO `system_role_res` VALUES ('4881', '29', '6');
INSERT INTO `system_role_res` VALUES ('4882', '30', '6');
INSERT INTO `system_role_res` VALUES ('4883', '31', '6');
INSERT INTO `system_role_res` VALUES ('4884', '43', '6');
INSERT INTO `system_role_res` VALUES ('4885', '44', '6');
INSERT INTO `system_role_res` VALUES ('4886', '45', '6');
INSERT INTO `system_role_res` VALUES ('4887', '32', '6');
INSERT INTO `system_role_res` VALUES ('4888', '46', '6');
INSERT INTO `system_role_res` VALUES ('4889', '47', '6');
INSERT INTO `system_role_res` VALUES ('4890', '48', '6');
INSERT INTO `system_role_res` VALUES ('4891', '35', '6');
INSERT INTO `system_role_res` VALUES ('4892', '39', '6');
INSERT INTO `system_role_res` VALUES ('4893', '40', '6');
INSERT INTO `system_role_res` VALUES ('4894', '41', '6');
INSERT INTO `system_role_res` VALUES ('4895', '42', '6');
INSERT INTO `system_role_res` VALUES ('4896', '108', '6');
INSERT INTO `system_role_res` VALUES ('4897', '143', '6');
INSERT INTO `system_role_res` VALUES ('4898', '145', '6');
INSERT INTO `system_role_res` VALUES ('4899', '147', '6');
INSERT INTO `system_role_res` VALUES ('4900', '144', '6');
INSERT INTO `system_role_res` VALUES ('4901', '148', '6');
INSERT INTO `system_role_res` VALUES ('4902', '6', '6');
INSERT INTO `system_role_res` VALUES ('4903', '66', '6');
INSERT INTO `system_role_res` VALUES ('4904', '67', '6');
INSERT INTO `system_role_res` VALUES ('4905', '68', '6');
INSERT INTO `system_role_res` VALUES ('4906', '8', '6');
INSERT INTO `system_role_res` VALUES ('4907', '69', '6');
INSERT INTO `system_role_res` VALUES ('4908', '9', '6');
INSERT INTO `system_role_res` VALUES ('4909', '20', '6');
INSERT INTO `system_role_res` VALUES ('4910', '10', '6');
INSERT INTO `system_role_res` VALUES ('4911', '80', '6');
INSERT INTO `system_role_res` VALUES ('4912', '81', '6');
INSERT INTO `system_role_res` VALUES ('4913', '82', '6');
INSERT INTO `system_role_res` VALUES ('4914', '83', '6');
INSERT INTO `system_role_res` VALUES ('4915', '84', '6');
INSERT INTO `system_role_res` VALUES ('4916', '85', '6');
INSERT INTO `system_role_res` VALUES ('4917', '86', '6');
INSERT INTO `system_role_res` VALUES ('4918', '87', '6');
INSERT INTO `system_role_res` VALUES ('4919', '88', '6');
INSERT INTO `system_role_res` VALUES ('4920', '89', '6');
INSERT INTO `system_role_res` VALUES ('4921', '90', '6');
INSERT INTO `system_role_res` VALUES ('4922', '91', '6');
INSERT INTO `system_role_res` VALUES ('4923', '92', '6');
INSERT INTO `system_role_res` VALUES ('4924', '93', '6');
INSERT INTO `system_role_res` VALUES ('4925', '94', '6');
INSERT INTO `system_role_res` VALUES ('4926', '96', '6');
INSERT INTO `system_role_res` VALUES ('4927', '97', '6');
INSERT INTO `system_role_res` VALUES ('4928', '107', '6');
INSERT INTO `system_role_res` VALUES ('4929', '95', '6');
INSERT INTO `system_role_res` VALUES ('4930', '98', '6');
INSERT INTO `system_role_res` VALUES ('4931', '99', '6');
INSERT INTO `system_role_res` VALUES ('4932', '100', '6');
INSERT INTO `system_role_res` VALUES ('4933', '102', '6');
INSERT INTO `system_role_res` VALUES ('4934', '103', '6');
INSERT INTO `system_role_res` VALUES ('4935', '104', '6');
INSERT INTO `system_role_res` VALUES ('4936', '105', '6');
INSERT INTO `system_role_res` VALUES ('4937', '106', '6');
INSERT INTO `system_role_res` VALUES ('4938', '109', '6');
INSERT INTO `system_role_res` VALUES ('4939', '110', '6');
INSERT INTO `system_role_res` VALUES ('4940', '33', '6');
INSERT INTO `system_role_res` VALUES ('4941', '49', '6');
INSERT INTO `system_role_res` VALUES ('4942', '50', '6');
INSERT INTO `system_role_res` VALUES ('4943', '51', '6');
INSERT INTO `system_role_res` VALUES ('4944', '52', '6');
INSERT INTO `system_role_res` VALUES ('4945', '34', '6');
INSERT INTO `system_role_res` VALUES ('4946', '36', '6');
INSERT INTO `system_role_res` VALUES ('4947', '37', '6');
INSERT INTO `system_role_res` VALUES ('4948', '38', '6');
INSERT INTO `system_role_res` VALUES ('4949', '114', '6');
INSERT INTO `system_role_res` VALUES ('4950', '115', '6');
INSERT INTO `system_role_res` VALUES ('4951', '118', '6');
INSERT INTO `system_role_res` VALUES ('4952', '119', '6');
INSERT INTO `system_role_res` VALUES ('4953', '120', '6');
INSERT INTO `system_role_res` VALUES ('4954', '121', '6');
INSERT INTO `system_role_res` VALUES ('4955', '122', '6');
INSERT INTO `system_role_res` VALUES ('4956', '123', '6');
INSERT INTO `system_role_res` VALUES ('4957', '124', '6');
INSERT INTO `system_role_res` VALUES ('4958', '125', '6');
INSERT INTO `system_role_res` VALUES ('4959', '126', '6');
INSERT INTO `system_role_res` VALUES ('4960', '3', '7');
INSERT INTO `system_role_res` VALUES ('4961', '12', '7');
INSERT INTO `system_role_res` VALUES ('4962', '16', '7');
INSERT INTO `system_role_res` VALUES ('4963', '17', '7');
INSERT INTO `system_role_res` VALUES ('4964', '18', '7');
INSERT INTO `system_role_res` VALUES ('4965', '14', '7');
INSERT INTO `system_role_res` VALUES ('4966', '23', '7');
INSERT INTO `system_role_res` VALUES ('4967', '9', '7');
INSERT INTO `system_role_res` VALUES ('4968', '20', '7');
INSERT INTO `system_role_res` VALUES ('4969', '109', '7');
INSERT INTO `system_role_res` VALUES ('4970', '4', '7');
INSERT INTO `system_role_res` VALUES ('4971', '25', '7');
INSERT INTO `system_role_res` VALUES ('4972', '26', '7');
INSERT INTO `system_role_res` VALUES ('4973', '27', '7');
INSERT INTO `system_role_res` VALUES ('4974', '31', '7');
INSERT INTO `system_role_res` VALUES ('4975', '43', '7');
INSERT INTO `system_role_res` VALUES ('4976', '44', '7');
INSERT INTO `system_role_res` VALUES ('4977', '45', '7');
INSERT INTO `system_role_res` VALUES ('4978', '32', '7');
INSERT INTO `system_role_res` VALUES ('4979', '46', '7');
INSERT INTO `system_role_res` VALUES ('4980', '47', '7');
INSERT INTO `system_role_res` VALUES ('4981', '35', '7');
INSERT INTO `system_role_res` VALUES ('4982', '39', '7');
INSERT INTO `system_role_res` VALUES ('4983', '42', '7');
INSERT INTO `system_role_res` VALUES ('4984', '143', '7');
INSERT INTO `system_role_res` VALUES ('4985', '145', '7');
INSERT INTO `system_role_res` VALUES ('4986', '147', '7');
INSERT INTO `system_role_res` VALUES ('4987', '144', '7');
INSERT INTO `system_role_res` VALUES ('4988', '148', '7');
INSERT INTO `system_role_res` VALUES ('4989', '149', '7');
INSERT INTO `system_role_res` VALUES ('4990', '8', '7');
INSERT INTO `system_role_res` VALUES ('4991', '69', '7');
INSERT INTO `system_role_res` VALUES ('4992', '33', '7');
INSERT INTO `system_role_res` VALUES ('4993', '49', '7');
INSERT INTO `system_role_res` VALUES ('4994', '34', '7');
INSERT INTO `system_role_res` VALUES ('4995', '36', '7');
INSERT INTO `system_role_res` VALUES ('5053', '3', '12');
INSERT INTO `system_role_res` VALUES ('5054', '12', '12');
INSERT INTO `system_role_res` VALUES ('5055', '19', '12');
INSERT INTO `system_role_res` VALUES ('5056', '21', '12');
INSERT INTO `system_role_res` VALUES ('5057', '22', '12');
INSERT INTO `system_role_res` VALUES ('5058', '53', '12');
INSERT INTO `system_role_res` VALUES ('5059', '18', '12');
INSERT INTO `system_role_res` VALUES ('5060', '13', '12');
INSERT INTO `system_role_res` VALUES ('5061', '14', '12');
INSERT INTO `system_role_res` VALUES ('5062', '23', '12');
INSERT INTO `system_role_res` VALUES ('5063', '24', '12');
INSERT INTO `system_role_res` VALUES ('5064', '4', '12');
INSERT INTO `system_role_res` VALUES ('5065', '25', '12');
INSERT INTO `system_role_res` VALUES ('5066', '28', '12');
INSERT INTO `system_role_res` VALUES ('5067', '27', '12');
INSERT INTO `system_role_res` VALUES ('5068', '31', '12');
INSERT INTO `system_role_res` VALUES ('5069', '44', '12');
INSERT INTO `system_role_res` VALUES ('5070', '32', '12');
INSERT INTO `system_role_res` VALUES ('5071', '47', '12');
INSERT INTO `system_role_res` VALUES ('5072', '35', '12');
INSERT INTO `system_role_res` VALUES ('5073', '39', '12');
INSERT INTO `system_role_res` VALUES ('5074', '143', '12');
INSERT INTO `system_role_res` VALUES ('5075', '147', '12');
INSERT INTO `system_role_res` VALUES ('5076', '144', '12');
INSERT INTO `system_role_res` VALUES ('5077', '149', '12');
INSERT INTO `system_role_res` VALUES ('5078', '8', '12');
INSERT INTO `system_role_res` VALUES ('5079', '69', '12');
INSERT INTO `system_role_res` VALUES ('5080', '109', '12');
INSERT INTO `system_role_res` VALUES ('5081', '10', '12');
INSERT INTO `system_role_res` VALUES ('5082', '85', '12');
INSERT INTO `system_role_res` VALUES ('5083', '88', '12');
INSERT INTO `system_role_res` VALUES ('5084', '86', '12');
INSERT INTO `system_role_res` VALUES ('5085', '87', '12');
INSERT INTO `system_role_res` VALUES ('5086', '80', '12');
INSERT INTO `system_role_res` VALUES ('5087', '81', '12');
INSERT INTO `system_role_res` VALUES ('5088', '82', '12');
INSERT INTO `system_role_res` VALUES ('5089', '83', '12');
INSERT INTO `system_role_res` VALUES ('5090', '84', '12');
INSERT INTO `system_role_res` VALUES ('5091', '89', '12');
INSERT INTO `system_role_res` VALUES ('5092', '90', '12');
INSERT INTO `system_role_res` VALUES ('5093', '91', '12');
INSERT INTO `system_role_res` VALUES ('5094', '92', '12');
INSERT INTO `system_role_res` VALUES ('5095', '110', '12');
INSERT INTO `system_role_res` VALUES ('5096', '34', '12');
INSERT INTO `system_role_res` VALUES ('5097', '36', '12');
INSERT INTO `system_role_res` VALUES ('5098', '33', '12');
INSERT INTO `system_role_res` VALUES ('5099', '49', '12');
INSERT INTO `system_role_res` VALUES ('5100', '50', '12');
INSERT INTO `system_role_res` VALUES ('5101', '51', '12');
INSERT INTO `system_role_res` VALUES ('5102', '137', '12');
INSERT INTO `system_role_res` VALUES ('5103', '3', '13');
INSERT INTO `system_role_res` VALUES ('5104', '12', '13');
INSERT INTO `system_role_res` VALUES ('5105', '19', '13');
INSERT INTO `system_role_res` VALUES ('5106', '21', '13');
INSERT INTO `system_role_res` VALUES ('5107', '22', '13');
INSERT INTO `system_role_res` VALUES ('5108', '53', '13');
INSERT INTO `system_role_res` VALUES ('5109', '14', '13');
INSERT INTO `system_role_res` VALUES ('5110', '23', '13');
INSERT INTO `system_role_res` VALUES ('5111', '24', '13');
INSERT INTO `system_role_res` VALUES ('5112', '109', '13');
INSERT INTO `system_role_res` VALUES ('5113', '4', '13');
INSERT INTO `system_role_res` VALUES ('5114', '25', '13');
INSERT INTO `system_role_res` VALUES ('5115', '28', '13');
INSERT INTO `system_role_res` VALUES ('5116', '27', '13');
INSERT INTO `system_role_res` VALUES ('5117', '31', '13');
INSERT INTO `system_role_res` VALUES ('5118', '44', '13');
INSERT INTO `system_role_res` VALUES ('5119', '32', '13');
INSERT INTO `system_role_res` VALUES ('5120', '47', '13');
INSERT INTO `system_role_res` VALUES ('5121', '35', '13');
INSERT INTO `system_role_res` VALUES ('5122', '39', '13');
INSERT INTO `system_role_res` VALUES ('5123', '143', '13');
INSERT INTO `system_role_res` VALUES ('5124', '144', '13');
INSERT INTO `system_role_res` VALUES ('5125', '149', '13');
INSERT INTO `system_role_res` VALUES ('5126', '8', '13');
INSERT INTO `system_role_res` VALUES ('5127', '69', '13');
INSERT INTO `system_role_res` VALUES ('5128', '10', '13');
INSERT INTO `system_role_res` VALUES ('5129', '85', '13');
INSERT INTO `system_role_res` VALUES ('5130', '88', '13');
INSERT INTO `system_role_res` VALUES ('5131', '86', '13');
INSERT INTO `system_role_res` VALUES ('5132', '87', '13');
INSERT INTO `system_role_res` VALUES ('5133', '80', '13');
INSERT INTO `system_role_res` VALUES ('5134', '81', '13');
INSERT INTO `system_role_res` VALUES ('5135', '82', '13');
INSERT INTO `system_role_res` VALUES ('5136', '83', '13');
INSERT INTO `system_role_res` VALUES ('5137', '84', '13');
INSERT INTO `system_role_res` VALUES ('5138', '89', '13');
INSERT INTO `system_role_res` VALUES ('5139', '90', '13');
INSERT INTO `system_role_res` VALUES ('5140', '91', '13');
INSERT INTO `system_role_res` VALUES ('5141', '92', '13');
INSERT INTO `system_role_res` VALUES ('5142', '33', '13');
INSERT INTO `system_role_res` VALUES ('5143', '49', '13');
INSERT INTO `system_role_res` VALUES ('5144', '52', '13');
INSERT INTO `system_role_res` VALUES ('5145', '34', '13');
INSERT INTO `system_role_res` VALUES ('5146', '36', '13');
INSERT INTO `system_role_res` VALUES ('5147', '4', '14');
INSERT INTO `system_role_res` VALUES ('5148', '25', '14');
INSERT INTO `system_role_res` VALUES ('5149', '28', '14');
INSERT INTO `system_role_res` VALUES ('5150', '29', '14');
INSERT INTO `system_role_res` VALUES ('5151', '27', '14');
INSERT INTO `system_role_res` VALUES ('5152', '30', '14');
INSERT INTO `system_role_res` VALUES ('5153', '31', '14');
INSERT INTO `system_role_res` VALUES ('5154', '43', '14');
INSERT INTO `system_role_res` VALUES ('5155', '44', '14');
INSERT INTO `system_role_res` VALUES ('5156', '45', '14');
INSERT INTO `system_role_res` VALUES ('5157', '32', '14');
INSERT INTO `system_role_res` VALUES ('5158', '48', '14');
INSERT INTO `system_role_res` VALUES ('5159', '47', '14');
INSERT INTO `system_role_res` VALUES ('5160', '35', '14');
INSERT INTO `system_role_res` VALUES ('5161', '39', '14');
INSERT INTO `system_role_res` VALUES ('5162', '40', '14');
INSERT INTO `system_role_res` VALUES ('5163', '41', '14');
INSERT INTO `system_role_res` VALUES ('5164', '42', '14');
INSERT INTO `system_role_res` VALUES ('5165', '108', '14');
INSERT INTO `system_role_res` VALUES ('5166', '143', '14');
INSERT INTO `system_role_res` VALUES ('5167', '147', '14');
INSERT INTO `system_role_res` VALUES ('5168', '146', '14');
INSERT INTO `system_role_res` VALUES ('5169', '144', '14');
INSERT INTO `system_role_res` VALUES ('5170', '149', '14');
INSERT INTO `system_role_res` VALUES ('5171', '93', '14');
INSERT INTO `system_role_res` VALUES ('5172', '94', '14');
INSERT INTO `system_role_res` VALUES ('5173', '107', '14');
INSERT INTO `system_role_res` VALUES ('5174', '97', '14');
INSERT INTO `system_role_res` VALUES ('5175', '95', '14');
INSERT INTO `system_role_res` VALUES ('5176', '100', '14');
INSERT INTO `system_role_res` VALUES ('5177', '99', '14');
INSERT INTO `system_role_res` VALUES ('5178', '109', '14');
INSERT INTO `system_role_res` VALUES ('5179', '110', '14');
INSERT INTO `system_role_res` VALUES ('5180', '33', '14');
INSERT INTO `system_role_res` VALUES ('5181', '49', '14');
INSERT INTO `system_role_res` VALUES ('5182', '50', '14');
INSERT INTO `system_role_res` VALUES ('5183', '51', '14');
INSERT INTO `system_role_res` VALUES ('5184', '52', '14');
INSERT INTO `system_role_res` VALUES ('5185', '34', '14');
INSERT INTO `system_role_res` VALUES ('5186', '36', '14');
INSERT INTO `system_role_res` VALUES ('5187', '37', '14');
INSERT INTO `system_role_res` VALUES ('5188', '38', '14');
INSERT INTO `system_role_res` VALUES ('5189', '111', '14');
INSERT INTO `system_role_res` VALUES ('5190', '112', '14');
INSERT INTO `system_role_res` VALUES ('5191', '114', '14');
INSERT INTO `system_role_res` VALUES ('5192', '115', '14');
INSERT INTO `system_role_res` VALUES ('5193', '117', '14');
INSERT INTO `system_role_res` VALUES ('5194', '138', '14');
INSERT INTO `system_role_res` VALUES ('5195', '121', '14');
INSERT INTO `system_role_res` VALUES ('5196', '122', '14');
INSERT INTO `system_role_res` VALUES ('5197', '123', '14');
INSERT INTO `system_role_res` VALUES ('5198', '124', '14');
INSERT INTO `system_role_res` VALUES ('5199', '126', '14');
INSERT INTO `system_role_res` VALUES ('5200', '93', '15');
INSERT INTO `system_role_res` VALUES ('5201', '94', '15');
INSERT INTO `system_role_res` VALUES ('5202', '107', '15');
INSERT INTO `system_role_res` VALUES ('5203', '97', '15');
INSERT INTO `system_role_res` VALUES ('5204', '95', '15');
INSERT INTO `system_role_res` VALUES ('5205', '100', '15');
INSERT INTO `system_role_res` VALUES ('5206', '99', '15');
INSERT INTO `system_role_res` VALUES ('5207', '102', '15');
INSERT INTO `system_role_res` VALUES ('5208', '105', '15');
INSERT INTO `system_role_res` VALUES ('5209', '106', '15');
INSERT INTO `system_role_res` VALUES ('5210', '104', '15');
INSERT INTO `system_role_res` VALUES ('5211', '4', '15');
INSERT INTO `system_role_res` VALUES ('5212', '25', '15');
INSERT INTO `system_role_res` VALUES ('5213', '27', '15');
INSERT INTO `system_role_res` VALUES ('5214', '31', '15');
INSERT INTO `system_role_res` VALUES ('5215', '44', '15');
INSERT INTO `system_role_res` VALUES ('5216', '32', '15');
INSERT INTO `system_role_res` VALUES ('5217', '47', '15');
INSERT INTO `system_role_res` VALUES ('5218', '35', '15');
INSERT INTO `system_role_res` VALUES ('5219', '39', '15');
INSERT INTO `system_role_res` VALUES ('5220', '143', '15');
INSERT INTO `system_role_res` VALUES ('5221', '147', '15');
INSERT INTO `system_role_res` VALUES ('5222', '146', '15');
INSERT INTO `system_role_res` VALUES ('5223', '144', '15');
INSERT INTO `system_role_res` VALUES ('5224', '149', '15');
INSERT INTO `system_role_res` VALUES ('5225', '109', '15');
INSERT INTO `system_role_res` VALUES ('5226', '10', '15');
INSERT INTO `system_role_res` VALUES ('5227', '89', '15');
INSERT INTO `system_role_res` VALUES ('5228', '92', '15');
INSERT INTO `system_role_res` VALUES ('5229', '91', '15');
INSERT INTO `system_role_res` VALUES ('5230', '80', '15');
INSERT INTO `system_role_res` VALUES ('5231', '83', '15');
INSERT INTO `system_role_res` VALUES ('5232', '84', '15');
INSERT INTO `system_role_res` VALUES ('5233', '82', '15');
INSERT INTO `system_role_res` VALUES ('5234', '85', '15');
INSERT INTO `system_role_res` VALUES ('5235', '88', '15');
INSERT INTO `system_role_res` VALUES ('5236', '87', '15');
INSERT INTO `system_role_res` VALUES ('5237', '33', '15');
INSERT INTO `system_role_res` VALUES ('5238', '49', '15');
INSERT INTO `system_role_res` VALUES ('5239', '34', '15');
INSERT INTO `system_role_res` VALUES ('5240', '36', '15');
INSERT INTO `system_role_res` VALUES ('5271', '6', '29');
INSERT INTO `system_role_res` VALUES ('5272', '66', '29');
INSERT INTO `system_role_res` VALUES ('5273', '134', '29');
INSERT INTO `system_role_res` VALUES ('5274', '67', '29');
INSERT INTO `system_role_res` VALUES ('5275', '135', '29');
INSERT INTO `system_role_res` VALUES ('5276', '68', '29');
INSERT INTO `system_role_res` VALUES ('5277', '136', '29');
INSERT INTO `system_role_res` VALUES ('5278', '132', '29');
INSERT INTO `system_role_res` VALUES ('5279', '133', '29');
INSERT INTO `system_role_res` VALUES ('5280', '8', '29');
INSERT INTO `system_role_res` VALUES ('5281', '69', '29');
INSERT INTO `system_role_res` VALUES ('5282', '130', '29');
INSERT INTO `system_role_res` VALUES ('5283', '131', '29');
INSERT INTO `system_role_res` VALUES ('5284', '12', '29');
INSERT INTO `system_role_res` VALUES ('5285', '16', '29');
INSERT INTO `system_role_res` VALUES ('5286', '17', '29');
INSERT INTO `system_role_res` VALUES ('5287', '18', '29');
INSERT INTO `system_role_res` VALUES ('5288', '19', '29');
INSERT INTO `system_role_res` VALUES ('5289', '21', '29');
INSERT INTO `system_role_res` VALUES ('5290', '22', '29');
INSERT INTO `system_role_res` VALUES ('5291', '53', '29');
INSERT INTO `system_role_res` VALUES ('5292', '14', '29');
INSERT INTO `system_role_res` VALUES ('5293', '23', '29');
INSERT INTO `system_role_res` VALUES ('5294', '4', '29');
INSERT INTO `system_role_res` VALUES ('5295', '25', '29');
INSERT INTO `system_role_res` VALUES ('5296', '26', '29');
INSERT INTO `system_role_res` VALUES ('5297', '27', '29');
INSERT INTO `system_role_res` VALUES ('5298', '28', '29');
INSERT INTO `system_role_res` VALUES ('5299', '31', '29');
INSERT INTO `system_role_res` VALUES ('5300', '43', '29');
INSERT INTO `system_role_res` VALUES ('5301', '44', '29');
INSERT INTO `system_role_res` VALUES ('5302', '32', '29');
INSERT INTO `system_role_res` VALUES ('5303', '46', '29');
INSERT INTO `system_role_res` VALUES ('5304', '47', '29');
INSERT INTO `system_role_res` VALUES ('5305', '48', '29');
INSERT INTO `system_role_res` VALUES ('5306', '35', '29');
INSERT INTO `system_role_res` VALUES ('5307', '39', '29');
INSERT INTO `system_role_res` VALUES ('5308', '41', '29');
INSERT INTO `system_role_res` VALUES ('5309', '143', '29');
INSERT INTO `system_role_res` VALUES ('5310', '145', '29');
INSERT INTO `system_role_res` VALUES ('5311', '147', '29');
INSERT INTO `system_role_res` VALUES ('5312', '146', '29');
INSERT INTO `system_role_res` VALUES ('5313', '144', '29');
INSERT INTO `system_role_res` VALUES ('5314', '148', '29');
INSERT INTO `system_role_res` VALUES ('5315', '149', '29');
INSERT INTO `system_role_res` VALUES ('5316', '9', '29');
INSERT INTO `system_role_res` VALUES ('5317', '20', '29');
INSERT INTO `system_role_res` VALUES ('5318', '10', '29');
INSERT INTO `system_role_res` VALUES ('5319', '80', '29');
INSERT INTO `system_role_res` VALUES ('5320', '81', '29');
INSERT INTO `system_role_res` VALUES ('5321', '82', '29');
INSERT INTO `system_role_res` VALUES ('5322', '83', '29');
INSERT INTO `system_role_res` VALUES ('5323', '84', '29');
INSERT INTO `system_role_res` VALUES ('5324', '85', '29');
INSERT INTO `system_role_res` VALUES ('5325', '86', '29');
INSERT INTO `system_role_res` VALUES ('5326', '87', '29');
INSERT INTO `system_role_res` VALUES ('5327', '88', '29');
INSERT INTO `system_role_res` VALUES ('5328', '89', '29');
INSERT INTO `system_role_res` VALUES ('5329', '90', '29');
INSERT INTO `system_role_res` VALUES ('5330', '91', '29');
INSERT INTO `system_role_res` VALUES ('5331', '92', '29');
INSERT INTO `system_role_res` VALUES ('5332', '93', '29');
INSERT INTO `system_role_res` VALUES ('5333', '94', '29');
INSERT INTO `system_role_res` VALUES ('5334', '96', '29');
INSERT INTO `system_role_res` VALUES ('5335', '97', '29');
INSERT INTO `system_role_res` VALUES ('5336', '107', '29');
INSERT INTO `system_role_res` VALUES ('5337', '95', '29');
INSERT INTO `system_role_res` VALUES ('5338', '98', '29');
INSERT INTO `system_role_res` VALUES ('5339', '99', '29');
INSERT INTO `system_role_res` VALUES ('5340', '100', '29');
INSERT INTO `system_role_res` VALUES ('5341', '102', '29');
INSERT INTO `system_role_res` VALUES ('5342', '103', '29');
INSERT INTO `system_role_res` VALUES ('5343', '104', '29');
INSERT INTO `system_role_res` VALUES ('5344', '105', '29');
INSERT INTO `system_role_res` VALUES ('5345', '106', '29');
INSERT INTO `system_role_res` VALUES ('5346', '109', '29');
INSERT INTO `system_role_res` VALUES ('5347', '129', '29');
INSERT INTO `system_role_res` VALUES ('5348', '110', '29');
INSERT INTO `system_role_res` VALUES ('5349', '33', '29');
INSERT INTO `system_role_res` VALUES ('5350', '49', '29');
INSERT INTO `system_role_res` VALUES ('5351', '50', '29');
INSERT INTO `system_role_res` VALUES ('5352', '51', '29');
INSERT INTO `system_role_res` VALUES ('5353', '52', '29');
INSERT INTO `system_role_res` VALUES ('5354', '137', '29');
INSERT INTO `system_role_res` VALUES ('5355', '34', '29');
INSERT INTO `system_role_res` VALUES ('5356', '36', '29');
INSERT INTO `system_role_res` VALUES ('5357', '37', '29');
INSERT INTO `system_role_res` VALUES ('5358', '38', '29');
INSERT INTO `system_role_res` VALUES ('5359', '111', '29');
INSERT INTO `system_role_res` VALUES ('5360', '112', '29');
INSERT INTO `system_role_res` VALUES ('5361', '113', '29');
INSERT INTO `system_role_res` VALUES ('5362', '114', '29');
INSERT INTO `system_role_res` VALUES ('5363', '115', '29');
INSERT INTO `system_role_res` VALUES ('5364', '116', '29');
INSERT INTO `system_role_res` VALUES ('5365', '117', '29');
INSERT INTO `system_role_res` VALUES ('5366', '118', '29');
INSERT INTO `system_role_res` VALUES ('5367', '119', '29');
INSERT INTO `system_role_res` VALUES ('5368', '120', '29');
INSERT INTO `system_role_res` VALUES ('5369', '138', '29');
INSERT INTO `system_role_res` VALUES ('5370', '121', '29');
INSERT INTO `system_role_res` VALUES ('5371', '122', '29');
INSERT INTO `system_role_res` VALUES ('5372', '126', '29');
INSERT INTO `system_role_res` VALUES ('5373', '4', '11');
INSERT INTO `system_role_res` VALUES ('5374', '25', '11');
INSERT INTO `system_role_res` VALUES ('5375', '28', '11');
INSERT INTO `system_role_res` VALUES ('5376', '27', '11');
INSERT INTO `system_role_res` VALUES ('5377', '30', '11');
INSERT INTO `system_role_res` VALUES ('5378', '31', '11');
INSERT INTO `system_role_res` VALUES ('5379', '45', '11');
INSERT INTO `system_role_res` VALUES ('5380', '44', '11');
INSERT INTO `system_role_res` VALUES ('5381', '32', '11');
INSERT INTO `system_role_res` VALUES ('5382', '48', '11');
INSERT INTO `system_role_res` VALUES ('5383', '47', '11');
INSERT INTO `system_role_res` VALUES ('5384', '35', '11');
INSERT INTO `system_role_res` VALUES ('5385', '39', '11');
INSERT INTO `system_role_res` VALUES ('5386', '40', '11');
INSERT INTO `system_role_res` VALUES ('5387', '41', '11');
INSERT INTO `system_role_res` VALUES ('5388', '42', '11');
INSERT INTO `system_role_res` VALUES ('5389', '108', '11');
INSERT INTO `system_role_res` VALUES ('5390', '143', '11');
INSERT INTO `system_role_res` VALUES ('5391', '146', '11');
INSERT INTO `system_role_res` VALUES ('5392', '147', '11');
INSERT INTO `system_role_res` VALUES ('5393', '144', '11');
INSERT INTO `system_role_res` VALUES ('5394', '149', '11');
INSERT INTO `system_role_res` VALUES ('5395', '8', '11');
INSERT INTO `system_role_res` VALUES ('5396', '69', '11');
INSERT INTO `system_role_res` VALUES ('5397', '93', '11');
INSERT INTO `system_role_res` VALUES ('5398', '94', '11');
INSERT INTO `system_role_res` VALUES ('5399', '107', '11');
INSERT INTO `system_role_res` VALUES ('5400', '97', '11');
INSERT INTO `system_role_res` VALUES ('5401', '95', '11');
INSERT INTO `system_role_res` VALUES ('5402', '98', '11');
INSERT INTO `system_role_res` VALUES ('5403', '99', '11');
INSERT INTO `system_role_res` VALUES ('5404', '109', '11');
INSERT INTO `system_role_res` VALUES ('5405', '110', '11');
INSERT INTO `system_role_res` VALUES ('5406', '33', '11');
INSERT INTO `system_role_res` VALUES ('5407', '49', '11');
INSERT INTO `system_role_res` VALUES ('5408', '50', '11');
INSERT INTO `system_role_res` VALUES ('5409', '51', '11');
INSERT INTO `system_role_res` VALUES ('5410', '52', '11');
INSERT INTO `system_role_res` VALUES ('5411', '137', '11');
INSERT INTO `system_role_res` VALUES ('5412', '34', '11');
INSERT INTO `system_role_res` VALUES ('5413', '36', '11');
INSERT INTO `system_role_res` VALUES ('5414', '37', '11');
INSERT INTO `system_role_res` VALUES ('5415', '38', '11');
INSERT INTO `system_role_res` VALUES ('5416', '111', '11');
INSERT INTO `system_role_res` VALUES ('5417', '112', '11');
INSERT INTO `system_role_res` VALUES ('5418', '114', '11');
INSERT INTO `system_role_res` VALUES ('5419', '115', '11');
INSERT INTO `system_role_res` VALUES ('5420', '117', '11');
INSERT INTO `system_role_res` VALUES ('5421', '118', '11');
INSERT INTO `system_role_res` VALUES ('5422', '119', '11');
INSERT INTO `system_role_res` VALUES ('5423', '120', '11');
INSERT INTO `system_role_res` VALUES ('5424', '138', '11');
INSERT INTO `system_role_res` VALUES ('5425', '121', '11');
INSERT INTO `system_role_res` VALUES ('5426', '122', '11');
INSERT INTO `system_role_res` VALUES ('5427', '123', '11');
INSERT INTO `system_role_res` VALUES ('5428', '124', '11');
INSERT INTO `system_role_res` VALUES ('5429', '125', '11');
INSERT INTO `system_role_res` VALUES ('5430', '126', '11');
INSERT INTO `system_role_res` VALUES ('5431', '4', '24');
INSERT INTO `system_role_res` VALUES ('5432', '30', '24');
INSERT INTO `system_role_res` VALUES ('5433', '25', '24');
INSERT INTO `system_role_res` VALUES ('5434', '28', '24');
INSERT INTO `system_role_res` VALUES ('5435', '27', '24');
INSERT INTO `system_role_res` VALUES ('5436', '31', '24');
INSERT INTO `system_role_res` VALUES ('5437', '45', '24');
INSERT INTO `system_role_res` VALUES ('5438', '44', '24');
INSERT INTO `system_role_res` VALUES ('5439', '32', '24');
INSERT INTO `system_role_res` VALUES ('5440', '48', '24');
INSERT INTO `system_role_res` VALUES ('5441', '47', '24');
INSERT INTO `system_role_res` VALUES ('5442', '35', '24');
INSERT INTO `system_role_res` VALUES ('5443', '39', '24');
INSERT INTO `system_role_res` VALUES ('5444', '40', '24');
INSERT INTO `system_role_res` VALUES ('5445', '41', '24');
INSERT INTO `system_role_res` VALUES ('5446', '42', '24');
INSERT INTO `system_role_res` VALUES ('5447', '108', '24');
INSERT INTO `system_role_res` VALUES ('5448', '143', '24');
INSERT INTO `system_role_res` VALUES ('5449', '146', '24');
INSERT INTO `system_role_res` VALUES ('5450', '147', '24');
INSERT INTO `system_role_res` VALUES ('5451', '144', '24');
INSERT INTO `system_role_res` VALUES ('5452', '149', '24');
INSERT INTO `system_role_res` VALUES ('5453', '8', '24');
INSERT INTO `system_role_res` VALUES ('5454', '69', '24');
INSERT INTO `system_role_res` VALUES ('5455', '109', '24');
INSERT INTO `system_role_res` VALUES ('5456', '33', '24');
INSERT INTO `system_role_res` VALUES ('5457', '49', '24');
INSERT INTO `system_role_res` VALUES ('5458', '52', '24');
INSERT INTO `system_role_res` VALUES ('5459', '137', '24');
INSERT INTO `system_role_res` VALUES ('5460', '34', '24');
INSERT INTO `system_role_res` VALUES ('5461', '36', '24');
INSERT INTO `system_role_res` VALUES ('5462', '3', '5');
INSERT INTO `system_role_res` VALUES ('5463', '12', '5');
INSERT INTO `system_role_res` VALUES ('5464', '17', '5');
INSERT INTO `system_role_res` VALUES ('5465', '18', '5');
INSERT INTO `system_role_res` VALUES ('5466', '13', '5');
INSERT INTO `system_role_res` VALUES ('5467', '14', '5');
INSERT INTO `system_role_res` VALUES ('5468', '23', '5');
INSERT INTO `system_role_res` VALUES ('5469', '24', '5');
INSERT INTO `system_role_res` VALUES ('5470', '15', '5');
INSERT INTO `system_role_res` VALUES ('5471', '4', '5');
INSERT INTO `system_role_res` VALUES ('5472', '25', '5');
INSERT INTO `system_role_res` VALUES ('5473', '27', '5');
INSERT INTO `system_role_res` VALUES ('5474', '31', '5');
INSERT INTO `system_role_res` VALUES ('5475', '43', '5');
INSERT INTO `system_role_res` VALUES ('5476', '44', '5');
INSERT INTO `system_role_res` VALUES ('5477', '32', '5');
INSERT INTO `system_role_res` VALUES ('5478', '46', '5');
INSERT INTO `system_role_res` VALUES ('5479', '47', '5');
INSERT INTO `system_role_res` VALUES ('5480', '35', '5');
INSERT INTO `system_role_res` VALUES ('5481', '39', '5');
INSERT INTO `system_role_res` VALUES ('5482', '40', '5');
INSERT INTO `system_role_res` VALUES ('5483', '41', '5');
INSERT INTO `system_role_res` VALUES ('5484', '42', '5');
INSERT INTO `system_role_res` VALUES ('5485', '108', '5');
INSERT INTO `system_role_res` VALUES ('5486', '143', '5');
INSERT INTO `system_role_res` VALUES ('5487', '147', '5');
INSERT INTO `system_role_res` VALUES ('5488', '144', '5');
INSERT INTO `system_role_res` VALUES ('5489', '149', '5');
INSERT INTO `system_role_res` VALUES ('5490', '6', '5');
INSERT INTO `system_role_res` VALUES ('5491', '66', '5');
INSERT INTO `system_role_res` VALUES ('5492', '67', '5');
INSERT INTO `system_role_res` VALUES ('5493', '68', '5');
INSERT INTO `system_role_res` VALUES ('5494', '8', '5');
INSERT INTO `system_role_res` VALUES ('5495', '69', '5');
INSERT INTO `system_role_res` VALUES ('5496', '10', '5');
INSERT INTO `system_role_res` VALUES ('5497', '80', '5');
INSERT INTO `system_role_res` VALUES ('5498', '82', '5');
INSERT INTO `system_role_res` VALUES ('5499', '85', '5');
INSERT INTO `system_role_res` VALUES ('5500', '87', '5');
INSERT INTO `system_role_res` VALUES ('5501', '89', '5');
INSERT INTO `system_role_res` VALUES ('5502', '91', '5');
INSERT INTO `system_role_res` VALUES ('5503', '93', '5');
INSERT INTO `system_role_res` VALUES ('5504', '94', '5');
INSERT INTO `system_role_res` VALUES ('5505', '97', '5');
INSERT INTO `system_role_res` VALUES ('5506', '95', '5');
INSERT INTO `system_role_res` VALUES ('5507', '99', '5');
INSERT INTO `system_role_res` VALUES ('5508', '102', '5');
INSERT INTO `system_role_res` VALUES ('5509', '103', '5');
INSERT INTO `system_role_res` VALUES ('5510', '104', '5');
INSERT INTO `system_role_res` VALUES ('5511', '110', '5');
INSERT INTO `system_role_res` VALUES ('5512', '33', '5');
INSERT INTO `system_role_res` VALUES ('5513', '49', '5');
INSERT INTO `system_role_res` VALUES ('5514', '50', '5');
INSERT INTO `system_role_res` VALUES ('5515', '51', '5');
INSERT INTO `system_role_res` VALUES ('5516', '52', '5');
INSERT INTO `system_role_res` VALUES ('5517', '137', '5');
INSERT INTO `system_role_res` VALUES ('5518', '34', '5');
INSERT INTO `system_role_res` VALUES ('5519', '36', '5');
INSERT INTO `system_role_res` VALUES ('5520', '37', '5');
INSERT INTO `system_role_res` VALUES ('5521', '38', '5');
INSERT INTO `system_role_res` VALUES ('5522', '111', '5');
INSERT INTO `system_role_res` VALUES ('5523', '112', '5');
INSERT INTO `system_role_res` VALUES ('5524', '114', '5');
INSERT INTO `system_role_res` VALUES ('5525', '115', '5');
INSERT INTO `system_role_res` VALUES ('5526', '118', '5');
INSERT INTO `system_role_res` VALUES ('5527', '119', '5');
INSERT INTO `system_role_res` VALUES ('5528', '120', '5');
INSERT INTO `system_role_res` VALUES ('5529', '121', '5');
INSERT INTO `system_role_res` VALUES ('5530', '122', '5');
INSERT INTO `system_role_res` VALUES ('5531', '123', '5');
INSERT INTO `system_role_res` VALUES ('5532', '124', '5');
INSERT INTO `system_role_res` VALUES ('5533', '125', '5');
INSERT INTO `system_role_res` VALUES ('5534', '126', '5');
INSERT INTO `system_role_res` VALUES ('5555', '6', '25');
INSERT INTO `system_role_res` VALUES ('5556', '66', '25');
INSERT INTO `system_role_res` VALUES ('5557', '134', '25');
INSERT INTO `system_role_res` VALUES ('5558', '67', '25');
INSERT INTO `system_role_res` VALUES ('5559', '135', '25');
INSERT INTO `system_role_res` VALUES ('5560', '68', '25');
INSERT INTO `system_role_res` VALUES ('5561', '136', '25');
INSERT INTO `system_role_res` VALUES ('5562', '110', '25');
INSERT INTO `system_role_res` VALUES ('5563', '33', '25');
INSERT INTO `system_role_res` VALUES ('5564', '49', '25');
INSERT INTO `system_role_res` VALUES ('5565', '34', '25');
INSERT INTO `system_role_res` VALUES ('5566', '36', '25');
INSERT INTO `system_role_res` VALUES ('5567', '37', '25');
INSERT INTO `system_role_res` VALUES ('5568', '111', '25');
INSERT INTO `system_role_res` VALUES ('5569', '112', '25');
INSERT INTO `system_role_res` VALUES ('5570', '113', '25');
INSERT INTO `system_role_res` VALUES ('5571', '114', '25');
INSERT INTO `system_role_res` VALUES ('5572', '115', '25');
INSERT INTO `system_role_res` VALUES ('5573', '116', '25');
INSERT INTO `system_role_res` VALUES ('5574', '138', '25');
INSERT INTO `system_role_res` VALUES ('5575', '109', '25');
INSERT INTO `system_role_res` VALUES ('5576', '129', '25');

-- ----------------------------
-- Table structure for system_user
-- ----------------------------
DROP TABLE IF EXISTS `system_user`;
CREATE TABLE `system_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(55) DEFAULT NULL,
  `pwd` varchar(255) DEFAULT NULL,
  `pwd2` varchar(55) DEFAULT NULL,
  `des` varchar(55) DEFAULT NULL,
  `status` varchar(5) DEFAULT '01',
  `passwd_status` varchar(50) DEFAULT '0',
  `passwd2_status` varchar(50) DEFAULT '0',
  `icon` varchar(255) DEFAULT 'images/guest.jpg',
  `email` varchar(222) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `createdate` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=191 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of system_user
-- ----------------------------
INSERT INTO `system_user` VALUES ('1', 'WNCD000', 'B5B1C07C180FEFC77671906F382488F2', 'B5B1C07C180FEFC77671906F382488F2', '超级管理员账号，拥有所有的权限', '01', '1', '1', 'images/guest.jpg', null, '1888888888888', '1', null);
INSERT INTO `system_user` VALUES ('190', null, 'B5B1C07C180FEFC77671906F382488F2', 'B5B1C07C180FEFC77671906F382488F2', null, '01', '0', '0', 'images/guest.jpg', null, null, '189', '2019-06-17');

-- ----------------------------
-- Table structure for system_user_role
-- ----------------------------
DROP TABLE IF EXISTS `system_user_role`;
CREATE TABLE `system_user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=385 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of system_user_role
-- ----------------------------
INSERT INTO `system_user_role` VALUES ('384', '1', '1');

-- ----------------------------
-- Table structure for system_version
-- ----------------------------
DROP TABLE IF EXISTS `system_version`;
CREATE TABLE `system_version` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version` varchar(20) NOT NULL DEFAULT '',
  `online_time` varchar(20) NOT NULL DEFAULT '',
  `operate_url` varchar(200) NOT NULL DEFAULT '',
  `file_name` varchar(20) DEFAULT '',
  `info` varchar(500) DEFAULT '',
  `create_time` varchar(20) DEFAULT '',
  `update_time` varchar(20) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of system_version
-- ----------------------------
INSERT INTO `system_version` VALUES ('1', '1.0', '2017-11-04', '', '无', '主要功能:登录，修改密码，对资源的姓名和电话进行加密解密；培训资源的管理，公共资源池，转交责任人等。', '', '');
INSERT INTO `system_version` VALUES ('2', '2.0', '2018-01-27', '', '无', '主要功能:学员管理的学生信息，考勤和晨考，阶段考试成绩，排课；就业管理中的模拟面试，技术面试以及真实面试管理，企业客户管理', '', '');
INSERT INTO `system_version` VALUES ('3', '2.5', '2018-04-13', 'upload/operation/314a2eb5-9ae1-417f-abaf-383af0f6a944.doc', '2.5版本操作手册', '新增财务模块，行政综合模块，学员管理新增请假功能，重构报表中心，对接在线课堂的学员开通以及积分清零等功能', '2018-11-28 22:06', '');
INSERT INTO `system_version` VALUES ('4', '3.0', '2018-10-10', 'upload/operation/cbe18af5-057b-4e5c-93ae-3893076bc020.docx', '3.0版本操作手册', '重构整个系统，将系统菜单全部置于导航栏左侧；引入权限框架，新增后台管理功能', '2018-11-28 22:07', '');
INSERT INTO `system_version` VALUES ('5', '3.1', '2018-11-28', 'upload/operation/afcd0ee5-dbe3-4e70-8165-b1fe74da26b9.doc', '3.1版本操作手册', '1.新增教学管理:指定值班老师，讲师的加班申请和审核2.新增题库管理：考题的新增、查询、修改，自动出题，替换出题，导出试卷以及出卷的记录和下载；3.将原学员管理下的学员班级和课程安排迁移到教学管理中；4.将系统首页换成系统版本，可下载操作文档', '2018-11-28 22:08', '');
INSERT INTO `system_version` VALUES ('6', '3.2', '2019-01-12', 'upload/operation/8be00c20-eea1-4b73-9911-769b689c8bf3.doc', '3.2版本操作手册', ' 1.上线新的财务管理功能，包括财务流水，学员学费，预支结算，账户管理，会计科目管理；2 上线系统公告功能；3首页增加快捷导航和任务管理；4.班级管理新增开班功能;5.将教师加班统计从报表中心迁移到教学管理，并可以查询加班值班详情', '2019-01-14 15:39', '2019-01-18 09:51');
INSERT INTO `system_version` VALUES ('7', '3.2.1', '2019-01-29', 'upload/operation/c0c82a99-dcf5-4147-9367-ada447357aff.doc', '3.2.1版本操作手册', '1、增加财务流水信息的修改以及审核修改的功能。2、新增财务入账统计对账的功能', '2019-01-29 11:40', '');
INSERT INTO `system_version` VALUES ('8', '3.5', '2019-04-01', 'upload/operation/d41ec2a8-8cf8-4346-bfae-0895ec1582f5.doc', '3.5版本操作手册', '1.增加了周考分数、考勤积分、作业积分以及阶段综合评分功能。2.新班必须提交开班时间，并在开班当天早上9点自动开班。3.班级与教学阶段绑定。4.市场营销简历zip压缩包手动上传。5.邮箱定时读取邮件。', '2019-04-01 19:32', '');

-- ----------------------------
-- Table structure for telephone
-- ----------------------------
DROP TABLE IF EXISTS `telephone`;
CREATE TABLE `telephone` (
  `telephone_id` int(11) NOT NULL AUTO_INCREMENT,
  `telephone_region_id` int(11) DEFAULT NULL COMMENT '电话所属区域',
  `telephone_work_id` varchar(50) DEFAULT NULL,
  `telephone_no` varchar(50) DEFAULT NULL,
  `phone_no` varchar(50) DEFAULT NULL COMMENT 'z座机号对应的手机',
  `telephone_passwd` varchar(50) DEFAULT NULL,
  `update_time` varchar(50) DEFAULT NULL,
  `create_time` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`telephone_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of telephone
-- ----------------------------

-- ----------------------------
-- Table structure for telephone_record
-- ----------------------------
DROP TABLE IF EXISTS `telephone_record`;
CREATE TABLE `telephone_record` (
  `telephone_record_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '电话记录ID',
  `telephone_id` int(11) DEFAULT NULL COMMENT '电话id',
  `begin_time` varchar(50) DEFAULT '' COMMENT '起始时间',
  `last_time` varchar(50) DEFAULT '' COMMENT '通话时长',
  `call_type` varchar(50) DEFAULT '' COMMENT '呼叫类型',
  `to_number` varchar(50) DEFAULT '' COMMENT '对方号码',
  `chat_type` varchar(50) DEFAULT '' COMMENT '通话类型',
  `base_fee` varchar(50) DEFAULT '' COMMENT '基本或漫游费',
  `longtour_fee` varchar(50) DEFAULT '' COMMENT '长途费',
  `other_fee` varchar(50) DEFAULT '' COMMENT '其他费',
  `discount` varchar(50) DEFAULT '' COMMENT '优惠减免',
  `total_fee` varchar(50) DEFAULT '' COMMENT '总费用',
  `create_time` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`telephone_record_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20952 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of telephone_record
-- ----------------------------

-- ----------------------------
-- Table structure for tracking_record
-- ----------------------------
DROP TABLE IF EXISTS `tracking_record`;
CREATE TABLE `tracking_record` (
  `tracking_record_id` int(11) NOT NULL AUTO_INCREMENT,
  `tracking_record_customer_id` int(11) NOT NULL,
  `work_id` varchar(50) DEFAULT NULL,
  `tracking_time` varchar(50) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `remark` text,
  `tape` varchar(255) DEFAULT NULL,
  `create_time` varchar(50) DEFAULT NULL,
  `update_time` varchar(50) DEFAULT NULL,
  `next_time` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`tracking_record_id`),
  KEY `FK_Reference_7` (`tracking_record_customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=333889 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tracking_record
-- ----------------------------

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `tel` varchar(11) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `user_role_id` int(11) DEFAULT NULL,
  `flag` int(1) DEFAULT NULL,
  `user_name` varchar(10) DEFAULT NULL,
  `sex` varchar(2) DEFAULT NULL,
  `birthday` varchar(20) DEFAULT NULL,
  `qq` varchar(12) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `icon` varchar(100) DEFAULT NULL,
  `register_time` datetime DEFAULT NULL,
  `school` varchar(20) DEFAULT NULL,
  `education` varchar(10) DEFAULT NULL,
  `integral_num` int(11) DEFAULT NULL,
  `position` varchar(10) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `fans` int(11) DEFAULT NULL,
  `company` varchar(20) DEFAULT NULL,
  `technology` varchar(10) DEFAULT NULL,
  `major` varchar(10) DEFAULT NULL,
  `city` varchar(10) DEFAULT NULL,
  `real_name` varchar(10) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `reward_integral` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7636 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------

-- ----------------------------
-- Table structure for week_exam
-- ----------------------------
DROP TABLE IF EXISTS `week_exam`;
CREATE TABLE `week_exam` (
  `week_exam_id` int(11) NOT NULL AUTO_INCREMENT,
  `week_exam_student_id` int(11) NOT NULL,
  `week_exam_class_id` int(11) DEFAULT NULL,
  `phase` varchar(10) NOT NULL,
  `week` varchar(10) NOT NULL,
  `score` varchar(10) NOT NULL,
  `operator_id` varchar(10) DEFAULT NULL,
  `create_time` varchar(50) DEFAULT NULL,
  `update_time` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`week_exam_id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of week_exam
-- ----------------------------

-- ----------------------------
-- Table structure for work_order
-- ----------------------------
DROP TABLE IF EXISTS `work_order`;
CREATE TABLE `work_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `region_id` int(11) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `work_id` varchar(50) DEFAULT NULL,
  `type` varchar(10) DEFAULT NULL,
  `theme` varchar(255) DEFAULT NULL,
  `content` text,
  `file_path` varchar(100) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `submit_work_id` varchar(50) DEFAULT NULL,
  `create_time` varchar(50) DEFAULT NULL,
  `update_time` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of work_order
-- ----------------------------

-- ----------------------------
-- Table structure for work_order_response
-- ----------------------------
DROP TABLE IF EXISTS `work_order_response`;
CREATE TABLE `work_order_response` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `work_order_id` int(11) DEFAULT NULL COMMENT '工单id',
  `status` varchar(10) DEFAULT NULL COMMENT '工单的处理状态',
  `content` varchar(255) DEFAULT NULL COMMENT '工单回复内容',
  `work_id` varchar(50) DEFAULT NULL COMMENT '录入人',
  `create_time` varchar(50) DEFAULT NULL,
  `update_time` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of work_order_response
-- ----------------------------

-- ----------------------------
-- View structure for viewclassandteacher
-- ----------------------------
DROP VIEW IF EXISTS `viewclassandteacher`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `viewclassandteacher` AS select `cs`.`work_id` AS `work_id`,`c`.`class_id` AS `class_id`,`c`.`class_no` AS `class_no`,`c`.`orientation` AS `orientation`,`cs`.`course_id` AS `course_id` from (`class` `c` join `curriculum_schedule` `cs` on((`cs`.`class_id` = `c`.`class_id`))) where ((`cs`.`start_time` <= date_format(now(),'%Y-%m-%d')) and (`cs`.`end_time` >= date_format(now(),'%Y-%m-%d'))) ;

-- ----------------------------
-- View structure for viewteacher
-- ----------------------------
DROP VIEW IF EXISTS `viewteacher`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `viewteacher` AS select `cs`.`work_id` AS `work_id`,`c`.`class_id` AS `class_id`,`c`.`class_no` AS `class_no`,`c`.`orientation` AS `orientation` from (`class` `c` join `curriculum_schedule` `cs` on((`cs`.`class_id` = `c`.`class_id`))) where ((`cs`.`start_time` <= date_format(now(),'%Y-%m-%d')) and (`cs`.`end_time` >= date_format(now(),'%Y-%m-%d'))) ;

-- ----------------------------
-- Procedure structure for countMarketForMain
-- ----------------------------
DROP PROCEDURE IF EXISTS `countMarketForMain`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `countMarketForMain`(IN `time` varchar(255))
BEGIN
	SELECT COUNT(1) num,source,r.region_name,c.region_id AS regionId FROM customer c JOIN region r ON c.region_id = r.region_id
	WHERE DATE_FORMAT(create_time,'%Y-%m') = time
	GROUP BY source ,region_name,regionId;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for market_count
-- ----------------------------
DROP PROCEDURE IF EXISTS `market_count`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `market_count`(IN `start_time` varchar(255),IN `end_time` varchar(255))
BEGIN
	declare s_time VARCHAR(255);
	declare e_time VARCHAR(255);

	SET s_time = start_time;
	SET e_time = end_time;

	SELECT COUNT(1) num ,source,'全部' AS region_name,0 AS regionId FROM customer 
	WHERE DATE_FORMAT(create_time,'%Y-%m-%d') BETWEEN s_time AND e_time
	GROUP BY source ,region_name,regionId

	UNION

	SELECT COUNT(1) num,source,r.region_name,c.region_id AS regionId FROM customer c JOIN region r ON c.region_id = r.region_id
	WHERE DATE_FORMAT(create_time,'%Y-%m-%d') BETWEEN s_time AND e_time
	GROUP BY source ,region_name,regionId;

END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for countClassAndStudent
-- ----------------------------
DROP FUNCTION IF EXISTS `countClassAndStudent`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `countClassAndStudent`() RETURNS varchar(50) CHARSET utf8
BEGIN
	DECLARE regionnum int DEFAULT 0;
	DECLARE result VARCHAR(50) DEFAULT "";
	DECLARE classnum int DEFAULT 0;
	DECLARE stunum int DEFAULT 0;
	DECLARE region VARCHAR(10) DEFAULT "";
	DECLARE i int DEFAULT 1;
	SET regionnum = (SELECT MAX(region_id) FROM region);
	WHILE i<=regionnum DO
		SET region = (SELECT region_name FROM region WHERE region_id = i);
		SET	classnum = (SELECT COUNT(class.class_id) FROM class LEFT JOIN curriculum_schedule cs ON class.class_id = cs.class_id WHERE region_id = i AND opening_status = '02' AND DATE_FORMAT(NOW(),'%Y-%m-%d')>= DATE_FORMAT(cs.start_time,'%Y-%m-%d') AND DATE_FORMAT(NOW(),'%Y-%m-%d')<= DATE_FORMAT(cs.end_time,'%Y-%m-%d'));
		SET stunum = (SELECT COUNT(student_id) FROM student WHERE region_id = i AND status = '02');
		SET result = CONCAT(result,region,":",classnum,"-",stunum,";");
		SET i = i + 1;
	END WHILE;
	RETURN result;
END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for countEntrance
-- ----------------------------
DROP FUNCTION IF EXISTS `countEntrance`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `countEntrance`(`mytime` varchar(50)) RETURNS varchar(50) CHARSET utf8
BEGIN
	DECLARE regionnum int DEFAULT 0;
	DECLARE result VARCHAR(50) DEFAULT "";
	DECLARE region VARCHAR(10) DEFAULT "";
	DECLARE entrancenum INT DEFAULT 0;
	DECLARE i int DEFAULT 1;
	SET regionnum = (SELECT MAX(region_id) FROM region);
	WHILE i<=regionnum DO
		SET region = (SELECT region_name FROM region WHERE region_id = i);
		SET entrancenum = (SELECT COUNT(student_id) FROM student WHERE region_id = i AND entrance_time != "" AND DATE_FORMAT(entrance_time,'%Y-%m') = mytime);
		SET result = CONCAT(result,region,":",entrancenum,";");
		SET i = i + 1;
	END WHILE;
	RETURN result;
END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for countRegister
-- ----------------------------
DROP FUNCTION IF EXISTS `countRegister`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `countRegister`(`mytime` varchar(50)) RETURNS varchar(255) CHARSET utf8
BEGIN
	DECLARE regionnum int DEFAULT 0;
	DECLARE result VARCHAR(255) DEFAULT "";
	DECLARE region VARCHAR(10) DEFAULT "";
	DECLARE maxsalary DOUBLE DEFAULT 0;
	DECLARE minsalary DOUBLE DEFAULT 0;
	DECLARE avgsalary DOUBLE(6,0) DEFAULT 0;
	DECLARE registernum int default 0;
	DECLARE i int DEFAULT 1;
	SET regionnum = (SELECT MAX(region_id) FROM region);
	WHILE i<=regionnum DO
		SET maxsalary = 0;
		SET minsalary = 0;
		SET avgsalary = 0;
		SET region = (SELECT region_name FROM region WHERE region_id = i);
		SET registernum = (SELECT COUNT(job_salary) FROM job_register WHERE job_time!="" AND DATE_FORMAT(job_time,'%Y-%m') = mytime AND region_id = i);
		IF registernum != 0 THEN
			SET maxsalary = (SELECT MAX(CAST(job_salary AS DECIMAL)) FROM job_register WHERE job_time!="" AND DATE_FORMAT(job_time,'%Y-%m') = mytime AND region_id = i);
			SET minsalary = (SELECT MIN(CAST(job_salary AS DECIMAL)) FROM job_register WHERE job_time!="" AND DATE_FORMAT(job_time,'%Y-%m') = mytime AND region_id = i);
			SET avgsalary = (SELECT AVG(CAST(job_salary AS DECIMAL)) FROM job_register WHERE job_time!="" AND DATE_FORMAT(job_time,'%Y-%m') = mytime AND region_id = i);
		END IF;
		SET result = CONCAT(result,region,":",registernum,"-",maxsalary,"-",minsalary,"-",avgsalary,";");
		SET i = i + 1;
	END WHILE;
	RETURN result;
END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for getAttendCount
-- ----------------------------
DROP FUNCTION IF EXISTS `getAttendCount`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `getAttendCount`(`myclass` int,`myphase` int,`mystudent` int) RETURNS varchar(50) CHARSET utf8
BEGIN
	DECLARE result VARCHAR(50) DEFAULT "";
	DECLARE temp INT DEFAULT 0;
	DECLARE i INT DEFAULT 1;
	WHILE i <= 5 DO
		SET temp = (SELECT COUNT(1) FROM attendance WHERE class_id = myclass AND attendance_student_id = mystudent AND phase = myphase AND attendance.result = i);
		SET result = CONCAT(result,"-",temp);
		SET i = i + 1;
	END WHILE;
	RETURN result;
END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for getAvgWeekScore
-- ----------------------------
DROP FUNCTION IF EXISTS `getAvgWeekScore`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getAvgWeekScore`(`myphase` varchar(10),`myid` int,`myclassid` int) RETURNS double
BEGIN
	DECLARE avgscore INT DEFAULT 0;
	SET avgscore = (SELECT IFNULL(AVG(score),0) FROM (SELECT score FROM week_exam where phase = myphase and week_exam_student_id = myid and week_exam_class_id = myclassid and score != -1) as j);

	RETURN avgscore;
END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for getHomeworkCode
-- ----------------------------
DROP FUNCTION IF EXISTS `getHomeworkCode`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getHomeworkCode`(`myphase` varchar(10),`myid` int,`myclassid` int) RETURNS int(10)
BEGIN
	DECLARE sum INT DEFAULT 0;
	DECLARE weeknum INT DEFAULT 0;
	DECLARE badcount INT DEFAULT 0;
	DECLARE allcount INT DEFAULT 0;
	SET weeknum = (SELECT IFNULL(COUNT(week),0) FROM (SELECT week FROM homework WHERE homework_student_id = myid AND phase = myphase AND class_id = myclassid GROUP BY week)as p);
	SELECT IFNULL(SUM(weekcount),0) ,IFNULL(COUNT(weekcount),0) INTO allcount,badcount FROM(SELECT count(result) weekcount , `week` FROM homework WHERE homework_student_id = myid AND phase = myphase AND result = "05" AND class_id = myclassid GROUP BY `week`) as t WHERE weekcount>0;
	SET sum = weeknum - badcount;
	SET sum = sum - CAST((SELECT POW(2,allcount)) AS SIGNED) + 1;
	RETURN sum;
END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for getHomeworkCount
-- ----------------------------
DROP FUNCTION IF EXISTS `getHomeworkCount`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `getHomeworkCount`(`myclass` int,`myphase` int,`mystudent` int) RETURNS varchar(50) CHARSET utf8
BEGIN
	DECLARE result VARCHAR(50) DEFAULT "";
	DECLARE temp INT DEFAULT 0;
	DECLARE i INT DEFAULT 1;
	WHILE i <= 5 DO
		SET temp = (SELECT COUNT(1) FROM homework WHERE class_id = myclass AND homework_student_id = mystudent AND phase = myphase AND homework.result = i);
		SET result = CONCAT(result,"-",temp);
		SET i = i + 1;
	END WHILE;
	RETURN result;
END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for getMornexamCount
-- ----------------------------
DROP FUNCTION IF EXISTS `getMornexamCount`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `getMornexamCount`(`mystudent` int) RETURNS varchar(50) CHARSET utf8
BEGIN
	DECLARE result VARCHAR(50) DEFAULT "";
	DECLARE temp INT DEFAULT 0;
	DECLARE i INT DEFAULT 1;
	WHILE i <= 4 DO
		SET temp = (SELECT COUNT(1) FROM morn_exam WHERE morn_exam_student_id = mystudent AND morn_exam.result = i);
		SET result = CONCAT(result,"-",temp);
		SET i = i + 1;
	END WHILE;
	RETURN result;
END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for getResultCode
-- ----------------------------
DROP FUNCTION IF EXISTS `getResultCode`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getResultCode`(`myphase` varchar(10),`myid` int,`myclassid` int) RETURNS int(10)
BEGIN
	DECLARE sum INT DEFAULT 0;
	DECLARE weeknum INT DEFAULT 0;
	DECLARE leavecount INT DEFAULT 0;
	DECLARE badcount INT DEFAULT 0;
	DECLARE allcount INT DEFAULT 0;
	SET weeknum = (SELECT IFNULL(COUNT(week),0) FROM (SELECT week FROM attendance WHERE attendance_student_id = myid AND phase = myphase AND class_id = myclassid GROUP BY week)as p);
	SELECT IFNULL(SUM(weekcount),0)  INTO allcount FROM(SELECT count(result) weekcount , `week` FROM attendance WHERE attendance_student_id = myid AND phase = myphase AND result IN ("02","04") AND class_id = myclassid GROUP BY `week`) as t WHERE weekcount>0;
	SELECT IFNULL(COUNT(weekcount),0) INTO badcount FROM(SELECT COUNT(result) weekcount,`week` FROM attendance WHERE attendance_student_id = myid AND phase = myphase AND result IN ("02","04","05") AND class_id = myclassid GROUP BY `week`) as t WHERE weekcount>0;
	SELECT IFNULL(COUNT(leave_id),0) INTO leavecount FROM student_leave WHERE phase = myphase AND class_id = myclassid AND student_id = myid AND leavecount = "02";
	SET sum = weeknum - badcount;
	SET allcount = allcount + leavecount;
	SET sum = sum - CAST((SELECT POW(2,allcount)) AS SIGNED) + 1;
	RETURN sum;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `tr_update_customer`;
DELIMITER ;;
CREATE TRIGGER `tr_update_customer` AFTER INSERT ON `tracking_record` FOR EACH ROW BEGIN
       SET @tracking_times =(SELECT tracking_times FROM customer WHERE customer_id = new.tracking_record_customer_id)+1;
				/*更新资源表中的资源的最新状态*/
 UPDATE customer SET last_tracking= new.tracking_time,update_time=new.tracking_time,last_status=new.status,last_tracking_remark=new.remark,next_tracking_time=new.next_time,tracking_times=@tracking_times WHERE customer_id= new.tracking_record_customer_id;

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `users_reward_integral_control`;
DELIMITER ;;
CREATE TRIGGER `users_reward_integral_control` BEFORE UPDATE ON `users` FOR EACH ROW BEGIN

DECLARE userId INT(11);
DECLARE integral INT(11);
DECLARE rintegral INT(11);
SET integral = NEW.integral_num;
SET userId = NEW.user_id;
SET rintegral = NEW.reward_integral;

 IF integral<rintegral THEN
	SET new.reward_integral=new.integral_num;
 END IF;


END
;;
DELIMITER ;
