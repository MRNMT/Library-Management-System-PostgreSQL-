-- Library Management System Operations
-- Sprints 3-6: Read, Update, Delete, and Advanced Queries

-- Sprint 3: Read Operations (Queries)

-- Get all books
SELECT * FROM books;

-- Get a book by title
SELECT * FROM books WHERE title = '1984';

-- Get all books by a specific author (e.g., George Orwell)
SELECT b.* FROM books b JOIN authors a ON b.author_id = a.id WHERE a.name = 'George Orwell';

-- Get all available books
SELECT * FROM books WHERE available = TRUE;

-- Sprint 4: Update Operations

-- Mark a book as borrowed (set available = false) - e.g., book ID 1
UPDATE books SET available = FALSE WHERE id = 1;

-- Add a new genre to an existing book - e.g., add 'Classic' to book ID 1
UPDATE books SET genres = array_append(genres, 'Classic') WHERE id = 1;

-- Add a borrowed book to a patron's record - e.g., add book ID 1 to patron ID 1
UPDATE patrons SET borrowed_books = array_append(borrowed_books, 1) WHERE id = 1;

-- Sprint 5: Delete Operations

-- Delete a book by title - e.g., 'The Hobbit'
DELETE FROM books WHERE title = 'The Hobbit';

-- Delete an author by ID - e.g., author ID 10 (J.R.R. Tolkien)
DELETE FROM authors WHERE id = 10;

-- Sprint 6: Advanced Queries

-- Find books published after 1950
SELECT * FROM books WHERE published_year > 1950;

-- Find all American authors
SELECT * FROM authors WHERE nationality = 'American';

-- Set all books as available
UPDATE books SET available = TRUE;

-- Find all books that are available AND published after 1950
SELECT * FROM books WHERE available = TRUE AND published_year > 1950;

-- Find authors whose names contain "George"
SELECT * FROM authors WHERE name LIKE '%George%';

-- Increment the published year of 'War and Peace' (1869) by 1
UPDATE books SET published_year = published_year + 1 WHERE title = 'War and Peace';
