-- Task 1
SELECT matchid, player
FROM goal
WHERE teamid = "GER";

-- New
select
    goal.matchid
    , goal.player
from
    goal
where
    goal.teamid = "GER";

-- Task 2
SELECT id, stadium, team1, team2
FROM game
where id = 1012;

-- New
select
    game.id
    , game.stadium
    , game.team1
    , game.team2
from
    game
where
    game.id = 1012;

-- Task 3
SELECT player, teamid, stadium, mdate
FROM game
JOIN goal ON (game.id = goal.matchid)
WHERE teamid = "GER";

-- New
select
    goal.player
    , goal.teamid
    , game.stadium
    , game.mdate
from
    game
join
    goal
        on (game.id = goal.matchid)
where
    goal.teamid = "GER";

-- Task 4
SELECT team1, team2, player
FROM game
JOIN goal ON (game.id = goal.matchid)
WHERE player LIKE "Mario%";

-- New
select
    game.team1
    , game.team2
    , goal.player
from
    game
join
    goal
        on (game.id = goal.matchid)
where
    goal.player like "Mario%";

-- Task 5
SELECT player, teamid, coach, gtime
FROM goal
JOIN eteam ON (goal.teamid = eteam.id)
WHERE gtime<=10;

-- New
select
    goal.player
    , goal.teamid
    , eteam.coach
    , goal.gtime
from
    goal
join
    eteam
        on (goal.teamid = eteam.id)
where
    goal.gtime <= 10;

-- Task 6
SELECT mdate, teamname
FROM game
JOIN eteam ON (game.team1 = eteam.id)
WHERE coach = "Fernando Santos";

-- Task 7
SELECT player
FROM goal
JOIN game on (goal.matchid = game.id)
WHERE stadium = "National Stadium, Warsaw";


-- Task 8
SELECT DISTINCT player
FROM goal
JOIN game ON goal.matchid = game.id 
WHERE (team1='GER' OR team2='GER')
    AND teamid <> "GER";


-- Task 9
SELECT teamname, COUNT(1)
FROM eteam
JOIN goal ON eteam.id = goal.teamid
GROUP BY eteam.id
ORDER BY teamname;

-- Task 10
SELECT stadium, COUNT(teamid)
FROM game
JOIN goal on game.id = goal.matchid
GROUP BY stadium
ORDER BY stadium;

-- Task 11
SELECT matchid, mdate, COUNT(teamid)
FROM game
JOIN goal ON game.id = goal.matchid
WHERE (team1 = "POL" OR team2 = "POL")
GROUP BY matchid;


-- Task 12
SELECT matchid, mdate, COUNT(matchid)
FROM game
JOIN goal ON game.id = goal.matchid
WHERE teamid = "GER"
GROUP BY teamid, matchid;

-- Task 13
SELECT mdate, 
    team1,
    SUM(
        CASE
            WHEN teamid = team1 THEN 1
            ELSE 0
        END) AS score1,
    team2,
    SUM(
        CASE
            WHEN teamid = team2 THEN 1
            ELSE 0
        END) AS score2
FROM game
LEFT JOIN goal ON game.id = goal.matchid
GROUP BY mdate, team1, team2
ORDER BY mdate, matchid, team1, team2;


-- JOIN Quiz
-- Q1) d
-- Q2) c
-- Q3) a
-- Q4) a
-- Q5) b
-- Q6) c
-- Q7) b