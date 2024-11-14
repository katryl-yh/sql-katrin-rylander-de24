-- alias only exists during the query, otherwise it does not exist
SELECT
	DISTINCT content_type AS unique_content_type
FROM
	main.course_structure;

-- a) Select all the exercises in this course WHY none?
SELECT
	*
FROM
	main.course_structure
WHERE 
	content_type = 'exercise ';