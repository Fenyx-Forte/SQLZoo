-- Task 1
SELECT SUM(population)
FROM world;

-- New
select
  sum(w.population)
from
  world as w;

-- Task 2
SELECT DISTINCT continent
FROM world;

-- New
select distinct
  w.continent
from
  world as w;

-- Task 3
SELECT SUM(gdp)
FROM world
WHERE continent = "Africa";

-- New
select
  sum(w.gdp)
from
  world as w
where
  w.continent = "Africa";

-- Task 4
SELECT COUNT(1)
FROM world
WHERE area > 1000000;

-- New
select
  count(w.name)
from
  world as w
where
  w.area > 1000000;

-- Task 5
SELECT SUM(population)
FROM world
WHERE name IN ("Estonia", "Latvia", "Lithuania");

-- New
select
  sum(w.population)
from
  world as w
where
  w.name in ("Estonia"
            , "Latvia"
            , "Lithuania" );


-- Task 6
SELECT continent, COUNT(1) AS countries
FROM world
GROUP BY continent;

-- New
select
    w.continet
  , count(w.name) as countries
from
  world as w
group by
  w.continent;

-- Task 7
SELECT continent, COUNT(1) AS countries
FROM world
WHERE population >= 10000000
GROUP BY continent;

-- New
select
    w.continent
  , count(w.name) as countries
from
  world as w
where
  w.population >= 10000000
group by
  w.continent;

-- Task 8
SELECT continent
FROM world
GROUP BY continent
HAVING  SUM(population) >= 100000000;

-- New
select
  w.continent
from
  world as w
group by
  w.continet
having
  sum(w.population) >= 100000000;


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

-- New
select
  count(n.winner)
from
  nobel as n;

-- Task 2
SELECT DISTINCT subject
FROM nobel;

-- New
select distinct
  n.subject
from
  nobel as n;

-- Task 3
SELECT COUNT(1)
FROM nobel
WHERE subject = "physics";

-- New
select
  count(n.winner)
from
  nobel as n
where
  n.subject = "physics";

-- Task 4
SELECT subject, COUNT(1)
FROM nobel
GROUP BY subject;

-- New
select
    n.subject
  , count(n.winner)
from
  nobel as n
group by
  n.subject;

-- Task 5
SELECT subject, MIN(yr)
FROM nobel
GROUP by subject;

-- New
select
    n.subject
  , min(n.yr)
from
  nobel as n
group by
  n.subject;

-- Task 6
SELECT subject, COUNT(1)
FROM nobel
WHERE yr = 2000
GROUP BY subject;

-- New
select
    n.subject
  , count(n.winner)
from
  nobel as n
where
  n.yr = 2000
group by
  n.subject;

-- Task 7
SELECT subject, COUNT(DISTINCT winner)
FROM nobel
GROUP BY subject;

-- New
select
    n.subject
  , count(distinct n.winner)
from
  nobel as n
group by
  n.subject;

-- Task 8
SELECT subject, COUNT(DISTINCT yr)
FROM nobel
GROUP BY subject;

-- New
select
  n.subject
  , count(distinct n.yr)
from
  nobel as n
group by
  n.subject;

-- Task 9
SELECT yr
FROM nobel
WHERE subject = "physics"
GROUP BY yr
HAVING COUNT(1) >= 3;

-- New
select
  n.yr
from
  nobel as n
where
  n.subject = "physics"
group by
  n.yr
having
  count(n.winner) >= 3;

-- Task 10
SELECT winner
FROM nobel
GROUP BY winner
HAVING COUNT(1) > 1;

-- New
select
  n.winner
from
  nobel as n
group by
  n.winner
having
  count(n.subject) > 1;


-- Task 11
SELECT winner
FROM nobel
GROUP BY winner
HAVING COUNT(DISTINCT subject) > 1;

-- New
select
  n.winner
from
  nobel as n
group by
  n.winner
having
  count(distinct n.subject) > 1;

-- Task 12
SELECT yr, subject
FROM nobel
WHERE yr >= 2000
GROUP BY yr, subject
HAVING COUNT(1) = 3;

-- New
select
    n.yr
  , n.subject
from
  nobel as n
where
  n.yr >= 2000
group by
    n.yr
  , n.subject
having
  count(n.subject) = 3;
