-- EDA - exploratory data analysis
-- usually we do EDA to understand the dataset first

-- check the data
SELECT
	*
FROM
	main.food ;

-- count the number ot entries
SELECT
	COUNT(*) AS number_rows
FROM
	main.food ;
-- returns 135025
--------------------------------------------------------------------------

-- check how many unique 'topics' = id there are in the table

SELECT
	COUNT (DISTINCT id) AS unique_foods
FROM
	main.food; 
-- returns 201

-- check what they are

SELECT
	DISTINCT id
FROM
	main.food; 
	

--------------------------------------------------------------------------

-- describe the table
DESC main.food;
-- id, googleTopic are VARCHAR

--------------------------------------------------------------------------
-- return only the entries that were made in between the weeks 4 and 6 of 2004
-- NOTE: there are 581 such entries!

SELECT
	*
FROM
	main.food
WHERE
	week_id BETWEEN '2004-04' AND '2004-06';

--------------------------------------------------------------------------
-- MORE EDA TO UNDERSTAND THE DATA SET
--------------------------------------------------------------------------

SELECT
	*
FROM
	main.food
WHERE
	value = 100
ORDER BY id, week_id ;

