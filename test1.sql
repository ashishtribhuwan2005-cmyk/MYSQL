-- Create Database
create database capgemini; 
-- Use Database
use capgemini;

-- Create Employee Table
create table employee (
    id int primary key,
    name varchar(50),
    profile varchar(50),
    email varchar(100),
    salary int,
    age int,
    experience int
);

-- Insert Records
insert into employee (id, name, profile, email, salary, age, experience) values
(1, 'rani',  'dev',  'rani@gmail.com',   11000, 43, 27),
(2, 'raj',   'test', 'raj@gmail.com',    21000, 33, 17),
(3, 'radha', 'test', 'radha@gmail.com',  26000, 38, 21),
(4, 'raj',   'dev',  'raj12@gmail.com',  51000, 32, 12),
(5, 'john',  'dev',  'john@gmail.com',   51000, 39, 27);



-- 1. salary > 20k
select name from employee where salary > 20000;

-- 2. salary = 51k
select * from employee where salary = 51000;

-- 3. age > 35
select name,experience from employee where age > 35;

-- 4. profile = dev
select * from employee where profile='dev';

-- 5. profile = test
select name from employee where profile='test';

-- 6. salary >= 25k
select * from employee where salary >= 25000;

-- 7. salary != 51k
select name,email from employee where salary <> 51000;

-- 8. add 10k salary
update employee set salary=salary+10000 where experience < 20;

-- 9. exp = 21 delete
delete from employee where experience = 21;

-- 10. john -21k salary
update employee set salary=salary-21000 where name='john';