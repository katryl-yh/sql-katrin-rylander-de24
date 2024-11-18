SELECT * FROM database.duckdb d ;

UPDATE database.duckdb 
SET id = id -5 
WHERE id BETWEEN 6 AND 15;

DROP SEQUENCE id_duckdb_sequence;
CREATE SEQUENCE IF NOT EXISTS id_duckdb_sequence START 11;

--SELECT UNNEST(generate_series(1,10)) ;


