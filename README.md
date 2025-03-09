# ☕ Coffee Sales Analysis - SQL Project  

## 📌 Overview  
This project focuses on analyzing coffee sales data using SQL. It involves creating a structured database, importing datasets, performing data cleaning, and generating insightful reports. The analysis helps in understanding sales trends, customer segmentation, and revenue patterns across different cities.  

## 📂 Dataset  
The dataset consists of four CSV files:  
- `sales.csv` – Contains sales transactions with details like date, customer ID, product ID, and total amount.  
- `customers.csv` – Includes customer information such as customer ID and city association.  
- `products.csv` – Lists coffee products with their respective prices.  
- `cities.csv` – Provides city-level details including population, estimated rent, and city ranking.  

## 🛠️ Steps Performed  
### 1️⃣ Database Creation & Data Import  
- Created a **`coffee_sales`** database in SQL Server.  
- Imported the four CSV files into respective tables (`sales`, `customers`, `products`, `cities`).  

### 2️⃣ Data Cleaning & Validation  
- Checked for **missing values** in each table to ensure data consistency.  
- Verified **foreign key relationships** between tables for accuracy.  

### 3️⃣ Exploratory Data Analysis (EDA)  
- Analyzed coffee consumption based on city population.  
- Examined total sales revenue and revenue breakdown by city.  
- Identified best-selling coffee products.  

### 4️⃣ Key Business Insights  
- **Top Revenue-Generating Cities** – Identified cities contributing the most to sales.  
- **Customer Behavior** – Analyzed unique customer count per city.  
- **Market Potential** – Evaluated estimated coffee consumers vs. actual buyers.  
- **Sales vs. Rent Analysis** – Compared sales revenue with average rent per customer.  
- **Monthly Growth Trends** – Tracked revenue growth across different months.  

## 📑 Business Recommendation Report  
Based on SQL analysis, the following cities are the best for business expansion:  

### 🏙️ **City 1: Pune**  
✅ **Lowest average rent per customer**, increasing affordability.  
✅ **Highest total revenue**, making it a strong market.  
✅ **High average sales per customer**, indicating a profitable audience.  

### 🏙️ **City 2: Delhi**  
✅ **Largest estimated coffee consumer base (7.7 million people)**.  
✅ **Highest total number of customers (68 buyers)**.  
✅ **Moderate rent per customer (330), still within an acceptable range**.  

### 🏙️ **City 3: Jaipur**  
✅ **Highest customer count (69 customers)**.  
✅ **Extremely low average rent per customer (156), maximizing profit margins**.  
✅ **Better-than-average sales per customer (11.6k revenue per buyer)**.  

🔹 **Recommendation:** **Pune** is the best city to focus on due to its strong revenue potential and customer affordability. **Delhi** has the largest market size, while **Jaipur** offers high engagement at lower costs.  

## 📊 SQL Queries  
All SQL queries used in this project are documented in **`Coffee_Sales_Analysis.sql`**, covering:  
✅ Data Exploration  
✅ Revenue & Product Sales Analysis  
✅ Customer Segmentation  
✅ Monthly Sales Growth Trends  
✅ Market Potential Evaluation  

## 📌 How to Use  
1️⃣ Download or clone this repository.  
2️⃣ Import the dataset into SQL Server.  
3️⃣ Run **`Coffee_Sales_Analysis.sql`** to generate insights.  
4️⃣ Review the **business report** above for recommendations.  
5️⃣ Modify queries as needed for custom analysis.  

## 🚀 Future Enhancements  
- Expanding analysis to include customer loyalty and purchase frequency.  
- Integrating Power BI for advanced visualizations.  
- Predictive modeling for future sales trends.  

---
