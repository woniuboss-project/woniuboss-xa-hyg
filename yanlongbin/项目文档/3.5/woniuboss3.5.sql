/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50615
Source Host           : localhost:3306
Source Database       : woniuboss3.5

Target Server Type    : MYSQL
Target Server Version : 50615
File Encoding         : 65001

Date: 2019-04-19 17:33:34
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of account_subject
-- ----------------------------

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  PRIMARY KEY (`assets_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `result` varchar(10) DEFAULT '' COMMENT '0表示正常，1表示迟到，2表示早退，3表示旷课，4表示旷课，5面试',
  `teacher_id` varchar(10) DEFAULT '' COMMENT '教师id',
  `create_time` varchar(50) DEFAULT '' COMMENT '创建时间',
  `update_time` varchar(50) DEFAULT '' COMMENT '更新时间',
  `phase` varchar(10) DEFAULT NULL,
  `week` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`attendance_id`),
  KEY `student_id_index` (`attendance_student_id`) USING BTREE COMMENT '考勤表的学生id索引'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `max_date` varchar(20) DEFAULT NULL,
  `create_time` varchar(50) DEFAULT '',
  `update_time` varchar(50) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `borrower_id` int(11) DEFAULT '0' COMMENT '领用人id',
  `lender_id` int(11) DEFAULT '0' COMMENT '借出人id',
  `borrow_time` varchar(50) DEFAULT NULL,
  `note` varchar(255) DEFAULT '' COMMENT '借用备注信息',
  `create_time` varchar(50) DEFAULT '' COMMENT '创建时间',
  `update_time` varchar(50) DEFAULT '' COMMENT '更新时间',
  PRIMARY KEY (`borrow_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `class_no` varchar(10) DEFAULT '' COMMENT '班级编号',
  `orientation` varchar(20) DEFAULT NULL COMMENT '方向',
  `opening_time` varchar(20) DEFAULT '' COMMENT '开班时间',
  `opening_status` varchar(20) DEFAULT '' COMMENT '开班状态',
  `create_time` varchar(50) DEFAULT '' COMMENT '创建时间',
  `update_time` varchar(50) DEFAULT '' COMMENT '更新时间',
  `phase` varchar(10) DEFAULT '01',
  PRIMARY KEY (`class_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of config_info
-- ----------------------------

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
  PRIMARY KEY (`course_id`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES ('1', '基础阶段-第一周', 'HTML5+CSS3', '公共', '4', null);
INSERT INTO `course` VALUES ('2', '基础阶段-第二周', 'JavaScript+Jquery', '公共', '4', null);
INSERT INTO `course` VALUES ('3', '基础阶段-第三周', 'SQLServer+MySQL', '公共', '4', null);
INSERT INTO `course` VALUES ('4', '基础阶段-第四周', 'Linux+研发管理工具', '公共', '4', null);
INSERT INTO `course` VALUES ('5', '第一阶段-第一周', 'Java程序设计基础', '开发', '4', null);
INSERT INTO `course` VALUES ('6', '第一阶段-第二周', 'Java进阶', '开发', '4', null);
INSERT INTO `course` VALUES ('7', '第一阶段-第三周', '坦克大战', '开发', '4', null);
INSERT INTO `course` VALUES ('8', '第二阶段-第一周', 'Java高级及网络编程', '开发', '4', null);
INSERT INTO `course` VALUES ('9', '第二阶段-第二周', 'JavaWeb服务器开发', '开发', '4', null);
INSERT INTO `course` VALUES ('10', '第二阶段-第三周', '网上商城项目', '开发', '4', null);
INSERT INTO `course` VALUES ('11', '第三阶段-第一周', 'Struts+Hibernate', '开发', '4', null);
INSERT INTO `course` VALUES ('12', '第三阶段-第二周', 'Spring+SpringMVC', '开发', '4', null);
INSERT INTO `course` VALUES ('13', '第三阶段-第三周', 'MyBatis+框架整合', '开发', '4', null);
INSERT INTO `course` VALUES ('14', '项目阶段-第一周', '项目', '开发', '4', null);
INSERT INTO `course` VALUES ('15', '项目阶段-第二周', '项目', '开发', '4', null);
INSERT INTO `course` VALUES ('16', '项目阶段-第三周', '项目', '开发', '4', null);
INSERT INTO `course` VALUES ('17', '第一阶段-第一周', 'Python程序设计基础', '测试', '4', null);
INSERT INTO `course` VALUES ('18', '第一阶段-第二周', 'Python高级', '测试', '4', null);
INSERT INTO `course` VALUES ('19', '第一阶段-第三周', '网络协议+实战项目', '测试', '4', null);
INSERT INTO `course` VALUES ('20', '第二阶段-第一周', 'Selenium自动化', '测试', '4', null);
INSERT INTO `course` VALUES ('21', '第二阶段-第二周', '系统测试+接口测试自动化', '测试', '4', null);
INSERT INTO `course` VALUES ('22', '第二阶段-第三周', '性能测试', '测试', '4', null);
INSERT INTO `course` VALUES ('23', '第三阶段-第一周', 'RobotFramework框架', '测试', '4', null);
INSERT INTO `course` VALUES ('24', '第三阶段-第二周', 'TinyShop项目', '测试', '4', null);
INSERT INTO `course` VALUES ('25', '第三阶段-第三周', 'VR租赁项目', '测试', '4', null);
INSERT INTO `course` VALUES ('26', '项目阶段-第一周', '项目', '测试', '4', null);
INSERT INTO `course` VALUES ('27', '项目阶段-第二周', '项目', '测试', '4', null);
INSERT INTO `course` VALUES ('28', '项目阶段-第三周', '项目', '测试', '4', null);
INSERT INTO `course` VALUES ('50', '第一阶段-第一周', 'HTML与JavaScript', '开发', '5', '01');
INSERT INTO `course` VALUES ('51', '第一阶段-第二周', 'Java编程基础', '开发', '5', '01');
INSERT INTO `course` VALUES ('52', '第一阶段-第三周', 'Java面向对象', '开发', '5', '01');
INSERT INTO `course` VALUES ('53', '第一阶段-第四周', 'Java核心对象', '开发', '5', '01');
INSERT INTO `course` VALUES ('54', '第一阶段-第五周', 'WoniuTank游戏项目', '开发', '5', '01');
INSERT INTO `course` VALUES ('55', '第二阶段-第一周', 'MySQL数据库', '开发', '5', '02');
INSERT INTO `course` VALUES ('56', '第二阶段-第二周', '网络与JDBC/DAO', '开发', '5', '02');
INSERT INTO `course` VALUES ('57', '第二阶段-第三周', 'JSP与Servlet', '开发', '5', '02');
INSERT INTO `course` VALUES ('58', '第二阶段-第四周', 'Java高级应用', '开发', '5', '02');
INSERT INTO `course` VALUES ('59', '第二阶段-第五周', 'WoniuShop网站项目', '开发', '5', '02');
INSERT INTO `course` VALUES ('60', '第三阶段-第一周', 'Linux操作系统', '开发', '5', '03');
INSERT INTO `course` VALUES ('61', '第三阶段-第二周', 'Java设计模式', '开发', '5', '03');
INSERT INTO `course` VALUES ('62', '第三阶段-第三周', '企业级框架SSH(一)', '开发', '5', '03');
INSERT INTO `course` VALUES ('63', '第三阶段-第四周', '企业级框架SSH(二)', '开发', '5', '03');
INSERT INTO `course` VALUES ('64', '第三阶段-第五周', '企业级框架SSM等', '开发', '5', '03');
INSERT INTO `course` VALUES ('65', '第三阶段-第六周', '企业快速开发框架', '开发', '5', '03');
INSERT INTO `course` VALUES ('66', '第四阶段-第一周', '综合项目实战', '开发', '5', '04');
INSERT INTO `course` VALUES ('67', '第四阶段-第二周', '综合项目实战', '开发', '5', '04');
INSERT INTO `course` VALUES ('68', '第四阶段-第三周', '综合项目实战', '开发', '5', '04');
INSERT INTO `course` VALUES ('69', '第四阶段-第四周', '综合项目实战', '开发', '5', '04');
INSERT INTO `course` VALUES ('70', '第四阶段-第五周', '总结补充与面试指导', '开发', '5', '04');
INSERT INTO `course` VALUES ('71', '第一阶段-第一周', 'HTML+JavaScript', '测试', '5', '01');
INSERT INTO `course` VALUES ('72', '第一阶段-第二周', 'MySQL数据库', '测试', '5', '01');
INSERT INTO `course` VALUES ('73', '第一阶段-第三周', 'Linux操作系统', '测试', '5', '01');
INSERT INTO `course` VALUES ('74', '第一阶段-第四周', 'Python编程基础', '测试', '5', '01');
INSERT INTO `course` VALUES ('75', '第一阶段-第五周', 'Python高级编程', '测试', '5', '01');
INSERT INTO `course` VALUES ('76', '第二阶段-第一周', '系统测试基础', '测试', '5', '02');
INSERT INTO `course` VALUES ('77', '第二阶段-第二周', '系统测试项目', '测试', '5', '02');
INSERT INTO `course` VALUES ('78', '第二阶段-第三周', 'GUI测试自动化', '测试', '5', '02');
INSERT INTO `course` VALUES ('79', '第二阶段-第四周', '接口测试自动化', '测试', '5', '02');
INSERT INTO `course` VALUES ('80', '第二阶段-第五周', '性能测试自动化', '测试', '5', '02');
INSERT INTO `course` VALUES ('81', '第三阶段-第一周', '综合项目+系统测试', '测试', '5', '03');
INSERT INTO `course` VALUES ('82', '第三阶段-第二周', '综合测试项目+自动化测试', '测试', '5', '03');
INSERT INTO `course` VALUES ('83', '第三阶段-第三周', '综合测试项目+性能测试', '测试', '5', '03');
INSERT INTO `course` VALUES ('84', '第三阶段-第四周', 'WoniuCBT测试框架', '测试', '5', '03');
INSERT INTO `course` VALUES ('85', '第三阶段-第五周', '自动化测试框架实战', '测试', '5', '03');
INSERT INTO `course` VALUES ('86', '第三阶段-第六周', '软件测试专题课程', '测试', '5', '03');

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
  `assistant_id` varchar(20) DEFAULT '' COMMENT '助教',
  `headmaster_id` varchar(20) DEFAULT '0',
  `teacher_status` varchar(20) DEFAULT '' COMMENT '教师状态',
  `create_time` varchar(20) DEFAULT '' COMMENT '创建时间',
  `update_time` varchar(20) DEFAULT '' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `create_time` varchar(20) DEFAULT '' COMMENT '创建时间',
  `update_time` varchar(20) DEFAULT '' COMMENT '更新时间',
  PRIMARY KEY (`department_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES ('1', '1', '管理部', '0', '0', '', '');
INSERT INTO `department` VALUES ('2', '1', '就业部', '0', '0', '', '');
INSERT INTO `department` VALUES ('3', '1', '咨询部', '0', '0', '', '');
INSERT INTO `department` VALUES ('4', '1', '电销部', '0', '0', '', '');
INSERT INTO `department` VALUES ('5', '1', '渠道部', '0', '0', '', '');
INSERT INTO `department` VALUES ('6', '1', '市场部', '0', '0', '', '');
INSERT INTO `department` VALUES ('7', '1', '教学部', '0', '0', '', '');
INSERT INTO `department` VALUES ('8', '1', '研发部', '0', '0', '', '');
INSERT INTO `department` VALUES ('9', '1', '财务部', '0', '0', '', '');
INSERT INTO `department` VALUES ('10', '2', '管理部', '0', '0', '', '');
INSERT INTO `department` VALUES ('11', '2', '就业部', '0', '0', '', '');
INSERT INTO `department` VALUES ('12', '2', '咨询部', '0', '0', '', '');
INSERT INTO `department` VALUES ('13', '2', '渠道部', '0', '0', '', '');
INSERT INTO `department` VALUES ('14', '2', '教学部', '0', '0', '', '');
INSERT INTO `department` VALUES ('15', '3', '咨询部', '0', '0', '', '');
INSERT INTO `department` VALUES ('16', '3', '管理部', '0', '0', '', '');
INSERT INTO `department` VALUES ('17', '3', '教学部', '0', '0', '', '');
INSERT INTO `department` VALUES ('18', '2', '市场部', '0', '0', '', '');
INSERT INTO `department` VALUES ('19', '3', '就业部', '0', '0', '', '');
INSERT INTO `department` VALUES ('20', '4', '管理部', '0', '0', '', '');
INSERT INTO `department` VALUES ('21', '4', '教学部', '0', '0', '', '');
INSERT INTO `department` VALUES ('22', '4', '咨询部', '0', '0', '', '');
INSERT INTO `department` VALUES ('23', '4', '就业部', '0', '0', '', '');

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
) ENGINE=InnoDB AUTO_INCREMENT=195 DEFAULT CHARSET=utf8;

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
INSERT INTO `dictionary_data` VALUES ('24', '4', '01', '智联招聘', '10', '启用', '', '无', '2018-02-14', '');
INSERT INTO `dictionary_data` VALUES ('25', '4', '02', '前程无忧', '20', '启用', '', '无', '2018-02-14', '');
INSERT INTO `dictionary_data` VALUES ('26', '4', '03', '专属简历', '30', '启用', '', '无', '2018-02-14', '');
INSERT INTO `dictionary_data` VALUES ('27', '4', '04', '网络资源', '40', '启用', '', '无', '2018-02-14', '');
INSERT INTO `dictionary_data` VALUES ('28', '4', '05', '汇博人才', '50', '启用', '', '无', '2018-02-14', '');
INSERT INTO `dictionary_data` VALUES ('29', '4', '06', '搜索引擎', '60', '启用', '', '无', '2018-02-14', '');
INSERT INTO `dictionary_data` VALUES ('30', '4', '07', '58同城', '70', '启用', '', '无', '2018-02-14', '');
INSERT INTO `dictionary_data` VALUES ('31', '4', '08', '赶集网', '80', '启用', '', '无', '2018-02-14', '');
INSERT INTO `dictionary_data` VALUES ('32', '4', '09', '中华英才', '90', '启用', '', '无', '2018-02-14', '');
INSERT INTO `dictionary_data` VALUES ('33', '4', '11', '招聘会', '110', '启用', '', '无', '2018-02-14', '');
INSERT INTO `dictionary_data` VALUES ('34', '4', '12', '双选会', '120', '启用', '', '无', '2018-02-14', '');
INSERT INTO `dictionary_data` VALUES ('35', '4', '13', '高校渠道', '130', '启用', '', '无', '2018-02-14', '');
INSERT INTO `dictionary_data` VALUES ('36', '4', '14', '口碑介绍', '140', '启用', '', '无', '2018-02-14', '');
INSERT INTO `dictionary_data` VALUES ('37', '4', '15', '老学员介绍', '150', '启用', '', '无', '2018-02-14', '');
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
INSERT INTO `dictionary_data` VALUES ('121', '4', '10', '其他', '160', '启用', 'WNCD056', null, '', '');
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
INSERT INTO `dictionary_data` VALUES ('176', '4', '17', '智联教育', '170', '启用', 'WNCD056', '1月24日市场部要求新增', '', '2019-01-24 16:00');
INSERT INTO `dictionary_data` VALUES ('177', '8', '13', 'EPSON CB-X04', '130', '启用', 'WNCD088', null, '', '');
INSERT INTO `dictionary_data` VALUES ('178', '8', '14', 'BENQ ED933', '140', '启用', 'WNCD088', null, '', '');
INSERT INTO `dictionary_data` VALUES ('179', '35', '07', '扫码', '70', '启用', 'WNCD056', '', '', '');
INSERT INTO `dictionary_data` VALUES ('180', '8', '15', 'L430', '150', '启用', 'WNCD088', null, '', '');
INSERT INTO `dictionary_data` VALUES ('181', '4', '18', '肖俊彦录', '180', '启用', 'WNCD001', '重庆地推来源', '', '2019-03-04 16:21');
INSERT INTO `dictionary_data` VALUES ('182', '10', '09', '19800', '90', '启用', 'WNCD001', '上海2019年Java学费', '', '');
INSERT INTO `dictionary_data` VALUES ('183', '10', '10', '19500', '91', '启用', 'WNCD001', '上海2019年Java学费', '', '');
INSERT INTO `dictionary_data` VALUES ('184', '4', '19', '211校招网', '190', '启用', 'WNCD056', null, '', '');
INSERT INTO `dictionary_data` VALUES ('185', '4', '20', '付费广告', '200', '启用', 'WNCD056', null, '', '');
INSERT INTO `dictionary_data` VALUES ('186', '39', '01', '申请调休', '10', '启用', 'WNCD056', '加班或值班申请调休', '', '');
INSERT INTO `dictionary_data` VALUES ('187', '39', '02', '结算工资', '20', '启用', 'WNCD056', '加班或值班结算工资', '', '');
INSERT INTO `dictionary_data` VALUES ('188', '40', '01', '第一周', '10', '启用', '', '', '', '');
INSERT INTO `dictionary_data` VALUES ('189', '40', '02', '第二周', '20', '启用', '', '', '', '');
INSERT INTO `dictionary_data` VALUES ('190', '40', '03', '第三周', '30', '启用', '', '', '', '');
INSERT INTO `dictionary_data` VALUES ('191', '40', '04', '第四周', '40', '启用', '', '', '', '');
INSERT INTO `dictionary_data` VALUES ('192', '40', '05', '第五周', '50', '启用', '', '', '', '');
INSERT INTO `dictionary_data` VALUES ('193', '41', '01', '完成', '10', '启用', '', '', '', '');
INSERT INTO `dictionary_data` VALUES ('194', '41', '02', '未交', '20', '启用', '', '', '', '');

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
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

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
INSERT INTO `dictionary_type` VALUES ('39', 'accounting_way', '核算方式', '启用', '加班的核算方式', '', '');
INSERT INTO `dictionary_type` VALUES ('40', 'week', '阶段第几周', '启用', '阶段周数', '', '');
INSERT INTO `dictionary_type` VALUES ('41', 'homework', '作业状态', '启用', '作业完成状态', '', '');

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
  `accounting_way` varchar(10) DEFAULT '',
  `apply_time` varchar(20) DEFAULT '',
  `create_time` varchar(50) DEFAULT '',
  `update_time` varchar(50) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `create_time` varchar(50) DEFAULT NULL,
  `update_time` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`employee_id`)
) ENGINE=InnoDB AUTO_INCREMENT=175 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of employee
-- ----------------------------
INSERT INTO `employee` VALUES ('1', '1', '8', 'WNCD056', 'admin', '18688888888', 'ali@yun.com', '12345678', '男', 'boss研发', '01', '2019-04-16', '2019-04-16');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `finance_type` varchar(10) DEFAULT '' COMMENT '收支类型',
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `phase` varchar(10) DEFAULT NULL,
  `week` varchar(10) DEFAULT NULL,
  `create_time` varchar(50) DEFAULT '',
  `update_time` varchar(50) DEFAULT '',
  PRIMARY KEY (`homework_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of homework
-- ----------------------------

-- ----------------------------
-- Table structure for job_register
-- ----------------------------
DROP TABLE IF EXISTS `job_register`;
CREATE TABLE `job_register` (
  `job_regist_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '学员入职登记id',
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of job_register
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `type` varchar(11) DEFAULT '' COMMENT '晨考类型',
  `question` varchar(1000) DEFAULT '' COMMENT '晨考问题',
  `score` varchar(10) DEFAULT '' COMMENT '晨考分数',
  `operator_id` varchar(10) DEFAULT '' COMMENT '操作者工号',
  `create_time` varchar(20) DEFAULT '' COMMENT '创建时间',
  `update_time` varchar(20) DEFAULT '' COMMENT '修改时间',
  PRIMARY KEY (`morn_exam_id`),
  KEY `student_id_index` (`morn_exam_student_id`) USING BTREE COMMENT '晨考表学生id的索引'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of notice
-- ----------------------------

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `fee_type` varchar(10) DEFAULT '' COMMENT '缴费/缴费',
  `finance_status` varchar(10) DEFAULT '' COMMENT '缴费状态',
  `refund_type` varchar(10) DEFAULT '' COMMENT '退费类型',
  `create_time` varchar(50) DEFAULT '',
  `update_time` varchar(50) DEFAULT '',
  PRIMARY KEY (`payment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `phase` varchar(50) DEFAULT '' COMMENT '阶段',
  `score` varchar(20) DEFAULT '' COMMENT '成绩',
  `comment` varchar(500) DEFAULT '' COMMENT '评语',
  `operator_id` varchar(50) DEFAULT '' COMMENT '录入人的工号',
  `create_time` varchar(50) DEFAULT '' COMMENT '创建时间',
  `update_time` varchar(50) DEFAULT '' COMMENT '更新时间',
  PRIMARY KEY (`phase_exam_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of phase_exam
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of question_type
-- ----------------------------

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of region
-- ----------------------------
INSERT INTO `region` VALUES ('1', '成都', 'WNCD');
INSERT INTO `region` VALUES ('2', '重庆', 'WNCQ');
INSERT INTO `region` VALUES ('3', '西安', 'WNXA');
INSERT INTO `region` VALUES ('4', '上海', 'WNSH');

-- ----------------------------
-- Table structure for returns
-- ----------------------------
DROP TABLE IF EXISTS `returns`;
CREATE TABLE `returns` (
  `returns_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '归还表id',
  `returner_type` varchar(20) DEFAULT NULL,
  `returner_borrower_id` int(11) DEFAULT '0' COMMENT '归还人id',
  `recipient_id` int(11) DEFAULT '0' COMMENT '归还数量',
  `assets_id` int(11) DEFAULT NULL,
  `return_time` varchar(30) DEFAULT NULL COMMENT '归还时间',
  `note` varchar(255) DEFAULT '' COMMENT '归还信息备注',
  `create_time` varchar(50) DEFAULT '' COMMENT '创建时间',
  `update_time` varchar(50) DEFAULT '' COMMENT '更新时间',
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `re_compu` varchar(10) DEFAULT '0' COMMENT '是否退还电脑',
  `is_sign` varchar(10) DEFAULT '0' COMMENT '是否签署协议',
  `pass_time` varchar(20) DEFAULT '未开始' COMMENT '人事面试通过，开始推荐时间',
  `is_hired` varchar(10) DEFAULT '0' COMMENT '''是否入职''',
  `need_fee` varchar(10) DEFAULT '' COMMENT '应缴学费',
  `last_valuate` varchar(255) DEFAULT NULL COMMENT '最后一次技术评语',
  `create_time` varchar(50) DEFAULT '' COMMENT '创建时间',
  `update_time` varchar(50) DEFAULT '' COMMENT '更新时间',
  PRIMARY KEY (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student
-- ----------------------------

-- ----------------------------
-- Table structure for student_leave
-- ----------------------------
DROP TABLE IF EXISTS `student_leave`;
CREATE TABLE `student_leave` (
  `leave_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '请假表主键id',
  `student_id` varchar(50) DEFAULT '0' COMMENT '学生姓名',
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
  `create_time` varchar(50) DEFAULT '' COMMENT '创建时间',
  `update_time` varchar(50) DEFAULT '' COMMENT '更新时间',
  PRIMARY KEY (`leave_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=143 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=5787 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of system_role_res
-- ----------------------------
INSERT INTO `system_role_res` VALUES ('4632', '1', '1');
INSERT INTO `system_role_res` VALUES ('4633', '2', '1');
INSERT INTO `system_role_res` VALUES ('4634', '130', '1');
INSERT INTO `system_role_res` VALUES ('4635', '131', '1');
INSERT INTO `system_role_res` VALUES ('4636', '3', '1');
INSERT INTO `system_role_res` VALUES ('4637', '12', '1');
INSERT INTO `system_role_res` VALUES ('4638', '16', '1');
INSERT INTO `system_role_res` VALUES ('4639', '17', '1');
INSERT INTO `system_role_res` VALUES ('4640', '18', '1');
INSERT INTO `system_role_res` VALUES ('4641', '19', '1');
INSERT INTO `system_role_res` VALUES ('4642', '21', '1');
INSERT INTO `system_role_res` VALUES ('4643', '22', '1');
INSERT INTO `system_role_res` VALUES ('4644', '53', '1');
INSERT INTO `system_role_res` VALUES ('4645', '13', '1');
INSERT INTO `system_role_res` VALUES ('4646', '14', '1');
INSERT INTO `system_role_res` VALUES ('4647', '23', '1');
INSERT INTO `system_role_res` VALUES ('4648', '24', '1');
INSERT INTO `system_role_res` VALUES ('4649', '15', '1');
INSERT INTO `system_role_res` VALUES ('4650', '4', '1');
INSERT INTO `system_role_res` VALUES ('4651', '25', '1');
INSERT INTO `system_role_res` VALUES ('4652', '26', '1');
INSERT INTO `system_role_res` VALUES ('4653', '27', '1');
INSERT INTO `system_role_res` VALUES ('4654', '28', '1');
INSERT INTO `system_role_res` VALUES ('4655', '29', '1');
INSERT INTO `system_role_res` VALUES ('4656', '30', '1');
INSERT INTO `system_role_res` VALUES ('4657', '31', '1');
INSERT INTO `system_role_res` VALUES ('4658', '43', '1');
INSERT INTO `system_role_res` VALUES ('4659', '44', '1');
INSERT INTO `system_role_res` VALUES ('4660', '45', '1');
INSERT INTO `system_role_res` VALUES ('4661', '32', '1');
INSERT INTO `system_role_res` VALUES ('4662', '46', '1');
INSERT INTO `system_role_res` VALUES ('4663', '47', '1');
INSERT INTO `system_role_res` VALUES ('4664', '48', '1');
INSERT INTO `system_role_res` VALUES ('4665', '35', '1');
INSERT INTO `system_role_res` VALUES ('4666', '39', '1');
INSERT INTO `system_role_res` VALUES ('4667', '40', '1');
INSERT INTO `system_role_res` VALUES ('4668', '41', '1');
INSERT INTO `system_role_res` VALUES ('4669', '42', '1');
INSERT INTO `system_role_res` VALUES ('4670', '108', '1');
INSERT INTO `system_role_res` VALUES ('4671', '6', '1');
INSERT INTO `system_role_res` VALUES ('4672', '66', '1');
INSERT INTO `system_role_res` VALUES ('4673', '134', '1');
INSERT INTO `system_role_res` VALUES ('4674', '142', '1');
INSERT INTO `system_role_res` VALUES ('4675', '67', '1');
INSERT INTO `system_role_res` VALUES ('4676', '135', '1');
INSERT INTO `system_role_res` VALUES ('4677', '68', '1');
INSERT INTO `system_role_res` VALUES ('4678', '136', '1');
INSERT INTO `system_role_res` VALUES ('4679', '132', '1');
INSERT INTO `system_role_res` VALUES ('4680', '133', '1');
INSERT INTO `system_role_res` VALUES ('4681', '139', '1');
INSERT INTO `system_role_res` VALUES ('4682', '140', '1');
INSERT INTO `system_role_res` VALUES ('4683', '141', '1');
INSERT INTO `system_role_res` VALUES ('4684', '8', '1');
INSERT INTO `system_role_res` VALUES ('4685', '69', '1');
INSERT INTO `system_role_res` VALUES ('4686', '9', '1');
INSERT INTO `system_role_res` VALUES ('4687', '20', '1');
INSERT INTO `system_role_res` VALUES ('4688', '10', '1');
INSERT INTO `system_role_res` VALUES ('4689', '80', '1');
INSERT INTO `system_role_res` VALUES ('4690', '81', '1');
INSERT INTO `system_role_res` VALUES ('4691', '82', '1');
INSERT INTO `system_role_res` VALUES ('4692', '83', '1');
INSERT INTO `system_role_res` VALUES ('4693', '84', '1');
INSERT INTO `system_role_res` VALUES ('4694', '85', '1');
INSERT INTO `system_role_res` VALUES ('4695', '86', '1');
INSERT INTO `system_role_res` VALUES ('4696', '87', '1');
INSERT INTO `system_role_res` VALUES ('4697', '88', '1');
INSERT INTO `system_role_res` VALUES ('4698', '89', '1');
INSERT INTO `system_role_res` VALUES ('4699', '90', '1');
INSERT INTO `system_role_res` VALUES ('4700', '91', '1');
INSERT INTO `system_role_res` VALUES ('4701', '92', '1');
INSERT INTO `system_role_res` VALUES ('4702', '93', '1');
INSERT INTO `system_role_res` VALUES ('4703', '94', '1');
INSERT INTO `system_role_res` VALUES ('4704', '96', '1');
INSERT INTO `system_role_res` VALUES ('4705', '97', '1');
INSERT INTO `system_role_res` VALUES ('4706', '107', '1');
INSERT INTO `system_role_res` VALUES ('4707', '95', '1');
INSERT INTO `system_role_res` VALUES ('4708', '98', '1');
INSERT INTO `system_role_res` VALUES ('4709', '99', '1');
INSERT INTO `system_role_res` VALUES ('4710', '100', '1');
INSERT INTO `system_role_res` VALUES ('4711', '102', '1');
INSERT INTO `system_role_res` VALUES ('4712', '103', '1');
INSERT INTO `system_role_res` VALUES ('4713', '104', '1');
INSERT INTO `system_role_res` VALUES ('4714', '105', '1');
INSERT INTO `system_role_res` VALUES ('4715', '106', '1');
INSERT INTO `system_role_res` VALUES ('4716', '109', '1');
INSERT INTO `system_role_res` VALUES ('4717', '129', '1');
INSERT INTO `system_role_res` VALUES ('4718', '110', '1');
INSERT INTO `system_role_res` VALUES ('4719', '33', '1');
INSERT INTO `system_role_res` VALUES ('4720', '49', '1');
INSERT INTO `system_role_res` VALUES ('4721', '50', '1');
INSERT INTO `system_role_res` VALUES ('4722', '51', '1');
INSERT INTO `system_role_res` VALUES ('4723', '52', '1');
INSERT INTO `system_role_res` VALUES ('4724', '137', '1');
INSERT INTO `system_role_res` VALUES ('4725', '34', '1');
INSERT INTO `system_role_res` VALUES ('4726', '36', '1');
INSERT INTO `system_role_res` VALUES ('4727', '37', '1');
INSERT INTO `system_role_res` VALUES ('4728', '38', '1');
INSERT INTO `system_role_res` VALUES ('4729', '111', '1');
INSERT INTO `system_role_res` VALUES ('4730', '112', '1');
INSERT INTO `system_role_res` VALUES ('4731', '113', '1');
INSERT INTO `system_role_res` VALUES ('4732', '114', '1');
INSERT INTO `system_role_res` VALUES ('4733', '115', '1');
INSERT INTO `system_role_res` VALUES ('4734', '116', '1');
INSERT INTO `system_role_res` VALUES ('4735', '117', '1');
INSERT INTO `system_role_res` VALUES ('4736', '118', '1');
INSERT INTO `system_role_res` VALUES ('4737', '119', '1');
INSERT INTO `system_role_res` VALUES ('4738', '120', '1');
INSERT INTO `system_role_res` VALUES ('4739', '138', '1');
INSERT INTO `system_role_res` VALUES ('4740', '121', '1');
INSERT INTO `system_role_res` VALUES ('4741', '122', '1');
INSERT INTO `system_role_res` VALUES ('4742', '123', '1');
INSERT INTO `system_role_res` VALUES ('4743', '124', '1');
INSERT INTO `system_role_res` VALUES ('4744', '125', '1');
INSERT INTO `system_role_res` VALUES ('4745', '126', '1');
INSERT INTO `system_role_res` VALUES ('4746', '127', '1');
INSERT INTO `system_role_res` VALUES ('4747', '128', '1');
INSERT INTO `system_role_res` VALUES ('4748', '3', '3');
INSERT INTO `system_role_res` VALUES ('4749', '12', '3');
INSERT INTO `system_role_res` VALUES ('4750', '16', '3');
INSERT INTO `system_role_res` VALUES ('4751', '17', '3');
INSERT INTO `system_role_res` VALUES ('4752', '18', '3');
INSERT INTO `system_role_res` VALUES ('4753', '14', '3');
INSERT INTO `system_role_res` VALUES ('4754', '23', '3');
INSERT INTO `system_role_res` VALUES ('4755', '4', '3');
INSERT INTO `system_role_res` VALUES ('4756', '25', '3');
INSERT INTO `system_role_res` VALUES ('4757', '26', '3');
INSERT INTO `system_role_res` VALUES ('4758', '27', '3');
INSERT INTO `system_role_res` VALUES ('4759', '31', '3');
INSERT INTO `system_role_res` VALUES ('4760', '43', '3');
INSERT INTO `system_role_res` VALUES ('4761', '44', '3');
INSERT INTO `system_role_res` VALUES ('4762', '32', '3');
INSERT INTO `system_role_res` VALUES ('4763', '46', '3');
INSERT INTO `system_role_res` VALUES ('4764', '47', '3');
INSERT INTO `system_role_res` VALUES ('4765', '35', '3');
INSERT INTO `system_role_res` VALUES ('4766', '39', '3');
INSERT INTO `system_role_res` VALUES ('4767', '6', '3');
INSERT INTO `system_role_res` VALUES ('4768', '66', '3');
INSERT INTO `system_role_res` VALUES ('4769', '134', '3');
INSERT INTO `system_role_res` VALUES ('4770', '67', '3');
INSERT INTO `system_role_res` VALUES ('4771', '135', '3');
INSERT INTO `system_role_res` VALUES ('4772', '68', '3');
INSERT INTO `system_role_res` VALUES ('4773', '136', '3');
INSERT INTO `system_role_res` VALUES ('4774', '132', '3');
INSERT INTO `system_role_res` VALUES ('4775', '133', '3');
INSERT INTO `system_role_res` VALUES ('4776', '139', '3');
INSERT INTO `system_role_res` VALUES ('4777', '140', '3');
INSERT INTO `system_role_res` VALUES ('4778', '8', '3');
INSERT INTO `system_role_res` VALUES ('4779', '69', '3');
INSERT INTO `system_role_res` VALUES ('4780', '10', '3');
INSERT INTO `system_role_res` VALUES ('4781', '80', '3');
INSERT INTO `system_role_res` VALUES ('4782', '81', '3');
INSERT INTO `system_role_res` VALUES ('4783', '82', '3');
INSERT INTO `system_role_res` VALUES ('4784', '85', '3');
INSERT INTO `system_role_res` VALUES ('4785', '86', '3');
INSERT INTO `system_role_res` VALUES ('4786', '87', '3');
INSERT INTO `system_role_res` VALUES ('4787', '89', '3');
INSERT INTO `system_role_res` VALUES ('4788', '90', '3');
INSERT INTO `system_role_res` VALUES ('4789', '91', '3');
INSERT INTO `system_role_res` VALUES ('4790', '93', '3');
INSERT INTO `system_role_res` VALUES ('4791', '94', '3');
INSERT INTO `system_role_res` VALUES ('4792', '96', '3');
INSERT INTO `system_role_res` VALUES ('4793', '97', '3');
INSERT INTO `system_role_res` VALUES ('4794', '95', '3');
INSERT INTO `system_role_res` VALUES ('4795', '98', '3');
INSERT INTO `system_role_res` VALUES ('4796', '99', '3');
INSERT INTO `system_role_res` VALUES ('4797', '102', '3');
INSERT INTO `system_role_res` VALUES ('4798', '103', '3');
INSERT INTO `system_role_res` VALUES ('4799', '104', '3');
INSERT INTO `system_role_res` VALUES ('4800', '109', '3');
INSERT INTO `system_role_res` VALUES ('4801', '129', '3');
INSERT INTO `system_role_res` VALUES ('4802', '110', '3');
INSERT INTO `system_role_res` VALUES ('4803', '33', '3');
INSERT INTO `system_role_res` VALUES ('4804', '49', '3');
INSERT INTO `system_role_res` VALUES ('4805', '34', '3');
INSERT INTO `system_role_res` VALUES ('4806', '36', '3');
INSERT INTO `system_role_res` VALUES ('4807', '111', '3');
INSERT INTO `system_role_res` VALUES ('4808', '112', '3');
INSERT INTO `system_role_res` VALUES ('4809', '113', '3');
INSERT INTO `system_role_res` VALUES ('4810', '114', '3');
INSERT INTO `system_role_res` VALUES ('4811', '115', '3');
INSERT INTO `system_role_res` VALUES ('4812', '116', '3');
INSERT INTO `system_role_res` VALUES ('4813', '118', '3');
INSERT INTO `system_role_res` VALUES ('4814', '119', '3');
INSERT INTO `system_role_res` VALUES ('4815', '138', '3');
INSERT INTO `system_role_res` VALUES ('4816', '121', '3');
INSERT INTO `system_role_res` VALUES ('4817', '122', '3');
INSERT INTO `system_role_res` VALUES ('4818', '126', '3');
INSERT INTO `system_role_res` VALUES ('4819', '3', '4');
INSERT INTO `system_role_res` VALUES ('4820', '12', '4');
INSERT INTO `system_role_res` VALUES ('4821', '16', '4');
INSERT INTO `system_role_res` VALUES ('4822', '17', '4');
INSERT INTO `system_role_res` VALUES ('4823', '18', '4');
INSERT INTO `system_role_res` VALUES ('4824', '14', '4');
INSERT INTO `system_role_res` VALUES ('4825', '23', '4');
INSERT INTO `system_role_res` VALUES ('4826', '4', '4');
INSERT INTO `system_role_res` VALUES ('4827', '25', '4');
INSERT INTO `system_role_res` VALUES ('4828', '26', '4');
INSERT INTO `system_role_res` VALUES ('4829', '27', '4');
INSERT INTO `system_role_res` VALUES ('4830', '31', '4');
INSERT INTO `system_role_res` VALUES ('4831', '43', '4');
INSERT INTO `system_role_res` VALUES ('4832', '44', '4');
INSERT INTO `system_role_res` VALUES ('4833', '32', '4');
INSERT INTO `system_role_res` VALUES ('4834', '46', '4');
INSERT INTO `system_role_res` VALUES ('4835', '47', '4');
INSERT INTO `system_role_res` VALUES ('4836', '35', '4');
INSERT INTO `system_role_res` VALUES ('4837', '39', '4');
INSERT INTO `system_role_res` VALUES ('4838', '6', '4');
INSERT INTO `system_role_res` VALUES ('4839', '66', '4');
INSERT INTO `system_role_res` VALUES ('4840', '134', '4');
INSERT INTO `system_role_res` VALUES ('4841', '67', '4');
INSERT INTO `system_role_res` VALUES ('4842', '135', '4');
INSERT INTO `system_role_res` VALUES ('4843', '68', '4');
INSERT INTO `system_role_res` VALUES ('4844', '136', '4');
INSERT INTO `system_role_res` VALUES ('4845', '8', '4');
INSERT INTO `system_role_res` VALUES ('4846', '69', '4');
INSERT INTO `system_role_res` VALUES ('4847', '10', '4');
INSERT INTO `system_role_res` VALUES ('4848', '80', '4');
INSERT INTO `system_role_res` VALUES ('4849', '81', '4');
INSERT INTO `system_role_res` VALUES ('4850', '82', '4');
INSERT INTO `system_role_res` VALUES ('4851', '85', '4');
INSERT INTO `system_role_res` VALUES ('4852', '86', '4');
INSERT INTO `system_role_res` VALUES ('4853', '87', '4');
INSERT INTO `system_role_res` VALUES ('4854', '89', '4');
INSERT INTO `system_role_res` VALUES ('4855', '90', '4');
INSERT INTO `system_role_res` VALUES ('4856', '91', '4');
INSERT INTO `system_role_res` VALUES ('4857', '93', '4');
INSERT INTO `system_role_res` VALUES ('4858', '94', '4');
INSERT INTO `system_role_res` VALUES ('4859', '96', '4');
INSERT INTO `system_role_res` VALUES ('4860', '97', '4');
INSERT INTO `system_role_res` VALUES ('4861', '95', '4');
INSERT INTO `system_role_res` VALUES ('4862', '98', '4');
INSERT INTO `system_role_res` VALUES ('4863', '99', '4');
INSERT INTO `system_role_res` VALUES ('4864', '102', '4');
INSERT INTO `system_role_res` VALUES ('4865', '103', '4');
INSERT INTO `system_role_res` VALUES ('4866', '104', '4');
INSERT INTO `system_role_res` VALUES ('4867', '109', '4');
INSERT INTO `system_role_res` VALUES ('4868', '129', '4');
INSERT INTO `system_role_res` VALUES ('4869', '110', '4');
INSERT INTO `system_role_res` VALUES ('4870', '33', '4');
INSERT INTO `system_role_res` VALUES ('4871', '49', '4');
INSERT INTO `system_role_res` VALUES ('4872', '34', '4');
INSERT INTO `system_role_res` VALUES ('4873', '36', '4');
INSERT INTO `system_role_res` VALUES ('4874', '111', '4');
INSERT INTO `system_role_res` VALUES ('4875', '112', '4');
INSERT INTO `system_role_res` VALUES ('4876', '113', '4');
INSERT INTO `system_role_res` VALUES ('4877', '114', '4');
INSERT INTO `system_role_res` VALUES ('4878', '115', '4');
INSERT INTO `system_role_res` VALUES ('4879', '116', '4');
INSERT INTO `system_role_res` VALUES ('4880', '118', '4');
INSERT INTO `system_role_res` VALUES ('4881', '119', '4');
INSERT INTO `system_role_res` VALUES ('4882', '120', '4');
INSERT INTO `system_role_res` VALUES ('4883', '138', '4');
INSERT INTO `system_role_res` VALUES ('4884', '121', '4');
INSERT INTO `system_role_res` VALUES ('4885', '122', '4');
INSERT INTO `system_role_res` VALUES ('4886', '3', '5');
INSERT INTO `system_role_res` VALUES ('4887', '12', '5');
INSERT INTO `system_role_res` VALUES ('4888', '17', '5');
INSERT INTO `system_role_res` VALUES ('4889', '14', '5');
INSERT INTO `system_role_res` VALUES ('4890', '23', '5');
INSERT INTO `system_role_res` VALUES ('4891', '4', '5');
INSERT INTO `system_role_res` VALUES ('4892', '25', '5');
INSERT INTO `system_role_res` VALUES ('4893', '26', '5');
INSERT INTO `system_role_res` VALUES ('4894', '27', '5');
INSERT INTO `system_role_res` VALUES ('4895', '31', '5');
INSERT INTO `system_role_res` VALUES ('4896', '43', '5');
INSERT INTO `system_role_res` VALUES ('4897', '44', '5');
INSERT INTO `system_role_res` VALUES ('4898', '32', '5');
INSERT INTO `system_role_res` VALUES ('4899', '46', '5');
INSERT INTO `system_role_res` VALUES ('4900', '47', '5');
INSERT INTO `system_role_res` VALUES ('4901', '35', '5');
INSERT INTO `system_role_res` VALUES ('4902', '39', '5');
INSERT INTO `system_role_res` VALUES ('4903', '6', '5');
INSERT INTO `system_role_res` VALUES ('4904', '66', '5');
INSERT INTO `system_role_res` VALUES ('4905', '134', '5');
INSERT INTO `system_role_res` VALUES ('4906', '67', '5');
INSERT INTO `system_role_res` VALUES ('4907', '135', '5');
INSERT INTO `system_role_res` VALUES ('4908', '68', '5');
INSERT INTO `system_role_res` VALUES ('4909', '136', '5');
INSERT INTO `system_role_res` VALUES ('4910', '139', '5');
INSERT INTO `system_role_res` VALUES ('4911', '140', '5');
INSERT INTO `system_role_res` VALUES ('4912', '8', '5');
INSERT INTO `system_role_res` VALUES ('4913', '69', '5');
INSERT INTO `system_role_res` VALUES ('4914', '10', '5');
INSERT INTO `system_role_res` VALUES ('4915', '80', '5');
INSERT INTO `system_role_res` VALUES ('4916', '81', '5');
INSERT INTO `system_role_res` VALUES ('4917', '82', '5');
INSERT INTO `system_role_res` VALUES ('4918', '85', '5');
INSERT INTO `system_role_res` VALUES ('4919', '86', '5');
INSERT INTO `system_role_res` VALUES ('4920', '87', '5');
INSERT INTO `system_role_res` VALUES ('4921', '89', '5');
INSERT INTO `system_role_res` VALUES ('4922', '90', '5');
INSERT INTO `system_role_res` VALUES ('4923', '91', '5');
INSERT INTO `system_role_res` VALUES ('4924', '93', '5');
INSERT INTO `system_role_res` VALUES ('4925', '94', '5');
INSERT INTO `system_role_res` VALUES ('4926', '96', '5');
INSERT INTO `system_role_res` VALUES ('4927', '97', '5');
INSERT INTO `system_role_res` VALUES ('4928', '95', '5');
INSERT INTO `system_role_res` VALUES ('4929', '98', '5');
INSERT INTO `system_role_res` VALUES ('4930', '99', '5');
INSERT INTO `system_role_res` VALUES ('4931', '102', '5');
INSERT INTO `system_role_res` VALUES ('4932', '104', '5');
INSERT INTO `system_role_res` VALUES ('4933', '109', '5');
INSERT INTO `system_role_res` VALUES ('4934', '129', '5');
INSERT INTO `system_role_res` VALUES ('4935', '110', '5');
INSERT INTO `system_role_res` VALUES ('4936', '33', '5');
INSERT INTO `system_role_res` VALUES ('4937', '49', '5');
INSERT INTO `system_role_res` VALUES ('4938', '34', '5');
INSERT INTO `system_role_res` VALUES ('4939', '36', '5');
INSERT INTO `system_role_res` VALUES ('4940', '111', '5');
INSERT INTO `system_role_res` VALUES ('4941', '112', '5');
INSERT INTO `system_role_res` VALUES ('4942', '114', '5');
INSERT INTO `system_role_res` VALUES ('4943', '115', '5');
INSERT INTO `system_role_res` VALUES ('4944', '116', '5');
INSERT INTO `system_role_res` VALUES ('4945', '118', '5');
INSERT INTO `system_role_res` VALUES ('4946', '119', '5');
INSERT INTO `system_role_res` VALUES ('4947', '120', '5');
INSERT INTO `system_role_res` VALUES ('4948', '138', '5');
INSERT INTO `system_role_res` VALUES ('4949', '1', '6');
INSERT INTO `system_role_res` VALUES ('4950', '3', '6');
INSERT INTO `system_role_res` VALUES ('4951', '12', '6');
INSERT INTO `system_role_res` VALUES ('4952', '16', '6');
INSERT INTO `system_role_res` VALUES ('4953', '17', '6');
INSERT INTO `system_role_res` VALUES ('4954', '18', '6');
INSERT INTO `system_role_res` VALUES ('4955', '4', '6');
INSERT INTO `system_role_res` VALUES ('4956', '25', '6');
INSERT INTO `system_role_res` VALUES ('4957', '26', '6');
INSERT INTO `system_role_res` VALUES ('4958', '27', '6');
INSERT INTO `system_role_res` VALUES ('4959', '31', '6');
INSERT INTO `system_role_res` VALUES ('4960', '43', '6');
INSERT INTO `system_role_res` VALUES ('4961', '44', '6');
INSERT INTO `system_role_res` VALUES ('4962', '32', '6');
INSERT INTO `system_role_res` VALUES ('4963', '46', '6');
INSERT INTO `system_role_res` VALUES ('4964', '47', '6');
INSERT INTO `system_role_res` VALUES ('4965', '35', '6');
INSERT INTO `system_role_res` VALUES ('4966', '39', '6');
INSERT INTO `system_role_res` VALUES ('4967', '40', '6');
INSERT INTO `system_role_res` VALUES ('4968', '6', '6');
INSERT INTO `system_role_res` VALUES ('4969', '66', '6');
INSERT INTO `system_role_res` VALUES ('4970', '134', '6');
INSERT INTO `system_role_res` VALUES ('4971', '67', '6');
INSERT INTO `system_role_res` VALUES ('4972', '135', '6');
INSERT INTO `system_role_res` VALUES ('4973', '68', '6');
INSERT INTO `system_role_res` VALUES ('4974', '136', '6');
INSERT INTO `system_role_res` VALUES ('4975', '139', '6');
INSERT INTO `system_role_res` VALUES ('4976', '140', '6');
INSERT INTO `system_role_res` VALUES ('4977', '8', '6');
INSERT INTO `system_role_res` VALUES ('4978', '69', '6');
INSERT INTO `system_role_res` VALUES ('4979', '9', '6');
INSERT INTO `system_role_res` VALUES ('4980', '20', '6');
INSERT INTO `system_role_res` VALUES ('4981', '10', '6');
INSERT INTO `system_role_res` VALUES ('4982', '80', '6');
INSERT INTO `system_role_res` VALUES ('4983', '81', '6');
INSERT INTO `system_role_res` VALUES ('4984', '82', '6');
INSERT INTO `system_role_res` VALUES ('4985', '83', '6');
INSERT INTO `system_role_res` VALUES ('4986', '85', '6');
INSERT INTO `system_role_res` VALUES ('4987', '86', '6');
INSERT INTO `system_role_res` VALUES ('4988', '87', '6');
INSERT INTO `system_role_res` VALUES ('4989', '89', '6');
INSERT INTO `system_role_res` VALUES ('4990', '90', '6');
INSERT INTO `system_role_res` VALUES ('4991', '91', '6');
INSERT INTO `system_role_res` VALUES ('4992', '93', '6');
INSERT INTO `system_role_res` VALUES ('4993', '94', '6');
INSERT INTO `system_role_res` VALUES ('4994', '96', '6');
INSERT INTO `system_role_res` VALUES ('4995', '97', '6');
INSERT INTO `system_role_res` VALUES ('4996', '95', '6');
INSERT INTO `system_role_res` VALUES ('4997', '98', '6');
INSERT INTO `system_role_res` VALUES ('4998', '99', '6');
INSERT INTO `system_role_res` VALUES ('4999', '102', '6');
INSERT INTO `system_role_res` VALUES ('5000', '103', '6');
INSERT INTO `system_role_res` VALUES ('5001', '104', '6');
INSERT INTO `system_role_res` VALUES ('5002', '109', '6');
INSERT INTO `system_role_res` VALUES ('5003', '129', '6');
INSERT INTO `system_role_res` VALUES ('5004', '110', '6');
INSERT INTO `system_role_res` VALUES ('5005', '33', '6');
INSERT INTO `system_role_res` VALUES ('5006', '49', '6');
INSERT INTO `system_role_res` VALUES ('5007', '34', '6');
INSERT INTO `system_role_res` VALUES ('5008', '36', '6');
INSERT INTO `system_role_res` VALUES ('5009', '111', '6');
INSERT INTO `system_role_res` VALUES ('5010', '112', '6');
INSERT INTO `system_role_res` VALUES ('5011', '113', '6');
INSERT INTO `system_role_res` VALUES ('5012', '114', '6');
INSERT INTO `system_role_res` VALUES ('5013', '115', '6');
INSERT INTO `system_role_res` VALUES ('5014', '116', '6');
INSERT INTO `system_role_res` VALUES ('5015', '118', '6');
INSERT INTO `system_role_res` VALUES ('5016', '119', '6');
INSERT INTO `system_role_res` VALUES ('5017', '138', '6');
INSERT INTO `system_role_res` VALUES ('5018', '3', '7');
INSERT INTO `system_role_res` VALUES ('5019', '12', '7');
INSERT INTO `system_role_res` VALUES ('5020', '16', '7');
INSERT INTO `system_role_res` VALUES ('5021', '17', '7');
INSERT INTO `system_role_res` VALUES ('5022', '18', '7');
INSERT INTO `system_role_res` VALUES ('5023', '19', '7');
INSERT INTO `system_role_res` VALUES ('5024', '14', '7');
INSERT INTO `system_role_res` VALUES ('5025', '23', '7');
INSERT INTO `system_role_res` VALUES ('5026', '4', '7');
INSERT INTO `system_role_res` VALUES ('5027', '25', '7');
INSERT INTO `system_role_res` VALUES ('5028', '26', '7');
INSERT INTO `system_role_res` VALUES ('5029', '27', '7');
INSERT INTO `system_role_res` VALUES ('5030', '31', '7');
INSERT INTO `system_role_res` VALUES ('5031', '43', '7');
INSERT INTO `system_role_res` VALUES ('5032', '44', '7');
INSERT INTO `system_role_res` VALUES ('5033', '32', '7');
INSERT INTO `system_role_res` VALUES ('5034', '46', '7');
INSERT INTO `system_role_res` VALUES ('5035', '47', '7');
INSERT INTO `system_role_res` VALUES ('5036', '35', '7');
INSERT INTO `system_role_res` VALUES ('5037', '39', '7');
INSERT INTO `system_role_res` VALUES ('5038', '6', '7');
INSERT INTO `system_role_res` VALUES ('5039', '66', '7');
INSERT INTO `system_role_res` VALUES ('5040', '134', '7');
INSERT INTO `system_role_res` VALUES ('5041', '67', '7');
INSERT INTO `system_role_res` VALUES ('5042', '135', '7');
INSERT INTO `system_role_res` VALUES ('5043', '68', '7');
INSERT INTO `system_role_res` VALUES ('5044', '136', '7');
INSERT INTO `system_role_res` VALUES ('5045', '139', '7');
INSERT INTO `system_role_res` VALUES ('5046', '140', '7');
INSERT INTO `system_role_res` VALUES ('5047', '8', '7');
INSERT INTO `system_role_res` VALUES ('5048', '69', '7');
INSERT INTO `system_role_res` VALUES ('5049', '9', '7');
INSERT INTO `system_role_res` VALUES ('5050', '20', '7');
INSERT INTO `system_role_res` VALUES ('5051', '10', '7');
INSERT INTO `system_role_res` VALUES ('5052', '80', '7');
INSERT INTO `system_role_res` VALUES ('5053', '81', '7');
INSERT INTO `system_role_res` VALUES ('5054', '82', '7');
INSERT INTO `system_role_res` VALUES ('5055', '85', '7');
INSERT INTO `system_role_res` VALUES ('5056', '86', '7');
INSERT INTO `system_role_res` VALUES ('5057', '87', '7');
INSERT INTO `system_role_res` VALUES ('5058', '89', '7');
INSERT INTO `system_role_res` VALUES ('5059', '90', '7');
INSERT INTO `system_role_res` VALUES ('5060', '91', '7');
INSERT INTO `system_role_res` VALUES ('5061', '93', '7');
INSERT INTO `system_role_res` VALUES ('5062', '94', '7');
INSERT INTO `system_role_res` VALUES ('5063', '96', '7');
INSERT INTO `system_role_res` VALUES ('5064', '97', '7');
INSERT INTO `system_role_res` VALUES ('5065', '95', '7');
INSERT INTO `system_role_res` VALUES ('5066', '98', '7');
INSERT INTO `system_role_res` VALUES ('5067', '99', '7');
INSERT INTO `system_role_res` VALUES ('5068', '102', '7');
INSERT INTO `system_role_res` VALUES ('5069', '103', '7');
INSERT INTO `system_role_res` VALUES ('5070', '104', '7');
INSERT INTO `system_role_res` VALUES ('5071', '109', '7');
INSERT INTO `system_role_res` VALUES ('5072', '129', '7');
INSERT INTO `system_role_res` VALUES ('5073', '33', '7');
INSERT INTO `system_role_res` VALUES ('5074', '49', '7');
INSERT INTO `system_role_res` VALUES ('5075', '34', '7');
INSERT INTO `system_role_res` VALUES ('5076', '36', '7');
INSERT INTO `system_role_res` VALUES ('5077', '111', '7');
INSERT INTO `system_role_res` VALUES ('5078', '112', '7');
INSERT INTO `system_role_res` VALUES ('5079', '113', '7');
INSERT INTO `system_role_res` VALUES ('5080', '114', '7');
INSERT INTO `system_role_res` VALUES ('5081', '115', '7');
INSERT INTO `system_role_res` VALUES ('5082', '116', '7');
INSERT INTO `system_role_res` VALUES ('5083', '138', '7');
INSERT INTO `system_role_res` VALUES ('5084', '4', '8');
INSERT INTO `system_role_res` VALUES ('5085', '25', '8');
INSERT INTO `system_role_res` VALUES ('5086', '26', '8');
INSERT INTO `system_role_res` VALUES ('5087', '27', '8');
INSERT INTO `system_role_res` VALUES ('5088', '31', '8');
INSERT INTO `system_role_res` VALUES ('5089', '43', '8');
INSERT INTO `system_role_res` VALUES ('5090', '44', '8');
INSERT INTO `system_role_res` VALUES ('5091', '32', '8');
INSERT INTO `system_role_res` VALUES ('5092', '46', '8');
INSERT INTO `system_role_res` VALUES ('5093', '47', '8');
INSERT INTO `system_role_res` VALUES ('5094', '35', '8');
INSERT INTO `system_role_res` VALUES ('5095', '39', '8');
INSERT INTO `system_role_res` VALUES ('5096', '8', '8');
INSERT INTO `system_role_res` VALUES ('5097', '69', '8');
INSERT INTO `system_role_res` VALUES ('5098', '9', '8');
INSERT INTO `system_role_res` VALUES ('5099', '20', '8');
INSERT INTO `system_role_res` VALUES ('5100', '109', '8');
INSERT INTO `system_role_res` VALUES ('5101', '129', '8');
INSERT INTO `system_role_res` VALUES ('5149', '3', '12');
INSERT INTO `system_role_res` VALUES ('5150', '12', '12');
INSERT INTO `system_role_res` VALUES ('5151', '18', '12');
INSERT INTO `system_role_res` VALUES ('5152', '19', '12');
INSERT INTO `system_role_res` VALUES ('5153', '21', '12');
INSERT INTO `system_role_res` VALUES ('5154', '22', '12');
INSERT INTO `system_role_res` VALUES ('5155', '53', '12');
INSERT INTO `system_role_res` VALUES ('5156', '13', '12');
INSERT INTO `system_role_res` VALUES ('5157', '14', '12');
INSERT INTO `system_role_res` VALUES ('5158', '23', '12');
INSERT INTO `system_role_res` VALUES ('5159', '24', '12');
INSERT INTO `system_role_res` VALUES ('5160', '4', '12');
INSERT INTO `system_role_res` VALUES ('5161', '25', '12');
INSERT INTO `system_role_res` VALUES ('5162', '26', '12');
INSERT INTO `system_role_res` VALUES ('5163', '27', '12');
INSERT INTO `system_role_res` VALUES ('5164', '31', '12');
INSERT INTO `system_role_res` VALUES ('5165', '43', '12');
INSERT INTO `system_role_res` VALUES ('5166', '44', '12');
INSERT INTO `system_role_res` VALUES ('5167', '32', '12');
INSERT INTO `system_role_res` VALUES ('5168', '46', '12');
INSERT INTO `system_role_res` VALUES ('5169', '47', '12');
INSERT INTO `system_role_res` VALUES ('5170', '35', '12');
INSERT INTO `system_role_res` VALUES ('5171', '39', '12');
INSERT INTO `system_role_res` VALUES ('5172', '8', '12');
INSERT INTO `system_role_res` VALUES ('5173', '69', '12');
INSERT INTO `system_role_res` VALUES ('5174', '109', '12');
INSERT INTO `system_role_res` VALUES ('5175', '129', '12');
INSERT INTO `system_role_res` VALUES ('5176', '3', '13');
INSERT INTO `system_role_res` VALUES ('5177', '12', '13');
INSERT INTO `system_role_res` VALUES ('5178', '19', '13');
INSERT INTO `system_role_res` VALUES ('5179', '21', '13');
INSERT INTO `system_role_res` VALUES ('5180', '22', '13');
INSERT INTO `system_role_res` VALUES ('5181', '53', '13');
INSERT INTO `system_role_res` VALUES ('5182', '14', '13');
INSERT INTO `system_role_res` VALUES ('5183', '23', '13');
INSERT INTO `system_role_res` VALUES ('5184', '24', '13');
INSERT INTO `system_role_res` VALUES ('5185', '4', '13');
INSERT INTO `system_role_res` VALUES ('5186', '25', '13');
INSERT INTO `system_role_res` VALUES ('5187', '26', '13');
INSERT INTO `system_role_res` VALUES ('5188', '27', '13');
INSERT INTO `system_role_res` VALUES ('5189', '31', '13');
INSERT INTO `system_role_res` VALUES ('5190', '43', '13');
INSERT INTO `system_role_res` VALUES ('5191', '44', '13');
INSERT INTO `system_role_res` VALUES ('5192', '32', '13');
INSERT INTO `system_role_res` VALUES ('5193', '46', '13');
INSERT INTO `system_role_res` VALUES ('5194', '47', '13');
INSERT INTO `system_role_res` VALUES ('5195', '35', '13');
INSERT INTO `system_role_res` VALUES ('5196', '39', '13');
INSERT INTO `system_role_res` VALUES ('5197', '8', '13');
INSERT INTO `system_role_res` VALUES ('5198', '69', '13');
INSERT INTO `system_role_res` VALUES ('5199', '109', '13');
INSERT INTO `system_role_res` VALUES ('5200', '129', '13');
INSERT INTO `system_role_res` VALUES ('5239', '4', '11');
INSERT INTO `system_role_res` VALUES ('5240', '25', '11');
INSERT INTO `system_role_res` VALUES ('5241', '26', '11');
INSERT INTO `system_role_res` VALUES ('5242', '27', '11');
INSERT INTO `system_role_res` VALUES ('5243', '28', '11');
INSERT INTO `system_role_res` VALUES ('5244', '29', '11');
INSERT INTO `system_role_res` VALUES ('5245', '30', '11');
INSERT INTO `system_role_res` VALUES ('5246', '31', '11');
INSERT INTO `system_role_res` VALUES ('5247', '43', '11');
INSERT INTO `system_role_res` VALUES ('5248', '44', '11');
INSERT INTO `system_role_res` VALUES ('5249', '45', '11');
INSERT INTO `system_role_res` VALUES ('5250', '32', '11');
INSERT INTO `system_role_res` VALUES ('5251', '46', '11');
INSERT INTO `system_role_res` VALUES ('5252', '47', '11');
INSERT INTO `system_role_res` VALUES ('5253', '48', '11');
INSERT INTO `system_role_res` VALUES ('5254', '35', '11');
INSERT INTO `system_role_res` VALUES ('5255', '39', '11');
INSERT INTO `system_role_res` VALUES ('5256', '40', '11');
INSERT INTO `system_role_res` VALUES ('5257', '41', '11');
INSERT INTO `system_role_res` VALUES ('5258', '42', '11');
INSERT INTO `system_role_res` VALUES ('5259', '108', '11');
INSERT INTO `system_role_res` VALUES ('5260', '8', '11');
INSERT INTO `system_role_res` VALUES ('5261', '69', '11');
INSERT INTO `system_role_res` VALUES ('5262', '109', '11');
INSERT INTO `system_role_res` VALUES ('5263', '129', '11');
INSERT INTO `system_role_res` VALUES ('5264', '110', '11');
INSERT INTO `system_role_res` VALUES ('5265', '33', '11');
INSERT INTO `system_role_res` VALUES ('5266', '49', '11');
INSERT INTO `system_role_res` VALUES ('5267', '50', '11');
INSERT INTO `system_role_res` VALUES ('5268', '51', '11');
INSERT INTO `system_role_res` VALUES ('5269', '52', '11');
INSERT INTO `system_role_res` VALUES ('5270', '137', '11');
INSERT INTO `system_role_res` VALUES ('5271', '34', '11');
INSERT INTO `system_role_res` VALUES ('5272', '36', '11');
INSERT INTO `system_role_res` VALUES ('5273', '37', '11');
INSERT INTO `system_role_res` VALUES ('5274', '38', '11');
INSERT INTO `system_role_res` VALUES ('5275', '111', '11');
INSERT INTO `system_role_res` VALUES ('5276', '112', '11');
INSERT INTO `system_role_res` VALUES ('5277', '113', '11');
INSERT INTO `system_role_res` VALUES ('5278', '114', '11');
INSERT INTO `system_role_res` VALUES ('5279', '115', '11');
INSERT INTO `system_role_res` VALUES ('5280', '116', '11');
INSERT INTO `system_role_res` VALUES ('5281', '117', '11');
INSERT INTO `system_role_res` VALUES ('5282', '118', '11');
INSERT INTO `system_role_res` VALUES ('5283', '119', '11');
INSERT INTO `system_role_res` VALUES ('5284', '120', '11');
INSERT INTO `system_role_res` VALUES ('5285', '138', '11');
INSERT INTO `system_role_res` VALUES ('5286', '93', '11');
INSERT INTO `system_role_res` VALUES ('5287', '94', '11');
INSERT INTO `system_role_res` VALUES ('5288', '97', '11');
INSERT INTO `system_role_res` VALUES ('5289', '107', '11');
INSERT INTO `system_role_res` VALUES ('5290', '4', '14');
INSERT INTO `system_role_res` VALUES ('5291', '25', '14');
INSERT INTO `system_role_res` VALUES ('5292', '27', '14');
INSERT INTO `system_role_res` VALUES ('5293', '30', '14');
INSERT INTO `system_role_res` VALUES ('5294', '31', '14');
INSERT INTO `system_role_res` VALUES ('5295', '43', '14');
INSERT INTO `system_role_res` VALUES ('5296', '44', '14');
INSERT INTO `system_role_res` VALUES ('5297', '45', '14');
INSERT INTO `system_role_res` VALUES ('5298', '32', '14');
INSERT INTO `system_role_res` VALUES ('5299', '46', '14');
INSERT INTO `system_role_res` VALUES ('5300', '47', '14');
INSERT INTO `system_role_res` VALUES ('5301', '48', '14');
INSERT INTO `system_role_res` VALUES ('5302', '35', '14');
INSERT INTO `system_role_res` VALUES ('5303', '39', '14');
INSERT INTO `system_role_res` VALUES ('5304', '40', '14');
INSERT INTO `system_role_res` VALUES ('5305', '41', '14');
INSERT INTO `system_role_res` VALUES ('5306', '42', '14');
INSERT INTO `system_role_res` VALUES ('5307', '108', '14');
INSERT INTO `system_role_res` VALUES ('5308', '110', '14');
INSERT INTO `system_role_res` VALUES ('5309', '33', '14');
INSERT INTO `system_role_res` VALUES ('5310', '49', '14');
INSERT INTO `system_role_res` VALUES ('5311', '52', '14');
INSERT INTO `system_role_res` VALUES ('5312', '34', '14');
INSERT INTO `system_role_res` VALUES ('5313', '36', '14');
INSERT INTO `system_role_res` VALUES ('5314', '111', '14');
INSERT INTO `system_role_res` VALUES ('5315', '112', '14');
INSERT INTO `system_role_res` VALUES ('5316', '114', '14');
INSERT INTO `system_role_res` VALUES ('5317', '115', '14');
INSERT INTO `system_role_res` VALUES ('5318', '116', '14');
INSERT INTO `system_role_res` VALUES ('5319', '118', '14');
INSERT INTO `system_role_res` VALUES ('5320', '119', '14');
INSERT INTO `system_role_res` VALUES ('5321', '138', '14');
INSERT INTO `system_role_res` VALUES ('5322', '121', '14');
INSERT INTO `system_role_res` VALUES ('5323', '122', '14');
INSERT INTO `system_role_res` VALUES ('5324', '123', '14');
INSERT INTO `system_role_res` VALUES ('5325', '124', '14');
INSERT INTO `system_role_res` VALUES ('5326', '125', '14');
INSERT INTO `system_role_res` VALUES ('5327', '126', '14');
INSERT INTO `system_role_res` VALUES ('5328', '93', '14');
INSERT INTO `system_role_res` VALUES ('5329', '94', '14');
INSERT INTO `system_role_res` VALUES ('5330', '97', '14');
INSERT INTO `system_role_res` VALUES ('5331', '107', '14');
INSERT INTO `system_role_res` VALUES ('5332', '109', '14');
INSERT INTO `system_role_res` VALUES ('5333', '129', '14');
INSERT INTO `system_role_res` VALUES ('5334', '4', '16');
INSERT INTO `system_role_res` VALUES ('5335', '25', '16');
INSERT INTO `system_role_res` VALUES ('5336', '26', '16');
INSERT INTO `system_role_res` VALUES ('5337', '27', '16');
INSERT INTO `system_role_res` VALUES ('5338', '31', '16');
INSERT INTO `system_role_res` VALUES ('5339', '43', '16');
INSERT INTO `system_role_res` VALUES ('5340', '44', '16');
INSERT INTO `system_role_res` VALUES ('5341', '32', '16');
INSERT INTO `system_role_res` VALUES ('5342', '46', '16');
INSERT INTO `system_role_res` VALUES ('5343', '47', '16');
INSERT INTO `system_role_res` VALUES ('5344', '35', '16');
INSERT INTO `system_role_res` VALUES ('5345', '39', '16');
INSERT INTO `system_role_res` VALUES ('5346', '8', '16');
INSERT INTO `system_role_res` VALUES ('5347', '69', '16');
INSERT INTO `system_role_res` VALUES ('5348', '9', '16');
INSERT INTO `system_role_res` VALUES ('5349', '20', '16');
INSERT INTO `system_role_res` VALUES ('5350', '109', '16');
INSERT INTO `system_role_res` VALUES ('5351', '129', '16');
INSERT INTO `system_role_res` VALUES ('5352', '4', '15');
INSERT INTO `system_role_res` VALUES ('5353', '25', '15');
INSERT INTO `system_role_res` VALUES ('5354', '26', '15');
INSERT INTO `system_role_res` VALUES ('5355', '27', '15');
INSERT INTO `system_role_res` VALUES ('5356', '31', '15');
INSERT INTO `system_role_res` VALUES ('5357', '43', '15');
INSERT INTO `system_role_res` VALUES ('5358', '44', '15');
INSERT INTO `system_role_res` VALUES ('5359', '32', '15');
INSERT INTO `system_role_res` VALUES ('5360', '46', '15');
INSERT INTO `system_role_res` VALUES ('5361', '47', '15');
INSERT INTO `system_role_res` VALUES ('5362', '35', '15');
INSERT INTO `system_role_res` VALUES ('5363', '39', '15');
INSERT INTO `system_role_res` VALUES ('5364', '8', '15');
INSERT INTO `system_role_res` VALUES ('5365', '69', '15');
INSERT INTO `system_role_res` VALUES ('5366', '93', '15');
INSERT INTO `system_role_res` VALUES ('5367', '95', '15');
INSERT INTO `system_role_res` VALUES ('5368', '98', '15');
INSERT INTO `system_role_res` VALUES ('5369', '99', '15');
INSERT INTO `system_role_res` VALUES ('5370', '100', '15');
INSERT INTO `system_role_res` VALUES ('5371', '102', '15');
INSERT INTO `system_role_res` VALUES ('5372', '104', '15');
INSERT INTO `system_role_res` VALUES ('5373', '105', '15');
INSERT INTO `system_role_res` VALUES ('5374', '106', '15');
INSERT INTO `system_role_res` VALUES ('5375', '109', '15');
INSERT INTO `system_role_res` VALUES ('5376', '129', '15');
INSERT INTO `system_role_res` VALUES ('5377', '4', '17');
INSERT INTO `system_role_res` VALUES ('5378', '25', '17');
INSERT INTO `system_role_res` VALUES ('5379', '26', '17');
INSERT INTO `system_role_res` VALUES ('5380', '27', '17');
INSERT INTO `system_role_res` VALUES ('5381', '28', '17');
INSERT INTO `system_role_res` VALUES ('5382', '29', '17');
INSERT INTO `system_role_res` VALUES ('5383', '31', '17');
INSERT INTO `system_role_res` VALUES ('5384', '43', '17');
INSERT INTO `system_role_res` VALUES ('5385', '44', '17');
INSERT INTO `system_role_res` VALUES ('5386', '32', '17');
INSERT INTO `system_role_res` VALUES ('5387', '46', '17');
INSERT INTO `system_role_res` VALUES ('5388', '47', '17');
INSERT INTO `system_role_res` VALUES ('5389', '35', '17');
INSERT INTO `system_role_res` VALUES ('5390', '39', '17');
INSERT INTO `system_role_res` VALUES ('5391', '8', '17');
INSERT INTO `system_role_res` VALUES ('5392', '69', '17');
INSERT INTO `system_role_res` VALUES ('5393', '109', '17');
INSERT INTO `system_role_res` VALUES ('5394', '129', '17');
INSERT INTO `system_role_res` VALUES ('5395', '4', '18');
INSERT INTO `system_role_res` VALUES ('5396', '25', '18');
INSERT INTO `system_role_res` VALUES ('5397', '26', '18');
INSERT INTO `system_role_res` VALUES ('5398', '27', '18');
INSERT INTO `system_role_res` VALUES ('5399', '31', '18');
INSERT INTO `system_role_res` VALUES ('5400', '44', '18');
INSERT INTO `system_role_res` VALUES ('5401', '45', '18');
INSERT INTO `system_role_res` VALUES ('5402', '32', '18');
INSERT INTO `system_role_res` VALUES ('5403', '35', '18');
INSERT INTO `system_role_res` VALUES ('5404', '39', '18');
INSERT INTO `system_role_res` VALUES ('5405', '10', '18');
INSERT INTO `system_role_res` VALUES ('5406', '80', '18');
INSERT INTO `system_role_res` VALUES ('5407', '81', '18');
INSERT INTO `system_role_res` VALUES ('5408', '82', '18');
INSERT INTO `system_role_res` VALUES ('5409', '83', '18');
INSERT INTO `system_role_res` VALUES ('5410', '84', '18');
INSERT INTO `system_role_res` VALUES ('5411', '85', '18');
INSERT INTO `system_role_res` VALUES ('5412', '86', '18');
INSERT INTO `system_role_res` VALUES ('5413', '87', '18');
INSERT INTO `system_role_res` VALUES ('5414', '88', '18');
INSERT INTO `system_role_res` VALUES ('5415', '89', '18');
INSERT INTO `system_role_res` VALUES ('5416', '90', '18');
INSERT INTO `system_role_res` VALUES ('5417', '91', '18');
INSERT INTO `system_role_res` VALUES ('5418', '92', '18');
INSERT INTO `system_role_res` VALUES ('5419', '109', '18');
INSERT INTO `system_role_res` VALUES ('5420', '129', '18');
INSERT INTO `system_role_res` VALUES ('5421', '4', '19');
INSERT INTO `system_role_res` VALUES ('5422', '25', '19');
INSERT INTO `system_role_res` VALUES ('5423', '27', '19');
INSERT INTO `system_role_res` VALUES ('5424', '30', '19');
INSERT INTO `system_role_res` VALUES ('5425', '31', '19');
INSERT INTO `system_role_res` VALUES ('5426', '43', '19');
INSERT INTO `system_role_res` VALUES ('5427', '44', '19');
INSERT INTO `system_role_res` VALUES ('5428', '45', '19');
INSERT INTO `system_role_res` VALUES ('5429', '32', '19');
INSERT INTO `system_role_res` VALUES ('5430', '46', '19');
INSERT INTO `system_role_res` VALUES ('5431', '47', '19');
INSERT INTO `system_role_res` VALUES ('5432', '48', '19');
INSERT INTO `system_role_res` VALUES ('5433', '35', '19');
INSERT INTO `system_role_res` VALUES ('5434', '39', '19');
INSERT INTO `system_role_res` VALUES ('5435', '40', '19');
INSERT INTO `system_role_res` VALUES ('5436', '41', '19');
INSERT INTO `system_role_res` VALUES ('5437', '42', '19');
INSERT INTO `system_role_res` VALUES ('5438', '108', '19');
INSERT INTO `system_role_res` VALUES ('5439', '6', '19');
INSERT INTO `system_role_res` VALUES ('5440', '66', '19');
INSERT INTO `system_role_res` VALUES ('5441', '134', '19');
INSERT INTO `system_role_res` VALUES ('5442', '142', '19');
INSERT INTO `system_role_res` VALUES ('5443', '67', '19');
INSERT INTO `system_role_res` VALUES ('5444', '135', '19');
INSERT INTO `system_role_res` VALUES ('5445', '8', '19');
INSERT INTO `system_role_res` VALUES ('5446', '69', '19');
INSERT INTO `system_role_res` VALUES ('5447', '109', '19');
INSERT INTO `system_role_res` VALUES ('5448', '129', '19');
INSERT INTO `system_role_res` VALUES ('5449', '2', '28');
INSERT INTO `system_role_res` VALUES ('5450', '130', '28');
INSERT INTO `system_role_res` VALUES ('5451', '131', '28');
INSERT INTO `system_role_res` VALUES ('5452', '4', '23');
INSERT INTO `system_role_res` VALUES ('5453', '25', '23');
INSERT INTO `system_role_res` VALUES ('5454', '27', '23');
INSERT INTO `system_role_res` VALUES ('5455', '29', '23');
INSERT INTO `system_role_res` VALUES ('5456', '31', '23');
INSERT INTO `system_role_res` VALUES ('5457', '44', '23');
INSERT INTO `system_role_res` VALUES ('5458', '32', '23');
INSERT INTO `system_role_res` VALUES ('5459', '47', '23');
INSERT INTO `system_role_res` VALUES ('5460', '35', '23');
INSERT INTO `system_role_res` VALUES ('5461', '39', '23');
INSERT INTO `system_role_res` VALUES ('5462', '8', '23');
INSERT INTO `system_role_res` VALUES ('5463', '69', '23');
INSERT INTO `system_role_res` VALUES ('5464', '109', '23');
INSERT INTO `system_role_res` VALUES ('5465', '129', '23');
INSERT INTO `system_role_res` VALUES ('5466', '4', '24');
INSERT INTO `system_role_res` VALUES ('5467', '25', '24');
INSERT INTO `system_role_res` VALUES ('5468', '27', '24');
INSERT INTO `system_role_res` VALUES ('5469', '28', '24');
INSERT INTO `system_role_res` VALUES ('5470', '30', '24');
INSERT INTO `system_role_res` VALUES ('5471', '31', '24');
INSERT INTO `system_role_res` VALUES ('5472', '44', '24');
INSERT INTO `system_role_res` VALUES ('5473', '45', '24');
INSERT INTO `system_role_res` VALUES ('5474', '32', '24');
INSERT INTO `system_role_res` VALUES ('5475', '47', '24');
INSERT INTO `system_role_res` VALUES ('5476', '48', '24');
INSERT INTO `system_role_res` VALUES ('5477', '35', '24');
INSERT INTO `system_role_res` VALUES ('5478', '39', '24');
INSERT INTO `system_role_res` VALUES ('5479', '40', '24');
INSERT INTO `system_role_res` VALUES ('5480', '41', '24');
INSERT INTO `system_role_res` VALUES ('5481', '42', '24');
INSERT INTO `system_role_res` VALUES ('5482', '108', '24');
INSERT INTO `system_role_res` VALUES ('5483', '8', '24');
INSERT INTO `system_role_res` VALUES ('5484', '69', '24');
INSERT INTO `system_role_res` VALUES ('5485', '109', '24');
INSERT INTO `system_role_res` VALUES ('5486', '129', '24');
INSERT INTO `system_role_res` VALUES ('5487', '3', '25');
INSERT INTO `system_role_res` VALUES ('5488', '12', '25');
INSERT INTO `system_role_res` VALUES ('5489', '16', '25');
INSERT INTO `system_role_res` VALUES ('5490', '17', '25');
INSERT INTO `system_role_res` VALUES ('5491', '18', '25');
INSERT INTO `system_role_res` VALUES ('5492', '14', '25');
INSERT INTO `system_role_res` VALUES ('5493', '23', '25');
INSERT INTO `system_role_res` VALUES ('5494', '4', '25');
INSERT INTO `system_role_res` VALUES ('5495', '25', '25');
INSERT INTO `system_role_res` VALUES ('5496', '26', '25');
INSERT INTO `system_role_res` VALUES ('5497', '27', '25');
INSERT INTO `system_role_res` VALUES ('5498', '31', '25');
INSERT INTO `system_role_res` VALUES ('5499', '43', '25');
INSERT INTO `system_role_res` VALUES ('5500', '44', '25');
INSERT INTO `system_role_res` VALUES ('5501', '32', '25');
INSERT INTO `system_role_res` VALUES ('5502', '46', '25');
INSERT INTO `system_role_res` VALUES ('5503', '47', '25');
INSERT INTO `system_role_res` VALUES ('5504', '35', '25');
INSERT INTO `system_role_res` VALUES ('5505', '39', '25');
INSERT INTO `system_role_res` VALUES ('5506', '6', '25');
INSERT INTO `system_role_res` VALUES ('5507', '66', '25');
INSERT INTO `system_role_res` VALUES ('5508', '134', '25');
INSERT INTO `system_role_res` VALUES ('5509', '67', '25');
INSERT INTO `system_role_res` VALUES ('5510', '135', '25');
INSERT INTO `system_role_res` VALUES ('5511', '68', '25');
INSERT INTO `system_role_res` VALUES ('5512', '136', '25');
INSERT INTO `system_role_res` VALUES ('5513', '139', '25');
INSERT INTO `system_role_res` VALUES ('5514', '140', '25');
INSERT INTO `system_role_res` VALUES ('5515', '8', '25');
INSERT INTO `system_role_res` VALUES ('5516', '69', '25');
INSERT INTO `system_role_res` VALUES ('5517', '9', '25');
INSERT INTO `system_role_res` VALUES ('5518', '20', '25');
INSERT INTO `system_role_res` VALUES ('5519', '10', '25');
INSERT INTO `system_role_res` VALUES ('5520', '80', '25');
INSERT INTO `system_role_res` VALUES ('5521', '81', '25');
INSERT INTO `system_role_res` VALUES ('5522', '82', '25');
INSERT INTO `system_role_res` VALUES ('5523', '85', '25');
INSERT INTO `system_role_res` VALUES ('5524', '86', '25');
INSERT INTO `system_role_res` VALUES ('5525', '87', '25');
INSERT INTO `system_role_res` VALUES ('5526', '89', '25');
INSERT INTO `system_role_res` VALUES ('5527', '90', '25');
INSERT INTO `system_role_res` VALUES ('5528', '91', '25');
INSERT INTO `system_role_res` VALUES ('5529', '93', '25');
INSERT INTO `system_role_res` VALUES ('5530', '94', '25');
INSERT INTO `system_role_res` VALUES ('5531', '96', '25');
INSERT INTO `system_role_res` VALUES ('5532', '97', '25');
INSERT INTO `system_role_res` VALUES ('5533', '95', '25');
INSERT INTO `system_role_res` VALUES ('5534', '98', '25');
INSERT INTO `system_role_res` VALUES ('5535', '99', '25');
INSERT INTO `system_role_res` VALUES ('5536', '102', '25');
INSERT INTO `system_role_res` VALUES ('5537', '103', '25');
INSERT INTO `system_role_res` VALUES ('5538', '104', '25');
INSERT INTO `system_role_res` VALUES ('5539', '109', '25');
INSERT INTO `system_role_res` VALUES ('5540', '129', '25');
INSERT INTO `system_role_res` VALUES ('5541', '110', '25');
INSERT INTO `system_role_res` VALUES ('5542', '33', '25');
INSERT INTO `system_role_res` VALUES ('5543', '49', '25');
INSERT INTO `system_role_res` VALUES ('5544', '34', '25');
INSERT INTO `system_role_res` VALUES ('5545', '36', '25');
INSERT INTO `system_role_res` VALUES ('5546', '37', '25');
INSERT INTO `system_role_res` VALUES ('5547', '111', '25');
INSERT INTO `system_role_res` VALUES ('5548', '112', '25');
INSERT INTO `system_role_res` VALUES ('5549', '113', '25');
INSERT INTO `system_role_res` VALUES ('5550', '114', '25');
INSERT INTO `system_role_res` VALUES ('5551', '115', '25');
INSERT INTO `system_role_res` VALUES ('5552', '116', '25');
INSERT INTO `system_role_res` VALUES ('5553', '138', '25');
INSERT INTO `system_role_res` VALUES ('5554', '25', '26');
INSERT INTO `system_role_res` VALUES ('5555', '27', '26');
INSERT INTO `system_role_res` VALUES ('5556', '31', '26');
INSERT INTO `system_role_res` VALUES ('5557', '44', '26');
INSERT INTO `system_role_res` VALUES ('5558', '32', '26');
INSERT INTO `system_role_res` VALUES ('5559', '47', '26');
INSERT INTO `system_role_res` VALUES ('5560', '35', '26');
INSERT INTO `system_role_res` VALUES ('5561', '39', '26');
INSERT INTO `system_role_res` VALUES ('5562', '6', '26');
INSERT INTO `system_role_res` VALUES ('5563', '66', '26');
INSERT INTO `system_role_res` VALUES ('5564', '134', '26');
INSERT INTO `system_role_res` VALUES ('5565', '67', '26');
INSERT INTO `system_role_res` VALUES ('5566', '135', '26');
INSERT INTO `system_role_res` VALUES ('5567', '68', '26');
INSERT INTO `system_role_res` VALUES ('5568', '136', '26');
INSERT INTO `system_role_res` VALUES ('5569', '139', '26');
INSERT INTO `system_role_res` VALUES ('5570', '140', '26');
INSERT INTO `system_role_res` VALUES ('5571', '8', '26');
INSERT INTO `system_role_res` VALUES ('5572', '69', '26');
INSERT INTO `system_role_res` VALUES ('5573', '109', '26');
INSERT INTO `system_role_res` VALUES ('5574', '129', '26');
INSERT INTO `system_role_res` VALUES ('5575', '12', '27');
INSERT INTO `system_role_res` VALUES ('5576', '16', '27');
INSERT INTO `system_role_res` VALUES ('5577', '17', '27');
INSERT INTO `system_role_res` VALUES ('5578', '14', '27');
INSERT INTO `system_role_res` VALUES ('5579', '23', '27');
INSERT INTO `system_role_res` VALUES ('5580', '4', '27');
INSERT INTO `system_role_res` VALUES ('5581', '25', '27');
INSERT INTO `system_role_res` VALUES ('5582', '26', '27');
INSERT INTO `system_role_res` VALUES ('5583', '27', '27');
INSERT INTO `system_role_res` VALUES ('5584', '31', '27');
INSERT INTO `system_role_res` VALUES ('5585', '43', '27');
INSERT INTO `system_role_res` VALUES ('5586', '44', '27');
INSERT INTO `system_role_res` VALUES ('5587', '32', '27');
INSERT INTO `system_role_res` VALUES ('5588', '46', '27');
INSERT INTO `system_role_res` VALUES ('5589', '47', '27');
INSERT INTO `system_role_res` VALUES ('5590', '35', '27');
INSERT INTO `system_role_res` VALUES ('5591', '39', '27');
INSERT INTO `system_role_res` VALUES ('5592', '6', '27');
INSERT INTO `system_role_res` VALUES ('5593', '66', '27');
INSERT INTO `system_role_res` VALUES ('5594', '134', '27');
INSERT INTO `system_role_res` VALUES ('5595', '67', '27');
INSERT INTO `system_role_res` VALUES ('5596', '135', '27');
INSERT INTO `system_role_res` VALUES ('5597', '68', '27');
INSERT INTO `system_role_res` VALUES ('5598', '136', '27');
INSERT INTO `system_role_res` VALUES ('5599', '139', '27');
INSERT INTO `system_role_res` VALUES ('5600', '140', '27');
INSERT INTO `system_role_res` VALUES ('5601', '8', '27');
INSERT INTO `system_role_res` VALUES ('5602', '69', '27');
INSERT INTO `system_role_res` VALUES ('5603', '9', '27');
INSERT INTO `system_role_res` VALUES ('5604', '20', '27');
INSERT INTO `system_role_res` VALUES ('5605', '10', '27');
INSERT INTO `system_role_res` VALUES ('5606', '80', '27');
INSERT INTO `system_role_res` VALUES ('5607', '81', '27');
INSERT INTO `system_role_res` VALUES ('5608', '82', '27');
INSERT INTO `system_role_res` VALUES ('5609', '85', '27');
INSERT INTO `system_role_res` VALUES ('5610', '86', '27');
INSERT INTO `system_role_res` VALUES ('5611', '87', '27');
INSERT INTO `system_role_res` VALUES ('5612', '89', '27');
INSERT INTO `system_role_res` VALUES ('5613', '90', '27');
INSERT INTO `system_role_res` VALUES ('5614', '91', '27');
INSERT INTO `system_role_res` VALUES ('5615', '93', '27');
INSERT INTO `system_role_res` VALUES ('5616', '94', '27');
INSERT INTO `system_role_res` VALUES ('5617', '96', '27');
INSERT INTO `system_role_res` VALUES ('5618', '97', '27');
INSERT INTO `system_role_res` VALUES ('5619', '95', '27');
INSERT INTO `system_role_res` VALUES ('5620', '98', '27');
INSERT INTO `system_role_res` VALUES ('5621', '99', '27');
INSERT INTO `system_role_res` VALUES ('5622', '102', '27');
INSERT INTO `system_role_res` VALUES ('5623', '103', '27');
INSERT INTO `system_role_res` VALUES ('5624', '104', '27');
INSERT INTO `system_role_res` VALUES ('5625', '109', '27');
INSERT INTO `system_role_res` VALUES ('5626', '129', '27');
INSERT INTO `system_role_res` VALUES ('5627', '33', '27');
INSERT INTO `system_role_res` VALUES ('5628', '49', '27');
INSERT INTO `system_role_res` VALUES ('5629', '34', '27');
INSERT INTO `system_role_res` VALUES ('5630', '36', '27');
INSERT INTO `system_role_res` VALUES ('5631', '111', '27');
INSERT INTO `system_role_res` VALUES ('5632', '112', '27');
INSERT INTO `system_role_res` VALUES ('5633', '113', '27');
INSERT INTO `system_role_res` VALUES ('5634', '114', '27');
INSERT INTO `system_role_res` VALUES ('5635', '115', '27');
INSERT INTO `system_role_res` VALUES ('5636', '116', '27');
INSERT INTO `system_role_res` VALUES ('5637', '138', '27');
INSERT INTO `system_role_res` VALUES ('5638', '121', '27');
INSERT INTO `system_role_res` VALUES ('5639', '122', '27');
INSERT INTO `system_role_res` VALUES ('5640', '126', '27');
INSERT INTO `system_role_res` VALUES ('5641', '1', '29');
INSERT INTO `system_role_res` VALUES ('5642', '3', '29');
INSERT INTO `system_role_res` VALUES ('5643', '12', '29');
INSERT INTO `system_role_res` VALUES ('5644', '16', '29');
INSERT INTO `system_role_res` VALUES ('5645', '17', '29');
INSERT INTO `system_role_res` VALUES ('5646', '18', '29');
INSERT INTO `system_role_res` VALUES ('5647', '14', '29');
INSERT INTO `system_role_res` VALUES ('5648', '23', '29');
INSERT INTO `system_role_res` VALUES ('5649', '4', '29');
INSERT INTO `system_role_res` VALUES ('5650', '25', '29');
INSERT INTO `system_role_res` VALUES ('5651', '26', '29');
INSERT INTO `system_role_res` VALUES ('5652', '27', '29');
INSERT INTO `system_role_res` VALUES ('5653', '31', '29');
INSERT INTO `system_role_res` VALUES ('5654', '43', '29');
INSERT INTO `system_role_res` VALUES ('5655', '44', '29');
INSERT INTO `system_role_res` VALUES ('5656', '32', '29');
INSERT INTO `system_role_res` VALUES ('5657', '46', '29');
INSERT INTO `system_role_res` VALUES ('5658', '47', '29');
INSERT INTO `system_role_res` VALUES ('5659', '35', '29');
INSERT INTO `system_role_res` VALUES ('5660', '39', '29');
INSERT INTO `system_role_res` VALUES ('5661', '6', '29');
INSERT INTO `system_role_res` VALUES ('5662', '66', '29');
INSERT INTO `system_role_res` VALUES ('5663', '134', '29');
INSERT INTO `system_role_res` VALUES ('5664', '67', '29');
INSERT INTO `system_role_res` VALUES ('5665', '135', '29');
INSERT INTO `system_role_res` VALUES ('5666', '68', '29');
INSERT INTO `system_role_res` VALUES ('5667', '136', '29');
INSERT INTO `system_role_res` VALUES ('5668', '8', '29');
INSERT INTO `system_role_res` VALUES ('5669', '69', '29');
INSERT INTO `system_role_res` VALUES ('5670', '9', '29');
INSERT INTO `system_role_res` VALUES ('5671', '20', '29');
INSERT INTO `system_role_res` VALUES ('5672', '10', '29');
INSERT INTO `system_role_res` VALUES ('5673', '80', '29');
INSERT INTO `system_role_res` VALUES ('5674', '81', '29');
INSERT INTO `system_role_res` VALUES ('5675', '82', '29');
INSERT INTO `system_role_res` VALUES ('5676', '85', '29');
INSERT INTO `system_role_res` VALUES ('5677', '86', '29');
INSERT INTO `system_role_res` VALUES ('5678', '87', '29');
INSERT INTO `system_role_res` VALUES ('5679', '89', '29');
INSERT INTO `system_role_res` VALUES ('5680', '90', '29');
INSERT INTO `system_role_res` VALUES ('5681', '91', '29');
INSERT INTO `system_role_res` VALUES ('5682', '93', '29');
INSERT INTO `system_role_res` VALUES ('5683', '94', '29');
INSERT INTO `system_role_res` VALUES ('5684', '96', '29');
INSERT INTO `system_role_res` VALUES ('5685', '97', '29');
INSERT INTO `system_role_res` VALUES ('5686', '95', '29');
INSERT INTO `system_role_res` VALUES ('5687', '98', '29');
INSERT INTO `system_role_res` VALUES ('5688', '99', '29');
INSERT INTO `system_role_res` VALUES ('5689', '102', '29');
INSERT INTO `system_role_res` VALUES ('5690', '103', '29');
INSERT INTO `system_role_res` VALUES ('5691', '104', '29');
INSERT INTO `system_role_res` VALUES ('5692', '109', '29');
INSERT INTO `system_role_res` VALUES ('5693', '129', '29');
INSERT INTO `system_role_res` VALUES ('5694', '110', '29');
INSERT INTO `system_role_res` VALUES ('5695', '33', '29');
INSERT INTO `system_role_res` VALUES ('5696', '49', '29');
INSERT INTO `system_role_res` VALUES ('5697', '34', '29');
INSERT INTO `system_role_res` VALUES ('5698', '36', '29');
INSERT INTO `system_role_res` VALUES ('5699', '111', '29');
INSERT INTO `system_role_res` VALUES ('5700', '112', '29');
INSERT INTO `system_role_res` VALUES ('5701', '113', '29');
INSERT INTO `system_role_res` VALUES ('5702', '114', '29');
INSERT INTO `system_role_res` VALUES ('5703', '115', '29');
INSERT INTO `system_role_res` VALUES ('5704', '116', '29');
INSERT INTO `system_role_res` VALUES ('5705', '118', '29');
INSERT INTO `system_role_res` VALUES ('5706', '119', '29');
INSERT INTO `system_role_res` VALUES ('5707', '120', '29');
INSERT INTO `system_role_res` VALUES ('5708', '138', '29');
INSERT INTO `system_role_res` VALUES ('5709', '121', '29');
INSERT INTO `system_role_res` VALUES ('5710', '122', '29');
INSERT INTO `system_role_res` VALUES ('5711', '126', '29');
INSERT INTO `system_role_res` VALUES ('5712', '3', '30');
INSERT INTO `system_role_res` VALUES ('5713', '12', '30');
INSERT INTO `system_role_res` VALUES ('5714', '16', '30');
INSERT INTO `system_role_res` VALUES ('5715', '17', '30');
INSERT INTO `system_role_res` VALUES ('5716', '18', '30');
INSERT INTO `system_role_res` VALUES ('5717', '14', '30');
INSERT INTO `system_role_res` VALUES ('5718', '23', '30');
INSERT INTO `system_role_res` VALUES ('5719', '4', '30');
INSERT INTO `system_role_res` VALUES ('5720', '25', '30');
INSERT INTO `system_role_res` VALUES ('5721', '26', '30');
INSERT INTO `system_role_res` VALUES ('5722', '27', '30');
INSERT INTO `system_role_res` VALUES ('5723', '31', '30');
INSERT INTO `system_role_res` VALUES ('5724', '43', '30');
INSERT INTO `system_role_res` VALUES ('5725', '44', '30');
INSERT INTO `system_role_res` VALUES ('5726', '32', '30');
INSERT INTO `system_role_res` VALUES ('5727', '46', '30');
INSERT INTO `system_role_res` VALUES ('5728', '47', '30');
INSERT INTO `system_role_res` VALUES ('5729', '35', '30');
INSERT INTO `system_role_res` VALUES ('5730', '39', '30');
INSERT INTO `system_role_res` VALUES ('5731', '6', '30');
INSERT INTO `system_role_res` VALUES ('5732', '66', '30');
INSERT INTO `system_role_res` VALUES ('5733', '134', '30');
INSERT INTO `system_role_res` VALUES ('5734', '142', '30');
INSERT INTO `system_role_res` VALUES ('5735', '67', '30');
INSERT INTO `system_role_res` VALUES ('5736', '135', '30');
INSERT INTO `system_role_res` VALUES ('5737', '68', '30');
INSERT INTO `system_role_res` VALUES ('5738', '136', '30');
INSERT INTO `system_role_res` VALUES ('5739', '132', '30');
INSERT INTO `system_role_res` VALUES ('5740', '133', '30');
INSERT INTO `system_role_res` VALUES ('5741', '139', '30');
INSERT INTO `system_role_res` VALUES ('5742', '140', '30');
INSERT INTO `system_role_res` VALUES ('5743', '141', '30');
INSERT INTO `system_role_res` VALUES ('5744', '8', '30');
INSERT INTO `system_role_res` VALUES ('5745', '69', '30');
INSERT INTO `system_role_res` VALUES ('5746', '9', '30');
INSERT INTO `system_role_res` VALUES ('5747', '20', '30');
INSERT INTO `system_role_res` VALUES ('5748', '10', '30');
INSERT INTO `system_role_res` VALUES ('5749', '80', '30');
INSERT INTO `system_role_res` VALUES ('5750', '81', '30');
INSERT INTO `system_role_res` VALUES ('5751', '82', '30');
INSERT INTO `system_role_res` VALUES ('5752', '85', '30');
INSERT INTO `system_role_res` VALUES ('5753', '86', '30');
INSERT INTO `system_role_res` VALUES ('5754', '87', '30');
INSERT INTO `system_role_res` VALUES ('5755', '89', '30');
INSERT INTO `system_role_res` VALUES ('5756', '90', '30');
INSERT INTO `system_role_res` VALUES ('5757', '91', '30');
INSERT INTO `system_role_res` VALUES ('5758', '93', '30');
INSERT INTO `system_role_res` VALUES ('5759', '94', '30');
INSERT INTO `system_role_res` VALUES ('5760', '96', '30');
INSERT INTO `system_role_res` VALUES ('5761', '97', '30');
INSERT INTO `system_role_res` VALUES ('5762', '95', '30');
INSERT INTO `system_role_res` VALUES ('5763', '98', '30');
INSERT INTO `system_role_res` VALUES ('5764', '99', '30');
INSERT INTO `system_role_res` VALUES ('5765', '102', '30');
INSERT INTO `system_role_res` VALUES ('5766', '103', '30');
INSERT INTO `system_role_res` VALUES ('5767', '104', '30');
INSERT INTO `system_role_res` VALUES ('5768', '109', '30');
INSERT INTO `system_role_res` VALUES ('5769', '129', '30');
INSERT INTO `system_role_res` VALUES ('5770', '110', '30');
INSERT INTO `system_role_res` VALUES ('5771', '33', '30');
INSERT INTO `system_role_res` VALUES ('5772', '49', '30');
INSERT INTO `system_role_res` VALUES ('5773', '34', '30');
INSERT INTO `system_role_res` VALUES ('5774', '36', '30');
INSERT INTO `system_role_res` VALUES ('5775', '111', '30');
INSERT INTO `system_role_res` VALUES ('5776', '112', '30');
INSERT INTO `system_role_res` VALUES ('5777', '113', '30');
INSERT INTO `system_role_res` VALUES ('5778', '114', '30');
INSERT INTO `system_role_res` VALUES ('5779', '115', '30');
INSERT INTO `system_role_res` VALUES ('5780', '116', '30');
INSERT INTO `system_role_res` VALUES ('5781', '118', '30');
INSERT INTO `system_role_res` VALUES ('5782', '119', '30');
INSERT INTO `system_role_res` VALUES ('5783', '138', '30');
INSERT INTO `system_role_res` VALUES ('5784', '122', '30');
INSERT INTO `system_role_res` VALUES ('5785', '123', '30');
INSERT INTO `system_role_res` VALUES ('5786', '126', '30');

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of system_user
-- ----------------------------
INSERT INTO `system_user` VALUES ('1', 'WNCD056', 'B5B1C07C180FEFC77671906F382488F2', 'B5B1C07C180FEFC77671906F382488F2', null, '01', '1', '1', 'images/guest.jpg', null, null, '1', null);

-- ----------------------------
-- Table structure for system_user_role
-- ----------------------------
DROP TABLE IF EXISTS `system_user_role`;
CREATE TABLE `system_user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=351 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of system_user_role
-- ----------------------------
INSERT INTO `system_user_role` VALUES ('1', '1', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tracking_record
-- ----------------------------

-- ----------------------------
-- Table structure for week_exam
-- ----------------------------
DROP TABLE IF EXISTS `week_exam`;
CREATE TABLE `week_exam` (
  `week_exam_id` int(11) NOT NULL AUTO_INCREMENT,
  `week_exam_student_id` int(11) NOT NULL,
  `phase` varchar(10) NOT NULL,
  `week` varchar(10) NOT NULL,
  `score` varchar(10) NOT NULL,
  `operator_id` varchar(10) DEFAULT NULL,
  `create_time` varchar(50) DEFAULT NULL,
  `update_time` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`week_exam_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of week_exam
-- ----------------------------

-- ----------------------------
-- View structure for viewclassandteacher
-- ----------------------------
DROP VIEW IF EXISTS `viewclassandteacher`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `viewclassandteacher` AS select `cs`.`work_id` AS `work_id`,`cs`.`headmaster_id` AS `headmaster_id`,`c`.`class_id` AS `class_id`,`c`.`class_no` AS `class_no`,`c`.`orientation` AS `orientation`,`c`.`phase` AS `phase` from (`class` `c` join `curriculum_schedule` `cs` on((`cs`.`class_id` = `c`.`class_id`))) where ((`cs`.`start_time` <= date_format(now(),'%Y-%m-%d')) and (`cs`.`end_time` >= date_format(now(),'%Y-%m-%d'))) ;

-- ----------------------------
-- View structure for viewcustomertracking
-- ----------------------------
DROP VIEW IF EXISTS `viewcustomertracking`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `viewcustomertracking` AS select `c`.`customer_id` AS `customer_id`,`c`.`work_id` AS `work_id`,`c`.`name` AS `name`,`c`.`tel` AS `tel`,`t`.`status` AS `status`,`t`.`tracking_time` AS `tracking_time`,`t`.`remark` AS `remark`,`t`.`create_time` AS `create_time`,`c`.`sex` AS `sex`,`c`.`education` AS `education`,`c`.`school` AS `school`,`c`.`major` AS `major`,`c`.`experience` AS `experience`,`c`.`intent` AS `intent`,`c`.`salary` AS `salary`,`c`.`qq` AS `qq`,`c`.`email` AS `email`,`e`.`employee_name` AS `employee_name` from ((`customer` `c` join `tracking_record` `t` on((`c`.`customer_id` = `t`.`tracking_record_customer_id`))) join `employee` `e` on((`t`.`work_id` = `e`.`work_id`))) order by `c`.`create_time` desc ;
