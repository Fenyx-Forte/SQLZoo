-- Task 1
SELECT a_strongly_agree
FROM nss
WHERE question='Q01'
    AND institution='Edinburgh Napier University'
    AND subject='(8) Computer Science';


-- Task 2
SELECT institution, subject
FROM nss
WHERE question='Q15'
    AND score >= 100;

-- Task 3
SELECT institution, score
FROM nss
WHERE question = "Q15"
    AND score < 50
    AND subject = "(8) Computer Science";


-- Task 4
SELECT subject, SUM(response)
FROM nss
WHERE question = "Q22"
    AND subject IN ("(8) Computer Science", 
                    "(H) Creative Arts and Design")
GROUP BY subject;

-- Task 5
SELECT subject, SUM(response * a_strongly_agree / 100)
FROM nss
WHERE question = "Q22"
    AND subject IN ("(8) Computer Science", 
                    "(H) Creative Arts and Design")
GROUP BY subject;

-- Task 6
SELECT subject, 
    ROUND(SUM(response * A_STRONGLY_AGREE / 100) / SUM(response) * 100, 0)
FROM nss
WHERE question = "Q22"
    AND subject IN ("(8) Computer Science", 
                    "(H) Creative Arts and Design")
GROUP BY subject;

-- Task 7
SELECT institution,
    ROUND(SUM(score *  response) / SUM(response), 0)
FROM nss
WHERE question = 'Q22'
    AND institution LIKE '%Manchester%'
GROUP BY institution
ORDER BY institution;


-- Task 8
SELECT institution,
    SUM(sample),
    (SELECT sample
    FROM nss AS nss_b
    WHERE subject="(8) Computer Science"
        AND question = "Q01"
        AND nss_a.institution = nss_b.institution) AS comp
FROM nss AS nss_a
WHERE question = "Q01"
    AND institution LIKE "%Manchester%"
GROUP BY institution;
