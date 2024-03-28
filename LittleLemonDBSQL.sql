-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema LittleLemonDB
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema LittleLemonDB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `LittleLemonDB` ;
USE `LittleLemonDB` ;

-- -----------------------------------------------------
-- Table `LittleLemonDB`.`customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`customers` (
  `customer_id` BIGINT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `contact_details` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`customer_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`bookings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`bookings` (
  `booking_id` BIGINT NOT NULL AUTO_INCREMENT,
  `date` DATETIME NOT NULL,
  `table_number` INT NOT NULL,
  `customer_id` BIGINT NOT NULL,
  PRIMARY KEY (`booking_id`),
  INDEX `bookikngs_customer_id_fk_idx` (`customer_id` ASC) VISIBLE,
  CONSTRAINT `bookings_customer_id_fk`
    FOREIGN KEY (`customer_id`)
    REFERENCES `LittleLemonDB`.`customers` (`customer_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`delivery_status`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`delivery_status` (
  `delivery_status_id` BIGINT NOT NULL AUTO_INCREMENT,
  `date` DATETIME NOT NULL,
  `status` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`delivery_status_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`menu_items`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`menu_items` (
  `menu_items_id` BIGINT NOT NULL AUTO_INCREMENT,
  `starters` VARCHAR(255) NOT NULL,
  `courses` VARCHAR(255) NOT NULL,
  `drinks_and_desserts` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`menu_items_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`menus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`menus` (
  `menu_id` BIGINT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `cuisines` VARCHAR(255) NOT NULL,
  `menu_items_id` BIGINT NOT NULL,
  PRIMARY KEY (`menu_id`),
  INDEX `menus_menu_items_id_fk_idx` (`menu_items_id` ASC) VISIBLE,
  CONSTRAINT `menus_menu_items_id_fk`
    FOREIGN KEY (`menu_items_id`)
    REFERENCES `LittleLemonDB`.`menu_items` (`menu_items_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`staff` (
  `staff_id` BIGINT NOT NULL AUTO_INCREMENT,
  `role` VARCHAR(45) NOT NULL,
  `salary` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`staff_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`orders` (
  `order_id` BIGINT NOT NULL AUTO_INCREMENT,
  `date` DATETIME NOT NULL,
  `quantity` INT NOT NULL,
  `total_cost` DECIMAL(10,2) NOT NULL,
  `delivery_status_id` BIGINT NOT NULL,
  `booking_id` BIGINT NOT NULL,
  `customer_id` BIGINT NOT NULL,
  `menu_id` BIGINT NOT NULL,
  `staff_id` BIGINT NOT NULL,
  PRIMARY KEY (`order_id`),
  INDEX `orders_delivery_status_id_idx` (`delivery_status_id` ASC) VISIBLE,
  INDEX `orders_booking_id_fk_idx` (`booking_id` ASC) VISIBLE,
  INDEX `orders_customer_id_fk_idx` (`customer_id` ASC) VISIBLE,
  INDEX `orders_menu_id_fk_idx` (`menu_id` ASC) VISIBLE,
  INDEX `orders_staff_id_fk_idx` (`staff_id` ASC) VISIBLE,
  CONSTRAINT `orders_delivery_status_id_fk`
    FOREIGN KEY (`delivery_status_id`)
    REFERENCES `LittleLemonDB`.`delivery_status` (`delivery_status_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `orders_booking_id_fk`
    FOREIGN KEY (`booking_id`)
    REFERENCES `LittleLemonDB`.`bookings` (`booking_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `orders_customer_id_fk`
    FOREIGN KEY (`customer_id`)
    REFERENCES `LittleLemonDB`.`customers` (`customer_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `orders_menu_id_fk`
    FOREIGN KEY (`menu_id`)
    REFERENCES `LittleLemonDB`.`menus` (`menu_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `orders_staff_id_fk`
    FOREIGN KEY (`staff_id`)
    REFERENCES `LittleLemonDB`.`staff` (`staff_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
