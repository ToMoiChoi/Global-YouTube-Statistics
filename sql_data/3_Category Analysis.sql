-- Phân bố theo thể loại
SELECT 
    category,
    COUNT(*) AS channel_count,
    SUM(subscribers) AS total_subscribers,
    SUM(video_views) AS total_views,
    AVG(subscribers) AS avg_subscribers,
    AVG(highest_monthly_earnings) AS avg_earnings,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM youtubers), 2) AS percentage
FROM youtubers 
GROUP BY category
ORDER BY total_subscribers DESC;

-- Top 3 thể loại có thu nhập cao nhất
SELECT 
    category,
    AVG(highest_monthly_earnings) AS avg_monthly_earnings,
    SUM(highest_yearly_earnings) AS total_yearly_earnings
FROM youtubers 
GROUP BY category
ORDER BY avg_monthly_earnings DESC
LIMIT 3;