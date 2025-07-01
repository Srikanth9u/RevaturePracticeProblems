SELECT max(years_employed) FROM employees;

SELECT role,avg(years_employed) FROM employees group by Role;
SELECT sum(years_employed) FROM employees group by Building;

-- ex11.sql
SELECT *,count(*) FROM employees where Role="Artist";
SELECT *,count(*) FROM employees group by role;
SELECT sum(years_employed) FROM employees where Role = "Engineer";
-- ex12.sql
SELECT count(*),director FROM movies group by director;
SELECT  m.director,sum(b.Domestic_sales),sum(b.international_sales) FROM movies m inner join boxoffice b on m.id=b.movie_id group by m.director;

--ex12.sql
INSERT INTO movies (title, director, year, length_minutes)
VALUES ('Toy Story 4', 'Josh Cooley', 2019, 100);

INSERT INTO boxoffice
(movie_id, rating, domestic_sales,international_sales)
values (4,8.7,340000000,270000000);

update Movies set Director="John Lasseter" where Title="A Bug's life";
update Movies set year=1999 where Title="Toy Story 2";
update Movies set title="Toy story 3",director="Lee Unkrich" where Title="Toy Story 8";

delete from movies where year<2005;
delete from movies where director="Andrew Stanton";

CREATE TABLE Database (
  Name TEXT,
  Version REAL,
  Download_count INTEGER
);

CREATE TABLE Database (
  Name TEXT,
  Version REAL,
  Download_count INTEGER
);


alter table movies add column Aspect_ratio float;

alter table movies add column Language Text default "English";

drop table boxoffice;
drop table movies;