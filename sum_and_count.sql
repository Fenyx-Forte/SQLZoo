-- Task 1
SELECT SUM(population)
FROM world;

-- Task 2
SELECT DISTINCT continent
FROM world;

-- Task 3
SELECT SUM(gdp)
FROM world
WHERE continent = "Africa";

-- Task 4
SELECT COUNT(1)
FROM world
WHERE area > 1000000;

-- Task 5
SELECT SUM(population)
FROM world
WHERE name IN ("Estonia", "Latvia", "Lithuania");


-- Task 6
SELECT continent, COUNT(1) AS countries
FROM world
GROUP BY continent;

-- Task 7
SELECT continent, COUNT(1) AS countries
FROM world
WHERE population >= 10000000
GROUP BY continent;


-- Task 8
SELECT continent
FROM world
GROUP BY continent
HAVING  SUM(population) >= 100000000;


-- SUM and COUNT QUiz
-- Q1) c
-- Q2) a
-- Q3) d
-- Q4) e
-- Q5) b
-- Q6) e
-- Q7) d
-- Q8) d

-- Nobel Table
-- Task 1
SELECT COUNT(1)
FROM nobel;

-- Task 2
SELECT DISTINCT subject
FROM nobel;


-- Task 3
SELECT COUNT(1)
FROM nobel
WHERE subject = "physics";

-- Task 4
SELECT subject, COUNT(1)
FROM nobel
GROUP BY subject;

-- Task 5
SELECT subject, MIN(yr)
FROM nobel
GROUP by subject;

-- Task 6
SELECT subject, COUNT(1)
FROM nobel
WHERE yr = 2000
GROUP BY subject;

-- Task 7
SELECT subject, COUNT(DISTINCT winner)
FROM nobel
GROUP BY subject;

-- Task 8
SELECT subject, COUNT(DISTINCT yr)
FROM nobel
GROUP BY subject;

-- Task 9
SELECT yr
FROM nobel
WHERE subject = "physics"
GROUP BY yr
HAVING COUNT(1) >= 3;

-- Task 10
SELECT winner
FROM nobel
GROUP BY winner
HAVING COUNT(1) > 1;


-- Task 11
SELECT winner
FROM nobel
GROUP BY winner
HAVING COUNT(DISTINCT subject) > 1;

-- Task 12
SELECT yr, subject
FROM nobel
WHERE yr >= 2000
GROUP BY yr, subject
HAVING COUNT(1) = 3;
