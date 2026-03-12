-- Find employees who are not assigned to any project.
select e.name
from employees e
LEFT JOIN projects pp
on e.id = pp.employee_id
where pp.employee_id is null