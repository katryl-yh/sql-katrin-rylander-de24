-- EDA - exploratory data analysis

SELECT
	*
FROM
	main.food ;

-- count number of entries in DB, in this case: 135025

SELECT
	COUNT(*)
FROM
	main.food ;

-- show unique ids

SELECT
	DISTINCT id
FROM
	main.food ;

-- count the number of unique ids, in this case: 201

SELECT
	COUNT(DISTINCT id)
FROM
	main.food ;

-- columns: id, googleTopic, week_id, value

DESC main.food;

-- I want to filter from week_id, only searches between 2004-04 and 2004-10

SELECT
	*
FROM
	main.food
WHERE
	week_id BETWEEN '2004-04' AND '2004-10';

-- BUT I may want to see the total amount of searchers per food type during a selected period, this 




