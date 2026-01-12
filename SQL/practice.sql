SELECT CONCAT(Departments.DepartmentName,",",Students.Name,",",Students.GPA) AS A FROM Students
INNER JOIN Departments ON Departments.DepartmentId = Students.DepartmentId
WHERE (Students.DepartmentId,Students.GPA) IN (
    SELECT SUBSTU.DepartmentId, MIN(SUBSTU.GPA) FROM Students AS SUBSTU
    GROUP BY  SUBSTU.DepartmentId
    
) ORDER BY Departments.DepartmentName;

SELECT SUM(if(MONTH(Jobs.Date)=11,1,0)) AS 
Job_Offers FROM Students
LEFT JOIN Jobs ON Jobs.Id = Students.Id
GROUP BY Students.Id
ORDER BY Students.Id;

SELECT DISTINCT(reviewer_name) AS reviewer_name FROM reviewers
INNER JOIN ratings ON reviewers.reviewer_id = ratings.reviewer_id
WHERE ratings.reviewer_stars IS NULL;

SELECT CONCAT(directors.director_first_name,directors.director_last_name) AS director_name, 
movies.movie_title AS movie_title 
FROM directors 
INNER JOIN movies_directors ON movies_directors.director_id = directors.director_id
INNER JOIN movies_cast ON movies_cast.movie_id = movies_directors.movie_id
INNER JOIN movies ON movies_cast.movie_id = movies.movie_id
WHERE movies_cast.role = "SeanMaguire"

SELECT movies.movie_title AS movie_title, movies.movie_year AS movie_year,
CONCAT(directors.director_first_name,directors.director_last_name) AS director_name,
CONCAT(actors.actor_first_name,actors.actor_last_name) AS actor_name,
movies_cast.role AS role
FROM movies
INNER JOIN movies_directors ON movies_directors.movie_id = movies.movie_id
INNER JOIN directors ON movies_directors.director_id= directors.director_id
INNER JOIN movies_cast ON movies_cast.movie_id = movies.movie_id
INNER JOIN actors ON movies_cast.actor_id = actors.actor_id
ORDER BY movies.movie_time 
LIMIT 1;

SELECT SUM(DISTINCT(Jobs.Salary)) AS Salary FROM Jobs
INNER JOIN Students ON Students.Id = Jobs.Id
INNER JOIN Departments ON Departments.DepartmentId = Students.DepartmentId
WHERE Departments.DepartmentName = "CSE";

SELECT movies.movie_title FROM movies
INNER JOIN movies_cast ON movies_cast.movie_id = movies.movie_id
WHERE movies_cast.actor_id IN 
(
SELECT actor_id FROM movies_cast
GROUP BY actor_id 
HAVING COUNT(movie_id) > 1
);

SELECT if(EVALUATION.Rating <6, NULL, EMPLOYEE.Name) AS Names, EVALUATION.Rating AS Rating FROM EMPLOYEE 
INNER JOIN EVALUATION ON EMPLOYEE.POINTS 
BETWEEN EVALUATION.LOWER AND EVALUATION.UPPER
ORDER BY EVALUATION.Rating DESC, EMPLOYEE.Name;

SELECT CASE 
WHEN (A+B+C) > 0 then "Positive" 
WHEN (A+B+C) < 0 then "Negative"  
ELSE "Zero"
END AS A FROM NUMBERS;

SELECT CONCAT(Player,"(",SUBSTRING(ROLE,1,1),")") AS N FROM GAMERS
ORDER BY Player;

SELECT COUNT(Country) FROM PLACES WHERE Country REGEXP '[aeiouAEIOU]$';


SET @h=0, @a=0, @d=0, @t=0;
SELECT MIN(Healer),MIN(Attacker),MIN(Defender),MIN(Tactician)
FROM
(SELECT IF(Role='Healer',Player,NULL) AS Healer,
        IF(Role='Attacker',Player,NULL) AS Attacker,
        IF(Role='Defender',Player,NULL) AS Defender,
        IF(Role='Tactician',Player,NULL) AS Tactician,
 CASE Role
    WHEN 'Healer' THEN @h:=@h+1
    WHEN 'Attacker' THEN @a:=@a+1
    WHEN 'Defender' THEN @d:=@d+1
    WHEN 'Tactician' THEN @t:=@t+1
 END
AS idn FROM GAMERS ORDER BY Player )
AS temp GROUP BY temp.idn;

SELECT MAX(
    if(XCoordinate - 20 > 0, XCoordinate - 20 ,(XCoordinate - 20)*-1)  + 
    if(YCoordinate - 4 > 0, YCoordinate - 4 ,(YCoordinate - 4)*-1)
    )
AS A FROM HOUSES;

SELECT 
SQRT(POW((MAX(XCoordinate)-MIN(XCoordinate)),2) +
POW((MAX(YCoordinate)-MIN(YCoordinate)),2)) AS A FROM HOUSES

INSERT INTO location_mapper (
    id,
    dataEntry,
    userId,
    formId,
    village_id,
    grampanchayat_id,
    cluster_id,
    block_id,
    district_id,
    state_id,
    partner,
    createdAt,
    modifiedAt,
    isActive,
    baseGeography,
    _id
    )
SELECT 
id,
dataEntry,
deviceId,
formId,
village_id,
grampanchayat_id,
cluster_id,
block_id,
district_id,
state_id,
NULL,
modifiedAt,
createdAt,
isActive,
NULL,
_id
FROM device_mapper;

ALTER TABLE location_mapper RENAME COLUMN hamlet_id TO village_id;
ALTER TABLE location_mapper RENAME COLUMN village_id TO grampanchayat_id;
ALTER TABLE location_mapper RENAME COLUMN grampanchayat_id TO cluster_id;

ALTER TABLE location_mapper CHANGE hamlet_id village_id INT;

SELECT COUNT(*) AS A FROM WORKERS
WHERE DailyWage*DaysWorked = (SELECT MAX(DailyWage*DaysWorked) FROM WORKERS)


WITH 
active_users AS (
    SELECT id, name FROM users WHERE status = 'ACTIVE'
),
latest_orders AS (
    SELECT o.*
    FROM orders o
    JOIN active_users u ON u.id = o.user_id
    WHERE o.created_at > CURRENT_DATE - INTERVAL '30 days'
),
total_spend AS (
    SELECT user_id, SUM(amount) AS total
    FROM latest_orders
    GROUP BY user_id
),
ranked_users AS (
    SELECT 
        user_id, 
        total,
        RANK() OVER (ORDER BY total DESC) AS rank
    FROM total_spend
)

SELECT * FROM ranked_users WHERE rank <= 10;

BEGIN;

INSERT INTO orders (user_id, amount) VALUES (1, 1500);
SAVEPOINT after_order;

UPDATE users SET wallet = wallet - 1500 WHERE id = 1;
SAVEPOINT after_wallet_update;

UPDATE payments SET status = 'SUCCESS' WHERE order_id = 100;
-- Assume this fails

ROLLBACK TO after_wallet_update;   -- rollback only payment update

UPDATE payments SET status = 'PENDING' WHERE order_id = 100;

RELEASE SAVEPOINT after_order;     -- release first savepoint

COMMIT;   -- finalize all successful operations


CREATE VIEW active_employees AS
SELECT id, name, salary
FROM employees
WHERE status = 'active';
SELECT * FROM active_employees;


# Write your MySQL query statement below
SELECT w1.id as Id FROM Weather as w1
JOIN Weather as w2 ON 
DATEDIFF(w1.recordDate,w2.recordDate) = 1 AND w1.temperature > w2.temperature

# Write your MySQL query statement below
SELECT emp.name AS name,bonus.bonus AS bonus FROM  Employee as emp
LEFT JOIN Bonus as bonus ON emp.empId = bonus.empId
WHERE  bonus.bonus < 1000 OR bonus.bonus IS NULL

CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
DECLARE M INT;
    SET M = N-1;
  RETURN (
      # Write your MySQL query statement below.
    SELECT IFNULL((
        SELECT DISTINCT(salary) FROM Employee
        ORDER BY salary DESC 
        LIMIT M,1
    ),NULL) as getNthHighestSalary
  );
END

