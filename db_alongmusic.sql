/*
SQLyog v10.2 
MySQL - 5.5.50 : Database - db_alongmusic
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`db_alongmusic` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `db_alongmusic`;

/*Table structure for table `collect_music` */

DROP TABLE IF EXISTS `collect_music`;

CREATE TABLE `collect_music` (
  `collect_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '收藏编号',
  `user_id` bigint(20) NOT NULL COMMENT '用户编号(外键)',
  `music_id` bigint(20) NOT NULL COMMENT '音乐编号(外键)',
  `collect_type` int(11) NOT NULL COMMENT '1:普通收藏  2:喜欢',
  `music_type` int(11) NOT NULL COMMENT '音乐类型(1:歌曲   2:MV)',
  PRIMARY KEY (`collect_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `collect_music_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `collect_music` */

insert  into `collect_music`(`collect_id`,`user_id`,`music_id`,`collect_type`,`music_type`) values (1,2,1,2,1),(2,3,1,1,1),(3,2,2,1,1),(4,2,1,2,2),(5,3,2,1,2);

/*Table structure for table `collect_singer` */

DROP TABLE IF EXISTS `collect_singer`;

CREATE TABLE `collect_singer` (
  `collect_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '收藏编号',
  `user_id` bigint(20) NOT NULL COMMENT '用户编号(外键)',
  `singer_id` bigint(20) NOT NULL COMMENT '歌手编号(外键)',
  PRIMARY KEY (`collect_id`),
  KEY `user_id` (`user_id`),
  KEY `singer_id` (`singer_id`),
  CONSTRAINT `collect_singer_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`),
  CONSTRAINT `collect_singer_ibfk_2` FOREIGN KEY (`singer_id`) REFERENCES `singer_info` (`singer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=cp1250;

/*Data for the table `collect_singer` */

insert  into `collect_singer`(`collect_id`,`user_id`,`singer_id`) values (1,2,1),(2,3,1),(3,3,2);

/*Table structure for table `friend_info` */

DROP TABLE IF EXISTS `friend_info`;

CREATE TABLE `friend_info` (
  `user_id` bigint(20) NOT NULL COMMENT '用户编号',
  `friend_id` bigint(20) NOT NULL COMMENT '好友编号',
  PRIMARY KEY (`user_id`),
  KEY `friend_id` (`friend_id`),
  CONSTRAINT `friend_info_ibfk_1` FOREIGN KEY (`friend_id`) REFERENCES `user_info` (`user_id`),
  CONSTRAINT `friend_info_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `friend_info` */

insert  into `friend_info`(`user_id`,`friend_id`) values (3,2),(2,3);

/*Table structure for table `mv_info` */

DROP TABLE IF EXISTS `mv_info`;

CREATE TABLE `mv_info` (
  `mv_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'mv编号',
  `mv_name` varchar(50) NOT NULL COMMENT 'mv名称',
  `type_id` int(11) NOT NULL COMMENT '歌曲类型编号(外键)',
  `down_count` bigint(20) NOT NULL DEFAULT '0' COMMENT '下载次数',
  `collect_count` bigint(20) NOT NULL DEFAULT '0' COMMENT '收藏次数',
  `upload_role` int(11) NOT NULL COMMENT '上传角色(1:管理员  2:用户)',
  PRIMARY KEY (`mv_id`),
  KEY `type_id` (`type_id`),
  CONSTRAINT `mv_info_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `song_type` (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `mv_info` */

insert  into `mv_info`(`mv_id`,`mv_name`,`type_id`,`down_count`,`collect_count`,`upload_role`) values (1,'日不落',2,30,1,1),(2,'天后',1,12,1,1),(3,'认真的雪',1,24,0,2);

/*Table structure for table `path_info` */

DROP TABLE IF EXISTS `path_info`;

CREATE TABLE `path_info` (
  `path_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '路径编号',
  `path_name` varchar(200) NOT NULL COMMENT '资源路径',
  PRIMARY KEY (`path_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `path_info` */

insert  into `path_info`(`path_id`,`path_name`) values (1,'http://192.168.189.129/musicsource/mv/'),(2,'http://192.168.189.129/musicsource/singerphoto/'),(3,'http://192.168.189.129/musicsource/song/'),(4,'http://192.168.189.129/musicsource/songpictrue/');

/*Table structure for table `recently_info` */

DROP TABLE IF EXISTS `recently_info`;

CREATE TABLE `recently_info` (
  `recently_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `song_id` bigint(20) NOT NULL COMMENT '歌曲编号(外键)',
  PRIMARY KEY (`recently_id`),
  KEY `song_id` (`song_id`),
  CONSTRAINT `recently_info_ibfk_1` FOREIGN KEY (`song_id`) REFERENCES `song_info` (`song_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `recently_info` */

/*Table structure for table `role_info` */

DROP TABLE IF EXISTS `role_info`;

CREATE TABLE `role_info` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色编号',
  `role_name` varchar(20) NOT NULL COMMENT '角色名称',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `role_info` */

insert  into `role_info`(`role_id`,`role_name`) values (1,'普通用户'),(2,'会员'),(3,'管理员');

/*Table structure for table `security_info` */

DROP TABLE IF EXISTS `security_info`;

CREATE TABLE `security_info` (
  `sid` int(11) NOT NULL AUTO_INCREMENT COMMENT '密保编号',
  `question` varchar(50) NOT NULL COMMENT '密保问题',
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `security_info` */

insert  into `security_info`(`sid`,`question`) values (1,'我的父亲的姓名是？'),(2,'我的母亲的姓名是？'),(3,'我的小学老师的姓名是？'),(4,'我的高中老师的姓名是？'),(5,'我最喜欢的动物是？');

/*Table structure for table `singer_info` */

DROP TABLE IF EXISTS `singer_info`;

CREATE TABLE `singer_info` (
  `singer_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '歌手编号',
  `singer_name` varchar(50) NOT NULL COMMENT '歌手名称',
  `type_id` int(11) NOT NULL COMMENT '歌手类型编号(外键)',
  `popularity` bigint(20) NOT NULL DEFAULT '0' COMMENT '人气值',
  PRIMARY KEY (`singer_id`),
  KEY `type_id` (`type_id`),
  CONSTRAINT `singer_info_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `singer_type` (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `singer_info` */

insert  into `singer_info`(`singer_id`,`singer_name`,`type_id`,`popularity`) values (1,'蔡依林',3,1000),(2,'薛之谦',1,500),(3,'陈势安',1,300);

/*Table structure for table `singer_type` */

DROP TABLE IF EXISTS `singer_type`;

CREATE TABLE `singer_type` (
  `type_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '歌手类型编号',
  `type_name` varchar(50) NOT NULL COMMENT '歌手类型名称',
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `singer_type` */

insert  into `singer_type`(`type_id`,`type_name`) values (1,'大陆'),(2,'香港'),(3,'台湾'),(4,'日韩'),(5,'欧美');

/*Table structure for table `song_comment_info` */

DROP TABLE IF EXISTS `song_comment_info`;

CREATE TABLE `song_comment_info` (
  `comment_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '评论编号',
  `user_id` bigint(20) NOT NULL COMMENT '用户编号(外键)',
  `music_id` bigint(20) NOT NULL COMMENT '歌曲编号(外键)',
  `comment` varchar(200) NOT NULL COMMENT '用户评论',
  `createDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '评论时间(当前系统时间)',
  `praise_count` bigint(20) NOT NULL DEFAULT '0' COMMENT '被点赞次数',
  `disagree_count` bigint(20) NOT NULL DEFAULT '0' COMMENT '被踩次数',
  `music_type` int(11) NOT NULL COMMENT '1:歌曲   2:MV',
  PRIMARY KEY (`comment_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `song_comment_info_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `song_comment_info` */

insert  into `song_comment_info`(`comment_id`,`user_id`,`music_id`,`comment`,`createDate`,`praise_count`,`disagree_count`,`music_type`) values (1,2,1,'还是一如既往的好听！','2018-02-09 10:36:48',32885,431,1),(2,3,2,'我要当天后，哈哈！','2017-08-22 10:34:49',17490,594,2),(3,3,1,'jolin，太喜欢你啦！','2017-10-25 10:34:42',26950,315,2),(4,2,2,'谦谦，爱死你啦！','2016-09-14 10:35:49',31653,214,1);

/*Table structure for table `song_info` */

DROP TABLE IF EXISTS `song_info`;

CREATE TABLE `song_info` (
  `song_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '歌曲编号',
  `song_name` varchar(50) NOT NULL COMMENT '歌曲名称',
  `singer_id` bigint(20) NOT NULL COMMENT '歌手编号(外键)',
  `type_id` int(11) NOT NULL COMMENT '歌曲类型编号(外键)',
  `down_count` bigint(20) NOT NULL DEFAULT '0' COMMENT '下载次数',
  `collect_count` bigint(20) NOT NULL DEFAULT '0' COMMENT '收藏次数',
  `upload_role` int(11) NOT NULL COMMENT '上传角色(1:管理员  2:用户)',
  PRIMARY KEY (`song_id`),
  KEY `singer_id` (`singer_id`),
  KEY `type_id` (`type_id`),
  CONSTRAINT `song_info_ibfk_1` FOREIGN KEY (`singer_id`) REFERENCES `singer_info` (`singer_id`),
  CONSTRAINT `song_info_ibfk_2` FOREIGN KEY (`type_id`) REFERENCES `song_type` (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `song_info` */

insert  into `song_info`(`song_id`,`song_name`,`singer_id`,`type_id`,`down_count`,`collect_count`,`upload_role`) values (1,'日不落',1,2,23,2,1),(2,'认真的雪',2,1,12,1,1),(3,'天后',3,1,11,0,1);

/*Table structure for table `song_type` */

DROP TABLE IF EXISTS `song_type`;

CREATE TABLE `song_type` (
  `type_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '歌曲类型编号',
  `type_name` varchar(50) NOT NULL COMMENT '歌曲类型名称',
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `song_type` */

insert  into `song_type`(`type_id`,`type_name`) values (1,'伤感'),(2,'轻松'),(3,'摇滚');

/*Table structure for table `space_comment_info` */

DROP TABLE IF EXISTS `space_comment_info`;

CREATE TABLE `space_comment_info` (
  `comment_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '评论编号',
  `user_id` bigint(20) NOT NULL COMMENT '发表者编号(用户编号(外键))',
  `message_id` bigint(20) NOT NULL COMMENT '动态信息编号(外键)',
  `comment_user_id` bigint(20) NOT NULL COMMENT '评论者编号(用户编号(外键))',
  `comment` varchar(200) NOT NULL COMMENT '评论信息',
  `createDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '评论时间(当前系统时间)',
  PRIMARY KEY (`comment_id`),
  KEY `user_id` (`user_id`),
  KEY `comment_user_id` (`comment_user_id`),
  KEY `message_id` (`message_id`),
  CONSTRAINT `space_comment_info_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`),
  CONSTRAINT `space_comment_info_ibfk_2` FOREIGN KEY (`comment_user_id`) REFERENCES `user_info` (`user_id`),
  CONSTRAINT `space_comment_info_ibfk_3` FOREIGN KEY (`message_id`) REFERENCES `space_info` (`message_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `space_comment_info` */

insert  into `space_comment_info`(`comment_id`,`user_id`,`message_id`,`comment_user_id`,`comment`,`createDate`) values (1,3,3,2,'好啊，星期天我们一起！','2017-09-07 10:16:47'),(2,2,1,3,'是啊，今天天气真好！','2016-03-15 10:19:40');

/*Table structure for table `space_info` */

DROP TABLE IF EXISTS `space_info`;

CREATE TABLE `space_info` (
  `message_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '信息编号',
  `user_id` bigint(20) NOT NULL COMMENT '用户编号(外键)',
  `message` varchar(200) NOT NULL COMMENT '用户发表的动态',
  `createDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '发表时间(当前系统时间)',
  `praise_count` bigint(20) NOT NULL DEFAULT '0' COMMENT '被点赞次数',
  PRIMARY KEY (`message_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `space_info_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `space_info` */

insert  into `space_info`(`message_id`,`user_id`,`message`,`createDate`,`praise_count`) values (1,2,'今天天气真不错！','2016-03-15 10:13:52',3),(2,2,'好无聊啊，求赞！','2017-05-23 10:13:49',12),(3,3,'星期天出去玩，有没有一起的？','2017-09-05 10:14:19',5);

/*Table structure for table `upload_music_info` */

DROP TABLE IF EXISTS `upload_music_info`;

CREATE TABLE `upload_music_info` (
  `upload_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '上传编号',
  `user_id` bigint(20) NOT NULL COMMENT '上传者编号',
  `music_id` bigint(20) NOT NULL COMMENT '音乐编号(上传后返回的歌曲编号)',
  `createDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '上传时间(当前系统时间)',
  `music_type` int(11) NOT NULL COMMENT '音乐类型(1:歌曲   2:MV)',
  PRIMARY KEY (`upload_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `upload_music_info_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `upload_music_info` */

insert  into `upload_music_info`(`upload_id`,`user_id`,`music_id`,`createDate`,`music_type`) values (1,2,3,'2017-11-01 10:44:52',2);

/*Table structure for table `user_info` */

DROP TABLE IF EXISTS `user_info`;

CREATE TABLE `user_info` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户编号',
  `user_name` varchar(20) NOT NULL COMMENT '用户名',
  `password` varchar(50) NOT NULL COMMENT '密码(MD5加密)',
  `gender` int(11) NOT NULL DEFAULT '0' COMMENT '0:保密  1:男  2:女',
  `email` varchar(50) NOT NULL COMMENT '电子邮箱',
  `createDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '注册时间(当前系统时间)',
  `role_id` int(11) NOT NULL DEFAULT '1' COMMENT '角色编号(外键)',
  `report_count` int(11) NOT NULL DEFAULT '0' COMMENT '次数达100次status=0',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '0:禁用  1:正常',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `uq_name` (`user_name`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `user_info_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role_info` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `user_info` */

insert  into `user_info`(`user_id`,`user_name`,`password`,`gender`,`email`,`createDate`,`role_id`,`report_count`,`status`) values (1,'admin','ba61ce8fa1e3725876e6363c76043c8d',1,'admin@126.com','2018-02-08 20:47:40',3,0,1),(2,'星星','ba61ce8fa1e3725876e6363c76043c8d',0,'xingxing@123.com','2018-02-09 10:10:56',2,0,1),(3,'张媛媛','ba61ce8fa1e3725876e6363c76043c8d',2,'yuanyuan@qq.com','2018-02-09 10:10:45',1,0,1);

/*Table structure for table `user_security_info` */

DROP TABLE IF EXISTS `user_security_info`;

CREATE TABLE `user_security_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_id` bigint(20) NOT NULL COMMENT '用户编号',
  `sid` int(11) NOT NULL COMMENT '密保编号(外键)',
  `answer` varchar(50) NOT NULL COMMENT '问题答案',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `sid` (`sid`),
  CONSTRAINT `user_security_info_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`),
  CONSTRAINT `user_security_info_ibfk_2` FOREIGN KEY (`sid`) REFERENCES `security_info` (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `user_security_info` */

insert  into `user_security_info`(`id`,`user_id`,`sid`,`answer`) values (1,3,1,'father'),(2,3,4,'teacher'),(3,3,5,'rabbit'),(4,2,2,'mather'),(5,2,1,'myfather');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
