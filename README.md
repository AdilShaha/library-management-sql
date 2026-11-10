# Library Management System (MySQL)

A small library database built in MySQL. It stores books, categories, members and book issues, and includes 12 SQL queries that answer common library questions.

## Database tables

| Table | What it stores |
|---|---|
| `categories` | Book categories (Technology, Fiction, etc.) |
| `books` | Title, author, price and category of each book |
| `members` | Library members with email and join date |
| `issues` | Which member took which book, with issue date, due date and return date (`NULL` if not returned yet) |

Foreign keys: `books` -> `categories`, `issues` -> `books`, `issues` -> `members`.

## How to run

1. Open MySQL Workbench and connect to your local server.
2. Run `schema.sql` (creates the `library_db` database and the tables).
3. Run `data.sql` (adds sample data: 5 categories, 11 books, 9 members, 17 issues).
4. Run the queries from `queries.sql`.

## Queries

| Query | What it shows | SQL concepts |
|---|---|---|
| Q1 | Every book with its category | JOIN |
| Q2 | Number of books in each category | GROUP BY |
| Q3 | Categories with more than 2 books | HAVING |
| Q4 | Books not returned yet, with member and due date | Multi-table JOIN, IS NULL |
| Q5 | Overdue books and days overdue | DATEDIFF, CURDATE |
| Q6 | Members who never issued a book | LEFT JOIN |
| Q7 | Books that were never issued | LEFT JOIN |
| Q8 | Number of books issued by each member (including 0) | LEFT JOIN, COUNT |
| Q9 | Top 3 most issued books | CTE, DENSE_RANK window function |
| Q10 | Members who issued more than the average | CTE |
| Q11 | Status of every issue (Returned On Time, Returned Late, Overdue, Issued) | CASE WHEN |
| Q12 | Total issues for each category | Multi-table JOIN, GROUP BY |

Note: Q5 and Q11 use `CURDATE()`, so their results change with today's date.

## About this project

This is a learning project. The sample data and the practice questions were generated with AI assistance (Claude). I wrote the SQL queries myself and improved them using AI feedback.

## Author

Shaha Adil Nadim | [GitHub](https://github.com/AdilShaha) | [LinkedIn](https://www.linkedin.com/in/adilshaha)
