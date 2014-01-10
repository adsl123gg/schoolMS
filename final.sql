/*
SQLyog Community v9.0 
MySQL - 5.5.19 : Database - mydb
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`mydb` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `mydb`;

/*Table structure for table `admin` */

DROP TABLE IF EXISTS `admin`;

CREATE TABLE `admin` (
  `id` varchar(36) NOT NULL,
  `name` varchar(20) NOT NULL,
  `birth` varchar(45) NOT NULL,
  `sex` tinyint(1) NOT NULL,
  `address` text,
  `username` varchar(36) NOT NULL,
  `passwd` varchar(36) NOT NULL,
  `intime` varchar(20) NOT NULL,
  `power` varchar(45) NOT NULL,
  `createtime` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `admin` */

insert  into `admin`(`id`,`name`,`birth`,`sex`,`address`,`username`,`passwd`,`intime`,`power`,`createtime`) values ('e518d46b-4362-4c82-8c38-4a64018ff839','王刚','1990.10',0,NULL,'111','111','2000.09','all','');

/*Table structure for table `class` */

DROP TABLE IF EXISTS `class`;

CREATE TABLE `class` (
  `id` varchar(36) NOT NULL,
  `classname` varchar(36) NOT NULL,
  `createtime` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `classname_UNIQUE` (`classname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `class` */

insert  into `class`(`id`,`classname`,`createtime`) values ('fa4f2d4f3edac0be013edac132440000','电仪09-1班','2013-05-25 16:14:54'),('fa4f2d4f3edac0be013edac1faf10003','电仪09-2班','2013-05-25 16:15:45'),('fa4f2d4f3edac0be013edac308f10008','电仪09-3班','2013-05-25 16:16:55');

/*Table structure for table `class_course` */

DROP TABLE IF EXISTS `class_course`;

CREATE TABLE `class_course` (
  `class_id` varchar(36) NOT NULL,
  `course_id` varchar(36) NOT NULL,
  PRIMARY KEY (`class_id`,`course_id`),
  KEY `fk_class_has_course_course1` (`course_id`),
  KEY `fk_class_has_course_class1` (`class_id`),
  CONSTRAINT `fk_class_has_course_class1` FOREIGN KEY (`class_id`) REFERENCES `class` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_class_has_course_course1` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `class_course` */

insert  into `class_course`(`class_id`,`course_id`) values ('fa4f2d4f3edac0be013edac132440000','fa4f2d4f3edac0be013edac5d21b0013'),('fa4f2d4f3edac0be013edac1faf10003','fa4f2d4f3edac0be013edac5d21b0013'),('fa4f2d4f3edac0be013edac1faf10003','fa4f2d4f3edac0be013edac639170014'),('fa4f2d4f3edac0be013edac308f10008','fa4f2d4f3edac0be013edac639170014');

/*Table structure for table `course` */

DROP TABLE IF EXISTS `course`;

CREATE TABLE `course` (
  `id` varchar(36) NOT NULL,
  `coursename` varchar(20) NOT NULL,
  `time` varchar(100) NOT NULL,
  `address` varchar(20) NOT NULL,
  `credit` varchar(10) NOT NULL,
  `property` varchar(45) NOT NULL,
  `createtime` varchar(45) NOT NULL,
  `teacher_id` varchar(36) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_course_teacher1` (`teacher_id`),
  CONSTRAINT `fk_course_teacher1` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `course` */

insert  into `course`(`id`,`coursename`,`time`,`address`,`credit`,`property`,`createtime`,`teacher_id`) values ('fa4f2d4f3edac0be013edac5d21b0013','java','星期一第一节&&星期一第二节&&星期五第九节&&星期五第十节','1101','2','必修','2013-05-25 16:19:57','fa4f2d4f3edac0be013edac4532b000d'),('fa4f2d4f3edac0be013edac639170014','linux','星期二第九节&&星期二第十节','1102','3','必修','2013-05-25 16:20:23','fa4f2d4f3edac0be013edac4532b000d');

/*Table structure for table `data` */

DROP TABLE IF EXISTS `data`;

CREATE TABLE `data` (
  `id` char(36) NOT NULL,
  `filename` varchar(45) NOT NULL,
  `createtime` varchar(36) NOT NULL,
  `user_id` varchar(36) NOT NULL,
  `savename` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_data_user1` (`user_id`),
  CONSTRAINT `fk_data_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `data` */

insert  into `data`(`id`,`filename`,`createtime`,`user_id`,`savename`) values ('fa4f2d4f3edaeacb013edaebcbef0000','javascript.chm','2013-05-25 17:01:26','fasdfsdgfg','75410901-4e5f-4d05-ae5e-c1d45dc0f844.chm'),('fa4f2d4f3edaeacb013edaed786e0002','mydb.mwb','2013-05-25 17:03:16','fasdfsdgfg','81ff7f1b-5ebd-4c87-b8d6-bfef6ffdced4.mwb'),('fa4f2d4f3edaeacb013edaed9c550003','毕业设计相关要求及安排.doc','2013-05-25 17:03:25','fasdfsdgfg','c07d3716-c4ea-4617-aaa6-ecd65afb44da.doc'),('fa4f2d4f3edaeacb013edaee03280004','郝郝——教务管理系统毕设.doc','2013-05-25 17:03:51','fasdfsdgfg','1d6b4ee7-7601-43a5-9e18-f93441d1cbc3.doc'),('fa4f2d4f3edaeacb013edaf40e8a0008','Struts2.chm','2013-05-25 17:10:27','fasdfsdgfg','c53adb26-855c-41d8-b217-6197c4b22cd8.chm'),('fa4f2d4f3edb17bd013edb187d1d0000','css3.chm','2013-05-25 17:50:15','fa4f2d4f3edac0be013edac45357000e','92925f79-252e-4836-957a-8a7ec33f10a5.chm');

/*Table structure for table `exam` */

DROP TABLE IF EXISTS `exam`;

CREATE TABLE `exam` (
  `id` varchar(36) NOT NULL,
  `starttime` varchar(45) NOT NULL,
  `address` varchar(45) NOT NULL,
  `course_id` varchar(36) NOT NULL,
  `createtime` varchar(45) NOT NULL,
  `paper_id` varchar(36) NOT NULL,
  `lengthoftime` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `course_id_UNIQUE` (`course_id`),
  UNIQUE KEY `paper_id_UNIQUE` (`paper_id`),
  KEY `fk_exam_course1` (`course_id`),
  KEY `fk_exam_paper1` (`paper_id`),
  CONSTRAINT `fk_exam_course1` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_exam_paper1` FOREIGN KEY (`paper_id`) REFERENCES `paper` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `exam` */

insert  into `exam`(`id`,`starttime`,`address`,`course_id`,`createtime`,`paper_id`,`lengthoftime`) values ('fa4f2d4f3edae7e8013edae91ffb0000','05/25/2013 16:00','1123','fa4f2d4f3edac0be013edac5d21b0013','2013-05-25 16:58:31','fa4f2d4f3edad9a9013edadeac000002','1');

/*Table structure for table `paper` */

DROP TABLE IF EXISTS `paper`;

CREATE TABLE `paper` (
  `id` varchar(36) NOT NULL,
  `state` varchar(45) DEFAULT NULL,
  `name` text,
  `teacher_id` varchar(36) NOT NULL,
  `createtime` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_paper_teacher1` (`teacher_id`),
  CONSTRAINT `fk_paper_teacher1` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `paper` */

insert  into `paper`(`id`,`state`,`name`,`teacher_id`,`createtime`) values ('fa4f2d4f3edad9a9013edadeac000002','审核通过','2012-2013学期java考试试题','fa4f2d4f3edac0be013edac4532b000d','2013-05-25 16:47:06');

/*Table structure for table `questions` */

DROP TABLE IF EXISTS `questions`;

CREATE TABLE `questions` (
  `id` varchar(36) NOT NULL,
  `question` text NOT NULL,
  `answers` text NOT NULL,
  `rightAnswer` text NOT NULL,
  `score` int(11) NOT NULL,
  `paper_id` varchar(36) NOT NULL,
  `createtime` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_questions_paper1` (`paper_id`),
  CONSTRAINT `fk_questions_paper1` FOREIGN KEY (`paper_id`) REFERENCES `paper` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `questions` */

insert  into `questions`(`id`,`question`,`answers`,`rightAnswer`,`score`,`paper_id`,`createtime`) values ('fa4f2d4f3edad9a9013edadf7a210003','SSH中H指的是什么','hello&&hibernate&&linux','B',2,'fa4f2d4f3edad9a9013edadeac000002','2013-05-25 16:47:59'),('fa4f2d4f3edad9a9013edae00ba20004','java是强语言还是弱语言','强&&弱&&不知道','A',1,'fa4f2d4f3edad9a9013edadeac000002','2013-05-25 16:48:36');

/*Table structure for table `school_log` */

DROP TABLE IF EXISTS `school_log`;

CREATE TABLE `school_log` (
  `id` varchar(36) NOT NULL,
  `log` text NOT NULL,
  `createtime` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `school_log` */

/*Table structure for table `score` */

DROP TABLE IF EXISTS `score`;

CREATE TABLE `score` (
  `id` varchar(36) NOT NULL,
  `score` float DEFAULT NULL,
  `student_id` varchar(36) NOT NULL,
  `state` varchar(45) NOT NULL DEFAULT '正常',
  `createtime` varchar(45) DEFAULT NULL,
  `course_id` varchar(36) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_score_student1` (`student_id`),
  KEY `fk_score_course1` (`course_id`),
  CONSTRAINT `fk_score_student1` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_score_course1` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `score` */

insert  into `score`(`id`,`score`,`student_id`,`state`,`createtime`,`course_id`) values ('fa4f2d4f3edae7e8013edae98c660001',3,'fa4f2d4f3edac0be013edac23ba90004','正常','2013-05-25 16:58:59','fa4f2d4f3edac0be013edac5d21b0013');

/*Table structure for table `student` */

DROP TABLE IF EXISTS `student`;

CREATE TABLE `student` (
  `id` varchar(36) NOT NULL,
  `name` varchar(20) NOT NULL,
  `birth` varchar(45) NOT NULL,
  `sex` tinyint(1) NOT NULL,
  `address` text,
  `username` varchar(36) NOT NULL,
  `passwd` varchar(36) NOT NULL,
  `class_id` varchar(36) NOT NULL,
  `intime` varchar(20) NOT NULL,
  `createtime` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_student_class` (`class_id`),
  CONSTRAINT `fk_student_class` FOREIGN KEY (`class_id`) REFERENCES `class` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `student` */

insert  into `student`(`id`,`name`,`birth`,`sex`,`address`,`username`,`passwd`,`class_id`,`intime`,`createtime`) values ('fa4f2d4f3edac0be013edac1e1b80001','周帅鹏','1989',1,'河南','0130','0130','fa4f2d4f3edac0be013edac132440000','2009','2013-05-25 16:15:39'),('fa4f2d4f3edac0be013edac23ba90004','郝郝','1991',1,'河南','0207','111','fa4f2d4f3edac0be013edac1faf10003','2009','2013-05-25 16:16:02'),('fa4f2d4f3edac0be013edac2a8f90006','董明灿','1989',1,'河南','0204','0204','fa4f2d4f3edac0be013edac1faf10003','2009','2013-05-25 16:16:30'),('fa4f2d4f3edac0be013edac385e00009','范腾飞','1989',1,'河南','0205','0205','fa4f2d4f3edac0be013edac1faf10003','2009','2013-05-25 16:17:27'),('fa4f2d4f3edac0be013edac3d7ab000b','史君杰','1989',1,'河南','0301','0301','fa4f2d4f3edac0be013edac308f10008','2009','2013-05-25 16:17:47');

/*Table structure for table `teacher` */

DROP TABLE IF EXISTS `teacher`;

CREATE TABLE `teacher` (
  `id` varchar(36) NOT NULL,
  `name` varchar(20) NOT NULL,
  `birth` varchar(45) NOT NULL,
  `sex` tinyint(1) NOT NULL,
  `address` text,
  `username` varchar(36) NOT NULL,
  `passwd` varchar(36) NOT NULL,
  `intime` varchar(20) NOT NULL,
  `school` varchar(45) DEFAULT NULL,
  `education` varchar(45) DEFAULT NULL,
  `createtime` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `teacher` */

insert  into `teacher`(`id`,`name`,`birth`,`sex`,`address`,`username`,`passwd`,`intime`,`school`,`education`,`createtime`) values ('fa4f2d4f3edac0be013edac4532b000d','李老师','1980',1,'河南','7890','7890','2000','清华','博士','2013-05-25 16:18:19'),('fa4f2d4f3edac0be013edac4a115000f','王老师','1960',1,'北京','7891','7891','2002','北航','本科','2013-05-25 16:18:39'),('fa4f2d4f3edac0be013edac5463f0011','万老师','1967',0,'山东','7892','7892','1998','1998','1998','2013-05-25 16:19:21');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` varchar(36) NOT NULL,
  `username` varchar(45) NOT NULL,
  `passwd` varchar(45) NOT NULL,
  `pic` text NOT NULL,
  `role` varchar(45) NOT NULL,
  `createtime` varchar(45) NOT NULL,
  `identity_id` varchar(36) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`id`,`username`,`passwd`,`pic`,`role`,`createtime`,`identity_id`) values ('fa4f2d4f3edac0be013edac1e1f80002','0130','0130','/img/student_pic.png','student','2013-05-25 16:15:39','fa4f2d4f3edac0be013edac1e1b80001'),('fa4f2d4f3edac0be013edac23c1e0005','0207','0207','/img/student_pic.png','student','2013-05-25 16:16:02','fa4f2d4f3edac0be013edac23ba90004'),('fa4f2d4f3edac0be013edac2a92e0007','0204','0204','/img/student_pic.png','student','2013-05-25 16:16:30','fa4f2d4f3edac0be013edac2a8f90006'),('fa4f2d4f3edac0be013edac38648000a','0205','0205','/img/student_pic.png','student','2013-05-25 16:17:27','fa4f2d4f3edac0be013edac385e00009'),('fa4f2d4f3edac0be013edac3d818000c','0301','0301','/img/student_pic.png','student','2013-05-25 16:17:48','fa4f2d4f3edac0be013edac3d7ab000b'),('fa4f2d4f3edac0be013edac45357000e','7890','7890','/img/teacher_pic.png','teacher','2013-05-25 16:18:19','fa4f2d4f3edac0be013edac4532b000d'),('fa4f2d4f3edac0be013edac4a18a0010','7891','7891','/img/teacher_pic.png','teacher','2013-05-25 16:18:39','fa4f2d4f3edac0be013edac4a115000f'),('fa4f2d4f3edac0be013edac5467a0012','7892','7892','/img/teacher_pic.png','teacher','2013-05-25 16:19:21','fa4f2d4f3edac0be013edac5463f0011'),('fasdfsdgfg','111','111','adsfasdfasd','admin','2012/09/23','e518d46b-4362-4c82-8c38-4a64018ff839');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
