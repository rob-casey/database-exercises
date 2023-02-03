-- (1) Using the example from the lesson, create a temporary table called 
--     employees_with_departments that contains 
--     first_name, last_name, and dept_name 
--     for employees currently with that department. 
--     Be absolutely sure to create this table on your own database. 
--     If you see "Access denied for user ...", 
--     it means that the query was attempting to write a new table to 
--     a database that you can only read.

USE employees;

CREATE temporary table oneil_2095.table_test
(SELECT first_name, last_name, departments.dept_name
	FROM employees
		JOIN dept_emp 
			USING (emp_no)
		JOIN departments 
			USING (dept_no)
	WHERE to_date < NOW()
LIMIT 10);


USE oneil_2095;

SELECT * FROM table_test;
DESCRIBE table_test;


-- Add a column named full_name to this table. It should be a VARCHAR whose length is the sum of the lengths of the first name and last name columns.

ALTER TABLE table_test
ADD full_name varchar(30);

SELECT * FROM table_test;
DESCRIBE table_test;

-- Update the table so that full name column contains the correct data.

-- a simple example where we want the email address to be just the first name
UPDATE table_test
SET full_name = CONCAT(first_name, ' ', last_name);

SELECT * FROM table_test;

-- Remove the first_name and last_name columns from the table.

ALTER TABLE table_test 
DROP COLUMN first_name;

SELECT * FROM table_test;

ALTER TABLE table_test 
DROP COLUMN last_name;

SELECT * FROM table_test;

-- What is another way you could have ended up with this same table?

-- Good question
-- ALTER TABLE table_test
-- 	DROP COLUMN first_name, 
-- 	DROP COLUMN last_name;

-- (2) Create a temporary table based on the payment table from the sakila database.

USE sakila;
SHOW TABLES;
DESCRIBE payment;
-- 'payment_id','smallint unsigned','NO','PRI',NULL,'auto_increment'
-- 'customer_id','smallint unsigned','NO','MUL',NULL,''
-- 'staff_id','tinyint unsigned','NO','MUL',NULL,''
-- 'rental_id','int','YES','MUL',NULL,''
-- 'amount','decimal(5,2)','NO','',NULL,''
-- 'payment_date','datetime','NO','',NULL,''
-- 'last_update','timestamp','NO','','CURRENT_TIMESTAMP','DEFAULT_GENERATED on update CURRENT_TIMESTAMP'
SELECT * FROM payment;

CREATE temporary table oneil_2095.temp_payment as
(SELECT * FROM payment);

--     Write the SQL necessary to transform the amount column such that it is stored 
--     as an integer representing the number of cents of the payment. 
--     For example, 1.99 should become 199.

USE oneil_2095;
SELECT * FROM temp_payment;
SHOW CREATE TABLE temp_payment;
-- CREATE TEMPORARY TABLE 
--   `temp_payment` (
--   `payment_id` smallint unsigned NOT NULL DEFAULT '0',
--   `customer_id` smallint unsigned NOT NULL,
--   `staff_id` tinyint unsigned NOT NULL,
--   `rental_id` int DEFAULT NULL,
--   `amount` decimal(5,2) NOT NULL,
--   `payment_date` datetime NOT NULL,
--   `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci

SELECT amount 
FROM temp_payment
WHERE amount;

-- SET = UPDATE = Updating all of the output
-- ALTER TABLE = MODIFY = Modifying COLUMNS

DESCRIBE temp_payment;

ALTER TABLE temp_payment
MODIFY amount DECIMAL(7,0);

UPDATE temp_payment
SET amount = round(amount * 100);

SELECT amount FROM temp_payment;

DROP TABLE temp_payment;

-- P/D
-- P is the precision that represents the number of significant digits. The range of P is 1 to 65
-- DD is the scale that that represents the number of digits after the 
-- decimal point. The range of D is 0 and 30. MySQL requires that D is less than or equal to (<=) P.

-- (3) Find out how the current average pay in each department compares to the overall current pay 
--     for everyone at the company. For this comparison, you will calculate the z-score for each salary. 
--     In terms of salary, what is the best department right now to work for? The worst?







