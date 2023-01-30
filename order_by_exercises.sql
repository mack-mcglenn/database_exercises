/* Create a new file named order_by_exercises.sql and copy in the contents of your exercise from the previous lesson. */

USE employees;

-- Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya' using IN. 
SELECT (first_name) FROM employees WHERE first_name IN ('Irena','Vidya', 'Maya');
-- Enter a comment with the number of records returned. 
-- A: 709
/*Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by first name. 
In your comments, answer: What was the first and last name in the first row of the 
results?
A: First and last name in the first row of results is Irene Reutenauer
What was the first and last name of the last person in the table? 
A: First and last name on the last row is Vidya Adweh*/
SELECT * FROM employees WHERE (first_name = 'Irena', 'Vidya', 'Maya') 
ORDER BY first_name;

/*Find all employees with first names 'Irena', 'Vidya', or 'Maya',
 and order your results returned by first name and then last name.
 In your comments, answer: 
 What was the first and last name in the first row of the results? 
 A: Irene Acton*/
 sELECT first_name, last_name FROM employees WHERE first_name IN ('Vidya', 'Maya', 'Irena')
ORDER BY first_name, last_name LIMIT 1;
 /*What was the first and last name of the last person in the table?
 A:Vidya Zweizig */
SELECT first_name, last_name FROM employees WHERE first_name IN ('Vidya', 'Maya', 'Irena')
ORDER BY first_name DESC, last_name DESC LIMIT 1;
/*Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by 
last name and then first name. */
 sELECT first_name, last_name FROM employees WHERE (first_name = 'Irena') OR 
(first_name = 'Vidya') OR 
(first_name ='Maya') ORDER BY last_name, first_name;
/*In your comments, answer: 
What was the first and last name in the first row of the results? 
A: Irene Acton*/
SELECT first_name, last_name FROM employees WHERE (first_name = 'Irena') OR 
(first_name = 'Vidya') OR 
(first_name ='Maya') ORDER BY last_name, first_name LIMIT 1;
/*What was the first and last name of the last person in the table?
A: Maya Zyda*/
SELECT first_name, last_name FROM employees WHERE (first_name = 'Irena') OR 
(first_name = 'Vidya') OR 
(first_name ='Maya') ORDER BY last_name DESC, first_name LIMIT 1;

/*Write a query to to find all employees whose last name starts and ends with 'E'. 
Sort the results by their employee number. 
Enter a comment with the number of employees returned
A: 899
the first employee number and their first and last name
A: 10021, Ramzi Erde
and the last employee number with their first and last name
A:499648, Tahadiro Erde*/
SELECT *FROM employees 
WHERE last_name LIKE 'E%e' ORDER BY emp_no;

/*Write a query to to find all employees whose last name starts and ends with 'E'. Sort the results by their hire 
date, so that the newest employees are listed first. 
Enter a comment with the number of employees returned*/
SELECT * FROM employees WHERE last_name
 LIKE 'E%e';
/*the name of the newest employee
A: Teiji Eldridge*/
SELECT * FROM employees WHERE last_name
 LIKE 'E%e' ORDER BY hire_date DESC, birth_date;
/*and the name of the oldest employee
A: Sergei Erde*/
SELECT * FROM employees WHERE last_name
 LIKE 'E%e' ORDER BY hire_date, birth_date;

/* Find all employees hired in the 90s and born on Christmas. Sort the results so that the oldest employee who was 
hired last is the first result. Enter a comment with the number of employees returned
A: 362*/
SELECT * FROM employees
WHERE hire_date LIKE '199%'
AND birth_date LIKE '%12-25'
ORDER BY birth_date, hire_date;
 /*the name of the oldest employee who was hired last
A: Khun Bernini*/
SELECT * FROM employees
WHERE hire_date LIKE '199%'
AND birth_date LIKE '%12-25'
ORDER BY birth_date, hire_date DESC;
/*And the name of the youngest employee who was hired first
A: Douadi Pettis */
SELECT * FROM employees
WHERE hire_date LIKE '199%'
AND birth_date LIKE '%12-25'
ORDER BY birth_date DESC, hire_date;



/*Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya', as in Q2, 
but use OR instead of IN. */
SELECT * FROM employees WHERE first_name = 'Irena' OR 
first_name = 'Vidya' OR 
first_name ='Maya';

-- Enter a comment with the number of records returned. 
-- A: 709
SELECT COUNT(first_name) FROM employees WHERE 
first_name = 'Irena' OR
first_name = 'Vidya' OR 
first_name = 'Maya';

-- Does it match number of rows from Q2? 
-- A: Yes

-- Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya', using OR, and who is male.
SELECT * FROM employees WHERE gender = 'M' 
AND (first_name = 'Irena' OR
first_name = 'Vidya' OR 
first_name ='Maya');

 -- Enter a comment with the number of records returned. 
 -- A: 441
 SELECT COUNT(first_name) FROM employees WHERE gender = 'M' 
AND (first_name = 'Irena' OR
first_name = 'Vidya' OR 
first_name ='Maya');

-- Find all current or previous employees whose last name starts with 'E'.
SELECT * FROM employees WHERE last_name LIKE 'E%';

-- Enter a comment with the number of employees whose last name starts with E.
--  A: 7330

-- Find all current or previous employees whose last name starts or ends with 'E'. 
SELECT * FROM employees WHERE last_name LIKE 'E%' 
OR last_name LIKE '%e';

-- Enter a comment with the number of employees whose last name starts or ends with E. 
-- A: 30723

-- How many employees have a last name that ends with E, but does not start with E? 
SELECT * FROM employees WHERE last_name LIKE '%E' AND  last_name NOT LIKE 'E%';
-- A: 23393

-- Find all current or previous employees employees whose last name starts and ends with 'E'.

SELECT * FROM employees WHERE last_name LIKE 'E%e';
-- Enter a comment with the number of employees whose last name starts and ends with E. 
-- A: 899

-- How many employees' last names end with E, regardless of whether they start with E?
-- A: 24292
SELECT * FROM employees WHERE last_name LIKE '%E';

-- Find all current or previous employees hired in the 90s. Enter a comment with the number of employees returned.
-- A: 135,214 */
SELECT * FROM employees 
WHERE hire_date LIKE '199%';

-- Find all current or previous employees born on Christmas. Enter a comment with the number of employees returned.
-- A: 842
SELECT * FROM employees
WHERE birth_date LIKE '%12-25';

-- Find all current or previous employees hired in the 90s and born on Christmas. Enter a comment with the number of employees returned.
-- A: 362
SELECT * FROM employees 
WHERE (hire_date LIKE '199%') AND
 (birth_date LIKE '%12-25');
 
-- Find all current or previous employees with a 'q' in their last name but not 'qu'. How many employees are found?
-- A: 547
SELECT first_name, last_name
FROM employees
WHERE (last_name LIKE '%Q%')
AND NOT (last_name LIKE '%qu%');
