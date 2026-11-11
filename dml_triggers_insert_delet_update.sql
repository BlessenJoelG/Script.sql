use sqlprac;
create table parttimers(name_info varchar(50),work_info varchar(50),wage int,location varchar(50));
insert into parttimers(name_info,work_info,wage,location) 
values("premik","server",1500,"ligampally")
,("prajwal","packing",1800,"BHEL")
,("Dhanush","house keeping",1200,"nampally")
,("Rohit","Order taker",1500,"kompally");
select * from parttimers;
alter table parttimers add column (check_in timestamp);
alter table parttimers rename column check_in to updated_time;
delimiter //
create trigger	report_time
before update on parttimers
for each row
begin
	set new.check_in = current_timestamp;
end //
delimiter ;
set sql_safe_updates = 0;
update parttimers set wage = 1800 where work_info = "server";

CREATE TABLE hotel_rooms (
    room_id INT PRIMARY KEY,
    room_status VARCHAR(20) NOT NULL DEFAULT 'available'
);

CREATE TABLE reservations (
    reservation_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(100) NOT NULL,
    room_id INT NOT NULL,
    check_in DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (room_id) REFERENCES hotel_rooms(room_id)
);

CREATE TABLE reservation_history (
    reservation_id INT,
    customer_name VARCHAR(100),
    room_id INT,
    check_in DATETIME,
    checked_out DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

delimiter //
create trigger booked_rooms
after insert on reservations
for each row
begin 
	update hotel_rooms set room_status = "occupied" where room_id = new.room_id;
end //
delimiter ;
insert into hotel_rooms(room_id) values(73),(74),(75),(76);
select * from hotel_rooms;
insert into reservations(customer_name,room_id) values("premik",73);
select * from reservations;
drop trigger if exists check_out;
delimiter //
create trigger check_out 
after delete on reservations
for each row
begin
	insert into reservation_history(reservation_id,customer_name,room_id,check_in) values(old.reservation_id,old.customer_name,old.room_id,old.check_in);
    
    update hotel_rooms set room_status = "available" where room_id = old.room_id;
end // 
delimiter ;

insert into reservations(customer_name,room_id) values("joel",74),("blessen",75),("prem",76);
delete from reservations where reservation_id = 1 ;
select * from reservation_history;
delete from reservations where reservation_id = 2 ;
