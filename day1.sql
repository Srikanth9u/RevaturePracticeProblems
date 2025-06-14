Create database northWind ;
use northWind;
create database northWind;
use northWind;
create table customrers(customer_id int primary key,
company_name varchar(30),contact_name varchar(40),
contact_title varchar(40),address varchar(50),
city varchar(60),region varchar(50),
postal_code varchar(30),country varchar(30),phone varchar(30),
fax varchar(30));

create table employees(employee_id int primary key,
last_name varchar(40),first_name varchar(34),title varchar(23),
title_of_courtesy varchar(34),birth_date DATE,hire_date DATE,
address varchar(35) ,city varchar(60),region varchar(50),
postal_code varchar(30),country varchar(30),
home_phone varchar(30),extension varchar(34),reports_to int,
foreign key(reports_to) references employees(employee_id));

create table orders(order_id int primary key,
customer_id int,foreign key(customer_id) 
references customrers(customer_id), employee_id  int, 
foreign key(employee_id) references employees(employee_id),
order_date DATE,requried_date DATE,shipped_date DATE,
ship_via int,freight DECIMAL,ship_name varchar(34),
ship_address varchar(34),ship_city varchar(34),ship_region varchar(23),
ship_postal_code varchar(23),ship_country varchar(35));

create table suppliers(supplier_id int primary key,pcompany_name varchar(23),
contact_name varchar(23), contact_title varchar(23),address varchar(35) ,
city varchar(60),region varchar(50),postal_code varchar(30),country varchar(30),
phone varchar(30),fax varchar(34), home_page varchar(55));

create table categories(categories_id int primary key, category_name varchar(45), description varchar(45));

create table products(product_id int primary key,product_name varchar(23),
supplier_id int, foreign key(supplier_id) references suppliers(supplier_id),
categories_id int, foreign key(categories_id) references categories(categories_id),
quantity_per_unit varchar(56),unit_price decimal,unit_in_stock int,
units_on_order int,recorder_level int,discontinued int );


CREATE TABLE order_details (
    order_id INT,
    product_id INT,
    quantity INT,
    discount DECIMAL,
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

show tables;



select product_name,unit_price from products order by unit_price desc limit 5;
select product_name from products where units_in_stock=0;
select customer_id,avg(freight) from orders group by customer_id;
select product_name from products order by unit_price desc limit 1 offset 2;
SELECT title_Of_courtesy, COUNT(*) as total_employees FROM Employees GROUP BY title_Of_courtesy;
select product_name,unit_price,category_id  from products p where unit_price>( 
  select avg(unit_price) from products where category_id=p.category_id);
  
  
SELECT 
    p.product_name,
    SUM(od.quantity) AS TotalQuantitySold
FROM 
    products p
INNER JOIN order_details od ON p.product_id = od.product_id
GROUP BY 
    p.product_name
ORDER BY 
    TotalQuantitySold DESC;
    
select c.customer_id,c.company_name,sum(o.freight) as TotalFreight from customers c inner join orders o on
c.customer_id=o.customer_id group by c.customer_id,c.company_name order by TotalFreight desc limit 5;
