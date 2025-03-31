-- create database
DROP DATABASE IF EXISTS NAF_Pers;
CREATE DATABASE NAF_Pers;
USE NAF_Pers;

-- create table with columns
CREATE TABLE NAF_Pers_Info(
	NAF_Num INT,
    NAF_Rank VARCHAR(20),
    Name VARCHAR(100),
    Specialty VARCHAR(20),
    Trade VARCHAR(50),
    Unit VARCHAR(20)
    );
    INSERT INTO NAF_Pers_Info(NAF_Num, NAF_Rank, Name, Specialty, Trade, Unit) VALUES
    (4715, 'FLT LT', 'AT OGUNDIPE', 'Medical', 'Dental Surgery', 'NAFRC'),
    (4705, 'FLT LT', 'TM ILUFOYE', 'Aircraft Engineering', 'Avionics', 'DSA'),
    (5183, 'FG OFFR', 'LD SALISU', 'Medical', 'Physiotherapy', 'NAFRC'),
    (5149, 'FG OFFR', 'PS AMULUKU', 'Medical', 'Nurse', 'NAFRC'),
    (5136, 'FG OFFR', 'LD SALISU', 'Medical', 'Physiotherapy', 'NAFRC');
show tables;
select * FROM NAF_Pers_Info


    
    


 