CREATE TABLE IF NOT EXISTS course_structure AS (
    SELECT * FROM read_csv_auto('data/course_content.csv')
)