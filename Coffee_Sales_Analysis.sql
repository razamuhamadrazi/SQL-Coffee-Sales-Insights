CREATE DATABASE COFFEE_SALES;
USE COFFEE_SALES;

-- Exploring Data
SELECT * FROM cities;
SELECT * FROM customers;
SELECT * FROM products;
SELECT * FROM sales;

-- Checking for Missing Records in Data Tables
SELECT * 
FROM cities
WHERE city_id IS NULL 
   OR city_name IS NULL 
   OR population IS NULL 
   OR estimated_rent IS NULL 
   OR city_rank IS NULL;

SELECT * 
FROM customers
WHERE customer_id IS NULL 
   OR customer_name IS NULL 
   OR city_id IS NULL;

SELECT *
FROM products
WHERE product_id IS NULL 
   OR product_name IS NULL 
   OR price IS NULL;

SELECT * 
FROM sales
WHERE sale_id IS NULL 
   OR sale_date IS NULL 
   OR product_id IS NULL 
   OR customer_id IS NULL 
   OR total IS NULL 
   OR rating IS NULL;

-- Report & Data Analysis

-- Q1: Coffee Consumers Count (Estimated 25% of Population Consumes Coffee)
SELECT 
    city_name, 
    ROUND((CAST(population AS FLOAT) * 0.25 / 1000000), 2) AS estimated_consumer_in_mln
FROM cities
ORDER BY estimated_consumer_in_mln DESC;

-- Q2: Total Revenue from Coffee Sales in Last Quarter of 2023
SELECT SUM(total) AS total_revenue
FROM sales
WHERE DATEPART(YEAR, sale_date) = 2023 
  AND DATEPART(QUARTER, sale_date) = 4;

-- Q3: Revenue by City in Last Quarter of 2023
SELECT 
    ct.city_name,
    SUM(s.total) AS total_revenue
FROM sales s
INNER JOIN customers c ON s.customer_id = c.customer_id
INNER JOIN cities ct ON c.city_id = ct.city_id
WHERE DATEPART(YEAR, s.sale_date) = 2023 
  AND DATEPART(QUARTER, s.sale_date) = 4
GROUP BY ct.city_name
ORDER BY total_revenue DESC;

-- Q4: Sales Count for Each Product
SELECT 
    p.product_name, 
    COUNT(s.sale_id) AS units_sold
FROM sales s
INNER JOIN products p ON s.product_id = p.product_id
GROUP BY p.product_name
ORDER BY units_sold DESC;

-- Q5: Average Sales Amount per City
WITH city_table AS (
    SELECT 
        city_name,
        ROUND((CAST(population AS FLOAT) * 0.25) / 1000000, 2) AS coffee_consumers
    FROM cities
),
customers_table AS (
    SELECT 
        ct.city_name,
        COUNT(DISTINCT c.customer_id) AS unique_customers
    FROM sales s
    JOIN customers c ON c.customer_id = s.customer_id
    JOIN cities ct ON c.city_id = ct.city_id
    GROUP BY ct.city_name
)
SELECT 
    customers_table.city_name,
    city_table.coffee_consumers AS coffee_consumer_in_millions,
    customers_table.unique_customers
FROM city_table
JOIN customers_table ON city_table.city_name = customers_table.city_name;

-- Q6: Top 3 Selling Products by City
WITH city_sales AS (
    SELECT 
        ct.city_name, 
        s.product_id, 
        COUNT(s.product_id) AS total_sales
    FROM sales s 
    INNER JOIN customers c ON s.customer_id = c.customer_id 
    INNER JOIN cities ct ON c.city_id = ct.city_id
    GROUP BY ct.city_name, s.product_id
),
product_names AS (
    SELECT DISTINCT product_id, product_name FROM products
),
ranked_products AS (
    SELECT 
        cs.city_name,
        cs.total_sales,
        pn.product_name,
        RANK() OVER (PARTITION BY cs.city_name ORDER BY cs.total_sales DESC) AS s_rank
    FROM city_sales cs
    INNER JOIN product_names pn ON cs.product_id = pn.product_id
)
SELECT * 
FROM ranked_products
WHERE s_rank < 4
ORDER BY city_name, s_rank;

-- Q7: Customer Segmentation by City
SELECT 
    ct.city_name,
    COUNT(DISTINCT c.customer_id) AS unique_customers
FROM cities ct
LEFT JOIN customers c ON c.city_id = ct.city_id
JOIN sales s ON s.customer_id = c.customer_id
WHERE s.product_id IN (1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14)
GROUP BY ct.city_name;

-- Q8: Average Sale vs Rent
SELECT 
    ct.city_name,
    AVG(s.total) AS avg_sales_per_customer,
    ct.estimated_rent / COUNT(DISTINCT s.customer_id) AS avg_rent_per_customer
FROM sales s
INNER JOIN customers c ON s.customer_id = c.customer_id
INNER JOIN cities ct ON c.city_id = ct.city_id
GROUP BY ct.city_name, ct.estimated_rent;

-- Q9: Monthly Sales Growth
WITH monthly_sale AS (
    SELECT 
        ct.city_name, 
        DATEPART(MONTH, s.sale_date) AS month,
        DATEPART(YEAR, s.sale_date) AS year,
        SUM(s.total) AS current_month_sale
    FROM sales s
    INNER JOIN customers c ON s.customer_id = c.customer_id
    INNER JOIN cities ct ON c.city_id = ct.city_id
    GROUP BY ct.city_name, DATEPART(MONTH, s.sale_date), DATEPART(YEAR, s.sale_date)
),
growth_ratio AS (
    SELECT
        city_name,
        month,
        year,
        current_month_sale,
        LAG(current_month_sale, 1) OVER (PARTITION BY city_name ORDER BY year, month) AS last_month_sale
    FROM monthly_sale
)
SELECT 
    city_name,
    month,
    year,
    ROUND(((current_month_sale / NULLIF(last_month_sale, 0) - 1) * 100), 2) AS growth_ratio
FROM growth_ratio
WHERE ROUND(((current_month_sale / NULLIF(last_month_sale, 0) - 1) * 100), 2) IS NOT NULL;


-- Q10: Market Potential Analysis (Top 3 Cities Based on Sales)
WITH city_table AS (
    SELECT 
        ct.city_name,
        SUM(s.total) AS total_revenue,
        COUNT(DISTINCT s.customer_id) AS total_unique_customers,
        ROUND(SUM(s.total) / COUNT(DISTINCT s.customer_id), 2) AS avg_sale_per_customer
    FROM sales s
    JOIN customers c ON s.customer_id = c.customer_id
    JOIN cities ct ON ct.city_id = c.city_id
    GROUP BY ct.city_name
),
city_rent AS (
    SELECT 
        city_name, 
        estimated_rent,
        ROUND((CAST(population AS FLOAT) * 0.25) / 1000000, 3) AS estimated_coffee_consumer_in_mln
    FROM cities 
)
SELECT 
    cr.city_name,
    total_revenue,
    cr.estimated_rent AS total_rent,
    ctt.total_unique_customers,
    estimated_coffee_consumer_in_mln,
    ctt.avg_sale_per_customer,
    ROUND(cr.estimated_rent / ctt.total_unique_customers, 2) AS avg_rent_per_customer
FROM city_rent cr
JOIN city_table ctt ON cr.city_name = ctt.city_name
ORDER BY total_revenue DESC;


/*
---------------------------------------------------
          MARKET POTENTIAL RECOMMENDATION
---------------------------------------------------

Based on an in-depth analysis of key sales and rental metrics, 
the following cities exhibit the highest market potential for coffee sales:

1. Pune:
   - Highest total revenue, making it the most lucrative market.
   - Low average rent per customer, ensuring higher profit margins.
   - Strong customer spending behavior, with a high average sales per customer.

2. Delhi:
   - Largest estimated coffee-consuming population (7.7 million), indicating vast market potential.
   - Highest total number of unique customers (68), showcasing strong demand.
   - Reasonable average rent per customer (330), well below the 500 threshold, ensuring sustainability.

3. Jaipur:
   - Highest customer base (69 unique customers), reflecting strong local demand.
   - Exceptionally low average rent per customer (156), providing cost advantages.
   - Healthy average sales per customer (₹11.6K), indicating strong consumer spending.

Conclusion:
These cities present the best balance between customer volume, revenue potential, 
and cost-effectiveness, making them ideal for business expansion and investment.
---------------------------------------------------

