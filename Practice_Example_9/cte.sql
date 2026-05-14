-- Find customers whose total order amount is above average total order amount.


with avg_total as (
  select customer_id, sum(amount) as total
  from orders
  group by customer_id
)
select customer_id, total
from avg_total
where total > (select avg(total) from avg_total)

