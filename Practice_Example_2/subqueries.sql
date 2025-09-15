-- Find books priced higher than the average book price.
SELECT book_id,title, price
from books
WHERE price > (
  SELECT avg(price) from books)


-- Get the author who has generated the highest total sales revenue.
SELECT an.author_id, an.author_name, SUM(s.quantity * b.price) AS total_revenue
FROM authors an
JOIN Books b ON an.author_id = b.author_id
JOIN Sales s ON b.book_id = s.book_id
GROUP BY an.author_id, an.name
ORDER BY total_revenue DESC
LIMIT 1;



-- Find the most expensive book(s).
SELECT book_id,title,price
from books
WHERE price = (
  SELECT max(price) from books)


-- Find authors who don’t have any books in the Sales table (no sales).
SELECT an.author_name
from authors an
JOIN books b on an.author_id=b.book_id
JOIN sales s on b.book_id= s.book_id
WHERE s.sale_id is NULL

