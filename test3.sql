-- Use Database
use companyDB;

-- Create Employees Table
create table Employees (
    id int primary key,
    Name varchar(50),
    Salary int,
    Department varchar(50),
    Location varchar(50)
);

-- Insert Records
insert into Employees (id, Name, Salary, Department, Location)
values
(1, 'Anup', 10000, 'Dev', 'Pune'),
(2, 'Rani', 26000, 'Test', 'Nashik'),
(3, 'Jay', 18000, 'Dev', 'Nagpur'),
(4, 'Vishal', 22000, 'Support', 'Pune'),
(5, 'Shina', 35000, 'Test', 'Nagpur'),
(6, 'Rony', 11000, 'Support', 'Nagpur'),
(7, 'Pooja', 38000, 'Dev', 'Nashik');


-- 1. What are the names of all employees? 
select name from Employees;

-- 2. How many employees are there in total? 
select count(id) as Total_count from Employees;

-- 3. What departments do the employees work in? 
select distinct Department from Employees; 

-- 4. How many employees work in each department? 
select count(*) as Total_count from employees group by department;

-- 5. Who is the highest-paid employee? 
select name as Highest_paid from employees where Salary = (select max(salary) from employees);
 
-- 6. Who is the lowest-paid employee?
 select name as Highest_paid from employees where Salary = (select min(salary) from employees);
 
-- 7. How many employees earn more than RS 20000 per year? 
select count(*) from employees where salary > 20000;

-- 8. What is the average salary of all employees? 
select avg(salary) as Average_Sal from employees;

-- 9. Who are the top 5 highest-paid employees? 
select name , salary from employees order by salary limit 5;

-- 10. Who are the employees in the Marketing department? 
select name from employees where Department = 'Marketing';
 
-- 11. How many employees have a salary between RS 15000 and RS 25000?
select count(*) from employees where salary between 15000 and 25000;
 
-- 12. Who are the employees with a salary of NULL? 
select Name from Employees where Salary is null;

-- 13. Who are the employees with a first name starting with "J"? 
select name from employees where name like 'J%';

-- 14. What are the salaries of all employees sorted in descending order? 
select Salary from Employees order by Salary desc;

-- 15. What is the total salary expenditure of the company? 
select sum(salary) as Total_Salary_Expenditure from employees;

-- 16. Who are the employees with the same first names?
select Name, count(*) from Employees group by Name having count(*) > 1;

-- 17. Employees in Pune
select count(*) from Employees where Location = 'Pune';

-- 18. Average salary in Dev department
select avg(Salary) from Employees where Department = 'Dev';

-- 19. Employees earning above average salary
select Name, Salary from Employees where Salary > (select avg(Salary) from Employees);

-- 20. Lowest salary in Test department
select Name from Employees where Department='Test' and Salary = (select min(Salary) from Employees where Department='Test');

-- 21. Employees hired in 2023
select count(*) as Hired_in_23 from Employees where year(HireDate)=2023;

-- 22. Names of employees hired in 2023
select Name from Employees where year(HireDate)=2023;

-- 23. Salary expenditure in Dev and Support
select sum(Salary) from Employees where Department in ('Dev','Support');

-- 24. Salary greater than average Dev salary
select Name, Salary from Employees where Salary > (select avg(Salary) from Employees where Department='Dev');

-- 25. Total salary expenditure in Pune
select sum(Salary) from Employees where Location='Pune';