-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Benzinska_pumpa
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Benzinska_pumpa
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `benzinska_pumpa` DEFAULT CHARACTER SET utf8 ;
USE `benzinska_pumpa` ;
use benzinska_pumpa;




-- funkcija koja provjerava da li postoji racun sa zadatim identifikatorom i vraca true u slucaju da postoji
delimiter $$
CREATE FUNCTION postojanjeRacuna( pIdRacuna int(11))
RETURNS bool
-- reads sql data
BEGIN

   DECLARE jeste bool default false;
   declare vKraj bool default false;
    declare iddRacuna int(11);
    
   Declare rac cursor for select idRacuna from racun;
   
   declare continue handler for not found set vKraj=true;
  
open rac;
petlja: LOOP
		FETCH rac INTO IddRacuna;
		if vKraj then leave petlja; end if;
	if IddRacuna=pIdRacuna then
    set jeste=true;
    end if;
		
	END LOOP petlja;

 close rac;
   return jeste;

END $$; 

delimiter ;
-- drop function postojanjeRacuna;
-- select postojanjeRacuna(43);

-- funkcija koja provjerava da li na racunu ima vise od jedne stavke(korisno prilikom brisanja stavki)
-- provjerava se da li je cijena na racunu veca od nule kada se od cijene racuna oduzme cijena stavke koja se brise
delimiter $$
CREATE FUNCTION provjeraCijene( pIdRacuna int(11),pCena decimal(6,2))
RETURNS bool
BEGIN

   DECLARE jeste bool default false;
   declare vKraj bool default false;
    
    declare iddRacuna int(11);
    
    
   Declare rac cursor for select idRacuna from racun where Cena-pCena>0;
  
   
   declare continue handler for not found set vKraj=true;
 
  
open rac;

petlja: LOOP
		FETCH rac INTO IddRacuna;
     
		if vKraj then leave petlja; end if;
        
	if IddRacuna=pIdRacuna  then
    set jeste=true;
    end if;
		
	END LOOP petlja;

 close rac;
 
   return jeste;

END $$; 

delimiter ;
-- drop function provjeraCijene;
-- select provjeraCijene(11,96.0);




-- triger na stavkama sluzi da se azurira stanje na racunu prilikom dodavanja nove stavke na racun ili da se kreira novi racun 
DELIMITER $$
CREATE DEFINER = CURRENT_USER TRIGGER `benzinska_pumpa`.`stavka_BEFORE_INSERT` BEFORE INSERT ON `stavka`
 FOR EACH ROW begin
 if(!postojanjeRacuna(new.idRacuna))then
INSERT INTO `benzinska_pumpa`.`racun` (`idRacuna`, `Datum`, `Cena`, `idKase`) VALUES (new.idRacuna,now(),new.Cena, '2111');
else
UPDATE `benzinska_pumpa`.`racun` SET `Datum` = now()  WHERE (`idRacuna` = new.idRacuna);
UPDATE `benzinska_pumpa`.`racun` SET `Cena` = new.Cena+Cena  WHERE (`idRacuna` = new.idRacuna);
end if;
end $$
DELIMITER ;
-- procedura za dodavanje stavke
DELIMITER $$
USE `benzinska_pumpa`$$
CREATE PROCEDURE `dodavanjeStavke`(IN pIdStavke int(11), IN pKolicina int(11), IN pCena decimal(6,2), IN pIdRacuna  int(11), IN pVrsta VARCHAR(50))
BEGIN
	insert into benzinska_pumpa.stavka values (pIdStavke,pKolicina,pCena,pIdRacuna,pVrsta);
END$$

DELIMITER ;

-- DROP TRIGGER IF EXISTS benzinska_pumpa.stavka_BEFORE_INSERT;
-- drop procedure dodavanjeStavke;

-- call dodavanjeStavke(20,1,5.00,12,'motorno ulje');
-- call dodavanjeStavke(21,1,5.00,12,'motorno ulje');

-- delete from stavka where idStavke=20;
-- delete from stavka where idStavke=21;
-- delete from racun where idRacuna=12;

-- triger na stavkama koji sluzi da se azuriraju stanja na racunima ili da se po potrebi izbrisu racuni 
DELIMITER $$
CREATE DEFINER = CURRENT_USER TRIGGER `benzinska_pumpa`.`stavka_AFTER_DELETE` AFTER DELETE ON `stavka`
 FOR EACH ROW
BEGIN
if(postojanjeRacuna(old.idRacuna) and !provjeraCijene(old.idRacuna,old.Cena))then
delete from racun where idRacuna=old.idRacuna;
end if;
if (postojanjeRacuna(old.idRacuna) and provjeraCijene(old.idRacuna,old.Cena)) then
UPDATE `benzinska_pumpa`.`racun` SET `Cena` = Cena-old.Cena  WHERE (`idRacuna` = old.idRacuna);
end if;
END $$;

DELIMITER ;

-- procedura za dodavanje proizvoda
DELIMITER $$
USE `benzinska_pumpa`$$
CREATE PROCEDURE `dodavanjeProizvoda`(IN pVrsta varchar(50), IN pCena  decimal(11), IN pIdSkladista int(11))
BEGIN
	insert into proizvod values (pVrsta,pCena,pIdSkladista);
END$$

DELIMITER ;
-- drop PROCEDURE dodavanjeProizvoda;
-- call dodavanjeProizvoda('antifriz',6.00,2);
-- delete from proizvod where Vrsta ='antifriz';

-- pogled za prikaz stavki rasporedjenih na osnovu racuna na kojima se nalaze
create view stavkeNaRacunu as
select s.idStavke,s.Kolicina,s.Cena,s.PROIZVOD_Vrsta,s.idRacuna
from stavka s inner join racun r on s.idRacuna=r.idRacuna;

-- drop view stavkeNaRacunu;
-- select * from stavkeNaRacunu;  



-- DELIMITER $$
-- CREATE DEFINER = CURRENT_USER TRIGGER `benzinska_pumpa`.`racun_BEFORE_DELETE` BEFORE DELETE ON `racun`
-- FOR EACH ROW
-- BEGIN
-- delete from stavka where idRacuna=old.idRacuna;
-- END $$;

-- DELIMITER ;





-- SET SQL_MODE=@OLD_SQL_MODE;
-- SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
-- SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
