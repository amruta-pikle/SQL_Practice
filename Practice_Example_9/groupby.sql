-- Find total order amount per customer.

select c.customer_id, sum(o.amount) AS total_amount
from customers c
join orders o
on c.customer_id = o.customer_id
group by c.customer_id
