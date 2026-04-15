-- Assign rank to customers based on total order amount.

with order_totals as (
  select customer_id, sum(amount) as total
  from orders
  group by customer_id
)
select customer_id, total,
rank() over (order by total desc) as rank
from order_totals
