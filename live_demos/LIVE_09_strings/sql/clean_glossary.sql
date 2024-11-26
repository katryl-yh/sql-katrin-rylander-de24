CREATE SCHEMA IF NOT EXISTS refined; -- we make transformations in refined

CREATE TABLE IF NOT EXISTS refined.sql_glossary AS (
SELECT
	UPPER(TRIM(sql_word)) AS sql_word,
	REGEXP_REPLACE (TRIM(description), ' +', ' ', 'g') AS description,
	example -- needs to be cleaned by us!!!
FROM
	staging.sql_glossary);
	
ALTER TABLE refined.sql_glossary
ADD COLUMN clean_example STRING;

SELECT * FROM refined.sql_glossary;

UPDATE refined.sql_glossary
SET clean_example = REGEXP_REPLACE (TRIM(example), ' +', ' ', 'g') ;

SELECT sql_word, clean_example FROM refined.sql_glossary;
---------------------------------------
 
SELECT
    sql_word,
    clean_example,
    --REGEXP_REPLACE(clean_example, '\\y' || sql_word || '\\y', sql_word, 'g') AS modified_example,
    REPLACE(LOWER(clean_example), LOWER(sql_word), sql_word) AS modified_example
FROM
    refined.sql_glossary;

   
   