USE employees;

-- Find all the current employees with the same hire data as employee 101010 using a subquery
-- Current Employees (to_date) + Employee ID (emp_no)
-- Hire Date (hire_date)

DESCRIBE dept_emp;
-- emp_no
-- from_date
-- to_date
DESCRIBE employees;
-- emp_no
-- hire_date

SELECT employees.emp_no, employees.hire_date
FROM employees
WHERE employees.hire_date 
IN (SELECT employees.hire_date FROM employees WHERE employees.emp_no = '101010');

-- Find all the titles ever held by all current employees with the first name Aamod
-- titles (titles.title)
-- ever held (from_date) - (to_date)
-- all current employees (to_date) (emp_no)
-- first name Aamod (first_name)

DESCRIBE titles;
-- emp_no
-- title
-- from_date
-- to_date

DESCRIBE employees;
-- emp_no
-- first_name
-- last_name
-- hire_date

DESCRIBE dept_emp;
-- emp_no
-- dept_no
-- from_date
-- to_date

SELECT titles.title, count(titles.title)
FROM titles
WHERE titles.emp_no
IN (SELECT employees.emp_no
	FROM employees
	WHERE employees.first_name = 'Aamod')
GROUP BY titles.title;

-- How many people in the employees table are no longer working for the company?
-- How many = Count()
-- Table = Employees
-- Subquery: Table = dept_emp, to_date (

SELECT COUNT(*)
FROM employees
WHERE emp_no
IN (SELECT emp_no
	FROM dept_emp
    GROUP BY emp_no
    HAVING MAX(to_date)<NOW());

SELECT COUNT(*)
FROM employees 
WHERE emp_no IN(
SELECT emp_no 
FROM dept_emp
GROUP BY emp_no
HAVING max(to_date)<NOW());
