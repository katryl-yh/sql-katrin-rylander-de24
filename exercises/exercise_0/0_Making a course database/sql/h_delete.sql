-- h) Delete the row with content 02_setup_duckdb .
DELETE
FROM
	main.course_structure 
WHERE
	content = '02_setup_duckdb';

-- now it has been deleted
SELECT
	*
FROM
	main.course_structure;

-- and add it again

INSERT
	INTO
	main.course_structure (content,
	week,
	content_type)
VALUES
('02_setup_duckdb', 46 , 'lecture')

-- now it has been added
SELECT
	*
FROM
	main.course_structure;
