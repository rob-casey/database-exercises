-- (1) Open MySQL Workbench and login to the database server
-- (2) Save your work in a file named db_tables_exercises.sql
-- (3) List all the databases

SELECT DISTINCT(table_schema)
FROM information_schema.tables
WHERE table_type = 'BASE TABLE'
ORDER BY table_schema ASC;

-- (4) Write the SQL code necessary to use the albums_db database

USE albums_db;

-- (5) Show the currently selected database

SELECT database();

-- (6) List all tables in the database

SHOW tables;

-- (7) Write the SQL code to switch the employees database

USE employees;

-- (8) Show the currently selected database

SELECT database();

-- (9) List all the tables in the database

SHOW tables;

-- (10a) Explore the employees table. 

DESCRIBE employees;

/* (10b) What different data types are present on this table?
Int
Date
VARCHAR()
enum('M','F')
DATE */

-- For Questions 11, 12, 13
DESCRIBE employees.departments;
DESCRIBE employees.dept_emp;
DESCRIBE employees.dept_manager;
DESCRIBE employees.employees;
DESCRIBE employees.salaries;
DESCRIBE employees.titles;

/* (11) Which table(s) do you think contain a numeric type column? 
departments
dept_emp
dept_manager
employees
titles
*/

/* (12) Which table(s) do you think contain a string type column?
Any table containing a first_name or last_name column
departments
dept_emp
dept_manager
employees
titles
*/

/* (13) Which table(s) do you think contain a date type column?
departments
dept_emp
dept_manager
employees
salaries
titles 
*/

/* (14) What is the relationship between the employees and the departments tables? 
There are no fields/columns that could be used as foreign keys explicitly between these two tables
*/

-- (15) Show the SQL that created the dept_manager table. 

SHOW CREATE TABLE dept_manager;

/* CREATE TABLE `dept_manager` (
  `emp_no` int NOT NULL,
  `dept_no` char(4) NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL,
  PRIMARY KEY (`emp_no`,`dept_no`),
  KEY `dept_no` (`dept_no`),
  CONSTRAINT `dept_manager_ibfk_1` FOREIGN KEY (`emp_no`) REFERENCES `employees` (`emp_no`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `dept_manager_ibfk_2` FOREIGN KEY (`dept_no`) REFERENCES `departments` (`dept_no`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=latin1
*/
