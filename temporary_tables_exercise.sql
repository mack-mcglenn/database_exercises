/*Using the example from the lesson, create a temporary table called employees_with_departments 
that contains first_name, last_name, and dept_name for employees currently with that department. 
Be absolutely sure to create this table on your own database.  */
select database();
use employees;
create temporary table oneil_2106.employees_with_departments as select first_name, last_name, emp_no, 
dept_no, dept_name from employees.employees join dept_emp using (emp_no) join employees.departments using (dept_no) limit 100;
describe oneil_2106.employees_with_departments;
use oneil_2106;
/* Add a column named full_name to this table. 
It should be a VARCHAR whose length is the sum of the lengths of the first name and last name columns.*/
select * from employees_with_departments;
alter table employees_with_departments add full_name varchar(35);

# Update the table so that the full_name column contains the correct data.
update employees_with_departments set full_name = concat(first_name, ' ', last_name);

# Remove the first_name and last_name columns from the table.
alter table employees_with_dependents drop column first_name;
alter table employees_with_dependents drop column last_name;

# What is another way you could have ended up with this same table?
/*I could have created Full_Name as concat(first_name, ' ', last_name) when I initially created my new table instead of adding first_name
and last_name as separate values*/

#Create a temporary table based on the payment table from the sakila database.
select database();
use sakila;
describe sakila;
drop table if exists payments;
create temporary table oneil_2106.sakila_payment as select * from sakila.payment; 
select * from payment;
describe payment;

/* Write the SQL necessary to transform the amount column such that it is stored as an integer representing the number of cents of the payment.
 For example, 1.99 should become 199.*/
alter table payment add amount100 int not null;
update table payment set amount100 = amount * 100;
alter table payment drop column amount;

/*Find out how the current average pay in each department compares to the overall current pay for
 everyone at the company. For this comparison, you will calculate the z-score for each 
salary. In terms of salary, what is the best department right now to work for? The worst? */

#A: Average salary = $72,012. Standard deviation = $17,310
use oneil_2106;

select round(avg(salary)) as AvgSalary, round(std(salary)) as StdDevn from employees.salaries where to_date > now();
drop table if exists Department_Averages;
create temporary table ovaggs as select round(avg(salary)) as AvgSalary, round(std(salary)) as StdDevn from 
employees.salaries where to_date > now();
select * from ovaggs;

create temporary table Department_Averages as select dept_name , round(avg(salary)) from employees
join departments using (dept_no) join dept_emp using (emp_no) 
join salaries using (emp_no)
 where salaries.to_date > now() and dept_emp.to_date > now
 group by dept_name;