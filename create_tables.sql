CREATE DATABASE YouTubeAnalytics;
USE YouTubeAnalytics;

CREATE TABLE INvideos (
    video_id VARCHAR(20),
    trending_date VARCHAR(20),
    title TEXT,
    channel_title VARCHAR(100),
    category_id INT,
    publish_time VARCHAR(50),
    tags TEXT,
    views BIGINT,
    likes BIGINT,
    dislikes BIGINT,
    comment_count BIGINT,
    thumbnail_link TEXT,
    comments_disabled VARCHAR(10),
    ratings_disabled VARCHAR(10),
    video_error_or_removed VARCHAR(10),
    description TEXT
);

-- Load CSV with Proper Encoding
LOAD DATA LOCAL INFILE 'E:/Youtube_Analytics/data/INvideos_utf8.csv'
INTO TABLE INvideos
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

-- Date Conversion
ALTER TABLE INvideos ADD formatted_trending_date DATE;
UPDATE INvideos
SET formatted_trending_date = STR_TO_DATE(trending_date, '%y.%d.%m')
WHERE trending_date REGEXP '^[0-9]{2}\\.[0-9]{2}\\.[0-9]{2}$';

-- Publish Time Conversion
ALTER TABLE INvideos ADD formatted_publish_time DATETIME;
UPDATE INvideos
SET formatted_publish_time = STR_TO_DATE(SUBSTRING_INDEX(publish_time, '.', 1), '%Y-%m-%dT%H:%i:%s')
WHERE publish_time LIKE '%T%';

-- Convert Boolean Texts
ALTER TABLE INvideos
    ADD is_comments_disabled BOOLEAN,
    ADD is_ratings_disabled BOOLEAN,
    ADD is_video_error_removed BOOLEAN;

UPDATE INvideos SET is_comments_disabled = (comments_disabled = 'TRUE');
UPDATE INvideos SET is_ratings_disabled = (ratings_disabled = 'TRUE');
UPDATE INvideos SET is_video_error_removed = (video_error_or_removed = 'TRUE');

CREATE TABLE INcategories (
  category_id INT PRIMARY KEY,
  category_name VARCHAR(100)
);

INSERT INTO INcategories VALUES
(1, 'Film & Animation'), (2, 'Autos & Vehicles'), (10, 'Music'),
(15, 'Pets & Animals'), (17, 'Sports'), (19, 'Travel & Events'),
(20, 'Gaming'), (22, 'People & Blogs'), (23, 'Comedy'),
(24, 'Entertainment'), (25, 'News & Politics'), (26, 'Howto & Style'),
(27, 'Education'), (28, 'Science & Technology'), (29, 'Nonprofits & Activism');

-- Index for Speed
CREATE INDEX idx_video_date ON INvideos(video_id, formatted_trending_date);
