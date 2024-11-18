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
--   low        --> lower than
--   medium     --> BETWEEN ... AND 
--   high       --> BETWEEN ... AND 
--   insanely_high --> higher than 
-- Decide your thresholds for each category. Make it base on the monthly salary in SEK.