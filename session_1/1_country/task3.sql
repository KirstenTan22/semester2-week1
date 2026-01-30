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
SELECT Continent, Count(*) FROM countries GROUP BY Continent HAVING Count(*) > 5;
SELECT Continent, SUM(Population) FROM countries GROUP BY Continent HAVING SUM(Population) > 1000000000;
SELECT c.Country, c.Continent, c.Population FROM countries c WHERE c.Population = (SELECT MAX(c2.Population) FROM countries c2 WHERE c2.Continent = c.Continent);
SELECT Continent, AVG(Population), MAX(Population), MIN(GDPPerCapita) FROM countries GROUP BY Continent;
SELECT Continent From countries GROUP BY Continent HAVING AVG(Population) > 100000000 AND SUM(GDPPerCapita) > 5000;
SELECT Continent, SUM(AreaSqMi), SUM(ArablePercent), AVG(Birthrate) FROM countries WHERE Population > 10000000 GROUP BY Continent ;