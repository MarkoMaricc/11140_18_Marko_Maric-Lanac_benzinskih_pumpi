-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema benzinska_pumpa
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema benzinska_pumpa
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `benzinska_pumpa` DEFAULT CHARACTER SET utf8 ;
USE `benzinska_pumpa` ;

-- -----------------------------------------------------
-- Table `benzinska_pumpa`.`BENZINSKE_STANICE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `benzinska_pumpa`.`BENZINSKE_STANICE` (
  `idStanice` INT NOT NULL,
  `Adresa` VARCHAR(50) NOT NULL,
  `Grad` VARCHAR(50) NOT NULL,
  `Drzava` VARCHAR(50) NOT NULL,
  `Telefon` VARCHAR(20) NOT NULL,
  `Naziv` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`idStanice`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `benzinska_pumpa`.`SKLADISTE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `benzinska_pumpa`.`SKLADISTE` (
  `idSkladista` INT NOT NULL,
  `BrojProizvoda` INT(11) NOT NULL,
  `ProtivPozarniSistem` TINYINT NULL,
  `Popunjenost` INT NULL,
  `Vrsta` VARCHAR(50) NOT NULL,
  `idStanice` INT(11) NOT NULL,
  PRIMARY KEY (`idSkladista`),
  INDEX `fk_SKLADISTE_BENZINSKA_STANICA1_idx` (`idStanice` ASC),
  CONSTRAINT `fk_SKLADISTE_BENZINSKA_STANICA1`
    FOREIGN KEY (`idStanice`)
    REFERENCES `benzinska_pumpa`.`BENZINSKE_STANICE` (`idStanice`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `benzinska_pumpa`.`PROIZVOD`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `benzinska_pumpa`.`PROIZVOD` (
  `Vrsta` VARCHAR(50) NOT NULL,
  `Cena` DECIMAL(6,2) NOT NULL,
  `idSkladista` INT NOT NULL,
  PRIMARY KEY (`Vrsta`),
  INDEX `fk_PROIZVOD_SKLADISTE1_idx` (`idSkladista` ASC),
  CONSTRAINT `fk_PROIZVOD_SKLADISTE1`
    FOREIGN KEY (`idSkladista`)
    REFERENCES `benzinska_pumpa`.`SKLADISTE` (`idSkladista`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `benzinska_pumpa`.`DOBAVLJAC`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `benzinska_pumpa`.`DOBAVLJAC` (
  `idDobavljaca` INT(11) NOT NULL,
  `Naziv` VARCHAR(20) NOT NULL,
  `Adresa` VARCHAR(45) NOT NULL,
  `Telefon` VARCHAR(45) NOT NULL,
  `idStanice` INT(11) NOT NULL,
  PRIMARY KEY (`idDobavljaca`),
  INDEX `fk_Dobavljac_BENZINSKA_STANICA1_idx` (`idStanice` ASC),
  CONSTRAINT `fk_Dobavljac_BENZINSKA_STANICA1`
    FOREIGN KEY (`idStanice`)
    REFERENCES `benzinska_pumpa`.`BENZINSKE_STANICE` (`idStanice`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `benzinska_pumpa`.`KASA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `benzinska_pumpa`.`KASA` (
  `idKase` INT(11) NOT NULL,
  `MaxDnevniPazar` DECIMAL(6,2) NOT NULL,
  `Datum` DATE NOT NULL,
  `idStanice` INT(11) NOT NULL,
  PRIMARY KEY (`idKase`),
  INDEX `fk_KASA_BENZINSKA_STANICA1_idx` (`idStanice` ASC),
  CONSTRAINT `fk_KASA_BENZINSKA_STANICA1`
    FOREIGN KEY (`idStanice`)
    REFERENCES `benzinska_pumpa`.`BENZINSKE_STANICE` (`idStanice`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `benzinska_pumpa`.`RACUN`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `benzinska_pumpa`.`RACUN` (
  `idRacuna` INT NOT NULL,
  `Datum` DATETIME NOT NULL,
  `Cena` DECIMAL(6,2) NOT NULL,
  `idKase` INT(11) NOT NULL,
  PRIMARY KEY (`idRacuna`),
  INDEX `fk_RACUN_KASA1_idx` (`idKase` ASC),
  CONSTRAINT `fk_RACUN_KASA1`
    FOREIGN KEY (`idKase`)
    REFERENCES `benzinska_pumpa`.`KASA` (`idKase`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `benzinska_pumpa`.`STAVKA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `benzinska_pumpa`.`STAVKA` (
  `idStavke` INT NOT NULL,
  `Kolicina` INT NOT NULL,
  `Cena` DECIMAL(6,2) NOT NULL,
  `idRacuna` INT(11) NOT NULL,
  `PROIZVOD_Vrsta` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`idStavke`),
  INDEX `fk_STAVKA_PROIZVOD1_idx` (`PROIZVOD_Vrsta` ASC),
  INDEX `fk_STAVKA_RACUN1_idx` (`idRacuna` ASC),
  CONSTRAINT `fk_STAVKA_PROIZVOD1`
    FOREIGN KEY (`PROIZVOD_Vrsta`)
    REFERENCES `benzinska_pumpa`.`PROIZVOD` (`Vrsta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_STAVKA_RACUN1`
    FOREIGN KEY (`idRacuna`)
    REFERENCES `benzinska_pumpa`.`RACUN` (`idRacuna`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `benzinska_pumpa`.`RADNIK`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `benzinska_pumpa`.`RADNIK` (
  `JMBG` VARCHAR(13) NOT NULL,
  `Prezime` VARCHAR(50) NOT NULL,
  `Ime` VARCHAR(50) NOT NULL,
  `Uloga` VARCHAR(40) NOT NULL,
  `Plata` DECIMAL(6,2) NOT NULL,
  `PutniTroskovi` DECIMAL(6,2) NOT NULL,
  `idStanice` INT(11) NOT NULL,
  PRIMARY KEY (`JMBG`),
  INDEX `fk_RADNIK_BENZINSKA_STANICA1_idx` (`idStanice` ASC),
  CONSTRAINT `fk_RADNIK_BENZINSKA_STANICA1`
    FOREIGN KEY (`idStanice`)
    REFERENCES `benzinska_pumpa`.`BENZINSKE_STANICE` (`idStanice`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `benzinska_pumpa`.`ANALIZA_KVALITETA_PROIZVODA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `benzinska_pumpa`.`ANALIZA_KVALITETA_PROIZVODA` (
  `idAnalize` INT NOT NULL,
  `Datum` DATETIME NOT NULL,
  `Rezultat` VARCHAR(45) NOT NULL,
  `Troskovi` DECIMAL(4,2) NOT NULL,
  `VrstaProizvoda` VARCHAR(50) NOT NULL,
  `Radnik_JMBG` VARCHAR(13) NOT NULL,
  PRIMARY KEY (`idAnalize`),
  INDEX `fk_ANALIZA_KVALITETA_PROIZVODA_PROIZVOD1_idx` (`VrstaProizvoda` ASC),
  INDEX `fk_ANALIZA_KVALITETA_PROIZVODA_RADNIK1_idx` (`Radnik_JMBG` ASC),
  CONSTRAINT `fk_ANALIZA_KVALITETA_PROIZVODA_PROIZVOD1`
    FOREIGN KEY (`VrstaProizvoda`)
    REFERENCES `benzinska_pumpa`.`PROIZVOD` (`Vrsta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ANALIZA_KVALITETA_PROIZVODA_RADNIK1`
    FOREIGN KEY (`Radnik_JMBG`)
    REFERENCES `benzinska_pumpa`.`RADNIK` (`JMBG`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `benzinska_pumpa`.`POMOCNI_OBJEKAT`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `benzinska_pumpa`.`POMOCNI_OBJEKAT` (
  `idPomocnogObjekta` INT(11) NOT NULL,
  `DatumIzgradnje` VARCHAR(20) NOT NULL,
  `Adresa` VARCHAR(45) NOT NULL,
  `idStanice` INT NOT NULL,
  PRIMARY KEY (`idPomocnogObjekta`),
  INDEX `fk_POMOCNI_OBJEKAT_BENZINSKE_STANICE1_idx` (`idStanice` ASC),
  CONSTRAINT `fk_POMOCNI_OBJEKAT_BENZINSKE_STANICE1`
    FOREIGN KEY (`idStanice`)
    REFERENCES `benzinska_pumpa`.`BENZINSKE_STANICE` (`idStanice`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `benzinska_pumpa`.`AUTO_PRAONA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `benzinska_pumpa`.`AUTO_PRAONA` (
  `Vrsta` VARCHAR(45) NOT NULL,
  `Kapacitet` VARCHAR(45) NOT NULL,
  `idPomocnogObjekta` INT(11) NOT NULL,
  PRIMARY KEY (`idPomocnogObjekta`),
  INDEX `fk_AUTO_PRAONA_POMOCNI_OBJEKAT1_idx` (`idPomocnogObjekta` ASC),
  CONSTRAINT `fk_AUTO_PRAONA_POMOCNI_OBJEKAT1`
    FOREIGN KEY (`idPomocnogObjekta`)
    REFERENCES `benzinska_pumpa`.`POMOCNI_OBJEKAT` (`idPomocnogObjekta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `benzinska_pumpa`.`NARUDZBA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `benzinska_pumpa`.`NARUDZBA` (
  `idNarudzbe` INT(11) NOT NULL,
  `Kolicina` INT NOT NULL,
  `Datum` DATETIME NOT NULL,
  `Cena` DECIMAL(8,2) NOT NULL,
  `idDobavljaca` INT(11) NOT NULL,
  `Radnik_JMBG` VARCHAR(13) NOT NULL,
  PRIMARY KEY (`idNarudzbe`),
  INDEX `fk_NARUDZBA_Dobavljac1_idx` (`idDobavljaca` ASC),
  INDEX `fk_NARUDZBA_RADNIK1_idx` (`Radnik_JMBG` ASC),
  CONSTRAINT `fk_NARUDZBA_Dobavljac1`
    FOREIGN KEY (`idDobavljaca`)
    REFERENCES `benzinska_pumpa`.`DOBAVLJAC` (`idDobavljaca`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_NARUDZBA_RADNIK1`
    FOREIGN KEY (`Radnik_JMBG`)
    REFERENCES `benzinska_pumpa`.`RADNIK` (`JMBG`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `benzinska_pumpa`.`EVIDENICJA_PRODAJE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `benzinska_pumpa`.`EVIDENICJA_PRODAJE` (
  `idProdaje` INT NOT NULL,
  `VrstaVozila` VARCHAR(20) NOT NULL,
  `VrstaProizvoda` VARCHAR(20) NOT NULL,
  `Kolicina` INT NOT NULL,
  `Cena` DECIMAL(6,2) NOT NULL,
  `Datum` DATE NOT NULL,
  `idStanice` INT(11) NOT NULL,
  PRIMARY KEY (`idProdaje`),
  INDEX `fk_EVIDENICJA_PRODAJE_BENZINSKA_STANICA1_idx` (`idStanice` ASC),
  CONSTRAINT `fk_EVIDENICJA_PRODAJE_BENZINSKA_STANICA1`
    FOREIGN KEY (`idStanice`)
    REFERENCES `benzinska_pumpa`.`BENZINSKE_STANICE` (`idStanice`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;






-- -----------------------------------------------------
-- Table `benzinska_pumpa`.`PRANJE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `benzinska_pumpa`.`PRANJE` (
  `Vrsta` VARCHAR(45) NOT NULL,
  `Cijena` DECIMAL(4,2) NOT NULL,
  `idPomocnogObjekta` INT(11) NOT NULL,
  PRIMARY KEY (`Vrsta`),
  INDEX `fk_Pranje_AUTO_PRAONA1_idx` (`idPomocnogObjekta` ASC),
  CONSTRAINT `fk_Pranje_AUTO_PRAONA1`
    FOREIGN KEY (`idPomocnogObjekta`)
    REFERENCES `benzinska_pumpa`.`AUTO_PRAONA` (`idPomocnogObjekta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `benzinska_pumpa`.`TEST_ZA_ANALIZU`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `benzinska_pumpa`.`TEST_ZA_ANALIZU` (
  `idTesta` INT NOT NULL,
  `Vrsta` VARCHAR(20) NOT NULL,
  `Cijena` DECIMAL(4,2) NOT NULL,
  `Datum` DATETIME NOT NULL,
  `idAnalize` INT NOT NULL,
  PRIMARY KEY (`idTesta`),
  INDEX `fk_TEST_ZA_ANALIZU_ANALIZA_KVALITETA_PROIZVODA1_idx` (`idAnalize` ASC),
  CONSTRAINT `fk_TEST_ZA_ANALIZU_ANALIZA_KVALITETA_PROIZVODA1`
    FOREIGN KEY (`idAnalize`)
    REFERENCES `benzinska_pumpa`.`ANALIZA_KVALITETA_PROIZVODA` (`idAnalize`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `benzinska_pumpa`.`MARKET`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `benzinska_pumpa`.`MARKET` (
  `Telefon` VARCHAR(20) NOT NULL,
  `Naziv` VARCHAR(20) NOT NULL,
  `idPomocnogObjekta` INT(11) NOT NULL,
  `VrijemeOtvaranja` VARCHAR(20) NOT NULL,
  `VrijemeZatvaranja` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idPomocnogObjekta`),
  CONSTRAINT `fk_MARKET_POMOCNI_OBJEKAT1`
    FOREIGN KEY (`idPomocnogObjekta`)
    REFERENCES `benzinska_pumpa`.`POMOCNI_OBJEKAT` (`idPomocnogObjekta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `benzinska_pumpa`.`SIGURNOSNE_KAMERE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `benzinska_pumpa`.`SIGURNOSNE_KAMERE` (
  `idSigurnosneKamere` INT(11) NOT NULL,
  `Vrsta` VARCHAR(20) NOT NULL,
  `VrijemeRada` VARCHAR(10) NOT NULL,
  `GodinaProizvodnje` VARCHAR(20) NOT NULL,
  `idStanice` INT(11) NOT NULL,
  PRIMARY KEY (`idSigurnosneKamere`),
  INDEX `fk_SIGURNOSNE_KAMERE_BENZINSKA_STANICA1_idx` (`idStanice` ASC),
  CONSTRAINT `fk_SIGURNOSNE_KAMERE_BENZINSKA_STANICA1`
    FOREIGN KEY (`idStanice`)
    REFERENCES `benzinska_pumpa`.`BENZINSKE_STANICE` (`idStanice`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `benzinska_pumpa`.`STAVKA_NARUDZBE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `benzinska_pumpa`.`STAVKA_NARUDZBE` (
  `idStavke` INT NOT NULL,
  `Kolicina` INT NOT NULL,
  `idNarudzbe` INT(11) NOT NULL,
  `VrstaProizvoda` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`idStavke`),
  INDEX `fk_STAVKA_NARUDZBE_PROIZVOD1_idx` (`VrstaProizvoda` ASC),
  INDEX `fk_STAVKA_NARUDZBE_NARUDZBA1_idx` (`idNarudzbe` ASC),
  CONSTRAINT `fk_STAVKA_NARUDZBE_PROIZVOD1`
    FOREIGN KEY (`VrstaProizvoda`)
    REFERENCES `benzinska_pumpa`.`PROIZVOD` (`Vrsta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_STAVKA_NARUDZBE_NARUDZBA1`
    FOREIGN KEY (`idNarudzbe`)
    REFERENCES `benzinska_pumpa`.`NARUDZBA` (`idNarudzbe`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `benzinska_pumpa`.`APARAT_ZA_GORIVO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `benzinska_pumpa`.`APARAT_ZA_GORIVO` (
  `idTocilice` INT NOT NULL,
  `Vrsta` VARCHAR(45) NOT NULL,
  `Materijal` VARCHAR(45) NOT NULL,
  `Proizvodjac` VARCHAR(45) NOT NULL,
  `idStanice` INT NOT NULL,
  PRIMARY KEY (`idTocilice`),
  INDEX `fk_APARAT_ZA_GORIVO_BENZINSKE_STANICE1_idx` (`idStanice` ASC),
  CONSTRAINT `fk_APARAT_ZA_GORIVO_BENZINSKE_STANICE1`
    FOREIGN KEY (`idStanice`)
    REFERENCES `benzinska_pumpa`.`BENZINSKE_STANICE` (`idStanice`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `benzinska_pumpa`;

DELIMITER $$
USE `benzinska_pumpa`$$
CREATE DEFINER = CURRENT_USER TRIGGER `benzinska_pumpa`.`RACUN_AFTER_DELETE` AFTER DELETE ON `RACUN` FOR EACH ROW
BEGIN

END
$$


DELIMITER ;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
