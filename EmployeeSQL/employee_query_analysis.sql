DROP VIEW merged_employees
--Data Analysis #1
CREATE VIEW merged_employees AS
SELECT DISTINCT e.emp_no, e.first_name, e.last_name, e.sex, e.birth_date, e.hire_date, t.title_id, t.title, d.dept_no, d.dept_name, s.salary
FROM employees e
JOIN titles t ON e.emp_title_id = t.title_id
JOIN dept_emp de ON e.emp_no = de.emp_no
JOIN departments d ON de.dept_no = d.dept_no
JOIN salaries s ON e.emp_no = s.emp_no;

select * from merged_employees

--Data Analysis #2
SELECT first_name, last_name, hire_date 
FROM merged_employees 
WHERE EXTRACT(YEAR FROM hire_date) = 1986;

--Data Analysis #3
SELECT me.emp_no, me.first_name, me.last_name, me.dept_no, me.dept_name
FROM merged_employees me
JOIN dept_manager dm on me.emp_no = dm.emp_no

--Data Analysis #4
SELECT me.emp_no, me.first_name, me.last_name, me.dept_no, me.dept_name
FROM merged_employees me

--Data Analysis #5
SELECT DISTINCT first_name, last_name, sex
FROM merged_employees 
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%'

--Data Analysis #6
SELECT DISTINCT dept_no, emp_no, first_name, last_name
FROM merged_employees 
WHERE dept_no = 'd007'

--Data Analysis #7
SELECT DISTINCT dept_no, emp_no, first_name, last_name
FROM merged_employees 
WHERE dept_no = 'd007' 
OR dept_no = 'd005' 

--Data Analysis #8
SELECT DISTINCT last_name, COUNT(last_name) AS "Shared Last Name Count"
from merged_employees
GROUP BY last_name
ORDER BY "Shared Last Name Count" DESC;

select * from merged_employees
where last_name = 'Mandell'
