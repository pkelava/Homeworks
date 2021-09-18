create table vrsta_studija(
vrsta_studija_id NUMBER(3) CONSTRAINT vrsta_studija_pk PRIMARY KEY,
naziv VARCHAR(100) NOT NULL,
trajanje_studija NUMBER(1) NOT NULL
);

create table kolegij(
kolegij_id VARCHAR(4) CONSTRAINT kolegij_pk PRIMARY KEY,
naziv VARCHAR(150) NOT NULL,
P NUMBER(2) NOT NULL,
V NUMBER(2) NOT NULL,
S NUMBER(2) NOT NULL,
ECTS NUMBER(2) NOT NULL
);

create table studijski_program(
st_prg_id NUMBER(3) CONSTRAINT st_prg_pk PRIMARY KEY,
vrsta_studija_id  NUMBER(3)
  CONSTRAINT studijski_program_fk_vrsta_studija
  REFERENCES vrsta_studija(vrsta_studija_id),
kolegij_id VARCHAR(4)
  CONSTRAINT studijski_program_fk_kolegij
  REFERENCES kolegij(kolegij_id),
godina NUMBER(2) NOT NULL,
obvezni NUMBER(1) NOT NULL
);


create table izvedbeni_plan(
izvedbeni_id NUMBER(3) CONSTRAINT izvedbeni_pk PRIMARY KEY,
st_prg_id NUMBER(3)
  CONSTRAINT izvedbeni_plan_fk_studijski_program
  REFERENCES studijski_program(st_prg_id),
semestar VARCHAR(15) NOT NULL,
br_grupa NUMBER(1),
akademska_godina VARCHAR(9)
);

create table djelatnik(
djelatnik_id NUMBER(6) CONSTRAINT djelatnik_pk PRIMARY KEY,
ime VARCHAR(30) NOT NULL,
prezime VARCHAR(30) NOT NULL,
spol VARCHAR(1
);

create table djelatnik_izvedbeni(
izvedbeni_id NUMBER(3)
  CONSTRAINT djelatnik_izvedbeni_fk_izvedbeni_plan
  REFERENCES izvedbeni_plan(izvedbeni_plan_id),
djelatnik_id NUMBER(6)
  CONSTRAINT djelatnik_izvedbenik_fk_djelatnik
  REFERENCES djelatnik(djelatnik_id),
uloga VARCHAR(30) CONSTRAINT djelatnik_izvedbeni_pk PRIMARY KEY
);

INSERT INTO vrsta_studija (vrsta_studija_id, naziv, trajanje_studija)
VALUES (1, 'preddiplomski studij Matematika', 3);

INSERT INTO vrsta_studija (vrsta_studija_id, naziv, trajanje_studija)
VALUES (2, 'preddiplomski studij Matematika i racunarstvo', 3);

INSERT INTO kolegij(kolegij_id, naziv, P, V, S, ECTS)
VALUES ('M084' 'Diferencijalni Racun', '4', '3', '0', '8');

INSERT INTO kolegij(kolegij_id, naziv, P, V, S, ECTS)
VALUES ('M100', 'Elementarna Matematika', '2', '2', '0', '6');

INSERT INTO kolegij(kolegij_id, naziv, P, V, S, ECTS)
VALUES ('M086', 'Linearna Algebra I', '2', '2', '0', '6');

INSERT INTO kolegij(kolegij_id, naziv, P, V, S, ECTS)
VALUES ('Z011', 'Strani Jezik u Struci I', '0', '0', '2', '3');

INSERT INTO kolegij(kolegij_id, naziv, P, V, S, ECTS)
VALUES ('Z014', 'Tjelesna i Zdravstvena Kultura I', '0', '2', '0', '1');

INSERT INTO kolegij(kolegij_id, naziv, P, V, S, ECTS)
VALUES ('Z015', 'Tjelesna i Zdravstvena Kultura II', '0', '2', '0', '1');

INSERT INTO kolegij(kolegij_id, naziv, P, V, S, ECTS)
VALUES ('I056', 'Uvod u Racunalnu Znanost', '2', '2', '0', '6');

INSERT INTO kolegij(kolegij_id, naziv, P, V, S, ECTS)
VALUES ('M101', 'Elementarna Geometrija', '2', '2', '0', '6');

INSERT INTO kolegij(kolegij_id, naziv, P, V, S, ECTS)
VALUES ('M085', 'Integralni Racun', '2', '3', '0', '7');

INSERT INTO kolegij(kolegij_id, naziv, P, V, S, ECTS)
VALUES ('M102', 'Kombinatorna i Diskretna Matematika', '2', '2', '0', '6');

INSERT INTO kolegij(kolegij_id, naziv, P, V, S, ECTS)
VALUES ('M087', 'Linearna Algebra_II', '3', '3', '0', '7');

INSERT INTO kolegij(kolegij_id, naziv, P, V, S, ECTS)
VALUES ('Z012', 'Strani Jezik u Struci II', '0', '0', '2', '3');

INSERT INTO kolegij(kolegij_id, naziv, P, V, S, ECTS)
VALUES ('M009', 'Funkcije Vise varijabli', '3', '2', '0', '7');

INSERT INTO kolegij(kolegij_id, naziv, P, V, S, ECTS)
VALUES ('I027', 'Matematicki Alati', '1', '0', '2', '4');

INSERT INTO kolegij(kolegij_id, naziv, P, V, S, ECTS)
VALUES ('M098', 'Uvod u Vjerojatnost i Statistiku', '2', '2', '0', '6');

INSERT INTO kolegij(kolegij_id, naziv, P, V, S, ECTS)
VALUES ('M015', 'Kompleksna Analiza', '2', '2', '0', '6');

INSERT INTO kolegij(kolegij_id, naziv, P, V, S, ECTS)
VALUES ('M089', 'Numericka Matematika', '2', '2', '0', '6');

INSERT INTO kolegij(kolegij_id, naziv, P, V, S, ECTS)
VALUES ('M095', 'Statisticki Praktikum', '1', '2', '1', '6');

INSERT INTO kolegij(kolegij_id, naziv, P, V, S, ECTS)
VALUES ('M108', 'Teorija Brojeva', '2', '2', '0', '6');

INSERT INTO kolegij(kolegij_id, naziv, P, V, S, ECTS)
VALUES ('F007', 'Osnove Fizike I', '4', '2', '1', '7');

INSERT INTO kolegij(kolegij_id, naziv, P, V, S, ECTS)
VALUES ('I053', 'Strukture Podataka i Algoritmi I', '3', '2', '0', '7');

INSERT INTO kolegij(kolegij_id, naziv, P, V, S, ECTS)
VALUES ('M088', 'Matematicka Logika u Racunalnoj Znanosti', '2', '2', '0', '6');

INSERT INTO kolegij(kolegij_id, naziv, P, V, S, ECTS)
VALUES ('M103', 'Matematicka Natjecanja', '0', '3', '0', '4');

INSERT INTO kolegij(kolegij_id, naziv, P, V, S, ECTS)
VALUES ('I048', 'Objektno Orijentirano Programiranje', '2', '2', '0', '6');

INSERT INTO kolegij(kolegij_id, naziv, P, V, S, ECTS)
VALUES ('F008', 'Osnove Fizike II', '4', '2', '1', '7');

INSERT INTO kolegij(kolegij_id, naziv, P, V, S, ECTS)
VALUES ('M062', 'Primjene Diferencijalnog i Integralnog Racuna I', '1', '2', '0', '4');

INSERT INTO kolegij(kolegij_id, naziv, P, V, S, ECTS)
VALUES ('M097', 'Teorijske Osnove Racunalne Znanosti', '2', '2', '0', '6');

INSERT INTO kolegij(kolegij_id, naziv, P, V, S, ECTS)
VALUES ('M090', 'Obicne Diferencijalne Jednadbe', '2', '2', '0', '6');

INSERT INTO kolegij(kolegij_id, naziv, P, V, S, ECTS)
VALUES ('M094', 'Realna Analiza', '3', '2', '0', '7');

INSERT INTO kolegij(kolegij_id, naziv, P, V, S, ECTS)
VALUES ('M083', 'Algebra', '2', '2', '0', '6');

INSERT INTO kolegij(kolegij_id, naziv, P, V, S, ECTS)
VALUES ('Z007', 'Zavrsni Rad', '0', '0', '2', '2');

INSERT INTO kolegij(kolegij_id, naziv, P, V, S, ECTS)
VALUES ('I045', 'Moderni Racunalni Sustavi', '2', '2', '0', '6');

INSERT INTO kolegij(kolegij_id, naziv, P, V, S, ECTS)
VALUES ('M063', 'Primjene Diferencijalnog i Integralnog Racuna II', '1', '2', '0', '4');

INSERT INTO kolegij(kolegij_id, naziv, P, V, S, ECTS)
VALUES ('M105', 'Uvod u Diferencijalnu Geometriju', '2', '2', '0', '6');

INSERT INTO kolegij(kolegij_id, naziv, P, V, S, ECTS)
VALUES ('M099', 'Vektorski Prostori', '2', '2', '0', '6');

INSERT INTO kolegij(kolegij_id, naziv, P, V, S, ECTS)
VALUES ('I057', 'Web Programiranje', '3', '2', '1', '8');

INSERT INTO kolegij(kolegij_id, naziv, P, V, S, ECTS)
VALUES ('M107', 'Metode Matematicke Fizike', '3', '2', '0', '7');

INSERT INTO kolegij(kolegij_id, naziv, P, V, S, ECTS)
VALUES ('M104', 'Metode Numericke Matematike', '3', '2', '0', '7');

INSERT INTO kolegij(kolegij_id, naziv, P, V, S, ECTS)
VALUES ('M096', 'Strojno Ucenje', '3', '2', '0', '7');

INSERT INTO kolegij(kolegij_id, naziv, P, V, S, ECTS)
VALUES ('I054', 'Strukture Podataka i Algoritmi II', '3', '2', '0', '7');

INSERT INTO kolegij(kolegij_id, naziv, P, V, S, ECTS)
VALUES ('M106', 'Teorija Skupova', '1', '1', '0', '4');

INSERT INTO kolegij(kolegij_id, naziv, P, V, S, ECTS)
VALUES ('I044', 'Funkcijsko Programiranje', '2', '2', '0', '6');

INSERT INTO kolegij(kolegij_id, naziv, P, V, S, ECTS)
VALUES ('M091', 'Primjenjena Matematika za Racunalnu Znanost', '4', '3', '0', '9');

INSERT INTO kolegij(kolegij_id, naziv, P, V, S, ECTS)
VALUES ('I046', 'Moderni Sustavi Baza Podataka', '3', '3', '1', '9');

INSERT INTO kolegij(kolegij_id, naziv, P, V, S, ECTS)
VALUES ('I051', 'Racunalno Jezikoslovlje', '2', '2', '0', '6');

INSERT INTO kolegij(kolegij_id, naziv, P, V, S, ECTS)
VALUES ('I059', '3D_Racunalna Grafika', '2', '2', '1', '7');

INSERT INTO kolegij(kolegij_id, naziv, P, V, S, ECTS)
VALUES ('I055', 'Ugradeni Sustavi', '2', '2', '1', '7');

INSERT INTO kolegij(kolegij_id, naziv, P, V, S, ECTS)
VALUES ('I058', 'Zavrsni Prakticni Projekt', '0', '0', '2', '8');

INSERT INTO kolegij(kolegij_id, naziv, P, V, S, ECTS)
VALUES ('Z013', 'Strucna Praksa', '0', '0', '2', '4');

INSERT INTO kolegij(kolegij_id, naziv, P, V, S, ECTS)
VALUES ('M092', 'Osnove Teorije Upravljanja s Primjenama', '2', '2', '1', '7');

INSERT INTO studijski_program(st_prg_id, vrsta_studija_id, kolegij_id, godina, obvezni)
VALUES ('1', '1', 'M084', '1', '1');

INSERT INTO studijski_program(st_prg_id, vrsta_studija_id, kolegij_id, godina, obvezni)
VALUES ('2', '1', 'M100', '1', '1');

INSERT INTO studijski_program(st_prg_id, vrsta_studija_id, kolegij_id, godina, obvezni)
VALUES ('3', '1', 'M086', '1', '1');

INSERT INTO studijski_program(st_prg_id, vrsta_studija_id, kolegij_id, godina, obvezni)
VALUES ('4', '1', 'Z011', '1', '1');

INSERT INTO studijski_program(st_prg_id, vrsta_studija_id, kolegij_id, godina, obvezni)
VALUES ('5', '1', 'Z014', '1', '1');

INSERT INTO studijski_program(st_prg_id, vrsta_studija_id, kolegij_id, godina, obvezni)
VALUES ('6', '1', 'I056', '1', '1');

INSERT INTO studijski_program(st_prg_id, vrsta_studija_id, kolegij_id, godina, obvezni)
VALUES ('7', '1', 'M101', '1', '1');

INSERT INTO studijski_program(st_prg_id, vrsta_studija_id, kolegij_id, godina, obvezni);
VALUES ('8', '1', 'M085', '1', '1');

INSERT INTO studijski_program(st_prg_id, vrsta_studija_id, kolegij_id, godina, obvezni);
VALUES ('9', '1', 'M102', '1', '1');

INSERT INTO studijski_program(st_prg_id, vrsta_studija_id, kolegij_id, godina, obvezni);
VALUES ('10', '1', 'M087', '1', '1');

INSERT INTO studijski_program(st_prg_id, vrsta_studija_id, kolegij_id, godina, obvezni);
VALUES ('11', '1', 'Z012', '1', '1');

INSERT INTO studijski_program(st_prg_id, vrsta_studija_id, kolegij_id, godina, obvezni);
VALUES ('12', '1', 'M009', '2', '1');

INSERT INTO studijski_program(st_prg_id, vrsta_studija_id, kolegij_id, godina, obvezni);
VALUES ('13', '1', 'I027', '2', '1');

INSERT INTO studijski_program(st_prg_id, vrsta_studija_id, kolegij_id, godina, obvezni);
VALUES ('14', '1', 'Z015', '2', '1');

INSERT INTO studijski_program(st_prg_id, vrsta_studija_id, kolegij_id, godina, obvezni);
VALUES ('15', '1', 'M098', '2', '1');

INSERT INTO studijski_program(st_prg_id, vrsta_studija_id, kolegij_id, godina, obvezni);
VALUES ('16', '1', 'M015', '2', '1');

INSERT INTO studijski_program(st_prg_id, vrsta_studija_id, kolegij_id, godina, obvezni);
VALUES ('17', '1', 'M089', '2', '1');

INSERT INTO studijski_program(st_prg_id, vrsta_studija_id, kolegij_id, godina, obvezni)
VALUES ('18', '1', 'M095', '2', '1');

INSERT INTO studijski_program(st_prg_id, vrsta_studija_id, kolegij_id, godina, obvezni)
VALUES ('19', '1', 'M108', '2', '1');

INSERT INTO studijski_program(st_prg_id, vrsta_studija_id, kolegij_id, godina, obvezni)
VALUES ('20', '1', 'F007', '2', '0');

INSERT INTO studijski_program(st_prg_id, vrsta_studija_id, kolegij_id, godina, obvezni)
VALUES ('21', '1', 'I053', '2', '0');

INSERT INTO studijski_program(st_prg_id, vrsta_studija_id, kolegij_id, godina, obvezni)
VALUES ('22', '1', 'M088', '2', '0');

INSERT INTO studijski_program(st_prg_id, vrsta_studija_id, kolegij_id, godina, obvezni)
VALUES ('23', '1', 'M103', '2', '0');

INSERT INTO studijski_program(st_prg_id, vrsta_studija_id, kolegij_id, godina, obvezni)
VALUES ('24', '1', 'I048', '2', '0');

INSERT INTO studijski_program(st_prg_id, vrsta_studija_id, kolegij_id, godina, obvezni)
VALUES ('25', '1', 'F008', '2', '0');

INSERT INTO studijski_program(st_prg_id, vrsta_studija_id, kolegij_id, godina, obvezni)
VALUES ('26', '1', 'M062', '2', '0');

INSERT INTO studijski_program(st_prg_id, vrsta_studija_id, kolegij_id, godina, obvezni)
VALUES ('27', '1', 'M097', '2', '0');

INSERT INTO studijski_program(st_prg_id, vrsta_studija_id, kolegij_id, godina, obvezni)
VALUES ('28', '1', 'M090', '3', '1');

INSERT INTO studijski_program(st_prg_id, vrsta_studija_id, kolegij_id, godina, obvezni)
VALUES ('29', '1', 'M094', '3', '1');

INSERT INTO studijski_program(st_prg_id, vrsta_studija_id, kolegij_id, godina, obvezni)
VALUES ('30', '1', 'M083', '3', '1');

INSERT INTO studijski_program(st_prg_id, vrsta_studija_id, kolegij_id, godina, obvezni)
VALUES ('31', '1', 'Z007', '3', '1');

INSERT INTO studijski_program(st_prg_id, vrsta_studija_id, kolegij_id, godina, obvezni)
VALUES ('32', '1', 'I045', '3', '0');

INSERT INTO studijski_program(st_prg_id, vrsta_studija_id, kolegij_id, godina, obvezni)
VALUES ('33', '1', 'M063', '3', '0');

INSERT INTO studijski_program(st_prg_id, vrsta_studija_id, kolegij_id, godina, obvezni)
VALUES ('34', '1', 'M105', '3', '0');

INSERT INTO studijski_program(st_prg_id, vrsta_studija_id, kolegij_id, godina, obvezni)
VALUES ('35', '1', 'M099', '3', '0');

INSERT INTO studijski_program(st_prg_id, vrsta_studija_id, kolegij_id, godina, obvezni)
VALUES ('36', '1', 'I057', '3', '0');

INSERT INTO studijski_program(st_prg_id, vrsta_studija_id, kolegij_id, godina, obvezni)
VALUES ('37', '1', 'M103', '3', '0');

INSERT INTO studijski_program(st_prg_id, vrsta_studija_id, kolegij_id, godina, obvezni)
VALUES ('38', '1', 'M107', '3', '0');

INSERT INTO studijski_program(st_prg_id, vrsta_studija_id, kolegij_id, godina, obvezni)
VALUES ('39', '1', 'M104', '3', '0');

INSERT INTO studijski_program(st_prg_id, vrsta_studija_id, kolegij_id, godina, obvezni)
VALUES ('40', '1', 'M096', '3', '0');

INSERT INTO studijski_program(st_prg_id, vrsta_studija_id, kolegij_id, godina, obvezni)
VALUES ('41', '1', 'I054', '3', '0');

INSERT INTO studijski_program(st_prg_id, vrsta_studija_id, kolegij_id, godina, obvezni)
VALUES ('42', '1', 'M106', '3', '0');

INSERT INTO studijski_program(st_prg_id, vrsta_studija_id, kolegij_id, godina, obvezni)
VALUES ('43', '2', 'M084', '1', '1');

INSERT INTO studijski_program(st_prg_id, vrsta_studija_id, kolegij_id, godina, obvezni)
VALUES ('44', '2', 'I044', '1', '1');

INSERT INTO studijski_program(st_prg_id, vrsta_studija_id, kolegij_id, godina, obvezni)
VALUES ('45', '2', 'M086', '1', '1');

INSERT INTO studijski_program(st_prg_id, vrsta_studija_id, kolegij_id, godina, obvezni)
VALUES ('46', '2', 'Z011', '1', '1');

INSERT INTO studijski_program(st_prg_id, vrsta_studija_id, kolegij_id, godina, obvezni)
VALUES ('47', '2', 'Z014', '1', '1');

INSERT INTO studijski_program(st_prg_id, vrsta_studija_id, kolegij_id, godina, obvezni)
VALUES ('48', '2', 'I056', '1', '1');

INSERT INTO studijski_program(st_prg_id, vrsta_studija_id, kolegij_id, godina, obvezni)
VALUES ('49', '2', 'M085', '1', '1');

INSERT INTO studijski_program(st_prg_id, vrsta_studija_id, kolegij_id, godina, obvezni)
VALUES ('50', '2', 'M087', '1', '1');

INSERT INTO studijski_program(st_prg_id, vrsta_studija_id, kolegij_id, godina, obvezni)
VALUES ('51', '2', 'M088', '1', '1');

INSERT INTO studijski_program(st_prg_id, vrsta_studija_id, kolegij_id, godina, obvezni)
VALUES ('52', '2', 'I048', '1', '1');

INSERT INTO studijski_program(st_prg_id, vrsta_studija_id, kolegij_id, godina, obvezni)
VALUES ('53', '2', 'Z012', '1', '1');

INSERT INTO studijski_program(st_prg_id, vrsta_studija_id, kolegij_id, godina, obvezni)
VALUES ('54', '2', 'I045', '2', '1');

INSERT INTO studijski_program(st_prg_id, vrsta_studija_id, kolegij_id, godina, obvezni)
VALUES ('55', '2', 'M091', '2', '1');

INSERT INTO studijski_program(st_prg_id, vrsta_studija_id, kolegij_id, godina, obvezni)
VALUES ('56', '2', 'I053', '2', '1');

INSERT INTO studijski_program(st_prg_id, vrsta_studija_id, kolegij_id, godina, obvezni)
VALUES ('57', '2', 'Z015', '2', '1');

INSERT INTO studijski_program(st_prg_id, vrsta_studija_id, kolegij_id, godina, obvezni)
VALUES ('58', '2', 'I046', '2', '1');

INSERT INTO studijski_program(st_prg_id, vrsta_studija_id, kolegij_id, godina, obvezni)
VALUES ('59', '2', 'I054', '2', '1');

INSERT INTO studijski_program(st_prg_id, vrsta_studija_id, kolegij_id, godina, obvezni)
VALUES ('60', '2', 'M097', '2', '1');

INSERT INTO studijski_program(st_prg_id, vrsta_studija_id, kolegij_id, godina, obvezni)
VALUES ('61', '2', 'I051', '2', '0');

INSERT INTO studijski_program(st_prg_id, vrsta_studija_id, kolegij_id, godina, obvezni)
VALUES ('62', '2', 'M098', '2', '0');

INSERT INTO studijski_program(st_prg_id, vrsta_studija_id, kolegij_id, godina, obvezni)
VALUES ('63', '2', 'M099', '2', '0');

INSERT INTO studijski_program(st_prg_id, vrsta_studija_id, kolegij_id, godina, obvezni)
VALUES ('64', '2', 'I059', '2', '0');

INSERT INTO studijski_program(st_prg_id, vrsta_studija_id, kolegij_id, godina, obvezni)
VALUES ('65', '2', 'M062', '2', '0');

INSERT INTO studijski_program(st_prg_id, vrsta_studija_id, kolegij_id, godina, obvezni)
VALUES ('66', '2', 'I055', '2', '0');

INSERT INTO studijski_program(st_prg_id, vrsta_studija_id, kolegij_id, godina, obvezni)
VALUES ('67', '2', 'M090', '3', '1');

INSERT INTO studijski_program(st_prg_id, vrsta_studija_id, kolegij_id, godina, obvezni)
VALUES ('68', '2', 'I057', '3', '1');

INSERT INTO studijski_program(st_prg_id, vrsta_studija_id, kolegij_id, godina, obvezni)
VALUES ('69', '2', 'M089', '3', '1');

INSERT INTO studijski_program(st_prg_id, vrsta_studija_id, kolegij_id, godina, obvezni)
VALUES ('70', '2', 'M096', '3', '1');

INSERT INTO studijski_program(st_prg_id, vrsta_studija_id, kolegij_id, godina, obvezni)
VALUES ('71', '2', 'I058', '3', '1');

INSERT INTO studijski_program(st_prg_id, vrsta_studija_id, kolegij_id, godina, obvezni)
VALUES ('73', '2', 'I051', '3', '0');

INSERT INTO studijski_program(st_prg_id, vrsta_studija_id, kolegij_id, godina, obvezni)
VALUES ('74', '2', 'M094', '3', '0');

INSERT INTO studijski_program(st_prg_id, vrsta_studija_id, kolegij_id, godina, obvezni)
VALUES ('75', '2', 'Z013, '3', '0');

INSERT INTO studijski_program(st_prg_id, vrsta_studija_id, kolegij_id, godina, obvezni)
VALUES ('76', '2', 'M083', '3', '0');

INSERT INTO studijski_program(st_prg_id, vrsta_studija_id, kolegij_id, godina, obvezni)
VALUES ('77', '2', 'M092', '3', '0');

INSERT INTO studijski_program(st_prg_id, vrsta_studija_id, kolegij_id, godina, obvezni)
VALUES ('78', '2', 'M095', '3', '0');

INSERT INTO djelatnik(djelatnik_id, ime, prezime, spol)
VALUES ('1', 'Alfonzo', 'Baumgartner', 'M');

INSERT INTO djelatnik(djelatnik_id, ime, prezime, spol)
VALUES ('2', 'Darija', 'Brajkovic Zoric', 'Z');

INSERT INTO djelatnik(djelatnik_id, ime, prezime, spol)
VALUES ('3', 'Kresimir', 'Burazin', 'M');

INSERT INTO djelatnik(djelatnik_id, ime, prezime, spol)
VALUES ('4', 'Danijel', 'Grahovac', 'M');

INSERT INTO djelatnik(djelatnik_id, ime, prezime, spol)
VALUES ('5', 'Dragana', 'Jankov Masirevic', 'Z');

INSERT INTO djelatnik(djelatnik_id, ime, prezime, spol)
VALUES ('6', 'Slobodan', 'Jelic', 'M');

INSERT INTO djelatnik(djelatnik_id, ime, prezime, spol)
VALUES ('7', 'Dragan', 'Jukic', 'M');

INSERT INTO djelatnik(djelatnik_id, ime, prezime, spol)
VALUES ('8', 'Mirela', 'Jukic Bokun', 'Z');

INSERT INTO djelatnik(djelatnik_id, ime, prezime, spol)
VALUES ('9', 'Josip', 'Cvenic', 'M');

INSERT INTO djelatnik(djelatnik_id, ime, prezime, spol)
VALUES ('10', 'Zdenka', 'Kolar-Begovic', 'Z');

INSERT INTO djelatnik(djelatnik_id, ime, prezime, spol)
VALUES ('11', 'Ivana', 'Kuzmanovic Ivicic', 'Z');

INSERT INTO djelatnik(djelatnik_id, ime, prezime, spol)
VALUES ('12', 'Snjezana', 'Majstorovic', 'Z');

INSERT INTO djelatnik(djelatnik_id, ime, prezime, spol)
VALUES ('13', 'Darija', 'Markovic', 'Z');

INSERT INTO djelatnik(djelatnik_id, ime, prezime, spol)
VALUES ('14', 'Karmen', 'Kneževic', 'Z');

INSERT INTO djelatnik(djelatnik_id, ime, prezime, spol)
VALUES ('15', 'Ivan', 'Matic', 'M');

INSERT INTO djelatnik(djelatnik_id, ime, prezime, spol)
VALUES ('16', 'Domagoj', 'Matijevic', 'M');

INSERT INTO djelatnik(djelatnik_id, ime, prezime, spol)
VALUES ('17', 'Suzana', 'Miodragovic', 'Z');

INSERT INTO djelatnik(djelatnik_id, ime, prezime, spol)
VALUES ('18', 'Mihaela', 'Ribicic Penava', 'Z');

INSERT INTO djelatnik(djelatnik_id, ime, prezime, spol)
VALUES ('19', 'Kristian', 'Sabo', 'M');

INSERT INTO djelatnik(djelatnik_id, ime, prezime, spol)
VALUES ('20', 'Rudolf', 'Scitovski', 'M');

INSERT INTO djelatnik(djelatnik_id, ime, prezime, spol)
VALUES ('21', 'Domagoj', 'Severdija', 'M');

INSERT INTO djelatnik(djelatnik_id, ime, prezime, spol)
VALUES '(22', 'Ivan', 'Soldo', 'M');

INSERT INTO djelatnik(djelatnik_id, ime, prezime, spol)
VALUES ('23', 'Nenad', 'Suvak', 'M');

INSERT INTO djelatnik(djelatnik_id, ime, prezime, spol)
VALUES ('24', 'Zoran', 'Tomljanovic', 'M');

INSERT INTO djelatnik(djelatnik_id, ime, prezime, spol)
VALUES ('25', 'Ivan', 'Kvolik', 'M');

INSERT INTO djelatnik(djelatnik_id, ime, prezime, spol)
VALUES ('26', 'Luka', 'Borozan', 'M');

INSERT INTO djelatnik(djelatnik_id, ime, prezime, spol)
VALUES ('27', 'Rebeka', 'Coric', 'Z');

INSERT INTO djelatnik(djelatnik_id, ime, prezime, spol)
VALUES ('28', 'Ivana', 'Crnjac', 'Z');

INSERT INTO djelatnik(djelatnik_id, ime, prezime, spol)
VALUES ('29', 'Mateja', 'Dumic', 'Z');

INSERT INTO djelatnik(djelatnik_id, ime, prezime, spol)
VALUES ('30', 'Danijela', 'Jaganjac', 'Z');

INSERT INTO djelatnik(djelatnik_id, ime, prezime, spol)
VALUES ('31', 'Jelena', 'Jankov', 'Z');

INSERT INTO djelatnik(djelatnik_id, ime, prezime, spol)
VALUES ('32', 'Jurica', 'Maltar', 'M');

INSERT INTO djelatnik(djelatnik_id, ime, prezime, spol)
VALUES ('33', 'Marija', 'Miloloza Pandur', 'Z');

INSERT INTO djelatnik(djelatnik_id, ime, prezime, spol)
VALUES ('34', 'Ivan', 'Papic', 'M');

INSERT INTO djelatnik(djelatnik_id, ime, prezime, spol)
VALUES ('35', 'Ena', 'Pribisalic', 'Z');

INSERT INTO djelatnik(djelatnik_id, ime, prezime, spol)
VALUES ('36', 'Ljiljana', 'Primorac Gajcic', 'Z');

INSERT INTO djelatnik(djelatnik_id, ime, prezime, spol)
VALUES ('37', 'Matea', 'Puvaca', 'Z');

INSERT INTO djelatnik(djelatnik_id, ime, prezime, spol)
VALUES ('38', 'Branko', 'Vukovic', 'M');

INSERT INTO djelatnik(djelatnik_id, ime, prezime, spol)
VALUES ('39', 'Danijela', 'Kuvezdic', 'Z');

INSERT INTO izvedbeni_plan(izvedbeni_plan_id, st_prg_id, semestar, br_grupa, akademska_godina)
VALUES ('1', '1', 'zimski', '1', '2019/2020');

INSERT INTO izvedbeni_plan(izvedbeni_plan_id, st_prg_id, semestar, br_grupa, akademska_godina)
VALUES ('2', '2', 'zimski', '1', '2019/2020');

INSERT INTO izvedbeni_plan(izvedbeni_plan_id, st_prg_id, semestar, br_grupa, akademska_godina)
VALUES ('3', '3', 'zimski', '1', '2019/2020');

INSERT INTO izvedbeni_plan(izvedbeni_plan_id, st_prg_id, semestar, br_grupa, akademska_godina)
VALUES ('4', '4', 'zimski', '1', '2019/2020');

INSERT INTO izvedbeni_plan(izvedbeni_plan_id, st_prg_id, semestar, br_grupa, akademska_godina)
VALUES ('5', '5', 'zimski_i_ljetni', '1', '2019/2020');

INSERT INTO izvedbeni_plan(izvedbeni_plan_id, st_prg_id, semestar, br_grupa, akademska_godina)
VALUES ('6', '6', 'zimski', '1', '2019/2020');

INSERT INTO izvedbeni_plan(izvedbeni_plan_id, st_prg_id, semestar, br_grupa, akademska_godina)
VALUES ('7', '7', 'ljetni', '1', '2019/2020');

INSERT INTO izvedbeni_plan(izvedbeni_plan_id, st_prg_id, semestar, br_grupa, akademska_godina)
VALUES ('8', '8', 'ljetni', '1', '2019/2020');

INSERT INTO izvedbeni_plan(izvedbeni_plan_id, st_prg_id, semestar, br_grupa, akademska_godina)
VALUES ('9', '9', 'ljetni', '1', '2019/2020');

INSERT INTO izvedbeni_plan(izvedbeni_plan_id, st_prg_id, semestar, br_grupa, akademska_godina)
VALUES ('10', '10', 'ljetni', '1', '2019/2020');

INSERT INTO izvedbeni_plan(izvedbeni_plan_id, st_prg_id, semestar, br_grupa, akademska_godina)
VALUES ('11', '11', 'ljetni', '1', '2019/2020');

INSERT INTO izvedbeni_plan(izvedbeni_plan_id, st_prg_id, semestar, br_grupa, akademska_godina)
VALUES ('12', '12', 'zimski', '1', '2019/2020');

INSERT INTO izvedbeni_plan(izvedbeni_plan_id, st_prg_id, semestar, br_grupa, akademska_godina)
VALUES ('13', '13', 'zimski', '1', '2019/2020');

INSERT INTO izvedbeni_plan(izvedbeni_plan_id, st_prg_id, semestar, br_grupa, akademska_godina)
VALUES ('14', '14', 'zimski_i_ljetni', '1', '2019/2020');

INSERT INTO izvedbeni_plan(izvedbeni_plan_id, st_prg_id, semestar, br_grupa, akademska_godina)
VALUES ('15', '15', 'zimski', '1', '2019/2020');

INSERT INTO izvedbeni_plan(izvedbeni_plan_id, st_prg_id, semestar, br_grupa, akademska_godina)
VALUES ('16', '16', 'ljetni', '1', '2019/2020');

INSERT INTO izvedbeni_plan(izvedbeni_plan_id, st_prg_id, semestar, br_grupa, akademska_godina)
VALUES ('17, '17', 'ljetni', '1', '2019/2020');

INSERT INTO izvedbeni_plan(izvedbeni_plan_id, st_prg_id, semestar, br_grupa, akademska_godina)
VALUES ('18', '18', 'ljetni', '1', '2019/2020');

INSERT INTO izvedbeni_plan(izvedbeni_plan_id, st_prg_id, semestar, br_grupa, akademska_godina)
VALUES ('19', '19', 'ljetni', '1', '2019/2020');

INSERT INTO izvedbeni_plan(izvedbeni_plan_id, st_prg_id, semestar, br_grupa, akademska_godina)
VALUES ('20', '20', 'zimski', '1', '2019/2020');

INSERT INTO izvedbeni_plan(izvedbeni_plan_id, st_prg_id, semestar, br_grupa, akademska_godina)
VALUES ('21', '21', 'zimski', '1', '2019/2020');

INSERT INTO izvedbeni_plan(izvedbeni_plan_id, st_prg_id, semestar, br_grupa, akademska_godina)
VALUES ('22', '22', 'ljetni', '1', '2019/2020');

INSERT INTO izvedbeni_plan(izvedbeni_plan_id, st_prg_id, semestar, br_grupa, akademska_godina)
VALUES ('23', '23', 'ljetni', '1', '2019/2020');

INSERT INTO izvedbeni_plan(izvedbeni_plan_id, st_prg_id, semestar, br_grupa, akademska_godina)
VALUES ('24', '24', 'ljetni', '1', '2019/2020');

INSERT INTO izvedbeni_plan(izvedbeni_plan_id, st_prg_id, semestar, br_grupa, akademska_godina)
VALUES ('25', '25', 'ljetni', '1', '2019/2020');

INSERT INTO izvedbeni_plan(izvedbeni_plan_id, st_prg_id, semestar, br_grupa, akademska_godina)
VALUES ('26', '26', 'ljetni', '1', '2019/2020');

INSERT INTO izvedbeni_plan(izvedbeni_plan_id, st_prg_id, semestar, br_grupa, akademska_godina)
VALUES ('27', '27', 'ljetni', '1', '2019/2020');

INSERT INTO izvedbeni_plan(izvedbeni_plan_id, st_prg_id, semestar, br_grupa, akademska_godina)
VALUES ('28', '28', 'zimski', '1', '2019/2020');

INSERT INTO izvedbeni_plan(izvedbeni_plan_id, st_prg_id, semestar, br_grupa, akademska_godina)
VALUES ('29', '29', 'zimski', '1', '2019/2020');

INSERT INTO izvedbeni_plan(izvedbeni_plan_id, st_prg_id, semestar, br_grupa, akademska_godina)
VALUES ('30', '30', 'ljetni', '1', '2019/2020');

INSERT INTO izvedbeni_plan(izvedbeni_plan_id, st_prg_id, semestar, br_grupa, akademska_godina)
VALUES ('31', '31', 'ljetni', '1', '2019/2020');

INSERT INTO izvedbeni_plan(izvedbeni_plan_id, st_prg_id, semestar, br_grupa, akademska_godina)
VALUES ('32', '32', 'zimski', '1', '2019/2020');

INSERT INTO izvedbeni_plan(izvedbeni_plan_id, st_prg_id, semestar, br_grupa, akademska_godina)
VALUES ('33', '33', 'zimski', '1', '2019/2020');

INSERT INTO izvedbeni_plan(izvedbeni_plan_id, st_prg_id, semestar, br_grupa, akademska_godina)
VALUES ('34', '34', 'zimski', '1', '2019/2020');

INSERT INTO izvedbeni_plan(izvedbeni_plan_id, st_prg_id, semestar, br_grupa, akademska_godina)
VALUES ('35', '35', 'zimski', '1', '2019/2020');

INSERT INTO izvedbeni_plan(izvedbeni_plan_id, st_prg_id, semestar, br_grupa, akademska_godina)
VALUES ('36', '36', 'zimski', '1', '2019/2020');

INSERT INTO izvedbeni_plan(izvedbeni_plan_id, st_prg_id, semestar, br_grupa, akademska_godina)
VALUES ('37', '37', 'ljetni', '1', '2019/2020');

INSERT INTO izvedbeni_plan(izvedbeni_plan_id, st_prg_id, semestar, br_grupa, akademska_godina)
VALUES ('38', '38', 'ljetni', '1', '2019/2020');

INSERT INTO izvedbeni_plan(izvedbeni_plan_id, st_prg_id, semestar, br_grupa, akademska_godina)
VALUES ('39', '39', 'ljetni', '1', '2019/2020');

INSERT INTO izvedbeni_plan(izvedbeni_plan_id, st_prg_id, semestar, br_grupa, akademska_godina)
VALUES ('40', '40', 'ljetni', '1', '2019/2020');

INSERT INTO izvedbeni_plan(izvedbeni_plan_id, st_prg_id, semestar, br_grupa, akademska_godina)
VALUES ('41', '41', 'ljetni', '1', '2019/2020');

INSERT INTO izvedbeni_plan(izvedbeni_plan_id, st_prg_id, semestar, br_grupa, akademska_godina)
VALUES ('42', '42', 'ljetni', '1', '2019/2020');

INSERT INTO izvedbeni_plan(izvedbeni_plan_id, st_prg_id, semestar, br_grupa, akademska_godina)
VALUES ('43', '43', 'zimski', '1', '2019/2020');

INSERT INTO izvedbeni_plan(izvedbeni_plan_id, st_prg_id, semestar, br_grupa, akademska_godina)
VALUES ('44', '44', 'zimski', '1', '2019/2020');

INSERT INTO izvedbeni_plan(izvedbeni_plan_id, st_prg_id, semestar, br_grupa, akademska_godina)
VALUES ('45', '45', 'zimski', '1', '2019/2020');

INSERT INTO izvedbeni_plan(izvedbeni_plan_id, st_prg_id, semestar, br_grupa, akademska_godina)
VALUES ('46', '46', 'zimski', '1', '2019/2020');

INSERT INTO izvedbeni_plan(izvedbeni_plan_id, st_prg_id, semestar, br_grupa, akademska_godina)
VALUES ('47', '47', 'zimski_i_ljetni', '1', '2019/2020');

INSERT INTO izvedbeni_plan(izvedbeni_plan_id, st_prg_id, semestar, br_grupa, akademska_godina)
VALUES ('48', '48', 'zimski', '1', '2019/2020');

INSERT INTO izvedbeni_plan(izvedbeni_plan_id, st_prg_id, semestar, br_grupa, akademska_godina)
VALUES ('49', '49', 'ljetni', '1', '2019/2020');

INSERT INTO izvedbeni_plan(izvedbeni_plan_id, st_prg_id, semestar, br_grupa, akademska_godina)
VALUES ('50', '50', 'ljetni', '1', '2019/2020');

INSERT INTO izvedbeni_plan(izvedbeni_plan_id, st_prg_id, semestar, br_grupa, akademska_godina)
VALUES ('51', '51', 'ljetni', '1', '2019/2020');

INSERT INTO izvedbeni_plan(izvedbeni_plan_id, st_prg_id, semestar, br_grupa, akademska_godina)
VALUES ('52', '52', 'ljetni', '1', '2019/2020');

INSERT INTO izvedbeni_plan(izvedbeni_plan_id, st_prg_id, semestar, br_grupa, akademska_godina)
VALUES ('53', '53', 'ljetni', '1', '2019/2020');

INSERT INTO izvedbeni_plan(izvedbeni_plan_id, st_prg_id, semestar, br_grupa, akademska_godina)
VALUES ('54', '54', 'zimski', '1', '2019/2020');

INSERT INTO izvedbeni_plan(izvedbeni_plan_id, st_prg_id, semestar, br_grupa, akademska_godina)
VALUES ('55', '55', 'zimski', '1', '2019/2020');

INSERT INTO izvedbeni_plan(izvedbeni_plan_id, st_prg_id, semestar, br_grupa, akademska_godina)
VALUES ('56', '56', 'zimski', '1', '2019/2020');

INSERT INTO izvedbeni_plan(izvedbeni_plan_id, st_prg_id, semestar, br_grupa, akademska_godina)
VALUES ('57', '57', 'zimski_i_ljetni', '1', '2019/2020');

INSERT INTO izvedbeni_plan(izvedbeni_plan_id, st_prg_id, semestar, br_grupa, akademska_godina)
VALUES ('58', '58', 'ljetni', '1', '2019/2020');

INSERT INTO izvedbeni_plan(izvedbeni_plan_id, st_prg_id, semestar, br_grupa, akademska_godina)
VALUES ('59', '59', 'ljetni', '1', '2019/2020');

INSERT INTO izvedbeni_plan(izvedbeni_plan_id, st_prg_id, semestar, br_grupa, akademska_godina)
VALUES ('60', '60', 'ljetni', '1', '2019/2020');

INSERT INTO izvedbeni_plan(izvedbeni_plan_id, st_prg_id, semestar, br_grupa, akademska_godina)
VALUES ('61', '61', 'zimski', '1', '2019/2020');

INSERT INTO izvedbeni_plan(izvedbeni_plan_id, st_prg_id, semestar, br_grupa, akademska_godina)
VALUES ('62', '62', 'zimski', '1', '2019/2020');

INSERT INTO izvedbeni_plan(izvedbeni_plan_id, st_prg_id, semestar, br_grupa, akademska_godina)
VALUES ('63', '63', 'zimski', '1', '2019/2020');

INSERT INTO izvedbeni_plan(izvedbeni_plan_id, st_prg_id, semestar, br_grupa, akademska_godina)
VALUES ('64', '64', 'ljetni', '1', '2019/2020');

INSERT INTO izvedbeni_plan(izvedbeni_plan_id, st_prg_id, semestar, br_grupa, akademska_godina)
VALUES ('65', '65', 'ljetni', '1', '2019/2020');

INSERT INTO izvedbeni_plan(izvedbeni_plan_id, st_prg_id, semestar, br_grupa, akademska_godina)
VALUES ('66', '66', 'ljetni', '1', '2019/2020');

INSERT INTO izvedbeni_plan(izvedbeni_plan_id, st_prg_id, semestar, br_grupa, akademska_godina)
VALUES ('67', '67', 'zimski', '1', '2019/2020');

INSERT INTO izvedbeni_plan(izvedbeni_plan_id, st_prg_id, semestar, br_grupa, akademska_godina)
VALUES ('68', '68', 'zimski', '1', '2019/2020');

INSERT INTO izvedbeni_plan(izvedbeni_plan_id, st_prg_id, semestar, br_grupa, akademska_godina)
VALUES ('69', '69', 'ljetni', '1', '2019/2020');

INSERT INTO izvedbeni_plan(izvedbeni_plan_id, st_prg_id, semestar, br_grupa, akademska_godina)
VALUES ('70', '70', 'ljetni', '1', '2019/2020');

INSERT INTO izvedbeni_plan(izvedbeni_plan_id, st_prg_id, semestar, br_grupa, akademska_godina)
VALUES ('71', '71', 'ljetni', '1', '2019/2020');

INSERT INTO izvedbeni_plan(izvedbeni_plan_id, st_prg_id, semestar, br_grupa, akademska_godina)
VALUES ('72', '72', 'ljetni', '1', '2019/2020');

INSERT INTO izvedbeni_plan(izvedbeni_plan_id, st_prg_id, semestar, br_grupa, akademska_godina)
VALUES ('73', '73', 'zimski', '1', '2019/2020');

INSERT INTO izvedbeni_plan(izvedbeni_plan_id, st_prg_id, semestar, br_grupa, akademska_godina)
VALUES ('74', '74', 'zimski', '1', '2019/2020');

INSERT INTO izvedbeni_plan(izvedbeni_plan_id, st_prg_id, semestar, br_grupa, akademska_godina)
VALUES ('75', '75', 'zimski', '1', '2019/2020');

INSERT INTO izvedbeni_plan(izvedbeni_plan_id, st_prg_id, semestar, br_grupa, akademska_godina)
VALUES ('76', '76', 'ljetni', '1', '2019/2020');

INSERT INTO izvedbeni_plan(izvedbeni_plan_id, st_prg_id, semestar, br_grupa, akademska_godina)
VALUES ('77', '77', 'ljetni', '1', '2019/2020');

INSERT INTO izvedbeni_plan(izvedbeni_plan_id, st_prg_id, semestar, br_grupa, akademska_godina)
VALUES ('78', '78', 'ljetni', '1', '2019/2020');

INSERT INTO djelatnik_izvedbeni(izvedbeni_id, djelatnik_id, uloga)
VALUES ('1', '18', 'Profesor');

INSERT INTO djelatnik_izvedbeni(izvedbeni_id, djelatnik_id, uloga)
VALUES ('1', '33', 'Asistent');

INSERT INTO djelatnik_izvedbeni(izvedbeni_id, djelatnik_id, uloga)
VALUES ('2', '18', 'Profesor');

INSERT INTO djelatnik_izvedbeni(izvedbeni_id, djelatnik_id, uloga)
VALUES ('2', '11', 'Asistent');

INSERT INTO djelatnik_izvedbeni(izvedbeni_id, djelatnik_id, uloga)
VALUES ('3', '20', 'Profesor');

INSERT INTO djelatnik_izvedbeni(izvedbeni_id, djelatnik_id, uloga)
VALUES ('3', '13', 'Profesor');

INSERT INTO djelatnik_izvedbeni(izvedbeni_id, djelatnik_id, uloga)
VALUES ('3', '2', 'Asistent');

INSERT INTO djelatnik_izvedbeni(izvedbeni_id, djelatnik_id, uloga)
VALUES ('4', '14', 'Profesor');

INSERT INTO djelatnik_izvedbeni(izvedbeni_id, djelatnik_id, uloga)
VALUES ('5', '9', 'Profesor');

INSERT INTO djelatnik_izvedbeni(izvedbeni_id, djelatnik_id, uloga)
VALUES ('6', '16', 'Profesor');

INSERT INTO djelatnik_izvedbeni(izvedbeni_id, djelatnik_id, uloga)
VALUES ('6', '29', 'Asistent');

INSERT INTO djelatnik_izvedbeni(izvedbeni_id, djelatnik_id, uloga)
VALUES ('7', '10', 'Profesor');

INSERT INTO djelatnik_izvedbeni(izvedbeni_id, djelatnik_id, uloga)
VALUES ('7', '36', 'Asistent');

INSERT INTO djelatnik_izvedbeni(izvedbeni_id, djelatnik_id, uloga)
VALUES ('8', '22', 'Profesor');

INSERT INTO djelatnik_izvedbeni(izvedbeni_id, djelatnik_id, uloga)
VALUES ('8', '17', 'Asistent');

INSERT INTO djelatnik_izvedbeni(izvedbeni_id, djelatnik_id, uloga)
VALUES ('9', '12', 'Profesor');

INSERT INTO djelatnik_izvedbeni(izvedbeni_id, djelatnik_id, uloga)
VALUES ('9', '12', 'Asistent');

INSERT INTO djelatnik_izvedbeni(izvedbeni_id, djelatnik_id, uloga)
VALUES ('10', '13', 'Profesor');

INSERT INTO djelatnik_izvedbeni(izvedbeni_id, djelatnik_id, uloga)
VALUES ('10', '2', 'Asistent');

INSERT INTO djelatnik_izvedbeni(izvedbeni_id, djelatnik_id, uloga)
VALUES ('11', '14', 'Profesor');

INSERT INTO djelatnik_izvedbeni(izvedbeni_id, djelatnik_id, uloga)
VALUES ('12', '3', 'Profesor');

INSERT INTO djelatnik_izvedbeni(izvedbeni_id, djelatnik_id, uloga)
VALUES ('12', '31', 'Asistent');

INSERT INTO djelatnik_izvedbeni(izvedbeni_id, djelatnik_id, uloga)
VALUES ('13', '11', 'Profesor');

INSERT INTO djelatnik_izvedbeni(izvedbeni_id, djelatnik_id, uloga)
VALUES ('13', '11', 'Asistent');

INSERT INTO djelatnik_izvedbeni(izvedbeni_id, djelatnik_id, uloga)
VALUES ('14', '9', 'Profesor');

INSERT INTO djelatnik_izvedbeni(izvedbeni_id, djelatnik_id, uloga)
VALUES ('15', '23', 'Profesor');

INSERT INTO djelatnik_izvedbeni(izvedbeni_id, djelatnik_id, uloga)
VALUES ('15', '33', 'Asistent');

INSERT INTO djelatnik_izvedbeni(izvedbeni_id, djelatnik_id, uloga)
VALUES ('16', '3', 'Profesor');

INSERT INTO djelatnik_izvedbeni(izvedbeni_id, djelatnik_id, uloga)
VALUES ('16', '28', 'Asistent');

INSERT INTO djelatnik_izvedbeni(izvedbeni_id, djelatnik_id, uloga)
VALUES ('17', '19', 'Profesor');

INSERT INTO djelatnik_izvedbeni(izvedbeni_id, djelatnik_id, uloga)
VALUES ('17', '13', 'Asistent');

INSERT INTO djelatnik_izvedbeni(izvedbeni_id, djelatnik_id, uloga)
VALUES ('17', '17', 'Asistent');

INSERT INTO djelatnik_izvedbeni(izvedbeni_id, djelatnik_id, uloga)
VALUES ('18', '4', 'Profesor');

INSERT INTO djelatnik_izvedbeni(izvedbeni_id, djelatnik_id, uloga)
VALUES ('18', '4', 'Asistent');

INSERT INTO djelatnik_izvedbeni(izvedbeni_id, djelatnik_id, uloga)
VALUES ('18', '34', 'Asistent');

INSERT INTO djelatnik_izvedbeni(izvedbeni_id, djelatnik_id, uloga)
VALUES ('19', '8', 'Profesor');

INSERT INTO djelatnik_izvedbeni(izvedbeni_id, djelatnik_id, uloga)
VALUES ('19', '22', 'Asistent');

INSERT INTO djelatnik_izvedbeni(izvedbeni_id, djelatnik_id, uloga)
VALUES ('20', '38', 'Profesor');

INSERT INTO djelatnik_izvedbeni(izvedbeni_id, djelatnik_id, uloga)
VALUES ('20', '39', 'Asistent');

INSERT INTO djelatnik_izvedbeni(izvedbeni_id, djelatnik_id, uloga)
VALUES ('21', '6', 'Profesor');

INSERT INTO djelatnik_izvedbeni(izvedbeni_id, djelatnik_id, uloga)
VALUES ('21', '26', 'Asistent');

INSERT INTO djelatnik_izvedbeni(izvedbeni_id, djelatnik_id, uloga)
VALUES ('22', '6', 'Profesor');

INSERT INTO djelatnik_izvedbeni(izvedbeni_id, djelatnik_id, uloga)
VALUES ('22', '26', 'Asistent');

INSERT INTO djelatnik_izvedbeni(izvedbeni_id, djelatnik_id, uloga)
VALUES ('22', '37', 'Asistent');

INSERT INTO djelatnik_izvedbeni(izvedbeni_id, djelatnik_id, uloga)
VALUES ('23', '3', 'Profesor');

INSERT INTO djelatnik_izvedbeni(izvedbeni_id, djelatnik_id, uloga)
VALUES ('23', '36', 'Asistent');

INSERT INTO djelatnik_izvedbeni(izvedbeni_id, djelatnik_id, uloga)
VALUES ('24', '16', 'Profesor');

INSERT INTO djelatnik_izvedbeni(izvedbeni_id, djelatnik_id, uloga)
VALUES ('24', '32', 'Asistent');

INSERT INTO djelatnik_izvedbeni(izvedbeni_id, djelatnik_id, uloga)
VALUES ('25', '38', 'Profesor');

INSERT INTO djelatnik_izvedbeni(izvedbeni_id, djelatnik_id, uloga)
VALUES ('25', '39', 'Asistent');

INSERT INTO djelatnik_izvedbeni(izvedbeni_id, djelatnik_id, uloga)
VALUES ('26', '3', 'Profesor');

INSERT INTO djelatnik_izvedbeni(izvedbeni_id, djelatnik_id, uloga)
VALUES ('26', '31', 'Asistent');

INSERT INTO djelatnik_izvedbeni(izvedbeni_id, djelatnik_id, uloga)
VALUES ('27', '24', 'Profesor');

INSERT INTO djelatnik_izvedbeni(izvedbeni_id, djelatnik_id, uloga)
VALUES ('27', '24', 'Asistent');

INSERT INTO djelatnik_izvedbeni(izvedbeni_id, djelatnik_id, uloga)
VALUES ('28', '3', 'Profesor');

INSERT INTO djelatnik_izvedbeni(izvedbeni_id, djelatnik_id, uloga)
VALUES ('28', '28', 'Asistent');

INSERT INTO djelatnik_izvedbeni(izvedbeni_id, djelatnik_id, uloga)
VALUES ('29', '7', 'Profesor');

INSERT INTO djelatnik_izvedbeni(izvedbeni_id, djelatnik_id, uloga)
VALUES ('29', '5', 'Asistent');

INSERT INTO djelatnik_izvedbeni(izvedbeni_id, djelatnik_id, uloga)
VALUES ('30', '15', 'Profesor');

INSERT INTO djelatnik_izvedbeni(izvedbeni_id, djelatnik_id, uloga)
VALUES ('30', '2', 'Asistent');

INSERT INTO djelatnik_izvedbeni(izvedbeni_id, djelatnik_id, uloga)
VALUES ('32', '16', 'Profesor');

INSERT INTO djelatnik_izvedbeni(izvedbeni_id, djelatnik_id, uloga)
VALUES ('32', '26', 'Asistent');

INSERT INTO djelatnik_izvedbeni(izvedbeni_id, djelatnik_id, uloga)
VALUES ('32', '25', 'Asistent');

INSERT INTO djelatnik_izvedbeni(izvedbeni_id, djelatnik_id, uloga)
VALUES ('33', '12', 'Profesor');

INSERT INTO djelatnik_izvedbeni(izvedbeni_id, djelatnik_id, uloga)
VALUES ('33', '12', 'Asistent');

INSERT INTO djelatnik_izvedbeni(izvedbeni_id, djelatnik_id, uloga)
VALUES ('34', '10', 'Profesor');

INSERT INTO djelatnik_izvedbeni(izvedbeni_id, djelatnik_id, uloga)
VALUES ('34', '36', 'Asistent');

INSERT INTO djelatnik_izvedbeni(izvedbeni_id, djelatnik_id, uloga)
VALUES ('35', '15', 'Profesor');

INSERT INTO djelatnik_izvedbeni(izvedbeni_id, djelatnik_id, uloga)
VALUES ('35', '2', 'Asistent');

INSERT INTO djelatnik_izvedbeni(izvedbeni_id, djelatnik_id, uloga)
VALUES ('36', '16', 'Profesor');

INSERT INTO djelatnik_izvedbeni(izvedbeni_id, djelatnik_id, uloga)
VALUES ('36', '32', 'Asistent');

INSERT INTO djelatnik_izvedbeni(izvedbeni_id, djelatnik_id, uloga)
VALUES ('37', '12', 'Profesor');

INSERT INTO djelatnik_izvedbeni(izvedbeni_id, djelatnik_id, uloga)
VALUES ('37', '36', 'Asistent');

INSERT INTO djelatnik_izvedbeni(izvedbeni_id, djelatnik_id, uloga)
VALUES ('38', '4', 'Profesor');

INSERT INTO djelatnik_izvedbeni(izvedbeni_id, djelatnik_id, uloga)
VALUES ('38', '31', 'Asistent');

INSERT INTO djelatnik_izvedbeni(izvedbeni_id, djelatnik_id, uloga)
VALUES ('39', '17', 'Profesor');

INSERT INTO djelatnik_izvedbeni(izvedbeni_id, djelatnik_id, uloga)
VALUES ('39', '37', 'Asistent');

INSERT INTO djelatnik_izvedbeni(izvedbeni_id, djelatnik_id, uloga)
VALUES ('40', '19', 'Profesor');

INSERT INTO djelatnik_izvedbeni(izvedbeni_id, djelatnik_id, uloga)
VALUES ('40', '16', 'Asistent');

INSERT INTO djelatnik_izvedbeni(izvedbeni_id, djelatnik_id, uloga)
VALUES ('41', '6', 'Profesor');

INSERT INTO djelatnik_izvedbeni(izvedbeni_id, djelatnik_id, uloga)
VALUES ('41', '35', 'Asistent');

INSERT INTO djelatnik_izvedbeni(izvedbeni_id, djelatnik_id, uloga)
VALUES ('42', '18', 'Profesor');

INSERT INTO djelatnik_izvedbeni(izvedbeni_id, djelatnik_id, uloga)
VALUES ('42', '18', 'Asistent');

INSERT INTO djelatnik_izvedbeni(izvedbeni_id, djelatnik_id, uloga)
VALUES ('43', '18', 'Profesor');

INSERT INTO djelatnik_izvedbeni(izvedbeni_id, djelatnik_id, uloga)
VALUES ('43', '22', 'Profesor');

INSERT INTO djelatnik_izvedbeni(izvedbeni_id, djelatnik_id, uloga)
VALUES ('43', '33', 'Asistent');

INSERT INTO djelatnik_izvedbeni(izvedbeni_id, djelatnik_id, uloga)
VALUES ('44', '6', 'Profesor');

INSERT INTO djelatnik_izvedbeni(izvedbeni_id, djelatnik_id, uloga)
VALUES ('44', '26', 'Asistent');

INSERT INTO djelatnik_izvedbeni(izvedbeni_id, djelatnik_id, uloga)
VALUES ('45', '20', 'Profesor');

INSERT INTO djelatnik_izvedbeni(izvedbeni_id, djelatnik_id, uloga)
VALUES ('45', '13', 'Profesor');

INSERT INTO djelatnik_izvedbeni(izvedbeni_id, djelatnik_id, uloga)
VALUES ('45', '2', 'Asistent');

INSERT INTO djelatnik_izvedbeni(izvedbeni_id, djelatnik_id, uloga)
VALUES ('46', '14', 'Profesor');

INSERT INTO djelatnik_izvedbeni(izvedbeni_id, djelatnik_id, uloga)
VALUES ('47', '9', 'Profesor');

INSERT INTO djelatnik_izvedbeni(izvedbeni_id, djelatnik_id, uloga)
VALUES ('48', '16', 'Profesor');

INSERT INTO djelatnik_izvedbeni(izvedbeni_id, djelatnik_id, uloga)
VALUES ('48', '29', 'Asistent');

INSERT INTO djelatnik_izvedbeni(izvedbeni_id, djelatnik_id, uloga)
VALUES ('49', '22', 'Profesor');

INSERT INTO djelatnik_izvedbeni(izvedbeni_id, djelatnik_id, uloga)
VALUES ('49', '18', 'Profesor');

INSERT INTO djelatnik_izvedbeni(izvedbeni_id, djelatnik_id, uloga)
VALUES ('49', '17', 'Asistent');

INSERT INTO djelatnik_izvedbeni(izvedbeni_id, djelatnik_id, uloga)
VALUES ('50', '13', 'Profesor');

INSERT INTO djelatnik_izvedbeni(izvedbeni_id, djelatnik_id, uloga)
VALUES ('50', '2', 'Asistent');

INSERT INTO djelatnik_izvedbeni(izvedbeni_id, djelatnik_id, uloga)
VALUES ('51', '6', 'Profesor');

INSERT INTO djelatnik_izvedbeni(izvedbeni_id, djelatnik_id, uloga)
VALUES ('51', '26', 'Asistent');

INSERT INTO djelatnik_izvedbeni(izvedbeni_id, djelatnik_id, uloga)
VALUES ('51', '33', 'Asistent');

INSERT INTO djelatnik_izvedbeni(izvedbeni_id, djelatnik_id, uloga)
VALUES ('52', '16', 'Profesor');

INSERT INTO djelatnik_izvedbeni(izvedbeni_id, djelatnik_id, uloga)
VALUES ('52', '32', 'Asistent');

INSERT INTO djelatnik_izvedbeni(izvedbeni_id, djelatnik_id, uloga)
VALUES ('53', '14', 'Profesor');

INSERT INTO djelatnik_izvedbeni(izvedbeni_id, djelatnik_id, uloga)
VALUES ('54', '16', 'Profesor');

INSERT INTO djelatnik_izvedbeni(izvedbeni_id, djelatnik_id, uloga)
VALUES ('54', '25', 'Profesor');

INSERT INTO djelatnik_izvedbeni(izvedbeni_id, djelatnik_id, uloga)
VALUES ('54', '26', 'Asistent');

INSERT INTO djelatnik_izvedbeni(izvedbeni_id, djelatnik_id, uloga)
VALUES ('55', '5', 'Profesor');

INSERT INTO djelatnik_izvedbeni(izvedbeni_id, djelatnik_id, uloga)
VALUES ('55', '8', 'Profesor');

INSERT INTO djelatnik_izvedbeni(izvedbeni_id, djelatnik_id, uloga)
VALUES ('55', '12', 'Profesor');

INSERT INTO djelatnik_izvedbeni(izvedbeni_id, djelatnik_id, uloga)
VALUES ('55', '5', 'Asistent');

INSERT INTO djelatnik_izvedbeni(izvedbeni_id, djelatnik_id, uloga)
VALUES ('55', '8', 'Asistent');

INSERT INTO djelatnik_izvedbeni(izvedbeni_id, djelatnik_id, uloga)
VALUES ('55', '12', 'Asistent');

INSERT INTO djelatnik_izvedbeni(izvedbeni_id, djelatnik_id, uloga)
VALUES ('56', '6', 'Profesor');

INSERT INTO djelatnik_izvedbeni(izvedbeni_id, djelatnik_id, uloga)
VALUES ('56', '26', 'Asistent');

INSERT INTO djelatnik_izvedbeni(izvedbeni_id, djelatnik_id, uloga)
VALUES ('57', '9', 'Profesor');

INSERT INTO djelatnik_izvedbeni(izvedbeni_id, djelatnik_id, uloga)
VALUES ('58', '6', 'Profesor');

INSERT INTO djelatnik_izvedbeni(izvedbeni_id, djelatnik_id, uloga)
VALUES ('58', '29', 'Asistent');

INSERT INTO djelatnik_izvedbeni(izvedbeni_id, djelatnik_id, uloga)
VALUES ('59', '6', 'Profesor');

INSERT INTO djelatnik_izvedbeni(izvedbeni_id, djelatnik_id, uloga)
VALUES ('59', '35', 'Asistent');

INSERT INTO djelatnik_izvedbeni(izvedbeni_id, djelatnik_id, uloga)
VALUES ('60', '24', 'Profesor');

INSERT INTO djelatnik_izvedbeni(izvedbeni_id, djelatnik_id, uloga)
VALUES ('60', '24', 'Asistent');

INSERT INTO djelatnik_izvedbeni(izvedbeni_id, djelatnik_id, uloga)
VALUES ('61', '21', 'Profesor');

INSERT INTO djelatnik_izvedbeni(izvedbeni_id, djelatnik_id, uloga)
VALUES ('61', '21', 'Asistent');

INSERT INTO djelatnik_izvedbeni(izvedbeni_id, djelatnik_id, uloga)
VALUES ('62', '23', 'Profesor');

INSERT INTO djelatnik_izvedbeni(izvedbeni_id, djelatnik_id, uloga)
VALUES ('62', '33', 'Asistent');

INSERT INTO djelatnik_izvedbeni(izvedbeni_id, djelatnik_id, uloga)
VALUES ('62', '34', 'Asistent');

INSERT INTO djelatnik_izvedbeni(izvedbeni_id, djelatnik_id, uloga)
VALUES ('63', '15', 'Profesor');

INSERT INTO djelatnik_izvedbeni(izvedbeni_id, djelatnik_id, uloga)
VALUES ('63', '2', 'Asistent');

INSERT INTO djelatnik_izvedbeni(izvedbeni_id, djelatnik_id, uloga)
VALUES ('64', '1', 'Profesor');

INSERT INTO djelatnik_izvedbeni(izvedbeni_id, djelatnik_id, uloga)
VALUES ('64', '21', 'Asistent');

INSERT INTO djelatnik_izvedbeni(izvedbeni_id, djelatnik_id, uloga)
VALUES ('65', '4', 'Profesor');

INSERT INTO djelatnik_izvedbeni(izvedbeni_id, djelatnik_id, uloga)
VALUES ('65', '31', 'Asistent');

INSERT INTO djelatnik_izvedbeni(izvedbeni_id, djelatnik_id, uloga)
VALUES ('66', '16', 'Profesor');

INSERT INTO djelatnik_izvedbeni(izvedbeni_id, djelatnik_id, uloga)
VALUES ('66', '25', 'Profesor');

INSERT INTO djelatnik_izvedbeni(izvedbeni_id, djelatnik_id, uloga)
VALUES ('66', '32', 'Asistent');

INSERT INTO djelatnik_izvedbeni(izvedbeni_id, djelatnik_id, uloga)
VALUES ('67', '4', 'Profesor');

INSERT INTO djelatnik_izvedbeni(izvedbeni_id, djelatnik_id, uloga)
VALUES ('67', '28', 'Asistent');

INSERT INTO djelatnik_izvedbeni(izvedbeni_id, djelatnik_id, uloga)
VALUES ('68', '16', 'Profesor');

INSERT INTO djelatnik_izvedbeni(izvedbeni_id, djelatnik_id, uloga)
VALUES ('68', '32', 'Asistent');

INSERT INTO djelatnik_izvedbeni(izvedbeni_id, djelatnik_id, uloga)
VALUES ('69', '19', 'Profesor');

INSERT INTO djelatnik_izvedbeni(izvedbeni_id, djelatnik_id, uloga)
VALUES ('69', '13', 'Asistent');

INSERT INTO djelatnik_izvedbeni(izvedbeni_id, djelatnik_id, uloga)
VALUES ('69', '17', 'Asistent');

INSERT INTO djelatnik_izvedbeni(izvedbeni_id, djelatnik_id, uloga)
VALUES ('70', '19', 'Profesor');

INSERT INTO djelatnik_izvedbeni(izvedbeni_id, djelatnik_id, uloga)
VALUES ('70', '16', 'Asistent');

INSERT INTO djelatnik_izvedbeni(izvedbeni_id, djelatnik_id, uloga)
VALUES ('71', '16', 'Profesor');

INSERT INTO djelatnik_izvedbeni(izvedbeni_id, djelatnik_id, uloga)
VALUES ('73', '21', 'Profesor');

INSERT INTO djelatnik_izvedbeni(izvedbeni_id, djelatnik_id, uloga)
VALUES ('73', '21', 'Asistent');

INSERT INTO djelatnik_izvedbeni(izvedbeni_id, djelatnik_id, uloga)
VALUES ('74', '7', 'Profesor');

INSERT INTO djelatnik_izvedbeni(izvedbeni_id, djelatnik_id, uloga)
VALUES ('74', '5', 'Asistent');

INSERT INTO djelatnik_izvedbeni(izvedbeni_id, djelatnik_id, uloga)
VALUES ('75', '16', 'Profesor');

INSERT INTO djelatnik_izvedbeni(izvedbeni_id, djelatnik_id, uloga)
VALUES ('75', '23', 'Profesor');

INSERT INTO djelatnik_izvedbeni(izvedbeni_id, djelatnik_id, uloga)
VALUES ('75', '32', 'Asistent');

INSERT INTO djelatnik_izvedbeni(izvedbeni_id, djelatnik_id, uloga)
VALUES ('75', '34', 'Asistent');

INSERT INTO djelatnik_izvedbeni(izvedbeni_id, djelatnik_id, uloga)
VALUES ('76', '15', 'Profesor');

INSERT INTO djelatnik_izvedbeni(izvedbeni_id, djelatnik_id, uloga)
VALUES ('76', '2', 'Asistent');

INSERT INTO djelatnik_izvedbeni(izvedbeni_id, djelatnik_id, uloga)
VALUES ('77', '24', 'Profesor');

INSERT INTO djelatnik_izvedbeni(izvedbeni_id, djelatnik_id, uloga)
VALUES ('77', '24', 'Asistent');

INSERT INTO djelatnik_izvedbeni(izvedbeni_id, djelatnik_id, uloga)
VALUES ('77', '37', 'Asistent');

INSERT INTO djelatnik_izvedbeni(izvedbeni_id, djelatnik_id, uloga)
VALUES ('78', '4', 'Profesor');

INSERT INTO djelatnik_izvedbeni(izvedbeni_id, djelatnik_id, uloga)
VALUES ('78', '4', 'Asistent');

INSERT INTO djelatnik_izvedbeni(izvedbeni_id, djelatnik_id, uloga)
VALUES ('78', '34', 'Asistent');
