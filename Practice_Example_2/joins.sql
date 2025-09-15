-- Get all books with their author names.
select b.title, an.author_name
from books b
join authors an on b.author_id=an.author_id

-- Expected Output
| title          | author\_name      |
| -------------- | ----------------- |
| 1984           | George Orwell     |
| Animal Farm    | George Orwell     |
| Harry Potter 1 | J.K. Rowling      |
| Harry Potter 2 | J.K. Rowling      |
| Sapiens        | Yuval Noah Harari |
| Homo Deus      | Yuval Noah Harari |


--List all books, including those without authors (if any).
select b.title, an.author_name
from books b
LEft JOIN authors an on b.author_id=an.author_id

-- Expected Output
| title          | author\_name      |
| -------------- | ----------------- |
| test           | NULL              |
| 1984           | George Orwell     |
| Animal Farm    | George Orwell     |
| Harry Potter 1 | J.K. Rowling      |
| Harry Potter 2 | J.K. Rowling      |
| Sapiens        | Yuval Noah Harari |
| Homo Deus      | Yuval Noah Harari |


-- Show all authors, even if they haven’t written any books.
SELECT an.author_name, b.title
from authors an
LEFT JOIN books b on an.author_id=b.author_id

-- Expected Output
| author\_name      | title          |
| ----------------- | -------------- |
| Amruta Pikle      | NULL           |
| George Orwell     | 1984           |
| George Orwell     | Animal Farm    |
| J.K. Rowling      | Harry Potter 1 |
| J.K. Rowling      | Harry Potter 2 |
| Yuval Noah Harari | Sapiens        |
| Yuval Noah Harari | Homo Deus      |
| Unknown Author    | NULL           |


-- Display all authors and books (full outer join).
SELECT an.author_name,b.title
from authors an
full JOIN books b on an.author_id=b.book_id

-- Expected Output
| author\_name      | title          |
| ----------------- | -------------- |
| Amruta Pikle      | NULL           |
| George Orwell     | 1984           |
| George Orwell     | Animal Farm    |
| J.K. Rowling      | Harry Potter 1 |
| J.K. Rowling      | Harry Potter 2 |
| Yuval Noah Harari | Sapiens        |
| Yuval Noah Harari | Homo Deus      |
| Unknown Author    | NULL           |
| NULL              | test           |
