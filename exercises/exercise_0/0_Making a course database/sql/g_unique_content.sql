-- alias only exists during the query, otherwise it does not exist
SELECT
	DISTINCT content_type AS unique_content_type
FROM
	main.course_structure;