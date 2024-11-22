-----------------------------------------------
-- 1. Exploring hemnet data
-----------------------------------------------

-- a) Ingest data - done in VS studio

-----------------------------

-- b) Make a wildcard selection to checkout the data

SELECT
	*
FROM
	main.hemnet_data ;
	
-- testing percentage_difference

SELECT
	address,
	asked_price,
	final_price,
	ROUND(asked_price * (1 + pourcentage_difference/100)) AS final_pice_check
FROM
	main.hemnet_data;
-----------------------------

--  c) Find out how many rows there are in the table

SELECT
	COUNT(*) AS total_rows
FROM
	main.hemnet_data;
-----------------------------
	
 -- d) Describe the table that you have ingested to see the columns and data types.
 DESCRIBE main.hemnet_data ;
-----------------------------


-- e) Find out the 5 most expensive homes sold.

SELECT
	address,
	commune,
	final_price
FROM
	main.hemnet_data
ORDER BY
	final_price DESC
LIMIT 5; -- it is always good to check if the data is reasonable, if there are no errors in data
-----------------------------

--   f) Find out the 5 cheapest homes sold.

SELECT
	address,
	commune,
	area,
	rooms,
	final_price 
FROM
	main.hemnet_data
ORDER BY final_price
LIMIT 5; -- it is always good to check if the data is reasonable, if there are no errors in data

-- explore number of rooms

SELECT
	rooms,
	final_price
FROM
	main.hemnet_data
WHERE
	rooms <= 3;
-----------------------------

--  g) Find out statistics on minimum, mean, median and maximum prices of homes sold.

SELECT
	MIN(final_price) AS min_final_price,
	AVG(final_price) AS mean_final_price,
	MEDIAN(final_price) AS median_final_price,
	MAX(final_price) AS max_final_price,
FROM
	main.hemnet_data;
-----------------------------

-- j) How many percentage of homes cost more than 10 million?
-- (delen / hela) * 100
-- vi antar att 1 rad -> 1 hem

-- lösning med subquery
SELECT
	COUNT(*) / ( SELECT COUNT(*) FROM main.hemnet_data) * 100.0 AS percentage_over_10
FROM
	main.hemnet_data
WHERE 
	final_price > 10000000 ;
 
