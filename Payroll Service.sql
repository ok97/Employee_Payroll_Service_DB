
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

---UC6:- Ability to add Gender to Employee Payroll Table and Update the Rows to reflect the correct Employee Gender.
-- Use payroll_service database in MSSQL Client 
-- Use Alter Table Command to add Field gender after the name field
-- Use Update Query to set the gender using where condition with the employee name
-- E.g. UPDATE employee_payroll set gender = 'M' where name = 'Bill' or name = 'Charlie';

--UC6.1:- Use Alter Table Command to add Field gender after the name field

alter table employee_payroll add Gender varchar(1);
select *  from employee_payroll

SELECT TOP 5 * FROM [INFORMATION_SCHEMA].[COLUMNS] WHERE TABLE_NAME='employee_payroll'; --- show table information

-- UC6.2:- Use Update Query to set the gender using where condition with the employee name.

 UPDATE employee_payroll set Gender = 'M' where name = 'Bill' or name = 'Charlie';

---UC7:- Ability to find sum, average, min, max and number of male and female employees.
-- Use payroll_service database in MSSQL Client.
-- Use Database Function SUM, AVG, MIN, MAX, COUNT to do analysis by Male or Female.
-- Note: You will need to use GROUP BY GENDER grouping to get the result
-- E.g. SELECT SUM(salary) FROM employee_payroll WHERE gender = 'F' GROUP BY gender;

UPDATE employee_payroll SET Gender = 'M' WHERE id = 3;
select * from employee_payroll
insert into employee_payroll values('Orisa','4200','2012-10-25','F');
select * from employee_payroll;

--UC7.1:- Ability to find SUM number of male and female employees.

SELECT SUM(salary) FROM employee_payroll       -- The SUM() function returns the total sum of a numeric column. 
WHERE Gender = 'M' 
GROUP BY Gender;   --The GROUP BY statement groups rows that have the same values into summary rows.

SELECT SUM(salary) FROM employee_payroll          --The SUM() function returns the total sum of a numeric column. 
WHERE Gender = 'F' 
GROUP BY Gender;   --The GROUP BY statement groups rows that have the same values into summary rows.


--UC7.2:- Ability to find AVG number of male and female employees.

SELECT AVG(salary) FROM employee_payroll      --AVG() function returns the average value of a numeric column. 
WHERE Gender = 'M' 
GROUP BY Gender;   --The GROUP BY statement groups rows that have the same values into summary rows.

SELECT AVG(salary) FROM employee_payroll         --AVG() function returns the average value of a numeric column. 
WHERE Gender = 'F' 
GROUP BY Gender;   --The GROUP BY statement groups rows that have the same values into summary rows.


--UC7.3:- Ability to find MIN number of male and female employees.

SELECT MIN(salary) FROM employee_payroll        --The MIN() function returns the smallest value of the selected column.
WHERE Gender = 'M' 
GROUP BY Gender;   --The GROUP BY statement groups rows that have the same values into summary rows.

SELECT MIN(salary) FROM employee_payroll         --The MIN() function returns the smallest value of the selected column.
WHERE Gender = 'F' 
GROUP BY Gender;   --The GROUP BY statement groups rows that have the same values into summary rows.


--UC7.4:- Ability to find MAX number of male and female employees.


SELECT MAX(salary) FROM employee_payroll        --The MAX() function returns the largest value of the selected column.
WHERE Gender = 'M' 
GROUP BY Gender;   --The GROUP BY statement groups rows that have the same values into summary rows.

SELECT MAX(salary) FROM employee_payroll           --The MAX() function returns the largest value of the selected column.
WHERE Gender = 'F' 
GROUP BY Gender;   --The GROUP BY statement groups rows that have the same values into summary rows.



--UC7.4:- Ability to find COUNT number of male and female employees.

SELECT COUNT(salary) FROM employee_payroll        --The COUNT() function returns the number of rows that matches a specified criterion.
WHERE Gender = 'M' 
GROUP BY Gender;   --The GROUP BY statement groups rows that have the same values into summary rows.

SELECT COUNT(salary) FROM employee_payroll           --The COUNT() function returns the number of rows that matches a specified criterion.
WHERE Gender = 'F' 
GROUP BY Gender;   --The GROUP BY statement groups rows that have the same values into summary rows.