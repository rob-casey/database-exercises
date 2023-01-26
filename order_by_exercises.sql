USE employees;

SELECT * FROM employees 
WHERE (first_name = 'Irena') 
OR  (first_name = 'Vidya') 
OR (first_name = 'Maya')
ORDER BY first_name;

-- What was the first and last name in the first row of the results? Irena Reutenauer
-- What was the first and last name of the last person in the table? Vidya Simmen

SELECT * FROM employees 
WHERE (first_name = 'Irena') 
OR  (first_name = 'Vidya') 
OR (first_name = 'Maya')
ORDER BY first_name, last_name;

-- What was the first and last name in the first row of the results? Irena Acton
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
ORDER BY emp_no;

-- Enter a comment with the number of employees returned: 899 rows returned
-- the first employee number and their first and last name: 10021, Ramzi Erde
-- and the last employee number with their first and last name: 499648, Tadihiro Erde

SELECT * FROM employees
WHERE last_name LIKE 'E%e'
ORDER BY hire_date;

-- Enter a comment with the number of employees returned: 899 rows returned
-- the name of the newest employee: Teiji Eldridge
-- and the name of the oldest employeeL: Serge Erde

SELECT * FROM employees
WHERE hire_date LIKE '199%' 
AND birth_date LIKE '%12-25'
ORDER BY hire_date DESC;

-- Enter a comment with the number of employees returned: 362 rows returned
-- the name of the oldest employee who was hired last: Khun Bernini
-- and the name of the youngest employee who was hired first: Alselm Cappello




