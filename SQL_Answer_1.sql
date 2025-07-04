-- https://www.kaggle.com/datasets/ayushparwal2026/online-ecommerce

SELECT * FROM ecommerce;

-- 1. Sales Performance Analysis

-- What is the total sales generated overall?
SELECT sum(Total_Sales) as Sales FROM ecommerce;

-- Which states generate the highest revenue?
SELECT 
    State_Code,
    COUNT(State_Code) AS Total_StateWise_Orders,
    SUM(Total_Sales) AS Total_Revenue
FROM
    ecommerce
GROUP BY State_Code
ORDER BY Total_Revenue DESC;

-- Which categories and brands are top-selling by revenue or quantity?
-- By Revenue
SELECT Category, Brand, sum(Total_Sales) as Revenue FROM ecommerce group by Category, Brand order by Revenue desc;

-- By Quantity
SELECT Category, Brand, sum(Quantity) as Quantity FROM ecommerce group by Category, Brand order by Quantity desc;

-- Who are the top-performing supervisors based on total sales?
SELECT 
    `Assigned Supervisor`, SUM(Total_Sales) AS Revenue
FROM
    ecommerce
GROUP BY `Assigned Supervisor`
ORDER BY Revenue DESC;

-- 2.Product Analysis

-- Which products have the highest profit margins (Sales - Cost)?
SELECT 
    Product,
    COUNT(Quantity) AS Quantity_Sold,
    SUM(Total_Profit) AS Total_Profit
FROM
    ecommerce
GROUP BY Product
ORDER BY Total_Profit DESC;

-- What is the average order value (AOV)?

SELECT avg(Total_Sales) FROM ecommerce; -- 19489.3117



