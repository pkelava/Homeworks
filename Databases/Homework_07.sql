SET SERVEROUTPUT ON;


---a)

SELECT MAX(vrsta_studija_id)
FROM vrsta_studija;

CREATE SEQUENCE vs_sequence
    START WITH 3
    INCREMENT BY 1
    MAXVALUE 100;

CREATE OR REPLACE PROCEDURE vs_update (
vs_naziv IN vrsta_studija.naziv%TYPE,
vs_trajanje_studija IN vrsta_studija.trajanje_studija%TYPE
) AS
vs_brojac INTEGER;
BEGIN
    SELECT COUNT(*)
    INTO vs_brojac
    FROM vrsta_studija
    WHERE naziv = vs_naziv;
    
    IF vs_brojac = 0 THEN
        INSERT INTO vrsta_studija VALUES (vs_sequence.nextval, vs_naziv, vs_trajanje_studija);
        COMMIT;
    ELSE
        UPDATE vrsta_studija
        SET trajanje_studija = vs_trajanje_studija
        WHERE naziv = vs_naziv;
        COMMIT;
    END IF;
    EXCEPTION 
    WHEN OTHERS THEN
        ROLLBACK;
        
END vs_update;
/

CALL vs_update('Diplomski studij Matematika i Ra?unarstvo', 2);

SELECT * FROM vrsta_studija;

DELETE FROM vrsta_studija
WHERE naziv = 'Diplomski studij Matematika i Ra?unarstvo';

-- b)
--Zadatak kaze da se i kolegij_id moze promjeniti, no u tom slucaju
--nemamo ni jedan atribut po kojem mozemo prepoznati koji kolegij zelimo mjenjat
--pa u slucaju kad svaki atribut mijenjamo nemamo ni jedan moguci nacin da pristupimo nekom retku i promjenimo ga
--pa sam zbog toga napravio da se preko kolegij_id-a prepozna koji redak zelimo mjenjat ili dodati te mi se
--jedino kolegij_id ne moze mjenjat

SELECT MAX(st_prg_id) FROM studijski_program;

CREATE SEQUENCE studijski_program_sequence
    START WITH 79
    INCREMENT BY 1
    MAXVALUE 1000;

CREATE OR REPLACE PROCEDURE kolegij_update(ko_kolegij_id IN VARCHAR2, ko_naziv IN VARCHAR2, ko_p IN NUMBER, ko_v IN NUMBER, ko_s IN NUMBER, ko_ects IN NUMBER, 
    sp_studij IN NUMBER, sp_godina IN NUMBER, sp_obvezni IN NUMBER) AS
    counter INTEGER;
    begin
        SELECT COUNT(*) 
        INTO counter 
        FROM kolegij 
        WHERE kolegij_id = ko_kolegij_id;
        
        IF counter = 0 THEN
            INSERT INTO kolegij VALUES (ko_kolegij_id, ko_naziv, ko_p, ko_v, ko_s, ko_ects); 
            INSERT INTO studijski_program VALUES (studijski_program_sequence.NEXTVAL, sp_studij, ko_kolegij_id, sp_godina, sp_obvezni);
        ELSE
            UPDATE kolegij
            SET naziv = ko_naziv, p = ko_p, v = ko_v, s = ko_s, ects = ko_ects WHERE kolegij_id = ko_kolegij_id;
            UPDATE studijski_program
            SET godina = sp_godina, obvezni = sp_obvezni, vrsta_studija_id = sp_studij
            WHERE kolegij_id = ko_kolegij_id;
        COMMIT;
        END IF;
        EXCEPTION
        WHEN OTHERS THEN
        ROLLBACK;
    END kolegij_update;
/

CALL kolegij_update('I111', 'Heuristicki algoritmi', 2, 2, 1, 4, 1, 2, 0);
SELECT * FROM kolegij where kolegij_id = 'I111';  
SELECT * FROM studijski_program where kolegij_id = 'I111'; 
CALL kolegij_update('I111', 'Heuristicki', 2, 2, 1, 4, 1, 2, 0);
SELECT * FROM kolegij where kolegij_id = 'I111';  
DELETE FROM Kolegij
WHERE kolegij_id = 'I111';

-------------------------------------------------------- c)

SELECT MAX(izvedbeni_id) FROM izvedbeni_plan;

CREATE SEQUENCE ip_sequence
    START WITH 79
    INCREMENT BY 1
    MAXVALUE 1000;

--Zadatak kaze da za kolegij na odre?enom studijskom programu unosimo podatke koje zelimo promjeniti
--pa iz tog razloga prosljedjujem i st_prg_id, u suprotnom bi imali problema jer ima predmeta
--koji se odvijaju vise puta na razlicitim vrstama studija te nebi bilo jasno na koji se odnosi
CREATE OR REPLACE PROCEDURE izvedbeni_plan_update (sp_id IN NUMBER,
    ip_godina IN VARCHAR2, ip_semestar IN VARCHAR2, ip_grupa IN NUMBER) AS
    counter INTEGER;
    BEGIN
        SELECT COUNT(*)
        INTO counter
        FROM izvedbeni_plan
        WHERE sp_id = st_prg_id;
        
        IF COUNTER = 0 THEN
          INSERT INTO izvedbeni_plan 
          VALUES (ip_sequence.NEXTVAL, sp_id, ip_semestar, ip_grupa, ip_godina);
        ELSE
          UPDATE izvedbeni_plan 
          SET AKADEMSKA_GODINA = ip_godina, SEMESTAR = ip_semestar, BR_GRUPA = ip_grupa where st_prg_id = sp_id;
        COMMIT;
        END IF;
        EXCEPTION
            WHEN OTHERS THEN
            ROLLBACK;
    END izvedbeni_plan_update;
    /
    
CALL kolegij_update ('I111', 'Heuristicki algoritmi', 2, 2, 1, 4, 1, 2, 0);
SELECT *
FROM studijski_program
WHERE kolegij_id = 'I111';
CALL izvedbeni_plan_update (119, '2019/2020', 'ljetni', 1);
SELECT * FROM studijski_program WHERE kolegij_id = 'I111';
SELECT * FROM izvedbeni_plan WHERE st_prg_id = 119;

 
--- d)

SELECT MAX(djelatnik_id) FROM djelatnik;

CREATE SEQUENCE djelatnik_sequence
    start with 3900
    increment by 100
    MAXVALUE 100000;
    
CREATE OR REPLACE PROCEDURE unos_djelatnika (dj_ime IN VARCHAR2, dj_prezime IN VARCHAR2, dj_spol IN VARCHAR2) AS
broj_djelatnika INTEGER;
BEGIN
    SELECT COUNT(*)
    INTO broj_djelatnika
    FROM djelatnik
    WHERE djelatnik.ime = dj_ime AND djelatnik.prezime = dj_prezime AND djelatnik.spol = dj_spol; 
    
    IF broj_djelatnika = 0 THEN
      INSERT INTO djelatnik VALUES (djelatnik_sequence.NEXTVAL, dj_ime, dj_prezime, dj_spol);
    COMMIT;
    END IF;
END unos_djelatnika;
/
CALL unos_djelatnika ('Petar','Kelava','M');
SELECT * 
FROM djelatnik 
WHERE ime = 'Petar' AND prezime = 'Kelava';
DELETE FROM djelatnik
WHERE ime = 'Petar' AND prezime = 'Kelava';
-- f)
CREATE OR REPLACE TRIGGER kolegij_satnica
    BEFORE INSERT ON kolegij
    FOR EACH ROW WHEN
    (NEW.p = 0 AND NEW.v = 0 AND NEW.s = 0)
    BEGIN
        raise_application_error(-20000, ' Satinca = Predavanja = Vjezbi = 0');
        COMMIT;
    END;
/

INSERT INTO kolegij VALUES ('I111', 'Heuristicki algoritmi', 0, 0 ,0, 4);

CREATE OR REPLACE TRIGGER kolegij_ects
    BEFORE UPDATE ON kolegij
    FOR EACH ROW WHEN
    (NEW.ects >= OLD.ects / 2)
    BEGIN
        raise_application_error(-20001, 'Nedovoljno smanjeni ECTS bodovi');
        COMMIT;
    END;
/
update kolegij set ects = 1 where kolegij_id = 'I111';
update kolegij set ects = 10 where kolegij_id = 'I111';
DROP TRIGGER kolegij_satnica;
DROP TRIGGER kolegij_ects;

-- g)
--Oslanjamo se na to da smo u prijasnjim vjezbama napravili on delete cascade 
CREATE OR REPLACE PROCEDURE kolegij_D(ko_id IN VARCHAR2)
as
BEGIN
    DELETE FROM kolegij WHERE kolegij_id = ko_id;
    COMMIT;
    EXCEPTION
            WHEN OTHERS THEN
            ROLLBACK;
END kolegij_D;
/

call kolegij_D ('I111');
SELECT * 
FROM kolegij INNER JOIN studijski_program USING (kolegij_id)
INNER JOIN izvedbeni_plan USING (st_prg_id)
INNER JOIN djelatnik_izvedbeni USING (izvedbeni_id)
INNER JOIN djelatnik USING (djelatnik_id)
WHERE kolegij_id = 'I111';
COMMIT;