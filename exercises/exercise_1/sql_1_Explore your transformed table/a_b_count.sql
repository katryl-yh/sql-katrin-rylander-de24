----------------------------------------------------------------------------

-- Explore your transformed table, in my case main.kr_cleaned_salaries
--  a) Count number of Data engineers jobs. For simplicity just go for job_title Data Engineer.

----------------------------------------------------------------------------
SELECT * FROM main.cleaned_salaries;

SELECT
	COUNT(*)
FROM
	main.kr_cleaned_salaries
WHERE
	job_title = 'Data Engineer';

-- Number of Data Engineers = 3464

----------------------------------------------------------------------------

--  b) Count number of unique job titles in total.

----------------------------------------------------------------------------
SELECT
	COUNT (DISTINCT job_title)
FROM
	main.kr_cleaned_salaries ;
-- Number of distinct jobs = 155

----------------------------------------------------------------------------

-- c) Find out how many jobs that goes into each salary level.

----------------------------------------------------------------------------
-- if we mean different job titles that get this level of salary
SELECT
	COUNT (DISTINCT job_title)
FROM
	main.kr_cleaned_salaries
WHERE salary_level = 'Low';

-- ans = 82

-- if we mean different people that get this level of salary, 
-- and I want to do it step by step!
SELECT
	COUNT (*)
FROM
	main.kr_cleaned_salaries
WHERE salary_level = 'Low';
-- ans = 764

--------------- another approach from chatGTP

SELECT salary_level, COUNT(*) AS job_count
FROM main.kr_cleaned_salaries
GROUP BY salary_level;

----------------------------------------------------------------------------

-- d) Find out the median and mean salaries for each seniority levels.

----------------------------------------------------------------------------

SELECT 
	ROUND(MEAN(monthly_salary_sek)) AS mean_salary_level,
	ROUND(MEDIAN(monthly_salary_sek)) AS median_salary_level,
	experience_level
FROM main.kr_cleaned_salaries
GROUP BY experience_level ;

----------------------------------------------------------------------------

-- e) Find out the top earning job titles based on their median salaries and how much they earn.

----------------------------------------------------------------------------

SELECT 
	ROUND(MEDIAN(monthly_salary_sek)) AS median_salary_level,
	job_title
FROM main.kr_cleaned_salaries
GROUP BY job_title 
ORDER BY median_salary_level DESC;

----------------------------------------------------------------------------

-- f) How many percentage of the jobs are fully remote, 50 percent remote and fully not remote.

----------------------------------------------------------------------------

-- only for one remote ratio
SELECT ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*)  FROM main.kr_cleaned_salaries)) AS percentage_remote_jobs 
FROM
	main.kr_cleaned_salaries
WHERE 
	remote_ratio = 0 ;

-- for all
SELECT ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*)  FROM main.kr_cleaned_salaries)) AS percentage_remote_jobs , remote_ratio
FROM
	main.kr_cleaned_salaries
GROUP BY remote_ratio ;


----------------------------------------------------------------------------

-- g) Pick out a job title of interest and figure out if company size affects the salary. 
--    Make a simple analysis as a comprehensive one requires causality investigations
--    which are much harder to find.

----------------------------------------------------------------------------
SELECT
	COUNT(*)
FROM
	main.kr_cleaned_salaries
WHERE
	job_title = 'Data Manager';

-- Number of Data Managers = 212 

SELECT ROUND(AVG(monthly_salary_sek)) AS average_monthly_salary , company_size
FROM
	main.kr_cleaned_salaries
WHERE
	job_title = 'Data Manager'
GROUP BY company_size ;




