create table employees (
    id serial primary key,
    name text not null,
    salary numeric(10, 2) not null
);

create table products (
    id serial primary key,
    name text not null,
    category text not null,
    price numeric(10, 2) not null
);

-- insert data into employees
insert into employees (name, salary) values
('John Doe', 5000.00),
('Jane Smith', 7000.50),
('Alice Brown', 6000.25),
('Bob White', 4500.75);

-- insert data into products
insert into products (name, category, price) values
('Laptop', 'Electronics', 1000.00),
('Headphones', 'Electronics', 150.00),
('Desk Chair', 'Furniture', 200.00),
('Table Lamp', 'Furniture', 50.00),
('Mouse', 'Electronics', 25.00);

-- 1
create function increase_value(a integer)
    returns integer as
    $$
    begin
        return a + 10;
    end;
    $$
language plpgsql;

-- 2
create or replace function compare_numbers(a1 integer, a2 integer, out result text)
as
$$
begin
    if a1 > a2 then
        result := 'greater';
    elsif a1 = a2 then
        result := 'equal';
    else
        result := 'lesser';
    end if;
end;
$$
language plpgsql;

-- 3
create or replace function number_series(n integer)
returns setof integer as $$
begin
    for i in 1..n loop
        return next i; -- returns the value of i for each iteration
    end loop;
    return; -- end of function
end;
$$ language plpgsql;

-- 4
create or replace function get_employee_details(employee_name text)
returns table (
    employee_id int,
    first_name text,
    last_name text,
    email text,
    hire_date date
) as $$
begin
    return query
    select employee_id, first_name, last_name, email, hire_date
    from employees
    where first_name || ' ' || last_name = employee_name
    limit 1;
end;
$$ language plpgsql;

-- 5
create or replace function list_products(category_name text)
returns table (
    product_id int,
    product_name text,
    category text,
    price numeric,
    stock_quantity int
) as $$
begin
    return query
    select product_id, product_name, category, price, stock_quantity
    from products
    where category = category_name;
end;
$$ language plpgsql;

-- 6
create or replace function calc_bonus(emp_id int) returns numeric as $$
declare
    bonus numeric;
begin
    select salary * 0.1 into bonus
    from employees
    where id = emp_id;
    return bonus;
end;
$$ language plpgsql;

create or replace function update_employee_salary(emp_id int) returns void as $$
declare
    bonus numeric;
begin
    bonus := calc_bonus(emp_id);
    update employees set salary = salary + bonus where id = emp_id;
end;
$$ language plpgsql;

-- 7
create or replace function combined_calc(num int, str text) returns text as $$
declare
    num_result int;
    str_result text;
begin
    begin
        num_result := (num * 2) + 5;
    end;

    begin
        str_result := upper(str);
    end;

    return 'numeric: ' || num_result || ', string: ' || str_result;
end;
$$ language plpgsql;

select combined_calc(3, 'hello');

select calc_bonus(1);
select update_employee_salary(3);

select * from number_series(10);

select * from compare_numbers(12, 12);
select increase_value(10);

-- drop function example
drop function number_series(integer);
