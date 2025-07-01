SELECT   Distinct name, role
FROM Employees where building is null;
SELECT b.building_name
FROM buildings AS b
LEFT JOIN employees AS e
  ON b.building_name = e.building
WHERE e.building IS NULL;
