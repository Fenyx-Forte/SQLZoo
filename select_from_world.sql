-- Task 1
SELECT name, continent, population
FROM world;


-- Task 2
SELECT name
FROM world
WHERE population > 200000000;


-- Task 3
SELECT name, gdp/population AS per_capita_gdp
FROM world
WHERE population > 200000000;

-- Task 4
SELECT name, population/1000000 AS population_millions
FROM world
WHERE continent = "South America";

-- Task 5
SELECT name, population
FROM world
WHERE name in ("France", "Germany", "Italy");

-- Task 6
SELECT name
FROM world
WHERE name LIKE "%United%";

-- Task 7
SELECT name, population, area
FROM world
WHERE population > 250000000
    OR area > 3000000;

-- Task 8
SELECT name, population, area
FROM world
WHERE (population > 250000000 AND area <= 3000000)
    OR (population <= 250000000 AND area > 3000000);

-- Task 9
SELECT name, 
    ROUND(population/1000000, 2) AS population_millions,
    ROUND(gdp/1000000000, 2) AS gdp_billions
FROM world
WHERE continent = "South America";

-- Task 10
SELECT name, ROUND(gdp/population, -3)
FROM world
WHERE gdp > 1000000000000;

-- Task 11
SELECT name, 
    capital
FROM world
WHERE LENGTH(name) = LENGTH(capital);


-- Task 12
SELECT name, capital
FROM world
WHERE LEFT(name, 1) = LEFT(capital, 1)
    AND name <> capital;

-- Task 13
SELECT name
FROM world
WHERE name NOT LIKE "% %"
    AND name LIKE "%a%"
    AND name LIKE "%e%"
    AND name LIKE "%i%"
    AND name LIKE "%o%"
    AND name LIKE "%u%";

-- BBC QUIZ
-- Q1) e
-- Q2) d
-- Q3) b
-- Q4) d
-- Q5) b
-- Q6) d
-- Q7) c