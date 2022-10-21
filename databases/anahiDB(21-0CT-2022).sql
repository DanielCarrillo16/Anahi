-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:8888
-- Tiempo de generación: 21-10-2022 a las 14:30:04
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
('0ic88fe5rp0i8h4u9j9v4o5r31ti5jrc', '::1', 1666370189, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636363337303137313b6c6173745f706167657c733a35393a22687474703a2f2f6c6f63616c686f73743a383838382f6769742f616e6168692f696e6465782e7068702f61646d696e2f6e6f74696365626f617264223b61646d696e5f6c6f67696e7c733a313a2231223b6c6f67696e5f757365725f69647c733a313a2231223b6e616d657c733a373a22416e6168c3ad20223b6c6f67696e5f747970657c733a353a2261646d696e223b),
('20t6ngeqqjb3m7e45c54flb726otun8e', '::1', 1666365487, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636363336353438373b6c6173745f706167657c733a35393a22687474703a2f2f6c6f63616c686f73743a383838382f6769742f616e6168692f696e6465782e7068702f61646d696e2f6e6f74696365626f617264223b61646d696e5f6c6f67696e7c733a313a2231223b6c6f67696e5f757365725f69647c733a313a2231223b6e616d657c733a373a22416e6168c3ad20223b6c6f67696e5f747970657c733a353a2261646d696e223b),
('8jddk3qvggstfehph6evss9b430fl30d', '::1', 1666365186, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636363336353138363b6c6173745f706167657c733a35393a22687474703a2f2f6c6f63616c686f73743a383838382f6769742f616e6168692f696e6465782e7068702f61646d696e2f6e6f74696365626f617264223b61646d696e5f6c6f67696e7c733a313a2231223b6c6f67696e5f757365725f69647c733a313a2231223b6e616d657c733a373a22416e6168c3ad20223b6c6f67696e5f747970657c733a353a2261646d696e223b),
('ai1pj9dd9138arn41fugsq05fea39ap2', '::1', 1666366206, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636363336363230363b6c6173745f706167657c733a35393a22687474703a2f2f6c6f63616c686f73743a383838382f6769742f616e6168692f696e6465782e7068702f61646d696e2f6e6f74696365626f617264223b61646d696e5f6c6f67696e7c733a313a2231223b6c6f67696e5f757365725f69647c733a313a2231223b6e616d657c733a373a22416e6168c3ad20223b6c6f67696e5f747970657c733a353a2261646d696e223b),
('te8cle4itj1vnp2ug0rff5r1mj5sldle', '::1', 1666366695, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636363336363639353b6c6173745f706167657c733a35393a22687474703a2f2f6c6f63616c686f73743a383838382f6769742f616e6168692f696e6465782e7068702f61646d696e2f6e6f74696365626f617264223b61646d696e5f6c6f67696e7c733a313a2231223b6c6f67696e5f757365725f69647c733a313a2231223b6e616d657c733a373a22416e6168c3ad20223b6c6f67696e5f747970657c733a353a2261646d696e223b),
('telj46fruvl2u08mmf9ovb6jec3lhvj1', '::1', 1666370171, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636363337303137313b6c6173745f706167657c733a35393a22687474703a2f2f6c6f63616c686f73743a383838382f6769742f616e6168692f696e6465782e7068702f61646d696e2f6e6f74696365626f617264223b61646d696e5f6c6f67696e7c733a313a2231223b6c6f67696e5f757365725f69647c733a313a2231223b6e616d657c733a373a22416e6168c3ad20223b6c6f67696e5f747970657c733a353a2261646d696e223b),
('uv5om8ibmjukuoo9hg1peecombn1aku3', '::1', 1666379448, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636363337393234323b6c6173745f706167657c733a36323a22687474703a2f2f6c6f63616c686f73743a383838382f6769742f616e6168692f696e6465782e7068702f61646d696e2f7265706f72742f70726f6a656374223b61646d696e5f6c6f67696e7c733a313a2231223b6c6f67696e5f757365725f69647c733a313a2231223b6e616d657c733a373a22416e6168c3ad20223b6c6f67696e5f747970657c733a353a2261646d696e223b);

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
(4, ' Mendoza Navarro', 'admin@therejuvenateconcept.com', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'Luigi Pirandello 5451, Luigi Pirandello 5451, Luigi Pirandello 5451', '3322090166', '', '', '', '', '', '', 'offline'),
(5, 'Yetlanezi', 'aket_aga@hotmail.com', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'Cañada 304', '4777215252', NULL, '', '', '', '', 'Yetla', 'offline'),
(6, 'Sofia Herrera', 'sofia@gmail.com', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'Cañada 305', '4771385376', NULL, NULL, NULL, NULL, NULL, 'Cliente Norte', 'offline'),
(7, 'Julio Cesar', 'julio@anahi.com', '7c4a8d09ca3762af61e59520943dc26494f8941b', '', '3322503056', NULL, NULL, NULL, NULL, NULL, '', 'offline'),
(8, 'Daniel Carrillo', 'daniel@anahi.com', '7c4a8d09ca3762af61e59520943dc26494f8941b', '', '3312275426', NULL, NULL, NULL, NULL, NULL, '', 'offline'),
(9, 'José Fernando', 'fernando@anahi.com', '7c4a8d09ca3762af61e59520943dc26494f8941b', '', '3321624934', NULL, NULL, NULL, NULL, NULL, '', 'offline'),
(10, 'Andrea Guadalupe', 'admin@anahi.com', '7c4a8d09ca3762af61e59520943dc26494f8941b', '', '3315634756', NULL, NULL, NULL, NULL, NULL, '', 'offline'),
(11, 'Anahi', 'anahi@anahi.com', '7c4a8d09ca3762af61e59520943dc26494f8941b', '', '2281775791', NULL, NULL, NULL, NULL, NULL, '', 'offline'),
(12, 'Aketzali', 'ake@anahi.com', '7c4a8d09ca3762af61e59520943dc26494f8941b', '', '4777215252', NULL, NULL, NULL, NULL, NULL, '', 'offline'),
(13, 'Sandra', 'sandra@anahi.com', '7c4a8d09ca3762af61e59520943dc26494f8941b', '', '4771385376', NULL, NULL, NULL, NULL, NULL, '', 'offline');

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
-- Estructura de tabla para la tabla `logs`
--

CREATE TABLE `logs` (
  `id` int(11) NOT NULL,
  `description` longtext NOT NULL,
  `date` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `logs`
--

INSERT INTO `logs` (`id`, `description`, `date`) VALUES
(5, 'No se han encontrado fechas', '0000-00-00 00:00:00'),
(6, 'No se han encontrado fechas', '1665604919'),
(7, 'MENSAJE ENVIADO; DATA: {\"body\": \"Hola Daniel Carrillo, te saludo. \\r\\nTengo una cita con usted el d\\u00eda 13-10-2022, \\u00bfPodr\\u00eda ser tan amable de confirmarme por este medio la cita?. \\r\\nDe antemano, muchas gracias y buen d\\u00eda.\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Wed, 12 Oct 2022 20:10:42 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM7f0eb5db50e6569c7c428dbb9cc9c225.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5213312275426\", \"date_created\": \"Wed, 12 Oct 2022 20:10:42 +0000\", \"status\": \"queued\", \"sid\": \"SM7f0eb5db50e6569c7c428dbb9cc9c225\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM7f0eb5db50e6569c7c428dbb9cc9c225/Media.json\"}}', '1665605442'),
(8, 'No se han encontrado fechas', '1665605491'),
(9, 'MENSAJE ENVIADO; DATA: {\"body\": \"Con el gusto de saludarte, el d\\u00eda 18 de octubre del presente a\\u00f1o, cerraremos nuestros servicios a partir de las 3:00 PM.\\r\\nDe antemano muchas gracias y buen d\\u00eda.\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Mon, 17 Oct 2022 19:27:20 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM76f565185375c7c3f3dbed632b58cf8a.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5213322090166\", \"date_created\": \"Mon, 17 Oct 2022 19:27:20 +0000\", \"status\": \"queued\", \"sid\": \"SM76f565185375c7c3f3dbed632b58cf8a\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM76f565185375c7c3f3dbed632b58cf8a/Media.json\"}}', '1666034840'),
(10, 'MENSAJE ENVIADO; DATA: {\"body\": \"Con el gusto de saludarte, el d\\u00eda 18 de octubre del presente a\\u00f1o, cerraremos nuestros servicios a partir de las 3:00 PM.\\r\\nDe antemano muchas gracias y buen d\\u00eda.\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Mon, 17 Oct 2022 19:27:20 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SMc9681c78b6190ef43670f5915548a9ef.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5214777215252\", \"date_created\": \"Mon, 17 Oct 2022 19:27:20 +0000\", \"status\": \"queued\", \"sid\": \"SMc9681c78b6190ef43670f5915548a9ef\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SMc9681c78b6190ef43670f5915548a9ef/Media.json\"}}', '1666034840'),
(11, 'MENSAJE ENVIADO; DATA: {\"body\": \"Con el gusto de saludarte, el d\\u00eda 18 de octubre del presente a\\u00f1o, cerraremos nuestros servicios a partir de las 3:00 PM.\\r\\nDe antemano muchas gracias y buen d\\u00eda.\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Mon, 17 Oct 2022 19:27:21 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SMac89439fe16970694044d7b9a8a84f5c.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5214771385376\", \"date_created\": \"Mon, 17 Oct 2022 19:27:21 +0000\", \"status\": \"queued\", \"sid\": \"SMac89439fe16970694044d7b9a8a84f5c\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SMac89439fe16970694044d7b9a8a84f5c/Media.json\"}}', '1666034841'),
(12, 'MENSAJE ENVIADO; DATA: {\"body\": \"Con el gusto de saludarte, el d\\u00eda 18 de octubre del presente a\\u00f1o, cerraremos nuestros servicios a partir de las 3:00 PM.\\r\\nDe antemano muchas gracias y buen d\\u00eda.\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Mon, 17 Oct 2022 19:27:21 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM60195dd6d4e7b1e79c2bee09a4a9b4dc.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5213322503056\", \"date_created\": \"Mon, 17 Oct 2022 19:27:21 +0000\", \"status\": \"queued\", \"sid\": \"SM60195dd6d4e7b1e79c2bee09a4a9b4dc\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM60195dd6d4e7b1e79c2bee09a4a9b4dc/Media.json\"}}', '1666034841'),
(13, 'MENSAJE ENVIADO; DATA: {\"body\": \"Con el gusto de saludarte, el d\\u00eda 18 de octubre del presente a\\u00f1o, cerraremos nuestros servicios a partir de las 3:00 PM.\\r\\nDe antemano muchas gracias y buen d\\u00eda.\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Mon, 17 Oct 2022 19:27:22 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM81aad808da8520cb30392721c3d45860.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5213312275426\", \"date_created\": \"Mon, 17 Oct 2022 19:27:22 +0000\", \"status\": \"queued\", \"sid\": \"SM81aad808da8520cb30392721c3d45860\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM81aad808da8520cb30392721c3d45860/Media.json\"}}', '1666034842'),
(14, 'MENSAJE ENVIADO; DATA: {\"body\": \"Con el gusto de saludarte, el d\\u00eda 18 de octubre del presente a\\u00f1o, cerraremos nuestros servicios a partir de las 3:00 PM.\\r\\nDe antemano muchas gracias y buen d\\u00eda.\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Mon, 17 Oct 2022 19:27:22 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SMf1cfd888dcc2b39aac0997ed822d9886.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5213321624934\", \"date_created\": \"Mon, 17 Oct 2022 19:27:22 +0000\", \"status\": \"queued\", \"sid\": \"SMf1cfd888dcc2b39aac0997ed822d9886\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SMf1cfd888dcc2b39aac0997ed822d9886/Media.json\"}}', '1666034842'),
(15, 'MENSAJE ENVIADO; DATA: {\"body\": \"Con el gusto de saludarte, el d\\u00eda 18 de octubre del presente a\\u00f1o, cerraremos nuestros servicios a partir de las 3:00 PM.\\r\\nDe antemano muchas gracias y buen d\\u00eda.\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Mon, 17 Oct 2022 19:27:23 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM94c28d3c842209813b5d38781f9fbc5e.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5213315634756\", \"date_created\": \"Mon, 17 Oct 2022 19:27:23 +0000\", \"status\": \"queued\", \"sid\": \"SM94c28d3c842209813b5d38781f9fbc5e\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM94c28d3c842209813b5d38781f9fbc5e/Media.json\"}}', '1666034843'),
(16, 'MENSAJE ENVIADO; DATA: {\"body\": \"Con el gusto de saludarte, el d\\u00eda 18 de octubre del presente a\\u00f1o, cerraremos nuestros servicios a partir de las 3:00 PM.\\r\\nDe antemano muchas gracias y buen d\\u00eda.\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Mon, 17 Oct 2022 19:27:23 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SMd28af532f54b8367ad21bb3c866c22ba.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5212281775791\", \"date_created\": \"Mon, 17 Oct 2022 19:27:23 +0000\", \"status\": \"queued\", \"sid\": \"SMd28af532f54b8367ad21bb3c866c22ba\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SMd28af532f54b8367ad21bb3c866c22ba/Media.json\"}}', '1666034843'),
(17, 'MENSAJE ENVIADO; DATA: {\"body\": \"Con el gusto de saludarte, el d\\u00eda 18 de octubre del presente a\\u00f1o, cerraremos nuestros servicios a partir de las 3:00 PM.\\r\\nDe antemano muchas gracias y buen d\\u00eda.\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Mon, 17 Oct 2022 19:27:24 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM9fc29cb752d5aabc8394ee3b4cdd8a93.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5214777215252\", \"date_created\": \"Mon, 17 Oct 2022 19:27:24 +0000\", \"status\": \"queued\", \"sid\": \"SM9fc29cb752d5aabc8394ee3b4cdd8a93\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM9fc29cb752d5aabc8394ee3b4cdd8a93/Media.json\"}}', '1666034844'),
(18, 'MENSAJE ENVIADO; DATA: {\"body\": \"Con el gusto de saludarte, el d\\u00eda 18 de octubre del presente a\\u00f1o, cerraremos nuestros servicios a partir de las 3:00 PM.\\r\\nDe antemano muchas gracias y buen d\\u00eda.\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Mon, 17 Oct 2022 19:27:24 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SMb161e4657ff9b78e933c677726a5e2e9.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5214771385376\", \"date_created\": \"Mon, 17 Oct 2022 19:27:24 +0000\", \"status\": \"queued\", \"sid\": \"SMb161e4657ff9b78e933c677726a5e2e9\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SMb161e4657ff9b78e933c677726a5e2e9/Media.json\"}}', '1666034844'),
(19, 'MENSAJE ENVIADO; DATA: {\"body\": \"Este es un aviso de prueba\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Mon, 17 Oct 2022 19:29:16 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM41305185088d6e865af1b1ee9161943f.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5213322090166\", \"date_created\": \"Mon, 17 Oct 2022 19:29:16 +0000\", \"status\": \"queued\", \"sid\": \"SM41305185088d6e865af1b1ee9161943f\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM41305185088d6e865af1b1ee9161943f/Media.json\"}}', '1666034956'),
(20, 'MENSAJE ENVIADO; DATA: {\"body\": \"Este es un aviso de prueba\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Mon, 17 Oct 2022 19:29:17 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM5b1ef95a67782722d70b133b3bbaa500.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5214777215252\", \"date_created\": \"Mon, 17 Oct 2022 19:29:17 +0000\", \"status\": \"queued\", \"sid\": \"SM5b1ef95a67782722d70b133b3bbaa500\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM5b1ef95a67782722d70b133b3bbaa500/Media.json\"}}', '1666034957'),
(21, 'MENSAJE ENVIADO; DATA: {\"body\": \"Este es un aviso de prueba\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Mon, 17 Oct 2022 19:29:17 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SMd63d010b658511a4e51b13f98fc6da37.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5214771385376\", \"date_created\": \"Mon, 17 Oct 2022 19:29:17 +0000\", \"status\": \"queued\", \"sid\": \"SMd63d010b658511a4e51b13f98fc6da37\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SMd63d010b658511a4e51b13f98fc6da37/Media.json\"}}', '1666034957'),
(22, 'MENSAJE ENVIADO; DATA: {\"body\": \"Este es un aviso de prueba\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Mon, 17 Oct 2022 19:29:18 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM7a852afad28d2f4cc62b5f402903e1f6.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5213322503056\", \"date_created\": \"Mon, 17 Oct 2022 19:29:18 +0000\", \"status\": \"queued\", \"sid\": \"SM7a852afad28d2f4cc62b5f402903e1f6\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM7a852afad28d2f4cc62b5f402903e1f6/Media.json\"}}', '1666034958'),
(23, 'MENSAJE ENVIADO; DATA: {\"body\": \"Este es un aviso de prueba\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Mon, 17 Oct 2022 19:29:18 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM12c1b4be1377f9f3fffea1a76b6651a3.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5213312275426\", \"date_created\": \"Mon, 17 Oct 2022 19:29:18 +0000\", \"status\": \"queued\", \"sid\": \"SM12c1b4be1377f9f3fffea1a76b6651a3\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM12c1b4be1377f9f3fffea1a76b6651a3/Media.json\"}}', '1666034958'),
(24, 'MENSAJE ENVIADO; DATA: {\"body\": \"Este es un aviso de prueba\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Mon, 17 Oct 2022 19:29:18 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM919ca675392ecc89dea32c332a058306.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5213321624934\", \"date_created\": \"Mon, 17 Oct 2022 19:29:18 +0000\", \"status\": \"queued\", \"sid\": \"SM919ca675392ecc89dea32c332a058306\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM919ca675392ecc89dea32c332a058306/Media.json\"}}', '1666034959'),
(25, 'MENSAJE ENVIADO; DATA: {\"body\": \"Este es un aviso de prueba\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Mon, 17 Oct 2022 19:29:19 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM319eeb6e66cddfd4cf16ecf28ac908f9.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5213315634756\", \"date_created\": \"Mon, 17 Oct 2022 19:29:19 +0000\", \"status\": \"queued\", \"sid\": \"SM319eeb6e66cddfd4cf16ecf28ac908f9\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM319eeb6e66cddfd4cf16ecf28ac908f9/Media.json\"}}', '1666034959'),
(26, 'MENSAJE ENVIADO; DATA: {\"body\": \"Este es un aviso de prueba\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Mon, 17 Oct 2022 19:29:19 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM0446be7668b76d54ff859e6dea0aa957.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5212281775791\", \"date_created\": \"Mon, 17 Oct 2022 19:29:19 +0000\", \"status\": \"queued\", \"sid\": \"SM0446be7668b76d54ff859e6dea0aa957\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM0446be7668b76d54ff859e6dea0aa957/Media.json\"}}', '1666034959'),
(27, 'MENSAJE ENVIADO; DATA: {\"body\": \"Este es un aviso de prueba\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Mon, 17 Oct 2022 19:29:20 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM2e05a70763d9a6887275f2b3b9ceeaaa.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5214777215252\", \"date_created\": \"Mon, 17 Oct 2022 19:29:20 +0000\", \"status\": \"queued\", \"sid\": \"SM2e05a70763d9a6887275f2b3b9ceeaaa\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM2e05a70763d9a6887275f2b3b9ceeaaa/Media.json\"}}', '1666034960'),
(28, 'MENSAJE ENVIADO; DATA: {\"body\": \"Este es un aviso de prueba\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Mon, 17 Oct 2022 19:29:20 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM4e98a7133979ddbdf03ef01f1943f505.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5214771385376\", \"date_created\": \"Mon, 17 Oct 2022 19:29:20 +0000\", \"status\": \"queued\", \"sid\": \"SM4e98a7133979ddbdf03ef01f1943f505\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM4e98a7133979ddbdf03ef01f1943f505/Media.json\"}}', '1666034960'),
(29, 'MENSAJE ENVIADO; DATA: {\"body\": \"No olvides agendar m\\u00e1ximo 3 d\\u00edas antes de tu cita\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Mon, 17 Oct 2022 20:40:58 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SMa818364ed549f1e36415fe2633914d9c.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5213322090166\", \"date_created\": \"Mon, 17 Oct 2022 20:40:58 +0000\", \"status\": \"queued\", \"sid\": \"SMa818364ed549f1e36415fe2633914d9c\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SMa818364ed549f1e36415fe2633914d9c/Media.json\"}}', '1666039258'),
(30, 'MENSAJE ENVIADO; DATA: {\"body\": \"No olvides agendar m\\u00e1ximo 3 d\\u00edas antes de tu cita\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Mon, 17 Oct 2022 20:40:59 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SMced148f5fee6871553268a222abeacb9.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5214777215252\", \"date_created\": \"Mon, 17 Oct 2022 20:40:59 +0000\", \"status\": \"queued\", \"sid\": \"SMced148f5fee6871553268a222abeacb9\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SMced148f5fee6871553268a222abeacb9/Media.json\"}}', '1666039259'),
(31, 'MENSAJE ENVIADO; DATA: {\"body\": \"No olvides agendar m\\u00e1ximo 3 d\\u00edas antes de tu cita\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Mon, 17 Oct 2022 20:40:59 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM0bdd6a578b6c18c4b4c7ed902705514d.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5214771385376\", \"date_created\": \"Mon, 17 Oct 2022 20:40:59 +0000\", \"status\": \"queued\", \"sid\": \"SM0bdd6a578b6c18c4b4c7ed902705514d\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM0bdd6a578b6c18c4b4c7ed902705514d/Media.json\"}}', '1666039259'),
(32, 'MENSAJE ENVIADO; DATA: {\"body\": \"No olvides agendar m\\u00e1ximo 3 d\\u00edas antes de tu cita\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Mon, 17 Oct 2022 20:41:00 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM316ad47360a377f97f3c32772e36b779.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5213322503056\", \"date_created\": \"Mon, 17 Oct 2022 20:41:00 +0000\", \"status\": \"queued\", \"sid\": \"SM316ad47360a377f97f3c32772e36b779\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM316ad47360a377f97f3c32772e36b779/Media.json\"}}', '1666039260'),
(33, 'MENSAJE ENVIADO; DATA: {\"body\": \"No olvides agendar m\\u00e1ximo 3 d\\u00edas antes de tu cita\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Mon, 17 Oct 2022 20:41:00 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SMcb2dcae5f59138ee62ce05bf2f161879.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5213312275426\", \"date_created\": \"Mon, 17 Oct 2022 20:41:00 +0000\", \"status\": \"queued\", \"sid\": \"SMcb2dcae5f59138ee62ce05bf2f161879\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SMcb2dcae5f59138ee62ce05bf2f161879/Media.json\"}}', '1666039260'),
(34, 'MENSAJE ENVIADO; DATA: {\"body\": \"No olvides agendar m\\u00e1ximo 3 d\\u00edas antes de tu cita\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Mon, 17 Oct 2022 20:41:01 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM40407f7cdd9ec548832f8de07461c1d2.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5213321624934\", \"date_created\": \"Mon, 17 Oct 2022 20:41:01 +0000\", \"status\": \"queued\", \"sid\": \"SM40407f7cdd9ec548832f8de07461c1d2\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM40407f7cdd9ec548832f8de07461c1d2/Media.json\"}}', '1666039261'),
(35, 'MENSAJE ENVIADO; DATA: {\"body\": \"No olvides agendar m\\u00e1ximo 3 d\\u00edas antes de tu cita\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Mon, 17 Oct 2022 20:41:02 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM80bce96c06d69109401dd555941d7627.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5213315634756\", \"date_created\": \"Mon, 17 Oct 2022 20:41:02 +0000\", \"status\": \"queued\", \"sid\": \"SM80bce96c06d69109401dd555941d7627\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM80bce96c06d69109401dd555941d7627/Media.json\"}}', '1666039262'),
(36, 'MENSAJE ENVIADO; DATA: {\"body\": \"No olvides agendar m\\u00e1ximo 3 d\\u00edas antes de tu cita\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Mon, 17 Oct 2022 20:41:03 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM13bc7b950f89615448d55fffdc9ef97a.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5212281775791\", \"date_created\": \"Mon, 17 Oct 2022 20:41:03 +0000\", \"status\": \"queued\", \"sid\": \"SM13bc7b950f89615448d55fffdc9ef97a\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM13bc7b950f89615448d55fffdc9ef97a/Media.json\"}}', '1666039263'),
(37, 'MENSAJE ENVIADO; DATA: {\"body\": \"No olvides agendar m\\u00e1ximo 3 d\\u00edas antes de tu cita\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Mon, 17 Oct 2022 20:41:03 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SMf8d1c0af37b1da7238b9d680ef651361.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5214777215252\", \"date_created\": \"Mon, 17 Oct 2022 20:41:03 +0000\", \"status\": \"queued\", \"sid\": \"SMf8d1c0af37b1da7238b9d680ef651361\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SMf8d1c0af37b1da7238b9d680ef651361/Media.json\"}}', '1666039263'),
(38, 'MENSAJE ENVIADO; DATA: {\"body\": \"No olvides agendar m\\u00e1ximo 3 d\\u00edas antes de tu cita\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Mon, 17 Oct 2022 20:41:04 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SMd8658dfacf6e7e22b6dfe6c08c72f893.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5214771385376\", \"date_created\": \"Mon, 17 Oct 2022 20:41:04 +0000\", \"status\": \"queued\", \"sid\": \"SMd8658dfacf6e7e22b6dfe6c08c72f893\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SMd8658dfacf6e7e22b6dfe6c08c72f893/Media.json\"}}', '1666039264'),
(39, 'MENSAJE ENVIADO; DATA: {\"body\": \"Buen d\\u00eda, le recuerdo que el d\\u00eda 25 de oct, no se laborar\\u00e1, favor de confirmar por este medio. Gracias y buen d\\u00eda.\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Mon, 17 Oct 2022 20:50:38 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM21155b090a3a5fd523f4e25b9f8473bd.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5214771385376\", \"date_created\": \"Mon, 17 Oct 2022 20:50:38 +0000\", \"status\": \"queued\", \"sid\": \"SM21155b090a3a5fd523f4e25b9f8473bd\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM21155b090a3a5fd523f4e25b9f8473bd/Media.json\"}}', '1666039837'),
(40, 'MENSAJE ENVIADO; DATA: {\"body\": \"Buen d\\u00eda, le recuerdo que el d\\u00eda 25 de oct, no se laborar\\u00e1, favor de confirmar por este medio. Gracias y buen d\\u00eda.\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Mon, 17 Oct 2022 20:50:38 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM9c9c53be20c5c80481a7a5353541b7c3.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5213312275426\", \"date_created\": \"Mon, 17 Oct 2022 20:50:38 +0000\", \"status\": \"queued\", \"sid\": \"SM9c9c53be20c5c80481a7a5353541b7c3\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM9c9c53be20c5c80481a7a5353541b7c3/Media.json\"}}', '1666039838'),
(41, 'MENSAJE ENVIADO; DATA: {\"body\": \"fdsfd\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Tue, 18 Oct 2022 20:41:59 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM81f1316b1920615f955b4deceb228d2b.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5213322090166\", \"date_created\": \"Tue, 18 Oct 2022 20:41:59 +0000\", \"status\": \"queued\", \"sid\": \"SM81f1316b1920615f955b4deceb228d2b\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM81f1316b1920615f955b4deceb228d2b/Media.json\"}}', '1666125720'),
(42, 'MENSAJE ENVIADO; DATA: {\"body\": \"fdsfd\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Tue, 18 Oct 2022 20:42:00 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SMbefcdf1ce7997fd237dcb51f21c1a996.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5214777215252\", \"date_created\": \"Tue, 18 Oct 2022 20:42:00 +0000\", \"status\": \"queued\", \"sid\": \"SMbefcdf1ce7997fd237dcb51f21c1a996\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SMbefcdf1ce7997fd237dcb51f21c1a996/Media.json\"}}', '1666125720'),
(43, 'MENSAJE ENVIADO; DATA: {\"body\": \"fdsfd\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Tue, 18 Oct 2022 20:42:00 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SMcc5c937eeecc70ccfa661193fe32c9b0.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5214771385376\", \"date_created\": \"Tue, 18 Oct 2022 20:42:00 +0000\", \"status\": \"queued\", \"sid\": \"SMcc5c937eeecc70ccfa661193fe32c9b0\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SMcc5c937eeecc70ccfa661193fe32c9b0/Media.json\"}}', '1666125720'),
(44, 'MENSAJE ENVIADO; DATA: {\"body\": \"fdsfd\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Tue, 18 Oct 2022 20:42:01 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM9d366c8ae9f46dfc8aa763beb79dca0d.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5213322503056\", \"date_created\": \"Tue, 18 Oct 2022 20:42:01 +0000\", \"status\": \"queued\", \"sid\": \"SM9d366c8ae9f46dfc8aa763beb79dca0d\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM9d366c8ae9f46dfc8aa763beb79dca0d/Media.json\"}}', '1666125721'),
(45, 'MENSAJE ENVIADO; DATA: {\"body\": \"fdsfd\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Tue, 18 Oct 2022 20:42:02 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM4f86bc4bac454996065c8e3bb4143005.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5213312275426\", \"date_created\": \"Tue, 18 Oct 2022 20:42:02 +0000\", \"status\": \"queued\", \"sid\": \"SM4f86bc4bac454996065c8e3bb4143005\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM4f86bc4bac454996065c8e3bb4143005/Media.json\"}}', '1666125722'),
(46, 'MENSAJE ENVIADO; DATA: {\"body\": \"fdsfd\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Tue, 18 Oct 2022 20:42:02 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM8e47af06b35cd94fc3182c78043b710e.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5213321624934\", \"date_created\": \"Tue, 18 Oct 2022 20:42:02 +0000\", \"status\": \"queued\", \"sid\": \"SM8e47af06b35cd94fc3182c78043b710e\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM8e47af06b35cd94fc3182c78043b710e/Media.json\"}}', '1666125722'),
(47, 'MENSAJE ENVIADO; DATA: {\"body\": \"fdsfd\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Tue, 18 Oct 2022 20:42:03 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SMf9268631fcfd05a37c27b9d700b455ef.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5213315634756\", \"date_created\": \"Tue, 18 Oct 2022 20:42:03 +0000\", \"status\": \"queued\", \"sid\": \"SMf9268631fcfd05a37c27b9d700b455ef\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SMf9268631fcfd05a37c27b9d700b455ef/Media.json\"}}', '1666125723'),
(48, 'MENSAJE ENVIADO; DATA: {\"body\": \"fdsfd\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Tue, 18 Oct 2022 20:42:03 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM7a5dcb76060c9cf6f7f04d29871b81e9.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5212281775791\", \"date_created\": \"Tue, 18 Oct 2022 20:42:03 +0000\", \"status\": \"queued\", \"sid\": \"SM7a5dcb76060c9cf6f7f04d29871b81e9\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM7a5dcb76060c9cf6f7f04d29871b81e9/Media.json\"}}', '1666125723'),
(49, 'MENSAJE ENVIADO; DATA: {\"body\": \"fdsfd\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Tue, 18 Oct 2022 20:42:03 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SMe6e25807752feebf277e2bfaa96170f2.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5214777215252\", \"date_created\": \"Tue, 18 Oct 2022 20:42:03 +0000\", \"status\": \"queued\", \"sid\": \"SMe6e25807752feebf277e2bfaa96170f2\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SMe6e25807752feebf277e2bfaa96170f2/Media.json\"}}', '1666125724'),
(50, 'MENSAJE ENVIADO; DATA: {\"body\": \"fdsfd\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Tue, 18 Oct 2022 20:42:04 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM0f448d5d115234134f2f2c9896f6a1b6.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5214771385376\", \"date_created\": \"Tue, 18 Oct 2022 20:42:04 +0000\", \"status\": \"queued\", \"sid\": \"SM0f448d5d115234134f2f2c9896f6a1b6\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM0f448d5d115234134f2f2c9896f6a1b6/Media.json\"}}', '1666125724'),
(51, 'MENSAJE ENVIADO; DATA: {\"body\": \"fdsfd\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Tue, 18 Oct 2022 20:42:11 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM4138e0a07308330fa001996324ab4686.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5213322090166\", \"date_created\": \"Tue, 18 Oct 2022 20:42:11 +0000\", \"status\": \"queued\", \"sid\": \"SM4138e0a07308330fa001996324ab4686\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM4138e0a07308330fa001996324ab4686/Media.json\"}}', '1666125731'),
(52, 'MENSAJE ENVIADO; DATA: {\"body\": \"fdsfd\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Tue, 18 Oct 2022 20:42:11 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM3eee69826a37b247d7ebaa649e44fdb4.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5214777215252\", \"date_created\": \"Tue, 18 Oct 2022 20:42:11 +0000\", \"status\": \"queued\", \"sid\": \"SM3eee69826a37b247d7ebaa649e44fdb4\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM3eee69826a37b247d7ebaa649e44fdb4/Media.json\"}}', '1666125731'),
(53, 'MENSAJE ENVIADO; DATA: {\"body\": \"fdsfd\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Tue, 18 Oct 2022 20:42:12 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM022ef4678627867bcd17154e8a0ee969.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5214771385376\", \"date_created\": \"Tue, 18 Oct 2022 20:42:12 +0000\", \"status\": \"queued\", \"sid\": \"SM022ef4678627867bcd17154e8a0ee969\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM022ef4678627867bcd17154e8a0ee969/Media.json\"}}', '1666125732'),
(54, 'MENSAJE ENVIADO; DATA: {\"body\": \"fdsfd\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Tue, 18 Oct 2022 20:42:12 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM92ab3c51a658ffd159d9c21ceed1bf56.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5213322503056\", \"date_created\": \"Tue, 18 Oct 2022 20:42:12 +0000\", \"status\": \"queued\", \"sid\": \"SM92ab3c51a658ffd159d9c21ceed1bf56\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM92ab3c51a658ffd159d9c21ceed1bf56/Media.json\"}}', '1666125732'),
(55, 'MENSAJE NO ENVIADO; DATA: {\"code\": 63018, \"message\": \"Account ACdbba939db69ef782da3c5c0cc31c63ae exceeded the 1 rps rate limit\", \"more_info\": \"https://www.twilio.com/docs/errors/63018\", \"status\": 429}', '1666125733'),
(56, 'MENSAJE ENVIADO; DATA: {\"body\": \"fdsfd\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Tue, 18 Oct 2022 20:42:13 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM07f854b6a0bf228141f04f3371e68286.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5213321624934\", \"date_created\": \"Tue, 18 Oct 2022 20:42:13 +0000\", \"status\": \"queued\", \"sid\": \"SM07f854b6a0bf228141f04f3371e68286\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM07f854b6a0bf228141f04f3371e68286/Media.json\"}}', '1666125733'),
(57, 'MENSAJE NO ENVIADO; DATA: {\"code\": 63018, \"message\": \"Account ACdbba939db69ef782da3c5c0cc31c63ae exceeded the 1 rps rate limit\", \"more_info\": \"https://www.twilio.com/docs/errors/63018\", \"status\": 429}', '1666125733'),
(58, 'MENSAJE NO ENVIADO; DATA: {\"code\": 63018, \"message\": \"Account ACdbba939db69ef782da3c5c0cc31c63ae exceeded the 1 rps rate limit\", \"more_info\": \"https://www.twilio.com/docs/errors/63018\", \"status\": 429}', '1666125734'),
(59, 'MENSAJE ENVIADO; DATA: {\"body\": \"fdsfd\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Tue, 18 Oct 2022 20:42:14 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM106266ecd6af799113c45b599083a3aa.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5214777215252\", \"date_created\": \"Tue, 18 Oct 2022 20:42:14 +0000\", \"status\": \"queued\", \"sid\": \"SM106266ecd6af799113c45b599083a3aa\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM106266ecd6af799113c45b599083a3aa/Media.json\"}}', '1666125734'),
(60, 'MENSAJE NO ENVIADO; DATA: {\"code\": 63018, \"message\": \"Account ACdbba939db69ef782da3c5c0cc31c63ae exceeded the 1 rps rate limit\", \"more_info\": \"https://www.twilio.com/docs/errors/63018\", \"status\": 429}', '1666125735'),
(61, 'MENSAJE ENVIADO; DATA: {\"body\": \"fdsfd\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Tue, 18 Oct 2022 20:44:10 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM68e06973c8f15bf4d70cae171367abdc.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5213322090166\", \"date_created\": \"Tue, 18 Oct 2022 20:44:10 +0000\", \"status\": \"queued\", \"sid\": \"SM68e06973c8f15bf4d70cae171367abdc\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM68e06973c8f15bf4d70cae171367abdc/Media.json\"}}', '1666125850');
INSERT INTO `logs` (`id`, `description`, `date`) VALUES
(62, 'MENSAJE ENVIADO; DATA: {\"body\": \"fdsfd\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Tue, 18 Oct 2022 20:44:11 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM2ee25a07acb3b80157a841f7bbda0375.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5214777215252\", \"date_created\": \"Tue, 18 Oct 2022 20:44:11 +0000\", \"status\": \"queued\", \"sid\": \"SM2ee25a07acb3b80157a841f7bbda0375\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM2ee25a07acb3b80157a841f7bbda0375/Media.json\"}}', '1666125851'),
(63, 'MENSAJE ENVIADO; DATA: {\"body\": \"fdsfd\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Tue, 18 Oct 2022 20:44:11 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM5969eb58f9ad0df65e1a8dc96f508bef.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5214771385376\", \"date_created\": \"Tue, 18 Oct 2022 20:44:11 +0000\", \"status\": \"queued\", \"sid\": \"SM5969eb58f9ad0df65e1a8dc96f508bef\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM5969eb58f9ad0df65e1a8dc96f508bef/Media.json\"}}', '1666125851'),
(64, 'MENSAJE ENVIADO; DATA: {\"body\": \"fdsfd\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Tue, 18 Oct 2022 20:44:12 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SMe33b77ce88f22d952a62f13640b24380.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5213322503056\", \"date_created\": \"Tue, 18 Oct 2022 20:44:12 +0000\", \"status\": \"queued\", \"sid\": \"SMe33b77ce88f22d952a62f13640b24380\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SMe33b77ce88f22d952a62f13640b24380/Media.json\"}}', '1666125852'),
(65, 'MENSAJE ENVIADO; DATA: {\"body\": \"fdsfd\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Tue, 18 Oct 2022 20:44:12 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SMbfea8222936609106f63c9f6df371a58.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5213312275426\", \"date_created\": \"Tue, 18 Oct 2022 20:44:12 +0000\", \"status\": \"queued\", \"sid\": \"SMbfea8222936609106f63c9f6df371a58\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SMbfea8222936609106f63c9f6df371a58/Media.json\"}}', '1666125852'),
(66, 'MENSAJE ENVIADO; DATA: {\"body\": \"fdsfd\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Tue, 18 Oct 2022 20:44:12 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SMcd290dfeea178babee15dbf5e147e1e9.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5213321624934\", \"date_created\": \"Tue, 18 Oct 2022 20:44:12 +0000\", \"status\": \"queued\", \"sid\": \"SMcd290dfeea178babee15dbf5e147e1e9\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SMcd290dfeea178babee15dbf5e147e1e9/Media.json\"}}', '1666125852'),
(67, 'MENSAJE ENVIADO; DATA: {\"body\": \"fdsfd\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Tue, 18 Oct 2022 20:44:13 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM164182819be998fcd15ad5bfa04b0393.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5213315634756\", \"date_created\": \"Tue, 18 Oct 2022 20:44:13 +0000\", \"status\": \"queued\", \"sid\": \"SM164182819be998fcd15ad5bfa04b0393\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM164182819be998fcd15ad5bfa04b0393/Media.json\"}}', '1666125853'),
(68, 'MENSAJE ENVIADO; DATA: {\"body\": \"fdsfd\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Tue, 18 Oct 2022 20:44:13 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM8d56751a30eb78cdea3a7a9392e95967.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5212281775791\", \"date_created\": \"Tue, 18 Oct 2022 20:44:13 +0000\", \"status\": \"queued\", \"sid\": \"SM8d56751a30eb78cdea3a7a9392e95967\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM8d56751a30eb78cdea3a7a9392e95967/Media.json\"}}', '1666125853'),
(69, 'MENSAJE ENVIADO; DATA: {\"body\": \"fdsfd\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Tue, 18 Oct 2022 20:44:14 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SMd3e58b166a16c9e971e56f97bdcfb8e7.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5214777215252\", \"date_created\": \"Tue, 18 Oct 2022 20:44:14 +0000\", \"status\": \"queued\", \"sid\": \"SMd3e58b166a16c9e971e56f97bdcfb8e7\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SMd3e58b166a16c9e971e56f97bdcfb8e7/Media.json\"}}', '1666125854'),
(70, 'MENSAJE ENVIADO; DATA: {\"body\": \"fdsfd\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Tue, 18 Oct 2022 20:44:14 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM63bf52eca427e1b116d7bbc23fbf5cff.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5214771385376\", \"date_created\": \"Tue, 18 Oct 2022 20:44:14 +0000\", \"status\": \"queued\", \"sid\": \"SM63bf52eca427e1b116d7bbc23fbf5cff\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM63bf52eca427e1b116d7bbc23fbf5cff/Media.json\"}}', '1666125854'),
(71, 'MENSAJE ENVIADO; DATA: {\"body\": \"fdsfd\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Tue, 18 Oct 2022 20:50:51 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM5642d38153832ef88e0eb0a2890dfb97.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5213322090166\", \"date_created\": \"Tue, 18 Oct 2022 20:50:51 +0000\", \"status\": \"queued\", \"sid\": \"SM5642d38153832ef88e0eb0a2890dfb97\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM5642d38153832ef88e0eb0a2890dfb97/Media.json\"}}', '2022-10-18 15:50:51'),
(72, 'MENSAJE ENVIADO; DATA: {\"body\": \"fdsfd\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Tue, 18 Oct 2022 20:50:51 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM3db2fab3619b7258722ef145421021bb.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5214777215252\", \"date_created\": \"Tue, 18 Oct 2022 20:50:51 +0000\", \"status\": \"queued\", \"sid\": \"SM3db2fab3619b7258722ef145421021bb\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM3db2fab3619b7258722ef145421021bb/Media.json\"}}', '2022-10-18 15:50:51'),
(73, 'MENSAJE ENVIADO; DATA: {\"body\": \"fdsfd\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Tue, 18 Oct 2022 20:50:52 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM8333ee28967ad8e4da38c9e751fc48f6.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5214771385376\", \"date_created\": \"Tue, 18 Oct 2022 20:50:52 +0000\", \"status\": \"queued\", \"sid\": \"SM8333ee28967ad8e4da38c9e751fc48f6\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM8333ee28967ad8e4da38c9e751fc48f6/Media.json\"}}', '2022-10-18 15:50:52'),
(74, 'MENSAJE ENVIADO; DATA: {\"body\": \"fdsfd\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Tue, 18 Oct 2022 20:50:52 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SMb210c8f96f0d7e72a356df62848a0724.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5213322503056\", \"date_created\": \"Tue, 18 Oct 2022 20:50:52 +0000\", \"status\": \"queued\", \"sid\": \"SMb210c8f96f0d7e72a356df62848a0724\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SMb210c8f96f0d7e72a356df62848a0724/Media.json\"}}', '2022-10-18 15:50:52'),
(75, 'MENSAJE ENVIADO; DATA: {\"body\": \"fdsfd\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Tue, 18 Oct 2022 20:50:53 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SMd84ae7f1ff05e6e083bc8b2f88c0b619.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5213312275426\", \"date_created\": \"Tue, 18 Oct 2022 20:50:53 +0000\", \"status\": \"queued\", \"sid\": \"SMd84ae7f1ff05e6e083bc8b2f88c0b619\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SMd84ae7f1ff05e6e083bc8b2f88c0b619/Media.json\"}}', '2022-10-18 15:50:53'),
(76, 'MENSAJE ENVIADO; DATA: {\"body\": \"fdsfd\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Tue, 18 Oct 2022 20:50:53 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SMa1142792e40ed16aef275970c3a9bea9.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5213321624934\", \"date_created\": \"Tue, 18 Oct 2022 20:50:53 +0000\", \"status\": \"queued\", \"sid\": \"SMa1142792e40ed16aef275970c3a9bea9\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SMa1142792e40ed16aef275970c3a9bea9/Media.json\"}}', '2022-10-18 15:50:53'),
(77, 'MENSAJE ENVIADO; DATA: {\"body\": \"fdsfd\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Tue, 18 Oct 2022 20:50:54 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SMdf57379e4f88728cea27bc309d71076b.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5213315634756\", \"date_created\": \"Tue, 18 Oct 2022 20:50:54 +0000\", \"status\": \"queued\", \"sid\": \"SMdf57379e4f88728cea27bc309d71076b\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SMdf57379e4f88728cea27bc309d71076b/Media.json\"}}', '2022-10-18 15:50:54'),
(78, 'MENSAJE ENVIADO; DATA: {\"body\": \"fdsfd\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Tue, 18 Oct 2022 20:50:54 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SMf20d98836fadc23e3ff07df42d2f033f.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5212281775791\", \"date_created\": \"Tue, 18 Oct 2022 20:50:54 +0000\", \"status\": \"queued\", \"sid\": \"SMf20d98836fadc23e3ff07df42d2f033f\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SMf20d98836fadc23e3ff07df42d2f033f/Media.json\"}}', '2022-10-18 15:50:54'),
(79, 'MENSAJE ENVIADO; DATA: {\"body\": \"fdsfd\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Tue, 18 Oct 2022 20:50:55 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM68555c4503249f6cbebc04dcec16f67d.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5214777215252\", \"date_created\": \"Tue, 18 Oct 2022 20:50:55 +0000\", \"status\": \"queued\", \"sid\": \"SM68555c4503249f6cbebc04dcec16f67d\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM68555c4503249f6cbebc04dcec16f67d/Media.json\"}}', '2022-10-18 15:50:55'),
(80, 'MENSAJE ENVIADO; DATA: {\"body\": \"fdsfd\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Tue, 18 Oct 2022 20:50:55 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM53af8a61745503235ef3396fb95d2918.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5214771385376\", \"date_created\": \"Tue, 18 Oct 2022 20:50:55 +0000\", \"status\": \"queued\", \"sid\": \"SM53af8a61745503235ef3396fb95d2918\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM53af8a61745503235ef3396fb95d2918/Media.json\"}}', '2022-10-18 15:50:55'),
(81, 'No se han encontrado fechas de citas proximas', '2022-10-18 16:24:55'),
(82, 'No se han encontrado fechas de citas proximas', '2022-10-18 16:24:55'),
(83, 'No se han encontrado fechas de citas proximas', '2022-10-18 16:24:55'),
(84, 'No se han encontrado fechas de citas proximas', '2022-10-18 16:24:55'),
(85, 'MENSAJE ENVIADO; DATA: {\"body\": \"fdsfd\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Tue, 18 Oct 2022 21:24:56 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SMe10b82136cfd91303c6cb97fd012efa5.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5213322090166\", \"date_created\": \"Tue, 18 Oct 2022 21:24:56 +0000\", \"status\": \"queued\", \"sid\": \"SMe10b82136cfd91303c6cb97fd012efa5\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SMe10b82136cfd91303c6cb97fd012efa5/Media.json\"}}', '2022-10-18 16:24:56'),
(86, 'MENSAJE ENVIADO; DATA: {\"body\": \"fdsfd\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Tue, 18 Oct 2022 21:24:56 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM53f7b9c243b646a45f73f40dfaad71a9.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5214777215252\", \"date_created\": \"Tue, 18 Oct 2022 21:24:56 +0000\", \"status\": \"queued\", \"sid\": \"SM53f7b9c243b646a45f73f40dfaad71a9\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM53f7b9c243b646a45f73f40dfaad71a9/Media.json\"}}', '2022-10-18 16:24:56'),
(87, 'MENSAJE ENVIADO; DATA: {\"body\": \"fdsfd\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Tue, 18 Oct 2022 21:24:56 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM9205770c5862a87d5c24b2a66bb9c634.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5214771385376\", \"date_created\": \"Tue, 18 Oct 2022 21:24:56 +0000\", \"status\": \"queued\", \"sid\": \"SM9205770c5862a87d5c24b2a66bb9c634\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM9205770c5862a87d5c24b2a66bb9c634/Media.json\"}}', '2022-10-18 16:24:56'),
(88, 'MENSAJE ENVIADO; DATA: {\"body\": \"fdsfd\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Tue, 18 Oct 2022 21:24:57 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM7194df6029a5e0d829583965d109b8e9.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5213322503056\", \"date_created\": \"Tue, 18 Oct 2022 21:24:57 +0000\", \"status\": \"queued\", \"sid\": \"SM7194df6029a5e0d829583965d109b8e9\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM7194df6029a5e0d829583965d109b8e9/Media.json\"}}', '2022-10-18 16:24:57'),
(89, 'MENSAJE ENVIADO; DATA: {\"body\": \"fdsfd\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Tue, 18 Oct 2022 21:24:57 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM3cd19392aaeb3198cba503ad3cbcfbd1.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5213312275426\", \"date_created\": \"Tue, 18 Oct 2022 21:24:57 +0000\", \"status\": \"queued\", \"sid\": \"SM3cd19392aaeb3198cba503ad3cbcfbd1\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM3cd19392aaeb3198cba503ad3cbcfbd1/Media.json\"}}', '2022-10-18 16:24:57'),
(90, 'MENSAJE ENVIADO; DATA: {\"body\": \"fdsfd\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Tue, 18 Oct 2022 21:24:58 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM0071110c66b8edf8e3a4a1e2694bf683.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5213321624934\", \"date_created\": \"Tue, 18 Oct 2022 21:24:58 +0000\", \"status\": \"queued\", \"sid\": \"SM0071110c66b8edf8e3a4a1e2694bf683\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM0071110c66b8edf8e3a4a1e2694bf683/Media.json\"}}', '2022-10-18 16:24:58'),
(91, 'MENSAJE ENVIADO; DATA: {\"body\": \"fdsfd\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Tue, 18 Oct 2022 21:24:58 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SMc6c08cbf012ba480ef751c4378e35643.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5213315634756\", \"date_created\": \"Tue, 18 Oct 2022 21:24:58 +0000\", \"status\": \"queued\", \"sid\": \"SMc6c08cbf012ba480ef751c4378e35643\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SMc6c08cbf012ba480ef751c4378e35643/Media.json\"}}', '2022-10-18 16:24:58'),
(92, 'MENSAJE ENVIADO; DATA: {\"body\": \"fdsfd\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Tue, 18 Oct 2022 21:24:59 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM158926d3109d1fac54a8ccc32fab2097.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5212281775791\", \"date_created\": \"Tue, 18 Oct 2022 21:24:59 +0000\", \"status\": \"queued\", \"sid\": \"SM158926d3109d1fac54a8ccc32fab2097\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM158926d3109d1fac54a8ccc32fab2097/Media.json\"}}', '2022-10-18 16:24:59'),
(93, 'MENSAJE ENVIADO; DATA: {\"body\": \"fdsfd\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Tue, 18 Oct 2022 21:25:00 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM82d3f3fdfd0fc6c750325ea1fa2b19c3.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5214777215252\", \"date_created\": \"Tue, 18 Oct 2022 21:25:00 +0000\", \"status\": \"queued\", \"sid\": \"SM82d3f3fdfd0fc6c750325ea1fa2b19c3\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM82d3f3fdfd0fc6c750325ea1fa2b19c3/Media.json\"}}', '2022-10-18 16:25:00'),
(94, 'MENSAJE ENVIADO; DATA: {\"body\": \"fdsfd\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Tue, 18 Oct 2022 21:25:00 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM3d6d9ebd15d5ca630a9fe333b4c6a574.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5214771385376\", \"date_created\": \"Tue, 18 Oct 2022 21:25:00 +0000\", \"status\": \"queued\", \"sid\": \"SM3d6d9ebd15d5ca630a9fe333b4c6a574\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM3d6d9ebd15d5ca630a9fe333b4c6a574/Media.json\"}}', '2022-10-18 16:25:00'),
(95, 'No hay notificaciones el día de hoy', '2022-10-18 16:26:31'),
(96, 'No hay notificaciones el día de hoy', '2022-10-18 16:26:31'),
(97, 'No hay notificaciones el día de hoy', '2022-10-18 16:26:31'),
(98, 'No hay notificaciones el día de hoy', '2022-10-18 16:26:31'),
(99, 'MENSAJE ENVIADO; DATA: {\"body\": \"fdsfd\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Tue, 18 Oct 2022 21:26:32 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SMde42c554331de58db4d95db646e7a734.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5213322090166\", \"date_created\": \"Tue, 18 Oct 2022 21:26:32 +0000\", \"status\": \"queued\", \"sid\": \"SMde42c554331de58db4d95db646e7a734\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SMde42c554331de58db4d95db646e7a734/Media.json\"}}', '2022-10-18 16:26:32'),
(100, 'MENSAJE ENVIADO; DATA: {\"body\": \"fdsfd\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Tue, 18 Oct 2022 21:26:33 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM5c4651171d9d2bcb0e3ac175ed847fdf.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5214777215252\", \"date_created\": \"Tue, 18 Oct 2022 21:26:33 +0000\", \"status\": \"queued\", \"sid\": \"SM5c4651171d9d2bcb0e3ac175ed847fdf\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM5c4651171d9d2bcb0e3ac175ed847fdf/Media.json\"}}', '2022-10-18 16:26:33'),
(101, 'MENSAJE ENVIADO; DATA: {\"body\": \"fdsfd\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Tue, 18 Oct 2022 21:26:34 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SMb23cebf64005d1f1f22ee19fc03be6e1.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5214771385376\", \"date_created\": \"Tue, 18 Oct 2022 21:26:34 +0000\", \"status\": \"queued\", \"sid\": \"SMb23cebf64005d1f1f22ee19fc03be6e1\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SMb23cebf64005d1f1f22ee19fc03be6e1/Media.json\"}}', '2022-10-18 16:26:34'),
(102, 'MENSAJE ENVIADO; DATA: {\"body\": \"fdsfd\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Tue, 18 Oct 2022 21:26:34 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM2c0041075e8aa9cecdcdd4705599922f.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5213322503056\", \"date_created\": \"Tue, 18 Oct 2022 21:26:34 +0000\", \"status\": \"queued\", \"sid\": \"SM2c0041075e8aa9cecdcdd4705599922f\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM2c0041075e8aa9cecdcdd4705599922f/Media.json\"}}', '2022-10-18 16:26:34'),
(103, 'MENSAJE ENVIADO; DATA: {\"body\": \"fdsfd\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Tue, 18 Oct 2022 21:26:35 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SMc94d50e041c2c647f5ab887ade1292e2.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5213312275426\", \"date_created\": \"Tue, 18 Oct 2022 21:26:35 +0000\", \"status\": \"queued\", \"sid\": \"SMc94d50e041c2c647f5ab887ade1292e2\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SMc94d50e041c2c647f5ab887ade1292e2/Media.json\"}}', '2022-10-18 16:26:35'),
(104, 'MENSAJE ENVIADO; DATA: {\"body\": \"fdsfd\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Tue, 18 Oct 2022 21:26:35 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM09b9743d9434e27c3d005dc29f50b5a7.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5213321624934\", \"date_created\": \"Tue, 18 Oct 2022 21:26:35 +0000\", \"status\": \"queued\", \"sid\": \"SM09b9743d9434e27c3d005dc29f50b5a7\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM09b9743d9434e27c3d005dc29f50b5a7/Media.json\"}}', '2022-10-18 16:26:35'),
(105, 'MENSAJE ENVIADO; DATA: {\"body\": \"fdsfd\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Tue, 18 Oct 2022 21:26:36 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM00340bf9a53c531e6a833b0c65894abf.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5213315634756\", \"date_created\": \"Tue, 18 Oct 2022 21:26:36 +0000\", \"status\": \"queued\", \"sid\": \"SM00340bf9a53c531e6a833b0c65894abf\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM00340bf9a53c531e6a833b0c65894abf/Media.json\"}}', '2022-10-18 16:26:36'),
(106, 'MENSAJE ENVIADO; DATA: {\"body\": \"fdsfd\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Tue, 18 Oct 2022 21:26:36 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM53e45e92c8a9f3d49ba488ad5ca320fc.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5212281775791\", \"date_created\": \"Tue, 18 Oct 2022 21:26:36 +0000\", \"status\": \"queued\", \"sid\": \"SM53e45e92c8a9f3d49ba488ad5ca320fc\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM53e45e92c8a9f3d49ba488ad5ca320fc/Media.json\"}}', '2022-10-18 16:26:36'),
(107, 'MENSAJE ENVIADO; DATA: {\"body\": \"fdsfd\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Tue, 18 Oct 2022 21:26:37 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM2f40688b30d9358d5319c3ac7e785a9c.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5214777215252\", \"date_created\": \"Tue, 18 Oct 2022 21:26:37 +0000\", \"status\": \"queued\", \"sid\": \"SM2f40688b30d9358d5319c3ac7e785a9c\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM2f40688b30d9358d5319c3ac7e785a9c/Media.json\"}}', '2022-10-18 16:26:37'),
(108, 'MENSAJE ENVIADO; DATA: {\"body\": \"fdsfd\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Tue, 18 Oct 2022 21:26:37 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM39c4265b0be51416a7f478ae8b149aa4.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5214771385376\", \"date_created\": \"Tue, 18 Oct 2022 21:26:37 +0000\", \"status\": \"queued\", \"sid\": \"SM39c4265b0be51416a7f478ae8b149aa4\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM39c4265b0be51416a7f478ae8b149aa4/Media.json\"}}', '2022-10-18 16:26:37'),
(109, 'MENSAJE ENVIADO; DATA: {\"body\": \"fdsfd\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Tue, 18 Oct 2022 21:29:54 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SMc414e984d8f70d0e31717f433df84d79.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5213322090166\", \"date_created\": \"Tue, 18 Oct 2022 21:29:54 +0000\", \"status\": \"queued\", \"sid\": \"SMc414e984d8f70d0e31717f433df84d79\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SMc414e984d8f70d0e31717f433df84d79/Media.json\"}}', '2022-10-18 16:29:54'),
(110, 'MENSAJE ENVIADO; DATA: {\"body\": \"fdsfd\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Tue, 18 Oct 2022 21:29:54 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SMf60830c2883a2c156927c11e58dd9807.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5214777215252\", \"date_created\": \"Tue, 18 Oct 2022 21:29:54 +0000\", \"status\": \"queued\", \"sid\": \"SMf60830c2883a2c156927c11e58dd9807\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SMf60830c2883a2c156927c11e58dd9807/Media.json\"}}', '2022-10-18 16:29:54'),
(111, 'MENSAJE ENVIADO; DATA: {\"body\": \"fdsfd\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Tue, 18 Oct 2022 21:29:55 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SMa4a6194b9c297e2ca5a336684b88902c.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5214771385376\", \"date_created\": \"Tue, 18 Oct 2022 21:29:55 +0000\", \"status\": \"queued\", \"sid\": \"SMa4a6194b9c297e2ca5a336684b88902c\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SMa4a6194b9c297e2ca5a336684b88902c/Media.json\"}}', '2022-10-18 16:29:55'),
(112, 'MENSAJE ENVIADO; DATA: {\"body\": \"fdsfd\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Tue, 18 Oct 2022 21:29:55 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM76d983ca9d5990b2be8dd18e0bbed293.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5213322503056\", \"date_created\": \"Tue, 18 Oct 2022 21:29:55 +0000\", \"status\": \"queued\", \"sid\": \"SM76d983ca9d5990b2be8dd18e0bbed293\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM76d983ca9d5990b2be8dd18e0bbed293/Media.json\"}}', '2022-10-18 16:29:55'),
(113, 'MENSAJE ENVIADO; DATA: {\"body\": \"fdsfd\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Tue, 18 Oct 2022 21:29:56 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SMb10c7b15bb4c71e86e470fa72933980f.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5213312275426\", \"date_created\": \"Tue, 18 Oct 2022 21:29:56 +0000\", \"status\": \"queued\", \"sid\": \"SMb10c7b15bb4c71e86e470fa72933980f\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SMb10c7b15bb4c71e86e470fa72933980f/Media.json\"}}', '2022-10-18 16:29:56'),
(114, 'MENSAJE ENVIADO; DATA: {\"body\": \"fdsfd\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Tue, 18 Oct 2022 21:29:56 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM45f7451bb0d550d90dd294036f15d2d3.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5213321624934\", \"date_created\": \"Tue, 18 Oct 2022 21:29:56 +0000\", \"status\": \"queued\", \"sid\": \"SM45f7451bb0d550d90dd294036f15d2d3\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM45f7451bb0d550d90dd294036f15d2d3/Media.json\"}}', '2022-10-18 16:29:56'),
(115, 'MENSAJE ENVIADO; DATA: {\"body\": \"fdsfd\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Tue, 18 Oct 2022 21:29:57 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SMb441b837975427b0e2d4485ff928c476.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5213315634756\", \"date_created\": \"Tue, 18 Oct 2022 21:29:57 +0000\", \"status\": \"queued\", \"sid\": \"SMb441b837975427b0e2d4485ff928c476\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SMb441b837975427b0e2d4485ff928c476/Media.json\"}}', '2022-10-18 16:29:57'),
(116, 'MENSAJE ENVIADO; DATA: {\"body\": \"fdsfd\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Tue, 18 Oct 2022 21:29:57 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SMbf1bbb109d54615bff4057ee5e2cd0c2.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5212281775791\", \"date_created\": \"Tue, 18 Oct 2022 21:29:57 +0000\", \"status\": \"queued\", \"sid\": \"SMbf1bbb109d54615bff4057ee5e2cd0c2\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SMbf1bbb109d54615bff4057ee5e2cd0c2/Media.json\"}}', '2022-10-18 16:29:57'),
(117, 'MENSAJE ENVIADO; DATA: {\"body\": \"fdsfd\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Tue, 18 Oct 2022 21:29:58 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM69f7bbfd0d26473ee1bf3a1ce8c9e703.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5214777215252\", \"date_created\": \"Tue, 18 Oct 2022 21:29:58 +0000\", \"status\": \"queued\", \"sid\": \"SM69f7bbfd0d26473ee1bf3a1ce8c9e703\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM69f7bbfd0d26473ee1bf3a1ce8c9e703/Media.json\"}}', '2022-10-18 16:29:58'),
(118, 'MENSAJE ENVIADO; DATA: {\"body\": \"fdsfd\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Tue, 18 Oct 2022 21:29:58 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SMb810417015087903c04a3b8a80a0fde7.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5214771385376\", \"date_created\": \"Tue, 18 Oct 2022 21:29:58 +0000\", \"status\": \"queued\", \"sid\": \"SMb810417015087903c04a3b8a80a0fde7\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SMb810417015087903c04a3b8a80a0fde7/Media.json\"}}', '2022-10-18 16:29:58'),
(119, 'Notificación: fdsfd ha sido llamado para enviar mensaje', '2022-10-18 16:29:58'),
(120, 'Notificación: fdsfd. Ha sido llamado para enviar mensaje', '2022-10-18 16:30:53'),
(121, 'MENSAJE ENVIADO; DATA: {\"body\": \"fdsfd\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Tue, 18 Oct 2022 21:30:54 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SMf100af02d1876fd62f8b0b5d04a3de01.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5213322090166\", \"date_created\": \"Tue, 18 Oct 2022 21:30:54 +0000\", \"status\": \"queued\", \"sid\": \"SMf100af02d1876fd62f8b0b5d04a3de01\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SMf100af02d1876fd62f8b0b5d04a3de01/Media.json\"}}', '2022-10-18 16:30:54'),
(122, 'MENSAJE ENVIADO; DATA: {\"body\": \"fdsfd\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Tue, 18 Oct 2022 21:30:55 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SMfae58def08c76f472e807e658013a32d.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5214777215252\", \"date_created\": \"Tue, 18 Oct 2022 21:30:55 +0000\", \"status\": \"queued\", \"sid\": \"SMfae58def08c76f472e807e658013a32d\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SMfae58def08c76f472e807e658013a32d/Media.json\"}}', '2022-10-18 16:30:55'),
(123, 'MENSAJE ENVIADO; DATA: {\"body\": \"fdsfd\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Tue, 18 Oct 2022 21:30:55 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM6a87376de012afd84064beec0f6a6f95.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5214771385376\", \"date_created\": \"Tue, 18 Oct 2022 21:30:55 +0000\", \"status\": \"queued\", \"sid\": \"SM6a87376de012afd84064beec0f6a6f95\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM6a87376de012afd84064beec0f6a6f95/Media.json\"}}', '2022-10-18 16:30:55'),
(124, 'MENSAJE ENVIADO; DATA: {\"body\": \"fdsfd\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Tue, 18 Oct 2022 21:30:56 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SMc50ad14e22a9fa7278b010a0de2befea.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5213322503056\", \"date_created\": \"Tue, 18 Oct 2022 21:30:56 +0000\", \"status\": \"queued\", \"sid\": \"SMc50ad14e22a9fa7278b010a0de2befea\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SMc50ad14e22a9fa7278b010a0de2befea/Media.json\"}}', '2022-10-18 16:30:56'),
(125, 'MENSAJE ENVIADO; DATA: {\"body\": \"fdsfd\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Tue, 18 Oct 2022 21:30:57 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SMc7ea976ff56dcd60662b8f39218924a0.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5213312275426\", \"date_created\": \"Tue, 18 Oct 2022 21:30:57 +0000\", \"status\": \"queued\", \"sid\": \"SMc7ea976ff56dcd60662b8f39218924a0\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SMc7ea976ff56dcd60662b8f39218924a0/Media.json\"}}', '2022-10-18 16:30:56');
INSERT INTO `logs` (`id`, `description`, `date`) VALUES
(126, 'MENSAJE ENVIADO; DATA: {\"body\": \"fdsfd\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Tue, 18 Oct 2022 21:30:57 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SMb1f809cd1f77e74f519e994e87c41e5a.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5213321624934\", \"date_created\": \"Tue, 18 Oct 2022 21:30:57 +0000\", \"status\": \"queued\", \"sid\": \"SMb1f809cd1f77e74f519e994e87c41e5a\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SMb1f809cd1f77e74f519e994e87c41e5a/Media.json\"}}', '2022-10-18 16:30:57'),
(127, 'MENSAJE ENVIADO; DATA: {\"body\": \"fdsfd\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Tue, 18 Oct 2022 21:30:57 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SMd58a34c83debbbf0f6a19bd9f4bdbe43.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5213315634756\", \"date_created\": \"Tue, 18 Oct 2022 21:30:57 +0000\", \"status\": \"queued\", \"sid\": \"SMd58a34c83debbbf0f6a19bd9f4bdbe43\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SMd58a34c83debbbf0f6a19bd9f4bdbe43/Media.json\"}}', '2022-10-18 16:30:57'),
(128, 'MENSAJE ENVIADO; DATA: {\"body\": \"fdsfd\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Tue, 18 Oct 2022 21:30:58 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SMc571a26f13a790fdfdd25c2f74db1bda.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5212281775791\", \"date_created\": \"Tue, 18 Oct 2022 21:30:58 +0000\", \"status\": \"queued\", \"sid\": \"SMc571a26f13a790fdfdd25c2f74db1bda\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SMc571a26f13a790fdfdd25c2f74db1bda/Media.json\"}}', '2022-10-18 16:30:58'),
(129, 'MENSAJE ENVIADO; DATA: {\"body\": \"fdsfd\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Tue, 18 Oct 2022 21:30:58 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM87a46cb9214bad30dec4f88d7fb9a2ff.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5214777215252\", \"date_created\": \"Tue, 18 Oct 2022 21:30:58 +0000\", \"status\": \"queued\", \"sid\": \"SM87a46cb9214bad30dec4f88d7fb9a2ff\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM87a46cb9214bad30dec4f88d7fb9a2ff/Media.json\"}}', '2022-10-18 16:30:58'),
(130, 'MENSAJE ENVIADO; DATA: {\"body\": \"fdsfd\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Tue, 18 Oct 2022 21:30:59 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SMcb4f7ca49e25c1b8bbad68c786d5bd5a.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5214771385376\", \"date_created\": \"Tue, 18 Oct 2022 21:30:59 +0000\", \"status\": \"queued\", \"sid\": \"SMcb4f7ca49e25c1b8bbad68c786d5bd5a\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SMcb4f7ca49e25c1b8bbad68c786d5bd5a/Media.json\"}}', '2022-10-18 16:30:59'),
(131, 'Notificación: fdsfd. Ha sido llamado para enviar mensaje', '2022-10-18 16:36:14'),
(132, 'MENSAJE ENVIADO; DATA: {\"body\": \"fdsfd\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Tue, 18 Oct 2022 21:36:14 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM716e4ad997a7e78edfca375ab858ee22.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5213322090166\", \"date_created\": \"Tue, 18 Oct 2022 21:36:14 +0000\", \"status\": \"queued\", \"sid\": \"SM716e4ad997a7e78edfca375ab858ee22\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM716e4ad997a7e78edfca375ab858ee22/Media.json\"}}', '2022-10-18 16:36:14'),
(133, 'MENSAJE ENVIADO; DATA: {\"body\": \"fdsfd\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Tue, 18 Oct 2022 21:36:15 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM167c44f3fc464f7d603aa245d246dd63.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5214777215252\", \"date_created\": \"Tue, 18 Oct 2022 21:36:15 +0000\", \"status\": \"queued\", \"sid\": \"SM167c44f3fc464f7d603aa245d246dd63\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM167c44f3fc464f7d603aa245d246dd63/Media.json\"}}', '2022-10-18 16:36:15'),
(134, 'MENSAJE ENVIADO; DATA: {\"body\": \"fdsfd\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Tue, 18 Oct 2022 21:36:15 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM77b77e99b8edaa7133d8ac74c7c3d314.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5214771385376\", \"date_created\": \"Tue, 18 Oct 2022 21:36:15 +0000\", \"status\": \"queued\", \"sid\": \"SM77b77e99b8edaa7133d8ac74c7c3d314\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM77b77e99b8edaa7133d8ac74c7c3d314/Media.json\"}}', '2022-10-18 16:36:15'),
(135, 'MENSAJE ENVIADO; DATA: {\"body\": \"fdsfd\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Tue, 18 Oct 2022 21:36:16 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM9c3b43454f11343a4b7989b588fd54a6.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5213322503056\", \"date_created\": \"Tue, 18 Oct 2022 21:36:16 +0000\", \"status\": \"queued\", \"sid\": \"SM9c3b43454f11343a4b7989b588fd54a6\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM9c3b43454f11343a4b7989b588fd54a6/Media.json\"}}', '2022-10-18 16:36:16'),
(136, 'MENSAJE ENVIADO; DATA: {\"body\": \"fdsfd\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Tue, 18 Oct 2022 21:36:16 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SMd352001de6e163870124485f46f4ec89.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5213312275426\", \"date_created\": \"Tue, 18 Oct 2022 21:36:16 +0000\", \"status\": \"queued\", \"sid\": \"SMd352001de6e163870124485f46f4ec89\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SMd352001de6e163870124485f46f4ec89/Media.json\"}}', '2022-10-18 16:36:16'),
(137, 'MENSAJE ENVIADO; DATA: {\"body\": \"fdsfd\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Tue, 18 Oct 2022 21:36:17 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM5d4dd5dd5f841d3a5110a64ce96f933d.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5213321624934\", \"date_created\": \"Tue, 18 Oct 2022 21:36:17 +0000\", \"status\": \"queued\", \"sid\": \"SM5d4dd5dd5f841d3a5110a64ce96f933d\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM5d4dd5dd5f841d3a5110a64ce96f933d/Media.json\"}}', '2022-10-18 16:36:17'),
(138, 'MENSAJE ENVIADO; DATA: {\"body\": \"fdsfd\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Tue, 18 Oct 2022 21:36:17 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM784017b403ee54437d169bbba02b6231.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5213315634756\", \"date_created\": \"Tue, 18 Oct 2022 21:36:17 +0000\", \"status\": \"queued\", \"sid\": \"SM784017b403ee54437d169bbba02b6231\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM784017b403ee54437d169bbba02b6231/Media.json\"}}', '2022-10-18 16:36:17'),
(139, 'MENSAJE ENVIADO; DATA: {\"body\": \"fdsfd\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Tue, 18 Oct 2022 21:36:18 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM4bd1909374497eeda3650f4c73c2f1a2.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5212281775791\", \"date_created\": \"Tue, 18 Oct 2022 21:36:18 +0000\", \"status\": \"queued\", \"sid\": \"SM4bd1909374497eeda3650f4c73c2f1a2\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM4bd1909374497eeda3650f4c73c2f1a2/Media.json\"}}', '2022-10-18 16:36:18'),
(140, 'MENSAJE ENVIADO; DATA: {\"body\": \"fdsfd\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Tue, 18 Oct 2022 21:36:18 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM33aeadb1aaa8157c8004805c429d55d3.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5214777215252\", \"date_created\": \"Tue, 18 Oct 2022 21:36:18 +0000\", \"status\": \"queued\", \"sid\": \"SM33aeadb1aaa8157c8004805c429d55d3\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM33aeadb1aaa8157c8004805c429d55d3/Media.json\"}}', '2022-10-18 16:36:18'),
(141, 'MENSAJE ENVIADO; DATA: {\"body\": \"fdsfd\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Tue, 18 Oct 2022 21:36:19 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM40ba63ababa8454b5037e2e176d3226f.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5214771385376\", \"date_created\": \"Tue, 18 Oct 2022 21:36:19 +0000\", \"status\": \"queued\", \"sid\": \"SM40ba63ababa8454b5037e2e176d3226f\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM40ba63ababa8454b5037e2e176d3226f/Media.json\"}}', '2022-10-18 16:36:19'),
(142, 'No se han encontrado notificaciones', '2022-10-18 16:46:28'),
(143, 'No se han encontrado notificaciones', '2022-10-18 16:46:28'),
(144, 'No se han encontrado notificaciones', '2022-10-18 16:46:28'),
(145, 'No se han encontrado notificaciones', '2022-10-18 16:46:28'),
(146, 'No se han encontrado notificaciones', '2022-10-18 16:46:28'),
(147, 'MENSAJE ENVIADO; DATA: {\"body\": \"Buen d\\u00eda, le recuerdo que el d\\u00eda 25 de oct, no se laborar\\u00e1, favor de confirmar por este medio. Gracias y buen d\\u00eda .\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Tue, 18 Oct 2022 21:54:05 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM82ccd35db2f25675687c247cd52dad66.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5214771385376\", \"date_created\": \"Tue, 18 Oct 2022 21:54:05 +0000\", \"status\": \"queued\", \"sid\": \"SM82ccd35db2f25675687c247cd52dad66\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM82ccd35db2f25675687c247cd52dad66/Media.json\"}}', '2022-10-18 16:54:05'),
(148, 'MENSAJE ENVIADO; DATA: {\"body\": \"Buen d\\u00eda, le recuerdo que el d\\u00eda 25 de oct, no se laborar\\u00e1, favor de confirmar por este medio. Gracias y buen d\\u00eda .\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Tue, 18 Oct 2022 21:54:05 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SMd5a55bb959c6967c826b70c75d29ad42.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5213312275426\", \"date_created\": \"Tue, 18 Oct 2022 21:54:05 +0000\", \"status\": \"queued\", \"sid\": \"SMd5a55bb959c6967c826b70c75d29ad42\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SMd5a55bb959c6967c826b70c75d29ad42/Media.json\"}}', '2022-10-18 16:54:05'),
(149, 'MENSAJE ENVIADO; DATA: {\"body\": \"fdsfd\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Tue, 18 Oct 2022 21:55:00 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM67fefede5ad9356844ba7c4edfd43950.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5213322090166\", \"date_created\": \"Tue, 18 Oct 2022 21:55:00 +0000\", \"status\": \"queued\", \"sid\": \"SM67fefede5ad9356844ba7c4edfd43950\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM67fefede5ad9356844ba7c4edfd43950/Media.json\"}}', '2022-10-18 16:55:00'),
(150, 'MENSAJE ENVIADO; DATA: {\"body\": \"fdsfd\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Tue, 18 Oct 2022 21:55:00 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM7769a3734c15575e7822d91a530b5470.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5214777215252\", \"date_created\": \"Tue, 18 Oct 2022 21:55:00 +0000\", \"status\": \"queued\", \"sid\": \"SM7769a3734c15575e7822d91a530b5470\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM7769a3734c15575e7822d91a530b5470/Media.json\"}}', '2022-10-18 16:55:00'),
(151, 'MENSAJE ENVIADO; DATA: {\"body\": \"fdsfd\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Tue, 18 Oct 2022 21:55:01 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM3abd478352dbfb9ee6ea2978ca064bbc.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5214771385376\", \"date_created\": \"Tue, 18 Oct 2022 21:55:01 +0000\", \"status\": \"queued\", \"sid\": \"SM3abd478352dbfb9ee6ea2978ca064bbc\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM3abd478352dbfb9ee6ea2978ca064bbc/Media.json\"}}', '2022-10-18 16:55:01'),
(152, 'MENSAJE ENVIADO; DATA: {\"body\": \"fdsfd\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Tue, 18 Oct 2022 21:55:01 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM8ca7581363662a982b7f2cc78dec52ba.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5213322503056\", \"date_created\": \"Tue, 18 Oct 2022 21:55:01 +0000\", \"status\": \"queued\", \"sid\": \"SM8ca7581363662a982b7f2cc78dec52ba\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM8ca7581363662a982b7f2cc78dec52ba/Media.json\"}}', '2022-10-18 16:55:01'),
(153, 'MENSAJE ENVIADO; DATA: {\"body\": \"fdsfd\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Tue, 18 Oct 2022 21:55:02 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SMcc63bffb2d8d6afa1d26bdf4e0267b3a.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5213312275426\", \"date_created\": \"Tue, 18 Oct 2022 21:55:02 +0000\", \"status\": \"queued\", \"sid\": \"SMcc63bffb2d8d6afa1d26bdf4e0267b3a\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SMcc63bffb2d8d6afa1d26bdf4e0267b3a/Media.json\"}}', '2022-10-18 16:55:02'),
(154, 'MENSAJE ENVIADO; DATA: {\"body\": \"fdsfd\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Tue, 18 Oct 2022 21:55:02 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM42c1899f21536d57a272c5ed2d10c70c.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5213321624934\", \"date_created\": \"Tue, 18 Oct 2022 21:55:02 +0000\", \"status\": \"queued\", \"sid\": \"SM42c1899f21536d57a272c5ed2d10c70c\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM42c1899f21536d57a272c5ed2d10c70c/Media.json\"}}', '2022-10-18 16:55:02'),
(155, 'MENSAJE ENVIADO; DATA: {\"body\": \"fdsfd\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Tue, 18 Oct 2022 21:55:03 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM4424dd7bd6b1d498cdee105ce96fa4df.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5213315634756\", \"date_created\": \"Tue, 18 Oct 2022 21:55:03 +0000\", \"status\": \"queued\", \"sid\": \"SM4424dd7bd6b1d498cdee105ce96fa4df\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM4424dd7bd6b1d498cdee105ce96fa4df/Media.json\"}}', '2022-10-18 16:55:03'),
(156, 'MENSAJE ENVIADO; DATA: {\"body\": \"fdsfd\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Tue, 18 Oct 2022 21:55:03 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM3b07e2a97024958a2c65901d4a7911d8.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5212281775791\", \"date_created\": \"Tue, 18 Oct 2022 21:55:03 +0000\", \"status\": \"queued\", \"sid\": \"SM3b07e2a97024958a2c65901d4a7911d8\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM3b07e2a97024958a2c65901d4a7911d8/Media.json\"}}', '2022-10-18 16:55:03'),
(157, 'MENSAJE ENVIADO; DATA: {\"body\": \"fdsfd\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Tue, 18 Oct 2022 21:55:03 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SMa02c21025d75c5e72f891ae76b8e1b76.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5214777215252\", \"date_created\": \"Tue, 18 Oct 2022 21:55:03 +0000\", \"status\": \"queued\", \"sid\": \"SMa02c21025d75c5e72f891ae76b8e1b76\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SMa02c21025d75c5e72f891ae76b8e1b76/Media.json\"}}', '2022-10-18 16:55:03'),
(158, 'MENSAJE ENVIADO; DATA: {\"body\": \"fdsfd\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Tue, 18 Oct 2022 21:55:04 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SMe46431be1df91c2da6491d7fe6d8a78e.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5214771385376\", \"date_created\": \"Tue, 18 Oct 2022 21:55:04 +0000\", \"status\": \"queued\", \"sid\": \"SMe46431be1df91c2da6491d7fe6d8a78e\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SMe46431be1df91c2da6491d7fe6d8a78e/Media.json\"}}', '2022-10-18 16:55:04'),
(159, 'MENSAJE ENVIADO; DATA: {\"body\": \"fdsfd\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Wed, 19 Oct 2022 15:38:33 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM2c34dec7188f91f740facec9757c99d4.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5213322090166\", \"date_created\": \"Wed, 19 Oct 2022 15:38:33 +0000\", \"status\": \"queued\", \"sid\": \"SM2c34dec7188f91f740facec9757c99d4\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM2c34dec7188f91f740facec9757c99d4/Media.json\"}}', '2022-10-19 10:38:33'),
(160, 'MENSAJE ENVIADO; DATA: {\"body\": \"fdsfd\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Wed, 19 Oct 2022 15:38:34 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM137435a88967df8eb8f55f86b3d6883b.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5214777215252\", \"date_created\": \"Wed, 19 Oct 2022 15:38:34 +0000\", \"status\": \"queued\", \"sid\": \"SM137435a88967df8eb8f55f86b3d6883b\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM137435a88967df8eb8f55f86b3d6883b/Media.json\"}}', '2022-10-19 10:38:34'),
(161, 'MENSAJE ENVIADO; DATA: {\"body\": \"fdsfd\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Wed, 19 Oct 2022 15:38:40 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SMe012cb073c0a446489414c43ca5c5431.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5214771385376\", \"date_created\": \"Wed, 19 Oct 2022 15:38:40 +0000\", \"status\": \"queued\", \"sid\": \"SMe012cb073c0a446489414c43ca5c5431\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SMe012cb073c0a446489414c43ca5c5431/Media.json\"}}', '2022-10-19 10:38:40'),
(162, 'MENSAJE ENVIADO; DATA: {\"body\": \"fdsfd\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Wed, 19 Oct 2022 15:38:47 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SMaa1d15d4c065d9268c041b9df66a55d1.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5213322503056\", \"date_created\": \"Wed, 19 Oct 2022 15:38:47 +0000\", \"status\": \"queued\", \"sid\": \"SMaa1d15d4c065d9268c041b9df66a55d1\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SMaa1d15d4c065d9268c041b9df66a55d1/Media.json\"}}', '2022-10-19 10:38:47'),
(163, 'MENSAJE ENVIADO; DATA: {\"body\": \"fdsfd\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Wed, 19 Oct 2022 15:38:56 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM38da7080416ee77e115401b06439852c.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5213312275426\", \"date_created\": \"Wed, 19 Oct 2022 15:38:56 +0000\", \"status\": \"queued\", \"sid\": \"SM38da7080416ee77e115401b06439852c\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM38da7080416ee77e115401b06439852c/Media.json\"}}', '2022-10-19 10:38:56'),
(164, 'MENSAJE ENVIADO; DATA: {\"body\": \"fdsfd\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Wed, 19 Oct 2022 15:39:00 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SMfe82b0d11645b962012d975160a2c47e.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5213321624934\", \"date_created\": \"Wed, 19 Oct 2022 15:39:00 +0000\", \"status\": \"queued\", \"sid\": \"SMfe82b0d11645b962012d975160a2c47e\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SMfe82b0d11645b962012d975160a2c47e/Media.json\"}}', '2022-10-19 10:39:00'),
(165, 'MENSAJE ENVIADO; DATA: {\"body\": \"fdsfd\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Wed, 19 Oct 2022 15:39:01 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM2ae359c686a428bd4308af9f53818944.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5213315634756\", \"date_created\": \"Wed, 19 Oct 2022 15:39:01 +0000\", \"status\": \"queued\", \"sid\": \"SM2ae359c686a428bd4308af9f53818944\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM2ae359c686a428bd4308af9f53818944/Media.json\"}}', '2022-10-19 10:39:01'),
(166, 'MENSAJE ENVIADO; DATA: {\"body\": \"fdsfd\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Wed, 19 Oct 2022 15:39:06 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SMab5e2b6ff988f3b1bbf66f8a2bd11746.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5212281775791\", \"date_created\": \"Wed, 19 Oct 2022 15:39:06 +0000\", \"status\": \"queued\", \"sid\": \"SMab5e2b6ff988f3b1bbf66f8a2bd11746\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SMab5e2b6ff988f3b1bbf66f8a2bd11746/Media.json\"}}', '2022-10-19 10:39:06'),
(167, 'MENSAJE ENVIADO; DATA: {\"body\": \"fdsfd\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Wed, 19 Oct 2022 15:39:08 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM2605a2dbcb18a0529f2455eb562865b7.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5214777215252\", \"date_created\": \"Wed, 19 Oct 2022 15:39:08 +0000\", \"status\": \"queued\", \"sid\": \"SM2605a2dbcb18a0529f2455eb562865b7\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM2605a2dbcb18a0529f2455eb562865b7/Media.json\"}}', '2022-10-19 10:39:08'),
(168, 'MENSAJE ENVIADO; DATA: {\"body\": \"fdsfd\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Wed, 19 Oct 2022 15:39:08 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SMb8fc54862256a8b027c89043267a68fa.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5214771385376\", \"date_created\": \"Wed, 19 Oct 2022 15:39:08 +0000\", \"status\": \"queued\", \"sid\": \"SMb8fc54862256a8b027c89043267a68fa\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SMb8fc54862256a8b027c89043267a68fa/Media.json\"}}', '2022-10-19 10:39:08'),
(169, 'MENSAJE ENVIADO; DATA: {\"body\": \"fdsfd\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Wed, 19 Oct 2022 15:39:09 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SMc3f7b8d7136fa6cf77a33ad4b356b8d8.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5213322090166\", \"date_created\": \"Wed, 19 Oct 2022 15:39:09 +0000\", \"status\": \"queued\", \"sid\": \"SMc3f7b8d7136fa6cf77a33ad4b356b8d8\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SMc3f7b8d7136fa6cf77a33ad4b356b8d8/Media.json\"}}', '2022-10-19 10:39:09'),
(170, 'MENSAJE ENVIADO; DATA: {\"body\": \"fdsfd\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Wed, 19 Oct 2022 15:39:09 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SMc65e83fbe11571e0f6d5317632dad47c.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5214777215252\", \"date_created\": \"Wed, 19 Oct 2022 15:39:09 +0000\", \"status\": \"queued\", \"sid\": \"SMc65e83fbe11571e0f6d5317632dad47c\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SMc65e83fbe11571e0f6d5317632dad47c/Media.json\"}}', '2022-10-19 10:39:09'),
(171, 'MENSAJE ENVIADO; DATA: {\"body\": \"fdsfd\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Wed, 19 Oct 2022 15:39:09 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SMea8261c0584dbe6e3440bb502fe77744.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5214771385376\", \"date_created\": \"Wed, 19 Oct 2022 15:39:09 +0000\", \"status\": \"queued\", \"sid\": \"SMea8261c0584dbe6e3440bb502fe77744\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SMea8261c0584dbe6e3440bb502fe77744/Media.json\"}}', '2022-10-19 10:39:09'),
(172, 'MENSAJE ENVIADO; DATA: {\"body\": \"fdsfd\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Wed, 19 Oct 2022 15:39:10 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SMed736b3d47593ecac36e4ca6a696a6a8.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5213322503056\", \"date_created\": \"Wed, 19 Oct 2022 15:39:10 +0000\", \"status\": \"queued\", \"sid\": \"SMed736b3d47593ecac36e4ca6a696a6a8\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SMed736b3d47593ecac36e4ca6a696a6a8/Media.json\"}}', '2022-10-19 10:39:10'),
(173, 'MENSAJE ENVIADO; DATA: {\"body\": \"fdsfd\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Wed, 19 Oct 2022 15:39:10 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM9a538d616c0c4088f33e22bfdf4bf6b2.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5213312275426\", \"date_created\": \"Wed, 19 Oct 2022 15:39:10 +0000\", \"status\": \"queued\", \"sid\": \"SM9a538d616c0c4088f33e22bfdf4bf6b2\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM9a538d616c0c4088f33e22bfdf4bf6b2/Media.json\"}}', '2022-10-19 10:39:10'),
(174, 'MENSAJE ENVIADO; DATA: {\"body\": \"fdsfd\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Wed, 19 Oct 2022 15:39:11 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM4c2b1b6362b699208e71776ef0ef026b.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5213321624934\", \"date_created\": \"Wed, 19 Oct 2022 15:39:11 +0000\", \"status\": \"queued\", \"sid\": \"SM4c2b1b6362b699208e71776ef0ef026b\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM4c2b1b6362b699208e71776ef0ef026b/Media.json\"}}', '2022-10-19 10:39:11'),
(175, 'MENSAJE ENVIADO; DATA: {\"body\": \"fdsfd\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Wed, 19 Oct 2022 15:39:11 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM2e33daa5de4d2310476294ea878061a9.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5213315634756\", \"date_created\": \"Wed, 19 Oct 2022 15:39:11 +0000\", \"status\": \"queued\", \"sid\": \"SM2e33daa5de4d2310476294ea878061a9\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM2e33daa5de4d2310476294ea878061a9/Media.json\"}}', '2022-10-19 10:39:11'),
(176, 'MENSAJE NO ENVIADO; DATA: {\"code\": 63018, \"message\": \"Account ACdbba939db69ef782da3c5c0cc31c63ae exceeded the 1 rps rate limit\", \"more_info\": \"https://www.twilio.com/docs/errors/63018\", \"status\": 429}', '2022-10-19 10:39:12'),
(177, 'MENSAJE ENVIADO; DATA: {\"body\": \"fdsfd\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Wed, 19 Oct 2022 15:39:12 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM660f6cba1e20b2cbae13f23f2340e383.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5214777215252\", \"date_created\": \"Wed, 19 Oct 2022 15:39:12 +0000\", \"status\": \"queued\", \"sid\": \"SM660f6cba1e20b2cbae13f23f2340e383\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM660f6cba1e20b2cbae13f23f2340e383/Media.json\"}}', '2022-10-19 10:39:12'),
(178, 'MENSAJE NO ENVIADO; DATA: {\"code\": 63018, \"message\": \"Account ACdbba939db69ef782da3c5c0cc31c63ae exceeded the 1 rps rate limit\", \"more_info\": \"https://www.twilio.com/docs/errors/63018\", \"status\": 429}', '2022-10-19 10:39:13'),
(179, 'MENSAJE NO ENVIADO; DATA: {\"code\": 63018, \"message\": \"Account ACdbba939db69ef782da3c5c0cc31c63ae exceeded the 1 rps rate limit\", \"more_info\": \"https://www.twilio.com/docs/errors/63018\", \"status\": 429}', '2022-10-19 10:39:13'),
(180, 'MENSAJE ENVIADO; DATA: {\"body\": \"fdsfd\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Wed, 19 Oct 2022 15:39:14 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SMde9aa6078b8734fb48a4b9c75a15c8e7.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5214777215252\", \"date_created\": \"Wed, 19 Oct 2022 15:39:14 +0000\", \"status\": \"queued\", \"sid\": \"SMde9aa6078b8734fb48a4b9c75a15c8e7\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SMde9aa6078b8734fb48a4b9c75a15c8e7/Media.json\"}}', '2022-10-19 10:39:14'),
(181, 'MENSAJE NO ENVIADO; DATA: {\"code\": 63018, \"message\": \"Account ACdbba939db69ef782da3c5c0cc31c63ae exceeded the 1 rps rate limit\", \"more_info\": \"https://www.twilio.com/docs/errors/63018\", \"status\": 429}', '2022-10-19 10:39:14'),
(182, 'MENSAJE NO ENVIADO; DATA: {\"code\": 63018, \"message\": \"Account ACdbba939db69ef782da3c5c0cc31c63ae exceeded the 1 rps rate limit\", \"more_info\": \"https://www.twilio.com/docs/errors/63018\", \"status\": 429}', '2022-10-19 10:39:14'),
(183, 'MENSAJE ENVIADO; DATA: {\"body\": \"fdsfd\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Wed, 19 Oct 2022 15:39:15 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SMf93cb44b5fbfbd4abdf61ec605de46a6.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5213312275426\", \"date_created\": \"Wed, 19 Oct 2022 15:39:15 +0000\", \"status\": \"queued\", \"sid\": \"SMf93cb44b5fbfbd4abdf61ec605de46a6\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SMf93cb44b5fbfbd4abdf61ec605de46a6/Media.json\"}}', '2022-10-19 10:39:15'),
(184, 'MENSAJE NO ENVIADO; DATA: {\"code\": 63018, \"message\": \"Account ACdbba939db69ef782da3c5c0cc31c63ae exceeded the 1 rps rate limit\", \"more_info\": \"https://www.twilio.com/docs/errors/63018\", \"status\": 429}', '2022-10-19 10:39:15'),
(185, 'MENSAJE NO ENVIADO; DATA: {\"code\": 63018, \"message\": \"Account ACdbba939db69ef782da3c5c0cc31c63ae exceeded the 1 rps rate limit\", \"more_info\": \"https://www.twilio.com/docs/errors/63018\", \"status\": 429}', '2022-10-19 10:39:16'),
(186, 'MENSAJE ENVIADO; DATA: {\"body\": \"fdsfd\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Wed, 19 Oct 2022 15:39:16 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SMc11c73b7c7913dd79beb0d1b62192625.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5212281775791\", \"date_created\": \"Wed, 19 Oct 2022 15:39:16 +0000\", \"status\": \"queued\", \"sid\": \"SMc11c73b7c7913dd79beb0d1b62192625\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SMc11c73b7c7913dd79beb0d1b62192625/Media.json\"}}', '2022-10-19 10:39:16'),
(187, 'MENSAJE NO ENVIADO; DATA: {\"code\": 63018, \"message\": \"Account ACdbba939db69ef782da3c5c0cc31c63ae exceeded the 1 rps rate limit\", \"more_info\": \"https://www.twilio.com/docs/errors/63018\", \"status\": 429}', '2022-10-19 10:39:16'),
(188, 'MENSAJE NO ENVIADO; DATA: {\"code\": 63018, \"message\": \"Account ACdbba939db69ef782da3c5c0cc31c63ae exceeded the 1 rps rate limit\", \"more_info\": \"https://www.twilio.com/docs/errors/63018\", \"status\": 429}', '2022-10-19 10:39:17'),
(189, 'MENSAJE ENVIADO; DATA: {\"body\": \"fdsfd\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Thu, 20 Oct 2022 18:38:07 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SMe35105c6c3d3d16e0a6dd005493fea6f.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5213322090166\", \"date_created\": \"Thu, 20 Oct 2022 18:38:07 +0000\", \"status\": \"queued\", \"sid\": \"SMe35105c6c3d3d16e0a6dd005493fea6f\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SMe35105c6c3d3d16e0a6dd005493fea6f/Media.json\"}}', '2022-10-20 13:38:07'),
(190, 'MENSAJE ENVIADO; DATA: {\"body\": \"fdsfd\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Thu, 20 Oct 2022 18:38:08 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM0e1b6871e581936f7a4a49b199f29239.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5214777215252\", \"date_created\": \"Thu, 20 Oct 2022 18:38:08 +0000\", \"status\": \"queued\", \"sid\": \"SM0e1b6871e581936f7a4a49b199f29239\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM0e1b6871e581936f7a4a49b199f29239/Media.json\"}}', '2022-10-20 13:38:08'),
(191, 'MENSAJE ENVIADO; DATA: {\"body\": \"fdsfd\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Thu, 20 Oct 2022 18:38:08 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SMc6350154a39f8c194ff421217227496e.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5214771385376\", \"date_created\": \"Thu, 20 Oct 2022 18:38:08 +0000\", \"status\": \"queued\", \"sid\": \"SMc6350154a39f8c194ff421217227496e\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SMc6350154a39f8c194ff421217227496e/Media.json\"}}', '2022-10-20 13:38:08');
INSERT INTO `logs` (`id`, `description`, `date`) VALUES
(192, 'MENSAJE ENVIADO; DATA: {\"body\": \"fdsfd\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Thu, 20 Oct 2022 18:38:09 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SMbde73a099f265e50ab6ce87e1933550f.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5213322503056\", \"date_created\": \"Thu, 20 Oct 2022 18:38:09 +0000\", \"status\": \"queued\", \"sid\": \"SMbde73a099f265e50ab6ce87e1933550f\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SMbde73a099f265e50ab6ce87e1933550f/Media.json\"}}', '2022-10-20 13:38:09'),
(193, 'MENSAJE ENVIADO; DATA: {\"body\": \"fdsfd\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Thu, 20 Oct 2022 18:38:10 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM0c745dcd01ee824ef395537ed52ba1be.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5213312275426\", \"date_created\": \"Thu, 20 Oct 2022 18:38:10 +0000\", \"status\": \"queued\", \"sid\": \"SM0c745dcd01ee824ef395537ed52ba1be\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM0c745dcd01ee824ef395537ed52ba1be/Media.json\"}}', '2022-10-20 13:38:09'),
(194, 'MENSAJE ENVIADO; DATA: {\"body\": \"fdsfd\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Thu, 20 Oct 2022 18:38:10 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM584f88fd49ce633767adc44022e219da.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5213321624934\", \"date_created\": \"Thu, 20 Oct 2022 18:38:10 +0000\", \"status\": \"queued\", \"sid\": \"SM584f88fd49ce633767adc44022e219da\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM584f88fd49ce633767adc44022e219da/Media.json\"}}', '2022-10-20 13:38:10'),
(195, 'MENSAJE ENVIADO; DATA: {\"body\": \"fdsfd\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Thu, 20 Oct 2022 18:38:11 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM4b12e1dc4364358556e9fc3b09136b31.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5213315634756\", \"date_created\": \"Thu, 20 Oct 2022 18:38:11 +0000\", \"status\": \"queued\", \"sid\": \"SM4b12e1dc4364358556e9fc3b09136b31\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM4b12e1dc4364358556e9fc3b09136b31/Media.json\"}}', '2022-10-20 13:38:11'),
(196, 'MENSAJE ENVIADO; DATA: {\"body\": \"fdsfd\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Thu, 20 Oct 2022 18:38:12 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM376c2a73da434214cfa9a847c29dccf4.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5212281775791\", \"date_created\": \"Thu, 20 Oct 2022 18:38:12 +0000\", \"status\": \"queued\", \"sid\": \"SM376c2a73da434214cfa9a847c29dccf4\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM376c2a73da434214cfa9a847c29dccf4/Media.json\"}}', '2022-10-20 13:38:12'),
(197, 'MENSAJE ENVIADO; DATA: {\"body\": \"fdsfd\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Thu, 20 Oct 2022 18:38:12 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM0cc24b82543c274a96774acd240ba339.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5214777215252\", \"date_created\": \"Thu, 20 Oct 2022 18:38:12 +0000\", \"status\": \"queued\", \"sid\": \"SM0cc24b82543c274a96774acd240ba339\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM0cc24b82543c274a96774acd240ba339/Media.json\"}}', '2022-10-20 13:38:12'),
(198, 'MENSAJE ENVIADO; DATA: {\"body\": \"fdsfd\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Thu, 20 Oct 2022 18:38:13 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SMdbe01f5af1477fead0d3ecbc4763c500.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5214771385376\", \"date_created\": \"Thu, 20 Oct 2022 18:38:13 +0000\", \"status\": \"queued\", \"sid\": \"SMdbe01f5af1477fead0d3ecbc4763c500\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SMdbe01f5af1477fead0d3ecbc4763c500/Media.json\"}}', '2022-10-20 13:38:13'),
(199, 'MENSAJE ENVIADO; DATA: {\"body\": \"fdsfd\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Thu, 20 Oct 2022 18:38:36 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM86b77f38862882e0b3a95235d3be1360.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5213322090166\", \"date_created\": \"Thu, 20 Oct 2022 18:38:36 +0000\", \"status\": \"queued\", \"sid\": \"SM86b77f38862882e0b3a95235d3be1360\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM86b77f38862882e0b3a95235d3be1360/Media.json\"}}', '2022-10-20 13:38:36'),
(200, 'MENSAJE ENVIADO; DATA: {\"body\": \"fdsfd\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Thu, 20 Oct 2022 18:38:37 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM371cd21aa80bc2a8416d2c658a2150fd.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5214777215252\", \"date_created\": \"Thu, 20 Oct 2022 18:38:37 +0000\", \"status\": \"queued\", \"sid\": \"SM371cd21aa80bc2a8416d2c658a2150fd\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM371cd21aa80bc2a8416d2c658a2150fd/Media.json\"}}', '2022-10-20 13:38:36'),
(201, 'MENSAJE ENVIADO; DATA: {\"body\": \"fdsfd\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Thu, 20 Oct 2022 18:38:37 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SMaf143136ed852de7164d1553d1532528.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5214771385376\", \"date_created\": \"Thu, 20 Oct 2022 18:38:37 +0000\", \"status\": \"queued\", \"sid\": \"SMaf143136ed852de7164d1553d1532528\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SMaf143136ed852de7164d1553d1532528/Media.json\"}}', '2022-10-20 13:38:37'),
(202, 'MENSAJE ENVIADO; DATA: {\"body\": \"fdsfd\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Thu, 20 Oct 2022 18:38:38 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SMff61fef5aec255c70b4864d0ff15ca9e.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5213322503056\", \"date_created\": \"Thu, 20 Oct 2022 18:38:38 +0000\", \"status\": \"queued\", \"sid\": \"SMff61fef5aec255c70b4864d0ff15ca9e\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SMff61fef5aec255c70b4864d0ff15ca9e/Media.json\"}}', '2022-10-20 13:38:38'),
(203, 'MENSAJE ENVIADO; DATA: {\"body\": \"fdsfd\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Thu, 20 Oct 2022 18:38:39 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM779eea97432fada9d06ccf4440304622.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5213312275426\", \"date_created\": \"Thu, 20 Oct 2022 18:38:39 +0000\", \"status\": \"queued\", \"sid\": \"SM779eea97432fada9d06ccf4440304622\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM779eea97432fada9d06ccf4440304622/Media.json\"}}', '2022-10-20 13:38:39'),
(204, 'MENSAJE ENVIADO; DATA: {\"body\": \"fdsfd\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Thu, 20 Oct 2022 18:38:39 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM1308758125e82cb3c3c7ba3092705781.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5213321624934\", \"date_created\": \"Thu, 20 Oct 2022 18:38:39 +0000\", \"status\": \"queued\", \"sid\": \"SM1308758125e82cb3c3c7ba3092705781\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM1308758125e82cb3c3c7ba3092705781/Media.json\"}}', '2022-10-20 13:38:39'),
(205, 'MENSAJE ENVIADO; DATA: {\"body\": \"fdsfd\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Thu, 20 Oct 2022 18:38:40 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM75a5d1d3c4a7ae5f0a5ec7aae6c94a0e.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5213315634756\", \"date_created\": \"Thu, 20 Oct 2022 18:38:40 +0000\", \"status\": \"queued\", \"sid\": \"SM75a5d1d3c4a7ae5f0a5ec7aae6c94a0e\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM75a5d1d3c4a7ae5f0a5ec7aae6c94a0e/Media.json\"}}', '2022-10-20 13:38:40'),
(206, 'MENSAJE ENVIADO; DATA: {\"body\": \"fdsfd\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Thu, 20 Oct 2022 18:38:41 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM71f61875c52ae8d2647c5e729e20c5c4.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5212281775791\", \"date_created\": \"Thu, 20 Oct 2022 18:38:41 +0000\", \"status\": \"queued\", \"sid\": \"SM71f61875c52ae8d2647c5e729e20c5c4\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM71f61875c52ae8d2647c5e729e20c5c4/Media.json\"}}', '2022-10-20 13:38:41'),
(207, 'MENSAJE ENVIADO; DATA: {\"body\": \"fdsfd\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Thu, 20 Oct 2022 18:38:42 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SMbc8cd783122966abcf59a22f528affa7.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5214777215252\", \"date_created\": \"Thu, 20 Oct 2022 18:38:42 +0000\", \"status\": \"queued\", \"sid\": \"SMbc8cd783122966abcf59a22f528affa7\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SMbc8cd783122966abcf59a22f528affa7/Media.json\"}}', '2022-10-20 13:38:42'),
(208, 'MENSAJE ENVIADO; DATA: {\"body\": \"fdsfd\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Thu, 20 Oct 2022 18:38:42 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM1b1bdadf7736f06e6a3940907d30f8fb.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5214771385376\", \"date_created\": \"Thu, 20 Oct 2022 18:38:42 +0000\", \"status\": \"queued\", \"sid\": \"SM1b1bdadf7736f06e6a3940907d30f8fb\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM1b1bdadf7736f06e6a3940907d30f8fb/Media.json\"}}', '2022-10-20 13:38:42'),
(209, 'MENSAJE ENVIADO; DATA: {\"body\": \"Buen d\\u00eda, le recuerdo que el d\\u00eda 25 de oct, no se laborar\\u00e1, favor de confirmar por este medio. Gracias y buen d\\u00eda .\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Thu, 20 Oct 2022 18:38:50 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SMd3452ded2a4d9543da9fdf1763ec79a8.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5214771385376\", \"date_created\": \"Thu, 20 Oct 2022 18:38:50 +0000\", \"status\": \"queued\", \"sid\": \"SMd3452ded2a4d9543da9fdf1763ec79a8\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SMd3452ded2a4d9543da9fdf1763ec79a8/Media.json\"}}', '2022-10-20 13:38:50'),
(210, 'MENSAJE ENVIADO; DATA: {\"body\": \"Buen d\\u00eda, le recuerdo que el d\\u00eda 25 de oct, no se laborar\\u00e1, favor de confirmar por este medio. Gracias y buen d\\u00eda .\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Thu, 20 Oct 2022 18:38:50 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM2bd6467ee18783230be5ec3e4effc728.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5213312275426\", \"date_created\": \"Thu, 20 Oct 2022 18:38:50 +0000\", \"status\": \"queued\", \"sid\": \"SM2bd6467ee18783230be5ec3e4effc728\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM2bd6467ee18783230be5ec3e4effc728/Media.json\"}}', '2022-10-20 13:38:50'),
(211, 'MENSAJE ENVIADO; DATA: {\"body\": \"Con el gusto de saludarle, le avisamos que nuestro consultorio estar\\u00e1 cerrado el d\\u00eda lunes 24 de octubre. De antemano muchas gracias.\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Fri, 21 Oct 2022 15:38:11 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM0f397469a52b6ecef9d2ffefceec6a90.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5213322090166\", \"date_created\": \"Fri, 21 Oct 2022 15:38:11 +0000\", \"status\": \"queued\", \"sid\": \"SM0f397469a52b6ecef9d2ffefceec6a90\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM0f397469a52b6ecef9d2ffefceec6a90/Media.json\"}}', '2022-10-21 10:38:11'),
(212, 'MENSAJE ENVIADO; DATA: {\"body\": \"Con el gusto de saludarle, le avisamos que nuestro consultorio estar\\u00e1 cerrado el d\\u00eda lunes 24 de octubre. De antemano muchas gracias.\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Fri, 21 Oct 2022 15:38:11 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SMac3070b1edac1bc3b0ca148ec1d115cc.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5214777215252\", \"date_created\": \"Fri, 21 Oct 2022 15:38:11 +0000\", \"status\": \"queued\", \"sid\": \"SMac3070b1edac1bc3b0ca148ec1d115cc\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SMac3070b1edac1bc3b0ca148ec1d115cc/Media.json\"}}', '2022-10-21 10:38:11'),
(213, 'MENSAJE ENVIADO; DATA: {\"body\": \"Con el gusto de saludarle, le avisamos que nuestro consultorio estar\\u00e1 cerrado el d\\u00eda lunes 24 de octubre. De antemano muchas gracias.\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Fri, 21 Oct 2022 15:38:12 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SMef94ac1a7a61aec371e938115a5b3420.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5214771385376\", \"date_created\": \"Fri, 21 Oct 2022 15:38:12 +0000\", \"status\": \"queued\", \"sid\": \"SMef94ac1a7a61aec371e938115a5b3420\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SMef94ac1a7a61aec371e938115a5b3420/Media.json\"}}', '2022-10-21 10:38:12'),
(214, 'MENSAJE ENVIADO; DATA: {\"body\": \"Con el gusto de saludarle, le avisamos que nuestro consultorio estar\\u00e1 cerrado el d\\u00eda lunes 24 de octubre. De antemano muchas gracias.\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Fri, 21 Oct 2022 15:38:12 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM61dfebf950801b15978143cf32ce91ec.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5213322503056\", \"date_created\": \"Fri, 21 Oct 2022 15:38:12 +0000\", \"status\": \"queued\", \"sid\": \"SM61dfebf950801b15978143cf32ce91ec\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM61dfebf950801b15978143cf32ce91ec/Media.json\"}}', '2022-10-21 10:38:12'),
(215, 'MENSAJE ENVIADO; DATA: {\"body\": \"Con el gusto de saludarle, le avisamos que nuestro consultorio estar\\u00e1 cerrado el d\\u00eda lunes 24 de octubre. De antemano muchas gracias.\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Fri, 21 Oct 2022 15:38:13 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SMb7ed2a30b7d8006de21bd577bcb003bb.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5213312275426\", \"date_created\": \"Fri, 21 Oct 2022 15:38:13 +0000\", \"status\": \"queued\", \"sid\": \"SMb7ed2a30b7d8006de21bd577bcb003bb\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SMb7ed2a30b7d8006de21bd577bcb003bb/Media.json\"}}', '2022-10-21 10:38:13'),
(216, 'MENSAJE ENVIADO; DATA: {\"body\": \"Con el gusto de saludarle, le avisamos que nuestro consultorio estar\\u00e1 cerrado el d\\u00eda lunes 24 de octubre. De antemano muchas gracias.\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Fri, 21 Oct 2022 15:38:13 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM4a5f25d9782656526eefbbfc3248cf9f.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5213321624934\", \"date_created\": \"Fri, 21 Oct 2022 15:38:13 +0000\", \"status\": \"queued\", \"sid\": \"SM4a5f25d9782656526eefbbfc3248cf9f\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM4a5f25d9782656526eefbbfc3248cf9f/Media.json\"}}', '2022-10-21 10:38:13'),
(217, 'MENSAJE ENVIADO; DATA: {\"body\": \"Con el gusto de saludarle, le avisamos que nuestro consultorio estar\\u00e1 cerrado el d\\u00eda lunes 24 de octubre. De antemano muchas gracias.\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Fri, 21 Oct 2022 15:38:14 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM1fa826df3e26fa0880585851d34aec24.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5213315634756\", \"date_created\": \"Fri, 21 Oct 2022 15:38:14 +0000\", \"status\": \"queued\", \"sid\": \"SM1fa826df3e26fa0880585851d34aec24\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM1fa826df3e26fa0880585851d34aec24/Media.json\"}}', '2022-10-21 10:38:14'),
(218, 'MENSAJE ENVIADO; DATA: {\"body\": \"Con el gusto de saludarle, le avisamos que nuestro consultorio estar\\u00e1 cerrado el d\\u00eda lunes 24 de octubre. De antemano muchas gracias.\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Fri, 21 Oct 2022 15:38:14 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SMa3fc849285bf524419b714eeafbfa53e.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5212281775791\", \"date_created\": \"Fri, 21 Oct 2022 15:38:14 +0000\", \"status\": \"queued\", \"sid\": \"SMa3fc849285bf524419b714eeafbfa53e\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SMa3fc849285bf524419b714eeafbfa53e/Media.json\"}}', '2022-10-21 10:38:14'),
(219, 'MENSAJE ENVIADO; DATA: {\"body\": \"Con el gusto de saludarle, le avisamos que nuestro consultorio estar\\u00e1 cerrado el d\\u00eda lunes 24 de octubre. De antemano muchas gracias.\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Fri, 21 Oct 2022 15:38:14 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SMb6e11bf5d9c3d3b5b365c09642d2e3b2.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5214777215252\", \"date_created\": \"Fri, 21 Oct 2022 15:38:14 +0000\", \"status\": \"queued\", \"sid\": \"SMb6e11bf5d9c3d3b5b365c09642d2e3b2\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SMb6e11bf5d9c3d3b5b365c09642d2e3b2/Media.json\"}}', '2022-10-21 10:38:14'),
(220, 'MENSAJE ENVIADO; DATA: {\"body\": \"Con el gusto de saludarle, le avisamos que nuestro consultorio estar\\u00e1 cerrado el d\\u00eda lunes 24 de octubre. De antemano muchas gracias.\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Fri, 21 Oct 2022 15:38:15 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM9ec95bb7625a07b09b360bf5d140126b.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5214771385376\", \"date_created\": \"Fri, 21 Oct 2022 15:38:15 +0000\", \"status\": \"queued\", \"sid\": \"SM9ec95bb7625a07b09b360bf5d140126b\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM9ec95bb7625a07b09b360bf5d140126b/Media.json\"}}', '2022-10-21 10:38:15'),
(221, 'Notificación: Mensaje de prueba. Ha sido llamado para enviar mensaje', '2022-10-21 11:36:24'),
(222, 'MENSAJE ENVIADO; DATA: {\"body\": \"Mensaje de prueba\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Fri, 21 Oct 2022 16:36:24 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM3a40db70316cd03ca8bd378602d84d72.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5213322090166\", \"date_created\": \"Fri, 21 Oct 2022 16:36:24 +0000\", \"status\": \"queued\", \"sid\": \"SM3a40db70316cd03ca8bd378602d84d72\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM3a40db70316cd03ca8bd378602d84d72/Media.json\"}}', '2022-10-21 11:36:24'),
(223, 'MENSAJE ENVIADO; DATA: {\"body\": \"Mensaje de prueba\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Fri, 21 Oct 2022 16:36:25 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM18d88429052a6ab5315c3dd97e1f46d8.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5214777215252\", \"date_created\": \"Fri, 21 Oct 2022 16:36:25 +0000\", \"status\": \"queued\", \"sid\": \"SM18d88429052a6ab5315c3dd97e1f46d8\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM18d88429052a6ab5315c3dd97e1f46d8/Media.json\"}}', '2022-10-21 11:36:25'),
(224, 'MENSAJE ENVIADO; DATA: {\"body\": \"Mensaje de prueba\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Fri, 21 Oct 2022 16:36:25 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM0207108089c4c6d0d0ce58ec9d2a4036.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5214771385376\", \"date_created\": \"Fri, 21 Oct 2022 16:36:25 +0000\", \"status\": \"queued\", \"sid\": \"SM0207108089c4c6d0d0ce58ec9d2a4036\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM0207108089c4c6d0d0ce58ec9d2a4036/Media.json\"}}', '2022-10-21 11:36:25'),
(225, 'MENSAJE ENVIADO; DATA: {\"body\": \"Mensaje de prueba\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Fri, 21 Oct 2022 16:36:26 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SMc0d441edd31393e620a4e50fb6b9dde9.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5213322503056\", \"date_created\": \"Fri, 21 Oct 2022 16:36:26 +0000\", \"status\": \"queued\", \"sid\": \"SMc0d441edd31393e620a4e50fb6b9dde9\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SMc0d441edd31393e620a4e50fb6b9dde9/Media.json\"}}', '2022-10-21 11:36:26'),
(226, 'MENSAJE ENVIADO; DATA: {\"body\": \"Mensaje de prueba\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Fri, 21 Oct 2022 16:36:26 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM2af7f2dfcac9fda9ae9a4a6a32307d33.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5213312275426\", \"date_created\": \"Fri, 21 Oct 2022 16:36:26 +0000\", \"status\": \"queued\", \"sid\": \"SM2af7f2dfcac9fda9ae9a4a6a32307d33\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SM2af7f2dfcac9fda9ae9a4a6a32307d33/Media.json\"}}', '2022-10-21 11:36:26'),
(227, 'MENSAJE ENVIADO; DATA: {\"body\": \"Mensaje de prueba\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Fri, 21 Oct 2022 16:36:27 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SMfc58f2fac4ea76ebcc77986d10bc5b64.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5213321624934\", \"date_created\": \"Fri, 21 Oct 2022 16:36:27 +0000\", \"status\": \"queued\", \"sid\": \"SMfc58f2fac4ea76ebcc77986d10bc5b64\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SMfc58f2fac4ea76ebcc77986d10bc5b64/Media.json\"}}', '2022-10-21 11:36:27'),
(228, 'MENSAJE ENVIADO; DATA: {\"body\": \"Mensaje de prueba\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Fri, 21 Oct 2022 16:36:27 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SMb775a8caa430c8d69e4a19cbff8e1add.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5213315634756\", \"date_created\": \"Fri, 21 Oct 2022 16:36:27 +0000\", \"status\": \"queued\", \"sid\": \"SMb775a8caa430c8d69e4a19cbff8e1add\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SMb775a8caa430c8d69e4a19cbff8e1add/Media.json\"}}', '2022-10-21 11:36:27'),
(229, 'MENSAJE ENVIADO; DATA: {\"body\": \"Mensaje de prueba\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Fri, 21 Oct 2022 16:36:28 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SMd76772d228adc80a72c48a589005a257.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5212281775791\", \"date_created\": \"Fri, 21 Oct 2022 16:36:28 +0000\", \"status\": \"queued\", \"sid\": \"SMd76772d228adc80a72c48a589005a257\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SMd76772d228adc80a72c48a589005a257/Media.json\"}}', '2022-10-21 11:36:28'),
(230, 'MENSAJE ENVIADO; DATA: {\"body\": \"Mensaje de prueba\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Fri, 21 Oct 2022 16:36:28 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SMde531f189eb43dd517f46694ff1cabeb.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5214777215252\", \"date_created\": \"Fri, 21 Oct 2022 16:36:28 +0000\", \"status\": \"queued\", \"sid\": \"SMde531f189eb43dd517f46694ff1cabeb\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SMde531f189eb43dd517f46694ff1cabeb/Media.json\"}}', '2022-10-21 11:36:28'),
(231, 'MENSAJE ENVIADO; DATA: {\"body\": \"Mensaje de prueba\", \"num_segments\": \"1\", \"direction\": \"outbound-api\", \"from\": \"whatsapp:+14155238886\", \"date_updated\": \"Fri, 21 Oct 2022 16:36:29 +0000\", \"price\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SMa95711463e81d235d29b9fa09099429c.json\", \"account_sid\": \"ACdbba939db69ef782da3c5c0cc31c63ae\", \"num_media\": \"0\", \"to\": \"whatsapp:+5214771385376\", \"date_created\": \"Fri, 21 Oct 2022 16:36:29 +0000\", \"status\": \"queued\", \"sid\": \"SMa95711463e81d235d29b9fa09099429c\", \"date_sent\": null, \"messaging_service_sid\": null, \"error_code\": null, \"price_unit\": null, \"api_version\": \"2010-04-01\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/ACdbba939db69ef782da3c5c0cc31c63ae/Messages/SMa95711463e81d235d29b9fa09099429c/Media.json\"}}', '2022-10-21 11:36:29');

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
  `send_to` enum('client','staff') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'client',
  `date_added` int(11) DEFAULT NULL,
  `last_modified` int(11) DEFAULT NULL,
  `is_recurrent` int(11) NOT NULL DEFAULT '0',
  `quantity` int(11) DEFAULT NULL,
  `recurrency` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `next_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `notice`
--

INSERT INTO `notice` (`notice_id`, `title`, `description`, `published_by`, `visible_for`, `send_to`, `date_added`, `last_modified`, `is_recurrent`, `quantity`, `recurrency`, `next_date`) VALUES
(1, 'Día festivo', 'Con el gusto de saludarte, el día 18 de octubre del presente año, cerraremos nuestros servicios a partir de las 3:00 PM.\r\nDe antemano muchas gracias y buen día.', 1, 1, 'client', 1663100892, 1666029523, 0, NULL, NULL, NULL),
(2, 'Prueba', 'Este es un aviso de prueba', 1, 1, 'client', 1663735765, 1666029511, 0, NULL, NULL, NULL),
(3, 'No olvides agendar', 'No olvides agendar máximo 3 días antes de tu cita', 1, 1, 'client', 1666029401, 1666029797, 0, NULL, NULL, NULL),
(4, 'AVISO 17-OCT-2022', 'Buen día, le recuerdo que el día 25 de oct, no se laborará, favor de confirmar por este medio. Gracias y buen día .', 1, 1, 'staff', 1666039829, 1666042163, 0, NULL, NULL, NULL),
(15, 'sda', 'Mensaje de prueba', 1, 1, 'client', 1666125463, 1666370171, 1, 1, 'days', '2022-10-22'),
(17, 'Lunes 24 no se estara atendiendo', 'Con el gusto de saludarle, le avisamos que nuestro consultorio estará cerrado el día lunes 24 de octubre. De antemano muchas gracias.', 1, 1, 'client', 1666366654, NULL, 0, 1, 'Recurrencia', NULL);

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
(15, 'Prueba3', 'Prueba3', '1', 0, '1657140274', 1657141071, 'Prueba3', 400, 500, 1500, 'Prueba3', '', '2022-07-14'),
(16, 'Medicamento b', 'para dolores fuertes', '1', 1, '1663114339', 1663114384, 'UUU', 394, 250, 300, 'Medicamento', 'pantorrilla2.png', '2028-07-28'),
(17, 'Toallas', '', '1', 0, '1666366206', NULL, 'sm', 98, 500, 500, 'Insumos', '', '2022-10-21');

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
(11, 'Acido', '9585cd3040', 5, 0, 5000, '1664064000', NULL, 1, 'NADA', 24),
(12, 'Test Quanti', '9585cd3040', 5, 0, 1200, '-64800', NULL, 1, '', 30),
(13, 'TEST NUEVO', '9585cd3040', 5, 0, 12000, '0', NULL, 0, '', 38),
(14, 'TEST NUEVO', '9585cd3040', 5, 0, 12000, '0', NULL, 0, '', 38),
(15, 'TESTPAYMENT', '9585cd3040', 5, 0, 1200, '0', NULL, 0, '', 37),
(16, 'TEST NUEVO', '9585cd3040', 5, 0, 12000, '0', NULL, 0, '', 38),
(17, 'TEST NUEVO', '9585cd3040', 5, 0, 12000, '0', NULL, 0, '', 38),
(18, 'TEST NUEVO', '9585cd3040', 5, 0, 12000, '0', NULL, 0, '', 38),
(19, 'TEST NUEVO', '9585cd3040', 5, 0, 12000, '0', NULL, 0, '', 38),
(20, 'TEST NUEVO', '9585cd3040', 5, 0, 12000, '0', NULL, 0, '', 38),
(21, 'TEST NUEVO', '9585cd3040', 5, 0, 12000, '0', NULL, 0, '', 38),
(22, 'TEST NUEVO', '9585cd3040', 5, 0, 12000, '0', NULL, 0, '', 38),
(23, 'TEST NUEVO', '9585cd3040', 5, 0, 12000, '0', NULL, 0, '', 38),
(24, 'TEST NUEVO', '9585cd3040', 5, 0, 12000, '0', NULL, 0, '', 38),
(25, 'TEST NUEVO', '9585cd3040', 5, 0, 12000, '0', NULL, 0, '', 38),
(26, 'TEST NUEVO', '9585cd3040', 5, 0, 12000, '0', NULL, 0, '', 38),
(27, 'TEST NUEVO', '9585cd3040', 5, 0, 12000, '0', NULL, 1, '', 38),
(28, 'TEST NUEVO', '9585cd3040', 5, 0, 12000, '-64800', NULL, 1, '', 38),
(29, 'TEST NUEVO', '9585cd3040', 5, 0, 12000, '0', NULL, 0, '', 38),
(30, 'TEST NUEVO', '9585cd3040', 5, 0, 12000, '-64800', NULL, 1, '', 38),
(31, 'TEST NUEVO', '9585cd3040', 5, 0, 12000, '0', NULL, 1, '', 38),
(32, 'TEST NUEVO', '9585cd3040', 5, 0, 12000, '-64800', NULL, 1, '', 38),
(33, 'Botox', '9585cd3040', 5, 0, 5000, '0', NULL, 0, '', 23),
(34, 'TEST NUEVO', '9585cd3040', 5, 0, 12000, '0', NULL, 1, '', 38),
(35, 'Servicio de prueba 1', '9585cd3040', 5, 0, 15000, '0', NULL, 1, '', 39),
(36, 'Hollywood Peel', '9585cd3040', 5, 0, 1000, '0', NULL, 1, '', 40);

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
-- Estructura de tabla para la tabla `service_products`
--

CREATE TABLE `service_products` (
  `id` int(11) NOT NULL,
  `id_service` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `left_quantity` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `service_products`
--

INSERT INTO `service_products` (`id`, `id_service`, `id_product`, `quantity`, `left_quantity`) VALUES
(1, 1, 15, 12, 5),
(2, 1, 16, 2, 0),
(3, 1, 16, 10, 0),
(4, 1, 15, 20, 0),
(5, 32, 16, 10, 0),
(6, 32, 15, 20, 0),
(7, 33, 15, 10, 0),
(8, 34, 15, 1, 0),
(9, 34, 16, 20, 0),
(10, 35, 16, 10, 0),
(11, 35, 15, 2, 0),
(12, 36, 15, 2, 0),
(13, 36, 16, 20, 0),
(14, 37, 15, 5, 5),
(15, 37, 16, 5, 5),
(16, 38, 15, 20, 5),
(17, 38, 16, 20, 25),
(18, 39, 16, 2, 398),
(19, 40, 17, 2, 98),
(20, 40, 16, 4, 394);

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
(24, 'Acido', 'Primera aplicación', '1', 0, '1663113213', NULL, 5000, 'pata.png'),
(25, 'Test', 'New Test', '1', 0, '1665680042', NULL, 1000, '2-Weeks.jpg'),
(26, 'Test', 'New Test', '1', 0, '1665680419', NULL, 1000, '2-Weeks.jpg'),
(27, 'Test', 'New Test', '1', 0, '1665680449', NULL, 1000, '2-Weeks.jpg'),
(28, 'Testing', 'Nuevo Test', '1', 0, '1665688463', NULL, 1200, ''),
(29, 'carpeta', 'sdaf', '1', 0, '1665688502', NULL, 0, ''),
(30, 'Test Quanti', 'asdfsdf', '1', 0, '1665688577', NULL, 1200, ''),
(31, 'Test for dany', 'testing', '1', 0, '1665688627', NULL, 1200, ''),
(32, 'Test for dany', 'testing', '1', 0, '1665688692', NULL, 1200, ''),
(33, 'Test idx', 'sajfbsdjfn', '1', 0, '1665688704', NULL, 1200, ''),
(34, 'testupdate', 'safsdf', '1', 0, '1665695486', NULL, 1200, ''),
(35, 'carpeta', 'sdfds', '1', 0, '1665695518', NULL, 12, ''),
(36, 'RTestDay', 'asjdfhsdkgf', '1', 0, '1665695566', NULL, 1200, ''),
(37, 'TESTPAYMENT', '', '1', 0, '1665699047', NULL, 1200, ''),
(38, 'TEST NUEVO', '', '1', 0, '1665699389', NULL, 12000, ''),
(39, 'Servicio de prueba 1', '', '1', 0, '1666365572', NULL, 15000, ''),
(40, 'Hollywood Peel', 'descripcion', '1', 0, '1666366315', NULL, 1000, '');

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
(1, 'system_name', 'Anahí'),
(2, 'system_title', 'Anahí'),
(3, 'address', 'SN'),
(4, 'phone', 'SN'),
(5, 'paypal_email', ''),
(6, 'currency', 'usd'),
(7, 'system_email', 'anahí@anahí.com'),
(8, 'buyer', '[ your-codecanyon-username-here ]'),
(9, 'purchase_code', ''),
(10, 'language', 'espanol'),
(11, 'text_align', 'left-to-right'),
(12, 'system_currency_id', '16'),
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
(36, 'smtp_pass', 'Your real password'),
(37, 'twilio_id', 'ACdbba939db69ef782da3c5c0cc31c63ae'),
(38, 'twilio_token', '429f1c6d1f18a23e4abf940f73201cfc'),
(39, 'whatsapp_message', 'Hola $nombre_cliente, te saludo. \r\nTengo una cita con usted el día $fecha_cita, ¿Podría ser tan amable de confirmarme por este medio la cita?. \r\nDe antemano, muchas gracias y buen día.'),
(40, 'days', '1');

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
(2, 'Daniel Alejandro', 'carrilloriveradanielalejandro1@gmail.com', '7c4a8d09ca3762af61e59520943dc26494f8941b', 1, '3312275426', NULL, NULL, NULL, NULL, 'offline');

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
(11, 'Cita de: Daniel Carrillo', 8, '[11-10-2022] - Se creó la cita', '2,', '1665446400', '1665619200', 1, '0');

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
-- Indices de la tabla `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`);

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
-- Indices de la tabla `service_products`
--
ALTER TABLE `service_products`
  ADD PRIMARY KEY (`id`);

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
  MODIFY `client_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

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
-- AUTO_INCREMENT de la tabla `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=232;

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
  MODIFY `notice_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `payment`
--
ALTER TABLE `payment`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

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
  MODIFY `project_milestone_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

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
-- AUTO_INCREMENT de la tabla `service_products`
--
ALTER TABLE `service_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `servicios`
--
ALTER TABLE `servicios`
  MODIFY `servicios_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT de la tabla `settings`
--
ALTER TABLE `settings`
  MODIFY `settings_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

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
  MODIFY `team_task_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

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
