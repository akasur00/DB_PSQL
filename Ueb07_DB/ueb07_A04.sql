--AUFG04 Blatt07

--a)
--lediglich die Attribute AbtNr und Vorgesetzte können NULL gesetzt werden
--dann keine Zugehörigkeit zu einer ABteilung und kein Vorgesetzter

--b)
CREATE SCHEMA IF NOT EXISTS ue07_a04_unternehmen;
SET SEARCH_PATH=ue07_a04_unternehmen;

SELECT * FROM abteilung;
SELECT * FROM personal;

CREATE TABLE abteilung(
    AbtNr   INTEGER,
    Name    VARCHAR(512) NOT NULL ,
    PRIMARY KEY (AbtNr)
);

CREATE TABLE personal(
    PersNr  INTEGER,
    Name    VARCHAR(512) NOT NULL,
    Vorname VARCHAR(512) NOT NULL,
    Eintrittsdatum  DATE NOT NULL,
    Gehalt  INTEGER NOT NULL,
    Vorgesetzte INTEGER REFERENCES personal,
    AbtNr   INTEGER REFERENCES abteilung,
    PRIMARY KEY (PersNr)
);

--c)
INSERT INTO abteilung VALUES
                                               (1000, 'Softwareentwicklung'), (2000, 'Vertrieb'), (3000, 'Buchhaltung');

--d)
INSERT INTO personal (PersNr, Name, Vorname, Eintrittsdatum, Gehalt)
VALUES
(4711, 'Müller', 'Herbert', '01.11.2022', 2800), (4710, 'Meier', 'Lieschen', '01.01.2020', 2800);

--e)
UPDATE personal
SET Gehalt=Gehalt*1.02
WHERE Eintrittsdatum<'01.01.2021';

--f)
SELECT name, vorname, Gehalt
FROM personal
WHERE name like 'M%' AND Gehalt >2500 AND Gehalt<3500;

--g)
SELECT *
FROM personal
WHERE Vorgesetzte IS NULL;