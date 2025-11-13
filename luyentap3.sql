create table luyentap3.Products(
    product_id serial primary key ,
    category_id int,
    price numeric(10,2),
    stock_quantity int
);

insert into luyentap3.Products (category_id, price, stock_quantity)
values (1,1000,2),
       (2,2000,4),
       (3,1500,5);


create index idx_category_id on luyentap3.Products(category_id);
cluster luyentap3.Products using idx_category_id;

create index idx_price on luyentap3.Products(price);
explain analyse select *
from luyentap3.Products where category_id = 2 order by price;


