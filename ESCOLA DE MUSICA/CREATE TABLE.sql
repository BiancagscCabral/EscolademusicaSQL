-- MySQL Workbench Forward Engineering
CREATE DATABASE escola_musica;
use escola_musica;

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- 
-- -----------------------------------------------------

-- -----------------------------------------------------
-- 
-- -----------------------------------------------------

-- -----------------------------------------------------

-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `escola_musica`.`Orquestra_Sinfonica` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_orquestra` INT NULL,
  `id_sinfonia` INT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  UNIQUE INDEX `id_orquestra_UNIQUE` (`id_orquestra` ASC) VISIBLE,
  UNIQUE INDEX `id_sinfonia_UNIQUE` (`id_sinfonia` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------

-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `escola_musica`.`Orquestra` (
  `nome` VARCHAR(45) NULL,
  `cidade` VARCHAR(45) NULL,
  `país` VARCHAR(45) NULL,
  `data` DATE NULL,
  `id` INT NOT NULL AUTO_INCREMENT,
  `Orquestra_Sinfonica_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_Orquestra_Orquestra_Sinfonica1_idx` (`Orquestra_Sinfonica_id` ASC) VISIBLE,
  CONSTRAINT `fk_Orquestra_Orquestra_Sinfonica1`
    FOREIGN KEY (`Orquestra_Sinfonica_id`)
    REFERENCES `escola_musica`.`Orquestra_Sinfonica` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------

-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `escola_musica`.`Sinfonias` (
  `id_sinfonia` INT NOT NULL,
  `nome` VARCHAR(45) NULL,
  `compositor` VARCHAR(45) NULL,
  `datacriacao` DATE NULL,
  `Orquestra_Sinfonica_id` INT NOT NULL,
  PRIMARY KEY (`id_sinfonia`),
  UNIQUE INDEX `id_sinfonia_UNIQUE` (`id_sinfonia` ASC) VISIBLE,
  INDEX `fk_Sinfonias_Orquestra_Sinfonica1_idx` (`Orquestra_Sinfonica_id` ASC) VISIBLE,
  CONSTRAINT `fk_Sinfonias_Orquestra_Sinfonica1`
    FOREIGN KEY (`Orquestra_Sinfonica_id`)
    REFERENCES `escola_musica`.`Orquestra_Sinfonica` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------

-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `escola_musica`.`EnderecoMusico` (
  `id_musico` INT NOT NULL,
  `cep` VARCHAR(10) NULL,
  `rua` VARCHAR(45) NULL,
  `bairro` VARCHAR(45) NULL,
  `cidade` VARCHAR(45) NULL,
  `complemento` VARCHAR(45) NULL,
  PRIMARY KEY (`id_musico`),
  UNIQUE INDEX `id_musico_UNIQUE` (`id_musico` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------

-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `escola_musica`.`Musicos` (
  `id_musico` INT NOT NULL,
  `nome` VARCHAR(45) NULL,
  `identidade` VARCHAR(20) NULL,
  `nacionalidade` VARCHAR(45) NULL,
  `datanasc` DATE NULL,
  `funcao` VARCHAR(45) NULL,
  `EnderecoMusico_id` INT NOT NULL,
  `Orquestra_id` INT NOT NULL,
  PRIMARY KEY (`id_musico`),
  UNIQUE INDEX `id_musico_UNIQUE` (`id_musico` ASC) VISIBLE,
  INDEX `fk_Musicos_EnderecoMusico_idx` (`EnderecoMusico_id` ASC) VISIBLE,
  INDEX `fk_Musicos_Orquestra1_idx` (`Orquestra_id` ASC) VISIBLE,
  CONSTRAINT `fk_Musicos_EnderecoMusico`
    FOREIGN KEY (`EnderecoMusico_id`)
    REFERENCES `escola_musica`.`EnderecoMusico` (`id_musico`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Musicos_Orquestra1`
    FOREIGN KEY (`Orquestra_id`)
    REFERENCES `escola_musica`.`Orquestra` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------

-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `escola_musica`.`FuncoesMusicos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_musico` INT NULL,
  `data_funcao` DATE NULL,
  `Musicos_id_musico` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_FuncoesMusicos_Musicos1_idx` (`Musicos_id_musico` ASC) VISIBLE,
  CONSTRAINT `fk_FuncoesMusicos_Musicos1`
    FOREIGN KEY (`Musicos_id_musico`)
    REFERENCES `escola_musica`.`Musicos` (`id_musico`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------

-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `escola_musica`.`Instrumentos` (
  `id_instrumento` INT NOT NULL,
  `id_musico` INT NULL,
  `desc` VARCHAR(45) NULL,
  `Musicos_id_musico` INT NOT NULL,
  PRIMARY KEY (`id_instrumento`),
  UNIQUE INDEX `id_musico_UNIQUE` (`id_musico` ASC) VISIBLE,
  INDEX `fk_Instrumentos_Musicos1_idx` (`Musicos_id_musico` ASC) VISIBLE,
  CONSTRAINT `fk_Instrumentos_Musicos1`
    FOREIGN KEY (`Musicos_id_musico`)
    REFERENCES `escola_musica`.`Musicos` (`id_musico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS TipoInstrumento (
    id_tipo INT AUTO_INCREMENT PRIMARY KEY,
    categoria VARCHAR(50) NOT NULL,
    subcategoria VARCHAR(50),
    descricao TEXT
);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;



