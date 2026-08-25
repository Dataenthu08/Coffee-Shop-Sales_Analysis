/*============================================================
Project : Coffee Shop Sales Analysis
File    : 02_Basic_Business_KPIs.sql
Purpose : Calculate overall business KPIs
Author  : Biki Jana
============================================================*/

USE CoffeeShopSales;

/*------------------------------------------------------------
Business Question 1
What is the total revenue generated?
------------------------------------------------------------*/

SELECT
SUM(transaction_qty * unit_price) AS Total_Revenue
FROM coffee_shop_sales;

/*------------------------------------------------------------
Business Question 2
How many transactions occurred?
------------------------------------------------------------*/

SELECT
COUNT(*) AS Total_Transactions
FROM coffee_shop_sales;


/*------------------------------------------------------------
Business Question 3
How many items were sold?
------------------------------------------------------------*/

SELECT
SUM(transaction_qty) AS Total_Items_Sold
FROM coffee_shop_sales;


/*------------------------------------------------------------
Business Question 4
What is the average order value?
------------------------------------------------------------*/

SELECT
SUM(transaction_qty * unit_price)/ COUNT(*) AS Average_Order_Value
FROM coffee_shop_sales;


/*------------------------------------------------------------
Business Question 5
What is the average unit price?
------------------------------------------------------------*/

SELECT
AVG(unit_price) AS Average_Unit_Price
FROM coffee_shop_sales;