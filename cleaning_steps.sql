-- Initial Row Count
SELECT COUNT(*) FROM INvideos;

-- Check NULL / Empty
SELECT COUNT(*) FROM INvideos WHERE description IS NULL OR description = '';
SELECT COUNT(*) FROM INvideos WHERE tags IS NULL OR tags = '';
SELECT COUNT(*) FROM INvideos WHERE title IS NULL OR title = '';

-- Fill Missing Text
UPDATE INvideos SET description = 'No Description' WHERE description IS NULL OR description = '';
UPDATE INvideos SET tags = 'No Tags' WHERE tags IS NULL OR tags = '';
UPDATE INvideos SET title = 'No Title' WHERE title IS NULL OR title = '';

-- Remove Invalid Rows
SELECT COUNT(*) FROM INvideos 
WHERE views = 0 OR likes = 0 OR dislikes = 0 OR comment_count = 0;

DELETE FROM INvideos 
WHERE views = 0 AND likes = 0 AND comment_count = 0;

-- Check Duplicates
SELECT video_id, trending_date, COUNT(*) AS count
FROM INvideos
GROUP BY video_id, trending_date
HAVING count > 1;

-- Deduplication
CREATE TABLE INvideos_deduped AS
SELECT * FROM INvideos
WHERE (video_id, trending_date) IN (
    SELECT video_id, MIN(trending_date)
    FROM INvideos
    WHERE trending_date > '1000-01-01'
    GROUP BY video_id, trending_date
);

DROP TABLE INvideos;
RENAME TABLE INvideos_deduped TO INvideos;

-- Final Cleaned Row Count
SELECT COUNT(*) AS final_cleaned_rows FROM INvideos;
