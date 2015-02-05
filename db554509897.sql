-- phpMyAdmin SQL Dump
-- version 4.1.14.8
-- http://www.phpmyadmin.net
--
-- Servidor: db554509897.db.1and1.com
-- Tiempo de generación: 05-02-2015 a las 08:49:22
-- Versión del servidor: 5.1.73-log
-- Versión de PHP: 5.4.36-0+deb7u3

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
-- Estructura de tabla para la tabla `departments`
--

CREATE TABLE IF NOT EXISTS `departments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `departments`
--

INSERT INTO `departments` (`id`, `name`, `description`) VALUES
(1, 'Diseño Digital', NULL),
(2, 'Diseño Gráfico', NULL),
(3, 'Radio BUAP', NULL),
(4, 'TV BUAP', NULL);

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
  `directed_to` enum('Público en general','Comunidad BUAP','Profesores','Estudiantes') NOT NULL,
  `link` varchar(100) DEFAULT NULL,
  `description` text,
  `dci_status` enum('Pendiente','En Proceso','Atendido','Completo') NOT NULL DEFAULT 'Pendiente',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_events_users1_idx` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=34 ;

--
-- Volcado de datos para la tabla `events`
--

INSERT INTO `events` (`id`, `id_dci`, `name`, `start_day`, `end_day`, `place`, `time`, `has_cost`, `directed_to`, `link`, `description`, `dci_status`, `created_at`, `updated_at`, `deleted_at`, `user_id`) VALUES
(1, '141127', 'Encendido del árbol navideño 2015', '2014-12-03', '2014-12-03', 'CCU', '18:00:00', 0, 'Público en general', '', 'Habra rifas y sorpresas', 'Pendiente', '2014-11-27 04:39:44', '2014-11-28 01:51:25', NULL, 7),
(2, '141127', 'Seminario "Las Reformas Estructurales en México y la ampliación de los derechos humanos en México: u', '2014-12-08', '2014-12-08', 'ICGDE', '08:00:00', 0, 'Público en general', 'http://www.icgde.buap.mx/', '', 'Pendiente', '2014-11-27 18:05:54', '2014-11-27 18:05:54', NULL, 8),
(3, '141127', 'Lanzamiento de campaña el valor eres tú', '2014-12-01', '2015-02-27', 'DCI', '17:00:00', 0, 'Comunidad BUAP', '', 'Campaña interna de comunicación', 'Pendiente', '2014-11-27 18:16:17', '2015-01-23 15:28:19', NULL, 3),
(4, '141127', 'Primer Taller Internacional "Tendencias en la Enseñanza de las Matemáticas Basada en la Investigació', '2014-11-27', '2014-11-30', 'Edificio: 1DGIE1 Av. San Claudio  y 22 Sur, Ciudad', '17:00:00', 0, 'Comunidad BUAP', 'http://www.fcfm.buap.mx/TEMBI/index.php', '\r\n\r\nEs el Primer Taller Internacional "Tendencias en la enseñanza de las matemáticas basada en investigación (TEMBI)", el cual es el espacio académico ideal para conocer, discutir y reflexionar sobre las tendencias más actuales en la enseñanza de las matemáticas basada en la investigación. ', 'Pendiente', '2014-11-27 19:40:35', '2014-11-27 19:40:35', NULL, 10),
(5, '141128', 'Encendido del árbol navideño', '2014-12-02', '2014-12-02', 'Explanada del Auditorio CCU', '17:00:00', 0, 'Público en general', '', '', 'Pendiente', '2014-11-28 01:29:22', '2014-11-28 01:30:03', NULL, 3),
(6, '141128', 'Encendido del Árbol Navideño', '2014-12-02', '2014-12-02', 'Explanada Auditorio CCU', '17:00:00', 0, 'Público en general', '', '', 'Pendiente', '2014-11-28 01:31:26', '2014-11-28 01:36:51', NULL, 3),
(7, '141128', 'Encendido del Árbol Navideño', '2014-12-02', '2014-12-02', 'Explanada del CCU', '18:00:00', 0, 'Público en general', '', '', 'Pendiente', '2014-11-28 02:00:34', '2014-11-28 02:00:34', NULL, 3),
(8, '141202', 'Convocatoria al proceso de Selección para ingresar al Doctorado en Ciencias de Gobierno y Política', '2014-12-02', '2015-02-28', 'ICGDE', '17:00:00', 0, 'Público en general', 'http://www.icgde.buap.mx/', '', 'Pendiente', '2014-12-02 20:27:40', '2014-12-02 20:27:40', NULL, 8),
(9, '141202', 'Convocatoria para el Proceso de Selección para ingresar al Doctorado en Ciencias de Gobierno y Polít', '2014-12-02', '2015-02-28', 'ICGDE', '17:00:00', 0, 'Público en general', 'http://www.icgde.buap.mx/', '', 'Pendiente', '2014-12-02 20:33:47', '2014-12-02 20:49:07', NULL, 8),
(10, '141202', 'Ballet folklórico', '2014-12-07', '2014-12-07', 'Auditorio CCU', '12:00:00', 0, 'Público en general', '', '', 'Pendiente', '2014-12-02 20:42:13', '2014-12-02 20:53:55', NULL, 3),
(11, '141202', 'Ballet folklórico BUAP', '2014-12-07', '2014-12-07', 'Auditorio CCU', '12:00:00', 0, 'Público en general', '', '', 'Pendiente', '2014-12-02 20:43:17', '2014-12-02 20:43:17', NULL, 3),
(12, '141202', 'Rueda de presnsa', '2014-12-03', '2014-12-03', 'Casa del mendrugo', '09:30:00', 1, 'Público en general', '', '', 'Pendiente', '2014-12-02 21:07:43', '2014-12-02 21:08:07', NULL, 3),
(13, '141202', 'rueda de prensa', '2014-12-03', '2014-12-03', 'Casa del mendrugo', '21:00:00', 0, 'Público en general', '', '', 'Pendiente', '2014-12-02 21:11:32', '2014-12-02 21:11:42', NULL, 3),
(14, '141202', 'Austin Hewitt', '2016-01-01', '2016-01-02', 'Ut sint at est dicta reiciendis cum', '08:30:00', 0, '', 'http://www.qevyxujyxehiho.me', 'Sunt, ipsum quisquam sed modi nostrum omnis dolor voluptatem non quasi et.', 'Pendiente', '2014-12-02 21:41:03', '2014-12-02 21:49:31', NULL, 1),
(19, '141202', 'Nigel Kinney', '2014-12-10', '2014-12-31', 'Eos minima neque quas non sed voluptatem aut labor', '15:56:00', 1, 'Estudiantes', 'http://www.pazygirofymalis.us', 'Praesentium anim nemo deserunt voluptas et sed autem molestiae velit alias in quam do sit, ut laborum dicta ad atque.', 'Pendiente', '2014-12-02 21:52:44', '2015-01-16 20:55:57', '2015-01-16 20:55:57', 2),
(20, '141204', 'Presentación de instrumentos ORF', '2014-12-05', '2014-12-05', 'Circulo Infantil /sección Lactantes y Maternales', '11:00:00', 1, 'Estudiantes', '', 'El evento es interno, una presentación solo para los alumnos y maestras de la sección de LyM solicitamos toma de fotografias y video.', 'Pendiente', '2014-12-04 13:52:28', '2014-12-04 13:54:35', NULL, 15),
(21, '141204', 'PIPOPETS /titeres', '2014-12-08', '2014-12-08', 'Patio techado preescolar', '09:00:00', 0, 'Estudiantes', '', 'El evento es interno, dirigido solo para los niños del CI, solicitamos toma de fotografías y clip de vídeo.', 'Pendiente', '2014-12-04 13:54:02', '2014-12-04 13:54:02', NULL, 15),
(22, '141204', 'Presentación de Instrumentos ORF', '2014-12-05', '2014-12-05', 'Patios (2 presentaciones)', '11:00:00', 0, 'Estudiantes', '', 'La presentación es interna, solo dirigida a niños y maestras del CI, solicitamos toma de fotografías y clip de video', 'Pendiente', '2014-12-04 13:56:21', '2014-12-04 13:56:21', NULL, 15),
(23, '141204', 'Festival Navideño', '2014-12-11', '2014-12-12', 'Auditorio de la Unidad de Seminarios', '09:00:00', 0, 'Estudiantes', '', 'Festival Navideño invita a dirigido a comunidad del CI, padres y familiares, dos presentaciones, día 11 preescolar, día 12 LyM, solicitamos toma de fotografías y video\r\n*el acceso es solo con invitación', 'Pendiente', '2014-12-04 13:59:52', '2014-12-04 13:59:52', NULL, 15),
(24, '141204', 'Cuento de Navidad de la compañia de danza contemporánea de la BUAP', '2014-12-15', '2014-12-15', 'Comedor CI', '11:00:00', 0, 'Estudiantes', '', 'Presentación interna para alumnos del CI, solicitamos toma de fotografías y  clip de video', 'Pendiente', '2014-12-04 14:02:22', '2014-12-04 14:02:22', NULL, 15),
(25, '141204', 'Cuento Navideño, teatro de sombras', '2014-12-16', '2014-12-16', 'Comedor CI', '11:30:00', 0, 'Estudiantes', '', 'Presentación interna para alumnos del CI, solicitamos toma de fotografías y clip de video', 'Pendiente', '2014-12-04 14:03:46', '2014-12-04 14:03:46', NULL, 15),
(26, '141204', 'Teatro chino', '2014-12-11', '2014-12-11', 'Patio techado preescolar', '11:00:00', 0, 'Estudiantes', '', 'Evento interno del CI, solicitamos toma de fotografías y clip de vídeo ', 'Pendiente', '2014-12-04 21:10:11', '2014-12-04 21:10:11', NULL, 15),
(27, '141204', 'Cursos Estacionales de Idiomas primavera 2015', '2015-01-05', '2015-01-16', 'Dirección General de Innovación Educativa', '17:00:00', 1, 'Público en general', 'http://www.dgie.buap.mx/index.php/cursos-estacionales', 'Los Cursos Estacionales están dirigidos a la Comunidad Universitaria y Público en General.\r\nDentro de los grupos, sesión por sesión se desarrollan las competencias y habilidades tan necesarias hoy día dentro de las distintas facetas de la vida (Académicas,  Laborales o Lúdicas) de manera dinámica e interactiva.\r\n\r\nEs a través  del  constante proceso formativo que nuestros usuarios logran exitosamente cumplir sus propósitos de manera segura, completa y acreditada  dentro de una dependencia universitaria con apertura y flexibilidad,  que además  cuenta con los contactos necesarios con instituciones nacionales e internacionales quienes avalan el nivel de los conocimientos y aptitudes de quienes se han formado con nosotros.', 'Pendiente', '2014-12-04 21:34:49', '2014-12-04 21:34:49', NULL, 16),
(28, '141205', 'AN-imenasai', '2014-12-13', '2014-12-14', 'CCU', '13:00:00', 0, 'Estudiantes', 'http://www.animenasai.com', 'Pues vengan no? RAWR', 'Pendiente', '2014-12-05 21:02:21', '2014-12-05 21:02:21', NULL, 18),
(29, '150109', 'Curso de preparación y examen para la acreditación de la maetria del TCU111 COMPUTACIÓN', '2015-01-19', '2015-02-13', 'Dirección General de Innovación Educativa', '17:00:00', 1, 'Público en general', 'http://www.dgie.buap.mx/index.php/soporte-tecnico-2', 'CURSO DE PREPARACIÓN AL EXAMEN DE ACREDITACIÓN DE LA MATERIA TCU-111 COMPUTACIÓN\r\nPRIMAVERA 2015\r\nDirigido a los alumnos de las generaciones 2008 y anteriores.\r\nINSCRIPCIONES DEL 16 AL 20 DE FEBRERO DE 2015\r\nInicio: 28 de febrero \r\nTérmino del curso: 28 de marzo\r\n\r\nEL CURSO SE REALIZA EN OFFICE 2007\r\nMayores informes en www.dgie.buap.mx\r\n\r\nPara cualquier duda, dirigirse con la Lic. Erika Juárez Hernández al tel. 2295500\r\n Ext. 7927, correo: erika.juarez@correo.buap.mx\r\n\r\n\r\nEXAMEN DE ACREDITACIÓN DE LA MATERIA TCU-111 COMPUTACIÓN\r\nPRIMAVERA 2015\r\nDirigido a los alumnos de las generaciones 2008 y anteriores.\r\nINSCRIPCIONES DEL 16 AL 20 DE FEBRERO DE 2015\r\n\r\nFecha para presentar el examen:\r\n•	6 de marzo de 2015 a las  09:00 horas en el salón 203 de la DGIE\r\n\r\n\r\n\r\nEL EXAMEN SE APLICA EN OFFICE 2007\r\nMayores informes en www.dgie.buap.mx\r\n\r\nPara cualquier duda, dirigirse con la Lic. Erika Juárez Hernández al tel. 2295500\r\n Ext. 7927, correo: erika.juarez@correo.buap.mx\r\n', 'Pendiente', '2015-01-09 18:25:57', '2015-01-09 20:47:22', NULL, 16),
(30, '150115', 'Expo Educación BUAP 2015', '2015-02-16', '2015-02-18', 'Complejo Cultural Universitario', '09:00:00', 0, 'Público en general', 'http://www.buap.mx/', 'Oferta académica a nivel superior. ', 'Pendiente', '2015-01-15 16:19:54', '2015-01-15 16:19:54', NULL, 14),
(31, '150122', 'Diplomado en Marketing Político y Electoral', '2015-03-06', '2015-07-11', 'ICGDE', '18:00:00', 1, 'Público en general', 'http://www.icgde.buap.mx/', '', 'Pendiente', '2015-01-22 21:03:27', '2015-01-22 21:03:27', NULL, 8),
(32, '150122', 'DIPLOMADO EN ADMINISTRACIÓN PÚBLICA Y CONTABILIDAD GUBERNAMENTAL', '2015-03-06', '2015-07-11', 'ICGDE', '17:00:00', 1, 'Público en general', 'http://www.icgde.buap.mx/', '', 'Pendiente', '2015-01-22 21:17:28', '2015-01-22 21:17:28', NULL, 8),
(33, '150126', 'Seminario de Orientación BUAP, modalidad virtual ', '2015-02-14', '2015-04-17', 'Dirección General de Innovación Educativa', '17:00:00', 1, 'Público en general', 'http://seminario.buap.mx/seminario/virtual/', 'Seminario de orientación BUAP 2015\r\nModalidad Virtual\r\n¡Prepárate en línea para el examen de admisión a la BUAP desde donde estés!\r\nRegistro abierto hasta el 15 de abril en seminario.buap.mx\r\nDuración del 14 de febrero al 17 de abril\r\nEsta es la opción de preparación para aquellos interesados en ingresar a la BUAP que viven fuera del Estado de Puebla o el extranjero porque les permite potenciar sus habilidades de razonamiento a través de un curso en línea con la misma calidad y respaldo del Seminario de Orientación presencial ¿Cómo? Fortaleciendo sus habilidades para presentar con éxito la Prueba de Aptitud Académica (PAA). \r\nEste seminario cuenta con sesiones online conformadas por las áreas de Razonamiento Verbal, Razonamiento Matemático y Redacción Indirecta donde el aspirante descubre sus áreas de oportunidad, evalúa sus avances, confirma sus respuestas, conoce el examen y estudia de manera independiente y autónoma: a su ritmo, desde su lugar de residencia, sin gastos adicionales en transporte, materiales y alimentación, siempre con el apoyo y acompañamiento de Asesores Especialistas que aclararán sus dudas, a través  de chats y foros virtuales.\r\nInformes:\r\nTeléfono 2 29 55 00 extensión 7902.\r\nInversión:\r\n $500.00 \r\nEstudiantes a graduarse en  julio de 2015 de las Preparatorias de la BUAP podrán cursarlo sin costo.\r\n', 'Pendiente', '2015-01-26 20:28:52', '2015-01-26 20:30:22', NULL, 16);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `event_resource_source`
--

CREATE TABLE IF NOT EXISTS `event_resource_source` (
  `event_id` int(11) NOT NULL,
  `resource_source_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`event_id`,`resource_source_id`),
  KEY `fk_events_has_resource_source_resource_source1_idx` (`resource_source_id`),
  KEY `fk_events_has_resource_source_events1_idx` (`event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `event_resource_source`
--

INSERT INTO `event_resource_source` (`event_id`, `resource_source_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(28, 1, '2014-12-05 21:02:21', '2014-12-05 21:02:21', NULL),
(29, 4, '2015-01-09 18:25:57', '2015-01-09 20:47:22', NULL),
(33, 4, '2015-01-26 20:28:52', '2015-01-26 20:30:22', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `event_service`
--

CREATE TABLE IF NOT EXISTS `event_service` (
  `event_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `start_service` date NOT NULL,
  `end_service` date NOT NULL,
  `dci_status` enum('Pendiente','En Proceso','Atendido','Aprobado') NOT NULL DEFAULT 'Pendiente',
  `created_at` datetime DEFAULT NULL,
  `in_process_at` datetime DEFAULT NULL,
  `attended_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`event_id`,`service_id`),
  KEY `fk_events_has_services_services1_idx` (`service_id`),
  KEY `fk_events_has_services_events1_idx` (`event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `event_service`
--

INSERT INTO `event_service` (`event_id`, `service_id`, `start_service`, `end_service`, `dci_status`, `created_at`, `in_process_at`, `attended_at`, `updated_at`, `deleted_at`) VALUES
(2, 1, '2014-12-08', '2014-12-08', 'Pendiente', '2014-11-27 18:05:54', NULL, NULL, '2014-11-27 18:05:54', NULL),
(2, 3, '2014-12-08', '2014-12-08', 'Pendiente', '2014-11-27 18:05:54', NULL, NULL, '2014-11-27 18:05:54', NULL),
(2, 4, '2014-12-08', '2014-12-08', 'Pendiente', '2014-11-27 18:05:54', NULL, NULL, '2014-11-27 18:05:54', NULL),
(2, 5, '2014-12-08', '2014-12-08', 'Pendiente', '2014-11-27 18:05:54', NULL, NULL, '2014-11-27 18:05:54', NULL),
(8, 1, '2014-12-02', '2015-02-28', 'Pendiente', '2014-12-02 20:27:40', NULL, NULL, '2014-12-02 20:27:40', NULL),
(8, 3, '2014-12-02', '2015-02-28', 'Pendiente', '2014-12-02 20:27:40', NULL, NULL, '2014-12-02 20:27:40', NULL),
(8, 4, '2014-12-02', '2015-02-28', 'Pendiente', '2014-12-02 20:27:40', NULL, NULL, '2014-12-02 20:27:40', NULL),
(8, 5, '2014-12-02', '2015-02-28', 'Pendiente', '2014-12-02 20:27:40', NULL, NULL, '2014-12-02 20:27:40', NULL),
(9, 1, '2014-12-02', '2015-02-28', 'Pendiente', '2014-12-02 20:33:47', NULL, NULL, '2014-12-02 20:49:07', NULL),
(9, 3, '2014-12-02', '2015-02-28', 'Pendiente', '2014-12-02 20:33:47', NULL, NULL, '2014-12-02 20:49:07', NULL),
(9, 4, '2014-12-02', '2015-02-28', 'Pendiente', '2014-12-02 20:33:47', NULL, NULL, '2014-12-02 20:49:07', NULL),
(9, 5, '2014-12-02', '2015-02-28', 'Pendiente', '2014-12-02 20:33:47', NULL, NULL, '2014-12-02 20:49:07', NULL),
(10, 1, '2014-12-07', '2014-12-07', 'Pendiente', '2014-12-02 20:42:13', NULL, NULL, '2014-12-02 20:53:55', NULL),
(11, 1, '2014-12-07', '2014-12-07', 'Pendiente', '2014-12-02 20:43:17', NULL, NULL, '2014-12-02 20:43:17', NULL),
(13, 1, '2014-12-03', '2014-12-03', 'Pendiente', '2014-12-02 21:11:32', NULL, NULL, '2014-12-02 21:11:42', NULL),
(14, 1, '2016-01-01', '2016-01-02', 'Pendiente', '2014-12-02 21:41:03', NULL, NULL, '2014-12-02 21:49:31', NULL),
(14, 2, '2016-01-01', '2016-01-02', 'Pendiente', '2014-12-02 21:41:03', NULL, NULL, '2014-12-02 21:49:31', NULL),
(14, 3, '2016-01-01', '2016-01-02', 'Pendiente', '2014-12-02 21:41:03', NULL, NULL, '2014-12-02 21:49:31', NULL),
(14, 4, '2016-01-01', '2016-01-02', 'Pendiente', '2014-12-02 21:41:03', NULL, NULL, '2014-12-02 21:49:31', NULL),
(14, 5, '2016-01-01', '2016-01-02', 'Pendiente', '2014-12-02 21:41:03', NULL, NULL, '2014-12-02 21:49:31', NULL),
(19, 1, '2014-12-10', '2014-12-31', 'Pendiente', '2014-12-02 21:52:44', NULL, NULL, '2014-12-02 22:00:53', NULL),
(19, 2, '2014-12-10', '2014-12-31', 'Pendiente', '2014-12-02 21:52:44', NULL, NULL, '2014-12-02 22:00:53', NULL),
(19, 3, '2014-12-10', '2014-12-31', 'Pendiente', '2014-12-02 21:52:44', NULL, NULL, '2014-12-02 22:00:53', NULL),
(19, 5, '2014-12-10', '2014-12-31', 'Pendiente', '2014-12-02 21:52:44', NULL, NULL, '2014-12-02 22:00:53', NULL),
(27, 1, '2015-01-05', '2015-01-16', 'Pendiente', '2014-12-04 21:34:49', NULL, NULL, '2014-12-04 21:34:49', NULL),
(27, 3, '2015-01-05', '2015-01-16', 'Pendiente', '2014-12-04 21:34:49', NULL, NULL, '2014-12-04 21:34:49', NULL),
(27, 4, '2015-01-05', '2015-01-16', 'Pendiente', '2014-12-04 21:34:49', NULL, NULL, '2014-12-04 21:34:49', NULL),
(27, 5, '2015-01-05', '2015-01-16', 'Pendiente', '2014-12-04 21:34:49', NULL, NULL, '2014-12-04 21:34:49', NULL),
(28, 1, '2014-12-13', '2014-12-14', 'Pendiente', '2014-12-05 21:02:21', NULL, NULL, '2014-12-05 21:02:21', NULL),
(28, 2, '2014-12-13', '2014-12-14', 'Pendiente', '2014-12-05 21:02:21', NULL, NULL, '2014-12-05 21:02:21', NULL),
(28, 5, '2014-12-13', '2014-12-14', 'Pendiente', '2014-12-05 21:02:21', NULL, NULL, '2014-12-05 21:02:21', NULL),
(29, 3, '2015-01-19', '2015-02-13', 'Pendiente', '2015-01-09 18:25:57', NULL, NULL, '2015-01-09 20:47:22', NULL),
(29, 4, '2015-01-19', '2015-02-13', 'Pendiente', '2015-01-09 18:25:57', NULL, NULL, '2015-01-09 20:47:22', NULL),
(29, 8, '2015-01-19', '2015-02-13', 'Pendiente', '2015-01-09 18:25:57', NULL, NULL, '2015-01-09 20:47:22', NULL),
(29, 10, '2015-01-19', '2015-02-13', 'Pendiente', '2015-01-09 18:25:57', NULL, NULL, '2015-01-09 20:47:22', NULL),
(30, 1, '2015-02-16', '2015-02-18', 'Pendiente', '2015-01-15 16:19:54', NULL, NULL, '2015-01-15 16:19:54', NULL),
(30, 3, '2015-02-16', '2015-02-18', 'Pendiente', '2015-01-15 16:19:54', NULL, NULL, '2015-01-15 16:19:54', NULL),
(31, 3, '2015-03-06', '2015-07-11', 'Pendiente', '2015-01-22 21:03:27', NULL, NULL, '2015-01-22 21:03:27', NULL),
(31, 4, '2015-03-06', '2015-07-11', 'Pendiente', '2015-01-22 21:03:27', NULL, NULL, '2015-01-22 21:03:27', NULL),
(31, 8, '2015-03-06', '2015-07-11', 'Pendiente', '2015-01-22 21:03:27', NULL, NULL, '2015-01-22 21:03:27', NULL),
(31, 10, '2015-03-06', '2015-07-11', 'Pendiente', '2015-01-22 21:03:27', NULL, NULL, '2015-01-22 21:03:27', NULL),
(32, 3, '2015-03-06', '2015-07-11', 'Pendiente', '2015-01-22 21:17:28', NULL, NULL, '2015-01-22 21:17:28', NULL),
(32, 4, '2015-03-06', '2015-07-11', 'Pendiente', '2015-01-22 21:17:28', NULL, NULL, '2015-01-22 21:17:28', NULL),
(32, 6, '2015-03-06', '2015-07-11', 'Pendiente', '2015-01-22 21:17:28', NULL, NULL, '2015-01-22 21:17:28', NULL),
(32, 8, '2015-03-06', '2015-07-11', 'Pendiente', '2015-01-22 21:17:28', NULL, NULL, '2015-01-22 21:17:28', NULL),
(32, 10, '2015-03-06', '2015-07-11', 'Pendiente', '2015-01-22 21:17:28', NULL, NULL, '2015-01-22 21:17:28', NULL),
(33, 3, '2015-02-14', '2015-04-17', 'Pendiente', '2015-01-26 20:28:52', NULL, NULL, '2015-01-26 20:30:22', NULL),
(33, 4, '2015-02-14', '2015-04-17', 'Pendiente', '2015-01-26 20:28:52', NULL, NULL, '2015-01-26 20:30:22', NULL),
(33, 8, '2015-02-14', '2015-04-17', 'Pendiente', '2015-01-26 20:28:52', NULL, NULL, '2015-01-26 20:30:22', NULL),
(33, 10, '2015-02-14', '2015-04-17', 'Pendiente', '2015-01-26 20:28:52', NULL, NULL, '2015-01-26 20:30:22', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `event_witness`
--

CREATE TABLE IF NOT EXISTS `event_witness` (
  `event_id` int(11) NOT NULL,
  `witness_id` int(11) NOT NULL,
  `file` varchar(100) NOT NULL DEFAULT 'NOT FILE',
  `dci_status` enum('No Aprobado','Pendiente','En Proceso','Aprobado') NOT NULL DEFAULT 'Pendiente',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`event_id`,`witness_id`),
  KEY `fk_events_has_witnesses_witnesses1_idx` (`witness_id`),
  KEY `fk_events_has_witnesses_events1_idx` (`event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `event_witness`
--

INSERT INTO `event_witness` (`event_id`, `witness_id`, `file`, `dci_status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(19, 3, 'NOT FILE', 'Pendiente', '2014-12-02 21:52:44', '2014-12-02 22:00:53', NULL),
(27, 1, 'NOT FILE', 'Pendiente', '2014-12-04 21:34:49', '2014-12-04 21:34:49', NULL),
(27, 4, 'NOT FILE', 'Pendiente', '2014-12-04 21:34:49', '2014-12-04 21:34:49', NULL),
(28, 4, 'NOT FILE', 'Pendiente', '2014-12-05 21:02:21', '2014-12-05 21:02:21', NULL),
(29, 1, 'NOT FILE', 'Pendiente', '2015-01-09 18:25:57', '2015-01-09 20:47:22', NULL),
(29, 4, 'NOT FILE', 'Pendiente', '2015-01-09 18:25:57', '2015-01-09 20:47:22', NULL),
(30, 1, 'NOT FILE', 'Pendiente', '2015-01-15 16:19:54', '2015-01-15 16:19:54', NULL),
(30, 3, 'NOT FILE', 'Pendiente', '2015-01-15 16:19:54', '2015-01-15 16:19:54', NULL),
(33, 1, 'NOT FILE', 'Pendiente', '2015-01-26 20:28:52', '2015-01-26 20:30:22', NULL),
(33, 4, 'NOT FILE', 'Pendiente', '2015-01-26 20:28:52', '2015-01-26 20:30:22', NULL);

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
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `resources_sources`
--

INSERT INTO `resources_sources` (`id`, `name`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Tesoreria', NULL, NULL, NULL, NULL),
(2, 'Fondo fijo', NULL, NULL, NULL, NULL),
(3, 'Apoyos especiales', NULL, NULL, NULL, NULL),
(4, 'Otros', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `services`
--

CREATE TABLE IF NOT EXISTS `services` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` text,
  `observations` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `department_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_services_department1_idx` (`department_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Volcado de datos para la tabla `services`
--

INSERT INTO `services` (`id`, `name`, `description`, `observations`, `created_at`, `updated_at`, `deleted_at`, `department_id`) VALUES
(1, 'Diseño gráfico', 'Diseño gráfico', NULL, NULL, NULL, NULL, 1),
(2, 'Asesoría en redacción', 'Asesoría en redacción', NULL, NULL, NULL, NULL, 1),
(3, 'Radio BUAP', 'Radio BUAP', NULL, NULL, NULL, NULL, 1),
(4, 'Prensa externa', 'Prensa externa', NULL, NULL, NULL, NULL, 1),
(5, 'Cobertura interna', 'Cobertura interna', NULL, NULL, NULL, NULL, 1),
(6, 'Producción de material impreso*', 'Producción de material impreso*', NULL, NULL, NULL, NULL, 1),
(7, 'Producción de material audiovisual*', 'Producción de material audiovisual*', NULL, NULL, NULL, NULL, 1),
(8, 'Sitio Web', 'Sitio Web', NULL, NULL, NULL, NULL, 1),
(9, 'Perifoneo*', 'Perifoneo*', NULL, NULL, NULL, NULL, 1),
(10, 'Redes sociales', 'Redes sociales', NULL, NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `support_materials`
--

CREATE TABLE IF NOT EXISTS `support_materials` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `original_name` varchar(100) NOT NULL,
  `file` varchar(100) NOT NULL,
  `event_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_support_materials_events1_idx` (`event_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Volcado de datos para la tabla `support_materials`
--

INSERT INTO `support_materials` (`id`, `original_name`, `file`, `event_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '', 'support_materials/T02qysx5Y2fWGjNmIDfU.eps', 2, '2014-11-27 18:05:54', '2014-11-27 18:05:54', NULL),
(2, '', 'support_materials/AJGvCi6JyyEd54HEE17J.jpg', 8, '2014-12-02 20:27:40', '2014-12-02 20:27:40', NULL),
(3, '', 'support_materials/EmhYVLUikTuNNOA2M1nh.jpg', 9, '2014-12-02 20:33:47', '2014-12-02 20:49:07', NULL),
(4, '', 'support_materials/grlt2UF3FFAI7Q09GfKG.jpg', 10, '2014-12-02 20:42:13', '2014-12-02 20:53:55', NULL),
(5, '', 'support_materials/UWZ6Q6jq6HkNArJk6YMf.jpg', 11, '2014-12-02 20:43:17', '2014-12-02 20:43:17', NULL),
(6, '', 'support_materials/IQeHpRGgAfoFPkLTzpTT.png', 28, '2014-12-05 21:02:21', '2014-12-05 21:02:21', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tasks`
--

CREATE TABLE IF NOT EXISTS `tasks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `status` enum('Pendiente','Completa') NOT NULL COMMENT 'Pendiente: La tarea fue creada\nCompleta: El empleado marca la tarea que se le asignó como completa',
  `description` text,
  `comment` text,
  `created_at` datetime DEFAULT NULL,
  `completed_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `event_service_event_id` int(11) NOT NULL,
  `event_service_service_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_tasks_users1_idx` (`user_id`),
  KEY `fk_tasks_event_service1_idx` (`event_service_event_id`,`event_service_service_id`)
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
  `phone` varchar(10) DEFAULT NULL,
  `extension_phone` varchar(5) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '2' COMMENT '0 Inactive\n1 Active\n2 Activation required',
  `remember_token` varchar(100) DEFAULT NULL,
  `password` varchar(60) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `user_type_id` int(11) NOT NULL DEFAULT '1',
  `academic_administrative_unit_id` int(11) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_users_user_type1_idx` (`user_type_id`),
  KEY `fk_users_academic_administrative_unit1_idx` (`academic_administrative_unit_id`),
  KEY `fk_users_department1_idx` (`department_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=31 ;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `extension_phone`, `status`, `remember_token`, `password`, `created_at`, `updated_at`, `deleted_at`, `user_type_id`, `academic_administrative_unit_id`, `department_id`) VALUES
(1, 'Javier ', 'Aguila', 'sjaca10@gmail.com', '2226272898', NULL, 1, NULL, '$2a$10$AStps2SHJhmQZAFNJ6p2.uSR9SXvDvD13fTKwCj70cr3SzWLa.Viu', NULL, NULL, NULL, 1, 1, 1),
(2, 'Jesús', 'Cruz', 'jesuslink00@gmail.com', NULL, NULL, 1, NULL, '$2y$10$GFcVq7u..KHQkTzgM9x2qOIUFxX5S9eP/J5f27dcWFZCbaZUhanPO', NULL, NULL, NULL, 1, 1, 1),
(3, 'Amparo', 'Merino Reyes', 'amparomx@gmail.com', '2224807645', '5266', 1, NULL, '$2y$10$TaOZ3yl33Vluq.3X5tW1oODQpeD1W8YY0EM8p7qfSv3O/Gq4JmvGO', NULL, NULL, NULL, 1, 4, 1),
(5, 'Israel', 'Cruz', 'israel@aerostato.mx', '2221602123', '', 2, NULL, '$2y$10$8NQhAVq.IyNyACrhbS0/5uUPuJOIWDgqBj26LAHr4m6KmNVgvsjX.', NULL, NULL, NULL, 1, 2, 1),
(6, 'Chris', 'Guarneros', 'chrisgsdiaz@gmail.com', '321654', '', 1, NULL, '$2y$10$f7LNPYcqofhutmHEtvNgu.VBxw0/MXZiUJb3p/u5sNmpyVgGuN0ky', NULL, NULL, NULL, 1, 3, 1),
(7, 'Amparo', 'Merino Reyes', 'amparomerinoreyes@gmail.com', '2224807645', '2662', 1, NULL, '$2y$10$0gKCj8wBHCJG1lIJCGzvyOM4d/53ie0FbMTCR1Ug0hIZfoSiEM37.', NULL, NULL, NULL, 1, 11, 1),
(8, 'Carla', 'Ríos Calleja', 'difusion.icgde@correo.buap.mx', '2225774214', '3457', 1, NULL, '$2y$10$/iOHOdpU2Ng2MSvIf6eBh.PdhKt7Ndu7w9gOJSKaLBJgw5rO6I80i', NULL, NULL, NULL, 1, 76, 1),
(9, 'Ana ', 'Urías ', 'ana.urias@correo.buap.mx', '2295500', '5266', 1, NULL, '$2y$10$/War0ACGr/Xj1pnGTeN6Xu.5PKgf2nKvleNkui9pUJKq2FqhfqYXq', NULL, NULL, NULL, 1, 11, 1),
(10, 'Enrique', 'Barradas', 'barradas@fcfm.buap.mx', '2345044', '22955', 1, NULL, '$2y$10$1DUreIiK92X11woVYRs91OuuJhc/DbNDaFkl40tgylHlvJfSzYe2C', NULL, NULL, NULL, 1, 60, 1),
(11, 'Heriberto', 'Hernández Moreno', 'cherokhee@gmail.com', '', '22955', 1, NULL, '$2y$10$qT7Kq77wMttw2uBnJ4p.jeBtuOXpe2N5YsH5do2rmrp9eQdiOOfdm', NULL, NULL, NULL, 1, 17, 1),
(12, 'Alfredo ', 'Arceo', 'aarceo@ccinf.ucm.es', '', '', 1, NULL, '$2y$10$06DEX1roqVK2IDDF5K2ENeVchMaUCHC71FFdK/jbaWZuPLh5ro0CS', NULL, NULL, NULL, 1, 11, 1),
(13, 'Carlos', 'de Castilla Jiménez', 'carlos.decastilla@correo.buap.mx', '2224458190', '22955', 1, NULL, '$2y$10$YCyxGBBgMPhuynZoybN/Qu0TfpDVW5BXdGyxyGg5dxcYb7NXbhlpa', NULL, NULL, NULL, 1, 65, 1),
(14, 'Ana Lidia', 'Ramírez Herrera', 'analidia.ramirez@correo.buap.mx', '', '5286', 1, NULL, '$2y$10$7hiuKgZmePiSqRQBtgBH8uYL2CukhdP1fBsEqvBpry9SS81FSU8M2', NULL, NULL, NULL, 1, 11, 1),
(15, 'Isabel', 'Larenas', 'circulo.infantil@correo.buap.mx', '2295500', '3604', 1, NULL, '$2y$10$MNPHxm0A0f3jarMvy.5H2u90HjH9BMtzP0rue6StA5vBGa2NX4C6a', NULL, NULL, NULL, 1, 16, 1),
(16, 'Berenize', 'Conde Morales', 'berenize.conde@correo.buap.mx', '2221066071', '22955', 1, NULL, '$2y$10$DSL24k82C9Zdt41SGRE2Fe.rnX1SPUJvcHUPoY.cUGb7wRDyHEOBu', NULL, NULL, NULL, 1, 24, 1),
(17, 'Nohemi', 'Melgoza', 'nohemi.melgoza@correo.buap.mx', '2223247870', '22955', 1, NULL, '$2y$10$A9OFo6cImEZGi7DWgTLQXO8s788I4vyUpkJjBRb1P1IdTnMiFzhCy', NULL, NULL, NULL, 1, 61, 1),
(18, 'An', 'Aimee', 'ai.aimeee@gmail.com', '8886817', '123', 1, NULL, '$2y$10$YQ5q2WN.gS2baQkM4.Drre5cTYZHP5zHsVnQngLb4S3eYZmFVdqbq', NULL, NULL, NULL, 1, 2, 1),
(19, 'Victor ', 'Escobar Mejia', 'victorem1969@hotmail.com', '2225673476', '22955', 1, NULL, '$2y$10$VoN6RNYzSVDmkZqIfJUW9ePQdCGtU7.VvMb.rOpAKRDeoFngP.n3O', NULL, NULL, NULL, 1, 1, 1),
(26, 'Arturo', 'Aguila', 'superjaca10@live.com.mx', '2227262898', '', 2, NULL, '$2y$10$NnYEl5NxJjO/.D29Kyvx9etB3ehMIjd9IHMQnkHrJx77Ym0lpG22S', NULL, NULL, NULL, 1, 57, NULL),
(27, 'Israel', 'Cruz', 'jr12a@gmail.com', '8884661', '', 2, NULL, '$2y$10$ztdh4pLIGxhJF1lM0K55peT8TcuOKG4LZESfEKwB4I6lYY7xYUEMW', NULL, NULL, NULL, 1, 3, NULL),
(28, 'Selene', 'Rodriguez', 'lunita_diaz26@hotmail.com', '2295500', '2191', 2, NULL, '$2y$10$ac/QsQDrSIpiP8efOLammOa0hRpHlbe9GA2bauR1Mc4DJncLMqja2', NULL, NULL, NULL, 1, 8, NULL),
(29, 'Selene X', 'Rodríguez Diaz', 'ai.aimee@live.com', '', '2191', 2, NULL, '$2y$10$BJRzK9qK3yqYpDZO0Ve5NuQAjX9L9lY4vzigQGkNo84KBII9k5yfq', NULL, NULL, NULL, 1, NULL, NULL),
(30, 'Brenda', 'Loeza', 'calidad.hup@correo.buap.mx', '2221162414', '6236', 1, NULL, '$2y$10$9DK05BwLmdjKoBhx/OM/Ue1mK7mzRmGcdt03XcN3tt6uzUGE.eSb6', NULL, NULL, NULL, 1, 28, NULL);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

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
(8, 'fp6yikHROUviQ1WLaDWbmqRRDcAgkkwrhbzOL96W', '2014-12-06 21:13:02', 1, 1, 19),
(9, '3VHi8xXKYrdrdaGP5WYTcUY5CHEBuzXCHsCRmPfw', '2015-01-22 17:21:27', 1, 0, 26),
(10, 'cn4dmIvYViRDACE4sdTZjjKVL5aQhud2JxRsnKah', '2015-01-22 17:22:08', 1, 0, 27),
(11, 'qh0KlmbG9e2aZdSxNEk8Qyi1umsANCJF5rwYY2qR', '2015-01-22 18:17:50', 1, 0, 28),
(12, 'hThBB5ITDWNmRQFbnQr9TxwvL2iD2LBYaxS71k28', '2015-01-22 19:12:27', 1, 0, 29);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users_types`
--

CREATE TABLE IF NOT EXISTS `users_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `users_types`
--

INSERT INTO `users_types` (`id`, `name`, `description`) VALUES
(1, 'Cliente', 'Usuarios del sistema que solicitan difusión.'),
(2, 'Empleado DCI', 'Usuario del sistema que realizan tareas de diseño, radio, TV, etc.'),
(3, 'Jefe DCI', 'Usuario del sistema administrativo que asigna tareas a los empleados.'),
(4, 'Administrador', 'Superusuario del sistema.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `witnesses`
--

CREATE TABLE IF NOT EXISTS `witnesses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  ADD CONSTRAINT `fk_tasks_event_service1` FOREIGN KEY (`event_service_event_id`, `event_service_service_id`) REFERENCES `event_service` (`event_id`, `service_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
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

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
