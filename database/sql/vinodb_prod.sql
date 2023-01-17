DROP TABLE IF EXISTS `vino__bouteille`, `vino__bouteille_personalize`, `vino__cellier`, `vino__cellier_has_vino__bouteille`, `vino__commentaire`, `vino__type`, `vino__usager`;


-- -----------------------------------------------------
-- Schema appvinoc_vinodb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `appvinoc_vinodb` ;
USE `appvinoc_vinodb` ;

-- -----------------------------------------------------
-- Table `appvinoc_vinodb`.`vino__type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `appvinoc_vinodb`.`vino__type` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `type` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `appvinoc_vinodb`.`vino__bouteille`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `appvinoc_vinodb`.`vino__bouteille` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(200) NULL,
  `type` INT(11) NULL,
  `image` VARCHAR(200) NULL,
  `code_saq` INT NULL,
  `pays` VARCHAR(45) NULL,
  `description` VARCHAR(200) NULL,
  `prix_saq` VARCHAR(45) NULL,
  `url_saq` VARCHAR(200) NULL,
  `url_img` VARCHAR(200) NULL,
  `couleur` VARCHAR(45) NULL,
  `format` varchar(20)  NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `type`
    FOREIGN KEY (`id`)
    REFERENCES `appvinoc_vinodb`.`vino__type` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `appvinoc_vinodb`.`vino__usager`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `appvinoc_vinodb`.`vino__usager` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nomusager` VARCHAR(200) NULL,
  `motdepasse` VARCHAR(200) NULL,
  `date_creation` TIMESTAMP NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `appvinoc_vinodb`.`vino__cellier`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `appvinoc_vinodb`.`vino__cellier` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_usager` INT(20) NULL,
  `nom_cellier` VARCHAR(200) NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `id_usager`
    FOREIGN KEY (`id`)
    REFERENCES `appvinoc_vinodb`.`vino__usager` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `appvinoc_vinodb`.`vino__commentaire`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `appvinoc_vinodb`.`vino__commentaire` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_usager` INT(20) NULL,
  `commentaire` VARCHAR(200) NULL,
  `id_bouteille` INT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `appvinoc_vinodb`.`vino__cellier_has_vino__bouteille`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `appvinoc_vinodb`.`vino__cellier_has_vino__bouteille` (
  `vino__cellier_id` INT NOT NULL,
  `vino__bouteille_id` INT NOT NULL,
  `quantite` VARCHAR(45) NULL,
  PRIMARY KEY (`vino__cellier_id`, `vino__bouteille_id`),
  INDEX `fk_vino__cellier_has_vino__bouteille_vino__bouteille1_idx` (`vino__bouteille_id` ASC) ,
  INDEX `fk_vino__cellier_has_vino__bouteille_vino__cellier1_idx` (`vino__cellier_id` ASC) ,
  CONSTRAINT `fk_vino__cellier_has_vino__bouteille_vino__cellier1`
    FOREIGN KEY (`vino__cellier_id`)
    REFERENCES `appvinoc_vinodb`.`vino__cellier` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_vino__cellier_has_vino__bouteille_vino__bouteille1`
    FOREIGN KEY (`vino__bouteille_id`)
    REFERENCES `appvinoc_vinodb`.`vino__bouteille` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `appvinoc_vinodb`.`vino__bouteille_personalize`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `appvinoc_vinodb`.`vino__bouteille_personalize` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(200) NULL,
  `description` VARCHAR(200) NULL,
  `vino__cellier_has_vino__bouteille_vino__cellier_id` INT NOT NULL,
  `vino__cellier_has_vino__bouteille_vino__bouteille_id` INT NOT NULL,
  `provenance` VARCHAR(45) NULL,
  `couleur` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_vino__bouteille_personalize_vino__cellier_has_vino__bout_idx` (`vino__cellier_has_vino__bouteille_vino__cellier_id` ASC, `vino__cellier_has_vino__bouteille_vino__bouteille_id` ASC) ,
  CONSTRAINT `id`
    FOREIGN KEY (`id`)
    REFERENCES `appvinoc_vinodb`.`vino__bouteille` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_vino__bouteille_personalize_vino__cellier_has_vino__boutei1`
    FOREIGN KEY (`vino__cellier_has_vino__bouteille_vino__cellier_id` , `vino__cellier_has_vino__bouteille_vino__bouteille_id`)
    REFERENCES `appvinoc_vinodb`.`vino__cellier_has_vino__bouteille` (`vino__cellier_id` , `vino__bouteille_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



