create table session_customers(
customer_id serial primary key not null,
full_name varchar(30) not null,
email varchar(30) not null
);


create table session_orders(
order_id serial primary key not null,
order_total int not null,
customer_id int references session_customers(customer_id)
);

insert into session_customers(full_name,email) values
(
'nitesh','nitesh@gmail.com'
),
(
'ritesh','ritesh@gmail.com'
),
(
'hari','hari@gmail.com'
),
(
'gopal','gopal@gmail.com'
)

insert into session_orders(order_total,customer_id)values(
3,1
),
(
2,2
),
(
6,3
),
(
7,4
)

select avg(order_total) from session_orders

select order_total from session_orders 
where 
order_total > 
(select avg(order_total) from session_orders);

select * 
from
session_orders so
join session_customers sc
on so.customer_id = sc.customer_id;

select customer_id 
from session_orders 
where customer_id in (
select customer_id 
from session_orders 
 where order_total > (
 select avg(order_total) 
 from session_orders
  )
);

select sc.customer_id
from session_customers sc
join session_orders so 
on sc.customer_id = so.customer_id
where so.order_total > (
select avg(order_total) 
from session_orders
);

