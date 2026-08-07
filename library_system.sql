CREATE TABLE Books (
    book_id SERIAL PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    author VARCHAR(100) NOT NULL,
    copies_available INT NOT NULL CHECK (copies_available >= 0)
);

CREATE TABLE Borrowers (
    borrower_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE IssueLog (
    issue_id SERIAL PRIMARY KEY,
    book_id INT REFERENCES Books(book_id),
    borrower_id INT REFERENCES Borrowers(borrower_id),
    issue_date DATE DEFAULT CURRENT_DATE,
    return_date DATE
);

CREATE OR REPLACE FUNCTION update_book_count()
RETURNS TRIGGER AS $$
BEGIN
    UPDATE Books
    SET copies_available = copies_available - 1
    WHERE book_id = NEW.book_id;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_book_issued
AFTER INSERT ON IssueLog
FOR EACH ROW
EXECUTE FUNCTION update_book_count();

INSERT INTO Books (title, author, copies_available) VALUES 
('Clean Code', 'Robert C. Martin', 5),
('Data Structures in Java', 'Mark Allen Weiss', 3);

INSERT INTO Borrowers (name, email) VALUES 
('Deepthi Chaitanya', 'deepthi@example.com');

INSERT INTO IssueLog (book_id, borrower_id) VALUES (1, 1);

SELECT b.title, br.name, i.issue_date, b.copies_available 
FROM IssueLog i
JOIN Books b ON i.book_id = b.book_id
JOIN Borrowers br ON i.borrower_id = br.borrower_id;
