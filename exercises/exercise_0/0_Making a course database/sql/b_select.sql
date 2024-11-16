-- b) Select all the lectures in this course
SELECT
	*
FROM
	main.course_structure
WHERE
	content_type = 'lecture';