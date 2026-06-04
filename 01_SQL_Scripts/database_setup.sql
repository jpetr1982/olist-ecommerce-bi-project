======================================================================
1. POSTGRESQL CODE (DATABASE CONFIGURATION & MASTER VIEW)
======================================================================

-- 1.1 Δημιουργία των 5 Βασικών Πινάκων (DDL Scripts)

CREATE TABLE customers (
    customer_id VARCHAR(50) PRIMARY KEY,
    customer_unique_id VARCHAR(50),
    customer_zip_code_prefix INT,
    customer_city VARCHAR(100),
    customer_state VARCHAR(10)
);

CREATE TABLE products (
    product_id VARCHAR(50) PRIMARY KEY,
    product_category_name VARCHAR(100),
    product_name_lenght INT,
    product_description_lenght INT,
    product_photos_qty INT,
    product_weight_g INT,
    product_length_cm INT,
    product_height_cm INT,
    product_width_cm INT
);

CREATE TABLE orders (
    order_id VARCHAR(50) PRIMARY KEY,
    customer_id VARCHAR(50) REFERENCES customers(customer_id),
    order_status VARCHAR(20),
    order_purchase_timestamp TIMESTAMP,
    order_approved_at TIMESTAMP,
    order_delivered_carrier_date TIMESTAMP,
    order_delivered_customer_date TIMESTAMP,
    order_estimated_delivery_date TIMESTAMP
);

CREATE TABLE order_items (
    order_id VARCHAR(50) REFERENCES orders(order_id),
    order_item_id INT,
    product_id VARCHAR(50) REFERENCES products(product_id),
    seller_id VARCHAR(50),
    shipping_limit_date TIMESTAMP,
    price NUMERIC(10, 2),
    freight_value NUMERIC(10, 2),
    PRIMARY KEY (order_id, order_item_id)
);

CREATE TABLE order_payments (
    order_id VARCHAR(50) REFERENCES orders(order_id),
    payment_sequential INT,
    payment_type VARCHAR(50),
    payment_installments INT,
    payment_value NUMERIC(10, 2),
    PRIMARY KEY (order_id, payment_sequential)
);


-- 1.2 Δημιουργία του Master Sales View (Data Modeling για BI)

CREATE OR REPLACE VIEW view_master_sales AS
SELECT 
    o.order_id,
    o.order_purchase_timestamp AS purchase_date,
    o.order_status,
    c.customer_unique_id AS customer_id,
    c.customer_city,
    c.customer_state,
    p.product_id,
    p.product_category_name AS category,
    oi.order_item_id AS quantity_rank,
    oi.price,
    oi.freight_value AS shipping_cost,
    (oi.price + oi.freight_value) AS total_value,
    pay.payment_type,
    pay.payment_installments
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
JOIN order_payments pay ON o.order_id = pay.order_id
WHERE o.order_status = 'delivered';


-- 1.3 Έλεγχος των Δεδομένων

SELECT * FROM view_master_sales LIMIT 10;



======================================================================
2. POWER BI CODE (DAX MEASURES & CALENDAR TABLE)
======================================================================

-- 2.1 Δημιουργία Πίνακα Ημερολογίου (Modeling -> New Table)

Calendar = CALENDARAUTO()


-- 2.2 Δημιουργία DAX Measures (Home -> New Measure)
-- Σημείωση: Αντικαταστήστε το 'view_master_sales' με το όνομα του πίνακα σας.

Total Sales = 
SUM('view_master_sales'[total_value])


Total Orders = 
DISTINCTCOUNT('view_master_sales'[order_id])


Average Order Value = 
[Total Sales] / [Total Orders]
======================================================================