SELECT * FROM database.duckdb;

SELECT
	*
FROM
	database.duckdb
WHERE
	word = 'DROP SCHEMA';

SELECT
	*
FROM
	database.duckdb
WHERE
	word LIKE 'A%'; -- using regular expressions!
	

	
