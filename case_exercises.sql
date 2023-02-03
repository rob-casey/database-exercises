USE employees;

-- (1) Write a query that returns 
--     all employees, 
--     their department number, 
--     their start date, their end date, 
--     and a new column 'is_current_employee' that is a 1 
--     if the employee is still with the company and 0 if not.

DESCRIBE employees;
-- emp_no
-- first_name
-- last_name
DESCRIBE dept_emp;
-- emp_no
-- dept_no
-- from_date
-- to_date

SELECT emp_no as 'Employee',
from_date as 'Start Date', 
to_date as 'End date',
dept_no as 'Dept Number',
IF((to_date > NOW()), 1, 0) as is_current_employee
FROM employees
JOIN dept_emp USING (emp_no)
LIMIT 10;

-- (2) Write a query that returns all employee names (previous and current), 
--     and a new column 'alpha_group' that returns 'A-H', 'I-Q', or 'R-Z' 
--     depending on the first letter of their last name.

DESCRIBE employees;
-- first_name
-- last_name

SELECT last_name, 
IF(SUBSTR(last_name, 1, 1) between 'A' and 'H','A-H', 
IF(SUBSTR(last_name, 1, 1) between 'I' and 'Q','I-Q', 
IF(SUBSTR(last_name, 1, 1) between 'R' and 'Z','R-Z', 'WHY TF NOT'))) as Alpha_Group
FROM employees
ORDER BY last_name
LIMIT 100;

-- (3) How many employees (current or previous) were born in each decade?

DESCRIBE employees;
-- emp_no
-- birth_date

SELECT
COUNT(CASE SUBSTR(birth_date, 3, 1) WHEN 5 THEN 1 ELSE NULL END) as 'Fifties', 
COUNT(CASE SUBSTR(birth_date, 3, 1) WHEN 6 THEN 1 ELSE NULL END) as 'Sixties', 
COUNT(CASE SUBSTR(birth_date, 3, 1) WHEN 7 THEN 1 ELSE NULL END) as 'Seventies', 
COUNT(CASE SUBSTR(birth_date, 3, 1) WHEN 8 THEN 1 ELSE NULL END) as 'Eighties' 
FROM employees;