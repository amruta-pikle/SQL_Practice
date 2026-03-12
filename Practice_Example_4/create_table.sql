CREATE TABLE departments (
    id INT PRIMARY KEY,
    department_name VARCHAR(50)
);

CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    department_id INT,
    salary INT
);

CREATE TABLE projects (
    id INT PRIMARY KEY,
    employee_id INT,
    project_name VARCHAR(50)
);