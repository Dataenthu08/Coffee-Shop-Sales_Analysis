/*============================================================
Project : Coffee Shop Sales Analysis
File    : 03_Product_Analysis.sql
Purpose : Analyze product performance and identify top and
          bottom performing products and categories.
Author  : Biki Jana
============================================================*/

USE CoffeeShopSales;

--------------------------------------------------------------
-- Business Question 1
-- Which products generate the highest revenue?
--------------------------------------------------------------

SELECT
    product_detail,
    SUM(transaction_qty * unit_price) AS Revenue
FROM coffee_shop_sales
GROUP BY product_detail
ORDER BY Revenue DESC;


--------------------------------------------------------------
-- Business Question 2
-- Which products sell the highest quantity?
--------------------------------------------------------------

SELECT
    product_detail,
    SUM(transaction_qty) AS Quantity_Sold
FROM coffee_shop_sales
GROUP BY product_detail
ORDER BY Quantity_Sold DESC;


--------------------------------------------------------------
-- Business Question 3
-- Which product categories generate the highest revenue?
--------------------------------------------------------------

SELECT
    product_category,
    SUM(transaction_qty * unit_price) AS Revenue
FROM coffee_shop_sales
GROUP BY product_category
ORDER BY Revenue DESC;


--------------------------------------------------------------
-- Business Question 4
-- Which product categories sell the highest quantity?
--------------------------------------------------------------

SELECT
product_category,
SUM(transaction_qty) AS Quantity_Sold
FROM coffee_shop_sales
GROUP BY product_category
ORDER BY Quantity_Sold DESC;


--------------------------------------------------------------
-- Business Question 5
-- Top 10 products by revenue
--------------------------------------------------------------

SELECT TOP 10
product_detail,
SUM(transaction_qty * unit_price) AS Revenue
FROM coffee_shop_sales
GROUP BY product_detail
ORDER BY Revenue DESC;


--------------------------------------------------------------
-- Business Question 6
-- Bottom 10 products by revenue
--------------------------------------------------------------

SELECT TOP 10
product_detail,
SUM(transaction_qty * unit_price) AS Revenue
FROM coffee_shop_sales
GROUP BY product_detail
ORDER BY Revenue;