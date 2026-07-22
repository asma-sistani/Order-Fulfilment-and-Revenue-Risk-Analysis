-- ======================================================
-- 03_data_preparation.sql
-- Purpose: analytical-ready views (no updates on raw tables)
-- ======================================================
DROP VIEW IF EXISTS vw_order_lifecycle;
CREATE OR REPLACE VIEW vw_order_lifecycle AS
SELECT 
    order_id,
    customer_id,
    order_purchase_timestamp,
    order_status,
    CASE WHEN LOWER(TRIM(order_status)) = 'delivered' THEN 'delivered'
        WHEN LOWER(TRIM(order_status)) IN('canceled', 'unavailable') THEN 'lost'
        ELSE 'in_progress'
    END AS order_lifecycle_status
FROM 
    orders;
---------------------------------------------------------
DROP VIEW IF EXISTS vw_order_revenue;
CREATE OR REPLACE VIEW vw_order_revenue AS
SELECT 
    order_id,
    SUM(COALESCE(price,0)+ COALESCE(freight_value,0)) AS revenue
FROM 
    order_items
GROUP BY 
    order_id;
---------------------------------------------------------
DROP VIEW IF EXISTS vw_orders_analytics;
CREATE OR REPLACE VIEW vw_orders_analytics AS 
SELECT 
    o.order_id,
    order_purchase_timestamp,
    DATE_TRUNC('month',order_purchase_timestamp) AS order_month,
    c.customer_id,
    customer_state,
    customer_city,
    order_lifecycle_status,
    revenue
FROM 
    vw_order_lifecycle AS o
    LEFT JOIN vw_order_revenue AS r
    ON o.order_id = r.order_id
    LEFT JOIN customers AS c
    ON o.customer_id = c.customer_id;


