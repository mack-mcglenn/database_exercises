-- Create a file named where_exercises.sql. Make sure to use the employees database.
-- Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya' using IN. 
SELECT COUNT(first_name) FROM employees WHERE first_name IN ('Irena', 'Vidya', 'Maya');
-- Enter a comment with the number of records returned. A: 709
/*Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya', as in Q2, 
but use OR instead of IN. */
SELECT * FROM employees WHERE first_name = 'Irena' OR 'Vidya' OR 'Maya';
-- Enter a comment with the number of records returned. 
SELECT COUNT(first_name) FROM employees WHERE first_name = 'Irena' OR 'Vidya' OR 'Maya';
-- Does it match number of rows from Q2? A: No, it's less (241)
-- Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya', using OR, and who is male.
SELECT * FROM employees WHERE gender = 'M' 
AND first_name = 'Irena' OR 'Vidya' OR 'Maya';
 -- Enter a comment with the number of records returned. A: 144
 SELECT COUNT(first_name) FROM employees WHERE gender = 'M' 
AND first_name = 'Irena' OR 'Vidya' OR 'Maya';
-- Find all current or previous employees whose last name starts with 'E'.
Ç;
-- Enter a comment with the number of employees whose last name starts with E. A: 6273
SELECT COUNT(first_name) FROM employees WHERE first_name LIKE 'E%';
-- Find all current or previous employees whose last name starts or ends with 'E'. 
SELECT COUNT(first_name) FROM employees WHERE first_name LIKE 'E%' OR '%E';
-- Enter a comment with the number of employees whose last name starts or ends with E. A: 6273
-- How many employees have a last name that ends with E, but does not start with E? A: 24336
SELECT COUNT(first_name) FROM employees WHERE first_name LIKE '%E' AND NOT 'E%';
-- Find all current or previous employees employees whose last name starts and ends with 'E'.
Find all current or previous employees employees whose last name starts and ends with 'E'. 
 Enter a comment with the number of employees whose last name starts and ends with E. 
How many employees' last names end with E, regardless of whether they start with E?

