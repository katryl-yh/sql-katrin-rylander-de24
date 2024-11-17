-- range filtering using AND operator
SELECT
	job_title,
	experience_level,
	10.68 * salary_in_usd/ 12 AS salary_sek_month 
FROM
	main.data_jobs dj 
WHERE 
	(salary_sek_month > 200000)
	AND (salary_sek_month < 500000) 
ORDER BY 
	salary_sek_month DESC ;

-- same effect but with BETWEEN .... AND statement
SELECT
	job_title,
	experience_level,
	10.68 * salary_in_usd/ 12 AS salary_sek_month 
FROM
	main.data_jobs dj 
WHERE 
	salary_sek_month BETWEEN 200000 AND 500000 
ORDER BY 
	salary_sek_month DESC ;

-- OR operator
SELECT
	COUNT(*)
FROM
	main.data_jobs
WHERE
	experience_level = 'Senior'
	OR experience_level = 'Expert';

-- NOT operator, it negates the whole condition inside
SELECT
	COUNT(*)
FROM
	main.data_jobs
WHERE
	NOT (experience_level = 'Senior'
	OR experience_level = 'Expert');
