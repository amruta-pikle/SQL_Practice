-- Find orders whose amount is greater than average order amount.

select order_id, amount
from orders
where amount > ( select avg(amount) from orders)


-- Find customers whose order amount is greater than their own average order amount.

select customer_id, amount
from orders o
where amount >
(
  select avg(amount)
  from orders o2
  where o.customer_id = o2.customer_id

)