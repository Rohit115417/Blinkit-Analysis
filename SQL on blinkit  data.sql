-- Select the Blinkit database
USE blinkit;

-- ===== Renaming columns for consistency =====
ALTER TABLE blin
CHANGE `Outlet Establishment Year` Outlet_Establishment_Year INT;

ALTER TABLE blin
CHANGE `Item Type` Item_Type VARCHAR(100);

ALTER TABLE blin
CHANGE `Outlet Location Type` Outlet_Location_Type VARCHAR(100);

ALTER TABLE blin
CHANGE `Outlet Size` Outlet_Size VARCHAR(50);

ALTER TABLE blin
CHANGE `Outlet Type` Outlet_Type VARCHAR(50);

-- ===== Cleaning Item_Fat_Content values =====
UPDATE blin
SET Item_Fat_Content = CASE 
    WHEN Item_Fat_Content IN ('LF', 'low fat') THEN 'Low Fat'
    WHEN Item_Fat_Content = 'reg' THEN 'Regular'
    ELSE Item_Fat_Content
END;

-- ===== Basic Checks =====
SELECT * FROM blin;
SELECT DISTINCT Item_Fat_Content FROM blin;

-- ===== Overall Sales & Count =====
SELECT CAST(SUM(Sales) / 1000000 AS DECIMAL(10,2)) AS total_sales FROM blin;
SELECT CAST(AVG(Sales) AS DECIMAL(10,0)) AS avg_sales FROM blin;
SELECT COUNT(*) AS total_items FROM blin;

-- ===== Sales Stats for Year 2022 =====
SELECT CAST(SUM(Sales) / 1000000 AS DECIMAL(10,2)) AS total_sales
FROM blin
WHERE Outlet_Establishment_Year = 2022;

SELECT CAST(AVG(Sales) AS DECIMAL(10,0)) AS avg_sales
FROM blin
WHERE Outlet_Establishment_Year = 2022;

SELECT COUNT(*) AS total_items
FROM blin
WHERE Outlet_Establishment_Year = 2022;

SELECT CAST(AVG(Rating) AS DECIMAL(10,2)) AS avg_rating
FROM blin
WHERE Outlet_Establishment_Year = 2022;

-- ===== Group by Item_Fat_Content =====
SELECT Item_Fat_Content,
       CAST(SUM(Sales) / 1000 AS DECIMAL(10,2)) AS total_sales,
       CAST(AVG(Sales) AS DECIMAL(10,0)) AS avg_sales,
       CAST(AVG(Rating) AS DECIMAL(10,2)) AS avg_rating,
       COUNT(*) AS no_of_items
FROM blin
GROUP BY Item_Fat_Content;

-- ===== Top 5 Item Types by Sales =====
SELECT Item_Type,
       CAST(SUM(Sales) AS DECIMAL(10,2)) AS total_sales,
       CAST(AVG(Sales) AS DECIMAL(10,0)) AS avg_sales,
       CAST(AVG(Rating) AS DECIMAL(10,2)) AS avg_rating,
       COUNT(*) AS no_of_items
FROM blin
GROUP BY Item_Type
ORDER BY total_sales DESC
LIMIT 5;

-- ===== Outlet_Location_Type with Item_Fat_Content =====
SELECT Outlet_Location_Type, Item_Fat_Content,
       CAST(SUM(Sales) AS DECIMAL(10,2)) AS total_sales,
       CAST(AVG(Sales) AS DECIMAL(10,0)) AS avg_sales,
       CAST(AVG(Rating) AS DECIMAL(10,2)) AS avg_rating,
       COUNT(*) AS no_of_items
FROM blin
GROUP BY Outlet_Location_Type, Item_Fat_Content
ORDER BY total_sales ASC;

-- ===== Year-wise Summary =====
SELECT Outlet_Establishment_Year,
       CAST(SUM(Sales) AS DECIMAL(10,2)) AS total_sales,
       CAST(AVG(Sales) AS DECIMAL(10,2)) AS avg_sales,
       COUNT(*) AS no_of_items,
       CAST(AVG(Rating) AS DECIMAL(10,2)) AS avg_rating
FROM blin
GROUP BY Outlet_Establishment_Year
ORDER BY total_sales ASC;

-- ===== Sales Percentage by Outlet_Size =====
SELECT Outlet_Size,
       CAST(SUM(Sales) AS DECIMAL(10,2)) AS total_sales,
       CAST(SUM(Sales) * 100 / SUM(SUM(Sales)) OVER() AS DECIMAL(10,2)) AS sales_percentage
FROM blin
GROUP BY Outlet_Size
ORDER BY total_sales ASC;

-- ===== Summary by Outlet_Location_Type =====
SELECT Outlet_Location_Type,
       CAST(SUM(Sales) AS DECIMAL(10,2)) AS total_sales,
       CAST(AVG(Sales) AS DECIMAL(10,2)) AS avg_sales,
       COUNT(*) AS no_of_items,
       CAST(AVG(Rating) AS DECIMAL(10,2)) AS avg_rating
FROM blin
GROUP BY Outlet_Location_Type
ORDER BY total_sales ASC;

-- ===== Summary by Outlet_Type =====
SELECT Outlet_Type,
       CAST(SUM(Sales) AS DECIMAL(10,2)) AS total_sales,
       CAST(AVG(Sales) AS DECIMAL(10,2)) AS avg_sales,
       CAST(SUM(Sales) * 100 / SUM(SUM(Sales)) OVER() AS DECIMAL(10,2)) AS sales_percentage,
       COUNT(*) AS no_of_items,
       CAST(AVG(Rating) AS DECIMAL(10,2)) AS avg_rating
FROM blin
GROUP BY Outlet_Type
ORDER BY total_sales ASC;
