WITH category_stats AS (
    SELECT 
        category,
        COUNT(*) AS channel_count,
        SUM(subscribers) AS total_subscribers,
        SUM(video_views) AS total_views,
        AVG(subscribers) AS avg_subscribers,
        AVG(highest_monthly_earnings) AS avg_earnings,
        ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM youtubers), 0) AS percentage
    FROM youtubers 
    GROUP BY category
)
SELECT 
    CASE 
        WHEN percentage > 5 THEN category
        ELSE 'Other Categories'
    END AS category_group,
    SUM(channel_count) AS channel_count,
    SUM(total_subscribers) AS total_subscribers,
    SUM(total_views) AS total_views,
    ROUND(AVG(avg_subscribers), 0) AS avg_subscribers,
    ROUND(AVG(avg_earnings), 2) AS avg_earnings,
    SUM(percentage) AS percentage
FROM category_stats
GROUP BY category_group
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