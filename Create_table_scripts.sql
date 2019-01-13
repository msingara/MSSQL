-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema github_cable_sales
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema github_cable_sales
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `github_cable_sales` DEFAULT CHARACTER SET utf8 ;
USE `github_cable_sales` ;

-- -----------------------------------------------------
-- Table `github_cable_sales`.`Region`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `github_cable_sales`.`Region` (
  `head_end` VARCHAR(5) NOT NULL,
  `state` VARCHAR(2) NOT NULL,
  `city` VARCHAR(45) NOT NULL,
  `zipcode` VARCHAR(10) NOT NULL,
  `comp_code` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`head_end`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `github_cable_sales`.`Customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `github_cable_sales`.`Customer` (
  `customer_id` INT NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `first_name` VARCHAR(45) NOT NULL,
  `user_name` VARCHAR(45) NOT NULL,
  `head_end` VARCHAR(5) NOT NULL,
  PRIMARY KEY (`customer_id`),
  INDEX `fk_Customer_Region1_idx` (`head_end` ASC) VISIBLE,
  CONSTRAINT `fk_Customer_Region1`
    FOREIGN KEY (`head_end`)
    REFERENCES `github_cable_sales`.`Region` (`head_end`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `github_cable_sales`.`Plan`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `github_cable_sales`.`Plan` (
  `plan_id` INT NOT NULL,
  `plan` VARCHAR(45) NOT NULL,
  `plan_desc` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`plan_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `github_cable_sales`.`Subscription`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `github_cable_sales`.`Subscription` (
  `subscription_id` INT NOT NULL,
  `start_date` DATE NOT NULL,
  `offer_code` VARCHAR(10) NOT NULL,
  `customer_id` INT NOT NULL,
  `offer_end_date` DATE NULL,
  `plan_id` INT NOT NULL,
  PRIMARY KEY (`subscription_id`),
  INDEX `fk_Subscription_Customer_idx` (`customer_id` ASC) VISIBLE,
  INDEX `fk_Subscription_Plan_idx` (`plan_id` ASC) VISIBLE,
  CONSTRAINT `fk_Subscription_Customer`
    FOREIGN KEY (`customer_id`)
    REFERENCES `github_cable_sales`.`Customer` (`customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Subscription_Plan`
    FOREIGN KEY (`plan_id`)
    REFERENCES `github_cable_sales`.`Plan` (`plan_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `github_cable_sales`.`Billing`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `github_cable_sales`.`Billing` (
  `account_number` INT NOT NULL,
  `account_type` VARCHAR(45) NOT NULL,
  `bill_amount` DECIMAL(7,2) NOT NULL,
  `balance_due` DECIMAL(7,2) NOT NULL,
  `billing_date` DATE NOT NULL,
  `customer_id` INT NOT NULL,
  `subscription_id` INT NOT NULL,
  PRIMARY KEY (`account_number`),
  INDEX `fk_Billing_Customer1_idx` (`customer_id` ASC) VISIBLE,
  INDEX `fk_Billing_Subscription1_idx` (`subscription_id` ASC) VISIBLE,
  CONSTRAINT `fk_Billing_Customer1`
    FOREIGN KEY (`customer_id`)
    REFERENCES `github_cable_sales`.`Customer` (`customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Billing_Subscription1`
    FOREIGN KEY (`subscription_id`)
    REFERENCES `github_cable_sales`.`Subscription` (`subscription_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
