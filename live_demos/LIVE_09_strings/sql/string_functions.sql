-- in this script we'll test out different string functions
SELECT * FROM staging.sql_glossary ;

-- EDA Exploratory data analysis
-- slicing as it is done in most SQL dialects
SELECT
	'SQL word' AS type, -- it is useful when we join many tables, to know where does the data come from
	sql_word,
	SUBSTRING(sql_word, 1, 2),
	SUBSTRING(sql_word, 2, 5),
	SUBSTRING(sql_word, -1, 1)
FROM
	staging.sql_glossary ;

-- array-like slicing is similar to Python, this is unique for duckdb, many other DBMS don't have this implemented 
-- NOTE: we count from 1 in SQL
SELECT
	'SQL word' AS type, -- it is useful when we join many tables, to know where does the data come from
	sql_word,
	sql_word[:2],
	sql_word[2:5],
	sql_word[-1]
FROM
	staging.sql_glossary ;

-------------------------------------------
-- concatenation
-- || works like + in python ( in python it is polymorphism, + works differently depending on data, operator overload)
-- there is no such thing in SQL, use + with numbers and || with strings!
-- it is possible to run SELECT without a table

SELECT UPPER(SUBSTRING('hej',1,1)) || ' ' || 'de24'  ;

SELECT
	sql_word,
	UPPER(TRIM(sql_word)) AS sql_word -- it is a form of nested function, one function inside of another
FROM
	staging.sql_glossary;

-- removes all spaces, but we want to replace 2 or more spaces with 1 space
SELECT
	description -- looks strange, we want to make it prettier
FROM
	staging.sql_glossary;

-------------------
SELECT
	REPLACE(TRIM(description), ' ',  ''), -- looks strange, we want to make it prettier
REPLACE(TRIM(description), '  ',  ' ') -- we can't solve more complex situations with just TRIN and REPLACE, we need to use REGEX
FROM
	staging.sql_glossary;




