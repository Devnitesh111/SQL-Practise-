create or replace function give_raise(emp int,increment numeric)
returns void
as $$
begin
	update employees
	set salary = salary+increment
	where emp_id =emp;
end;
$$ language plpgsql;

select give_raise(3,50000)

select * from employees;

create or replace procedure increase_all_salaries(percentage numeric)
language plpgsql
as $$
begin
	update employees
	set salary=salary+ (salary*percentage/100);
end;
$$;

call increase_all_salaries(20);

select * from employees;
