use sqlprac;
CREATE TABLE Sales (
    sale_id INT PRIMARY KEY,
    salesperson VARCHAR(50),
    product VARCHAR(50),
    category VARCHAR(50),
    city VARCHAR(50),
    quantity INT,
    sale_amount DECIMAL(10,2)
);
INSERT INTO Sales VALUES
(1, 'Anu', 'Laptop', 'Electronics', 'Chennai', 1, 55000.00),
(2, 'Ravi', 'Mouse', 'Electronics', 'Mumbai', 3, 1500.00),
(3, 'Meera', 'Notebook', 'Stationery', 'Chennai', 10, 800.00),
(4, 'John', 'Keyboard', 'Electronics', 'Delhi', 2, 3000.00),
(5, 'Sana', 'Pen Set', 'Stationery', 'Mumbai', 5, 750.00),
(6, 'Anu', 'Headphones', 'Electronics', 'Chennai', 2, 4000.00),
(7, 'Ravi', 'Diary', 'Stationery', 'Mumbai', 4, 1200.00),
(8, 'Meera', 'Monitor', 'Electronics', 'Delhi', 1, 18000.00);
select * from Sales;
select sum(sale_amount) as sales_amount from sales;
select count(*) as total_sales from sales;
select max(sale_amount) as highest_amount , min(sale_amount) as lowest_amount from sales;
select avg(sale_amount) as average_sale_amount from sales;
select category, sum(sale_amount) as total_sales_amount from sales group by category;
select product,sum(quantity) as sold_quantity from sales group by product;
select city,sum(sale_amount) as sales_made from sales group by city;
select salesperson,sum(sale_amount) as total_sales_amount from sales group by salesperson;
select category,sum(sale_amount) as total_sales from sales group by category having total_sales>10000;
select salesperson, count(sale_id) as no_of_sales from sales group by salesperson having no_of_sales>1;
select category,sum(sale_amount) as total_amount from sales where category = "Electronics";
select category,sum(quantity) as quantity_sold,sum(sale_amount) as total_sale_amount, avg(sale_amount) as avg_sale_amount, max(sale_amount) as highest_sale_amount , min(sale_amount) as lowest_sale_amount from sales group by category;
select city, (sum(sale_amount)) as highest_sale_amount from sales group by city order by city limit 1;