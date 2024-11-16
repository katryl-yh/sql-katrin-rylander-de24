--  i) You see that 02_setup_duckdb comes in the end of your table, even though the week is 46. 
-- Now make a query where you sort the weeks in ascending order.

-- sorting by week in ascending order
SELECT
	*
FROM
	main.course_structure
ORDER BY
	week, content;
