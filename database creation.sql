CREATE DATABASE LibrarySystem;
USE LibrarySystem;

CREATE TABLE Authors (
  author_id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(255),
  birth_date DATE
);

CREATE TABLE Books (
  book_id INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(255),
  genre VARCHAR(100),
  author_id INT,
  FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);

CREATE TABLE Borrowers (
  borrower_id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(255),
  contact_info VARCHAR(100)
);

CREATE TABLE Loans (
  loan_id INT PRIMARY KEY AUTO_INCREMENT,
  borrower_id INT,
  book_id INT,
  loan_date DATE,
  return_date DATE,
  FOREIGN KEY (borrower_id) REFERENCES Borrowers(borrower_id),
  FOREIGN KEY (book_id) REFERENCES Books(book_id)
);

INSERT INTO Authors (name, birth_date) VALUES
('George Orwell', '1903-06-25'),
('J.K. Rowling', '1965-07-31'),
('J.R.R. Tolkien', '1892-01-03');

INSERT INTO Books (title, genre, author_id) VALUES
('1984', 'Dystopian', 1),
('Harry Potter and the Philosopher\'s Stone', 'Fantasy', 2),
('The Hobbit', 'Fantasy', 3);

INSERT INTO Borrowers (name, contact_info) VALUES
('John Doe', '123-456-7890'),
('Jane Smith', '987-654-3210'),
('Alice Brown', '555-666-7777');

INSERT INTO Loans (borrower_id, book_id, loan_date, return_date) VALUES
(1, 1, '2025-03-01', '2025-03-15'),
(2, 2, '2025-03-02', '2025-03-16'),
(3, 3, '2025-03-03', '2025-03-17');

SELECT Books.title, Authors.name 
FROM Books
INNER JOIN Authors ON Books.author_id = Authors.author_id;

SELECT Books.title, Borrowers.name, Loans.loan_date 
FROM Loans
INNER JOIN Books ON Loans.book_id = Books.book_id
INNER JOIN Borrowers ON Loans.borrower_id = Borrowers.borrower_id
WHERE Borrowers.name = 'John Doe';

SELECT * FROM Books ORDER BY title ASC;

SELECT Books.title, Authors.name 
FROM Books
INNER JOIN Authors ON Books.author_id = Authors.author_id;

SELECT Books.title, Authors.name 
FROM Booksauthorsauthor_idname
LEFT JOIN Authors ON Books.author_id = Authors.author_id;


UPDATE Books
SET genre = 'Science Fiction'
WHERE title = '1984';

DELETE FROM Loans
WHERE borrower_id = 1 AND book_id = 1;

SELECT Authors.name, COUNT(Books.book_id) AS book_count
FROM Authors
LEFT JOIN Books ON Authors.author_id = Books.author_id
GROUP BY Authors.name;

SELECT AVG(DATEDIFF(return_date, loan_date)) AS average_loan_duration
FROM Loans;

SELECT name
FROM Borrowers
WHERE borrower_id NOT IN (SELECT borrower_id FROM Loans);

SELECT title
FROM Books
WHERE book_id IN (SELECT book_id FROM Loans GROUP BY book_id HAVING COUNT(book_id) > 1);


SELECT * FROM loans;
















