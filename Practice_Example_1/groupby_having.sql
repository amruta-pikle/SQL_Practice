-- Find departments with more than 3 employees.
SELECT COUNT(e.emp_id),d.dept_name
from employees e
JOIN departments d on e.dept_id=d.dept_id
GROUP by d.dept_name
HAVING COUNT(e.emp_id) > 3

-- Count employees per department.
SELECT COUNT(e.emp_id),d.dept_name
from employees e
JOIN departments d on e.dept_id=d.dept_id
GROUP by d.dept_name


-- Find avg salary per department.
SELECT AVG(e.salary),d.dept_name
from employees e
JOIN departments d on e.dept_id=d.dept_id
GROUP by d.dept_name


-- Show departments where avg salary > 50,000.
SELECT AVG(e.salary),d.dept_name
from employees e
JOIN departments d on e.dept_id=d.dept_id
GROUP by d.dept_name
having AVG(salary) > 50000