-- Rank orders based on amount (highest first).

select order_id, amount, rank() over (order by amount desc) as rank
from orders