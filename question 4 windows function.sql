alter table session_orders
add order_date date default current_date

alter table session_orders 
add status varchar(20)

alter table session_orders
drop column order_total

alter table session_orders
add order_total numeric(10,2)

insert into session_orders(order_total,customer_id,status,order_date)values(
3,1,'pending','2002-12-12'
),
(
2,2,'completed','2000-10-12'
),
(
6,3,'expired','1982-3-4'
),
(
7,4,'completed','2024-2-4'
)

insert into session_orders(order_total,customer_id)values(
3,1
)
insert into session_orders(order_total,customer_id)values(
4,1
)
select customer_id, rank() over(order by order_total desc)
as order_total_rank from session_orders;
select customer_id, order_date, order_total,
sum(order_total) over (partition by customer_id order by order_date) as cumulative_sum
from session_orders order by customer_id, order_date;

select customer_id, order_id, order_total,
avg(order_total) over (partition by customer_id order by order_id rows 2 preceding) as moving_average
from session_orders;
