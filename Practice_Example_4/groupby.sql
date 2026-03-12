-- Find average salary per department.
select avg(salary), department_id
FROM employees
GROUP by department_id