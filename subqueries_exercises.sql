-- Find all the current employees with the same hire date as employee 101010 using a subquery
select * from employees where hire_date = 
(select hire_date from employees where
emp_no = 101010);

-- Find all the titles ever held by all current employees with the first name Aamod.
-- My way:
select title from titles  join employees using (emp_no) where first_name in 
(select first_name from employees where first_name = 'Aamod')
group by title;
-- OR Misty's way:
select emp_no from employees where first_name = 'Aamod' /*(subquery)*/;
select title from dept_emp join titles using (emp_no)
where dept_emp.to_date > now()
and emp_no in (select emp_no from employees where first_name = 'Aamod') group by title;

-- How many people in the employees table are no longer working for the company? 
-- Give the  answer in a comment in your code.
-- A: 59,900
select count(emp_no) from employees where emp_no not in
(select (emp_no) from salaries where to_date > now());
-- Find all the current department managers that are female. List their names in a comment in your code.
-- A: Hillary Kambil, Isamu Legleitner, Karsten Sigstam, Leon DasSarma
/*select concat(first_name, last_name) as Full_Name from employees where 
(select * from dept_managers where to_date > now() and gender = 'F'); */
select first_name as First_Name, last_name as Last_Name, emp_no as Employee_Number from employees where emp_no in 
(select emp_no from dept_manager where to_date > now() and gender = 'F')
order by first_name, last_name;

-- Find all the employees who currently have a higher salary than the companies overall, historical average salary
select concat(first_name, ' ', last_name) as Full_Name, Salary 
from employees join salaries using (emp_no) where salary >
(select avg(salaries.salary) from salaries) and salaries.to_date > now()
order by salary;
-- select avg(salary) from salaries;

-- How many current salaries are within 1 standard deviation of the current highest salary? 
-- A: 78
/*(Hint: you can use a built in function to calculate the standard deviation.) What percentage of all salaries is this?*/
/*select count(*) from salaries where to_date > now() and salary >
((select max(salary) from salaries where to_date > now()) -
(select stddev(salary) from salaries
where to_date > now())) / (select count(*) from salaries where to_date > now());*/
select count(*) from salaries where salary > (select max(salary) from salaries
where to_date > now()) - (select stddev(salary) from salaries 
where to_date > now()));
from salaries) and to_date > now();
 / (select count(*) from salaries where to_date > now());
 -- max salary
 select count(*)
from salaries
where to_date > now()
and salary > 
	(
	( -- max salary
    select max(salary)
	from salaries
	where to_date > now()
    )
    -
    ( -- one standard deviation 
    select stddev(salary)
	from salaries
	where to_date > now()
    )
    )