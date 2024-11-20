-- generate_series is a function commonly used in PostgreSQL to generate a series of numbers from 1 to 100.
-- It returns a set of rows with sequential numbers between the two provided arguments (in this case, 1 and 100).


SELECT generate_series(1,100) as id; -- returned a list from 1 to 100

-- NOTE: in duckdb I need to UNNEST in order to distribute the numbers between rows
SELECT UNNEST (generate_series(1,100)) as id;

------------------------------------------------------------------------------------------------------------------------------

-- Make dice simulation with SELECT RANDOM();
SELECT RANDOM(); -- it generates a random number between 0 and 1

-- This will generate 100 results simulating throwing a dice
SELECT FLOOR( RANDOM()*6 +1) AS dice FROM generate_series(100);

-- if we want to store the data in a table we do CREATE TABLE and store the results in the database
CREATE TABLE IF NOT EXISTS dice_results AS (
SELECT
	FLOOR( RANDOM()* 6 + 1) AS dice
FROM
	generate_series(100));
desc;
------------------------------------------------------------------------------------------------------------------------------
-- string concatenation with 'student_' || id
SELECT
	UNNEST (generate_series(100)) AS id,
	'student_' || id ; 

