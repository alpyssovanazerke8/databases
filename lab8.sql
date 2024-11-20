--1
create database lab8;

--2
create table salesman (
    salesman_id int primary key,
    name varchar(50),
    city varchar(50),
    commission decimal(4, 2)
);

insert into salesman (salesman_id, name, city, commission) values
(5001, 'James Hoog', 'New York', 0.15),
(5002, 'Nail Knite', 'Paris', 0.13),
(5005, 'Pit Alex', 'London', 0.11),
(5006, 'Mc Lyon', 'Paris', 0.14),
(5003, 'Lauson Hen', 'Berlin', 0.12),
(5007, 'Paul Adam', 'Rome', 0.13);

create table customer (
    customer_id int primary key,
    cust_name varchar(50),
    city varchar(50),
    grade int,
    salesman_id int references salesman(salesman_id)
);

insert into customer (customer_id, cust_name, city, grade, salesman_id) values
(3002, 'Nick Rimando', 'New York', 100, 5001),
(3005, 'Graham Zusi', 'California', 200, 5002),
(3001, 'Brad Guzan', 'London', 0, 5005),
(3004, 'Fabian Johns', 'Paris', 300, 5006),
(3007, 'Brad Davis', 'New York', 200, 5001),
(3009, 'Geoff Camero', 'Berlin', 100, 5003),
(3008, 'Julian Green', 'London', 300, 5002);

create table orders (
    ord_no int primary key,
    purch_amt decimal(10, 2),
    ord_date date,
    customer_id int references customer(customer_id),
    salesman_id int references salesman(salesman_id)
);

insert into orders (ord_no, purch_amt, ord_date, customer_id, salesman_id) values
(70001, 150.50, '2012-10-05', 3005, 5002),
(70009, 270.65, '2012-09-10', 3001, 5005),
(70002, 65.26, '2012-10-05', 3002, 5001),
(70004, 110.50, '2012-08-17', 3009, 5003),
(70007, 948.50, '2012-09-10', 3005, 5002),
(70005, 2400.60, '2012-07-27', 3007, 5001),
(70008, 5760.00, '2012-09-10', 3002, 5001);

--3
create role junior_dev login;

--4
create view view_salesmen as
select * from salesman where city = 'New York';

--5
create view order_details as
select
    o.ord_no as order_number,
    s.name as salesman_name,
    c.cust_name as customer_name
from orders o
join salesman s on o.salesman_id = s.salesman_id
join customer c on o.customer_id = c.customer_id;

grant all privileges on order_details to junior_dev;

--6
create view highest_grade_customers as
select * from customer c
where c.grade = (select max(grade) from customer);

grant select on highest_grade_customers to junior_dev;

--7
create view salesman_count_per_city as
select city, count(salesman_id) as number_of_salesmen from salesman
group by city;

--8
create view salesmen_with_multiple_customers as
select s.name as salesman_name, count(c.customer_id) as number_of_customers
from salesman s
join customer c on s.salesman_id = c.salesman_id
group by s.salesman_id, s.name
having count(c.customer_id) > 1;

--9
create role intern;
grant junior_dev to intern;