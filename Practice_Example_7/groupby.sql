-- Find customers whose total order amount is less than 500.

select c.customer_id, sum(o.amount)
from customers c
join orders o
on c.customer_id = o.customer_id
group by c.customer_id
having sum(o.amount) < 50
