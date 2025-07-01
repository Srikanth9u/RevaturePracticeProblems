SELECT DISTINCT b.building_name FROM buildings AS b JOIN employees AS e ON b.building_name = e.building;
SELECT  b.building_name,b.capacity FROM buildings AS b left JOIN employees AS e ON b.building_name = e.building group by building_name order by capacity;
SELECT   Distinct e.role,b.building_name FROM buildings AS b left JOIN employees AS e ON b.building_name = e.building;
