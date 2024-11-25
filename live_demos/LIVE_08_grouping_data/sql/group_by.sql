-- find 10 most searched foods

SELECT
	food,
	SUM(number_searches) AS total_searches
FROM
	main.cleaned_food
GROUP BY
	food
ORDER BY
	total_searches DESC 
LIMIT 10;

-- total searches by year

-- in this case the executions will be in the following order:
-- FROM, GROUP BY, SELECT, ORDER BY
SELECT -- 3
	year, SUM(number_searches) AS total_searches
FROM -- 1
	main.cleaned_food
GROUP BY -- 2 
	year 
ORDER BY -- 4
	total_searches DESC;

-- I want to filter the data, I need to use HAVING
-- HAVING works on aggregated data!
-- in order of executions HAVING comes after GROUP BY

SELECT -- 4
	year, SUM(number_searches) AS total_searches
FROM -- 1
	main.cleaned_food
GROUP BY -- 2 
	year 
HAVING total_searches > 300000 -- 3
ORDER BY -- 5
	total_searches DESC;

--------------------------------------------------------------------------------
-- we can group by 2 different columns

SELECT 
	year, food, SUM(number_searches) AS total_searches
FROM 
	main.cleaned_food
GROUP BY  
	year,
	food
ORDER BY year DESC;

-- TO DO

-- most popular food in summer -------------------------------------------------------------
SELECT * FROM main.cleaned_food;

SELECT 
	food, SUM(number_searches) AS total_searches
FROM 
	main.cleaned_food
-- WHERE CAST(week AS INTEGER) BETWEEN 24 AND 35 -- with cast
WHERE week BETWEEN '24' AND '35'
GROUP BY food
ORDER BY total_searches DESC;

-- most popular food in winter -------------------------------------------------------------
SELECT 
	food, SUM(number_searches) AS total_searches
FROM 
	main.cleaned_food
WHERE (week BETWEEN '48' AND '52') OR (week BETWEEN '01' AND '09')
GROUP BY food
ORDER BY total_searches DESC;

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

-- TO SELF: most popular food per year!!!
--------------------------------------------------------------------------------

SELECT 
	year, food, SUM(number_searches) AS total_searches
FROM 
	main.cleaned_food
GROUP BY  
	year,
	food
ORDER BY year DESC, total_searches DESC;
--------------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS main.food_popularity AS(
SELECT 
	year, food, SUM(number_searches) AS total_searches
FROM 
	main.cleaned_food
GROUP BY  
	year,
	food
ORDER BY year DESC, total_searches DESC);

SELECT * FROM main.food_popularity;
--------------------------------------------------------------------------------

SELECT year,MAX(total_searches) AS yearly_max
FROM main.food_popularity
GROUP BY year, food
ORDER BY year;


WITH ranked_foods AS (
    SELECT year, food, total_searches,
           ROW_NUMBER() OVER (PARTITION BY year ORDER BY total_searches DESC) AS rank
    FROM main.food_popularity
)
SELECT year, food, total_searches
FROM ranked_foods
WHERE rank = 1
ORDER BY year;

-- TO SELF: 5 most popular food types per year

 