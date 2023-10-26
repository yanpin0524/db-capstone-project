-- MySQL Script generated by MySQL Workbench
-- Thu Oct 26 10:36:49 2023
-- Model: New Model    Version: 1.0
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
CREATE SCHEMA IF NOT EXISTS `LittleLemonDB` DEFAULT CHARACTER SET utf8 ;
USE `LittleLemonDB` ;

-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Bookings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Bookings` (
  `bookingID` INT NOT NULL AUTO_INCREMENT,
  `date` DATE NOT NULL,
  `tableNumber` INT NOT NULL,
  PRIMARY KEY (`bookingID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Customers` (
  `customerID` INT NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `contactDetail` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`customerID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Orders` (
  `orderID` INT NOT NULL AUTO_INCREMENT,
  `orderDate` DATE NOT NULL,
  `quantity` INT NOT NULL,
  `totalCost` INT NOT NULL,
  `bookingID` INT NULL,
  `customerID` INT NOT NULL,
  PRIMARY KEY (`orderID`),
  INDEX `bookingID_idx` (`bookingID` ASC) VISIBLE,
  INDEX `customerID_idx` (`customerID` ASC) VISIBLE,
  CONSTRAINT `bookingID`
    FOREIGN KEY (`bookingID`)
    REFERENCES `LittleLemonDB`.`Bookings` (`bookingID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `customerID`
    FOREIGN KEY (`customerID`)
    REFERENCES `LittleLemonDB`.`Customers` (`customerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`OrderDeliveryStatus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`OrderDeliveryStatus` (
  `orderDeliveryStatusID` INT NOT NULL AUTO_INCREMENT,
  `deliverDate` DATE NULL,
  `status` VARCHAR(45) NOT NULL,
  `orderID` INT NOT NULL,
  PRIMARY KEY (`orderDeliveryStatusID`),
  INDEX `orderID_idx` (`orderID` ASC) VISIBLE,
  CONSTRAINT `orderID`
    FOREIGN KEY (`orderID`)
    REFERENCES `LittleLemonDB`.`Orders` (`orderID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Menus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Menus` (
  `menuID` INT NOT NULL AUTO_INCREMENT,
  `itemName` VARCHAR(255) NOT NULL,
  `price` INT NOT NULL,
  PRIMARY KEY (`menuID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Roles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Roles` (
  `roleID` INT NOT NULL AUTO_INCREMENT,
  `roleName` VARCHAR(255) NOT NULL,
  `salary` INT NOT NULL,
  PRIMARY KEY (`roleID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Staffs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Staffs` (
  `staffID` INT NOT NULL AUTO_INCREMENT,
  `staffName` VARCHAR(255) NOT NULL,
  `roleID` INT NOT NULL,
  PRIMARY KEY (`staffID`),
  INDEX `roleID_idx` (`roleID` ASC) VISIBLE,
  CONSTRAINT `roleID`
    FOREIGN KEY (`roleID`)
    REFERENCES `LittleLemonDB`.`Roles` (`roleID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`PurchaseItems`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`PurchaseItems` (
  `purchaseItemID` INT NOT NULL,
  `menuID` INT NOT NULL,
  `orderID` INT NOT NULL,
  PRIMARY KEY (`purchaseItemID`),
  INDEX `menuID_idx` (`menuID` ASC) VISIBLE,
  INDEX `orderID_idx` (`orderID` ASC) VISIBLE,
  CONSTRAINT `purchaseItem_menuID`
    FOREIGN KEY (`menuID`)
    REFERENCES `LittleLemonDB`.`Menus` (`menuID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `purchaseItem_orderID`
    FOREIGN KEY (`orderID`)
    REFERENCES `LittleLemonDB`.`Orders` (`orderID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;