-- DDL -- Data Definition Language
-- we are going to create schema in the database

-- is a type of logical grouping, every schema contains different tables

CREATE SCHEMA IF NOT EXISTS database; -- IF NOT EXISTS we add it for statement be idempotent, it prevents the script from crashing

SELECT * FROM information_schema.schemata;

-- this part is special with duckdb, it does not have an auto increment on the rows
-- other transactional databases have built-in ways to auto-numerate row
-- the reason for it is that duckdb is not optimized for being transactional database
-- it is not optimized for inputting lots of data, it is optimized for analytics

-- we are now making out increment sequences

CREATE SEQUENCE IF NOT EXISTS id_duckdb_sequence START 1; -- I can pick any other int number

SELECT * FROM pg_catalog.pg_sequences;

-- we are not ready to make a table
-- duckdb table is going to be places in database schema!

CREATE TABLE IF NOT EXISTS database.duckdb (
	id INTEGER DEFAULT nextval('id_duckdb_sequence'), -- will give an id value that is next int number, unless we specify manually
	word STRING,
	description STRING
);

------------------------------------------------------------------------------------
-- LETS CREATE A FEW MORE TABLES
-- tables for each glossary table 
------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS database.sql (
	word STRING,
	description STRING);

-- we make a new schema
CREATE SCHEMA IF NOT EXISTS programming;
-- in the programming schema we put out new tables
-- if I do not specify where I put my table it will by default end up in main!

CREATE TABLE IF NOT EXISTS programming.python (
	word STRING,
	description STRING);

CREATE TABLE IF NOT EXISTS programming.c_sharp (
	word STRING,
	description STRING);

