-- Assign row number per customer based on amount (highest first).

select customer_id, order_id, amount,
	row_number() over (
  		partition by customer_id
  		order by amount desc
	)as row_num
from orders
