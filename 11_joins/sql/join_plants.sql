SELECT
	*
FROM
	main.plants;
	
SELECT
	*
FROM
	main.plant_care ;

-----------   we want to join on the plant_id
-- good practise is to specify which columns you want to avoid confusion

-- LEFT JOIN:
-- it returns all records from the left table (the one mentioned first), 
-- and the matching records from the right table (the second one). 
-- If there is no match in the right table, the result will contain NULL values for the right table's columns.
SELECT
	p.plant_id,
	p.plant_name,
	p.type,
	pc.water_schedule,
	pc.sunlight 
FROM
	main.plants p
LEFT JOIN main.plant_care pc 
ON
	p.plant_id = pc.plant_id ;
	
-- RIGHT JOIN:
-- it returns all records from the right table , 
-- and the matching records from the left table. 
-- If there is no match in the left table, the result will contain NULL values for the left table's columns.
SELECT
	p.plant_id,
	p.plant_name,
	p.type,
	pc.water_schedule,
	pc.sunlight 
FROM
	main.plants p
RIGHT JOIN main.plant_care pc 
ON
	p.plant_id = pc.plant_id ;
	
-- INNER JOIN:
-- it returns only records from the right table , 
-- that have the matching records from the left table. 
-- If there is no match in the left table, the row will be excluded.
SELECT
	p.plant_id,
	p.plant_name,
	p.type,
	pc.water_schedule,
	pc.sunlight 
FROM
	main.plants p
INNER JOIN main.plant_care pc 
ON
	p.plant_id = pc.plant_id ;
	
-- FULL JOIN:
-- retrieves all rows from both tables, including matches. 
-- If no match exists, NULL values are included for missing columns from either table.
SELECT
	p.plant_id,
	p.plant_name,
	p.type,
	pc.water_schedule,
	pc.sunlight 
FROM
	main.plants p
FULL JOIN main.plant_care pc 
ON
	p.plant_id = pc.plant_id ;