USE employees;
SHOW tables;
DESCRIBE employees;
/* 5. Various data types include integers, dates, and strings
6. Which table(s) do you think contain a numeric type column? (Write this question and your answer in a comment)
employees: Emp_no and gender (Boolean as numeric)*/
DESCRIBE salaries;
/*Which table(s) do you think contain a string type column? (Write this question and your answer in a comment)
first_name, last_name, gender
What is the relationship between the employees and the departments tables? (Write this question and your answer in a comment)*/
DESCRIBE employees; -- birth date, last_name, first_name, emp_no, gender, hire_date
DESCRIBE departments; -- dept_no, dept_name
SHOW TABLES;
DESCRIBE dept_manager;
DESCRIBE dept_emp;
Show the SQL that created the dept_manager table. Write the SQL it takes to show this as your exercise solution.*/