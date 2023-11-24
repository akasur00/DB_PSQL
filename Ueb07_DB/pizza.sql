--3
CREATE SCHEMA IF NOT EXISTS pizza;

--a
CREATE TABLE pizza.kunde(
    name    VARCHAR(512),
    ort     VARCHAR(512),
    strasse VARCHAR(512),
    PRIMARY KEY (name)
);

CREATE TABLE pizza.preisliste(
    produkt VARCHAR(512),
    preis   FLOAT,
    PRIMARY KEY (produkt)
);

CREATE TABLE pizza.liefervertrag(
    pizzeria    VARCHAR(512),
    produkt     VARCHAR(512),
    anzahl      INTEGER,
    PRIMARY KEY (pizzeria, produkt),
    FOREIGN KEY (pizzeria) REFERENCES pizza.kunde(name),
    FOREIGN KEY (produkt) REFERENCES pizza.preisliste(produkt)
);

--b
---Inserts
--Kunde
INSERT INTO pizza.kunde VALUES ('Bella Italia', 'Göttingen', 'Weender Str.8');
INSERT INTO pizza.kunde VALUES ('Casino Grande', 'Kassel', 'Am Weinberg 14');
INSERT INTO pizza.kunde VALUES ('Da Mafia', 'Göttingen', 'Lotzestrasse 16-18');
INSERT INTO pizza.kunde VALUES ('Venezia', 'Kassel', 'Königsstrasse 111');

--Preisliste
INSERT INTO pizza.preisliste VALUES ('Pizza', 5.00);
INSERT INTO pizza.preisliste VALUES ('Lasagne', 6.00);
INSERT INTO pizza.preisliste VALUES ('Gnocchi', 4.50);
INSERT INTO pizza.preisliste VALUES ('Salat', 3.00);

--Liefervertrag
INSERT INTO pizza.liefervertrag VALUES ('Bella Italia', 'Pizza', 10);
INSERT INTO pizza.liefervertrag VALUES ('Bella Italia', 'Lasagne', 15);
INSERT INTO pizza.liefervertrag VALUES ('Bella Italia', 'Salat', 20);
INSERT INTO pizza.liefervertrag VALUES ('Casino Grande', 'Pizza', 12);
INSERT INTO pizza.liefervertrag VALUES ('Casino Grande', 'Salat', 15);
INSERT INTO pizza.liefervertrag VALUES ('Da Mafia', 'Gnocchi', 60);
INSERT INTO pizza.liefervertrag VALUES ('Venezia', 'Pizza', 20);

---Queries
--c
--SELECT k.name, k.ort
--FROM pizza.kunde k
--JOIN pizza.liefervertrag p on k.name=p.pizzeria
--WHERE p.produkt='Lasagne';

SELECT *
FROM pizza.liefervertrag
WHERE produkt='Lasagne';

--d
ALTER TABLE pizza.kunde
ADD COLUMN email VARCHAR(256),
ADD COLUMN telefonnr VARCHAR(64);

--e
DELETE FROM pizza.liefervertrag
WHERE pizzeria='Da Mafia';
