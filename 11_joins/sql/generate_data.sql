-- create plants dataset 

-- NOTE about plant_id
-- INTEGER PRIMARY KEY means the column will store integer values
-- that uniquely identify each row in the table (values in the column are unique and not NULL)


-- NOTE about plant_name
-- When you combine TEXT with the UNIQUE constraint, 
-- it means that the column can store long strings (text) 
-- AND no two rows can have the same value in this column.

CREATE TABLE IF NOT EXISTS main.plants (
	plant_id INTEGER PRIMARY KEY,
	plant_name TEXT UNIQUE,
	type TEXT
);

CREATE TABLE IF NOT EXISTS plant_care (
    id INTEGER PRIMARY KEY,
    plant_id INTEGER,
    water_schedule TEXT,
    sunlight TEXT
);


INSERT INTO main.plants (plant_id, plant_name, type) 
VALUES
	(1, 'Rose', 'Flower'),
	(2, 'Oak', 'Tree'),
	(3, 'Tulip', 'Flower'),
	(4, 'Cactus', 'Succulent'),
	(5, 'Sunflower', 'Flower');

INSERT INTO main.plant_care (id, plant_id, water_schedule, sunlight) 
VALUES
	(1, 1, 'Daily', 'Full Sun'),
	(2, 3, 'Weekly', 'Partial Sun'),
	(3, 4, 'Biweekly', 'Full Sun'),
	(4, 6, 'Daily', 'Shade');