-- MySQL Script generated by MySQL Workbench
-- Tue Oct  1 23:14:34 2019
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema YekCMS
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema YekCMS
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `YekCMS` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin ;
USE `YekCMS` ;

-- -----------------------------------------------------
-- Table `YekCMS`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `YekCMS`.`users` (
  `uid` CHAR(46) NOT NULL,
  `username` VARCHAR(45) NOT NULL,
  `mail` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `activation_key` VARCHAR(255) NOT NULL,
  `registered` DATETIME NOT NULL,
  `status` INT(11) NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`uid`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `YekCMS`.`router`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `YekCMS`.`router` (
  `id` INT(9) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `type` VARCHAR(45) NOT NULL,
  `route` VARCHAR(45) NOT NULL,
  `method` VARCHAR(45) NOT NULL,
  `path` VARCHAR(45) NOT NULL,
  `menu` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `YekCMS`.`meta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `YekCMS`.`meta` (
  `id` INT(9) NOT NULL,
  `object_uid` CHAR(46) NOT NULL,
  `meta_key` VARCHAR(45) NULL,
  `meta_value` LONGTEXT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_usermeta_users_idx` (`object_uid` ASC),
  CONSTRAINT `fk_usermeta_users`
    FOREIGN KEY (`object_uid`)
    REFERENCES `YekCMS`.`users` (`uid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_meta_router1`
    FOREIGN KEY (`object_uid`)
    REFERENCES `YekCMS`.`router` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `YekCMS`.`Settings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `YekCMS`.`Settings` (
  `id` INT(9) NOT NULL,
  `option_name` VARCHAR(45) NULL,
  `option_value` VARCHAR(45) NULL,
  `autoload` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `YekCMS`.`posts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `YekCMS`.`posts` (
  `id` INT(9) NOT NULL,
  `users_uid` CHAR(46) NOT NULL,
  `date` DATETIME NULL,
  `content` LONGTEXT NULL,
  `title` TEXT NULL,
  `excerpt` TEXT NULL,
  `status` VARCHAR(45) NULL,
  `name` VARCHAR(45) NULL,
  `modified` DATETIME NULL,
  `comment_count` INT(9) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_posts_users1_idx` (`users_uid` ASC),
  CONSTRAINT `fk_posts_users1`
    FOREIGN KEY (`users_uid`)
    REFERENCES `YekCMS`.`users` (`uid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;