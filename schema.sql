-- Library Management System: schema (MySQL)
-- Run this file first, then data.sql

CREATE DATABASE IF NOT EXISTS library_db;
USE library_db;

-- Drop in child-to-parent order so the script can be re-run safely
DROP TABLE IF EXISTS issues;
DROP TABLE IF EXISTS books;
DROP TABLE IF EXISTS members;
DROP TABLE IF EXISTS categories;

CREATE TABLE categories (
    category_id   INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE books (
    book_id     INT AUTO_INCREMENT PRIMARY KEY,
    title       VARCHAR(150) NOT NULL,
    author      VARCHAR(100) NOT NULL,
    category_id INT NOT NULL,
    price       DECIMAL(8,2) NOT NULL,
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

CREATE TABLE members (
    member_id  INT AUTO_INCREMENT PRIMARY KEY,
    full_name  VARCHAR(100) NOT NULL,
    email      VARCHAR(100) NOT NULL UNIQUE,
    join_date  DATE NOT NULL
);

-- return_date stays NULL until the member returns the book
CREATE TABLE issues (
    issue_id    INT AUTO_INCREMENT PRIMARY KEY,
    book_id     INT NOT NULL,
    member_id   INT NOT NULL,
    issue_date  DATE NOT NULL,
    due_date    DATE NOT NULL,
    return_date DATE NULL,
    FOREIGN KEY (book_id)   REFERENCES books(book_id),
    FOREIGN KEY (member_id) REFERENCES members(member_id)
);
