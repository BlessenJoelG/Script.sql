show databases;
use sqlprac;
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    city VARCHAR(50),
    product VARCHAR(100),
    category VARCHAR(50),
    amount DECIMAL(10,2),
    order_date DATE,
    status_info VARCHAR(20)
);

INSERT INTO Orders VALUES
(1, 'Anu', 'Chennai', 'Notebook', 'Stationery', 150.00, '2026-10-01', 'Delivered'),
(2, 'Ravi', 'Mumbai', 'Headphones', 'Electronics', 2500.00, '2026-10-02', 'Pending'),
(3, 'Meera', 'Chennai', 'Pen Set', 'Stationery', 300.00, '2026-10-03', 'Delivered'),
(4, 'John', 'Delhi', 'Keyboard', 'Electronics', 1800.00, '2026-10-04', 'Cancelled'),
(5, 'Sana', 'Mumbai', 'Mouse', 'Electronics', 900.00, '2026-10-05', 'Delivered'),
(6, 'Anu', 'Chennai', 'Diary', 'Stationery', 250.00, '2026-10-06', 'Pending');

select order_id,product,status_info from orders where status_info = "Delivered";
select distinct city from orders;
select product,amount from orders order by amount desc limit 3;
select product,status_info from orders where category = "Electronics" and status_info = "delivered";
select product,city from orders where city = "Chennai" or city = "Mumbai";
select category, sum(amount) as total_sales from orders group by category ;
select category, sum(amount) as total_sales from orders group by category having total_sales>2000;
select category,sum(amount) as delivered_sales from orders where status_info = "delivered" group by category having delivered_sales >= 1000;
select customer_name from orders where customer_name like "a%";
select product,amount from orders where amount between 200 and 1000;
select product,status_info from orders where status_info in ("pending","cancelled");