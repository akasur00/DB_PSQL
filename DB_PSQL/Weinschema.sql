CREATE SCHEMA Weinschema;
SET search_path = Weinschema;

CREATE TABLE ERZEUGER(
	Weingut VARCHAR(20) PRIMARY KEY,
	Anbaugebiet VARCHAR(20),
	Region VARCHAR(15)
);

CREATE TABLE WEINE (
	WeinID INT,
	Name VARCHAR(20) NOT NULL,
	Farbe VARCHAR(10),
	Jahrgang INT,
	Weingut VARCHAR(20),
	PRIMARY KEY(WeinID),
	FOREIGN KEY(Weingut) REFERENCES ERZEUGER(Weingut)
);

INSERT INTO ERZEUGER VALUES ('Creek','Barossa Valley','Südaustralien');
INSERT INTO ERZEUGER VALUES ('Helena','Napa Valley','Kalifornien');
INSERT INTO ERZEUGER VALUES ('Château La Rose','Saint-Émilion','Bordeaux');
INSERT INTO ERZEUGER VALUES ('Château La Pointe','Pomerol','Bordeaux');
INSERT INTO ERZEUGER VALUES ('Müller','Rheingau','Hessen');
INSERT INTO ERZEUGER VALUES ('Bighorn','Napa Valley','Kalifornien');

INSERT INTO WEINE VALUES (1042,'La Rose Grand Cru','Rot',2013,'Château La Rose');
INSERT INTO WEINE VALUES (2168,'Creek Shiraz','Rot',2018,'Creek');
INSERT INTO WEINE VALUES (3456,'Zinfandel','Rot',2019,'Helena');
INSERT INTO WEINE VALUES (2171,'Pinot Noir','Rot',2016,'Creek');
INSERT INTO WEINE VALUES (3478,'Pinot Noir','Rot',2014,'Helena');
INSERT INTO WEINE VALUES (4711,'Riesling Reserve','Weiß',2014,'Müller');
INSERT INTO WEINE VALUES (4961,'Chardonnay','Weiß',2017,'Bighorn');