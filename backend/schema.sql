CREATE DATABASE user_auth;

USE user_auth;

-- Users Table (Missing Unique Constraint on Email)
CREATE TABLE users (
    id INT NOT NULL AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    password VARCHAR(255) NOT NULL,  -- Storing plaintext passwords (Security Issue)
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
);
