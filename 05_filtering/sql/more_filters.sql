-- IN operator for list filtering
SELECT
	DISTINCT COUNT(*)
FROM
	main.data_jobs dj
WHERE
	company_size IN ('M', 'S') ;

-- let's check the opposite, how many entries come from big companies

SELECT
	DISTINCT COUNT(*)
FROM
	main.data_jobs dj
WHERE
	company_size NOT IN ('M', 'S') ;

-- FILTER CLAUSE
SELECT
	COUNT(*) AS total_jobs,
	COUNT(*) FILTER (WHERE remote_ratio = 100) AS remote_jobs,
	ROUND(remote_jobs/total_jobs*100,2) AS percentage_remote_jobs
FROM
	main.data_jobs dj ;

SELECT
	*
FROM
	main.data_jobs dj OFFSET 6 ; -- we show data apart from the first 6 rows
