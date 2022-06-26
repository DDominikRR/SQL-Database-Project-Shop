--tworzenie sekwencji
CREATE SEQUENCE seq_produkt
increment by 1 start with 1
maxvalue 9999999999 minvalue 1 cache 20;
CREATE SEQUENCE seq_kategoria
increment by 1 start with 1
maxvalue 9999999999 minvalue 1 cache 20;
CREATE SEQUENCE seq_rachunek
increment by 1 start with 1
maxvalue 9999999999 minvalue 1 cache 20;
CREATE SEQUENCE seq_pozycje_rachunku
increment by 1 start with 1
maxvalue 9999999999 minvalue 1 cache 20;
CREATE SEQUENCE seq_klient
increment by 1 start with 1
maxvalue 9999999999 minvalue 1 cache 20;
CREATE SEQUENCE seq_adres
increment by 1 start with 1
maxvalue 9999999999 minvalue 1 cache 20;
CREATE SEQUENCE seq_zamowienie
increment by 1 start with 1
maxvalue 9999999999 minvalue 1 cache 20;
CREATE SEQUENCE seq_pracownik
increment by 1 start with 1
maxvalue 9999999999 minvalue 1 cache 20;

--tworzenie tabel
CREATE TABLE ym_produkt(
id_produktu NUMBER(4) NOT NULL,
nazwa_produktu VARCHAR2(30) NOT NULL,
kraj_pochodzenia VARCHAR2(20) NOT NULL,
producent VARCHAR2(30) NOT NULL,
podkategoria VARCHAR2(30) NOT NULL,
id_kategorii NUMBER(4) NOT NULL,
cena_produktu NUMBER(6,2) NOT NULL,
masa_produktu NUMBER(4),
CONSTRAINT ym_produkt_PK PRIMARY KEY(id_produktu)
);

CREATE TABLE ym_kategoria(
id_kategorii NUMBER(4) NOT NULL,
nazwa_kategorii VARCHAR2(20) NOT NULL,
CONSTRAINT ym_kategoria_PK PRIMARY KEY(id_kategorii)
);

CREATE TABLE ym_rachunek(
id_rachunku NUMBER(4) NOT NULL,
data_rachunku date NOT NULL,
id_klienta NUMBER(4) NOT NULL,
id_zamowienia NUMBER(4) NOT NULL,
CONSTRAINT ym_rachunek_PK PRIMARY KEY(id_rachunku)
);

CREATE TABLE ym_pozycje_rachunku(
id_pozycji NUMBER(4) NOT NULL,
ilosc_pozycji NUMBER(4) NOT NULL,
id_produktu NUMBER(4) NOT NULL,
id_rachunku NUMBER(4) NOT NULL,
CONSTRAINT ym_pozycje_rachunku_PK PRIMARY KEY(id_pozycji)
);

CREATE TABLE ym_pracownik(
id_pracownika NUMBER(4) NOT NULL,
data_zatrudnienia date NOT NULL,
imie_pracownika VARCHAR2(20) NOT NULL,
nazwisko_pracownika VARCHAR2(30) NOT NULL,
wynagrodzenie_pracownika NUMBER(6) NOT NULL,
CONSTRAINT ym_pracownik_PK PRIMARY KEY(id_pracownika)
);

CREATE TABLE ym_klient(
id_klienta NUMBER(4) NOT NULL,
imie_klienta VARCHAR2(20) NOT NULL,
nazwisko_klienta VARCHAR2(30) NOT NULL,
email_klienta VARCHAR2(40) NOT NULL,
id_adresu NUMBER(4) NOT NULL,
CONSTRAINT ym_klient_PK PRIMARY KEY(id_klienta)
);

CREATE TABLE ym_zamowienie(
id_zamowienia NUMBER(4) NOT NULL,
data_zamowienia date NOT NULL,
status_zamowienia VARCHAR2(20) NOT NULL,
id_pracownika NUMBER(4) NOT NULL,
id_klienta NUMBER(4) NOT NULL,
CONSTRAINT ym_zamowienie_PK PRIMARY KEY(id_zamowienia)
);

CREATE TABLE ym_adres(
id_adresu NUMBER(4) NOT NULL,
region VARCHAR2(30) NOT NULL,
miasto VARCHAR2(30) NOT NULL,
kod_pocztowy VARCHAR2(6) NOT NULL,
ulica VARCHAR2(30) NOT NULL,
nr_dom_miesz VARCHAR2(10) NOT NULL,
CONSTRAINT ym_adres_PK PRIMARY KEY(id_adresu)
);

--dodawanie kluczy obcych
ALTER TABLE ym_produkt
ADD CONSTRAINT ym_produkt_ym_kategoria_FK FOREIGN KEY(id_kategorii)
REFERENCES ym_kategoria(id_kategorii);

ALTER TABLE ym_pozycje_rachunku
ADD CONSTRAINT ym_pozycje_rachunku_ym_produkt_FK FOREIGN KEY(id_produktu)
REFERENCES ym_produkt(id_produktu);

ALTER TABLE ym_pozycje_rachunku
ADD CONSTRAINT ym_pozycje_rachunku_ym_rachunek_FK FOREIGN KEY(id_rachunku)
REFERENCES ym_rachunek(id_rachunku);

ALTER TABLE ym_rachunek
ADD CONSTRAINT ym_rachunek_ym_klient_FK FOREIGN KEY(id_klienta)
REFERENCES ym_klient(id_klienta);

ALTER TABLE ym_rachunek
ADD CONSTRAINT ym_rachunek_ym_zamowienie_FK FOREIGN KEY(id_zamowienia)
REFERENCES ym_zamowienie(id_zamowienia);

ALTER TABLE ym_klient
ADD CONSTRAINT ym_klient_ym_adres_FK FOREIGN KEY(id_adresu)
REFERENCES ym_adres(id_adresu);

ALTER TABLE ym_zamowienie
ADD CONSTRAINT ym_zamowienie_ym_pracownik_FK FOREIGN KEY(id_pracownika)
REFERENCES ym_pracownik(id_pracownika);

ALTER TABLE ym_zamowienie
ADD CONSTRAINT ym_zamowienie_ym_klient_FK FOREIGN KEY(id_klienta)
REFERENCES ym_klient(id_klienta);

--dodawanie danych

--kategoria
INSERT INTO ym_kategoria
VALUES(seq_kategoria.nextval,'Yerba Mate');
INSERT INTO ym_kategoria
VALUES(seq_kategoria.nextval,'Bombille');
INSERT INTO ym_kategoria
VALUES(seq_kategoria.nextval,'Naczynia');
INSERT INTO ym_kategoria
VALUES(seq_kategoria.nextval,'Akcesoria');
INSERT INTO ym_kategoria
VALUES(seq_kategoria.nextval,'Inne Ziola');


--produkt
    --yerba mate
INSERT INTO ym_produkt
VALUES(seq_produkt.nextval,'AMANDA CON PALO','Argentyna','AMANDA','Klasyczna',1,34.00,1000);
INSERT INTO ym_produkt
VALUES(seq_produkt.nextval,'AMANDA CON PALO','Argentyna','AMANDA','Klasyczna',1,20.00,500);
INSERT INTO ym_produkt
VALUES(seq_produkt.nextval,'AMANDA CON PALO','Argentyna','AMANDA','Klasyczna',1,13.00,250);
INSERT INTO ym_produkt
VALUES(seq_produkt.nextval,'AMANDA DESPALADA','Argentyna','AMANDA','Klasyczna',1,37.00,1000);
INSERT INTO ym_produkt
VALUES(seq_produkt.nextval,'AMANDA DESPALADA','Argentyna','AMANDA','Klasyczna',1,23.00,500);
INSERT INTO ym_produkt
VALUES(seq_produkt.nextval,'AMANDA PREMIUM','Argentyna','AMANDA','Klasyczna',1,25.00,500);
INSERT INTO ym_produkt
VALUES(seq_produkt.nextval,'PAJARITO TRADICIONAL','Paragwaj','PAJARITO','Klasyczna',1,75.00,3000);
INSERT INTO ym_produkt
VALUES(seq_produkt.nextval,'PAJARITO TRADICIONAL','Paragwaj','PAJARITO','Klasyczna',1,29.00,1000);
INSERT INTO ym_produkt
VALUES(seq_produkt.nextval,'PAJARITO TRADICIONAL','Paragwaj','PAJARITO','Klasyczna',1,19.00,500);
INSERT INTO ym_produkt
VALUES(seq_produkt.nextval,'PAJARITO TRADICIONAL','Paragwaj','PAJARITO','Klasyczna',1,10.00,250);
INSERT INTO ym_produkt
VALUES(seq_produkt.nextval,'PAJARITO SUAVE','Paragwaj','PAJARITO','Klasyczna',1,20.00,500);
INSERT INTO ym_produkt
VALUES(seq_produkt.nextval,'PAJARITO SUAVE','Paragwaj','PAJARITO','Klasyczna',1,4.00,40);
INSERT INTO ym_produkt
VALUES(seq_produkt.nextval,'PAJARITO PREMIUM DESPALADA','Paragwaj','PAJARITO','Klasyczna',1,23.00,500);
INSERT INTO ym_produkt
VALUES(seq_produkt.nextval,'PAJARITO PREMIUM DESPALADA','Paragwaj','PAJARITO','Klasyczna',1,5.00,40);
INSERT INTO ym_produkt
VALUES(seq_produkt.nextval,'PAJARITO SELECCION ESPECIAL','Paragwaj','PAJARITO','Klasyczna',1,33.00,1000);
INSERT INTO ym_produkt
VALUES(seq_produkt.nextval,'PAJARITO SELECCION ESPECIAL','Paragwaj','PAJARITO','Klasyczna',1,20.00,500);
INSERT INTO ym_produkt
VALUES(seq_produkt.nextval,'PIPORE CON PALO','Argentyna','PIPORE','Klasyczna',1,33.00,1000);
INSERT INTO ym_produkt
VALUES(seq_produkt.nextval,'PIPORE CON PALO','Argentyna','PIPORE','Klasyczna',1,20.00,500);
INSERT INTO ym_produkt
VALUES(seq_produkt.nextval,'PIPORE CON PALO','Argentyna','PIPORE','Klasyczna',1,11.00,250);
INSERT INTO ym_produkt
VALUES(seq_produkt.nextval,'PIPORE DESPALADA','Argentyna','PIPORE','Klasyczna',1,23.00,500);
INSERT INTO ym_produkt
VALUES(seq_produkt.nextval,'PIPORE ESPECIAL','Argentyna','PIPORE','Klasyczna',1,23.00,500);
INSERT INTO ym_produkt
VALUES(seq_produkt.nextval,'CBSe ENERGIA','Argentyna','CBSE','Z Dodatkami',1,19.00,500);
INSERT INTO ym_produkt
VALUES(seq_produkt.nextval,'CBSe LIMON','Argentyna','CBSE','Z Dodatkami',1,19.00,500);
INSERT INTO ym_produkt
VALUES(seq_produkt.nextval,'CBSe POMELO','Argentyna','CBSE','Z Dodatkami',1,19.00,500);
INSERT INTO ym_produkt
VALUES(seq_produkt.nextval,'CBSe NARANJA','Argentyna','CBSE','Z Dodatkami',1,19.00,500);
INSERT INTO ym_produkt
VALUES(seq_produkt.nextval,'COSENTINA CON CANNABUS','Urugwaj','COSENTINA','Z Dodatkami',1,49.00,1000);
INSERT INTO ym_produkt
VALUES(seq_produkt.nextval,'BARAO Nativa','Brazylia','BARAO','Chimarrao',1,43.00,1000);
INSERT INTO ym_produkt
VALUES(seq_produkt.nextval,'BARAO Nativa','Brazylia','BARAO','Chimarrao',1,24.00,500);
INSERT INTO ym_produkt
VALUES(seq_produkt.nextval,'BARAO Tradicional','Brazylia','BARAO','Chimarrao',1,47.00,1000);
INSERT INTO ym_produkt
VALUES(seq_produkt.nextval,'BARAO Tradicional','Brazylia','BARAO','Chimarrao',1,24.00,500);
INSERT INTO ym_produkt
VALUES(seq_produkt.nextval,'BARAO Organica','Brazylia','BARAO','Chimarrao',1,53.00,1000);
    --bombille
INSERT INTO ym_produkt(id_produktu,nazwa_produktu,kraj_pochodzenia,producent,podkategoria,id_kategorii,cena_produktu)
VALUES(seq_produkt.nextval,'Nierdzewna niebieska','Argentyna','ANEL','Nierdzewna',2,17.00);
INSERT INTO ym_produkt(id_produktu,nazwa_produktu,kraj_pochodzenia,producent,podkategoria,id_kategorii,cena_produktu)
VALUES(seq_produkt.nextval,'Nierdzewna srebrna','Argentyna','ANEL','Nierdzewna',2,17.00);
INSERT INTO ym_produkt(id_produktu,nazwa_produktu,kraj_pochodzenia,producent,podkategoria,id_kategorii,cena_produktu)
VALUES(seq_produkt.nextval,'ARANA Elegancia 17cm','Argentyna','ARANA','Srebrna',2,204.99);
INSERT INTO ym_produkt(id_produktu,nazwa_produktu,kraj_pochodzenia,producent,podkategoria,id_kategorii,cena_produktu)
VALUES(seq_produkt.nextval,'Bomba CUIA ORO','Brazylia','BORTONAGGIO','Bomba',2,159.45);
    --naczynia
INSERT INTO ym_produkt(id_produktu,nazwa_produktu,kraj_pochodzenia,producent,podkategoria,id_kategorii,cena_produktu)
VALUES(seq_produkt.nextval,'Caracas 150-200ML','Argentyna','CARACAS','Tykwa',3,32.00);
INSERT INTO ym_produkt(id_produktu,nazwa_produktu,kraj_pochodzenia,producent,podkategoria,id_kategorii,cena_produktu)
VALUES(seq_produkt.nextval,'Chileno Del Litoral 230-330ML','Chille','CHILENO','Tykwa',3,32.00);
INSERT INTO ym_produkt(id_produktu,nazwa_produktu,kraj_pochodzenia,producent,podkategoria,id_kategorii,cena_produktu)
VALUES(seq_produkt.nextval,'COMODO LAMA 130 ml','Argentyna','COMODO','Palo Santo',3,159.00);
INSERT INTO ym_produkt(id_produktu,nazwa_produktu,kraj_pochodzenia,producent,podkategoria,id_kategorii,cena_produktu)
VALUES(seq_produkt.nextval,'Guampa Ceramico','Argentyna','PIPORE','Ceramika',3,22.00);

--adres
INSERT INTO ym_adres
VALUES(seq_adres.nextval,'Mazowieckie','Warszawa','01-136','Wolska','69/33');
INSERT INTO ym_adres
VALUES(seq_adres.nextval,'Mazowieckie','Plock','09-402','Kochanowskiego','19/3');
INSERT INTO ym_adres
VALUES(seq_adres.nextval,'Mazowieckie','Warszawa','02-133','Gorczewska','31/13');
INSERT INTO ym_adres
VALUES(seq_adres.nextval,'Kieleckie','Kielce','33-133','malowana','3');
INSERT INTO ym_adres
VALUES(seq_adres.nextval,'Podlaskie','Bialystok','99-993','Biala','303');
INSERT INTO ym_adres
VALUES(seq_adres.nextval,'Mazowieckie','Plock','09-410','Mickiewicza','3a/19');
INSERT INTO ym_adres
VALUES(seq_adres.nextval,'Mazowieckie','Warszawa','02-133','Jana Olbrachta','44/13');

--klient
INSERT INTO ym_klient
VALUES(seq_klient.nextval,'Dominik','Rozycki','drozycki@gmail.com',1);
INSERT INTO ym_klient
VALUES(seq_klient.nextval,'Janusz','Mikke','jkm88@gmail.com',1);
INSERT INTO ym_klient
VALUES(seq_klient.nextval,'Karol','Karewicz-Kloss','kkk@gmail.com',2);
INSERT INTO ym_klient
VALUES(seq_klient.nextval,'Mariusz','Sariuszewski','smariusz@gmail.com',3);
INSERT INTO ym_klient
VALUES(seq_klient.nextval,'Roman','Zezlotoryi','romcio@gmail.com',4);
INSERT INTO ym_klient
VALUES(seq_klient.nextval,'Marian','Nairam','marram@gmail.com',5);
INSERT INTO ym_klient
VALUES(seq_klient.nextval,'Marcin','Najman','odklepuje@gmail.com',6);
INSERT INTO ym_klient
VALUES(seq_klient.nextval,'Piotr','Bak','capi@gmail.com',7);

--pracownik
INSERT INTO ym_pracownik
VALUES(seq_pracownik.nextval,'2020-11-11','Przemyslaw','Prosty',3500);
INSERT INTO ym_pracownik
VALUES(seq_pracownik.nextval,'2002-11-03','Filemon','Krzywy',7900);
INSERT INTO ym_pracownik
VALUES(seq_pracownik.nextval,'2015-09-05','Krzysztof','Sauc',4500);
INSERT INTO ym_pracownik
VALUES(seq_pracownik.nextval,'2009-07-04','Michal','Waski',3000);
INSERT INTO ym_pracownik
VALUES(seq_pracownik.nextval,'2003-05-03','Rafal','Dlugi',3500);
INSERT INTO ym_pracownik
VALUES(seq_pracownik.nextval,'2014-03-01','Adam','Krotki',3500);

--zamowienie
INSERT INTO ym_zamowienie
VALUES(seq_zamowienie.nextval,'2021-11-11','wyslane',1,1);
INSERT INTO ym_zamowienie
VALUES(seq_zamowienie.nextval,'2020-03-03','zrealizowane',2,1);
INSERT INTO ym_zamowienie
VALUES(seq_zamowienie.nextval,'2021-12-12','oplacone',4,2);
INSERT INTO ym_zamowienie
VALUES(seq_zamowienie.nextval,'2022-01-01','przetwarzanie',5,3);

--rachunek
INSERT INTO ym_rachunek
VALUES(seq_rachunek.nextval,'2021-11-11',1,1);
INSERT INTO ym_rachunek
VALUES(seq_rachunek.nextval,'2020-03-03',1,2);
INSERT INTO ym_rachunek
VALUES(seq_rachunek.nextval,'2021-12-12',2,3);

--pozycje_rachunku
    --rachunek 1
INSERT INTO ym_pozycje_rachunku
VALUES(seq_pozycje_rachunku.nextval,3,5,1);
INSERT INTO ym_pozycje_rachunku
VALUES(seq_pozycje_rachunku.nextval,1,7,1);
INSERT INTO ym_pozycje_rachunku
VALUES(seq_pozycje_rachunku.nextval,2,15,1);
    --rachunek 2
INSERT INTO ym_pozycje_rachunku
VALUES(seq_pozycje_rachunku.nextval,1,22,2);
INSERT INTO ym_pozycje_rachunku
VALUES(seq_pozycje_rachunku.nextval,4,2,2);
    --rachunek 3
INSERT INTO ym_pozycje_rachunku
VALUES(seq_pozycje_rachunku.nextval,1,1,3);
INSERT INTO ym_pozycje_rachunku
VALUES(seq_pozycje_rachunku.nextval,1,19,3);
INSERT INTO ym_pozycje_rachunku
VALUES(seq_pozycje_rachunku.nextval,2,6,3);

--Tworzenie perspektyw

--najlepiej sprzedajace sie producenci
CREATE OR REPLACE VIEW top_producenci as
select producent, sum(ilosc_pozycji)as ilosc, sum(ilosc_pozycji * cena_produktu) as laczna_kwota 
from ym_produkt, ym_pozycje_rachunku
where ym_produkt.id_produktu=ym_pozycje_rachunku.id_produktu
group by producent
order by count(ilosc_pozycji) desc;
    select *  from top_producenci;

--zarobki wedlug miesiecy
CREATE OR REPLACE VIEW zarobki_wg_miesiecy as
select extract(year from data_rachunku) as rok, extract(month from data_rachunku) as miesiac, sum(ilosc_pozycji*cena_produktu) as kwota
from ym_produkt, ym_rachunek, ym_pozycje_rachunku 
where ym_rachunek.id_rachunku=ym_pozycje_rachunku.id_rachunku AND ym_pozycje_rachunku.id_produktu=ym_produkt.id_produktu
group by extract(year from data_rachunku),extract(month from data_rachunku)
order by extract(year from data_rachunku),extract(month from data_rachunku);
    select *  from zarobki_wg_miesiecy;

CREATE OR REPLACE VIEW oferta_sklepu as
SELECT nazwa_kategorii, podkategoria, nazwa_produktu, kraj_pochodzenia, producent, masa_produktu, cena_produktu
FROM ym_kategoria, ym_produkt
WHERE ym_kategoria.id_kategorii=ym_produkt.id_kategorii
order by ym_kategoria.id_kategorii, podkategoria;
    select * from oferta_sklepu;

--z jakiego regionu najwiecej zamowien
CREATE OR REPLACE VIEW top_region as
SELECT region, count(*) as zamowien
FROM ym_adres, ym_klient, ym_zamowienie
WHERE ym_adres.id_adresu=ym_klient.id_adresu AND ym_klient.id_klienta=ym_zamowienie.id_klienta
GROUP BY region
order by count(*) desc;
    select * from top_region;
--z jakiego miasta najwiecej zamowien
CREATE OR REPLACE VIEW top_miasto as
SELECT miasto, count(*) as zamowien
FROM ym_adres, ym_klient, ym_zamowienie
WHERE ym_adres.id_adresu=ym_klient.id_adresu AND ym_klient.id_klienta=ym_zamowienie.id_klienta
GROUP BY miasto
order by count(*) desc;
    select * from top_miasto;

DROP TABLE ym_produkt CASCADE CONSTRAINTS;
DROP TABLE ym_kategoria CASCADE CONSTRAINTS;
DROP TABLE ym_zamowienie CASCADE CONSTRAINTS;
DROP TABLE ym_adres CASCADE CONSTRAINTS;
DROP TABLE ym_klient CASCADE CONSTRAINTS;
DROP TABLE ym_pracownik CASCADE CONSTRAINTS;
DROP TABLE ym_rachunek CASCADE CONSTRAINTS;
DROP TABLE ym_pozycje_rachunku CASCADE CONSTRAINTS;

DROP SEQUENCE seq_produkt;
DROP SEQUENCE seq_kategoria;
DROP SEQUENCE seq_zamowienie;
DROP SEQUENCE seq_klient;
DROP SEQUENCE seq_pracownik;
DROP SEQUENCE seq_adres;
DROP SEQUENCE seq_rachunek;
DROP SEQUENCE seq_pozycje_rachunku;

Drop VIEW top_region;
DROP VIEW top_miasto;
DROP VIEW oferta_sklepu;
DROP VIEW zarobki_wg_miesiecy;
DROP VIEW top_producenci;
