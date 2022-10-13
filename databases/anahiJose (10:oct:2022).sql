-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:8888
-- Tiempo de generación: 10-10-2022 a las 21:52:27
-- Versión del servidor: 5.7.34
-- Versión de PHP: 7.4.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `anahiJose`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `account_permission`
--

CREATE TABLE `account_permission` (
  `account_permission_id` int(11) NOT NULL,
  `name` longtext COLLATE utf8_unicode_ci,
  `description` longtext COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `account_permission`
--

INSERT INTO `account_permission` (`account_permission_id`, `name`, `description`) VALUES
(1, 'Manage Assigned Project', 'User can view and manage only assigned projects to him. Project status update, document upload/view, project discussion will be available to assigned projects'),
(2, 'Manage All Projects', ''),
(3, 'Manage Clients', ''),
(4, 'Manage Staffs', ''),
(5, 'Manage Payment', ''),
(6, 'Manage Assigned Support Ticket', ''),
(7, 'Manage All Support Tickets', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `account_role`
--

CREATE TABLE `account_role` (
  `account_role_id` int(11) NOT NULL,
  `name` longtext COLLATE utf8_unicode_ci,
  `account_permissions` longtext COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `account_role`
--

INSERT INTO `account_role` (`account_role_id`, `name`, `account_permissions`) VALUES
(1, 'Operativo', '1,2,3,4,'),
(2, 'Administrador', '1,2,3,4,5,6,7,');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `addons`
--

CREATE TABLE `addons` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `unique_identifier` varchar(255) NOT NULL,
  `version` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `about` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `name` longtext COLLATE utf8_unicode_ci,
  `email` longtext COLLATE utf8_unicode_ci,
  `password` longtext COLLATE utf8_unicode_ci,
  `phone` longtext COLLATE utf8_unicode_ci,
  `address` longtext COLLATE utf8_unicode_ci,
  `chat_status` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'offline',
  `owner_status` int(11) NOT NULL DEFAULT '0' COMMENT '1 owner, 0 not owner'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `admin`
--

INSERT INTO `admin` (`admin_id`, `name`, `email`, `password`, `phone`, `address`, `chat_status`, `owner_status`) VALUES
(1, 'Anahí ', 'admin@anahi.com', '7c4a8d09ca3762af61e59520943dc26494f8941b', '4771234567', 'Reforma 3082', 'offline', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bookmark`
--

CREATE TABLE `bookmark` (
  `bookmark_id` int(11) NOT NULL,
  `title` longtext COLLATE utf8_unicode_ci,
  `url` longtext COLLATE utf8_unicode_ci
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `calendar_event`
--

CREATE TABLE `calendar_event` (
  `calendar_event_id` int(11) NOT NULL,
  `title` longtext COLLATE utf8_unicode_ci,
  `description` longtext COLLATE utf8_unicode_ci,
  `user_type` longtext COLLATE utf8_unicode_ci,
  `user_id` int(11) DEFAULT NULL,
  `start_timestamp` longtext COLLATE utf8_unicode_ci,
  `end_timestamp` int(11) DEFAULT NULL,
  `colour` longtext COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `calendar_event`
--

INSERT INTO `calendar_event` (`calendar_event_id`, `title`, `description`, `user_type`, `user_id`, `start_timestamp`, `end_timestamp`, `colour`) VALUES
(2, 'jose ', 'wewew', 'admin', 1, '1655157600', 1655157600, ''),
(3, 'Jose', 'asdasdasdasd', 'admin', 1, '1658268000', 1658268000, '#E93339'),
(4, 'Cita de revisión', '2da dosis de baby botox', 'admin', 1, '1663027200', 1663027200, '#FDA330'),
(5, 'Intervención de la 2da. sesión', 'Se somete a nueva cita de implementación de dosis B al tratamiento ', 'admin', 1, '1664496000', 1664668800, '#128C48');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `chat`
--

CREATE TABLE `chat` (
  `id` int(10) UNSIGNED NOT NULL,
  `from` varchar(255) NOT NULL DEFAULT '',
  `to` varchar(255) NOT NULL DEFAULT '',
  `message` text NOT NULL,
  `sent` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `recd` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ci_sessions`
--

CREATE TABLE `ci_sessions` (
  `id` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `ip_address` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `data` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `ci_sessions`
--

INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('1055msb2436v1cr7his2fvtk6mmqf3gb', '::1', 1665425948, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636353432353934383b61646d696e5f6c6f67696e7c733a313a2231223b6c6f67696e5f757365725f69647c733a313a2231223b6e616d657c733a373a22416e6168c3ad20223b6c6f67696e5f747970657c733a353a2261646d696e223b),
('3rptr8vffe0uqbfkvnrr79sjq8n21o3q', '::1', 1665181644, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636353138313634343b6c6173745f706167657c733a36343a22687474703a2f2f6c6f63616c686f73743a383838382f6769742f616e6168692f696e6465782e7068702f61646d696e2f7465616d5f7461736b5f766965772f38223b61646d696e5f6c6f67696e7c733a313a2231223b6c6f67696e5f757365725f69647c733a313a2231223b6e616d657c733a373a22416e6168c3ad20223b6c6f67696e5f747970657c733a353a2261646d696e223b),
('4h6lftba8ujqreie2k1buk9v828s0f73', '::1', 1665437782, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636353433373738323b61646d696e5f6c6f67696e7c733a313a2231223b6c6f67696e5f757365725f69647c733a313a2231223b6e616d657c733a373a22416e6168c3ad20223b6c6f67696e5f747970657c733a353a2261646d696e223b),
('5e5vt33o8qppjk03r62pvdi6rddgu1ro', '::1', 1665161508, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636353136313530383b61646d696e5f6c6f67696e7c733a313a2231223b6c6f67696e5f757365725f69647c733a313a2231223b6e616d657c733a373a22416e6168c3ad20223b6c6f67696e5f747970657c733a353a2261646d696e223b),
('60qe5i0pgva3kjq9cen44ek8kct4qlne', '::1', 1665432750, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636353433323735303b61646d696e5f6c6f67696e7c733a313a2231223b6c6f67696e5f757365725f69647c733a313a2231223b6e616d657c733a373a22416e6168c3ad20223b6c6f67696e5f747970657c733a353a2261646d696e223b),
('660jkb0cgpkldc6g3464h6nk6v491532', '::1', 1665182537, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636353138323533373b6c6173745f706167657c733a36343a22687474703a2f2f6c6f63616c686f73743a383838382f6769742f616e6168692f696e6465782e7068702f61646d696e2f7465616d5f7461736b5f766965772f38223b61646d696e5f6c6f67696e7c733a313a2231223b6c6f67696e5f757365725f69647c733a313a2231223b6e616d657c733a373a22416e6168c3ad20223b6c6f67696e5f747970657c733a353a2261646d696e223b),
('ah7nr55oron3anuv4ak775tkp09rbfrv', '::1', 1665438249, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636353433383234393b61646d696e5f6c6f67696e7c733a313a2231223b6c6f67696e5f757365725f69647c733a313a2231223b6e616d657c733a373a22416e6168c3ad20223b6c6f67696e5f747970657c733a353a2261646d696e223b63757272656e745f6c616e67756167657c4e3b),
('aljd3v2eb69c826lbo143kkibpufq7vi', '::1', 1665422243, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636353432323234333b61646d696e5f6c6f67696e7c733a313a2231223b6c6f67696e5f757365725f69647c733a313a2231223b6e616d657c733a373a22416e6168c3ad20223b6c6f67696e5f747970657c733a353a2261646d696e223b),
('cta5nu57453p92h21q5loaj1ijms9g54', '::1', 1665161858, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636353136313835383b61646d696e5f6c6f67696e7c733a313a2231223b6c6f67696e5f757365725f69647c733a313a2231223b6e616d657c733a373a22416e6168c3ad20223b6c6f67696e5f747970657c733a353a2261646d696e223b),
('d849i7monbivv01hb3asuagjemtemtge', '::1', 1665163878, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636353136333736323b61646d696e5f6c6f67696e7c733a313a2231223b6c6f67696e5f757365725f69647c733a313a2231223b6e616d657c733a373a22416e6168c3ad20223b6c6f67696e5f747970657c733a353a2261646d696e223b),
('dc33pg82gb97qqar8f3scuafnrrfdapf', '::1', 1665434944, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636353433343934343b61646d696e5f6c6f67696e7c733a313a2231223b6c6f67696e5f757365725f69647c733a313a2231223b6e616d657c733a373a22416e6168c3ad20223b6c6f67696e5f747970657c733a353a2261646d696e223b),
('dp4mth982q7e2ptlubb23qch87rqs1s3', '::1', 1665426381, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636353432363338313b61646d696e5f6c6f67696e7c733a313a2231223b6c6f67696e5f757365725f69647c733a313a2231223b6e616d657c733a373a22416e6168c3ad20223b6c6f67696e5f747970657c733a353a2261646d696e223b),
('fojqr2j78139r36877jq7e1cisij3tlr', '::1', 1665162463, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636353136323436333b61646d696e5f6c6f67696e7c733a313a2231223b6c6f67696e5f757365725f69647c733a313a2231223b6e616d657c733a373a22416e6168c3ad20223b6c6f67696e5f747970657c733a353a2261646d696e223b),
('g9da9tm0fief8v8khmvjf85t0nukdgb1', '::1', 1665182985, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636353138323938353b6c6173745f706167657c733a36343a22687474703a2f2f6c6f63616c686f73743a383838382f6769742f616e6168692f696e6465782e7068702f61646d696e2f7465616d5f7461736b5f766965772f38223b61646d696e5f6c6f67696e7c733a313a2231223b6c6f67696e5f757365725f69647c733a313a2231223b6e616d657c733a373a22416e6168c3ad20223b6c6f67696e5f747970657c733a353a2261646d696e223b),
('gv6a98kd301ar35mnl416klrfbf94iuk', '::1', 1665438684, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636353433383535353b61646d696e5f6c6f67696e7c733a313a2231223b6c6f67696e5f757365725f69647c733a313a2231223b6e616d657c733a373a22416e6168c3ad20223b6c6f67696e5f747970657c733a353a2261646d696e223b63757272656e745f6c616e67756167657c4e3b),
('ht2e9tp5ee8pc30nhto2h7g8eiv9hngm', '::1', 1665421904, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636353432313930343b61646d696e5f6c6f67696e7c733a313a2231223b6c6f67696e5f757365725f69647c733a313a2231223b6e616d657c733a373a22416e6168c3ad20223b6c6f67696e5f747970657c733a353a2261646d696e223b),
('i1a5jrjtsvp4ctvrejenporqa3o72t1f', '::1', 1665428860, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636353432383836303b61646d696e5f6c6f67696e7c733a313a2231223b6c6f67696e5f757365725f69647c733a313a2231223b6e616d657c733a373a22416e6168c3ad20223b6c6f67696e5f747970657c733a353a2261646d696e223b),
('i5kllssrco75a1fqgnerlo99ndqq5nuo', '::1', 1665182033, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636353138323033333b6c6173745f706167657c733a36343a22687474703a2f2f6c6f63616c686f73743a383838382f6769742f616e6168692f696e6465782e7068702f61646d696e2f7465616d5f7461736b5f766965772f38223b61646d696e5f6c6f67696e7c733a313a2231223b6c6f67696e5f757365725f69647c733a313a2231223b6e616d657c733a373a22416e6168c3ad20223b6c6f67696e5f747970657c733a353a2261646d696e223b),
('jki0munvm0l8duqaroladnhqoeais2f5', '::1', 1665163295, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636353136333239353b61646d696e5f6c6f67696e7c733a313a2231223b6c6f67696e5f757365725f69647c733a313a2231223b6e616d657c733a373a22416e6168c3ad20223b6c6f67696e5f747970657c733a353a2261646d696e223b),
('ld2h80717c4bqhck10o0knjclrfleihd', '::1', 1665183098, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636353138323938353b6c6173745f706167657c733a36343a22687474703a2f2f6c6f63616c686f73743a383838382f6769742f616e6168692f696e6465782e7068702f61646d696e2f7465616d5f7461736b5f766965772f38223b61646d696e5f6c6f67696e7c733a313a2231223b6c6f67696e5f757365725f69647c733a313a2231223b6e616d657c733a373a22416e6168c3ad20223b6c6f67696e5f747970657c733a353a2261646d696e223b),
('ld9n45g5oj0bliv2i819uimr2im5p899', '::1', 1665159494, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636353135393439343b61646d696e5f6c6f67696e7c733a313a2231223b6c6f67696e5f757365725f69647c733a313a2231223b6e616d657c733a373a22416e6168c3ad20223b6c6f67696e5f747970657c733a353a2261646d696e223b),
('o9hdbl6kt8q99vdmrviq14v037fdahki', '::1', 1665179436, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636353137393433363b6c6173745f706167657c733a36343a22687474703a2f2f6c6f63616c686f73743a383838382f6769742f616e6168692f696e6465782e7068702f61646d696e2f7465616d5f7461736b5f766965772f38223b61646d696e5f6c6f67696e7c733a313a2231223b6c6f67696e5f757365725f69647c733a313a2231223b6e616d657c733a373a22416e6168c3ad20223b6c6f67696e5f747970657c733a353a2261646d696e223b),
('pq7j332lr436aou8a80rf0udacc9o96u', '::1', 1665419013, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636353431393031333b61646d696e5f6c6f67696e7c733a313a2231223b6c6f67696e5f757365725f69647c733a313a2231223b6e616d657c733a373a22416e6168c3ad20223b6c6f67696e5f747970657c733a353a2261646d696e223b),
('pqv437elbj41r2s0plrsb9sv7v4nd3un', '::1', 1665438555, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636353433383535353b61646d696e5f6c6f67696e7c733a313a2231223b6c6f67696e5f757365725f69647c733a313a2231223b6e616d657c733a373a22416e6168c3ad20223b6c6f67696e5f747970657c733a353a2261646d696e223b63757272656e745f6c616e67756167657c4e3b),
('qe6m8ifovnq5npcql41kkta7p4holgq5', '::1', 1665160616, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636353136303631363b61646d696e5f6c6f67696e7c733a313a2231223b6c6f67696e5f757365725f69647c733a313a2231223b6e616d657c733a373a22416e6168c3ad20223b6c6f67696e5f747970657c733a353a2261646d696e223b),
('qs878l2obr918q5n1fvi0mus4d7gpg39', '::1', 1665158753, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636353135383735333b61646d696e5f6c6f67696e7c733a313a2231223b6c6f67696e5f757365725f69647c733a313a2231223b6e616d657c733a373a22416e6168c3ad20223b6c6f67696e5f747970657c733a353a2261646d696e223b),
('s07250rgrt1unp3ha6ru4jpaqlpld53c', '::1', 1665163762, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636353136333736323b61646d696e5f6c6f67696e7c733a313a2231223b6c6f67696e5f757365725f69647c733a313a2231223b6e616d657c733a373a22416e6168c3ad20223b6c6f67696e5f747970657c733a353a2261646d696e223b),
('sc0u8k5i3l11o0jrcrof6cs8t9dhedtk', '::1', 1665158427, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636353135383432373b61646d696e5f6c6f67696e7c733a313a2231223b6c6f67696e5f757365725f69647c733a313a2231223b6e616d657c733a373a22416e6168c3ad20223b6c6f67696e5f747970657c733a353a2261646d696e223b),
('su90dcvabe7i215gld9spn3vvnsfblic', '::1', 1665157849, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636353135373834393b61646d696e5f6c6f67696e7c733a313a2231223b6c6f67696e5f757365725f69647c733a313a2231223b6e616d657c733a373a22416e6168c3ad20223b6c6f67696e5f747970657c733a353a2261646d696e223b),
('tj71ducp2ad0vh5g8163oaadujong2fj', '::1', 1665422824, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636353432323832343b61646d696e5f6c6f67696e7c733a313a2231223b6c6f67696e5f757365725f69647c733a313a2231223b6e616d657c733a373a22416e6168c3ad20223b6c6f67696e5f747970657c733a353a2261646d696e223b),
('uq1mu0lqlvmfqvv2bpvtjmtav8qmcnu4', '::1', 1665157548, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636353135373534383b61646d696e5f6c6f67696e7c733a313a2231223b6c6f67696e5f757365725f69647c733a313a2231223b6e616d657c733a373a22416e6168c3ad20223b6c6f67696e5f747970657c733a353a2261646d696e223b);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `client`
--

CREATE TABLE `client` (
  `client_id` int(11) NOT NULL,
  `name` longtext COLLATE utf8_unicode_ci,
  `email` longtext COLLATE utf8_unicode_ci,
  `password` longtext COLLATE utf8_unicode_ci,
  `address` longtext COLLATE utf8_unicode_ci,
  `phone` longtext COLLATE utf8_unicode_ci,
  `website` longtext COLLATE utf8_unicode_ci,
  `skype_id` longtext COLLATE utf8_unicode_ci,
  `facebook_profile_link` longtext COLLATE utf8_unicode_ci,
  `linkedin_profile_link` longtext COLLATE utf8_unicode_ci,
  `twitter_profile_link` longtext COLLATE utf8_unicode_ci,
  `short_note` longtext COLLATE utf8_unicode_ci,
  `chat_status` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'offline'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `client`
--

INSERT INTO `client` (`client_id`, `name`, `email`, `password`, `address`, `phone`, `website`, `skype_id`, `facebook_profile_link`, `linkedin_profile_link`, `twitter_profile_link`, `short_note`, `chat_status`) VALUES
(4, ' Mendoza Navarro', 'admin@therejuvenateconcept.com', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'Luigi Pirandello 5451, Luigi Pirandello 5451, Luigi Pirandello 5451', '+523322090166', '', '', '', '', '', '', 'offline'),
(5, 'Yetlanezi', 'aket_aga@hotmail.com', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'Cañada 304', '4777215252', NULL, '', '', '', '', 'Yetla', 'offline'),
(6, 'Sofia Herrera', 'sofia@gmail.com', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'Cañada 305', '4771385376', NULL, NULL, NULL, NULL, NULL, 'Cliente Norte', 'offline');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `client_pending`
--

CREATE TABLE `client_pending` (
  `client_pending_id` int(11) NOT NULL,
  `name` longtext COLLATE utf8_unicode_ci,
  `email` longtext COLLATE utf8_unicode_ci,
  `password` longtext COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `company`
--

CREATE TABLE `company` (
  `company_id` int(11) NOT NULL,
  `name` longtext COLLATE utf8_unicode_ci,
  `email` longtext COLLATE utf8_unicode_ci,
  `address` longtext COLLATE utf8_unicode_ci,
  `phone` longtext COLLATE utf8_unicode_ci,
  `website` longtext COLLATE utf8_unicode_ci,
  `client_id` int(11) DEFAULT NULL,
  `influencer_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `currency`
--

CREATE TABLE `currency` (
  `currency_id` int(11) NOT NULL,
  `currency_code` longtext COLLATE utf8_unicode_ci,
  `currency_symbol` longtext COLLATE utf8_unicode_ci,
  `currency_name` longtext COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `currency`
--

INSERT INTO `currency` (`currency_id`, `currency_code`, `currency_symbol`, `currency_name`) VALUES
(1, 'USD', '$', 'US dollar'),
(2, 'GBP', '£', 'Pound'),
(3, 'EUR', '€', 'Euro'),
(4, 'AUD', '$', 'Australian Dollar'),
(5, 'CAD', '$', 'Canadian Dollar'),
(6, 'JPY', '¥', 'Japanese Yen'),
(7, 'NZD', '$', 'N.Z. Dollar'),
(8, 'CHF', 'Fr', 'Swiss Franc'),
(9, 'HKD', '$', 'Hong Kong Dollar'),
(10, 'SGD', '$', 'Singapore Dollar'),
(11, 'SEK', 'kr', 'Swedish Krona'),
(12, 'DKK', 'kr', 'Danish Krone'),
(13, 'PLN', 'zł', 'Polish Zloty'),
(14, 'HUF', 'Ft', 'Hungarian Forint'),
(15, 'CZK', 'Kč', 'Czech Koruna'),
(16, 'MXN', '$', 'Mexican Peso'),
(17, 'CZK', 'Kč', 'Czech Koruna'),
(18, 'MYR', 'RM', 'Malaysian Ringgit');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `document`
--

CREATE TABLE `document` (
  `document_id` int(11) NOT NULL,
  `title` longtext COLLATE utf8_unicode_ci,
  `description` longtext COLLATE utf8_unicode_ci,
  `file_name` longtext COLLATE utf8_unicode_ci,
  `file_type` longtext COLLATE utf8_unicode_ci,
  `class_id` longtext COLLATE utf8_unicode_ci,
  `teacher_id` int(11) DEFAULT NULL,
  `timestamp` longtext COLLATE utf8_unicode_ci
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `email_template`
--

CREATE TABLE `email_template` (
  `email_template_id` int(11) NOT NULL,
  `task` longtext COLLATE utf8_unicode_ci,
  `subject` longtext COLLATE utf8_unicode_ci,
  `body` longtext COLLATE utf8_unicode_ci,
  `instruction` longtext COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `email_template`
--

INSERT INTO `email_template` (`email_template_id`, `task`, `subject`, `body`, `instruction`) VALUES
(1, 'new_project_opening', 'New project created', '<span>\r\n<div>Hello, [CLIENT_NAME], <br>we have created a new project with your account.<br><br>Project name : [PROJECT_NAME]<br>Please follow the link below to view status and updates of the project.<br>[PROJECT_LINK]</div></span>', ''),
(2, 'new_client_account_opening', 'Client account creation', '<span><div>Hi [CLIENT_NAME],</div></span>Your client account is created !<span>Please login to your client account panel here :&nbsp;<br></span>[SYSTEM_URL]<br>Login credential :<br>email : [CLIENT_EMAIL]<br>password : [CLIENT_PASSWORD]', ''),
(3, 'new_staff_account_opening', 'Staff account creation', '<span>\n<div><div>Hi [STAFF_NAME],</div>Your staff account is created !&nbsp;Please login to your staff account panel here :&nbsp;<br>[SYSTEM_URL]<br>Login credential :<br>email : [STAFF_EMAIL]<br>password : [STAFF_PASSWORD]<br></div></span>', ''),
(4, 'payment_completion_notification', 'Payment completion notification', '<span>\n<div>Your payment of invoice [INVOICE_NUMBER] is completed.<br>You can review your payment history here :<br>[SYSTEM_PAYMENT_URL]</div></span>', ''),
(5, 'new_support_ticket_notify_admin', 'New support ticket notification', 'Hi [ADMIN_NAME],<br>A new support ticket is submitted. Ticket code : [TICKET_CODE]<br><br>Review all opened support tickets here :<br>[SYSTEM_OPENED_TICKET_URL]<br>', ''),
(6, 'support_ticket_assign_staff', 'Support ticket assignment notification', 'Hi [STAFF_NAME],<br>A new support ticket is assigned. Ticket code : [TICKET_CODE]<br><br>Review all opened support tickets here :<br>[SYSTEM_OPENED_TICKET_URL]', ''),
(7, 'new_message_notification', 'New message notification.', 'A new message has been sent by [SENDER_NAME].<br><br><span class=\"wysiwyg-color-silver\">[MESSAGE]<br></span><br><span>To reply to this message, login to your account :<br></span>[SYSTEM_URL]', ''),
(8, 'password_reset_confirmation', 'Password reset notification', 'Hi [NAME],<br>Your password is reset. New password : [NEW_PASSWORD]<br>Login here with your new password :<br>[SYSTEM_URL]<br><br>You can change your password after logging in to your account.', ''),
(9, 'new_client_account_confirm', 'New Client account confirmed', '<span><div>Hi [CLIENT_NAME],</div></span>Your client account is confirmed!<span>Please login to your client account panel here :&nbsp;<br></span>[SYSTEM_URL]<br>', ''),
(10, 'new_admin_account_creation', 'Admin Account Creation', '<span><div>Hi [ADMIN_NAME],</div></span>Your admin account is created !<span>Please login to your admin account panel here :&nbsp;<br></span>[SYSTEM_URL]<br>Login credential :<br>email : [ADMIN_EMAIL]<br>password : [ADMIN_PASSWORD]', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `expense_category`
--

CREATE TABLE `expense_category` (
  `expense_category_id` int(11) NOT NULL,
  `title` longtext COLLATE utf8_unicode_ci,
  `description` longtext COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `expense_category`
--

INSERT INTO `expense_category` (`expense_category_id`, `title`, `description`) VALUES
(1, 'Extras', 'Si tienen gastos durante el viaje de visita a algún cliente'),
(2, 'PRODUCTO', 'Dosis completa');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `influencer`
--

CREATE TABLE `influencer` (
  `influencer_id` int(11) NOT NULL,
  `name` longtext COLLATE utf8_unicode_ci,
  `email` longtext COLLATE utf8_unicode_ci,
  `password` longtext COLLATE utf8_unicode_ci,
  `address` longtext COLLATE utf8_unicode_ci,
  `phone` longtext COLLATE utf8_unicode_ci,
  `website` longtext COLLATE utf8_unicode_ci,
  `skype_id` longtext COLLATE utf8_unicode_ci,
  `facebook_profile_link` longtext COLLATE utf8_unicode_ci,
  `linkedin_profile_link` longtext COLLATE utf8_unicode_ci,
  `twitter_profile_link` longtext COLLATE utf8_unicode_ci,
  `short_note` longtext COLLATE utf8_unicode_ci,
  `chat_status` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'offline'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `influencer`
--

INSERT INTO `influencer` (`influencer_id`, `name`, `email`, `password`, `address`, `phone`, `website`, `skype_id`, `facebook_profile_link`, `linkedin_profile_link`, `twitter_profile_link`, `short_note`, `chat_status`) VALUES
(1, 'José Antonio Mendoza Navarro', 'admin@therejuvenateconcept.com', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'Luigi Pirandello 5451, Luigi Pirandello 5451, Luigi Pirandello 5451', '+523322090166', '', '', '', '', '', '', 'offline');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `invoice`
--

CREATE TABLE `invoice` (
  `invoice_id` int(11) NOT NULL,
  `invoice_number` longtext COLLATE utf8_unicode_ci,
  `client_id` int(11) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  `title` longtext COLLATE utf8_unicode_ci,
  `invoice_entries` longtext COLLATE utf8_unicode_ci,
  `creation_timestamp` longtext COLLATE utf8_unicode_ci,
  `due_timestamp` longtext COLLATE utf8_unicode_ci,
  `status` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT 'paid or unpaid',
  `vat_percentage` longtext COLLATE utf8_unicode_ci,
  `discount_amount` longtext COLLATE utf8_unicode_ci
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `message`
--

CREATE TABLE `message` (
  `message_id` int(11) NOT NULL,
  `message_thread_code` longtext,
  `message` longtext,
  `sender` longtext,
  `timestamp` longtext,
  `read_status` int(11) NOT NULL DEFAULT '0' COMMENT '0 unread 1 read'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `message`
--

INSERT INTO `message` (`message_id`, `message_thread_code`, `message`, `sender`, `timestamp`, `read_status`) VALUES
(1, 'e0f90f3cadb3917', 'sdffgdffgdffgsfd', 'admin-1', '1659111934', 0),
(2, 'af798f34861ec99', 'Que onda ya no me diste tantos permisos por?', 'staff-1', '1663082381', 1),
(3, 'af798f34861ec99', 'Hola! ', 'admin-1', '1663082415', 1),
(4, 'af798f34861ec99', 'Hola', 'admin-1', '1663115375', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `message_thread`
--

CREATE TABLE `message_thread` (
  `message_thread_id` int(11) NOT NULL,
  `message_thread_code` longtext COLLATE utf8_unicode_ci,
  `sender` longtext COLLATE utf8_unicode_ci,
  `reciever` longtext COLLATE utf8_unicode_ci,
  `last_message_timestamp` longtext COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `message_thread`
--

INSERT INTO `message_thread` (`message_thread_id`, `message_thread_code`, `sender`, `reciever`, `last_message_timestamp`) VALUES
(1, 'e0f90f3cadb3917', 'admin-1', 'client-4', NULL),
(2, 'af798f34861ec99', 'staff-1', 'admin-1', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `note`
--

CREATE TABLE `note` (
  `note_id` int(11) NOT NULL,
  `title` longtext COLLATE utf8_unicode_ci NOT NULL,
  `note` longtext COLLATE utf8_unicode_ci NOT NULL,
  `user_type` longtext COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `timestamp_create` longtext COLLATE utf8_unicode_ci NOT NULL,
  `timestamp_last_update` longtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `note`
--

INSERT INTO `note` (`note_id`, `title`, `note`, `user_type`, `user_id`, `timestamp_create`, `timestamp_last_update`) VALUES
(7, 'Contrataciones', 'Revisar los cv\'s para postulante de asistente', 'admin', 1, '1663115435', '1663115458'),
(2, 'Donde se guardarán las notas', 'Para dar seguimiento a la vista', 'staff', 1, '1663099505', '1663099523'),
(3, 'Permisos', 'aajajajanafbflwglqeg', 'staff', 1, '1663099531', '1663099541'),
(5, 'Beta', 'Nota de prueba', 'admin', 1, '1663113516', '1663113541');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notice`
--

CREATE TABLE `notice` (
  `notice_id` int(11) NOT NULL,
  `title` text COLLATE utf8_unicode_ci,
  `description` text COLLATE utf8_unicode_ci,
  `published_by` int(11) DEFAULT NULL,
  `visible_for` int(11) NOT NULL DEFAULT '1' COMMENT '1-all, 2-staff, 3-client',
  `date_added` int(11) DEFAULT NULL,
  `last_modified` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `notice`
--

INSERT INTO `notice` (`notice_id`, `title`, `description`, `published_by`, `visible_for`, `date_added`, `last_modified`) VALUES
(1, 'Día festivo', 'No programar citas el 16 de septiembre ', 1, 0, 1663100892, 1663735825),
(2, 'Prueba', 'df', 1, 1, 1663735765, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `payment`
--

CREATE TABLE `payment` (
  `payment_id` int(11) NOT NULL,
  `project_code` longtext COLLATE utf8_unicode_ci,
  `type` longtext COLLATE utf8_unicode_ci,
  `amount` int(11) NOT NULL DEFAULT '0',
  `title` longtext COLLATE utf8_unicode_ci,
  `description` longtext COLLATE utf8_unicode_ci,
  `payment_method` longtext COLLATE utf8_unicode_ci,
  `timestamp` longtext COLLATE utf8_unicode_ci,
  `milestone_id` int(11) DEFAULT NULL,
  `expense_category_id` int(11) DEFAULT NULL,
  `client_id` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `influencer_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `payment`
--

INSERT INTO `payment` (`payment_id`, `project_code`, `type`, `amount`, `title`, `description`, `payment_method`, `timestamp`, `milestone_id`, `expense_category_id`, `client_id`, `company_id`, `influencer_id`) VALUES
(1, '118f8bc6a0', 'income', 10, 'test', '', 'cash', '1656538058', 1, NULL, 4, 0, NULL),
(2, '118f8bc6a0', 'income', 20, 'test2', 'q2wwedwq', 'cash', '1656538122', 2, NULL, 4, 0, NULL),
(3, 'a001a56586', 'income', 500, 'pago1', '', 'cash', '1659111571', 3, NULL, 0, NULL, 0),
(4, NULL, 'expense', 20, 'prueba', 'asdasd', NULL, '0', NULL, 0, NULL, NULL, NULL),
(5, 'a001a56586', 'expense', 1000, 'CEJAS', NULL, NULL, '1662495720', NULL, NULL, NULL, NULL, NULL),
(6, NULL, 'expense', 33333, 'Botox', 'inyección', NULL, '1663718400', NULL, 0, NULL, NULL, NULL),
(7, '9585cd3040', 'income', 5000, 'Botox', '', 'cheque', '1663111016', 7, NULL, 5, NULL, 0),
(8, '9585cd3040', 'expense', 30000, 'operacion', NULL, NULL, '1663100520', NULL, NULL, NULL, NULL, NULL),
(9, 'fc8ef08065', 'expense', 1500, 'Botox', NULL, NULL, '1663100520', NULL, NULL, NULL, NULL, NULL),
(10, NULL, 'expense', 1000, 'Acido', '1 dosis completa', NULL, '1659312000', NULL, 0, NULL, NULL, NULL),
(11, NULL, 'expense', 1250, 'ACIDO', 'DOSIS ', NULL, '1663027200', NULL, 2, NULL, NULL, NULL),
(12, 'fc8ef08065', 'income', 5000, 'Botox', '', 'EFECTIVO', '1663116161', 8, NULL, 6, NULL, 0),
(13, 'fc8ef08065', 'income', 5000, 'Acido', '', 'EFECTIVO', '1663195925', 9, NULL, 6, NULL, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `product`
--

CREATE TABLE `product` (
  `product_id` int(11) NOT NULL,
  `Nombre` text COLLATE utf8_unicode_ci,
  `descripcion` text COLLATE utf8_unicode_ci,
  `publicado_por` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `visible_for` int(11) NOT NULL DEFAULT '1' COMMENT '1-all, 2-staff, 3-client',
  `date_added` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_modified` int(11) DEFAULT NULL,
  `marca` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `existencia` int(11) NOT NULL,
  `costo` int(11) NOT NULL,
  `precio` int(11) NOT NULL,
  `categories` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `file` longtext COLLATE utf8_unicode_ci NOT NULL,
  `caducidad` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `product`
--

INSERT INTO `product` (`product_id`, `Nombre`, `descripcion`, `publicado_por`, `visible_for`, `date_added`, `last_modified`, `marca`, `existencia`, `costo`, `precio`, `categories`, `file`, `caducidad`) VALUES
(15, 'Prueba3', 'Prueba3', '1', 0, '1657140274', 1657141071, 'Prueba3', 5, 500, 1500, 'Prueba3', '', '2022-07-14'),
(16, 'Medicamento b', 'para dolores fuertes', '1', 1, '1663114339', 1663114384, 'UUU', 100, 250, 300, 'Medicamento', 'pantorrilla2.png', '2028-07-28');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `project`
--

CREATE TABLE `project` (
  `project_id` int(11) NOT NULL,
  `project_code` longtext COLLATE utf8_unicode_ci,
  `title` longtext COLLATE utf8_unicode_ci,
  `description` longtext COLLATE utf8_unicode_ci,
  `demo_url` longtext COLLATE utf8_unicode_ci,
  `project_category_id` int(11) DEFAULT NULL,
  `client_id` int(11) DEFAULT NULL,
  `influencer_id` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `staffs` longtext COLLATE utf8_unicode_ci,
  `budget` int(11) NOT NULL DEFAULT '0',
  `timer_status` int(11) NOT NULL DEFAULT '0' COMMENT '1 running 0stopped',
  `timer_starting_timestamp` longtext COLLATE utf8_unicode_ci,
  `total_time_spent` int(11) NOT NULL DEFAULT '0' COMMENT 'second',
  `progress_status` longtext COLLATE utf8_unicode_ci,
  `timestamp_start` longtext COLLATE utf8_unicode_ci,
  `timestamp_end` longtext COLLATE utf8_unicode_ci,
  `project_status` int(11) NOT NULL DEFAULT '1' COMMENT '1 for running, 0 for archived',
  `project_note` longtext COLLATE utf8_unicode_ci
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `project`
--

INSERT INTO `project` (`project_id`, `project_code`, `title`, `description`, `demo_url`, `project_category_id`, `client_id`, `influencer_id`, `company_id`, `staffs`, `budget`, `timer_status`, `timer_starting_timestamp`, `total_time_spent`, `progress_status`, `timestamp_start`, `timestamp_end`, `project_status`, `project_note`) VALUES
(3, 'a001a56586', 'test', 'test prueb&lt;', '4777215252', NULL, 4, NULL, 0, '', 47, 0, NULL, 0, '56', '09/07/2022', '09/21/2022', 1, 'Prueba test'),
(5, 'fc8ef08065', 'Aplicación de acido hialurónico', 'Primera sesión de acido hialurónico', '4771385376', NULL, 6, NULL, 0, '1,', 5000, 0, NULL, 0, '10', '09/13/2022', '09/30/2022', 1, NULL),
(6, '9585cd3040', 'BOTOX', 'Implantar sesiones de acido hilurónico&nbsp;', '4777215252', NULL, 5, NULL, 0, '1,', 3000, 0, NULL, 0, '55', '09/15/2022', '09/30/2022', 1, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `project_bug`
--

CREATE TABLE `project_bug` (
  `project_bug_id` int(11) NOT NULL,
  `project_code` longtext COLLATE utf8_unicode_ci,
  `title` longtext COLLATE utf8_unicode_ci,
  `description` longtext COLLATE utf8_unicode_ci,
  `user_type` longtext COLLATE utf8_unicode_ci,
  `user_id` int(11) DEFAULT NULL,
  `file` longtext COLLATE utf8_unicode_ci,
  `status` int(11) NOT NULL COMMENT '0 for pending, 1 for solved',
  `timestamp` longtext COLLATE utf8_unicode_ci,
  `assigned_staff` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `project_bug`
--

INSERT INTO `project_bug` (`project_bug_id`, `project_code`, `title`, `description`, `user_type`, `user_id`, `file`, `status`, `timestamp`, `assigned_staff`) VALUES
(3, 'a001a56586', 'prueba2', 'prueba', 'admin', 1, NULL, 0, '1657218120', 0),
(4, '9585cd3040', 'Prueba', 'Prueba prueba', 'admin', 1, 'intern0-06.png', 0, '1663100520', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `project_category`
--

CREATE TABLE `project_category` (
  `project_category_id` int(11) NOT NULL,
  `name` longtext COLLATE utf8_unicode_ci,
  `description` longtext COLLATE utf8_unicode_ci
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `project_file`
--

CREATE TABLE `project_file` (
  `project_file_id` int(11) NOT NULL,
  `project_id` int(11) DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `name` longtext COLLATE utf8_unicode_ci,
  `visibility_client` int(11) NOT NULL DEFAULT '1' COMMENT '1visible 0hidden',
  `visibility_staff` int(11) NOT NULL DEFAULT '1' COMMENT '1visible 0hidden',
  `size` longtext COLLATE utf8_unicode_ci,
  `file_type` longtext COLLATE utf8_unicode_ci,
  `uploader_type` longtext COLLATE utf8_unicode_ci,
  `uploader_id` int(11) DEFAULT NULL,
  `timestamp_upload` longtext COLLATE utf8_unicode_ci
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `project_file`
--

INSERT INTO `project_file` (`project_file_id`, `project_id`, `description`, `name`, `visibility_client`, `visibility_staff`, `size`, `file_type`, `uploader_type`, `uploader_id`, `timestamp_upload`) VALUES
(2, 6, 'Corto', 'WhatsApp_Image_2022-09-13_at_1.58.44_PM_(1).jpeg', 1, 1, NULL, 'jpeg', 'admin', 1, '1663100520');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `project_filler`
--

CREATE TABLE `project_filler` (
  `project_filler_id` int(11) NOT NULL,
  `project_code` longtext COLLATE utf8_unicode_ci,
  `title` longtext COLLATE utf8_unicode_ci,
  `aplicacion` longtext COLLATE utf8_unicode_ci,
  `valoracion` longtext COLLATE utf8_unicode_ci,
  `relleno` longtext COLLATE utf8_unicode_ci,
  `procedimiento` longtext COLLATE utf8_unicode_ci,
  `lote` longtext COLLATE utf8_unicode_ci,
  `cantidad_producto` longtext COLLATE utf8_unicode_ci,
  `propuesta` longtext COLLATE utf8_unicode_ci,
  `user_type` longtext COLLATE utf8_unicode_ci,
  `user_id` int(11) DEFAULT NULL,
  `timestamp` longtext COLLATE utf8_unicode_ci,
  `assigned_staff` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `project_filler`
--

INSERT INTO `project_filler` (`project_filler_id`, `project_code`, `title`, `aplicacion`, `valoracion`, `relleno`, `procedimiento`, `lote`, `cantidad_producto`, `propuesta`, `user_type`, `user_id`, `timestamp`, `assigned_staff`) VALUES
(5, '9585cd3040', 'TITULO', '2022-09-29', '2022-09-23', 'Tipo De Relleno Aplicado', 'Procedimiento Aplicado', 'Lote Del Producto', 'Cantidad Del Producto Utilizado', 'Propuesta De Tratamiento', 'admin', 1, '1663878120', 1),
(6, '9585cd3040', 'PRUEBA FINAL', '2022-09-23', '2022-09-23', 'Tipo De Relleno Aplicado', 'Procedimiento Aplicado', 'Lote Del Producto', 'Cantidad Del Producto Utilizado', 'Propuesta De Tratamiento', 'admin', 1, '1663878120', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `project_historia_clinica`
--

CREATE TABLE `project_historia_clinica` (
  `project_historia_clinica_id` int(11) NOT NULL,
  `project_code` longtext,
  `title` longtext,
  `nombre_completo` longtext,
  `nacimiento` longtext,
  `sexo` int(11) DEFAULT NULL COMMENT '0 for Masculino, 1 for Femenino ',
  `talla` longtext,
  `peso` longtext,
  `glucosa` longtext,
  `motivo_consulta` longtext,
  `alergias` longtext,
  `farmacos_actuales` longtext,
  `alcohol` int(11) DEFAULT NULL COMMENT '0 for no, 1 for si ',
  `alcohol_notas` longtext,
  `tabaco` int(11) DEFAULT NULL COMMENT '0 for no, 1 for si ',
  `tabaco_notas` longtext,
  `sustancias` int(11) DEFAULT NULL COMMENT '0 for no, 1 for si ',
  `sustancias_notas` longtext,
  `glogau` int(11) DEFAULT NULL COMMENT '0 for 1, 1 for 2, 2 for 3, 3 for 4',
  `fitz` int(11) DEFAULT NULL COMMENT '0 for 1, 1 for 2, 2 for 3, 3 for 4, 4 for 5, 5 for 6',
  `project_toxina_botulinica_id` int(11) DEFAULT NULL,
  `notas` longtext,
  `assigned_staff` int(11) DEFAULT NULL,
  `timestamp` longtext,
  `num_expendiente` varchar(11) DEFAULT NULL,
  `creacion` date DEFAULT NULL,
  `edad` varchar(11) DEFAULT NULL,
  `telefono` varchar(16) DEFAULT NULL,
  `direccion` varchar(50) DEFAULT NULL,
  `alergias_notas` varchar(150) DEFAULT NULL,
  `farmacos_actuales_notas` varchar(150) DEFAULT NULL,
  `procedimientos_quirurjicos` varchar(150) DEFAULT NULL,
  `quirurjicos_fecha` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `project_historia_clinica`
--

INSERT INTO `project_historia_clinica` (`project_historia_clinica_id`, `project_code`, `title`, `nombre_completo`, `nacimiento`, `sexo`, `talla`, `peso`, `glucosa`, `motivo_consulta`, `alergias`, `farmacos_actuales`, `alcohol`, `alcohol_notas`, `tabaco`, `tabaco_notas`, `sustancias`, `sustancias_notas`, `glogau`, `fitz`, `project_toxina_botulinica_id`, `notas`, `assigned_staff`, `timestamp`, `num_expendiente`, `creacion`, `edad`, `telefono`, `direccion`, `alergias_notas`, `farmacos_actuales_notas`, `procedimientos_quirurjicos`, `quirurjicos_fecha`) VALUES
(55, 'a001a56586', 'Prueba 1', 'DANIEL CARRILLO', '2022-10-01', 0, '32', '63', '31', '31', 'NA', 'NA', 0, 'NA', 0, 'NA', 0, 'NA', 0, 0, NULL, '', 0, '1662668520', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(56, 'fc8ef08065', 'Acido hialurónico', 'Sofia Herrera', '2000-09-13', 0, '30', '60', '90', 'Aplicación de acido', 'no', 'no', 0, '', 0, '', 0, '', 0, 0, NULL, '', 1, '1663100520', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(58, '9585cd3040', 'PRUEBA FINAL', 'DANIEL CARRILLO', '2022-09-23', 0, '32', '65', '54', 'NADA', '1', '1', 1, NULL, 1, NULL, NULL, NULL, 2, 2, NULL, 'NOTAS', 1, '1663878120', '1234', '2022-09-22', '22', '3312275426', 'DIRECCION', 'SI ALERGIAS', 'SI FARMACOS', '1', '2022-09-25');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `project_lab`
--

CREATE TABLE `project_lab` (
  `project_lab_id` int(11) NOT NULL,
  `project_id` int(11) DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `name` longtext COLLATE utf8_unicode_ci,
  `visibility_client` int(11) NOT NULL DEFAULT '1' COMMENT '1visible 0hidden',
  `visibility_staff` int(11) NOT NULL DEFAULT '1' COMMENT '1visible 0hidden',
  `size` longtext COLLATE utf8_unicode_ci,
  `file_type` longtext COLLATE utf8_unicode_ci,
  `uploader_type` longtext COLLATE utf8_unicode_ci,
  `uploader_id` int(11) DEFAULT NULL,
  `timestamp_upload` longtext COLLATE utf8_unicode_ci
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `project_lab`
--

INSERT INTO `project_lab` (`project_lab_id`, `project_id`, `description`, `name`, `visibility_client`, `visibility_staff`, `size`, `file_type`, `uploader_type`, `uploader_id`, `timestamp_upload`) VALUES
(3, 3, 'Analsisi de sangre', '', 1, 1, NULL, '', 'admin', 1, '1662495720'),
(4, 3, 'Analsisi de sangre', '', 1, 1, NULL, '', 'admin', 1, '1662495720'),
(5, 6, 'rayos x', '', 1, 1, NULL, '', 'admin', 1, '1663100520'),
(6, 6, 'rayos x', '', 1, 1, NULL, '', 'admin', 1, '1663100520');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `project_message`
--

CREATE TABLE `project_message` (
  `project_message_id` int(11) NOT NULL,
  `message` longtext COLLATE utf8_unicode_ci,
  `project_id` int(11) DEFAULT NULL,
  `date` longtext COLLATE utf8_unicode_ci,
  `user_type` longtext COLLATE utf8_unicode_ci,
  `user_id` int(11) DEFAULT NULL,
  `message_file_name` longtext COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `project_message`
--

INSERT INTO `project_message` (`project_message_id`, `message`, `project_id`, `date`, `user_type`, `user_id`, `message_file_name`) VALUES
(1, 'Hola', 3, '06 Sep 2022', 'admin', 1, 'Banner nosotros1.png'),
(2, 'hola', 3, '13 Sep 2022', 'admin', 1, NULL),
(3, 'Pagó en efectivo, adjunto recibo.', 5, '13 Sep 2022', 'admin', 1, 'pata.png'),
(4, 'hola', 6, '13 Sep 2022', 'admin', 1, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `project_milestone`
--

CREATE TABLE `project_milestone` (
  `project_milestone_id` int(11) NOT NULL,
  `title` longtext COLLATE utf8_unicode_ci,
  `project_code` longtext COLLATE utf8_unicode_ci,
  `client_id` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `amount` int(11) NOT NULL DEFAULT '0',
  `timestamp` longtext COLLATE utf8_unicode_ci,
  `currency_id` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL COMMENT '0 for unpaid, 1 for paid',
  `note` longtext COLLATE utf8_unicode_ci,
  `id_servicio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `project_milestone`
--

INSERT INTO `project_milestone` (`project_milestone_id`, `title`, `project_code`, `client_id`, `company_id`, `amount`, `timestamp`, `currency_id`, `status`, `note`, `id_servicio`) VALUES
(1, 'test', '118f8bc6a0', 4, 0, 10, '1656453600', NULL, 1, '', 0),
(2, 'test2', '118f8bc6a0', 4, 0, 20, '1656540000', NULL, 1, 'test', 0),
(3, 'pago1', 'a001a56586', 0, 0, 500, '1659045600', NULL, 1, '', 0),
(4, 'Botox', 'a001a56586', 0, 0, 5000, '0', NULL, 0, '', 23),
(5, 'Botox', 'a001a56586', 0, 0, 5000, '1664496000', NULL, 1, '', 23),
(6, 'Botox', 'a001a56586', 4, 0, 5000, '1663632000', NULL, 0, 'por sesiones', 23),
(7, 'Botox', '9585cd3040', 5, 0, 5000, '1663718400', NULL, 1, 'nota', 23),
(8, 'Botox', 'fc8ef08065', 6, 0, 5000, '1663027200', NULL, 1, '', 23),
(9, 'Acido', 'fc8ef08065', 6, 0, 5000, '1663027200', NULL, 1, 'pagado en efectivo', 24),
(10, 'Botox', '9585cd3040', 5, 0, 5000, '1664150400', NULL, 1, 'NADA', 23),
(11, 'Acido', '9585cd3040', 5, 0, 5000, '1664064000', NULL, 1, 'NADA', 24);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `project_nota_evolucion`
--

CREATE TABLE `project_nota_evolucion` (
  `project_nota_evolucion_id` int(11) NOT NULL,
  `project_code` longtext,
  `title` longtext,
  `nombre_completo` longtext,
  `comentarios_paciente` longtext,
  `observaciones` longtext,
  `assigned_staff` int(11) DEFAULT NULL,
  `siguiente_cita` longtext,
  `timestamp` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `project_nota_evolucion`
--

INSERT INTO `project_nota_evolucion` (`project_nota_evolucion_id`, `project_code`, `title`, `nombre_completo`, `comentarios_paciente`, `observaciones`, `assigned_staff`, `siguiente_cita`, `timestamp`) VALUES
(7, 'a001a56586', 'Prueba', 'Prueba ', 'Prueba', NULL, 0, '2022-07-21', '1658427720'),
(8, 'a001a56586', 'ota', 'José Antonio Mendoza Navarro', 'asdfasdf', NULL, 0, '2022-07-29', '1659118920');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `project_progreso`
--

CREATE TABLE `project_progreso` (
  `project_progreso_id` int(11) NOT NULL,
  `project_id` int(11) DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `name` longtext COLLATE utf8_unicode_ci,
  `visibility_client` int(11) NOT NULL DEFAULT '1' COMMENT '1visible 0hidden',
  `visibility_staff` int(11) NOT NULL DEFAULT '1' COMMENT '1visible 0hidden',
  `size` longtext COLLATE utf8_unicode_ci,
  `file_type` longtext COLLATE utf8_unicode_ci,
  `uploader_type` longtext COLLATE utf8_unicode_ci,
  `uploader_id` int(11) DEFAULT NULL,
  `timestamp_upload` longtext COLLATE utf8_unicode_ci
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `project_progreso`
--

INSERT INTO `project_progreso` (`project_progreso_id`, `project_id`, `description`, `name`, `visibility_client`, `visibility_staff`, `size`, `file_type`, `uploader_type`, `uploader_id`, `timestamp_upload`) VALUES
(7, 3, 'Prueba', '', 1, 1, NULL, '', 'admin', 1, '1662495720'),
(8, 3, '', '', 1, 1, NULL, '', 'admin', 1, '1662495720'),
(9, 3, 'Hola', '', 1, 1, NULL, '', 'admin', 1, '1662495720'),
(11, 6, 'Progre', '', 1, 1, NULL, '', 'admin', 1, '1663100520');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `project_task`
--

CREATE TABLE `project_task` (
  `project_task_id` int(11) NOT NULL,
  `project_id` int(11) DEFAULT NULL,
  `title` longtext COLLATE utf8_unicode_ci,
  `description` longtext COLLATE utf8_unicode_ci,
  `staff_id` int(11) DEFAULT NULL,
  `complete_status` int(11) DEFAULT NULL,
  `status` longtext COLLATE utf8_unicode_ci NOT NULL,
  `timestamp_start` longtext COLLATE utf8_unicode_ci,
  `timestamp_end` longtext COLLATE utf8_unicode_ci,
  `task_color` longtext COLLATE utf8_unicode_ci
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `project_task`
--

INSERT INTO `project_task` (`project_task_id`, `project_id`, `title`, `description`, `staff_id`, `complete_status`, `status`, `timestamp_start`, `timestamp_end`, `task_color`) VALUES
(1, 3, 'Revisar los estudios arrojados de rayos x', 'El cliente sufre una fractura interna', 0, 0, '', '1662508800', '1663718400', '#279ACB'),
(2, 6, 'recoger pruebas', 'recolectar las pruebas del paciente', 1, 0, '', '1663718400', '1663718400', '#E93339');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `project_timesheet`
--

CREATE TABLE `project_timesheet` (
  `project_timesheet_id` int(11) NOT NULL,
  `start_timestamp` longtext COLLATE utf8_unicode_ci,
  `end_timestamp` longtext COLLATE utf8_unicode_ci,
  `project_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `project_toxina_botulinica`
--

CREATE TABLE `project_toxina_botulinica` (
  `project_toxina_botulinica_id` int(11) NOT NULL,
  `project_code` longtext NOT NULL,
  `title` longtext,
  `id_historial_clinico` longtext,
  `zona_frontal_cantidad` longtext,
  `zona_corrugador_cantidad` int(11) DEFAULT '0',
  `zona_proceus_cantidad` int(11) DEFAULT '0',
  `zona_ojo_cantidad` int(11) DEFAULT '0',
  `zona_subpalpebral_cantidad` int(11) DEFAULT '0',
  `zona_nariz_cantidad` int(11) DEFAULT '0',
  `zona_boca_cantidad` int(11) DEFAULT '0',
  `zona_masetero_cantidad` int(11) DEFAULT '0',
  `zona_mentoniano_cantidad` int(11) DEFAULT '0',
  `zona_otros_cantidad` int(11) DEFAULT '0',
  `assigned_staff` int(11) DEFAULT NULL,
  `timestamp` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `project_toxina_botulinica`
--

INSERT INTO `project_toxina_botulinica` (`project_toxina_botulinica_id`, `project_code`, `title`, `id_historial_clinico`, `zona_frontal_cantidad`, `zona_corrugador_cantidad`, `zona_proceus_cantidad`, `zona_ojo_cantidad`, `zona_subpalpebral_cantidad`, `zona_nariz_cantidad`, `zona_boca_cantidad`, `zona_masetero_cantidad`, `zona_mentoniano_cantidad`, `zona_otros_cantidad`, `assigned_staff`, `timestamp`) VALUES
(16, 'fc8ef08065', NULL, '56', '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, '1663100520'),
(21, 'a001a56586', 'asdf', 'asd', '2', 0, 0, 0, 0, 0, 0, 0, 0, 6, 0, '1663784520'),
(22, '9585cd3040', 'titulo', 'Número De Expediente', '1', 2, 3, 4, 5, 6, 7, 8, 9, 10, 1, '1663878120'),
(24, '9585cd3040', 'PRUEBA FINAL', 'Número De Expediente', '5', 5, 0, 0, 0, 5, 5, 5, 5, 5, 1, '1663878120');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `quote`
--

CREATE TABLE `quote` (
  `quote_id` int(11) NOT NULL,
  `title` longtext COLLATE utf8_unicode_ci,
  `description` longtext COLLATE utf8_unicode_ci,
  `user_id` int(11) DEFAULT NULL,
  `timestamp` longtext COLLATE utf8_unicode_ci,
  `amount` longtext COLLATE utf8_unicode_ci NOT NULL,
  `files` longtext COLLATE utf8_unicode_ci,
  `status` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `quote_message`
--

CREATE TABLE `quote_message` (
  `quote_message_id` int(11) NOT NULL,
  `quote_id` int(11) DEFAULT NULL,
  `message` longtext COLLATE utf8_unicode_ci,
  `file` longtext COLLATE utf8_unicode_ci,
  `user_type` longtext COLLATE utf8_unicode_ci,
  `user_id` int(11) DEFAULT NULL,
  `timestamp` longtext COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `schedule`
--

CREATE TABLE `schedule` (
  `schedule_id` int(11) NOT NULL,
  `user_type` longtext COLLATE utf8_unicode_ci,
  `user_id` longtext COLLATE utf8_unicode_ci,
  `title` longtext COLLATE utf8_unicode_ci,
  `description` longtext COLLATE utf8_unicode_ci,
  `timestamp` longtext COLLATE utf8_unicode_ci
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicios`
--

CREATE TABLE `servicios` (
  `servicios_id` int(11) NOT NULL,
  `nombre` text COLLATE utf8_unicode_ci,
  `descripcion` text COLLATE utf8_unicode_ci,
  `publicado_por` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `visible_for` int(11) NOT NULL DEFAULT '1' COMMENT '1-all, 2-staff, 3-client',
  `date_added` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_modified` int(11) DEFAULT NULL,
  `precio` int(11) NOT NULL,
  `file` longtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `servicios`
--

INSERT INTO `servicios` (`servicios_id`, `nombre`, `descripcion`, `publicado_por`, `visible_for`, `date_added`, `last_modified`, `precio`, `file`) VALUES
(23, 'Botox ', 'Inyección de botox', '1', 0, '1661880156', NULL, 5000, ''),
(24, 'Acido', 'Primera aplicación', '1', 0, '1663113213', NULL, 5000, 'pata.png');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `settings`
--

CREATE TABLE `settings` (
  `settings_id` int(11) NOT NULL,
  `type` longtext,
  `description` longtext
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `settings`
--

INSERT INTO `settings` (`settings_id`, `type`, `description`) VALUES
(1, 'system_name', 'Dra. Anahí Tejeda'),
(2, 'system_title', 'Dra. Anahí Tejeda'),
(3, 'address', 'México'),
(4, 'phone', '2560565'),
(5, 'paypal_email', ''),
(6, 'currency', 'usd'),
(7, 'system_email', 'admin@example.com'),
(8, 'buyer', '[ your-codecanyon-username-here ]'),
(9, 'purchase_code', NULL),
(10, 'language', NULL),
(11, 'text_align', NULL),
(12, 'system_currency_id', NULL),
(13, 'theme', NULL),
(14, 'stripe_publishable_key', ''),
(15, 'stripe_api_key', ''),
(16, 'dropbox_data_app_key', NULL),
(17, 'skin_colour', 'default'),
(18, 'paypal_type', 'live'),
(27, 'smtp_host', 'ssl://smtp.googlemail.com'),
(24, 'paypal', '[{\"active\":\"1\",\"mode\":\"sandbox\",\"sandbox_client_id\":\"AZDxjDScFpQtjWTOUtWKbyN_bDt4OgqaF4eYXlewfBP4-8aqX3PiV8e1GWU6liB2CUXlkA59kJXE7M6R\",\"production_client_id\":\"SomeId\"}]'),
(25, 'stripe_keys', '[{\"active\":\"1\",\"testmode\":\"on\",\"public_key\":\"pk_test_c6VvBEbwHFdulFZ62q1IQrar\",\"secret_key\":\"sk_test_9IMkiM6Ykxr1LCe2dJ3PgaxS\",\"public_live_key\":\"pk_live_xxxxxxxxxxxxxxxxxxxxxxxx\",\"secret_live_key\":\"sk_live_xxxxxxxxxxxxxxxxxxxxxxxx\"}]'),
(26, 'version', '5.0'),
(28, 'smtp_port', '465'),
(34, 'protocol', 'smtp'),
(35, 'smtp_user', 'Your real email'),
(36, 'smtp_pass', 'Your real password');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `staff`
--

CREATE TABLE `staff` (
  `staff_id` int(11) NOT NULL,
  `name` longtext COLLATE utf8_unicode_ci,
  `email` longtext COLLATE utf8_unicode_ci,
  `password` longtext COLLATE utf8_unicode_ci,
  `account_role_id` int(11) DEFAULT NULL,
  `phone` longtext COLLATE utf8_unicode_ci,
  `skype_id` longtext COLLATE utf8_unicode_ci,
  `facebook_profile_link` longtext COLLATE utf8_unicode_ci,
  `twitter_profile_link` longtext COLLATE utf8_unicode_ci,
  `linkedin_profile_link` longtext COLLATE utf8_unicode_ci,
  `chat_status` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'offline'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `staff`
--

INSERT INTO `staff` (`staff_id`, `name`, `email`, `password`, `account_role_id`, `phone`, `skype_id`, `facebook_profile_link`, `twitter_profile_link`, `linkedin_profile_link`, `chat_status`) VALUES
(1, 'Aket García', 'aketzaliarreguin@gmail.com', '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, '4771385376', '', '', '', '', 'offline'),
(2, 'Daniel Alejandro', 'carrilloriveradanielalejandro1@gmail.com', '7c4a8d09ca3762af61e59520943dc26494f8941b', 1, '', NULL, NULL, NULL, NULL, 'offline');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `support_canned_message`
--

CREATE TABLE `support_canned_message` (
  `support_canned_message_id` int(11) NOT NULL,
  `title` longtext COLLATE utf8_unicode_ci,
  `description` longtext COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `support_canned_message`
--

INSERT INTO `support_canned_message` (`support_canned_message_id`, `title`, `description`) VALUES
(1, 'Prueba', 'Hoy'),
(2, 'jjjj', 'hvhjgh');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `team_subtask`
--

CREATE TABLE `team_subtask` (
  `team_subtask_id` int(11) NOT NULL,
  `title` longtext COLLATE utf8_unicode_ci,
  `team_task_id` int(11) DEFAULT NULL,
  `subtask_status` int(11) NOT NULL DEFAULT '1' COMMENT '1 for incomplete , 0 for complete'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `team_task`
--

CREATE TABLE `team_task` (
  `team_task_id` int(11) NOT NULL,
  `task_title` longtext COLLATE utf8_unicode_ci,
  `client_id` int(11) NOT NULL,
  `task_note` longtext COLLATE utf8_unicode_ci,
  `assigned_staff_ids` longtext COLLATE utf8_unicode_ci,
  `creation_timestamp` longtext COLLATE utf8_unicode_ci,
  `due_timestamp` longtext COLLATE utf8_unicode_ci,
  `task_status` int(11) NOT NULL DEFAULT '1' COMMENT '0 for archived, 1 for running',
  `send_message` enum('0','1') COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `team_task`
--

INSERT INTO `team_task` (`team_task_id`, `task_title`, `client_id`, `task_note`, `assigned_staff_ids`, `creation_timestamp`, `due_timestamp`, `task_status`, `send_message`) VALUES
(8, 'Cita de: Yetlanezi', 5, '[October 7, 2022, 5:30 pm] - Se creó la cita', '2,', '1665360000', '1666051200', 1, '0');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `team_task_file`
--

CREATE TABLE `team_task_file` (
  `team_task_file_id` int(11) NOT NULL,
  `name` longtext COLLATE utf8_unicode_ci,
  `team_task_id` int(11) DEFAULT NULL,
  `upload_timestamp` longtext COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `team_task_file`
--

INSERT INTO `team_task_file` (`team_task_file_id`, `name`, `team_task_id`, `upload_timestamp`) VALUES
(1, 'WhatsApp Image 2022-09-13 at 1.57.45 PM.jpeg', 2, NULL),
(2, 'pata.png', 3, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ticket`
--

CREATE TABLE `ticket` (
  `ticket_id` int(11) NOT NULL,
  `title` longtext COLLATE utf8_unicode_ci,
  `ticket_code` longtext COLLATE utf8_unicode_ci,
  `status` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT 'opened closed',
  `priority` longtext COLLATE utf8_unicode_ci,
  `description` longtext COLLATE utf8_unicode_ci,
  `client_id` int(11) DEFAULT NULL,
  `assigned_staff_id` int(11) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  `timestamp` longtext COLLATE utf8_unicode_ci
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `ticket`
--

INSERT INTO `ticket` (`ticket_id`, `title`, `ticket_code`, `status`, `priority`, `description`, `client_id`, `assigned_staff_id`, `project_id`, `timestamp`) VALUES
(1, 'Cupón de sesión', 'a2e5036dc7e37c4', 'opened', 'high', NULL, 5, NULL, 6, '14 Sep,2022');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ticket_message`
--

CREATE TABLE `ticket_message` (
  `ticket_message_id` int(11) NOT NULL,
  `ticket_code` longtext COLLATE utf8_unicode_ci,
  `message` longtext COLLATE utf8_unicode_ci,
  `file` longtext COLLATE utf8_unicode_ci,
  `sender_type` longtext COLLATE utf8_unicode_ci,
  `sender_id` int(11) DEFAULT NULL,
  `timestamp` longtext COLLATE utf8_unicode_ci
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `ticket_message`
--

INSERT INTO `ticket_message` (`ticket_message_id`, `ticket_code`, `message`, `file`, `sender_type`, `sender_id`, `timestamp`) VALUES
(1, 'a2e5036dc7e37c4', 'ajahahafwguevnskjvndf.nb.djfkbnlfb', 'intern0-02.png', 'admin', 1, '14 Sep,2022');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `todo`
--

CREATE TABLE `todo` (
  `todo_id` int(11) NOT NULL,
  `title` longtext COLLATE utf8_unicode_ci,
  `user` longtext COLLATE utf8_unicode_ci,
  `status` int(11) NOT NULL DEFAULT '0',
  `order` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `todo`
--

INSERT INTO `todo` (`todo_id`, `title`, `user`, `status`, `order`) VALUES
(2, 'hola', 'staff-1', 1, 2);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `account_permission`
--
ALTER TABLE `account_permission`
  ADD PRIMARY KEY (`account_permission_id`);

--
-- Indices de la tabla `account_role`
--
ALTER TABLE `account_role`
  ADD PRIMARY KEY (`account_role_id`);

--
-- Indices de la tabla `addons`
--
ALTER TABLE `addons`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indices de la tabla `bookmark`
--
ALTER TABLE `bookmark`
  ADD PRIMARY KEY (`bookmark_id`);

--
-- Indices de la tabla `calendar_event`
--
ALTER TABLE `calendar_event`
  ADD PRIMARY KEY (`calendar_event_id`);

--
-- Indices de la tabla `chat`
--
ALTER TABLE `chat`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ci_sessions`
--
ALTER TABLE `ci_sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ci_sessions_timestamp` (`timestamp`);

--
-- Indices de la tabla `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`client_id`);

--
-- Indices de la tabla `client_pending`
--
ALTER TABLE `client_pending`
  ADD PRIMARY KEY (`client_pending_id`);

--
-- Indices de la tabla `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`company_id`);

--
-- Indices de la tabla `currency`
--
ALTER TABLE `currency`
  ADD PRIMARY KEY (`currency_id`);

--
-- Indices de la tabla `document`
--
ALTER TABLE `document`
  ADD PRIMARY KEY (`document_id`);

--
-- Indices de la tabla `email_template`
--
ALTER TABLE `email_template`
  ADD PRIMARY KEY (`email_template_id`);

--
-- Indices de la tabla `expense_category`
--
ALTER TABLE `expense_category`
  ADD PRIMARY KEY (`expense_category_id`);

--
-- Indices de la tabla `influencer`
--
ALTER TABLE `influencer`
  ADD PRIMARY KEY (`influencer_id`);

--
-- Indices de la tabla `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`invoice_id`);

--
-- Indices de la tabla `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`message_id`);

--
-- Indices de la tabla `message_thread`
--
ALTER TABLE `message_thread`
  ADD PRIMARY KEY (`message_thread_id`);

--
-- Indices de la tabla `note`
--
ALTER TABLE `note`
  ADD PRIMARY KEY (`note_id`);

--
-- Indices de la tabla `notice`
--
ALTER TABLE `notice`
  ADD PRIMARY KEY (`notice_id`);

--
-- Indices de la tabla `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`payment_id`);

--
-- Indices de la tabla `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`);

--
-- Indices de la tabla `project`
--
ALTER TABLE `project`
  ADD PRIMARY KEY (`project_id`);

--
-- Indices de la tabla `project_bug`
--
ALTER TABLE `project_bug`
  ADD PRIMARY KEY (`project_bug_id`);

--
-- Indices de la tabla `project_category`
--
ALTER TABLE `project_category`
  ADD PRIMARY KEY (`project_category_id`);

--
-- Indices de la tabla `project_file`
--
ALTER TABLE `project_file`
  ADD PRIMARY KEY (`project_file_id`);

--
-- Indices de la tabla `project_filler`
--
ALTER TABLE `project_filler`
  ADD PRIMARY KEY (`project_filler_id`);

--
-- Indices de la tabla `project_historia_clinica`
--
ALTER TABLE `project_historia_clinica`
  ADD PRIMARY KEY (`project_historia_clinica_id`);

--
-- Indices de la tabla `project_lab`
--
ALTER TABLE `project_lab`
  ADD PRIMARY KEY (`project_lab_id`);

--
-- Indices de la tabla `project_message`
--
ALTER TABLE `project_message`
  ADD PRIMARY KEY (`project_message_id`);

--
-- Indices de la tabla `project_milestone`
--
ALTER TABLE `project_milestone`
  ADD PRIMARY KEY (`project_milestone_id`);

--
-- Indices de la tabla `project_nota_evolucion`
--
ALTER TABLE `project_nota_evolucion`
  ADD PRIMARY KEY (`project_nota_evolucion_id`);

--
-- Indices de la tabla `project_progreso`
--
ALTER TABLE `project_progreso`
  ADD PRIMARY KEY (`project_progreso_id`);

--
-- Indices de la tabla `project_task`
--
ALTER TABLE `project_task`
  ADD PRIMARY KEY (`project_task_id`);

--
-- Indices de la tabla `project_timesheet`
--
ALTER TABLE `project_timesheet`
  ADD PRIMARY KEY (`project_timesheet_id`);

--
-- Indices de la tabla `project_toxina_botulinica`
--
ALTER TABLE `project_toxina_botulinica`
  ADD PRIMARY KEY (`project_toxina_botulinica_id`);

--
-- Indices de la tabla `quote`
--
ALTER TABLE `quote`
  ADD PRIMARY KEY (`quote_id`);

--
-- Indices de la tabla `quote_message`
--
ALTER TABLE `quote_message`
  ADD PRIMARY KEY (`quote_message_id`);

--
-- Indices de la tabla `schedule`
--
ALTER TABLE `schedule`
  ADD PRIMARY KEY (`schedule_id`);

--
-- Indices de la tabla `servicios`
--
ALTER TABLE `servicios`
  ADD PRIMARY KEY (`servicios_id`);

--
-- Indices de la tabla `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`settings_id`);

--
-- Indices de la tabla `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`staff_id`);

--
-- Indices de la tabla `support_canned_message`
--
ALTER TABLE `support_canned_message`
  ADD PRIMARY KEY (`support_canned_message_id`);

--
-- Indices de la tabla `team_subtask`
--
ALTER TABLE `team_subtask`
  ADD PRIMARY KEY (`team_subtask_id`);

--
-- Indices de la tabla `team_task`
--
ALTER TABLE `team_task`
  ADD PRIMARY KEY (`team_task_id`);

--
-- Indices de la tabla `team_task_file`
--
ALTER TABLE `team_task_file`
  ADD PRIMARY KEY (`team_task_file_id`);

--
-- Indices de la tabla `ticket`
--
ALTER TABLE `ticket`
  ADD PRIMARY KEY (`ticket_id`);

--
-- Indices de la tabla `ticket_message`
--
ALTER TABLE `ticket_message`
  ADD PRIMARY KEY (`ticket_message_id`);

--
-- Indices de la tabla `todo`
--
ALTER TABLE `todo`
  ADD PRIMARY KEY (`todo_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `account_permission`
--
ALTER TABLE `account_permission`
  MODIFY `account_permission_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `account_role`
--
ALTER TABLE `account_role`
  MODIFY `account_role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `addons`
--
ALTER TABLE `addons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `bookmark`
--
ALTER TABLE `bookmark`
  MODIFY `bookmark_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `calendar_event`
--
ALTER TABLE `calendar_event`
  MODIFY `calendar_event_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `chat`
--
ALTER TABLE `chat`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `client`
--
ALTER TABLE `client`
  MODIFY `client_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `client_pending`
--
ALTER TABLE `client_pending`
  MODIFY `client_pending_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `company`
--
ALTER TABLE `company`
  MODIFY `company_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `currency`
--
ALTER TABLE `currency`
  MODIFY `currency_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `document`
--
ALTER TABLE `document`
  MODIFY `document_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `email_template`
--
ALTER TABLE `email_template`
  MODIFY `email_template_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `expense_category`
--
ALTER TABLE `expense_category`
  MODIFY `expense_category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `influencer`
--
ALTER TABLE `influencer`
  MODIFY `influencer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `invoice`
--
ALTER TABLE `invoice`
  MODIFY `invoice_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `message`
--
ALTER TABLE `message`
  MODIFY `message_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `message_thread`
--
ALTER TABLE `message_thread`
  MODIFY `message_thread_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `note`
--
ALTER TABLE `note`
  MODIFY `note_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `notice`
--
ALTER TABLE `notice`
  MODIFY `notice_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `payment`
--
ALTER TABLE `payment`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `project`
--
ALTER TABLE `project`
  MODIFY `project_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `project_bug`
--
ALTER TABLE `project_bug`
  MODIFY `project_bug_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `project_category`
--
ALTER TABLE `project_category`
  MODIFY `project_category_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `project_file`
--
ALTER TABLE `project_file`
  MODIFY `project_file_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `project_filler`
--
ALTER TABLE `project_filler`
  MODIFY `project_filler_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `project_historia_clinica`
--
ALTER TABLE `project_historia_clinica`
  MODIFY `project_historia_clinica_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT de la tabla `project_lab`
--
ALTER TABLE `project_lab`
  MODIFY `project_lab_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `project_message`
--
ALTER TABLE `project_message`
  MODIFY `project_message_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `project_milestone`
--
ALTER TABLE `project_milestone`
  MODIFY `project_milestone_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `project_nota_evolucion`
--
ALTER TABLE `project_nota_evolucion`
  MODIFY `project_nota_evolucion_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `project_progreso`
--
ALTER TABLE `project_progreso`
  MODIFY `project_progreso_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `project_task`
--
ALTER TABLE `project_task`
  MODIFY `project_task_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `project_timesheet`
--
ALTER TABLE `project_timesheet`
  MODIFY `project_timesheet_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `project_toxina_botulinica`
--
ALTER TABLE `project_toxina_botulinica`
  MODIFY `project_toxina_botulinica_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `quote`
--
ALTER TABLE `quote`
  MODIFY `quote_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `quote_message`
--
ALTER TABLE `quote_message`
  MODIFY `quote_message_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `schedule`
--
ALTER TABLE `schedule`
  MODIFY `schedule_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `servicios`
--
ALTER TABLE `servicios`
  MODIFY `servicios_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `settings`
--
ALTER TABLE `settings`
  MODIFY `settings_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT de la tabla `staff`
--
ALTER TABLE `staff`
  MODIFY `staff_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `support_canned_message`
--
ALTER TABLE `support_canned_message`
  MODIFY `support_canned_message_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `team_subtask`
--
ALTER TABLE `team_subtask`
  MODIFY `team_subtask_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `team_task`
--
ALTER TABLE `team_task`
  MODIFY `team_task_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `team_task_file`
--
ALTER TABLE `team_task_file`
  MODIFY `team_task_file_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `ticket`
--
ALTER TABLE `ticket`
  MODIFY `ticket_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `ticket_message`
--
ALTER TABLE `ticket_message`
  MODIFY `ticket_message_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `todo`
--
ALTER TABLE `todo`
  MODIFY `todo_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
