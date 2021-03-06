-- MySQL Script generated by MySQL Workbench
-- Fri Jun 11 11:44:57 2021
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema ArkData
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema ArkData
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ArkData` DEFAULT CHARACTER SET utf8 ;
USE `ArkData` ;

-- -----------------------------------------------------
-- Table `ArkData`.`Credencial`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ArkData`.`Credencial` (
  `CodUsu` INT NOT NULL,
  `NomUsu` VARCHAR(45) NOT NULL,
  `PassUsu` VARCHAR(45) NOT NULL,
  `EmailUsu` VARCHAR(45) NOT NULL,
  Check (`EmailUsu` Like '%@%._%'),
  PRIMARY KEY (`CodUsu`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `ArkData`.`InfoDino`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ArkData`.`InfoDino` (
  `CodDino` INT NOT NULL,
  `Nomdino` VARCHAR(45) NOT NULL,
  `Domesticable` BOOL NOT NULL,
  `Usuario_CodUsu` INT NOT NULL,
  PRIMARY KEY (`CodDino`, `Usuario_CodUsu`),
  INDEX `fk_table1_Usuario1_idx` (`Usuario_CodUsu` ASC),
  CONSTRAINT `fk_table1_Usuario1`
    FOREIGN KEY (`Usuario_CodUsu`)
    REFERENCES `ArkData`.`Credencial` (`CodUsu`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ArkData`.`Zona`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ArkData`.`Zona` (
  `CodZona` INT NOT NULL,
  `NomZona` VARCHAR(45) NOT NULL,
  `DificultadZona` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`CodZona`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ArkData`.`InfoDino_has_Zona`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ArkData`.`InfoDino_has_Zona` (
  `InfoDino_CodDino` INT NOT NULL,
  `InfoDino_Usuario_CodUsu` INT NOT NULL,
  `Zona_CodZona` INT NOT NULL,
  PRIMARY KEY (`InfoDino_CodDino`, `InfoDino_Usuario_CodUsu`, `Zona_CodZona`),
  INDEX `fk_InfoDino_has_Zona_Zona1_idx` (`Zona_CodZona` ASC),
  INDEX `fk_InfoDino_has_Zona_InfoDino1_idx` (`InfoDino_CodDino` ASC, `InfoDino_Usuario_CodUsu` ASC),
  CONSTRAINT `fk_InfoDino_has_Zona_InfoDino1`
    FOREIGN KEY (`InfoDino_CodDino` , `InfoDino_Usuario_CodUsu`)
    REFERENCES `ArkData`.`InfoDino` (`CodDino` , `Usuario_CodUsu`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_InfoDino_has_Zona_Zona1`
    FOREIGN KEY (`Zona_CodZona`)
    REFERENCES `ArkData`.`Zona` (`CodZona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
