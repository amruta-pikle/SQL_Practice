-- Assign a row number to books ordered by price descending.
SELECT title, price,
	ROW_NUMBER() over (ORDER by price desc) as row_num
from books

-- Expected Output
| title          | price | row\_num |
| -------------- | ----- | -------- |
| Sapiens        | 700   | 1        |
| Homo Deus      | 650   | 2        |
| Harry Potter 2 | 550   | 3        |
| test           | 500   | 4        |
| Harry Potter 1 | 500   | 5        |
| 1984           | 350   | 6        |
| Animal Farm    | 200   | 7        |



-- Rank books by price (compare RANK() vs DENSE_RANK()).
SELECT title,
	rank() over (order by price) as normal_rank,
    DENSE_RANK() over (ORDER by price) as den_rank
from books

-- Expected Output
| title          | normal\_rank | den\_rank |
| -------------- | ------------ | --------- |
| Sapiens        | 1            | 1         |
| Homo Deus      | 2            | 2         |
| Harry Potter 2 | 3            | 3         |
| test           | 4            | 4         |
| Harry Potter 1 | 4            | 4         |
| 1984           | 6            | 5         |
| Animal Farm    | 7            | 6         |



-- Find the first book published by each author using ROW_NUMBER().
SELECT author_name, title, published_year
from (
 	SELECT au.author_name, b.title, b.published_year,
  		ROW_NUMBER() over (
          PARTITION by au.author_name
          ORDER by b.published_year
          ) as row_num
	from authors au
  	join books b on au.author_id=b.author_id
)t
where row_num =1

-- Expected Output
| author\_name      | title          | published\_year | row\_num |
| ----------------- | -------------- | --------------- | -------- |
| Amruta Pikle      | test           | 1987            | 1        |
| George Orwell     | Animal Farm    | 1945            | 1        |
| George Orwell     | 1984           | 1949            | 2        |
| J.K. Rowling      | Harry Potter 1 | 1997            | 1        |
| J.K. Rowling      | Harry Potter 2 | 1998            | 2        |
| Yuval Noah Harari | Sapiens        | 2011            | 1        |
| Yuval Noah Harari | Homo Deus      | 2015            | 2        |


-- Calculate running total of sales revenue ordered by sale_date.
SELECT s.sale_id,
       b.title,
       s.sale_date,
       s.quantity,
       b.price,
       (s.quantity * b.price) AS revenue,
       SUM(s.quantity * b.price) OVER (
           ORDER BY s.sale_date
       ) AS running_total
FROM sales s
JOIN books b ON s.book_id = b.book_id
ORDER BY s.sale_date;

-- Expected Output
| sale\_id | title          | sale\_date | quantity | price | revenue | running\_total |
| -------- | -------------- | ---------- | -------- | ----- | ------- | -------------- |
| 201      | 1984           | 2023-01-10 | 20       | 350   | 7000    | 7000           |
| 202      | Animal Farm    | 2023-01-15 | 15       | 200   | 3000    | 10000          |
| 203      | Harry Potter 1 | 2023-02-01 | 50       | 500   | 25000   | 35000          |
| 204      | Sapiens        | 2023-02-10 | 30       | 700   | 21000   | 56000          |



