-- Basic SQL setup for any database

-- Enable readable output format
.mode columns
.headers on

-- Instructions for students:
-- 1. Open SQLite in terminal: sqlite3 countries.db
-- 2. Load this script: .read example.sql
-- 3. Exit SQLite: .exit

SELECT * FROM countries;
SELECT Country, Continent FROM countries; -- Displays country and continent
SELECT Birthrate FROM countries; -- Displays birthrate only
SELECT Country FROM countries WHERE Continent='Asia';
SELECT Country, Population FROM countries WHERE Population > 25000000;
SELECT Country FROM countries WHERE Continent LIKE '%America'; -- Continent contains 'America'
SELECT Country, Continent, GDPPerCapita FROM countries WHERE NetMigration > 10 AND Population > 1000000;