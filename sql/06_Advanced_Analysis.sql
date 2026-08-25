/*============================================================
Project : Coffee Shop Sales Analysis
File    : 06_Advanced_Analysis.sql
Purpose : Perform advanced business analysis using CTEs,
          Window Functions and Ranking.
Author  : Biki Jana
============================================================*/

USE CoffeeShopSales;

--------------------------------------------------------------
-- Business Scenario
--
-- The executive management team wants deeper insights into
-- sales performance beyond basic KPIs. They want to identify
-- top-performing products, monthly trends, revenue contribution,
-- and cumulative sales to support strategic business decisions.
--------------------------------------------------------------


--------------------------------------------------------------
-- Business Request 1
-- Identify Top 5 Revenue Generating Products
--------------------------------------------------------------

SELECT TOP 5
    product_detail,
    SUM(transaction_qty * unit_price) AS Revenue
FROM coffee_shop_sales
GROUP BY product_detail
ORDER BY Revenue DESC;


--------------------------------------------------------------
-- Business Request 2
-- Rank Products by Revenue
--------------------------------------------------------------

SELECT
    product_detail,
    SUM(transaction_qty * unit_price) AS Revenue,
    RANK() OVER
    (
        ORDER BY SUM(transaction_qty * unit_price) DESC
    ) AS Revenue_Rank
FROM coffee_shop_sales
GROUP BY product_detail;


--------------------------------------------------------------
-- Business Request 3
-- Top Revenue Product in Every Store
--------------------------------------------------------------

WITH Store_Product_Rank AS
(
    SELECT
        store_location,
        product_detail,
        SUM(transaction_qty * unit_price) AS Revenue,

        ROW_NUMBER() OVER
        (
            PARTITION BY store_location
            ORDER BY SUM(transaction_qty * unit_price) DESC
        ) AS Revenue_Rank

    FROM coffee_shop_sales

    GROUP BY
        store_location,
        product_detail
)

SELECT
    store_location,
    product_detail,
    Revenue
FROM Store_Product_Rank
WHERE Revenue_Rank = 1
ORDER BY store_location;


--------------------------------------------------------------
-- Business Request 4
-- Running Revenue by Month
--------------------------------------------------------------

WITH Monthly_Revenue AS
(
    SELECT
        MONTH(transaction_date) AS Month_Number,
        DATENAME(MONTH, transaction_date) AS Month_Name,
        SUM(transaction_qty * unit_price) AS Revenue
    FROM coffee_shop_sales
    GROUP BY
        MONTH(transaction_date),
        DATENAME(MONTH, transaction_date)
)

SELECT
    Month_Number,
    Month_Name,
    Revenue,

    SUM(Revenue) OVER
    (
        ORDER BY Month_Number
    ) AS Running_Revenue

FROM Monthly_Revenue
ORDER BY Month_Number;


--------------------------------------------------------------
-- Business Request 5
-- Revenue Contribution of Each Product
--------------------------------------------------------------

SELECT
    product_detail,

    SUM(transaction_qty * unit_price) AS Revenue,

    ROUND
    (
        100.0 *
        SUM(transaction_qty * unit_price)
        /
        SUM(SUM(transaction_qty * unit_price)) OVER(),
        2
    ) AS Revenue_Percentage

FROM coffee_shop_sales

GROUP BY product_detail

ORDER BY Revenue DESC;


--------------------------------------------------------------
-- Business Request 6
-- Monthly Revenue Growth
--------------------------------------------------------------

WITH Monthly_Revenue AS
(
    SELECT
        MONTH(transaction_date) AS Month_Number,
        DATENAME(MONTH, transaction_date) AS Month_Name,
        SUM(transaction_qty * unit_price) AS Revenue
    FROM coffee_shop_sales
    GROUP BY
        MONTH(transaction_date),
        DATENAME(MONTH, transaction_date)
)

SELECT

    Month_Number,

    Month_Name,

    Revenue,

    LAG(Revenue) OVER
    (
        ORDER BY Month_Number
    ) AS Previous_Month_Revenue,

    Revenue -
    LAG(Revenue) OVER
    (
        ORDER BY Month_Number
    ) AS Revenue_Growth

FROM Monthly_Revenue

ORDER BY Month_Number;