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
LIMIT 100;


SELECT birth_date, 
IF(SUBSTR(birth_date, 3, 1) between '6' and '7','A-H', 
IF(SUBSTR(birth_date, 3, 1) between '7' and '8','I-Q', 
IF(SUBSTR(birth_date, 3, 1) between '8' and '8','R-Z', 'WHY TF NOT'))) as Alpha_Group
FROM employees
LIMIT 100;


-- (3) How many employees (current or previous) were born in each decade?

DESCRIBE employees;
-- emp_no
-- birth_date

SELECT
IF(birth_date LIKE '195%', 1, 0) as Fifties, 
IF(birth_date LIKE '196%', 1, 0) as Sixties,
IF(birth_date LIKE '197%', 1, 0) as Seventies,
IF(birth_date LIKE '198%', 1, 0) as Eighties
FROM employees
GROUP BY birth_date;



SELECT *,
CASE birth_date WHEN 
SUBSTR(birth_date, 3, 4) LIKE '195%' 
and SUBSTR(birth_date, 3, 4) < '196%' THEN 1 ELSE 0 END as '50s',
FROM employees
LIMIT 100;

SELECT *, 
IF(birth_date LIKE '195%', 1, 0) as '50s',
IF(birth_date LIKE '196%', 1, 0) as '60s',
IF(birth_date LIKE '197%', 1, 0) as '60s',
IF(birth_date LIKE '198%', 1, 0) as '70s'
FROM employees
LIMIT 100;


SELECT *,
CASE birth_date WHEN birth_date LIKE '195%' THEN 1 ELSE 0 END as '50s',
CASE birth_date WHEN birth_date LIKE '196%' THEN 1 ELSE 0 END as '60s',
CASE birth_date WHEN birth_date LIKE '197%' THEN 1 ELSE 0 END as '70s',
CASE birth_date WHEN birth_date LIKE '198%' THEN 1 ELSE 0 END as '80s'
FROM employees
LIMIT 100;