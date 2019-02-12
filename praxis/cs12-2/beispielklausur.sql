-- Tabellen mit Fremdschlüsseln löschen
DROP TABLE IF EXISTS Mehrfachsterne, Pulsare, Nebel, Beobachtung;
-- dann die übrigen Tabellen löschen
DROP TABLE IF EXISTS Objekte, Teleskop, Beobachter;

-- Aufgabe 7 a)
CREATE TABLE Objekte(
	Bezeichnung VARCHAR(20),
	Deklination VARCHAR(20),
	Rektaszension VARCHAR(20),
	Helligkeit DECIMAL(5,3),
	ID INT PRIMARY KEY);
CREATE TABLE Mehrfachsterne(
	Anzahl_Komponenten INT,
	ID INT,
	FOREIGN KEY (ID) REFERENCES Objekte(ID));
CREATE TABLE Pulsare(
	Rotationszeit DECIMAL(6,3),
	ID INT,
	FOREIGN KEY (ID) REFERENCES Objekte(ID));
CREATE TABLE Nebel(
	Nebel_Typ VARCHAR(20),
	ID INT,
	FOREIGN KEY (ID) REFERENCES Objekte(ID));
CREATE TABLE Teleskop(
	Teleskop_Name VARCHAR(20),
	Standort VARCHAR(20),
	Spiegeldurchmesser DECIMAL(5,2),
	TID INT PRIMARY KEY);
CREATE TABLE Beobachter(
	Name VARCHAR(40),
	Adresse VARCHAR(50),
	Qualifikation VARCHAR(20),
	BID INT PRIMARY KEY);
CREATE TABLE Beobachtung(
	Zeitpunkt DATETIME,
	ID INT,
	FOREIGN KEY (ID) REFERENCES Objekte(ID),
	BID INT,
	FOREIGN KEY (BID) REFERENCES Beobachter(BID),
	TID INT,
	FOREIGN KEY (TID) REFERENCES Teleskop(TID));

-- Aufgabe 7 b)
INSERT INTO Objekte VALUES
	('61 Cygni',     '21h 06m 53,9s' ,'+38° 44\' 57,9\"', +5.21, 1),
	('Mizar',        '13h 23m 55,50s','+54° 55\' 31,0\"', +2.3, 2),
	('PSR B1919+21', '19h 19m 16s',   '+21° 47\'',        NULL, 3),
	('Krebsnebel',   ' 5h 34m 31,97s','+22°  0\' 52,10\"',+8.4, 4);
INSERT INTO Mehrfachsterne VALUES
	(2, 1),
	(4, 2);
INSERT INTO Pulsare VALUES
	(1.337, 3);
INSERT INTO Nebel VALUES
	('Emissionsnebel', 4);
INSERT INTO Teleskop VALUES
	('Leviatan', 'Birr (Trland)', 1.83, 1),
	('Hooker-Spiegel', 'Mount-Wilson', 2.54, 2);
INSERT INTO Beobachter VALUES
	('William Parsons, 3. Earl of Rosse', 'Birr Castle, Ireland', 'Astronom',1),
	('George Ellery Hale', '100 N. Garfield Avenue, Passadena, CA 91109',
		'Astrophysiker', 2);
-- nicht gefordert - Daten für Beobachtungen
INSERT INTO Beobachtung VALUES
	('1784-02-17 02:15:00',1,1,1),
	('1784-02-18 04:35:00',3,1,1),
	('1923-03-24 23:45:20',2,2,2),
	('1924-12-22 03:25:50',4,2,2);

-- Aufgabe 7 c)
SELECT bo.Zeitpunkt, o.Bezeichnung, br.Name, t.Teleskop_Name
FROM Beobachtung AS bo, Objekte AS o, Beobachter AS br, Teleskop AS t
WHERE bo.ID=o.ID AND bo.BID=br.BID AND bo.TID=t.TID;

-- Aufgabe 7 d)
SELECT o.Bezeichnung, o.Deklination, o.Rektaszension, o.Helligkeit, m.Anzahl_Komponenten
FROM Objekte AS o LEFT OUTER JOIN Mehrfachsterne AS m
ON o.ID=m.ID;