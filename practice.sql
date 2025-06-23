create database store;
use employees;

CREATE TABLE employees (
    emp_id INT,
    name VARCHAR(50),
    department VARCHAR(50),
    salary INT
);

INSERT INTO employees (emp_id, name, department, salary) VALUES
(1, 'Alice', 'HR', 50000),
(2, 'Bob', 'IT', 70000),
(3, 'Charlie', 'IT', 90000),
(4, 'David', 'HR', 60000),
(5, 'Eve', 'Finance', 85000),
(6, 'Frank', 'Finance', 85000);

--employees with higher salary higher than their avearage salary--

SELECT name, salary,(SELECT AVG(salary) FROM employees) AS avg_salary FROM employees WHERE salary > (SELECT AVG(salary) FROM employees);



drop table employees;
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    dept_id INT,
    salary DECIMAL(10, 2),
    hire_date DATE
);
INSERT INTO employees (emp_id, emp_name, dept_id, salary, hire_date) VALUES
(1, 'Alice', 10, 60000, '2020-01-15'),
(2, 'Bob', 20, 75000, '2019-03-10'),
(3, 'Charlie', 10, 55000, '2021-06-20'),
(4, 'Dave', 20, 80000, '2018-09-05'),
(5, 'Eve', 30, 50000, '2022-02-10');
CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50),
    location VARCHAR(50)
);
INSERT INTO departments (dept_id, dept_name, location) VALUES
(10, 'HR', 'New York'),
(20, 'IT', 'Boston'),
(30, 'Finance', 'Chicago');
CREATE TABLE projects (
    project_id INT PRIMARY KEY,
    emp_id INT,
    project_name VARCHAR(100),
    start_date DATE,
    FOREIGN KEY (emp_id) REFERENCES employees(emp_id)
);
INSERT INTO projects (project_id, emp_id, project_name, start_date) VALUES
(101, 1, 'Project A', '2023-01-01'),
(102, 2, 'Project B', '2023-02-15'),
(103, 1, 'Project C', '2023-03-10'),
(104, 3, 'Project D', '2023-04-01');

select * from employees;
/*salary greater than the dept avg salary-- */
select emp_name,dept_id,salary,(select avg(e1.salary) from employees e1 join employees e2 on e1.dept_id=e2.dept_id where e1.dept_id=e2.dept_id) as avg_salary from employees where salary
>(
select avg(e1.salary) from employees e1 join employees e2 on e1.emp_id=e2.emp_id where e1.dept_id=e2.dept_id) order by avg_salary;

/*Question 2: Find Employees Who Worked on All Projects in Their Department*/
select e.emp_name,e.emp_id from employees e join departments d on e.dept_id=d.dept_id 
join projects p on p.emp_id=e.emp_id group by e.emp_name,e.emp_id having count(distinct p.project_id)=(select count(p2.project_id) from projects p2 join employees e2 on p2.emp_id=e2.emp_id where 
e2.dept_id=e2.dept_id);



/*Question 3: Find the Highest-Paid Employee in Each Department Who Started After 2020*/
select distinct e1.emp_name,d.dept from employees e1 where e1.hire_date > '2020-12-31'
and e1.salary = (
select MAX(e2.salary) from employees e2 where e2.dept_id = e1.dept_id);
select * from departments;
/*Question 4: Find Departments Where All Employees Earn Above a Certain Threshold*/
select d.dept_name from employees e inner join departments d on e.dept_id=d.dept_id where salary >50000 group by d.dept_name;

use store;
-- Create tables
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    region VARCHAR(50)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50)
);

CREATE TABLE order_details (
    detail_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    unit_price DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Insert data into customers
INSERT INTO customers (customer_id, customer_name, region) VALUES
(101, 'Alice', 'East'),
(102, 'Bob', 'West'),
(103, 'Charlie', 'North'),
(104, 'Dave', 'South');

-- Insert data into orders
INSERT INTO orders (order_id, customer_id, order_date, total_amount) VALUES
(1, 101, '2023-01-10', 500.00),
(2, 102, '2023-02-15', 300.00),
(3, 101, '2023-03-01', 700.00),
(4, 103, '2023-04-20', 450.00),
(5, 102, '2023-05-10', 200.00);

-- Insert data into products
INSERT INTO products (product_id, product_name, category) VALUES
(201, 'Laptop', 'Electronics'),
(202, 'Mouse', 'Accessories'),
(203, 'Headphones', 'Accessories');

-- Insert data into order_details
INSERT INTO order_details (detail_id, order_id, product_id, quantity, unit_price) VALUES
(1, 1, 201, 2, 200.00),
(2, 1, 202, 1, 100.00),
(3, 2, 203, 3, 100.00),
(4, 3, 201, 1, 700.00),
(5, 4, 202, 2, 225.00);

/*Question 1: Find Customers Whose Total Order Amount Exceeds the Average Order Amount in Their Region*/
select c.customer_name from order_details od inner join orders o on od.order_id=o.order_id join customers c on o.customer_id =c.customer_id
 where o.total_amount>(select avg(o1.total_amount) from customers c1 join orders o1 on c1.customer_id=o1.customer_id where c1.region=c.region) group by c.customer_name;

/*Question 2: Find Orders Containing Products from All Categories*/
select od.order_id from order_details od join products p ON od.product_id = p.product_id group by od.order_id having count(distinct p.category) = 
(select count(distinct category) from products
);

/*Question 3: Find the Most Expensive Product Ordered by Each Customer After a Specific Date*/
select p.product_name, od.unit_price,c.customer_name from customers c
inner join orders o on c.customer_id = o.customer_id inner join order_details od on o.order_id = od.order_id
inner join products p on od.product_id = p.product_id
where o.order_date > '2023-02-01' and od.unit_price = (
select MAX(od2.unit_price) from orders o2 inner join order_details od2 on o2.order_id = od2.order_id
where o2.customer_id = c.customer_id and o2.order_date > '2023-02-01') order by od.unit_price DESC;

/*Question 4: Find Regions Where No Customer Ordered a Specific Product */
select distinct c.region from customers c where 
not exists (select 1 from orders o join order_details od on o.order_id=od.order_id 
where c.customer_id=o.customer_id and od.product_id=201);
