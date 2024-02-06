-- Task 1
SELECT yr, subject, winner
FROM nobel
WHERE yr = 1950;


-- Task 2
SELECT winner
FROM nobel
WHERE yr = 1962
    AND subject = 'literature';


-- Task 3
SELECT yr, subject
FROM nobel
WHERE winner = "Albert Einstein";

-- Task 4
SELECT winner
FROM nobel
WHERE yr >= 2000
    AND subject = "peace";

-- Task 5
SELECT yr, subject, winner
FROM nobel
WHERE yr BETWEEN 1980 AND 1989
    AND subject = "literature";

-- Task 6
SELECT * 
FROM nobel
WHERE winner IN ("Theodore Roosevelt", "Thomas Woodrow Wilson", 
                "Jimmy Carter", "Barack Obama");


-- Task 7
SELECT winner
FROM nobel
WHERE LEFT(winner, 5) = "John ";


-- Task 8
SELECT yr, subject, winner
FROM nobel
WHERE (subject = "physics" AND yr = 1980)
    OR (subject = "chemistry" AND yr = 1984);


-- Task 9
SELECT yr, subject, winner
FROM nobel
WHERE yr = 1980
    AND subject NOT IN ("chemistry", "medicine");


-- Task 10
SELECT yr, subject, winner
FROM nobel
WHERE (subject = "medicine" AND yr < 1910)
    OR (subject = "literature" AND yr >= 2004);

-- Task 11
SELECT yr, subject, winner
FROM nobel
WHERE winner = "PETER GRÜNBERG";

-- Task 12
SELECT yr, subject, winner
FROM nobel
WHERE winner = "EUGENE O'NEILL";

-- Task 13
SELECT winner, yr, subject
FROM nobel
WHERE LEFT(winner, 4) = "Sir " 
ORDER BY yr DESC, winner;

-- Task 14
SELECT winner, subject
FROM nobel
WHERE yr = 1984
ORDER BY (subject IN ('physics','chemistry')), subject, winner;

-- Nobel Quiz
-- Q1) e
-- Q2) c
-- Q3) b
-- Q4) c
-- Q5) c
-- Q6) c
-- Q7) d