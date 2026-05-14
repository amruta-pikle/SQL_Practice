-- Find customers from UK.

select customer_id, first_name
from Customers
where country = 'UK'
