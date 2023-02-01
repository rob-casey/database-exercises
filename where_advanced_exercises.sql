
-- Use employees database.

USE employees;
SHOW CREATE TABLE employees;
/* 'CREATE TABLE `employees` (
  `emp_no` int NOT NULL,
  `birth_date` date NOT NULL,
  `first_name` varchar(14) NOT NULL,
  `last_name` varchar(16) NOT NULL,
  `gender` enum(''M'',''F'') NOT NULL,
  `hire_date` date NOT NULL,
  PRIMARY KEY (`emp_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1'
*/

-- (1) Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya' using IN. 
--     What is the employee number of the top result?

SELECT * FROM employees WHERE 
first_name IN('Irena', 'Vidya', 'Maya');
-- 10200 is the employee number at the top


-- (2) Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya', as in Q2, 
--     but use OR instead of IN. 
--     What is the employee number of the top result? 
--     Does it match the previous question?

SELECT * FROM employees WHERE 
first_name = 'Irena' OR 
first_name = 'Vidya' OR 
first_name = 'Maya';
-- 10200 is the employee number at the top. It matched the previous question.

-- (3) Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya', using OR, 
--     and who is male. 
--     What is the employee number of the first three results?

SELECT * FROM employees WHERE
(first_name = 'Irena' OR
first_name = 'Vidya' OR
first_name = 'Maya') AND
gender = 'M'
LIMIT 3; -- 10200, 10397, 10821

-- (4) Find all current or previous employees whose last name starts with 'E'. Enter a comment with the 
--     number of employees whose last name starts with E.

SELECT * FROM employees WHERE
last_name LIKE 'E%' AND  
gender = 'M'; 
-- 7330 employees whose last name starts with E, 
-- regardless of M or F since gender was not explicitly requested.

-- (5a) Find all current or previous employees whose last name starts or ends with 'E'. 
--      Enter a comment with the number of employees whose last name starts or ends with E. 

SELECT * FROM employees WHERE
last_name LIKE 'E%' OR
last_name LIKE '%e';
-- 30723 employees have a last name that either starts with 'E' or ends with 'e'.

-- (5b) How many employees have a last name that ends with E, but does not start with E?

SELECT first_name, last_name FROM employees WHERE
last_name LIKE '%e' AND
last_name NOT LIKE 'E%';
-- 23393 employees have a last name that ends with 'e', but does not start with 'E'.

-- (6a) Find all current or previous employees employees whose last name starts and ends with 'E'. 
--      Enter a comment with the number of employees whose last name starts and ends with E.

SELECT * FROM employees WHERE
last_name LIKE 'E%e';
-- 899 employees have a last name that starts with 'E' and ends with 'e.'

-- (6b) How many employees' last names end with E, regardless of whether they start with E?

SELECT first_name, last_name FROM employees WHERE 
last_name LIKE '%e';
-- 24292 employees last names end with 'E', regardless of whether they start with E.

-- (7) Find all current or previous employees hired in the 90s. 
--     Enter a comment with the number of employees returned.

SELECT * FROM employees WHERE
hire_date LIKE '199%';
-- 135214 employees were hired in the 90s.

-- (8) Find all current or previous employees born on Christmas. 
--     Enter a comment with the number of employees returned.

SELECT * FROM employees WHERE
birth_date LIKE '%-12-25';
-- 842 employees were born on Christmas. 

-- (9) Find all current or previous employees hired in the 90s and born on Christmas. 
--     Enter a comment with the number of employees returned.

SELECT * FROM employees WHERE
birth_date LIKE '%12-25' AND hire_date LIKE '199%';
-- 362 employees were born on Christmas and hired in the 90s.

-- (10) Find all current or previous employees with a 'q' in their last name. 
--      Enter a comment with the number of records returned.

SELECT * FROM employees WHERE
last_name LIKE '%q%';
-- 1873 employees, whether previous or current, have a 'q' in their last name.

-- (11) Find all current or previous employees with a 'q' in their last name but not 'qu'. 
--      How many employees are found?

SELECT * FROM employees WHERE
last_name LIKE '%q%' AND
last_name NOT LIKE '%qu%';
-- 547 employees, whether current or previous, have a 'q' in their last name but not 'qu'.
