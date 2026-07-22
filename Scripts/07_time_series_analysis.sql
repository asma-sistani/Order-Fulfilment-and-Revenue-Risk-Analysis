-- ======================================================
-- 04_time_series_analysis.sql
-- Purpose: Analyze temporal patterns in order volume,
--          fulfilment outcomes, and revenue realization
--          over time to identify trends, seasonality,
--          and periods of elevated operational and
--          financial risk.
-- Data Source: vw_orders_analytics
-- Granularity: Order-level data aggregated by time period
--              (month-level via order_purchase_timestamp)
-- Scope: Portfolio Project – Order Fulfilment & Revenue Risk Analysis
-- Notes:
--   • Time series analysis is conducted at monthly level
--     to balance trend visibility and noise reduction.
--   • Revenue at Risk includes all non-delivered orders
--     within each time period.
--   • Results highlight periods where demand growth is
--     not matched by fulfilment performance, indicating
--     execution bottlenecks rather than demand volatility.
-- ======================================================
-- Orders and Revenue by Month
SELECT 
    TO_CHAR(order_month, 'YYYY-MM') AS order_month,
    COUNT(order_id) AS total_orders,
    SUM(COALESCE(revenue,0)) AS total_revenue
FROM vw_orders_analytics
GROUP BY order_month
ORDER BY order_month;
---------------------------------------------------------
-- Fulfilment Performcance by Month
WITH monthly AS (
    SELECT 
    order_month,
    COUNT(order_id) AS total_orders,
    COUNT(order_id) FILTER(WHERE order_lifecycle_status = 'delivered') AS delivered_orders,
    COUNT(order_id) FILTER(WHERE order_lifecycle_status IS DISTINCT FROM 'delivered') AS non_delivered_orders
FROM vw_orders_analytics
GROUP BY order_month
)
SELECT 
    TO_CHAR(order_month, 'YYYY-MM') AS order_month,
    total_orders,
    delivered_orders,
    non_delivered_orders,
    ROUND(100*(delivered_orders::numeric /NULLIF(total_orders,0)),2) AS delivered_rate_pct
FROM monthly
ORDER BY order_month;
---------------------------------------------------------
-- Revenue at Risk by Month
WITH monthly AS (
    SELECT 
    order_month,
    SUM(COALESCE(revenue,0)) AS total_revenue,
    SUM(COALESCE(revenue,0)) FILTER(WHERE order_lifecycle_status IS DISTINCT FROM 'delivered') AS revenue_at_risk
    FROM vw_orders_analytics
    GROUP BY order_month
)
SELECT 
    TO_CHAR(order_month, 'YYYY-MM') AS order_month,
    total_revenue,
    COALESCE(revenue_at_risk,0) AS revenue_at_risk,
    ROUND(100*(COALESCE(revenue_at_risk,0)::numeric/NULLIF(total_revenue,0)),2) AS revenue_at_risk_pct
FROM monthly
ORDER BY order_month;
---------------------------------------------------------
-- MoM (orders, revenue, delivery rate, revenue-at-risk%)
WITH monthly AS (
    SELECT 
    order_month,
    COUNT(order_id) AS total_orders,
    SUM(COALESCE(revenue,0)) AS total_revenue,
    SUM(COALESCE(revenue,0)) FILTER (WHERE order_lifecycle_status IS DISTINCT FROM 'delivered') AS revenue_at_risk,
    COUNT(order_id) FILTER (WHERE order_lifecycle_status = 'delivered') AS delivered_orders,
    ROUND(100*(COUNT(order_id) FILTER (WHERE order_lifecycle_status = 'delivered')::numeric
    /NULLIF(COUNT(order_id),0)),2) AS delivered_rate_pct
    FROM vw_orders_analytics
    GROUP BY order_month
)
    SELECT 
        TO_CHAR(order_month,'YYYY-MM') AS order_month,
    CASE WHEN total_orders < 50 OR COALESCE(LAG(total_orders) OVER (ORDER BY order_month), 0) < 50 THEN NULL
    ELSE ROUND(100 * (total_orders - LAG(total_orders) OVER (ORDER BY order_month))::numeric
        / NULLIF(LAG(total_orders) OVER (ORDER BY order_month), 0),2) END AS mom_total_orders_pct,

    CASE WHEN total_orders < 50 OR COALESCE(LAG(total_orders) OVER (ORDER BY order_month), 0) < 50 THEN NULL
    ELSE ROUND(100 * (total_revenue - LAG(total_revenue,1) OVER (ORDER BY order_month))::numeric
        / NULLIF(LAG(total_revenue,1) OVER (ORDER BY order_month), 0),2) END AS mom_total_revenue_pct,

    CASE WHEN total_orders < 50 OR COALESCE(LAG(total_orders) OVER (ORDER BY order_month), 0) < 50 THEN NULL
    ELSE ROUND(100 * (revenue_at_risk - LAG(revenue_at_risk,1) OVER (ORDER BY order_month))::numeric
        / NULLIF(LAG(revenue_at_risk,1) OVER (ORDER BY order_month), 0),2) END AS mom_revenue_at_risk_pct,

    CASE WHEN total_orders < 50 OR COALESCE(LAG(total_orders) OVER (ORDER BY order_month), 0) < 50 THEN NULL
    ELSE ROUND(delivered_rate_pct - LAG(delivered_rate_pct) OVER (ORDER BY order_month),2) END AS mom_delivered_rate_pp
FROM monthly
ORDER BY order_month;
---------------------------------------------------------
-- Rolling 3-Month Trend Analysis (orders, revenue, delivery rate, revenue-at-risk%)
WITH monthly AS (
    SELECT 
    order_month,
    COUNT(order_id) AS total_orders,
    SUM(COALESCE(revenue,0)) AS total_revenue,
    SUM(COALESCE(revenue,0)) FILTER (WHERE order_lifecycle_status IS DISTINCT FROM 'delivered') AS revenue_at_risk,
    COUNT(order_id) FILTER (WHERE order_lifecycle_status = 'delivered') AS delivered_orders,
    ROUND(100*(COUNT(order_id) FILTER (WHERE order_lifecycle_status = 'delivered')::numeric
    /NULLIF(COUNT(order_id),0)),2) AS delivered_rate_pct
    FROM vw_orders_analytics
    GROUP BY order_month
)
SELECT 
    TO_CHAR(order_month,'YYYY-MM') AS order_month,
    CASE WHEN MIN(total_orders) OVER (ORDER BY order_month ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) < 50 OR 
    COUNT(*) OVER (ORDER BY order_month ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) < 3 THEN NULL
    ELSE ROUND(AVG(total_orders::numeric) OVER(ORDER BY order_month ROWS BETWEEN 2 PRECEDING AND CURRENT ROW),2) END AS rolling_3m_avg_orders,

    CASE WHEN MIN(total_orders) OVER (ORDER BY order_month ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) < 50 OR 
    COUNT(*) OVER (ORDER BY order_month ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) < 3 THEN NULL
    ELSE ROUND(AVG(total_revenue::numeric) OVER(ORDER BY order_month ROWS BETWEEN 2 PRECEDING AND CURRENT ROW),2) END AS rolling_3m_avg_revenue,
    
    CASE WHEN MIN(total_orders) OVER (ORDER BY order_month ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) < 50 OR 
    COUNT(*) OVER (ORDER BY order_month ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) < 3 THEN NULL
    ELSE ROUND(AVG(revenue_at_risk::numeric) OVER(ORDER BY order_month ROWS BETWEEN 2 PRECEDING AND CURRENT ROW),2) END AS rolling_3m_avg_revenue_at_risk,
    
    CASE WHEN MIN(total_orders) OVER (ORDER BY order_month ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) < 50 OR 
    COUNT(*) OVER (ORDER BY order_month ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) < 3 THEN NULL
    ELSE ROUND(AVG(delivered_rate_pct::numeric) OVER(ORDER BY order_month ROWS BETWEEN 2 PRECEDING AND CURRENT ROW),2) END AS rolling_3m_avg_delivered_rate_pct
FROM monthly
ORDER BY order_month;
---------------------------------------------------------
