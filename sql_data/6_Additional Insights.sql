-- Phân tích theo năm thành lập
SELECT 
    created_year,
    COUNT(*) AS channels_created,
    AVG(subscribers) AS avg_subscribers,
    AVG(highest_monthly_earnings) AS avg_earnings
FROM youtubers 
WHERE created_year BETWEEN 2005 AND 2023
GROUP BY created_year
ORDER BY created_year;

-- So sánh channel_type
SELECT 
    channel_type,
    COUNT(*) AS channel_count,
    AVG(subscribers) AS avg_subscribers,
    AVG(highest_monthly_earnings) AS avg_earnings,
    SUM(video_views) AS total_views
FROM youtubers 
GROUP BY channel_type
ORDER BY avg_earnings DESC;

-- Chỉ số toàn diện
SELECT 
    youtuber,
    category,
    country,
    CASE 
        WHEN category IN ('Music','Entertainment','People & Blogs','Gaming','Comedy','Education','Film & Animation') 
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
    subscribers,
    video_views,
    highest_monthly_earnings AS max_monthly_earnings,
    ROUND((subscribers * 0.3 + video_views * 0.4 + highest_monthly_earnings * 0.3),0) AS score,
    Cast(created_year as INT) as year
FROM youtubers
WHERE created_year ~ '^[0-9]+$' 
ORDER BY score DESC;