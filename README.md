# E-Commerce Business Performance & Customer Insights (Olist Dataset)

## 📌 Project Overview
This is an **End-to-End Business Intelligence (BI)** project designed to analyze e-commerce data from Olist ([Brazilian E-Commerce Public Dataset](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce)). The goal is to transform raw, decentralized data into actionable business strategic insights for executive decision-making.

The project demonstrates a complete data pipeline: **Data Storage & Modeling (SQL) ➔ Ad-hoc Reporting (Excel) ➔ Interactive Dashboards (Power BI) ➔ Stakeholder Communication (PowerPoint).**

---

## 🛠️ Tech Stack & Architecture

* **Database (SQL):** PostgreSQL (Data hosting, DDL schema generation, and view optimization).
* **Spreadsheet Analysis:** Microsoft Excel (Pivot tables, trend analysis, and data validation).
* **Data Visualization:** Power BI Desktop (Star schema modeling, DAX measures, interactive reporting).
* **Executive Presentation:** Microsoft PowerPoint (Data storytelling for stakeholders).

---

## 📂 Repository Structure

```text
olist-ecommerce-bi-project/
├── 01_SQL_Scripts/         <- SQL scripts for table creation & business views
├── 02_Excel_Analysis/      <- Excel spreadsheet with Pivot Tables & charts
├── 03_PowerBI_Dashboard/   <- Power BI (.pbix) interactive dashboard file
└── 04_Presentation/        <- Executive PowerPoint presentation (PDF/PPTX)

📊 Key Business Insights & Findings

    Financial Summary: Total Revenue generated was $1,962.79 across 10 unique orders, with a high Average Order Value (AOV) of $196.28.

    Seasonality & Peaks: A massive sales spike was identified in July 2018, contributing to nearly 50% of the total sample revenue ($946.14).

    Customer Behavior: Credit Card is the most dominant payment method, capturing 98.2% of the total revenue share.

    Product Performance: "Ferramentas Jardim" (Garden Tools) is the absolute top-performing category, generating $1,098.79.

🚀 Strategic Recommendations

    Inventory Optimization: Focus supply chain and logistics resources heavily on the "Garden Tools" category, as it drives the majority of the platform's revenue.

    Fintech Partnerships: Negotiate better transaction fees with credit card processors, since 98% of total financial volume flows through this channel.

    Scalability: The pipeline is fully automated. Any new data appended to PostgreSQL will immediately update the Power BI metrics upon a simple refresh.
