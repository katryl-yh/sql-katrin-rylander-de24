--------------------------------------------------------------------------
-- Exercise 7:
-- Generate report to show:
-- 		the yearly gross profit for each company, 
-- 		the gross profit of the previous year, 
-- 		the difference between both years! 
-- Use the previous query as a starting point!

CREATE TABLE IF NOT EXISTS main.comany_gross_profit AS (
SELECT
	company,
	production_year,
	SUM(revenue - production_cost) AS gross_profit_year
FROM 
	main.games
GROUP BY
	company,
	production_year
ORDER BY 
	company,
	production_year) ;

-- OBS: CTEs, or common table expressions, are an advanced feature of SQL!

-------------------------------------------------------------------------- ASK!!!
-- Exercise 10:
-- Return a list of companies AND types of games where the company is a market leader. 
-- A market leader for a game type is a company that:
--		has a total revenue for that type of game that exceeds the total revenue of all other companies for that type of game!

-- Show the:
-- 		company name
-- 		the type of game
-- 		that company’s total revenue for that type of game
SELECT * FROM main.games;

SELECT
	company,
	type,
	SUM(revenue) AS total_revenue
FROM
	main.games g1 
GROUP BY
	company, type
HAVING SUM(revenue) > ( SELECT SUM(revenue)
                        FROM main.games g2
                        WHERE g2.type = g1.type
                        AND g2.company != g1.company );

-- The most interesting point is the use of a subquery in the HAVING clause. 
-- We want companies with a sum of revenue greater than the total revenue of the rest of the companies; 
-- we use a subquery to obtain the total revenue of the other companies:

-- The subquery references the g1.company and g1.type columns;
-- these are the columns company and type in the outer query. 
-- These references in the subquery allows us to obtain the total revenue for the rest of the companies for the same type of game.