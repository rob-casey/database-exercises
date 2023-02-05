USE join_example_db;
SHOW tables;

-- (1) Use the join_example_db. Select all the records from both the users and roles tables.

SELECT * from users;
SELECT * from roles;
DESCRIBE roles;
DESCRIBE users;

-- (2) Use join, left join, and right join to combine results from the users and roles tables 
--     as we did in the lesson. Before you run each query, guess the expected number of results.

SELECT * FROM users 
JOIN roles USING (id);

SELECT * FROM users 
LEFT JOIN roles USING (id);

SELECT * FROM users 
RIGHT JOIN roles USING (id);


-- ==========================================


-- (1) Write a query that shows each department along 
--     with the name of the current manager for that department.

-- [Notes]
-- Each Dept
-- Current Manager 


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

SELECT * FROM departments LIMIT 10;
SELECT * FROM dept_manager LIMIT 10;
SELECT * FROM employees LIMIT 10;

SELECT dept_name as 'Department Name', 
CONCAT(first_name, ' ', last_name) as 'Department Manager'
FROM dept_manager
JOIN departments USING (dept_no)
JOIN employees USING (emp_no)
WHERE to_date > NOW()
ORDER BY dept_name
LIMIT 10;

-- (2) Find the name of all departments currently managed by women.

-- [Notes]
-- dept_name
-- dept_manager, to_date
-- employees, gender

SELECT dept_name, CONCAT(first_name, ' ', last_name)
FROM dept_manager
JOIN departments USING (dept_no)
JOIN employees USING (emp_no)
WHERE gender = 'F' and to_date > NOW()
ORDER BY dept_name
LIMIT 10;

-- (3) Find the current titles of employees currently working in the 
--     customer service department

-- [Notes]
-- current titles
-- current employees
-- customer service department

SELECT t.title as 'Title', COUNT(*) as 'Count'
FROM departments
LEFT JOIN dept_emp USING (dept_no)
LEFT JOIN titles t USING (emp_no)
WHERE t.to_date > NOW() and dept_name = 'customer service'
GROUP BY t.title ORDER BY t.title;

-- (4) Find the current Salary of all current managers.

-- [Notes]
-- Current Managers, All
-- Current Salary

SELECT dept_name as 'Department Name', 
CONCAT(first_name, ' ', last_name) as 'Name', Salary
FROM dept_manager dm
JOIN departments d USING (dept_no)
JOIN salaries s USING (emp_no)
JOIN employees e USING (emp_no)
WHERE dm.to_date > NOW() and s.to_date > NOW()
ORDER BY dept_name;

-- (5) Find the number of current employees in each department.

-- [Notes]
-- Each Department
-- Current Employees
-- Count

SELECT dept_no, dept_name, 
COUNT(emp_no) as 'num_employees'
FROM departments
JOIN dept_emp USING (dept_no)
WHERE to_date > NOW()
GROUP BY dept_name
ORDER BY dept_no;

-- (6) Which departments has the highest average salary? 
--     hint: use current, not historic information

-- [Notes]
-- departments
-- average current salary

SELECT dept_name, avg(salary)
FROM departments
JOIN dept_emp de USING (dept_no)
JOIN salaries s USING (emp_no)
WHERE s.to_date > NOW() and de.to_date > NOW()
GROUP BY dept_name;

-- (7) Who is the highest paid employee in the Marketing Department?
--     Marketing Department

-- [Notes]
-- 1 Value, employee, highest salary

SELECT first_name, last_name, salary
FROM employees
JOIN dept_emp USING (emp_no)
JOIN salaries USING (emp_no)
JOIN departments USING (dept_no)
WHERE dept_name LIKE '%Marketing%'
ORDER BY salary DESC
LIMIT 1;

-- (8) Which current department manager has the highest salary?

-- [Notes]
-- Current Dept Manager
-- Highest Salary

SELECT first_name, last_name, salary, dept_name
FROM dept_manager dm
JOIN salaries s USING (emp_no)
JOIN employees e USING (emp_no)
JOIN departments d USING (dept_no)
WHERE dm.to_date > NOW() AND s.to_date > NOW()
LIMIT 1;

-- (9) Determine the average salary for each department. 
--     Use ALL salary information and round your results.

-- [Notes]
-- Each Department
-- ALL salary, averaged

SELECT dept_name, round(avg(salary))
	FROM departments
    JOIN dept_emp USING (dept_no)
    JOIN salaries USING (emp_no)
    GROUP BY dept_name;