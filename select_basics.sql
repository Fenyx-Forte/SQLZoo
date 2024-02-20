-- Task 1
SELECT population FROM world
WHERE name = 'Germany';

-- New
select
  w.population
from
  world as w
where
  w.name = "Germany";

-- Task 2
SELECT name, population FROM world
WHERE name IN ('Sweden', 'Norway', 'Denmark');

-- New
select
    w.name
  , w.population
from
  world as w
where
  w.name IN ("Sweden"
            , "Norway"
            , "Denmark");

-- Task 3
SELECT name, area FROM world
WHERE area BETWEEN 200000 AND 250000;

-- New
select
    w.name
  , w.area
from
  world as w
where
  w.area between 200000 and 250000;


-- SELECT Quiz
-- Q1) c
-- Q2) e
-- Q3) e
-- Q4) c
-- Q5) c
-- Q6) c
-- Q7) c