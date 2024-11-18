-- select all data with wild card asteriks
SELECT * FROM main.data_jobs; 

-- count number of rows in database
SELECT COUNT(*) FROM main.data_jobs;

-- we will filter on all the rows based on a given condition, this case we look for salaries lower than 50k
SELECT
	*
FROM
	main.data_jobs
WHERE
	salary_in_usd < 50000;

SELECT
	COUNT(*) AS number_rows_lower_than_50k
FROM
	main.data_jobs
WHERE
	salary_in_usd < 50000;

-- we will now focus on experience level
-- I want to know the unique experience level labels
SELECT
	DISTINCT experience_level
FROM
	main.data_jobs;

-- I want to filter out the ones with experience level = EN (entry level)

SELECT
	*
FROM
	main.data_jobs
WHERE
	experience_level = 'EN';
-- I want to check how many rows meet that condition
SELECT
	COUNT(*)
FROM
	main.data_jobs
WHERE
	experience_level = 'EN';

-- I want to find the median value for salary for EN
SELECT
	MEDIAN(salary_in_usd)
FROM
	main.data_jobs
WHERE
	experience_level = 'EN';

-- I want to find the median value for salary for MI
SELECT
	MEDIAN(salary_in_usd)
FROM
	main.data_jobs
WHERE
	experience_level = 'MI';


