SELECT
	*
FROM
	main.data_jobs dj;
	
SELECT
	COUNT(*) AS jobs_lower_than_50k
FROM
	main.data_jobs
WHERE
	salary_in_usd < 50000; -- where clause is executed before count, so you only count the rows that meet the criteria
-- there is a priority order

SELECT
	*
FROM
	main.data_jobs
WHERE
	experience_level = 'EN';

SELECT
	MEDIAN (salary_in_usd) AS median_salary_usd
FROM
	main.data_jobs
WHERE
	experience_level = 'MI';