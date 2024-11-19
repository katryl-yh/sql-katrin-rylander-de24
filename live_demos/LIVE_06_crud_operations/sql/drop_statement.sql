-- DDL -- Data Definition Language

SELECT * FROM information_schema.tables;

DROP TABLE database.sql;

-- one can even DROP the whole SCHEMA with all tables

DROP SCHEMA programming; -- this will not work, because there are dependencies errors!!! it has stuff inside

-- in that situation we want to drop the SCHEMA with everyting that is inside

DROP SCHEMA programming CASCADE; 