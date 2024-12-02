-- eda: exploratory data analysis

DESC;

SELECT * FROM main.film ;

DESC TABLE main.film; 

SELECT
	COUNT(*) AS number_movies,
	COUNT(DISTINCT title) AS unique_titles
FROM
	main.film ; 
	
SELECT DISTINCT rating FROM main.film;


-- HOW the data is structured: film_actor: actor_id and film_id
-- we could join tables to get more information
SELECT * FROM main.film_actor ;

-- actor: actor_id

SELECT * FROM main.actor ;

SELECT * FROM main.film_category ;

SELECT * FROM main.category ;

SELECT * FROM main.customer;
---------------------------------
SELECT
	COUNT(*) AS number_customers
FROM
	main.customer
GROUP BY
	store_id
ORDER BY
	store_id ASC ; 
	
SELECT * FROM main.store;

SELECT * FROM main.staff ;

-- more EDA left for us