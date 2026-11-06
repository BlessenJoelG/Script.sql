use sqlprac;
create table employee(employeeID int auto_increment primary key,name varchar(20),Department varchar(20) , salary int(50));
alter table employee rename column name to name_info;
insert into employee(name_info,department,salary)
values("Asha","Sales",50000),
("Ben","Sales",70000),
("Carbs","IT",60000),
("Divya","IT",60000),
("Evan","HR",45000),
("Farah","HR",55000);
select * from employee;
select employeeid, name_info from employee where salary>=(select max(salary) from employee);
select * from employee where department in (select department from employee where salary > 60000);
select * from employee where salary > any (select salary from employee where department = "HR");
select * from employee where salary > all (select salary from employee where department = "HR");