-- alias only exists during the query, otherwise it does not exist
SELECT
	DISTINCT content_type AS unique_content_type
FROM
	main.course_structure;

-- b) Select all the lectures in this course
SELECT
	*
FROM
	main.course_structure
WHERE
	content_type = 'lecture';