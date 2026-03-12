-- Find employees earning more than the average salary of the company.
select name
from employees
where salary > ( select avg(salary) from employees)