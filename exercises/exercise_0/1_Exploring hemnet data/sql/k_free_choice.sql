--  k) Feel free to explore anything else you find interesting in this dataset.

-- How big percentage of homes cost between 5 and 10 million?

SELECT
	( COUNT(*) * 100.0 / ( SELECT COUNT(*) FROM main.hemnet_data) )AS percentage_5_to_10
FROM
	main.hemnet_data
WHERE 
	final_price BETWEEN 5000000 AND 10000000 ;

-- How big percentage of homes cost below 5 million?

SELECT
	( COUNT(*) * 100.0 / ( SELECT COUNT(*) FROM main.hemnet_data) )AS percentage_below_5
FROM
	main.hemnet_data
WHERE 
	final_price < 5000000 ;

-- Which areas have price per area below 50000 per sq meter

SELECT
	*
FROM
	main.hemnet_data
WHERE 
	price_per_area < 50000 ;

-- How big percentage of homes is sold on the asking price?

SELECT
	( COUNT(*) * 100.0 / ( SELECT COUNT(*) FROM main.hemnet_data) )AS percentage_on_ask_price
FROM
	main.hemnet_data
WHERE 
	pourcentage_difference = 0 ;