SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `db554509897`.`users_types`
-- -----------------------------------------------------
START TRANSACTION;
USE `db554509897`;
INSERT INTO `db554509897`.`users_types` (`id`, `name`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES 
(1, 'Cliente', NULL, '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL),
(2, 'Empleado DCI', NULL, '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL),
(3, 'Jefe DCI', NULL, '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL),
(4, 'Administrador', NULL, '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `db554509897`.`academic_administrative_units`
-- -----------------------------------------------------
START TRANSACTION;
USE `db554509897`;
INSERT INTO `db554509897`.`academic_administrative_units` (`id`, `name`, `type`, `created_at`, `updated_at`, `deleted_at`) VALUES 
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
(27, 'Farmacias Universitarias \"Alexander Fleming\"', 'unidades_administrativas', '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL),
(28, 'Hospital Universitario de Puebla', 'unidades_administrativas', '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL),
(29, 'Museo Universitario \"Casa de los Muñecos\"', 'unidades_administrativas', '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL),
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

COMMIT;


-- -----------------------------------------------------
-- Data for table `db554509897`.`departments`
-- -----------------------------------------------------
START TRANSACTION;
USE `db554509897`;
INSERT INTO `db554509897`.`departments` (`id`, `name`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES 
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

COMMIT;


-- -----------------------------------------------------
-- Data for table `db554509897`.`users`
-- -----------------------------------------------------
START TRANSACTION;
USE `db554509897`;
INSERT INTO `db554509897`.`users` (`id`, `first_name`, `last_name`, `email`, `phone`, `extension_phone`, `status`, `remember_token`, `password`, `created_at`, `updated_at`, `deleted_at`, `user_type_id`, `department_id`, `academic_administrative_unit_id`) VALUES 
(1, 'Javier ', 'Aguila', 'sjaca10@gmail.com', '2227262898', NULL, 1, NULL, '$2a$10$M.wpiAUrThtFid2A9.4qdOpGLSy9MyEAd37IlE9a0a9fyBaUf.jya', '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL, 1, 1, 1),
(2, 'Israel', 'Cruz', 'jesuslink00@gmail.com', NULL, NULL, 1, NULL, '$2a$10$Q8IqS1k3IbXL6kMfYNXbFO.AtgzWDwUOQN5yv7s2utED.yR.MEUMO', '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL, 1, 1, 2),
(3, 'Arturo', 'Aguila', 'superjaca10@live.com.mx', '2227262898', NULL, 1, NULL, '$2a$10$0O7q42JfKrcvO.4XDXj9yOPjhbL4h2kIxCv1R7K4HWQkT.ZcThgWK', '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL, 2, 6, 3),
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
(21, 'Brenda', 'Loeza', 'calidad.hup@correo.buap.mx', '2221162414', '6236', 1, NULL, '$2y$10$9DK05BwLmdjKoBhx/OM/Ue1mK7mzRmGcdt03XcN3tt6uzUGE.eSb6', '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL, 1, 1, 28);

COMMIT;


-- -----------------------------------------------------
-- Data for table `db554509897`.`services`
-- -----------------------------------------------------
START TRANSACTION;
USE `db554509897`;
INSERT INTO `db554509897`.`services` (`id`, `name`, `description`, `observations`, `created_at`, `updated_at`, `deleted_at`, `department_id`) VALUES 
(1, 'Diseño gráfico', NULL, NULL, '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL, 7),
(2, 'Asesoría en redacción', NULL, NULL, '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL, 4),
(3, 'Entrevista Radio BUAP', NULL, NULL, '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL, 10),
(4, 'Prensa externa', NULL, NULL, '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL, 4),
(5, 'Entrevista en Radiodifusoras', NULL, NULL, '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL, 10),
(6, 'Producción de material impreso*', NULL, NULL, '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL, 7),
(7, 'Producción de material audiovisual*', NULL, NULL, '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL, 9),
(8, 'Sitio Web', NULL, NULL, '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL, 5),
(9, 'Revistas', NULL, NULL, '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL, 8),
(10, 'Redes sociales', NULL, NULL, '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL, 5);
(11, 'Spot', NULL, NULL, '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL, 10);
(12, 'Control Remoto', NULL, NULL, '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL, 10);

COMMIT;


-- -----------------------------------------------------
-- Data for table `db554509897`.`witnesses`
-- -----------------------------------------------------
START TRANSACTION;
USE `db554509897`;
INSERT INTO `db554509897`.`witnesses` (`id`, `name`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES 
(1, 'Ejemplar de impresión', NULL, '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL),
(2, 'Carátula de libros, revistas o folletos', NULL, '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL),
(3, 'Fotografías de rótulos colocados', NULL, '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL),
(4, 'Fotografías', NULL, '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `db554509897`.`resources_sources`
-- -----------------------------------------------------
START TRANSACTION;
USE `db554509897`;
INSERT INTO `db554509897`.`resources_sources` (`id`, `name`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES 
(1, 'Tesorería', NULL, '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL),
(2, 'Fondo fijo', NULL, '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL),
(3, 'Apoyos especiales', NULL, '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL),
(4, 'Otros', NULL, '2015-02-11 16:46:40', '2015-02-11 16:46:40', NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `db554509897`.`events`
-- -----------------------------------------------------
START TRANSACTION;
USE `db554509897`;
INSERT INTO `db554509897`.`events` (`id`, `id_dci`, `name`, `start_day`, `end_day`, `place`, `time`, `has_cost`, `directed_to`, `link`, `description`, `dci_status`, `created_at`, `updated_at`, `deleted_at`, `user_id`) VALUES
(1, '1411271', 'Encendido del árbol navideño 2015', '2014-12-03', '2014-12-03', 'CCU', '18:00:00', 0, 'Público en general', '', 'Habra rifas y sorpresas', 'Pendiente', '2014-11-27 04:39:44', '2014-11-28 01:51:25', NULL, 9),
(2, '1411272', 'Seminario "Las Reformas Estructurales en México y la ampliación de los derechos humanos en México: u', '2014-12-08', '2014-12-08', 'ICGDE', '08:00:00', 0, 'Público en general', 'http://www.icgde.buap.mx/', '', 'Pendiente', '2014-11-27 18:05:54', '2014-11-27 18:05:54', NULL, 18),
(3, '1411273', 'Lanzamiento de campaña el valor eres tú', '2014-12-01', '2015-02-27', 'DCI', '17:00:00', 0, 'Comunidad BUAP', '', 'Campaña interna de comunicación', 'Pendiente', '2014-11-27 18:16:17', '2015-01-23 15:28:19', NULL, 9),
(4, '1411274', 'Primer Taller Internacional "Tendencias en la Enseñanza de las Matemáticas Basada en la Investigació', '2014-11-27', '2014-11-30', 'Edificio: 1DGIE1 Av. San Claudio  y 22 Sur, Ciudad', '17:00:00', 0, 'Comunidad BUAP', 'http://www.fcfm.buap.mx/TEMBI/index.php', '\r\n\r\nEs el Primer Taller Internacional "Tendencias en la enseñanza de las matemáticas basada en investigación (TEMBI)", el cual es el espacio académico ideal para conocer, discutir y reflexionar sobre las tendencias más actuales en la enseñanza de las matemáticas basada en la investigación. ', 'Pendiente', '2014-11-27 19:40:35', '2014-11-27 19:40:35', NULL, 10),
(5, '1411281', 'Encendido del árbol navideño', '2014-12-02', '2014-12-02', 'Explanada del Auditorio CCU', '17:00:00', 0, 'Público en general', '', '', 'Pendiente', '2014-11-28 01:29:22', '2014-11-28 01:30:03', NULL, 9),
(6, '1411282', 'Encendido del Árbol Navideño', '2014-12-02', '2014-12-02', 'Explanada Auditorio CCU', '17:00:00', 0, 'Público en general', '', '', 'Pendiente', '2014-11-28 01:31:26', '2014-11-28 01:36:51', NULL, 9),
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
(26, '1412047', 'Teatro chino', '2014-12-11', '2014-12-11', 'Patio techado preescolar', '11:00:00', 0, 'Estudiantes', '', 'Evento interno del CI, solicitamos toma de fotografías y clip de vídeo ', 'Pendiente', '2014-12-04 21:10:11', '2014-12-04 21:10:11', NULL, 15);

COMMIT;


-- -----------------------------------------------------
-- Data for table `db554509897`.`event_resource_source`
-- -----------------------------------------------------
START TRANSACTION;
USE `db554509897`;
INSERT INTO `db554509897`.`event_resource_source` (`event_id`, `resource_source_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(18, 4, '2015-01-09 18:25:57', '2015-01-09 20:47:22', NULL),
(14, 4, '2015-01-26 20:28:52', '2015-01-26 20:30:22', NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `db554509897`.`event_service`
-- -----------------------------------------------------
START TRANSACTION;
USE `db554509897`;
INSERT INTO `db554509897`.`event_service` (`event_id`, `service_id`, `start_service`, `end_service`, `dci_status`, `created_at`, `in_process_at`, `attended_at`, `updated_at`, `deleted_at`) VALUES
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
(19, 1, '2015-01-05', '2015-01-16', 'Pendiente', '2014-12-04 21:34:49', NULL, NULL, '2014-12-04 21:34:49', NULL),
(19, 3, '2015-01-05', '2015-01-16', 'Pendiente', '2014-12-04 21:34:49', NULL, NULL, '2014-12-04 21:34:49', NULL),
(19, 4, '2015-01-05', '2015-01-16', 'Pendiente', '2014-12-04 21:34:49', NULL, NULL, '2014-12-04 21:34:49', NULL),
(19, 5, '2015-01-05', '2015-01-16', 'Pendiente', '2014-12-04 21:34:49', NULL, NULL, '2014-12-04 21:34:49', NULL),
(18, 3, '2015-01-19', '2015-02-13', 'Pendiente', '2015-01-09 18:25:57', NULL, NULL, '2015-01-09 20:47:22', NULL),
(18, 4, '2015-01-19', '2015-02-13', 'Pendiente', '2015-01-09 18:25:57', NULL, NULL, '2015-01-09 20:47:22', NULL),
(18, 8, '2015-01-19', '2015-02-13', 'Pendiente', '2015-01-09 18:25:57', NULL, NULL, '2015-01-09 20:47:22', NULL),
(18, 10, '2015-01-19', '2015-02-13', 'Pendiente', '2015-01-09 18:25:57', NULL, NULL, '2015-01-09 20:47:22', NULL),
(17, 1, '2015-02-16', '2015-02-18', 'Pendiente', '2015-01-15 16:19:54', NULL, NULL, '2015-01-15 16:19:54', NULL),
(17, 3, '2015-02-16', '2015-02-18', 'Pendiente', '2015-01-15 16:19:54', NULL, NULL, '2015-01-15 16:19:54', NULL),
(16, 3, '2015-03-06', '2015-07-11', 'Pendiente', '2015-01-22 21:03:27', NULL, NULL, '2015-01-22 21:03:27', NULL),
(16, 4, '2015-03-06', '2015-07-11', 'Pendiente', '2015-01-22 21:03:27', NULL, NULL, '2015-01-22 21:03:27', NULL),
(16, 8, '2015-03-06', '2015-07-11', 'Pendiente', '2015-01-22 21:03:27', NULL, NULL, '2015-01-22 21:03:27', NULL),
(16, 10, '2015-03-06', '2015-07-11', 'Pendiente', '2015-01-22 21:03:27', NULL, NULL, '2015-01-22 21:03:27', NULL),
(15, 3, '2015-03-06', '2015-07-11', 'Pendiente', '2015-01-22 21:17:28', NULL, NULL, '2015-01-22 21:17:28', NULL),
(15, 4, '2015-03-06', '2015-07-11', 'Pendiente', '2015-01-22 21:17:28', NULL, NULL, '2015-01-22 21:17:28', NULL),
(15, 6, '2015-03-06', '2015-07-11', 'Pendiente', '2015-01-22 21:17:28', NULL, NULL, '2015-01-22 21:17:28', NULL),
(15, 8, '2015-03-06', '2015-07-11', 'Pendiente', '2015-01-22 21:17:28', NULL, NULL, '2015-01-22 21:17:28', NULL),
(15, 10, '2015-03-06', '2015-07-11', 'Pendiente', '2015-01-22 21:17:28', NULL, NULL, '2015-01-22 21:17:28', NULL),
(14, 3, '2015-02-14', '2015-04-17', 'Pendiente', '2015-01-26 20:28:52', NULL, NULL, '2015-01-26 20:30:22', NULL),
(14, 4, '2015-02-14', '2015-04-17', 'Pendiente', '2015-01-26 20:28:52', NULL, NULL, '2015-01-26 20:30:22', NULL),
(14, 8, '2015-02-14', '2015-04-17', 'Pendiente', '2015-01-26 20:28:52', NULL, NULL, '2015-01-26 20:30:22', NULL),
(14, 10, '2015-02-14', '2015-04-17', 'Pendiente', '2015-01-26 20:28:52', NULL, NULL, '2015-01-26 20:30:22', NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `db554509897`.`event_witness`
-- -----------------------------------------------------
START TRANSACTION;
USE `db554509897`;
INSERT INTO `db554509897`.`event_witness` (`event_id`, `witness_id`, `file`, `dci_status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(19, 1, 'NOT FILE', 'Pendiente', '2014-12-04 21:34:49', '2014-12-04 21:34:49', NULL),
(19, 4, 'NOT FILE', 'Pendiente', '2014-12-04 21:34:49', '2014-12-04 21:34:49', NULL),
(18, 1, 'NOT FILE', 'Pendiente', '2015-01-09 18:25:57', '2015-01-09 20:47:22', NULL),
(18, 4, 'NOT FILE', 'Pendiente', '2015-01-09 18:25:57', '2015-01-09 20:47:22', NULL),
(17, 1, 'NOT FILE', 'Pendiente', '2015-01-15 16:19:54', '2015-01-15 16:19:54', NULL),
(17, 3, 'NOT FILE', 'Pendiente', '2015-01-15 16:19:54', '2015-01-15 16:19:54', NULL),
(14, 1, 'NOT FILE', 'Pendiente', '2015-01-26 20:28:52', '2015-01-26 20:30:22', NULL),
(14, 4, 'NOT FILE', 'Pendiente', '2015-01-26 20:28:52', '2015-01-26 20:30:22', NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `db554509897`.`support_materials`
-- -----------------------------------------------------
START TRANSACTION;
USE `db554509897`;
INSERT INTO `db554509897`.`support_materials` (`id`, `original_name`, `file`, `event_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'archivo.eps', 'support_materials/T02qysx5Y2fWGjNmIDfU.eps', 2, '2014-11-27 18:05:54', '2014-11-27 18:05:54', NULL),
(2, 'archivo.jpg', 'support_materials/AJGvCi6JyyEd54HEE17J.jpg', 8, '2014-12-02 20:27:40', '2014-12-02 20:27:40', NULL),
(3, 'archivo.jpg', 'support_materials/EmhYVLUikTuNNOA2M1nh.jpg', 9, '2014-12-02 20:33:47', '2014-12-02 20:49:07', NULL),
(4, 'archivo.jpg', 'support_materials/grlt2UF3FFAI7Q09GfKG.jpg', 10, '2014-12-02 20:42:13', '2014-12-02 20:53:55', NULL),
(5, 'archivo.jpg', 'support_materials/UWZ6Q6jq6HkNArJk6YMf.jpg', 11, '2014-12-02 20:43:17', '2014-12-02 20:43:17', NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `db554509897`.`users_auth_operations`
-- -----------------------------------------------------
START TRANSACTION;
USE `db554509897`;
INSERT INTO `db554509897`.`users_auth_operations` (`id`, `token`, `expiration`, `type`, `used`, `user_id`) VALUES
(1, '0RXQDi6ARgXV9z7YCQEXQQsBLuxzFXmIzGHJOn9A', '2014-11-28 02:01:39', 1, 1, 1),
(2, 'dY0jCVOkTtYiEERXLoIe2P1mh3Wle6vED3AMKgN9', '2014-11-28 02:01:39', 1, 1, 2),
(3, '7V8Z6MdoJzPoxYQxC1vabufbOiOeNxv3bOfJqsq2', '2014-11-28 02:04:13', 1, 1, 3),
(4, 'jEaKqmWVJ2R6Q9zkOvToT1yYMndp5JWhYuHzki7G', '2014-11-28 04:31:47', 1, 1, 4),
(5, 'jMjicoDLZawn1GYZ0w4TXQsjyTkjKgZKDaViqH0X', '2014-11-28 21:05:26', 1, 1, 5),
(6, 'uD2F1Mtwu7eqAXFHaU4B8AoDJSnEuifJrWRKtmHa', '2014-11-28 21:53:30', 1, 1, 6),
(7, 'fp6yikHROUviQ1WLaDWbmqRRDcAgkkwrhbzOL96W', '2014-12-06 21:13:02', 1, 1, 7),
(8, 'OLMkWgyoAgAd3OJ8BF7u5nMBwywS3nhEANK1nJ38', '2014-12-06 21:13:02', 1, 1, 8),
(9, 'C7o4cJMPS8atRg7pXyoSs4cTWwz7vRQ07bve4oaz', '2014-12-06 21:13:02', 1, 1, 9),
(10, 'moaxVdQQS6E29s9gGxiKnq9KD0jjEZ8bqMusLs89', '2014-12-06 21:13:02', 1, 1, 10),
(11, 'kYDwYmvKyKKaCGOufZOo691JOk7MT5ML7gfJTWU2', '2014-12-06 21:13:02', 1, 1, 11),
(12, 'Y6HOPPxSPiN8uRzzEuIiiz0yIBCctb2fMms3uvC4', '2014-12-06 21:13:02', 1, 1, 12),
(13, 'dCdgFmqhj8NWlZWzg5nRGauVARPVNxpf0kJ6XZUY', '2014-12-06 21:13:02', 1, 1, 13),
(14, 'm9scXaL8wf3LpJh13IBVZtwxfj3UpbEOX6Nsh2PF', '2014-12-06 21:13:02', 1, 1, 14),
(15, 'hcQiP7CboUVE1QbTYgjm0aGCa7X3J8QKExGn9AnI', '2014-12-06 21:13:02', 1, 1, 15),
(16, 'gV8KsE51XObh9oDII55GS9tS8qzWeX7ooC2a80mN', '2014-12-06 21:13:02', 1, 1, 16),
(17, 'SnOkVaspJdkHSciV0aPYacXaplkTCVOa6j8bFQhE', '2014-12-06 21:13:02', 1, 1, 17),
(18, 'qQvw9SoKFPRkqqV6cCd9FksBhV1ok1JtaOrTLD4q', '2014-12-06 21:13:02', 1, 1, 18),
(19, 'uSDxT1J2TPszVg0WvbHEw64ak7pinNJgpdOtAIAk', '2014-12-06 21:13:02', 1, 1, 19),
(20, '0HImIE6A3Njt9i2DgQHIrkflCwoMWzRymWVSA2Fd', '2014-12-06 21:13:02', 1, 1, 20),
(21, 'nfsJEOQOnEFx3SqWtsmAIyq3vg736QCf5Cmdu26t', '2014-12-06 21:13:02', 1, 1, 21);
COMMIT;