-- Rank staff by salary within each team.
SELECT
	s.staff_id,
    s.staff_name,
    tt.team_name,
    s.salary,
    RANK() over (PARTITION by tt.team_id order by s.salary DESC) as salary_rank
from staff s
join teams tt on s.team_id=tt.team_id

-- Expected Output
| staff_id | staff_name | team_name | salary | salary_rank |
| -------- | ---------- | --------- | ------ | ----------- |
| 104      | David      | Alpha     | 70000  | 1           |
| 101      | Alice      | Alpha     | 60000  | 2           |
| 102      | Bob        | Beta      | 50000  | 1           |
| 105      | Eva        | Gamma     | 80000  | 1           |
| 103      | Charlie    | NULL      | 45000  | 1           |




--Find the running total of salaries ordered by join_date.
SELECT
	staff_id,
    staff_name,
    join_date,
    salary,
    sum(salary) OVER (order by join_date) as running_total
from staff
order by join_date

-- Expected Output
| staff_id | staff_name | join_date  | salary | running_total |
| -------- | ---------- | ---------- | ------ | ------------- |
| 101      | Alice      | 2024-01-10 | 60000  | 60000         |
| 102      | Bob        | 2024-02-15 | 50000  | 110000        |
| 103      | Charlie    | 2024-03-20 | 45000  | 155000        |
| 104      | David      | 2024-04-05 | 70000  | 225000        |
| 105      | Eva        | 2024-05-12 | 80000  | 305000        |


--Find the average salary per team and show the difference of each staff’s salary from their team’s average.
SELECT
	s.staff_id,
    s.staff_name,
    tt.team_name,
    s.salary,
    avg(salary) over (PARTITION BY s.team_id) as avg_salary,
    s.salary - avg(s.salary) over (PARTITION by s.team_id ) as diff_from_avg
from staff s
join teams tt on s.team_id=tt.team_id

-- Expected Output
| staff_id | staff_name | team_name | salary | avg_salary | diff_from_avg |
| -------- | ---------- | --------- | ------ | ---------- | ------------- |
| 101      | Alice      | Alpha     | 60000  | 65000      | -5000         |
| 104      | David      | Alpha     | 70000  | 65000      | 5000          |
| 102      | Bob        | Beta      | 50000  | 50000      | 0             |
| 105      | Eva        | Gamma     | 80000  | 80000      | 0             |
| 103      | Charlie    | NULL      | 45000  | 45000      | 0             |

