# Tokyo Olympics Data Pipeline Project

This project demonstrates an **end-to-end data pipeline** built using **Azure Data Factory**, **Azure Databricks**, and **Azure Synapse Analytics**. The pipeline ingests raw datasets from GitHub, transforms them into structured fact and dimension tables, and produces **gold-layer, analytics-ready datasets** stored in the Data Lake. The final data products can be queried using Synapse SQL or connected to visualization tools like Power BI and Tableau.

---

## Project Overview

The pipeline follows a **multi-layer architecture**:

1. **Raw Layer (Bronze)**  
   - Source: CSV datasets from GitHub  
   - Tool: **Azure Data Factory**  
   - Purpose: Preserve original datasets for auditability and reproducibility

2. **Transformed Layer (Silver)**  
   - Tool: **Azure Databricks**  
   - Tasks:  
     - Load raw datasets using PySpark  
     - Clean and standardize data  
     - Create **fact tables** (e.g., medals, entries) and **dimension tables** (e.g., athletes, teams, coaches)  
   - Storage: Data Lake `transformed-data` folder  
   - Purpose: Structured, intermediate datasets ready for further processing

3. **Gold Layer (Curated Data Products)**  
   - Tool: **Azure Databricks**  
   - Tasks:  
     - Aggregate metrics (total medals per country, gender-specific stats, etc.)  
     - Create analytics-ready tables for reporting  
   - Storage: Data Lake `Gold` folder  
   - Purpose: Curated, production-ready datasets for analysis

4. **Analytics and Reporting**  
   - Tool: **Azure Synapse Analytics**  
   - Tasks: Run SQL queries on gold tables to generate insights  
   - Example queries:  
     - Top 10 athletes by gold medals  
     - Total medals by country  
     - Average gold medals by gender per discipline  

> Note: While visualization tools (Power BI, Tableau) can connect directly to Synapse, this project focuses on **data pipeline development and analytics**.

---

## Learning Objectives

This project was completed primarily for **learning purposes**. While each tool can independently handle data ingestion, transformation, and analytics, I integrated **Data Factory, Databricks, and Synapse** to:

- Gain hands-on experience with an end-to-end pipeline  
- Understand how raw data flows through multiple layers to become curated gold datasets  
- Explore modern data engineering concepts in the **Azure ecosystem**  

---

## Key Takeaways

- Built a complete **end-to-end data pipeline** in Azure  
- Structured data efficiently using **fact and dimension tables**  
- Produced **curated, reliable, and analytics-ready datasets**  
- Delivered a **reusable data product** scalable for additional datasets or analytics projects  

---
