create table departments(
dept_id SERIAL primary key,
dept_name VARCHAR(50) unique not null
);

create table employees(
emp_id serial primary key,
full_name varchar(100) not null,
dept_id int references departments(dept_id),
hire_date date default current_date,
salary numeric(10,2) check (salary>=0)
);

insert into departments (dept_name) 
values 
('hr'), 
('engineering'),
('sales'); 

insert into employees (full_name, dept_id, hire_date, salary) 
values 
('alioce', 1, '2023-01-15', 40000), 
('bob', 2, '2022-06-01', 70000),
('charlie', 2, '2022-07-10', 30000), 
('diana', 3, '2023-06-22', 60000); 


--example of aliases
select full_name as name, salary as income from employees;

--logical and comparsion operators
-- =, <>, <,>,between, like, in, and, or, is null

select * from employees where salary > 20000;
select * from employees where full_name like '%s';
select * from employees where hire_date between '2021-01-01' and '2024-12-31';

--example of aggregations
--count(), sum(), avg(), min(), max()


select count(*) from employees;
select avg(salary), max(salary), min(salary), sum(salary) from employees;


select dept_id, avg(salary) from employees group by dept_id;7


--joins
select e.full_name, d.dept_name
from employees e
join departments d
on e.dept_id=d.dept_id



insert into departments (dept_name)
values ('it'), ('marketing');


insert into employees(full_name,dept_id,salary)
values('eve', null, 40000)



select e.full_name, d.dept_name 
from employees e
left join departments d 
on e.dept_id = d.dept_id



select e.full_name, d.dept_name
from employees e
right join departments d
on e.dept_id = d.dept_id


select e.full_name, d.dept_name
from employees e
full outer join departments d
on e.dept_id = d.dept_id



select * from employees;

select emp_id, full_name, dept_id, hire_date, salary from employees;


