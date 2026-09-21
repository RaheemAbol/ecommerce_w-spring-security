USE ecommerce_day2;

-- Adds only the security table. Existing products and vendors remain unchanged.
CREATE TABLE IF NOT EXISTS app_users (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    display_name VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    password_hash VARCHAR(100) NOT NULL,
    role VARCHAR(20) NOT NULL
);

-- After registering admin@example.test through the application, an instructor
-- with database access can promote that specific demonstration account:
-- UPDATE app_users SET role = 'ADMIN' WHERE email = 'admin@example.test';
-- Log out and log in again after promotion. Never accept a role at registration.
