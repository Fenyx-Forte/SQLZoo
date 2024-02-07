-- Task 1
SELECT name
FROM world
WHERE population >
    (SELECT population
     FROM world
     WHERE name = "Russia");


-- Task 2
SELECT name
FROM world
WHERE continent = "Europe"
    AND gdp/population >
    (SELECT gdp/population
    FROM world
    WHERE name = "United Kingdom");


-- Task 3
SELECT name, continent
FROM world
WHERE continent IN
    (SELECT continent
     FROM world
     WHERE name IN ("Argentina", "Australia"));


-- Task 4
SELECT name, population
FROM world
WHERE population >
    (SELECT population
     FROM world
     WHERE name = "United Kingdom")
    AND population < 
    (SELECT population
     FROM world
     WHERE name = "Germany");


-- Task 5
SELECT name,
    CONCAT(
        ROUND(100 * population / 
        (SELECT population
        FROM world
        WHERE name = "Germany"), 0),
        "%")
FROM world
WHERE continent = "Europe";


-- Task 6
SELECT name
FROM world
WHERE continent <> "Europe"
    AND
    gdp > ALL(
        SELECT gdp
        FROM world
        WHERE gdp > 0
            AND continent = "Europe"
        );

-- Task 7
SELECT continent, name, area
FROM world x
WHERE area >= ALL
    (SELECT area
    FROM world y
    WHERE y.continent=x.continent
        AND population>0);

-- Task 8
SELECT continent, name
FROM world AS x
WHERE name = (
    SELECT name
    FROM world AS y
    WHERE y.continent = x.continent
    ORDER BY name
    LIMIT 1
    );


-- Task 9
SELECT continent, name, population
FROM world AS x
WHERE 25000000 >= ALL (
    SELECT population
    FROM world AS y
    WHERE y.continent = x.continent);


-- Task 10
SELECT name, continent
FROM world AS x
WHERE population > ALL 
    (SELECT population * 3
     FROM world AS y 
     WHERE y.continent = x.continent 
        AND y.name != x.name);

-- Nested Quiz
-- Q1) c
-- Q2) b (resposta da task 9)
-- Q3) a (resposta da task 10)
-- Q4) d
-- Q5) b
-- Q6) b
-- Q7) b