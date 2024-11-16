-- a) Select all the exercises in this course WHY none?
SELECT
	*
FROM
	main.course_structure
WHERE 
	content_type = 'exercise';