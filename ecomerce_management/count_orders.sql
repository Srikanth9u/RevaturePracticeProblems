-- Write the query to calculate the number of orders placed by each customer.
-- The results should be grouped by customer details and sorted in descending order of number of orders.
-- Headers expected in output: | CustomerID | FirstName | LastName | NumberOfOrders |
select c.CustomerID,c.FirstName,c.LastName,count(o.OrderID) as NumberOfOrders from
customers c left join orders o on c.CustomerID=o.CustomerID group by c.CustomerID,c.FirstName,c.LastName order by NumberOfOrders desc;