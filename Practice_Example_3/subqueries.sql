--Find staff earning more than the company average salary.
select staff_name
from staff
where salary > (SELECT avg(salary) from staff)

-- Expected Output
David
Eva


--Get the team with the highest total salary.
SELECT t.team_name
FROM Teams t
WHERE t.team_id = (
    SELECT s.team_id
    FROM Staff s
    GROUP BY s.team_id
    ORDER BY SUM(s.salary) DESC
    LIMIT 1
);

-- Expected Output
Alpha


--Find staff whose salary = maximum salary.
select staff_name
from staff
where salary = (SELECT max(salary) from staff)

-- Expected Output
Eva


--Find staff not assigned to any task.
SELECT staff_name
from staff
WHERE staff_id not in ( SELECT staff_id from tasks)

-- Using JOINS
SELECT s.staff_name
FROM Staff s
LEFT JOIN Tasks t
    ON s.staff_id = t.staff_id
WHERE t.staff_id IS NULL;

-- Expected Output
Charlie
Eva


