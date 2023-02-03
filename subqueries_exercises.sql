USE employees;

-- (1) Find all the current employees with the same hire data as employee 101010 using a subquery
--     Current Employees (to_date) + Employee ID (emp_no)
--     Hire Date (hire_date)

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

-- dept emp, single value or column

-- (2) Find all the titles ever held by all current employees with the first name Aamod
--     titles (titles.title)
--     ever held (from_date) - (to_date)
--     all current employees (to_date) (emp_no)
--     first name Aamod (first_name)

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

-- (3) How many people in the employees table are no longer working for the company?
--     How many = Count()
--     Table = Employees
--     Subquery: Table = dept_emp, to_date (

SELECT COUNT(emp_no) 
FROM employees
WHERE emp_no
NOT IN (SELECT emp_no
	FROM dept_emp
    WHERE to_date > NOW());
    
    
    -- 240124 employees are no longer working for the company
    
-- (4) Find all the current department managers that are female. List their names in a comment in your code.
--     Current
--     Dept Manager
--     Female

SELECT * FROM dept_manager; -- emp_no, dept_no, to_date
SELECT * FROM employees; -- emp_no, gender, first_name, last_name

-- Inner Query: Current Department Managers

SELECT emp_no
FROM dept_manager
WHERE to_date > NOW();

-- Outer Query: Gender, Name

SELECT * FROM employees
	JOIN dept_manager
		USING(emp_no)
        WHERE gender = 'f' and emp_no in 
(
SELECT emp_no
FROM dept_manager
WHERE to_date > now()
)
;

/* Answer 
Isamu Legleitner
Karsten Sigstam
Leon DasSarma
Hilary Kambil
*/

-- (5) Find all the employees who currently have a higher salary than the companies overall, historical average salary.

SELECT * FROM employees;
SELECT * FROM salaries;


-- Inner Query: Companies overall, historical average salary

SELECT round(AVG(SALARY), 2)
FROM salaries;


-- Outer Query: Employees, Current Higher Salary

SELECT emp_no, salary
FROM salaries WHERE 
to_date > NOW() and 
salary >
((SELECT round(AVG(salary), 2) FROM salaries))
;
                
                
-- (6) How many current salaries are within 1 standard deviation of the current highest salary? 
--     Hint: you can use a built in function to calculate the standard deviation.

-- How many - count
-- current salaries - to_date, salary
-- current highest - max(salary)
-- 1 standard deviation = 68%: STDDEV

SELECT * FROM salaries;

-- Inner Query: current highest salary

SELECT max(salary) from salaries where to_date>now(); -- 158220
SELECT round(stddev(salary)) from salaries where to_date > now(); -- 17310
SELECT round(max(salary)-stddev(salary)) from salaries; -- 141315
SELECT round(max(salary)-stddev(salary))-max(salary) from salaries;


SELECT COUNT(*) FROM salaries
WHERE to_date > NOW() and salary >=
(SELECT(max(salary)-stddev(salary)) from salaries
		where to_date > NOW());

-- 83

-- What percentage of all salaries is this?

SELECT ((SELECT COUNT(*) FROM salaries WHERE 
	     to_date > NOW() and salary > -- Employees within 1 Standard Deviation
		(SELECT round(max(salary)-stddev(salary), 3) -- Standard Deviation 
		 from salaries where to_date>now()))/(SELECT COUNT(*) -- Total Employee Population
		 from salaries where to_date > NOW()))*100 as Percentage
FROM salaries
LIMIT 1;


-- BONUS: Find all the department names that currently have female managers.

-- dept_manager, dept_name, dept_no, gender

DESCRIBE titles;
-- emp_no
-- title
-- from_date
-- to_date

DESCRIBE departments;
-- dept_no
-- dept_name

DESCRIBE employees;
-- gender
-- emp_no

DESCRIBE dept_emp;
-- emp_no
-- dept_no

SELECT emp_no, title 
FROM employees 
	JOIN titles USING (emp_no)
WHERE gender = 'F' AND title LIKE '%manager%'
;

SELECT *
FROM employees
JOIN dept_emp USING (emp_no)
JOIN departments USING (dept_no)
WHERE gender = 'F' and emp_no 
IN (SELECT emp_no 
    FROM dept_manager
	WHERE to_date >NOW());

-- BONUS: Find the first and last name of the employee with the highest salary.

DESCRIBE salaries;
-- emp_no
-- salary

DESCRIBE employees;
-- emp_no
-- first_name
-- last_name

-- Inner: highest salary
-- Outer: employee, first/last name

SELECT first_name, last_name
FROM employees
JOIN salaries USING (emp_no)
WHERE salary = ((SELECT max(salary) from salaries))
;

-- Bonus: Find the department name that the employee with the highest salary works in.

DESCRIBE departments;
-- dept_no
-- dept_name

DESCRIBE employees;
-- emp_no
-- first_name
-- last_name

DESCRIBE salaries;
-- emp_no
-- salary

DESCRIBE dept_emp;
-- emp_no
-- dept_no

SELECT dept_name FROM dept_emp
JOIN departments USING (dept_no)
JOIN employees USING (emp_no)
JOIN salaries USING (emp_no)
WHERE salary = (SELECT max(salary) from salaries where to_date > NOW())
;


