-- MySQL Script generated by MySQL Workbench
-- Tue Aug 23 01:07:23 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema goffice_db
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `goffice_db` ;

-- -----------------------------------------------------
-- Schema goffice_db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `goffice_db` DEFAULT CHARACTER SET utf8 ;
USE `goffice_db` ;

-- -----------------------------------------------------
-- Table `goffice_db`.`user_category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `goffice_db`.`user_category` ;

CREATE TABLE IF NOT EXISTS `goffice_db`.`user_category` (
  `id_category_users` INT NOT NULL AUTO_INCREMENT,
  `category_user` VARCHAR(45) NOT NULL,
  `id_users` INT NOT NULL,
  PRIMARY KEY (`id_category_users`, `id_users`),
  INDEX `fk_category_users_users_idx` (`id_users` ASC) VISIBLE,
  CONSTRAINT `fk_category_users_users`
    FOREIGN KEY (`id_users`)
    REFERENCES `goffice_db`.`users` (`id_users`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `goffice_db`.`users`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `goffice_db`.`users` ;

CREATE TABLE IF NOT EXISTS `goffice_db`.`users` (
  `id_users` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `image` VARCHAR(45) NOT NULL,
  `gender` VARCHAR(45) NOT NULL,
  `id_category_users` INT NOT NULL,
  PRIMARY KEY (`id_users`),
  INDEX `fk_users_category_users1_idx` (`id_category_users` ASC) VISIBLE,
  CONSTRAINT `fk_users_category_users1`
    FOREIGN KEY (`id_category_users`)
    REFERENCES `goffice_db`.`user_category` (`id_category_users`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `goffice_db`.`category_products`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `goffice_db`.`category_products` ;

CREATE TABLE IF NOT EXISTS `goffice_db`.`category_products` (
  `id_category_products` INT NOT NULL AUTO_INCREMENT,
  `category` VARCHAR(45) NOT NULL,
  `id_products` INT NOT NULL,
  PRIMARY KEY (`id_category_products`, `id_products`),
  INDEX `fk_category_products_products1_idx` (`id_products` ASC) VISIBLE,
  CONSTRAINT `fk_category_products_products1`
    FOREIGN KEY (`id_products`)
    REFERENCES `goffice_db`.`Products` (`id_products`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `goffice_db`.`Products`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `goffice_db`.`Products` ;

CREATE TABLE IF NOT EXISTS `goffice_db`.`Products` (
  `id_products` INT NOT NULL AUTO_INCREMENT,
  `product_name` VARCHAR(45) NOT NULL,
  `description` VARCHAR(45) NOT NULL,
  `price` INT NOT NULL,
  `discount` INT NOT NULL,
  `image` VARCHAR(45) NOT NULL,
  `stock` INT NOT NULL,
  `id_category_products` INT NOT NULL,
  PRIMARY KEY (`id_products`),
  INDEX `fk_products_category_products1_idx` (`id_category_products` ASC) VISIBLE,
  CONSTRAINT `fk_products_category_products1`
    FOREIGN KEY (`id_category_products`)
    REFERENCES `goffice_db`.`category_products` (`id_products`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;