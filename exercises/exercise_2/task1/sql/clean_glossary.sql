CREATE SCHEMA IF NOT EXISTS refined; -- we make transformations in refined
-- test if it works
SELECT
	UPPER(TRIM(sql_word)) AS sql_word,
	REGEXP_REPLACE (TRIM(description), ' +', ' ', 'g') AS description,
	REGEXP_REPLACE (TRIM(example), ' +', ' ', 'g') AS example
FROM
	staging.sql_glossary;
---------------------------------------------------------------------------------

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

---------------------------------------------------------------------------------
 
SELECT
    sql_word,
    example,
    REGEXP_REPLACE(example, sql_word || ' ' , sql_word || ' ', 'ig') AS modified_example,
FROM
    refined.sql_glossary;
---------------------------------------------------
   
-- from Alex
   
SELECT
    example,
    CASE
        WHEN LOWER(example) LIKE '%select%' THEN REPLACE(REGEXP_REPLACE(TRIM(LOWER(example)), ' +', ' ', 'g'), 'select', 'SELECT')
        WHEN LOWER(example) LIKE '%from%' THEN REPLACE(REGEXP_REPLACE(TRIM(LOWER(example)), ' +', ' ', 'g'), 'from', 'FROM')
        WHEN LOWER(example) LIKE '%where%' THEN REPLACE(REGEXP_REPLACE(TRIM(LOWER(example)), ' +', ' ', 'g'), 'where', 'WHERE')
        WHEN LOWER(example) LIKE '%join%' THEN REPLACE(REGEXP_REPLACE(TRIM(LOWER(example)), ' +', ' ', 'g'), 'join', 'JOIN')
        WHEN LOWER(example) LIKE '%group by%' THEN REPLACE(REGEXP_REPLACE(TRIM(LOWER(example)), ' +', ' ', 'g'), 'group by', 'GROUP BY')
        WHEN LOWER(example) LIKE '%insert into%' THEN REPLACE(REGEXP_REPLACE(TRIM(LOWER(example)), ' +', ' ', 'g'), 'insert into', 'INSERT INTO')
        WHEN LOWER(example) LIKE '%drop table%' THEN REPLACE(REGEXP_REPLACE(TRIM(LOWER(example)), ' +', ' ', 'g'), 'drop table', 'DROP TABLE')
        ELSE REGEXP_REPLACE(TRIM(LOWER(example)), ' +', ' ', 'g')
    END AS cleaned_example
FROM refined.sql_glossary;

-- c) Practice filtering and searching for different keywords in different columns. 
-- Discuss with a friend why this could be useful in this case.
SELECT
	example, 
	regexp_matches((example), 'SELECT', 'i')
FROM
	refined.sql_glossary;

2. More extensive EDA on the sakila database



-- PROBLEM:
--		how to add all words from sql_word to a list
-- 		check if any of the words in this list appears in the example expressions

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


   