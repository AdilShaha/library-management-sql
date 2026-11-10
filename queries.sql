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
SELECT c.category_id, c.category_name, COUNT(*) AS books_count 
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

-- Q5: Show the overdue books (not returned and due date is over).
--     Show the book title, member name and how many days overdue.
SELECT b.title, m.full_name, DATEDIFF(CURDATE(), i.due_date) as days_overdue
FROM books b
JOIN issues i ON b.book_id = i.book_id
JOIN members m ON i.member_id = m.member_id
WHERE (i.return_date IS NULL AND CURDATE() > i.due_date);

-- Q6: Show the members who have never issued any book.
SELECT m.member_id, m.full_name
FROM members m
LEFT JOIN issues i ON m.member_id = i.member_id
WHERE i.member_id IS NULL;


-- Q7: Show the books that have never been issued.
SELECT b.book_id, b.title
FROM books b
LEFT JOIN issues i ON b.book_id = i.book_id
WHERE i.book_id is NULL;

-- Q8: Show how many books each member has issued.
--     Show all members, even those with 0 books.
--     Show the highest count first.
SELECT m.member_id, m.full_name, COUNT(i.issue_id) AS total_issued
FROM members m
LEFT JOIN issues i ON m.member_id = i.member_id
GROUP BY m.member_id, m.full_name
ORDER BY total_issued DESC, m.full_name;


-- Q9: Show the top 3 most issued books using a window function.
--     Show the book title, issue count and rank.
WITH books_analysis AS (
SELECT i.book_id, COUNT(*) AS issued_count
FROM issues i
GROUP BY i.book_id
),
ranks AS (
SELECT b.title, ba.book_id, ba.issued_count, DENSE_RANK() OVER(ORDER BY ba.issued_count DESC) as books_rank
FROM books b
JOIN books_analysis ba ON b.book_id = ba.book_id
)

SELECT title, book_id, issued_count, books_rank
FROM ranks
WHERE books_rank <= 3
ORDER BY books_rank;

-- Q10: Using a CTE, show the members who have issued more books than the average.
--      Take the average only from members who issued at least one book.
WITH MemberBookCounts AS (
SELECT member_id, COUNT(member_id) as books_issued 
FROM issues
GROUP BY member_id
),
AverageIssues AS (
SELECT AVG(books_issued) as avg_books_issued
FROM MemberBookCounts
)
SELECT m.member_id, m.full_name, mbc.books_issued
FROM MemberBookCounts mbc
JOIN members m ON mbc.member_id = m.member_id
CROSS JOIN AverageIssues ai
WHERE mbc.books_issued > ai.avg_books_issued;


-- Q11: For every issue, show the issue id, book title, member name and a status:
--      'Returned On Time', 'Returned Late', 'Overdue' or 'Issued'.
SELECT i.issue_id, b.title, m.full_name,
	CASE
        WHEN i.return_date IS NULL AND i.due_date < CURDATE() THEN 'Overdue'
        WHEN i.return_date IS NULL THEN 'Issued'
		WHEN i.return_date <= i.due_date THEN 'Returned On Time'
        ELSE 'Returned Late'
	END AS status
FROM issues i
JOIN books b ON i.book_id = b.book_id
JOIN members m ON i.member_id = m.member_id ;

-- Q12: Show the total issues for each category.
--      Show the category with the most issues first.
WITH TotalIssuesByCategory as(
SELECT c.category_id, c.category_name, COUNT(i.issue_id) as total_issues
FROM categories c
JOIN books b ON c.category_id = b.category_id
JOIN issues i ON b.book_id = i.book_id
GROUP BY c.category_id, c.category_name
)
SELECT category_id, category_name, total_issues
FROM TotalIssuesByCategory
ORDER BY total_issues DESC;
