-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`artist`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`artist` (
  `idartist` INT NOT NULL AUTO_INCREMENT,
  `artist_name` VARCHAR(45) NOT NULL,
  `artist_date` INT NOT NULL,
  PRIMARY KEY (`idartist`),
  UNIQUE INDEX `idartist_UNIQUE` (`idartist` ASC) VISIBLE,
  UNIQUE INDEX `artist_name_UNIQUE` (`artist_name` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`album`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`album` (
  `idalbum` INT NOT NULL AUTO_INCREMENT,
  `album_name` VARCHAR(45) NOT NULL,
  `album_date` INT NOT NULL,
  `artist_idartist` INT NOT NULL,
  PRIMARY KEY (`idalbum`, `artist_idartist`),
  UNIQUE INDEX `idalbum_UNIQUE` (`idalbum` ASC) VISIBLE,
  INDEX `fk_album_artist_idx` (`artist_idartist` ASC) VISIBLE,
  CONSTRAINT `fk_album_artist`
    FOREIGN KEY (`artist_idartist`)
    REFERENCES `mydb`.`artist` (`idartist`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`song`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`song` (
  `idsong` INT NOT NULL AUTO_INCREMENT,
  `song_name` VARCHAR(45) NOT NULL,
  `song_length` VARCHAR(10) NOT NULL,
  `album_idalbum` INT NOT NULL,
  `album_artist_idartist` INT NOT NULL,
  PRIMARY KEY (`idsong`, `album_idalbum`, `album_artist_idartist`),
  UNIQUE INDEX `idsong_UNIQUE` (`idsong` ASC) VISIBLE,
  INDEX `fk_song_album1_idx` (`album_idalbum` ASC, `album_artist_idartist` ASC) VISIBLE,
  CONSTRAINT `fk_song_album1`
    FOREIGN KEY (`album_idalbum` , `album_artist_idartist`)
    REFERENCES `mydb`.`album` (`idalbum` , `artist_idartist`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `mydb` ;

-- -----------------------------------------------------
-- Placeholder table for view `mydb`.`view1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`view1` (`id` INT);

-- -----------------------------------------------------
-- View `mydb`.`view1`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`view1`;
USE `mydb`;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
