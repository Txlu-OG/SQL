-- create database
DROP DATABASE IF EXISTS SalesDB;
CREATE DATABASE SalesDB;
USE SalesDb;

-- verify database creation
SELECT name FROM sys.databases WHERE name = 'SalesDB';

-- create table offices
CREATE TABLE Offices(
	OfficeCode INT PRIMARY KEY,
	City NVARCHAR(255),
	Phone NVARCHAR(255),
	AddressLine1 NVARCHAR(255),
	State NVARCHAR(255),
	Country NVARCHAR (255),
	PostalCode NVARCHAR(20),
	Territory NVARCHAR (50)
	);

-- create employees table
CREATE TABLE Employees(
    EmployeeNumber INT PRIMARY KEY,
    LastName NVARCHAR(50),
    FirstName NVARCHAR(50),
    Email NVARCHAR(255),
    Extension NVARCHAR(255),
    OfficeCode INT,
    ReportsTo INT NULL,
    JobTitle NVARCHAR(100),
    FOREIGN KEY (OfficeCode) REFERENCES Offices(OfficeCode),
    FOREIGN KEY (ReportsTo) REFERENCES Employees(EmployeeNumber)
);

-- create customers table
CREATE TABLE Customers(
    CustomerNumber INT PRIMARY KEY,
    CustomerName NVARCHAR(100),
    ContactLastName NVARCHAR(100),
    ContactFirstName NVARCHAR(100),
    Phone NVARCHAR(255),
    AddressLine1 NVARCHAR(255),
    City NVARCHAR(255),
    State NVARCHAR(255),
    PostalCode NVARCHAR(20),
    Country NVARCHAR(255),
    SalesRepEmployeeNumber INT,
    CreditLimit DECIMAL(10, 2),
    FOREIGN KEY (SalesRepEmployeeNumber) REFERENCES Employees(EmployeeNumber)
);

-- create productlines table
CREATE TABLE ProductLines (
    ProductLine NVARCHAR(50) PRIMARY KEY,
    TextDescription NVARCHAR(MAX),
    HtmlDescription NVARCHAR(MAX),
    image VARBINARY(MAX)
);

-- create products table
CREATE TABLE Products(
    ProductCode NVARCHAR(50) PRIMARY KEY,
    ProductName NVARCHAR(255),
    ProductLine NVARCHAR(50),
    ProductScale NVARCHAR(255),
    ProductVendor NVARCHAR(255),
    ProductDescription NVARCHAR(255),
    QuantityInStock INT,
    BuyPrice DECIMAL(10, 2),
    MSRP DECIMAL(10, 2),
    FOREIGN KEY (ProductLine) REFERENCES ProductLines(ProductLine)
);

--create orders table
CREATE TABLE Orders (
    OrderNumber INT PRIMARY KEY,
    OrderDate DATE,
    RequiredDate DATE,
    ShippedDate DATE,
    Status NVARCHAR(255) DEFAULT 'Pending',
    Comments NVARCHAR(255),
    CustomerNumber INT,
    FOREIGN KEY (CustomerNumber) REFERENCES Customers(CustomerNumber)
);

-- create orderdetails table
CREATE TABLE OrderDetails (
    OrderNumber INT,
    ProductCode NVARCHAR(50),
    QuantityOrdered INT,
    PriceEach DECIMAL(10, 2),
    OrderLineNumber INT,
    PRIMARY KEY (OrderNumber, ProductCode),
    FOREIGN KEY (OrderNumber) REFERENCES Orders(OrderNumber),
    FOREIGN KEY (ProductCode) REFERENCES Products(ProductCode)
);

-- create payments table
CREATE TABLE Payments(
    CustomerNumber INT,
    CheckNumber NVARCHAR(50) PRIMARY KEY,
    PaymentDate DATE,
    Amount DECIMAL(10, 2),
    FOREIGN KEY (CustomerNumber) REFERENCES Customers(CustomerNumber)
);

--Applying constraints
-- positive credit limit
ALTER TABLE customers
ADD CONSTRAINT chk_creditLimit CHECK (creditLimit >= 0);

-- Non Negative stock
ALTER TABLE products
ADD CONSTRAINT chk_quantityInStock CHECK (quantityInStock >= 0);

--verification
EXEC sp_help 'offices';
EXEC sp_help 'employees';
EXEC sp_help 'customers';
EXEC sp_help 'products';
EXEC sp_help 'orders';
EXEC sp_help 'orderdetails';
EXEC sp_help 'payments';
EXEC sp_help 'productlines';







