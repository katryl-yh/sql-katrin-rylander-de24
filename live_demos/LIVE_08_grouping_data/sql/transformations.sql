-- we start as always, with showing data

SELECT
	*
FROM
	main.food;
	
-- I want to transform data and save it into another table:
-- id --> food
-- remove googleTopic
-- year column
-- week_id --> week
-- value --> number_of_searches

SELECT
	id as food,
	SUBSTRING(week_id, 1, 4) AS year, -- week_id[:4] , it works like slicing in python
	SUBSTRING(week_id, 6, 7) AS week, -- or in a duckdb specific way week_id[6:]
	value AS number_searches	
FROM
	main.food;  
-- run and check that it works, but this is not persistant --> not saved!

-- now we will make a new table
CREATE TABLE IF NOT EXISTS main.cleaned_food AS(
SELECT
	id as food,
	SUBSTRING(week_id, 1, 4) AS year, -- week_id[:4] , it works like slicing in python
	SUBSTRING(week_id, 6, 7) AS week, -- or in a duckdb specific way week_id[6:]
	value AS number_searches	
FROM
	main.food);

DESC;



