-- ingen hostar databasen, det är en fil som vi konnektar till
DESC; -- shows us views
-- under sakilla we see by default 3 schemas: 
--    information_schema, 
--    main (stores tables and views, when we create them without specifying the name, it will by default end up in main)
--    pg_catalog (stores for example sequences)

-- NOTE: in sakilla all tables are stored as views - virtual tables, it does not save a data, it saves an sql statement, 
-- you get the data back when you run the query; but in principle it does work as a table!!!

-- advandate of using IDE for SQL - you see graphical representation of data!!!

-- SELECT * is a wildcard selection/ select star / select all 
-- returns a result set of all columns and their respective rows from the table/view: main.payment
-- main is the schemat and payment is the view
-- when using main.payment we mean schema.table_name OR schema.view_name -> namespacing

SELECT * FROM main.payment;

-----------------------------------------
-- it will work equally well without specifying the schema because duckDB is going to look into main schemat by default
-- BUT if we had our table/view in the staging schemat it would NOT work
SELECT * FROM payment;

-----------------------------------------
-- namespacing is a good practise, because it makes it clear where does the table come from

-- LIMIT limits the number of returned rows
SELECT
	*
FROM
	sakila.main.payment  -- it is a fully qualified name, which is useful when one works with data warehouses
LIMIT 10;

-----------------------------------------
-- chooses which columns to return
SELECT
	customer_id,
	amount
FROM
	main.payment p 

-----------------------------------------
-- EXCLUDE allows us to exclude specific columns
-- in many other dialects one should name explicitly the columns we want to see, in duckDB one can use EXCLUDE!
SELECT
	* EXCLUDE (customer_id,	amount)
FROM
	main.payment p ;

----------------------------------------- AGRREGATION FUNCTIONS
-- -> in maths we talk anout mapping types: one to one, many to one, one to many
-- in this case we are going to do many to one mapping!
-- WHY? because we have many inputs/rows with data that we are going to aggregate into single output value
-- aggregation function examples: SUM(), COUNT(), MIN(), MAX(), AVG(), MEDIAN()

SELECT 
	COUNT(*) AS number_payments,
	MIN(amount) AS min_amount,
	MAX(amount) AS max_amount,
	ROUND(AVG(amount),2) AS average_amount,
	MEDIAN(amount) AS median_amount
FROM main.payment;

-- filter data
SELECT * FROM main.payment p 
WHERE amount > 4.2 -- it is ok to hard code at tenta, we do not need subquery! another way is with CTE
ORDER BY amount;

-----------------------------------------
-- make a new column with amount classifications
-- NOTE: we have not made a new table OR a view, we have not updated a view or table
-- if we use now SELECT * we will not see those changes

SELECT
	*,
	CASE 
		WHEN amount < 3.5 THEN 'low cost'
		WHEN amount < 7.1 THEN 'medium cost'
		ELSE 'high cost'
	END AS cost_level
FROM main.payment ;

-- if we want to make a view:

CREATE VIEW IF NOT EXISTS main.payment_level AS (
SELECT
	*,
	CASE 
		WHEN amount < 3.5 THEN 'low cost'
		WHEN amount < 7.1 THEN 'medium cost'
		ELSE 'high cost'
	END AS cost_level
FROM
	main.payment) ;
-- a.b where . is a decimal
-- 7,333 represent thousand
SELECT
	cost_level,
	COUNT(amount) AS number_per_level,
	ROUND(AVG(amount),2) AS mean_amount
FROM
	main.payment_level
GROUP BY cost_level;

-- filter, group, aggregation, we used select


