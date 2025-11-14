create table luyentap6.Products
(
    product_id  serial primary key,
    name        varchar(50),
    price       numeric(10, 2),
    category_id int
);

insert into luyentap6.Products (name, price, category_id)
values ('Trung', 10000, 1),
       ('Hung', 20000, 2),
       ('Long', 12000, 3),
       ('Manh', 14000, 1);

create or replace procedure luyentap6.update_product_price(
    p_category_id int,
    p_increase_percent numeric(10, 2)
)
    language plpgsql
as
$$
declare
    p_new_price numeric(10, 2);
    record      record;
begin
    for record in select * from luyentap6.Products p where category_id = p_category_id
    loop
        p_new_price := record.price + (record.price * (p_increase_percent/100));
        update luyentap6.Products p
        set price = p_new_price
        where product_id = record.product_id;
    end loop;
    raise notice 'Gia sau khi cap nhat la: %', p_new_price;
end;
$$;

call luyentap6.update_product_price(2,50);





