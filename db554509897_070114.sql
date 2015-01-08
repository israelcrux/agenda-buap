-- phpMyAdmin SQL Dump
-- version 4.1.14.8
-- http://www.phpmyadmin.net
--
-- Servidor: db554509897.db.1and1.com
-- Tiempo de generación: 07-01-2015 a las 20:31:24
-- Versión del servidor: 5.1.73-log
-- Versión de PHP: 5.4.35-0+deb7u2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `db554509897`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `academic_administrative_units`
--

CREATE TABLE IF NOT EXISTS `academic_administrative_units` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
-- Estructura de tabla para la tabla `audio`
--

CREATE TABLE IF NOT EXISTS `audio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `length` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `digital`
--

CREATE TABLE IF NOT EXISTS `digital` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `size` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `events`
--

CREATE TABLE IF NOT EXISTS `events` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_dci` varchar(6) NOT NULL,
  `name` varchar(100) NOT NULL,
  `start_day` date NOT NULL,
  `end_day` date NOT NULL,
  `place` varchar(50) NOT NULL,
  `time` time NOT NULL,
  `has_cost` tinyint(1) NOT NULL,
  `directed_to` enum('Público en general','Comunidad BUAP','Profesores/Investigadores','Estudiantes') NOT NULL,
  `link` varchar(100) DEFAULT NULL,
  `description` text,
  `dci_status` enum('No Aprobado','Pendiente','En Proceso','Aprobado') NOT NULL DEFAULT 'Pendiente' COMMENT '0 No Aprobado\n1 Pendiente\n2 En Proceso\n3 Aprobado',
  `user_status` enum('Activo','Inactivo') NOT NULL DEFAULT 'Activo',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_events_users1_idx` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=29 ;

--
-- Volcado de datos para la tabla `events`
--

INSERT INTO `events` (`id`, `id_dci`, `name`, `start_day`, `end_day`, `place`, `time`, `has_cost`, `directed_to`, `link`, `description`, `dci_status`, `user_status`, `created_at`, `updated_at`, `user_id`) VALUES
(1, '141127', 'Encendido del árbol navideño 2015', '2014-12-03', '2014-12-03', 'CCU', '18:00:00', 0, 'Público en general', '', 'Habra rifas y sorpresas', 'Pendiente', 'Inactivo', '2014-11-27 04:39:44', '2014-11-28 01:51:25', 7),
(2, '141127', 'Seminario "Las Reformas Estructurales en México y la ampliación de los derechos humanos en México: u', '2014-12-08', '2014-12-08', 'ICGDE', '08:00:00', 0, 'Público en general', 'http://www.icgde.buap.mx/', '', 'Pendiente', 'Activo', '2014-11-27 18:05:54', '2014-11-27 18:05:54', 8),
(3, '141127', 'Lanzamiento de campaña el valor eres tú', '2014-12-01', '2015-02-27', 'DCI', '09:00:00', 0, 'Comunidad BUAP', '', 'Campaña interna de comunicación', 'Pendiente', 'Inactivo', '2014-11-27 18:16:17', '2014-11-28 01:18:01', 3),
(4, '141127', 'Primer Taller Internacional "Tendencias en la Enseñanza de las Matemáticas Basada en la Investigació', '2014-11-27', '2014-11-30', 'Edificio: 1DGIE1 Av. San Claudio  y 22 Sur, Ciudad', '17:00:00', 0, 'Comunidad BUAP', 'http://www.fcfm.buap.mx/TEMBI/index.php', '\r\n\r\nEs el Primer Taller Internacional "Tendencias en la enseñanza de las matemáticas basada en investigación (TEMBI)", el cual es el espacio académico ideal para conocer, discutir y reflexionar sobre las tendencias más actuales en la enseñanza de las matemáticas basada en la investigación. ', 'Pendiente', 'Activo', '2014-11-27 19:40:35', '2014-11-27 19:40:35', 10),
(5, '141128', 'Encendido del árbol navideño', '2014-12-02', '2014-12-02', 'Explanada del Auditorio CCU', '17:00:00', 0, 'Público en general', '', '', 'Pendiente', 'Inactivo', '2014-11-28 01:29:22', '2014-11-28 01:30:03', 3),
(6, '141128', 'Encendido del Árbol Navideño', '2014-12-02', '2014-12-02', 'Explanada Auditorio CCU', '17:00:00', 0, 'Público en general', '', '', 'Pendiente', 'Inactivo', '2014-11-28 01:31:26', '2014-11-28 01:36:51', 3),
(7, '141128', 'Encendido del Árbol Navideño', '2014-12-02', '2014-12-02', 'Explanada del CCU', '18:00:00', 0, 'Público en general', '', '', 'Pendiente', 'Activo', '2014-11-28 02:00:34', '2014-11-28 02:00:34', 3),
(8, '141202', 'Convocatoria al proceso de Selección para ingresar al Doctorado en Ciencias de Gobierno y Política', '2014-12-02', '2015-02-28', 'ICGDE', '17:00:00', 0, 'Público en general', 'http://www.icgde.buap.mx/', '', 'Pendiente', 'Activo', '2014-12-02 20:27:40', '2014-12-02 20:27:40', 8),
(9, '141202', 'Convocatoria para el Proceso de Selección para ingresar al Doctorado en Ciencias de Gobierno y Polít', '2014-12-02', '2015-02-28', 'ICGDE', '17:00:00', 0, 'Público en general', 'http://www.icgde.buap.mx/', '', 'Pendiente', 'Inactivo', '2014-12-02 20:33:47', '2014-12-02 20:49:07', 8),
(10, '141202', 'Ballet folklórico', '2014-12-07', '2014-12-07', 'Auditorio CCU', '12:00:00', 0, 'Público en general', '', '', 'Pendiente', 'Inactivo', '2014-12-02 20:42:13', '2014-12-02 20:53:55', 3),
(11, '141202', 'Ballet folklórico BUAP', '2014-12-07', '2014-12-07', 'Auditorio CCU', '12:00:00', 0, 'Público en general', '', '', 'Pendiente', 'Activo', '2014-12-02 20:43:17', '2014-12-02 20:43:17', 3),
(12, '141202', 'Rueda de presnsa', '2014-12-03', '2014-12-03', 'Casa del mendrugo', '09:30:00', 1, 'Público en general', '', '', 'Pendiente', 'Inactivo', '2014-12-02 21:07:43', '2014-12-02 21:08:07', 3),
(13, '141202', 'rueda de prensa', '2014-12-03', '2014-12-03', 'Casa del mendrugo', '21:00:00', 0, 'Público en general', '', '', 'Pendiente', 'Inactivo', '2014-12-02 21:11:32', '2014-12-02 21:11:42', 3),
(14, '141202', 'Austin Hewitt', '2016-01-01', '2016-01-02', 'Ut sint at est dicta reiciendis cum', '08:30:00', 0, 'Profesores/Investigadores', 'http://www.qevyxujyxehiho.me', 'Sunt, ipsum quisquam sed modi nostrum omnis dolor voluptatem non quasi et.', 'Pendiente', 'Inactivo', '2014-12-02 21:41:03', '2014-12-02 21:49:31', 1),
(15, '141202', 'Austin Hewitt', '2016-01-01', '2016-01-02', 'Ut sint at est dicta reiciendis cum', '08:30:00', 0, 'Profesores/Investigadores', 'http://www.qevyxujyxehiho.me', 'Sunt, ipsum quisquam sed modi nostrum omnis dolor voluptatem non quasi et.', 'Pendiente', 'Inactivo', '2014-12-02 21:43:13', '2014-12-02 21:49:33', 1),
(16, '141202', 'Austin Hewitt', '2016-01-01', '2016-01-02', 'Ut sint at est dicta reiciendis cum', '08:30:00', 0, 'Profesores/Investigadores', 'http://www.qevyxujyxehiho.me', 'Sunt, ipsum quisquam sed modi nostrum omnis dolor voluptatem non quasi et.', 'Pendiente', 'Inactivo', '2014-12-02 21:44:07', '2014-12-02 21:49:36', 1),
(17, '141202', 'Austin Hewitt', '2016-01-01', '2016-01-02', 'Ut sint at est dicta reiciendis cum', '08:30:00', 0, 'Profesores/Investigadores', 'http://www.qevyxujyxehiho.me', 'Sunt, ipsum quisquam sed modi nostrum omnis dolor voluptatem non quasi et.', 'Pendiente', 'Inactivo', '2014-12-02 21:46:15', '2014-12-02 21:49:40', 1),
(18, '141202', 'Austin Hewitt', '2016-01-01', '2016-01-02', 'Ut sint at est dicta reiciendis cum', '08:30:00', 0, 'Profesores/Investigadores', 'http://www.qevyxujyxehiho.me', 'Sunt, ipsum quisquam sed modi nostrum omnis dolor voluptatem non quasi et.', 'Pendiente', 'Inactivo', '2014-12-02 21:47:05', '2014-12-02 21:49:43', 1),
(19, '141202', 'Nigel Kinney', '2014-12-10', '2014-12-31', 'Eos minima neque quas non sed voluptatem aut labor', '15:56:00', 1, 'Estudiantes', 'http://www.pazygirofymalis.us', 'Praesentium anim nemo deserunt voluptas et sed autem molestiae velit alias in quam do sit, ut laborum dicta ad atque.', 'Pendiente', 'Inactivo', '2014-12-02 21:52:44', '2014-12-02 22:00:53', 2),
(20, '141204', 'Presentación de instrumentos ORF', '2014-12-05', '2014-12-05', 'Circulo Infantil /sección Lactantes y Maternales', '11:00:00', 1, 'Estudiantes', '', 'El evento es interno, una presentación solo para los alumnos y maestras de la sección de LyM solicitamos toma de fotografias y video.', 'Pendiente', 'Inactivo', '2014-12-04 13:52:28', '2014-12-04 13:54:35', 15),
(21, '141204', 'PIPOPETS /titeres', '2014-12-08', '2014-12-08', 'Patio techado preescolar', '09:00:00', 0, 'Estudiantes', '', 'El evento es interno, dirigido solo para los niños del CI, solicitamos toma de fotografías y clip de vídeo.', 'Pendiente', 'Activo', '2014-12-04 13:54:02', '2014-12-04 13:54:02', 15),
(22, '141204', 'Presentación de Instrumentos ORF', '2014-12-05', '2014-12-05', 'Patios (2 presentaciones)', '11:00:00', 0, 'Estudiantes', '', 'La presentación es interna, solo dirigida a niños y maestras del CI, solicitamos toma de fotografías y clip de video', 'Pendiente', 'Activo', '2014-12-04 13:56:21', '2014-12-04 13:56:21', 15),
(23, '141204', 'Festival Navideño', '2014-12-11', '2014-12-12', 'Auditorio de la Unidad de Seminarios', '09:00:00', 0, 'Estudiantes', '', 'Festival Navideño invita a dirigido a comunidad del CI, padres y familiares, dos presentaciones, día 11 preescolar, día 12 LyM, solicitamos toma de fotografías y video\r\n*el acceso es solo con invitación', 'Pendiente', 'Activo', '2014-12-04 13:59:52', '2014-12-04 13:59:52', 15),
(24, '141204', 'Cuento de Navidad de la compañia de danza contemporánea de la BUAP', '2014-12-15', '2014-12-15', 'Comedor CI', '11:00:00', 0, 'Estudiantes', '', 'Presentación interna para alumnos del CI, solicitamos toma de fotografías y  clip de video', 'Pendiente', 'Activo', '2014-12-04 14:02:22', '2014-12-04 14:02:22', 15),
(25, '141204', 'Cuento Navideño, teatro de sombras', '2014-12-16', '2014-12-16', 'Comedor CI', '11:30:00', 0, 'Estudiantes', '', 'Presentación interna para alumnos del CI, solicitamos toma de fotografías y clip de video', 'Pendiente', 'Activo', '2014-12-04 14:03:46', '2014-12-04 14:03:46', 15),
(26, '141204', 'Teatro chino', '2014-12-11', '2014-12-11', 'Patio techado preescolar', '11:00:00', 0, 'Estudiantes', '', 'Evento interno del CI, solicitamos toma de fotografías y clip de vídeo ', 'Pendiente', 'Activo', '2014-12-04 21:10:11', '2014-12-04 21:10:11', 15),
(27, '141204', 'Cursos Estacionales de Idiomas primavera 2015', '2015-01-05', '2015-01-16', 'Dirección General de Innovación Educativa', '17:00:00', 1, 'Público en general', 'http://www.dgie.buap.mx/index.php/cursos-estacionales', 'Los Cursos Estacionales están dirigidos a la Comunidad Universitaria y Público en General.\r\nDentro de los grupos, sesión por sesión se desarrollan las competencias y habilidades tan necesarias hoy día dentro de las distintas facetas de la vida (Académicas,  Laborales o Lúdicas) de manera dinámica e interactiva.\r\n\r\nEs a través  del  constante proceso formativo que nuestros usuarios logran exitosamente cumplir sus propósitos de manera segura, completa y acreditada  dentro de una dependencia universitaria con apertura y flexibilidad,  que además  cuenta con los contactos necesarios con instituciones nacionales e internacionales quienes avalan el nivel de los conocimientos y aptitudes de quienes se han formado con nosotros.', 'Pendiente', 'Activo', '2014-12-04 21:34:49', '2014-12-04 21:34:49', 16),
(28, '141205', 'AN-imenasai', '2014-12-13', '2014-12-14', 'CCU', '13:00:00', 0, 'Estudiantes', 'http://www.animenasai.com', 'Pues vengan no? RAWR', 'Pendiente', 'Activo', '2014-12-05 21:02:21', '2014-12-05 21:02:21', 18);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `event_resource_source`
--

CREATE TABLE IF NOT EXISTS `event_resource_source` (
  `event_id` int(11) NOT NULL,
  `resource_source_id` int(11) NOT NULL,
  PRIMARY KEY (`event_id`,`resource_source_id`),
  KEY `fk_events_has_resource_source_resource_source1_idx` (`resource_source_id`),
  KEY `fk_events_has_resource_source_events1_idx` (`event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `event_resource_source`
--

INSERT INTO `event_resource_source` (`event_id`, `resource_source_id`) VALUES
(28, 1),
(18, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `event_service`
--

CREATE TABLE IF NOT EXISTS `event_service` (
  `event_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `start_service` date NOT NULL,
  `end_service` date NOT NULL,
  `status` enum('No Aprobado','Pendiente','En Proceso','Aprobado') NOT NULL DEFAULT 'Pendiente',
  PRIMARY KEY (`event_id`,`service_id`),
  KEY `fk_events_has_services_services1_idx` (`service_id`),
  KEY `fk_events_has_services_events1_idx` (`event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `event_service`
--

INSERT INTO `event_service` (`event_id`, `service_id`, `start_service`, `end_service`, `status`) VALUES
(2, 1, '2014-12-08', '2014-12-08', 'Pendiente'),
(2, 3, '2014-12-08', '2014-12-08', 'Pendiente'),
(2, 4, '2014-12-08', '2014-12-08', 'Pendiente'),
(2, 5, '2014-12-08', '2014-12-08', 'Pendiente'),
(8, 1, '2014-12-02', '2015-02-28', 'Pendiente'),
(8, 3, '2014-12-02', '2015-02-28', 'Pendiente'),
(8, 4, '2014-12-02', '2015-02-28', 'Pendiente'),
(8, 5, '2014-12-02', '2015-02-28', 'Pendiente'),
(9, 1, '2014-12-02', '2015-02-28', 'Pendiente'),
(9, 3, '2014-12-02', '2015-02-28', 'Pendiente'),
(9, 4, '2014-12-02', '2015-02-28', 'Pendiente'),
(9, 5, '2014-12-02', '2015-02-28', 'Pendiente'),
(10, 1, '2014-12-07', '2014-12-07', 'Pendiente'),
(11, 1, '2014-12-07', '2014-12-07', 'Pendiente'),
(13, 1, '2014-12-03', '2014-12-03', 'Pendiente'),
(14, 1, '2016-01-01', '2016-01-02', 'Pendiente'),
(14, 2, '2016-01-01', '2016-01-02', 'Pendiente'),
(14, 3, '2016-01-01', '2016-01-02', 'Pendiente'),
(14, 4, '2016-01-01', '2016-01-02', 'Pendiente'),
(14, 5, '2016-01-01', '2016-01-02', 'Pendiente'),
(15, 1, '2016-01-01', '2016-01-02', 'Pendiente'),
(15, 2, '2016-01-01', '2016-01-02', 'Pendiente'),
(15, 3, '2016-01-01', '2016-01-02', 'Pendiente'),
(15, 4, '2016-01-01', '2016-01-02', 'Pendiente'),
(15, 5, '2016-01-01', '2016-01-02', 'Pendiente'),
(16, 1, '2016-01-01', '2016-01-02', 'Pendiente'),
(16, 2, '2016-01-01', '2016-01-02', 'Pendiente'),
(16, 3, '2016-01-01', '2016-01-02', 'Pendiente'),
(16, 4, '2016-01-01', '2016-01-02', 'Pendiente'),
(16, 5, '2016-01-01', '2016-01-02', 'Pendiente'),
(17, 1, '2016-01-01', '2016-01-02', 'Pendiente'),
(17, 2, '2016-01-01', '2016-01-02', 'Pendiente'),
(17, 3, '2016-01-01', '2016-01-02', 'Pendiente'),
(17, 4, '2016-01-01', '2016-01-02', 'Pendiente'),
(17, 5, '2016-01-01', '2016-01-02', 'Pendiente'),
(18, 1, '2016-01-01', '2016-01-02', 'Pendiente'),
(18, 2, '2016-01-01', '2016-01-02', 'Pendiente'),
(18, 3, '2016-01-01', '2016-01-02', 'Pendiente'),
(18, 4, '2016-01-01', '2016-01-02', 'Pendiente'),
(18, 5, '2016-01-01', '2016-01-02', 'Pendiente'),
(19, 1, '2014-12-10', '2014-12-31', 'Pendiente'),
(19, 2, '2014-12-10', '2014-12-31', 'Pendiente'),
(19, 3, '2014-12-10', '2014-12-31', 'Pendiente'),
(19, 5, '2014-12-10', '2014-12-31', 'Pendiente'),
(27, 1, '2015-01-05', '2015-01-16', 'Pendiente'),
(27, 3, '2015-01-05', '2015-01-16', 'Pendiente'),
(27, 4, '2015-01-05', '2015-01-16', 'Pendiente'),
(27, 5, '2015-01-05', '2015-01-16', 'Pendiente'),
(28, 1, '2014-12-13', '2014-12-14', 'Pendiente'),
(28, 2, '2014-12-13', '2014-12-14', 'Pendiente'),
(28, 5, '2014-12-13', '2014-12-14', 'Pendiente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `event_witness`
--

CREATE TABLE IF NOT EXISTS `event_witness` (
  `event_id` int(11) NOT NULL,
  `witness_id` int(11) NOT NULL,
  `file` varchar(100) NOT NULL DEFAULT 'NOT FILE',
  PRIMARY KEY (`event_id`,`witness_id`),
  KEY `fk_events_has_witnesses_witnesses1_idx` (`witness_id`),
  KEY `fk_events_has_witnesses_events1_idx` (`event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `event_witness`
--

INSERT INTO `event_witness` (`event_id`, `witness_id`, `file`) VALUES
(18, 1, 'NOT FILE'),
(18, 4, 'NOT FILE'),
(19, 3, 'NOT FILE'),
(27, 1, 'NOT FILE'),
(27, 4, 'NOT FILE'),
(28, 4, 'NOT FILE');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `printed`
--

CREATE TABLE IF NOT EXISTS `printed` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `material` varchar(30) NOT NULL,
  `size` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `requests`
--

CREATE TABLE IF NOT EXISTS `requests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `request_number` int(11) NOT NULL,
  `post_number` int(11) NOT NULL,
  `date` date NOT NULL,
  `justification` text,
  `request` varchar(100) NOT NULL,
  `academic_administrative_unit_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_requests_academic_administrative_units1_idx` (`academic_administrative_unit_id`),
  KEY `fk_requests_events1_idx` (`event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `resources_sources`
--

CREATE TABLE IF NOT EXISTS `resources_sources` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `resources_sources`
--

INSERT INTO `resources_sources` (`id`, `name`, `description`) VALUES
(1, 'Tesoreria', NULL),
(2, 'Fondo fijo', NULL),
(3, 'Apoyos especiales', NULL),
(4, 'Otros', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `services`
--

CREATE TABLE IF NOT EXISTS `services` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` text,
  `observations` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Volcado de datos para la tabla `services`
--

INSERT INTO `services` (`id`, `name`, `description`, `observations`) VALUES
(1, 'Diseño gráfico', 'Diseño gráfico', NULL),
(2, 'Asesoría en redacción', 'Asesoría en redacción', NULL),
(3, 'Radio BUAP', 'Radio BUAP', NULL),
(4, 'Prensa externa', 'Prensa externa', NULL),
(5, 'Cobertura interna', 'Cobertura interna', NULL),
(6, 'Producción de material impreso*', 'Producción de material impreso*', NULL),
(7, 'Producción de material audiovisual*', 'Producción de material audiovisual*', NULL),
(8, 'Sitio Web', 'Sitio Web', NULL),
(9, 'Perifoneo*', 'Perifoneo*', NULL),
(10, 'Redes sociales', 'Redes sociales', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `support_materials`
--

CREATE TABLE IF NOT EXISTS `support_materials` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file` varchar(100) NOT NULL,
  `event_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_support_materials_events1_idx` (`event_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Volcado de datos para la tabla `support_materials`
--

INSERT INTO `support_materials` (`id`, `file`, `event_id`) VALUES
(1, 'support_materials/T02qysx5Y2fWGjNmIDfU.eps', 2),
(2, 'support_materials/AJGvCi6JyyEd54HEE17J.jpg', 8),
(3, 'support_materials/EmhYVLUikTuNNOA2M1nh.jpg', 9),
(4, 'support_materials/grlt2UF3FFAI7Q09GfKG.jpg', 10),
(5, 'support_materials/UWZ6Q6jq6HkNArJk6YMf.jpg', 11),
(6, 'support_materials/IQeHpRGgAfoFPkLTzpTT.png', 28);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tv`
--

CREATE TABLE IF NOT EXISTS `tv` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `length` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(60) NOT NULL,
  `phone` varchar(10) DEFAULT NULL,
  `extension_phone` varchar(5) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '2' COMMENT '0 Inactive\n1 Active\n2 Activation required',
  `remember_token` varchar(100) DEFAULT NULL,
  `user_type_id` int(11) NOT NULL DEFAULT '1',
  `academic_administrative_unit_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_users_user_type1_idx` (`user_type_id`),
  KEY `fk_users_academic_administrative_unit1_idx` (`academic_administrative_unit_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=20 ;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `password`, `phone`, `extension_phone`, `status`, `remember_token`, `user_type_id`, `academic_administrative_unit_id`) VALUES
(1, 'Javier ', 'Aguila', 'sjaca10@gmail.com', '$2a$10$hmOFJoVrG8XJCmLk34zIKe.pz4ndUNhfAlF.Jx5.P6R1L3jsyvRrG', '2226272898', NULL, 1, NULL, 1, 1),
(2, 'Jesús', 'Cruz', 'jesuslink00@gmail.com', '$2y$10$GFcVq7u..KHQkTzgM9x2qOIUFxX5S9eP/J5f27dcWFZCbaZUhanPO', NULL, NULL, 1, NULL, 1, 1),
(3, 'Amparo', 'Merino Reyes', 'amparomx@gmail.com', '$2y$10$TaOZ3yl33Vluq.3X5tW1oODQpeD1W8YY0EM8p7qfSv3O/Gq4JmvGO', '2224807645', '5266', 1, NULL, 1, 4),
(5, 'Israel', 'Cruz', 'israel@aerostato.mx', '$2y$10$8NQhAVq.IyNyACrhbS0/5uUPuJOIWDgqBj26LAHr4m6KmNVgvsjX.', '2221602123', '', 2, NULL, 1, 2),
(6, 'Chris', 'Guarneros', 'chrisgsdiaz@gmail.com', '$2y$10$f7LNPYcqofhutmHEtvNgu.VBxw0/MXZiUJb3p/u5sNmpyVgGuN0ky', '321654', '', 1, NULL, 1, 3),
(7, 'Amparo', 'Merino Reyes', 'amparomerinoreyes@gmail.com', '$2y$10$0gKCj8wBHCJG1lIJCGzvyOM4d/53ie0FbMTCR1Ug0hIZfoSiEM37.', '2224807645', '2662', 1, NULL, 1, 11),
(8, 'Carla', 'Ríos Calleja', 'difusion.icgde@correo.buap.mx', '$2y$10$/iOHOdpU2Ng2MSvIf6eBh.PdhKt7Ndu7w9gOJSKaLBJgw5rO6I80i', '2225774214', '3457', 1, NULL, 1, 76),
(9, 'Ana ', 'Urías ', 'ana.urias@correo.buap.mx', '$2y$10$/War0ACGr/Xj1pnGTeN6Xu.5PKgf2nKvleNkui9pUJKq2FqhfqYXq', '2295500', '5266', 1, NULL, 1, 11),
(10, 'Enrique', 'Barradas', 'barradas@fcfm.buap.mx', '$2y$10$1DUreIiK92X11woVYRs91OuuJhc/DbNDaFkl40tgylHlvJfSzYe2C', '2345044', '22955', 1, NULL, 1, 60),
(11, 'Heriberto', 'Hernández Moreno', 'cherokhee@gmail.com', '$2y$10$qT7Kq77wMttw2uBnJ4p.jeBtuOXpe2N5YsH5do2rmrp9eQdiOOfdm', '', '22955', 1, NULL, 1, 17),
(12, 'Alfredo ', 'Arceo', 'aarceo@ccinf.ucm.es', '$2y$10$06DEX1roqVK2IDDF5K2ENeVchMaUCHC71FFdK/jbaWZuPLh5ro0CS', '', '', 1, NULL, 1, 11),
(13, 'Carlos', 'de Castilla Jiménez', 'carlos.decastilla@correo.buap.mx', '$2y$10$YCyxGBBgMPhuynZoybN/Qu0TfpDVW5BXdGyxyGg5dxcYb7NXbhlpa', '2224458190', '22955', 1, NULL, 1, 65),
(14, 'Ana Lidia', 'Ramírez Herrera', 'analidia.ramirez@correo.buap.mx', '$2y$10$7hiuKgZmePiSqRQBtgBH8uYL2CukhdP1fBsEqvBpry9SS81FSU8M2', '', '5286', 1, NULL, 1, 11),
(15, 'Isabel', 'Larenas', 'circulo.infantil@correo.buap.mx', '$2y$10$MNPHxm0A0f3jarMvy.5H2u90HjH9BMtzP0rue6StA5vBGa2NX4C6a', '2295500', '3604', 1, NULL, 1, 16),
(16, 'Berenize', 'Conde Morales', 'berenize.conde@correo.buap.mx', '$2y$10$DSL24k82C9Zdt41SGRE2Fe.rnX1SPUJvcHUPoY.cUGb7wRDyHEOBu', '2221066071', '22955', 1, NULL, 1, 24),
(17, 'Nohemi', 'Melgoza', 'nohemi.melgoza@correo.buap.mx', '$2y$10$A9OFo6cImEZGi7DWgTLQXO8s788I4vyUpkJjBRb1P1IdTnMiFzhCy', '2223247870', '22955', 1, NULL, 1, 61),
(18, 'An', 'Aimee', 'ai.aimeee@gmail.com', '$2y$10$YQ5q2WN.gS2baQkM4.Drre5cTYZHP5zHsVnQngLb4S3eYZmFVdqbq', '8886817', '123', 1, NULL, 1, 2),
(19, 'Victor ', 'Escobar Mejia', 'victorem1969@hotmail.com', '$2y$10$VoN6RNYzSVDmkZqIfJUW9ePQdCGtU7.VvMb.rOpAKRDeoFngP.n3O', '2225673476', '22955', 1, NULL, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users_auth_operations`
--

CREATE TABLE IF NOT EXISTS `users_auth_operations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(40) NOT NULL,
  `expiration` datetime NOT NULL,
  `type` tinyint(1) NOT NULL COMMENT '1 Activate user\n2 Change password',
  `used` tinyint(1) NOT NULL COMMENT '0 Not used\n1 Used',
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_users_auth_operations_users1_idx` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Volcado de datos para la tabla `users_auth_operations`
--

INSERT INTO `users_auth_operations` (`id`, `token`, `expiration`, `type`, `used`, `user_id`) VALUES
(2, 'dY0jCVOkTtYiEERXLoIe2P1mh3Wle6vED3AMKgN9', '2014-11-28 02:01:39', 1, 0, 5),
(3, '7V8Z6MdoJzPoxYQxC1vabufbOiOeNxv3bOfJqsq2', '2014-11-28 02:04:13', 1, 1, 6),
(4, 'jEaKqmWVJ2R6Q9zkOvToT1yYMndp5JWhYuHzki7G', '2014-11-28 04:31:47', 1, 1, 7),
(5, 'jMjicoDLZawn1GYZ0w4TXQsjyTkjKgZKDaViqH0X', '2014-11-28 21:05:26', 1, 1, 11),
(6, 'uD2F1Mtwu7eqAXFHaU4B8AoDJSnEuifJrWRKtmHa', '2014-11-28 21:53:30', 1, 0, 12),
(7, 'RetVBH8J9mzfb38IDy43hyL34m1QpNqomopqlTR9', '2014-12-06 20:52:29', 1, 1, 18),
(8, 'fp6yikHROUviQ1WLaDWbmqRRDcAgkkwrhbzOL96W', '2014-12-06 21:13:02', 1, 1, 19);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users_types`
--

CREATE TABLE IF NOT EXISTS `users_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `users_types`
--

INSERT INTO `users_types` (`id`, `name`, `description`) VALUES
(1, 'Cliente', 'Este usuario es de tipo cliente'),
(2, 'Proveedor', 'Este usuario es de tipo proveedor'),
(3, 'DCI', 'Este usuario es de tipo DCI');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `witnesses`
--

CREATE TABLE IF NOT EXISTS `witnesses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `witnesses`
--

INSERT INTO `witnesses` (`id`, `name`, `description`) VALUES
(1, 'Ejemplar de impresión', NULL),
(2, 'Carátula de libros, revistas o folletos', NULL),
(3, 'Fotografías de rótulos colocados', NULL),
(4, 'Fotografías', NULL);

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
-- Filtros para la tabla `support_materials`
--
ALTER TABLE `support_materials`
  ADD CONSTRAINT `fk_support_materials_events1` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_users_academic_administrative_unit1` FOREIGN KEY (`academic_administrative_unit_id`) REFERENCES `academic_administrative_units` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_users_user_type1` FOREIGN KEY (`user_type_id`) REFERENCES `users_types` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `users_auth_operations`
--
ALTER TABLE `users_auth_operations`
  ADD CONSTRAINT `fk_users_auth_operations_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
