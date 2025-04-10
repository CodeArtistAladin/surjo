CREATE VIEW BookDetails AS
SELECT book_id, title, genre
FROM Books;

SELECT * FROM BookDetails;

ALTER TABLE Borrowers
MODIFY name VARCHAR(255) NOT NULL;
SELECT * FROM Borrowers;

ALTER TABLE Books
ADD CONSTRAINT fk_author
FOREIGN KEY (author_id) REFERENCES Authors(author_id);
SELECT * FROM Books;

CREATE INDEX idx_book_id
ON Loans (book_id);

START TRANSACTION;

-- Insert new loan record
INSERT INTO Loans (borrower_id, book_id, loan_date, return_date) 
VALUES (1, 2, '2025-04-01', '2025-04-15');

-- Update loan return date
UPDATE Loans 
SET return_date = '2025-04-20'
WHERE loan_id = 1;

-- Rollback the changes (if needed)
ROLLBACK;

-- Or Commit the changes
-- COMMIT;

SELECT Borrowers.name, Books.title, Loans.loan_date
FROM Loans
INNER JOIN Borrowers ON Loans.borrower_id = Borrowers.borrower_id
INNER JOIN Books ON Loans.book_id = Books.book_id
WHERE Loans.loan_date > '2025-03-01'
AND Borrowers.name IN (SELECT name FROM Borrowers WHERE contact_info LIKE '%@gmail.com');

CREATE ROLE book_reader;
GRANT SELECT ON BookDetails TO book_reader;

GRANT book_reader TO 'LibrarySystem'@'localhost';





