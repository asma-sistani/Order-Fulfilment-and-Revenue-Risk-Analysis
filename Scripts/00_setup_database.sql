-- ======================================================
-- 00_setup_database.sql
-- Purpose: create dedicated database for SQL analytics project
-- ======================================================

CREATE DATABASE ecommerce_sql
  WITH
    ENCODING = 'UTF8'
    LC_COLLATE = 'en_US.UTF-8'
    LC_CTYPE = 'en_US.UTF-8'
    TEMPLATE = template0;

-- connect to database
\c ecommerce_sql;

-- standard timezone for analytics
SET TIME ZONE 'UTC';

