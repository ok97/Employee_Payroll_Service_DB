
----- UC:- 1 Ability to create a payroll service database.
----- Using MSSQL Client use create database query to create a payroll_service database.
----- Also you can see the DB created by using show database query.
----- And go to the database created by using use payroll_service query. 

create database Payroll_Service 
use Payroll_Service

--- UC2:- Ability to create a employee payroll table in the payroll service database to manage employee payrolls
--- Use payroll_service database in MSSQL Client
--- Use Create Table employee_payroll Query to create employee payroll table with columns id, name, salary and start date as column.
--- Note Id is set to auto increment. 
--- Understand the SQL data types to be used for the table
--- Note: SQL Queries as case insensitive

create Table employee_payroll
(
id int  NOT NULL Identity(1,1) primary key,
name varchar(20)  NOT NULL,
salary float NOT NULL,
startdate Date NOT NULL);

select * from employee_payroll -- Show table


---UC3:- Ability to create employee payroll data in the payroll service database as part of CURD Operation.
-- Use payroll_service database in MSSQL Client.
---Use INSERT INTO employee_payroll Query to create employees payroll data into the employee_payroll table.


 insert into employee_payroll(name,salary,startdate)
 values('Jack','2500','2021-05-13');

insert into employee_payroll VALUES('Omprakash', 50000, '2021-05-14');

INSERT INTO employee_payroll ( name, salary,startdate)
VALUES ('Om', '5000','2008-11-11');
select * from employee_payroll -- Show table


-- UC4:- Ability to retrieve all the employee payroll data that is added to payroll service database.
-- Use payroll_service database in MSSQL Client. 
-- Use SELECT * FROM employee_payroll to retrieve all the data from the employee_payroll table.

select * from employee_payroll -- Show table