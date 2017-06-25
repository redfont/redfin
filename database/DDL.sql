/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  jrdumayag
 * Created: 05 20, 17
 */
CREATE DATABASE `redfin` /*!40100 DEFAULT CHARACTER SET latin1 */;

CREATE TABLE `redfin`.`users` (
  `user_id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(200) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `date_created` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `date_updated` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`));

create trigger user_update before update on users
for each row set NEW.date_updated = CURRENT_TIMESTAMP;

CREATE TABLE `redfin`.`categories` (
  `code` VARCHAR(50) NOT NULL,
  `description` VARCHAR(200) NULL,
  PRIMARY KEY (`code`),
  UNIQUE INDEX `code_UNIQUE` (`code` ASC));

create trigger category_update before update on categories
for each row set NEW.date_updated = CURRENT_TIMESTAMP;

ALTER TABLE `redfin`.`categories` 
ADD COLUMN `date_created` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP AFTER `description`,
ADD COLUMN `date_updated` TIMESTAMP NULL AFTER `date_created`,
ADD COLUMN `created_by` VARCHAR(100) NULL AFTER `date_updated`,
ADD COLUMN `updated_by` VARCHAR(100) NULL AFTER `created_by`;

insert into categories(`code`,`description`,`date_created`) values ('D', 'Dress', CURRENT_TIMESTAMP);
insert into categories(`code`,`description`,`date_created`) values ('S', 'Shorts', CURRENT_TIMESTAMP);

CREATE TABLE `redfin`.`expense_types` (
  `code` VARCHAR(50) NOT NULL,
  `description` VARCHAR(200) NULL,
  `date_created` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `date_updated` TIMESTAMP NULL,
  `created_by` VARCHAR(100) NULL,
  `updated_by` VARCHAR(100) NULL,
  PRIMARY KEY (`code`),
  UNIQUE INDEX `code_UNIQUE` (`code` ASC));

create trigger expense_type_update before update on expense_types
for each row set NEW.date_updated = CURRENT_TIMESTAMP;