-- syntax to create a list of days between two dates with specified interval

SELECT
	*
FROM
	generate_series(DATE '2024-11-01',
	DATE '2024-11-30',
	INTERVAL '5 day') AS t(november);
	
-- date dimension

SELECT 
	STRFTIME(date_series, '%Y-%m-%d') AS date,
	month(date_series) AS month,
	week(date_series) AS week,
	weekday(date_series) AS day_of_week -- 0 is Sunday, 1 is Monday, ...
FROM
	generate_series(DATE '2024-01-01',
	DATE '2024-12-31',
	INTERVAL '5 day') AS t(date_series); -- Q why does it have to be t(date_series) a nie t(november)
	
---------------------
-- check other queries from slides!!!

