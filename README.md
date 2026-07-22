<div align = "justify">

# 📦 Order Fulfilment and Revenue Risk Analysis <img src="Images/logo.png" alt="Logo" width="55" align="right"/>

### *End-to-End Analytics: SQL Data Transformation + Star Schema Modeling + Power BI Dashboards*

**Order Fulfilment Performance | Revenue Risk Analysis | Regional & Time‑Series Insights**

![SQL](https://img.shields.io/badge/SQL-Analytics-336791?logo=postgresql&logoColor=white)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-Database-336791?logo=postgresql&logoColor=white)
![Power BI](https://img.shields.io/badge/Power%20BI-Interactive%20Dashboard-F2C811?logo=powerbi&logoColor=black)
![DAX](https://img.shields.io/badge/DAX-Calculations-005A9C?logo=powerbi&logoColor=white)
![Data Modeling](https://img.shields.io/badge/Data%20Modeling-Star%20Schema-1F77B4)

---

<div align="center">

![Dashboard – GIF](Images/Order_Fulfilment_and_Revenue_Risk_Analysis_Animation.gif)

</div>

---

## 🔹 خلاصه فارسی (برای مدیران و کارفرمایان):

این پروژه یک تحلیل داده‌محور جامع از عملکرد **تحویل سفارش‌ها (Order Fulfilment)** و **تحقق درآمد (Revenue Realization)** در یک پلتفرم تجارت الکترونیک است. هدف اصلی این تحلیل، فراتر رفتن از گزارش‌های ساده فروش و شناسایی نقاطی است که فرآیندهای عملیاتی منجر به عدم تحقق درآمد بالقوه می‌شوند.

با استفاده از فرآیند **استخراج، تبدیل و بارگذاری داده (SQL‑driven ETL)** و مدل‌سازی داده در قالب **Star Schema**، شاخص‌های کلیدی عملکرد و ریسک استخراج شده و در داشبوردهای تعاملی **Power BI** به تصویر کشیده شده‌اند. یافته‌های کلیدی نشان می‌دهد که با وجود نرخ تحویل **۹۷ درصدی**، بیش از **۴۲۳ هزار دلار درآمد** به دلیل اختلالات لجستیکی در مناطق خاص (مانند **Roraima**) در معرض ریسک قرار دارد.

**دستاورد اصلی این پروژه** تبدیل داده‌های خام عملیاتی به یک چارچوب تحلیلی **Revenue at Risk** است که به مدیران اجازه می‌دهد با شناسایی مناطق پرریسک، پایش سفارش‌های ناتمام، و بهینه‌سازی ظرفیت لجستیکی در دوره‌های اوج تقاضا، از هدررفت منابع جلوگیری کرده و نرخ تحقق واقعی درآمد را افزایش دهند.

**Not every order successfully converts into realized revenue.**
This analysis goes beyond basic sales reporting to identify where the order fulfilment process breaks down and how operational issues translate into revenue at risk.

---

## 📸 Dashboards Overview

### 1️⃣ Overview

<div align = "center">

<img src="Images/dashboard1_overview.png" width="900"/>

</div>

### 2️⃣ Regional Analysis

<div align = "center">

<img src="Images/dashboard2_regional_analysis.png" width="900"/>

</div>

### 3️⃣ Time Series Analysis

<div align = "center">

<img src="Images/dashboard3_time_series_analysis.png" width="900"/>

</div>

---

## 🌟 Executive Summary

This project analyzes **99,441 e‑commerce orders** to evaluate order fulfilment performance and identify potential revenue exposure within the delivery process.

The analysis reveals that the fulfilment system performs strongly overall, with a **97.02% delivery success rate**. However, a portion of orders remains unresolved or lost, placing approximately **$423.8K (2.67%) of total revenue at risk**. While this percentage is relatively small, monitoring these cases remains important because even minor inefficiencies can accumulate into a significant financial impact at scale.

Regional analysis highlights **Roraima (RR)** as the area with the highest relative operational risk, suggesting possible logistics constraints affecting fulfilment reliability in that region.

Overall, the findings indicate that implementing **targeted monitoring of high‑risk regions and unresolved orders** could help protect revenue and further strengthen operational efficiency across the fulfilment pipeline.

---

## Business Problem & Objectives

Customer demand and order volume are strong, but **not all orders successfully convert into realized revenue**.
Operational issues in the fulfilment process — such as lost orders and orders remaining in progress — create a gap between **recorded revenue and revenue actually realized through successful delivery**.

These operational inefficiencies expose part of the business revenue to risk and limit how much recorded revenue is successfully realized.

Business Goal: **Improve revenue realization by identifying operational bottlenecks in order fulfilment and reducing revenue at risk.**

---

## Business Questions

This analysis focuses on several operational and financial questions critical for e‑commerce performance:

- What percentage of total orders are successfully delivered versus lost or still in progress?
- How much revenue is fully realized compared to revenue currently at risk?
- Which regions generate the highest revenue and where are operational risks concentrated?
- Which order statuses contribute the most to Revenue at Risk?
- How do fulfilment performance and revenue risk evolve over time?
- Which regions should be prioritized to reduce operational risk and protect revenue?

---

## Key Insights

<div dir="ltr" align="center">
  <table style="width: 100%; border-collapse: collapse; text-align: left; border: 1px solid #ddd;">
    <thead>
      <tr style="background-color: #f2f2f2;">
        <th style="padding: 12px; border: 1px solid #ddd; width: 25%;">Insight</th>
        <th style="padding: 12px; border: 1px solid #ddd; width: 40%;">Observation / Root Cause</th>
        <th style="padding: 12px; border: 1px solid #ddd; width: 35%;">Business Impact</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td style="padding: 10px; border: 1px solid #ddd;">97.02% of orders are successfully delivered</td>
        <td style="padding: 10px; border: 1px solid #ddd;">Overall fulfilment performance is strong across the platform</td>
        <td style="padding: 10px; border: 1px solid #ddd;">Core operations are generally stable and capable of handling demand</td>
      </tr>
      <tr>
        <td style="padding: 10px; border: 1px solid #ddd;">$423.8K of revenue is classified as Revenue at Risk (2.67%)</td>
        <td style="padding: 10px; border: 1px solid #ddd;">Some orders remain in progress or are lost, preventing full revenue realization</td>
        <td style="padding: 10px; border: 1px solid #ddd;">Operational improvements can directly recover part of this exposed revenue</td>
      </tr>
      <tr>
        <td style="padding: 10px; border: 1px solid #ddd;">A small portion of orders (2.98%) are not delivered (lost + in progress)</td>
        <td style="padding: 10px; border: 1px solid #ddd;">Lost and in-progress orders create a gap between total revenue and realized revenue</td>
        <td style="padding: 10px; border: 1px solid #ddd;">Even small operational failures can accumulate into significant financial exposure</td>
      </tr>
      <tr>
        <td style="padding: 10px; border: 1px solid #ddd;">Revenue is highly concentrated in a few key states (SP, RJ, MG)</td>
        <td style="padding: 10px; border: 1px solid #ddd;">A limited number of regions drive the majority of sales</td>
        <td style="padding: 10px; border: 1px solid #ddd;">Operational issues in these states can have a disproportionate financial impact</td>
      </tr>
      <tr>
        <td style="padding: 10px; border: 1px solid #ddd;">São Paulo (SP) generates the highest total revenue and the largest absolute revenue at risk</td>
        <td style="padding: 10px; border: 1px solid #ddd;">High sales volume increases financial exposure when delivery performance declines</td>
        <td style="padding: 10px; border: 1px solid #ddd;">Improving fulfilment performance in SP would significantly reduce total revenue risk</td>
      </tr>
      <tr>
        <td style="padding: 10px; border: 1px solid #ddd;">Roraima (RR) shows the highest relative operational risk</td>
        <td style="padding: 10px; border: 1px solid #ddd;">Geographical isolation and potential logistics infrastructure constraints leading to 10.19% revenue at risk</td>
        <td style="padding: 10px; border: 1px solid #ddd;">Logistics and operational processes in smaller regions require targeted improvements</td>
      </tr>
      <tr>
        <td style="padding: 10px; border: 1px solid #ddd;">Monthly revenue trends show steady growth during 2017</td>
        <td style="padding: 10px; border: 1px solid #ddd;">Customer demand increased throughout the year</td>
        <td style="padding: 10px; border: 1px solid #ddd;">The business demonstrates strong market demand and expansion potential</td>
      </tr>
      <tr>
        <td style="padding: 10px; border: 1px solid #ddd;">Delivery performance fluctuates across months</td>
        <td style="padding: 10px; border: 1px solid #ddd;">Operational capacity does not always scale smoothly with demand</td>
        <td style="padding: 10px; border: 1px solid #ddd;">Monitoring fulfilment performance during high-demand periods is critical</td>
      </tr>
    </tbody>
  </table>
</div>

---

## KPI Snapshot

- **Total Revenue:** $15.8M  
- **Total Orders:** 99,441  
- **Delivered Orders:** 96,481  
- **Delivery Rate:** 97.02%  
- **Lost Orders:** 1,235  
- **Lost Order Rate:** 1.24%  
- **In‑Progress Rate:** 1.74%  
- **Revenue Realized:** ~$15.38M  
- **Revenue at Risk:** $423.8K (2.67%)

Most orders are successfully delivered, resulting in strong revenue realization. However, a small share of lost and in‑progress orders still exposes **$423.8K of revenue to operational risk**, highlighting opportunities for fulfilment optimization.

---

## Strategic Actions

<div dir="ltr" align = "center">
  <table style="width: 100%; border-collapse: collapse; border: 1px solid #ddd;">
    <thead>
      <tr style="background-color: #f2f2f2;">
        <th style="padding: 12px; border: 1px solid #ddd; width: 46%; text-align: left;">Action</th>
        <th align="center" style="padding: 12px; border: 1px solid #ddd; width: 18%;">Impact</th>
        <th align="center" style="padding: 12px; border: 1px solid #ddd; width: 18%;">Effort</th>
        <th align="center" style="padding: 12px; border: 1px solid #ddd; width: 18%;">Priority</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td style="padding: 10px; border: 1px solid #ddd; text-align: left;">Improve fulfilment monitoring in high-revenue states (especially SP)</td>
        <td align="center" style="padding: 10px; border: 1px solid #ddd;">High</td>
        <td align="center" style="padding: 10px; border: 1px solid #ddd;">Medium</td>
        <td align="center" style="padding: 10px; border: 1px solid #ddd;">High</td>
      </tr>
      <tr>
        <td style="padding: 10px; border: 1px solid #ddd; text-align: left;">Investigate logistics issues in high-risk regions such as RR where delivery reliability is significantly below the national average</td>
        <td align="center" style="padding: 10px; border: 1px solid #ddd;">High</td>
        <td align="center" style="padding: 10px; border: 1px solid #ddd;">Medium</td>
        <td align="center" style="padding: 10px; border: 1px solid #ddd;">High</td>
      </tr>
      <tr>
        <td style="padding: 10px; border: 1px solid #ddd; text-align: left;">Prioritize operational improvements in states combining high revenue and high risk (e.g., RJ, RS, BA)</td>
        <td align="center" style="padding: 10px; border: 1px solid #ddd;">High</td>
        <td align="center" style="padding: 10px; border: 1px solid #ddd;">Medium</td>
        <td align="center" style="padding: 10px; border: 1px solid #ddd;">High</td>
      </tr>
      <tr>
        <td style="padding: 10px; border: 1px solid #ddd; text-align: left;">Closely track and resolve <strong>orders in progress</strong> to prevent them from converting into lost orders</td>
        <td align="center" style="padding: 10px; border: 1px solid #ddd;">Medium</td>
        <td align="center" style="padding: 10px; border: 1px solid #ddd;">Low</td>
        <td align="center" style="padding: 10px; border: 1px solid #ddd;">High</td>
      </tr>
      <tr>
        <td style="padding: 10px; border: 1px solid #ddd; text-align: left;">Use regional fulfilment KPIs (delivery rate, revenue at risk) as operational performance indicators</td>
        <td align="center" style="padding: 10px; border: 1px solid #ddd;">Medium</td>
        <td align="center" style="padding: 10px; border: 1px solid #ddd;">Low</td>
        <td align="center" style="padding: 10px; border: 1px solid #ddd;">Medium</td>
      </tr>
      <tr>
        <td style="padding: 10px; border: 1px solid #ddd; text-align: left;">Strengthen operational planning for high-demand months to maintain delivery performance as order volume grows</td>
        <td align="center" style="padding: 10px; border: 1px solid #ddd;">Medium</td>
        <td align="center" style="padding: 10px; border: 1px solid #ddd;">Medium</td>
        <td align="center" style="padding: 10px; border: 1px solid #ddd;">Medium</td>
      </tr>
    </tbody>
  </table>
</div>

---

## Expected Business Impact

Improving fulfilment performance in high‑risk regions and reducing the number of non‑delivered orders would directly increase **revenue realization**.

Even small improvements in delivery reliability—especially in high‑revenue states such as SP—could significantly reduce **revenue exposure and operational risk**, strengthening overall financial performance.

---

## Analytical Highlights (What the Data Says)

- **Revenue Exposure:** Although overall delivery performance is strong (97.02%), about **$423.8K of revenue remains at risk** due to lost or in‑progress orders.
- **Regional Concentration:** A significant portion of revenue is concentrated in **SP, RJ, and MG**, meaning operational performance in these states strongly influences total revenue realization.
- **High Absolute Risk Regions:** **SP** generates the largest revenue and therefore the largest absolute revenue exposure when fulfilment performance declines.
- **High Relative Risk Regions:** **RR** shows the highest percentage of revenue at risk and a lower delivery rate compared to the national average, indicating potential logistics inefficiencies.
- **Demand Growth:** Revenue trends show **steady growth during 2017**, suggesting strong customer demand and market expansion.
- **Operational Stability:** Monthly fluctuations in delivery rate indicate that **operational capacity does not always scale smoothly with demand**, especially during high‑volume months.

---

## Data Model

The project follows a **Star Schema architecture**, optimized for analytical performance and scalability.

<div align="center">

<img src="Images/data_model.png" width="750"/>

</div>

### Key Architectural Decisions:
- **Schema:** Star Schema with `fact_orders` at the center, linked to `dim_customer` and `dim_date`.
- **Cardinality:** All relationships are set to **Many-to-One (*:1)**, ensuring a scalable and analytically efficient data structure.
- **Filter Direction:** I enforced **Single Direction** cross-filtering to maintain data integrity, prevent ambiguity in DAX calculations, and optimize query performance—adhering to industry best practices for robust BI modeling.

---

## SQL-driven ETL & Data Transformation Workflow

The analytical dataset was built through a structured, multi-stage SQL ETL (Extract, Transform, Load) process designed to transform raw, denormalized e‑commerce data into a query-optimized analytical model.

### Transformation Workflow:

1. **Data Ingestion (Extract):** Raw CSV datasets were imported into PostgreSQL staging tables.
2. **Data Cleansing & Standardization (Transform):** Standardized date-time formats, handled NULL values, and resolved operational data inconsistencies using SQL scripts.
3. **KPI & Feature Engineering:** Developed analytical views to calculate complex metrics like delivery statuses and operational risk indicators at the database level.
4. **Data Modeling & Loading (Load):** Generated and populated the final **Star Schema** dimension and fact tables (`dim_customer`, `dim_date`, and `fact_orders`) to serve as a clean reporting layer.
5. **BI Integration:** Connected Power BI to the transformed tables, leveraging DAX for high-performance dynamic measures.

*By pushing heavy computations and data prep to the SQL database layer, we significantly reduce Power BI's memory overhead and ensure consistent metric definitions.*

---

## Key DAX Measures (Power BI)

The following DAX measures power the core KPIs used in the Power BI dashboards, enabling analysis of fulfilment performance, revenue exposure, and monthly trends.

```dax
Total Orders =
DISTINCTCOUNT(fact_orders[order_id])

Total Revenue =
SUM(fact_orders[revenue])

Delivered Orders % =
DIVIDE(
    SUM(fact_orders[is_delivered]),
    [Total Orders],
    0
)

Revenue at Risk =
SUM(fact_orders[revenue_at_risk])

Revenue at Risk % =
DIVIDE(
    [Revenue at Risk],
    [Total Revenue],
    0
)

Revenue MoM % =
VAR CurrentOrders = [Total Orders]
VAR CurrentRevenue = [Total Revenue]

VAR PrevMonthOrders =
    CALCULATE(
        [Total Orders],
        DATEADD('dim_date'[date], -1, MONTH)
    )

VAR PrevMonthRevenue =
    CALCULATE(
        [Total Revenue],
        DATEADD('dim_date'[date], -1, MONTH)
    )

RETURN
IF(
    CurrentOrders < 50 || PrevMonthOrders < 50,
    BLANK(),
    DIVIDE(
        CurrentRevenue - PrevMonthRevenue,
        PrevMonthRevenue,
        0
    )
)
```

---

## Tools & Skills Demonstrated

<div dir="ltr" align="center">
  <table style="width: 100%; border-collapse: collapse; text-align: left; border: 1px solid #ddd;">
    <thead>
      <tr style="background-color: #f2f2f2;">
        <th style="padding: 12px; border: 1px solid #ddd; width: 30%;">Area</th>
        <th style="padding: 12px; border: 1px solid #ddd; width: 70%;">Implementation</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td style="padding: 10px; border: 1px solid #ddd;"><strong>SQL Analytics</strong></td>
        <td style="padding: 10px; border: 1px solid #ddd;">Advanced SQL queries for KPI calculation, revenue realization analysis, and operational risk identification.</td>
      </tr>
      <tr>
        <td style="padding: 10px; border: 1px solid #ddd;"><strong>PostgreSQL</strong></td>
        <td style="padding: 10px; border: 1px solid #ddd;">Built a robust SQL-driven ETL workflow using SQL scripts to transform raw data into analytical views (e.g., <code>vw_orders_analytics</code>).</td>
      </tr>
      <tr>
        <td style="padding: 10px; border: 1px solid #ddd;"><strong>Data Modeling</strong></td>
        <td style="padding: 10px; border: 1px solid #ddd;">Implemented a <strong>Star Schema</strong> architecture, optimizing relationships between Fact and Dimension tables for high-performance BI.</td>
      </tr>
      <tr>
        <td style="padding: 10px; border: 1px solid #ddd;"><strong>DAX (Data Analysis Expressions)</strong></td>
        <td style="padding: 10px; border: 1px solid #ddd;">Developed complex measures for real-time KPI tracking, including Revenue at Risk %, Delivery Rates, and growth metrics.</td>
      </tr>
      <tr>
        <td style="padding: 10px; border: 1px solid #ddd;"><strong>Business Intelligence</strong></td>
        <td style="padding: 10px; border: 1px solid #ddd;">Designed interactive Power BI dashboards focusing on regional performance, risk distribution, and time-series trends.</td>
      </tr>
      <tr>
        <td style="padding: 10px; border: 1px solid #ddd;"><strong>Business Insight Generation</strong></td>
        <td style="padding: 10px; border: 1px solid #ddd;">Translated operational metrics into a "Revenue at Risk" framework to identify bottlenecks and provide actionable strategic recommendations.</td>
      </tr>
    </tbody>
  </table>
</div>

---

## Project Structure

```text
Order_Fulfilment_and_Revenue_Risk_Analysis/
├── Dashboards/
│   └── Order_Fulfilment_and_Revenue_Risk_Analysis.pbix    
├── Data/                                                  # Raw datasets
│   ├── olist_customers_dataset.csv
│   ├── olist_order_items_dataset.csv
│   └── olist_orders_dataset.csv
├── Executive_Summary/                                     # PDF Reports (EN/FA)
│   ├── Order_Fulfilment_and_Revenue_Risk_Analysis_Insights_and_Recommendations.pdf
│   └── Order_Fulfilment_and_Revenue_Risk_Analysis_Insights_and_Recommendations_FA.pdf
├── Images/                                                # Dashboard screenshots & assets
│   ├── dashboard1_overview.png
│   ├── dashboard2_regional_analysis.png
│   ├── dashboard3_time_series_analysis.png
│   ├── Order_Fulfilment_and_Revenue_Risk_Analysis_Animation.gif
│   ├── data_model.png
│   └── logo.png
├── Processed_Data/                                        # Final Star Schema tables
│   ├── dim_customer.csv
│   ├── dim_date.csv
│   └── fact_orders.csv
├── Scripts/                                               # SQL Data Transformation
│   ├── 00_setup_database.sql
│   ├── 01_create_tables.sql
│   ├── 02_load_data.sql
│   ├── 03_data_preparation.sql
│   ├── 04_kpi_summary.sql
│   ├── 05_risk_analysis.sql
│   ├── 06_regional_analysis.sql
│   ├── 07_time_series_analysis.sql
│   └── 08_create_fact_dim_tables.sql
├── README.md                                              
└── README_FA.md                                           
```

---

## How to Run

### 1. Run the SQL ETL Scripts

Execute the SQL scripts in strict numerical sequence (00 to 08) to maintain referential integrity and ensure proper database schema initialization.

```text
00_setup_database.sql
01_create_tables.sql
02_load_data.sql
03_data_preparation.sql
04_kpi_summary.sql
05_risk_analysis.sql
06_regional_analysis.sql
07_time_series_analysis.sql
08_create_fact_dim_tables.sql
```

These scripts prepare the dataset, generate analytical views, and create the final fact and dimension tables used for reporting.

#### Transformation Outputs:

- `Processed_Data/dim_customer.csv` – customer dimension table
- `Processed_Data/dim_date.csv` – calendar dimension table
- `Processed_Data/fact_orders.csv` – order-level fact table

### Using the Power BI Dashboards

The Power BI dashboards use the exported CSV files as their data source.

1. Open `Dashboards/Order_Fulfilment_and_Revenue_Risk_Analysis.pbix` in **Power BI Desktop**.  
2. Ensure the file paths point to the following local data files:
   - `Processed_Data/dim_customer.csv`
   - `Processed_Data/dim_date.csv`
   - `Processed_Data/fact_orders.csv`

   (The dashboard expects the same folder structure used in this repository.)
3. Navigate across the three dashboard pages using the built‑in tabs:
   - **Overview**
   - **Regional Analysis**
   - **Time Series Analysis**
4. Explore order fulfilment performance, revenue exposure, and regional or time‑series trends.

These dashboards are designed so that a **non‑technical stakeholder** can quickly answer questions such as:

- What percentage of orders are successfully delivered?
- How much revenue is currently at risk due to lost or incomplete orders?
- Which regions generate high revenue but also show high fulfilment risk?
- How are orders and revenue changing month‑over‑month?

---

## 🗃 Dataset

- **Data Source:** *Brazilian E‑Commerce Public Dataset by Olist* – Kaggle

<div dir="ltr" align="center">
  <table style="width: 100%; border-collapse: collapse; text-align: left; border: 1px solid #ddd;">
    <thead>
      <tr style="background-color: #f2f2f2;">
        <th style="padding: 12px; border: 1px solid #ddd; width: 25%;">Table</th>
        <th style="padding: 12px; border: 1px solid #ddd; width: 20%; text-align: center;">Records</th>
        <th style="padding: 12px; border: 1px solid #ddd; width: 55%;">Key Columns</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td style="padding: 10px; border: 1px solid #ddd;"><strong>customers</strong></td>
        <td style="padding: 10px; border: 1px solid #ddd; text-align: center;">99,441</td>
        <td style="padding: 10px; border: 1px solid #ddd;"><code>customer_id</code>, <code>customer_city</code>, <code>customer_state</code></td>
      </tr>
      <tr>
        <td style="padding: 10px; border: 1px solid #ddd;"><strong>order_items</strong></td>
        <td style="padding: 10px; border: 1px solid #ddd; text-align: center;">112,650</td>
        <td style="padding: 10px; border: 1px solid #ddd;"><code>order_id</code>, <code>price</code>, <code>freight_value</code></td>
      </tr>
      <tr>
        <td style="padding: 10px; border: 1px solid #ddd;"><strong>orders</strong></td>
        <td style="padding: 10px; border: 1px solid #ddd; text-align: center;">99,441</td>
        <td style="padding: 10px; border: 1px solid #ddd;"><code>order_id</code>, <code>customer_id</code>, <code>order_status</code>, <code>order_purchase_timestamp</code></td>
      </tr>
    </tbody>
  </table>
</div>

- **Note on Data Privacy:** This project uses an anonymized public dataset (Olist). No PII (Personally Identifiable Information) is present, ensuring compliance with data protection best practices.

---

## 📁 Deliverables

👉 **Executive Summary ([PDF – English](Executive_Summary/Order_Fulfilment_and_Revenue_Risk_Analysis_Insights_and_Recommendations.pdf)):** A strategic analysis of order fulfilment performance, revenue-at-risk, and regional bottlenecks with actionable optimization recommendations.

👉 **Executive Summary ([PDF – Persian](Executive_Summary/Order_Fulfilment_and_Revenue_Risk_Analysis_Insights_and_Recommendations_FA.pdf)):** Persian version of the executive summary.

👉 **Dashboard Walkthrough (GIF) ([Dashboard Walkthrough – GIF](Images/Order_Fulfilment_and_Revenue_Risk_Analysis_Animation.gif)):** A visual walkthrough demonstrating the analytical dashboard, highlighting revenue risk hotspots and key operational trends.

---

## 👤 Author

**Asma Sistani – Data Analyst**  
Turning complex e-commerce fulfillment data into actionable, revenue-driving insights.

💻 **GitHub:** [![GitHub](https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=github&logoColor=white)](https://github.com/asma-sistani)

🔗 **LinkedIn:** [![LinkedIn](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/asma-sistani)

🌐 **Portfolio:** [![Portfolio](https://img.shields.io/badge/Portfolio-2563EB?style=for-the-badge&logo=google-chrome&logoColor=white)](https://asmatheanalyst.github.io/portfolio.html)

---

**This project shifts the focus from simple delivery volume to strategic revenue realization, identifying operational bottlenecks to convert "Revenue at Risk" into actionable bottom-line growth.**

---

</div>