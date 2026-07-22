
-- ======================================================
-- 02_load_data.sql
-- Load CSV files using psql \copy (local & GitHub friendly)
-- Assumes CSV files exist in /data directory
-- ======================================================

\copy customers FROM 'data/olist_customers_dataset.csv'
CSV HEADER
NULL ''
ENCODING 'UTF8';

\copy products FROM 'data/olist_products_dataset.csv'
CSV HEADER
NULL ''
ENCODING 'UTF8';

\copy orders FROM 'data/olist_orders_dataset.csv'
CSV HEADER
NULL ''
ENCODING 'UTF8';

\copy order_items FROM 'data/olist_order_items_dataset.csv'
CSV HEADER
NULL ''
ENCODING 'UTF8';

