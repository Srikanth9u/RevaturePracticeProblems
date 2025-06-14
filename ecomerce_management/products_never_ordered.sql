-- Write the query to find all products that have never been included in any order.
-- Headers expected in output: | ProductID | ProductName |
select p.ProductID,p.ProductName from products p left join OrderDetails od on p.ProductID=od.ProductID where od.ProductID is null;