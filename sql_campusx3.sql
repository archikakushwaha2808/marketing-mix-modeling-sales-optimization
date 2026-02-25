-- SQL GROUPING/SORTING
-- SORTING DATA
-- Q1)FIND TOP 5 SAMSUNG SMARTPHONES WITH BIGGEST SCREEN SIZE
SELECT model,screen_size FROM archika.smartphones WHERE brand_name='samsung'
ORDER BY screen_size DESC LIMIT 5;

-- Q2)SORT ALL THE PHONES IN DESCENDING ORDER OF NUMBERS OF TOTAL CAMERAS
SELECT model, (num_front_cameras +num_rear_cameras) AS 'Total_Cameras'
FROM archika.smartphones
ORDER BY Total_Cameras DESC;

-- Q3)SORT DATA ON THE BASIS OF PPI IN DESCREASING ORDER
SELECT model, 
ROUND(SQRT(resolution_width*resolution_width  + resolution_height*resolution_height)/screen_size,2) AS ppi 
FROM archika.smartphones
ORDER BY ppi DESC;

-- Q4)FIND THE PHONE WITH 2 nd LARGEST BATTERY
SELECT model,battery_capacity from archika.smartphones
ORDER BY battery_capacity DESC LIMIT 1,1;

SELECT model,battery_capacity from archika.smartphones
ORDER BY battery_capacity DESC LIMIT 4,1;

SELECT model,battery_capacity from archika.smartphones
ORDER BY battery_capacity DESC LIMIT 3,2;

-- SECOND LOWEST BATTERY CAPACITY 
SELECT model,battery_capacity from archika.smartphones
ORDER BY battery_capacity ASC LIMIT 1,1 ; 

-- Q5)FIND THE NAME AND RATING OF THE WORST RATED APPLE PHONE
SELECT model ,rating
FROM archika.smartphones WHERE brand_name='apple'
ORDER BY rating ASC LIMIT 1;

-- SORTING ON BASIS OF 2 COLUMMNS
-- Q6) SORT PHONES ALPHABETICALLY AND THEN ON THE BASIS OF RATING IN DESC ORDER
SELECT * FROM archika.smartphones 
ORDER BY brand_name ASC,rating DESC;

-- Q7)-- Q6) SORT PHONES ALPHABETICALLY AND THEN ON THE BASIS OF PRICE IN ASC ORDER
SELECT * FROM archika.smartphones 
ORDER BY brand_name ASC,price ASC;

-- GROUPING DATA
-- Q1) GROUP SMARTPHONES BY BRAND AND GET THE COUNT,AVERAGE PRICE<MAX RATING,AVG SCREEN SIZE AND AVG BATTERY CAPACITY
SELECT brand_name, COUNT(*) AS 'num_phones',
ROUND(AVG(price)) AS 'avg price',
MAX(rating) AS 'max rating',
ROUND(AVG(screen_size),2) AS 'avg screen size',
ROUND(AVG(battery_capacity)) AS 'avg battery capacity'
FROM archika.smartphones
GROUP BY brand_name
ORDER BY num_phones DESC LIMIT 15;

-- Q2)GROUP SMARTPHONES BY WHETHER THEY HAVE AN NFC AND GET THE AVERAGE PRICE AND RATING
SELECT has_nfc ,
AVG(price) AS 'avg price',
AVG(rating) AS 'avg rating'
FROM archika.smartphones
GROUP BY has_nfc;

-- Q3)GROUP SMARTPHONES BY THE EXTENDED MEMORY AVAILABLE AND GET THE AVERAGE PRICE
SELECT extended_memory_available,
AVG(price) AS 'price'
FROM archika.smartphones
GROUP BY extended_memory_available;

-- Q4)GROUP SMARTPHONES BY THE BRAND AND PROCESSOR BRAND AND GET THE COUNT OF MODELS AND THE AVERAGE PRIMARY CAMERA RESOLUTION(REAR)
SELECT brand_name,processor_brand,
COUNT(*) AS 'num phones',
ROUND(AVG(primary_camera_rear),2) AS 'avg camera resolution'
FROM archika.smartphones
GROUP BY brand_name,processor_brand;

-- Q5) FIND TOP 5 MOST COSTLY BRANDS
SELECT brand_name,AVG(price) AS 'avg_price'
FROM archika.smartphones
GROUP BY brand_name
ORDER BY avg_price DESC LIMIT 5;

-- Q6) WHICH BRAND MAKES THE SMALLEST SCREEN SMARTPHONES
SELECT brand_name,AVG(screen_size) AS 'avg_screen_size'
FROM archika.smartphones
GROUP BY brand_name
ORDER BY avg_screen_size ASC lIMIT 1;

-- Q7)AVG PRICE OF 5G PHONES VS AVG PRICE OF NON 5G PHONES
SELECT has_5g,AVG(price) AS 'avg_price'
FROM archika.smartphones
GROUP BY has_5g;

-- Q8)GROUP SMARTPHONES BY THE BRAND AND FIND THE BRAND WITH THE HIGHEST NUMBER OF MODELS THAT HAVE BOTH NFC AND IR BLASTER
SELECT brand_name, COUNT(*) AS 'count'
FROM archika.smartphones
WHERE has_nfc= 'True' AND has_ir_blaster='True'
GROUP BY brand_name
ORDER BY count DESC LIMIT 1;

-- Q9) FIND ALL SAMSUNG 5G ENABLE SMARTPHONES AND FIND OUT THE AVG PRICE OF NFC AND NON NFC PHONES
SELECT has_nfc,AVG(price) AS 'avg_price'
FROM archika.smartphones 
WHERE brand_name='samsung'
GROUP BY has_nfc;

-- Q10) FIND THE NAME AND PRICE OF COSTLIEST PHONE
SELECT model,price FROM archika.smartphones 
ORDER BY price DESC LIMIT 1;

-- HAVING CLAUSE
-- Q11) FIND THE AVG RATING OF SMARTPHONES BRANDS WHICH HAVE MORE THAN 20 PHONES
SELECT brand_name,
COUNT(*) As 'count' ,
AVG(rating) AS 'avg_rating'
FROM archika.smartphones
GROUP BY brand_name
HAVING count>20
ORDER BY avg_rating;

-- AVG PRICE 
SELECT brand_name,
COUNT(*) As 'count' ,
AVG(price) AS 'avg_price'
FROM archika.smartphones
GROUP BY brand_name
HAVING count>20
ORDER BY avg_price;

-- Q12)FIND THE TOP 3 BRANDS WITH THE HIGHEST AVG RAM THAT HAVE A REFRESH RATE OF ATLEAST 90 HZ AND FAST CHARGING AVAILABLE AND DONT CONSIDER BRANDS WHICH HAVE LESS THAN 10 PHONES
SELECT brand_name,
AVG(ram_capacity) AS 'avg_ram',
COUNT(*) AS 'count'
FROM archika.smartphones
WHERE refresh_rate>90 AND fast_charging_available=1
GROUP BY brand_name
HAVING count>10
ORDER BY avg_ram DESC LIMIT 3;

-- Q13)FIND THE AVG PRICE OF ALL THE PHONES BRANDS WITH AVG RATING>70 AND NO OF PHONES MORE THAN 10 AMONG ALL 5G ENABLED PHONES
SELECT brand_name,
AVG(price) AS 'avg_price'
FROM archika.smartphones
WHERE has_5g='True'
GROUP BY brand_name
HAVING AVG(rating)>70 AND COUNT(*)>10
ORDER BY avg_price;

-- IPL DATASET

SELECT * FROM archika.ipl;

-- Q1) FIND THE TOP 5 BATSMAN IN IPL
SELECT batter, SUM(batsman_run) AS 'total_runs'
FROM archika.ipl
GROUP BY batter
ORDER BY total_runs DESC LIMIT 5;

-- Q2)FIND THE SECOND HIGHEST 6 HITTER IN IPL
SELECT batter,COUNT(*) AS 'num_sixes'
FROM archika.ipl
WHERE batsman_run=6
GROUP BY batter
ORDER BY num_sixes DESC LIMIT 1,1;

-- Q3)FIND VIRAT KOHLI PERFORMANCE AGAINST ALL IPL TEAMS
-- INFO NOT AVAILABLE

-- Q4) FIND TOP 10 BATSMAN WITH CENTURIES IN IPL
SELECT batter,ID,SUM(batsman_run) AS 'total_runs'
FROM archika.ipl
GROUP BY batter,ID
HAVING total_runs>=100
ORDER BY batter DESC;



-- Q5) FIND THE TOP 5 BATSMAN WITH HIGHEST STRIKE RATE WHO HAVE PLAYED A MIN OF 100 BALLS
SELECT batter,SUM(batsman_run),COUNT(batsman_run),
ROUND((SUM(batsman_run)/COUNT(batsman_run))*100,2) AS 'SR'
FROM archika.ipl
GROUP BY batter
HAVING COUNT(batsman_run)>1000
ORDER BY SR DESC LIMIT 5;
