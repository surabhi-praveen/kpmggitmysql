create database sql_concepst;
use sql_concepst;


show databases;
create table dept_tab(
deptno varchar(5), 
dname varchar(100),
mgr_id varchar(10), 
location_id varchar(10), 
constraint pk_dept_tab primary key(deptno));


create table emp_table(
empno varchar(5), 
ename varchar(50) not null, 
job varchar(50),
manager varchar(50), 
birthdate date, 
salary varchar(50), 
comission varchar(50), deptno varchar(50), 
constraint pl_emp_tab primary key (empno),
constraint fk_emp_tab foreign key (deptno) references dept_tab(deptno));

create table country_tab(
country_id varchar(10),
country_name varchar(10),
constraint pl_country_tab primary key(country_id));

create table states_tab(
state_id varchar(10), 
state_name varchar(10),
country_id varchar(10),
constraint pf_states_tab primary key (state_id),
constraint fk_states_tab foreign key (country_id) references country_tab(country_id));

show tables;


insert into dept_tab values(20, 'purchasing', 114, 1700);
insert into dept_tab values(40, 'Human Resources', 203, 2400);
insert into dept_tab values(70, 'Public Relations', 204, 2700);
insert into dept_tab values(80, 'Sales', 100, 1700);
insert into dept_tab values(90, 'Excecutives', 108, 1700);
insert into dept_tab values(100, 'Finance', 200, 1700);
insert into dept_tab values(110, 'Accounting', 205, 1700);

insert into dept_tab values(120, 'Tresuary', null, 1700);
insert into dept_tab values(130, 'Corporate tax', null, 1700);
insert into dept_tab values(140, 'Control and edit', null, 1700);
insert into dept_tab values(150, 'Shareholder Services', 114, 1700);


select * from dept_tab;
select count(*) from dept_tab;

INSERT INTO emp_table VALUES ('E001', 'John Doe', 'Manager', 'Jane Smith', '1980-05-15', '75000', '5000', '20');
INSERT INTO emp_table VALUES ('E002', 'Alice Johnson', 'Developer', 'John Doe', '1990-10-25', '60000', '3000', '40');
INSERT INTO emp_table VALUES ('E003', 'Bob Brown', 'Analyst', 'Alice Johnson', '1985-03-10', '55000', '2000', '70');
INSERT INTO emp_table VALUES ('E004', 'Cathy White', 'Support', 'Bob Brown', '1992-07-30', '45000', '1500', '80');
INSERT INTO emp_table VALUES ('E005', 'David Green', 'HR', 'John Doe', '1988-11-22', '50000', '2500', '100');

select * from emp_table;

insert into country_tab values(1, 'USA');
insert into country_tab values(2, 'India');
insert into country_tab values(3, 'USA');

select * from country_tab;

insert into states_tab values(1, 'california', 1);
insert into states_tab values(2, 'Texas', 2);
insert into states_tab values(3, 'Karnataka', 3);

select * from states_tab;

select empno, 10*(salary+100) as 'Updated salary' from emp_table;
select concat(ename, 'belongs to ', deptno, ' department number') as 'employee department data'
from emp_table;
select count(distinct deptno) from emp_table;

select empno, ename, salary from emp_table where salary > 4200;
select empno, ename, salary from emp_table where ename = 'John Doe';
select empno, ename, salary from emp_table where ename = 'John Doe' and salary > 4200;
select empno, ename, salary from emp_table where ename <> 'John Doe';

select empno, ename, salary from emp_table where salary between 2000 and 4500;
select empno, ename, salary from emp_table where deptno in (30,50);
select empno, ename, salary from emp_table where deptno not in (30,50);


select empno, ename, salary from emp_table where ename in ('John Doe', 'David Green');
select empno, ename, salary from emp_table where ename not in ('John Doe', 'David Green');

select empno, ename, salary from emp_table where ename like '%i%';
select * from dept_tab where mgr_id is null;
select * from dept_tab;




select empno, ename, salary from emp_table order by salary desc;
select empno, ename, salary from emp_table order by ename desc;
select empno, ename, salary from emp_table order by hiredate desc;

select concat('Hello', ' Everyone!') as 'Message' from dual;
select substr('Hello Everyone!',7,5) as 'Substring Message' from dual;
select length('Hello Everyone!') as 'Total length' from dual;

create table states_tab2(
state_id varchar(10),
state_name varchar(50),
country_id varchar(5),
constraint pk_states_tab2 primary key(state_id),
constraint fk_states_tab2 foreign key(country_id) references country_tab(country_id));

SET SQL_SAFE_UPDATES = 0;


insert into states_tab2 select * from states_tab;
select * from states_tab2;
update emp_table set salary=6000 where empno=7000;
select * from emp_table;


create table emp_tab2(
empno varchar(5),
ename varchar(50) not null,
job varchar(50),
manager varchar(10),
hiredate date,
salary varchar(20),
commission varchar(10),
deptno varchar(5),
constraint pk_emp_tab2 primary key(empno),
constraint fk_emp_tab2 foreign key(deptno) references dept_tab(deptno));

insert into emp_tab2 select * from emp_table;

update emp_tab2 set manager=(select manager from emp_table where empno=7003),
salary=(select salary from emp_table where empno=7004)where empno=7005;

update emp_table set deptno=100 where deptno=30;


delete from states_tab where state_id in(3,4);
delete from country_tab where country_id=1;
alter table states_tab2 drop column state_name;

rename table states_tab2 to states_tab3;
truncate table states_tab3;
drop table states_tab3;

alter table states_tab modify column state_name varchar(20) not null;

select lpad(5000,8,'*') from dual;
select lpad(10000,8,'*') from dual;
select rpad(10000,8,'*') from dual;

select ename,job,salary,
case job when 'manager' then 1.20*salary
when 'analyst' then 1.15*salary
when ' clerk' then 1.10*salary
else salary
end "revised salary"
from emp_table;

select sum(salary) from emp_table;

select avg(salary)from emp_table;

select min(salary),max(salary) from emp_table where deptno=30;

select count(*) from emp_table;

select manager,max(salary),min(salary) from emp_table
group by manager
order by max(salary) desc;

select deptno,max(salary) from emp_table group by deptno having max(salary)>=4000;

select * from country_tab c inner join states_tab s on c.country_id=s.country_id;

select * from country_tab c left join states_tab s on c.country_id=s.country_id;
select * from country_tab c right join states_tab s on c.country_id=s.country_id;
select * from country_tab c join states_tab s on c.country_id=s.country_id;


create database libraryDB;
use libraryDB;

create table books(
bookID int primary key auto_increment,
title varchar(255) not null,
author varchar(255),
publicationyear int,
genre varchar(50),
availablecopies int);

insert into books values (null,'abc','xyz',2003,'rom-com',5);
insert into books values(null,'def','uvw',2005,'thriller',4);
select * from books;

create user 'root1'@'localhost' identified by 'password';
grant select, update, delete, insert on libraryDB.books to 'root1'@'localhost';

select * from information_schema.user_priveleges;

revoke delete on libraryDB.books from 'root1'@'localhost';
show grants for 'root1'@'localhost';

create table customers(
customer_id int not null auto_increment,
name varchar(255) not null,
email varchar(255) not null,
primary key (customer_id));

start transaction;

update customers set name="ABC XYZ"
where customer_id=1;
commit;

select * from customers;

set autocommit=0;
update customers set name="ABC XYZ"
where customer_id=1;
rollback;

create table orders(
order_id int not null auto_increment,
customer_id int null,
quantity int not null,
primary key(order_id),
foreign key(customer_id) references customers(customer_id));

create view customer_orders as
select distinct order_id,quantity from
orders where customer_id=1;


create table strangerthings(
id int primary key,
character_name varchar(255),
last_seen date,
next_appearance date,
location varchar(255));

insert into strangerthings values (1,'abc','2024-12-12','2025-05-06','bangalore');
insert into strangerthings values (2,'xyz','2024-10-4','2025-01-01','hyderabad');

select character_name, datediff(next_appearance, last_seen) as days_until_next_appearance from strangerthings;
select character_name, dayofweek(next_appearance) as day_of_week from strangerthings;
select character_name, dayname(next_appearance) as name_of_day from strangerthings;
select character_name, dayofmonth(next_appearance) as month_of_day from strangerthings;
select character_name, dayofyear(next_appearance),
if(dayofyear(next_appearance)='1','Happy New Year!','Just Another Day') as message from strangerthings;

select character_name, adddate(next_appearance, interval 1 day) as next_appearance_tomorrow from strangerthings;

create table employees(
id varchar(36) primary key,
name varchar(255),
email varchar(255),
password varchar(255),
salary decimal(10,2),
job_experience int);

DELIMITER //
create trigger adjust_salary_before_insert
before insert on employees
for each row 
begin
     if new.job_experience>5 then
          set new.salary=new.salary*1.20;
	 else
		set new.salary= new.salary*1.10;
end if;
end;
delimeter;

insert into employees values('a1','mickey','mickey@clubhouse','minnie',283747.10,2);
insert into employees values('a2','bheem','chotta@dholakpur','chutki',5000.234,10);

select * from employees;

        








             







