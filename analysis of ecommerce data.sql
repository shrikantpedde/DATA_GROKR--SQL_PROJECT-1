SELECT * FROM Customers;

SELECT first_name, last_name, email FROM Customers WHERE city = 'Bangalore';

SELECT product_name, price FROM Products ORDER BY price DESC;

SELECT * FROM Products ORDER BY price DESC LIMIT 3;

SELECT first_name AS Name, email AS Contact_Email FROM Customers;

SELECT DISTINCT city FROM Customers;

SELECT * FROM Customers WHERE phone_number IS NULL;

SELECT * FROM Customers WHERE phone_number IS NOT NULL;

SELECT first_name, last_name, COALESCE(phone_number, 'No Phone Provided') AS phone_status FROM Customers;

SELECT product_name, price, NULLIF(price, 30000.00) AS adjusted_price FROM Products;

SELECT COUNT(*) AS total_customers FROM Customers;

SELECT SUM(total_amount) AS total_revenue FROM Orders WHERE order_status = 'Completed';

SELECT AVG(price) AS average_product_price FROM Products;

SELECT category_id, COUNT(*) AS product_count FROM Products GROUP BY category_id;

SELECT category_id, AVG(price) AS avg_price FROM Products GROUP BY category_id HAVING AVG(price) > 3000;

SELECT order_status, COUNT(*) AS status_count FROM Orders GROUP BY order_status;

SELECT c.city, SUM(o.total_amount) AS total_spend FROM Customers c JOIN Orders o ON c.customer_id = o.customer_id GROUP BY c.city;

SELECT o.order_id, c.first_name, c.last_name, o.total_amount FROM Orders o INNER JOIN Customers c ON o.customer_id = c.customer_id;

SELECT c.first_name, c.last_name, o.order_id, o.total_amount FROM Customers c LEFT JOIN Orders o ON c.customer_id = o.customer_id;

SELECT o.order_id, o.order_date, c.first_name FROM Customers c RIGHT JOIN Orders o ON c.customer_id = o.customer_id;

SELECT c.first_name, o.order_id FROM Customers c LEFT JOIN Orders o ON c.customer_id = o.customer_id
UNION
SELECT c.first_name, o.order_id FROM Customers c RIGHT JOIN Orders o ON c.customer_id = o.customer_id;

SELECT p.product_name, c.category_name FROM Products p INNER JOIN Categories c ON p.category_id = c.category_id;

SELECT oi.order_id, p.product_name, oi.quantity, oi.unit_price FROM OrderItems oi JOIN Products p ON oi.product_id = p.product_id;

SELECT p.product_name, SUM(oi.quantity) AS total_quantity_sold FROM OrderItems oi JOIN Products p ON oi.product_id = p.product_id GROUP BY p.product_name ORDER BY total_quantity_sold DESC LIMIT 5;

SELECT c.customer_id, c.first_name, c.last_name, SUM(o.total_amount) AS total_spent FROM Customers c JOIN Orders o ON c.customer_id = o.customer_id WHERE o.order_status = 'Completed' GROUP BY c.customer_id, c.first_name, c.last_name ORDER BY total_spent DESC;

SELECT UPPER(first_name) AS upper_fname, LOWER(last_name) AS lower_lname FROM Customers;

SELECT CONCAT(first_name, ' ', last_name) AS full_name FROM Customers;

SELECT product_name, LENGTH(product_name) AS name_length FROM Products;

SELECT order_id, order_date, YEAR(order_date) AS order_year, MONTHNAME(order_date) AS order_month FROM Orders;

SELECT order_id, order_date, DATEDIFF('2024-04-01', order_date) AS days_passed FROM Orders;

SELECT product_name, price,
CASE 
    WHEN price >= 20000 THEN 'Premium'
    WHEN price BETWEEN 3000 AND 19999 THEN 'Mid-Range'
    ELSE 'Budget'
END AS price_category
FROM Products;

SELECT order_id, total_amount,
CASE 
    WHEN order_status = 'Completed' THEN 'Transaction Closed'
    WHEN order_status = 'Pending' THEN 'Action Required'
    ELSE 'Order Void'
END AS order_summary
FROM Orders;

SELECT category_id, COUNT(product_id) AS total_items, MIN(price) AS min_price, MAX(price) AS max_price, AVG(price) AS avg_price FROM Products GROUP BY category_id ORDER BY avg_price DESC;

SELECT c.first_name, c.last_name, COUNT(o.order_id) AS total_orders FROM Customers c JOIN Orders o ON c.customer_id = o.customer_id GROUP BY c.customer_id, c.first_name, c.last_name HAVING COUNT(o.order_id) > 1;

SELECT DATE_FORMAT(order_date, '%Y-%m') AS month_year, COUNT(order_id) AS monthly_orders, SUM(total_amount) AS monthly_revenue FROM Orders WHERE order_status = 'Completed' GROUP BY DATE_FORMAT(order_date, '%Y-%m') ORDER BY month_year;