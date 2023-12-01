CREATE SCHEMA IF NOT EXISTS hochschule;
DROP TABLE IF EXISTS pruefen;
DROP TABLE IF EXISTS hoeren;
DROP TABLE IF EXISTS voraussetzen;
DROP TABLE IF EXISTS Studenten;
DROP TABLE IF EXISTS Assistenten;
DROP TABLE IF EXISTS Vorlesungen;
DROP TABLE IF EXISTS Professoren;
SET DATESTYLE = DMY;

CREATE TABLE Studenten(
  MatrNr         INTEGER PRIMARY KEY,
  Name           VARCHAR(20) NOT NULL,
  Semester       INTEGER,
  GebDatum       DATE
);

CREATE TABLE Professoren(
  PersNr         INTEGER PRIMARY KEY,
  Name           VARCHAR(20) NOT NULL,
  Rang           CHAR(2) CHECK (Rang in ('C2','C3','C4','W1','W2','W3')),
  Raum           INTEGER UNIQUE,
  Gebdatum       DATE
);

CREATE TABLE Assistenten (
  PersNr         INTEGER PRIMARY KEY,
  Name           VARCHAR(20) NOT NULL,
  Fachgebiet     VARCHAR(20),
  Boss           INTEGER,
  GebDatum       DATE,
  FOREIGN KEY (Boss) REFERENCES Professoren (PersNr)
);

CREATE TABLE Vorlesungen (
  VorlNr         INTEGER PRIMARY KEY,
  Titel          VARCHAR(30),
  SWS            INTEGER,
  gelesenVon     INTEGER,
  FOREIGN KEY (gelesenVon) REFERENCES Professoren (PersNr) 
);

CREATE TABLE hoeren (
  MatrNr         INTEGER,
  VorlNr         INTEGER,
  PRIMARY KEY (MatrNr, VorlNr),
  FOREIGN KEY (MatrNr) REFERENCES Studenten (MatrNr),
  FOREIGN KEY (VorlNr) REFERENCES Vorlesungen (VorlNr)      
);

CREATE TABLE voraussetzen (
  Vorgaenger     INTEGER,
  Nachfolger     INTEGER,
  PRIMARY KEY (Vorgaenger, Nachfolger),
  FOREIGN KEY (Vorgaenger) REFERENCES Vorlesungen (VorlNr),    
  FOREIGN KEY (Nachfolger) REFERENCES Vorlesungen (VorlNr)
);

CREATE TABLE pruefen (
  MatrNr         INTEGER,
  VorlNr         INTEGER,
  PersNr         INTEGER,
  Note           NUMERIC(2,1) CHECK (Note between 0.7 and 5.0),
  PRIMARY KEY (MatrNr, VorlNr),
  FOREIGN KEY (MatrNr) REFERENCES Studenten (MatrNr),
  FOREIGN KEY (VorlNr) REFERENCES Vorlesungen (VorlNr),
  FOREIGN KEY (PersNr) REFERENCES Professoren (PersNr)
);


---------------------- mit Daten fuellen --------------------------

INSERT INTO Studenten (MatrNr, Name, Semester, gebDatum) VALUES
(24002, 'Xenokrates',  9, '23.10.1975'),
(25403, 'Jonas',       1, '18.09.1973'),
(26120, 'Fichte',      3, '04.12.1967'),
(26830, 'Aristoxenos',  5, '05.08.1943'),
(27550, 'Schopenhauer', 1, '22.06.1954'),
(28106, 'Carnap',       3, '02.10.1979'),
(29120, 'Theophrastos', 7, '19.04.1948'),
(29555, 'Feuerbach',    1, '12.02.1961'),
(27123, 'Kessler',    3, '11.11.1978'),
(29917, 'Erlebach',    1, '20.05.1981');

INSERT INTO Professoren (PersNr, Name, Rang, Raum, gebDatum) VALUES
(2125,  'Sokrates',   'C4', 226, '23.08.1923'),
(2126,  'Russel',     'W2', 232, '10.07.1934'),
(2127,  'Kopernikus', 'C3', 310, '12.03.1962'),
(2133,  'Popper',     'C3',  52, '03.09.1949'),
(2134,  'Augustinus', 'W2', 309, '21.04.1939'),
(2136,  'Curie',      'C4',  36, '10.05.1929'),
(2137,  'Kant',       'C4',   7, '04.04.1950'),
(4711,  'Newton',     'C4', 339, '24.03.1951'),
(4712,  'Möbius',     'W3', 222, '18.09.1962');

INSERT INTO Assistenten (PersNr, Name, Fachgebiet, Boss, gebDatum) VALUES
(3002, 'Platon',       'Ideenlehre',         2125, '14.08.1966'),
(3003, 'Aristoteles',  'Syllogistik',        2125, '23.12.1970'),
(3004, 'Wittgenstein', 'Sprachtheorie',      2126, '02.08.1968'),
(3005, 'Rhetikus',     'Planetenbewegung',   2127, '09.06.1967'),
(3006, 'Newton',       'Keplersche Gesetze', 2127, '10.11.1961'),
(3007, 'Spinoza',      'Gott und Natur',     2134, '08.02.1963');

INSERT INTO Vorlesungen (VorlNr, Titel, SWS, gelesenVon) VALUES
(4052, 'Logik',                4, 2125),
(4630, 'Die 3 Kritiken',       4, 2137),
(5001, 'Grundzuege',           4, 2137),
(5022, 'Glaube und Wissen',    2, 2134),
(5041, 'Ethik',                4, 2125),
(5043, 'Erkenntnistheorie',    3, 2126),
(5049, 'Mäeutik',             2, 2125),
(5052, 'Wissenschaftstheorie', 3, 2126),
(5216, 'Bioethik',             2, 2126),
(5259, 'Der Wiener Kreis',     2, 2133);

INSERT INTO hoeren (MatrNr, VorlNr) VALUES
(25403, 5022),
(26120, 5001),
(27550, 4052),
(27550, 4630),
(27550, 5001),
(27550, 5041),
(27550, 5259),
(28106, 4052),
(28106, 5216),
(28106, 5259),
(29120, 5041),
(29120, 5049),
(29555, 5001),
(29555, 5022);

INSERT INTO voraussetzen (Vorgaenger, Nachfolger) VALUES
(5001, 5041),
(5001, 5043),
(5001, 5049),
(5041, 5052),
(5041, 5216),
(5043, 5052),
(5052, 5259);

INSERT INTO pruefen (MatrNr, VorlNr, PersNr, Note) VALUES
(25403, 5041, 2125, 2.0),
(27550, 4630, 2137, 2.0),
(29917, 5001, 2127, 0.7),
(28106, 5001, 2126, 1.0),
(27550, 5001, 2126, 2.3),
(27123, 4052, 4712, 3.7);