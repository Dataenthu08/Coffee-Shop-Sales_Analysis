/*============================================================
Project : Coffee Shop Sales Analysis
File    : 01_Data_Validation.sql
Purpose : Validate imported data
Author  : Biki Jana
============================================================*/



USE CoffeeShopSales;


/*------------------------------------------------------------
Business Question 1
How many records are present in the table?
------------------------------------------------------------*/

SELECT COUNT(*) AS Total_Rows
FROM coffee_shop_sales;


/*------------------------------------------------------------
Business Question 2
Check for NULL Transaction IDs
------------------------------------------------------------*/

SELECT *
FROM coffee_shop_sales
WHERE transaction_id IS NULL;


/*------------------------------------------------------------
Business Question 3
Check the date range
------------------------------------------------------------*/

SELECT
MIN(transaction_date) AS Start_Date,
MAX(transaction_date) AS End_Date
FROM coffee_shop_sales;


/*------------------------------------------------------------
Business Question 4
Count unique store locations
------------------------------------------------------------*/

SELECT COUNT(DISTINCT store_location) AS Total_Stores
FROM coffee_shop_sales;


/*------------------------------------------------------------
Business Question 5
Count product categories
------------------------------------------------------------*/

SELECT COUNT(DISTINCT product_category) AS Total_Categories
FROM coffee_shop_sales;


/*------------------------------------------------------------
Business Question 6
Count product types
------------------------------------------------------------*/

SELECT COUNT(DISTINCT product_type) AS Total_Product_Types
FROM coffee_shop_sales;
