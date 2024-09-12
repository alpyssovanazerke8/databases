create database lab1;

create table users(
    id integer,
    firstname char(50),
    lastname char(50)
);

alter table users
    ADD COLUMN isadmin integer;

alter table users
    alter column isadmin set data type boolean USING isadmin::boolean;

alter table users
    alter column isadmin set default false;

alter table users
    add constraint users_id primary key (id);

create table tasks(
  id int,
  name char(50),
  user_id int
);

drop table tasks;

drop database lab1;


