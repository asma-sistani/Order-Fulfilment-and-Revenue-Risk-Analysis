-- ======================================================
-- 04_create_star_schema.sql
-- Purpose: Create dimensional and fact tables for Power BI analytics
--          based on order, customer, and product data.
-- Scope: Portfolio Project – Order Fulfilment & Revenue Risk Analysis
-- Notes:
--   • Dimension tables capture customer, product, and time details.
--   • Fact table captures order-level metrics (revenue, lifecycle status, revenue at risk).
--   • Designed for integration into Power BI data model.
-- ======================================================

-- Create Fact_Orders table
DROP TABLE IF EXISTS fact_orders;
CREATE TABLE fact_orders AS (
SELECT 
    order_id,
    customer_id,
    DATE(order_purchase_timestamp) AS order_date,
    order_lifecycle_status,
    COALESCE(revenue,0) AS revenue,
    CASE WHEN order_lifecycle_status = 'delivered' THEN 1 ELSE 0 END AS is_delivered,
    CASE WHEN order_lifecycle_status = 'lost' THEN 1 ELSE 0 END AS is_lost,
    CASE WHEN order_lifecycle_status = 'in_progress' THEN 1 ELSE 0 END AS is_in_progress,
    CASE WHEN order_lifecycle_status <> 'delivered' THEN COALESCE(revenue,0) ELSE 0 END AS revenue_at_risk
FROM 
    vw_orders_analytics;
)
---------------------------------------------------------
-- Create Dim_Customer table
DROP TABLE IF EXISTS dim_customer;
CREATE TABLE dim_customer AS (
SELECT 
    customer_id,
    customer_state,
    customer_city
FROM 
    customers;
)
---------------------------------------------------------
-- Create Dim_Date table
DROP TABLE IF EXISTS dim_date;
CREATE TABLE dim_date AS (
SELECT 
    DATE(order_purchase_timestamp) AS date,
    EXTRACT(YEAR FROM DATE(order_purchase_timestamp))::INT AS year,
    EXTRACT(MONTH FROM DATE(order_purchase_timestamp))::INT AS month_number,
    TRIM(TO_CHAR(DATE(order_purchase_timestamp),'Month')) AS month_name,
    EXTRACT(QUARTER FROM DATE(order_purchase_timestamp))::INT AS quarter
FROM 
    vw_orders_analytics
GROUP BY DATE(order_purchase_timestamp)
ORDER BY date;
)
---------------------------------------------------------