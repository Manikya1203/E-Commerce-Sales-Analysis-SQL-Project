
                                                        --     E-COMMERCE SALES 

-- Total Revenue Analysis-- 
SELECT SUM(p.price * oi.quantity) AS total_revenue
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id;

-- Top 5 Selling Products-- 
SELECT p.product_name,
SUM(p.price * oi.quantity) AS total_sales
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.product_name
ORDER BY total_sales DESC
LIMIT 5;

-- MONTHLY SALES TREND-- 
SELECT monthname(o.order_date) AS month,
SUM(p.price * oi.quantity) AS monthly_revenue
FROM orders o
JOIN order_items oi 
ON o.order_id = oi.order_id
JOIN products p 
ON oi.product_id = p.product_id
GROUP BY month(o.order_date), monthname(o.order_date)
ORDER BY month(order_date);

-- City-wise Revenue-- 
SELECT 
c.city,
SUM(p.price * oi.quantity) AS city_revenue
FROM customers c
JOIN orders o 
ON c.customer_id = o.customer_id
JOIN order_items oi 
ON o.order_id = oi.order_id
JOIN products p 
ON oi.product_id = p.product_id
GROUP BY c.city
ORDER BY city_revenue DESC;


-- Cancelled Order Percentage-- 
SELECT 
order_status,
COUNT(order_id) AS total_orders,
ROUND(COUNT(order_id) * 100.0 / 
(SELECT COUNT(*) FROM orders), 2) AS percentage
FROM orders
GROUP BY order_status;

-- Average Order Value (AOV) Analysis-- 
SELECT 
ROUND(SUM(p.price * oi.quantity) / COUNT(DISTINCT o.order_id), 2) AS average_order_value
FROM orders o
JOIN order_items oi 
ON o.order_id = oi.order_id
JOIN products p 
ON oi.product_id = p.product_id;

-- Customers Who Never Ordered-- 
SELECT c.customer_name
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;


