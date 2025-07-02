select * from employees where salary > (select avg(salary) from employees);

select full_name, salary,(select avg(salary) from employees) as avg_salary from employees;

select dept_id, avg_salary from (
select dept_id, avg(salary) as avg_salary from employees group by dept_id
) as dept_avg;

select dept_name from departments where dept_id in (select distinct dept_id from employees where salary>30000);

select dept_name from departments where dept_id in (2,3,5)