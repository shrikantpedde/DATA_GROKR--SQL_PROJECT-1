    DROP DATABASE IF EXISTS EcommerceDB;
CREATE DATABASE EcommerceDB;
USE EcommerceDB;

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    city VARCHAR(50) DEFAULT 'Bangalore',
    signup_date DATE NOT NULL
);

CREATE TABLE Categories (
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE Products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100) NOT NULL,
    category_id INT,
    price DECIMAL(10,2) CHECK (price >= 0),
    stock_quantity INT DEFAULT 0,
    FOREIGN KEY (category_id) REFERENCES Categories(category_id) ON DELETE SET NULL
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    order_date DATE NOT NULL,
    order_status VARCHAR(20) DEFAULT 'Pending',
    total_amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id) ON DELETE CASCADE
);

CREATE TABLE OrderItems (
    order_item_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    product_id INT,
    quantity INT CHECK (quantity > 0),
    unit_price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES Products(product_id) ON DELETE CASCADE
);

ALTER TABLE Customers ADD phone_number VARCHAR(15);
ALTER TABLE Products MODIFY COLUMN stock_quantity INT DEFAULT 10;

INSERT INTO Categories (category_name) VALUES 
('Electronics'), ('Fashion'), ('Home & Kitchen'), ('Books'), ('Sports');

INSERT INTO Customers (first_name, last_name, email, city, signup_date, phone_number) VALUES 
('Rahul', 'Sharma', 'rahul@gmail.com', 'Bangalore', '2023-01-15', '9876543210'),
('Priya', 'Nair', 'priya@yahoo.com', 'Mumbai', '2023-02-20', '9876543211'),
('Amit', 'Patel', 'amit@gmail.com', 'Delhi', '2023-03-10', NULL),
('Sneha', 'Rao', 'sneha@hotmail.com', 'Bangalore', '2023-04-05', '9876543213'),
('Vikas', 'Gupta', 'vikas@gmail.com', 'Chennai', '2023-05-12', NULL),
('Ananya', 'Deshmukh', 'ananya@gmail.com', 'Hyderabad', '2023-06-18', '9876543215'),
('Rohan', 'Mehta', 'rohan@yahoo.com', 'Bangalore', '2023-07-22', '9876543216'),
('Kavya', 'Iyer', 'kavya@gmail.com', 'Pune', '2023-08-30', NULL),
('Siddharth', 'Verma', 'sid@gmail.com', 'Delhi', '2023-09-14', '9876543218'),
('Pooja', 'Hegde', 'pooja@gmail.com', 'Mumbai', '2023-10-01', '9876543219');

INSERT INTO Products (product_name, category_id, price, stock_quantity) VALUES 
('Laptop', 1, 65000.00, 15),
('Smartphone', 1, 30000.00, 25),
('Wireless Headphones', 1, 3000.00, 50),
('Running Shoes', 2, 4500.00, 30),
('Denim Jacket', 2, 2500.00, 20),
('Mixer Grinder', 3, 3500.00, 10),
('Non-Stick Cookware', 3, 2000.00, 15),
('SQL Guide Book', 4, 800.00, 100),
('Python Fundamentals', 4, 600.00, 80),
('Yoga Mat', 5, 1200.00, 40);

INSERT INTO Orders (customer_id, order_date, order_status, total_amount) VALUES 
(1, '2024-01-10', 'Completed', 68000.00),
(2, '2024-01-15', 'Completed', 30000.00),
(3, '2024-01-20', 'Cancelled', 4500.00),
(1, '2024-02-01', 'Completed', 3000.00),
(4, '2024-02-10', 'Completed', 5500.00),
(5, '2024-02-14', 'Pending', 3500.00),
(6, '2024-03-01', 'Completed', 65000.00),
(7, '2024-03-05', 'Completed', 1400.00),
(8, '2024-03-12', 'Shipped', 2000.00),
(9, '2024-03-20', 'Completed', 1200.00),
(NULL, '2024-03-25', 'Pending', 5000.00);

INSERT INTO OrderItems (order_id, product_id, quantity, unit_price) VALUES 
(1, 1, 1, 65000.00),
(1, 3, 1, 3000.00),
(2, 2, 1, 30000.00),
(3, 4, 1, 4500.00),
(4, 3, 1, 3000.00),
(5, 4, 1, 4500.00),
(5, 8, 1, 800.00),
(6, 6, 1, 3500.00),
(7, 1, 1, 65000.00),
(8, 8, 1, 800.00),
(8, 9, 1, 600.00),
(9, 7, 1, 2000.00),
(10, 10, 1, 1200.00);