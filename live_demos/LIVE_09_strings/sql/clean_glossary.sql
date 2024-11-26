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
---------------------------------------------------
-- To solve this problem in DuckDB, we need to follow these steps:

-- Identify each word from the sql_word column that appears in the clean_example column.
-- Replace each occurrence of a word in clean_example with the exact case from sql_word.
   
-- Step-by-Step Solution:
-- 		Create a list of words from the sql_word column.
-- 		Iterate over each word and use the REGEXP_REPLACE function to replace each occurrence of the word in clean_example, ensuring the case is preserved.
-- 		Update the table by replacing the words in the clean_example column.

WITH words_list AS (
  SELECT DISTINCT sql_word
  FROM refined.sql_glossary  -- List of words to replace
)
UPDATE refined.sql_glossary
SET modfied_example = (
  SELECT string_agg(
         REGEXP_REPLACE(clean_example, 
                          '\\y' || sql_word || '\\y',  -- Match the whole word exactly
                          sql_word,                    -- Replace with the exact word
                          'g'),                        -- Global replace (all occurrences)
           ' '
         )
  FROM words_list
  WHERE clean_example REGEXP sql_word  -- Ensure the word exists in the expression
)
WHERE EXISTS (
  SELECT 1
  FROM words_list
  WHERE clean_example REGEXP sql_word
);
   
   