SELECT
	*
FROM
	main.data_jobs dj ;

-- make a case when, which is only visible when you run it, it does not make a permanent change in the database
SELECT
	CASE 
		WHEN experience_level = 'SE' THEN 'Senior'
		WHEN experience_level = 'MI' THEN 'Mid level'
		WHEN experience_level = 'EN' THEN 'Entry level'
		WHEN experience_level = 'EX' THEN 'Expert'
	END AS experience_level ,
	* EXCLUDE (experience_level)
FROM
	main.data_jobs dj ;


-- if I want to make a permanent change, I should UPDATE the database
UPDATE
	main.data_jobs
SET	experience_level = CASE
		WHEN experience_level = 'SE' THEN 'Senior'
		WHEN experience_level = 'MI' THEN 'Mid level'
		WHEN experience_level = 'EN' THEN 'Entry level'
		WHEN experience_level = 'EX' THEN 'Expert'
		ELSE experience_level 
	END;

SELECT DISTINCT experience_level FROM main.data_jobs dj ;

	
