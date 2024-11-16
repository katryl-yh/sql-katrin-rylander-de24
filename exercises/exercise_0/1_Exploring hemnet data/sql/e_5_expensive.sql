-- e) Find out the 5 most expensive homes sold.

SELECT
	*
FROM
	main.hemnet_data
ORDER BY final_price DESC
LIMIT 5;