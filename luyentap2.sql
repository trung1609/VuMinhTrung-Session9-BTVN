create table luyentap2.Users(
    user_id serial primary key ,
    email varchar(200),
    username varchar(100)
);

insert into luyentap2.Users (email, username)
values ('nguyenvana@gmail.com','nguyenvana'),
       ('nguyenthib@gmail.com','nguyenthib'),
       ('levanc@gmail.com','levanc');

create index idx_email on luyentap2.Users using hash(email);

explain analyse select * from luyentap2.Users where email = 'nguyenvana@gmail.com';