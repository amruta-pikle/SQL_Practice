-- Assign a row number to employees ordered by salary descending.
select emp_id,emp_name,salary,
	ROW_NUMBER() over (order by salary DESC) as row_num
from employees

-- Expected OUTPUT
| emp\_id | emp\_name | salary | row\_num |
| ------- | --------- | ------ | -------- |
| 102     | Bob       | 80000  | 1        |
| 103     | Charlie   | 80000  | 2        |
| 101     | Alice     | 60000  | 3        |
| 105     | Eva       | 50000  | 4        |
| 104     | David     | 40000  | 5        |




-- Rank employees by salary (compare RANK() vs DENSE_RANK()).
SELECT emp_id, emp_name, salary,
	RANK() over (ORDER by salary) rank_pos,
   	DENSE_RANK() over (ORDER by salary) den_rank
FROM employees

-- Expected OUTPUT
| emp\_id | emp\_name | salary | rank\_pos | den\_rank |
| ------- | --------- | ------ | --------- | --------- |
| 104     | David     | 40000  | 1         | 1         |
| 105     | Eva       | 50000  | 2         | 2         |
| 101     | Alice     | 60000  | 3         | 3         |
| 102     | Bob       | 80000  | 4         | 4         |
| 103     | Charlie   | 80000  | 4         | 4         |

