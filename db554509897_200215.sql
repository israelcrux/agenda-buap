-- phpMyAdmin SQL Dump
-- version 4.1.14.8
-- http://www.phpmyadmin.net
--
-- Servidor: db554509897.db.1and1.com
-- Tiempo de generación: 20-02-2015 a las 03:49:44
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
DROP DATABASE `db554509897`;
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
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=81 ;

--
-- Volcado de datos para la tabla `academic_administrative_units`
--

INSERT INTO `academic_administrative_units` (`id`, `name`, `type`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Centro Universitario de Vinculación y T.', 'unidades_administrativas', '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL),
(2, 'Complejo Cultural Universitario', 'unidades_administrativas', '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL),
(3, 'Contraloría General', 'unidades_administrativas', '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL),
(4, 'CUPREDER', 'unidades_administrativas', '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL),
(5, 'Defensoría de los Derechos Universitarios', 'unidades_administrativas', '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL),
(6, 'Departamento  de Adquisiciones, Proveeduría e Inventarios', 'unidades_administrativas', '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL),
(7, 'Departamento de Control Vehicular', 'unidades_administrativas', '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL),
(8, 'Dirección de Acompañamiento Universitario ', 'unidades_administrativas', '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL),
(9, 'Dirección de Administración Escolar', 'unidades_administrativas', '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL),
(10, 'Dirección de Apoyo y Seguridad Universitaria', 'unidades_administrativas', '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL),
(11, 'Dirección de Comunicación Institucional', 'unidades_administrativas', '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL),
(12, 'Dirección de Contabilidad General', 'unidades_administrativas', '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL),
(13, 'Dirección de Cultura Física', 'unidades_administrativas', '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL),
(14, 'Dirección de Fomento Editorial ', 'unidades_administrativas', '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL),
(15, 'Dirección de Protección Universitaria', 'unidades_administrativas', '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL),
(16, 'Dirección de Recursos Humanos', 'unidades_administrativas', '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL),
(17, 'Dirección de Servicio Social', 'unidades_administrativas', '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL),
(18, 'Dirección de Servicios Generales', 'unidades_administrativas', '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL),
(19, 'Dirección de Sistema de Información Universitaria', 'unidades_administrativas', '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL),
(20, 'Dirección del Círculo Infantil', 'unidades_administrativas', '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL),
(21, 'Dirección General de Bibliotecas', 'unidades_administrativas', '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL),
(22, 'Dirección General de Educación Media Superior', 'unidades_administrativas', '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL),
(23, 'Dirección General de Educación Superior', 'unidades_administrativas', '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL),
(24, 'Dirección General de Innovación Educativa', 'unidades_administrativas', '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL),
(25, 'Dirección General de Obras', 'unidades_administrativas', '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL),
(26, 'Dirección General de Planeación Institucional', 'unidades_administrativas', '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL),
(27, 'Farmacias Universitarias "Alexander Fleming"', 'unidades_administrativas', '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL),
(28, 'Hospital Universitario de Puebla', 'unidades_administrativas', '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL),
(29, 'Museo Universitario "Casa de los Muñecos"', 'unidades_administrativas', '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL),
(30, 'Museo Universitario de Memoria Histórica', 'unidades_administrativas', '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL),
(31, 'Oficina de  la Abogada General', 'unidades_administrativas', '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL),
(32, 'Rectoría', 'unidades_administrativas', '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL),
(33, 'Secretaría Administrativa', 'unidades_administrativas', '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL),
(34, 'Secretaría General', 'unidades_administrativas', '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL),
(35, 'Secretaría Particular de Rectoría', 'unidades_administrativas', '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL),
(36, 'Secretaría Técnica', 'unidades_administrativas', '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL),
(37, 'Sorteo BUAP', 'unidades_administrativas', '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL),
(38, 'Tesorería General', 'unidades_administrativas', '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL),
(39, 'Vicerrectoría de Docencia', 'unidades_administrativas', '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL),
(40, 'Vicerrectoría de Extensión y Difusión de la Cultura', 'unidades_administrativas', '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL),
(41, 'Vicerrectoría de Investigación y Estudios de Posgrado', 'unidades_administrativas', '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL),
(42, 'Bachillerato 5 de Mayo', 'unidades_academicas', '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL),
(43, 'Preparatoria 2 de Octubre de 1968', 'unidades_academicas', '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL),
(44, 'Preparatoria Alfonso Calderón Moreno', 'unidades_academicas', '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL),
(45, 'Preparatoria Emiliano Zapata', 'unidades_academicas', '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL),
(46, 'Preparatoria Gral. Lázaro Cárdenas del Río', 'unidades_academicas', '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL),
(47, 'Preparatoria Benito Juárez García', 'unidades_academicas', '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL),
(48, 'Preparatoria Regional Enrique Cabrera Barroso', 'unidades_academicas', '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL),
(49, 'Preparatoria Regional Simón Bolívar', 'unidades_academicas', '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL),
(50, 'Preparatoria Urbana Enrique Cabrera Barroso', 'unidades_academicas', '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL),
(51, 'Escuela de Artes', 'unidades_academicas', '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL),
(52, 'Escuela de Artes Plásticas y Audiovisuales', 'unidades_academicas', '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL),
(53, 'Escuela de Biología', 'unidades_academicas', '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL),
(54, 'Facultad de Medicina Veterinaria y Zootecnia', 'unidades_academicas', '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL),
(55, 'Facultad de Administración', 'unidades_academicas', '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL),
(56, 'Facultad de Arquitectura', 'unidades_academicas', '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL),
(57, 'Facultad de Ciencias de la Computación', 'unidades_academicas', '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL),
(58, 'Facultad de Ciencias de la Comunicación', 'unidades_academicas', '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL),
(59, 'Facultad de Ciencias de la Electrónica', 'unidades_academicas', '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL),
(60, 'Facultad de Ciencias Físico Matemáticas', 'unidades_academicas', '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL),
(61, 'Facultad de Ciencias Químicas', 'unidades_academicas', '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL),
(62, 'Facultad de Contaduría', 'unidades_academicas', '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL),
(63, 'Facultad de Cultura Física', 'unidades_academicas', '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL),
(64, 'Facultad de Derecho y Ciencias Sociales', 'unidades_academicas', '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL),
(65, 'Facultad de Economía', 'unidades_academicas', '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL),
(66, 'Facultad de Enfermería', 'unidades_academicas', '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL),
(67, 'Facultad de Estomatología', 'unidades_academicas', '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL),
(68, 'Facultad de Filosofía y Letras', 'unidades_academicas', '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL),
(69, 'Facultad de Ingeniería', 'unidades_academicas', '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL),
(70, 'Facultad de Ingeniería Agrohidráulica', 'unidades_academicas', '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL),
(71, 'Facultad de Ingeniería Química', 'unidades_academicas', '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL),
(72, 'Facultad de Lenguas', 'unidades_academicas', '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL),
(73, 'Facultad de Medicina', 'unidades_academicas', '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL),
(74, 'Facultad de Psicología', 'unidades_academicas', '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL),
(75, 'Instituto de Ciencias', 'unidades_academicas', '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL),
(76, 'Instituto de Ciencias de Gobierno y Desarrollo Estratégico', 'unidades_academicas', '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL),
(77, 'Instituto de Ciencias Sociales y Humanidades', 'unidades_academicas', '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL),
(78, 'Instituto de Física', 'unidades_academicas', '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL),
(79, 'Instituto de Fisiología', 'unidades_academicas', '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL),
(80, 'Unidades Regionales', 'unidades_academicas', '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departments`
--

DROP TABLE IF EXISTS `departments`;
CREATE TABLE IF NOT EXISTS `departments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` text,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Volcado de datos para la tabla `departments`
--

INSERT INTO `departments` (`id`, `name`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Clientes', NULL, '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL),
(2, 'Dirección', NULL, '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL),
(3, 'Subdirección', NULL, '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL),
(4, 'Información y prensa', NULL, '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL),
(5, 'Medios Digitales', NULL, '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL),
(6, 'Monitoreo', NULL, '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL),
(7, 'Publicidad, diseño y arte', NULL, '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL),
(8, 'Publicaciones', NULL, '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL),
(9, 'CIDD', NULL, '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL),
(10, 'Radio BUAP', NULL, '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL),
(11, 'Administrativo', NULL, '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `event_resource_source`
--

DROP TABLE IF EXISTS `event_resource_source`;
CREATE TABLE IF NOT EXISTS `event_resource_source` (
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
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
('2015-01-26 20:28:52', '2015-01-26 20:30:22', NULL, 14, 4),
('2015-01-09 18:25:57', '2015-01-09 20:47:22', NULL, 18, 4),
('2015-02-12 20:08:22', '2015-02-12 20:08:22', NULL, 27, 4),
('2015-02-12 21:25:31', '2015-02-12 21:26:48', NULL, 28, 4),
('2015-02-18 17:47:50', '2015-02-18 17:47:50', NULL, 29, 4),
('2015-02-18 19:20:10', '2015-02-18 19:20:10', NULL, 30, 2),
('2015-02-18 19:20:12', '2015-02-18 19:20:12', NULL, 35, 2);

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
  `created_at` datetime NOT NULL,
  `in_process_at` datetime DEFAULT NULL,
  `attended_at` datetime DEFAULT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `event_id` bigint(20) unsigned NOT NULL,
  `service_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_events_has_services_services1_idx` (`service_id`),
  KEY `fk_events_has_services_events1_idx` (`event_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=86 ;

--
-- Volcado de datos para la tabla `event_service`
--

INSERT INTO `event_service` (`id`, `start_service`, `end_service`, `dci_status`, `created_at`, `in_process_at`, `attended_at`, `updated_at`, `deleted_at`, `event_id`, `service_id`) VALUES
(1, '2014-12-08', '2014-12-08', 'En Proceso', '2014-11-27 18:05:54', '2015-02-18 19:23:14', NULL, '2014-11-27 18:05:54', NULL, 2, 1),
(2, '2014-12-08', '2014-12-08', 'En Proceso', '2014-11-27 18:05:54', '2015-02-19 15:59:46', NULL, '2014-11-27 18:05:54', NULL, 2, 3),
(3, '2014-12-08', '2014-12-08', 'Pendiente', '2014-11-27 18:05:54', NULL, NULL, '2014-11-27 18:05:54', NULL, 2, 4),
(4, '2014-12-08', '2014-12-08', 'En Proceso', '2014-11-27 18:05:54', '2015-02-19 16:04:11', NULL, '2014-11-27 18:05:54', NULL, 2, 5),
(5, '2014-12-02', '2015-02-28', 'Pendiente', '2014-12-02 20:27:40', NULL, NULL, '2014-12-02 20:27:40', NULL, 8, 1),
(6, '2014-12-02', '2015-02-28', 'Pendiente', '2014-12-02 20:27:40', NULL, NULL, '2014-12-02 20:27:40', NULL, 8, 3),
(7, '2014-12-02', '2015-02-28', 'Pendiente', '2014-12-02 20:27:40', NULL, NULL, '2014-12-02 20:27:40', NULL, 8, 4),
(8, '2014-12-02', '2015-02-28', 'Pendiente', '2014-12-02 20:27:40', NULL, NULL, '2014-12-02 20:27:40', NULL, 8, 5),
(9, '2014-12-02', '2015-02-28', 'Pendiente', '2014-12-02 20:33:47', NULL, NULL, '2014-12-02 20:49:07', NULL, 9, 1),
(10, '2014-12-02', '2015-02-28', 'Pendiente', '2014-12-02 20:33:47', NULL, NULL, '2014-12-02 20:49:07', NULL, 9, 3),
(11, '2014-12-02', '2015-02-28', 'Pendiente', '2014-12-02 20:33:47', NULL, NULL, '2014-12-02 20:49:07', NULL, 9, 4),
(12, '2014-12-02', '2015-02-28', 'Pendiente', '2014-12-02 20:33:47', NULL, NULL, '2014-12-02 20:49:07', NULL, 9, 5),
(13, '2014-12-07', '2014-12-07', 'Pendiente', '2014-12-02 20:42:13', NULL, NULL, '2014-12-02 20:53:55', NULL, 10, 1),
(14, '2014-12-07', '2014-12-07', 'Pendiente', '2014-12-02 20:43:17', NULL, NULL, '2014-12-02 20:43:17', NULL, 11, 1),
(15, '2014-12-03', '2014-12-03', 'Pendiente', '2014-12-02 21:11:32', NULL, NULL, '2014-12-02 21:11:42', NULL, 13, 1),
(16, '2015-01-05', '2015-01-16', 'En Proceso', '2014-12-04 21:34:49', '2015-02-18 19:24:46', NULL, '2014-12-04 21:34:49', NULL, 19, 1),
(17, '2015-01-05', '2015-01-16', 'Pendiente', '2014-12-04 21:34:49', NULL, NULL, '2014-12-04 21:34:49', NULL, 19, 3),
(18, '2015-01-05', '2015-01-16', 'Pendiente', '2014-12-04 21:34:49', NULL, NULL, '2014-12-04 21:34:49', NULL, 19, 4),
(19, '2015-01-05', '2015-01-16', 'Pendiente', '2014-12-04 21:34:49', NULL, NULL, '2014-12-04 21:34:49', NULL, 19, 5),
(20, '2015-01-19', '2015-02-13', 'Pendiente', '2015-01-09 18:25:57', NULL, NULL, '2015-01-09 20:47:22', NULL, 18, 3),
(21, '2015-01-19', '2015-02-13', 'Pendiente', '2015-01-09 18:25:57', NULL, NULL, '2015-01-09 20:47:22', NULL, 18, 4),
(22, '2015-01-19', '2015-02-13', 'Pendiente', '2015-01-09 18:25:57', NULL, NULL, '2015-01-09 20:47:22', NULL, 18, 8),
(23, '2015-01-19', '2015-02-13', 'Pendiente', '2015-01-09 18:25:57', NULL, NULL, '2015-01-09 20:47:22', NULL, 18, 10),
(24, '2015-02-16', '2015-02-18', 'Pendiente', '2015-01-15 16:19:54', NULL, NULL, '2015-01-15 16:19:54', NULL, 17, 1),
(25, '2015-02-16', '2015-02-18', 'Pendiente', '2015-01-15 16:19:54', NULL, NULL, '2015-01-15 16:19:54', NULL, 17, 3),
(26, '2015-03-06', '2015-07-11', 'Pendiente', '2015-01-22 21:03:27', NULL, NULL, '2015-01-22 21:03:27', NULL, 16, 3),
(27, '2015-03-06', '2015-07-11', 'Pendiente', '2015-01-22 21:03:27', NULL, NULL, '2015-01-22 21:03:27', NULL, 16, 4),
(28, '2015-03-06', '2015-07-11', 'Pendiente', '2015-01-22 21:03:27', NULL, NULL, '2015-01-22 21:03:27', NULL, 16, 8),
(29, '2015-03-06', '2015-07-11', 'Pendiente', '2015-01-22 21:03:27', NULL, NULL, '2015-01-22 21:03:27', NULL, 16, 10),
(30, '2015-03-06', '2015-07-11', 'Pendiente', '2015-01-22 21:17:28', NULL, NULL, '2015-01-22 21:17:28', NULL, 15, 3),
(31, '2015-03-06', '2015-07-11', 'Pendiente', '2015-01-22 21:17:28', NULL, NULL, '2015-01-22 21:17:28', NULL, 15, 4),
(32, '2015-03-06', '2015-07-11', 'Pendiente', '2015-01-22 21:17:28', NULL, NULL, '2015-01-22 21:17:28', NULL, 15, 6),
(33, '2015-03-06', '2015-07-11', 'Pendiente', '2015-01-22 21:17:28', NULL, NULL, '2015-01-22 21:17:28', NULL, 15, 8),
(34, '2015-03-06', '2015-07-11', 'Pendiente', '2015-01-22 21:17:28', NULL, NULL, '2015-01-22 21:17:28', NULL, 15, 10),
(35, '2015-02-14', '2015-04-17', 'Pendiente', '2015-01-26 20:28:52', NULL, NULL, '2015-01-26 20:30:22', NULL, 14, 3),
(36, '2015-02-14', '2015-04-17', 'Pendiente', '2015-01-26 20:28:52', NULL, NULL, '2015-01-26 20:30:22', NULL, 14, 4),
(37, '2015-02-14', '2015-04-17', 'Pendiente', '2015-01-26 20:28:52', NULL, NULL, '2015-01-26 20:30:22', NULL, 14, 8),
(38, '2015-02-14', '2015-04-17', 'Pendiente', '2015-01-26 20:28:52', NULL, NULL, '2015-01-26 20:30:22', NULL, 14, 10),
(39, '2015-02-20', '2015-02-21', 'Pendiente', '2015-02-12 20:08:22', NULL, NULL, '2015-02-12 20:08:22', NULL, 27, 3),
(40, '2015-02-20', '2015-02-21', 'Pendiente', '2015-02-12 20:08:22', NULL, NULL, '2015-02-12 20:08:22', NULL, 27, 4),
(41, '2015-02-20', '2015-02-21', 'Pendiente', '2015-02-12 20:08:22', NULL, NULL, '2015-02-12 20:08:22', NULL, 27, 7),
(42, '2015-02-20', '2015-02-21', 'Pendiente', '2015-02-12 20:08:22', NULL, NULL, '2015-02-12 20:08:22', NULL, 27, 8),
(43, '2015-02-20', '2015-02-21', 'Pendiente', '2015-02-12 20:08:22', NULL, NULL, '2015-02-12 20:08:22', NULL, 27, 10),
(44, '2015-02-16', '2015-06-26', 'Pendiente', '2015-02-12 21:25:31', NULL, NULL, '2015-02-12 21:26:48', NULL, 28, 3),
(45, '2015-02-16', '2015-06-26', 'Pendiente', '2015-02-12 21:25:31', NULL, NULL, '2015-02-12 21:26:48', NULL, 28, 8),
(46, '2015-02-16', '2015-06-26', 'Pendiente', '2015-02-12 21:25:31', NULL, NULL, '2015-02-12 21:26:48', NULL, 28, 10),
(47, '2015-03-06', '2015-03-20', 'Pendiente', '2015-02-18 17:47:50', NULL, NULL, '2015-02-18 17:47:50', NULL, 29, 3),
(48, '2015-03-06', '2015-03-20', 'Pendiente', '2015-02-18 17:47:50', NULL, NULL, '2015-02-18 17:47:50', NULL, 29, 8),
(49, '2015-03-06', '2015-03-20', 'Pendiente', '2015-02-18 17:47:50', NULL, NULL, '2015-02-18 17:47:50', NULL, 29, 10),
(50, '2015-03-07', '2015-03-07', 'Pendiente', '2015-02-18 19:20:09', NULL, NULL, '2015-02-18 19:20:09', NULL, 30, 1),
(51, '2015-03-07', '2015-03-07', 'Pendiente', '2015-02-18 19:20:09', NULL, NULL, '2015-02-18 19:20:09', NULL, 30, 6),
(52, '2015-03-07', '2015-03-07', 'Pendiente', '2015-02-18 19:20:09', NULL, NULL, '2015-02-18 19:20:09', NULL, 30, 7),
(53, '2015-03-07', '2015-03-07', 'Pendiente', '2015-02-18 19:20:09', NULL, NULL, '2015-02-18 19:20:09', NULL, 30, 8),
(54, '2015-03-07', '2015-03-07', 'Pendiente', '2015-02-18 19:20:09', NULL, NULL, '2015-02-18 19:20:09', NULL, 30, 9),
(55, '2015-03-07', '2015-03-07', 'Pendiente', '2015-02-18 19:20:09', NULL, NULL, '2015-02-18 19:20:09', NULL, 30, 10),
(56, '2015-03-07', '2015-03-07', 'Pendiente', '2015-02-18 19:20:10', NULL, NULL, '2015-02-18 19:20:10', NULL, 31, 1),
(57, '2015-03-07', '2015-03-07', 'Pendiente', '2015-02-18 19:20:10', NULL, NULL, '2015-02-18 19:20:10', NULL, 31, 6),
(58, '2015-03-07', '2015-03-07', 'Pendiente', '2015-02-18 19:20:10', NULL, NULL, '2015-02-18 19:20:10', NULL, 31, 7),
(59, '2015-03-07', '2015-03-07', 'Pendiente', '2015-02-18 19:20:10', NULL, NULL, '2015-02-18 19:20:10', NULL, 31, 8),
(60, '2015-03-07', '2015-03-07', 'Pendiente', '2015-02-18 19:20:10', NULL, NULL, '2015-02-18 19:20:10', NULL, 31, 9),
(61, '2015-03-07', '2015-03-07', 'Pendiente', '2015-02-18 19:20:10', NULL, NULL, '2015-02-18 19:20:10', NULL, 31, 10),
(62, '2015-03-07', '2015-03-07', 'Pendiente', '2015-02-18 19:20:11', NULL, NULL, '2015-02-18 19:20:11', NULL, 32, 1),
(63, '2015-03-07', '2015-03-07', 'Pendiente', '2015-02-18 19:20:11', NULL, NULL, '2015-02-18 19:20:11', NULL, 32, 6),
(64, '2015-03-07', '2015-03-07', 'Pendiente', '2015-02-18 19:20:11', NULL, NULL, '2015-02-18 19:20:11', NULL, 32, 7),
(65, '2015-03-07', '2015-03-07', 'Pendiente', '2015-02-18 19:20:11', NULL, NULL, '2015-02-18 19:20:11', NULL, 32, 8),
(66, '2015-03-07', '2015-03-07', 'Pendiente', '2015-02-18 19:20:11', NULL, NULL, '2015-02-18 19:20:11', NULL, 32, 9),
(67, '2015-03-07', '2015-03-07', 'Pendiente', '2015-02-18 19:20:11', NULL, NULL, '2015-02-18 19:20:11', NULL, 32, 10),
(68, '2015-03-07', '2015-03-07', 'Pendiente', '2015-02-18 19:20:11', NULL, NULL, '2015-02-18 19:20:11', NULL, 33, 1),
(69, '2015-03-07', '2015-03-07', 'Pendiente', '2015-02-18 19:20:11', NULL, NULL, '2015-02-18 19:20:11', NULL, 33, 6),
(70, '2015-03-07', '2015-03-07', 'Pendiente', '2015-02-18 19:20:11', NULL, NULL, '2015-02-18 19:20:11', NULL, 33, 7),
(71, '2015-03-07', '2015-03-07', 'Pendiente', '2015-02-18 19:20:11', NULL, NULL, '2015-02-18 19:20:11', NULL, 33, 8),
(72, '2015-03-07', '2015-03-07', 'Pendiente', '2015-02-18 19:20:11', NULL, NULL, '2015-02-18 19:20:11', NULL, 33, 9),
(73, '2015-03-07', '2015-03-07', 'Pendiente', '2015-02-18 19:20:11', NULL, NULL, '2015-02-18 19:20:11', NULL, 33, 10),
(74, '2015-03-07', '2015-03-07', 'Pendiente', '2015-02-18 19:20:11', NULL, NULL, '2015-02-18 19:20:11', NULL, 34, 1),
(75, '2015-03-07', '2015-03-07', 'Pendiente', '2015-02-18 19:20:11', NULL, NULL, '2015-02-18 19:20:11', NULL, 34, 6),
(76, '2015-03-07', '2015-03-07', 'Pendiente', '2015-02-18 19:20:11', NULL, NULL, '2015-02-18 19:20:11', NULL, 34, 7),
(77, '2015-03-07', '2015-03-07', 'Pendiente', '2015-02-18 19:20:11', NULL, NULL, '2015-02-18 19:20:11', NULL, 34, 8),
(78, '2015-03-07', '2015-03-07', 'Pendiente', '2015-02-18 19:20:11', NULL, NULL, '2015-02-18 19:20:11', NULL, 34, 9),
(79, '2015-03-07', '2015-03-07', 'Pendiente', '2015-02-18 19:20:11', NULL, NULL, '2015-02-18 19:20:11', NULL, 34, 10),
(80, '2015-03-07', '2015-03-07', 'Pendiente', '2015-02-18 19:20:12', NULL, NULL, '2015-02-18 19:20:12', NULL, 35, 1),
(81, '2015-03-07', '2015-03-07', 'Pendiente', '2015-02-18 19:20:12', NULL, NULL, '2015-02-18 19:20:12', NULL, 35, 6),
(82, '2015-03-07', '2015-03-07', 'Pendiente', '2015-02-18 19:20:12', NULL, NULL, '2015-02-18 19:20:12', NULL, 35, 7),
(83, '2015-03-07', '2015-03-07', 'Pendiente', '2015-02-18 19:20:12', NULL, NULL, '2015-02-18 19:20:12', NULL, 35, 8),
(84, '2015-03-07', '2015-03-07', 'Pendiente', '2015-02-18 19:20:12', NULL, NULL, '2015-02-18 19:20:12', NULL, 35, 9),
(85, '2015-03-07', '2015-03-07', 'Pendiente', '2015-02-18 19:20:12', NULL, NULL, '2015-02-18 19:20:12', NULL, 35, 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `event_witness`
--

DROP TABLE IF EXISTS `event_witness`;
CREATE TABLE IF NOT EXISTS `event_witness` (
  `file` varchar(100) NOT NULL DEFAULT 'NOT FILE',
  `dci_status` enum('No Aprobado','Pendiente','En Proceso','Aprobado') NOT NULL DEFAULT 'Pendiente',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
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
('NOT FILE', 'Pendiente', '2015-01-26 20:28:52', '2015-01-26 20:30:22', NULL, 14, 1),
('NOT FILE', 'Pendiente', '2015-01-26 20:28:52', '2015-01-26 20:30:22', NULL, 14, 4),
('NOT FILE', 'Pendiente', '2015-01-15 16:19:54', '2015-01-15 16:19:54', NULL, 17, 1),
('NOT FILE', 'Pendiente', '2015-01-15 16:19:54', '2015-01-15 16:19:54', NULL, 17, 3),
('NOT FILE', 'Pendiente', '2015-01-09 18:25:57', '2015-01-09 20:47:22', NULL, 18, 1),
('NOT FILE', 'Pendiente', '2015-01-09 18:25:57', '2015-01-09 20:47:22', NULL, 18, 4),
('NOT FILE', 'Pendiente', '2014-12-04 21:34:49', '2014-12-04 21:34:49', NULL, 19, 1),
('NOT FILE', 'Pendiente', '2014-12-04 21:34:49', '2014-12-04 21:34:49', NULL, 19, 4),
('NOT FILE', 'Pendiente', '2015-02-12 20:08:22', '2015-02-12 20:08:22', NULL, 27, 2),
('NOT FILE', 'Pendiente', '2015-02-12 20:08:22', '2015-02-12 20:08:22', NULL, 27, 4),
('NOT FILE', 'Pendiente', '2015-02-12 21:25:31', '2015-02-12 21:26:48', NULL, 28, 4),
('NOT FILE', 'Pendiente', '2015-02-18 17:47:50', '2015-02-18 17:47:50', NULL, 29, 4),
('NOT FILE', 'Pendiente', '2015-02-18 19:20:10', '2015-02-18 19:20:10', NULL, 30, 3),
('NOT FILE', 'Pendiente', '2015-02-18 19:20:12', '2015-02-18 19:20:12', NULL, 35, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `events`
--

DROP TABLE IF EXISTS `events`;
CREATE TABLE IF NOT EXISTS `events` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `id_dci` varchar(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `start_day` date NOT NULL,
  `end_day` date NOT NULL,
  `place` varchar(50) NOT NULL,
  `time` time NOT NULL,
  `has_cost` tinyint(1) NOT NULL,
  `directed_to` enum('Público en general','Comunidad BUAP','Profesores','Estudiantes') NOT NULL,
  `link` varchar(100) DEFAULT NULL,
  `description` text,
  `dci_status` enum('Pendiente','En Proceso','Atendido') NOT NULL DEFAULT 'Pendiente' COMMENT 'Pendiente: Nadie ha visto el evento\nEn Proceso: Por lo menos un jefe de algún servicio solicitado ha asignado tareas a sus empleados sobre este evento.\nAtendido: Todos los jefes de las respectivas áreas han marcado su respectivo servicio como atendido.',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_events_users1_idx` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=36 ;

--
-- Volcado de datos para la tabla `events`
--

INSERT INTO `events` (`id`, `id_dci`, `name`, `start_day`, `end_day`, `place`, `time`, `has_cost`, `directed_to`, `link`, `description`, `dci_status`, `created_at`, `updated_at`, `deleted_at`, `user_id`) VALUES
(1, '1411271', 'Encendido del árbol navideño 2015', '2014-12-03', '2014-12-03', 'CCU', '18:00:00', 0, 'Público en general', '', 'Habra rifas y sorpresas', 'Pendiente', '2014-11-27 04:39:44', '2014-11-28 01:51:25', NULL, 9),
(2, '1411272', 'Seminario "Las Reformas Estructurales en México y la ampliación de los derechos humanos en México: u', '2014-12-08', '2014-12-08', 'ICGDE', '08:00:00', 0, 'Público en general', 'http://www.icgde.buap.mx/', '', 'Pendiente', '2014-11-27 18:05:54', '2014-11-27 18:05:54', NULL, 18),
(3, '1411273', 'Lanzamiento de campaña el valor eres tú', '2014-12-01', '2015-02-27', 'DCI', '17:00:00', 0, 'Comunidad BUAP', '', 'Campaña interna de comunicación', 'Pendiente', '2014-11-27 18:16:17', '2015-01-23 15:28:19', NULL, 9),
(4, '1411274', 'Primer Taller Internacional "Tendencias en la Enseñanza de las Matemáticas Basada en la Investigació', '2014-11-27', '2014-11-30', 'Edificio: 1DGIE1 Av. San Claudio  y 22 Sur, Ciudad', '17:00:00', 0, 'Comunidad BUAP', 'http://www.fcfm.buap.mx/TEMBI/index.php', '\r\n\r\nEs el Primer Taller Internacional "Tendencias en la enseñanza de las matemáticas basada en investigación (TEMBI)", el cual es el espacio académico ideal para conocer, discutir y reflexionar sobre las tendencias más actuales en la enseñanza de las matemáticas basada en la investigación. ', 'Pendiente', '2014-11-27 19:40:35', '2014-11-27 19:40:35', NULL, 10),
(5, '1411281', 'Encendido del árbol navideño', '2014-12-02', '2014-12-02', 'Explanada del Auditorio CCU', '17:00:00', 0, 'Público en general', '', '', 'Pendiente', '2014-11-28 01:29:22', '2014-11-28 01:30:03', NULL, 9),
(6, '1411282', 'Encendido del Árbol Navideño', '2014-12-02', '2014-12-02', 'Explanada Auditorio CCU', '17:00:00', 0, 'Público en general', '', '', 'Pendiente', '2014-11-28 01:31:26', '2015-02-18 17:30:45', '2015-02-18 17:30:45', 9),
(7, '1411283', 'Encendido del Árbol Navideño', '2014-12-02', '2014-12-02', 'Explanada del CCU', '18:00:00', 0, 'Público en general', '', '', 'Pendiente', '2014-11-28 02:00:34', '2014-11-28 02:00:34', NULL, 9),
(8, '1412021', 'Convocatoria al proceso de Selección para ingresar al Doctorado en Ciencias de Gobierno y Política', '2014-12-02', '2015-02-28', 'ICGDE', '17:00:00', 0, 'Público en general', 'http://www.icgde.buap.mx/', '', 'Pendiente', '2014-12-02 20:27:40', '2014-12-02 20:27:40', NULL, 18),
(9, '1412021', 'Convocatoria para el Proceso de Selección para ingresar al Doctorado en Ciencias de Gobierno y Polít', '2014-12-02', '2015-02-28', 'ICGDE', '17:00:00', 0, 'Público en general', 'http://www.icgde.buap.mx/', '', 'Pendiente', '2014-12-02 20:33:47', '2014-12-02 20:49:07', NULL, 18),
(10, '1412022', 'Ballet folklórico', '2014-12-07', '2014-12-07', 'Auditorio CCU', '12:00:00', 0, 'Público en general', '', '', 'Pendiente', '2014-12-02 20:42:13', '2014-12-02 20:53:55', NULL, 9),
(11, '1412023', 'Ballet folklórico BUAP', '2014-12-07', '2014-12-07', 'Auditorio CCU', '12:00:00', 0, 'Público en general', '', '', 'Pendiente', '2014-12-02 20:43:17', '2014-12-02 20:43:17', NULL, 9),
(12, '1412024', 'Rueda de presnsa', '2014-12-03', '2014-12-03', 'Casa del mendrugo', '09:30:00', 1, 'Público en general', '', '', 'Pendiente', '2014-12-02 21:07:43', '2014-12-02 21:08:07', NULL, 9),
(13, '1412025', 'rueda de prensa', '2014-12-03', '2014-12-03', 'Casa del mendrugo', '21:00:00', 0, 'Público en general', '', '', 'Pendiente', '2014-12-02 21:11:32', '2014-12-02 21:11:42', NULL, 9),
(14, '1501261', 'Seminario de Orientación BUAP, modalidad virtual ', '2015-02-14', '2015-04-17', 'Dirección General de Innovación Educativa', '17:00:00', 1, 'Público en general', 'http://seminario.buap.mx/seminario/virtual/', 'Seminario de orientación BUAP 2015\r\nModalidad Virtual\r\n¡Prepárate en línea para el examen de admisión a la BUAP desde donde estés!\r\nRegistro abierto hasta el 15 de abril en seminario.buap.mx\r\nDuración del 14 de febrero al 17 de abril\r\nEsta es la opción de preparación para aquellos interesados en ingresar a la BUAP que viven fuera del Estado de Puebla o el extranjero porque les permite potenciar sus habilidades de razonamiento a través de un curso en línea con la misma calidad y respaldo del Seminario de Orientación presencial ¿Cómo? Fortaleciendo sus habilidades para presentar con éxito la Prueba de Aptitud Académica (PAA). \r\nEste seminario cuenta con sesiones online conformadas por las áreas de Razonamiento Verbal, Razonamiento Matemático y Redacción Indirecta donde el aspirante descubre sus áreas de oportunidad, evalúa sus avances, confirma sus respuestas, conoce el examen y estudia de manera independiente y autónoma: a su ritmo, desde su lugar de residencia, sin gastos adicionales en transporte, materiales y alimentación, siempre con el apoyo y acompañamiento de Asesores Especialistas que aclararán sus dudas, a través  de chats y foros virtuales.\r\nInformes:\r\nTeléfono 2 29 55 00 extensión 7902.\r\nInversión:\r\n $500.00 \r\nEstudiantes a graduarse en  julio de 2015 de las Preparatorias de la BUAP podrán cursarlo sin costo.\r\n', 'Pendiente', '2015-01-26 20:28:52', '2015-01-26 20:30:22', NULL, 16),
(15, '1501222', 'DIPLOMADO EN ADMINISTRACIÓN PÚBLICA Y CONTABILIDAD GUBERNAMENTAL', '2015-03-06', '2015-07-11', 'ICGDE', '17:00:00', 1, 'Público en general', 'http://www.icgde.buap.mx/', '', 'Pendiente', '2015-01-22 21:17:28', '2015-01-22 21:17:28', NULL, 18),
(16, '1501221', 'Diplomado en Marketing Político y Electoral', '2015-03-06', '2015-07-11', 'ICGDE', '18:00:00', 1, 'Público en general', 'http://www.icgde.buap.mx/', '', 'Pendiente', '2015-01-22 21:03:27', '2015-01-22 21:03:27', NULL, 18),
(17, '1501151', 'Expo Educación BUAP 2015', '2015-02-16', '2015-02-18', 'Complejo Cultural Universitario', '09:00:00', 0, 'Público en general', 'http://www.buap.mx/', 'Oferta académica a nivel superior. ', 'Pendiente', '2015-01-15 16:19:54', '2015-01-15 16:19:54', NULL, 14),
(18, '1501091', 'Curso de preparación y examen para la acreditación de la maetria del TCU111 COMPUTACIÓN', '2015-01-19', '2015-02-13', 'Dirección General de Innovación Educativa', '17:00:00', 1, 'Público en general', 'http://www.dgie.buap.mx/index.php/soporte-tecnico-2', 'CURSO DE PREPARACIÓN AL EXAMEN DE ACREDITACIÓN DE LA MATERIA TCU-111 COMPUTACIÓN\r\nPRIMAVERA 2015\r\nDirigido a los alumnos de las generaciones 2008 y anteriores.\r\nINSCRIPCIONES DEL 16 AL 20 DE FEBRERO DE 2015\r\nInicio: 28 de febrero \r\nTérmino del curso: 28 de marzo\r\n\r\nEL CURSO SE REALIZA EN OFFICE 2007\r\nMayores informes en www.dgie.buap.mx\r\n\r\nPara cualquier duda, dirigirse con la Lic. Erika Juárez Hernández al tel. 2295500\r\n Ext. 7927, correo: erika.juarez@correo.buap.mx\r\n\r\n\r\nEXAMEN DE ACREDITACIÓN DE LA MATERIA TCU-111 COMPUTACIÓN\r\nPRIMAVERA 2015\r\nDirigido a los alumnos de las generaciones 2008 y anteriores.\r\nINSCRIPCIONES DEL 16 AL 20 DE FEBRERO DE 2015\r\n\r\nFecha para presentar el examen:\r\n•  6 de marzo de 2015 a las  09:00 horas en el salón 203 de la DGIE\r\n\r\n\r\n\r\nEL EXAMEN SE APLICA EN OFFICE 2007\r\nMayores informes en www.dgie.buap.mx\r\n\r\nPara cualquier duda, dirigirse con la Lic. Erika Juárez Hernández al tel. 2295500\r\n Ext. 7927, correo: erika.juarez@correo.buap.mx\r\n', 'Pendiente', '2015-01-09 18:25:57', '2015-01-09 20:47:22', NULL, 16),
(19, '1412048', 'Cursos Estacionales de Idiomas primavera 2015', '2015-01-05', '2015-01-16', 'Dirección General de Innovación Educativa', '17:00:00', 1, 'Público en general', 'http://www.dgie.buap.mx/index.php/cursos-estacionales', 'Los Cursos Estacionales están dirigidos a la Comunidad Universitaria y Público en General.\r\nDentro de los grupos, sesión por sesión se desarrollan las competencias y habilidades tan necesarias hoy día dentro de las distintas facetas de la vida (Académicas,  Laborales o Lúdicas) de manera dinámica e interactiva.\r\n\r\nEs a través  del  constante proceso formativo que nuestros usuarios logran exitosamente cumplir sus propósitos de manera segura, completa y acreditada  dentro de una dependencia universitaria con apertura y flexibilidad,  que además  cuenta con los contactos necesarios con instituciones nacionales e internacionales quienes avalan el nivel de los conocimientos y aptitudes de quienes se han formado con nosotros.', 'Pendiente', '2014-12-04 21:34:49', '2014-12-04 21:34:49', NULL, 16),
(20, '1412041', 'Presentación de instrumentos ORF', '2014-12-05', '2014-12-05', 'Circulo Infantil /sección Lactantes y Maternales', '11:00:00', 1, 'Estudiantes', '', 'El evento es interno, una presentación solo para los alumnos y maestras de la sección de LyM solicitamos toma de fotografias y video.', 'Pendiente', '2014-12-04 13:52:28', '2014-12-04 13:54:35', NULL, 15),
(21, '1412042', 'PIPOPETS /titeres', '2014-12-08', '2014-12-08', 'Patio techado preescolar', '09:00:00', 0, 'Estudiantes', '', 'El evento es interno, dirigido solo para los niños del CI, solicitamos toma de fotografías y clip de vídeo.', 'Pendiente', '2014-12-04 13:54:02', '2014-12-04 13:54:02', NULL, 15),
(22, '1412043', 'Presentación de Instrumentos ORF', '2014-12-05', '2014-12-05', 'Patios (2 presentaciones)', '11:00:00', 0, 'Estudiantes', '', 'La presentación es interna, solo dirigida a niños y maestras del CI, solicitamos toma de fotografías y clip de video', 'Pendiente', '2014-12-04 13:56:21', '2014-12-04 13:56:21', NULL, 15),
(23, '1412044', 'Festival Navideño', '2014-12-11', '2014-12-12', 'Auditorio de la Unidad de Seminarios', '09:00:00', 0, 'Estudiantes', '', 'Festival Navideño invita a dirigido a comunidad del CI, padres y familiares, dos presentaciones, día 11 preescolar, día 12 LyM, solicitamos toma de fotografías y video\r\n*el acceso es solo con invitación', 'Pendiente', '2014-12-04 13:59:52', '2014-12-04 13:59:52', NULL, 15),
(24, '1412045', 'Cuento de Navidad de la compañia de danza contemporánea de la BUAP', '2014-12-15', '2014-12-15', 'Comedor CI', '11:00:00', 0, 'Estudiantes', '', 'Presentación interna para alumnos del CI, solicitamos toma de fotografías y  clip de video', 'Pendiente', '2014-12-04 14:02:22', '2014-12-04 14:02:22', NULL, 15),
(25, '1412046', 'Cuento Navideño, teatro de sombras', '2014-12-16', '2014-12-16', 'Comedor CI', '11:30:00', 0, 'Estudiantes', '', 'Presentación interna para alumnos del CI, solicitamos toma de fotografías y clip de video', 'Pendiente', '2014-12-04 14:03:46', '2014-12-04 14:03:46', NULL, 15),
(26, '1412047', 'Teatro chino', '2014-12-11', '2014-12-11', 'Patio techado preescolar', '11:00:00', 0, 'Estudiantes', '', 'Evento interno del CI, solicitamos toma de fotografías y clip de vídeo ', 'Pendiente', '2014-12-04 21:10:11', '2014-12-04 21:10:11', NULL, 15),
(27, '1502121', 'Mona Trujillo', '2015-02-20', '2015-02-21', 'Vel minus amet sint saepe qui amet molestias vel e', '02:43:00', 0, 'Comunidad BUAP', 'http://www.fozusarasitoj.ca', 'Velit ad excepteur possimus, architecto voluptate vel est non sit ad ex vero vero molestiae autem deserunt consequatur.', 'Pendiente', '2015-02-12 20:08:22', '2015-02-12 20:08:22', NULL, 2),
(28, '1502122', 'Modalidades a Distancia y Semiescolarizada . Admisión 2015 y TAA', '2015-02-16', '2015-06-26', 'Dirección General de Innovación Educativa', '17:00:00', 1, 'Público en general', 'http://www.dgie.buap.mx/educacion-a-distancia', 'Bajo un modelo dinámico y funcional que  atiende a quienes buscan opciones de estudio diferentes, la Benemérita  Universidad Autónoma  de Puebla te ofrece programas de  licenciatura en modalidades no presenciales, 7 en Modalidad  a Distancia y 5 en Modalidad Semiescolarizada:\r\n\r\nModalidad a Distancia:\r\nAdministración de Empresas\r\nContaduría Pública\r\nComunicación\r\nDerecho\r\nMercadotecnia y Medios digitales\r\nNegocios Internacionales\r\nAdministración y Dirección de PYMES\r\n\r\nModalidad Semiescolarizada:\r\nAdministración de Empresas\r\nContaduría Pública\r\nComunicación\r\nDerecho\r\nReadaptación y Activación física\r\n\r\n\r\n\r\n¡No dejes pasar más tiempo y estudia en línea con nosotros!\r\n\r\nPara mejorar la experiencia educativa, la BUAP ha dispuesto un ambiente virtual de aprendizaje (Plataforma institucional).\r\n\r\nLas ventajas de estudiar en estas modalidades son:\r\n-Contenidos educativos que   te permiten estudiar en línea.\r\n-Facilitadores (profesores) con dominio en el aprendizaje en línea.\r\n-Ambiente  virtual  donde  realizas las actividades.\r\n-Herramientas  de comunicación y colaboración  dentro del ambiente virtual.\r\n-Como aspirante  recibes inducción a las modalidades (Taller propedéutico), desarrollo de habilidades en el uso de las TIC y autogestión.\r\n-Soporte técnico permanente.\r\n\r\n\r\nInformes:\r\nDIRECCIÓN GENERAL DE INNOVACIÓN EDUCATIVA\r\nwww.dgie.buap.mx\r\nCorreo: \r\ninformes.dgie@correo.buap.mx\r\nTeléfono: (222)2-29-55-00 extensión 7926\r\nDirección: Avenida  San  Claudio y Avenida 22 Sur, edificio 1DGIE, Ciudad Universitaria. Puebla, Pue.\r\n C.P. 72570\r\n TWITTER y FACEBOOK: BUAPaDistancia\r\n', 'Pendiente', '2015-02-12 21:25:31', '2015-02-12 21:26:48', NULL, 16),
(29, '1502181', 'Cursos Estacionales de idiomas Primavera 2-2015', '2015-03-06', '2015-03-20', 'Dirección General de Innovación Educativa', '17:00:00', 1, 'Público en general', 'http://www.dgie.buap.mx/cursos-estacionales', 'Dentro de los grupos, sesión por sesión se desarrollan las competencias y habilidades tan necesarias hoy día dentro de las distintas facetas de la vida (Académicas,  Laborales o Lúdicas) de manera dinámica e interactiva.\r\n\r\nEs a través  del  constante proceso formativo que nuestros usuarios logran exitosamente cumplir sus propósitos de manera segura, completa y acreditada  dentro de una dependencia universitaria con apertura y flexibilidad,  que además  cuenta con los contactos necesarios con instituciones nacionales e internacionales quienes avalan el nivel de los conocimientos y aptitudes de quienes se han formado con nosotros.\r\n\r\nTe invitamos a seguir con nosotros. ¡Acércate!  \r\n\r\n \r\n\r\n \r\n ', 'Pendiente', '2015-02-18 17:47:50', '2015-02-18 17:47:50', NULL, 16),
(30, '1502182', 'Facultad Cs. de la Computación: Puertas abiertas 2015', '2015-03-07', '2015-03-07', 'Facultad de Ciencias de la Computación', '09:30:00', 0, 'Estudiantes', '', ' Ven y acércate al mundo computacional  y sus tecnologías. Se darán a conocer los programas educativos con conferencias, exposiciones y mini talleres', 'Pendiente', '2015-02-18 19:20:09', '2015-02-18 19:20:09', NULL, 9),
(31, '1502183', 'Facultad Cs. de la Computación: Puertas abiertas 2015', '2015-03-07', '2015-03-07', 'Facultad de Ciencias de la Computación', '09:30:00', 0, 'Estudiantes', '', ' Ven y acércate al mundo computacional  y sus tecnologías. Se darán a conocer los programas educativos con conferencias, exposiciones y mini talleres', 'Pendiente', '2015-02-18 19:20:10', '2015-02-18 19:35:24', '2015-02-18 19:35:24', 9),
(32, '1502184', 'Facultad Cs. de la Computación: Puertas abiertas 2015', '2015-03-07', '2015-03-07', 'Facultad de Ciencias de la Computación', '09:30:00', 0, 'Estudiantes', '', ' Ven y acércate al mundo computacional  y sus tecnologías. Se darán a conocer los programas educativos con conferencias, exposiciones y mini talleres', 'Pendiente', '2015-02-18 19:20:11', '2015-02-18 19:35:06', '2015-02-18 19:35:06', 9),
(33, '1502185', 'Facultad Cs. de la Computación: Puertas abiertas 2015', '2015-03-07', '2015-03-07', 'Facultad de Ciencias de la Computación', '09:30:00', 0, 'Estudiantes', '', ' Ven y acércate al mundo computacional  y sus tecnologías. Se darán a conocer los programas educativos con conferencias, exposiciones y mini talleres', 'Pendiente', '2015-02-18 19:20:11', '2015-02-18 19:34:44', '2015-02-18 19:34:44', 9),
(34, '1502186', 'Facultad Cs. de la Computación: Puertas abiertas 2015', '2015-03-07', '2015-03-07', 'Facultad de Ciencias de la Computación', '09:30:00', 0, 'Estudiantes', '', ' Ven y acércate al mundo computacional  y sus tecnologías. Se darán a conocer los programas educativos con conferencias, exposiciones y mini talleres', 'Pendiente', '2015-02-18 19:20:11', '2015-02-18 19:34:14', '2015-02-18 19:34:14', 9),
(35, '1502187', 'Facultad Cs. de la Computación: Puertas abiertas 2015', '2015-03-07', '2015-03-07', 'Facultad de Ciencias de la Computación', '09:30:00', 0, 'Estudiantes', '', ' Ven y acércate al mundo computacional  y sus tecnologías. Se darán a conocer los programas educativos con conferencias, exposiciones y mini talleres', 'Pendiente', '2015-02-18 19:20:12', '2015-02-18 19:32:43', '2015-02-18 19:32:43', 9);

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
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
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
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `resources_sources`
--

INSERT INTO `resources_sources` (`id`, `name`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Tesorería', NULL, '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL),
(2, 'Fondo fijo', NULL, '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL),
(3, 'Apoyos especiales', NULL, '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL),
(4, 'Otros', NULL, '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL);

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
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `department_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_services_department1_idx` (`department_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- Volcado de datos para la tabla `services`
--

INSERT INTO `services` (`id`, `name`, `description`, `observations`, `created_at`, `updated_at`, `deleted_at`, `department_id`) VALUES
(1, 'Diseño gráfico', NULL, NULL, '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL, 7),
(2, 'Asesoría en redacción', NULL, NULL, '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL, 4),
(3, 'Entrevista Radio BUAP', NULL, NULL, '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL, 10),
(4, 'Prensa externa', NULL, NULL, '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL, 4),
(5, 'Entrevista en Radiodifusoras', NULL, NULL, '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL, 10),
(6, 'Producción de material impreso*', NULL, NULL, '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL, 7),
(7, 'Producción de material audiovisual*', NULL, NULL, '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL, 9),
(8, 'Sitio Web', NULL, NULL, '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL, 5),
(9, 'Revistas', NULL, NULL, '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL, 8),
(10, 'Redes sociales', NULL, NULL, '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL, 5),
(11, 'Spot', NULL, NULL, '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL, 10),
(12, 'Control Remoto', NULL, NULL, '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL, 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `support_materials`
--

DROP TABLE IF EXISTS `support_materials`;
CREATE TABLE IF NOT EXISTS `support_materials` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `original_name` varchar(100) NOT NULL,
  `file` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `event_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_support_materials_events1_idx` (`event_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- Volcado de datos para la tabla `support_materials`
--

INSERT INTO `support_materials` (`id`, `original_name`, `file`, `created_at`, `updated_at`, `deleted_at`, `event_id`) VALUES
(1, 'archivo.eps', 'support_materials/T02qysx5Y2fWGjNmIDfU.eps', '2014-11-27 18:05:54', '2014-11-27 18:05:54', NULL, 2),
(2, 'archivo.jpg', 'support_materials/AJGvCi6JyyEd54HEE17J.jpg', '2014-12-02 20:27:40', '2014-12-02 20:27:40', NULL, 8),
(3, 'archivo.jpg', 'support_materials/EmhYVLUikTuNNOA2M1nh.jpg', '2014-12-02 20:33:47', '2014-12-02 20:49:07', NULL, 9),
(4, 'archivo.jpg', 'support_materials/grlt2UF3FFAI7Q09GfKG.jpg', '2014-12-02 20:42:13', '2014-12-02 20:53:55', NULL, 10),
(5, 'archivo.jpg', 'support_materials/UWZ6Q6jq6HkNArJk6YMf.jpg', '2014-12-02 20:43:17', '2014-12-02 20:43:17', NULL, 11),
(6, '06-redes-admision-2015.jpg', 'support_materials/eruAlYwORNYLr9sBxwqH.jpg', '2015-02-12 21:25:31', '2015-02-12 21:25:31', NULL, 28),
(7, '07-portal-buap-banner-admision-2015.jpg', 'support_materials/t7WvYhHC4X2U36KSMETD.jpg', '2015-02-12 21:25:31', '2015-02-12 21:25:31', NULL, 28),
(8, '08-buap-cartel-600-admision-2015.jpg', 'support_materials/rHnugmb6Q0ESPk3H5eFw.jpg', '2015-02-12 21:25:31', '2015-02-12 21:25:31', NULL, 28),
(9, '08-buap-cartel-1000-admision-2015.jpg', 'support_materials/JBFgPs7RNIbW2iU1eGfT.jpg', '2015-02-12 21:25:31', '2015-02-12 21:25:31', NULL, 28),
(10, 'Programación de los Cursos estacionales de Idiomas PRIMAVERA 2-2015 - DCI BUAP REV.docx', 'support_materials/xpokJUHuu9bUrv67j42R.docx', '2015-02-18 17:47:50', '2015-02-18 17:47:50', NULL, 29),
(11, 'Banner_Puertas.png', 'support_materials/JqWhTDn8995MD66Q3YfE.png', '2015-02-18 19:20:09', '2015-02-18 19:20:09', NULL, 30),
(12, 'Banner_Puertas.png', 'support_materials/AZLq9cRrkJdedInxdyZv.png', '2015-02-18 19:20:12', '2015-02-18 19:20:12', NULL, 35);

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
  `created_at` datetime NOT NULL,
  `completed_at` datetime DEFAULT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `event_service_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_tasks_users1_idx` (`user_id`),
  KEY `fk_tasks_event_service1_idx` (`event_service_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `tasks`
--

INSERT INTO `tasks` (`id`, `status`, `description`, `comment`, `created_at`, `completed_at`, `updated_at`, `deleted_at`, `user_id`, `event_service_id`) VALUES
(1, 'Pendiente', 'Realizar material para impresión', NULL, '2015-02-18 19:23:14', NULL, '2015-02-18 19:23:14', NULL, 27, 1),
(2, 'Completa', 'Autorizar carteles', 'Se revisaron y si corresponden a la imagen gráfica', '2015-02-18 19:24:46', '2015-02-18 19:28:21', '2015-02-18 19:28:21', NULL, 27, 16),
(3, 'Completa', 'Control Remoto', 'Se realizó scouting, fotos, redes.', '2015-02-19 15:59:46', '2015-02-19 16:01:17', '2015-02-19 16:01:17', NULL, 36, 2),
(4, 'Completa', 'Carrusel Interno', 'Se realizó carrusel de entrevistas', '2015-02-19 16:04:11', '2015-02-19 16:05:23', '2015-02-19 16:05:23', NULL, 36, 4);

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
  `status` tinyint(1) NOT NULL DEFAULT '2' COMMENT '0 Inactive\n1 Active\n2 Activation required\n3 Authorization required',
  `remember_token` varchar(100) DEFAULT NULL,
  `password` varchar(60) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `user_type_id` bigint(20) unsigned NOT NULL DEFAULT '1',
  `department_id` bigint(20) unsigned DEFAULT '1',
  `academic_administrative_unit_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  KEY `fk_users_user_type1_idx` (`user_type_id`),
  KEY `fk_users_academic_administrative_unit1_idx` (`academic_administrative_unit_id`),
  KEY `fk_users_department1_idx` (`department_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=41 ;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `extension_phone`, `status`, `remember_token`, `password`, `created_at`, `updated_at`, `deleted_at`, `user_type_id`, `department_id`, `academic_administrative_unit_id`) VALUES
(1, 'Javier ', 'Aguila', 'sjaca10@gmail.com', '2227262898', NULL, 1, NULL, '$2y$10$q411s6Zk3KrNxUZ.YDp3lOsspQvhFCCLwqitIu0pfBw/mMEvHQkaO', '2015-02-11 16:46:40', '2015-02-19 19:45:52', NULL, 1, 1, 1),
(2, 'Israel', 'Cruz', 'jesuslink00@gmail.com', NULL, NULL, 1, NULL, '$2a$10$Q8IqS1k3IbXL6kMfYNXbFO.AtgzWDwUOQN5yv7s2utED.yR.MEUMO', '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL, 1, 1, 2),
(3, 'Arturo', 'Aguila', 'superjaca10@live.com.mx', '2227262898', NULL, 1, NULL, '$2a$10$0O7q42JfKrcvO.4XDXj9yOPjhbL4h2kIxCv1R7K4HWQkT.ZcThgWK', '2015-02-11 16:46:40', '2015-02-14 19:23:09', NULL, 2, 6, 3),
(4, 'Jesús', 'Cruz', 'jr12a@hotmail.com', NULL, NULL, 1, NULL, '$2a$10$N93ev1lfFTiG8fQ0VkPra.4qVzRJ7SkyY1wPdXK9EcpwUxuDgfzPu', '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL, 2, 6, 4),
(5, 'Javier Arturo', 'Aguila', 'javier@aerostato.mx', '2227262898', NULL, 1, NULL, '$2a$10$suvXa472nvfv4Sj43jD/AOVfBBCFNba8Bxad7ZARQTPD5iE90GUWS', '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL, 3, 6, 5),
(6, 'Jesús Israel', 'Cruz', 'israel@aerostato.mx', NULL, NULL, 1, NULL, '$2a$10$nOcsUEkbTkj0Q2b8t3ZN9emaExLtiIuMAYH/hU3lizeul2JGXD79a', '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL, 3, 6, 6),
(7, 'JA', 'Aguila', 'sjaca10@yahoo.com', '2227262898', NULL, 1, NULL, '$2a$10$DsDe5yrq1sDEmWo4k7Cp4ObXgiTaao1S1hIk7jv4/VcAmd58nO8hm', '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL, 4, 6, 7),
(8, 'JI', 'Cruz', 'israelcruzrojas@outlook.com', NULL, NULL, 1, NULL, '$2a$10$tnmOu86c1lSeTLnbtJ04t.XCebLLW53gXVmkJtMVAwNYz3.HqAjuq', '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL, 4, 6, 8),
(9, 'Amparo', 'Merino Reyes', 'amparomx@gmail.com', '2224807645', '5266', 1, NULL, '$2y$10$TaOZ3yl33Vluq.3X5tW1oODQpeD1W8YY0EM8p7qfSv3O/Gq4JmvGO', '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL, 1, 1, 11),
(10, 'Enrique', 'Barradas', 'barradas@fcfm.buap.mx', '2345044', '22955', 1, NULL, '$2y$10$1DUreIiK92X11woVYRs91OuuJhc/DbNDaFkl40tgylHlvJfSzYe2C', '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL, 1, 1, 60),
(11, 'Heriberto', 'Hernández Moreno', 'cherokhee@gmail.com', '', '22955', 1, NULL, '$2y$10$qT7Kq77wMttw2uBnJ4p.jeBtuOXpe2N5YsH5do2rmrp9eQdiOOfdm', '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL, 1, 1, 17),
(12, 'Alfredo ', 'Arceo', 'aarceo@ccinf.ucm.es', '', '', 1, NULL, '$2y$10$06DEX1roqVK2IDDF5K2ENeVchMaUCHC71FFdK/jbaWZuPLh5ro0CS', '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL, 1, 1, 11),
(13, 'Carlos', 'de Castilla Jiménez', 'carlos.decastilla@correo.buap.mx', '2224458190', '22955', 1, NULL, '$2y$10$YCyxGBBgMPhuynZoybN/Qu0TfpDVW5BXdGyxyGg5dxcYb7NXbhlpa', '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL, 1, 1, 65),
(14, 'Ana Lidia', 'Ramírez Herrera', 'analidia.ramirez@correo.buap.mx', '', '5286', 1, NULL, '$2y$10$7hiuKgZmePiSqRQBtgBH8uYL2CukhdP1fBsEqvBpry9SS81FSU8M2', '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL, 1, 1, 11),
(15, 'Isabel', 'Larenas', 'circulo.infantil@correo.buap.mx', '2295500', '3604', 1, NULL, '$2y$10$MNPHxm0A0f3jarMvy.5H2u90HjH9BMtzP0rue6StA5vBGa2NX4C6a', '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL, 1, 1, 16),
(16, 'Berenize', 'Conde Morales', 'berenize.conde@correo.buap.mx', '2221066071', '22955', 1, NULL, '$2y$10$DSL24k82C9Zdt41SGRE2Fe.rnX1SPUJvcHUPoY.cUGb7wRDyHEOBu', '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL, 1, 1, 24),
(17, 'Nohemi', 'Melgoza', 'nohemi.melgoza@correo.buap.mx', '2223247870', '22955', 1, NULL, '$2y$10$A9OFo6cImEZGi7DWgTLQXO8s788I4vyUpkJjBRb1P1IdTnMiFzhCy', '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL, 1, 1, 61),
(18, 'Carla', 'Ríos Calleja', 'difusion.icgde@correo.buap.mx', '2225774214', '3457', 1, NULL, '$2y$10$/iOHOdpU2Ng2MSvIf6eBh.PdhKt7Ndu7w9gOJSKaLBJgw5rO6I80i', '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL, 1, 1, 76),
(19, 'Victor ', 'Escobar Mejia', 'victorem1969@hotmail.com', '2225673476', '22955', 1, NULL, '$2y$10$VoN6RNYzSVDmkZqIfJUW9ePQdCGtU7.VvMb.rOpAKRDeoFngP.n3O', '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL, 1, 1, 1),
(20, 'Ana ', 'Urías ', 'ana.urias@correo.buap.mx', '2295500', '5266', 1, NULL, '$2y$10$/War0ACGr/Xj1pnGTeN6Xu.5PKgf2nKvleNkui9pUJKq2FqhfqYXq', '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL, 1, 1, 11),
(21, 'Brenda', 'Loeza', 'calidad.hup@correo.buap.mx', '2221162414', '6236', 1, NULL, '$2y$10$9DK05BwLmdjKoBhx/OM/Ue1mK7mzRmGcdt03XcN3tt6uzUGE.eSb6', '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL, 1, 1, 28),
(22, 'Paola', 'Hernández Flores', 'paolaherflo@gmail.com', '2225676300', '5266', 1, NULL, '$2y$10$BIqDJoykyyNGegnhnuRt8.KABk6usGYjjYXXWMieUlKgNV6OJXI.C', '2015-02-12 19:55:19', '2015-02-12 21:46:24', NULL, 2, 3, 11),
(23, 'Amparo', 'Merino', 'amparo.merino@correo.buap.mx', '', '5266', 1, NULL, '$2y$10$oPgWGhSOU0LEDeFEfMbBKeGq3H05yCLjpM/93qgE.aomyz44gLyIS', '2015-02-12 20:01:36', '2015-02-12 20:07:12', NULL, 4, 3, 11),
(24, 'Maria Elena', 'Jimenez Chavez', 'malejch12@hotmail.com', '', '5286', 2, NULL, '$2y$10$et3iRwgJZ3On43RkP2dTZu9FbY2vDRxnbObklBNXOWGchSQ0upXGy', '2015-02-12 22:00:18', '2015-02-12 22:00:18', NULL, 2, 3, 11),
(25, 'Ana Lidia', 'Ramírez Herrera', 'agenda.dci15@gmail.com', '', '5286', 1, NULL, '$2y$10$mdtBTo9ZISUknAQ/xZ7GT.dD4kkNAwjJlI0zwwQbX1FSIYOXsF//G', '2015-02-16 15:54:45', '2015-02-16 15:56:45', NULL, 3, 3, 11),
(26, 'José Miguel', 'Hernández Chan', 'miguel.chan@correo.buap.mx', '', '5269', 1, NULL, '$2y$10$JNq7PBxB5E6b0bLzpTxJVelbuNodzqzv3zFxrVRDcaRQRYZZwRGzO', '2015-02-18 19:06:09', '2015-02-18 19:09:21', NULL, 3, 7, 11),
(27, 'Alejandro', 'Varela', 'casalva0@gmail.com', '2224220687', '5269', 1, NULL, '$2y$10$gd4kjAT1UCMeCLYjtqbwl.d5RbzPApUetMMotDXL1BQSZvwHlCRja', '2015-02-18 19:07:07', '2015-02-18 19:09:23', NULL, 2, 7, 11),
(28, 'Beatriz', 'Guillén', 'bgr601019@hotmail.com', '2295500', '5268', 1, NULL, '$2y$10$Typ9wFEKDPANYa3zvxgjiOG9LXKrGCT0nBp4dNacJayve/Tfad09y', '2015-02-18 19:50:37', '2015-02-18 20:04:22', NULL, 3, 4, 11),
(29, 'Elizabeth', 'Juárez López', 'elith.juarez.87@gmail.com', '', '5268', 1, NULL, '$2y$10$iJhyMeFT8WA4j882h5meNOTW2BHj9axyt5rxzIQOuL1bKpeGzOXVC', '2015-02-18 20:00:00', '2015-02-18 20:10:18', NULL, 2, 4, 11),
(30, 'José Enrique', 'Tlachi Rodríguez ', 'josetlachi.10@gmail.com', '', '5268', 1, NULL, '$2y$10$pAYZ7oSf/ilyQ0R5NI3nZuDSprqoXWvf4gfiUz3MXxFNOPqvV4JRC', '2015-02-18 20:01:49', '2015-02-18 20:08:40', NULL, 1, 1, 11),
(31, 'Yassin Antonio', 'Radilla Barreto', 'yassin.radilla@gmail.com', '2224563350', '22955', 1, NULL, '$2y$10$oqjAagdrBP6da97LVUVUKebvBpsbN34QSC9UM6GHpNIc8RHRXnntS', '2015-02-18 20:32:18', '2015-02-18 20:38:48', NULL, 2, 4, 11),
(32, 'Ricardo', 'Cartas Figueroa', 'ricardo.cartas@correo.buap.mx', '2225546163', '5127', 1, NULL, '$2y$10$s0lsMUE/XcnLojUgp7n3/.ncigIpiBF9ouYjb47N2uA8NjvispSqK', '2015-02-18 20:32:26', '2015-02-19 15:35:59', NULL, 3, 10, 11),
(33, 'José Enrique', 'Tlachi Rodríguez ', 'kingdomhearts_pp@hotmail.com', '', '5268', 2, NULL, '$2y$10$54IJ6Lb33fJci579zbhZI.6DpnmgFZkAnVhsJcaaG3Hdhj.mzvDp.', '2015-02-18 20:38:08', '2015-02-18 20:38:08', NULL, 2, 4, 11),
(34, 'Silvia', 'Cahue Pozos', 'silvia.cahue@correo.buap.mx', '2223547632', '', 1, NULL, '$2y$10$hGJEoJ/PfNH0NdAk93hLFODYlW4CewNFeFwinoKvnQjkUsyx.rUbe', '2015-02-18 21:03:19', '2015-02-19 15:36:01', NULL, 2, 6, 11),
(35, 'Angélica', 'Chevalier', 'angiechevalier@yahoo.com', '2222125893', '5126', 1, NULL, '$2y$10$i3YOe97SgHMZ.X57r.XZxeHTDATtZOOBHhcJ6pyh5bx7qJIiXgs/C', '2015-02-19 15:41:46', '2015-02-19 16:05:56', NULL, 2, 10, 11),
(36, 'José Antonio', 'Flores Cabrera', 'joseantonio.flores@correo.buap.mx', '2221829491', '5127', 1, NULL, '$2y$10$O6iu2l993OOahJ6mzuwycu78mchCTxH3VFymrIPjzjPEQu2puOEDq', '2015-02-19 15:57:17', '2015-02-19 15:58:20', NULL, 2, 10, 11),
(37, 'Joanna', 'Camacho', 'joannacamachobon@gmail.com', '', '5569', 1, NULL, '$2y$10$xHXfdrDdajYT28mg6sRbnehiZGnorrlla.lniaeE8yWvFS8SU3FoK', '2015-02-19 16:11:55', '2015-02-19 16:13:46', NULL, 2, 10, 11),
(38, 'Sergio', 'Ubaldo Jerónimo', 'subaldo@gmail.com', '2222171185', '5132', 1, NULL, '$2y$10$G7QUG3n9vpQUFIK2XnAJQudfSpSuZpbYzjuUzHLl6PmJ5qPFE3jBW', '2015-02-19 16:12:12', '2015-02-19 16:13:47', NULL, 2, 10, 11),
(39, 'Luis', 'Diego Peralta', 'diegoradio@yahoo.com', '762 25 00', '5129', 1, NULL, '$2y$10$/YfbvN2PesjK.mo7jy2m8OZ2be/pmGg.XDQxEOqp3/Qjkp.Pak38K', '2015-02-19 16:22:30', '2015-02-19 16:35:30', NULL, 2, 10, 11),
(40, 'Laura', 'Montiel', 'nelau4@hotmail.com', '2295500', '5123', 1, NULL, '$2y$10$z9/xXhv918opgolsUOKs4uOkLN/0xEOA327.AppLn8VWrxteVfYOW', '2015-02-19 16:31:59', '2015-02-19 16:35:35', NULL, 3, 10, 11);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users_auth_operations`
--

DROP TABLE IF EXISTS `users_auth_operations`;
CREATE TABLE IF NOT EXISTS `users_auth_operations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `token` varchar(40) NOT NULL,
  `used` tinyint(1) NOT NULL DEFAULT '0',
  `expiration` datetime NOT NULL,
  `type` tinyint(1) NOT NULL COMMENT '1 Activate user\n2 Change password',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_users_auth_operations_users1_idx` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=45 ;

--
-- Volcado de datos para la tabla `users_auth_operations`
--

INSERT INTO `users_auth_operations` (`id`, `token`, `used`, `expiration`, `type`, `created_at`, `updated_at`, `deleted_at`, `user_id`) VALUES
(1, '0RXQDi6ARgXV9z7YCQEXQQsBLuxzFXmIzGHJOn9A', 1, '2014-11-28 02:01:39', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, 1),
(2, 'dY0jCVOkTtYiEERXLoIe2P1mh3Wle6vED3AMKgN9', 1, '2014-11-28 02:01:39', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, 2),
(3, '7V8Z6MdoJzPoxYQxC1vabufbOiOeNxv3bOfJqsq2', 1, '2014-11-28 02:04:13', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, 3),
(4, 'jEaKqmWVJ2R6Q9zkOvToT1yYMndp5JWhYuHzki7G', 1, '2014-11-28 04:31:47', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, 4),
(5, 'jMjicoDLZawn1GYZ0w4TXQsjyTkjKgZKDaViqH0X', 1, '2014-11-28 21:05:26', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, 5),
(6, 'uD2F1Mtwu7eqAXFHaU4B8AoDJSnEuifJrWRKtmHa', 1, '2014-11-28 21:53:30', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, 6),
(7, 'fp6yikHROUviQ1WLaDWbmqRRDcAgkkwrhbzOL96W', 1, '2014-12-06 21:13:02', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, 7),
(8, 'OLMkWgyoAgAd3OJ8BF7u5nMBwywS3nhEANK1nJ38', 1, '2014-12-06 21:13:02', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, 8),
(9, 'C7o4cJMPS8atRg7pXyoSs4cTWwz7vRQ07bve4oaz', 1, '2014-12-06 21:13:02', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, 9),
(10, 'moaxVdQQS6E29s9gGxiKnq9KD0jjEZ8bqMusLs89', 1, '2014-12-06 21:13:02', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, 10),
(11, 'kYDwYmvKyKKaCGOufZOo691JOk7MT5ML7gfJTWU2', 1, '2014-12-06 21:13:02', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, 11),
(12, 'Y6HOPPxSPiN8uRzzEuIiiz0yIBCctb2fMms3uvC4', 1, '2014-12-06 21:13:02', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, 12),
(13, 'dCdgFmqhj8NWlZWzg5nRGauVARPVNxpf0kJ6XZUY', 1, '2014-12-06 21:13:02', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, 13),
(14, 'm9scXaL8wf3LpJh13IBVZtwxfj3UpbEOX6Nsh2PF', 1, '2014-12-06 21:13:02', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, 14),
(15, 'hcQiP7CboUVE1QbTYgjm0aGCa7X3J8QKExGn9AnI', 1, '2014-12-06 21:13:02', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, 15),
(16, 'gV8KsE51XObh9oDII55GS9tS8qzWeX7ooC2a80mN', 1, '2014-12-06 21:13:02', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, 16),
(17, 'SnOkVaspJdkHSciV0aPYacXaplkTCVOa6j8bFQhE', 1, '2014-12-06 21:13:02', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, 17),
(18, 'qQvw9SoKFPRkqqV6cCd9FksBhV1ok1JtaOrTLD4q', 1, '2014-12-06 21:13:02', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, 18),
(19, 'uSDxT1J2TPszVg0WvbHEw64ak7pinNJgpdOtAIAk', 1, '2014-12-06 21:13:02', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, 19),
(20, '0HImIE6A3Njt9i2DgQHIrkflCwoMWzRymWVSA2Fd', 1, '2014-12-06 21:13:02', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, 20),
(21, 'nfsJEOQOnEFx3SqWtsmAIyq3vg736QCf5Cmdu26t', 1, '2014-12-06 21:13:02', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, 21),
(22, 'RIpjVKOoaMfR0kCK4NlMulMVhhetbgh5MqNbBu3P', 1, '2015-02-13 19:55:19', 1, '2015-02-12 19:55:19', '2015-02-12 19:56:05', NULL, 22),
(23, 'XPqyaAhugLQMUM1rkY3MXB2r3oqnI6hUoHHCFbJx', 1, '2015-02-13 20:01:36', 1, '2015-02-12 20:01:36', '2015-02-12 20:07:12', NULL, 23),
(24, 'MMSea66xjZZHQnqKeRb1rls6IgRDohSHfGxoDrpp', 0, '2015-02-13 22:00:18', 1, '2015-02-12 22:00:18', '2015-02-12 22:00:18', NULL, 24),
(25, 'li1fFVRJP72gSO9mjKNcRXSgUGSpqk0sYTLsWv93', 1, '2015-02-14 18:42:32', 1, '2015-02-13 18:42:32', '2015-02-13 20:33:52', NULL, 23),
(26, 'twhdw9Ijf5OhAVnsbsat8ZIhgsSxOKqW0GlAewug', 1, '2015-02-17 15:54:45', 1, '2015-02-16 15:54:45', '2015-02-16 15:55:20', NULL, 25),
(27, 'XXvyhIvHx4HeUMaHhfIziE6WitHEi87iWpGguroX', 1, '2015-02-19 19:06:09', 1, '2015-02-18 19:06:09', '2015-02-18 19:06:24', NULL, 26),
(28, 'UMeQ1mEzidDM9hh24td8tPprA30A8xhVKKqK5egX', 1, '2015-02-19 19:07:07', 1, '2015-02-18 19:07:07', '2015-02-18 19:07:19', NULL, 27),
(29, 'joFt2OkWx27LWEhr2stRgqt3S4NfIxLIwROqtz2w', 1, '2015-02-19 19:50:37', 1, '2015-02-18 19:50:37', '2015-02-18 19:52:54', NULL, 28),
(30, 'vHeC6wPNexOAokK2oUeiOnyrRGmLxByYpV1Qc2nt', 1, '2015-02-19 20:00:00', 1, '2015-02-18 20:00:00', '2015-02-18 20:09:22', NULL, 29),
(31, 'fHN795vH52GYdKhIBlyZOuG9fvqpjTGK7Y4s5mtK', 1, '2015-02-19 20:01:49', 1, '2015-02-18 20:01:49', '2015-02-18 20:08:40', NULL, 30),
(32, 'VBczor3xZSdcjUTCsTBXn6R7pCmXc4gUuSpCFF93', 1, '2015-02-19 20:32:18', 1, '2015-02-18 20:32:18', '2015-02-18 20:33:06', NULL, 31),
(33, 'DP8Q5G5ZA1sjYNwN1STvYZIlDCoYa5l7lhGHFLY6', 1, '2015-02-19 20:32:26', 1, '2015-02-18 20:32:26', '2015-02-18 22:53:59', NULL, 32),
(34, '0u7iwtbMQxHR15UWMoe0aiE8obXssPPHB7nRT3OH', 0, '2015-02-19 20:38:08', 1, '2015-02-18 20:38:08', '2015-02-18 20:38:08', NULL, 33),
(35, 'wMLyWZONMhdC5Ynjw9j3ROv9vXz6v3wh2VxLJboi', 1, '2015-02-19 20:38:35', 1, '2015-02-18 20:38:35', '2015-02-18 20:39:22', NULL, 30),
(36, 'evTcuONpqfymJyH9xJNAxC8IBcTBRLNYk19aVbDH', 1, '2015-02-19 21:03:19', 1, '2015-02-18 21:03:19', '2015-02-18 21:14:30', NULL, 34),
(37, 'hr70iAiaRqeE5hJvtMLpp2Zp2pp30Fbw4rsvNZyr', 1, '2015-02-19 21:15:55', 2, '2015-02-18 21:15:55', '2015-02-18 21:16:53', NULL, 34),
(38, 'cwG32XuiB8o95tZa32nzMLijDBQuwByfCTDB3SmN', 1, '2015-02-20 15:41:46', 1, '2015-02-19 15:41:46', '2015-02-19 16:04:57', NULL, 35),
(39, 'YfLOSFsUpJKuNtWaxdlUSgcfLQH2V3w8p6ybdgOq', 1, '2015-02-20 15:57:17', 1, '2015-02-19 15:57:17', '2015-02-19 15:58:00', NULL, 36),
(40, 'l95bVdtDP2oVRqVQJQEWlyPah4h1Mq3sRTFAwijJ', 1, '2015-02-20 16:11:55', 1, '2015-02-19 16:11:55', '2015-02-19 16:13:25', NULL, 37),
(41, '2ThoDyZCTqouHJJBhNDAyHipuFrBZwObbleyflvG', 1, '2015-02-20 16:12:12', 1, '2015-02-19 16:12:12', '2015-02-19 16:12:36', NULL, 38),
(42, 'PHAs0Vr3wki3ahqOdPWQ1LIgTLYf5UcBw4z3kOa7', 1, '2015-02-20 16:22:30', 1, '2015-02-19 16:22:30', '2015-02-19 16:24:01', NULL, 39),
(43, 'VtblXrr4h0882a48Cc45eekku7uo9rYISEJnHJn7', 1, '2015-02-20 16:31:59', 1, '2015-02-19 16:31:59', '2015-02-19 16:34:42', NULL, 40),
(44, 'JrqNKjNJYnjhkjejb708G4NVyp42vfKHlQHRNRRz', 1, '2015-02-20 19:45:10', 2, '2015-02-19 19:45:10', '2015-02-19 19:45:52', NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users_types`
--

DROP TABLE IF EXISTS `users_types`;
CREATE TABLE IF NOT EXISTS `users_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` text,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `users_types`
--

INSERT INTO `users_types` (`id`, `name`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Cliente', NULL, '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL),
(2, 'Empleado DCI', NULL, '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL),
(3, 'Jefe DCI', NULL, '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL),
(4, 'Administrador', NULL, '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `witnesses`
--

DROP TABLE IF EXISTS `witnesses`;
CREATE TABLE IF NOT EXISTS `witnesses` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `witnesses`
--

INSERT INTO `witnesses` (`id`, `name`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Ejemplar de impresión', NULL, '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL),
(2, 'Carátula de libros, revistas o folletos', NULL, '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL),
(3, 'Fotografías de rótulos colocados', NULL, '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL),
(4, 'Fotografías', NULL, '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL);

--
-- Restricciones para tablas volcadas
--

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
-- Filtros para la tabla `events`
--
ALTER TABLE `events`
  ADD CONSTRAINT `fk_events_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

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
