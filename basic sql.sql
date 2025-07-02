--SYNTAX FOR CREATING TABLE

create table TABLE_NAME(
column1 DATATYPE,
column2 DATATYPE,
....
);

create table STUDENTS(
ID SERIAL primary key,
NAME TEXT not null,
AGE INT,
ENROLLED_ON DATE default CURRENT_DATE
);

--syntax for altering table

alter table table_name
<action>
add column_name data_type [constraints];
rename column old_name to new_name;
alter column column_name type new_data_type;
drop column column_name[cascade];
rename to new_table_name;


alter table students 
add email text;

alter table students 
rename column age to student_age;

--syntax for drop
drop table table_name;

--syntax for truncate 
truncate table table_name;

--syntax for grant
grant privilege on table_name to user;

grant select, insert, delete on students to student1;

--syntax for revoke
revoke privilege on table_name from user;

revoke select, insert, delete on students from student1;

--syntax for insert
insert into table_name(column1, column2, ....)
values (value1, value2, ......)

insert into students(name,age)
values('Rame',25);

--syntax for select 
select column1, column2, .... from table_name;

select id, name, age, enrolled_on from students;

insert into students(name,age) values ('hello',2);