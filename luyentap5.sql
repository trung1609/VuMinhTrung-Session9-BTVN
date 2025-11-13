create table luyentap5.Sales
(
    sale_id     serial primary key,
    customer_id int,
    amount      numeric(10, 2),
    sale_date   date
);

insert into luyentap5.Sales (customer_id, amount, sale_date)
values (1, 200, '2025-10-18'),
       (2, 300, '2024-12-19'),
       (3, 400, '2024-01-12');

create or replace procedure luyentap5.calculate_total_sales(
    start_date date,
    end_date date,
    out total numeric(10, 2)
)
    language plpgsql
as
$$
declare
    s_amount numeric(10, 2);
begin
    select sum(s.amount) as amount into s_amount from luyentap5.Sales s where s.sale_date between start_date and end_date;
    total := s_amount;
end;
$$;

do $$
declare total_out numeric(10,2);
begin
   call luyentap5.calculate_total_sales('2025-01-01','2025-11-11', total_out);
   raise notice 'Tong doanh thu la: %',total_out;
end;
$$


