SELECT vs.naziv AS "Naziv studija", vs.godina, AVG(vs.ULOGA) AS "Prosje?an broj djelatnika"
FROM (SELECT vs.naziv, sp.godina, kolegij_id, COUNT(DISTINCT di.djelatnik_id) ULOGA
FROM studijski_program sp INNER JOIN izvedbeni_plan ip
USING(st_prg_id)
INNER JOIN djelatnik_izvedbeni di
USING(izvedbeni_id)
INNER JOIN vrsta_studija vs
USING(vrsta_studija_id)
INNER JOIN kolegij
USING (kolegij_id)
GROUP BY vs.naziv, sp.godina, kolegij_id
) vs
GROUP BY vs.naziv, vs.godina
ORDER BY vs.naziv, vs.godina;

SELECT ko.naziv AS "Naziv kolegija", vs.naziv AS "Naziv studija", sp.godina
FROM kolegij ko INNER JOIN studijski_program sp USING(kolegij_id)
INNER JOIN vrsta_studija vs USING(vrsta_studija_id)
WHERE (ko.ects,sp.godina, vrsta_studija_id) IN (SELECT MAX(ko.ects) ects, unut.godina,unut.vrsta_studija_id
FROM kolegij ko INNER JOIN studijski_program unut USING(kolegij_id)
GROUP BY unut.godina, unut.vrsta_studija_id)
GROUP BY ko.naziv,vs.naziv, sp.godina, ko.ects
ORDER BY vs.naziv, sp.godina, ko.naziv;

SELECT DISTINCT ko.naziv AS "Naziv kolegija"
FROM kolegij ko INNER JOIN studijski_program sp USING (kolegij_id)
WHERE kolegij_id NOT IN
( SELECT kolegij_id
  FROM studijski_program
  WHERE vrsta_studija_id = 2)
ORDER BY ko.naziv;

SELECT ko.naziv AS "Naziv kolegija"
FROM studijski_program sp INNER JOIN izvedbeni_plan ip
USING(st_prg_id)
INNER JOIN djelatnik_izvedbeni di
USING(izvedbeni_id)
INNER JOIN vrsta_studija vs
USING(vrsta_studija_id)
INNER JOIN kolegij ko
USING (kolegij_id)
GROUP BY vrsta_studija_id, sp.godina, ko.naziv
HAVING vrsta_studija_id = 1 AND COUNT(DISTINCT di.djelatnik_id) IN (SELECT MAX(vss.ULOGA) ULOGA
FROM (SELECT vrsta_studija_id, spp.godina, koo.naziv naziv, COUNT(DISTINCT dii.djelatnik_id) ULOGA
FROM studijski_program spp INNER JOIN izvedbeni_plan ipp
USING(st_prg_id)
INNER JOIN djelatnik_izvedbeni dii
USING(izvedbeni_id)
INNER JOIN vrsta_studija vss
USING(vrsta_studija_id)
INNER JOIN kolegij koo
USING (kolegij_id)
GROUP BY vrsta_studija_id, spp.godina, koo.naziv
) vss
WHERE vss.vrsta_studija_id = 1
GROUP BY vss.vrsta_studija_id)
ORDER BY ko.naziv;
  
SELECT vs.naziv AS "Naziv studija", godina
FROM
(SELECT vs.naziv,SUM(CASE WHEN sp.obvezni=0 THEN 1 ELSE 0 END)as izb,sp.godina
    FROM vrsta_studija vs INNER JOIN studijski_program sp USING (vrsta_studija_id)
    GROUP BY sp.GODINA,vs.NAZIV) vs
WHERE vs.izb = (
SELECT MIN(izb)
FROM (
    SELECT SUM(CASE WHEN sp.obvezni=0 THEN 1 ELSE 0 END)as izb
    FROM  vrsta_studija vs INNER JOIN studijski_program sp USING (vrsta_studija_id)
    GROUP BY sp.GODINA,vs.NAZIV));


SELECT DISTINCT naziv AS "Naziv studija",vs.godina, vs.semestar, CASE WHEN vs.godina != 3 THEN vs.ects+nvl(sp.ects,0) ELSE vs.ects END AS "ECTS bodovi"
FROM(
SELECT vs.naziv,ip.semestar, sp.godina, SUM(ko.ects) ects
FROM studijski_program sp INNER JOIN kolegij ko USING (kolegij_id)
INNER JOIN izvedbeni_plan ip USING (st_prg_id)
INNER JOIN vrsta_studija vs USING (vrsta_studija_id)
WHERE sp.obvezni = 1 AND (ip.semestar = 'zimski' OR ip.semestar = 'ljetni')
GROUP BY vs.naziv, ip.semestar, sp.godina, vrsta_studija_id) vs
INNER JOIN
(SELECT vs.naziv, ip.semestar, sp.godina, ko.ects/2 ects
FROM studijski_program sp INNER JOIN kolegij ko USING (kolegij_id)
INNER JOIN izvedbeni_plan ip USING (st_prg_id)
INNER JOIN vrsta_studija vs USING (vrsta_studija_id)
WHERE sp.obvezni = 1 AND ip.semestar = 'zimski i ljetni'
GROUP BY vs.naziv, ip.semestar, sp.godina,ko.ects) sp USING (naziv) 
ORDER BY naziv ASC, vs.godina ASC , vs.semestar DESC;
