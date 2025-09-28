-- So sánh top 10 quốc gia
SELECT 
    country,
    COUNT(*) AS channel_count,
    SUM(subscribers) AS total_subscribers,
    SUM(video_views) AS total_views,
    AVG(subscribers) AS avg_subscribers_per_channel,
    AVG(highest_monthly_earnings) AS avg_monthly_earnings,
    MAX(subscribers) AS max_subscribers,
    ROUND(SUM(subscribers) * 100.0 / (SELECT SUM(subscribers) FROM youtubers), 2) AS market_share
FROM youtubers 
GROUP BY country
HAVING COUNT(*) >= 5
ORDER BY total_subscribers DESC
LIMIT 10;

-- Mật độ kênh theo quốc gia
SELECT 
    country,
    population,
    COUNT(*) AS channel_count,
    ROUND(COUNT(*) * 1000000.0 / population, 2) AS channels_per_million,
    ROUND(SUM(subscribers) * 100.0 / population, 2) AS penetration_rate
FROM youtubers 
WHERE population IS NOT NULL AND population > 0
GROUP BY country, population
HAVING COUNT(*) >= 3
ORDER BY channels_per_million DESC
