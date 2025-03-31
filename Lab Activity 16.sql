-- create library database
CREATE DATABASE LibraryDB;

--use the database
USE LibraryDB;

-- create books table
CREATE TABLE Books (
	BookID INT PRIMARY KEY,
	Title NVARCHAR(50),
	Author NVARCHAR(50),
	PublishedYEar INT
	);

-- create borrowers table with foreign key
CREATE TABLE Borrowers (
	BorrowerID INT PRIMARY KEY,
	BookID INT,
	BorrowerName NVARCHAR(50),
	BorrowedDate DATE,
	FOREIGN KEY (BookID) REFEReNCES Books(BookID)
	);

-- Insert data into Books table
INSERT INTO Books (BookID, Title, Author, PublishedYEar) VALUES
(1, 'The Great Gatsby', 'F. Scott Fitzgerald', 1925),
(2, '1984', 'George Orwell', 1949),
(3, 'To Kill a Mockingbird', 'Harper Lee', 1960);

-- insert data into borrowers table
INSERT INTO Borrowers(BorrowerID, BookID, BorrowerName, BorrowedDate) VALUES
(101, 1, 'John Doe', '2024-01-01'),
(102, 2, 'Jane Smith', '2024-01-02'),
(103, 3, 'Alice Johnson', '2024-01-03');

SELECT * FROM Books WHERE Author != 'F. Scott Fitzgerald';
SELECT Title FROM Books WHERE Author IN ('F. Scott Fitzgerald', 'George Orwell');