USE library_db;

-- Q1: Show the title, author and category name of every book.
SELECT b.title, b.author, c.category_name
FROM books b
JOIN categories c
ON b.category_id = c.category_id
ORDER BY title, category_name;

-- Q2: Show how many books are there in each category.
SELECT c.category_name, c.category_id, COUNT(*) as books_count
FROM books b
JOIN categories c
ON b.category_id = c.category_id
GROUP BY c.category_name, c.category_id
ORDER BY c.category_name, c.category_id;

-- Q3: Show only those categories that have more than 2 books.
SELECT c.category_id, c.category_name, COUNT(*) AS 'count' 
FROM books b
JOIN categories c
ON b.category_id = c.category_id
GROUP BY c.category_id, c.category_name
HAVING COUNT(*) > 2;

-- Q4: Show the books that are not returned yet.
--     Show the book title, member name and due date.
SELECT b.title, m.full_name, i.due_date
FROM books b
JOIN issues i ON b.book_id = i.book_id
JOIN members m ON i.member_id = m.member_id
WHERE i.return_date IS NULL
ORDER BY b.title;