create table session_employees(
employee_id int primary key,
employee_name varchar(30) not null,
manager_id int,
foreign key (manager_id) references session_employees(employee_id)
);

insert into session_employees(employee_id,employee_name,manager_id) values
(1,'nitesh',null),
(2,'ritesh',1),
(3,'hitesh',2),
(4,'sitesh',3),
(5,'kitesh',1),
(6,'rina',5),
(7,'tina',6);


select 
e1.employee_name as employee,
e2.employee_name as manager
from session_employees e1
inner join session_employees e2
on e1.manager_id = e2.employee_id
order by e1.employee_name;


create table department (
department_id int primary key,
department_name varchar(30) not null
);


create table locations( 
location_id int primary key,
city varchar(30) not null
);



insert into department(department_id,department_name) values
(1,'hr'),
(2, 'it'),
(3,'eng'),
(4,'cyber');



insert into locations(location_id, city) values 
(1,'berlin'),
(2,'lyon'),
(3,'monaco'),
(4,'london');



select d.department_name,l.city from department d cross join locations l
order by d.department_name,l.city;
