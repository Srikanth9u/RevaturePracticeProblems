SELECT  m.Title,(b.Domestic_sales+b.international_sales)/1000000 as millions_of_dollars  FROM movies m inner join boxoffice b on m.id=b.movie_id;
SELECT  m.Title,rating*10  FROM movies m inner join boxoffice b on m.id=b.movie_id;
SELECT  m.Title  FROM movies m inner join boxoffice b on m.id=b.movie_id where m.year%2==0;
