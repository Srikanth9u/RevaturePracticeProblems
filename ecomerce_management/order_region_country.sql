-- Write the query to retrieve a combined list of customers from different regions - USA, UK, France, along with an additional data indicating whether the customer's region has been specified (i.e., if Region is NULL, replace it with 'Not Specified'). 
--  Sort the result by country and then by last name in ascending order."
-- Headers expected in output: | CustomerID | FirstName | LastName |City | Region | Country |

SELECT 
    CustomerID,
    FirstName,
    LastName,
    City,
    CASE 
        WHEN Region IS NULL THEN 'Not Specified'
        ELSE Region
    END AS Region,
    Country
FROM customers
ORDER BY Country, LastName;
-- This query retrieves a combined list of customers from different regions (USA, UK, France) and replaces NULL values in the Region column with 'Not Specified'.
-- The result is sorted by Country and then by LastName in ascending order.
