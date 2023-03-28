CREATE DATABASE markt;
CREATE TABLE Products (
  product_id INT PRIMARY KEY,
  product_name VARCHAR(50),
  price DECIMAL(10,2)
);

CREATE TABLE Customers (
  customer_id INT PRIMARY KEY,
  customer_name VARCHAR(50),
  email VARCHAR(50)
);

CREATE TABLE Orders (
  order_id INT PRIMARY KEY,
  customer_id INT,
  product_id INT,
  quantity INT,
  FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
  FOREIGN KEY (product_id) REFERENCES Products(product_id)
); 


INSERT INTO Products (product_id, product_name, price) VALUES
(1, 'Product RR', 2),
(2, 'Product EE', 4),
(24, 'Product CC', 6);

INSERT INTO Customers (customer_id, customer_name, email) VALUES
(9, 'FATHY', 'FAT7Y@email.com'),
(6, 'ahmed', 'ahmed@email.com'),
(7, 'SOSO', 'SOSO-HOT_ONFIRE@email.com');

INSERT INTO Orders (order_id, customer_id, product_id, quantity) VALUES
(2,4,6,8),
(15,16,17,18),
(66,67,68,69);

SELECT *
FROM Orders
INNER JOIN Customers ON Orders.customer_id = Customers.customer_id;

SELECT *
FROM Customers
LEFT JOIN Orders ON Customers.customer_id = Orders.customer_id;

SELECT *
FROM Orders
RIGHT JOIN Customers ON Orders.customer_id = Customers.customer_id;

SELECT *
FROM Customers
JOIN Orders ON Customers.customer_id = Orders.customer_id;

SELECT *
FROM Customers c
JOIN Products p
ON c.customer_id = p.product_id;

SELECT *
FROM  Products p, customers c
WHERE p.product_id = c.customer_id;

SELECT customer_id,customer_name AS product_id, product_name
FROM customers c
JOIN Products p
ON p.product_id = c.customer_id;

SELECT product_id, product_name
FROM Products p
NATURAL JOIN customers c;

SELECT customer_name AS customer, product_name AS product
FROM customers c
CROSS JOIN products p
ORDER BY customer_name;

SELECT customer_name
FROM customers
UNION
SELECT customer_id
FROM customers;