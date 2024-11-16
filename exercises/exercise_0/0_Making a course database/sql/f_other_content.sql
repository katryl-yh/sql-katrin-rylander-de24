 -- f) How many other content are there?
 -- The use of != or NOT allows you to exclude rows that match a specific condition.
SELECT
	COUNT(*) 
FROM
	main.course_structure
WHERE NOT
	content_type = 'lecture';
	
-- ANOTHER WAY

SELECT
	COUNT(*) 
FROM
	main.course_structure
WHERE
	content_type != 'lecture';