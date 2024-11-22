SELECT * FROM main.cleaned_food ;

----------------------------------------------

SELECT
	food,
	SUM(number_searches) AS total_searches -- I am interested in the total number of searches per specific food
FROM
	main.cleaned_food
GROUP BY
	food
ORDER BY
	total_searches DESC
LIMIT 10;

----------------------------------------------

SELECT
	year,
	SUM(number_searches) AS total_searches -- I am interested in the total number of searches per specific food
FROM
	main.cleaned_food
GROUP BY
	year
ORDER BY
	total_searches DESC
LIMIT 15;

----------------------------------------------

SELECT
	DISTINCT year
FROM
	main.cleaned_food
ORDER BY
	year DESC;
	
----------------------------------------------

SELECT
	year,
	SUM(number_searches) AS total_searches
FROM
	main.cleaned_food
GROUP BY
	year
HAVING -- we added a filter on the searches, NOTE: filtering happens after aggregation
	total_searches > 300000
ORDER BY
	total_searches DESC ;