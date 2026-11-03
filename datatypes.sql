create database SqlPrac;
use SqlPrac;
Create table Contacts(contact_id char(3), name_info varchar(20) ,
 country_code varchar(8) , phone char(10) , notes longtext);
 select * from Contacts;
insert into Contacts(contact_id , name_info ,country_code, phone, notes)
values("C01", "Premik" , "IN" , "7780718796" , "Long Time No See Hah"),("C02" , "V3" , "Vietnam" , "9392059494" , "Sayonara");
select name_info,phone from Contacts;
insert into Contacts(contact_id,name_info,country_code,phone,notes)
values("C03","Joel","JPN","9441640857","Tatakae"),("C04","Blessen","HongKong","7601063514","nani!");
select * from Contacts;
set sql_safe_updates = 0;
update Contacts set name_info = "Vision" , notes = "ego fuel 
s progession" where contact_id = "C02";
delete from Contacts where name_info = "Vision" ;
select * from Contacts;
create table Students(std_name varchar(19), score char(1));
insert into Students( std_name , score) values("premik","A"),("Joel","B");
select * from Students;
show databases;
drop database d27;
drop table Students;
create table ProductSales(sale_id int(3), small_rating tinyint(1) , stock_quantity smallint(3) , monthly_views mediumint(6) , total_visits bigint , price decimal(8,2) , discount_rate float , average_score double , is_paid boolean , feature_flags bit(4));
INSERT INTO ProductSales (
    sale_id,
    small_rating,
    stock_quantity,
    monthly_views,
    total_visits,
    price,
    discount_rate,
    average_score,
    is_paid,
    feature_flags
)
VALUES (
    10,
    5,
    25,
    1500,
    9000,
    129.99,
    12.5,
    4.75689,
    TRUE,
    b'1010'
);
select * from ProductSales;
drop table EventSchedule;
create table EventSchedule(event_id int , event_name varchar(200),event_date date, start_time time, created_at datetime , last_updated timestamp ,event_year year);
ALTER TABLE EventSchedule
MODIFY last_updated TIMESTAMP
DEFAULT CURRENT_TIMESTAMP
ON UPDATE CURRENT_TIMESTAMP;
insert into EventSchedule(event_id , event_name,event_date, start_time, created_at,event_year)
values(1,"Sql Workshop","2026-11-03","12:55:00","2026-11-03 11:25:00","2026");
select * from EventSchedule
