-- WHERE, LIMIT, and other clauses
-- LIMIT
-- using fruits database
USE fruits_db;
SHOW TABLES;
SELECT * FROM fruits;
SELECT * FROM fruits LIMIT 5;
-- This tells mysql to only give you the first 5 rows of information
USE employees;
SELECT * FROM employees LIMIT 10;
-- I DID NOT change my database here. still living within employees db at this point
-- BUT! I've used dot notation to point out a more absolute path
SELECT * FROM fruits_db.fruits;
-- to actually move there:
USE fruits_db;
-- note that there is a table called employees within the database employees
SELECT * FROM employees.employees LIMIT 5;
SELECT * FROM fruits;
-- WHERE:
SELECT * FROM fruits WHERE name = 'cantelope';
/*In this case, i HAVE SELECTED EVERY FIRLED INSIDE THE table, and only the specific instance where the
field called "name" matched the string literal 'cantelope'*/
SELECT quantity FROM fruits WHERE name = 'apple';
-- WHEN looking at the text/string values, we can use LIKE
SELECT * FROM fruits;
SELECT * FROM fruits WHERE name LIKE '%fruit';
-- You can use the like function to return all values which contain the word 'fruit'
/* If we wanted to find an instance where the word not only ends in the word fruit, but perhaps is anywhere in the field, 
what do we do?*/
SELECT * FROM fruits WHERE name LIKE '%fruit%';
-- That allows any word where 'fruit' exists to populate
-- To find only words that end in fruit, use 'fruit%'
-- How to find fruits that are only apples and dragonfruits?:
SELECT * FROM fruits WHERE name IN('apple', 'dragonfruit');
-- what if we want to include all instances of 'apple' like in pineapple?:
SELECT * FROM fruits WHERE name IN('apple', 'dragonfruit')
OR name LIKE '%apple%';
SELECT * FROM fruits WHERE quantity !=5;
-- 
-- note inclusivity of range. also note null does not = 0
SELECT * FROM fruits WHERE name IS NOT NULL;