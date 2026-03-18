-- Find customers whose order amount is greater than average order amount.

select c.customer_id, o.amount
from customers c
join orders o
on c.customer_id = o.customer_id
where o.amount > (
	select avg(amount) from orders
)


--Find customers whose total order amount is greater than average total of all customers.

select c.customer_id
from customers c
join orders o
on c.customer_id = o.customer_id
group by c.customer_id
having sum(o.amount) > (

  select avg(total_amount)
  from (
    select customer_id, sum(amount) as total_amount
    from orders
	group by customer_id
)t

)

