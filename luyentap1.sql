create table luyentap1.Orders(
    order_id serial primary key ,
    customer_id int,
    order_date date,
    total_amount numeric(10,2)
);

insert into luyentap1.Orders (customer_id, order_date, total_amount)
values (1,'2025-10-17',7000),
       (2,'2024-12-09',10000),
       (3,'2025-07-17',2000);

create index idx_customer_id on luyentap1.Orders(customer_id);

explain analyse select * from luyentap1.Orders where customer_id = 2;


