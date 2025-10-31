# Library Management System (PostgreSQL)

This project implements a Library Management System using PostgreSQL. It manages books, authors, and patrons with full CRUD operations and advanced queries.

## Prerequisites

- PostgreSQL installed (version 12 or higher recommended)
- pgAdmin or psql command-line tool

## Setup Instructions

1. **Create the Database and Tables:**
   - Open pgAdmin or connect via psql
   - Run the commands in `setup.sql` to create the database and tables

2. **Insert Sample Data:**
   - After creating the tables, run the commands in `insert_data.sql` to populate with sample data

3. **Run Operations:**
   - Use the queries in `operations.sql` for various read, update, delete, and advanced operations

## Database Schema

### Authors Table
- `id` (SERIAL PRIMARY KEY)
- `name` (VARCHAR(255) NOT NULL)
- `nationality` (VARCHAR(100))
- `birth_year` (INTEGER)
- `death_year` (INTEGER)

### Books Table
- `id` (SERIAL PRIMARY KEY)
- `title` (VARCHAR(255) NOT NULL)
- `author_id` (INTEGER, FOREIGN KEY to authors.id)
- `genres` (TEXT[])
- `published_year` (INTEGER)
- `available` (BOOLEAN DEFAULT TRUE)

### Patrons Table
- `id` (SERIAL PRIMARY KEY)
- `name` (VARCHAR(255) NOT NULL)
- `email` (VARCHAR(255) UNIQUE NOT NULL)
- `borrowed_books` (INTEGER[])

## SQL Commands Documentation

### Sprint 1: Project Setup
- Create database: `CREATE DATABASE LibraryDB;`
- Create tables as defined in `setup.sql`

### Sprint 2: Insert Data
- Insert authors, books, and patrons as shown in `insert_data.sql`

### Sprint 3: Read Operations
- Get all books: `SELECT * FROM books;`
- Get book by title: `SELECT * FROM books WHERE title = 'Book Title';`
- Get books by author: `SELECT b.* FROM books b JOIN authors a ON b.author_id = a.id WHERE a.name = 'Author Name';`
- Get available books: `SELECT * FROM books WHERE available = TRUE;`

### Sprint 4: Update Operations
- Mark book as borrowed: `UPDATE books SET available = FALSE WHERE id = book_id;`
- Add genre to book: `UPDATE books SET genres = array_append(genres, 'New Genre') WHERE id = book_id;`
- Add borrowed book to patron: `UPDATE patrons SET borrowed_books = array_append(borrowed_books, book_id) WHERE id = patron_id;`

### Sprint 5: Delete Operations
- Delete book by title: `DELETE FROM books WHERE title = 'Book Title';`
- Delete author by ID: `DELETE FROM authors WHERE id = author_id;`

### Sprint 6: Advanced Queries
- Books published after 1950: `SELECT * FROM books WHERE published_year > 1950;`
- American authors: `SELECT * FROM authors WHERE nationality = 'American';`
- Set all books available: `UPDATE books SET available = TRUE;`
- Available books after 1950: `SELECT * FROM books WHERE available = TRUE AND published_year > 1950;`
- Authors with "George" in name: `SELECT * FROM authors WHERE name LIKE '%George%';`
- Increment published year: `UPDATE books SET published_year = published_year + 1 WHERE title = 'Book Title';`

## Running the Scripts

### Using pgAdmin
1. Open pgAdmin and connect to your PostgreSQL server
2. Create a new database named `LibraryDB`
3. Open the Query Tool for the `LibraryDB` database
4. Copy and paste the contents of each SQL file and execute

### Using psql
1. Open command prompt/terminal
2. Connect to PostgreSQL: `psql -U username -d postgres`
3. Create database: `CREATE DATABASE librarydb;`
4. Connect to database: `\c librarydb`
5. Run scripts: `\i setup.sql`, `\i insert_data.sql`, `\i operations.sql`

## Notes

- The system uses array types for genres and borrowed_books, which are PostgreSQL-specific features
- Foreign key constraints ensure data integrity between books and authors
- CASCADE delete on author_id ensures books are removed when an author is deleted
- Sample data includes 10 books, 10 authors, and 10 patrons as specified

## Testing

After setup, you can run the operations in `operations.sql` to test various functionalities. Modify the queries as needed for your specific use cases.
# Library-Management-System-PostgreSQL-
