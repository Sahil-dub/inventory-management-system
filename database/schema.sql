-- Inventory Management System Schema
-- Designed for Data Integrity and Fast Retrieval

CREATE DATABASE IF NOT EXISTS inventory_db;
USE inventory_db;

-- 1. Suppliers Table
CREATE TABLE suppliers (
    supplier_id INT PRIMARY KEY AUTO_INCREMENT,
    company_name VARCHAR(100) NOT NULL,
    contact_email VARCHAR(100),
    phone_number VARCHAR(20),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 2. Categories Table (Normalization)
CREATE TABLE categories (
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(50) NOT NULL,
    description TEXT
);

-- 3. Products Table
-- Includes Reorder Level triggers
CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    sku VARCHAR(50) UNIQUE NOT NULL,
    category_id INT,
    supplier_id INT,
    quantity_in_stock INT DEFAULT 0,
    unit_price DECIMAL(10, 2) NOT NULL,
    reorder_level INT DEFAULT 10, -- Trigger point for automation
    last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (category_id) REFERENCES categories(category_id),
    FOREIGN KEY (supplier_id) REFERENCES suppliers(supplier_id)
);

-- 4. Transaction Logs (Audit Trail)
CREATE TABLE stock_movements (
    movement_id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT,
    movement_type ENUM('IN', 'OUT', 'ADJUSTMENT') NOT NULL,
    quantity INT NOT NULL,
    movement_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Indexing for performance
CREATE INDEX idx_product_sku ON products(sku);
CREATE INDEX idx_low_stock ON products(quantity_in_stock);