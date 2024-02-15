-- Task 1
SELECT lastName, party, votes
FROM ge
WHERE constituency = 'S14000024' AND yr = 2017
ORDER BY votes DESC;


-- Task 2
SELECT party, 
    votes,
    RANK() OVER (ORDER BY votes DESC) as posn
FROM ge
WHERE constituency = 'S14000024' AND yr = 2017
ORDER BY party;

-- Task 3
SELECT yr,
    party, 
    votes,
    RANK() OVER (PARTITION BY yr ORDER BY votes DESC) as posn
FROM ge
WHERE constituency = 'S14000021'
ORDER BY party, yr;

-- Task 4
SELECT constituency, 
    party, 
    votes,
    RANK() OVER (PARTITION BY constituency ORDER BY votes DESC) AS posn
FROM ge
WHERE constituency BETWEEN 'S14000021' AND 'S14000026'
    AND yr  = 2017
ORDER BY constituency, posn;

-- Task 5
WITH temp AS (
    SELECT constituency, 
        party, 
        votes,
        RANK() OVER (PARTITION BY constituency ORDER BY votes DESC) AS posn
    FROM ge
    WHERE constituency BETWEEN 'S14000021' AND 'S14000026'
        AND yr  = 2017
    ORDER BY constituency, posn;
)
SELECT temp.constituency, temp.party
FROM temp
WHERE temp.posn = 1

-- Task 6