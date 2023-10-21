INSERT INTO `Benzinska_pumpa`.`BENZINSKE_STANICE` (`idStanice`,`Adresa`,`Grad`,`Drzava`,`Telefon`,`Naziv`) VALUES ('111', 'Kralja Alfonsa XIII,br.8', 'Banja Luka', 'BIH(Republika Srpska)','051 347-660','Super Petrol');
UPDATE `benzinska_pumpa`.`benzinske_stanice` SET `Drzava` = 'BIH(Republika Srpska)' WHERE (`idStanice` = '111');
INSERT INTO `benzinska_pumpa`.`benzinske_stanice` (`idStanice`, `Adresa`, `Grad`, `Drzava`, `Telefon`, `Naziv`) VALUES ('112', 'Ivana Franje Jukića 2', 'Banja Luka', 'BIH(Republika Srpska)', '051 212-910', 'Krajinapetrol');


INSERT INTO `benzinska_pumpa`.`kasa` (`idKase`, `MaxDnevniPazar`, `Datum`, `idStanice`) VALUES ('2111', '0800.20', '2023-01-01', '111');
INSERT INTO `benzinska_pumpa`.`kasa` (`idKase`, `MaxDnevniPazar`, `Datum`, `idStanice`) VALUES ('2112', '1600.00', '2022-08-05', '111');
INSERT INTO `benzinska_pumpa`.`kasa` (`idKase`, `MaxDnevniPazar`, `Datum`, `idStanice`) VALUES ('2113', '3500.20', '2020-10-29', '111');

INSERT INTO `benzinska_pumpa`.`racun` (`idRacuna`, `Datum`, `Cena`, `idKase`) VALUES ('0001', '2022-01-01', '0040.10', '2111');
INSERT INTO `benzinska_pumpa`.`racun` (`idRacuna`, `Datum`, `Cena`, `idKase`) VALUES ('2', '2022-01-02', '100.00', '2111');
UPDATE `benzinska_pumpa`.`racun` SET `Datum` = '2022-01-01 12:22:00' WHERE (`idRacuna` = '1');
UPDATE `benzinska_pumpa`.`racun` SET `Datum` = '2022-01-02 01:15:34' WHERE (`idRacuna` = '2');
INSERT INTO `benzinska_pumpa`.`racun` (`idRacuna`, `Datum`, `Cena`, `idKase`) VALUES ('3', '2022-01-02 01:23:22', '20.00', '2111');
INSERT INTO `benzinska_pumpa`.`racun` (`idRacuna`, `Datum`, `Cena`, `idKase`) VALUES ('4', '2022-01-03 23:22:12', '80.00', '2111');
INSERT INTO `benzinska_pumpa`.`racun` (`idRacuna`, `Datum`, `Cena`, `idKase`) VALUES ('5', '2022-01-02 05:13:02', '55.00', '2111');
INSERT INTO `benzinska_pumpa`.`racun` (`idRacuna`, `Datum`, `Cena`, `idKase`) VALUES ('6', '2022-05-01 08:22:19', '400.00', '2112');
INSERT INTO `benzinska_pumpa`.`racun` (`idRacuna`, `Datum`, `Cena`, `idKase`) VALUES ('7', '2022-05-01 09:01:03', '80.00', '2112');
INSERT INTO `benzinska_pumpa`.`racun` (`idRacuna`, `Datum`, `Cena`, `idKase`) VALUES ('8', '2022-05-01 22:00:42', '122.00', '2112');
INSERT INTO `benzinska_pumpa`.`racun` (`idRacuna`, `Datum`, `Cena`, `idKase`) VALUES ('9', '2022-06-01 12:22:19', '60.00', '2112');
INSERT INTO `benzinska_pumpa`.`racun` (`idRacuna`, `Datum`, `Cena`, `idKase`) VALUES ('10', '2022-07-01 23:12:12', '30.00', '2113');
INSERT INTO `benzinska_pumpa`.`racun` (`idRacuna`, `Datum`, `Cena`, `idKase`) VALUES ('11', '2022-07-01 12:23:00', '95.00', '2113');

INSERT INTO `benzinska_pumpa`.`skladiste` (`idSkladista`, `BrojProizvoda`, `ProtivPozarniSistem`, `Popunjenost`, `Vrsta`, `idStanice`) VALUES ('1', '125', '1', '95', 'benzin', '111');
INSERT INTO `benzinska_pumpa`.`skladiste` (`idSkladista`, `BrojProizvoda`, `ProtivPozarniSistem`, `Popunjenost`, `Vrsta`, `idStanice`) VALUES ('2', '200', '1', '60', 'mjesovito', '111');

INSERT INTO `benzinska_pumpa`.`proizvod` (`Vrsta`, `Cena`, `idSkladista`) VALUES ('benzin', '3.0', '1');
INSERT INTO `benzinska_pumpa`.`proizvod` (`Vrsta`, `Cena`, `idSkladista`) VALUES ('DIZEL BAS EN 590', '3.00', '2');
INSERT INTO `benzinska_pumpa`.`proizvod` (`Vrsta`, `Cena`, `idSkladista`) VALUES ('EURODIESEL BS ', '3.50', '2');
INSERT INTO `benzinska_pumpa`.`proizvod` (`Vrsta`, `Cena`, `idSkladista`) VALUES ('SUPER PLUS bezolovni benzin 98', '2.50', '1');
INSERT INTO `benzinska_pumpa`.`proizvod` (`Vrsta`, `Cena`, `idSkladista`) VALUES ('LPG tecni naftni gas', '1.50', '2');
INSERT INTO `benzinska_pumpa`.`proizvod` (`Vrsta`, `Cena`, `idSkladista`) VALUES ('prirodni plin (CNG)', '1.00', '2');
INSERT INTO `benzinska_pumpa`.`proizvod` (`Vrsta`, `Cena`, `idSkladista`) VALUES ('kesa', '0.10', '2');
INSERT INTO `benzinska_pumpa`.`proizvod` (`Vrsta`, `Cena`, `idSkladista`) VALUES ('plinska boca', '20.00', '2');
INSERT INTO `benzinska_pumpa`.`proizvod` (`Vrsta`, `Cena`, `idSkladista`) VALUES ('motorno ulje', '5.00', '2');


INSERT INTO `benzinska_pumpa`.`stavka` (`idStavke`, `Kolicina`, `Cena`, `idRacuna`,`PROIZVOD_Vrsta`) VALUES ('1', '10', '30.00', '10','benzin');
INSERT INTO `benzinska_pumpa`.`stavka` (`idStavke`, `Kolicina`, `Cena`, `idRacuna`, `PROIZVOD_Vrsta`) VALUES ('2', '5', '5.00', '1', 'prirodni plin (CNG)');
INSERT INTO `benzinska_pumpa`.`stavka` (`idStavke`, `Kolicina`, `Cena`, `idRacuna`, `PROIZVOD_Vrsta`) VALUES ('3', '1', '20.00', '1', 'plinska boca');
INSERT INTO `benzinska_pumpa`.`stavka` (`idStavke`, `Kolicina`, `Cena`, `idRacuna`, `PROIZVOD_Vrsta`) VALUES ('4', '3', '15.00', '1', 'motorno ulje');
INSERT INTO `benzinska_pumpa`.`stavka` (`idStavke`, `Kolicina`, `Cena`, `idRacuna`, `PROIZVOD_Vrsta`) VALUES ('5', '1', '0.10', '1', 'kesa');
INSERT INTO `benzinska_pumpa`.`stavka` (`idStavke`, `Kolicina`, `Cena`, `idRacuna`, `PROIZVOD_Vrsta`) VALUES ('6', '5', '100.00', '2', 'plinska boca');
INSERT INTO `benzinska_pumpa`.`stavka` (`idStavke`, `Kolicina`, `Cena`, `idRacuna`, `PROIZVOD_Vrsta`) VALUES ('7', '7', '17.50', '3', 'SUPER PLUS bezolovni benzin 98');
INSERT INTO `benzinska_pumpa`.`stavka` (`idStavke`, `Kolicina`, `Cena`, `idRacuna`, `PROIZVOD_Vrsta`) VALUES ('8', '1', '2.50', '3', 'SUPER PLUS bezolovni benzin 98');
INSERT INTO `benzinska_pumpa`.`stavka` (`idStavke`, `Kolicina`, `Cena`, `idRacuna`, `PROIZVOD_Vrsta`) VALUES ('9', '20', '70', '4', 'EURODIESEL BS ');
INSERT INTO `benzinska_pumpa`.`stavka` (`idStavke`, `Kolicina`, `Cena`, `idRacuna`, `PROIZVOD_Vrsta`) VALUES ('10', '2', '10.00', '4', 'motorno ulje');
INSERT INTO `benzinska_pumpa`.`stavka` (`idStavke`, `Kolicina`, `Cena`, `idRacuna`, `PROIZVOD_Vrsta`) VALUES ('11', '55', '55.00', '5', 'prirodni plin (CNG)');
INSERT INTO `benzinska_pumpa`.`stavka` (`idStavke`, `Kolicina`, `Cena`, `idRacuna`, `PROIZVOD_Vrsta`) VALUES ('12', '20', '400.00', '6', 'plinska boca');
INSERT INTO `benzinska_pumpa`.`stavka` (`idStavke`, `Kolicina`, `Cena`, `idRacuna`, `PROIZVOD_Vrsta`) VALUES ('13', '32', '80.00', '7', 'SUPER PLUS bezolovni benzin 98');
INSERT INTO `benzinska_pumpa`.`stavka` (`idStavke`, `Kolicina`, `Cena`, `idRacuna`, `PROIZVOD_Vrsta`) VALUES ('14', '40', '120', '8', 'DIZEL BAS EN 590');
INSERT INTO `benzinska_pumpa`.`stavka` (`idStavke`, `Kolicina`, `Cena`, `idRacuna`, `PROIZVOD_Vrsta`) VALUES ('15', '2', '2.00', '8', 'prirodni plin (CNG)');
INSERT INTO `benzinska_pumpa`.`stavka` (`idStavke`, `Kolicina`, `Cena`, `idRacuna`, `PROIZVOD_Vrsta`) VALUES ('16', '20', '60', '9', 'DIZEL BAS EN 590');
INSERT INTO `benzinska_pumpa`.`stavka` (`idStavke`, `Kolicina`, `Cena`, `idRacuna`, `PROIZVOD_Vrsta`) VALUES ('17', '10', '30.00', '10', 'benzin');
INSERT INTO `benzinska_pumpa`.`stavka` (`idStavke`, `Kolicina`, `Cena`, `idRacuna`, `PROIZVOD_Vrsta`) VALUES ('18', '30', '90.00', '11', 'DIZEL BAS EN 590');
INSERT INTO `benzinska_pumpa`.`stavka` (`idStavke`, `Kolicina`, `Cena`, `idRacuna`, `PROIZVOD_Vrsta`) VALUES ('19', '1', '5.00', '11', 'motorno ulje');


-- DELETE from stavka WHERE idStavke BETWEEN 1 AND 20;




INSERT INTO `benzinska_pumpa`.`sigurnosne_kamere` (`idSigurnosneKamere`, `Vrsta`, `VrijemeRada`, `GodinaProizvodnje`, `idStanice`) VALUES ('1', 'DOM KAMERA TK-C2201E', 'dnevno', '2021', '111');
INSERT INTO `benzinska_pumpa`.`sigurnosne_kamere` (`idSigurnosneKamere`, `Vrsta`, `VrijemeRada`, `GodinaProizvodnje`, `idStanice`) VALUES ('2', 'BOX KAMERA TK-C9200E', 'nocno', '2020', '111');


INSERT INTO `benzinska_pumpa`.`evidenicja_prodaje` (`idProdaje`, `VrstaVozila`, `VrstaProizvoda`, `Kolicina`, `Cena`, `Datum`, `idStanice`) VALUES ('1', 'automobil', 'DIZEL BAS EN 590', '20', '1400', '2020-06-15', '111');
INSERT INTO `benzinska_pumpa`.`evidenicja_prodaje` (`idProdaje`, `VrstaVozila`, `VrstaProizvoda`, `Kolicina`, `Cena`, `Datum`, `idStanice`) VALUES ('2', 'kamion', 'EURODIESEL BS ', '123', '5000.00', '2020-02-28', '111');


INSERT INTO `benzinska_pumpa`.`aparat_za_gorivo` (`idTocilice`, `Vrsta`, `Materijal`, `Proizvodjac`, `idStanice`) VALUES ('1', 'MODEL M', 'Aluminijum', 'Agropartner', '111');
INSERT INTO `benzinska_pumpa`.`aparat_za_gorivo` (`idTocilice`, `Vrsta`, `Materijal`, `Proizvodjac`, `idStanice`) VALUES ('2', 'MODEL H', 'Aluminijum', 'Wayne', '111');



INSERT INTO `benzinska_pumpa`.`dobavljac` (`idDobavljaca`, `Naziv`, `Adresa`, `Telefon`, `idStanice`) VALUES ('2', 'EVERYOUNG', 'Building, No.48 CaiHong Road, Ningbo, Kina', ' +86-574-87953488', '111');
INSERT INTO `benzinska_pumpa`.`dobavljac` (`idDobavljaca`, `Naziv`, `Adresa`, `Telefon`, `idStanice`) VALUES ('1', 'EAGLESTAR', ' Zhengzhou City, provincija Henan, Kina', '+8618237173989', '111');

INSERT INTO `benzinska_pumpa`.`radnik` (`JMBG`, `Prezime`, `Ime`, `Uloga`, `Plata`, `PutniTroskovi`, `idStanice`) VALUES ('0512981717776', 'Markovic', 'Marko', 'Direkotor', '2000.00', '100.00', '111');
INSERT INTO `benzinska_pumpa`.`radnik` (`JMBG`, `Prezime`, `Ime`, `Uloga`, `Plata`, `PutniTroskovi`, `idStanice`) VALUES ('0101100710006', 'Darko', 'Milicic', 'Radnik na kasi', '800.00', '50.00', '111');


INSERT INTO `benzinska_pumpa`.`narudzba` (`idNarudzbe`, `Kolicina`, `Datum`, `Cena`, `idDobavljaca`, `Radnik_JMBG`) VALUES ('1', '100', '2023-01-01', '10000.00', '1', '0512981717776');
INSERT INTO `benzinska_pumpa`.`narudzba` (`idNarudzbe`, `Kolicina`, `Datum`, `Cena`, `idDobavljaca`, `Radnik_JMBG`) VALUES ('2', '50', '2022-01-02 05:13:02', '5000.00', '1', '0512981717776');


INSERT INTO `benzinska_pumpa`.`stavka_narudzbe` (`idStavke`, `Kolicina`, `idNarudzbe`, `VrstaProizvoda`) VALUES ('1', '50', '1', 'prirodni plin (CNG)');
INSERT INTO `benzinska_pumpa`.`stavka_narudzbe` (`idStavke`, `Kolicina`, `idNarudzbe`, `VrstaProizvoda`) VALUES ('2', '10', '1', 'motorno ulje');

INSERT INTO `benzinska_pumpa`.`analiza_kvaliteta_proizvoda` (`idAnalize`, `Datum`, `Rezultat`, `Troskovi`, `VrstaProizvoda`, `Radnik_JMBG`) VALUES ('1', '2022-05-01 09:01:03', 'zadovoljavajuci kvalitet', '10.00', 'EURODIESEL BS ', '0512981717776');
INSERT INTO `benzinska_pumpa`.`analiza_kvaliteta_proizvoda` (`idAnalize`, `Datum`, `Rezultat`, `Troskovi`, `VrstaProizvoda`, `Radnik_JMBG`) VALUES ('2', '2023-01-27 02:55:08', 'ne ispunjava emisijske norme Euro 5', '20.00', 'DIZEL BAS EN 590', '0512981717776');

INSERT INTO `benzinska_pumpa`.`test_za_analizu` (`idTesta`, `Vrsta`, `Cijena`, `Datum`, `idAnalize`) VALUES ('1', 'vizuelni test', '0.00', '2022-07-01 12:23:00', '1');
INSERT INTO `benzinska_pumpa`.`test_za_analizu` (`idTesta`, `Vrsta`, `Cijena`, `Datum`, `idAnalize`) VALUES ('2', 'provjera gustine', '10.00', '2022-05-01 22:00:42', '1');

INSERT INTO `benzinska_pumpa`.`pomocni_objekat` (`idPomocnogObjekta`, `DatumIzgradnje`, `Adresa`, `idStanice`) VALUES ('111', '1997', 'Kralja Alfonsa XIII,br.8', '111');
INSERT INTO `benzinska_pumpa`.`pomocni_objekat` (`idPomocnogObjekta`, `DatumIzgradnje`, `Adresa`, `idStanice`) VALUES ('112', '2010', 'Ivana Franje Jukića 2', '112');

INSERT INTO `benzinska_pumpa`.`market` (`Telefon`, `Naziv`, `idPomocnogObjekta`, `VrijemeOtvaranja`, `VrijemeZatvaranja`) VALUES ('065 823 534', 'Moj market', '111', '08-00-00', '22-00-00');
INSERT INTO `benzinska_pumpa`.`market` (`Telefon`, `Naziv`, `idPomocnogObjekta`, `VrijemeOtvaranja`, `VrijemeZatvaranja`) VALUES ('065 982 254', 'kort', '112', '07-15-00', '23-15-00');


INSERT INTO `benzinska_pumpa`.`auto_praona` (`Vrsta`, `Kapacitet`, `idPomocnogObjekta`) VALUES ('Samousluzna praona', '6000 litara', '111');
INSERT INTO `benzinska_pumpa`.`auto_praona` (`Vrsta`, `Kapacitet`, `idPomocnogObjekta`) VALUES ('Standardno servisirana autopraonica', '1000 litara', '112');

INSERT INTO `benzinska_pumpa`.`pranje` (`Vrsta`, `Cijena`, `idPomocnogObjekta`) VALUES ('tunel', '5.00', '111');
INSERT INTO `benzinska_pumpa`.`pranje` (`Vrsta`, `Cijena`, `idPomocnogObjekta`) VALUES ('portal', '6.00', '111');
INSERT INTO `benzinska_pumpa`.`pranje` (`Vrsta`, `Cijena`, `idPomocnogObjekta`) VALUES ('pranje motora', '10.00', '112');
