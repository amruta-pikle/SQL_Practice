-- Find customers whose total order amount is greater than average total of all customers.


WITH customer_totals AS (
    SELECT customer_id,
           SUM(amount) AS total_amount
    FROM Orders
    GROUP BY customer_id
)

SELECT *
FROM customer_totals
WHERE total_amount >
(
    SELECT AVG(total_amount)
    FROM customer_totals
);