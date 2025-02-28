# Ecommerce_DB_Performance_Test

This project contains a sample e-commerce database with **performance bottlenecks** for testing query optimization tools like the AI Database Query Reviewer.

## Files Included

- `db_schema.sql` – Defines tables and relationships.
- `seed_data.sql` – Populates test data.
- `problematic_queries.sql` – Contains inefficient queries for optimization.
- `reports_queries.sql` – Complex analytics queries.
- `transactions_test.sql` – Simulates real-world transactions with concurrency issues.

## How to Use

1. Load the schema and seed data into your database.
2. Run queries from `problematic_queries.sql` and `reports_queries.sql`.
3. Use the AI Agent to detect and optimize bottlenecks.
4. Test high-load transactions with `transactions_test.sql`.
