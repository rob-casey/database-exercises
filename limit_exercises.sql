USE employees;

SELECT DISTINCT last_name
FROM employees
ORDER BY last_name DESC
LIMIT 10;

SELECT * FROM employees
WHERE hire_date LIKE '199%' 
AND birth_date LIKE '%12-25'
ORDER BY hire_date LIMIT 5;

-- Write a comment in your code that lists the five names of the employees returned.
/* Answer
Alselm Cappello
Utz Mandell
Bouchung Schreiter
Baocai Kushner
Petter Stroustrup
*/

SELECT * FROM employees
WHERE hire_date LIKE '199%' 
AND birth_date LIKE '%12-25'
ORDER BY hire_date 
LIMIT 5 OFFSET 45;

-- What is the relationship between OFFSET (number of results to skip),
-- LIMIT (number of results per page), and the page number?
/* Answer
With specific regard to the relationship between OFFSET and LIMIT, 
LIMIT can be considered an interval, or denominator, where OFFSET
is used as the numerator when determining a page count. 

Limit 5, with an Offset of 45, 45/5 = 9, 5-row pages. Consequently, 
the 10th page will consist of rows 46, 47, 48, 49 and 50. 50/5 = 10.

I hope.. :)
