-- Task 2

-- Enable readable output format
.mode columns
.headers on

-- Instructions for students:
-- 1. Open SQLite in terminal: sqlite3 countries.db
-- 2. Load this script: .read task2.sql
-- 3. Exit SQLite: .exit


-- write your sql code here
SELECT Country, Population FROM countries ORDER BY Population DESC LIMIT 10;
SELECT Country, AreaSqMi FROM countries ORDER BY AreaSqMi ASC Limit 5;
SELECT Country, AreaSqMi FROM countries WHERE Continent='Europe' ORDER BY AreaSqMi DESC Limit 1;
SELECT Country, AreaSqMi FROM countries WHERE Continent='Africa' ORDER BY AreaSqMi ASC Limit 3;
SELECT Country, LiteracyPercent FROM countries WHERE LiteracyPercent >= 0 ORDER BY LiteracyPercent ASC Limit 5;
SELECT Country, GDPPerCapita FROM countries WHERE Country LIKE 'C%' ORDER BY GDPPerCapita DESC Limit 3;
SELECT Country, LiteracyPercent, InfantMortalityPer1000 FROM countries WHERE InfantMortalityPer1000 > 50 ORDER BY LiteracyPercent DESC Limit 1;
SELECT Country, PhonesPer1000 FROM countries WHERE GDPPerCapita > 10000 ORDER BY PhonesPer1000 ASC Limit 5;
SELECT COUNTRY, GDPPerCapita FROM countries WHERE CoastlineRatio = 0 AND Continent='South America' ORDER BY GDPPerCapita DESC Limit 1;
SELECT Country FROM countries ORDER BY Country DESC Limit 10;