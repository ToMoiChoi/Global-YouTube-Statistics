-- Tổng hợp metrics chính
SELECT 
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
FROM youtubers;