create or replace procedure 
session_update_order_status(p_order_id int ,p_new_status varchar)
language plpgsql
as $$
begin
update session_orders
set status = p_new_status 
where order_id = p_order_id;	
end
$$;

call session_update_order_status(1,'pending');

select * from session_orders;

create or replace function session_calculate_discount(p_order_total numeric, p_order_id integer)
returns numeric
as $$
declare
v_new_total numeric;
begin
if p_order_total > 200 then
update session_orders
set order_total = p_order_total - (p_order_total * 0.10)
where order_id = p_order_id
returning order_total into v_new_total;
else
update session_orders
set order_total = p_order_total - (p_order_total * 0.05)
where order_id = p_order_id
returning order_total into v_new_total;
end if;
return v_new_total;
end;
$$ language plpgsql;

select session_calculate_discount(500,1)

select * from session_orders


