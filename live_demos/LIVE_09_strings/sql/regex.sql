SELECT * FROM staging.sql_glossary;

-- ' +' matches 1 or more spaces
SELECT
	description,
	REGEXP_REPLACE (TRIM(description), ' +', ' ', 'g') AS cleaned_description
FROM
	staging.sql_glossary;

-- filtering rows with LIKE operator
-- % matches 0 or more characters  
SELECT
	*
FROM
	staging.sql_glossary
WHERE
	LOWER(description) LIKE '%select%';
