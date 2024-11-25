CREATE TABLE IF NOT EXISTS games AS (
    SELECT * FROM read_csv_auto('data/games.csv')
);