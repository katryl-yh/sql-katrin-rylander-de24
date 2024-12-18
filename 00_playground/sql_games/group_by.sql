-- Based on website:  https://learnsql.com/blog/group-by-exercises/
-- a simple query that uses GROUP BY to calculate the number of games produced by each company
-- this query tells the database to create groups of rows from the table games that have the same value in the company column

SELECT
	company,
	COUNT(*)
FROM
	main.games
GROUP BY
	company;

--------------------------------------------------------------------------
-- Exercise 1: 
-- Obtain the name and total revenue for each company.
SELECT * FROM main.games;

SELECT -- 3
	company,
	SUM(revenue) -- the function SUM(revenue) is executed for each group of rows
FROM -- 1
	main.games
GROUP BY -- 2, it creates groups of rows with the same value in the company column
	company;

--------------------------------------------------------------------------
-- Exercise 2:
-- Generate a report with:
-- 		the production year 
-- 		the number of games released this year --> count
-- 		the average of production cost for all games produced in this year --> avg_cost 
-- 		the average revenue for that year --> avg_revenue

SELECT
	production_year,
	COUNT(*) AS count,
	AVG(production_cost) AS avg_cost,
	AVG(revenue) AS avg_revenue
FROM
	main.games
GROUP BY
	production_year;

--------------------------------------------------------------------------
-- Exercise 3:
-- Count how many games of a given type are profitable (i.e. the revenue was greater than the production cost). 
-- Show:
-- 		the game type 
-- 		the number of profitable games --> number_of_games

SELECT -- 4
	type,
	COUNT(*) AS number_of_games
FROM -- 1
	main.games
WHERE -- 2
	revenue > production_cost
GROUP BY -- 3
	type;
	
--------------------------------------------------------------------------
-- Exercise 4:
-- Obtain:
-- 		the type of games 
--		the total revenue generated for games 
-- with a production_year after 2010 AND with a PS2 or PS3 system. 
-- ORDER the result so the types with the highest revenue come first

SELECT -- 4 
	type,
	SUM(revenue) AS total_revenue
FROM -- 1
	main.games
WHERE -- 2
	production_year > 2010	AND system IN ('PS2', 'PS3')
GROUP BY -- 3
	type;

-- Explanation:
-- We first filter the rows; this time, the conditions are production_year > 2010 and system IN (‘PS2’, ‘PS3’). 
-- Once we filtered the rows, we create groups of rows using the GROUP BY type clause.
-- Finally, we apply the function SUM(revenue) to each group of rows to obtain the total revenue in this group.

--------------------------------------------------------------------------
-- Exercise 5:
-- For all companies present in the table, obtain:
-- 		their names
--		the sum of gross profit over all years.
-- Assume that gross profit = revenue - cost of production. Name this column gross_profit_sum. 
-- ORDER the results by gross profit, in DESC order.

SELECT -- 3
	company,
	SUM(revenue - production_cost) AS gross_profit_sum
FROM -- 1
	main.games
GROUP BY -- 2
	company
ORDER BY -- 4
	gross_profit_sum DESC;

--------------------------------------------------------------------------
-- Exercise 6:
-- Obtain the yearly gross profit of each company. 
-- Show a report with:
-- 		the company name, 
--		the year, 
--		the gross profit for that year.
-- ORDER the report by company name and year.

SELECT -- 3
	company,
	production_year,
	SUM(revenue - production_cost) AS gross_profit_year
FROM -- 1
	main.games
GROUP BY -- 2
	company,
	production_year
ORDER BY -- 4
	company,
	production_year;

-- Explanation:
-- We need to use the GROUP BY company, production_year clause. 
-- This creates a group of rows for each pair of company and production_year values. 
-- For each group, we then calculate the expression SUM(revenue - production_cost) = gross profit

--------------------------------------------------------------------------
-- Exercise 8:
-- For each company, select:
-- 		name, 
-- 		the number of games it’s produced --> number_of_games column
-- 		the average cost of production --> avg_cost column
-- Show only companies producing more than one game.

SELECT
	company,
	COUNT(*) AS number_of_games,
	AVG(production_cost) AS avg_cost
FROM
	main.games
GROUP BY
	company
HAVING
	number_of_games > 1;
	
--------------------------------------------------------------------------
-- Exercise 9:
-- We are interested in good games produced between 2000 and 2009. 
-- A good game has profit > 0 AND rating > 6. 
-- For each company:
-- 		show the company name, 
-- 		its total revenue from good games produced between 2000 and 2009 --> revenue_sum
-- 		the number of good games it produced in this period --> number_of_games
-- HAVING: Only show companies with good-game revenue over 3 000 000. (NOTE: 4000000 in origina Q but returns 0 records!)

SELECT
	company,
	COUNT(title) AS number_of_games,
	SUM(revenue) AS revenue_sum
FROM
	main.games
WHERE
	(production_year BETWEEN 2000 AND 2009)
	AND rating > 6
	AND (revenue - production_cost > 0)
GROUP BY
	company
	HAVING revenue_sum > 3000000;

-- Explanation:

-- use GROUP BY company because the metrics we want to obtain (number_of_games and revenue_sum) are at the company level.
-- Some filters are at row level and must be in the WHERE clause, example:
-- production_year BETWEEN 2000 AND 2009
-- rating > 6
-- revenue - production_cost > 0
-- However there is another filter at the group level, which must be put in the HAVING column:
-- SUM(revenue) > 4000000
	

