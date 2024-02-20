-- Task 1
SELECT yr, subject, winner
FROM nobel
WHERE yr = 1950;

-- New
select
    n.yr
    , n.subject
    , n.winner
from
    nobel as n
where
    n.yr = 1950;


-- Task 2
SELECT winner
FROM nobel
WHERE yr = 1962
    AND subject = 'literature';

-- New
select
    n.winner
from
    nobel as n
where
    n.yr = 1962
    and n.subject = "literature";

-- Task 3
SELECT yr, subject
FROM nobel
WHERE winner = "Albert Einstein";

-- New
select
    n.yr
    , n.subject
from
    nobel as n
where
    n.winner = "Albert Einstein";

-- Task 4
SELECT winner
FROM nobel
WHERE yr >= 2000
    AND subject = "peace";

-- New
select
    n.winner
from
    nobel as n
where
    n.yr >= 2000
    and n.subject = "peace";

-- Task 5
SELECT yr, subject, winner
FROM nobel
WHERE yr BETWEEN 1980 AND 1989
    AND subject = "literature";

-- New
select
    n.yr
    , n.subject
    , n.winner
from
    nobel as n
where
    n.yr between 1980 and 1989
    and n.subject = "literature";

-- Task 6
SELECT * 
FROM nobel
WHERE winner IN ("Theodore Roosevelt", "Thomas Woodrow Wilson", 
                "Jimmy Carter", "Barack Obama");

-- New
select
    *
from
    nobel as n
where
    n.winner in ("Theodore Roosevelt"
                , "Thomas Woodrow Wilson" 
                , "Jimmy Carter"
                , "Barack Obama");

-- Task 7
SELECT winner
FROM nobel
WHERE LEFT(winner, 5) = "John ";

-- New
select
    n.winner
from
    nobel as n
where
    left(n.winner, 5) = "John";

-- Task 8
SELECT yr, subject, winner
FROM nobel
WHERE (subject = "physics" AND yr = 1980)
    OR (subject = "chemistry" AND yr = 1984);

-- New
select
    n.yr
    , n.subject
    , n.winner
from
    nobel as n
where
    (n.subject = "physics"
    and n.yr = 1980)
    or
    (n.subject = "chemystry"
    and n.yr = 1984);

-- Task 9
SELECT yr, subject, winner
FROM nobel
WHERE yr = 1980
    AND subject NOT IN ("chemistry", "medicine");

-- New
select
    n.yr
    , n.subject
    , n.winner
from
    nobel as n
where
    n.yr = 1980
    and n.subject not in ("chemistry"
                        , "medicine");

-- Task 10
SELECT yr, subject, winner
FROM nobel
WHERE (subject = "medicine" AND yr < 1910)
    OR (subject = "literature" AND yr >= 2004);

-- New
select
    n.yr
    , n.subject
    , n.winner
from
    nobel as n
where
    (n.subject = "medicine"
    and n.yr < 1910)
    or
    (n.subject = "literature"
    and n.yr >= 2004);

-- Task 11
SELECT yr, subject, winner
FROM nobel
WHERE winner = "PETER GRÜNBERG";

-- New
select
    n.yr
    , n.subject
    , n.winner
from
    nobel as n
where
    n.winner = "PETER GRÜNBERG";

-- Task 12
SELECT yr, subject, winner
FROM nobel
WHERE winner = "EUGENE O'NEILL";

-- New
select
    n.yr
    , n.subject
    , n.winner
from
    nobel as n
where
    n.winner = "EUGENE O'NEILL";

-- Task 13
SELECT winner, yr, subject
FROM nobel
WHERE LEFT(winner, 4) = "Sir " 
ORDER BY yr DESC, winner;

-- New
select
    n.winner
    , n.yr
    , n.subject
from
    nobel as n
where
    left(n.winner, 4) = "Sir "
order by
    n.yr desc
    , n.winner asc;

-- Task 14
SELECT winner, subject
FROM nobel
WHERE yr = 1984
ORDER BY (subject IN ('physics','chemistry')), subject, winner;

-- New
select
    n.winner
    , n.subject
from
    nobel as n
where
    n.yr = 1984
order by
    (n.subject in ("physics", "chemistry")) asc
    , n.subject asc
    , n.winner asc

-- Nobel Quiz
-- Q1) e
-- Q2) c
-- Q3) b
-- Q4) c
-- Q5) c
-- Q6) c
-- Q7) d