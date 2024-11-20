SELECT 42 AS meaning_of_life;

-- we can use VALUES clause to create columns
-- NOTE:
-- The VALUES clause is used to specify a fixed number of rows. 
-- The VALUES clause can be used as a stand-alone statement,
-- as part of the FROM clause, or as input to an INSERT INTO statement.
VALUES (1), (2), (3);

-- one can combine select with the VALUES clause
CREATE TABLE IF NOT EXISTS people_records AS (
SELECT
	*
FROM
	(
VALUES
	( 1, 'Johan'),
	( 2, 'Johanna'),
	( 3, 'Gustav')) AS people(id, name) 
	);

desc;