INSERT
	INTO
	database.sql (word,
	description)
VALUES ('query',
'request made to a database to retriece, modify or manipulate data');

INSERT
	INTO
	database.sql (word,
	description)
VALUES 
	('CRUD','create, read, update, delete - basic actions to be performed on data'),
	('range condition', 'filter data within a specific range of values');

INSERT
	INTO
	programming.python (word,
	description)
VALUES 
	('class','code template for creating objects');

INSERT
	INTO
	database.duckdb (word,
	description)
VALUES 
	('Duckdb',
	'An in-process SQL OLAP database management system designed for fast analytical queries'),
	('Sequence',
	'A database object that generates a sequence of unique numbers, typically used for auto-incrementing columns.'),
	('VARCHAR',
	'A variable-length changacter data type that stores text strings of varying lengths'),
	('TIMESTAMPTZ',
	'A data type that stores both data and time, including time zone information'),
	('ARRAY',
	'A data type in DuckDB that allows for the storage of ordered collections of elements of the same type.');

SELECT * FROM database.sql s ;
SELECT * FROM programming.python p ;
SELECT * FROM database.duckdb d ;