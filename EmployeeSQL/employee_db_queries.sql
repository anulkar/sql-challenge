/*
-----------------------------------------------------------------------------
This SQL script contains queries to perform Data Analysis on the Employee DB
-----------------------------------------------------------------------------
*/

-- Lists the following details of each employee: employee number, last name, first name, gender, and salary.
SELECT emp.emp_no, emp.first_name, emp.last_name, emp.gender, sal.salary
FROM employees AS emp
JOIN salaries AS sal ON emp.emp_no = sal.emp_no
ORDER BY emp_no;

-- Lists employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM employees
WHERE EXTRACT(YEAR FROM employees.hire_date)=1986;

-- Lists the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
SELECT d.dept_no, d.dept_name, dm.emp_no, emp.first_name, emp.last_name, dm.from_date, dm.to_date
FROM departments AS d
JOIN dept_manager AS dm ON d.dept_no = dm.dept_no
JOIN employees AS emp ON dm.emp_no = emp.emp_no;

-- Lists the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT emp.emp_no, emp.first_name, emp.last_name, dept.dept_name
FROM employees AS emp
JOIN dept_emp AS demp ON emp.emp_no = demp.emp_no
JOIN departments AS dept ON demp.dept_no = dept.dept_no
ORDER BY emp_no;

-- Lists all employees whose first name is "Hercules" and last names begin with "B"
SELECT first_name, last_name
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- Lists all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT emp.emp_no, emp.first_name, emp.last_name, dept.dept_name
FROM employees AS emp
JOIN dept_emp AS demp ON emp.emp_no = demp.emp_no
JOIN departments AS dept ON demp.dept_no = dept.dept_no
WHERE dept.dept_name = 'Sales'
ORDER BY emp.emp_no;

-- Lists all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT emp.emp_no, emp.first_name, emp.last_name, dept.dept_name
FROM employees AS emp
JOIN dept_emp AS demp ON emp.emp_no = demp.emp_no
JOIN departments AS dept ON demp.dept_no = dept.dept_no
WHERE dept.dept_name IN ('Sales','Development')
ORDER BY emp.emp_no;

-- In descending order, lists the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name AS "Employee Last Name", COUNT(last_name) AS "Number of Employees"
FROM employees
GROUP BY last_name
ORDER BY "Number of Employees" DESC;