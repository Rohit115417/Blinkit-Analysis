# Blinkit-Analysis

## Project Overview

This project focuses on analyzing Blinkit’s outlet sales data using Python, MySQL, and Power BI.
The goal is to clean and transform raw data, perform exploratory data analysis (EDA), and create an interactive dashboard to track sales performance, product categories, outlet distribution, and key sales KPIs.

## Tools & Technologies Used

Python → Data cleaning, transformation, and EDA

Libraries: Pandas, NumPy, Matplotlib, Seaborn

MySQL → Executing queries for data merging, filtering, and aggregation

Power BI → Interactive dashboard creation for business insights

## KPIs Used

No. of Items – Total products available.

Total Sales – Overall sales generated.

Average Rating – Customer rating across items.

Average Sales per Item – Sales efficiency per product.

Sales by Fat Content – Revenue contribution by Low Fat vs Regular products.

Sales by Item Type – Performance of different product categories.

Sales by Outlet Size – Impact of outlet capacity on sales.

Sales by Outlet Location Type – Tier-wise sales contribution.

Sales by Outlet Type – Grocery store vs supermarket performance.

Outlet Establishment Trend – Sales trend by outlet opening year.

## Project Workflow

1️ Data Cleaning & Transformation (Python)

Removed missing and duplicate entries.
Standardized product categories and outlet details.
Converted sales and item count columns to numeric formats.

2️ MySQL Data Operations

Used SQL queries to filter outlets by size and location.
Aggregated sales by product type and outlet type.
Merged datasets for Power BI import.

3️ Exploratory Data Analysis (EDA)

Identified top-selling categories like Fruits & Vegetables, Snack Foods, and Household products.
Analyzed customer preference for Regular fat products over Low Fat.
Observed outlet sales distribution by size and location.

4️ Power BI Dashboard Creation

Designed a clean, filterable dashboard with multiple views:
Overall KPIs (Items, Sales, Ratings)
Category Sales Analysis
Outlet Type & Size Analysis
Yearly Establishment Sales Trend
Added slicers for Outlet Location, Outlet Size, and Item Type.

## Dashboard Preview
<img width="1290" height="712" alt="Screenshot 2025-08-12 092126" src="https://github.com/user-attachments/assets/be93ae96-3716-445a-8d82-0b92b04264dc" />


## Insights & Key Findings

Overall Sales: 336.4K from 2K items with an average rating of 4.

Top Categories:

Fruits & Vegetables lead in sales, followed by Snack Foods and Household items.

Fat Content Impact:

Regular fat products (215K) outperform Low Fat products (121K) in sales.

Outlet Type Performance:

Supermarket Type 1 dominates with 262.59K in sales compared to Grocery Stores (73.81K).

Outlet Size & Location:

Medium outlets (205.92K) outperform small outlets (130.48K).

Tier 1 locations generate 100% of the sales in the dataset.

Establishment Trend:

Sales peaked in 2016 before declining sharply by 2018.

## Business Recommendations
Focus inventory and marketing on Regular fat products and top-selling categories.

Expand Supermarket Type 1 model into more Tier 1 and Tier 2 cities.

Investigate the sales drop after 2016 to identify operational issues.

Improve performance of low-selling categories like Seafood and Breakfast items.
