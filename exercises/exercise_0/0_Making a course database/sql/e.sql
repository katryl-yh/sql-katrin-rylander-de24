--e) How many lectures are in the table? NEED TO FIX IT!
SELECT
	COUNT( DISTINCT content_type = 'lecture' )AS unique_content_type
FROM
	main.course_structure;