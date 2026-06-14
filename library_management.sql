-- =========================================
-- Library Management System
-- DBMS Mini Project
-- Developed By: Ashutosh Kumar
-- Database: MySQL
-- =========================================

CREATE DATABASE library_management;

USE library_management;

-- Books Table
CREATE TABLE Books (
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    book_name VARCHAR(100),
    author_name VARCHAR(100),
    category VARCHAR(50)
);

-- Students Table
CREATE TABLE Students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    student_name VARCHAR(100),
    class VARCHAR(20),
    phone VARCHAR(15)
);

-- Issue Book Table
CREATE TABLE Issue_Book (
    issue_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    book_id INT,
    issue_date DATE,
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
);

-- Insert Books Data
INSERT INTO Books(book_name, author_name, category)
VALUES
('DBMS Concepts','Korth','Database'),
('Java Programming','Herbert Schildt','Programming');

-- Insert Students Data
INSERT INTO Students(student_name, class, phone)
VALUES
('Rahul Sharma','B.Tech','9876543210'),
('Priya Singh','B.Tech','9876543211');

-- Insert Issue Records
INSERT INTO Issue_Book(student_id, book_id, issue_date)
VALUES
(1,1,'2025-06-14'),
(2,2,'2025-06-14');

-- View Tables
SELECT * FROM Books;
SELECT * FROM Students;
SELECT * FROM Issue_Book;

-- Final Output
SELECT s.student_name,
       b.book_name,
       i.issue_date
FROM Students s
JOIN Issue_Book i ON s.student_id = i.student_id
JOIN Books b ON b.book_id = i.book_id;