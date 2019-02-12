-- SELECT * FROM student WHERE major='cs';

-- CREATE VIEW studentview AS
--   SELECT name, birthdate, college, level FROM student;

-- SELECT * FROM studentview;
-- SELECT name, birthdate FROM studentview;

-- ALTER TABLE student 
--  ADD geschwister VARCHAR(10)[];

-- UPDATE student SET geschwister = '{"Trick","Track"}' 
--  WHERE name = 'Tick Duck';

-- UPDATE student SET geschwister = '{"Tick","Track"}'
--   WHERE name LIKE 'Trick%';

-- UPDATE student SET geschwister = '{"Tick Duck","Trick Duck"}'
--  WHERE name LIKE 'Track%';

-- SELECT geschwister FROM student WHERE name LIKE 'Track%';

-- Zählung im Array beginnt mit 1 !!!
-- SELECT geschwister[1] FROM student WHERE name LIKE 'Track%';

-- Mathamatische Funktionen
-- ------------------------
SELECT ABS(-3.4923);
SELECT PI();
SELECT ROUND(3.14159, 2);
SELECT RANDOM();
SELECT SQRT(2);
SELECT CEIL(5.23343);
SELECT CEIL(5.0);
SELECT FLOOR(5.23343);
SELECT FLOOR(5.0);
SELECT MOD(12343, 10);

-- Zeichenkettenfunktionen
-- -----------------------
SELECT ASCII('0');
SELECT CHR(48);
SELECT LOWER('Hello World!');
SELECT UPPER('Hello World!');
SELECT POSITION('ll' IN 'Hello World!');
SELECT LENGTH('Hello World!');
SELECT LENGTH('Windischeschenbach');
SELECT LENGTH('Naabdemenreuth');
SELECT 'Hello' || ' ' || 'World!';
SELECT SUBSTRING('PostgreSQL', 8); -- keine Länge angegeben
SELECT SUBSTRING('PostgreSQL', 8, 2); -- Länge angegeben
-- Text trimmen
SELECT TRIM(BOTH '*' FROM '**PostgreSQL***');
SELECT TRIM(LEADING '*' FROM '**PostgreSQL***');
SELECT TRIM(TRAILING '*' FROM '**PostgreSQL***');
SELECT BTRIM('**PostgreSQL***', '*');
SELECT LTRIM('**PostgreSQL***', '*');
SELECT RTRIM('**PostgreSQL***', '*');
-- Text umwandeln
SELECT INITCAP('hier war jemand zu faul, richtig zu schreiben.');
SELECT TO_HEX(48);
SELECT REPEAT('Hello World! ', 20);
-- Text verschleiern
SELECT TRANSLATE('IBM','ABCDEFGHIJKLMNOPQRSTUVWXYZ',
                       'ZABCDEFGHIJKLMNOPQRSTUVWXY');
SELECT TRANSLATE('HAL','ZABCDEFGHIJKLMNOPQRSTUVWXY',
                       'ABCDEFGHIJKLMNOPQRSTUVWXYZ');

-- Datums- und Uhrzeitfunktionen
-- -----------------------------
SELECT CURRENT_DATE;
SELECT CURRENT_TIME;
SELECT CURRENT_TIMESTAMP;
SELECT NOW(); -- enstpricht CURRENT_TIMESTAMP
SELECT LOCALTIME;
SELECT LOCALTIMESTAMP;
SELECT TIMEOFDAY();
-- Berechnungen mit Zeitangaben
SELECT AGE(CURRENT_DATE, '1992-03-14');
SELECT EXTRACT(Year FROM DATE '1992-03-14');
SELECT EXTRACT(Year FROM (SELECT AGE(CURRENT_DATE, '1992-03-14')));
SELECT CURRENT_DATE + INTERVAL '14 Days';
SELECT DATE '2017-11-14' + INTERVAL '11 WEEKS' AS "+ 11 Wochen";



