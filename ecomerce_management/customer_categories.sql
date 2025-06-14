-- Write the query to find customers who have purchased products from more than one category
-- Headers expected in output: | CustomerID |
SELECT DISTINCT C.CustomerID
FROM Customers C
JOIN Orders O ON C.CustomerID = O.CustomerID
JOIN OrderDetails OD ON O.OrderID = OD.OrderID
JOIN Products P ON OD.ProductID = P.ProductID
WHERE P.CategoryID = 1
INTERSECT
SELECT DISTINCT C.CustomerID
FROM Customers C
JOIN Orders O ON C.CustomerID = O.CustomerID
JOIN OrderDetails OD ON O.OrderID = OD.OrderID
JOIN Products P ON OD.ProductID = P.ProductID
WHERE P.CategoryID = 2;