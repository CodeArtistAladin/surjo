-- Retrieve all books
SELECT * FROM Books;

-- Retrieve all authors
SELECT * FROM Authors;

-- Retrieve all borrowers
SELECT * FROM Borrowers;

-- Retrieve all loans
SELECT * FROM Loans;

-- Join Books and Loans to see which books are loaned to which borrowers
SELECT Books.title, Borrowers.name, Loans.loan_date, Loans.return_date
FROM Loans
JOIN Books ON Loans.book_id = Books.book_id
JOIN Borrowers ON Loans.borrower_id = Borrowers.borrower_id;

-- Update a book's genre
UPDATE Books
SET genre = 'Classic'
WHERE book_id = 1;

-- Delete a borrower
DELETE FROM Borrowers
WHERE borrower_id = 2;

-- Return a book by updating the return_date
UPDATE Loans
SET return_date = '2025-03-30'
WHERE loan_id = 1;
