DESC;

-- top paying coustomers using HAVING
SELECT
	customer_id,
	SUM(amount) AS total_payment
FROM
	main.payment p
GROUP BY
	customer_id
HAVING total_payment > 150
ORDER BY total_payment DESC;

------ using CTE

WITH customer_payment AS (
SELECT
	customer_id,
	SUM(amount) AS total_payment
FROM
	main.payment p
GROUP BY
	customer_id
)
SELECT
	*
FROM
	customer_payment
WHERE total_payment > 150
ORDER BY total_payment DESC ;

-- include name on customer -> join the customer table

WITH customer_payment AS (
SELECT
	customer_id,
	SUM(amount) AS total_payment
FROM
	main.payment p
GROUP BY
	customer_id
HAVING
	total_payment > 150
)
SELECT
	c.customer_id,
	c.first_name,
	c.last_name,
	total_payment
FROM
	customer_payment cp
LEFT JOIN main.customer c 
ON
	c.customer_id = cp.customer_id
ORDER BY cp.total_payment DESC, c.last_name ASC
;

----- list all films and their category 
-- place join inside of CTE block
DESC;

WITH film_category AS (
SELECT
	f.film_id,
	f.title AS film_title,
	c.name AS genre
FROM
	main.film f 
INNER JOIN main.film_category fc 
ON f.film_id = fc.film_id
INNER JOIN main.category c 
ON fc.category_id = c.category_id
)
SELECT
	*
FROM
	film_category
ORDER BY genre, film_title;
