-- Problem 1: Inefficient Full Table Scan
SELECT * FROM users WHERE name LIKE '%A%';

-- Problem 2: Unoptimized JOIN (No Index)
SELECT u.name, o.total_amount 
FROM users u 
JOIN orders o ON u.id = o.user_id
WHERE o.total_amount > 100;

-- Problem 3: Poor Pagination (Using OFFSET)
SELECT * FROM orders ORDER BY order_date LIMIT 10 OFFSET 5000;

-- Problem 4: Subquery Instead of JOIN
SELECT name FROM users WHERE id IN (SELECT user_id FROM orders WHERE total_amount > 200);

-- Problem 5: Full Table Scan on Dates
SELECT * FROM orders WHERE DATE(order_date) = '2023-01-01';
