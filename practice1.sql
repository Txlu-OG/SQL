DROP DATABASE IF EXISTS BookstoreDB;
CREATE DATABASE BookstoreDB;
USE BookstoreDB;
CREATE TABLE BOOK(
	id INT,
    Title VARCHAR(100),
    Author varchar(100),
    Price FLOAT 
    );
	INSERT INTO BOOK (id, Title, Author, Price) VALUES
	(1, 'The Great Gatsby', 'F. Scott Fitzgerald', 10),
	(2, 'To Kill a Mockingbird', 'Harper Lee', 8);
SELECT Title,Price FROM BOOK;
ALTER TABLE Book DROP COLUMN Price
SELECT * from Book;
ALTER TABLE Book ADD COLUMN Price INT NOT NULL DEFAULT 5;

