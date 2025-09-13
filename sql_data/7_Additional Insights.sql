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