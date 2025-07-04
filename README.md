# Ecom_Analysis_SQL_Excel_Project

## Project Overview

**Project Title**: Online-eCommerce Analysis and Dashboard
**Level**: Intermediate  
**Database**: `online_ecom`

This project showcases SQL and Excel skills applied to a Online eCommerce dataset. It answers key business questions using SQL queries involving aggregation, grouping, window functions, and CTEs and a Dashboard on this data. The project is designed as part of my data analyst portfolio.

## 📊 Dataset Overview
**Rows: 5,110**

**Valid entries: 5,095** (15 null entries need cleaning)

**Key Columns:**

`Order_Number`, `Order_Date`, `Status` – Order-level info

`Product`, `Category`, `Brand` – Product details

`Cost`, `Sales`, `Quantity`, `Total_Cost`, `Total_Sales` – Financial metrics

`State_Code`, `Customer_Name`, `Assigned Supervisor` – Customer/salesperson metadata

## 📊 Business Questions Answered using MySQL

-- Sales Performance Analysis

1. What is the total sales generated overall?

2. Which states generate the highest revenue?

3. Which categories and brands are top-selling by revenue or quantity?

4. Who are the top-performing supervisors based on total sales?

-- Product Analysis

5. Which products have the highest profit margins (Sales - Cost)?

6. What is the average order value (AOV)?

-- Customer Behavior

7. Top 5 customers who have made the highest number of orders or spent the most?

8. Which customers buy the highest quantity per order?

-- Time-based Insights

9. Monthly/weekly sales trends.

10. Which month had peak sales, and which had lowest?

-- Profitability

11. Which categories or brands have the highest/lowest total profit?

12. Identify loss-making orders (where cost > sales).


## Excel Dashboard having

1. 📆 Sales Trend by Month (Line/Column Chart)

2. 📍 Sales by State (Map Chart or Bar Chart)

3. 📦 Category-wise Sales & Profit (Stacked Column/Bar Chart)

4. 🛍️ Top 10 Products & Brands (Sorted Table/Chart)

5. 👤 Top Supervisors by Sales/Profit

6. 📈 KPIs:

	- Total Revenue

	- Total Orders

	- Average Order Value (AOV)

	- Profit Margin %

## 🛠️ Project Workflow

**Data Cleaning:**

	- Handle missing Order_Number, dates, costs, etc.

	- Transformed the Order_Date column to date format using power query editor

**Data Processing:**

	- Created new field: Total_Profit = Total_Sales - Total_Cost

**Data Analysis (SQL):**

	- Create and document queries for above problems

**Excel Dashboard:**

	- Imported the data using ODBC data sources from MySQL database and cleaned the data

	- Built a dynamic dashboard

## Data Analysis and Findings using SQL

-- **Sales Performance Analysis**

**1. What is the total sales generated overall?**
```sql
SELECT sum(Total_Sales) as Sales FROM ecommerce;
```

**2. Which states generate the highest revenue?**
```sql
SELECT 
    State_Code,
    COUNT(State_Code) AS Total_StateWise_Orders,
    SUM(Total_Sales) AS Total_Revenue
FROM
    ecommerce
GROUP BY State_Code
ORDER BY Total_Revenue DESC;
```

**3. Which categories and brands are top-selling by revenue or quantity?**
```sql
-- By Revenue
SELECT Category, Brand, sum(Total_Sales) as Revenue FROM ecommerce group by Category, Brand order by Revenue desc;
```

```sql
-- By Quantity
SELECT Category, Brand, sum(Quantity) as Quantity FROM ecommerce group by Category, Brand order by Quantity desc;
```

**4. Who are the top-performing supervisors based on total sales?**
```sql
SELECT 
    `Assigned Supervisor`, SUM(Total_Sales) AS Revenue
FROM
    ecommerce
GROUP BY `Assigned Supervisor`
ORDER BY Revenue DESC;
```

-- **Product Analysis**

**5. Which products have the highest profit margins (Sales - Cost)?**
```sql
SELECT 
    Product,
    COUNT(Quantity) AS Quantity_Sold,
    SUM(Total_Profit) AS Total_Profit
FROM
    ecommerce
GROUP BY Product
ORDER BY Total_Profit DESC;
```


**6. What is the average order value (AOV)?**
```sql
SELECT avg(Total_Sales) FROM ecommerce;
```

-- **Customer Behavior**

**7. Top 5 customers who have made the highest number of orders or spent the most?**
-- Based on number of orders
```sql
SELECT 
    Customer_Name, COUNT(Order_Number) AS Order_Count
FROM
    ecommerce
GROUP BY Customer_Name
ORDER BY Order_Count DESC
LIMIT 5;
```

-- Based on Total Spent
```sql
SELECT 
    Customer_Name, SUM(Total_Sales) AS Sale_Amount
FROM
    ecommerce
GROUP BY Customer_Name
ORDER BY Sale_Amount DESC
LIMIT 5;
```

**8. Which customers buy the highest quantity per order?**
```sql
SELECT 
    Customer_Name, MAX(Quantity) AS Max_Quantity_per_Order
FROM
    ecommerce
GROUP BY Customer_Name
ORDER BY Max_Quantity_per_Order DESC; 
```

-- **Time-based Insights**

**9. Monthly/weekly sales trends.**
```sql
SELECT 
    YEAR(Order_Date) AS Year_Name,
    MONTHNAME(Order_Date) AS Month_Name,
    COUNT(Order_Number) AS No_of_OrdersPer_Month,
    SUM(Total_Sales) AS Monthly_Revenue
FROM
    ecommerce
GROUP BY Year_Name , Month_Name
ORDER BY Monthly_Revenue DESC;
```

**10. Which month had peak sales, and which had lowest?**
```sql
SELECT 
    YEAR(Order_Date) AS Year_Name,
    MONTHNAME(Order_Date) AS Month_Name,
    COUNT(Order_Number) AS No_of_OrdersPer_Month,
    SUM(Total_Sales) AS Monthly_Revenue
FROM
    ecommerce
GROUP BY Year_Name , Month_Name
ORDER BY Monthly_Revenue DESC;
```

-- **Profitability**

**11. Which categories or brands have the highest/lowest total profit?**
```sql
SELECT 
    YEAR(Order_Date) AS Year_Name,
    MONTHNAME(Order_Date) AS Month_Name,
    COUNT(Order_Number) AS No_of_OrdersPer_Month,
    SUM(Total_Sales) AS Monthly_Revenue
FROM
    ecommerce
GROUP BY Year_Name , Month_Name
ORDER BY Monthly_Revenue DESC;
```


-- 5. Profitability

-- Which categories or brands have the highest/lowest total profit?
```sql
SELECT 
    Category, MAX(Total_Profit) AS Profit
FROM
    ecommerce
GROUP BY Category
ORDER BY Profit;
```

```sql
SELECT 
    Category, MAX(Total_Profit) AS Profit
FROM
    ecommerce
GROUP BY Category
ORDER BY Profit DESC;
```

**12. Identify loss-making orders (where cost > sales).**
```sql
SELECT * FROM ecommerce where Cost > Sales;
```


## Conclusion

I worked on a portfolio project that combined both SQL and Excel to deliver data-driven insights. Using SQL, I answered key business questions by querying and analyzing the underlying database. I then used Excel to create an interactive dashboard that visualized trends and patterns in the data. This project demonstrates my ability to clean and explore data, extract actionable insights, and present them in a way that supports strategic business decisions.

## Author - BB Siva Venkatesh

This project is part of my portfolio, showcasing the SQL and Excel Dashboard skills essential for data analyst roles. If you have any questions, feedback, or would like to collaborate, feel free to get in touch!

- **LinkedIn**: [Connect with me professionally](https://www.linkedin.com/in/siva-venkatesh/)


Thank you for your support, and I look forward to connecting with you!
