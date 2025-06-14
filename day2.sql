-- window functions
-- DENSE_RANK,RANK,ROW
use w3schools;
select ProductID,ProductName, ROW_NUMBER() over (
partition by CategoryID ORDER BY Price DESC) AS S_NO
from products;

select ProductID,ProductName, RANK() over (
 ORDER BY Price DESC) AS S_NO
from products;

-- lag() it lets you access you the data of previous row without self join
-- 
select Price,ProductName, LEAD(SUpplierID) over (
 partition by CategoryID ) AS S_NO
from products;

select Price,ProductName, sum(Price) over (
 partition by CategoryID ) AS Price
from products;

SELECT Price,ProductName, NTILE(10) 
over (
 ORder by price ) AS Price
from products;

SELECT 
  ProductName,
  Price,
  CASE 
    WHEN Price < 50 THEN 'Low'
    WHEN Price BETWEEN 50 AND 100 THEN 'Moderate'
    ELSE 'HIgh'
  END AS price_category
FROM products;
alter table Products add column XML_INFO longtext;
alter table Products add column JSON_FILE json;


SELECT 
  ProductName,
  JSON_FILE->'$.Specs.val' AS brand
FROM Products
WHERE ProductID = 1;

select CategoryID from products;
-- update Products SET XML_INFO = ("<name>dummy</name>")
-- <specs>
-- <size></size>
-- <colour></colour>
-- where ProductID=1;
-- <specs>

-- Categorize Product Price Ranges
-- Task: Display all products along with a price category:
-- 'Cheap' if price < 20
-- 'Moderate' if price between 20 and 50
-- 'Expensive' if price > 50
-- Expected Output Columns:
-- ProductID, ProductName, Price, PriceCategory
-- 1)
SELECT 
  ProductID,
  ProductName,
  Price,
  CASE 
    WHEN Price < 20 THEN 'Cheap'
    WHEN Price BETWEEN 20 AND 50 THEN 'Moderate'
    ELSE 'Expensive'
  END AS price_category
FROM products;

-- Employee Age Group Based on BirthDate
-- Task: Create an age group column for employees:
-- 'Young' if age < 30
-- 'Mid-Age' if age between 30 and 50
-- 'Senior' if age > 50
-- Expected Output Columns:
-- EmployeeID, FirstName, LastName, Age, AgeGroup 



SELECT 
  EmployeeID,
  FirstName,
  LastName,
  DATE_FORMAT(FROM_DAYS(DATEDIFF(CURDATE(), BirthDate)), '%Y') + 0 AS age,
  CASE 
    WHEN DATE_FORMAT(FROM_DAYS(DATEDIFF(CURDATE(), BirthDate)), '%Y') + 0 < 30 THEN 'Young'
    WHEN DATE_FORMAT(FROM_DAYS(DATEDIFF(CURDATE(), BirthDate)), '%Y') + 0 BETWEEN 30 AND 50 THEN 'Mid-Age'
    ELSE "Senior"
  END AS AgeGroup
FROM employees;

-- dynamic sql
-- 

set @tabalename="Products";
set @columnName= "FirstName";

set @sql = concat('select',"@columnName",'from','tablename');
prepare stmt from @sql;
execute stmt;
deallocate prepare stmt;

-- query caching
-- coalesce -no null values are stored return first non values in the coloumn
-- collation-database is tored in differecnt languages


