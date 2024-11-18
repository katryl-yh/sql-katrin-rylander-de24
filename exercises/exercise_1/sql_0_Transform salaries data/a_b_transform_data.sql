-------------------------------------------------------------------------------------
--  a) Transform employment_type column based on this table
-------------------------------------------------------------------------------------
-- CT -->	Contract
-- FL -->	Freelance
-- PT -->	Part time
-- FT -->	Full time

-- Transform will be done with CASE WHEN

SELECT * FROM main.cleaned_salaries;

-- first check if it works, before you make the changes persistant
SELECT
	CASE
		WHEN employment_type = 'CT' THEN 'Contract' -- it gives NULL when the condition is not met, we need to continue building case
		WHEN employment_type = 'FL' THEN 'Freelance'
		WHEN employment_type = 'PT' THEN 'Part time'
		WHEN employment_type = 'FT' THEN 'Full time'
		ELSE employment_type -- preserve existing value if no match
	END AS employment_type ,
	* EXCLUDE employment_type -- I take all old columns apart from experience_level
FROM
	main.cleaned_salaries;
-- Q: Have I transformed my data?
-- A: No, to persist changes in the table I need to UPDATE it
SELECT DISTINCT employment_type FROM main.cleaned_salaries;

-- UPDATE statement to persist changes
UPDATE
	main.cleaned_salaries
SET
	employment_type = CASE
		WHEN employment_type = 'CT' THEN 'Contract'
		-- it gives NULL when the condition is not met, we need to continue building case
		WHEN employment_type = 'FL' THEN 'Freelance'
		WHEN employment_type = 'PT' THEN 'Part time'
		WHEN employment_type = 'FT' THEN 'Full time'
		ELSE employment_type
		-- preserve existing value if no match
	END
WHERE
	employment_type IN ('CT', 'FL', 'PT', 'FT');

-------------------------------------------------------------------------------------
--   b) Do similar for company_size, but you have to figure out what the abbreviations could stand for.
-------------------------------------------------------------------------------------
-- S -->	Small
-- M -->	Medium
-- L -->	Large

-- Transform will be done with CASE WHEN

SELECT * FROM main.cleaned_salaries;

-- first check if it works, before you make the changes persistant
SELECT
	CASE
		WHEN company_size = 'S' THEN 'Small' 
		WHEN company_size = 'M' THEN 'Medium'
		WHEN company_size = 'L' THEN 'Large'
		ELSE company_size -- preserve existing value if no match
	END AS company_size ,
	* EXCLUDE company_size -- I take all old columns apart from experience_level
FROM
	main.cleaned_salaries;

-- UPDATE statement to persist changes
UPDATE
	main.cleaned_salaries
SET
	company_size = CASE
		WHEN company_size = 'S' THEN 'Small'
		WHEN company_size = 'M' THEN 'Medium'
		WHEN company_size = 'L' THEN 'Large'
		ELSE company_size
		-- preserve existing value if no match
	END
WHERE
	company_size IN ('S', 'M', 'L');

SELECT DISTINCT company_size FROM main.cleaned_salaries cs ;
