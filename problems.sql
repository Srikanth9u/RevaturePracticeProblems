
--1) Table: Weather

-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | id            | int     |
-- | recordDate    | date    |
-- | temperature   | int     |
-- +---------------+---------+
-- id is the column with unique values for this table.
-- There are no different rows with the same recordDate.
-- This table contains information about the temperature on a certain day.
 

-- Write a solution to find all dates' id with higher temperatures compared to its previous dates (yesterday).

-- Return the result table in any order.

SELECT  w1.id FROM Weather w1 WHERE w1.temperature > (
        SELECT  w2.temperature FROM  Weather w2 WHERE  w2.id = w1.id - 1);
-- 2)players first logged in
SELECT player_id, MIN(event_date) AS first_login FROM  Activity GROUP BY player_id;

--3)second highest salary
--select distinct salary as secondHighestSalary from Employee order by salary limit 1 offset 1;

SELECT 
    (SELECT DISTINCT salary
     FROM Employee
     ORDER BY salary DESC
     LIMIT 1 OFFSET 1) AS secondHighestSalary;

-- 4)delete duplicates
DELETE p1 FROM Person p1
INNER JOIN Person p2 
WHERE 
    p1.email = p2.email AND
    p1.id > p2.id;

-- 5)highest salary among managers
SELECT e1.name AS Employee
FROM Employee e1
JOIN Employee e2 ON e1.managerId = e2.id
WHERE e1.salary > e2.salary;

-- 6)customers bought all products
SELECT customer_id
FROM Customer
GROUP BY customer_id
HAVING COUNT(DISTINCT product_key) = (
    SELECT COUNT(DISTINCT product_key) FROM Product
);

-- 7)movie ratings
SELECT name AS results
FROM (
  SELECT u.name
  FROM Users u
  JOIN MovieRating r ON u.user_id = r.user_id
  GROUP BY u.user_id, u.name
  ORDER BY COUNT(*) DESC, u.name
  LIMIT 1
) AS top_user

UNION

SELECT title AS results
FROM (
  SELECT m.title
  FROM Movies m
  JOIN MovieRating r ON m.movie_id = r.movie_id
  WHERE r.created_at BETWEEN '2020-02-01' AND '2020-02-29'
  GROUP BY m.movie_id, m.title
  ORDER BY AVG(r.rating) DESC, m.title
  LIMIT 1
) AS top_movie;
