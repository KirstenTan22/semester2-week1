-- Task 1

-- Enable readable output format
.mode columns
.headers on

-- Instructions for students:
-- 1. Open SQLite in terminal: sqlite3 countries.db
-- 2. Load this script: .read task1.sql
-- 3. Exit SQLite: .exit


-- write your sql code here

SELECT * from countries;
SELECT Country, Population FROM countries;
SELECT Country FROM countries WHERE Continent='Europe';
SELECT Country FROM countries WHERE Population > 100000000;
SELECT Country, GDPPerCapita FROM countries WHERE Continent='Asia' AND GDPPerCapita > 20000;
SELECT Country, LiteracyPercent FROM countries WHERE LiteracyPercent < 70;
SELECT Country, CoastlineRatio FROM countries WHERE CoastlineRatio = 0;
SELECT Country FROM countries WHERE Country LIKE 'a%' OR Country LIKE 'A%';
SELECT Country FROM countries WHERE Country LIKE '%United%';
SELECT Country FROM countries WHERE Birthrate > Deathrate AND Population > 50000000;