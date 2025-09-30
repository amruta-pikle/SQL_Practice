--Count staff per team.
SELECT tt.team_name, count(s.staff_id)
from teams tt
left JOIN staff s on tt.team_id=s.team_id
GROUP by tt.team_name

-- Expected Output
Alpha    2
Beta     1
Gamma    1


--Find average salary per team
SELECT tt.team_name, AVG(s.salary)
from teams tt
LEft JOIN staff s on tt.team_id=s.team_id
GROUP by tt.team_name

-- Expected Output
Alpha    65000
Beta     50000
Gamma    80000


--Show teams where average salary > 60000.
SELECT tt.team_name, AVG(s.salary)
from teams tt
LEft JOIN staff s on tt.team_id=s.team_id
GROUP by tt.team_name
HAVING avg(s.salary) > 60000

-- Expected Output
Alpha    65000
Gamma    80000


--Find teams with more than 1 staff member.
SELECT tt.team_name, count(s.staff_id)
from teams tt
left JOIN staff s on tt.team_id=s.team_id
GROUP by tt.team_name
HAVING count(s.staff_id) > 1

-- Expected Output
Alpha    2


