-- Write the query to identify products that are less than 16 in quantity.
-- Make use of the `EXCEPT` clause
-- Headers expected in output: | ProductID | ProductName |
select ProductID,ProductName from products
EXCEPT
select ProductID,ProductName from products
where StockQuantity >=16;
