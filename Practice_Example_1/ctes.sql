--Use a CTE to calculate department-wise average salary, then list employees earning above that.
with DeptAvg AS(
  SELECT dept_id,avg(salary) as avg_salary
  from employees
  GROUP by dept_id
)
 SELECT e.emp_name, e.salary, d.avg_salary
 from employees e
 JOIN DeptAvg d on e.dept_id=d.dept_id
 where e.salary > d.avg_salary

 -- Expected output:
-- (No rows returned)

-- Note: No employees earn strictly above the department average in the current sample data. The query works correctly and would return rows if any employee had salary > department average.