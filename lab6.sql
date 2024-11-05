create database lab6;

create table locations (
    location_id serial primary key ,
    street_address varchar(25),
    postal_code varchar(12),
    city varchar(30),
    state_provide varchar(12)
);

create table departments (
    department_id serial primary key ,
    department_name varchar(50) unique ,
    budget integer,
    location_id integer references locations
);

create table employees (
    employee_id serial primary key,
    first_name varchar(50),
    last_name varchar(50),
    email varchar(50),
    phone_number varchar(20),
    salary integer,
    department_id integer references departments
);

insert into locations (street_address, postal_code, city, state_provide) values
('Zhibek Zholy St 45', '050010', 'Almaty', 'Almaty'),
('Republic Ave 67', '010010', 'Astana', 'Akmola'),
('Bogenbay Batyr St 22', '140000', 'Semey', 'EKR'),
('Abylai Khan St 9', '030000', 'Kostanay', 'Kostanay'),
('Kabanbay Batyr Ave 54', '150000', 'Kokshetau', 'Akmola'),
('Alash St 17', '120000', 'Taraz', 'Zhambyl'),
('Nazarbayev Ave 32', '160000', 'Shymkent', 'Turkistan'),
('Mangilik El Ave 1', '020000', 'Aktobe', 'Aktobe');

insert into departments (department_name, budget, location_id) values
('Engineering', 2000000, 6),
('Support', 950000, 7),
('Logistics', 870000, 8),
('Research', 1300000, 5),
('Legal', 1100000, 1),
('Administration', 700000, 2),
('Public Relations', 920000, 4),
('Procurement', 880000, 3);

insert into departments(department_name, budget, location_id) values ('new department', 3000000, 2);

insert into employees (first_name, last_name, email, phone_number, salary, department_id) values
('Miras', 'Saparov', 'miras.saparov@example.kz', '+77091234575', 520000, 6),
('Aidos', 'Beketov', 'aidos.beketov@example.kz', '+77011234576', 480000, null),
('Aigerim', 'Zharkenova', 'aigerim.zharkenova@example.kz', '+77021234577', 390000, 7),
('Adil', 'Kasymov', 'adil.kasymov@example.kz', '+77031234578', 430000, 8),
('Saltanat', 'Nurbek', 'saltanat.nurbek@example.kz', '+77041234579', 410000, 5),
('Altyn', 'Kenzhebek', 'altyn.kenzhebek@example.kz', '+77051234580', 450000, 1),
('Samat', 'Bolat', 'samat.bolat@example.kz', '+77061234581', 490000, 3),
('Nuray', 'Yessimova', 'nuray.yessimova@example.kz', '+77071234582', 470000, 2),
('Serik', 'Yermek', 'serik.yermek@example.kz', '+77081234583', 520000, 3),
('Marat', 'Dosym', 'marat.dosym@example.kz', '+77091234584', 510000, 8),
('Aruzhan', 'Zhussupova', 'aruzhan.zhussupova@example.kz', '+77101234585', 450000, 6),
('Madina', 'Nurgaliyeva', 'madina.nurgaliyeva@example.kz', '+77111234586', 480000, 7),
('Bolat', 'Ilyasov', 'bolat.ilyasov@example.kz', '+77121234587', 400000, 8),
('Elmira', 'Shaimerdenova', 'elmira.shaimerdenova@example.kz', '+77131234588', 460000, 4),
('Rustem', 'Naimanbayev', 'rustem.naimanbayev@example.kz', '+77141234589', 530000, 2),
('Karlygash', 'Zhanibek', 'karlygash.zhanibek@example.kz', '+77151234590', 490000, 1),
('Murat', 'Baisalov', 'murat.baisalov@example.kz', '+77161234591', 520000, 5),
('Saule', 'Baizakova', 'saule.baizakova@example.kz', '+77171234592', 470000, 6),
('Zarina', 'Mukhan', 'zarina.mukhan@example.kz', '+77181234593', 450000, 7),
('Yerzhan', 'Shalabay', 'yerzhan.shalabay@example.kz', '+77191234594', 410000, null),
('Dana', 'Abdikarim', 'dana.abdikarim@example.kz', '+77201234595', 500000, 4),
('Almas', 'Yermekov', 'almas.yermekov@example.kz', '+77211234596', 550000, 3),
('Saniya', 'Beken', 'saniya.beken@example.kz', '+77221234597', 430000, 1),
('Rakhat', 'Tursyn', 'rakhat.tursyn@example.kz', '+77231234598', 510000, 5),
('Zhanel', 'Tuleutay', 'zhanel.tuleutay@example.kz', '+77241234599', 460000, 2),
('Serik', 'Kairat', 'serik.kairat@example.kz', '+77251234600', 470000, 8),
('Bakytzhan', 'Sarsenov', 'bakytzhan.sarsenov@example.kz', '+77261234601', 490000, 7),
('Aigul', 'Baimukhanova', 'aigul.baimukhanova@example.kz', '+77271234602', 450000, 6),
('Aidana', 'Ospanova', 'aidana.ospanova@example.kz', '+77281234603', 480000, 3),
('Dias', 'Askar', 'dias.askar@example.kz', '+77291234604', 510000, 5);

--3
select e.first_name, e.last_name, e.department_id, d.department_name
from employees e
join departments d on e.department_id = d.department_id;

--4
select e.first_name, e.last_name, e.department_id, d.department_name
from employees e
join departments d on e.department_id = d.department_id
where e.department_id in (8, 4);

--5
select e.first_name, e.last_name, d.department_name, l.city, l.state_provide
from employees e
left join departments d on e.department_id = d.department_id
left join locations l on d.location_id = l.location_id;

--6
select d.department_id, d.department_name, e.first_name, e.last_name
from departments d
left join employees e on d.department_id = e.department_id;

--7
select e.first_name, e.last_name, d.department_id, d.department_name
from employees e
left join departments d on e.department_id = d.department_id;