create view eng_employees as 
select emp_id ,full_name, salary from employees 
where 
dept_id=(select dept_id from departments where dept_name = 'Enginnering');

select * from eng_employees;

create view employee_department as select e.emp_id,e.full_name,d.dept_name,e.salary
from employees e
join departments d
on e.dept_id = d.dept_id;

create view salary_band as
select full_name, salary,
	case
		when salary < 60000 then 'Low'
		when salary between 60000 and 70000 then 'Medium'
		else 'high'
	end as salary_range
from employees;


select * from salary_band;



create materialized view matvw_salary_band as select full_name, salary, case
	when salary < 60000 then 'low'
when salary between 60000 and 70000 then 'medium'
else 'high'
end as salary_range
from employees;
end;


select * from matvw_salary_band;

select * from employees;


delete from employees where emp_id=5;


refresh materialized view matvw_salary_band;