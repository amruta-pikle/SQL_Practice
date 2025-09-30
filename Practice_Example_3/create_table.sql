CREATE TABLE Teams (
    team_id INT PRIMARY KEY,
    team_name VARCHAR(50)
);

CREATE TABLE Staff (
    staff_id INT PRIMARY KEY,
    staff_name VARCHAR(50),
    team_id INT,
    position VARCHAR(50),
    salary INT,
    join_date DATE,
    FOREIGN KEY (team_id) REFERENCES Teams(team_id)
);

CREATE TABLE Tasks (
    task_id INT PRIMARY KEY,
    staff_id INT,
    task_name VARCHAR(50),
    deadline DATE,
    FOREIGN KEY (staff_id) REFERENCES Staff(staff_id)
);
