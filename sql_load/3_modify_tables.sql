COPY youtubers 
FROM 'C:\Users\viett\OneDrive - Thang Long University\Desktop\Sql_learn\Nashville Housing Data for Data Cleaning\Global YouTube Statistics.csv' 
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');