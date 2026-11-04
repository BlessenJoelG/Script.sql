show databases;
use sqlprac;
CREATE TABLE Products (
    product_id INT,
    product_name VARCHAR(50),
    category VARCHAR(30),
    price DECIMAL(8,2),
    stock INT,
    discount_percent INT,
    is_active BOOLEAN
);

INSERT INTO Products VALUES
(1, 'Notebook', 'Stationery', 50.00, 100, 10, TRUE),
(2, 'Pen Set', 'Stationery', 120.00, 20, 0, TRUE),
(3, 'Headphones', 'Electronics', 1500.00, 5, 15, TRUE),
(4, 'Old Mouse', 'Electronics', 800.00, 0, 20, FALSE),
(5, 'Water Bottle', 'Home', 300.00, 50, 5, TRUE);

select * from Products;
select product_name,price,(price-price*(discount_percent/100)) as discount from Products;
select product_name from Products where price >= 500;
select product_name,is_active from Products where Is_active = TRUE and stock > 10;
select product_name,category from Products where category = "Stationery" or category = "Home";
select product_name, is_active from Products where is_active = False;
select product_name,price from Products where price between 100 and 1000;
select product_name,category from Products where category = "Electronics" and category = "Home";
select product_name from Products where product_name like "Pen%";
select product_id,product_name from Products where product_id%2 = 0;
select product_name,price+10 as updated_price from Products;
drop table products;

CREATE TABLE Products (
    product_id INT,
    product_name VARCHAR(50),
    price DECIMAL(8,2),
    stock INT
);

alter table products add category char(30);
select * from products;
alter table products modify product_name char(100);
alter table products add created_at datetime;
alter table products rename column stock to quantity;
alter table products add constraint price check (price>=0);
alter table products drop column created_at;
describe Products;

create database libraryDB;
use libraryDB;
create table Books(
book_id int primary key, title varchar(150), author varchar(100) , published_year year, price decimal(8,2)
, available boolean);

alter table Books add column genre varchar(50);
alter table books modify price decimal(10,2);
alter table books rename column available to is_available;
alter table books add constraint price check (price>=0);
rename table books to librabryBooks;
describe librabryBooks;
show tables;
select * from librarybooks;
insert into LibrabryBooks(book_id,title,author,published_year,price,is_available) values(1,"Attack on Titan","isamaya","2013",9.66,True),(2,"Demon Slayer","Action man","2019",19.66,True);
update LibrabryBooks set genre = "Action" where title = "Attack on Titan";
update LibrabryBooks set genre = "Action" where title = "Demon Slayer";
set sql_safe_updates = 0;
rename table Librabrybooks to librarybooks;
truncate table librarybooks;
drop table librarybooks;
CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(100) NOT NULL,
    course VARCHAR(50),
    marks DECIMAL(5,2),
    attendance INT
);
insert into students(student_id,student_name,course) values(1,"Anu","SQL"),(2,"Ravi","Python"),(3,"Meera","SQL"),(4,"John","Java"),(5,"Sana","SQL");
select * from students;
insert into students(marks,attendance) values(85.0,92),(78.00,85),(91.25,96),(67.50,70),(74.00,88);
update students
set marks = case student_id 
when 1 then 85.50
when 2 then 78.0
when 3 then 91.25
when 4 then 67.50
when 5 then 74.00
end,
attendance = case student_id
when 1 then 92
when 2 then 85
when 3 then 96
when 4 then 70
when 5 then 88
end
where student_id in (1,2,3,4,5);
select * from Students;
select student_id,student_name,marks from students where marks <=80;
update students set marks = 82.50 where student_name = "Ravi";
update students set marks = marks + 5 where course = "Sql";
update students set course = "Python" where student_name = "John";
delete from students where attendance<75;
select student_name , course,marks from students order by marks desc; 
delete from students;