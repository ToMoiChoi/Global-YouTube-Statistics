-- Dữ liệu cho world map
SELECT 
    country,
    abbreviation,
    COUNT(*) AS channel_count,
    SUM(subscribers) AS total_subscribers,
    SUM(video_views) AS total_views,
    AVG(highest_monthly_earnings) AS avg_earnings,
    latitude,
    longitude,
    RANK() OVER (ORDER BY COUNT(*) DESC) AS country_rank
FROM youtubers 
WHERE country IS NOT NULL 
GROUP BY country, abbreviation, latitude, longitude
HAVING COUNT(*) >= 1;

-- Top 10 quốc gia
SELECT 
    country,
    COUNT(*) AS channel_count,
    SUM(subscribers) AS total_subscribers,
    ROUND(SUM(subscribers) * 100.0 / (SELECT SUM(subscribers) FROM youtubers), 2) AS market_share
FROM youtubers 
GROUP BY country
ORDER BY total_subscribers DESC
LIMIT 10;