-- Task 1
SELECT name
FROM teacher
WHERE dept IS NULL;

-- Task 2
SELECT teacher.name, dept.name
FROM teacher
INNER JOIN dept
    ON (teacher.dept = dept.id);


-- Task 3
SELECT teacher.name, dept.name
FROM teacher
LEFT JOIN dept
    ON (teacher.dept = dept.id);

-- Task 4
SELECT teacher.name, dept.name
FROM teacher
RIGHT JOIN dept
    ON (teacher.dept = dept.id);

-- Task 5
SELECT name, COALESCE(mobile, "07986 444 2266")
FROM teacher;

-- Task 6
SELECT teacher.name, 
    COALESCE(dept.name, "None") AS dept_name
FROM teacher
LEFT JOIN dept
    ON (teacher.dept = dept.id);

-- Task 7
SELECT COUNT(name), COUNT(mobile)
FROM teacher;


-- Task 8
SELECT dept.name, COUNT(teacher.name)
FROM teacher
RIGHT JOIN dept
    ON (teacher.dept = dept.id)
GROUP BY dept.name;


-- Task 9
SELECT name, 
    CASE
        WHEN ((dept = 1) OR (dept = 2)) THEN "Sci"
        ELSE "Art"
    END AS case_column
FROM teacher;

-- Task 10
SELECT name, 
    CASE
        WHEN ((dept = 1) OR (dept = 2)) THEN "Sci"
        WHEN dept = 3 THEN "Art"
        ELSE "None"
    END AS case_column
FROM teacher;

-- Null Quiz
-- Q1) e
-- Q2) c
-- Q3) e
-- Q4) b
-- Q5) a
-- Q6) a