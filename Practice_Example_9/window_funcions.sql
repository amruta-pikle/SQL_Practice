-- Assign rank to orders based on amount (highest first).

select customer_id, amount,
rank() over (order by amount desc) as rank
from orders
