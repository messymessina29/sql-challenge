DROP TABLE departments CASCADE
DROP TABLE dept_emp CASCADE
DROP TABLE dept_manager CASCADE
DROP TABLE employees CASCADE
DROP TABLE salaries CASCADE
DROP TABLE titles CASCADE

CREATE TABLE titles(
  title_id VARCHAR(10) PRIMARY KEY,
  title VARCHAR(50)
);	

CREATE TABLE departments(
  dept_no VARCHAR(50) PRIMARY KEY NOT NULL,
  dept_name VARCHAR(200)
);

CREATE TABLE employees(
  emp_no INT PRIMARY KEY NOT NULL,
  emp_title_id VARCHAR(50),
  birth_date DATE,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  sex VARCHAR(5),
  hire_date DATE,
  FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);

CREATE TABLE dept_emp(
  emp_no INT,
  dept_no VARCHAR(50) NOT NULL,
  PRIMARY KEY (emp_no, dept_no),
  FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
  FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

CREATE TABLE salaries(
  emp_no INT,
  salary INT,
  PRIMARY KEY (emp_no), 
  FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

CREATE TABLE dept_manager(
  dept_no VARCHAR(50),
  emp_no INT,
  PRIMARY KEY (dept_no, emp_no),
  FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
  FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);



