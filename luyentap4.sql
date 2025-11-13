create table luyentap4.Sales(
    sale_id serial primary key ,
    customer_id int,
    product_id int,
    sale_date date default now(),
    amount numeric(10,2)
);

insert into luyentap4.Sales (customer_id, product_id, sale_date, amount)
values (1,1,'2025-11-11', 10000),
       (2,1,'2025-10-10',20000),
       (1,3,'2025-09-09',15000),
       (3,2,'2024-07-07',25000);

create view luyentap4.vw_sale_amount as
select s.customer_id, sum(s.amount) as total_amount
from luyentap4.Sales s
where s.amount > 1000
group by s.customer_id;

