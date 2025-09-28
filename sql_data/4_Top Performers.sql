-- Top 20 kênh theo subscribers
SELECT 
    rank,
    youtuber,
    country,
    category,
    subscribers,
    video_views,
    highest_monthly_earnings AS monthly_earnings,
    highest_yearly_earnings AS yearly_earnings,
    ROUND(video_views::numeric / subscribers, 1) AS views_per_subscriber
FROM youtubers 
ORDER BY subscribers DESC 
LIMIT 20;

-- Top kênh theo thu nhập
SELECT 
    rank,
    youtuber,
    country,
    category,
    subscribers,
    video_views,
    highest_monthly_earnings AS monthly_earnings,
    highest_yearly_earnings AS yearly_earnings,
    ROUND(highest_monthly_earnings / (video_views::numeric / 1000), 2) AS rpm -- Revenue per mille
FROM youtubers 
WHERE video_views > 0
ORDER BY highest_monthly_earnings DESC 
LIMIT 20;

-- Top kênh theo engagement
SELECT 
    youtuber,
    country,
    category,
    subscribers,
    video_views,
    ROUND(video_views::numeric / subscribers, 1) AS engagement_ratio,
    highest_monthly_earnings AS monthly_earnings
FROM youtubers 
WHERE subscribers > 1000000
ORDER BY engagement_ratio DESC 
LIMIT 15;