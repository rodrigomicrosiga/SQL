---------------------------------------------------------------------
-- Inside Microsoft SQL Server 2008: T-SQL Querying (MSPress, 2009)
-- Appendix A - Logic Puzzles
-- Copyright Itzik Ben-Gan, 2009
-- All Rights Reserved
---------------------------------------------------------------------

---------------------------------------------------------------------
-- Puzzle 15: 2 Mathematicians
---------------------------------------------------------------------

WITH
  L0 AS(SELECT 0 AS c UNION ALL SELECT 0),
  L1 AS(SELECT 0 AS c FROM L0 AS a CROSS JOIN L0 AS b),
  L2 AS(SELECT 0 AS c FROM L1 AS a CROSS JOIN L1 AS b),
  L3 AS(SELECT TOP(36) 0 AS c FROM L2 AS a CROSS JOIN L2 AS b),
Nums AS(SELECT ROW_NUMBER() OVER(ORDER BY (SELECT 0)) AS n
        FROM L3),
Divisors AS
(
  SELECT C1.n AS age1, C2.n AS age2, C3.n AS age3,
    COUNT(*) OVER(PARTITION BY C1.n + C2.n + C3.n) AS cnt
  FROM Nums AS C1 
    CROSS JOIN Nums AS C2
    CROSS JOIN Nums AS C3
  WHERE C1.n * C2.n * C3.n = 36
    AND C1.n <= C2.n AND C2.n <= C3.n
)
SELECT age1, age2, age3
FROM Divisors
WHERE cnt > 1
  AND age3 > age2; -- One born before others (before house)
  --  AND age1 < age2; -- One born after others (after house)

---------------------------------------------------------------------
-- Puzzle 22: Josephus Problem
---------------------------------------------------------------------

DECLARE @n AS INT = 41;
SELECT 2 * (@n - POWER(2, CAST(LOG(@n)/LOG(2) AS INT))) + 1 AS p;
