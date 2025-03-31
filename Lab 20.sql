CREATE DATABASE ToyDatabase;
USE ToyDatabase;

CREATE TABLE Toys (
	ToyID INT PRIMARY KEY,
	ToyName VARCHAR(50),
	Manufacturer VARCHAR(50),
	Price DECIMAL(10, 2)
);

CREATE TABLE Toy_Stock (
	StockID INT PRIMARY KEY,
	ToyID INT,
	Quantity INT,
	StoreLocation VARCHAR(50),
	FOREIGN KEY (ToyID) REFERENCES Toys(ToyID)
);

CREATE TABLE Manufacturers (
	ManufacturerID INT PRIMARY KEY,
	ManufacturerName VARCHAR(50),
	Country VARCHAR(50)
);

INSERT INTO Toys (ToyID, ToyName, Manufacturer, Price) VALUES
(1, 'Action Figure', 'ToyCo', 14.99),
(2, 'Doll', 'Playtime Inc.', 19.99),
(3, 'Building Blocks', 'BlockWorks', 29.99);

INSERT INTO Toy_Stock (StockID, ToyID, Quantity, StoreLocation) VALUES
(1, 1, 100, 'Downtown'),
(2, 2, 50, 'Uptown'),
(3, 3, 200, 'Suburb');

INSERT INTO Manufacturers (ManufacturerID, ManufacturerName, Country) VALUES
(1, 'ToyCo', 'USA'),
(2, 'Playtime Inc.', 'Canada'),
(3, 'BlockWorks', 'Germany');

ALTER TABLE Toys ADD AgeGroup VARCHAR(20) DEFAULT 'All Ages';

ALTER TABLE Toys ALTER COLUMN Price DECIMAL(10, 2);

ALTER TABLE Toys DROP COLUMN Manufacturer;

SELECT Toys.ToyID, Toys.ToyName, Toy_Stock.Quantity, Toy_Stock.StoreLocation
FROM Toys
LEFT OUTER JOIN Toy_Stock ON Toys.ToyID = Toy_Stock.ToyID;

CREATE VIEW Toy_Inventory AS
SELECT Toys.ToyID, Toys.ToyName, Toy_Stock.Quantity, Toy_Stock.StoreLocation
FROM Toys
LEFT OUTER JOIN Toy_Stock ON Toys.ToyID = Toy_Stock.ToyID;

DROP TABLE Toy_Stock;

SELECT * FROM Toys;

EXEC sp_help 'Toys';

SELECT * FROM Toys;

SELECT * FROM Toy_Stock;

SELECT Toys.ToyID, Toys.ToyName, Toy_Stock.Quantity, Toy_Stock.StoreLocation
FROM Toys
LEFT OUTER JOIN Toy_Stock ON Toys.ToyID = Toy_Stock.ToyID;

SELECT * FROM Toy_Inventory;















