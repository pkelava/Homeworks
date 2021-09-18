--PRVI ZADATAK

INSERT INTO kolegij (kolegij_id,naziv,p,v,s,ects)
VALUES ('I111','Heuristi?ki algoritmi',2,2,1,4);

SELECT MAX(st_prg_id) st_prg_id
FROM studijski_program;

SELECT MAX(vrsta_studija_id) vrsta_studija_id
FROM vrsta_studija
WHERE naziv = 'Preddiplomski studij Matematika i ra?unarstvo';

INSERT INTO studijski_program (st_prg_id,vrsta_studija_id,kolegij_id,godina,obvezni)
VALUES (79,1,'I111',2,0);

SELECT *
FROM studijski_program
WHERE kolegij_id = 'I111';

SELECT MAX(izvedbeni_id) izvedbeni_id
FROM izvedbeni_plan;

INSERT INTO izvedbeni_plan (izvedbeni_id, st_prg_id, semestar, br_grupa, akademska_godina)
VALUES (79, 79, 'zimski', 1, '2019/2020');

SELECT *
FROM djelatnik
WHERE (ime = 'Slobodan' AND prezime = 'Jeli?') OR (ime = 'Ena' AND prezime = 'Pribisali?');

INSERT INTO djelatnik_izvedbeni (izvedbeni_id, djelatnik_id, uloga)
VALUES (79, 2300, 'asistent');

INSERT INTO djelatnik_izvedbeni (izvedbeni_id, djelatnik_id, uloga)
VALUES (79, 400, 'nastavnik');

UPDATE kolegij
SET P = P - P/2, V = V + V/2
WHERE kolegij_id = 'I111';

SELECT *
FROM kolegij
WHERE kolegij_id = 'I111';

ALTER TABLE studijski_program
DROP CONSTRAINT studijskI_program_kolegij;

ALTER TABLE studijski_program
ADD CONSTRAINT studijski_program_kolegij
FOREIGN KEY (kolegij_id)
REFERENCES kolegij(kolegij_id)
ON DELETE CASCADE;

ALTER TABLE izvedbeni_plan
DROP CONSTRAINT izvedbeni_plan_studijski_program;

ALTER TABLE izvedbeni_plan
ADD CONSTRAINT izvedbeni_plan_studijski_program
FOREIGN KEY (st_prg_id)
REFERENCES studijski_program(st_prg_id)
ON DELETE CASCADE;

ALTER TABLE djelatnik_izvedbeni
DROP CONSTRAINT djelatnik_izvedbeni_djelatnik;

ALTER TABLE djelatnik_izvedbeni
ADD CONSTRAINT djelatnik_izvedbeni_djelatnik
FOREIGN KEY (djelatnik_id)
REFERENCES djelatnik(djelatnik_id)
ON DELETE CASCADE;

ALTER TABLE djelatnik_izvedbeni
DROP CONSTRAINT djelatnik_izvedbeni_izvedbeni_plan;

ALTER TABLE djelatnik_izvedbeni
ADD CONSTRAINT djelatnik_izvedbeni_izvedbeni_plan
FOREIGN KEY (izvedbeni_id)
REFERENCES izvedbeni_plan(izvedbeni_id)
ON DELETE CASCADE;

DELETE FROM kolegij
WHERE kolegij_id = 'I111';

ALTER TABLE kolegij
ADD (ukupna_satnica AS (P + V + S));

DESCRIBE kolegij;

SELECT *
FROM kolegij;

ALTER TABLE kolegij
DROP COLUMN ukupna_satnica;

ALTER TABLE izvedbeni_plan
ADD CONSTRAINT semestar_ck
CHECK (semestar IN ('zimski','ljetni','zimski i ljetni'));

ALTER TABLE djelatnik_izvedbeni
ADD CONSTRAINT uloga_ck
CHECK (uloga IN ('nastavnik','asistent'));

INSERT INTO kolegij (kolegij_id,naziv,p,v,s,ects)
VALUES ('I111','Heuristi?ki algoritmi',2,2,1,4);

SELECT MAX(st_prg_id) st_prg_id
FROM studijski_program;

SELECT MAX(vrsta_studija_id) vrsta_studija_id
FROM vrsta_studija
WHERE naziv = 'Preddiplomski studij Matematika i ra?unarstvo';

INSERT INTO studijski_program (st_prg_id,vrsta_studija_id,kolegij_id,godina,obvezni)
VALUES (79,1,'I111',2,0);

SELECT *
FROM studijski_program
WHERE kolegij_id = 'I111';

SELECT MAX(izvedbeni_id) izvedbeni_id
FROM izvedbeni_plan;

INSERT INTO izvedbeni_plan (izvedbeni_id, st_prg_id, semestar, br_grupa, akademska_godina)
VALUES (79, 79, 'proljetni', 1, '2019/2020');

INSERT INTO izvedbeni_plan (izvedbeni_id, st_prg_id, semestar, br_grupa, akademska_godina)
VALUES (79, 79, 'zimski', 1, '2019/2020');

SELECT *
FROM djelatnik
WHERE (ime = 'Slobodan' AND prezime = 'Jeli?') OR (ime = 'Ena' AND prezime = 'Pribisali?');

INSERT INTO djelatnik_izvedbeni (izvedbeni_id, djelatnik_id, uloga)
VALUES (79, 2300, 'asistent');

INSERT INTO djelatnik_izvedbeni (izvedbeni_id, djelatnik_id, uloga)
VALUES (79, 400, 'profesor');

INSERT INTO djelatnik_izvedbeni (izvedbeni_id, djelatnik_id, uloga)
VALUES (79, 400, 'nastavnik');

ROLLBACK;

COMMENT ON TABLE kolegij IS
'Sadrži podatke o kolegijima';

COMMENT ON TABLE vrsta_studija IS
'Koje sve smijerove ima fakultet';

COMMENT ON TABLE studijski_program IS
'Veže vrstu studija, s kolegijem i obveznost na odre?enim godinama';

COMMENT ON TABLE djelatnik IS
'Podaci o nastavnicima i asistentima';

COMMENT ON TABLE djelatnik_izvedbeni IS
'Spaja profesora s predmetima i dodjeljuje im ulogu za taj predmet';

COMMENT ON TABLE izvedbeni_plan IS
'Kojoj se akademskoj godini izvodi predmet, koji semestar i koliko grupa ima';

SELECT *
FROM user_tab_comments
WHERE table_name = 'DJELATNIK';

CREATE GLOBAL TEMPORARY TABLE zaposlenik_temp
(
  zaposlenik_id INTEGER,
  ime VARCHAR2(20),
  prezime VARCHAR2(20),
  mijesto_stanovanja VARCHAR2(20) DEFAULT 'N/A'
);

INSERT INTO zaposlenik_temp
VALUES(1,'Petar','Kelava','Ernestinovo');
INSERT INTO zaposlenik_temp
VALUES(1,'Pero','Peri?',DEFAULT);

SELECT *
FROM zaposlenik_temp;

--TRE?I ZADATAK

--Dirty reads jer radim update nad stupcima tablice kolegij
--te ispisujem taj update prije nego sto sam commitao
--te na kraju radim rollback prije updatea pa mi taj ispis vise nije validan
SAVEPOINT save1;

UPDATE kolegij
SET P = P - P/2, V = V + V/2;


SELECT naziv, P, V
FROM kolegij;

ROLLBACK TO SAVEPOINT save1;

CREATE INDEX naziv_kolegija ON kolegij(naziv);

COMMIT;