use sqlprac;
show tables;
create table users(id int primary key,name_info varchar(50),email_id varchar(50), updated_at timestamp);
/*
syntax for triggers
delimiter //
create trigger <trigger name>
before update/delete/insert on <table name>
for each row
begin
	set new.<column_name> = constraint or datatype;
end//
delimiter;
 */
DELIMITER //
CREATE TRIGGER updated_timestamp
BEFORE UPDATE ON users
FOR EACH ROW
BEGIN
    SET NEW.updated_at = CURRENT_TIMESTAMP;
END//
DELIMITER ;
insert into users(id,name_info,email_id) values(73,"premik","blesssenjoelgorinkal73@gmail.com");
select * from users;
update users set name_info = "joel" where id = 73;