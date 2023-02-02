use employees;
/* Using the example in the Associative Table Joins section as a guide,
 write a query that shows each department along with the name of the current manager for that department.*/
 /*from departments d join dept_emp as de on de.emp_no = e.emp_no
 join departments as d on d.dept_no = de.dept_no
 join dep_manager dm on d.dept_no = dm.dept_no*/
/*select concat (first_name, ' ', last_name) as Full_Name, dept_name as Dept_Name 
/*from departments as Departments join dept_manager as Dept_Man 
using (dept_no) as Dept_No
join employees as Employees;*/
/*from  departments as Dept join dept_manager as Dept_Man
 using (dept_no); */
/* SELECT CONCAT(emps.first_name, ' ', emps.last_name) AS Full_Name, dep.dept_name as Dept_Name
FROM employees AS emps
JOIN dept_emp AS depem
  ON depem.emp_no = emps.emp_no
JOIN departments AS dep
  ON dep.dept_no = depem.dept_no
join dept_manager as depman
  on dep.dept_no = depman.dept_no
WHERE depem.to_date > now()
group by Full_Name, Dept_name
order by dept_name limit 10;*/
select CONCAT(emps.first_name, ' ', emps.last_name) AS Full_Name, 
deps.dept_name as Dept_Name
FROM departments AS deps
JOIN dept_manager AS depman
  using (dept_no)
join employees as emps
  using (emp_no)
WHERE to_date > now()
order by dept_name;
-- Find the name of all departments currently managed by women.
select CONCAT(emps.first_name, ' ', emps.last_name) AS Full_Name, 
deps.dept_name as Dept_Name
FROM departments AS deps
JOIN dept_manager AS depman
  using (dept_no)
join employees as emps
  using (emp_no)
WHERE to_date > now()
and gender = 'F'
order by dept_name;
-- Find the current titles of employees currently working in the Customer Service department.
select title as Title, count(8) from titles;