-- schema is a logical grouping of database objects
-- schemas to organize different glossaries 
CREATE SCHEMA IF NOT EXISTS database; -- making database schema

CREATE SCHEMA IF NOT EXISTS programming;

-- checks schemas
SELECT
	*
FROM
	information_schema.schemata;

-- sequences to get auto incrementing rows 
-- because we do not want to manually enter an id
CREATE SEQUENCE IF NOT EXISTS id_sql_sequence START 1; -- it will auto increment each time I make a new row in a table
CREATE SEQUENCE IF NOT EXISTS id_python_sequence START 1;
CREATE SEQUENCE IF NOT EXISTS id_duckdb_sequence START 1;

SELECT * FROM pg_catalog.pg_sequences;

-- create tables for each glossary table
CREATE TABLE IF NOT EXISTS database.sql (
	id INTEGER DEFAULT nextval('id_sql_sequence'),
	word STRING,
	description STRING
);

CREATE TABLE IF NOT EXISTS database.duckdb (
	id INTEGER DEFAULT nextval('id_duckdb_sequence'),
	word STRING,
	description STRING
);

CREATE TABLE IF NOT EXISTS programming.python (
	id INTEGER DEFAULT nextval('id_python_sequence'),
	word STRING,
	description STRING
);


SELECT * FROM information_schema.tables;