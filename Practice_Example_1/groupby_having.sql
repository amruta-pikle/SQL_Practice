-- Find departments with more than 3 employees.
SELECT COUNT(e.emp_id),d.dept_name
from employees e
JOIN departments d on e.dept_id=d.dept_id
GROUP by d.dept_name
HAVING COUNT(e.emp_id) > 3

-- Expected output:
-- dept_id | emp_count
-- (empty if no dept has >3 employees)



-- Count employees per department.
SELECT COUNT(e.emp_id),d.dept_name
from employees e
JOIN departments d on e.dept_id=d.dept_id
GROUP by d.dept_name

-- Expected output:
-- dept_id | emp_count
-- 1       | 2
-- 2       | 1


-- Find avg salary per department.
SELECT AVG(e.salary),d.dept_name
from employees e
JOIN departments d on e.dept_id=d.dept_id
GROUP by d.dept_name

-- Expected output:
-- dept_id | avg_salary
-- 1       | 85000
-- 2       | 60000



-- Show departments where avg salary > 50,000.
SELECT AVG(e.salary),d.dept_name
from employees e
JOIN departments d on e.dept_id=d.dept_id
GROUP by d.dept_name
having AVG(salary) > 50000

-- Expected output:
-- dept_id | avg_salary
-- 1       | 85000
-- 2       | 60000