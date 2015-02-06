-- phpMyAdmin SQL Dump
-- version 4.1.14.8
-- http://www.phpmyadmin.net
--
-- Servidor: db554509897.db.1and1.com
-- Tiempo de generación: 06-02-2015 a las 00:06:45
-- Versión del servidor: 5.1.73-log
-- Versión de PHP: 5.4.36-0+deb7u3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `db554509897`
--
CREATE DATABASE IF NOT EXISTS `db554509897` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `db554509897`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `academic_administrative_units`
--

DROP TABLE IF EXISTS `academic_administrative_units`;
CREATE TABLE IF NOT EXISTS `academic_administrative_units` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  `type` enum('unidades_academicas','unidades_administrativas','otro') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=81 ;

--
-- Volcado de datos para la tabla `academic_administrative_units`
--

INSERT INTO `academic_administrative_units` (`id`, `name`, `type`) VALUES
(1, 'Centro Universitario de Vinculación y T.', 'unidades_administrativas'),
(2, 'Complejo Cultural Universitario', 'unidades_administrativas'),
(3, 'Contraloría General', 'unidades_administrativas'),
(4, 'CUPREDER', 'unidades_administrativas'),
(5, 'Defensoría de los Derechos Universitarios', 'unidades_administrativas'),
(6, 'Departamento  de Adquisiciones, Proveeduría e Inventarios', 'unidades_administrativas'),
(7, 'Departamento de Control Vehicular', 'unidades_administrativas'),
(8, 'Dirección de Acompañamiento Universitario ', 'unidades_administrativas'),
(9, 'Dirección de Administración Escolar', 'unidades_administrativas'),
(10, 'Dirección de Apoyo y Seguridad Universitaria', 'unidades_administrativas'),
(11, 'Dirección de Comunicación Institucional', 'unidades_administrativas'),
(12, 'Dirección de Contabilidad General', 'unidades_administrativas'),
(13, 'Dirección de Cultura Física', 'unidades_administrativas'),
(14, 'Dirección de Fomento Editorial ', 'unidades_administrativas'),
(15, 'Dirección de Protección Universitaria', 'unidades_administrativas'),
(16, 'Dirección de Recursos Humanos', 'unidades_administrativas'),
(17, 'Dirección de Servicio Social', 'unidades_administrativas'),
(18, 'Dirección de Servicios Generales', 'unidades_administrativas'),
(19, 'Dirección de Sistema de Información Universitaria', 'unidades_administrativas'),
(20, 'Dirección del Círculo Infantil', 'unidades_administrativas'),
(21, 'Dirección General de Bibliotecas', 'unidades_administrativas'),
(22, 'Dirección General de Educación Media Superior', 'unidades_administrativas'),
(23, 'Dirección General de Educación Superior', 'unidades_administrativas'),
(24, 'Dirección General de Innovación Educativa', 'unidades_administrativas'),
(25, 'Dirección General de Obras', 'unidades_administrativas'),
(26, 'Dirección General de Planeación Institucional', 'unidades_administrativas'),
(27, 'Farmacias Universitarias "Alexander Fleming"', 'unidades_administrativas'),
(28, 'Hospital Universitario de Puebla', 'unidades_administrativas'),
(29, 'Museo Universitario "Casa de los Muñecos"', 'unidades_administrativas'),
(30, 'Museo Universitario de Memoria Histórica', 'unidades_administrativas'),
(31, 'Oficina de  la Abogada General', 'unidades_administrativas'),
(32, 'Rectoría', 'unidades_administrativas'),
(33, 'Secretaría Administrativa', 'unidades_administrativas'),
(34, 'Secretaría General', 'unidades_administrativas'),
(35, 'Secretaría Particular de Rectoría', 'unidades_administrativas'),
(36, 'Secretaría Técnica', 'unidades_administrativas'),
(37, 'Sorteo BUAP', 'unidades_administrativas'),
(38, 'Tesorería General', 'unidades_administrativas'),
(39, 'Vicerrectoría de Docencia', 'unidades_administrativas'),
(40, 'Vicerrectoría de Extensión y Difusión de la Cultura', 'unidades_administrativas'),
(41, 'Vicerrectoría de Investigación y Estudios de Posgrado', 'unidades_administrativas'),
(42, 'Bachillerato 5 de Mayo', 'unidades_academicas'),
(43, 'Preparatoria 2 de Octubre de 1968', 'unidades_academicas'),
(44, 'Preparatoria Alfonso Calderón Moreno', 'unidades_academicas'),
(45, 'Preparatoria Emiliano Zapata', 'unidades_academicas'),
(46, 'Preparatoria Gral. Lázaro Cárdenas del Río', 'unidades_academicas'),
(47, 'Preparatoria Benito Juárez García', 'unidades_academicas'),
(48, 'Preparatoria Regional Enrique Cabrera Barroso', 'unidades_academicas'),
(49, 'Preparatoria Regional Simón Bolívar', 'unidades_academicas'),
(50, 'Preparatoria Urbana Enrique Cabrera Barroso', 'unidades_academicas'),
(51, 'Escuela de Artes', 'unidades_academicas'),
(52, 'Escuela de Artes Plásticas y Audiovisuales', 'unidades_academicas'),
(53, 'Escuela de Biología', 'unidades_academicas'),
(54, 'Facultad de Medicina Veterinaria y Zootecnia', 'unidades_academicas'),
(55, 'Facultad de Administración', 'unidades_academicas'),
(56, 'Facultad de Arquitectura', 'unidades_academicas'),
(57, 'Facultad de Ciencias de la Computación', 'unidades_academicas'),
(58, 'Facultad de Ciencias de la Comunicación', 'unidades_academicas'),
(59, 'Facultad de Ciencias de la Electrónica', 'unidades_academicas'),
(60, 'Facultad de Ciencias Físico Matemáticas', 'unidades_academicas'),
(61, 'Facultad de Ciencias Químicas', 'unidades_academicas'),
(62, 'Facultad de Contaduría', 'unidades_academicas'),
(63, 'Facultad de Cultura Física', 'unidades_academicas'),
(64, 'Facultad de Derecho y Ciencias Sociales', 'unidades_academicas'),
(65, 'Facultad de Economía', 'unidades_academicas'),
(66, 'Facultad de Enfermería', 'unidades_academicas'),
(67, 'Facultad de Estomatología', 'unidades_academicas'),
(68, 'Facultad de Filosofía y Letras', 'unidades_academicas'),
(69, 'Facultad de Ingeniería', 'unidades_academicas'),
(70, 'Facultad de Ingeniería Agrohidráulica', 'unidades_academicas'),
(71, 'Facultad de Ingeniería Química', 'unidades_academicas'),
(72, 'Facultad de Lenguas', 'unidades_academicas'),
(73, 'Facultad de Medicina', 'unidades_academicas'),
(74, 'Facultad de Psicología', 'unidades_academicas'),
(75, 'Instituto de Ciencias', 'unidades_academicas'),
(76, 'Instituto de Ciencias de Gobierno y Desarrollo Estratégico', 'unidades_academicas'),
(77, 'Instituto de Ciencias Sociales y Humanidades', 'unidades_academicas'),
(78, 'Instituto de Física', 'unidades_academicas'),
(79, 'Instituto de Fisiología', 'unidades_academicas'),
(80, 'Unidades Regionales', 'unidades_academicas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departments`
--

DROP TABLE IF EXISTS `departments`;
CREATE TABLE IF NOT EXISTS `departments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Volcado de datos para la tabla `departments`
--

INSERT INTO `departments` (`id`, `name`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Clientes', NULL, NULL, NULL, NULL),
(2, 'Diseño Gráfico', NULL, NULL, NULL, NULL),
(3, 'Diseño Digital', NULL, NULL, NULL, NULL),
(4, 'Radio BUAP', NULL, NULL, NULL, NULL),
(5, 'BUAP TV', NULL, NULL, NULL, NULL),
(6, 'Web BUAP', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `events`
--

DROP TABLE IF EXISTS `events`;
CREATE TABLE IF NOT EXISTS `events` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `id_dci` varchar(6) NOT NULL,
  `name` varchar(100) NOT NULL,
  `start_day` date NOT NULL,
  `end_day` date NOT NULL,
  `place` varchar(50) NOT NULL,
  `time` time NOT NULL,
  `has_cost` tinyint(1) NOT NULL,
  `directed_to` enum('Público en general','Comunidad BUAP','Profesores','Estudiantes') NOT NULL,
  `link` varchar(100) DEFAULT NULL,
  `description` text,
  `dci_status` enum('Pendiente','En Proceso','Atendido') NOT NULL DEFAULT 'Pendiente' COMMENT 'Pendiente: Nadie ha visto el evento\nEn Proceso: Por lo menos un jefe de algún servicio solicitado ha asignado tareas a sus empleados sobre este evento.\nAtendido: Todos los jefes de las respectivas áreas han marcado su respectivo servicio como atendido. (T',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_events_users1_idx` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `events`
--

INSERT INTO `events` (`id`, `id_dci`, `name`, `start_day`, `end_day`, `place`, `time`, `has_cost`, `directed_to`, `link`, `description`, `dci_status`, `created_at`, `updated_at`, `deleted_at`, `user_id`) VALUES
(1, '150126', 'Avye Walsh', '2015-01-27', '2015-01-31', 'Consequuntur quia facilis vero sapiente', '13:30:00', 0, 'Comunidad BUAP', '', 'Aspernatur rerum animi, sed ipsa, ad quia debitis eum magna beatae laborum labore hic dolor est beatae omnis.', 'Pendiente', '2015-01-26 20:25:57', '2015-01-26 20:25:57', NULL, 2),
(2, '150204', 'Chloe Shelton', '2015-02-19', '2015-02-28', 'Sit eaque cillum eos debitis magnam explicabo Illu', '06:50:00', 0, 'Estudiantes', 'http://www.sobynyzer.co.uk', 'Incidunt, vel excepteur cupidatat sit quia doloribus consequuntur aut enim quia pariatur. Tenetur dolorem.', 'Pendiente', '2015-02-04 19:45:00', '2015-02-04 19:45:00', NULL, 2),
(3, '150204', 'Chase Mccarthy', '2015-02-17', '2015-02-20', 'Saepe ut minus minima sint maxime omnis sed nisi o', '13:38:00', 0, 'Comunidad BUAP', 'http://www.wicilapyboju.org.uk', 'Vero ipsam excepturi culpa, voluptas voluptas culpa, porro deserunt magna nemo.', 'Pendiente', '2015-02-04 19:45:34', '2015-02-04 19:45:34', NULL, 2),
(4, '150205', 'Convención DCI', '2015-02-06', '2015-02-07', 'CCU', '09:00:00', 1, 'Comunidad BUAP', '', '', 'Pendiente', '2015-02-05 15:45:45', '2015-02-05 15:45:45', NULL, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `event_resource_source`
--

DROP TABLE IF EXISTS `event_resource_source`;
CREATE TABLE IF NOT EXISTS `event_resource_source` (
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `event_id` bigint(20) unsigned NOT NULL,
  `resource_source_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`event_id`,`resource_source_id`),
  KEY `fk_events_has_resource_source_resource_source1_idx` (`resource_source_id`),
  KEY `fk_events_has_resource_source_events1_idx` (`event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `event_resource_source`
--

INSERT INTO `event_resource_source` (`created_at`, `updated_at`, `deleted_at`, `event_id`, `resource_source_id`) VALUES
('2015-01-26 20:25:57', '2015-01-26 20:25:57', NULL, 1, 2),
('2015-02-04 19:45:34', '2015-02-04 19:45:34', NULL, 3, 1),
('2015-02-04 19:45:34', '2015-02-04 19:45:34', NULL, 3, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `event_service`
--

DROP TABLE IF EXISTS `event_service`;
CREATE TABLE IF NOT EXISTS `event_service` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `start_service` date NOT NULL,
  `end_service` date NOT NULL,
  `dci_status` enum('Pendiente','En Proceso','Atendido','Aprobado') NOT NULL DEFAULT 'Pendiente' COMMENT 'Pendiente: El jefe de cada área esta por asignar las tareas a sus empleados\nEn Proceso: Se ha asignado por lo menos una tarea a algún empleado sobre el servicio\nAtendido: Todos los empleados del área que atienden el servicio han completado sus tareas',
  `created_at` datetime DEFAULT NULL,
  `in_process_at` datetime DEFAULT NULL,
  `attended_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `event_id` bigint(20) unsigned NOT NULL,
  `service_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_events_has_services_services1_idx` (`service_id`),
  KEY `fk_events_has_services_events1_idx` (`event_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- Volcado de datos para la tabla `event_service`
--

INSERT INTO `event_service` (`id`, `start_service`, `end_service`, `dci_status`, `created_at`, `in_process_at`, `attended_at`, `updated_at`, `deleted_at`, `event_id`, `service_id`) VALUES
(1, '2015-01-27', '2015-01-31', 'Pendiente', '2015-01-26 20:25:57', NULL, NULL, '2015-01-26 20:25:57', NULL, 1, 5),
(2, '2015-01-27', '2015-01-31', 'Pendiente', '2015-01-26 20:25:57', NULL, NULL, '2015-01-26 20:25:57', NULL, 1, 7),
(3, '2015-01-27', '2015-01-31', 'Pendiente', '2015-01-26 20:25:57', NULL, NULL, '2015-01-26 20:25:57', NULL, 1, 9),
(4, '2015-01-27', '2015-01-31', 'Pendiente', '2015-01-26 20:25:57', NULL, NULL, '2015-01-26 20:25:57', NULL, 1, 11),
(5, '2015-01-27', '2015-01-31', 'Pendiente', '2015-01-26 20:25:57', NULL, NULL, '2015-01-26 20:25:57', NULL, 1, 15),
(6, '2015-02-19', '2015-02-28', 'Pendiente', '2015-02-04 19:45:00', NULL, NULL, '2015-02-04 19:45:00', NULL, 2, 2),
(7, '2015-02-19', '2015-02-28', 'Pendiente', '2015-02-04 19:45:00', NULL, NULL, '2015-02-04 19:45:00', NULL, 2, 3),
(8, '2015-02-19', '2015-02-28', 'Pendiente', '2015-02-04 19:45:00', NULL, NULL, '2015-02-04 19:45:00', NULL, 2, 8),
(9, '2015-02-19', '2015-02-28', 'Pendiente', '2015-02-04 19:45:00', NULL, NULL, '2015-02-04 19:45:00', NULL, 2, 13),
(10, '2015-02-19', '2015-02-28', 'Pendiente', '2015-02-04 19:45:00', NULL, NULL, '2015-02-04 19:45:00', NULL, 2, 14),
(11, '2015-02-17', '2015-02-20', 'Pendiente', '2015-02-04 19:45:34', NULL, NULL, '2015-02-04 19:45:34', NULL, 3, 1),
(12, '2015-02-17', '2015-02-20', 'Pendiente', '2015-02-04 19:45:34', NULL, NULL, '2015-02-04 19:45:34', NULL, 3, 2),
(13, '2015-02-17', '2015-02-20', 'Pendiente', '2015-02-04 19:45:34', NULL, NULL, '2015-02-04 19:45:34', NULL, 3, 3),
(14, '2015-02-17', '2015-02-20', 'Pendiente', '2015-02-04 19:45:34', NULL, NULL, '2015-02-04 19:45:34', NULL, 3, 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `event_witness`
--

DROP TABLE IF EXISTS `event_witness`;
CREATE TABLE IF NOT EXISTS `event_witness` (
  `file` varchar(100) NOT NULL DEFAULT 'NOT FILE',
  `dci_status` enum('No Aprobado','Pendiente','En Proceso','Aprobado') NOT NULL DEFAULT 'Pendiente',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `event_id` bigint(20) unsigned NOT NULL,
  `witness_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`event_id`,`witness_id`),
  KEY `fk_events_has_witnesses_witnesses1_idx` (`witness_id`),
  KEY `fk_events_has_witnesses_events1_idx` (`event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `event_witness`
--

INSERT INTO `event_witness` (`file`, `dci_status`, `created_at`, `updated_at`, `deleted_at`, `event_id`, `witness_id`) VALUES
('NOT FILE', 'Pendiente', '2015-01-26 20:25:57', '2015-01-26 20:25:57', NULL, 1, 1),
('NOT FILE', 'Pendiente', '2015-01-26 20:25:57', '2015-01-26 20:25:57', NULL, 1, 4),
('NOT FILE', 'Pendiente', '2015-02-04 19:45:00', '2015-02-04 19:45:00', NULL, 2, 1),
('NOT FILE', 'Pendiente', '2015-02-04 19:45:00', '2015-02-04 19:45:00', NULL, 2, 2),
('NOT FILE', 'Pendiente', '2015-02-04 19:45:00', '2015-02-04 19:45:00', NULL, 2, 3),
('NOT FILE', 'Pendiente', '2015-02-04 19:45:34', '2015-02-04 19:45:34', NULL, 3, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `requests`
--

DROP TABLE IF EXISTS `requests`;
CREATE TABLE IF NOT EXISTS `requests` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `request_number` int(11) NOT NULL,
  `post_number` int(11) NOT NULL,
  `date` date NOT NULL,
  `justification` text,
  `request` varchar(100) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `academic_administrative_unit_id` bigint(20) unsigned NOT NULL,
  `event_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_requests_academic_administrative_units1_idx` (`academic_administrative_unit_id`),
  KEY `fk_requests_events1_idx` (`event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `resources_sources`
--

DROP TABLE IF EXISTS `resources_sources`;
CREATE TABLE IF NOT EXISTS `resources_sources` (
  `id` bigint(20) unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `resources_sources`
--

INSERT INTO `resources_sources` (`id`, `name`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Tesorería', NULL, NULL, NULL, NULL),
(2, 'Fondo fijo', NULL, NULL, NULL, NULL),
(3, 'Apoyos especiales', NULL, NULL, NULL, NULL),
(4, 'Otros', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `services`
--

DROP TABLE IF EXISTS `services`;
CREATE TABLE IF NOT EXISTS `services` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` text,
  `observations` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `department_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_services_department1_idx` (`department_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

--
-- Volcado de datos para la tabla `services`
--

INSERT INTO `services` (`id`, `name`, `description`, `observations`, `created_at`, `updated_at`, `deleted_at`, `department_id`) VALUES
(1, 'Cartel', NULL, NULL, NULL, NULL, NULL, 2),
(2, 'Poster', NULL, NULL, NULL, NULL, NULL, 2),
(3, 'Lona', NULL, NULL, NULL, NULL, NULL, 2),
(4, 'Animaciones', NULL, NULL, NULL, NULL, NULL, 3),
(5, 'Recorrido Virtual', NULL, NULL, NULL, NULL, NULL, 3),
(6, 'Realidad Aumentada', NULL, NULL, NULL, NULL, NULL, 3),
(7, 'Radio Comercial ', NULL, NULL, NULL, NULL, NULL, 4),
(8, 'Radio Entrevista', NULL, NULL, NULL, NULL, NULL, 4),
(9, 'Radio Directo', NULL, NULL, NULL, NULL, NULL, 4),
(10, 'Comercial TV', NULL, NULL, NULL, NULL, NULL, 5),
(11, 'Entrevista TV', NULL, NULL, NULL, NULL, NULL, 5),
(12, 'Directo TV', NULL, NULL, NULL, NULL, NULL, 5),
(13, 'Banner Web', NULL, NULL, NULL, NULL, NULL, 6),
(14, 'Redes Sociales (FB, TW)', NULL, NULL, NULL, NULL, NULL, 6),
(15, 'Página Web', NULL, NULL, NULL, NULL, NULL, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `support_materials`
--

DROP TABLE IF EXISTS `support_materials`;
CREATE TABLE IF NOT EXISTS `support_materials` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `original_name` varchar(100) NOT NULL,
  `file` varchar(100) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `event_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_support_materials_events1_idx` (`event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tasks`
--

DROP TABLE IF EXISTS `tasks`;
CREATE TABLE IF NOT EXISTS `tasks` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `status` enum('Pendiente','Completa') NOT NULL DEFAULT 'Pendiente' COMMENT 'Pendiente: La tarea fue creada\nCompleta: El empleado marca la tarea que se le asignó como completa',
  `description` text NOT NULL,
  `comment` text,
  `created_at` datetime DEFAULT NULL,
  `completed_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `event_service_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_tasks_users1_idx` (`user_id`),
  KEY `fk_tasks_event_service1_idx` (`event_service_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Volcado de datos para la tabla `tasks`
--

INSERT INTO `tasks` (`id`, `status`, `description`, `comment`, `created_at`, `completed_at`, `updated_at`, `deleted_at`, `user_id`, `event_service_id`) VALUES
(1, 'Pendiente', 'a ver si ya funciona weon', NULL, '2015-01-27 07:26:12', NULL, '2015-01-31 06:20:44', '2015-01-31 06:20:44', 3, 5),
(2, 'Pendiente', 'Algo importante debes hacer', NULL, '2015-01-30 15:44:14', NULL, '2015-01-31 06:22:28', '2015-01-31 06:22:28', 3, 5),
(3, 'Pendiente', 'kmkmk', NULL, '2015-01-31 08:31:34', NULL, '2015-02-03 20:29:40', NULL, 3, 5),
(4, 'Completa', 'algo wenkj sknkns knskjnks snskn s sd s dsa da sda d ads asd asd as das das d asd asd as das d asd as das das d asd asd as das d asd as das das d asd as das dmas d,a s,md as, d,as,md', 'todo litso, gracias!', '2015-02-03 22:03:51', '2015-02-04 19:41:59', '2015-02-04 19:41:59', NULL, 4, 5),
(5, 'Pendiente', 'Realizar cambios en... ... ...', NULL, '2015-02-04 20:08:14', NULL, '2015-02-04 20:08:14', NULL, 4, 5),
(6, 'Pendiente', 'gdgfg', NULL, '2015-02-05 23:56:21', NULL, '2015-02-05 23:56:21', NULL, 3, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `timestamps`
--

DROP TABLE IF EXISTS `timestamps`;
CREATE TABLE IF NOT EXISTS `timestamps` (
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` varchar(10) DEFAULT NULL,
  `extension_phone` varchar(5) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '2' COMMENT '0 Inactive\n1 Active\n2 Activation required',
  `remember_token` varchar(100) DEFAULT NULL,
  `password` varchar(60) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `user_type_id` bigint(20) unsigned NOT NULL DEFAULT '1',
  `department_id` bigint(20) unsigned DEFAULT NULL,
  `academic_administrative_unit_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_users_user_type1_idx` (`user_type_id`),
  KEY `fk_users_academic_administrative_unit1_idx` (`academic_administrative_unit_id`),
  KEY `fk_users_department1_idx` (`department_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `extension_phone`, `status`, `remember_token`, `password`, `created_at`, `updated_at`, `deleted_at`, `user_type_id`, `department_id`, `academic_administrative_unit_id`) VALUES
(1, 'Javier ', 'Aguila', 'sjaca10@gmail.com', '2227262898', NULL, 1, NULL, '$2a$10$xN2OGlwLyFYQ2BexR/Pw0.vcUizx/2q.vNiP.wR5RUzCr7lL8RLoC', NULL, NULL, NULL, 1, 1, 1),
(2, 'Israel', 'Cruz', 'jesuslink00@gmail.com', NULL, NULL, 1, NULL, '$2a$10$k77CxnX2cAwzpdud3igI2uy5cUb10I3V2Nkg5rgyFLZEwSVR/KaTK', NULL, NULL, NULL, 1, 1, 2),
(3, 'Arturo', 'Aguila', 'aaguila@buap.mx', '2227262898', NULL, 1, NULL, '$2a$10$g/aN1RttJl7bC4cY399e3O6lPlGvn4L/3UBtN55BJxOCv25dslT16', NULL, NULL, NULL, 2, 6, 3),
(4, 'Jesús', 'Cruz', 'jcruz@buap.mx', NULL, NULL, 1, NULL, '$2a$10$vmyH1pOc4fw.69nKavT9MOe/FG83BPjwrGKv4jdhLKrmpchA0eTSO', NULL, NULL, NULL, 2, 6, 4),
(5, 'Amparo', 'Merino Reyes', 'amparomx@gmail.com', '2224807645', '5266', 1, NULL, '$2y$10$TaOZ3yl33Vluq.3X5tW1oODQpeD1W8YY0EM8p7qfSv3O/Gq4JmvGO', NULL, NULL, NULL, 1, 1, 5),
(6, 'Javier Arturo', 'Aguila', 'jaaguila@buap.mx', '2227262898', NULL, 1, NULL, '$2a$10$XYY3d4mUJr32erwB6ZUIreRec/p6Ixexue/A.M12a0pQxT8.N.b.O', NULL, NULL, NULL, 3, 6, 6),
(7, 'Jesús Israel', 'Cruz', 'jicruz@buap.mx', NULL, NULL, 1, NULL, '$2a$10$zYbvG0zcR/CFtqY6h0pfqO2P/iPHvP7c7aqkM9Ay/IbX.PcGCfpt6', NULL, NULL, NULL, 3, 6, 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users_auth_operations`
--

DROP TABLE IF EXISTS `users_auth_operations`;
CREATE TABLE IF NOT EXISTS `users_auth_operations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `token` varchar(40) NOT NULL,
  `expiration` datetime NOT NULL,
  `type` tinyint(1) NOT NULL COMMENT '1 Activate user\n2 Change password',
  `used` tinyint(1) NOT NULL COMMENT '0 Not used\n1 Used',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_users_auth_operations_users1_idx` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users_types`
--

DROP TABLE IF EXISTS `users_types`;
CREATE TABLE IF NOT EXISTS `users_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `users_types`
--

INSERT INTO `users_types` (`id`, `name`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Cliente', '', NULL, NULL, NULL),
(2, 'Empleado DCI', '', NULL, NULL, NULL),
(3, 'Jefe DCI', '', NULL, NULL, NULL),
(4, 'Administrador', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `witnesses`
--

DROP TABLE IF EXISTS `witnesses`;
CREATE TABLE IF NOT EXISTS `witnesses` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `witnesses`
--

INSERT INTO `witnesses` (`id`, `name`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Ejemplar de impresión', NULL, NULL, NULL, NULL),
(2, 'Carátula de libros, revistas o folletos', NULL, NULL, NULL, NULL),
(3, 'Fotografías de rótulos colocados', NULL, NULL, NULL, NULL),
(4, 'Fotografías', NULL, NULL, NULL, NULL);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `events`
--
ALTER TABLE `events`
  ADD CONSTRAINT `fk_events_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `event_resource_source`
--
ALTER TABLE `event_resource_source`
  ADD CONSTRAINT `fk_events_has_resource_source_events1` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_events_has_resource_source_resource_source1` FOREIGN KEY (`resource_source_id`) REFERENCES `resources_sources` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `event_service`
--
ALTER TABLE `event_service`
  ADD CONSTRAINT `fk_events_has_services_events1` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_events_has_services_services1` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `event_witness`
--
ALTER TABLE `event_witness`
  ADD CONSTRAINT `fk_events_has_witnesses_events1` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_events_has_witnesses_witnesses1` FOREIGN KEY (`witness_id`) REFERENCES `witnesses` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `requests`
--
ALTER TABLE `requests`
  ADD CONSTRAINT `fk_requests_academic_administrative_units1` FOREIGN KEY (`academic_administrative_unit_id`) REFERENCES `academic_administrative_units` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_requests_events1` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `services`
--
ALTER TABLE `services`
  ADD CONSTRAINT `fk_services_department1` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `support_materials`
--
ALTER TABLE `support_materials`
  ADD CONSTRAINT `fk_support_materials_events1` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tasks`
--
ALTER TABLE `tasks`
  ADD CONSTRAINT `fk_tasks_event_service1` FOREIGN KEY (`event_service_id`) REFERENCES `event_service` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tasks_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_users_academic_administrative_unit1` FOREIGN KEY (`academic_administrative_unit_id`) REFERENCES `academic_administrative_units` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_users_department1` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_users_user_type1` FOREIGN KEY (`user_type_id`) REFERENCES `users_types` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `users_auth_operations`
--
ALTER TABLE `users_auth_operations`
  ADD CONSTRAINT `fk_users_auth_operations_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
