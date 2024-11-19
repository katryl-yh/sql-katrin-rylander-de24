------------------------------------------------------------------------
-- c) Make a salary column with Swedish currency for yearly salary.
------------------------------------------------------------------------

-- the changes below are not persistent!
SELECT
	ROUND(salary_in_usd*11.01) AS yearly_salary_sek,
	ROUND(yearly_salary_sek/12) AS monthly_salary_sek
FROM
	main.cleaned_salaries 
;

-- In order to make persisten changes I need to first add new columns using ALTER TABLE statement
ALTER TABLE main.cleaned_salaries ADD COLUMN yearly_salary_sek INT DEFAULT NULL;

-- Use an UPDATE statement to modify the values in that column by performing the division using the existing column
UPDATE main.cleaned_salaries 
SET yearly_salary_sek = ROUND(salary_in_usd*11.01);

------------------------------------------------------------------------
-- d) Make a salary column with Swedish currency for monthly salary.
------------------------------------------------------------------------

-- In order to make persisten changes I need to first add new columns using ALTER TABLE statement
ALTER TABLE main.cleaned_salaries ADD COLUMN monthly_salary_sek INT DEFAULT NULL;

-- Use an UPDATE statement to modify the values in that column by performing the division using the existing column
UPDATE main.cleaned_salaries 
SET monthly_salary_sek = ROUND(yearly_salary_sek/12);

SELECT * FROM main.cleaned_salaries ; 

------------------------------------------------------------------------
-- e) Make a salary_level column with the following categories: 
------------------------------------------------------------------------

ALTER TABLE main.cleaned_salaries 
ADD COLUMN salary_level STRING DEFAULT ' ';

-- to DROP COLUMN
-- ALTER TABLE main.cleaned_salaries 
-- DROP COLUMN salary_level;

-- Aggregate functions to find descriptive statistics
-- Decide your thresholds for each category. Make it base on the monthly salary in SEK.
SELECT
	MIN(monthly_salary_sek) AS min_salary_sek,
	AVG(monthly_salary_sek) AS mean_salary_sek,
	MEDIAN(monthly_salary_sek) AS median_salary_sek,
	MAX(monthly_salary_sek) AS max_salary_sek,
FROM
	main.cleaned_salaries; 

--   low        --> lower than 50000
--   medium     --> BETWEEN 50000 AND 130000
--   high       --> BETWEEN 130001 AND 250000
--   insanely_high --> higher than 250001

-- run some checking if it works
SELECT
	CASE
		WHEN monthly_salary_sek < 50000 THEN 'Low'
		WHEN monthly_salary_sek BETWEEN 50000 AND 130000 THEN 'Medium'
		WHEN monthly_salary_sek BETWEEN 130001 AND 250000 THEN 'High'
		ELSE 'Insanely high'
	END AS salary_level, monthly_salary_sek 
FROM
	main.cleaned_salaries;

UPDATE main.cleaned_salaries
SET salary_level = CASE
    WHEN monthly_salary_sek < 50000 THEN 'Low'
    WHEN monthly_salary_sek BETWEEN 50000 AND 130000 THEN 'Medium'
	WHEN monthly_salary_sek BETWEEN 130001 AND 250000 THEN 'High'
	ELSE 'Insanely high'
END;

------------------------------------------------------------------------------------------------
-- f) Choose the following columns to include in your table: 
-- experience_level, 
-- employment_type, 
-- job_title, 
-- salary_annual_sek, 
-- salary_monthly_sek, 
-- remote_ratio, 
-- company_size, 
-- salary_level

SELECT
	experience_level,
	employment_type,
	job_title,
	yearly_salary_sek,
	monthly_salary_sek,
	remote_ratio,
	company_size,
	salary_level
FROM
	main.cleaned_salaries;

------------ create a new table -------
CREATE TABLE main.kr_cleaned_salaries  AS
SELECT experience_level,
	employment_type,
	job_title,
	yearly_salary_sek,
	monthly_salary_sek,
	remote_ratio,
	company_size,
	salary_level
FROM main.cleaned_salaries;

-- show all tables in a specific schema (e.g., the main schema)
SELECT *
FROM information_schema.tables;

