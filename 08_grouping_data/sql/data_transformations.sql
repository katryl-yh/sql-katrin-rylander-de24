SELECT * FROM main.food ;

----------------------------------------------------------
-- we will change id to label food, week_id to week 

SELECT
	id AS food,
	week_id AS week,
	SUBSTRING(week, 1,4) AS year, -- works in SQL in general !!!
	value AS number_searches
FROM
	main.food ;

-- in duckdb there is another way to select a part of a string
SELECT
	id AS food,
	week_id AS week,
	week[:4] AS year -- works in duckdb, slicing, is more pythonic BUT more databases do not have it implemeted this way
FROM
	main.food ;

----------------------------------------------------------
-- when we query we do not make any changes on the actual table
-- we need to use CREATE TABLE if we want to save our version of the table

CREATE TABLE IF NOT EXISTS cleaned_food AS (
SELECT
	id AS food,
	week_id AS week,
	SUBSTRING(week, 1, 4) AS year,
	-- works in SQL in general !!!
	value AS number_searches
FROM
	main.food 
	) ;
	
SELECT * FROM main.cleaned_food;