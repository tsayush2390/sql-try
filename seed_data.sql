-- Insert Users
INSERT INTO users (name, email) VALUES 
('Alice Johnson', 'alice@example.com'),
('Bob Smith', 'bob@example.com'),
('Charlie Brown', 'charlie@example.com');

-- Insert Products
INSERT INTO products (name, price, stock) VALUES
('Laptop', 1200.00, 10),
('Smartphone', 800.00, 20),
('Headphones', 150.00, 30);

-- Insert Orders
INSERT INTO orders (user_id, total_amount) VALUES
(1, 1200.00), (2, 800.00), (3, 150.00);

-- Insert Order Items (Repeated Data)
INSERT INTO order_items (order_id, product_id, quantity, price) VALUES
(1, 1, 1, 1200.00),
(2, 2, 1, 800.00),
(3, 3, 1, 150.00);
