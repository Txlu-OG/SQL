-- create database
DROP DATABASE IF EXISTS db_ogundipe;
CREATE DATABASE db_ogundipe;
USE db_ogundipe;

-- create table
CREATE TABLE tbltest_ogundipe(
	id INT,
    firstname varchar(100),
    lastname varchar(100),
    year_of_birth INT
    );

-- insert 3 records 
INSERT INTO tbltest_ogundipe(id, firstname, lastname, year_of_birth) VALUES
    (4715, 'Adedamola', 'Ogundipe', 17011991),
    (4705, 'Adefolarin', 'Ogundipe', 17091993),
    (5183, 'Adefolake', 'Ogundipe', 03011996);

SELECT * FROM tbltest_ogundipe