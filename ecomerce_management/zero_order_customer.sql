-- Write the query to find all customers who have not placed any orders.
-- Headers expected in output: | CustomerID  | FirstName | LastName |

select c.CustomerID,c.FirstName,c.LastName
from customers c left join orders o on c.CustomerID=o.CustomerID 
where o.OrderID is null;