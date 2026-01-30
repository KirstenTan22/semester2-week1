-- Enable readable output format
.mode columns
.headers on

-- Instructions for students:
-- 1. Open SQLite in terminal: sqlite3 countries.db
-- 2. Load this script: .read tasks.sql
-- 3. Exit SQLite: .exit

-- ## Exercises
-- 1. Find the average population for each continent.
SELECT Continent, AVG(Population) FROM countries GROUP BY Continent;

-- 2. Find the total population of each continent.
SELECT Continent, SUM(Population) FROM countries GROUP BY Continent;

-- 3. Find the largest population of any country in each continent.
SELECT Continent, MAX(Population) FROM countries GROUP BY Continent;

-- 4. Find the smallest land area (AreaSqMi) of any country in each continent.
SELECT Continent, MIN(AreaSqMi) FROM countries GROUP BY Continent;

-- 5. Count how many countries there are in each continent.
SELECT Continent, Count(*) FROM countries GROUP BY Continent;

-- 6. List continents ordered by their average GDP per capita, highest first.
SELECT Continent, AVG(GDPPerCapita) FROM countries GROUP BY Continent ORDER BY AVG(GDPPerCapita) DESC;

-- 7. Show the top 5 most populous countries.
SELECT Country, Population FROM countries ORDER BY Population DESC LIMIT 5;

-- 8. Show the 5 countries with the lowest infant mortality rate.
SELECT Country, InfantMortalityPer1000 FROM countries ORDER BY InfantMortalityPer1000 ASC LIMIT 5;

-- 9. Find the average literacy rate per continent, ordered from lowest to highest.
SELECT Continent, AVG(LiteracyPercent) FROM countries GROUP BY Continent ORDER BY AVG(LiteracyPercent) ASC;

-- 10. Show the 3 continents with the highest total population.
SELECT Continent, SUM(Population) FROM countries GROUP BY Continent ORDER BY SUM(Population) DESC LIMIT 3;

-- 11. Find the average population per continent, considering only countries with a population greater than 10 million.
SELECT Continent, AVG(Population) FROM countries WHERE Population > 10000000 GROUP BY Continent; 

-- 12. Find the average GDP per capita per continent, considering only countries where literacy is above 80%.
SELECT Continent, AVG(GDPPerCapita) FROM countries WHERE LiteracyPercent > 80 GROUP BY Continent;

-- 13. For each continent, find the maximum birthrate of countries which an infant mortality below 30 per 1000 births.
SELECT Continent, MAX(Birthrate) FROM countries WHERE InfantMortalityPer1000 < 30 GROUP BY Continent;

-- 14. Find continents where the average GDP per capita is greater than 10,000, considering only countries with a literacy rate above 80%, and order the results from highest to lowest average GDP per capita.
SELECT Continent, AVG(GDPPerCapita) FROM countries WHERE LiteracyPercent > 80 GROUP BY Continent HAVING AVG(GDPPerCapita) > 10000 ORDER BY AVG(GDPPerCapita) DESC;

-- 15. Find continents that have a total population greater than 500 million, but only include countries where the birthrate is below 20, order the results by total population (largest first), and limit the output to 3 results.
SELECT Continent, SUM(Population) FROM countries WHERE Birthrate < 20 GROUP BY Continent HAVING SUM(Population) > 500000000 ORDER BY SUM(Population) DESC LIMIT 3;

