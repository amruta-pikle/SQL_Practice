-- Find orders with amount less than average amount.

select order_id, amount
from orders
where amount < (
		select avg(amount) from orders
	)


-- Find customers whose maximum order amount is greater than their average order amount.

select distinct o1.customer_id
from orders o1
where o1.amount = (
  select max(o2.amount)
  from orders o2
  where o2.customer_id = o1.customer_id
)
and o1.amount > (
  select avg(o3.amount)
  from orders o3
  where o3.customer_id  = o1.customer_id
)
