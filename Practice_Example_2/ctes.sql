-- Use a CTE to calculate author-wise average price, then list books priced above their author’s average.
with authoravg as(
  SELECT author_id,avg(price) as avg_price
  from books
  GROUP by author_id)
SELECT b.title,b.price, av.avg_price
from books b
JOIN authoravg av on b.author_id=av.author_id
where b.price > av.avg_price


-- Write a recursive CTE to simulate books published year by year, starting from the earliest year
WITH RECURSIVE Years AS (
  SELECT MIN(published_year) AS yr FROM Books
  UNION ALL
  SELECT yr + 1 FROM Years WHERE yr < (SELECT MAX(published_year) FROM Books)
)
SELECT * FROM Years

