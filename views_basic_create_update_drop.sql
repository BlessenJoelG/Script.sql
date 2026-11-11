use sqlprac;
create table student_details(s_id int,name varchar(50), address varchar(50));
alter table student_details modify column s_id int(10) auto_increment, add primary key(s_id);
select * from student_details;
alter table student_details rename column name to name_info;
create view std_view as
select name_info, address
from student_details;
insert into student_details(name_info,address) values("liam","new york"),("sophia","london"),("noah","toronto");
select * from std_view;
select * from student_details;
insert into student_details(name_info,address) values("emma","madrid"),("emma","paris"),("noah","rome");
create view top_3 as
select name_info,address from student_details
where s_id < 3;
select * from top_3;
CREATE TABLE Student_marks (
    name VARCHAR(50),
    marks INT
);

INSERT INTO Student_marks (name, marks)
VALUES
    ('Liam', 85),
    ('Sofia', 92),
    ('Mateo', 78),
    ('Emma', 88);
alter table student_marks rename column name to name_info;
create view consolidate as
select student_details.s_id,student_details.name_info,student_marks.marks,student_details.address
from student_details,student_marks
where student_details.name_info = student_marks.name_info;
select * from consolidate;
select table_name from information_schema.views where table_schema = "sqlprac";
drop view top_3;

set sql_safe_updates = 0;
update std_view 
set name_info = "premik"
where name_info = "liam";

insert into std_view(name_info,address) values("joel","kphb"),("blessen","nsp");
select * from std_view;
select * from student_details;

create view test as
select s_id,name_info from student_details where name_info is not null with check option;

insert into test(s_id,name_info) values(73,"prem");
select * from test;
insert into test(s_id,name_info) values(73,null);

delete from std_view where name_info = "emma";