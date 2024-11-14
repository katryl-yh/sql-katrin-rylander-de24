-- we are going to sort the data which we query
-- in this case we will order by salary in ascending order

SELECT
	*
FROM
	main.data_jobs
ORDER BY
	salary_in_usd ;

-- same data in descending order

SELECT
	*
FROM
	main.data_jobs
ORDER BY
	salary_in_usd 
DESC;

-- add that in case of tie we chose another column to sort

SELECT
	*
FROM
	main.data_jobs
ORDER BY
	salary_in_usd DESC, -- requires a comma!
	job_title ASC ;
