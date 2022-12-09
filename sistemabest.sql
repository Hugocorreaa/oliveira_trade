-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Tempo de geração: 09-Dez-2022 às 07:15
-- Versão do servidor: 5.7.40
-- versão do PHP: 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `sistemabest`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `app_customuser`
--

DROP TABLE IF EXISTS `app_customuser`;
CREATE TABLE IF NOT EXISTS `app_customuser` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) COLLATE utf8_bin NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) COLLATE utf8_bin NOT NULL,
  `first_name` varchar(150) COLLATE utf8_bin NOT NULL,
  `last_name` varchar(150) COLLATE utf8_bin NOT NULL,
  `email` varchar(254) COLLATE utf8_bin NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `cpf` varchar(50) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Extraindo dados da tabela `app_customuser`
--

INSERT INTO `app_customuser` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`, `cpf`) VALUES
(1, 'pbkdf2_sha256$390000$R6bshkEpiWakz7JwnfrwTf$vSJfFHZcBqszy/aL/VurMj/YxzvvIbeeFJYk136W+6g=', '2022-12-09 06:08:06.161982', 0, 'Todeshine', 'Hugo', 'Corrêa', 'hugodemorais@live.com', 0, 1, '2022-12-09 04:36:41.578666', '02520676221'),
(2, 'pbkdf2_sha256$390000$xhckGzv0N7kbTqQI4I34cj$RhcvDRYKxZqm5tBL51gJYE25mlyBdnnZQfwbTNwBMtY=', '2022-12-09 05:48:27.429404', 0, 'Todeshine2', 'Hugo', 'Corrêa', 'hugodemorais@live.com', 0, 1, '2022-12-09 05:43:01.730734', '02520676222');

-- --------------------------------------------------------

--
-- Estrutura da tabela `app_customuser_groups`
--

DROP TABLE IF EXISTS `app_customuser_groups`;
CREATE TABLE IF NOT EXISTS `app_customuser_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `customuser_id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_customuser_groups_customuser_id_group_id_a5a0ca22_uniq` (`customuser_id`,`group_id`),
  KEY `app_customuser_groups_group_id_47e49ebd_fk_auth_group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estrutura da tabela `app_customuser_user_permissions`
--

DROP TABLE IF EXISTS `app_customuser_user_permissions`;
CREATE TABLE IF NOT EXISTS `app_customuser_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `customuser_id` bigint(20) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_customuser_user_perm_customuser_id_permission_22e31019_uniq` (`customuser_id`,`permission_id`),
  KEY `app_customuser_user__permission_id_c5920c75_fk_auth_perm` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estrutura da tabela `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estrutura da tabela `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estrutura da tabela `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Extraindo dados da tabela `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add content type', 4, 'add_contenttype'),
(14, 'Can change content type', 4, 'change_contenttype'),
(15, 'Can delete content type', 4, 'delete_contenttype'),
(16, 'Can view content type', 4, 'view_contenttype'),
(17, 'Can add session', 5, 'add_session'),
(18, 'Can change session', 5, 'change_session'),
(19, 'Can delete session', 5, 'delete_session'),
(20, 'Can view session', 5, 'view_session'),
(21, 'Can add user', 6, 'add_customuser'),
(22, 'Can change user', 6, 'change_customuser'),
(23, 'Can delete user', 6, 'delete_customuser'),
(24, 'Can view user', 6, 'view_customuser');

-- --------------------------------------------------------

--
-- Estrutura da tabela `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext COLLATE utf8_bin,
  `object_repr` varchar(200) COLLATE utf8_bin NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext COLLATE utf8_bin NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_app_customuser_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estrutura da tabela `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) COLLATE utf8_bin NOT NULL,
  `model` varchar(100) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Extraindo dados da tabela `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(6, 'app', 'customuser'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'contenttypes', 'contenttype'),
(5, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Estrutura da tabela `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) COLLATE utf8_bin NOT NULL,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Extraindo dados da tabela `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2022-12-09 04:15:10.689513'),
(2, 'contenttypes', '0002_remove_content_type_name', '2022-12-09 04:15:10.775058'),
(3, 'auth', '0001_initial', '2022-12-09 04:15:11.035847'),
(4, 'auth', '0002_alter_permission_name_max_length', '2022-12-09 04:15:11.088380'),
(5, 'auth', '0003_alter_user_email_max_length', '2022-12-09 04:15:11.096917'),
(6, 'auth', '0004_alter_user_username_opts', '2022-12-09 04:15:11.105012'),
(7, 'auth', '0005_alter_user_last_login_null', '2022-12-09 04:15:11.112557'),
(8, 'auth', '0006_require_contenttypes_0002', '2022-12-09 04:15:11.116544'),
(9, 'auth', '0007_alter_validators_add_error_messages', '2022-12-09 04:15:11.123643'),
(10, 'auth', '0008_alter_user_username_max_length', '2022-12-09 04:15:11.133026'),
(11, 'auth', '0009_alter_user_last_name_max_length', '2022-12-09 04:15:11.140579'),
(12, 'auth', '0010_alter_group_name_max_length', '2022-12-09 04:15:11.202062'),
(13, 'auth', '0011_update_proxy_permissions', '2022-12-09 04:15:11.210551'),
(14, 'auth', '0012_alter_user_first_name_max_length', '2022-12-09 04:15:11.219555'),
(15, 'app', '0001_initial', '2022-12-09 04:15:11.547603'),
(16, 'admin', '0001_initial', '2022-12-09 04:15:11.689552'),
(17, 'admin', '0002_logentry_remove_auto_add', '2022-12-09 04:15:11.701083'),
(18, 'admin', '0003_logentry_add_action_flag_choices', '2022-12-09 04:15:11.708113'),
(19, 'sessions', '0001_initial', '2022-12-09 04:15:11.752961'),
(20, 'app', '0002_customuser_cpf', '2022-12-09 04:20:22.009941');

-- --------------------------------------------------------

--
-- Estrutura da tabela `django_session`
--

DROP TABLE IF EXISTS `django_session`;
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) COLLATE utf8_bin NOT NULL,
  `session_data` longtext COLLATE utf8_bin NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Extraindo dados da tabela `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('t4h8gptg89w05tjsz455w8veepju8rpq', '.eJxVjMsOwiAQRf-FtSG8MhSX7v0GMjCDVA0kpV0Z_12bdKHbe865LxFxW2vcBi9xJnEWRpx-t4T5wW0HdMd26zL3ti5zkrsiDzrktRM_L4f7d1Bx1G_tLbCDxKVoMIpJT94x-hBMCRRAFSSTEbxVXrPh7DAUy5AmHYpSCsT7A-n6N-M:1p3WFH:pC87WEycJnyN_qlmqHDmG5VC7Nx_4-Vu3NuIAvBYDZA', '2022-12-23 05:48:27.434412');

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `app_customuser_groups`
--
ALTER TABLE `app_customuser_groups`
  ADD CONSTRAINT `app_customuser_group_customuser_id_164d073f_fk_app_custo` FOREIGN KEY (`customuser_id`) REFERENCES `app_customuser` (`id`),
  ADD CONSTRAINT `app_customuser_groups_group_id_47e49ebd_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Limitadores para a tabela `app_customuser_user_permissions`
--
ALTER TABLE `app_customuser_user_permissions`
  ADD CONSTRAINT `app_customuser_user__customuser_id_4bcbaafb_fk_app_custo` FOREIGN KEY (`customuser_id`) REFERENCES `app_customuser` (`id`),
  ADD CONSTRAINT `app_customuser_user__permission_id_c5920c75_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);

--
-- Limitadores para a tabela `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Limitadores para a tabela `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Limitadores para a tabela `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_app_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `app_customuser` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
