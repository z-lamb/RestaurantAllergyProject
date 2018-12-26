-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema restaurantallergydb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `restaurantallergydb` ;

-- -----------------------------------------------------
-- Schema restaurantallergydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `restaurantallergydb` DEFAULT CHARACTER SET utf8 ;
USE `restaurantallergydb` ;

-- -----------------------------------------------------
-- Table `address`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `address` ;

CREATE TABLE IF NOT EXISTS `address` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `street` VARCHAR(45) NULL,
  `street2` VARCHAR(45) NULL,
  `city` VARCHAR(45) NOT NULL,
  `state` VARCHAR(45) NOT NULL,
  `zip` VARCHAR(45) NULL,
  `active` TINYINT(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

CREATE TABLE IF NOT EXISTS `user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(255) NULL,
  `last_name` VARCHAR(255) NULL,
  `date_of_birth` DATE NULL,
  `username` VARCHAR(255) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `role` VARCHAR(255) NOT NULL DEFAULT 'standard',
  `active` TINYINT(1) NOT NULL DEFAULT 1,
  `address_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC),
  INDEX `fk_user_address1_idx` (`address_id` ASC),
  CONSTRAINT `fk_user_address1`
    FOREIGN KEY (`address_id`)
    REFERENCES `address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `business_info`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `business_info` ;

CREATE TABLE IF NOT EXISTS `business_info` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `vegitarians` TINYINT(1) NULL DEFAULT 0,
  `reservations` TINYINT(1) NULL DEFAULT 0,
  `delivery` TINYINT(1) NULL DEFAULT 0,
  `take_out` TINYINT(1) NULL DEFAULT 0,
  `credit_cards` TINYINT(1) NULL DEFAULT 0,
  `mobile_pay` TINYINT(1) NULL DEFAULT 0,
  `parking` VARCHAR(45) NULL,
  `kids` TINYINT(1) NULL DEFAULT 0,
  `groups` TINYINT(1) NULL DEFAULT 0,
  `ambiance` VARCHAR(45) NULL,
  `noise_level` ENUM('QUIET', 'MODERATE', 'LOUD', 'VERYLOUD') NULL DEFAULT 'MODERATE',
  `dancing` TINYINT(1) NULL DEFAULT 0,
  `alcohol` ENUM('FULLBAR', 'BEER', 'WINE', 'LIMITED', 'NONE') NULL DEFAULT 'NONE',
  `happy_hour` TINYINT(1) NULL DEFAULT 0,
  `coat_check` TINYINT(1) NULL DEFAULT 0,
  `smoking` TINYINT(1) NULL DEFAULT 0,
  `outdoor_seating` TINYINT(1) NULL DEFAULT 0,
  `wifi` TINYINT(1) NULL DEFAULT 0,
  `tv` TINYINT(1) NULL DEFAULT 0,
  `waiter_service` TINYINT(1) NULL DEFAULT 0,
  `caters` TINYINT(1) NULL DEFAULT 0,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `restaurant`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `restaurant` ;

CREATE TABLE IF NOT EXISTS `restaurant` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `price_range` INT NOT NULL,
  `store_number` VARCHAR(45) NULL,
  `phone` VARCHAR(45) NULL,
  `website` VARCHAR(255) NULL,
  `date_created` DATETIME NOT NULL DEFAULT current_timestamp,
  `active` TINYINT(1) NOT NULL DEFAULT 1,
  `address_id` INT NOT NULL,
  `business_info_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_restaurant_address1_idx` (`address_id` ASC),
  INDEX `fk_restaurant_business_info1_idx` (`business_info_id` ASC),
  CONSTRAINT `fk_restaurant_address1`
    FOREIGN KEY (`address_id`)
    REFERENCES `address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_restaurant_business_info1`
    FOREIGN KEY (`business_info_id`)
    REFERENCES `business_info` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cuisine`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cuisine` ;

CREATE TABLE IF NOT EXISTS `cuisine` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `type` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `day_of_week`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `day_of_week` ;

CREATE TABLE IF NOT EXISTS `day_of_week` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `weekday` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hours`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `hours` ;

CREATE TABLE IF NOT EXISTS `hours` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `time` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `day_of_week_has_hours`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `day_of_week_has_hours` ;

CREATE TABLE IF NOT EXISTS `day_of_week_has_hours` (
  `day_of_week_id` INT NOT NULL,
  `hours_id` INT NOT NULL,
  PRIMARY KEY (`day_of_week_id`, `hours_id`),
  INDEX `fk_day_of_week_has_hours_hours1_idx` (`hours_id` ASC),
  INDEX `fk_day_of_week_has_hours_day_of_week_idx` (`day_of_week_id` ASC),
  CONSTRAINT `fk_day_of_week_has_hours_day_of_week`
    FOREIGN KEY (`day_of_week_id`)
    REFERENCES `day_of_week` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_day_of_week_has_hours_hours1`
    FOREIGN KEY (`hours_id`)
    REFERENCES `hours` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `review`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `review` ;

CREATE TABLE IF NOT EXISTS `review` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `text` TEXT NULL,
  `rating` VARCHAR(45) NULL,
  `date_created` DATETIME NOT NULL DEFAULT current_timestamp,
  `useful` INT NULL,
  `active` TINYINT(1) NOT NULL DEFAULT 1,
  `user_id` INT NOT NULL,
  `restaurant_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_review_user1_idx` (`user_id` ASC),
  INDEX `fk_review_restaurant1_idx` (`restaurant_id` ASC),
  CONSTRAINT `fk_review_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_review_restaurant1`
    FOREIGN KEY (`restaurant_id`)
    REFERENCES `restaurant` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `special_hours`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `special_hours` ;

CREATE TABLE IF NOT EXISTS `special_hours` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `date` DATE NULL,
  `restaurant_id` INT NOT NULL,
  `day_of_week_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_special_hours_restaurant1_idx` (`restaurant_id` ASC),
  INDEX `fk_special_hours_day_of_week1_idx` (`day_of_week_id` ASC),
  CONSTRAINT `fk_special_hours_restaurant1`
    FOREIGN KEY (`restaurant_id`)
    REFERENCES `restaurant` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_special_hours_day_of_week1`
    FOREIGN KEY (`day_of_week_id`)
    REFERENCES `day_of_week` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `good_for`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `good_for` ;

CREATE TABLE IF NOT EXISTS `good_for` (
  `id` INT NOT NULL,
  `good_for` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `menu_item`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `menu_item` ;

CREATE TABLE IF NOT EXISTS `menu_item` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `category` VARCHAR(255) NULL,
  `title` VARCHAR(255) NOT NULL,
  `description` TEXT NULL,
  `price` VARCHAR(45) NULL,
  `calories` INT NULL,
  `cooking_process` TEXT NULL,
  `active` TINYINT(1) NOT NULL DEFAULT 1,
  `restaurant_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_menu_item_restaurant1_idx` (`restaurant_id` ASC),
  CONSTRAINT `fk_menu_item_restaurant1`
    FOREIGN KEY (`restaurant_id`)
    REFERENCES `restaurant` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `delivery`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `delivery` ;

CREATE TABLE IF NOT EXISTS `delivery` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `fee` DOUBLE NULL,
  `min` DOUBLE NULL,
  `time` INT NULL,
  `business_info_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_delivery_business_info1_idx` (`business_info_id` ASC),
  CONSTRAINT `fk_delivery_business_info1`
    FOREIGN KEY (`business_info_id`)
    REFERENCES `business_info` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `allergy`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `allergy` ;

CREATE TABLE IF NOT EXISTS `allergy` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `allergen` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `restaurant_has_day_of_week`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `restaurant_has_day_of_week` ;

CREATE TABLE IF NOT EXISTS `restaurant_has_day_of_week` (
  `restaurant_id` INT NOT NULL,
  `day_of_week_id` INT NOT NULL,
  PRIMARY KEY (`restaurant_id`, `day_of_week_id`),
  INDEX `fk_restaurant_has_day_of_week_day_of_week1_idx` (`day_of_week_id` ASC),
  INDEX `fk_restaurant_has_day_of_week_restaurant1_idx` (`restaurant_id` ASC),
  CONSTRAINT `fk_restaurant_has_day_of_week_restaurant1`
    FOREIGN KEY (`restaurant_id`)
    REFERENCES `restaurant` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_restaurant_has_day_of_week_day_of_week1`
    FOREIGN KEY (`day_of_week_id`)
    REFERENCES `day_of_week` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `business_info_has_day_of_week`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `business_info_has_day_of_week` ;

CREATE TABLE IF NOT EXISTS `business_info_has_day_of_week` (
  `business_info_id` INT NOT NULL,
  `day_of_week_id` INT NOT NULL,
  PRIMARY KEY (`business_info_id`, `day_of_week_id`),
  INDEX `fk_business_info_has_day_of_week_day_of_week1_idx` (`day_of_week_id` ASC),
  INDEX `fk_business_info_has_day_of_week_business_info1_idx` (`business_info_id` ASC),
  CONSTRAINT `fk_business_info_has_day_of_week_business_info1`
    FOREIGN KEY (`business_info_id`)
    REFERENCES `business_info` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_business_info_has_day_of_week_day_of_week1`
    FOREIGN KEY (`day_of_week_id`)
    REFERENCES `day_of_week` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `business_info_has_good_for`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `business_info_has_good_for` ;

CREATE TABLE IF NOT EXISTS `business_info_has_good_for` (
  `business_info_id` INT NOT NULL,
  `good_for_id` INT NOT NULL,
  PRIMARY KEY (`business_info_id`, `good_for_id`),
  INDEX `fk_business_info_has_good_for_good_for1_idx` (`good_for_id` ASC),
  INDEX `fk_business_info_has_good_for_business_info1_idx` (`business_info_id` ASC),
  CONSTRAINT `fk_business_info_has_good_for_business_info1`
    FOREIGN KEY (`business_info_id`)
    REFERENCES `business_info` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_business_info_has_good_for_good_for1`
    FOREIGN KEY (`good_for_id`)
    REFERENCES `good_for` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `menu_item_has_allergy`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `menu_item_has_allergy` ;

CREATE TABLE IF NOT EXISTS `menu_item_has_allergy` (
  `menu_item_id` INT NOT NULL,
  `allergy_id` INT NOT NULL,
  PRIMARY KEY (`menu_item_id`, `allergy_id`),
  INDEX `fk_menu_item_has_allergy_allergy1_idx` (`allergy_id` ASC),
  INDEX `fk_menu_item_has_allergy_menu_item1_idx` (`menu_item_id` ASC),
  CONSTRAINT `fk_menu_item_has_allergy_menu_item1`
    FOREIGN KEY (`menu_item_id`)
    REFERENCES `menu_item` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_menu_item_has_allergy_allergy1`
    FOREIGN KEY (`allergy_id`)
    REFERENCES `allergy` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `restaurant_has_cuisine`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `restaurant_has_cuisine` ;

CREATE TABLE IF NOT EXISTS `restaurant_has_cuisine` (
  `restaurant_id` INT NOT NULL,
  `cuisine_id` INT NOT NULL,
  PRIMARY KEY (`restaurant_id`, `cuisine_id`),
  INDEX `fk_restaurant_has_cuisine_cuisine1_idx` (`cuisine_id` ASC),
  INDEX `fk_restaurant_has_cuisine_restaurant1_idx` (`restaurant_id` ASC),
  CONSTRAINT `fk_restaurant_has_cuisine_restaurant1`
    FOREIGN KEY (`restaurant_id`)
    REFERENCES `restaurant` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_restaurant_has_cuisine_cuisine1`
    FOREIGN KEY (`cuisine_id`)
    REFERENCES `cuisine` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE = '';
DROP USER IF EXISTS user@localhost;
SET SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
CREATE USER 'user'@'localhost' IDENTIFIED BY 'user';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'user'@'localhost';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `address`
-- -----------------------------------------------------
START TRANSACTION;
USE `restaurantallergydb`;
INSERT INTO `address` (`id`, `street`, `street2`, `city`, `state`, `zip`, `active`) VALUES (1, '10252 Carrara Terrace', NULL, 'Parker', 'CO', '80134', DEFAULT);

COMMIT;


-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `restaurantallergydb`;
INSERT INTO `user` (`id`, `first_name`, `last_name`, `date_of_birth`, `username`, `password`, `email`, `role`, `active`, `address_id`) VALUES (1, 'Zachary', 'Lamb', '1988-03-04', 'zlamb', 'zlamb', 'lamb.zachary@gmail.com', 'admin', 1, 1);
INSERT INTO `user` (`id`, `first_name`, `last_name`, `date_of_birth`, `username`, `password`, `email`, `role`, `active`, `address_id`) VALUES (2, 'Gretchen', 'Lamb', '1987-03-13', 'glamb', 'glamb', 'lamb.gretchen@gmail.com', 'standard', 1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `business_info`
-- -----------------------------------------------------
START TRANSACTION;
USE `restaurantallergydb`;
INSERT INTO `business_info` (`id`, `vegitarians`, `reservations`, `delivery`, `take_out`, `credit_cards`, `mobile_pay`, `parking`, `kids`, `groups`, `ambiance`, `noise_level`, `dancing`, `alcohol`, `happy_hour`, `coat_check`, `smoking`, `outdoor_seating`, `wifi`, `tv`, `waiter_service`, `caters`) VALUES (1, 0, 0, 0, 1, 0, 0, 'driveway', 1, 1, 'casual', 'MODERATE', 1, '1', 0, 0, 0, 1, 1, 1, 0, 0);

COMMIT;


-- -----------------------------------------------------
-- Data for table `restaurant`
-- -----------------------------------------------------
START TRANSACTION;
USE `restaurantallergydb`;
INSERT INTO `restaurant` (`id`, `name`, `price_range`, `store_number`, `phone`, `website`, `date_created`, `active`, `address_id`, `business_info_id`) VALUES (1, 'Lamb Cafe', 1, NULL, '720-618-8346', NULL, '2018-12-26 00:00:00', DEFAULT, 1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `cuisine`
-- -----------------------------------------------------
START TRANSACTION;
USE `restaurantallergydb`;
INSERT INTO `cuisine` (`id`, `type`) VALUES (1, 'Restaurant');
INSERT INTO `cuisine` (`id`, `type`) VALUES (2, 'Fast Food');
INSERT INTO `cuisine` (`id`, `type`) VALUES (3, 'Food Truck');
INSERT INTO `cuisine` (`id`, `type`) VALUES (4, 'Food');
INSERT INTO `cuisine` (`id`, `type`) VALUES (5, 'American (Traditional)');
INSERT INTO `cuisine` (`id`, `type`) VALUES (6, 'Sandwiches');
INSERT INTO `cuisine` (`id`, `type`) VALUES (7, 'Pizza');
INSERT INTO `cuisine` (`id`, `type`) VALUES (8, 'Burgers');
INSERT INTO `cuisine` (`id`, `type`) VALUES (9, 'Nightlife');
INSERT INTO `cuisine` (`id`, `type`) VALUES (10, 'Bars');
INSERT INTO `cuisine` (`id`, `type`) VALUES (11, 'Mexican');
INSERT INTO `cuisine` (`id`, `type`) VALUES (12, 'Breakfast');
INSERT INTO `cuisine` (`id`, `type`) VALUES (13, 'Brunch');
INSERT INTO `cuisine` (`id`, `type`) VALUES (14, 'Italian');
INSERT INTO `cuisine` (`id`, `type`) VALUES (15, 'American (New)');
INSERT INTO `cuisine` (`id`, `type`) VALUES (16, 'Chicken Wings');
INSERT INTO `cuisine` (`id`, `type`) VALUES (17, 'Delis');
INSERT INTO `cuisine` (`id`, `type`) VALUES (18, 'Salad');
INSERT INTO `cuisine` (`id`, `type`) VALUES (19, 'Barbeque');
INSERT INTO `cuisine` (`id`, `type`) VALUES (20, 'Sushi');
INSERT INTO `cuisine` (`id`, `type`) VALUES (21, 'Asian Fusion');
INSERT INTO `cuisine` (`id`, `type`) VALUES (22, 'Coffee');
INSERT INTO `cuisine` (`id`, `type`) VALUES (23, 'Tea');
INSERT INTO `cuisine` (`id`, `type`) VALUES (24, 'Chinese');
INSERT INTO `cuisine` (`id`, `type`) VALUES (25, 'Ice Cream');
INSERT INTO `cuisine` (`id`, `type`) VALUES (26, 'Frozen Yogurt');
INSERT INTO `cuisine` (`id`, `type`) VALUES (27, 'Seafood');
INSERT INTO `cuisine` (`id`, `type`) VALUES (28, 'Sports Bar');
INSERT INTO `cuisine` (`id`, `type`) VALUES (29, 'Tex-Mex');
INSERT INTO `cuisine` (`id`, `type`) VALUES (30, 'Vietnamese');
INSERT INTO `cuisine` (`id`, `type`) VALUES (31, 'Japanese');
INSERT INTO `cuisine` (`id`, `type`) VALUES (32, 'Noodles');
INSERT INTO `cuisine` (`id`, `type`) VALUES (33, 'Steakhouse');
INSERT INTO `cuisine` (`id`, `type`) VALUES (34, 'Indian');
INSERT INTO `cuisine` (`id`, `type`) VALUES (35, 'Soup');
INSERT INTO `cuisine` (`id`, `type`) VALUES (36, 'Cafe');
INSERT INTO `cuisine` (`id`, `type`) VALUES (37, 'Chicken Shop');
INSERT INTO `cuisine` (`id`, `type`) VALUES (38, 'Thai');
INSERT INTO `cuisine` (`id`, `type`) VALUES (39, 'Bakeries');
INSERT INTO `cuisine` (`id`, `type`) VALUES (40, 'Desert');
INSERT INTO `cuisine` (`id`, `type`) VALUES (41, 'Wine Bar');
INSERT INTO `cuisine` (`id`, `type`) VALUES (42, 'Buffet');
INSERT INTO `cuisine` (`id`, `type`) VALUES (43, 'Cater');
INSERT INTO `cuisine` (`id`, `type`) VALUES (44, 'Cocktail Bar');
INSERT INTO `cuisine` (`id`, `type`) VALUES (45, 'Beer bar');
INSERT INTO `cuisine` (`id`, `type`) VALUES (46, 'Comfort Food');
INSERT INTO `cuisine` (`id`, `type`) VALUES (47, 'Gluten-Free');
INSERT INTO `cuisine` (`id`, `type`) VALUES (48, 'Greek');
INSERT INTO `cuisine` (`id`, `type`) VALUES (49, 'Hot Dogs');
INSERT INTO `cuisine` (`id`, `type`) VALUES (50, 'Mediterranean');
INSERT INTO `cuisine` (`id`, `type`) VALUES (51, 'Poke');
INSERT INTO `cuisine` (`id`, `type`) VALUES (52, 'Southern');
INSERT INTO `cuisine` (`id`, `type`) VALUES (53, 'Bagels');
INSERT INTO `cuisine` (`id`, `type`) VALUES (54, 'Beer Garden');
INSERT INTO `cuisine` (`id`, `type`) VALUES (55, 'Brewery');
INSERT INTO `cuisine` (`id`, `type`) VALUES (56, 'Cajon/Creole');
INSERT INTO `cuisine` (`id`, `type`) VALUES (57, 'Cheesesteak');
INSERT INTO `cuisine` (`id`, `type`) VALUES (58, 'Diner');
INSERT INTO `cuisine` (`id`, `type`) VALUES (59, 'Food Stand');
INSERT INTO `cuisine` (`id`, `type`) VALUES (60, 'Irish');
INSERT INTO `cuisine` (`id`, `type`) VALUES (61, 'Korean');
INSERT INTO `cuisine` (`id`, `type`) VALUES (62, 'Pakistan');
INSERT INTO `cuisine` (`id`, `type`) VALUES (63, 'Pub');
INSERT INTO `cuisine` (`id`, `type`) VALUES (64, 'Taco');
INSERT INTO `cuisine` (`id`, `type`) VALUES (65, 'Wrap');

COMMIT;


-- -----------------------------------------------------
-- Data for table `day_of_week`
-- -----------------------------------------------------
START TRANSACTION;
USE `restaurantallergydb`;
INSERT INTO `day_of_week` (`id`, `weekday`) VALUES (1, 'Sunday');
INSERT INTO `day_of_week` (`id`, `weekday`) VALUES (2, 'Monday');
INSERT INTO `day_of_week` (`id`, `weekday`) VALUES (3, 'Tuesday');
INSERT INTO `day_of_week` (`id`, `weekday`) VALUES (4, 'Wednesday');
INSERT INTO `day_of_week` (`id`, `weekday`) VALUES (5, 'Thursday');
INSERT INTO `day_of_week` (`id`, `weekday`) VALUES (6, 'Friday');
INSERT INTO `day_of_week` (`id`, `weekday`) VALUES (7, 'Saturday');
INSERT INTO `day_of_week` (`id`, `weekday`) VALUES (8, 'Weekdays');
INSERT INTO `day_of_week` (`id`, `weekday`) VALUES (9, 'Weekends');
INSERT INTO `day_of_week` (`id`, `weekday`) VALUES (10, 'Holidays');
INSERT INTO `day_of_week` (`id`, `weekday`) VALUES (11, '7 days a week');

COMMIT;


-- -----------------------------------------------------
-- Data for table `hours`
-- -----------------------------------------------------
START TRANSACTION;
USE `restaurantallergydb`;
INSERT INTO `hours` (`id`, `time`) VALUES (1, '00:00');
INSERT INTO `hours` (`id`, `time`) VALUES (2, '00:30');
INSERT INTO `hours` (`id`, `time`) VALUES (3, '01:00');
INSERT INTO `hours` (`id`, `time`) VALUES (4, '01:30');
INSERT INTO `hours` (`id`, `time`) VALUES (5, '02:00');
INSERT INTO `hours` (`id`, `time`) VALUES (6, '02:30');
INSERT INTO `hours` (`id`, `time`) VALUES (7, '03:00');
INSERT INTO `hours` (`id`, `time`) VALUES (8, '03:30');
INSERT INTO `hours` (`id`, `time`) VALUES (9, '04:00');
INSERT INTO `hours` (`id`, `time`) VALUES (10, '04:30');
INSERT INTO `hours` (`id`, `time`) VALUES (11, '05:00');
INSERT INTO `hours` (`id`, `time`) VALUES (12, '05:30');
INSERT INTO `hours` (`id`, `time`) VALUES (13, '06:00');
INSERT INTO `hours` (`id`, `time`) VALUES (14, '06:30');
INSERT INTO `hours` (`id`, `time`) VALUES (15, '07:00');
INSERT INTO `hours` (`id`, `time`) VALUES (16, '07:30');
INSERT INTO `hours` (`id`, `time`) VALUES (17, '08:00');
INSERT INTO `hours` (`id`, `time`) VALUES (18, '08:30');
INSERT INTO `hours` (`id`, `time`) VALUES (19, '09:00');
INSERT INTO `hours` (`id`, `time`) VALUES (20, '09:30');
INSERT INTO `hours` (`id`, `time`) VALUES (21, '10:00');
INSERT INTO `hours` (`id`, `time`) VALUES (22, '10:30');
INSERT INTO `hours` (`id`, `time`) VALUES (23, '11:00');
INSERT INTO `hours` (`id`, `time`) VALUES (24, '11:30');
INSERT INTO `hours` (`id`, `time`) VALUES (25, '12:00');
INSERT INTO `hours` (`id`, `time`) VALUES (26, '12:30');
INSERT INTO `hours` (`id`, `time`) VALUES (27, '13:00');
INSERT INTO `hours` (`id`, `time`) VALUES (28, '13:30');
INSERT INTO `hours` (`id`, `time`) VALUES (29, '14:00');
INSERT INTO `hours` (`id`, `time`) VALUES (30, '14:30');
INSERT INTO `hours` (`id`, `time`) VALUES (31, '15:00');
INSERT INTO `hours` (`id`, `time`) VALUES (32, '15:30');
INSERT INTO `hours` (`id`, `time`) VALUES (33, '16:00');
INSERT INTO `hours` (`id`, `time`) VALUES (34, '16:30');
INSERT INTO `hours` (`id`, `time`) VALUES (35, '17:00');
INSERT INTO `hours` (`id`, `time`) VALUES (36, '17:30');
INSERT INTO `hours` (`id`, `time`) VALUES (37, '18:00');
INSERT INTO `hours` (`id`, `time`) VALUES (38, '18:30');
INSERT INTO `hours` (`id`, `time`) VALUES (39, '19:00');
INSERT INTO `hours` (`id`, `time`) VALUES (40, '19:30');
INSERT INTO `hours` (`id`, `time`) VALUES (41, '20:00');
INSERT INTO `hours` (`id`, `time`) VALUES (42, '20:30');
INSERT INTO `hours` (`id`, `time`) VALUES (43, '21:00');
INSERT INTO `hours` (`id`, `time`) VALUES (44, '21:30');
INSERT INTO `hours` (`id`, `time`) VALUES (45, '22:00');
INSERT INTO `hours` (`id`, `time`) VALUES (46, '22:30');
INSERT INTO `hours` (`id`, `time`) VALUES (47, '23:00');
INSERT INTO `hours` (`id`, `time`) VALUES (48, '23:30');
INSERT INTO `hours` (`id`, `time`) VALUES (49, 'closed');

COMMIT;


-- -----------------------------------------------------
-- Data for table `day_of_week_has_hours`
-- -----------------------------------------------------
START TRANSACTION;
USE `restaurantallergydb`;
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (1, 1);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (1, 2);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (1, 3);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (1, 4);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (1, 5);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (1, 6);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (1, 7);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (1, 8);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (1, 9);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (1, 10);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (1, 11);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (1, 12);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (1, 13);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (1, 14);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (1, 15);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (1, 16);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (1, 17);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (1, 18);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (1, 19);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (1, 20);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (1, 21);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (1, 22);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (1, 23);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (1, 24);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (1, 25);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (1, 26);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (1, 27);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (1, 28);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (1, 29);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (1, 30);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (1, 31);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (1, 32);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (1, 33);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (1, 34);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (1, 35);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (1, 36);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (1, 37);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (1, 38);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (1, 39);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (1, 40);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (1, 41);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (1, 42);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (1, 43);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (1, 44);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (1, 45);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (1, 46);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (1, 47);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (1, 48);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (2, 1);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (2, 2);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (2, 3);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (2, 4);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (2, 5);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (2, 6);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (2, 7);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (2, 8);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (2, 9);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (2, 10);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (2, 11);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (2, 12);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (2, 13);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (2, 14);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (2, 15);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (2, 16);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (2, 17);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (2, 18);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (2, 19);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (2, 20);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (2, 21);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (2, 22);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (2, 23);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (2, 24);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (2, 25);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (2, 26);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (2, 27);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (2, 28);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (2, 29);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (2, 30);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (2, 31);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (2, 32);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (2, 33);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (2, 34);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (2, 35);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (2, 36);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (2, 37);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (2, 38);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (2, 39);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (2, 40);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (2, 41);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (2, 42);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (2, 43);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (2, 44);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (2, 45);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (2, 46);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (2, 47);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (2, 48);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (3, 1);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (3, 2);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (3, 3);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (3, 4);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (3, 5);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (3, 6);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (3, 7);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (3, 8);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (3, 9);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (3, 10);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (3, 11);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (3, 12);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (3, 13);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (3, 14);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (3, 15);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (3, 16);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (3, 17);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (3, 18);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (3, 19);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (3, 20);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (3, 21);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (3, 22);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (3, 23);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (3, 24);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (3, 25);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (3, 26);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (3, 27);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (3, 28);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (3, 29);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (3, 30);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (3, 31);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (3, 32);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (3, 33);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (3, 34);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (3, 35);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (3, 36);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (3, 37);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (3, 38);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (3, 39);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (3, 40);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (3, 41);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (3, 42);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (3, 43);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (3, 44);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (3, 45);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (3, 46);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (3, 47);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (3, 48);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (4, 1);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (4, 2);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (4, 3);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (4, 4);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (4, 5);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (4, 6);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (4, 7);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (4, 8);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (4, 9);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (4, 10);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (4, 11);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (4, 12);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (4, 13);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (4, 14);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (4, 15);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (4, 16);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (4, 17);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (4, 18);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (4, 19);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (4, 20);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (4, 21);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (4, 22);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (4, 23);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (4, 24);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (4, 25);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (4, 26);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (4, 27);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (4, 28);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (4, 29);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (4, 30);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (4, 31);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (4, 32);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (4, 33);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (4, 34);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (4, 35);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (4, 36);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (4, 37);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (4, 38);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (4, 39);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (4, 40);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (4, 41);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (4, 42);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (4, 43);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (4, 44);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (4, 45);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (4, 46);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (4, 47);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (4, 48);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (5, 1);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (5, 2);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (5, 3);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (5, 4);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (5, 5);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (5, 6);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (5, 7);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (5, 8);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (5, 9);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (5, 10);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (5, 11);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (5, 12);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (5, 13);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (5, 14);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (5, 15);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (5, 16);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (5, 17);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (5, 18);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (5, 19);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (5, 20);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (5, 21);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (5, 22);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (5, 23);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (5, 24);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (5, 25);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (5, 26);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (5, 27);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (5, 28);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (5, 29);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (5, 30);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (5, 31);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (5, 32);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (5, 33);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (5, 34);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (5, 35);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (5, 36);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (5, 37);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (5, 38);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (5, 39);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (5, 40);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (5, 41);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (5, 42);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (5, 43);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (5, 44);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (5, 45);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (5, 46);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (5, 47);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (5, 48);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (6, 1);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (6, 2);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (6, 3);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (6, 4);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (6, 5);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (6, 6);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (6, 7);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (6, 8);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (6, 9);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (6, 10);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (6, 11);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (6, 12);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (6, 13);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (6, 14);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (6, 15);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (6, 16);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (6, 17);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (6, 18);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (6, 19);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (6, 20);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (6, 21);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (6, 22);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (6, 23);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (6, 24);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (6, 25);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (6, 26);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (6, 27);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (6, 28);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (6, 29);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (6, 30);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (6, 31);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (6, 32);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (6, 33);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (6, 34);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (6, 35);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (6, 36);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (6, 37);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (6, 38);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (6, 39);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (6, 40);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (6, 41);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (6, 42);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (6, 43);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (6, 44);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (6, 45);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (6, 46);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (6, 47);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (6, 48);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (7, 1);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (7, 2);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (7, 3);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (7, 4);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (7, 5);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (7, 6);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (7, 7);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (7, 8);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (7, 9);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (7, 10);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (7, 11);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (7, 12);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (7, 13);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (7, 14);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (7, 15);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (7, 16);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (7, 17);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (7, 18);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (7, 19);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (7, 20);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (7, 21);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (7, 22);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (7, 23);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (7, 24);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (7, 25);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (7, 26);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (7, 27);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (7, 28);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (7, 29);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (7, 30);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (7, 31);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (7, 32);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (7, 33);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (7, 34);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (7, 35);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (7, 36);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (7, 37);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (7, 38);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (7, 39);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (7, 40);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (7, 41);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (7, 42);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (7, 43);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (7, 44);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (7, 45);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (7, 46);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (7, 47);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (7, 48);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (8, 1);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (8, 2);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (8, 3);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (8, 4);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (8, 5);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (8, 6);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (8, 7);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (8, 8);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (8, 9);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (8, 10);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (8, 11);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (8, 12);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (8, 13);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (8, 14);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (8, 15);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (8, 16);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (8, 17);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (8, 18);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (8, 19);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (8, 20);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (8, 21);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (8, 22);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (8, 23);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (8, 24);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (8, 25);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (8, 26);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (8, 27);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (8, 28);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (8, 29);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (8, 30);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (8, 31);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (8, 32);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (8, 33);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (8, 34);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (8, 35);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (8, 36);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (8, 37);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (8, 38);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (8, 39);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (8, 40);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (8, 41);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (8, 42);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (8, 43);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (8, 44);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (8, 45);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (8, 46);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (8, 47);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (8, 48);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (9, 1);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (9, 2);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (9, 3);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (9, 4);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (9, 5);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (9, 6);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (9, 7);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (9, 8);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (9, 9);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (9, 10);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (9, 11);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (9, 12);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (9, 13);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (9, 14);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (9, 15);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (9, 16);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (9, 17);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (9, 18);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (9, 19);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (9, 20);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (9, 21);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (9, 22);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (9, 23);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (9, 24);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (9, 25);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (9, 26);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (9, 27);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (9, 28);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (9, 29);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (9, 30);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (9, 31);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (9, 32);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (9, 33);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (9, 34);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (9, 35);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (9, 36);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (9, 37);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (9, 38);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (9, 39);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (9, 40);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (9, 41);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (9, 42);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (9, 43);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (9, 44);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (9, 45);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (9, 46);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (9, 47);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (9, 48);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (10, 1);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (10, 2);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (10, 3);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (10, 4);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (10, 5);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (10, 6);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (10, 7);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (10, 8);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (10, 9);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (10, 10);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (10, 11);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (10, 12);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (10, 13);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (10, 14);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (10, 15);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (10, 16);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (10, 17);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (10, 18);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (10, 19);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (10, 20);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (10, 21);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (10, 22);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (10, 23);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (10, 24);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (10, 25);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (10, 26);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (10, 27);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (10, 28);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (10, 29);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (10, 30);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (10, 31);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (10, 32);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (10, 33);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (10, 34);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (10, 35);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (10, 36);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (10, 37);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (10, 38);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (10, 39);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (10, 40);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (10, 41);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (10, 42);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (10, 43);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (10, 44);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (10, 45);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (10, 46);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (10, 47);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (10, 48);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (11, 1);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (11, 2);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (11, 3);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (11, 4);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (11, 5);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (11, 6);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (11, 7);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (11, 8);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (11, 9);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (11, 10);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (11, 11);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (11, 12);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (11, 13);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (11, 14);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (11, 15);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (11, 16);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (11, 17);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (11, 18);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (11, 19);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (11, 20);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (11, 21);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (11, 22);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (11, 23);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (11, 24);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (11, 25);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (11, 26);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (11, 27);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (11, 28);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (11, 29);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (11, 30);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (11, 31);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (11, 32);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (11, 33);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (11, 34);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (11, 35);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (11, 36);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (11, 37);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (11, 38);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (11, 39);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (11, 40);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (11, 41);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (11, 42);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (11, 43);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (11, 44);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (11, 45);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (11, 46);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (11, 47);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (11, 48);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (1, 49);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (2, 49);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (3, 49);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (4, 49);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (5, 49);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (6, 49);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (7, 49);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (8, 49);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (9, 49);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (10, 49);
INSERT INTO `day_of_week_has_hours` (`day_of_week_id`, `hours_id`) VALUES (11, 49);

COMMIT;


-- -----------------------------------------------------
-- Data for table `special_hours`
-- -----------------------------------------------------
START TRANSACTION;
USE `restaurantallergydb`;
INSERT INTO `special_hours` (`id`, `date`, `restaurant_id`, `day_of_week_id`) VALUES (1, '2019-01-01', 1, 3);

COMMIT;


-- -----------------------------------------------------
-- Data for table `good_for`
-- -----------------------------------------------------
START TRANSACTION;
USE `restaurantallergydb`;
INSERT INTO `good_for` (`id`, `good_for`) VALUES (1, 'Breakfast');
INSERT INTO `good_for` (`id`, `good_for`) VALUES (2, 'Lunch');
INSERT INTO `good_for` (`id`, `good_for`) VALUES (3, 'Brunch');
INSERT INTO `good_for` (`id`, `good_for`) VALUES (4, 'Dinner');
INSERT INTO `good_for` (`id`, `good_for`) VALUES (5, 'Snack');
INSERT INTO `good_for` (`id`, `good_for`) VALUES (6, 'Late Night');

COMMIT;


-- -----------------------------------------------------
-- Data for table `menu_item`
-- -----------------------------------------------------
START TRANSACTION;
USE `restaurantallergydb`;
INSERT INTO `menu_item` (`id`, `category`, `title`, `description`, `price`, `calories`, `cooking_process`, `active`, `restaurant_id`) VALUES (1, 'Lunch', 'Mac N Cheese', 'Annie\'s Organic Shell Mac N Cheese', '.99', 100, 'Bring water to boil in a pot. Pour in shells. Cook until soft. Drain water. Mix milk, butter, and powder cheese.', DEFAULT, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `allergy`
-- -----------------------------------------------------
START TRANSACTION;
USE `restaurantallergydb`;
INSERT INTO `allergy` (`id`, `allergen`) VALUES (1, 'Dairy');
INSERT INTO `allergy` (`id`, `allergen`) VALUES (2, 'Eggs');
INSERT INTO `allergy` (`id`, `allergen`) VALUES (3, 'Tree Nuts');
INSERT INTO `allergy` (`id`, `allergen`) VALUES (4, 'Peanuts');
INSERT INTO `allergy` (`id`, `allergen`) VALUES (5, 'Shell Fish');
INSERT INTO `allergy` (`id`, `allergen`) VALUES (6, 'Wheat');
INSERT INTO `allergy` (`id`, `allergen`) VALUES (7, 'Soy');
INSERT INTO `allergy` (`id`, `allergen`) VALUES (8, 'Fish');
INSERT INTO `allergy` (`id`, `allergen`) VALUES (9, 'Sesame');

COMMIT;

