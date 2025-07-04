
SELECT * FROM ecommerce;
-- 3. Customer Behavior

-- Top 5 customers who have made the highest number of orders or spent the most?
-- Based on number of orders
SELECT 
    Customer_Name, COUNT(Order_Number) AS Order_Count
FROM
    ecommerce
GROUP BY Customer_Name
ORDER BY Order_Count DESC
LIMIT 5;

-- Based on Total Spent
SELECT 
    Customer_Name, SUM(Total_Sales) AS Sale_Amount
FROM
    ecommerce
GROUP BY Customer_Name
ORDER BY Sale_Amount DESC
LIMIT 5;

-- Which customers buy the highest quantity per order?
SELECT 
    Customer_Name, MAX(Quantity) AS Max_Quantity_per_Order
FROM
    ecommerce
GROUP BY Customer_Name
ORDER BY Max_Quantity_per_Order DESC; 

-- 4. Time-based Insights

-- Monthly/weekly sales trends.
SELECT 
    YEAR(Order_Date) AS Year_Name,
    MONTHNAME(Order_Date) AS Month_Name,
    COUNT(Order_Number) AS No_of_OrdersPer_Month,
    SUM(Total_Sales) AS Monthly_Revenue
FROM
    ecommerce
GROUP BY Year_Name , Month_Name
ORDER BY Monthly_Revenue DESC; 

-- Which month had peak sales, and which had lowest?
SELECT 
    YEAR(Order_Date) AS Year_Name,
    MONTHNAME(Order_Date) AS Month_Name,
    COUNT(Order_Number) AS No_of_OrdersPer_Month,
    SUM(Total_Sales) AS Monthly_Revenue
FROM
    ecommerce
GROUP BY Year_Name , Month_Name
ORDER BY Monthly_Revenue DESC;


-- 5. Profitability

-- Which categories or brands have the highest/lowest total profit?
SELECT 
    Category, MAX(Total_Profit) AS Profit
FROM
    ecommerce
GROUP BY Category
ORDER BY Profit;

SELECT 
    Category, MAX(Total_Profit) AS Profit
FROM
    ecommerce
GROUP BY Category
ORDER BY Profit DESC;

-- Identify loss-making orders (where cost > sales).
SELECT * FROM ecommerce where Cost > Sales;



