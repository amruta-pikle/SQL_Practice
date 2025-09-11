-- Get all employees with their department names.
select e.emp_name, d.dept_name
from employees e
join departments d on e.dept_id=d.dept_id

-- Expected output:
-- emp_name | dept_name
-- Alice    | Engineering
-- Bob      | Engineering
-- Charlie  | HR


-- List all employees, including those without departments.
SELECT e.emp_name, d.dept_name
from employees e
LEFT JOIN departments d on e.dept_id=d.dept_id

-- Expected output:
-- emp_name | dept_name
-- Alice    | Engineering
-- Bob      | Engineering
-- Dave     | NULL


-- List all departments, even if they have no employees.
SELECT d.dept_name
from departments d
RIGHT JOIN employees e ON e.dept_id=d.dept_id


-- Expected output:
-- emp_name | dept_name
-- Alice    | Engineering
-- Bob      | Engineering
-- NULL     | Sales


-- Show all employees and departments (full outer join).
SELECT e.emp_name, d.dept_name
FROM employees e
FULL OUTER JOIN departments d on e.dept_id=d.dept_id

-- Expected output:
-- emp_name | dept_name
-- Alice    | Engineering
-- Bob      | Engineering
-- NULL     | Sales
-- Dave     | NULL