create database lab5;

-- create customers table
create table customers (
    customer_id int primary key,
    cust_name varchar(50),
    city varchar(50),
    grade int,
    salesman_id int
);

-- create orders table
create table orders (
    ord_no int primary key,
    purch_amt decimal(10,2),
    ord_date date,
    customer_id int,
    salesman_id int
);

-- create salesman table
create table salesman (
    salesman_id int primary key,
    name varchar(50),
    city varchar(50),
    commission decimal(3,2)
);

-- insert into customers table
insert into customers (customer_id, cust_name, city, grade, salesman_id) values
(3002, 'nick rimando', 'new york', 100, 5001),
(3005, 'graham zusi', 'california', 200, 5002),
(3001, 'brad guzan', 'london', 100, 5005),
(3004, 'fabian johns', 'paris', 300, 5006),
(3007, 'brad davis', 'new york', 200, 5001),
(3009, 'geoff camero', 'berlin', 100, 5003),
(3008, 'julian green', 'london', 300, 5002);

-- insert into orders table
insert into orders (ord_no, purch_amt, ord_date, customer_id, salesman_id) values
(70001, 150.5, '2012-10-05', 3005, 5002),
(70009, 270.65, '2012-09-10', 3001, 5005),
(70002, 65.26, '2012-10-05', 3002, 5001),
(70004, 110.5, '2012-08-17', 3009, 5003),
(70007, 948.5, '2012-09-10', 3005, 5002),
(70005, 2400.6, '2012-07-27', 3007, 5001),
(70008, 5760.0, '2012-09-10', 3002, 5001);

-- insert into salesman table
insert into salesman (salesman_id, name, city, commission) values
(5001, 'james hoog', 'new york', 0.15),
(5002, 'nail knite', 'paris', 0.13),
(5005, 'pit alex', 'london', 0.11),
(5006, 'mc lyon', 'paris', 0.14),
(5003, 'lauson hen', 'berlin', 0.12),
(5007, 'paul adam', 'rome', 0.13);

select sum(purch_amt) from orders;

select avg(purch_amt) from orders;

select count(*) from customers;

select min(purch_amt) from orders;

select * from customers where cust_name like '%b';

select * from orders o
join customers c on o.customer_id = c.customer_id
where c.city = 'new york';

select * from customers c
join orders o on c.customer_id = o.customer_id
where o.purch_amt > 10;

select sum(grade) from customers;

select * from customers;

select max(grade) from customers;
