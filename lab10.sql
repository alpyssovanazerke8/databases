create database lab10;

create table Books (
    book_id serial primary key,
    title varchar(255) not null,
    author varchar(255) not null,
    price decimal (10, 2) not null,
    quantity integer not null
);

create table Customers (
    customer_id serial primary key,
    name varchar(255) not null,
    email varchar(255) not null
);

create table Orders (
    order_id serial primary key,
    book_id integer not null,
    customer_id integer not null,
    order_date date not null,
    quantity integer not null,
    foreign key (book_id) references Books (book_id),
    foreign key (customer_id) references Customers (customer_id)
);

insert into Books (book_id, title, author, price, quantity)
VALUES
(1, 'Database 101', 'A.Smith', 40.00, 10),
(2, 'Be Brave', 'B.Johnson', 35.00, 15),
(3, 'After', 'C.Lee', 50.00, 5);

insert into Customers (customer_id, name, email)
VALUES
(101, 'John Doe', 'johndoe@example.com'),
(102, 'Jane Doe', 'janedoe@example.com');

-- 1
begin ;

INSERT INTO Orders (book_id, customer_id, order_date, quantity)
VALUES (1, 101, CURRENT_DATE, 2);

UPDATE Books
SET quantity = quantity - 2
WHERE book_id = 1;

COMMIT;

--2
BEGIN;

DO $$
DECLARE
    available_quantity integer;
BEGIN
    SELECT quantity INTO available_quantity FROM Books WHERE book_id = 3;

    IF available_quantity < 10 THEN
        RAISE NOTICE 'Not enough stock for the order. Transaction rolled back.';
        ROLLBACK;
    ELSE
        INSERT INTO Orders (book_id, customer_id, order_date, quantity)
        VALUES (3, 102, CURRENT_DATE, 10);

        UPDATE Books
        SET quantity = quantity - 10
        WHERE book_id = 3;

        COMMIT;
    END IF;
END $$;

--3
BEGIN;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

UPDATE books SET price = 55.00 WHERE book_id = 3;

--Session 2
BEGIN;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

SELECT price FROM Books WHERE book_id = 3;

COMMIT;
SELECT price FROM Books WHERE book_id = 3;

-- TASK 4
BEGIN;

UPDATE Customers
SET email = 'dsadad@gmail.com'
WHERE customer_id = 101;

COMMIT;

SELECT customer_id, email FROM Customers WHERE customer_id = 101;