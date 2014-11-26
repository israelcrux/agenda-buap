-- MySQL Script generated by MySQL Workbench
-- 11/26/14 10:59:45
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema buap-comunication
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `buap-comunication` ;

-- -----------------------------------------------------
-- Schema buap-comunication
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `buap-comunication` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `buap-comunication` ;

-- -----------------------------------------------------
-- Table `buap-comunication`.`users_types`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `buap-comunication`.`users_types` ;

CREATE TABLE IF NOT EXISTS `buap-comunication`.`users_types` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  `description` TEXT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `buap-comunication`.`academic_administrative_units`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `buap-comunication`.`academic_administrative_units` ;

CREATE TABLE IF NOT EXISTS `buap-comunication`.`academic_administrative_units` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(80) NOT NULL,
  `description` TEXT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `buap-comunication`.`users`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `buap-comunication`.`users` ;

CREATE TABLE IF NOT EXISTS `buap-comunication`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(50) NOT NULL,
  `last_name` VARCHAR(50) NOT NULL,
  `email` VARCHAR(50) NOT NULL,
  `password` VARCHAR(60) NOT NULL,
  `phone` VARCHAR(10) NULL,
  `extension_phone` VARCHAR(5) NULL,
  `status` TINYINT(1) NOT NULL DEFAULT 2 COMMENT '0 Inactive\n1 Active\n2 Activation required',
  `remember_token` VARCHAR(100) NULL,
  `user_type_id` INT NOT NULL DEFAULT 1,
  `academic_administrative_unit_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_users_user_type1_idx` (`user_type_id` ASC),
  INDEX `fk_users_academic_administrative_unit1_idx` (`academic_administrative_unit_id` ASC),
  CONSTRAINT `fk_users_user_type1`
    FOREIGN KEY (`user_type_id`)
    REFERENCES `buap-comunication`.`users_types` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_users_academic_administrative_unit1`
    FOREIGN KEY (`academic_administrative_unit_id`)
    REFERENCES `buap-comunication`.`academic_administrative_units` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `buap-comunication`.`events`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `buap-comunication`.`events` ;

CREATE TABLE IF NOT EXISTS `buap-comunication`.`events` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_dci` VARCHAR(6) NOT NULL,
  `name` VARCHAR(100) NOT NULL,
  `start_day` DATE NOT NULL,
  `end_day` DATE NOT NULL,
  `place` VARCHAR(50) NOT NULL,
  `time` TIME NOT NULL,
  `has_cost` TINYINT(1) NOT NULL,
  `directed_to` ENUM('Público en general', 'Comunidad BUAP', 'Profesores', 'Estudiantes') NOT NULL,
  `link` VARCHAR(100) NULL,
  `description` TEXT NULL,
  `dci_status` ENUM('No Aprobado', 'Pendiente', 'En Proceso', 'Aprobado') NOT NULL DEFAULT 'Pendiente' COMMENT '0 No Aprobado\n1 Pendiente\n2 En Proceso\n3 Aprobado',
  `user_status` ENUM('Activo', 'Inactivo') NOT NULL DEFAULT 'Activo',
  `created_at` DATETIME NOT NULL,
  `updated_at` DATETIME NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_events_users1_idx` (`user_id` ASC),
  CONSTRAINT `fk_events_users1`
    FOREIGN KEY (`user_id`)
    REFERENCES `buap-comunication`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `buap-comunication`.`services`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `buap-comunication`.`services` ;

CREATE TABLE IF NOT EXISTS `buap-comunication`.`services` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `description` TEXT NULL,
  `observations` TEXT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `buap-comunication`.`requests`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `buap-comunication`.`requests` ;

CREATE TABLE IF NOT EXISTS `buap-comunication`.`requests` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `request_number` INT NOT NULL,
  `post_number` INT NOT NULL,
  `date` DATE NOT NULL,
  `justification` TEXT NULL,
  `request` VARCHAR(100) NOT NULL,
  `academic_administrative_unit_id` INT NOT NULL,
  `event_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_requests_academic_administrative_units1_idx` (`academic_administrative_unit_id` ASC),
  INDEX `fk_requests_events1_idx` (`event_id` ASC),
  CONSTRAINT `fk_requests_academic_administrative_units1`
    FOREIGN KEY (`academic_administrative_unit_id`)
    REFERENCES `buap-comunication`.`academic_administrative_units` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_requests_events1`
    FOREIGN KEY (`event_id`)
    REFERENCES `buap-comunication`.`events` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `buap-comunication`.`printed`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `buap-comunication`.`printed` ;

CREATE TABLE IF NOT EXISTS `buap-comunication`.`printed` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `material` VARCHAR(30) NOT NULL,
  `size` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `buap-comunication`.`digital`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `buap-comunication`.`digital` ;

CREATE TABLE IF NOT EXISTS `buap-comunication`.`digital` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `size` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `buap-comunication`.`audio`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `buap-comunication`.`audio` ;

CREATE TABLE IF NOT EXISTS `buap-comunication`.`audio` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `length` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `buap-comunication`.`tv`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `buap-comunication`.`tv` ;

CREATE TABLE IF NOT EXISTS `buap-comunication`.`tv` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `length` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `buap-comunication`.`users_auth_operations`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `buap-comunication`.`users_auth_operations` ;

CREATE TABLE IF NOT EXISTS `buap-comunication`.`users_auth_operations` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `token` VARCHAR(40) NOT NULL,
  `expiration` DATETIME NOT NULL,
  `type` TINYINT(1) NOT NULL COMMENT '1 Activate user\n2 Change password',
  `used` TINYINT(1) NOT NULL COMMENT '0 Not used\n1 Used',
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_users_auth_operations_users1_idx` (`user_id` ASC),
  CONSTRAINT `fk_users_auth_operations_users1`
    FOREIGN KEY (`user_id`)
    REFERENCES `buap-comunication`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `buap-comunication`.`event_service`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `buap-comunication`.`event_service` ;

CREATE TABLE IF NOT EXISTS `buap-comunication`.`event_service` (
  `event_id` INT NOT NULL,
  `service_id` INT NOT NULL,
  `start_service` DATE NOT NULL,
  `end_service` DATE NOT NULL,
  `status` ENUM('No Aprobado', 'Pendiente', 'En Proceso', 'Aprobado') NOT NULL DEFAULT 'Pendiente',
  PRIMARY KEY (`event_id`, `service_id`),
  INDEX `fk_events_has_services_services1_idx` (`service_id` ASC),
  INDEX `fk_events_has_services_events1_idx` (`event_id` ASC),
  CONSTRAINT `fk_events_has_services_events1`
    FOREIGN KEY (`event_id`)
    REFERENCES `buap-comunication`.`events` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_events_has_services_services1`
    FOREIGN KEY (`service_id`)
    REFERENCES `buap-comunication`.`services` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `buap-comunication`.`witnesses`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `buap-comunication`.`witnesses` ;

CREATE TABLE IF NOT EXISTS `buap-comunication`.`witnesses` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  `description` VARCHAR(100) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `buap-comunication`.`resources_sources`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `buap-comunication`.`resources_sources` ;

CREATE TABLE IF NOT EXISTS `buap-comunication`.`resources_sources` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL COMMENT 'ENUM(\'Tesoreria\', \'Fondo fijo\', \'Apoyos especiales\', \'Otros\')',
  `description` TEXT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `buap-comunication`.`event_witness`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `buap-comunication`.`event_witness` ;

CREATE TABLE IF NOT EXISTS `buap-comunication`.`event_witness` (
  `event_id` INT NOT NULL,
  `witness_id` INT NOT NULL,
  `file` VARCHAR(100) NOT NULL DEFAULT 'NOT FILE',
  PRIMARY KEY (`event_id`, `witness_id`),
  INDEX `fk_events_has_witnesses_witnesses1_idx` (`witness_id` ASC),
  INDEX `fk_events_has_witnesses_events1_idx` (`event_id` ASC),
  CONSTRAINT `fk_events_has_witnesses_events1`
    FOREIGN KEY (`event_id`)
    REFERENCES `buap-comunication`.`events` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_events_has_witnesses_witnesses1`
    FOREIGN KEY (`witness_id`)
    REFERENCES `buap-comunication`.`witnesses` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `buap-comunication`.`event_resource_source`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `buap-comunication`.`event_resource_source` ;

CREATE TABLE IF NOT EXISTS `buap-comunication`.`event_resource_source` (
  `event_id` INT NOT NULL,
  `resource_source_id` INT NOT NULL,
  PRIMARY KEY (`event_id`, `resource_source_id`),
  INDEX `fk_events_has_resource_source_resource_source1_idx` (`resource_source_id` ASC),
  INDEX `fk_events_has_resource_source_events1_idx` (`event_id` ASC),
  CONSTRAINT `fk_events_has_resource_source_events1`
    FOREIGN KEY (`event_id`)
    REFERENCES `buap-comunication`.`events` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_events_has_resource_source_resource_source1`
    FOREIGN KEY (`resource_source_id`)
    REFERENCES `buap-comunication`.`resources_sources` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `buap-comunication`.`support_materials`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `buap-comunication`.`support_materials` ;

CREATE TABLE IF NOT EXISTS `buap-comunication`.`support_materials` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `file` VARCHAR(100) NOT NULL,
  `event_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_support_materials_events1_idx` (`event_id` ASC),
  CONSTRAINT `fk_support_materials_events1`
    FOREIGN KEY (`event_id`)
    REFERENCES `buap-comunication`.`events` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `buap-comunication`.`users_types`
-- -----------------------------------------------------
START TRANSACTION;
USE `buap-comunication`;
INSERT INTO `buap-comunication`.`users_types` (`id`, `name`, `description`) VALUES (NULL, 'Cliente', 'Este usuario es de tipo cliente');
INSERT INTO `buap-comunication`.`users_types` (`id`, `name`, `description`) VALUES (NULL, 'Proveedor', 'Este usuario es de tipo proveedor');
INSERT INTO `buap-comunication`.`users_types` (`id`, `name`, `description`) VALUES (NULL, 'DCI', 'Este usuario es de tipo DCI');

COMMIT;


-- -----------------------------------------------------
-- Data for table `buap-comunication`.`academic_administrative_units`
-- -----------------------------------------------------
START TRANSACTION;
USE `buap-comunication`;
INSERT INTO `buap-comunication`.`academic_administrative_units` (`id`, `name`, `description`) VALUES (1, 'Facultad de Ciencias de la Computación', NULL);
INSERT INTO `buap-comunication`.`academic_administrative_units` (`id`, `name`, `description`) VALUES (2, 'Facultad de Administración', NULL);
INSERT INTO `buap-comunication`.`academic_administrative_units` (`id`, `name`, `description`) VALUES (3, 'Facultad de Arquitectura', NULL);
INSERT INTO `buap-comunication`.`academic_administrative_units` (`id`, `name`, `description`) VALUES (4, 'Dirección de Comunicación Institucional', NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `buap-comunication`.`users`
-- -----------------------------------------------------
START TRANSACTION;
USE `buap-comunication`;
INSERT INTO `buap-comunication`.`users` (`id`, `first_name`, `last_name`, `email`, `password`, `phone`, `extension_phone`, `status`, `remember_token`, `user_type_id`, `academic_administrative_unit_id`) VALUES (1, 'Javier ', 'Aguila', 'sjaca10@buap.mx', '$2a$10$hmOFJoVrG8XJCmLk34zIKe.pz4ndUNhfAlF.Jx5.P6R1L3jsyvRrG', NULL, NULL, 1, NULL, 1, 1);
INSERT INTO `buap-comunication`.`users` (`id`, `first_name`, `last_name`, `email`, `password`, `phone`, `extension_phone`, `status`, `remember_token`, `user_type_id`, `academic_administrative_unit_id`) VALUES (2, 'Israel', 'Cruz', 'jesus@buap.mx', '$2a$10$XjW2EHspJ6USdvHzB/mIDuEzPKYJ4vAYQOxCFPbot/3rXSc6GzGWq', NULL, NULL, 1, NULL, 1, 1);
INSERT INTO `buap-comunication`.`users` (`id`, `first_name`, `last_name`, `email`, `password`, `phone`, `extension_phone`, `status`, `remember_token`, `user_type_id`, `academic_administrative_unit_id`) VALUES (3, 'Ángelica ', 'Tenorio', 'angelica@buap.mx', '$2a$10$Y0GpbHflASQoa1oNmMle3OmnXU16ktkhiKxSV/PCbBKJb4NIb9l5K', NULL, NULL, 1, NULL, 1, 3);
INSERT INTO `buap-comunication`.`users` (`id`, `first_name`, `last_name`, `email`, `password`, `phone`, `extension_phone`, `status`, `remember_token`, `user_type_id`, `academic_administrative_unit_id`) VALUES (4, 'Jesús', 'Cruz', 'jesuslink00@gmail.com', '$2y$10$GFcVq7u..KHQkTzgM9x2qOIUFxX5S9eP/J5f27dcWFZCbaZUhanPO', NULL, NULL, 1, NULL, 1, 1);
INSERT INTO `buap-comunication`.`users` (`id`, `first_name`, `last_name`, `email`, `password`, `phone`, `extension_phone`, `status`, `remember_token`, `user_type_id`, `academic_administrative_unit_id`) VALUES (5, 'Amparo', 'Merino Reyes', 'amparomx@gmail.com', '$2y$10$TaOZ3yl33Vluq.3X5tW1oODQpeD1W8YY0EM8p7qfSv3O/Gq4JmvGO', '2224807645', '5266', 1, NULL, 1, 4);

COMMIT;


-- -----------------------------------------------------
-- Data for table `buap-comunication`.`events`
-- -----------------------------------------------------
START TRANSACTION;
USE `buap-comunication`;
INSERT INTO `buap-comunication`.`events` (`id`, `id_dci`, `name`, `start_day`, `end_day`, `place`, `time`, `has_cost`, `directed_to`, `link`, `description`, `dci_status`, `user_status`, `created_at`, `updated_at`, `user_id`) VALUES (1, '141110', '1er Torneo Sabatino de Ajedrez Blitz para no clasificados', '2014-11-15 ', '2014-11-15', 'Complejo Cultural Universitario', '08:00:00', 0, 'Público en general', 'http://www.complejocultural.buap.mx', 'Aprende en el Parque del Ajedrez con nuestros Talleres de Ajedrez para todas las edades, los sábados y domingos de 13:00 a 14:00 horas, sin costo.  Desde los nombres de las piezas y posición inicial, conocer el campo de batalla, el tablero, movimientos básicos de las piezas hasta jugadas y tablas. Lugar: Parque del Ajedrez Presentaciones: Venta de boletos: Entrada Libre Promociones: No hay promoción', 'No Aprobado', 'Activo', '2014-11-23 17:05:00', '2014-11-23 17:05:00', 4);
INSERT INTO `buap-comunication`.`events` (`id`, `id_dci`, `name`, `start_day`, `end_day`, `place`, `time`, `has_cost`, `directed_to`, `link`, `description`, `dci_status`, `user_status`, `created_at`, `updated_at`, `user_id`) VALUES (2, '141108', 'Ballet Folklórico de México de Amalia Hernández', '2014-11-13 ', '2014-11-13', 'Complejo Cultural Universitario', '20:30:00', 1, 'Público en general', 'http://www.complejocultural.buap.mx', 'La Banda El Recodo de Cruz Lizárraga busca seguir \"Haciendo historia\" con su último disco con nuevos estilos pero manteniendo su esencia, que se suma a la lista de más de 200 discos del grupo de origen mexicano y que incluye temas compuestos por Horacio Palencia, Luciano Luna, Juan José Leyva y Luis Siqueiros y contiene 13 temas inéditos. La Banda el Recodo de Don Cruz Lizárraga estará en Puebla presentándose por primera vez en auditorio siendo un evento más íntimo para promocionar su más reciente material discográfico y para celebrar 75 años de trayectoria de la llamada LA MADRE DE TODAS LAS BANDAS. Esta gran agrupación que cumple 75 años de trayectoria y que ha sido la única banda regional mexicana en tocar en los 5 continentes, cumpliendo así con una gran trayectoria musical que dio origen con su fundador Q.E.P.D DON CRUZ LIZARRAGA en el año de 1937 y fue hasta el año de 1938 que se le nombro LA BANDA EL RECODO de CRUZ LIZARRAGA. Precios: Gran VIP $1728, Vip $1566, Vip B $1458, Luneta $1242, Luneta B $1134, Platea $918, Platea B $810, Palcos $594, Galería $324.  Lugar: Auditorio Presentaciones: Diciembre 18, 20:30 hrs. Venta de boletos: CCU - BOLETERA  Taquillas Del complejo Auditorio: Lunes a Domingo de 10:00 a 19:00 hrs. Teléfono 229 55 00 ext. 2651 Teatro: Lunes a Sábado de 10:00 a 19:00 hrs. Promociones: No hay promoción', 'No Aprobado', 'Activo', '2014-11-23 17:05:00', '2014-11-23 17:05:00', 4);
INSERT INTO `buap-comunication`.`events` (`id`, `id_dci`, `name`, `start_day`, `end_day`, `place`, `time`, `has_cost`, `directed_to`, `link`, `description`, `dci_status`, `user_status`, `created_at`, `updated_at`, `user_id`) VALUES (3, '141110', 'Los Ángeles Azules Sinfónico Regresa Al Complejo', '2014-11-15 ', '2014-11-15 ', 'Complejo Cultural Universitario', '17:00:00', 1, 'Público en general', 'http://www.complejocultural.buap.mx', 'La Banda El Recodo de Cruz Lizárraga busca seguir \"Haciendo historia\" con su último disco con nuevos estilos pero manteniendo su esencia, que se suma a la lista de más de 200 discos del grupo de origen mexicano y que incluye temas compuestos por Horacio Palencia, Luciano Luna, Juan José Leyva y Luis Siqueiros y contiene 13 temas inéditos. La Banda el Recodo de Don Cruz Lizárraga estará en Puebla presentándose por primera vez en auditorio siendo un evento más íntimo para promocionar su más reciente material discográfico y para celebrar 75 años de trayectoria de la llamada LA MADRE DE TODAS LAS BANDAS. Esta gran agrupación que cumple 75 años de trayectoria y que ha sido la única banda regional mexicana en tocar en los 5 continentes, cumpliendo así con una gran trayectoria musical que dio origen con su fundador Q.E.P.D DON CRUZ LIZARRAGA en el año de 1937 y fue hasta el año de 1938 que se le nombro LA BANDA EL RECODO de CRUZ LIZARRAGA. Precios: Gran VIP $1728, Vip $1566, Vip B $1458, Luneta $1242, Luneta B $1134, Platea $918, Platea B $810, Palcos $594, Galería $324.  Lugar: Auditorio Presentaciones: Diciembre 18, 20:30 hrs. Venta de boletos: CCU - BOLETERA  Taquillas Del complejo Auditorio: Lunes a Domingo de 10:00 a 19:00 hrs. Teléfono 229 55 00 ext. 2651 Teatro: Lunes a Sábado de 10:00 a 19:00 hrs. Promociones: No hay promoción', 'Pendiente', 'Activo', '2014-11-23 17:05:00', '2014-11-23 17:05:00', 4);
INSERT INTO `buap-comunication`.`events` (`id`, `id_dci`, `name`, `start_day`, `end_day`, `place`, `time`, `has_cost`, `directed_to`, `link`, `description`, `dci_status`, `user_status`, `created_at`, `updated_at`, `user_id`) VALUES (4, '141108', 'México al Son de la Banda', '2014-11-13 ', '2014-11-13 ', 'Complejo Cultural Universitario', '11:00:00', 1, 'Público en general', 'http://www.complejocultural.buap.mx', 'Tradiciones de México Lugar: Andador Cultural Presentaciones: Noviembre 21, 18:00 hrs. Noviembre 28, 18:00 hrs. Venta de boletos: Día del evento en Teatro Promociones: No hay promoción', 'Pendiente', 'Activo', '2014-11-23 17:05:00', '2014-11-23 17:05:00', 4);
INSERT INTO `buap-comunication`.`events` (`id`, `id_dci`, `name`, `start_day`, `end_day`, `place`, `time`, `has_cost`, `directed_to`, `link`, `description`, `dci_status`, `user_status`, `created_at`, `updated_at`, `user_id`) VALUES (5, '141108', 'México al Son de la Banda', '2014-11-13 ', '2014-11-13 ', 'Complejo Cultural Universitario', '17:00:00', 1, 'Público en general', 'http://www.complejocultural.buap.mx', 'Tradiciones de México Lugar: Andador Cultural Presentaciones: Noviembre 21, 18:00 hrs. Noviembre 28, 18:00 hrs. Venta de boletos: Día del evento en Teatro Promociones: No hay promoción', 'En Proceso', 'Activo', '2014-11-23 17:05:00', '2014-11-23 17:05:00', 4);
INSERT INTO `buap-comunication`.`events` (`id`, `id_dci`, `name`, `start_day`, `end_day`, `place`, `time`, `has_cost`, `directed_to`, `link`, `description`, `dci_status`, `user_status`, `created_at`, `updated_at`, `user_id`) VALUES (6, '141110', 'México al Son de la Banda', '2014-11-15 ', '2014-11-15 ', 'Complejo Cultural Universitario', '12:00:00', 1, 'Público en general', 'http://www.complejocultural.buap.mx', 'Tradiciones de México Lugar: Andador Cultural Presentaciones: Noviembre 21, 18:00 hrs. Noviembre 28, 18:00 hrs. Venta de boletos: Día del evento en Teatro Promociones: No hay promoción', 'En Proceso', 'Activo', '2014-11-23 17:05:00', '2014-11-23 17:05:00', 4);
INSERT INTO `buap-comunication`.`events` (`id`, `id_dci`, `name`, `start_day`, `end_day`, `place`, `time`, `has_cost`, `directed_to`, `link`, `description`, `dci_status`, `user_status`, `created_at`, `updated_at`, `user_id`) VALUES (7, '141110', 'Salsa El Taller', '2014-12-08', '2014-12-08', 'Complejo Cultural Universitario', '19:00:00', 1, 'Público en general', 'http://www.complejocultural.buap.mx', '¡Vuelve al CCU \"Salsa, el taller\"! La mejor forma de aprender a bailar. Este 8, 9 y 10 de diciembre aprende a bailar en el CCU con Willy Saavedra. ¡Inscripciones abiertas! Asegura tu lugar por depósito bancario BANCOMER Cta 2758845425 Importante: Conserva tu papeleta bancaria. Donativo: $550.00 (por persona) Si depositas antes del 1 de diciembre. Donativo: $600.00 (por persona) El dia del evento. Incluye:  9 horas clase Master Show de Bienvenida 5 boletos cover para bailar en Mambo Café Puebla. Participa en RIFAS y PREMIOS de nuestros patrocinadores. Si no tienes pareja... aquí te la encontrarás!!! Lugar: Centro de Seminarios Presentaciones: Diciembre 08, 19:00 hrs. a 22:00 hrs. Diciembre 09, 19:00 hrs. a 22:00 hrs. Diciembre 10, 19:00 hrs. a 22:00 hrs. Venta de boletos: Por depósito bancario a la cuenta de Bancomer 2758845425. Importante: conserva tu papeleta bancaria. Promociones: No hay promoción', 'Aprobado', 'Activo', '2014-11-23 17:05:00', '2014-11-23 17:05:00', 4);
INSERT INTO `buap-comunication`.`events` (`id`, `id_dci`, `name`, `start_day`, `end_day`, `place`, `time`, `has_cost`, `directed_to`, `link`, `description`, `dci_status`, `user_status`, `created_at`, `updated_at`, `user_id`) VALUES (8, '141110', 'Salsa El Taller', '2014-12-09', '2014-12-09', 'Complejo Cultural Universitario', '19:00:00', 1, 'Público en general', 'http://www.complejocultural.buap.mx', '¡Vuelve al CCU \"Salsa, el taller\"! La mejor forma de aprender a bailar. Este 8, 9 y 10 de diciembre aprende a bailar en el CCU con Willy Saavedra. ¡Inscripciones abiertas! Asegura tu lugar por depósito bancario BANCOMER Cta 2758845425 Importante: Conserva tu papeleta bancaria. Donativo: $550.00 (por persona) Si depositas antes del 1 de diciembre. Donativo: $600.00 (por persona) El dia del evento. Incluye:  9 horas clase Master Show de Bienvenida 5 boletos cover para bailar en Mambo Café Puebla. Participa en RIFAS y PREMIOS de nuestros patrocinadores. Si no tienes pareja... aquí te la encontrarás!!! Lugar: Centro de Seminarios Presentaciones: Diciembre 08, 19:00 hrs. a 22:00 hrs. Diciembre 09, 19:00 hrs. a 22:00 hrs. Diciembre 10, 19:00 hrs. a 22:00 hrs. Venta de boletos: Por depósito bancario a la cuenta de Bancomer 2758845425. Importante: conserva tu papeleta bancaria. Promociones: No hay promoción', 'Aprobado', 'Activo', '2014-11-23 17:05:00', '2014-11-23 17:05:00', 4);
INSERT INTO `buap-comunication`.`events` (`id`, `id_dci`, `name`, `start_day`, `end_day`, `place`, `time`, `has_cost`, `directed_to`, `link`, `description`, `dci_status`, `user_status`, `created_at`, `updated_at`, `user_id`) VALUES (9, '141110', 'Salsa El Taller', '2014-12-10', '2014-12-10', 'Complejo Cultural Universitario', '19:00:00', 1, 'Público en general', 'http://www.complejocultural.buap.mx', '¡Vuelve al CCU \"Salsa, el taller\"! La mejor forma de aprender a bailar. Este 8, 9 y 10 de diciembre aprende a bailar en el CCU con Willy Saavedra. ¡Inscripciones abiertas! Asegura tu lugar por depósito bancario BANCOMER Cta 2758845425 Importante: Conserva tu papeleta bancaria. Donativo: $550.00 (por persona) Si depositas antes del 1 de diciembre. Donativo: $600.00 (por persona) El dia del evento. Incluye:  9 horas clase Master Show de Bienvenida 5 boletos cover para bailar en Mambo Café Puebla. Participa en RIFAS y PREMIOS de nuestros patrocinadores. Si no tienes pareja... aquí te la encontrarás!!! Lugar: Centro de Seminarios Presentaciones: Diciembre 08, 19:00 hrs. a 22:00 hrs. Diciembre 09, 19:00 hrs. a 22:00 hrs. Diciembre 10, 19:00 hrs. a 22:00 hrs. Venta de boletos: Por depósito bancario a la cuenta de Bancomer 2758845425. Importante: conserva tu papeleta bancaria. Promociones: No hay promoción', 'No Aprobado', 'Activo', '2014-11-23 17:05:00', '2014-11-23 17:05:00', 4);

COMMIT;


-- -----------------------------------------------------
-- Data for table `buap-comunication`.`services`
-- -----------------------------------------------------
START TRANSACTION;
USE `buap-comunication`;
INSERT INTO `buap-comunication`.`services` (`id`, `name`, `description`, `observations`) VALUES (1, 'Radio', 'Difusión del evento a través de la radio.', NULL);
INSERT INTO `buap-comunication`.`services` (`id`, `name`, `description`, `observations`) VALUES (2, 'TV', 'Difusión del evento a través de la televisión.', NULL);
INSERT INTO `buap-comunication`.`services` (`id`, `name`, `description`, `observations`) VALUES (3, 'Web', 'Difusión del evento a través de la web.', NULL);
INSERT INTO `buap-comunication`.`services` (`id`, `name`, `description`, `observations`) VALUES (4, 'Redes sociales', 'Difusión del evento a través de redes sociales.', NULL);
INSERT INTO `buap-comunication`.`services` (`id`, `name`, `description`, `observations`) VALUES (5, 'Medios impresos', 'Difusión del evento a través de medios impresos.', NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `buap-comunication`.`event_service`
-- -----------------------------------------------------
START TRANSACTION;
USE `buap-comunication`;
INSERT INTO `buap-comunication`.`event_service` (`event_id`, `service_id`, `start_service`, `end_service`, `status`) VALUES (1, 1, '2014-11-10', '2014-11-14', '\'Pendiente\'');
INSERT INTO `buap-comunication`.`event_service` (`event_id`, `service_id`, `start_service`, `end_service`, `status`) VALUES (2, 1, '2014-11-08', '2014-11-13', '\'Pendiente\'');
INSERT INTO `buap-comunication`.`event_service` (`event_id`, `service_id`, `start_service`, `end_service`, `status`) VALUES (2, 2, '2014-11-08', '2014-11-13', '\'Pendiente\'');
INSERT INTO `buap-comunication`.`event_service` (`event_id`, `service_id`, `start_service`, `end_service`, `status`) VALUES (3, 1, '2014-11-10', '2014-11-14', '\'Pendiente\'');
INSERT INTO `buap-comunication`.`event_service` (`event_id`, `service_id`, `start_service`, `end_service`, `status`) VALUES (3, 2, '2014-11-10', '2014-11-14', '\'Pendiente\'');
INSERT INTO `buap-comunication`.`event_service` (`event_id`, `service_id`, `start_service`, `end_service`, `status`) VALUES (3, 3, '2014-11-10', '2014-11-14', '\'Pendiente\'');
INSERT INTO `buap-comunication`.`event_service` (`event_id`, `service_id`, `start_service`, `end_service`, `status`) VALUES (4, 1, '2014-11-08', '2014-11-13', '\'Pendiente\'');
INSERT INTO `buap-comunication`.`event_service` (`event_id`, `service_id`, `start_service`, `end_service`, `status`) VALUES (4, 2, '2014-11-08', '2014-11-13', '\'Pendiente\'');
INSERT INTO `buap-comunication`.`event_service` (`event_id`, `service_id`, `start_service`, `end_service`, `status`) VALUES (4, 3, '2014-11-08', '2014-11-13', '\'Pendiente\'');
INSERT INTO `buap-comunication`.`event_service` (`event_id`, `service_id`, `start_service`, `end_service`, `status`) VALUES (4, 4, '2014-11-08', '2014-11-13', '\'Pendiente\'');
INSERT INTO `buap-comunication`.`event_service` (`event_id`, `service_id`, `start_service`, `end_service`, `status`) VALUES (5, 1, '2014-11-08', '2014-11-13', '\'Pendiente\'');
INSERT INTO `buap-comunication`.`event_service` (`event_id`, `service_id`, `start_service`, `end_service`, `status`) VALUES (5, 2, '2014-11-08', '2014-11-13', '\'Pendiente\'');
INSERT INTO `buap-comunication`.`event_service` (`event_id`, `service_id`, `start_service`, `end_service`, `status`) VALUES (5, 3, '2014-11-08', '2014-11-13', '\'Pendiente\'');
INSERT INTO `buap-comunication`.`event_service` (`event_id`, `service_id`, `start_service`, `end_service`, `status`) VALUES (5, 4, '2014-11-08', '2014-11-13', '\'Pendiente\'');
INSERT INTO `buap-comunication`.`event_service` (`event_id`, `service_id`, `start_service`, `end_service`, `status`) VALUES (5, 5, '2014-11-08', '2014-11-13', '\'Pendiente\'');
INSERT INTO `buap-comunication`.`event_service` (`event_id`, `service_id`, `start_service`, `end_service`, `status`) VALUES (6, 1, '2014-11-10', '2014-11-14', '\'Pendiente\'');
INSERT INTO `buap-comunication`.`event_service` (`event_id`, `service_id`, `start_service`, `end_service`, `status`) VALUES (7, 1, '2014-12-01', '2014-12-08', '\'Pendiente\'');
INSERT INTO `buap-comunication`.`event_service` (`event_id`, `service_id`, `start_service`, `end_service`, `status`) VALUES (7, 2, '2014-12-01', '2014-12-08', '\'Pendiente\'');
INSERT INTO `buap-comunication`.`event_service` (`event_id`, `service_id`, `start_service`, `end_service`, `status`) VALUES (8, 1, '2014-12-02', '2014-12-09', '\'Pendiente\'');
INSERT INTO `buap-comunication`.`event_service` (`event_id`, `service_id`, `start_service`, `end_service`, `status`) VALUES (8, 2, '2014-12-02', '2014-12-09', '\'Pendiente\'');
INSERT INTO `buap-comunication`.`event_service` (`event_id`, `service_id`, `start_service`, `end_service`, `status`) VALUES (8, 3, '2014-12-02', '2014-12-09', '\'Pendiente\'');
INSERT INTO `buap-comunication`.`event_service` (`event_id`, `service_id`, `start_service`, `end_service`, `status`) VALUES (9, 1, '2014-12-03', '2014-12-10', '\'Pendiente\'');
INSERT INTO `buap-comunication`.`event_service` (`event_id`, `service_id`, `start_service`, `end_service`, `status`) VALUES (9, 2, '2014-12-03', '2014-12-10', '\'Pendiente\'');
INSERT INTO `buap-comunication`.`event_service` (`event_id`, `service_id`, `start_service`, `end_service`, `status`) VALUES (9, 3, '2014-12-03', '2014-12-10', '\'Pendiente\'');
INSERT INTO `buap-comunication`.`event_service` (`event_id`, `service_id`, `start_service`, `end_service`, `status`) VALUES (9, 4, '2014-12-03', '2014-12-10', '\'Pendiente\'');

COMMIT;


-- -----------------------------------------------------
-- Data for table `buap-comunication`.`witnesses`
-- -----------------------------------------------------
START TRANSACTION;
USE `buap-comunication`;
INSERT INTO `buap-comunication`.`witnesses` (`id`, `name`, `description`) VALUES (NULL, 'Ejemplar de impresión', NULL);
INSERT INTO `buap-comunication`.`witnesses` (`id`, `name`, `description`) VALUES (NULL, 'Carátula de libros, revistas o folletos', NULL);
INSERT INTO `buap-comunication`.`witnesses` (`id`, `name`, `description`) VALUES (NULL, 'Fotografías de rótulos colocados', NULL);
INSERT INTO `buap-comunication`.`witnesses` (`id`, `name`, `description`) VALUES (NULL, 'Fotografías', NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `buap-comunication`.`resources_sources`
-- -----------------------------------------------------
START TRANSACTION;
USE `buap-comunication`;
INSERT INTO `buap-comunication`.`resources_sources` (`id`, `name`, `description`) VALUES (1, 'Tesoreria', NULL);
INSERT INTO `buap-comunication`.`resources_sources` (`id`, `name`, `description`) VALUES (2, 'Fondo fijo', NULL);
INSERT INTO `buap-comunication`.`resources_sources` (`id`, `name`, `description`) VALUES (3, 'Apoyos especiales', NULL);
INSERT INTO `buap-comunication`.`resources_sources` (`id`, `name`, `description`) VALUES (4, 'Otros', NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `buap-comunication`.`event_resource_source`
-- -----------------------------------------------------
START TRANSACTION;
USE `buap-comunication`;
INSERT INTO `buap-comunication`.`event_resource_source` (`event_id`, `resource_source_id`) VALUES (1, 1);
INSERT INTO `buap-comunication`.`event_resource_source` (`event_id`, `resource_source_id`) VALUES (2, 1);
INSERT INTO `buap-comunication`.`event_resource_source` (`event_id`, `resource_source_id`) VALUES (2, 2);
INSERT INTO `buap-comunication`.`event_resource_source` (`event_id`, `resource_source_id`) VALUES (3, 1);
INSERT INTO `buap-comunication`.`event_resource_source` (`event_id`, `resource_source_id`) VALUES (3, 2);
INSERT INTO `buap-comunication`.`event_resource_source` (`event_id`, `resource_source_id`) VALUES (3, 3);
INSERT INTO `buap-comunication`.`event_resource_source` (`event_id`, `resource_source_id`) VALUES (4, 1);
INSERT INTO `buap-comunication`.`event_resource_source` (`event_id`, `resource_source_id`) VALUES (4, 2);
INSERT INTO `buap-comunication`.`event_resource_source` (`event_id`, `resource_source_id`) VALUES (4, 3);
INSERT INTO `buap-comunication`.`event_resource_source` (`event_id`, `resource_source_id`) VALUES (4, 4);
INSERT INTO `buap-comunication`.`event_resource_source` (`event_id`, `resource_source_id`) VALUES (5, 1);
INSERT INTO `buap-comunication`.`event_resource_source` (`event_id`, `resource_source_id`) VALUES (6, 1);
INSERT INTO `buap-comunication`.`event_resource_source` (`event_id`, `resource_source_id`) VALUES (6, 2);
INSERT INTO `buap-comunication`.`event_resource_source` (`event_id`, `resource_source_id`) VALUES (7, 1);
INSERT INTO `buap-comunication`.`event_resource_source` (`event_id`, `resource_source_id`) VALUES (7, 2);
INSERT INTO `buap-comunication`.`event_resource_source` (`event_id`, `resource_source_id`) VALUES (7, 3);
INSERT INTO `buap-comunication`.`event_resource_source` (`event_id`, `resource_source_id`) VALUES (8, 1);
INSERT INTO `buap-comunication`.`event_resource_source` (`event_id`, `resource_source_id`) VALUES (8, 2);
INSERT INTO `buap-comunication`.`event_resource_source` (`event_id`, `resource_source_id`) VALUES (8, 3);
INSERT INTO `buap-comunication`.`event_resource_source` (`event_id`, `resource_source_id`) VALUES (8, 4);
INSERT INTO `buap-comunication`.`event_resource_source` (`event_id`, `resource_source_id`) VALUES (9, 1);

COMMIT;

