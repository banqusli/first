DROP TABLE IF EXISTS versuch CASCADE;

CREATE TABLE versuch(
  vnr VARCHAR(5) PRIMARY KEY,
  vname VARCHAR(30),
  datum DATE,
  benutzer VARCHAR(30));

CREATE OR REPLACE FUNCTION
  Versuch_Datum_geaendert()
  RETURNS TRIGGER AS
  $$
    BEGIN
      IF NEW.vnr IS NULL THEN RAISE EXCEPTION 'Feld vnr nicht gefüllt';
        END IF;
      IF NEW.vname IS NULL THEN RAISE EXCEPTION 'Feld vname nicht gefüllt';
        END IF;
      NEW.datum := NOW();
      NEW.benutzer := CURRENT_USER;
      RETURN NEW;
    END
  $$ LANGUAGE plpgsql;

CREATE TRIGGER Versuch_Datum_geaendert
  BEFORE INSERT OR UPDATE ON versuch
  FOR EACH ROW EXECUTE PROCEDURE 
  Versuch_Datum_geaendert();