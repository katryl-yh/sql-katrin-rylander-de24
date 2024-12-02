-- put together actors and customers
-- ONLY possible when we have the same number of columns and same data types in columns
-- start with checking the data:
SELECT * FROM main.customer c ;

SELECT * FROM main.actor a ;

-- selects all customers and all actors which first names starts with A  
-- we also add a type column
SELECT
	'Customer' AS type,
	c.first_name,
	c.last_name
FROM
	main.customer c
WHERE
	c.first_name LIKE 'A%'
UNION ALL
SELECT
	'Actor' AS type,
	a.first_name,
	a.last_name
FROM
	main.actor a 
WHERE
	a.first_name LIKE 'A%';

-- we are now doing INTERSECT
-- this will find all overlapping names between actors and customers
SELECT
	c.first_name,
	c.last_name
FROM
	main.customer c
INTERSECT 
SELECT
	a.first_name,
	a.last_name
FROM
	main.actor a ;

-- finds all with intials JD and record its type (actor, customer)
SELECT
	'customer' AS type,
	c.first_name,
	c.last_name
FROM
	main.customer AS c
WHERE c.first_name LIKE 'J%' AND c.last_name LIKE 'D%';

SELECT
	'actor' AS type,
	a.first_name,
	a.last_name
FROM
	main.actor AS a
WHERE a.first_name LIKE 'J%' AND a.last_name LIKE 'D%' ;

-- now we combine them with UNION
SELECT
	'customer' AS type,
	c.first_name,
	c.last_name
FROM
	main.customer AS c
WHERE c.first_name LIKE 'J%' AND c.last_name LIKE 'D%'
UNION
SELECT
	'actor' AS type,
	a.first_name,
	a.last_name
FROM
	main.actor AS a
WHERE a.first_name LIKE 'J%' AND a.last_name LIKE 'D%' ;

-- what if we du union but without type, we will get only 4 rows, because Jennifer Davis customer and actor became one record!!!

SELECT
	c.first_name,
	c.last_name
FROM
	main.customer AS c
WHERE c.first_name LIKE 'J%' AND c.last_name LIKE 'D%'
UNION
SELECT
	a.first_name,
	a.last_name
FROM
	main.actor AS a
WHERE a.first_name LIKE 'J%' AND a.last_name LIKE 'D%' ;
