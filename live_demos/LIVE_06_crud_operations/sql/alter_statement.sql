-- DDL -- Data Definition Language

-- when I have glossary, I want to add a column to keep track of my progress
-- column: learnt keeps a boolean which is True only when I mastered a word

ALTER TABLE database.duckdb ADD COLUMN learnt BOOLEAN DEFAULT FALSE;

-- change a column name on an existing table in DuckDB
-- ALTER TABLE table_name RENAME COLUMN old_column_name TO new_column_name;

-- TO remove a column in case one made mistake
-- ALTER TABLE table_name DROP COLUMN column_name;