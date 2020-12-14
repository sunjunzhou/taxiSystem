/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 5.7.14-log : Database - taxi
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`taxi` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `taxi`;

/*Table structure for table `t_car` */

DROP TABLE IF EXISTS `t_car`;

CREATE TABLE `t_car` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `carId` varchar(20) DEFAULT NULL COMMENT '车牌号',
  `name` varchar(20) DEFAULT NULL COMMENT '车辆名称',
  `color` varchar(20) DEFAULT NULL COMMENT '车身颜色',
  `count_passenger` int(20) DEFAULT NULL COMMENT '载客人数',
  `oilType` varchar(20) DEFAULT NULL COMMENT '燃油类型',
  `ownerId` int(18) DEFAULT NULL COMMENT '所属车主',
  `car_type` varchar(20) DEFAULT NULL COMMENT '车辆型号',
  `isType` int(18) DEFAULT NULL COMMENT '审核类型',
  `Engine_num` varchar(20) DEFAULT NULL COMMENT '发动机号',
  `date_production` date DEFAULT NULL COMMENT '出厂日期',
  `vender` varchar(20) DEFAULT NULL COMMENT '生产厂商',
  `operator` varchar(20) DEFAULT NULL COMMENT '操作人',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  `isSend` int(11) DEFAULT NULL,
  `driverId` int(11) DEFAULT NULL,
  `check_suggestion` varchar(20) DEFAULT NULL,
  `check_People` int(11) DEFAULT NULL,
  `check_People_name` varchar(20) DEFAULT NULL,
  `sendTime` datetime DEFAULT NULL,
  `sendSuccessTime` datetime DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `t_car` */

insert  into `t_car`(`id`,`carId`,`name`,`color`,`count_passenger`,`oilType`,`ownerId`,`car_type`,`isType`,`Engine_num`,`date_production`,`vender`,`operator`,`oper_time`,`isSend`,`driverId`,`check_suggestion`,`check_People`,`check_People_name`,`sendTime`,`sendSuccessTime`,`company_id`) values (1,'京A88888','宝马','白色',5,'汽油',1,'小轿车',1,'EN10086','2020-10-17','北汽','4','2020-10-17 01:33:13',1,1,'审核已通过',4,'shenhe','2020-10-17 16:18:54','2020-10-17 23:47:46',3),(2,'粤A66666','奔驰','红色',2,'汽油',2,'超级跑车',1,'EN10010','2020-10-17','广州汽车生产公司','4','2020-10-17 10:14:29',1,2,'审核已通过',4,'shenhe','2020-10-17 23:47:24','2020-10-17 23:47:46',3),(3,'陕B89565','大众','蓝色',8,'柴油',5,'房车',1,'EN88889','2020-10-03','北京汽车生产公司','3','2020-10-17 22:55:18',1,4,'审核已通过',4,'shenhe','2020-10-17 23:19:17','2020-10-18 14:30:03',2),(5,'桂A59966','东风日产','白色',4,'汽油',4,'小轿车',1,'EN85964','2014-10-16','日本东风汽车公司','3','2020-10-18 10:53:04',1,3,'审核已通过',4,'shenhe','2020-10-25 08:40:45','2020-10-25 08:41:01',2),(6,'粤D56684','大众','红色',5,'汽油',6,'小轿车',0,'EN10088','2020-10-27','广东汽车生产','4','2020-10-20 17:58:07',0,1,'审核未通过',NULL,NULL,NULL,NULL,3),(7,'川D87659','五菱宏光','白色',26,'汽油',3,'面包车',0,'EN96374','2020-10-13','中国五菱汽车生产公司','3','2020-10-30 23:31:38',0,1,'审核未通过',NULL,NULL,NULL,NULL,2);

/*Table structure for table `t_car_user` */

DROP TABLE IF EXISTS `t_car_user`;

CREATE TABLE `t_car_user` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `car_id` int(5) DEFAULT NULL,
  `user_id` int(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `t_car_user` */

insert  into `t_car_user`(`id`,`car_id`,`user_id`) values (1,5,4);

/*Table structure for table `t_carowner` */

DROP TABLE IF EXISTS `t_carowner`;

CREATE TABLE `t_carowner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL COMMENT '姓名',
  `sex` varchar(20) DEFAULT NULL COMMENT '性别',
  `cardId` varchar(18) DEFAULT NULL COMMENT '身份证号',
  `tel` varchar(20) DEFAULT NULL COMMENT '联系电话',
  `isType` int(5) DEFAULT NULL COMMENT '审核类型',
  `address` varchar(20) DEFAULT NULL COMMENT '地址',
  `operator` varchar(20) DEFAULT NULL COMMENT '操作人',
  `operator_time` datetime DEFAULT NULL COMMENT '操作时间',
  `company_id` int(11) DEFAULT NULL,
  `checkPeople` int(11) DEFAULT NULL,
  `checkPeople_name` varchar(20) DEFAULT NULL,
  `check_time` datetime DEFAULT NULL,
  `check_suggestion` varchar(20) DEFAULT NULL,
  `isSend` int(11) DEFAULT NULL COMMENT '是否送审',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `t_carowner` */

insert  into `t_carowner`(`id`,`name`,`sex`,`cardId`,`tel`,`isType`,`address`,`operator`,`operator_time`,`company_id`,`checkPeople`,`checkPeople_name`,`check_time`,`check_suggestion`,`isSend`) values (1,'王五','男','610343254645645432','13422222222',1,'咸阳师范','4','2020-10-17 00:56:57',3,4,'shenhe','2020-10-25 08:48:56','审核已通过',1),(2,'李四','女','610524461616157122','18222266677',1,'咸阳师范','4','2020-10-16 21:53:21',3,4,'shenhe','2020-10-25 08:48:56','审核已通过',1),(3,'王某','女','747888888885444244','16598745213',1,'陕西西安','3','2020-10-17 16:49:17',2,4,'shenhe','2020-10-25 08:48:56','审核已通过',1),(4,'霍某','男','876256147931562138','19865475521',1,'四川成都','3','2020-10-17 16:47:49',2,4,'shenhe','2020-10-25 08:48:56','审核已通过',1),(5,'何某','男','876256147925478138','15226667425',1,'河北石家庄','3','2020-10-17 16:49:50',2,4,'shenhe','2020-10-25 08:48:56','审核已通过',1),(6,'李师傅','男','46464184561145412','14589659874',1,'广东深圳','4','2020-10-20 17:55:49',3,4,'shenhe','2020-10-25 08:48:56','审核已通过',1);

/*Table structure for table `t_company` */

DROP TABLE IF EXISTS `t_company`;

CREATE TABLE `t_company` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shortName` varchar(20) DEFAULT NULL COMMENT '公司简称',
  `fullName` varchar(20) DEFAULT NULL COMMENT '公司全称',
  `businessNum` varchar(20) DEFAULT NULL COMMENT '营业证号',
  `leaderName` varchar(20) DEFAULT NULL COMMENT '法人名称',
  `tel` varchar(20) DEFAULT NULL COMMENT '联系电话',
  `address` varchar(20) DEFAULT NULL COMMENT '公司地址',
  `user_id` int(20) DEFAULT NULL,
  `user_name` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `t_company` */

insert  into `t_company`(`id`,`shortName`,`fullName`,`businessNum`,`leaderName`,`tel`,`address`,`user_id`,`user_name`) values (1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,'顺达','顺达汽车出租公司','1111111','张三','1234000','陕西咸阳',2,'admin'),(3,'通达','通达汽车出租公司','222222','李四','5678000','陕西西安',2,'admin');

/*Table structure for table `t_dept` */

DROP TABLE IF EXISTS `t_dept`;

CREATE TABLE `t_dept` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL COMMENT '姓名',
  `describe` varchar(20) DEFAULT NULL COMMENT '描述',
  `leader` varchar(20) DEFAULT NULL COMMENT '部门领导',
  `createtime` date DEFAULT NULL COMMENT '成立日期',
  `operator` int(11) DEFAULT NULL COMMENT '操作人',
  `operator_name` varchar(20) DEFAULT NULL COMMENT '操作人姓名',
  `operator_time` datetime DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `t_dept` */

insert  into `t_dept`(`id`,`name`,`describe`,`leader`,`createtime`,`operator`,`operator_name`,`operator_time`) values (1,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,'审核部','审核车主，审核车辆','','2000-01-01',2,'admin','2020-10-14 14:51:02'),(3,'稽查部','监察各个部门',NULL,'2020-09-23',2,'admin','2020-10-14 14:51:22');

/*Table structure for table `t_driver` */

DROP TABLE IF EXISTS `t_driver`;

CREATE TABLE `t_driver` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL COMMENT '姓名',
  `sex` varchar(20) DEFAULT NULL COMMENT '性别',
  `tel` varchar(20) DEFAULT NULL COMMENT '联系电话',
  `card_Id` varchar(18) DEFAULT NULL COMMENT '身份证号',
  `address` varchar(20) DEFAULT NULL COMMENT '地址',
  `Native` varchar(20) DEFAULT NULL COMMENT '籍贯',
  `carId` varchar(20) DEFAULT NULL COMMENT '所开车辆',
  `score` int(11) DEFAULT NULL COMMENT '分数',
  `isType` int(11) DEFAULT NULL,
  `isSend` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `t_driver` */

insert  into `t_driver`(`id`,`name`,`sex`,`tel`,`card_Id`,`address`,`Native`,`carId`,`score`,`isType`,`isSend`,`company_id`) values (1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,'李某','女','13465989898','641055599221657','广东省广州市珠江新城','广东湛江','粤A66666',15,1,1,3),(3,'王某','男','19855775556','641055566288566','陕西省西安市未央区','中国香港','桂A59966',0,1,1,2),(4,'刘某','男','16988742014','67485321478968888','海南省三亚市','北京','陕B89565',0,1,0,2);

/*Table structure for table `t_encourage` */

DROP TABLE IF EXISTS `t_encourage`;

CREATE TABLE `t_encourage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `carId` int(20) DEFAULT NULL,
  `why` int(11) DEFAULT NULL,
  `who_send` int(11) DEFAULT NULL,
  `sendTime` datetime DEFAULT NULL,
  `isType` int(11) DEFAULT NULL,
  `who_check` int(11) DEFAULT NULL,
  `successTime` datetime DEFAULT NULL,
  `isSend` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `t_encourage` */

insert  into `t_encourage`(`id`,`carId`,`why`,`who_send`,`sendTime`,`isType`,`who_check`,`successTime`,`isSend`) values (1,2,4,6,'2020-10-31 06:07:55',1,5,'2020-11-01 15:44:17',1),(4,3,1,6,'2020-10-31 01:12:06',0,1,NULL,1),(5,2,1,6,'2020-11-01 15:44:57',1,5,'2020-11-01 15:46:01',1);

/*Table structure for table `t_menu` */

DROP TABLE IF EXISTS `t_menu`;

CREATE TABLE `t_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `m_name` varchar(20) DEFAULT NULL COMMENT '菜单名',
  `url` varchar(50) DEFAULT NULL COMMENT 'url',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `t_menu` */

insert  into `t_menu`(`id`,`m_name`,`url`) values (1,'用户管理','user/touserlist'),(2,'部门管理','dept/todeptlist'),(3,'公司管理','company/tocompanylist'),(4,'车主管理','carowner/tocarownerlist'),(5,'车辆管理','car/tocarlist'),(6,'司机管理','driver/todriverlist'),(7,'司机投诉',NULL),(8,'司机奖励',NULL),(9,'车主审核','carownerCheck/tocarownerChecklist'),(10,'司机审核','driverCheck/todriverChecklist'),(11,'车辆审核','carCheck/tocarChecklist'),(12,'奖励登记','encourage/toencouragelist'),(13,'违章登记','punish/topunishlist'),(14,'奖励审核','encourageCheck/toencourageChecklist'),(15,'违章审核','punishCheck/topunishChecklist'),(16,'考核标准','rule/torulelist');

/*Table structure for table `t_punish` */

DROP TABLE IF EXISTS `t_punish`;

CREATE TABLE `t_punish` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `carId` int(20) DEFAULT NULL,
  `why` int(11) DEFAULT NULL,
  `who_send` int(11) DEFAULT NULL,
  `sendTime` datetime DEFAULT NULL,
  `isType` int(11) DEFAULT NULL,
  `who_check` int(11) DEFAULT NULL,
  `successTime` datetime DEFAULT NULL,
  `isSend` int(11) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `address` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `t_punish` */

insert  into `t_punish`(`id`,`carId`,`why`,`who_send`,`sendTime`,`isType`,`who_check`,`successTime`,`isSend`,`createTime`,`address`) values (8,3,3,6,'2020-10-31 11:33:33',1,5,'2020-11-01 16:45:46',1,'2020-10-31 11:33:33','渭城区文林路东段');

/*Table structure for table `t_rule` */

DROP TABLE IF EXISTS `t_rule`;

CREATE TABLE `t_rule` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `scription` varchar(50) DEFAULT NULL,
  `score` int(4) DEFAULT NULL COMMENT '分数',
  `type` int(2) DEFAULT NULL COMMENT '类型',
  `createTime` datetime DEFAULT NULL,
  `operator` int(4) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `t_rule` */

insert  into `t_rule`(`id`,`name`,`scription`,`score`,`type`,`createTime`,`operator`) values (1,'拾金不昧','拾金不昧',5,1,'2020-11-17 20:55:38',6),(2,'乱收费','乱收费',5,0,'2020-11-17 12:55:55',6),(3,'闯红灯','闯红灯',20,0,'2020-11-03 20:46:56',6),(4,'避免车辆','避免特殊车辆',10,1,'2020-11-22 20:56:03',6),(5,'酒驾','醉酒驾驶',100,0,'2020-11-06 23:04:35',6);

/*Table structure for table `t_user` */

DROP TABLE IF EXISTS `t_user`;

CREATE TABLE `t_user` (
  `u_id` int(11) NOT NULL AUTO_INCREMENT,
  `u_name` varchar(20) DEFAULT NULL COMMENT '姓名',
  `u_password` varchar(20) DEFAULT NULL COMMENT '密码',
  `u_sex` varchar(20) DEFAULT NULL COMMENT '性别',
  `u_birth` date DEFAULT NULL COMMENT '生日',
  `u_tel` varchar(20) DEFAULT NULL COMMENT '联系电话',
  `u_address` varchar(20) DEFAULT NULL COMMENT '地址',
  `u_deptId` int(20) DEFAULT NULL COMMENT '部门',
  `u_companyId` int(11) DEFAULT NULL COMMENT '公司',
  `u_type` int(20) DEFAULT NULL COMMENT '类型',
  `u_operate` int(20) DEFAULT NULL COMMENT '操作人',
  `u_operate_name` varchar(20) DEFAULT NULL COMMENT '操作人名字',
  `u_operate_time` datetime DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`u_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `t_user` */

insert  into `t_user`(`u_id`,`u_name`,`u_password`,`u_sex`,`u_birth`,`u_tel`,`u_address`,`u_deptId`,`u_companyId`,`u_type`,`u_operate`,`u_operate_name`,`u_operate_time`) values (1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,'admin','admin',NULL,NULL,NULL,NULL,1,1,0,NULL,NULL,'2000-01-03 05:00:00'),(3,'shunda','111111','男','2020-10-15','13429508893','陕西科技大学',1,2,2,2,'admin','2020-11-07 14:22:26'),(4,'tongda','111111','女','2020-10-22','13599998888','华南理工大学',1,3,2,2,'admin','2020-11-07 14:22:56'),(5,'shenhe','111111','男','2020-10-02','13466998574','咸阳师范学院',2,1,1,2,'admin','2020-11-07 14:22:44'),(6,'jicha','111111','女','2020-10-03','13755989400','陕西师范大学',3,1,1,2,'admin','2020-11-07 14:22:36');

/*Table structure for table `t_user_menu` */

DROP TABLE IF EXISTS `t_user_menu`;

CREATE TABLE `t_user_menu` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(18) DEFAULT NULL,
  `menu_id` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `t_user_menu` */

insert  into `t_user_menu`(`id`,`user_id`,`menu_id`) values (1,2,'1'),(2,2,'2'),(3,2,'3'),(65,3,'4'),(66,3,'5'),(67,3,'6'),(68,6,'12'),(69,6,'13'),(70,6,'16'),(71,5,'9'),(72,5,'10'),(73,5,'11'),(74,5,'14'),(75,5,'15'),(76,4,'4'),(77,4,'5'),(78,4,'6');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
