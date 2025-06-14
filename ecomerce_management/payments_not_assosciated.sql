-- Write the query to compare orders that have associated payments with orders that do not.
-- Headers expected in output: | OrderID | OrderDate  | PaymentID | PaymentDate | Amount |

SELECT
    O.OrderID,O.OrderDate,P.PaymentID,P.PaymentDate,P.Amount FROM Orders AS O
LEFT JOIN Payments AS P ON O.OrderID = P.OrderID
UNION ALL
SELECT
    O.OrderID,O.OrderDate,P.PaymentID,P.PaymentDate,P.Amount
FROM Orders AS O
RIGHT JOIN Payments AS P ON O.OrderID = P.OrderID WHERE O.OrderID IS NULL;