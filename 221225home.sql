show databases;
create database homeDEC22;
show databases;
use homeDEC22;

-- TASK 1
-- 1. Создать таблицу students
-- id уникальное значение, не null, автозаполнение 
-- firstname varchar not null
-- lastname varchar not null
-- class integer от 1 до 10
-- subject varchar not null
-- mark integer от 0 до 5
CREATE TABLE students(
id integer primary key auto_increment,
firstname varchar(50) not null,
lastname varchar(50) not null,
class integer check(class between 1 and 10),
subject varchar(25) not null,
mark integer check(mark between 0 and 5)
);

-- 2.  Заполнить таблицу строками (10 шт)
insert into students (firstname, lastname, class, subject, mark)
values
("Em","Layman",8,"IT",3),
("Luca","Cotherill",5,"Math",0),
("Sigismundo","Dunseith",5,"Lang",4),
("Angy","Sackett",4,"IT",0),
("Tawsha","Farnish",1,"Math",5),
("Tatiana","Wager",3,"Lang",5),
("Shelli","Espinoy",10,"IT",3),
("Benoite","Basek",3,"English",1),
("Theobald","Farlamb",2,"IT",5),
("Tamarah","Paunsford",7,"Science",0),
("Augusta","Ballentime",5,"Science",2),
("Adria","Treske",7,"IT",2),
("Rudiger","O'Duggan",6,"IT",3),
("Feliks","Quartly",9,"Math",4),
("Tony","Spencock",5,"IT",1)
 ;
 select * from students;
 
 -- 3. Удалить из таблицы студентов, у которых оценка 0
 set sql_safe_updates = 0;
 delete from students where mark =0;
 
 -- 4. Найти всех студентов, у которых оценка выше 3
 select * from students where mark > 3;
 
 -- 5. Найти всех студентов, которые учатся в первом классе и у них оценка меньше 3
 select * from students where class = 1 and mark < 3;
 
 -- 6. Удалить из таблицы этих студентов
 delete from students where class = 1 and mark <3;
 
 -- 7. Найти всех студентов, у которых длина имени больше 4 букв
 select * from students where length(firstname) > 4;
 
 -- 8. Найти всех студентов, у которых фамилия начинается с буквы "a" и имеет длину не менее 3 
-- символов.
select * from students where lastname like 'A%' and length(lastname)>= 3;

-- 9. В таблице оставить тех студентов, которые (проходят Х предмет и оценка выше 4) и тех 
-- студентов (которые учатся 7-10 классах и у них оценки ниже 3).
select * from students where subject="IT" or (class>=7 and mark <3);

-- 10. Удалить таблицу.
drop table students;

-- TASK 2
-- 1. Создать таблицу employees;
-- employeeid целое число первичный ключ автоинкремент старт = 100,
-- fname строка не null,
-- lastname строка не null,
-- email строка не null,
-- phone строка не null
create table employees(
employeeid integer primary key auto_increment,
fname varchar(50) not null,
lastname varchar(50) not null,
email varchar(100) not null,
phone varchar(25) not null
)  AUTO_INCREMENT=100;

-- 2. Ой, забыли про зарплату)) Добавить поле salary numeric(9, 2),
alter table employees add salary numeric(9,2);

-- 3. Ойййй, нет, зарплата должна быть целым числом. Изменить тип salary на integer.
alter table employees modify column salary integer; 

-- 4. Переименовать поле name на first_name
alter table employees change fname first_name varchar(50);

-- 5. Удалить поле phone
alter table employees drop column phone;

-- 6. Добавить поле department строка не null
alter table employees add department varchar(50) not null;

-- 7. Заполнить таблицу (employees.txt)
alter table employees change lastname last_name varchar(50);
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

-- 8. Найти всех ИТ работников с зарплатой выше 12000
select * from employees where  department = "IT" and salary > 12000;

-- 9. Повысить зарплату работников отдела Human Resources в 5 раз
update employees set salary = salary *5 where department = "Human Resources";

-- 10. Найти работников отдела Marketing с зарплатой ниже 2850.
select * from employees where department = "Marketing" and salary< 2850;

-- 11. У руководителя родились близнецы Лаура и Адам, в честь праздника он решил повысить 
-- зарплату работников с именами Лаура и Адам в 10 раз.
update employees set salary = salary * 10 where first_name in ("Laura", "Adam");

-- 12. Diana Lorentz вышла замуж и поменяла фамилию на King. Поменяйте у Diana Lorentz фамилию 
-- на King.
update employees set last_name = "King" where first_name = "Diana" and last_name = "Lorentz";

-- 13. Всех работников отдела sales уволили. Удалите работников sales из таблицы.
delete from employees where department = "sales";

-- 14. John Russell перевели в отдел Marketing и повысили зарплату на 5000. Измените данные для 
-- работника John Russell.
update employees set department = "Marketing", salary = 5000 where first_name = "John" and last_name = "Russell";

-- 15.После праздника руководитель протрезвел и уменьшил зарплаты работников с именами 
-- Лаура и Адам в 10 раз. 
update employees set salary = salary / 10 where first_name in ("Laura", "Adam");

-- 16. Laura Bissot поменяла свой мейл на BISSOTLAURA. Измените данные для работника Laura
-- Bissot.
update employees set email = "BISSOTLAURA" where first_name = "Laura" and last_name = "Bissot";

-- 17. Diana King развелась и поменяла фамилию обратно на Lorentz. И в честь развода руководитель 
-- повысил ее зарплату на 2000. Измените данные для работника Diana King.
update employees set last_name = "Lorentz", salary = salary + 2000 where first_name = "Diana" and last_name = "King";
