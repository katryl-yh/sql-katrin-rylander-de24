-- DML -- Data Manipulation Language

SELECT * FROM database.duckdb;

-- scenario -- I want to remove rows 5 and 8
-- I can do it with id

-- SELECT * FROM database.duckdb WHERE id IN (5,8);

-- OR I can do it with the actual names
SELECT
	*
FROM
	database.duckdb
WHERE
	word IN ('TIMESTAMPTZ', 'DROP SCHEMA');

-- NOW the DELETE part
DELETE
FROM
	database.duckdb
WHERE
	word IN ('TIMESTAMPTZ', 'DROP SCHEMA');

-- WE can also DROP tables, schemas but then it is DDL!!!

