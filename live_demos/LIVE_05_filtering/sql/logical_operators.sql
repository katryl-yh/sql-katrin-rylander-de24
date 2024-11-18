-- if I want to filter out the salary between two values I could use
-- in python 20000 < x < 100000
-- in other languages (x > 20000) && (x < 100000)

-- in SQL we have: BETWEEN ... AND operator

-- we can filter the salaries again

SELECT
	*
FROM
	main.data_jobs
WHERE
	salary_in_usd BETWEEN 200000 AND 500000;

-- I want to pick some specific columns
SELECT
	job_title, experience_level , salary_in_usd 
FROM
	main.data_jobs
WHERE
	salary_in_usd BETWEEN 20000 AND 500000 AND job_title = 'Data Engineer' AND experience_level = 'Entry level';
	
-- I want to change US dollars to SEK
-- build up the query step by step and test it out
SELECT
	job_title,
	experience_level ,
	employment_type ,
	ROUND(salary_in_usd*11.01/12) AS salary_sek_month
FROM
	main.data_jobs
WHERE
	salary_in_usd BETWEEN 10000 AND 500000
	AND job_title = 'Data Engineer'
	AND experience_level = 'Entry level'
	-- AND employment_type = 'PT'
ORDER BY salary_sek_month;