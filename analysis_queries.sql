-- Most Viewed Videos
SELECT title, channel_title, views
FROM INvideos
ORDER BY views DESC
LIMIT 10;

-- Most Liked
SELECT title, likes, views
FROM INvideos
ORDER BY likes DESC
LIMIT 10;

-- Most Commented
SELECT title, comment_count, views
FROM INvideos
ORDER BY comment_count DESC
LIMIT 10;

-- Top Channels by Views
SELECT channel_title, SUM(views) AS total_views
FROM INvideos
GROUP BY channel_title
ORDER BY total_views DESC
LIMIT 10;

-- Engagement Ratio
SELECT title, ROUND((likes / views) * 100, 2) AS like_ratio, views, likes
FROM INvideos
WHERE views > 100000
ORDER BY like_ratio DESC
LIMIT 10;

-- Average Views by Category Name
SELECT c.category_name, AVG(v.views) AS avg_views
FROM INvideos v
JOIN INcategories c ON v.category_id = c.category_id
GROUP BY c.category_name
ORDER BY avg_views DESC;

-- Category ID-wise Views
SELECT category_id, AVG(views) AS avg_views
FROM INvideos
GROUP BY category_id
ORDER BY avg_views DESC;

-- Most Disliked
SELECT title, dislikes, views
FROM INvideos
ORDER BY dislikes DESC
LIMIT 10;

-- Channels with Most Trending Videos
SELECT channel_title, COUNT(*) AS total_trending_videos
FROM INvideos
GROUP BY channel_title
ORDER BY total_trending_videos DESC
LIMIT 10;

-- Date Range
SELECT MIN(formatted_trending_date) AS first_trending_date,
       MAX(formatted_trending_date) AS last_trending_date
FROM INvideos;

-- Monthly Trend
SELECT MONTH(formatted_trending_date) AS month, COUNT(*) AS total_trending
FROM INvideos
GROUP BY month
ORDER BY month;

-- Upload Timing Trends
SELECT HOUR(formatted_publish_time) AS hour, COUNT(*) AS uploads
FROM INvideos
GROUP BY hour
ORDER BY uploads DESC;
