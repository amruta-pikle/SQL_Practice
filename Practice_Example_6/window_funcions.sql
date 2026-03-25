-- Assign dense rank to orders based on amount.

select order_id,amount,
dense_rank() over (order by amount desc) as rank
from orders
