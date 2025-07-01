SELECT  m.Title,b.Domestic_sales,b.international_sales FROM movies m inner join boxoffice b on m.id=b.movie_id;
SELECT  m.Title,b.Domestic_sales,b.international_sales FROM movies m inner join boxoffice b on m.id=b.movie_id where international_sales>Domestic_sales order by international_sales desc ;
SELECT  m.Title,b.rating FROM movies m inner join boxoffice b on m.id=b.movie_id  order by rating desc ;
