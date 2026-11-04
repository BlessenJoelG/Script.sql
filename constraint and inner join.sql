use sqlprac;
create table employees_portfolio(employee_id int auto_increment primary key, address varchar(50), projects varchar(20));
create table Employees
(employee_id int auto_increment primary key,
employee_name varchar(100) not null,
email varchar(100) unique not null,
department varchar(50) not null,
salary decimal(10,2) check(salary >= 15000),
age int check(age between 18 and 60),
joining_date date,
employment_satus varchar(20) default "Active",
manager_id int,
foreign key(manager_id) references employees_portfolio(employee_id));

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);

INSERT INTO Customers VALUES
(1, 'Anu', 'anu@email.com'),
(2, 'Ravi', 'ravi@email.com'),
(3, 'Meera', 'meera@email.com');

CREATE TABLE CustomerOrders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    order_amount DECIMAL(10,2) NOT NULL,
    order_date DATE NOT NULL,
    customer_id INT NOT NULL,

    FOREIGN KEY (customer_id)
        REFERENCES Customers(customer_id)
);

insert into CustomerOrders(product_name,order_amount,order_date,customer_id)
values("notebook",150.00, "2026-11-04", 1),("headphones",2500.00, "2026-11-04", 2),("mouse",900.00, "2026-11-05", 2),
("diary",250.00, "2026-11-05", 3);
select * from customerorders;
select * from customers;
insert into CustomerOrders(product_name,order_amount,order_date,customer_id)
values("PC",750.00, "2026-02-04", 99);
select customerorders.customer_id,customerorders.product_name,customers.customer_name,customers.email from customerorders join customers on customerorders.customer_id = customers.customer_id;