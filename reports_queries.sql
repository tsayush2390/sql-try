-- Generate Sales Report (Slow Aggregation)
SELECT p.name, SUM(oi.quantity) AS total_sold, SUM(oi.price * oi.quantity) AS total_revenue
FROM products p
JOIN order_items oi ON p.id = oi.product_id
GROUP BY p.name
ORDER BY total_revenue DESC;

-- Find Top Customers (Slow GROUP BY)
SELECT u.name, SUM(o.total_amount) AS total_spent
FROM users u
JOIN orders o ON u.id = o.user_id
GROUP BY u.id
ORDER BY total_spent DESC
LIMIT 5;
