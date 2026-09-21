CREATE DATABASE IF NOT EXISTS ecommerce_day2;
USE ecommerce_day2;

CREATE TABLE vendors (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL
);

CREATE TABLE products (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    category VARCHAR(40) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    vendor_id BIGINT NOT NULL,
    CONSTRAINT fk_product_vendor
        FOREIGN KEY (vendor_id) REFERENCES vendors(id)
);

INSERT INTO vendors (id, name, email) VALUES
    (1, 'Northline Office', 'northline@example.test'),
    (2, 'Brightwire Tech', 'brightwire@example.test'),
    (3, 'Trailside Supply', 'trailside@example.test');

INSERT INTO products (id, name, category, price, vendor_id) VALUES
    (101, 'Desk Lamp', 'OFFICE', 39.99, 1),
    (102, 'Notebook Set', 'OFFICE', 12.50, 1),
    (103, 'USB-C Hub', 'ELECTRONICS', 49.99, 2),
    (104, 'Wireless Mouse', 'ELECTRONICS', 24.99, 2);
