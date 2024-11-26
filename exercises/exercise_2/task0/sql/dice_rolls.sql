-- a) Generate 10 rows of dice rolls data
-- NOTE: in duckdb I need to UNNEST in order to distribute the numbers between rows

SELECT UNNEST (generate_series(1,10)) as id; -- returned a list from 1 to 10

-- This will generate 100 results simulating throwing a dice
SELECT FLOOR( RANDOM()*6 +1) AS dice FROM generate_series(10);

-- b) Calculate the average of getting a six

SELECT
	FLOOR( RANDOM()* 6 + 1) AS dice
FROM
	generate_series(10);


-- FROM chatgtp

WITH dice_rolls AS (
  SELECT FLOOR(RANDOM() * 6) + 1 AS roll
  FROM generate_series(1, 10)
)
SELECT 
  AVG(CASE WHEN roll = 6 THEN 1 ELSE 0 END) AS avg_six
FROM dice_rolls;

-- OTHER WAY
CREATE TABLE IF NOT EXISTS main.dice_rolls_10 AS (
  SELECT FLOOR(RANDOM() * 6) + 1 AS roll
  FROM generate_series(1, 10)
);

SELECT 
  AVG(CASE WHEN roll = 6 THEN 1 ELSE 0 END) AS avg_six
FROM main.dice_rolls_10;

-- c) Generate 100 rows of dice rolls and calculate average of getting a six

WITH dice_rolls_100 AS (
  SELECT FLOOR(RANDOM() * 6) + 1 AS roll
  FROM generate_series(1, 100)
)
SELECT 
  AVG(CASE WHEN roll = 6 THEN 1 ELSE 0 END) AS avg_six
FROM dice_rolls_100;

-- d) Repeat the experiment with 1000, 10000, 100000, 1000000 rolls.
-- with 1000
WITH dice_rolls_1000 AS (
  SELECT FLOOR(RANDOM() * 6) + 1 AS roll
  FROM generate_series(1, 1000)
)
SELECT 
  AVG(CASE WHEN roll = 6 THEN 1 ELSE 0 END) AS avg_six
FROM dice_rolls_1000;

-- with 10000
WITH dice_rolls_10000 AS (
  SELECT FLOOR(RANDOM() * 6) + 1 AS roll
  FROM generate_series(1, 10000)
)
SELECT 
  AVG(CASE WHEN roll = 6 THEN 1 ELSE 0 END) AS avg_six
FROM dice_rolls_10000;

-- with 100000
WITH dice_rolls_100000 AS (
  SELECT FLOOR(RANDOM() * 6) + 1 AS roll
  FROM generate_series(1, 100000)
)
SELECT 
  AVG(CASE WHEN roll = 6 THEN 1 ELSE 0 END) AS avg_six
FROM dice_rolls_100000;

-- with 1000000
WITH dice_rolls_1000000 AS (
  SELECT FLOOR(RANDOM() * 6) + 1 AS roll
  FROM generate_series(1, 100000)
)
SELECT 
  AVG(CASE WHEN roll = 6 THEN 1 ELSE 0 END) AS avg_six,
  ROUND(1/6,5) AS theoretical_mean
FROM dice_rolls_1000000;

-- e) What is the theoretical mean?
SELECT ROUND(1/6,5) AS theoretical_mean;

