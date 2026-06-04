create database capgemini;
drop database capgemini;
use capgemini;


create table employee (
	id int,
    name varchar(250),
    profile varchar(100),
    email varchar(250),
    salary int,
    age int,
    experience int
    );
    
drop table employee;

INSERT INTO employee (id, name, profile, email, salary, age, experience)
VALUES
(1, 'rani', 'dev', 'rani@gmail.com', 11000, 43, 27),
(2, 'raj', 'test', 'raj@gmail.com', 21000, 33, 17),
(3, 'radha', 'test', 'radha@gmail.com', 26000, '38', 21),
(4, 'raj', 'dev', 'raj12@gmail.com', 5100, 32, 12),
(5, 'john', 'dev', 'john@gmail.com', 5100, 39, 27);

-- 1st As a user, I want to add an column branch_location so I can
-- efficiently search the branch wise record.

ALTER TABLE employee
ADD branch_location VARCHAR(100);

-- 2nd As a user, I want to check the total salary expenses on employees.
select sum(salary) Total_Salary from employee; 

-- 3rd As a user, I want to see the max salary of employee from test profile
select max(salary) from employee where profile = "test";

-- 4th As a user I want to get the average experience level of employees
select avg(experience) Average_experience from employee;

-- 5th  As a user I want to see the name of highest paid employee.
SELECT name FROM employee WHERE salary = (SELECT MAX(salary) FROM employee);

-- 6th As a user, I want to see the name and experience of lowest paid employee
SELECT name , experince FROM employee
WHERE salary = (SELECT MIN(salary) FROM employee);

-- 7th As a user I want check how many employees are working in company.
select count(*) Total_Count  from employee;

-- 8th As a user I want to see those employee names who are from test profile and having salary more than 25K.
select name from employee where profile = "test" and salary > 25000;


-- 9th As a user, I want to shift Radha on support profile.
update employee set profile = "support" where name = "radha";


-- 10th As a user, I want to get the second highest salary of employee.
select max(salary) as second_highest_salary from employee where salary < (select max(salary) from employee);


-- 11th As a user I want to get the second lowest salary of employee.
 select min(salary) as second_lowest_salary from employee where salary > (select min(salary) from employee);
 
 
-- 12th As a user, I want to calculate the average salary of employees those are belongs to dev profile.
 select avg(salary) Average_sal_from_dev from employee where profile = "dev";
 
 
 -- 13th  As a user, I want to see the employee’s name and salary who is having lowest experience. 
 Select name, salary from employee where experience = (Select min(experience) from employee);
 
 -- 14th As a user, I want to see the employee name who is having lowest age with max salary.
SElect name FRom employee WHere age = (Select mIn(age) fRom employee)
aNd salary = (Select mAx(salary) fRom employee WHere age = (Select mIn(age) fRom employee));


-- 15th As a user, I want to remove all the employee from company.
delete from employee;