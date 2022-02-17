create table CUSTOMERS
(
    id serial
        constraint customers_pk
            primary key,
    name varchar,
    surname varchar,
    age int,
    phone_number varchar
);

insert into customers (name, surname, age, phone_number) values ('alexey', 'perviy', 24, '123');
insert into customers (name, surname, age, phone_number) values ('ivan', 'vtoroi', 14, '345');
insert into customers (name, surname, age, phone_number) values ('sidor', 'third', 28, '567');
insert into customers (name, surname, age, phone_number) values ('alexey', 'third', 44, '789');


create table ORDERS
(
    id serial
        constraint orders_pk
            primary key,
    date date,
    customer_id int
        constraint orders_fk
            references customers
            on update cascade on delete cascade,
    product_name varchar,
    amount numeric
);

insert into orders (date, customer_id, product_name, amount) values (to_date('1-1-2022', 'DD-MM-YYYY'),1, 'product1', 100 );
insert into orders (date, customer_id, product_name, amount) values (to_date('2-1-2022', 'DD-MM-YYYY'),2, 'product2', 111 );
insert into orders (date, customer_id, product_name, amount) values (to_date('3-1-2022', 'DD-MM-YYYY'),3, 'product3', 222 );
insert into orders (date, customer_id, product_name, amount) values (to_date('4-1-2022', 'DD-MM-YYYY'),4, 'product1', 333 );
insert into orders (date, customer_id, product_name, amount) values (to_date('5-1-2022', 'DD-MM-YYYY'),1, 'product3', 444 );
insert into orders (date, customer_id, product_name, amount) values (to_date('6-1-2022', 'DD-MM-YYYY'),2, 'product2', 555 );
insert into orders (date, customer_id, product_name, amount) values (to_date('7-1-2022', 'DD-MM-YYYY'),3, 'product2', 666 );
insert into orders (date, customer_id, product_name, amount) values (to_date('8-1-2022', 'DD-MM-YYYY'),4, 'product3', 777 );