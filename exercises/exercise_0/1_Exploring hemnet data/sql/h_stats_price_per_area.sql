--  h) Find out statistics on minimum, mean, median and maximum prices of price per area.

SELECT
	MIN(price_per_area) AS min_price_per_area,
	AVG(price_per_area) AS mean_price_per_area,
	MEDIAN(price_per_area) AS median_price_per_area,
	MAX(price_per_area) AS max_price_per_area,
FROM
	main.hemnet_data
;