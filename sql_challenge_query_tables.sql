--question 1: List the following details of each employee: employee number, last name, first name, gender, and salary.

SELECT 
    e.emp_no,
    e.last_name,
    e.first_name,
    e.gender,
    s.salary
    FROM employees AS e JOIN salaries AS s
    ON e.emp_no = s.emp_no
    ORDER BY s.salary DESC;

--question 2: List employees who were hired in 1986.

SELECT 
    e.emp_no,
    e.last_name,
    e.first_name,
    e.hire_date
    FROM employees AS e
    WHERE date_part('year', hire_date) = 1986
    ORDER BY e.hire_date ASC;

--https://stackoverflow.com/questions/36203613/how-to-extract-year-from-date-in-postgresql

--question 3: List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.

SELECT
    d.dept_no,
    d.dept_name,
    dm.emp_no,
    e.last_name,
    e.first_name,
    dm.from_date,
    dm.to_date
    FROM departments AS d
        INNER JOIN dept_manager AS dm ON d.dept_no = dm.dept_no
        INNER JOIN employees AS e ON dm.emp_no = e.emp_no
    ORDER BY d.dept_name ASC;

--question 4: List the department of each employee with the following information: employee number, last name, first name, and department name.

SELECT
    e.emp_no,
    e.last_name,
    e.first_name,
    d.dept_name
    FROM employees AS e
        INNER JOIN dept_emp AS de ON e.emp_no = de.emp_no
        INNER JOIN departments AS d ON de.dept_no = d.dept_no
    ORDER BY e.last_name ASC, e.first_name ASC;

--question 5: List all employees whose first name is "Hercules" and last names begin with "B."

SELECT
    e.last_name, e.first_name
    FROM employees AS e
    WHERE e.first_name = 'Hercules' AND e.last_name LIKE 'B%';

--question 6: List all employees in the Sales department, including their employee number, last name, first name, and department name.

SELECT
    e.emp_no,
    e.last_name,
    e.first_name,
    d.dept_name
    FROM employees AS e
        INNER JOIN dept_emp AS de ON e.emp_no = de.emp_no
        INNER JOIN departments AS d ON de.dept_no = d.dept_no
    WHERE d.dept_name LIKE 'Sales'
    ORDER BY e.last_name ASC;

--question 7: List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT
    e.emp_no,
    e.last_name,
    e.first_name,
    d.dept_name
    FROM employees AS e
        INNER JOIN dept_emp AS de ON e.emp_no = de.emp_no
        INNER JOIN departments AS d ON de.dept_no = d.dept_no
    WHERE d.dept_name LIKE 'Sales' OR d.dept_name LIKE 'Development'
    ORDER BY e.last_name ASC;

--question 8: In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

SELECT
    e.last_name, count(e.last_name) FROM employees AS e
    GROUP BY e.last_name
    ORDER BY count DESC;