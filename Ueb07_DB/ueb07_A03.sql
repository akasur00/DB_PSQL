--1
---a
SELECT *
FROM hochschule.studenten; --vorlesungen ...

---b
SELECT matrnr, semester
FROM hochschule.studenten;

---c
SELECT matrnr, name, semester
FROM hochschule.studenten
WHERE semester = 3;

---d
SELECT *
FROM hochschule.vorlesungen
JOIN hochschule.professoren on TRUE;

---e
SELECT vl.titel, vl.sws, pr.name
FROM hochschule.vorlesungen as vl
JOIN hochschule.professoren as pr on vl.gelesenvon = pr.persnr; --gelesenvon und persnr ist der selbe schlüssel

---f
SELECT st.matrnr, st.name
FROM hochschule.studenten as st
JOIN hochschule.hoeren as h on st.matrnr = h.matrnr
JOIN hochschule.vorlesungen as vl on h.vorlnr = vl.vorlnr
WHERE vl.titel = 'Logik' or vl.titel = 'Ethik';

--2
---a
UPDATE hochschule.professoren
SET rang='C4'
WHERE rang='C3';

---b
DELETE FROM hochschule.assistenten
WHERE fachgebiet='Planetenbewegung';

---c
INSERT INTO hochschule.vorlesungen VALUES (5278, 'Grundlagen Datenbanken', 4,
                                            (SELECT persnr
                                             FROM hochschule.professoren
                                             WHERE name='Curie'));              --nur als Beispiel für safe Statement
INSERT INTO hochschule.voraussetzen VALUES (4052, 5278);                        --nicht in der Prüfung so schreiben!!
INSERT INTO hochschule.hoeren VALUES (28106, 5278);