/*
-----------------------------------------------------------------------------
This SQL script contains queuries to perform Data Analysis on the Employee DB
-----------------------------------------------------------------------------
*/

-- List the following details of each employee: 
-- employee number, last name, first name, gender, and salary.
SELECT emp.emp_no, emp.first_name, emp.last_name, emp.gender, sal.salary
FROM employees AS emp
JOIN salaries AS sal ON emp.emp_no = sal.emp_no
ORDER BY emp_no;

-- List employees who were hired in 1986.
SELECT * FROM employees
WHERE EXTRACT(YEAR FROM employees.hire_date)=1986;

-- List the manager of each department with the following information: 
-- department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
SELECT d.dept_no, d.dept_name, dm.emp_no, emp.first_name, emp.last_name, dm.from_date, dm.to_date
FROM departments AS d
JOIN dept_manager AS dm ON d.dept_no = dm.dept_no
JOIN employees AS emp ON dm.emp_no = emp.emp_no;

-- List the department of each employee with the following information: 
-- employee number, last name, first name, and department name.
SELECT emp.emp_no, emp.first_name, emp.last_name, dept.dept_name
FROM employees AS emp
JOIN dept_emp AS demp ON emp.emp_no = demp.emp_no
JOIN departments AS dept ON demp.dept_no = dept.dept_no
ORDER BY emp_no;

-- List all employees whose first name is "Hercules" and last names begin with "B."


-- List all employees in the Sales department, including their employee number, last name, first name, and department name.


-- List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.


-- In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.