-- Data Analysis
--1. List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT Employees.emp_no, Employees.last_name, Employees.first_name, Employees.sex, Salaries.salary
FROM Employees
INNER JOIN Salaries on
Employees.emp_no = Salaries.emp_no;

--2. List first name, last name, and hire date for employees who were hired in 1986.
SELECT emp_no, first_name, last_name, hire_date from Employees
WHERE hire_date BETWEEN '1985-12-31' AND '1987-01-01';

--3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT Department_Manager.dept_no,
			Departments.dept_name,
			Department_Manager.emp_no,
			Employees.last_name,
			Employees.first_name
FROM Department_Manager
INNER JOIN Departments on
Department_Manager.dept_no = Departments.dept_no
INNER JOIN Employees ON
Department_Manager.emp_no = Employees.emp_no;

--4. List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT Employees.emp_no,
		Employees.last_name,
		Employees.first_name,
		Departments.dept_name
FROM Employees
INNER JOIN Department_Manager ON
Employees.emp_no = Department_Manager.emp_no
INNER JOIN Departments ON
Department_Manager.dept_no = Departments.dept_no;

--5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name, sex from Employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT Employees.emp_no,
		Employees.last_name,
		Employees.first_name,
		Departments.dept_name
FROM Employees
JOIN Department_Employees ON
Employees.emp_no = Department_Employees.emp_no
INNER JOIN Departments ON
Department_Employees.dept_no = Departments.dept_no
Where dept_name = 'Sales';

--7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT Employees.emp_no,
		Employees.last_name,
		Employees.first_name,
		Departments.dept_name
FROM Employees
JOIN Department_Employees ON
Employees.emp_no = Department_Employees.emp_no
INNER JOIN Departments ON
Department_Employees.dept_no = Departments.dept_no
Where dept_name = 'Sales' OR
		dept_name = 'Development';

--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, COUNT(last_name) from Employees
GROUP BY last_name
ORDER BY COUNT(last_name) desc;
