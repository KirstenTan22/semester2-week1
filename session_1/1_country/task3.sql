-- Task 3

-- Enable readable output format
.mode columns
.headers on

-- Instructions for students:
-- 1. Open SQLite in terminal: sqlite3 countries.db
-- 2. Load this script: .read task3.sql
-- 3. Exit SQLite: .exit


-- write your sql code here
SELECT * from countries;
SELECT Count(*) FROM countries;
SELECT Continent, COUNT(*) FROM countries GROUP BY Continent;
SELECT Continent, SUM(Population) FROM countries GROUP BY Continent;
SELECT Continent, AVG(GDPPerCapita) FROM countries GROUP BY Continent;