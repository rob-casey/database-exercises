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

-- (1) Write a query that shows each department along with the name of the current manager for that department.
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

-- (3) Find the current titles of employees currently working in the customer service department
-- current titles
-- current employees
-- customer service department

SELECT t.title as 'Title', COUNT(*) as 'Count'
FROM departments
LEFT JOIN dept_emp USING (dept_no)
LEFT JOIN titles t USING (emp_no)
WHERE t.to_date > NOW() and dept_name = 'customer service'
GROUP BY t.title ORDER BY t.title
LIMIT 10;

-- (4) Find the current Salary of all current managers.
-- Current Managers, All
-- Current Salary

SELECT dept_name as 'Department Name', 
CONCAT(first_name, ' ', last_name) as 'Name', Salary
FROM dept_manager dm
JOIN departments d USING (dept_no)
JOIN salaries s USING (emp_no)
JOIN employees e USING (emp_no)
WHERE dm.to_date > NOW() and s.to_date > NOW()
ORDER BY dept_name
LIMIT 10;

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