DROP TABLE IF EXISTS objekte, mehrfachsterne, pulsare, nebel CASCADE;
DROP TABLE IF EXISTS teleskop, beobachter, betreut, beobachtet CASCADE;

-- 7 b)
CREATE TABLE objekte (
	bezeichnungen VARCHAR(20)[],
	deklination VARCHAR(20),
	rektaszension VARCHAR(20),
	helligkeit VARCHAR(10),
	ID INTEGER PRIMARY KEY) WITH OIDS;

CREATE TABLE mehrfachsterne (
	anzahl_komponenten INTEGER ) INHERITS (objekte) WITH OIDS;

CREATE TABLE pulsare (
	rotationszeit DECIMAL(6,3) ) INHERITS (objekte) WITH OIDS;

CREATE TABLE nebel (
	typ VARCHAR(20) ) INHERITS (objekte) WITH OIDS;

CREATE TABLE teleskop (
	name VARCHAR(20),
	standort VARCHAR(20),
	spiegeldurchmesser DECIMAL(5,2),
	TID INTEGER PRIMARY KEY) WITH OIDS;

CREATE TABLE beobachter (
	name VARCHAR(40),
	adresse VARCHAR(50),
	qualifikation VARCHAR(20),
	BID INTEGER PRIMARY KEY) WITH OIDS;

CREATE TABLE betreut (
	TID INTEGER,
	FOREIGN KEY (TID) REFERENCES teleskop(TID),
	BID INTEGER,
	FOREIGN KEY (BID) REFERENCES beobachter(BID) ) WITH OIDS;

CREATE TABLE beobachtet (
	zeitpunkt VARCHAR(15),
	ID INTEGER,
	FOREIGN KEY (ID) REFERENCES objekte(ID),
	TID INTEGER,
	FOREIGN KEY (TID) REFERENCES teleskop(TID),
	BID INTEGER,
	FOREIGN KEY (BID) REFERENCES beobachter(BID) ) WITH OIDS;

-- 7 c)

-- ' quoten: ''
INSERT INTO mehrfachsterne VALUES
	('{"61 Cygni"}',     '21 h 06 m 53,9 s',  '+38° 44'' 57,9"', '+ 5,21 mag', 1, 2),
	('{"Mizar"}',        '13 h 23 m 55,50 s', '+54° 55'' 31,0"', '+ 2,3 mag',  2, 4);
INSERT INTO pulsare VALUES
	('{"PSR B1919+21"}', '19 h 19 m 16 s',    '+21° 47''',        NULL,        3, 1.337);
INSERT INTO nebel VALUES
	('{"Krebsnebel","M 1","NGC 1952"}',
	                      '5 h 34 m 31,97 s', '+22° 0'' 52,10"', '+ 8,4 mag',  4, 'Emissionsnebel');

INSERT INTO teleskop VALUES
	('Leviatan',       'Birr (Irland)', 1.83, 1),
	('Hooker-Spiegel', 'Mount-Wilson',  2.54, 2);

INSERT INTO beobachter VALUES
	('William Parsons, 3. Earl of Rosse', 'Birr Castle, Ireland', 'Astronom', 1),
	('George Ellery Hale','100 N. Garfield Avenue, Pasedena, CA 91109', 'Astrophysiker', 2);

-- 7 d)
ALTER TABLE pulsare ADD name VARCHAR(20);
ALTER TABLE pulsare ADD datum DATE;
-- Triggerfunktion
CREATE OR REPLACE FUNCTION pulsare_geandert() RETURNS TRIGGER AS
$$	BEGIN
	NEW.name := current_user;
	NEW.datum := 'now';
	RETURN NEW;
	END;
$$ LANGUAGE PLPGSQL;
-- Trigger anlegen
CREATE TRIGGER pulsare_geaendert BEFORE INSERT OR UPDATE ON pulsare
	FOR EACH ROW EXECUTE PROCEDURE pulsare_geandert();

-- 7 e)
CREATE OR REPLACE VIEW objectview AS
	SELECT bezeichnungen, rektaszension, deklination, helligkeit FROM objekte;

SELECT * FROM objectview;