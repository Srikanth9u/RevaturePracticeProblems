-- Write the query to calculate the total revenue generated each month
-- The results should be grouped and ordered by `OrderMonth`
-- Headers expected in output: | OrderMonth | TotalRevenue |


select 
STRFTIME('%Y-%m',o.Orderdate) AS OrderMonth,
sum(od.Quantity * od.UnitPrice) as TotalRevenue 
from Orders o inner join OrderDetails od 
on o.OrderID=od.OrderID 
group by OrderMonth 
order by OrderMonth;