
CREATE DATABASE IF NOT EXISTS `cosinee` DEFAULT CHARSET utf8 COLLATE utf8_general_ci;

USE `cosinee`;

SET FOREIGN_KEY_CHECKS=0;

SET NAMES utf8;

-- MySQL dump 10.13  Distrib 8.0.19, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: cosinee
-- ------------------------------------------------------
-- Server version	5.7.29

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cs_callout_dialplan`
--

DROP TABLE IF EXISTS `cs_callout_dialplan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cs_callout_dialplan` (
  `id` varchar(32) NOT NULL COMMENT '主键',
  `name` varchar(50) NOT NULL COMMENT '计划名称',
  `voicechannel` varchar(32) NOT NULL COMMENT '语音渠道ID',
  `organ` varchar(32) NOT NULL COMMENT '技能组部门ID',
  `isrecord` bit(1) NOT NULL DEFAULT b'1' COMMENT '是否录音',
  `createtime` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建日期',
  `updatetime` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `orgi` varchar(32) NOT NULL COMMENT '租户ID',
  `isarchive` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否已删除',
  `executed` int(11) NOT NULL DEFAULT '0' COMMENT '执行次数',
  `targetnum` int(11) NOT NULL DEFAULT '0' COMMENT '目标客户总数',
  `status` varchar(20) NOT NULL DEFAULT 'stopped' COMMENT '状态',
  `executefirsttime` datetime DEFAULT NULL COMMENT '首次执行时间',
  `executelasttime` datetime DEFAULT NULL COMMENT '最近一次执行时间',
  `creater` varchar(32) NOT NULL COMMENT '创建人ID',
  `maxconcurrence` int(11) NOT NULL COMMENT '最大并发数',
  `curconcurrence` int(11) NOT NULL COMMENT '当前并发数',
  `concurrenceratio` float(10,5) NOT NULL COMMENT '坐席并发比',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='外呼计划表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cs_callout_dialplan`
--

LOCK TABLES `cs_callout_dialplan` WRITE;
/*!40000 ALTER TABLE `cs_callout_dialplan` DISABLE KEYS */;
/*!40000 ALTER TABLE `cs_callout_dialplan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cs_callout_log_dialplan`
--

DROP TABLE IF EXISTS `cs_callout_log_dialplan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cs_callout_log_dialplan` (
  `id` varchar(32) NOT NULL COMMENT '主键ID',
  `operator` varchar(32) DEFAULT NULL COMMENT '操作员ID',
  `module` varchar(128) DEFAULT NULL COMMENT '模块',
  `subitem` varchar(32) DEFAULT NULL COMMENT '子项',
  `operation` varchar(32) DEFAULT NULL COMMENT '操作内容',
  `status` tinyint(4) DEFAULT NULL COMMENT '操作状态',
  `detail` varchar(128) DEFAULT NULL COMMENT '细节',
  `ipaddr` varchar(255) DEFAULT NULL COMMENT '客户ip地址',
  `port` varchar(32) DEFAULT NULL COMMENT '客户ip端口',
  `url` longtext COMMENT 'url',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='拨号计划记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cs_callout_log_dialplan`
--

LOCK TABLES `cs_callout_log_dialplan` WRITE;
/*!40000 ALTER TABLE `cs_callout_log_dialplan` DISABLE KEYS */;
/*!40000 ALTER TABLE `cs_callout_log_dialplan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cs_callout_targets`
--

DROP TABLE IF EXISTS `cs_callout_targets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cs_callout_targets` (
  `id` varchar(32) NOT NULL COMMENT '主键',
  `orgi` varchar(32) NOT NULL COMMENT '租户ID',
  `organid` varchar(32) NOT NULL COMMENT '部门ID',
  `calls` int(11) NOT NULL DEFAULT '0' COMMENT '拨打次数',
  `failed` int(11) NOT NULL DEFAULT '0' COMMENT '拨打失败次数',
  `invalid` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否有效',
  `phone` varchar(20) NOT NULL COMMENT '电话号码',
  `country` varchar(20) DEFAULT '中国' COMMENT '国家',
  `province` varchar(20) DEFAULT NULL COMMENT '省份',
  `city` varchar(20) DEFAULT NULL COMMENT '城市',
  `dialplan` varchar(32) NOT NULL COMMENT '关联呼叫计划',
  `contactsid` varchar(32) DEFAULT NULL COMMENT '关联联系人ID',
  `createtime` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `updatetime` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='外呼计划目标客户';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cs_callout_targets`
--

LOCK TABLES `cs_callout_targets` WRITE;
/*!40000 ALTER TABLE `cs_callout_targets` DISABLE KEYS */;
/*!40000 ALTER TABLE `cs_callout_targets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cs_chatbot`
--

DROP TABLE IF EXISTS `cs_chatbot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cs_chatbot` (
  `ID` varchar(32) NOT NULL COMMENT '主键ID',
  `base_url` varchar(255) NOT NULL COMMENT '基础URL',
  `client_id` varchar(32) NOT NULL COMMENT 'Client Id',
  `secret` varchar(32) NOT NULL COMMENT 'Client Secret',
  `creater` varchar(32) NOT NULL COMMENT '创建人',
  `orgi` varchar(32) NOT NULL COMMENT '租户ID',
  `createtime` datetime NOT NULL COMMENT '创建时间',
  `updatetime` datetime NOT NULL COMMENT '更新时间',
  `name` varchar(255) NOT NULL COMMENT '聊天机器人名字',
  `description` varchar(255) NOT NULL COMMENT '描述',
  `primary_language` varchar(20) NOT NULL COMMENT '首选语言',
  `fallback` varchar(255) DEFAULT NULL COMMENT '兜底回复',
  `welcome` varchar(255) DEFAULT NULL COMMENT '欢迎语',
  `channel` varchar(32) NOT NULL COMMENT '渠道类型',
  `sns_account_identifier` varchar(100) NOT NULL COMMENT '渠道标识',
  `enabled` tinyint(1) DEFAULT '0' COMMENT '是否开启',
  `workmode` varchar(32) NOT NULL COMMENT '工作模式',
  `aisuggest` tinyint(1) DEFAULT '0' COMMENT '启用智能建议',
  PRIMARY KEY (`ID`) USING BTREE,
  UNIQUE KEY `snsid` (`sns_account_identifier`,`orgi`) USING BTREE COMMENT '按照渠道标识唯一'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='机器人客服表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cs_chatbot`
--

LOCK TABLES `cs_chatbot` WRITE;
/*!40000 ALTER TABLE `cs_chatbot` DISABLE KEYS */;
/*!40000 ALTER TABLE `cs_chatbot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cs_contact_notes`
--

DROP TABLE IF EXISTS `cs_contact_notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cs_contact_notes` (
  `id` varchar(32) NOT NULL COMMENT 'ID',
  `contactid` varchar(32) NOT NULL COMMENT '联系人ID',
  `createtime` datetime NOT NULL COMMENT '创建时间',
  `updatetime` datetime NOT NULL COMMENT '更新时间',
  `category` varchar(200) DEFAULT NULL COMMENT '内容类型',
  `content` text COMMENT '内容',
  `creater` varchar(32) DEFAULT NULL COMMENT '创建人',
  `datastatus` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否已删除',
  `agentuser` varchar(32) DEFAULT NULL COMMENT '在线访客记录ID',
  `onlineuser` varchar(32) DEFAULT NULL COMMENT '在线访客信息ID',
  `orgi` varchar(60) DEFAULT NULL COMMENT '租客标识',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='联系人笔记表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cs_contact_notes`
--

LOCK TABLES `cs_contact_notes` WRITE;
/*!40000 ALTER TABLE `cs_contact_notes` DISABLE KEYS */;
/*!40000 ALTER TABLE `cs_contact_notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cs_organ_user`
--

DROP TABLE IF EXISTS `cs_organ_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cs_organ_user` (
  `userid` varchar(32) NOT NULL COMMENT '用户ID',
  `organ` varchar(32) NOT NULL COMMENT '组织机构ID',
  `createtime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `creator` varchar(32) DEFAULT NULL COMMENT '创建人',
  `updatetime` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `orgi` varchar(32) DEFAULT NULL COMMENT '租户ID',
  PRIMARY KEY (`userid`,`organ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='部门人员表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cs_organ_user`
--

LOCK TABLES `cs_organ_user` WRITE;
/*!40000 ALTER TABLE `cs_organ_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `cs_organ_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cs_stream_file`
--

DROP TABLE IF EXISTS `cs_stream_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cs_stream_file` (
  `id` varchar(32) NOT NULL COMMENT '文件ID',
  `name` varchar(300) NOT NULL COMMENT '文件名称',
  `fileurl` varchar(500) DEFAULT NULL COMMENT '文件访问URL路径',
  `data` mediumblob NOT NULL COMMENT '原始文件',
  `thumbnail` mediumblob COMMENT '缩略图',
  `mime` varchar(200) DEFAULT NULL COMMENT '文件类型 Content Type',
  `cooperation` mediumblob COMMENT '协作文件',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='文件';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cs_stream_file`
--

LOCK TABLES `cs_stream_file` WRITE;
/*!40000 ALTER TABLE `cs_stream_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `cs_stream_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cs_user`
--

DROP TABLE IF EXISTS `cs_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cs_user` (
  `ID` varchar(32) NOT NULL COMMENT '主键ID',
  `LANGUAGE` varchar(255) DEFAULT NULL COMMENT '语言',
  `USERNAME` varchar(50) DEFAULT NULL COMMENT '用户名',
  `PASSWORD` varchar(255) DEFAULT NULL COMMENT '密码',
  `SECURECONF` varchar(255) DEFAULT NULL COMMENT '安全级别',
  `email` varchar(255) DEFAULT NULL COMMENT '邮件',
  `FIRSTNAME` varchar(255) DEFAULT NULL COMMENT '姓',
  `MIDNAME` varchar(255) DEFAULT NULL COMMENT '名',
  `LASTNAME` varchar(255) DEFAULT NULL COMMENT '名',
  `JOBTITLE` varchar(255) DEFAULT NULL COMMENT '职位',
  `GENDER` varchar(255) DEFAULT NULL COMMENT '性别',
  `BIRTHDAY` varchar(255) DEFAULT NULL COMMENT '生日',
  `nickname` varchar(255) DEFAULT NULL COMMENT '昵称',
  `rulename` varchar(255) DEFAULT NULL COMMENT '角色',
  `SEARCHPROJECTID` varchar(255) DEFAULT NULL COMMENT '备用',
  `orgi` varchar(32) DEFAULT NULL COMMENT '租户ID',
  `orgid` varchar(32) DEFAULT NULL COMMENT '企业ID',
  `creater` varchar(32) DEFAULT NULL COMMENT '创建人',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `memo` varchar(255) DEFAULT NULL COMMENT '备注',
  `updatetime` datetime DEFAULT NULL COMMENT '更新时间',
  `organ` varchar(32) DEFAULT NULL COMMENT '部门',
  `mobile` varchar(32) DEFAULT NULL COMMENT '手机号',
  `passupdatetime` datetime DEFAULT NULL COMMENT '最后 一次密码修改时间',
  `sign` text COMMENT '签名',
  `del` tinyint(4) DEFAULT '0' COMMENT '是否已删除',
  `uname` varchar(100) DEFAULT NULL COMMENT '姓名',
  `musteditpassword` tinyint(4) DEFAULT NULL COMMENT '登录修改密码',
  `agent` tinyint(4) DEFAULT NULL COMMENT '工号',
  `province` varchar(50) DEFAULT NULL COMMENT '省份',
  `city` varchar(50) DEFAULT NULL COMMENT '城市',
  `fans` int(11) DEFAULT NULL COMMENT '关注人数',
  `follows` int(11) DEFAULT NULL COMMENT '被关注次数',
  `integral` int(11) DEFAULT NULL COMMENT '积分',
  `lastlogintime` datetime DEFAULT NULL COMMENT '最后登录时间',
  `status` varchar(10) DEFAULT NULL COMMENT '状态',
  `deactivetime` datetime DEFAULT NULL COMMENT '离线时间',
  `title` varchar(50) DEFAULT NULL COMMENT '标题',
  `datastatus` tinyint(4) DEFAULT NULL COMMENT '数据状态',
  `callcenter` tinyint(4) DEFAULT NULL COMMENT '启用呼叫中心坐席',
  `sipaccount` varchar(50) DEFAULT NULL COMMENT 'sip地址',
  `superadmin` tinyint(4) DEFAULT NULL COMMENT '系统管理员',
  `admin` tinyint(4) DEFAULT NULL COMMENT '管理员',
  `maxuser` int(11) DEFAULT '0' COMMENT '最大接入访客数量',
  `ordertype` varchar(20) DEFAULT NULL COMMENT '默认排序方式',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cs_user`
--

LOCK TABLES `cs_user` WRITE;
/*!40000 ALTER TABLE `cs_user` DISABLE KEYS */;
INSERT INTO `cs_user` VALUES ('4028cac3614cd2f901614cf8be1f0324',NULL,'admin','5d80253b1cd5e5d4ca5ed539f4d72052','5','admin@cc.com',NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL,NULL,'cskefu','cskefu',NULL,'2017-03-16 13:56:34','北京','2018-07-31 08:24:13','4028811b63b028dc0163b032c3ed0590','18888888888',NULL,NULL,0,'系统管理员',0,1,'北京','北京',2,1,0,'2018-08-10 04:38:17',NULL,NULL,NULL,0,0,NULL,1,1,0,NULL);
/*!40000 ALTER TABLE `cs_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uk_act_batch`
--

DROP TABLE IF EXISTS `uk_act_batch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uk_act_batch` (
  `ID` varchar(32) NOT NULL COMMENT '主键',
  `NAME` varchar(50) DEFAULT NULL COMMENT '批次名称',
  `CODE` varchar(50) DEFAULT NULL COMMENT '批次代码',
  `CREATETIME` datetime DEFAULT NULL COMMENT '创建时间',
  `CREATER` varchar(32) DEFAULT NULL COMMENT '创建人',
  `UPDATETIME` datetime DEFAULT NULL COMMENT '更新时间',
  `ORGI` varchar(32) DEFAULT NULL COMMENT '租户ID',
  `USERNAME` varchar(50) DEFAULT NULL COMMENT '创建人',
  `STATUS` varchar(50) DEFAULT NULL COMMENT '批次状态',
  `PARENTID` varchar(32) DEFAULT NULL COMMENT '上级ID',
  `ACTID` varchar(32) DEFAULT NULL COMMENT '活动ID',
  `INX` int(11) DEFAULT '0' COMMENT '分类排序序号',
  `NAMENUM` int(11) DEFAULT '0' COMMENT '批次包含的名单总数',
  `VALIDNUM` int(11) DEFAULT '0' COMMENT '批次包含的有效名单总数',
  `INVALIDNUM` int(11) DEFAULT '0' COMMENT '批次包含的无效名单总数',
  `ASSIGNED` int(11) DEFAULT '0' COMMENT '已分配名单总数',
  `NOTASSIGNED` int(11) DEFAULT '0' COMMENT '未分配名单总数',
  `ENABLE` tinyint(4) DEFAULT '0' COMMENT '分类状态',
  `DATASTATUS` tinyint(4) DEFAULT '0' COMMENT '数据状态',
  `AREA` text COMMENT '分类描述',
  `imptype` varchar(50) DEFAULT NULL COMMENT '任务导入类型',
  `batchtype` varchar(32) DEFAULT NULL COMMENT '批次类型',
  `ORGAN` varchar(32) DEFAULT NULL COMMENT '部门',
  `impurl` text COMMENT '导入的文件链接',
  `filetype` varchar(50) DEFAULT NULL COMMENT '文件类型',
  `dbtype` varchar(50) DEFAULT NULL COMMENT '数据库类型',
  `jdbcurl` text COMMENT '数据库连接地址',
  `driverclazz` varchar(255) DEFAULT NULL COMMENT '数据库驱动',
  `password` varchar(255) DEFAULT NULL COMMENT '密码',
  `DESCRIPTION` text COMMENT '数据描述',
  `execnum` int(11) DEFAULT '0' COMMENT '导入次数',
  `SOURCE` varchar(255) DEFAULT NULL COMMENT '来源',
  `CLAZZ` varchar(255) DEFAULT NULL COMMENT '驱动名称',
  `TASKFIRETIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '任务启动时间',
  `CRAWLTASKID` varchar(255) DEFAULT NULL COMMENT '任务ID',
  `EMAIL` varchar(255) DEFAULT NULL COMMENT '邮箱地址',
  `NICKNAME` varchar(255) DEFAULT NULL COMMENT '昵称',
  `USERID` varchar(255) DEFAULT NULL COMMENT '用户ID',
  `TASKTYPE` varchar(255) DEFAULT NULL COMMENT '任务类型',
  `TASKID` varchar(255) DEFAULT NULL COMMENT '任务ID',
  `FETCHER` smallint(6) NOT NULL DEFAULT '0' COMMENT '采集状态',
  `PAUSE` smallint(6) NOT NULL DEFAULT '0' COMMENT '是否暂停',
  `PLANTASK` smallint(6) NOT NULL DEFAULT '0' COMMENT '是否计划任务',
  `SECURE_ID` varchar(32) DEFAULT NULL COMMENT '安全级别',
  `CONFIGURE_ID` varchar(32) DEFAULT NULL COMMENT '配置ID',
  `TAKSPLAN_ID` varchar(32) DEFAULT NULL COMMENT '计划任务ID',
  `CRAWLTASK` varchar(32) DEFAULT NULL COMMENT '采集任务状态',
  `TARGETTASK` varchar(32) DEFAULT NULL COMMENT '目标任务',
  `STARTINDEX` int(11) DEFAULT NULL COMMENT '排序位置',
  `LASTDATE` timestamp NULL DEFAULT NULL COMMENT '最近一次更新时间',
  `CREATETABLE` tinyint(4) DEFAULT NULL COMMENT '自动创建数据表',
  `MEMO` text COMMENT '备注',
  `NEXTFIRETIME` timestamp NULL DEFAULT NULL COMMENT '下次启动时间',
  `CRONEXP` varchar(255) DEFAULT NULL COMMENT '表达式',
  `TASKSTATUS` varchar(32) DEFAULT NULL COMMENT '任务状态',
  `usearea` varchar(255) DEFAULT '' COMMENT '用户区域',
  `areafield` varchar(255) DEFAULT NULL COMMENT '区域字段',
  `areafieldtype` varchar(32) DEFAULT NULL COMMENT '区域字段类型',
  `arearule` varchar(255) DEFAULT NULL COMMENT '区域规则',
  `minareavalue` varchar(255) DEFAULT NULL COMMENT '范围最小值',
  `maxareavalue` varchar(255) DEFAULT NULL COMMENT '范围最大值',
  `formatstr` varchar(255) DEFAULT NULL COMMENT '格式化字符串',
  `DATAID` varchar(1000) DEFAULT NULL COMMENT '报表id字符串',
  `DICID` varchar(1000) DEFAULT NULL COMMENT '目录id字符串',
  `taskinfo` longtext COMMENT 'taskinfo信息',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='电销活动';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uk_act_batch`
--

LOCK TABLES `uk_act_batch` WRITE;
/*!40000 ALTER TABLE `uk_act_batch` DISABLE KEYS */;
/*!40000 ALTER TABLE `uk_act_batch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uk_act_callagent`
--

DROP TABLE IF EXISTS `uk_act_callagent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uk_act_callagent` (
  `ID` varchar(32) NOT NULL COMMENT '主键ID',
  `NAME` varchar(50) DEFAULT NULL COMMENT '坐席名称',
  `CODE` varchar(50) DEFAULT NULL COMMENT '坐席代码',
  `CREATETIME` datetime DEFAULT NULL COMMENT '创建时间',
  `CREATER` varchar(32) DEFAULT NULL COMMENT '创建人',
  `UPDATETIME` datetime DEFAULT NULL COMMENT '更新时间',
  `ORGI` varchar(32) DEFAULT NULL COMMENT '租户ID',
  `USERNAME` varchar(50) DEFAULT NULL COMMENT '用户名',
  `STATUS` varchar(50) DEFAULT NULL COMMENT '坐席状态',
  `PARENTID` varchar(32) DEFAULT NULL COMMENT '上级ID',
  `FILTERTYPE` varchar(32) DEFAULT NULL COMMENT '筛选类型（批次筛选/元数据筛选）',
  `BATID` varchar(32) DEFAULT NULL COMMENT '筛选表单使用的批次ID',
  `TABLEID` varchar(32) DEFAULT NULL COMMENT '筛选表单使用元数据ID',
  `DATASTATUS` tinyint(4) DEFAULT '0' COMMENT '数据状态',
  `INX` int(11) DEFAULT '0' COMMENT '分类排序序号',
  `ORGAN` varchar(32) DEFAULT NULL COMMENT '部门',
  `DESCRIPTION` text COMMENT '描述信息',
  `distype` varchar(32) DEFAULT NULL COMMENT '分配类型',
  `distarget` varchar(32) DEFAULT NULL COMMENT '分配对象',
  `disnum` varchar(32) DEFAULT NULL COMMENT '分配数据',
  `ACTID` varchar(32) DEFAULT NULL COMMENT '活动ID',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='电销活动名单分配表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uk_act_callagent`
--

LOCK TABLES `uk_act_callagent` WRITE;
/*!40000 ALTER TABLE `uk_act_callagent` DISABLE KEYS */;
/*!40000 ALTER TABLE `uk_act_callagent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uk_act_callnames`
--

DROP TABLE IF EXISTS `uk_act_callnames`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uk_act_callnames` (
  `ID` varchar(32) NOT NULL COMMENT '主键ID',
  `NAME` varchar(50) DEFAULT NULL COMMENT '名单名称',
  `CODE` varchar(50) DEFAULT NULL COMMENT '名单代码',
  `CREATETIME` datetime DEFAULT NULL COMMENT '创建时间',
  `CREATER` varchar(32) DEFAULT NULL COMMENT '创建人',
  `UPDATETIME` datetime DEFAULT NULL COMMENT '更新时间',
  `ORGI` varchar(32) DEFAULT NULL COMMENT '租户ID',
  `USERNAME` varchar(50) DEFAULT NULL COMMENT '用户名',
  `STATUS` varchar(50) DEFAULT NULL COMMENT '名单状态',
  `PARENTID` varchar(32) DEFAULT NULL COMMENT '上级ID',
  `ACTID` varchar(32) DEFAULT NULL COMMENT '活动ID',
  `BATID` varchar(32) DEFAULT NULL COMMENT '活动ID',
  `DATASTATUS` varchar(32) DEFAULT NULL COMMENT '数据状态',
  `CALLS` int(11) DEFAULT '0' COMMENT '拨打次数',
  `FAILDCALLS` int(11) DEFAULT '0' COMMENT '拨打失败次数',
  `invalid` tinyint(4) DEFAULT '0' COMMENT '数据状态',
  `failed` tinyint(4) DEFAULT '0' COMMENT '数据状态',
  `WORKSTATUS` varchar(32) DEFAULT NULL COMMENT '名单业务状态',
  `OPTIME` datetime DEFAULT NULL COMMENT '分配时间',
  `ORGAN` varchar(32) DEFAULT NULL COMMENT '部门',
  `BATNAME` varchar(100) DEFAULT NULL COMMENT '批次名称',
  `TASKNAME` varchar(100) DEFAULT NULL COMMENT '任务名称',
  `owneruser` varchar(100) DEFAULT NULL COMMENT '所属用户',
  `ownerdept` varchar(100) DEFAULT NULL COMMENT '所属部门',
  `dataid` varchar(100) DEFAULT NULL COMMENT '数据ID',
  `taskid` varchar(100) DEFAULT NULL COMMENT '任务ID',
  `filterid` varchar(100) DEFAULT NULL COMMENT '筛选表单ID',
  `phonenumber` varchar(100) DEFAULT NULL COMMENT '电话号码',
  `leavenum` int(11) DEFAULT '0' COMMENT '剩余名单数量',
  `metaname` varchar(100) DEFAULT NULL COMMENT '元数据名称',
  `distype` varchar(100) DEFAULT NULL COMMENT '分配类型',
  `previewtime` int(11) DEFAULT '0' COMMENT '预览时长',
  `previewtimes` int(11) DEFAULT '0' COMMENT '预览次数',
  `servicetype` text COMMENT '服务类型',
  `reservation` tinyint(4) DEFAULT '0' COMMENT '是否预约',
  `memo` text COMMENT '预约备注',
  `firstcalltime` datetime DEFAULT NULL COMMENT '首次拨打时间',
  `firstcallstatus` varchar(20) DEFAULT NULL COMMENT '首次拨打状态',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='电销名单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uk_act_callnames`
--

LOCK TABLES `uk_act_callnames` WRITE;
/*!40000 ALTER TABLE `uk_act_callnames` DISABLE KEYS */;
/*!40000 ALTER TABLE `uk_act_callnames` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uk_act_config`
--

DROP TABLE IF EXISTS `uk_act_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uk_act_config` (
  `id` varchar(32) NOT NULL COMMENT '主键ID',
  `orgi` varchar(32) DEFAULT NULL COMMENT '租户ID',
  `creater` varchar(32) DEFAULT NULL COMMENT '创建人',
  `username` varchar(32) DEFAULT NULL COMMENT '创建人用户名',
  `name` varchar(32) DEFAULT NULL COMMENT '名称',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `enablecallout` tinyint(4) DEFAULT '0' COMMENT '启用自动外呼功能',
  `countdown` int(11) DEFAULT '0' COMMENT '倒计时时长',
  `enabletagentthreads` tinyint(4) DEFAULT '0' COMMENT '启用坐席外呼并发控制',
  `agentthreads` int(11) DEFAULT '0' COMMENT '坐席外呼并发数量',
  `enabletaithreads` tinyint(4) DEFAULT '0' COMMENT '启用机器人外呼并发控制',
  `aithreads` int(11) DEFAULT '0' COMMENT '机器人并发数量',
  `defaultvalue` varchar(100) DEFAULT NULL COMMENT '默认值',
  `strategy` varchar(100) DEFAULT NULL COMMENT '策略',
  `type` varchar(100) DEFAULT NULL COMMENT '类型',
  `updatetime` datetime DEFAULT NULL COMMENT '更新时间',
  `dataid` varchar(32) DEFAULT NULL COMMENT '数据ID',
  `previewautocallout` tinyint(4) DEFAULT '0' COMMENT '启用预览倒计时',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='电销配置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uk_act_config`
--

LOCK TABLES `uk_act_config` WRITE;
/*!40000 ALTER TABLE `uk_act_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `uk_act_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uk_act_filter_his`
--

DROP TABLE IF EXISTS `uk_act_filter_his`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uk_act_filter_his` (
  `ID` varchar(32) NOT NULL COMMENT '主键ID',
  `NAME` varchar(50) DEFAULT NULL COMMENT '筛选名称',
  `CODE` varchar(50) DEFAULT NULL COMMENT '筛选代码',
  `CREATETIME` datetime DEFAULT NULL COMMENT '创建时间',
  `CREATER` varchar(32) DEFAULT NULL COMMENT '创建人',
  `UPDATETIME` datetime DEFAULT NULL COMMENT '更新时间',
  `ORGI` varchar(32) DEFAULT NULL COMMENT '租户ID',
  `USERNAME` varchar(50) DEFAULT NULL COMMENT '用户名',
  `STATUS` varchar(50) DEFAULT NULL COMMENT '状态',
  `PARENTID` varchar(32) DEFAULT NULL COMMENT '上级ID',
  `ACTID` varchar(32) DEFAULT NULL COMMENT '活动ID',
  `INX` int(11) DEFAULT '0' COMMENT '分类排序序号',
  `NAMENUM` int(11) DEFAULT '0' COMMENT '批次包含的名单总数',
  `VALIDNUM` int(11) DEFAULT '0' COMMENT '批次包含的有效名单总数',
  `INVALIDNUM` int(11) DEFAULT '0' COMMENT '批次包含的无效名单总数',
  `ASSIGNED` int(11) DEFAULT '0' COMMENT '已分配名单总数',
  `NOTASSIGNED` int(11) DEFAULT '0' COMMENT '未分配名单总数',
  `ENABLE` tinyint(4) DEFAULT '0' COMMENT '分类状态',
  `DATASTATUS` tinyint(4) DEFAULT '0' COMMENT '数据状态',
  `ORGAN` varchar(32) DEFAULT NULL COMMENT '部门',
  `DESCRIPTION` text COMMENT '备注',
  `execnum` int(11) DEFAULT '0' COMMENT '导入次数',
  `SOURCE` varchar(255) DEFAULT NULL COMMENT '来源',
  `BATID` varchar(32) DEFAULT NULL COMMENT '批次ID',
  `FILTERID` varchar(32) DEFAULT NULL COMMENT '筛选表单ID',
  `ASSIGNEDORGAN` int(11) DEFAULT '0' COMMENT '分配部门',
  `exectype` varchar(32) DEFAULT NULL COMMENT '执行类型',
  `renum` int(11) DEFAULT '0' COMMENT '分配数量',
  `reorgannum` int(11) DEFAULT '0' COMMENT '部门分配数量',
  `assignedai` int(11) DEFAULT '0' COMMENT '分配到AI的名单数量',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='筛选记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uk_act_filter_his`
--

LOCK TABLES `uk_act_filter_his` WRITE;
/*!40000 ALTER TABLE `uk_act_filter_his` DISABLE KEYS */;
/*!40000 ALTER TABLE `uk_act_filter_his` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uk_act_formfilter`
--

DROP TABLE IF EXISTS `uk_act_formfilter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uk_act_formfilter` (
  `ID` varchar(32) NOT NULL COMMENT '主键ID',
  `NAME` varchar(50) DEFAULT NULL COMMENT '筛选表单名称',
  `CODE` varchar(50) DEFAULT NULL COMMENT '筛选表单代码',
  `CREATETIME` datetime DEFAULT NULL COMMENT '创建时间',
  `CREATER` varchar(32) DEFAULT NULL COMMENT '创建人',
  `UPDATETIME` datetime DEFAULT NULL COMMENT '更新时间',
  `ORGI` varchar(32) DEFAULT NULL COMMENT '租户ID',
  `USERNAME` varchar(50) DEFAULT NULL COMMENT '创建人名称',
  `STATUS` varchar(50) DEFAULT NULL COMMENT '状态',
  `PARENTID` varchar(32) DEFAULT NULL COMMENT '上级ID',
  `FILTERTYPE` varchar(32) DEFAULT NULL COMMENT '筛选类型（批次筛选/元数据筛选）',
  `BATID` varchar(32) DEFAULT NULL COMMENT '筛选表单使用的批次ID',
  `TABLEID` varchar(32) DEFAULT NULL COMMENT '筛选表单使用元数据ID',
  `DATASTATUS` tinyint(4) DEFAULT '0' COMMENT '数据状态',
  `INX` int(11) DEFAULT '0' COMMENT '分类排序序号',
  `ORGAN` varchar(32) DEFAULT NULL COMMENT '部门',
  `DESCRIPTION` text COMMENT '备注信息',
  `execnum` int(11) DEFAULT '0' COMMENT '导入次数',
  `filternum` int(11) DEFAULT '0' COMMENT '筛选次数',
  `conditional` int(11) DEFAULT '0' COMMENT '条件个数',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='筛选表单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uk_act_formfilter`
--

LOCK TABLES `uk_act_formfilter` WRITE;
/*!40000 ALTER TABLE `uk_act_formfilter` DISABLE KEYS */;
/*!40000 ALTER TABLE `uk_act_formfilter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uk_act_formfilter_item`
--

DROP TABLE IF EXISTS `uk_act_formfilter_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uk_act_formfilter_item` (
  `id` varchar(32) NOT NULL COMMENT '主键ID',
  `orgi` varchar(32) DEFAULT NULL COMMENT '租户ID',
  `creater` varchar(32) DEFAULT NULL COMMENT '创建人',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `updatetime` datetime DEFAULT NULL COMMENT '更新时间',
  `formfilterid` varchar(32) DEFAULT NULL COMMENT '筛选器ID',
  `field` varchar(32) DEFAULT NULL COMMENT '字段',
  `cond` varchar(32) DEFAULT NULL COMMENT '条件',
  `value` varchar(32) DEFAULT NULL COMMENT '取值',
  `contype` varchar(32) DEFAULT NULL COMMENT '条件类型',
  `itemtype` varchar(32) DEFAULT NULL COMMENT '类型',
  `comp` varchar(50) DEFAULT NULL COMMENT '逻辑条件',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='筛选项';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uk_act_formfilter_item`
--

LOCK TABLES `uk_act_formfilter_item` WRITE;
/*!40000 ALTER TABLE `uk_act_formfilter_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `uk_act_formfilter_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uk_act_role`
--

DROP TABLE IF EXISTS `uk_act_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uk_act_role` (
  `id` varchar(32) NOT NULL COMMENT '主键ID',
  `rolename` varchar(50) DEFAULT NULL COMMENT '角色名称',
  `roleid` varchar(50) DEFAULT NULL COMMENT '角色id',
  `bustype` varchar(50) DEFAULT NULL COMMENT '业务类型',
  `organid` text COMMENT '授权部门id',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `creater` varchar(32) DEFAULT NULL COMMENT '创建人',
  `updatetime` datetime DEFAULT NULL COMMENT '更新时间',
  `orgi` varchar(32) DEFAULT NULL COMMENT '租户ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='电销角色授权表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uk_act_role`
--

LOCK TABLES `uk_act_role` WRITE;
/*!40000 ALTER TABLE `uk_act_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `uk_act_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uk_act_schedule`
--

DROP TABLE IF EXISTS `uk_act_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uk_act_schedule` (
  `ID` varchar(32) NOT NULL COMMENT '主键ID',
  `NAME` varchar(50) DEFAULT NULL COMMENT '名称',
  `CODE` varchar(50) DEFAULT NULL COMMENT '代码',
  `CREATETIME` datetime DEFAULT NULL COMMENT '创建时间',
  `CREATER` varchar(32) DEFAULT NULL COMMENT '创建人',
  `UPDATETIME` datetime DEFAULT NULL COMMENT '更新时间',
  `ORGI` varchar(32) DEFAULT NULL COMMENT '租户ID',
  `USERNAME` varchar(50) DEFAULT NULL COMMENT '创建人名称',
  `STATUS` varchar(50) DEFAULT NULL COMMENT '状态',
  `PARENTID` varchar(32) DEFAULT NULL COMMENT '上级ID',
  `FILTERTYPE` varchar(32) DEFAULT NULL COMMENT '筛选类型（批次筛选/元数据筛选）',
  `ACTID` varchar(32) DEFAULT NULL COMMENT '筛选表单使用的批次ID',
  `TABLEID` varchar(32) DEFAULT NULL COMMENT '筛选表单使用元数据ID',
  `DATASTATUS` tinyint(4) DEFAULT '0' COMMENT '数据状态',
  `INX` int(11) DEFAULT '0' COMMENT '分类排序序号',
  `ORGAN` varchar(32) DEFAULT NULL COMMENT '部门',
  `DESCRIPTION` text COMMENT '描述信息',
  `daytype` varchar(32) DEFAULT NULL COMMENT '日期类型',
  `begintime` varchar(32) DEFAULT NULL COMMENT '开始时间',
  `endtime` varchar(32) DEFAULT NULL COMMENT '结束时间',
  `policy` varchar(32) DEFAULT NULL COMMENT '策略',
  `callvalues` text COMMENT '备注内容信息',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='电销日程表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uk_act_schedule`
--

LOCK TABLES `uk_act_schedule` WRITE;
/*!40000 ALTER TABLE `uk_act_schedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `uk_act_schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uk_act_task`
--

DROP TABLE IF EXISTS `uk_act_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uk_act_task` (
  `ID` varchar(32) NOT NULL COMMENT '主键ID',
  `NAME` varchar(50) DEFAULT NULL COMMENT '任务名称',
  `CODE` varchar(50) DEFAULT NULL COMMENT '任务代码',
  `CREATETIME` datetime DEFAULT NULL COMMENT '创建时间',
  `CREATER` varchar(32) DEFAULT NULL COMMENT '创建人',
  `UPDATETIME` datetime DEFAULT NULL COMMENT '更新时间',
  `ORGI` varchar(32) DEFAULT NULL COMMENT '租户ID',
  `USERNAME` varchar(50) DEFAULT NULL COMMENT '创建人名称',
  `STATUS` varchar(50) DEFAULT NULL COMMENT '状态',
  `PARENTID` varchar(32) DEFAULT NULL COMMENT '上级ID',
  `ACTID` varchar(32) DEFAULT NULL COMMENT '活动ID',
  `INX` int(11) DEFAULT '0' COMMENT '分类排序序号',
  `NAMENUM` int(11) DEFAULT '0' COMMENT '批次包含的名单总数',
  `VALIDNUM` int(11) DEFAULT '0' COMMENT '批次包含的有效名单总数',
  `INVALIDNUM` int(11) DEFAULT '0' COMMENT '批次包含的无效名单总数',
  `ASSIGNED` int(11) DEFAULT '0' COMMENT '已分配名单总数',
  `NOTASSIGNED` int(11) DEFAULT '0' COMMENT '未分配名单总数',
  `ENABLE` tinyint(4) DEFAULT '0' COMMENT '分类状态',
  `DATASTATUS` tinyint(4) DEFAULT '0' COMMENT '数据状态',
  `ORGAN` varchar(32) DEFAULT NULL COMMENT '部门',
  `DESCRIPTION` text COMMENT '备注信息',
  `execnum` int(11) DEFAULT '0' COMMENT '导入次数',
  `SOURCE` varchar(255) DEFAULT NULL COMMENT '来源信息',
  `BATID` varchar(32) DEFAULT NULL COMMENT '批次ID',
  `FILTERID` varchar(32) DEFAULT NULL COMMENT '筛选ID',
  `ASSIGNEDORGAN` int(11) DEFAULT '0' COMMENT '分配给部门',
  `exectype` varchar(32) DEFAULT NULL COMMENT '执行类型',
  `renum` int(11) DEFAULT '0' COMMENT '分配数量',
  `reorgannum` int(11) DEFAULT '0' COMMENT '分配到部门数量',
  `assignedai` int(11) DEFAULT '0' COMMENT '分配到AI的名单数量',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='电销任务表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uk_act_task`
--

LOCK TABLES `uk_act_task` WRITE;
/*!40000 ALTER TABLE `uk_act_task` DISABLE KEYS */;
/*!40000 ALTER TABLE `uk_act_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uk_ad_position`
--

DROP TABLE IF EXISTS `uk_ad_position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uk_ad_position` (
  `ID` varchar(32) NOT NULL COMMENT '主键ID',
  `NAME` varchar(50) DEFAULT NULL COMMENT '名称',
  `CODE` varchar(50) DEFAULT NULL COMMENT '代码',
  `CREATETIME` datetime DEFAULT NULL COMMENT '创建时间',
  `CREATER` varchar(32) DEFAULT NULL COMMENT '创建人',
  `UPDATETIME` datetime DEFAULT NULL COMMENT '更新时间',
  `ORGI` varchar(32) DEFAULT NULL COMMENT '租户ID',
  `USERNAME` varchar(50) DEFAULT NULL COMMENT '创建人名称',
  `PARENTID` varchar(32) DEFAULT NULL COMMENT '知识库分类上级ID',
  `INX` int(11) DEFAULT NULL COMMENT '分类排序序号',
  `ENABLE` tinyint(4) DEFAULT NULL COMMENT '分类状态',
  `AREA` text COMMENT '分类描述',
  `IMGURL` varchar(255) DEFAULT NULL COMMENT '图片URL',
  `TIPTEXT` varchar(100) DEFAULT NULL COMMENT '提示文本',
  `URL` text COMMENT '路径',
  `CONTENT` text COMMENT '内容',
  `WEIGHT` int(11) DEFAULT NULL COMMENT '权重',
  `ADTYPE` varchar(50) DEFAULT NULL COMMENT '广告类型',
  `STATUS` varchar(32) DEFAULT NULL COMMENT '广告状态',
  `ADPOS` varchar(32) DEFAULT NULL COMMENT '广告位置',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='客服客户端广告位表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uk_ad_position`
--

LOCK TABLES `uk_ad_position` WRITE;
/*!40000 ALTER TABLE `uk_ad_position` DISABLE KEYS */;
/*!40000 ALTER TABLE `uk_ad_position` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uk_agentservice`
--

DROP TABLE IF EXISTS `uk_agentservice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uk_agentservice` (
  `id` varchar(32) NOT NULL DEFAULT '' COMMENT '主键ID',
  `username` varchar(100) DEFAULT '' COMMENT '创建人用户名',
  `agentno` varchar(100) DEFAULT '' COMMENT '坐席ID',
  `userid` varchar(100) DEFAULT '' COMMENT '用户ID',
  `channel` varchar(100) DEFAULT '' COMMENT '渠道',
  `logindate` datetime DEFAULT NULL COMMENT '登录时间',
  `source` varchar(100) DEFAULT '' COMMENT '来源',
  `endtime` datetime DEFAULT NULL COMMENT '结束时间',
  `nickname` varchar(100) DEFAULT '' COMMENT '昵称',
  `city` varchar(100) DEFAULT '' COMMENT '城市',
  `province` varchar(100) DEFAULT '' COMMENT '省份',
  `country` varchar(100) DEFAULT '' COMMENT '国家',
  `headImgUrl` varchar(255) DEFAULT '' COMMENT '头像URL',
  `waittingtime` int(11) DEFAULT '0' COMMENT '等待时间',
  `tokenum` int(11) DEFAULT '0' COMMENT '未回复消息数量',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `updatetime` datetime DEFAULT NULL COMMENT '更新时间',
  `status` varchar(100) DEFAULT '' COMMENT '状态',
  `appid` varchar(100) DEFAULT '' COMMENT 'SNSID',
  `sessiontype` varchar(100) DEFAULT '' COMMENT '会话类型',
  `contextid` varchar(100) DEFAULT '' COMMENT '会话ID',
  `agentserviceid` varchar(100) DEFAULT '' COMMENT '服务记录ID',
  `orgi` varchar(100) DEFAULT '' COMMENT '租户ID',
  `snsuser` varchar(100) DEFAULT '' COMMENT '用户ID（微信）',
  `lastmessage` datetime DEFAULT NULL COMMENT '最后一条消息时间',
  `waittingtimestart` datetime DEFAULT NULL COMMENT '进入排队时间',
  `lastgetmessage` datetime DEFAULT NULL COMMENT '坐席最后一条消息时间',
  `lastmsg` text COMMENT '最后一条消息内容',
  `agentskill` varchar(100) DEFAULT '' COMMENT '技能组',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `creater` varchar(255) DEFAULT NULL COMMENT '创建人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `update_user` varchar(255) DEFAULT NULL COMMENT '修改人',
  `assignedto` varchar(255) DEFAULT NULL COMMENT '分配目标用户',
  `wfstatus` varchar(255) DEFAULT NULL COMMENT '流程状态',
  `shares` varchar(255) DEFAULT NULL COMMENT '分享给',
  `owner` varchar(255) DEFAULT NULL COMMENT '所属人',
  `datadept` varchar(255) DEFAULT NULL COMMENT '创建人部门',
  `intime` int(32) DEFAULT NULL COMMENT '接入时间',
  `batid` varchar(32) DEFAULT NULL COMMENT '批次ID',
  `ipaddr` varchar(50) DEFAULT NULL COMMENT 'IP地址',
  `osname` varchar(100) DEFAULT NULL COMMENT '操作系统名称',
  `browser` varchar(100) DEFAULT NULL COMMENT '浏览器',
  `sessiontimes` int(20) DEFAULT NULL COMMENT '会话时长',
  `servicetime` datetime DEFAULT NULL COMMENT '服务时长',
  `region` varchar(255) DEFAULT NULL COMMENT '区域',
  `agentusername` varchar(50) DEFAULT NULL COMMENT '坐席用户名',
  `times` int(10) DEFAULT NULL COMMENT '消息数量',
  `dataid` varchar(32) DEFAULT NULL COMMENT '数据ID',
  `contactsid` varchar(32) DEFAULT NULL COMMENT '联系人ID',
  `createdate` varchar(32) DEFAULT NULL COMMENT '消息到达时间',
  `name` varchar(100) DEFAULT NULL COMMENT '访客填写的姓名',
  `email` varchar(100) DEFAULT NULL COMMENT '访客填写的邮件地址',
  `phone` varchar(100) DEFAULT NULL COMMENT '访客填写的电话号码',
  `resion` varchar(255) DEFAULT NULL COMMENT '访客填写的来访原因',
  `satisfaction` tinyint(4) DEFAULT NULL COMMENT '满意度调查评级',
  `satistime` datetime DEFAULT NULL COMMENT '满意度调查时间',
  `satislevel` varchar(50) DEFAULT NULL COMMENT '满意度评分',
  `satiscomment` varchar(255) DEFAULT NULL COMMENT '满意度备注',
  `trans` tinyint(4) DEFAULT NULL COMMENT '是否转接',
  `transtime` datetime DEFAULT NULL COMMENT '转接时间',
  `transmemo` text COMMENT '转接备注',
  `agentreplyinterval` int(11) DEFAULT NULL COMMENT '坐席评级回复间隔',
  `agentreplytime` int(11) DEFAULT NULL COMMENT '坐席评级回复时间',
  `avgreplyinterval` int(11) DEFAULT NULL COMMENT '访客平均回复间隔',
  `avgreplytime` int(11) DEFAULT NULL COMMENT '访客回复总时长',
  `agentreplys` int(11) DEFAULT NULL COMMENT '坐席回复消息数量',
  `userasks` int(11) DEFAULT NULL COMMENT '访客发送消息数量',
  `agentuserid` varchar(32) DEFAULT NULL COMMENT '访客ID',
  `sessionid` varchar(32) DEFAULT NULL COMMENT '会话ID',
  `qualitystatus` varchar(20) DEFAULT NULL COMMENT '质检状态',
  `qualitydisorgan` varchar(32) DEFAULT NULL COMMENT '质检分配部门',
  `qualitydisuser` varchar(32) DEFAULT NULL COMMENT '质检分配用户',
  `qualityorgan` varchar(32) DEFAULT NULL COMMENT '质检部门',
  `qualityuser` varchar(32) DEFAULT NULL COMMENT '质检用户',
  `qualitytime` datetime DEFAULT NULL COMMENT '质检时间',
  `qualitytype` varchar(20) DEFAULT NULL COMMENT '质检方式',
  `qualityscore` int(11) DEFAULT '0' COMMENT '质检打分',
  `solvestatus` varchar(20) DEFAULT NULL COMMENT '问题解决状态',
  `leavemsg` tinyint(4) DEFAULT '0' COMMENT '是否留言',
  `initiator` varchar(32) DEFAULT NULL COMMENT '对话发起方',
  `agenttimeout` int(11) DEFAULT '0' COMMENT '坐席超时时长',
  `agenttimeouttimes` int(11) DEFAULT '0' COMMENT '坐席超时次数',
  `servicetimeout` tinyint(4) DEFAULT '0',
  `agentservicetimeout` int(11) DEFAULT '0' COMMENT '服务超时',
  `agentfrewords` int(11) DEFAULT '0' COMMENT '坐席触发敏感词',
  `servicefrewords` int(11) DEFAULT '0' COMMENT '访客触发敏感词',
  `leavemsgstatus` varchar(20) DEFAULT 'notprocess' COMMENT '留言处理状态',
  `agent` varchar(32) DEFAULT NULL COMMENT '坐席',
  `skill` varchar(32) DEFAULT NULL COMMENT '技能组',
  `endby` varchar(20) DEFAULT NULL COMMENT '终止方',
  `aiid` varchar(32) DEFAULT NULL COMMENT 'AIID',
  `aiservice` tinyint(4) DEFAULT '0' COMMENT '是否AI服务',
  `foragent` tinyint(4) DEFAULT '0' COMMENT '直接转人工',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='在线客服服务记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uk_agentservice`
--

LOCK TABLES `uk_agentservice` WRITE;
/*!40000 ALTER TABLE `uk_agentservice` DISABLE KEYS */;
/*!40000 ALTER TABLE `uk_agentservice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uk_agentstatus`
--

DROP TABLE IF EXISTS `uk_agentstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uk_agentstatus` (
  `id` varchar(32) NOT NULL DEFAULT '' COMMENT '主键ID',
  `agentno` varchar(100) DEFAULT '' COMMENT '坐席ID',
  `logindate` datetime DEFAULT NULL COMMENT '登录时间',
  `status` varchar(100) DEFAULT '' COMMENT '状态',
  `orgi` varchar(100) DEFAULT '' COMMENT '租户ID',
  `agentserviceid` varchar(100) DEFAULT '' COMMENT '服务ID',
  `serusernum` int(11) DEFAULT '0' COMMENT '服务用户数',
  `users` int(11) DEFAULT '0' COMMENT '接入用户数',
  `maxusers` int(11) DEFAULT '0' COMMENT '最大接入用户数',
  `username` varchar(100) DEFAULT '' COMMENT '用户名',
  `name` varchar(100) DEFAULT '' COMMENT '名称',
  `updatetime` datetime DEFAULT NULL COMMENT '更新时间',
  `userid` varchar(100) DEFAULT '' COMMENT '用户ID',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `creater` varchar(255) DEFAULT NULL COMMENT '创建人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `update_user` varchar(255) DEFAULT NULL COMMENT '修改人',
  `assignedto` varchar(255) DEFAULT NULL COMMENT '分配目标用户',
  `wfstatus` varchar(255) DEFAULT NULL COMMENT '流程状态',
  `shares` varchar(255) DEFAULT NULL COMMENT '分享给',
  `owner` varchar(255) DEFAULT NULL COMMENT '所属人',
  `datadept` varchar(255) DEFAULT NULL COMMENT '创建人部门',
  `batid` varchar(32) DEFAULT NULL COMMENT '批次ID',
  `pulluser` tinyint(4) DEFAULT NULL COMMENT '是否允许拉取用户',
  `busy` tinyint(4) DEFAULT '0' COMMENT '示忙',
  `workstatus` varchar(50) DEFAULT NULL COMMENT '工作状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='在线客服坐席状态表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uk_agentstatus`
--

LOCK TABLES `uk_agentstatus` WRITE;
/*!40000 ALTER TABLE `uk_agentstatus` DISABLE KEYS */;
/*!40000 ALTER TABLE `uk_agentstatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uk_agentuser`
--

DROP TABLE IF EXISTS `uk_agentuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uk_agentuser` (
  `id` varchar(32) NOT NULL DEFAULT '' COMMENT '主键ID',
  `username` varchar(100) DEFAULT '' COMMENT '用户名',
  `userid` varchar(100) DEFAULT '' COMMENT '用户ID',
  `channel` varchar(100) DEFAULT '' COMMENT '渠道',
  `logindate` datetime DEFAULT NULL COMMENT '登录时间',
  `source` varchar(100) DEFAULT '' COMMENT '来源',
  `endtime` datetime DEFAULT NULL COMMENT '结束时间',
  `nickname` varchar(100) DEFAULT '' COMMENT '昵称',
  `city` varchar(100) DEFAULT '' COMMENT '城市',
  `province` varchar(100) DEFAULT '' COMMENT '省份',
  `country` varchar(100) DEFAULT '' COMMENT '国家',
  `headImgUrl` varchar(255) DEFAULT '' COMMENT '头像URL',
  `waittingtime` int(11) DEFAULT '0' COMMENT '等待时长',
  `tokenum` int(11) DEFAULT '0' COMMENT '接入次数',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `updatetime` datetime DEFAULT NULL COMMENT '更新时间',
  `status` varchar(100) DEFAULT '' COMMENT '状态',
  `appid` varchar(100) DEFAULT '' COMMENT 'SNSID',
  `sessiontype` varchar(100) DEFAULT '' COMMENT '会话类型',
  `contextid` varchar(100) DEFAULT '' COMMENT '会话ID',
  `agentserviceid` varchar(100) DEFAULT '' COMMENT '服务记录ID',
  `orgi` varchar(100) DEFAULT '' COMMENT '租户ID',
  `snsuser` varchar(100) DEFAULT '' COMMENT 'SNS用户ID',
  `lastmessage` datetime DEFAULT NULL COMMENT '最后一条消息时间',
  `waittingtimestart` datetime DEFAULT NULL COMMENT '进入队列时间',
  `lastgetmessage` datetime DEFAULT NULL COMMENT '最后一条消息时间',
  `lastmsg` text COMMENT '最后一条消息',
  `agentskill` varchar(100) DEFAULT '' COMMENT '技能组',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `creater` varchar(255) DEFAULT NULL COMMENT '创建人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `update_user` varchar(255) DEFAULT NULL COMMENT '修改人',
  `assignedto` varchar(255) DEFAULT NULL COMMENT '分配目标用户',
  `wfstatus` varchar(255) DEFAULT NULL COMMENT '流程状态',
  `shares` varchar(255) DEFAULT NULL COMMENT '分享给',
  `owner` varchar(255) DEFAULT NULL COMMENT '所属人',
  `datadept` varchar(255) DEFAULT NULL COMMENT '创建人部门',
  `intime` int(32) DEFAULT NULL COMMENT '接入时间',
  `batid` varchar(32) DEFAULT NULL COMMENT '批次ID',
  `opttype` varchar(32) DEFAULT NULL COMMENT '服务处理类型',
  `ipaddr` varchar(50) DEFAULT NULL COMMENT 'IP地址',
  `osname` varchar(100) DEFAULT NULL COMMENT '操作系统名称',
  `browser` varchar(100) DEFAULT NULL COMMENT '浏览器',
  `sessiontimes` int(20) DEFAULT NULL COMMENT '会话时长',
  `servicetime` datetime DEFAULT NULL COMMENT '服务次数',
  `region` varchar(255) DEFAULT NULL COMMENT '地区',
  `agentservice` varchar(32) DEFAULT NULL COMMENT '服务ID',
  `warnings` varchar(11) DEFAULT NULL COMMENT '提醒次数',
  `warningtime` datetime DEFAULT NULL COMMENT '提醒时间',
  `reptime` datetime DEFAULT NULL COMMENT '坐席最后一次回复时间',
  `reptimes` varchar(10) DEFAULT NULL COMMENT '坐席回复次数',
  `agentno` varchar(100) DEFAULT '' COMMENT '坐席ID',
  `agentname` varchar(100) DEFAULT NULL COMMENT '坐席名字',
  `skill` varchar(32) DEFAULT NULL COMMENT '技能组',
  `name` varchar(100) DEFAULT NULL COMMENT '用户录入的姓名',
  `phone` varchar(100) DEFAULT NULL COMMENT '访客录入的电话',
  `email` varchar(100) DEFAULT NULL COMMENT '访客录入的邮件',
  `resion` varchar(255) DEFAULT NULL COMMENT '访客录入的来访原因',
  `agentreplyinterval` int(11) DEFAULT '0' COMMENT '坐席回复总间隔',
  `agentreplytime` int(11) DEFAULT '0' COMMENT '坐席回复时长',
  `agentreplys` int(11) DEFAULT '0' COMMENT '坐席回复次数',
  `userasks` int(11) DEFAULT '0' COMMENT '访客提问次数',
  `avgreplyinterval` int(11) DEFAULT '0' COMMENT '平均回复间隔',
  `avgreplytime` int(11) DEFAULT '0' COMMENT '平均回复时长',
  `sessionid` varchar(32) DEFAULT NULL COMMENT '会话ID',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `url` text COMMENT 'URL',
  `traceid` varchar(32) DEFAULT NULL COMMENT '跟踪ID',
  `agenttimeout` int(11) DEFAULT '0' COMMENT '坐席超时时长',
  `agenttimeouttimes` int(11) DEFAULT '0' COMMENT '坐席超时次数',
  `servicetimeout` tinyint(4) DEFAULT '0' COMMENT '服务超时时长',
  `agentservicetimeout` int(11) DEFAULT '0' COMMENT '服务超时次数',
  `agentfrewords` int(11) DEFAULT '0' COMMENT '坐席触发敏感词',
  `servicefrewords` int(11) DEFAULT '0' COMMENT '访客触发敏感词',
  `topflag` tinyint(4) DEFAULT NULL COMMENT '是否置顶',
  `toptimes` int(20) DEFAULT NULL COMMENT '置顶时长',
  `toptime` datetime DEFAULT NULL COMMENT '置顶时间',
  `firstreplytime` int(20) DEFAULT '0' COMMENT '首次响应时间',
  `agentusername` varchar(32) DEFAULT NULL COMMENT '坐席姓名',
  `alarm` int(10) DEFAULT '0' COMMENT '是否触发预警',
  `initiator` varchar(32) DEFAULT NULL COMMENT '会话发起方',
  `chatbotops` tinyint(1) DEFAULT '0' COMMENT '是否是机器人客服',
  `chatbotlogicerror` int(11) DEFAULT '0' COMMENT '机器人客服不符合逻辑返回累计',
  `chatbotround` int(11) DEFAULT '0' COMMENT '机器人客服对话轮次',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `agentuser_userid` (`userid`) USING BTREE,
  KEY `agentuser_orgi` (`orgi`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='在线客服访客咨询表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uk_agentuser`
--

LOCK TABLES `uk_agentuser` WRITE;
/*!40000 ALTER TABLE `uk_agentuser` DISABLE KEYS */;
/*!40000 ALTER TABLE `uk_agentuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uk_agentuser_contacts`
--

DROP TABLE IF EXISTS `uk_agentuser_contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uk_agentuser_contacts` (
  `id` varchar(32) NOT NULL COMMENT '主键ID',
  `orgi` varchar(32) DEFAULT NULL COMMENT '租户ID',
  `appid` varchar(32) DEFAULT NULL COMMENT 'SNSID',
  `channel` varchar(32) DEFAULT NULL COMMENT '渠道',
  `userid` varchar(32) DEFAULT NULL COMMENT '用户ID',
  `contactsid` varchar(32) DEFAULT NULL COMMENT '联系人ID',
  `username` varchar(100) DEFAULT NULL COMMENT '创建人用户名',
  `creater` varchar(32) DEFAULT NULL COMMENT '创建人ID',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='访客联系人关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uk_agentuser_contacts`
--

LOCK TABLES `uk_agentuser_contacts` WRITE;
/*!40000 ALTER TABLE `uk_agentuser_contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `uk_agentuser_contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uk_ai`
--

DROP TABLE IF EXISTS `uk_ai`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uk_ai` (
  `id` varchar(32) NOT NULL COMMENT '主键ID',
  `name` varchar(255) DEFAULT NULL COMMENT 'AI名称',
  `createtime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `creater` varchar(32) DEFAULT NULL COMMENT '创建人',
  `orgi` varchar(32) DEFAULT NULL COMMENT '租户id',
  `inx` int(11) DEFAULT NULL COMMENT '分类排序序号',
  `updatetime` datetime DEFAULT NULL COMMENT '更新时间',
  `description` varchar(255) DEFAULT NULL COMMENT '分类描述',
  `code` varchar(32) DEFAULT NULL COMMENT '代码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='AI机器人表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uk_ai`
--

LOCK TABLES `uk_ai` WRITE;
/*!40000 ALTER TABLE `uk_ai` DISABLE KEYS */;
/*!40000 ALTER TABLE `uk_ai` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uk_ai_snsaccount`
--

DROP TABLE IF EXISTS `uk_ai_snsaccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uk_ai_snsaccount` (
  `id` varchar(32) NOT NULL COMMENT '主键ID',
  `aiid` varchar(32) DEFAULT NULL COMMENT '用户ID',
  `snsid` varchar(32) DEFAULT NULL COMMENT '角色ID',
  `creater` varchar(32) DEFAULT NULL COMMENT '创建人',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `orgi` varchar(32) DEFAULT NULL COMMENT '租户ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='AI列表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uk_ai_snsaccount`
--

LOCK TABLES `uk_ai_snsaccount` WRITE;
/*!40000 ALTER TABLE `uk_ai_snsaccount` DISABLE KEYS */;
/*!40000 ALTER TABLE `uk_ai_snsaccount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uk_area_type`
--

DROP TABLE IF EXISTS `uk_area_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uk_area_type` (
  `ID` varchar(32) NOT NULL COMMENT '主键ID',
  `NAME` varchar(50) DEFAULT NULL COMMENT '名称',
  `CODE` varchar(50) DEFAULT NULL COMMENT '代码',
  `CREATETIME` datetime DEFAULT NULL COMMENT '创建时间',
  `CREATER` varchar(32) DEFAULT NULL COMMENT '创建人',
  `UPDATETIME` datetime DEFAULT NULL COMMENT '更新时间',
  `ORGI` varchar(32) DEFAULT NULL COMMENT '租户ID',
  `USERNAME` varchar(50) DEFAULT NULL COMMENT '用户名',
  `PARENTID` varchar(32) DEFAULT NULL COMMENT '知识库分类上级ID',
  `INX` int(11) DEFAULT NULL COMMENT '分类排序序号',
  `ENABLE` tinyint(4) DEFAULT NULL COMMENT '分类状态',
  `AREA` text COMMENT '分类描述',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='区域类型';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uk_area_type`
--

LOCK TABLES `uk_area_type` WRITE;
/*!40000 ALTER TABLE `uk_area_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `uk_area_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uk_attachment_file`
--

DROP TABLE IF EXISTS `uk_attachment_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uk_attachment_file` (
  `id` varchar(32) NOT NULL COMMENT '主键ID',
  `orgi` varchar(32) DEFAULT NULL COMMENT '租户ID',
  `creater` varchar(32) DEFAULT NULL COMMENT '创建人ID',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `organ` varchar(32) DEFAULT NULL COMMENT '组织机构ID',
  `datastatus` tinyint(4) DEFAULT NULL COMMENT '数据状态（逻辑删除）',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `url` text CHARACTER SET utf32 COMMENT '地址',
  `updatetime` datetime DEFAULT NULL COMMENT '更新时间',
  `filelength` int(11) DEFAULT NULL COMMENT '文件长度',
  `filetype` varchar(255) DEFAULT NULL COMMENT '文件类型',
  `image` tinyint(4) DEFAULT NULL COMMENT '是否图片',
  `dataid` varchar(32) DEFAULT NULL COMMENT '数据ID',
  `model` varchar(32) DEFAULT NULL COMMENT '所属功能模块',
  `fileid` varchar(32) DEFAULT NULL COMMENT '文件ID',
  `modelid` varchar(32) DEFAULT NULL COMMENT '所属模块数据ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='附件表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uk_attachment_file`
--

LOCK TABLES `uk_attachment_file` WRITE;
/*!40000 ALTER TABLE `uk_attachment_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `uk_attachment_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uk_blacklist`
--

DROP TABLE IF EXISTS `uk_blacklist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uk_blacklist` (
  `id` varchar(32) NOT NULL COMMENT '主键ID',
  `orgi` varchar(32) DEFAULT NULL COMMENT '租户ID',
  `userid` varchar(32) DEFAULT NULL COMMENT '用户ID',
  `contactid` varchar(32) DEFAULT NULL COMMENT '联系人ID',
  `sessionid` varchar(32) DEFAULT NULL COMMENT '会话ID',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `channel` varchar(20) DEFAULT NULL COMMENT '渠道',
  `creater` varchar(32) DEFAULT NULL COMMENT '创家人',
  `agentid` varchar(32) DEFAULT NULL COMMENT '坐席ID',
  `phone` varchar(20) DEFAULT NULL COMMENT '电话号码',
  `openid` varchar(100) DEFAULT NULL COMMENT '微信号',
  `description` text COMMENT '描述',
  `agentserviceid` varchar(32) DEFAULT NULL COMMENT '坐席服务ID',
  `times` int(11) DEFAULT NULL COMMENT '次数',
  `chattime` int(11) DEFAULT NULL COMMENT '对话次数',
  `controltime` int(11) DEFAULT '1' COMMENT '开始时间',
  `endtime` datetime DEFAULT NULL COMMENT '结束时间',
  `agentuser` varchar(255) DEFAULT NULL COMMENT '访客',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='黑名单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uk_blacklist`
--

LOCK TABLES `uk_blacklist` WRITE;
/*!40000 ALTER TABLE `uk_blacklist` DISABLE KEYS */;
/*!40000 ALTER TABLE `uk_blacklist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uk_bpm_process`
--

DROP TABLE IF EXISTS `uk_bpm_process`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uk_bpm_process` (
  `ID` varchar(32) NOT NULL COMMENT '主键ID',
  `NAME` varchar(50) DEFAULT NULL COMMENT '名称',
  `CODE` varchar(50) DEFAULT NULL COMMENT '代码',
  `CREATETIME` datetime DEFAULT NULL COMMENT '创建时间',
  `CREATER` varchar(32) DEFAULT NULL COMMENT '创建人',
  `UPDATETIME` datetime DEFAULT NULL COMMENT '更新时间',
  `ORGI` varchar(32) DEFAULT NULL COMMENT '租户ID',
  `USERNAME` varchar(50) DEFAULT NULL COMMENT '用户名',
  `CONTENT` text COMMENT '流程文本内容',
  `STATUS` varchar(20) DEFAULT NULL COMMENT '流程状态',
  `TITLE` varchar(50) DEFAULT NULL COMMENT '流程标题',
  `PUBLISHED` tinyint(4) DEFAULT NULL COMMENT '流程发布状态',
  `PROCESSID` varchar(50) DEFAULT NULL COMMENT '流程ID',
  `PROCESSTYPE` varchar(50) DEFAULT NULL COMMENT '流程类型',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='业务流程表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uk_bpm_process`
--

LOCK TABLES `uk_bpm_process` WRITE;
/*!40000 ALTER TABLE `uk_bpm_process` DISABLE KEYS */;
/*!40000 ALTER TABLE `uk_bpm_process` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uk_call_monitor`
--

DROP TABLE IF EXISTS `uk_call_monitor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uk_call_monitor` (
  `ID` varchar(50) NOT NULL COMMENT 'ID',
  `USERID` varchar(50) DEFAULT NULL COMMENT '登录人ID',
  `AGENT` varchar(50) DEFAULT NULL COMMENT '坐席工号',
  `USERNAME` varchar(50) DEFAULT NULL COMMENT '坐席用户名（登录名）',
  `AGENTNO` varchar(50) DEFAULT NULL COMMENT '分机号（坐席登录的分机号码）',
  `NAME` varchar(50) DEFAULT NULL COMMENT '坐席姓名',
  `CODE` varchar(50) DEFAULT NULL COMMENT '坐席状态code（对应字典表里的CODE）',
  `STATUS` varchar(50) DEFAULT NULL COMMENT '坐席当前状态（坐席当前状态（坐席监控首页显示，判断根本依据，每次状态改变，数据记录会被更新））',
  `ORGI` varchar(50) DEFAULT NULL COMMENT '租户ID',
  `AGENTSERVICEID` varchar(50) DEFAULT NULL COMMENT '会话ID',
  `SKILL` varchar(50) DEFAULT NULL COMMENT '接入的技能组ID',
  `SKILLNAME` varchar(50) DEFAULT NULL COMMENT '接入的技能组名称',
  `BUSY` varchar(50) DEFAULT NULL COMMENT '是否忙',
  `CREATETIME` datetime DEFAULT NULL COMMENT '记录创建时间（每个坐席的第一条记录为，点击登录之后，登录成功之后的时间，则会插入一条记录。以后每次状态改变，记录会被更新，时间都会跟着改变，变为状态改变后的时间。）',
  `ANI` varchar(50) DEFAULT NULL COMMENT '主叫号码',
  `CALLED` varchar(50) DEFAULT NULL COMMENT '被叫号码',
  `DIRECTION` varchar(50) DEFAULT NULL COMMENT '呼叫方向',
  `CALLSTARTTIME` datetime DEFAULT NULL COMMENT '通话开始时间',
  `CALLENDTIME` datetime DEFAULT NULL COMMENT '通话结束时间',
  `RINGDURATION` int(11) DEFAULT NULL COMMENT '振铃时长',
  `DURATION` int(11) DEFAULT NULL COMMENT '通话时长',
  `MISSCALL` tinyint(4) DEFAULT NULL COMMENT '是否漏话',
  `RECORD` tinyint(4) DEFAULT NULL COMMENT '是否录音',
  `RECORDTIME` int(11) DEFAULT NULL COMMENT '录音时长',
  `STARTRECORD` datetime DEFAULT NULL COMMENT '开始录音时间',
  `ENDRECORD` datetime DEFAULT NULL COMMENT '结束录音时间',
  `RECORDFILENAME` varchar(100) DEFAULT NULL COMMENT '录音文件名（单纯录音文件名）',
  `RECORDFILE` varchar(255) DEFAULT NULL COMMENT '录音文件全路径名（存放位置+文件名）',
  `SOURCE` varchar(50) DEFAULT NULL COMMENT '来源',
  `ANSWERTIME` datetime DEFAULT NULL COMMENT '应答时间',
  `CURRENT` tinyint(4) DEFAULT NULL COMMENT '当前通话',
  `INIT` tinyint(4) DEFAULT NULL COMMENT '初始通话',
  `ACTION` varchar(50) DEFAULT NULL COMMENT '事件动作',
  `HOST` varchar(50) DEFAULT NULL COMMENT '时间主机（FreeWitch主机帐户名）',
  `IPADDR` varchar(50) DEFAULT NULL COMMENT '主机IP（FreeWitch主机IP）',
  `SERVICESUMMARY` tinyint(4) DEFAULT NULL COMMENT '是否记录服务小结',
  `SERVICEID` varchar(32) DEFAULT NULL COMMENT '服务记录ID',
  `SERVICESTATUS` varchar(50) DEFAULT NULL COMMENT '当前呼叫状态',
  `CHANNELSTATUS` varchar(50) DEFAULT NULL COMMENT '事件中的呼叫状态',
  `COUNTRY` varchar(50) DEFAULT NULL COMMENT '来电国家',
  `PROVINCE` varchar(50) DEFAULT NULL COMMENT '来电号码归属省份',
  `CITY` varchar(50) DEFAULT NULL COMMENT '来电号码归属城市',
  `ISP` varchar(50) DEFAULT NULL COMMENT '来电号码运营商',
  `CONTACTSID` varchar(50) DEFAULT NULL COMMENT '联系人ID',
  `EXTENTION` varchar(50) DEFAULT NULL COMMENT '分机ID',
  `HOSTID` varchar(50) DEFAULT NULL COMMENT 'PBX服务器ID',
  `CALLTYPE` varchar(50) DEFAULT NULL COMMENT '呼叫方向类型 | 计费类型',
  `CALLDIR` varchar(50) DEFAULT NULL COMMENT '我方呼叫方向',
  `OTHERDIR` varchar(50) DEFAULT NULL COMMENT '对方呼叫方向',
  `BRIDGEID` varchar(50) DEFAULT NULL COMMENT '桥接ID',
  `BRIDRE` tinyint(4) DEFAULT NULL COMMENT '是否有桥接',
  `DISCALLER` varchar(50) DEFAULT NULL COMMENT '主叫分机号',
  `DISCALLED` varchar(50) DEFAULT NULL COMMENT '被叫分机号',
  `ORGAN` varchar(50) DEFAULT NULL COMMENT '所属组织机构ID',
  `EVENTID` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='坐席监控表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uk_call_monitor`
--

LOCK TABLES `uk_call_monitor` WRITE;
/*!40000 ALTER TABLE `uk_call_monitor` DISABLE KEYS */;
/*!40000 ALTER TABLE `uk_call_monitor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uk_call_performance`
--

DROP TABLE IF EXISTS `uk_call_performance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uk_call_performance` (
  `ID` varchar(50) NOT NULL COMMENT '坐席ID',
  `USERID` varchar(50) DEFAULT NULL COMMENT '登录人ID',
  `AGENT` varchar(50) DEFAULT NULL COMMENT '坐席工号',
  `USERNAME` varchar(50) DEFAULT NULL COMMENT '坐席用户名（登录名）',
  `AGENTNO` varchar(50) DEFAULT NULL COMMENT '分机号（坐席登录的分机号码）',
  `NAME` varchar(50) DEFAULT NULL COMMENT '坐席姓名',
  `STARTSTATUS` varchar(50) DEFAULT NULL COMMENT '上一个状态',
  `CODE` varchar(50) DEFAULT NULL COMMENT '坐席状态code（对应字典管理中的CODE）',
  `STATUS` varchar(50) DEFAULT NULL COMMENT '坐席历史状态（插入该表时的状态（复制自坐席监控表的状态））',
  `ORGI` varchar(50) DEFAULT NULL COMMENT '租户ID',
  `AGENTSERVICEID` varchar(50) DEFAULT NULL COMMENT '会话ID',
  `SKILL` varchar(50) DEFAULT NULL COMMENT '接入的技能组ID',
  `SKILLNAME` varchar(50) DEFAULT NULL COMMENT '接入的技能组名称',
  `BUSY` varchar(50) DEFAULT NULL COMMENT '是否忙',
  `CREATETIME` datetime DEFAULT NULL COMMENT '状态开始时间（取值（坐席监控表的记录创建时间））',
  `ENDTIME` datetime DEFAULT NULL COMMENT '记录创建时间（取值（纪录插入表时的时间））',
  `INTERVALTIME` varchar(50) DEFAULT NULL COMMENT '状态持续时间（秒）（endtime - createtime = intervaltime）',
  `ANI` varchar(50) DEFAULT NULL COMMENT '主叫号码',
  `CALLED` varchar(50) DEFAULT NULL COMMENT '被叫号码',
  `DIRECTION` varchar(50) DEFAULT NULL COMMENT '呼叫方向',
  `CALLSTARTTIME` datetime DEFAULT NULL COMMENT '通话开始时间',
  `CALLENDTIME` datetime DEFAULT NULL COMMENT '通话结束时间',
  `RINGDURATION` int(11) DEFAULT NULL COMMENT '振铃时长',
  `DURATION` int(11) DEFAULT NULL COMMENT '通话时长',
  `MISSCALL` tinyint(4) DEFAULT NULL COMMENT '是否漏话',
  `RECORD` tinyint(4) DEFAULT NULL COMMENT '是否录音',
  `RECORDTIME` int(11) DEFAULT NULL COMMENT '录音时长',
  `STARTRECORD` datetime DEFAULT NULL COMMENT '开始录音时间',
  `ENDRECORD` datetime DEFAULT NULL COMMENT '结束录音时间',
  `RECORDFILENAME` varchar(100) DEFAULT NULL COMMENT '录音文件名（单纯录音文件名）',
  `RECORDFILE` varchar(255) DEFAULT NULL COMMENT '录音文件全路径名（存放位置+文件名）',
  `SOURCE` varchar(50) DEFAULT NULL COMMENT '来源',
  `ANSWERTIME` datetime DEFAULT NULL COMMENT '应答时间',
  `CURRENT` tinyint(4) DEFAULT NULL COMMENT '当前通话',
  `INIT` tinyint(4) DEFAULT NULL COMMENT '初始通话',
  `ACTION` varchar(50) DEFAULT NULL COMMENT '事件动作',
  `HOST` varchar(50) DEFAULT NULL COMMENT '时间主机（FreeWitch主机帐户名）',
  `IPADDR` varchar(50) DEFAULT NULL COMMENT '主机IP（FreeWitch主机IP）',
  `SERVICESUMMARY` tinyint(4) DEFAULT NULL COMMENT '是否记录服务小结',
  `SERVICEID` varchar(32) DEFAULT NULL COMMENT '服务记录ID',
  `SERVICESTATUS` varchar(50) DEFAULT NULL COMMENT '当前呼叫状态',
  `CHANNELSTATUS` varchar(50) DEFAULT NULL COMMENT '事件中的呼叫状态',
  `COUNTRY` varchar(50) DEFAULT NULL COMMENT '来电国家',
  `PROVINCE` varchar(50) DEFAULT NULL COMMENT '来电号码归属省份',
  `CITY` varchar(50) DEFAULT NULL COMMENT '来电号码归属城市',
  `ISP` varchar(50) DEFAULT NULL COMMENT '来电号码运营商',
  `CONTACTSID` varchar(50) DEFAULT NULL COMMENT '联系人ID',
  `EXTENTION` varchar(50) DEFAULT NULL COMMENT '分机ID',
  `HOSTID` varchar(50) DEFAULT NULL COMMENT 'PBX服务器ID',
  `CALLTYPE` varchar(50) DEFAULT NULL COMMENT '呼叫方向类型 | 计费类型',
  `CALLDIR` varchar(50) DEFAULT NULL COMMENT '我方呼叫方向',
  `OTHERDIR` varchar(50) DEFAULT NULL COMMENT '对方呼叫方向',
  `BRIDGEID` varchar(50) DEFAULT NULL COMMENT '桥接ID',
  `BRIDRE` tinyint(4) DEFAULT NULL COMMENT '是否有桥接',
  `DISCALLER` varchar(50) DEFAULT NULL COMMENT '主叫分机号',
  `DISCALLED` varchar(50) DEFAULT NULL COMMENT '被叫分机号',
  `SATISF` tinyint(4) DEFAULT NULL COMMENT '是否进行满意度调查',
  `SATISFACTION` varchar(50) DEFAULT NULL COMMENT '服务小结',
  `SATISFDATE` datetime DEFAULT NULL COMMENT '满意度调查提交时间',
  `ORGAN` varchar(50) DEFAULT NULL COMMENT '所属组织机构ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='坐席绩效表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uk_call_performance`
--

LOCK TABLES `uk_call_performance` WRITE;
/*!40000 ALTER TABLE `uk_call_performance` DISABLE KEYS */;
/*!40000 ALTER TABLE `uk_call_performance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uk_callcenter_acl`
--

DROP TABLE IF EXISTS `uk_callcenter_acl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uk_callcenter_acl` (
  `id` varchar(32) NOT NULL COMMENT '主键ID',
  `creater` varchar(32) DEFAULT NULL COMMENT '创建人',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `updatetime` datetime DEFAULT NULL COMMENT '更新时间',
  `name` varchar(100) DEFAULT NULL COMMENT '名称',
  `orgi` varchar(100) DEFAULT NULL COMMENT '租户ID',
  `hostid` varchar(32) DEFAULT NULL COMMENT 'PBX服务器ID',
  `type` varchar(32) DEFAULT NULL COMMENT '类型',
  `strategy` text COMMENT '策略内容',
  `defaultvalue` varchar(50) DEFAULT NULL COMMENT '默认值',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='呼叫中心ACL表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uk_callcenter_acl`
--

LOCK TABLES `uk_callcenter_acl` WRITE;
/*!40000 ALTER TABLE `uk_callcenter_acl` DISABLE KEYS */;
/*!40000 ALTER TABLE `uk_callcenter_acl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uk_callcenter_event`
--

DROP TABLE IF EXISTS `uk_callcenter_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uk_callcenter_event` (
  `ID` varchar(100) NOT NULL COMMENT '主键ID',
  `NAME` varchar(50) DEFAULT NULL COMMENT '名称',
  `CODE` varchar(50) DEFAULT NULL COMMENT '代码',
  `CREATETIME` datetime DEFAULT NULL COMMENT '创建时间',
  `CREATER` varchar(32) DEFAULT NULL COMMENT '创建人',
  `UPDATETIME` datetime DEFAULT NULL COMMENT '更新时间',
  `ORGI` varchar(32) DEFAULT NULL COMMENT '租户ID',
  `organ` varchar(50) DEFAULT NULL COMMENT '部门',
  `organid` varchar(32) DEFAULT NULL COMMENT '部门ID',
  `USERNAME` varchar(50) DEFAULT NULL COMMENT '用户名',
  `SOURCE` varchar(50) DEFAULT NULL COMMENT '来源',
  `ANSWER` varchar(50) DEFAULT NULL COMMENT '应答时间',
  `scurrent` tinyint(4) DEFAULT NULL COMMENT '是否当前通话',
  `INIT` tinyint(4) DEFAULT NULL COMMENT '初始通话',
  `CALLER` varchar(50) DEFAULT NULL COMMENT '呼叫发起号码',
  `CALLING` varchar(50) DEFAULT NULL COMMENT '呼叫对象',
  `CALLED` varchar(50) DEFAULT NULL COMMENT '被叫号码',
  `AGENTYPE` varchar(50) DEFAULT NULL COMMENT '坐席类型',
  `QUENE` varchar(50) DEFAULT NULL COMMENT '队列名称',
  `ANI` varchar(50) DEFAULT NULL COMMENT '主叫号码',
  `TOUSER` varchar(50) DEFAULT NULL COMMENT '目标用户',
  `DIRECTION` varchar(50) DEFAULT NULL COMMENT '呼叫方向',
  `STATE` varchar(50) DEFAULT NULL COMMENT '状态',
  `AGENT` varchar(50) DEFAULT NULL COMMENT '坐席工号',
  `agentname` varchar(255) DEFAULT NULL COMMENT '坐席名字',
  `ACTION` varchar(50) DEFAULT NULL COMMENT '事件动作',
  `HOST` varchar(50) DEFAULT NULL COMMENT '时间主机',
  `IPADDR` varchar(50) DEFAULT NULL COMMENT '主机IP',
  `LOCALDATETIME` varchar(50) DEFAULT NULL COMMENT '时间发起时间',
  `STATUS` varchar(50) DEFAULT NULL COMMENT '状态代码',
  `TIME` decimal(20,0) DEFAULT NULL COMMENT '时间秒值',
  `STARTTIME` datetime DEFAULT NULL COMMENT '通话开始时间',
  `ENDTIME` datetime DEFAULT NULL COMMENT '通话结束时间',
  `DURATION` int(11) DEFAULT NULL COMMENT '通话时长',
  `INSIDE` tinyint(4) DEFAULT NULL COMMENT '内线',
  `MISSCALL` tinyint(4) DEFAULT NULL COMMENT '是否漏话',
  `srecord` tinyint(4) DEFAULT NULL COMMENT '是否录音',
  `RECORDTIME` int(11) DEFAULT NULL COMMENT '录音时长',
  `STARTRECORD` datetime DEFAULT NULL COMMENT '开始录音时间',
  `ENDRECORD` datetime DEFAULT NULL COMMENT '结束录音时间',
  `ANSWERTIME` datetime DEFAULT NULL COMMENT '应答时间',
  `RINGDURATION` int(11) DEFAULT NULL COMMENT '振铃时长',
  `SERVICESUMMARY` tinyint(4) DEFAULT NULL COMMENT '是否记录服务小结',
  `SERVICEID` varchar(32) DEFAULT NULL COMMENT '服务记录ID',
  `RECORDFILE` varchar(255) DEFAULT NULL COMMENT '录音文件名',
  `CALLBACK` tinyint(4) DEFAULT NULL COMMENT '回呼',
  `CCQUENE` varchar(50) DEFAULT NULL COMMENT '转接队列',
  `SERVICESTATUS` varchar(20) DEFAULT NULL COMMENT '当前呼叫状态',
  `CHANNELSTATUS` varchar(50) DEFAULT NULL COMMENT '事件中的呼叫状态',
  `COUNTRY` varchar(50) DEFAULT NULL COMMENT '来电国家',
  `PROVINCE` varchar(50) DEFAULT NULL COMMENT '来电号码归属省份',
  `CITY` varchar(50) DEFAULT NULL COMMENT '来电归属号码城市',
  `ISP` varchar(50) DEFAULT NULL COMMENT '来电号码运营商',
  `VOICECALLED` varchar(50) DEFAULT NULL COMMENT '语音呼叫',
  `CONTACTSID` varchar(32) DEFAULT NULL COMMENT '联系人ID',
  `EXTENTION` varchar(32) DEFAULT NULL COMMENT '分机ID',
  `HOSTID` varchar(32) DEFAULT NULL COMMENT 'PBX服务器ID',
  `CALLTYPE` varchar(20) DEFAULT NULL COMMENT '呼叫方向类型|计费类型',
  `CALLDIR` varchar(30) DEFAULT NULL COMMENT '呼叫方向',
  `OTHERDIR` varchar(30) DEFAULT NULL COMMENT '对边呼叫方向',
  `OTHERLEGDEST` varchar(50) DEFAULT NULL COMMENT '呼叫另一方号码',
  `BRIDGEID` varchar(100) DEFAULT NULL COMMENT '桥接ID',
  `BRIDGE` tinyint(4) DEFAULT NULL COMMENT '是否有桥接',
  `RECORDFILENAME` varchar(100) DEFAULT NULL COMMENT '录音文件名',
  `DISCALLER` varchar(50) DEFAULT NULL COMMENT '显示主叫',
  `DISCALLED` varchar(50) DEFAULT NULL COMMENT '显示被叫',
  `SATISF` tinyint(4) DEFAULT '0' COMMENT '满意度',
  `SATISFACTION` varchar(32) DEFAULT NULL COMMENT '满意度结果',
  `SATISFDATE` datetime DEFAULT NULL COMMENT '满意度时间',
  `datestr` varchar(32) DEFAULT '0' COMMENT '坐席通话日期（yyyy-MM-dd）用于每小时通话数量折线图',
  `hourstr` varchar(32) DEFAULT '0' COMMENT '坐席通话时间小时（HH）用于每小时通话数量折线图',
  `taskid` varchar(32) DEFAULT NULL COMMENT '任务ID',
  `actid` varchar(32) DEFAULT NULL COMMENT '活动ID',
  `batid` varchar(32) DEFAULT NULL COMMENT '批次ID',
  `dataid` varchar(32) DEFAULT NULL COMMENT '数据ID',
  `statustype` varchar(32) DEFAULT NULL COMMENT '号码隐藏状态',
  `disphonenum` varchar(32) DEFAULT NULL COMMENT '号码',
  `distype` varchar(32) DEFAULT NULL COMMENT '显示类型',
  `nameid` varchar(50) DEFAULT NULL COMMENT '名单ID',
  `siptrunk` varchar(32) DEFAULT NULL COMMENT '拨打的网关',
  `prefix` tinyint(4) DEFAULT '0' COMMENT '是否在号码前加拨0',
  `dialplan` varchar(32) DEFAULT NULL COMMENT '呼叫计划ID',
  `callid` varchar(100) DEFAULT NULL COMMENT 'FreeSwitch通话ID',
  `voicechannel` varchar(255) DEFAULT NULL COMMENT '语音渠道标识',
  `recordingfile` varchar(150) DEFAULT NULL COMMENT '录音文件标识',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='通话记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uk_callcenter_event`
--

LOCK TABLES `uk_callcenter_event` WRITE;
/*!40000 ALTER TABLE `uk_callcenter_event` DISABLE KEYS */;
/*!40000 ALTER TABLE `uk_callcenter_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uk_callcenter_extention`
--

DROP TABLE IF EXISTS `uk_callcenter_extention`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uk_callcenter_extention` (
  `id` varchar(32) NOT NULL COMMENT '主键ID',
  `creater` varchar(32) DEFAULT NULL COMMENT '创建人',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `updatetime` datetime DEFAULT NULL COMMENT '更新时间',
  `extention` varchar(100) DEFAULT NULL COMMENT '分机号',
  `orgi` varchar(100) DEFAULT NULL COMMENT '租户ID',
  `hostid` varchar(100) DEFAULT NULL COMMENT 'PBX服务ID',
  `agentno` varchar(50) DEFAULT NULL COMMENT '坐席工号',
  `password` varchar(100) DEFAULT NULL COMMENT '密码',
  `callout` tinyint(4) DEFAULT NULL COMMENT '允许呼出',
  `playnum` tinyint(4) DEFAULT NULL COMMENT '播报工号',
  `srecord` tinyint(4) DEFAULT NULL,
  `extype` varchar(50) DEFAULT NULL COMMENT '分机类型',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `subtype` varchar(50) DEFAULT NULL COMMENT '分机类型',
  `mediapath` varchar(255) DEFAULT NULL COMMENT '播报工号语音文件',
  `afterprocess` tinyint(4) DEFAULT '0' COMMENT '坐席通话后启用后处理功能',
  `siptrunk` varchar(50) DEFAULT NULL,
  `enableai` tinyint(4) DEFAULT '0' COMMENT '启用AI机器人',
  `aiid` varchar(32) DEFAULT NULL COMMENT 'AI机器人',
  `sceneid` varchar(32) DEFAULT NULL COMMENT '启用场景配置',
  `welcomemsg` text COMMENT '机器人欢迎语',
  `waitmsg` text COMMENT '机器人等待提示语',
  `tipmessage` text COMMENT '机器人提示客户说话',
  `asrrecordpath` varchar(255) DEFAULT NULL COMMENT 'ASR结果路径',
  `ttsrecordpath` varchar(255) DEFAULT NULL COMMENT 'ASR结果路径',
  `errormessage` varchar(255) DEFAULT NULL COMMENT '异常提示消息',
  `enablewebrtc` tinyint(4) DEFAULT '0' COMMENT '启用WebRTC',
  `bustype` varchar(32) DEFAULT NULL COMMENT '业务类型（电销sale/问卷quesurvey）',
  `proid` varchar(32) DEFAULT NULL COMMENT '（产品ID）',
  `queid` varchar(32) DEFAULT NULL COMMENT '（问卷ID）',
  `aitype` varchar(32) DEFAULT NULL COMMENT '机器人类型（smartai/quesurvey）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='分机信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uk_callcenter_extention`
--

LOCK TABLES `uk_callcenter_extention` WRITE;
/*!40000 ALTER TABLE `uk_callcenter_extention` DISABLE KEYS */;
/*!40000 ALTER TABLE `uk_callcenter_extention` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uk_callcenter_ivr`
--

DROP TABLE IF EXISTS `uk_callcenter_ivr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uk_callcenter_ivr` (
  `id` varchar(32) NOT NULL COMMENT '主键ID',
  `creater` varchar(32) DEFAULT NULL COMMENT '创建人ID',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `updatetime` datetime DEFAULT NULL COMMENT '更新时间',
  `name` varchar(100) DEFAULT NULL COMMENT '名称',
  `orgi` varchar(100) DEFAULT NULL COMMENT '租户ID',
  `hostid` varchar(32) DEFAULT NULL COMMENT 'PBX服务器ID',
  `type` varchar(32) DEFAULT NULL COMMENT '类型',
  `greetlong` varchar(100) DEFAULT NULL COMMENT '欢迎提示语音',
  `greetshort` varchar(100) DEFAULT NULL COMMENT '欢迎提示短语音',
  `invalidsound` varchar(100) DEFAULT NULL COMMENT '无效输入提示语音',
  `exitsound` varchar(100) DEFAULT NULL COMMENT '离开语音',
  `confirmmacro` varchar(50) DEFAULT NULL COMMENT '确认宏指令',
  `confirmkey` varchar(50) DEFAULT NULL COMMENT '确认按键',
  `ttsengine` varchar(20) DEFAULT NULL COMMENT 'TTS引擎',
  `ttsvoice` varchar(50) DEFAULT NULL COMMENT 'TTS语音',
  `confirmattempts` varchar(50) DEFAULT NULL COMMENT '确认提示消息',
  `timeout` int(11) DEFAULT NULL COMMENT '超时时间',
  `interdigittimeout` int(11) DEFAULT NULL COMMENT '呼叫等待超时',
  `maxfailures` int(11) DEFAULT NULL COMMENT '最大失败次数',
  `maxtimeouts` int(11) DEFAULT NULL COMMENT '最大外呼次数',
  `digitlen` int(11) DEFAULT NULL COMMENT '数字长度',
  `menucontent` text COMMENT 'IVR菜单内容',
  `action` varchar(50) DEFAULT NULL COMMENT '指令',
  `digits` varchar(50) DEFAULT NULL COMMENT '拨号键',
  `param` varchar(255) DEFAULT NULL COMMENT '参数',
  `parentid` varchar(32) DEFAULT NULL COMMENT '上级ID',
  `extentionid` varchar(32) DEFAULT NULL COMMENT '分机ID',
  `enableai` tinyint(4) DEFAULT '0' COMMENT '启用AI机器人',
  `aiid` varchar(32) DEFAULT NULL COMMENT 'AI机器人',
  `sceneid` varchar(32) DEFAULT NULL COMMENT '启用场景配置',
  `welcomemsg` text COMMENT '机器人欢迎语',
  `waitmsg` text COMMENT '机器人等待提示语',
  `tipmessage` text COMMENT '机器人提示客户说话',
  `asrrecordpath` varchar(255) DEFAULT NULL COMMENT 'ASR结果路径',
  `ttsrecordpath` varchar(255) DEFAULT NULL COMMENT 'ASR结果路径',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='IVR菜单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uk_callcenter_ivr`
--

LOCK TABLES `uk_callcenter_ivr` WRITE;
/*!40000 ALTER TABLE `uk_callcenter_ivr` DISABLE KEYS */;
/*!40000 ALTER TABLE `uk_callcenter_ivr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uk_callcenter_media`
--

DROP TABLE IF EXISTS `uk_callcenter_media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uk_callcenter_media` (
  `id` varchar(32) NOT NULL COMMENT '主键ID',
  `creater` varchar(32) DEFAULT NULL COMMENT '创建人ID',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `updatetime` datetime DEFAULT NULL COMMENT '更新时间',
  `name` varchar(100) DEFAULT NULL COMMENT '名称',
  `orgi` varchar(100) DEFAULT NULL COMMENT '租户ID',
  `hostid` varchar(32) DEFAULT NULL COMMENT 'PBX服务ID',
  `type` varchar(32) DEFAULT NULL COMMENT '类型',
  `filename` varchar(255) DEFAULT NULL COMMENT '文件名',
  `content` varchar(50) DEFAULT NULL COMMENT '文件类型',
  `filelength` int(11) DEFAULT NULL COMMENT '语音文件长度',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='媒体资源表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uk_callcenter_media`
--

LOCK TABLES `uk_callcenter_media` WRITE;
/*!40000 ALTER TABLE `uk_callcenter_media` DISABLE KEYS */;
/*!40000 ALTER TABLE `uk_callcenter_media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uk_callcenter_pbxhost`
--

DROP TABLE IF EXISTS `uk_callcenter_pbxhost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uk_callcenter_pbxhost` (
  `id` varchar(32) NOT NULL COMMENT '主键ID',
  `creater` varchar(32) DEFAULT NULL COMMENT '创建人',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `updatetime` datetime DEFAULT NULL COMMENT '更新时间',
  `name` varchar(100) DEFAULT NULL COMMENT '名称',
  `orgi` varchar(100) DEFAULT NULL COMMENT '租户ID',
  `hostname` varchar(100) DEFAULT NULL COMMENT '主机名',
  `port` int(11) DEFAULT NULL COMMENT '端口',
  `password` varchar(100) DEFAULT NULL COMMENT '密码',
  `ipaddr` varchar(32) DEFAULT NULL COMMENT 'IP地址',
  `callbacknumber` varchar(50) DEFAULT NULL COMMENT '回呼号码',
  `autoanswer` tinyint(4) DEFAULT NULL COMMENT '启用自动接听',
  `callcenter` tinyint(4) DEFAULT NULL COMMENT '启用呼叫中心功能',
  `recordpath` varchar(100) DEFAULT NULL COMMENT '录音文件位置',
  `ivrpath` varchar(100) DEFAULT NULL COMMENT 'IVR文件位置',
  `fspath` varchar(100) DEFAULT NULL COMMENT 'FS安装路径',
  `device` varchar(50) DEFAULT NULL COMMENT '语音设备类型',
  `callbacktype` varchar(32) DEFAULT NULL COMMENT '回呼送号号码',
  `sipautoanswer` tinyint(4) DEFAULT NULL COMMENT 'SIP自动应答',
  `abscodec` varchar(50) DEFAULT NULL COMMENT '通信编码',
  `enableai` tinyint(4) DEFAULT NULL COMMENT '启用机器人',
  `aiid` varchar(32) DEFAULT NULL COMMENT '机器人ID',
  `sceneid` varchar(32) DEFAULT NULL COMMENT '场景ID',
  `welcomemsg` text COMMENT '机器人欢迎语',
  `waitmsg` text COMMENT '机器人等待提示语',
  `tipmessage` text COMMENT '机器人提示客户说话',
  `asrrecordpath` varchar(255) DEFAULT NULL COMMENT 'ASR结果路径',
  `ttsrecordpath` varchar(255) DEFAULT NULL COMMENT 'ASR结果路径',
  `afterprocess` tinyint(4) DEFAULT '0' COMMENT '坐席通话后启用后处理功能',
  `enablewebrtc` tinyint(4) DEFAULT '0' COMMENT '启用WebRTC',
  `webrtcaddress` varchar(100) DEFAULT NULL COMMENT 'WebRTC地址',
  `webrtcport` varchar(100) DEFAULT NULL COMMENT 'WebRTC端口',
  `webrtcssl` tinyint(4) DEFAULT '0' COMMENT 'WebRTC启用SSL',
  `dissipphone` tinyint(4) DEFAULT '0' COMMENT '外呼隐藏话机上的号码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='FS服务器信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uk_callcenter_pbxhost`
--

LOCK TABLES `uk_callcenter_pbxhost` WRITE;
/*!40000 ALTER TABLE `uk_callcenter_pbxhost` DISABLE KEYS */;
/*!40000 ALTER TABLE `uk_callcenter_pbxhost` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uk_callcenter_router`
--

DROP TABLE IF EXISTS `uk_callcenter_router`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uk_callcenter_router` (
  `id` varchar(32) NOT NULL COMMENT '主键ID',
  `creater` varchar(32) DEFAULT NULL COMMENT '创建人',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `updatetime` datetime DEFAULT NULL COMMENT '更新时间',
  `name` varchar(100) DEFAULT NULL COMMENT '名称',
  `orgi` varchar(100) DEFAULT NULL COMMENT '租户ID',
  `hostid` varchar(32) DEFAULT NULL COMMENT 'PBX服务器ID',
  `type` varchar(32) DEFAULT NULL COMMENT '类型',
  `regex` varchar(255) DEFAULT NULL COMMENT '匹配正则',
  `allow` tinyint(4) DEFAULT NULL COMMENT '允许',
  `falsebreak` tinyint(4) DEFAULT NULL COMMENT '异常终止',
  `routerinx` int(11) DEFAULT NULL COMMENT '编号',
  `routercontent` text COMMENT '路由规则',
  `field` varchar(50) DEFAULT NULL COMMENT '字段名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='拨号计划表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uk_callcenter_router`
--

LOCK TABLES `uk_callcenter_router` WRITE;
/*!40000 ALTER TABLE `uk_callcenter_router` DISABLE KEYS */;
/*!40000 ALTER TABLE `uk_callcenter_router` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uk_callcenter_siptrunk`
--

DROP TABLE IF EXISTS `uk_callcenter_siptrunk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uk_callcenter_siptrunk` (
  `id` varchar(32) NOT NULL COMMENT '组件ID',
  `creater` varchar(32) DEFAULT NULL COMMENT '创建人',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `updatetime` datetime DEFAULT NULL COMMENT '更新时间',
  `name` varchar(100) DEFAULT NULL COMMENT 'SIP中继名称',
  `orgi` varchar(100) DEFAULT NULL COMMENT '租户ID',
  `hostid` varchar(32) DEFAULT NULL COMMENT 'PBX服务器ID',
  `type` varchar(32) DEFAULT NULL COMMENT '类型',
  `sipcontent` text COMMENT 'SIP配置内容',
  `sipserver` varchar(50) DEFAULT NULL COMMENT '服务器地址',
  `extention` varchar(50) DEFAULT NULL COMMENT '转分机号',
  `outnumber` varchar(50) DEFAULT NULL COMMENT '出局号码',
  `prefix` varchar(50) DEFAULT NULL COMMENT '前缀',
  `port` int(11) DEFAULT NULL COMMENT '端口',
  `exptime` int(11) DEFAULT NULL COMMENT '超时时长',
  `retry` int(11) DEFAULT NULL COMMENT '重试次数',
  `register` tinyint(4) DEFAULT NULL COMMENT '是否注册',
  `fromuser` tinyint(4) DEFAULT NULL COMMENT '是否添加FROM',
  `transprotocol` tinyint(4) DEFAULT NULL COMMENT '协议',
  `username` varchar(50) DEFAULT NULL COMMENT '用户名',
  `authuser` varchar(50) DEFAULT NULL COMMENT '认证用户名',
  `password` varchar(50) DEFAULT NULL COMMENT '密码',
  `protocol` varchar(50) DEFAULT NULL COMMENT '协议',
  `heartbeat` int(11) DEFAULT NULL COMMENT '心跳时长',
  `dtmf` varchar(20) DEFAULT NULL COMMENT 'DTMF协议',
  `province` varchar(50) DEFAULT NULL COMMENT '省份',
  `city` varchar(50) DEFAULT NULL COMMENT '城市',
  `defaultsip` tinyint(4) DEFAULT '0' COMMENT '默认网关',
  `title` varchar(50) DEFAULT NULL COMMENT '标题',
  `busyext` varchar(50) DEFAULT NULL COMMENT '坐席忙的时候转到号码',
  `notready` varchar(50) DEFAULT NULL COMMENT '坐席不在线的时候转到号码',
  `noname` varchar(50) DEFAULT NULL COMMENT '未找到名单或未分配的时候转到号码',
  `enablecallagent` tinyint(4) DEFAULT '0' COMMENT '坐席不在线转手机',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='SIP网关信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uk_callcenter_siptrunk`
--

LOCK TABLES `uk_callcenter_siptrunk` WRITE;
/*!40000 ALTER TABLE `uk_callcenter_siptrunk` DISABLE KEYS */;
/*!40000 ALTER TABLE `uk_callcenter_siptrunk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uk_callcenter_skill`
--

DROP TABLE IF EXISTS `uk_callcenter_skill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uk_callcenter_skill` (
  `id` varchar(32) NOT NULL COMMENT '主键ID',
  `creater` varchar(32) DEFAULT NULL COMMENT '创建人ID',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `updatetime` datetime DEFAULT NULL COMMENT '更新时间',
  `orgi` varchar(100) DEFAULT NULL COMMENT '租户ID',
  `name` varchar(100) DEFAULT NULL COMMENT '名称',
  `skill` varchar(50) DEFAULT NULL COMMENT '技能组名称',
  `password` varchar(100) DEFAULT NULL COMMENT '密码',
  `quene` varchar(100) DEFAULT NULL COMMENT '队列名称',
  `hostid` varchar(32) DEFAULT NULL COMMENT 'PBX服务器ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='电话技能组表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uk_callcenter_skill`
--

LOCK TABLES `uk_callcenter_skill` WRITE;
/*!40000 ALTER TABLE `uk_callcenter_skill` DISABLE KEYS */;
/*!40000 ALTER TABLE `uk_callcenter_skill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uk_callcenter_skillext`
--

DROP TABLE IF EXISTS `uk_callcenter_skillext`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uk_callcenter_skillext` (
  `id` varchar(32) NOT NULL DEFAULT '主键ID' COMMENT '主键ID',
  `creater` varchar(32) DEFAULT NULL COMMENT '创建人',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `updatetime` datetime DEFAULT NULL COMMENT '更新时间',
  `name` varchar(100) DEFAULT NULL COMMENT '名称',
  `orgi` varchar(100) DEFAULT NULL COMMENT '租户ID',
  `skillid` varchar(32) DEFAULT NULL COMMENT '技能组ID',
  `extention` varchar(32) DEFAULT NULL COMMENT '分机',
  `hostid` varchar(32) DEFAULT NULL COMMENT 'PBX服务器ID',
  `type` varchar(32) DEFAULT NULL COMMENT '类型',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='技能组对应表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uk_callcenter_skillext`
--

LOCK TABLES `uk_callcenter_skillext` WRITE;
/*!40000 ALTER TABLE `uk_callcenter_skillext` DISABLE KEYS */;
/*!40000 ALTER TABLE `uk_callcenter_skillext` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uk_chat_message`
--

DROP TABLE IF EXISTS `uk_chat_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uk_chat_message` (
  `type` varchar(100) DEFAULT '' COMMENT '类型',
  `id` varchar(32) NOT NULL DEFAULT '' COMMENT '主键ID',
  `calltype` varchar(32) DEFAULT NULL COMMENT '对话方向',
  `contextid` varchar(50) DEFAULT NULL COMMENT '会话ID',
  `usession` varchar(100) DEFAULT NULL COMMENT '会话ID',
  `touser` varchar(50) DEFAULT NULL COMMENT '目标用户',
  `channel` varchar(32) DEFAULT NULL COMMENT '渠道',
  `appid` varchar(50) DEFAULT NULL COMMENT 'SNSID',
  `userid` varchar(100) DEFAULT '' COMMENT '用户名',
  `message` text COMMENT '消息内容',
  `msgtype` varchar(100) DEFAULT '' COMMENT '消息类型',
  `orgi` varchar(100) DEFAULT '' COMMENT '租户ID',
  `msgid` varchar(100) DEFAULT '' COMMENT '消息ID（微信）',
  `expmsg` text COMMENT '原始消息',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `createtime` varchar(50) DEFAULT NULL COMMENT '创建时间',
  `creater` varchar(255) DEFAULT NULL COMMENT '创建人',
  `updatetime` decimal(20,0) DEFAULT NULL COMMENT '修改时间',
  `update_user` varchar(255) DEFAULT NULL COMMENT '修改人',
  `username` varchar(255) DEFAULT NULL COMMENT '用户名',
  `assignedto` varchar(255) DEFAULT NULL COMMENT '分配目标用户',
  `wfstatus` varchar(255) DEFAULT NULL COMMENT '流程状态',
  `shares` varchar(255) DEFAULT NULL COMMENT '分享给',
  `owner` varchar(255) DEFAULT NULL COMMENT '所属人',
  `datadept` varchar(255) DEFAULT NULL COMMENT '创建人部门',
  `batid` varchar(32) DEFAULT NULL COMMENT '批次ID',
  `model` varchar(32) DEFAULT '' COMMENT '消息所属组件',
  `chatype` varchar(32) DEFAULT NULL COMMENT '对话类型',
  `agentserviceid` varchar(32) DEFAULT NULL COMMENT '坐席服务ID',
  `mediaid` varchar(255) DEFAULT NULL COMMENT '媒体文件ID（微信）',
  `locx` varchar(20) DEFAULT NULL COMMENT '地理位置',
  `locy` varchar(20) DEFAULT NULL COMMENT '地理位置',
  `duration` varchar(30) DEFAULT NULL COMMENT '会话时长',
  `scale` varchar(10) DEFAULT NULL COMMENT '地图级别',
  `filename` varchar(255) DEFAULT NULL COMMENT '文件名',
  `filesize` int(11) DEFAULT NULL COMMENT '文件尺寸',
  `attachmentid` varchar(32) DEFAULT NULL COMMENT '附件ID',
  `lastagentmsgtime` datetime DEFAULT NULL COMMENT '最近一次坐席发送消息时间',
  `agentreplytime` int(11) DEFAULT NULL COMMENT '坐席回复消息时间',
  `lastmsgtime` datetime DEFAULT NULL COMMENT '访客最近一次发送消息时间',
  `agentreplyinterval` int(11) DEFAULT NULL COMMENT '坐席回复消息时间',
  `sessionid` varchar(50) DEFAULT NULL COMMENT '会话ID',
  `cooperation` tinyint(4) DEFAULT NULL COMMENT '合并消息',
  `datastatus` tinyint(4) DEFAULT '0' COMMENT '数据状态（已删除/未删除）',
  `intervented` tinyint(4) DEFAULT '0' COMMENT '是否是会话监控发出的干预消息',
  `supervisorname` varchar(100) DEFAULT NULL COMMENT '会话监控人员的名字',
  `aiid` varchar(32) DEFAULT '0' COMMENT '机器人ID',
  `topic` tinyint(4) DEFAULT '0' COMMENT '是否命中知识库',
  `topicid` varchar(32) DEFAULT NULL COMMENT '命中知识库ID',
  `topicatid` varchar(32) DEFAULT NULL COMMENT '命中知识库分类ID',
  `aichat` tinyint(4) DEFAULT '0' COMMENT '是否在和AI对话',
  `suggestmsg` text COMMENT '推荐的提示信息',
  `islabel` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否添加标记',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `sessionid` (`usession`) USING BTREE,
  KEY `orgi` (`orgi`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='坐席对话表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uk_chat_message`
--

LOCK TABLES `uk_chat_message` WRITE;
/*!40000 ALTER TABLE `uk_chat_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `uk_chat_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uk_columnproperties`
--

DROP TABLE IF EXISTS `uk_columnproperties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uk_columnproperties` (
  `id` varchar(32) NOT NULL COMMENT '主键ID',
  `format` varchar(255) DEFAULT NULL COMMENT '格式化',
  `prefix` varchar(255) DEFAULT NULL COMMENT '前缀',
  `width` varchar(255) DEFAULT NULL COMMENT '组件宽度',
  `suffix` varchar(255) DEFAULT NULL COMMENT '组件后缀',
  `font` varchar(255) DEFAULT NULL COMMENT '字体',
  `colname` varchar(255) DEFAULT NULL COMMENT '字段名称',
  `border` varchar(255) DEFAULT NULL COMMENT '组件宽度',
  `decimalCount` varchar(255) DEFAULT NULL COMMENT '数字格式化',
  `sepsymbol` varchar(255) DEFAULT NULL COMMENT '组件标签',
  `alignment` varchar(255) DEFAULT NULL COMMENT '对齐方式',
  `fontStyle` varchar(255) DEFAULT NULL COMMENT '字体样式',
  `fontColor` varchar(255) DEFAULT NULL COMMENT '字体颜色',
  `paramName` varchar(255) DEFAULT NULL COMMENT '参数名称',
  `orgi` varchar(255) DEFAULT NULL COMMENT '租户ID',
  `dataid` varchar(255) DEFAULT NULL COMMENT '数据ID',
  `modelid` varchar(255) DEFAULT NULL COMMENT '组件ID',
  `dataname` varchar(255) DEFAULT NULL COMMENT '名称',
  `cur` varchar(255) DEFAULT NULL COMMENT '位置',
  `hyp` varchar(255) DEFAULT NULL COMMENT '超链',
  `timeFormat` varchar(255) DEFAULT NULL COMMENT '时间格式化',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `SORTINDEX` int(11) DEFAULT NULL COMMENT '排序位置',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='报表字段映射表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uk_columnproperties`
--

LOCK TABLES `uk_columnproperties` WRITE;
/*!40000 ALTER TABLE `uk_columnproperties` DISABLE KEYS */;
/*!40000 ALTER TABLE `uk_columnproperties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uk_consult_invite`
--

DROP TABLE IF EXISTS `uk_consult_invite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uk_consult_invite` (
  `id` varchar(32) NOT NULL COMMENT '主键ID',
  `impid` varchar(32) DEFAULT NULL COMMENT '批次ID',
  `orgi` varchar(32) DEFAULT NULL COMMENT '租户ID',
  `owner` varchar(32) DEFAULT NULL COMMENT '数据拥有人',
  `processid` varchar(32) DEFAULT NULL COMMENT '流程ID',
  `shares` varchar(32) DEFAULT NULL COMMENT '分享给',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_user` varchar(32) DEFAULT NULL COMMENT '修改人',
  `username` varchar(32) DEFAULT NULL COMMENT '用户名',
  `wfstatus` varchar(32) DEFAULT NULL COMMENT '流程状态',
  `consult_invite_model` varchar(32) DEFAULT NULL COMMENT '邀请模式',
  `consult_invite_content` varchar(255) DEFAULT NULL COMMENT '邀请框文本',
  `consult_invite_position` varchar(32) DEFAULT NULL COMMENT '邀请框位置',
  `consult_invite_color` varchar(32) DEFAULT NULL COMMENT '邀请框颜色',
  `consult_invite_right` int(11) DEFAULT NULL COMMENT '邀请框距右边位置',
  `consult_invite_left` int(11) DEFAULT NULL COMMENT '邀请框距左侧',
  `consult_invite_bottom` int(11) DEFAULT NULL COMMENT '邀请框距下边位置',
  `consult_invite_top` int(11) DEFAULT NULL COMMENT '邀请框距顶部位置',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `consult_invite_width` int(32) DEFAULT NULL COMMENT '邀请框宽度',
  `consult_invite_poptype` varchar(32) DEFAULT NULL COMMENT '邀请框悬浮位置',
  `consult_invite_fontsize` int(32) DEFAULT NULL COMMENT '邀请框文本字体',
  `consult_invite_fontstyle` varchar(32) DEFAULT NULL COMMENT '邀请框文本样式',
  `consult_invite_fontcolor` varchar(32) DEFAULT NULL COMMENT '邀请框文本颜色',
  `consult_invite_interval` int(32) DEFAULT NULL COMMENT '邀请框弹出频率',
  `consult_invite_repeat` varchar(32) DEFAULT NULL COMMENT '邀请框背景平铺',
  `consult_invite_hight` int(32) DEFAULT NULL COMMENT '邀请框高度',
  `snsaccountid` varchar(56) DEFAULT NULL COMMENT 'SNSID',
  `consult_vsitorbtn_position` varchar(32) DEFAULT NULL COMMENT '悬浮图标位置',
  `consult_vsitorbtn_content` varchar(32) DEFAULT NULL COMMENT '悬浮框文本',
  `consult_vsitorbtn_right` varchar(32) DEFAULT NULL COMMENT '悬浮框距右侧位置',
  `consult_vsitorbtn_left` varchar(32) DEFAULT NULL COMMENT '悬浮框距左侧位置',
  `consult_vsitorbtn_top` varchar(32) DEFAULT NULL COMMENT '悬浮框距顶部',
  `consult_vsitorbtn_color` varchar(32) DEFAULT NULL COMMENT '悬浮框颜色',
  `consult_vsitorbtn_model` varchar(32) DEFAULT NULL COMMENT '悬浮框模式',
  `consult_vsitorbtn_bottom` varchar(32) DEFAULT NULL COMMENT '悬浮框距底部',
  `consult_invite_backimg` varchar(32) DEFAULT NULL COMMENT '悬浮框背景图片',
  `datadept` varchar(32) DEFAULT NULL COMMENT '数据部门',
  `agent_online` varchar(32) DEFAULT NULL COMMENT '坐席在线',
  `consult_dialog_color` varchar(32) DEFAULT NULL COMMENT '对话框颜色',
  `consult_dialog_logo` varchar(100) DEFAULT NULL COMMENT '对话框LOGO',
  `consult_dialog_headimg` varchar(100) DEFAULT NULL COMMENT '对话框头像',
  `consult_vsitorbtn_display` int(11) DEFAULT NULL COMMENT '显示按钮',
  `dialog_name` varchar(100) DEFAULT NULL COMMENT '对话显示名称',
  `dialog_address` varchar(100) DEFAULT NULL COMMENT '对话框地址',
  `dialog_phone` varchar(32) DEFAULT NULL COMMENT '对话框电话号码',
  `dialog_mail` varchar(100) DEFAULT NULL COMMENT '对话框邮件',
  `dialog_introduction` text COMMENT '对话框介绍',
  `dialog_message` text COMMENT '对话框欢迎信息',
  `dialog_ad` varchar(100) DEFAULT NULL COMMENT '对话框广告',
  `consult_invite_enable` tinyint(4) DEFAULT NULL COMMENT '启用邀请框',
  `consult_invite_accept` varchar(50) DEFAULT NULL COMMENT '邀请框统一按钮文本',
  `consult_invite_later` varchar(50) DEFAULT NULL COMMENT '延迟弹出邀请框',
  `consult_invite_delay` int(11) DEFAULT NULL COMMENT '邀请框延迟时间',
  `consult_invite_bg` varchar(100) DEFAULT NULL COMMENT '邀请框背景图片',
  `leavemessage` tinyint(4) DEFAULT NULL COMMENT '留言提示文本',
  `lvmname` tinyint(4) DEFAULT NULL COMMENT '留言框显示名称字段',
  `lvmphone` tinyint(4) DEFAULT NULL COMMENT '留言卡电话号码字段',
  `lvmemail` tinyint(4) DEFAULT NULL COMMENT '留言卡Email字段',
  `lvmaddress` tinyint(4) DEFAULT NULL COMMENT '留言卡地址字段',
  `lvmqq` tinyint(4) DEFAULT '0' COMMENT '留言框QQ',
  `lvmcontent` tinyint(4) DEFAULT NULL COMMENT '留言卡留言内容字段',
  `workinghours` text COMMENT '工作时间段',
  `lvmopentype` varchar(32) DEFAULT NULL COMMENT '留言卡弹出模式',
  `skill` tinyint(4) DEFAULT '0' COMMENT '技能组',
  `notinwhmsg` text COMMENT '非工作时间段提示文本',
  `consult_skill_fixed` tinyint(4) DEFAULT '0' COMMENT '是否绑定单一技能组',
  `consult_skill_fixed_id` varchar(32) DEFAULT NULL COMMENT '绑定的单一技能组ID',
  `consult_skill_logo` varchar(100) DEFAULT NULL COMMENT '技能组图标',
  `consult_skill_title` varchar(50) DEFAULT NULL COMMENT '技能组提示标题',
  `consult_skill_img` varchar(100) DEFAULT NULL COMMENT '技能组显示背景图片',
  `consult_skill_msg` text COMMENT '技能组提示文本内容',
  `consult_skill_numbers` int(11) DEFAULT NULL COMMENT '显示技能组成员数量',
  `consult_skill_maxagent` int(11) DEFAULT NULL COMMENT '显示技能组下最大用户数',
  `consult_skill_bottomtitle` varchar(50) DEFAULT NULL COMMENT '技能组底部标题',
  `consult_skill_agent` tinyint(4) DEFAULT NULL COMMENT '是否显示技能组下的坐席',
  `ai` tinyint(4) DEFAULT '0' COMMENT '启用AI',
  `aifirst` tinyint(4) DEFAULT '0' COMMENT 'AI优先显示',
  `aisearch` tinyint(4) DEFAULT '0' COMMENT 'AI搜索文本',
  `aimsg` text COMMENT 'AI欢迎信息',
  `aisuccesstip` varchar(100) DEFAULT NULL COMMENT 'AI成功命中提示消息',
  `ainame` varchar(50) DEFAULT NULL COMMENT '机器人名称',
  `consult_info` tinyint(4) DEFAULT NULL COMMENT '启用咨询信息收集功能',
  `consult_info_name` tinyint(4) DEFAULT NULL COMMENT '填写姓名',
  `consult_info_email` tinyint(4) DEFAULT NULL COMMENT '填写 邮件地址',
  `consult_info_phone` tinyint(4) DEFAULT NULL COMMENT '填写 电话号码',
  `consult_info_resion` tinyint(4) DEFAULT NULL COMMENT '填写咨询问题',
  `consult_info_message` text COMMENT '咨询窗口显示的欢迎语',
  `consult_info_cookies` tinyint(4) DEFAULT NULL COMMENT '在Cookies中存储用户信息',
  `recordhis` tinyint(4) DEFAULT NULL COMMENT '是否记录访问轨迹',
  `traceuser` tinyint(4) DEFAULT NULL COMMENT '是否跟踪访客',
  `onlyareaskill` tinyint(4) DEFAULT '0' COMMENT '区域技能组',
  `uk_consult_invite` text COMMENT '提示消息',
  `areaskilltipmsg` text COMMENT '区域技能组提示消息',
  `aiid` varchar(32) DEFAULT NULL COMMENT '默认的AI',
  `maxwordsnum` int(11) DEFAULT '300' COMMENT '访客端允许输入的最大字数',
  `agentshortcutkey` varchar(32) DEFAULT NULL COMMENT '坐席默认回复消息快捷键',
  `usershortcutkey` varchar(32) DEFAULT NULL COMMENT '访客默认回复消息快捷键',
  `agentctrlenter` tinyint(4) DEFAULT '0' COMMENT '启用坐席端CTRL+Enter发送消息',
  `ctrlenter` tinyint(4) DEFAULT '0' COMMENT '启用访客端CTRL+Enter发送消息',
  `whitelist_mode` tinyint(4) DEFAULT '0' COMMENT '启用白名单',
  `aisuggest` tinyint(4) DEFAULT '0' COMMENT '启用智能建议',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='访客网站配置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uk_consult_invite`
--

LOCK TABLES `uk_consult_invite` WRITE;
/*!40000 ALTER TABLE `uk_consult_invite` DISABLE KEYS */;
/*!40000 ALTER TABLE `uk_consult_invite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uk_contacts`
--

DROP TABLE IF EXISTS `uk_contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uk_contacts` (
  `id` varchar(32) NOT NULL COMMENT '联系人ID',
  `gender` varchar(60) DEFAULT NULL COMMENT '联系人性别',
  `cusbirthday` varchar(50) DEFAULT NULL COMMENT '出生日期',
  `ctype` varchar(60) DEFAULT NULL COMMENT '联系人类型',
  `ckind` varchar(60) DEFAULT NULL COMMENT '联系人类别',
  `clevel` varchar(60) DEFAULT NULL COMMENT '联系人级别',
  `ccode` varchar(60) DEFAULT NULL COMMENT '联系人代码',
  `nickname` varchar(64) DEFAULT NULL COMMENT '联系人昵称',
  `sarea` varchar(60) DEFAULT NULL COMMENT '发货地址区县',
  `csource` varchar(64) DEFAULT NULL COMMENT '联系人来源',
  `language` varchar(40) DEFAULT NULL COMMENT '语言',
  `marriage` varchar(60) DEFAULT NULL COMMENT '婚姻状况',
  `education` varchar(60) DEFAULT NULL COMMENT '学历',
  `identifytype` varchar(60) DEFAULT NULL COMMENT '证件类型',
  `identifynumber` varchar(40) DEFAULT NULL COMMENT '证件号码',
  `website` varchar(255) DEFAULT NULL COMMENT '网址',
  `email` varchar(128) DEFAULT NULL COMMENT '电子邮件',
  `emailalt` varchar(128) DEFAULT NULL COMMENT '备用电子邮件',
  `mobileno` varchar(40) DEFAULT NULL COMMENT '手机号码',
  `mobilealt` varchar(40) DEFAULT NULL COMMENT '备用手机号码',
  `phone` varchar(40) DEFAULT NULL COMMENT '办公电话',
  `extension` varchar(40) DEFAULT NULL COMMENT '办公分机',
  `phonealt` varchar(40) DEFAULT NULL COMMENT '备用办公电话',
  `extensionalt` varchar(40) DEFAULT NULL COMMENT '备用办公分机',
  `familyphone` varchar(40) DEFAULT NULL COMMENT '住宅电话',
  `familyphonealt` varchar(40) DEFAULT NULL COMMENT '备用住宅电话',
  `fax` varchar(40) DEFAULT NULL COMMENT '传真号码',
  `faxalt` varchar(40) DEFAULT NULL COMMENT '备用传真号码',
  `country` varchar(60) DEFAULT NULL COMMENT '国家',
  `province` varchar(60) DEFAULT NULL COMMENT '省',
  `city` varchar(60) DEFAULT NULL COMMENT '市(区)县',
  `address` text COMMENT '地址',
  `postcode` varchar(40) DEFAULT NULL COMMENT '邮政编码',
  `enterpriseid` varchar(60) DEFAULT NULL COMMENT '企(事)业单位',
  `company` text COMMENT '公司',
  `department` varchar(40) DEFAULT NULL COMMENT '部门',
  `duty` varchar(40) DEFAULT NULL COMMENT '职务',
  `deptpr` varchar(40) DEFAULT NULL COMMENT '直接上级领导',
  `validstatus` varchar(50) DEFAULT NULL COMMENT '效力状态',
  `weixin` varchar(60) DEFAULT NULL COMMENT '微信号',
  `weixinname` varchar(60) DEFAULT NULL COMMENT '微信昵称',
  `weixinid` varchar(255) DEFAULT NULL COMMENT '微信ID',
  `weibo` varchar(255) DEFAULT NULL COMMENT '微博昵称',
  `weiboid` varchar(255) DEFAULT NULL COMMENT '微博ID',
  `qqcode` varchar(32) DEFAULT NULL COMMENT 'QQ账号',
  `touchtime` datetime DEFAULT NULL COMMENT '最后联系时间',
  `datastatus` tinyint(10) DEFAULT NULL COMMENT '数据状态',
  `processid` varchar(60) DEFAULT NULL COMMENT '流程ID',
  `creater` varchar(60) DEFAULT NULL COMMENT '创建人ID',
  `username` varchar(60) DEFAULT NULL COMMENT '创建人姓名',
  `updateuser` varchar(60) DEFAULT NULL COMMENT '修改人ID',
  `memo` varchar(255) DEFAULT NULL COMMENT '联系人备注',
  `updateusername` varchar(60) DEFAULT NULL COMMENT '修改人姓名',
  `updatetime` datetime DEFAULT NULL COMMENT '修改时间',
  `orgi` varchar(60) DEFAULT NULL COMMENT '租户标识',
  `compper` varchar(255) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `assignedto` varchar(255) DEFAULT NULL COMMENT '分配目标用户',
  `wfstatus` varchar(255) DEFAULT NULL COMMENT '流程状态',
  `shares` varchar(255) DEFAULT NULL COMMENT '分享给',
  `owner` varchar(255) DEFAULT NULL COMMENT '所属人',
  `datadept` varchar(255) DEFAULT NULL COMMENT '创建人部门',
  `entcusid` varchar(32) DEFAULT NULL COMMENT '客户ID',
  `pinyin` varchar(10) DEFAULT NULL COMMENT '拼音',
  `organ` varchar(32) DEFAULT NULL COMMENT '部门',
  `skypeid` varchar(100) DEFAULT NULL COMMENT 'skypeid',
  `wluid` varchar(100) DEFAULT NULL COMMENT '人员id',
  `wlusername` varchar(255) DEFAULT NULL COMMENT '人员名称',
  `wlcid` varchar(100) DEFAULT NULL COMMENT '公司id',
  `wlcompany_name` varchar(255) DEFAULT NULL COMMENT '公司名称',
  `wlsid` varchar(100) DEFAULT NULL COMMENT '子系统id',
  `wlsystem_name` varchar(255) DEFAULT NULL COMMENT '子系统名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='联系人信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uk_contacts`
--

LOCK TABLES `uk_contacts` WRITE;
/*!40000 ALTER TABLE `uk_contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `uk_contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uk_cube`
--

DROP TABLE IF EXISTS `uk_cube`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uk_cube` (
  `ID` varchar(32) NOT NULL COMMENT '主键ID',
  `NAME` varchar(255) DEFAULT NULL COMMENT '名称',
  `CREATETIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `DB` varchar(32) DEFAULT NULL COMMENT '数据库',
  `ORGI` varchar(32) DEFAULT NULL COMMENT '租户ID',
  `MPOSLEFT` varchar(32) DEFAULT NULL COMMENT '位置',
  `MPOSTOP` varchar(32) DEFAULT NULL COMMENT '距顶位置',
  `TYPEID` varchar(32) DEFAULT NULL COMMENT '类型ID',
  `CODE` varchar(32) DEFAULT NULL COMMENT '代码',
  `DSTYPE` varchar(255) DEFAULT NULL COMMENT '类型',
  `MODELTYPE` varchar(32) DEFAULT NULL COMMENT '组件类型',
  `createdata` varchar(32) DEFAULT NULL COMMENT '创建状态',
  `startindex` int(11) DEFAULT NULL COMMENT '开始位置',
  `startdate` datetime DEFAULT NULL COMMENT '开始时间',
  `dataid` varchar(32) DEFAULT NULL COMMENT '数据ID',
  `dataflag` varchar(255) DEFAULT NULL COMMENT '数据状态',
  `CREATER` varchar(32) DEFAULT NULL COMMENT '创建人',
  `UPDATETIME` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `CUBEFILE` longtext COMMENT '模型文件',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='立方体表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uk_cube`
--

LOCK TABLES `uk_cube` WRITE;
/*!40000 ALTER TABLE `uk_cube` DISABLE KEYS */;
/*!40000 ALTER TABLE `uk_cube` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uk_cube_type`
--

DROP TABLE IF EXISTS `uk_cube_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uk_cube_type` (
  `id` varchar(32) NOT NULL COMMENT '主键ID',
  `name` varchar(255) DEFAULT NULL COMMENT '维度名称',
  `createtime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `creater` varchar(32) DEFAULT NULL COMMENT '创建人',
  `orgi` varchar(32) DEFAULT NULL COMMENT '租户id',
  `parentid` varchar(32) DEFAULT NULL COMMENT '模型分类上级ID',
  `inx` int(11) DEFAULT NULL COMMENT '分类排序序号',
  `updatetime` datetime DEFAULT NULL COMMENT '更新时间',
  `description` varchar(255) DEFAULT NULL COMMENT '分类描述'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='立方体分类表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uk_cube_type`
--

LOCK TABLES `uk_cube_type` WRITE;
/*!40000 ALTER TABLE `uk_cube_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `uk_cube_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uk_cubelevel`
--

DROP TABLE IF EXISTS `uk_cubelevel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uk_cubelevel` (
  `ID` varchar(32) NOT NULL COMMENT '主键ID',
  `NAME` varchar(255) DEFAULT NULL COMMENT '层级名称',
  `CODE` varchar(32) DEFAULT NULL COMMENT '层级代码',
  `CREATETIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `COLUMNAME` varchar(255) DEFAULT NULL COMMENT '字段名称',
  `UNIQUEMEMBERS` smallint(6) DEFAULT NULL COMMENT '唯一约束',
  `TYPE` varchar(32) DEFAULT NULL COMMENT '类型',
  `LEVELTYPE` varchar(32) DEFAULT NULL COMMENT '层级类型',
  `TABLENAME` varchar(255) DEFAULT NULL COMMENT '数据表名',
  `CUBEID` varchar(32) DEFAULT NULL COMMENT '立方体ID',
  `ORGI` varchar(32) DEFAULT NULL COMMENT '租户ID',
  `SORTINDEX` int(11) DEFAULT NULL COMMENT '排序序号',
  `PARAMETERS` longtext COMMENT '参数',
  `ATTRIBUE` longtext COMMENT '扩展参数',
  `DIMID` varchar(32) DEFAULT NULL COMMENT '唯独ID',
  `PERMISSIONS` smallint(6) DEFAULT NULL COMMENT '权限',
  `TABLEPROPERTY` varchar(32) DEFAULT NULL COMMENT '数据表字段',
  `FORMATSTR` varchar(255) DEFAULT NULL COMMENT '格式化字符串',
  `description` text COMMENT '描述信息',
  `creater` varchar(32) DEFAULT NULL COMMENT '创建人信息',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='维度成员表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uk_cubelevel`
--

LOCK TABLES `uk_cubelevel` WRITE;
/*!40000 ALTER TABLE `uk_cubelevel` DISABLE KEYS */;
/*!40000 ALTER TABLE `uk_cubelevel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uk_cubemeasure`
--

DROP TABLE IF EXISTS `uk_cubemeasure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uk_cubemeasure` (
  `ID` varchar(32) NOT NULL COMMENT '主键ID',
  `NAME` varchar(255) DEFAULT NULL COMMENT '指标名称',
  `CODE` varchar(32) DEFAULT NULL COMMENT '指标代码',
  `CREATETIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `COLUMNAME` varchar(255) DEFAULT NULL COMMENT '字段名称',
  `UNIQUEMEMBERS` smallint(6) DEFAULT NULL COMMENT '索引约束',
  `TYPE` varchar(32) DEFAULT NULL COMMENT '字段类型',
  `LEVELTYPE` varchar(32) DEFAULT NULL COMMENT '指标类型',
  `TABLENAME` varchar(255) DEFAULT NULL COMMENT '数据表名称',
  `CUBEID` varchar(32) DEFAULT NULL COMMENT '立方体ID',
  `ORGI` varchar(32) DEFAULT NULL COMMENT '租户ID',
  `SORTINDEX` int(11) DEFAULT NULL COMMENT '排序序号',
  `PARAMETERS` longtext COMMENT '参数',
  `ATTRIBUE` longtext COMMENT '扩展属性',
  `MID` varchar(32) DEFAULT NULL COMMENT '指标ID',
  `AGGREGATOR` varchar(32) DEFAULT NULL COMMENT '授权给用户',
  `FORMATSTRING` varchar(255) DEFAULT NULL COMMENT '格式化字符串',
  `CALCULATEDMEMBER` smallint(6) DEFAULT NULL COMMENT '计算指标计算方式',
  `MODELTYPE` varchar(32) DEFAULT NULL COMMENT '模型类型',
  `MEASURE` varchar(32) DEFAULT NULL COMMENT '指标',
  `description` text COMMENT '指标描述',
  `creater` varchar(32) DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='维度指标表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uk_cubemeasure`
--

LOCK TABLES `uk_cubemeasure` WRITE;
/*!40000 ALTER TABLE `uk_cubemeasure` DISABLE KEYS */;
/*!40000 ALTER TABLE `uk_cubemeasure` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uk_cubemetadata`
--

DROP TABLE IF EXISTS `uk_cubemetadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uk_cubemetadata` (
  `ID` varchar(32) NOT NULL COMMENT '主键ID',
  `TITLE` varchar(255) DEFAULT NULL COMMENT '标题',
  `NAME` varchar(255) DEFAULT NULL COMMENT '名称',
  `CODE` varchar(255) DEFAULT NULL COMMENT '代码',
  `CREATETIME` datetime NOT NULL COMMENT '创建时间',
  `TB` varchar(32) DEFAULT NULL COMMENT '数据表',
  `ORGI` varchar(255) DEFAULT NULL COMMENT '租户ID',
  `CUBEID` varchar(32) DEFAULT NULL COMMENT '模型ID',
  `POSTOP` varchar(32) DEFAULT NULL COMMENT '距顶部位置',
  `POSLEFT` varchar(32) DEFAULT NULL COMMENT '距左侧位置',
  `MTYPE` varchar(5) DEFAULT NULL COMMENT '模型类型',
  `NAMEALIAS` varchar(255) DEFAULT NULL COMMENT '别称',
  `PARAMETERS` varchar(255) DEFAULT NULL COMMENT '参数',
  `ATTRIBUE` longtext COMMENT '扩展属性',
  `creater` varchar(32) DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='模型元数据表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uk_cubemetadata`
--

LOCK TABLES `uk_cubemetadata` WRITE;
/*!40000 ALTER TABLE `uk_cubemetadata` DISABLE KEYS */;
/*!40000 ALTER TABLE `uk_cubemetadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uk_datadic`
--

DROP TABLE IF EXISTS `uk_datadic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uk_datadic` (
  `ID` varchar(32) NOT NULL COMMENT '主键ID',
  `NAME` varchar(32) DEFAULT NULL COMMENT '名称',
  `TITLE` varchar(32) DEFAULT NULL COMMENT '标题',
  `CODE` varchar(32) DEFAULT NULL COMMENT '代码',
  `PARENTID` varchar(32) DEFAULT NULL COMMENT '上级目录ID',
  `TYPE` varchar(32) DEFAULT NULL COMMENT '目录类型',
  `MEMO` varchar(255) DEFAULT NULL COMMENT '备注',
  `ORGI` varchar(32) DEFAULT NULL COMMENT '租户ID',
  `STATUS` varchar(32) DEFAULT NULL COMMENT '状态',
  `CREATETIME` datetime DEFAULT NULL COMMENT '创建时间',
  `UPDATETIME` datetime DEFAULT NULL COMMENT '更新时间',
  `CREATER` varchar(255) DEFAULT NULL COMMENT '创建人',
  `PUBLISHEDTYPE` varchar(32) DEFAULT NULL COMMENT '发布状态',
  `DESCRIPTION` varchar(255) DEFAULT NULL COMMENT '描述',
  `TABTYPE` varchar(32) DEFAULT NULL COMMENT '数据表类型',
  `DSTYPE` varchar(32) DEFAULT NULL COMMENT '数据源类型',
  `DSTEMPLET` varchar(255) DEFAULT NULL COMMENT '数据源模板',
  `SORTINDEX` int(11) DEFAULT NULL COMMENT '排序序号',
  `DICTYPE` varchar(32) DEFAULT NULL COMMENT '目录类型',
  `ICONCLASS` varchar(100) DEFAULT NULL COMMENT '样式CLASS',
  `CSSSTYLE` varchar(255) DEFAULT NULL COMMENT '样式STYLE',
  `AUTHCODE` varchar(100) DEFAULT NULL COMMENT '认证代码',
  `DEFAULTMENU` tinyint(4) DEFAULT NULL COMMENT '默认菜单',
  `DATAID` varchar(32) DEFAULT NULL COMMENT '数据ID',
  `DICICON` varchar(32) DEFAULT NULL COMMENT '图标',
  `CURICON` varchar(32) DEFAULT NULL COMMENT '当前选中图标',
  `BGCOLOR` varchar(32) DEFAULT NULL COMMENT '背景颜色',
  `CURBGCOLOR` varchar(32) DEFAULT NULL COMMENT '当前选中颜色',
  `MENUPOS` varchar(32) DEFAULT NULL COMMENT '菜单位置',
  `DISTITLE` varchar(100) DEFAULT NULL COMMENT '显示标题',
  `NAVMENU` tinyint(4) DEFAULT '0' COMMENT '导航菜单',
  `QUICKMENU` tinyint(4) DEFAULT '0' COMMENT '快捷方式的菜单',
  `PROJECTID` varchar(32) DEFAULT NULL COMMENT '项目ID',
  `SPSEARCH` tinyint(4) DEFAULT NULL COMMENT '搜索关键词',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `SQL121227155530400` (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='报表目录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uk_datadic`
--

LOCK TABLES `uk_datadic` WRITE;
/*!40000 ALTER TABLE `uk_datadic` DISABLE KEYS */;
/*!40000 ALTER TABLE `uk_datadic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uk_dataevent`
--

DROP TABLE IF EXISTS `uk_dataevent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uk_dataevent` (
  `id` varchar(32) NOT NULL COMMENT '主键ID',
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `tpid` varchar(32) DEFAULT NULL COMMENT '字段ID',
  `propertity` varchar(50) DEFAULT NULL COMMENT '属性名称',
  `field` varchar(50) DEFAULT NULL COMMENT '字段名称',
  `newvalue` varchar(255) DEFAULT NULL COMMENT '变更后的值',
  `oldvalue` varchar(255) DEFAULT NULL COMMENT '变更前的值',
  `orgi` varchar(32) DEFAULT NULL COMMENT '租户ID',
  `modifyid` varchar(32) DEFAULT NULL COMMENT '变更ID',
  `creater` varchar(32) DEFAULT NULL COMMENT '创建人',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `dataid` varchar(32) DEFAULT NULL COMMENT '数据ID',
  `eventtype` varchar(32) DEFAULT NULL COMMENT '事件类型',
  `content` varchar(255) DEFAULT NULL COMMENT '变更内容',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='工单数据变更记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uk_dataevent`
--

LOCK TABLES `uk_dataevent` WRITE;
/*!40000 ALTER TABLE `uk_dataevent` DISABLE KEYS */;
/*!40000 ALTER TABLE `uk_dataevent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uk_dimension`
--

DROP TABLE IF EXISTS `uk_dimension`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uk_dimension` (
  `ID` varchar(32) NOT NULL COMMENT '数据ID',
  `NAME` varchar(255) DEFAULT NULL COMMENT '维度名称',
  `CODE` varchar(255) DEFAULT NULL COMMENT '维度代码',
  `CREATETIME` datetime DEFAULT NULL COMMENT '创建时间',
  `CUBEID` varchar(32) DEFAULT NULL COMMENT '立方体ID',
  `ORGI` varchar(255) DEFAULT NULL COMMENT '租户ID',
  `TYPE` varchar(32) DEFAULT NULL COMMENT '维度类型',
  `SORTINDEX` int(11) DEFAULT NULL COMMENT '排序序号',
  `PARAMETERS` longtext COMMENT '参数',
  `ATTRIBUE` longtext COMMENT '扩展属性',
  `POSLEFT` varchar(32) DEFAULT NULL COMMENT '位置',
  `POSTOP` varchar(32) DEFAULT NULL COMMENT '位置距顶',
  `FORMATSTR` varchar(32) DEFAULT NULL COMMENT '格式化字符串',
  `MODELTYPE` varchar(32) DEFAULT NULL COMMENT '模型类型',
  `DIM` varchar(32) DEFAULT NULL COMMENT '维度',
  `ALLMEMBERNAME` varchar(32) DEFAULT NULL COMMENT '小计名称',
  `FKFIELD` varchar(255) DEFAULT NULL COMMENT '外键字段',
  `FKTABLE` varchar(255) DEFAULT NULL COMMENT '外键表',
  `FKTABLEID` varchar(255) DEFAULT NULL COMMENT '外键表ID',
  `CREATER` varchar(32) DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='维度表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uk_dimension`
--

LOCK TABLES `uk_dimension` WRITE;
/*!40000 ALTER TABLE `uk_dimension` DISABLE KEYS */;
/*!40000 ALTER TABLE `uk_dimension` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uk_drilldown`
--

DROP TABLE IF EXISTS `uk_drilldown`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uk_drilldown` (
  `id` varchar(32) NOT NULL COMMENT '主键ID',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `memo` varchar(255) DEFAULT NULL COMMENT '备注',
  `orgi` varchar(255) DEFAULT NULL COMMENT '租户ID',
  `code` varchar(255) DEFAULT NULL COMMENT '代码',
  `dataid` varchar(255) DEFAULT NULL COMMENT '数据ID',
  `dataname` varchar(255) DEFAULT NULL COMMENT '数据名称',
  `tdstyle` varchar(255) DEFAULT NULL COMMENT 'TD样式',
  `reportid` varchar(255) DEFAULT NULL COMMENT '报表ID',
  `modelid` varchar(255) DEFAULT NULL COMMENT '模型ID',
  `paramname` varchar(255) DEFAULT NULL COMMENT '参数名称',
  `paramtype` varchar(255) DEFAULT NULL COMMENT '参数类型',
  `paramurl` varchar(255) DEFAULT NULL COMMENT '参数URL',
  `paramtarget` varchar(255) DEFAULT NULL COMMENT '目标对象',
  `paramreport` varchar(255) DEFAULT NULL COMMENT '目标报表',
  `paramvalue` varchar(255) DEFAULT NULL COMMENT '参数值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='钻取表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uk_drilldown`
--

LOCK TABLES `uk_drilldown` WRITE;
/*!40000 ALTER TABLE `uk_drilldown` DISABLE KEYS */;
/*!40000 ALTER TABLE `uk_drilldown` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uk_entcustomer`
--

DROP TABLE IF EXISTS `uk_entcustomer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uk_entcustomer` (
  `id` varchar(32) NOT NULL COMMENT '单位ID',
  `name` varchar(255) DEFAULT NULL COMMENT '企(事)业单位名称',
  `etype` varchar(60) DEFAULT NULL COMMENT '单位性质',
  `ekind` varchar(60) DEFAULT NULL COMMENT '客户类别',
  `elevel` varchar(60) DEFAULT NULL COMMENT '客户级别',
  `ecode` varchar(60) DEFAULT NULL COMMENT '单位代码',
  `nickname` varchar(64) DEFAULT NULL COMMENT '单位简称',
  `esource` varchar(64) DEFAULT NULL COMMENT '来源',
  `origincode` varchar(60) DEFAULT NULL COMMENT '组织机构代码',
  `corporation` varchar(60) DEFAULT NULL COMMENT '法人',
  `leadername` varchar(40) DEFAULT NULL COMMENT '联系人姓名',
  `leadermobile` varchar(40) DEFAULT NULL COMMENT '联系人手机',
  `leadermobile2` varchar(40) DEFAULT NULL COMMENT '联系人手机2',
  `leaderphone` varchar(40) DEFAULT NULL COMMENT '联系人座机',
  `leaderemail` varchar(60) DEFAULT NULL COMMENT '联系人电子邮件',
  `website` varchar(255) DEFAULT NULL COMMENT '网址',
  `email` varchar(128) DEFAULT NULL COMMENT '电子邮件',
  `emailalt` varchar(128) DEFAULT NULL COMMENT '备用电子邮件',
  `phone` varchar(40) DEFAULT NULL COMMENT '办公电话',
  `phonealt` varchar(40) DEFAULT NULL COMMENT '备用办公电话',
  `fax` varchar(40) DEFAULT NULL COMMENT '传真号码',
  `faxalt` varchar(40) DEFAULT NULL COMMENT '备用传真号码',
  `country` varchar(60) DEFAULT NULL COMMENT '国家',
  `province` varchar(60) DEFAULT NULL COMMENT '省',
  `city` varchar(60) DEFAULT NULL COMMENT '市区县',
  `sarea` varchar(60) DEFAULT NULL COMMENT '区县',
  `address` varchar(255) DEFAULT NULL COMMENT '地址',
  `postcode` varchar(40) DEFAULT NULL COMMENT '邮政编码',
  `businessscope` text COMMENT '经营范围',
  `capital` varchar(40) DEFAULT NULL COMMENT '注册资本',
  `stockcode` varchar(40) DEFAULT NULL COMMENT '股票代码',
  `bankaccount` varchar(40) DEFAULT NULL COMMENT '对公银行账号',
  `registeredaddress` text COMMENT '注册地址',
  `esize` varchar(60) DEFAULT NULL COMMENT '单位规模',
  `industry` varchar(60) DEFAULT NULL COMMENT '所属行业',
  `validstatus` varchar(50) DEFAULT NULL COMMENT '效力状态',
  `weixin` varchar(60) DEFAULT NULL COMMENT '微信公众号',
  `weibo` varchar(255) DEFAULT NULL COMMENT '微博号',
  `touchtime` datetime DEFAULT NULL COMMENT '最后联系时间',
  `dzip` varchar(32) DEFAULT NULL COMMENT '发货地址邮编',
  `daddress` varchar(255) DEFAULT NULL COMMENT '发货地址',
  `darea` varchar(60) DEFAULT NULL COMMENT '发货地址-区县',
  `dcity` varchar(60) DEFAULT NULL COMMENT '发货地址-城市',
  `dprovince` varchar(60) DEFAULT NULL COMMENT '发货地址-省份',
  `datastatus` varchar(2) DEFAULT NULL COMMENT '数据状态',
  `processid` varchar(60) DEFAULT NULL COMMENT '流程ID',
  `description` text COMMENT '描述',
  `creater` varchar(60) DEFAULT NULL COMMENT '创建人ID',
  `username` varbinary(60) DEFAULT NULL COMMENT '创建人姓名',
  `updateuser` varchar(60) DEFAULT NULL COMMENT '修改人ID',
  `updateusername` varchar(60) DEFAULT NULL COMMENT '修改人姓名',
  `updatetime` datetime DEFAULT NULL COMMENT '修改时间',
  `orgi` varchar(60) DEFAULT NULL COMMENT '租户标识',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `assignedto` varchar(255) DEFAULT NULL COMMENT '分配目标用户',
  `wfstatus` varchar(255) DEFAULT NULL COMMENT '流程状态',
  `shares` varchar(255) DEFAULT NULL COMMENT '分享给',
  `owner` varchar(255) DEFAULT NULL COMMENT '所属人',
  `datadept` varchar(255) DEFAULT NULL COMMENT '创建人部门',
  `batid` varchar(32) DEFAULT NULL COMMENT '批次ID',
  `maturity` varchar(32) DEFAULT NULL COMMENT '规模',
  `entcusid` varchar(32) DEFAULT NULL COMMENT '客户ID',
  `pinyin` varchar(10) DEFAULT NULL COMMENT '首字母缩写拼音',
  `organ` varchar(32) DEFAULT NULL COMMENT '部门',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='企(事)业单位信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uk_entcustomer`
--

LOCK TABLES `uk_entcustomer` WRITE;
/*!40000 ALTER TABLE `uk_entcustomer` DISABLE KEYS */;
/*!40000 ALTER TABLE `uk_entcustomer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uk_fans`
--

DROP TABLE IF EXISTS `uk_fans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uk_fans` (
  `id` varchar(32) NOT NULL COMMENT '主键ID',
  `creater` varchar(32) DEFAULT NULL COMMENT '创建人',
  `createtime` date DEFAULT NULL COMMENT '创建时间',
  `updatetime` date DEFAULT NULL COMMENT '更新时间',
  `suser` varchar(32) DEFAULT NULL COMMENT '用户ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='粉丝表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uk_fans`
--

LOCK TABLES `uk_fans` WRITE;
/*!40000 ALTER TABLE `uk_fans` DISABLE KEYS */;
/*!40000 ALTER TABLE `uk_fans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uk_favorites`
--

DROP TABLE IF EXISTS `uk_favorites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uk_favorites` (
  `ID` varchar(32) NOT NULL COMMENT '主键ID',
  `NAME` varchar(50) DEFAULT NULL COMMENT '名称',
  `CODE` varchar(50) DEFAULT NULL COMMENT '编码',
  `CREATETIME` datetime DEFAULT NULL COMMENT '创建时间',
  `CREATER` varchar(32) DEFAULT NULL COMMENT '创建人',
  `UPDATETIME` datetime DEFAULT NULL COMMENT '更新时间',
  `ORGI` varchar(32) DEFAULT NULL COMMENT '租户ID',
  `USERNAME` varchar(50) DEFAULT NULL COMMENT '用户名',
  `ORDERID` varchar(32) DEFAULT NULL COMMENT '数据ID',
  `TITLE` varchar(255) DEFAULT NULL COMMENT '标题',
  `MODEL` varchar(50) DEFAULT NULL COMMENT '所属组件',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='收藏信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uk_favorites`
--

LOCK TABLES `uk_favorites` WRITE;
/*!40000 ALTER TABLE `uk_favorites` DISABLE KEYS */;
/*!40000 ALTER TABLE `uk_favorites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uk_fs_event_socket`
--

DROP TABLE IF EXISTS `uk_fs_event_socket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uk_fs_event_socket` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `hostname` varchar(50) NOT NULL COMMENT 'fs服务名称',
  `nat_map` varchar(20) DEFAULT 'false' COMMENT 'nat_map',
  `listen_ip` varchar(50) DEFAULT '0.0.0.0' COMMENT 'listen_ip',
  `listen_port` int(11) DEFAULT '8021' COMMENT 'listen_port',
  `password` varchar(50) DEFAULT 'ClueCon' COMMENT '密码',
  `apply_inbound_acl` varchar(50) DEFAULT 'lan' COMMENT '呼入ACL',
  `stop_on_bind_error` varchar(50) DEFAULT 'true' COMMENT '错误消息',
  `addtime` varchar(20) DEFAULT NULL COMMENT '创建时间',
  `updatetime` varchar(20) DEFAULT NULL COMMENT '修改时间',
  `connected` int(11) DEFAULT NULL COMMENT 'connected 0-未连接 1-已连接 2 已停止',
  `connected_result` varchar(50) DEFAULT NULL COMMENT '连接结果',
  `show_calls` int(11) DEFAULT NULL COMMENT '容许通话数',
  `enable` int(11) DEFAULT '1' COMMENT '是否启用',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `AK_Key_2` (`hostname`) USING BTREE,
  UNIQUE KEY `UK_hu886eh9fs7qysallkl0ub6t7` (`hostname`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='fs服务器监听端口';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uk_fs_event_socket`
--

LOCK TABLES `uk_fs_event_socket` WRITE;
/*!40000 ALTER TABLE `uk_fs_event_socket` DISABLE KEYS */;
/*!40000 ALTER TABLE `uk_fs_event_socket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uk_generation`
--

DROP TABLE IF EXISTS `uk_generation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uk_generation` (
  `id` varchar(32) NOT NULL COMMENT '主键ID',
  `model` varchar(32) DEFAULT NULL COMMENT '所属组件',
  `startinx` int(11) DEFAULT NULL COMMENT '开始位置',
  `orgi` varchar(32) DEFAULT NULL COMMENT '租户ID',
  `creater` varchar(32) DEFAULT NULL COMMENT '创建人',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='全局ID生成器';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uk_generation`
--

LOCK TABLES `uk_generation` WRITE;
/*!40000 ALTER TABLE `uk_generation` DISABLE KEYS */;
/*!40000 ALTER TABLE `uk_generation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uk_historyreport`
--

DROP TABLE IF EXISTS `uk_historyreport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uk_historyreport` (
  `ID` varchar(32) NOT NULL COMMENT '主键ID',
  `BYTES` int(11) NOT NULL COMMENT '传输数据量',
  `THREADS` int(11) NOT NULL COMMENT '线程数量',
  `TYPE` varchar(255) DEFAULT NULL COMMENT '类型',
  `STATUS` varchar(255) DEFAULT NULL COMMENT '状态',
  `ERRORMSG` varchar(255) DEFAULT NULL COMMENT '错误提示',
  `CREATETIME` datetime DEFAULT NULL COMMENT '创建时间',
  `STARTTIME` datetime DEFAULT NULL COMMENT '开始时间',
  `ENDTIME` datetime DEFAULT NULL COMMENT '结束时间',
  `AMOUNT` varchar(255) DEFAULT NULL COMMENT '提醒',
  `PAGES` int(11) NOT NULL COMMENT '记录数量',
  `ERRORS` int(11) NOT NULL COMMENT '错误数',
  `ORGI` varchar(32) DEFAULT NULL COMMENT '租户ID',
  `TABLEDIRID` varchar(32) DEFAULT NULL COMMENT '数据表目录ID',
  `TABLEID` varchar(32) DEFAULT NULL COMMENT '数据表ID',
  `TOTAL` int(11) DEFAULT NULL COMMENT '总数',
  `USERID` varchar(32) DEFAULT NULL COMMENT '用户ID',
  `USERNAME` varchar(50) DEFAULT '' COMMENT '用户名',
  `dataid` varchar(32) DEFAULT NULL COMMENT '批次ID',
  `title` varchar(100) DEFAULT NULL COMMENT '标题',
  `organ` varchar(50) DEFAULT NULL COMMENT '组织机构',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='数据采集历史表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uk_historyreport`
--

LOCK TABLES `uk_historyreport` WRITE;
/*!40000 ALTER TABLE `uk_historyreport` DISABLE KEYS */;
/*!40000 ALTER TABLE `uk_historyreport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uk_imgroup`
--

DROP TABLE IF EXISTS `uk_imgroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uk_imgroup` (
  `id` varchar(32) NOT NULL COMMENT '主键ID',
  `creater` varchar(32) DEFAULT NULL COMMENT '创建人',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `updatetime` datetime DEFAULT NULL COMMENT '更新时间',
  `tipmessage` text COMMENT '提示消息',
  `descript` text COMMENT '描述',
  `name` varchar(100) DEFAULT NULL COMMENT '分组名称',
  `orgi` varchar(100) DEFAULT NULL COMMENT '租户ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='企业聊天分组表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uk_imgroup`
--

LOCK TABLES `uk_imgroup` WRITE;
/*!40000 ALTER TABLE `uk_imgroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `uk_imgroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uk_imgroup_user`
--

DROP TABLE IF EXISTS `uk_imgroup_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uk_imgroup_user` (
  `id` varchar(32) NOT NULL COMMENT '主键ID',
  `creater` varchar(32) DEFAULT NULL COMMENT '创建人ID',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `updatetime` datetime DEFAULT NULL COMMENT '更新时间',
  `name` varchar(100) DEFAULT NULL COMMENT '名称',
  `orgi` varchar(100) DEFAULT NULL COMMENT '租户ID',
  `user_id` varchar(32) DEFAULT NULL COMMENT '用户ID',
  `imgroup_id` varchar(32) DEFAULT NULL COMMENT '分组ID',
  `admin` tinyint(4) DEFAULT NULL COMMENT '是否管理员',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='企业聊天分组用户';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uk_imgroup_user`
--

LOCK TABLES `uk_imgroup_user` WRITE;
/*!40000 ALTER TABLE `uk_imgroup_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `uk_imgroup_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uk_instruction`
--

DROP TABLE IF EXISTS `uk_instruction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uk_instruction` (
  `id` varchar(96) NOT NULL COMMENT '主键ID',
  `name` varchar(96) DEFAULT NULL COMMENT '名称',
  `code` varchar(96) DEFAULT NULL COMMENT '编码',
  `plugin` varchar(96) DEFAULT NULL COMMENT '插件',
  `memo` text COMMENT '备注',
  `status` varchar(96) DEFAULT NULL COMMENT '状态',
  `orgi` varchar(96) DEFAULT NULL COMMENT '租户ID',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `userid` varchar(96) DEFAULT NULL COMMENT '用户ID',
  `type` varchar(96) DEFAULT NULL COMMENT '类型',
  `parent` varchar(96) DEFAULT NULL COMMENT '上级指令',
  `username` varchar(96) DEFAULT NULL COMMENT '用户名',
  `scope` varchar(15) DEFAULT NULL COMMENT '作用域',
  `tipdefault` smallint(6) DEFAULT NULL COMMENT '默认提示',
  `matcherule` varchar(96) DEFAULT NULL COMMENT '匹配规则',
  `userbind` smallint(6) DEFAULT NULL COMMENT '用户绑定',
  `interfacetype` varchar(96) DEFAULT NULL COMMENT '接口类型',
  `adapter` varchar(96) DEFAULT NULL COMMENT '适配程序',
  `interfaceurl` text COMMENT '接口URL',
  `interfaceparam` text COMMENT '接口参数',
  `messagetype` varchar(96) DEFAULT NULL COMMENT '消息类型',
  `keyword` varchar(100) DEFAULT NULL COMMENT '关键词',
  `eventype` varchar(32) DEFAULT NULL COMMENT '菜单事件类型',
  `snsid` varchar(32) DEFAULT NULL COMMENT 'SNSID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='微信指令表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uk_instruction`
--

LOCK TABLES `uk_instruction` WRITE;
/*!40000 ALTER TABLE `uk_instruction` DISABLE KEYS */;
/*!40000 ALTER TABLE `uk_instruction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uk_inviterecord`
--

DROP TABLE IF EXISTS `uk_inviterecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uk_inviterecord` (
  `id` varchar(32) NOT NULL COMMENT '主键ID',
  `orgi` varchar(32) DEFAULT NULL COMMENT '租户ID',
  `userid` varchar(32) DEFAULT NULL COMMENT '用户ID',
  `agentno` varchar(32) DEFAULT NULL COMMENT '坐席ID',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `updatetime` datetime DEFAULT NULL COMMENT '更新时间',
  `result` varchar(10) DEFAULT NULL COMMENT '记录',
  `responsetime` int(11) DEFAULT NULL COMMENT '响应时间',
  `appid` varchar(32) DEFAULT NULL COMMENT 'SNSID',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `url` text COMMENT '地址',
  `traceid` varchar(32) DEFAULT NULL COMMENT '跟踪ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='邀请记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uk_inviterecord`
--

LOCK TABLES `uk_inviterecord` WRITE;
/*!40000 ALTER TABLE `uk_inviterecord` DISABLE KEYS */;
/*!40000 ALTER TABLE `uk_inviterecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uk_jobdetail`
--

DROP TABLE IF EXISTS `uk_jobdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uk_jobdetail` (
  `ID` varchar(32) NOT NULL COMMENT '主键ID',
  `NAME` varchar(50) DEFAULT NULL COMMENT '名称',
  `CODE` varchar(50) DEFAULT NULL COMMENT '代码',
  `CREATETIME` datetime DEFAULT NULL COMMENT '创建时间',
  `CREATER` varchar(32) DEFAULT NULL COMMENT '创建人',
  `UPDATETIME` datetime DEFAULT NULL COMMENT '更新时间',
  `ORGI` varchar(32) DEFAULT NULL COMMENT '租户ID',
  `USERNAME` varchar(50) DEFAULT NULL COMMENT '创建人',
  `STATUS` varchar(50) DEFAULT NULL COMMENT '任务状态',
  `PARENTID` varchar(32) DEFAULT NULL COMMENT '上级ID',
  `ACTID` varchar(32) DEFAULT NULL COMMENT '活动ID',
  `INX` int(11) DEFAULT '0' COMMENT '分类排序序号',
  `NAMENUM` int(11) DEFAULT '0' COMMENT '批次包含的名单总数',
  `VALIDNUM` int(11) DEFAULT '0' COMMENT '批次包含的有效名单总数',
  `INVALIDNUM` int(11) DEFAULT '0' COMMENT '批次包含的无效名单总数',
  `ASSIGNED` int(11) DEFAULT '0' COMMENT '已分配名单总数',
  `NOTASSIGNED` int(11) DEFAULT '0' COMMENT '未分配名单总数',
  `ENABLE` tinyint(4) NOT NULL DEFAULT '0' COMMENT '分类状态',
  `DATASTATUS` tinyint(4) DEFAULT '0' COMMENT '数据状态',
  `AREA` text COMMENT '分类描述',
  `imptype` varchar(50) DEFAULT NULL COMMENT '导入类型',
  `batchtype` varchar(32) DEFAULT NULL COMMENT '批次类型',
  `ORGAN` varchar(32) DEFAULT NULL COMMENT '部门',
  `impurl` text COMMENT '导入URL',
  `filetype` varchar(50) DEFAULT NULL COMMENT '文件类型',
  `dbtype` varchar(50) DEFAULT NULL COMMENT '数据库类型',
  `jdbcurl` text COMMENT '数据库URL',
  `driverclazz` varchar(255) DEFAULT NULL COMMENT '数据库驱动',
  `password` varchar(255) DEFAULT NULL COMMENT '密码',
  `DESCRIPTION` text COMMENT '描述信息',
  `execnum` int(11) DEFAULT '0' COMMENT '导入次数',
  `SOURCE` varchar(255) DEFAULT NULL COMMENT '来源',
  `CLAZZ` varchar(255) DEFAULT NULL COMMENT '执行的Resource类',
  `TASKFIRETIME` datetime DEFAULT NULL COMMENT '启动时间',
  `CRAWLTASKID` varchar(255) DEFAULT NULL COMMENT '任务ID',
  `EMAIL` varchar(255) DEFAULT NULL COMMENT '邮件地址',
  `NICKNAME` varchar(255) DEFAULT NULL COMMENT '昵称',
  `USERID` varchar(255) DEFAULT NULL COMMENT '用户ID',
  `TASKTYPE` varchar(255) DEFAULT NULL COMMENT '任务类型',
  `TASKID` varchar(255) DEFAULT NULL COMMENT '任务ID',
  `FETCHER` smallint(6) NOT NULL COMMENT '当前状态',
  `PAUSE` smallint(6) NOT NULL COMMENT '暂停',
  `PLANTASK` smallint(6) NOT NULL COMMENT '计划任务',
  `SECURE_ID` varchar(32) DEFAULT NULL COMMENT '安全规则ID',
  `CONFIGURE_ID` varchar(32) DEFAULT NULL COMMENT '配置项ID',
  `TAKSPLAN_ID` varchar(32) DEFAULT NULL COMMENT '计划任务ID',
  `CRAWLTASK` varchar(32) DEFAULT NULL COMMENT '当前任务状态',
  `TARGETTASK` varchar(32) DEFAULT NULL COMMENT '目标任务',
  `STARTINDEX` int(11) DEFAULT NULL COMMENT '开始位置',
  `LASTDATE` datetime DEFAULT NULL COMMENT '最后更新时间',
  `CREATETABLE` tinyint(4) DEFAULT NULL COMMENT '是否创建数据表',
  `MEMO` text COMMENT '备注',
  `NEXTFIRETIME` datetime DEFAULT NULL COMMENT '下次启动时间',
  `CRONEXP` varchar(255) DEFAULT NULL COMMENT 'CRON表达式',
  `TASKSTATUS` varchar(32) DEFAULT NULL COMMENT '任务执行状态',
  `usearea` varchar(255) DEFAULT NULL COMMENT '用户数据',
  `areafield` varchar(255) DEFAULT NULL COMMENT '用户字段',
  `areafieldtype` varchar(32) DEFAULT NULL COMMENT '用户数据类型',
  `arearule` varchar(255) DEFAULT NULL COMMENT '用户数据值',
  `minareavalue` varchar(255) DEFAULT NULL COMMENT '最小值',
  `maxareavalue` varchar(255) DEFAULT NULL COMMENT '最大值',
  `formatstr` varchar(255) DEFAULT NULL COMMENT '格式化字符串',
  `DATAID` varchar(1000) DEFAULT NULL COMMENT '报表id字符串',
  `DICID` varchar(1000) DEFAULT NULL COMMENT '目录id字符串',
  `taskinfo` longtext COMMENT 'taskinfo信息',
  `FILTERID` varchar(32) DEFAULT NULL COMMENT '筛选表单ID',
  `FETCH_SIZE` int(11) DEFAULT NULL COMMENT '采集数据窗口大小',
  `LASTINDEX` int(11) DEFAULT NULL COMMENT '结束位置',
  `PAGES` int(11) DEFAULT NULL COMMENT '页面数量',
  `plantaskreadtorun` tinyint(4) DEFAULT NULL COMMENT '计划任务',
  `priority` int(11) DEFAULT NULL COMMENT '策略',
  `runserver` varchar(100) DEFAULT NULL COMMENT '运行服务器',
  `actype` varchar(50) DEFAULT NULL COMMENT '活动类型',
  `distype` varchar(32) DEFAULT NULL COMMENT '分配类型',
  `distpolicy` varchar(50) DEFAULT NULL COMMENT '分配策略',
  `policynum` int(11) DEFAULT NULL COMMENT '分配数量',
  `busstype` varchar(32) DEFAULT NULL COMMENT '业务类型',
  `disnum` varchar(32) DEFAULT NULL COMMENT '默认分配数量',
  `execmd` varchar(32) DEFAULT NULL COMMENT '执行次数',
  `exectarget` varchar(50) DEFAULT NULL COMMENT '执行分配目标',
  `exectype` varchar(32) DEFAULT NULL COMMENT '执行类型',
  `execto` varchar(32) DEFAULT NULL COMMENT '回收数据位置',
  `threads` int(11) DEFAULT '0' COMMENT '启动任务的线程数量',
  `siptrunk` varchar(32) DEFAULT NULL COMMENT '线路信息',
  `province` varchar(32) DEFAULT NULL COMMENT '线路所在省份',
  `city` varchar(32) DEFAULT NULL COMMENT '线路所在城市',
  `prefix` tinyint(4) DEFAULT '0' COMMENT '线路资源拨号前缀',
  `reportid` varchar(32) DEFAULT NULL COMMENT '数据表ID',
  `mapping` tinyint(4) DEFAULT '0' COMMENT '默认映射结构',
  PRIMARY KEY (`ID`,`ENABLE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='作业调度任务/活动/批次表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uk_jobdetail`
--

LOCK TABLES `uk_jobdetail` WRITE;
/*!40000 ALTER TABLE `uk_jobdetail` DISABLE KEYS */;
/*!40000 ALTER TABLE `uk_jobdetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uk_jobdetailproduct`
--

DROP TABLE IF EXISTS `uk_jobdetailproduct`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uk_jobdetailproduct` (
  `id` varchar(32) NOT NULL COMMENT '主键ID',
  `actid` varchar(32) DEFAULT NULL COMMENT '活动ID',
  `product_id` varchar(32) DEFAULT NULL COMMENT '产品ID',
  `creater` varchar(32) DEFAULT NULL COMMENT '创建人',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `orgi` varchar(32) DEFAULT NULL COMMENT '租户ID',
  `quota` int(11) DEFAULT '0' COMMENT '配额',
  `price` int(11) DEFAULT '0' COMMENT '价格',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='活动产品表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uk_jobdetailproduct`
--

LOCK TABLES `uk_jobdetailproduct` WRITE;
/*!40000 ALTER TABLE `uk_jobdetailproduct` DISABLE KEYS */;
/*!40000 ALTER TABLE `uk_jobdetailproduct` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uk_kbs_expert`
--

DROP TABLE IF EXISTS `uk_kbs_expert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uk_kbs_expert` (
  `id` varchar(32) NOT NULL COMMENT '主键ID',
  `user_id` varchar(32) DEFAULT NULL COMMENT '用户ID',
  `kbstype` varchar(32) DEFAULT NULL COMMENT '知识库分类',
  `creater` varchar(32) DEFAULT NULL COMMENT '创建人',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `orgi` varchar(32) DEFAULT NULL COMMENT '租户ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='知识库';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uk_kbs_expert`
--

LOCK TABLES `uk_kbs_expert` WRITE;
/*!40000 ALTER TABLE `uk_kbs_expert` DISABLE KEYS */;
/*!40000 ALTER TABLE `uk_kbs_expert` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uk_kbs_topic`
--

DROP TABLE IF EXISTS `uk_kbs_topic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uk_kbs_topic` (
  `id` varchar(32) NOT NULL COMMENT '主键ID',
  `sessionid` varchar(32) DEFAULT NULL COMMENT '会话ID',
  `title` varchar(255) DEFAULT NULL COMMENT '主题',
  `content` text COMMENT '知识库内容',
  `keyword` text COMMENT '关键词',
  `summary` text COMMENT '摘要',
  `anonymous` tinyint(4) DEFAULT NULL COMMENT '允许匿名访问',
  `begintime` datetime DEFAULT NULL COMMENT '有效期开始时间',
  `endtime` datetime DEFAULT NULL COMMENT '有效期结束时间',
  `top` tinyint(4) DEFAULT NULL COMMENT '是否置顶',
  `essence` tinyint(4) DEFAULT NULL COMMENT '精华',
  `accept` tinyint(4) DEFAULT NULL COMMENT '允许评论',
  `finish` tinyint(4) DEFAULT NULL COMMENT '已结束',
  `answers` int(11) DEFAULT NULL COMMENT '回答数量',
  `sviews` int(11) DEFAULT NULL COMMENT '预览次数',
  `followers` int(11) DEFAULT NULL COMMENT '关注人数',
  `collections` int(11) DEFAULT NULL COMMENT '引用次数',
  `comments` int(11) DEFAULT NULL COMMENT '回复数',
  `mobile` tinyint(4) DEFAULT NULL COMMENT '移动端支持',
  `status` varchar(32) DEFAULT NULL COMMENT '状态',
  `tptype` varchar(32) DEFAULT NULL COMMENT '分类ID',
  `cate` varchar(32) DEFAULT NULL COMMENT '分类ID',
  `username` varchar(32) DEFAULT NULL COMMENT '用户名',
  `orgi` varchar(32) DEFAULT NULL COMMENT '租户ID',
  `creater` varchar(32) DEFAULT NULL COMMENT '创建人',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `updatetime` datetime DEFAULT NULL COMMENT '修改时间',
  `memo` varchar(32) DEFAULT NULL COMMENT '备注',
  `price` int(11) DEFAULT NULL COMMENT '权重',
  `organ` varchar(32) DEFAULT NULL COMMENT '组织机构',
  `sms` varchar(255) DEFAULT NULL COMMENT '短信模板',
  `tts` varchar(255) DEFAULT NULL COMMENT 'TTS模板',
  `email` text COMMENT '邮件模板',
  `weixin` text COMMENT '微信回复模板',
  `tags` text COMMENT '标签',
  `attachment` text COMMENT '附件',
  `approval` tinyint(4) DEFAULT NULL COMMENT '是否审批通过'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='知识库内容表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uk_kbs_topic`
--

LOCK TABLES `uk_kbs_topic` WRITE;
/*!40000 ALTER TABLE `uk_kbs_topic` DISABLE KEYS */;
/*!40000 ALTER TABLE `uk_kbs_topic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uk_kbs_type`
--

DROP TABLE IF EXISTS `uk_kbs_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uk_kbs_type` (
  `ID` varchar(32) NOT NULL COMMENT '主键ID',
  `NAME` varchar(50) DEFAULT NULL COMMENT '名称',
  `CODE` varchar(50) DEFAULT NULL COMMENT '代码',
  `CREATETIME` datetime DEFAULT NULL COMMENT '创建时间',
  `CREATER` varchar(32) DEFAULT NULL COMMENT '创建人',
  `UPDATETIME` datetime DEFAULT NULL COMMENT '更新时间',
  `ORGI` varchar(32) DEFAULT NULL COMMENT '租户ID',
  `USERNAME` varchar(50) DEFAULT NULL COMMENT '创建人姓名',
  `PARENTID` varchar(32) DEFAULT NULL COMMENT '知识库分类上级ID',
  `APPROVAL` tinyint(4) DEFAULT NULL COMMENT '是否启用审批',
  `BPMID` varchar(32) DEFAULT NULL COMMENT '审批流程ID',
  `PC` varchar(32) DEFAULT NULL COMMENT '负责人',
  `INX` int(11) DEFAULT NULL COMMENT '分类排序序号',
  `STARTDATE` datetime DEFAULT NULL COMMENT '有效期开始时间',
  `ENDDATE` datetime DEFAULT NULL COMMENT '有效期结束时间',
  `ENABLE` tinyint(4) DEFAULT NULL COMMENT '分类状态',
  `DESCRIPTION` varchar(255) DEFAULT NULL COMMENT '分类描述',
  `BPM` tinyint(4) DEFAULT NULL COMMENT '是否需要流程审批',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='知识分类表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uk_kbs_type`
--

LOCK TABLES `uk_kbs_type` WRITE;
/*!40000 ALTER TABLE `uk_kbs_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `uk_kbs_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uk_leavemsg`
--

DROP TABLE IF EXISTS `uk_leavemsg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uk_leavemsg` (
  `id` varchar(32) NOT NULL COMMENT '主键ID',
  `name` varchar(50) DEFAULT NULL COMMENT '姓名',
  `mobile` varchar(32) DEFAULT NULL COMMENT '手机',
  `email` varchar(100) DEFAULT NULL COMMENT '邮件',
  `address` varchar(255) DEFAULT NULL COMMENT '地址',
  `qq` varchar(30) DEFAULT NULL COMMENT 'QQ',
  `content` varchar(255) DEFAULT NULL COMMENT '留言内容',
  `orgi` varchar(32) DEFAULT NULL COMMENT '租户ID',
  `creater` varchar(32) DEFAULT NULL COMMENT '创建人',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `msgstatus` varchar(20) DEFAULT NULL COMMENT '消息状态',
  `contactsid` varchar(32) DEFAULT NULL COMMENT '匹配联系人ID',
  `userid` varchar(32) DEFAULT NULL COMMENT '用户ID',
  `snsid` varchar(32) DEFAULT NULL COMMENT '渠道snsid',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='留言信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uk_leavemsg`
--

LOCK TABLES `uk_leavemsg` WRITE;
/*!40000 ALTER TABLE `uk_leavemsg` DISABLE KEYS */;
/*!40000 ALTER TABLE `uk_leavemsg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uk_log`
--

DROP TABLE IF EXISTS `uk_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uk_log` (
  `id` varchar(32) NOT NULL COMMENT '主键ID',
  `orgi` varchar(32) DEFAULT NULL COMMENT '租户ID',
  `flowid` varchar(32) DEFAULT NULL COMMENT '页面ID',
  `logtype` varchar(32) DEFAULT NULL COMMENT '日志类型',
  `createdate` datetime DEFAULT NULL COMMENT '创建时间',
  `msg` longtext COMMENT '日志消息',
  `LEVELS` varchar(32) DEFAULT NULL COMMENT '日志级别',
  `thread` varchar(255) DEFAULT NULL COMMENT '线程',
  `clazz` varchar(255) DEFAULT NULL COMMENT 'JAVA类',
  `FILES` varchar(255) DEFAULT NULL COMMENT '文件位置',
  `linenumber` varchar(32) DEFAULT NULL COMMENT '行号',
  `method` varchar(255) DEFAULT NULL COMMENT '方法名称',
  `startid` varchar(32) DEFAULT NULL COMMENT '启动ID',
  `errorinfo` text COMMENT '错误消息',
  `triggerwarning` varchar(32) DEFAULT NULL COMMENT '触发警告',
  `triggertime` varchar(32) DEFAULT NULL COMMENT '警告时间',
  `triggertimes` int(11) DEFAULT NULL COMMENT '警告次数',
  `name` varchar(32) DEFAULT NULL COMMENT '日志名称',
  `code` varchar(32) DEFAULT NULL COMMENT '日志代码',
  `memo` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `userid` varchar(32) DEFAULT NULL COMMENT '用户ID',
  `username` varchar(32) DEFAULT NULL COMMENT '日志触发名',
  `logtime` varchar(32) DEFAULT NULL COMMENT '日志时间',
  `ipaddr` varchar(255) DEFAULT NULL COMMENT '服务器地址',
  `port` varchar(32) DEFAULT NULL COMMENT '服务器端口',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uk_log`
--

LOCK TABLES `uk_log` WRITE;
/*!40000 ALTER TABLE `uk_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `uk_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uk_log_request`
--

DROP TABLE IF EXISTS `uk_log_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uk_log_request` (
  `id` varchar(32) NOT NULL DEFAULT '主键ID',
  `type` varchar(255) DEFAULT NULL COMMENT '类型',
  `parameters` longtext COMMENT '参数',
  `throwable` varchar(255) DEFAULT NULL COMMENT '异常消息',
  `username` varchar(255) DEFAULT NULL COMMENT '用户名',
  `usermail` varchar(255) DEFAULT NULL COMMENT '用户信息',
  `filename` varchar(255) DEFAULT NULL COMMENT '文件名',
  `orgi` varchar(255) DEFAULT NULL COMMENT '租户ID',
  `error` text COMMENT '错误信息',
  `classname` varchar(255) DEFAULT NULL COMMENT '类名',
  `starttime` datetime DEFAULT NULL COMMENT '执行的开始时间',
  `endtime` datetime DEFAULT NULL COMMENT '执行的结束时间',
  `detailtype` varchar(255) DEFAULT NULL COMMENT '详情类型',
  `url` text COMMENT '访问URL',
  `reportdic` varchar(255) DEFAULT NULL COMMENT '报表目录',
  `reportname` varchar(255) DEFAULT NULL COMMENT '报表名称',
  `ip` varchar(255) DEFAULT NULL COMMENT 'IP地址',
  `hostname` varchar(255) DEFAULT NULL COMMENT '主机名称',
  `statues` varchar(255) DEFAULT NULL COMMENT '状态',
  `methodname` text COMMENT '方法名称',
  `linenumber` varchar(255) DEFAULT NULL COMMENT '行号',
  `querytime` int(255) DEFAULT NULL COMMENT '执行时间',
  `optext` varchar(255) DEFAULT NULL COMMENT '操作代码',
  `field6` varchar(255) DEFAULT NULL COMMENT '备用字段',
  `field7` varchar(255) DEFAULT NULL COMMENT '备用字段',
  `field8` varchar(255) DEFAULT NULL COMMENT '备用字段',
  `flowid` varchar(32) DEFAULT NULL COMMENT '页面ID',
  `userid` varchar(255) DEFAULT NULL COMMENT '用户ID',
  `name` varchar(32) DEFAULT NULL COMMENT '名称',
  `funtype` varchar(32) DEFAULT NULL COMMENT '方法类型',
  `fundesc` varchar(255) DEFAULT NULL COMMENT '方法描述',
  `triggerwarning` varchar(32) DEFAULT NULL COMMENT '触发警告',
  `triggertime` varchar(32) DEFAULT NULL COMMENT '触发时间',
  `createdate` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='请求记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uk_log_request`
--

LOCK TABLES `uk_log_request` WRITE;
/*!40000 ALTER TABLE `uk_log_request` DISABLE KEYS */;
/*!40000 ALTER TABLE `uk_log_request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uk_message`
--

DROP TABLE IF EXISTS `uk_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uk_message` (
  `id` varchar(32) NOT NULL COMMENT '主键ID',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `creater` varchar(32) DEFAULT NULL COMMENT '创建人',
  `updatetime` datetime DEFAULT NULL COMMENT '更新时间',
  `userid` varchar(32) DEFAULT NULL COMMENT '用户ID',
  `content` text COMMENT '消息内容',
  `status` varchar(10) DEFAULT NULL COMMENT '状态',
  `fromuser` varchar(32) DEFAULT NULL COMMENT '来源用户',
  `touser` varchar(32) DEFAULT NULL COMMENT '目标用户',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='个人消息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uk_message`
--

LOCK TABLES `uk_message` WRITE;
/*!40000 ALTER TABLE `uk_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `uk_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uk_onlineuser`
--

DROP TABLE IF EXISTS `uk_onlineuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uk_onlineuser` (
  `assignedto` varchar(255) NOT NULL DEFAULT '' COMMENT '分配给目标',
  `creater` varchar(255) DEFAULT NULL COMMENT '创建人',
  `datastatus` varchar(255) DEFAULT NULL COMMENT '时间状态',
  `id` varchar(32) NOT NULL COMMENT '主键ID',
  `impid` varchar(255) DEFAULT NULL COMMENT '批次ID',
  `ipcode` varchar(255) DEFAULT NULL COMMENT 'IP编码',
  `orgi` varchar(191) DEFAULT NULL COMMENT '租户ID',
  `owner` varchar(255) DEFAULT NULL COMMENT '所属用户',
  `processid` varchar(255) DEFAULT NULL COMMENT '流程ID',
  `shares` varchar(255) DEFAULT NULL COMMENT '分享给',
  `updatetime` datetime DEFAULT NULL COMMENT '更新时间',
  `updateuser` varchar(255) DEFAULT NULL COMMENT '更新用户',
  `username` varchar(255) DEFAULT NULL COMMENT '用户名',
  `wfstatus` varchar(255) DEFAULT NULL COMMENT '流程状态',
  `resolution` varchar(255) DEFAULT NULL COMMENT '分辨率',
  `opersystem` varchar(100) DEFAULT NULL COMMENT '操作系统',
  `ip` varchar(50) DEFAULT NULL COMMENT 'IP',
  `hostname` varchar(32) DEFAULT NULL COMMENT '主机名称',
  `browser` varchar(32) DEFAULT NULL COMMENT '浏览器',
  `status` varchar(11) DEFAULT NULL COMMENT '状态',
  `userid` varchar(52) DEFAULT NULL COMMENT '用户ID',
  `logintime` datetime DEFAULT NULL COMMENT '访问时间',
  `sessionid` varchar(100) DEFAULT NULL COMMENT '会话ID',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `usertype` varchar(52) DEFAULT NULL COMMENT '访客类型',
  `optype` varchar(52) DEFAULT NULL COMMENT '操作类型',
  `mobile` varchar(10) DEFAULT NULL COMMENT '移动端',
  `phone` varchar(20) DEFAULT NULL COMMENT '电话号',
  `olduser` varchar(10) DEFAULT NULL COMMENT '老用户',
  `country` varchar(50) DEFAULT NULL COMMENT '访客国家',
  `region` varchar(200) DEFAULT NULL COMMENT '访客区域',
  `city` varchar(50) DEFAULT NULL COMMENT '城市',
  `isp` varchar(100) DEFAULT NULL COMMENT '接入运营商',
  `province` varchar(50) DEFAULT NULL COMMENT '省份',
  `betweentime` int(11) DEFAULT NULL COMMENT '停留时间',
  `datestr` varchar(20) DEFAULT NULL COMMENT '时间',
  `keyword` varchar(100) DEFAULT NULL COMMENT '搜索引擎关键词',
  `source` varchar(50) DEFAULT NULL COMMENT '来源',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `url` text COMMENT '来源URL',
  `useragent` text COMMENT 'UA',
  `invitetimes` int(11) DEFAULT NULL COMMENT '要求次数',
  `invitestatus` varchar(10) DEFAULT NULL COMMENT '邀请状态',
  `refusetimes` int(11) DEFAULT NULL COMMENT '拒绝次数',
  `channel` varchar(32) DEFAULT NULL COMMENT '渠道',
  `appid` varchar(32) DEFAULT NULL COMMENT 'SNSID',
  `contactsid` varchar(32) DEFAULT NULL COMMENT '联系人ID',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `onlineuser_userid` (`userid`) USING BTREE,
  KEY `onlineuser_orgi` (`orgi`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='在线访客信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uk_onlineuser`
--

LOCK TABLES `uk_onlineuser` WRITE;
/*!40000 ALTER TABLE `uk_onlineuser` DISABLE KEYS */;
/*!40000 ALTER TABLE `uk_onlineuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uk_onlineuser_his`
--

DROP TABLE IF EXISTS `uk_onlineuser_his`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uk_onlineuser_his` (
  `assignedto` varchar(255) NOT NULL DEFAULT '' COMMENT '分配给目标',
  `creater` varchar(255) DEFAULT NULL COMMENT '创建人',
  `datastatus` varchar(255) DEFAULT NULL COMMENT '时间状态',
  `id` varchar(32) NOT NULL COMMENT '主键ID',
  `impid` varchar(255) DEFAULT NULL COMMENT '批次ID',
  `ipcode` varchar(255) DEFAULT NULL COMMENT 'IP编码',
  `orgi` varchar(255) DEFAULT NULL COMMENT '租户ID',
  `owner` varchar(255) DEFAULT NULL COMMENT '所属用户',
  `processid` varchar(255) DEFAULT NULL COMMENT '流程ID',
  `shares` varchar(255) DEFAULT NULL COMMENT '分享给',
  `updatetime` datetime DEFAULT NULL COMMENT '更新时间',
  `updateuser` varchar(255) DEFAULT NULL COMMENT '更新用户',
  `username` varchar(255) DEFAULT NULL COMMENT '用户名',
  `wfstatus` varchar(255) DEFAULT NULL COMMENT '流程状态',
  `resolution` varchar(255) DEFAULT NULL COMMENT '分辨率',
  `opersystem` varchar(100) DEFAULT NULL COMMENT '操作系统',
  `ip` varchar(50) DEFAULT NULL COMMENT 'IP',
  `hostname` varchar(32) DEFAULT NULL COMMENT '主机名称',
  `browser` varchar(32) DEFAULT NULL COMMENT '浏览器',
  `status` varchar(11) DEFAULT NULL COMMENT '状态',
  `userid` varchar(52) DEFAULT NULL COMMENT '用户ID',
  `logintime` datetime DEFAULT NULL COMMENT '访问时间',
  `sessionid` varchar(100) DEFAULT NULL COMMENT '会话ID',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `usertype` varchar(52) DEFAULT NULL COMMENT '访客类型',
  `optype` varchar(52) DEFAULT NULL COMMENT '操作类型',
  `mobile` varchar(10) DEFAULT NULL COMMENT '移动端',
  `olduser` varchar(10) DEFAULT NULL COMMENT '老用户',
  `country` varchar(50) DEFAULT NULL COMMENT '访客国家',
  `region` varchar(200) DEFAULT NULL COMMENT '访客区域',
  `city` varchar(50) DEFAULT NULL COMMENT '城市',
  `isp` varchar(100) DEFAULT NULL COMMENT '接入运营商',
  `province` varchar(50) DEFAULT NULL COMMENT '省份',
  `betweentime` int(11) DEFAULT NULL COMMENT '停留时间',
  `datestr` varchar(20) DEFAULT NULL COMMENT '时间',
  `keyword` varchar(100) DEFAULT NULL COMMENT '搜索引擎关键词',
  `source` varchar(50) DEFAULT NULL COMMENT '来源',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `url` text COMMENT '来源URL',
  `useragent` text COMMENT 'UA',
  `invitetimes` int(11) DEFAULT NULL COMMENT '要求次数',
  `invitestatus` varchar(10) DEFAULT NULL COMMENT '邀请状态',
  `refusetimes` int(11) DEFAULT NULL COMMENT '拒绝次数',
  `channel` varchar(32) DEFAULT NULL COMMENT '渠道',
  `appid` varchar(32) DEFAULT NULL COMMENT 'SNSID',
  `contactsid` varchar(32) DEFAULT NULL COMMENT '联系人ID',
  `dataid` varchar(32) DEFAULT NULL COMMENT '关联的OnlineUser数据ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='在线访客访问历史表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uk_onlineuser_his`
--

LOCK TABLES `uk_onlineuser_his` WRITE;
/*!40000 ALTER TABLE `uk_onlineuser_his` DISABLE KEYS */;
/*!40000 ALTER TABLE `uk_onlineuser_his` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uk_orderscomment`
--

DROP TABLE IF EXISTS `uk_orderscomment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uk_orderscomment` (
  `ID` varchar(32) NOT NULL COMMENT '主键ID',
  `USERNAME` varchar(50) DEFAULT NULL COMMENT '用户名',
  `CREATER` varchar(32) DEFAULT NULL COMMENT '创建人ID',
  `CREATETIME` datetime DEFAULT NULL COMMENT '创建时间',
  `DATAID` varchar(32) DEFAULT NULL COMMENT '数据记录ID',
  `CONTENT` text COMMENT '回复内容',
  `UPDATETIME` datetime DEFAULT NULL COMMENT '更新时间',
  `OPTIMAL` tinyint(4) DEFAULT NULL COMMENT '操作次数',
  `PRIREP` tinyint(4) DEFAULT NULL COMMENT '是否私有回复',
  `UP` int(11) DEFAULT NULL COMMENT '点赞',
  `COMMENTS` int(11) DEFAULT NULL COMMENT '回复数量',
  `ADMIN` tinyint(4) DEFAULT NULL COMMENT '是否管理员',
  `DATASTATUS` tinyint(4) DEFAULT NULL COMMENT '数据状态',
  `ORGI` varchar(50) DEFAULT NULL COMMENT '租户ID',
  `CATE` varchar(32) DEFAULT NULL COMMENT '分类',
  `OPTYPE` varchar(32) DEFAULT NULL COMMENT '操作类型',
  `IPCODE` varchar(100) DEFAULT NULL COMMENT 'IP编码',
  `COUNTRY` varchar(100) DEFAULT NULL COMMENT '国家',
  `PROVINCE` varchar(100) DEFAULT NULL COMMENT '省份',
  `CITY` varchar(100) DEFAULT NULL COMMENT '城市',
  `ISP` varchar(100) DEFAULT NULL COMMENT '运营商',
  `REGION` varchar(100) DEFAULT NULL COMMENT '地区',
  `ROWCOUNT` int(11) DEFAULT NULL COMMENT '编号',
  `KEY` varchar(100) DEFAULT NULL COMMENT '关键词',
  `APPROVAL` varchar(20) DEFAULT NULL COMMENT '审批',
  `RETBACK` varchar(20) DEFAULT NULL COMMENT '退回',
  `ACCDEPT` varchar(32) DEFAULT NULL COMMENT '转办部门',
  `ACCUSER` varchar(32) DEFAULT NULL COMMENT '转办用户',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='工单评论/回复表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uk_orderscomment`
--

LOCK TABLES `uk_orderscomment` WRITE;
/*!40000 ALTER TABLE `uk_orderscomment` DISABLE KEYS */;
/*!40000 ALTER TABLE `uk_orderscomment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uk_organ`
--

DROP TABLE IF EXISTS `uk_organ`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uk_organ` (
  `ID` varchar(32) NOT NULL COMMENT '主键ID',
  `NAME` varchar(50) DEFAULT NULL COMMENT '名称',
  `CODE` varchar(50) DEFAULT NULL COMMENT '代码',
  `CREATETIME` datetime DEFAULT NULL COMMENT '创建时间',
  `CREATER` varchar(32) DEFAULT NULL COMMENT '创建人',
  `UPDATETIME` datetime DEFAULT NULL COMMENT '更新时间',
  `ORGI` varchar(32) DEFAULT NULL COMMENT '租户ID',
  `ORGID` varchar(32) DEFAULT NULL COMMENT '企业ID',
  `USERNAME` varchar(50) DEFAULT NULL COMMENT '用户名',
  `PARENT` varchar(32) DEFAULT NULL COMMENT '父级ID',
  `SKILL` tinyint(4) DEFAULT '0' COMMENT '启用技能组',
  `area` text,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='部门表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uk_organ`
--

LOCK TABLES `uk_organ` WRITE;
/*!40000 ALTER TABLE `uk_organ` DISABLE KEYS */;
/*!40000 ALTER TABLE `uk_organ` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uk_organization`
--

DROP TABLE IF EXISTS `uk_organization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uk_organization` (
  `id` varchar(32) NOT NULL DEFAULT '' COMMENT '机构ID',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `orgtype` varchar(255) DEFAULT NULL COMMENT '类型',
  `orgscale` varchar(255) DEFAULT NULL COMMENT '规模',
  `orgindustry` varchar(255) DEFAULT NULL COMMENT '行业',
  `code` varchar(255) DEFAULT NULL COMMENT '代码',
  `memo` varchar(200) DEFAULT NULL COMMENT '备注',
  `logo` varchar(200) DEFAULT NULL COMMENT 'LOGO URL',
  `createtime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='企业信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uk_organization`
--

LOCK TABLES `uk_organization` WRITE;
/*!40000 ALTER TABLE `uk_organization` DISABLE KEYS */;
/*!40000 ALTER TABLE `uk_organization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uk_organrole`
--

DROP TABLE IF EXISTS `uk_organrole`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uk_organrole` (
  `id` varchar(32) NOT NULL COMMENT '主键ID',
  `organ_id` varchar(32) DEFAULT NULL COMMENT '机构ID',
  `role_id` varchar(32) DEFAULT NULL COMMENT '角色ID',
  `creater` varchar(32) DEFAULT NULL COMMENT '创建人',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `orgi` varchar(32) DEFAULT NULL COMMENT '租户ID',
  `dicid` varchar(32) DEFAULT NULL COMMENT '目录ID',
  `dicvalue` varchar(50) DEFAULT NULL COMMENT '目录名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='部门授权表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uk_organrole`
--

LOCK TABLES `uk_organrole` WRITE;
/*!40000 ALTER TABLE `uk_organrole` DISABLE KEYS */;
/*!40000 ALTER TABLE `uk_organrole` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uk_orgi_skill_rel`
--

DROP TABLE IF EXISTS `uk_orgi_skill_rel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uk_orgi_skill_rel` (
  `ID` varchar(32) NOT NULL COMMENT '主键ID',
  `SKILLID` varchar(50) DEFAULT NULL COMMENT '技能组',
  `CREATETIME` datetime DEFAULT NULL COMMENT '创建时间',
  `CREATER` varchar(32) DEFAULT NULL COMMENT '创建人',
  `UPDATETIME` datetime DEFAULT NULL COMMENT '更新时间',
  `ORGI` varchar(32) DEFAULT NULL COMMENT '租户ID',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='租户角色映射表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uk_orgi_skill_rel`
--

LOCK TABLES `uk_orgi_skill_rel` WRITE;
/*!40000 ALTER TABLE `uk_orgi_skill_rel` DISABLE KEYS */;
/*!40000 ALTER TABLE `uk_orgi_skill_rel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uk_propertiesevent`
--

DROP TABLE IF EXISTS `uk_propertiesevent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uk_propertiesevent` (
  `id` varchar(32) NOT NULL COMMENT '主键ID',
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `tpid` varchar(32) DEFAULT NULL COMMENT '字段ID',
  `propertity` varchar(50) DEFAULT NULL COMMENT '字段',
  `field` varchar(50) DEFAULT NULL COMMENT '阻断名称',
  `newvalue` varchar(255) DEFAULT NULL COMMENT '变更后的值',
  `oldvalue` varchar(255) DEFAULT NULL COMMENT '变更前的值',
  `orgi` varchar(32) DEFAULT NULL COMMENT '租户ID',
  `modifyid` varchar(32) DEFAULT NULL COMMENT '修改ID',
  `creater` varchar(32) DEFAULT NULL COMMENT '创建人',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `dataid` varchar(32) DEFAULT NULL COMMENT '数据记录ID',
  `textvalue` varchar(255) DEFAULT NULL COMMENT '文本值',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='字段变更记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uk_propertiesevent`
--

LOCK TABLES `uk_propertiesevent` WRITE;
/*!40000 ALTER TABLE `uk_propertiesevent` DISABLE KEYS */;
/*!40000 ALTER TABLE `uk_propertiesevent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uk_publishedcube`
--

DROP TABLE IF EXISTS `uk_publishedcube`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uk_publishedcube` (
  `ID` varchar(32) NOT NULL COMMENT '主键ID',
  `NAME` varchar(255) DEFAULT NULL COMMENT '名称',
  `CREATETIME` datetime DEFAULT NULL COMMENT '创建时间',
  `DB` varchar(32) DEFAULT NULL COMMENT '数据ID',
  `ORGI` varchar(32) DEFAULT NULL COMMENT '租户ID',
  `MPOSLEFT` varchar(32) DEFAULT NULL COMMENT '位置',
  `MPOSTOP` varchar(32) DEFAULT NULL COMMENT '距顶位置',
  `TYPEID` varchar(32) DEFAULT NULL COMMENT '分类ID',
  `CODE` varchar(32) DEFAULT NULL COMMENT '代码',
  `DSTYPE` varchar(255) DEFAULT NULL COMMENT '数据源类型',
  `MODELTYPE` varchar(32) DEFAULT NULL COMMENT '模型类型',
  `createdata` varchar(32) DEFAULT NULL COMMENT '创建数据',
  `startindex` int(11) DEFAULT NULL COMMENT '开始位置',
  `startdate` datetime DEFAULT NULL COMMENT '开始时间',
  `dataid` varchar(32) DEFAULT NULL COMMENT '数据ID',
  `dataflag` varchar(255) DEFAULT NULL COMMENT '数据标识',
  `DATAVERSION` int(11) DEFAULT NULL COMMENT '版本',
  `CREATER` varchar(255) DEFAULT NULL COMMENT '创建人',
  `USERID` varchar(32) DEFAULT NULL COMMENT '用户ID',
  `USERNAME` varchar(255) DEFAULT NULL COMMENT '用户名',
  `CUBECONTENT` longtext COMMENT '序列化的模型数据',
  `DBID` varchar(32) DEFAULT NULL COMMENT '数据ID',
  `DICLOCATION` varchar(255) DEFAULT NULL COMMENT '目录位置',
  `USEREMAIL` varchar(255) DEFAULT NULL COMMENT '用户邮件',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='已发布模型';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uk_publishedcube`
--

LOCK TABLES `uk_publishedcube` WRITE;
/*!40000 ALTER TABLE `uk_publishedcube` DISABLE KEYS */;
/*!40000 ALTER TABLE `uk_publishedcube` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uk_publishedreport`
--

DROP TABLE IF EXISTS `uk_publishedreport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uk_publishedreport` (
  `ID` varchar(32) NOT NULL COMMENT '组件ID',
  `NAME` varchar(255) DEFAULT NULL COMMENT '名称',
  `CREATETIME` datetime DEFAULT NULL COMMENT '创建时间',
  `ORGI` varchar(32) DEFAULT NULL COMMENT '租户ID',
  `DICID` varchar(32) DEFAULT NULL COMMENT '目录ID',
  `CODE` varchar(32) DEFAULT NULL COMMENT '代码',
  `reporttype` varchar(255) DEFAULT NULL COMMENT '报表类型',
  `startindex` int(11) DEFAULT NULL COMMENT '开始位置',
  `startdate` datetime DEFAULT NULL COMMENT '开始时间',
  `dataid` varchar(32) DEFAULT NULL COMMENT '数据ID',
  `dataflag` varchar(255) DEFAULT NULL COMMENT '数据标识',
  `DATAVERSION` int(11) DEFAULT NULL COMMENT '数据版本',
  `CREATER` varchar(255) DEFAULT NULL COMMENT '创建人',
  `REPORTCONTENT` longtext COMMENT '报表内容',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='已发布报表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uk_publishedreport`
--

LOCK TABLES `uk_publishedreport` WRITE;
/*!40000 ALTER TABLE `uk_publishedreport` DISABLE KEYS */;
/*!40000 ALTER TABLE `uk_publishedreport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uk_quality`
--

DROP TABLE IF EXISTS `uk_quality`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uk_quality` (
  `ID` varchar(32) NOT NULL COMMENT '主键ID',
  `NAME` varchar(50) DEFAULT NULL COMMENT '质检名称',
  `CODE` varchar(50) DEFAULT NULL COMMENT '代码',
  `CREATETIME` datetime DEFAULT NULL COMMENT '创建时间',
  `CREATER` varchar(32) DEFAULT NULL COMMENT '创建人',
  `UPDATETIME` datetime DEFAULT NULL COMMENT '更新时间',
  `ORGI` varchar(32) DEFAULT NULL COMMENT '租户ID',
  `USERNAME` varchar(50) DEFAULT NULL COMMENT '用户名',
  `PARENTID` varchar(32) DEFAULT NULL COMMENT '知识库分类上级ID',
  `STARTDATE` datetime DEFAULT NULL COMMENT '有效期开始时间',
  `ENDDATE` datetime DEFAULT NULL COMMENT '有效期结束时间',
  `ENABLE` tinyint(4) DEFAULT NULL COMMENT '分类状态',
  `SCORE` int(11) DEFAULT '0' COMMENT '分值',
  `DESCRIPTION` varchar(255) DEFAULT NULL COMMENT '分类描述',
  `QUALITYTYPE` varchar(50) DEFAULT NULL COMMENT '质检方式',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='质检表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uk_quality`
--

LOCK TABLES `uk_quality` WRITE;
/*!40000 ALTER TABLE `uk_quality` DISABLE KEYS */;
/*!40000 ALTER TABLE `uk_quality` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uk_que_survey_answer`
--

DROP TABLE IF EXISTS `uk_que_survey_answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uk_que_survey_answer` (
  `id` varchar(32) NOT NULL,
  `questionid` varchar(32) DEFAULT NULL COMMENT '问题ID',
  `questionname` varchar(255) DEFAULT NULL COMMENT '问题名称',
  `answer` text COMMENT '问题答案',
  `queid` varchar(32) DEFAULT NULL COMMENT '跳转问题ID',
  `answerscore` int(11) DEFAULT '0' COMMENT '答案评分',
  `orgi` varchar(32) DEFAULT NULL COMMENT '租户ID',
  `creater` varchar(32) DEFAULT NULL COMMENT '创建人',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `updatetime` datetime DEFAULT NULL COMMENT '更新时间',
  `processid` varchar(32) DEFAULT NULL COMMENT '问卷ID',
  `correct` varchar(32) DEFAULT NULL COMMENT '是否是正确答案（0正确1不正确）',
  `hanguptype` varchar(32) DEFAULT NULL COMMENT '挂断提示语类型',
  `hangupmsg` varchar(255) DEFAULT NULL COMMENT '挂断提示语文字',
  `hangupvoice` varchar(32) DEFAULT NULL COMMENT '挂断提示语语音',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='问卷调查-问题答案表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uk_que_survey_answer`
--

LOCK TABLES `uk_que_survey_answer` WRITE;
/*!40000 ALTER TABLE `uk_que_survey_answer` DISABLE KEYS */;
/*!40000 ALTER TABLE `uk_que_survey_answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uk_que_survey_process`
--

DROP TABLE IF EXISTS `uk_que_survey_process`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uk_que_survey_process` (
  `id` varchar(32) NOT NULL,
  `name` varchar(32) DEFAULT NULL COMMENT '问卷名称',
  `scene` varchar(32) DEFAULT NULL COMMENT '问卷适用场景（机器人呼出/坐席手动）',
  `welword` varchar(255) DEFAULT NULL COMMENT '问卷欢迎语（文字）',
  `welvoice` varchar(255) DEFAULT NULL COMMENT '问卷欢迎语ID（语音）',
  `weltype` varchar(32) DEFAULT NULL COMMENT '问卷欢迎语类型',
  `endword` varchar(255) DEFAULT NULL COMMENT '问卷结束语（文字）',
  `endvoice` varchar(255) DEFAULT NULL COMMENT '问卷结束语ID（语音）',
  `endtype` varchar(32) DEFAULT NULL COMMENT '问卷结束语类型',
  `totalscore` varchar(32) DEFAULT NULL COMMENT '参考评分值',
  `score` varchar(32) DEFAULT '0' COMMENT '是否评分（0否1是）',
  `memo` text COMMENT '备注',
  `orgi` varchar(32) DEFAULT NULL COMMENT '租户ID',
  `creater` varchar(32) DEFAULT NULL COMMENT '创建人',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `updater` varchar(32) DEFAULT NULL COMMENT '更新人',
  `updatetime` datetime DEFAULT NULL COMMENT '更新时间',
  `prostatus` varchar(32) DEFAULT '0' COMMENT '问卷状态（0未发布1发布）',
  `sumscore` varchar(32) DEFAULT NULL COMMENT '总评分值',
  `description` text COMMENT '描述',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='问卷调查表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uk_que_survey_process`
--

LOCK TABLES `uk_que_survey_process` WRITE;
/*!40000 ALTER TABLE `uk_que_survey_process` DISABLE KEYS */;
/*!40000 ALTER TABLE `uk_que_survey_process` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uk_que_survey_question`
--

DROP TABLE IF EXISTS `uk_que_survey_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uk_que_survey_question` (
  `id` varchar(32) NOT NULL,
  `name` varchar(255) DEFAULT NULL COMMENT '问题名称',
  `sortindex` int(11) DEFAULT '0' COMMENT '问题序号',
  `quetype` int(11) DEFAULT '0' COMMENT '问题类型（0选择题1问答题）',
  `orgi` varchar(32) DEFAULT NULL COMMENT '租户ID',
  `creater` varchar(32) DEFAULT NULL COMMENT '创建人',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `updatetime` datetime DEFAULT NULL COMMENT '更新时间',
  `description` text COMMENT '描述',
  `memo` text COMMENT '备注',
  `score` int(11) DEFAULT NULL COMMENT '问题分值',
  `processid` varchar(32) DEFAULT NULL COMMENT '问卷ID',
  `wvtype` varchar(32) DEFAULT NULL COMMENT '类型（文字/语音）',
  `quevoice` varchar(32) DEFAULT NULL COMMENT '语音ID',
  `confirmtype` varchar(32) DEFAULT NULL COMMENT '答案确认语类型',
  `confirmword` varchar(255) DEFAULT NULL COMMENT '答案确认语文字',
  `confirmvoice` varchar(255) DEFAULT NULL COMMENT '答案确认语语音',
  `overtimetype` varchar(255) DEFAULT NULL COMMENT '回答超时语',
  `overtimeword` varchar(255) DEFAULT NULL COMMENT '回答超时语文字',
  `overtimevoice` varchar(255) DEFAULT NULL COMMENT '回答超时语语音',
  `errortype` varchar(255) DEFAULT NULL COMMENT '回答错误语',
  `errorword` varchar(255) DEFAULT NULL COMMENT '回答错误语文字',
  `errorvoice` varchar(255) DEFAULT NULL COMMENT '回答错误语语音',
  `replykeyword` varchar(255) DEFAULT NULL COMMENT '关键词重复',
  `replytype` varchar(255) DEFAULT NULL COMMENT '重复提示类型',
  `replyword` varchar(255) DEFAULT NULL COMMENT '重复提示语文字',
  `replyvoice` varchar(255) DEFAULT NULL COMMENT '重复提示语语音',
  `replyrepeat` varchar(32) DEFAULT NULL COMMENT '重复确认语-最大重复次数',
  `replyoperate` varchar(32) DEFAULT NULL COMMENT '重复确认语-到达最大次数的操作（转接trans/挂断/handup）',
  `replytrans` varchar(32) DEFAULT NULL COMMENT '重复确认语-转接号码',
  `replytypeup` varchar(32) DEFAULT NULL COMMENT '重复确认语-转接号码',
  `replywordup` varchar(255) DEFAULT NULL COMMENT '重复确认语-挂断提示语（文字）',
  `replyvoiceup` varchar(32) DEFAULT NULL COMMENT '重复确认语-挂断提示语（语音ID）',
  `overtimerepeat` varchar(32) DEFAULT NULL COMMENT '回答超时语-最大重复次数',
  `overtimeoperate` varchar(32) DEFAULT NULL COMMENT '回答超时语-到达最大次数的操作（转接trans/挂断/handup）',
  `overtimetrans` varchar(32) DEFAULT NULL COMMENT '回答超时语-转接号码',
  `overtimetypeup` varchar(32) DEFAULT NULL COMMENT '回答超时语-挂断提示语类型',
  `overtimewordup` varchar(255) DEFAULT NULL COMMENT '回答超时语-挂断提示语（文字）',
  `overtimevoiceup` varchar(32) DEFAULT NULL COMMENT '回答超时语-挂断提示语（语音ID）',
  `errorepeat` varchar(32) DEFAULT NULL COMMENT '回答错误语-最大重复次数',
  `erroroperate` varchar(32) DEFAULT NULL COMMENT '回答错误语-到达最大次数的操作（转接trans/挂断/handup）',
  `errortrans` varchar(32) DEFAULT NULL COMMENT '回答错误语-转接号码',
  `errortypeup` varchar(32) DEFAULT NULL COMMENT '回答错误语-挂断提示语类型',
  `errorwordup` varchar(255) DEFAULT NULL COMMENT '回答错误语-挂断提示语（文字）',
  `errorvoiceup` varchar(32) DEFAULT NULL COMMENT '回答错误语-挂断提示语（语音ID）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='问卷调查-问题表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uk_que_survey_question`
--

LOCK TABLES `uk_que_survey_question` WRITE;
/*!40000 ALTER TABLE `uk_que_survey_question` DISABLE KEYS */;
/*!40000 ALTER TABLE `uk_que_survey_question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uk_quick_type`
--

DROP TABLE IF EXISTS `uk_quick_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uk_quick_type` (
  `ID` varchar(32) NOT NULL COMMENT '主键ID',
  `NAME` varchar(50) DEFAULT NULL COMMENT '名称',
  `CODE` varchar(50) DEFAULT NULL COMMENT '代码',
  `CREATETIME` datetime DEFAULT NULL COMMENT '创建时间',
  `CREATER` varchar(32) DEFAULT NULL COMMENT '创建人',
  `UPDATETIME` datetime DEFAULT NULL COMMENT '更新时间',
  `ORGI` varchar(32) DEFAULT NULL COMMENT '租户ID',
  `USERNAME` varchar(50) DEFAULT NULL COMMENT '用户名',
  `PARENTID` varchar(32) DEFAULT NULL COMMENT '知识库分类上级ID',
  `INX` int(11) DEFAULT NULL COMMENT '分类排序序号',
  `STARTDATE` datetime DEFAULT NULL COMMENT '有效期开始时间',
  `ENDDATE` datetime DEFAULT NULL COMMENT '有效期结束时间',
  `ENABLE` tinyint(4) DEFAULT NULL COMMENT '分类状态',
  `DESCRIPTION` varchar(255) DEFAULT NULL COMMENT '分类描述',
  `QUICKTYPE` varchar(32) DEFAULT NULL COMMENT '类型（公共/个人）',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='质检项分类';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uk_quick_type`
--

LOCK TABLES `uk_quick_type` WRITE;
/*!40000 ALTER TABLE `uk_quick_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `uk_quick_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uk_quickreply`
--

DROP TABLE IF EXISTS `uk_quickreply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uk_quickreply` (
  `id` varchar(32) NOT NULL DEFAULT '' COMMENT '主键ID',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `content` text COMMENT '内容',
  `type` varchar(10) DEFAULT NULL COMMENT '类型',
  `creater` varchar(32) DEFAULT NULL COMMENT '创建人',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `cate` varchar(32) DEFAULT NULL COMMENT '分类',
  `orgi` varchar(32) DEFAULT NULL COMMENT '租户ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='快捷回复表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uk_quickreply`
--

LOCK TABLES `uk_quickreply` WRITE;
/*!40000 ALTER TABLE `uk_quickreply` DISABLE KEYS */;
/*!40000 ALTER TABLE `uk_quickreply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uk_recentuser`
--

DROP TABLE IF EXISTS `uk_recentuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uk_recentuser` (
  `id` varchar(32) NOT NULL COMMENT '主键ID',
  `creater` varchar(32) DEFAULT NULL COMMENT '创建人ID',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `updatetime` datetime DEFAULT NULL COMMENT '更新时间',
  `name` varchar(100) DEFAULT NULL COMMENT '名称',
  `orgi` varchar(100) DEFAULT NULL COMMENT '租户ID',
  `user_id` varchar(32) DEFAULT NULL COMMENT '用户ID',
  `lastmsg` text COMMENT '最后一条消息',
  `newmsg` int(11) DEFAULT NULL COMMENT '未读消息数量',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='公共已读消息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uk_recentuser`
--

LOCK TABLES `uk_recentuser` WRITE;
/*!40000 ALTER TABLE `uk_recentuser` DISABLE KEYS */;
/*!40000 ALTER TABLE `uk_recentuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uk_report`
--

DROP TABLE IF EXISTS `uk_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uk_report` (
  `ID` varchar(32) NOT NULL COMMENT '主键ID',
  `NAME` varchar(255) DEFAULT NULL COMMENT '报表名称',
  `REPORTTYPE` varchar(32) DEFAULT NULL COMMENT '报表类型',
  `TITLE` varchar(255) DEFAULT NULL COMMENT '主题',
  `ORGI` varchar(32) DEFAULT NULL COMMENT '租户ID',
  `OBJECTCOUNT` int(11) DEFAULT NULL COMMENT '模板内容',
  `DICID` varchar(32) DEFAULT NULL COMMENT '目录ID',
  `CREATETIME` datetime DEFAULT NULL COMMENT '创建时间',
  `DESCRIPTION` longtext COMMENT '描述内容',
  `HTML` longtext COMMENT '代码',
  `REPORTPACKAGE` varchar(255) DEFAULT NULL COMMENT '路径',
  `USEACL` varchar(32) DEFAULT NULL COMMENT '访问授权',
  `status` varchar(32) DEFAULT NULL COMMENT '状态',
  `rolename` text COMMENT '角色名称',
  `userid` text COMMENT '用户ID',
  `blacklist` text COMMENT '黑名单列表',
  `REPORTCONTENT` longtext COMMENT '报表序列化代码',
  `reportmodel` varchar(32) DEFAULT NULL COMMENT '报表模型',
  `updatetime` datetime DEFAULT NULL COMMENT '更新时间',
  `creater` varchar(255) DEFAULT NULL COMMENT '创建人',
  `reportversion` int(11) DEFAULT NULL COMMENT '版本',
  `publishedtype` varchar(32) DEFAULT NULL COMMENT '发布状态',
  `tabtype` varchar(32) DEFAULT NULL COMMENT '切换方式',
  `USERNAME` varchar(32) DEFAULT NULL COMMENT '用户名',
  `USEREMAIL` varchar(255) DEFAULT NULL COMMENT '用户信息',
  `CACHE` smallint(6) DEFAULT NULL COMMENT '是否启用缓存',
  `EXTPARAM` varchar(255) DEFAULT NULL COMMENT '导出参数',
  `TARGETREPORT` varchar(32) DEFAULT NULL COMMENT '目标报表',
  `DATASTATUS` tinyint(4) DEFAULT NULL COMMENT '报表状态',
  `CODE` varchar(100) DEFAULT NULL COMMENT '代码',
  `SOURCE` varchar(50) DEFAULT NULL COMMENT '数据源',
  `VIEWTYPE` varchar(32) DEFAULT NULL COMMENT '视图类型',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='报表数据表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uk_report`
--

LOCK TABLES `uk_report` WRITE;
/*!40000 ALTER TABLE `uk_report` DISABLE KEYS */;
/*!40000 ALTER TABLE `uk_report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uk_reportfilter`
--

DROP TABLE IF EXISTS `uk_reportfilter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uk_reportfilter` (
  `id` varchar(32) NOT NULL DEFAULT '' COMMENT '主键ID',
  `dataid` varchar(32) DEFAULT NULL COMMENT '数据ID',
  `dataname` varchar(255) DEFAULT NULL COMMENT '数据名称',
  `modelid` varchar(32) DEFAULT NULL COMMENT '组件ID',
  `reportid` varchar(32) DEFAULT NULL COMMENT '报表ID',
  `contype` varchar(32) DEFAULT NULL COMMENT '链接类型',
  `filtertype` varchar(32) DEFAULT NULL COMMENT '筛选器类型',
  `formatstr` varchar(255) DEFAULT NULL COMMENT '格式化字符串',
  `convalue` varchar(255) DEFAULT NULL COMMENT '数据值',
  `userdefvalue` text COMMENT '默认数据',
  `valuefiltertype` varchar(255) DEFAULT NULL COMMENT '筛选器值类型',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `code` varchar(32) DEFAULT NULL COMMENT '代码',
  `orgi` varchar(32) DEFAULT NULL COMMENT '租户ID',
  `content` text COMMENT '内容',
  `valuestr` varchar(255) DEFAULT NULL COMMENT '数据值字符串',
  `filterprefix` varchar(255) DEFAULT NULL COMMENT '过滤器前缀',
  `filtersuffix` varchar(255) DEFAULT NULL COMMENT '过滤器后缀',
  `modeltype` varchar(32) DEFAULT NULL COMMENT '元素类型',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `funtype` varchar(32) DEFAULT NULL COMMENT '业务类型',
  `measureid` varchar(32) DEFAULT NULL COMMENT '指标ID',
  `valuecompare` varchar(32) DEFAULT NULL COMMENT '值',
  `defaultvalue` text COMMENT '默认值',
  `comparetype` varchar(32) DEFAULT NULL COMMENT '筛选比较类型',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `cubeid` varchar(32) DEFAULT NULL COMMENT '模型ID',
  `mustvalue` varchar(32) DEFAULT NULL COMMENT '必选值',
  `groupids` text COMMENT '分组ID',
  `defaultvaluerule` text COMMENT '默认值',
  `dimid` varchar(32) DEFAULT NULL COMMENT '维度ID',
  `endvalue` text COMMENT '范围值',
  `filtertemplet` varchar(255) DEFAULT NULL COMMENT '筛选器模板',
  `noformatvalue` text COMMENT '未格式化值',
  `startvalue` varchar(255) DEFAULT NULL COMMENT '筛选范围值',
  `sortindex` int(11) DEFAULT NULL COMMENT '排序位置',
  `cascadeid` varchar(32) DEFAULT NULL COMMENT '引用ID',
  `tableproperty` varchar(32) DEFAULT NULL COMMENT '数据字段ID',
  `tableid` varchar(32) DEFAULT NULL COMMENT '数据表ID',
  `fieldid` varchar(32) DEFAULT NULL COMMENT '字段ID',
  `fktableid` varchar(32) DEFAULT NULL COMMENT '外键表ID',
  `filterfieldid` varchar(32) DEFAULT NULL COMMENT '外键字段ID',
  `isdic` tinyint(4) DEFAULT NULL COMMENT '是否目录',
  `diccode` varchar(255) DEFAULT NULL COMMENT '显示值',
  `keyfield` varchar(32) DEFAULT NULL COMMENT '主键字段',
  `valuefield` varchar(32) DEFAULT NULL COMMENT '取值字段',
  `fkfieldid` varchar(32) DEFAULT NULL COMMENT '外键字段ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='报表筛选器';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uk_reportfilter`
--

LOCK TABLES `uk_reportfilter` WRITE;
/*!40000 ALTER TABLE `uk_reportfilter` DISABLE KEYS */;
/*!40000 ALTER TABLE `uk_reportfilter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uk_reportmodel`
--

DROP TABLE IF EXISTS `uk_reportmodel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uk_reportmodel` (
  `id` varchar(50) NOT NULL COMMENT '主键ID',
  `posx` varchar(50) DEFAULT NULL COMMENT '位置',
  `posy` varchar(50) DEFAULT NULL COMMENT '位置',
  `poswidth` varchar(50) DEFAULT NULL COMMENT '宽度',
  `posheight` varchar(50) DEFAULT NULL COMMENT '高度',
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `code` varchar(50) DEFAULT NULL COMMENT '代码',
  `reportid` varchar(50) DEFAULT NULL COMMENT '报表ID',
  `modeltype` varchar(50) DEFAULT NULL COMMENT '元素类型',
  `sortindex` int(11) DEFAULT NULL COMMENT '排序位置',
  `stylestr` varchar(50) DEFAULT NULL COMMENT '样式',
  `labeltext` varchar(50) DEFAULT NULL COMMENT '标签',
  `cssclassname` varchar(50) DEFAULT NULL COMMENT '样式名称',
  `mposleft` varchar(50) DEFAULT NULL COMMENT '原生位置',
  `mpostop` varchar(50) DEFAULT NULL COMMENT '元素位置',
  `title` varchar(50) DEFAULT NULL COMMENT '标题',
  `exchangerw` tinyint(4) DEFAULT '0' COMMENT '行列交换',
  `publishedcubeid` varchar(50) DEFAULT NULL COMMENT '模型ID',
  `rowdimension` text COMMENT '行维度',
  `coldimension` text COMMENT '列维度',
  `measure` varchar(50) DEFAULT NULL COMMENT '指标',
  `dstype` varchar(50) DEFAULT NULL COMMENT '数据源类型',
  `dbtype` varchar(50) DEFAULT NULL COMMENT '数据类型',
  `orgi` varchar(50) DEFAULT NULL COMMENT '租户ID',
  `objectid` varchar(50) DEFAULT NULL COMMENT '对象ID',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `filterstr` varchar(50) DEFAULT NULL COMMENT '过滤器字符串',
  `sortstr` varchar(50) DEFAULT NULL COMMENT '排序字符串',
  `viewtype` varchar(50) DEFAULT NULL COMMENT '视图类型',
  `chartemplet` varchar(50) DEFAULT NULL COMMENT '图表模板',
  `chartype` varchar(50) DEFAULT NULL COMMENT '图表类型',
  `chartdatatype` varchar(50) DEFAULT NULL COMMENT '图表数据类型',
  `chart3d` varchar(50) DEFAULT NULL COMMENT '是否3D显示图表',
  `xtitle` varchar(50) DEFAULT NULL COMMENT '列标题',
  `ytitle` varchar(50) DEFAULT NULL COMMENT '行标题',
  `charttitle` varchar(50) DEFAULT NULL COMMENT '图表标题',
  `displayborder` varchar(50) DEFAULT NULL COMMENT '显示边框',
  `bordercolor` varchar(50) DEFAULT NULL COMMENT '边框颜色',
  `displaydesc` varchar(50) DEFAULT NULL COMMENT '倒序显示',
  `formdisplay` varchar(50) DEFAULT NULL COMMENT '显示表单',
  `labelstyle` varchar(50) DEFAULT NULL COMMENT '标签',
  `formname` varchar(50) DEFAULT NULL COMMENT '表单名称',
  `defaultvalue` varchar(50) DEFAULT NULL COMMENT '默认值',
  `querytext` varchar(50) DEFAULT NULL COMMENT '查询语句',
  `tempquey` varchar(50) DEFAULT NULL COMMENT '查询语句',
  `displaytitle` tinyint(4) DEFAULT '0' COMMENT '显示标题',
  `clearzero` tinyint(4) DEFAULT '0' COMMENT '除零',
  `titlestr` varchar(50) DEFAULT NULL COMMENT '标题字符串',
  `width` varchar(50) DEFAULT NULL COMMENT '宽度',
  `height` varchar(50) DEFAULT NULL COMMENT '高度',
  `widthunit` varchar(50) DEFAULT NULL COMMENT '宽度单位',
  `heightunit` varchar(50) DEFAULT NULL COMMENT '高度单位',
  `defheight` varchar(50) DEFAULT NULL COMMENT '定义高度',
  `defwidth` varchar(50) DEFAULT NULL COMMENT '定义宽度',
  `neckwidth` varchar(50) DEFAULT NULL COMMENT '吸附宽度',
  `neckheight` varchar(50) DEFAULT NULL COMMENT '吸附高度',
  `extparam` varchar(50) DEFAULT NULL COMMENT '扩展参数',
  `marginright` varchar(50) DEFAULT NULL COMMENT '距离右侧空白',
  `colorstr` varchar(50) DEFAULT NULL COMMENT '颜色样式',
  `sstart` varchar(50) DEFAULT NULL COMMENT '开始',
  `send` varchar(50) DEFAULT NULL COMMENT '结束',
  `rowformatstr` varchar(50) DEFAULT NULL COMMENT '行格式化字符串',
  `colformatstr` varchar(50) DEFAULT NULL COMMENT '列格式化字符串',
  `publishtype` varchar(50) DEFAULT NULL COMMENT '发布状态',
  `editview` varchar(50) DEFAULT NULL COMMENT '编辑状态',
  `expandbtm` tinyint(4) DEFAULT '0' COMMENT '收缩位置',
  `expandrgt` tinyint(4) DEFAULT '0' COMMENT '收缩方式',
  `curtab` varchar(50) DEFAULT NULL COMMENT '当前页签',
  `hiddencolstr` varchar(50) DEFAULT NULL COMMENT '隐藏样式',
  `eventstr` varchar(50) DEFAULT NULL COMMENT '事件触发样式',
  `dsmodel` varchar(50) DEFAULT NULL COMMENT '数据源模型',
  `html` text COMMENT '代码',
  `sqldialect` varchar(255) DEFAULT NULL COMMENT '方言',
  `pagesize` int(11) DEFAULT NULL COMMENT '分页尺寸',
  `isloadfulldata` varchar(50) DEFAULT NULL COMMENT '全量数据',
  `isexport` tinyint(4) DEFAULT '0' COMMENT '导出',
  `selectdata` tinyint(4) DEFAULT '0' COMMENT '选中数据',
  `exporttitle` varchar(50) DEFAULT NULL COMMENT '导出标题',
  `colsize` int(11) DEFAULT NULL COMMENT '列尺寸',
  `sorttype` varchar(50) DEFAULT NULL COMMENT '排序类型',
  `sortname` varchar(50) DEFAULT NULL COMMENT '排序名称',
  `mid` varchar(32) DEFAULT NULL COMMENT '模型ID',
  `parentid` varchar(32) DEFAULT NULL COMMENT '父级ID',
  `templetid` varchar(32) DEFAULT NULL COMMENT '模板ID',
  `colspan` int(11) DEFAULT NULL COMMENT '合并列',
  `colindex` int(11) DEFAULT NULL COMMENT '列位置',
  `chartcontent` longtext COMMENT '图标代码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='报表布局项';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uk_reportmodel`
--

LOCK TABLES `uk_reportmodel` WRITE;
/*!40000 ALTER TABLE `uk_reportmodel` DISABLE KEYS */;
/*!40000 ALTER TABLE `uk_reportmodel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uk_role`
--

DROP TABLE IF EXISTS `uk_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uk_role` (
  `ID` varchar(32) NOT NULL COMMENT '主键ID',
  `NAME` varchar(50) DEFAULT NULL COMMENT '名称',
  `CODE` varchar(50) DEFAULT NULL COMMENT '代码',
  `CREATETIME` datetime DEFAULT NULL COMMENT '创建时间',
  `CREATER` varchar(32) DEFAULT NULL COMMENT '创建人',
  `UPDATETIME` datetime DEFAULT NULL COMMENT '更新时间',
  `ORGI` varchar(32) DEFAULT NULL COMMENT '租户ID',
  `ORGID` varchar(32) DEFAULT NULL COMMENT '企业ID',
  `USERNAME` varchar(50) DEFAULT NULL COMMENT '用户名',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='角色表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uk_role`
--

LOCK TABLES `uk_role` WRITE;
/*!40000 ALTER TABLE `uk_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `uk_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uk_role_auth`
--

DROP TABLE IF EXISTS `uk_role_auth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uk_role_auth` (
  `ID` varchar(32) NOT NULL COMMENT '主键ID',
  `NAME` varchar(50) DEFAULT NULL COMMENT '名称',
  `CODE` varchar(50) DEFAULT NULL COMMENT '代码',
  `CREATETIME` datetime DEFAULT NULL COMMENT '创建时间',
  `CREATER` varchar(32) DEFAULT NULL COMMENT '创建人',
  `UPDATETIME` datetime DEFAULT NULL COMMENT '更新时间',
  `ORGI` varchar(32) DEFAULT NULL COMMENT '租户ID',
  `USERNAME` varchar(50) DEFAULT NULL COMMENT '用户名',
  `ROLEID` varchar(32) DEFAULT NULL COMMENT '角色ID',
  `DICID` varchar(32) DEFAULT NULL COMMENT '权限ID',
  `DICVALUE` varchar(30) DEFAULT NULL COMMENT '权限代码',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='角色授权';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uk_role_auth`
--

LOCK TABLES `uk_role_auth` WRITE;
/*!40000 ALTER TABLE `uk_role_auth` DISABLE KEYS */;
/*!40000 ALTER TABLE `uk_role_auth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uk_sales_product`
--

DROP TABLE IF EXISTS `uk_sales_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uk_sales_product` (
  `id` varchar(32) NOT NULL COMMENT '数据ID',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `content` text COMMENT '内容',
  `keyword` varchar(100) DEFAULT NULL COMMENT '关键词',
  `summary` varchar(255) DEFAULT NULL COMMENT '摘要',
  `status` varchar(32) DEFAULT NULL COMMENT '状态',
  `tptype` varchar(32) DEFAULT NULL COMMENT '类型',
  `cate` varchar(32) DEFAULT NULL COMMENT '产品分类',
  `username` varchar(32) DEFAULT NULL COMMENT '创建人姓名',
  `orgi` varchar(32) DEFAULT NULL COMMENT '租户ID',
  `creater` varchar(32) DEFAULT NULL COMMENT '创建人',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `updatetime` datetime DEFAULT NULL COMMENT '更新时间',
  `memo` varchar(32) DEFAULT NULL COMMENT '备注',
  `price` int(11) DEFAULT NULL COMMENT '价格',
  `organ` varchar(32) DEFAULT NULL COMMENT '部门',
  `termtype` varchar(32) DEFAULT '0' COMMENT '有效期类型（1永久有效，0有效期）',
  `begintime` datetime DEFAULT NULL COMMENT '有效期开始时间',
  `endtime` datetime DEFAULT NULL COMMENT '有效期结束时间',
  `parentid` varchar(32) DEFAULT NULL COMMENT '上级ID',
  `quota` int(11) DEFAULT '0' COMMENT '配额',
  `provoice` varchar(255) DEFAULT NULL COMMENT '语音介绍',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='电销产品';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uk_sales_product`
--

LOCK TABLES `uk_sales_product` WRITE;
/*!40000 ALTER TABLE `uk_sales_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `uk_sales_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uk_sales_product_type`
--

DROP TABLE IF EXISTS `uk_sales_product_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uk_sales_product_type` (
  `ID` varchar(32) NOT NULL COMMENT '数据ID',
  `NAME` varchar(50) DEFAULT NULL COMMENT '名称',
  `CODE` varchar(50) DEFAULT NULL COMMENT '代码',
  `CREATETIME` datetime DEFAULT NULL COMMENT '创建时间',
  `CREATER` varchar(32) DEFAULT NULL COMMENT '创建人',
  `UPDATETIME` datetime DEFAULT NULL COMMENT '更新时间',
  `ORGI` varchar(32) DEFAULT NULL COMMENT '租户ID',
  `USERNAME` varchar(50) DEFAULT NULL COMMENT '用户名',
  `parentid` varchar(32) DEFAULT NULL COMMENT '上级产品分类',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='电销产品类型';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uk_sales_product_type`
--

LOCK TABLES `uk_sales_product_type` WRITE;
/*!40000 ALTER TABLE `uk_sales_product_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `uk_sales_product_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uk_sales_status`
--

DROP TABLE IF EXISTS `uk_sales_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uk_sales_status` (
  `id` varchar(32) NOT NULL COMMENT '数据ID',
  `name` varchar(255) DEFAULT NULL COMMENT '状态名',
  `code` varchar(255) DEFAULT NULL COMMENT '状态代码',
  `cate` varchar(32) DEFAULT NULL COMMENT '状态分类ID',
  `orgi` varchar(32) DEFAULT NULL COMMENT '租户ID',
  `creater` varchar(32) DEFAULT NULL COMMENT '创建人',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `updatetime` datetime DEFAULT NULL COMMENT '更新时间',
  `memo` varchar(32) DEFAULT NULL COMMENT '备注',
  `activityid` varchar(32) DEFAULT NULL COMMENT '活动ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='电销状态';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uk_sales_status`
--

LOCK TABLES `uk_sales_status` WRITE;
/*!40000 ALTER TABLE `uk_sales_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `uk_sales_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uk_sales_status_type`
--

DROP TABLE IF EXISTS `uk_sales_status_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uk_sales_status_type` (
  `id` varchar(32) NOT NULL COMMENT '数据ID',
  `name` varchar(255) DEFAULT NULL COMMENT '状态分类名',
  `parentid` varchar(32) DEFAULT NULL COMMENT '父级ID',
  `orgi` varchar(32) DEFAULT NULL COMMENT '租户ID',
  `creater` varchar(32) DEFAULT NULL COMMENT '创建人',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `updatetime` datetime DEFAULT NULL COMMENT '更新时间',
  `activityid` varchar(32) DEFAULT NULL COMMENT '活动ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='电销状态类型';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uk_sales_status_type`
--

LOCK TABLES `uk_sales_status_type` WRITE;
/*!40000 ALTER TABLE `uk_sales_status_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `uk_sales_status_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uk_secret`
--

DROP TABLE IF EXISTS `uk_secret`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uk_secret` (
  `id` varchar(32) NOT NULL COMMENT '主键ID',
  `creater` varchar(32) DEFAULT NULL COMMENT '创建人',
  `createtime` varchar(32) DEFAULT NULL COMMENT '创建时间',
  `password` varchar(100) DEFAULT NULL COMMENT '二次密码',
  `orgi` varchar(32) DEFAULT NULL COMMENT '租户ID',
  `model` varchar(32) DEFAULT NULL COMMENT '所属组件',
  `enable` tinyint(4) DEFAULT NULL COMMENT '是否启用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='二次验证信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uk_secret`
--

LOCK TABLES `uk_secret` WRITE;
/*!40000 ALTER TABLE `uk_secret` DISABLE KEYS */;
/*!40000 ALTER TABLE `uk_secret` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uk_servicesummary`
--

DROP TABLE IF EXISTS `uk_servicesummary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uk_servicesummary` (
  `id` varchar(32) NOT NULL COMMENT '主键ID',
  `agentusername` varchar(100) DEFAULT NULL COMMENT '坐席用户名',
  `agentno` varchar(32) DEFAULT NULL COMMENT '坐席ID',
  `status` varchar(32) DEFAULT NULL COMMENT '状态',
  `times` int(11) DEFAULT NULL COMMENT '服务次数',
  `servicetime` datetime DEFAULT NULL COMMENT '服务时间',
  `orgi` varchar(50) DEFAULT NULL COMMENT '租户ID',
  `username` varchar(100) DEFAULT NULL COMMENT '用户名',
  `userid` varchar(32) DEFAULT NULL COMMENT '用户ID',
  `channel` varchar(32) DEFAULT NULL COMMENT '渠道',
  `logindate` datetime DEFAULT NULL COMMENT '登录时间',
  `servicetype` text COMMENT '服务类型',
  `reservation` tinyint(4) DEFAULT NULL COMMENT '是否预约',
  `reservtype` varchar(32) DEFAULT NULL COMMENT '预约方式',
  `reservtime` datetime DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL COMMENT '电子邮件',
  `phonenumber` varchar(32) DEFAULT NULL COMMENT '电话号码',
  `summary` text COMMENT '服务记录',
  `agentserviceid` varchar(32) DEFAULT NULL COMMENT '服务ID',
  `creater` varchar(32) DEFAULT NULL COMMENT '创建人',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `statuseventid` varchar(50) DEFAULT NULL COMMENT '电话记录ID',
  `contactsid` varchar(50) DEFAULT NULL COMMENT '联系人ID',
  `ani` varchar(50) DEFAULT NULL COMMENT '主叫',
  `caller` varchar(50) DEFAULT NULL COMMENT '呼叫发起号码',
  `called` varchar(50) DEFAULT NULL COMMENT '被叫',
  `agent` varchar(50) DEFAULT NULL COMMENT '分机号',
  `process` tinyint(4) DEFAULT NULL,
  `updateuser` varchar(32) DEFAULT NULL,
  `updatetime` datetime DEFAULT NULL,
  `processmemo` text,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='服务小结';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uk_servicesummary`
--

LOCK TABLES `uk_servicesummary` WRITE;
/*!40000 ALTER TABLE `uk_servicesummary` DISABLE KEYS */;
/*!40000 ALTER TABLE `uk_servicesummary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uk_sessionconfig`
--

DROP TABLE IF EXISTS `uk_sessionconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uk_sessionconfig` (
  `id` varchar(32) NOT NULL DEFAULT '' COMMENT '主键ID',
  `orgi` varchar(32) DEFAULT NULL COMMENT '租户ID',
  `creater` varchar(32) DEFAULT NULL COMMENT '创建人',
  `username` varchar(32) DEFAULT NULL COMMENT '用户名',
  `name` varchar(32) DEFAULT NULL COMMENT '名称',
  `sessionmsg` varchar(255) DEFAULT NULL COMMENT '会话消息',
  `distribution` varchar(32) DEFAULT NULL COMMENT '坐席分配策略',
  `timeoutmsg` varchar(255) DEFAULT NULL COMMENT '超时提醒消息',
  `retimeoutmsg` varchar(255) DEFAULT NULL COMMENT '再次超时提醒消息',
  `satisfaction` tinyint(4) DEFAULT NULL COMMENT '启用满意度调查',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `lastagent` tinyint(4) DEFAULT NULL COMMENT '最后服务坐席优先分配',
  `sessiontimeout` tinyint(4) DEFAULT NULL COMMENT '会话超时时间',
  `resessiontimeout` tinyint(4) DEFAULT NULL COMMENT '再次超时时间',
  `timeout` int(11) DEFAULT NULL COMMENT '超时时长',
  `retimeout` int(11) DEFAULT NULL COMMENT '再次超时时长',
  `agenttimeout` int(11) DEFAULT NULL COMMENT '坐席回复超时时长',
  `agentreplaytimeout` tinyint(4) DEFAULT NULL COMMENT '坐席回复超时时长',
  `agenttimeoutmsg` varchar(255) DEFAULT NULL COMMENT '超时回复消息',
  `maxuser` int(11) DEFAULT NULL COMMENT '最大用户数',
  `initmaxuser` int(11) DEFAULT NULL COMMENT '首次就绪分配用户数',
  `workinghours` text COMMENT '工作时间段',
  `notinwhmsg` text COMMENT '非工作时间提醒消息',
  `hourcheck` tinyint(4) DEFAULT NULL COMMENT '启用工作时间',
  `noagentmsg` varchar(255) DEFAULT NULL COMMENT '无坐席消息提醒',
  `agentbusymsg` varchar(255) DEFAULT NULL COMMENT '坐席忙提醒',
  `successmsg` varchar(255) DEFAULT NULL COMMENT '分配成功提醒',
  `finessmsg` varchar(255) DEFAULT NULL COMMENT '结束会话提示消息',
  `quality` tinyint(4) DEFAULT '0' COMMENT '质检',
  `qualityscore` varchar(20) DEFAULT NULL COMMENT '质检评分',
  `servicetimeoutlimit` tinyint(4) DEFAULT '0' COMMENT '服务超时提醒',
  `servicetimeout` int(11) DEFAULT '0' COMMENT '服务超时提醒消息',
  `servicetimeoutmsg` varchar(50) DEFAULT '0' COMMENT '服务超时时间',
  `quenetimeout` int(11) DEFAULT '600' COMMENT '允许访客排队的最大时长',
  `quenetimeoutmsg` varchar(255) DEFAULT NULL COMMENT '访客排队超市提示消息',
  `quene` tinyint(4) DEFAULT '0' COMMENT '坐席姓名',
  `servicename` varchar(50) DEFAULT NULL COMMENT '无坐席的时候回复昵称',
  `agentautoleave` tinyint(4) DEFAULT '0' COMMENT '关闭浏览器自动离线',
  `otherquickplay` tinyint(4) DEFAULT '0' COMMENT '启用外部快捷回复功能',
  `oqrsearchurl` varchar(255) DEFAULT NULL COMMENT '外部快捷回复搜索地址',
  `oqrsearchinput` varchar(32) DEFAULT NULL COMMENT '外部快捷回复搜索输入参数',
  `oqrsearchoutput` varchar(32) DEFAULT NULL COMMENT '外部快捷回复搜索输出参数',
  `oqrdetailurl` varchar(255) DEFAULT NULL COMMENT '外部快捷回复内容URL',
  `oqrdetailinput` varchar(32) DEFAULT NULL COMMENT '外部快捷回复详情输入参数',
  `oqrdetailoutput` varchar(32) DEFAULT NULL COMMENT '外部快捷回复详情输出参数',
  `agentctrlenter` tinyint(4) DEFAULT '0' COMMENT '启用坐席端CTRL+Enter发送消息',
  `ctrlenter` tinyint(4) DEFAULT '0' COMMENT '启用访客端CTRL+Enter发送消息',
  `enablequick` tinyint(32) DEFAULT '0' COMMENT '启用快捷回复功能',
  `otherssl` tinyint(4) DEFAULT '0' COMMENT '外部知识库启用SSL',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='会话设置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uk_sessionconfig`
--

LOCK TABLES `uk_sessionconfig` WRITE;
/*!40000 ALTER TABLE `uk_sessionconfig` DISABLE KEYS */;
/*!40000 ALTER TABLE `uk_sessionconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uk_skill`
--

DROP TABLE IF EXISTS `uk_skill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uk_skill` (
  `ID` varchar(32) NOT NULL COMMENT '主键ID',
  `NAME` varchar(50) DEFAULT NULL COMMENT '技能组名称',
  `CODE` varchar(50) DEFAULT NULL COMMENT '代码',
  `CREATETIME` datetime DEFAULT NULL COMMENT '创建时间',
  `CREATER` varchar(32) DEFAULT NULL COMMENT '创建人',
  `UPDATETIME` datetime DEFAULT NULL COMMENT '更新时间',
  `ORGI` varchar(32) DEFAULT NULL COMMENT '租户ID',
  `USERNAME` varchar(50) DEFAULT NULL COMMENT '用户名',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='技能组表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uk_skill`
--

LOCK TABLES `uk_skill` WRITE;
/*!40000 ALTER TABLE `uk_skill` DISABLE KEYS */;
/*!40000 ALTER TABLE `uk_skill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uk_snsaccount`
--

DROP TABLE IF EXISTS `uk_snsaccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uk_snsaccount` (
  `authorizeURL` varchar(255) DEFAULT NULL COMMENT '认证URL',
  `accessTokenURL` varchar(255) DEFAULT NULL COMMENT '微博TokenURL',
  `baseURL` varchar(255) DEFAULT NULL COMMENT '基础URL',
  `redirectURI` varchar(255) DEFAULT NULL COMMENT '重定向URL',
  `clientSERCRET` varchar(192) DEFAULT NULL COMMENT '安全码',
  `clientID` varchar(96) DEFAULT NULL COMMENT '客户端ID',
  `ID` varchar(96) NOT NULL COMMENT '主键ID',
  `states` varchar(32) DEFAULT NULL COMMENT '状态',
  `region` varchar(32) DEFAULT NULL COMMENT '区域',
  `NAME` varchar(255) DEFAULT NULL COMMENT '账号名称',
  `CODE` varchar(255) DEFAULT NULL COMMENT '编码',
  `USERNAME` varchar(255) DEFAULT NULL COMMENT '用户名',
  `APIPOINT` varchar(255) DEFAULT NULL COMMENT 'API接入点',
  `PASSWORD` varchar(255) DEFAULT NULL COMMENT '密码',
  `SNSTYPE` varchar(255) DEFAULT NULL COMMENT '账号类型（微博/微信）',
  `CREATETIME` datetime DEFAULT NULL COMMENT '创建时间',
  `ACCOUNT` varchar(255) DEFAULT NULL COMMENT '账号',
  `ALLOWREMOTE` varchar(255) DEFAULT NULL COMMENT '允许远程访问',
  `EMAIL` varchar(255) DEFAULT NULL COMMENT '邮件',
  `USERNO` varchar(255) DEFAULT NULL COMMENT '用户名',
  `TOKEN` varchar(255) DEFAULT NULL COMMENT '微信Token',
  `APPKEY` varchar(255) DEFAULT NULL COMMENT '微信AppKey',
  `SECRET` varchar(255) DEFAULT NULL COMMENT '微信Secret',
  `AESKEY` varchar(255) DEFAULT NULL COMMENT '微信AesKey',
  `APPTOKEN` varchar(255) DEFAULT NULL COMMENT '微信AppToken',
  `SESSIONKEY` varchar(255) DEFAULT NULL COMMENT '会话Key',
  `MOREPARAM` varchar(255) DEFAULT NULL COMMENT '更多参数',
  `ORGI` varchar(255) DEFAULT NULL COMMENT '租户ID',
  `ORGAN` varchar(32) DEFAULT NULL COMMENT '组织机构ID',
  `DEFAULTACCOUNT` smallint(6) DEFAULT NULL COMMENT '默认账号',
  `lastatupdate` varchar(96) DEFAULT NULL COMMENT '最后更新时间',
  `lastprimsgupdate` varchar(96) DEFAULT NULL,
  `ACCTYPE` varchar(32) DEFAULT NULL COMMENT '账号类型',
  `UPDATETIME` datetime DEFAULT NULL COMMENT '更新时间',
  `creater` varchar(32) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_username` varchar(255) DEFAULT NULL COMMENT '更新用户',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `update_user` varchar(255) DEFAULT NULL COMMENT '修改人',
  `shares` varchar(255) DEFAULT NULL COMMENT '分享给',
  `owner` varchar(255) DEFAULT NULL COMMENT '所属人',
  `assignedto` varchar(255) DEFAULT NULL COMMENT '分配目标用户',
  `wfstatus` varchar(255) DEFAULT NULL COMMENT '流程状态',
  `datadept` varchar(255) DEFAULT NULL COMMENT '创建人部门',
  `batid` varchar(32) DEFAULT NULL COMMENT '批次ID',
  `alias` varchar(50) DEFAULT NULL COMMENT '别称',
  `authaccesstoken` varchar(255) DEFAULT NULL COMMENT '认证token（微信第三方平台）',
  `expirestime` int(11) DEFAULT NULL COMMENT '过期时间（微信第三方平台）',
  `headimg` varchar(255) DEFAULT NULL COMMENT '账号头像（微信第三方平台）',
  `oepnscan` varchar(100) DEFAULT NULL COMMENT '极光推送信息',
  `opencard` varchar(100) DEFAULT NULL COMMENT '极光推送信息',
  `openstore` varchar(100) DEFAULT NULL COMMENT '极光推送信息',
  `openpay` varchar(100) DEFAULT NULL COMMENT '极光推送信息',
  `openshake` varchar(100) DEFAULT NULL COMMENT '极光推送信息',
  `qrcode` varchar(100) DEFAULT NULL COMMENT '二维码',
  `refreshtoken` varchar(255) DEFAULT NULL COMMENT '刷新token',
  `verify` varchar(255) DEFAULT NULL COMMENT '验证代码',
  `snsid` varchar(32) NOT NULL COMMENT 'SNSID',
  `agent` tinyint(4) DEFAULT NULL COMMENT '坐席',
  PRIMARY KEY (`ID`) USING BTREE,
  UNIQUE KEY `SQL121227155530370` (`ID`) USING BTREE,
  UNIQUE KEY `snsid` (`snsid`) USING BTREE,
  UNIQUE KEY `snsid_2` (`snsid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='渠道配置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uk_snsaccount`
--

LOCK TABLES `uk_snsaccount` WRITE;
/*!40000 ALTER TABLE `uk_snsaccount` DISABLE KEYS */;
/*!40000 ALTER TABLE `uk_snsaccount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uk_sysdic`
--

DROP TABLE IF EXISTS `uk_sysdic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uk_sysdic` (
  `ID` varchar(32) NOT NULL COMMENT '主键ID',
  `NAME` varchar(100) DEFAULT NULL COMMENT '字典名称',
  `TITLE` varchar(100) DEFAULT NULL COMMENT '标题',
  `CODE` varchar(100) DEFAULT NULL COMMENT '代码',
  `ORGI` varchar(32) DEFAULT NULL COMMENT '租户ID',
  `CTYPE` varchar(32) DEFAULT NULL COMMENT '类型',
  `PARENTID` varchar(32) DEFAULT NULL COMMENT '父级ID',
  `DESCRIPTION` varchar(255) DEFAULT NULL COMMENT '描述',
  `MEMO` varchar(32) DEFAULT NULL COMMENT '备注',
  `ICONSTR` varchar(255) DEFAULT NULL COMMENT '图标',
  `ICONSKIN` varchar(255) DEFAULT NULL COMMENT '自定义样式',
  `CATETYPE` varchar(32) DEFAULT NULL COMMENT '类型',
  `CREATER` varchar(32) DEFAULT NULL COMMENT '创建人',
  `CREATETIME` datetime DEFAULT NULL COMMENT '创建时间',
  `UPDATETIME` datetime DEFAULT NULL COMMENT '更新时间',
  `HASCHILD` tinyint(4) DEFAULT NULL COMMENT '是否有下级',
  `SORTINDEX` int(11) DEFAULT NULL COMMENT '排序',
  `DICID` varchar(32) DEFAULT NULL COMMENT '目录ID',
  `DEFAULTVALUE` tinyint(4) DEFAULT NULL COMMENT '默认值',
  `DISCODE` tinyint(4) DEFAULT NULL COMMENT '编码',
  `URL` text COMMENT '系统权限资源的URL',
  `MODULE` varchar(32) DEFAULT NULL COMMENT '权限资源所属模块',
  `MLEVEL` varchar(32) DEFAULT NULL COMMENT '菜单级别（一级/二级）',
  `RULES` varchar(100) DEFAULT NULL,
  `MENUTYPE` varchar(32) DEFAULT NULL COMMENT '菜单类型（顶部菜单/左侧菜单）',
  PRIMARY KEY (`ID`) USING BTREE,
  UNIQUE KEY `SQL121227155532210` (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='字典表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uk_sysdic`
--

LOCK TABLES `uk_sysdic` WRITE;
/*!40000 ALTER TABLE `uk_sysdic` DISABLE KEYS */;
INSERT INTO `uk_sysdic` VALUES ('402881ef612b1f5b01612cd1a2ce055a','业务流程','pub','A05_A01',NULL,'auth','402881ef612b1f5b01612cc580cc0542',NULL,NULL,'&#x756e646566696e6564;',NULL,NULL,'297e8c7b455798280145579c73e501c1','2018-01-25 18:16:31',NULL,0,0,'402888815d2fe37f015d2fe75cc80002',0,0,'javascript:;','webim','2',NULL,'left'),('402881ef612b1f5b01612cd1fac4055b','流程管理','pub','A05_A01_A01',NULL,'auth','402881ef612b1f5b01612cd1a2ce055a',NULL,NULL,'&#x756e646566696e6564;',NULL,NULL,'297e8c7b455798280145579c73e501c1','2018-01-25 18:16:54',NULL,0,0,'402888815d2fe37f015d2fe75cc80002',0,0,'/apps/bpm/index.html','webim','3',NULL,'left'),('402881ef612b1f5b01612cd22c2c055c','已发布流程','pub','A05_A01_A02',NULL,'auth','402881ef612b1f5b01612cd1a2ce055a',NULL,NULL,'&#x756e646566696e6564;',NULL,NULL,'297e8c7b455798280145579c73e501c1','2018-01-25 18:17:06',NULL,0,0,'402888815d2fe37f015d2fe75cc80002',0,0,'/apps/bpm/process.html','webim','3',NULL,'left'),('402881ef612b1f5b01612cd267fd055d','流程实例','pub','A05_A01_A03',NULL,'auth','402881ef612b1f5b01612cd1a2ce055a',NULL,NULL,'&#x756e646566696e6564;',NULL,NULL,'297e8c7b455798280145579c73e501c1','2018-01-25 18:17:22',NULL,0,0,'402888815d2fe37f015d2fe75cc80002',0,0,'/apps/bpm/instance.html','webim','3',NULL,'left'),('402881ef612b1f5b01612cd2a031055e','工单分类','pub','A05_A01_A04',NULL,'auth','402881ef612b1f5b01612cd1a2ce055a',NULL,NULL,'&#x756e646566696e6564;',NULL,NULL,'297e8c7b455798280145579c73e501c1','2018-01-25 18:17:36',NULL,0,0,'402888815d2fe37f015d2fe75cc80002',0,0,'/apps/workorder/type/index.html','webim','3',NULL,'left'),('402881ef612b1f5b01612cd4c271055f','客服设置','pub','A06_A01',NULL,'auth','402881ef612b1f5b01612cc5a2040543',NULL,NULL,'&#x756e646566696e6564;',NULL,NULL,'297e8c7b455798280145579c73e501c1','2018-01-25 18:19:56',NULL,0,0,'402888815d2fe37f015d2fe75cc80002',0,0,'javascript:;','webim','2',NULL,'left'),('402881ef612b1f5b01612cd4fd8c0560','广告位管理','pub','A06_A02',NULL,'auth','402881ef612b1f5b01612cc5a2040543',NULL,NULL,'&#x756e646566696e6564;',NULL,NULL,'297e8c7b455798280145579c73e501c1','2018-01-25 18:20:11',NULL,0,0,'402888815d2fe37f015d2fe75cc80002',0,0,'javascript:;','webim','2',NULL,'left'),('402881ef612b1f5b01612cd541ff0561','标签管理','pub','A06_A03',NULL,'auth','402881ef612b1f5b01612cc5a2040543',NULL,NULL,'&#x756e646566696e6564;',NULL,NULL,'297e8c7b455798280145579c73e501c1','2018-01-25 18:20:29',NULL,0,0,'402888815d2fe37f015d2fe75cc80002',0,0,'javascript:;','webim','2',NULL,'left'),('402881ef612b1f5b01612cd5a74f0562','对话设置','pub','A06_A01_A01',NULL,'auth','402881ef612b1f5b01612cd4c271055f',NULL,NULL,'&#x756e646566696e6564;',NULL,NULL,'297e8c7b455798280145579c73e501c1','2018-01-25 18:20:54',NULL,0,0,'402888815d2fe37f015d2fe75cc80002',0,0,'/setting/agent/index.html','webim','3',NULL,'left'),('402881ef612b1f5b01612cd5db850563','黑名单','pub','A06_A01_A02',NULL,'auth','402881ef612b1f5b01612cd4c271055f',NULL,NULL,'&#x756e646566696e6564;',NULL,NULL,'297e8c7b455798280145579c73e501c1','2018-01-25 18:21:08',NULL,0,0,'402888815d2fe37f015d2fe75cc80002',0,0,'/setting/blacklist.html','webim','3',NULL,'left'),('402881ef612b1f5b01612cdc778c056d','会话信息','pub','A08_A01',NULL,'auth','402881ef612b1f5b01612cc5d9710545',NULL,NULL,'&#x756e646566696e6564;',NULL,NULL,'297e8c7b455798280145579c73e501c1','2018-01-25 18:28:21',NULL,0,0,'402888815d2fe37f015d2fe75cc80002',0,0,'javascript:;','webim','2',NULL,'left'),('402881ef612b1f5b01612cdca922056e','统计功能','pub','A08_A02',NULL,'auth','402881ef612b1f5b01612cc5d9710545',NULL,NULL,'&#x756e646566696e6564;',NULL,NULL,'297e8c7b455798280145579c73e501c1','2018-01-25 18:28:34',NULL,0,0,'402888815d2fe37f015d2fe75cc80002',0,0,'javascript:;','webim','2',NULL,'left'),('402881ef612b1f5b01612cdce2a4056f','服务小结','pub','A08_A03',NULL,'auth','402881ef612b1f5b01612cc5d9710545',NULL,NULL,'&#x756e646566696e6564;',NULL,NULL,'297e8c7b455798280145579c73e501c1','2018-01-25 18:28:48',NULL,0,0,'402888815d2fe37f015d2fe75cc80002',0,0,'javascript:;','webim','2',NULL,'left'),('402881ef612b1f5b01612cdd1e930570','坐席信息','pub','A08_A04',NULL,'auth','402881ef612b1f5b01612cc5d9710545',NULL,NULL,'&#x756e646566696e6564;',NULL,NULL,'297e8c7b455798280145579c73e501c1','2018-01-25 18:29:04',NULL,0,0,'402888815d2fe37f015d2fe75cc80002',0,0,'javascript:;','webim','2',NULL,'left'),('402881ef612b1f5b01612cddc0920571','历史会话','pub','A08_A01_A01',NULL,'auth','402881ef612b1f5b01612cdc778c056d',NULL,NULL,'&#x756e646566696e6564;',NULL,NULL,'297e8c7b455798280145579c73e501c1','2018-01-25 18:29:45',NULL,0,0,'402888815d2fe37f015d2fe75cc80002',0,0,'/service/history/index.html','webim','3',NULL,'left'),('402881ef612b1f5b01612cde068c0572','当前会话','pub','A08_A01_A02',NULL,'auth','402881ef612b1f5b01612cdc778c056d',NULL,NULL,'&#x756e646566696e6564;',NULL,NULL,'297e8c7b455798280145579c73e501c1','2018-01-25 18:30:03',NULL,0,0,'402888815d2fe37f015d2fe75cc80002',0,0,'/service/current/index.html','webim','3',NULL,'left'),('402881ef612b1f5b01612cde3ca40573','排队队列','pub','A08_A01_A03',NULL,'auth','402881ef612b1f5b01612cdc778c056d',NULL,NULL,'&#x756e646566696e6564;',NULL,NULL,'297e8c7b455798280145579c73e501c1','2018-01-25 18:30:17',NULL,0,0,'402888815d2fe37f015d2fe75cc80002',0,0,'/service/quene/index.html','webim','3',NULL,'left'),('402881ef612b1f5b01612cdeb60b0574','访客留言','pub','A08_A01_A04',NULL,'auth','402881ef612b1f5b01612cdc778c056d',NULL,NULL,'&#x756e646566696e6564;',NULL,NULL,'297e8c7b455798280145579c73e501c1','2018-01-25 18:30:48',NULL,0,0,'402888815d2fe37f015d2fe75cc80002',0,0,'/service/leavemsg/index.html','webim','3',NULL,'left'),('402881ef612b1f5b01612cdf24e10575','满意度评价','pub','A08_A01_A05',NULL,'auth','402881ef612b1f5b01612cdc778c056d',NULL,NULL,'&#x756e646566696e6564;',NULL,NULL,'297e8c7b455798280145579c73e501c1','2018-01-25 18:31:16',NULL,0,0,'402888815d2fe37f015d2fe75cc80002',0,0,'/service/comment/index.html','webim','3',NULL,'left'),('402881ef612b1f5b01612ce748b20577','满意度统计','pub','A08_A02_A01',NULL,'auth','402881ef612b1f5b01612cdca922056e',NULL,NULL,'&#x756e646566696e6564;',NULL,NULL,'297e8c7b455798280145579c73e501c1','2018-01-25 18:40:10',NULL,0,0,'402888815d2fe37f015d2fe75cc80002',0,0,'/service/stats/coment.html','webim','3',NULL,'left'),('402881ef612b1f5b01612ce774fe0579','客服坐席','pub','A08_A02_A02',NULL,'auth','402881ef612b1f5b01612cdca922056e',NULL,NULL,'&#x756e646566696e6564;',NULL,NULL,'297e8c7b455798280145579c73e501c1','2018-01-25 18:40:21',NULL,0,0,'402888815d2fe37f015d2fe75cc80002',0,0,'/service/stats/agent.html','webim','3',NULL,'left'),('402881ef612b1f5b01612ce7ca6a057a','多媒体客服','pub','A08_A03_A01',NULL,'auth','402881ef612b1f5b01612cdce2a4056f',NULL,NULL,'&#x756e646566696e6564;',NULL,NULL,'297e8c7b455798280145579c73e501c1','2018-01-25 18:40:43',NULL,0,0,'402888815d2fe37f015d2fe75cc80002',0,0,'/apps/agent/summary/index.html','webim','3',NULL,'left'),('402881ef612b1f5b01612ce7fb2d057b','已处理多媒体客服','pub','A08_A03_A02',NULL,'auth','402881ef612b1f5b01612cdce2a4056f',NULL,NULL,'&#x756e646566696e6564;',NULL,NULL,'297e8c7b455798280145579c73e501c1','2018-01-25 18:40:56',NULL,0,0,'402888815d2fe37f015d2fe75cc80002',0,0,'/apps/agent/processed/index.html','webim','3',NULL,'left'),('402881ef612b1f5b01612ce85460057c','呼叫中心','pub','A08_A03_A03',NULL,'auth','402881ef612b1f5b01612cdce2a4056f',NULL,NULL,'&#x756e646566696e6564;',NULL,NULL,'297e8c7b455798280145579c73e501c1','2018-01-25 18:41:18',NULL,0,0,'402888815d2fe37f015d2fe75cc80002',0,0,'/apps/callcenter/summary/index.html','webim','3',NULL,'left'),('402881ef612b1f5b01612ce88154057d','已处理呼叫中心','pub','A08_A03_A04',NULL,'auth','402881ef612b1f5b01612cdce2a4056f',NULL,NULL,'&#x756e646566696e6564;',NULL,NULL,'297e8c7b455798280145579c73e501c1','2018-01-25 18:41:30',NULL,0,0,'402888815d2fe37f015d2fe75cc80002',0,0,'/apps/callcenter/processed/index.html','webim','3',NULL,'left'),('402881ef612b1f5b01612ce8b990057e','在线坐席','pub','A08_A04_A01',NULL,'auth','402881ef612b1f5b01612cdd1e930570',NULL,NULL,'&#x756e646566696e6564;',NULL,NULL,'297e8c7b455798280145579c73e501c1','2018-01-25 18:41:44',NULL,0,0,'402888815d2fe37f015d2fe75cc80002',0,0,'/service/agent/index.html','webim','3',NULL,'left'),('402881ef612b1f5b01612ce8e6a2057f','全部坐席','pub','A08_A04_A02',NULL,'auth','402881ef612b1f5b01612cdd1e930570',NULL,NULL,'&#x756e646566696e6564;',NULL,NULL,'297e8c7b455798280145579c73e501c1','2018-01-25 18:41:56',NULL,0,0,'402888815d2fe37f015d2fe75cc80002',0,0,'/service/user/index.html','webim','3',NULL,'left'),('402881ef612b1f5b01612cee4fbb058a','通话信息','pub','A10_A01',NULL,'auth','402881ef612b1f5b01612cc626f90547',NULL,NULL,'&#x756e646566696e6564;',NULL,NULL,'297e8c7b455798280145579c73e501c1','2018-01-25 18:47:50',NULL,0,0,'402888815d2fe37f015d2fe75cc80002',0,0,'javascript:;','webim','2',NULL,'left'),('402881ef612b1f5b01612cee80ed058b','坐席信息','pub','A10_A02',NULL,'auth','402881ef612b1f5b01612cc626f90547',NULL,NULL,'&#x756e646566696e6564;',NULL,NULL,'297e8c7b455798280145579c73e501c1','2018-01-25 18:48:03',NULL,0,0,'402888815d2fe37f015d2fe75cc80002',0,0,'javascript:;','webim','2',NULL,'left'),('402881ef612b1f5b01612ceeca0c058c','历史通话','pub','A10_A01_A01',NULL,'auth','402881ef612b1f5b01612cee4fbb058a',NULL,NULL,'&#x756e646566696e6564;',NULL,NULL,'297e8c7b455798280145579c73e501c1','2018-01-25 18:48:22',NULL,0,0,'402888815d2fe37f015d2fe75cc80002',0,0,'/apps/callcenter/service/index.html','webim','3',NULL,'left'),('402881ef612b1f5b01612ceef6c4058d','当前通话','pub','A10_A01_A02',NULL,'auth','402881ef612b1f5b01612cee4fbb058a',NULL,NULL,'&#x756e646566696e6564;',NULL,NULL,'297e8c7b455798280145579c73e501c1','2018-01-25 18:48:33',NULL,0,0,'402888815d2fe37f015d2fe75cc80002',0,0,'/apps/callcenter/current/index.html','webim','3',NULL,'left'),('402881ef612b1f5b01612cef4503058e','排队队列','pub','A10_A01_A03',NULL,'auth','402881ef612b1f5b01612cee4fbb058a',NULL,NULL,'&#x756e646566696e6564;',NULL,NULL,'297e8c7b455798280145579c73e501c1','2018-01-25 18:48:53',NULL,0,0,'402888815d2fe37f015d2fe75cc80002',0,0,'/apps/callcenter/quene/index.html','webim','3',NULL,'left'),('402881ef612b1f5b01612cef8453058f','录音管理','pub','A10_A01_A04',NULL,'auth','402881ef612b1f5b01612cee4fbb058a',NULL,NULL,'&#x756e646566696e6564;',NULL,NULL,'297e8c7b455798280145579c73e501c1','2018-01-25 18:49:09',NULL,0,0,'402888815d2fe37f015d2fe75cc80002',0,0,'/apps/callcenter/record/index.html','webim','3',NULL,'left'),('402881ef612b1f5b01612cefb4120590','语音留言','pub','A10_A01_A05',NULL,'auth','402881ef612b1f5b01612cee4fbb058a',NULL,NULL,'&#x756e646566696e6564;',NULL,NULL,'297e8c7b455798280145579c73e501c1','2018-01-25 18:49:22',NULL,0,0,'402888815d2fe37f015d2fe75cc80002',0,0,'/apps/callcenter/voicemail/index.html','webim','3',NULL,'left'),('402881ef612b1f5b01612ceffa060591','漏话列表','pub','A10_A01_A06',NULL,'auth','402881ef612b1f5b01612cee4fbb058a',NULL,NULL,'&#x756e646566696e6564;',NULL,NULL,'297e8c7b455798280145579c73e501c1','2018-01-25 18:49:40',NULL,0,0,'402888815d2fe37f015d2fe75cc80002',0,0,'/apps/callcenter/misscall/index.html','webim','3',NULL,'left'),('402881ef612b1f5b01612cf03d740592','在线坐席','pub','A10_A02_A01',NULL,'auth','402881ef612b1f5b01612cee80ed058b',NULL,NULL,'&#x756e646566696e6564;',NULL,NULL,'297e8c7b455798280145579c73e501c1','2018-01-25 18:49:57',NULL,0,0,'402888815d2fe37f015d2fe75cc80002',0,0,'/apps/callcenter/online/index.html','webim','3',NULL,'left'),('402881ef612b1f5b01612cf065f40593','全部坐席','pub','A10_A02_A02',NULL,'auth','402881ef612b1f5b01612cee80ed058b',NULL,NULL,'&#x756e646566696e6564;',NULL,NULL,'297e8c7b455798280145579c73e501c1','2018-01-25 18:50:07',NULL,0,0,'402888815d2fe37f015d2fe75cc80002',0,0,'/apps/callcenter/agents/index.html','webim','3',NULL,'left'),('402881ef612b1f5b01612cf147810595','系统管理','pub','B02',NULL,'auth','402888815d2fe37f015d2fe75cc80002',NULL,NULL,'<i class=\"layui-icon\" style=\"position: relative;\">&#xe631;</i>',NULL,NULL,'297e8c7b455798280145579c73e501c1','2018-01-25 18:51:05',NULL,0,0,'402888815d2fe37f015d2fe75cc80002',0,0,'/admin/content.html','webim','1',NULL,'left'),('402881fb61e49a9a0161e4a8a1260392','过滤器类型','pub','com.dic.filter.modeltype',NULL,'data','0','',NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-02 11:01:52',NULL,1,0,NULL,0,0,NULL,NULL,NULL,NULL,NULL),('402881fb61e49a9a0161e4a925a20393','过滤器取值方式','pub','com.dic.filter.convalue',NULL,'data','0','',NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-02 11:02:25',NULL,1,0,NULL,0,0,NULL,NULL,NULL,NULL,NULL),('402881fb61e49a9a0161e4a96f900394','过滤器条件类型','pub','com.dic.filter.valuefiltertype',NULL,'data','0','',NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-02 11:02:44',NULL,1,0,NULL,0,0,NULL,NULL,NULL,NULL,NULL),('402881fb61e49a9a0161e4a9b6f80395','过滤器比较放松','pub','com.dic.filter.comparetype',NULL,'data','0','',NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-02 11:03:03',NULL,1,0,NULL,0,0,NULL,NULL,NULL,NULL,NULL),('402881fb61e49a9a0161e4abe5630396','文本框','pub','text','cskefu','layui-icon','402881fb61e49a9a0161e4a8a1260392','',NULL,'','',NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-02 11:05:26','2018-03-02 11:05:26',0,1,'402881fb61e49a9a0161e4a8a1260392',0,1,NULL,NULL,NULL,NULL,NULL),('402881fb61e49a9a0161e4abe56f0397','日历','pub','date','cskefu','layui-icon','402881fb61e49a9a0161e4a8a1260392','',NULL,'','',NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-02 11:05:26','2018-03-02 11:05:26',0,2,'402881fb61e49a9a0161e4a8a1260392',0,1,NULL,NULL,NULL,NULL,NULL),('402881fb61e49a9a0161e4abe57c0398','单选下拉列表','pub','sigsel','cskefu','layui-icon','402881fb61e49a9a0161e4a8a1260392','',NULL,'','',NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-02 11:05:26','2018-03-02 11:05:26',0,3,'402881fb61e49a9a0161e4a8a1260392',0,1,NULL,NULL,NULL,NULL,NULL),('402881fb61e49a9a0161e4ac69b10399','用户输入','pub','input','cskefu','layui-icon','402881fb61e49a9a0161e4a925a20393','',NULL,'','',NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-02 11:05:59','2018-03-02 11:05:59',0,1,'402881fb61e49a9a0161e4a925a20393',0,1,NULL,NULL,NULL,NULL,NULL),('402881fb61e49a9a0161e4ac69be039a','自动获取','pub','auto','cskefu','layui-icon','402881fb61e49a9a0161e4a925a20393','',NULL,'','',NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-02 11:05:59','2018-03-02 11:05:59',0,2,'402881fb61e49a9a0161e4a925a20393',0,1,NULL,NULL,NULL,NULL,NULL),('402881fb61e49a9a0161e4ace76a039b','比较','pub','compare','cskefu','layui-icon','402881fb61e49a9a0161e4a96f900394','',NULL,'','',NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-02 11:06:32','2018-03-02 11:06:32',0,1,'402881fb61e49a9a0161e4a96f900394',0,1,NULL,NULL,NULL,NULL,NULL),('402881fb61e49a9a0161e4ace777039c','范围','pub','range','cskefu','layui-icon','402881fb61e49a9a0161e4a96f900394','',NULL,'','',NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-02 11:06:32','2018-03-02 11:06:32',0,2,'402881fb61e49a9a0161e4a96f900394',0,1,NULL,NULL,NULL,NULL,NULL),('402881fb61e49a9a0161e4ad727d039d','相等（IN）','pub','equal','cskefu','layui-icon','402881fb61e49a9a0161e4a9b6f80395','',NULL,'','',NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-02 11:07:07','2018-03-02 11:07:07',0,1,'402881fb61e49a9a0161e4a9b6f80395',0,1,NULL,NULL,NULL,NULL,NULL),('402881fb61e49a9a0161e4ade5d6039e','不等（NOT IN）','pub','not','cskefu','layui-icon','402881fb61e49a9a0161e4a9b6f80395','',NULL,'','',NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-02 11:07:37',NULL,1,0,'402881fb61e49a9a0161e4a9b6f80395',0,1,NULL,NULL,NULL,NULL,NULL),('402881fb621cfbce01621d07bade03cd','快捷回复分类','pub','quicktypedata','cskefu','layui-icon','402888815e097729015e0999f26e0002','',NULL,'','',NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-13 09:44:28',NULL,1,0,'402888815e097729015e0999f26e0002',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb621cfbce01621d1b9eb003cf','单位性质','pub','com.dic.customer.etype','cskefu','data','0','',NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-13 10:06:12',NULL,1,0,NULL,0,0,NULL,NULL,NULL,NULL,NULL),('402881fb621cfbce01621d1c25c703d0','企业客户','pub','enterprise','cskefu','layui-icon','402881fb621cfbce01621d1b9eb003cf','',NULL,'','',NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-13 10:06:46','2018-03-13 10:06:46',0,1,'402881fb621cfbce01621d1b9eb003cf',0,1,NULL,NULL,NULL,NULL,NULL),('402881fb621cfbce01621d1c25d603d1','个人客户','pub','personal','cskefu','layui-icon','402881fb621cfbce01621d1b9eb003cf','',NULL,'','',NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-13 10:06:46','2018-03-13 10:06:46',0,2,'402881fb621cfbce01621d1b9eb003cf',0,1,NULL,NULL,NULL,NULL,NULL),('402881fb621d3ffc01621d6755fd03d5','是否','pub','com.dic.yesorno',NULL,'data','0','',NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-13 11:28:54',NULL,1,0,NULL,0,0,NULL,NULL,NULL,NULL,NULL),('402881fb621d3ffc01621d6793b203d6','是','pub','1','cskefu','layui-icon','402881fb621d3ffc01621d6755fd03d5','',NULL,'','',NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-13 11:29:10',NULL,1,0,'402881fb621d3ffc01621d6755fd03d5',0,1,NULL,NULL,NULL,NULL,NULL),('402881fb621d3ffc01621d67ab3903d7','否','pub','0','cskefu','layui-icon','402881fb621d3ffc01621d6755fd03d5','',NULL,'','',NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-13 11:29:16',NULL,1,0,'402881fb621d3ffc01621d6755fd03d5',0,1,NULL,NULL,NULL,NULL,NULL),('402881fb624b78cd01624b7bd7fe0380','订单状态','pub','com.dic.ticket.orderstatus',NULL,'data','0','',NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-22 10:13:50',NULL,1,0,NULL,0,0,NULL,NULL,NULL,NULL,NULL),('402881fb624b78cd01624b7d4b600381','预约未付费','pub','U','cskefu',NULL,'402881fb624b78cd01624b7bd7fe0380',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-22 10:15:25','2018-03-22 10:15:25',0,1,'402881fb624b78cd01624b7bd7fe0380',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb624b78cd01624b7d4b6f0382','预约已取消','pub','R','cskefu',NULL,'402881fb624b78cd01624b7bd7fe0380',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-22 10:15:25','2018-03-22 10:15:25',0,2,'402881fb624b78cd01624b7bd7fe0380',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb624b78cd01624b7d4b7a0383','已付费处理中','pub','P','cskefu',NULL,'402881fb624b78cd01624b7bd7fe0380',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-22 10:15:25','2018-03-22 10:15:25',0,3,'402881fb624b78cd01624b7bd7fe0380',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb624b78cd01624b7d4b890384','退费成功（含撤消成功）','pub','T','cskefu',NULL,'402881fb624b78cd01624b7bd7fe0380',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-22 10:15:25','2018-03-22 10:15:25',0,4,'402881fb624b78cd01624b7bd7fe0380',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb624b78cd01624b7d4b9b0385','申请退费（含撤消申请）','pub','W','cskefu',NULL,'402881fb624b78cd01624b7bd7fe0380',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-22 10:15:25','2018-03-22 10:15:25',0,5,'402881fb624b78cd01624b7bd7fe0380',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb624b78cd01624b7d4bad0386','成功处理','pub','S','cskefu',NULL,'402881fb624b78cd01624b7bd7fe0380',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-22 10:15:25','2018-03-22 10:15:25',0,6,'402881fb624b78cd01624b7bd7fe0380',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb624b78cd01624b7d4bbc0387','挂号已取号（线下状态）','pub','G','cskefu',NULL,'402881fb624b78cd01624b7bd7fe0380',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-22 10:15:25','2018-03-22 10:15:25',0,7,'402881fb624b78cd01624b7bd7fe0380',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb624c612401624c6fb495043d','工单问题类别','pub','com.dic.workorders.category',NULL,'data','0','',NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-22 14:40:11',NULL,1,0,NULL,0,0,NULL,NULL,NULL,NULL,NULL),('402881fb624c612401624c70fdea043e','畜牧类','pub','a','cskefu','layui-icon','402881fb624c612401624c6fb495043d','',NULL,'','',NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-22 14:41:36',NULL,1,0,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb624c612401624c7125d0043f','猪','pub','a1','cskefu','layui-icon','402881fb624c612401624c70fdea043e','',NULL,'','',NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-22 14:41:46',NULL,1,0,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251a290016251a53aa1051a','蔬菜类','pub','b','cskefu',NULL,'402881fb624c612401624c6fb495043d',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 14:56:45','2018-03-23 14:56:45',0,2,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251a290016251a53ac0051b','大田类','pub','c','cskefu',NULL,'402881fb624c612401624c6fb495043d',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 14:56:45','2018-03-23 14:56:45',0,3,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251a290016251a53ad9051c','生产类','pub','d','cskefu',NULL,'402881fb624c612401624c6fb495043d',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 14:56:45','2018-03-23 14:56:45',0,4,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251a290016251a53af4051d','政策类','pub','e','cskefu',NULL,'402881fb624c612401624c6fb495043d',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 14:56:45','2018-03-23 14:56:45',0,5,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251a290016251a53b0f051e','气象类','pub','f','cskefu',NULL,'402881fb624c612401624c6fb495043d',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 14:56:45','2018-03-23 14:56:45',0,6,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251a290016251a53b2b051f','采集员','pub','g','cskefu',NULL,'402881fb624c612401624c6fb495043d',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 14:56:45','2018-03-23 14:56:45',0,7,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251a290016251a53b440520','其他类','pub','h','cskefu',NULL,'402881fb624c612401624c6fb495043d',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 14:56:45','2018-03-23 14:56:45',0,8,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251a290016251a63bfd0521','牛','pub','a2','cskefu',NULL,'402881fb624c612401624c70fdea043e',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 14:57:51','2018-03-23 14:57:51',0,2,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251a290016251a63c0b0522','羊','pub','a3','cskefu',NULL,'402881fb624c612401624c70fdea043e',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 14:57:51','2018-03-23 14:57:51',0,3,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251a290016251a63c190523','鹅','pub','a4','cskefu',NULL,'402881fb624c612401624c70fdea043e',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 14:57:51','2018-03-23 14:57:51',0,4,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251a290016251a63c2e0524','兔','pub','a5','cskefu',NULL,'402881fb624c612401624c70fdea043e',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 14:57:51','2018-03-23 14:57:51',0,5,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251a290016251a63c3b0525','鸭','pub','a6','cskefu',NULL,'402881fb624c612401624c70fdea043e',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 14:57:51','2018-03-23 14:57:51',0,6,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251a290016251a63c470526','鸽子','pub','a7','cskefu',NULL,'402881fb624c612401624c70fdea043e',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 14:57:51','2018-03-23 14:57:51',0,7,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251a290016251a63c550527','毛皮动物','pub','a8','cskefu',NULL,'402881fb624c612401624c70fdea043e',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 14:57:51','2018-03-23 14:57:51',0,8,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251a290016251a63c620528','狗','pub','a9','cskefu',NULL,'402881fb624c612401624c70fdea043e',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 14:57:51','2018-03-23 14:57:51',0,9,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251a290016251a63c6d0529','鹿','pub','a10','cskefu',NULL,'402881fb624c612401624c70fdea043e',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 14:57:51','2018-03-23 14:57:51',0,10,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251a290016251a63c79052a','水产','pub','a11','cskefu',NULL,'402881fb624c612401624c70fdea043e',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 14:57:51','2018-03-23 14:57:51',0,11,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251a290016251a63c87052b','饲料','pub','a12','cskefu',NULL,'402881fb624c612401624c70fdea043e',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 14:57:51','2018-03-23 14:57:51',0,12,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251a290016251a63c93052c','马','pub','a13','cskefu',NULL,'402881fb624c612401624c70fdea043e',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 14:57:51','2018-03-23 14:57:51',0,13,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251a290016251a63c9f052d','蛋鸡','pub','a14','cskefu',NULL,'402881fb624c612401624c70fdea043e',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 14:57:51','2018-03-23 14:57:51',0,14,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251a290016251a63caa052e','淘汰鸡','pub','a15','cskefu',NULL,'402881fb624c612401624c70fdea043e',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 14:57:51','2018-03-23 14:57:51',0,15,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251a290016251a63cb6052f','肉鸡','pub','a16','cskefu',NULL,'402881fb624c612401624c70fdea043e',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 14:57:51','2018-03-23 14:57:51',0,16,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251a290016251a63cc30530','其他','pub','a17','cskefu',NULL,'402881fb624c612401624c70fdea043e',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 14:57:51','2018-03-23 14:57:51',0,17,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251a290016251a63cd00531','鸡蛋','pub','a18','cskefu',NULL,'402881fb624c612401624c70fdea043e',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 14:57:51','2018-03-23 14:57:51',0,18,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016251f8f96e0351','市场行情','pub','a11','cskefu',NULL,'402881fb624c612401624c7125d0043f',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 16:28:14','2018-03-23 16:28:14',0,1,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016251f8f9860352','疾病疫情','pub','a12','cskefu',NULL,'402881fb624c612401624c7125d0043f',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 16:28:14','2018-03-23 16:28:14',0,2,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016251f8f9a00353','饲养技术','pub','a13','cskefu',NULL,'402881fb624c612401624c7125d0043f',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 16:28:14','2018-03-23 16:28:14',0,3,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016251f8f9b80354','其他','pub','a14','cskefu',NULL,'402881fb624c612401624c7125d0043f',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 16:28:14','2018-03-23 16:28:14',0,4,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016251f92ed30355','市场行情','pub','a21','cskefu',NULL,'402881fb6251a290016251a63bfd0521',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 16:28:27','2018-03-23 16:28:27',0,1,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016251f92ef00356','疾病疫情','pub','a22','cskefu',NULL,'402881fb6251a290016251a63bfd0521',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 16:28:27','2018-03-23 16:28:27',0,2,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016251f92f080357','饲养技术','pub','a23','cskefu',NULL,'402881fb6251a290016251a63bfd0521',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 16:28:27','2018-03-23 16:28:27',0,3,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016251f92f210358','其他','pub','a24','cskefu',NULL,'402881fb6251a290016251a63bfd0521',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 16:28:27','2018-03-23 16:28:27',0,4,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016251f9b2000359','市场行情','pub','a31','cskefu',NULL,'402881fb6251a290016251a63c0b0522',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 16:29:01','2018-03-23 16:29:01',0,1,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016251f9b219035a','疾病疫情','pub','a32','cskefu',NULL,'402881fb6251a290016251a63c0b0522',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 16:29:01','2018-03-23 16:29:01',0,2,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016251f9b237035b','饲养技术','pub','a33','cskefu',NULL,'402881fb6251a290016251a63c0b0522',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 16:29:01','2018-03-23 16:29:01',0,3,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016251f9b253035c','其他','pub','a34','cskefu',NULL,'402881fb6251a290016251a63c0b0522',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 16:29:01','2018-03-23 16:29:01',0,4,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016251fa367c035d','市场行情','pub','a41','cskefu','layui-icon','402881fb6251a290016251a63c190523','',NULL,'','',NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 16:29:35','2018-03-23 16:29:35',0,1,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016251fa3698035e','疾病疫情','pub','a42','cskefu','layui-icon','402881fb6251a290016251a63c190523','',NULL,'','',NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 16:29:35','2018-03-23 16:29:35',0,2,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016251fa36af035f','饲养技术','pub','a43','cskefu','layui-icon','402881fb6251a290016251a63c190523','',NULL,'','',NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 16:29:35','2018-03-23 16:29:35',0,3,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016251fa36c80360','其他','pub','a44','cskefu','layui-icon','402881fb6251a290016251a63c190523','',NULL,'','',NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 16:29:35','2018-03-23 16:29:35',0,4,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016251fae0a10361','市场行情','pub','a51','cskefu',NULL,'402881fb6251a290016251a63c2e0524',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 16:30:18','2018-03-23 16:30:18',0,1,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016251fae0bc0362','疾病疫情','pub','a52','cskefu',NULL,'402881fb6251a290016251a63c2e0524',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 16:30:18','2018-03-23 16:30:18',0,2,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016251fae0d50363','饲养技术','pub','a53','cskefu',NULL,'402881fb6251a290016251a63c2e0524',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 16:30:18','2018-03-23 16:30:18',0,3,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016251fae0ec0364','其他','pub','a54','cskefu',NULL,'402881fb6251a290016251a63c2e0524',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 16:30:18','2018-03-23 16:30:18',0,4,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016251fb24be0367','市场行情','pub','a61','cskefu',NULL,'402881fb6251a290016251a63c3b0525',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 16:30:36','2018-03-23 16:30:36',0,1,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016251fb24db0368','疾病疫情','pub','a62','cskefu',NULL,'402881fb6251a290016251a63c3b0525',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 16:30:36','2018-03-23 16:30:36',0,2,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016251fb24f80369','饲养技术','pub','a63','cskefu',NULL,'402881fb6251a290016251a63c3b0525',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 16:30:36','2018-03-23 16:30:36',0,3,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016251fb2516036a','其他','pub','a64','cskefu',NULL,'402881fb6251a290016251a63c3b0525',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 16:30:36','2018-03-23 16:30:36',0,4,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016251fb49c0036b','市场行情','pub','a71','cskefu',NULL,'402881fb6251a290016251a63c470526',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 16:30:45','2018-03-23 16:30:45',0,1,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016251fb49db036c','疾病疫情','pub','a72','cskefu',NULL,'402881fb6251a290016251a63c470526',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 16:30:45','2018-03-23 16:30:45',0,2,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016251fb49f3036d','饲养技术','pub','a73','cskefu',NULL,'402881fb6251a290016251a63c470526',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 16:30:45','2018-03-23 16:30:45',0,3,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016251fb4a0d036e','其他','pub','a74','cskefu',NULL,'402881fb6251a290016251a63c470526',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 16:30:45','2018-03-23 16:30:45',0,4,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016251fb7acd036f','市场行情','pub','a81','cskefu',NULL,'402881fb6251a290016251a63c550527',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 16:30:58','2018-03-23 16:30:58',0,1,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016251fb7aea0370','疾病疫情','pub','a82','cskefu',NULL,'402881fb6251a290016251a63c550527',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 16:30:58','2018-03-23 16:30:58',0,2,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016251fb7b030371','饲养技术','pub','a83','cskefu',NULL,'402881fb6251a290016251a63c550527',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 16:30:58','2018-03-23 16:30:58',0,3,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016251fb7b190372','其他','pub','a84','cskefu',NULL,'402881fb6251a290016251a63c550527',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 16:30:58','2018-03-23 16:30:58',0,4,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016251fb9fe20373','市场行情','pub','a91','cskefu',NULL,'402881fb6251a290016251a63c620528',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 16:31:07','2018-03-23 16:31:07',0,1,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016251fb9fff0374','疾病疫情','pub','a92','cskefu',NULL,'402881fb6251a290016251a63c620528',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 16:31:07','2018-03-23 16:31:07',0,2,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016251fba01a0375','饲养技术','pub','a93','cskefu',NULL,'402881fb6251a290016251a63c620528',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 16:31:07','2018-03-23 16:31:07',0,3,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016251fba0350376','其他','pub','a94','cskefu',NULL,'402881fb6251a290016251a63c620528',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 16:31:07','2018-03-23 16:31:07',0,4,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016251fbd1c60377','市场行情','pub','a101','cskefu',NULL,'402881fb6251a290016251a63c6d0529',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 16:31:20','2018-03-23 16:31:20',0,1,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016251fbd1df0378','疾病疫情','pub','a102','cskefu',NULL,'402881fb6251a290016251a63c6d0529',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 16:31:20','2018-03-23 16:31:20',0,2,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016251fbd1f80379','饲养技术','pub','a103','cskefu',NULL,'402881fb6251a290016251a63c6d0529',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 16:31:20','2018-03-23 16:31:20',0,3,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016251fbd211037a','其他','pub','a104','cskefu',NULL,'402881fb6251a290016251a63c6d0529',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 16:31:20','2018-03-23 16:31:20',0,4,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016251fc256f037b','市场行情','pub','a111','cskefu',NULL,'402881fb6251a290016251a63c79052a',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 16:31:41','2018-03-23 16:31:41',0,1,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016251fc2589037c','疾病疫情','pub','a112','cskefu',NULL,'402881fb6251a290016251a63c79052a',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 16:31:41','2018-03-23 16:31:41',0,2,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016251fc25a2037d','饲养技术','pub','a113','cskefu',NULL,'402881fb6251a290016251a63c79052a',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 16:31:41','2018-03-23 16:31:41',0,3,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016251fc25ba037e','其他','pub','a114','cskefu',NULL,'402881fb6251a290016251a63c79052a',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 16:31:42','2018-03-23 16:31:42',0,4,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016251fc4168037f','市场行情','pub','a121','cskefu',NULL,'402881fb6251a290016251a63c87052b',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 16:31:49','2018-03-23 16:31:49',0,1,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016251fc41830380','疾病疫情','pub','a122','cskefu',NULL,'402881fb6251a290016251a63c87052b',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 16:31:49','2018-03-23 16:31:49',0,2,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016251fc419f0381','饲养技术','pub','a123','cskefu',NULL,'402881fb6251a290016251a63c87052b',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 16:31:49','2018-03-23 16:31:49',0,3,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016251fc41b90382','其他','pub','a124','cskefu',NULL,'402881fb6251a290016251a63c87052b',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 16:31:49','2018-03-23 16:31:49',0,4,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016251fc683e0383','市场行情','pub','a131','cskefu',NULL,'402881fb6251a290016251a63c93052c',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 16:31:59','2018-03-23 16:31:59',0,1,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016251fc68570384','疾病疫情','pub','a132','cskefu',NULL,'402881fb6251a290016251a63c93052c',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 16:31:59','2018-03-23 16:31:59',0,2,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016251fc686f0385','饲养技术','pub','a133','cskefu',NULL,'402881fb6251a290016251a63c93052c',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 16:31:59','2018-03-23 16:31:59',0,3,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016251fc68810386','其他','pub','a134','cskefu',NULL,'402881fb6251a290016251a63c93052c',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 16:31:59','2018-03-23 16:31:59',0,4,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016251fc95d20387','市场行情','pub','a141','cskefu',NULL,'402881fb6251a290016251a63c9f052d',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 16:32:10','2018-03-23 16:32:10',0,1,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016251fc95ee0388','疾病疫情','pub','a142','cskefu',NULL,'402881fb6251a290016251a63c9f052d',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 16:32:10','2018-03-23 16:32:10',0,2,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016251fc96080389','饲养技术','pub','a143','cskefu',NULL,'402881fb6251a290016251a63c9f052d',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 16:32:10','2018-03-23 16:32:10',0,3,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016251fc9621038a','其他','pub','a144','cskefu',NULL,'402881fb6251a290016251a63c9f052d',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 16:32:10','2018-03-23 16:32:10',0,4,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016251fcbddb038b','市场行情','pub','a151','cskefu',NULL,'402881fb6251a290016251a63caa052e',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 16:32:20','2018-03-23 16:32:20',0,1,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016251fcbdf4038c','疾病疫情','pub','a152','cskefu',NULL,'402881fb6251a290016251a63caa052e',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 16:32:20','2018-03-23 16:32:20',0,2,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016251fcbe0e038d','饲养技术','pub','a153','cskefu',NULL,'402881fb6251a290016251a63caa052e',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 16:32:20','2018-03-23 16:32:20',0,3,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016251fcbe26038e','其他','pub','a154','cskefu',NULL,'402881fb6251a290016251a63caa052e',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 16:32:21','2018-03-23 16:32:21',0,4,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016251fcf7d2038f','市场行情','pub','a161','cskefu',NULL,'402881fb6251a290016251a63cb6052f',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 16:32:35','2018-03-23 16:32:35',0,1,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016251fcf7ec0390','疾病疫情','pub','a162','cskefu',NULL,'402881fb6251a290016251a63cb6052f',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 16:32:35','2018-03-23 16:32:35',0,2,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016251fcf8060391','饲养技术','pub','a163','cskefu',NULL,'402881fb6251a290016251a63cb6052f',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 16:32:35','2018-03-23 16:32:35',0,3,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016251fcf81f0392','其他','pub','a164','cskefu',NULL,'402881fb6251a290016251a63cb6052f',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 16:32:35','2018-03-23 16:32:35',0,4,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016251fd1fcc0393','市场行情','pub','a171','cskefu',NULL,'402881fb6251a290016251a63cc30530',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 16:32:46','2018-03-23 16:32:46',0,1,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016251fd1ff90394','疾病疫情','pub','a172','cskefu',NULL,'402881fb6251a290016251a63cc30530',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 16:32:46','2018-03-23 16:32:46',0,2,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016251fd20150395','饲养技术','pub','a173','cskefu',NULL,'402881fb6251a290016251a63cc30530',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 16:32:46','2018-03-23 16:32:46',0,3,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016251fd203a0396','其他','pub','a174','cskefu',NULL,'402881fb6251a290016251a63cc30530',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 16:32:46','2018-03-23 16:32:46',0,4,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016251fd505f0397','市场行情','pub','a181','cskefu',NULL,'402881fb6251a290016251a63cd00531',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 16:32:58','2018-03-23 16:32:58',0,1,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016251fd507c0398','疾病疫情','pub','a182','cskefu',NULL,'402881fb6251a290016251a63cd00531',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 16:32:58','2018-03-23 16:32:58',0,2,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016251fd50920399','饲养技术','pub','a183','cskefu',NULL,'402881fb6251a290016251a63cd00531',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 16:32:58','2018-03-23 16:32:58',0,3,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016251fd50aa039a','其他','pub','a184','cskefu',NULL,'402881fb6251a290016251a63cd00531',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 16:32:58','2018-03-23 16:32:58',0,4,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016251fe9bf6039b','蔬菜','pub','b1','cskefu',NULL,'402881fb6251a290016251a53aa1051a',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 16:34:23','2018-03-23 16:34:23',0,1,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016251fe9c15039c','果树','pub','b2','cskefu',NULL,'402881fb6251a290016251a53aa1051a',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 16:34:23','2018-03-23 16:34:23',0,2,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016251fe9c2e039d','园林花卉','pub','b3','cskefu',NULL,'402881fb6251a290016251a53aa1051a',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 16:34:23','2018-03-23 16:34:23',0,3,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016251fe9c46039e','食用菌','pub','b4','cskefu',NULL,'402881fb6251a290016251a53aa1051a',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 16:34:23','2018-03-23 16:34:23',0,4,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016251fe9c5d039f','中药材','pub','b5','cskefu',NULL,'402881fb6251a290016251a53aa1051a',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 16:34:23','2018-03-23 16:34:23',0,5,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016251fe9c7503a0','山野菜','pub','b6','cskefu',NULL,'402881fb6251a290016251a53aa1051a',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 16:34:23','2018-03-23 16:34:23',0,6,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016251fe9c9003a1','黄瓜','pub','b7','cskefu',NULL,'402881fb6251a290016251a53aa1051a',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 16:34:23','2018-03-23 16:34:23',0,7,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016251fe9caa03a2','番茄','pub','b8','cskefu',NULL,'402881fb6251a290016251a53aa1051a',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 16:34:23','2018-03-23 16:34:23',0,8,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016251fe9cc203a3','西甜瓜','pub','b9','cskefu',NULL,'402881fb6251a290016251a53aa1051a',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 16:34:23','2018-03-23 16:34:23',0,9,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016251fe9cd803a4','茄子','pub','b10','cskefu',NULL,'402881fb6251a290016251a53aa1051a',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 16:34:23','2018-03-23 16:34:23',0,10,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016251fe9cef03a5','三辣','pub','b11','cskefu',NULL,'402881fb6251a290016251a53aa1051a',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 16:34:23','2018-03-23 16:34:23',0,11,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016251fe9d0603a6','马铃薯','pub','b12','cskefu',NULL,'402881fb6251a290016251a53aa1051a',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 16:34:23','2018-03-23 16:34:23',0,12,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016251fe9d1b03a7','白菜','pub','b13','cskefu',NULL,'402881fb6251a290016251a53aa1051a',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 16:34:23','2018-03-23 16:34:23',0,13,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016251fe9d3103a8','豆角','pub','b14','cskefu',NULL,'402881fb6251a290016251a53aa1051a',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 16:34:23','2018-03-23 16:34:23',0,14,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016251fe9d4a03a9','毛葱','pub','b15','cskefu',NULL,'402881fb6251a290016251a53aa1051a',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 16:34:23','2018-03-23 16:34:23',0,15,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016251fe9d6203aa','大葱','pub','b16','cskefu',NULL,'402881fb6251a290016251a53aa1051a',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 16:34:23','2018-03-23 16:34:23',0,16,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016251fe9d7903ab','芹菜','pub','b17','cskefu',NULL,'402881fb6251a290016251a53aa1051a',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 16:34:23','2018-03-23 16:34:23',0,17,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016251fe9d8f03ac','萝卜','pub','b18','cskefu',NULL,'402881fb6251a290016251a53aa1051a',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 16:34:23','2018-03-23 16:34:23',0,18,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016251fe9da503ad','胡萝卜','pub','b19','cskefu',NULL,'402881fb6251a290016251a53aa1051a',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 16:34:23','2018-03-23 16:34:23',0,19,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016251fe9dbc03ae','甘蓝','pub','b20','cskefu',NULL,'402881fb6251a290016251a53aa1051a',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 16:34:23','2018-03-23 16:34:23',0,20,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016251fe9dd503af','花卉','pub','b21','cskefu',NULL,'402881fb6251a290016251a53aa1051a',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 16:34:23','2018-03-23 16:34:23',0,21,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016251fe9dec03b0','葡萄','pub','b22','cskefu',NULL,'402881fb6251a290016251a53aa1051a',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 16:34:23','2018-03-23 16:34:23',0,22,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016251fe9e0303b1','苹果','pub','b23','cskefu',NULL,'402881fb6251a290016251a53aa1051a',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 16:34:23','2018-03-23 16:34:23',0,23,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016251fe9e1a03b2','草莓','pub','b24','cskefu',NULL,'402881fb6251a290016251a53aa1051a',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 16:34:23','2018-03-23 16:34:23',0,24,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016251fe9e3103b3','苹果梨','pub','b25','cskefu',NULL,'402881fb6251a290016251a53aa1051a',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 16:34:23','2018-03-23 16:34:23',0,25,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016251fe9e4703b4','蓝莓','pub','b26','cskefu',NULL,'402881fb6251a290016251a53aa1051a',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 16:34:23','2018-03-23 16:34:23',0,26,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016251fe9e5e03b5','樱桃','pub','b27','cskefu',NULL,'402881fb6251a290016251a53aa1051a',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 16:34:23','2018-03-23 16:34:23',0,27,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016251fe9e7503b6','板栗','pub','b28','cskefu',NULL,'402881fb6251a290016251a53aa1051a',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 16:34:23','2018-03-23 16:34:23',0,28,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016251fe9e8c03b7','桃','pub','b29','cskefu',NULL,'402881fb6251a290016251a53aa1051a',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 16:34:24','2018-03-23 16:34:24',0,29,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016251fe9ea303b8','钙果','pub','b30','cskefu',NULL,'402881fb6251a290016251a53aa1051a',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 16:34:24','2018-03-23 16:34:24',0,30,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016251fe9eba03b9','其他','pub','b31','cskefu',NULL,'402881fb6251a290016251a53aa1051a',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 16:34:24','2018-03-23 16:34:24',0,31,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016251fe9ed103ba','桃李杏','pub','b32','cskefu',NULL,'402881fb6251a290016251a53aa1051a',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 16:34:24','2018-03-23 16:34:24',0,32,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016251fe9ee903bb','叶菜','pub','b33','cskefu',NULL,'402881fb6251a290016251a53aa1051a',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 16:34:24','2018-03-23 16:34:24',0,33,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f62201625219783f03c6','市场行情','pub','b31_1','cskefu',NULL,'402881fb6251f622016251fe9eba03b9',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:03:43','2018-03-23 17:03:43',0,1,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f62201625219784103c7','市场行情','pub','b30_1','cskefu',NULL,'402881fb6251f622016251fe9ea303b8',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:03:43','2018-03-23 17:03:43',0,1,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f62201625219787003c8','栽培技术','pub','b30_2','cskefu',NULL,'402881fb6251f622016251fe9ea303b8',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:03:43','2018-03-23 17:03:43',0,2,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f62201625219787303c9','市场行情','pub','b33_1','cskefu',NULL,'402881fb6251f622016251fe9ee903bb',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:03:43','2018-03-23 17:03:43',0,1,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f62201625219787303ca','市场行情','pub','b29_1','cskefu',NULL,'402881fb6251f622016251fe9e8c03b7',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:03:43','2018-03-23 17:03:43',0,1,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f62201625219787403cb','市场行情','pub','b32_1','cskefu',NULL,'402881fb6251f622016251fe9ed103ba',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:03:43','2018-03-23 17:03:43',0,1,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f62201625219787f03cc','栽培技术','pub','b31_2','cskefu',NULL,'402881fb6251f622016251fe9eba03b9',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:03:43','2018-03-23 17:03:43',0,2,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f62201625219788c03cd','栽培技术','pub','b33_2','cskefu',NULL,'402881fb6251f622016251fe9ee903bb',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:03:43','2018-03-23 17:03:43',0,2,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f62201625219788d03ce','病虫草害','pub','b30_3','cskefu',NULL,'402881fb6251f622016251fe9ea303b8',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:03:43','2018-03-23 17:03:43',0,3,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f62201625219789903cf','栽培技术','pub','b29_2','cskefu',NULL,'402881fb6251f622016251fe9e8c03b7',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:03:43','2018-03-23 17:03:43',0,2,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f62201625219789b03d0','栽培技术','pub','b32_2','cskefu',NULL,'402881fb6251f622016251fe9ed103ba',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:03:43','2018-03-23 17:03:43',0,2,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f62201625219789b03d1','病虫草害','pub','b33_3','cskefu',NULL,'402881fb6251f622016251fe9ee903bb',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:03:43','2018-03-23 17:03:43',0,3,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f6220162521978b203d2','病虫草害','pub','b29_3','cskefu',NULL,'402881fb6251f622016251fe9e8c03b7',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:03:43','2018-03-23 17:03:43',0,3,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f6220162521978b203d3','病虫草害','pub','b31_3','cskefu',NULL,'402881fb6251f622016251fe9eba03b9',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:03:43','2018-03-23 17:03:43',0,3,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f6220162521978b203d4','病虫草害','pub','b32_3','cskefu',NULL,'402881fb6251f622016251fe9ed103ba',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:03:43','2018-03-23 17:03:43',0,3,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f6220162521979ca03d5','市场行情','pub','b1_1','cskefu',NULL,'402881fb6251f622016251fe9bf6039b',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:03:43','2018-03-23 17:03:43',0,1,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f6220162521979e003d6','栽培技术','pub','b1_2','cskefu',NULL,'402881fb6251f622016251fe9bf6039b',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:03:44','2018-03-23 17:03:44',0,2,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f6220162521979f103d7','病虫草害','pub','b1_3','cskefu',NULL,'402881fb6251f622016251fe9bf6039b',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:03:44','2018-03-23 17:03:44',0,3,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016252197d0d03d8','市场行情','pub','b5_1','cskefu',NULL,'402881fb6251f622016251fe9c5d039f',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:03:44','2018-03-23 17:03:44',0,1,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016252197d0d03d9','市场行情','pub','b6_1','cskefu',NULL,'402881fb6251f622016251fe9c7503a0',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:03:44','2018-03-23 17:03:44',0,1,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016252197d1d03da','市场行情','pub','b7_1','cskefu',NULL,'402881fb6251f622016251fe9c9003a1',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:03:44','2018-03-23 17:03:44',0,1,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016252197d2c03db','栽培技术','pub','b5_2','cskefu',NULL,'402881fb6251f622016251fe9c5d039f',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:03:44','2018-03-23 17:03:44',0,2,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016252197d2c03dc','栽培技术','pub','b6_2','cskefu',NULL,'402881fb6251f622016251fe9c7503a0',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:03:44','2018-03-23 17:03:44',0,2,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016252197d3803dd','市场行情','pub','b2_1','cskefu',NULL,'402881fb6251f622016251fe9c15039c',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:03:44','2018-03-23 17:03:44',0,1,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016252197d5903de','市场行情','pub','b4_1','cskefu',NULL,'402881fb6251f622016251fe9c46039e',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:03:44','2018-03-23 17:03:44',0,1,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016252197d6003df','病虫草害','pub','b6_3','cskefu',NULL,'402881fb6251f622016251fe9c7503a0',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:03:44','2018-03-23 17:03:44',0,3,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016252197d7103e0','栽培技术','pub','b4_2','cskefu',NULL,'402881fb6251f622016251fe9c46039e',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:03:44','2018-03-23 17:03:44',0,2,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016252197d7403e1','市场行情','pub','b3_1','cskefu',NULL,'402881fb6251f622016251fe9c2e039d',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:03:44','2018-03-23 17:03:44',0,1,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016252197d7a03e2','栽培技术','pub','b2_2','cskefu',NULL,'402881fb6251f622016251fe9c15039c',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:03:44','2018-03-23 17:03:44',0,2,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016252197d7b03e3','病虫草害','pub','b5_3','cskefu',NULL,'402881fb6251f622016251fe9c5d039f',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:03:44','2018-03-23 17:03:44',0,3,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016252197d8c03e4','病虫草害','pub','b4_3','cskefu',NULL,'402881fb6251f622016251fe9c46039e',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:03:45','2018-03-23 17:03:45',0,3,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016252197d9003e5','栽培技术','pub','b7_2','cskefu',NULL,'402881fb6251f622016251fe9c9003a1',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:03:45','2018-03-23 17:03:45',0,2,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016252197d9a03e6','栽培技术','pub','b3_2','cskefu',NULL,'402881fb6251f622016251fe9c2e039d',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:03:45','2018-03-23 17:03:45',0,2,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016252197d9e03e7','病虫草害','pub','b2_3','cskefu',NULL,'402881fb6251f622016251fe9c15039c',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:03:45','2018-03-23 17:03:45',0,3,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016252197db703e8','病虫草害','pub','b3_3','cskefu',NULL,'402881fb6251f622016251fe9c2e039d',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:03:45','2018-03-23 17:03:45',0,3,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016252197db803e9','病虫草害','pub','b7_3','cskefu',NULL,'402881fb6251f622016251fe9c9003a1',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:03:45','2018-03-23 17:03:45',0,3,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016252197f8603ea','市场行情','pub','b12_1','cskefu',NULL,'402881fb6251f622016251fe9d0603a6',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:03:45','2018-03-23 17:03:45',0,1,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016252197f8903eb','市场行情','pub','b10_1','cskefu',NULL,'402881fb6251f622016251fe9cd803a4',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:03:45','2018-03-23 17:03:45',0,1,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016252197f8b03ec','市场行情','pub','b9_1','cskefu',NULL,'402881fb6251f622016251fe9cc203a3',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:03:45','2018-03-23 17:03:45',0,1,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016252197f9c03ed','栽培技术','pub','b10_2','cskefu',NULL,'402881fb6251f622016251fe9cd803a4',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:03:45','2018-03-23 17:03:45',0,2,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016252197f9c03ee','栽培技术','pub','b12_2','cskefu',NULL,'402881fb6251f622016251fe9d0603a6',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:03:45','2018-03-23 17:03:45',0,2,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016252197fa303ef','栽培技术','pub','b9_2','cskefu',NULL,'402881fb6251f622016251fe9cc203a3',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:03:45','2018-03-23 17:03:45',0,2,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016252197faa03f0','市场行情','pub','b11_1','cskefu',NULL,'402881fb6251f622016251fe9cef03a5',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:03:45','2018-03-23 17:03:45',0,1,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016252197fb903f1','病虫草害','pub','b10_3','cskefu',NULL,'402881fb6251f622016251fe9cd803a4',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:03:45','2018-03-23 17:03:45',0,3,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016252197fbc03f2','病虫草害','pub','b9_3','cskefu',NULL,'402881fb6251f622016251fe9cc203a3',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:03:45','2018-03-23 17:03:45',0,3,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016252197fc803f3','病虫草害','pub','b12_3','cskefu',NULL,'402881fb6251f622016251fe9d0603a6',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:03:45','2018-03-23 17:03:45',0,3,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016252197fcc03f4','市场行情','pub','b8_1','cskefu',NULL,'402881fb6251f622016251fe9caa03a2',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:03:45','2018-03-23 17:03:45',0,1,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016252197fe603f5','栽培技术','pub','b8_2','cskefu',NULL,'402881fb6251f622016251fe9caa03a2',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:03:45','2018-03-23 17:03:45',0,2,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f62201625219800403f6','病虫草害','pub','b8_3','cskefu',NULL,'402881fb6251f622016251fe9caa03a2',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:03:45','2018-03-23 17:03:45',0,3,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f62201625219800a03f7','栽培技术','pub','b11_2','cskefu',NULL,'402881fb6251f622016251fe9cef03a5',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:03:45','2018-03-23 17:03:45',0,2,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f62201625219801003f8','市场行情','pub','b13_1','cskefu',NULL,'402881fb6251f622016251fe9d1b03a7',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:03:45','2018-03-23 17:03:45',0,1,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f62201625219803103f9','病虫草害','pub','b11_3','cskefu',NULL,'402881fb6251f622016251fe9cef03a5',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:03:45','2018-03-23 17:03:45',0,3,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f62201625219803103fa','栽培技术','pub','b13_2','cskefu',NULL,'402881fb6251f622016251fe9d1b03a7',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:03:45','2018-03-23 17:03:45',0,2,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f62201625219806603fb','市场行情','pub','b14_1','cskefu',NULL,'402881fb6251f622016251fe9d3103a8',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:03:45','2018-03-23 17:03:45',0,1,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f6220162521980d503fc','病虫草害','pub','b13_3','cskefu',NULL,'402881fb6251f622016251fe9d1b03a7',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:03:45','2018-03-23 17:03:45',0,3,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f62201625219816403fd','栽培技术','pub','b14_2','cskefu',NULL,'402881fb6251f622016251fe9d3103a8',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:03:45','2018-03-23 17:03:45',0,2,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f62201625219816603fe','市场行情','pub','b15_1','cskefu',NULL,'402881fb6251f622016251fe9d4a03a9',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:03:46','2018-03-23 17:03:46',0,1,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f62201625219816d03ff','市场行情','pub','b17_1','cskefu',NULL,'402881fb6251f622016251fe9d7903ab',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:03:46','2018-03-23 17:03:46',0,1,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f62201625219816f0400','市场行情','pub','b18_1','cskefu',NULL,'402881fb6251f622016251fe9d8f03ac',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:03:46','2018-03-23 17:03:46',0,1,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f6220162521981760401','市场行情','pub','b16_1','cskefu',NULL,'402881fb6251f622016251fe9d6203aa',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:03:46','2018-03-23 17:03:46',0,1,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f6220162521981860402','病虫草害','pub','b14_3','cskefu',NULL,'402881fb6251f622016251fe9d3103a8',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:03:46','2018-03-23 17:03:46',0,3,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f62201625219818f0403','栽培技术','pub','b15_2','cskefu',NULL,'402881fb6251f622016251fe9d4a03a9',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:03:46','2018-03-23 17:03:46',0,2,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f6220162521981920404','栽培技术','pub','b17_2','cskefu',NULL,'402881fb6251f622016251fe9d7903ab',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:03:46','2018-03-23 17:03:46',0,2,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f6220162521981ac0405','栽培技术','pub','b18_2','cskefu',NULL,'402881fb6251f622016251fe9d8f03ac',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:03:46','2018-03-23 17:03:46',0,2,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f6220162521981b50406','栽培技术','pub','b16_2','cskefu',NULL,'402881fb6251f622016251fe9d6203aa',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:03:46','2018-03-23 17:03:46',0,2,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f6220162521981bb0407','病虫草害','pub','b18_3','cskefu',NULL,'402881fb6251f622016251fe9d8f03ac',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:03:46','2018-03-23 17:03:46',0,3,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f6220162521981c60408','病虫草害','pub','b16_3','cskefu',NULL,'402881fb6251f622016251fe9d6203aa',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:03:46','2018-03-23 17:03:46',0,3,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f6220162521981cc0409','病虫草害','pub','b17_3','cskefu',NULL,'402881fb6251f622016251fe9d7903ab',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:03:46','2018-03-23 17:03:46',0,3,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f62201625219821f040a','市场行情','pub','b19_1','cskefu',NULL,'402881fb6251f622016251fe9da503ad',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:03:46','2018-03-23 17:03:46',0,1,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f62201625219822e040b','栽培技术','pub','b19_2','cskefu',NULL,'402881fb6251f622016251fe9da503ad',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:03:46','2018-03-23 17:03:46',0,2,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f62201625219823d040c','市场行情','pub','b20_1','cskefu',NULL,'402881fb6251f622016251fe9dbc03ae',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:03:46','2018-03-23 17:03:46',0,1,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f62201625219823e040d','病虫草害','pub','b19_3','cskefu',NULL,'402881fb6251f622016251fe9da503ad',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:03:46','2018-03-23 17:03:46',0,3,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f62201625219823e040e','市场行情','pub','b21_1','cskefu',NULL,'402881fb6251f622016251fe9dd503af',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:03:46','2018-03-23 17:03:46',0,1,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016252198256040f','市场行情','pub','b22_1','cskefu',NULL,'402881fb6251f622016251fe9dec03b0',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:03:46','2018-03-23 17:03:46',0,1,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f62201625219825b0410','栽培技术','pub','b21_2','cskefu',NULL,'402881fb6251f622016251fe9dd503af',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:03:46','2018-03-23 17:03:46',0,2,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f62201625219826e0411','栽培技术','pub','b22_2','cskefu',NULL,'402881fb6251f622016251fe9dec03b0',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:03:46','2018-03-23 17:03:46',0,2,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f6220162521982f90412','病虫草害','pub','b21_3','cskefu',NULL,'402881fb6251f622016251fe9dd503af',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:03:46','2018-03-23 17:03:46',0,3,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f6220162521982fa0413','栽培技术','pub','b20_2','cskefu',NULL,'402881fb6251f622016251fe9dbc03ae',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:03:46','2018-03-23 17:03:46',0,2,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f6220162521982fe0414','病虫草害','pub','b15_3','cskefu',NULL,'402881fb6251f622016251fe9d4a03a9',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:03:46','2018-03-23 17:03:46',0,3,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f62201625219830e0415','病虫草害','pub','b22_3','cskefu',NULL,'402881fb6251f622016251fe9dec03b0',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:03:46','2018-03-23 17:03:46',0,3,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f62201625219832a0416','市场行情','pub','b23_1','cskefu',NULL,'402881fb6251f622016251fe9e0303b1',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:03:46','2018-03-23 17:03:46',0,1,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f6220162521983470417','栽培技术','pub','b23_2','cskefu',NULL,'402881fb6251f622016251fe9e0303b1',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:03:46','2018-03-23 17:03:46',0,2,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f62201625219834f0418','病虫草害','pub','b20_3','cskefu',NULL,'402881fb6251f622016251fe9dbc03ae',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:03:46','2018-03-23 17:03:46',0,3,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f6220162521983550419','病虫草害','pub','b23_3','cskefu',NULL,'402881fb6251f622016251fe9e0303b1',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:03:46','2018-03-23 17:03:46',0,3,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016252198545041a','市场行情','pub','b25_1','cskefu',NULL,'402881fb6251f622016251fe9e3103b3',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:03:47','2018-03-23 17:03:47',0,1,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016252198548041b','市场行情','pub','b27_1','cskefu',NULL,'402881fb6251f622016251fe9e5e03b5',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:03:47','2018-03-23 17:03:47',0,1,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016252198550041c','市场行情','pub','b24_1','cskefu',NULL,'402881fb6251f622016251fe9e1a03b2',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:03:47','2018-03-23 17:03:47',0,1,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f6220162521985b1041d','栽培技术','pub','b24_2','cskefu',NULL,'402881fb6251f622016251fe9e1a03b2',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:03:47','2018-03-23 17:03:47',0,2,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f6220162521985b4041e','市场行情','pub','b28_1','cskefu',NULL,'402881fb6251f622016251fe9e7503b6',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:03:47','2018-03-23 17:03:47',0,1,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f6220162521985c2041f','栽培技术','pub','b27_2','cskefu',NULL,'402881fb6251f622016251fe9e5e03b5',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:03:47','2018-03-23 17:03:47',0,2,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f6220162521985c30420','市场行情','pub','b26_1','cskefu',NULL,'402881fb6251f622016251fe9e4703b4',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:03:47','2018-03-23 17:03:47',0,1,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f6220162521985d20421','栽培技术','pub','b28_2','cskefu',NULL,'402881fb6251f622016251fe9e7503b6',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:03:47','2018-03-23 17:03:47',0,2,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f6220162521985d20422','病虫草害','pub','b24_3','cskefu',NULL,'402881fb6251f622016251fe9e1a03b2',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:03:47','2018-03-23 17:03:47',0,3,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f6220162521985dc0423','病虫草害','pub','b27_3','cskefu',NULL,'402881fb6251f622016251fe9e5e03b5',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:03:47','2018-03-23 17:03:47',0,3,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f6220162521985e30424','病虫草害','pub','b28_3','cskefu',NULL,'402881fb6251f622016251fe9e7503b6',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:03:47','2018-03-23 17:03:47',0,3,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f6220162521985ed0425','栽培技术','pub','b26_2','cskefu',NULL,'402881fb6251f622016251fe9e4703b4',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:03:47','2018-03-23 17:03:47',0,2,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f6220162521985fd0426','病虫草害','pub','b26_3','cskefu',NULL,'402881fb6251f622016251fe9e4703b4',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:03:47','2018-03-23 17:03:47',0,3,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f62201625219867d0427','栽培技术','pub','b25_2','cskefu',NULL,'402881fb6251f622016251fe9e3103b3',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:03:47','2018-03-23 17:03:47',0,2,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f6220162521986ce0428','病虫草害','pub','b25_3','cskefu',NULL,'402881fb6251f622016251fe9e3103b3',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:03:47','2018-03-23 17:03:47',0,3,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f6220162521a4ccd0429','种子','pub','c1','cskefu',NULL,'402881fb6251a290016251a53ac0051b',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:04:38','2018-03-23 17:04:38',0,1,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f6220162521a4cdd042a','农药','pub','c2','cskefu',NULL,'402881fb6251a290016251a53ac0051b',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:04:38','2018-03-23 17:04:38',0,2,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f6220162521a4ce9042b','农膜','pub','c3','cskefu',NULL,'402881fb6251a290016251a53ac0051b',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:04:38','2018-03-23 17:04:38',0,3,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f6220162521a4cf5042c','土肥','pub','c4','cskefu',NULL,'402881fb6251a290016251a53ac0051b',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:04:38','2018-03-23 17:04:38',0,4,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f6220162521a4d01042d','沼气','pub','c5','cskefu',NULL,'402881fb6251a290016251a53ac0051b',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:04:38','2018-03-23 17:04:38',0,5,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f6220162521a4d0e042e','绿色食品','pub','c6','cskefu',NULL,'402881fb6251a290016251a53ac0051b',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:04:38','2018-03-23 17:04:38',0,6,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f6220162521a4d1f042f','农机','pub','c7','cskefu',NULL,'402881fb6251a290016251a53ac0051b',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:04:38','2018-03-23 17:04:38',0,7,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f6220162521a4d2b0430','其他','pub','c8','cskefu',NULL,'402881fb6251a290016251a53ac0051b',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:04:38','2018-03-23 17:04:38',0,8,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f6220162521bac110434','市场行情','pub','c1_1','cskefu',NULL,'402881fb6251f6220162521a4ccd0429',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:06:08','2018-03-23 17:06:08',0,1,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f6220162521bac200435','栽培技术','pub','c1_2','cskefu',NULL,'402881fb6251f6220162521a4ccd0429',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:06:08','2018-03-23 17:06:08',0,2,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f6220162521bac310436','病虫草害','pub','c1_3','cskefu',NULL,'402881fb6251f6220162521a4ccd0429',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:06:08','2018-03-23 17:06:08',0,3,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f62201625221e2800437','市场行情','pub','c5_1','cskefu',NULL,'402881fb6251f6220162521a4d01042d',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:12:55','2018-03-23 17:12:55',0,1,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f62201625221e2800438','市场行情','pub','c3_1','cskefu',NULL,'402881fb6251f6220162521a4ce9042b',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:12:55','2018-03-23 17:12:55',0,1,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f62201625221e2c80439','市场行情','pub','c6_1','cskefu',NULL,'402881fb6251f6220162521a4d0e042e',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:12:55','2018-03-23 17:12:55',0,1,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f62201625221e2c8043a','市场行情','pub','c4_1','cskefu',NULL,'402881fb6251f6220162521a4cf5042c',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:12:55','2018-03-23 17:12:55',0,1,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f62201625221e2cb043b','市场行情','pub','c2_1','cskefu',NULL,'402881fb6251f6220162521a4cdd042a',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:12:55','2018-03-23 17:12:55',0,1,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f62201625221e2dc043c','栽培技术','pub','c5_2','cskefu',NULL,'402881fb6251f6220162521a4d01042d',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:12:55','2018-03-23 17:12:55',0,2,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f62201625221e2dc043d','栽培技术','pub','c2_2','cskefu',NULL,'402881fb6251f6220162521a4cdd042a',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:12:55','2018-03-23 17:12:55',0,2,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f62201625221e2de043e','栽培技术','pub','c4_2','cskefu',NULL,'402881fb6251f6220162521a4cf5042c',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:12:55','2018-03-23 17:12:55',0,2,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f62201625221e2e9043f','栽培技术','pub','c6_2','cskefu',NULL,'402881fb6251f6220162521a4d0e042e',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:12:55','2018-03-23 17:12:55',0,2,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f62201625221e2eb0440','病虫草害','pub','c5_3','cskefu',NULL,'402881fb6251f6220162521a4d01042d',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:12:55','2018-03-23 17:12:55',0,3,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f62201625221e2f20441','栽培技术','pub','c3_2','cskefu',NULL,'402881fb6251f6220162521a4ce9042b',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:12:55','2018-03-23 17:12:55',0,2,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f62201625221e2f20442','病虫草害','pub','c2_3','cskefu',NULL,'402881fb6251f6220162521a4cdd042a',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:12:55','2018-03-23 17:12:55',0,3,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f62201625221e2f90443','病虫草害','pub','c6_3','cskefu',NULL,'402881fb6251f6220162521a4d0e042e',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:12:55','2018-03-23 17:12:55',0,3,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f62201625221e3010444','病虫草害','pub','c3_3','cskefu',NULL,'402881fb6251f6220162521a4ce9042b',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:12:55','2018-03-23 17:12:55',0,3,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f62201625221e3050445','病虫草害','pub','c4_3','cskefu',NULL,'402881fb6251f6220162521a4cf5042c',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:12:55','2018-03-23 17:12:55',0,3,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f62201625221e3650446','市场行情','pub','c7_1','cskefu',NULL,'402881fb6251f6220162521a4d1f042f',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:12:55','2018-03-23 17:12:55',0,1,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f62201625221e37c0447','栽培技术','pub','c7_2','cskefu',NULL,'402881fb6251f6220162521a4d1f042f',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:12:55','2018-03-23 17:12:55',0,2,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f62201625221e38b0448','病虫草害','pub','c7_3','cskefu',NULL,'402881fb6251f6220162521a4d1f042f',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:12:55','2018-03-23 17:12:55',0,3,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f62201625221e5fa0449','市场行情','pub','c8_1','cskefu',NULL,'402881fb6251f6220162521a4d2b0430',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:12:56','2018-03-23 17:12:56',0,1,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f62201625221e60b044a','栽培技术','pub','c8_2','cskefu',NULL,'402881fb6251f6220162521a4d2b0430',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:12:56','2018-03-23 17:12:56',0,2,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f62201625221e623044b','病虫草害','pub','c8_3','cskefu',NULL,'402881fb6251f6220162521a4d2b0430',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:12:56','2018-03-23 17:12:56',0,3,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016252229af9044c','土地','pub','d1','cskefu',NULL,'402881fb6251a290016251a53ad9051c',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:13:42','2018-03-23 17:13:42',0,1,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016252229b0d044d','养殖','pub','d2','cskefu',NULL,'402881fb6251a290016251a53ad9051c',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:13:42','2018-03-23 17:13:42',0,2,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016252229b19044e','法律政策','pub','d3','cskefu',NULL,'402881fb6251a290016251a53ad9051c',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:13:42','2018-03-23 17:13:42',0,3,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016252229b28044f','农村政策法规','pub','d4','cskefu',NULL,'402881fb6251a290016251a53ad9051c',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:13:42','2018-03-23 17:13:42',0,4,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016252229b3c0450','涉农政策','pub','d5','cskefu',NULL,'402881fb6251a290016251a53ad9051c',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:13:42','2018-03-23 17:13:42',0,5,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016252229b4c0451','农机','pub','d6','cskefu',NULL,'402881fb6251a290016251a53ad9051c',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:13:42','2018-03-23 17:13:42',0,6,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016252229b5a0452','保险','pub','d7','cskefu',NULL,'402881fb6251a290016251a53ad9051c',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:13:42','2018-03-23 17:13:42',0,7,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016252229b660453','合作社','pub','d8','cskefu',NULL,'402881fb6251a290016251a53ad9051c',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:13:42','2018-03-23 17:13:42',0,8,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016252229b720454','其他','pub','d9','cskefu',NULL,'402881fb6251a290016251a53ad9051c',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:13:42','2018-03-23 17:13:42',0,9,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016252229b7f0455','法律','pub','d10','cskefu',NULL,'402881fb6251a290016251a53ad9051c',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:13:42','2018-03-23 17:13:42',0,10,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016252229b8c0456','粮食','pub','d11','cskefu',NULL,'402881fb6251a290016251a53ad9051c',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:13:42','2018-03-23 17:13:42',0,11,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016252229ba20457','农民负担','pub','d12','cskefu',NULL,'402881fb6251a290016251a53ad9051c',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:13:42','2018-03-23 17:13:42',0,12,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f6220162522309a10458','技术解答','pub','d1_1','cskefu',NULL,'402881fb6251f622016252229af9044c',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:14:10','2018-03-23 17:14:10',0,1,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f6220162522309b00459','市场行情','pub','d1_2','cskefu',NULL,'402881fb6251f622016252229af9044c',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:14:10','2018-03-23 17:14:10',0,2,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f6220162522590f3045a','技术解答','pub','d9_1','cskefu',NULL,'402881fb6251f622016252229b720454',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:16:56','2018-03-23 17:16:56',0,1,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f6220162522590f9045b','技术解答','pub','d7_1','cskefu',NULL,'402881fb6251f622016252229b5a0452',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:16:56','2018-03-23 17:16:56',0,1,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016252259105045c','市场行情','pub','d9_2','cskefu',NULL,'402881fb6251f622016252229b720454',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:16:56','2018-03-23 17:16:56',0,2,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016252259108045d','市场行情','pub','d7_2','cskefu',NULL,'402881fb6251f622016252229b5a0452',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:16:56','2018-03-23 17:16:56',0,2,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016252259137045e','技术解答','pub','d11_1','cskefu',NULL,'402881fb6251f622016252229b8c0456',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:16:56','2018-03-23 17:16:56',0,1,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016252259137045f','技术解答','pub','d10_1','cskefu',NULL,'402881fb6251f622016252229b7f0455',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:16:56','2018-03-23 17:16:56',0,1,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f6220162522592020460','市场行情','pub','d11_2','cskefu',NULL,'402881fb6251f622016252229b8c0456',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:16:56','2018-03-23 17:16:56',0,2,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f62201625225920c0461','市场行情','pub','d10_2','cskefu',NULL,'402881fb6251f622016252229b7f0455',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:16:56','2018-03-23 17:16:56',0,2,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f6220162522592190462','技术解答','pub','d8_1','cskefu',NULL,'402881fb6251f622016252229b660453',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:16:56','2018-03-23 17:16:56',0,1,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f62201625225922a0463','市场行情','pub','d8_2','cskefu',NULL,'402881fb6251f622016252229b660453',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:16:56','2018-03-23 17:16:56',0,2,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f6220162522592410464','技术解答','pub','d6_1','cskefu',NULL,'402881fb6251f622016252229b4c0451',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:16:56','2018-03-23 17:16:56',0,1,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f6220162522592500465','市场行情','pub','d6_2','cskefu',NULL,'402881fb6251f622016252229b4c0451',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:16:56','2018-03-23 17:16:56',0,2,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f6220162522592670466','技术解答','pub','d5_1','cskefu',NULL,'402881fb6251f622016252229b3c0450',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:16:56','2018-03-23 17:16:56',0,1,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f6220162522592770467','市场行情','pub','d5_2','cskefu',NULL,'402881fb6251f622016252229b3c0450',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:16:56','2018-03-23 17:16:56',0,2,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f62201625225929e0468','技术解答','pub','d4_1','cskefu',NULL,'402881fb6251f622016252229b28044f',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:16:56','2018-03-23 17:16:56',0,1,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f6220162522592bb0469','市场行情','pub','d4_2','cskefu',NULL,'402881fb6251f622016252229b28044f',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:16:56','2018-03-23 17:16:56',0,2,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016252259367046a','技术解答','pub','d2_1','cskefu',NULL,'402881fb6251f622016252229b0d044d',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:16:57','2018-03-23 17:16:57',0,1,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016252259376046b','技术解答','pub','d12_1','cskefu',NULL,'402881fb6251f622016252229ba20457',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:16:57','2018-03-23 17:16:57',0,1,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f62201625225937f046c','市场行情','pub','d2_2','cskefu',NULL,'402881fb6251f622016252229b0d044d',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:16:57','2018-03-23 17:16:57',0,2,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016252259382046d','技术解答','pub','d3_1','cskefu',NULL,'402881fb6251f622016252229b19044e',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:16:57','2018-03-23 17:16:57',0,1,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016252259386046e','市场行情','pub','d12_2','cskefu',NULL,'402881fb6251f622016252229ba20457',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:16:57','2018-03-23 17:16:57',0,2,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016252259390046f','市场行情','pub','d3_2','cskefu',NULL,'402881fb6251f622016252229b19044e',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:16:57','2018-03-23 17:16:57',0,2,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f62201625226e23e0470','本周气象','pub','e1','cskefu',NULL,'402881fb6251a290016251a53af4051d',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:18:22','2018-03-23 17:18:22',0,1,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f62201625226e24d0471','每日气象','pub','e2','cskefu',NULL,'402881fb6251a290016251a53af4051d',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:18:22','2018-03-23 17:18:22',0,2,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f62201625226e25b0472','长期气象','pub','e3','cskefu',NULL,'402881fb6251a290016251a53af4051d',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:18:22','2018-03-23 17:18:22',0,3,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f62201625226e26b0473','未来一周气象','pub','e4','cskefu',NULL,'402881fb6251a290016251a53af4051d',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:18:22','2018-03-23 17:18:22',0,4,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f6220162522723bb0474','技术解答','pub','e1_1','cskefu',NULL,'402881fb6251f62201625226e23e0470',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:18:39','2018-03-23 17:18:39',0,1,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f6220162522723cf0475','市场行情','pub','e1_2','cskefu',NULL,'402881fb6251f62201625226e23e0470',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:18:39','2018-03-23 17:18:39',0,2,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016252278f2f0476','技术解答','pub','e2_1','cskefu',NULL,'402881fb6251f62201625226e24d0471',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:19:07','2018-03-23 17:19:07',0,1,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016252278f420477','市场行情','pub','e2_2','cskefu',NULL,'402881fb6251f62201625226e24d0471',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:19:07','2018-03-23 17:19:07',0,2,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f62201625227ad460478','技术解答','pub','e3_1','cskefu',NULL,'402881fb6251f62201625226e25b0472',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:19:14','2018-03-23 17:19:14',0,1,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f62201625227ad550479','市场行情','pub','e3_2','cskefu',NULL,'402881fb6251f62201625226e25b0472',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:19:14','2018-03-23 17:19:14',0,2,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f62201625227ca6f047a','技术解答','pub','e4_1','cskefu',NULL,'402881fb6251f62201625226e26b0473',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:19:22','2018-03-23 17:19:22',0,1,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f62201625227ca7f047b','市场行情','pub','e4_2','cskefu',NULL,'402881fb6251f62201625226e26b0473',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:19:22','2018-03-23 17:19:22',0,2,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f6220162522800d5047c','大田','pub','f1','cskefu',NULL,'402881fb6251a290016251a53b0f051e',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:19:36','2018-03-23 17:19:36',0,1,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f6220162522800e3047d','畜牧','pub','f2','cskefu',NULL,'402881fb6251a290016251a53b0f051e',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:19:36','2018-03-23 17:19:36',0,2,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f6220162522800ed047e','果蔬','pub','f3','cskefu',NULL,'402881fb6251a290016251a53b0f051e',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:19:36','2018-03-23 17:19:36',0,3,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f62201625228381e047f','温度','pub','f1_1','cskefu',NULL,'402881fb6251f6220162522800d5047c',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:19:50','2018-03-23 17:19:50',0,1,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f62201625228382c0480','气温雨量','pub','f1_2','cskefu',NULL,'402881fb6251f6220162522800d5047c',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:19:50','2018-03-23 17:19:50',0,2,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f6220162522838390481','雨水','pub','f1_3','cskefu',NULL,'402881fb6251f6220162522800d5047c',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:19:50','2018-03-23 17:19:50',0,3,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f6220162522860310482','温度','pub','f2_1','cskefu',NULL,'402881fb6251f6220162522800e3047d',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:20:00','2018-03-23 17:20:00',0,1,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f62201625228603e0483','气温雨量','pub','f2_2','cskefu',NULL,'402881fb6251f6220162522800e3047d',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:20:00','2018-03-23 17:20:00',0,2,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f62201625228604a0484','雨水','pub','f2_3','cskefu',NULL,'402881fb6251f6220162522800e3047d',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:20:00','2018-03-23 17:20:00',0,3,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016252287adc0485','温度','pub','f3_1','cskefu',NULL,'402881fb6251f6220162522800ed047e',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:20:07','2018-03-23 17:20:07',0,1,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016252287aed0486','气温雨量','pub','f3_2','cskefu',NULL,'402881fb6251f6220162522800ed047e',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:20:07','2018-03-23 17:20:07',0,2,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016252287afb0487','雨水','pub','f3_3','cskefu',NULL,'402881fb6251f6220162522800ed047e',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:20:07','2018-03-23 17:20:07',0,3,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f62201625228bb030488','其他','pub','g1','cskefu',NULL,'402881fb6251a290016251a53b2b051f',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:20:23','2018-03-23 17:20:23',0,1,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f62201625228bb0d0489','错误信息','pub','g2','cskefu',NULL,'402881fb6251a290016251a53b2b051f',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:20:23','2018-03-23 17:20:23',0,2,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f62201625228bb1a048a','感谢','pub','g3','cskefu',NULL,'402881fb6251a290016251a53b2b051f',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:20:23','2018-03-23 17:20:23',0,3,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f62201625228bb27048b','业务办理','pub','g4','cskefu',NULL,'402881fb6251a290016251a53b2b051f',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:20:23','2018-03-23 17:20:23',0,4,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f62201625228bb33048c','医疗','pub','g5','cskefu',NULL,'402881fb6251a290016251a53b2b051f',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:20:23','2018-03-23 17:20:23',0,5,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f62201625228bb3f048d','生活百科','pub','g6','cskefu',NULL,'402881fb6251a290016251a53b2b051f',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:20:23','2018-03-23 17:20:23',0,6,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f62201625228bb4b048e','宣传','pub','g7','cskefu',NULL,'402881fb6251a290016251a53b2b051f',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:20:23','2018-03-23 17:20:23',0,7,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f62201625228bb5a048f','培训','pub','g8','cskefu',NULL,'402881fb6251a290016251a53b2b051f',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:20:23','2018-03-23 17:20:23',0,8,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f62201625228fc8f0490','价格采集','pub','g1_1','cskefu',NULL,'402881fb6251f62201625228bb030488',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:20:40','2018-03-23 17:20:40',0,1,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016252290a270491','价格采集','pub','g2_1','cskefu',NULL,'402881fb6251f62201625228bb0d0489',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:20:44','2018-03-23 17:20:44',0,1,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f6220162522918ec0492','价格采集','pub','g3_1','cskefu',NULL,'402881fb6251f62201625228bb1a048a',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:20:47','2018-03-23 17:20:47',0,1,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f622016252292d8e0493','价格采集','pub','g5_1','cskefu','layui-icon','402881fb6251f62201625228bb33048c','',NULL,'','',NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:20:53','2018-03-23 17:20:53',0,1,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f62201625229ab0c0494','价格采集','pub','g4_1','cskefu',NULL,'402881fb6251f62201625228bb27048b',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:21:25','2018-03-23 17:21:25',0,1,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f62201625229bd380495','价格采集','pub','g6_1','cskefu',NULL,'402881fb6251f62201625228bb3f048d',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:21:29','2018-03-23 17:21:29',0,1,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f62201625229ccad0496','价格采集','pub','g7_1','cskefu',NULL,'402881fb6251f62201625228bb4b048e',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:21:33','2018-03-23 17:21:33',0,1,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6251f62201625229ddcf0497','价格采集','pub','g8_1','cskefu',NULL,'402881fb6251f62201625228bb5a048f',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-23 17:21:38','2018-03-23 17:21:38',0,1,'402881fb624c612401624c6fb495043d',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6266a6c7016266a9854e0394','短信网关类型','pub','com.dic.sms.type',NULL,'data','0','',NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-27 16:53:28',NULL,1,0,NULL,0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6266a6c7016266ab17bf0395','阿里大于','pub','dysms','cskefu','layui-icon','402881fb6266a6c7016266a9854e0394','',NULL,'','',NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-27 16:55:11',NULL,1,0,'402881fb6266a6c7016266a9854e0394',0,0,NULL,NULL,NULL,NULL,NULL),('402881fb6266c1bd016266c3d4070394','其他短信','pub','othersms','cskefu','layui-icon','297e63f05d1da6be015d1dae6de20002','',NULL,'','',NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-27 17:22:12',NULL,1,0,'297e63f05d1da6be015d1dae6de20002',0,0,NULL,NULL,NULL,NULL,NULL),('402882516dce9b82016dcedd5abc009c','会话监控 ','pub','A13_A01','cskefu','layui-icon','402888815d2fe37f015d2fe75cc80002','坐席对话实时监控',NULL,'','',NULL,'4028cac3614cd2f901614cf8be1f0324','2019-10-15 18:01:16',NULL,1,0,'402888815d2fe37f015d2fe75cc80002',0,0,NULL,NULL,NULL,NULL,NULL),('402882516dce9b82016dcede487700a3','浏览会话','pub','A13_A01_A01','cskefu','layui-icon','402882516dce9b82016dcedd5abc009c','',NULL,'','',NULL,'4028cac3614cd2f901614cf8be1f0324','2019-10-15 18:02:17',NULL,1,0,'402888815d2fe37f015d2fe75cc80002',0,0,NULL,NULL,NULL,NULL,NULL),('402882516dce9b82016dcedea4b900a7','转接会话','pub','A13_A01_A02','cskefu','layui-icon','402882516dce9b82016dcedd5abc009c','',NULL,'','',NULL,'4028cac3614cd2f901614cf8be1f0324','2019-10-15 18:02:40',NULL,1,0,'402888815d2fe37f015d2fe75cc80002',0,0,NULL,NULL,NULL,NULL,NULL),('402882516dce9b82016dcedf1cbd00ab','发送消息','pub','A13_A01_A03','cskefu','layui-icon','402882516dce9b82016dcedd5abc009c','',NULL,'','',NULL,'4028cac3614cd2f901614cf8be1f0324','2019-10-15 18:03:11',NULL,1,0,'402888815d2fe37f015d2fe75cc80002',0,0,NULL,NULL,NULL,NULL,NULL),('4028826a6eeed0f3016eeed9eee7001c','标签接口','pub','tagdata','cskefu','layui-icon','402888815e097729015e0999f26e0002','',NULL,'','',NULL,'4028cac3614cd2f901614cf8be1f0324','2019-12-10 16:08:10',NULL,1,0,'402888815e097729015e0999f26e0002',0,0,NULL,NULL,NULL,NULL,NULL),('40288273656b534a01656b6de4bb056b','坐席监控','pub','A11_A01_A03','cskefu','auth','402888816400f911016401056d340533','',NULL,'','',NULL,'4028cac3614cd2f901614cf8be1f0324','2018-08-24 18:14:48',NULL,1,0,'402888815d2fe37f015d2fe75cc80002',0,0,'/apps/callout/monitor.html','webim',NULL,NULL,'left'),('4028838b5ae97036015ae972b6f10003','客户类型','pub','com.dic.contacts.entype',NULL,'data','0','',NULL,NULL,NULL,NULL,'297e8c7b455798280145579c73e501c1','2017-03-20 10:01:33',NULL,1,0,NULL,0,0,NULL,NULL,NULL,NULL,NULL),('4028838b5ae97036015ae972d48d0004','普通客户','pub','01','cskefu',NULL,'4028838b5ae97036015ae972b6f10003',NULL,NULL,NULL,NULL,NULL,'297e8c7b455798280145579c73e501c1','2017-03-20 10:01:41','2017-03-20 10:01:41',0,1,'4028838b5ae97036015ae972b6f10003',0,0,NULL,NULL,NULL,NULL,NULL),('4028838b5ae97036015ae972d4970005','VIP客户','pub','02','cskefu',NULL,'4028838b5ae97036015ae972b6f10003',NULL,NULL,NULL,NULL,NULL,'297e8c7b455798280145579c73e501c1','2017-03-20 10:01:41','2017-03-20 10:01:41',0,2,'4028838b5ae97036015ae972b6f10003',0,0,NULL,NULL,NULL,NULL,NULL),('4028838b5ae97036015ae972d49e0006','老客户','pub','03','cskefu',NULL,'4028838b5ae97036015ae972b6f10003',NULL,NULL,NULL,NULL,NULL,'297e8c7b455798280145579c73e501c1','2017-03-20 10:01:41','2017-03-20 10:01:41',0,3,'4028838b5ae97036015ae972b6f10003',0,0,NULL,NULL,NULL,NULL,NULL),('4028838b5ae97036015ae972d4b50007','代理商','pub','04','cskefu',NULL,'4028838b5ae97036015ae972b6f10003',NULL,NULL,NULL,NULL,NULL,'297e8c7b455798280145579c73e501c1','2017-03-20 10:01:41','2017-03-20 10:01:41',0,4,'4028838b5ae97036015ae972b6f10003',0,0,NULL,NULL,NULL,NULL,NULL),('4028838b5ae97036015ae972d4bf0008','供货商','pub','05','cskefu',NULL,'4028838b5ae97036015ae972b6f10003',NULL,NULL,NULL,NULL,NULL,'297e8c7b455798280145579c73e501c1','2017-03-20 10:01:41','2017-03-20 10:01:41',0,5,'4028838b5ae97036015ae972b6f10003',0,0,NULL,NULL,NULL,NULL,NULL),('4028838b5ae97036015ae972d4c80009','合作伙伴','pub','06','cskefu',NULL,'4028838b5ae97036015ae972b6f10003',NULL,NULL,NULL,NULL,NULL,'297e8c7b455798280145579c73e501c1','2017-03-20 10:01:41','2017-03-20 10:01:41',0,6,'4028838b5ae97036015ae972b6f10003',0,0,NULL,NULL,NULL,NULL,NULL),('4028838b5ae97036015ae972d4d1000a','其它','pub','07','cskefu',NULL,'4028838b5ae97036015ae972b6f10003',NULL,NULL,NULL,NULL,NULL,'297e8c7b455798280145579c73e501c1','2017-03-20 10:01:41','2017-03-20 10:01:41',0,7,'4028838b5ae97036015ae972b6f10003',0,0,NULL,NULL,NULL,NULL,NULL),('4028838b5ae9ea25015ae9eccbfc0002','客户级别','pub','com.dic.contacts.elevel',NULL,'data','0','',NULL,NULL,NULL,NULL,'297e8c7b455798280145579c73e501c1','2017-03-20 12:14:54',NULL,1,0,NULL,0,0,NULL,NULL,NULL,NULL,NULL),('4028838b5ae9ea25015ae9ee39a20003','★','pub','01','cskefu',NULL,'4028838b5ae9ea25015ae9eccbfc0002',NULL,NULL,NULL,NULL,NULL,'297e8c7b455798280145579c73e501c1','2017-03-20 12:16:28','2017-03-20 12:16:28',0,1,'4028838b5ae9ea25015ae9eccbfc0002',0,0,NULL,NULL,NULL,NULL,NULL),('4028838b5ae9ea25015ae9ee39ac0004','★★','pub','02','cskefu',NULL,'4028838b5ae9ea25015ae9eccbfc0002',NULL,NULL,NULL,NULL,NULL,'297e8c7b455798280145579c73e501c1','2017-03-20 12:16:28','2017-03-20 12:16:28',0,2,'4028838b5ae9ea25015ae9eccbfc0002',0,0,NULL,NULL,NULL,NULL,NULL),('4028838b5ae9ea25015ae9ee39b10005','★★★','pub','03','cskefu',NULL,'4028838b5ae9ea25015ae9eccbfc0002',NULL,NULL,NULL,NULL,NULL,'297e8c7b455798280145579c73e501c1','2017-03-20 12:16:28','2017-03-20 12:16:28',0,3,'4028838b5ae9ea25015ae9eccbfc0002',0,0,NULL,NULL,NULL,NULL,NULL),('4028838b5ae9ea25015ae9ee39c00006','★★★★','pub','04','cskefu',NULL,'4028838b5ae9ea25015ae9eccbfc0002',NULL,NULL,NULL,NULL,NULL,'297e8c7b455798280145579c73e501c1','2017-03-20 12:16:28','2017-03-20 12:16:28',0,4,'4028838b5ae9ea25015ae9eccbfc0002',0,0,NULL,NULL,NULL,NULL,NULL),('4028838b5ae9ea25015ae9ee39c70007','★★★★★','pub','05','cskefu',NULL,'4028838b5ae9ea25015ae9eccbfc0002',NULL,NULL,NULL,NULL,NULL,'297e8c7b455798280145579c73e501c1','2017-03-20 12:16:28','2017-03-20 12:16:28',0,5,'4028838b5ae9ea25015ae9eccbfc0002',0,0,NULL,NULL,NULL,NULL,NULL),('4028838b5ae9f0a1015ae9fb052b0002','客户来源','pub','com.dic.contacts.esource',NULL,'data','0','',NULL,NULL,NULL,NULL,'297e8c7b455798280145579c73e501c1','2017-03-20 12:30:26',NULL,1,0,NULL,0,0,NULL,NULL,NULL,NULL,NULL),('4028838b5ae9f0a1015ae9fb20680003','注册会员','pub','01','cskefu',NULL,'4028838b5ae9f0a1015ae9fb052b0002',NULL,NULL,NULL,NULL,NULL,'297e8c7b455798280145579c73e501c1','2017-03-20 12:30:33','2017-03-20 12:30:33',0,1,'4028838b5ae9f0a1015ae9fb052b0002',0,0,NULL,NULL,NULL,NULL,NULL),('4028838b5ae9f0a1015ae9fb20730004','朋友介绍','pub','02','cskefu',NULL,'4028838b5ae9f0a1015ae9fb052b0002',NULL,NULL,NULL,NULL,NULL,'297e8c7b455798280145579c73e501c1','2017-03-20 12:30:33','2017-03-20 12:30:33',0,2,'4028838b5ae9f0a1015ae9fb052b0002',0,0,NULL,NULL,NULL,NULL,NULL),('4028838b5ae9f0a1015ae9fb20790005','手工录入','pub','03','cskefu',NULL,'4028838b5ae9f0a1015ae9fb052b0002',NULL,NULL,NULL,NULL,NULL,'297e8c7b455798280145579c73e501c1','2017-03-20 12:30:33','2017-03-20 12:30:33',0,3,'4028838b5ae9f0a1015ae9fb052b0002',0,0,NULL,NULL,NULL,NULL,NULL),('4028838b5ae9f0a1015ae9fb20870006','失败客户','pub','04','cskefu',NULL,'4028838b5ae9f0a1015ae9fb052b0002',NULL,NULL,NULL,NULL,NULL,'297e8c7b455798280145579c73e501c1','2017-03-20 12:30:33','2017-03-20 12:30:33',0,4,'4028838b5ae9f0a1015ae9fb052b0002',0,0,NULL,NULL,NULL,NULL,NULL),('4028838b5ae9f0a1015ae9fb208b0007','行业展会','pub','05','cskefu',NULL,'4028838b5ae9f0a1015ae9fb052b0002',NULL,NULL,NULL,NULL,NULL,'297e8c7b455798280145579c73e501c1','2017-03-20 12:30:33','2017-03-20 12:30:33',0,5,'4028838b5ae9f0a1015ae9fb052b0002',0,0,NULL,NULL,NULL,NULL,NULL),('4028838b5ae9f0a1015ae9fb20930008','客户介绍','pub','06','cskefu',NULL,'4028838b5ae9f0a1015ae9fb052b0002',NULL,NULL,NULL,NULL,NULL,'297e8c7b455798280145579c73e501c1','2017-03-20 12:30:33','2017-03-20 12:30:33',0,6,'4028838b5ae9f0a1015ae9fb052b0002',0,0,NULL,NULL,NULL,NULL,NULL),('4028838b5ae9f0a1015ae9fb20980009','电子商务','pub','07','cskefu',NULL,'4028838b5ae9f0a1015ae9fb052b0002',NULL,NULL,NULL,NULL,NULL,'297e8c7b455798280145579c73e501c1','2017-03-20 12:30:33','2017-03-20 12:30:33',0,7,'4028838b5ae9f0a1015ae9fb052b0002',0,0,NULL,NULL,NULL,NULL,NULL),('4028838b5ae9f0a1015ae9fb209c000a','合作伙伴','pub','08','cskefu',NULL,'4028838b5ae9f0a1015ae9fb052b0002',NULL,NULL,NULL,NULL,NULL,'297e8c7b455798280145579c73e501c1','2017-03-20 12:30:33','2017-03-20 12:30:33',0,8,'4028838b5ae9f0a1015ae9fb052b0002',0,0,NULL,NULL,NULL,NULL,NULL),('4028838b5ae9f0a1015ae9fb20a3000b','广告','pub','09','cskefu',NULL,'4028838b5ae9f0a1015ae9fb052b0002',NULL,NULL,NULL,NULL,NULL,'297e8c7b455798280145579c73e501c1','2017-03-20 12:30:33','2017-03-20 12:30:33',0,9,'4028838b5ae9f0a1015ae9fb052b0002',0,0,NULL,NULL,NULL,NULL,NULL),('4028838b5ae9f0a1015ae9fb20aa000c','职员引介','pub','10','cskefu',NULL,'4028838b5ae9f0a1015ae9fb052b0002',NULL,NULL,NULL,NULL,NULL,'297e8c7b455798280145579c73e501c1','2017-03-20 12:30:33','2017-03-20 12:30:33',0,10,'4028838b5ae9f0a1015ae9fb052b0002',0,0,NULL,NULL,NULL,NULL,NULL),('4028838b5ae9f0a1015ae9fb20ae000d','市场活动','pub','11','cskefu',NULL,'4028838b5ae9f0a1015ae9fb052b0002',NULL,NULL,NULL,NULL,NULL,'297e8c7b455798280145579c73e501c1','2017-03-20 12:30:33','2017-03-20 12:30:33',0,11,'4028838b5ae9f0a1015ae9fb052b0002',0,0,NULL,NULL,NULL,NULL,NULL),('4028838b5ae9f0a1015ae9fb20b7000e','公共关系','pub','12','cskefu',NULL,'4028838b5ae9f0a1015ae9fb052b0002',NULL,NULL,NULL,NULL,NULL,'297e8c7b455798280145579c73e501c1','2017-03-20 12:30:33','2017-03-20 12:30:33',0,12,'4028838b5ae9f0a1015ae9fb052b0002',0,0,NULL,NULL,NULL,NULL,NULL),('4028838b5ae9f0a1015ae9fb20bb000f','口头传达','pub','13','cskefu',NULL,'4028838b5ae9f0a1015ae9fb052b0002',NULL,NULL,NULL,NULL,NULL,'297e8c7b455798280145579c73e501c1','2017-03-20 12:30:33','2017-03-20 12:30:33',0,13,'4028838b5ae9f0a1015ae9fb052b0002',0,0,NULL,NULL,NULL,NULL,NULL),('4028838b5ae9f0a1015ae9fb20be0010','研讨会','pub','14','cskefu',NULL,'4028838b5ae9f0a1015ae9fb052b0002',NULL,NULL,NULL,NULL,NULL,'297e8c7b455798280145579c73e501c1','2017-03-20 12:30:33','2017-03-20 12:30:33',0,14,'4028838b5ae9f0a1015ae9fb052b0002',0,0,NULL,NULL,NULL,NULL,NULL),('4028838b5ae9f0a1015ae9fb20c60011','其它','pub','15','cskefu',NULL,'4028838b5ae9f0a1015ae9fb052b0002',NULL,NULL,NULL,NULL,NULL,'297e8c7b455798280145579c73e501c1','2017-03-20 12:30:33','2017-03-20 12:30:33',0,15,'4028838b5ae9f0a1015ae9fb052b0002',0,0,NULL,NULL,NULL,NULL,NULL),('4028838b5aea0e3f015aea127f8d0002','客户成熟度','pub','com.dic.contacts.maturity',NULL,'data','0','',NULL,NULL,NULL,NULL,'297e8c7b455798280145579c73e501c1','2017-03-20 12:56:05',NULL,1,0,NULL,0,0,NULL,NULL,NULL,NULL,NULL),('4028838b5aea0e3f015aea12a3da0003','A+：明确成交意向','pub','01','cskefu',NULL,'4028838b5aea0e3f015aea127f8d0002',NULL,NULL,NULL,NULL,NULL,'297e8c7b455798280145579c73e501c1','2017-03-20 12:56:14','2017-03-20 12:56:14',0,1,'4028838b5aea0e3f015aea127f8d0002',0,0,NULL,NULL,NULL,NULL,NULL),('4028838b5aea0e3f015aea12a3e10004','A-：有初步成交意向','pub','02','cskefu',NULL,'4028838b5aea0e3f015aea127f8d0002',NULL,NULL,NULL,NULL,NULL,'297e8c7b455798280145579c73e501c1','2017-03-20 12:56:14','2017-03-20 12:56:14',0,2,'4028838b5aea0e3f015aea127f8d0002',0,0,NULL,NULL,NULL,NULL,NULL),('4028838b5aea0e3f015aea12a3e90005','B+：关键人有成交意向','pub','03','cskefu',NULL,'4028838b5aea0e3f015aea127f8d0002',NULL,NULL,NULL,NULL,NULL,'297e8c7b455798280145579c73e501c1','2017-03-20 12:56:14','2017-03-20 12:56:14',0,3,'4028838b5aea0e3f015aea127f8d0002',0,0,NULL,NULL,NULL,NULL,NULL),('4028838b5aea0e3f015aea12a3f40006','B-：关键人成交意向不确定','pub','04','cskefu',NULL,'4028838b5aea0e3f015aea127f8d0002',NULL,NULL,NULL,NULL,NULL,'297e8c7b455798280145579c73e501c1','2017-03-20 12:56:14','2017-03-20 12:56:14',0,4,'4028838b5aea0e3f015aea127f8d0002',0,0,NULL,NULL,NULL,NULL,NULL),('4028838b5aea0e3f015aea12a3fa0007','C+：初步联系，有意向','pub','05','cskefu',NULL,'4028838b5aea0e3f015aea127f8d0002',NULL,NULL,NULL,NULL,NULL,'297e8c7b455798280145579c73e501c1','2017-03-20 12:56:14','2017-03-20 12:56:14',0,5,'4028838b5aea0e3f015aea127f8d0002',0,0,NULL,NULL,NULL,NULL,NULL),('4028838b5aea0e3f015aea12a4070008','C-：初步联系，意向不确定','pub','06','cskefu',NULL,'4028838b5aea0e3f015aea127f8d0002',NULL,NULL,NULL,NULL,NULL,'297e8c7b455798280145579c73e501c1','2017-03-20 12:56:14','2017-03-20 12:56:14',0,6,'4028838b5aea0e3f015aea127f8d0002',0,0,NULL,NULL,NULL,NULL,NULL),('4028838b5aea0e3f015aea12a40f0009','D：新建客户','pub','07','cskefu',NULL,'4028838b5aea0e3f015aea127f8d0002',NULL,NULL,NULL,NULL,NULL,'297e8c7b455798280145579c73e501c1','2017-03-20 12:56:14','2017-03-20 12:56:14',0,7,'4028838b5aea0e3f015aea127f8d0002',0,0,NULL,NULL,NULL,NULL,NULL),('4028838b5aea0e3f015aea12a415000a','E：明显拒绝','pub','08','cskefu',NULL,'4028838b5aea0e3f015aea127f8d0002',NULL,NULL,NULL,NULL,NULL,'297e8c7b455798280145579c73e501c1','2017-03-20 12:56:14','2017-03-20 12:56:14',0,8,'4028838b5aea0e3f015aea127f8d0002',0,0,NULL,NULL,NULL,NULL,NULL),('4028838b5aea0e3f015aea12a41d000b','F：无效客户','pub','09','cskefu',NULL,'4028838b5aea0e3f015aea127f8d0002',NULL,NULL,NULL,NULL,NULL,'297e8c7b455798280145579c73e501c1','2017-03-20 12:56:14','2017-03-20 12:56:14',0,9,'4028838b5aea0e3f015aea127f8d0002',0,0,NULL,NULL,NULL,NULL,NULL),('4028838b5aea0e3f015aea30c4ae0015','客户行业','pub','com.dic.contacts.industry',NULL,'data','0','',NULL,NULL,NULL,NULL,'297e8c7b455798280145579c73e501c1','2017-03-20 13:29:09',NULL,1,0,NULL,0,0,NULL,NULL,NULL,NULL,NULL),('4028838b5aea0e3f015aea30de4a0016','机械及行业设备','pub','01','cskefu',NULL,'4028838b5aea0e3f015aea30c4ae0015',NULL,NULL,NULL,NULL,NULL,'297e8c7b455798280145579c73e501c1','2017-03-20 13:29:15','2017-03-20 13:29:15',0,1,'4028838b5aea0e3f015aea30c4ae0015',0,0,NULL,NULL,NULL,NULL,NULL),('4028838b5aea0e3f015aea30de5b0017','电子元器件','pub','02','cskefu',NULL,'4028838b5aea0e3f015aea30c4ae0015',NULL,NULL,NULL,NULL,NULL,'297e8c7b455798280145579c73e501c1','2017-03-20 13:29:15','2017-03-20 13:29:15',0,2,'4028838b5aea0e3f015aea30c4ae0015',0,0,NULL,NULL,NULL,NULL,NULL),('4028838b5aea0e3f015aea30de6c0018','礼品、工艺品、饰品','pub','03','cskefu',NULL,'4028838b5aea0e3f015aea30c4ae0015',NULL,NULL,NULL,NULL,NULL,'297e8c7b455798280145579c73e501c1','2017-03-20 13:29:15','2017-03-20 13:29:15',0,3,'4028838b5aea0e3f015aea30c4ae0015',0,0,NULL,NULL,NULL,NULL,NULL),('4028838b5aea0e3f015aea30de7a0019','家居用品','pub','04','cskefu',NULL,'4028838b5aea0e3f015aea30c4ae0015',NULL,NULL,NULL,NULL,NULL,'297e8c7b455798280145579c73e501c1','2017-03-20 13:29:15','2017-03-20 13:29:15',0,4,'4028838b5aea0e3f015aea30c4ae0015',0,0,NULL,NULL,NULL,NULL,NULL),('4028838b5aea0e3f015aea30de85001a','电工电气','pub','05','cskefu',NULL,'4028838b5aea0e3f015aea30c4ae0015',NULL,NULL,NULL,NULL,NULL,'297e8c7b455798280145579c73e501c1','2017-03-20 13:29:15','2017-03-20 13:29:15',0,5,'4028838b5aea0e3f015aea30c4ae0015',0,0,NULL,NULL,NULL,NULL,NULL),('4028838b5aea0e3f015aea30de94001b','建筑、建材','pub','06','cskefu',NULL,'4028838b5aea0e3f015aea30c4ae0015',NULL,NULL,NULL,NULL,NULL,'297e8c7b455798280145579c73e501c1','2017-03-20 13:29:15','2017-03-20 13:29:15',0,6,'4028838b5aea0e3f015aea30c4ae0015',0,0,NULL,NULL,NULL,NULL,NULL),('4028838b5aea0e3f015aea30dea4001c','五金、工具','pub','07','cskefu',NULL,'4028838b5aea0e3f015aea30c4ae0015',NULL,NULL,NULL,NULL,NULL,'297e8c7b455798280145579c73e501c1','2017-03-20 13:29:15','2017-03-20 13:29:15',0,7,'4028838b5aea0e3f015aea30c4ae0015',0,0,NULL,NULL,NULL,NULL,NULL),('4028838b5aea0e3f015aea30deb3001d','纺织、皮革','pub','08','cskefu',NULL,'4028838b5aea0e3f015aea30c4ae0015',NULL,NULL,NULL,NULL,NULL,'297e8c7b455798280145579c73e501c1','2017-03-20 13:29:15','2017-03-20 13:29:15',0,8,'4028838b5aea0e3f015aea30c4ae0015',0,0,NULL,NULL,NULL,NULL,NULL),('4028838b5aea0e3f015aea30dec0001e','包装','pub','09','cskefu',NULL,'4028838b5aea0e3f015aea30c4ae0015',NULL,NULL,NULL,NULL,NULL,'297e8c7b455798280145579c73e501c1','2017-03-20 13:29:15','2017-03-20 13:29:15',0,9,'4028838b5aea0e3f015aea30c4ae0015',0,0,NULL,NULL,NULL,NULL,NULL),('4028838b5aea0e3f015aea30decd001f','橡塑','pub','10','cskefu',NULL,'4028838b5aea0e3f015aea30c4ae0015',NULL,NULL,NULL,NULL,NULL,'297e8c7b455798280145579c73e501c1','2017-03-20 13:29:15','2017-03-20 13:29:15',0,10,'4028838b5aea0e3f015aea30c4ae0015',0,0,NULL,NULL,NULL,NULL,NULL),('4028838b5aea0e3f015aea30dedb0020','化工','pub','11','cskefu',NULL,'4028838b5aea0e3f015aea30c4ae0015',NULL,NULL,NULL,NULL,NULL,'297e8c7b455798280145579c73e501c1','2017-03-20 13:29:15','2017-03-20 13:29:15',0,11,'4028838b5aea0e3f015aea30c4ae0015',0,0,NULL,NULL,NULL,NULL,NULL),('4028838b5aea0e3f015aea30dee90021','服装','pub','12','cskefu',NULL,'4028838b5aea0e3f015aea30c4ae0015',NULL,NULL,NULL,NULL,NULL,'297e8c7b455798280145579c73e501c1','2017-03-20 13:29:15','2017-03-20 13:29:15',0,12,'4028838b5aea0e3f015aea30c4ae0015',0,0,NULL,NULL,NULL,NULL,NULL),('4028838b5aea0e3f015aea30defd0022','办公、文教','pub','13','cskefu',NULL,'4028838b5aea0e3f015aea30c4ae0015',NULL,NULL,NULL,NULL,NULL,'297e8c7b455798280145579c73e501c1','2017-03-20 13:29:15','2017-03-20 13:29:15',0,13,'4028838b5aea0e3f015aea30c4ae0015',0,0,NULL,NULL,NULL,NULL,NULL),('4028838b5aea0e3f015aea30df100023','冶金矿产','pub','14','cskefu',NULL,'4028838b5aea0e3f015aea30c4ae0015',NULL,NULL,NULL,NULL,NULL,'297e8c7b455798280145579c73e501c1','2017-03-20 13:29:15','2017-03-20 13:29:15',0,14,'4028838b5aea0e3f015aea30c4ae0015',0,0,NULL,NULL,NULL,NULL,NULL),('4028838b5aea0e3f015aea30df1e0024','数码、电脑','pub','15','cskefu',NULL,'4028838b5aea0e3f015aea30c4ae0015',NULL,NULL,NULL,NULL,NULL,'297e8c7b455798280145579c73e501c1','2017-03-20 13:29:15','2017-03-20 13:29:15',0,15,'4028838b5aea0e3f015aea30c4ae0015',0,0,NULL,NULL,NULL,NULL,NULL),('4028838b5aea0e3f015aea30df280025','服饰','pub','16','cskefu',NULL,'4028838b5aea0e3f015aea30c4ae0015',NULL,NULL,NULL,NULL,NULL,'297e8c7b455798280145579c73e501c1','2017-03-20 13:29:15','2017-03-20 13:29:15',0,16,'4028838b5aea0e3f015aea30c4ae0015',0,0,NULL,NULL,NULL,NULL,NULL),('4028838b5aea0e3f015aea30df340026','运动、休闲','pub','17','cskefu',NULL,'4028838b5aea0e3f015aea30c4ae0015',NULL,NULL,NULL,NULL,NULL,'297e8c7b455798280145579c73e501c1','2017-03-20 13:29:15','2017-03-20 13:29:15',0,17,'4028838b5aea0e3f015aea30c4ae0015',0,0,NULL,NULL,NULL,NULL,NULL),('4028838b5aea0e3f015aea30df3e0027','传媒、广电','pub','18','cskefu',NULL,'4028838b5aea0e3f015aea30c4ae0015',NULL,NULL,NULL,NULL,NULL,'297e8c7b455798280145579c73e501c1','2017-03-20 13:29:15','2017-03-20 13:29:15',0,18,'4028838b5aea0e3f015aea30c4ae0015',0,0,NULL,NULL,NULL,NULL,NULL),('4028838b5aea0e3f015aea30df480028','精细化学品','pub','19','cskefu',NULL,'4028838b5aea0e3f015aea30c4ae0015',NULL,NULL,NULL,NULL,NULL,'297e8c7b455798280145579c73e501c1','2017-03-20 13:29:15','2017-03-20 13:29:15',0,19,'4028838b5aea0e3f015aea30c4ae0015',0,0,NULL,NULL,NULL,NULL,NULL),('4028838b5aea0e3f015aea30df530029','安全、防护','pub','20','cskefu',NULL,'4028838b5aea0e3f015aea30c4ae0015',NULL,NULL,NULL,NULL,NULL,'297e8c7b455798280145579c73e501c1','2017-03-20 13:29:15','2017-03-20 13:29:15',0,20,'4028838b5aea0e3f015aea30c4ae0015',0,0,NULL,NULL,NULL,NULL,NULL),('4028838b5aea0e3f015aea30df5d002a','照明工业','pub','21','cskefu',NULL,'4028838b5aea0e3f015aea30c4ae0015',NULL,NULL,NULL,NULL,NULL,'297e8c7b455798280145579c73e501c1','2017-03-20 13:29:15','2017-03-20 13:29:15',0,21,'4028838b5aea0e3f015aea30c4ae0015',0,0,NULL,NULL,NULL,NULL,NULL),('4028838b5aea0e3f015aea30df69002b','仪器仪表','pub','22','cskefu',NULL,'4028838b5aea0e3f015aea30c4ae0015',NULL,NULL,NULL,NULL,NULL,'297e8c7b455798280145579c73e501c1','2017-03-20 13:29:15','2017-03-20 13:29:15',0,22,'4028838b5aea0e3f015aea30c4ae0015',0,0,NULL,NULL,NULL,NULL,NULL),('4028838b5aea0e3f015aea30df74002c','农业','pub','23','cskefu',NULL,'4028838b5aea0e3f015aea30c4ae0015',NULL,NULL,NULL,NULL,NULL,'297e8c7b455798280145579c73e501c1','2017-03-20 13:29:15','2017-03-20 13:29:15',0,23,'4028838b5aea0e3f015aea30c4ae0015',0,0,NULL,NULL,NULL,NULL,NULL),('4028838b5aea0e3f015aea30df7e002d','汽摩及配件','pub','24','cskefu',NULL,'4028838b5aea0e3f015aea30c4ae0015',NULL,NULL,NULL,NULL,NULL,'297e8c7b455798280145579c73e501c1','2017-03-20 13:29:15','2017-03-20 13:29:15',0,24,'4028838b5aea0e3f015aea30c4ae0015',0,0,NULL,NULL,NULL,NULL,NULL),('4028838b5aea0e3f015aea30df88002e','通信产品','pub','25','cskefu',NULL,'4028838b5aea0e3f015aea30c4ae0015',NULL,NULL,NULL,NULL,NULL,'297e8c7b455798280145579c73e501c1','2017-03-20 13:29:15','2017-03-20 13:29:15',0,25,'4028838b5aea0e3f015aea30c4ae0015',0,0,NULL,NULL,NULL,NULL,NULL),('4028838b5aea0e3f015aea30df92002f','环保','pub','26','cskefu',NULL,'4028838b5aea0e3f015aea30c4ae0015',NULL,NULL,NULL,NULL,NULL,'297e8c7b455798280145579c73e501c1','2017-03-20 13:29:15','2017-03-20 13:29:15',0,26,'4028838b5aea0e3f015aea30c4ae0015',0,0,NULL,NULL,NULL,NULL,NULL),('4028838b5aea0e3f015aea30df9d0030','食品、饮料','pub','27','cskefu',NULL,'4028838b5aea0e3f015aea30c4ae0015',NULL,NULL,NULL,NULL,NULL,'297e8c7b455798280145579c73e501c1','2017-03-20 13:29:15','2017-03-20 13:29:15',0,27,'4028838b5aea0e3f015aea30c4ae0015',0,0,NULL,NULL,NULL,NULL,NULL),('4028838b5aea0e3f015aea30dfa70031','加工','pub','28','cskefu',NULL,'4028838b5aea0e3f015aea30c4ae0015',NULL,NULL,NULL,NULL,NULL,'297e8c7b455798280145579c73e501c1','2017-03-20 13:29:15','2017-03-20 13:29:15',0,28,'4028838b5aea0e3f015aea30c4ae0015',0,0,NULL,NULL,NULL,NULL,NULL),('4028838b5aea0e3f015aea30dfb20032','玩具','pub','29','cskefu',NULL,'4028838b5aea0e3f015aea30c4ae0015',NULL,NULL,NULL,NULL,NULL,'297e8c7b455798280145579c73e501c1','2017-03-20 13:29:15','2017-03-20 13:29:15',0,29,'4028838b5aea0e3f015aea30c4ae0015',0,0,NULL,NULL,NULL,NULL,NULL),('4028838b5aea0e3f015aea30dfc30033','家用电器','pub','30','cskefu',NULL,'4028838b5aea0e3f015aea30c4ae0015',NULL,NULL,NULL,NULL,NULL,'297e8c7b455798280145579c73e501c1','2017-03-20 13:29:15','2017-03-20 13:29:15',0,30,'4028838b5aea0e3f015aea30c4ae0015',0,0,NULL,NULL,NULL,NULL,NULL),('4028838b5aea0e3f015aea30dfcf0034','交通运输','pub','31','cskefu',NULL,'4028838b5aea0e3f015aea30c4ae0015',NULL,NULL,NULL,NULL,NULL,'297e8c7b455798280145579c73e501c1','2017-03-20 13:29:15','2017-03-20 13:29:15',0,31,'4028838b5aea0e3f015aea30c4ae0015',0,0,NULL,NULL,NULL,NULL,NULL),('4028838b5aea0e3f015aea30dfda0035','医药、保养','pub','32','cskefu',NULL,'4028838b5aea0e3f015aea30c4ae0015',NULL,NULL,NULL,NULL,NULL,'297e8c7b455798280145579c73e501c1','2017-03-20 13:29:15','2017-03-20 13:29:15',0,32,'4028838b5aea0e3f015aea30c4ae0015',0,0,NULL,NULL,NULL,NULL,NULL),('4028838b5aea0e3f015aea30dfe60036','商务服务','pub','33','cskefu',NULL,'4028838b5aea0e3f015aea30c4ae0015',NULL,NULL,NULL,NULL,NULL,'297e8c7b455798280145579c73e501c1','2017-03-20 13:29:15','2017-03-20 13:29:15',0,33,'4028838b5aea0e3f015aea30c4ae0015',0,0,NULL,NULL,NULL,NULL,NULL),('4028838b5aea0e3f015aea30dff10037','印刷','pub','34','cskefu',NULL,'4028838b5aea0e3f015aea30c4ae0015',NULL,NULL,NULL,NULL,NULL,'297e8c7b455798280145579c73e501c1','2017-03-20 13:29:16','2017-03-20 13:29:16',0,34,'4028838b5aea0e3f015aea30c4ae0015',0,0,NULL,NULL,NULL,NULL,NULL),('4028838b5aea0e3f015aea30dffb0038','能源','pub','35','cskefu',NULL,'4028838b5aea0e3f015aea30c4ae0015',NULL,NULL,NULL,NULL,NULL,'297e8c7b455798280145579c73e501c1','2017-03-20 13:29:16','2017-03-20 13:29:16',0,35,'4028838b5aea0e3f015aea30c4ae0015',0,0,NULL,NULL,NULL,NULL,NULL),('4028838b5aea0e3f015aea30e0050039','代理','pub','36','cskefu',NULL,'4028838b5aea0e3f015aea30c4ae0015',NULL,NULL,NULL,NULL,NULL,'297e8c7b455798280145579c73e501c1','2017-03-20 13:29:16','2017-03-20 13:29:16',0,36,'4028838b5aea0e3f015aea30c4ae0015',0,0,NULL,NULL,NULL,NULL,NULL),('4028838b5aea0e3f015aea30e00f003a','纸业','pub','37','cskefu',NULL,'4028838b5aea0e3f015aea30c4ae0015',NULL,NULL,NULL,NULL,NULL,'297e8c7b455798280145579c73e501c1','2017-03-20 13:29:16','2017-03-20 13:29:16',0,37,'4028838b5aea0e3f015aea30c4ae0015',0,0,NULL,NULL,NULL,NULL,NULL),('4028838b5aea0e3f015aea30e019003b','其它行业','pub','38','cskefu',NULL,'4028838b5aea0e3f015aea30c4ae0015',NULL,NULL,NULL,NULL,NULL,'297e8c7b455798280145579c73e501c1','2017-03-20 13:29:16','2017-03-20 13:29:16',0,38,'4028838b5aea0e3f015aea30c4ae0015',0,0,NULL,NULL,NULL,NULL,NULL),('4028838b5aea0e3f015aea31cd51003c','客户状态','pub','com.dic.contacts.validstatus',NULL,'data','0','',NULL,NULL,NULL,NULL,'297e8c7b455798280145579c73e501c1','2017-03-20 13:30:16',NULL,1,0,NULL,0,0,NULL,NULL,NULL,NULL,NULL),('4028838b5aea0e3f015aea324228003d','潜在客户','pub','01','cskefu',NULL,'4028838b5aea0e3f015aea31cd51003c',NULL,NULL,NULL,NULL,NULL,'297e8c7b455798280145579c73e501c1','2017-03-20 13:30:46','2017-03-20 13:30:46',0,1,'4028838b5aea0e3f015aea31cd51003c',0,0,NULL,NULL,NULL,NULL,NULL),('4028838b5aea0e3f015aea324239003e','意向客户','pub','02','cskefu',NULL,'4028838b5aea0e3f015aea31cd51003c',NULL,NULL,NULL,NULL,NULL,'297e8c7b455798280145579c73e501c1','2017-03-20 13:30:46','2017-03-20 13:30:46',0,2,'4028838b5aea0e3f015aea31cd51003c',0,0,NULL,NULL,NULL,NULL,NULL),('4028838b5aea0e3f015aea324245003f','成交客户','pub','03','cskefu',NULL,'4028838b5aea0e3f015aea31cd51003c',NULL,NULL,NULL,NULL,NULL,'297e8c7b455798280145579c73e501c1','2017-03-20 13:30:46','2017-03-20 13:30:46',0,3,'4028838b5aea0e3f015aea31cd51003c',0,0,NULL,NULL,NULL,NULL,NULL),('4028838b5aea0e3f015aea3242520040','失败客户','pub','04','cskefu',NULL,'4028838b5aea0e3f015aea31cd51003c',NULL,NULL,NULL,NULL,NULL,'297e8c7b455798280145579c73e501c1','2017-03-20 13:30:46','2017-03-20 13:30:46',0,4,'4028838b5aea0e3f015aea31cd51003c',0,0,NULL,NULL,NULL,NULL,NULL),('4028838b5aea0e3f015aea3242600041','已流失客户','pub','05','cskefu',NULL,'4028838b5aea0e3f015aea31cd51003c',NULL,NULL,NULL,NULL,NULL,'297e8c7b455798280145579c73e501c1','2017-03-20 13:30:46','2017-03-20 13:30:46',0,5,'4028838b5aea0e3f015aea31cd51003c',0,0,NULL,NULL,NULL,NULL,NULL),('4028838b5aeba14b015aebbbceea0008','三沙市','pub','460300','cskefu',NULL,'297e1e874f83129d014f832155f300d7',NULL,NULL,NULL,NULL,NULL,'297e8c7b455798280145579c73e501c1','2017-03-20 20:40:38','2017-03-20 20:40:38',0,1,'297e1e874f83129d014f832090e200b8',0,0,NULL,NULL,NULL,NULL,NULL),('4028838b5af1047e015af13e30a70002','联系人类型','pub','com.dic.contacts.ckind',NULL,'data','0','',NULL,NULL,NULL,NULL,'297e8c7b455798280145579c73e501c1','2017-03-21 22:21:09',NULL,1,0,NULL,0,0,NULL,NULL,NULL,NULL,NULL),('4028838b5af1047e015af140df150003','客户','pub','01','cskefu',NULL,'4028838b5af1047e015af13e30a70002',NULL,NULL,NULL,NULL,NULL,'297e8c7b455798280145579c73e501c1','2017-03-21 22:24:04','2017-03-21 22:24:04',0,1,'4028838b5af1047e015af13e30a70002',0,0,NULL,NULL,NULL,NULL,NULL),('4028838b5af1047e015af140df2e0004','合作伙伴','pub','02','cskefu',NULL,'4028838b5af1047e015af13e30a70002',NULL,NULL,NULL,NULL,NULL,'297e8c7b455798280145579c73e501c1','2017-03-21 22:24:04','2017-03-21 22:24:04',0,2,'4028838b5af1047e015af13e30a70002',0,0,NULL,NULL,NULL,NULL,NULL),('4028838b5af1047e015af140df3e0005','集成商','pub','03','cskefu',NULL,'4028838b5af1047e015af13e30a70002',NULL,NULL,NULL,NULL,NULL,'297e8c7b455798280145579c73e501c1','2017-03-21 22:24:04','2017-03-21 22:24:04',0,3,'4028838b5af1047e015af13e30a70002',0,0,NULL,NULL,NULL,NULL,NULL),('4028838b5af1047e015af140df600006','渠道','pub','04','cskefu',NULL,'4028838b5af1047e015af13e30a70002',NULL,NULL,NULL,NULL,NULL,'297e8c7b455798280145579c73e501c1','2017-03-21 22:24:04','2017-03-21 22:24:04',0,4,'4028838b5af1047e015af13e30a70002',0,0,NULL,NULL,NULL,NULL,NULL),('4028838b5af1047e015af140df710007','供应商','pub','05','cskefu',NULL,'4028838b5af1047e015af13e30a70002',NULL,NULL,NULL,NULL,NULL,'297e8c7b455798280145579c73e501c1','2017-03-21 22:24:04','2017-03-21 22:24:04',0,5,'4028838b5af1047e015af13e30a70002',0,0,NULL,NULL,NULL,NULL,NULL),('4028838b5af1047e015af140df800008','分销商','pub','06','cskefu',NULL,'4028838b5af1047e015af13e30a70002',NULL,NULL,NULL,NULL,NULL,'297e8c7b455798280145579c73e501c1','2017-03-21 22:24:04','2017-03-21 22:24:04',0,6,'4028838b5af1047e015af13e30a70002',0,0,NULL,NULL,NULL,NULL,NULL),('4028838b5af1047e015af140df900009','其他','pub','07','cskefu',NULL,'4028838b5af1047e015af13e30a70002',NULL,NULL,NULL,NULL,NULL,'297e8c7b455798280145579c73e501c1','2017-03-21 22:24:04','2017-03-21 22:24:04',0,7,'4028838b5af1047e015af13e30a70002',0,0,NULL,NULL,NULL,NULL,NULL),('4028838b5b55e572015b56513ef90002','工单状态','pub','com.dic.workorders.status',NULL,'data','0','',NULL,NULL,NULL,NULL,'297e8c7b455798280145579c73e501c1','2017-04-10 13:23:36',NULL,1,0,NULL,0,0,NULL,NULL,NULL,NULL,NULL),('4028838b5b55e572015b565262200003','未受理','pub','01','cskefu','layui-icon','4028838b5b55e572015b56513ef90002','',NULL,'','#32c24d',NULL,'297e8c7b455798280145579c73e501c1','2017-04-10 13:24:51','2017-04-10 13:24:51',0,1,'4028838b5b55e572015b56513ef90002',0,0,NULL,NULL,NULL,NULL,NULL),('4028838b5b55e572015b5652626e0006','已回复','pub','04','cskefu','layui-icon','4028838b5b55e572015b56513ef90002','',NULL,'','#1E9FFF',NULL,'297e8c7b455798280145579c73e501c1','2017-04-10 13:24:51','2017-04-10 13:24:51',0,4,'4028838b5b55e572015b56513ef90002',0,0,NULL,NULL,NULL,NULL,NULL),('4028838b5b55e572015b5652628e0008','已关闭','pub','uckefu_workorders_closed','cskefu','layui-icon','4028838b5b55e572015b56513ef90002','',NULL,'','#FF5722',NULL,'297e8c7b455798280145579c73e501c1','2017-04-10 13:24:51','2017-04-10 13:24:51',0,6,'4028838b5b55e572015b56513ef90002',0,1,NULL,NULL,NULL,NULL,NULL),('4028838b5b565caf015b56645f320003','再追问','pub','07','cskefu','layui-icon','4028838b5b55e572015b56513ef90002','',NULL,'','#F7B824',NULL,'297e8c7b455798280145579c73e501c1','2017-04-10 13:44:30',NULL,1,0,'4028838b5b55e572015b56513ef90002',0,0,NULL,NULL,NULL,NULL,NULL),('4028838b5b565caf015b566536480004','工单类型','pub','com.dic.workorders.type',NULL,'data','0','',NULL,NULL,NULL,NULL,'297e8c7b455798280145579c73e501c1','2017-04-10 13:45:25',NULL,1,0,NULL,0,0,NULL,NULL,NULL,NULL,NULL),('4028838b5b565caf015b5665e5a30005','投诉','pub','01','cskefu',NULL,'4028838b5b565caf015b566536480004',NULL,NULL,NULL,NULL,NULL,'297e8c7b455798280145579c73e501c1','2017-04-10 13:46:10','2017-04-10 13:46:10',0,1,'4028838b5b565caf015b566536480004',0,0,NULL,NULL,NULL,NULL,NULL),('4028838b5b565caf015b5665e5b90006','问题','pub','02','cskefu',NULL,'4028838b5b565caf015b566536480004',NULL,NULL,NULL,NULL,NULL,'297e8c7b455798280145579c73e501c1','2017-04-10 13:46:10','2017-04-10 13:46:10',0,2,'4028838b5b565caf015b566536480004',0,0,NULL,NULL,NULL,NULL,NULL),('4028838b5b565caf015b5665e5df0007','咨询','pub','03','cskefu',NULL,'4028838b5b565caf015b566536480004',NULL,NULL,NULL,NULL,NULL,'297e8c7b455798280145579c73e501c1','2017-04-10 13:46:10','2017-04-10 13:46:10',0,3,'4028838b5b565caf015b566536480004',0,0,NULL,NULL,NULL,NULL,NULL),('4028838b5b565caf015b5665e5ec0008','故障','pub','04','cskefu',NULL,'4028838b5b565caf015b566536480004',NULL,NULL,NULL,NULL,NULL,'297e8c7b455798280145579c73e501c1','2017-04-10 13:46:10','2017-04-10 13:46:10',0,4,'4028838b5b565caf015b566536480004',0,0,NULL,NULL,NULL,NULL,NULL),('4028838b5b565caf015b5665e5fa0009','任务','pub','05','cskefu',NULL,'4028838b5b565caf015b566536480004',NULL,NULL,NULL,NULL,NULL,'297e8c7b455798280145579c73e501c1','2017-04-10 13:46:10','2017-04-10 13:46:10',0,5,'4028838b5b565caf015b566536480004',0,0,NULL,NULL,NULL,NULL,NULL),('4028838b5b565caf015b5665e608000a','回访','pub','06','cskefu',NULL,'4028838b5b565caf015b566536480004',NULL,NULL,NULL,NULL,NULL,'297e8c7b455798280145579c73e501c1','2017-04-10 13:46:10','2017-04-10 13:46:10',0,6,'4028838b5b565caf015b566536480004',0,0,NULL,NULL,NULL,NULL,NULL),('4028838b5b565caf015b56683247000b','工单优先级','pub','com.dic.workorders.priority',NULL,'data','0','',NULL,NULL,NULL,NULL,'297e8c7b455798280145579c73e501c1','2017-04-10 13:48:40',NULL,1,0,NULL,0,0,NULL,NULL,NULL,NULL,NULL),('4028838b5b565caf015b56688fe3000c','低','pub','01','cskefu','layui-icon','4028838b5b565caf015b56683247000b','',NULL,'','#5FB878',NULL,'297e8c7b455798280145579c73e501c1','2017-04-10 13:49:04','2017-04-10 13:49:04',0,1,'4028838b5b565caf015b56683247000b',0,0,NULL,NULL,NULL,NULL,NULL),('4028838b5b565caf015b56688ff5000d','中','pub','02','cskefu','layui-icon','4028838b5b565caf015b56683247000b','',NULL,'','#1E9FFF',NULL,'297e8c7b455798280145579c73e501c1','2017-04-10 13:49:04','2017-04-10 13:49:04',0,2,'4028838b5b565caf015b56683247000b',0,0,NULL,NULL,NULL,NULL,NULL),('4028838b5b565caf015b56689005000e','高','pub','03','cskefu','layui-icon','4028838b5b565caf015b56683247000b','',NULL,'','#F7B824',NULL,'297e8c7b455798280145579c73e501c1','2017-04-10 13:49:04','2017-04-10 13:49:04',0,3,'4028838b5b565caf015b56683247000b',0,0,NULL,NULL,NULL,NULL,NULL),('4028838b5b565caf015b56689012000f','紧急','pub','04','cskefu','layui-icon','4028838b5b565caf015b56683247000b','',NULL,'','#FF5722',NULL,'297e8c7b455798280145579c73e501c1','2017-04-10 13:49:04','2017-04-10 13:49:04',0,4,'4028838b5b565caf015b56683247000b',0,0,NULL,NULL,NULL,NULL,NULL),('4028838b5b565caf015b566d11d80010','标签类型','pub','com.dic.tag.type',NULL,'data','0','',NULL,NULL,NULL,NULL,'297e8c7b455798280145579c73e501c1','2017-04-10 13:54:00',NULL,1,0,NULL,0,0,NULL,NULL,NULL,NULL,NULL),('4028838b5b565caf015b566de3180011','联系人','pub','user','cskefu','layui-icon','4028838b5b565caf015b566d11d80010','',NULL,'','',NULL,'297e8c7b455798280145579c73e501c1','2017-04-10 13:54:53','2017-04-10 13:54:53',0,1,'4028838b5b565caf015b566d11d80010',0,0,NULL,NULL,NULL,NULL,NULL),('4028838b5b565caf015b566de32a0012','工单','pub','workorders','cskefu','layui-icon','4028838b5b565caf015b566d11d80010','',NULL,'','',NULL,'297e8c7b455798280145579c73e501c1','2017-04-10 13:54:53','2017-04-10 13:54:53',0,2,'4028838b5b565caf015b566d11d80010',0,0,NULL,NULL,NULL,NULL,NULL),('402888815c2e2f66015c2f07827e0002','智能机器人输入条件','pub','com.dic.xiaoe.input',NULL,'data','0','',NULL,NULL,NULL,NULL,'297e8c7b455798280145579c73e501c1','2017-05-22 15:20:40',NULL,1,0,NULL,0,0,NULL,NULL,NULL,NULL,NULL),('402888815c2e2f66015c2f07c6190003','智能机器人输出条件','pub','com.dic.xiaoe.output',NULL,'data','0','',NULL,NULL,NULL,NULL,'297e8c7b455798280145579c73e501c1','2017-05-22 15:20:57',NULL,1,0,NULL,0,0,NULL,NULL,NULL,NULL,NULL),('402888815c2e2f66015c2f083d010004','姓名','pub','01','cskefu',NULL,'402888815c2e2f66015c2f07827e0002',NULL,NULL,NULL,NULL,NULL,'297e8c7b455798280145579c73e501c1','2017-05-22 15:21:28','2017-05-22 15:21:28',0,1,'402888815c2e2f66015c2f07827e0002',0,0,NULL,NULL,NULL,NULL,NULL),('402888815c2e2f66015c2f083d180005','性别','pub','02','cskefu',NULL,'402888815c2e2f66015c2f07827e0002',NULL,NULL,NULL,NULL,NULL,'297e8c7b455798280145579c73e501c1','2017-05-22 15:21:28','2017-05-22 15:21:28',0,2,'402888815c2e2f66015c2f07827e0002',0,0,NULL,NULL,NULL,NULL,NULL),('402888815c2e2f66015c2f083d250006','年龄','pub','03','cskefu',NULL,'402888815c2e2f66015c2f07827e0002',NULL,NULL,NULL,NULL,NULL,'297e8c7b455798280145579c73e501c1','2017-05-22 15:21:28','2017-05-22 15:21:28',0,3,'402888815c2e2f66015c2f07827e0002',0,0,NULL,NULL,NULL,NULL,NULL),('402888815c2e2f66015c2f087e510007','姓名','pub','01','cskefu',NULL,'402888815c2e2f66015c2f07c6190003',NULL,NULL,NULL,NULL,NULL,'297e8c7b455798280145579c73e501c1','2017-05-22 15:21:44','2017-05-22 15:21:44',0,1,'402888815c2e2f66015c2f07c6190003',0,0,NULL,NULL,NULL,NULL,NULL),('402888815c2e2f66015c2f087e660008','年龄','pub','02','cskefu',NULL,'402888815c2e2f66015c2f07c6190003',NULL,NULL,NULL,NULL,NULL,'297e8c7b455798280145579c73e501c1','2017-05-22 15:21:44','2017-05-22 15:21:44',0,2,'402888815c2e2f66015c2f07c6190003',0,0,NULL,NULL,NULL,NULL,NULL),('402888815cb3fa3b015cb3fe31410001','呼叫中心分机类型','pub','com.dic.callcenter.extype',NULL,'data','0','',NULL,NULL,NULL,NULL,'297e8c7b455798280145579c73e501c1','2017-06-17 10:59:59',NULL,1,0,NULL,0,0,NULL,NULL,NULL,NULL,NULL),('402888815cb3fa3b015cb3ff6f810002','直线','pub','01','cskefu',NULL,'402888815cb3fa3b015cb3fe31410001',NULL,NULL,NULL,NULL,NULL,'297e8c7b455798280145579c73e501c1','2017-06-17 11:01:20','2017-06-17 11:01:20',0,1,'402888815cb3fa3b015cb3fe31410001',0,0,NULL,NULL,NULL,NULL,NULL),('402888815cb3fa3b015cb3ff6f8e0003','IVR','pub','02','cskefu',NULL,'402888815cb3fa3b015cb3fe31410001',NULL,NULL,NULL,NULL,NULL,'297e8c7b455798280145579c73e501c1','2017-06-17 11:01:20','2017-06-17 11:01:20',0,2,'402888815cb3fa3b015cb3fe31410001',0,0,NULL,NULL,NULL,NULL,NULL),('402888815cb3fa3b015cb3ff6f9a0004','技能组','pub','03','cskefu',NULL,'402888815cb3fa3b015cb3fe31410001',NULL,NULL,NULL,NULL,NULL,'297e8c7b455798280145579c73e501c1','2017-06-17 11:01:20','2017-06-17 11:01:20',0,3,'402888815cb3fa3b015cb3fe31410001',0,0,NULL,NULL,NULL,NULL,NULL),('402888815cb3fa3b015cb3ff6fa90005','会议','pub','04','cskefu',NULL,'402888815cb3fa3b015cb3fe31410001',NULL,NULL,NULL,NULL,NULL,'297e8c7b455798280145579c73e501c1','2017-06-17 11:01:20','2017-06-17 11:01:20',0,4,'402888815cb3fa3b015cb3fe31410001',0,0,NULL,NULL,NULL,NULL,NULL),('402888815cb3fa3b015cb3ff6fb30006','队列','pub','05','cskefu',NULL,'402888815cb3fa3b015cb3fe31410001',NULL,NULL,NULL,NULL,NULL,'297e8c7b455798280145579c73e501c1','2017-06-17 11:01:20','2017-06-17 11:01:20',0,5,'402888815cb3fa3b015cb3fe31410001',0,0,NULL,NULL,NULL,NULL,NULL),('402888815cf217cd015cf219f9f80002','呼叫中心服务类型','pub','ccsummary','cskefu','layui-icon','4028838b5b565caf015b566d11d80010','',NULL,'','',NULL,'297e8c7b455798280145579c73e501c1','2017-06-29 12:26:47',NULL,1,0,'4028838b5b565caf015b566d11d80010',0,0,NULL,NULL,NULL,NULL,NULL),('402888815d2fe37f015d2fe75cc80002','系统权限资源数据','pub','com.dic.auth.resource',NULL,'auth','0','系统权限资源数据',NULL,NULL,NULL,NULL,'297e8c7b455798280145579c73e501c1','2017-07-11 12:27:58',NULL,1,0,NULL,0,0,NULL,NULL,NULL,NULL,NULL),('402888815d89b1aa015d89b318ab0002','知识库知识','pub','kbs','cskefu','layui-icon','4028838b5b565caf015b566d11d80010','',NULL,'','',NULL,'297e8c7b455798280145579c73e501c1','2017-07-28 22:56:42','2017-07-28 22:56:42',0,1,'4028838b5b565caf015b566d11d80010',0,0,NULL,NULL,NULL,NULL,NULL),('402888815dfd1c35015dfd2645510006','广告位','pub','com.dic.adv.type',NULL,'data','0','',NULL,NULL,NULL,NULL,'297e8c7b455798280145579c73e501c1','2017-08-20 08:58:50',NULL,1,0,NULL,0,0,NULL,NULL,NULL,NULL,NULL),('402888815dfd1c35015dfd2690740007','访客入口（技能组窗口）','pub','point','cskefu','layui-icon','402888815dfd1c35015dfd2645510006','图片尺寸：140x90',NULL,'','',NULL,'297e8c7b455798280145579c73e501c1','2017-08-20 08:59:09','2017-08-20 08:59:09',0,1,'402888815dfd1c35015dfd2645510006',0,0,NULL,NULL,NULL,NULL,NULL),('402888815dfd1c35015dfd2690870008','邀请框（询问窗口）','pub','invite','cskefu','layui-icon','402888815dfd1c35015dfd2645510006','图片尺寸：420x178',NULL,'','',NULL,'297e8c7b455798280145579c73e501c1','2017-08-20 08:59:09','2017-08-20 08:59:09',0,2,'402888815dfd1c35015dfd2645510006',0,0,NULL,NULL,NULL,NULL,NULL),('402888815dfd2cf1015dfd3029110002','欢迎提示（对话窗口）','pub','welcome','cskefu','layui-icon','402888815dfd1c35015dfd2645510006','图片尺寸：520x50',NULL,'','',NULL,'297e8c7b455798280145579c73e501c1','2017-08-20 09:09:38',NULL,1,0,'402888815dfd1c35015dfd2645510006',0,0,NULL,NULL,NULL,NULL,NULL),('402888815dfd2cf1015dfd312f870003','形象展示（对话窗口）','pub','image','cskefu','layui-icon','402888815dfd1c35015dfd2645510006','图片尺寸：280x190',NULL,'','',NULL,'297e8c7b455798280145579c73e501c1','2017-08-20 09:10:45',NULL,1,0,'402888815dfd1c35015dfd2645510006',0,0,NULL,NULL,NULL,NULL,NULL),('402888815e097729015e0999f26e0002','数据接口','pub','com.dic.data.impl',NULL,'data','0','',NULL,NULL,NULL,NULL,'297e8c7b455798280145579c73e501c1','2017-08-22 19:00:37',NULL,1,0,NULL,0,0,NULL,NULL,NULL,NULL,NULL),('402888815e097729015e099ac71b0003','知识库分类','pub','topictype','cskefu',NULL,'402888815e097729015e0999f26e0002',NULL,NULL,NULL,NULL,NULL,'297e8c7b455798280145579c73e501c1','2017-08-22 19:01:32','2017-08-22 19:01:32',0,1,'402888815e097729015e0999f26e0002',0,0,NULL,NULL,NULL,NULL,NULL),('402888815e6061e7015e6069187f000b','在线客服满意度意见','pub','com.dic.webim.comment.item',NULL,'data','0','',NULL,NULL,NULL,NULL,'297e8c7b455798280145579c73e501c1','2017-09-08 15:34:13',NULL,1,0,NULL,0,0,NULL,NULL,NULL,NULL,NULL),('402888815e6061e7015e6069c226000c','管理人员的业务能力不够','pub','01','cskefu',NULL,'402888815e6061e7015e6069187f000b',NULL,NULL,NULL,NULL,NULL,'297e8c7b455798280145579c73e501c1','2017-09-08 15:34:57','2017-09-08 15:34:57',0,1,'402888815e6061e7015e6069187f000b',0,0,NULL,NULL,NULL,NULL,NULL),('402888815e6061e7015e6069c23a000d','客服人员的服务态度不好','pub','02','cskefu',NULL,'402888815e6061e7015e6069187f000b',NULL,NULL,NULL,NULL,NULL,'297e8c7b455798280145579c73e501c1','2017-09-08 15:34:57','2017-09-08 15:34:57',0,2,'402888815e6061e7015e6069187f000b',0,0,NULL,NULL,NULL,NULL,NULL),('402888815e6061e7015e6069c248000e','不能得到及时服务','pub','03','cskefu',NULL,'402888815e6061e7015e6069187f000b',NULL,NULL,NULL,NULL,NULL,'297e8c7b455798280145579c73e501c1','2017-09-08 15:34:57','2017-09-08 15:34:57',0,3,'402888815e6061e7015e6069187f000b',0,0,NULL,NULL,NULL,NULL,NULL),('402888815e6061e7015e6069c258000f','其他','pub','04','cskefu',NULL,'402888815e6061e7015e6069187f000b',NULL,NULL,NULL,NULL,NULL,'297e8c7b455798280145579c73e501c1','2017-09-08 15:34:57','2017-09-08 15:34:57',0,4,'402888815e6061e7015e6069187f000b',0,0,NULL,NULL,NULL,NULL,NULL),('4028888163ffe467016400f640f30646','外呼系统','pub','A11',NULL,'auth','402888815d2fe37f015d2fe75cc80002',NULL,NULL,'',NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-06-15 09:01:35',NULL,0,0,'402888815d2fe37f015d2fe75cc80002',0,0,'/apps/callout/index.html','webim','1',NULL,'left'),('402888816400f911016401056d340533','资源管理','pub','A11_A01',NULL,'auth','4028888163ffe467016400f640f30646',NULL,NULL,'',NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-06-15 09:18:10',NULL,0,0,'402888815d2fe37f015d2fe75cc80002',0,0,'/apps/callout/index.html','webim','2',NULL,'left'),('402888816400f911016401185cbb057d','拨号计划','pub','A11_A02',NULL,'auth','4028888163ffe467016400f640f30646',NULL,NULL,' ',NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-06-15 09:38:51',NULL,0,0,'402888815d2fe37f015d2fe75cc80002',0,0,'javascript:;','webim','2',NULL,'left'),('402888816400f91101640118c86d0581','数据查询','pub','A11_A03',NULL,'auth','4028888163ffe467016400f640f30646',NULL,NULL,' ',NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-06-15 09:39:18',NULL,0,0,'402888815d2fe37f015d2fe75cc80002',0,0,'javascript:;','webim','2',NULL,'left'),('402888816400f9110164013ab7170601','已删除任务','pub','A11_A02_A02',NULL,'auth','402888816400f911016401185cbb057d',NULL,NULL,' ',NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-06-15 10:16:22',NULL,0,0,'402888815d2fe37f015d2fe75cc80002',0,0,'/apps/callout/report/index.html','webim','3',NULL,'left'),('402888816400f9110164013ab717060e','任务列表','pub','A11_A02_A01',NULL,'auth','402888816400f911016401185cbb057d',NULL,NULL,' ',NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-06-15 10:16:22',NULL,0,0,'402888815d2fe37f015d2fe75cc80002',0,0,'/apps/callout/report/index.html','webim','3',NULL,'left'),('402888816400f9110164013c5a060615','坐席报表','pub','A11_A03_A01',NULL,'auth','402888816400f91101640118c86d0581',NULL,NULL,' ',NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-06-15 10:18:09',NULL,0,0,'402888815d2fe37f015d2fe75cc80002',0,0,'/apps/callout/activity.html','webim','3',NULL,'left'),('402888816400f9110164013ca2e8061a','外呼日报','pub','A11_A03_A02',NULL,'auth','402888816400f91101640118c86d0581',NULL,NULL,' ',NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-06-15 10:18:28',NULL,0,0,'402888815d2fe37f015d2fe75cc80002',0,0,'/apps/callout/task.html','webim','3',NULL,'left'),('402888816400f9110164013e9b4e062a','录音记录','pub','A11_A03_A04',NULL,'auth','402888816400f91101640118c86d0581',NULL,NULL,' ',NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-06-15 10:20:37',NULL,0,0,'402888815d2fe37f015d2fe75cc80002',0,0,'/apps/callout/names/myorganapstatus.html','webim','3',NULL,'left'),('402888816400f9110164013efaca062f','通话记录','pub','A11_A03_A05',NULL,'auth','402888816400f91101640118c86d0581',NULL,NULL,' ',NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-06-15 10:21:02',NULL,0,0,'402888815d2fe37f015d2fe75cc80002',0,0,'/apps/callout/names/myorganuser.html','webim','3',NULL,'left'),('40288881640eba2a01640f8599db07ec','全部坐席','pub','A12_A01_A01',NULL,'auth','40288881640eba2a01640f85359107e6',NULL,NULL,' ',NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-06-18 04:52:51',NULL,0,0,'402888815d2fe37f015d2fe75cc80002',0,0,'/apps/callcenter/service/monitor/allcall.html','webim','1',NULL,'left'),('40288881640eba2a01640f85f8af07f0','坐席状态','pub','A12_A02',NULL,'auth','4028888163ffe467016400f692c7064b',NULL,NULL,' ',NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-06-18 04:53:15',NULL,0,0,'402888815d2fe37f015d2fe75cc80002',0,0,'javascript:;','webim','2',NULL,'left'),('4028b46f62d295d90162d297a7d7035d','质检','pub','quality','cskefu','layui-icon','4028838b5b565caf015b566d11d80010','',NULL,'','',NULL,'4028cac3614cd2f901614cf8be1f0324','2018-04-17 15:52:57',NULL,1,0,'4028838b5b565caf015b566d11d80010',0,0,NULL,NULL,NULL,NULL,NULL),('4028c1236170e237016170e4d95a03c6','类似问题','pub','topicmore','cskefu','layui-icon','402888815e097729015e0999f26e0002','',NULL,'','',NULL,'4028cac3614cd2f901614cf8be1f0324','2018-02-07 23:31:41',NULL,1,0,'402888815e097729015e0999f26e0002',0,0,NULL,NULL,NULL,NULL,NULL),('4028c1236173b85b016173bde0fd0333','用户接口','pub','userdata','cskefu','layui-icon','402888815e097729015e0999f26e0002','',NULL,'','',NULL,'4028cac3614cd2f901614cf8be1f0324','2018-02-08 12:47:59',NULL,1,0,'402888815e097729015e0999f26e0002',0,0,NULL,NULL,NULL,NULL,NULL),('4028c1236173b85b016173be114e0335','部门接口','pub','organdata','cskefu','layui-icon','402888815e097729015e0999f26e0002','',NULL,'','',NULL,'4028cac3614cd2f901614cf8be1f0324','2018-02-08 12:48:11',NULL,1,0,'402888815e097729015e0999f26e0002',0,0,NULL,NULL,NULL,NULL,NULL),('4028cba3613c9d2d01613cb0dbf8062d','全部联系人','pub','A02_A01_A02_B01',NULL,'auth','402881ef612b1f5b01612cc87273054a',NULL,NULL,'',NULL,NULL,'297e8c7b455798280145579c73e501c1','2018-01-28 20:14:39',NULL,0,0,'402888815d2fe37f015d2fe75cc80002',0,0,'javascript:;','webim','4',NULL,'top'),('4028cba3613c9d2d01613cb15cce062e','今日新增','pub','A02_A01_A02_B02',NULL,'auth','402881ef612b1f5b01612cc87273054a',NULL,NULL,'',NULL,NULL,'297e8c7b455798280145579c73e501c1','2018-01-28 20:15:12',NULL,0,0,'402888815d2fe37f015d2fe75cc80002',0,0,'javascript:;','webim','4',NULL,'top'),('4028cba3613c9d2d01613cb204df062f','本周新增','pub','A02_A01_A02_B03',NULL,'auth','402881ef612b1f5b01612cc87273054a',NULL,NULL,'',NULL,NULL,'297e8c7b455798280145579c73e501c1','2018-01-28 20:15:55',NULL,0,0,'402888815d2fe37f015d2fe75cc80002',0,0,'javascript:;','webim','4',NULL,'top'),('4028cba3613c9d2d01613cb2b5f70630','我的联系人','pub','A02_A01_A02_B04',NULL,'auth','402881ef612b1f5b01612cc87273054a',NULL,NULL,'',NULL,NULL,'297e8c7b455798280145579c73e501c1','2018-01-28 20:16:40',NULL,0,0,'402888815d2fe37f015d2fe75cc80002',0,0,'javascript:;','webim','4',NULL,'top'),('4028cba3613c9d2d01613cb33d5b0631','新建联系人','pub','A02_A01_A02_B05',NULL,'auth','402881ef612b1f5b01612cc87273054a',NULL,NULL,'',NULL,NULL,'297e8c7b455798280145579c73e501c1','2018-01-28 20:17:15',NULL,0,0,'402888815d2fe37f015d2fe75cc80002',0,0,'javascript:;','webim','4',NULL,'top'),('4028cba3613c9d2d01613cc2909b0665','编辑联系人信息','pub','A02_A01_A02_B06',NULL,'auth','402881ef612b1f5b01612cc87273054a',NULL,NULL,'<i class=\"layui-icon\">&#xe642;</i>',NULL,NULL,'297e8c7b455798280145579c73e501c1','2018-01-28 20:33:59',NULL,0,0,'402888815d2fe37f015d2fe75cc80002',0,0,'/apps/contacts/edit.html?id=cf249b0039eb44f5aa6df663b156faae','webim','4',NULL,'top'),('4028cba3613c9d2d01613cc36c5b0666','删除联系人','pub','A02_A01_A02_B07',NULL,'auth','402881ef612b1f5b01612cc87273054a',NULL,NULL,'<i class=\"layui-icon\" style=\"color:red;\">&#x1006;</i>',NULL,NULL,'297e8c7b455798280145579c73e501c1','2018-01-28 20:34:55',NULL,0,0,'402888815d2fe37f015d2fe75cc80002',0,0,'/apps/contacts/delete.html?id=cf249b0039eb44f5aa6df663b156faae','webim','4',NULL,'top'),('4028cba3613c9d2d01613cc3ffd00667','导入','pub','A02_A01_A02_B08',NULL,'auth','402881ef612b1f5b01612cc87273054a',NULL,NULL,'<i class=\"layui-icon\">&#xe642;</i>',NULL,NULL,'297e8c7b455798280145579c73e501c1','2018-01-28 20:35:33',NULL,0,0,'402888815d2fe37f015d2fe75cc80002',0,0,'/apps/contacts/edit.html?id=cf249b0039eb44f5aa6df663b156faae','webim','4',NULL,'top'),('4028cba3613c9d2d01613cc443a70668','导出','pub','A02_A01_A02_B09',NULL,'auth','402881ef612b1f5b01612cc87273054a',NULL,NULL,'<i class=\"layui-icon\">&#xe642;</i>',NULL,NULL,'297e8c7b455798280145579c73e501c1','2018-01-28 20:35:50',NULL,0,0,'402888815d2fe37f015d2fe75cc80002',0,0,'/apps/contacts/edit.html?id=cf249b0039eb44f5aa6df663b156faae','webim','4',NULL,'top'),('4028cba3613c9d2d01613ccdc17f067c','全部客户','pub','A03_A01_A02_B01',NULL,'auth','402881ef612b1f5b01612cca221d054d',NULL,NULL,'<i class=\"kfont\" style=\"position: relative;\">&#xe636;</i>',NULL,NULL,'297e8c7b455798280145579c73e501c1','2018-01-28 20:46:12',NULL,0,0,'402888815d2fe37f015d2fe75cc80002',0,0,'/apps/bpm/index.html','webim','4',NULL,'top'),('4028cba3613c9d2d01613cce1c4e067d','今日新增','pub','A03_A01_A02_B02',NULL,'auth','402881ef612b1f5b01612cca221d054d',NULL,NULL,'<i class=\"kfont\" style=\"position: relative;\">&#xe636;</i>',NULL,NULL,'297e8c7b455798280145579c73e501c1','2018-01-28 20:46:36',NULL,0,0,'402888815d2fe37f015d2fe75cc80002',0,0,'/apps/bpm/index.html','webim','4',NULL,'top'),('4028cba3613c9d2d01613cce686b067e','本周新增','pub','A03_A01_A02_B03',NULL,'auth','402881ef612b1f5b01612cca221d054d',NULL,NULL,'<i class=\"kfont\" style=\"position: relative;\">&#xe636;</i>',NULL,NULL,'297e8c7b455798280145579c73e501c1','2018-01-28 20:46:55',NULL,0,0,'402888815d2fe37f015d2fe75cc80002',0,0,'/apps/bpm/index.html','webim','4',NULL,'top'),('4028cba3613c9d2d01613ccec9a6067f','企业客户','pub','A03_A01_A02_B04',NULL,'auth','402881ef612b1f5b01612cca221d054d',NULL,NULL,'<i class=\"layui-icon\" style=\"position: relative;\">&#xe614;</i>',NULL,NULL,'297e8c7b455798280145579c73e501c1','2018-01-28 20:47:20',NULL,0,0,'402888815d2fe37f015d2fe75cc80002',0,0,'/setting/agent/index.html','webim','4',NULL,'top'),('4028cba3613c9d2d01613ccf1eb00680','个人客户','pub','A03_A01_A02_B05',NULL,'auth','402881ef612b1f5b01612cca221d054d',NULL,NULL,'<i class=\"layui-icon\" style=\"position: relative;\">&#xe614;</i>',NULL,NULL,'297e8c7b455798280145579c73e501c1','2018-01-28 20:47:42',NULL,0,0,'402888815d2fe37f015d2fe75cc80002',0,0,'/setting/agent/index.html','webim','4',NULL,'top'),('4028cba3613c9d2d01613ccf70960681','新建客户','pub','A03_A01_A02_B06',NULL,'auth','402881ef612b1f5b01612cca221d054d',NULL,NULL,'<i class=\"layui-icon\" style=\"position: relative;\">&#xe614;</i>',NULL,NULL,'297e8c7b455798280145579c73e501c1','2018-01-28 20:48:03',NULL,0,0,'402888815d2fe37f015d2fe75cc80002',0,0,'/setting/agent/index.html','webim','4',NULL,'top'),('4028cba3613c9d2d01613ccfca880682','编辑','pub','A03_A01_A02_B07',NULL,'auth','402881ef612b1f5b01612cca221d054d',NULL,NULL,'<i class=\"layui-icon\" style=\"position: relative;\">&#xe614;</i>',NULL,NULL,'297e8c7b455798280145579c73e501c1','2018-01-28 20:48:26',NULL,0,0,'402888815d2fe37f015d2fe75cc80002',0,0,'/setting/agent/index.html','webim','4',NULL,'top'),('4028cba3613c9d2d01613cd01d250683','删除','pub','A03_A01_A02_B08',NULL,'auth','402881ef612b1f5b01612cca221d054d',NULL,NULL,'<i class=\"layui-icon\" style=\"position: relative;\">&#xe614;</i>',NULL,NULL,'297e8c7b455798280145579c73e501c1','2018-01-28 20:48:47',NULL,0,0,'402888815d2fe37f015d2fe75cc80002',0,0,'/setting/agent/index.html','webim','4',NULL,'top'),('4028cba3613c9d2d01613cd06df20684','导入','pub','A03_A01_A02_B09',NULL,'auth','402881ef612b1f5b01612cca221d054d',NULL,NULL,'<i class=\"layui-icon\" style=\"position: relative;\">&#xe614;</i>',NULL,NULL,'297e8c7b455798280145579c73e501c1','2018-01-28 20:49:08',NULL,0,0,'402888815d2fe37f015d2fe75cc80002',0,0,'/setting/agent/index.html','webim','4',NULL,'top'),('4028cba3613c9d2d01613cd0b9780685','导出','pub','A03_A01_A02_B010',NULL,'auth','402881ef612b1f5b01612cca221d054d',NULL,NULL,'<i class=\"layui-icon\" style=\"position: relative;\">&#xe614;</i>',NULL,NULL,'297e8c7b455798280145579c73e501c1','2018-01-28 20:49:27',NULL,0,0,'402888815d2fe37f015d2fe75cc80002',0,0,'/setting/agent/index.html','webim','4',NULL,'top'),('4028e3815bafaa94015bafb14edf0002','服务类型','pub','summary','cskefu','layui-icon','4028838b5b565caf015b566d11d80010','',NULL,'','',NULL,'297e8c7b455798280145579c73e501c1','2017-04-27 21:54:44',NULL,1,0,'4028838b5b565caf015b566d11d80010',0,0,NULL,NULL,NULL,NULL,NULL),('4028e3815bafb323015bafe5c8180009','服务小结预约方式','pub','com.dic.summary.reservtype',NULL,'data','0','',NULL,NULL,NULL,NULL,'297e8c7b455798280145579c73e501c1','2017-04-27 22:52:03',NULL,1,0,NULL,0,0,NULL,NULL,NULL,NULL,NULL),('4028e3815bafb323015bafe64be2000a','电话','pub','phone','cskefu',NULL,'4028e3815bafb323015bafe5c8180009',NULL,NULL,NULL,NULL,NULL,'297e8c7b455798280145579c73e501c1','2017-04-27 22:52:37','2017-04-27 22:52:37',0,1,'4028e3815bafb323015bafe5c8180009',0,0,NULL,NULL,NULL,NULL,NULL),('4028e3815bafb323015bafe64bf1000b','邮件','pub','email','cskefu',NULL,'4028e3815bafb323015bafe5c8180009',NULL,NULL,NULL,NULL,NULL,'297e8c7b455798280145579c73e501c1','2017-04-27 22:52:37','2017-04-27 22:52:37',0,2,'4028e3815bafb323015bafe5c8180009',0,0,NULL,NULL,NULL,NULL,NULL),('4028e3815bafb323015bafe64c02000c','短信','pub','sms','cskefu',NULL,'4028e3815bafb323015bafe5c8180009',NULL,NULL,NULL,NULL,NULL,'297e8c7b455798280145579c73e501c1','2017-04-27 22:52:37','2017-04-27 22:52:37',0,3,'4028e3815bafb323015bafe5c8180009',0,0,NULL,NULL,NULL,NULL,NULL),('4028e3815bafb323015bafe64c1e000d','微信','pub','wechat','cskefu',NULL,'4028e3815bafb323015bafe5c8180009',NULL,NULL,NULL,NULL,NULL,'297e8c7b455798280145579c73e501c1','2017-04-27 22:52:37','2017-04-27 22:52:37',0,4,'4028e3815bafb323015bafe5c8180009',0,0,NULL,NULL,NULL,NULL,NULL),('8a2a71896150d606016150f9ff0c053e','创建新工单','pub','A04_A01_B01',NULL,'auth','402881ef612b1f5b01612cca88e2054e',NULL,NULL,'',NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-02-01 18:46:56',NULL,0,0,'402888815d2fe37f015d2fe75cc80002',0,0,' ','webim','3',NULL,'top'),('8a2a71896168dbb40161690ff8520563','工单分类','pub','A04_A02_A06',NULL,'auth','402881ef612b1f5b01612ccabee3054f',NULL,NULL,'',NULL,NULL,'8a2a71896160d682016163b5ee06059d','2018-02-06 11:01:49',NULL,0,0,'402888815d2fe37f015d2fe75cc80002',0,0,' ','webim','3',NULL,'left'),('8a2a718961697de101616a5b5ad106f2','我的工单总数','pub','A04_A01_B04',NULL,'auth','402881ef612b1f5b01612cca88e2054e',NULL,NULL,'',NULL,NULL,'8a2a71896160d682016163cffbf40a00','2018-02-06 17:03:47',NULL,0,0,'402888815d2fe37f015d2fe75cc80002',0,0,' ','webim','3',NULL,'top'),('8a2a718961697de101616a5bb80906f6','我的待办工单总数','pub','A04_A01_B05',NULL,'auth','402881ef612b1f5b01612cca88e2054e',NULL,NULL,'',NULL,NULL,'8a2a71896160d682016163cffbf40a00','2018-02-06 17:04:11',NULL,0,0,'402888815d2fe37f015d2fe75cc80002',0,0,' ','webim','3',NULL,'top'),('8a7f5f826222b5c5016222bdb0dc0352','ES数据资源','pub','com.dic.es.type',NULL,'data','0','',NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-14 12:21:19',NULL,1,0,NULL,0,0,NULL,NULL,NULL,NULL,NULL),('8a7f5f826222b5c5016222be3e110354','联系人对象','pub','com.ukefu.webim.service.es.ContactsRepository','cskefu','layui-icon','8a7f5f826222b5c5016222bdb0dc0352','',NULL,'','',NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-14 12:21:55','2018-03-14 12:21:55',0,1,'8a7f5f826222b5c5016222bdb0dc0352',0,0,NULL,NULL,NULL,NULL,NULL),('8a7f5f826222d164016222d97921035a','DB数据资源','pub','com.dic.db.type',NULL,'data','0','',NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-14 12:51:40',NULL,1,0,NULL,0,0,NULL,NULL,NULL,NULL,NULL),('8a7f5f826222d164016222e64a000377','联系人','pub','com.ukefu.webim.web.model.Contacts','cskefu',NULL,'8a7f5f826222d164016222d97921035a',NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-03-14 13:05:40','2018-03-14 13:05:40',0,1,'8a7f5f826222d164016222d97921035a',0,0,NULL,NULL,NULL,NULL,NULL),('8a7f5f83632021be016320246f5d0407','知识库','pub','com.ukefu.webim.web.model.Topic','cskefu','layui-icon','8a7f5f826222d164016222d97921035a','',NULL,'','',NULL,'4028cac3614cd2f901614cf8be1f0324','2018-05-02 17:17:28',NULL,1,0,'8a7f5f826222d164016222d97921035a',0,0,NULL,NULL,NULL,NULL,NULL),('8a7f5f83632021be01632025644a040f','知识库对象','pub','com.ukefu.webim.service.es.TopicRepository','cskefu','layui-icon','8a7f5f826222b5c5016222bdb0dc0352','',NULL,'','',NULL,'4028cac3614cd2f901614cf8be1f0324','2018-05-02 17:18:31',NULL,1,0,'8a7f5f826222b5c5016222bdb0dc0352',0,0,NULL,NULL,NULL,NULL,NULL),('8a7f82825e241666015e241d2b3b0002','在线客服满意度','pub','com.dic.webim.comment',NULL,'data','0','',NULL,NULL,NULL,NULL,'297e8c7b455798280145579c73e501c1','2017-08-27 22:34:04',NULL,1,0,NULL,0,0,NULL,NULL,NULL,NULL,NULL),('8a7f82825e241666015e241da9660003','非常满意','pub','1','cskefu',NULL,'8a7f82825e241666015e241d2b3b0002',NULL,NULL,NULL,NULL,NULL,'297e8c7b455798280145579c73e501c1','2017-08-27 22:34:37','2017-08-27 22:34:37',0,1,'8a7f82825e241666015e241d2b3b0002',0,0,NULL,NULL,NULL,NULL,NULL),('8a7f82825e241666015e241da97b0004','满意','pub','2','cskefu',NULL,'8a7f82825e241666015e241d2b3b0002',NULL,NULL,NULL,NULL,NULL,'297e8c7b455798280145579c73e501c1','2017-08-27 22:34:37','2017-08-27 22:34:37',0,2,'8a7f82825e241666015e241d2b3b0002',0,0,NULL,NULL,NULL,NULL,NULL),('8a7f82825e241666015e241da9860005','一般','pub','3','cskefu',NULL,'8a7f82825e241666015e241d2b3b0002',NULL,NULL,NULL,NULL,NULL,'297e8c7b455798280145579c73e501c1','2017-08-27 22:34:37','2017-08-27 22:34:37',0,3,'8a7f82825e241666015e241d2b3b0002',0,0,NULL,NULL,NULL,NULL,NULL),('8a7f82825e241666015e241da9970006','不满意','pub','4','cskefu',NULL,'8a7f82825e241666015e241d2b3b0002',NULL,NULL,NULL,NULL,NULL,'297e8c7b455798280145579c73e501c1','2017-08-27 22:34:37','2017-08-27 22:34:37',0,4,'8a7f82825e241666015e241d2b3b0002',0,0,NULL,NULL,NULL,NULL,NULL),('8a7f82825e241666015e241da9a20007','非常不满意','pub','5','cskefu',NULL,'8a7f82825e241666015e241d2b3b0002',NULL,NULL,NULL,NULL,NULL,'297e8c7b455798280145579c73e501c1','2017-08-27 22:34:37','2017-08-27 22:34:37',0,5,'8a7f82825e241666015e241d2b3b0002',0,0,NULL,NULL,NULL,NULL,NULL),('8a838ae561465f4b01614667863c0324','机构类型','pub','com.dic.organization.type',NULL,'data','0','',NULL,NULL,NULL,NULL,'297e8c7b455798280145579c73e501c1','2018-01-30 17:30:45',NULL,1,0,NULL,0,0,NULL,NULL,NULL,NULL,NULL),('8a838ae561465f4b0161466886170326','金融','pub','01','cskefu',NULL,'8a838ae561465f4b01614667863c0324',NULL,NULL,NULL,NULL,NULL,'297e8c7b455798280145579c73e501c1','2018-01-30 17:31:50','2018-01-30 17:31:50',0,1,'8a838ae561465f4b01614667863c0324',0,0,NULL,NULL,NULL,NULL,NULL),('8a838ae561465f4b0161466886280327','电信','pub','02','cskefu',NULL,'8a838ae561465f4b01614667863c0324',NULL,NULL,NULL,NULL,NULL,'297e8c7b455798280145579c73e501c1','2018-01-30 17:31:50','2018-01-30 17:31:50',0,2,'8a838ae561465f4b01614667863c0324',0,0,NULL,NULL,NULL,NULL,NULL),('8a838ae561465f4b01614668863c0328','政府','pub','03','cskefu',NULL,'8a838ae561465f4b01614667863c0324',NULL,NULL,NULL,NULL,NULL,'297e8c7b455798280145579c73e501c1','2018-01-30 17:31:50','2018-01-30 17:31:50',0,3,'8a838ae561465f4b01614667863c0324',0,0,NULL,NULL,NULL,NULL,NULL),('8a838ae561465f4b01614668864c0329','制造','pub','04','cskefu',NULL,'8a838ae561465f4b01614667863c0324',NULL,NULL,NULL,NULL,NULL,'297e8c7b455798280145579c73e501c1','2018-01-30 17:31:50','2018-01-30 17:31:50',0,4,'8a838ae561465f4b01614667863c0324',0,0,NULL,NULL,NULL,NULL,NULL),('8a838ae561465f4b01614668866a032a','IT/互联网','pub','05','cskefu',NULL,'8a838ae561465f4b01614667863c0324',NULL,NULL,NULL,NULL,NULL,'297e8c7b455798280145579c73e501c1','2018-01-30 17:31:50','2018-01-30 17:31:50',0,5,'8a838ae561465f4b01614667863c0324',0,0,NULL,NULL,NULL,NULL,NULL),('8a838ae561465f4b01614668867d032b','医药医疗','pub','06','cskefu',NULL,'8a838ae561465f4b01614667863c0324',NULL,NULL,NULL,NULL,NULL,'297e8c7b455798280145579c73e501c1','2018-01-30 17:31:50','2018-01-30 17:31:50',0,6,'8a838ae561465f4b01614667863c0324',0,0,NULL,NULL,NULL,NULL,NULL),('8a838ae561465f4b01614668868c032c','零售物流','pub','07','cskefu',NULL,'8a838ae561465f4b01614667863c0324',NULL,NULL,NULL,NULL,NULL,'297e8c7b455798280145579c73e501c1','2018-01-30 17:31:50','2018-01-30 17:31:50',0,7,'8a838ae561465f4b01614667863c0324',0,0,NULL,NULL,NULL,NULL,NULL),('8a838ae561465f4b01614668869b032d','工程建筑','pub','08','cskefu',NULL,'8a838ae561465f4b01614667863c0324',NULL,NULL,NULL,NULL,NULL,'297e8c7b455798280145579c73e501c1','2018-01-30 17:31:50','2018-01-30 17:31:50',0,8,'8a838ae561465f4b01614667863c0324',0,0,NULL,NULL,NULL,NULL,NULL),('8a838ae561465f4b0161466886b4032e','能源','pub','09','cskefu',NULL,'8a838ae561465f4b01614667863c0324',NULL,NULL,NULL,NULL,NULL,'297e8c7b455798280145579c73e501c1','2018-01-30 17:31:50','2018-01-30 17:31:50',0,9,'8a838ae561465f4b01614667863c0324',0,0,NULL,NULL,NULL,NULL,NULL),('8a838ae561465f4b0161466886c8032f','其他','pub','10','cskefu',NULL,'8a838ae561465f4b01614667863c0324',NULL,NULL,NULL,NULL,NULL,'297e8c7b455798280145579c73e501c1','2018-01-30 17:31:50','2018-01-30 17:31:50',0,10,'8a838ae561465f4b01614667863c0324',0,0,NULL,NULL,NULL,NULL,NULL),('8a838ae561465f4b0161466932100330','机构规模','pub','com.dic.organization.scale',NULL,'data','0','',NULL,NULL,NULL,NULL,'297e8c7b455798280145579c73e501c1','2018-01-30 17:32:34',NULL,1,0,NULL,0,0,NULL,NULL,NULL,NULL,NULL),('8a838ae561465f4b01614669c00a0331','0-30人','pub','01','cskefu',NULL,'8a838ae561465f4b0161466932100330',NULL,NULL,NULL,NULL,NULL,'297e8c7b455798280145579c73e501c1','2018-01-30 17:33:11','2018-01-30 17:33:11',0,1,'8a838ae561465f4b0161466932100330',0,0,NULL,NULL,NULL,NULL,NULL),('8a838ae561465f4b01614669c0160332','30-300人','pub','02','cskefu',NULL,'8a838ae561465f4b0161466932100330',NULL,NULL,NULL,NULL,NULL,'297e8c7b455798280145579c73e501c1','2018-01-30 17:33:11','2018-01-30 17:33:11',0,2,'8a838ae561465f4b0161466932100330',0,0,NULL,NULL,NULL,NULL,NULL),('8a838ae561465f4b01614669c0200333','300-1000人','pub','03','cskefu',NULL,'8a838ae561465f4b0161466932100330',NULL,NULL,NULL,NULL,NULL,'297e8c7b455798280145579c73e501c1','2018-01-30 17:33:11','2018-01-30 17:33:11',0,3,'8a838ae561465f4b0161466932100330',0,0,NULL,NULL,NULL,NULL,NULL),('8a838ae561465f4b01614669c0300334','1000人以上','pub','04','cskefu',NULL,'8a838ae561465f4b0161466932100330',NULL,NULL,NULL,NULL,NULL,'297e8c7b455798280145579c73e501c1','2018-01-30 17:33:11','2018-01-30 17:33:11',0,4,'8a838ae561465f4b0161466932100330',0,0,NULL,NULL,NULL,NULL,NULL),('ff808081613ba48901613bb32ac404e6','工单总数','pub','A04_A01_B02',NULL,'auth','402881ef612b1f5b01612cca88e2054e',NULL,NULL,'<i class=\"kfont ukewo-btn ukefu-measure-btn\">&#xe606;</i>',NULL,NULL,'297e8c7b455798280145579c73e501c1','2018-01-28 15:37:33',NULL,0,0,'402888815d2fe37f015d2fe75cc80002',0,0,'javascript:void(0)','webim','3',NULL,'top'),('ff808081613ba48901613bb42bbf04e7','未关闭工单总数','pub','A04_A01_B03',NULL,'auth','402881ef612b1f5b01612cca88e2054e',NULL,NULL,'<i class=\"kfont ukewo-btn ukefu-measure-btn ukefu-bg-color-yellow\">&#xe606;</i>',NULL,NULL,'297e8c7b455798280145579c73e501c1','2018-01-28 15:38:38',NULL,0,0,'402888815d2fe37f015d2fe75cc80002',0,0,'javascript:void(0)','webim','3',NULL,'top'),('ff8080816de316aa016de31d0e130016','企业聊天','pub','A14','cskefu','layui-icon','402888815d2fe37f015d2fe75cc80002','',NULL,'','',NULL,'4028cac3614cd2f901614cf8be1f0324','2019-10-19 16:23:15',NULL,1,0,'402888815d2fe37f015d2fe75cc80002',0,0,NULL,NULL,NULL,NULL,NULL),('ff8080816de316aa016de3201ffb001c','创建群组','pub','A14_A01','cskefu','layui-icon','ff8080816de316aa016de31d0e130016','',NULL,'','',NULL,'4028cac3614cd2f901614cf8be1f0324','2019-10-19 16:26:36',NULL,1,0,'402888815d2fe37f015d2fe75cc80002',0,0,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `uk_sysdic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uk_system_message`
--

DROP TABLE IF EXISTS `uk_system_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uk_system_message` (
  `ID` varchar(32) NOT NULL COMMENT '主键ID',
  `MSGTYPE` varchar(20) DEFAULT NULL COMMENT '消息类型',
  `SMTPSERVER` varchar(255) DEFAULT NULL COMMENT 'SMTP服务器',
  `SMTPUSER` varchar(255) DEFAULT NULL COMMENT 'SMTP账号',
  `SMTPPASSWORD` varchar(255) DEFAULT NULL COMMENT 'SMTP密码',
  `MAILFROM` varchar(255) DEFAULT NULL COMMENT '发件人',
  `SECLEV` varchar(50) DEFAULT NULL COMMENT '启用SSL',
  `SSLPORT` varchar(50) DEFAULT NULL COMMENT 'SSL端口',
  `ORGI` varchar(32) DEFAULT NULL COMMENT '租户ID',
  `URL` text COMMENT 'URL',
  `smstype` varchar(32) DEFAULT NULL COMMENT '短信类型',
  `APPKEY` varchar(200) DEFAULT NULL COMMENT 'APPKEY',
  `APPSEC` varchar(200) DEFAULT NULL COMMENT 'APPSEC',
  `SIGN` varchar(50) DEFAULT NULL COMMENT '签名',
  `TPCODE` varchar(50) DEFAULT NULL COMMENT 'TP代码',
  `CREATETIME` datetime DEFAULT NULL COMMENT '创建时间',
  `NAME` varchar(50) DEFAULT NULL COMMENT '邮件或短信网关名称',
  `moreparam` text COMMENT '更多参数',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='公告信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uk_system_message`
--

LOCK TABLES `uk_system_message` WRITE;
/*!40000 ALTER TABLE `uk_system_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `uk_system_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uk_systemconfig`
--

DROP TABLE IF EXISTS `uk_systemconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uk_systemconfig` (
  `ID` varchar(32) NOT NULL COMMENT '主键ID',
  `NAME` varchar(100) DEFAULT NULL COMMENT '名称',
  `TITLE` varchar(100) DEFAULT NULL COMMENT '标题',
  `CODE` varchar(100) DEFAULT NULL COMMENT '编码',
  `ORGI` varchar(32) DEFAULT NULL COMMENT '租户ID',
  `CTYPE` varchar(32) DEFAULT NULL COMMENT '类型',
  `PARENTID` varchar(32) DEFAULT NULL COMMENT '父级ID',
  `DESCRIPTION` varchar(255) DEFAULT NULL COMMENT '描述',
  `MEMO` varchar(32) DEFAULT NULL COMMENT '备注',
  `ICONSTR` varchar(255) DEFAULT NULL COMMENT '自定义样式',
  `ICONSKIN` varchar(255) DEFAULT NULL COMMENT '自定义样式',
  `CATETYPE` varchar(32) DEFAULT NULL COMMENT '分类',
  `CREATER` varchar(32) DEFAULT NULL COMMENT '创建人',
  `CREATETIME` datetime DEFAULT NULL COMMENT '创建时间',
  `UPDATETIME` datetime DEFAULT NULL COMMENT '更新时间',
  `HASCHILD` tinyint(4) DEFAULT NULL COMMENT '是否有下级',
  `SORTINDEX` int(11) DEFAULT NULL COMMENT '排序',
  `DICID` varchar(32) DEFAULT NULL COMMENT '目录ID',
  `DEFAULTVALUE` tinyint(4) DEFAULT NULL COMMENT '默认值',
  `THEME` varchar(50) DEFAULT NULL COMMENT '皮肤',
  `LOGLEVEL` varchar(32) DEFAULT NULL COMMENT '日志级别',
  `ENABLESSL` tinyint(4) DEFAULT NULL COMMENT '启用SSL',
  `JKSFILE` varchar(255) DEFAULT NULL COMMENT 'JKS文件路径',
  `JKSPASSWORD` varchar(255) DEFAULT NULL COMMENT 'JKS密码',
  `MAPKEY` varchar(255) DEFAULT NULL COMMENT '百度地图授权编码',
  `workorders` tinyint(4) DEFAULT NULL COMMENT '启用工单三栏布局',
  `callcenter` tinyint(4) DEFAULT NULL COMMENT '启用呼叫中心',
  `cc_extention` varchar(32) DEFAULT NULL COMMENT '分机',
  `cc_quene` varchar(32) DEFAULT NULL COMMENT '技能组队列',
  `cc_router` varchar(32) DEFAULT NULL COMMENT '路由策略',
  `cc_ivr` varchar(32) DEFAULT NULL COMMENT 'IVR模板',
  `cc_acl` varchar(32) DEFAULT NULL COMMENT '访问列表模板',
  `cc_siptrunk` varchar(32) DEFAULT NULL COMMENT 'SIP配置模板',
  `cc_callcenter` varchar(32) DEFAULT NULL COMMENT '呼叫中心配置',
  `CALLOUT` tinyint(4) DEFAULT NULL COMMENT '是否允许点击号码外呼',
  `AUTH` tinyint(4) DEFAULT NULL COMMENT '启用权限控制',
  `enablemail` tinyint(4) DEFAULT '0' COMMENT '启用发送邮件',
  `enablesms` tinyint(4) DEFAULT '0' COMMENT '启用发送短信',
  `emailid` varchar(32) DEFAULT NULL COMMENT '启用AI',
  `emailworkordertp` varchar(32) DEFAULT NULL COMMENT '启用工单邮件发送',
  `smsid` varchar(32) DEFAULT NULL COMMENT '短信网关ID',
  `smsworkordertp` varchar(32) DEFAULT NULL COMMENT '启用工单发送短信',
  `mailcreatetp` varchar(32) DEFAULT NULL COMMENT '创建发送邮件模板',
  `mailupdatetp` varchar(32) DEFAULT NULL COMMENT '更新发送邮件模板',
  `mailprocesstp` varchar(32) DEFAULT NULL COMMENT '处理发送邮件模板',
  `emailtocreater` tinyint(4) DEFAULT '0' COMMENT '更新发送创建人邮件模板',
  `emailshowrecipient` tinyint(4) DEFAULT '0' COMMENT '发送邮件给创建人',
  `smscreatetp` varchar(32) DEFAULT NULL COMMENT '创建发送短信',
  `smsupdatetp` varchar(32) DEFAULT NULL,
  `smsprocesstp` varchar(32) DEFAULT NULL COMMENT '处理发送短信',
  `smstocreater` tinyint(4) DEFAULT '0' COMMENT '创建发送短信',
  `emailtocreatertp` varchar(32) DEFAULT NULL COMMENT '创建发送短信模板',
  `smstocreatertp` varchar(32) DEFAULT NULL COMMENT '更新发送短信模板',
  `enabletneant` tinyint(4) DEFAULT '0' COMMENT '启用多租户',
  `tenantshare` tinyint(4) DEFAULT '0' COMMENT '租户共享数据',
  `namealias` varchar(100) DEFAULT NULL COMMENT '别称',
  `enableregorgi` tinyint(4) DEFAULT '0' COMMENT '启用注册租户',
  `tenantconsole` tinyint(4) DEFAULT '0' COMMENT '登录跳转到租户切换页面',
  `loginlogo` varchar(255) DEFAULT NULL COMMENT '登陆页面Logo',
  `consolelogo` varchar(255) DEFAULT NULL COMMENT '后台页面Logo',
  `favlogo` varchar(255) DEFAULT NULL COMMENT '系统Fav图标Logo',
  UNIQUE KEY `SQL121227155532210` (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='系统设置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uk_systemconfig`
--

LOCK TABLES `uk_systemconfig` WRITE;
/*!40000 ALTER TABLE `uk_systemconfig` DISABLE KEYS */;
INSERT INTO `uk_systemconfig` VALUES ('2c93809364e0a6d00164ef6722270582',NULL,'春松客服-全渠道智能客服',NULL,'cskefu',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'4028cac3614cd2f901614cf8be1f0324','2018-07-31 08:14:30',NULL,NULL,NULL,NULL,NULL,'01','info',0,NULL,NULL,'',0,0,'','','','','','',NULL,0,0,0,0,'','',NULL,NULL,'','',NULL,0,0,NULL,NULL,NULL,0,'',NULL,0,0,'租户',0,0,NULL,NULL,NULL);
/*!40000 ALTER TABLE `uk_systemconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uk_tableproperties`
--

DROP TABLE IF EXISTS `uk_tableproperties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uk_tableproperties` (
  `ID` varchar(32) NOT NULL DEFAULT '' COMMENT '主键ID',
  `NAME` varchar(255) DEFAULT NULL COMMENT '字段名称',
  `CODE` varchar(255) DEFAULT NULL COMMENT '代码',
  `GROUPID` varchar(255) DEFAULT NULL COMMENT '组ID',
  `USERID` varchar(255) DEFAULT NULL COMMENT '创建人ID',
  `FIELDNAME` varchar(255) DEFAULT NULL COMMENT '字段名称',
  `DATATYPECODE` int(11) NOT NULL COMMENT '数据类型代码',
  `DATATYPENAME` varchar(255) DEFAULT NULL COMMENT '字段类型名称',
  `DBTABLEID` varchar(191) DEFAULT NULL COMMENT '数据表ID',
  `INDEXDATATYPE` varchar(255) DEFAULT NULL COMMENT '字段类型',
  `PK` smallint(6) DEFAULT NULL COMMENT '是否外键',
  `MODITS` smallint(6) DEFAULT NULL COMMENT '是否启用多值',
  `INDEXFIELD` varchar(32) DEFAULT NULL COMMENT '是否索引',
  `PLUGIN` varchar(32) DEFAULT NULL COMMENT '处理插件',
  `ORGI` varchar(32) DEFAULT NULL COMMENT '租户ID',
  `FKTABLE` varchar(32) DEFAULT NULL COMMENT '外键表',
  `FKPROPERTY` varchar(32) DEFAULT NULL COMMENT '外键字段',
  `TABLENAME` varchar(255) DEFAULT NULL COMMENT '数据表名称',
  `viewtype` varchar(255) DEFAULT NULL COMMENT '视图类型',
  `SORTINDEX` int(11) DEFAULT NULL COMMENT '排序位置',
  `SYSTEMFIELD` tinyint(4) DEFAULT NULL COMMENT '系统字段',
  `INX` tinyint(4) DEFAULT NULL COMMENT '索引',
  `TOKEN` tinyint(4) DEFAULT NULL COMMENT '分词',
  `LENGTH` int(11) DEFAULT NULL COMMENT '长度',
  `FIELDSTATUS` tinyint(4) DEFAULT NULL COMMENT '字段状态',
  `SELDATA` tinyint(4) DEFAULT NULL COMMENT '关联字段数据',
  `SELDATACODE` varchar(32) DEFAULT NULL COMMENT '关联字段代码',
  `SELDATAKEY` varchar(32) DEFAULT NULL COMMENT '关联key',
  `SELDATAVALUE` varchar(32) DEFAULT NULL COMMENT '关联字段值',
  `SELDATATYPE` varchar(32) DEFAULT NULL COMMENT '关联类型',
  `REFTBID` varchar(32) DEFAULT NULL COMMENT '引用表ID',
  `REFTPID` varchar(32) DEFAULT NULL COMMENT '引用字段ID',
  `REFTYPE` varchar(32) DEFAULT NULL COMMENT '引用类型',
  `REFTBNAME` varchar(60) DEFAULT NULL COMMENT '引用表名称',
  `REFTPNAME` varchar(60) DEFAULT NULL COMMENT '引用字段名称',
  `REFTPTITLEFIELD` varchar(60) DEFAULT NULL COMMENT '引用字段ID',
  `REFFK` tinyint(4) DEFAULT NULL COMMENT '外键',
  `DEFAULTSORT` tinyint(4) DEFAULT NULL COMMENT '默认排序',
  `DEFAULTVALUE` varchar(255) DEFAULT NULL COMMENT '默认值',
  `DEFAULTVALUETITLE` varchar(255) DEFAULT NULL COMMENT '默认标题',
  `DEFAULTFIELDVALUE` varchar(255) DEFAULT NULL COMMENT '默认标题内容',
  `MULTPARTFILE` tinyint(4) DEFAULT NULL COMMENT '多值',
  `UPLOADTYPE` varchar(255) DEFAULT NULL COMMENT '文件上传类型',
  `cascadetype` varchar(255) DEFAULT NULL COMMENT '引用',
  `title` tinyint(4) DEFAULT NULL COMMENT '标题',
  `DESCORDER` tinyint(4) DEFAULT NULL COMMENT '排序方式',
  `impfield` tinyint(4) DEFAULT '0' COMMENT '导入字段',
  `tokentype` varchar(32) DEFAULT NULL COMMENT '分词',
  `phonenumber` tinyint(4) DEFAULT NULL COMMENT '是否电话号码',
  `phonetype` varchar(50) DEFAULT NULL COMMENT '电话号码类型',
  `phonememo` varchar(50) DEFAULT NULL COMMENT '电话号码备注',
  `secfield` tinyint(4) DEFAULT '0' COMMENT '隐藏字段',
  `secdistype` varchar(50) DEFAULT NULL COMMENT '字段隐藏方式',
  `styletype` varchar(32) DEFAULT NULL COMMENT '样式',
  `sysfield` tinyint(4) DEFAULT '0' COMMENT '系统字段',
  PRIMARY KEY (`ID`) USING BTREE,
  UNIQUE KEY `SQL130112140848940` (`ID`) USING BTREE,
  KEY `FKF8D74787854BC62` (`DBTABLEID`) USING BTREE,
  KEY `FKF8D747811BE44FF` (`FKPROPERTY`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='元数据字段表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uk_tableproperties`
--

LOCK TABLES `uk_tableproperties` WRITE;
/*!40000 ALTER TABLE `uk_tableproperties` DISABLE KEYS */;
INSERT INTO `uk_tableproperties` VALUES ('2c9480886e91d9e5016e91f528ac018f','性别',NULL,NULL,NULL,'gender',0,'text','2c9480886e91d9e5016e91f528ab018d',NULL,0,0,NULL,NULL,'cskefu',NULL,NULL,'uk_contacts',NULL,100,0,1,0,60,1,1,'com.dic.contacts.sex',NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,1,NULL,NULL,0,0,0,NULL,0,NULL,NULL,0,NULL,NULL,0),('2c9480886e91d9e5016e91f528ac0190','出生日期',NULL,NULL,NULL,'cusbirthday',0,'text','2c9480886e91d9e5016e91f528ab018d',NULL,0,0,NULL,NULL,'cskefu',NULL,NULL,'uk_contacts',NULL,100,0,1,0,50,1,0,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,1,NULL,NULL,0,0,0,NULL,0,NULL,NULL,0,NULL,NULL,0),('2c9480886e91d9e5016e91f528ac0192','联系人类别',NULL,NULL,NULL,'ckind',0,'text','2c9480886e91d9e5016e91f528ab018d',NULL,0,0,NULL,NULL,'cskefu',NULL,NULL,'uk_contacts',NULL,100,0,1,0,60,1,1,'com.dic.contacts.ckind',NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,1,NULL,NULL,0,0,0,NULL,0,NULL,NULL,0,NULL,NULL,0),('2c9480886e91d9e5016e91f528af019e','电子邮件',NULL,NULL,NULL,'email',0,'text','2c9480886e91d9e5016e91f528ab018d',NULL,0,0,NULL,NULL,'cskefu',NULL,NULL,'uk_contacts',NULL,100,0,1,0,128,1,0,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,1,NULL,NULL,0,0,0,NULL,0,NULL,NULL,0,NULL,NULL,0),('2c9480886e91d9e5016e91f528b001a0','手机号码',NULL,NULL,NULL,'mobileno',0,'text','2c9480886e91d9e5016e91f528ab018d',NULL,0,0,NULL,NULL,'cskefu',NULL,NULL,'uk_contacts',NULL,100,0,1,0,40,1,0,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,1,NULL,NULL,0,0,0,NULL,0,NULL,NULL,0,NULL,NULL,0),('2c9480886e91d9e5016e91f528b101a2','办公电话',NULL,NULL,NULL,'phone',0,'text','2c9480886e91d9e5016e91f528ab018d',NULL,0,0,NULL,NULL,'cskefu',NULL,NULL,'uk_contacts',NULL,100,0,1,0,40,1,0,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,1,NULL,NULL,0,0,0,NULL,0,NULL,NULL,0,NULL,NULL,0),('2c9480886e91d9e5016e91f528b301ab','省',NULL,NULL,NULL,'province',0,'text','2c9480886e91d9e5016e91f528ab018d',NULL,0,0,NULL,NULL,'cskefu',NULL,NULL,'uk_contacts',NULL,100,0,1,0,60,1,1,'com.dic.address.area',NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,1,NULL,NULL,0,0,0,NULL,0,NULL,NULL,0,NULL,NULL,0),('2c9480886e91d9e5016e91f528b401ac','市(区)县',NULL,NULL,NULL,'city',0,'text','2c9480886e91d9e5016e91f528ab018d',NULL,0,0,NULL,NULL,'cskefu',NULL,NULL,'uk_contacts',NULL,100,0,1,0,60,1,1,'com.dic.address.area',NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,1,NULL,NULL,0,0,0,NULL,0,NULL,NULL,0,NULL,NULL,0),('2c9480886e91d9e5016e91f528b401ad','地址',NULL,NULL,NULL,'address',0,'text','2c9480886e91d9e5016e91f528ab018d',NULL,0,0,NULL,NULL,'cskefu',NULL,NULL,'uk_contacts',NULL,100,0,1,0,65535,1,0,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,1,NULL,NULL,0,0,0,NULL,0,NULL,NULL,0,NULL,NULL,0),('2c9480886e91d9e5016e91f528b801bb','最后联系时间',NULL,NULL,NULL,'touchtime',0,'datetime','2c9480886e91d9e5016e91f528ab018d',NULL,0,0,NULL,NULL,'cskefu',NULL,NULL,'uk_contacts',NULL,100,0,1,0,19,1,0,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,1,NULL,NULL,0,0,0,NULL,0,NULL,NULL,0,NULL,NULL,0),('2c9480886e91d9e5016e91f528b901be','创建人',NULL,NULL,NULL,'creater',0,'text','2c9480886e91d9e5016e91f528ab018d',NULL,0,0,NULL,NULL,'cskefu',NULL,NULL,'uk_contacts',NULL,100,0,1,0,60,1,0,'',NULL,NULL,'','userdata',NULL,NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,1,NULL,NULL,0,0,0,NULL,0,NULL,NULL,0,NULL,NULL,0),('2c9480886e91d9e5016e91f528b901c1','联系人备注',NULL,NULL,NULL,'memo',0,'text','2c9480886e91d9e5016e91f528ab018d',NULL,0,0,NULL,NULL,'cskefu',NULL,NULL,'uk_contacts',NULL,100,0,1,0,255,1,0,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,1,NULL,NULL,0,0,0,NULL,0,NULL,NULL,0,NULL,NULL,0),('2c9480886e91d9e5016e91f528b901c3','修改时间',NULL,NULL,NULL,'updatetime',0,'datetime','2c9480886e91d9e5016e91f528ab018d',NULL,0,0,NULL,NULL,'cskefu',NULL,NULL,'uk_contacts',NULL,100,0,1,0,19,1,0,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,1,NULL,NULL,0,0,0,NULL,0,NULL,NULL,0,NULL,NULL,0),('2c9480886e91d9e5016e91f528ba01c6','创建时间',NULL,NULL,NULL,'createtime',0,'datetime','2c9480886e91d9e5016e91f528ab018d',NULL,0,0,NULL,NULL,'cskefu',NULL,NULL,'uk_contacts',NULL,100,0,1,0,19,1,0,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,1,NULL,NULL,0,0,0,NULL,0,NULL,NULL,0,NULL,NULL,0),('2c9480886e91d9e5016e91f528ba01c7','联系人姓名',NULL,NULL,NULL,'name',0,'text','2c9480886e91d9e5016e91f528ab018d',NULL,0,0,NULL,NULL,'cskefu',NULL,NULL,'uk_contacts',NULL,100,0,1,0,255,1,0,'',NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,0,0,NULL,'required',NULL,1,NULL,NULL,0,0,0,NULL,0,NULL,NULL,0,NULL,NULL,0),('2c9480886e91d9e5016e91f528ba01ca','分享给',NULL,NULL,NULL,'shares',0,'text','2c9480886e91d9e5016e91f528ab018d',NULL,0,0,NULL,NULL,'cskefu',NULL,NULL,'uk_contacts',NULL,100,0,1,0,255,1,0,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,1,NULL,NULL,0,0,0,NULL,0,NULL,NULL,0,NULL,NULL,0),('2c9480886e91d9e5016e91f528bb01d0','skypeid',NULL,NULL,NULL,'skypeid',0,'text','2c9480886e91d9e5016e91f528ab018d',NULL,0,0,NULL,NULL,'cskefu',NULL,NULL,'uk_contacts',NULL,100,0,1,0,100,1,0,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,1,NULL,NULL,0,0,0,NULL,0,NULL,NULL,0,NULL,NULL,0),('2c9480886e91d9e5016e91f528bb01d1','人员id',NULL,NULL,NULL,'wluid',0,'text','2c9480886e91d9e5016e91f528ab018d',NULL,0,0,NULL,NULL,'cskefu',NULL,NULL,'uk_contacts',NULL,100,0,1,0,100,1,0,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,1,NULL,NULL,0,0,0,NULL,0,NULL,NULL,0,NULL,NULL,0),('2c9480886e91d9e5016e91f528bc01d2','人员名称',NULL,NULL,NULL,'wlusername',0,'text','2c9480886e91d9e5016e91f528ab018d',NULL,0,0,NULL,NULL,'cskefu',NULL,NULL,'uk_contacts',NULL,100,0,1,0,255,1,0,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,1,NULL,NULL,0,0,0,NULL,0,NULL,NULL,0,NULL,NULL,0),('2c9480886e91d9e5016e91f528bc01d3','公司id',NULL,NULL,NULL,'wlcid',0,'text','2c9480886e91d9e5016e91f528ab018d',NULL,0,0,NULL,NULL,'cskefu',NULL,NULL,'uk_contacts',NULL,100,0,1,0,100,1,0,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,1,NULL,NULL,0,0,0,NULL,0,NULL,NULL,0,NULL,NULL,0),('2c9480886e91d9e5016e91f528bc01d4','公司名称',NULL,NULL,NULL,'wlcompany_name',0,'text','2c9480886e91d9e5016e91f528ab018d',NULL,0,0,NULL,NULL,'cskefu',NULL,NULL,'uk_contacts',NULL,100,0,1,0,255,1,0,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,1,NULL,NULL,0,0,0,NULL,0,NULL,NULL,0,NULL,NULL,0),('2c9480886e91d9e5016e91f528bc01d5','子系统id',NULL,NULL,NULL,'wlsid',0,'text','2c9480886e91d9e5016e91f528ab018d',NULL,0,0,NULL,NULL,'cskefu',NULL,NULL,'uk_contacts',NULL,100,0,1,0,100,1,0,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,1,NULL,NULL,0,0,0,NULL,0,NULL,NULL,0,NULL,NULL,0),('2c9480886e91d9e5016e91f528bc01d6','子系统名称',NULL,NULL,NULL,'wlsystem_name',0,'text','2c9480886e91d9e5016e91f528ab018d',NULL,0,0,NULL,NULL,'cskefu',NULL,NULL,'uk_contacts',NULL,100,0,1,0,255,1,0,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,1,NULL,NULL,0,0,0,NULL,0,NULL,NULL,0,NULL,NULL,0),('402870876e5d9773016e5e95575801c2','企(事)业单位名称',NULL,NULL,NULL,'name',0,'text','402870876e5d9773016e5e95575601c0',NULL,0,0,NULL,NULL,'cskefu',NULL,NULL,'uk_entcustomer',NULL,100,0,1,0,255,1,0,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,1,NULL,NULL,0,0,0,NULL,0,NULL,NULL,0,NULL,NULL,0),('402870876e5d9773016e5e95575801c3','单位性质',NULL,NULL,NULL,'etype',0,'text','402870876e5d9773016e5e95575601c0',NULL,0,0,NULL,NULL,'cskefu',NULL,NULL,'uk_entcustomer',NULL,100,0,1,0,60,1,1,'com.dic.customer.etype',NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,1,NULL,NULL,0,0,0,NULL,0,NULL,NULL,0,NULL,NULL,0),('402870876e5d9773016e5e95575b01c4','客户类别',NULL,NULL,NULL,'ekind',0,'text','402870876e5d9773016e5e95575601c0',NULL,0,0,NULL,NULL,'cskefu',NULL,NULL,'uk_entcustomer',NULL,100,0,1,0,60,1,1,'com.dic.contacts.entype',NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,1,NULL,NULL,0,0,0,NULL,0,NULL,NULL,0,NULL,NULL,0),('402870876e5d9773016e5e95575c01c5','客户级别',NULL,NULL,NULL,'elevel',0,'text','402870876e5d9773016e5e95575601c0',NULL,0,0,NULL,NULL,'cskefu',NULL,NULL,'uk_entcustomer',NULL,100,0,1,0,60,1,1,'com.dic.contacts.elevel',NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,1,NULL,NULL,0,0,0,NULL,0,NULL,NULL,0,NULL,NULL,0),('402870876e5d9773016e5e95575c01c8','来源',NULL,NULL,NULL,'esource',0,'text','402870876e5d9773016e5e95575601c0',NULL,0,0,NULL,NULL,'cskefu',NULL,NULL,'uk_entcustomer',NULL,100,0,1,0,64,1,1,'com.dic.contacts.esource',NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,1,NULL,NULL,0,0,0,NULL,0,NULL,NULL,0,NULL,NULL,0),('402870876e5d9773016e5e95576101d1','电子邮件',NULL,NULL,NULL,'email',0,'text','402870876e5d9773016e5e95575601c0',NULL,0,0,NULL,NULL,'cskefu',NULL,NULL,'uk_entcustomer',NULL,100,0,1,0,128,1,0,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,1,NULL,NULL,0,0,0,NULL,0,NULL,NULL,0,NULL,NULL,0),('402870876e5d9773016e5e95576101d3','办公电话',NULL,NULL,NULL,'phone',0,'text','402870876e5d9773016e5e95575601c0',NULL,0,0,NULL,NULL,'cskefu',NULL,NULL,'uk_entcustomer',NULL,100,0,1,0,40,1,0,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,1,NULL,NULL,0,0,0,NULL,0,NULL,NULL,0,NULL,NULL,0),('402870876e5d9773016e5e95576201d8','省',NULL,NULL,NULL,'province',0,'text','402870876e5d9773016e5e95575601c0',NULL,0,0,NULL,NULL,'cskefu',NULL,NULL,'uk_entcustomer',NULL,100,0,1,0,60,1,1,'com.dic.address.area',NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,1,NULL,NULL,0,0,0,NULL,0,NULL,NULL,0,NULL,NULL,0),('402870876e5d9773016e5e95576201d9','市区县',NULL,NULL,NULL,'city',0,'text','402870876e5d9773016e5e95575601c0',NULL,0,0,NULL,NULL,'cskefu',NULL,NULL,'uk_entcustomer',NULL,100,0,1,0,60,1,1,'com.dic.address.area',NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,1,NULL,NULL,0,0,0,NULL,0,NULL,NULL,0,NULL,NULL,0),('402870876e5d9773016e5e95576201db','地址',NULL,NULL,NULL,'address',0,'text','402870876e5d9773016e5e95575601c0',NULL,0,0,NULL,NULL,'cskefu',NULL,NULL,'uk_entcustomer',NULL,100,0,1,0,255,1,0,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,1,NULL,NULL,0,0,0,NULL,0,NULL,NULL,0,NULL,NULL,0),('402870876e5d9773016e5e95576301e3','所属行业',NULL,NULL,NULL,'industry',0,'text','402870876e5d9773016e5e95575601c0',NULL,0,0,NULL,NULL,'cskefu',NULL,NULL,'uk_entcustomer',NULL,100,0,1,0,60,1,1,'com.dic.contacts.industry',NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,1,NULL,NULL,0,0,0,NULL,0,NULL,NULL,0,NULL,NULL,0),('402870876e5d9773016e5e95576301e4','效力状态',NULL,NULL,NULL,'validstatus',0,'text','402870876e5d9773016e5e95575601c0',NULL,0,0,NULL,NULL,'cskefu',NULL,NULL,'uk_entcustomer',NULL,100,0,1,0,50,1,1,'com.dic.contacts.validstatus',NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,1,NULL,NULL,0,0,0,NULL,0,NULL,NULL,0,NULL,NULL,0),('402870876e5d9773016e5e95576301ef','描述',NULL,NULL,NULL,'description',0,'text','402870876e5d9773016e5e95575601c0',NULL,0,0,NULL,NULL,'cskefu',NULL,NULL,'uk_entcustomer',NULL,100,0,1,0,65535,1,0,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,1,NULL,NULL,0,0,0,NULL,0,NULL,NULL,0,NULL,NULL,0),('402870876e5d9773016e5e95576401f0','创建人',NULL,NULL,NULL,'creater',0,'text','402870876e5d9773016e5e95575601c0',NULL,0,0,NULL,NULL,'cskefu',NULL,NULL,'uk_entcustomer',NULL,100,0,1,0,60,1,0,'',NULL,NULL,'','userdata',NULL,NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,1,NULL,NULL,0,0,0,NULL,0,NULL,NULL,0,NULL,NULL,0),('402870876e5d9773016e5e95576401f4','修改时间',NULL,NULL,NULL,'updatetime',0,'datetime','402870876e5d9773016e5e95575601c0',NULL,0,0,NULL,NULL,'cskefu',NULL,NULL,'uk_entcustomer',NULL,100,0,1,0,19,1,0,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,1,NULL,NULL,0,0,0,NULL,0,NULL,NULL,0,NULL,NULL,0),('402870876e5d9773016e5e95576401f6','创建时间',NULL,NULL,NULL,'createtime',0,'datetime','402870876e5d9773016e5e95575601c0',NULL,0,0,NULL,NULL,'cskefu',NULL,NULL,'uk_entcustomer',NULL,100,0,1,0,19,1,0,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,1,NULL,NULL,0,0,0,NULL,0,NULL,NULL,0,NULL,NULL,0),('402870876e5d9773016e5e95576401f9','分享给',NULL,NULL,NULL,'shares',0,'text','402870876e5d9773016e5e95575601c0',NULL,0,0,NULL,NULL,'cskefu',NULL,NULL,'uk_entcustomer',NULL,100,0,1,0,255,1,0,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,1,NULL,NULL,0,0,0,NULL,0,NULL,NULL,0,NULL,NULL,0),('402870876e5d9773016e5e9cc6380272','坐席用户名',NULL,NULL,NULL,'agentusername',0,'text','402870876e5d9773016e5e9cc6370270',NULL,0,0,NULL,NULL,'cskefu',NULL,NULL,'uk_servicesummary',NULL,100,0,1,0,100,1,0,'',NULL,NULL,'','userdata',NULL,NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,1,NULL,NULL,0,0,0,NULL,0,NULL,NULL,0,NULL,NULL,0),('402870876e5d9773016e5e9cc6380275','服务次数',NULL,NULL,NULL,'times',0,'number','402870876e5d9773016e5e9cc6370270',NULL,0,0,NULL,NULL,'cskefu',NULL,NULL,'uk_servicesummary',NULL,100,0,1,0,10,1,0,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,1,NULL,NULL,0,0,0,NULL,0,NULL,NULL,0,NULL,NULL,0),('402870876e5d9773016e5e9cc6390278','用户名',NULL,NULL,NULL,'username',0,'text','402870876e5d9773016e5e9cc6370270',NULL,0,0,NULL,NULL,'cskefu',NULL,NULL,'uk_servicesummary',NULL,100,0,1,0,100,1,0,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,1,NULL,NULL,0,0,0,NULL,0,NULL,NULL,0,NULL,NULL,0),('402870876e5d9773016e5e9cc63a027a','渠道',NULL,NULL,NULL,'channel',0,'text','402870876e5d9773016e5e9cc6370270',NULL,0,0,NULL,NULL,'cskefu',NULL,NULL,'uk_servicesummary',NULL,100,0,1,0,32,1,0,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,1,NULL,NULL,0,0,0,NULL,0,NULL,NULL,0,NULL,NULL,0),('402870876e5d9773016e5e9cc63a027b','登录时间',NULL,NULL,NULL,'logindate',0,'datetime','402870876e5d9773016e5e9cc6370270',NULL,0,0,NULL,NULL,'cskefu',NULL,NULL,'uk_servicesummary',NULL,100,0,1,0,19,1,0,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,1,NULL,NULL,0,0,0,NULL,0,NULL,NULL,0,NULL,NULL,0),('402870876e5d9773016e5e9cc63a027c','服务类型',NULL,NULL,NULL,'servicetype',0,'text','402870876e5d9773016e5e9cc6370270',NULL,0,0,NULL,NULL,'cskefu',NULL,NULL,'uk_servicesummary',NULL,100,0,1,0,65535,1,0,'com.dic.db.type',NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,1,NULL,NULL,0,0,0,NULL,0,NULL,NULL,0,NULL,NULL,0),('402870876e5d9773016e5e9cc63a027d','是否预约',NULL,NULL,NULL,'reservation',0,'text','402870876e5d9773016e5e9cc6370270',NULL,0,0,NULL,NULL,'cskefu',NULL,NULL,'uk_servicesummary',NULL,100,0,1,0,3,1,1,'com.dic.yesorno',NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,1,NULL,NULL,0,0,0,NULL,0,NULL,NULL,0,NULL,NULL,0),('402870876e5d9773016e5e9cc63b027e','预约方式',NULL,NULL,NULL,'reservtype',0,'text','402870876e5d9773016e5e9cc6370270',NULL,0,0,NULL,NULL,'cskefu',NULL,NULL,'uk_servicesummary',NULL,100,0,1,0,32,1,1,'com.dic.summary.reservtype',NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,1,NULL,NULL,0,0,0,NULL,0,NULL,NULL,0,NULL,NULL,0),('402870876e5d9773016e5e9cc63b027f','reservtime',NULL,NULL,NULL,'reservtime',0,'datetime','402870876e5d9773016e5e9cc6370270',NULL,0,0,NULL,NULL,'cskefu',NULL,NULL,'uk_servicesummary',NULL,100,0,1,0,19,1,0,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,1,NULL,NULL,0,0,0,NULL,0,NULL,NULL,0,NULL,NULL,0),('402870876e5d9773016e5e9cc63b0280','电子邮件',NULL,NULL,NULL,'email',0,'text','402870876e5d9773016e5e9cc6370270',NULL,0,0,NULL,NULL,'cskefu',NULL,NULL,'uk_servicesummary',NULL,100,0,1,0,100,1,0,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,1,NULL,NULL,0,0,0,NULL,0,NULL,NULL,0,NULL,NULL,0),('402870876e5d9773016e5e9cc63b0281','电话号码',NULL,NULL,NULL,'phonenumber',0,'text','402870876e5d9773016e5e9cc6370270',NULL,0,0,NULL,NULL,'cskefu',NULL,NULL,'uk_servicesummary',NULL,100,0,1,0,32,1,0,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,1,NULL,NULL,0,0,0,NULL,0,NULL,NULL,0,NULL,NULL,0),('402870876e5d9773016e5e9cc63b0282','服务记录',NULL,NULL,NULL,'summary',0,'text','402870876e5d9773016e5e9cc6370270',NULL,0,0,NULL,NULL,'cskefu',NULL,NULL,'uk_servicesummary',NULL,100,0,1,0,65535,1,0,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,1,NULL,NULL,0,0,0,NULL,0,NULL,NULL,0,NULL,NULL,0),('402870876e5d9773016e5e9cc63b0284','创建人',NULL,NULL,NULL,'creater',0,'text','402870876e5d9773016e5e9cc6370270',NULL,0,0,NULL,NULL,'cskefu',NULL,NULL,'uk_servicesummary',NULL,100,0,1,0,32,1,0,'',NULL,NULL,'','userdata',NULL,NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,1,NULL,NULL,0,0,0,NULL,0,NULL,NULL,0,NULL,NULL,0),('402870876e5d9773016e5e9cc63c0285','创建时间',NULL,NULL,NULL,'createtime',0,'datetime','402870876e5d9773016e5e9cc6370270',NULL,0,0,NULL,NULL,'cskefu',NULL,NULL,'uk_servicesummary',NULL,100,0,1,0,19,1,0,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,1,NULL,NULL,0,0,0,NULL,0,NULL,NULL,0,NULL,NULL,0),('402870876e5d9773016e5e9cc63d028c','process',NULL,NULL,NULL,'process',0,'text','402870876e5d9773016e5e9cc6370270',NULL,0,0,NULL,NULL,'cskefu',NULL,NULL,'uk_servicesummary',NULL,100,0,1,0,3,1,0,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,1,NULL,NULL,0,0,0,NULL,0,NULL,NULL,0,NULL,NULL,0),('402870876e5d9773016e5e9cc63d028d','updateuser',NULL,NULL,NULL,'updateuser',0,'text','402870876e5d9773016e5e9cc6370270',NULL,0,0,NULL,NULL,'cskefu',NULL,NULL,'uk_servicesummary',NULL,100,0,1,0,32,1,0,'',NULL,NULL,'','userdata',NULL,NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,1,NULL,NULL,0,0,0,NULL,0,NULL,NULL,0,NULL,NULL,0),('402870876e5d9773016e5e9cc63d028e','updatetime',NULL,NULL,NULL,'updatetime',0,'datetime','402870876e5d9773016e5e9cc6370270',NULL,0,0,NULL,NULL,'cskefu',NULL,NULL,'uk_servicesummary',NULL,100,0,1,0,19,1,0,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,1,NULL,NULL,0,0,0,NULL,0,NULL,NULL,0,NULL,NULL,0),('402870876e5d9773016e5e9cc63d028f','processmemo',NULL,NULL,NULL,'processmemo',0,'text','402870876e5d9773016e5e9cc6370270',NULL,0,0,NULL,NULL,'cskefu',NULL,NULL,'uk_servicesummary',NULL,100,0,1,0,65535,1,0,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,1,NULL,NULL,0,0,0,NULL,0,NULL,NULL,0,NULL,NULL,0);
/*!40000 ALTER TABLE `uk_tableproperties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uk_tabletask`
--

DROP TABLE IF EXISTS `uk_tabletask`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uk_tabletask` (
  `ID` varchar(32) NOT NULL DEFAULT '' COMMENT '主键ID',
  `NAME` varchar(255) DEFAULT NULL COMMENT '元数据表名称',
  `SECURE` varchar(255) DEFAULT NULL COMMENT '安全级别',
  `TASKSTATUS` varchar(255) DEFAULT NULL COMMENT '任务状态',
  `TABLEDIRID` varchar(255) DEFAULT NULL COMMENT '数据表目录ID',
  `DBID` varchar(255) DEFAULT NULL COMMENT '数据源ID',
  `CODE` varchar(255) DEFAULT NULL COMMENT '代码',
  `GROUPID` varchar(255) DEFAULT NULL COMMENT '分组ID',
  `CREATER` varchar(32) DEFAULT NULL COMMENT '创建人',
  `CREATERNAME` varchar(255) DEFAULT NULL COMMENT '创建人姓名',
  `TASKTYPE` varchar(255) DEFAULT NULL COMMENT '任务类型',
  `TASKNAME` varchar(255) DEFAULT NULL COMMENT '任务名称',
  `TASKPLAN` varchar(255) DEFAULT NULL COMMENT '任务计划',
  `CONFIGURE` varchar(255) DEFAULT NULL COMMENT '配置',
  `SECURECONF` varchar(255) DEFAULT NULL COMMENT '安全级别',
  `USERID` varchar(255) DEFAULT NULL COMMENT '用户ID',
  `PREVIEWTEMPLET` text COMMENT '预览模板',
  `LISTBLOCKTEMPLET` text COMMENT '详情模板',
  `TABLENAME` varchar(255) DEFAULT NULL COMMENT '数据表名称',
  `TABLETYPE` varchar(255) DEFAULT NULL COMMENT '数据表类型',
  `STARTINDEX` int(11) NOT NULL COMMENT '开始位置',
  `UPDATETIME` datetime DEFAULT NULL COMMENT '更新时间',
  `UPDATETIMENUMBER` int(11) NOT NULL COMMENT '更新时间时间戳',
  `DATASQL` longtext COMMENT 'SQL',
  `DATABASETASK` varchar(32) DEFAULT NULL COMMENT '数据库任务',
  `DRIVERPLUGIN` varchar(32) DEFAULT NULL COMMENT '驱动',
  `ORGI` varchar(32) DEFAULT NULL COMMENT '租户ID',
  `WORKFLOW` tinyint(10) DEFAULT NULL COMMENT '流程',
  `FROMDB` tinyint(4) DEFAULT NULL COMMENT '来源数据库',
  `tabtype` varchar(32) DEFAULT NULL COMMENT '切换类型',
  `pid` varchar(32) DEFAULT NULL COMMENT '外部ID',
  `secmenuid` varchar(32) DEFAULT NULL COMMENT '二级菜单ID',
  `reportid` varchar(32) DEFAULT NULL COMMENT '报表ID',
  `eventname` varchar(32) DEFAULT NULL COMMENT '事件名称',
  `tltemplet` varchar(32) DEFAULT NULL COMMENT '标题模板',
  `timeline` tinyint(4) DEFAULT NULL COMMENT '时间',
  `tbversion` int(11) DEFAULT NULL COMMENT '版本',
  `LASTUPDATE` datetime DEFAULT NULL COMMENT '最近更新时间',
  `CREATETIME` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='元数据信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uk_tabletask`
--

LOCK TABLES `uk_tabletask` WRITE;
/*!40000 ALTER TABLE `uk_tabletask` DISABLE KEYS */;
INSERT INTO `uk_tabletask` VALUES ('2c9480886e91d9e5016e91f528ab018d','uk_contacts',NULL,NULL,'0',NULL,NULL,NULL,'2c9480886e91d9e5016e91db8df10017','xianli',NULL,'uk_contacts',NULL,NULL,NULL,NULL,NULL,NULL,'uk_contacts','1',0,'2019-11-22 15:13:13',0,NULL,NULL,NULL,'cskefu',0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,'2019-11-22 15:13:13'),('402870876e5d9773016e5e95575601c0','uk_entcustomer',NULL,NULL,'0',NULL,NULL,NULL,'402870876e4f5bdd016e4f77eb6f0075','xiaoxiao',NULL,'uk_entcustomer',NULL,NULL,NULL,NULL,NULL,NULL,'uk_entcustomer','1',0,'2019-11-12 15:47:53',0,NULL,NULL,NULL,'cskefu',0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,'2019-11-12 15:47:53'),('402870876e5d9773016e5e9cc6370270','uk_servicesummary',NULL,NULL,'0',NULL,NULL,NULL,'402870876e4f5bdd016e4f77eb6f0075','xiaoxiao',NULL,'uk_servicesummary',NULL,NULL,NULL,NULL,NULL,NULL,'uk_servicesummary','1',0,'2019-11-12 15:56:02',0,NULL,NULL,NULL,'cskefu',0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,'2019-11-12 15:56:02');
/*!40000 ALTER TABLE `uk_tabletask` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uk_tag`
--

DROP TABLE IF EXISTS `uk_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uk_tag` (
  `id` varchar(32) NOT NULL COMMENT '主键ID',
  `tag` varchar(100) DEFAULT NULL COMMENT '标签',
  `orgi` varchar(32) DEFAULT NULL COMMENT '租户ID',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `times` int(11) DEFAULT NULL COMMENT '引用次数',
  `creater` varchar(32) DEFAULT NULL COMMENT '创建人',
  `tagtype` varchar(32) DEFAULT NULL COMMENT '标签类型',
  `icon` varchar(50) DEFAULT NULL COMMENT '图标',
  `color` varchar(10) DEFAULT NULL COMMENT '颜色',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='标签表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uk_tag`
--

LOCK TABLES `uk_tag` WRITE;
/*!40000 ALTER TABLE `uk_tag` DISABLE KEYS */;
INSERT INTO `uk_tag` VALUES ('2c938088650ce8ee01650d5b9be0057d','准客户','cskefu','2018-08-06 03:50:32',0,'4028cac3614cd2f901614cf8be1f0324','callout',NULL,'4'),('2c938088650ce8ee01650db8de77068f','白领','cskefu','2018-08-06 12:38:57',0,'4028cac3614cd2f901614cf8be1f0324','user',NULL,'1'),('2c938088650ce8ee01650db911570699','工单','cskefu','2018-08-06 05:32:37',0,'4028cac3614cd2f901614cf8be1f0324','workorders',NULL,'1'),('2c938088650ce8ee01650db93ff8069f','呼叫中心服务','cskefu','2018-08-06 05:32:49',0,'4028cac3614cd2f901614cf8be1f0324','ccsummary',NULL,'1'),('2c938088650ce8ee01650db9781306a6','知识库','cskefu','2018-08-06 05:33:03',0,'4028cac3614cd2f901614cf8be1f0324','kbs',NULL,''),('2c938088650ce8ee01650db9932606ac','质检','cskefu','2018-08-06 05:33:10',0,'4028cac3614cd2f901614cf8be1f0324','quality',NULL,''),('2c938088650ce8ee01650db9c08d06b2','服务类型','cskefu','2018-08-06 05:33:21',0,'4028cac3614cd2f901614cf8be1f0324','summary',NULL,''),('2c938088650f407301650f4393b604b0','闲聊','cskefu','2018-08-06 12:43:46',0,'4028cac3614cd2f901614cf8be1f0324','user',NULL,'2'),('2c938088650f407301650f44145c04bb','爱产品','cskefu','2018-08-06 12:44:04',0,'4028cac3614cd2f901614cf8be1f0324','user',NULL,'6');
/*!40000 ALTER TABLE `uk_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uk_tagrelation`
--

DROP TABLE IF EXISTS `uk_tagrelation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uk_tagrelation` (
  `id` varchar(32) NOT NULL COMMENT '主键ID',
  `tagid` varchar(32) DEFAULT NULL COMMENT '标签ID',
  `userid` varchar(32) DEFAULT NULL COMMENT '创建人',
  `dataid` varchar(32) DEFAULT NULL COMMENT '数据ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='标签映射关系表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uk_tagrelation`
--

LOCK TABLES `uk_tagrelation` WRITE;
/*!40000 ALTER TABLE `uk_tagrelation` DISABLE KEYS */;
INSERT INTO `uk_tagrelation` VALUES ('2c938088650f21fa01650f3e9280047b','2c938088650ce8ee01650db8de77068f','f749aa5ba5345ef7a4da8bdd037721bc','f749aa5ba5345ef7a4da8bdd037721bc'),('2c938088650f407301650f4446b804c1','2c938088650f407301650f4393b604b0','f749aa5ba5345ef7a4da8bdd037721bc','f749aa5ba5345ef7a4da8bdd037721bc'),('2c938088650f407301650f44516704c3','2c938088650f407301650f44145c04bb','f749aa5ba5345ef7a4da8bdd037721bc','f749aa5ba5345ef7a4da8bdd037721bc'),('2c938088651795c7016518897d3e07a6','2c938088650f407301650f4393b604b0','6fe7570a9749a83aece9b3e27a9bce25','6fe7570a9749a83aece9b3e27a9bce25');
/*!40000 ALTER TABLE `uk_tagrelation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uk_templet`
--

DROP TABLE IF EXISTS `uk_templet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uk_templet` (
  `ID` varchar(32) NOT NULL COMMENT '主键ID',
  `NAME` varchar(255) DEFAULT NULL COMMENT '模板名称',
  `DESCRIPTION` longtext COMMENT '描述',
  `CODE` varchar(255) DEFAULT NULL COMMENT '代码',
  `GROUPID` varchar(255) DEFAULT NULL COMMENT '组ID',
  `CREATETIME` datetime DEFAULT NULL COMMENT '创建时间',
  `USERID` varchar(255) DEFAULT NULL COMMENT '创建人ID',
  `TEMPLETTITLE` varchar(500) DEFAULT NULL COMMENT '模板标题内容',
  `TEMPLETTEXT` longtext COMMENT '模板内容',
  `TEMPLETTYPE` varchar(255) DEFAULT NULL COMMENT '模板类型',
  `ORGI` varchar(32) DEFAULT NULL COMMENT '租户ID',
  `ICONSTR` varchar(255) DEFAULT NULL COMMENT '自定义样式',
  `MEMO` varchar(255) DEFAULT NULL COMMENT '备注',
  `ORDERINDEX` int(11) DEFAULT NULL COMMENT '排序位置',
  `TYPEID` varchar(32) DEFAULT NULL COMMENT '分类ID',
  `SELDATA` tinyint(4) DEFAULT NULL COMMENT '启用外键',
  `layoutcols` int(11) DEFAULT '0' COMMENT '布局列数',
  `datatype` varchar(32) DEFAULT NULL COMMENT '数据类型',
  `charttype` varchar(32) DEFAULT NULL COMMENT '图表类型',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='模板表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uk_templet`
--

LOCK TABLES `uk_templet` WRITE;
/*!40000 ALTER TABLE `uk_templet` DISABLE KEYS */;
INSERT INTO `uk_templet` VALUES ('4028811b618d0dca01618f99e056035c','四列布局',NULL,'layout',NULL,'2018-02-13 22:38:01',NULL,NULL,'<div class=\"layui-col-md3 ukefu-col\" data-colspan=\"3\" data-index=\"1\" data-mid=\"${model.id}\">\r\n	<#list reportModels as element>\r\n	<#if element.parentid?? && element.parentid == model.id && element.colindex == 1>\r\n	<#assign eltemplet = element.templet()>\r\n	<#include \"/apps/business/report/design/element.html\">\r\n	</#if>\r\n	</#list>\r\n</div>\r\n<div class=\"layui-col-md3 ukefu-col\" data-colspan=\"3\" data-index=\"2\" data-mid=\"${model.id}\">\r\n	<#list reportModels as element>\r\n	<#if element.parentid?? && element.parentid == model.id && element.colindex == 2>\r\n	<#assign eltemplet = element.templet()>\r\n	<#include \"/apps/business/report/design/element.html\">\r\n	</#if>\r\n	</#list>\r\n</div>\r\n<div class=\"layui-col-md3 ukefu-col\" data-colspan=\"3\" data-index=\"3\" data-mid=\"${model.id}\">\r\n	<#list reportModels as element>\r\n	<#if element.parentid?? && element.parentid == model.id && element.colindex == 3>\r\n	<#assign eltemplet = element.templet()>\r\n	<#include \"/apps/business/report/design/element.html\">\r\n	</#if>\r\n	</#list>\r\n</div>\r\n<div class=\"layui-col-md3 ukefu-col\" data-colspan=\"3\" data-index=\"4\" data-mid=\"${model.id}\">\r\n	<#list reportModels as element>\r\n	<#if element.parentid?? && element.parentid == model.id && element.colindex == 4>\r\n	<#assign eltemplet = element.templet()>\r\n	<#include \"/apps/business/report/design/element.html\">\r\n	</#if>\r\n	</#list>\r\n</div>','4028811b618d0dca01618d5a5fd10349','cskefu','/images/design/four.png',NULL,NULL,NULL,NULL,4,NULL,NULL),('4028811b618d0dca01618f99f175035d','三列布局',NULL,'layout',NULL,'2018-02-13 22:38:06',NULL,NULL,'<div class=\"layui-col-md4 ukefu-col\" data-colspan=\"4\" data-index=\"1\" data-mid=\"${model.id}\">\r\n	<#list reportModels as element>\r\n	<#if element.parentid?? && element.parentid == model.id && element.colindex == 1>\r\n	<#assign eltemplet = element.templet()>\r\n	<#include \"/apps/business/report/design/element.html\">\r\n	</#if>\r\n	</#list>\r\n</div>\r\n<div class=\"layui-col-md4 ukefu-col\" data-colspan=\"4\" data-index=\"2\" data-mid=\"${model.id}\">\r\n	<#list reportModels as element>\r\n	<#if element.parentid?? && element.parentid == model.id && element.colindex == 2>\r\n	<#assign eltemplet = element.templet()>\r\n	<#include \"/apps/business/report/design/element.html\">\r\n	</#if>\r\n	</#list>\r\n</div>\r\n<div class=\"layui-col-md4 ukefu-col\" data-colspan=\"4\" data-index=\"3\" data-mid=\"${model.id}\">\r\n	<#list reportModels as element>\r\n	<#if element.parentid?? && element.parentid == model.id && element.colindex == 3>\r\n	<#assign eltemplet = element.templet()>\r\n	<#include \"/apps/business/report/design/element.html\">\r\n	</#if>\r\n	</#list>\r\n</div>','4028811b618d0dca01618d5a5fd10349','cskefu','/images/design/three.png',NULL,NULL,NULL,NULL,3,NULL,NULL),('4028811b618d0dca01618f9a08c5035e','两列布局',NULL,'layout',NULL,'2018-02-13 22:38:12',NULL,NULL,'<div class=\"layui-col-md6 ukefu-col\" data-colspan=\"6\" data-index=\"1\" data-mid=\"${model.id}\">\r\n	<#list reportModels as element>\r\n	<#if element.parentid?? && element.parentid == model.id && element.colindex == 1>\r\n	<#assign eltemplet = element.templet()>\r\n	<#include \"/apps/business/report/design/element.html\">\r\n	</#if>\r\n	</#list>\r\n</div>\r\n<div class=\"layui-col-md6 ukefu-col\" data-colspan=\"6\" data-index=\"2\" data-mid=\"${model.id}\">\r\n	<#list reportModels as element>\r\n	<#if element.parentid?? && element.parentid == model.id && element.colindex == 2>\r\n	<#assign eltemplet = element.templet()>\r\n	<#include \"/apps/business/report/design/element.html\">\r\n	</#if>\r\n	</#list>\r\n</div>','4028811b618d0dca01618d5a5fd10349','cskefu','/images/design/two.png',NULL,NULL,NULL,NULL,2,NULL,NULL),('4028811b618d0dca01618f9a1aee035f','一列布局',NULL,'layout',NULL,'2018-02-13 22:38:16',NULL,NULL,'<div class=\"layui-col-md12 ukefu-col\" data-colspan=\"12\" data-index=\"1\" data-mid=\"${model.id}\">\r\n	<#list reportModels as element>\r\n	<#if element.parentid?? && element.parentid == model.id && element.colindex == 1>\r\n	<#assign eltemplet = element.templet()>\r\n	<#include \"/apps/business/report/design/element.html\">\r\n	</#if>\r\n	</#list>\r\n</div>','4028811b618d0dca01618d5a5fd10349','cskefu','/images/design/one.png',NULL,NULL,NULL,NULL,1,NULL,NULL),('4028811b6191e289016191e4721c033d','数据表',NULL,'report',NULL,'2018-02-14 09:18:43',NULL,NULL,'<#if reportData??>\r\n<table class=\"layui-table ukefu-report\">\r\n  <thead>\r\n	<#if reportData?? && reportData.col?? && reportData.col.title??>\r\n	  <#list reportData.col.title as tlist>\r\n		<tr class=\"sortableTr\">\r\n		  <#if reportData.col.title?size gt 1 && tlist_index==0 && reportData.row.title?size gt 0>\r\n			<td align=\"center\" colspan=\"${reportData.row.title?size}\" rowspan=\"${reportData.col.title?size-1}\" class=\"s_blue\"></td>\r\n		  </#if>\r\n		  <#if (tlist_index+1)==reportData.col.title?size && reportData.row?? && reportData.row.firstTitle??>\r\n			<#list reportData.row.firstTitle as first>\r\n			  <td align=\"center\" data-title=\"${first.name?url}\" data-flag=\"dim\">${first.rename!first.name!\'\'}				\r\n			</#list>\r\n		  </#if>\r\n		  <#if tlist??>\r\n			<#list tlist as tl>\r\n			  <td align=\"center\" <#if tl.leveltype?? && tl.leveltype==\"newcol\">rowspan=\"${reportData.col.title?size}\"</#if>colspan=\"${tl.colspan}\" > ${tl.rename!tl.name!\"\"}\r\n				</td>\r\n			</#list>\r\n			</#if>\r\n	</tr>\r\n	</#list>\r\n	</#if>\r\n  </thead>\r\n  <tbody>\r\n	<#if reportData?? && reportData.data??>\r\n	  <#list reportData.data as values>\r\n		<tr class=\"rowcell\">\r\n		  <#if reportData.row?? && reportData.row.title?? && reportData.row.title?size gt 0>\r\n			<#list reportData.row.title as tl>\r\n			  <#assign rows=0>\r\n				<#list tl as title>\r\n				  <#if title??>\r\n					<#if rows==values_index && title.name !=\"TOTAL_TEMP\">\r\n					  	<#if title.leveltype !=\"newrow_extend_sum\">\r\n						<td nowrap=\"nowrap\" align=\"center\" class=\"blue_k <#if title.total == true>total</#if>\" rowspan=\"${title.rowspan!\'0\'}\" <#if title.colspan gt 1>colspan=\"${title.colspan}\"</#if>>\r\n						  ${title.formatName!\'\'}</td>\r\n						</#if>\r\n						<#if title.valueData??>\r\n						  <#list title.valueData as value>\r\n							<#if value.merge==false>\r\n							  <td rowspan=\"${value.rowspan}\" colspan=\"${value.colspan}\" align=\"center\" class=\"measure ${value.vtclass!\'\'}\" nowrap=\"nowrap\" <#if value.cellmergeid??>data-cellmerge=\"${value.cellmergeid}\"</#if>>\r\n							${value.valueStyle!value.foramatValue!\'\'}</td>\r\n							</#if>\r\n							</#list>\r\n						  </#if>\r\n					  </#if>\r\n					  <#assign rows=rows + title.rowspan>\r\n				  </#if>\r\n			</#list>\r\n	</#list>\r\n	<#else>\r\n	  <#list values as value>\r\n		<td class=\"row \" style=\"text-align: right;<#if value.valueType?? && value.valueType == \'total\'>background-color:#c5daed;</#if>\">\r\n		  ${value.valueStyle!value.foramatValue!\'\'}</td>\r\n	  </#list>\r\n	  </#if>\r\n	  </tr>\r\n	  </#list>\r\n	  </#if>\r\n  </tbody>\r\n</table>\r\n<#if reportModel?? && reportModel.isloadfulldata == \'true\'>\r\n<#if reportData?? && reportData.total gt reportData.pageSize>\r\n<div class=\"row\" style=\"padding:5px;\">\r\n	<div class=\"col-lg-12\" id=\"page_${reportModel.id!\'\'}\" style=\"text-align:center;\"></div>\r\n</div>\r\n</#if>\r\n<script>\r\n	layui.use([\'laypage\', \'layer\',\'form\'], function(){\r\n		  var laypage = layui.laypage\r\n		  ,layer = layui.layer;\r\n		  laypage.render({\r\n			  elem:\'page_${reportModel.id!\'\'}\'\r\n				,count: <#if reportData??>${reportData.total}<#else>0</#if> \r\n				,curr:<#if reportData??>${reportData.page}<#else>0</#if>\r\n				,groups: 5 \r\n				,limit:<#if reportData?? && reportData.pageSize gt 0>${reportData.pageSize}<#else>20</#if>\r\n				,jump:function(data , first){\r\n					if(!first){\r\n						loadURL(\"/apps/report/design/getelement.html?id=<#if reportModel??>${reportModel.id!\'\'}</#if>&p=\"+data.curr,\"#${reportModel.id!\'\'}\");\r\n					}\r\n				}\r\n		   });\r\n		});\r\n</script>\r\n</#if>\r\n<#else>\r\n<div class=\"layui-form\">\r\n  <table class=\"layui-table\">\r\n    <thead>\r\n      <tr><th>人物</th><th>民族</th><th>格言</th></tr> \r\n    </thead>\r\n    <tbody>\r\n      <tr><td>贤心</td><td>汉族</td><td>人生似修行</td>\r\n      </tr>\r\n      <tr><td>张爱玲</td><td>汉族</td><td>时间</td></tr>\r\n      <tr><td>Helen Keller</td><td>拉丁美裔</td><td>nothing</td></tr>\r\n    </tbody>\r\n  </table>\r\n</div>\r\n</#if>','4028811b618d0dca01618d5a5fe6034a','cskefu','/images/design/table.png',NULL,NULL,NULL,NULL,0,'simple',NULL),('4028811b6191e289016191e76714033e','金字塔图',NULL,'report',NULL,'2018-02-14 09:21:57',NULL,NULL,'	<script>\r\n	<#if reportData??>\r\n	var data_${element.mid!\'\'} = [];\r\n		<#if reportData.row??>\r\n			<#list reportData.row.title as title>\r\n				<#if (title_index+1) == reportData.row.title?size>\r\n					<#list title as rowtl>\r\n						var obj_${element.mid!\'\'} = new Object();\r\n						obj_${element.mid!\'\'}[\"_name\"] = \"${rowtl.rename!rowtl.name!\'\'}\";\r\n						<#if reportData.col??>\r\n						<#list reportData.col.title as coltlist>\r\n							<#list coltlist as coltl>\r\n								<#if reportData?? && reportData.data??>\r\n									<#list reportData.data as values>\r\n										<#if rowtl_index == values_index>\r\n											<#list values as val>	\r\n												<#if coltl_index == val_index && val_index == 0>\r\n													obj_${element.mid!\'\'}[\'key\'] = ${val.valueStyle!val.foramatValue!\'\'}\r\n												</#if>\r\n												<#if coltl_index == val_index && val_index == 1>\r\n													obj_${element.mid!\'\'}[\'value\'] = ${val.valueStyle!val.foramatValue!\'\'}\r\n												</#if>\r\n											</#list>\r\n										</#if>\r\n									</#list>\r\n								</#if>\r\n							</#list>\r\n						</#list>	\r\n						</#if>\r\n						data_${element.mid!\'\'}.push(obj_${element.mid!\'\'})						\r\n					</#list>			\r\n				</#if>\r\n			</#list>\r\n		</#if>\r\n		<#else>\r\n		const data_${element.mid!\'\'} = [\r\n					{ key: \'浏览网站\', value: 50000 },\r\n					{ key: \'放入购物车\', value: 35000 },\r\n					{ key: \'生成订单\', value: 25000 },\r\n					{ key: \'支付订单\', value: 15000 },\r\n					{ key: \'完成交易\', value: 8000 }\r\n				  ];		\r\n		</#if>	\r\n	  const dv_${element.mid!\'\'} = data_${element.mid!\'\'};\r\n	var json_${element.mid!\'\'} =  $.parseJSON( $(\"#json_${element.mid!\'\'}\").text() );\r\n	  $(\"#json_${element.mid!\'\'}\").remove();\r\n	  ChartAction.renderChart(\'${element.mid!\'\'}\',dv_${element.mid!\'\'},json_${element.mid!\'\'})\r\n	</script>\r\n','4028811b618d0dca01618d5a5fe6034a','cskefu','/images/design/jzt.png',NULL,NULL,NULL,NULL,0,NULL,'pyramid'),('4028811b6191e289016191e7c554033f','地图',NULL,'report',NULL,'2018-02-14 09:22:21',NULL,NULL,'	<script>\r\n	<#if reportData??>\r\n	var data_${element.mid!\'\'} = [];\r\n	<#if reportData.row??>\r\n		<#list reportData.row.title as title>\r\n			<#if (title_index+1) == reportData.row.title?size>\r\n				<#list title as rowtl>	\r\n					var obj_${element.mid!\'\'} = new Object();\r\n					obj_${element.mid!\'\'}[\"key\"] = \'${rowtl.rename!rowtl.name!\'\'}\';\r\n					<#if reportData.col??>\r\n						<#list reportData.col.title as coltlist>\r\n							<#list coltlist as coltl>\r\n								<#if coltl_index == 0>	\r\n									<#list reportData.data as values>\r\n										<#if rowtl_index == values_index>\r\n											<#list values as val>	\r\n												<#if coltl_index == 0>\r\n													obj_${element.mid!\'\'}[\"value\"] = ${val.valueStyle!val.foramatValue!\'\'}\r\n												</#if>\r\n											</#list>\r\n										</#if>\r\n									</#list>									\r\n								</#if>																			\r\n							</#list>\r\n						</#list>\r\n					</#if>	\r\n					data_${element.mid!\'\'}.push(obj_${element.mid!\'\'});		\r\n				</#list>										\r\n			</#if>\r\n		</#list>\r\n	</#if>		\r\n	</#if>	\r\n	let func_${element.mid!\'\'} = function(geoJson){\r\n	<#if !reportData??>\r\n		const data1_${element.mid!\'\'} = [];\r\n		  for (let i = 0; i < geoJson.length; i++) {\r\n	  	      let name = geoJson[i].properties.name;\r\n	  	      data1_${element.mid!\'\'}.push({\r\n	  	        key: name,\r\n	  	        value: Math.round(Math.random() * 1000),\r\n	  	      });\r\n	  	    }\r\n	<#else>\r\n		const data1_${element.mid!\'\'} = [];\r\n		for (let i = 0; i < geoJson.length; i++) {\r\n			let name = geoJson[i].properties.name;\r\n			let value = 0;\r\n			for (let j = 0; j < data_${element.mid!\'\'}.length;j++) {				  	      \r\n			  let name2 = data_${element.mid!\'\'}[j][\"key\"];\r\n			  if(name == name2){\r\n				value = data_${element.mid!\'\'}[j].value;\r\n			  }	      \r\n	  	    }\r\n			data1_${element.mid!\'\'}.push({\r\n	  	        key: name,\r\n	  	        value: value,\r\n	  	      });\r\n	  	    }\r\n	</#if>\r\n	\r\n		let mapData_${element.mid!\'\'} = {\r\n	      type: \'FeatureCollection\',\r\n	      features: geoJson\r\n		};\r\n	    let ds_${element.mid!\'\'} = new DataSet();\r\n	    let geoDataView_${element.mid!\'\'} = ds_${element.mid!\'\'}.createView().source(mapData_${element.mid!\'\'}, {\r\n	      type: \'GeoJSON\',\r\n	    });\r\n\r\n	    // 用户数据\r\n	    let dvData_${element.mid!\'\'} = ds_${element.mid!\'\'}.createView().source(data1_${element.mid!\'\'});\r\n	    dvData_${element.mid!\'\'}.transform({\r\n	      type: \'geo.region\',\r\n	      field: \'key\',\r\n	      geoDataView: geoDataView_${element.mid!\'\'},\r\n	      as: [\'longitude\', \'lantitude\'],\r\n	    });\r\n	   var json_${element.mid!\'\'} =  $.parseJSON( $(\"#json_${element.mid!\'\'}\").text() );\r\n	  $(\"#json_${element.mid!\'\'}\").remove();\r\n	  ChartAction.renderChart(\'${element.mid!\'\'}\',dvData_${element.mid!\'\'},json_${element.mid!\'\'})\r\n	}\r\n	    mapLoad(func_${element.mid!\'\'});\r\n	</script>','4028811b618d0dca01618d5a5fe6034a','cskefu','/images/design/map.png',NULL,NULL,NULL,NULL,0,NULL,'map'),('4028811b6191e289016191ea38620340','漏斗图',NULL,'report',NULL,'2018-02-14 09:25:01',NULL,NULL,'	<script>\r\n	<#if reportData??>\r\n	var data_${element.mid!\'\'} = [];\r\n		<#if reportData.row??>\r\n			<#list reportData.row.title as title>\r\n				<#if (title_index+1) == reportData.row.title?size>\r\n					<#list title as rowtl>\r\n						var obj_${element.mid!\'\'} = new Object();\r\n						obj_${element.mid!\'\'}[\"_name\"] = \"${rowtl.rename!rowtl.name!\'\'}\";\r\n						<#if reportData.col??>\r\n						<#list reportData.col.title as coltlist>\r\n							<#list coltlist as coltl>\r\n								<#if reportData?? && reportData.data??>\r\n									<#list reportData.data as values>\r\n										<#if rowtl_index == values_index>\r\n											<#list values as val>	\r\n												<#if coltl_index == val_index && val_index == 0>\r\n													obj_${element.mid!\'\'}[\'key\'] = ${val.valueStyle!val.foramatValue!\'\'}\r\n												</#if>\r\n												<#if coltl_index == val_index && val_index == 1>\r\n													obj_${element.mid!\'\'}[\'value\'] = ${val.valueStyle!val.foramatValue!\'\'}\r\n												</#if>\r\n											</#list>\r\n										</#if>\r\n									</#list>\r\n								</#if>\r\n							</#list>\r\n						</#list>	\r\n						</#if>\r\n						data_${element.mid!\'\'}.push(obj_${element.mid!\'\'})						\r\n					</#list>			\r\n				</#if>\r\n			</#list>\r\n		</#if>\r\n		<#else>\r\n		const data_${element.mid!\'\'} = [\r\n					{ key: \'浏览网站\', value: 50000 },\r\n					{ key: \'放入购物车\', value: 35000 },\r\n					{ key: \'生成订单\', value: 25000 },\r\n					{ key: \'支付订单\', value: 15000 },\r\n					{ key: \'完成交易\', value: 8000 }\r\n				  ];		\r\n		</#if>	\r\n	  const dv_${element.mid!\'\'} = data_${element.mid!\'\'};\r\n	var json_${element.mid!\'\'} =  $.parseJSON( $(\"#json_${element.mid!\'\'}\").text() );\r\n	  $(\"#json_${element.mid!\'\'}\").remove();\r\n	  ChartAction.renderChart(\'${element.mid!\'\'}\',dv_${element.mid!\'\'},json_${element.mid!\'\'})\r\n	</script>\r\n','4028811b618d0dca01618d5a5fe6034a','cskefu','/images/design/loudou.png',NULL,NULL,NULL,NULL,0,NULL,'funnel'),('4028811b6191e289016191eba2190341','折线图',NULL,'report',NULL,'2018-02-14 09:26:34',NULL,NULL,'	<script>\r\n	<#if reportData??>\r\n	var data_${element.mid!\'\'} = [];\r\n	var mea_${element.mid!\'\'} = [];\r\n		<#if reportData.row??>\r\n			<#list reportData.row.title as title>\r\n				<#if (title_index+1) == reportData.row.title?size>\r\n					<#if reportData.col??>\r\n						<#list reportData.col.title as coltlist>\r\n							<#list coltlist as coltl>\r\n									var obj_${element.mid!\'\'} = new Object();\r\n									obj_${element.mid!\'\'}[\"_name\"] = \"${coltl.rename!coltl.name!\'\'}\";\r\n									<#list title as rowtl2>							\r\n									<#if reportData?? && reportData.data??>\r\n										<#list reportData.data as values>\r\n											<#if rowtl2_index == values_index>\r\n												<#list values as val>	\r\n													<#if coltl_index == val_index>\r\n														obj_${element.mid!\'\'}[\"${rowtl2.rename!rowtl2.name!\'\'}\"] = ${val.valueStyle!val.foramatValue!\'\'}\r\n													</#if>\r\n												</#list>\r\n											</#if>\r\n										</#list>\r\n									</#if>\r\n									</#list>\r\n									data_${element.mid!\'\'}.push(obj_${element.mid!\'\'});						\r\n							</#list>\r\n						</#list>\r\n					</#if>\r\n					<#list title as rowtl>						\r\n						mea_${element.mid!\'\'}.push(\'${rowtl.rename!rowtl.name!\'\'}\');						\r\n					</#list>\r\n				</#if>\r\n			</#list>\r\n		</#if>\r\n	<#else>\r\n		const data_${element.mid!\'\'} = [\r\n			{ _name:\'London\', \'Jan.\': 18.9, \'Feb.\': 28.8, \'Mar.\' :39.3, \'Apr.\': 81.4, \'May\': 47, \'Jun.\': 20.3, \'Jul.\': 24, \'Aug.\': 35.6 },\r\n			{ _name:\'Berlin\', \'Jan.\': 12.4, \'Feb.\': 23.2, \'Mar.\' :34.5, \'Apr.\': 99.7, \'May\': 52.6, \'Jun.\': 35.5, \'Jul.\': 37.4, \'Aug.\': 42.4}\r\n		  ];\r\n		const mea_${element.mid!\'\'} =  [ \'Jan.\',\'Feb.\',\'Mar.\',\'Apr.\',\'May\',\'Jun.\',\'Jul.\',\'Aug.\' ];\r\n	</#if>\r\n	const ds_${element.mid!\'\'} = new DataSet();\r\n	  const dv_${element.mid!\'\'} = ds_${element.mid!\'\'}.createView().source(data_${element.mid!\'\'});\r\n	  dv_${element.mid!\'\'}.transform({\r\n		type: \'fold\',\r\n		fields: mea_${element.mid!\'\'}, // 展开字段集\r\n		key: \'key\', // key字段\r\n		value: \'value\', // value字段\r\n	  });\r\n		var json_${element.mid!\'\'} =  $.parseJSON( $(\"#json_${element.mid!\'\'}\").text() );\r\n	  $(\"#json_${element.mid!\'\'}\").remove();\r\n	  ChartAction.renderChart(\'${element.mid!\'\'}\',dv_${element.mid!\'\'},json_${element.mid!\'\'})\r\n	</script>\r\n','4028811b618d0dca01618d5a5fe6034a','cskefu','/images/design/line.gif',NULL,NULL,NULL,NULL,0,NULL,'line'),('4028811b6191e289016191ebf9ae0342','柱形图',NULL,'report',NULL,'2018-02-14 09:26:56',NULL,NULL,'	<script>\r\n	<#if reportData??>\r\n	var data_${element.mid!\'\'} = [];\r\n	var mea_${element.mid!\'\'} = [];\r\n		<#if reportData.row??>\r\n			<#list reportData.row.title as title>\r\n				<#if (title_index+1) == reportData.row.title?size>\r\n					<#if reportData.col??>\r\n						<#list reportData.col.title as coltlist>\r\n							<#list coltlist as coltl>\r\n									var obj_${element.mid!\'\'} = new Object();\r\n									obj_${element.mid!\'\'}[\"_name\"] = \"${coltl.rename!coltl.name!\'\'}\";\r\n									<#list title as rowtl2>							\r\n									<#if reportData?? && reportData.data??>\r\n										<#list reportData.data as values>\r\n											<#if rowtl2_index == values_index>\r\n												<#list values as val>	\r\n													<#if coltl_index == val_index>\r\n														obj_${element.mid!\'\'}[\"${rowtl2.rename!rowtl2.name!\'\'}\"] = ${val.valueStyle!val.foramatValue!\'\'}\r\n													</#if>\r\n												</#list>\r\n											</#if>\r\n										</#list>\r\n									</#if>\r\n									</#list>\r\n									data_${element.mid!\'\'}.push(obj_${element.mid!\'\'});						\r\n							</#list>\r\n						</#list>\r\n					</#if>\r\n					<#list title as rowtl>						\r\n						mea_${element.mid!\'\'}.push(\'${rowtl.rename!rowtl.name!\'\'}\');						\r\n					</#list>\r\n				</#if>\r\n			</#list>\r\n		</#if>\r\n	<#else>\r\n		const data_${element.mid!\'\'} = [\r\n			{ _name:\'London\', \'Jan.\': 18.9, \'Feb.\': 28.8, \'Mar.\' :39.3, \'Apr.\': 81.4, \'May\': 47, \'Jun.\': 20.3, \'Jul.\': 24, \'Aug.\': 35.6 },\r\n			{ _name:\'Berlin\', \'Jan.\': 12.4, \'Feb.\': 23.2, \'Mar.\' :34.5, \'Apr.\': 99.7, \'May\': 52.6, \'Jun.\': 35.5, \'Jul.\': 37.4, \'Aug.\': 42.4}\r\n		  ];\r\n		const mea_${element.mid!\'\'} =  [ \'Jan.\',\'Feb.\',\'Mar.\',\'Apr.\',\'May\',\'Jun.\',\'Jul.\',\'Aug.\' ];\r\n	</#if>\r\n	const ds_${element.mid!\'\'} = new DataSet();\r\n	  const dv_${element.mid!\'\'} = ds_${element.mid!\'\'}.createView().source(data_${element.mid!\'\'});\r\n	  dv_${element.mid!\'\'}.transform({\r\n		type: \'fold\',\r\n		fields: mea_${element.mid!\'\'}, // 展开字段集\r\n		key: \'key\', // key字段	\r\n		value: \'value\', // value字段\r\n	  });\r\n	  var json_${element.mid!\'\'} =  $.parseJSON( $(\"#json_${element.mid!\'\'}\").text() );\r\n	  $(\"#json_${element.mid!\'\'}\").remove();\r\n	  ChartAction.renderChart(\'${element.mid!\'\'}\',dv_${element.mid!\'\'},json_${element.mid!\'\'})\r\n	</script>\r\n\r\n\r\n','4028811b618d0dca01618d5a5fe6034a','cskefu','/images/design/bar.gif',NULL,NULL,NULL,NULL,0,NULL,'histogram'),('4028811b6191e289016191ec3c900343','饼形图',NULL,'report',NULL,'2018-02-14 09:27:13',NULL,NULL,'	<script>\r\n	<#if reportData??>\r\n	var data_${element.mid!\'\'} = [];\r\n	var field_${element.mid!\'\'}  = \"\";\r\n	<#if reportData.row??>\r\n		<#list reportData.row.title as title>\r\n			<#if (title_index+1) == reportData.row.title?size>\r\n				<#list title as rowtl>	\r\n					var obj_${element.mid!\'\'} = new Object();\r\n					obj_${element.mid!\'\'}[\"key\"] = \'${rowtl.rename!rowtl.name!\'\'}\';\r\n					<#if reportData.col??>\r\n						<#list reportData.col.title as coltlist>\r\n							<#list coltlist as coltl>\r\n								<#if coltl_index == 0>	\r\n									<#list reportData.data as values>\r\n										<#if rowtl_index == values_index>\r\n											<#list values as val>	\r\n												<#if coltl_index == 0>\r\n													obj_${element.mid!\'\'}[\"${coltl.rename!coltl.name!\'\'}\"] = ${val.valueStyle!val.foramatValue!\'\'}\r\n													field_${element.mid!\'\'}  = \'${coltl.rename!coltl.name!\'\'}\';\r\n												</#if>\r\n											</#list>\r\n										</#if>\r\n									</#list>									\r\n								</#if>																			\r\n							</#list>\r\n						</#list>\r\n					</#if>	\r\n					data_${element.mid!\'\'}.push(obj_${element.mid!\'\'});		\r\n				</#list>										\r\n			</#if>\r\n		</#list>\r\n	</#if>\r\n	<#else>\r\n		const data_${element.mid!\'\'} = [\r\n			{ key: \'事例一\', count: 40 },\r\n			{ key: \'事例二\', count: 21 },\r\n			{ key: \'事例三\', count: 17 },\r\n			{ key: \'事例四\', count: 13 },\r\n			{ key: \'事例五\', count: 9 }\r\n		  ];\r\n		  var field_${element.mid!\'\'}  = \"count\";\r\n	</#if>\r\n		console.info(data_${element.mid!\'\'})\r\n		console.info(field_${element.mid!\'\'})\r\n		const { DataView } = DataSet;\r\n	  const dv_${element.mid!\'\'} = new DataView();\r\n	  dv_${element.mid!\'\'}.source(data_${element.mid!\'\'}).transform({\r\n		type: \'percent\',\r\n		field: field_${element.mid!\'\'},\r\n		dimension: \'key\',\r\n		as: \'value\'\r\n	  });\r\n	   var json_${element.mid!\'\'} =  $.parseJSON( $(\"#json_${element.mid!\'\'}\").text() );\r\n	  $(\"#json_${element.mid!\'\'}\").remove();\r\n	  ChartAction.renderChart(\'${element.mid!\'\'}\',dv_${element.mid!\'\'},json_${element.mid!\'\'})\r\n	</script>','4028811b618d0dca01618d5a5fe6034a','cskefu','/images/design/pie.gif',NULL,NULL,NULL,NULL,0,NULL,'pie'),('4028811b6191e289016191ec901f0344','面积图',NULL,'report',NULL,'2018-02-14 09:27:35',NULL,NULL,'	<script>\r\n	<#if reportData??>\r\n	var data_${element.mid!\'\'} = [];\r\n	var mea_${element.mid!\'\'} = [];\r\n		<#if reportData.row??>\r\n			<#list reportData.row.title as title>\r\n				<#if (title_index+1) == reportData.row.title?size>\r\n					<#if reportData.col??>\r\n						<#list reportData.col.title as coltlist>\r\n							<#list coltlist as coltl>\r\n									var obj_${element.mid!\'\'} = new Object();\r\n									obj_${element.mid!\'\'}[\"_name\"] = \"${coltl.rename!coltl.name!\'\'}\";\r\n									<#list title as rowtl2>							\r\n									<#if reportData?? && reportData.data??>\r\n										<#list reportData.data as values>\r\n											<#if rowtl2_index == values_index>\r\n												<#list values as val>	\r\n													<#if coltl_index == val_index>\r\n														obj_${element.mid!\'\'}[\"${rowtl2.rename!rowtl2.name!\'\'}\"] = ${val.valueStyle!val.foramatValue!\'\'}\r\n													</#if>\r\n												</#list>\r\n											</#if>\r\n										</#list>\r\n									</#if>\r\n									</#list>\r\n									data_${element.mid!\'\'}.push(obj_${element.mid!\'\'});						\r\n							</#list>\r\n						</#list>\r\n					</#if>\r\n					<#list title as rowtl>						\r\n						mea_${element.mid!\'\'}.push(\'${rowtl.rename!rowtl.name!\'\'}\');						\r\n					</#list>\r\n				</#if>\r\n			</#list>\r\n		</#if>		\r\n	<#else>\r\n		const data_${element.mid!\'\'} = [\r\n			{ _name:\'London\', \'Jan.\': 18.9, \'Feb.\': 28.8, \'Mar.\' :39.3, \'Apr.\': 81.4, \'May\': 47, \'Jun.\': 20.3, \'Jul.\': 24, \'Aug.\': 35.6 },\r\n			{ _name:\'Berlin\', \'Jan.\': 12.4, \'Feb.\': 23.2, \'Mar.\' :34.5, \'Apr.\': 99.7, \'May\': 52.6, \'Jun.\': 35.5, \'Jul.\': 37.4, \'Aug.\': 42.4}\r\n		  ];\r\n		const mea_${element.mid!\'\'} =  [ \'Jan.\',\'Feb.\',\'Mar.\',\'Apr.\',\'May\',\'Jun.\',\'Jul.\',\'Aug.\' ];\r\n	</#if>	\r\n	const { DataView } = DataSet;	\r\n	const ds_${element.mid!\'\'} = new DataSet();\r\n	const dv_${element.mid!\'\'} = new DataView().source(data_${element.mid!\'\'});\r\n	  dv_${element.mid!\'\'}.transform({\r\n		type: \'fold\',\r\n		fields: mea_${element.mid!\'\'}, // 展开字段集\r\n		key: \'key\', // key字段\r\n		value: \'value\', // value字段\r\n	  });  \r\n	   var json_${element.mid!\'\'} =  $.parseJSON( $(\"#json_${element.mid!\'\'}\").text() );\r\n	  $(\"#json_${element.mid!\'\'}\").remove();\r\n	  ChartAction.renderChart(\'${element.mid!\'\'}\',dv_${element.mid!\'\'},json_${element.mid!\'\'})\r\n	</script>','4028811b618d0dca01618d5a5fe6034a','cskefu','/images/design/area.gif',NULL,NULL,NULL,NULL,0,NULL,'area'),('4028811b6191e289016191ed0e160345','条形图',NULL,'report',NULL,'2018-02-14 09:28:07',NULL,NULL,'	<script>\r\n	<#if reportData??>\r\n	var data_${element.mid!\'\'} = [];\r\n	var mea_${element.mid!\'\'} = [];\r\n		<#if reportData.row??>\r\n			<#list reportData.row.title as title>\r\n				<#if (title_index+1) == reportData.row.title?size>\r\n					<#if reportData.col??>\r\n						<#list reportData.col.title as coltlist>\r\n							<#list coltlist as coltl>\r\n									var obj_${element.mid!\'\'} = new Object();\r\n									obj_${element.mid!\'\'}[\"_name\"] = \"${coltl.rename!coltl.name!\'\'}\";\r\n									<#list title as rowtl2>							\r\n									<#if reportData?? && reportData.data??>\r\n										<#list reportData.data as values>\r\n											<#if rowtl2_index == values_index>\r\n												<#list values as val>	\r\n													<#if coltl_index == val_index>\r\n														obj_${element.mid!\'\'}[\"${rowtl2.rename!rowtl2.name!\'\'}\"] = ${val.valueStyle!val.foramatValue!\'\'}\r\n													</#if>\r\n												</#list>\r\n											</#if>\r\n										</#list>\r\n									</#if>\r\n									</#list>\r\n									data_${element.mid!\'\'}.push(obj_${element.mid!\'\'});						\r\n							</#list>\r\n						</#list>\r\n					</#if>\r\n					<#list title as rowtl>						\r\n						mea_${element.mid!\'\'}.push(\'${rowtl.rename!rowtl.name!\'\'}\');						\r\n					</#list>\r\n				</#if>\r\n			</#list>\r\n		</#if>\r\n	<#else>\r\n		const data_${element.mid!\'\'} = [\r\n			{ _name:\'London\', \'Jan.\': 18.9, \'Feb.\': 28.8, \'Mar.\' :39.3, \'Apr.\': 81.4, \'May\': 47, \'Jun.\': 20.3, \'Jul.\': 24, \'Aug.\': 35.6 },\r\n			{ _name:\'Berlin\', \'Jan.\': 12.4, \'Feb.\': 23.2, \'Mar.\' :34.5, \'Apr.\': 99.7, \'May\': 52.6, \'Jun.\': 35.5, \'Jul.\': 37.4, \'Aug.\': 42.4}\r\n		  ];\r\n		const mea_${element.mid!\'\'} =  [ \'Jan.\',\'Feb.\',\'Mar.\',\'Apr.\',\'May\',\'Jun.\',\'Jul.\',\'Aug.\' ];\r\n	</#if>\r\n	const ds_${element.mid!\'\'} = new DataSet();\r\n	  const dv_${element.mid!\'\'} = ds_${element.mid!\'\'}.createView().source(data_${element.mid!\'\'});\r\n	  dv_${element.mid!\'\'}.transform({\r\n		type: \'fold\',\r\n		fields: mea_${element.mid!\'\'}, // 展开字段集\r\n		key: \'key\', // key字段\r\n		value: \'value\', // value字段\r\n	  });\r\n	  \r\n	   var json_${element.mid!\'\'} =  $.parseJSON( $(\"#json_${element.mid!\'\'}\").text() );\r\n	  $(\"#json_${element.mid!\'\'}\").remove();\r\n	  ChartAction.renderChart(\'${element.mid!\'\'}\',dv_${element.mid!\'\'},json_${element.mid!\'\'})\r\n	</script>','4028811b618d0dca01618d5a5fe6034a','cskefu','/images/design/flat.gif',NULL,NULL,NULL,NULL,0,NULL,'bar'),('4028811b6191e289016191ed46550346','环形图',NULL,'report',NULL,'2018-02-14 09:28:21',NULL,NULL,'	<script>\r\n	<#if reportData??>\r\n	var data_${element.mid!\'\'} = [];\r\n	var field_${element.mid!\'\'}  = \"\";\r\n	<#if reportData.row??>\r\n		<#list reportData.row.title as title>\r\n			<#if (title_index+1) == reportData.row.title?size>\r\n				<#list title as rowtl>	\r\n					var obj_${element.mid!\'\'} = new Object();\r\n					obj_${element.mid!\'\'}[\"item\"] = \'${rowtl.rename!rowtl.name!\'\'}\';\r\n					<#if reportData.col??>\r\n						<#list reportData.col.title as coltlist>\r\n							<#list coltlist as coltl>\r\n								<#if coltl_index == 0>	\r\n									<#list reportData.data as values>\r\n										<#if rowtl_index == values_index>\r\n											<#list values as val>	\r\n												<#if coltl_index == 0>\r\n													obj_${element.mid!\'\'}[\"${coltl.rename!coltl.name!\'\'}\"] = ${val.valueStyle!val.foramatValue!\'\'}\r\n													field_${element.mid!\'\'}  = \'${coltl.rename!coltl.name!\'\'}\';\r\n												</#if>\r\n											</#list>\r\n										</#if>\r\n									</#list>									\r\n								</#if>																			\r\n							</#list>\r\n						</#list>\r\n					</#if>	\r\n					data_${element.mid!\'\'}.push(obj_${element.mid!\'\'});		\r\n				</#list>										\r\n			</#if>\r\n		</#list>\r\n	</#if>\r\n	<#else>\r\n		const data_${element.mid!\'\'} = [\r\n			{ key: \'事例一\', count: 40 },\r\n			{ key: \'事例二\', count: 21 },\r\n			{ key: \'事例三\', count: 17 },\r\n			{ key: \'事例四\', count: 13 },\r\n			{ key: \'事例五\', count: 9 }\r\n		  ];\r\n		  var field_${element.mid!\'\'}  = \"count\";\r\n	</#if>\r\n		const { DataView } = DataSet;\r\n	  const dv_${element.mid!\'\'} = new DataView();\r\n	  dv_${element.mid!\'\'}.source(data_${element.mid!\'\'}).transform({\r\n		type: \'percent\',\r\n		field: field_${element.mid!\'\'},\r\n		dimension: \'key\',\r\n		as: \'value\'\r\n	  });\r\n	   var json_${element.mid!\'\'} =  $.parseJSON( $(\"#json_${element.mid!\'\'}\").text() );\r\n	  $(\"#json_${element.mid!\'\'}\").remove();\r\n	  ChartAction.renderChart(\'${element.mid!\'\'}\',dv_${element.mid!\'\'},json_${element.mid!\'\'})\r\n	</script>','4028811b618d0dca01618d5a5fe6034a','cskefu','/images/design/hole.gif',NULL,NULL,NULL,NULL,0,NULL,'ring'),('4028811b6191e289016191ed97a80347','点状图',NULL,'report',NULL,'2018-02-14 09:28:42',NULL,NULL,'	<script>\r\n	<#if reportData??>\r\n	var data_${element.mid!\'\'} = [];\r\n		<#if reportData.row??>\r\n			<#list reportData.row.title as title>\r\n				<#if (title_index+1) == reportData.row.title?size>\r\n					<#list title as rowtl>\r\n						var obj_${element.mid!\'\'} = new Object();\r\n						obj_${element.mid!\'\'}[\"_name\"] = \"${rowtl.rename!rowtl.name!\'\'}\";\r\n						<#if reportData.col??>\r\n						<#list reportData.col.title as coltlist>\r\n							<#list coltlist as coltl>\r\n								<#if reportData?? && reportData.data??>\r\n									<#list reportData.data as values>\r\n										<#if rowtl_index == values_index>\r\n											<#list values as val>	\r\n												<#if coltl_index == val_index && val_index == 0>\r\n													obj_${element.mid!\'\'}[\'key\'] = ${val.valueStyle!val.foramatValue!\'\'}\r\n												</#if>\r\n												<#if coltl_index == val_index && val_index == 1>\r\n													obj_${element.mid!\'\'}[\'value\'] = ${val.valueStyle!val.foramatValue!\'\'}\r\n												</#if>\r\n											</#list>\r\n										</#if>\r\n									</#list>\r\n								</#if>\r\n							</#list>\r\n						</#list>	\r\n						</#if>\r\n						data_${element.mid!\'\'}.push(obj_${element.mid!\'\'})						\r\n					</#list>			\r\n				</#if>\r\n			</#list>\r\n		</#if>\r\n		<#else>\r\n		const data_${element.mid!\'\'} = [{\"_name\":\"female\",\"key\":161.2,\"value\":51.6},{\"_name\":\"female\",\"key\":167.5,\"value\":59},{\"_name\":\"female\",\"key\":159.5,\"value\":49.2},{\"_name\":\"female\",\"key\":157,\"value\":63},{\"_name\":\"female\",\"key\":155.8,\"value\":53.6},{\"_name\":\"female\",\"key\":170,\"value\":59},{\"_name\":\"female\",\"key\":159.1,\"value\":47.6},{\"_name\":\"female\",\"key\":166,\"value\":69.8},{\"_name\":\"female\",\"key\":176.2,\"value\":66.8},{\"_name\":\"female\",\"key\":160.2,\"value\":75.2},{\"_name\":\"female\",\"key\":172.5,\"value\":55.2},{\"_name\":\"female\",\"key\":170.9,\"value\":54.2},{\"_name\":\"female\",\"key\":172.9,\"value\":62.5},{\"_name\":\"female\",\"key\":153.4,\"value\":42},{\"_name\":\"female\",\"key\":160,\"value\":50},{\"_name\":\"female\",\"key\":147.2,\"value\":49.8},{\"_name\":\"female\",\"key\":168.2,\"value\":49.2},{\"_name\":\"female\",\"key\":175,\"value\":73.2},{\"_name\":\"female\",\"key\":157,\"value\":47.8},{\"_name\":\"female\",\"key\":167.6,\"value\":68.8},{\"_name\":\"female\",\"key\":159.5,\"value\":50.6},{\"_name\":\"female\",\"key\":175,\"value\":82.5},{\"_name\":\"female\",\"key\":166.8,\"value\":57.2},{\"_name\":\"female\",\"key\":176.5,\"value\":87.8},{\"_name\":\"female\",\"key\":170.2,\"value\":72.8},{\"_name\":\"female\",\"key\":174,\"value\":54.5},{\"_name\":\"female\",\"key\":173,\"value\":59.8},{\"_name\":\"female\",\"key\":179.9,\"value\":67.3},{\"_name\":\"female\",\"key\":170.5,\"value\":67.8},{\"_name\":\"female\",\"key\":160,\"value\":47},{\"_name\":\"female\",\"key\":154.4,\"value\":46.2},{\"_name\":\"female\",\"key\":162,\"value\":55},{\"_name\":\"female\",\"key\":176.5,\"value\":83},{\"_name\":\"female\",\"key\":160,\"value\":54.4},{\"_name\":\"female\",\"key\":152,\"value\":45.8},{\"_name\":\"female\",\"key\":162.1,\"value\":53.6},{\"_name\":\"female\",\"key\":170,\"value\":73.2},{\"_name\":\"male\",\"key\":160.2,\"value\":52.1},{\"_name\":\"female\",\"key\":161.3,\"value\":67.9}]		\r\n		</#if>	\r\n	  const dv_${element.mid!\'\'} = data_${element.mid!\'\'};\r\n	var json_${element.mid!\'\'} =  $.parseJSON( $(\"#json_${element.mid!\'\'}\").text() );\r\n	  $(\"#json_${element.mid!\'\'}\").remove();\r\n	  ChartAction.renderChart(\'${element.mid!\'\'}\',dv_${element.mid!\'\'},json_${element.mid!\'\'})\r\n	</script>\r\n','4028811b618d0dca01618d5a5fe6034a','cskefu','/images/design/point.gif',NULL,NULL,NULL,NULL,0,NULL,'dotplot'),('4028811b6191e289016191edc7b50348','雷达图',NULL,'report',NULL,'2018-02-14 09:28:54',NULL,NULL,'	<script>\r\n	<#if reportData??>\r\n	var data_${element.mid!\'\'} = [];\r\n	var mea_${element.mid!\'\'} = [];\r\n		<#if reportData.row??>\r\n			<#list reportData.row.title as title>\r\n				<#if (title_index+1) == reportData.row.title?size>\r\n					<#if reportData.col??>\r\n						<#list reportData.col.title as coltlist>\r\n							<#list coltlist as coltl>\r\n									var obj_${element.mid!\'\'} = new Object();\r\n									obj_${element.mid!\'\'}[\"_name\"] = \"${coltl.rename!coltl.name!\'\'}\";\r\n									<#list title as rowtl2>							\r\n									<#if reportData?? && reportData.data??>\r\n										<#list reportData.data as values>\r\n											<#if rowtl2_index == values_index>\r\n												<#list values as val>	\r\n													<#if coltl_index == val_index>\r\n														obj_${element.mid!\'\'}[\"${rowtl2.rename!rowtl2.name!\'\'}\"] = ${val.valueStyle!val.foramatValue!\'\'}\r\n													</#if>\r\n												</#list>\r\n											</#if>\r\n										</#list>\r\n									</#if>\r\n									</#list>\r\n									data_${element.mid!\'\'}.push(obj_${element.mid!\'\'});						\r\n							</#list>\r\n						</#list>\r\n					</#if>\r\n					<#list title as rowtl>						\r\n						mea_${element.mid!\'\'}.push(\'${rowtl.rename!rowtl.name!\'\'}\');						\r\n					</#list>\r\n				</#if>\r\n			</#list>\r\n		</#if>\r\n	<#else>\r\n		const data_${element.mid!\'\'} = [\r\n			{ _name:\'London\', \'Jan.\': 18.9, \'Feb.\': 28.8, \'Mar.\' :39.3, \'Apr.\': 81.4, \'May\': 47, \'Jun.\': 20.3, \'Jul.\': 24, \'Aug.\': 35.6 },\r\n			{ _name:\'Berlin\', \'Jan.\': 12.4, \'Feb.\': 23.2, \'Mar.\' :34.5, \'Apr.\': 99.7, \'May\': 52.6, \'Jun.\': 35.5, \'Jul.\': 37.4, \'Aug.\': 42.4}\r\n		  ];\r\n		const mea_${element.mid!\'\'} =  [ \'Jan.\',\'Feb.\',\'Mar.\',\'Apr.\',\'May\',\'Jun.\',\'Jul.\',\'Aug.\' ];\r\n	</#if>\r\n	const ds_${element.mid!\'\'} = new DataSet();\r\n	const dv_${element.mid!\'\'} = ds_${element.mid!\'\'}.createView().source(data_${element.mid!\'\'});\r\n	  dv_${element.mid!\'\'}.transform({\r\n		type: \'fold\',\r\n		fields: mea_${element.mid!\'\'}, // 展开字段集\r\n		key: \'key\', // key字段\r\n		value: \'value\', // value字段\r\n	  });\r\n	   var json_${element.mid!\'\'} =  $.parseJSON( $(\"#json_${element.mid!\'\'}\").text() );\r\n	  $(\"#json_${element.mid!\'\'}\").remove();\r\n	  ChartAction.renderChart(\'${element.mid!\'\'}\',dv_${element.mid!\'\'},json_${element.mid!\'\'})\r\n	</script>\r\n','4028811b618d0dca01618d5a5fe6034a','cskefu','/images/design/radar.gif',NULL,NULL,NULL,NULL,0,NULL,'radar'),('4028811b6191e289016191ee589c0349','KPI图',NULL,'report',NULL,'2018-02-14 09:29:32',NULL,NULL,'<div id=\"element_${reportModel.id!\'\'}\" class=\"r3-data-element\" style=\"min-width:100px;min-height:65px;\">\r\n\r\n    <#if reportModel.reportData?? && reportModel.reportData.data??>\r\n    	<#list reportModel.reportData.data as values>\r\n    		<#if values_index == 0>\r\n    			<#list values as value>\r\n    				<#if value_index ==0>\r\n    				<h1 class=\"no-margins\" <#if value.value lt 0>style=\"color:red;\"</#if>>\r\n                		${value.foramatValue!\'\'}\r\n                	</h1>\r\n                	<div class=\"stat-percent font-bold text-success\">\r\n                		<#if value.row?? && value.row.name?? && value.row.name!= \'root\' >${value.row.name!\'\'}</#if>\r\n                	</div>\r\n                	<small>\r\n                		<#if value.name??>${value.name!\'\'}</#if>\r\n                	</small>\r\n    				</#if>\r\n    			</#list>\r\n    		</#if>\r\n    	</#list>\r\n    </#if> 	\r\n</div>','4028811b618d0dca01618d5a5fe6034a','cskefu','/images/design/kpi.png',NULL,NULL,NULL,NULL,0,NULL,NULL),('4028811b6418c59701641b65e21c075b','sff',NULL,'ffff',NULL,'2018-06-20 12:13:39',NULL,NULL,'asdfasdf','4028811b6109050201610928ed6a030d','cskefu',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL),('4028811b642af06f01642afa426804cd','外部机器人输入参数',NULL,'otheraiinput',NULL,'2018-06-23 12:50:01',NULL,NULL,'{\r\n	\"service_type\": \"query\",\r\n	\"data_type\": \"${chat.msgtype!\'text\'}\",\r\n	\"app_key\": \"gamutsoft\",\r\n	\"user_id\": \"${chat.userid!\'\'}\",\r\n	\"label\": \"\",\r\n	\"data\": \"${chat.message!\'\'}\",\r\n	\"timeout\": 10\r\n}','4028811b642af06f01642af9cfa304c6','cskefu',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL),('4028811b642af06f01642afaae4f04d3','外部机器人输出参数',NULL,'otheraioutputparam',NULL,'2018-06-23 12:50:29',NULL,NULL,'{\r\n\"msgtype\":\"${data.data_type!\'text\'}\"\r\n<#if data?? && data.candidates?? && data.candidates?size gt 0>\r\n	<#assign suggest = \"[\">\r\n	<#list data.candidates as item>\r\n		<#if suggest?length gt 1>\r\n			<#assign suggest = suggest + \",\">\r\n		</#if>\r\n		<#if item.question??>\r\n			<#assign suggest = suggest + \'{\"id\":\"\'+item.kbid+\'\",\"title\":\"\'+item.question + \'\"}\'>\r\n		</#if>\r\n	</#list>\r\n	<#assign suggest = suggest + \"]\">\r\n	,\"items\":${suggest}\r\n</#if>\r\n<#if data?? && data.data?? && data.data.answer??>\r\n	,\"message\":\"${data.data.answer!\'\'}\"\r\n<#elseif data?? && data.data?? && data.data.kbid??>\r\n	,\"id\":\"${data.data.kbid!\'\'}\"\r\n	,\"detail\":true\r\n<#else>\r\n	,\"message\":\"${data.message!\'\'}\"\r\n</#if>\r\n}','4028811b642af06f01642af9cfaf04c7','cskefu',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL),('4028811b644983b60164498da54a040f','搜索输入接口',NULL,'opsearh',NULL,'2018-06-29 11:19:37',NULL,NULL,'{\r\n	\"keyword\": \"${q!\'\'}\",\r\n	\"label\":\"\"\r\n}\r\n','4028811b642af06f01642af9cfa304c6','cskefu',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL),('4028811b644983b60164498e06570416','详情输入接口',NULL,'oqrdetail',NULL,'2018-06-29 11:20:01',NULL,NULL,'{\r\n	\"kbid\": \"${id!\'\'}\",\r\n}','4028811b642af06f01642af9cfa304c6','cskefu',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL),('4028811b644a2d2e01644a2ea6770400','搜索输出接口',NULL,'searchoutput',NULL,'2018-06-29 14:15:28',NULL,NULL,'[<#if data?? && data.data??><#list data.data as kb><#if kb_index gt 0>,</#if>\r\n{\r\n	\"id\":\"${kb.kbid!\'\'}\",\r\n	\"title\":\"${(kb.title!\'\')?replace(\'\\n\',\'\')}\"\r\n}</#list></#if>\r\n]','4028811b642af06f01642af9cfaf04c7','cskefu',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL),('4028811b644a2d2e01644a334a650422','详情输出接口',NULL,'detailinput',NULL,'2018-06-29 14:20:32',NULL,NULL,'<#if data?? && data.data??>\r\n{\r\n	\"id\":\"${data.data.kbid!\'\'}\",\r\n	\"title\":\"${(data.data.title!\'\')?replace(\'\\n\',\'\')}\",\r\n	\"content\":\"${((data.data.content!\'\')?replace(\'\\n\',\'\'))?replace(\'\"\' , \'\\\\\"\')}\"\r\n}</#if>','4028811b642af06f01642af9cfaf04c7','cskefu',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL),('402881e861da4c960161da74a89e0386','报表XML模板',NULL,'reportquery',NULL,'2018-02-28 11:28:53',NULL,NULL,'<?xml version=\'1.0\' ?>\r\n<Schema name=\'ukefu\'>\r\n    <#if !cube.modeltype?? || cube.modeltype!=\"1\">\r\n    <Cube name=\'${cube.name}\'>\r\n		<#if cube.sql?? && cube.sql?length gt 0>\r\n		<View alias=\'${cube.table}\'>\r\n                        <SQL>                              \r\n							${(cube.sql!\'\')?html}\r\n                        </SQL>\r\n                </View>\r\n		<#else>\r\n		<Table name=\'${cube.table}\' />\r\n                </#if>\r\n		\r\n		<#if reportModel.properties?? && reportModel.properties?size gt 0 >\r\n			<Dimension name=\'${reportModel.name}\'>\r\n				<Hierarchy hasAll=\'true\' allMemberName=\'\'>						\r\n					<#list reportModel.properties as property>\r\n						<#list cube.dimension as dimension>\r\n							<#list dimension.cubeLevel as level>\r\n							<#if property.dataid == level.id>\r\n							<Level name=\'${level.name}\'  column=\'${level.nameAlias}\' uniqueMembers=\'${level.uniquemembers?string}\'  <#if level.parameters??>${level.parameters!\"\"}</#if>>\r\n								<#if level.attribue?? && level.attribue?length gt 0>${level.attribue!\"\"}</#if>\r\n								</Level>	\r\n							</#if>						\r\n							</#list>	\r\n						</#list>					\r\n					</#list>			\r\n				</Hierarchy>\r\n			</Dimension>        \r\n		</#if>\r\n		<#if istable?? && istable && reportModel.colproperties?? && reportModel.colproperties?size gt 0>\r\n			<Dimension name=\'${reportModel.name}_col\'>\r\n				<Hierarchy hasAll=\'true\' allMemberName=\'\'>\r\n					<#if reportModel.colproperties??>\r\n					<#list reportModel.colproperties as property>\r\n						<#list cube.dimension as dimension>\r\n							<#list dimension.cubeLevel as level>\r\n							<#if property.dataid == level.id>\r\n							<Level name=\'${level.name}\'  column=\'${level.nameAlias}\' uniqueMembers=\'${level.uniquemembers?string}\'  <#if level.parameters??>${level.parameters!\"\"}</#if>>\r\n								<#if level.attribue?? && level.attribue?length gt 0>${level.attribue!\"\"}</#if>\r\n								</Level>	\r\n							</#if>						\r\n							</#list>	\r\n						</#list>					\r\n					</#list>\r\n					</#if>\r\n				</Hierarchy>\r\n			</Dimension>\r\n		</#if>\r\n\r\n		<#if cube.measure??>\r\n			<#list cube.measure as measure>				\r\n				<#if measure.calculatedmember != true>\r\n				<Measure name=\'${measure.name}\' <#if measure.attribue?? && measure.attribue?length gt 0><#else>column=\'${measure.nameAlias}\'</#if> aggregator=\'${measure.aggregator}\' <#if measure.formatstring != \'\'>formatString=\'${measure.formatstring!\"####\"}\'<#else>formatString=\'####\'</#if>>\r\n						<#if measure.attribue?? && measure.attribue?length gt 0>\r\n						${measure.attribue!\"\"}\r\n						</#if>\r\n				</Measure>\r\n				</#if>\r\n			</#list>\r\n        </#if>\r\n		\r\n\r\n		<#if cube.measure??>\r\n			<#list cube.measure as measure>				\r\n				<#if measure.calculatedmember == true>\r\n					<CalculatedMember name=\'${measure.name}\' dimension=\'Measures\' <#if measure.parameters??>${measure.parameters!\"\"}</#if> <#if measure.formatstring?? && measure.formatstring?length gt 0>formatString=\"${measure.formatstring!\"\"}\"</#if>>\r\n                             <#if measure.attribue?? && measure.attribue?length gt 0>${measure.attribue!\"\"}</#if>\r\n                        </CalculatedMember>\r\n				</#if>\r\n			</#list>\r\n		</#if>\r\n\r\n		</Cube>	\r\n	</#if>\r\n</Schema>\r\n','402881e861da4c960161da7040bc0385','cskefu',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL),('402881e861da4c960161da74a89e0387','过滤器XML模板','','filterquery','','2018-02-28 11:28:53','',NULL,'<?xml version=\'1.0\' ?>\r\n<Schema name=\'ukefu\'>\r\n    <Cube name=\'filterquery\'>\r\n		<#if sql?? && sql?length gt 0>\r\n		<View alias=\'filter\'>\r\n                        <SQL>                              \r\n							${(sql!\'\')?html}\r\n                        </SQL>\r\n                </View>\r\n		</#if>		\r\n		<Dimension name=\'KEYVAL\'>\r\n			<Hierarchy hasAll=\'true\' allMemberName=\'\'>						\r\n				<Level name=\'KEYVAL\'  column=\'KEYVAL\' uniqueMembers=\'\' />	\r\n				<Level name=\'VAL\'  column=\'VAL\' uniqueMembers=\'\' />						\r\n			</Hierarchy>\r\n		</Dimension>		\r\n		</Cube>	\r\n</Schema>\r\n','402881e861da4c960161da7040bc0385','cskefu',NULL,'',NULL,'',NULL,0,NULL,NULL),('402881fb62084b98016208652dea0393','文本框',NULL,'text',NULL,'2018-03-09 09:34:31',NULL,NULL,'<#if filter?? && filter.modeltype == \'text\'>\r\n	<#if filter.valuefiltertype ==\'range\'>\r\n		<div class=\"layui-inline\">\r\n		    <div class=\"layui-input-inline\" style=\"width: 80px;\">\r\n		      <input type=\"text\" name=\"${filter.code!\'\'}_startvalue\" id=\"${filter.code!\'\'}_startvalue\"  class=\"layui-input\" value=\"${filter.requeststartvalue!\'\'}\" <#if filter.mustvalue?? && filter.mustvalue==\'mustvalue\'>lay-verify=required</#if> >\r\n		    </div>\r\n		    <div class=\"layui-form-mid\">-</div>\r\n		    <div class=\"layui-input-inline\" style=\"width: 80px;\">\r\n		      <input type=\"text\" name=\"${filter.code!\'\'}_endvalue\" id=\"${filter.code!\'\'}_endvalue\"  class=\"layui-input\"  value=\"${filter.requestendvalue!\'\'}\" <#if filter.mustvalue?? && filter.mustvalue==\'mustvalue\'>lay-verify=required</#if>>\r\n		    </div>\r\n		  </div>\r\n	<#else>\r\n		<div class=\"layui-input-inline\" >\r\n		      <input type=\"text\" name=\"${filter.code!\'\'}\"  id=\"${filter.code!\'\'}\"  class=\"layui-input\" value=\"${filter.requestvalue!\'\'}\" <#if filter.mustvalue?? && filter.mustvalue==\'mustvalue\'>lay-verify=required</#if>>\r\n		    </div>\r\n	</#if>\r\n</#if>\r\n<#if filter?? && filter.modeltype == \'date\'>\r\n	<#if filter.valuefiltertype ==\'range\'>\r\n		<div class=\"layui-inline\" style=\"margin-right:0px;\">\r\n		    <div class=\"layui-input-inline\" style=\"width: 98px;\">\r\n		      <input type=\"text\" name=\"${filter.code!\'\'}\" class=\"layui-input\" value=\"${filter.requeststartvalue!\'\'}\" id=\"${filter.code!\'\'}_startvalue\" >\r\n		    </div>\r\n		    <div class=\"layui-form-mid\">-</div>\r\n		    <div class=\"layui-input-inline\" style=\"width: 98px;\">\r\n		      <input type=\"text\" name=\"${filter.code!\'\'}_endvalue\"  class=\"layui-input\"  value=\"${filter.requestendvalue!\'\'}\" id=\"${filter.code!\'\'}_endvalue\" >\r\n		    </div>\r\n		  </div>\r\n		  <script>\r\n			   	layui.use(\'laydate\', function(){\r\n			  	  	var laydate = layui.laydate;\r\n			  		laydate.render({ \r\n			   	  		elem: document.getElementById(\'${filter.code!\'\'}_startvalue\'),\r\n			   		  	value: \'${filter.startvalue!\'\'}\',\r\n			   		  	type:UKHelper.getLayDateType(\'${filter.formatstr!\'\'}\'),\r\n			   		 	format: \'${filter.formatstr!\'\'}\'\r\n			   		});\r\n			  		laydate.render({ \r\n			   	  		elem: document.getElementById(\'${filter.code!\'\'}_endvalue\'),\r\n			   		  	value: \'${filter.endvalue!\'\'}\',\r\n			   		  	type:UKHelper.getLayDateType(\'${filter.formatstr!\'\'}\'),\r\n			   		 	format: \'${filter.formatstr!\'\'}\'\r\n			   		});\r\n			  	});\r\n		   	</script>\r\n	<#else>\r\n		<div class=\"layui-input-inline\" >\r\n		      <input type=\"text\" name=\"${filter.code!\'\'}\" id=\"${filter.code!\'\'}\"  class=\"layui-input\" >\r\n		    </div>\r\n		   	<script>\r\n			   	layui.use(\'laydate\', function(){\r\n			  	  	var laydate = layui.laydate;\r\n			  		laydate.render({ \r\n			   	  		elem: document.getElementById(\'${filter.code!\'\'}\'),\r\n			   		  	value: \'${filter.requestvalue!\'\'}\',\r\n			   		  	type:UKHelper.getLayDateType(\'${filter.formatstr!\'\'}\'),\r\n			   		 	format: \'${filter.formatstr!\'\'}\'\r\n			   		});\r\n			  	});\r\n		   	</script>\r\n	</#if>\r\n</#if>\r\n<#if filter?? && filter.modeltype == \'sigsel\'>\r\n	<#if filter.valuefiltertype ==\'range\'>\r\n	<#else>\r\n		<div class=\"layui-input-inline\" >\r\n		 	<select  <#if filter.mustvalue?? && filter.mustvalue==\'mustvalue\'>lay-verify=required</#if>  name=\"${filter.code!\'\'}\" lay-filter=${filter.code!\'\'} id=\"${filter.code!\'\'}\">\r\n				<option value=\"\" <#if !(filter.requestvalue??)>selected=selected</#if> >请选择</option>\r\n				  <#if  filter.reportData.col?? && filter.reportData.col.childeren ??>\r\n					<#list filter.reportData.col.childeren as val>\r\n		  				<option value=\"${val.name!\'\'}\" <#if filter.requestvalue == val.name>selected=selected</#if> ><#list val.childeren as key><#if key_index ==1>${key.name!\'\'}</#if></#list></option>\r\n			  		</#list>\r\n				  </#if>\r\n			</select>\r\n		 </div>\r\n		 <script>\r\n			layui.use(\'form\', function(){\r\n			  var form = layui.form;\r\n			  <#if filter?? && filter.childFilter??>\r\n			  form.on(\'select(${filter.code!\'\'})\', function(data){\r\n				  if($(\'#item_${filter.childFilter.code}\')){\r\n					  loadURL(\'/apps/report/design/filtervalchange.html?id=${filter.modelid}&fid=${filter.childFilter.id!\'\'}&publishedid=<#if publishedReport??>${publishedReport.id!\'\'}<#else></#if>&${filter.code!\'\'}=\'+data.value, \'#item_${filter.childFilter.code}\'); \r\n				  }\r\n			  });\r\n			  </#if>\r\n			  form.render();\r\n			});\r\n			</script>\r\n	</#if>\r\n</#if>\r\n','4028811b618d0dca01618d5a5ff6034b','cskefu','/images/design/table.png',NULL,NULL,NULL,NULL,0,NULL,NULL),('402881fb6208a81f016208b1f59d038e','日期选择',NULL,'date',NULL,'2018-03-09 10:58:23',NULL,NULL,'<#if filter?? && filter.modeltype == \'text\'>\r\n	<#if filter.valuefiltertype ==\'range\'>\r\n		<div class=\"layui-inline\">\r\n		    <div class=\"layui-input-inline\" style=\"width: 80px;\">\r\n		      <input type=\"text\" name=\"${filter.code!\'\'}_startvalue\" id=\"${filter.code!\'\'}_startvalue\"  class=\"layui-input\" value=\"${filter.requeststartvalue!\'\'}\" <#if filter.mustvalue?? && filter.mustvalue==\'mustvalue\'>lay-verify=required</#if> >\r\n		    </div>\r\n		    <div class=\"layui-form-mid\">-</div>\r\n		    <div class=\"layui-input-inline\" style=\"width: 80px;\">\r\n		      <input type=\"text\" name=\"${filter.code!\'\'}_endvalue\" id=\"${filter.code!\'\'}_endvalue\"  class=\"layui-input\"  value=\"${filter.requestendvalue!\'\'}\" <#if filter.mustvalue?? && filter.mustvalue==\'mustvalue\'>lay-verify=required</#if>>\r\n		    </div>\r\n		  </div>\r\n	<#else>\r\n		<div class=\"layui-input-inline\" >\r\n		      <input type=\"text\" name=\"${filter.code!\'\'}\"  id=\"${filter.code!\'\'}\"  class=\"layui-input\" value=\"${filter.requestvalue!\'\'}\" <#if filter.mustvalue?? && filter.mustvalue==\'mustvalue\'>lay-verify=required</#if>>\r\n		    </div>\r\n	</#if>\r\n</#if>\r\n<#if filter?? && filter.modeltype == \'date\'>\r\n	<#if filter.valuefiltertype ==\'range\'>\r\n		<div class=\"layui-inline\" style=\"margin-right:0px;\">\r\n		    <div class=\"layui-input-inline\" style=\"width: 98px;\">\r\n		      <input type=\"text\" name=\"${filter.code!\'\'}\" class=\"layui-input\" value=\"${filter.requeststartvalue!\'\'}\" id=\"${filter.code!\'\'}_startvalue\" >\r\n		    </div>\r\n		    <div class=\"layui-form-mid\">-</div>\r\n		    <div class=\"layui-input-inline\" style=\"width: 98px;\">\r\n		      <input type=\"text\" name=\"${filter.code!\'\'}_endvalue\"  class=\"layui-input\"  value=\"${filter.requestendvalue!\'\'}\" id=\"${filter.code!\'\'}_endvalue\" >\r\n		    </div>\r\n		  </div>\r\n		  <script>\r\n			   	layui.use(\'laydate\', function(){\r\n			  	  	var laydate = layui.laydate;\r\n			  		laydate.render({ \r\n			   	  		elem: document.getElementById(\'${filter.code!\'\'}_startvalue\'),\r\n			   		  	value: \'${filter.startvalue!\'\'}\',\r\n			   		  	type:UKHelper.getLayDateType(\'${filter.formatstr!\'\'}\'),\r\n			   		 	format: \'${filter.formatstr!\'\'}\'\r\n			   		});\r\n			  		laydate.render({ \r\n			   	  		elem: document.getElementById(\'${filter.code!\'\'}_endvalue\'),\r\n			   		  	value: \'${filter.endvalue!\'\'}\',\r\n			   		  	type:UKHelper.getLayDateType(\'${filter.formatstr!\'\'}\'),\r\n			   		 	format: \'${filter.formatstr!\'\'}\'\r\n			   		});\r\n			  	});\r\n		   	</script>\r\n	<#else>\r\n		<div class=\"layui-input-inline\" >\r\n		      <input type=\"text\" name=\"${filter.code!\'\'}\" id=\"${filter.code!\'\'}\"  class=\"layui-input\" >\r\n		    </div>\r\n		   	<script>\r\n			   	layui.use(\'laydate\', function(){\r\n			  	  	var laydate = layui.laydate;\r\n			  		laydate.render({ \r\n			   	  		elem: document.getElementById(\'${filter.code!\'\'}\'),\r\n			   		  	value: \'${filter.requestvalue!\'\'}\',\r\n			   		  	type:UKHelper.getLayDateType(\'${filter.formatstr!\'\'}\'),\r\n			   		 	format: \'${filter.formatstr!\'\'}\'\r\n			   		});\r\n			  	});\r\n		   	</script>\r\n	</#if>\r\n</#if>\r\n<#if filter?? && filter.modeltype == \'sigsel\'>\r\n	<#if filter.valuefiltertype ==\'range\'>\r\n	<#else>\r\n		<div class=\"layui-input-inline\" >\r\n		 	<select  <#if filter.mustvalue?? && filter.mustvalue==\'mustvalue\'>lay-verify=required</#if>  name=\"${filter.code!\'\'}\" lay-filter=${filter.code!\'\'} id=\"${filter.code!\'\'}\">\r\n				<option value=\"\" <#if !(filter.requestvalue??)>selected=selected</#if> >请选择</option>\r\n				  <#if  filter.reportData.col?? && filter.reportData.col.childeren ??>\r\n					<#list filter.reportData.col.childeren as val>\r\n		  				<option value=\"${val.name!\'\'}\" <#if filter.requestvalue == val.name>selected=selected</#if> ><#list val.childeren as key><#if key_index ==1>${key.name!\'\'}</#if></#list></option>\r\n			  		</#list>\r\n				  </#if>\r\n			</select>\r\n		 </div>\r\n		 <script>\r\n			layui.use(\'form\', function(){\r\n			  var form = layui.form;\r\n			  <#if filter?? && filter.childFilter??>\r\n			  form.on(\'select(${filter.code!\'\'})\', function(data){\r\n				  if($(\'#item_${filter.childFilter.code}\')){\r\n					  loadURL(\'/apps/report/design/filtervalchange.html?id=${filter.modelid}&fid=${filter.childFilter.id!\'\'}&publishedid=<#if publishedReport??>${publishedReport.id!\'\'}<#else></#if>&${filter.code!\'\'}=\'+data.value, \'#item_${filter.childFilter.code}\'); \r\n				  }\r\n			  });\r\n			  </#if>\r\n			  form.render();\r\n			});\r\n			</script>\r\n	</#if>\r\n</#if>\r\n','4028811b618d0dca01618d5a5ff6034b','cskefu','/images/design/calendar.png',NULL,NULL,NULL,NULL,0,NULL,NULL),('402881fb6208a81f016208b2491e038f','单选下拉',NULL,'sigsel',NULL,'2018-03-09 10:58:44',NULL,NULL,'<#if filter?? && filter.modeltype == \'text\'>\r\n	<#if filter.valuefiltertype ==\'range\'>\r\n		<div class=\"layui-inline\">\r\n		    <div class=\"layui-input-inline\" style=\"width: 80px;\">\r\n		      <input type=\"text\" name=\"${filter.code!\'\'}_startvalue\" id=\"${filter.code!\'\'}_startvalue\"  class=\"layui-input\" value=\"${filter.requeststartvalue!\'\'}\" <#if filter.mustvalue?? && filter.mustvalue==\'mustvalue\'>lay-verify=required</#if> >\r\n		    </div>\r\n		    <div class=\"layui-form-mid\">-</div>\r\n		    <div class=\"layui-input-inline\" style=\"width: 80px;\">\r\n		      <input type=\"text\" name=\"${filter.code!\'\'}_endvalue\" id=\"${filter.code!\'\'}_endvalue\"  class=\"layui-input\"  value=\"${filter.requestendvalue!\'\'}\" <#if filter.mustvalue?? && filter.mustvalue==\'mustvalue\'>lay-verify=required</#if>>\r\n		    </div>\r\n		  </div>\r\n	<#else>\r\n		<div class=\"layui-input-inline\" >\r\n		      <input type=\"text\" name=\"${filter.code!\'\'}\"  id=\"${filter.code!\'\'}\"  class=\"layui-input\" value=\"${filter.requestvalue!\'\'}\" <#if filter.mustvalue?? && filter.mustvalue==\'mustvalue\'>lay-verify=required</#if>>\r\n		    </div>\r\n	</#if>\r\n</#if>\r\n<#if filter?? && filter.modeltype == \'date\'>\r\n	<#if filter.valuefiltertype ==\'range\'>\r\n		<div class=\"layui-inline\" style=\"margin-right:0px;\">\r\n		    <div class=\"layui-input-inline\" style=\"width: 98px;\">\r\n		      <input type=\"text\" name=\"${filter.code!\'\'}\" class=\"layui-input\" value=\"${filter.requeststartvalue!\'\'}\" id=\"${filter.code!\'\'}_startvalue\" >\r\n		    </div>\r\n		    <div class=\"layui-form-mid\">-</div>\r\n		    <div class=\"layui-input-inline\" style=\"width: 98px;\">\r\n		      <input type=\"text\" name=\"${filter.code!\'\'}_endvalue\"  class=\"layui-input\"  value=\"${filter.requestendvalue!\'\'}\" id=\"${filter.code!\'\'}_endvalue\" >\r\n		    </div>\r\n		  </div>\r\n		  <script>\r\n			   	layui.use(\'laydate\', function(){\r\n			  	  	var laydate = layui.laydate;\r\n			  		laydate.render({ \r\n			   	  		elem: document.getElementById(\'${filter.code!\'\'}_startvalue\'),\r\n			   		  	value: \'${filter.startvalue!\'\'}\',\r\n			   		  	type:UKHelper.getLayDateType(\'${filter.formatstr!\'\'}\'),\r\n			   		 	format: \'${filter.formatstr!\'\'}\'\r\n			   		});\r\n			  		laydate.render({ \r\n			   	  		elem: document.getElementById(\'${filter.code!\'\'}_endvalue\'),\r\n			   		  	value: \'${filter.endvalue!\'\'}\',\r\n			   		  	type:UKHelper.getLayDateType(\'${filter.formatstr!\'\'}\'),\r\n			   		 	format: \'${filter.formatstr!\'\'}\'\r\n			   		});\r\n			  	});\r\n		   	</script>\r\n	<#else>\r\n		<div class=\"layui-input-inline\" >\r\n		      <input type=\"text\" name=\"${filter.code!\'\'}\" id=\"${filter.code!\'\'}\"  class=\"layui-input\" >\r\n		    </div>\r\n		   	<script>\r\n			   	layui.use(\'laydate\', function(){\r\n			  	  	var laydate = layui.laydate;\r\n			  		laydate.render({ \r\n			   	  		elem: document.getElementById(\'${filter.code!\'\'}\'),\r\n			   		  	value: \'${filter.requestvalue!\'\'}\',\r\n			   		  	type:UKHelper.getLayDateType(\'${filter.formatstr!\'\'}\'),\r\n			   		 	format: \'${filter.formatstr!\'\'}\'\r\n			   		});\r\n			  	});\r\n		   	</script>\r\n	</#if>\r\n</#if>\r\n<#if filter?? && filter.modeltype == \'sigsel\'>\r\n	<#if filter.valuefiltertype ==\'range\'>\r\n	<#else>\r\n		<div class=\"layui-input-inline\" >\r\n		 	<select  <#if filter.mustvalue?? && filter.mustvalue==\'mustvalue\'>lay-verify=required</#if>  name=\"${filter.code!\'\'}\" lay-filter=${filter.code!\'\'} id=\"${filter.code!\'\'}\">\r\n				<option value=\"\" <#if !(filter.requestvalue??)>selected=selected</#if> >请选择</option>\r\n				  <#if  filter.reportData.col?? && filter.reportData.col.childeren ??>\r\n					<#list filter.reportData.col.childeren as val>\r\n		  				<option value=\"${val.name!\'\'}\" <#if filter.requestvalue == val.name>selected=selected</#if> ><#list val.childeren as key><#if key_index ==1>${key.name!\'\'}</#if></#list></option>\r\n			  		</#list>\r\n				  </#if>\r\n			</select>\r\n		 </div>\r\n		 <script>\r\n			layui.use(\'form\', function(){\r\n			  var form = layui.form;\r\n			  <#if filter?? && filter.childFilter??>\r\n			  form.on(\'select(${filter.code!\'\'})\', function(data){\r\n				  if($(\'#item_${filter.childFilter.code}\')){\r\n					  loadURL(\'/apps/report/design/filtervalchange.html?id=${filter.modelid}&fid=${filter.childFilter.id!\'\'}&publishedid=<#if publishedReport??>${publishedReport.id!\'\'}<#else></#if>&${filter.code!\'\'}=\'+data.value, \'#item_${filter.childFilter.code}\'); \r\n				  }\r\n			  });\r\n			  </#if>\r\n			  form.render();\r\n			});\r\n			</script>\r\n	</#if>\r\n</#if>\r\n','4028811b618d0dca01618d5a5ff6034b','cskefu','/images/design/select.png',NULL,NULL,NULL,NULL,0,NULL,NULL);
/*!40000 ALTER TABLE `uk_templet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uk_tenant`
--

DROP TABLE IF EXISTS `uk_tenant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uk_tenant` (
  `id` varchar(32) NOT NULL DEFAULT '' COMMENT '租户ID',
  `datasourceid` varchar(32) DEFAULT NULL COMMENT '数据源ID',
  `tenantname` varchar(255) DEFAULT NULL COMMENT '租户名称',
  `tenantcode` varchar(255) DEFAULT NULL COMMENT '租户代码',
  `remark` varchar(200) DEFAULT NULL COMMENT '标签',
  `lastmenutime` timestamp NULL DEFAULT NULL COMMENT '菜单创建时间',
  `lastbasetime` timestamp NULL DEFAULT NULL COMMENT '数据库创建时间',
  `tenantlogo` varchar(255) DEFAULT NULL COMMENT 'LOGO',
  `tenantvalid` varchar(10) DEFAULT NULL COMMENT '验证',
  `genpasstype` varchar(255) DEFAULT NULL COMMENT '自动生成密码',
  `password` varchar(255) DEFAULT NULL COMMENT '密码',
  `adminuser` varchar(255) DEFAULT NULL COMMENT '管理员用户',
  `orgid` varchar(32) DEFAULT NULL COMMENT '企业ID',
  `initdb` tinyint(4) DEFAULT '0' COMMENT '初始化DB',
  `inites` tinyint(4) DEFAULT NULL COMMENT '初始化ES',
  `inited` tinyint(4) DEFAULT '0' COMMENT '初始化完成',
  `systemtenant` tinyint(4) DEFAULT '0' COMMENT '系统租户',
  `createtime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `sign` text COMMENT '签名',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='租户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uk_tenant`
--

LOCK TABLES `uk_tenant` WRITE;
/*!40000 ALTER TABLE `uk_tenant` DISABLE KEYS */;
/*!40000 ALTER TABLE `uk_tenant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uk_userevent`
--

DROP TABLE IF EXISTS `uk_userevent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uk_userevent` (
  `id` varchar(32) NOT NULL DEFAULT '' COMMENT '主键ID',
  `username` varchar(32) DEFAULT NULL COMMENT '用户名',
  `creater` varchar(32) DEFAULT NULL COMMENT '创建人ID',
  `orgi` varchar(50) DEFAULT NULL COMMENT '租户ID',
  `maintype` varchar(32) DEFAULT NULL COMMENT 'Spring MVC注释分类',
  `subtype` varchar(32) DEFAULT NULL COMMENT '注释二级分类',
  `name` varchar(32) DEFAULT NULL COMMENT '名称',
  `admin` tinyint(32) DEFAULT NULL COMMENT '是否管理员',
  `accessnum` tinyint(32) DEFAULT NULL COMMENT '访问次数',
  `ip` varchar(50) DEFAULT NULL COMMENT 'IP',
  `hostname` varchar(50) DEFAULT NULL COMMENT '主机名',
  `country` varchar(50) DEFAULT NULL COMMENT '国家',
  `region` varchar(50) DEFAULT NULL COMMENT '区域',
  `city` varchar(32) DEFAULT NULL COMMENT '城市',
  `isp` varchar(32) DEFAULT NULL COMMENT '运营商',
  `province` varchar(32) DEFAULT NULL COMMENT '省份',
  `url` text COMMENT '接入URL',
  `sessionid` varchar(32) DEFAULT NULL COMMENT '会话ID',
  `param` text COMMENT '请求参数',
  `times` int(11) DEFAULT NULL COMMENT '访问次数',
  `createtime` datetime DEFAULT NULL COMMENT '访问时间',
  `updatetime` datetime DEFAULT NULL COMMENT '更新时间',
  `title` varchar(255) DEFAULT NULL COMMENT '页面标题',
  `ostype` varchar(100) DEFAULT NULL COMMENT '操作系统',
  `browser` varchar(50) DEFAULT NULL COMMENT '浏览器',
  `mobile` varchar(10) DEFAULT NULL COMMENT '移动端',
  `model` varchar(10) DEFAULT NULL COMMENT '组件',
  `appid` varchar(32) DEFAULT NULL COMMENT 'SNSID',
  `createdate` varchar(32) DEFAULT NULL COMMENT '创建时间',
  `referer` varchar(255) DEFAULT NULL COMMENT '跳转URL',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='访客浏览记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uk_userevent`
--

LOCK TABLES `uk_userevent` WRITE;
/*!40000 ALTER TABLE `uk_userevent` DISABLE KEYS */;
/*!40000 ALTER TABLE `uk_userevent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uk_userrole`
--

DROP TABLE IF EXISTS `uk_userrole`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uk_userrole` (
  `id` varchar(32) NOT NULL COMMENT '主键ID',
  `user_id` varchar(32) DEFAULT NULL COMMENT '用户ID',
  `role_id` varchar(32) DEFAULT NULL COMMENT '角色ID',
  `creater` varchar(32) DEFAULT NULL COMMENT '创建人',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `orgi` varchar(32) DEFAULT NULL COMMENT '租户ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='用户角色';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uk_userrole`
--

LOCK TABLES `uk_userrole` WRITE;
/*!40000 ALTER TABLE `uk_userrole` DISABLE KEYS */;
/*!40000 ALTER TABLE `uk_userrole` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uk_webim_monitor`
--

DROP TABLE IF EXISTS `uk_webim_monitor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uk_webim_monitor` (
  `ID` varchar(50) NOT NULL COMMENT 'ID',
  `ORGI` varchar(50) DEFAULT NULL COMMENT '租户ID',
  `CREATETIME` datetime DEFAULT NULL COMMENT '记录创建时间',
  `AGENTS` int(11) DEFAULT NULL COMMENT '在线坐席数量',
  `USERS` int(11) DEFAULT NULL COMMENT '咨询中访客数量',
  `INQUENE` int(11) DEFAULT NULL COMMENT '排队访客数量',
  `BUSY` int(11) DEFAULT NULL COMMENT '示忙坐席数量',
  `TYPE` varchar(32) DEFAULT NULL COMMENT '坐席类型',
  `DATESTR` varchar(32) DEFAULT NULL COMMENT '日期字符串',
  `HOURSTR` varchar(32) DEFAULT NULL COMMENT '小时字符串',
  `DATEHOURSTR` varchar(32) DEFAULT NULL COMMENT '日期小时字符串',
  `worktype` varchar(50) DEFAULT NULL COMMENT '操作类型',
  `workresult` varchar(50) DEFAULT NULL COMMENT '操作结果',
  `dataid` varchar(50) DEFAULT NULL COMMENT '数据ID',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='坐席状态表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uk_webim_monitor`
--

LOCK TABLES `uk_webim_monitor` WRITE;
/*!40000 ALTER TABLE `uk_webim_monitor` DISABLE KEYS */;
/*!40000 ALTER TABLE `uk_webim_monitor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uk_weixinuser`
--

DROP TABLE IF EXISTS `uk_weixinuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uk_weixinuser` (
  `id` varchar(32) NOT NULL COMMENT '主键ID',
  `snsid` varchar(32) DEFAULT NULL COMMENT 'SNSID',
  `subscribe` tinyint(4) DEFAULT NULL COMMENT '是否关注公众号',
  `openid` varchar(100) DEFAULT NULL COMMENT 'OPENID',
  `nickname` varchar(50) DEFAULT NULL COMMENT '昵称',
  `sex` varchar(50) DEFAULT NULL COMMENT '性别',
  `language` varchar(50) DEFAULT NULL COMMENT '语言',
  `city` varchar(50) DEFAULT NULL COMMENT '城市',
  `province` varchar(50) DEFAULT NULL COMMENT '省份',
  `country` varchar(50) DEFAULT NULL COMMENT '国家',
  `headimgurl` varchar(255) DEFAULT NULL COMMENT '头像',
  `subscribetime` varchar(32) DEFAULT NULL COMMENT '关注时间',
  `unionid` varchar(50) DEFAULT NULL COMMENT '唯一ID',
  `sexid` varchar(50) DEFAULT NULL COMMENT '性别编码',
  `remark` varchar(100) DEFAULT NULL COMMENT '签名',
  `groupid` varchar(50) DEFAULT NULL COMMENT '组ID',
  `orgi` varchar(32) DEFAULT NULL COMMENT '租户ID',
  `contactsid` varchar(32) DEFAULT NULL COMMENT '联系人ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='微信用户信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uk_weixinuser`
--

LOCK TABLES `uk_weixinuser` WRITE;
/*!40000 ALTER TABLE `uk_weixinuser` DISABLE KEYS */;
/*!40000 ALTER TABLE `uk_weixinuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uk_work_monitor`
--

DROP TABLE IF EXISTS `uk_work_monitor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uk_work_monitor` (
  `ID` varchar(50) NOT NULL COMMENT 'ID',
  `USERID` varchar(50) DEFAULT NULL COMMENT '登录人ID',
  `AGENT` varchar(50) DEFAULT NULL COMMENT '坐席工号',
  `USERNAME` varchar(50) DEFAULT NULL COMMENT '坐席用户名（登录名）',
  `AGENTNO` varchar(50) DEFAULT NULL COMMENT '分机号（坐席登录的分机号码）',
  `NAME` varchar(50) DEFAULT NULL COMMENT '坐席姓名',
  `CODE` varchar(50) DEFAULT NULL COMMENT '坐席状态code（对应字典表里的CODE）',
  `STATUS` varchar(50) DEFAULT NULL COMMENT '坐席当前状',
  `BUSY` tinyint(4) DEFAULT '0' COMMENT '坐席是否忙',
  `WORKSTATUS` varchar(50) DEFAULT NULL COMMENT '坐席工作状态',
  `ORGI` varchar(50) DEFAULT NULL COMMENT '租户ID',
  `AGENTSERVICEID` varchar(50) DEFAULT NULL COMMENT '会话ID',
  `SKILL` varchar(50) DEFAULT NULL COMMENT '接入的技能组ID',
  `SKILLNAME` varchar(50) DEFAULT NULL COMMENT '接入的技能组名称',
  `CREATETIME` datetime DEFAULT NULL COMMENT '记录创建时间',
  `ANI` varchar(50) DEFAULT NULL COMMENT '主叫号码',
  `CALLED` varchar(50) DEFAULT NULL COMMENT '被叫号码',
  `SOURCE` varchar(50) DEFAULT NULL COMMENT '来源',
  `SERVICEID` varchar(32) DEFAULT NULL COMMENT '服务记录ID',
  `SERVICESTATUS` varchar(50) DEFAULT NULL COMMENT '当前呼叫状态',
  `DISCALLER` varchar(50) DEFAULT NULL COMMENT '主叫分机号',
  `DISCALLED` varchar(50) DEFAULT NULL COMMENT '被叫分机号',
  `ORGAN` varchar(50) DEFAULT NULL COMMENT '所属组织机构ID',
  `BEGINTIME` datetime DEFAULT NULL COMMENT '状态开始时间',
  `ENDTIME` datetime DEFAULT NULL COMMENT '状态结束时间',
  `FIRSTSTATUS` tinyint(4) DEFAULT '0' COMMENT '当天首次时间',
  `DATESTR` varchar(20) DEFAULT NULL COMMENT '日期字符串',
  `DURATION` int(11) DEFAULT NULL COMMENT '通话时长',
  `EVENTID` varchar(50) DEFAULT NULL COMMENT '事件ID',
  `WORKTYPE` varchar(32) DEFAULT NULL COMMENT '业务类型',
  `CALLENDTIME` datetime DEFAULT NULL COMMENT '结束呼叫事件',
  `CALLSTARTTIME` datetime DEFAULT NULL COMMENT '开始呼叫事件',
  `DIRECTION` varchar(50) DEFAULT NULL COMMENT '呼叫方向',
  `EXTNO` varchar(32) DEFAULT NULL COMMENT '分机号码',
  `ADMIN` tinyint(4) DEFAULT '0' COMMENT '是否管理员',
  `firsttime` tinyint(4) DEFAULT '0' COMMENT '是否首次就绪',
  `firsttimes` int(11) DEFAULT '0' COMMENT '首次就绪时长',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='坐席状态表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uk_work_monitor`
--

LOCK TABLES `uk_work_monitor` WRITE;
/*!40000 ALTER TABLE `uk_work_monitor` DISABLE KEYS */;
/*!40000 ALTER TABLE `uk_work_monitor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uk_work_session`
--

DROP TABLE IF EXISTS `uk_work_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uk_work_session` (
  `ID` varchar(50) NOT NULL COMMENT 'ID',
  `USERID` varchar(50) DEFAULT NULL COMMENT '登录人ID',
  `AGENT` varchar(50) DEFAULT NULL COMMENT '坐席工号',
  `USERNAME` varchar(50) DEFAULT NULL COMMENT '坐席用户名（登录名）',
  `AGENTNO` varchar(50) DEFAULT NULL COMMENT '分机号（坐席登录的分机号码）',
  `NAME` varchar(50) DEFAULT NULL COMMENT '坐席姓名',
  `CODE` varchar(50) DEFAULT NULL COMMENT '坐席状态code（对应字典表里的CODE）',
  `STATUS` varchar(50) DEFAULT NULL COMMENT '坐席当前状',
  `BUSY` tinyint(4) DEFAULT '0' COMMENT '坐席是否忙',
  `WORKSTATUS` varchar(50) DEFAULT NULL COMMENT '坐席工作状态',
  `ORGI` varchar(50) DEFAULT NULL COMMENT '租户ID',
  `AGENTSERVICEID` varchar(50) DEFAULT NULL COMMENT '会话ID',
  `SKILL` varchar(50) DEFAULT NULL COMMENT '接入的技能组ID',
  `SKILLNAME` varchar(50) DEFAULT NULL COMMENT '接入的技能组名称',
  `CREATETIME` datetime DEFAULT NULL COMMENT '记录创建时间',
  `ANI` varchar(50) DEFAULT NULL COMMENT '主叫号码',
  `CALLED` varchar(50) DEFAULT NULL COMMENT '被叫号码',
  `SOURCE` varchar(50) DEFAULT NULL COMMENT '来源',
  `SERVICEID` varchar(32) DEFAULT NULL COMMENT '服务记录ID',
  `SERVICESTATUS` varchar(50) DEFAULT NULL COMMENT '当前呼叫状态',
  `DISCALLER` varchar(50) DEFAULT NULL COMMENT '主叫分机号',
  `DISCALLED` varchar(50) DEFAULT NULL COMMENT '被叫分机号',
  `ORGAN` varchar(50) DEFAULT NULL COMMENT '所属组织机构ID',
  `BEGINTIME` datetime DEFAULT NULL COMMENT '状态开始时间',
  `ENDTIME` datetime DEFAULT NULL COMMENT '状态结束时间',
  `FIRSTSTATUS` tinyint(4) DEFAULT '0' COMMENT '当天首次时间',
  `DATESTR` varchar(20) DEFAULT NULL COMMENT '日期字符串',
  `DURATION` int(11) DEFAULT NULL COMMENT '通话时长',
  `IPADDR` varchar(100) DEFAULT NULL COMMENT '通话时长',
  `HOSTNAME` varchar(100) DEFAULT NULL COMMENT '通话时长',
  `ADMIN` tinyint(4) DEFAULT '0',
  `firsttime` tinyint(4) DEFAULT '0' COMMENT '是否首次就绪',
  `firsttimes` int(11) DEFAULT '0' COMMENT '首次就绪时长',
  `CLIENTID` varchar(100) DEFAULT NULL COMMENT '客户端ID',
  `SESSIONID` varchar(50) DEFAULT NULL COMMENT '会话ID',
  `WORKTYPE` varchar(32) DEFAULT NULL COMMENT '业务类型',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='坐席状态表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uk_work_session`
--

LOCK TABLES `uk_work_session` WRITE;
/*!40000 ALTER TABLE `uk_work_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `uk_work_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uk_workorder_type`
--

DROP TABLE IF EXISTS `uk_workorder_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uk_workorder_type` (
  `ID` varchar(32) NOT NULL COMMENT '主键ID',
  `NAME` varchar(50) DEFAULT NULL COMMENT '名称',
  `CODE` varchar(50) DEFAULT NULL COMMENT '代码',
  `CREATETIME` datetime DEFAULT NULL COMMENT '创建时间',
  `CREATER` varchar(32) DEFAULT NULL COMMENT '创建人',
  `UPDATETIME` datetime DEFAULT NULL COMMENT '更新时间',
  `ORGI` varchar(32) DEFAULT NULL COMMENT '租户ID',
  `USERNAME` varchar(50) DEFAULT NULL COMMENT '用户名',
  `BPM` tinyint(4) DEFAULT NULL COMMENT '启用流程',
  `PROCESSID` varchar(32) DEFAULT NULL COMMENT '流程ID',
  `SLA` tinyint(4) DEFAULT NULL COMMENT '请SLA',
  `SLAID` varchar(32) DEFAULT NULL COMMENT 'SLA指标ID',
  `PARENTID` varchar(32) DEFAULT NULL COMMENT '上级分类ID',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='工单类型表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uk_workorder_type`
--

LOCK TABLES `uk_workorder_type` WRITE;
/*!40000 ALTER TABLE `uk_workorder_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `uk_workorder_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uk_workorders`
--

DROP TABLE IF EXISTS `uk_workorders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uk_workorders` (
  `ID` varchar(32) NOT NULL COMMENT 'ID',
  `NAME` varchar(50) DEFAULT NULL COMMENT '名称',
  `CODE` varchar(50) DEFAULT NULL COMMENT '代码',
  `CREATETIME` datetime DEFAULT NULL COMMENT '创建时间',
  `CREATER` varchar(32) DEFAULT NULL COMMENT '创建人',
  `UPDATETIME` datetime DEFAULT NULL COMMENT '更新时间',
  `ORGI` varchar(32) DEFAULT NULL COMMENT 'ORGI',
  `USERNAME` varchar(50) DEFAULT NULL COMMENT '创建人用户名',
  `PARENT` varchar(32) DEFAULT NULL COMMENT 'PARENT',
  `ORDERNO` int(11) DEFAULT NULL COMMENT '工单编号',
  `SESSIONID` varchar(32) DEFAULT NULL COMMENT '会话ID',
  `TITLE` varchar(255) DEFAULT NULL COMMENT '标题',
  `CONTENT` text COMMENT '内容',
  `PRICE` int(11) DEFAULT NULL COMMENT 'PRICE',
  `KEYWORD` varchar(255) DEFAULT NULL COMMENT '关键词',
  `SUMMARY` varchar(255) DEFAULT NULL COMMENT '摘要',
  `ANONYMOUS` tinyint(4) DEFAULT NULL COMMENT '允许匿名访问',
  `TOP` tinyint(4) DEFAULT NULL COMMENT '置顶',
  `ESSENCE` tinyint(4) DEFAULT NULL COMMENT '精华',
  `ACCEPT` tinyint(4) DEFAULT NULL COMMENT '已采纳答案',
  `FINISH` tinyint(4) DEFAULT NULL COMMENT '已结束',
  `ANSWERS` int(11) DEFAULT NULL COMMENT '回复数量',
  `sviews` int(11) DEFAULT NULL COMMENT '查看次数',
  `FOLLOWERS` int(11) DEFAULT NULL COMMENT '关注数',
  `COLLECTIONS` int(11) DEFAULT NULL COMMENT '收藏数',
  `COMMENTS` int(11) DEFAULT NULL COMMENT '评论数',
  `MOBILE` tinyint(4) DEFAULT NULL COMMENT '移动端',
  `STATUS` varchar(32) DEFAULT NULL COMMENT '状态',
  `WOTYPE` varchar(32) DEFAULT NULL COMMENT '工单类型',
  `DATASTATUS` tinyint(4) DEFAULT NULL COMMENT '数据状态',
  `CATE` varchar(32) DEFAULT NULL COMMENT '类型',
  `PRIORITY` varchar(32) DEFAULT NULL COMMENT '优先级',
  `CONTACTS` varchar(32) DEFAULT NULL COMMENT '联系人',
  `CUSID` varchar(32) DEFAULT NULL COMMENT '联系人ID',
  `INITIATOR` text COMMENT '发起人',
  `BPMID` varchar(32) DEFAULT NULL COMMENT '流程ID',
  `TAGS` varchar(255) DEFAULT NULL COMMENT '标签',
  `ACCDEPT` varchar(32) DEFAULT NULL COMMENT '受理部门',
  `ACCUSER` varchar(32) DEFAULT NULL COMMENT '受理人',
  `ASSIGNED` tinyint(4) DEFAULT NULL COMMENT '已受理',
  `ORGAN` varchar(32) DEFAULT NULL COMMENT '部门',
  `AGENT` varchar(32) DEFAULT NULL COMMENT '坐席',
  `SHARES` text COMMENT '共享',
  `SKILL` varchar(32) DEFAULT NULL COMMENT '技能组',
  `ROWCOUNT` int(11) DEFAULT NULL COMMENT '行数',
  `KEY` varchar(32) DEFAULT NULL COMMENT '关键词',
  `MEMO` varchar(100) DEFAULT NULL COMMENT '备注',
  `frommobile` tinyint(4) DEFAULT '0',
  `dataid` varchar(50) DEFAULT NULL COMMENT '业务数据ID',
  `eventid` varchar(50) DEFAULT NULL COMMENT '通话ID',
  `ani` varchar(50) DEFAULT NULL COMMENT '主叫号码',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='工单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uk_workorders`
--

LOCK TABLES `uk_workorders` WRITE;
/*!40000 ALTER TABLE `uk_workorders` DISABLE KEYS */;
/*!40000 ALTER TABLE `uk_workorders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uk_worktime`
--

DROP TABLE IF EXISTS `uk_worktime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uk_worktime` (
  `id` varchar(32) NOT NULL COMMENT '主键ID',
  `creater` varchar(32) DEFAULT NULL COMMENT '创建人',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `updatetime` datetime DEFAULT NULL COMMENT '更新时间',
  `name` varchar(100) DEFAULT NULL COMMENT '名称',
  `orgi` varchar(100) DEFAULT NULL COMMENT '租户ID',
  `hostid` varchar(32) DEFAULT NULL COMMENT 'PBX主机ID',
  `type` varchar(32) DEFAULT NULL COMMENT '类型',
  `day` varchar(0) DEFAULT NULL COMMENT '日期',
  `begintime` varchar(20) DEFAULT NULL COMMENT '开始时间',
  `endtime` varchar(20) DEFAULT NULL COMMENT '结束时间',
  `timetype` varchar(10) DEFAULT NULL COMMENT '时间类型',
  `wfrom` int(11) DEFAULT NULL COMMENT '周开始',
  `wto` int(11) DEFAULT NULL COMMENT '周结束',
  `dfrom` int(11) DEFAULT NULL COMMENT '日期开始',
  `dto` int(11) DEFAULT NULL COMMENT '日期结束',
  `wbegintime` varchar(20) DEFAULT NULL COMMENT '周开始时间',
  `wendtime` varchar(20) DEFAULT NULL COMMENT '周结束时间',
  `dbegintime` varchar(20) DEFAULT NULL COMMENT '日期开始时间',
  `dendtime` varchar(20) DEFAULT NULL COMMENT '日期结束时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='工作时间';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uk_worktime`
--

LOCK TABLES `uk_worktime` WRITE;
/*!40000 ALTER TABLE `uk_worktime` DISABLE KEYS */;
/*!40000 ALTER TABLE `uk_worktime` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uk_wxmpevent`
--

DROP TABLE IF EXISTS `uk_wxmpevent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uk_wxmpevent` (
  `id` varchar(32) NOT NULL DEFAULT '' COMMENT '主键ID',
  `fromuser` varchar(32) DEFAULT NULL COMMENT '来源用户',
  `username` varchar(32) DEFAULT NULL COMMENT '用户名',
  `creater` varchar(32) DEFAULT NULL COMMENT '创建人',
  `orgi` varchar(50) DEFAULT NULL COMMENT '租户ID',
  `country` varchar(50) DEFAULT NULL COMMENT '国家',
  `city` varchar(32) DEFAULT NULL COMMENT '城市',
  `province` varchar(32) DEFAULT NULL COMMENT '省份',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `updatetime` datetime DEFAULT NULL COMMENT '更新时间',
  `event` varchar(255) DEFAULT NULL COMMENT '事件',
  `channel` varchar(255) DEFAULT NULL COMMENT '渠道',
  `model` varchar(10) DEFAULT NULL COMMENT '组件',
  `appid` varchar(32) DEFAULT NULL COMMENT 'SNSID',
  `snsid` varchar(32) DEFAULT NULL COMMENT 'SNSID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='微信事件记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uk_wxmpevent`
--

LOCK TABLES `uk_wxmpevent` WRITE;
/*!40000 ALTER TABLE `uk_wxmpevent` DISABLE KEYS */;
/*!40000 ALTER TABLE `uk_wxmpevent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uk_xiaoe_config`
--

DROP TABLE IF EXISTS `uk_xiaoe_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uk_xiaoe_config` (
  `id` varchar(32) NOT NULL COMMENT '主键ID',
  `orgi` varchar(32) DEFAULT NULL COMMENT '租户ID',
  `creater` varchar(32) DEFAULT NULL COMMENT '创建人',
  `username` varchar(32) DEFAULT NULL COMMENT '创建人用户名',
  `name` varchar(32) DEFAULT NULL COMMENT '名称',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `enableask` tinyint(4) DEFAULT NULL COMMENT '允许AI主动发起问答',
  `askfirst` tinyint(4) DEFAULT NULL COMMENT 'AI优先',
  `enablescene` tinyint(4) DEFAULT NULL COMMENT '启用场景识别',
  `scenefirst` tinyint(4) DEFAULT NULL COMMENT '优先命中场景',
  `enablekeyword` tinyint(4) DEFAULT NULL COMMENT '启用关键词命中',
  `keywordnum` int(11) DEFAULT NULL COMMENT '关键词数量',
  `noresultmsg` text COMMENT '未命中回复消息',
  `askqs` tinyint(4) DEFAULT NULL COMMENT '询问访客是否解决问题',
  `asktipmsg` varchar(255) DEFAULT NULL COMMENT '询问访客的文本',
  `resolved` varchar(100) DEFAULT NULL COMMENT '已解决的提示文本',
  `unresolved` varchar(100) DEFAULT NULL COMMENT '未解决的提示文本',
  `redirectagent` tinyint(4) DEFAULT NULL COMMENT '跳转到人工坐席',
  `redirecturl` varchar(255) DEFAULT NULL COMMENT '跳转到其他URL',
  `asktimes` int(11) DEFAULT NULL COMMENT '最长多久开始询问',
  `selectskill` int(11) DEFAULT NULL COMMENT '技能组',
  `selectskillmsg` varchar(255) DEFAULT NULL COMMENT '技能组消息',
  `aiid` varchar(32) DEFAULT NULL COMMENT '机器人ID',
  `welcomemsg` text COMMENT '机器人欢迎语',
  `waitmsg` text COMMENT '机器人等待提示语',
  `enableother` tinyint(4) DEFAULT '0' COMMENT '启用外部机器人',
  `otherfirst` tinyint(4) DEFAULT '0' COMMENT '外部机器人优先',
  `otherurl` varchar(255) DEFAULT NULL COMMENT '外部机器人URL',
  `otherlogin` tinyint(4) DEFAULT '0' COMMENT '外部机器人是否需要登录',
  `otherappkey` varchar(255) DEFAULT NULL COMMENT '外部机器人APPKey',
  `otherappsec` varchar(255) DEFAULT NULL COMMENT '外部机器人APPSec',
  `otherparam` text COMMENT '外部机器人参数',
  `othertempletinput` varchar(32) DEFAULT NULL COMMENT '外部机器人提交参数模板',
  `othertempletoutput` varchar(32) DEFAULT NULL COMMENT '外部机器人回复参数解析模板',
  `othermethod` varchar(20) DEFAULT NULL COMMENT '外部机器人提交方式',
  `otherssl` tinyint(4) DEFAULT '0' COMMENT '外部机器人启用SSL',
  `enablesuggest` tinyint(4) DEFAULT '0' COMMENT '启用推荐功能',
  `suggestmsg` text COMMENT '推荐的提示信息',
  `oqrdetailurl` varchar(255) DEFAULT NULL COMMENT '外部机器人内容URL',
  `oqrdetailinput` varchar(32) DEFAULT NULL COMMENT '外部机器人详情输入参数',
  `oqrdetailoutput` varchar(32) DEFAULT NULL COMMENT '外部机器人详情输出参数',
  `othersuggestmsg` text COMMENT '命中结果的推荐的提示信息',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='机器人配置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uk_xiaoe_config`
--

LOCK TABLES `uk_xiaoe_config` WRITE;
/*!40000 ALTER TABLE `uk_xiaoe_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `uk_xiaoe_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uk_xiaoe_kbs_type`
--

DROP TABLE IF EXISTS `uk_xiaoe_kbs_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uk_xiaoe_kbs_type` (
  `ID` varchar(32) NOT NULL COMMENT '主键ID',
  `NAME` varchar(50) DEFAULT NULL COMMENT '名称',
  `CODE` varchar(50) DEFAULT NULL COMMENT '代码',
  `CREATETIME` datetime DEFAULT NULL COMMENT '创建时间',
  `CREATER` varchar(32) DEFAULT NULL COMMENT '创建人',
  `UPDATETIME` datetime DEFAULT NULL COMMENT '更新时间',
  `ORGI` varchar(32) DEFAULT NULL COMMENT '租户ID',
  `USERNAME` varchar(50) DEFAULT NULL COMMENT '用户名',
  `area` text COMMENT '区域',
  `parentid` varchar(32) DEFAULT '0' COMMENT '上级ID',
  `typeid` varchar(32) DEFAULT NULL COMMENT '类型ID',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='知识库分类';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uk_xiaoe_kbs_type`
--

LOCK TABLES `uk_xiaoe_kbs_type` WRITE;
/*!40000 ALTER TABLE `uk_xiaoe_kbs_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `uk_xiaoe_kbs_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uk_xiaoe_scene`
--

DROP TABLE IF EXISTS `uk_xiaoe_scene`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uk_xiaoe_scene` (
  `id` varchar(32) NOT NULL COMMENT '主键ID',
  `sessionid` varchar(32) DEFAULT NULL COMMENT '会话ID',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `content` text COMMENT '内容',
  `keyword` varchar(100) DEFAULT NULL COMMENT '关键词',
  `summary` varchar(255) DEFAULT NULL COMMENT '摘要',
  `anonymous` tinyint(4) DEFAULT NULL COMMENT '匿名访问',
  `begintime` datetime DEFAULT NULL COMMENT '有效期开始时间',
  `endtime` datetime DEFAULT NULL COMMENT '有效期结束时间',
  `top` tinyint(4) DEFAULT NULL COMMENT '置顶',
  `essence` tinyint(4) DEFAULT NULL COMMENT '启用场景',
  `accept` tinyint(4) DEFAULT NULL COMMENT '启用',
  `finish` tinyint(4) DEFAULT NULL COMMENT '是否结束',
  `answers` int(11) DEFAULT NULL COMMENT '回答数量',
  `sviews` int(11) DEFAULT NULL,
  `followers` int(11) DEFAULT NULL COMMENT '关注数量',
  `collections` int(11) DEFAULT NULL COMMENT '回复数量',
  `comments` int(11) DEFAULT NULL COMMENT '评论数量',
  `mobile` tinyint(4) DEFAULT NULL COMMENT '移动端',
  `status` varchar(32) DEFAULT NULL COMMENT '状态',
  `tptype` varchar(32) DEFAULT NULL COMMENT '类型',
  `cate` varchar(32) DEFAULT NULL COMMENT '分类',
  `username` varchar(32) DEFAULT NULL COMMENT '用户名',
  `orgi` varchar(32) DEFAULT NULL COMMENT '租户ID',
  `creater` varchar(32) DEFAULT NULL COMMENT '创建人',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `updatetime` datetime DEFAULT NULL COMMENT '修改时间',
  `memo` varchar(32) DEFAULT NULL COMMENT '备注',
  `price` int(11) DEFAULT NULL COMMENT '价格',
  `organ` varchar(32) DEFAULT NULL COMMENT '部门',
  `replaytype` varchar(32) DEFAULT NULL COMMENT '回复类型',
  `allowask` tinyint(4) DEFAULT NULL COMMENT '允许提问',
  `inputcon` varchar(255) DEFAULT NULL COMMENT '输入条件',
  `outputcon` varchar(255) DEFAULT NULL COMMENT '输出条件',
  `userinput` text COMMENT '用户输入',
  `aireply` text COMMENT 'AI回复内容（首条）',
  `frommobile` tinyint(4) DEFAULT '0' COMMENT '移动端接入',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='机器人场景';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uk_xiaoe_scene`
--

LOCK TABLES `uk_xiaoe_scene` WRITE;
/*!40000 ALTER TABLE `uk_xiaoe_scene` DISABLE KEYS */;
/*!40000 ALTER TABLE `uk_xiaoe_scene` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uk_xiaoe_scene_type`
--

DROP TABLE IF EXISTS `uk_xiaoe_scene_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uk_xiaoe_scene_type` (
  `ID` varchar(32) NOT NULL COMMENT '主键ID',
  `NAME` varchar(50) DEFAULT NULL COMMENT '名称',
  `CODE` varchar(50) DEFAULT NULL COMMENT '代码',
  `CREATETIME` datetime DEFAULT NULL COMMENT '创建时间',
  `CREATER` varchar(32) DEFAULT NULL COMMENT '创建人',
  `UPDATETIME` datetime DEFAULT NULL COMMENT '更新时间',
  `ORGI` varchar(32) DEFAULT NULL COMMENT '租户ID',
  `USERNAME` varchar(50) DEFAULT NULL COMMENT '用户名',
  `area` text COMMENT '区域',
  `parentid` varchar(32) DEFAULT '0' COMMENT '父级ID',
  `typeid` varchar(32) DEFAULT NULL COMMENT '类型ID',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='机器人场景类型';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uk_xiaoe_scene_type`
--

LOCK TABLES `uk_xiaoe_scene_type` WRITE;
/*!40000 ALTER TABLE `uk_xiaoe_scene_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `uk_xiaoe_scene_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uk_xiaoe_sceneitem`
--

DROP TABLE IF EXISTS `uk_xiaoe_sceneitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uk_xiaoe_sceneitem` (
  `id` varchar(32) NOT NULL COMMENT '主键ID',
  `content` varchar(255) DEFAULT NULL COMMENT '回复内容',
  `orgi` varchar(32) DEFAULT NULL COMMENT '租户ID',
  `creater` varchar(32) DEFAULT NULL COMMENT '创建人',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `updatetime` datetime DEFAULT NULL COMMENT '更新时间',
  `sceneid` varchar(32) DEFAULT NULL COMMENT '场景ID',
  `inx` int(11) DEFAULT NULL COMMENT '序号',
  `itemtype` varchar(32) DEFAULT NULL COMMENT '类型',
  `replaytype` varchar(32) DEFAULT NULL COMMENT '回复类型',
  `allowask` tinyint(4) DEFAULT NULL COMMENT '允许主动提问',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='机器人场景子项';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uk_xiaoe_sceneitem`
--

LOCK TABLES `uk_xiaoe_sceneitem` WRITE;
/*!40000 ALTER TABLE `uk_xiaoe_sceneitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `uk_xiaoe_sceneitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uk_xiaoe_topic`
--

DROP TABLE IF EXISTS `uk_xiaoe_topic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uk_xiaoe_topic` (
  `id` varchar(32) NOT NULL COMMENT '主键ID',
  `sessionid` varchar(32) DEFAULT NULL COMMENT '会话ID',
  `title` varchar(255) DEFAULT NULL COMMENT '主题',
  `content` text COMMENT '知识库内容',
  `keyword` varchar(100) DEFAULT NULL COMMENT '关键词',
  `summary` varchar(255) DEFAULT NULL COMMENT '摘要',
  `anonymous` tinyint(4) DEFAULT NULL COMMENT '允许匿名访问',
  `begintime` datetime DEFAULT NULL COMMENT '有效期开始时间',
  `endtime` datetime DEFAULT NULL COMMENT '有效期结束时间',
  `top` tinyint(4) DEFAULT NULL COMMENT '是否置顶',
  `essence` tinyint(4) DEFAULT NULL COMMENT '精华',
  `accept` tinyint(4) DEFAULT NULL COMMENT '允许评论',
  `finish` tinyint(4) DEFAULT NULL COMMENT '已结束',
  `answers` int(11) DEFAULT NULL COMMENT '回答数量',
  `sviews` varchar(32) DEFAULT NULL,
  `followers` int(11) DEFAULT NULL COMMENT '关注人数',
  `collections` int(11) DEFAULT NULL COMMENT '引用次数',
  `comments` int(11) DEFAULT NULL COMMENT '回复数',
  `mobile` tinyint(4) DEFAULT NULL COMMENT '移动端支持',
  `status` varchar(32) DEFAULT NULL COMMENT '状态',
  `tptype` varchar(32) DEFAULT NULL COMMENT '分类',
  `cate` varchar(32) DEFAULT NULL COMMENT '分类ID',
  `username` varchar(32) DEFAULT NULL COMMENT '用户名',
  `orgi` varchar(32) DEFAULT NULL COMMENT '租户ID',
  `creater` varchar(32) DEFAULT NULL COMMENT '创建人',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `updatetime` datetime DEFAULT NULL COMMENT '修改时间',
  `memo` varchar(32) DEFAULT NULL COMMENT '备注',
  `price` int(11) DEFAULT NULL COMMENT '权重',
  `organ` varchar(32) DEFAULT NULL COMMENT '组织机构',
  `sms` varchar(255) DEFAULT NULL COMMENT '短信模板',
  `tts` varchar(255) DEFAULT NULL COMMENT 'TTS模板',
  `email` text COMMENT '邮件模板',
  `weixin` text COMMENT '微信回复模板',
  `silimar` text COMMENT '类似问题',
  `aiid` varchar(32) DEFAULT NULL COMMENT '机器人ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='知识库';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uk_xiaoe_topic`
--

LOCK TABLES `uk_xiaoe_topic` WRITE;
/*!40000 ALTER TABLE `uk_xiaoe_topic` DISABLE KEYS */;
/*!40000 ALTER TABLE `uk_xiaoe_topic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uk_xiaoe_topic_item`
--

DROP TABLE IF EXISTS `uk_xiaoe_topic_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uk_xiaoe_topic_item` (
  `id` varchar(32) NOT NULL DEFAULT '' COMMENT 'ID',
  `topicid` varchar(255) DEFAULT NULL COMMENT '知识id',
  `title` varchar(255) DEFAULT NULL COMMENT '问题',
  `orgi` varchar(255) DEFAULT NULL COMMENT '产品id',
  `creater` varchar(255) DEFAULT NULL COMMENT '创建人',
  `createtime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='知识库类似问题';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uk_xiaoe_topic_item`
--

LOCK TABLES `uk_xiaoe_topic_item` WRITE;
/*!40000 ALTER TABLE `uk_xiaoe_topic_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `uk_xiaoe_topic_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uk_xiaoe_words`
--

DROP TABLE IF EXISTS `uk_xiaoe_words`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uk_xiaoe_words` (
  `ID` varchar(32) NOT NULL COMMENT '主键ID',
  `KEYWORD` varchar(50) DEFAULT NULL COMMENT '关键词',
  `CONTENT` text COMMENT '内容',
  `CREATETIME` datetime DEFAULT NULL COMMENT '创建时间',
  `CREATER` varchar(32) DEFAULT NULL COMMENT '创建人',
  `UPDATETIME` datetime DEFAULT NULL COMMENT '更新时间',
  `ORGI` varchar(32) DEFAULT NULL COMMENT '租户ID',
  `USERNAME` varchar(50) DEFAULT NULL COMMENT '用户名',
  `SUPERORDINATE` varchar(50) DEFAULT NULL COMMENT '上位词',
  `PARTOFSPEECH` varchar(50) DEFAULT NULL COMMENT '词性',
  `CATE` varchar(32) DEFAULT NULL COMMENT '分类',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='关键词';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uk_xiaoe_words`
--

LOCK TABLES `uk_xiaoe_words` WRITE;
/*!40000 ALTER TABLE `uk_xiaoe_words` DISABLE KEYS */;
/*!40000 ALTER TABLE `uk_xiaoe_words` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uk_xiaoe_words_type`
--

DROP TABLE IF EXISTS `uk_xiaoe_words_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uk_xiaoe_words_type` (
  `ID` varchar(32) NOT NULL COMMENT '主键ID',
  `NAME` varchar(50) DEFAULT NULL COMMENT '分类名称',
  `CODE` varchar(50) DEFAULT NULL COMMENT '分类代码',
  `CREATETIME` datetime DEFAULT NULL COMMENT '创建时间',
  `CREATER` varchar(32) DEFAULT NULL COMMENT '创建人ID',
  `UPDATETIME` datetime DEFAULT NULL COMMENT '更新时间',
  `ORGI` varchar(32) DEFAULT NULL COMMENT '租户ID',
  `USERNAME` varchar(50) DEFAULT NULL COMMENT '用户名',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='词库类型';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uk_xiaoe_words_type`
--

LOCK TABLES `uk_xiaoe_words_type` WRITE;
/*!40000 ALTER TABLE `uk_xiaoe_words_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `uk_xiaoe_words_type` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-26  0:21:06