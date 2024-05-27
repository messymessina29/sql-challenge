# sql-challenge
The employee_tables sql file contains all the create table commands I crafted to insert the csv files into. Also contains all the primary and foreign key relationships.
The employee_query_analysis sql file contains my code to merge all the tables together as well as all the analysis code. Each question is labeled as a note.
The employee_sql_erd.png file is an image of the completed ERD of the employees database. Crafted using the ERD tool in pgADMIN.
The above files are all found in the EmployeeSQL directory.

I did use the Xpert Learning assistant multiple times for help on this assignment.
I noticed while doing the analysis that I was running into problems with duplicate data and was having trouble finding out why I was getting duplicates. I only found out when doing the filter for employees named Hector and last name starting with B.
    CREATE VIEW merged_employees AS
    SELECT DISTINCT e.emp_no, e.first_name, e.last_name, e.sex, e.birth_date, e.hire_date, t.title_id, t.title, d.dept_no, d.dept_name, s.salary
    FROM employees e
    JOIN titles t ON e.emp_title_id = t.title_id
    JOIN dept_emp de ON e.emp_no = de.emp_no
    JOIN departments d ON de.dept_no = d.dept_no
    JOIN salaries s ON e.emp_no = s.emp_no;
The AI assitant told me to add DISTINCT in front of the columns I want selected to only select unique values. While this worked for the Hector question, I dont think it fully resolved all duplicate values in the whole merged database.
Another instance I used the AI assistant was for the second question asking me to filter rows for only the hire year being 1986. I was unsure how to do this and the assistant told me to use EXTRACT to pull the year out which worked perfectly. See below: 
    SELECT first_name, last_name, hire_date 
    FROM merged_employees 
    WHERE EXTRACT(YEAR FROM hire_date) = 1986;