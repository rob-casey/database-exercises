
-- Use Chipotle database/schema
USE chipotle;
SHOW tables;

-- Grab a preview of the only table here
SELECT * FROM orders LIMIT 10;
DESCRIBE orders;
-- Value comparisons will not work with varchar data types

SELECT item_name FROM orders LIMIT 5;

-- Grab True values for any instance in item_names
-- where that specific instance is a chicken item

SELECT item_name FROM orders WHERE item_name LIKE '%chicken%'; -- Historical logic statement to filter

-- Now we want to call for a different application of logic
-- IF acts like a function call, use parens

SELECT item_name,IF 
	  (item_name LIKE '%chicken%', 1, 0) as chicken_type
FROM orders 
LIMIT 25;

-- IF(<truth condition>, <value if case is true>, <value if case is false>)

-- Change the output of that IF statement:
SELECT item_name, IF(
item_name LIKE '%steak%', 'moo', 'oink')
FROM orders;


SELECT item_name, 
IF
(
item_name LIKE '%steak%', 
IF(
item_name LIKE '%bowl%', 'moo bowl', 'oink bowl'),
'oink'
)
FROM orders;

-- Working from inside out, similar to a subquery.
-- If it didnt have steak in it at all, we are just going to go
-- directly to not_steak and not mess with the nested condition

-- Use a case statement if we want to throw in some extra conditions
-- Case statements are like IF statements, but they are
-- structured a little different
-- CASE statements allow for multiple logic checks in a row

-- STRUCTURE of a CASE statement
-- Lets build out our first case:

SELECT item_name, quantity,
CASE item_name
	WHEN 'chicken bowl' THEN 1
    ELSE 0
END as chicken_bowls
FROM orders;

SELECT item_name, quantity,
CASE item_name
	WHEN 'chicken bowl' THEN 'bowl'
    WHEN 'chicken burrito' THEN 'burrito'
    ELSE 'not chicken that I care about'
END as chicken_bowls
FROM orders
LIMIT 20;

-- Limitations ^
-- Can only check for direct equivalence!

-- Short hand version

-- More verbose version

-- SELECT item_name,
-- CASE item_name
-- WHEN LIKE '%chicken%' THEN 'chickeny' <- SQL doesnt like WHEN LIKE
-- ELSE 'not chicken'
-- END as chicken_type_beat
-- FROM orders;

SELECT item_name,
CASE 
WHEN item_name LIKE '%chicken%' or '%steak%;' THEN 'good meat'
WHEN item_name LIKE '%carnita%' THEN 'bad meat'
WHEN item_name LIKE '%barbacoa%' then 'good bad meat'
ELSE 'not meat'
END as 'meat check'
FROM orders; 


USE join_example_db;
SELECT * FROM users;

SELECT role_id,
CASE WHEN role_id > 2 THEN 'high roller'
	WHEN role_id >= 1 THEN 'some role'
    WHEN  role_id is NULL then 'no role'
END as 'nada'
FROM users;

SELECT *, IF(role_ID = 3, 1, 0) as Role_3 FROM users;

-- Else is optional, End is neccesary. Hot encoding?.
-- Encoded Truth Values
-- Can add group value, dept_name
-- Can add count to each case statement -> generates new value

-- Can chain truth statements after AND in Join statements
-- Pivot Table - Excel :)
