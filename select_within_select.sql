-- Task 1
SELECT name
FROM world
WHERE population >
    (SELECT population
     FROM world
     WHERE name = "Russia");

-- New
with russia as (
    select
        w.population
    from
        world as w
    where
        w.name = "Russia"
)
select
    w.name
from
    world as w
where
    w.population >
        (select
            r.population
        from
            russia as r)



-- Task 2
SELECT name
FROM world
WHERE continent = "Europe"
    AND gdp/population >
    (SELECT gdp/population
    FROM world
    WHERE name = "United Kingdom");

-- New
with united_kingdom as (
    select
        (w.gdp/w.population) as gpd_per_capita
    from
        world as w
    where
        w.name = "United Kingdom"
)
select
    w.name
from
    world as w
where
    w.continent = "Europe"
    and gdp/population >
        (select
            uk.gpd_per_capita
        from
            united_kingdom as uk);


-- Task 3
SELECT name, continent
FROM world
WHERE continent IN
    (SELECT continent
    FROM world
    WHERE name IN ("Argentina", "Australia"));

-- New
with argentina_australia as (
    select
        w.continent
    from
        world as w
    where
        w.name in ("Argetina"
                    , "Australia")    
)
select
    w.name
    , w.continent
from
    world as w
where
    w.continent in
        (select
            arg_aus.continent
        from
            argentina_australia as arg_aus);


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

-- New
with united_kingdom as (
    select
        w.population
    from
        world as w
    where
        w.name = "United Kingdom"
),

germany as (
    select
        w.population
    from
        world as w
    where
        w.name = "Germany"
)

select
    w.name
    , w.population
from
    world as w
where
    w.population >
        (select
            uk.population
        from
            united_kingdom as uk)
    and w.population <
        (select
            g.population
        from
            germany as g);

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

-- New
with germany as (
    select
        w.population
    from
        world as w
    where
        w.name = "Germany"
)
select
    w.name
    , concat(round(100 * w.population / (select
                                            g.population
                                        from
                                            germany as g)
                    , 0)
            , "%") as percent
from
    world as w
where
    w.continent = "Europe";


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

-- New
with europe as (
    select
        w.gdp
    from
        world as w
    where
        gdp > 0
        and w.continent = "Europe"
)
select
    w.name
from
    world as w
where
    w.continent <> "Europe"
    and w.gdp > 
        all(select
                e.gdp
            from
                europe as e);

-- Task 7
SELECT continent, name, area
FROM world x
WHERE area >= ALL
    (SELECT area
    FROM world y
    WHERE y.continent=x.continent
        AND population>0);

-- New
select
    w.continent
    , w.name
    , w.area
from
    world as w
where
    w.area >=
        all(select
                x.area
            from
                world as x
            where
                x.continent = w.continent
                and x.population > 0);

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

-- New
select
    w.continent
    , w.name
from
    world as w
where
    w.name =
        (select
            x.name
        from
            world as x
        where
            x.continent = w.continent
        order by
            x.name
        limit 1);


-- Task 9
SELECT continent, name, population
FROM world AS x
WHERE 25000000 >= ALL (
    SELECT population
    FROM world AS y
    WHERE y.continent = x.continent);

-- New
select
    w.continent
    , w.name
    , w.population
from
    world as w
where
    25000000 >= 
        all(select
                x.population
            from
                world as x
            where
                x.continent = w.continent);


-- Task 10
SELECT name, continent
FROM world AS x
WHERE population > ALL 
    (SELECT population * 3
     FROM world AS y 
     WHERE y.continent = x.continent 
        AND y.name <> x.name);

-- New
select
    w.name
    , w.continent
from
    world as w
where
    w.population >
        all(select
                x.population * 3
            from
                world as x
            where
                x.continent = w.continent
                and x.name <> w.name);

-- Nested Quiz
-- Q1) c
-- Q2) b (resposta da task 9)
-- Q3) a (resposta da task 10)
-- Q4) d
-- Q5) b
-- Q6) b
-- Q7) b