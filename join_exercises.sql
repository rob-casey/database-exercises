USE join_example_db;
DESCRIBE users;
DESCRIBE roles;

SHOW tables;

-- Use the join_example_db. Select all the records from both the users and roles tables.

select * from users;
select * from roles;

-- Use join, left join, and right join to combine results from the users and roles tables 
-- as we did in the lesson. Before you run each query, guess the expected number of results.

SELECT users.name as user_name, roles.name as role_name
FROM users JOIN roles ON users.role_id = roles.id;

SELECT users.name as user_name, roles.name as role_name
FROM users LEFT JOIN roles ON users.role_id = roles.id;

SELECT users.name as user_name, roles.name as role_name
FROM users RIGHT JOIN roles ON users.role_id = roles.id;

-- left and right join

-- Write a query that shows each department along with the name of the current manager for that department.

USE employees;
SHOW tables;

DESCRIBE departments;
-- dept_no
-- dept_name
DESCRIBE dept_manager;
-- dept_no
-- emp_no
-- from_date
-- to_date
DESCRIBE employees;
-- emp_no
-- first_name
-- last_name
DESCRIBE titles;
-- emp_no
-- title
-- from_date
-- to_date


SELECT * FROM departments;
SELECT * FROM dept_manager;
SELECT * FROM employees;

SELECT CONCAT(e.first_name, ' ', e.last_name) AS full_name, d.dept_name
FROM employees AS e
JOIN dept_manager AS dm
ON e.emp_no = dm.emp_no
JOIN department as d
ON d.dept_no = dm.dept_no
WHERE dm.to_date = '9999%'
ORDER BY d.dept_name;

SELECT departments.dept_name as Workspace, CONCAT(employees.first_name, ' ', employees.last_name) as Full_name
FROM dept_manager DM
JOIN departments ON DM.dept_no = departments.dept_no
JOIN employees ON DM.emp_no = employees.emp_no
WHERE DM.to_date LIKE '9999%'
ORDER BY departments.dept_name;


-- JOIN department as d
-- ON d.dept_no = dm.dept_no;

-- JOIN departments AS d
-- ON (d.dept_no = dm.dept_no)
-- WHERE dept_manager.to_date = '9999%';

SELECT departments.dept_name, concat(employees.first_name," ",employees.last_name)
FROM dept_manager DM
JOIN departments on DM.dept_no = departments.dept_no
JOIN employees on DM.emp_no = employees.emp_no
WHERE DM.to_date = '9999-01-01'
ORDER BY departments.dept_name;

