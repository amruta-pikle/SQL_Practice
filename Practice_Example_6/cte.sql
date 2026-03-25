-- Find customers whose total order amount is greater than 500.

with order_total as (
	select customer_id, sum(amount) as total_amount
  	from orders
  	group by customer_id
 )
select *
from order_total
where total_amount > 500