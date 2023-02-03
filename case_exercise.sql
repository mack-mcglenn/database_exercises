/*Write a query that returns all employees, their department number, their start date, 
their end date, and a new column 'is_current_employee' that is a 1 if the employee is still
 with the company and 0 if not.*/
use employees;    
select distinct emp_no as Employee_Number, concat(first_name, ' ', last_name) as Full_Name,
dept_no as Department_Number, hire_date as Start_Date, dept_emp.To_Date,
case 
when dept_emp.to_date > now() then 0 else 1
END as 'Is Current Employee' from employees join dept_emp using (emp_no)
 order by 'Is Current Employee'; 
 
/* Write a query that returns all employee names (previous and current), and a new column 
'alpha_group' that returns 'A-H', 'I-Q', or 'R-Z' depending on the first letter of their last name. */
-- My code:
select first_name as First, last_name as Last, 
case
when last_name between 'A' and 'H' THEN 'A-H'
when last_name Between 'I' and 'Q' then 'I-Q'
when last_name BETWEEN 'R' and 'Z' then 'R-Z'
else 'null'
end as 'Alpha_Group' from employees order by Alpha_Group;

-- OR Madeline's alternative:
select first_name, last_name,
case when left(last_name, 1) <= 'Z' then 'R-Z'
when substr(last_name, 1, 1) <= 'Q' then 'I-Q'
END AS 'Alpha_Group' from employees order by Alpha_Group;


-- How many employees (current or previous) were born in each decade?
-- A: 50s- 182,886. 60s- 117,138
select distinct
case

 when year(birth_date) between 1940 and 1949 then '1940s'
 when year(birth_date) between 1950 and 1959 then '1950s'
 when year(birth_date) between 1960 and 1969 then '1960s'
 when year(birth_date) between 1970 and 1979 then '1970s'
 when year(birth_date) between 1980 and 1989 then '1980s'
 when year(birth_date) between 1990 and 1999 then '1990s'
else '2000s' 
end as Decade, count(emp_no) as Total from employees group by Decade;

-- Alternative solution:
select distinct case when birth_date like '195%' then '50s'
			when birth_date like '196%' then '60s'
			when birth_date like '197%' then '70s'
            when birth_date like '198%' then '80s'
else '2000s' 
end as Decade, count(emp_no) as Total from employees
group by Decade;
select concat(substr(birth_date, 1, 3), '0') as decade, count(*)
from employees group by decade;

/* What is the current average salary for each of the following department groups:
 R&D, Sales & Marketing, Prod & QM, Finance & HR, Customer Service?*/
select dept_name , avg(salary) from dept_emp
join departments using (dept_no) join salaries using(emp_no) group by Department;
select distinct case
when dept_name in ('Research', 'Development') then 'R&D' 
when dept_name in ('Sales', 'Marketing') then 'Sales & Marketing' 
when dept_name in ('Production', 'Quality Management') then 'Prod & QM' 
when dept_name  in ('Finance', 'Human Resources') then 'Finance & HR'
when dept_name in ('Customer Service') then 'Customer Service'
else dept_name
end as Department_Title, round(avg(salary), 2) as Average_Salary
from departments join dept_emp using (dept_no) join salaries using(emp_no) where salaries.to_date > now() 
and dept_emp.to_date > now() group by Department_Title;

