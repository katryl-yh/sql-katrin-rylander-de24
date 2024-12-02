INSTALL sqlite;
LOAD sqlite;
-- use a function from sqlite
-- we need to use absolute path so that DBeaver will work

CALL sqlite_attach('/Users/Katrin/Documents/github/sql-katrin-rylander-de24/live_demos/LIVE_10_set_operations/data/sqlite-sakila.db')

-- C:\Users\Katrin\Documents\github\sql-katrin-rylander-de24\live_demos\LIVE_10_set_operations\data\sqlite-sakila.db