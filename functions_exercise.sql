USE employees;

SELECT * FROM employees 
WHERE (first_name = 'Irena') 
OR  (first_name = 'Vidya') 
OR (first_name = 'Maya')
ORDER BY first_name LIMIT 1;

-- What was the first and last name in the first row of the results? Irena Reutenauer

SELECT * FROM employees 
WHERE (first_name = 'Irena') 
OR  (first_name = 'Vidya') 
OR (first_name = 'Maya')
ORDER BY first_name DESC LIMIT 1;

-- What was the first and last name of the last person in the table? Vidya Awdeh

SELECT * FROM employees 
WHERE (first_name = 'Irena') 
OR  (first_name = 'Vidya') 
OR (first_name = 'Maya')
ORDER BY first_name, last_name
LIMIT 1;

-- (Inst) Refers to IN vs. OR, by following the INstructions.
-- SELECT * FROM employees 
-- WHERE first_name IN ('Irena', 'Vidya', 'Maya')
-- ORDER BY first_name, last_name
-- LIMIT 1;

-- What was the first and last name in the first row of the results? Irena Acton

SELECT * FROM employees 
WHERE (first_name = 'Irena') 
OR  (first_name = 'Vidya') 
OR (first_name = 'Maya')
ORDER BY first_name DESC , last_name DESC
LIMIT 1;

-- What was the first and last name of the last person in the table? Vidya Zweisig

SELECT * FROM employees
WHERE (first_name = 'Irena') 
OR  (first_name = 'Vidya') 
OR (first_name = 'Maya')
ORDER BY last_name, first_name;

-- What was the first and last name in the first row of the results? Irena Acton
-- What was the first and last name of the last person in the table? Maya Zyda

SELECT * FROM employees
WHERE last_name LIKE 'E%e'
ORDER BY emp_no
Limit 1;

-- Enter a comment with the number of employees returned: 899 rows returned
-- the first employee number and their first and last name: 10021, Ramzi Erde
-- (INST) Can use Limit 1, LIMIT 1 DESC

SELECT * FROM employees
WHERE last_name LIKE 'E%e'
ORDER BY emp_no DESC
Limit 1;

-- and the last employee number with their first and last name: 499648, Tadihiro Erde

SELECT * FROM employees
WHERE last_name LIKE 'E%e'
ORDER BY hire_date DESC;

-- Enter a comment with the number of employees returned: 899 rows returned
-- the name of the newest employee: Teiji Eldridge

SELECT * FROM employees
WHERE last_name LIKE 'E%e'
ORDER BY hire_date, birth_date;

-- and the name of the oldest employee: Serge Erde

SELECT * FROM employees
WHERE hire_date LIKE '199%' 
AND birth_date LIKE '%12-25'
ORDER BY birth_date, hire_date DESC;

-- Enter a comment with the number of employees returned: 362 rows returned
-- the name of the oldest employee who was hired last: Khun Bernini

SELECT * FROM employees
WHERE hire_date LIKE '199%' 
AND birth_date LIKE '%12-25'
ORDER BY birth_date DESC, hire_date;

-- and the name of the youngest employee who was hired first: Alselm Cappello

-- Functions Exercise Starts Here

-- Write a query to to find all employees whose last name starts and ends 
-- with 'E'. Use concat() to combine their first and last name together 
-- as a single column named full_name.

SELECT concat(first_name, last_name) AS full_name
FROM employees WHERE last_name LIKE 'E%e';

-- Convert the names produced in your last query to all uppercase.

SELECT UPPER(concat(first_name, last_name)) AS full_name
FROM employees WHERE last_name LIKE 'E%e';

-- Find all employees hired in the 90s and born on Christmas. Use datediff() 
-- function to find how many days they have been working at the company 
-- (Hint: You will also need to use NOW() or CURDATE())

SELECT First_Name, Last_Name, DATEDIFF(NOW(), hire_date) AS Days_With_Company
FROM employees
WHERE hire_date LIKE '199%' AND birth_date LIKE '%12-25';

-- Find the smallest and largest current salary from the salaries table.

SELECT min(salary) as minimum, max(salary) as maximum from salaries;

-- Use your knowledge of built in SQL functions to generate a username 
-- for all of the employees. A username should be all lowercase, and consist 
-- of the first character of the employees first name, the first 4 characters 
-- of the employees last name, an underscore, the month the employee was born, 
-- and the last two digits of the year that they were born. Below is an example 
-- of what the first 10 rows will look like:

SELECT LOWER(CONCAT(
		SUBSTR(first_name, 1, 1), 
        SUBSTR(last_name, 1, 4), 
		'_', 
        SUBSTR(birth_date, 6, 2), 
        SUBSTR(birth_date, 3, 2))) AS username, 
first_name, last_name, birth_date FROM employees;
