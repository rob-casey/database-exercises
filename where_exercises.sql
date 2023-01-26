USE employees;
SHOW TABLES;
-- (ia) dont need show tables

/* Find all current or previous employees with first names 'Irena', 'Vidya', 
or 'Maya' using IN. Enter a comment with the number of records returned.*/

SELECT * FROM employees WHERE first_name IN ('Irena', 'Vidya', 'Maya');
-- 710 rows were returned.
-- (ia)

/* Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya', as in Q2, but use OR instead of IN. 
Enter a comment with the number of records returned. Does it match number of rows from Q2?*/

SELECT first_name 
FROM employees 
WHERE (first_name = 'Irena') 
OR  (first_name = 'Vidya') 
OR (first_name = 'Maya');
-- It does not match the number of rows returned from Q2. 709 rows were returned vs. 710 from Q2.
-- (ia) doesnt use parenthesis, and uses OR 
-- (ia) string literal 'Irena' exist; Python would have issues with certain phrasing
-- (ia) best practice to establish equivilency 


/* Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya', using OR, 
and who is male. Enter a comment with the number of records returned.*/

SELECT * FROM employees WHERE 
(first_name = 'Irena' OR 
first_name = 'Vidya' OR 
first_name = 'Maya') AND 
gender = 'M';
-- (ia) render true AND render true

/* Find all current or previous employees whose last name starts with 'E'. Enter a comment with 
the number of employees whose last name starts with E.*/

SELECT emp_no, first_name, last_name
FROM employees
WHERE last_name 
LIKE ('E%');
-- SELECT *
-- 7330 rows returned

/* Find all current or previous employees whose last name starts or ends with 'E'. Enter a comment 
with the number of employees whose last name starts or ends with E. */

SELECT emp_no, first_name, last_name
FROM employees
WHERE last_name 
LIKE ('E%')
OR last_name LIKE ('%E');
-- SELECT *
-- 30723 employees last name starts or ends with 'E'

-- How many employees have a last name that ends with E, but does not start with E?

SELECT emp_no, first_name, last_name
FROM employees
WHERE last_name 
LIKE ('%E');

-- 24292 employees have a last name that ends with 'E'






