--Get all staff with their team names.
select s.staff_name, tt.team_name
from staff s
LEFT join teams tt on s.team_id=tt.team_id

-- Expected Output
Alice    Alpha
Bob      Beta
Charlie  NULL
David    Alpha
Eva      Gamma


--List all staff, even those not assigned to any team.
select s.staff_name, tt.team_name
from staff s
LEFT join teams tt on s.team_id=tt.team_id

-- Expected Output
Alice    Alpha
Bob      Beta
Charlie  NULL
David    Alpha
Eva      Gamma


--List all teams, even if they have no staff.
select tt.team_name,s.staff_name
from teams tt
LEFT join staff s on tt.team_id=s.team_id

-- Expected Output
Alpha    Alice
Alpha    David
Beta     Bob
Gamma    Eva


--Show all staff and teams (full outer join).
SELECT s.staff_name,tt.team_name
from staff s
FULL OUTER JOIN teams tt on s.team_id=tt.team_id

-- Expected Output
Alice    Alpha
Bob      Beta
Charlie  NULL
David    Alpha
Eva      Gamma

