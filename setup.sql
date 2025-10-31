-- Library Management System Setup
-- Sprint 1: Project Setup

-- Create the database
CREATE DATABASE LibraryDB;

-- Connect to the database (in psql: \c librarydb)

-- Create Authors table
CREATE TABLE authors (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    nationality VARCHAR(100),
    birth_year INTEGER,
    death_year INTEGER
);

-- Create Books table
CREATE TABLE books (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author_id INTEGER REFERENCES authors(id) ON DELETE CASCADE,
    genres TEXT[],
    published_year INTEGER,
    available BOOLEAN DEFAULT TRUE
);

-- Create Patrons table
CREATE TABLE patrons (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    borrowed_books INTEGER[]
);
