# SQL Data Warehouse & Business Analysis Project

## Project Overview

This project demonstrates the end-to-end development of a SQL Data Warehouse using the **Bronze, Silver, and Gold** architecture.

The goal was to transform raw CRM and ERP data into clean, structured, analytics-ready datasets that can support business reporting and decision-making.

The project includes data ingestion, data cleaning, transformation, dimensional modeling, and basic business analysis using SQL Server.

---

## Project Architecture

The warehouse follows a layered data architecture:

```text
Raw CSV Files
     │
     ▼
Bronze Layer
Raw data ingestion from source files
     │
     ▼
Silver Layer
Data cleaning, standardization, validation, and transformation
     │
     ▼
Gold Layer
Business-ready dimension and fact views for reporting and analysis
     │
     ▼
Basic Business Analysis
Customer, product, and sales insights
```

---

## Technologies Used

* SQL Server
* SQL Server Management Studio (SSMS)
* T-SQL
* CSV Files
* GitHub

---

## Data Sources

The project uses CRM and ERP datasets containing customer, product, location, category, and sales information.

Example source files include:

```text
dim_customers.csv
dim_products.csv
fact_sales.csv
```

The raw data is loaded into SQL Server tables using `BULK INSERT`.

---

## Data Warehouse Layers

### Bronze Layer

The Bronze layer stores raw data exactly as received from the source files.

Main activities:

* Created Bronze schema
* Created raw source tables
* Loaded CSV data using `BULK INSERT`
* Preserved source data for traceability

Example tables:

```text
bronze.crm_customer_info
bronze.crm_prd_info
bronze.crm_sales_details
bronze.erp_cust_az12
bronze.erp_loc_a101
bronze.erp_px_cat_g1v2
```

---

### Silver Layer

The Silver layer contains cleaned and standardized data.

Main transformations performed:

* Removed duplicate records
* Trimmed unwanted spaces
* Standardized text values
* Handled missing and invalid values
* Converted date fields into proper date format
* Validated sales, quantity, and price values
* Standardized gender, marital status, country, and product information

Example tables:

```text
silver.crm_customer_info
silver.crm_prd_info
silver.crm_sales_details
silver.erp_cust_az12
silver.erp_loc_a101
silver.erp_px_cat_g1v2
```

---

### Gold Layer

The Gold layer provides business-ready views designed for reporting and analysis.

It follows a dimensional model with:

* Customer Dimension
* Product Dimension
* Sales Fact Table

Example objects:

```text
gold.dim_customers
gold.dim_products
gold.fact_sales
```

The Gold layer combines CRM and ERP data to create a unified view of customers, products, and sales transactions.

---

## Data Model

The final model is structured as a star schema.

```text
                 dim_customers
                       │
                       │
                       ▼
dim_products ───► fact_sales ◄─── Calendar / Date fields
```

### Dimension Tables

**Customer Dimension**

Includes information such as:

* Customer ID
* Customer number
* First name
* Last name
* Gender
* Marital status
* Country
* Birth date
* Customer creation date

**Product Dimension**

Includes information such as:

* Product ID
* Product number
* Product name
* Category
* Subcategory
* Product cost
* Product line
* Start date

### Fact Table

**Sales Fact Table**

Includes information such as:

* Order number
* Product key
* Customer key
* Order date
* Shipping date
* Due date
* Sales amount
* Quantity
* Price

---

## Basic Business Analysis

After building the warehouse, basic analysis was performed using the Gold layer.

Examples of analysis performed:

* Total sales performance
* Total number of orders
* Total customers
* Total products
* Sales by country
* Sales by product category
* Top-performing products
* Top customers by sales
* Monthly and yearly sales trends
* Customer demographics analysis
* Product performance analysis

---

## SQL Concepts Used

This project helped me practice the following SQL concepts:

* Database and schema creation
* Table creation
* `BULK INSERT`
* Stored procedures
* Data cleaning and transformation
* `CASE WHEN`
* `COALESCE`
* `NULLIF`
* `CAST` and `CONVERT`
* Date conversion and validation
* Joins
* Common Table Expressions (CTEs)
* Window functions
* `ROW_NUMBER()`
* Views
* Aggregations
* `GROUP BY`
* `ORDER BY`
* Data quality checks

---

## Project Structure

```text
sql-data-warehouse-project/
│
├── datasets/
│   └── flat-files/
│       ├── dim_customers.csv
│       ├── dim_products.csv
│       └── fact_sales.csv
│
├── scripts/
│   ├── bronze/
│   │   ├── ddl_bronze.sql
│   │   └── load_bronze.sql
│   │
│   ├── silver/
│   │   ├── ddl_silver.sql
│   │   └── load_silver.sql
│   │
│   ├── gold/
│   │   └── gold_views.sql
│   │
│   └── analysis/
│       └── business_analysis.sql
│
├── screenshots/
│   ├── architecture.png
│   ├── data_model.png
│   ├── gold_layer.png
│   └── analysis_output.png
│
└── README.md
```

## Key Learnings

Through this project, I gained practical experience in:

* Building a structured SQL Data Warehouse
* Working with the Bronze, Silver, and Gold data architecture
* Cleaning raw business data
* Creating analytics-ready datasets
* Designing dimension and fact tables
* Using SQL for business analysis
* Understanding how raw data becomes useful for reporting and decision-making

---

## Future Improvements

Possible future improvements for this project include:

* Creating an interactive Power BI dashboard using the Gold layer
* Adding incremental data loading
* Automating the ETL process
* Adding more advanced data quality checks
* Scheduling regular data refreshes
* Building KPI dashboards for sales, customers, and products
* Adding documentation for each table and column

---

## Author

**Govind Sharma**
Aspiring Data Analyst | AI & Data Science Student

GitHub: https://github.com/ssrw2005-cmd

---

## Connect With Me

Feel free to connect with me on LinkedIn and explore my other data analytics projects.
