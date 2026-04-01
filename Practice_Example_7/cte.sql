-- Find customers whose total order amount is highest.

with order_totals as (
  select customer_id, sum(amount) as total
  from orders
  group by customer_id
)
select *
from order_totals
where total = (
 	select max(total) from order_totals
)
