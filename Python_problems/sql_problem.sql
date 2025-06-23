SELECT e.*
FROM employees e
JOIN (
    SELECT dept_id, AVG(salary) AS avg_salary
    FROM employees
    GROUP BY dept_id
) d_avg ON e.dept_id = d_avg.dept_id
WHERE e.salary > d_avg.avg_salary;


SELECT e.emp_id, e.emp_name
FROM employees e
WHERE NOT EXISTS (
    SELECT p.project_id
    FROM projects p
    JOIN employees e2 ON p.emp_id = e2.emp_id
    WHERE e2.dept_id = e.dept_id
    EXCEPT
    SELECT p2.project_id
    FROM projects p2
    WHERE p2.emp_id = e.emp_id
);


SELECT *
FROM employees e
WHERE hire_date > '2020-01-01'
  AND salary = (
      SELECT MAX(salary)
      FROM employees
      WHERE dept_id = e.dept_id AND hire_date > '2020-01-01'
  );
SELECT d.*
FROM departments d
WHERE NOT EXISTS (
    SELECT 1
    FROM employees e
    WHERE e.dept_id = d.dept_id AND e.salary <= 50000
);
