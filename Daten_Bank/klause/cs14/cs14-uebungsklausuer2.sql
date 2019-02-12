-- Datei speicher ist immer eine gute Idee :=)
-- PS: Anmelden nicht als user "postgres"
DROP TABLE IF EXISTS besichtigung CASCADE;

-- 4 b)
-- 3 stellige Bezieung Besichtigung
CREATE TABLE besichtigung (
  datum DATE,
  zeit TIME,
  makler_id INT,
  kunden_id INT,
  objekte_id INT,
  FOREIGN KEY (makler_id) REFERENCES makler(id),
  FOREIGN KEY (kunden_id) REFERENCES kunden(id),
  FOREIGN KEY (objekte_id) REFERENCES objekte(id)
  ) WITH OIDS;

