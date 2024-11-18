SELECT
	*
FROM
	programming.python p
WHERE
	id = 2 ;
	
DELETE 
FROM programming.python 
WHERE 
	id = 2;
	
DELETE 
FROM programming.python 
WHERE 
	id IN (3,4);
	
SELECT * FROM database.duckdb d ;

DELETE 
FROM database.duckdb 
WHERE 
	id BETWEEN 1 AND 5;