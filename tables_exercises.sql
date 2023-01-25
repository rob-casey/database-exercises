-- Use employees database
USE employees;
-- List all the tables in the database
SHOW tables;
-- Explore employees database
SELECT * FROM employees;
-- Which table(s) do you think contain a numeric type column?  Employees, Salaries, All if Primary Key is considered a Numeric Type Column.
-- Which table(s) do you think contain a string type column? Dept_Manager, Employees, Dept_Emp, Departments
-- Which table(s) do you think contain a date type column? dept_emp
SELECT * FROM salaries;
SELECT * FROM departments;
SELECT * FROM dept_emp;
-- What is the relationship between the employees and the departments tables? They both have a respective field aggregated in a separate table, dept_emp.
SELECT * FROM dept_manager;
-- Write the SQL it takes to show this as your exercise solution.
/* CREATE TABLE 'dept_manager' (
'emp_no' int(6) unsigned DEFAULT NULL AUTO_INCREMENT, 
'dept_no' varchar(4) DEFAULT NULL,
'from_date' varchar(10) DEFAULT NULL,
'to_date' varchar(10) DEFAULT NULL,
PRIMARY KEY ('id')
) */
SHOW CREATE TABLE dept_manager;
