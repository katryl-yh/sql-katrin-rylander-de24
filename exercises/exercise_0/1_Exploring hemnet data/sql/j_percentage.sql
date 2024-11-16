-- j) How many percentage of homes cost more than 10 million?

SELECT
	( COUNT(*) * 100.0 / ( SELECT COUNT(*) FROM main.hemnet_data) )AS percentage_over_10
FROM
	main.hemnet_data
WHERE 
	final_price > 10000000 ;