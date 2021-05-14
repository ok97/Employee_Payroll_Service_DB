
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
VALUES ('Bill', '55000','2012-11-30');
select * from employee_payroll -- Show table


-- UC4:- Ability to retrieve all the employee payroll data that is added to payroll service database.
-- Use payroll_service database in MSSQL Client. 
-- Use SELECT * FROM employee_payroll to retrieve all the data from the employee_payroll table.

select * from employee_payroll -- Show table


---UC5:- Ability to retrieve salary data for a particular employee as well as all employees who have 
---joined in a particular data range from the payroll service database.
-- Use SELECT salary FROM employee_payroll WHERE name = 'Bill’ Query to View Bill’s salary.
-- Use Select query with Where condition View employees between start dates. 
-- Query: WHERE start BETWEEN CAST('2018-01-01' AS DATE) AND DATE(NOW());
-- Note: Where Condition Clause is used to retrieve the row needed from the table. 
---Note: Use of Database Functions like CAST() and NOW() in the Query.

-- UC5.1:- Use SELECT salary FROM employee_payroll WHERE name = 'Bill’ Query to View Bill’s salary.

select salary from employee_payroll
where name = 'Bill'; --where condition use

select *  from employee_payroll
where name = 'Bill'; --where condition use


-- UC5.2:- Use Select query with Where condition View employees between start dates.

select salary from employee_payroll
WHERE startdate BETWEEN CAST('2021-05-13'
AS DATE) AND GETDATE();


