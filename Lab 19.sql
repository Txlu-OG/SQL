-- create database
CREATE DATABASE SchoolDB;
USE SchoolDB;

--create table
CREATE TABLE Students(
	StudentID INT PRIMARY KEY,
	Firstname VARCHAR(50),
	LastName VARCHAR(50),
	DateOfBirth DATE,
	EnrollmentDate DATETIME,
	GPA DECIMAL(3,2)
	);

-- create table course
CREATE TABLE Courses(
	CourseID INT PRIMARY KEY,
	CourseName NVARCHAR(100),
	Credits INT
	);

-- create table enrollments
CREATE TABLE Enrollments(
	EnrollmentID INT IDENTITY(1,1) PRIMARY KEY,
	STudentID INT,
	CourseID INT,
	Grade CHAR(1),
	FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
	FOREIGN kEY (CourseID) REFERENCES Courses(CourseID),
	CHECK (Grade IN ('A', 'B', 'C', 'D', 'E', 'F'))
	); 

EXEC sp_help 'Enrollments';