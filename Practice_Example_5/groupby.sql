-- Find total order amount per customer.

select c.customer_id, c.first_name, sum(o.amount) as total_amount
from customers c
join orders o
on c.customer_id = o.customer_id
group by c.customer_id