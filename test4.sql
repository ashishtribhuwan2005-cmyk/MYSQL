create database companydata;
use companydata;

create table departments (
    id int primary key,
    name varchar(50)
);


create table locations (
    id int primary key,
    city varchar(50)
);


create table employees (
    id int primary key,
    name varchar(50),
    salary int,
    department_id int,
    location_id int,
    hire_date date,
    foreign key (department_id) references departments(id),
    foreign key (location_id) references locations(id)
);


insert into departments 
values(1,'Marketing'),
(2,'Development'),
(3,'Support');


insert into locations 
values(1,'Pune'),
(2,'Mumbai');


insert into employees 
values(1,'Alice',25000,1,1,'2022-01-15'),
(2,'Bob',22000,1,2,'2022-02-20'),
(3,'Charlie',28000,2,1,'2022-03-10'),
(4,'David',20000,2,2,'2022-04-05'),
(5,'Eve',30000,1,1,'2023-01-07');


-- 1. who are the employees in the marketing department and what are their salaries?
select e.name,e.salary
from employees e
join departments d on e.department_id=d.id
where d.name='Marketing';

-- 2. who are the employees with salaries above the average salary of the company, and which department are they in?
select e.name,d.name,e.salary
from employees e
join departments d on e.department_id=d.id
where e.salary>(select avg(salary) from employees);

-- 3. who are the employees with the lowest salary in the test department?
select e.name,e.salary
from employees e
join departments d on e.department_id=d.id
where d.name='Test'
and e.salary=(
select min(e.salary)
from employees e
join departments d on e.department_id=d.id
where d.name='Test'
);

-- 4. what is the total salary expenditure of the company?
select sum(salary) as total_salary
from employees;

-- 5. what is the average salary of employees in the development (dev) department?
select avg(e.salary) as average_salary
from employees e
join departments d on e.department_id=d.id
where d.name='Development';

-- 6. what is the total salary expenditure in the development and support departments?
select sum(e.salary) as total_salary
from employees e
join departments d on e.department_id=d.id
where d.name in('Development','Support');

-- 7. who are the employees with a salary greater than the average salary of the development department?
select e.name,e.salary
from employees e
where e.salary>(
select avg(e.salary)
from employees e
join departments d on e.department_id=d.id
where d.name='Development'
);

-- 8. what is the total salary expenditure in pune location?
select sum(e.salary) as total_salary
from employees e
join locations l on e.location_id=l.id
where l.city='Pune';

-- 9. who are the employees hired in the year 2023 and what department are they in?
select e.name,d.name
from employees e
join departments d on e.department_id=d.id
where year(e.hire_date)=2023;

-- 10. how many employees are there in pune location?
select count(*) as employee_count
from employees e
join locations l on e.location_id=l.id
where l.city='Pune';