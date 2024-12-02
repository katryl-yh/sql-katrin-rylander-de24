SELECT * FROM main.film ;
SELECT * FROM main.film_actor  ;
SELECT * FROM main.actor  ;

-- which actor played in which film_id?

SELECT
	a.first_name,
	a.last_name,
	fa.film_id 
FROM
	main.actor a 
LEFT JOIN main.film_actor fa ON a.actor_id = fa.actor_id ;

-- which actor played in which film title?
-- NOTE: here we join 3 tables
SELECT
	a.first_name,
	a.last_name,
	f.title 
FROM
	main.actor a 
LEFT JOIN main.film_actor fa ON a.actor_id = fa.actor_id 
LEFT JOIN main.film f ON f.film_id = fa.film_id 
ORDER BY f.title;

-- add info about film and category
-- NOTE: JOIN is basically INNER JOIN!!!
SELECT
	*
FROM
	main.film_category fc
JOIN main.film f ON
	f.film_id = fc.film_id
JOIN main.category c ON
	fc.category_id = c.category_id ;

-- if doing LEFT JOIN get all films including those without a category -> the category becomes NULL
-- INNER JOIN - get all films with associated category
SELECT
	f.title,
	c.name AS genre
FROM
	main.film_category fc
INNER JOIN main.film f ON
	f.film_id = fc.film_id
INNER JOIN main.category c ON
	fc.category_id = c.category_id ;

-- NOTE that the order of join doesn't matter 
SELECT
	f.title,
	c.name AS genre
FROM
	main.film_category fc
INNER JOIN main.category c ON
	fc.category_id = c.category_id 
INNER JOIN main.film f ON
	f.film_id = fc.film_id;
------

SELECT
	COUNT(*)
FROM
	main.film f
INNER JOIN main.category c ON category_id ; -- check if this is a shorter version

