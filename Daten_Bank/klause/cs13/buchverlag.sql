DROP TABLE IF EXISTS 
  person, buch, buchhandlung,
  bearbeitet, verkauft, lesung, entscheidet, entscheidet_herausgeber
  CASCADE;


CREATE TABLE person(
  nachname VARCHAR(30),
  vorname VARCHAR(30),
  pid INT PRIMARY KEY) WITH OIDS;

CREATE TABLE lektor(
  fachgebiet VARCHAR(30),
  lid INT PRIMARY KEY,
  chef_lid INT,
  FOREIGN KEY (chef_lid) REFERENCES lektor(lid))
	INHERITS (person) WITH OIDS;

CREATE TABLE herausgeber(
  arbeitgeber VARCHAR(30),
  hid INT PRIMARY KEY)
	INHERITS (person) WITH OIDS;

CREATE TABLE verfasser(
  akad_titel VARCHAR(30),
  anzahl_buecher INT,
  vid INT PRIMARY KEY)
	INHERITS (person) WITH OIDS;

CREATE TABLE buch(
  isbn BIGINT,  -- kein Schlüsselkandidat, wird erst vor Druck vergeben
  bid INT PRIMARY KEY,
  titel VARCHAR(100),
  betreut_lid INT,
  FOREIGN KEY (betreut_lid) REFERENCES lektor(lid))
	WITH OIDS;

CREATE TABLE buchhandlung(
  bhname VARCHAR(50),
  bhid INT PRIMARY KEY)
	WITH OIDS;

CREATE TABLE bearbeitet(
  bearbeitet_vid INT,
  bearbeitet_bid INT,
  FOREIGN KEY (bearbeitet_vid) REFERENCES verfasser(vid),
  FOREIGN KEY (bearbeitet_bid) REFERENCES buch(bid))
	WITH OIDS;

CREATE TABLE verkauft(
  verkauft_bhid INT,
  verkauft_bid INT,
  FOREIGN KEY (verkauft_bhid) REFERENCES buchhandlung(bhid),
  FOREIGN KEY (verkauft_bid) REFERENCES buch(bid))
	WITH OIDS;

CREATE TABLE lesung(
  lesung_bhid INT,
  lesung_vid INT,
  honorar DOUBLE PRECISION,
  FOREIGN KEY (lesung_bhid) REFERENCES buchhandlung(bhid),
  FOREIGN KEY (lesung_vid) REFERENCES verfasser(vid))
	WITH OIDS;

CREATE TABLE entscheidet(
  startauflage INT,
  preis DOUBLE PRECISION,
  eid INT PRIMARY KEY,
  entscheidet_lid INT,
  entscheidet_bid INT,
  FOREIGN KEY (entscheidet_lid) REFERENCES lektor(lid),
  FOREIGN KEY (entscheidet_bid) REFERENCES buch(bid))
	WITH OIDS;

CREATE TABLE entscheidet_herausgeber(
  eid INT,
  entscheidet_hid INT,
  FOREIGN KEY (eid) REFERENCES entscheidet(eid),
  FOREIGN KEY (entscheidet_hid) REFERENCES herausgeber(hid))
	WITH OIDS;