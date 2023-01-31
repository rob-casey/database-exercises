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
DESCRIBE dept_emp;
-- emp_no
-- dept_no
-- from_date
-- to_date
DESCRIBE salaries;
-- emp_no
-- salary
-- from_table
-- to_table



SELECT * FROM departments;
SELECT * FROM dept_manager;
SELECT * FROM employees;

SELECT departments.dept_name as Workspace, CONCAT(employees.first_name, ' ', employees.last_name) as Full_name
FROM dept_manager DM
JOIN departments ON DM.dept_no = departments.dept_no
JOIN employees ON DM.emp_no = employees.emp_no
WHERE DM.to_date LIKE '9999%'
ORDER BY departments.dept_name;


-- Find the name of all departments currently managed by women.

SELECT departments.dept_name as Workspace, CONCAT(employees.first_name, ' ', employees.last_name) as Manager, Gender
FROM dept_manager DM
JOIN departments ON DM.dept_no = departments.dept_no
JOIN employees ON DM.emp_no = employees.emp_no
WHERE DM.to_date LIKE '9999%' and employees.gender = 'F';

-- Find the current titles of employees currently working in the customer service department

SELECT departments.dept_name as Service, CONCAT(employees.first_name, ' ', employees.last_name) as Employee, employees.emp_no as Employ_No, titles.title 
FROM dept_emp DE
JOIN departments ON DE.dept_no = departments.dept_no
JOIN employees on DE.emp_no = employees.emp_no
JOIN titles on DE.emp_no = titles.emp_no
WHERE DE.to_date LIKE '9999%' and titles.to_date LIKE '9999%';

-- Find the current Salary of all current managers.

SELECT departments.dept_name as 'Department Name', CONCAT(employees.first_name, ' ', employees.last_name) as Name, salaries.salary as Salary
FROM dept_manager DM
JOIN employees ON DM.emp_no = employees.emp_no
JOIN salaries ON DM.emp_no = salaries.emp_no
JOIN departments on DM.dept_no = departments.dept_no
WHERE DM.to_date and salaries.to_date LIKE '9999%';

-- Find the number of current employees in each department.

SELECT departments.dept_no, departments.dept_name as 'Department Name', COUNT(*)
FROM departments
JOIN dept_emp ON departments.dept_no = dept_emp.dept_no
WHERE dept_emp.to_date LIKE '9999%'
GROUP BY departments.dept_no
ORDER BY departments.dept_no DESC;

-- Which departments has the highest average salary? hint: use current, not historic information

SELECT departments.dept_name as 'Department Name', round(avg(salaries.salary)) as 'Average Salary'
FROM salaries
JOIN dept_emp ON salaries.emp_no = dept_emp.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE dept_emp.to_date LIKE '9999%' and salaries.to_date LIKE '9999%' and departments.dept_name = 'Sales'
GROUP BY departments.dept_name;

-- Who is the highest paid employee in the Marketing Department?





