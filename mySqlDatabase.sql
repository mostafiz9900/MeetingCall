-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.6.40-log


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema mcs
--

CREATE DATABASE IF NOT EXISTS mcs;
USE mcs;

--
-- Definition of table `bhaban`
--

DROP TABLE IF EXISTS `bhaban`;
CREATE TABLE `bhaban` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `bhaban_name` varchar(255) DEFAULT NULL,
  `org_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKeygho7q23ghbbr42tbv2f6q7c` (`org_id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bhaban`
--

/*!40000 ALTER TABLE `bhaban` DISABLE KEYS */;
INSERT INTO `bhaban` (`id`,`address`,`bhaban_name`,`org_id`) VALUES 
 (1,'2nd Floor, 57, Gulshan Ave, Dhaka 1212',' Gulshan Ave',1),
 (2,' 115-120 Motijheel, Dhaka',' Motijheel Commercial Area',2),
 (3,' Road  	No. 11A','House No. 60',2),
 (4,' Road-8,Dhanmondi, Dhaka','House No. 37',3),
 (5,'Sheraton Hotel Annex, 1, Mintoo Road Dhaka','BSL Office Complex ',4),
 (6,'Dhaka','3A Paribag',5),
 (7,'No. 11A Dhaka',' 	House No. 60',6),
 (8,'Dhaka Sheraton','BSL Office Complex',8),
 (9,'Road No-7  Dhanmondi R/A,Dhaka-1205','House No. 12 (New)',7),
 (10,'E-8A, Rokeya Sharani, Sher-e-BanglaNagar, Dhaka-1207','IDB Bhaban ',9),
 (11,'Board  Bazar,Gazipur','GPO Box No.  3003',11),
 (12,'','',1),
 (13,'','',1),
 (14,'','',1),
 (15,'','',1);
/*!40000 ALTER TABLE `bhaban` ENABLE KEYS */;


--
-- Definition of table `department`
--

DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `department_name` varchar(255) DEFAULT NULL,
  `rank` varchar(255) DEFAULT NULL,
  `short_name` varchar(255) DEFAULT NULL,
  `org_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKhtct6ymdgyoc7dwnbqx6cfbc0` (`org_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `department`
--

/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` (`id`,`department_name`,`rank`,`short_name`,`org_id`) VALUES 
 (1,'Marketing','05','MKT',1),
 (2,'Account','04','ACC',2),
 (3,'Marketion','06','MKT',1);
/*!40000 ALTER TABLE `department` ENABLE KEYS */;


--
-- Definition of table `designation`
--

DROP TABLE IF EXISTS `designation`;
CREATE TABLE `designation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `designation_name` varchar(255) DEFAULT NULL,
  `short_designation` varchar(255) DEFAULT NULL,
  `org_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK8vpmg7os6jdfdg69qyaocc6v6` (`org_id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `designation`
--

/*!40000 ALTER TABLE `designation` DISABLE KEYS */;
INSERT INTO `designation` (`id`,`designation_name`,`short_designation`,`org_id`) VALUES 
 (1,'Chartered Professional Accountant',' CPA',1),
 (2,'Qualified Administrative Assistant',' QAA',2),
 (3,'Chartered Professional Accountant ','CPA',1),
 (4,'Qualified Administrative Assistant ','QAA',2),
 (5,'Chartered Financial Analyst ','CFA',3),
 (6,'Certified Financial Planner ','CFP',4),
 (7,'Marketing Certified Marketing Specialist','CMS',5),
 (8,'Certified In Management ','CIM',1),
 (9,'Certified In Management ','CIM',7),
 (10,'Certified Supply Chain Professional ','CSCP',8),
 (11,'Canadian Certified Counsellor ','CCC',9),
 (12,'Project Management Professional ','PMP',10);
/*!40000 ALTER TABLE `designation` ENABLE KEYS */;


--
-- Definition of table `floor`
--

DROP TABLE IF EXISTS `floor`;
CREATE TABLE `floor` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `floor_name` varchar(255) DEFAULT NULL,
  `bhaban_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKm5k7doqbrlpg122yprv4te2is` (`bhaban_id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `floor`
--

/*!40000 ALTER TABLE `floor` DISABLE KEYS */;
INSERT INTO `floor` (`id`,`floor_name`,`bhaban_id`) VALUES 
 (1,'2nd Floor',1),
 (2,'6th Floor',2),
 (3,'2nd Floor',2),
 (4,'3th  Floor',3),
 (5,'8th Floor',4),
 (6,'7th Floor',5),
 (7,'3th Floor',6),
 (8,'4th Floor',8),
 (9,'2nd Floor',10),
 (10,'5th Floor',11),
 (11,'4th Floor',1),
 (12,'7th Floor',2),
 (13,'5th Floor',3),
 (14,'10 th Floor',5),
 (15,'9th Floor',6),
 (16,'3th Floor',9),
 (17,'4th Floor',10),
 (18,'6th Floor',11);
/*!40000 ALTER TABLE `floor` ENABLE KEYS */;


--
-- Definition of table `meeting`
--

DROP TABLE IF EXISTS `meeting`;
CREATE TABLE `meeting` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `body` varchar(255) DEFAULT NULL,
  `end` varchar(255) DEFAULT NULL,
  `from_address` varchar(255) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `to_address` varchar(255) DEFAULT NULL,
  `org_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKbnw9b13uwibv0g3fyfe9vs4gq` (`org_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `meeting`
--

/*!40000 ALTER TABLE `meeting` DISABLE KEYS */;
INSERT INTO `meeting` (`id`,`body`,`end`,`from_address`,`start_date`,`subject`,`to_address`,`org_id`) VALUES 
 (1,'hi plz joy meeting','thnks','mirpur@gmail.com','2019-03-04 00:00:00','monthaly meeting','dhaka@gmail.com',1),
 (2,'hi plz joy meeting','end','mirpur@gmail.com','2019-03-16 00:00:00','monthaly meeting','dhaka@gmail.com',4),
 (3,'hi plz joy meeting','thnks','mirpur@gmail.com','2019-03-20 00:00:00','Weekly Meeting ','dhaka@gmail.com',3);
/*!40000 ALTER TABLE `meeting` ENABLE KEYS */;


--
-- Definition of table `meeting_officer`
--

DROP TABLE IF EXISTS `meeting_officer`;
CREATE TABLE `meeting_officer` (
  `meeting_id` bigint(20) NOT NULL,
  `officer_id` bigint(20) NOT NULL,
  PRIMARY KEY (`meeting_id`,`officer_id`),
  KEY `FKq1y2cjx2ud32r036b7su56ny4` (`officer_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `meeting_officer`
--

/*!40000 ALTER TABLE `meeting_officer` DISABLE KEYS */;
INSERT INTO `meeting_officer` (`meeting_id`,`officer_id`) VALUES 
 (1,1),
 (2,1),
 (2,2),
 (2,4),
 (3,1),
 (3,2),
 (3,3),
 (3,4);
/*!40000 ALTER TABLE `meeting_officer` ENABLE KEYS */;


--
-- Definition of table `minor`
--

DROP TABLE IF EXISTS `minor`;
CREATE TABLE `minor` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `agenda_action` varchar(255) DEFAULT NULL,
  `meeting_title` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `meeting_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKoac6c2lnml4ssqa7v9ixdu1mj` (`meeting_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `minor`
--

/*!40000 ALTER TABLE `minor` DISABLE KEYS */;
INSERT INTO `minor` (`id`,`agenda_action`,`meeting_title`,`remark`,`meeting_id`) VALUES 
 (1,'bb','aaa','best',1);
/*!40000 ALTER TABLE `minor` ENABLE KEYS */;


--
-- Definition of table `minor_officer`
--

DROP TABLE IF EXISTS `minor_officer`;
CREATE TABLE `minor_officer` (
  `minor_id` bigint(20) NOT NULL,
  `officer_id` bigint(20) NOT NULL,
  PRIMARY KEY (`minor_id`,`officer_id`),
  KEY `FKcufcxa9b623468nupwwkrwubi` (`officer_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `minor_officer`
--

/*!40000 ALTER TABLE `minor_officer` DISABLE KEYS */;
/*!40000 ALTER TABLE `minor_officer` ENABLE KEYS */;


--
-- Definition of table `organization`
--

DROP TABLE IF EXISTS `organization`;
CREATE TABLE `organization` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `ministry_name_or_head_office` varchar(255) DEFAULT NULL,
  `org_chief_name` varchar(255) DEFAULT NULL,
  `org_name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `registration_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_t4bamosb7eleheafmlcalbhjf` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `organization`
--

/*!40000 ALTER TABLE `organization` DISABLE KEYS */;
INSERT INTO `organization` (`id`,`email`,`ministry_name_or_head_office`,`org_chief_name`,`org_name`,`phone`,`registration_date`) VALUES 
 (1,'akk.com@gmail.com','Chittagong','A K Khan','A K Khan & Company ','01730959438','2019-03-10 12:46:20'),
 (2,'adsalam@gmail.com','Narayanganj','A B Salam','Adamjee Jute Mills','01725364855','2019-03-10 12:47:50'),
 (3,'fag@gmail.com','Dhanmondi, Dhaka','Mahabub Rahman','Food  and Agriculture','8118015254','2019-03-11 22:21:41'),
 (4,'adb@gmail.com','Sheraton Hotel Annex, 1','Moly Akter',' Asian Development Bank','0172356894','2019-03-11 22:24:59'),
 (5,'akmm@gmail.com','3A Paribag, Dhaka','A K M Mahatab',' International Bank for   Reconstruction and  Development World Bank','01725252525','2019-03-11 22:26:42'),
 (6,'uncd@gmail.com','Dhanmondi','Sufiya Parvin',' United Nations Capital  Development Fund','01633321732','2019-03-11 22:28:05'),
 (7,'whol@gmail.com',' 	Dhanmondi R/A,Dhaka-1205','Liton Mondol','World Health Organization ','01366258690','2019-03-11 22:29:18'),
 (8,'unb@gmail.com',' 	Sher-e-BanglaNagar, Dhaka-1207','T S B Shihab','United Nations Volunteers','01820103060','2019-03-11 22:30:41'),
 (9,'tanbir@gmail.com','E-8A, Rokeya Sharani  	Sher-e-BanglaNagar, Dhaka-1207','Tanbir Hassan',' United Nations Information Center','01730959430','2019-03-11 22:31:59'),
 (10,'shamin@gmail.com','145, Monipuri Para. Dhaka','Shamin Hassan',' International Jute Organization','01730959431','2019-03-11 22:33:40'),
 (11,'iit@gmail.com',' 	Board  Bazar,Gazipur,','A Altab Mahabud',' Islamic Institute of Technology 	','01730959435','2019-03-11 22:34:36'),
 (12,'intere@gmail.com',' 	Block NW(G),Gulshan-2, ','Haidar Ali',' International Organization for   Migration (IOM)','01730959436','2019-03-11 22:37:07');
/*!40000 ALTER TABLE `organization` ENABLE KEYS */;


--
-- Definition of table `role`
--

DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `role`
--

/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` (`id`,`role_name`) VALUES 
 (1,'USER'),
 (2,'ADMIN'),
 (3,'SUPERADMIN'),
 (4,'CADMIN'),
 (5,'PM');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;


--
-- Definition of table `room`
--

DROP TABLE IF EXISTS `room`;
CREATE TABLE `room` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `room_no` varchar(255) DEFAULT NULL,
  `floor_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKstlo96g0nkwp4urd4e0ki5b3h` (`floor_id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `room`
--

/*!40000 ALTER TABLE `room` DISABLE KEYS */;
INSERT INTO `room` (`id`,`room_no`,`floor_id`) VALUES 
 (1,'M06',1),
 (2,'T9',2),
 (3,'205',1),
 (4,'608',2),
 (5,'204',3),
 (6,'206',1),
 (7,'501',10),
 (8,'4001',11),
 (9,'7005',12),
 (10,'908',15),
 (11,'1006',14),
 (12,'3004',16),
 (13,'4008',17),
 (14,'6007',18);
/*!40000 ALTER TABLE `room` ENABLE KEYS */;


--
-- Definition of table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `birth_date` date NOT NULL,
  `confirmation_token` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `enabled` bit(1) NOT NULL,
  `file_extension` varchar(255) DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `file_path` varchar(255) DEFAULT NULL,
  `file_size` bigint(20) DEFAULT NULL,
  `first_name` varchar(50) NOT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `last_modified_date` datetime DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `regi_date` datetime DEFAULT NULL,
  `user_name` varchar(255) NOT NULL,
  `dep_id` bigint(20) DEFAULT NULL,
  `desig_id` bigint(20) DEFAULT NULL,
  `org_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_ob8kqyqqgmefl0aco34akdtpe` (`email`),
  UNIQUE KEY `UK_lqjrcobrh9jc8wpcar64q1bfh` (`user_name`),
  UNIQUE KEY `UK_cnjwxx5favk5ycqajjt17fwy1` (`mobile`),
  KEY `FK3x7b5829jumyimey9x7vmbh2f` (`dep_id`),
  KEY `FKodbkeboq45oayv165spts4u7m` (`desig_id`),
  KEY `FKhulr6qu116k1dd68w3itppg15` (`org_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`id`,`birth_date`,`confirmation_token`,`email`,`enabled`,`file_extension`,`file_name`,`file_path`,`file_size`,`first_name`,`gender`,`last_modified_date`,`last_name`,`mobile`,`password`,`regi_date`,`user_name`,`dep_id`,`desig_id`,`org_id`) VALUES 
 (1,'1993-06-05','409eeb08-eb15-4faf-8bbb-1ba735973fd7','admin@gmail.com',0x01,'image/png','new-mosta.png','images/new-mosta.png',71614,'Mostafizur','mail','2019-03-11 12:36:14','Rahman','01730959439','$2a$10$Qlx1aA5ApMV.apVgWk/cdeTFHlu4nL9nBHuYiPvU/O2iUQh8erz7y',NULL,'mostafiz',1,1,1),
 (2,'1993-01-04','533b2d98-305a-4271-92e5-8e3fa7696c3a','sofiqul54@gmail.com',0x01,'image/png','new-facebook.png','images/new-facebook.png',4865,'Sofiqullll','mail','2019-03-13 09:32:19','Islam','01748567000','$2a$10$jTxYOcrRFzVkwjwINGMzSefh7HoubML1WVpbPJDoSxR7vdHFyXbLi','2019-03-10 13:01:09','sofiqul54',2,5,7),
 (3,'2019-02-26','02552e5c-19d7-4f11-aca3-7d8315d2c36e','shomon@gmail.com',0x01,'image/jpeg','new-jubayir.jpg','images/new-jubayir.jpg',2784,'Shomon','mail','2019-03-13 10:40:57','Khan','01759016441','$2a$10$8aqHd0/HNeTjg.PUVtXWMO9/F2CR1FiPdBiJ1XAmfoscPcJOgbHLO','2019-03-10 19:48:06','shomon',2,1,4),
 (4,'2019-02-26','7ce1353d-2e23-40df-a171-9eb1f1458809','mahabub@gmail.com',0x01,'image/jpeg','new-mahabub.jpg','images/new-mahabub.jpg',46300,'Mahabub','mail','2019-03-13 10:41:55','Rahman','01722928984','$2a$10$LkdXM3TYBUmjL0l45fJaS.8ekeK/VmPubOgxNmhfpcR7rKQs/K/xK','2019-03-10 20:31:38','mahabub',2,1,2),
 (5,'2019-02-25','1f16bfa4-0a10-48fc-ba6c-2e23ad5440fe','mostafizmkt3@gmail.com',0x01,NULL,NULL,NULL,0,'Md Mostafizur','m','2019-03-11 20:03:24','Rahman',NULL,'$2a$10$R6JIwc2xt0lJI.ab46r.r.Ldh2a7St4qBAqa60J8QzK8J6EZe6zpq','2019-03-11 20:03:25','mostafizmkt3',NULL,NULL,NULL),
 (6,'2019-02-24','f8def119-8c34-478d-a36b-5ad94c014200','mostafiz.blast@gmail.com',0x01,NULL,NULL,NULL,0,'Md ','m','2019-03-11 21:42:19','Mostafiz',NULL,'$2a$10$Xaapx04FmRhfwpLnDlBBZ.ffpg4Q5KIf7n3sHpRp4BySBpkVAEdGq','2019-03-11 21:42:21','mostafiz.blast',NULL,NULL,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;


--
-- Definition of table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `FKa68196081fvovjhkek5m97n3y` (`role_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_role`
--

/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` (`user_id`,`role_id`) VALUES 
 (1,2),
 (1,3),
 (2,1),
 (3,1),
 (4,2),
 (5,3),
 (6,1);
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
