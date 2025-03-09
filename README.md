# ☕ Coffee Sales Analysis – SQL Project  

## 📌 Project Overview  
This project analyzes **coffee sales data** using **SQL Server (SSMS)** to extract insights into consumer behavior, sales trends, and market potential. The dataset consists of four CSV files—**sales, customers, products, and cities**—which provide a comprehensive view of transactions, customer demographics, and regional market conditions.  

Through **SQL queries**, I perform **data exploration, revenue analysis, customer segmentation, and market potential evaluation**, making this project highly relevant for **business intelligence, data analytics, and strategic decision-making** in the retail and F&B industry.  

---

## 📊 Key Objectives  
1️⃣ **Data Exploration & Cleaning:**  
   - Identified missing records and ensured data consistency.  
   - Verified relationships between customers, sales, products, and cities.  

2️⃣ **Revenue & Sales Analysis:**  
   - Total revenue calculation for Q4 2023.  
   - Sales distribution across different cities and products.  
   - Monthly sales growth trends and performance evaluation.  

3️⃣ **Customer & Market Insights:**  
   - Estimated number of coffee consumers per city (based on population).  
   - Segmentation of customers based on location and purchasing patterns.  
   - Analysis of average sales per customer vs. average rent in each city.  

4️⃣ **Market Potential Assessment:**  
   - Ranked cities based on revenue, customer base, and affordability.  
   - Evaluated the relationship between rent costs and coffee sales.  
   - Identified high-growth opportunities for potential business expansion.  

---

## 📂 Dataset Details  
The project utilizes four structured CSV files:  

| File Name   | Description |
|------------|------------|
| **sales.csv**     | Contains transactional data including sale ID, sale date, product ID, customer ID, total revenue, and customer rating. |
| **customers.csv** | Includes customer details such as customer ID, customer name, and associated city ID. |
| **products.csv**  | Lists product details including product ID, product name, and price. |
| **cities.csv**    | Contains city-wise data such as city ID, city name, population, estimated rent, and city ranking. |

---

## 🛠 SQL Techniques Used  
- **Joins** (INNER JOIN, LEFT JOIN) for merging customer, sales, and product data.  
- **Aggregation functions** (SUM, AVG, COUNT) for calculating revenue, sales, and customer metrics.  
- **Window functions** (RANK, LAG) for ranking and time-based growth analysis.  
- **Common Table Expressions (CTEs)** for structuring complex queries.  
- **Date functions** (DATEPART) for filtering and analyzing trends over time.  

---

## 📈 Insights & Findings  

📌 **Top Recommended Cities for Business Expansion:**  

1️⃣ **Pune**  
   - Lowest average rent per customer.  
   - Highest total revenue.  
   - Strong customer spending patterns.  

2️⃣ **Delhi**  
   - Largest estimated coffee consumer base (7.7 million).  
   - Highest total number of customers (68).  
   - Moderate average rent per customer (330).  

3️⃣ **Jaipur**  
   - Highest number of customers (69).  
   - Very low average rent per customer (156).  
   - Strong sales per customer (₹11.6K).  

---

## 🚀 How to Use  
1️⃣ **Clone the repository**  
```bash
git clone https://github.com/your-username/coffee-sales-analysis.git
