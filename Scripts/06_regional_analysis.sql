-- ======================================================
-- 03_regional_analysis.sql
-- Purpose: Analyze regional patterns in order volume,
--          fulfilment quality, and revenue exposure to
--          identify geographic areas with elevated
--          operational and financial risk.
-- Data Source: vw_orders_analytics
-- Granularity: Order-level aggregation by customer_state
-- Scope: Portfolio Project – Order Fulfilment & Revenue Risk Analysis
-- Notes:
--   • Regional analysis is performed at state level to
--     balance insight clarity and decision relevance.
--   • Revenue at Risk includes all non-delivered orders.
--   • Results support prioritization of regions where
--     high revenue concentration overlaps with weak
--     fulfilment performance.
-- ======================================================

-- Total Orders and Revenue Distribution by State
SELECT 
    customer_state,
    COUNT(order_id) AS total_orders,
    SUM(revenue) AS total_revenue,
    ROUND(
        100.0 * COUNT(order_id)
        / SUM(COUNT(order_id)) OVER (),
        2
    ) AS order_share_pct,
    ROUND(
        100.0 * SUM(revenue)
        / SUM(SUM(revenue)) OVER (),
        2
    ) AS revenue_share_pct
FROM vw_orders_analytics
GROUP BY customer_state
ORDER BY total_orders DESC;
---------------------------------------------------------
-- Delivered Orders by State
SELECT 
    customer_state,
    COUNT(order_id) AS total_orders,
    COUNT(*) FILTER (WHERE order_lifecycle_status = 'delivered') AS delivered_orders,
    ROUND(
        100 * (COUNT(*) FILTER (WHERE order_lifecycle_status = 'delivered')::numeric
        /COUNT(order_id)), 2) AS delivered_rate_pct
FROM vw_orders_analytics
GROUP BY customer_state;
---------------------------------------------------------
-- Revenue and Revenue at Risk by State
SELECT 
    customer_state,
    SUM(COALESCE(revenue,0)) AS total_revenue,
    SUM(COALESCE(revenue,0)) FILTER(WHERE order_lifecycle_status <> 'delivered') AS revenue_at_risk,
    ROUND(
        100 * (SUM(revenue) FILTER(WHERE order_lifecycle_status <> 'delivered')::numeric
        / SUM(revenue)), 2) AS revenue_at_risk_pct
FROM vw_orders_analytics
GROUP BY customer_state;
---------------------------------------------------------
-- Priority Regions Based on Revenue Scale and Fulfilment Risk
SELECT
    customer_state,
    SUM(COALESCE(revenue,0)) AS total_revenue,
    SUM(COALESCE(revenue,0)) FILTER(WHERE order_lifecycle_status <> 'delivered') AS revenue_at_risk,
    ROUND(100.0 *(SUM(revenue) FILTER (WHERE order_lifecycle_status <> 'delivered')
    /SUM(revenue)),2) AS revenue_at_risk_pct  
FROM vw_orders_analytics 
GROUP BY customer_state
HAVING SUM(COALESCE(revenue,0)) > (SELECT AVG(state_revenue)
                                    FROM(
                                        SELECT SUM(COALESCE(revenue,0)) AS state_revenue
                                        FROM vw_orders_analytics 
                                        GROUP BY customer_state
                                    ) AS s1)
                                
AND (SUM(revenue) FILTER (WHERE order_lifecycle_status <> 'delivered')/SUM(revenue))
        > (SELECT AVG(state_revenue_at_risk)
        FROM (SELECT 
        (SUM(revenue) FILTER (WHERE order_lifecycle_status <> 'delivered') /SUM(revenue)) AS state_revenue_at_risk
        FROM vw_orders_analytics 
        GROUP BY customer_state
        ) AS s2);

