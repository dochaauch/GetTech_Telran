create database  GT37_38;
show databases;
use GT37_38;

-- Создать таблицу products
-- id первичный ключ автоинкремент
-- title строка 128
-- quantity от 0 до 10products

CREATE TABLE products(
id integer primary key auto_increment,
title varchar(128),
quantity integer check (quantity between 0 and 10)
);

insert into products (title, quantity) values ('Apple', 3), ('Orange', 2), ('Banana', 10), ('Pineapple', 7), ('Kiwi', 4);

select * from products;

alter table products
add price integer default 0;

alter table products
	modify column price numeric(3,2);
    
alter table products
	change price item_price integer;
    
alter table products
	drop column item_price;

alter table products
	add quality numeric(2,2);

alter table products
modify column quality integer default 0;

alter table products
modify column quality integer check (quality between 0 and 1);

alter table products
drop check quality;

set sql_safe_updates = 0;

delete from products
where quantity = 10;

delete from products;

update products
set quantity=10
where title="Orange";

-- Создать таблицу students с полями
-- name (не null)
-- lastname (не null)
-- avg_mark (от 0 до 5)
-- gender varchar(128) (или “M” или “F”)

create table students (
name varchar(255) not null,
lastname varchar(255) not null,
avg_mark int check(avg_mark between 0 and 5),
gender char(1) check (gender in("M", "F"))
);

alter table students
	add id integer primary key auto_increment;
    
alter table students
modify column gender char(1);

alter table students
modify column avg_mark numeric(2,1);
 
 alter table students
 change name firstname varchar(255);
 
 insert into students (firstname, lastname, avg_mark, gender)
 values
 ("Олег", "Петров", 4.3, "M"), 
 ("Семен", "Степанов", 3.1, "M"),
 ("Ольга", "Семенова", 4.7, "F"),
 ("Игорь", "Романов", 3.1, "M"),
 ("Ирина", "Иванова", 2.2, "F")
 ;
 
-- - найти учеников, у которых оценка больше 4
select * from students where avg_mark >4;
-- - найти учеников, у которых оценка не входит в диапазон от 3 до 4
select * from students where avg_mark not between 3 and 4;
-- - найти учеников, у которых имя начинается на И
select * from students where firstname like "И%";
-- - найти учеников, у которых оценка 2.2 или 3.1 или 4.7
select * from students where avg_mark in (2.2, 3.1, 4.7);

select *from students;
alter table students modify column avg_mark numeric(2,1) check (avg_mark between 0 and 10);
update students set avg_mark = avg_mark*0.5;

update students set lastname="Сидоров" where lastname="Петров";

-- Создать таблицу employees;
--  employee_id целое число первичный ключ автоинкремент старт = 100,
--  fname строка не null,
--  last_name строка не null,
--  email строка не null,
--  phone строка не null
create table employees(
	employee_id int primary key auto_increment,
    fname varchar(128) not null,
    last_name varchar(128) not null,
    email varchar(128) not null,
    phone varchar(128) not null
);
alter table employees add salary numeric(9,2);

alter table employees modify column salary integer;
alter table employees 
change  fname first_name varchar(128);
alter table employees 
 drop column phone;
alter table employees
	add department varchar(128) not null;
insert into employees(first_name, last_name, email, salary, department) values("Steven","King",	"SKING", 24000, "Sales");
insert into employees(first_name, last_name, email, salary, department) values("Neena" , "Kochhar" , "NKOCHHAR" , 17000 , "Sales");
insert into employees(first_name, last_name, email, salary, department) values("Lex" , "De Haan" , "LDEHAAN" , 17000 , "Sales");
insert into employees(first_name, last_name, email, salary, department) values("Alexander" , "Hunold" , "AHUNOLD" , 9000 , "Finance");
insert into employees(first_name, last_name, email, salary, department) values("Bruce" , "Ernst" , "BERNST" , 6000 , "Finance");
insert into employees(first_name, last_name, email, salary, department) values("Valli" , "Pataballa" , "VPATABAL" , 4800 , "Finance");
insert into employees(first_name, last_name, email, salary, department) values("Diana" , "Lorentz" , "DIANALO" , 8800 , "Finance");
insert into employees(first_name, last_name, email, salary, department) values("Nancy" , "Greenberg" , "NGREENBE" , 12008 , "Shipping");
insert into employees(first_name, last_name, email, salary, department) values("Daniel" , "Faviet" , "DFAVIET" , 9000 , "Shipping");
insert into employees(first_name, last_name, email, salary, department) values("Jose Manuel" , "Urman" , "JMURMAN" , 7800 , "Shipping");
insert into employees(first_name, last_name, email, salary, department) values("Luis" , "Popp" , "LPOPP" , 6900 , "Shipping");
insert into employees(first_name, last_name, email, salary, department) values("Den" , "Raphaely" , "DRAPHEAL" , 11000 , "Marketing");
insert into employees(first_name, last_name, email, salary, department) values("Alexander" , "Khoo" , "AKHOO" , 3100 , "Marketing");
insert into employees(first_name, last_name, email, salary, department) values("Shelli" , "Baida" , "SBAIDA" , 2900 , "Marketing");
insert into employees(first_name, last_name, email, salary, department) values("Sigal" , "Tobias" , "STOBIAS" , 2800 , "Marketing");
insert into employees(first_name, last_name, email, salary, department) values("Matthew" , "Weiss" , "MWEISS" , 8000 , "Human Resources");
insert into employees(first_name, last_name, email, salary, department) values("Adam" , "Fripp" , "AFRIPP" , 8200 , "Human Resources");
insert into employees(first_name, last_name, email, salary, department) values("Payam" , "Kaufling" , "PKAUFLIN" , 7900 , "Human Resources");
insert into employees(first_name, last_name, email, salary, department) values("Shanta" , "Vollman" , "SVOLLMAN" , 6500 , "Human Resources");
insert into employees(first_name, last_name, email, salary, department) values("Kevin" , "Mourgos" , "KMOURGOS" , 5800 , "Human Resources");
insert into employees(first_name, last_name, email, salary, department) values("Julia" , "Nayer" , "JNAYER" , 3200 , "Human Resources");
insert into employees(first_name, last_name, email, salary, department) values("Adam" , "Markle" , "SMARKLE" , 2200 , "Human Resources");
insert into employees(first_name, last_name, email, salary, department) values("Laura" , "Bissot" , "LBISSOT" , 3300 , "Human Resources");
insert into employees(first_name, last_name, email, salary, department) values("Mozhe" , "Atkinson" , "MATKINSO" , 2800 , "Human Resources");
insert into employees(first_name, last_name, email, salary, department) values("Joshua" , "Patel" , "JPATEL" , 2500 , "Human Resources");
insert into employees(first_name, last_name, email, salary, department) values("Trenna" , "Rajs" , "TRAJS" , 3500 , "Human Resources");
insert into employees(first_name, last_name, email, salary, department) values("John" , "Russell" , "JRUSSEL" , 14000 , "IT");
insert into employees(first_name, last_name, email, salary, department) values("Karen" , "Partners" , "KPARTNER" , 13500 , "IT");
insert into employees(first_name, last_name, email, salary, department) values("Alberto" , "Errazuriz" , "AERRAZUR" , 12000 , "IT");
insert into employees(first_name, last_name, email, salary, department) values("Gerald" , "Cambrault" , "GCAMBRAU" , 11000 , "IT");
insert into employees(first_name, last_name, email, salary, department) values("Eleni" , "Zlotkey" , "EZLOTKEY" , 10500 , "IT");
insert into employees(first_name, last_name, email, salary, department) values("Adam" , "Vargas" , "PVARGAS" , 2500 , "Human Resources");
insert into employees(first_name, last_name, email, salary, department) values("Laura" , "Errazuriz" , "AERRAZUR" , 12000 , "IT");

select * from employees;