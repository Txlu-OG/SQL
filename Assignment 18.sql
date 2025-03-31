-- get info about entire database to identify necessary tables
EXEC sp_help;

-- get info about columns in tables to identify necessary columns
EXEC sp_columns 'Categories';
EXEC sp_columns 'Customers';
EXEC sp_columns 'Employees';
EXEC sp_columns 'Orders';
EXEC sp_columns 'Products';

-- View table details
SELECT * FROM Products;
SELECT * FROM Categories
SELECT * FROM Suppliers

-- Retrieve product info with supplier and category
-- use inner join to connect related tables with foreign keys
SELECT
	Products.ProductName,
	Suppliers.CompanyName AS SupplierName,
	Categories.CategoryName AS ProductCategoryName
FROM
	Products
	INNER JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID
	INNER JOIN Categories ON products.CategoryID = Categories.CategoryID
ORDER BY
	products.ProductName;

-- Add constraint to prevent negative inventory values
ALTER TABLE Products
ADD CONSTRAINT chk_UnitsInStock CHECK (UnitsInStock >= 0);

-- Set default region when none is specified
ALTER TABLE Employees
ADD CONSTRAINT DF_EmployeeRegion DEFAULT 'Not Assigned' FOR Region;

 -- This should be rejected as it is Negative
INSERT INTO Products (ProductName, UnitsInStock) VALUES
('Test Product', -5);

 -- No Region specified, should apply default value 'Not Assigned'
INSERT INTO Employees (FirstName, LastName)
VALUES ('Tolu', 'Og'); 

-- Verification of default value for region
SELECT * FROM Employees WHERE FirstName = 'Tolu' AND LastName = 'Og';

-- verifying constraints
SELECT * 
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS 
WHERE TABLE_NAME = 'Products' OR TABLE_NAME = 'Employees';
