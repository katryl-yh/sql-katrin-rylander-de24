-- alias only exists during the query, otherwise it does not exist
SELECT
	DISTINCT salary_currency AS unique_currency
FROM
	main.data_jobs;
	
-- I can also count how many distinct currencies there are
SELECT
	COUNT(DISTINCT salary_currency) AS number_currencies
FROM
	main.data_jobs;
	
-- it is possible to skip AS, but AS gives more readability to I will continue to use it
SELECT
	COUNT(DISTINCT salary_currency) number_currencies
FROM
	main.data_jobs;