-- Count how many books each author has written.
SELECT an.author_name ,count(b.book_id)
from authors an
LEFT JOIN books b on an.author_id=b.author_id
GROUP by an.author_name

-- Expected Output
| author\_name      | book\_count |
| ----------------- | ----------- |
| Amruta Pikle      | 0           |
| George Orwell     | 2           |
| J.K. Rowling      | 2           |
| Yuval Noah Harari | 2           |
| Unknown Author    | 0           |



-- Find average book price per author.
SELECT an.author_name ,avg(b.price)
from authors an
LEFT JOIN books b on an.author_id=b.author_id
GROUP by an.author_name

-- Expected Output
| author\_name      | avg\_price |
| ----------------- | ---------- |
| Amruta Pikle      | NULL       |
| George Orwell     | 275.0      |
| J.K. Rowling      | 525.0      |
| Yuval Noah Harari | 675.0      |
| Unknown Author    | NULL       |



-- Show authors whose average book price > 500.
SELECT an.author_name ,avg(b.price)
from authors an
LEFT JOIN books b on an.author_id=b.author_id
GROUP by an.author_name
HAVING avg(b.price) > 500

-- Expected Output
| author\_name      | avg\_price |
| ----------------- | ---------- |
| J.K. Rowling      | 525.0      |
| Yuval Noah Harari | 675.0      |


-- Find authors who have published more than 3 books
SELECT an.author_name ,count(b.book_id)
from authors an
LEFT JOIN books b on an.author_id=b.author_id
GROUP by an.author_name
HAVING count(b.book_id) > 3

-- Expected Output
| author\_name | book\_count |
| ------------ | ----------- |
| (none)       |             |

-- In current data, no author has >3 books.
