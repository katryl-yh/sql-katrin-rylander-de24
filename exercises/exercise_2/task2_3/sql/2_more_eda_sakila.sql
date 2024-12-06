-- a) Describe all tables.

DESC;

-- Describe specific table:
DESC main.actor;
DESC main.city;

-- b) Select all data on all tables.
SELECT * FROM main.actor a ;
SELECT * FROM main.address a ;
SELECT * FROM main.store s ;
SELECT
	category,
	ROUND(total_sales, 1)
FROM
	main.sales_by_film_category sbfc ;

SELECT * FROM main.customer_list cl ;
SELECT * FROM main.payment p ;

-- c) Find out how many rows there are in each table.

SELECT COUNT(*) FROM main.actor a ; -- 200
SELECT COUNT(*) FROM main.address a ; -- 603
SELECT COUNT(*) FROM main.store s ; -- 2
SELECT COUNT(*) FROM main.sales_by_film_category sbfc ; -- 16
SELECT COUNT(*) FROM main.customer_list cl ; -- 599
SELECT COUNT(*) FROM main.payment p ; -- 16049

-- The questions here might come from a business stakeholder which is not familiar with the table structure. 
-- It's your job to find out which table(s) to look at.

 -- d) Calculate descriptive statistics on film length.
SUMMARIZE main.film ;

SUMMARIZE SELECT length FROM main.film ;

CREATE TABLE len_summary AS (
SUMMARIZE SELECT length FROM main.film) ;

-- returns info:
COPY (
SELECT
	COUNT(length) AS count,
    AVG(length) AS mean,
    MIN(length) AS minimum,
    MAX(length) AS maximum,
    ROUND(STDDEV(length),1) AS standard_deviation,
    percentile_cont(0.25) WITHIN GROUP (ORDER BY length) AS percentile_25,
    percentile_cont(0.50) WITHIN GROUP (ORDER BY length) AS percentile_50,
    percentile_cont(0.75) WITHIN GROUP (ORDER BY length) AS percentile_75
FROM
	main.film) 
TO '/Users/Katrin/Documents/github/sql-katrin-rylander-de24/exercises/exercise_2/task1/sql/output_file.txt' WITH (FORMAT csv, DELIMITER ',',HEADER);

-- Statistics step by step

SELECT
    COUNT(length) AS count,
    AVG(length) AS mean,
    MIN(length) AS minimum,
    MAX(length) AS maximum,
    ROUND(STDDEV(length),1) AS standard_deviation,
    percentile_cont(0.25) WITHIN GROUP (ORDER BY length) AS percentile_25,
    percentile_cont(0.50) WITHIN GROUP (ORDER BY length) AS percentile_50,
    percentile_cont(0.75) WITHIN GROUP (ORDER BY length) AS percentile_75
FROM
    main.film;
SELECT title, length FROM main.film f ;

-- e) What are the peak rental times? NOTE: was tricky for me!!!
DESC rental;
SELECT * FROM main.rental ;

SELECT
	strftime('%H', rental_date) AS time,
	count(rental_date) AS total
FROM
	main.rental r
GROUP BY time
ORDER BY total DESC;

-- f) What is the distribution of film ratings?

SELECT
	rating,
	COUNT(title) AS total
FROM
	main.film
GROUP BY rating
ORDER BY total DESC;

-- From Adreas, same result
SELECT
	rating,
	COUNT(*) AS total
FROM
	main.film f 
GROUP BY rating
ORDER BY total DESC;

-- g) Who are the top 10 customers by number of rentals?

SELECT c.first_name, c.last_name, r.customer_id ,
	   COUNT(r.customer_id) AS number_rentals
FROM main.rental r
LEFT JOIN main.customer c 
ON
	r.customer_id = c.customer_id 
GROUP BY r.customer_id, c.first_name, c.last_name 
ORDER BY number_rentals DESC
LIMIT 10;

-- from Andreas
SELECT
	c.first_name,
	c.last_name,
	c.customer_id,
	count(r.customer_id) AS number_rentals,
FROM
	main.customer c
INNER JOIN 
	main.rental r ON c.customer_id = r.customer_id
GROUP BY  c.customer_id ,c.first_name , c.last_name
ORDER BY number_rentals DESC
LIMIT 10;

--  h) Retrieve a list of all customers and what films they have rented.

SELECT
	c.first_name,
	c.last_name,
	f.title
FROM
	main.rental r
LEFT JOIN main.customer c 
ON
	r.customer_id = c.customer_id
LEFT JOIN main.inventory i 
ON
	i.inventory_id = r.inventory_id
LEFT JOIN main.film f 
ON
	i.film_id = f.film_id
ORDER BY
	r.customer_id
LIMIT 100;

----------------- from Andreas
SELECT * FROM main.rental r ;
SELECT * FROM main.rental r ;
SELECT * FROM main.film f;

SELECT
	c.first_name,
	c.last_name,
	f.title
FROM
	main.customer c
INNER JOIN 
	main.rental r ON c.customer_id = r.customer_id
INNER JOIN 
	main.inventory i ON r.inventory_id = i.inventory_id
INNER JOIN
	main.film f ON i.film_id = f.film_id 
ORDER BY c.first_name, c.last_name ;

-- i) Make a more extensive EDA of your choice on the Sakila database.
-- same as above but the film_ids are put into a list!

SELECT c.first_name, c.last_name,  COUNT(r.customer_id) AS number_rentals,
	   STRING_AGG(CAST(i.film_id AS TEXT), ', ') AS film_id_list
FROM main.rental r
LEFT JOIN main.customer c 
ON
	r.customer_id = c.customer_id 
LEFT JOIN main.inventory i 
ON
	i.inventory_id = r.inventory_id 
LEFT JOIN main.film f 
ON
	i.film_id = f.film_id 
GROUP BY r.customer_id, c.first_name, c.last_name 
ORDER BY number_rentals DESC
LIMIT 100;
