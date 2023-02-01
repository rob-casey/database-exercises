USE employees;
SELECT * from titles;

-- (1) In your script, use DISTINCT to find the unique titles in the titles table. 

SELECT DISTINCT title FROM titles;

-- (2) How many unique titles have there ever been? 
--     Answer that in a comment in your SQL file.
-- 7

-- (3) Write a query to to find a list of all unique last 
--     names of all employees that start and end with 'E' using GROUP BY

SELECT last_name FROM employees WHERE
last_name LIKE 'E%e' GROUP BY
last_name;

-- (4) Write a query to to find all unique combinations of first and last names 
--     of all employees whose last names start and end with 'E'.

SELECT CONCAT(first_name, ' ', last_name)
FROM employees WHERE
last_name LIKE 'E%e' GROUP BY
first_name, last_name;

-- (5) Write a query to find the unique last names with a 'q' but not 'qu'. 
--     Include those names in a comment in your sql code.

SELECT last_name FROM employees WHERE
last_name LIKE '%q%' AND 
last_name NOT LIKE '%qu%' GROUP BY
last_name;

-- Chleq, Lindqvist, Qiwen

-- (6) Add a COUNT() to your results (the query above) to find the number of 
--     employees with the same last name.

SELECT last_name, COUNT(*) FROM employees WHERE
last_name LIKE '%q%' AND 
last_name NOT LIKE '%qu%' GROUP BY
last_name;

-- (7) Find all all employees with first names 'Irena', 'Vidya', or 'Maya'. 

SELECT first_name, last_name
FROM employees WHERE
first_name IN ('Irena', 'Vidya', 'Maya') GROUP BY
first_name, last_name;

-- (8) Use COUNT(*) and GROUP BY to find the number of employees for 
--     each gender with those names.

SELECT gender, COUNT(*) 
FROM employees 
WHERE first_name 
IN ('Irena', 'Vidya', 'Maya') 
GROUP BY gender;

-- (9) Using your query that generates a username for all of the employees, 
--     generate a count employees for each unique username.

SELECT LOWER(CONCAT(
		SUBSTR(first_name, 1, 1), 
        SUBSTR(last_name, 1, 4), 
		'_', 
        SUBSTR(birth_date, 6, 2), 
        SUBSTR(birth_date, 3, 2))) AS Username, COUNT(*) as Total 
FROM employees GROUP BY Username 
ORDER BY total;
        
-- (10) From your previous query, are there any duplicate usernames? Yes
--      What is the higest number of times a username shows up? 6

-- Bonus: How many duplicate usernames are there from your previous query? 13251

SELECT CONCAT(
		SUBSTR(first_name, 1, 1), 
        SUBSTR(last_name, 1, 4), 
		'_', 
        SUBSTR(birth_date, 6, 2), 
        SUBSTR(birth_date, 3, 2)) AS Username, 
        COUNT(*) as Total 
FROM employees
GROUP BY Username 
HAVING total >= 2 
ORDER BY total;

-- BONUS: Determine the historic average salary for each employee. 
--        When you hear, read, or think "for each" with regard to SQL, 
--        you'll probably be grouping by that exact column.


SELECT emp_no, round(AVG(salary)) as Pay
FROM salaries GROUP BY emp_no;

-- BONUS: Using the dept_emp table, count how many current employees work in each department. 
--        Count how many current employees work in each department. 
--        The query result should show 9 rows, one for each department and the employee count

SELECT * FROM dept_emp;

SELECT dept_no, COUNT(*) as total 
FROM dept_emp
GROUP BY dept_no;

-- BONUS: Determine how many different salaries each employee has had. 
--        This includes both historic and current.

SELECT * FROM salaries;

SELECT emp_no, COUNT(*) as Pay
FROM salaries
GROUP BY emp_no;

-- BONUS: Find the maximum salary for each employee.

SELECT emp_no, MAX(salary) as Max
FROM salaries
GROUP BY emp_no;

-- BONUS: Find the minimum salary for each employee.

SELECT emp_no, MIN(salary) as Min
FROM salaries
GROUP BY emp_no;

-- BONUS: Find the standard deviation of salaries for each employee.

SELECT emp_no, STDDEV(salary) as Deviation
FROM salaries
GROUP BY emp_no;

-- BONUS: Now find the max salary for each employee 
--        where that max salary is greater than $150,000

SELECT emp_no, MAX(salary) as Max
FROM salaries 
GROUP BY emp_no
HAVING MAX >= 150000;

-- BONUS: Find the average salary for each employee 
--        where that average salary is between $80k and $90k.

SELECT emp_no, round(AVG(salary)) as Average
FROM salaries
GROUP BY emp_no
HAVING Average between 80000 and 90000;




