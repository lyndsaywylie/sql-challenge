CREATE TABLE departments(
	dept_no VARCHAR Primary Key,
	dept_name VARCHAR(30));
	
CREATE TABLE dept_emp(
	emp_no INT,
	dept_no VARCHAR(30));
--Print to make sure data is there
SELECT * FROM dept_emp;

--Create dept_manager table
CREATE TABLE dept_manager(
	dept_no VARCHAR(10),
	emp_no INT PRIMARY KEY);
--Print
SELECT * FROM dept_manager;
--Create employees table
CREATE TABLE employees(
	emp_no INT PRIMARY KEY,
	emp_title VARCHAR(10),
	birth_date VARCHAR(10),
	first_name VARCHAR (30),
	last_name VARCHAR (30),
	sex VARCHAR (1),
	hire_date VARCHAR(10));
--Print 
SELECT * FROM employees;
--Create salaries table
CREATE TABLE salaries(
	emp_no INT PRIMARY KEY,
	salary INT);
--Print
SELECT * FROM salaries;
--Create titles table
CREATE TABLE titles(
	title_id VARCHAR PRIMARY KEY,
	title VARCHAR (30));
--Print
SELECT * FROM departments;
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;
SELECT * FROM employees;
SELECT * FROM salaries;
SELECT * FROM titles;
