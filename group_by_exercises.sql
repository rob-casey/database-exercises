USE employees;
SELECT * from titles;

-- In your script, use DISTINCT 
-- to find the unique titles in the titles table. 

select distinct title from titles;

-- How many unique titles have there ever been? 
-- Answer that in a comment in your SQL file.
-- 7

-- Write a query to to find a list of all unique last 
-- names of all employees that start and end with 'E' using GROUP BY

select last_name from employees
where last_name like 'e%e' group by last_name;

-- Write a query to to find all unique combinations of first and last names 
-- of all employees whose last names start and end with 'E'.

select distinct(concat(first_name, last_name))
from employees where last_name like 'E%e';

-- Write a query to find the unique last names with a 'q' but not 'qu'. 
-- Include those names in a comment in your sql code.

select distinct last_name from employees
where last_name like '%q%' AND last_name not like '%qu%';

-- Chleq, Lindqvist, Qiwen

-- Add a COUNT() to your results (the query above) to find the number of 
-- employees with the same last name.

select COUNT(distinct(last_name)) from employees
where last_name like '%q%' AND last_name not like '%qu%';

-- Find all all employees with first names 'Irena', 'Vidya', or 'Maya'. 
-- Use COUNT(*) and GROUP BY to find the number of employees for each gender with those names.

select first_name, gender, COUNT(*)
from employees 
where (first_name = 'Irena') 
or (first_name = 'Vidya') 
or (first_name = 'Maya') 
group by first_name, gender
order by first_name;

-- Try using IN later

-- Using your query that generates a username for all of the employees, 
-- generate a count employees for each unique username.

SELECT DISTINCT(LOWER(CONCAT(
		SUBSTR(first_name, 1, 1), 
        SUBSTR(last_name, 1, 4), 
		'_', 
        SUBSTR(birth_date, 6, 2), 
        SUBSTR(birth_date, 3, 2)))) AS Username, COUNT(*) as Total FROM employees
        GROUP BY Username ORDER BY total;
        
-- From your previous query, are there any duplicate usernames? Yes
-- What is the higest number of times a username shows up? 6



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


-- cannot add the aggregate function to distinct but you can with group by

-- BONUS: Determine the historic average salary for each employee. 
-- When you hear, read, or think "for each" with regard to SQL, you'll probably be grouping by that exact column.

select emp_no, salary from salaries;

SELECT emp_no, avg(salary) as ave_pay
FROM salaries GROUP BY emp_no;

-- Using the dept_emp table, count how many current employees work in each department. 
-- Count how many current employees work in each department. 
-- The query result should show 9 rows, one for each department and the employee count

SELECT * FROM dept_emp;

SELECT dept_no as Department, COUNT(emp_no) as Employees
FROM dept_emp
GROUP BY dept_no;

-- Determine how many different salaries each employee has had. This includes both historic and current.

SELECT * FROM salaries;

select emp_no as Employee, COUNT(salary) as Num_Sal
from salaries
group by emp_no;

-- Find the maximum salary for each employee.

select emp_no as Employee, max(salary) as Max
from salaries
group by emp_no;

-- Find the minimum salary for each employee.

select emp_no as Employee, min(salary) as Min
from salaries
group by emp_no;

select emp_no as Employee, min(salary) as Min, max(salary) as Max
from salaries
group by emp_no;

-- Find the standard deviation of salaries for each employee.

select emp_no as Employee, stddev(salary) as Salary_Dev
from salaries
group by emp_no;

-- Now find the max salary for each employee where that max salary is greater than $150,000

select emp_no as Employee, max(salary) as Max
from salaries 
group by emp_no
having Max >= 150000;

-- Find the average salary for each employee where that average salary is between $80k and $90k.

select emp_no as Employee, avg(salary) as Ave_Income
from salaries
group by emp_no
having Ave_Income between 80000 and 90000;




