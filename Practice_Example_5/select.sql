-- Find all customers from USA.

select customer_id, first_name, last_name
from customers
where country = "USA"