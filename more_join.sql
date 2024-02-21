-- Task 1
SELECT id, title
FROM movie
WHERE yr=1962;

-- Task 2
SELECT yr
FROM movie
WHERE title = "Citizen Kane";

-- Task 3
SELECT id, title, yr
FROM movie
WHERE title LIKE "%Star Trek%"
ORDER BY yr;

-- Task 4
SELECT id
FROM actor
WHERE name = "Glenn Close";

-- Task 5
SELECT id
FROM movie
WHERE title = "Casablanca";

-- Task 6
SELECT actor.name
FROM movie
JOIN casting
    ON movie.id = casting.movieid
JOIN actor
    ON casting.actorid = actor.id
WHERE movie.title = "CasaBlanca";

-- Task 7
SELECT actor.name
FROM movie
JOIN casting
    ON movie.id = casting.movieid
JOIN actor
    ON casting.actorid = actor.id
WHERE movie.title = "Alien";

-- Task 8
SELECT movie.title
FROM movie
JOIN casting
    ON movie.id = casting.movieid
JOIN actor
    ON casting.actorid = actor.id
WHERE actor.name = "Harrison Ford";


-- Task 9
SELECT movie.title
FROM movie
JOIN casting
    ON movie.id = casting.movieid
JOIN actor
    ON casting.actorid = actor.id
WHERE actor.name = "Harrison Ford"
    AND casting.ord <> 1;

-- Task 10
SELECT movie.title, actor.name
FROM movie
JOIN casting
    ON movie.id = casting.movieid
JOIN actor
    ON casting.actorid = actor.id
WHERE movie.yr = 1962
    AND casting.ord = 1;

-- Task 11
SELECT yr, COUNT(title)
FROM movie
JOIN casting
    ON movie.id = casting.movieid
JOIN actor
    ON casting.actorid = actor.id
WHERE name="Rock Hudson"
GROUP BY yr
HAVING COUNT(title) > 2


-- Task 12
SELECT movie.title, actor.name
FROM movie
JOIN casting
    ON movie.id = casting.movieid
JOIN actor
    ON casting.actorid = actor.id
WHERE casting.ord = 1
    AND movie.id IN (
        SELECT casting.movieid
        FROM casting
        JOIN actor
            ON casting.actorid = actor.id
        WHERE actor.name = "Julie Andrews"
    );

-- New
with julie_andrews as(
    select
        c.movieid
    from
        casting as c
    join
        actor as a
            on c.actorid = a.id
    where
        a.name = "Julie Andrews"
)
select
    m.title
    , a.name
from
    movie as m
join
    casting as c
        on m.id = c.movieid
join
    actor as a
        on c.actorid = a.id
where
    c.ord = 1
    and m.id in 
        (select
            julie_andrews.movieid
        from
            julie_andrews);
            
-- Task 13
SELECT actor.name
FROM actor
JOIN casting
    ON actor.id = casting.actorid
WHERE casting.ord = 1
GROUP BY actor.name
HAVING COUNT(casting.movieid) >= 15
ORDER BY actor.name;

-- Task 14
SELECT movie.title, COUNT(casting.actorid)
FROM movie
JOIN casting
    ON movie.id = casting.movieid
WHERE movie.yr = 1978
GROUP BY movie.title
ORDER BY COUNT(casting.actorid) DESC, movie.title;

-- Task 15
SELECT actor.name
FROM actor
JOIN casting
    ON actor.id = casting.actorid
WHERE casting.movieid IN (
    SELECT casting.movieid
    FROM casting
    JOIN actor
        ON casting.actorid = actor.id
    WHERE actor.name = "Art Garfunkel"
)
    AND actor.name <> "Art Garfunkel";

-- JOIN QUIZ 2
-- Q1) c
-- Q2) e
-- Q3) c
-- Q4) b
-- Q5) d
-- Q6) c
-- Q7) b