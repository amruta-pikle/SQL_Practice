-- Find employees earning more than the company average salary.
SELECT e.emp_name,e.salary
from employees e
where e.salary > (
  SELECT AVG(salary) FROM employees)

 -- Expected output:
-- emp_name | salary
-- Bob      | 90000
-- Charlie  | 85000


-- Get the department with the highest total salary.
SELECT dept_id
FROM Employees
GROUP BY dept_id
ORDER BY SUM(salary) DESC
LIMIT 1;

-- Expected output:
-- dept_id
-- 1



-- Find employees whose salary = maximum salary.
SELECT e.emp_name
from employees e
WHERE e.salary = (SELECT max(salary) from employees)

-- Expected output:
-- emp_name | salary
-- Bob      | 90000


-- Find employees not assigned to any project (use NOT IN or NOT EXISTS).
SELECT e.emp_name
from employees e
where e.emp_id NOT in (SELECT emp_id from projects)

-- Expected output:
-- emp_name
-- Alice
-- Dave
