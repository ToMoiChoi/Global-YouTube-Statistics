-- Phân phối thu nhập
SELECT 
    CASE 
        WHEN highest_monthly_earnings < 1000 THEN 'Dưới $1,000'
        WHEN highest_monthly_earnings < 10000 THEN '$1,000 - $10,000'
        WHEN highest_monthly_earnings < 50000 THEN '$10,000 - $50,000'
        WHEN highest_monthly_earnings < 100000 THEN '$50,000 - $100,000'
        ELSE 'Trên $100,000'
    END AS earnings_bracket,
    COUNT(*) AS channel_count,
    AVG(subscribers) AS avg_subscribers,
    AVG(video_views) AS avg_views
FROM youtubers 
WHERE highest_monthly_earnings > 0
GROUP BY earnings_bracket
ORDER BY MIN(highest_monthly_earnings);

-- Tương quan subscribers và thu nhập
SELECT 
    CASE 
        WHEN subscribers < 100000 THEN 'Dưới 100K'
        WHEN subscribers < 1000000 THEN '100K - 1M'
        WHEN subscribers < 10000000 THEN '1M - 10M'
        WHEN subscribers < 50000000 THEN '10M - 50M'
        ELSE 'Trên 50M'
    END AS subscriber_tier,
    COUNT(*) AS channel_count,
    AVG(highest_monthly_earnings) AS avg_monthly_earnings,
    AVG(video_views::numeric / subscribers) AS engagement_ratio
FROM youtubers 
GROUP BY subscriber_tier
ORDER BY MIN(subscribers);