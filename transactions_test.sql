-- Begin Transaction (Risk of Deadlock if Multiple Users Run This)
START TRANSACTION;

-- Check Product Stock (Unoptimized SELECT)
SELECT stock FROM products WHERE id = 1;

-- Update Stock (No Index, Risk of Deadlock)
UPDATE products SET stock = stock - 1 WHERE id = 1;

-- Insert Order
INSERT INTO orders (user_id, total_amount) VALUES (1, 1200.00);

-- Insert Order Item
INSERT INTO order_items (order_id, product_id, quantity, price) VALUES (LAST_INSERT_ID(), 1, 1, 1200.00);

COMMIT;
