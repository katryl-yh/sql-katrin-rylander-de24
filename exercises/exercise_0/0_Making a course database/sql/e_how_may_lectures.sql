--e) How many lectures are in the table? 
-- COUNT(*) counts all rows that match the condition.
SELECT
	COUNT(*) 
FROM
	main.course_structure
WHERE
	content_type = 'lecture';