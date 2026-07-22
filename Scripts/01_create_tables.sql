-- ======================================================
-- PostgreSQL schema for Order Fulfilment & Revenue Risk Analysis
-- Historical dataset; raw records preserved
-- Business validation performed during analysis phase
-- ======================================================

CREATE TABLE customers (
  customer_id VARCHAR PRIMARY KEY,
  customer_unique_id VARCHAR NOT NULL,
  customer_zip_code_prefix INT,
  customer_city VARCHAR NOT NULL,
  customer_state VARCHAR NOT NULL
);


CREATE TABLE products (
  product_id VARCHAR PRIMARY KEY,
  product_category_name VARCHAR,
  product_name_length INT,
  product_description_length INT,
  product_photos_qty INT,
  product_weight_g INT,
  product_length_cm INT,
  product_height_cm INT,
  product_width_cm INT
);

CREATE TABLE orders (
  order_id VARCHAR PRIMARY KEY,
  customer_id VARCHAR NOT NULL,

  order_status VARCHAR NOT NULL
    CHECK (order_status IN (
      'delivered',
      'invoiced',
      'shipped',
      'processing',
      'unavailable',
      'canceled',
      'created',
      'approved'
    )),

  order_purchase_timestamp TIMESTAMP NOT NULL,
  order_approved_at TIMESTAMP,
  order_delivered_carrier_date TIMESTAMP,
  order_delivered_customer_date TIMESTAMP,
  order_estimated_delivery_date TIMESTAMP,

  CONSTRAINT fk_orders_customer
    FOREIGN KEY (customer_id)
    REFERENCES customers(customer_id)
);

CREATE TABLE order_items (
  order_id VARCHAR NOT NULL,
  order_item_id INT NOT NULL,
  product_id VARCHAR NOT NULL,
  seller_id VARCHAR,  -- seller dimension not included in this project scope
  shipping_limit_date TIMESTAMP,
  price NUMERIC(10,2) NOT NULL,
  freight_value NUMERIC(10,2),

  CONSTRAINT pk_order_items
    PRIMARY KEY (order_id, order_item_id),

  CONSTRAINT fk_items_order
    FOREIGN KEY (order_id)
    REFERENCES orders(order_id),

  CONSTRAINT fk_items_product
    FOREIGN KEY (product_id)
    REFERENCES products(product_id)
);

