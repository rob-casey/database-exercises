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

SELECT last_name, -- Try this in CASE / WHEN later
IF(SUBSTR(last_name, 1, 1) between 'A' and 'H','A-H', 
IF(SUBSTR(last_name, 1, 1) between 'I' and 'Q','I-Q', 
IF(SUBSTR(last_name, 1, 1) between 'R' and 'Z','R-Z', 'WHY TF NOT'))) as Alpha_Group
FROM employees
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


-- (4) What is the current average salary for each of the following department groups: 
-- R&D, Sales & Marketing, Prod & QM, Finance & HR, Customer Service?

-- current to_date
-- avg(salary)
-- department no
-- department name (5)
-- employees

DESCRIBE departments;
/*
'd001','Marketing'
'd002','Finance'
'd003','Human Resources'
'd004','Production'
'd005','Development'
'd006','Quality Management'
'd007','Sales'
'd008','Research'
'd009','Customer Service'
*/


-- d008 Research & d005 Development
-- d007 Sales & d001 Marketing
-- d004 Production & d006 Quality Management
-- d002 Finance & d003 Human Resources
-- d009 Customer Service


SELECT 
	CASE WHEN d.dept_no IN ('d008', 'd005') THEN 'R&D'
		 WHEN d.dept_no IN ('d007', 'd001') THEN 'Sales & Marketing'
		 WHEN d.dept_no IN ('d004', 'd006') THEN 'Prod & QM'
         WHEN d.dept_no IN ('d002', 'd003') THEN 'Finance & HR'
         WHEN d.dept_no IN ('d009') THEN 'Customer Service'
    END AS dept_group, ROUND(AVG(salary), 2) as Salary
FROM departments d
JOIN dept_emp de USING (dept_no)
JOIN salaries s USING (emp_no)
WHERE s.to_date > NOW() AND
      de.to_date > NOW()
GROUP BY dept_group
ORDER BY salary DESC;

