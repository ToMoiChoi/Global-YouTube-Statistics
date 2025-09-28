-- Dữ liệu cho world map
SELECT 
    country,
    CASE 
            WHEN country IN ('United States', 'Canada', 'Mexico') THEN 'North America'
            WHEN country IN ('Brazil', 'Argentina', 'Colombia', 'Chile', 'Peru') THEN 'South America'
            WHEN country IN ('United Kingdom', 'Germany', 'France', 'Spain', 'Italy', 'Russia', 'Netherlands', 'Sweden', 'Poland') THEN 'Europe'
            WHEN country IN ('India', 'China', 'Japan', 'South Korea', 'Vietnam', 'Thailand', 'Philippines', 'Indonesia') THEN 'Asia'
            WHEN country IN ('Australia', 'New Zealand') THEN 'Oceania'
            ELSE 'Other'
        END AS continent,
    abbreviation,
    COUNT(*) AS channel_count,
    SUM(subscribers) AS total_subscribers,
    SUM(video_views) AS total_views,
    AVG(highest_monthly_earnings) AS avg_earnings,
    latitude,
    longitude,
    RANK() OVER (ORDER BY COUNT(*) DESC) AS country_rank,
    category
FROM youtubers 
GROUP BY country, abbreviation, latitude, longitude,category
HAVING COUNT(*) >= 1;

-- Top 10 quốc gia
SELECT 
    country,
    COUNT(*) AS channel_count,
    SUM(subscribers) AS total_subscribers,
    ROUND(SUM(subscribers) * 100.0 / (SELECT SUM(subscribers) FROM youtubers), 2) AS market_share
FROM youtubers 
where country != 'Nothing'
GROUP BY country
ORDER BY total_subscribers DESC
LIMIT 10;

