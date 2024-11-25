-- we will use generate_series to generate dates

-- we need to specify (DATE start_date, DATE end_date, INTERVAL 1 DAY)
SELECT * FROM generate_series(DATE '2024-11-01', DATE '2024-11-30', INTERVAL 1 DAY); 

