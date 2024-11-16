--  g) Find out statistics on minimum, mean, median and maximum prices of homes sold.

SELECT
	MIN(final_price) AS min_final_price,
	AVG(final_price) AS mean_final_price,
	MEDIAN(final_price) AS median_final_price,
	MAX(final_price) AS max_final_price,
FROM
	main.hemnet_data
;