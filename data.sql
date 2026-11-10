-- Library Management System: sample data
-- Run schema.sql first

USE library_db;

INSERT INTO categories (category_name) VALUES
('Technology'),
('Fiction'),
('Biography'),
('History'),
('Self-Help');

INSERT INTO books (title, author, category_id, price) VALUES
('Wings of Fire',               'A. P. J. Abdul Kalam',  3, 299.00),
('The Discovery of India',      'Jawaharlal Nehru',      4, 399.00),
('Let Us C',                    'Yashavant Kanetkar',    1, 350.00),
('Database System Concepts',    'Abraham Silberschatz',  1, 850.00),
('Python Crash Course',         'Eric Matthes',          1, 699.00),
('Godaan',                      'Premchand',             2, 199.00),
('Train to Pakistan',           'Khushwant Singh',       2, 250.00),
('The White Tiger',             'Aravind Adiga',         2, 299.00),
('Atomic Habits',               'James Clear',           5, 499.00),
('Rich Dad Poor Dad',           'Robert Kiyosaki',       5, 350.00),
('Malgudi Days',                'R. K. Narayan',         2, 225.00);

INSERT INTO members (full_name, email, join_date) VALUES
('Aarav Patil',      'aarav.patil@example.com',      '2026-01-10'),
('Sana Shaikh',      'sana.shaikh@example.com',      '2026-01-18'),
('Rohan Deshmukh',   'rohan.deshmukh@example.com',   '2026-02-02'),
('Fatima Khan',      'fatima.khan@example.com',      '2026-02-14'),
('Omkar Jadhav',     'omkar.jadhav@example.com',     '2026-03-05'),
('Zoya Sayyed',      'zoya.sayyed@example.com',      '2026-03-21'),
('Prathamesh More',  'prathamesh.more@example.com',  '2026-04-08'),
('Ayesha Pathan',    'ayesha.pathan@example.com',    '2026-05-12'),
('Imran Qureshi',    'imran.qureshi@example.com',    '2026-06-30');

-- (book_id, member_id, issue_date, due_date, return_date)
-- Due date is always 14 days after issue date
INSERT INTO issues (book_id, member_id, issue_date, due_date, return_date) VALUES
(1,  1, '2026-09-01', '2026-09-15', '2026-09-12'),
(3,  2, '2026-09-03', '2026-09-17', '2026-09-20'),
(4,  3, '2026-09-05', '2026-09-19', '2026-09-18'),
(9,  4, '2026-09-10', '2026-09-24', '2026-09-23'),
(3,  5, '2026-09-12', '2026-09-26', '2026-10-01'),
(6,  6, '2026-09-15', '2026-09-29', '2026-09-28'),
(1,  7, '2026-09-20', '2026-10-04', '2026-10-02'),
(5,  1, '2026-09-25', '2026-10-09', '2026-10-12'),
(9,  2, '2026-10-01', '2026-10-15', '2026-10-14'),
(3,  8, '2026-10-05', '2026-10-19', '2026-10-17'),
(10, 3, '2026-10-08', '2026-10-22', NULL),
(2,  4, '2026-10-12', '2026-10-26', '2026-10-25'),
(3,  6, '2026-10-15', '2026-10-29', NULL),
(7,  5, '2026-10-20', '2026-11-03', NULL),
(8,  7, '2026-10-28', '2026-11-11', NULL),
(9,  1, '2026-11-02', '2026-11-16', NULL),
(3,  2, '2026-11-05', '2026-11-19', NULL);
