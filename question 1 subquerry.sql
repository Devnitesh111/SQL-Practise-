create table Customers (
CustomerName varchar(30) not null,
Country varchar(30) not null,
Order_year date default current_date,
ContactName varchar(30) not null,
City varchar(30) not null
)

insert into Customers (
CustomerName,
Country,
Order_year,
ContactName,
City
) values 
(
'Nitesh','Germany','1997-2-3','nitesh','berlin'
),
(
'Aitesa','France','1992-2-3','aitesa','lyon'
),
(
'Ritesa','France','1997-2-3','ritesa','monaco'
),
(
'Hitesh','UK','1997-2-3','hitesh','london'
),
(
'Pitesa','Korea','2000-2-3','pitesa','seoul'
),
(
'Witesh','USA','2002-2-3','witesh','florida'
),
(
'Fitesh','Japan','2006-2-3','fitesh','tokiyo'
);

select CustomerName, Country from Customers 
where 
CustomerName in (select CustomerName from Customers where Order_year between '1997-1-1' and '1997-12-31');

 select CustomerName, Country, ContactName from Customers 
 where 
 Country in ('Germany', 'France', 'UK') 
 and 
 ContactName not like '%a';

select * from Customers 
order by Country asc;

select * from Customers 
order by City desc;

select * from Customers 
order by CustomerName asc;

