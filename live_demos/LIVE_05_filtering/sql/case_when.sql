-- case when is sqls equivalent to if-sats
SELECT * FROM main.data_jobs;

-- I want to make experience_level descriptions more clear:
-- EN --> Entry level
-- MI --> Mid level
-- SE --> Senior
-- EX --> Expert

SELECT
	CASE
		WHEN experience_level = 'SE' THEN 'Senior' -- it gives NULL when the condition is not met, we need to continue building case
		WHEN experience_level = 'MI' THEN 'Mid level'
		WHEN experience_level = 'EN' THEN 'Entry level'
		WHEN experience_level = 'EX' THEN 'Expert'
		ELSE experience_level -- preserve existing value if no match
	END AS experience_level ,
	* EXCLUDE experience_level -- I take all old columns apart from experience_level
FROM
	main.data_jobs;
	
-- Q: Have I transformed my data?
SELECT * FROM main.data_jobs; -- no, I need to update my table, I need to persist changes

-- to persist changes in the table --> update it

UPDATE 
	main.data_jobs 
SET 
	experience_level =  CASE -- we assign this case to the specific column
		WHEN experience_level = 'SE' THEN 'Senior' -- it gives NULL when the condition is not met, we need to continue building case
		WHEN experience_level = 'MI' THEN 'Mid level'
		WHEN experience_level = 'EN' THEN 'Entry level'
		WHEN experience_level = 'EX' THEN 'Expert'
		ELSE experience_level -- preserve existing value if no match
	END
WHERE experience_level IN ('SE', 'MI', 'EN', 'EX');

-- to check if it worked
SELECT DISTINCT experience_level FROM main.data_jobs;


