-- MySQL Script generated by MySQL Workbench
-- 02/06/15 02:55:56
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema db554509897
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `db554509897` ;

-- -----------------------------------------------------
-- Schema db554509897
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `db554509897` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `db554509897` ;

-- -----------------------------------------------------
-- Table `db554509897`.`users_types`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db554509897`.`users_types` ;

CREATE TABLE IF NOT EXISTS `db554509897`.`users_types` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  `description` TEXT NULL DEFAULT NULL,
  `created_at` DATETIME NULL DEFAULT NULL,
  `updated_at` DATETIME NULL DEFAULT NULL,
  `deleted_at` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db554509897`.`academic_administrative_units`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db554509897`.`academic_administrative_units` ;

CREATE TABLE IF NOT EXISTS `db554509897`.`academic_administrative_units` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(80) NOT NULL,
  `type` ENUM('unidades_academicas','unidades_administrativas', 'otro') NOT NULL,
  `created_at` DATETIME NULL DEFAULT NULL,
  `updated_at` DATETIME NULL DEFAULT NULL,
  `deleted_at` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db554509897`.`departments`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db554509897`.`departments` ;

CREATE TABLE IF NOT EXISTS `db554509897`.`departments` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `description` TEXT NULL DEFAULT NULL,
  `created_at` DATETIME NULL DEFAULT NULL,
  `updated_at` DATETIME NULL DEFAULT NULL,
  `deleted_at` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db554509897`.`users`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db554509897`.`users` ;

CREATE TABLE IF NOT EXISTS `db554509897`.`users` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(50) NOT NULL,
  `last_name` VARCHAR(50) NOT NULL,
  `email` VARCHAR(50) NOT NULL,
  `phone` VARCHAR(10) NULL DEFAULT NULL,
  `extension_phone` VARCHAR(5) NULL DEFAULT NULL,
  `status` TINYINT(1) NOT NULL DEFAULT 2 COMMENT '0 Inactive\n1 Active\n2 Activation required',
  `remember_token` VARCHAR(100) NULL DEFAULT NULL,
  `password` VARCHAR(60) NOT NULL,
  `created_at` DATETIME NULL DEFAULT NULL,
  `updated_at` DATETIME NULL DEFAULT NULL,
  `deleted_at` DATETIME NULL DEFAULT NULL,
  `user_type_id` BIGINT UNSIGNED NOT NULL DEFAULT 1,
  `department_id` BIGINT UNSIGNED NULL DEFAULT NULL,
  `academic_administrative_unit_id` BIGINT UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_users_user_type1_idx` (`user_type_id` ASC),
  INDEX `fk_users_academic_administrative_unit1_idx` (`academic_administrative_unit_id` ASC),
  INDEX `fk_users_department1_idx` (`department_id` ASC),
  CONSTRAINT `fk_users_user_type1`
    FOREIGN KEY (`user_type_id`)
    REFERENCES `db554509897`.`users_types` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_users_academic_administrative_unit1`
    FOREIGN KEY (`academic_administrative_unit_id`)
    REFERENCES `db554509897`.`academic_administrative_units` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_users_department1`
    FOREIGN KEY (`department_id`)
    REFERENCES `db554509897`.`departments` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db554509897`.`events`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db554509897`.`events` ;

CREATE TABLE IF NOT EXISTS `db554509897`.`events` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_dci` VARCHAR(6) NOT NULL,
  `name` VARCHAR(100) NOT NULL,
  `start_day` DATE NOT NULL,
  `end_day` DATE NOT NULL,
  `place` VARCHAR(50) NOT NULL,
  `time` TIME NOT NULL,
  `has_cost` TINYINT(1) NOT NULL,
  `directed_to` ENUM('Público en general', 'Comunidad BUAP', 'Profesores', 'Estudiantes') NOT NULL,
  `link` VARCHAR(100) NULL DEFAULT NULL,
  `description` TEXT NULL DEFAULT NULL,
  `dci_status` ENUM('Pendiente', 'En Proceso', 'Atendido') NOT NULL DEFAULT 'Pendiente' COMMENT 'Pendiente: Nadie ha visto el evento\nEn Proceso: Por lo menos un jefe de algún servicio solicitado ha asignado tareas a sus empleados sobre este evento.\nAtendido: Todos los jefes de las respectivas áreas han marcado su respectivo servicio como atendido. (Todos los empleados de los diferentes departamentos han completado todas sus tareas.',
  `created_at` DATETIME NULL DEFAULT NULL,
  `updated_at` DATETIME NULL DEFAULT NULL,
  `deleted_at` DATETIME NULL DEFAULT NULL,
  `user_id` BIGINT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_events_users1_idx` (`user_id` ASC),
  CONSTRAINT `fk_events_users1`
    FOREIGN KEY (`user_id`)
    REFERENCES `db554509897`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db554509897`.`services`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db554509897`.`services` ;

CREATE TABLE IF NOT EXISTS `db554509897`.`services` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `description` TEXT NULL DEFAULT NULL,
  `observations` TEXT NULL DEFAULT NULL,
  `created_at` DATETIME NULL DEFAULT NULL,
  `updated_at` DATETIME NULL DEFAULT NULL,
  `deleted_at` DATETIME NULL DEFAULT NULL,
  `department_id` BIGINT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_services_department1_idx` (`department_id` ASC),
  CONSTRAINT `fk_services_department1`
    FOREIGN KEY (`department_id`)
    REFERENCES `db554509897`.`departments` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db554509897`.`requests`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db554509897`.`requests` ;

CREATE TABLE IF NOT EXISTS `db554509897`.`requests` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `request_number` INT NOT NULL,
  `post_number` INT NOT NULL,
  `date` DATE NOT NULL,
  `justification` TEXT NULL DEFAULT NULL,
  `request` VARCHAR(100) NOT NULL,
  `created_at` DATETIME NULL DEFAULT NULL,
  `updated_at` DATETIME NULL DEFAULT NULL,
  `deleted_at` DATETIME NULL DEFAULT NULL,
  `academic_administrative_unit_id` BIGINT UNSIGNED NOT NULL,
  `event_id` BIGINT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_requests_academic_administrative_units1_idx` (`academic_administrative_unit_id` ASC),
  INDEX `fk_requests_events1_idx` (`event_id` ASC),
  CONSTRAINT `fk_requests_academic_administrative_units1`
    FOREIGN KEY (`academic_administrative_unit_id`)
    REFERENCES `db554509897`.`academic_administrative_units` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_requests_events1`
    FOREIGN KEY (`event_id`)
    REFERENCES `db554509897`.`events` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db554509897`.`users_auth_operations`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db554509897`.`users_auth_operations` ;

CREATE TABLE IF NOT EXISTS `db554509897`.`users_auth_operations` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `token` VARCHAR(40) NOT NULL,
  `used` TINYINT(1) NOT NULL DEFAULT 0,
  `expiration` DATETIME NOT NULL,
  `type` TINYINT(1) NOT NULL COMMENT '1 Activate user\n2 Change password',
  `created_at` DATETIME NULL DEFAULT NULL,
  `updated_at` DATETIME NULL DEFAULT NULL,
  `deleted_at` DATETIME NULL DEFAULT NULL,
  `user_id` BIGINT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_users_auth_operations_users1_idx` (`user_id` ASC),
  CONSTRAINT `fk_users_auth_operations_users1`
    FOREIGN KEY (`user_id`)
    REFERENCES `db554509897`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db554509897`.`event_service`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db554509897`.`event_service` ;

CREATE TABLE IF NOT EXISTS `db554509897`.`event_service` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `start_service` DATE NOT NULL,
  `end_service` DATE NOT NULL,
  `dci_status` ENUM('Pendiente', 'En Proceso', 'Atendido', 'Aprobado') NOT NULL DEFAULT 'Pendiente' COMMENT 'Pendiente: El jefe de cada área esta por asignar las tareas a sus empleados\nEn Proceso: Se ha asignado por lo menos una tarea a algún empleado sobre el servicio\nAtendido: Todos los empleados del área que atienden el servicio han completado sus tareas',
  `created_at` DATETIME NULL DEFAULT NULL,
  `in_process_at` DATETIME NULL DEFAULT NULL,
  `attended_at` DATETIME NULL DEFAULT NULL,
  `updated_at` DATETIME NULL DEFAULT NULL,
  `deleted_at` DATETIME NULL DEFAULT NULL,
  `event_id` BIGINT UNSIGNED NOT NULL,
  `service_id` BIGINT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_events_has_services_services1_idx` (`service_id` ASC),
  INDEX `fk_events_has_services_events1_idx` (`event_id` ASC),
  CONSTRAINT `fk_events_has_services_events1`
    FOREIGN KEY (`event_id`)
    REFERENCES `db554509897`.`events` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_events_has_services_services1`
    FOREIGN KEY (`service_id`)
    REFERENCES `db554509897`.`services` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db554509897`.`witnesses`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db554509897`.`witnesses` ;

CREATE TABLE IF NOT EXISTS `db554509897`.`witnesses` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  `description` VARCHAR(100) NULL DEFAULT NULL,
  `created_at` DATETIME NULL DEFAULT NULL,
  `updated_at` DATETIME NULL DEFAULT NULL,
  `deleted_at` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db554509897`.`resources_sources`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db554509897`.`resources_sources` ;

CREATE TABLE IF NOT EXISTS `db554509897`.`resources_sources` (
  `id` BIGINT UNSIGNED NOT NULL,
  `name` VARCHAR(50) NOT NULL,
  `description` TEXT NULL DEFAULT NULL,
  `created_at` DATETIME NULL DEFAULT NULL,
  `updated_at` DATETIME NULL DEFAULT NULL,
  `deleted_at` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db554509897`.`event_witness`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db554509897`.`event_witness` ;

CREATE TABLE IF NOT EXISTS `db554509897`.`event_witness` (
  `file` VARCHAR(100) NOT NULL DEFAULT 'NOT FILE',
  `dci_status` ENUM('No Aprobado', 'Pendiente', 'En Proceso', 'Aprobado') NOT NULL DEFAULT 'Pendiente',
  `created_at` DATETIME NULL DEFAULT NULL,
  `updated_at` DATETIME NULL DEFAULT NULL,
  `deleted_at` DATETIME NULL DEFAULT NULL,
  `event_id` BIGINT UNSIGNED NOT NULL,
  `witness_id` BIGINT UNSIGNED NOT NULL,
  PRIMARY KEY (`event_id`, `witness_id`),
  INDEX `fk_events_has_witnesses_witnesses1_idx` (`witness_id` ASC),
  INDEX `fk_events_has_witnesses_events1_idx` (`event_id` ASC),
  CONSTRAINT `fk_events_has_witnesses_events1`
    FOREIGN KEY (`event_id`)
    REFERENCES `db554509897`.`events` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_events_has_witnesses_witnesses1`
    FOREIGN KEY (`witness_id`)
    REFERENCES `db554509897`.`witnesses` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db554509897`.`event_resource_source`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db554509897`.`event_resource_source` ;

CREATE TABLE IF NOT EXISTS `db554509897`.`event_resource_source` (
  `created_at` DATETIME NULL DEFAULT NULL,
  `updated_at` DATETIME NULL DEFAULT NULL,
  `deleted_at` DATETIME NULL DEFAULT NULL,
  `event_id` BIGINT UNSIGNED NOT NULL,
  `resource_source_id` BIGINT UNSIGNED NOT NULL,
  PRIMARY KEY (`event_id`, `resource_source_id`),
  INDEX `fk_events_has_resource_source_resource_source1_idx` (`resource_source_id` ASC),
  INDEX `fk_events_has_resource_source_events1_idx` (`event_id` ASC),
  CONSTRAINT `fk_events_has_resource_source_events1`
    FOREIGN KEY (`event_id`)
    REFERENCES `db554509897`.`events` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_events_has_resource_source_resource_source1`
    FOREIGN KEY (`resource_source_id`)
    REFERENCES `db554509897`.`resources_sources` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db554509897`.`support_materials`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db554509897`.`support_materials` ;

CREATE TABLE IF NOT EXISTS `db554509897`.`support_materials` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `original_name` VARCHAR(100) NOT NULL,
  `file` VARCHAR(100) NOT NULL,
  `created_at` DATETIME NULL DEFAULT NULL,
  `updated_at` DATETIME NULL DEFAULT NULL,
  `deleted_at` DATETIME NULL DEFAULT NULL,
  `event_id` BIGINT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_support_materials_events1_idx` (`event_id` ASC),
  CONSTRAINT `fk_support_materials_events1`
    FOREIGN KEY (`event_id`)
    REFERENCES `db554509897`.`events` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db554509897`.`tasks`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db554509897`.`tasks` ;

CREATE TABLE IF NOT EXISTS `db554509897`.`tasks` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `status` ENUM('Pendiente', 'Completa') NOT NULL DEFAULT 'Pendiente' COMMENT 'Pendiente: La tarea fue creada\nCompleta: El empleado marca la tarea que se le asignó como completa',
  `description` TEXT NOT NULL,
  `comment` TEXT NULL DEFAULT NULL,
  `created_at` DATETIME NULL DEFAULT NULL,
  `completed_at` DATETIME NULL DEFAULT NULL,
  `updated_at` DATETIME NULL DEFAULT NULL,
  `deleted_at` DATETIME NULL DEFAULT NULL,
  `user_id` BIGINT UNSIGNED NOT NULL,
  `event_service_id` BIGINT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_tasks_users1_idx` (`user_id` ASC),
  INDEX `fk_tasks_event_service1_idx` (`event_service_id` ASC),
  CONSTRAINT `fk_tasks_users1`
    FOREIGN KEY (`user_id`)
    REFERENCES `db554509897`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tasks_event_service1`
    FOREIGN KEY (`event_service_id`)
    REFERENCES `db554509897`.`event_service` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


-- -----------------------------------------------------
-- Data for table `db554509897`.`users_types`
-- -----------------------------------------------------
START TRANSACTION;
USE `db554509897`;
INSERT INTO `db554509897`.`users_types` (`id`, `name`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES (1, 'Cliente', NULL, NULL, NULL, NULL);
INSERT INTO `db554509897`.`users_types` (`id`, `name`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES (2, 'Empleado DCI', NULL, NULL, NULL, NULL);
INSERT INTO `db554509897`.`users_types` (`id`, `name`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES (3, 'Jefe DCI', NULL, NULL, NULL, NULL);
INSERT INTO `db554509897`.`users_types` (`id`, `name`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES (4, 'Administrador', NULL, NULL, NULL, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `db554509897`.`academic_administrative_units`
-- -----------------------------------------------------
START TRANSACTION;
USE `db554509897`;
INSERT INTO `db554509897`.`academic_administrative_units` (`id`, `name`, `type`) VALUES (1, 'Centro Universitario de Vinculación y T.', 'unidades_administrativas');
INSERT INTO `db554509897`.`academic_administrative_units` (`id`, `name`, `type`) VALUES (2, 'Complejo Cultural Universitario', 'unidades_administrativas');
INSERT INTO `db554509897`.`academic_administrative_units` (`id`, `name`, `type`) VALUES (3, 'Contraloría General', 'unidades_administrativas');
INSERT INTO `db554509897`.`academic_administrative_units` (`id`, `name`, `type`) VALUES (4, 'CUPREDER', 'unidades_administrativas');
INSERT INTO `db554509897`.`academic_administrative_units` (`id`, `name`, `type`) VALUES (5, 'Defensoría de los Derechos Universitarios', 'unidades_administrativas');
INSERT INTO `db554509897`.`academic_administrative_units` (`id`, `name`, `type`) VALUES (6, 'Departamento  de Adquisiciones, Proveeduría e Inventarios', 'unidades_administrativas');
INSERT INTO `db554509897`.`academic_administrative_units` (`id`, `name`, `type`) VALUES (7, 'Departamento de Control Vehicular', 'unidades_administrativas');
INSERT INTO `db554509897`.`academic_administrative_units` (`id`, `name`, `type`) VALUES (8, 'Dirección de Acompañamiento Universitario ', 'unidades_administrativas');
INSERT INTO `db554509897`.`academic_administrative_units` (`id`, `name`, `type`) VALUES (9, 'Dirección de Administración Escolar', 'unidades_administrativas');
INSERT INTO `db554509897`.`academic_administrative_units` (`id`, `name`, `type`) VALUES (10, 'Dirección de Apoyo y Seguridad Universitaria', 'unidades_administrativas');
INSERT INTO `db554509897`.`academic_administrative_units` (`id`, `name`, `type`) VALUES (11, 'Dirección de Comunicación Institucional', 'unidades_administrativas');
INSERT INTO `db554509897`.`academic_administrative_units` (`id`, `name`, `type`) VALUES (12, 'Dirección de Contabilidad General', 'unidades_administrativas');
INSERT INTO `db554509897`.`academic_administrative_units` (`id`, `name`, `type`) VALUES (13, 'Dirección de Cultura Física', 'unidades_administrativas');
INSERT INTO `db554509897`.`academic_administrative_units` (`id`, `name`, `type`) VALUES (14, 'Dirección de Fomento Editorial ', 'unidades_administrativas');
INSERT INTO `db554509897`.`academic_administrative_units` (`id`, `name`, `type`) VALUES (15, 'Dirección de Protección Universitaria', 'unidades_administrativas');
INSERT INTO `db554509897`.`academic_administrative_units` (`id`, `name`, `type`) VALUES (16, 'Dirección de Recursos Humanos', 'unidades_administrativas');
INSERT INTO `db554509897`.`academic_administrative_units` (`id`, `name`, `type`) VALUES (17, 'Dirección de Servicio Social', 'unidades_administrativas');
INSERT INTO `db554509897`.`academic_administrative_units` (`id`, `name`, `type`) VALUES (18, 'Dirección de Servicios Generales', 'unidades_administrativas');
INSERT INTO `db554509897`.`academic_administrative_units` (`id`, `name`, `type`) VALUES (19, 'Dirección de Sistema de Información Universitaria', 'unidades_administrativas');
INSERT INTO `db554509897`.`academic_administrative_units` (`id`, `name`, `type`) VALUES (20, 'Dirección del Círculo Infantil', 'unidades_administrativas');
INSERT INTO `db554509897`.`academic_administrative_units` (`id`, `name`, `type`) VALUES (21, 'Dirección General de Bibliotecas', 'unidades_administrativas');
INSERT INTO `db554509897`.`academic_administrative_units` (`id`, `name`, `type`) VALUES (22, 'Dirección General de Educación Media Superior', 'unidades_administrativas');
INSERT INTO `db554509897`.`academic_administrative_units` (`id`, `name`, `type`) VALUES (23, 'Dirección General de Educación Superior', 'unidades_administrativas');
INSERT INTO `db554509897`.`academic_administrative_units` (`id`, `name`, `type`) VALUES (24, 'Dirección General de Innovación Educativa', 'unidades_administrativas');
INSERT INTO `db554509897`.`academic_administrative_units` (`id`, `name`, `type`) VALUES (25, 'Dirección General de Obras', 'unidades_administrativas');
INSERT INTO `db554509897`.`academic_administrative_units` (`id`, `name`, `type`) VALUES (26, 'Dirección General de Planeación Institucional', 'unidades_administrativas');
INSERT INTO `db554509897`.`academic_administrative_units` (`id`, `name`, `type`) VALUES (27, 'Farmacias Universitarias \"Alexander Fleming\"', 'unidades_administrativas');
INSERT INTO `db554509897`.`academic_administrative_units` (`id`, `name`, `type`) VALUES (28, 'Hospital Universitario de Puebla', 'unidades_administrativas');
INSERT INTO `db554509897`.`academic_administrative_units` (`id`, `name`, `type`) VALUES (29, 'Museo Universitario \"Casa de los Muñecos\"', 'unidades_administrativas');
INSERT INTO `db554509897`.`academic_administrative_units` (`id`, `name`, `type`) VALUES (30, 'Museo Universitario de Memoria Histórica', 'unidades_administrativas');
INSERT INTO `db554509897`.`academic_administrative_units` (`id`, `name`, `type`) VALUES (31, 'Oficina de  la Abogada General', 'unidades_administrativas');
INSERT INTO `db554509897`.`academic_administrative_units` (`id`, `name`, `type`) VALUES (32, 'Rectoría', 'unidades_administrativas');
INSERT INTO `db554509897`.`academic_administrative_units` (`id`, `name`, `type`) VALUES (33, 'Secretaría Administrativa', 'unidades_administrativas');
INSERT INTO `db554509897`.`academic_administrative_units` (`id`, `name`, `type`) VALUES (34, 'Secretaría General', 'unidades_administrativas');
INSERT INTO `db554509897`.`academic_administrative_units` (`id`, `name`, `type`) VALUES (35, 'Secretaría Particular de Rectoría', 'unidades_administrativas');
INSERT INTO `db554509897`.`academic_administrative_units` (`id`, `name`, `type`) VALUES (36, 'Secretaría Técnica', 'unidades_administrativas');
INSERT INTO `db554509897`.`academic_administrative_units` (`id`, `name`, `type`) VALUES (37, 'Sorteo BUAP', 'unidades_administrativas');
INSERT INTO `db554509897`.`academic_administrative_units` (`id`, `name`, `type`) VALUES (38, 'Tesorería General', 'unidades_administrativas');
INSERT INTO `db554509897`.`academic_administrative_units` (`id`, `name`, `type`) VALUES (39, 'Vicerrectoría de Docencia', 'unidades_administrativas');
INSERT INTO `db554509897`.`academic_administrative_units` (`id`, `name`, `type`) VALUES (40, 'Vicerrectoría de Extensión y Difusión de la Cultura', 'unidades_administrativas');
INSERT INTO `db554509897`.`academic_administrative_units` (`id`, `name`, `type`) VALUES (41, 'Vicerrectoría de Investigación y Estudios de Posgrado', 'unidades_administrativas');
INSERT INTO `db554509897`.`academic_administrative_units` (`id`, `name`, `type`) VALUES (42, 'Bachillerato 5 de Mayo', 'unidades_academicas');
INSERT INTO `db554509897`.`academic_administrative_units` (`id`, `name`, `type`) VALUES (43, 'Preparatoria 2 de Octubre de 1968', 'unidades_academicas');
INSERT INTO `db554509897`.`academic_administrative_units` (`id`, `name`, `type`) VALUES (44, 'Preparatoria Alfonso Calderón Moreno', 'unidades_academicas');
INSERT INTO `db554509897`.`academic_administrative_units` (`id`, `name`, `type`) VALUES (45, 'Preparatoria Emiliano Zapata', 'unidades_academicas');
INSERT INTO `db554509897`.`academic_administrative_units` (`id`, `name`, `type`) VALUES (46, 'Preparatoria Gral. Lázaro Cárdenas del Río', 'unidades_academicas');
INSERT INTO `db554509897`.`academic_administrative_units` (`id`, `name`, `type`) VALUES (47, 'Preparatoria Benito Juárez García', 'unidades_academicas');
INSERT INTO `db554509897`.`academic_administrative_units` (`id`, `name`, `type`) VALUES (48, 'Preparatoria Regional Enrique Cabrera Barroso', 'unidades_academicas');
INSERT INTO `db554509897`.`academic_administrative_units` (`id`, `name`, `type`) VALUES (49, 'Preparatoria Regional Simón Bolívar', 'unidades_academicas');
INSERT INTO `db554509897`.`academic_administrative_units` (`id`, `name`, `type`) VALUES (50, 'Preparatoria Urbana Enrique Cabrera Barroso', 'unidades_academicas');
INSERT INTO `db554509897`.`academic_administrative_units` (`id`, `name`, `type`) VALUES (51, 'Escuela de Artes', 'unidades_academicas');
INSERT INTO `db554509897`.`academic_administrative_units` (`id`, `name`, `type`) VALUES (52, 'Escuela de Artes Plásticas y Audiovisuales', 'unidades_academicas');
INSERT INTO `db554509897`.`academic_administrative_units` (`id`, `name`, `type`) VALUES (53, 'Escuela de Biología', 'unidades_academicas');
INSERT INTO `db554509897`.`academic_administrative_units` (`id`, `name`, `type`) VALUES (54, 'Facultad de Medicina Veterinaria y Zootecnia', 'unidades_academicas');
INSERT INTO `db554509897`.`academic_administrative_units` (`id`, `name`, `type`) VALUES (55, 'Facultad de Administración', 'unidades_academicas');
INSERT INTO `db554509897`.`academic_administrative_units` (`id`, `name`, `type`) VALUES (56, 'Facultad de Arquitectura', 'unidades_academicas');
INSERT INTO `db554509897`.`academic_administrative_units` (`id`, `name`, `type`) VALUES (57, 'Facultad de Ciencias de la Computación', 'unidades_academicas');
INSERT INTO `db554509897`.`academic_administrative_units` (`id`, `name`, `type`) VALUES (58, 'Facultad de Ciencias de la Comunicación', 'unidades_academicas');
INSERT INTO `db554509897`.`academic_administrative_units` (`id`, `name`, `type`) VALUES (59, 'Facultad de Ciencias de la Electrónica', 'unidades_academicas');
INSERT INTO `db554509897`.`academic_administrative_units` (`id`, `name`, `type`) VALUES (60, 'Facultad de Ciencias Físico Matemáticas', 'unidades_academicas');
INSERT INTO `db554509897`.`academic_administrative_units` (`id`, `name`, `type`) VALUES (61, 'Facultad de Ciencias Químicas', 'unidades_academicas');
INSERT INTO `db554509897`.`academic_administrative_units` (`id`, `name`, `type`) VALUES (62, 'Facultad de Contaduría', 'unidades_academicas');
INSERT INTO `db554509897`.`academic_administrative_units` (`id`, `name`, `type`) VALUES (63, 'Facultad de Cultura Física', 'unidades_academicas');
INSERT INTO `db554509897`.`academic_administrative_units` (`id`, `name`, `type`) VALUES (64, 'Facultad de Derecho y Ciencias Sociales', 'unidades_academicas');
INSERT INTO `db554509897`.`academic_administrative_units` (`id`, `name`, `type`) VALUES (65, 'Facultad de Economía', 'unidades_academicas');
INSERT INTO `db554509897`.`academic_administrative_units` (`id`, `name`, `type`) VALUES (66, 'Facultad de Enfermería', 'unidades_academicas');
INSERT INTO `db554509897`.`academic_administrative_units` (`id`, `name`, `type`) VALUES (67, 'Facultad de Estomatología', 'unidades_academicas');
INSERT INTO `db554509897`.`academic_administrative_units` (`id`, `name`, `type`) VALUES (68, 'Facultad de Filosofía y Letras', 'unidades_academicas');
INSERT INTO `db554509897`.`academic_administrative_units` (`id`, `name`, `type`) VALUES (69, 'Facultad de Ingeniería', 'unidades_academicas');
INSERT INTO `db554509897`.`academic_administrative_units` (`id`, `name`, `type`) VALUES (70, 'Facultad de Ingeniería Agrohidráulica', 'unidades_academicas');
INSERT INTO `db554509897`.`academic_administrative_units` (`id`, `name`, `type`) VALUES (71, 'Facultad de Ingeniería Química', 'unidades_academicas');
INSERT INTO `db554509897`.`academic_administrative_units` (`id`, `name`, `type`) VALUES (72, 'Facultad de Lenguas', 'unidades_academicas');
INSERT INTO `db554509897`.`academic_administrative_units` (`id`, `name`, `type`) VALUES (73, 'Facultad de Medicina', 'unidades_academicas');
INSERT INTO `db554509897`.`academic_administrative_units` (`id`, `name`, `type`) VALUES (74, 'Facultad de Psicología', 'unidades_academicas');
INSERT INTO `db554509897`.`academic_administrative_units` (`id`, `name`, `type`) VALUES (75, 'Instituto de Ciencias', 'unidades_academicas');
INSERT INTO `db554509897`.`academic_administrative_units` (`id`, `name`, `type`) VALUES (76, 'Instituto de Ciencias de Gobierno y Desarrollo Estratégico', 'unidades_academicas');
INSERT INTO `db554509897`.`academic_administrative_units` (`id`, `name`, `type`) VALUES (77, 'Instituto de Ciencias Sociales y Humanidades', 'unidades_academicas');
INSERT INTO `db554509897`.`academic_administrative_units` (`id`, `name`, `type`) VALUES (78, 'Instituto de Física', 'unidades_academicas');
INSERT INTO `db554509897`.`academic_administrative_units` (`id`, `name`, `type`) VALUES (79, 'Instituto de Fisiología', 'unidades_academicas');
INSERT INTO `db554509897`.`academic_administrative_units` (`id`, `name`, `type`) VALUES (80, 'Unidades Regionales', 'unidades_academicas');

COMMIT;


-- -----------------------------------------------------
-- Data for table `db554509897`.`departments`
-- -----------------------------------------------------
START TRANSACTION;
USE `db554509897`;
INSERT INTO `db554509897`.`departments` (`id`, `name`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES (1, 'Clientes', NULL, NULL, NULL, NULL);
INSERT INTO `db554509897`.`departments` (`id`, `name`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES (2, 'Diseño Gráfico', NULL, NULL, NULL, NULL);
INSERT INTO `db554509897`.`departments` (`id`, `name`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES (3, 'Diseño Digital', NULL, NULL, NULL, NULL);
INSERT INTO `db554509897`.`departments` (`id`, `name`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES (4, 'Radio BUAP', NULL, NULL, NULL, NULL);
INSERT INTO `db554509897`.`departments` (`id`, `name`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES (5, 'BUAP TV', NULL, NULL, NULL, NULL);
INSERT INTO `db554509897`.`departments` (`id`, `name`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES (6, 'Web BUAP', NULL, NULL, NULL, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `db554509897`.`users`
-- -----------------------------------------------------
START TRANSACTION;
USE `db554509897`;
INSERT INTO `db554509897`.`users` (`id`, `first_name`, `last_name`, `email`, `phone`, `extension_phone`, `status`, `remember_token`, `password`, `created_at`, `updated_at`, `deleted_at`, `user_type_id`, `department_id`, `academic_administrative_unit_id`) VALUES (1, 'Javier ', 'Aguila', 'sjaca10@gmail.com', '2227262898', NULL, 1, NULL, '$2a$10$M.wpiAUrThtFid2A9.4qdOpGLSy9MyEAd37IlE9a0a9fyBaUf.jya', NULL, NULL, NULL, 1, 1, 1);
INSERT INTO `db554509897`.`users` (`id`, `first_name`, `last_name`, `email`, `phone`, `extension_phone`, `status`, `remember_token`, `password`, `created_at`, `updated_at`, `deleted_at`, `user_type_id`, `department_id`, `academic_administrative_unit_id`) VALUES (2, 'Israel', 'Cruz', 'jesuslink00@gmail.com', NULL, NULL, 1, NULL, '$2a$10$Q8IqS1k3IbXL6kMfYNXbFO.AtgzWDwUOQN5yv7s2utED.yR.MEUMO', NULL, NULL, NULL, 1, 1, 2);
INSERT INTO `db554509897`.`users` (`id`, `first_name`, `last_name`, `email`, `phone`, `extension_phone`, `status`, `remember_token`, `password`, `created_at`, `updated_at`, `deleted_at`, `user_type_id`, `department_id`, `academic_administrative_unit_id`) VALUES (3, 'Arturo', 'Aguila', 'superjaca10@live.com.mx', '2227262898', NULL, 1, NULL, '$2a$10$0O7q42JfKrcvO.4XDXj9yOPjhbL4h2kIxCv1R7K4HWQkT.ZcThgWK', NULL, NULL, NULL, 2, 6, 3);
INSERT INTO `db554509897`.`users` (`id`, `first_name`, `last_name`, `email`, `phone`, `extension_phone`, `status`, `remember_token`, `password`, `created_at`, `updated_at`, `deleted_at`, `user_type_id`, `department_id`, `academic_administrative_unit_id`) VALUES (4, 'Jesús', 'Cruz', 'jr12a@hotmail.com', NULL, NULL, 1, NULL, '$2a$10$N93ev1lfFTiG8fQ0VkPra.4qVzRJ7SkyY1wPdXK9EcpwUxuDgfzPu', NULL, NULL, NULL, 2, 6, 4);
INSERT INTO `db554509897`.`users` (`id`, `first_name`, `last_name`, `email`, `phone`, `extension_phone`, `status`, `remember_token`, `password`, `created_at`, `updated_at`, `deleted_at`, `user_type_id`, `department_id`, `academic_administrative_unit_id`) VALUES (5, 'Amparo', 'Merino Reyes', 'amparomx@gmail.com', '2224807645', '5266', 1, NULL, '$2y$10$TaOZ3yl33Vluq.3X5tW1oODQpeD1W8YY0EM8p7qfSv3O/Gq4JmvGO', NULL, NULL, NULL, 1, 1, 5);
INSERT INTO `db554509897`.`users` (`id`, `first_name`, `last_name`, `email`, `phone`, `extension_phone`, `status`, `remember_token`, `password`, `created_at`, `updated_at`, `deleted_at`, `user_type_id`, `department_id`, `academic_administrative_unit_id`) VALUES (6, 'Javier Arturo', 'Aguila', 'javier@aerostato.mx', '2227262898', NULL, 1, NULL, '$2a$10$suvXa472nvfv4Sj43jD/AOVfBBCFNba8Bxad7ZARQTPD5iE90GUWS', NULL, NULL, NULL, 3, 6, 6);
INSERT INTO `db554509897`.`users` (`id`, `first_name`, `last_name`, `email`, `phone`, `extension_phone`, `status`, `remember_token`, `password`, `created_at`, `updated_at`, `deleted_at`, `user_type_id`, `department_id`, `academic_administrative_unit_id`) VALUES (7, 'Jesús Israel', 'Cruz', 'israel@aerostato.mx', NULL, NULL, 1, NULL, '$2a$10$nOcsUEkbTkj0Q2b8t3ZN9emaExLtiIuMAYH/hU3lizeul2JGXD79a', NULL, NULL, NULL, 3, 6, 7);

COMMIT;


-- -----------------------------------------------------
-- Data for table `db554509897`.`services`
-- -----------------------------------------------------
START TRANSACTION;
USE `db554509897`;
INSERT INTO `db554509897`.`services` (`id`, `name`, `description`, `observations`, `created_at`, `updated_at`, `deleted_at`, `department_id`) VALUES (1, 'Cartel', NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO `db554509897`.`services` (`id`, `name`, `description`, `observations`, `created_at`, `updated_at`, `deleted_at`, `department_id`) VALUES (2, 'Poster', NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO `db554509897`.`services` (`id`, `name`, `description`, `observations`, `created_at`, `updated_at`, `deleted_at`, `department_id`) VALUES (3, 'Lona', NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO `db554509897`.`services` (`id`, `name`, `description`, `observations`, `created_at`, `updated_at`, `deleted_at`, `department_id`) VALUES (4, 'Animaciones', NULL, NULL, NULL, NULL, NULL, 3);
INSERT INTO `db554509897`.`services` (`id`, `name`, `description`, `observations`, `created_at`, `updated_at`, `deleted_at`, `department_id`) VALUES (5, 'Recorrido Virtual', NULL, NULL, NULL, NULL, NULL, 3);
INSERT INTO `db554509897`.`services` (`id`, `name`, `description`, `observations`, `created_at`, `updated_at`, `deleted_at`, `department_id`) VALUES (6, 'Realidad Aumentada', NULL, NULL, NULL, NULL, NULL, 3);
INSERT INTO `db554509897`.`services` (`id`, `name`, `description`, `observations`, `created_at`, `updated_at`, `deleted_at`, `department_id`) VALUES (7, 'Radio Comercial ', NULL, NULL, NULL, NULL, NULL, 4);
INSERT INTO `db554509897`.`services` (`id`, `name`, `description`, `observations`, `created_at`, `updated_at`, `deleted_at`, `department_id`) VALUES (8, 'Radio Entrevista', NULL, NULL, NULL, NULL, NULL, 4);
INSERT INTO `db554509897`.`services` (`id`, `name`, `description`, `observations`, `created_at`, `updated_at`, `deleted_at`, `department_id`) VALUES (9, 'Radio Directo', NULL, NULL, NULL, NULL, NULL, 4);
INSERT INTO `db554509897`.`services` (`id`, `name`, `description`, `observations`, `created_at`, `updated_at`, `deleted_at`, `department_id`) VALUES (10, 'Comercial TV', NULL, NULL, NULL, NULL, NULL, 5);
INSERT INTO `db554509897`.`services` (`id`, `name`, `description`, `observations`, `created_at`, `updated_at`, `deleted_at`, `department_id`) VALUES (11, 'Entrevista TV', NULL, NULL, NULL, NULL, NULL, 5);
INSERT INTO `db554509897`.`services` (`id`, `name`, `description`, `observations`, `created_at`, `updated_at`, `deleted_at`, `department_id`) VALUES (12, 'Directo TV', NULL, NULL, NULL, NULL, NULL, 5);
INSERT INTO `db554509897`.`services` (`id`, `name`, `description`, `observations`, `created_at`, `updated_at`, `deleted_at`, `department_id`) VALUES (13, 'Banner Web', NULL, NULL, NULL, NULL, NULL, 6);
INSERT INTO `db554509897`.`services` (`id`, `name`, `description`, `observations`, `created_at`, `updated_at`, `deleted_at`, `department_id`) VALUES (14, 'Redes Sociales (FB, TW)', NULL, NULL, NULL, NULL, NULL, 6);
INSERT INTO `db554509897`.`services` (`id`, `name`, `description`, `observations`, `created_at`, `updated_at`, `deleted_at`, `department_id`) VALUES (15, 'Página Web', NULL, NULL, NULL, NULL, NULL, 6);

COMMIT;


-- -----------------------------------------------------
-- Data for table `db554509897`.`witnesses`
-- -----------------------------------------------------
START TRANSACTION;
USE `db554509897`;
INSERT INTO `db554509897`.`witnesses` (`id`, `name`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES (NULL, 'Ejemplar de impresión', NULL, NULL, NULL, NULL);
INSERT INTO `db554509897`.`witnesses` (`id`, `name`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES (NULL, 'Carátula de libros, revistas o folletos', NULL, NULL, NULL, NULL);
INSERT INTO `db554509897`.`witnesses` (`id`, `name`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES (NULL, 'Fotografías de rótulos colocados', NULL, NULL, NULL, NULL);
INSERT INTO `db554509897`.`witnesses` (`id`, `name`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES (NULL, 'Fotografías', NULL, NULL, NULL, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `db554509897`.`resources_sources`
-- -----------------------------------------------------
START TRANSACTION;
USE `db554509897`;
INSERT INTO `db554509897`.`resources_sources` (`id`, `name`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES (1, 'Tesoreria', NULL, NULL, NULL, NULL);
INSERT INTO `db554509897`.`resources_sources` (`id`, `name`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES (2, 'Fondo fijo', NULL, NULL, NULL, NULL);
INSERT INTO `db554509897`.`resources_sources` (`id`, `name`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES (3, 'Apoyos especiales', NULL, NULL, NULL, NULL);
INSERT INTO `db554509897`.`resources_sources` (`id`, `name`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES (4, 'Otros', NULL, NULL, NULL, NULL);

COMMIT;

