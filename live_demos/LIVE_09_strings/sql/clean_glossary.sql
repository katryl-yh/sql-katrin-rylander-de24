CREATE SCHEMA IF NOT EXISTS refined; -- we make transformations in refined

CREATE TABLE IF NOT EXISTS refined.sql_glossary AS (
SELECT
	UPPER(TRIM(sql_word)) AS sql_word,
	REGEXP_REPLACE (TRIM(description), ' +', ' ', 'g') AS description,
	example -- needs to be cleaned by us!!!
FROM
	staging.sql_glossary);
	

SELECT * FROM refined.sql_glossary;