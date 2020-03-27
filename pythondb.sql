/*
Navicat MySQL Data Transfer

Source Server         : mysql_local
Source Server Version : 80016
Source Host           : localhost:3306
Source Database       : pythondb

Target Server Type    : MYSQL
Target Server Version : 80016
File Encoding         : 65001

Date: 2019-07-12 14:23:58
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES ('1', 'Can add log entry', '1', 'add_logentry');
INSERT INTO `auth_permission` VALUES ('2', 'Can change log entry', '1', 'change_logentry');
INSERT INTO `auth_permission` VALUES ('3', 'Can delete log entry', '1', 'delete_logentry');
INSERT INTO `auth_permission` VALUES ('4', 'Can view log entry', '1', 'view_logentry');
INSERT INTO `auth_permission` VALUES ('5', 'Can add permission', '2', 'add_permission');
INSERT INTO `auth_permission` VALUES ('6', 'Can change permission', '2', 'change_permission');
INSERT INTO `auth_permission` VALUES ('7', 'Can delete permission', '2', 'delete_permission');
INSERT INTO `auth_permission` VALUES ('8', 'Can view permission', '2', 'view_permission');
INSERT INTO `auth_permission` VALUES ('9', 'Can add group', '3', 'add_group');
INSERT INTO `auth_permission` VALUES ('10', 'Can change group', '3', 'change_group');
INSERT INTO `auth_permission` VALUES ('11', 'Can delete group', '3', 'delete_group');
INSERT INTO `auth_permission` VALUES ('12', 'Can view group', '3', 'view_group');
INSERT INTO `auth_permission` VALUES ('13', 'Can add user', '4', 'add_user');
INSERT INTO `auth_permission` VALUES ('14', 'Can change user', '4', 'change_user');
INSERT INTO `auth_permission` VALUES ('15', 'Can delete user', '4', 'delete_user');
INSERT INTO `auth_permission` VALUES ('16', 'Can view user', '4', 'view_user');
INSERT INTO `auth_permission` VALUES ('17', 'Can add content type', '5', 'add_contenttype');
INSERT INTO `auth_permission` VALUES ('18', 'Can change content type', '5', 'change_contenttype');
INSERT INTO `auth_permission` VALUES ('19', 'Can delete content type', '5', 'delete_contenttype');
INSERT INTO `auth_permission` VALUES ('20', 'Can view content type', '5', 'view_contenttype');
INSERT INTO `auth_permission` VALUES ('21', 'Can add session', '6', 'add_session');
INSERT INTO `auth_permission` VALUES ('22', 'Can change session', '6', 'change_session');
INSERT INTO `auth_permission` VALUES ('23', 'Can delete session', '6', 'delete_session');
INSERT INTO `auth_permission` VALUES ('24', 'Can view session', '6', 'view_session');
INSERT INTO `auth_permission` VALUES ('25', 'Can add jobinfo', '7', 'add_jobinfo');
INSERT INTO `auth_permission` VALUES ('26', 'Can change jobinfo', '7', 'change_jobinfo');
INSERT INTO `auth_permission` VALUES ('27', 'Can delete jobinfo', '7', 'delete_jobinfo');
INSERT INTO `auth_permission` VALUES ('28', 'Can view jobinfo', '7', 'view_jobinfo');
INSERT INTO `auth_permission` VALUES ('29', 'Can add user', '8', 'add_user');
INSERT INTO `auth_permission` VALUES ('30', 'Can change user', '8', 'change_user');
INSERT INTO `auth_permission` VALUES ('31', 'Can delete user', '8', 'delete_user');
INSERT INTO `auth_permission` VALUES ('32', 'Can view user', '8', 'view_user');

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of auth_user
-- ----------------------------
INSERT INTO `auth_user` VALUES ('1', 'pbkdf2_sha256$150000$2Godf7YfM0eo$0NqpaNOSl5zDcDr03w/YJziXLeCfHfuT20lCCtdj7WE=', '2019-07-06 10:20:23.093573', '1', 'root', '', '', '', '1', '1', '2019-07-04 06:20:51.357047');

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of auth_user_groups
-- ----------------------------

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of auth_user_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES ('1', 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES ('3', 'auth', 'group');
INSERT INTO `django_content_type` VALUES ('2', 'auth', 'permission');
INSERT INTO `django_content_type` VALUES ('4', 'auth', 'user');
INSERT INTO `django_content_type` VALUES ('5', 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES ('6', 'sessions', 'session');
INSERT INTO `django_content_type` VALUES ('7', 'userApp', 'jobinfo');
INSERT INTO `django_content_type` VALUES ('8', 'userApp', 'user');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES ('1', 'contenttypes', '0001_initial', '2019-07-04 03:40:34.188137');
INSERT INTO `django_migrations` VALUES ('2', 'auth', '0001_initial', '2019-07-04 03:40:34.509102');
INSERT INTO `django_migrations` VALUES ('3', 'admin', '0001_initial', '2019-07-04 03:40:35.505102');
INSERT INTO `django_migrations` VALUES ('4', 'admin', '0002_logentry_remove_auto_add', '2019-07-04 03:40:35.733102');
INSERT INTO `django_migrations` VALUES ('5', 'admin', '0003_logentry_add_action_flag_choices', '2019-07-04 03:40:35.747105');
INSERT INTO `django_migrations` VALUES ('6', 'contenttypes', '0002_remove_content_type_name', '2019-07-04 03:40:36.030102');
INSERT INTO `django_migrations` VALUES ('7', 'auth', '0002_alter_permission_name_max_length', '2019-07-04 03:40:36.129102');
INSERT INTO `django_migrations` VALUES ('8', 'auth', '0003_alter_user_email_max_length', '2019-07-04 03:40:36.175101');
INSERT INTO `django_migrations` VALUES ('9', 'auth', '0004_alter_user_username_opts', '2019-07-04 03:40:36.187103');
INSERT INTO `django_migrations` VALUES ('10', 'auth', '0005_alter_user_last_login_null', '2019-07-04 03:40:36.290102');
INSERT INTO `django_migrations` VALUES ('11', 'auth', '0006_require_contenttypes_0002', '2019-07-04 03:40:36.296101');
INSERT INTO `django_migrations` VALUES ('12', 'auth', '0007_alter_validators_add_error_messages', '2019-07-04 03:40:36.309103');
INSERT INTO `django_migrations` VALUES ('13', 'auth', '0008_alter_user_username_max_length', '2019-07-04 03:40:36.429102');
INSERT INTO `django_migrations` VALUES ('14', 'auth', '0009_alter_user_last_name_max_length', '2019-07-04 03:40:36.550102');
INSERT INTO `django_migrations` VALUES ('15', 'auth', '0010_alter_group_name_max_length', '2019-07-04 03:40:36.583140');
INSERT INTO `django_migrations` VALUES ('16', 'auth', '0011_update_proxy_permissions', '2019-07-04 03:40:36.598107');
INSERT INTO `django_migrations` VALUES ('17', 'sessions', '0001_initial', '2019-07-04 03:40:36.652121');
INSERT INTO `django_migrations` VALUES ('18', 'userApp', '0001_initial', '2019-07-04 03:40:36.693102');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('0keou2l99yhsa0u71bb2gy2ru6arw1o9', 'MmY1YWJjMDk2NTRjMGM3ZmRhNjFhNTVlZTNmN2UxNGI1ZjdkOGJkMDp7InVzZXJuYW1lIjoidXNlcjEiLCJwYXNzd29yZCI6IjExMTEiLCJfc2Vzc2lvbl9leHBpcnkiOjE4MDB9', '2019-07-10 14:52:41.492378');
INSERT INTO `django_session` VALUES ('3966txo4c8t8idpigwb5xh57u6booo4v', 'MmY1YWJjMDk2NTRjMGM3ZmRhNjFhNTVlZTNmN2UxNGI1ZjdkOGJkMDp7InVzZXJuYW1lIjoidXNlcjEiLCJwYXNzd29yZCI6IjExMTEiLCJfc2Vzc2lvbl9leHBpcnkiOjE4MDB9', '2019-07-10 07:15:35.621059');
INSERT INTO `django_session` VALUES ('49tn7zgsklks5v949ftnwx3ytecl8las', 'MmY1YWJjMDk2NTRjMGM3ZmRhNjFhNTVlZTNmN2UxNGI1ZjdkOGJkMDp7InVzZXJuYW1lIjoidXNlcjEiLCJwYXNzd29yZCI6IjExMTEiLCJfc2Vzc2lvbl9leHBpcnkiOjE4MDB9', '2019-07-10 11:54:26.244234');
INSERT INTO `django_session` VALUES ('6cz0kzink45uperzexxlhfpe5tficbfc', 'MmY1YWJjMDk2NTRjMGM3ZmRhNjFhNTVlZTNmN2UxNGI1ZjdkOGJkMDp7InVzZXJuYW1lIjoidXNlcjEiLCJwYXNzd29yZCI6IjExMTEiLCJfc2Vzc2lvbl9leHBpcnkiOjE4MDB9', '2019-07-10 03:03:35.803148');
INSERT INTO `django_session` VALUES ('6hvhd5326cj61a3ywbnwey6idbm1vds3', 'ZDgzYzlhODJjY2QwMTM0YzhmOGNjZDEyMjRhMzIwZDIzMGU0MTRjNTp7InVzZXIiOiJ1c2VyMSIsIl9zZXNzaW9uX2V4cGlyeSI6MTgwMCwidXNlcm5hbWUiOiJ1c2VyMSIsInBhc3N3b3JkIjoiMTExMSJ9', '2019-07-08 15:06:23.814758');
INSERT INTO `django_session` VALUES ('703pbkdrqvxjmxrlqjen17hv5y6sy5xz', 'NjllYjhiMjc4MDE1YjgzMjhhMDdlYmUwNjNmMDRmYWI4NjBiNzViZDp7InVzZXIiOiJ1c2VyNSIsIl9zZXNzaW9uX2V4cGlyeSI6MTgwMH0=', '2019-07-08 06:20:21.584230');
INSERT INTO `django_session` VALUES ('8srdumg4ztpt3lnh8jk6st914urw4oq4', 'MmY1YWJjMDk2NTRjMGM3ZmRhNjFhNTVlZTNmN2UxNGI1ZjdkOGJkMDp7InVzZXJuYW1lIjoidXNlcjEiLCJwYXNzd29yZCI6IjExMTEiLCJfc2Vzc2lvbl9leHBpcnkiOjE4MDB9', '2019-07-10 15:38:17.759229');
INSERT INTO `django_session` VALUES ('8u9h049huwdabqfjgj2d0yo4j33ilip5', 'MmY1YWJjMDk2NTRjMGM3ZmRhNjFhNTVlZTNmN2UxNGI1ZjdkOGJkMDp7InVzZXJuYW1lIjoidXNlcjEiLCJwYXNzd29yZCI6IjExMTEiLCJfc2Vzc2lvbl9leHBpcnkiOjE4MDB9', '2019-07-10 13:34:36.711542');
INSERT INTO `django_session` VALUES ('9kw3hf6tq0k7c8gic7t5gnl4xzbv098a', 'MmY1YWJjMDk2NTRjMGM3ZmRhNjFhNTVlZTNmN2UxNGI1ZjdkOGJkMDp7InVzZXJuYW1lIjoidXNlcjEiLCJwYXNzd29yZCI6IjExMTEiLCJfc2Vzc2lvbl9leHBpcnkiOjE4MDB9', '2019-07-10 15:32:22.648710');
INSERT INTO `django_session` VALUES ('9ti73fx2htrvkx8dmqhva5jc2mcf68o9', 'MmY1YWJjMDk2NTRjMGM3ZmRhNjFhNTVlZTNmN2UxNGI1ZjdkOGJkMDp7InVzZXJuYW1lIjoidXNlcjEiLCJwYXNzd29yZCI6IjExMTEiLCJfc2Vzc2lvbl9leHBpcnkiOjE4MDB9', '2019-07-11 01:59:41.246990');
INSERT INTO `django_session` VALUES ('9wocuwrp2gdcy48v5vvibtdd53f1tfj9', 'MmY1YWJjMDk2NTRjMGM3ZmRhNjFhNTVlZTNmN2UxNGI1ZjdkOGJkMDp7InVzZXJuYW1lIjoidXNlcjEiLCJwYXNzd29yZCI6IjExMTEiLCJfc2Vzc2lvbl9leHBpcnkiOjE4MDB9', '2019-07-10 03:35:19.787204');
INSERT INTO `django_session` VALUES ('abmntxus5p4t3b5upwkqk5i1g20e0uhw', 'MmY1YWJjMDk2NTRjMGM3ZmRhNjFhNTVlZTNmN2UxNGI1ZjdkOGJkMDp7InVzZXJuYW1lIjoidXNlcjEiLCJwYXNzd29yZCI6IjExMTEiLCJfc2Vzc2lvbl9leHBpcnkiOjE4MDB9', '2019-07-10 04:13:22.179953');
INSERT INTO `django_session` VALUES ('avvm7rky8b5xcd39cvz8gce87ng2oweq', 'MmY1YWJjMDk2NTRjMGM3ZmRhNjFhNTVlZTNmN2UxNGI1ZjdkOGJkMDp7InVzZXJuYW1lIjoidXNlcjEiLCJwYXNzd29yZCI6IjExMTEiLCJfc2Vzc2lvbl9leHBpcnkiOjE4MDB9', '2019-07-10 02:23:48.397906');
INSERT INTO `django_session` VALUES ('c09gu4qe5rd3ic6c9jcax5a9rt59lhr2', 'MmY1YWJjMDk2NTRjMGM3ZmRhNjFhNTVlZTNmN2UxNGI1ZjdkOGJkMDp7InVzZXJuYW1lIjoidXNlcjEiLCJwYXNzd29yZCI6IjExMTEiLCJfc2Vzc2lvbl9leHBpcnkiOjE4MDB9', '2019-07-11 04:23:26.940315');
INSERT INTO `django_session` VALUES ('cvxg0s9t37rfn16va439snmkqv7nqd7g', 'Y2ZmZGQ4OGM3ZDgzMTBmZTViYzBlMTg1NjgyMDQ4NWY4YmQxYTEzNjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0YWUxZmE3NTA3YjgyZmY1YmE5MDM2OWM0YmNjOWRiNDIxMWM3ZTliIiwidXNlciI6InVzZXIxIiwiX3Nlc3Npb25fZXhwaXJ5IjoxODAwfQ==', '2019-07-06 11:10:34.967328');
INSERT INTO `django_session` VALUES ('d41m35t1eksa29x5mmje9cxlem8ahgwd', 'MmY1YWJjMDk2NTRjMGM3ZmRhNjFhNTVlZTNmN2UxNGI1ZjdkOGJkMDp7InVzZXJuYW1lIjoidXNlcjEiLCJwYXNzd29yZCI6IjExMTEiLCJfc2Vzc2lvbl9leHBpcnkiOjE4MDB9', '2019-07-10 01:53:01.532055');
INSERT INTO `django_session` VALUES ('d8f7xsk4qogu9gsf63tcm3mv64d48zlm', 'MmY1YWJjMDk2NTRjMGM3ZmRhNjFhNTVlZTNmN2UxNGI1ZjdkOGJkMDp7InVzZXJuYW1lIjoidXNlcjEiLCJwYXNzd29yZCI6IjExMTEiLCJfc2Vzc2lvbl9leHBpcnkiOjE4MDB9', '2019-07-09 12:52:48.581244');
INSERT INTO `django_session` VALUES ('doiguychcvj3y8qas8m8ndkoztj4i4s8', 'MmY1YWJjMDk2NTRjMGM3ZmRhNjFhNTVlZTNmN2UxNGI1ZjdkOGJkMDp7InVzZXJuYW1lIjoidXNlcjEiLCJwYXNzd29yZCI6IjExMTEiLCJfc2Vzc2lvbl9leHBpcnkiOjE4MDB9', '2019-07-10 06:43:17.740138');
INSERT INTO `django_session` VALUES ('f8xza284yli82g8ox0u7uv73wcefvmcv', 'MjM1MjY3YTBmZGIxYzIxZTMzMWZmMjQ3ZmE0MTVhNGViNWQyN2Y2NTp7InVzZXIiOiJbXSIsIl9zZXNzaW9uX2V4cGlyeSI6MTgwMH0=', '2019-07-05 07:20:07.657614');
INSERT INTO `django_session` VALUES ('hmnxida0gpvzv0m9ziavlag001rhbjy1', 'MmY1YWJjMDk2NTRjMGM3ZmRhNjFhNTVlZTNmN2UxNGI1ZjdkOGJkMDp7InVzZXJuYW1lIjoidXNlcjEiLCJwYXNzd29yZCI6IjExMTEiLCJfc2Vzc2lvbl9leHBpcnkiOjE4MDB9', '2019-07-10 09:18:46.914395');
INSERT INTO `django_session` VALUES ('jwwihmxsiizuca43i0ljh0ll2niu97c2', 'MmY1YWJjMDk2NTRjMGM3ZmRhNjFhNTVlZTNmN2UxNGI1ZjdkOGJkMDp7InVzZXJuYW1lIjoidXNlcjEiLCJwYXNzd29yZCI6IjExMTEiLCJfc2Vzc2lvbl9leHBpcnkiOjE4MDB9', '2019-07-09 09:39:16.379212');
INSERT INTO `django_session` VALUES ('knc1epawl6e12neb4wilmaii7qk66so3', 'NjlhY2ZiOGJlZTNmNGUxNTYzZWY0NDI4NWNiNjkwZjYyNDdlNWNkYzp7InVzZXIiOiJ1c2VyMSIsIl9zZXNzaW9uX2V4cGlyeSI6MTgwMH0=', '2019-07-08 08:40:05.964271');
INSERT INTO `django_session` VALUES ('ktdt2qfrnyyywwcijghh7u6mtzpgef5i', 'MmY1YWJjMDk2NTRjMGM3ZmRhNjFhNTVlZTNmN2UxNGI1ZjdkOGJkMDp7InVzZXJuYW1lIjoidXNlcjEiLCJwYXNzd29yZCI6IjExMTEiLCJfc2Vzc2lvbl9leHBpcnkiOjE4MDB9', '2019-07-10 05:55:24.609206');
INSERT INTO `django_session` VALUES ('lx4oot1p80hldy3m1196z6npet32zphw', 'NjlhY2ZiOGJlZTNmNGUxNTYzZWY0NDI4NWNiNjkwZjYyNDdlNWNkYzp7InVzZXIiOiJ1c2VyMSIsIl9zZXNzaW9uX2V4cGlyeSI6MTgwMH0=', '2019-07-07 14:19:27.189532');
INSERT INTO `django_session` VALUES ('munsrukeq2foi55chsuj5bonscmhz146', 'MmY1YWJjMDk2NTRjMGM3ZmRhNjFhNTVlZTNmN2UxNGI1ZjdkOGJkMDp7InVzZXJuYW1lIjoidXNlcjEiLCJwYXNzd29yZCI6IjExMTEiLCJfc2Vzc2lvbl9leHBpcnkiOjE4MDB9', '2019-07-11 06:20:00.154004');
INSERT INTO `django_session` VALUES ('mwkefxj4qnyqjufgystirmyywgyf6cl1', 'MmY1YWJjMDk2NTRjMGM3ZmRhNjFhNTVlZTNmN2UxNGI1ZjdkOGJkMDp7InVzZXJuYW1lIjoidXNlcjEiLCJwYXNzd29yZCI6IjExMTEiLCJfc2Vzc2lvbl9leHBpcnkiOjE4MDB9', '2019-07-09 09:06:24.926296');
INSERT INTO `django_session` VALUES ('ndcrh0gwk22asbgppxi4d52mr02po9c7', 'MmY1YWJjMDk2NTRjMGM3ZmRhNjFhNTVlZTNmN2UxNGI1ZjdkOGJkMDp7InVzZXJuYW1lIjoidXNlcjEiLCJwYXNzd29yZCI6IjExMTEiLCJfc2Vzc2lvbl9leHBpcnkiOjE4MDB9', '2019-07-09 07:55:38.246423');
INSERT INTO `django_session` VALUES ('neiaylomrb1d6orhldlcyh3iq8rh92pn', 'MmY1YWJjMDk2NTRjMGM3ZmRhNjFhNTVlZTNmN2UxNGI1ZjdkOGJkMDp7InVzZXJuYW1lIjoidXNlcjEiLCJwYXNzd29yZCI6IjExMTEiLCJfc2Vzc2lvbl9leHBpcnkiOjE4MDB9', '2019-07-10 01:22:36.176351');
INSERT INTO `django_session` VALUES ('o1wyz1aw7xc276ces503ke9qc0j47woc', 'MmY1YWJjMDk2NTRjMGM3ZmRhNjFhNTVlZTNmN2UxNGI1ZjdkOGJkMDp7InVzZXJuYW1lIjoidXNlcjEiLCJwYXNzd29yZCI6IjExMTEiLCJfc2Vzc2lvbl9leHBpcnkiOjE4MDB9', '2019-07-10 14:59:11.585620');
INSERT INTO `django_session` VALUES ('o6zb7pyjvzdlqq0h3noh2ma2gbr2prwz', 'MmY1YWJjMDk2NTRjMGM3ZmRhNjFhNTVlZTNmN2UxNGI1ZjdkOGJkMDp7InVzZXJuYW1lIjoidXNlcjEiLCJwYXNzd29yZCI6IjExMTEiLCJfc2Vzc2lvbl9leHBpcnkiOjE4MDB9', '2019-07-09 06:11:00.946725');
INSERT INTO `django_session` VALUES ('otsov3gdk21b9pazrctw4he88hsh0k7j', 'MmY1YWJjMDk2NTRjMGM3ZmRhNjFhNTVlZTNmN2UxNGI1ZjdkOGJkMDp7InVzZXJuYW1lIjoidXNlcjEiLCJwYXNzd29yZCI6IjExMTEiLCJfc2Vzc2lvbl9leHBpcnkiOjE4MDB9', '2019-07-09 12:21:57.970910');
INSERT INTO `django_session` VALUES ('p85jl2rv588462gyfkuhd1pkixazogk2', 'NjlhY2ZiOGJlZTNmNGUxNTYzZWY0NDI4NWNiNjkwZjYyNDdlNWNkYzp7InVzZXIiOiJ1c2VyMSIsIl9zZXNzaW9uX2V4cGlyeSI6MTgwMH0=', '2019-07-08 07:39:14.043951');
INSERT INTO `django_session` VALUES ('pcnczbniwk27wjjo7l24wr64gjkadl1q', 'NjlhY2ZiOGJlZTNmNGUxNTYzZWY0NDI4NWNiNjkwZjYyNDdlNWNkYzp7InVzZXIiOiJ1c2VyMSIsIl9zZXNzaW9uX2V4cGlyeSI6MTgwMH0=', '2019-07-08 02:31:06.241888');
INSERT INTO `django_session` VALUES ('sdha1vidpdhfmxx29ot7fu6n7df43f7a', 'MmY1YWJjMDk2NTRjMGM3ZmRhNjFhNTVlZTNmN2UxNGI1ZjdkOGJkMDp7InVzZXJuYW1lIjoidXNlcjEiLCJwYXNzd29yZCI6IjExMTEiLCJfc2Vzc2lvbl9leHBpcnkiOjE4MDB9', '2019-07-10 11:09:49.285632');
INSERT INTO `django_session` VALUES ('tgi9j0ufw8qu78kxro4xphwzploy60ap', 'MmY1YWJjMDk2NTRjMGM3ZmRhNjFhNTVlZTNmN2UxNGI1ZjdkOGJkMDp7InVzZXJuYW1lIjoidXNlcjEiLCJwYXNzd29yZCI6IjExMTEiLCJfc2Vzc2lvbl9leHBpcnkiOjE4MDB9', '2019-07-09 03:40:41.204556');
INSERT INTO `django_session` VALUES ('u8fcmcwauhow13n7ark7cesfczsvf4rj', 'MmY1YWJjMDk2NTRjMGM3ZmRhNjFhNTVlZTNmN2UxNGI1ZjdkOGJkMDp7InVzZXJuYW1lIjoidXNlcjEiLCJwYXNzd29yZCI6IjExMTEiLCJfc2Vzc2lvbl9leHBpcnkiOjE4MDB9', '2019-07-09 14:38:38.230241');
INSERT INTO `django_session` VALUES ('vo4u9p3alxjt77w954w23ufq1m2spcib', 'MmY1YWJjMDk2NTRjMGM3ZmRhNjFhNTVlZTNmN2UxNGI1ZjdkOGJkMDp7InVzZXJuYW1lIjoidXNlcjEiLCJwYXNzd29yZCI6IjExMTEiLCJfc2Vzc2lvbl9leHBpcnkiOjE4MDB9', '2019-07-09 13:35:53.351316');
INSERT INTO `django_session` VALUES ('wfdz8m88z7m9sq1ulbpn9zqx1k2xmb44', 'MmY1YWJjMDk2NTRjMGM3ZmRhNjFhNTVlZTNmN2UxNGI1ZjdkOGJkMDp7InVzZXJuYW1lIjoidXNlcjEiLCJwYXNzd29yZCI6IjExMTEiLCJfc2Vzc2lvbl9leHBpcnkiOjE4MDB9', '2019-07-11 02:34:17.936766');
INSERT INTO `django_session` VALUES ('wzfk8yeijm9u64a2dz650p7jfvxqbs88', 'MmY1YWJjMDk2NTRjMGM3ZmRhNjFhNTVlZTNmN2UxNGI1ZjdkOGJkMDp7InVzZXJuYW1lIjoidXNlcjEiLCJwYXNzd29yZCI6IjExMTEiLCJfc2Vzc2lvbl9leHBpcnkiOjE4MDB9', '2019-07-09 14:08:22.843619');
INSERT INTO `django_session` VALUES ('x0olp8rshsi4vul5l13gazhthyfkhlti', 'MmY1YWJjMDk2NTRjMGM3ZmRhNjFhNTVlZTNmN2UxNGI1ZjdkOGJkMDp7InVzZXJuYW1lIjoidXNlcjEiLCJwYXNzd29yZCI6IjExMTEiLCJfc2Vzc2lvbl9leHBpcnkiOjE4MDB9', '2019-07-09 15:18:41.481850');
INSERT INTO `django_session` VALUES ('x1e09nh37anesy5qi93jfsw1of6b42uo', 'MWZkMDdjYzk4ZGE1NjMzYjZjN2U3OTgzMDU5ZmYzNDlhYzM4YWQzYjp7InVzZXJuYW1lIjoidXNlcjciLCJwYXNzd29yZCI6Ijc3NzciLCJfc2Vzc2lvbl9leHBpcnkiOjE4MDB9', '2019-07-09 02:51:47.309599');
INSERT INTO `django_session` VALUES ('yhyy9q4jl4p2n2tag1lkjezflebp8roc', 'MmIwZjBhYWIyMjY4ZTA2NThjY2Y3YTQ5OWNmMGNjOGI2ZThmNzk2MzqABJUAAQAAAAAAAH2UKIwEdXNlcpSMFWRqYW5nby5kYi5tb2RlbHMuYmFzZZSMDm1vZGVsX3VucGlja2xllJOUjAd1c2VyQXBwlIwEVXNlcpSGlIWUUpR9lCiMBl9zdGF0ZZRoAowKTW9kZWxTdGF0ZZSTlCmBlH2UKIwGYWRkaW5nlImMAmRilIwHZGVmYXVsdJR1YowGdXNlcmlklEsBjAh1c2VybmFtZZSMBXVzZXIxlIwIcGFzc3dvcmSUjAQxMTExlIwJdGVsZXBob25llIwEMTExMZSMD19kamFuZ29fdmVyc2lvbpSMBTIuMi4zlHVijA9fc2Vzc2lvbl9leHBpcnmUTQgHdS4=', '2019-07-04 06:28:41.741631');
INSERT INTO `django_session` VALUES ('ytv622h5840ubcd9g3a6hhtw2yheneqy', 'MmY1YWJjMDk2NTRjMGM3ZmRhNjFhNTVlZTNmN2UxNGI1ZjdkOGJkMDp7InVzZXJuYW1lIjoidXNlcjEiLCJwYXNzd29yZCI6IjExMTEiLCJfc2Vzc2lvbl9leHBpcnkiOjE4MDB9', '2019-07-11 03:18:48.109002');
INSERT INTO `django_session` VALUES ('yumltz6mx2hec6rp1vyv9ogbqh4tu0nj', 'MmY1YWJjMDk2NTRjMGM3ZmRhNjFhNTVlZTNmN2UxNGI1ZjdkOGJkMDp7InVzZXJuYW1lIjoidXNlcjEiLCJwYXNzd29yZCI6IjExMTEiLCJfc2Vzc2lvbl9leHBpcnkiOjE4MDB9', '2019-07-10 07:55:28.527061');

-- ----------------------------
-- Table structure for jobinfo
-- ----------------------------
DROP TABLE IF EXISTS `jobinfo`;
CREATE TABLE `jobinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `jobname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `jobtype` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `pubtime` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `neednum` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `cptype` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=153 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of jobinfo
-- ----------------------------
INSERT INTO `jobinfo` VALUES ('1', '人工智能研发实习生', null, '2019-07-09', '10', '大连', '中联高科(大连)实业有限公司', '计算机软件 计算机软件 IT服务(系统/数据/维护) 互联网/电子商务', null);
INSERT INTO `jobinfo` VALUES ('2', '大数据及人工智能安全研究', null, '2019-07-09', '1', '北京', '中国电子技术标准化研究院', '学术/科研 电子技术/半导体/集成电路 其他', null);
INSERT INTO `jobinfo` VALUES ('3', '人工智能产品销售工程师/客户经理/渠道分销', null, '2019-07-11', '5', '合肥', '合肥视尔信息科技有限公司', '计算机软件 电子技术/半导体/集成电路 IT服务(系统/数据/维护) 其他', null);
INSERT INTO `jobinfo` VALUES ('4', 'Java/大数据/人工智能开发实习生', null, '2019-07-04', '5', '天津', '天津云建科技有限公司', '计算机软件 IT服务(系统/数据/维护)', null);
INSERT INTO `jobinfo` VALUES ('5', '人工智能工程师-应届毕业生', null, '2019-07-05', '7', '西安', '西安中软卓越信息技术有限公司', '计算机软件 电子技术/半导体/集成电路 IT服务(系统/数据/维护) 互联网/电子商务', null);
INSERT INTO `jobinfo` VALUES ('6', '【校招岗位】人工智能及大数据研发工程师', null, '2019-07-04', '10', '广州', '广州多益网络股份有限公司', '网络游戏 互联网/电子商务 IT服务(系统/数据/维护) 计算机软件', null);
INSERT INTO `jobinfo` VALUES ('7', '人工智能开发实训生', null, '2019-07-07', '5', '绵阳', '四川展谊网络科技有限公司', 'IT服务(系统/数据/维护) 互联网/电子商务 计算机软件 教育/培训/院校', null);
INSERT INTO `jobinfo` VALUES ('8', 'Java+人工智能开发实习生（Python）', null, '2019-07-08', '3', '厦门', '厦门市花泽信息技术有限公司', '互联网/电子商务 外包服务', null);
INSERT INTO `jobinfo` VALUES ('9', '应届生 - 销售工程师（人工智能）', null, '2019-07-11', '10', '东莞', '广东奥普特科技股份有限公司', '电子技术/半导体/集成电路 仪器仪表及工业自动化 计算机软件 计算机硬件', null);
INSERT INTO `jobinfo` VALUES ('10', '大数据、人工智能（知识图谱）产品研发  兼职实习', null, '2019-07-05', '3', '大连', '大连智桥科技有限公司', '计算机软件 IT服务(系统/数据/维护) 互联网/电子商务', null);
INSERT INTO `jobinfo` VALUES ('11', '人工智能/机器人研发实习生', null, '2019-07-04', '5', '沈阳', '沈阳东软软件人才培训中心', '计算机软件 IT服务(系统/数据/维护) 互联网/电子商务', null);
INSERT INTO `jobinfo` VALUES ('12', '阳光保险集团-管培生（数据分析、人工智能、算法方向）', null, '2019-07-11', '10', '北京', '阳光保险集团股份有限公司', '基金/证券/期货/投资', null);
INSERT INTO `jobinfo` VALUES ('13', '人工智能算法工程师（应届生）', null, '2019-07-08', '3', '厦门', '厦门福信光电集成有限公司', '仪器仪表及工业自动化 电子技术/半导体/集成电路 计算机软件 大型设备/机电设备/重工业', null);
INSERT INTO `jobinfo` VALUES ('14', '人工智能', null, '2019-06-05', '4', '武汉', '中船重工', '大型设备/机电设备/重工业', null);
INSERT INTO `jobinfo` VALUES ('15', '人工智能开发工程师', null, '2019-05-08', '99', '全国', '陕西退役军人', '政府/公共事业/非盈利机构', null);
INSERT INTO `jobinfo` VALUES ('16', '人工智能专家(J19835)', null, '2019-05-08', '99', '贵阳', '陕西退役军人', '政府/公共事业/非盈利机构', null);
INSERT INTO `jobinfo` VALUES ('17', '人工智能工程师', null, '2019-05-16', '99', '扬州', '沈阳所扬州院', '航空/航天研究与制造', null);
INSERT INTO `jobinfo` VALUES ('18', '空间人工智能开发与应用（XJS002）', null, '2019-06-10', '99', '上海', '上海临港地区', '其他', null);
INSERT INTO `jobinfo` VALUES ('19', '机器视觉与人工智能', null, '2019-02-11', '1', '成都', '中国东方电气集团', '大型设备/机电设备/重工业', null);
INSERT INTO `jobinfo` VALUES ('20', '机器视觉与人工智能研发工程师', null, '2019-02-11', '99', '成都', '中国东方电气集团', '大型设备/机电设备/重工业', null);
INSERT INTO `jobinfo` VALUES ('21', '人工智能/机器学习工程师', null, '2019-01-22', '99', '武汉', '中船重工', '大型设备/机电设备/重工业', null);
INSERT INTO `jobinfo` VALUES ('22', '人工智能图像处理', null, '2019-02-11', '1', '天津', '航天恒星科技', '计算机软件 电子技术/半导体/集成电路 通信/电信/网络设备 航空/航天研究与制造', null);
INSERT INTO `jobinfo` VALUES ('23', '虚拟视觉/人工智能方向博士后', null, '2019-03-28', '2', '北京', '北京电子控股', '互联网/电子商务', null);
INSERT INTO `jobinfo` VALUES ('24', '人工智能工程师（视频分析算法研发）', null, '2019-02-25', '99', '北京', '中国移动', '通信/电信/网络设备', null);
INSERT INTO `jobinfo` VALUES ('25', '人工智能训练师-广东分公司-广州', null, '2019-03-24', '1', '广州', '中国移动', '通信/电信运营、增值服务', null);
INSERT INTO `jobinfo` VALUES ('26', '人工智能工程师', null, '2019-03-25', '99', '北京', '智联招聘', '互联网/电子商务', null);
INSERT INTO `jobinfo` VALUES ('27', '人工智能语音服务-广东分公司-广州', null, '2019-03-24', '1', '广州', '中国移动', '通信/电信运营、增值服务', null);
INSERT INTO `jobinfo` VALUES ('28', '人工智能运营管理-广东分公司-广州', null, '2019-03-24', '1', '广州', '中国移动', '通信/电信运营、增值服务', null);
INSERT INTO `jobinfo` VALUES ('29', '人工智能-浙江分公司-杭州', null, '2019-02-11', '2', '杭州', '中国移动', '通信/电信运营、增值服务', null);
INSERT INTO `jobinfo` VALUES ('30', '人工智能运营优化-广西分公司-南宁', null, '2019-02-11', '1', '南宁', '中国移动', '通信/电信运营、增值服务', null);
INSERT INTO `jobinfo` VALUES ('31', '人工智能软件工程师', null, '2018-10-09', '2', '苏州', '苏州科技城', '政府/公共事业/非盈利机构', null);
INSERT INTO `jobinfo` VALUES ('32', '车联网通信技术研发部 --人工智能处理器一体化硬件设计开发', null, '2018-08-22', '2', '无锡', '交科所', '政府/公共事业/非盈利机构 学术/科研', null);
INSERT INTO `jobinfo` VALUES ('33', '人工智能研发工程师', null, '2018-11-23', '3', '无锡', '无锡江南计算技术', '计算机软件 电子技术/半导体/集成电路 计算机硬件 航空/航天研究与制造', null);
INSERT INTO `jobinfo` VALUES ('34', '人工智能/数据分析', null, '2018-09-29', '99', '上海', '中移（上海）信息', '通信/电信/网络设备', null);
INSERT INTO `jobinfo` VALUES ('35', '人工智能工程师', null, '2018-08-24', '99', '上海', '中国电科三十二所', '政府/公共事业/非盈利机构 计算机软件 IT服务(系统/数据/维护)', null);
INSERT INTO `jobinfo` VALUES ('36', '自动驾驶深度学习算法工程师（人工智能）', null, '2018-11-02', '1', '北京', '国汽智联', '汽车/摩托车', null);
INSERT INTO `jobinfo` VALUES ('37', '智能信号处理/人工智能', null, '2018-09-04', '1', '无锡', '航空工业雷达所', '电子技术/半导体/集成电路 学术/科研', null);
INSERT INTO `jobinfo` VALUES ('38', '智能制造工程师（应届生）', null, '2019-07-04', '2', '上海', '上海交慧通达智能科技有限公司', '房地产/建筑/建材/工程 物业管理/商业中心 大型设备/机电设备/重工业', null);
INSERT INTO `jobinfo` VALUES ('39', '智能机器人', null, '2019-07-04', '5', '常州', '常州市凯迪电器股份有限公司', '电子技术/半导体/集成电路 电子技术/半导体/集成电路 贸易/进出口', null);
INSERT INTO `jobinfo` VALUES ('40', '智能制造工艺师', null, '2019-02-12', '99', '徐州', '徐工集团', '大型设备/机电设备/重工业', null);
INSERT INTO `jobinfo` VALUES ('41', '数据分析(智能导航/智能应答方向)山东分公司-济南', null, '2019-02-11', '99', '济南', '中国移动', '通信/电信运营、增值服务', null);
INSERT INTO `jobinfo` VALUES ('42', '数据/智能分析设计师', null, '2019-04-08', '99', '北京', '中船重工', '大型设备/机电设备/重工业', null);
INSERT INTO `jobinfo` VALUES ('43', '智能制造研究', null, '2018-08-07', '99', '南京', '中电55所', '电子技术/半导体/集成电路', null);
INSERT INTO `jobinfo` VALUES ('44', '实习生应届生', null, '2019-07-04', '6', '青岛', '新明天人工智能科技有限公司', '学术/科研', null);
INSERT INTO `jobinfo` VALUES ('45', '高校实习生', null, '2019-07-04', '8', '青岛', '新明天人工智能科技有限公司', '学术/科研', null);
INSERT INTO `jobinfo` VALUES ('46', '程序员校园兼职', null, '2019-07-04', '5', '南京', '南京链宇智能科技有限公司', '计算机软件 计算机软件 互联网/电子商务 学术/科研', null);
INSERT INTO `jobinfo` VALUES ('47', '行政专员', null, '2019-07-04', '2', '杭州', '楼巴顿智能科技(杭州)有限公司', '电子技术/半导体/集成电路', null);
INSERT INTO `jobinfo` VALUES ('48', '硬件工程师', null, '2019-07-04', '10', '福州', '福州聚英智能科技有限公司', '电子技术/半导体/集成电路 计算机软件 计算机硬件 IT服务(系统/数据/维护)', null);
INSERT INTO `jobinfo` VALUES ('49', '管理实习生', null, '2019-07-05', '6', '福州', '福州台江区爱比利智能科技有限公司', '耐用消费品（服饰/纺织/皮革/家具/家电） 贸易/进出口 零售/批发 礼品/玩具/工艺美术/收藏品/奢侈品', null);
INSERT INTO `jobinfo` VALUES ('50', '机器视觉工程师（优秀应届）', null, '2019-07-03', '1', '北京', '国机智能技术研究院有限公司', '计算机硬件 计算机软件 仪器仪表及工业自动化 IT服务(系统/数据/维护)', null);
INSERT INTO `jobinfo` VALUES ('51', '视觉应用设计与实现', null, '2019-07-03', '3', '北京', '国机智能技术研究院有限公司', '计算机硬件 计算机软件 仪器仪表及工业自动化 IT服务(系统/数据/维护)', null);
INSERT INTO `jobinfo` VALUES ('52', '校园招生代理', null, '2019-07-04', '6', '广州', '开能教育', '教育/培训/院校 专业服务/咨询(财会/法律/人力资源等) 学术/科研 互联网/电子商务', null);
INSERT INTO `jobinfo` VALUES ('53', '校园招生代理', null, '2019-07-04', '6', '重庆', '开能教育', '教育/培训/院校 专业服务/咨询(财会/法律/人力资源等) 学术/科研 互联网/电子商务', null);
INSERT INTO `jobinfo` VALUES ('54', '前端算法工程师（实习）', null, '2019-07-04', '3', '北京', '北京快鱼电子股份公司', '电子技术/半导体/集成电路 计算机软件 通信/电信/网络设备 计算机硬件', null);
INSERT INTO `jobinfo` VALUES ('55', '市场管培生', null, '2019-07-09', '5', '上海', '上海高顿企业管理咨询有限公司', '教育/培训/院校 专业服务/咨询(财会/法律/人力资源等) 基金/证券/期货/投资', null);
INSERT INTO `jobinfo` VALUES ('56', '少儿在线编程老师', null, '2019-07-04', '15', '北京', '北京玖零时代影视传媒有限公司', '教育/培训/院校 医疗设备/器械 贸易/进出口 酒店/餐饮', null);
INSERT INTO `jobinfo` VALUES ('57', '咨询师', null, '2019-07-04', '5', '武汉', '武汉金铅笔文化发展有限公司', '教育/培训/院校 其他', null);
INSERT INTO `jobinfo` VALUES ('58', '云计算开发 工程师 （AI云平台）', null, '2019-07-04', '2', '济南', '浪潮集团有限公司', 'IT服务(系统/数据/维护) 计算机软件 计算机硬件', null);
INSERT INTO `jobinfo` VALUES ('59', '证券实习生/周末，法定节假日休息/晋升空间明确', null, '2019-07-09', '10', '天津', '黑龙江省容维证券数据程序化有限公司天津分公司', '基金/证券/期货/投资', null);
INSERT INTO `jobinfo` VALUES ('60', 'AI及大数据工程师（2019校园招聘）', null, '2019-07-04', '10', '上海', '游族网络', '互联网/电子商务 网络游戏', null);
INSERT INTO `jobinfo` VALUES ('61', '业务设计师', null, '2019-07-05', '1', '杭州', '朗新科技股份有限公司', 'IT服务(系统/数据/维护) 计算机软件', null);
INSERT INTO `jobinfo` VALUES ('62', '销售管培生', null, '2019-07-04', '10', '北京', '人人行科技股份有限公司', '互联网/电子商务', null);
INSERT INTO `jobinfo` VALUES ('63', '业务设计师', null, '2019-07-05', '1', '武汉', '朗新科技股份有限公司', 'IT服务(系统/数据/维护) 计算机软件', null);
INSERT INTO `jobinfo` VALUES ('64', '校园招生代理', null, '2019-07-04', '6', '上海', '开能教育', '教育/培训/院校 专业服务/咨询(财会/法律/人力资源等) 学术/科研 互联网/电子商务', null);
INSERT INTO `jobinfo` VALUES ('65', '视觉与模式识别', null, '2019-07-04', '5', '武汉', '常州市凯迪电器股份有限公司', '电子技术/半导体/集成电路 电子技术/半导体/集成电路 贸易/进出口', null);
INSERT INTO `jobinfo` VALUES ('66', '视觉与模式识别', null, '2019-07-04', '5', '常州', '常州市凯迪电器股份有限公司', '电子技术/半导体/集成电路 电子技术/半导体/集成电路 贸易/进出口', null);
INSERT INTO `jobinfo` VALUES ('67', 'AI开发储备岗', null, '2019-07-06', '1', '广州', '广州市铂桥信息科技有限公司', '互联网/电子商务 计算机软件 IT服务(系统/数据/维护) 互联网/电子商务', null);
INSERT INTO `jobinfo` VALUES ('68', '机器视觉与模式识别', null, '2019-07-04', '5', '常州', '常州市凯迪电器股份有限公司', '电子技术/半导体/集成电路 电子技术/半导体/集成电路 贸易/进出口', null);
INSERT INTO `jobinfo` VALUES ('69', '校园招生代理', null, '2019-07-04', '6', '北京', '开能教育', '教育/培训/院校 专业服务/咨询(财会/法律/人力资源等) 学术/科研 互联网/电子商务', null);
INSERT INTO `jobinfo` VALUES ('70', '【应届】趣味少儿编程老师', null, '2019-07-04', '5', '杭州', '杭州学僧网络科技有限公司', '教育/培训/院校', null);
INSERT INTO `jobinfo` VALUES ('71', '【高薪】电话销售', null, '2019-07-04', '10', '北京', '北京世纪网展科技有限公司', '互联网/电子商务 通信/电信/网络设备 广告/会展/公关 通信/电信运营、增值服务', null);
INSERT INTO `jobinfo` VALUES ('72', '校园招生代理', null, '2019-07-04', '6', '杭州', '开能教育', '教育/培训/院校 专业服务/咨询(财会/法律/人力资源等) 学术/科研 互联网/电子商务', null);
INSERT INTO `jobinfo` VALUES ('73', '校园招生代理', null, '2019-07-04', '6', '石家庄', '开能教育', '教育/培训/院校 专业服务/咨询(财会/法律/人力资源等) 学术/科研 互联网/电子商务', null);
INSERT INTO `jobinfo` VALUES ('74', '校园招生代理', null, '2019-07-04', '6', '郑州', '开能教育', '教育/培训/院校 专业服务/咨询(财会/法律/人力资源等) 学术/科研 互联网/电子商务', null);
INSERT INTO `jobinfo` VALUES ('75', '少儿编程教育-课程顾问', null, '2019-07-04', '20', '北京', '北京玖零时代影视传媒有限公司', '教育/培训/院校 医疗设备/器械 贸易/进出口 酒店/餐饮', null);
INSERT INTO `jobinfo` VALUES ('76', 'AI算法工程师', null, '2019-07-04', '1', '济南', '浪潮集团有限公司', 'IT服务(系统/数据/维护) 计算机软件 计算机硬件', null);
INSERT INTO `jobinfo` VALUES ('77', '视觉与模式识别', null, '2019-07-04', '5', '上海', '常州市凯迪电器股份有限公司', '电子技术/半导体/集成电路 电子技术/半导体/集成电路 贸易/进出口', null);
INSERT INTO `jobinfo` VALUES ('78', '销售助理', null, '2019-07-10', '6', '合肥', '安徽延长线教育科技有限公司', '教育/培训/院校 IT服务(系统/数据/维护)', null);
INSERT INTO `jobinfo` VALUES ('79', '【应届】趣味乐高老师', null, '2019-07-04', '5', '杭州', '杭州学僧网络科技有限公司', '教育/培训/院校', null);
INSERT INTO `jobinfo` VALUES ('80', 'AI算法工程师', null, '2019-07-04', '1', '北京', '浪潮集团有限公司', 'IT服务(系统/数据/维护) 计算机软件 计算机硬件', null);
INSERT INTO `jobinfo` VALUES ('81', '校园招生代理', null, '2019-07-04', '6', '济南', '开能教育', '教育/培训/院校 专业服务/咨询(财会/法律/人力资源等) 学术/科研 互联网/电子商务', null);
INSERT INTO `jobinfo` VALUES ('82', '校园招生代理', null, '2019-07-04', '6', '南京', '开能教育', '教育/培训/院校 专业服务/咨询(财会/法律/人力资源等) 学术/科研 互联网/电子商务', null);
INSERT INTO `jobinfo` VALUES ('83', ' 2020届应届毕业生岗', null, '2019-07-04', '20', '成都', '兴业银行股份有限公司', '银行', null);
INSERT INTO `jobinfo` VALUES ('84', '校园招生代理', null, '2019-07-04', '6', '成都', '开能教育', '教育/培训/院校 专业服务/咨询(财会/法律/人力资源等) 学术/科研 互联网/电子商务', null);
INSERT INTO `jobinfo` VALUES ('85', '工业设计在校实习生', null, '2019-07-10', '2', '成都', '成都市火熊科技有限责任公司', '外包服务 加工制造（原料加工/模具）', null);
INSERT INTO `jobinfo` VALUES ('86', 'HPC应用支持 专家 （AI方向）', null, '2019-07-04', '2', '济南', '浪潮集团有限公司', 'IT服务(系统/数据/维护) 计算机软件 计算机硬件', null);
INSERT INTO `jobinfo` VALUES ('87', '校园大使', null, '2019-07-05', '1', '北京', '北京声智科技有限公司', '互联网/电子商务 计算机软件', null);
INSERT INTO `jobinfo` VALUES ('88', '语音算法', null, '2019-07-04', '5', '北京', '北京探境科技有限公司', '电子技术/半导体/集成电路', null);
INSERT INTO `jobinfo` VALUES ('89', '业务设计师', null, '2019-07-05', '1', '厦门', '朗新科技股份有限公司', 'IT服务(系统/数据/维护) 计算机软件', null);
INSERT INTO `jobinfo` VALUES ('90', ' 2020届应届毕业生岗', null, '2019-07-04', '20', '上海', '兴业银行股份有限公司', '银行', null);
INSERT INTO `jobinfo` VALUES ('91', '嵌入式软件工程师实习生', null, '2019-07-04', '1', '杭州', '杭州晶雁电子科技有限公司', '电子技术/半导体/集成电路', null);
INSERT INTO `jobinfo` VALUES ('92', 'HPC应用支持 专家 （AI方向）', null, '2019-07-04', '2', '北京', '浪潮集团有限公司', 'IT服务(系统/数据/维护) 计算机软件 计算机硬件', null);
INSERT INTO `jobinfo` VALUES ('93', '销售代表实习生', null, '2019-07-04', '8', '沈阳', '沈阳贝知科技有限公司', 'IT服务(系统/数据/维护)', null);
INSERT INTO `jobinfo` VALUES ('94', '诚招销售岗+双休+高底薪', null, '2019-07-11', '3', '合肥', '安徽延长线教育科技有限公司', '教育/培训/院校 IT服务(系统/数据/维护)', null);
INSERT INTO `jobinfo` VALUES ('95', '销售代表/双休', null, '2019-07-11', '5', '合肥', '安徽延长线教育科技有限公司', '教育/培训/院校 IT服务(系统/数据/维护)', null);
INSERT INTO `jobinfo` VALUES ('96', '招商专员/储备干部', null, '2019-07-11', '10', '合肥', '安徽延长线教育科技有限公司', '教育/培训/院校 IT服务(系统/数据/维护)', null);
INSERT INTO `jobinfo` VALUES ('97', '应届生看过来 高薪招聘业务员', null, '2019-07-11', '20', '合肥', '安徽延长线教育科技有限公司', '教育/培训/院校 IT服务(系统/数据/维护)', null);
INSERT INTO `jobinfo` VALUES ('98', '软件实习生', null, '2019-07-11', '1', '南京', '南京哪玩国际旅行社有限公司', '旅游/度假 娱乐/体育/休闲 酒店/餐饮', null);
INSERT INTO `jobinfo` VALUES ('99', '数据分析工程师（实习岗）', null, '2019-07-11', '2', '成都', '成都智库二八六一信息技术有限公司', '计算机软件 IT服务(系统/数据/维护) 计算机软件 互联网/电子商务', null);
INSERT INTO `jobinfo` VALUES ('100', '校园招生代理', null, '2019-07-04', '6', '保定', '开能教育', '教育/培训/院校 专业服务/咨询(财会/法律/人力资源等) 学术/科研 互联网/电子商务', null);
INSERT INTO `jobinfo` VALUES ('101', 'UI设计 培训生', null, '2019-07-11', '10', '南通', '南通动力教育咨询有限公司', '教育/培训/院校', null);
INSERT INTO `jobinfo` VALUES ('102', '海外市场实习生', null, '2019-07-04', '1', '北京', '灵动科技(北京)有限公司', '计算机软件 计算机硬件 电子技术/半导体/集成电路', null);
INSERT INTO `jobinfo` VALUES ('103', '北银金融科技有限责任公司2020年校园招聘（含暑期实习生）', null, '2019-07-10', '50', '北京', '北银金融科技有限责任公司', '互联网/电子商务', null);
INSERT INTO `jobinfo` VALUES ('104', '大数据开发工程师(J10372)', null, '2019-07-07', '2', '武汉', '朗新科技股份有限公司', 'IT服务(系统/数据/维护) 计算机软件', null);
INSERT INTO `jobinfo` VALUES ('105', '软件设计', null, '2019-06-27', '30', '武汉', '中船重工', '大型设备/机电设备/重工业', null);
INSERT INTO `jobinfo` VALUES ('106', '交互设计师', null, '2019-06-18', '5', '深圳', 'OPPO', '互联网/电子商务 通信/电信/网络设备', null);
INSERT INTO `jobinfo` VALUES ('107', '标准化工程师', null, '2019-06-19', '5', '深圳', 'OPPO', '互联网/电子商务 通信/电信/网络设备', null);
INSERT INTO `jobinfo` VALUES ('108', '实习生助理', null, '2019-07-03', '3', '广州', '中山大学中山眼科中心', '学术/科研 教育/培训/院校', null);
INSERT INTO `jobinfo` VALUES ('109', '大数据开发工程师', null, '2019-07-03', '1', '北京', '四达时代集团', '计算机软件 IT服务(系统/数据/维护) 媒体/出版/影视/文化传播', null);
INSERT INTO `jobinfo` VALUES ('110', '营销事务专员（可应届）', null, '2019-07-04', '2', '佛山', '碧桂园品牌营销中心-产城事业部', '房地产/建筑/建材/工程 家居/室内设计/装饰装潢 物业管理/商业中心', null);
INSERT INTO `jobinfo` VALUES ('111', '量化研究员助理(提供实习岗位）', null, '2019-07-03', '1', '南京', '江苏常行投资管理有限公司', '基金/证券/期货/投资', null);
INSERT INTO `jobinfo` VALUES ('112', '深度学习算法实习生', null, '2019-07-03', '10', '北京', '北京奥特贝睿科技有限公司', '计算机软件', null);
INSERT INTO `jobinfo` VALUES ('113', '预先研究员', null, '2019-04-23', '5', '北京', '航天云网', '互联网/电子商务', null);
INSERT INTO `jobinfo` VALUES ('114', '售前工程师', null, '2019-05-08', '99', '西安', '陕西退役军人', '政府/公共事业/非盈利机构', null);
INSERT INTO `jobinfo` VALUES ('115', '机器学习/深度学习算法设计师', null, '2019-06-10', '99', '上海', '上海临港地区', '其他', null);
INSERT INTO `jobinfo` VALUES ('116', '自动驾驶测试工程师', null, '2019-06-10', '99', '上海', '上海临港地区', '其他', null);
INSERT INTO `jobinfo` VALUES ('117', '项目申报专员', null, '2019-06-10', '99', '上海', '上海临港地区', '其他', null);
INSERT INTO `jobinfo` VALUES ('118', '强化学习', null, '2019-05-20', '2', '深圳', '就业专项活动', '其他', null);
INSERT INTO `jobinfo` VALUES ('119', '技术研发工程师（大数据方向）', null, '2019-05-23', '40', '福州', '福建联通', '通信/电信/网络设备', null);
INSERT INTO `jobinfo` VALUES ('120', 'ROS工程师', null, '2019-05-20', '3', '深圳', '就业专项活动', '其他', null);
INSERT INTO `jobinfo` VALUES ('121', '核心算法工程师（实习）', null, '2019-04-25', '2', '宁德', '宁德时代', '汽车/摩托车', null);
INSERT INTO `jobinfo` VALUES ('122', 'AI实习生', null, '2019-06-10', '99', '上海', '上海临港地区', '其他', null);
INSERT INTO `jobinfo` VALUES ('123', '软件开发岗（北京,广州,深圳）', null, '2019-03-17', '99', '全国', '中移信息技术', '通信/电信运营、增值服务', null);
INSERT INTO `jobinfo` VALUES ('124', '大数据开发与运营岗（北京,广州,深圳）', null, '2019-03-17', '99', '全国', '中移信息技术', '通信/电信运营、增值服务', null);
INSERT INTO `jobinfo` VALUES ('125', '全栈软件工程师', null, '2019-02-22', '3', '合肥', '中电38研究所', '政府/公共事业/非盈利机构', null);
INSERT INTO `jobinfo` VALUES ('126', '认知信息处理架构设计', null, '2019-02-22', '2', '合肥', '中电38研究所', '政府/公共事业/非盈利机构', null);
INSERT INTO `jobinfo` VALUES ('127', '创新业务技术支持', null, '2019-02-27', '99', '重庆', '中国联通', '通信/电信/网络设备', null);
INSERT INTO `jobinfo` VALUES ('128', '算法工程师', null, '2019-02-22', '2', '合肥', '中电38研究所', '政府/公共事业/非盈利机构', null);
INSERT INTO `jobinfo` VALUES ('129', '算法研发工程师A1-2', null, '2019-03-01', '5', '南京', '信息技术研究院', '计算机软件', null);
INSERT INTO `jobinfo` VALUES ('130', '知识管理与数据挖掘工程师', null, '2019-04-03', '2', '北京', '中船重工', '大型设备/机电设备/重工业', null);
INSERT INTO `jobinfo` VALUES ('131', '算法工程师', null, '2019-01-22', '2', '上海', '中船重工', '大型设备/机电设备/重工业', null);
INSERT INTO `jobinfo` VALUES ('132', '软件设计与仿真应用工程师', null, '2019-04-08', '99', '北京', '中船重工', '大型设备/机电设备/重工业', null);
INSERT INTO `jobinfo` VALUES ('133', '数据分析-互联网运营中心-郑州', null, '2019-02-11', '99', '郑州', '中国移动', '通信/电信运营、增值服务', null);
INSERT INTO `jobinfo` VALUES ('134', '商务经理-对外业务拓展中心-北京', null, '2019-02-11', '99', '北京', '中国移动', '通信/电信运营、增值服务', null);
INSERT INTO `jobinfo` VALUES ('135', '产品经理助理-IT系统部-郑州', null, '2019-02-11', '99', '郑州', '中国移动', '通信/电信运营、增值服务', null);
INSERT INTO `jobinfo` VALUES ('136', '产品运营-IT系统部-郑州', null, '2019-02-11', '99', '郑州', '中国移动', '通信/电信运营、增值服务', null);
INSERT INTO `jobinfo` VALUES ('137', '产品运营-IT系统部-北京', null, '2019-02-11', '99', '北京', '中国移动', '通信/电信运营、增值服务', null);
INSERT INTO `jobinfo` VALUES ('138', '产品经理助理-IT系统部-北京', null, '2019-02-11', '99', '北京', '中国移动', '通信/电信运营、增值服务', null);
INSERT INTO `jobinfo` VALUES ('139', '产品经理助理-IT系统部-上海', null, '2019-02-11', '99', '上海', '中国移动', '通信/电信运营、增值服务', null);
INSERT INTO `jobinfo` VALUES ('140', '产品运营-IT系统部-上海', null, '2019-02-11', '99', '上海', '中国移动', '通信/电信运营、增值服务', null);
INSERT INTO `jobinfo` VALUES ('141', '业务管理-辽宁分公司-沈阳', null, '2019-02-11', '99', '沈阳', '中国移动', '通信/电信运营、增值服务', null);
INSERT INTO `jobinfo` VALUES ('142', 'AI工程师', null, '2019-03-25', '10', '广州', '影子科技', '互联网/电子商务 IT服务(系统/数据/维护) 计算机软件', null);
INSERT INTO `jobinfo` VALUES ('143', '视觉识别开发工程师', null, '2019-02-21', '99', '北京', '神州医疗', '互联网/电子商务 医药/生物工程', null);
INSERT INTO `jobinfo` VALUES ('144', '视觉识别开发工程师', null, '2019-02-21', '99', '北京', '神州医疗', '互联网/电子商务 医药/生物工程', null);
INSERT INTO `jobinfo` VALUES ('145', '2020年应届毕业生（成都）', null, '2019-03-04', '99', '成都', '兴业银行', '银行', null);
INSERT INTO `jobinfo` VALUES ('146', '信息系统工程师', null, '2019-02-12', '99', '徐州', '徐工集团', '大型设备/机电设备/重工业', null);
INSERT INTO `jobinfo` VALUES ('147', '系统解决方案-广东分公司-江门', null, '2019-03-24', '1', '江门', '中国移动', '通信/电信运营、增值服务', null);
INSERT INTO `jobinfo` VALUES ('148', '数据开发工程师', null, '2019-03-18', '6', '青岛', '中国再生资源开发', '环保', null);
INSERT INTO `jobinfo` VALUES ('149', '安防系统工程检测员', null, '2019-03-28', '1', '北京', '北京电子控股', '互联网/电子商务', null);
INSERT INTO `jobinfo` VALUES ('150', '安防系统工程检测员', null, '2019-03-28', '1', '北京', '北京电子控股', '互联网/电子商务', null);
INSERT INTO `jobinfo` VALUES ('151', '人工智能实习生', null, '2019-07-10', '3', '哈尔滨', null, null, null);
INSERT INTO `jobinfo` VALUES ('152', '人工智能实习生', null, '2019-07-10', '3', '哈尔滨', null, null, null);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `telephone` varchar(255) NOT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('8', 'user1', '1111', '1111');
INSERT INTO `user` VALUES ('9', 'user2', '2222', '2222');
INSERT INTO `user` VALUES ('10', 'user3', '3333', '3333');
INSERT INTO `user` VALUES ('11', 'user4', '4444', '4444');
INSERT INTO `user` VALUES ('12', 'user5', '5555', '5555');
INSERT INTO `user` VALUES ('13', 'user6', '6666', '6666');
INSERT INTO `user` VALUES ('14', 'root', 'root', '1111');
INSERT INTO `user` VALUES ('15', 'user7', '7777', '7777');
INSERT INTO `user` VALUES ('16', 'user8', '8888', '8888');
INSERT INTO `user` VALUES ('17', 'user9', '9999', '9999');
