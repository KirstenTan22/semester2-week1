-- Enable readable output format
.mode columns
.headers on

-- Instructions for students:
-- 1. Open SQLite in terminal: sqlite3 books.db
-- 2. Load this script: .read tasks.sql
-- 3. Exit SQLite: .exit


-- write your sql code here

SELECT * from books;
SELECT title, author FROM books;
SELECT title, published_year FROM books WHERE published_year > 2015;
SELECT title, pages FROM books WHERE pages > 400;
SELECT title, rating FROM books WHERE rating >= 4.0;
SELECT title, genre FROM books WHERE genre LIKE '%Fantasy';
SELECT title, published_year FROM books WHERE published_year < 2000;
SELECT title, pages FROM books WHERE pages < 300;

SELECT title, genre, pages FROM books WHERE genre LIKE '%Science Fiction' AND rating > 4.0;
SELECT title, published_year, pages FROM books WHERE published_year < 2000 AND pages < 300;
SELECT title, genre FROM books WHERE genre LIKE '%Fantasy' or genre LIKE '%Romance';
SELECT title, rating, pages FROM books WHERE rating < 3.5 OR pages > 700;
SELECT title FROM books WHERE title LIKE 'The%';
SELECT title, author FROM books WHERE author LIKE '%a' OR author LIKE 'a%';
SELECT title, published_year FROM books ORDER BY published_year ASC;
SELECT title, rating FROM books ORDER BY rating DESC;
SELECT title, genre FROM books WHERE genre LIKE '%Mystery' ORDER BY title;
SELECT title, genre, published_year FROM books WHERE genre Like '%Science Fiction' and published_year > 2000 ORDER BY published_year LIMIT 5; 

-- ## Extension

-- Read these statements and work out the right query to solve each problem:

-- 1.  Expanding a genre collection

-- A library manager wants to identify popular fantasy books to guide future purchases.
-- They only want to see fantasy books with a rating of 4.0 or higher, ordered so the highest-rated books appear first, and limited to the top 5 results.

SELECT title, genre, rating FROM books WHERE genre LIKE '%Fantasy' and rating >= 4.0 ORDER BY rating DESC LIMIT 5;

-- 2. Promoting newer books

-- The library is running a display of modern science fiction.
-- The librarian wants a list of science fiction books published after 2010, ordered from newest to oldest, showing only the first 5 books.

SELECT title, genre, published_year FROM books WHERE genre LIKE '%Science Fiction' AND published_year > 2010 ORDER BY published_year DESC LIMIT 5;

-- 3. Finding short recommendations

-- A reading group is looking for shorter books to fit into a busy schedule.
-- They want to see the 10 shortest books in the database, regardless of genre.

SELECT title, pages FROM books ORDER BY pages ASC LIMIT 10;

-- 4. Reviewing older stock

-- The library is reviewing older books that may need replacing.
-- They want to find books published before 1950 that have more than 300 pages, ordered from oldest to newest.

SELECT books, published_year, pages FROM books WHERE published_year < 1950 AND pages > 300 ORDER BY published_year ASC;

-- 5. Analysing genre performance

-- Note: you're going to have to do a little bit of research for this one as it uses something we will look at next session!

-- The library manager wants to understand which genres are performing best overall.
-- They want to see the average rating for each genre in the database, with the highest-rated genres appearing first.

SELECT genre, AVG(rating) FROM books GROUP BY genre ORDER BY rating DESC;