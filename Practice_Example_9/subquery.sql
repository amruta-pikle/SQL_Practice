-- Find orders whose amount is greater than average order amount.


select order_id, amount
from orders
where amount > (
  select avg(amount)
  from orders

)


-- Find orders whose amount is greater than their customer's average order amount.

select o.order_id, o.customer_id, o.amount
from orders o
where amount > ( select avg(amount) from orders o2	where o2.customer_id = o.customer_id)



