SELECT city,population FROM north_american_cities where country="Canada";
SELECT city,latitude FROM north_american_cities where country="United States" order by latitude DESC;
SELECT city, country, latitude, longitude
FROM north_american_cities
WHERE longitude < (
    SELECT longitude FROM north_american_cities WHERE city = 'Chicago'
)
ORDER BY longitude ASC;
SELECT city
FROM north_american_cities where country="Mexico" order by population Desc limit 2;
SELECT city
FROM north_american_cities where country="United States" order by population Desc limit 2 offset 2;
