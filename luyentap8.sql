create table luyentap8.Customers
(
    customer_id serial primary key,
    name        varchar(50),
    total_spent numeric(10, 2)
);

insert into luyentap8.Customers (name, total_spent)
values ('Trung', null),
       ('Hung', null),
       ('Manh', null),
       ('Long', null);

create table luyentap8.Orders
(
    order_id     serial primary key,
    customer_id  int references luyentap8.Customers (customer_id),
    total_amount numeric(10, 2)
);

create or replace procedure luyentap8.add_order_and_update_customer(
    p_customer_id int,
    p_amount numeric(10, 2)
)
    language plpgsql
as
$$
declare
    p_exist       boolean;
    p_total_spent numeric(10, 2);
begin
    select true into p_exist from luyentap8.Customers where customer_id = p_customer_id;
    if not p_exist then
        raise exception 'Customer not found with ID: %', p_customer_id;
    end if;
    insert into luyentap8.Orders (customer_id, total_amount) values (p_customer_id, p_amount);
    select coalesce(sum(total_amount),0) into p_total_spent from luyentap8.Orders where customer_id = p_customer_id;
    update luyentap8.Customers
    set total_spent = p_total_spent
    where customer_id = p_customer_id;
end;
$$;

call luyentap8.add_order_and_update_customer(4,10000);

