  -- List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT e.emp_no,
e.last_name,
e.first_name,
e.sex,
s.salary
FROM employees e
JOIN salaries s
ON e.emp_no = s.emp_no;

-- List first name, last name, and hire date for employees who were hired in 1986.
SELECT e.first_name,
e.last_name,
e.hire_date
FROM employees e
WHERE e.hire_date between '1986-1-1' and '1986-12-31'
ORDER BY e.hire_date;

--List the manager of each department with the following information: department number, 
--department name, the manager’s employee number, last name, first name.
SELECT d.dept_no,
d.dept_name,
dm.emp_no,
e.last_name,
e.first_name
FROM departments d
JOIN dept_manager dm
ON d.dept_no = dm.dept_no 
JOIN employees e
ON dm.emp_no = e.emp_no;

--List the department of each employee with the following information: employee number, last name, 
--first name, and department name.
SELECT e.emp_no,
e.last_name,
e.first_name,
d.dept_name
FROM employees e
JOIN dept_emp de
ON e.emp_no = de.emp_no
JOIN departments d 
ON de.dept_no = d.dept_no;

--List first name, last name, and sex for employees whose first name is “Hercules” and last names begin with “B.”
SELECT e.first_name,
e.last_name,
e.sex
FROM employees e
WHERE first_name = 'Hercules'
AND last_name like 'B%';

--List all employees in the Sales department, including their employee number, last name, first name, 
--and department name.
SELECT e.emp_no, 
e.last_name,
e.first_name,
d.dept_name
FROM employees e
JOIN dept_emp de
ON (e.emp_no = de.emp_no)
JOIN departments d 
ON (de.dept_no = d.dept_no)
WHERE d.dept_name = 'Sales';

--List all employees in the Sales and Development departments, including their employee number, last name, 
--first name, and department name.
SELECT e.emp_no, 
e.last_name,
e.first_name,
d.dept_name
FROM employees e
JOIN dept_emp de
ON (e.emp_no = de.emp_no)
JOIN departments d 
ON (de.dept_no = d.dept_no)
WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development';

--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT e.last_name,
COUNT (e.emp_no)
FROM employees e
GROUP BY e.last_name
ORDER BY COUNT (e.emp_no);