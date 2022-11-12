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

--1.List the employee number, last name, 
--first name, sex, and salary of each employee.

SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees AS e
JOIN salaries AS s
ON e.emp_no = s.emp_no;

--2. List the first name, last name & hire date for the 
--employees who were hired in 1986

SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date LIKE '%1986';

--3. List the manager of each dept along with their
--dept number, dept name, employee number, last name
--and first name

SELECT d.dept_no, dm.emp_no,  e.first_name, e.last_name, d.dept_name
FROM departments AS d
JOIN dept_manager AS dm
ON d.dept_no = dm.dept_no
JOIN employees AS e
ON dm.emp_no = e.emp_no;

--4. List the dept number for each employee along with 
--that employee's employee number, last name first name
--& department name.

SELECT d.dept_no, d.dept_name, d_e.emp_no, e.first_name, e.last_name
FROM departments AS d
JOIN dept_emp AS d_e
ON d.dept_no = d_e.dept_no
JOIN employees As e
ON d_e.dept_no = e.emp_no;

--5. List first name, last name & sex of each 
--employee whose first name is Hercules & whose 
--last name begins with the letter B

SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

--6. List each employee number in the Sales department, 
--including their employee number, last name & first name.

SELECT e.emp_no, e.first_name, e.last_name
FROM employees AS e
JOIN dept_emp AS de
ON e.emp_no = de.emp_no
WHERE de.dept_no = 'd007';

--7. List  each employee in the Sales Dept & development
--departments, including their employee number, last name, 
--first name & department name.

SELECT e.emp_no, e.first_name, e.last_name, d.dept_name
FROM employees AS e
JOIN dept_emp AS de
ON e.emp_no = de.emp_no
JOIN departments AS d
ON de.dept_no = d.dept_no
WHERE de.dept_no = 'd007' OR de.dept_no = 'd005';

--8. List the frequency counts, in descending order,
--of all the employee last names (that is, how many
--employees share each last name).

SELECT last_name, COUNT(last_name) AS "Last Name"
FROM employees
GROUP BY last_name
ORDER BY "Last Name" DESC;

--BONUS
SELECT e.emp_no, e.emp_title, s.salary, t.title
FROM salaries AS s
JOIN employees AS e
ON s.emp_no = e.emp_no
JOIN titles AS t
ON e.emp_no = t.title_id

