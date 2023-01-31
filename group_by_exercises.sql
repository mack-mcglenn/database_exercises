-- 1. Create a new file named group_by_exercises.sql
-- 2. In your script, use DISTINCT to find the unique titles in the titles table. 
use employees;
select * from employees;
describe titles;
select title from titles;
select distinct title from titles;
-- How many unique titles have there ever been? Answer that in a comment in your SQL file.
-- A: 7 unique titles
select count(distinct title) from titles;
/* Write a query to to find a list of all unique last names of all employees
 that start and end with 'E' using GROUP BY.*/
 select last_name from employees where last_name like 'E%e'
 group by last_name; 
 /* Write a query to to find all unique combinations of first and last names of all 
 employees whose last names start and end with 'E'. */
 select distinct first_name, last_name from employees
 where last_name like 'E%e'group by first_name, last_name;
 /* Write a query to find the unique last names with a 'q' but not 'qu'. 
 Include those names in a comment in your sql code. */
 -- A: Chleq, Lindqvist, Qiwen
 select distinct last_name from employees where last_name like '%q%'
 and last_name not like '%qu%';
 /* Add a COUNT() to your results (the query above) to find the number of employees with the same last name.*/
 -- A: 3
 select count(distinct last_name) from employees where last_name like '%q%' and last_name not like '%qu%';
 /* Find all all employees with first names 'Irena', 'Vidya', or 'Maya'. */
 SELECT * FROM employees where ( first_name = 'Irena') 
 or (first_name = 'Maya') or (first_name = 'Vidya') ;
 /* Use COUNT(*) and GROUP BY to find the number of employees for each gender with those names.*/
 -- A: M-441, F-268
 SELECT count(*), gender FROM employees where ( first_name = 'Irena') 
 or (first_name = 'Maya') or (first_name = 'Vidya') group by gender;
 /* Using your query that generates a username for all of the employees, generate 
 a count employees for each unique username. */
 select lower(concat(substr(first_name, 1, 1), 
substr(last_name, 1, 4),'_', 
substr(birth_date, 6, 2),
substr(birth_date, 3,2 ))) as Username, 
count(*) as multicount from employees group by Username
having (multicount > 1) order by multicount;
/*From your previous query, are there any duplicate usernames?
A: yes, there are a lot of duplicate usernames
 What is the higest number of times a username shows up?
 A: the highest number of repeated usernames is six, and there are four usernames which repeat six times
Bonus: How many duplicate usernames are there from your previous query?*/
select lower(concat(substr(first_name, 1, 1), 
substr(last_name, 1, 4),'_', 
substr(birth_date, 6, 2),
substr(birth_date, 3,2 ))) as Username, 
count(*) as multicount from employees group by Username
having (multicount >= 2) order by multicount desc;
/* Determine the historic average salary for each employee. When you hear, read, 
or think "for each" with regard to SQL, you'll probably be grouping by that exact column.*/
describe salaries;
select from_date, to_date from salaries