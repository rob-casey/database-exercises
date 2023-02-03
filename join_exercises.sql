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

-- (1) Write a query that shows each department along with the name of the current manager for that department.

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

/* Instructor Review: 

SELECT * from employees LIMIT 10; instead of DESCRIBE

*/
SELECT * FROM departments;
SELECT * FROM dept_manager;
SELECT * FROM employees;

SELECT departments.dept_name as Workspace, 
	   CONCAT(employees.first_name, ' ', employees.last_name) as Full_name
FROM dept_manager DM
JOIN departments ON DM.dept_no = departments.dept_no -- USING (dept_no)
JOIN employees ON DM.emp_no = employees.emp_no -- USING (emp_no)
WHERE DM.to_date LIKE '9999%' -- > NOW(); <- String Comparison / Because SQL can interpret field as a date, we're able to use it., make sure applicable to all tables.
ORDER BY departments.dept_name;

-- (2) Find the name of all departments currently managed by women.

SELECT departments.dept_name as Workspace, 
	   CONCAT(employees.first_name, ' ', employees.last_name) as Manager, 
       Gender -- Not neccessary
FROM dept_manager DM
JOIN departments ON DM.dept_no = departments.dept_no
JOIN employees ON DM.emp_no = employees.emp_no 
WHERE DM.to_date LIKE '9999%' and employees.gender = 'F';

-- (3) Find the current titles of employees currently working in the customer service department

SELECT departments.dept_name as Workspace, -- Not neccesary for question's purpose
	   CONCAT(employees.first_name, ' ', employees.last_name) as Employee, -- Not neccesary for question's purpose
       employees.emp_no as Employ_No, -- Not neccesary for question's purpose
       titles.title 
FROM dept_emp DE
JOIN departments ON DE.dept_no = departments.dept_no
JOIN employees ON DE.emp_no = employees.emp_no
JOIN titles ON DE.emp_no = titles.emp_no WHERE 
DE.to_date LIKE '9999%' and 
titles.to_date LIKE '9999%' and 
departments.dept_name = 'Customer Service';

-- Can reduce the table's length with COUNT() of employees

-- (4) Find the current Salary of all current managers.

SELECT departments.dept_name as 'Department Name', 
	   CONCAT(employees.first_name, ' ', employees.last_name) as Name, 
       salaries.salary as Salary
FROM dept_manager DM
JOIN employees ON DM.emp_no = employees.emp_no
JOIN salaries ON DM.emp_no = salaries.emp_no
JOIN departments on DM.dept_no = departments.dept_no
WHERE DM.to_date > NOW() and salaries.to_date > NOW();

-- (5) Find the number of current employees in each department.

SELECT departments.dept_no, 
	   departments.dept_name as 'Department Name', 
       COUNT(*)
FROM departments
JOIN dept_emp ON departments.dept_no = dept_emp.dept_no
WHERE dept_emp.to_date LIKE '9999%'
GROUP BY departments.dept_no
ORDER BY departments.dept_no;

-- (6) Which departments has the highest average salary? hint: use current, not historic information

SELECT departments.dept_name as 'Department Name', 
	   round(avg(salaries.salary)) as 'Average Salary' -- aggregate needs to be grouped
FROM salaries
JOIN dept_emp ON salaries.emp_no = dept_emp.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no WHERE 
dept_emp.to_date LIKE '9999%' and 
salaries.to_date LIKE '9999%' and 
departments.dept_name = 'Sales' GROUP BY -- can LIMIT 1 (the top) 
departments.dept_name;

-- Max can be used via subquery

-- Who is the highest paid employee in the Marketing Department?

SELECT CONCAT(employees.first_name, ' ', employees.last_name) as 'Highest Paid Employee', departments.dept_name as 'Department'
FROM salaries
	JOIN dept_emp ON salaries.emp_no = dept_emp.emp_no
	JOIN departments on dept_emp.dept_no = departments.dept_no
	JOIN employees on salaries.emp_no = employees.emp_no
WHERE dept_emp.to_date LIKE '9999%'
	AND salaries.to_date LIKE '9999%'
	AND departments.dept_name = 'Marketing'
ORDER  BY salaries.salary DESC
LIMIT 1;

-- Which current department manager has the highest salary?

SELECT CONCAT(employees.first_name, ' ',employees.last_name) as 'Dept Manager', 
	   departments.dept_name as 'Department', 
       salaries.salary as 'Salary'
FROM salaries
	JOIN dept_manager ON salaries.emp_no = dept_manager.emp_no
    JOIN departments ON dept_manager.dept_no = departments.dept_no
    JOIN employees on salaries.emp_no = employees.emp_no
	JOIN titles on salaries.emp_no = titles.emp_no
WHERE dept_manager.to_date LIKE '9999%'
	AND salaries.to_date LIKE '9999%'
    AND titles.to_date LIKE '9999%'
    AND titles.title LIKE 'Manager'
ORDER BY salaries.salary DESC
LIMIT 1;

-- Determine the average salary for each department. Use ALL salary information and round your results.

SELECT departments.dept_name, 
	   round(avg(salaries.salary), 0) -- uses 0
FROM salaries
	JOIN dept_emp ON salaries.emp_no = dept_emp.emp_no
    JOIN departments ON dept_emp.dept_no = departments.dept_no
GROUP BY departments.dept_name
ORDER BY departments.dept_name DESC;

SELECT dept_name, 
ROUND(AVG(salary), 0) AS avg_sal
FROM salaries
	JOIN dept_emp
		USING (emp_no)
	JOIN departments
		USING (dept_no)
GROUP BY dept_name;