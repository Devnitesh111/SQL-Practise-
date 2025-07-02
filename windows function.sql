select full_name, salary, rank() over (order by salary desc) as salary_rank from employees;

select full_name, dept_id, salary, rank() over(partition by dept_id order by salary desc) as dept_rank from employees;

select full_name, salary, 
row_number() over (order by salary desc ) as row_num,
dense_rank() over (order by salary desc) as dense_rank,
rank() over (order by salary desc) as rank_value from employees;


select full_name, salary,
lag(salary) over (order by salary desc) as prev_salary,
lead(salary) over (order by salary desc) as next_salary from employees;

select dept_id, gender, avg(salary) as num_employees from employees group by dept_id, gender;

select date, stock_price, case 
	when stock_price>lag(stock_price) over (order by date) then 'UP'
	when stock_price<lag(stock_price) over (order by date) then 'Down'
	else 'flat'
	end as trend
	from stock_price;
end
