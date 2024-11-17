SELECT * FROM database.duckdb d ;

UPDATE database.duckdb 
SET learnt = TRUE 
WHERE id IN (3);
