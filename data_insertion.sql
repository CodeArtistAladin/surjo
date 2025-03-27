-- Insert Data into Books Table
INSERT INTO Books (title, genre, published_year) VALUES
('The Great Gatsby', 'Fiction', 1925),
('1984', 'Dystopian', 1949),
('To Kill a Mockingbird', 'Fiction', 1960);

-- Insert Data into Authors Table
INSERT INTO Authors (name, birth_year) VALUES
('F. Scott Fitzgerald', 1896),
('George Orwell', 1903),
('Harper Lee', 1926);

-- Insert Data into Borrowers Table
INSERT INTO Borrowers (name, email, phone) VALUES
('John Doe', 'john.doe@example.com', '1234567890'),
('Jane Smith', 'jane.smith@example.com', '9876543210');

-- Insert Data into Loans Table
INSERT INTO Loans (borrower_id, book_id, loan_date, return_date) VALUES
(1, 1, '2025-03-25', '2025-04-25'),
(2, 2, '2025-03-26', '2025-04-26');
