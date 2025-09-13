-- Create table with TEXT columns for problematic fields
CREATE TABLE youtubers (
    rank TEXT,
    youtuber VARCHAR(255),
    subscribers NUMERIC,
    video_views NUMERIC,
    category VARCHAR(100),
    title VARCHAR(255),
    uploads TEXT,
    country VARCHAR(100),
    abbreviation VARCHAR(10),
    channel_type VARCHAR(100),
    video_views_rank TEXT,
    country_rank TEXT,
    channel_type_rank TEXT,
    video_views_for_the_last_30_days NUMERIC,
    lowest_monthly_earnings NUMERIC(12,2),
    highest_monthly_earnings NUMERIC(12,2),
    lowest_yearly_earnings NUMERIC(12,2),
    highest_yearly_earnings NUMERIC(12,2),
    subscribers_for_last_30_days TEXT,
    created_year TEXT,
    created_month VARCHAR(20),
    created_date TEXT,
    gross_tertiary_education_enrollment_percent NUMERIC(5,2),
    population NUMERIC,
    unemployment_rate NUMERIC(5,2),
    urban_population NUMERIC,
    latitude NUMERIC(10,6),
    longitude NUMERIC(10,6)
);
-- Update table if it have nan in the country fields
UPDATE youtubers
SET country = CASE 
    WHEN country = 'nan' THEN 'Nothing'
    ELSE country
END;