--   f) Find out the 5 cheapest homes sold.

SELECT
	*
FROM
	main.hemnet_data
ORDER BY final_price
LIMIT 5;