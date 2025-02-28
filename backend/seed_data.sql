USE user_auth;

-- Insert Roles
INSERT INTO roles (role_name) VALUES ('admin'), ('user');

-- Insert Users (Security Issue: Plaintext Passwords)
INSERT INTO users (username, email, password, role_id) VALUES
('Alice', 'alice@example.com', 'password123', 1),
('Bob', 'bob@example.com', 'letmein', 2),
('Charlie', 'charlie@example.com', '123456', 2),
('David', 'david@example.com', 'qwerty', 2),
('Eve', 'eve@example.com', 'password', 2);

-- Insert Login Attempts (Performance Issue: No Indexing)
INSERT INTO login_attempts (user_id, attempt_time, ip_address) VALUES
(2, NOW(), '192.168.1.1'),
(3, NOW(), '192.168.1.2'),
(4, NOW(), '192.168.1.3'),
(5, NOW(), '192.168.1.4'),
(2, NOW(), '192.168.1.1');

-- Insert Active Sessions
INSERT INTO sessions (user_id, session_token, expires_at) VALUES
(1, 'abc123xyz', DATE_ADD(NOW(), INTERVAL 1 DAY)),
(2, 'def456uvw', DATE_ADD(NOW(), INTERVAL 1 DAY));
