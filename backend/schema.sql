CREATE DATABASE user_auth;

USE user_auth;

-- Users Table (Security Upgrade: Hashed passwords, unique emails)
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,  -- Ensures unique emails
    password_hash VARCHAR(255) NOT NULL,  -- Secure password storage
    role_id INT DEFAULT 2,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (role_id) REFERENCES roles(id) ON DELETE SET NULL  -- Ensures role consistency
);

-- Roles Table (Role-based access control)
CREATE TABLE roles (
    id INT AUTO_INCREMENT PRIMARY KEY,
    role_name VARCHAR(50) NOT NULL UNIQUE  -- Ensures unique role names
);

-- Login Attempts Table (Performance Fix: Added Index)
CREATE TABLE login_attempts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    attempt_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    ip_address VARCHAR(45),
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    INDEX (user_id)  -- Improves lookup speed
);

-- Sessions Table (Security Upgrade: Secure token size, Index for fast lookups)
CREATE TABLE sessions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    session_token VARCHAR(64) NOT NULL,  -- Secure length for token storage
    expires_at TIMESTAMP NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    INDEX (session_token)  -- Speeds up authentication lookups
);
