USE SalesDB;

-- Add column to products table
ALTER TABLE products
ADD AgeGroup NVARCHAR(20) DEFAULT 'All Ages';

-- change creditlimit data type
ALTER TABLE customers
ALTER COLUMN creditLimit DECIMAL(12, 2);

-- drop comments column
ALTER TABLE orders
DROP COLUMN comments;

-- drop table payments
DROP TABLE payments;

-- retrieve data with join
SELECT orders.orderNumber, orders.orderDate, customers.customerName
FROM orders
LEFT OUTER JOIN customers
ON orders.customerNumber = customers.customerNumber;

-- create view
CREATE VIEW Order_Summary AS
SELECT orders.orderNumber, orders.orderDate, customers.customerName, orders.status
FROM orders
LEFT OUTER JOIN customers
ON orders.customerNumber = customers.customerNumber;


SELECT * FROM products;

EXEC sp_help 'customers';

SELECT * FROM orders;

SELECT * FROM payments;

SELECT orders.orderNumber, orders.orderDate, customers.customerName
FROM orders
LEFT OUTER JOIN customers
ON orders.customerNumber = customers.customerNumber;

SELECT * FROM Order_Summary;


