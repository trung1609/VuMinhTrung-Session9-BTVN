create table luyentap7.Customers
(
    customer_id serial primary key,
    name        varchar(100),
    email       varchar(100)
);

insert into luyentap7.Customers (name, email)
values ('Trung', 'trung@gmail.com'),
       ('Hung', 'hung@gmail.com'),
       ('Manh', 'manh@gmail.com');

create table luyentap7.Orders
(
    order_id    serial primary key,
    customer_id int references luyentap7.Customers (customer_id),
    amount      numeric(10, 2)
);

insert into luyentap7.Orders (customer_id, amount)
values (1, 20000),
       (2, 30000),
       (3, 15000);

create or replace procedure luyentap7.add_order(
    p_customer_id int,
    p_amount numeric(10, 2)
)
    language plpgsql
as
$$
    declare c_exist boolean;
begin
    select true into c_exist
    from luyentap7.Customers c
    where c.customer_id = p_customer_id;
    if not c_exist then
        raise exception 'Customers not found with ID: %', p_customer_id;
    end if;

    insert into luyentap7.orders (customer_id, amount) values (p_customer_id, p_amount);
end;
$$;

call luyentap7.add_order(2,30000);

