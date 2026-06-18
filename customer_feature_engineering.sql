-- Feature Engineering: Transforming transactional data into customer-level behavioral profiles
-- Creates the foundational dataset for K-Means clustering in Python
WITH customer_sales_metrics AS (
    SELECT 
        customer_id,
        COUNT(order_id) AS order_frequency,
        SUM(revenue) AS total_lifetime_revenue,
        ROUND(AVG(revenue), 2) AS average_order_value
    FROM orders
    GROUP BY customer_id
),
customer_logistics_friction AS (
    SELECT 
        o.customer_id,
        SUM(CASE WHEN s.actual_delivery_date > s.promised_delivery_date THEN 1 ELSE 0 END) AS total_sla_delays
    FROM shipping_ops s
    JOIN orders o ON s.order_id = o.order_id
    GROUP BY o.customer_id
)
SELECT 
    c.customer_id,
    c.segment AS database_declared_segment, -- SMB vs Enterprise
    COALESCE(s.order_frequency, 0) AS order_frequency,
    COALESCE(s.total_lifetime_revenue, 0.00) AS total_revenue,
    COALESCE(s.average_order_value, 0.00) AS avg_order_value,
    COALESCE(f.total_sla_delays, 0) AS sla_delays_experienced
FROM customer_profiles c
LEFT JOIN customer_sales_metrics s ON c.customer_id = s.customer_id
LEFT JOIN customer_logistics_friction f ON c.customer_id = f.customer_id
ORDER BY total_revenue DESC;
