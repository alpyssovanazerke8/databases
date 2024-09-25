create database lab2;

create table countries (
    country_id serial primary key,
    country_name varchar(50),
    region_id integer,
    population integer
);

insert into countries (country_name, region_id, population)
values ('Japan', 80, 900);

insert into countries (country_id, country_name)
values (8, 'Italy');

update countries set region_id = NULL
                 where country_id=2;
insert into countries (country_name, region_id, population)
values ('England', 29,786),
       ('Venesuela', 57, 239),
       ('Uzbekistan', 63, 956);

ALTER TABLE countries
ALTER COLUMN country_name SET DEFAULT 'Kazakhstan';

update countries set country_name = default where region_id=63;

insert into countries (country_name, region_id, population) values (default, default, default);

create table countries_new (like countries);

insert into countries_new
select * from countries;

update countries_new set region_id = 1 where region_id is null;

select country_name, population*1.10 as "new population" from countries_new;

delete from countries where population < 100;

delete from countries_new where country_id in(select country_id from countries)
returning *;

delete from countries
returning *;

select * from countries_new;

select * from countries;



