SELECT vrsta_studija_id, rowid
FROM vrsta_studija;

SELECT naziv, p + v + s as "Satnica", ects
FROM kolegij;

SELECT ime || ' ' || prezime as "Ime i Prezime"
FROM djelatnik;

SELECT ime || ' ' || prezime as "Ime i Prezime"
FROM djelatnik
WHERE spol = 'M';

SELECT naziv AS "KOLEGIJ"
FROM kolegij
WHERE ects > 5 AND p + v + s >= 3;

SELECT vs.naziv AS "Naziv Studija", ko.naziv AS "Naziv Kolegija", sp.godina
FROM studijski_program sp INNER JOIN kolegij ko
USING (kolegij_id)
INNER JOIN vrsta_studija vs
USING (vrsta_studija_id)
WHERE sp.obvezni = 1
ORDER BY vs.naziv,ko.naziv;

SELECT ko.naziv AS "Naziv Kolegija"
FROM kolegij ko INNER JOIN studijski_program sp
USING (kolegij_id)
INNER JOIN izvedbeni_plan ip
USING (st_prg_id)
INNER JOIN vrsta_studija vs
USING(vrsta_studija_id)
WHERE ip.semestar = 'zimski' AND sp.godina = 1 AND vrsta_studija_id = 2
ORDER BY ko.NAZIV;

SELECT ko.naziv AS "Naziv Kolegija", 'Djelatnik: ' || dj.ime || ' ' || dj.prezime AS "Djelatnik koji ga izvodi", di.uloga
FROM djelatnik_izvedbeni di INNER JOIN djelatnik dj
USING (djelatnik_id)
INNER JOIN izvedbeni_plan ip
USING (izvedbeni_id)
INNER JOIN studijski_program sp
USING (st_prg_id)
INNER JOIN kolegij ko
USING (kolegij_id)
INNER JOIN vrsta_studija vs
USING (vrsta_studija_id)
WHERE vrsta_studija_id = 1 AND sp.godina = 2
ORDER BY ko.naziv;

SELECT DISTINCT dj.prezime AS "PREZIME" , dj.ime AS "IME"
FROM djelatnik dj INNER JOIN djelatnik_izvedbeni di
USING (djelatnik_id)
WHERE di.uloga = 'nastavnik'
ORDER BY dj.prezime, dj.ime;

SELECT DISTINCT ko.naziv AS "KOLEGIJ", ko.ects AS "ECTS"
FROM studijski_program sp INNER JOIN kolegij ko
USING (kolegij_id)
INNER JOIN izvedbeni_plan ip
USING (st_prg_id)
WHERE ip.semestar = 'zimski i ljetni'
ORDER BY ko.ects;

SELECT vs.naziv AS "SMJER", replace(replace(sp.obvezni,1,'obvezni'),0,'izborni') AS "OBVEZNOST", COUNT(kolegij_id) "BROJ OBVEZNIH/IZBORNIH", MAX(ko.ects) as "PREDMET S MAX ECTS-A", MIN(ko.ects) AS "PREDMET S MIN ECTS-A"
FROM vrsta_studija vs INNER JOIN studijski_program sp
USING (vrsta_studija_id)
INNER JOIN kolegij ko
USING (kolegij_id)
GROUP BY vs.naziv, sp.obvezni
ORDER BY vs.naziv;

SELECT vs.naziv AS "SMJER", sp.godina "GODINA IZVO?ENJA", ip.semestar "SEMESTAR"
FROM vrsta_studija vs INNER JOIN studijski_program sp
USING (vrsta_studija_id)
INNER JOIN kolegij ko
USING (kolegij_id)
INNER JOIN izvedbeni_plan ip
USING (st_prg_id)
WHERE sp.obvezni = 1
GROUP BY vs.naziv, sp.godina, ip.semestar
HAVING SUM(ko.ects) >= 20
ORDER BY vs.naziv, sp.godina;

SELECT dj.prezime AS "PREZIME", dj.ime AS "IME", di.uloga AS "ULOGA", COUNT(di.uloga) "BROJ KOLEGIJA"
FROM djelatnik dj INNER JOIN djelatnik_izvedbeni di
USING (djelatnik_id)
INNER JOIN izvedbeni_plan ip
USING (izvedbeni_id)
INNER JOIN studijski_program sp
USING (st_prg_id)
INNER JOIN kolegij ko
USING (kolegij_id)
GROUP BY dj.ime, dj.prezime, di.uloga
ORDER BY dj.prezime, dj.ime;

SELECT vs.naziv AS "SMJER",ko.naziv AS "KOLEGIJ", di.uloga "ULOGA", dj.prezime "PREZIME", dj.ime "IME", sp.godina "GODINA IZVO?ENJA", ip.semestar "SEMESTAR"
FROM kolegij ko INNER JOIN studijski_program sp
USING (kolegij_id)
INNER JOIN izvedbeni_plan ip 
USING (st_prg_id)
INNER JOIN vrsta_studija vs
USING (vrsta_studija_id)
INNER JOIN djelatnik_izvedbeni di
USING (izvedbeni_id)
INNER JOIN djelatnik dj
USING (djelatnik_id)
GROUP BY vs.naziv, ko.naziv, di.uloga, dj.prezime, dj.ime, sp.godina, ip.semestar
ORDER BY vs.naziv, ko.naziv, di.uloga, dj.prezime, dj.ime;


SELECT vs.naziv AS "SMJER", ko.naziv AS "KOLEGIJ"
FROM kolegij ko INNER JOIN studijski_program sp
USING (kolegij_id)
INNER JOIN vrsta_studija vs
USING (vrsta_studija_id)
INNER JOIN izvedbeni_plan ip
USING (st_prg_id)
INNER JOIN djelatnik_izvedbeni di
USING (izvedbeni_id)
INNER JOIN djelatnik dj
USING (djelatnik_id)
WHERE di.uloga = 'nastavnik'
GROUP BY vs.naziv, ko.naziv
HAVING COUNT(di.uloga) >= 2
ORDER BY vs.naziv, ko.naziv;