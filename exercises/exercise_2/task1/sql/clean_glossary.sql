CREATE SCHEMA IF NOT EXISTS refined; -- we make transformations in refined
-- test if it works
SELECT
	UPPER(TRIM(sql_word)) AS sql_word,
	REGEXP_REPLACE (TRIM(description), ' +', ' ', 'g') AS description,
	REGEXP_REPLACE (TRIM(example), ' +', ' ', 'g') AS example
FROM
	staging.sql_glossary;
	
CREATE TABLE IF NOT EXISTS refined.sql_glossary AS (
SELECT
	UPPER(TRIM(sql_word)) AS sql_word,
	REGEXP_REPLACE (TRIM(description), ' +', ' ', 'g') AS description,
	REGEXP_REPLACE (TRIM(example), ' +', ' ', 'g') AS example
FROM
	staging.sql_glossary);
	
ALTER TABLE refined.sql_glossary
ADD COLUMN cleaned_example VARCHAR(255);

SELECT * FROM refined.sql_glossary;

---------------------------------------
 
SELECT
    sql_word,
    example,
    REGEXP_REPLACE(example, sql_word || ' ' , sql_word || ' ', 'ig') AS modified_example,
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
   
-- NOTE: THIS will not work!
   
WITH words_list AS (
  SELECT sql_word
  FROM your_table  -- List of words to replace
)
UPDATE refined.sql_glossary
SET cleaned_example = (
  SELECT string_agg(
           REGEXP_REPLACE(example, 
                          '\\y' || sql_word || '\\y',  -- Match the whole word exactly
                          sql_word,                    -- Replace with the exact word
                          'ig'),                       -- Case insensitive AND Global replace (all occurrences)
           ' '
         )
  FROM words_list
  WHERE example REGEXP sql_word  -- Ensure the word exists in the expression
)
WHERE EXISTS (
  SELECT 1
  FROM words_list
  WHERE example REGEXP sql_word
);

   