--Prvi Zadatak
CREATE VIEW podaci AS
SELECT *
FROM kolegij
WHERE p + v >= 6;

SELECT *
FROM podaci;

INSERT INTO podaci(kolegij_id,naziv,p,v,s,ects)
VALUES('I111','Heuristi?ki algoritmi',2,2,1,4);

SELECT *
FROM podaci;

SELECT *
FROM kolegij;

--Heuristi?ki algoritmi se jesu dodali u tablicu kolegij, ali mi ne vidimo
--Heuristi?ke algoritme kroz pogled 'podaci' jer mu satnica ne zadovoljava uvijet
--pogleda, tj satnica vjezbi i predavanja mu je manja od 6.

ROLLBACK; --Da maknemo Heuristi?ke algoritme iz tablice kolegij 

DROP VIEW podaci;

CREATE VIEW podaci AS
SELECT *
FROM kolegij
WHERE p + v >= 6
WITH CHECK OPTION CONSTRAINT podaci;

INSERT INTO podaci(kolegij_id,naziv,p,v,s,ects)
VALUES('I111','Heuristi?ki algoritmi',2,2,1,4);

--Drugi Zadatak

CREATE VIEW sakriven (djelatnik_id INVISIBLE, ime, prezime, spol) AS
SELECT *
FROM djelatnik;

SELECT *
FROM sakriven;

SELECT djelatnik_id, ime, prezime, spol
from sakriven;

--Tre?i zadatak

CREATE VIEW djelatnik_pogled AS
SELECT DISTINCT dj.ime, dj.prezime, dj.spol, di.uloga
FROM djelatnik dj INNER JOIN djelatnik_izvedbeni di USING(djelatnik_ID)
INNER JOIN izvedbeni_plan ip USING (izvedbeni_id)
INNER JOIN studijski_program sp USING (st_prg_id)
WHERE sp.godina = 1 AND sp.vrsta_studija_id = 1;

SELECT *
FROM djelatnik_pogled
ORDER BY ime, prezime;

CREATE VIEW kolegij_pogled  AS
SELECT ko.naziv, ko.p, ko.v, ko.s, ko.ects,dj.ime||' '||dj.prezime  Nastavnik
FROM djelatnik dj INNER JOIN djelatnik_izvedbeni di USING (djelatnik_id)
INNER JOIN izvedbeni_plan ip USING (izvedbeni_id)
INNER JOIN studijski_program sp USING (st_prg_id)
INNER JOIN kolegij ko USING (kolegij_id)
WHERE sp.godina = 2 AND di.uloga = 'nastavnik' AND sp.vrsta_studija_id = 1;

SELECT *
FROM kolegij_pogled;

CREATE VIEW studij_pogled AS
SELECT  vs.naziv, sp.godina,COUNT(DISTINCT dj.ime||' '||dj.prezime) djelatnik
FROM djelatnik dj INNER JOIN djelatnik_izvedbeni di USING (djelatnik_id)
INNER JOIN izvedbeni_plan ip USING (izvedbeni_id)
INNER JOIN studijski_program sp USING (st_prg_id)
INNER JOIN vrsta_studija vs USING (vrsta_studija_id)
GROUP BY vs.naziv, sp.godina
ORDER BY vs.naziv, sp.godina;

SELECT *
FROM studij_pogled;