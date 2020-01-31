/*
SQLyog Trial v13.1.5  (64 bit)
MySQL - 5.7.29-log : Database - api_assessment
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`api_assessment` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `api_assessment`;

/*Table structure for table `auth_group` */

DROP TABLE IF EXISTS `auth_group`;

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `auth_group` */

/*Table structure for table `auth_group_permissions` */

DROP TABLE IF EXISTS `auth_group_permissions`;

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `auth_group_permissions` */

/*Table structure for table `auth_permission` */

DROP TABLE IF EXISTS `auth_permission`;

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

/*Data for the table `auth_permission` */

insert  into `auth_permission`(`id`,`name`,`content_type_id`,`codename`) values 
(1,'Can add log entry',1,'add_logentry'),
(2,'Can change log entry',1,'change_logentry'),
(3,'Can delete log entry',1,'delete_logentry'),
(4,'Can view log entry',1,'view_logentry'),
(5,'Can add permission',2,'add_permission'),
(6,'Can change permission',2,'change_permission'),
(7,'Can delete permission',2,'delete_permission'),
(8,'Can view permission',2,'view_permission'),
(9,'Can add group',3,'add_group'),
(10,'Can change group',3,'change_group'),
(11,'Can delete group',3,'delete_group'),
(12,'Can view group',3,'view_group'),
(13,'Can add user',4,'add_user'),
(14,'Can change user',4,'change_user'),
(15,'Can delete user',4,'delete_user'),
(16,'Can view user',4,'view_user'),
(17,'Can add content type',5,'add_contenttype'),
(18,'Can change content type',5,'change_contenttype'),
(19,'Can delete content type',5,'delete_contenttype'),
(20,'Can view content type',5,'view_contenttype'),
(21,'Can add session',6,'add_session'),
(22,'Can change session',6,'change_session'),
(23,'Can delete session',6,'delete_session'),
(24,'Can view session',6,'view_session'),
(25,'Can add employee',7,'add_employee'),
(26,'Can change employee',7,'change_employee'),
(27,'Can delete employee',7,'delete_employee'),
(28,'Can view employee',7,'view_employee');

/*Table structure for table `auth_user` */

DROP TABLE IF EXISTS `auth_user`;

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `auth_user` */

insert  into `auth_user`(`id`,`password`,`last_login`,`is_superuser`,`username`,`first_name`,`last_name`,`email`,`is_staff`,`is_active`,`date_joined`) values 
(1,'pbkdf2_sha256$180000$MDlU1IPeH445$R0HCJUEjORa1rMytthA3uhUAERXf+MZMS0iSzoZ5Fjo=','2020-01-31 08:36:05.298781',1,'admin','','','',1,1,'2020-01-31 08:33:48.795414');

/*Table structure for table `auth_user_groups` */

DROP TABLE IF EXISTS `auth_user_groups`;

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `auth_user_groups` */

/*Table structure for table `auth_user_user_permissions` */

DROP TABLE IF EXISTS `auth_user_user_permissions`;

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `auth_user_user_permissions` */

/*Table structure for table `django_admin_log` */

DROP TABLE IF EXISTS `django_admin_log`;

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

/*Data for the table `django_admin_log` */

insert  into `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) values 
(1,'2020-01-31 08:38:08.389533','16','employee object (16)',3,'',7,1),
(2,'2020-01-31 08:38:08.527130','15','employee object (15)',3,'',7,1),
(3,'2020-01-31 08:38:08.554058','14','employee object (14)',3,'',7,1),
(4,'2020-01-31 08:38:08.672816','13','employee object (13)',3,'',7,1),
(5,'2020-01-31 08:38:08.721534','12','employee object (12)',3,'',7,1),
(6,'2020-01-31 08:38:08.761490','11','employee object (11)',3,'',7,1),
(7,'2020-01-31 08:38:08.799914','10','employee object (10)',3,'',7,1),
(8,'2020-01-31 08:38:08.828466','9','employee object (9)',3,'',7,1),
(9,'2020-01-31 08:38:08.868184','8','employee object (8)',3,'',7,1),
(10,'2020-01-31 08:38:08.895513','7','employee object (7)',3,'',7,1),
(11,'2020-01-31 08:38:08.934900','6','employee object (6)',3,'',7,1),
(12,'2020-01-31 08:38:08.962414','5','employee object (5)',3,'',7,1),
(13,'2020-01-31 08:38:09.001782','4','employee object (4)',3,'',7,1),
(14,'2020-01-31 08:38:09.041275','3','employee object (3)',3,'',7,1),
(15,'2020-01-31 08:38:09.070273','2','employee object (2)',3,'',7,1),
(16,'2020-01-31 08:38:09.108750','1','employee object (1)',3,'',7,1),
(17,'2020-01-31 08:39:10.776795','1','employee object (1)',1,'[{\"added\": {}}]',7,1),
(18,'2020-01-31 08:39:30.413908','2','employee object (2)',1,'[{\"added\": {}}]',7,1),
(19,'2020-01-31 08:40:14.946613','3','employee object (3)',1,'[{\"added\": {}}]',7,1),
(20,'2020-01-31 08:41:00.586947','4','employee object (4)',1,'[{\"added\": {}}]',7,1),
(21,'2020-01-31 08:41:32.705479','5','employee object (5)',1,'[{\"added\": {}}]',7,1),
(22,'2020-01-31 08:42:20.997348','6','employee object (6)',1,'[{\"added\": {}}]',7,1),
(23,'2020-01-31 08:42:50.668365','7','employee object (7)',1,'[{\"added\": {}}]',7,1);

/*Table structure for table `django_content_type` */

DROP TABLE IF EXISTS `django_content_type`;

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `django_content_type` */

insert  into `django_content_type`(`id`,`app_label`,`model`) values 
(1,'admin','logentry'),
(3,'auth','group'),
(2,'auth','permission'),
(4,'auth','user'),
(5,'contenttypes','contenttype'),
(7,'empapi','employee'),
(6,'sessions','session');

/*Table structure for table `django_migrations` */

DROP TABLE IF EXISTS `django_migrations`;

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

/*Data for the table `django_migrations` */

insert  into `django_migrations`(`id`,`app`,`name`,`applied`) values 
(1,'contenttypes','0001_initial','2020-01-31 08:31:45.292854'),
(2,'auth','0001_initial','2020-01-31 08:31:47.227951'),
(3,'admin','0001_initial','2020-01-31 08:31:55.112352'),
(4,'admin','0002_logentry_remove_auto_add','2020-01-31 08:31:57.447265'),
(5,'admin','0003_logentry_add_action_flag_choices','2020-01-31 08:31:57.487224'),
(6,'contenttypes','0002_remove_content_type_name','2020-01-31 08:31:58.772097'),
(7,'auth','0002_alter_permission_name_max_length','2020-01-31 08:31:59.444374'),
(8,'auth','0003_alter_user_email_max_length','2020-01-31 08:32:01.029331'),
(9,'auth','0004_alter_user_username_opts','2020-01-31 08:32:01.077303'),
(10,'auth','0005_alter_user_last_login_null','2020-01-31 08:32:01.726839'),
(11,'auth','0006_require_contenttypes_0002','2020-01-31 08:32:01.763202'),
(12,'auth','0007_alter_validators_add_error_messages','2020-01-31 08:32:01.810362'),
(13,'auth','0008_alter_user_username_max_length','2020-01-31 08:32:02.629641'),
(14,'auth','0009_alter_user_last_name_max_length','2020-01-31 08:32:03.604684'),
(15,'auth','0010_alter_group_name_max_length','2020-01-31 08:32:04.476320'),
(16,'auth','0011_update_proxy_permissions','2020-01-31 08:32:05.020482'),
(17,'empapi','0001_initial','2020-01-31 08:32:05.248976'),
(18,'sessions','0001_initial','2020-01-31 08:32:05.623407');

/*Table structure for table `django_session` */

DROP TABLE IF EXISTS `django_session`;

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `django_session` */

insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values 
('raf4glegm4g0bze43lzyxse18ll2gwtz','OTJkNjg3NWJmYjg1NWVhYTk5Njc2Zjg4OWY0MDIzZTI5NWUzNmQzYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIxNzhlNmY3YWY2M2M0ODk1OTQyM2ViMzBiMWI4YzU3MzNkYmRlYjg2In0=','2020-02-14 08:36:05.337640');

/*Table structure for table `employee` */

DROP TABLE IF EXISTS `employee`;

CREATE TABLE `employee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_code` varchar(255) NOT NULL,
  `department` varchar(255) DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `employee_code` (`employee_code`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

/*Data for the table `employee` */

insert  into `employee`(`id`,`employee_code`,`department`,`score`,`date_created`) values 
(1,'E1','Engineering',100,'2020-01-31 14:15:00'),
(2,'E2','Engineering',90,'2020-01-31 14:15:00'),
(3,'E3','Engineering',89,'2020-01-31 14:15:00'),
(4,'E4','HR',85,'2020-01-31 14:15:00'),
(5,'E5','Engineering',10,'2020-01-31 14:15:00'),
(6,'E6','HR',90,'2020-01-31 14:15:00'),
(7,'E7','HR',90,'2020-01-31 14:15:00'),
(8,'E8','Engineering',50,'2020-01-31 14:15:00'),
(9,'E9','Waltzz',10,'2020-01-31 14:15:00'),
(10,'E10','Waltzz',3,'2020-01-31 14:15:00'),
(11,'E11','Opearations',5,'2020-01-31 14:15:00'),
(12,'E12','Waltzz',2,'2020-01-31 14:15:00'),
(13,'E13','Waltzz',29,'2020-01-31 14:15:00'),
(14,'E14','Engineering',30,'2020-01-31 14:15:00'),
(15,'E15','Opearations',70,'2020-01-31 14:15:00'),
(16,'E16','HR',15,'2020-01-31 14:15:00');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
