-- ======================================================
-- 02_risk_analysis.sql
-- Purpose: Quantify revenue exposure caused by fulfilment
--          failures and execution delays, and identify
--          high-risk regions based on both absolute
--          financial impact and relative process risk.
-- Data Source: vw_orders_analytics
-- Scope: Portfolio Project – Order Fulfilment & Revenue Risk Analysis
-- Notes:
--   • Revenue at Risk includes orders with status:
--     ('lost', 'in_progress')
--   • Analysis distinguishes between:
--       - Absolute Revenue Risk (scale-driven exposure)
--       - Relative Revenue Risk (process inefficiency)
-- ======================================================

-- Revenue at Risk
SELECT 
    SUM(COALESCE(revenue,0)) AS revenue_at_risk
FROM 
    vw_orders_analytics
WHERE
    order_lifecycle_status <> 'delivered';
---------------------------------------------------------
-- Revenue Realized
SELECT 
    SUM(COALESCE(revenue,0)) AS revenue_realized
FROM 
    vw_orders_analytics
WHERE
    order_lifecycle_status = 'delivered';
---------------------------------------------------------
-- Percentage of Revenue at Risk
SELECT
    ROUND(100 *
    (SUM(CASE WHEN order_lifecycle_status <> 'delivered' THEN COALESCE(revenue,0) END)
    / NULLIF(SUM(COALESCE(revenue,0)),0))
    ,2) AS revenue_at_risk_pct
FROM
    vw_orders_analytics
---------------------------------------------------------
-- Top 5 States by Absolute Revenue Risk
WITH state_risk AS (
    SELECT
        customer_state,
        COUNT(order_id) AS total_orders,
        SUM(COALESCE(revenue,0)) AS total_revenue,
        SUM(CASE WHEN order_lifecycle_status <> 'delivered'
                THEN COALESCE(revenue,0)
                ELSE 0 END) AS revenue_at_risk,
        ROUND(100 *SUM(CASE WHEN order_lifecycle_status <> 'delivered'
                    THEN COALESCE(revenue,0)
                    ELSE 0 END)::numeric / NULLIF(SUM(COALESCE(revenue,0)),0), 2) AS revenue_at_risk_pct
    FROM vw_orders_analytics
    GROUP BY customer_state
)
SELECT *
FROM state_risk
ORDER BY revenue_at_risk DESC
LIMIT 5;
---------------------------------------------------------
-- Top 5 States by Process Revenue Risk
WITH state_risk AS (
    SELECT
        customer_state,
        COUNT(order_id) AS total_orders,
        SUM(COALESCE(revenue,0)) AS total_revenue,
        SUM(CASE WHEN order_lifecycle_status <> 'delivered'
                THEN COALESCE(revenue,0)
                ELSE 0 END) AS revenue_at_risk,
        ROUND(100 * SUM (CASE WHEN order_lifecycle_status <> 'delivered'
                    THEN COALESCE(revenue,0)
                    ELSE 0 END)::numeric / NULLIF(SUM(COALESCE(revenue,0)),0), 2) AS revenue_at_risk_pct
    FROM vw_orders_analytics
    GROUP BY customer_state
)
SELECT *
FROM state_risk
ORDER BY revenue_at_risk_pct DESC
LIMIT 5;