-- Tổng hợp metrics chính
SELECT 
CASE 
            WHEN country IN ('United States', 'Canada', 'Mexico') THEN 'North America'
            WHEN country IN ('Brazil', 'Argentina', 'Colombia', 'Chile', 'Peru') THEN 'South America'
            WHEN country IN ('United Kingdom', 'Germany', 'France', 'Spain', 'Italy', 'Russia', 'Netherlands', 'Sweden', 'Poland') THEN 'Europe'
            WHEN country IN ('India', 'China', 'Japan', 'South Korea', 'Vietnam', 'Thailand', 'Philippines', 'Indonesia') THEN 'Asia'
            WHEN country IN ('Australia', 'New Zealand') THEN 'Oceania'
            ELSE 'Other'
        END AS continent,
    COUNT(*) AS total_channels,
    SUM(subscribers) AS total_subscribers,
    SUM(video_views) AS total_video_views,
    AVG(subscribers) AS avg_subscribers,
    AVG(highest_monthly_earnings) AS avg_monthly_earnings,
    SUM(highest_yearly_earnings) AS total_yearly_earnings,
    COUNT(DISTINCT country) AS unique_countries,
    COUNT(DISTINCT category) AS unique_categories,
    MAX(subscribers) AS max_subscribers,
    MAX(highest_monthly_earnings) AS max_monthly_earnings
FROM youtubers
GROUP BY continent;
-- Donut Chart: Distribution by Continent
WITH continent_data AS (
    SELECT 
        CASE 
            WHEN country IN ('United States', 'Canada', 'Mexico') THEN 'North America'
            WHEN country IN ('Brazil', 'Argentina', 'Colombia', 'Chile', 'Peru') THEN 'South America'
            WHEN country IN ('United Kingdom', 'Germany', 'France', 'Spain', 'Italy', 'Russia', 'Netherlands', 'Sweden', 'Poland') THEN 'Europe'
            WHEN country IN ('India', 'China', 'Japan', 'South Korea', 'Vietnam', 'Thailand', 'Philippines', 'Indonesia') THEN 'Asia'
            WHEN country IN ('Australia', 'New Zealand') THEN 'Oceania'
            ELSE 'Other'
        END AS continent,
        COUNT(*) AS channel_count,
        SUM(subscribers) AS total_subscribers
    FROM youtubers 
    WHERE country IS NOT NULL
    GROUP BY continent
)
SELECT 
    continent,
    channel_count,
    total_subscribers,
    ROUND(channel_count * 100.0 / SUM(channel_count) OVER (), 1) AS percentage
FROM continent_data
ORDER BY channel_count DESC;
-- Bar Chart: Top Categories by Subscribers
WITH category_ranked AS (
    SELECT 
        category,
        SUM(subscribers) AS total_subscribers,
        COUNT(*) AS channel_count,
        RANK() OVER (ORDER BY SUM(subscribers) DESC) AS rank
    FROM youtubers 
    GROUP BY category
)
SELECT 
    category,
    total_subscribers,
    channel_count,
    ROUND(total_subscribers / 1000000, 1) AS subscribers_millions
FROM category_ranked c
ORDER BY total_subscribers DESC
LIMIT 5;
-- Trend Line: Growth by Creation Year  
SELECT 
    CAST(created_year AS INT) AS created_year, 
    COUNT(*) AS channels_created,
    SUM(subscribers) AS total_subscribers_created,
    AVG(subscribers) AS avg_subscribers_per_channel,
    AVG(highest_monthly_earnings) AS avg_earnings
FROM youtubers 
WHERE created_year ~ '^[0-9]+$'
  AND CAST(created_year AS INT) BETWEEN 2005 AND 2023
GROUP BY CAST(created_year AS INT)
HAVING COUNT(*) >= 5  
ORDER BY CAST(created_year AS INT);

--Top 10 youtube best
SELECT 
    youtuber,
    category,
    CASE 
        WHEN category IN ('Music','Entertainment','People & Blogs','Gaming','Comedy','Education',) 
        THEN category
        ELSE 'Other'
    END as category_top,
    country,
    CASE 
        WHEN country IN ('United States', 'Canada', 'Mexico') THEN 'North America'
        WHEN country IN ('Brazil', 'Argentina', 'Colombia', 'Chile', 'Peru') THEN 'South America'
        WHEN country IN ('United Kingdom', 'Germany', 'France', 'Spain', 'Italy', 'Russia', 'Netherlands', 'Sweden', 'Poland') THEN 'Europe'
        WHEN country IN ('India', 'China', 'Japan', 'South Korea', 'Vietnam', 'Thailand', 'Philippines', 'Indonesia') THEN 'Asia'
        WHEN country IN ('Australia', 'New Zealand') THEN 'Oceania'
        ELSE 'Other'
    END AS continent,
    highest_monthly_earnings,
    CAST(created_year AS INT) AS created_year, 
    CAST(subscribers as int) as subscribers,
    video_views
FROM youtubers
WHERE created_year ~ '^[0-9]+$' 
ORDER BY CAST(subscribers as int) DESC;