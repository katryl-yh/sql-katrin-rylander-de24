DESC;

-- SELECT * FROM data_jobs; this gives an error because we did not use a namespace

SELECT * FROM main.data_jobs;

-- or use full name from schema

SELECT * FROM salaries.main.data_jobs; 

-- limit clause

SELECT * FROM salaries.main.data_jobs LIMIT 5;

-- selecting specific columns OR column projection OR selective queries

SELECT
	work_year,
	job_title,
	salary_in_usd,
	company_location
FROM
	main.data_jobs; 

-- using EXCLUDE instead 

SELECT
	* EXCLUDE (salary,
	work_year)
FROM
	salaries.main.data_jobs; 

-- to get unique values in a column

SELECT
	DISTINCT employment_type
FROM
	main.data_jobs;

SELECT
	DISTINCT experience_level 
FROM
	main.data_jobs;
