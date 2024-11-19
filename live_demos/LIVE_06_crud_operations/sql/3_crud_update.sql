-- update

SELECT * FROM database.duckdb;

-- scenario, I have learnt a few words: 11, 9,1 and I want to change learnt to TRUE
-- it is good to run select before we update to make sure we update correct rows

SELECT * FROM database.duckdb WHERE id in (9,1,11); 

SELECT
	word,
	learnt
FROM
	database.duckdb
WHERE
	id IN (9, 1, 11);

-- it is time for UPDATE

UPDATE
	database.duckdb
SET
	learnt = TRUE
WHERE
	id IN (9, 1, 11);
