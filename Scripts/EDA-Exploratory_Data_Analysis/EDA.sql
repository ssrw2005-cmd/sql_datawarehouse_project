--Exploring all the objects in Databases
SELECT * FROM INFORMATION_SCHEMA.TABLES;

--Exploring all the COLUMNS in TABLES
SELECT * FROM INFORMATION_SCHEMA.COLUMNS;

--Exploring all the COUNTRIES oe customer come from
SELECT DISTINCT country FROM GOLD.dim_customers;


--Exploring all the CATEGORIES
SELECT DISTINCT category FROM GOLD.dim_prod;

--Exploring all the CATEGORIES
SELECT DISTINCT sub_category FROM GOLD.dim_prod;

--Exploring all the CATEGORIES
SELECT DISTINCT category, sub_category, product_name  FROM GOLD.dim_prod
ORDER BY 1,2,3;

--find the date of the first and last order
SELECT 
MIN(order_date) AS first_order_date,
MAX(order_date) AS last_order_date,
DATEDIFF(YEAR,MIN(order_date),MAX(order_date)) AS Year_Gap
FROM GOLD.fact_sales;

--find the youngest and the oldest customer
SELECT 
MIN(birthdate) AS oldest_customer,
MAX(birthdate) AS youngest_customer,
DATEDIFF(YEAR,MIN(birthdate),MAX(birthdate)) AS age_gap
FROM GOLD.dim_customers;

--find total number of sales
SELECT SUM(sales) AS total_sales FROM GOLD.fact_sales;

--find how many items are sold
SELECT SUM(quantity)  AS total_item_sold FROM GOLD.fact_sales;

--find average selling price
SELECT AVG(price) AS average_price FROM GOLD.fact_sales;

--find total number of orders
SELECT COUNT(DISTINCT(order_number)) AS number_of_orders FROM GOLD.fact_sales;

--find total number of customers
SELECT COUNT(DISTINCT(customer_key)) AS number_of_customers FROM GOLD.dim_customers;

--find total number of products
SELECT COUNT(DISTINCT(product_key)) AS number_of_products FROM GOLD.dim_prod;

--find total number of customer that has placed orders
SELECT COUNT(DISTINCT(customer_key)) AS CUSTOMER FROM GOLD.fact_sales;


--Gernerate a Report that shows all key metrics
SELECT 'Total_Sales' AS MEASURE_NAME, SUM(sales) AS MEASURE_VALUE FROM GOLD.fact_sales
UNION ALL
SELECT 'Total_Quantity' AS MEASURE_NAME, SUM(quantity) AS MEASURE_VALUE FROM GOLD.fact_sales
UNION ALL
SELECT 'Average_Price' AS MEASURE_NAME, AVG(price) AS MEASURE_VALUE FROM GOLD.fact_sales
UNION ALL
SELECT 'Number_of_Orders' AS MEASURE_NAME, COUNT(DISTINCT(order_number)) AS MEASURE_VALUE FROM GOLD.fact_sales
UNION ALL
SELECT 'Number_of_Products' AS MEASURE_NAME, COUNT(DISTINCT(product_key)) AS MEASURE_VALUE FROM GOLD.fact_sales
UNION ALL
SELECT 'Number_of_Customers' AS MEASURE_NAME, COUNT(DISTINCT(customer_key)) AS MEASURE_VALUE FROM GOLD.dim_customers
UNION ALL
SELECT 'Customer' AS MEASURE_NAME, COUNT(DISTINCT(customer_key)) AS MEASURE_VALUE FROM GOLD.fact_sales;

--MAGNITUDE ANALYSIS
--AGGREGATE[MEASURE] BY [DIMENSION]

--find total number of customers by country
SELECT country,COUNT(DISTINCT(customer_key)) AS number_of_customers FROM GOLD.dim_customers GROUP BY country ;

--find total number of customers by gender
SELECT gender,COUNT(DISTINCT(customer_key)) AS number_of_customers FROM GOLD.dim_customers GROUP BY gender ;

--find total number of products by category
SELECT category,COUNT(DISTINCT(product_key)) AS number_of_products FROM GOLD.dim_prod GROUP BY category;

--find average selling price by category
SELECT category,AVG(cost) AS Average_cost FROM GOLD.dim_prod GROUP BY category;

--Total revenue generated in each category
SELECT
D.category ,
SUM(F.sales) AS Total_revenue
FROM GOLD.fact_sales F
LEFT JOIN GOLD.dim_prod D
ON F.product_key = D.product_key
GROUP BY D.category;

--Total revenue generated in each customer
SELECT
C.customer_key,
C.firstname,
C.lastname,
SUM(F.sales) Total_revenue
FROM GOLD.fact_sales F
LEFT JOIN GOLD.dim_customers C
ON F.customer_key = C.customer_key
GROUP BY 
C.customer_key,
C.firstname,
C.lastname;

--What is the distribution acroos the countries

SELECT
C.country,
SUM(F.quantity) Total_quantity
FROM GOLD.fact_sales F
LEFT JOIN GOLD.dim_customers C
ON F.customer_key = C.customer_key
GROUP BY C.country;

--Ranling Analysis
--Rank[DIMENSION] by Aggregate[MEASURE]

--Which 5 Product generate the highest Revenue?

SELECT TOP 5
D.product_name,
SUM(F.sales) AS Total_revenue
FROM GOLD.fact_sales F
LEFT JOIN GOLD.dim_prod D
ON F.product_key = D.product_key
GROUP BY D.product_name
ORDER BY Total_revenue DESC;


--What are the Worst-Performing products in terms of sale?

SELECT TOP 5
D.product_name,
SUM(F.sales) AS Total_revenue
FROM GOLD.fact_sales F
LEFT JOIN GOLD.dim_prod D
ON F.product_key = D.product_key
GROUP BY D.product_name
ORDER BY Total_revenue ;

--Which category generate the highest Revenue?

SELECT
D.category,
SUM(F.sales) AS Total_revenue
FROM GOLD.fact_sales F
LEFT JOIN GOLD.dim_prod D
ON F.product_key = D.product_key
GROUP BY D.category
ORDER BY Total_revenue DESC;

--Find top 10 customers who have generated highest revenue

SELECT TOP 10
C.customer_key,
C.firstname,
C.lastname,
SUM(F.price) Total_revenue
FROM GOLD.fact_sales F
LEFT JOIN GOLD.dim_customers C
ON F.customer_key = C.customer_key
GROUP BY 
C.customer_key,
C.firstname,
C.lastname
ORDER BY Total_revenue;
