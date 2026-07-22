-- ======================================================
-- 01_kpi_summary.sql
-- Purpose: Generate executive-level KPI metrics to
--          assess order fulfilment quality, revenue
--          realization, and financial risk exposure.
-- Data Source: vw_orders_analytics
-- Scope: Portfolio Project – Order Fulfilment & Revenue Risk Analysis
-- All KPIs are calculated at order-level granularity (1 row per order)
-- ======================================================

-- Total Orders
SELECT
    COUNT(order_id) AS total_orders
FROM 
    vw_orders_analytics;
---------------------------------------------------------
-- Total Revenue
SELECT
    SUM(COALESCE(revenue,0)) AS total_revenue
FROM 
    vw_orders_analytics;
---------------------------------------------------------
-- Delivered Orders
SELECT
    COUNT(order_id) AS delivered_orders
FROM 
    vw_orders_analytics
WHERE
    order_lifecycle_status = 'delivered';
---------------------------------------------------------
-- Percentage of Delivered Orders
SELECT
    ROUND(
        100 *
        SUM(CASE WHEN order_lifecycle_status = 'delivered' THEN 1 ELSE 0 END)::numeric
        / NULLIF(COUNT(order_id), 0)
    , 2) AS delivered_rate_pct
FROM 
    vw_orders_analytics;
---------------------------------------------------------
-- Lost Orders
SELECT
    COUNT(order_id) AS lost_orders
FROM 
    vw_orders_analytics
WHERE
    order_lifecycle_status = 'lost';
---------------------------------------------------------
-- Percentage of Lost Orders
SELECT ROUND(
            100*
            SUM(CASE WHEN order_lifecycle_status = 'lost' THEN 1 ELSE 0 END)::numeric
            / NULLIF(COUNT(order_id),0)
            ,2) AS lost_rate_pct
FROM 
    vw_orders_analytics;
---------------------------------------------------------
-- In_Progress Orders
SELECT
    COUNT(order_id) AS in_progress_orders,
    order_purchase_timestamp
    
FROM 
    vw_orders_analytics
WHERE
    order_lifecycle_status = 'in_progress'
group by order_purchase_timestamp

---------------------------------------------------------
-- Percentage of In_Progress Orders
SELECT ROUND(
            100*
            SUM(CASE WHEN order_lifecycle_status = 'in_progress' THEN 1 ELSE 0 END)::numeric
            / NULLIF(COUNT(order_id),0)
            ,2) AS in_progress_rate_pct
FROM 
    vw_orders_analytics;
