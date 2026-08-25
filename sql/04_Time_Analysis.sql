/*============================================================
Project : Coffee Shop Sales Analysis
File    : 04_Time_Analysis.sql
Purpose : Analyze sales trends across hours, weekdays and months.
Author  : Biki Jana
============================================================*/

USE CoffeeShopSales;

--------------------------------------------------------------
-- Business Request:
-- Identify revenue generated during each hour of the day.
--------------------------------------------------------------

SELECT
    DATEPART(HOUR, transaction_time) AS Hour_of_Day,
    SUM(transaction_qty * unit_price) AS Revenue
FROM coffee_shop_sales
GROUP BY DATEPART(HOUR, transaction_time)
ORDER BY Hour_of_Day;

--------------------------------------------------------------
-- Business Request:
-- Count the number of transactions during each hour.
--------------------------------------------------------------

SELECT
    DATEPART(HOUR, transaction_time) AS Hour_of_Day,
    COUNT(*) AS Total_Transactions
FROM coffee_shop_sales
GROUP BY DATEPART(HOUR, transaction_time)
ORDER BY Hour_of_Day;

--------------------------------------------------------------
-- Business Request:
-- Calculate monthly revenue.
--------------------------------------------------------------

SELECT
    MONTH(transaction_date) AS Month_Number,
    DATENAME(MONTH, transaction_date) AS Month_Name,
    SUM(transaction_qty * unit_price) AS Revenue
FROM coffee_shop_sales
GROUP BY
    MONTH(transaction_date),
    DATENAME(MONTH, transaction_date)
ORDER BY Month_Number;

--------------------------------------------------------------
-- Business Request:
-- Compare Weekday vs Weekend revenue.
--------------------------------------------------------------

SELECT
    CASE
        WHEN DATENAME(WEEKDAY, transaction_date) IN ('Saturday','Sunday')
            THEN 'Weekend'
        ELSE 'Weekday'
    END AS Day_Type,
    CAST(SUM(transaction_qty * unit_price) AS DECIMAL(12,2)) AS Revenue
FROM coffee_shop_sales
GROUP BY
    CASE
        WHEN DATENAME(WEEKDAY, transaction_date) IN ('Saturday','Sunday')
            THEN 'Weekend'
        ELSE 'Weekday'
    END;

--------------------------------------------------------------
-- Business Request:
-- Analyze revenue by time period.
--------------------------------------------------------------

SELECT
    CASE
        WHEN DATEPART(HOUR, transaction_time) BETWEEN 6 AND 11 THEN 'Morning'
        WHEN DATEPART(HOUR, transaction_time) BETWEEN 12 AND 16 THEN 'Afternoon'
        WHEN DATEPART(HOUR, transaction_time) BETWEEN 17 AND 20 THEN 'Evening'
        ELSE 'Night'
    END AS Time_Period,

    CAST(SUM(transaction_qty * unit_price) AS DECIMAL(12,2)) AS Revenue

FROM coffee_shop_sales

GROUP BY
    CASE
        WHEN DATEPART(HOUR, transaction_time) BETWEEN 6 AND 11 THEN 'Morning'
        WHEN DATEPART(HOUR, transaction_time) BETWEEN 12 AND 16 THEN 'Afternoon'
        WHEN DATEPART(HOUR, transaction_time) BETWEEN 17 AND 20 THEN 'Evening'
        ELSE 'Night'
    END

ORDER BY Revenue DESC;