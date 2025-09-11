# SQL Practice Cheat Sheet

This cheat sheet summarizes essential SQL concepts covered in this repository.
It includes syntax, examples, and tips for Joins, Aggregates, Subqueries, CTEs, Window Functions, Indexing, and Transactions.

Perfect! Here’s a **polished, GitHub-friendly version** of your `cheat_sheet.md`. It’s **compact, visually clean**, and uses **headings, tables, and emojis** for quick reference. You can paste this directly into your repo.

---

# 📌 SQL Practice Cheat Sheet

> Quick reference for Joins, Aggregates, Subqueries, CTEs, Window Functions, Indexing, and Transactions.

---

## 1️⃣ Joins

| Join Type     | Description                                       |
| ------------- | ------------------------------------------------- |
| 🔗 INNER JOIN | Only matching rows from both tables               |
| 🔗 LEFT JOIN  | All rows from left + matches from right           |
| 🔗 RIGHT JOIN | All rows from right + matches from left           |
| 🔗 FULL JOIN  | All rows from both tables, matched where possible |

**Example:**

```sql
SELECT e.emp_name, d.dept_name
FROM employees e
LEFT JOIN departments d ON e.dept_id = d.dept_id;
```

---

## 2️⃣ GROUP BY & HAVING

```sql
SELECT dept_id, COUNT(*) 
FROM employees
GROUP BY dept_id
HAVING COUNT(*) > 5;
```

---

## 3️⃣ Subqueries & CTEs

**Subquery:**

```sql
SELECT emp_name
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);
```

**CTE:**

```sql
WITH dept_avg AS (
  SELECT dept_id, AVG(salary) AS avg_salary
  FROM employees
  GROUP BY dept_id
)
SELECT e.emp_name, e.salary
FROM employees e
JOIN dept_avg d ON e.dept_id = d.dept_id
WHERE e.salary > d.avg_salary;
```

---

## 4️⃣ Window Functions

| Function         | Description                        |
| ---------------- | ---------------------------------- |
| ROW\_NUMBER()    | Sequential numbering per partition |
| RANK()           | Ranking with gaps for ties         |
| DENSE\_RANK()    | Ranking without gaps for ties      |
| SUM()/AVG() OVER | Running totals / moving averages   |

**Example:**

```sql
SELECT emp_name, salary,
       RANK() OVER (PARTITION BY dept_id ORDER BY salary DESC) AS rnk
FROM employees;
```

---

## 5️⃣ Indexing & Performance

```sql
-- Create index
CREATE INDEX idx_dept ON employees(dept_id);
CREATE INDEX idx_dept_salary ON employees(dept_id, salary);

-- Check performance
EXPLAIN SELECT * FROM employees WHERE dept_id = 10;
```

---

## 6️⃣ Transactions & Isolation Levels

```sql
-- Transaction commands
BEGIN;
UPDATE employees SET salary = salary + 1000 WHERE emp_id = 101;
COMMIT;   -- or ROLLBACK;
```

| Isolation Level  | Prevents                              |
| ---------------- | ------------------------------------- |
| READ UNCOMMITTED | Dirty reads not prevented             |
| READ COMMITTED   | Prevents dirty reads                  |
| REPEATABLE READ  | Prevents dirty & non-repeatable reads |
| SERIALIZABLE     | Prevents all anomalies (slowest)      |

---

## 7️⃣ Quick Tips

* Avoid `SELECT *` in production queries.
* Use CTEs for **readability** in complex queries.
* Use window functions instead of self-joins for ranking or running totals.
* Index wisely → improves SELECT but may slow INSERT/UPDATE.
* Prefer `NOT EXISTS` over `NOT IN` when subquery might contain NULLs.

---

