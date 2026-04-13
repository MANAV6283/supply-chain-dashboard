DROP DATABASE IF EXISTS supply_chain_db;
CREATE DATABASE supply_chain_db;
USE supply_chain_db;

CREATE TABLE suppliers (
    supplier_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    contact_email VARCHAR(100) UNIQUE,
    phone VARCHAR(15),
    location VARCHAR(100)
);

CREATE TABLE manufacturers (
    manufacturer_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    location VARCHAR(100)
);

CREATE TABLE distributors (
    distributor_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    location VARCHAR(100)
);

CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    unit_price DECIMAL(10,2)
);

CREATE TABLE inventory (
    inventory_id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT,
    location_type ENUM('supplier','manufacturer','distributor'),
    location_id INT,
    quantity INT,
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT,
    supplier_id INT,
    manufacturer_id INT,
    distributor_id INT,
    quantity INT,
    order_date DATE,
    status ENUM('pending','shipped','delivered','cancelled'),
    FOREIGN KEY (product_id) REFERENCES products(product_id),
    FOREIGN KEY (supplier_id) REFERENCES suppliers(supplier_id),
    FOREIGN KEY (manufacturer_id) REFERENCES manufacturers(manufacturer_id),
    FOREIGN KEY (distributor_id) REFERENCES distributors(distributor_id)
);

CREATE TABLE logistics (
    logistics_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    transport_mode ENUM('road','rail','air','sea'),
    cost DECIMAL(10,2),
    delivery_time INT,
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

INSERT INTO products (name, unit_price) VALUES
('Product A', 100),
('Product B', 200),
('Product C', 150);

INSERT INTO suppliers (name, contact_email, phone, location) VALUES
('Supplier 1', 's1@gmail.com', '9999999999', 'Delhi'),
('Supplier 2', 's2@gmail.com', '8888888888', 'Mumbai');

INSERT INTO manufacturers (name, location) VALUES
('Manufacturer 1', 'Pune');

INSERT INTO distributors (name, location) VALUES
('Distributor 1', 'Gurgaon');

INSERT INTO inventory (product_id, location_type, location_id, quantity) VALUES
(1, 'supplier', 1, 20),
(2, 'supplier', 2, 80),
(3, 'supplier', 1, 10);

INSERT INTO orders (product_id, supplier_id, manufacturer_id, distributor_id, quantity, order_date, status) VALUES
(1, 1, 1, 1, 10, '2026-04-01', 'pending'),
(2, 2, 1, 1, 20, '2026-04-02', 'shipped'),
(3, 1, 1, 1, 5, '2026-04-03', 'delivered');

INSERT INTO logistics (order_id, transport_mode, cost, delivery_time) VALUES
(1, 'road', 500, 3),
(2, 'air', 1500, 1),
(3, 'rail', 800, 2);