CREATE OR REPLACE FUNCTION
  geschwister(TEXT, INT)
  RETURNS VARCHAR(30) AS
  $$
    SELECT geschwister[$2] FROM student
      WHERE name LIKE '%' || $1 || '%';
  $$ LANGUAGE SQL;

SELECT geschwister('Tick', 1);
SELECT geschwister('Duck', 1);

-- PL/pgSQL
CREATE OR REPLACE FUNCTION
  Arith_Mittel(INT, INT)
  RETURNS NUMERIC AS
  $$
    DECLARE
      Zahl1 ALIAS FOR $1;
      Zahl2 ALIAS FOR $2;
      Ergebnis NUMERIC;
    BEGIN
      Ergebnis := (Zahl1 + Zahl2) / 2.0;
      RETURN Ergebnis;
    END;
  $$ LANGUAGE plpgsql;

SELECT Arith_Mittel( 2,5);