-- Find orders whose amount is equal to second highest amount.

select order_id, amount
from (
  select order_id, amount,
  dense_rank() over (order by amount desc) as rnk
  FROM ORDERS
)t
where rnk = 2


-- Find customers whose total order amount is greater than their own average * number of orders*.

select c.first_name
from customers c
join orders o
on c.customer_id = o.customer_id
where o.amount > (
  select avg(o1.amount)
  from orders o1
  where o.order_id = o1.order_id
)




