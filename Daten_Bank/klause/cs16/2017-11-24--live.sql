DROP TABLE IF EXISTS person CASCADE;

CREATE TABLE person(
  name CHAR(25),
  city CHAR(20),
  birthdate DATE PRIMARY KEY UNIQUE) WITH OIDS;
  
CREATE TABLE professor(
  dept CHAR(20),
  field CHAR(50),
  tenure BOOL) INHERITS (person) WITH OIDS;

CREATE TABLE student(
  studid CHAR(12) UNIQUE,
  college CHAR(10),
  major CHAR(10),
  level CHAR(20)) INHERITS (person) WITH OIDS;

