DESC;

SELECT * FROM main.plant_care pc ;

SELECT * FROM main.plants pc ;

-- LEFT JOIN 
-- gets all from the left table, with or without match in the right table
-- without match -> NULLs
SELECT
	p.plant_id,
	p.plant_name,
	p.type,
	pc.water_schedule,
	pc,sunlight
FROM
	main.plants p
LEFT JOIN main.plant_care pc 
ON
	pc.plant_id = p.plant_id ;

-- RIGHT JOIN 

SELECT
	p.plant_id,
	p.plant_name,
	p.type,
	pc.water_schedule,
	pc,sunlight
FROM
	main.plants p
RIGHT JOIN main.plant_care pc 
ON
	pc.plant_id = p.plant_id ;

-- RIGHT JOIN 
-- gets same values on the join condition, it is a form of intersection, values: plant_id must be present in both tables
SELECT
	p.plant_id,
	p.plant_name,
	p.type,
	pc.water_schedule,
	pc,sunlight
FROM
	main.plants p
INNER JOIN main.plant_care pc  -- it is possible to write just JOIN
ON
	pc.plant_id = p.plant_id ;

-- FULL JOIN
-- gets everything from both tables, NULLs where there is no match
SELECT
	p.plant_id,
	p.plant_name,
	p.type,
	pc.water_schedule,
	pc,sunlight
FROM
	main.plants p
FULL JOIN main.plant_care pc  -- it is possible to write just JOIN
ON
	pc.plant_id = p.plant_id ;
	