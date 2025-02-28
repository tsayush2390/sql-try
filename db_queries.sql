-- Create Users Table
CREATE TABLE users (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
);

-- Create Orders Table (Missing Foreign Key Index)
CREATE TABLE orders (
    id INT NOT NULL AUTO_INCREMENT,
    user_id INT NOT NULL,
    total_amount DECIMAL(10,2) NOT NULL,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- Insert Sample Data
INSERT INTO users (name, email) VALUES 
('Alice Johnson', 'alice@example.com'),
('Bob Smith', 'bob@example.com'),
('Charlie Brown', 'charlie@example.com');

INSERT INTO orders (user_id, total_amount) VALUES
(1, 250.50),
(2, 120.75),
(3, 500.00),
(1, 89.99),
(2, 60.49),
(3, 300.00);

-- Problem 1: Inefficient SELECT Query (SELECT * + No Index)
SELECT * FROM orders WHERE user_id IN (SELECT id FROM users WHERE name LIKE '%A%');

-- Problem 2: Inefficient JOIN (No Index on user_id in orders table)
SELECT users.name, orders.total_amount 
FROM users 
JOIN orders ON users.id = orders.user_id 
WHERE orders.total_amount > 100;

-- Problem 3: Poor Pagination (Using OFFSET instead of optimized approach)
SELECT * FROM orders ORDER BY order_date LIMIT 10 OFFSET 1000;

-- Problem 4: Full Table Scan on orders table
SELECT * FROM orders WHERE DATE(order_date) = '2023-01-01';

-- Problem 5: Redundant Subquery (Can be replaced with a JOIN)
SELECT name FROM users WHERE id IN (SELECT user_id FROM orders WHERE total_amount > 200);

-- Problem 6: Missing Index on Foreign Key (user_id should be indexed)
ALTER TABLE orders ADD INDEX idx_user_id (user_id);
