-- Create LibrarySystem Database
CREATE DATABASE LibrarySystem;

-- Use the LibrarySystem Database
USE LibrarySystem;

-- Create Books Table
CREATE TABLE Books (
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(100) NOT NULL,
    genre VARCHAR(50),
    published_year INT
);

-- Create Authors Table
CREATE TABLE Authors (
    author_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    birth_year INT
);

-- Create Borrowers Table
CREATE TABLE Borrowers (
    borrower_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    phone VARCHAR(15)
);

-- Create Loans Table
CREATE TABLE Loans (
    loan_id INT PRIMARY KEY AUTO_INCREMENT,
    borrower_id INT,
    book_id INT,
    loan_date DATE,
    return_date DATE,
    FOREIGN KEY (borrower_id) REFERENCES Borrowers(borrower_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
);
