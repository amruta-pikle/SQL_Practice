-- Find maximum order amount per customer.

select c.customer_id, max(o.amount) as max_amount
from customers c
join orders o
on c.customer_id = o.customer_id
group by c.customer_id
