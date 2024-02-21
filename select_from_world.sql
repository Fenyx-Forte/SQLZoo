-- Task 1
SELECT name, continent, population
FROM world;

-- New
select
    w.name
    , w.continent
    , w.population
from
    world as w;


-- Task 2
SELECT name
FROM world
WHERE population > 200000000;

-- New
select
    w.name
from
    world as w
where
    w.population > 200000000;

-- Task 3
SELECT name, gdp/population AS per_capita_gdp
FROM world
WHERE population > 200000000;

-- New
select
    w.name
    , (w.gdp / w.population) as per_capita_gdp
from
    world as w
where
    w.population > 200000000;

-- Task 4
SELECT name, population/1000000 AS population_millions
FROM world
WHERE continent = "South America";

-- New
select
    w.name
    , (w.po / 1000000) as population_millions
from
    world as w
where
    w.continent = "South America";

-- Task 5
SELECT name, population
FROM world
WHERE name in ("France", "Germany", "Italy");

-- New
select
    w.name
    , w.population
from
    world as w
where
    w.name in ("France"
                , "Germany"
                , "Italy");

-- Task 6
SELECT name
FROM world
WHERE name LIKE "%United%";

-- New
select
    w.name
from
    world as w
where
    w.name like "%United%";

-- Task 7
SELECT name, population, area
FROM world
WHERE population > 250000000
    OR area > 3000000;

-- New
select
    w.name
    , w.population
    , w.area
from
    world as w
where
    w.population > 250000000
    or w.area > 3000000;

-- Task 8
SELECT name, population, area
FROM world
WHERE (population > 250000000 AND area <= 3000000)
    OR (population <= 250000000 AND area > 3000000);

-- New
select
    w.name
    , w.population
    , w.area
from
    world as w
where
    (w.population > 250000000
    and w.area <= 3000000)
    or 
    (w.population <= 250000000
    and w.area > 3000000);

-- Task 9
SELECT name, 
    ROUND(population/1000000, 2) AS population_millions,
    ROUND(gdp/1000000000, 2) AS gdp_billions
FROM world
WHERE continent = "South America";

-- New
select
    w.name 
    , round(w.population / 1000000, 2) as population_millions
    , round(w.gdp / 1000000000, 2) as gdp_billions
from
    world as w
where
    w.continent = "South America";

-- Task 10
SELECT name, ROUND(gdp/population, -3)
FROM world
WHERE gdp > 1000000000000;

-- New
select
    w.name
    , round(w.gdp / w.population, -3) as per_capita_gdp_thousands
from
    world as w
where
    w.gdp > 1000000000000;

-- Task 11
SELECT name, 
    capital
FROM world
WHERE LENGTH(name) = LENGTH(capital);

select
    w.name
    , w.capital
from
    world as w
where
    length(w.name) = length(w.capital);

-- Task 12
SELECT name, capital
FROM world
WHERE LEFT(name, 1) = LEFT(capital, 1)
    AND name <> capital;

-- New
select
    w.name
    , w.capital
from
    world as w
where
    left(w.name, 1) = left(w.capital, 1)
    and w.name <> w.capital;

-- Task 13
SELECT name
FROM world
WHERE name NOT LIKE "% %"
    AND name LIKE "%a%"
    AND name LIKE "%e%"
    AND name LIKE "%i%"
    AND name LIKE "%o%"
    AND name LIKE "%u%";

-- New
select
    w.name
from
    world as w
where
    w.name not like "% %"
    and w.name like "%a%"
    and w.name like "%e%"
    and w.name like "%i%"
    and w.name like "%o%"
    and w.name like "%u%";

-- BBC QUIZ
-- Q1) e
-- Q2) d
-- Q3) b
-- Q4) d
-- Q5) b
-- Q6) d
-- Q7) c