

-- Creating the SalesData table to store sales-related information
CREATE TABLE SalesData (
    Order_ID INT PRIMARY KEY,           -- Unique order identifier
    Date DATE,                           -- Order date
    Product_Category VARCHAR(50),        -- Category of the product
    Product_Name VARCHAR(100),           -- Name of the product
    Sales_Amount DECIMAL(10,2),          -- Sales amount in currency format
    Profit DECIMAL(10,2),                -- Profit from the sale
    Quantity_Sold INT,                    -- Number of units sold
    Customer_ID VARCHAR(10),             -- Unique customer identifier
    Region VARCHAR(20),                  -- Sales region
    Sales_Rep VARCHAR(50)                 -- Sales representative name
);

-- Retrieving all records from SalesData table
SELECT * FROM SalesData;

-- Total Sales and Profit by Region
SELECT 
    Region,
    SUM(Sales_Amount) AS Total_Sales, 
    SUM(Profit) AS Total_Profit
FROM SalesData
GROUP BY Region
ORDER BY Total_Sales DESC;

-- Total Sales and Profit by Product Category
SELECT 
    Product_Category,
    SUM(Sales_Amount) AS Total_Sales, 
    SUM(Profit) AS Total_Profit
FROM SalesData
GROUP BY Product_Category
ORDER BY Total_Sales DESC;

-- Top 5 Best Selling Products
SELECT 
    Product_Name,
    SUM(Quantity_Sold) AS Total_Quantity,
    SUM(Sales_Amount) AS Total_Sales
FROM SalesData
GROUP BY Product_Name
ORDER BY Total_Quantity DESC
LIMIT 5;

-- Sales Performance by Sales Representative
SELECT 
    Sales_Rep,
    COUNT(DISTINCT Order_ID) AS Total_Orders,
    SUM(Sales_Amount) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM SalesData
GROUP BY Sales_Rep
ORDER BY Total_Sales DESC;

-- Monthly Sales Trend
SELECT 
    DATE_FORMAT(Date, '%Y-%m') AS Month, 
    SUM(Sales_Amount) AS Total_Sales
FROM SalesData
GROUP BY Month
ORDER BY Month ASC;

