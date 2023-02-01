

-- (1) Create a new file named order_by_exercises.sql and copy in the contents of your exercise from the previous lesson.

-- (2a) Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by first name. 

USE employees;
SHOW TABLES;

SELECT * FROM employees WHERE
first_name = 'Irena' OR
first_name = 'Vidya' OR
first_name = 'Maya' ORDER BY
first_name;

-- In your comments, answer: 
-- (2b) What was the first and last name in the first row of the results? 
-- Irena Reutenauer

-- (2c) What was the first and last name of the last person in the table?
-- Vidya Awdeh

-- (3a) Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by first name and then last name. 

SELECT * FROM employees WHERE
first_name = 'Irena' OR
first_name = 'Vidya' OR
first_name = 'Maya' ORDER BY
first_name, last_name;

-- In your comments, answer: 
-- (3b) What was the first and last name in the first row of the results? 
-- Irena Acton

-- (3c) What was the first and last name of the last person in the table?
-- Vidya Zweizig

-- (4a) Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by last name and then first name. 

SELECT * FROM employees WHERE
first_name = 'Irena' OR
first_name = 'Vidya' OR 
first_name = 'Maya' ORDER BY
last_name, first_name;

-- In your comments, answer: 
-- (4b) What was the first and last name in the first row of the results? 
-- Irena Acton

-- (4c) What was the first and last name of the last person in the table?
-- Maya Zyda

-- (5) Write a query to to find all employees whose last name starts and ends with 'E'. 
-- 	   Sort the results by their employee number. 
--     Enter a comment with the number of employees returned, 
--     the first employee number and their first and last name, 
--     and the last employee number with their first and last name.

SELECT * FROM employees WHERE
last_name LIKE 'E%e' ORDER BY
emp_no;

/* Answer
899 Employees returned
10021, Ramzi Erde is the first employee returned
499648, Tadahiro Erde is the last employee returned 
*/

-- (6) Write a query to to find all employees whose last name starts and ends with 'E'. 
-- 	   Sort the results by their hire date, so that the newest employees are listed first. 
--     Enter a comment with the number of employees returned, 
--     the name of the newest employee, 
--     and the name of the oldest employee.

SELECT * FROM employees WHERE
last_name LIKE 'E%e' ORDER BY
hire_date DESC;

/* Answer
899 Employees returned
Teiji Eldridge is the newest employee
Sergi Erde is the oldest employee
*/

-- (7) Find all employees hired in the 90s and born on Christmas. 
--     Sort the results so that the oldest employee who was hired last is the first result. 
--     Enter a comment with the number of employees returned, 
--     the name of the oldest employee who was hired last, 
--     and the name of the youngest employee who was hired first.

SELECT * FROM employees WHERE
hire_date LIKE '199%' AND
birth_date LIKE '%12-25' ORDER BY
birth_date DESC,
hire_date ASC;

/* Answer
362 employees returned
Khun Bernini is the oldest employee hired last
Douadi Pettis is the youngest employee hired first
*/
