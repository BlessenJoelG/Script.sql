use sqlprac;
drop table employees;
CREATE TABLE employees (
    name VARCHAR(50),
    age INT,
    department VARCHAR(50),
    salary INT
);
INSERT INTO employees (name, age, department, salary)
VALUES
    ('Andrew', 20, 'Finance', 50000),
    ('Brian', 22, 'Finance', 50000),
    ('Charles', 28, 'Finance', 20000),
    ('Daniel', 25, 'Sales', 30000),
    ('Ethan', 22, 'Sales', 20000);
select * from employees;
# aggr window functions

select * ,avg(salary) over(partition by department) as avg_salary from employees;
select * ,sum(salary) over(partition by department) as total_salary from employees;
select * ,count(salary) over(partition by department) as total_employees from employees;
select * ,min(salary) over(partition by department) as min_salary from employees;
select * ,max(salary) over(partition by department) as max_salary from employees;

select *, rank() over(partition by department order by salary desc) as emp_rank from employees;
select *, dense_rank() over(partition by department order by salary desc) as dense_emp_rank from employees;
select *, row_number() over(partition by department order by salary desc) as emp_row_rank from employees;
select *, percent_rank() over(partition by department order by salary desc) as emp_percent_rank from employees;