-- simulate throwing a dice with RANDOM()

SELECT RANDOM(); -- a random number between 0 and 1 included

SELECT * FROM generate_series(10); -- NOTE: special for duckdb! counts from 0 to 10

SELECT RANDOM()*6 FROM generate_series(10); -- generate_series(10) with RANDOM() will return 11 random numbers between 0 and 6

SELECT FLOOR(RANDOM()*6) +1 AS dices FROM generate_series(10); -- 11 results for a dice throw



