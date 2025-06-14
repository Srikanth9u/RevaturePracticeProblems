-- Write the query to retrieve order information along with the products included in each order.
-- Headers expected in output: | OrderID | OrderDate  | FirstName | LastName |  ProductName   | Quantity | UnitPrice |

--orders,customers,Products,OrderDetails 
--customers->orders->OrderDetails->Products

select o.OrderID,o.OrderDate,c.FirstName,c.LastName,p.ProductName,od.Quantity,od.UnitPrice
from customers c inner join orders o on c.CustomerID=o.CustomerID 
inner join OrderDetails od on o.OrderID=od.OrderID 
inner join Products p on od.ProductID =p.ProductID;