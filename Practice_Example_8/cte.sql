-- Find customers whose total order amount is below overall average total.

with order_totals as (
  select customer_id, sum(amount) as total
  from orders
  group by customer_id
)
select customer_id, total
from order_totals
where total < (
	select avg(total) from order_totals
)
