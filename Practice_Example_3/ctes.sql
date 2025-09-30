--Use a CTE to calculate team-wise average salary, then list staff earning above their team average.
with team_avg as (
  SELECT team_id,avg(salary) as avg_salary
  from staff
  GROUP by team_id )
SELECT s.staff_name,s.salary, av.avg_salary
from staff s
join team_avg av on s.team_id=av.team_id
where s.salary>av.avg_salary

-- Expected Output
David    70000    65000
