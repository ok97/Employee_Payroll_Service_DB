-- UC10:- Draw the ER Diagram for Payroll Service DB.
---       -Identifies the Entities – Entities can be Identified using Normalization Technique.
--        - Check each attribute and see if they are Composite or MultiValue.


--UC11:- Implement the ER Diagram into Payroll Service DB.
--       - Create the corresponding tables as identified in the ER Diagram along with attributes.
--       - For Many to Many relationship, create new Table called Employee Department having Employee Id and Department ID and redo the UC 7.

--- UC11.1:- Create EmployeeDetails Table

create table EmployeeDetails (Emp_id int not null Primary Key identity(1,1),
Emp_Name varchar(50) not null,
Gender char(1) not null,
Phone_Number varchar(12),
Payroll_id int not null Foreign key References PayrollDetails(Payroll_id),
Start_Date date not null default ' ');

select * from EmployeeDetails; -- Display Table


 DBCC CHECKIDENT (EmployeeDetails, RESEED, 0)  -- Reset the value of identity
 select * from EmployeeDetails; -- Display Table

 --- UC11.2:- insert values EmployeeDetails Table

insert into EmployeeDetails(Emp_Name,Gender,Phone_Number,Payroll_id) values
							('Omprakash','M','8788616249','2');
							

select * from EmployeeDetails; -- Display Table

delete EmployeeDetails where Emp_id=4;  --Delete Row
select * from EmployeeDetails; -- Display Table

delete EmployeeDetails where Emp_id=5;  --Delete Row
select * from EmployeeDetails; -- Display Table

sp_help EmployeeDetails;

--- UC11.3:- Create table PayrollDetails 

create table PayrollDetails(Payroll_id int not null Primary Key,
BasePay int not null,
Deduction int not null,
TaxtablePay as (BasePay-Deduction) persisted,
NetPay as (BasePay-Deduction-0.05*( BasePay-Deduction)) persisted,
IncomeTax as 0.05*(BasePay-Deduction) persisted);

select * from PayrollDetails

--- UC11.4:- Insert Values PayrollDetails Table

insert into PayrollDetails values (1,50000,4000),(2,20000,800),(3,45411,5889),(4,12554,47777);
select * from PayrollDetails



--- UC11.5:- Create Table Department   relation M-M

create table Department(Dept_id int not null identity(1,1) primary key,DeptName varchar(50) not null unique);
select * from Department;  --display dtable

--- UC11.6:- Insert Values Department Table

insert into Department values('Computer');
select * from Department;

insert into Department values('IT');
select * from Department;


insert into Department values('Mech');
select * from Department;


--- UC11.7:- Create Table DeptEmployee   relation M-M

create table DeptEmployee(Emp_id int not null Foreign key references EmployeeDetails(Emp_id),Dept_id int not null Foreign key references Department(Dept_id) );
select * from DeptEmployee;

--- UC11.8:- Insert Values DeptEmployee Table
insert into DeptEmployee values(1,3);
select * from DeptEmployee;