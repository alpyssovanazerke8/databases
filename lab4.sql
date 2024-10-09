create database lab4;

-- 2. Create the Warehouses table
create table warehouses (
    code integer primary key,
    location varchar(255),
    capacity integer
);

-- 2. Create the Boxes table
create table boxes (
    code char(4) primary key,
    contents varchar(255),
    value real,
    warehouse integer,
    foreign key (warehouse) references warehouses(code)
);

-- Insert data into Warehouses
insert into warehouses (code, location, capacity) values
(1, 'Chicago', 3),
(2, 'Chicago', 4),
(3, 'New York', 7),
(4, 'Los Angeles', 2),
(5, 'San Francisco', 8);

-- Insert data into Boxes
insert into boxes (code, contents, value, warehouse) values
('0MN7', 'Rocks', 180, 3),
('4H8P', 'Rocks', 250, 1),
('4RT3', 'Scissors', 190, 4),
('7G3H', 'Rocks', 200, 1),
('8JN6', 'Papers', 75, 1),
('8Y6U', 'Papers', 50, 3),
('9J6F', 'Papers', 175, 2),
('LL08', 'Rocks', 140, 4),
('P0H6', 'Scissors', 125, 1),
('P2T6', 'Scissors', 150, 2),
('TU55', 'Papers', 90, 5);

select * from warehouses;
select * from boxes;

-- 4. Select all warehouses with all columns
select * from warehouses;

-- 5. Select all boxes with a value larger than $150
select * from boxes where value > 150;

-- 6. Select all the boxes distinct by contents
select distinct contents from boxes;

-- 7. Select the warehouse code and the number of boxes in each warehouse
select warehouse, count(*) as box_count
from boxes
group by warehouse;

-- 8. Select only those warehouses where the number of boxes is greater than 2
select warehouse, count(*) as box_count
from boxes
group by warehouse
having count(*) > 2;

-- 9. Create a new warehouse in New York with a capacity for 3 boxes
insert into warehouses (code, location, capacity) values (6, 'New York', 3);

-- 10. Create a new box, with code "H5RT", containing "Papers" with a value of $200, located in warehouse 2
insert into boxes (code, contents, value, warehouse) values ('H5RT', 'Papers', 200, 2);

-- 11. Reduce the value of the third largest box by 15%
update boxes
set value = value * 0.85
where code = (select code from boxes order by value desc limit 1 offset 2);

-- 12. Remove all boxes with a value lower than $150
delete from boxes where value < 150;

-- 13. Remove all boxes which are located in New York and return deleted data
delete from boxes
using warehouses
where boxes.warehouse = warehouses.code
and warehouses.location = 'New York'
returning *;