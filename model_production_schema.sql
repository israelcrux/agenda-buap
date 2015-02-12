-- MySQL Script generated by MySQL Workbench
-- 02/12/15 02:27:17
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
CREATE SCHEMA IF NOT EXISTS `db554509897` DEFAULT CHARACTER SET utf8 ;
USE `db554509897` ;

-- -----------------------------------------------------
-- Table `db554509897`.`users_types`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db554509897`.`users_types` ;

CREATE TABLE IF NOT EXISTS `db554509897`.`users_types` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  `description` TEXT NULL DEFAULT NULL,
  `created_at` DATETIME NOT NULL,
  `updated_at` DATETIME NOT NULL,
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
  `created_at` DATETIME NOT NULL,
  `updated_at` DATETIME NOT NULL,
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
  `created_at` DATETIME NOT NULL,
  `updated_at` DATETIME NOT NULL,
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
  `status` TINYINT(1) NOT NULL DEFAULT 2 COMMENT '0 Inactive\n1 Active\n2 Activation required\n3 Authorization required',
  `remember_token` VARCHAR(100) NULL DEFAULT NULL,
  `password` VARCHAR(60) NOT NULL,
  `created_at` DATETIME NOT NULL,
  `updated_at` DATETIME NOT NULL,
  `deleted_at` DATETIME NULL DEFAULT NULL,
  `user_type_id` BIGINT UNSIGNED NOT NULL DEFAULT 1,
  `department_id` BIGINT UNSIGNED NULL DEFAULT 1,
  `academic_administrative_unit_id` BIGINT UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_users_user_type1_idx` (`user_type_id` ASC),
  INDEX `fk_users_academic_administrative_unit1_idx` (`academic_administrative_unit_id` ASC),
  INDEX `fk_users_department1_idx` (`department_id` ASC),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC),
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
  `id_dci` VARCHAR(10) NOT NULL,
  `name` VARCHAR(100) NOT NULL,
  `start_day` DATE NOT NULL,
  `end_day` DATE NOT NULL,
  `place` VARCHAR(50) NOT NULL,
  `time` TIME NOT NULL,
  `has_cost` TINYINT(1) NOT NULL,
  `directed_to` ENUM('Público en general', 'Comunidad BUAP', 'Profesores', 'Estudiantes') NOT NULL,
  `link` VARCHAR(100) NULL DEFAULT NULL,
  `description` TEXT NULL DEFAULT NULL,
  `dci_status` ENUM('Pendiente', 'En Proceso', 'Atendido') NOT NULL DEFAULT 'Pendiente' COMMENT 'Pendiente: Nadie ha visto el evento\nEn Proceso: Por lo menos un jefe de algún servicio solicitado ha asignado tareas a sus empleados sobre este evento.\nAtendido: Todos los jefes de las respectivas áreas han marcado su respectivo servicio como atendido.',
  `created_at` DATETIME NOT NULL,
  `updated_at` DATETIME NOT NULL,
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
  `created_at` DATETIME NOT NULL,
  `updated_at` DATETIME NOT NULL,
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
  `created_at` DATETIME NOT NULL,
  `updated_at` DATETIME NOT NULL,
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
  `created_at` DATETIME NOT NULL,
  `updated_at` DATETIME NOT NULL,
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
  `created_at` DATETIME NOT NULL,
  `in_process_at` DATETIME NULL DEFAULT NULL,
  `attended_at` DATETIME NULL DEFAULT NULL,
  `updated_at` DATETIME NOT NULL,
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
  `created_at` DATETIME NOT NULL,
  `updated_at` DATETIME NOT NULL,
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
  `created_at` DATETIME NOT NULL,
  `updated_at` DATETIME NOT NULL,
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
  `created_at` DATETIME NOT NULL,
  `updated_at` DATETIME NOT NULL,
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
  `created_at` DATETIME NOT NULL,
  `updated_at` DATETIME NOT NULL,
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
  `created_at` DATETIME NOT NULL,
  `updated_at` DATETIME NOT NULL,
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
  `created_at` DATETIME NOT NULL,
  `completed_at` DATETIME NULL DEFAULT NULL,
  `updated_at` DATETIME NOT NULL,
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
