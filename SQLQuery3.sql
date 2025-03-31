CREATE TABLE Books (
     BookID INT PRIMARY KEY,
     Title NVARCHAR(50),
     Author NVARCHAR(50),
     PublishedYear INT
);
CREATE TABLE Borrowers (
     BorrowerID INT PRIMARY KEY,
     BookID INT,
     BorrowerName NVARCHAR(50),
     BorrowDate DATE,
     FOREIGN KEY (BookID) REFERENCES Books(BookID)
);