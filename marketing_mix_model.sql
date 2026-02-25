CREATE DATABASE mmm_project;
USE mmm_project;



-- 1) Average Spend
SELECT 
    AVG(TV) AS avg_tv,
    AVG(Radio) AS avg_radio,
    AVG(Newspaper) AS avg_newspaper,
    AVG(Sales) AS avg_sales
FROM advertising;



-- 2) Total Marketing Spend
SELECT 
    SUM(TV + Radio + Newspaper) AS total_marketing_spend
FROM advertising;



-- 3) Which Channel Has Highest Average Spend?
SELECT 
    'TV' AS channel, AVG(TV) AS avg_spend FROM advertising
UNION
SELECT 
    'Radio', AVG(Radio) FROM advertising
UNION
SELECT 
    'Newspaper', AVG(Newspaper) FROM advertising
ORDER BY avg_spend DESC;


-- 4) Correlation Approximation
SELECT 
    (AVG(TV * Sales) - AVG(TV) * AVG(Sales)) /
    (STDDEV(TV) * STDDEV(Sales)) AS corr_tv_sales
FROM advertising;


-- 5) High Sales vs Low Sales Comparison
SELECT 
    CASE 
        WHEN Sales > (SELECT AVG(Sales) FROM advertising)
        THEN 'High Sales'
        ELSE 'Low Sales'
    END AS sales_category,
    COUNT(*) AS total_records
FROM advertising
GROUP BY sales_category;


-- 6) ROI Approximation in SQL
SELECT 
    SUM(Sales) / SUM(TV) AS tv_roi,
    SUM(Sales) / SUM(Radio) AS radio_roi,
    SUM(Sales) / SUM(Newspaper) AS newspaper_roi
FROM advertising;



-- 7) Top 10 Highest Sales Weeks
SELECT *
FROM advertising
ORDER BY Sales DESC
LIMIT 10;



-- 8) Spend Segmentation
SELECT 
    CASE
        WHEN TV > 200 THEN 'High TV Spend'
        WHEN TV BETWEEN 100 AND 200 THEN 'Medium TV Spend'
        ELSE 'Low TV Spend'
    END AS tv_segment,
    AVG(Sales) AS avg_sales
FROM advertising
GROUP BY tv_segment
ORDER BY avg_sales DESC;



-- 9) Rank sales
SELECT 
    Sales,
    RANK() OVER (ORDER BY Sales DESC) AS sales_rank
FROM advertising;



-- 10) Percent Contribution of Each Channel
SELECT
    SUM(TV) / SUM(TV + Radio + Newspaper) * 100 AS tv_percent,
    SUM(Radio) / SUM(TV + Radio + Newspaper) * 100 AS radio_percent,
    SUM(Newspaper) / SUM(TV + Radio + Newspaper) * 100 AS newspaper_percent
FROM advertising;



-- 11) Sales Bucketing (Segmentation)
SELECT
    CASE
        WHEN Sales >= 20 THEN 'High Sales'
        WHEN Sales BETWEEN 10 AND 20 THEN 'Medium Sales'
        ELSE 'Low Sales'
    END AS sales_segment,
    COUNT(*) AS total_records
FROM advertising
GROUP BY sales_segment;



-- 12) Identify Best Channel Based on ROI
SELECT 'TV' AS Channel, SUM(Sales)/SUM(TV) AS ROI FROM advertising
UNION
SELECT 'Radio', SUM(Sales)/SUM(Radio) FROM advertising
UNION
SELECT 'Newspaper', SUM(Sales)/SUM(Newspaper) FROM advertising
ORDER BY ROI DESC;











