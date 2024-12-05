-- a) Retrieve a list of all customers and actors which last name starts with G.

SELECT
	c.first_name,
	c.last_name,
	'customer' AS type
FROM
	main.customer c
WHERE
	c.last_name LIKE 'G%'
UNION ALL 
SELECT
	a.first_name,
	a.last_name,
	'actor' AS type
FROM
	main.actor a
WHERE
	a.last_name LIKE 'G%'
ORDER BY
	last_name ;

-- b) How many customers and actors starts have the the letters 'ann' in there first names?

SELECT
	COUNT(c.first_name),
	'customer' AS type
FROM
	main.customer c
WHERE
	c.first_name LIKE '%ANN%'
UNION ALL 
SELECT
	COUNT(a.first_name),
	'actor' AS type
FROM
	main.actor a
WHERE
	a.first_name LIKE '%ANN%'
;
-------------------------------------------------------
-------------------------------------------------------
-- Combine COUNT and UNION ALL ------------------------
-------------------------------------------------------
SELECT 'customer' AS type, COUNT(c.first_name) AS total_count
FROM main.customer c
WHERE
	c.first_name LIKE '%ANN%'
UNION ALL
SELECT 'actor' AS type, COUNT(a.first_name) AS total_count
FROM
	main.actor a
WHERE
	a.first_name LIKE '%ANN%'
UNION ALL
SELECT 'total' AS type, 
		(SELECT COUNT(c.first_name) FROM main.customer c WHERE 	c.first_name LIKE '%ANN%') +
		(SELECT COUNT(a.first_name) FROM main.actor a WHERE a.first_name LIKE '%ANN%')AS total_count
;


-- c) In which cities and countries do the customers live in?

SELECT
	c.country,
	a.city 
FROM
	main.city a
JOIN main.country c ON
	c.country_id = a.country_id 
;

-- version 2


SELECT
	c.country,
	STRING_AGG(CAST(a.city AS TEXT), ', ') AS city_list,
	COUNT(a.city) AS city_count
FROM
	main.city a
JOIN main.country c ON
	c.country_id = a.country_id 
GROUP BY c.country
ORDER BY city_count DESC
;

-- from Andreas
DESC main.customer_list;

SELECT
	name,
	city,
	country
FROM
	main.customer_list cl ;


-- d) In which cities and countries do the customers with initials JD live in?
DESC main.customer_list;

SELECT
	name,
	city,
	country
FROM
	main.customer_list cl 
WHERE name LIKE 'J% D%';

-- from Andreas
SELECT
	c.first_name,
	c.last_name,
	ct.city,
	cty.country	
FROM
	main.customer c
INNER JOIN 
	main.address a ON c.address_id = a.address_id 
INNER JOIN 
	main.city ct ON a.city_id = ct.city_id 
INNER JOIN 
	main.country cty ON ct.country_id = cty.country_id
WHERE c.first_name LIKE 'J%' AND c.last_name LIKE 'D%';

-- e) Retrieve a list of all customers and what films they have rented.
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

-- version 2

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

-- f) What else cool information can you find out with this database using what you know about SQL.