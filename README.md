# Coffee Shop Sales Analysis


## Project Overview

This project analyses **149K+ coffee shop transactions** to understand revenue performance, sales trends, store performance, and product-level contribution.

The analysis was carried out using **Excel, SQL, and Power BI**, with the goal of turning transaction-level data into clear business insights and an interactive dashboard.

## Dashboard Preview

<img width="1108" height="720" alt="executive_analysis" src="https://github.com/user-attachments/assets/b1fdec5e-6375-4177-b4ad-7b09a3f0223b" />

## Business Questions

The analysis focuses on questions such as:

* How is revenue changing over time?
* Which store locations generate the most revenue?
* Which product categories contribute the most to sales?
* Which products are the top revenue contributors?
* What does the overall sales performance look like?

## Key Performance Indicators

| KPI | Value |
|---|---:|
| Total Revenue | **$698,812.33** |
| Total Transactions | **149,116** |
| Total Items Sold | **214,470** |
| Average Order Value | **$4.69** |
| Average Unit Price | **$3.38** |


## Analysis

### 1. Revenue Trend

Monthly revenue was analysed to identify changes in sales performance over time and understand the overall revenue trend.

### 2. Store Performance

Revenue was compared across store locations to identify the highest and lowest performing stores.

### 3. Product Category Analysis

Revenue contribution was analysed across product categories to understand which categories drive overall sales.

### 4. Top Products

The Top 10 products were identified based on revenue contribution to understand which individual products have the strongest impact on sales.

## Tools & Technologies

* **Excel** - Data cleaning
* **SQL** — Data analysis and querying
* **Power BI** — Dashboard development and visualization
* **DAX** — Measures and KPI calculations
* **Power Query** — Data preparation and transformation
* **GitHub** — Project documentation and version control

## Dataset

The dataset contains **149,116 transaction records** and 11 columns.

Key fields include:

* `transaction_id`
* `transaction_date`
* `transaction_time`
* `transaction_qty`
* `store_id`
* `store_location`
* `product_id`
* `unit_price`
* `product_category`
* `product_type`
* `product_detail`

The dataset was checked for missing values and duplicate records before analysis.

**Analysis Period:** January 2023 – June 2023

## Key Takeaways

The analysis provides a consolidated view of coffee shop sales performance across time, stores, categories, and products.

The dashboard can be used by business teams to quickly identify revenue trends, compare store performance, and understand the products and categories contributing to sales.

## Key Findings

- **June recorded the highest monthly revenue at approximately $166K**, while February was the lowest at approximately $76K. June revenue was more than twice February revenue, showing a strong increase in sales over the six-month period.

- **Hell's Kitchen was the highest-revenue store**, generating approximately **$236K** in revenue. The three stores were relatively close in overall performance, indicating that revenue was not concentrated in a single location.

- **Coffee was the largest revenue-generating product category**, contributing approximately **$270K** in sales. Tea and Bakery followed as the next major contributors.

- **Sustainably Grown Lg was the top individual product by revenue**, generating approximately **$22K** during the analysis period.

- **10 AM was the busiest sales hour**, with approximately **18K transactions**, while 8 PM had only around **600 transactions**. This shows a clear concentration of sales during daytime hours.

- **Coffee Beans had a significantly higher average order value than the overall business average**, with an AOV of approximately **$22 compared with the overall $4.69**. This indicates that although coffee beans may have lower transaction volume, they generate substantially higher-value purchases.

- **Revenue increased substantially through the first half of 2023**, with the strongest performance occurring toward the later months of the analysis period.



## Note: 

Monetary values are presented in the currency used in the source dataset.

## Project Goal

The objective of this project was to demonstrate an end-to-end **Data Analyst workflow**:

**Raw Data → Data Preparation → SQL Analysis → Power BI Dashboard → Business Insights**



## Power BI Dashboards

The Power BI report contains four pages covering overall performance, product performance, store performance, and time-based sales patterns.


### Product Analysis

<img width="1105" height="725" alt="product_analysis" src="https://github.com/user-attachments/assets/e7438997-8f66-4aa7-90ce-7e25e6779906" />


### Store Analysis

<img width="1091" height="722" alt="store_analysis" src="https://github.com/user-attachments/assets/2f50cb84-e973-4632-a280-ee2c32be90aa" />


### Time Analysis

<img width="1287" height="725" alt="time_analysis" src="https://github.com/user-attachments/assets/0713f80e-fead-4811-989f-23755fcaf921" />
