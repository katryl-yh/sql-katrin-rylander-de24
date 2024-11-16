--  i) How many unique communes are represented in the dataset.

SELECT
	COUNT(DISTINCT commune) AS no_unique_communes
FROM
	main.hemnet_data
;